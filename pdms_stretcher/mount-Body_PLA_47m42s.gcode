; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 41m 54s; total estimated time: 47m 42s
; total layer number: 105
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
M73 P0 R47
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
M73 P9 R43
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
M73 P9 R42
G1 X76 F15000
M73 P10 R42
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
    G29 A X55 Y100 I150 J60
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
; layer num/total_layer_count: 1/105
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
G1 X55.878 Y102.594 F30000
G1 Z.4
M73 P11 R42
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G3 X60.011 Y98.857 I4.134 J.419 E.22743
G1 X60.498 Y98.857 E.01816
G1 X199.993 Y98.857 E5.19565
G3 X204.143 Y103.011 I-.005 J4.155 E.24284
G1 X204.143 Y152.989 E1.86153
G3 X199.989 Y157.143 I-4.156 J-.002 E.24297
G1 X60.011 Y157.143 E5.21368
G3 X55.857 Y152.989 I.002 J-4.156 E.24297
G1 X55.857 Y103.011 E1.86153
G3 X55.873 Y102.654 I4.156 J.002 E.01331
G1 X55.423 Y102.549 F30000
; FEATURE: Outer wall
G1 F3000
G3 X60.005 Y98.4 I4.59 J.464 E.25228
G1 X60.498 Y98.4 E.01837
G1 X199.999 Y98.4 E5.19586
G3 X204.6 Y103.005 I-.012 J4.614 E.26915
G1 X204.6 Y152.995 E1.86194
G3 X199.995 Y157.6 I-4.614 J-.009 E.26928
G1 X60.005 Y157.6 E5.2141
G3 X55.4 Y152.995 I.009 J-4.614 E.26928
G1 X55.4 Y103.005 E1.86194
G3 X55.418 Y102.609 I4.614 J.009 E.01477
; WIPE_START
G1 F24000
G1 X55.488 Y102.103 E-.19423
G1 X55.598 Y101.665 E-.17159
G1 X55.75 Y101.24 E-.17153
G1 X55.942 Y100.835 E-.17026
G1 X56.013 Y100.716 E-.05238
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.012 J1.217 P1  F30000
G1 X203.883 Y102.229 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.500493
G1 F6300
G1 X201.053 Y99.399 E.14925
G2 X200.267 Y99.259 I-1.101 J3.926 E.02983
G1 X203.738 Y102.731 E.18306
G1 X203.749 Y103.389 E.02455
G1 X199.606 Y99.246 E.21849
G1 X198.959 Y99.246 E.02413
G1 X203.749 Y104.036 E.25262
M73 P12 R41
G1 X203.749 Y104.684 E.02413
G1 X198.312 Y99.246 E.28674
G1 X197.664 Y99.246 E.02413
G1 X203.749 Y105.331 E.32087
G1 X203.749 Y105.978 E.02413
G1 X197.017 Y99.246 E.355
G1 X196.37 Y99.246 E.02413
G1 X203.75 Y106.625 E.38912
G1 X203.75 Y107.272 E.02413
G1 X195.723 Y99.246 E.42325
G1 X195.076 Y99.246 E.02413
G1 X203.75 Y107.919 E.45737
G1 X203.75 Y108.567 E.02413
G1 X194.429 Y99.246 E.4915
G1 X193.782 Y99.246 E.02413
G1 X203.75 Y109.214 E.52563
G1 X203.75 Y109.861 E.02413
G1 X193.135 Y99.246 E.55975
G1 X192.488 Y99.246 E.02413
G1 X203.75 Y110.508 E.59388
G1 X203.75 Y111.155 E.02413
G1 X191.84 Y99.246 E.628
G1 X191.193 Y99.246 E.02413
G1 X203.75 Y111.802 E.66213
G1 X203.75 Y112.45 E.02413
G1 X190.546 Y99.246 E.69626
G1 X189.899 Y99.246 E.02413
G1 X203.75 Y113.097 E.73038
G1 X203.75 Y113.744 E.02413
G1 X189.252 Y99.246 E.76451
G1 X188.605 Y99.246 E.02413
G1 X203.75 Y114.391 E.79863
G1 X203.75 Y115.038 E.02413
G1 X187.958 Y99.246 E.83276
G1 X187.311 Y99.246 E.02413
G1 X203.751 Y115.685 E.86689
G1 X203.751 Y116.333 E.02413
G1 X186.664 Y99.246 E.90101
G1 X186.016 Y99.246 E.02413
G1 X203.751 Y116.98 E.93514
G1 X203.751 Y117.627 E.02413
G1 X185.369 Y99.246 E.96926
G1 X184.722 Y99.246 E.02413
G1 X203.751 Y118.274 E1.00339
G1 X203.751 Y118.921 E.02413
G1 X184.075 Y99.246 E1.03752
G1 X183.428 Y99.246 E.02413
G1 X203.751 Y119.569 E1.07164
G1 X203.751 Y120.216 E.02413
G1 X182.781 Y99.246 E1.10577
G1 X182.134 Y99.246 E.02413
G1 X203.751 Y120.863 E1.1399
G1 X203.751 Y121.51 E.02413
G1 X181.487 Y99.246 E1.17402
G1 X180.84 Y99.246 E.02413
G1 X203.751 Y122.157 E1.20815
G1 X203.751 Y122.804 E.02413
G1 X180.193 Y99.246 E1.24227
G1 X179.545 Y99.246 E.02413
G1 X203.751 Y123.452 E1.2764
G1 X203.751 Y124.099 E.02413
G1 X178.898 Y99.246 E1.31053
G1 X178.251 Y99.246 E.02413
G1 X203.751 Y124.746 E1.34465
G1 X203.752 Y125.393 E.02413
G1 X177.604 Y99.246 E1.37878
G1 X176.957 Y99.246 E.02413
G1 X203.752 Y126.04 E1.4129
G1 X203.752 Y126.687 E.02413
G1 X176.31 Y99.246 E1.44703
G1 X175.663 Y99.246 E.02413
G1 X203.752 Y127.335 E1.48116
G1 X203.752 Y127.982 E.02413
G1 X175.016 Y99.246 E1.51528
G1 X174.369 Y99.246 E.02413
G1 X203.752 Y128.629 E1.54941
G1 X203.752 Y129.276 E.02413
G1 X173.721 Y99.246 E1.58353
G1 X173.074 Y99.246 E.02413
G1 X203.752 Y129.923 E1.61766
G1 X203.752 Y130.57 E.02413
G1 X172.427 Y99.246 E1.65179
M73 P13 R41
G1 X171.78 Y99.246 E.02413
G1 X203.752 Y131.218 E1.68591
G1 X203.752 Y131.865 E.02413
G1 X171.133 Y99.246 E1.72004
G1 X170.486 Y99.246 E.02413
G1 X203.752 Y132.512 E1.75417
G1 X203.752 Y133.159 E.02413
G1 X169.839 Y99.246 E1.78829
G1 X169.192 Y99.246 E.02413
G1 X203.752 Y133.806 E1.82242
G1 X203.752 Y134.454 E.02413
G1 X168.545 Y99.246 E1.85654
G1 X167.898 Y99.246 E.02413
G1 X203.753 Y135.101 E1.89067
G1 X203.753 Y135.748 E.02413
G1 X167.25 Y99.246 E1.9248
G1 X166.603 Y99.246 E.02413
G1 X203.753 Y136.395 E1.95892
G1 X203.753 Y137.042 E.02413
G1 X165.956 Y99.246 E1.99305
G1 X165.309 Y99.246 E.02413
G1 X203.753 Y137.689 E2.02717
G1 X203.753 Y138.337 E.02413
G1 X164.662 Y99.246 E2.0613
G1 X164.015 Y99.246 E.02413
G1 X203.753 Y138.984 E2.09543
G1 X203.753 Y139.631 E.02413
G1 X163.368 Y99.246 E2.12955
G1 X162.721 Y99.246 E.02413
G1 X203.753 Y140.278 E2.16368
G1 X203.753 Y140.925 E.02413
G1 X162.074 Y99.246 E2.1978
G1 X161.426 Y99.246 E.02413
G1 X203.753 Y141.572 E2.23193
G1 X203.753 Y142.22 E.02413
G1 X160.779 Y99.246 E2.26606
G1 X160.132 Y99.246 E.02413
G1 X203.753 Y142.867 E2.30018
G1 X203.753 Y143.514 E.02413
G1 X159.485 Y99.246 E2.33431
G1 X158.838 Y99.246 E.02413
G1 X203.753 Y144.161 E2.36843
G1 X203.754 Y144.808 E.02413
G1 X158.191 Y99.246 E2.40256
G1 X157.544 Y99.246 E.02413
G1 X203.754 Y145.455 E2.43669
G1 X203.754 Y146.103 E.02413
G1 X156.897 Y99.246 E2.47081
G1 X156.25 Y99.246 E.02413
G1 X203.754 Y146.75 E2.50494
G1 X203.754 Y147.397 E.02413
G1 X155.602 Y99.246 E2.53907
G1 X154.955 Y99.246 E.02413
G1 X203.754 Y148.044 E2.57319
G1 X203.754 Y148.691 E.02413
G1 X154.308 Y99.246 E2.60732
G1 X153.661 Y99.246 E.02413
G1 X203.754 Y149.339 E2.64144
G1 X203.754 Y149.986 E.02413
G1 X153.014 Y99.246 E2.67557
G1 X152.367 Y99.246 E.02413
G1 X203.754 Y150.633 E2.7097
G1 X203.754 Y151.28 E.02413
G1 X151.72 Y99.246 E2.74382
G1 X151.073 Y99.246 E.02413
G1 X203.754 Y151.927 E2.77795
G1 X203.754 Y152.574 E.02413
G1 X150.426 Y99.246 E2.81207
G1 X149.779 Y99.246 E.02413
G1 X203.743 Y153.21 E2.84561
G3 X203.669 Y153.783 I-4.286 J-.266 E.02155
G1 X149.131 Y99.246 E2.87581
G1 X148.484 Y99.246 E.02413
G1 X203.523 Y154.284 E2.90222
G3 X203.32 Y154.729 I-1.905 J-.598 E.01827
G1 X147.837 Y99.246 E2.92567
G1 X147.19 Y99.246 E.02413
G1 X203.076 Y155.132 E2.94694
G3 X202.792 Y155.495 I-1.366 J-.776 E.01725
G1 X146.543 Y99.246 E2.96609
G1 X145.896 Y99.246 E.02413
G1 X202.47 Y155.82 E2.98322
G1 X202.107 Y156.104 E.01719
G1 X145.249 Y99.246 E2.99818
G1 X144.602 Y99.246 E.02413
G1 X201.697 Y156.341 E3.01067
G3 X201.242 Y156.533 I-.875 J-1.438 E.01848
G1 X143.955 Y99.246 E3.0208
G1 X143.307 Y99.246 E.02413
G1 X200.733 Y156.671 E3.02812
G3 X200.156 Y156.741 I-.523 J-1.9 E.02176
G1 X142.66 Y99.246 E3.0318
G1 X142.013 Y99.246 E.02413
G1 X199.522 Y156.754 E3.03249
M73 P14 R41
G1 X198.875 Y156.754 E.02413
G1 X141.366 Y99.246 E3.03249
G1 X140.719 Y99.246 E.02413
G1 X198.228 Y156.754 E3.03249
G1 X197.581 Y156.754 E.02413
G1 X140.072 Y99.246 E3.03249
M73 P14 R40
G1 X139.425 Y99.246 E.02413
G1 X196.934 Y156.754 E3.03249
G1 X196.287 Y156.754 E.02413
G1 X138.778 Y99.246 E3.03249
G1 X138.131 Y99.246 E.02413
G1 X195.639 Y156.754 E3.03249
G1 X194.992 Y156.754 E.02413
G1 X137.484 Y99.246 E3.03249
G1 X136.836 Y99.246 E.02413
G1 X194.345 Y156.754 E3.03249
G1 X193.698 Y156.754 E.02413
G1 X136.189 Y99.246 E3.03249
G1 X135.542 Y99.246 E.02413
G1 X193.051 Y156.754 E3.03249
G1 X192.404 Y156.754 E.02413
G1 X134.895 Y99.246 E3.03249
G1 X134.248 Y99.246 E.02413
G1 X191.757 Y156.754 E3.03249
G1 X191.11 Y156.754 E.02413
G1 X133.601 Y99.246 E3.03249
G1 X132.954 Y99.246 E.02413
G1 X190.463 Y156.754 E3.03249
G1 X189.815 Y156.754 E.02413
G1 X132.307 Y99.246 E3.03249
G1 X131.66 Y99.246 E.02413
G1 X189.168 Y156.754 E3.03249
G1 X188.521 Y156.754 E.02413
G1 X131.012 Y99.246 E3.03249
G1 X130.365 Y99.246 E.02413
G1 X187.874 Y156.754 E3.03249
G1 X187.227 Y156.754 E.02413
G1 X129.718 Y99.246 E3.03249
G1 X129.071 Y99.246 E.02413
G1 X186.58 Y156.754 E3.03249
G1 X185.933 Y156.754 E.02413
G1 X128.424 Y99.246 E3.03249
G1 X127.777 Y99.246 E.02413
G1 X185.286 Y156.754 E3.03249
G1 X184.639 Y156.754 E.02413
G1 X127.13 Y99.246 E3.03249
G1 X126.483 Y99.246 E.02413
G1 X183.991 Y156.754 E3.03249
G1 X183.344 Y156.754 E.02413
G1 X125.836 Y99.246 E3.03249
G1 X125.188 Y99.246 E.02413
G1 X182.697 Y156.754 E3.03249
G1 X182.05 Y156.754 E.02413
G1 X124.541 Y99.246 E3.03249
G1 X123.894 Y99.246 E.02413
G1 X181.403 Y156.754 E3.03249
G1 X180.756 Y156.754 E.02413
G1 X123.247 Y99.246 E3.03249
G1 X122.6 Y99.246 E.02413
G1 X180.109 Y156.754 E3.03249
G1 X179.462 Y156.754 E.02413
G1 X121.953 Y99.246 E3.03249
M73 P15 R40
G1 X121.306 Y99.246 E.02413
G1 X178.815 Y156.754 E3.03249
G1 X178.168 Y156.754 E.02413
G1 X120.659 Y99.246 E3.03249
G1 X120.012 Y99.246 E.02413
G1 X177.52 Y156.754 E3.03249
G1 X176.873 Y156.754 E.02413
G1 X119.365 Y99.246 E3.03249
G1 X118.717 Y99.246 E.02413
G1 X176.226 Y156.754 E3.03249
G1 X175.579 Y156.754 E.02413
G1 X118.07 Y99.246 E3.03249
G1 X117.423 Y99.246 E.02413
G1 X174.932 Y156.754 E3.03249
G1 X174.285 Y156.754 E.02413
G1 X116.776 Y99.246 E3.03249
G1 X116.129 Y99.246 E.02413
G1 X173.638 Y156.754 E3.03249
G1 X172.991 Y156.754 E.02413
G1 X115.482 Y99.246 E3.03249
G1 X114.835 Y99.246 E.02413
G1 X172.344 Y156.754 E3.03249
G1 X171.696 Y156.754 E.02413
G1 X114.188 Y99.246 E3.03249
G1 X113.541 Y99.246 E.02413
G1 X171.049 Y156.754 E3.03249
G1 X170.402 Y156.754 E.02413
G1 X112.893 Y99.246 E3.03249
G1 X112.246 Y99.246 E.02413
G1 X169.755 Y156.754 E3.03249
G1 X169.108 Y156.754 E.02413
G1 X111.599 Y99.246 E3.03249
G1 X110.952 Y99.246 E.02413
G1 X168.461 Y156.754 E3.03249
G1 X167.814 Y156.754 E.02413
G1 X110.305 Y99.246 E3.03249
G1 X109.658 Y99.246 E.02413
G1 X167.167 Y156.754 E3.03249
G1 X166.52 Y156.754 E.02413
G1 X109.011 Y99.246 E3.03249
G1 X108.364 Y99.246 E.02413
G1 X165.873 Y156.754 E3.03249
G1 X165.225 Y156.754 E.02413
G1 X107.717 Y99.246 E3.03249
G1 X107.07 Y99.246 E.02413
G1 X164.578 Y156.754 E3.03249
G1 X163.931 Y156.754 E.02413
G1 X106.422 Y99.246 E3.03249
G1 X105.775 Y99.246 E.02413
G1 X163.284 Y156.754 E3.03249
G1 X162.637 Y156.754 E.02413
G1 X105.128 Y99.246 E3.03249
G1 X104.481 Y99.246 E.02413
G1 X161.99 Y156.754 E3.03249
G1 X161.343 Y156.754 E.02413
G1 X103.834 Y99.246 E3.03249
G1 X103.187 Y99.246 E.02413
G1 X160.696 Y156.754 E3.03249
M73 P16 R40
G1 X160.049 Y156.754 E.02413
G1 X102.54 Y99.246 E3.03249
G1 X101.893 Y99.246 E.02413
G1 X159.401 Y156.754 E3.03249
G1 X158.754 Y156.754 E.02413
G1 X101.246 Y99.246 E3.03249
G1 X100.598 Y99.246 E.02413
G1 X158.107 Y156.754 E3.03249
G1 X157.46 Y156.754 E.02413
G1 X99.951 Y99.246 E3.03249
M73 P16 R39
G1 X99.304 Y99.246 E.02413
G1 X156.813 Y156.754 E3.03249
G1 X156.166 Y156.754 E.02413
G1 X98.657 Y99.246 E3.03249
G1 X98.01 Y99.246 E.02413
G1 X155.519 Y156.754 E3.03249
G1 X154.872 Y156.754 E.02413
G1 X97.363 Y99.246 E3.03249
G1 X96.716 Y99.246 E.02413
G1 X154.225 Y156.754 E3.03249
G1 X153.578 Y156.754 E.02413
G1 X96.069 Y99.246 E3.03249
G1 X95.422 Y99.246 E.02413
G1 X152.93 Y156.754 E3.03249
G1 X152.283 Y156.754 E.02413
G1 X94.774 Y99.246 E3.03249
G1 X94.127 Y99.246 E.02413
G1 X151.636 Y156.754 E3.03249
G1 X150.989 Y156.754 E.02413
G1 X93.48 Y99.246 E3.03249
G1 X92.833 Y99.246 E.02413
G1 X150.342 Y156.754 E3.03249
G1 X149.695 Y156.754 E.02413
G1 X92.186 Y99.246 E3.03249
G1 X91.539 Y99.246 E.02413
G1 X149.048 Y156.754 E3.03249
G1 X148.401 Y156.754 E.02413
G1 X90.892 Y99.246 E3.03249
G1 X90.245 Y99.246 E.02413
G1 X147.754 Y156.754 E3.03249
G1 X147.106 Y156.754 E.02413
G1 X89.598 Y99.246 E3.03249
G1 X88.951 Y99.246 E.02413
G1 X146.459 Y156.754 E3.03249
G1 X145.812 Y156.754 E.02413
G1 X88.303 Y99.246 E3.03249
G1 X87.656 Y99.246 E.02413
G1 X145.165 Y156.754 E3.03249
G1 X144.518 Y156.754 E.02413
G1 X87.009 Y99.246 E3.03249
G1 X86.362 Y99.246 E.02413
G1 X143.871 Y156.754 E3.03249
G1 X143.224 Y156.754 E.02413
G1 X85.715 Y99.246 E3.03249
G1 X85.068 Y99.246 E.02413
G1 X142.577 Y156.754 E3.03249
G1 X141.93 Y156.754 E.02413
G1 X84.421 Y99.246 E3.03249
M73 P17 R39
G1 X83.774 Y99.246 E.02413
G1 X141.282 Y156.754 E3.03249
G1 X140.635 Y156.754 E.02413
G1 X83.127 Y99.246 E3.03249
G1 X82.479 Y99.246 E.02413
G1 X139.988 Y156.754 E3.03249
G1 X139.341 Y156.754 E.02413
G1 X81.832 Y99.246 E3.03249
G1 X81.185 Y99.246 E.02413
G1 X138.694 Y156.754 E3.03249
G1 X138.047 Y156.754 E.02413
G1 X80.538 Y99.246 E3.03249
G1 X79.891 Y99.246 E.02413
G1 X137.4 Y156.754 E3.03249
G1 X136.753 Y156.754 E.02413
G1 X79.244 Y99.246 E3.03249
G1 X78.597 Y99.246 E.02413
G1 X136.106 Y156.754 E3.03249
G1 X135.459 Y156.754 E.02413
G1 X77.95 Y99.246 E3.03249
G1 X77.303 Y99.246 E.02413
G1 X134.811 Y156.754 E3.03249
G1 X134.164 Y156.754 E.02413
G1 X76.656 Y99.246 E3.03249
G1 X76.008 Y99.246 E.02413
G1 X133.517 Y156.754 E3.03249
G1 X132.87 Y156.754 E.02413
G1 X75.361 Y99.246 E3.03249
G1 X74.714 Y99.246 E.02413
G1 X132.223 Y156.754 E3.03249
G1 X131.576 Y156.754 E.02413
G1 X74.067 Y99.246 E3.03249
G1 X73.42 Y99.246 E.02413
G1 X130.929 Y156.754 E3.03249
G1 X130.282 Y156.754 E.02413
G1 X72.773 Y99.246 E3.03249
G1 X72.126 Y99.246 E.02413
G1 X129.635 Y156.754 E3.03249
G1 X128.987 Y156.754 E.02413
G1 X71.479 Y99.246 E3.03249
G1 X70.832 Y99.246 E.02413
G1 X128.34 Y156.754 E3.03249
G1 X127.693 Y156.754 E.02413
G1 X70.184 Y99.246 E3.03249
G1 X69.537 Y99.246 E.02413
G1 X127.046 Y156.754 E3.03249
G1 X126.399 Y156.754 E.02413
G1 X68.89 Y99.246 E3.03249
G1 X68.243 Y99.246 E.02413
G1 X125.752 Y156.754 E3.03249
G1 X125.105 Y156.754 E.02413
G1 X67.596 Y99.246 E3.03249
G1 X66.949 Y99.246 E.02413
G1 X124.458 Y156.754 E3.03249
G1 X123.811 Y156.754 E.02413
G1 X66.302 Y99.246 E3.03249
G1 X65.655 Y99.246 E.02413
G1 X123.164 Y156.754 E3.03249
M73 P18 R39
G1 X122.516 Y156.754 E.02413
G1 X65.008 Y99.246 E3.03249
G1 X64.36 Y99.246 E.02413
G1 X121.869 Y156.754 E3.03249
G1 X121.222 Y156.754 E.02413
G1 X63.713 Y99.246 E3.03249
G1 X63.066 Y99.246 E.02413
G1 X120.575 Y156.754 E3.03249
G1 X119.928 Y156.754 E.02413
G1 X62.419 Y99.246 E3.03249
G1 X61.772 Y99.246 E.02413
G1 X119.281 Y156.754 E3.03249
G1 X118.634 Y156.754 E.02413
G1 X61.125 Y99.246 E3.03249
G2 X60.478 Y99.246 I-.311 J14.455 E.02411
G1 X117.987 Y156.754 E3.03247
M73 P18 R38
G1 X117.34 Y156.754 E.02413
G1 X59.845 Y99.26 E3.03172
G2 X59.259 Y99.321 I.12 J4.043 E.02201
G1 X116.692 Y156.754 E3.02853
G1 X116.045 Y156.754 E.02413
G1 X58.755 Y99.464 E3.02099
G2 X58.3 Y99.657 I.752 J2.403 E.01843
G1 X115.398 Y156.754 E3.01083
G1 X114.751 Y156.754 E.02413
G1 X57.892 Y99.895 E2.99822
G2 X57.529 Y100.179 I1.263 J1.989 E.01722
G1 X114.104 Y156.754 E2.98325
G1 X113.457 Y156.754 E.02413
G1 X57.204 Y100.502 E2.96625
G2 X56.918 Y100.862 I1.675 J1.626 E.0172
G1 X112.81 Y156.754 E2.94724
G1 X112.163 Y156.754 E.02413
G1 X56.673 Y101.265 E2.92601
G2 X56.481 Y101.72 I1.755 J1.01 E.01846
G1 X111.516 Y156.754 E2.90203
G1 X110.869 Y156.754 E.02413
G1 X56.333 Y102.219 E2.87571
G2 X56.254 Y102.787 I2.826 J.684 E.02141
G1 X110.221 Y156.754 E2.84577
G1 X109.574 Y156.754 E.02413
G1 X56.251 Y103.431 E2.8118
G1 X56.251 Y104.078 E.02413
G1 X108.927 Y156.754 E2.77767
G1 X108.28 Y156.754 E.02413
G1 X56.251 Y104.725 E2.74355
G1 X56.251 Y105.372 E.02413
G1 X107.633 Y156.754 E2.70943
G1 X106.986 Y156.754 E.02413
G1 X56.251 Y106.019 E2.67531
G1 X56.251 Y106.666 E.02413
G1 X106.339 Y156.754 E2.64118
G1 X105.692 Y156.754 E.02413
G1 X56.251 Y107.314 E2.60706
G1 X56.251 Y107.961 E.02413
G1 X105.045 Y156.754 E2.57294
G1 X104.397 Y156.754 E.02413
G1 X56.251 Y108.608 E2.53882
M73 P19 R38
G1 X56.251 Y109.255 E.02413
G1 X103.75 Y156.754 E2.50469
G1 X103.103 Y156.754 E.02413
G1 X56.251 Y109.902 E2.47057
G1 X56.251 Y110.549 E.02413
G1 X102.456 Y156.754 E2.43645
G1 X101.809 Y156.754 E.02413
G1 X56.251 Y111.196 E2.40233
G1 X56.251 Y111.843 E.02413
G1 X101.162 Y156.754 E2.3682
G1 X100.515 Y156.754 E.02413
G1 X56.251 Y112.49 E2.33408
G1 X56.251 Y113.138 E.02413
G1 X99.868 Y156.754 E2.29996
G1 X99.221 Y156.754 E.02413
G1 X56.251 Y113.785 E2.26584
G1 X56.251 Y114.432 E.02413
G1 X98.574 Y156.754 E2.23171
G1 X97.926 Y156.754 E.02413
G1 X56.251 Y115.079 E2.19759
G1 X56.251 Y115.726 E.02413
G1 X97.279 Y156.754 E2.16347
G1 X96.632 Y156.754 E.02413
G1 X56.251 Y116.373 E2.12935
G1 X56.251 Y117.02 E.02413
G1 X95.985 Y156.754 E2.09522
G1 X95.338 Y156.754 E.02413
G1 X56.251 Y117.667 E2.0611
G1 X56.251 Y118.314 E.02413
G1 X94.691 Y156.754 E2.02698
G1 X94.044 Y156.754 E.02413
G1 X56.251 Y118.961 E1.99286
G1 X56.251 Y119.609 E.02413
G1 X93.397 Y156.754 E1.95873
G1 X92.75 Y156.754 E.02413
G1 X56.251 Y120.256 E1.92461
G1 X56.251 Y120.903 E.02413
G1 X92.102 Y156.754 E1.89049
G1 X91.455 Y156.754 E.02413
G1 X56.251 Y121.55 E1.85637
G1 X56.251 Y122.197 E.02413
G1 X90.808 Y156.754 E1.82224
G1 X90.161 Y156.754 E.02413
G1 X56.251 Y122.844 E1.78812
G1 X56.251 Y123.491 E.02413
G1 X89.514 Y156.754 E1.754
G1 X88.867 Y156.754 E.02413
G1 X56.251 Y124.138 E1.71988
G1 X56.251 Y124.785 E.02413
G1 X88.22 Y156.754 E1.68575
G1 X87.573 Y156.754 E.02413
G1 X56.251 Y125.433 E1.65163
G1 X56.251 Y126.08 E.02413
G1 X86.926 Y156.754 E1.61751
G1 X86.278 Y156.754 E.02413
G1 X56.251 Y126.727 E1.58339
G1 X56.251 Y127.374 E.02413
G1 X85.631 Y156.754 E1.54926
G1 X84.984 Y156.754 E.02413
G1 X56.251 Y128.021 E1.51514
G1 X56.251 Y128.668 E.02413
G1 X84.337 Y156.754 E1.48102
M73 P20 R38
G1 X83.69 Y156.754 E.02413
G1 X56.251 Y129.315 E1.4469
G1 X56.251 Y129.962 E.02413
G1 X83.043 Y156.754 E1.41277
G1 X82.396 Y156.754 E.02413
G1 X56.251 Y130.609 E1.37865
G1 X56.251 Y131.256 E.02413
G1 X81.749 Y156.754 E1.34453
G1 X81.102 Y156.754 E.02413
G1 X56.251 Y131.904 E1.31041
G1 X56.251 Y132.551 E.02413
G1 X80.455 Y156.754 E1.27628
G1 X79.807 Y156.754 E.02413
G1 X56.251 Y133.198 E1.24216
G1 X56.251 Y133.845 E.02413
G1 X79.16 Y156.754 E1.20804
G1 X78.513 Y156.754 E.02413
G1 X56.251 Y134.492 E1.17392
G1 X56.251 Y135.139 E.02413
G1 X77.866 Y156.754 E1.13979
G1 X77.219 Y156.754 E.02413
G1 X56.251 Y135.786 E1.10567
G1 X56.251 Y136.433 E.02413
G1 X76.572 Y156.754 E1.07155
G1 X75.925 Y156.754 E.02413
G1 X56.251 Y137.08 E1.03743
G1 X56.251 Y137.728 E.02413
G1 X75.278 Y156.754 E1.0033
M73 P20 R37
G1 X74.631 Y156.754 E.02413
G1 X56.251 Y138.375 E.96918
G1 X56.251 Y139.022 E.02413
G1 X73.983 Y156.754 E.93506
G1 X73.336 Y156.754 E.02413
G1 X56.251 Y139.669 E.90094
G1 X56.251 Y140.316 E.02413
G1 X72.689 Y156.754 E.86681
G1 X72.042 Y156.754 E.02413
G1 X56.251 Y140.963 E.83269
G1 X56.251 Y141.61 E.02413
G1 X71.395 Y156.754 E.79857
G1 X70.748 Y156.754 E.02413
G1 X56.251 Y142.257 E.76445
G1 X56.251 Y142.904 E.02413
G1 X70.101 Y156.754 E.73032
G1 X69.454 Y156.754 E.02413
G1 X56.251 Y143.552 E.6962
G1 X56.251 Y144.199 E.02413
G1 X68.807 Y156.754 E.66208
G1 X68.16 Y156.754 E.02413
G1 X56.251 Y144.846 E.62796
G1 X56.251 Y145.493 E.02413
G1 X67.512 Y156.754 E.59383
G1 X66.865 Y156.754 E.02413
G1 X56.251 Y146.14 E.55971
G1 X56.251 Y146.787 E.02413
G1 X66.218 Y156.754 E.52559
G1 X65.571 Y156.754 E.02413
G1 X56.251 Y147.434 E.49147
G1 X56.251 Y148.081 E.02413
G1 X64.924 Y156.754 E.45734
G1 X64.277 Y156.754 E.02413
G1 X56.251 Y148.728 E.42322
G1 X56.251 Y149.375 E.02413
G1 X63.63 Y156.754 E.3891
G1 X62.983 Y156.754 E.02413
G1 X56.251 Y150.023 E.35498
G1 X56.251 Y150.67 E.02413
G1 X62.336 Y156.754 E.32085
G1 X61.688 Y156.754 E.02413
G1 X56.251 Y151.317 E.28673
G1 X56.251 Y151.964 E.02413
G1 X61.041 Y156.754 E.25261
G1 X60.394 Y156.754 E.02413
G1 X56.251 Y152.611 E.21849
G1 X56.262 Y153.269 E.02454
G1 X59.733 Y156.741 E.18305
G3 X58.947 Y156.601 I.325 J-4.125 E.02983
G1 X56.117 Y153.771 E.14924
M106 S127.5
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X57.531 Y155.185 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/105
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
G3 Z.6 I1.216 J-.044 P1  F30000
G1 X55.624 Y102.569 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
G1 X200.003 Y98.602 E4.64391
G3 X204.398 Y103.007 I-.016 J4.411 E.22911
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.411 J-.006 E.22946
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I.006 J-4.411 E.22947
G1 X55.602 Y103.007 E1.6581
M73 P21 R37
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.233 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X55.234 Y102.531 E.00005
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.008 Y98.21 E4.30197
G3 X204.79 Y103.003 I-.022 J4.804 E.23084
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.804 J-.012 E.23117
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.011 J-4.804 E.23117
G1 X55.21 Y103.003 E1.5362
G1 X55.23 Y102.591 E.01265
M204 S10000
; WIPE_START
G1 F24000
G1 X55.234 Y102.531 E-.02314
G1 X55.302 Y102.066 E-.1786
G1 X55.416 Y101.61 E-.17862
G1 X55.575 Y101.167 E-.17862
G1 X55.776 Y100.742 E-.17862
G1 X55.806 Y100.692 E-.02239
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.566 J1.077 P1  F30000
G1 X56.306 Y100.954 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420817
G1 F15000
G1 X56.998 Y100.263 E.03011
G3 X58.449 Y99.244 I3.292 J3.145 E.05495
G1 X58.608 Y99.187 E.00522
G1 X56.197 Y101.598 E.10499
G1 X56.111 Y101.82 E.00735
G1 X55.996 Y102.333 E.01618
G1 X59.334 Y98.995 E.14537
G3 X59.924 Y98.94 I.575 J2.954 E.01827
G1 X55.941 Y102.923 E.17347
G1 X55.941 Y103.458 E.01646
G1 X60.463 Y98.935 E.19694
G1 X60.997 Y98.935 E.01646
G1 X55.941 Y103.992 E.22021
G1 X55.941 Y104.527 E.01646
G1 X61.532 Y98.935 E.24349
G1 X62.066 Y98.935 E.01646
G1 X55.941 Y105.061 E.26677
G1 X55.941 Y105.595 E.01646
G1 X62.601 Y98.935 E.29004
G1 X63.135 Y98.935 E.01646
G1 X55.94 Y106.13 E.31332
G1 X55.94 Y106.664 E.01646
G1 X63.669 Y98.935 E.33659
G1 X64.204 Y98.935 E.01646
G1 X55.94 Y107.199 E.35987
G1 X55.94 Y107.733 E.01646
G1 X64.738 Y98.935 E.38315
G1 X65.273 Y98.935 E.01646
G1 X55.94 Y108.268 E.40642
G1 X55.94 Y108.802 E.01646
G1 X65.807 Y98.935 E.4297
G1 X66.342 Y98.935 E.01646
G1 X55.94 Y109.337 E.45298
G1 X55.94 Y109.871 E.01646
G1 X66.876 Y98.935 E.47625
G1 X67.41 Y98.935 E.01646
G1 X55.94 Y110.406 E.49953
G1 X55.94 Y110.94 E.01646
G1 X67.945 Y98.935 E.52281
G1 X68.479 Y98.935 E.01646
G1 X55.94 Y111.475 E.54608
G1 X55.94 Y112.009 E.01646
G1 X69.014 Y98.935 E.56936
G1 X69.548 Y98.935 E.01646
G1 X55.94 Y112.544 E.59263
G1 X55.94 Y113.078 E.01646
G1 X70.083 Y98.935 E.61591
G1 X70.617 Y98.935 E.01646
G1 X55.94 Y113.613 E.63919
G1 X55.94 Y114.147 E.01646
G1 X71.151 Y98.935 E.66246
G1 X71.686 Y98.935 E.01646
G1 X55.94 Y114.682 E.68574
G1 X55.939 Y115.216 E.01646
G1 X72.22 Y98.935 E.70902
G1 X72.755 Y98.935 E.01646
G1 X55.939 Y115.751 E.73229
G1 X55.939 Y116.285 E.01646
G1 X73.289 Y98.935 E.75557
G1 X73.824 Y98.935 E.01646
G1 X55.939 Y116.82 E.77884
G1 X55.939 Y117.354 E.01646
G1 X74.358 Y98.935 E.80212
G1 X74.892 Y98.935 E.01646
G1 X55.939 Y117.889 E.8254
G1 X55.939 Y118.423 E.01646
G1 X75.427 Y98.935 E.84867
G1 X75.961 Y98.935 E.01646
G1 X55.939 Y118.958 E.87195
G1 X55.939 Y119.492 E.01646
G1 X76.496 Y98.935 E.89523
G1 X77.03 Y98.935 E.01646
G1 X55.939 Y120.027 E.9185
G1 X55.939 Y120.561 E.01646
G1 X77.565 Y98.935 E.94178
G1 X78.099 Y98.935 E.01646
G1 X55.939 Y121.096 E.96505
G1 X55.939 Y121.63 E.01646
G1 X78.633 Y98.935 E.98833
G1 X79.168 Y98.935 E.01646
G1 X55.939 Y122.165 E1.01161
G1 X55.939 Y122.699 E.01646
G1 X79.702 Y98.935 E1.03488
G1 X80.237 Y98.935 E.01646
G1 X55.939 Y123.233 E1.05816
G1 X55.939 Y123.768 E.01646
G1 X80.771 Y98.935 E1.08144
G1 X81.306 Y98.935 E.01646
G1 X55.938 Y124.302 E1.10471
G1 X55.938 Y124.837 E.01646
G1 X81.84 Y98.935 E1.12799
G1 X82.374 Y98.935 E.01646
G1 X55.938 Y125.371 E1.15126
G1 X55.938 Y125.906 E.01646
G1 X82.909 Y98.935 E1.17454
G1 X83.443 Y98.935 E.01646
G1 X55.938 Y126.44 E1.19782
G1 X55.938 Y126.975 E.01646
G1 X83.978 Y98.935 E1.22109
G1 X84.512 Y98.935 E.01646
G1 X55.938 Y127.509 E1.24437
G1 X55.938 Y128.044 E.01646
G1 X85.047 Y98.935 E1.26765
G1 X85.581 Y98.935 E.01646
G1 X55.938 Y128.578 E1.29092
G1 X55.938 Y129.113 E.01646
G1 X86.115 Y98.935 E1.3142
G1 X86.65 Y98.935 E.01646
G1 X55.938 Y129.647 E1.33747
G1 X55.938 Y130.182 E.01646
G1 X87.184 Y98.935 E1.36075
G1 X87.719 Y98.935 E.01646
G1 X55.938 Y130.716 E1.38403
G1 X55.938 Y131.251 E.01646
G1 X88.253 Y98.935 E1.4073
G1 X88.788 Y98.935 E.01646
G1 X55.938 Y131.785 E1.43058
G1 X55.938 Y132.32 E.01646
G1 X89.322 Y98.935 E1.45386
G1 X89.856 Y98.935 E.01646
G1 X55.938 Y132.854 E1.47713
G1 X55.937 Y133.389 E.01646
G1 X90.391 Y98.935 E1.50041
G1 X90.925 Y98.935 E.01646
G1 X55.937 Y133.923 E1.52369
G1 X55.937 Y134.458 E.01646
G1 X91.46 Y98.935 E1.54696
G1 X91.994 Y98.935 E.01646
G1 X55.937 Y134.992 E1.57024
G1 X55.937 Y135.527 E.01646
G1 X92.529 Y98.935 E1.59351
G1 X93.063 Y98.935 E.01646
G1 X55.937 Y136.061 E1.61679
G1 X55.937 Y136.596 E.01646
G1 X93.597 Y98.935 E1.64007
G1 X94.132 Y98.935 E.01646
G1 X55.937 Y137.13 E1.66334
G1 X55.937 Y137.665 E.01646
G1 X94.666 Y98.935 E1.68662
G1 X95.201 Y98.935 E.01646
G1 X55.937 Y138.199 E1.7099
G1 X55.937 Y138.734 E.01646
G1 X95.735 Y98.935 E1.73317
G1 X96.269 Y98.935 E.01646
G1 X55.937 Y139.268 E1.75645
G1 X55.937 Y139.803 E.01646
G1 X96.804 Y98.935 E1.77972
G1 X97.338 Y98.935 E.01646
G1 X55.937 Y140.337 E1.803
G1 X55.937 Y140.872 E.01646
G1 X97.873 Y98.935 E1.82628
G1 X98.407 Y98.935 E.01646
G1 X55.937 Y141.406 E1.84955
G1 X55.937 Y141.94 E.01646
G1 X98.942 Y98.935 E1.87283
G1 X99.476 Y98.935 E.01646
G1 X55.936 Y142.475 E1.89611
G1 X55.936 Y143.009 E.01646
G1 X100.01 Y98.935 E1.91938
G1 X100.545 Y98.935 E.01646
G1 X55.936 Y143.544 E1.94266
G1 X55.936 Y144.078 E.01646
G1 X101.079 Y98.935 E1.96593
G1 X101.614 Y98.935 E.01646
G1 X55.936 Y144.613 E1.98921
G1 X55.936 Y145.147 E.01646
G1 X102.148 Y98.935 E2.01249
G1 X102.683 Y98.935 E.01646
G1 X55.936 Y145.682 E2.03576
G1 X55.936 Y146.216 E.01646
G1 X103.217 Y98.935 E2.05904
G1 X103.751 Y98.935 E.01646
G1 X55.936 Y146.751 E2.08232
G1 X55.936 Y147.285 E.01646
G1 X104.286 Y98.935 E2.10559
G1 X104.82 Y98.935 E.01646
G1 X55.936 Y147.82 E2.12887
G1 X55.936 Y148.354 E.01646
G1 X105.355 Y98.935 E2.15214
G1 X105.889 Y98.935 E.01646
G1 X55.936 Y148.889 E2.17542
G1 X55.936 Y149.423 E.01646
G1 X106.424 Y98.935 E2.1987
G1 X106.958 Y98.935 E.01646
G1 X55.936 Y149.958 E2.22197
G1 X55.936 Y150.492 E.01646
G1 X107.492 Y98.935 E2.24525
G1 X108.027 Y98.935 E.01646
G1 X55.936 Y151.027 E2.26853
G1 X55.935 Y151.561 E.01646
G1 X108.561 Y98.935 E2.2918
G1 X109.096 Y98.935 E.01646
G1 X55.935 Y152.096 E2.31508
G1 X55.935 Y152.63 E.01646
G1 X109.63 Y98.935 E2.33835
G1 X110.165 Y98.935 E.01646
G1 X55.944 Y153.156 E2.36127
G2 X55.992 Y153.643 I2.483 J0 E.01508
G1 X110.699 Y98.935 E2.38245
G1 X111.233 Y98.935 E.01646
G1 X56.087 Y154.082 E2.40159
G2 X56.22 Y154.484 I2.104 J-.475 E.01304
G1 X111.768 Y98.935 E2.41907
G1 X112.302 Y98.935 E.01646
G1 X56.392 Y154.846 E2.43484
G2 X56.584 Y155.188 I1.25 J-.477 E.01213
G1 X112.837 Y98.935 E2.44974
G1 X113.371 Y98.935 E.01646
G1 X56.805 Y155.502 E2.4634
G2 X57.056 Y155.785 I1.081 J-.705 E.0117
G1 X113.906 Y98.935 E2.47574
G1 X114.44 Y98.935 E.01646
G1 X57.324 Y156.052 E2.48736
G1 X57.624 Y156.286 E.01173
G1 X114.974 Y98.935 E2.49757
G1 X115.509 Y98.935 E.01646
G1 X57.949 Y156.496 E2.50669
G1 X58.293 Y156.685 E.01212
G1 X116.043 Y98.935 E2.51495
G1 X116.578 Y98.935 E.01646
G1 X58.679 Y156.834 E2.52143
G2 X59.097 Y156.951 I.602 J-1.35 E.01341
G1 X117.112 Y98.935 E2.52651
G1 X117.647 Y98.935 E.01646
G1 X59.552 Y157.03 E2.52998
G2 X60.052 Y157.065 I.484 J-3.394 E.01545
G1 X118.181 Y98.935 E2.53147
G1 X118.715 Y98.935 E.01646
G1 X60.586 Y157.065 E2.53147
G1 X61.121 Y157.065 E.01646
G1 X119.25 Y98.935 E2.53147
G1 X119.784 Y98.935 E.01646
G1 X61.655 Y157.065 E2.53147
G1 X62.189 Y157.065 E.01646
G1 X120.319 Y98.935 E2.53147
G1 X120.853 Y98.935 E.01646
G1 X62.724 Y157.065 E2.53147
G1 X63.258 Y157.065 E.01646
G1 X121.388 Y98.935 E2.53147
G1 X121.922 Y98.935 E.01646
G1 X63.793 Y157.065 E2.53147
G1 X64.327 Y157.065 E.01646
G1 X122.456 Y98.935 E2.53147
G1 X122.991 Y98.935 E.01646
G1 X64.862 Y157.065 E2.53147
G1 X65.396 Y157.065 E.01646
G1 X123.525 Y98.935 E2.53147
M73 P22 R37
G1 X124.06 Y98.935 E.01646
G1 X65.93 Y157.065 E2.53147
G1 X66.465 Y157.065 E.01646
G1 X124.594 Y98.935 E2.53147
G1 X125.129 Y98.935 E.01646
G1 X66.999 Y157.065 E2.53147
G1 X67.534 Y157.065 E.01646
G1 X125.663 Y98.935 E2.53147
G1 X126.197 Y98.935 E.01646
G1 X68.068 Y157.065 E2.53147
G1 X68.603 Y157.065 E.01646
G1 X126.732 Y98.935 E2.53147
G1 X127.266 Y98.935 E.01646
G1 X69.137 Y157.065 E2.53147
G1 X69.671 Y157.065 E.01646
G1 X127.801 Y98.935 E2.53147
G1 X128.335 Y98.935 E.01646
G1 X70.206 Y157.065 E2.53147
G1 X70.74 Y157.065 E.01646
G1 X128.869 Y98.935 E2.53147
G1 X129.404 Y98.935 E.01646
G1 X71.275 Y157.065 E2.53147
G1 X71.809 Y157.065 E.01646
G1 X129.938 Y98.935 E2.53147
G1 X130.473 Y98.935 E.01646
G1 X72.344 Y157.065 E2.53147
G1 X72.878 Y157.065 E.01646
G1 X131.007 Y98.935 E2.53147
G1 X131.542 Y98.935 E.01646
G1 X73.412 Y157.065 E2.53147
G1 X73.947 Y157.065 E.01646
G1 X132.076 Y98.935 E2.53147
G1 X132.61 Y98.935 E.01646
G1 X74.481 Y157.065 E2.53147
G1 X75.016 Y157.065 E.01646
G1 X133.145 Y98.935 E2.53147
G1 X133.679 Y98.935 E.01646
G1 X75.55 Y157.065 E2.53147
G1 X76.085 Y157.065 E.01646
G1 X134.214 Y98.935 E2.53147
G1 X134.748 Y98.935 E.01646
G1 X76.619 Y157.065 E2.53147
G1 X77.153 Y157.065 E.01646
G1 X135.283 Y98.935 E2.53147
G1 X135.817 Y98.935 E.01646
G1 X77.688 Y157.065 E2.53147
G1 X78.222 Y157.065 E.01646
G1 X136.351 Y98.935 E2.53147
G1 X136.886 Y98.935 E.01646
G1 X78.757 Y157.065 E2.53147
G1 X79.291 Y157.065 E.01646
G1 X137.42 Y98.935 E2.53147
G1 X137.955 Y98.935 E.01646
G1 X79.826 Y157.065 E2.53147
G1 X80.36 Y157.065 E.01646
G1 X138.489 Y98.935 E2.53147
G1 X139.024 Y98.935 E.01646
G1 X80.894 Y157.065 E2.53147
G1 X81.429 Y157.065 E.01646
G1 X139.558 Y98.935 E2.53147
G1 X140.092 Y98.935 E.01646
G1 X81.963 Y157.065 E2.53147
G1 X82.498 Y157.065 E.01646
G1 X140.627 Y98.935 E2.53147
G1 X141.161 Y98.935 E.01646
G1 X83.032 Y157.065 E2.53147
G1 X83.567 Y157.065 E.01646
G1 X141.696 Y98.935 E2.53147
G1 X142.23 Y98.935 E.01646
G1 X84.101 Y157.065 E2.53147
G1 X84.635 Y157.065 E.01646
G1 X142.765 Y98.935 E2.53147
G1 X143.299 Y98.935 E.01646
G1 X85.17 Y157.065 E2.53147
M73 P22 R36
G1 X85.704 Y157.065 E.01646
G1 X143.833 Y98.935 E2.53147
G1 X144.368 Y98.936 E.01646
G1 X86.239 Y157.065 E2.53147
G1 X86.773 Y157.065 E.01646
G1 X144.902 Y98.936 E2.53147
G1 X145.437 Y98.936 E.01646
G1 X87.308 Y157.065 E2.53147
G1 X87.842 Y157.065 E.01646
G1 X145.971 Y98.936 E2.53147
G1 X146.506 Y98.936 E.01646
G1 X88.376 Y157.065 E2.53147
G1 X88.911 Y157.065 E.01646
G1 X147.04 Y98.936 E2.53147
G1 X147.574 Y98.936 E.01646
G1 X89.445 Y157.065 E2.53147
G1 X89.98 Y157.065 E.01646
G1 X148.109 Y98.936 E2.53147
G1 X148.643 Y98.936 E.01646
G1 X90.514 Y157.065 E2.53147
G1 X91.049 Y157.065 E.01646
G1 X149.178 Y98.936 E2.53147
G1 X149.712 Y98.936 E.01646
G1 X91.583 Y157.065 E2.53147
G1 X92.117 Y157.065 E.01646
G1 X150.247 Y98.936 E2.53147
G1 X150.781 Y98.936 E.01646
G1 X92.652 Y157.065 E2.53147
G1 X93.186 Y157.065 E.01646
G1 X151.315 Y98.936 E2.53147
G1 X151.85 Y98.936 E.01646
G1 X93.721 Y157.065 E2.53147
G1 X94.255 Y157.065 E.01646
G1 X152.384 Y98.936 E2.53147
G1 X152.919 Y98.936 E.01646
G1 X94.79 Y157.065 E2.53147
G1 X95.324 Y157.065 E.01646
G1 X153.453 Y98.936 E2.53147
G1 X153.988 Y98.936 E.01646
G1 X95.858 Y157.065 E2.53147
G1 X96.393 Y157.065 E.01646
G1 X154.522 Y98.936 E2.53147
G1 X155.056 Y98.936 E.01646
G1 X96.927 Y157.065 E2.53147
G1 X97.462 Y157.065 E.01646
G1 X155.591 Y98.936 E2.53147
G1 X156.125 Y98.936 E.01646
G1 X97.996 Y157.065 E2.53147
G1 X98.53 Y157.065 E.01646
G1 X156.66 Y98.936 E2.53147
G1 X157.194 Y98.936 E.01646
G1 X99.065 Y157.065 E2.53147
G1 X99.599 Y157.065 E.01646
G1 X157.729 Y98.936 E2.53147
G1 X158.263 Y98.936 E.01646
G1 X100.134 Y157.065 E2.53147
G1 X100.668 Y157.065 E.01646
G1 X158.797 Y98.936 E2.53147
G1 X159.332 Y98.936 E.01646
G1 X101.203 Y157.065 E2.53147
G1 X101.737 Y157.065 E.01646
G1 X159.866 Y98.936 E2.53147
G1 X160.401 Y98.936 E.01646
G1 X102.271 Y157.065 E2.53147
G1 X102.806 Y157.065 E.01646
G1 X160.935 Y98.936 E2.53147
G1 X161.469 Y98.936 E.01646
G1 X103.34 Y157.065 E2.53147
G1 X103.875 Y157.065 E.01646
G1 X162.004 Y98.936 E2.53147
G1 X162.538 Y98.936 E.01646
G1 X104.409 Y157.065 E2.53147
G1 X104.944 Y157.065 E.01646
G1 X163.073 Y98.936 E2.53147
G1 X163.607 Y98.936 E.01646
G1 X105.478 Y157.065 E2.53147
G1 X106.012 Y157.065 E.01646
G1 X164.142 Y98.936 E2.53147
G1 X164.676 Y98.936 E.01646
G1 X106.547 Y157.065 E2.53147
G1 X107.081 Y157.065 E.01646
G1 X165.21 Y98.936 E2.53147
G1 X165.745 Y98.936 E.01646
G1 X107.616 Y157.065 E2.53147
M73 P23 R36
G1 X108.15 Y157.065 E.01646
G1 X166.279 Y98.936 E2.53147
G1 X166.814 Y98.936 E.01646
G1 X108.685 Y157.065 E2.53147
G1 X109.219 Y157.065 E.01646
G1 X167.348 Y98.936 E2.53147
G1 X167.883 Y98.936 E.01646
G1 X109.753 Y157.065 E2.53147
G1 X110.288 Y157.065 E.01646
G1 X168.417 Y98.936 E2.53147
G1 X168.951 Y98.936 E.01646
G1 X110.822 Y157.065 E2.53147
G1 X111.357 Y157.065 E.01646
G1 X169.486 Y98.936 E2.53147
G1 X170.02 Y98.936 E.01646
G1 X111.891 Y157.065 E2.53147
G1 X112.426 Y157.065 E.01646
G1 X170.555 Y98.936 E2.53147
G1 X171.089 Y98.936 E.01646
G1 X112.96 Y157.065 E2.53147
G1 X113.494 Y157.065 E.01646
G1 X171.624 Y98.936 E2.53147
G1 X172.158 Y98.936 E.01646
G1 X114.029 Y157.065 E2.53147
G1 X114.563 Y157.065 E.01646
G1 X172.692 Y98.936 E2.53147
G1 X173.227 Y98.936 E.01646
G1 X115.098 Y157.065 E2.53147
G1 X115.632 Y157.065 E.01646
G1 X173.761 Y98.936 E2.53147
G1 X174.296 Y98.936 E.01646
G1 X116.167 Y157.065 E2.53147
G1 X116.701 Y157.065 E.01646
G1 X174.83 Y98.936 E2.53147
G1 X175.365 Y98.936 E.01646
G1 X117.235 Y157.065 E2.53147
G1 X117.77 Y157.065 E.01646
G1 X175.899 Y98.936 E2.53147
G1 X176.433 Y98.936 E.01646
G1 X118.304 Y157.065 E2.53147
G1 X118.839 Y157.065 E.01646
G1 X176.968 Y98.936 E2.53147
G1 X177.502 Y98.936 E.01646
G1 X119.373 Y157.065 E2.53147
G1 X119.908 Y157.065 E.01646
G1 X178.037 Y98.936 E2.53147
G1 X178.571 Y98.936 E.01646
G1 X120.442 Y157.065 E2.53147
G1 X120.976 Y157.065 E.01646
G1 X179.106 Y98.936 E2.53147
G1 X179.64 Y98.936 E.01646
G1 X121.511 Y157.065 E2.53147
G1 X122.045 Y157.065 E.01646
G1 X180.174 Y98.936 E2.53147
G1 X180.709 Y98.936 E.01646
G1 X122.58 Y157.065 E2.53147
G1 X123.114 Y157.065 E.01646
G1 X181.243 Y98.936 E2.53147
G1 X181.778 Y98.936 E.01646
G1 X123.649 Y157.065 E2.53147
G1 X124.183 Y157.065 E.01646
G1 X182.312 Y98.936 E2.53147
G1 X182.847 Y98.936 E.01646
G1 X124.717 Y157.065 E2.53147
G1 X125.252 Y157.065 E.01646
G1 X183.381 Y98.936 E2.53147
G1 X183.915 Y98.936 E.01646
G1 X125.786 Y157.065 E2.53147
G1 X126.321 Y157.065 E.01646
G1 X184.45 Y98.936 E2.53147
G1 X184.984 Y98.936 E.01646
G1 X126.855 Y157.065 E2.53147
G1 X127.39 Y157.065 E.01646
G1 X185.519 Y98.936 E2.53147
G1 X186.053 Y98.936 E.01646
G1 X127.924 Y157.065 E2.53147
G1 X128.458 Y157.065 E.01646
G1 X186.588 Y98.936 E2.53147
G1 X187.122 Y98.936 E.01646
G1 X128.993 Y157.065 E2.53147
G1 X129.527 Y157.065 E.01646
G1 X187.656 Y98.936 E2.53147
G1 X188.191 Y98.936 E.01646
G1 X130.062 Y157.065 E2.53147
G1 X130.596 Y157.065 E.01646
G1 X188.725 Y98.936 E2.53147
G1 X189.26 Y98.936 E.01646
G1 X131.131 Y157.065 E2.53147
G1 X131.665 Y157.065 E.01646
G1 X189.794 Y98.936 E2.53147
G1 X190.328 Y98.936 E.01646
G1 X132.199 Y157.065 E2.53147
G1 X132.734 Y157.065 E.01646
G1 X190.863 Y98.936 E2.53147
G1 X191.397 Y98.936 E.01646
G1 X133.268 Y157.065 E2.53147
G1 X133.803 Y157.065 E.01646
G1 X191.932 Y98.936 E2.53147
G1 X192.466 Y98.936 E.01646
G1 X134.337 Y157.065 E2.53147
G1 X134.872 Y157.065 E.01646
G1 X193.001 Y98.936 E2.53147
G1 X193.535 Y98.936 E.01646
G1 X135.406 Y157.065 E2.53147
G1 X135.94 Y157.065 E.01646
G1 X194.069 Y98.936 E2.53147
G1 X194.604 Y98.936 E.01646
G1 X136.475 Y157.065 E2.53147
G1 X137.009 Y157.065 E.01646
G1 X195.138 Y98.936 E2.53147
G1 X195.673 Y98.936 E.01646
G1 X137.544 Y157.065 E2.53147
G1 X138.078 Y157.065 E.01646
G1 X196.207 Y98.936 E2.53147
G1 X196.742 Y98.936 E.01646
G1 X138.613 Y157.065 E2.53147
G1 X139.147 Y157.065 E.01646
G1 X197.276 Y98.936 E2.53147
G1 X197.81 Y98.936 E.01646
G1 X139.681 Y157.065 E2.53147
G1 X140.216 Y157.065 E.01646
G1 X198.345 Y98.936 E2.53146
G1 X198.879 Y98.936 E.01646
G1 X140.75 Y157.065 E2.53146
G1 X141.285 Y157.065 E.01646
G1 X199.414 Y98.936 E2.53146
G1 X199.948 Y98.936 E.01646
G1 X141.819 Y157.065 E2.53146
G1 X142.354 Y157.065 E.01646
G1 X200.454 Y98.964 E2.53024
G3 X200.909 Y99.043 I-.176 J2.35 E.01425
G1 X142.888 Y157.065 E2.52678
G1 X143.422 Y157.065 E.01646
G1 X201.324 Y99.163 E2.52158
G3 X201.705 Y99.316 I-.589 J2.01 E.01267
G1 X143.957 Y157.065 E2.51489
G1 X144.491 Y157.065 E.01646
G1 X202.056 Y99.5 E2.50689
G3 X202.379 Y99.711 I-.91 J1.747 E.01191
G1 X145.026 Y157.065 E2.4977
G1 X145.56 Y157.065 E.01646
G1 X202.677 Y99.948 E2.48738
G3 X202.949 Y100.21 I-1.193 J1.514 E.01166
G1 X146.095 Y157.065 E2.47598
G1 X146.629 Y157.065 E.01646
G1 X203.197 Y100.497 E2.46349
G3 X203.419 Y100.809 I-1.474 J1.284 E.01182
G1 X147.163 Y157.065 E2.44989
G1 X147.698 Y157.065 E.01646
G1 X203.614 Y101.148 E2.43511
G3 X203.779 Y101.518 I-1.419 J.85 E.0125
G1 X148.232 Y157.065 E2.41899
G1 X148.767 Y157.065 E.01646
G1 X203.911 Y101.92 E2.40149
G3 X204.01 Y102.355 I-1.714 J.62 E.01378
G1 X149.301 Y157.065 E2.38254
M73 P24 R36
G1 X149.836 Y157.065 E.01646
G1 X204.059 Y102.841 E2.36139
G1 X204.059 Y103.375 E.01646
G1 X150.37 Y157.065 E2.33811
G1 X150.904 Y157.065 E.01646
G1 X204.059 Y103.91 E2.31484
G1 X204.059 Y104.444 E.01646
G1 X151.439 Y157.065 E2.29157
G1 X151.973 Y157.065 E.01646
G1 X204.059 Y104.979 E2.26829
G1 X204.059 Y105.513 E.01646
G1 X152.508 Y157.065 E2.24502
G1 X153.042 Y157.065 E.01646
G1 X204.059 Y106.048 E2.22175
G1 X204.059 Y106.582 E.01646
G1 X153.576 Y157.065 E2.19847
G1 X154.111 Y157.065 E.01646
G1 X204.059 Y107.116 E2.1752
G1 X204.059 Y107.651 E.01646
G1 X154.645 Y157.065 E2.15192
G1 X155.18 Y157.065 E.01646
G1 X204.059 Y108.185 E2.12865
G1 X204.059 Y108.72 E.01646
G1 X155.714 Y157.065 E2.10538
G1 X156.249 Y157.065 E.01646
G1 X204.059 Y109.254 E2.0821
G1 X204.059 Y109.789 E.01646
G1 X156.783 Y157.065 E2.05883
G1 X157.317 Y157.065 E.01646
G1 X204.059 Y110.323 E2.03556
G1 X204.059 Y110.857 E.01646
G1 X157.852 Y157.065 E2.01228
G1 X158.386 Y157.065 E.01646
G1 X204.059 Y111.392 E1.98901
G1 X204.059 Y111.926 E.01646
G1 X158.921 Y157.065 E1.96573
G1 X159.455 Y157.065 E.01646
G1 X204.059 Y112.461 E1.94246
G1 X204.059 Y112.995 E.01646
G1 X159.99 Y157.065 E1.91919
G1 X160.524 Y157.065 E.01646
G1 X204.059 Y113.53 E1.89591
G1 X204.059 Y114.064 E.01646
G1 X161.058 Y157.065 E1.87264
G1 X161.593 Y157.065 E.01646
G1 X204.059 Y114.598 E1.84937
G1 X204.059 Y115.133 E.01646
G1 X162.127 Y157.065 E1.82609
G1 X162.662 Y157.065 E.01646
G1 X204.059 Y115.667 E1.80282
G1 X204.059 Y116.202 E.01646
G1 X163.196 Y157.065 E1.77954
G1 X163.731 Y157.065 E.01646
G1 X204.059 Y116.736 E1.75627
G1 X204.059 Y117.271 E.01646
G1 X164.265 Y157.065 E1.733
G1 X164.799 Y157.065 E.01646
G1 X204.059 Y117.805 E1.70972
G1 X204.059 Y118.339 E.01646
G1 X165.334 Y157.065 E1.68645
G1 X165.868 Y157.065 E.01646
G1 X204.059 Y118.874 E1.66318
G1 X204.059 Y119.408 E.01646
G1 X166.403 Y157.065 E1.6399
G1 X166.937 Y157.065 E.01646
G1 X204.059 Y119.943 E1.61663
G1 X204.059 Y120.477 E.01646
G1 X167.472 Y157.065 E1.59335
G1 X168.006 Y157.065 E.01646
G1 X204.059 Y121.012 E1.57008
G1 X204.059 Y121.546 E.01646
G1 X168.54 Y157.065 E1.54681
G1 X169.075 Y157.065 E.01646
G1 X204.059 Y122.08 E1.52353
G1 X204.059 Y122.615 E.01646
G1 X169.609 Y157.065 E1.50026
G1 X170.144 Y157.065 E.01646
G1 X204.059 Y123.149 E1.47698
G1 X204.059 Y123.684 E.01646
G1 X170.678 Y157.065 E1.45371
G1 X171.213 Y157.065 E.01646
G1 X204.059 Y124.218 E1.43044
G1 X204.059 Y124.752 E.01646
G1 X171.747 Y157.065 E1.40716
G1 X172.281 Y157.065 E.01646
G1 X204.059 Y125.287 E1.38389
G1 X204.059 Y125.821 E.01646
G1 X172.816 Y157.065 E1.36062
G1 X173.35 Y157.065 E.01646
G1 X204.059 Y126.356 E1.33734
G1 X204.059 Y126.89 E.01646
G1 X173.885 Y157.065 E1.31407
G1 X174.419 Y157.065 E.01646
G1 X204.059 Y127.425 E1.29079
G1 X204.059 Y127.959 E.01646
G1 X174.954 Y157.065 E1.26752
M73 P24 R35
G1 X175.488 Y157.065 E.01646
G1 X204.059 Y128.493 E1.24425
G1 X204.059 Y129.028 E.01646
G1 X176.022 Y157.065 E1.22097
G1 X176.557 Y157.065 E.01646
G1 X204.059 Y129.562 E1.1977
G1 X204.059 Y130.097 E.01646
G1 X177.091 Y157.065 E1.17443
G1 X177.626 Y157.065 E.01646
G1 X204.059 Y130.631 E1.15115
G1 X204.059 Y131.166 E.01646
G1 X178.16 Y157.065 E1.12788
G1 X178.695 Y157.065 E.01646
G1 X204.059 Y131.7 E1.1046
G1 X204.059 Y132.234 E.01646
G1 X179.229 Y157.065 E1.08133
G1 X179.763 Y157.065 E.01646
G1 X204.059 Y132.769 E1.05806
G1 X204.059 Y133.303 E.01646
G1 X180.298 Y157.065 E1.03478
G1 X180.832 Y157.065 E.01646
G1 X204.059 Y133.838 E1.01151
G1 X204.059 Y134.372 E.01646
G1 X181.367 Y157.065 E.98824
G1 X181.901 Y157.065 E.01646
G1 X204.059 Y134.907 E.96496
G1 X204.059 Y135.441 E.01646
G1 X182.436 Y157.065 E.94169
G1 X182.97 Y157.065 E.01646
G1 X204.059 Y135.975 E.91841
G1 X204.059 Y136.51 E.01646
G1 X183.504 Y157.065 E.89514
G1 X184.039 Y157.065 E.01646
G1 X204.059 Y137.044 E.87187
G1 X204.059 Y137.579 E.01646
G1 X184.573 Y157.065 E.84859
G1 X185.108 Y157.065 E.01646
G1 X204.059 Y138.113 E.82532
G1 X204.059 Y138.648 E.01646
G1 X185.642 Y157.065 E.80205
G1 X186.177 Y157.065 E.01646
G1 X204.059 Y139.182 E.77877
G1 X204.059 Y139.716 E.01646
G1 X186.711 Y157.065 E.7555
G1 X187.245 Y157.065 E.01646
G1 X204.059 Y140.251 E.73222
G1 X204.059 Y140.785 E.01646
G1 X187.78 Y157.065 E.70895
G1 X188.314 Y157.065 E.01646
G1 X204.059 Y141.32 E.68568
G1 X204.059 Y141.854 E.01646
G1 X188.849 Y157.065 E.6624
G1 X189.383 Y157.065 E.01646
G1 X204.059 Y142.389 E.63913
G1 X204.059 Y142.923 E.01646
G1 X189.918 Y157.065 E.61586
G1 X190.452 Y157.065 E.01646
G1 X204.059 Y143.457 E.59258
G1 X204.059 Y143.992 E.01646
G1 X190.986 Y157.065 E.56931
G1 X191.521 Y157.065 E.01646
G1 X204.059 Y144.526 E.54603
G1 X204.059 Y145.061 E.01646
G1 X192.055 Y157.065 E.52276
G1 X192.59 Y157.065 E.01646
G1 X204.059 Y145.595 E.49949
G1 X204.059 Y146.13 E.01646
G1 X193.124 Y157.065 E.47621
G1 X193.659 Y157.065 E.01646
G1 X204.059 Y146.664 E.45294
G1 X204.059 Y147.198 E.01646
G1 X194.193 Y157.065 E.42967
G1 X194.727 Y157.065 E.01646
G1 X204.059 Y147.733 E.40639
G1 X204.059 Y148.267 E.01646
G1 X195.262 Y157.065 E.38312
G1 X195.796 Y157.065 E.01646
G1 X204.059 Y148.802 E.35984
G1 X204.059 Y149.336 E.01646
G1 X196.331 Y157.065 E.33657
G1 X196.865 Y157.065 E.01646
G1 X204.059 Y149.871 E.3133
G1 X204.059 Y150.405 E.01646
G1 X197.4 Y157.065 E.29002
G1 X197.934 Y157.065 E.01646
G1 X204.059 Y150.939 E.26675
G1 X204.059 Y151.474 E.01646
G1 X198.468 Y157.065 E.24347
G1 X199.003 Y157.065 E.01646
G1 X204.059 Y152.008 E.2202
G1 X204.059 Y152.543 E.01646
G1 X199.537 Y157.065 E.19693
G2 X200.076 Y157.06 I.224 J-5.534 E.0166
G1 X204.059 Y153.077 E.17346
G3 X204.004 Y153.667 I-4.137 J-.092 E.01826
G1 X200.666 Y157.005 E.14536
G2 X201.392 Y156.813 I-.693 J-4.096 E.02316
G1 X203.803 Y154.403 E.10497
G3 X203.012 Y155.728 I-4.068 J-1.529 E.04777
G1 X202.039 Y156.701 E.04237
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X203.012 Y155.728 E-.52281
G1 X203.379 Y155.258 E-.22665
G1 X203.392 Y155.233 E-.01054
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/105
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
G3 Z.8 I.409 J-1.146 P1  F30000
G1 X55.625 Y102.569 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
G1 X200.01 Y98.603 E4.64414
G3 X204.398 Y103.007 I-.023 J4.41 E.22888
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.411 J-.006 E.22946
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I.006 J-4.411 E.22946
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.233 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X55.234 Y102.531 E.00005
G3 X60.003 Y98.21 I4.78 J.484 E.21664
G1 X200.015 Y98.21 E4.30219
G3 X204.79 Y103.003 I-.028 J4.803 E.23063
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.804 J-.012 E.23117
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.012 J-4.804 E.23117
G1 X55.21 Y103.003 E1.5362
G1 X55.23 Y102.591 E.01265
M204 S10000
; WIPE_START
G1 F24000
G1 X55.234 Y102.531 E-.02313
G1 X55.302 Y102.066 E-.1786
G1 X55.416 Y101.61 E-.17863
G1 X55.575 Y101.167 E-.17862
G1 X55.776 Y100.742 E-.17862
G1 X55.806 Y100.691 E-.0224
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.216 J.047 P1  F30000
G1 X57.955 Y156.694 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420831
G1 F15000
G1 X57.261 Y156.001 E.0302
G3 X56.244 Y154.551 I3.144 J-3.289 E.05488
G1 X56.187 Y154.392 E.00522
G1 X58.598 Y156.803 E.10501
G1 X58.82 Y156.889 E.00735
G1 X59.333 Y157.004 E.01619
G1 X55.995 Y153.666 E.14538
G3 X55.94 Y153.076 I2.954 J-.575 E.01827
G1 X59.921 Y157.057 E.1734
G2 X60.463 Y157.065 I.32 J-3.696 E.0167
G1 X55.935 Y152.537 E.19718
G1 X55.935 Y152.003 E.01646
G1 X60.998 Y157.065 E.22046
G1 X61.532 Y157.065 E.01646
M73 P25 R35
G1 X55.936 Y151.468 E.24373
G1 X55.936 Y150.934 E.01646
G1 X62.066 Y157.065 E.267
G1 X62.601 Y157.065 E.01646
G1 X55.936 Y150.399 E.29028
G1 X55.936 Y149.865 E.01646
G1 X63.135 Y157.065 E.31355
G1 X63.67 Y157.065 E.01646
G1 X55.936 Y149.331 E.33682
G1 X55.936 Y148.796 E.01646
G1 X64.204 Y157.065 E.3601
G1 X64.739 Y157.065 E.01646
G1 X55.936 Y148.262 E.38337
G1 X55.936 Y147.727 E.01646
G1 X65.273 Y157.065 E.40664
G1 X65.808 Y157.065 E.01646
G1 X55.936 Y147.193 E.42991
G1 X55.936 Y146.659 E.01646
G1 X66.342 Y157.065 E.45319
G1 X66.876 Y157.065 E.01646
G1 X55.936 Y146.124 E.47646
G1 X55.936 Y145.59 E.01646
G1 X67.411 Y157.065 E.49973
G1 X67.945 Y157.065 E.01646
G1 X55.936 Y145.056 E.52301
G1 X55.936 Y144.521 E.01646
G1 X68.48 Y157.065 E.54628
G1 X69.014 Y157.065 E.01646
G1 X55.936 Y143.987 E.56955
G1 X55.936 Y143.452 E.01646
G1 X69.549 Y157.065 E.59283
G1 X70.083 Y157.065 E.01646
G1 X55.936 Y142.918 E.6161
G1 X55.937 Y142.384 E.01646
G1 X70.618 Y157.065 E.63937
G1 X71.152 Y157.065 E.01646
G1 X55.937 Y141.849 E.66264
G1 X55.937 Y141.315 E.01646
G1 X71.686 Y157.065 E.68592
G1 X72.221 Y157.065 E.01646
G1 X55.937 Y140.78 E.70919
G1 X55.937 Y140.246 E.01646
G1 X72.755 Y157.065 E.73246
G1 X73.29 Y157.065 E.01646
G1 X55.937 Y139.712 E.75574
G1 X55.937 Y139.177 E.01646
G1 X73.824 Y157.065 E.77901
G1 X74.359 Y157.065 E.01646
G1 X55.937 Y138.643 E.80228
G1 X55.937 Y138.108 E.01646
G1 X74.893 Y157.065 E.82556
G1 X75.428 Y157.065 E.01646
G1 X55.937 Y137.574 E.84883
G1 X55.937 Y137.04 E.01646
G1 X75.962 Y157.065 E.8721
G1 X76.497 Y157.065 E.01646
G1 X55.937 Y136.505 E.89537
G1 X55.937 Y135.971 E.01646
G1 X77.031 Y157.065 E.91865
G1 X77.565 Y157.065 E.01646
G1 X55.937 Y135.437 E.94192
G1 X55.937 Y134.902 E.01646
G1 X78.1 Y157.065 E.96519
G1 X78.634 Y157.065 E.01646
G1 X55.937 Y134.368 E.98847
G1 X55.937 Y133.833 E.01646
G1 X79.169 Y157.065 E1.01174
G1 X79.703 Y157.065 E.01646
G1 X55.937 Y133.299 E1.03501
G1 X55.938 Y132.765 E.01646
G1 X80.238 Y157.065 E1.05828
G1 X80.772 Y157.065 E.01646
G1 X55.938 Y132.23 E1.08156
G1 X55.938 Y131.696 E.01646
G1 X81.307 Y157.065 E1.10483
G1 X81.841 Y157.065 E.01646
G1 X55.938 Y131.161 E1.1281
G1 X55.938 Y130.627 E.01646
G1 X82.375 Y157.065 E1.15138
G1 X82.91 Y157.065 E.01646
G1 X55.938 Y130.093 E1.17465
G1 X55.938 Y129.558 E.01646
G1 X83.444 Y157.065 E1.19792
G1 X83.979 Y157.065 E.01646
G1 X55.938 Y129.024 E1.2212
G1 X55.938 Y128.489 E.01646
G1 X84.513 Y157.065 E1.24447
G1 X85.048 Y157.065 E.01646
G1 X55.938 Y127.955 E1.26774
G1 X55.938 Y127.421 E.01646
G1 X85.582 Y157.065 E1.29101
G1 X86.117 Y157.065 E.01646
G1 X55.938 Y126.886 E1.31429
G1 X55.938 Y126.352 E.01646
G1 X86.651 Y157.065 E1.33756
G1 X87.185 Y157.065 E.01646
G1 X55.938 Y125.818 E1.36083
G1 X55.938 Y125.283 E.01646
G1 X87.72 Y157.065 E1.38411
G1 X88.254 Y157.065 E.01646
G1 X55.938 Y124.749 E1.40738
G1 X55.938 Y124.214 E.01646
G1 X88.789 Y157.065 E1.43065
G1 X89.323 Y157.065 E.01646
G1 X55.939 Y123.68 E1.45393
G1 X55.939 Y123.146 E.01646
G1 X89.858 Y157.065 E1.4772
G1 X90.392 Y157.065 E.01646
G1 X55.939 Y122.611 E1.50047
G1 X55.939 Y122.077 E.01646
G1 X90.927 Y157.065 E1.52374
G1 X91.461 Y157.065 E.01646
G1 X55.939 Y121.542 E1.54702
G1 X55.939 Y121.008 E.01646
G1 X91.995 Y157.065 E1.57029
G1 X92.53 Y157.065 E.01646
G1 X55.939 Y120.474 E1.59356
G1 X55.939 Y119.939 E.01646
G1 X93.064 Y157.065 E1.61684
G1 X93.599 Y157.065 E.01646
G1 X55.939 Y119.405 E1.64011
G1 X55.939 Y118.87 E.01646
G1 X94.133 Y157.065 E1.66338
G1 X94.668 Y157.065 E.01646
G1 X55.939 Y118.336 E1.68666
G1 X55.939 Y117.802 E.01646
G1 X95.202 Y157.065 E1.70993
G1 X95.737 Y157.065 E.01646
G1 X55.939 Y117.267 E1.7332
G1 X55.939 Y116.733 E.01646
G1 X96.271 Y157.065 E1.75647
G1 X96.805 Y157.065 E.01646
G1 X55.939 Y116.199 E1.77975
G1 X55.939 Y115.664 E.01646
G1 X97.34 Y157.065 E1.80302
G1 X97.874 Y157.065 E.01646
G1 X55.939 Y115.13 E1.82629
G1 X55.94 Y114.595 E.01646
G1 X98.409 Y157.065 E1.84957
G1 X98.943 Y157.065 E.01646
G1 X55.94 Y114.061 E1.87284
G1 X55.94 Y113.527 E.01646
G1 X99.478 Y157.065 E1.89611
G1 X100.012 Y157.065 E.01646
G1 X55.94 Y112.992 E1.91938
G1 X55.94 Y112.458 E.01646
G1 X100.547 Y157.065 E1.94266
G1 X101.081 Y157.065 E.01646
G1 X55.94 Y111.923 E1.96593
G1 X55.94 Y111.389 E.01646
G1 X101.616 Y157.065 E1.9892
G1 X102.15 Y157.065 E.01646
G1 X55.94 Y110.855 E2.01248
G1 X55.94 Y110.32 E.01646
G1 X102.684 Y157.065 E2.03575
G1 X103.219 Y157.065 E.01646
G1 X55.94 Y109.786 E2.05902
G1 X55.94 Y109.251 E.01646
G1 X103.753 Y157.065 E2.0823
G1 X104.288 Y157.065 E.01646
G1 X55.94 Y108.717 E2.10557
G1 X55.94 Y108.183 E.01646
G1 X104.822 Y157.065 E2.12884
G1 X105.357 Y157.065 E.01646
G1 X55.94 Y107.648 E2.15211
G1 X55.94 Y107.114 E.01646
G1 X105.891 Y157.065 E2.17539
G1 X106.426 Y157.065 E.01646
G1 X55.94 Y106.58 E2.19866
G1 X55.94 Y106.045 E.01646
G1 X106.96 Y157.065 E2.22193
G1 X107.494 Y157.065 E.01646
G1 X55.941 Y105.511 E2.24521
G1 X55.941 Y104.976 E.01646
G1 X108.029 Y157.065 E2.26848
G1 X108.563 Y157.065 E.01646
G1 X55.941 Y104.442 E2.29175
G1 X55.941 Y103.908 E.01646
G1 X109.098 Y157.065 E2.31503
G1 X109.632 Y157.065 E.01646
G1 X55.941 Y103.373 E2.3383
G1 X55.941 Y102.839 E.01646
G1 X110.167 Y157.065 E2.36157
G1 X110.701 Y157.065 E.01646
G1 X55.996 Y102.359 E2.38245
G3 X56.093 Y101.922 I1.522 J.111 E.01383
G1 X111.236 Y157.065 E2.40148
G1 X111.77 Y157.065 E.01646
G1 X56.224 Y101.519 E2.41907
G1 X56.388 Y101.148 E.01247
G1 X112.304 Y157.065 E2.4352
G1 X112.839 Y157.065 E.01646
G1 X56.582 Y100.807 E2.45004
G3 X56.81 Y100.501 I1.357 J.771 E.01179
G1 X113.373 Y157.065 E2.46339
G1 X113.908 Y157.065 E.01646
G1 X57.053 Y100.21 E2.47605
G1 X57.327 Y99.949 E.01164
G1 X114.442 Y157.065 E2.48741
G1 X114.977 Y157.065 E.01646
G1 X57.627 Y99.715 E2.49763
G3 X57.944 Y99.498 I.889 J.961 E.01188
G1 X115.511 Y157.065 E2.50708
G1 X116.046 Y157.065 E.01646
G1 X58.3 Y99.319 E2.51487
G3 X58.677 Y99.162 I.824 J1.453 E.01262
G1 X116.58 Y157.065 E2.5217
G1 X117.114 Y157.065 E.01646
G1 X59.093 Y99.043 E2.52689
G3 X59.548 Y98.963 I.63 J2.271 E.01425
G1 X117.649 Y157.065 E2.53034
G1 X118.183 Y157.065 E.01646
G1 X60.054 Y98.935 E2.53157
G1 X60.589 Y98.935 E.01646
G1 X118.718 Y157.065 E2.53157
G1 X119.252 Y157.065 E.01646
G1 X61.123 Y98.935 E2.53157
G1 X61.657 Y98.935 E.01646
G1 X119.787 Y157.065 E2.53157
G1 X120.321 Y157.065 E.01646
G1 X62.192 Y98.935 E2.53157
G1 X62.726 Y98.935 E.01646
G1 X120.856 Y157.065 E2.53157
G1 X121.39 Y157.065 E.01646
G1 X63.261 Y98.935 E2.53157
G1 X63.795 Y98.935 E.01646
G1 X121.924 Y157.065 E2.53157
G1 X122.459 Y157.065 E.01646
G1 X64.33 Y98.935 E2.53157
G1 X64.864 Y98.935 E.01646
G1 X122.993 Y157.065 E2.53157
G1 X123.528 Y157.065 E.01646
G1 X65.399 Y98.935 E2.53157
G1 X65.933 Y98.935 E.01646
G1 X124.062 Y157.065 E2.53157
G1 X124.597 Y157.065 E.01646
G1 X66.467 Y98.935 E2.53157
G1 X67.002 Y98.935 E.01646
G1 X125.131 Y157.065 E2.53157
G1 X125.666 Y157.065 E.01646
G1 X67.536 Y98.935 E2.53157
G1 X68.071 Y98.935 E.01646
G1 X126.2 Y157.065 E2.53157
G1 X126.735 Y157.065 E.01646
G1 X68.605 Y98.935 E2.53157
G1 X69.14 Y98.935 E.01646
G1 X127.269 Y157.065 E2.53157
G1 X127.803 Y157.065 E.01646
G1 X69.674 Y98.935 E2.53157
G1 X70.209 Y98.935 E.01646
G1 X128.338 Y157.065 E2.53157
G1 X128.872 Y157.065 E.01646
G1 X70.743 Y98.935 E2.53157
G1 X71.277 Y98.935 E.01646
G1 X129.407 Y157.065 E2.53157
G1 X129.941 Y157.065 E.01646
G1 X71.812 Y98.935 E2.53157
G1 X72.346 Y98.935 E.01646
G1 X130.476 Y157.065 E2.53157
G1 X131.01 Y157.065 E.01646
G1 X72.881 Y98.935 E2.53157
G1 X73.415 Y98.935 E.01646
G1 X131.545 Y157.065 E2.53157
M73 P26 R35
G1 X132.079 Y157.065 E.01646
G1 X73.95 Y98.935 E2.53157
G1 X74.484 Y98.935 E.01646
G1 X132.613 Y157.065 E2.53157
G1 X133.148 Y157.065 E.01646
G1 X75.019 Y98.935 E2.53157
G1 X75.553 Y98.935 E.01646
G1 X133.682 Y157.065 E2.53157
G1 X134.217 Y157.065 E.01646
G1 X76.088 Y98.935 E2.53157
G1 X76.622 Y98.935 E.01646
G1 X134.751 Y157.065 E2.53157
G1 X135.286 Y157.065 E.01646
G1 X77.156 Y98.935 E2.53157
G1 X77.691 Y98.935 E.01646
G1 X135.82 Y157.065 E2.53157
G1 X136.355 Y157.065 E.01646
G1 X78.225 Y98.935 E2.53157
G1 X78.76 Y98.935 E.01646
G1 X136.889 Y157.065 E2.53157
G1 X137.423 Y157.065 E.01646
G1 X79.294 Y98.935 E2.53157
G1 X79.829 Y98.935 E.01646
G1 X137.958 Y157.065 E2.53157
G1 X138.492 Y157.065 E.01646
G1 X80.363 Y98.935 E2.53157
G1 X80.898 Y98.935 E.01646
G1 X139.027 Y157.065 E2.53157
G1 X139.561 Y157.065 E.01646
G1 X81.432 Y98.935 E2.53157
G1 X81.966 Y98.935 E.01646
G1 X140.096 Y157.065 E2.53157
G1 X140.63 Y157.065 E.01646
G1 X82.501 Y98.935 E2.53157
G1 X83.035 Y98.935 E.01646
G1 X141.165 Y157.065 E2.53157
G1 X141.699 Y157.065 E.01646
G1 X83.57 Y98.935 E2.53157
G1 X84.104 Y98.935 E.01646
G1 X142.233 Y157.065 E2.53157
G1 X142.768 Y157.065 E.01646
G1 X84.639 Y98.935 E2.53157
G1 X85.173 Y98.935 E.01646
G1 X143.302 Y157.065 E2.53157
G1 X143.837 Y157.065 E.01646
G1 X85.708 Y98.935 E2.53157
G1 X86.242 Y98.935 E.01646
G1 X144.371 Y157.065 E2.53157
G1 X144.906 Y157.065 E.01646
G1 X86.776 Y98.935 E2.53157
G1 X87.311 Y98.935 E.01646
G1 X145.44 Y157.065 E2.53157
G1 X145.975 Y157.065 E.01646
G1 X87.845 Y98.935 E2.53157
G1 X88.38 Y98.935 E.01646
G1 X146.509 Y157.065 E2.53157
G1 X147.043 Y157.065 E.01646
G1 X88.914 Y98.935 E2.53157
G1 X89.449 Y98.935 E.01646
G1 X147.578 Y157.065 E2.53157
G1 X148.112 Y157.065 E.01646
G1 X89.983 Y98.935 E2.53157
G1 X90.518 Y98.935 E.01646
G1 X148.647 Y157.065 E2.53157
G1 X149.181 Y157.065 E.01646
G1 X91.052 Y98.935 E2.53157
G1 X91.587 Y98.935 E.01646
G1 X149.716 Y157.065 E2.53157
G1 X150.25 Y157.065 E.01646
G1 X92.121 Y98.935 E2.53157
G1 X92.655 Y98.935 E.01646
G1 X150.785 Y157.065 E2.53157
G1 X151.319 Y157.065 E.01646
G1 X93.19 Y98.935 E2.53157
G1 X93.724 Y98.935 E.01646
G1 X151.854 Y157.065 E2.53156
G1 X152.388 Y157.065 E.01646
G1 X94.259 Y98.935 E2.53156
G1 X94.793 Y98.935 E.01646
G1 X152.922 Y157.065 E2.53156
G1 X153.457 Y157.065 E.01646
G1 X95.328 Y98.935 E2.53156
G1 X95.862 Y98.935 E.01646
G1 X153.991 Y157.065 E2.53156
G1 X154.526 Y157.065 E.01646
G1 X96.397 Y98.935 E2.53156
G1 X96.931 Y98.935 E.01646
G1 X155.06 Y157.065 E2.53156
G1 X155.595 Y157.065 E.01646
G1 X97.465 Y98.935 E2.53156
G1 X98 Y98.935 E.01646
G1 X156.129 Y157.065 E2.53156
G1 X156.664 Y157.065 E.01646
G1 X98.534 Y98.935 E2.53156
G1 X99.069 Y98.935 E.01646
G1 X157.198 Y157.065 E2.53156
G1 X157.732 Y157.065 E.01646
G1 X99.603 Y98.935 E2.53156
G1 X100.138 Y98.935 E.01646
G1 X158.267 Y157.065 E2.53156
G1 X158.801 Y157.065 E.01646
G1 X100.672 Y98.935 E2.53156
G1 X101.207 Y98.935 E.01646
G1 X159.336 Y157.065 E2.53156
M73 P26 R34
G1 X159.87 Y157.065 E.01646
G1 X101.741 Y98.935 E2.53156
G1 X102.275 Y98.935 E.01646
G1 X160.405 Y157.065 E2.53156
G1 X160.939 Y157.065 E.01646
G1 X102.81 Y98.935 E2.53156
G1 X103.344 Y98.935 E.01646
G1 X161.474 Y157.065 E2.53156
G1 X162.008 Y157.065 E.01646
G1 X103.879 Y98.935 E2.53156
G1 X104.413 Y98.935 E.01646
G1 X162.542 Y157.065 E2.53156
G1 X163.077 Y157.065 E.01646
G1 X104.948 Y98.935 E2.53156
G1 X105.482 Y98.935 E.01646
G1 X163.611 Y157.065 E2.53156
G1 X164.146 Y157.065 E.01646
G1 X106.017 Y98.935 E2.53156
G1 X106.551 Y98.935 E.01646
G1 X164.68 Y157.065 E2.53156
G1 X165.215 Y157.065 E.01646
G1 X107.086 Y98.935 E2.53156
G1 X107.62 Y98.935 E.01646
G1 X165.749 Y157.065 E2.53156
G1 X166.284 Y157.065 E.01646
G1 X108.154 Y98.935 E2.53156
G1 X108.689 Y98.935 E.01646
G1 X166.818 Y157.065 E2.53156
G1 X167.352 Y157.065 E.01646
G1 X109.223 Y98.935 E2.53156
G1 X109.758 Y98.935 E.01646
G1 X167.887 Y157.065 E2.53156
G1 X168.421 Y157.065 E.01646
G1 X110.292 Y98.935 E2.53156
G1 X110.827 Y98.935 E.01646
G1 X168.956 Y157.065 E2.53156
G1 X169.49 Y157.065 E.01646
G1 X111.361 Y98.936 E2.53156
G1 X111.896 Y98.936 E.01646
G1 X170.025 Y157.065 E2.53156
G1 X170.559 Y157.065 E.01646
G1 X112.43 Y98.936 E2.53156
G1 X112.964 Y98.936 E.01646
G1 X171.094 Y157.065 E2.53156
G1 X171.628 Y157.065 E.01646
G1 X113.499 Y98.936 E2.53156
G1 X114.033 Y98.936 E.01646
G1 X172.163 Y157.065 E2.53156
G1 X172.697 Y157.065 E.01646
G1 X114.568 Y98.936 E2.53156
G1 X115.102 Y98.936 E.01646
G1 X173.231 Y157.065 E2.53156
M73 P27 R34
G1 X173.766 Y157.065 E.01646
G1 X115.637 Y98.936 E2.53156
G1 X116.171 Y98.936 E.01646
G1 X174.3 Y157.065 E2.53156
G1 X174.835 Y157.065 E.01646
G1 X116.706 Y98.936 E2.53156
G1 X117.24 Y98.936 E.01646
G1 X175.369 Y157.065 E2.53156
G1 X175.904 Y157.065 E.01646
G1 X117.774 Y98.936 E2.53156
G1 X118.309 Y98.936 E.01646
G1 X176.438 Y157.065 E2.53156
G1 X176.973 Y157.065 E.01646
G1 X118.843 Y98.936 E2.53156
G1 X119.378 Y98.936 E.01646
G1 X177.507 Y157.065 E2.53156
G1 X178.041 Y157.065 E.01646
G1 X119.912 Y98.936 E2.53156
G1 X120.447 Y98.936 E.01646
G1 X178.576 Y157.065 E2.53156
G1 X179.11 Y157.065 E.01646
G1 X120.981 Y98.936 E2.53156
G1 X121.516 Y98.936 E.01646
G1 X179.645 Y157.065 E2.53156
G1 X180.179 Y157.065 E.01646
G1 X122.05 Y98.936 E2.53156
G1 X122.585 Y98.936 E.01646
G1 X180.714 Y157.065 E2.53156
G1 X181.248 Y157.065 E.01646
G1 X123.119 Y98.936 E2.53156
G1 X123.653 Y98.936 E.01646
G1 X181.783 Y157.065 E2.53156
G1 X182.317 Y157.065 E.01646
G1 X124.188 Y98.936 E2.53156
G1 X124.722 Y98.936 E.01646
G1 X182.851 Y157.065 E2.53156
G1 X183.386 Y157.065 E.01646
G1 X125.257 Y98.936 E2.53156
G1 X125.791 Y98.936 E.01646
G1 X183.92 Y157.065 E2.53156
G1 X184.455 Y157.065 E.01646
G1 X126.326 Y98.936 E2.53156
G1 X126.86 Y98.936 E.01646
G1 X184.989 Y157.065 E2.53156
G1 X185.524 Y157.065 E.01646
G1 X127.395 Y98.936 E2.53156
G1 X127.929 Y98.936 E.01646
G1 X186.058 Y157.065 E2.53156
G1 X186.593 Y157.065 E.01646
G1 X128.463 Y98.936 E2.53156
G1 X128.998 Y98.936 E.01646
G1 X187.127 Y157.065 E2.53156
G1 X187.661 Y157.065 E.01646
G1 X129.532 Y98.936 E2.53156
G1 X130.067 Y98.936 E.01646
G1 X188.196 Y157.065 E2.53156
G1 X188.73 Y157.065 E.01646
G1 X130.601 Y98.936 E2.53156
G1 X131.136 Y98.936 E.01646
G1 X189.265 Y157.065 E2.53156
G1 X189.799 Y157.065 E.01646
G1 X131.67 Y98.936 E2.53156
G1 X132.205 Y98.936 E.01646
G1 X190.334 Y157.065 E2.53156
G1 X190.868 Y157.065 E.01646
G1 X132.739 Y98.936 E2.53156
G1 X133.273 Y98.936 E.01646
G1 X191.403 Y157.065 E2.53156
G1 X191.937 Y157.065 E.01646
G1 X133.808 Y98.936 E2.53156
G1 X134.342 Y98.936 E.01646
G1 X192.471 Y157.065 E2.53156
G1 X193.006 Y157.065 E.01646
G1 X134.877 Y98.936 E2.53156
G1 X135.411 Y98.936 E.01646
G1 X193.54 Y157.065 E2.53156
G1 X194.075 Y157.065 E.01646
G1 X135.946 Y98.936 E2.53156
G1 X136.48 Y98.936 E.01646
G1 X194.609 Y157.065 E2.53156
G1 X195.144 Y157.065 E.01646
G1 X137.015 Y98.936 E2.53156
G1 X137.549 Y98.936 E.01646
G1 X195.678 Y157.065 E2.53156
G1 X196.213 Y157.065 E.01646
G1 X138.084 Y98.936 E2.53156
G1 X138.618 Y98.936 E.01646
G1 X196.747 Y157.065 E2.53156
G1 X197.282 Y157.065 E.01646
G1 X139.152 Y98.936 E2.53156
G1 X139.687 Y98.936 E.01646
G1 X197.816 Y157.065 E2.53156
G1 X198.35 Y157.065 E.01646
G1 X140.221 Y98.936 E2.53156
G1 X140.756 Y98.936 E.01646
G1 X198.885 Y157.065 E2.53156
G1 X199.419 Y157.065 E.01646
G1 X141.29 Y98.936 E2.53156
G1 X141.825 Y98.936 E.01646
G1 X199.954 Y157.065 E2.53156
G2 X200.459 Y157.036 I-.254 J-8.794 E.01559
G1 X142.359 Y98.936 E2.53029
G1 X142.894 Y98.936 E.01646
G1 X200.914 Y156.956 E2.52681
G2 X201.328 Y156.836 I-.401 J-2.165 E.01331
G1 X143.428 Y98.936 E2.5216
G1 X143.962 Y98.936 E.01646
G1 X201.705 Y156.679 E2.51474
G1 X202.061 Y156.5 E.01226
G1 X144.497 Y98.936 E2.50695
G1 X145.031 Y98.936 E.01646
G1 X202.378 Y156.282 E2.49748
G2 X202.677 Y156.047 I-.643 J-1.126 E.01176
G1 X145.566 Y98.936 E2.48723
G1 X146.1 Y98.936 E.01646
G1 X202.951 Y155.786 E2.47588
G2 X203.194 Y155.495 I-.861 J-.965 E.01173
G1 X146.635 Y98.936 E2.46318
G1 X147.169 Y98.936 E.01646
G1 X203.421 Y155.188 E2.44981
G2 X203.614 Y154.846 I-1.287 J-.954 E.01211
G1 X147.704 Y98.936 E2.43495
G1 X148.238 Y98.936 E.01646
G1 X203.779 Y154.476 E2.41882
G2 X203.908 Y154.071 I-1.299 J-.64 E.01313
G1 X148.773 Y98.936 E2.4012
G1 X149.307 Y98.936 E.01646
G1 X204.005 Y153.634 E2.38214
G1 X204.059 Y153.153 E.01489
G1 X149.841 Y98.936 E2.36122
G1 X150.376 Y98.936 E.01646
G1 X204.059 Y152.619 E2.33794
G1 X204.059 Y152.085 E.01646
G1 X150.91 Y98.936 E2.31467
G1 X151.445 Y98.936 E.01646
G1 X204.059 Y151.55 E2.29139
G1 X204.059 Y151.016 E.01646
G1 X151.979 Y98.936 E2.26812
G1 X152.514 Y98.936 E.01646
G1 X204.059 Y150.481 E2.24484
G1 X204.059 Y149.947 E.01646
G1 X153.048 Y98.936 E2.22157
G1 X153.583 Y98.936 E.01646
G1 X204.059 Y149.412 E2.19829
G1 X204.059 Y148.878 E.01646
G1 X154.117 Y98.936 E2.17501
G1 X154.651 Y98.936 E.01646
G1 X204.059 Y148.343 E2.15174
G1 X204.059 Y147.809 E.01646
G1 X155.186 Y98.936 E2.12846
G1 X155.72 Y98.936 E.01646
G1 X204.059 Y147.274 E2.10519
G1 X204.059 Y146.74 E.01646
G1 X156.255 Y98.936 E2.08191
G1 X156.789 Y98.936 E.01646
G1 X204.059 Y146.206 E2.05864
G1 X204.059 Y145.671 E.01646
G1 X157.324 Y98.936 E2.03536
M73 P28 R34
G1 X157.858 Y98.936 E.01646
G1 X204.059 Y145.137 E2.01209
G1 X204.059 Y144.602 E.01646
G1 X158.393 Y98.936 E1.98881
G1 X158.927 Y98.936 E.01646
G1 X204.059 Y144.068 E1.96553
G1 X204.059 Y143.533 E.01646
G1 X159.461 Y98.936 E1.94226
G1 X159.996 Y98.936 E.01646
G1 X204.059 Y142.999 E1.91898
G1 X204.059 Y142.464 E.01646
G1 X160.53 Y98.936 E1.89571
G1 X161.065 Y98.936 E.01646
G1 X204.059 Y141.93 E1.87243
G1 X204.059 Y141.396 E.01646
G1 X161.599 Y98.936 E1.84916
G1 X162.134 Y98.936 E.01646
G1 X204.059 Y140.861 E1.82588
G1 X204.059 Y140.327 E.01646
G1 X162.668 Y98.936 E1.80261
G1 X163.203 Y98.936 E.01646
G1 X204.059 Y139.792 E1.77933
G1 X204.059 Y139.258 E.01646
G1 X163.737 Y98.936 E1.75605
G1 X164.272 Y98.936 E.01646
G1 X204.059 Y138.723 E1.73278
G1 X204.059 Y138.189 E.01646
G1 X164.806 Y98.936 E1.7095
G1 X165.34 Y98.936 E.01646
G1 X204.059 Y137.654 E1.68623
G1 X204.059 Y137.12 E.01646
G1 X165.875 Y98.936 E1.66295
G1 X166.409 Y98.936 E.01646
G1 X204.059 Y136.586 E1.63968
G1 X204.059 Y136.051 E.01646
G1 X166.944 Y98.936 E1.6164
G1 X167.478 Y98.936 E.01646
G1 X204.059 Y135.517 E1.59313
G1 X204.059 Y134.982 E.01646
G1 X168.013 Y98.936 E1.56985
G1 X168.547 Y98.936 E.01646
G1 X204.059 Y134.448 E1.54657
G1 X204.059 Y133.913 E.01646
G1 X169.082 Y98.936 E1.5233
G1 X169.616 Y98.936 E.01646
G1 X204.059 Y133.379 E1.50002
G1 X204.059 Y132.844 E.01646
G1 X170.15 Y98.936 E1.47675
G1 X170.685 Y98.936 E.01646
G1 X204.059 Y132.31 E1.45347
G1 X204.059 Y131.776 E.01646
G1 X171.219 Y98.936 E1.4302
G1 X171.754 Y98.936 E.01646
G1 X204.059 Y131.241 E1.40692
G1 X204.059 Y130.707 E.01646
G1 X172.288 Y98.936 E1.38364
G1 X172.823 Y98.936 E.01646
G1 X204.059 Y130.172 E1.36037
G1 X204.059 Y129.638 E.01646
G1 X173.357 Y98.936 E1.33709
G1 X173.892 Y98.936 E.01646
G1 X204.059 Y129.103 E1.31382
G1 X204.059 Y128.569 E.01646
G1 X174.426 Y98.936 E1.29054
G1 X174.96 Y98.936 E.01646
G1 X204.059 Y128.034 E1.26727
G1 X204.059 Y127.5 E.01646
G1 X175.495 Y98.936 E1.24399
G1 X176.029 Y98.936 E.01646
G1 X204.059 Y126.965 E1.22072
G1 X204.059 Y126.431 E.01646
G1 X176.564 Y98.936 E1.19744
G1 X177.098 Y98.936 E.01646
G1 X204.059 Y125.897 E1.17416
G1 X204.059 Y125.362 E.01646
G1 X177.633 Y98.936 E1.15089
G1 X178.167 Y98.936 E.01646
G1 X204.059 Y124.828 E1.12761
G1 X204.059 Y124.293 E.01646
G1 X178.702 Y98.936 E1.10434
G1 X179.236 Y98.936 E.01646
G1 X204.059 Y123.759 E1.08106
G1 X204.059 Y123.224 E.01646
G1 X179.771 Y98.936 E1.05779
G1 X180.305 Y98.936 E.01646
G1 X204.059 Y122.69 E1.03451
G1 X204.059 Y122.155 E.01646
G1 X180.839 Y98.936 E1.01124
G1 X181.374 Y98.936 E.01646
G1 X204.059 Y121.621 E.98796
G1 X204.059 Y121.087 E.01646
G1 X181.908 Y98.936 E.96468
G1 X182.443 Y98.936 E.01646
G1 X204.059 Y120.552 E.94141
G1 X204.059 Y120.018 E.01646
G1 X182.977 Y98.936 E.91813
G1 X183.512 Y98.936 E.01646
G1 X204.059 Y119.483 E.89486
G1 X204.059 Y118.949 E.01646
G1 X184.046 Y98.936 E.87158
G1 X184.581 Y98.936 E.01646
G1 X204.059 Y118.414 E.84831
G1 X204.059 Y117.88 E.01646
G1 X185.115 Y98.936 E.82503
G1 X185.649 Y98.936 E.01646
G1 X204.059 Y117.345 E.80176
G1 X204.059 Y116.811 E.01646
G1 X186.184 Y98.936 E.77848
G1 X186.718 Y98.936 E.01646
G1 X204.059 Y116.277 E.7552
G1 X204.059 Y115.742 E.01646
G1 X187.253 Y98.936 E.73193
G1 X187.787 Y98.936 E.01646
G1 X204.059 Y115.208 E.70865
G1 X204.059 Y114.673 E.01646
G1 X188.322 Y98.936 E.68538
G1 X188.856 Y98.936 E.01646
G1 X204.059 Y114.139 E.6621
G1 X204.059 Y113.604 E.01646
G1 X189.391 Y98.936 E.63883
G1 X189.925 Y98.936 E.01646
G1 X204.059 Y113.07 E.61555
G1 X204.059 Y112.535 E.01646
G1 X190.459 Y98.936 E.59228
G1 X190.994 Y98.936 E.01646
G1 X204.059 Y112.001 E.569
G1 X204.059 Y111.467 E.01646
G1 X191.528 Y98.936 E.54572
G1 X192.063 Y98.936 E.01646
G1 X204.059 Y110.932 E.52245
G1 X204.059 Y110.398 E.01646
G1 X192.597 Y98.936 E.49917
G1 X193.132 Y98.936 E.01646
G1 X204.059 Y109.863 E.4759
G1 X204.059 Y109.329 E.01646
G1 X193.666 Y98.936 E.45262
G1 X194.201 Y98.936 E.01646
G1 X204.059 Y108.794 E.42935
G1 X204.059 Y108.26 E.01646
G1 X194.735 Y98.936 E.40607
G1 X195.27 Y98.936 E.01646
G1 X204.059 Y107.725 E.38279
G1 X204.059 Y107.191 E.01646
G1 X195.804 Y98.936 E.35952
G1 X196.338 Y98.936 E.01646
G1 X204.059 Y106.657 E.33624
G1 X204.059 Y106.122 E.01646
G1 X196.873 Y98.936 E.31297
G1 X197.407 Y98.936 E.01646
G1 X204.059 Y105.588 E.28969
G1 X204.059 Y105.053 E.01646
G1 X197.942 Y98.936 E.26642
G1 X198.476 Y98.936 E.01646
G1 X204.059 Y104.519 E.24314
G1 X204.059 Y103.984 E.01646
G1 X199.011 Y98.936 E.21987
G1 X199.545 Y98.936 E.01646
G1 X204.059 Y103.45 E.19659
G1 X204.059 Y102.915 E.01646
G1 X200.084 Y98.94 E.17314
G3 X200.675 Y98.996 I.006 J3.047 E.01832
G1 X204.005 Y102.326 E.14502
G2 X203.8 Y101.587 I-3.039 J.444 E.02368
G1 X201.404 Y99.191 E.10436
G3 X202.578 Y99.858 I-1.334 J3.715 E.0418
G3 X203.708 Y100.961 I-10.658 J12.053 E.04864
M106 S237.15
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X202.87 Y100.123 E-.4504
G1 X202.578 Y99.858 E-.14971
G1 X202.258 Y99.621 E-.15154
G1 X202.239 Y99.61 E-.00834
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/105
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
G3 Z1 I-.025 J-1.217 P1  F30000
G1 X55.624 Y102.569 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
M73 P28 R33
G1 X200.017 Y98.603 E4.64438
G3 X204.398 Y103.007 I-.029 J4.41 E.22865
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.411 J-.006 E.22946
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I.005 J-4.41 E.22947
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.233 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X55.234 Y102.531 E.00005
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.022 Y98.211 E4.3024
G3 X204.79 Y103.003 I-.035 J4.803 E.23041
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.804 J-.012 E.23117
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.011 J-4.803 E.23118
G1 X55.21 Y103.003 E1.5362
G1 X55.23 Y102.591 E.01265
M204 S10000
; WIPE_START
G1 F24000
G1 X55.234 Y102.531 E-.02312
G1 X55.302 Y102.066 E-.17842
G1 X55.416 Y101.61 E-.17881
G1 X55.575 Y101.167 E-.17862
G1 X55.776 Y100.742 E-.17862
G1 X55.806 Y100.691 E-.02242
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.212 J.107 P1  F30000
G1 X60.783 Y157.05 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X59.162 Y156.95 I-.391 J-6.862 E.05399
G1 X56.038 Y153.825 E.14659
G2 X56.666 Y155.278 I5.605 J-1.562 E.05268
G1 X112.994 Y98.951 E2.64244
G1 X116.303 Y98.951 E.10976
G1 X174.402 Y157.05 E2.72555
G1 X177.71 Y157.05 E.10975
G1 X204.044 Y130.715 E1.23539
G1 X204.044 Y132.96 E.07447
G1 X170.035 Y98.951 E1.59546
G1 X166.725 Y98.951 E.10978
G1 X108.626 Y157.05 E2.72554
G1 X105.318 Y157.05 E.10975
G1 X55.955 Y107.687 E2.3157
G1 X55.955 Y109.933 E.07451
G1 X66.938 Y98.95 E.51523
G1 X70.247 Y98.95 E.10975
G1 X128.346 Y157.05 E2.72556
G1 X131.654 Y157.05 E.10975
G1 X189.753 Y98.951 E2.72553
G1 X193.063 Y98.951 E.10978
G1 X204.044 Y109.933 E.51517
G1 X204.044 Y107.688 E.07447
G1 X154.682 Y157.05 E2.31568
G1 X151.374 Y157.05 E.10975
G1 X93.275 Y98.95 E2.72555
G1 X89.966 Y98.95 E.10976
G1 X55.953 Y132.964 E1.59563
G1 X55.953 Y130.712 E.07468
G1 X82.29 Y157.05 E1.23553
G1 X85.598 Y157.05 E.10975
G1 X143.697 Y98.951 E2.72554
G1 X147.007 Y98.951 E.10977
G1 X203.339 Y155.284 E2.64269
G2 X203.95 Y153.838 I-2.802 J-2.035 E.05253
G1 X200.825 Y156.962 E.14659
G3 X200.397 Y157.03 I-.555 J-2.14 E.0144
G3 X197.429 Y157.05 I-1.69 J-30.451 E.09848
G1 X139.331 Y98.951 E2.72554
G1 X136.021 Y98.951 E.10977
G1 X77.922 Y157.05 E2.72554
G1 X74.614 Y157.05 E.10975
G1 X55.952 Y138.388 E.87548
G1 X55.952 Y140.641 E.07474
G1 X97.642 Y98.951 E1.95577
G1 X100.951 Y98.951 E.10976
G1 X159.05 Y157.05 E2.72555
G1 X162.358 Y157.05 E.10975
G1 X204.044 Y115.364 E1.95558
G1 X204.044 Y117.609 E.07447
G1 X185.387 Y98.951 E.87527
G1 X182.077 Y98.951 E.10978
G1 X123.978 Y157.05 E2.72553
G1 X120.67 Y157.05 E.10975
G1 X62.571 Y98.95 E2.72556
G1 X60.016 Y98.95 E.08474
G2 X59.175 Y99.038 I.112 J5.176 E.02808
G1 X56.04 Y102.173 E.14707
M73 P29 R33
G3 X56.661 Y100.716 I6.292 J1.822 E.05264
G1 X112.994 Y157.05 E2.64271
G1 X116.302 Y157.05 E.10975
G1 X174.401 Y98.951 E2.72554
G1 X177.711 Y98.951 E.10978
G1 X204.044 Y125.285 E1.23537
G1 X204.044 Y123.04 E.07447
G1 X170.034 Y157.05 E1.59549
G1 X166.726 Y157.05 E.10975
G1 X108.627 Y98.951 E2.72555
G1 X105.318 Y98.951 E.10976
G1 X55.951 Y148.317 E2.3159
G1 X55.951 Y146.063 E.07479
G1 X66.938 Y157.05 E.51542
G1 X70.246 Y157.05 E.10975
G1 X128.345 Y98.951 E2.72554
G1 X131.655 Y98.951 E.10977
G1 X189.754 Y157.05 E2.72554
G1 X193.062 Y157.05 E.10975
G1 X204.044 Y146.067 E.5152
G1 X204.044 Y148.312 E.07447
G1 X154.683 Y98.951 E2.31566
G1 X151.373 Y98.951 E.10977
G1 X93.274 Y157.05 E2.72554
G1 X89.966 Y157.05 E.10975
G1 X55.954 Y123.037 E1.59559
G1 X55.953 Y125.287 E.07463
G1 X82.29 Y98.95 E1.2355
G1 X85.599 Y98.95 E.10975
G1 X143.698 Y157.05 E2.72555
G1 X147.006 Y157.05 E.10975
G1 X203.341 Y100.715 E2.64276
G3 X203.958 Y102.171 I-3.438 J2.319 E.05278
G1 X200.825 Y99.038 E.14699
G2 X200.397 Y98.97 I-.555 J2.142 E.01441
G2 X197.429 Y98.951 I-1.678 J29.587 E.09849
G1 X139.33 Y157.05 E2.72553
G1 X136.022 Y157.05 E.10975
G1 X77.923 Y98.95 E2.72555
G1 X74.614 Y98.95 E.10975
G1 X55.954 Y117.61 E.87537
G1 X55.954 Y115.362 E.07457
G1 X97.642 Y157.05 E1.95565
G1 X100.95 Y157.05 E.10975
G1 X159.049 Y98.951 E2.72554
G1 X162.359 Y98.951 E.10977
G1 X204.044 Y140.636 E1.95556
G1 X204.044 Y138.391 E.07447
G1 X185.386 Y157.05 E.8753
G1 X182.078 Y157.05 E.10975
G1 X123.979 Y98.951 E2.72555
G1 X120.67 Y98.951 E.10976
G1 X62.57 Y157.05 E2.72555
G1 X64.199 Y157.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X62.57 Y157.05 E-.61876
G1 X62.833 Y156.787 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/105
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
G3 Z1.2 I1.206 J-.16 P1  F30000
G1 X55.625 Y102.569 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.21489
G1 X200.024 Y98.603 E4.64461
G3 X204.398 Y103.007 I-.036 J4.41 E.22841
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.411 J-.006 E.22946
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I.005 J-4.41 E.22948
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.233 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X55.234 Y102.531 E.00005
G3 X60.003 Y98.21 I4.78 J.484 E.21664
G1 X200.029 Y98.211 E4.30262
G3 X204.79 Y103.003 I-.042 J4.803 E.23019
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.804 J-.012 E.23117
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.011 J-4.803 E.23118
G1 X55.21 Y103.003 E1.5362
G1 X55.23 Y102.591 E.01265
M204 S10000
; WIPE_START
G1 F24000
G1 X55.234 Y102.531 E-.0231
G1 X55.302 Y102.066 E-.1786
G1 X55.416 Y101.61 E-.17862
G1 X55.575 Y101.167 E-.17863
G1 X55.776 Y100.742 E-.17862
G1 X55.806 Y100.691 E-.02243
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.212 J.107 P1  F30000
G1 X60.783 Y157.05 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X59.162 Y156.95 I-.391 J-6.873 E.05399
G1 X56.038 Y153.825 E.14659
G2 X56.666 Y155.278 I5.605 J-1.562 E.05268
G1 X112.994 Y98.951 E2.64244
G1 X116.303 Y98.951 E.10977
G1 X174.402 Y157.05 E2.72554
G1 X177.71 Y157.05 E.10975
G1 X204.044 Y130.715 E1.23539
G1 X204.044 Y132.961 E.07447
G1 X170.035 Y98.951 E1.59546
G1 X166.725 Y98.951 E.10979
G1 X108.626 Y157.05 E2.72553
G1 X105.318 Y157.05 E.10975
G1 X55.955 Y107.687 E2.3157
G1 X55.955 Y109.933 E.07451
G1 X66.938 Y98.95 E.51523
G1 X70.247 Y98.95 E.10975
G1 X128.346 Y157.05 E2.72556
G1 X131.654 Y157.05 E.10975
G1 X189.753 Y98.951 E2.72553
G1 X193.063 Y98.951 E.10979
G1 X204.044 Y109.933 E.51516
G1 X204.044 Y107.688 E.07447
G1 X154.682 Y157.05 E2.31568
G1 X151.374 Y157.05 E.10975
G1 X93.275 Y98.951 E2.72555
G1 X89.966 Y98.951 E.10976
G1 X55.953 Y132.964 E1.59563
G1 X55.953 Y130.712 E.07468
G1 X82.29 Y157.05 E1.23553
G1 X85.598 Y157.05 E.10975
G1 X143.697 Y98.951 E2.72554
G1 X147.007 Y98.951 E.10978
G1 X203.339 Y155.284 E2.64268
G2 X203.95 Y153.838 I-2.8 J-2.034 E.05252
G1 X200.825 Y156.962 E.14659
G3 X200.397 Y157.03 I-.555 J-2.14 E.0144
G3 X197.429 Y157.05 I-1.69 J-30.451 E.09848
G1 X139.331 Y98.951 E2.72554
G1 X136.021 Y98.951 E.10977
G1 X77.922 Y157.05 E2.72554
G1 X74.614 Y157.05 E.10975
G1 X55.952 Y138.388 E.87548
G1 X55.952 Y140.641 E.07474
G1 X97.642 Y98.951 E1.95576
G1 X100.951 Y98.951 E.10976
G1 X159.05 Y157.05 E2.72555
G1 X162.358 Y157.05 E.10975
G1 X204.044 Y115.364 E1.95558
G1 X204.044 Y117.609 E.07447
G1 X185.387 Y98.951 E.87526
G1 X182.077 Y98.951 E.10979
G1 X123.978 Y157.05 E2.72553
G1 X120.67 Y157.05 E.10975
G1 X62.571 Y98.95 E2.72556
G1 X60.016 Y98.95 E.08474
G2 X59.175 Y99.038 I.112 J5.176 E.02808
G1 X56.04 Y102.173 E.14708
G3 X56.661 Y100.716 I6.299 J1.825 E.05265
G1 X112.994 Y157.05 E2.64271
G1 X116.302 Y157.05 E.10975
G1 X174.401 Y98.951 E2.72553
G1 X177.711 Y98.951 E.10979
G1 X204.044 Y125.285 E1.23536
G1 X204.044 Y123.04 E.07447
G1 X170.034 Y157.05 E1.59549
G1 X166.726 Y157.05 E.10975
G1 X108.627 Y98.951 E2.72555
G1 X105.318 Y98.951 E.10976
G1 X55.951 Y148.317 E2.3159
G1 X55.951 Y146.063 E.07479
G1 X66.938 Y157.05 E.51542
G1 X70.246 Y157.05 E.10975
G1 X128.345 Y98.951 E2.72554
G1 X131.655 Y98.951 E.10977
G1 X189.754 Y157.05 E2.72554
G1 X193.062 Y157.05 E.10975
G1 X204.044 Y146.067 E.5152
G1 X204.044 Y148.312 E.07447
G1 X154.683 Y98.951 E2.31565
G1 X151.373 Y98.951 E.10978
G1 X93.274 Y157.05 E2.72554
G1 X89.966 Y157.05 E.10975
G1 X55.954 Y123.037 E1.59559
G1 X55.953 Y125.287 E.07463
G1 X82.29 Y98.95 E1.2355
G1 X85.599 Y98.95 E.10976
G1 X143.698 Y157.05 E2.72555
G1 X147.006 Y157.05 E.10975
G1 X203.341 Y100.715 E2.64276
G3 X203.958 Y102.171 I-3.438 J2.318 E.05278
G1 X200.825 Y99.038 E.14699
G2 X200.397 Y98.97 I-.555 J2.141 E.01441
G2 X197.429 Y98.951 I-1.675 J29.332 E.09849
G1 X139.33 Y157.05 E2.72552
G1 X136.022 Y157.05 E.10975
G1 X77.923 Y98.95 E2.72555
G1 X74.614 Y98.95 E.10975
G1 X55.954 Y117.61 E.87537
G1 X55.954 Y115.362 E.07457
G1 X97.642 Y157.05 E1.95565
G1 X100.95 Y157.05 E.10975
G1 X159.049 Y98.951 E2.72553
G1 X162.359 Y98.951 E.10978
G1 X204.044 Y140.636 E1.95556
G1 X204.044 Y138.391 E.07447
G1 X185.386 Y157.05 E.8753
G1 X182.078 Y157.05 E.10975
G1 X123.979 Y98.951 E2.72554
G1 X120.669 Y98.951 E.10977
G1 X62.57 Y157.05 E2.72554
G1 X64.199 Y157.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X62.57 Y157.05 E-.61876
G1 X62.833 Y156.787 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/105
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
G3 Z1.4 I1.206 J-.16 P1  F30000
G1 X55.624 Y102.569 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
M73 P30 R33
G1 X200.031 Y98.603 E4.64484
G3 X204.398 Y103.007 I-.043 J4.41 E.22818
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.411 J-.006 E.22946
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I.005 J-4.41 E.22948
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.233 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X55.234 Y102.531 E.00004
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.036 Y98.211 E4.30284
G3 X204.79 Y103.003 I-.049 J4.803 E.22998
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.804 J-.012 E.23117
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.01 J-4.803 E.23118
G1 X55.21 Y103.003 E1.5362
G1 X55.23 Y102.591 E.01265
M204 S10000
; WIPE_START
G1 F24000
G1 X55.234 Y102.531 E-.02308
G1 X55.302 Y102.066 E-.1786
G1 X55.416 Y101.61 E-.17864
G1 X55.575 Y101.167 E-.17862
G1 X55.759 Y100.776 E-.16425
G1 X55.808 Y100.692 E-.03682
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.212 J.107 P1  F30000
G1 X60.783 Y157.05 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X59.162 Y156.95 I-.391 J-6.873 E.05399
G1 X56.038 Y153.825 E.1466
G2 X56.666 Y155.278 I5.605 J-1.562 E.05268
G1 X112.994 Y98.951 E2.64244
G1 X116.303 Y98.951 E.10977
G1 X174.402 Y157.05 E2.72554
G1 X177.71 Y157.05 E.10975
G1 X204.044 Y130.716 E1.23539
G1 X204.044 Y132.96 E.07447
G1 X170.035 Y98.951 E1.59545
G1 X166.725 Y98.951 E.10979
G1 X108.626 Y157.05 E2.72552
G1 X105.318 Y157.05 E.10975
G1 X55.955 Y107.687 E2.3157
G1 X55.955 Y109.933 E.07451
G1 X66.938 Y98.95 E.51523
G1 X70.247 Y98.95 E.10975
G1 X128.346 Y157.05 E2.72556
G1 X131.654 Y157.05 E.10975
G1 X189.753 Y98.951 E2.72552
G1 X193.063 Y98.951 E.1098
G1 X204.044 Y109.933 E.51516
G1 X204.044 Y107.688 E.07447
G1 X154.682 Y157.05 E2.31568
G1 X151.374 Y157.05 E.10975
G1 X93.275 Y98.951 E2.72555
G1 X89.966 Y98.951 E.10976
G1 X55.953 Y132.964 E1.59563
G1 X55.953 Y130.712 E.07468
G1 X82.29 Y157.05 E1.23553
G1 X85.598 Y157.05 E.10975
G1 X143.697 Y98.951 E2.72553
G1 X147.007 Y98.951 E.10978
G1 X203.339 Y155.284 E2.64268
G2 X203.96 Y153.827 I-5.677 J-3.281 E.05265
G1 X200.825 Y156.962 E.14708
G3 X200.397 Y157.03 I-.555 J-2.14 E.0144
G3 X197.429 Y157.05 I-1.69 J-30.453 E.09848
G1 X139.331 Y98.951 E2.72553
G1 X136.021 Y98.951 E.10978
G1 X77.922 Y157.05 E2.72553
G1 X74.614 Y157.05 E.10975
G1 X55.952 Y138.388 E.87548
G1 X55.952 Y140.641 E.07474
G1 X97.642 Y98.951 E1.95576
G1 X100.951 Y98.951 E.10976
G1 X159.05 Y157.05 E2.72555
G1 X162.358 Y157.05 E.10975
G1 X204.044 Y115.364 E1.95558
G1 X204.044 Y117.609 E.07447
G1 X185.387 Y98.951 E.87525
G1 X182.077 Y98.951 E.1098
G1 X123.978 Y157.05 E2.72552
G1 X120.67 Y157.05 E.10975
G1 X62.571 Y98.95 E2.72556
G1 X60.016 Y98.95 E.08474
G2 X59.175 Y99.038 I.112 J5.176 E.02808
G1 X56.04 Y102.173 E.14708
G3 X56.661 Y100.716 I6.307 J1.828 E.05265
G1 X112.994 Y157.05 E2.64271
G1 X116.302 Y157.05 E.10975
G1 X174.401 Y98.951 E2.72552
G1 X177.711 Y98.951 E.1098
G1 X204.044 Y125.285 E1.23535
G1 X204.044 Y123.04 E.07447
G1 X170.034 Y157.05 E1.59548
G1 X166.726 Y157.05 E.10975
G1 X108.627 Y98.951 E2.72554
G1 X105.318 Y98.951 E.10977
G1 X55.951 Y148.317 E2.31589
G1 X55.951 Y146.063 E.07479
G1 X66.938 Y157.05 E.51542
G1 X70.246 Y157.05 E.10975
G1 X128.345 Y98.951 E2.72554
G1 X131.655 Y98.951 E.10978
G1 X189.754 Y157.05 E2.72554
G1 X193.062 Y157.05 E.10975
G1 X204.044 Y146.067 E.5152
G1 X204.044 Y148.312 E.07447
G1 X154.683 Y98.951 E2.31565
G1 X151.373 Y98.951 E.10979
G1 X93.274 Y157.05 E2.72553
G1 X89.966 Y157.05 E.10975
G1 X55.954 Y123.037 E1.59559
G1 X55.953 Y125.287 E.07463
G1 X82.29 Y98.95 E1.2355
G1 X85.599 Y98.951 E.10976
G1 X143.698 Y157.05 E2.72555
G1 X147.006 Y157.05 E.10975
G1 X203.341 Y100.715 E2.64276
G3 X203.958 Y102.171 I-3.438 J2.319 E.05278
G1 X200.825 Y99.038 E.14699
G2 X200.397 Y98.97 I-.555 J2.142 E.01441
G2 X197.429 Y98.951 I-1.671 J29.073 E.0985
G1 X139.33 Y157.05 E2.72552
G1 X136.022 Y157.05 E.10975
G1 X77.923 Y98.95 E2.72555
G1 X74.614 Y98.95 E.10975
G1 X55.954 Y117.61 E.87537
G1 X55.954 Y115.362 E.07457
G1 X97.642 Y157.05 E1.95565
G1 X100.95 Y157.05 E.10975
G1 X159.049 Y98.951 E2.72553
G1 X162.359 Y98.951 E.10979
G1 X204.044 Y140.636 E1.95555
G1 X204.044 Y138.391 E.07447
G1 X185.386 Y157.05 E.87529
G1 X182.078 Y157.05 E.10975
G1 X123.979 Y98.951 E2.72554
G1 X120.669 Y98.951 E.10977
G1 X62.57 Y157.05 E2.72554
G1 X64.199 Y157.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X62.57 Y157.05 E-.61876
G1 X62.833 Y156.787 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/105
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
G3 Z1.6 I1.206 J-.16 P1  F30000
G1 X55.624 Y102.569 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
G1 X200.038 Y98.603 E4.64507
G3 X204.398 Y103.007 I-.05 J4.409 E.22795
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.411 J-.006 E.22946
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I.006 J-4.411 E.22946
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.233 Y102.53 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X55.304 Y102.066 E.01442
G3 X60.003 Y98.21 I4.71 J.948 E.2022
G1 X200.043 Y98.211 E4.30305
G3 X204.79 Y103.003 I-.056 J4.802 E.22976
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.804 J-.012 E.23117
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.012 J-4.804 E.23117
G1 X55.21 Y103.003 E1.5362
G3 X55.229 Y102.589 I4.804 J.012 E.01273
M204 S10000
; WIPE_START
G1 F24000
G1 X55.304 Y102.066 E-.20076
G1 X55.416 Y101.61 E-.17859
G1 X55.575 Y101.167 E-.17862
G1 X55.776 Y100.742 E-.17863
G1 X55.807 Y100.689 E-.0234
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.212 J.107 P1  F30000
G1 X60.783 Y157.05 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X59.162 Y156.95 I-.391 J-6.873 E.05399
M73 P30 R32
G1 X56.038 Y153.825 E.14659
G2 X56.666 Y155.278 I5.603 J-1.561 E.05268
G1 X112.993 Y98.951 E2.64243
G1 X116.303 Y98.951 E.10978
G1 X174.402 Y157.05 E2.72554
G1 X177.71 Y157.05 E.10975
G1 X204.044 Y130.715 E1.23539
G1 X204.044 Y132.961 E.07447
G1 X170.035 Y98.951 E1.59545
G1 X166.725 Y98.951 E.1098
G1 X108.626 Y157.05 E2.72552
G1 X105.318 Y157.05 E.10975
G1 X55.955 Y107.687 E2.3157
G1 X55.955 Y109.933 E.07451
G1 X66.938 Y98.95 E.51523
G1 X70.247 Y98.95 E.10975
G1 X128.346 Y157.05 E2.72555
G1 X131.654 Y157.05 E.10975
G1 X189.753 Y98.951 E2.72551
G1 X193.063 Y98.951 E.10982
G1 X204.044 Y109.933 E.51515
G1 X204.044 Y107.688 E.07447
G1 X154.682 Y157.05 E2.31568
G1 X151.374 Y157.05 E.10975
G1 X93.275 Y98.951 E2.72555
G1 X89.966 Y98.951 E.10976
G1 X55.953 Y132.964 E1.59563
G1 X55.953 Y130.712 E.07468
G1 X82.29 Y157.05 E1.23553
G1 X85.598 Y157.05 E.10975
G1 X143.697 Y98.951 E2.72553
G1 X147.007 Y98.951 E.10979
G1 X203.339 Y155.284 E2.64268
M73 P31 R32
G2 X203.95 Y153.838 I-2.802 J-2.035 E.05253
G1 X200.825 Y156.962 E.14659
G3 X200.397 Y157.03 I-.555 J-2.14 E.0144
G3 X197.429 Y157.05 I-1.69 J-30.451 E.09848
G1 X139.331 Y98.951 E2.72553
G1 X136.021 Y98.951 E.10979
G1 X77.922 Y157.05 E2.72553
G1 X74.614 Y157.05 E.10975
G1 X55.952 Y138.388 E.87548
G1 X55.952 Y140.641 E.07474
G1 X97.642 Y98.951 E1.95576
G1 X100.951 Y98.951 E.10977
G1 X159.05 Y157.05 E2.72554
G1 X162.358 Y157.05 E.10975
G1 X204.044 Y115.364 E1.95558
G1 X204.044 Y117.609 E.07447
G1 X185.387 Y98.951 E.87525
G1 X182.077 Y98.951 E.10981
G1 X123.978 Y157.05 E2.72551
G1 X120.67 Y157.05 E.10975
G1 X62.571 Y98.95 E2.72556
G1 X60.016 Y98.95 E.08474
G2 X59.175 Y99.038 I.112 J5.176 E.02808
G1 X56.04 Y102.173 E.14708
G3 X56.661 Y100.716 I6.297 J1.824 E.05265
G1 X112.994 Y157.05 E2.64271
G1 X116.302 Y157.05 E.10975
G1 X174.401 Y98.951 E2.72552
G1 X177.711 Y98.951 E.10981
G1 X204.044 Y125.285 E1.23535
G1 X204.044 Y123.04 E.07447
G1 X170.034 Y157.05 E1.59549
G1 X166.726 Y157.05 E.10975
G1 X108.627 Y98.951 E2.72554
G1 X105.318 Y98.951 E.10977
G1 X55.951 Y148.317 E2.31589
G1 X55.951 Y146.063 E.07479
G1 X66.938 Y157.05 E.51542
G1 X70.246 Y157.05 E.10975
G1 X128.345 Y98.951 E2.72553
G1 X131.655 Y98.951 E.10978
G1 X189.754 Y157.05 E2.72553
G1 X193.062 Y157.05 E.10975
G1 X204.044 Y146.067 E.5152
G1 X204.044 Y148.312 E.07447
G1 X154.683 Y98.951 E2.31564
G1 X151.373 Y98.951 E.1098
G1 X93.274 Y157.05 E2.72552
G1 X89.966 Y157.05 E.10975
G1 X55.954 Y123.037 E1.59559
G1 X55.953 Y125.287 E.07463
G1 X82.29 Y98.951 E1.2355
G1 X85.599 Y98.951 E.10976
G1 X143.698 Y157.05 E2.72555
G1 X147.006 Y157.05 E.10975
G1 X203.341 Y100.715 E2.64276
G3 X203.958 Y102.171 I-3.438 J2.319 E.05278
G1 X200.825 Y99.038 E.14699
G2 X200.396 Y98.97 I-.555 J2.142 E.01442
G2 X197.428 Y98.951 I-1.668 J28.809 E.0985
G1 X139.33 Y157.05 E2.72551
G1 X136.022 Y157.05 E.10975
G1 X77.923 Y98.95 E2.72555
G1 X74.614 Y98.95 E.10976
G1 X55.954 Y117.61 E.87536
G1 X55.954 Y115.362 E.07457
G1 X97.642 Y157.05 E1.95565
G1 X100.95 Y157.05 E.10975
G1 X159.049 Y98.951 E2.72552
G1 X162.359 Y98.951 E.1098
G1 X204.044 Y140.636 E1.95554
G1 X204.044 Y138.391 E.07447
G1 X185.386 Y157.05 E.8753
G1 X182.078 Y157.05 E.10975
G1 X123.979 Y98.951 E2.72553
G1 X120.669 Y98.951 E.10978
G1 X62.57 Y157.05 E2.72554
G1 X64.199 Y157.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X62.57 Y157.05 E-.61876
G1 X62.833 Y156.787 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/105
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
G3 Z1.8 I1.206 J-.16 P1  F30000
G1 X55.624 Y102.569 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
G1 X200.045 Y98.603 E4.64531
G3 X204.398 Y103.007 I-.057 J4.409 E.22771
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.411 J-.006 E.22946
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I.004 J-4.41 E.22949
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.233 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X55.234 Y102.531 E.00004
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.05 Y98.211 E4.30327
G3 X204.79 Y103.003 I-.063 J4.802 E.22955
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.804 J-.012 E.23117
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.01 J-4.802 E.23119
G1 X55.21 Y103.003 E1.5362
G1 X55.23 Y102.591 E.01266
M204 S10000
; WIPE_START
G1 F24000
G1 X55.234 Y102.531 E-.02305
G1 X55.302 Y102.066 E-.1786
G1 X55.416 Y101.61 E-.17864
G1 X55.575 Y101.167 E-.17862
G1 X55.776 Y100.742 E-.17863
G1 X55.806 Y100.691 E-.02247
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.212 J.107 P1  F30000
G1 X60.783 Y157.05 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X59.162 Y156.95 I-.391 J-6.873 E.05399
G1 X56.038 Y153.825 E.14659
G2 X56.666 Y155.278 I5.606 J-1.562 E.05268
G1 X112.993 Y98.951 E2.64243
G1 X116.303 Y98.951 E.10978
G1 X174.402 Y157.05 E2.72553
G1 X177.71 Y157.05 E.10975
G1 X204.044 Y130.715 E1.23539
G1 X204.044 Y132.961 E.07447
G1 X170.035 Y98.951 E1.59544
G1 X166.725 Y98.951 E.10981
G1 X108.626 Y157.05 E2.72551
G1 X105.318 Y157.05 E.10975
G1 X55.955 Y107.687 E2.3157
G1 X55.955 Y109.933 E.07451
G1 X66.938 Y98.95 E.51523
G1 X70.247 Y98.95 E.10975
G1 X128.346 Y157.05 E2.72555
G1 X131.654 Y157.05 E.10975
G1 X189.752 Y98.952 E2.7255
G1 X193.063 Y98.952 E.10983
G1 X204.044 Y109.933 E.51514
G1 X204.044 Y107.688 E.07447
G1 X154.682 Y157.05 E2.31568
G1 X151.374 Y157.05 E.10975
G1 X93.275 Y98.951 E2.72554
G1 X89.966 Y98.951 E.10977
G1 X55.953 Y132.964 E1.59563
G1 X55.953 Y130.712 E.07468
G1 X82.29 Y157.05 E1.23553
G1 X85.598 Y157.05 E.10975
G1 X143.697 Y98.951 E2.72552
G1 X147.007 Y98.951 E.1098
G1 X203.339 Y155.284 E2.64267
G2 X203.95 Y153.838 I-2.802 J-2.035 E.05253
G1 X200.825 Y156.962 E.14659
G3 X200.397 Y157.03 I-.555 J-2.14 E.0144
G3 X197.429 Y157.05 I-1.69 J-30.451 E.09848
G1 X139.331 Y98.951 E2.72552
G1 X136.021 Y98.951 E.10979
G1 X77.922 Y157.05 E2.72553
G1 X74.614 Y157.05 E.10975
G1 X55.952 Y138.388 E.87548
G1 X55.952 Y140.641 E.07474
G1 X97.642 Y98.951 E1.95576
G1 X100.951 Y98.951 E.10977
G1 X159.05 Y157.05 E2.72554
G1 X162.358 Y157.05 E.10975
G1 X204.044 Y115.364 E1.95558
G1 X204.044 Y117.609 E.07447
G1 X185.387 Y98.952 E.87524
G1 X182.076 Y98.951 E.10982
G1 X123.978 Y157.05 E2.72551
G1 X120.67 Y157.05 E.10975
G1 X62.571 Y98.95 E2.72556
G1 X60.016 Y98.95 E.08474
G2 X59.175 Y99.038 I.112 J5.176 E.02808
G1 X56.05 Y102.162 E.14659
G3 X56.661 Y100.717 I3.41 J.588 E.05252
G1 X112.994 Y157.05 E2.6427
G1 X116.302 Y157.05 E.10975
G1 X174.401 Y98.951 E2.72551
G1 X177.711 Y98.951 E.10982
G1 X204.044 Y125.285 E1.23534
G1 X204.044 Y123.04 E.07447
G1 X170.034 Y157.05 E1.59549
G1 X166.726 Y157.05 E.10975
G1 X108.627 Y98.951 E2.72554
G1 X105.317 Y98.951 E.10978
G1 X55.951 Y148.317 E2.31589
G1 X55.951 Y146.063 E.07479
G1 X66.938 Y157.05 E.51542
G1 X70.246 Y157.05 E.10975
G1 X128.345 Y98.951 E2.72553
G1 X131.655 Y98.951 E.10979
G1 X189.754 Y157.05 E2.72553
G1 X193.062 Y157.05 E.10975
G1 X204.044 Y146.067 E.5152
G1 X204.044 Y148.312 E.07447
G1 X154.683 Y98.951 E2.31564
G1 X151.373 Y98.951 E.1098
G1 X93.274 Y157.05 E2.72552
G1 X89.966 Y157.05 E.10975
G1 X55.954 Y123.037 E1.59559
G1 X55.953 Y125.287 E.07463
G1 X82.29 Y98.951 E1.2355
G1 X85.599 Y98.951 E.10976
G1 X143.698 Y157.05 E2.72555
G1 X147.006 Y157.05 E.10975
G1 X203.341 Y100.715 E2.64276
G3 X203.958 Y102.171 I-3.438 J2.318 E.05278
G1 X200.825 Y99.038 E.14699
G2 X200.396 Y98.97 I-.555 J2.143 E.01442
G2 X197.428 Y98.952 I-1.665 J28.536 E.09851
G1 X139.33 Y157.05 E2.7255
G1 X136.022 Y157.05 E.10975
G1 X77.923 Y98.951 E2.72555
G1 X74.614 Y98.95 E.10976
G1 X55.954 Y117.61 E.87536
G1 X55.954 Y115.362 E.07457
G1 X97.642 Y157.05 E1.95565
G1 X100.95 Y157.05 E.10975
G1 X159.049 Y98.951 E2.72552
G1 X162.359 Y98.951 E.10981
G1 X204.044 Y140.636 E1.95554
M73 P32 R32
G1 X204.044 Y138.391 E.07447
G1 X185.386 Y157.05 E.8753
G1 X182.078 Y157.05 E.10975
G1 X123.979 Y98.951 E2.72553
G1 X120.669 Y98.951 E.10978
G1 X62.57 Y157.05 E2.72553
G1 X64.199 Y157.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X62.57 Y157.05 E-.61876
G1 X62.833 Y156.787 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/105
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
G3 Z2 I1.206 J-.16 P1  F30000
G1 X55.624 Y102.569 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
G1 X200.052 Y98.604 E4.64554
G3 X204.398 Y103.007 I-.064 J4.409 E.22748
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.411 J-.006 E.22946
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I.004 J-4.409 E.22949
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.233 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X55.234 Y102.531 E.00004
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.057 Y98.211 E4.30348
G3 X204.79 Y103.003 I-.069 J4.802 E.22933
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.804 J-.012 E.23117
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.01 J-4.802 E.23119
G1 X55.21 Y103.003 E1.5362
G1 X55.23 Y102.591 E.01266
M204 S10000
; WIPE_START
G1 F24000
G1 X55.234 Y102.531 E-.02304
G1 X55.302 Y102.066 E-.1786
G1 X55.416 Y101.61 E-.17864
G1 X55.575 Y101.167 E-.17862
G1 X55.776 Y100.742 E-.17862
G1 X55.806 Y100.691 E-.02249
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.268 J1.187 P1  F30000
G1 X89.849 Y108.372 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X89.849 Y106.744 E.05401
G1 X55.952 Y140.641 E1.59018
G1 X55.952 Y138.388 E.07474
G1 X74.614 Y157.05 E.87548
G1 X77.922 Y157.05 E.10975
G1 X101.319 Y133.653 E1.09759
G1 X101.457 Y133.653 E.00457
G2 X103.512 Y139.136 I30.582 J-8.338 E.19451
G1 X85.598 Y157.05 E.84038
G1 X82.29 Y157.05 E.10975
G1 X55.953 Y130.712 E1.23553
G1 X55.953 Y132.964 E.07468
G1 X89.966 Y98.951 E1.59562
G1 X93.275 Y98.951 E.10977
G1 X98.673 Y104.349 E.25323
G1 X99.92 Y104.349 E.04136
G1 X105.317 Y98.951 E.25323
G1 X108.627 Y98.951 E.10978
G1 X110.025 Y100.349 E.06558
G1 X111.596 Y100.349 E.05211
G1 X112.993 Y98.951 E.06557
G1 X116.303 Y98.951 E.10978
G1 X121.699 Y104.347 E.25315
G1 X122.949 Y104.347 E.04146
G1 X128.345 Y98.951 E.25315
G1 X131.655 Y98.951 E.10979
G1 X137.052 Y104.348 E.25319
G1 X138.3 Y104.348 E.04139
G1 X143.697 Y98.951 E.25319
G1 X147.007 Y98.951 E.10981
G1 X148.404 Y100.349 E.06556
G1 X149.975 Y100.349 E.05211
G1 X151.373 Y98.951 E.06555
G1 X154.683 Y98.951 E.10981
G1 X160.08 Y104.349 E.2532
G1 X161.327 Y104.349 E.04136
G1 X166.725 Y98.951 E.2532
G1 X170.035 Y98.951 E.10982
G1 X204.044 Y132.961 E1.59543
G1 X204.044 Y130.715 E.07447
G1 X177.71 Y157.05 E1.23539
G1 X174.402 Y157.05 E.10975
G1 X157.146 Y139.794 E.80952
G2 X157.699 Y138.68 I-11.055 J-6.195 E.04126
G1 X162.727 Y133.652 E.23588
G1 X166.356 Y133.652 E.12035
G1 X189.754 Y157.05 E1.09765
G1 X193.062 Y157.05 E.10975
G1 X204.044 Y146.067 E.5152
G1 X204.044 Y148.312 E.07447
G1 X170.151 Y114.42 E1.58999
G1 X170.151 Y110.877 E.11753
G1 X182.076 Y98.952 E.55943
G1 X185.387 Y98.952 E.10983
G1 X204.044 Y117.609 E.87523
G1 X204.044 Y115.364 E.07447
G1 X162.358 Y157.05 E1.95558
G1 X159.05 Y157.05 E.10975
G1 X150.409 Y148.409 E.40534
G2 X154.134 Y144.458 I-19.058 J-21.695 E.18039
G1 X166.726 Y157.05 E.59071
G1 X170.034 Y157.05 E.10975
G1 X204.044 Y123.04 E1.59549
G1 X204.044 Y125.285 E.07447
G1 X177.711 Y98.952 E1.23533
G1 X174.4 Y98.952 E.10983
G1 X169.003 Y104.349 E.25319
G1 X167.756 Y104.349 E.04136
G1 X162.359 Y98.951 E.2532
G1 X159.049 Y98.951 E.10982
G1 X153.651 Y104.349 E.2532
G1 X153.651 Y102.72 E.05401
G1 X152.837 Y103.166 F30000
G1 F15476.087
G2 X152.85 Y104.794 I16.584 J.682 E.05403
G1 X149.219 Y101.163 E.17036
G1 X149.161 Y101.163 E.00191
G1 X107.014 Y143.31 E1.9772
G1 X107.239 Y143.618 E.01266
G1 X112.725 Y149.105 E.25738
G2 X114.996 Y150.68 I18.894 J-24.811 E.0917
G1 X160.513 Y105.163 E2.13531
G1 X160.895 Y105.163 E.01265
G1 X169.337 Y113.605 E.39606
G1 X169.337 Y111.691 E.06351
G1 X126.218 Y154.81 E2.02282
G1 X126.087 Y154.79 E.0044
G1 X90.663 Y119.367 E1.6618
G1 X90.663 Y121.281 E.06351
G1 X106.781 Y105.163 E.75615
G1 X107.163 Y105.163 E.01266
G1 X149.833 Y147.833 E2.00174
G2 X153.555 Y143.879 I-26.625 J-28.788 E.18027
G1 X110.839 Y101.163 E2.00389
G1 X110.781 Y101.163 E.00191
G1 X108.163 Y103.781 E.12284
G1 X108.163 Y102.153 E.05401
G1 X107.349 Y103.72 F30000
G1 F15476.087
G1 X107.349 Y104.349 E.02084
G1 X106.349 Y104.349 E.03317
G1 X100.951 Y98.951 E.25323
G1 X97.642 Y98.951 E.10977
G1 X92.244 Y104.349 E.25323
G1 X90.997 Y104.349 E.04136
G1 X85.599 Y98.951 E.25324
G1 X82.29 Y98.951 E.10976
G1 X55.953 Y125.287 E1.23549
G1 X55.954 Y123.037 E.07463
G1 X89.966 Y157.05 E1.59559
G1 X93.274 Y157.05 E.10975
G1 X106.431 Y143.893 E.61722
G3 X104.379 Y140.759 I25.18 J-18.73 E.12433
G1 X97.272 Y133.652 E.33339
G1 X93.644 Y133.652 E.12035
G1 X70.246 Y157.05 E1.09765
G1 X66.938 Y157.05 E.10975
G1 X55.951 Y146.063 E.51542
G1 X55.951 Y148.317 E.07479
G1 X89.849 Y114.42 E1.59022
G1 X89.849 Y110.877 E.11753
G1 X77.923 Y98.951 E.55948
G1 X74.614 Y98.95 E.10976
G1 X55.954 Y117.61 E.87536
G1 X55.954 Y115.362 E.07457
G1 X97.642 Y157.05 E1.95565
G1 X100.95 Y157.05 E.10975
G1 X110.07 Y147.93 E.42783
G2 X110.694 Y148.504 I11.965 J-12.38 E.02813
G1 X111.294 Y149.003 E.02589
G1 X110.646 Y147.354 F30000
G1 F15476.087
G1 X152.877 Y105.123 E1.98114
G1 X153.201 Y105.145 E.01075
G1 X169.337 Y121.281 E.757
G1 X169.337 Y119.367 E.06351
G1 X133.758 Y154.945 E1.66907
G1 X133.903 Y154.931 E.00482
G1 X90.663 Y111.691 E2.02849
G1 X90.663 Y113.605 E.06351
G1 X99.105 Y105.163 E.39606
G1 X99.487 Y105.163 E.01266
G1 X145.382 Y151.058 E2.15303
G1 X145.229 Y151.151 E.00594
G1 X155.758 Y140.622 E.49393
G2 X156.542 Y139.19 I-14.03 J-8.611 E.05418
G1 X122.513 Y105.161 E1.59636
G1 X122.135 Y105.161 E.01254
G1 X94.458 Y132.838 E1.29837
G1 X96.458 Y132.838 E.06633
G1 X90.663 Y127.043 E.27187
G1 X90.663 Y128.957 E.06351
G1 X116.338 Y103.282 E1.20447
G1 X116.339 Y104.91 E.05401
G1 X116.07 Y100.756 F30000
G1 F15476.087
G1 X108.373 Y100.773 E.25535
G1 X107.756 Y101.414 E.02952
G1 X107.743 Y104.744 E.11047
G1 X90.914 Y104.756 E.55823
G1 X90.273 Y105.373 E.02952
G1 X90.256 Y132.586 E.9027
G1 X90.873 Y133.227 E.02952
G2 X91.047 Y133.244 I.108 J-.202 E.00595
G1 X101.674 Y133.246 E.35253
G1 X101.778 Y133.321 E.00428
G3 X102.215 Y134.81 I-10.048 J3.753 E.05151
G1 X102.693 Y136.204 E.04887
G1 X103.852 Y138.906 E.09751
G1 X104.531 Y140.213 E.04887
G1 X106.079 Y142.714 E.09758
G1 X107.866 Y145.05 E.09757
G1 X109.875 Y147.197 E.09751
G1 X110.959 Y148.194 E.04887
G1 X113.263 Y150.019 E.09751
G1 X114.483 Y150.845 E.04887
G1 X117.035 Y152.309 E.09758
G1 X119.717 Y153.512 E.09751
G1 X121.102 Y154.013 E.04887
G1 X123.935 Y154.806 E.09758
G1 X126.83 Y155.313 E.09751
G1 X128.382 Y155.464 E.05173
G1 X131.235 Y155.532 E.09465
G1 X134.168 Y155.314 E.09758
G1 X135.625 Y155.095 E.04887
G1 X138.492 Y154.445 E.09751
G1 X139.9 Y154.013 E.04887
G1 X142.638 Y152.944 E.09751
G1 X145.259 Y151.609 E.09757
G1 X146.519 Y150.844 E.04887
G1 X148.911 Y149.136 E.09751
G1 X151.124 Y147.198 E.09758
G1 X152.157 Y146.148 E.04887
G1 X154.057 Y143.905 E.09751
G1 X154.923 Y142.713 E.04887
G1 X156.469 Y140.213 E.09751
G1 X157.148 Y138.905 E.04887
G1 X158.307 Y136.204 E.09751
G1 X159.191 Y133.403 E.09744
G3 X159.322 Y133.246 I.192 J.027 E.00713
G1 X169.086 Y133.244 E.3239
G1 X169.744 Y132.586 E.03089
G1 X169.744 Y105.414 E.90132
G1 X169.086 Y104.756 E.03089
G1 X153.255 Y104.741 E.52513
G3 X153.244 Y101.414 I33.866 J-1.773 E.11038
G1 X152.586 Y100.756 E.03089
G1 X144.914 Y100.756 E.25447
G1 X144.273 Y101.373 E.02952
G2 X144.256 Y101.836 I.55 J.252 E.01577
G1 X144.256 Y104.535 E.08954
G3 X144.232 Y104.745 I-1.391 J-.048 E.00702
G3 X143.417 Y104.756 I-.514 J-8.239 E.02707
G1 X116.746 Y104.754 E.88472
G1 X116.744 Y101.414 E.11079
G1 X116.127 Y100.773 E.0295
G1 X116.87 Y100.94 F30000
G1 F15476.087
G3 X117.151 Y101.332 I-.334 J.536 E.01645
G1 X117.152 Y102.468 E.03768
G1 X120.669 Y98.951 E.16501
G1 X123.979 Y98.951 E.10979
G1 X129.376 Y104.348 E.25317
G1 X130.624 Y104.348 E.04142
G1 X136.021 Y98.951 E.25317
G1 X139.331 Y98.951 E.1098
G1 X143.849 Y103.469 E.21193
G1 X143.849 Y101.841 E.05401
G1 X143.825 Y105.163 F30000
G1 F15476.087
G2 X144.597 Y105.135 I.103 J-7.819 E.02564
G2 X144.663 Y104.283 I-3.791 J-.723 E.0284
G1 X169.337 Y128.957 E1.15752
G1 X169.337 Y127.043 E.06351
G1 X163.542 Y132.838 E.27187
G1 X165.542 Y132.838 E.06634
G1 X137.866 Y105.162 E1.29831
G1 X137.486 Y105.162 E.01262
G1 X104.124 Y138.524 E1.56505
G3 X102.118 Y133.064 I31.063 J-14.517 E.19318
G1 X101.996 Y132.976 E.00498
G1 X129.81 Y105.162 E1.30484
G1 X130.19 Y105.162 E.01258
G1 X158.692 Y133.664 E1.33712
G3 X158.214 Y135.22 I-15.908 J-4.038 E.05402
G1 X160.475 Y133.653 F30000
G1 F15476.087
G1 X159.543 Y133.653 E.03092
G1 X159.35 Y134.322 E.0231
G1 X182.078 Y157.05 E1.0662
G1 X185.386 Y157.05 E.10975
G1 X204.044 Y138.391 E.8753
G1 X204.044 Y140.636 E.07447
G1 X170.151 Y106.744 E1.58999
G1 X170.151 Y108.372 E.05401
G1 X169.337 Y107.558 F30000
G1 F15476.087
G1 X169.337 Y105.929 E.05401
G1 X168.571 Y105.163 E.03596
G1 X168.189 Y105.163 E.01266
G1 X120.125 Y153.227 E2.25478
G2 X121.663 Y153.76 I6.135 J-15.225 E.05402
G1 X121.023 Y154.415 F30000
G1 F15476.087
G1 X120.978 Y154.401 E.00157
G3 X119.493 Y153.859 I52.97 J-147.569 E.05244
G1 X116.302 Y157.05 E.14966
G1 X112.994 Y157.05 E.10975
G1 X56.661 Y100.716 E2.64271
G2 X56.04 Y102.173 I5.677 J3.281 E.05265
G1 X59.175 Y99.038 E.14708
G3 X60.016 Y98.95 I.953 J5.089 E.02808
G1 X62.571 Y98.95 E.08474
G1 X89.849 Y126.229 E1.27967
G1 X89.849 Y129.771 E.11753
G1 X62.57 Y157.05 E1.27968
G3 X59.406 Y157.005 I-1.275 J-21.636 E.10508
G1 X59.162 Y156.95 E.00828
G1 X56.038 Y153.825 E.1466
G2 X56.666 Y155.278 I5.606 J-1.562 E.05268
G1 X89.849 Y122.096 E1.55667
G1 X89.849 Y118.553 E.11753
G1 X70.247 Y98.95 E.91958
G1 X66.938 Y98.95 E.10975
G1 X55.955 Y109.933 E.51523
G1 X55.955 Y107.687 E.07451
G1 X105.318 Y157.05 E2.3157
G1 X108.626 Y157.05 E.10975
G1 X114.403 Y151.273 E.271
G2 X115.634 Y152.014 I8.305 J-12.403 E.04767
G1 X120.67 Y157.05 E.23625
G1 X123.978 Y157.05 E.10975
G1 X125.502 Y155.526 E.07148
G2 X127.04 Y155.744 I2.991 J-15.6 E.05154
G1 X128.346 Y157.05 E.06127
G1 X131.654 Y157.05 E.10975
G1 X132.85 Y155.854 E.05609
G2 X134.629 Y155.656 I-1.121 J-18.185 E.05939
G1 X136.022 Y157.05 E.06536
G1 X139.33 Y157.05 E.10975
G1 X143.302 Y153.078 E.18634
G2 X145.975 Y151.651 I-12.988 J-27.54 E.10054
M73 P32 R31
G1 X151.374 Y157.05 E.25328
G1 X154.682 Y157.05 E.10975
G1 X204.044 Y107.688 E2.31568
G1 X204.044 Y109.933 E.07447
G1 X193.063 Y98.952 E.51513
G1 X189.752 Y98.952 E.10984
G1 X170.151 Y118.553 E.91952
G1 X170.151 Y122.096 E.11753
G1 X203.339 Y155.284 E1.55692
G2 X203.95 Y153.838 I-2.802 J-2.035 E.05253
G1 X200.825 Y156.962 E.14659
G3 X199.984 Y157.05 I-.953 J-5.089 E.02808
G1 X197.429 Y157.05 E.08474
G1 X170.151 Y129.771 E1.27968
G1 X170.151 Y126.229 E.11753
G1 X197.428 Y98.952 E1.27961
G3 X200.396 Y98.97 I1.307 J28.28 E.09851
G3 X200.825 Y99.038 I-.127 J2.211 E.01442
G1 X203.958 Y102.171 E.14699
G2 X203.341 Y100.715 I-4.056 J.863 E.05278
G1 X147.006 Y157.05 E2.64276
G1 X143.698 Y157.05 E.10975
G1 X140.776 Y154.128 E.13705
G3 X139.232 Y154.643 I-5.997 J-15.411 E.05402
M73 P33 R31
G1 X138.59 Y153.989 F30000
G1 F15476.087
G2 X140.141 Y153.493 I-4.22 J-15.863 E.05402
G1 X91.811 Y105.163 E2.26724
G1 X91.429 Y105.163 E.01266
G1 X90.663 Y105.929 E.03596
G1 X90.663 Y107.558 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X90.663 Y105.929 E-.61876
G1 X90.926 Y105.667 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/105
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
G3 Z2.2 I.106 J-1.212 P1  F30000
G1 X55.624 Y102.569 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
G1 X200.059 Y98.604 E4.64577
G3 X204.398 Y103.007 I-.071 J4.409 E.22725
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.411 J-.006 E.22946
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I-.004 J-4.402 E.2296
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.233 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X55.234 Y102.531 E.00004
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.064 Y98.212 E4.3037
G3 X204.79 Y103.003 I-.076 J4.802 E.22911
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.804 J-.012 E.23117
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.001 J-4.794 E.23131
G1 X55.21 Y103.003 E1.5362
G1 X55.23 Y102.591 E.01266
M204 S10000
; WIPE_START
G1 F24000
G1 X55.234 Y102.531 E-.02302
G1 X55.302 Y102.066 E-.1786
G1 X55.416 Y101.61 E-.17864
G1 X55.575 Y101.167 E-.17861
G1 X55.776 Y100.742 E-.17863
G1 X55.806 Y100.691 E-.0225
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.268 J1.187 P1  F30000
G1 X89.849 Y108.372 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X89.849 Y106.744 E.05401
G1 X55.952 Y140.641 E1.59018
G1 X55.952 Y138.388 E.07474
G1 X74.614 Y157.05 E.87548
G1 X77.922 Y157.05 E.10975
G1 X101.319 Y133.653 E1.09759
G1 X101.457 Y133.653 E.00457
G2 X103.512 Y139.136 I30.582 J-8.338 E.19451
G1 X85.598 Y157.05 E.84038
G1 X82.29 Y157.05 E.10975
G1 X55.953 Y130.712 E1.23553
G1 X55.953 Y132.964 E.07468
G1 X89.966 Y98.951 E1.59562
G1 X93.275 Y98.951 E.10977
G1 X98.673 Y104.349 E.25323
G1 X99.92 Y104.349 E.04136
G1 X105.317 Y98.951 E.25322
G1 X108.627 Y98.951 E.10978
G1 X110.025 Y100.349 E.06557
G1 X111.596 Y100.349 E.05211
G1 X112.993 Y98.951 E.06557
G1 X116.303 Y98.951 E.10979
G1 X121.699 Y104.347 E.25315
G1 X122.949 Y104.347 E.04146
G1 X128.345 Y98.951 E.25314
G1 X131.655 Y98.951 E.1098
G1 X137.052 Y104.348 E.25319
G1 X138.3 Y104.348 E.04139
G1 X143.697 Y98.951 E.25318
G1 X147.007 Y98.951 E.10981
G1 X148.404 Y100.349 E.06555
G1 X149.975 Y100.349 E.05211
G1 X151.373 Y98.951 E.06555
G1 X154.683 Y98.951 E.10982
G1 X160.08 Y104.349 E.2532
G1 X161.327 Y104.349 E.04136
G1 X166.724 Y98.952 E.25319
G1 X170.035 Y98.952 E.10983
G1 X204.044 Y132.96 E1.59543
G1 X204.044 Y130.716 E.07447
G1 X177.71 Y157.05 E1.23539
G1 X174.402 Y157.05 E.10975
G1 X157.146 Y139.794 E.80952
G2 X157.699 Y138.68 I-11.055 J-6.195 E.04126
G1 X162.727 Y133.652 E.23588
G1 X166.356 Y133.652 E.12035
G1 X189.754 Y157.05 E1.09765
G1 X193.062 Y157.05 E.10975
G1 X204.044 Y146.067 E.5152
G1 X204.044 Y148.312 E.07447
G1 X170.151 Y114.42 E1.58998
G1 X170.151 Y110.877 E.11753
G1 X182.076 Y98.952 E.55942
G1 X185.387 Y98.952 E.10984
G1 X204.044 Y117.609 E.87523
G1 X204.044 Y115.364 E.07447
G1 X162.358 Y157.05 E1.95558
G1 X159.05 Y157.05 E.10975
G1 X150.409 Y148.409 E.40534
G2 X154.134 Y144.458 I-19.058 J-21.695 E.18039
G1 X166.726 Y157.05 E.59071
G1 X170.034 Y157.05 E.10975
G1 X204.044 Y123.04 E1.59549
G1 X204.044 Y125.285 E.07447
G1 X177.711 Y98.952 E1.23533
G1 X174.4 Y98.952 E.10984
G1 X169.003 Y104.349 E.25318
G1 X167.756 Y104.349 E.04136
G1 X162.359 Y98.952 E.25319
G1 X159.049 Y98.952 E.10982
G1 X153.651 Y104.349 E.25319
G1 X153.651 Y102.72 E.05401
G1 X152.837 Y103.166 F30000
G1 F15476.087
G2 X152.85 Y104.794 I16.584 J.682 E.05403
G1 X149.219 Y101.163 E.17036
G1 X149.161 Y101.163 E.00191
G1 X107.014 Y143.31 E1.9772
G1 X107.239 Y143.618 E.01266
G1 X112.725 Y149.105 E.25738
G2 X114.996 Y150.68 I18.894 J-24.811 E.0917
G1 X160.513 Y105.163 E2.13531
G1 X160.895 Y105.163 E.01265
G1 X169.337 Y113.605 E.39606
G1 X169.337 Y111.691 E.06351
G1 X126.218 Y154.81 E2.02282
G1 X126.087 Y154.79 E.0044
G1 X90.663 Y119.367 E1.6618
G1 X90.663 Y121.281 E.06351
G1 X106.781 Y105.163 E.75615
G1 X107.163 Y105.163 E.01266
G1 X149.833 Y147.833 E2.00174
G2 X153.555 Y143.879 I-26.625 J-28.788 E.18027
G1 X110.839 Y101.163 E2.00389
G1 X110.781 Y101.163 E.00191
G1 X108.163 Y103.781 E.12284
G1 X108.163 Y102.153 E.05401
G1 X107.349 Y103.72 F30000
G1 F15476.087
G1 X107.349 Y104.349 E.02084
G1 X106.349 Y104.349 E.03317
G1 X100.951 Y98.951 E.25323
G1 X97.641 Y98.951 E.10978
G1 X92.244 Y104.349 E.25323
G1 X90.997 Y104.349 E.04136
G1 X85.599 Y98.951 E.25323
G1 X82.29 Y98.951 E.10977
G1 X55.953 Y125.287 E1.23549
G1 X55.954 Y123.037 E.07463
G1 X89.966 Y157.05 E1.59559
G1 X93.274 Y157.05 E.10975
G1 X106.431 Y143.893 E.61722
G3 X104.379 Y140.759 I25.18 J-18.73 E.12433
G1 X97.272 Y133.652 E.33339
G1 X93.644 Y133.652 E.12035
G1 X70.246 Y157.05 E1.09765
G1 X66.938 Y157.05 E.10975
G1 X55.951 Y146.063 E.51542
G1 X55.951 Y148.317 E.07479
G1 X89.849 Y114.42 E1.59022
G1 X89.849 Y110.877 E.11753
G1 X77.923 Y98.951 E.55947
G1 X74.614 Y98.951 E.10976
G1 X55.954 Y117.61 E.87536
G1 X55.954 Y115.362 E.07457
G1 X97.642 Y157.05 E1.95565
G1 X100.95 Y157.05 E.10975
G1 X110.07 Y147.93 E.42783
G2 X110.694 Y148.504 I11.965 J-12.38 E.02813
G1 X111.294 Y149.003 E.02589
G1 X110.646 Y147.354 F30000
G1 F15476.087
G1 X152.877 Y105.123 E1.98114
G1 X153.201 Y105.145 E.01075
G1 X169.337 Y121.281 E.757
G1 X169.337 Y119.367 E.06351
G1 X133.758 Y154.945 E1.66907
G1 X133.903 Y154.931 E.00482
G1 X90.663 Y111.691 E2.02849
G1 X90.663 Y113.605 E.06351
G1 X99.105 Y105.163 E.39606
G1 X99.487 Y105.163 E.01266
G1 X145.382 Y151.058 E2.15303
G1 X145.229 Y151.151 E.00594
G1 X155.758 Y140.622 E.49393
G2 X156.542 Y139.19 I-14.03 J-8.611 E.05418
G1 X122.513 Y105.161 E1.59636
G1 X122.135 Y105.161 E.01254
G1 X94.458 Y132.838 E1.29837
G1 X96.458 Y132.838 E.06633
G1 X90.663 Y127.043 E.27187
G1 X90.663 Y128.957 E.06351
G1 X116.338 Y103.282 E1.20447
G1 X116.339 Y104.91 E.05401
G1 X116.07 Y100.756 F30000
G1 F15476.087
G1 X108.373 Y100.773 E.25535
G1 X107.756 Y101.414 E.02952
G1 X107.743 Y104.744 E.11047
G1 X90.914 Y104.756 E.55823
G1 X90.273 Y105.373 E.02952
G1 X90.256 Y132.586 E.9027
G1 X90.873 Y133.227 E.02952
G2 X91.047 Y133.244 I.108 J-.202 E.00595
G1 X101.674 Y133.246 E.35253
G1 X101.778 Y133.321 E.00428
G3 X102.215 Y134.81 I-10.048 J3.753 E.05151
G1 X102.693 Y136.204 E.04887
G1 X103.852 Y138.906 E.09751
G1 X104.531 Y140.213 E.04887
G1 X106.079 Y142.714 E.09758
G1 X107.866 Y145.05 E.09757
G1 X109.875 Y147.197 E.09751
G1 X110.959 Y148.194 E.04887
G1 X113.263 Y150.019 E.09751
G1 X114.483 Y150.845 E.04887
G1 X117.035 Y152.309 E.09758
G1 X119.717 Y153.512 E.09751
G1 X121.102 Y154.013 E.04887
G1 X123.935 Y154.806 E.09758
G1 X126.83 Y155.313 E.09751
G1 X128.382 Y155.464 E.05173
G1 X131.235 Y155.532 E.09465
G1 X134.168 Y155.314 E.09758
G1 X135.625 Y155.095 E.04887
G1 X138.492 Y154.445 E.09751
G1 X139.9 Y154.013 E.04887
G1 X142.638 Y152.944 E.09751
G1 X145.259 Y151.609 E.09757
G1 X146.519 Y150.844 E.04887
G1 X148.911 Y149.136 E.09751
G1 X151.124 Y147.198 E.09758
G1 X152.157 Y146.148 E.04887
G1 X154.057 Y143.905 E.09751
G1 X154.923 Y142.713 E.04887
G1 X156.469 Y140.213 E.09751
G1 X157.148 Y138.905 E.04887
G1 X158.307 Y136.204 E.09751
G1 X159.191 Y133.403 E.09744
G3 X159.322 Y133.246 I.192 J.027 E.00713
G1 X169.086 Y133.244 E.3239
G1 X169.744 Y132.586 E.03089
G1 X169.744 Y105.414 E.90132
G1 X169.086 Y104.756 E.03089
G1 X153.255 Y104.741 E.52513
G3 X153.244 Y101.414 I33.866 J-1.773 E.11038
G1 X152.586 Y100.756 E.03089
G1 X144.914 Y100.756 E.25447
G1 X144.273 Y101.373 E.02952
G2 X144.256 Y101.836 I.55 J.252 E.01577
G1 X144.256 Y104.535 E.08954
G3 X144.232 Y104.745 I-1.391 J-.048 E.00702
G3 X143.417 Y104.756 I-.514 J-8.239 E.02707
G1 X116.746 Y104.754 E.88472
G1 X116.744 Y101.414 E.11079
G1 X116.127 Y100.773 E.0295
G1 X116.87 Y100.94 F30000
G1 F15476.087
G3 X117.151 Y101.332 I-.334 J.536 E.01645
G1 X117.152 Y102.468 E.03768
G1 X120.669 Y98.951 E.16501
G1 X123.979 Y98.951 E.10979
G1 X129.376 Y104.348 E.25317
G1 X130.624 Y104.348 E.04142
G1 X136.021 Y98.951 E.25316
G1 X139.331 Y98.951 E.10981
G1 X143.849 Y103.469 E.21193
G1 X143.849 Y101.841 E.05401
G1 X143.825 Y105.163 F30000
G1 F15476.087
G2 X144.597 Y105.135 I.103 J-7.819 E.02564
G2 X144.663 Y104.283 I-3.791 J-.723 E.0284
G1 X169.337 Y128.957 E1.15752
G1 X169.337 Y127.043 E.06351
G1 X163.542 Y132.838 E.27187
G1 X165.542 Y132.838 E.06634
G1 X137.866 Y105.162 E1.29831
G1 X137.486 Y105.162 E.01262
G1 X104.124 Y138.524 E1.56505
G3 X102.118 Y133.064 I31.063 J-14.517 E.19318
G1 X101.996 Y132.976 E.00498
G1 X129.81 Y105.162 E1.30484
G1 X130.19 Y105.162 E.01258
G1 X158.692 Y133.664 E1.33712
G3 X158.214 Y135.22 I-15.908 J-4.038 E.05402
G1 X160.475 Y133.653 F30000
G1 F15476.087
G1 X159.543 Y133.653 E.03092
G1 X159.35 Y134.322 E.0231
G1 X182.078 Y157.05 E1.0662
G1 X185.386 Y157.05 E.10975
G1 X204.044 Y138.391 E.87529
G1 X204.044 Y140.636 E.07447
G1 X170.151 Y106.744 E1.58998
G1 X170.151 Y108.372 E.05401
G1 X169.337 Y107.558 F30000
G1 F15476.087
G1 X169.337 Y105.929 E.05401
G1 X168.571 Y105.163 E.03596
G1 X168.189 Y105.163 E.01266
G1 X120.125 Y153.227 E2.25478
G2 X121.663 Y153.76 I6.135 J-15.225 E.05402
G1 X121.023 Y154.415 F30000
G1 F15476.087
G1 X120.978 Y154.401 E.00157
G3 X119.493 Y153.859 I52.97 J-147.569 E.05244
G1 X116.302 Y157.05 E.14966
G1 X112.994 Y157.05 E.10975
G1 X56.661 Y100.716 E2.64271
G2 X56.04 Y102.173 I5.677 J3.281 E.05265
G1 X59.175 Y99.038 E.14708
G3 X60.016 Y98.95 I.953 J5.089 E.02808
G1 X62.571 Y98.95 E.08474
G1 X89.849 Y126.229 E1.27967
G1 X89.849 Y129.771 E.11753
G1 X62.57 Y157.05 E1.27968
G3 X59.406 Y157.005 I-1.275 J-21.636 E.10508
G1 X59.162 Y156.95 E.00828
G1 X56.038 Y153.825 E.14659
G2 X56.666 Y155.278 I5.603 J-1.561 E.05268
G1 X89.849 Y122.096 E1.55667
G1 X89.849 Y118.553 E.11753
G1 X70.247 Y98.95 E.91957
G1 X66.938 Y98.95 E.10975
G1 X55.955 Y109.933 E.51523
G1 X55.955 Y107.687 E.07451
G1 X105.318 Y157.05 E2.3157
G1 X108.626 Y157.05 E.10975
G1 X114.403 Y151.273 E.271
G2 X115.634 Y152.014 I8.305 J-12.403 E.04767
G1 X120.67 Y157.05 E.23625
G1 X123.978 Y157.05 E.10975
G1 X125.502 Y155.526 E.07148
G2 X127.04 Y155.744 I2.991 J-15.6 E.05154
G1 X128.346 Y157.05 E.06127
G1 X131.654 Y157.05 E.10975
G1 X132.85 Y155.854 E.05609
G2 X134.629 Y155.656 I-1.121 J-18.185 E.05939
G1 X136.022 Y157.05 E.06536
G1 X139.33 Y157.05 E.10975
G1 X143.302 Y153.078 E.18634
G2 X145.975 Y151.651 I-12.988 J-27.54 E.10054
G1 X151.374 Y157.05 E.25328
G1 X154.682 Y157.05 E.10975
G1 X204.044 Y107.688 E2.31568
G1 X204.044 Y109.933 E.07447
G1 X193.063 Y98.952 E.51513
G1 X189.752 Y98.952 E.10985
G1 X170.151 Y118.553 E.91951
G1 X170.151 Y122.096 E.11753
G1 X203.339 Y155.284 E1.55692
G2 X203.96 Y153.827 I-5.678 J-3.281 E.05265
G1 X200.825 Y156.962 E.14708
G3 X199.984 Y157.05 I-.953 J-5.089 E.02808
G1 X197.429 Y157.05 E.08474
G1 X170.151 Y129.771 E1.27968
G1 X170.151 Y126.229 E.11753
G1 X197.428 Y98.952 E1.2796
G3 X200.396 Y98.97 I1.311 J28.003 E.09851
G3 X200.825 Y99.038 I-.127 J2.211 E.01443
G1 X203.958 Y102.171 E.14699
G2 X203.341 Y100.715 I-4.056 J.863 E.05278
G1 X147.006 Y157.05 E2.64276
G1 X143.698 Y157.05 E.10975
G1 X140.776 Y154.128 E.13705
G3 X139.232 Y154.643 I-5.997 J-15.411 E.05402
G1 X138.59 Y153.989 F30000
G1 F15476.087
G2 X140.141 Y153.493 I-4.22 J-15.863 E.05402
G1 X91.811 Y105.163 E2.26724
G1 X91.429 Y105.163 E.01266
G1 X90.663 Y105.929 E.03596
G1 X90.663 Y107.558 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X90.663 Y105.929 E-.61876
G1 X90.926 Y105.667 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/105
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
G3 Z2.4 I.106 J-1.212 P1  F30000
G1 X55.624 Y102.569 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
G1 X200.066 Y98.604 E4.646
G3 X204.398 Y103.007 I-.077 J4.409 E.22701
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.402 J.004 E.2296
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I-.004 J-4.402 E.2296
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.233 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X55.234 Y102.531 E.00004
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.071 Y98.212 E4.30391
G3 X204.79 Y103.003 I-.083 J4.802 E.2289
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.794 J-.001 E.23131
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.001 J-4.794 E.23131
G1 X55.21 Y103.003 E1.5362
G1 X55.23 Y102.591 E.01266
M204 S10000
; WIPE_START
G1 F24000
G1 X55.234 Y102.531 E-.023
G1 X55.302 Y102.066 E-.1786
G1 X55.416 Y101.61 E-.17864
G1 X55.575 Y101.167 E-.17862
G1 X55.776 Y100.742 E-.17863
G1 X55.806 Y100.691 E-.02252
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.268 J1.187 P1  F30000
G1 X89.849 Y108.372 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X89.849 Y106.744 E.05401
G1 X55.952 Y140.641 E1.59018
G1 X55.952 Y138.388 E.07474
G1 X74.614 Y157.05 E.87548
G1 X77.922 Y157.05 E.10975
G1 X101.319 Y133.653 E1.09759
G1 X101.457 Y133.653 E.00457
G2 X103.512 Y139.136 I30.582 J-8.338 E.19451
G1 X85.598 Y157.05 E.84038
G1 X82.29 Y157.05 E.10975
G1 X55.953 Y130.712 E1.23553
G1 X55.953 Y132.964 E.07468
G1 X89.966 Y98.951 E1.59562
G1 X93.275 Y98.951 E.10977
G1 X98.673 Y104.349 E.25323
G1 X99.92 Y104.349 E.04136
M73 P34 R31
G1 X105.317 Y98.951 E.25322
G1 X108.627 Y98.951 E.10979
G1 X110.025 Y100.349 E.06557
G1 X111.596 Y100.349 E.05211
G1 X112.993 Y98.951 E.06557
G1 X116.303 Y98.951 E.10979
G1 X121.699 Y104.347 E.25314
G1 X122.949 Y104.347 E.04146
G1 X128.345 Y98.951 E.25314
G1 X131.655 Y98.951 E.10981
G1 X137.052 Y104.348 E.25318
G1 X138.3 Y104.348 E.04139
G1 X143.697 Y98.951 E.25318
G1 X147.007 Y98.951 E.10982
G1 X148.404 Y100.349 E.06555
G1 X149.975 Y100.349 E.05211
G1 X151.373 Y98.952 E.06554
G1 X154.683 Y98.952 E.10983
G1 X160.08 Y104.349 E.25319
G1 X161.327 Y104.349 E.04136
G1 X166.724 Y98.952 E.25318
G1 X170.035 Y98.952 E.10984
G1 X204.044 Y132.96 E1.59542
G1 X204.044 Y130.716 E.07447
G1 X177.71 Y157.05 E1.23539
G1 X174.402 Y157.05 E.10975
G1 X157.146 Y139.794 E.80952
G2 X157.699 Y138.68 I-11.055 J-6.195 E.04126
G1 X162.727 Y133.652 E.23588
G1 X166.356 Y133.652 E.12035
G1 X189.754 Y157.05 E1.09765
G1 X193.062 Y157.05 E.10975
G1 X204.044 Y146.067 E.5152
G1 X204.044 Y148.312 E.07447
G1 X170.151 Y114.42 E1.58998
G1 X170.151 Y110.877 E.11753
G1 X182.076 Y98.952 E.55941
G1 X185.388 Y98.952 E.10985
G1 X204.044 Y117.609 E.87522
G1 X204.044 Y115.364 E.07447
G1 X162.358 Y157.05 E1.95558
G1 X159.05 Y157.05 E.10975
G1 X150.409 Y148.409 E.40534
G2 X154.134 Y144.458 I-19.058 J-21.695 E.18039
G1 X166.726 Y157.05 E.59071
G1 X170.034 Y157.05 E.10975
G1 X204.044 Y123.04 E1.59549
G1 X204.044 Y125.285 E.07447
G1 X177.712 Y98.952 E1.23532
G1 X174.4 Y98.952 E.10985
G1 X169.003 Y104.349 E.25318
G1 X167.756 Y104.349 E.04136
G1 X162.359 Y98.952 E.25319
G1 X159.048 Y98.952 E.10983
G1 X153.651 Y104.349 E.25319
G1 X153.651 Y102.72 E.05401
G1 X152.837 Y103.166 F30000
G1 F15476.087
G2 X152.85 Y104.794 I16.584 J.682 E.05403
G1 X149.219 Y101.163 E.17036
G1 X149.161 Y101.163 E.00191
G1 X107.014 Y143.31 E1.9772
G1 X107.239 Y143.618 E.01266
G1 X112.725 Y149.105 E.25738
G2 X114.996 Y150.68 I18.894 J-24.811 E.0917
G1 X160.513 Y105.163 E2.13531
G1 X160.895 Y105.163 E.01265
G1 X169.337 Y113.605 E.39606
G1 X169.337 Y111.691 E.06351
G1 X126.218 Y154.81 E2.02282
G1 X126.087 Y154.79 E.0044
G1 X90.663 Y119.367 E1.6618
G1 X90.663 Y121.281 E.06351
G1 X106.781 Y105.163 E.75615
G1 X107.163 Y105.163 E.01266
G1 X149.833 Y147.833 E2.00174
G2 X153.555 Y143.879 I-26.625 J-28.788 E.18027
G1 X110.839 Y101.163 E2.00389
G1 X110.781 Y101.163 E.00191
G1 X108.163 Y103.781 E.12284
G1 X108.163 Y102.153 E.05401
G1 X107.349 Y103.72 F30000
G1 F15476.087
G1 X107.349 Y104.349 E.02084
G1 X106.349 Y104.349 E.03317
G1 X100.951 Y98.951 E.25322
G1 X97.641 Y98.951 E.10978
G1 X92.244 Y104.349 E.25322
G1 X90.997 Y104.349 E.04136
G1 X85.599 Y98.951 E.25323
G1 X82.29 Y98.951 E.10977
G1 X55.953 Y125.287 E1.23549
G1 X55.954 Y123.037 E.07463
G1 X89.966 Y157.05 E1.59559
G1 X93.274 Y157.05 E.10975
G1 X106.431 Y143.893 E.61722
G3 X104.379 Y140.759 I25.18 J-18.73 E.12433
G1 X97.272 Y133.652 E.33339
G1 X93.644 Y133.652 E.12035
G1 X70.246 Y157.05 E1.09765
G1 X66.938 Y157.05 E.10975
G1 X55.951 Y146.063 E.51542
G1 X55.951 Y148.317 E.07479
G1 X89.849 Y114.42 E1.59022
G1 X89.849 Y110.877 E.11753
G1 X77.923 Y98.951 E.55947
G1 X74.614 Y98.951 E.10976
G1 X55.954 Y117.61 E.87536
G1 X55.954 Y115.362 E.07457
G1 X97.642 Y157.05 E1.95565
G1 X100.95 Y157.05 E.10975
G1 X110.07 Y147.93 E.42783
G2 X110.694 Y148.504 I11.965 J-12.38 E.02813
G1 X111.294 Y149.003 E.02589
G1 X110.646 Y147.354 F30000
G1 F15476.087
G1 X152.877 Y105.123 E1.98114
G1 X153.201 Y105.145 E.01075
G1 X169.337 Y121.281 E.757
G1 X169.337 Y119.367 E.06351
G1 X133.758 Y154.945 E1.66907
G1 X133.903 Y154.931 E.00482
G1 X90.663 Y111.691 E2.02849
G1 X90.663 Y113.605 E.06351
G1 X99.105 Y105.163 E.39606
G1 X99.487 Y105.163 E.01266
G1 X145.382 Y151.058 E2.15303
G1 X145.229 Y151.151 E.00594
G1 X155.758 Y140.622 E.49393
G2 X156.542 Y139.19 I-14.03 J-8.611 E.05418
G1 X122.513 Y105.161 E1.59636
G1 X122.135 Y105.161 E.01254
G1 X94.458 Y132.838 E1.29837
G1 X96.458 Y132.838 E.06633
G1 X90.663 Y127.043 E.27187
G1 X90.663 Y128.957 E.06351
G1 X116.338 Y103.282 E1.20447
G1 X116.339 Y104.91 E.05401
G1 X116.07 Y100.756 F30000
G1 F15476.087
G1 X108.373 Y100.773 E.25535
G1 X107.756 Y101.414 E.02952
G1 X107.743 Y104.744 E.11047
G1 X90.914 Y104.756 E.55823
G1 X90.273 Y105.373 E.02952
G1 X90.256 Y132.586 E.9027
G1 X90.873 Y133.227 E.02952
G2 X91.047 Y133.244 I.108 J-.202 E.00595
G1 X101.674 Y133.246 E.35253
G1 X101.778 Y133.321 E.00428
G3 X102.215 Y134.81 I-10.048 J3.753 E.05151
G1 X102.693 Y136.204 E.04887
G1 X103.852 Y138.906 E.09751
G1 X104.531 Y140.213 E.04887
G1 X106.079 Y142.714 E.09758
G1 X107.866 Y145.05 E.09757
G1 X109.875 Y147.197 E.09751
G1 X110.959 Y148.194 E.04887
G1 X113.263 Y150.019 E.09751
G1 X114.483 Y150.845 E.04887
G1 X117.035 Y152.309 E.09758
G1 X119.717 Y153.512 E.09751
G1 X121.102 Y154.013 E.04887
G1 X123.935 Y154.806 E.09758
G1 X126.83 Y155.313 E.09751
G1 X128.382 Y155.464 E.05173
G1 X131.235 Y155.532 E.09465
G1 X134.168 Y155.314 E.09758
G1 X135.625 Y155.095 E.04887
G1 X138.492 Y154.445 E.09751
G1 X139.9 Y154.013 E.04887
G1 X142.638 Y152.944 E.09751
G1 X145.259 Y151.609 E.09757
G1 X146.519 Y150.844 E.04887
G1 X148.911 Y149.136 E.09751
G1 X151.124 Y147.198 E.09758
G1 X152.157 Y146.148 E.04887
G1 X154.057 Y143.905 E.09751
G1 X154.923 Y142.713 E.04887
G1 X156.469 Y140.213 E.09751
G1 X157.148 Y138.905 E.04887
G1 X158.307 Y136.204 E.09751
G1 X159.191 Y133.403 E.09744
G3 X159.322 Y133.246 I.192 J.027 E.00713
G1 X169.086 Y133.244 E.3239
G1 X169.744 Y132.586 E.03089
G1 X169.744 Y105.414 E.90132
G1 X169.086 Y104.756 E.03089
G1 X153.255 Y104.741 E.52513
G3 X153.244 Y101.414 I33.866 J-1.773 E.11038
G1 X152.586 Y100.756 E.03089
G1 X144.914 Y100.756 E.25447
G1 X144.273 Y101.373 E.02952
G2 X144.256 Y101.836 I.55 J.252 E.01577
G1 X144.256 Y104.535 E.08954
G3 X144.232 Y104.745 I-1.391 J-.048 E.00702
G3 X143.417 Y104.756 I-.514 J-8.239 E.02707
G1 X116.746 Y104.754 E.88472
G1 X116.744 Y101.414 E.11079
G1 X116.127 Y100.773 E.0295
G1 X116.87 Y100.94 F30000
G1 F15476.087
G3 X117.151 Y101.332 I-.334 J.536 E.01645
G1 X117.152 Y102.468 E.03768
G1 X120.669 Y98.951 E.165
G1 X123.979 Y98.951 E.1098
G1 X129.376 Y104.348 E.25316
G1 X130.624 Y104.348 E.04142
G1 X136.021 Y98.951 E.25316
G1 X139.331 Y98.951 E.10981
G1 X143.849 Y103.469 E.21192
G1 X143.849 Y101.841 E.05401
G1 X143.825 Y105.163 F30000
G1 F15476.087
G2 X144.597 Y105.135 I.103 J-7.819 E.02564
G2 X144.663 Y104.283 I-3.791 J-.723 E.0284
G1 X169.337 Y128.957 E1.15752
G1 X169.337 Y127.043 E.06351
G1 X163.542 Y132.838 E.27187
G1 X165.542 Y132.838 E.06634
G1 X137.866 Y105.162 E1.29831
G1 X137.486 Y105.162 E.01262
G1 X104.124 Y138.524 E1.56505
G3 X102.118 Y133.064 I31.063 J-14.517 E.19318
G1 X101.996 Y132.976 E.00498
G1 X129.81 Y105.162 E1.30484
G1 X130.19 Y105.162 E.01258
G1 X158.692 Y133.664 E1.33712
G3 X158.214 Y135.22 I-15.908 J-4.038 E.05402
G1 X160.475 Y133.653 F30000
G1 F15476.087
G1 X159.543 Y133.653 E.03092
G1 X159.35 Y134.322 E.0231
G1 X182.078 Y157.05 E1.0662
G1 X185.386 Y157.05 E.10975
G1 X204.044 Y138.391 E.87529
G1 X204.044 Y140.636 E.07447
G1 X170.151 Y106.744 E1.58998
G1 X170.151 Y108.372 E.05401
G1 X169.337 Y107.558 F30000
G1 F15476.087
G1 X169.337 Y105.929 E.05401
G1 X168.571 Y105.163 E.03596
G1 X168.189 Y105.163 E.01266
G1 X120.125 Y153.227 E2.25478
G2 X121.663 Y153.76 I6.135 J-15.225 E.05402
G1 X121.023 Y154.415 F30000
G1 F15476.087
G1 X120.978 Y154.401 E.00157
G3 X119.493 Y153.859 I52.97 J-147.569 E.05244
G1 X116.302 Y157.05 E.14966
G1 X112.994 Y157.05 E.10975
G1 X56.661 Y100.716 E2.64271
G2 X56.04 Y102.173 I5.677 J3.281 E.05265
G1 X59.175 Y99.038 E.14708
G3 X60.016 Y98.95 I.953 J5.089 E.02808
G1 X62.571 Y98.95 E.08474
G1 X89.849 Y126.229 E1.27967
G1 X89.849 Y129.771 E.11753
G1 X62.57 Y157.05 E1.27968
G3 X59.406 Y157.005 I-1.275 J-21.636 E.10508
G1 X59.162 Y156.95 E.00828
G1 X56.038 Y153.825 E.14659
G2 X56.666 Y155.278 I5.603 J-1.561 E.05268
G1 X89.849 Y122.096 E1.55667
G1 X89.849 Y118.553 E.11753
G1 X70.247 Y98.95 E.91957
G1 X66.938 Y98.95 E.10975
G1 X55.955 Y109.933 E.51523
G1 X55.955 Y107.687 E.07451
G1 X105.318 Y157.05 E2.3157
G1 X108.626 Y157.05 E.10975
G1 X114.403 Y151.273 E.271
G2 X115.634 Y152.014 I8.305 J-12.403 E.04767
G1 X120.67 Y157.05 E.23625
G1 X123.978 Y157.05 E.10975
G1 X125.502 Y155.526 E.07148
G2 X127.04 Y155.744 I2.991 J-15.6 E.05154
G1 X128.346 Y157.05 E.06127
G1 X131.654 Y157.05 E.10975
G1 X132.85 Y155.854 E.05609
G2 X134.629 Y155.656 I-1.121 J-18.185 E.05939
G1 X136.022 Y157.05 E.06536
G1 X139.33 Y157.05 E.10975
G1 X143.302 Y153.078 E.18634
G2 X145.975 Y151.651 I-12.988 J-27.54 E.10054
G1 X151.374 Y157.05 E.25328
G1 X154.682 Y157.05 E.10975
G1 X204.044 Y107.688 E2.31568
G1 X204.044 Y109.933 E.07447
G1 X193.064 Y98.952 E.51512
G1 X189.752 Y98.952 E.10986
G1 X170.151 Y118.553 E.9195
G1 X170.151 Y122.096 E.11753
G1 X203.339 Y155.284 E1.55692
G2 X203.96 Y153.827 I-5.677 J-3.281 E.05265
G1 X200.825 Y156.962 E.14708
G3 X199.984 Y157.05 I-.953 J-5.088 E.02808
G1 X197.429 Y157.05 E.08474
G1 X170.151 Y129.771 E1.27968
G1 X170.151 Y126.229 E.11753
G1 X197.428 Y98.952 E1.27959
G3 X200.396 Y98.97 I1.314 J27.719 E.09852
G3 X200.825 Y99.038 I-.127 J2.212 E.01443
G1 X203.958 Y102.171 E.14699
G2 X203.341 Y100.715 I-4.056 J.863 E.05278
G1 X147.006 Y157.05 E2.64276
G1 X143.698 Y157.05 E.10975
G1 X140.776 Y154.128 E.13705
G3 X139.232 Y154.643 I-5.997 J-15.411 E.05402
G1 X138.59 Y153.989 F30000
G1 F15476.087
G2 X140.141 Y153.493 I-4.22 J-15.863 E.05402
G1 X91.811 Y105.163 E2.26724
G1 X91.429 Y105.163 E.01266
G1 X90.663 Y105.929 E.03596
G1 X90.663 Y107.558 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X90.663 Y105.929 E-.61876
G1 X90.926 Y105.667 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/105
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
G3 Z2.6 I.106 J-1.212 P1  F30000
G1 X55.624 Y102.569 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
G1 X200.073 Y98.604 E4.64624
G3 X204.398 Y103.007 I-.084 J4.408 E.22678
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.411 J-.006 E.22946
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I-.004 J-4.401 E.2296
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.233 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X55.234 Y102.531 E.00004
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.078 Y98.212 E4.30413
G3 X204.79 Y103.003 I-.09 J4.801 E.22868
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.804 J-.012 E.23117
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.001 J-4.793 E.23131
G1 X55.21 Y103.003 E1.5362
G1 X55.23 Y102.591 E.01266
M204 S10000
; WIPE_START
G1 F24000
G1 X55.234 Y102.531 E-.02299
G1 X55.302 Y102.066 E-.1786
G1 X55.416 Y101.61 E-.17864
G1 X55.575 Y101.167 E-.17861
G1 X55.776 Y100.742 E-.17863
G1 X55.806 Y100.691 E-.02254
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.268 J1.187 P1  F30000
G1 X89.849 Y108.372 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X89.849 Y106.744 E.05401
G1 X55.952 Y140.641 E1.59018
G1 X55.952 Y138.388 E.07474
G1 X74.614 Y157.05 E.87548
G1 X77.922 Y157.05 E.10975
G1 X101.319 Y133.653 E1.09759
G1 X101.457 Y133.653 E.00457
G2 X103.512 Y139.136 I30.582 J-8.338 E.19451
G1 X85.598 Y157.05 E.84038
G1 X82.29 Y157.05 E.10975
G1 X55.953 Y130.712 E1.23553
G1 X55.953 Y132.964 E.07468
G1 X89.966 Y98.951 E1.59562
G1 X93.275 Y98.951 E.10978
G1 X98.673 Y104.349 E.25323
G1 X99.92 Y104.349 E.04136
G1 X105.317 Y98.951 E.25322
G1 X108.627 Y98.951 E.10979
G1 X110.025 Y100.349 E.06557
G1 X111.596 Y100.349 E.05211
G1 X112.993 Y98.951 E.06556
G1 X116.303 Y98.951 E.1098
G1 X121.699 Y104.347 E.25314
G1 X122.949 Y104.347 E.04146
G1 X128.345 Y98.951 E.25314
G1 X131.655 Y98.951 E.10981
G1 X137.052 Y104.348 E.25318
G1 X138.3 Y104.348 E.04139
G1 X143.697 Y98.952 E.25317
G1 X147.007 Y98.952 E.10983
G1 X148.404 Y100.349 E.06554
G1 X149.975 Y100.349 E.05211
G1 X151.372 Y98.952 E.06554
G1 X154.683 Y98.952 E.10983
G1 X160.08 Y104.349 E.25318
G1 X161.327 Y104.349 E.04136
G1 X166.724 Y98.952 E.25318
G1 X170.036 Y98.952 E.10985
G1 X204.044 Y132.96 E1.59541
G1 X204.044 Y130.716 E.07447
G1 X177.71 Y157.05 E1.23539
G1 X174.402 Y157.05 E.10975
G1 X157.146 Y139.794 E.80952
G2 X157.699 Y138.68 I-11.055 J-6.195 E.04126
G1 X162.727 Y133.652 E.23588
G1 X166.356 Y133.652 E.12035
G1 X189.754 Y157.05 E1.09765
G1 X193.062 Y157.05 E.10975
G1 X204.044 Y146.067 E.5152
G1 X204.044 Y148.312 E.07447
G1 X170.151 Y114.42 E1.58998
G1 X170.151 Y110.877 E.11753
G1 X182.076 Y98.952 E.5594
G1 X185.388 Y98.952 E.10986
M73 P35 R31
G1 X204.044 Y117.609 E.87521
G1 X204.044 Y115.364 E.07447
G1 X162.358 Y157.05 E1.95558
G1 X159.05 Y157.05 E.10975
G1 X150.409 Y148.409 E.40534
G2 X154.134 Y144.458 I-19.058 J-21.695 E.18039
G1 X166.726 Y157.05 E.59071
G1 X170.034 Y157.05 E.10975
G1 X204.044 Y123.04 E1.59549
G1 X204.044 Y125.285 E.07447
G1 X177.712 Y98.952 E1.23531
G1 X174.4 Y98.952 E.10985
G1 X169.003 Y104.349 E.25317
G1 X167.756 Y104.349 E.04136
G1 X162.36 Y98.952 E.25318
M73 P35 R30
G1 X159.048 Y98.952 E.10984
G1 X153.651 Y104.349 E.25318
G1 X153.651 Y102.72 E.05401
G1 X152.837 Y103.166 F30000
G1 F15476.087
G2 X152.85 Y104.794 I16.584 J.682 E.05403
G1 X149.219 Y101.163 E.17036
G1 X149.161 Y101.163 E.00191
G1 X107.014 Y143.31 E1.9772
G1 X107.239 Y143.618 E.01266
G1 X112.725 Y149.105 E.25738
G2 X114.996 Y150.68 I18.894 J-24.811 E.0917
G1 X160.513 Y105.163 E2.13531
G1 X160.895 Y105.163 E.01265
G1 X169.337 Y113.605 E.39606
G1 X169.337 Y111.691 E.06351
G1 X126.218 Y154.81 E2.02282
G1 X126.087 Y154.79 E.0044
G1 X90.663 Y119.367 E1.6618
G1 X90.663 Y121.281 E.06351
G1 X106.781 Y105.163 E.75615
G1 X107.163 Y105.163 E.01266
G1 X149.833 Y147.833 E2.00174
G2 X153.555 Y143.879 I-26.625 J-28.788 E.18027
G1 X110.839 Y101.163 E2.00389
G1 X110.781 Y101.163 E.00191
G1 X108.163 Y103.781 E.12284
G1 X108.163 Y102.153 E.05401
G1 X107.349 Y103.72 F30000
G1 F15476.087
G1 X107.349 Y104.349 E.02084
G1 X106.349 Y104.349 E.03317
G1 X100.951 Y98.951 E.25322
G1 X97.641 Y98.951 E.10978
G1 X92.244 Y104.349 E.25322
G1 X90.997 Y104.349 E.04136
G1 X85.599 Y98.951 E.25323
G1 X82.29 Y98.951 E.10977
G1 X55.953 Y125.287 E1.23549
G1 X55.954 Y123.037 E.07463
G1 X89.966 Y157.05 E1.59559
G1 X93.274 Y157.05 E.10975
G1 X106.431 Y143.893 E.61722
G3 X104.379 Y140.759 I25.18 J-18.73 E.12433
G1 X97.272 Y133.652 E.33339
G1 X93.644 Y133.652 E.12035
G1 X70.246 Y157.05 E1.09765
G1 X66.938 Y157.05 E.10975
G1 X55.951 Y146.063 E.51542
G1 X55.951 Y148.317 E.07479
G1 X89.849 Y114.42 E1.59022
G1 X89.849 Y110.877 E.11753
G1 X77.923 Y98.951 E.55947
G1 X74.614 Y98.951 E.10976
G1 X55.954 Y117.61 E.87536
G1 X55.954 Y115.362 E.07457
G1 X97.642 Y157.05 E1.95565
G1 X100.95 Y157.05 E.10975
G1 X110.07 Y147.93 E.42783
G2 X110.694 Y148.504 I11.965 J-12.38 E.02813
G1 X111.294 Y149.003 E.02589
G1 X110.646 Y147.354 F30000
G1 F15476.087
G1 X152.877 Y105.123 E1.98114
G1 X153.201 Y105.145 E.01075
G1 X169.337 Y121.281 E.757
G1 X169.337 Y119.367 E.06351
G1 X133.758 Y154.945 E1.66907
G1 X133.903 Y154.931 E.00482
G1 X90.663 Y111.691 E2.02849
G1 X90.663 Y113.605 E.06351
G1 X99.105 Y105.163 E.39606
G1 X99.487 Y105.163 E.01266
G1 X145.382 Y151.058 E2.15303
G1 X145.229 Y151.151 E.00594
G1 X155.758 Y140.622 E.49393
G2 X156.542 Y139.19 I-14.03 J-8.611 E.05418
G1 X122.513 Y105.161 E1.59636
G1 X122.135 Y105.161 E.01254
G1 X94.458 Y132.838 E1.29837
G1 X96.458 Y132.838 E.06633
G1 X90.663 Y127.043 E.27187
G1 X90.663 Y128.957 E.06351
G1 X116.338 Y103.282 E1.20447
G1 X116.339 Y104.91 E.05401
G1 X116.07 Y100.756 F30000
G1 F15476.087
G1 X108.373 Y100.773 E.25535
G1 X107.756 Y101.414 E.02952
G1 X107.743 Y104.744 E.11047
G1 X90.914 Y104.756 E.55823
G1 X90.273 Y105.373 E.02952
G1 X90.256 Y132.586 E.9027
G1 X90.873 Y133.227 E.02952
G2 X91.047 Y133.244 I.108 J-.202 E.00595
G1 X101.674 Y133.246 E.35253
G1 X101.778 Y133.321 E.00428
G3 X102.215 Y134.81 I-10.048 J3.753 E.05151
G1 X102.693 Y136.204 E.04887
G1 X103.852 Y138.906 E.09751
G1 X104.531 Y140.213 E.04887
G1 X106.079 Y142.714 E.09758
G1 X107.866 Y145.05 E.09757
G1 X109.875 Y147.197 E.09751
G1 X110.959 Y148.194 E.04887
G1 X113.263 Y150.019 E.09751
G1 X114.483 Y150.845 E.04887
G1 X117.035 Y152.309 E.09758
G1 X119.717 Y153.512 E.09751
G1 X121.102 Y154.013 E.04887
G1 X123.935 Y154.806 E.09758
G1 X126.83 Y155.313 E.09751
G1 X128.382 Y155.464 E.05173
G1 X131.235 Y155.532 E.09465
G1 X134.168 Y155.314 E.09758
G1 X135.625 Y155.095 E.04887
G1 X138.492 Y154.445 E.09751
G1 X139.9 Y154.013 E.04887
G1 X142.638 Y152.944 E.09751
G1 X145.259 Y151.609 E.09757
G1 X146.519 Y150.844 E.04887
G1 X148.911 Y149.136 E.09751
G1 X151.124 Y147.198 E.09758
G1 X152.157 Y146.148 E.04887
G1 X154.057 Y143.905 E.09751
G1 X154.923 Y142.713 E.04887
G1 X156.469 Y140.213 E.09751
G1 X157.148 Y138.905 E.04887
G1 X158.307 Y136.204 E.09751
G1 X159.191 Y133.403 E.09744
G3 X159.322 Y133.246 I.192 J.027 E.00713
G1 X169.086 Y133.244 E.3239
G1 X169.744 Y132.586 E.03089
G1 X169.744 Y105.414 E.90132
G1 X169.086 Y104.756 E.03089
G1 X153.255 Y104.741 E.52513
G3 X153.244 Y101.414 I33.866 J-1.773 E.11038
G1 X152.586 Y100.756 E.03089
G1 X144.914 Y100.756 E.25447
G1 X144.273 Y101.373 E.02952
G2 X144.256 Y101.836 I.55 J.252 E.01577
G1 X144.256 Y104.535 E.08954
G3 X144.232 Y104.745 I-1.391 J-.048 E.00702
G3 X143.417 Y104.756 I-.514 J-8.239 E.02707
G1 X116.746 Y104.754 E.88472
G1 X116.744 Y101.414 E.11079
G1 X116.127 Y100.773 E.0295
G1 X116.87 Y100.94 F30000
G1 F15476.087
G3 X117.151 Y101.332 I-.334 J.536 E.01645
G1 X117.152 Y102.468 E.03768
G1 X120.669 Y98.951 E.165
G1 X123.979 Y98.951 E.1098
G1 X129.376 Y104.348 E.25316
G1 X130.624 Y104.348 E.04142
G1 X136.021 Y98.951 E.25315
G1 X139.331 Y98.951 E.10982
G1 X143.849 Y103.469 E.21192
G1 X143.849 Y101.841 E.05401
G1 X143.825 Y105.163 F30000
G1 F15476.087
G2 X144.597 Y105.135 I.103 J-7.819 E.02564
G2 X144.663 Y104.283 I-3.791 J-.723 E.0284
G1 X169.337 Y128.957 E1.15752
G1 X169.337 Y127.043 E.06351
G1 X163.542 Y132.838 E.27187
G1 X165.542 Y132.838 E.06634
G1 X137.866 Y105.162 E1.29831
G1 X137.486 Y105.162 E.01262
G1 X104.124 Y138.524 E1.56505
G3 X102.118 Y133.064 I31.063 J-14.517 E.19318
G1 X101.996 Y132.976 E.00498
G1 X129.81 Y105.162 E1.30484
G1 X130.19 Y105.162 E.01258
G1 X158.692 Y133.664 E1.33712
G3 X158.214 Y135.22 I-15.908 J-4.038 E.05402
G1 X160.475 Y133.653 F30000
G1 F15476.087
G1 X159.543 Y133.653 E.03092
G1 X159.35 Y134.322 E.0231
G1 X182.078 Y157.05 E1.0662
G1 X185.386 Y157.05 E.10975
G1 X204.044 Y138.391 E.87529
G1 X204.044 Y140.636 E.07447
G1 X170.151 Y106.744 E1.58998
G1 X170.151 Y108.372 E.05401
G1 X169.337 Y107.558 F30000
G1 F15476.087
G1 X169.337 Y105.929 E.05401
G1 X168.571 Y105.163 E.03596
G1 X168.189 Y105.163 E.01266
G1 X120.125 Y153.227 E2.25478
G2 X121.663 Y153.76 I6.135 J-15.225 E.05402
G1 X121.023 Y154.415 F30000
G1 F15476.087
G1 X120.978 Y154.401 E.00157
G3 X119.493 Y153.859 I52.97 J-147.569 E.05244
G1 X116.302 Y157.05 E.14966
G1 X112.994 Y157.05 E.10975
G1 X56.661 Y100.716 E2.64271
G2 X56.04 Y102.173 I5.677 J3.281 E.05265
G1 X59.175 Y99.038 E.14708
G3 X60.016 Y98.95 I.953 J5.089 E.02808
G1 X62.571 Y98.95 E.08474
G1 X89.849 Y126.229 E1.27967
G1 X89.849 Y129.771 E.11753
G1 X62.57 Y157.05 E1.27968
G3 X59.406 Y157.005 I-1.275 J-21.636 E.10508
G1 X59.162 Y156.95 E.00828
G1 X56.038 Y153.825 E.14659
G2 X56.666 Y155.278 I5.603 J-1.561 E.05268
G1 X89.849 Y122.096 E1.55667
G1 X89.849 Y118.553 E.11753
G1 X70.247 Y98.95 E.91957
G1 X66.938 Y98.95 E.10975
G1 X55.955 Y109.933 E.51523
G1 X55.955 Y107.687 E.07451
G1 X105.318 Y157.05 E2.3157
G1 X108.626 Y157.05 E.10975
G1 X114.403 Y151.273 E.271
G2 X115.634 Y152.014 I8.305 J-12.403 E.04767
G1 X120.67 Y157.05 E.23625
G1 X123.978 Y157.05 E.10975
G1 X125.502 Y155.526 E.07148
G2 X127.04 Y155.744 I2.991 J-15.6 E.05154
G1 X128.346 Y157.05 E.06127
G1 X131.654 Y157.05 E.10975
G1 X132.85 Y155.854 E.05609
G2 X134.629 Y155.656 I-1.121 J-18.185 E.05939
G1 X136.022 Y157.05 E.06536
G1 X139.33 Y157.05 E.10975
G1 X143.302 Y153.078 E.18634
G2 X145.975 Y151.651 I-12.988 J-27.54 E.10054
G1 X151.374 Y157.05 E.25328
G1 X154.682 Y157.05 E.10975
G1 X204.044 Y107.688 E2.31568
G1 X204.044 Y109.933 E.07447
G1 X193.064 Y98.952 E.51511
G1 X189.752 Y98.952 E.10987
G1 X170.151 Y118.553 E.91949
G1 X170.151 Y122.096 E.11753
G1 X203.339 Y155.284 E1.55692
G2 X203.96 Y153.827 I-5.677 J-3.281 E.05265
G1 X200.825 Y156.962 E.14708
G3 X199.984 Y157.05 I-.953 J-5.089 E.02808
G1 X197.429 Y157.05 E.08474
G1 X170.151 Y129.771 E1.27968
G1 X170.151 Y126.229 E.11753
G1 X197.428 Y98.952 E1.27958
G3 X200.396 Y98.97 I1.318 J27.427 E.09852
G3 X200.825 Y99.038 I-.127 J2.212 E.01443
G1 X203.958 Y102.171 E.14699
G2 X203.341 Y100.715 I-4.056 J.863 E.05278
G1 X147.006 Y157.05 E2.64276
G1 X143.698 Y157.05 E.10975
G1 X140.776 Y154.128 E.13705
G3 X139.232 Y154.643 I-5.997 J-15.411 E.05402
G1 X138.59 Y153.989 F30000
G1 F15476.087
G2 X140.141 Y153.493 I-4.22 J-15.863 E.05402
G1 X91.811 Y105.163 E2.26724
G1 X91.429 Y105.163 E.01266
G1 X90.663 Y105.929 E.03596
G1 X90.663 Y107.558 E.05401
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X90.663 Y105.929 E-.61876
G1 X90.926 Y105.667 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/105
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
G3 Z2.8 I.106 J-1.212 P1  F30000
G1 X55.624 Y102.569 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
G1 X200.08 Y98.604 E4.64647
G3 X204.398 Y103.007 I-.091 J4.408 E.22655
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.411 J-.006 E.22946
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I.006 J-4.411 E.22946
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.233 Y102.53 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X55.304 Y102.066 E.01442
G3 X60.003 Y98.21 I4.71 J.948 E.2022
G1 X200.085 Y98.212 E4.30434
G3 X204.79 Y103.003 I-.097 J4.801 E.22847
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.804 J-.012 E.23117
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.012 J-4.804 E.23117
G1 X55.21 Y103.003 E1.5362
G3 X55.229 Y102.589 I4.804 J.012 E.01272
M204 S10000
; WIPE_START
G1 F24000
G1 X55.304 Y102.066 E-.20081
G1 X55.416 Y101.61 E-.17859
G1 X55.575 Y101.167 E-.17862
G1 X55.776 Y100.742 E-.17863
G1 X55.807 Y100.689 E-.02335
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.268 J1.187 P1  F30000
G1 X89.849 Y108.372 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X89.849 Y106.744 E.05401
G1 X55.952 Y140.641 E1.59018
G1 X55.952 Y138.388 E.07474
G1 X74.614 Y157.05 E.87548
G1 X77.922 Y157.05 E.10975
G1 X101.319 Y133.653 E1.09759
G1 X101.457 Y133.653 E.00457
G2 X103.512 Y139.136 I30.582 J-8.338 E.19451
G1 X85.598 Y157.05 E.84038
G1 X82.29 Y157.05 E.10975
G1 X55.953 Y130.712 E1.23553
G1 X55.953 Y132.964 E.07468
G1 X89.965 Y98.951 E1.59562
G1 X93.275 Y98.951 E.10978
G1 X98.673 Y104.349 E.25322
G1 X99.92 Y104.349 E.04136
G1 X105.317 Y98.951 E.25321
G1 X108.627 Y98.951 E.10979
G1 X110.025 Y100.349 E.06556
G1 X111.596 Y100.349 E.05211
G1 X112.993 Y98.951 E.06556
G1 X116.303 Y98.951 E.1098
G1 X121.699 Y104.347 E.25314
G1 X122.949 Y104.347 E.04146
G1 X128.345 Y98.951 E.25313
G1 X131.655 Y98.951 E.10982
G1 X137.052 Y104.348 E.25317
G1 X138.3 Y104.348 E.04139
G1 X143.696 Y98.952 E.25317
G1 X147.007 Y98.952 E.10983
G1 X148.404 Y100.349 E.06554
G1 X149.975 Y100.349 E.05211
G1 X151.372 Y98.952 E.06553
G1 X154.684 Y98.952 E.10984
G1 X160.08 Y104.349 E.25318
G1 X161.327 Y104.349 E.04136
G1 X166.724 Y98.952 E.25317
G1 X170.036 Y98.952 E.10986
G1 X204.044 Y132.96 E1.59541
G1 X204.044 Y130.716 E.07447
G1 X177.71 Y157.05 E1.23539
G1 X174.402 Y157.05 E.10975
G1 X157.146 Y139.794 E.80952
G2 X157.699 Y138.68 I-11.055 J-6.195 E.04126
G1 X162.727 Y133.652 E.23588
G1 X166.356 Y133.652 E.12035
G1 X189.754 Y157.05 E1.09765
G1 X193.062 Y157.05 E.10975
G1 X204.044 Y146.067 E.5152
G1 X204.044 Y148.312 E.07447
G1 X170.151 Y114.42 E1.58998
G1 X170.151 Y110.877 E.11753
G1 X182.076 Y98.952 E.5594
G1 X185.388 Y98.952 E.10987
G1 X204.044 Y117.609 E.8752
G1 X204.044 Y115.364 E.07447
G1 X162.358 Y157.05 E1.95558
G1 X159.05 Y157.05 E.10975
G1 X150.409 Y148.409 E.40534
G2 X154.134 Y144.458 I-19.058 J-21.695 E.18039
G1 X166.726 Y157.05 E.59071
G1 X170.034 Y157.05 E.10975
G1 X204.044 Y123.04 E1.59549
G1 X204.044 Y125.285 E.07447
G1 X177.712 Y98.952 E1.23531
G1 X174.4 Y98.952 E.10986
G1 X169.003 Y104.349 E.25316
G1 X167.756 Y104.349 E.04136
G1 X162.36 Y98.952 E.25317
G1 X159.048 Y98.952 E.10985
G1 X153.651 Y104.349 E.25317
G1 X153.651 Y102.72 E.05401
G1 X153.216 Y100.896 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X153.146 Y100.827 E.00272
G1 X152.126 Y100.575 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.401556
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X153.223 Y101.672 E.08007
G1 X153.223 Y102.311 E.03295
G1 X151.689 Y100.777 E.11189
G1 X151.051 Y100.777 E.03295
G1 X153.223 Y102.949 E.15849
G1 X153.223 Y103.588 E.03295
G1 X150.412 Y100.777 E.20509
G1 X149.774 Y100.777 E.03295
G1 X153.223 Y104.226 E.25169
G1 X153.223 Y104.522 E.01525
G2 X153.346 Y104.77 I.29 J.011 E.01491
G2 X153.774 Y104.777 I.282 J-4.248 E.02208
G1 X169.723 Y120.726 E1.16384
G1 X169.723 Y120.088 E.03295
G1 X154.412 Y104.777 E1.11724
G1 X155.051 Y104.777 E.03295
G1 X169.723 Y119.449 E1.07064
G1 X169.723 Y118.811 E.03295
G1 X155.689 Y104.777 E1.02404
G1 X156.328 Y104.777 E.03295
G1 X169.723 Y118.172 E.97744
G1 X169.723 Y117.533 E.03295
G1 X156.967 Y104.777 E.93084
G1 X157.605 Y104.777 E.03295
G1 X169.723 Y116.895 E.88424
G1 X169.723 Y116.256 E.03295
G1 X158.244 Y104.777 E.83764
G1 X158.882 Y104.777 E.03295
G1 X169.723 Y115.618 E.79104
G1 X169.723 Y114.979 E.03295
G1 X159.521 Y104.777 E.74444
G1 X160.16 Y104.777 E.03295
G1 X169.723 Y114.34 E.69784
G1 X169.723 Y113.702 E.03295
G1 X160.798 Y104.777 E.65124
G1 X161.437 Y104.777 E.03295
G1 X169.723 Y113.063 E.60464
G1 X169.723 Y112.425 E.03295
G1 X162.075 Y104.777 E.55804
G1 X162.714 Y104.777 E.03295
M73 P36 R30
G1 X169.723 Y111.786 E.51144
G1 X169.723 Y111.147 E.03295
G1 X163.353 Y104.777 E.46484
G1 X163.991 Y104.777 E.03295
G1 X169.723 Y110.509 E.41825
G1 X169.723 Y109.87 E.03295
G1 X164.63 Y104.777 E.37165
G1 X165.268 Y104.777 E.03295
G1 X169.723 Y109.232 E.32505
G1 X169.723 Y108.593 E.03295
G1 X165.907 Y104.777 E.27845
G1 X166.546 Y104.777 E.03295
G1 X169.723 Y107.954 E.23185
G1 X169.723 Y107.316 E.03295
G1 X167.184 Y104.777 E.18525
G1 X167.823 Y104.777 E.03295
G1 X169.723 Y106.677 E.13865
G1 X169.723 Y106.039 E.03295
G1 X168.461 Y104.777 E.09205
G1 X169.081 Y104.777 E.03199
G1 X169.113 Y104.79 E.00177
G1 X169.925 Y105.603 E.05927
M106 S127.5
G1 X169.604 Y104.784 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X169.673 Y104.854 E.00273
G1 X170.151 Y108.372 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X170.151 Y106.744 E.05401
G1 X204.044 Y140.636 E1.58998
G1 X204.044 Y138.391 E.07447
G1 X185.386 Y157.05 E.87529
G1 X182.078 Y157.05 E.10975
G1 X159.35 Y134.322 E1.0662
G1 X159.543 Y133.653 E.0231
G1 X160.475 Y133.653 E.03092
G1 X169.604 Y133.216 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X169.673 Y133.146 E.00273
G1 X169.925 Y121.567 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.401556
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X149.135 Y100.777 E1.51711
G1 X148.496 Y100.777 E.03295
G1 X169.723 Y122.004 E1.54893
G1 X169.723 Y122.642 E.03295
G1 X147.858 Y100.777 E1.59553
G1 X147.219 Y100.777 E.03295
G1 X169.723 Y123.281 E1.64213
G1 X169.723 Y123.919 E.03295
G1 X146.581 Y100.777 E1.68873
G1 X145.942 Y100.777 E.03295
G1 X169.723 Y124.558 E1.73533
G1 X169.723 Y125.197 E.03295
G1 X145.303 Y100.777 E1.78193
G1 X144.919 Y100.777 E.01986
G2 X144.782 Y100.894 I.152 J.316 E.00939
G1 X169.723 Y125.835 E1.81999
G1 X169.723 Y126.474 E.03295
G1 X144.463 Y101.214 E1.84329
G1 X144.318 Y101.358 E.01057
G2 X144.277 Y101.419 I.052 J.079 E.00384
G1 X144.277 Y101.667 E.01281
G1 X169.723 Y127.112 E1.85682
G1 X169.723 Y127.751 E.03295
G1 X144.277 Y102.305 E1.85682
G1 X144.277 Y102.944 E.03295
G1 X169.723 Y128.39 E1.85682
G1 X169.723 Y129.028 E.03295
G1 X144.277 Y103.583 E1.85682
G1 X144.277 Y104.221 E.03295
G1 X169.723 Y129.667 E1.85682
G1 X169.723 Y130.305 E.03295
G1 X144.165 Y104.747 E1.86501
G1 X144.136 Y104.771 E.00194
G3 X143.556 Y104.777 I-.347 J-5.86 E.02993
G1 X169.723 Y130.944 E1.90944
G1 X169.723 Y131.582 E.03295
G1 X142.917 Y104.777 E1.95604
G1 X142.279 Y104.777 E.03295
G1 X169.723 Y132.221 E2.00265
G1 X169.723 Y132.581 E.01859
G1 X169.593 Y132.73 E.01018
G1 X141.64 Y104.777 E2.03981
G1 X141.002 Y104.777 E.03295
G1 X169.274 Y133.05 E2.06312
G1 X169.115 Y133.209 E.0116
G1 X169.082 Y133.223 E.00188
G1 X168.809 Y133.223 E.01409
G1 X140.363 Y104.777 E2.07575
G1 X139.724 Y104.777 E.03295
G1 X168.17 Y133.223 E2.07576
G1 X167.532 Y133.223 E.03295
G1 X139.086 Y104.777 E2.07577
G1 X138.447 Y104.777 E.03295
G1 X166.893 Y133.223 E2.07578
G1 X166.255 Y133.223 E.03295
G1 X137.808 Y104.777 E2.07579
G1 X137.17 Y104.777 E.03295
G1 X165.616 Y133.223 E2.0758
G1 X164.978 Y133.223 E.03294
G1 X136.531 Y104.777 E2.07582
G1 X135.892 Y104.777 E.03295
G1 X164.339 Y133.224 E2.07583
G1 X163.701 Y133.224 E.03295
G1 X135.254 Y104.777 E2.07584
G1 X134.615 Y104.777 E.03295
G1 X163.062 Y133.224 E2.07585
G1 X162.424 Y133.224 E.03295
G1 X133.976 Y104.777 E2.07586
G1 X133.338 Y104.777 E.03295
G1 X161.785 Y133.224 E2.07587
G1 X161.147 Y133.224 E.03295
G1 X132.699 Y104.776 E2.07589
G1 X132.061 Y104.776 E.03295
G1 X160.508 Y133.224 E2.0759
G1 X159.87 Y133.224 E.03295
G1 X131.422 Y104.776 E2.07591
G1 X130.783 Y104.776 E.03295
G1 X159.26 Y133.253 E2.078
G2 X159.172 Y133.393 I.233 J.244 E.00863
G1 X159.08 Y133.712 E.0171
G1 X130.145 Y104.776 E2.11147
G1 X129.506 Y104.776 E.03295
G1 X158.937 Y134.207 E2.14764
G1 X158.794 Y134.703 E.02661
G1 X128.867 Y104.776 E2.1838
G1 X128.229 Y104.776 E.03295
G1 X158.635 Y135.182 E2.2188
G1 X158.472 Y135.658 E.02594
G1 X127.59 Y104.776 E2.25349
G1 X126.951 Y104.776 E.03295
G1 X158.308 Y136.133 E2.28819
G1 X158.129 Y136.592 E.02543
G1 X126.313 Y104.776 E2.32167
G1 X125.674 Y104.776 E.03295
G1 X157.946 Y137.048 E2.35496
G1 X157.764 Y137.504 E.02535
G1 X125.036 Y104.776 E2.38826
G1 X124.397 Y104.776 E.03295
G1 X157.565 Y137.944 E2.42038
G1 X157.365 Y138.382 E.02485
G1 X123.758 Y104.776 E2.45233
G1 X123.12 Y104.776 E.03295
G1 X157.164 Y138.82 E2.48429
G1 X156.949 Y139.243 E.0245
G1 X122.481 Y104.776 E2.51518
G1 X121.842 Y104.776 E.03295
G1 X156.73 Y139.664 E2.54584
G1 X156.512 Y140.084 E.02443
G1 X121.204 Y104.776 E2.5765
G1 X120.565 Y104.776 E.03295
G1 X156.281 Y140.491 E2.60626
G1 X156.045 Y140.894 E.02409
G1 X119.926 Y104.776 E2.63567
G1 X119.288 Y104.776 E.03295
M73 P37 R30
G1 X155.81 Y141.297 E2.66508
G1 X155.564 Y141.691 E.02392
G1 X118.649 Y104.776 E2.69379
G1 X118.01 Y104.775 E.03295
G1 X155.312 Y142.077 E2.72198
G1 X155.06 Y142.463 E.02381
G1 X117.372 Y104.775 E2.75017
G1 X116.868 Y104.775 E.02599
G3 X116.724 Y104.596 I.103 J-.23 E.01233
G1 X116.724 Y104.128 E.02414
M73 P37 R29
G1 X113.374 Y100.777 E.2445
G1 X114.012 Y100.777 E.03295
G1 X116.724 Y103.489 E.19787
G1 X116.723 Y102.85 E.03297
G1 X114.651 Y100.777 E.15123
G1 X115.289 Y100.777 E.03295
G1 X116.723 Y102.211 E.1046
G1 X116.722 Y101.572 E.03297
G1 X115.726 Y100.575 E.07275
M106 S127.5
G1 X116.603 Y100.784 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X116.673 Y100.854 E.00273
G1 X117.044 Y100.867 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X117.044 Y101.114 E.00819
G3 X117.151 Y101.332 I-.21 J.238 E.00827
G1 X117.152 Y102.468 E.03768
G1 X120.669 Y98.951 E.165
G1 X123.979 Y98.951 E.10981
G1 X129.376 Y104.348 E.25315
G1 X130.624 Y104.348 E.04142
G1 X136.021 Y98.952 E.25315
G1 X139.331 Y98.952 E.10983
G1 X143.849 Y103.469 E.21191
G1 X143.849 Y101.841 E.05401
G1 X144.284 Y100.896 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X144.354 Y100.827 E.00273
G1 X107.784 Y100.896 F30000
G1 F15000
G1 X107.854 Y100.827 E.00272
G1 X107.349 Y103.72 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.349 Y104.349 E.02084
G1 X106.349 Y104.349 E.03317
G1 X100.951 Y98.951 E.25322
G1 X97.641 Y98.951 E.10979
G1 X92.244 Y104.349 E.25322
G1 X90.997 Y104.349 E.04136
G1 X85.599 Y98.951 E.25323
G1 X82.29 Y98.951 E.10977
G1 X55.953 Y125.287 E1.23549
G1 X55.954 Y123.037 E.07463
G1 X89.966 Y157.05 E1.59559
G1 X93.274 Y157.05 E.10975
G1 X106.431 Y143.893 E.61722
G3 X104.379 Y140.759 I25.18 J-18.73 E.12433
G1 X97.272 Y133.652 E.33339
G1 X93.644 Y133.652 E.12035
G1 X70.246 Y157.05 E1.09765
G1 X66.938 Y157.05 E.10975
G1 X55.951 Y146.063 E.51542
G1 X55.951 Y148.317 E.07479
G1 X89.849 Y114.42 E1.59022
G1 X89.849 Y110.877 E.11753
G1 X77.923 Y98.951 E.55947
G1 X74.614 Y98.951 E.10976
G1 X55.954 Y117.61 E.87536
G1 X55.954 Y115.362 E.07457
G1 X97.642 Y157.05 E1.95565
G1 X100.95 Y157.05 E.10975
G1 X110.07 Y147.93 E.42783
G2 X110.694 Y148.504 I11.966 J-12.381 E.02813
G1 X111.294 Y149.003 E.02589
G1 X106.797 Y144.011 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.401556
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X110.971 Y148.177 E.30433
G1 X112.102 Y149.119 E.07594
G1 X113.276 Y150.002 E.07578
G1 X113.742 Y150.317 E.02903
G1 X106.039 Y142.614 E.56209
G1 X105.292 Y141.471 E.07047
G1 X104.951 Y140.888 E.03486
G1 X115.501 Y151.438 E.76989
G1 X116.929 Y152.227 E.08417
G1 X104.167 Y139.465 E.9313
G1 X103.871 Y138.896 E.03307
G1 X103.562 Y138.221 E.03832
G1 X118.168 Y152.827 E1.06585
G1 X119.288 Y153.309 E.0629
G1 X103.072 Y137.093 E1.18332
G1 X102.661 Y136.043 E.05816
G1 X120.328 Y153.71 E1.2892
G1 X121.311 Y154.055 E.05376
G1 X102.327 Y135.071 E1.3853
G1 X102.047 Y134.153 E.04952
G1 X122.532 Y154.637 E1.4948
M106 S127.5
G1 X121.023 Y154.415 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X120.978 Y154.401 E.00157
G3 X119.493 Y153.859 I52.96 J-147.543 E.05244
G1 X116.302 Y157.05 E.14966
G1 X112.994 Y157.05 E.10975
G1 X56.661 Y100.716 E2.64271
M73 P38 R29
G2 X56.04 Y102.173 I5.677 J3.281 E.05265
G1 X59.175 Y99.038 E.14708
G3 X60.016 Y98.95 I.953 J5.089 E.02808
G1 X62.571 Y98.95 E.08474
G1 X89.849 Y126.229 E1.27967
G1 X89.849 Y129.771 E.11753
G1 X62.57 Y157.05 E1.27968
G3 X59.406 Y157.005 I-1.275 J-21.636 E.10508
G1 X59.162 Y156.95 E.00828
G1 X56.038 Y153.825 E.14659
G2 X56.666 Y155.278 I5.603 J-1.561 E.05268
G1 X89.849 Y122.096 E1.55667
G1 X89.849 Y118.553 E.11753
G1 X70.247 Y98.951 E.91957
G1 X66.938 Y98.95 E.10976
G1 X55.955 Y109.933 E.51523
G1 X55.955 Y107.687 E.07451
G1 X105.318 Y157.05 E2.3157
G1 X108.626 Y157.05 E.10975
G1 X114.403 Y151.273 E.271
G2 X115.634 Y152.014 I8.306 J-12.405 E.04767
G1 X120.67 Y157.05 E.23625
G1 X123.978 Y157.05 E.10975
G1 X125.502 Y155.526 E.07148
G2 X127.04 Y155.744 I2.991 J-15.599 E.05154
G1 X128.346 Y157.05 E.06127
G1 X131.654 Y157.05 E.10975
G1 X132.85 Y155.854 E.05609
G2 X134.629 Y155.656 I-1.12 J-18.185 E.05939
G1 X136.022 Y157.05 E.06536
G1 X139.33 Y157.05 E.10975
G1 X143.302 Y153.078 E.18634
G2 X145.975 Y151.651 I-12.989 J-27.541 E.10054
G1 X151.374 Y157.05 E.25328
G1 X154.682 Y157.05 E.10975
G1 X204.044 Y107.688 E2.31568
G1 X204.044 Y109.933 E.07447
G1 X193.064 Y98.952 E.5151
G1 X189.752 Y98.952 E.10988
G1 X170.151 Y118.553 E.91949
G1 X170.151 Y122.096 E.11753
G1 X203.339 Y155.284 E1.55692
G2 X203.96 Y153.827 I-5.677 J-3.281 E.05265
G1 X200.825 Y156.962 E.14708
G3 X199.984 Y157.05 I-.953 J-5.089 E.02808
G1 X197.429 Y157.05 E.08474
G1 X170.151 Y129.771 E1.27968
G1 X170.151 Y126.229 E.11753
G1 X197.427 Y98.952 E1.27958
G3 X200.396 Y98.97 I1.321 J27.133 E.09852
G3 X200.825 Y99.038 I-.127 J2.212 E.01443
G1 X203.958 Y102.171 E.14699
G2 X203.341 Y100.715 I-4.056 J.863 E.05278
G1 X147.006 Y157.05 E2.64276
G1 X143.698 Y157.05 E.10975
G1 X140.776 Y154.128 E.13705
G3 X139.232 Y154.643 I-5.997 J-15.411 E.05402
G1 X154.946 Y142.988 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.401556
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X112.735 Y100.777 E3.08023
G1 X112.096 Y100.777 E.03295
G1 X154.532 Y143.213 E3.09665
G1 X154.264 Y143.583 E.02359
G1 X111.458 Y100.777 E3.12364
G1 X110.819 Y100.777 E.03295
G1 X153.992 Y143.95 E3.15043
G1 X153.707 Y144.304 E.02344
G1 X110.181 Y100.777 E3.17624
G1 X109.542 Y100.777 E.03295
G1 X153.423 Y144.658 E3.20206
G1 X153.138 Y145.012 E.02344
G1 X108.903 Y100.777 E3.22787
G1 X108.419 Y100.777 E.02502
G2 X108.332 Y100.844 I.038 J.138 E.0058
G1 X152.838 Y145.35 E3.24771
G1 X152.537 Y145.688 E.02334
G1 X108.013 Y101.164 E3.24906
G1 X107.791 Y101.385 E.01615
G2 X107.777 Y101.567 I.213 J.108 E.00966
G1 X152.236 Y146.026 E3.24429
G1 X152.141 Y146.133 E.00741
G1 X151.925 Y146.353 E.01591
G1 X107.777 Y102.205 E3.22155
G1 X107.777 Y102.844 E.03295
G1 X151.608 Y146.675 E3.19844
G1 X151.292 Y146.997 E.0233
G1 X107.777 Y103.483 E3.17534
G1 X107.777 Y104.121 E.03295
G1 X150.968 Y147.312 E3.15174
G1 X150.636 Y147.618 E.02332
G1 X107.718 Y104.701 E3.13179
G1 X107.661 Y104.77 E.00465
G3 X107.156 Y104.777 I-.323 J-4.983 E.02606
G1 X150.303 Y147.924 E3.14854
G1 X149.968 Y148.228 E.02333
G1 X106.518 Y104.777 E3.17067
G1 X105.879 Y104.777 E.03295
G1 X149.62 Y148.518 E3.19185
G1 X149.271 Y148.808 E.0234
G1 X105.24 Y104.777 E3.21302
G1 X104.602 Y104.777 E.03295
G1 X148.923 Y149.098 E3.2342
G1 X148.559 Y149.373 E.02352
G1 X103.963 Y104.777 E3.25429
G1 X103.325 Y104.777 E.03295
G1 X148.195 Y149.648 E3.27429
G1 X147.83 Y149.922 E.02353
G1 X102.686 Y104.777 E3.29429
G1 X102.047 Y104.777 E.03295
G1 X147.454 Y150.184 E3.31346
G1 X147.074 Y150.442 E.02373
G1 X101.409 Y104.777 E3.33227
G1 X100.77 Y104.777 E.03295
G1 X146.693 Y150.7 E3.35109
G1 X146.304 Y150.949 E.02385
G1 X100.132 Y104.777 E3.36929
G1 X99.493 Y104.777 E.03295
G1 X145.906 Y151.191 E3.38689
G1 X145.509 Y151.432 E.02399
G1 X98.854 Y104.777 E3.4045
G1 X98.216 Y104.777 E.03295
G1 X145.106 Y151.667 E3.42167
G1 X144.691 Y151.892 E.02431
G1 X97.577 Y104.777 E3.43803
G1 X96.939 Y104.777 E.03295
G1 X144.277 Y152.116 E3.4544
G1 X143.859 Y152.336 E.02439
G1 X96.3 Y104.777 E3.47047
G1 X95.661 Y104.777 E.03295
G1 X143.427 Y152.543 E3.48556
G1 X142.995 Y152.75 E.02471
G1 X95.023 Y104.777 E3.50064
G1 X94.384 Y104.777 E.03295
G1 X142.56 Y152.953 E3.51552
G1 X142.11 Y153.142 E.02518
G1 X93.746 Y104.777 E3.52928
G1 X93.107 Y104.777 E.03295
G1 X141.66 Y153.331 E3.54304
G1 X141.208 Y153.516 E.02525
G1 X92.468 Y104.777 E3.55661
G1 X91.83 Y104.777 E.03295
G1 X140.739 Y153.686 E3.56899
G1 X140.27 Y153.856 E.02573
G1 X91.191 Y104.777 E3.58138
G1 X90.919 Y104.777 E.01407
G2 X90.726 Y104.95 I.229 J.449 E.01353
M73 P39 R29
G1 X139.797 Y154.022 E3.58084
G1 X139.308 Y154.172 E.02638
G1 X90.406 Y105.27 E3.56848
G1 X90.318 Y105.358 E.00647
G2 X90.277 Y105.419 I.052 J.079 E.00385
G1 X90.277 Y105.779 E.0186
G1 X138.82 Y154.322 E3.54225
G1 X138.324 Y154.465 E.02661
G1 X90.277 Y106.418 E3.5061
G1 X90.277 Y107.056 E.03295
M73 P39 R28
G1 X137.815 Y154.594 E3.46892
G1 X137.305 Y154.723 E.02712
G1 X90.277 Y107.695 E3.43174
G1 X90.277 Y108.333 E.03295
G1 X136.784 Y154.84 E3.39371
G1 X136.252 Y154.947 E.02798
G1 X90.277 Y108.972 E3.35491
G1 X90.277 Y109.611 E.03295
G1 X135.721 Y155.054 E3.31611
G1 X135.17 Y155.142 E.02878
G1 X90.277 Y110.249 E3.27591
G1 X90.277 Y110.888 E.03295
G1 X134.615 Y155.225 E3.23539
G1 X134.054 Y155.304 E.02919
G1 X90.277 Y111.526 E3.19451
G1 X90.277 Y112.165 E.03295
G1 X133.474 Y155.361 E3.15213
G1 X132.893 Y155.419 E.03012
G1 X90.277 Y112.804 E3.10975
G1 X90.277 Y113.442 E.03295
G1 X132.293 Y155.458 E3.06601
G1 X131.685 Y155.489 E.03143
G1 X90.277 Y114.081 E3.02161
G1 X90.277 Y114.719 E.03295
G1 X131.069 Y155.511 E2.97664
G1 X130.43 Y155.511 E.03295
G1 X90.277 Y115.358 E2.93004
G1 X90.277 Y115.997 E.03295
G1 X129.791 Y155.511 E2.88344
G1 X129.121 Y155.479 E.03464
G1 X90.277 Y116.635 E2.83451
G1 X90.277 Y117.274 E.03295
M73 P40 R28
G1 X128.449 Y155.446 E2.78547
G1 X127.748 Y155.383 E.0363
G1 X90.277 Y117.912 E2.73434
G1 X90.277 Y118.551 E.03295
G1 X127.039 Y155.313 E2.68259
G1 X126.3 Y155.212 E.03848
G1 X90.277 Y119.19 E2.62866
G1 X90.277 Y119.828 E.03295
G1 X125.549 Y155.1 E2.57384
G1 X124.76 Y154.95 E.04141
G1 X90.277 Y120.467 E2.5163
G1 X90.277 Y121.105 E.03295
G1 X123.961 Y154.789 E2.45797
G1 X123.107 Y154.574 E.04542
G1 X90.277 Y121.744 E2.39569
G1 X90.277 Y122.383 E.03295
G1 X101.119 Y133.224 E.79115
G1 X100.48 Y133.224 E.03296
G1 X90.277 Y123.021 E.74454
G1 X90.277 Y123.66 E.03295
G1 X99.842 Y133.224 E.69793
G1 X99.203 Y133.224 E.03296
G1 X90.277 Y124.298 E.65133
G1 X90.277 Y124.937 E.03295
G1 X98.564 Y133.224 E.60472
G1 X97.925 Y133.224 E.03296
G1 X90.277 Y125.576 E.55811
G1 X90.277 Y126.214 E.03295
G1 X97.287 Y133.224 E.5115
G1 X96.648 Y133.224 E.03296
G1 X90.277 Y126.853 E.4649
G1 X90.277 Y127.491 E.03295
G1 X96.009 Y133.224 E.41829
G1 X95.371 Y133.223 E.03296
G1 X90.277 Y128.13 E.37168
G1 X90.277 Y128.769 E.03295
G1 X94.732 Y133.223 E.32507
G1 X94.093 Y133.223 E.03296
G1 X90.277 Y129.407 E.27847
G1 X90.277 Y130.046 E.03295
G1 X93.455 Y133.223 E.23186
G1 X92.816 Y133.223 E.03296
G1 X90.277 Y130.684 E.18525
G1 X90.277 Y131.323 E.03295
G1 X92.177 Y133.223 E.13864
G1 X91.538 Y133.223 E.03296
G1 X90.277 Y131.962 E.09204
M73 P41 R28
G1 X90.277 Y132.581 E.03198
G1 X90.29 Y132.613 E.00179
G1 X91.102 Y133.425 E.05924
M106 S127.5
G1 X90.284 Y133.104 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X90.354 Y133.173 E.00273
G1 X90.284 Y104.896 F30000
G1 F15000
G1 X90.354 Y104.827 E.00273
M106 S183.6
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X90.284 Y104.896 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/105
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
G3 Z3 I.082 J-1.214 P1  F30000
G1 X55.624 Y102.569 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
M73 P41 R27
G1 X200.087 Y98.604 E4.6467
G3 X204.398 Y103.007 I-.098 J4.408 E.22631
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.402 J.004 E.2296
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I.006 J-4.411 E.22946
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.233 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X55.234 Y102.531 E.00004
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.092 Y98.212 E4.30456
G3 X204.79 Y103.003 I-.104 J4.801 E.22825
G1 X204.79 Y152.997 E1.5362
G3 X204.756 Y153.558 I-5.199 J-.035 E.01728
G1 X204.756 Y153.558 E0
G3 X199.997 Y157.79 I-4.77 J-.573 E.21389
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.012 J-4.804 E.23117
G1 X55.21 Y103.003 E1.5362
G1 X55.23 Y102.591 E.01266
M204 S10000
; WIPE_START
G1 F24000
G1 X55.234 Y102.531 E-.02295
G1 X55.302 Y102.066 E-.1786
G1 X55.416 Y101.61 E-.17863
G1 X55.575 Y101.167 E-.17862
G1 X55.776 Y100.742 E-.17863
G1 X55.806 Y100.691 E-.02257
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.155 J1.207 P1  F30000
G1 X90.178 Y105.093 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420956
G1 F15000
G1 X90.423 Y104.847 E.01069
G1 X90.777 Y104.847 E.01092
G3 X91.064 Y104.741 I.211 J.13 E.01014
G1 X90.241 Y105.564 E.03586
G1 X90.241 Y106.099 E.01647
G1 X91.599 Y104.741 E.05915
G1 X92.133 Y104.741 E.01647
G1 X90.241 Y106.633 E.08245
G1 X90.241 Y107.168 E.01647
G1 X92.668 Y104.741 E.10574
G1 X93.202 Y104.741 E.01647
G1 X90.241 Y107.702 E.12903
G1 X90.241 Y108.237 E.01647
G1 X93.737 Y104.741 E.15232
G1 X94.272 Y104.741 E.01647
G1 X90.241 Y108.772 E.17561
G1 X90.241 Y109.306 E.01647
G1 X94.806 Y104.741 E.1989
G1 X95.341 Y104.741 E.01647
G1 X90.241 Y109.841 E.22219
G1 X90.241 Y110.376 E.01647
G1 X95.876 Y104.741 E.24548
G1 X96.41 Y104.741 E.01647
G1 X90.241 Y110.91 E.26877
G1 X90.241 Y111.445 E.01647
G1 X96.945 Y104.741 E.29206
G1 X97.479 Y104.741 E.01647
G1 X90.241 Y111.979 E.31535
G1 X90.241 Y112.514 E.01647
G1 X98.014 Y104.741 E.33865
G1 X98.549 Y104.741 E.01647
G1 X90.241 Y113.049 E.36194
G1 X90.241 Y113.583 E.01647
G1 X99.083 Y104.741 E.38523
G1 X99.618 Y104.741 E.01647
G1 X90.241 Y114.118 E.40852
G1 X90.241 Y114.653 E.01647
G1 X100.153 Y104.741 E.43181
G1 X100.687 Y104.741 E.01647
G1 X90.241 Y115.187 E.4551
G1 X90.241 Y115.722 E.01647
G1 X101.222 Y104.741 E.47839
G1 X101.756 Y104.741 E.01647
G1 X90.241 Y116.256 E.50168
G1 X90.241 Y116.791 E.01647
G1 X102.291 Y104.741 E.52497
G1 X102.826 Y104.741 E.01647
G1 X90.241 Y117.326 E.54826
G1 X90.241 Y117.86 E.01647
G1 X103.36 Y104.741 E.57155
G1 X103.895 Y104.741 E.01647
G1 X90.241 Y118.395 E.59485
G1 X90.241 Y118.93 E.01647
G1 X104.43 Y104.741 E.61814
G1 X104.964 Y104.741 E.01647
G1 X90.241 Y119.464 E.64143
G1 X90.241 Y119.999 E.01647
G1 X105.499 Y104.741 E.66472
G1 X106.033 Y104.741 E.01647
G1 X90.241 Y120.533 E.68801
G1 X90.241 Y121.068 E.01647
G1 X106.568 Y104.741 E.7113
G1 X107.103 Y104.741 E.01647
G1 X90.241 Y121.603 E.73459
G1 X90.241 Y122.137 E.01647
G1 X111.637 Y100.741 E.93214
G1 X112.172 Y100.741 E.01647
G1 X90.241 Y122.672 E.95543
G1 X90.241 Y123.207 E.01647
G1 X112.707 Y100.741 E.97872
G1 X113.241 Y100.741 E.01647
G1 X90.241 Y123.741 E1.00201
G1 X90.241 Y124.276 E.01647
G1 X113.776 Y100.741 E1.02531
G1 X114.31 Y100.741 E.01647
G1 X90.241 Y124.81 E1.0486
G1 X90.241 Y125.345 E.01647
G1 X114.845 Y100.741 E1.07189
G1 X115.38 Y100.741 E.01647
G1 X90.241 Y125.88 E1.09518
G1 X90.241 Y126.414 E.01647
G1 X115.914 Y100.741 E1.11847
G1 X116.088 Y100.741 E.00536
G3 X116.223 Y100.847 I-.062 J.215 E.00541
G1 X116.342 Y100.847 E.00369
G1 X90.241 Y126.949 E1.13712
G1 X90.241 Y127.484 E.01647
G1 X116.652 Y101.072 E1.15061
G1 X116.652 Y101.277 E.0063
G3 X116.759 Y101.5 I-.099 J.184 E.00816
G1 X90.241 Y128.018 E1.15526
G1 X90.241 Y128.553 E.01647
G1 X116.759 Y102.034 E1.15528
G1 X116.76 Y102.569 E.01646
G1 X90.241 Y129.087 E1.15529
G1 X90.241 Y129.622 E.01647
G1 X116.76 Y103.103 E1.15531
G1 X116.76 Y103.637 E.01646
G1 X90.241 Y130.157 E1.15533
G1 X90.241 Y130.691 E.01647
G1 X116.761 Y104.171 E1.15534
G1 X116.761 Y104.585 E.01275
G2 X116.798 Y104.669 I.094 J.009 E.00294
G1 X90.241 Y131.226 E1.15695
G1 X90.241 Y131.761 E.01647
G1 X117.262 Y104.739 E1.1772
G1 X117.797 Y104.739 E.01647
G1 X90.241 Y132.295 E1.20049
G1 X90.241 Y132.589 E.00904
G2 X90.347 Y132.723 I.215 J-.061 E.00541
G1 X118.332 Y104.739 E1.21912
G1 X118.866 Y104.739 E.01647
G1 X90.453 Y133.153 E1.23784
G1 X90.777 Y133.153 E.01
G2 X90.89 Y133.25 I.174 J-.087 E.00471
G1 X119.401 Y104.739 E1.24209
G1 X119.935 Y104.739 E.01647
G1 X91.415 Y133.259 E1.24248
G1 X91.95 Y133.259 E.01647
G1 X120.47 Y104.739 E1.24248
G1 X121.004 Y104.739 E.01647
G1 X92.484 Y133.259 E1.24248
G1 X93.019 Y133.259 E.01647
G1 X121.539 Y104.739 E1.24248
G1 X122.074 Y104.739 E.01647
G1 X93.553 Y133.26 E1.24249
G1 X94.088 Y133.26 E.01647
G1 X122.608 Y104.739 E1.24249
G1 X123.143 Y104.739 E.01647
G1 X94.622 Y133.26 E1.24249
G1 X95.157 Y133.26 E.01647
G1 X123.677 Y104.739 E1.24249
G1 X124.212 Y104.739 E.01647
G1 X95.692 Y133.26 E1.2425
G1 X96.226 Y133.26 E.01647
G1 X124.747 Y104.739 E1.2425
G1 X125.281 Y104.74 E.01647
G1 X96.761 Y133.26 E1.2425
G1 X97.295 Y133.26 E.01647
G1 X125.816 Y104.74 E1.2425
G1 X126.35 Y104.74 E.01647
G1 X97.83 Y133.26 E1.24251
G1 X98.364 Y133.26 E.01647
G1 X126.885 Y104.74 E1.24251
G1 X127.42 Y104.74 E.01647
G1 X98.899 Y133.26 E1.24251
G1 X99.433 Y133.261 E.01647
G1 X127.954 Y104.74 E1.24251
G1 X128.489 Y104.74 E.01647
G1 X99.968 Y133.261 E1.24251
G1 X100.502 Y133.261 E.01647
G1 X129.023 Y104.74 E1.24252
G1 X129.558 Y104.74 E.01647
G1 X101.037 Y133.261 E1.24252
G1 X101.571 Y133.261 E.01647
G1 X130.092 Y104.74 E1.24252
G1 X130.627 Y104.74 E.01647
G1 X101.831 Y133.536 E1.25449
G1 X101.951 Y133.95 E.0133
G1 X131.162 Y104.74 E1.27256
G1 X131.696 Y104.74 E.01647
G1 X102.071 Y134.365 E1.29063
G1 X102.191 Y134.78 E.0133
G1 X132.231 Y104.74 E1.30871
G1 X132.765 Y104.74 E.01647
G1 X102.326 Y135.18 E1.32611
G1 X102.462 Y135.578 E.01296
G1 X133.3 Y104.74 E1.34344
G1 X133.835 Y104.74 E.01647
G1 X102.599 Y135.976 E1.36078
G1 X102.742 Y136.367 E.01284
G1 X134.369 Y104.74 E1.37783
G1 X134.904 Y104.74 E.01647
G1 X102.895 Y136.749 E1.39447
G1 X103.048 Y137.131 E.01267
G1 X135.438 Y104.74 E1.4111
G1 X135.973 Y104.74 E.01647
G1 X103.2 Y137.513 E1.42774
G1 X103.366 Y137.882 E.01246
G1 X136.508 Y104.74 E1.44382
G1 X137.042 Y104.74 E.01647
G1 X103.534 Y138.248 E1.45979
G1 X103.702 Y138.615 E.01242
G1 X137.577 Y104.74 E1.47575
G1 X138.111 Y104.74 E.01647
G1 X103.873 Y138.979 E1.4916
G1 X104.056 Y139.331 E.01221
G1 X138.646 Y104.74 E1.50692
G1 X139.18 Y104.74 E.01647
G1 X104.239 Y139.682 E1.52225
G1 X104.421 Y140.034 E.01221
G1 X139.715 Y104.74 E1.53757
G1 X140.25 Y104.741 E.01647
G1 X104.611 Y140.379 E1.55259
G1 X104.808 Y140.716 E.01204
G1 X140.784 Y104.741 E1.56729
G1 X141.319 Y104.741 E.01647
G1 X105.006 Y141.054 E1.58198
G1 X105.203 Y141.391 E.01204
G1 X141.853 Y104.741 E1.59668
M73 P42 R27
G1 X142.388 Y104.741 E.01647
G1 X105.41 Y141.719 E1.61094
G1 X105.621 Y142.042 E.0119
G1 X142.923 Y104.741 E1.62503
G1 X143.457 Y104.741 E.01647
G1 X105.833 Y142.365 E1.63912
G1 X106.044 Y142.689 E.0119
G1 X147.992 Y100.741 E1.82746
G1 X148.526 Y100.741 E.01647
G1 X106.267 Y143 E1.84101
G1 X106.492 Y143.309 E.01179
G1 X149.061 Y100.741 E1.8545
G1 X149.596 Y100.741 E.01647
G1 X106.717 Y143.619 E1.86799
G1 X106.943 Y143.928 E.01179
G1 X150.13 Y100.741 E1.88145
G1 X150.665 Y100.741 E.01647
G1 X107.181 Y144.224 E1.89436
G1 X107.42 Y144.52 E.01171
G1 X151.199 Y100.741 E1.90726
G1 X151.734 Y100.741 E.01647
G1 X107.658 Y144.816 E1.92016
G1 X107.899 Y145.11 E.0117
G1 X152.269 Y100.741 E1.93296
G1 X152.589 Y100.741 E.00985
G3 X152.71 Y100.834 I-.052 J.193 E.00484
G1 X108.151 Y145.393 E1.9412
G1 X108.403 Y145.676 E.01166
G1 X153.153 Y100.926 E1.94953
G1 X153.153 Y101.278 E.01083
G3 X153.242 Y101.371 I-.068 J.154 E.00408
G1 X108.655 Y145.959 E1.94247
G1 X108.834 Y146.16 E.0083
G1 X108.91 Y146.238 E.00336
G1 X153.259 Y101.889 E1.93206
G1 X153.259 Y102.423 E.01647
G1 X109.175 Y146.507 E1.92051
G1 X109.441 Y146.777 E.01165
G1 X153.259 Y102.958 E1.90896
G1 X153.259 Y103.493 E.01647
G1 X109.706 Y147.046 E1.89741
G1 X109.976 Y147.31 E.01165
G1 X153.259 Y104.027 E1.88563
G2 X153.261 Y104.56 I5.42 J.247 E.01642
G1 X110.254 Y147.567 E1.87359
G1 X110.533 Y147.823 E.01166
G1 X153.615 Y104.741 E1.87688
G1 X154.15 Y104.741 E.01647
G1 X110.811 Y148.079 E1.88804
G1 X111.096 Y148.329 E.01167
G1 X154.684 Y104.741 E1.89891
G1 X155.219 Y104.741 E.01647
G1 X111.388 Y148.572 E1.90949
G1 X111.68 Y148.815 E.01169
G1 X155.753 Y104.741 E1.92008
G1 X156.288 Y104.741 E.01647
G1 X111.971 Y149.057 E1.93066
G1 X112.272 Y149.292 E.01173
G1 X156.823 Y104.741 E1.94087
G1 X157.357 Y104.741 E.01647
G1 X112.577 Y149.521 E1.95087
G1 X112.882 Y149.751 E.01176
G1 X157.892 Y104.741 E1.96087
G1 X158.427 Y104.741 E.01647
G1 X113.187 Y149.98 E1.97087
G1 X113.503 Y150.199 E.01183
G1 X158.961 Y104.741 E1.98041
G1 X159.496 Y104.741 E.01647
G1 X113.821 Y150.415 E1.98981
G1 X114.14 Y150.631 E.01186
G1 X160.03 Y104.741 E1.99921
G1 X160.565 Y104.741 E.01647
G1 X114.459 Y150.847 E2.00862
G1 X114.791 Y151.05 E.01198
G1 X161.1 Y104.741 E2.01745
G1 X161.634 Y104.741 E.01647
G1 X115.124 Y151.252 E2.02624
G1 X115.456 Y151.454 E.01199
G1 X162.169 Y104.741 E2.03504
G1 X162.704 Y104.741 E.01647
G1 X115.791 Y151.653 E2.04374
G1 X116.138 Y151.841 E.01215
G1 X163.238 Y104.741 E2.05192
G1 X163.773 Y104.741 E.01647
G1 X116.485 Y152.029 E2.06009
G1 X116.832 Y152.216 E.01215
G1 X164.307 Y104.741 E2.06827
G1 X164.842 Y104.741 E.01647
G1 X117.185 Y152.398 E2.07617
G1 X117.547 Y152.571 E.01235
G1 X165.377 Y104.741 E2.08371
G1 X165.911 Y104.741 E.01647
G1 X117.908 Y152.744 E2.09125
G1 X118.27 Y152.917 E.01235
G1 X166.446 Y104.741 E2.09879
G1 X166.981 Y104.741 E.01647
G1 X118.643 Y153.078 E2.10582
G1 X119.02 Y153.236 E.01258
G1 X167.515 Y104.741 E2.1127
G1 X168.05 Y104.741 E.01647
G1 X119.397 Y153.394 E2.11958
G1 X119.776 Y153.549 E.01263
G1 X168.584 Y104.741 E2.12635
G1 X169.11 Y104.75 E.0162
G1 X120.168 Y153.691 E2.13215
G1 X120.561 Y153.833 E.01286
G1 X169.547 Y104.847 E2.13409
G1 X169.578 Y104.847 E.00094
G1 X169.653 Y104.922 E.00327
G1 X169.653 Y105.276 E.0109
G1 X120.954 Y153.976 E2.12158
G1 X121.357 Y154.107 E.01306
G1 X169.759 Y105.704 E2.10866
G1 X169.759 Y106.239 E.01647
G1 X121.766 Y154.233 E2.09084
G1 X122.175 Y154.358 E.01318
G1 X169.759 Y106.774 E2.07301
G1 X169.759 Y107.308 E.01647
G1 X122.587 Y154.48 E2.05504
G1 X123.014 Y154.588 E.01356
G1 X169.759 Y107.843 E2.03646
G1 X169.759 Y108.378 E.01647
G1 X123.441 Y154.696 E2.01787
G1 X123.867 Y154.804 E.01356
G1 X169.759 Y108.912 E1.99929
G1 X169.759 Y109.447 E.01647
G1 X124.31 Y154.896 E1.98001
G1 X124.755 Y154.986 E.01399
G1 X169.759 Y109.981 E1.96062
G1 X169.759 Y110.516 E.01647
G1 X125.2 Y155.075 E1.94123
G1 X125.657 Y155.153 E.01428
G1 X169.759 Y111.051 E1.92131
G1 X169.759 Y111.585 E.01647
G1 X126.122 Y155.223 E1.90106
G1 X126.587 Y155.292 E.01448
G1 X169.759 Y112.12 E1.8808
G1 X169.759 Y112.655 E.01647
G1 X127.062 Y155.352 E1.8601
G1 X127.548 Y155.4 E.01505
G1 X169.759 Y113.189 E1.83892
G1 X169.759 Y113.724 E.01647
G1 X128.035 Y155.449 E1.81774
G1 X128.532 Y155.486 E.01535
G1 X169.759 Y114.258 E1.79609
G1 X169.759 Y114.793 E.01647
G1 X129.041 Y155.511 E1.7739
G1 X129.55 Y155.537 E.01571
G1 X169.759 Y115.328 E1.75171
G1 X169.759 Y115.862 E.01647
G1 X130.074 Y155.547 E1.72888
G1 X130.609 Y155.547 E.01647
G1 X169.759 Y116.397 E1.70559
G1 X169.759 Y116.932 E.01647
G1 X131.143 Y155.547 E1.6823
G1 X131.701 Y155.524 E.0172
G1 X169.759 Y117.466 E1.658
G1 X169.759 Y118.001 E.01647
G1 X132.264 Y155.496 E1.63349
G1 X132.833 Y155.462 E.01757
G1 X169.759 Y118.535 E1.6087
G1 X169.759 Y119.07 E.01647
G1 X133.427 Y155.403 E1.58283
G1 X134.02 Y155.344 E.01838
G1 X169.759 Y119.605 E1.55697
G1 X169.759 Y120.139 E.01647
G1 X134.64 Y155.258 E1.52996
G1 X135.269 Y155.164 E.01959
G1 X169.759 Y120.674 E1.50256
G1 X169.759 Y121.209 E.01647
G1 X135.916 Y155.052 E1.4744
G1 X136.585 Y154.918 E.02103
G1 X169.759 Y121.743 E1.44525
G1 X169.759 Y122.278 E.01647
G1 X137.267 Y154.77 E1.41553
G1 X137.983 Y154.589 E.02275
G1 X169.759 Y122.812 E1.38435
G1 X169.759 Y123.347 E.01647
G1 X159.845 Y133.261 E.43189
G1 X160.38 Y133.261 E.01647
G1 X169.759 Y123.882 E.4086
G1 X169.759 Y124.416 E.01647
G1 X160.915 Y133.261 E.3853
G1 X161.45 Y133.261 E.01647
G1 X169.759 Y124.951 E.36201
G1 X169.759 Y125.486 E.01647
G1 X161.984 Y133.26 E.33871
G1 X162.519 Y133.26 E.01647
G1 X169.759 Y126.02 E.31542
G1 X169.759 Y126.555 E.01647
G1 X163.054 Y133.26 E.29212
G1 X163.589 Y133.26 E.01647
G1 X169.759 Y127.089 E.26883
G1 X169.759 Y127.624 E.01647
G1 X164.123 Y133.26 E.24553
G1 X164.658 Y133.26 E.01647
G1 X169.759 Y128.159 E.22224
G1 X169.759 Y128.693 E.01647
G1 X165.193 Y133.26 E.19894
G1 X165.727 Y133.26 E.01647
G1 X169.759 Y129.228 E.17565
G1 X169.759 Y129.763 E.01647
G1 X166.262 Y133.26 E.15235
G1 X166.797 Y133.26 E.01647
G1 X169.759 Y130.297 E.12906
G1 X169.759 Y130.832 E.01647
G1 X167.332 Y133.259 E.10576
G1 X167.866 Y133.259 E.01647
G1 X169.759 Y131.366 E.08247
G1 X169.759 Y131.901 E.01647
G1 X168.401 Y133.259 E.05917
G1 X168.936 Y133.259 E.01647
G1 X169.759 Y132.436 E.03588
G3 X169.653 Y132.723 I-.237 J.075 E.01016
G1 X169.653 Y133.077 E.01091
G1 X169.407 Y133.322 E.0107
G1 X160.475 Y133.653 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X159.543 Y133.653 E.03092
M73 P43 R27
G1 X159.35 Y134.322 E.0231
G1 X182.078 Y157.05 E1.0662
G1 X185.386 Y157.05 E.10975
G1 X204.044 Y138.391 E.87529
G1 X204.044 Y140.636 E.07447
G1 X170.151 Y106.744 E1.58998
G1 X170.151 Y108.372 E.05401
G1 X147.548 Y150.37 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420956
G1 F15000
G1 X154.24 Y143.678 E.29155
G1 X154.933 Y142.723 E.03636
G1 X155.449 Y141.934 E.02904
G1 X146.525 Y150.858 E.38878
G3 X145.266 Y151.622 I-16.104 J-25.11 E.04535
G1 X145.18 Y151.669 E.00302
G1 X156.275 Y140.573 E.48336
G1 X156.483 Y140.218 E.0127
G1 X156.902 Y139.412 E.02797
G1 X144.015 Y152.299 E.56143
G1 X142.984 Y152.795 E.03523
G1 X157.411 Y138.368 E.62851
G1 X157.845 Y137.4 E.03268
G1 X142.029 Y153.216 E.68901
G1 X141.125 Y153.585 E.03009
G1 X158.201 Y136.509 E.74391
G1 X158.506 Y135.669 E.02753
G1 X140.287 Y153.888 E.79372
G1 X139.485 Y154.155 E.02603
G1 X158.786 Y134.855 E.84082
G1 X159.006 Y134.101 E.02421
G1 X138.464 Y154.642 E.89489
G1 X139.232 Y154.643 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X140.776 Y154.128 I-4.455 J-15.933 E.05402
G1 X143.698 Y157.05 E.13705
G1 X147.006 Y157.05 E.10975
G1 X203.341 Y100.715 E2.64276
G3 X203.958 Y102.171 I-3.438 J2.319 E.05278
G1 X200.825 Y99.038 E.14699
G2 X200.396 Y98.97 I-.556 J2.146 E.01444
G2 X197.427 Y98.953 I-1.644 J26.816 E.09852
G1 X170.151 Y126.229 E1.27957
G1 X170.151 Y129.771 E.11753
G1 X197.429 Y157.05 E1.27968
G1 X199.984 Y157.05 E.08474
G2 X200.825 Y156.962 I-.112 J-5.176 E.02808
G1 X203.96 Y153.827 E.14708
G3 X203.339 Y155.284 I-6.298 J-1.825 E.05265
G1 X170.151 Y122.096 E1.55692
G1 X170.151 Y118.553 E.11753
G1 X189.751 Y98.952 E.91948
G1 X193.064 Y98.953 E.10989
G1 X204.044 Y109.933 E.5151
G1 X204.044 Y107.688 E.07447
G1 X154.682 Y157.05 E2.31568
G1 X151.374 Y157.05 E.10975
G1 X145.975 Y151.651 E.25328
G3 X143.302 Y153.078 I-15.661 J-26.114 E.10054
G1 X139.33 Y157.05 E.18634
G1 X136.022 Y157.05 E.10975
G1 X134.629 Y155.656 E.06536
G3 X132.85 Y155.854 I-2.901 J-17.999 E.05939
G1 X131.654 Y157.05 E.05609
G1 X128.346 Y157.05 E.10975
G1 X127.04 Y155.744 E.06127
G3 X125.502 Y155.526 I1.455 J-15.831 E.05154
G1 X123.978 Y157.05 E.07148
G1 X120.67 Y157.05 E.10975
G1 X115.634 Y152.014 E.23625
G3 X114.403 Y151.273 I7.092 J-13.174 E.04767
G1 X108.626 Y157.05 E.271
G1 X105.318 Y157.05 E.10975
G1 X55.955 Y107.687 E2.3157
G1 X55.955 Y109.933 E.07451
G1 X66.938 Y98.95 E.51523
G1 X70.247 Y98.951 E.10976
G1 X89.849 Y118.553 E.91957
G1 X89.849 Y122.096 E.11753
G1 X56.666 Y155.278 E1.55667
G3 X56.038 Y153.825 I4.975 J-3.014 E.05268
G1 X59.162 Y156.95 E.14659
G1 X59.406 Y157.005 E.00828
G2 X62.57 Y157.05 I1.889 J-21.591 E.10508
G1 X89.849 Y129.771 E1.27968
G1 X89.849 Y126.229 E.11753
G1 X62.571 Y98.95 E1.27967
G1 X60.016 Y98.95 E.08474
G2 X59.175 Y99.038 I.112 J5.177 E.02808
G1 X56.04 Y102.173 E.14708
G3 X56.661 Y100.716 I6.298 J1.825 E.05265
G1 X112.994 Y157.05 E2.64271
G1 X116.302 Y157.05 E.10975
G1 X119.493 Y153.859 E.14966
G2 X120.978 Y154.401 I54.422 J-146.943 E.05245
G1 X121.023 Y154.415 E.00156
G1 X111.294 Y149.003 F30000
G1 F15476.087
G1 X110.694 Y148.504 E.02587
G3 X110.07 Y147.93 I11.314 J-12.926 E.02814
G1 X100.95 Y157.05 E.42783
G1 X97.642 Y157.05 E.10975
G1 X55.954 Y115.362 E1.95565
G1 X55.954 Y117.61 E.07457
G1 X74.614 Y98.951 E.87536
G1 X77.923 Y98.951 E.10976
G1 X89.849 Y110.877 E.55947
G1 X89.849 Y114.42 E.11753
G1 X55.951 Y148.317 E1.59022
G1 X55.951 Y146.063 E.07479
G1 X66.938 Y157.05 E.51542
G1 X70.246 Y157.05 E.10975
G1 X93.644 Y133.652 E1.09765
G1 X97.272 Y133.652 E.12035
G1 X104.379 Y140.759 E.33339
G2 X106.431 Y143.893 I27.232 J-15.596 E.12433
G1 X93.274 Y157.05 E.61722
G1 X89.966 Y157.05 E.10975
G1 X55.954 Y123.037 E1.59559
G1 X55.953 Y125.287 E.07463
G1 X82.29 Y98.951 E1.23549
G1 X85.599 Y98.951 E.10977
G1 X90.997 Y104.349 E.25323
G1 X92.244 Y104.349 E.04136
G1 X97.641 Y98.951 E.25322
G1 X100.951 Y98.951 E.10979
G1 X106.349 Y104.349 E.25322
G1 X107.349 Y104.349 E.03317
G1 X107.349 Y103.72 E.02084
G1 X107.571 Y104.272 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420956
G1 F15000
G1 X111.103 Y100.741 E.15386
G1 X110.568 Y100.741 E.01647
G1 X107.741 Y103.568 E.12317
G1 X107.741 Y103.033 E.01647
G1 X110.033 Y100.741 E.09988
G1 X109.499 Y100.741 E.01647
G1 X107.741 Y102.499 E.07659
G1 X107.741 Y101.964 E.01647
G1 X108.964 Y100.741 E.0533
G1 X108.43 Y100.741 E.01647
G1 X107.571 Y101.599 E.0374
G1 X117.044 Y100.867 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X117.044 Y101.114 E.00819
G3 X117.151 Y101.332 I-.21 J.238 E.00827
G1 X117.152 Y102.468 E.03768
G1 X120.669 Y98.951 E.16499
G1 X123.979 Y98.951 E.10981
G1 X129.376 Y104.348 E.25315
G1 X130.624 Y104.348 E.04142
G1 X136.021 Y98.952 E.25315
G1 X139.331 Y98.952 E.10983
G1 X143.849 Y103.469 E.21191
G1 X143.849 Y101.841 E.05401
G1 X144.071 Y101.454 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420956
G1 F15000
G1 X144.678 Y100.847 E.02642
G1 X144.777 Y100.847 E.00307
G3 X144.911 Y100.741 I.196 J.109 E.00541
G1 X145.319 Y100.741 E.01255
G1 X144.241 Y101.819 E.04696
G1 X144.241 Y102.353 E.01647
G1 X145.853 Y100.741 E.07025
G1 X146.388 Y100.741 E.01647
G1 X144.241 Y102.888 E.09354
G1 X144.241 Y103.422 E.01647
G1 X146.922 Y100.741 E.11683
G1 X147.457 Y100.741 E.01647
G1 X144.071 Y104.127 E.14751
G1 X153.651 Y102.72 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X153.651 Y104.349 E.05401
G1 X159.048 Y98.952 E.25317
G1 X162.36 Y98.952 E.10986
G1 X167.756 Y104.349 E.25317
G1 X169.003 Y104.349 E.04136
G1 X174.4 Y98.952 E.25316
G1 X177.712 Y98.952 E.10987
G1 X204.044 Y125.285 E1.2353
G1 X204.044 Y123.04 E.07447
G1 X170.034 Y157.05 E1.59549
G1 X166.726 Y157.05 E.10975
G1 X154.134 Y144.458 E.59071
G3 X150.409 Y148.409 I-22.784 J-17.745 E.18039
G1 X159.05 Y157.05 E.40534
G1 X162.358 Y157.05 E.10975
G1 X204.044 Y115.364 E1.95558
G1 X204.044 Y117.609 E.07447
G1 X185.388 Y98.952 E.8752
G1 X182.076 Y98.952 E.10988
G1 X170.151 Y110.877 E.55939
G1 X170.151 Y114.42 E.11753
G1 X204.044 Y148.312 E1.58998
G1 X204.044 Y146.067 E.07447
G1 X193.062 Y157.05 E.5152
G1 X189.754 Y157.05 E.10975
G1 X166.356 Y133.652 E1.09765
G1 X162.727 Y133.652 E.12035
G1 X157.699 Y138.68 E.23588
G3 X157.146 Y139.794 I-11.617 J-5.086 E.04126
G1 X174.402 Y157.05 E.80952
G1 X177.71 Y157.05 E.10975
G1 X204.044 Y130.716 E1.23539
G1 X204.044 Y132.96 E.07447
G1 X170.036 Y98.952 E1.5954
G1 X166.724 Y98.952 E.10987
G1 X161.327 Y104.349 E.25316
G1 X160.08 Y104.349 E.04136
G1 X154.684 Y98.952 E.25317
G1 X151.372 Y98.952 E.10985
G1 X149.975 Y100.349 E.06553
G1 X148.404 Y100.349 E.05211
G1 X147.008 Y98.952 E.06553
G1 X143.696 Y98.952 E.10984
G1 X138.3 Y104.348 E.25316
G1 X137.052 Y104.348 E.04139
G1 X131.655 Y98.952 E.25317
G1 X128.345 Y98.951 E.10982
G1 X122.949 Y104.347 E.25313
G1 X121.699 Y104.347 E.04146
G1 X116.303 Y98.951 E.25313
G1 X112.993 Y98.951 E.10981
G1 X111.596 Y100.349 E.06556
G1 X110.025 Y100.349 E.05211
G1 X108.627 Y98.951 E.06556
G1 X105.317 Y98.951 E.1098
G1 X99.92 Y104.349 E.25321
G1 X98.673 Y104.349 E.04136
G1 X93.275 Y98.951 E.25322
G1 X89.965 Y98.951 E.10978
G1 X55.953 Y132.964 E1.59562
G1 X55.953 Y130.712 E.07468
G1 X82.29 Y157.05 E1.23553
M73 P43 R26
G1 X85.598 Y157.05 E.10975
G1 X103.512 Y139.136 E.84038
G3 X101.457 Y133.653 I28.527 J-13.821 E.19451
G1 X101.319 Y133.653 E.00457
G1 X77.922 Y157.05 E1.09759
G1 X74.614 Y157.05 E.10975
G1 X55.952 Y138.388 E.87548
G1 X55.952 Y140.641 E.07474
G1 X89.849 Y106.744 E1.59018
G1 X89.849 Y108.372 E.05401
M106 S163.2
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X89.849 Y106.744 E-.61876
G1 X89.586 Y107.006 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/105
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
G3 Z3.2 I1.129 J.453 P1  F30000
G1 X90.422 Y104.922 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X107.523 Y104.922 E.56726
G2 X107.922 Y104.526 I.018 J-.381 E.021
G1 X107.922 Y100.922 E.11953
G1 X116.577 Y100.922 E.2871
G1 X116.58 Y104.577 E.12125
G2 X116.931 Y104.92 I.38 J-.038 E.01768
G1 X144.023 Y104.922 E.89872
G2 X144.422 Y104.557 I.022 J-.376 E.02
G1 X144.422 Y100.922 E.12056
G1 X153.078 Y100.922 E.28712
G1 X153.078 Y104.526 E.11953
G2 X153.477 Y104.922 I.381 J.016 E.021
G1 X169.578 Y104.922 E.53409
G1 X169.578 Y133.078 E.93397
G1 X159.365 Y133.079 E.33879
G2 X159.033 Y133.351 I.031 J.375 E.01513
G3 X101.967 Y133.351 I-28.533 J-7.475 E2.57245
G2 X101.635 Y133.079 I-.362 J.104 E.01513
G1 X90.422 Y133.078 E.37196
G1 X90.422 Y104.982 E.93198
; WIPE_START
G1 F24000
G1 X92.422 Y104.975 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.079 J-1.214 P1  F30000
G1 X55.624 Y102.569 Z3.4
G1 Z3
G1 E.8 F1800
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
G1 X200.094 Y98.605 E4.64694
G3 X204.398 Y103.007 I-.105 J4.408 E.22608
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.402 J.004 E.2296
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I.006 J-4.411 E.22946
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.233 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X55.234 Y102.531 E.00004
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.099 Y98.212 E4.30477
G3 X204.79 Y103.003 I-.111 J4.801 E.22804
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.794 J-.001 E.23131
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.012 J-4.804 E.23117
G1 X55.21 Y103.003 E1.5362
G1 X55.23 Y102.591 E.01267
M204 S10000
; WIPE_START
G1 F24000
G1 X55.234 Y102.531 E-.02293
G1 X55.302 Y102.066 E-.1786
G1 X55.416 Y101.61 E-.17864
G1 X55.575 Y101.167 E-.17862
G1 X55.776 Y100.742 E-.17863
G1 X55.806 Y100.691 E-.02259
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.259 J1.189 P1  F30000
G1 X90.074 Y108.147 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X90.074 Y106.518 E.05401
G1 X55.952 Y140.641 E1.60075
G1 X55.952 Y138.388 E.07474
G1 X74.614 Y157.05 E.87548
G1 X77.922 Y157.05 E.10975
G1 X101.544 Y133.428 E1.10816
G3 X101.641 Y133.479 I.032 J.057 E.00432
G2 X103.68 Y138.968 I38.185 J-11.061 E.19441
G1 X85.598 Y157.05 E.84825
G1 X82.29 Y157.05 E.10975
G1 X55.953 Y130.712 E1.23553
G1 X55.953 Y132.964 E.07468
G1 X89.965 Y98.951 E1.59562
G1 X93.275 Y98.951 E.10978
G1 X98.893 Y104.569 E.26356
G1 X99.699 Y104.569 E.02674
G1 X105.317 Y98.951 E.26353
G1 X108.627 Y98.951 E.1098
G1 X110.25 Y100.574 E.07613
G1 X111.37 Y100.574 E.03716
G1 X112.993 Y98.951 E.07612
G1 X116.303 Y98.951 E.10981
G1 X121.924 Y104.572 E.26367
G1 X122.724 Y104.572 E.02656
G1 X128.345 Y98.952 E.26366
G1 X131.655 Y98.952 E.10983
G1 X137.275 Y104.571 E.26361
G1 X138.077 Y104.571 E.02662
G1 X143.696 Y98.952 E.2636
G1 X147.008 Y98.952 E.10985
G1 X148.63 Y100.574 E.07609
G1 X149.75 Y100.574 E.03716
G1 X151.372 Y98.952 E.07609
G1 X154.684 Y98.952 E.10986
G1 X160.3 Y104.568 E.26348
G1 X161.107 Y104.569 E.02677
G1 X166.724 Y98.952 E.26349
G1 X170.036 Y98.952 E.10987
G1 X204.044 Y132.96 E1.59539
G1 X204.044 Y130.715 E.07447
G1 X177.71 Y157.05 E1.23539
G1 X174.402 Y157.05 E.10975
G1 X156.978 Y139.627 E.81735
G1 X157.222 Y139.157 E.01754
G1 X162.953 Y133.427 E.26883
G1 X166.13 Y133.426 E.10541
G1 X189.754 Y157.05 E1.10821
G1 X193.062 Y157.05 E.10975
G1 X204.044 Y146.067 E.5152
G1 X204.044 Y148.312 E.07447
G1 X169.926 Y114.194 E1.60055
G1 X169.926 Y111.102 E.10258
G1 X182.075 Y98.953 E.56995
G1 X185.388 Y98.953 E.10989
G1 X204.044 Y117.609 E.87519
G1 X204.044 Y115.364 E.07447
G1 X162.358 Y157.05 E1.95558
G1 X159.05 Y157.05 E.10975
G1 X150.25 Y148.25 E.41282
G2 X153.974 Y144.298 I-27.308 J-29.46 E.18026
G1 X166.726 Y157.05 E.59822
G1 X170.034 Y157.05 E.10975
G1 X204.044 Y123.04 E1.59549
G1 X204.044 Y125.285 E.07447
G1 X177.712 Y98.952 E1.23529
G1 X174.4 Y98.952 E.10988
G1 X168.778 Y104.573 E.2637
G1 X167.981 Y104.573 E.02646
G1 X162.36 Y98.952 E.26369
G1 X159.048 Y98.952 E.10986
G1 X153.437 Y104.563 E.26323
G1 X153.428 Y102.936 E.05398
; WIPE_START
G1 F24000
G1 X153.437 Y104.563 E-.61832
G1 X153.7 Y104.3 E-.14168
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.275 J-1.185 P1  F30000
G1 X144.074 Y102.065 Z3.4
G1 Z3
G1 E.8 F1800
G1 F15476.087
G1 X144.074 Y103.694 E.05401
G1 X139.332 Y98.952 E.22246
G1 X136.02 Y98.952 E.10984
G1 X130.401 Y104.571 E.26363
G1 X129.599 Y104.571 E.02659
G1 X123.979 Y98.951 E.26364
G1 X120.669 Y98.951 E.10982
G1 X116.927 Y102.694 E.17556
G1 X116.925 Y101.065 E.05401
; WIPE_START
G1 F24000
G1 X116.927 Y102.694 E-.61876
G1 X117.189 Y102.431 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.04 J-1.216 P1  F30000
G1 X107.572 Y102.746 Z3.4
G1 Z3
G1 E.8 F1800
G1 F15476.087
G1 X107.57 Y104.374 E.05401
G1 X107.38 Y104.564 E.00894
G1 X106.565 Y104.565 E.02703
G1 X100.951 Y98.951 E.26336
G1 X97.641 Y98.951 E.10979
G1 X92.019 Y104.573 E.26374
G1 X91.222 Y104.574 E.02646
G1 X85.599 Y98.951 E.26377
G1 X82.29 Y98.951 E.10977
G1 X55.953 Y125.287 E1.23549
G1 X55.954 Y123.037 E.07463
G1 X89.966 Y157.05 E1.59559
G1 X93.274 Y157.05 E.10975
G1 X106.593 Y143.731 E.62479
G3 X105.007 Y141.387 I27.531 J-20.327 E.0939
G1 X97.047 Y133.427 E.37343
G1 X93.87 Y133.426 E.1054
G1 X70.246 Y157.05 E1.10821
G1 X66.938 Y157.05 E.10975
G1 X55.951 Y146.063 E.51542
G1 X55.951 Y148.317 E.07479
G1 X90.074 Y114.194 E1.60079
G1 X90.074 Y111.102 E.10258
G1 X77.923 Y98.951 E.57004
G1 X74.614 Y98.951 E.10977
G1 X55.954 Y117.61 E.87536
G1 X55.954 Y115.362 E.07457
G1 X97.642 Y157.05 E1.95565
G1 X100.95 Y157.05 E.10975
G1 X110.231 Y147.769 E.43536
G2 X111.454 Y148.844 I12.046 J-12.481 E.05402
G1 X121.199 Y154.233 F30000
G1 F15476.087
G3 X119.665 Y153.687 I4.736 J-15.717 E.05403
G1 X116.302 Y157.05 E.15777
G1 X112.994 Y157.05 E.10975
G1 X56.661 Y100.716 E2.64271
G2 X56.04 Y102.173 I5.677 J3.281 E.05265
G1 X59.175 Y99.038 E.14708
G3 X60.016 Y98.95 I.953 J5.089 E.02808
G1 X62.571 Y98.95 E.08474
G1 X90.074 Y126.454 E1.29024
G1 X90.074 Y129.546 E.10258
G1 X62.57 Y157.05 E1.29024
G3 X59.406 Y157.005 I-1.275 J-21.636 E.10508
G1 X59.162 Y156.95 E.00828
G1 X56.038 Y153.825 E.1466
G2 X56.666 Y155.278 I5.603 J-1.561 E.05268
G1 X90.074 Y121.87 E1.56723
G1 X90.074 Y118.778 E.10258
G1 X70.247 Y98.951 E.93014
G1 X66.938 Y98.95 E.10976
G1 X55.955 Y109.933 E.51523
G1 X55.955 Y107.687 E.07451
G1 X105.318 Y157.05 E2.3157
G1 X108.626 Y157.05 E.10975
G1 X114.567 Y151.109 E.2787
G1 X114.979 Y151.359 E.016
G1 X120.67 Y157.05 E.26696
G1 X123.978 Y157.05 E.10975
G1 X125.7 Y155.328 E.08077
G1 X126.787 Y155.491 E.03646
G1 X128.346 Y157.05 E.07312
G1 X131.654 Y157.05 E.10975
M73 P44 R26
G1 X133.101 Y155.603 E.06788
G2 X134.43 Y155.458 I-.789 J-13.458 E.04437
G1 X136.022 Y157.05 E.07465
G1 X139.33 Y157.05 E.10975
G1 X143.781 Y152.599 E.20881
G2 X145.811 Y151.487 I-14.829 J-29.473 E.07678
G1 X151.374 Y157.05 E.26097
G1 X154.682 Y157.05 E.10975
G1 X204.044 Y107.688 E2.31568
G1 X204.044 Y109.933 E.07447
G1 X193.064 Y98.953 E.51509
G1 X189.751 Y98.953 E.1099
G1 X169.926 Y118.778 E.93004
G1 X169.926 Y121.87 E.10258
G1 X203.339 Y155.284 E1.56749
G2 X203.96 Y153.827 I-5.677 J-3.281 E.05265
G1 X200.825 Y156.962 E.14708
G3 X199.984 Y157.05 I-.953 J-5.089 E.02808
G1 X197.429 Y157.05 E.08474
G1 X169.926 Y129.546 E1.29024
G1 X169.926 Y126.454 E.10258
G1 X197.427 Y98.953 E1.29013
G3 X200.396 Y98.97 I1.328 J26.528 E.09853
G3 X200.825 Y99.038 I-.127 J2.213 E.01444
G1 X203.959 Y102.171 E.14699
G2 X203.341 Y100.715 I-4.056 J.863 E.05278
G1 X147.006 Y157.05 E2.64276
G1 X143.698 Y157.05 E.10975
G1 X140.6 Y153.952 E.1453
G3 X139.055 Y154.462 I-5.906 J-15.315 E.05402
; WIPE_START
G1 F24000
G1 X140.6 Y153.952 E-.61858
G1 X140.864 Y154.216 E-.14142
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.877 J.843 P1  F30000
G1 X158.675 Y135.691 Z3.4
G1 Z3
G1 E.8 F1800
G1 F15476.087
G2 X159.168 Y134.14 I-15.37 J-5.737 E.05402
G1 X182.078 Y157.05 E1.07474
G1 X185.386 Y157.05 E.10975
G1 X204.044 Y138.391 E.8753
G1 X204.044 Y140.636 E.07447
G1 X169.926 Y106.518 E1.60055
G1 X169.926 Y108.147 E.05401
G1 X168.737 Y105.145 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X169.355 Y105.763 E.02686
G1 X169.355 Y106.296
G1 X168.204 Y105.145 E.05003
G1 X167.671 Y105.145
G1 X169.355 Y106.829 E.07321
G1 X169.355 Y107.363
G1 X167.137 Y105.145 E.09638
G1 X166.604 Y105.145
G1 X169.355 Y107.896 E.11955
G1 X169.355 Y108.429
G1 X166.071 Y105.145 E.14273
G1 X165.538 Y105.145
G1 X169.355 Y108.962 E.1659
G1 X169.355 Y109.496
G1 X165.004 Y105.145 E.18907
G1 X164.471 Y105.145
G1 X169.355 Y110.029 E.21225
G1 X169.355 Y110.562
G1 X163.938 Y105.145 E.23542
G1 X163.405 Y105.145
G1 X169.355 Y111.095 E.25859
G1 X169.355 Y111.629
G1 X162.871 Y105.145 E.28177
G1 X162.338 Y105.145
G1 X169.355 Y112.162 E.30494
G1 X169.355 Y112.695
G1 X161.805 Y105.145 E.32811
G1 X161.271 Y105.145
G1 X169.355 Y113.229 E.35128
G1 X169.355 Y113.762
G1 X160.738 Y105.145 E.37446
G1 X160.205 Y105.145
G1 X169.355 Y114.295 E.39763
G1 X169.355 Y114.828
G1 X159.672 Y105.145 E.4208
G1 X159.138 Y105.145
G1 X169.355 Y115.362 E.44398
G1 X169.355 Y115.895
G1 X158.605 Y105.145 E.46715
G1 X158.072 Y105.145
G1 X169.355 Y116.428 E.49032
G1 X169.355 Y116.961
G1 X157.539 Y105.145 E.5135
G1 X157.005 Y105.145
G1 X169.355 Y117.495 E.53667
G1 X169.355 Y118.028
G1 X156.472 Y105.145 E.55984
G1 X155.939 Y105.145
G1 X169.355 Y118.561 E.58302
G1 X169.355 Y119.094
G1 X155.406 Y105.145 E.60619
G1 X154.872 Y105.145
G1 X169.355 Y119.628 E.62936
G1 X169.355 Y120.161
G1 X154.339 Y105.145 E.65254
G1 X153.806 Y105.145
G1 X169.355 Y120.694 E.67571
G1 X169.355 Y121.228
G1 X153.227 Y105.1 E.70084
M204 S10000
G1 X152.855 Y102.061 F30000
M204 S2000
G1 F12000
G1 X151.939 Y101.145 E.03983
G1 X151.406 Y101.145
G1 X152.855 Y102.595 E.063
G1 X152.855 Y103.128
G1 X150.872 Y101.145 E.08618
G1 X150.339 Y101.145
G1 X152.855 Y103.661 E.10935
G1 X152.855 Y104.194
G1 X149.806 Y101.145 E.13253
G1 X149.272 Y101.145
G1 X152.9 Y104.772 E.15763
M204 S10000
; WIPE_START
G1 F24000
G1 X151.486 Y103.358 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.764 J-.948 P1  F30000
G1 X148.739 Y101.145 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X169.355 Y121.761 E.89588
G1 X169.355 Y122.294
G1 X148.206 Y101.145 E.91905
G1 X147.673 Y101.145
G1 X169.355 Y122.827 E.94222
G1 X169.355 Y123.361
G1 X147.139 Y101.145 E.96539
G1 X146.606 Y101.145
G1 X169.355 Y123.894 E.98857
G1 X169.355 Y124.427
G1 X146.073 Y101.145 E1.01174
G1 X145.54 Y101.145
G1 X169.355 Y124.96 E1.03491
G1 X169.355 Y125.494
G1 X145.006 Y101.145 E1.05809
G1 X144.72 Y101.392
G1 X169.355 Y126.027 E1.07051
G1 X169.355 Y126.56
G1 X144.645 Y101.85 E1.0738
G1 X144.645 Y102.383
G1 X169.355 Y127.094 E1.0738
G1 X169.355 Y127.627
G1 X144.645 Y102.916 E1.0738
G1 X144.645 Y103.449
G1 X169.355 Y128.16 E1.0738
G1 X169.355 Y128.693
G1 X144.645 Y103.983 E1.0738
G1 X144.645 Y104.516
G1 X169.355 Y129.227 E1.0738
G1 X169.355 Y129.76
G1 X144.514 Y104.919 E1.07946
G1 X144.189 Y105.127
G1 X169.355 Y130.293 E1.0936
G1 X169.355 Y130.826
G1 X143.674 Y105.145 E1.116
G1 X143.14 Y105.145
G1 X169.355 Y131.36 E1.13918
G1 X169.355 Y131.893
G1 X142.607 Y105.145 E1.16235
G1 X142.074 Y105.144
G1 X169.355 Y132.426 E1.18552
G1 X169.142 Y132.746
G1 X141.54 Y105.144 E1.19941
G1 X141.007 Y105.144
G1 X168.718 Y132.855 E1.20417
G1 X168.185 Y132.855
G1 X140.474 Y105.144 E1.20418
G1 X139.94 Y105.144
G1 X167.652 Y132.856 E1.20419
G1 X167.118 Y132.856
G1 X139.407 Y105.144 E1.20419
G1 X138.874 Y105.144
G1 X166.585 Y132.856 E1.2042
G1 X166.052 Y132.856
G1 X138.34 Y105.144 E1.2042
G1 X137.807 Y105.144
G1 X165.519 Y132.856 E1.20421
G1 X164.986 Y132.856
G1 X137.274 Y105.144 E1.20421
G1 X136.741 Y105.144
G1 X164.453 Y132.856 E1.20422
G1 X163.919 Y132.856
G1 X136.207 Y105.144 E1.20423
G1 X135.674 Y105.144
G1 X163.386 Y132.856 E1.20423
G1 X162.853 Y132.856
G1 X135.141 Y105.144 E1.20424
G1 X134.607 Y105.144
G1 X162.32 Y132.857 E1.20424
G1 X161.787 Y132.857
G1 X134.074 Y105.144 E1.20425
G1 X133.541 Y105.144
G1 X161.254 Y132.857 E1.20425
G1 X160.72 Y132.857
G1 X133.007 Y105.144 E1.20426
G1 X132.474 Y105.144
G1 X160.187 Y132.857 E1.20427
G1 X159.654 Y132.857
G1 X131.941 Y105.144 E1.20427
G1 X131.407 Y105.144
G1 X159.166 Y132.902 E1.20622
G1 X158.88 Y133.15
G1 X130.874 Y105.144 E1.21699
G1 X130.341 Y105.144
G1 X158.745 Y133.548 E1.23429
G1 X158.625 Y133.962
G1 X129.808 Y105.144 E1.25228
G1 X129.274 Y105.144
G1 X158.506 Y134.375 E1.27026
G1 X158.383 Y134.785
G1 X128.741 Y105.144 E1.28808
G1 X128.208 Y105.144
G1 X158.246 Y135.182 E1.30533
G1 X158.11 Y135.579
G1 X127.674 Y105.144 E1.32258
G1 X127.141 Y105.143
G1 X157.974 Y135.976 E1.33983
G1 X157.825 Y136.361
G1 X126.608 Y105.143 E1.35655
G1 X126.074 Y105.143
G1 X157.673 Y136.742 E1.37311
G1 X157.521 Y137.123
G1 X125.541 Y105.143 E1.38967
G1 X125.008 Y105.143
G1 X157.365 Y137.5 E1.40607
G1 X157.197 Y137.866
G1 X124.475 Y105.143 E1.42196
G1 X123.941 Y105.143
G1 X157.03 Y138.232 E1.43785
G1 X156.862 Y138.597
G1 X123.408 Y105.143 E1.45374
G1 X122.875 Y105.143
G1 X156.685 Y138.954 E1.46923
G1 X156.503 Y139.305
G1 X122.341 Y105.143 E1.48448
G1 X121.808 Y105.143
G1 X156.32 Y139.655 E1.49973
G1 X156.138 Y140.006
G1 X121.275 Y105.143 E1.51497
G1 X120.741 Y105.143
G1 X155.942 Y140.343 E1.52963
G1 X155.745 Y140.68
G1 X120.208 Y105.143 E1.54425
G1 X119.675 Y105.143
G1 X155.548 Y141.017 E1.55888
G1 X155.348 Y141.35
G1 X119.141 Y105.143 E1.57337
G1 X118.608 Y105.143
G1 X155.138 Y141.672 E1.58738
G1 X154.927 Y141.995
G1 X118.075 Y105.143 E1.6014
G1 X117.542 Y105.143
G1 X154.716 Y142.318 E1.61542
G1 X154.499 Y142.634
G1 X117.008 Y105.143 E1.62917
M204 S10000
G1 X116.355 Y101.823 F30000
M204 S2000
G1 F12000
G1 X115.676 Y101.145 E.0295
G1 X115.143 Y101.145
G1 X116.356 Y102.357 E.05269
G1 X116.356 Y102.891
G1 X114.61 Y101.145 E.07588
G1 X114.077 Y101.145
G1 X116.356 Y103.424 E.09907
G1 X116.357 Y103.958
G1 X113.543 Y101.145 E.12225
G1 X113.01 Y101.145
G1 X116.357 Y104.492 E.14544
M204 S10000
; WIPE_START
G1 F24000
G1 X114.943 Y103.077 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.751 J-.958 P1  F30000
G1 X112.477 Y101.145 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X154.275 Y142.943 E1.81633
G1 X154.05 Y143.252
G1 X111.944 Y101.145 E1.82975
M73 P45 R26
G1 X111.41 Y101.145
G1 X153.826 Y143.56 E1.84317
G1 X153.593 Y143.861
G1 X110.877 Y101.145 E1.85621
G1 X110.344 Y101.145
G1 X153.355 Y144.156 E1.86905
G1 X153.117 Y144.451
G1 X109.81 Y101.145 E1.88189
G1 X109.277 Y101.145
G1 X152.879 Y144.747 E1.89472
G1 X152.63 Y145.031
G1 X108.744 Y101.145 E1.90708
G1 X108.339 Y101.273
G1 X152.379 Y145.313 E1.91375
G1 X152.128 Y145.595
G1 X108.145 Y101.612 E1.91129
G1 X108.145 Y102.145
G1 X151.877 Y145.877 E1.90038
G1 X151.613 Y146.147
G1 X108.145 Y102.678 E1.8889
G1 X108.145 Y103.212
G1 X151.348 Y146.415 E1.87741
G1 X151.084 Y146.684
G1 X108.145 Y103.745 E1.86592
G1 X108.145 Y104.278
G1 X150.818 Y146.951 E1.85435
G1 X150.54 Y147.207
G1 X108.101 Y104.768 E1.84416
G1 X107.857 Y105.058
G1 X150.262 Y147.463 E1.8427
G1 X149.985 Y147.718
G1 X107.411 Y105.145 E1.85003
G1 X106.878 Y105.145
G1 X149.703 Y147.97 E1.86097
G1 X149.412 Y148.212
G1 X106.345 Y105.145 E1.8715
G1 X105.811 Y105.145
G1 X149.121 Y148.455 E1.88203
G1 X148.83 Y148.697
G1 X105.278 Y105.145 E1.89256
G1 X104.745 Y105.145
G1 X148.533 Y148.933 E1.90283
G1 X148.229 Y149.162
G1 X104.212 Y105.145 E1.91278
G1 X103.678 Y105.145
G1 X147.925 Y149.391 E1.92272
G1 X147.62 Y149.62
G1 X103.145 Y105.145 E1.93267
G1 X102.612 Y105.145
G1 X147.307 Y149.84 E1.94224
G1 X146.989 Y150.056
G1 X102.078 Y105.145 E1.9516
G1 X101.545 Y105.145
G1 X146.671 Y150.271 E1.96096
G1 X146.354 Y150.486
G1 X101.012 Y105.145 E1.97031
G1 X100.479 Y105.145
G1 X146.024 Y150.69 E1.97915
G1 X145.692 Y150.891
G1 X99.945 Y105.145 E1.98791
G1 X99.412 Y105.145
G1 X145.36 Y151.093 E1.99666
G1 X145.027 Y151.292
G1 X98.879 Y105.145 E2.00535
G1 X98.346 Y105.145
G1 X144.681 Y151.48 E2.01348
G1 X144.335 Y151.667
G1 X97.812 Y105.145 E2.02162
G1 X97.279 Y105.145
G1 X143.989 Y151.854 E2.02976
G1 X143.636 Y152.035
G1 X96.746 Y105.145 E2.03762
G1 X96.213 Y105.145
G1 X143.276 Y152.208 E2.04513
G1 X142.915 Y152.38
G1 X95.679 Y105.145 E2.05263
G1 X95.146 Y105.145
G1 X142.554 Y152.553 E2.06013
G1 X142.182 Y152.714
G1 X94.613 Y105.145 E2.06711
G1 X94.079 Y105.145
G1 X141.806 Y152.871 E2.07395
G1 X141.43 Y153.029
G1 X93.546 Y105.145 E2.08079
G1 X93.013 Y105.145
G1 X141.051 Y153.183 E2.08748
G1 X140.659 Y153.324
G1 X92.48 Y105.145 E2.09364
G1 X91.946 Y105.145
G1 X140.268 Y153.466 E2.0998
G1 X139.876 Y153.608
G1 X91.413 Y105.145 E2.10595
M73 P45 R25
G1 X90.924 Y105.189
G1 X139.472 Y153.737 E2.10966
G1 X139.064 Y153.862
G1 X90.657 Y105.455 E2.10352
G1 X90.645 Y105.976
G1 X138.656 Y153.987 E2.08633
G1 X138.242 Y154.107
G1 X90.645 Y106.509 E2.06834
G1 X90.645 Y107.043
G1 X137.817 Y154.214 E2.04985
G1 X137.391 Y154.322
G1 X90.645 Y107.576 E2.03136
G1 X90.645 Y108.109
G1 X136.965 Y154.429 E2.01284
G1 X136.521 Y154.519
G1 X90.645 Y108.642 E1.99354
G1 X90.645 Y109.176
G1 X136.077 Y154.608 E1.97425
G1 X135.633 Y154.697
G1 X90.645 Y109.709 E1.95496
G1 X90.645 Y110.242
G1 X135.173 Y154.77 E1.93495
G1 X134.709 Y154.84
G1 X90.645 Y110.775 E1.9148
G1 X90.645 Y111.309
G1 X134.245 Y154.909 E1.89465
G1 X133.766 Y154.963
G1 X90.645 Y111.842 E1.87382
G1 X90.645 Y112.375
G1 X133.281 Y155.011 E1.85274
G1 X132.796 Y155.06
G1 X90.645 Y112.908 E1.83167
G1 X90.645 Y113.442
G1 X132.293 Y155.09 E1.80984
G1 X131.785 Y155.116
G1 X90.645 Y113.975 E1.78776
G1 X90.645 Y114.508
G1 X131.277 Y155.141 E1.76569
G1 X130.747 Y155.143
G1 X90.645 Y115.042 E1.74262
G1 X90.645 Y115.575
G1 X130.213 Y155.143 E1.71945
G1 X129.675 Y155.139
G1 X90.645 Y116.108 E1.69606
G1 X90.645 Y116.641
G1 X129.114 Y155.111 E1.67168
G1 X128.553 Y155.083
G1 X90.645 Y117.175 E1.6473
G1 X90.645 Y117.708
G1 X127.973 Y155.037 E1.62211
G1 X127.381 Y154.978
G1 X90.645 Y118.241 E1.59638
G1 X90.645 Y118.774
G1 X126.784 Y154.913 E1.57041
G1 X126.156 Y154.819
G1 X90.645 Y119.308 E1.54315
G1 X90.645 Y119.841
G1 X125.529 Y154.725 E1.51589
G1 X124.867 Y154.597
G1 X90.645 Y120.374 E1.48712
G1 X90.645 Y120.908
G1 X124.199 Y154.462 E1.45812
M73 P46 R25
G1 X123.498 Y154.294
G1 X90.645 Y121.441 E1.42763
G1 X90.645 Y121.974
G1 X101.528 Y132.857 E.47292
G1 X100.994 Y132.857
G1 X90.645 Y122.507 E.44974
G1 X90.645 Y123.041
G1 X100.461 Y132.857 E.42656
G1 X99.927 Y132.857
G1 X90.645 Y123.574 E.40339
G1 X90.645 Y124.107
G1 X99.394 Y132.857 E.38021
G1 X98.861 Y132.857
G1 X90.645 Y124.64 E.35703
G1 X90.645 Y125.174
G1 X98.327 Y132.856 E.33385
G1 X97.794 Y132.856
G1 X90.645 Y125.707 E.31068
G1 X90.645 Y126.24
G1 X97.261 Y132.856 E.2875
G1 X96.727 Y132.856
G1 X90.645 Y126.774 E.26432
G1 X90.645 Y127.307
G1 X96.194 Y132.856 E.24115
G1 X95.661 Y132.856
G1 X90.645 Y127.84 E.21797
G1 X90.645 Y128.373
G1 X95.127 Y132.856 E.19479
G1 X94.594 Y132.856
G1 X90.645 Y128.907 E.17162
G1 X90.645 Y129.44
G1 X94.061 Y132.856 E.14844
G1 X93.527 Y132.856
G1 X90.645 Y129.973 E.12526
G1 X90.645 Y130.506
G1 X92.994 Y132.856 E.10209
G1 X92.46 Y132.856
G1 X90.645 Y131.04 E.07891
G1 X90.645 Y131.573
G1 X91.927 Y132.855 E.05573
G1 X91.394 Y132.855
G1 X90.645 Y132.106 E.03255
M204 S10000
G1 X102.27 Y133.6 F30000
M204 S2000
G1 F12000
G1 X122.784 Y154.113 E.89142
G1 X122.028 Y153.89
G1 X102.486 Y134.349 E.84916
G1 X102.737 Y135.133
G1 X121.258 Y153.654 E.80487
G1 X120.426 Y153.355
G1 X103.015 Y135.945 E.75657
G1 X103.359 Y136.821
G1 X119.564 Y153.026 E.70418
G1 X118.646 Y152.641
G1 X103.746 Y137.742 E.64747
G1 X104.197 Y138.726
G1 X117.637 Y152.166 E.58402
G1 X116.533 Y151.595
G1 X104.774 Y139.836 E.511
M204 S10000
G1 X105.495 Y141.091 F30000
M204 S2000
G1 F12000
G1 X115.276 Y150.872 E.42503
M204 S10000
G1 X113.751 Y149.88 F30000
M204 S2000
G1 F12000
G1 X106.49 Y142.618 E.31554
M204 S10000
; WIPE_START
G1 F24000
G1 X107.904 Y144.033 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.258 J1.189 P1  F30000
G1 X159.401 Y132.87 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.110857
G1 F15000
G1 X159.341 Y132.849 E.00035
G2 X159.201 Y132.887 I-.044 J.114 E.00086
; WIPE_START
G1 F24000
G1 X159.299 Y132.836 E-.38404
G1 X159.341 Y132.849 E-.15528
G1 X159.401 Y132.87 E-.22068
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.188 J-.263 P1  F30000
G1 X153.239 Y105.088 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.140567
G1 F15000
G1 X153.123 Y105.106 E.00093
; LINE_WIDTH: 0.208724
G3 X152.991 Y105.016 I.043 J-.207 E.00221
G1 X152.836 Y104.836 E.00321
G1 X152.874 Y101.637 F30000
; LINE_WIDTH: 0.292805
G1 F15000
G1 X152.363 Y101.126 E.01471
G1 X117.022 Y105.129 F30000
; LINE_WIDTH: 0.14555
G1 F15000
G3 X116.851 Y105.173 I-.131 J-.154 E.00153
G1 X116.716 Y105.103 E.00127
G1 X116.374 Y101.518 F30000
; LINE_WIDTH: 0.124849
G1 F15000
G1 X115.982 Y101.126 E.0037
; WIPE_START
G1 F24000
G1 X116.374 Y101.518 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.947 J-.765 P1  F30000
G1 X91.053 Y132.874 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.174424
G1 F15000
G1 X90.626 Y132.447 E.00647
G1 X101.807 Y132.884 F30000
; LINE_WIDTH: 0.168644
G1 F15000
G1 X101.661 Y132.813 E.00166
G1 X101.515 Y132.87 E.0016
G1 X102.338 Y133.532 F30000
; LINE_WIDTH: 0.09145
G1 F15000
G2 X102.167 Y133.255 I-7.686 J4.552 E.00128
G1 X103.808 Y137.68 F30000
; LINE_WIDTH: 0.214076
G1 F15000
G1 X103.679 Y137.494 E.00315
; LINE_WIDTH: 0.170647
G1 X103.549 Y137.308 E.00235
G1 X104.835 Y139.775 F30000
; LINE_WIDTH: 0.219109
G1 F15000
G1 X104.728 Y139.629 E.00259
; LINE_WIDTH: 0.175463
G1 X104.622 Y139.483 E.00195
; LINE_WIDTH: 0.131816
G1 X104.515 Y139.338 E.00131
G1 X105.556 Y141.03 F30000
; LINE_WIDTH: 0.224135
G1 F15000
G1 X105.425 Y140.859 E.00318
; LINE_WIDTH: 0.178813
G1 X105.293 Y140.689 E.00238
; LINE_WIDTH: 0.133491
G1 X105.161 Y140.518 E.00159
G1 X106.55 Y142.558 F30000
; LINE_WIDTH: 0.234194
G1 F15000
G1 X106.459 Y142.451 E.00219
; LINE_WIDTH: 0.22718
G1 X106.312 Y142.271 E.00348
; LINE_WIDTH: 0.180844
G1 X106.166 Y142.091 E.00261
; LINE_WIDTH: 0.134507
G1 X106.02 Y141.911 E.00173
G1 X112.623 Y149.048 F30000
; LINE_WIDTH: 0.0881691
G1 F15000
G1 X112.347 Y148.809 E.00135
; LINE_WIDTH: 0.136276
G1 X111.99 Y148.483 E.00368
; LINE_WIDTH: 0.180219
G1 X111.633 Y148.157 E.00541
; LINE_WIDTH: 0.224162
G1 X111.276 Y147.831 E.00714
; LINE_WIDTH: 0.268107
G1 X110.754 Y147.33 E.01327
; LINE_WIDTH: 0.317916
G3 X109.214 Y145.802 I30.015 J-31.804 E.04861
; LINE_WIDTH: 0.315898
G1 X108.717 Y145.276 E.0161
; LINE_WIDTH: 0.273994
G1 X108.22 Y144.749 E.01363
; LINE_WIDTH: 0.232088
G1 X107.917 Y144.411 E.007
; LINE_WIDTH: 0.184116
G1 X107.613 Y144.074 E.00522
; LINE_WIDTH: 0.136143
G1 X107.31 Y143.736 E.00345
G1 X114.481 Y150.372 F30000
; LINE_WIDTH: 0.0881688
G1 F15000
G1 X114.258 Y150.188 E.00107
; LINE_WIDTH: 0.135727
G1 X114.035 Y150.003 E.00219
; LINE_WIDTH: 0.183285
G1 X113.811 Y149.819 E.00331
G1 X115.88 Y151.237 F30000
; LINE_WIDTH: 0.0881702
G1 F15000
G1 X115.699 Y151.095 E.00085
; LINE_WIDTH: 0.134051
G1 X115.518 Y150.953 E.00171
; LINE_WIDTH: 0.179932
G1 X115.337 Y150.811 E.00257
G1 X118.098 Y152.387 F30000
; LINE_WIDTH: 0.0881697
G1 F15000
G1 X117.965 Y152.293 E.0006
; LINE_WIDTH: 0.1307
G1 X117.832 Y152.198 E.00116
; LINE_WIDTH: 0.17323
G1 X117.699 Y152.104 E.00173
G1 X119.969 Y153.194 F30000
; LINE_WIDTH: 0.131067
G1 F15000
G1 X119.797 Y153.079 E.00148
; LINE_WIDTH: 0.170893
G1 X119.626 Y152.964 E.00215
M106 S239.7
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.797 Y153.079 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/105
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
G3 Z3.4 I.467 J1.124 P1  F30000
G1 X169.102 Y132.602 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X159.345 Y132.604 E.32368
G2 X158.581 Y133.203 I.055 J.856 E.03422
G3 X102.419 Y133.203 I-28.081 J-7.331 E2.53275
G2 X101.655 Y132.604 I-.819 J.257 E.03422
G1 X90.898 Y132.602 E.35685
G1 X90.898 Y105.398 E.90241
G1 X107.535 Y105.398 E.55188
G2 X108.398 Y104.537 I.003 J-.86 E.04494
G1 X108.398 Y101.398 E.10414
G1 X116.102 Y101.398 E.25555
G1 X116.104 Y104.598 E.10616
G2 X116.907 Y105.396 I.852 J-.054 E.04107
G1 X144.035 Y105.398 E.89988
G2 X144.898 Y104.542 I.013 J-.849 E.04492
G1 X144.898 Y101.398 E.1043
G1 X152.602 Y101.398 E.25556
G1 X152.602 Y104.537 E.10414
G2 X153.465 Y105.398 I.86 J.001 E.04494
G1 X169.102 Y105.398 E.5187
G1 X169.102 Y132.542 E.90042
G1 X168.71 Y132.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X159.33 Y132.212 E.28822
G2 X158.208 Y133.08 I.073 J1.253 E.04634
G3 X102.792 Y133.08 I-27.708 J-7.211 E2.31587
G2 X101.67 Y132.212 I-1.195 J.384 E.04634
G1 X91.29 Y132.21 E.31894
G1 X91.29 Y105.79 E.81181
G1 X107.545 Y105.79 E.49946
G2 X108.79 Y104.547 I-.01 J-1.255 E.05991
G1 X108.79 Y101.79 E.08471
G1 X115.71 Y101.79 E.21263
G1 X115.712 Y104.613 E.08675
G2 X116.888 Y105.788 I1.247 J-.072 E.0559
G1 X144.045 Y105.79 E.83445
G2 X145.29 Y104.547 I.004 J-1.241 E.06008
G1 X145.29 Y101.79 E.08472
G1 X152.21 Y101.79 E.21263
G1 X152.21 Y104.547 E.08471
G2 X153.455 Y105.79 I1.255 J-.012 E.05991
G1 X168.71 Y105.79 E.46874
G1 X168.71 Y132.15 E.80997
M204 S10000
; WIPE_START
G1 F24000
G1 X166.71 Y132.163 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.313 J-1.176 P1  F30000
G1 X55.624 Y102.569 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
G1 X200.094 Y98.605 E4.64692
G3 X204.398 Y103.007 I-.105 J4.408 E.22609
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.402 J.004 E.2296
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I-.004 J-4.402 E.2296
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.233 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X55.234 Y102.531 E.00004
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.103 Y98.213 E4.30491
G3 X204.79 Y103.003 I-.116 J4.801 E.2279
G1 X204.79 Y152.997 E1.5362
G3 X204.754 Y153.572 I-5.161 J-.033 E.01771
G1 X204.754 Y153.572 E0
G3 X199.997 Y157.79 I-4.768 J-.587 E.21346
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.001 J-4.794 E.23131
G1 X55.21 Y103.003 E1.5362
G1 X55.23 Y102.591 E.01267
M204 S10000
; WIPE_START
G1 F24000
G1 X55.234 Y102.531 E-.02292
G1 X55.302 Y102.066 E-.17859
G1 X55.416 Y101.61 E-.17863
G1 X55.575 Y101.167 E-.17862
G1 X55.776 Y100.742 E-.17862
G1 X55.806 Y100.691 E-.02261
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.24 J1.193 P1  F30000
G1 X90.55 Y107.671 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X90.55 Y106.043 E.05401
G1 X55.952 Y140.641 E1.62306
G1 X55.952 Y138.388 E.07474
G1 X74.614 Y157.05 E.87548
G1 X77.922 Y157.05 E.10975
G1 X101.911 Y133.061 E1.12536
G3 X102.064 Y133.251 I-.276 J.377 E.00819
G1 X102.292 Y134.03 E.02692
G1 X101.798 Y134.175 E.01707
G1 X102.147 Y135.362 E.04103
G1 X102.663 Y135.21 E.01784
G2 X104.039 Y138.609 I29.212 J-9.85 E.12171
G1 X85.598 Y157.05 E.86509
G1 X82.29 Y157.05 E.10975
G1 X55.953 Y130.712 E1.23553
G1 X55.953 Y132.964 E.07468
G1 X89.965 Y98.951 E1.59561
G1 X93.275 Y98.951 E.10978
G1 X99.374 Y105.05 E.2861
G1 X99.219 Y105.05 E.00515
G1 X105.317 Y98.951 E.28609
G1 X108.627 Y98.951 E.1098
G1 X110.726 Y101.05 E.09844
G1 X110.895 Y101.05 E.0056
G1 X112.993 Y98.951 E.09844
G1 X116.303 Y98.951 E.10981
G1 X122.399 Y105.047 E.28597
G1 X122.249 Y105.047 E.00498
G1 X128.345 Y98.952 E.28596
G1 X131.655 Y98.952 E.10983
G1 X137.749 Y105.045 E.28587
G1 X137.603 Y105.045 E.00485
G1 X143.696 Y98.952 E.28586
G1 X147.008 Y98.952 E.10985
G1 X149.105 Y101.05 E.09841
G1 X149.274 Y101.05 E.0056
G1 X151.372 Y98.952 E.09841
G1 X154.684 Y98.952 E.10986
G1 X160.781 Y105.05 E.28605
G1 X160.626 Y105.05 E.00514
G1 X166.724 Y98.952 E.28604
G1 X170.036 Y98.952 E.10987
G1 X204.044 Y132.96 E1.59539
G1 X204.044 Y130.716 E.07447
G1 X177.71 Y157.05 E1.23539
G1 X174.402 Y157.05 E.10975
G1 X156.626 Y139.274 E.8339
G2 X158.787 Y133.759 I-26.66 J-13.631 E.1968
G1 X182.078 Y157.05 E1.0926
G1 X185.386 Y157.05 E.10975
G1 X204.044 Y138.391 E.87529
G1 X204.044 Y140.636 E.07447
G1 X169.45 Y106.043 E1.62287
G1 X169.45 Y107.671 E.05401
; WIPE_START
G1 F24000
G1 X169.45 Y106.043 E-.61876
G1 X169.713 Y106.305 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.101 J-1.213 P1  F30000
G1 X154.69 Y105.05 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F15476.087
G3 X153.334 Y105.033 I-.603 J-6.077 E.04506
G3 X153.1 Y104.9 I.259 J-.73 E.00898
G1 X159.048 Y98.952 E.27904
G1 X162.36 Y98.952 E.10986
G1 X168.457 Y105.05 E.28605
G1 X168.302 Y105.05 E.00514
G1 X174.4 Y98.952 E.28604
G1 X177.712 Y98.952 E.10988
G1 X204.044 Y125.285 E1.23529
G1 X204.044 Y123.04 E.07447
G1 X170.034 Y157.05 E1.59549
G1 X166.726 Y157.05 E.10975
G1 X153.635 Y143.959 E.6141
G2 X156.074 Y140.306 I-38.397 J-28.27 E.14574
G1 X163.429 Y132.951 E.34504
G1 X165.655 Y132.951 E.07385
G1 X189.754 Y157.05 E1.13052
G1 X193.062 Y157.05 E.10975
G1 X204.044 Y146.067 E.5152
G1 X204.044 Y148.312 E.07447
G1 X169.45 Y113.719 E1.62287
G1 X169.45 Y111.578 E.07102
G1 X182.075 Y98.953 E.59227
G1 X185.388 Y98.953 E.10989
G1 X204.044 Y117.609 E.87519
G1 X204.044 Y115.364 E.07447
G1 X162.358 Y157.05 E1.95558
G1 X159.05 Y157.05 E.10975
G1 X149.913 Y147.913 E.42861
G3 X148.662 Y148.955 I-85.476 J-101.33 E.05401
G1 X138.679 Y154.08 F30000
G1 F15476.087
G2 X140.229 Y153.581 I-4.247 J-15.855 E.05402
G1 X143.698 Y157.05 E.16272
G1 X147.006 Y157.05 E.10975
G1 X203.341 Y100.715 E2.64276
G3 X203.958 Y102.171 I-3.438 J2.318 E.05278
G1 X200.825 Y99.038 E.14699
G2 X200.396 Y98.97 I-.556 J2.146 E.01444
G2 X197.427 Y98.953 I-1.641 J26.522 E.09853
G1 X169.45 Y126.929 E1.31245
M73 P47 R25
G1 X169.45 Y129.071 E.07102
G1 X197.429 Y157.05 E1.31256
G1 X199.984 Y157.05 E.08474
G2 X200.825 Y156.962 I-.112 J-5.176 E.02808
G1 X203.96 Y153.827 E.14708
G3 X203.339 Y155.284 I-6.298 J-1.825 E.05265
G1 X169.45 Y121.395 E1.58981
G1 X169.45 Y119.254 E.07102
G1 X189.751 Y98.953 E.95236
G1 X193.064 Y98.953 E.1099
G1 X204.044 Y109.933 E.51509
G1 X204.044 Y107.688 E.07447
G1 X154.682 Y157.05 E2.31568
G1 X151.374 Y157.05 E.10975
G1 X145.464 Y151.14 E.27722
G3 X144.924 Y151.456 I-3.45 J-5.287 E.02078
G1 X139.33 Y157.05 E.26241
G1 X136.022 Y157.05 E.10975
G1 X134.007 Y155.034 E.09454
G1 X133.632 Y155.072 E.01248
G1 X131.654 Y157.05 E.09279
G1 X128.346 Y157.05 E.10975
G1 X126.221 Y154.925 E.09967
G1 X126.118 Y154.91 E.00345
G1 X123.978 Y157.05 E.10039
G1 X120.67 Y157.05 E.10975
G1 X113.297 Y149.676 E.3459
G3 X110.567 Y147.433 I17.789 J-24.421 E.11727
G1 X100.95 Y157.05 E.45115
G1 X97.642 Y157.05 E.10975
G1 X55.954 Y115.362 E1.95565
G1 X55.954 Y117.61 E.07457
G1 X74.614 Y98.951 E.87536
G1 X77.923 Y98.951 E.10977
G1 X90.55 Y111.578 E.59235
G1 X90.55 Y113.719 E.07102
G1 X55.951 Y148.317 E1.6231
G1 X55.951 Y146.063 E.07479
G1 X66.938 Y157.05 E.51542
G1 X70.246 Y157.05 E.10975
G1 X94.345 Y132.951 E1.13053
G1 X96.571 Y132.951 E.07384
G1 X106.727 Y143.107 E.47642
G1 X106.933 Y143.391 E.01164
G1 X93.274 Y157.05 E.64077
G1 X89.966 Y157.05 E.10975
G1 X55.954 Y123.037 E1.59559
G1 X55.953 Y125.287 E.07463
G1 X82.29 Y98.951 E1.23549
G1 X85.599 Y98.951 E.10977
G1 X91.698 Y105.05 E.28611
G1 X91.543 Y105.05 E.00515
G1 X97.641 Y98.951 E.2861
G1 X100.951 Y98.951 E.10979
G1 X107.05 Y105.05 E.2861
G1 X106.895 Y105.05 E.00515
G1 X108.042 Y103.902 E.05385
G1 X108.047 Y102.273 E.05401
; WIPE_START
G1 F24000
G1 X108.042 Y103.902 E-.61876
G1 X107.78 Y104.165 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.352 J1.165 P1  F30000
G1 X116.45 Y101.541 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F15476.087
G1 X116.451 Y103.169 E.05401
G1 X120.669 Y98.951 E.19786
G1 X123.979 Y98.951 E.10982
G1 X130.074 Y105.046 E.28592
G1 X129.926 Y105.046 E.00492
G1 X136.02 Y98.952 E.28591
G1 X139.332 Y98.952 E.10984
G1 X144.541 Y104.161 E.2444
G1 X144.546 Y102.533 E.05401
; WIPE_START
G1 F24000
G1 X144.541 Y104.161 E-.61876
G1 X144.279 Y103.899 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.717 J-.983 P1  F30000
G1 X102.334 Y134.467 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.498834
G1 F13818.395
G1 X102.423 Y134.767 E.0116
; WIPE_START
G1 F24000
G1 X102.334 Y134.467 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.942 J.77 P1  F30000
G1 X116.317 Y151.587 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X114.913 Y150.763 I7.596 J-14.552 E.05402
G1 X108.626 Y157.05 E.29494
G1 X105.318 Y157.05 E.10975
G1 X55.955 Y107.687 E2.3157
G1 X55.955 Y109.933 E.07451
G1 X66.938 Y98.95 E.51523
G1 X70.247 Y98.951 E.10976
G1 X90.55 Y119.254 E.95246
G1 X90.55 Y121.395 E.07102
G1 X56.666 Y155.278 E1.58955
G3 X56.038 Y153.825 I4.974 J-3.014 E.05268
G1 X59.162 Y156.95 E.14659
G1 X59.406 Y157.005 E.00828
G2 X62.57 Y157.05 I1.889 J-21.591 E.10508
G1 X90.55 Y129.071 E1.31256
G1 X90.55 Y126.929 E.07102
G1 X62.571 Y98.95 E1.31256
G1 X60.016 Y98.95 E.08474
G2 X59.175 Y99.038 I.112 J5.176 E.02808
G1 X56.04 Y102.173 E.14708
G3 X56.661 Y100.716 I6.298 J1.825 E.05265
G1 X112.994 Y157.05 E2.64271
G1 X116.302 Y157.05 E.10975
G1 X120.037 Y153.315 E.17519
G2 X121.574 Y153.851 I6.161 J-15.214 E.05402
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.037 Y153.315 E-.61862
G1 X119.774 Y153.578 E-.14138
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/105
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
G3 Z3.6 I.476 J1.12 P1  F30000
G1 X169.102 Y132.602 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X159.348 Y132.604 E.32357
G2 X158.581 Y133.203 I.051 J.856 E.03433
G3 X102.419 Y133.203 I-28.081 J-7.336 E2.53255
G2 X101.652 Y132.604 I-.818 J.257 E.03433
G1 X90.898 Y132.602 E.35674
G1 X90.898 Y105.398 E.90241
G1 X107.535 Y105.398 E.55189
G2 X108.398 Y104.541 I.003 J-.86 E.04479
G1 X108.398 Y101.398 E.10427
G1 X116.102 Y101.398 E.25555
G1 X116.104 Y104.597 E.10612
G2 X116.905 Y105.396 I.852 J-.053 E.04103
G1 X144.035 Y105.398 E.89996
G2 X144.898 Y104.535 I.013 J-.85 E.04515
G1 X144.898 Y101.398 E.10407
G1 X152.602 Y101.398 E.25556
G1 X152.602 Y104.541 E.10427
G2 X153.465 Y105.398 I.86 J-.003 E.04479
G1 X169.102 Y105.398 E.51872
G1 X169.102 Y132.542 E.90042
G1 X168.71 Y132.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X159.333 Y132.212 E.28812
G2 X158.208 Y133.081 I.069 J1.253 E.04645
G3 X102.792 Y133.081 I-27.708 J-7.214 E2.31572
G2 X101.667 Y132.212 I-1.195 J.384 E.04645
G1 X91.29 Y132.21 E.31884
G1 X91.29 Y105.79 E.81181
G1 X107.545 Y105.79 E.49947
G2 X108.79 Y104.551 I-.01 J-1.255 E.05978
G1 X108.79 Y101.79 E.08483
G1 X115.71 Y101.79 E.21263
G1 X115.712 Y104.613 E.08673
G2 X116.886 Y105.788 I1.247 J-.072 E.05584
G1 X144.045 Y105.79 E.83452
G2 X145.29 Y104.545 I.004 J-1.241 E.06015
G1 X145.29 Y101.79 E.08465
G1 X152.21 Y101.79 E.21263
G1 X152.21 Y104.551 E.08483
G2 X153.455 Y105.79 I1.255 J-.016 E.05978
G1 X168.71 Y105.79 E.46874
G1 X168.71 Y132.15 E.80997
M204 S10000
; WIPE_START
G1 F24000
G1 X166.71 Y132.163 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.313 J-1.176 P1  F30000
G1 X55.624 Y102.569 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
G1 X200.101 Y98.605 E4.64716
G3 X204.398 Y103.007 I-.112 J4.408 E.22586
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.402 J.004 E.2296
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I.006 J-4.411 E.22946
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.233 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X55.234 Y102.531 E.00004
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.111 Y98.213 E4.30513
G3 X204.79 Y103.003 I-.123 J4.8 E.22768
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.794 J-.001 E.23131
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.012 J-4.804 E.23117
G1 X55.21 Y103.003 E1.5362
G1 X55.23 Y102.591 E.01267
M204 S10000
; WIPE_START
G1 F24000
G1 X55.234 Y102.531 E-.0229
G1 X55.302 Y102.066 E-.1786
G1 X55.416 Y101.61 E-.17864
G1 X55.575 Y101.167 E-.17861
G1 X55.776 Y100.742 E-.17862
G1 X55.806 Y100.691 E-.02263
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.24 J1.193 P1  F30000
G1 X90.55 Y107.671 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X90.55 Y106.043 E.05401
G1 X55.952 Y140.641 E1.62306
G1 X55.952 Y138.388 E.07474
G1 X74.614 Y157.05 E.87548
G1 X77.922 Y157.05 E.10975
G1 X101.911 Y133.061 E1.12537
G3 X102.064 Y133.253 I-.279 J.378 E.00823
G2 X104.039 Y138.609 I38.85 J-11.282 E.18953
G1 X85.598 Y157.05 E.86509
G1 X82.29 Y157.05 E.10975
G1 X55.953 Y130.712 E1.23553
G1 X55.953 Y132.964 E.07468
G1 X89.965 Y98.951 E1.59561
G1 X93.275 Y98.951 E.10979
G1 X99.374 Y105.05 E.2861
G1 X99.219 Y105.05 E.00515
G1 X105.317 Y98.951 E.28609
G1 X108.627 Y98.951 E.10981
G1 X110.726 Y101.05 E.09844
G1 X110.895 Y101.05 E.0056
G1 X112.993 Y98.951 E.09844
G1 X116.303 Y98.951 E.10982
G1 X122.399 Y105.047 E.28596
G1 X122.249 Y105.047 E.00497
G1 X128.344 Y98.952 E.28595
G1 X131.656 Y98.952 E.10983
G1 X137.749 Y105.045 E.28586
G1 X137.603 Y105.045 E.00485
G1 X143.696 Y98.952 E.28585
G1 X147.008 Y98.952 E.10985
G1 X149.105 Y101.05 E.09841
G1 X149.274 Y101.05 E.0056
G1 X151.372 Y98.952 E.0984
G1 X154.684 Y98.952 E.10986
G1 X160.781 Y105.05 E.28605
G1 X160.626 Y105.05 E.00514
G1 X166.724 Y98.952 E.28604
M73 P47 R24
G1 X170.036 Y98.952 E.10988
G1 X204.044 Y132.96 E1.59539
G1 X204.044 Y130.716 E.07447
G1 X177.71 Y157.05 E1.23539
G1 X174.402 Y157.05 E.10975
G1 X156.626 Y139.274 E.8339
G2 X158.787 Y133.759 I-26.654 J-13.628 E.1968
G1 X182.078 Y157.05 E1.0926
G1 X185.386 Y157.05 E.10975
G1 X204.044 Y138.391 E.87529
G1 X204.044 Y140.636 E.07447
G1 X169.45 Y106.043 E1.62287
G1 X169.45 Y107.671 E.05401
; WIPE_START
G1 F24000
G1 X169.45 Y106.043 E-.61876
G1 X169.713 Y106.305 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.091 J-.539 P1  F30000
G1 X148.662 Y148.955 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F15476.087
G2 X149.913 Y147.913 I-49.188 J-60.314 E.05401
G1 X159.05 Y157.05 E.42861
G1 X162.358 Y157.05 E.10975
G1 X204.044 Y115.364 E1.95558
G1 X204.044 Y117.609 E.07447
G1 X185.388 Y98.953 E.87518
G1 X182.075 Y98.953 E.1099
G1 X169.45 Y111.578 E.59226
G1 X169.45 Y113.719 E.07102
G1 X204.044 Y148.312 E1.62287
G1 X204.044 Y146.067 E.07447
G1 X193.062 Y157.05 E.5152
G1 X189.754 Y157.05 E.10975
G1 X165.655 Y132.951 E1.13053
G1 X163.429 Y132.951 E.07384
G1 X156.074 Y140.306 E.34504
G3 X153.635 Y143.959 I-40.836 J-24.617 E.14574
G1 X166.726 Y157.05 E.6141
G1 X170.034 Y157.05 E.10975
G1 X204.044 Y123.04 E1.59548
G1 X204.044 Y125.285 E.07447
G1 X177.712 Y98.953 E1.23529
G1 X174.399 Y98.953 E.10989
G1 X168.302 Y105.05 E.28603
G1 X168.457 Y105.05 E.00514
G1 X162.36 Y98.952 E.28604
G1 X159.048 Y98.952 E.10987
G1 X153.1 Y104.9 E.27902
G2 X153.33 Y105.032 I.475 J-.564 E.00884
G2 X154.69 Y105.05 I.757 J-5.8 E.04521
; WIPE_START
G1 F24000
G1 X153.33 Y105.032 E-.51671
G1 X153.1 Y104.9 E-.10067
G1 X153.366 Y104.634 E-.14262
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.282 J-1.184 P1  F30000
G1 X144.547 Y102.534 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F15476.087
G1 X144.542 Y104.163 E.05401
G1 X139.332 Y98.952 E.24445
G1 X136.02 Y98.952 E.10984
G1 X129.926 Y105.046 E.2859
G1 X130.074 Y105.046 E.00491
G1 X123.979 Y98.952 E.28591
G1 X120.669 Y98.951 E.10982
G1 X116.451 Y103.169 E.19785
G1 X116.45 Y101.541 E.05401
; WIPE_START
G1 F24000
G1 X116.451 Y103.169 E-.61876
G1 X116.714 Y102.906 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.089 J-1.214 P1  F30000
G1 X108.047 Y102.273 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F15476.087
G1 X108.042 Y103.902 E.05401
G1 X106.895 Y105.05 E.05385
G1 X107.05 Y105.05 E.00515
G1 X100.951 Y98.951 E.28609
G1 X97.641 Y98.951 E.1098
G1 X91.543 Y105.05 E.2861
G1 X91.698 Y105.05 E.00515
G1 X85.599 Y98.951 E.28611
G1 X82.29 Y98.951 E.10978
G1 X55.953 Y125.287 E1.23549
G1 X55.954 Y123.037 E.07463
G1 X89.966 Y157.05 E1.59559
G1 X93.274 Y157.05 E.10975
G1 X106.933 Y143.391 E.64077
G1 X106.727 Y143.107 E.01164
G1 X96.571 Y132.951 E.47642
G1 X94.345 Y132.951 E.07384
G1 X70.246 Y157.05 E1.13053
G1 X66.938 Y157.05 E.10975
G1 X55.951 Y146.063 E.51542
G1 X55.951 Y148.317 E.07479
G1 X90.55 Y113.719 E1.6231
G1 X90.55 Y111.578 E.07102
G1 X77.923 Y98.951 E.59235
G1 X74.614 Y98.951 E.10977
G1 X55.954 Y117.61 E.87536
G1 X55.954 Y115.362 E.07457
G1 X97.642 Y157.05 E1.95565
G1 X100.95 Y157.05 E.10975
G1 X110.569 Y147.431 E.45122
G2 X113.297 Y149.676 I20.097 J-21.637 E.11726
G1 X120.67 Y157.05 E.3459
G1 X123.978 Y157.05 E.10975
G1 X126.118 Y154.91 E.10039
G1 X126.221 Y154.925 E.00345
G1 X128.346 Y157.05 E.09967
G1 X131.654 Y157.05 E.10975
G1 X133.632 Y155.072 E.09279
G1 X134.007 Y155.034 E.01248
G1 X136.022 Y157.05 E.09454
G1 X139.33 Y157.05 E.10975
G1 X144.924 Y151.456 E.26241
G2 X145.464 Y151.14 I-2.909 J-5.603 E.02078
G1 X151.374 Y157.05 E.27722
G1 X154.682 Y157.05 E.10975
G1 X204.044 Y107.688 E2.31568
G1 X204.044 Y109.933 E.07447
G1 X193.064 Y98.953 E.51508
G1 X189.751 Y98.953 E.10991
G1 X169.45 Y119.254 E.95235
G1 X169.45 Y121.395 E.07102
G1 X203.338 Y155.283 E1.58976
G2 X203.96 Y153.827 I-3.731 J-2.455 E.05278
G1 X200.825 Y156.962 E.14708
G3 X199.984 Y157.05 I-.953 J-5.088 E.02808
G1 X197.429 Y157.05 E.08474
G1 X169.45 Y129.071 E1.31256
G1 X169.45 Y126.929 E.07102
G1 X197.427 Y98.953 E1.31244
G3 X200.396 Y98.97 I1.332 J26.227 E.09853
G3 X200.825 Y99.038 I-.127 J2.214 E.01445
G1 X203.958 Y102.171 E.14699
G2 X203.341 Y100.715 I-4.056 J.863 E.05278
G1 X147.006 Y157.05 E2.64276
G1 X143.698 Y157.05 E.10975
G1 X140.229 Y153.581 E.16272
G3 X138.679 Y154.08 I-5.797 J-15.357 E.05402
; WIPE_START
G1 F24000
G1 X140.229 Y153.581 E-.61861
G1 X140.492 Y153.844 E-.14139
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I0 J-1.217 P1  F30000
G1 X121.574 Y153.851 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F15476.087
G3 X120.037 Y153.315 I4.623 J-15.75 E.05402
G1 X116.302 Y157.05 E.17519
G1 X112.994 Y157.05 E.10975
G1 X56.661 Y100.716 E2.64271
G2 X56.04 Y102.173 I5.677 J3.281 E.05265
G1 X59.175 Y99.038 E.14708
G3 X60.016 Y98.95 I.953 J5.089 E.02808
G1 X62.571 Y98.95 E.08474
G1 X90.55 Y126.929 E1.31256
G1 X90.55 Y129.071 E.07102
G1 X62.57 Y157.05 E1.31256
G3 X59.406 Y157.005 I-1.275 J-21.636 E.10508
G1 X59.162 Y156.95 E.00828
G1 X56.038 Y153.825 E.14659
G2 X56.666 Y155.278 I5.603 J-1.561 E.05268
G1 X90.55 Y121.395 E1.58955
G1 X90.55 Y119.254 E.07102
G1 X70.247 Y98.951 E.95245
G1 X66.938 Y98.95 E.10976
G1 X55.955 Y109.933 E.51523
G1 X55.955 Y107.687 E.07451
G1 X105.318 Y157.05 E2.3157
G1 X108.626 Y157.05 E.10975
G1 X114.913 Y150.763 E.29494
G2 X116.317 Y151.587 I9 J-13.728 E.05402
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.913 Y150.763 E-.6186
G1 X114.65 Y151.026 E-.1414
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/105
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
G3 Z3.8 I.39 J1.153 P1  F30000
G1 X169.102 Y132.602 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X159.351 Y132.604 E.32347
M73 P48 R24
G2 X158.581 Y133.203 I.048 J.856 E.03443
G3 X102.419 Y133.203 I-28.081 J-7.336 E2.53253
G2 X101.649 Y132.604 I-.818 J.257 E.03444
G1 X90.898 Y132.602 E.35665
G1 X90.898 Y105.398 E.90241
G1 X107.535 Y105.398 E.55189
G2 X108.398 Y104.545 I.003 J-.86 E.04466
G1 X108.398 Y101.398 E.1044
G1 X116.102 Y101.398 E.25555
G1 X116.104 Y104.596 E.10609
G2 X116.902 Y105.396 I.852 J-.052 E.04097
G1 X144.035 Y105.398 E.90003
G2 X144.898 Y104.535 I.013 J-.85 E.04515
G1 X144.898 Y101.398 E.10407
G1 X152.602 Y101.398 E.25556
G1 X152.602 Y104.545 E.1044
G2 X153.465 Y105.398 I.86 J-.007 E.04466
G1 X169.102 Y105.398 E.51872
G1 X169.102 Y132.542 E.90042
G1 X168.71 Y132.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X159.336 Y132.211 E.28802
G2 X158.208 Y133.081 I.066 J1.253 E.04655
G3 X102.792 Y133.081 I-27.708 J-7.214 E2.3157
G2 X101.664 Y132.211 I-1.194 J.383 E.04655
G1 X91.29 Y132.21 E.31875
G1 X91.29 Y105.79 E.81181
G1 X107.545 Y105.79 E.49947
G2 X108.79 Y104.555 I-.01 J-1.255 E.05966
G1 X108.79 Y101.79 E.08496
G1 X115.71 Y101.79 E.21263
G1 X115.712 Y104.612 E.08672
G2 X116.883 Y105.788 I1.247 J-.071 E.05578
G1 X144.045 Y105.79 E.8346
G2 X145.29 Y104.545 I.004 J-1.242 E.06015
G1 X145.29 Y101.79 E.08465
G1 X152.21 Y101.79 E.21263
G1 X152.21 Y104.555 E.08496
G2 X153.455 Y105.79 I1.255 J-.02 E.05966
G1 X168.71 Y105.79 E.46874
G1 X168.71 Y132.15 E.80997
M204 S10000
; WIPE_START
G1 F24000
G1 X166.71 Y132.163 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.313 J-1.176 P1  F30000
G1 X55.624 Y102.569 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
G1 X200.216 Y98.608 E4.65097
G3 X204.398 Y103.007 I-.219 J4.396 E.22219
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.411 J-.006 E.22946
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I.006 J-4.411 E.22946
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.233 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X55.234 Y102.531 E.00004
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.235 Y98.216 E4.30895
G3 X204.79 Y103.003 I-.239 J4.788 E.224
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.804 J-.012 E.23117
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.012 J-4.804 E.23117
G1 X55.21 Y103.003 E1.5362
G1 X55.23 Y102.591 E.01267
M204 S10000
; WIPE_START
G1 F24000
G1 X55.234 Y102.531 E-.02288
G1 X55.302 Y102.066 E-.1786
G1 X55.416 Y101.61 E-.17863
G1 X55.575 Y101.167 E-.17862
G1 X55.776 Y100.742 E-.17862
G1 X55.806 Y100.691 E-.02266
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.24 J1.193 P1  F30000
G1 X90.55 Y107.671 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X90.55 Y106.043 E.05401
G1 X55.952 Y140.641 E1.62306
G1 X55.952 Y138.388 E.07474
G1 X74.614 Y157.05 E.87548
G1 X77.922 Y157.05 E.10975
G1 X101.912 Y133.061 E1.12538
G3 X102.065 Y133.254 I-.282 J.38 E.00828
G2 X104.039 Y138.609 I38.831 J-11.275 E.18948
G1 X85.598 Y157.05 E.86509
G1 X82.29 Y157.05 E.10975
G1 X55.953 Y130.712 E1.23553
G1 X55.953 Y132.964 E.07468
G1 X89.965 Y98.952 E1.59558
G1 X93.276 Y98.952 E.10983
G1 X99.374 Y105.05 E.28607
G1 X99.219 Y105.05 E.00515
G1 X105.316 Y98.952 E.28605
G1 X108.628 Y98.952 E.10987
G1 X110.726 Y101.05 E.09839
G1 X110.895 Y101.05 E.0056
G1 X112.992 Y98.952 E.09839
G1 X116.304 Y98.953 E.10989
G1 X122.399 Y105.047 E.2859
G1 X122.249 Y105.047 E.00496
G1 X128.343 Y98.953 E.28588
G1 X131.657 Y98.953 E.10993
G1 X137.749 Y105.045 E.28579
G1 X137.603 Y105.045 E.00484
G1 X143.694 Y98.954 E.28576
G1 X147.01 Y98.954 E.10997
G1 X149.105 Y101.05 E.09832
G1 X149.274 Y101.05 E.0056
G1 X151.37 Y98.954 E.09832
G1 X154.686 Y98.954 E.10999
G1 X160.781 Y105.05 E.28596
G1 X160.626 Y105.05 E.00514
G1 X166.721 Y98.955 E.28594
G1 X170.038 Y98.955 E.11003
G1 X204.044 Y132.96 E1.59528
G1 X204.044 Y130.716 E.07447
G1 X177.71 Y157.05 E1.23539
G1 X174.402 Y157.05 E.10975
G1 X156.626 Y139.274 E.8339
G2 X158.787 Y133.759 I-26.648 J-13.626 E.1968
G1 X182.078 Y157.05 E1.0926
G1 X185.386 Y157.05 E.10975
G1 X204.044 Y138.391 E.87529
G1 X204.044 Y140.636 E.07447
G1 X169.45 Y106.043 E1.62287
G1 X169.45 Y107.671 E.05401
; WIPE_START
G1 F24000
G1 X169.45 Y106.043 E-.61876
G1 X169.713 Y106.305 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.091 J-.539 P1  F30000
G1 X148.662 Y148.955 Z4
G1 Z3.6
G1 E.8 F1800
G1 F15476.087
G2 X149.913 Y147.913 I-49.191 J-60.318 E.05401
G1 X159.05 Y157.05 E.42861
G1 X162.358 Y157.05 E.10975
G1 X204.044 Y115.364 E1.95558
G1 X204.044 Y117.609 E.07447
G1 X185.391 Y98.955 E.87506
G1 X182.073 Y98.955 E.11007
G1 X169.45 Y111.578 E.59215
G1 X169.45 Y113.719 E.07102
G1 X204.044 Y148.312 E1.62287
G1 X204.044 Y146.067 E.07447
G1 X193.062 Y157.05 E.5152
G1 X189.754 Y157.05 E.10975
G1 X165.655 Y132.951 E1.13053
G1 X163.429 Y132.951 E.07384
G1 X156.074 Y140.306 E.34504
G3 X153.635 Y143.959 I-40.836 J-24.617 E.14574
G1 X166.726 Y157.05 E.6141
G1 X170.034 Y157.05 E.10975
G1 X204.044 Y123.04 E1.59549
G1 X204.044 Y125.285 E.07447
G1 X177.715 Y98.955 E1.23517
G1 X174.397 Y98.955 E.11005
G1 X168.302 Y105.05 E.28592
G1 X168.457 Y105.05 E.00514
G1 X162.362 Y98.954 E.28594
G1 X159.046 Y98.954 E.11001
G1 X153.1 Y104.9 E.27891
G2 X153.331 Y105.032 I.456 J-.529 E.00888
G2 X154.69 Y105.05 I.756 J-5.841 E.04516
; WIPE_START
G1 F24000
G1 X153.331 Y105.032 E-.51622
G1 X153.1 Y104.9 E-.1011
G1 X153.366 Y104.634 E-.14268
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.282 J-1.184 P1  F30000
G1 X144.547 Y102.534 Z4
G1 Z3.6
G1 E.8 F1800
G1 F15476.087
G1 X144.542 Y104.163 E.05401
G1 X139.333 Y98.953 E.24437
G1 X136.019 Y98.953 E.10995
G1 X129.926 Y105.046 E.28582
G1 X130.074 Y105.046 E.0049
G1 X123.981 Y98.953 E.28584
G1 X120.667 Y98.953 E.10991
G1 X116.451 Y103.169 E.1978
G1 X116.45 Y101.541 E.05401
; WIPE_START
G1 F24000
G1 X116.451 Y103.169 E-.61876
G1 X116.714 Y102.906 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.089 J-1.214 P1  F30000
G1 X108.047 Y102.273 Z4
G1 Z3.6
G1 E.8 F1800
G1 F15476.087
G1 X108.042 Y103.902 E.05401
G1 X106.895 Y105.05 E.05385
G1 X107.05 Y105.05 E.00515
G1 X100.952 Y98.952 E.28606
G1 X97.64 Y98.952 E.10985
G1 X91.543 Y105.05 E.28606
G1 X91.698 Y105.05 E.00515
G1 X85.599 Y98.951 E.28608
G1 X82.289 Y98.951 E.10981
G1 X55.953 Y125.287 E1.23546
G1 X55.954 Y123.037 E.07463
G1 X89.966 Y157.05 E1.59559
G1 X93.274 Y157.05 E.10975
G1 X106.933 Y143.391 E.64077
G1 X106.727 Y143.107 E.01164
G1 X96.571 Y132.951 E.47643
G1 X94.345 Y132.951 E.07384
G1 X70.246 Y157.05 E1.13053
G1 X66.938 Y157.05 E.10975
G1 X55.951 Y146.063 E.51542
G1 X55.951 Y148.317 E.07479
G1 X90.55 Y113.719 E1.6231
G1 X90.55 Y111.578 E.07102
G1 X77.923 Y98.951 E.59234
G1 X74.613 Y98.951 E.10979
G1 X55.954 Y117.61 E.87534
G1 X55.954 Y115.362 E.07457
G1 X97.642 Y157.05 E1.95565
G1 X100.95 Y157.05 E.10975
G1 X110.566 Y147.434 E.4511
G2 X113.297 Y149.676 I20.829 J-22.576 E.11727
G1 X120.67 Y157.05 E.3459
G1 X123.978 Y157.05 E.10975
G1 X126.118 Y154.91 E.10039
G1 X126.221 Y154.925 E.00345
G1 X128.346 Y157.05 E.09967
G1 X131.654 Y157.05 E.10975
G1 X133.632 Y155.072 E.09279
G1 X134.007 Y155.034 E.01248
G1 X136.022 Y157.05 E.09454
G1 X139.33 Y157.05 E.10975
G1 X144.924 Y151.456 E.26241
G2 X145.464 Y151.14 I-2.909 J-5.603 E.02078
G1 X151.374 Y157.05 E.27722
G1 X154.682 Y157.05 E.10975
G1 X204.044 Y107.688 E2.31568
G1 X204.044 Y109.933 E.07447
G1 X193.067 Y98.956 E.51496
G1 X189.748 Y98.955 E.11009
G1 X169.45 Y119.254 E.95223
G1 X169.45 Y121.395 E.07102
G1 X203.335 Y155.28 E1.58962
G2 X203.96 Y153.827 I-3.595 J-2.407 E.05275
G1 X200.825 Y156.962 E.14708
G3 X199.984 Y157.05 I-.953 J-5.089 E.02808
G1 X197.429 Y157.05 E.08474
G1 X169.45 Y129.071 E1.31256
G1 X169.45 Y126.929 E.07102
G1 X197.424 Y98.956 E1.31231
G1 X200.194 Y98.956 E.09189
G3 X200.825 Y99.038 I-.016 J2.598 E.02115
G1 X203.958 Y102.171 E.14699
G2 X203.341 Y100.715 I-4.056 J.863 E.05278
G1 X147.006 Y157.05 E2.64276
G1 X143.698 Y157.05 E.10975
G1 X140.229 Y153.581 E.16272
G3 X138.679 Y154.08 I-5.797 J-15.357 E.05402
; WIPE_START
G1 F24000
G1 X140.229 Y153.581 E-.61861
G1 X140.492 Y153.844 E-.14139
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I0 J-1.217 P1  F30000
G1 X121.574 Y153.851 Z4
G1 Z3.6
G1 E.8 F1800
G1 F15476.087
G3 X120.037 Y153.315 I6.698 J-21.707 E.05401
G1 X116.302 Y157.05 E.17519
G1 X112.994 Y157.05 E.10975
G1 X56.661 Y100.716 E2.64271
G2 X56.04 Y102.173 I5.677 J3.281 E.05265
G1 X59.175 Y99.038 E.14708
G3 X60.016 Y98.95 I.953 J5.089 E.02808
G1 X62.571 Y98.95 E.08474
G1 X90.55 Y126.929 E1.31255
G1 X90.55 Y129.071 E.07102
G1 X62.57 Y157.05 E1.31256
G3 X59.406 Y157.005 I-1.275 J-21.636 E.10508
G1 X59.162 Y156.95 E.00828
G1 X56.038 Y153.825 E.14659
G2 X56.666 Y155.278 I5.603 J-1.561 E.05268
G1 X90.55 Y121.395 E1.58955
G1 X90.55 Y119.254 E.07102
G1 X70.247 Y98.951 E.95244
G1 X66.938 Y98.951 E.10977
G1 X55.955 Y109.933 E.51522
G1 X55.955 Y107.687 E.07451
G1 X105.318 Y157.05 E2.3157
G1 X108.626 Y157.05 E.10975
G1 X114.913 Y150.763 E.29494
G2 X116.317 Y151.587 I9 J-13.728 E.05402
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.913 Y150.763 E-.6186
G1 X114.65 Y151.026 E-.1414
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/105
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
G3 Z4 I.39 J1.153 P1  F30000
G1 X169.102 Y132.602 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X159.354 Y132.603 E.32337
G2 X158.581 Y133.203 I.045 J.856 E.03455
G3 X102.419 Y133.203 I-28.081 J-7.332 E2.53272
G2 X101.646 Y132.603 I-.818 J.256 E.03455
G1 X90.898 Y132.602 E.35654
G1 X90.898 Y105.398 E.90241
G1 X107.535 Y105.398 E.55189
G2 X108.398 Y104.549 I.003 J-.859 E.04453
G1 X108.398 Y101.398 E.10453
G1 X116.102 Y101.398 E.25555
G1 X116.104 Y104.598 E.10617
G2 X116.9 Y105.396 I.852 J-.055 E.04082
G1 X144.035 Y105.398 E.90011
G2 X144.898 Y104.535 I.013 J-.85 E.04516
G1 X144.898 Y101.398 E.10407
G1 X152.602 Y101.398 E.25556
G1 X152.602 Y104.549 E.10453
G2 X153.465 Y105.398 I.859 J-.011 E.04453
G1 X169.102 Y105.398 E.51872
G1 X169.102 Y132.542 E.90042
G1 X168.71 Y132.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X159.34 Y132.211 E.28793
G2 X158.208 Y133.081 I.062 J1.253 E.04666
G3 X102.792 Y133.081 I-27.708 J-7.211 E2.31583
G2 X101.66 Y132.211 I-1.194 J.383 E.04666
G1 X91.29 Y132.21 E.31865
G1 X91.29 Y105.79 E.81181
G1 X107.545 Y105.79 E.49947
G2 X108.79 Y104.559 I-.01 J-1.255 E.05954
G1 X108.79 Y101.79 E.08508
G1 X115.71 Y101.79 E.21263
G1 X115.712 Y104.613 E.08674
G2 X116.881 Y105.788 I1.247 J-.072 E.05568
G1 X144.045 Y105.79 E.83467
G2 X145.29 Y104.545 I.004 J-1.242 E.06015
G1 X145.29 Y101.79 E.08465
G1 X152.21 Y101.79 E.21263
G1 X152.21 Y104.559 E.08508
G2 X153.455 Y105.79 I1.255 J-.024 E.05954
G1 X168.71 Y105.79 E.46874
G1 X168.71 Y132.15 E.80997
M204 S10000
; WIPE_START
G1 F24000
G1 X166.71 Y132.163 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.313 J-1.176 P1  F30000
G1 X55.624 Y102.569 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
G1 X200.115 Y98.605 E4.64762
G3 X204.398 Y103.007 I-.126 J4.407 E.22539
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.402 J.004 E.2296
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I.006 J-4.411 E.22946
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.233 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X55.234 Y102.531 E.00004
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.125 Y98.213 E4.30556
G3 X204.79 Y103.003 I-.137 J4.8 E.22725
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.794 J-.001 E.23131
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.012 J-4.804 E.23117
G1 X55.21 Y103.003 E1.5362
G1 X55.23 Y102.591 E.01267
M204 S10000
; WIPE_START
G1 F24000
G1 X55.234 Y102.531 E-.02286
G1 X55.302 Y102.066 E-.17859
G1 X55.416 Y101.61 E-.17864
G1 X55.575 Y101.167 E-.17862
G1 X55.776 Y100.742 E-.17863
G1 X55.806 Y100.691 E-.02266
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.24 J1.193 P1  F30000
G1 X90.55 Y107.671 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X90.55 Y106.043 E.05401
G1 X55.952 Y140.641 E1.62306
G1 X55.952 Y138.388 E.07474
G1 X74.614 Y157.05 E.87548
G1 X77.922 Y157.05 E.10975
G1 X101.912 Y133.06 E1.12539
G3 X102.065 Y133.255 I-.284 J.381 E.00832
G2 X104.039 Y138.609 I38.814 J-11.27 E.18944
G1 X85.598 Y157.05 E.86509
G1 X82.29 Y157.05 E.10975
G1 X55.953 Y130.712 E1.23553
G1 X55.953 Y132.964 E.07468
G1 X89.965 Y98.951 E1.59561
G1 X93.275 Y98.951 E.10979
G1 X99.374 Y105.05 E.2861
G1 X99.219 Y105.05 E.00515
G1 X105.317 Y98.951 E.28609
G1 X108.627 Y98.951 E.10981
G1 X110.726 Y101.05 E.09843
G1 X110.895 Y101.05 E.0056
G1 X112.993 Y98.951 E.09843
G1 X116.303 Y98.952 E.10982
M73 P49 R24
G1 X122.399 Y105.047 E.28594
G1 X122.249 Y105.047 E.00496
G1 X128.344 Y98.952 E.28593
G1 X131.656 Y98.952 E.10985
G1 X137.749 Y105.045 E.28584
G1 X137.603 Y105.045 E.00484
G1 X143.696 Y98.952 E.28583
G1 X147.008 Y98.952 E.10987
G1 X149.105 Y101.05 E.0984
G1 X149.274 Y101.05 E.0056
G1 X151.372 Y98.952 E.09839
G1 X154.684 Y98.952 E.10988
G1 X160.781 Y105.05 E.28604
G1 X160.626 Y105.05 E.00514
G1 X166.723 Y98.953 E.28602
G1 X170.036 Y98.953 E.1099
G1 X204.044 Y132.96 E1.59537
G1 X204.044 Y130.716 E.07447
G1 X177.71 Y157.05 E1.23539
G1 X174.402 Y157.05 E.10975
G1 X156.626 Y139.274 E.8339
G2 X158.787 Y133.759 I-26.643 J-13.623 E.1968
G1 X182.078 Y157.05 E1.0926
G1 X185.386 Y157.05 E.10975
G1 X204.044 Y138.391 E.87529
G1 X204.044 Y140.636 E.07447
G1 X169.45 Y106.043 E1.62287
G1 X169.45 Y107.671 E.05401
; WIPE_START
G1 F24000
G1 X169.45 Y106.043 E-.61876
G1 X169.713 Y106.305 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.091 J-.539 P1  F30000
G1 X148.662 Y148.955 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F15476.087
G2 X149.913 Y147.913 I-49.188 J-60.314 E.05401
G1 X159.05 Y157.05 E.42861
G1 X162.358 Y157.05 E.10975
G1 X204.044 Y115.364 E1.95558
G1 X204.044 Y117.609 E.07447
G1 X185.389 Y98.953 E.87517
G1 X182.075 Y98.953 E.10992
G1 X169.45 Y111.578 E.59225
G1 X169.45 Y113.719 E.07102
G1 X204.044 Y148.312 E1.62287
G1 X204.044 Y146.067 E.07447
G1 X193.062 Y157.05 E.5152
G1 X189.754 Y157.05 E.10975
G1 X165.655 Y132.951 E1.13053
G1 X163.429 Y132.951 E.07384
G1 X156.074 Y140.306 E.34505
G3 X153.635 Y143.959 I-40.836 J-24.617 E.14574
G1 X166.726 Y157.05 E.6141
G1 X170.034 Y157.05 E.10975
G1 X204.044 Y123.04 E1.59549
G1 X204.044 Y125.285 E.07447
G1 X177.713 Y98.953 E1.23527
G1 X174.399 Y98.953 E.10991
G1 X168.302 Y105.05 E.28602
G1 X168.457 Y105.05 E.00514
G1 X162.36 Y98.953 E.28603
G1 X159.048 Y98.952 E.10989
G1 X153.101 Y104.899 E.27897
G2 X153.333 Y105.032 I.439 J-.498 E.00893
G2 X154.69 Y105.05 I.755 J-5.885 E.04512
; WIPE_START
G1 F24000
G1 X153.333 Y105.032 E-.51571
G1 X153.101 Y104.899 E-.10154
G1 X153.366 Y104.634 E-.14275
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.282 J-1.184 P1  F30000
G1 X144.547 Y102.534 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F15476.087
G1 X144.542 Y104.163 E.05401
G1 X139.332 Y98.952 E.24444
G1 X136.02 Y98.952 E.10986
G1 X129.926 Y105.046 E.28588
G1 X130.074 Y105.046 E.0049
G1 X123.98 Y98.952 E.28589
G1 X120.669 Y98.952 E.10983
G1 X116.451 Y103.169 E.19785
G1 X116.45 Y101.541 E.05401
; WIPE_START
G1 F24000
G1 X116.451 Y103.169 E-.61876
G1 X116.714 Y102.906 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.089 J-1.214 P1  F30000
G1 X108.047 Y102.273 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F15476.087
G1 X108.042 Y103.902 E.05401
G1 X106.895 Y105.05 E.05385
G1 X107.05 Y105.05 E.00515
G1 X100.951 Y98.951 E.28609
G1 X97.641 Y98.951 E.1098
G1 X91.543 Y105.05 E.28609
G1 X91.698 Y105.05 E.00515
G1 X85.599 Y98.951 E.28611
G1 X82.29 Y98.951 E.10978
G1 X55.953 Y125.287 E1.23548
G1 X55.954 Y123.037 E.07463
G1 X89.966 Y157.05 E1.59559
G1 X93.274 Y157.05 E.10975
G1 X106.933 Y143.391 E.64077
G1 X106.727 Y143.107 E.01164
G1 X96.571 Y132.951 E.47643
G1 X94.345 Y132.951 E.07383
G1 X70.246 Y157.05 E1.13053
G1 X66.938 Y157.05 E.10975
G1 X55.951 Y146.063 E.51542
G1 X55.951 Y148.317 E.07479
G1 X90.55 Y113.719 E1.6231
G1 X90.55 Y111.578 E.07102
G1 X77.923 Y98.951 E.59235
G1 X74.614 Y98.951 E.10977
G1 X55.954 Y117.61 E.87536
G1 X55.954 Y115.362 E.07457
G1 X97.642 Y157.05 E1.95565
G1 X100.95 Y157.05 E.10975
G1 X110.566 Y147.434 E.4511
G2 X113.297 Y149.676 I20.829 J-22.576 E.11727
G1 X120.67 Y157.05 E.3459
G1 X123.978 Y157.05 E.10975
G1 X126.118 Y154.91 E.10039
G1 X126.221 Y154.925 E.00345
G1 X128.346 Y157.05 E.09967
G1 X131.654 Y157.05 E.10975
G1 X133.632 Y155.072 E.09279
G1 X134.007 Y155.034 E.01248
G1 X136.022 Y157.05 E.09454
G1 X139.33 Y157.05 E.10975
G1 X144.924 Y151.456 E.26241
G2 X145.464 Y151.14 I-2.909 J-5.603 E.02078
G1 X151.374 Y157.05 E.27722
G1 X154.682 Y157.05 E.10975
G1 X204.044 Y107.688 E2.31568
G1 X204.044 Y109.933 E.07447
G1 X193.065 Y98.953 E.51507
G1 X189.751 Y98.953 E.10993
G1 X169.45 Y119.254 E.95233
G1 X169.45 Y121.395 E.07102
G1 X203.339 Y155.284 E1.58981
G2 X203.96 Y153.827 I-5.677 J-3.281 E.05265
G1 X200.825 Y156.962 E.14708
G3 X199.984 Y157.05 I-.953 J-5.089 E.02808
G1 X197.429 Y157.05 E.08474
G1 X169.45 Y129.071 E1.31256
G1 X169.45 Y126.929 E.07102
G1 X197.427 Y98.953 E1.31242
G3 X200.395 Y98.97 I1.339 J25.586 E.09854
G3 X200.825 Y99.038 I-.127 J2.215 E.01445
G1 X203.958 Y102.171 E.14699
G2 X203.341 Y100.715 I-4.056 J.863 E.05278
G1 X147.006 Y157.05 E2.64276
G1 X143.698 Y157.05 E.10975
G1 X140.229 Y153.581 E.16272
G3 X138.679 Y154.08 I-5.797 J-15.357 E.05402
; WIPE_START
G1 F24000
G1 X140.229 Y153.581 E-.61861
G1 X140.492 Y153.844 E-.14139
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I0 J-1.217 P1  F30000
G1 X121.574 Y153.851 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F15476.087
G3 X120.037 Y153.315 I4.623 J-15.75 E.05402
G1 X116.302 Y157.05 E.17519
G1 X112.994 Y157.05 E.10975
G1 X56.661 Y100.716 E2.64271
G2 X56.04 Y102.173 I5.677 J3.281 E.05265
G1 X59.175 Y99.038 E.14708
G3 X60.016 Y98.95 I.953 J5.089 E.02808
G1 X62.571 Y98.95 E.08474
G1 X90.55 Y126.929 E1.31256
G1 X90.55 Y129.071 E.07102
G1 X62.57 Y157.05 E1.31256
G3 X59.406 Y157.005 I-1.275 J-21.636 E.10508
G1 X59.162 Y156.95 E.00828
G1 X56.038 Y153.825 E.14659
G2 X56.666 Y155.278 I5.603 J-1.561 E.05268
G1 X90.55 Y121.395 E1.58955
G1 X90.55 Y119.254 E.07102
G1 X70.247 Y98.951 E.95245
G1 X66.938 Y98.95 E.10976
G1 X55.955 Y109.933 E.51523
G1 X55.955 Y107.687 E.07451
G1 X105.318 Y157.05 E2.3157
G1 X108.626 Y157.05 E.10975
G1 X114.913 Y150.763 E.29494
G2 X116.317 Y151.587 I9 J-13.728 E.05402
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.913 Y150.763 E-.6186
G1 X114.65 Y151.026 E-.1414
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/105
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
G3 Z4.2 I.39 J1.153 P1  F30000
G1 X169.102 Y132.602 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X159.357 Y132.603 E.32327
G2 X158.581 Y133.203 I.042 J.856 E.03465
G3 X102.419 Y133.203 I-28.081 J-7.332 E2.53271
G2 X101.643 Y132.603 I-.818 J.256 E.03466
G1 X90.898 Y132.602 E.35644
G1 X90.898 Y105.398 E.90241
G1 X107.535 Y105.398 E.55189
G2 X108.398 Y104.553 I.003 J-.859 E.0444
G1 X108.398 Y101.398 E.10466
G1 X116.102 Y101.398 E.25555
G1 X116.104 Y104.598 E.10617
G2 X116.897 Y105.396 I.852 J-.055 E.04074
G1 X144.035 Y105.398 E.90019
G2 X144.898 Y104.535 I.013 J-.85 E.04516
G1 X144.898 Y101.398 E.10407
G1 X152.602 Y101.398 E.25556
G1 X152.602 Y104.553 E.10466
G2 X153.465 Y105.398 I.859 J-.014 E.0444
G1 X169.102 Y105.398 E.51872
G1 X169.102 Y132.542 E.90042
G1 X168.71 Y132.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X159.343 Y132.211 E.28783
G2 X158.208 Y133.081 I.059 J1.252 E.04676
G3 X102.792 Y133.081 I-27.708 J-7.211 E2.31581
G2 X101.657 Y132.211 I-1.194 J.382 E.04676
G1 X91.29 Y132.21 E.31856
G1 X91.29 Y105.79 E.81181
G1 X107.545 Y105.79 E.49947
G2 X108.79 Y104.563 I-.01 J-1.255 E.05942
G1 X108.79 Y101.79 E.0852
G1 X115.71 Y101.79 E.21263
G1 X115.712 Y104.613 E.08674
G2 X116.879 Y105.788 I1.247 J-.072 E.05561
G1 X144.045 Y105.79 E.83474
G2 X145.29 Y104.545 I.003 J-1.242 E.06015
G1 X145.29 Y101.79 E.08465
G1 X152.21 Y101.79 E.21263
G1 X152.21 Y104.563 E.0852
G2 X153.455 Y105.79 I1.254 J-.027 E.05942
G1 X168.71 Y105.79 E.46874
G1 X168.71 Y132.15 E.80997
M204 S10000
; WIPE_START
G1 F24000
G1 X166.71 Y132.163 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.313 J-1.176 P1  F30000
G1 X55.624 Y102.569 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
G1 X200.122 Y98.605 E4.64785
G3 X204.398 Y103.007 I-.133 J4.407 E.22516
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.411 J-.006 E.22946
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I.006 J-4.411 E.22946
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.233 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X55.234 Y102.531 E.00004
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.132 Y98.213 E4.30577
G3 X204.79 Y103.003 I-.144 J4.8 E.22704
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.804 J-.012 E.23117
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.012 J-4.804 E.23117
G1 X55.21 Y103.003 E1.5362
G1 X55.23 Y102.591 E.01267
M204 S10000
; WIPE_START
G1 F24000
G1 X55.234 Y102.531 E-.02284
G1 X55.302 Y102.066 E-.1786
G1 X55.416 Y101.61 E-.17864
G1 X55.575 Y101.167 E-.17861
G1 X55.776 Y100.742 E-.17863
G1 X55.806 Y100.691 E-.02268
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.24 J1.193 P1  F30000
G1 X90.55 Y107.671 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X90.55 Y106.043 E.05401
G1 X55.952 Y140.641 E1.62306
G1 X55.952 Y138.388 E.07474
G1 X74.614 Y157.05 E.87548
G1 X77.922 Y157.05 E.10975
G1 X101.912 Y133.06 E1.1254
G3 X102.066 Y133.256 I-.287 J.383 E.00836
G2 X104.039 Y138.609 I38.796 J-11.264 E.1894
G1 X85.598 Y157.05 E.86509
G1 X82.29 Y157.05 E.10975
G1 X55.953 Y130.712 E1.23553
G1 X55.953 Y132.964 E.07468
G1 X89.965 Y98.951 E1.59561
G1 X93.275 Y98.951 E.10979
G1 X99.374 Y105.05 E.2861
M73 P49 R23
G1 X99.219 Y105.05 E.00515
G1 X105.317 Y98.951 E.28608
G1 X108.627 Y98.951 E.10982
G1 X110.726 Y101.05 E.09843
G1 X110.895 Y101.05 E.0056
G1 X112.993 Y98.952 E.09843
G1 X116.304 Y98.952 E.10983
G1 X122.399 Y105.047 E.28593
G1 X122.249 Y105.047 E.00495
G1 X128.344 Y98.952 E.28592
G1 X131.656 Y98.952 E.10985
G1 X137.749 Y105.045 E.28583
G1 X137.603 Y105.045 E.00483
G1 X143.696 Y98.952 E.28582
G1 X147.008 Y98.952 E.10987
G1 X149.105 Y101.05 E.09839
G1 X149.274 Y101.05 E.0056
G1 X151.372 Y98.952 E.09839
G1 X154.684 Y98.952 E.10989
G1 X160.781 Y105.05 E.28603
G1 X160.626 Y105.05 E.00514
G1 X166.723 Y98.953 E.28602
G1 X170.037 Y98.953 E.10991
G1 X204.044 Y132.96 E1.59537
G1 X204.044 Y130.716 E.07447
G1 X177.71 Y157.05 E1.23539
G1 X174.402 Y157.05 E.10975
G1 X156.626 Y139.274 E.8339
G2 X158.787 Y133.759 I-26.638 J-13.621 E.1968
G1 X182.078 Y157.05 E1.09261
G1 X185.386 Y157.05 E.10975
G1 X204.044 Y138.391 E.87529
G1 X204.044 Y140.636 E.07447
G1 X169.45 Y106.043 E1.62287
G1 X169.45 Y107.671 E.05401
; WIPE_START
G1 F24000
G1 X169.45 Y106.043 E-.61876
G1 X169.713 Y106.305 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.091 J-.539 P1  F30000
G1 X148.662 Y148.955 Z4.4
G1 Z4
G1 E.8 F1800
G1 F15476.087
G2 X149.913 Y147.913 I-49.188 J-60.314 E.05401
G1 X159.05 Y157.05 E.42861
G1 X162.358 Y157.05 E.10975
G1 X204.044 Y115.364 E1.95558
G1 X204.044 Y117.609 E.07447
G1 X185.389 Y98.953 E.87516
G1 X182.075 Y98.953 E.10993
G1 X169.45 Y111.578 E.59224
G1 X169.45 Y113.719 E.07102
G1 X204.044 Y148.312 E1.62287
G1 X204.044 Y146.067 E.07447
G1 X193.062 Y157.05 E.5152
G1 X189.754 Y157.05 E.10975
G1 X165.655 Y132.951 E1.13053
G1 X163.429 Y132.951 E.07383
G1 X156.074 Y140.306 E.34505
G3 X153.635 Y143.959 I-40.836 J-24.617 E.14574
G1 X166.726 Y157.05 E.6141
G1 X170.034 Y157.05 E.10975
G1 X204.044 Y123.04 E1.59549
G1 X204.044 Y125.285 E.07447
G1 X177.713 Y98.953 E1.23526
G1 X174.399 Y98.953 E.10992
G1 X168.302 Y105.05 E.28601
G1 X168.457 Y105.05 E.00514
G1 X162.36 Y98.953 E.28602
G1 X159.047 Y98.953 E.1099
G1 X153.101 Y104.899 E.27895
G2 X153.333 Y105.032 I.425 J-.471 E.00893
G2 X154.69 Y105.05 I.754 J-5.867 E.04511
; WIPE_START
G1 F24000
G1 X153.333 Y105.032 E-.51566
G1 X153.101 Y104.899 E-.10152
G1 X153.367 Y104.633 E-.14282
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.282 J-1.184 P1  F30000
G1 X144.547 Y102.534 Z4.4
G1 Z4
G1 E.8 F1800
G1 F15476.087
G1 X144.542 Y104.163 E.05401
G1 X139.332 Y98.952 E.24443
G1 X136.02 Y98.952 E.10986
G1 X129.926 Y105.046 E.28587
G1 X130.074 Y105.046 E.00489
G1 X123.98 Y98.952 E.28588
G1 X120.668 Y98.952 E.10984
G1 X116.451 Y103.169 E.19784
G1 X116.45 Y101.541 E.05401
; WIPE_START
G1 F24000
G1 X116.451 Y103.169 E-.61876
G1 X116.714 Y102.906 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.089 J-1.214 P1  F30000
G1 X108.047 Y102.274 Z4.4
G1 Z4
M73 P50 R23
G1 E.8 F1800
G1 F15476.087
G1 X108.042 Y103.902 E.05401
G1 X106.895 Y105.05 E.05385
G1 X107.05 Y105.05 E.00515
G1 X100.951 Y98.951 E.28609
G1 X97.641 Y98.951 E.10981
G1 X91.543 Y105.05 E.28609
G1 X91.698 Y105.05 E.00515
G1 X85.599 Y98.951 E.2861
G1 X82.289 Y98.951 E.10978
G1 X55.953 Y125.287 E1.23548
G1 X55.954 Y123.037 E.07463
G1 X89.966 Y157.05 E1.59559
G1 X93.274 Y157.05 E.10975
G1 X106.933 Y143.391 E.64077
G1 X106.727 Y143.107 E.01164
G1 X96.571 Y132.951 E.47643
G1 X94.345 Y132.951 E.07383
G1 X70.246 Y157.05 E1.13053
G1 X66.938 Y157.05 E.10975
G1 X55.951 Y146.063 E.51542
G1 X55.951 Y148.317 E.07479
G1 X90.55 Y113.719 E1.6231
G1 X90.55 Y111.578 E.07102
G1 X77.923 Y98.951 E.59235
G1 X74.614 Y98.951 E.10977
G1 X55.954 Y117.61 E.87535
G1 X55.954 Y115.362 E.07457
G1 X97.642 Y157.05 E1.95565
G1 X100.95 Y157.05 E.10975
G1 X110.566 Y147.434 E.4511
G2 X113.297 Y149.676 I20.829 J-22.576 E.11727
G1 X120.67 Y157.05 E.3459
G1 X123.978 Y157.05 E.10975
G1 X126.118 Y154.91 E.10039
G1 X126.221 Y154.925 E.00345
G1 X128.346 Y157.05 E.09967
G1 X131.654 Y157.05 E.10975
G1 X133.632 Y155.072 E.09279
G1 X134.007 Y155.034 E.01248
G1 X136.022 Y157.05 E.09454
G1 X139.33 Y157.05 E.10975
G1 X144.924 Y151.456 E.26241
G2 X145.464 Y151.14 I-2.909 J-5.603 E.02078
G1 X151.374 Y157.05 E.27722
G1 X154.682 Y157.05 E.10975
G1 X204.044 Y107.688 E2.31568
G1 X204.044 Y109.933 E.07447
G1 X193.065 Y98.953 E.51506
G1 X189.751 Y98.953 E.10994
G1 X169.45 Y119.254 E.95233
G1 X169.45 Y121.395 E.07102
G1 X203.339 Y155.284 E1.58981
G2 X203.96 Y153.827 I-5.677 J-3.281 E.05265
G1 X200.825 Y156.962 E.14708
G3 X199.984 Y157.05 I-.953 J-5.088 E.02808
G1 X197.429 Y157.05 E.08474
G1 X169.45 Y129.071 E1.31256
G1 X169.45 Y126.929 E.07102
G1 X197.426 Y98.953 E1.31241
G3 X200.395 Y98.97 I1.342 J25.255 E.09854
G3 X200.825 Y99.038 I-.127 J2.216 E.01446
G1 X203.958 Y102.171 E.14699
G2 X203.341 Y100.715 I-4.056 J.863 E.05278
G1 X147.006 Y157.05 E2.64276
G1 X143.698 Y157.05 E.10975
G1 X140.229 Y153.581 E.16272
G3 X138.679 Y154.08 I-5.797 J-15.357 E.05402
; WIPE_START
G1 F24000
G1 X140.229 Y153.581 E-.61861
G1 X140.492 Y153.844 E-.14139
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I0 J-1.217 P1  F30000
G1 X121.574 Y153.851 Z4.4
G1 Z4
G1 E.8 F1800
G1 F15476.087
G3 X120.037 Y153.315 I4.623 J-15.75 E.05402
G1 X116.302 Y157.05 E.17519
G1 X112.994 Y157.05 E.10975
G1 X56.661 Y100.716 E2.64271
G2 X56.04 Y102.173 I5.677 J3.281 E.05265
G1 X59.175 Y99.038 E.14708
G3 X60.016 Y98.95 I.953 J5.089 E.02808
G1 X62.571 Y98.95 E.08474
G1 X90.55 Y126.929 E1.31256
G1 X90.55 Y129.071 E.07102
G1 X62.57 Y157.05 E1.31256
G3 X59.406 Y157.005 I-1.275 J-21.636 E.10508
G1 X59.162 Y156.95 E.00828
G1 X56.038 Y153.825 E.14659
G2 X56.666 Y155.278 I5.603 J-1.561 E.05268
G1 X90.55 Y121.395 E1.58955
G1 X90.55 Y119.254 E.07102
G1 X70.247 Y98.951 E.95245
G1 X66.938 Y98.951 E.10976
G1 X55.955 Y109.933 E.51523
G1 X55.955 Y107.687 E.07451
G1 X105.318 Y157.05 E2.3157
G1 X108.626 Y157.05 E.10975
G1 X114.913 Y150.763 E.29494
G2 X116.317 Y151.587 I9 J-13.728 E.05402
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.913 Y150.763 E-.6186
G1 X114.65 Y151.026 E-.1414
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/105
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
G3 Z4.4 I.39 J1.153 P1  F30000
G1 X169.102 Y132.602 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X159.36 Y132.603 E.32317
G2 X158.581 Y133.204 I.038 J.856 E.03476
G3 X102.419 Y133.204 I-28.081 J-7.332 E2.5327
G2 X101.64 Y132.603 I-.818 J.255 E.03477
G1 X90.898 Y132.602 E.35634
G1 X90.898 Y105.398 E.90241
G1 X107.535 Y105.398 E.55189
G2 X108.398 Y104.557 I.003 J-.859 E.04427
G1 X108.398 Y101.398 E.10479
G1 X116.102 Y101.398 E.25555
G1 X116.104 Y104.598 E.10616
G2 X116.895 Y105.395 I.852 J-.054 E.04066
G1 X144.034 Y105.398 E.90026
G2 X144.898 Y104.535 I.013 J-.85 E.04516
G1 X144.898 Y101.398 E.10407
G1 X152.602 Y101.398 E.25556
G1 X152.602 Y104.557 E.10479
G2 X153.465 Y105.398 I.859 J-.018 E.04427
G1 X169.102 Y105.398 E.51872
G1 X169.102 Y132.542 E.90042
G1 X168.71 Y132.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X159.346 Y132.211 E.28774
G2 X158.208 Y133.082 I.056 J1.252 E.04687
G3 X102.792 Y133.082 I-27.708 J-7.211 E2.3158
G2 X101.654 Y132.211 I-1.194 J.382 E.04687
G1 X91.29 Y132.21 E.31846
G1 X91.29 Y105.79 E.81181
G1 X107.545 Y105.79 E.49947
G2 X108.79 Y104.567 I-.009 J-1.254 E.0593
G1 X108.79 Y101.79 E.08532
G1 X115.71 Y101.79 E.21263
G1 X115.712 Y104.613 E.08674
G2 X116.876 Y105.787 I1.247 J-.072 E.05555
G1 X144.045 Y105.79 E.83481
G2 X145.29 Y104.545 I.003 J-1.242 E.06015
G1 X145.29 Y101.79 E.08465
G1 X152.21 Y101.79 E.21263
G1 X152.21 Y104.567 E.08532
G2 X153.455 Y105.79 I1.254 J-.031 E.0593
G1 X168.71 Y105.79 E.46874
G1 X168.71 Y132.15 E.80997
M204 S10000
; WIPE_START
G1 F24000
G1 X166.71 Y132.163 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.313 J-1.176 P1  F30000
G1 X55.624 Y102.569 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
G1 X200.129 Y98.605 E4.64809
G3 X204.398 Y103.007 I-.14 J4.407 E.22493
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.402 J.004 E.2296
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I.006 J-4.411 E.22946
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.233 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X55.234 Y102.531 E.00004
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.139 Y98.213 E4.30599
G3 X204.79 Y103.003 I-.151 J4.8 E.22682
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.794 J-.001 E.23131
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.012 J-4.804 E.23117
G1 X55.21 Y103.003 E1.5362
G1 X55.23 Y102.591 E.01268
M204 S10000
; WIPE_START
G1 F24000
G1 X55.234 Y102.531 E-.02282
G1 X55.302 Y102.066 E-.1786
G1 X55.416 Y101.61 E-.17863
G1 X55.575 Y101.167 E-.17862
G1 X55.776 Y100.742 E-.17863
G1 X55.806 Y100.691 E-.0227
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.24 J1.193 P1  F30000
G1 X90.55 Y107.671 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X90.55 Y106.043 E.05401
G1 X55.952 Y140.641 E1.62306
G1 X55.952 Y138.388 E.07474
G1 X74.614 Y157.05 E.87548
G1 X77.922 Y157.05 E.10975
G1 X101.912 Y133.06 E1.12541
G3 X102.066 Y133.258 I-.29 J.384 E.0084
G2 X104.039 Y138.609 I38.781 J-11.259 E.18936
G1 X85.598 Y157.05 E.86509
G1 X82.29 Y157.05 E.10975
G1 X55.953 Y130.712 E1.23553
G1 X55.953 Y132.964 E.07468
G1 X89.965 Y98.951 E1.59561
G1 X93.275 Y98.951 E.1098
G1 X99.374 Y105.05 E.28609
G1 X99.219 Y105.05 E.00515
G1 X105.317 Y98.951 E.28608
G1 X108.627 Y98.952 E.10982
G1 X110.726 Y101.05 E.09843
G1 X110.895 Y101.05 E.0056
G1 X112.993 Y98.952 E.09842
G1 X116.304 Y98.952 E.10983
G1 X122.398 Y105.047 E.28592
G1 X122.25 Y105.047 E.00494
G1 X128.344 Y98.952 E.28591
G1 X131.656 Y98.952 E.10986
G1 X137.749 Y105.045 E.28582
G1 X137.603 Y105.045 E.00482
G1 X143.696 Y98.952 E.28581
G1 X147.008 Y98.952 E.10988
G1 X149.105 Y101.05 E.09839
G1 X149.274 Y101.05 E.0056
G1 X151.372 Y98.953 E.09838
G1 X154.684 Y98.953 E.10989
G1 X160.781 Y105.05 E.28602
G1 X160.626 Y105.05 E.00514
G1 X166.723 Y98.953 E.28601
G1 X170.037 Y98.953 E.10992
G1 X204.044 Y132.96 E1.59536
G1 X204.044 Y130.716 E.07447
G1 X177.71 Y157.05 E1.23539
G1 X174.402 Y157.05 E.10975
G1 X156.626 Y139.274 E.8339
G2 X158.787 Y133.759 I-26.633 J-13.619 E.1968
G1 X182.078 Y157.05 E1.09261
G1 X185.386 Y157.05 E.10975
G1 X204.044 Y138.391 E.87529
G1 X204.044 Y140.636 E.07447
G1 X169.45 Y106.043 E1.62287
G1 X169.45 Y107.671 E.05401
; WIPE_START
G1 F24000
G1 X169.45 Y106.043 E-.61876
G1 X169.713 Y106.305 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.091 J-.539 P1  F30000
G1 X148.662 Y148.955 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F15476.087
G2 X149.913 Y147.913 I-49.188 J-60.314 E.05401
G1 X159.05 Y157.05 E.42861
G1 X162.358 Y157.05 E.10975
G1 X204.044 Y115.364 E1.95558
G1 X204.044 Y117.609 E.07447
G1 X185.389 Y98.953 E.87515
G1 X182.075 Y98.953 E.10994
G1 X169.45 Y111.578 E.59223
G1 X169.45 Y113.719 E.07102
G1 X204.044 Y148.312 E1.62287
G1 X204.044 Y146.067 E.07447
G1 X193.062 Y157.05 E.5152
G1 X189.754 Y157.05 E.10975
G1 X165.655 Y132.951 E1.13053
G1 X163.429 Y132.951 E.07383
G1 X156.074 Y140.306 E.34505
G3 X153.635 Y143.959 I-40.836 J-24.617 E.14574
G1 X166.726 Y157.05 E.6141
G1 X170.034 Y157.05 E.10975
G1 X204.044 Y123.04 E1.59549
G1 X204.044 Y125.285 E.07447
G1 X177.713 Y98.953 E1.23526
G1 X174.399 Y98.953 E.10993
G1 X168.302 Y105.05 E.286
G1 X168.457 Y105.05 E.00514
G1 X162.361 Y98.953 E.28602
G1 X159.047 Y98.953 E.10991
G1 X153.101 Y104.899 E.27893
G2 X153.334 Y105.032 I.411 J-.446 E.00897
G2 X154.69 Y105.05 I.753 J-5.897 E.04508
; WIPE_START
G1 F24000
G1 X153.334 Y105.032 E-.51526
G1 X153.101 Y104.899 E-.10185
G1 X153.367 Y104.633 E-.14288
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.282 J-1.184 P1  F30000
G1 X144.547 Y102.534 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F15476.087
G1 X144.542 Y104.163 E.05401
G1 X139.332 Y98.952 E.24443
G1 X136.02 Y98.952 E.10987
G1 X129.926 Y105.046 E.28586
G1 X130.074 Y105.046 E.00488
G1 X123.98 Y98.952 E.28587
G1 X120.668 Y98.952 E.10985
G1 X116.451 Y103.169 E.19784
G1 X116.45 Y101.541 E.05401
; WIPE_START
G1 F24000
G1 X116.451 Y103.169 E-.61876
G1 X116.714 Y102.906 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.089 J-1.214 P1  F30000
G1 X108.047 Y102.274 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F15476.087
G1 X108.042 Y103.902 E.05401
G1 X106.895 Y105.05 E.05385
G1 X107.05 Y105.05 E.00515
G1 X100.951 Y98.951 E.28609
G1 X97.641 Y98.951 E.10981
G1 X91.543 Y105.05 E.28609
G1 X91.698 Y105.05 E.00515
G1 X85.599 Y98.951 E.2861
G1 X82.289 Y98.951 E.10978
G1 X55.953 Y125.287 E1.23548
G1 X55.954 Y123.037 E.07463
G1 X89.966 Y157.05 E1.59559
G1 X93.274 Y157.05 E.10975
G1 X106.933 Y143.391 E.64077
G1 X106.727 Y143.107 E.01164
G1 X96.571 Y132.951 E.47643
G1 X94.345 Y132.951 E.07383
G1 X70.246 Y157.05 E1.13053
G1 X66.938 Y157.05 E.10975
G1 X55.951 Y146.063 E.51542
G1 X55.951 Y148.317 E.07479
G1 X90.55 Y113.719 E1.6231
G1 X90.55 Y111.578 E.07102
G1 X77.923 Y98.951 E.59235
G1 X74.614 Y98.951 E.10977
G1 X55.954 Y117.61 E.87535
G1 X55.954 Y115.362 E.07457
G1 X97.642 Y157.05 E1.95565
G1 X100.95 Y157.05 E.10975
G1 X110.566 Y147.434 E.4511
G2 X113.297 Y149.676 I20.829 J-22.576 E.11727
G1 X120.67 Y157.05 E.3459
G1 X123.978 Y157.05 E.10975
G1 X126.118 Y154.91 E.10039
G1 X126.221 Y154.925 E.00345
G1 X128.346 Y157.05 E.09967
G1 X131.654 Y157.05 E.10975
G1 X133.632 Y155.072 E.09279
G1 X134.007 Y155.034 E.01248
G1 X136.022 Y157.05 E.09454
G1 X139.33 Y157.05 E.10975
G1 X144.924 Y151.456 E.26241
G2 X145.464 Y151.14 I-2.909 J-5.603 E.02078
G1 X151.374 Y157.05 E.27722
G1 X154.682 Y157.05 E.10975
G1 X204.044 Y107.688 E2.31568
G1 X204.044 Y109.933 E.07447
G1 X193.065 Y98.954 E.51505
G1 X189.75 Y98.953 E.10995
G1 X169.45 Y119.254 E.95232
G1 X169.45 Y121.395 E.07102
G1 X203.339 Y155.284 E1.58981
G2 X203.96 Y153.827 I-5.677 J-3.281 E.05265
G1 X200.825 Y156.962 E.14708
G3 X199.984 Y157.05 I-.953 J-5.089 E.02808
G1 X197.429 Y157.05 E.08474
G1 X169.45 Y129.071 E1.31256
G1 X169.45 Y126.929 E.07102
G1 X197.426 Y98.954 E1.31241
G3 X200.395 Y98.97 I1.346 J24.92 E.09854
G3 X200.825 Y99.038 I-.127 J2.217 E.01446
G1 X203.958 Y102.171 E.14699
G2 X203.341 Y100.715 I-4.056 J.863 E.05278
G1 X147.006 Y157.05 E2.64276
G1 X143.698 Y157.05 E.10975
G1 X140.229 Y153.581 E.16272
G3 X138.679 Y154.08 I-5.797 J-15.357 E.05402
; WIPE_START
G1 F24000
G1 X140.229 Y153.581 E-.61861
G1 X140.492 Y153.844 E-.14139
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I0 J-1.217 P1  F30000
G1 X121.574 Y153.851 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F15476.087
G3 X120.037 Y153.315 I4.623 J-15.75 E.05402
G1 X116.302 Y157.05 E.17519
G1 X112.994 Y157.05 E.10975
G1 X56.661 Y100.716 E2.64271
G2 X56.04 Y102.173 I5.676 J3.281 E.05265
G1 X59.175 Y99.038 E.14708
G3 X60.016 Y98.95 I.953 J5.089 E.02808
G1 X62.571 Y98.95 E.08474
G1 X90.55 Y126.929 E1.31256
G1 X90.55 Y129.071 E.07102
G1 X62.57 Y157.05 E1.31256
G3 X59.406 Y157.005 I-1.275 J-21.635 E.10508
G1 X59.162 Y156.95 E.00828
G1 X56.038 Y153.825 E.1466
G2 X56.666 Y155.278 I5.603 J-1.561 E.05268
G1 X90.55 Y121.395 E1.58955
G1 X90.55 Y119.254 E.07102
G1 X70.247 Y98.951 E.95245
G1 X66.938 Y98.951 E.10976
G1 X55.955 Y109.933 E.51523
G1 X55.955 Y107.687 E.07451
G1 X105.318 Y157.05 E2.3157
G1 X108.626 Y157.05 E.10975
G1 X114.913 Y150.763 E.29494
G2 X116.317 Y151.587 I9.001 J-13.728 E.05402
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.913 Y150.763 E-.6186
G1 X114.65 Y151.026 E-.1414
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/105
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
G3 Z4.6 I.39 J1.153 P1  F30000
G1 X169.102 Y132.602 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X159.363 Y132.603 E.32306
G2 X158.58 Y133.204 I.031 J.85 E.03491
G3 X102.42 Y133.204 I-28.08 J-7.334 E2.53262
G2 X101.637 Y132.603 I-.813 J.249 E.03491
G1 X90.898 Y132.602 E.35624
G1 X90.898 Y105.398 E.90241
G1 X107.535 Y105.398 E.55189
G2 X108.397 Y104.561 I.003 J-.859 E.04415
G1 X108.398 Y101.398 E.10492
G1 X116.102 Y101.398 E.25554
G1 X116.104 Y104.598 E.10616
G2 X116.959 Y105.398 I.849 J-.05 E.04285
G1 X144.034 Y105.398 E.89813
G2 X144.898 Y104.535 I.013 J-.851 E.04516
G1 X144.898 Y101.398 E.10407
G1 X152.602 Y101.398 E.25556
M73 P51 R23
G1 X152.603 Y104.561 E.10492
G2 X153.465 Y105.398 I.859 J-.022 E.04415
G1 X169.102 Y105.398 E.51872
G1 X169.102 Y132.542 E.90042
G1 X168.71 Y132.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X159.349 Y132.211 E.28764
G2 X158.208 Y133.082 I.045 J1.243 E.04702
G3 X102.792 Y133.082 I-27.708 J-7.212 E2.31576
G2 X101.651 Y132.211 I-1.187 J.372 E.04702
G1 X91.29 Y132.21 E.31837
G1 X91.29 Y105.79 E.81181
G1 X107.545 Y105.79 E.49947
G2 X108.79 Y104.571 I-.009 J-1.254 E.05918
G1 X108.79 Y101.79 E.08544
G1 X115.71 Y101.79 E.21263
G1 X115.712 Y104.613 E.08673
G2 X116.953 Y105.79 I1.241 J-.065 E.05799
G1 X144.045 Y105.79 E.83244
G2 X145.29 Y104.545 I.003 J-1.242 E.06015
G1 X145.29 Y101.79 E.08465
G1 X152.21 Y101.79 E.21263
G1 X152.21 Y104.571 E.08544
G2 X153.455 Y105.79 I1.254 J-.035 E.05919
G1 X168.71 Y105.79 E.46874
G1 X168.71 Y132.15 E.80997
M204 S10000
; WIPE_START
G1 F24000
G1 X166.71 Y132.163 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.313 J-1.176 P1  F30000
G1 X55.624 Y102.569 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
G1 X200.136 Y98.606 E4.64832
G3 X204.398 Y103.007 I-.147 J4.407 E.2247
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.411 J-.006 E.22946
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I.006 J-4.411 E.22946
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.234 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.146 Y98.214 E4.3062
G3 X204.79 Y103.003 I-.158 J4.8 E.22661
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.804 J-.012 E.23117
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.012 J-4.804 E.23117
G1 X55.21 Y103.003 E1.5362
G3 X55.229 Y102.59 I4.804 J.012 E.01268
M204 S10000
; WIPE_START
G1 F24000
G1 X55.302 Y102.066 E-.20136
G1 X55.416 Y101.61 E-.17863
G1 X55.575 Y101.167 E-.17862
G1 X55.776 Y100.742 E-.17862
G1 X55.806 Y100.691 E-.02277
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.24 J1.193 P1  F30000
G1 X90.55 Y107.671 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X90.55 Y106.043 E.05401
G1 X55.952 Y140.641 E1.62306
G1 X55.952 Y138.388 E.07474
G1 X74.614 Y157.05 E.87548
G1 X77.922 Y157.05 E.10975
G1 X101.912 Y133.06 E1.12541
G3 X102.066 Y133.258 I-.288 J.382 E.00841
G2 X104.039 Y138.609 I38.765 J-11.253 E.18935
G1 X85.598 Y157.05 E.86509
G1 X82.29 Y157.05 E.10975
G1 X55.953 Y130.712 E1.23553
G1 X55.953 Y132.964 E.07468
G1 X89.965 Y98.951 E1.5956
G1 X93.275 Y98.951 E.1098
G1 X99.374 Y105.05 E.28609
G1 X99.219 Y105.05 E.00515
G1 X105.317 Y98.951 E.28608
G1 X108.628 Y98.952 E.10982
G1 X110.726 Y101.05 E.09843
G1 X110.895 Y101.05 E.0056
G1 X112.993 Y98.952 E.09842
G1 X116.304 Y98.952 E.10984
G1 X122.399 Y105.047 E.28595
G1 X122.249 Y105.047 E.00498
G1 X128.344 Y98.952 E.28593
G1 X131.656 Y98.952 E.10986
G1 X137.749 Y105.045 E.28582
G1 X137.603 Y105.045 E.00483
G1 X143.696 Y98.952 E.28581
G1 X147.008 Y98.953 E.10989
G1 X149.105 Y101.05 E.09838
G1 X149.274 Y101.05 E.0056
G1 X151.371 Y98.953 E.09838
G1 X154.684 Y98.953 E.1099
G1 X160.781 Y105.05 E.28602
G1 X160.626 Y105.05 E.00514
G1 X166.723 Y98.953 E.28601
G1 X170.037 Y98.953 E.10993
G1 X204.044 Y132.96 E1.59536
G1 X204.044 Y130.716 E.07447
G1 X177.71 Y157.05 E1.23539
G1 X174.402 Y157.05 E.10975
G1 X156.626 Y139.274 E.8339
G2 X158.787 Y133.759 I-26.629 J-13.617 E.1968
G1 X182.078 Y157.05 E1.09261
G1 X185.386 Y157.05 E.10975
G1 X204.044 Y138.391 E.87529
G1 X204.044 Y140.636 E.07447
G1 X169.45 Y106.043 E1.62287
G1 X169.45 Y107.671 E.05401
; WIPE_START
G1 F24000
G1 X169.45 Y106.043 E-.61876
G1 X169.713 Y106.305 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.091 J-.539 P1  F30000
G1 X148.662 Y148.955 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F15476.087
G2 X149.913 Y147.913 I-49.188 J-60.314 E.05401
G1 X159.05 Y157.05 E.42861
G1 X162.358 Y157.05 E.10975
G1 X204.044 Y115.364 E1.95558
G1 X204.044 Y117.609 E.07447
G1 X185.389 Y98.953 E.87515
G1 X182.075 Y98.953 E.10995
G1 X169.45 Y111.578 E.59222
G1 X169.45 Y113.719 E.07102
G1 X204.044 Y148.312 E1.62287
G1 X204.044 Y146.067 E.07447
G1 X193.062 Y157.05 E.5152
G1 X189.754 Y157.05 E.10975
G1 X165.655 Y132.951 E1.13053
G1 X163.429 Y132.951 E.07383
G1 X156.074 Y140.306 E.34505
G3 X153.635 Y143.959 I-40.836 J-24.617 E.14574
G1 X166.726 Y157.05 E.6141
G1 X170.034 Y157.05 E.10975
G1 X204.044 Y123.04 E1.59549
G1 X204.044 Y125.285 E.07447
G1 X177.713 Y98.953 E1.23525
G1 X174.399 Y98.953 E.10994
G1 X168.302 Y105.05 E.286
G1 X168.457 Y105.05 E.00514
G1 X162.361 Y98.953 E.28601
G1 X159.047 Y98.953 E.10991
G1 X153.102 Y104.898 E.27891
G2 X153.335 Y105.033 I.399 J-.423 E.009
G2 X154.69 Y105.05 I.752 J-5.928 E.04504
; WIPE_START
G1 F24000
G1 X153.335 Y105.033 E-.51486
G1 X153.102 Y104.898 E-.10218
G1 X153.368 Y104.632 E-.14295
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.282 J-1.184 P1  F30000
G1 X144.547 Y102.534 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F15476.087
G1 X144.542 Y104.163 E.05401
G1 X139.332 Y98.952 E.24442
G1 X136.02 Y98.952 E.10988
G1 X129.926 Y105.046 E.28587
G1 X130.074 Y105.046 E.0049
G1 X123.98 Y98.952 E.28589
G1 X120.668 Y98.952 E.10985
G1 X116.451 Y103.169 E.19784
G1 X116.45 Y101.541 E.05401
; WIPE_START
G1 F24000
G1 X116.451 Y103.169 E-.61876
G1 X116.714 Y102.906 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.089 J-1.214 P1  F30000
G1 X108.047 Y102.274 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F15476.087
G1 X108.042 Y103.902 E.05401
G1 X106.895 Y105.05 E.05384
G1 X107.05 Y105.05 E.00515
G1 X100.951 Y98.951 E.28608
G1 X97.641 Y98.951 E.10981
G1 X91.543 Y105.05 E.28609
G1 X91.698 Y105.05 E.00515
G1 X85.599 Y98.951 E.2861
G1 X82.289 Y98.951 E.10979
G1 X55.953 Y125.287 E1.23548
G1 X55.954 Y123.037 E.07463
G1 X89.966 Y157.05 E1.59559
G1 X93.274 Y157.05 E.10975
G1 X106.933 Y143.391 E.64077
G1 X106.727 Y143.107 E.01164
G1 X96.571 Y132.951 E.47644
G1 X94.346 Y132.951 E.07382
G1 X70.246 Y157.05 E1.13054
G1 X66.938 Y157.05 E.10975
G1 X55.951 Y146.063 E.51542
G1 X55.951 Y148.317 E.07479
G1 X90.55 Y113.719 E1.6231
G1 X90.55 Y111.578 E.07102
G1 X77.923 Y98.951 E.59235
G1 X74.614 Y98.951 E.10977
G1 X55.954 Y117.61 E.87535
G1 X55.954 Y115.362 E.07457
G1 X97.642 Y157.05 E1.95565
G1 X100.95 Y157.05 E.10975
G1 X110.566 Y147.434 E.4511
G2 X113.297 Y149.676 I20.829 J-22.576 E.11727
G1 X120.67 Y157.05 E.3459
G1 X123.978 Y157.05 E.10975
G1 X126.118 Y154.91 E.10039
G1 X126.221 Y154.925 E.00345
G1 X128.346 Y157.05 E.09967
G1 X131.654 Y157.05 E.10975
G1 X133.632 Y155.072 E.09279
G1 X134.007 Y155.034 E.01248
G1 X136.022 Y157.05 E.09454
G1 X139.33 Y157.05 E.10975
G1 X144.924 Y151.456 E.26241
G2 X145.464 Y151.14 I-2.909 J-5.603 E.02078
G1 X151.374 Y157.05 E.27722
G1 X154.682 Y157.05 E.10975
G1 X204.044 Y107.688 E2.31568
G1 X204.044 Y109.933 E.07447
G1 X193.065 Y98.954 E.51504
G1 X189.75 Y98.954 E.10996
G1 X169.45 Y119.254 E.95231
G1 X169.45 Y121.395 E.07102
G1 X203.339 Y155.284 E1.58981
G2 X203.96 Y153.827 I-5.677 J-3.281 E.05265
G1 X200.825 Y156.962 E.14708
G3 X199.984 Y157.05 I-.953 J-5.089 E.02808
G1 X197.429 Y157.05 E.08474
G1 X169.45 Y129.071 E1.31256
G1 X169.45 Y126.929 E.07102
G1 X197.426 Y98.954 E1.3124
G3 X200.395 Y98.97 I1.349 J24.577 E.09854
G3 X200.825 Y99.038 I-.127 J2.217 E.01447
G1 X203.958 Y102.171 E.14699
G2 X203.341 Y100.715 I-4.056 J.863 E.05278
G1 X147.006 Y157.05 E2.64276
G1 X143.698 Y157.05 E.10975
G1 X140.229 Y153.581 E.16272
G3 X138.679 Y154.08 I-5.797 J-15.357 E.05402
; WIPE_START
G1 F24000
G1 X140.229 Y153.581 E-.61861
G1 X140.492 Y153.844 E-.14139
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I0 J-1.217 P1  F30000
G1 X121.574 Y153.851 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F15476.087
G3 X120.037 Y153.315 I4.623 J-15.75 E.05402
G1 X116.302 Y157.05 E.17519
G1 X112.994 Y157.05 E.10975
G1 X56.661 Y100.716 E2.64271
G2 X56.04 Y102.173 I5.677 J3.281 E.05265
G1 X59.175 Y99.038 E.14708
G3 X60.016 Y98.95 I.953 J5.089 E.02808
G1 X62.571 Y98.95 E.08474
G1 X90.55 Y126.929 E1.31256
G1 X90.55 Y129.071 E.07102
G1 X62.57 Y157.05 E1.31256
G3 X59.406 Y157.005 I-1.275 J-21.636 E.10508
G1 X59.162 Y156.95 E.00828
G1 X56.038 Y153.825 E.14659
G2 X56.666 Y155.278 I5.603 J-1.561 E.05268
G1 X90.55 Y121.395 E1.58955
G1 X90.55 Y119.254 E.07102
G1 X70.247 Y98.951 E.95245
G1 X66.938 Y98.951 E.10976
G1 X55.955 Y109.933 E.51523
G1 X55.955 Y107.687 E.07451
G1 X105.318 Y157.05 E2.3157
G1 X108.626 Y157.05 E.10975
G1 X114.913 Y150.763 E.29494
G2 X116.317 Y151.587 I9 J-13.728 E.05402
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.913 Y150.763 E-.6186
G1 X114.65 Y151.026 E-.1414
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/105
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
G3 Z4.8 I.39 J1.153 P1  F30000
G1 X169.102 Y132.602 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X159.366 Y132.603 E.32296
G2 X158.58 Y133.204 I.027 J.849 E.03502
G3 X102.42 Y133.204 I-28.08 J-7.333 E2.53265
G2 X101.634 Y132.603 I-.813 J.248 E.03502
G1 X90.898 Y132.602 E.35614
G1 X90.898 Y105.398 E.90241
G1 X107.535 Y105.398 E.55189
G2 X108.397 Y104.565 I.004 J-.859 E.04402
G1 X108.398 Y101.398 E.10505
G1 X116.102 Y101.398 E.25554
G1 X116.104 Y104.598 E.10616
G2 X116.959 Y105.398 I.849 J-.05 E.04286
G1 X144.034 Y105.398 E.89812
G2 X144.898 Y104.535 I.013 J-.851 E.04516
G1 X144.898 Y101.398 E.10407
G1 X152.602 Y101.398 E.25556
G1 X152.603 Y104.565 E.10505
G2 X153.465 Y105.398 I.858 J-.026 E.04402
G1 X169.102 Y105.398 E.51872
G1 X169.102 Y132.542 E.90042
G1 X168.71 Y132.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X159.352 Y132.211 E.28755
G2 X158.208 Y133.082 I.042 J1.242 E.04713
G3 X102.792 Y133.082 I-27.708 J-7.211 E2.31578
G2 X101.648 Y132.211 I-1.186 J.371 E.04713
G1 X91.29 Y132.21 E.31827
G1 X91.29 Y105.79 E.81181
G1 X107.545 Y105.79 E.49947
G2 X108.789 Y104.575 I-.009 J-1.254 E.05907
G1 X108.79 Y101.79 E.08556
G1 X115.71 Y101.79 E.21263
G1 X115.712 Y104.613 E.08673
G2 X116.953 Y105.79 I1.241 J-.065 E.05799
G1 X144.044 Y105.79 E.83244
G2 X145.29 Y104.545 I.003 J-1.243 E.06014
G1 X145.29 Y101.79 E.08465
G1 X152.21 Y101.79 E.21263
G1 X152.211 Y104.575 E.08556
G2 X153.455 Y105.79 I1.254 J-.039 E.05907
G1 X168.71 Y105.79 E.46874
G1 X168.71 Y132.15 E.80997
M204 S10000
; WIPE_START
G1 F24000
M73 P51 R22
G1 X166.71 Y132.163 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.313 J-1.176 P1  F30000
G1 X55.624 Y102.569 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
G1 X200.143 Y98.606 E4.64855
G3 X204.398 Y103.007 I-.154 J4.407 E.22447
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.402 J.004 E.2296
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I.006 J-4.411 E.22946
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.234 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.153 Y98.214 E4.30642
G3 X204.79 Y103.003 I-.165 J4.8 E.22639
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.794 J-.001 E.23131
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.001 J-4.794 E.2313
G1 X55.21 Y103.003 E1.5362
G3 X55.229 Y102.59 I4.804 J.012 E.01268
M204 S10000
; WIPE_START
G1 F24000
G1 X55.302 Y102.066 E-.20136
G1 X55.416 Y101.61 E-.17864
G1 X55.575 Y101.167 E-.17861
G1 X55.776 Y100.742 E-.17863
G1 X55.806 Y100.691 E-.02276
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.24 J1.193 P1  F30000
G1 X90.55 Y107.671 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X90.55 Y106.043 E.05401
G1 X55.952 Y140.641 E1.62306
G1 X55.952 Y138.388 E.07474
G1 X74.614 Y157.05 E.87548
G1 X77.922 Y157.05 E.10975
G1 X101.913 Y133.06 E1.12542
G3 X102.066 Y133.259 I-.29 J.384 E.00845
G2 X104.039 Y138.609 I38.751 J-11.248 E.18932
G1 X85.598 Y157.05 E.86509
G1 X82.29 Y157.05 E.10975
G1 X55.953 Y130.712 E1.23553
G1 X55.953 Y132.964 E.07468
G1 X89.965 Y98.951 E1.5956
G1 X93.275 Y98.951 E.1098
G1 X99.374 Y105.05 E.28609
G1 X99.219 Y105.05 E.00515
G1 X105.317 Y98.952 E.28608
G1 X108.628 Y98.952 E.10983
G1 X110.726 Y101.05 E.09842
G1 X110.895 Y101.05 E.0056
G1 X112.992 Y98.952 E.09842
G1 X116.304 Y98.952 E.10984
G1 X122.399 Y105.047 E.28594
G1 X122.249 Y105.047 E.00497
G1 X128.344 Y98.952 E.28592
G1 X131.656 Y98.952 E.10987
G1 X137.749 Y105.045 E.28582
G1 X137.603 Y105.045 E.00483
M73 P52 R22
G1 X143.696 Y98.953 E.2858
G1 X147.008 Y98.953 E.1099
G1 X149.105 Y101.05 E.09838
G1 X149.274 Y101.05 E.0056
G1 X151.371 Y98.953 E.09837
G1 X154.685 Y98.953 E.10991
G1 X160.781 Y105.05 E.28601
G1 X160.626 Y105.05 E.00514
G1 X166.723 Y98.953 E.286
G1 X170.037 Y98.953 E.10994
G1 X204.044 Y132.96 E1.59535
G1 X204.044 Y130.716 E.07447
G1 X177.71 Y157.05 E1.23539
G1 X174.402 Y157.05 E.10975
G1 X156.626 Y139.274 E.8339
G2 X158.787 Y133.759 I-26.624 J-13.615 E.1968
G1 X182.078 Y157.05 E1.09261
G1 X185.386 Y157.05 E.10975
G1 X204.044 Y138.391 E.87529
G1 X204.044 Y140.636 E.07447
G1 X169.45 Y106.043 E1.62287
G1 X169.45 Y107.671 E.05401
; WIPE_START
G1 F24000
G1 X169.45 Y106.043 E-.61876
G1 X169.713 Y106.305 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.091 J-.539 P1  F30000
G1 X148.662 Y148.955 Z5
G1 Z4.6
G1 E.8 F1800
G1 F15476.087
G2 X149.913 Y147.913 I-49.188 J-60.314 E.05401
G1 X159.05 Y157.05 E.42861
G1 X162.358 Y157.05 E.10975
G1 X204.044 Y115.364 E1.95558
G1 X204.044 Y117.609 E.07447
G1 X185.389 Y98.954 E.87514
G1 X182.074 Y98.954 E.10996
G1 X169.45 Y111.578 E.59222
G1 X169.45 Y113.719 E.07102
G1 X204.044 Y148.312 E1.62287
G1 X204.044 Y146.067 E.07447
G1 X193.062 Y157.05 E.5152
G1 X189.754 Y157.05 E.10975
G1 X165.654 Y132.951 E1.13054
G1 X163.429 Y132.951 E.07382
G1 X156.074 Y140.306 E.34506
G3 X153.635 Y143.959 I-40.836 J-24.617 E.14574
G1 X166.726 Y157.05 E.6141
G1 X170.034 Y157.05 E.10975
G1 X204.044 Y123.04 E1.59548
G1 X204.044 Y125.285 E.07447
G1 X177.713 Y98.953 E1.23524
G1 X174.399 Y98.953 E.10995
G1 X168.302 Y105.05 E.28599
G1 X168.457 Y105.05 E.00514
G1 X162.361 Y98.953 E.286
G1 X159.047 Y98.953 E.10992
G1 X153.099 Y104.901 E.27904
G2 X153.336 Y105.033 I.47 J-.565 E.00904
G2 X154.689 Y105.05 I.751 J-5.957 E.04501
; WIPE_START
G1 F24000
G1 X153.336 Y105.033 E-.51449
G1 X153.099 Y104.901 E-.10294
G1 X153.364 Y104.636 E-.14257
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.282 J-1.184 P1  F30000
G1 X144.547 Y102.534 Z5
G1 Z4.6
G1 E.8 F1800
G1 F15476.087
G1 X144.542 Y104.163 E.05401
G1 X139.332 Y98.952 E.24442
G1 X136.02 Y98.952 E.10988
G1 X129.926 Y105.046 E.28586
G1 X130.074 Y105.046 E.0049
G1 X123.98 Y98.952 E.28588
G1 X120.668 Y98.952 E.10986
G1 X116.451 Y103.169 E.19783
G1 X116.45 Y101.541 E.05401
; WIPE_START
G1 F24000
G1 X116.451 Y103.169 E-.61876
G1 X116.714 Y102.906 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.089 J-1.214 P1  F30000
G1 X108.047 Y102.274 Z5
G1 Z4.6
G1 E.8 F1800
G1 F15476.087
G1 X108.042 Y103.902 E.05401
G1 X106.895 Y105.05 E.05384
G1 X107.05 Y105.05 E.00515
G1 X100.951 Y98.951 E.28608
G1 X97.641 Y98.951 E.10982
G1 X91.543 Y105.05 E.28608
G1 X91.698 Y105.05 E.00515
G1 X85.599 Y98.951 E.2861
G1 X82.289 Y98.951 E.10979
G1 X55.953 Y125.287 E1.23548
G1 X55.954 Y123.037 E.07463
G1 X89.966 Y157.05 E1.59559
G1 X93.274 Y157.05 E.10975
G1 X106.933 Y143.391 E.64077
G1 X106.727 Y143.107 E.01164
G1 X96.571 Y132.951 E.47644
G1 X94.346 Y132.951 E.07382
G1 X70.246 Y157.05 E1.13054
G1 X66.938 Y157.05 E.10975
G1 X55.951 Y146.063 E.51542
G1 X55.951 Y148.317 E.07479
G1 X90.55 Y113.719 E1.6231
G1 X90.55 Y111.578 E.07102
G1 X77.923 Y98.951 E.59235
G1 X74.614 Y98.951 E.10977
G1 X55.954 Y117.61 E.87535
G1 X55.954 Y115.362 E.07457
G1 X97.642 Y157.05 E1.95565
G1 X100.95 Y157.05 E.10975
G1 X110.566 Y147.434 E.4511
G2 X113.297 Y149.676 I20.829 J-22.576 E.11727
G1 X120.67 Y157.05 E.3459
G1 X123.978 Y157.05 E.10975
G1 X126.118 Y154.91 E.10039
G1 X126.221 Y154.925 E.00345
G1 X128.346 Y157.05 E.09967
G1 X131.654 Y157.05 E.10975
G1 X133.632 Y155.072 E.09279
G1 X134.007 Y155.034 E.01248
G1 X136.022 Y157.05 E.09454
G1 X139.33 Y157.05 E.10975
G1 X144.924 Y151.456 E.26241
G2 X145.464 Y151.14 I-2.909 J-5.603 E.02078
G1 X151.374 Y157.05 E.27722
G1 X154.682 Y157.05 E.10975
G1 X204.044 Y107.688 E2.31568
G1 X204.044 Y109.933 E.07447
G1 X193.065 Y98.954 E.51503
G1 X189.75 Y98.954 E.10998
G1 X169.45 Y119.254 E.9523
G1 X169.45 Y121.395 E.07102
G1 X203.339 Y155.284 E1.58981
G2 X203.96 Y153.827 I-5.677 J-3.281 E.05265
G1 X200.825 Y156.962 E.14708
G3 X199.984 Y157.05 I-.953 J-5.089 E.02808
G1 X197.429 Y157.05 E.08474
G1 X169.45 Y129.071 E1.31256
G1 X169.45 Y126.929 E.07102
G1 X197.426 Y98.954 E1.31239
G3 X200.395 Y98.97 I1.353 J24.229 E.09855
G3 X200.825 Y99.038 I-.127 J2.218 E.01447
G1 X203.958 Y102.171 E.14699
G2 X203.341 Y100.715 I-4.056 J.863 E.05278
G1 X147.006 Y157.05 E2.64276
G1 X143.698 Y157.05 E.10975
G1 X140.229 Y153.581 E.16272
G3 X138.679 Y154.08 I-5.797 J-15.357 E.05402
; WIPE_START
G1 F24000
G1 X140.229 Y153.581 E-.61861
G1 X140.492 Y153.844 E-.14139
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I0 J-1.217 P1  F30000
G1 X121.574 Y153.851 Z5
G1 Z4.6
G1 E.8 F1800
G1 F15476.087
G3 X120.037 Y153.315 I4.623 J-15.75 E.05402
G1 X116.302 Y157.05 E.17519
G1 X112.994 Y157.05 E.10975
G1 X56.661 Y100.716 E2.64271
G2 X56.04 Y102.173 I5.677 J3.281 E.05265
G1 X59.175 Y99.038 E.14708
G3 X60.016 Y98.95 I.953 J5.09 E.02808
G1 X62.571 Y98.95 E.08474
G1 X90.55 Y126.929 E1.31256
G1 X90.55 Y129.071 E.07102
G1 X62.57 Y157.05 E1.31256
G3 X59.406 Y157.005 I-1.275 J-21.636 E.10508
G1 X59.162 Y156.95 E.00828
G1 X56.038 Y153.825 E.14659
G2 X56.666 Y155.278 I5.603 J-1.561 E.05268
G1 X90.55 Y121.395 E1.58955
G1 X90.55 Y119.254 E.07102
G1 X70.247 Y98.951 E.95245
G1 X66.938 Y98.951 E.10976
G1 X55.955 Y109.933 E.51523
G1 X55.955 Y107.687 E.07451
G1 X105.318 Y157.05 E2.3157
G1 X108.626 Y157.05 E.10975
G1 X114.913 Y150.763 E.29494
G2 X116.317 Y151.587 I9 J-13.728 E.05402
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.913 Y150.763 E-.6186
G1 X114.65 Y151.026 E-.1414
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/105
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
G3 Z5 I.39 J1.153 P1  F30000
G1 X169.102 Y132.602 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X159.365 Y132.603 E.323
G2 X158.58 Y133.204 I.028 J.849 E.035
G3 X102.42 Y133.204 I-28.08 J-7.332 E2.53268
G2 X101.635 Y132.603 I-.813 J.248 E.035
G1 X90.898 Y132.602 E.35617
G1 X90.898 Y105.398 E.90241
G1 X107.535 Y105.398 E.55189
G2 X108.397 Y104.569 I.012 J-.85 E.04401
G1 X108.398 Y101.398 E.10518
G1 X116.102 Y101.398 E.25554
G1 X116.104 Y104.598 E.10615
G2 X116.96 Y105.398 I.849 J-.051 E.04286
G1 X144.034 Y105.398 E.89811
G2 X144.898 Y104.535 I.013 J-.851 E.04516
G1 X144.898 Y101.398 E.10407
G1 X152.602 Y101.398 E.25556
G1 X152.603 Y104.569 E.10518
G2 X153.465 Y105.398 I.85 J-.021 E.04401
G1 X169.102 Y105.398 E.51872
G1 X169.102 Y132.542 E.90042
G1 X168.71 Y132.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X159.354 Y132.211 E.28749
G2 X158.207 Y133.082 I.04 J1.242 E.04719
G3 X102.793 Y133.082 I-27.707 J-7.212 E2.31576
G2 X101.646 Y132.211 I-1.186 J.37 E.04719
G1 X91.29 Y132.21 E.31822
G1 X91.29 Y105.79 E.81181
G1 X107.545 Y105.79 E.49947
G2 X108.789 Y104.579 I.002 J-1.242 E.05909
G1 X108.79 Y101.79 E.08569
G1 X115.71 Y101.79 E.21263
G1 X115.712 Y104.613 E.08673
G2 X116.953 Y105.79 I1.241 J-.065 E.05799
G1 X144.044 Y105.79 E.83243
G2 X145.29 Y104.545 I.003 J-1.243 E.06014
G1 X145.29 Y101.79 E.08465
G1 X152.21 Y101.79 E.21263
G1 X152.211 Y104.579 E.08569
G2 X153.455 Y105.79 I1.242 J-.031 E.05909
G1 X168.71 Y105.79 E.46874
G1 X168.71 Y132.15 E.80997
M204 S10000
; WIPE_START
G1 F24000
G1 X166.71 Y132.163 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.313 J-1.176 P1  F30000
G1 X55.624 Y102.569 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
G1 X200.15 Y98.606 E4.64878
G3 X204.398 Y103.007 I-.162 J4.407 E.22423
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.411 J-.006 E.22946
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I.006 J-4.411 E.22946
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.234 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.16 Y98.214 E4.30663
G3 X204.79 Y103.003 I-.172 J4.799 E.22618
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.804 J-.012 E.23117
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.012 J-4.804 E.23117
G1 X55.21 Y103.003 E1.5362
G3 X55.229 Y102.59 I4.804 J.012 E.01268
M204 S10000
; WIPE_START
G1 F24000
G1 X55.302 Y102.066 E-.20136
G1 X55.416 Y101.61 E-.17863
G1 X55.575 Y101.167 E-.17862
G1 X55.776 Y100.742 E-.17863
G1 X55.806 Y100.691 E-.02276
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.24 J1.193 P1  F30000
G1 X90.55 Y107.671 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X90.55 Y106.043 E.05401
G1 X55.952 Y140.641 E1.62306
G1 X55.952 Y138.388 E.07474
G1 X74.614 Y157.05 E.87548
G1 X77.922 Y157.05 E.10975
G1 X101.913 Y133.059 E1.12543
G3 X102.067 Y133.26 I-.293 J.385 E.00848
G2 X104.039 Y138.609 I38.735 J-11.243 E.18928
G1 X85.598 Y157.05 E.86509
G1 X82.29 Y157.05 E.10975
G1 X55.953 Y130.712 E1.23553
G1 X55.953 Y132.964 E.07468
G1 X89.965 Y98.951 E1.5956
G1 X93.275 Y98.951 E.1098
G1 X99.374 Y105.05 E.28609
G1 X99.219 Y105.05 E.00515
G1 X105.317 Y98.952 E.28607
G1 X108.628 Y98.952 E.10983
G1 X110.726 Y101.05 E.09842
G1 X110.895 Y101.05 E.0056
G1 X112.992 Y98.952 E.09841
G1 X116.304 Y98.952 E.10985
G1 X122.399 Y105.047 E.28593
G1 X122.249 Y105.047 E.00496
G1 X128.344 Y98.952 E.28591
G1 X131.656 Y98.952 E.10987
G1 X137.749 Y105.045 E.28581
G1 X137.603 Y105.045 E.00482
G1 X143.695 Y98.953 E.28579
G1 X147.009 Y98.953 E.1099
G1 X149.105 Y101.05 E.09837
G1 X149.274 Y101.05 E.0056
G1 X151.371 Y98.953 E.09836
G1 X154.685 Y98.953 E.10992
G1 X160.781 Y105.05 E.28601
G1 X160.626 Y105.05 E.00514
G1 X166.723 Y98.953 E.28599
G1 X170.037 Y98.953 E.10994
G1 X204.044 Y132.96 E1.59534
G1 X204.044 Y130.716 E.07447
G1 X177.71 Y157.05 E1.23539
G1 X174.402 Y157.05 E.10975
G1 X156.626 Y139.274 E.8339
G2 X158.787 Y133.759 I-26.62 J-13.613 E.1968
G1 X182.078 Y157.05 E1.09261
G1 X185.386 Y157.05 E.10975
G1 X204.044 Y138.391 E.87529
G1 X204.044 Y140.636 E.07447
G1 X169.45 Y106.043 E1.62287
G1 X169.45 Y107.671 E.05401
; WIPE_START
G1 F24000
G1 X169.45 Y106.043 E-.61876
G1 X169.713 Y106.305 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.091 J-.539 P1  F30000
G1 X148.662 Y148.955 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F15476.087
G2 X149.913 Y147.913 I-49.188 J-60.314 E.05401
G1 X159.05 Y157.05 E.42861
G1 X162.358 Y157.05 E.10975
G1 X204.044 Y115.364 E1.95558
G1 X204.044 Y117.609 E.07447
G1 X185.389 Y98.954 E.87513
G1 X182.074 Y98.954 E.10997
G1 X169.45 Y111.578 E.59221
G1 X169.45 Y113.719 E.07102
G1 X204.044 Y148.312 E1.62287
G1 X204.044 Y146.067 E.07447
G1 X193.062 Y157.05 E.5152
G1 X189.754 Y157.05 E.10975
G1 X165.654 Y132.951 E1.13054
G1 X163.429 Y132.951 E.07382
G1 X156.074 Y140.306 E.34506
G3 X153.635 Y143.959 I-40.836 J-24.617 E.14574
G1 X166.726 Y157.05 E.6141
G1 X170.034 Y157.05 E.10975
G1 X204.044 Y123.04 E1.59549
G1 X204.044 Y125.285 E.07447
G1 X177.713 Y98.954 E1.23524
G1 X174.398 Y98.953 E.10996
G1 X168.302 Y105.05 E.28598
G1 X168.457 Y105.05 E.00514
G1 X162.361 Y98.953 E.286
G1 X159.047 Y98.953 E.10993
G1 X153.102 Y104.898 E.27889
G2 X153.33 Y105.032 I.334 J-.307 E.0089
G2 X154.689 Y105.05 I.757 J-6.017 E.04518
; WIPE_START
G1 F24000
G1 X153.33 Y105.032 E-.51651
G1 X153.102 Y104.898 E-.10047
G1 X153.368 Y104.632 E-.14302
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.282 J-1.184 P1  F30000
G1 X144.547 Y102.534 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F15476.087
G1 X144.542 Y104.163 E.05401
G1 X139.332 Y98.953 E.24441
G1 X136.02 Y98.952 E.10989
G1 X129.926 Y105.046 E.28585
G1 X130.074 Y105.046 E.00489
G1 X123.98 Y98.952 E.28587
G1 X120.668 Y98.952 E.10986
G1 X116.451 Y103.169 E.19783
G1 X116.45 Y101.541 E.05401
; WIPE_START
G1 F24000
G1 X116.451 Y103.169 E-.61876
G1 X116.714 Y102.906 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.089 J-1.214 P1  F30000
G1 X108.047 Y102.274 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F15476.087
G1 X108.042 Y103.902 E.05401
G1 X106.895 Y105.05 E.05384
G1 X107.05 Y105.05 E.00515
G1 X100.951 Y98.951 E.28608
G1 X97.641 Y98.951 E.10982
G1 X91.543 Y105.05 E.28608
G1 X91.698 Y105.05 E.00515
G1 X85.599 Y98.951 E.2861
M73 P53 R22
G1 X82.289 Y98.951 E.10979
G1 X55.953 Y125.287 E1.23548
G1 X55.954 Y123.037 E.07463
G1 X89.966 Y157.05 E1.59559
G1 X93.274 Y157.05 E.10975
G1 X106.933 Y143.391 E.64077
G1 X106.727 Y143.107 E.01164
G1 X96.571 Y132.951 E.47644
G1 X94.346 Y132.951 E.07382
G1 X70.246 Y157.05 E1.13054
G1 X66.938 Y157.05 E.10975
G1 X55.951 Y146.063 E.51542
G1 X55.951 Y148.317 E.07479
G1 X90.55 Y113.719 E1.6231
G1 X90.55 Y111.578 E.07102
G1 X77.923 Y98.951 E.59235
G1 X74.614 Y98.951 E.10978
G1 X55.954 Y117.61 E.87535
G1 X55.954 Y115.362 E.07457
G1 X97.642 Y157.05 E1.95565
G1 X100.95 Y157.05 E.10975
G1 X110.566 Y147.434 E.4511
G2 X113.297 Y149.676 I20.829 J-22.576 E.11727
G1 X120.67 Y157.05 E.3459
G1 X123.978 Y157.05 E.10975
G1 X126.118 Y154.91 E.10039
G1 X126.221 Y154.925 E.00345
G1 X128.346 Y157.05 E.09967
G1 X131.654 Y157.05 E.10975
G1 X133.632 Y155.072 E.09279
G1 X134.007 Y155.034 E.01248
G1 X136.022 Y157.05 E.09454
G1 X139.33 Y157.05 E.10975
G1 X144.924 Y151.456 E.26241
G2 X145.464 Y151.14 I-2.909 J-5.603 E.02078
G1 X151.374 Y157.05 E.27722
G1 X154.682 Y157.05 E.10975
G1 X204.044 Y107.688 E2.31568
G1 X204.044 Y109.933 E.07447
G1 X193.066 Y98.954 E.51503
G1 X189.75 Y98.954 E.10999
G1 X169.45 Y119.254 E.9523
G1 X169.45 Y121.395 E.07102
G1 X203.339 Y155.284 E1.58981
G2 X203.96 Y153.827 I-5.677 J-3.281 E.05265
G1 X200.825 Y156.962 E.14708
G3 X199.984 Y157.05 I-.953 J-5.088 E.02808
G1 X197.429 Y157.05 E.08474
G1 X169.45 Y129.071 E1.31256
G1 X169.45 Y126.929 E.07102
G1 X197.426 Y98.954 E1.31238
G3 X200.395 Y98.97 I1.356 J23.873 E.09855
G3 X200.825 Y99.038 I-.127 J2.219 E.01448
G1 X203.958 Y102.171 E.14699
G2 X203.341 Y100.715 I-4.056 J.863 E.05278
G1 X147.006 Y157.05 E2.64276
G1 X143.698 Y157.05 E.10975
G1 X140.229 Y153.581 E.16272
G3 X138.679 Y154.08 I-5.797 J-15.357 E.05402
; WIPE_START
G1 F24000
G1 X140.229 Y153.581 E-.61861
G1 X140.492 Y153.844 E-.14139
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I0 J-1.217 P1  F30000
G1 X121.574 Y153.851 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F15476.087
G3 X120.037 Y153.315 I4.623 J-15.75 E.05402
G1 X116.302 Y157.05 E.17519
G1 X112.994 Y157.05 E.10975
G1 X56.661 Y100.716 E2.64271
G2 X56.04 Y102.173 I5.677 J3.281 E.05265
G1 X59.175 Y99.038 E.14708
G3 X60.016 Y98.95 I.953 J5.089 E.02808
G1 X62.571 Y98.95 E.08474
G1 X90.55 Y126.929 E1.31256
G1 X90.55 Y129.071 E.07102
G1 X62.57 Y157.05 E1.31256
G3 X59.406 Y157.005 I-1.275 J-21.636 E.10508
G1 X59.162 Y156.95 E.00828
G1 X56.038 Y153.825 E.1466
G2 X56.666 Y155.278 I5.603 J-1.561 E.05268
G1 X90.55 Y121.395 E1.58955
G1 X90.55 Y119.254 E.07102
G1 X70.247 Y98.951 E.95245
G1 X66.938 Y98.951 E.10976
G1 X55.955 Y109.933 E.51523
G1 X55.955 Y107.687 E.07451
G1 X105.318 Y157.05 E2.3157
G1 X108.626 Y157.05 E.10975
G1 X114.913 Y150.763 E.29494
G2 X116.317 Y151.587 I9.001 J-13.728 E.05402
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.913 Y150.763 E-.6186
G1 X114.65 Y151.026 E-.1414
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/105
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
G3 Z5.2 I.39 J1.153 P1  F30000
G1 X169.102 Y132.602 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X159.368 Y132.603 E.32291
G2 X158.58 Y133.204 I.025 J.849 E.0351
G3 X102.42 Y133.204 I-28.08 J-7.332 E2.53267
G2 X101.632 Y132.603 I-.812 J.247 E.0351
G1 X90.898 Y132.602 E.35608
G1 X90.898 Y105.398 E.90241
G1 X107.535 Y105.398 E.55189
G2 X108.397 Y104.573 I.012 J-.85 E.04387
G1 X108.398 Y101.398 E.10531
G1 X116.102 Y101.398 E.25554
G1 X116.104 Y104.598 E.10615
G2 X116.96 Y105.398 I.849 J-.051 E.04287
G1 X144.034 Y105.398 E.8981
G2 X144.898 Y104.535 I.013 J-.851 E.04516
G1 X144.898 Y101.398 E.10407
G1 X152.602 Y101.398 E.25556
G1 X152.603 Y104.573 E.10531
G2 X153.465 Y105.398 I.85 J-.025 E.04387
G1 X169.102 Y105.398 E.51872
G1 X169.102 Y132.542 E.90042
G1 X168.71 Y132.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X159.357 Y132.211 E.2874
G2 X158.207 Y133.083 I.037 J1.242 E.04729
G3 X102.793 Y133.083 I-27.707 J-7.212 E2.31575
G2 X101.643 Y132.211 I-1.186 J.37 E.04729
G1 X91.29 Y132.21 E.31813
G1 X91.29 Y105.79 E.81181
G1 X107.545 Y105.79 E.49947
G2 X108.789 Y104.583 I.002 J-1.243 E.05897
G1 X108.79 Y101.79 E.08581
G1 X115.71 Y101.79 E.21263
G1 X115.712 Y104.612 E.08673
G2 X116.953 Y105.79 I1.241 J-.065 E.058
G1 X144.044 Y105.79 E.83243
G2 X145.29 Y104.545 I.003 J-1.243 E.06014
G1 X145.29 Y101.79 E.08465
G1 X152.21 Y101.79 E.21263
G1 X152.211 Y104.583 E.08581
G2 X153.455 Y105.79 I1.242 J-.035 E.05897
G1 X168.71 Y105.79 E.46874
G1 X168.71 Y132.15 E.80997
M204 S10000
; WIPE_START
G1 F24000
G1 X166.71 Y132.163 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.313 J-1.176 P1  F30000
G1 X55.624 Y102.569 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X60.007 Y98.602 I4.38 J.435 E.21503
G1 X200.157 Y98.606 E4.64902
G3 X204.398 Y103.007 I-.169 J4.407 E.224
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.402 J.004 E.2296
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I-.004 J-4.402 E.2296
G1 X55.602 Y103.007 E1.6581
G3 X55.618 Y102.629 I4.402 J-.004 E.01258
G1 X55.233 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X60.003 Y98.21 I4.77 J.473 E.21678
G1 X200.167 Y98.214 E4.30685
G3 X204.79 Y103.003 I-.179 J4.799 E.22596
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.794 J-.001 E.23131
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.001 J-4.794 E.23131
G1 X55.21 Y103.003 E1.5362
G3 X55.228 Y102.59 I4.794 J.001 E.01269
M204 S10000
; WIPE_START
G1 F24000
G1 X55.302 Y102.066 E-.20137
G1 X55.416 Y101.61 E-.17864
G1 X55.575 Y101.167 E-.17861
G1 X55.776 Y100.742 E-.17862
G1 X55.806 Y100.691 E-.02276
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.24 J1.193 P1  F30000
G1 X90.55 Y107.671 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X90.55 Y106.043 E.05401
G1 X55.952 Y140.641 E1.62306
G1 X55.952 Y138.388 E.07474
G1 X74.614 Y157.05 E.87548
G1 X77.922 Y157.05 E.10975
G1 X101.913 Y133.059 E1.12544
G3 X102.067 Y133.261 I-.296 J.386 E.00852
G2 X104.039 Y138.609 I38.722 J-11.238 E.18924
G1 X85.598 Y157.05 E.86509
G1 X82.29 Y157.05 E.10975
G1 X55.953 Y130.712 E1.23553
G1 X55.953 Y132.964 E.07468
G1 X89.965 Y98.951 E1.5956
G1 X93.275 Y98.951 E.10981
G1 X99.374 Y105.05 E.28609
G1 X99.219 Y105.05 E.00515
G1 X105.317 Y98.952 E.28607
G1 X108.628 Y98.952 E.10984
G1 X110.726 Y101.05 E.09842
G1 X110.895 Y101.05 E.0056
G1 X112.992 Y98.952 E.09841
G1 X116.304 Y98.952 E.10985
G1 X122.399 Y105.047 E.28592
G1 X122.249 Y105.047 E.00495
G1 X128.344 Y98.952 E.2859
G1 X131.656 Y98.952 E.10988
G1 X137.749 Y105.045 E.2858
G1 X137.603 Y105.045 E.00482
G1 X143.695 Y98.953 E.28579
G1 X147.009 Y98.953 E.10991
G1 X149.105 Y101.05 E.09837
G1 X149.274 Y101.05 E.0056
G1 X151.371 Y98.953 E.09836
G1 X154.685 Y98.953 E.10992
G1 X160.781 Y105.05 E.286
G1 X160.626 Y105.05 E.00514
G1 X166.723 Y98.953 E.28599
G1 X170.037 Y98.954 E.10995
G1 X204.044 Y132.96 E1.59534
G1 X204.044 Y130.716 E.07447
G1 X177.71 Y157.05 E1.23539
G1 X174.402 Y157.05 E.10975
G1 X156.626 Y139.274 E.8339
G2 X158.787 Y133.759 I-26.615 J-13.611 E.19681
G1 X182.078 Y157.05 E1.09262
G1 X185.386 Y157.05 E.10975
G1 X204.044 Y138.391 E.87529
G1 X204.044 Y140.636 E.07447
G1 X169.45 Y106.043 E1.62287
G1 X169.45 Y107.671 E.05401
; WIPE_START
G1 F24000
G1 X169.45 Y106.043 E-.61876
G1 X169.713 Y106.305 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.091 J-.539 P1  F30000
G1 X148.662 Y148.955 Z5.4
G1 Z5
G1 E.8 F1800
G1 F15476.087
G2 X149.913 Y147.913 I-49.188 J-60.314 E.05401
G1 X159.05 Y157.05 E.42861
G1 X162.358 Y157.05 E.10975
G1 X204.044 Y115.364 E1.95558
G1 X204.044 Y117.609 E.07447
G1 X185.39 Y98.954 E.87513
G1 X182.074 Y98.954 E.10998
G1 X169.45 Y111.578 E.5922
G1 X169.45 Y113.719 E.07102
G1 X204.044 Y148.312 E1.62287
G1 X204.044 Y146.067 E.07447
G1 X193.062 Y157.05 E.5152
G1 X189.754 Y157.05 E.10975
G1 X165.654 Y132.951 E1.13054
G1 X163.429 Y132.951 E.07382
G1 X156.074 Y140.306 E.34506
G3 X153.635 Y143.959 I-40.836 J-24.617 E.14574
G1 X166.726 Y157.05 E.6141
G1 X170.034 Y157.05 E.10975
G1 X204.044 Y123.04 E1.59549
G1 X204.044 Y125.285 E.07447
G1 X177.713 Y98.954 E1.23523
G1 X174.398 Y98.954 E.10997
G1 X168.302 Y105.05 E.28598
G1 X168.457 Y105.05 E.00514
G1 X162.361 Y98.953 E.28599
G1 X159.047 Y98.953 E.10994
G1 X153.102 Y104.898 E.27889
G2 X153.33 Y105.032 I.338 J-.313 E.00891
G2 X154.689 Y105.05 I.756 J-6.05 E.04516
; WIPE_START
G1 F24000
G1 X153.33 Y105.032 E-.5163
G1 X153.102 Y104.898 E-.10067
G1 X153.368 Y104.632 E-.14303
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.282 J-1.184 P1  F30000
G1 X144.547 Y102.534 Z5.4
G1 Z5
G1 E.8 F1800
G1 F15476.087
G1 X144.542 Y104.163 E.05401
G1 X139.332 Y98.953 E.24441
G1 X136.02 Y98.953 E.10989
G1 X129.926 Y105.046 E.28585
G1 X130.074 Y105.046 E.00489
G1 X123.98 Y98.952 E.28586
G1 X120.668 Y98.952 E.10987
G1 X116.451 Y103.169 E.19783
G1 X116.45 Y101.541 E.05401
; WIPE_START
G1 F24000
G1 X116.451 Y103.169 E-.61876
G1 X116.714 Y102.906 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.089 J-1.214 P1  F30000
G1 X108.047 Y102.274 Z5.4
G1 Z5
G1 E.8 F1800
G1 F15476.087
G1 X108.042 Y103.902 E.05401
G1 X106.895 Y105.05 E.05384
G1 X107.05 Y105.05 E.00515
G1 X100.952 Y98.952 E.28608
G1 X97.641 Y98.951 E.10982
G1 X91.543 Y105.05 E.28608
G1 X91.698 Y105.05 E.00515
G1 X85.599 Y98.951 E.2861
G1 X82.289 Y98.951 E.10979
G1 X55.953 Y125.287 E1.23547
G1 X55.954 Y123.037 E.07463
G1 X89.966 Y157.05 E1.59559
G1 X93.274 Y157.05 E.10975
G1 X106.933 Y143.391 E.64077
G1 X106.727 Y143.107 E.01164
G1 X96.571 Y132.951 E.47644
G1 X94.346 Y132.951 E.07382
G1 X70.246 Y157.05 E1.13054
G1 X66.938 Y157.05 E.10975
G1 X55.951 Y146.063 E.51542
G1 X55.951 Y148.317 E.07479
G1 X90.55 Y113.719 E1.6231
G1 X90.55 Y111.578 E.07102
G1 X77.923 Y98.951 E.59234
G1 X74.614 Y98.951 E.10978
G1 X55.954 Y117.61 E.87535
G1 X55.954 Y115.362 E.07457
G1 X97.642 Y157.05 E1.95565
G1 X100.95 Y157.05 E.10975
G1 X110.566 Y147.434 E.4511
G2 X113.297 Y149.676 I20.829 J-22.576 E.11727
G1 X120.67 Y157.05 E.3459
G1 X123.978 Y157.05 E.10975
G1 X126.118 Y154.91 E.10039
G1 X126.221 Y154.925 E.00345
G1 X128.346 Y157.05 E.09967
G1 X131.654 Y157.05 E.10975
G1 X133.632 Y155.072 E.09279
G1 X134.007 Y155.034 E.01248
G1 X136.022 Y157.05 E.09454
G1 X139.33 Y157.05 E.10975
G1 X144.924 Y151.456 E.26241
G2 X145.464 Y151.14 I-2.909 J-5.603 E.02078
G1 X151.374 Y157.05 E.27722
G1 X154.682 Y157.05 E.10975
G1 X204.044 Y107.688 E2.31568
G1 X204.044 Y109.933 E.07447
G1 X193.066 Y98.954 E.51502
G1 X189.75 Y98.954 E.11
G1 X169.45 Y119.254 E.95229
G1 X169.45 Y121.395 E.07102
G1 X203.339 Y155.284 E1.58981
G2 X203.96 Y153.827 I-5.677 J-3.281 E.05265
G1 X200.825 Y156.962 E.14708
G3 X199.984 Y157.05 I-.953 J-5.089 E.02808
G1 X197.429 Y157.05 E.08474
G1 X169.45 Y129.071 E1.31256
G1 X169.45 Y126.929 E.07102
G1 X197.426 Y98.954 E1.31237
G3 X200.394 Y98.97 I1.36 J23.508 E.09855
G3 X200.825 Y99.038 I-.127 J2.22 E.01448
G1 X203.958 Y102.171 E.14699
G2 X203.341 Y100.715 I-4.056 J.863 E.05278
G1 X147.006 Y157.05 E2.64276
G1 X143.698 Y157.05 E.10975
G1 X140.229 Y153.581 E.16272
G3 X138.679 Y154.08 I-5.797 J-15.357 E.05402
; WIPE_START
G1 F24000
G1 X140.229 Y153.581 E-.61861
G1 X140.492 Y153.844 E-.14139
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I0 J-1.217 P1  F30000
G1 X121.574 Y153.851 Z5.4
G1 Z5
G1 E.8 F1800
G1 F15476.087
G3 X120.037 Y153.315 I4.623 J-15.75 E.05402
G1 X116.302 Y157.05 E.17519
G1 X112.994 Y157.05 E.10975
G1 X56.661 Y100.716 E2.64271
G2 X56.04 Y102.173 I5.677 J3.281 E.05265
G1 X59.175 Y99.038 E.14708
G3 X60.016 Y98.95 I.953 J5.089 E.02808
G1 X62.571 Y98.95 E.08474
G1 X90.55 Y126.929 E1.31256
G1 X90.55 Y129.071 E.07102
G1 X62.57 Y157.05 E1.31256
G3 X59.406 Y157.005 I-1.275 J-21.635 E.10508
G1 X59.162 Y156.95 E.00827
G1 X56.038 Y153.825 E.14659
G2 X56.666 Y155.278 I5.603 J-1.561 E.05268
G1 X90.55 Y121.395 E1.58955
G1 X90.55 Y119.254 E.07102
G1 X70.247 Y98.951 E.95245
G1 X66.938 Y98.951 E.10976
G1 X55.955 Y109.933 E.51523
G1 X55.955 Y107.687 E.07451
G1 X105.318 Y157.05 E2.3157
M73 P53 R21
G1 X108.626 Y157.05 E.10975
G1 X114.913 Y150.763 E.29494
G2 X116.317 Y151.587 I9 J-13.728 E.05402
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.913 Y150.763 E-.6186
G1 X114.65 Y151.026 E-.1414
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/105
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
G3 Z5.4 I.39 J1.153 P1  F30000
G1 X169.102 Y132.602 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X159.37 Y132.603 E.32282
G2 X158.58 Y133.205 I.022 J.849 E.03519
G3 X102.42 Y133.205 I-28.08 J-7.334 E2.53258
G2 X101.63 Y132.603 I-.812 J.247 E.03519
G1 X90.898 Y132.602 E.35599
G1 X90.898 Y105.398 E.90241
G1 X107.535 Y105.398 E.55189
G2 X108.397 Y104.565 I.012 J-.85 E.04412
G1 X108.398 Y101.398 E.10506
G1 X116.102 Y101.398 E.25554
G1 X116.104 Y104.598 E.10615
G2 X116.96 Y105.398 I.849 J-.051 E.04288
G1 X144.034 Y105.398 E.89809
G2 X144.898 Y104.535 I.014 J-.85 E.04519
G1 X144.898 Y101.398 E.10407
G1 X152.602 Y101.398 E.25556
G1 X152.603 Y104.565 E.10506
G2 X153.465 Y105.398 I.85 J-.017 E.04412
G1 X169.102 Y105.398 E.51872
G1 X169.102 Y132.542 E.90042
G1 X168.71 Y132.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X159.36 Y132.211 E.28731
G2 X158.207 Y133.083 I.033 J1.241 E.0474
G3 X102.793 Y133.083 I-27.707 J-7.213 E2.31571
G2 X101.64 Y132.211 I-1.186 J.369 E.0474
G1 X91.29 Y132.21 E.31804
G1 X91.29 Y105.79 E.81181
G1 X107.545 Y105.79 E.49947
M73 P54 R21
G2 X108.789 Y104.583 I.002 J-1.243 E.05896
G1 X108.79 Y101.79 E.08581
G1 X115.71 Y101.79 E.21263
G1 X115.712 Y104.612 E.08672
G2 X116.953 Y105.79 I1.242 J-.066 E.058
G1 X144.044 Y105.79 E.83243
G2 X145.29 Y104.545 I.004 J-1.241 E.06016
G1 X145.29 Y101.79 E.08465
G1 X152.21 Y101.79 E.21263
G1 X152.211 Y104.583 E.08581
G2 X153.455 Y105.79 I1.242 J-.035 E.05896
G1 X168.71 Y105.79 E.46874
G1 X168.71 Y132.15 E.80997
M204 S10000
; WIPE_START
G1 F24000
G1 X166.71 Y132.163 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.313 J-1.176 P1  F30000
G1 X55.624 Y102.569 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X60.007 Y98.602 I4.38 J.435 E.21503
G1 X200.164 Y98.606 E4.64925
G3 X204.398 Y103.007 I-.166 J4.397 E.2239
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.411 J-.006 E.22946
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I-.004 J-4.402 E.2296
G1 X55.602 Y103.007 E1.6581
G3 X55.618 Y102.629 I4.402 J-.004 E.01258
G1 X55.233 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X60.003 Y98.21 I4.77 J.473 E.21678
G1 X200.174 Y98.214 E4.30706
G3 X204.79 Y103.003 I-.175 J4.789 E.22588
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.804 J-.012 E.23117
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.001 J-4.794 E.23131
G1 X55.21 Y103.003 E1.5362
G3 X55.228 Y102.59 I4.794 J.001 E.01269
M204 S10000
; WIPE_START
G1 F24000
G1 X55.302 Y102.066 E-.20137
G1 X55.416 Y101.61 E-.17864
G1 X55.575 Y101.167 E-.17862
G1 X55.776 Y100.742 E-.17863
G1 X55.806 Y100.691 E-.02275
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.24 J1.193 P1  F30000
G1 X90.55 Y107.671 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X90.55 Y106.043 E.05401
G1 X55.952 Y140.641 E1.62306
G1 X55.952 Y138.388 E.07474
G1 X74.614 Y157.05 E.87548
G1 X77.922 Y157.05 E.10975
G1 X101.913 Y133.059 E1.12546
G3 X102.068 Y133.262 I-.299 J.387 E.00855
G2 X104.039 Y138.609 I38.708 J-11.233 E.18921
G1 X85.598 Y157.05 E.86509
G1 X82.29 Y157.05 E.10975
G1 X55.953 Y130.712 E1.23553
G1 X55.953 Y132.964 E.07468
G1 X89.965 Y98.951 E1.5956
G1 X93.275 Y98.951 E.10981
G1 X99.374 Y105.05 E.28608
G1 X99.219 Y105.05 E.00515
G1 X105.317 Y98.952 E.28607
G1 X108.628 Y98.952 E.10984
G1 X110.726 Y101.05 E.09841
G1 X110.895 Y101.05 E.0056
G1 X112.992 Y98.952 E.09841
G1 X116.304 Y98.952 E.10986
G1 X122.399 Y105.047 E.28592
G1 X122.249 Y105.047 E.00495
G1 X128.344 Y98.952 E.2859
G1 X131.656 Y98.952 E.10989
G1 X137.748 Y105.045 E.28579
G1 X137.603 Y105.045 E.00481
G1 X143.695 Y98.953 E.28578
G1 X147.009 Y98.953 E.10992
G1 X149.105 Y101.05 E.09836
G1 X149.274 Y101.05 E.0056
G1 X151.371 Y98.953 E.09835
G1 X154.685 Y98.953 E.10993
G1 X160.781 Y105.05 E.286
G1 X160.626 Y105.05 E.00514
G1 X166.722 Y98.954 E.28598
G1 X170.037 Y98.954 E.10996
G1 X204.044 Y132.96 E1.59533
G1 X204.044 Y130.716 E.07447
G1 X177.71 Y157.05 E1.23539
G1 X174.402 Y157.05 E.10975
G1 X156.626 Y139.274 E.8339
G2 X158.787 Y133.759 I-26.611 J-13.609 E.19681
G1 X182.078 Y157.05 E1.09262
G1 X185.386 Y157.05 E.10975
G1 X204.044 Y138.391 E.87529
G1 X204.044 Y140.636 E.07447
G1 X169.45 Y106.043 E1.62287
G1 X169.45 Y107.671 E.05401
; WIPE_START
G1 F24000
G1 X169.45 Y106.043 E-.61876
G1 X169.713 Y106.305 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.091 J-.539 P1  F30000
G1 X148.662 Y148.955 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F15476.087
G2 X149.913 Y147.913 I-49.188 J-60.314 E.05401
G1 X159.05 Y157.05 E.42861
G1 X162.358 Y157.05 E.10975
G1 X204.044 Y115.364 E1.95558
G1 X204.044 Y117.609 E.07447
G1 X185.39 Y98.954 E.87512
G1 X182.074 Y98.954 E.10999
G1 X169.45 Y111.578 E.5922
G1 X169.45 Y113.719 E.07102
G1 X204.044 Y148.312 E1.62287
G1 X204.044 Y146.067 E.07447
G1 X193.062 Y157.05 E.5152
G1 X189.754 Y157.05 E.10975
G1 X165.654 Y132.951 E1.13054
G1 X163.429 Y132.951 E.07381
G1 X156.074 Y140.306 E.34507
G3 X153.635 Y143.959 I-40.836 J-24.617 E.14574
G1 X166.726 Y157.05 E.6141
G1 X170.034 Y157.05 E.10975
G1 X204.044 Y123.04 E1.59548
G1 X204.044 Y125.285 E.07447
G1 X177.714 Y98.954 E1.23522
G1 X174.398 Y98.954 E.10998
G1 X168.302 Y105.05 E.28597
G1 X168.457 Y105.05 E.00514
G1 X162.361 Y98.953 E.28599
G1 X159.047 Y98.953 E.10995
G1 X153.102 Y104.898 E.27888
G2 X153.331 Y105.033 I.342 J-.32 E.00893
G2 X154.689 Y105.05 I.756 J-6.083 E.04515
; WIPE_START
G1 F24000
G1 X153.331 Y105.033 E-.5161
G1 X153.102 Y104.898 E-.10086
G1 X153.368 Y104.632 E-.14303
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.282 J-1.184 P1  F30000
G1 X144.547 Y102.534 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F15476.087
G1 X144.542 Y104.163 E.05401
G1 X139.333 Y98.953 E.2444
G1 X136.019 Y98.953 E.1099
G1 X129.926 Y105.046 E.28584
G1 X130.074 Y105.046 E.00488
G1 X123.98 Y98.952 E.28585
G1 X120.668 Y98.952 E.10987
G1 X116.451 Y103.169 E.19782
G1 X116.45 Y101.541 E.05401
; WIPE_START
G1 F24000
G1 X116.451 Y103.169 E-.61876
G1 X116.714 Y102.906 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.088 J-1.214 P1  F30000
G1 X108.047 Y102.275 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F15476.087
G1 X108.041 Y103.903 E.05401
G1 X106.895 Y105.05 E.05379
G1 X107.05 Y105.05 E.00515
G1 X100.952 Y98.952 E.28607
G1 X97.641 Y98.951 E.10982
G1 X91.543 Y105.05 E.28608
G1 X91.698 Y105.05 E.00515
G1 X85.599 Y98.951 E.2861
G1 X82.289 Y98.951 E.10979
G1 X55.953 Y125.287 E1.23547
G1 X55.954 Y123.037 E.07463
G1 X89.966 Y157.05 E1.59559
G1 X93.274 Y157.05 E.10975
G1 X106.933 Y143.391 E.64077
G1 X106.727 Y143.107 E.01164
G1 X96.571 Y132.951 E.47645
G1 X94.346 Y132.951 E.07381
G1 X70.246 Y157.05 E1.13054
G1 X66.938 Y157.05 E.10975
G1 X55.951 Y146.063 E.51542
G1 X55.951 Y148.317 E.07479
G1 X90.55 Y113.719 E1.6231
G1 X90.55 Y111.578 E.07102
G1 X77.923 Y98.951 E.59234
G1 X74.614 Y98.951 E.10978
G1 X55.954 Y117.61 E.87535
G1 X55.954 Y115.362 E.07457
G1 X97.642 Y157.05 E1.95565
G1 X100.95 Y157.05 E.10975
G1 X110.566 Y147.434 E.4511
G2 X113.29 Y149.67 I20.462 J-22.148 E.11698
G1 X120.67 Y157.05 E.34618
G1 X123.978 Y157.05 E.10975
G1 X126.118 Y154.91 E.10039
G1 X126.221 Y154.925 E.00345
G1 X128.346 Y157.05 E.09967
G1 X131.654 Y157.05 E.10975
G1 X133.632 Y155.072 E.09279
G1 X134.007 Y155.034 E.01248
G1 X136.022 Y157.05 E.09454
G1 X139.33 Y157.05 E.10975
G1 X144.927 Y151.453 E.26255
G1 X145.459 Y151.135 E.02056
G1 X151.374 Y157.05 E.27747
G1 X154.682 Y157.05 E.10975
G1 X204.044 Y107.688 E2.31568
G1 X204.044 Y109.933 E.07447
G1 X193.066 Y98.954 E.51501
G1 X189.75 Y98.954 E.11001
G1 X169.45 Y119.254 E.95228
G1 X169.45 Y121.395 E.07102
G1 X203.341 Y155.285 E1.58988
G2 X203.96 Y153.827 I-3.851 J-2.497 E.05281
G1 X200.825 Y156.962 E.14708
G3 X199.984 Y157.05 I-.953 J-5.088 E.02808
G1 X197.429 Y157.05 E.08474
G1 X169.45 Y129.071 E1.31256
G1 X169.45 Y126.929 E.07102
G1 X197.425 Y98.954 E1.31237
G1 X200.153 Y98.955 E.09047
G3 X200.825 Y99.038 I-.348 J5.584 E.02249
G1 X203.958 Y102.171 E.14699
G2 X203.341 Y100.715 I-4.056 J.863 E.05278
G1 X147.006 Y157.05 E2.64276
G1 X143.698 Y157.05 E.10975
G1 X140.229 Y153.581 E.16272
G3 X138.679 Y154.08 I-5.797 J-15.357 E.05402
; WIPE_START
G1 F24000
G1 X140.229 Y153.581 E-.61861
G1 X140.492 Y153.844 E-.14139
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I0 J-1.217 P1  F30000
G1 X121.574 Y153.851 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F15476.087
G3 X120.037 Y153.315 I4.623 J-15.75 E.05402
G1 X116.302 Y157.05 E.17519
G1 X112.994 Y157.05 E.10975
G1 X56.661 Y100.716 E2.64271
G2 X56.04 Y102.173 I5.677 J3.281 E.05265
G1 X59.175 Y99.038 E.14708
G3 X60.016 Y98.95 I.953 J5.09 E.02808
G1 X62.571 Y98.95 E.08474
G1 X90.55 Y126.929 E1.31256
G1 X90.55 Y129.071 E.07102
G1 X62.57 Y157.05 E1.31256
G3 X59.406 Y157.005 I-1.275 J-21.636 E.10508
G1 X59.162 Y156.95 E.00828
G1 X56.038 Y153.825 E.14659
G2 X56.666 Y155.278 I5.603 J-1.561 E.05268
G1 X90.55 Y121.395 E1.58955
G1 X90.55 Y119.254 E.07102
G1 X70.247 Y98.951 E.95245
G1 X66.938 Y98.951 E.10976
G1 X55.955 Y109.933 E.51523
G1 X55.955 Y107.687 E.07451
G1 X105.318 Y157.05 E2.3157
G1 X108.626 Y157.05 E.10975
G1 X114.913 Y150.763 E.29494
G2 X116.317 Y151.587 I9 J-13.728 E.05402
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.913 Y150.763 E-.6186
G1 X114.65 Y151.026 E-.1414
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/105
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
G3 Z5.6 I.39 J1.153 P1  F30000
G1 X169.102 Y132.602 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X159.373 Y132.603 E.32273
G2 X158.58 Y133.205 I.019 J.848 E.03529
G3 X102.42 Y133.205 I-28.08 J-7.328 E2.53283
G2 X101.627 Y132.603 I-.812 J.246 E.03529
G1 X90.898 Y132.602 E.35591
G1 X90.898 Y105.398 E.90241
G1 X107.535 Y105.398 E.55189
G2 X108.397 Y104.569 I.009 J-.853 E.04397
G1 X108.398 Y101.398 E.10518
G1 X116.102 Y101.398 E.25554
G1 X116.104 Y104.598 E.10615
G2 X116.96 Y105.398 I.85 J-.051 E.04288
G1 X144.034 Y105.398 E.89808
G2 X144.896 Y104.593 I.013 J-.851 E.04324
G1 X144.898 Y101.398 E.10599
G1 X152.602 Y101.398 E.25554
G1 X152.603 Y104.569 E.10518
G2 X153.465 Y105.398 I.853 J-.023 E.04397
G1 X169.102 Y105.398 E.51872
G1 X169.102 Y132.542 E.90042
G1 X168.71 Y132.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X159.362 Y132.21 E.28722
G2 X158.207 Y133.083 I.03 J1.241 E.0475
G3 X102.793 Y133.083 I-27.707 J-7.207 E2.31594
G2 X101.638 Y132.21 I-1.185 J.368 E.0475
G1 X91.29 Y132.21 E.31795
G1 X91.29 Y105.79 E.81181
G1 X107.545 Y105.79 E.49947
G2 X108.789 Y104.586 I-.002 J-1.247 E.05879
G1 X108.79 Y101.79 E.08592
G1 X115.71 Y101.79 E.21263
G1 X115.712 Y104.612 E.08672
G2 X116.954 Y105.79 I1.242 J-.066 E.058
G1 X144.044 Y105.79 E.83242
G2 X145.288 Y104.607 I.002 J-1.243 E.05823
G1 X145.29 Y101.79 E.08656
G1 X152.21 Y101.79 E.21263
G1 X152.211 Y104.586 E.08592
G2 X153.455 Y105.79 I1.247 J-.044 E.05879
G1 X168.71 Y105.79 E.46874
G1 X168.71 Y132.15 E.80997
M204 S10000
; WIPE_START
G1 F24000
G1 X166.71 Y132.163 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.313 J-1.176 P1  F30000
G1 X55.624 Y102.569 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
G1 X200.159 Y98.606 E4.64909
G3 X204.398 Y103.007 I-.161 J4.397 E.22406
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.411 J-.006 E.22946
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I.006 J-4.411 E.22946
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.234 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.176 Y98.214 E4.30715
G3 X204.79 Y103.003 I-.178 J4.789 E.22579
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.804 J-.012 E.23117
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.012 J-4.804 E.23117
G1 X55.21 Y103.003 E1.5362
G3 X55.229 Y102.59 I4.804 J.012 E.01268
M204 S10000
; WIPE_START
G1 F24000
G1 X55.302 Y102.066 E-.20136
G1 X55.416 Y101.61 E-.17864
G1 X55.575 Y101.167 E-.17861
G1 X55.776 Y100.742 E-.17862
G1 X55.806 Y100.691 E-.02277
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.24 J1.193 P1  F30000
G1 X90.55 Y107.671 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X90.55 Y106.043 E.05401
G1 X55.952 Y140.641 E1.62306
G1 X55.952 Y138.388 E.07474
G1 X74.614 Y157.05 E.87548
G1 X77.922 Y157.05 E.10975
G1 X101.915 Y133.06 E1.12547
G3 X102.068 Y133.263 I-.299 J.385 E.00852
G2 X104.039 Y138.609 I38.695 J-11.229 E.18918
G1 X85.598 Y157.05 E.86509
G1 X82.29 Y157.05 E.10975
G1 X55.953 Y130.712 E1.23553
G1 X55.953 Y132.964 E.07468
G1 X89.965 Y98.951 E1.5956
G1 X93.275 Y98.951 E.10981
G1 X99.374 Y105.05 E.28609
G1 X99.219 Y105.05 E.00515
G1 X105.317 Y98.952 E.28607
G1 X108.628 Y98.952 E.10984
G1 X110.726 Y101.05 E.09842
G1 X110.895 Y101.05 E.0056
G1 X112.992 Y98.952 E.09841
G1 X116.304 Y98.952 E.10985
G1 X122.399 Y105.047 E.28591
G1 X122.249 Y105.047 E.00495
G1 X128.344 Y98.952 E.2859
G1 X131.656 Y98.952 E.10988
G1 X137.748 Y105.044 E.28579
G1 X137.604 Y105.045 E.0048
G1 X143.695 Y98.953 E.28578
G1 X147.009 Y98.953 E.10991
G1 X149.105 Y101.05 E.09836
G1 X149.274 Y101.05 E.0056
G1 X151.371 Y98.953 E.09836
M73 P55 R21
G1 X154.685 Y98.953 E.10993
G1 X160.781 Y105.05 E.286
G1 X160.626 Y105.05 E.00514
G1 X166.723 Y98.953 E.28599
G1 X170.037 Y98.954 E.10996
G1 X204.044 Y132.96 E1.59533
G1 X204.044 Y130.716 E.07447
G1 X177.71 Y157.05 E1.23539
G1 X174.402 Y157.05 E.10975
G1 X156.626 Y139.274 E.8339
G2 X158.787 Y133.759 I-26.607 J-13.607 E.19681
G1 X182.078 Y157.05 E1.09262
G1 X185.386 Y157.05 E.10975
G1 X204.044 Y138.391 E.87529
G1 X204.044 Y140.636 E.07447
G1 X169.45 Y106.043 E1.62287
G1 X169.45 Y107.671 E.05401
; WIPE_START
G1 F24000
G1 X169.45 Y106.043 E-.61876
G1 X169.713 Y106.305 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.091 J-.539 P1  F30000
G1 X148.662 Y148.955 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F15476.087
G2 X149.913 Y147.913 I-49.188 J-60.314 E.05401
G1 X159.05 Y157.05 E.42861
G1 X162.358 Y157.05 E.10975
G1 X204.044 Y115.364 E1.95558
G1 X204.044 Y117.609 E.07447
G1 X185.39 Y98.954 E.87512
G1 X182.074 Y98.954 E.10999
G1 X169.45 Y111.578 E.5922
G1 X169.45 Y113.719 E.07102
G1 X204.044 Y148.312 E1.62287
G1 X204.044 Y146.067 E.07447
G1 X193.062 Y157.05 E.5152
G1 X189.754 Y157.05 E.10975
G1 X165.654 Y132.95 E1.13054
G1 X163.429 Y132.951 E.07381
G1 X156.074 Y140.306 E.34507
G3 X153.635 Y143.959 I-40.836 J-24.617 E.14574
G1 X166.726 Y157.05 E.6141
G1 X170.034 Y157.05 E.10975
G1 X204.044 Y123.04 E1.59548
G1 X204.044 Y125.285 E.07447
G1 X177.713 Y98.954 E1.23523
G1 X174.398 Y98.954 E.10997
G1 X168.302 Y105.05 E.28597
G1 X168.457 Y105.05 E.00514
G1 X162.361 Y98.953 E.28599
G1 X159.047 Y98.953 E.10994
G1 X153.102 Y104.898 E.27889
G2 X153.326 Y105.032 I.349 J-.331 E.00877
G2 X154.689 Y105.05 I.76 J-6.006 E.0453
; WIPE_START
G1 F24000
G1 X153.326 Y105.032 E-.5178
G1 X153.102 Y104.898 E-.09922
G1 X153.368 Y104.632 E-.14297
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.281 J-1.184 P1  F30000
G1 X144.549 Y102.54 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F15476.087
G1 X144.548 Y104.169 E.05401
G1 X139.332 Y98.953 E.24469
G1 X136.02 Y98.953 E.1099
G1 X129.927 Y105.046 E.28584
G1 X130.073 Y105.046 E.00488
G1 X123.98 Y98.952 E.28585
G1 X120.668 Y98.952 E.10987
G1 X116.451 Y103.169 E.19783
G1 X116.45 Y101.541 E.05401
; WIPE_START
G1 F24000
G1 X116.451 Y103.169 E-.61876
G1 X116.714 Y102.906 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.088 J-1.214 P1  F30000
G1 X108.047 Y102.275 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F15476.087
G1 X108.041 Y103.903 E.05401
G1 X106.895 Y105.05 E.0538
G1 X107.05 Y105.05 E.00515
G1 X100.952 Y98.952 E.28608
G1 X97.641 Y98.951 E.10982
G1 X91.543 Y105.05 E.28608
G1 X91.698 Y105.05 E.00515
G1 X85.599 Y98.951 E.2861
G1 X82.289 Y98.951 E.10979
G1 X55.953 Y125.287 E1.23547
G1 X55.954 Y123.037 E.07463
G1 X89.966 Y157.05 E1.59559
G1 X93.274 Y157.05 E.10975
G1 X106.933 Y143.391 E.64077
G1 X106.727 Y143.107 E.01164
G1 X96.571 Y132.951 E.47645
G1 X94.346 Y132.95 E.07381
G1 X70.246 Y157.05 E1.13054
G1 X66.938 Y157.05 E.10975
G1 X55.951 Y146.063 E.51542
G1 X55.951 Y148.317 E.07479
G1 X90.55 Y113.719 E1.6231
G1 X90.55 Y111.578 E.07102
G1 X77.923 Y98.951 E.59234
G1 X74.614 Y98.951 E.10978
G1 X55.954 Y117.61 E.87535
G1 X55.954 Y115.362 E.07457
G1 X97.642 Y157.05 E1.95565
G1 X100.95 Y157.05 E.10975
G1 X110.566 Y147.434 E.4511
G2 X113.293 Y149.673 I20.648 J-22.366 E.11711
G1 X120.67 Y157.05 E.34606
G1 X123.978 Y157.05 E.10975
G1 X126.118 Y154.91 E.10039
G1 X126.221 Y154.925 E.00345
G1 X128.346 Y157.05 E.09967
G1 X131.654 Y157.05 E.10975
G1 X133.632 Y155.072 E.09279
G1 X134.007 Y155.034 E.01248
G1 X136.022 Y157.05 E.09454
G1 X139.33 Y157.05 E.10975
G1 X144.924 Y151.456 E.26241
G2 X145.464 Y151.14 I-2.909 J-5.603 E.02078
G1 X151.374 Y157.05 E.27722
G1 X154.682 Y157.05 E.10975
G1 X204.044 Y107.688 E2.31568
G1 X204.044 Y109.933 E.07447
G1 X193.066 Y98.954 E.51502
G1 X189.75 Y98.954 E.11
G1 X169.45 Y119.254 E.95229
G1 X169.45 Y121.395 E.07102
G1 X203.335 Y155.28 E1.58962
G2 X203.96 Y153.827 I-3.595 J-2.407 E.05275
G1 X200.825 Y156.962 E.14708
G3 X199.984 Y157.05 I-.953 J-5.088 E.02808
G1 X197.429 Y157.05 E.08474
G1 X169.45 Y129.071 E1.31256
G1 X169.45 Y126.929 E.07102
G1 X197.425 Y98.954 E1.31237
G3 X200.397 Y98.97 I1.361 J23.192 E.09864
G3 X200.825 Y99.038 I-.128 J2.21 E.01439
G1 X203.958 Y102.171 E.14699
G2 X203.341 Y100.715 I-4.056 J.863 E.05278
G1 X147.006 Y157.05 E2.64276
G1 X143.698 Y157.05 E.10975
G1 X140.229 Y153.581 E.16272
G3 X138.679 Y154.08 I-5.797 J-15.357 E.05402
; WIPE_START
G1 F24000
G1 X140.229 Y153.581 E-.61861
G1 X140.492 Y153.844 E-.14139
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I0 J-1.217 P1  F30000
G1 X121.574 Y153.851 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F15476.087
G3 X120.037 Y153.315 I4.623 J-15.75 E.05402
G1 X116.302 Y157.05 E.17519
G1 X112.994 Y157.05 E.10975
G1 X56.661 Y100.716 E2.64271
G2 X56.04 Y102.173 I5.677 J3.281 E.05265
G1 X59.175 Y99.038 E.14708
G3 X60.016 Y98.95 I.953 J5.09 E.02808
G1 X62.571 Y98.95 E.08474
G1 X90.55 Y126.929 E1.31256
G1 X90.55 Y129.071 E.07102
G1 X62.57 Y157.05 E1.31256
G3 X59.406 Y157.005 I-1.275 J-21.635 E.10508
G1 X59.162 Y156.95 E.00828
G1 X56.038 Y153.825 E.14659
G2 X56.666 Y155.278 I5.603 J-1.561 E.05268
G1 X90.55 Y121.395 E1.58955
G1 X90.55 Y119.254 E.07102
G1 X70.247 Y98.951 E.95245
G1 X66.938 Y98.951 E.10976
G1 X55.955 Y109.933 E.51523
G1 X55.955 Y107.687 E.07451
G1 X105.318 Y157.05 E2.3157
G1 X108.626 Y157.05 E.10975
G1 X114.913 Y150.763 E.29494
G2 X116.317 Y151.587 I9 J-13.727 E.05402
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.913 Y150.763 E-.6186
G1 X114.65 Y151.026 E-.1414
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/105
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
G3 Z5.8 I.39 J1.153 P1  F30000
G1 X169.102 Y132.602 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X159.376 Y132.602 E.32264
G2 X158.58 Y133.205 I.019 J.852 E.03536
G3 X102.42 Y133.205 I-28.08 J-7.338 E2.5324
G2 X101.624 Y132.602 I-.815 J.249 E.03537
G1 X90.898 Y132.602 E.35582
G1 X90.898 Y105.398 E.90241
G1 X107.535 Y105.398 E.5519
G2 X108.397 Y104.572 I.013 J-.849 E.0439
G1 X108.398 Y101.398 E.10529
G1 X116.102 Y101.398 E.25554
G1 X116.104 Y104.598 E.10614
G2 X116.96 Y105.398 I.847 J-.048 E.04293
G1 X144.034 Y105.398 E.89807
G2 X144.896 Y104.598 I.016 J-.848 E.04313
G1 X144.898 Y101.398 E.10614
G1 X152.602 Y101.398 E.25554
G1 X152.603 Y104.572 E.10529
G2 X153.465 Y105.398 I.849 J-.023 E.0439
G1 X169.102 Y105.398 E.51872
G1 X169.102 Y132.542 E.90042
G1 X168.71 Y132.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X159.365 Y132.21 E.28713
G2 X158.207 Y133.083 I.03 J1.245 E.04757
G3 X102.793 Y133.083 I-27.707 J-7.217 E2.31554
G2 X101.635 Y132.21 I-1.188 J.372 E.04758
G1 X91.29 Y132.21 E.31786
G1 X91.29 Y105.79 E.81181
G1 X107.545 Y105.79 E.49947
G2 X108.789 Y104.59 I.002 J-1.243 E.05873
G1 X108.79 Y101.79 E.08604
G1 X115.71 Y101.79 E.21263
G1 X115.712 Y104.612 E.08672
G2 X116.954 Y105.79 I1.239 J-.063 E.05804
G1 X144.044 Y105.79 E.83242
G2 X145.288 Y104.612 I.005 J-1.241 E.0581
G1 X145.29 Y101.79 E.08672
G1 X152.21 Y101.79 E.21263
G1 X152.211 Y104.59 E.08604
G2 X153.455 Y105.79 I1.242 J-.043 E.05873
G1 X168.71 Y105.79 E.46874
G1 X168.71 Y132.15 E.80997
M204 S10000
; WIPE_START
G1 F24000
G1 X166.71 Y132.163 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.313 J-1.176 P1  F30000
G1 X55.624 Y102.569 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
G1 X200.166 Y98.606 E4.64931
G3 X204.398 Y103.007 I-.168 J4.397 E.22384
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.411 J-.006 E.22946
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I.006 J-4.411 E.22946
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.234 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.183 Y98.215 E4.30736
G3 X204.79 Y103.003 I-.185 J4.788 E.22558
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.804 J-.012 E.23117
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.012 J-4.804 E.23117
G1 X55.21 Y103.003 E1.5362
G3 X55.229 Y102.59 I4.804 J.012 E.01268
M204 S10000
; WIPE_START
G1 F24000
G1 X55.302 Y102.066 E-.20136
G1 X55.416 Y101.61 E-.17863
G1 X55.575 Y101.167 E-.17862
G1 X55.776 Y100.742 E-.17863
G1 X55.806 Y100.691 E-.02276
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.24 J1.193 P1  F30000
G1 X90.55 Y107.671 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X90.55 Y106.043 E.05401
G1 X55.952 Y140.641 E1.62306
G1 X55.952 Y138.388 E.07474
G1 X74.614 Y157.05 E.87548
G1 X77.922 Y157.05 E.10975
G1 X101.912 Y133.06 E1.12541
G3 X102.068 Y133.263 I-.292 J.385 E.00859
G2 X104.039 Y138.609 I38.682 J-11.224 E.18918
G1 X85.598 Y157.05 E.86509
G1 X82.29 Y157.05 E.10975
G1 X55.953 Y130.712 E1.23553
G1 X55.953 Y132.964 E.07468
G1 X89.965 Y98.951 E1.5956
G1 X93.275 Y98.951 E.10981
G1 X99.374 Y105.05 E.28608
G1 X99.219 Y105.05 E.00515
G1 X105.317 Y98.952 E.28607
G1 X108.628 Y98.952 E.10984
G1 X110.726 Y101.05 E.09841
G1 X110.895 Y101.05 E.0056
G1 X112.992 Y98.952 E.09841
G1 X116.304 Y98.952 E.10986
G1 X122.398 Y105.047 E.28591
G1 X122.25 Y105.047 E.00494
G1 X128.344 Y98.952 E.28589
G1 X131.656 Y98.953 E.10989
G1 X137.748 Y105.044 E.28578
G1 X137.604 Y105.044 E.0048
G1 X143.695 Y98.953 E.28577
G1 X147.009 Y98.953 E.10992
G1 X149.105 Y101.05 E.09836
G1 X149.274 Y101.05 E.0056
G1 X151.371 Y98.953 E.09835
G1 X154.685 Y98.953 E.10993
G1 X160.781 Y105.05 E.286
G1 X160.626 Y105.05 E.00514
G1 X166.722 Y98.954 E.28598
G1 X170.037 Y98.954 E.10996
G1 X204.044 Y132.96 E1.59533
G1 X204.044 Y130.716 E.07447
G1 X177.71 Y157.05 E1.23539
G1 X174.402 Y157.05 E.10975
G1 X156.626 Y139.274 E.8339
G2 X158.787 Y133.759 I-26.603 J-13.605 E.19681
G1 X182.078 Y157.05 E1.09262
G1 X185.386 Y157.05 E.10975
G1 X204.044 Y138.391 E.87529
G1 X204.044 Y140.636 E.07447
G1 X169.45 Y106.043 E1.62287
G1 X169.45 Y107.671 E.05401
; WIPE_START
G1 F24000
G1 X169.45 Y106.043 E-.61876
G1 X169.713 Y106.305 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.091 J-.539 P1  F30000
G1 X148.662 Y148.955 Z6
G1 Z5.6
G1 E.8 F1800
G1 F15476.087
G2 X149.913 Y147.913 I-49.188 J-60.314 E.05401
G1 X159.05 Y157.05 E.42861
G1 X162.358 Y157.05 E.10975
G1 X204.044 Y115.364 E1.95558
G1 X204.044 Y117.609 E.07447
G1 X185.39 Y98.954 E.87512
G1 X182.074 Y98.954 E.11
G1 X169.45 Y111.578 E.5922
G1 X169.45 Y113.719 E.07102
G1 X204.044 Y148.312 E1.62287
G1 X204.044 Y146.067 E.07447
G1 X193.062 Y157.05 E.5152
G1 X189.754 Y157.05 E.10975
G1 X165.654 Y132.95 E1.13054
G1 X163.429 Y132.951 E.07381
G1 X156.074 Y140.306 E.34507
G3 X153.635 Y143.959 I-40.836 J-24.617 E.14574
G1 X166.726 Y157.05 E.6141
G1 X170.034 Y157.05 E.10975
G1 X204.044 Y123.04 E1.59548
G1 X204.044 Y125.285 E.07447
G1 X177.714 Y98.954 E1.23522
G1 X174.398 Y98.954 E.10998
G1 X168.302 Y105.05 E.28597
G1 X168.457 Y105.05 E.00514
G1 X162.361 Y98.953 E.28599
G1 X159.047 Y98.953 E.10995
G1 X153.101 Y104.899 E.27893
G2 X153.335 Y105.033 I.345 J-.333 E.00905
G2 X154.69 Y105.05 I.753 J-6.011 E.04506
; WIPE_START
G1 F24000
G1 X153.335 Y105.033 E-.51511
G1 X153.101 Y104.899 E-.1023
G1 X153.366 Y104.634 E-.14258
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.281 J-1.184 P1  F30000
G1 X144.549 Y102.54 Z6
G1 Z5.6
G1 E.8 F1800
G1 F15476.087
G1 X144.548 Y104.168 E.05401
G1 X139.333 Y98.953 E.24468
G1 X136.019 Y98.953 E.1099
G1 X129.927 Y105.045 E.28583
G1 X130.073 Y105.045 E.00487
G1 X123.98 Y98.952 E.28584
G1 X120.668 Y98.952 E.10987
G1 X116.451 Y103.169 E.19782
G1 X116.45 Y101.541 E.05401
; WIPE_START
G1 F24000
G1 X116.451 Y103.169 E-.61876
G1 X116.714 Y102.906 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.088 J-1.214 P1  F30000
G1 X108.047 Y102.275 Z6
G1 Z5.6
G1 E.8 F1800
G1 F15476.087
G1 X108.041 Y103.903 E.05401
G1 X106.895 Y105.05 E.0538
G1 X107.05 Y105.05 E.00515
G1 X100.952 Y98.952 E.28607
G1 X97.641 Y98.951 E.10983
G1 X91.543 Y105.05 E.28608
G1 X91.698 Y105.05 E.00515
G1 X85.599 Y98.951 E.28609
G1 X82.289 Y98.951 E.10979
G1 X55.953 Y125.287 E1.23547
G1 X55.954 Y123.037 E.07463
G1 X89.966 Y157.05 E1.59559
G1 X93.274 Y157.05 E.10975
G1 X106.933 Y143.391 E.64077
G1 X106.727 Y143.107 E.01164
G1 X96.571 Y132.951 E.47645
G1 X94.346 Y132.95 E.07381
G1 X70.246 Y157.05 E1.13054
G1 X66.938 Y157.05 E.10975
G1 X55.951 Y146.063 E.51542
M73 P56 R21
G1 X55.951 Y148.317 E.07479
G1 X90.55 Y113.719 E1.6231
M73 P56 R20
G1 X90.55 Y111.578 E.07102
G1 X77.923 Y98.951 E.59234
G1 X74.614 Y98.951 E.10978
G1 X55.954 Y117.61 E.87535
G1 X55.954 Y115.362 E.07457
G1 X97.642 Y157.05 E1.95565
G1 X100.95 Y157.05 E.10975
G1 X110.566 Y147.434 E.4511
G2 X113.297 Y149.676 I20.829 J-22.576 E.11727
G1 X120.67 Y157.05 E.3459
G1 X123.978 Y157.05 E.10975
G1 X126.118 Y154.91 E.10039
G1 X126.221 Y154.925 E.00345
G1 X128.346 Y157.05 E.09967
G1 X131.654 Y157.05 E.10975
G1 X133.632 Y155.072 E.09279
G1 X134.007 Y155.034 E.01248
G1 X136.022 Y157.05 E.09454
G1 X139.33 Y157.05 E.10975
G1 X144.924 Y151.456 E.26241
G2 X145.464 Y151.14 I-2.909 J-5.603 E.02078
G1 X151.374 Y157.05 E.27722
G1 X154.682 Y157.05 E.10975
G1 X204.044 Y107.688 E2.31568
G1 X204.044 Y109.933 E.07447
G1 X193.066 Y98.954 E.51501
G1 X189.75 Y98.954 E.11001
G1 X169.45 Y119.254 E.95228
G1 X169.45 Y121.395 E.07102
G1 X203.339 Y155.284 E1.58981
G2 X203.961 Y153.827 I-5.684 J-3.284 E.05266
G1 X200.825 Y156.962 E.14709
G3 X199.984 Y157.05 I-.953 J-5.089 E.02808
G1 X197.429 Y157.05 E.08474
G1 X169.45 Y129.071 E1.31256
G1 X169.45 Y126.929 E.07102
G1 X197.425 Y98.955 E1.31236
G1 X200.154 Y98.955 E.09053
G3 X200.825 Y99.038 I-.35 J5.582 E.02243
G1 X203.958 Y102.171 E.14699
G2 X203.341 Y100.715 I-4.056 J.863 E.05278
G1 X147.006 Y157.05 E2.64276
G1 X143.698 Y157.05 E.10975
G1 X140.229 Y153.581 E.16272
G3 X138.679 Y154.08 I-5.797 J-15.357 E.05402
; WIPE_START
G1 F24000
G1 X140.229 Y153.581 E-.61861
G1 X140.492 Y153.844 E-.14139
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I0 J-1.217 P1  F30000
G1 X121.574 Y153.851 Z6
G1 Z5.6
G1 E.8 F1800
G1 F15476.087
G3 X120.037 Y153.315 I4.623 J-15.75 E.05402
G1 X116.302 Y157.05 E.17519
G1 X112.994 Y157.05 E.10975
G1 X56.661 Y100.716 E2.64271
G2 X56.04 Y102.173 I5.677 J3.281 E.05265
G1 X59.175 Y99.038 E.14708
G3 X60.016 Y98.95 I.953 J5.089 E.02808
G1 X62.571 Y98.95 E.08474
G1 X90.55 Y126.929 E1.31256
G1 X90.55 Y129.071 E.07102
G1 X62.57 Y157.05 E1.31256
G3 X59.406 Y157.005 I-1.275 J-21.636 E.10508
G1 X59.162 Y156.95 E.00828
G1 X56.038 Y153.825 E.14659
G2 X56.666 Y155.278 I5.603 J-1.561 E.05268
G1 X90.55 Y121.395 E1.58955
G1 X90.55 Y119.254 E.07102
G1 X70.247 Y98.951 E.95245
G1 X66.938 Y98.951 E.10976
G1 X55.955 Y109.933 E.51523
G1 X55.955 Y107.687 E.07451
G1 X105.318 Y157.05 E2.3157
G1 X108.626 Y157.05 E.10975
G1 X114.913 Y150.763 E.29494
G2 X116.317 Y151.587 I9 J-13.728 E.05402
M106 S237.15
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.913 Y150.763 E-.6186
G1 X114.65 Y151.026 E-.1414
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/105
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
G3 Z6 I.39 J1.153 P1  F30000
G1 X169.115 Y132.615 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X159.432 Y132.615 E.32124
G2 X158.572 Y133.283 I-.016 J.866 E.03902
G3 X102.426 Y133.278 I-28.072 J-7.414 E2.52858
G2 X101.568 Y132.616 I-.841 J.202 E.03886
G1 X90.885 Y132.615 E.3544
G1 X90.885 Y105.385 E.9033
G1 X107.354 Y105.385 E.54632
G2 X107.903 Y105.279 I.013 J-1.409 E.01867
G2 X108.385 Y104.354 I-.479 J-.838 E.03655
G1 X108.385 Y101.385 E.0985
G1 X116.115 Y101.385 E.25645
G1 X116.115 Y104.354 E.0985
G2 X116.221 Y104.903 I1.409 J.013 E.01866
G2 X117.146 Y105.385 I.834 J-.472 E.03657
G1 X143.854 Y105.385 E.88595
G2 X144.312 Y105.316 I-.08 J-2.093 E.01538
G2 X144.885 Y104.354 I-.365 J-.869 E.03978
G1 X144.885 Y101.385 E.0985
G1 X152.615 Y101.385 E.25645
G1 X152.615 Y104.354 E.0985
G2 X152.722 Y104.903 I1.402 J.014 E.01869
G2 X153.646 Y105.385 I.834 J-.472 E.03655
G1 X169.115 Y105.385 E.51315
G1 X169.115 Y132.555 E.90131
G1 X168.723 Y132.223 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X159.418 Y132.223 E.28594
G2 X158.198 Y133.165 I-.006 J1.253 E.05097
G3 X102.801 Y133.163 I-27.698 J-7.296 E2.31167
G2 X101.582 Y132.224 I-1.213 J.313 E.05092
G1 X91.277 Y132.223 E.31667
G1 X91.277 Y105.777 E.81264
G1 X107.361 Y105.777 E.49423
G2 X108.07 Y105.634 I.005 J-1.805 E.02238
G2 X108.777 Y104.361 I-.629 J-1.182 E.04729
G1 X108.777 Y101.777 E.07941
G1 X115.723 Y101.777 E.21346
G1 X115.723 Y104.361 E.07941
G2 X115.866 Y105.07 I1.805 J.005 E.02238
G2 X117.139 Y105.777 I1.182 J-.63 E.04729
G1 X143.861 Y105.777 E.8211
G2 X144.439 Y105.687 I-.106 J-2.604 E.01799
G2 X145.277 Y104.361 I-.486 J-1.235 E.05158
G1 X145.277 Y101.777 E.07941
G1 X152.223 Y101.777 E.21346
G1 X152.223 Y104.361 E.07941
G2 X152.366 Y105.07 I1.803 J.006 E.02238
G2 X153.639 Y105.777 I1.184 J-.633 E.04727
G1 X168.723 Y105.777 E.4635
G1 X168.723 Y132.163 E.81079
M204 S10000
; WIPE_START
G1 F24000
G1 X166.723 Y132.176 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.313 J-1.176 P1  F30000
G1 X55.624 Y102.569 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
G1 X200.173 Y98.606 E4.64953
G3 X204.398 Y103.007 I-.175 J4.397 E.22362
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.411 J-.006 E.22946
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I.006 J-4.411 E.22946
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.234 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.19 Y98.215 E4.30758
G3 X204.79 Y103.003 I-.192 J4.788 E.22537
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.804 J-.012 E.23117
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.012 J-4.804 E.23117
G1 X55.21 Y103.003 E1.5362
G3 X55.229 Y102.59 I4.804 J.012 E.01268
M204 S10000
; WIPE_START
G1 F24000
G1 X55.302 Y102.066 E-.20136
G1 X55.416 Y101.61 E-.17862
G1 X55.575 Y101.167 E-.17863
G1 X55.776 Y100.742 E-.17862
G1 X55.806 Y100.691 E-.02277
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.186 J.272 P1  F30000
G1 X56.363 Y103.116 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X56.363 Y102.844 E.00901
G3 X56.641 Y101.618 I5.186 J.533 E.0418
G1 X58.544 Y99.668 E.09037
G3 X60.128 Y99.357 I1.494 J3.417 E.05399
G1 X56.953 Y101.009 F30000
G1 F15476.087
G1 X62.781 Y106.837 E.27342
G1 X59.051 Y106.837 E.12373
G1 X66.531 Y99.358 E.35088
G1 X62.978 Y99.358 E.11786
G1 X89.76 Y126.14 E1.25642
G1 X89.76 Y129.86 E.1234
G1 X62.978 Y156.643 E1.25642
G1 X66.531 Y156.643 E.11787
G1 X56.358 Y146.47 E.47723
G1 X56.358 Y147.91 E.04778
G1 X89.76 Y114.508 E1.56696
G1 X89.76 Y110.788 E.1234
G1 X78.33 Y99.358 E.5362
G1 X81.882 Y99.358 E.11782
G1 X64.163 Y117.077 E.83125
G1 X64.163 Y115.895 E.03924
G1 X104.911 Y156.643 E1.91157
G1 X101.357 Y156.643 E.11787
G1 X110.008 Y147.992 E.4058
G2 X111.231 Y149.066 I11.435 J-11.797 E.05402
; WIPE_START
G1 F24000
G1 X110.008 Y147.992 E-.61857
G1 X109.744 Y148.256 E-.14143
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.088 J-.546 P1  F30000
G1 X89.76 Y108.461 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F15476.087
G1 X89.76 Y106.832 E.05401
G1 X56.359 Y140.233 E1.56692
G1 X56.359 Y138.795 E.04773
G1 X74.207 Y156.643 E.83728
G1 X70.654 Y156.643 E.11787
G1 X93.556 Y133.74 E1.07441
G1 X97.36 Y133.74 E.12618
G1 X104.131 Y140.511 E.31764
G2 X106.369 Y143.956 I28.466 J-16.041 E.13635
G1 X93.681 Y156.643 E.59518
G1 X97.235 Y156.643 E.11787
G1 X64.163 Y123.571 E1.55147
G1 X64.163 Y124.753 E.03924
G1 X89.558 Y99.359 E1.19133
G1 X86.006 Y99.358 E.1178
G1 X90.908 Y104.26 E.22994
G1 X92.333 Y104.26 E.04726
G1 X97.233 Y99.359 E.2299
G1 X93.683 Y99.359 E.11779
G1 X98.582 Y104.258 E.22982
G1 X100.011 Y104.257 E.04742
G1 X104.909 Y99.359 E.22978
G1 X101.359 Y99.359 E.11777
G1 X106.255 Y104.255 E.2297
G1 X107.255 Y104.255 E.03315
G1 X107.256 Y103.626 E.02086
G1 X107.61 Y98.952 F30000
G1 F15476.087
G1 X60.016 Y98.95 E1.5788
G2 X56.269 Y101.453 I.02 J4.085 E.15833
G1 X56.269 Y101.453 E0
G2 X55.956 Y102.844 I5.216 J1.906 E.04742
G1 X55.955 Y107.244 E.14596
G1 X63.756 Y107.244 E.25875
G1 X63.756 Y130.756 E.77992
G1 X55.953 Y130.756 E.25884
G1 X55.95 Y152.984 E.73736
G2 X60.02 Y157.05 I4.079 J-.013 E.21179
G1 X125.539 Y157.05 E2.17337
G1 X125.717 Y155.254 E.05986
G3 X101.725 Y133.453 I4.858 J-29.448 E1.13676
G2 X101.525 Y133.333 I-.197 J.101 E.00817
G1 X90.167 Y133.333 E.37677
G1 X90.167 Y104.667 E.95089
G1 X107.468 Y104.662 E.5739
G2 X107.661 Y104.477 I-.046 J-.242 E.00939
G1 X107.67 Y98.952 E.18327
G1 X108.076 Y100.03 F30000
G1 F15476.087
G1 X108.078 Y98.952 E.03576
G1 X108.628 Y98.952 E.01826
G1 X110.712 Y101.036 E.09778
G1 X110.908 Y101.036 E.00649
G1 X112.992 Y98.952 E.09778
G1 X116.304 Y98.952 E.10986
G1 X116.423 Y99.071 E.00558
G1 X116.425 Y100.699 E.05401
G1 X121.889 Y99.36 F30000
G1 F15476.087
G1 X120.261 Y99.36 E.05401
G1 X117.242 Y102.378 E.14161
G1 X117.238 Y99.886 E.08266
G1 X121.611 Y104.259 E.20515
G1 X123.037 Y104.259 E.04729
G1 X127.936 Y99.36 E.22984
G1 X124.388 Y99.36 E.11771
G1 X129.286 Y104.258 E.22978
G1 X130.715 Y104.258 E.0474
G1 X135.612 Y99.36 E.22975
G1 X132.064 Y99.36 E.11769
G1 X136.96 Y104.256 E.22969
G1 X138.392 Y104.256 E.0475
G1 X143.288 Y99.36 E.22966
G1 X139.74 Y99.36 E.11768
G1 X143.757 Y103.377 E.18842
G1 X143.755 Y104.255 E.02913
G1 X143.005 Y104.255 E.02489
G1 X144.11 Y98.953 F30000
G1 F15476.087
G1 X116.83 Y98.952 E.90493
G1 X116.838 Y104.468 E.18295
G2 X117.07 Y104.668 I.274 J-.083 E.01072
G1 X143.975 Y104.662 E.89248
G2 X144.162 Y104.468 I-.054 J-.24 E.00947
G1 X144.17 Y98.953 E.18292
G1 X145.381 Y98.953 F30000
G1 F15476.087
G1 X147.009 Y98.953 E.05401
G1 X149.092 Y101.036 E.09773
G1 X149.288 Y101.036 E.00649
G1 X151.371 Y98.953 E.09772
G1 X152.922 Y98.953 E.05147
G1 X152.923 Y99.03 E.00254
G1 X153.743 Y102.626 F30000
G1 F15476.087
G1 X153.745 Y104.255 E.05401
G1 X158.639 Y99.361 E.22958
G1 X155.093 Y99.361 E.11764
G1 X159.989 Y104.257 E.2297
G1 X161.418 Y104.258 E.04741
G1 X166.315 Y99.361 E.2297
G1 X162.769 Y99.361 E.11762
G1 X167.667 Y104.26 E.22979
G1 X169.092 Y104.26 E.04726
G1 X173.99 Y99.362 E.22979
G1 X170.445 Y99.361 E.1176
G1 X195.837 Y124.753 E1.19119
G1 X195.837 Y123.571 E.03924
G1 X162.765 Y156.643 E1.55147
G1 X166.319 Y156.643 E.11787
G1 X154.197 Y144.521 E.56867
G3 X150.472 Y148.472 I-31.411 J-25.882 E.18026
G1 X158.643 Y156.643 E.38331
G1 X155.089 Y156.643 E.11787
G1 X195.837 Y115.895 E1.91157
G1 X195.837 Y117.077 E.03924
G1 X178.121 Y99.362 E.83108
G1 X181.666 Y99.362 E.11758
G1 X170.24 Y110.788 E.53602
G1 X170.24 Y114.508 E.1234
G1 X203.637 Y147.905 E1.56673
G1 X203.637 Y146.475 E.04746
G1 X193.469 Y156.643 E.477
G1 X197.022 Y156.643 E.11787
G1 X170.24 Y129.86 E1.25642
G1 X170.24 Y126.14 E.1234
G1 X197.017 Y99.362 E1.25619
G1 X193.474 Y99.362 E.11755
G1 X200.949 Y106.837 E.35066
G1 X197.219 Y106.837 E.12373
G1 X203.047 Y101.009 E.27342
G1 X203.637 Y103.137 F30000
G1 F15476.087
G2 X203.338 Y101.55 I-4.482 J.024 E.05386
G1 X201.45 Y99.662 E.08855
G2 X199.863 Y99.362 I-1.471 J3.436 E.054
G1 X200.111 Y98.955 F30000
G1 F15476.087
G1 X153.33 Y98.954 E1.55183
G1 X153.339 Y104.477 E.18321
G2 X153.535 Y104.663 I.24 J-.057 E.00948
G1 X169.833 Y104.667 E.54064
G1 X169.833 Y133.333 E.95089
G1 X159.493 Y133.332 E.34299
G2 X159.322 Y133.382 I-.016 J.265 E.00604
G3 X135.283 Y155.254 I-29.056 J-7.788 E1.13891
G1 X135.462 Y157.05 E.05985
G1 X199.984 Y157.05 E2.14033
G2 X200.726 Y156.981 I.023 J-3.785 E.02475
G1 X200.726 Y156.981 E0
G2 X204.044 Y153.194 I-.726 J-3.983 E.18024
G1 X204.044 Y130.756 E.74433
G1 X196.244 Y130.756 E.25874
G1 X196.244 Y107.244 E.77992
G1 X204.044 Y107.244 E.25874
G1 X204.044 Y102.801 E.14738
G2 X200.171 Y98.955 I-4.056 J.211 E.19855
G1 X200.135 Y107.651 F30000
G1 F15476.087
G1 X201.763 Y107.651 E.05401
G1 X204.044 Y109.933 E.10702
G1 X204.044 Y107.688 E.07447
G1 X196.651 Y115.08 E.34682
G1 X196.651 Y117.892 E.09325
G1 X204.044 Y125.285 E.34682
G1 X204.044 Y123.04 E.07447
G1 X196.735 Y130.349 E.34289
G1 X201.432 Y130.349 E.15582
G1 X196.651 Y125.568 E.22429
G1 X196.651 Y122.756 E.09325
G1 X204.044 Y115.364 E.34682
G1 X204.044 Y117.609 E.07447
G1 X196.651 Y110.216 E.34682
G1 X196.651 Y108.587 E.05401
G1 X195.837 Y129.618 F30000
G1 F15476.087
G1 X195.837 Y131.163 E.05124
G1 X195.921 Y131.163 E.00278
G1 X170.441 Y156.643 E1.19531
G1 X173.995 Y156.643 E.11787
G1 X157.211 Y139.859 E.78735
G2 X157.879 Y138.501 I-13.344 J-7.405 E.05021
G1 X162.64 Y133.74 E.22337
G1 X159.615 Y133.739 E.10036
G1 X159.423 Y134.395 E.02266
G1 X181.67 Y156.643 E1.04368
G1 X178.117 Y156.643 E.11787
G1 X203.597 Y131.163 E1.19531
G1 X202.247 Y131.163 E.04479
G1 X203.637 Y132.553 E.06523
G1 X203.637 Y134.182 E.05401
G1 X199.864 Y156.643 F30000
G1 F15476.087
G2 X201.45 Y156.337 I.077 J-3.873 E.05398
G1 X203.321 Y154.466 E.08777
G2 X203.637 Y152.884 I-5.453 J-1.912 E.0537
G1 X203.04 Y154.984 F30000
G1 F15476.087
G1 X170.24 Y122.184 E1.53872
G1 X170.24 Y118.464 E.1234
G1 X189.342 Y99.362 E.89611
G1 X185.798 Y99.362 E.11757
G1 X195.837 Y109.402 E.47097
G1 X195.837 Y108.219 E.03924
G1 X147.413 Y156.643 E2.27167
G1 X150.967 Y156.643 E.11787
G1 X146.039 Y151.715 E.23117
G3 X143.115 Y153.265 I-16.066 J-26.77 E.10985
G1 X139.737 Y156.643 E.15844
G1 X143.291 Y156.643 E.11787
G1 X140.845 Y154.197 E.11472
G3 X139.302 Y154.714 I-5.979 J-15.287 E.05402
G1 X134.506 Y157.05 F30000
G1 F15476.087
G1 X135.052 Y157.05 E.01813
G1 X134.945 Y155.973 E.03588
G1 X134.019 Y155.047 E.04345
G1 X133.617 Y155.087 E.0134
G1 X131.654 Y157.05 E.09208
G1 X128.346 Y157.05 E.10975
G1 X126.237 Y154.941 E.09891
G2 X127.854 Y155.134 I2.749 J-16.199 E.05402
G1 X122.757 Y156.643 F30000
G1 F15476.087
G1 X124.385 Y156.643 E.05401
G1 X125.257 Y155.771 E.04088
G1 X125.276 Y155.58 E.00636
G3 X119.425 Y153.927 I5.664 J-31.209 E.20198
G1 X116.709 Y156.643 E.12741
G1 X120.263 Y156.643 E.11787
G1 X115.853 Y152.233 E.20687
G3 X114.339 Y151.337 I8.271 J-15.715 E.05839
G1 X109.033 Y156.643 E.24888
G1 X112.587 Y156.643 E.11787
G1 X64.163 Y108.219 E2.27167
G1 X64.163 Y109.402 E.03924
G1 X74.206 Y99.358 E.47116
G1 X70.654 Y99.358 E.11784
G1 X89.76 Y118.464 E.89631
G1 X89.76 Y122.184 E.1234
G1 X56.958 Y154.986 E1.5388
G1 X56.357 Y152.872 F30000
G1 F15476.087
G2 X56.668 Y154.456 I3.728 J.091 E.05399
G1 X58.541 Y156.328 E.08783
G2 X60.126 Y156.643 I1.554 J-3.685 E.05397
G1 X56.359 Y134.185 F30000
G1 F15476.087
G1 X56.36 Y132.557 E.05401
G1 X57.753 Y131.163 E.06538
G1 X56.403 Y131.163 E.04479
G1 X81.883 Y156.643 E1.19531
G1 X78.33 Y156.643 E.11787
G1 X101.232 Y133.74 E1.07442
G1 X101.385 Y133.74 E.00507
G2 X103.446 Y139.202 I31.002 J-8.579 E.19392
M73 P57 R20
G1 X86.005 Y156.643 E.81819
G1 X89.559 Y156.643 E.11787
G1 X64.079 Y131.163 E1.19531
G1 X64.163 Y131.163 E.00278
G1 X64.163 Y129.618 E.05124
G1 X63.349 Y108.587 F30000
G1 F15476.087
G1 X63.349 Y110.216 E.05401
G1 X55.954 Y117.61 E.34689
G1 X55.954 Y115.362 E.07457
G1 X63.349 Y122.756 E.34688
G1 X63.349 Y125.568 E.09325
G1 X58.568 Y130.349 E.22429
G1 X63.265 Y130.349 E.15582
G1 X55.954 Y123.037 E.34299
G1 X55.953 Y125.287 E.07463
G1 X63.349 Y117.892 E.34693
G1 X63.349 Y115.08 E.09325
G1 X55.955 Y107.687 E.34684
G1 X55.955 Y109.933 E.07451
G1 X58.237 Y107.651 E.10706
G1 X59.865 Y107.651 E.05401
; WIPE_START
G1 F24000
G1 X58.237 Y107.651 E-.61876
G1 X57.974 Y107.914 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.286 J1.183 P1  F30000
G1 X164.815 Y133.74 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F15476.087
G1 X166.444 Y133.74 E.05401
G1 X189.346 Y156.643 E1.07442
G1 X185.793 Y156.643 E.11787
G1 X203.637 Y138.799 E.8371
G1 X203.637 Y140.229 E.04746
G1 X170.24 Y106.832 E1.56673
G1 X170.24 Y108.461 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X170.24 Y106.832 E-.61876
G1 X170.503 Y107.095 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/105
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
G3 Z6.2 I-1.215 J-.064 P1  F30000
G1 X169.156 Y132.656 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X159.452 Y132.657 E.32191
G2 X158.607 Y133.312 I-.015 J.853 E.03835
G3 X102.393 Y133.313 I-28.107 J-7.443 E2.53066
G2 X101.549 Y132.657 I-.823 J.188 E.03842
G1 X90.844 Y132.656 E.3551
G1 X90.844 Y105.344 E.90602
G1 X107.372 Y105.343 E.54827
G2 X108.343 Y104.372 I.021 J-.95 E.05094
G1 X108.344 Y101.344 E.10045
G1 X116.156 Y101.344 E.25916
G1 X116.157 Y104.372 E.10045
G2 X117.128 Y105.343 I.941 J.031 E.05109
G1 X143.868 Y105.343 E.887
G2 X144.843 Y104.372 I.035 J-.941 E.05124
G1 X144.844 Y101.344 E.10045
G1 X152.656 Y101.344 E.25916
G1 X152.657 Y104.372 E.10045
G2 X153.628 Y105.343 I.95 J.021 E.05094
G1 X169.156 Y105.344 E.5151
G1 X169.156 Y132.596 E.90403
G1 X168.764 Y132.264 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X159.438 Y132.264 E.28657
G2 X158.233 Y133.194 I.002 J1.248 E.05031
G3 X102.767 Y133.194 I-27.733 J-7.326 E2.31368
G2 X101.562 Y132.264 I-1.196 J.304 E.05041
G1 X91.236 Y132.264 E.3173
G1 X91.236 Y105.736 E.81515
G1 X107.383 Y105.735 E.49617
G2 X108.735 Y104.383 I.005 J-1.347 E.06533
G1 X108.736 Y101.736 E.08136
G1 X115.764 Y101.736 E.21597
G1 X115.765 Y104.383 E.08136
G2 X117.117 Y105.735 I1.332 J.02 E.06554
G1 X143.882 Y105.735 E.82242
G2 X145.235 Y104.383 I.022 J-1.332 E.06558
G1 X145.236 Y101.736 E.08136
G1 X152.264 Y101.736 E.21597
G1 X152.265 Y104.383 E.08136
G2 X153.617 Y105.735 I1.347 J.005 E.06533
G1 X168.764 Y105.736 E.46545
G1 X168.764 Y132.204 E.81331
M204 S10000
; WIPE_START
G1 F24000
G1 X166.764 Y132.217 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.314 J-1.176 P1  F30000
G1 X55.624 Y102.569 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
G1 X200.179 Y98.607 E4.64976
G3 X204.398 Y103.007 I-.181 J4.396 E.2234
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.411 J-.006 E.22946
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I.006 J-4.411 E.22946
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.234 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.197 Y98.215 E4.30779
G3 X204.79 Y103.003 I-.2 J4.788 E.22516
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.804 J-.012 E.23117
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.012 J-4.804 E.23117
G1 X55.21 Y103.003 E1.5362
G3 X55.229 Y102.59 I4.804 J.012 E.01268
M204 S10000
; WIPE_START
G1 F24000
G1 X55.302 Y102.066 E-.20136
G1 X55.416 Y101.61 E-.17864
G1 X55.575 Y101.167 E-.17862
G1 X55.776 Y100.742 E-.17862
G1 X55.806 Y100.691 E-.02277
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.186 J.272 P1  F30000
G1 X56.363 Y103.116 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X56.41 Y102.451 E.02212
G3 X56.679 Y101.534 I3.687 J.584 E.03179
G1 X58.544 Y99.668 E.0875
G3 X60.128 Y99.357 I1.494 J3.417 E.05399
G1 X56.953 Y101.009 F30000
G1 F15476.087
G1 X62.781 Y106.837 E.27342
G1 X59.051 Y106.837 E.12373
G1 X66.531 Y99.358 E.35088
G1 X62.978 Y99.358 E.11786
G1 X89.76 Y126.14 E1.25642
G1 X89.76 Y129.86 E.1234
G1 X62.978 Y156.643 E1.25642
G1 X66.531 Y156.643 E.11787
G1 X56.358 Y146.47 E.47723
G1 X56.358 Y147.91 E.04778
G1 X89.76 Y114.508 E1.56696
G1 X89.76 Y110.788 E.1234
G1 X78.33 Y99.358 E.5362
G1 X81.882 Y99.358 E.11782
G1 X64.163 Y117.077 E.83125
G1 X64.163 Y115.895 E.03924
G1 X104.911 Y156.643 E1.91157
G1 X101.357 Y156.643 E.11787
G1 X110.008 Y147.992 E.4058
G2 X111.231 Y149.066 I11.435 J-11.797 E.05402
; WIPE_START
G1 F24000
G1 X110.008 Y147.992 E-.61857
G1 X109.744 Y148.256 E-.14143
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.088 J-.546 P1  F30000
G1 X89.76 Y108.461 Z6.4
G1 Z6
G1 E.8 F1800
G1 F15476.087
G1 X89.76 Y106.832 E.05401
G1 X56.359 Y140.233 E1.56692
G1 X56.359 Y138.795 E.04773
G1 X74.207 Y156.643 E.83728
G1 X70.654 Y156.643 E.11787
G1 X93.556 Y133.74 E1.07441
G1 X97.36 Y133.74 E.12618
G1 X104.131 Y140.511 E.31764
G2 X106.369 Y143.956 I28.466 J-16.041 E.13635
G1 X93.681 Y156.643 E.59518
G1 X97.235 Y156.643 E.11787
G1 X64.163 Y123.571 E1.55147
G1 X64.163 Y124.753 E.03924
G1 X89.558 Y99.359 E1.19133
G1 X86.006 Y99.358 E.1178
G1 X90.908 Y104.26 E.22994
G1 X92.333 Y104.26 E.04726
G1 X97.233 Y99.359 E.2299
G1 X93.683 Y99.359 E.11779
G1 X98.582 Y104.258 E.22982
G1 X100.011 Y104.257 E.04742
G1 X104.909 Y99.359 E.22978
G1 X101.359 Y99.359 E.11777
G1 X106.255 Y104.255 E.2297
G1 X107.255 Y104.255 E.03315
G1 X107.256 Y103.626 E.02086
G1 X107.61 Y98.952 F30000
G1 F15476.087
G1 X60.016 Y98.95 E1.57879
G2 X56.319 Y101.34 I-.01 J4.038 E.15444
G1 X56.319 Y101.34 E0
G2 X55.956 Y102.834 I3.77 J1.708 E.05129
G1 X55.955 Y107.244 E.14629
G1 X63.756 Y107.244 E.25875
G1 X63.756 Y130.756 E.77992
G1 X55.953 Y130.756 E.25884
G1 X55.95 Y152.984 E.73736
G2 X59.974 Y157.046 I4.053 J.009 E.21054
G1 X125.539 Y157.05 E2.17488
G1 X125.717 Y155.254 E.05986
G3 X101.725 Y133.453 I4.858 J-29.448 E1.13676
G2 X101.525 Y133.333 I-.197 J.101 E.00817
G1 X90.167 Y133.333 E.37677
G1 X90.167 Y104.667 E.95089
G1 X107.468 Y104.662 E.5739
G2 X107.661 Y104.477 I-.046 J-.242 E.00939
G1 X107.67 Y98.952 E.18327
G1 X108.076 Y100.03 F30000
G1 F15476.087
G1 X108.078 Y98.952 E.03576
G1 X108.628 Y98.952 E.01826
G1 X110.671 Y100.995 E.09586
G1 X110.949 Y100.995 E.00921
G1 X112.992 Y98.952 E.09585
G1 X116.304 Y98.952 E.10986
G1 X116.423 Y99.071 E.00558
G1 X116.425 Y100.699 E.05401
G1 X121.889 Y99.36 F30000
G1 F15476.087
G1 X120.261 Y99.36 E.05401
G1 X117.242 Y102.378 E.14161
G1 X117.238 Y99.886 E.08266
G1 X121.611 Y104.259 E.20515
G1 X123.037 Y104.259 E.04729
G1 X127.936 Y99.36 E.22984
G1 X124.388 Y99.36 E.11771
G1 X129.286 Y104.258 E.22978
G1 X130.715 Y104.258 E.0474
G1 X135.612 Y99.36 E.22975
G1 X132.064 Y99.36 E.11769
G1 X136.96 Y104.256 E.22969
G1 X138.392 Y104.256 E.0475
G1 X143.288 Y99.36 E.22966
G1 X139.74 Y99.36 E.11768
G1 X143.757 Y103.377 E.18842
G1 X143.755 Y104.255 E.02913
G1 X143.005 Y104.255 E.02489
G1 X144.11 Y98.953 F30000
G1 F15476.087
G1 X116.83 Y98.952 E.90493
G1 X116.838 Y104.468 E.18295
G2 X117.07 Y104.668 I.274 J-.083 E.01072
G1 X143.975 Y104.662 E.89248
G2 X144.162 Y104.468 I-.054 J-.24 E.00947
G1 X144.17 Y98.953 E.18292
G1 X145.381 Y98.953 F30000
G1 F15476.087
G1 X147.009 Y98.953 E.05401
G1 X149.051 Y100.995 E.0958
G1 X149.329 Y100.995 E.00921
G1 X151.371 Y98.953 E.09579
G1 X152.922 Y98.953 E.05148
G1 X152.923 Y99.03 E.00254
G1 X153.743 Y102.626 F30000
G1 F15476.087
G1 X153.745 Y104.255 E.05401
G1 X158.639 Y99.361 E.22958
G1 X155.093 Y99.361 E.11764
G1 X159.989 Y104.257 E.2297
G1 X161.418 Y104.258 E.04741
G1 X166.315 Y99.361 E.2297
G1 X162.769 Y99.361 E.11762
G1 X167.667 Y104.26 E.22979
G1 X169.092 Y104.26 E.04726
G1 X173.99 Y99.362 E.22979
G1 X170.445 Y99.361 E.1176
G1 X195.837 Y124.753 E1.19119
G1 X195.837 Y123.571 E.03924
G1 X162.765 Y156.643 E1.55147
G1 X166.319 Y156.643 E.11787
G1 X154.197 Y144.521 E.56867
G3 X150.472 Y148.472 I-31.411 J-25.882 E.18026
G1 X158.643 Y156.643 E.38331
G1 X155.089 Y156.643 E.11787
G1 X195.837 Y115.895 E1.91157
G1 X195.837 Y117.077 E.03924
G1 X178.121 Y99.362 E.83108
G1 X181.666 Y99.362 E.11758
G1 X170.24 Y110.788 E.53602
G1 X170.24 Y114.508 E.1234
G1 X203.637 Y147.905 E1.56673
G1 X203.637 Y146.475 E.04746
G1 X193.469 Y156.643 E.477
G1 X197.022 Y156.643 E.11787
G1 X170.24 Y129.86 E1.25642
G1 X170.24 Y126.14 E.1234
G1 X197.017 Y99.362 E1.25619
G1 X193.474 Y99.362 E.11755
G1 X200.949 Y106.837 E.35066
G1 X197.219 Y106.837 E.12373
G1 X203.047 Y101.009 E.27342
G1 X203.637 Y103.137 F30000
G1 F15476.087
G2 X203.338 Y101.55 I-3.726 J-.118 E.054
G1 X201.45 Y99.662 E.08855
G2 X199.863 Y99.362 I-1.471 J3.437 E.054
G1 X200.115 Y98.955 F30000
G1 F15476.087
G1 X153.33 Y98.954 E1.55196
G1 X153.339 Y104.477 E.18321
G2 X153.535 Y104.663 I.24 J-.057 E.00948
G1 X169.833 Y104.667 E.54064
G1 X169.833 Y133.333 E.95089
G1 X159.493 Y133.332 E.34299
G2 X159.322 Y133.382 I-.016 J.265 E.00604
G3 X135.283 Y155.254 I-29.056 J-7.788 E1.13891
G1 X135.462 Y157.05 E.05985
G1 X199.984 Y157.05 E2.14033
G2 X204.044 Y153.194 I-.014 J-4.08 E.20468
G1 X204.044 Y130.756 E.74433
G1 X196.244 Y130.756 E.25874
G1 X196.244 Y107.244 E.77992
G1 X204.044 Y107.244 E.25874
G1 X204.044 Y102.801 E.14738
G2 X200.175 Y98.955 I-4.052 J.207 E.19847
G1 X200.135 Y107.651 F30000
G1 F15476.087
G1 X201.763 Y107.651 E.05401
G1 X204.044 Y109.933 E.10702
G1 X204.044 Y107.688 E.07447
G1 X196.651 Y115.08 E.34681
G1 X196.651 Y117.892 E.09325
G1 X204.044 Y125.285 E.34682
G1 X204.044 Y123.04 E.07447
G1 X196.735 Y130.349 E.34289
G1 X201.432 Y130.349 E.15582
G1 X196.651 Y125.568 E.22429
G1 X196.651 Y122.756 E.09325
G1 X204.044 Y115.364 E.34682
G1 X204.044 Y117.609 E.07447
G1 X196.651 Y110.216 E.34682
G1 X196.651 Y108.587 E.05401
G1 X195.837 Y129.618 F30000
G1 F15476.087
G1 X195.837 Y131.163 E.05124
G1 X195.921 Y131.163 E.00278
G1 X170.441 Y156.643 E1.19531
G1 X173.995 Y156.643 E.11787
G1 X157.211 Y139.859 E.78735
G2 X157.879 Y138.501 I-13.344 J-7.405 E.05021
G1 X162.64 Y133.74 E.22337
G1 X159.615 Y133.739 E.10036
G1 X159.423 Y134.395 E.02266
G1 X181.67 Y156.643 E1.04368
G1 X178.117 Y156.643 E.11787
G1 X203.597 Y131.163 E1.19531
G1 X202.247 Y131.163 E.04479
G1 X203.637 Y132.553 E.06523
G1 X203.637 Y134.182 E.05401
G1 X199.872 Y156.643 F30000
G1 F15476.087
G2 X201.456 Y156.332 I-.045 J-4.421 E.05386
G1 X203.321 Y154.466 E.0875
G2 X203.637 Y152.884 I-5.453 J-1.912 E.0537
G1 X203.04 Y154.984 F30000
G1 F15476.087
G1 X170.24 Y122.184 E1.53872
G1 X170.24 Y118.464 E.1234
G1 X189.342 Y99.362 E.89611
G1 X185.798 Y99.362 E.11757
G1 X195.837 Y109.402 E.47097
G1 X195.837 Y108.219 E.03924
G1 X147.413 Y156.643 E2.27167
G1 X150.967 Y156.643 E.11787
G1 X146.039 Y151.715 E.23117
G3 X143.115 Y153.265 I-16.066 J-26.77 E.10985
G1 X139.737 Y156.643 E.15844
G1 X143.291 Y156.643 E.11787
G1 X140.845 Y154.197 E.11472
G3 X139.302 Y154.714 I-5.979 J-15.287 E.05402
G1 X134.506 Y157.05 F30000
G1 F15476.087
G1 X135.052 Y157.05 E.01813
G1 X134.945 Y155.973 E.03588
G1 X134.056 Y155.084 E.0417
G1 X133.571 Y155.133 E.01617
G1 X131.654 Y157.05 E.08994
G1 X128.346 Y157.05 E.10975
G1 X126.286 Y154.99 E.09663
G2 X127.903 Y155.18 I2.722 J-16.204 E.05402
G1 X122.757 Y156.643 F30000
G1 F15476.087
G1 X124.385 Y156.643 E.05401
G1 X125.257 Y155.771 E.04088
G1 X125.276 Y155.58 E.00636
G3 X119.425 Y153.927 I5.664 J-31.209 E.20198
G1 X116.709 Y156.643 E.12741
G1 X120.263 Y156.643 E.11787
G1 X115.853 Y152.233 E.20687
G3 X114.339 Y151.337 I8.271 J-15.715 E.05839
G1 X109.033 Y156.643 E.24888
G1 X112.587 Y156.643 E.11787
G1 X64.163 Y108.219 E2.27167
G1 X64.163 Y109.402 E.03924
G1 X74.206 Y99.358 E.47116
G1 X70.654 Y99.358 E.11784
G1 X89.76 Y118.464 E.89631
G1 X89.76 Y122.184 E.1234
G1 X56.958 Y154.986 E1.5388
G1 X56.357 Y152.872 F30000
G1 F15476.087
G2 X56.669 Y154.456 I4.415 J-.044 E.05386
G1 X58.541 Y156.328 E.08783
G2 X60.004 Y156.64 I1.544 J-3.653 E.04994
G1 X60.004 Y156.64 E0
G2 X60.126 Y156.643 I.076 J-.828 E.00403
G1 X56.359 Y134.185 F30000
G1 F15476.087
G1 X56.36 Y132.557 E.05401
G1 X57.753 Y131.163 E.06538
G1 X56.403 Y131.163 E.04479
G1 X81.883 Y156.643 E1.19531
G1 X78.33 Y156.643 E.11787
G1 X101.232 Y133.74 E1.07442
G1 X101.385 Y133.74 E.00507
G2 X103.446 Y139.202 I31.002 J-8.579 E.19392
G1 X86.005 Y156.643 E.81819
G1 X89.559 Y156.643 E.11787
G1 X64.079 Y131.163 E1.19531
G1 X64.163 Y131.163 E.00278
G1 X64.163 Y129.618 E.05124
G1 X63.349 Y108.587 F30000
G1 F15476.087
G1 X63.349 Y110.216 E.05401
G1 X55.954 Y117.61 E.34689
G1 X55.954 Y115.362 E.07457
G1 X63.349 Y122.756 E.34688
G1 X63.349 Y125.568 E.09325
G1 X58.568 Y130.349 E.22429
G1 X63.265 Y130.349 E.15582
G1 X55.954 Y123.037 E.34299
G1 X55.953 Y125.287 E.07463
G1 X63.349 Y117.892 E.34693
G1 X63.349 Y115.08 E.09325
G1 X55.955 Y107.687 E.34684
G1 X55.955 Y109.933 E.07451
G1 X58.237 Y107.651 E.10706
G1 X59.865 Y107.651 E.05401
; WIPE_START
G1 F24000
G1 X58.237 Y107.651 E-.61876
G1 X57.974 Y107.914 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.286 J1.183 P1  F30000
G1 X164.815 Y133.74 Z6.4
G1 Z6
G1 E.8 F1800
G1 F15476.087
G1 X166.444 Y133.74 E.05401
G1 X189.346 Y156.643 E1.07442
G1 X185.793 Y156.643 E.11787
G1 X203.637 Y138.799 E.8371
G1 X203.637 Y140.229 E.04746
G1 X170.24 Y106.832 E1.56673
G1 X170.24 Y108.461 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X170.24 Y106.832 E-.61876
G1 X170.503 Y107.095 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/105
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
G3 Z6.4 I-1.215 J-.06 P1  F30000
G1 X169.227 Y132.727 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X159.457 Y132.727 E.32409
G2 X158.674 Y133.336 I-.01 J.796 E.03554
G3 X102.326 Y133.337 I-28.174 J-7.465 E2.53652
G2 X101.542 Y132.727 I-.774 J.187 E.03557
G1 X90.773 Y132.727 E.35724
G1 X90.773 Y105.273 E.91073
G1 X107.4 Y105.272 E.55156
G2 X108.272 Y104.4 I-.028 J-.9 E.04509
G1 X108.273 Y101.273 E.10374
G1 X116.227 Y101.273 E.26387
G1 X116.228 Y104.4 E.10374
M73 P58 R20
G2 X117.1 Y105.272 I.9 J-.028 E.04509
G1 X143.902 Y105.272 E.88907
G2 X144.772 Y104.4 I-.043 J-.913 E.04487
G1 X144.773 Y101.273 E.10374
G1 X152.727 Y101.273 E.26387
G1 X152.728 Y104.4 E.10374
G2 X153.6 Y105.272 I.9 J-.028 E.04509
G1 X169.227 Y105.273 E.51839
G1 X169.227 Y132.667 E.90874
G1 X168.835 Y132.335 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X159.443 Y132.335 E.28859
G2 X158.3 Y133.218 I.006 J1.19 E.04771
G3 X102.7 Y133.218 I-27.8 J-7.348 E2.31912
G2 X101.556 Y132.335 I-1.15 J.307 E.04772
G1 X91.165 Y132.335 E.31931
G1 X91.165 Y105.665 E.81951
G1 X107.417 Y105.664 E.49939
G2 X108.664 Y104.417 I-.046 J-1.293 E.05965
G1 X108.665 Y101.665 E.08457
G1 X115.835 Y101.665 E.22033
G1 X115.836 Y104.417 E.08457
G2 X117.083 Y105.664 I1.293 J-.046 E.05964
G1 X143.918 Y105.664 E.82455
G2 X145.164 Y104.417 I-.065 J-1.312 E.05942
G1 X145.165 Y101.665 E.08457
G1 X152.335 Y101.665 E.22033
G1 X152.336 Y104.417 E.08457
G2 X153.583 Y105.664 I1.293 J-.046 E.05965
G1 X168.835 Y105.665 E.46866
G1 X168.835 Y132.275 E.81767
M204 S10000
; WIPE_START
G1 F24000
G1 X166.835 Y132.288 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.314 J-1.176 P1  F30000
G1 X55.624 Y102.569 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
G1 X200.186 Y98.607 E4.64998
G3 X204.398 Y103.007 I-.188 J4.396 E.22318
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.411 J-.006 E.22946
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I.006 J-4.411 E.22946
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.234 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.204 Y98.215 E4.308
G3 X204.79 Y103.003 I-.207 J4.788 E.22495
M73 P58 R19
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.804 J-.012 E.23117
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.012 J-4.804 E.23117
G1 X55.21 Y103.003 E1.5362
G3 X55.229 Y102.59 I4.804 J.012 E.01268
M204 S10000
; WIPE_START
G1 F24000
G1 X55.302 Y102.066 E-.20136
G1 X55.416 Y101.61 E-.17863
G1 X55.575 Y101.167 E-.17862
G1 X55.776 Y100.742 E-.17862
G1 X55.806 Y100.691 E-.02277
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.186 J.272 P1  F30000
G1 X56.363 Y103.116 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X56.363 Y102.834 E.00935
G3 X56.679 Y101.534 I4.005 J.284 E.0446
G1 X58.544 Y99.668 E.08749
G3 X60.128 Y99.357 I1.502 J3.459 E.05398
G1 X56.953 Y101.009 F30000
G1 F15476.087
G1 X62.781 Y106.837 E.27342
G1 X59.051 Y106.837 E.12373
G1 X66.531 Y99.358 E.35088
G1 X62.978 Y99.358 E.11786
G1 X89.76 Y126.14 E1.25642
G1 X89.76 Y129.86 E.1234
G1 X62.978 Y156.643 E1.25642
G1 X66.531 Y156.643 E.11787
G1 X56.358 Y146.47 E.47723
G1 X56.358 Y147.91 E.04778
G1 X89.76 Y114.508 E1.56696
G1 X89.76 Y110.788 E.1234
G1 X78.33 Y99.358 E.5362
G1 X81.882 Y99.358 E.11782
G1 X64.163 Y117.077 E.83125
G1 X64.163 Y115.895 E.03924
G1 X104.911 Y156.643 E1.91157
G1 X101.357 Y156.643 E.11787
G1 X110.008 Y147.992 E.4058
G2 X111.231 Y149.066 I11.435 J-11.797 E.05402
; WIPE_START
G1 F24000
G1 X110.008 Y147.992 E-.61857
G1 X109.744 Y148.256 E-.14143
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.088 J-.546 P1  F30000
G1 X89.76 Y108.461 Z6.6
G1 Z6.2
G1 E.8 F1800
G1 F15476.087
G1 X89.76 Y106.832 E.05401
G1 X56.359 Y140.233 E1.56692
G1 X56.359 Y138.795 E.04773
G1 X74.207 Y156.643 E.83728
G1 X70.654 Y156.643 E.11787
G1 X93.556 Y133.74 E1.07441
G1 X97.36 Y133.74 E.12618
G1 X104.131 Y140.511 E.31764
G2 X106.369 Y143.956 I28.466 J-16.041 E.13635
G1 X93.681 Y156.643 E.59518
G1 X97.235 Y156.643 E.11787
G1 X64.163 Y123.571 E1.55147
G1 X64.163 Y124.753 E.03924
G1 X89.558 Y99.359 E1.19133
G1 X86.006 Y99.358 E.1178
G1 X90.908 Y104.26 E.22994
G1 X92.333 Y104.26 E.04726
G1 X97.233 Y99.359 E.2299
G1 X93.683 Y99.359 E.11779
G1 X98.582 Y104.258 E.22982
G1 X100.011 Y104.257 E.04742
G1 X104.909 Y99.359 E.22978
G1 X101.359 Y99.359 E.11777
G1 X106.255 Y104.255 E.2297
G1 X107.255 Y104.255 E.03315
G1 X107.256 Y103.626 E.02086
G1 X107.61 Y98.952 F30000
G1 F15476.087
G1 X60.016 Y98.95 E1.57879
G2 X55.956 Y102.834 I.003 J4.067 E.20574
G1 X55.955 Y107.244 E.14629
G1 X63.756 Y107.244 E.25875
G1 X63.756 Y130.756 E.77992
G1 X55.953 Y130.756 E.25884
G1 X55.95 Y152.984 E.73736
G2 X60.02 Y157.05 I4.058 J.007 E.21209
G1 X125.539 Y157.05 E2.17337
G1 X125.717 Y155.254 E.05986
G3 X101.725 Y133.453 I4.858 J-29.448 E1.13676
G2 X101.525 Y133.333 I-.197 J.101 E.00817
G1 X90.167 Y133.333 E.37677
G1 X90.167 Y104.667 E.95089
G1 X107.468 Y104.662 E.5739
G2 X107.661 Y104.477 I-.046 J-.242 E.00939
G1 X107.67 Y98.952 E.18327
G1 X108.076 Y100.03 F30000
G1 F15476.087
G1 X108.078 Y98.952 E.03576
G1 X108.628 Y98.952 E.01826
G1 X110.6 Y100.924 E.09253
G1 X111.02 Y100.924 E.01392
G1 X112.992 Y98.952 E.09252
G1 X116.304 Y98.952 E.10987
G1 X116.423 Y99.071 E.00557
G1 X116.425 Y100.699 E.05401
G1 X121.889 Y99.36 F30000
G1 F15476.087
G1 X120.261 Y99.36 E.05401
G1 X117.242 Y102.378 E.14161
G1 X117.238 Y99.886 E.08266
G1 X121.611 Y104.259 E.20515
G1 X123.037 Y104.259 E.04729
G1 X127.936 Y99.36 E.22984
G1 X124.388 Y99.36 E.11771
G1 X129.286 Y104.258 E.22978
G1 X130.715 Y104.258 E.0474
G1 X135.612 Y99.36 E.22975
G1 X132.064 Y99.36 E.11769
G1 X136.96 Y104.256 E.22969
G1 X138.392 Y104.256 E.0475
G1 X143.288 Y99.36 E.22966
G1 X139.74 Y99.36 E.11768
G1 X143.757 Y103.377 E.18842
G1 X143.755 Y104.255 E.02913
G1 X143.005 Y104.255 E.02489
G1 X144.11 Y98.953 F30000
G1 F15476.087
G1 X116.83 Y98.952 E.90493
G1 X116.838 Y104.468 E.18295
G2 X117.07 Y104.668 I.274 J-.083 E.01072
G1 X143.975 Y104.662 E.89248
G2 X144.162 Y104.468 I-.054 J-.24 E.00947
G1 X144.17 Y98.953 E.18292
G1 X145.381 Y98.953 F30000
G1 F15476.087
G1 X147.009 Y98.953 E.05401
G1 X148.98 Y100.924 E.09247
G1 X149.4 Y100.924 E.01392
G1 X151.371 Y98.953 E.09246
G1 X152.922 Y98.953 E.05148
G1 X152.923 Y99.03 E.00254
G1 X153.743 Y102.626 F30000
G1 F15476.087
G1 X153.745 Y104.255 E.05401
G1 X158.639 Y99.361 E.22958
G1 X155.093 Y99.361 E.11764
G1 X159.989 Y104.257 E.2297
G1 X161.418 Y104.258 E.04741
G1 X166.315 Y99.361 E.2297
G1 X162.769 Y99.361 E.11762
G1 X167.667 Y104.26 E.22979
G1 X169.092 Y104.26 E.04726
G1 X173.99 Y99.362 E.22979
G1 X170.445 Y99.361 E.1176
G1 X195.837 Y124.753 E1.19119
G1 X195.837 Y123.571 E.03924
G1 X162.765 Y156.643 E1.55147
G1 X166.319 Y156.643 E.11787
G1 X154.197 Y144.521 E.56867
G3 X150.472 Y148.472 I-31.411 J-25.882 E.18026
G1 X158.643 Y156.643 E.38331
G1 X155.089 Y156.643 E.11787
G1 X195.837 Y115.895 E1.91157
G1 X195.837 Y117.077 E.03924
G1 X178.121 Y99.362 E.83108
G1 X181.666 Y99.362 E.11758
G1 X170.24 Y110.788 E.53602
G1 X170.24 Y114.508 E.1234
G1 X203.637 Y147.905 E1.56673
G1 X203.637 Y146.475 E.04746
G1 X193.469 Y156.643 E.477
G1 X197.022 Y156.643 E.11787
G1 X170.24 Y129.86 E1.25642
G1 X170.24 Y126.14 E.1234
G1 X197.017 Y99.362 E1.25619
G1 X193.474 Y99.362 E.11755
G1 X200.949 Y106.837 E.35066
G1 X197.219 Y106.837 E.12373
G1 X203.047 Y101.009 E.27342
G1 X203.637 Y103.137 F30000
G1 F15476.087
G2 X203.338 Y101.55 I-4.82 J.088 E.05382
G1 X201.45 Y99.662 E.08855
G2 X199.863 Y99.362 I-1.471 J3.436 E.054
G1 X200.118 Y98.955 F30000
G1 F15476.087
G1 X153.33 Y98.954 E1.55207
G1 X153.339 Y104.477 E.18321
G2 X153.535 Y104.663 I.24 J-.057 E.00948
G1 X169.833 Y104.667 E.54064
G1 X169.833 Y133.333 E.95089
G1 X159.493 Y133.332 E.34299
G2 X159.322 Y133.382 I-.016 J.265 E.00604
G3 X135.283 Y155.254 I-29.056 J-7.788 E1.13891
G1 X135.462 Y157.05 E.05985
G1 X199.984 Y157.05 E2.14033
G2 X204.044 Y153.194 I-.038 J-4.106 E.20436
G1 X204.044 Y130.756 E.74433
G1 X196.244 Y130.756 E.25874
G1 X196.244 Y107.244 E.77992
G1 X204.044 Y107.244 E.25874
G1 X204.044 Y102.801 E.14738
G2 X200.178 Y98.955 I-4.097 J.252 E.19784
G1 X200.135 Y107.651 F30000
G1 F15476.087
G1 X201.763 Y107.651 E.05401
G1 X204.044 Y109.933 E.10702
G1 X204.044 Y107.688 E.07447
G1 X196.651 Y115.08 E.34682
G1 X196.651 Y117.892 E.09325
G1 X204.044 Y125.285 E.34682
G1 X204.044 Y123.04 E.07447
G1 X196.735 Y130.349 E.34289
G1 X201.432 Y130.349 E.15582
G1 X196.651 Y125.568 E.22429
G1 X196.651 Y122.756 E.09325
G1 X204.044 Y115.364 E.34682
G1 X204.044 Y117.609 E.07447
G1 X196.651 Y110.216 E.34682
G1 X196.651 Y108.587 E.05401
G1 X195.837 Y129.618 F30000
G1 F15476.087
G1 X195.837 Y131.163 E.05124
G1 X195.921 Y131.163 E.00278
G1 X170.441 Y156.643 E1.19531
G1 X173.995 Y156.643 E.11787
G1 X157.211 Y139.859 E.78735
G2 X157.879 Y138.501 I-13.344 J-7.405 E.05021
G1 X162.64 Y133.74 E.22337
G1 X159.615 Y133.739 E.10036
G1 X159.423 Y134.395 E.02266
G1 X181.67 Y156.643 E1.04368
G1 X178.117 Y156.643 E.11787
G1 X203.597 Y131.163 E1.19531
G1 X202.247 Y131.163 E.04479
G1 X203.637 Y132.553 E.06523
G1 X203.637 Y134.182 E.05401
G1 X199.872 Y156.643 F30000
G1 F15476.087
G2 X201.456 Y156.332 I.097 J-3.7 E.054
G1 X203.321 Y154.466 E.0875
G2 X203.637 Y152.884 I-5.453 J-1.911 E.0537
G1 X203.04 Y154.984 F30000
G1 F15476.087
G1 X170.24 Y122.184 E1.53872
G1 X170.24 Y118.464 E.1234
G1 X189.342 Y99.362 E.89611
G1 X185.798 Y99.362 E.11757
G1 X195.837 Y109.402 E.47097
G1 X195.837 Y108.219 E.03924
G1 X147.413 Y156.643 E2.27167
G1 X150.967 Y156.643 E.11787
G1 X146.039 Y151.715 E.23117
G3 X143.115 Y153.265 I-16.066 J-26.77 E.10985
G1 X139.737 Y156.643 E.15844
G1 X143.291 Y156.643 E.11787
G1 X140.845 Y154.197 E.11472
G3 X139.302 Y154.714 I-5.979 J-15.287 E.05402
G1 X134.506 Y157.05 F30000
G1 F15476.087
G1 X135.052 Y157.05 E.01813
G1 X134.945 Y155.973 E.03588
G1 X134.121 Y155.149 E.03865
G1 X133.492 Y155.212 E.02098
G1 X131.654 Y157.05 E.08621
G1 X128.346 Y157.05 E.10975
G1 X126.371 Y155.074 E.09266
G2 X127.988 Y155.26 I2.676 J-16.213 E.05402
G1 X122.757 Y156.643 F30000
G1 F15476.087
G1 X124.385 Y156.643 E.05401
G1 X125.257 Y155.771 E.04088
G1 X125.276 Y155.58 E.00636
G3 X119.425 Y153.927 I5.664 J-31.209 E.20198
G1 X116.709 Y156.643 E.12741
G1 X120.263 Y156.643 E.11787
G1 X115.853 Y152.233 E.20687
G3 X114.339 Y151.337 I8.271 J-15.715 E.05839
G1 X109.033 Y156.643 E.24888
G1 X112.587 Y156.643 E.11787
G1 X64.163 Y108.219 E2.27167
G1 X64.163 Y109.402 E.03924
G1 X74.206 Y99.358 E.47116
G1 X70.654 Y99.358 E.11784
G1 X89.76 Y118.464 E.89631
G1 X89.76 Y122.184 E.1234
G1 X56.958 Y154.986 E1.5388
G1 X56.357 Y152.872 F30000
G1 F15476.087
G2 X56.668 Y154.456 I4.416 J-.044 E.05386
G1 X58.541 Y156.328 E.08783
G1 X58.726 Y156.4 E.00658
G2 X60.126 Y156.643 I1.354 J-3.651 E.04739
G1 X56.359 Y134.185 F30000
G1 F15476.087
G1 X56.36 Y132.557 E.05401
G1 X57.753 Y131.163 E.06538
G1 X56.403 Y131.163 E.04479
G1 X81.883 Y156.643 E1.19531
G1 X78.33 Y156.643 E.11787
G1 X101.232 Y133.74 E1.07442
G1 X101.385 Y133.74 E.00507
G2 X103.446 Y139.202 I31.002 J-8.579 E.19392
G1 X86.005 Y156.643 E.81819
G1 X89.559 Y156.643 E.11787
G1 X64.079 Y131.163 E1.19531
G1 X64.163 Y131.163 E.00278
G1 X64.163 Y129.618 E.05124
G1 X63.349 Y108.587 F30000
G1 F15476.087
G1 X63.349 Y110.216 E.05401
G1 X55.954 Y117.61 E.34689
G1 X55.954 Y115.362 E.07457
G1 X63.349 Y122.756 E.34688
G1 X63.349 Y125.568 E.09325
G1 X58.568 Y130.349 E.22429
G1 X63.265 Y130.349 E.15582
G1 X55.954 Y123.037 E.34299
G1 X55.953 Y125.287 E.07463
G1 X63.349 Y117.892 E.34693
G1 X63.349 Y115.08 E.09325
G1 X55.955 Y107.687 E.34684
G1 X55.955 Y109.933 E.07451
G1 X58.237 Y107.651 E.10706
G1 X59.865 Y107.651 E.05401
; WIPE_START
G1 F24000
G1 X58.237 Y107.651 E-.61876
G1 X57.974 Y107.914 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.286 J1.183 P1  F30000
G1 X164.815 Y133.74 Z6.6
G1 Z6.2
G1 E.8 F1800
G1 F15476.087
G1 X166.444 Y133.74 E.05401
G1 X189.346 Y156.643 E1.07442
G1 X185.793 Y156.643 E.11787
G1 X203.637 Y138.799 E.8371
G1 X203.637 Y140.229 E.04746
G1 X170.24 Y106.832 E1.56673
G1 X170.24 Y108.461 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X170.24 Y106.832 E-.61876
G1 X170.503 Y107.095 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/105
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
G3 Z6.6 I-1.216 J-.055 P1  F30000
G1 X169.334 Y132.834 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X159.454 Y132.833 E.32772
G2 X158.777 Y133.361 I-.008 J.687 E.03074
G3 X102.223 Y133.361 I-28.277 J-7.491 E2.54587
G2 X101.547 Y132.833 I-.676 J.169 E.03065
G1 X90.666 Y132.834 E.36092
G1 X90.666 Y105.166 E.91777
G1 X107.435 Y105.167 E.55624
G2 X108.167 Y104.436 I-.062 J-.794 E.03732
G1 X108.166 Y101.166 E.10847
G1 X116.334 Y101.166 E.27092
G1 X116.333 Y104.435 E.10842
G2 X117.064 Y105.167 I.783 J-.051 E.03743
G1 X143.936 Y105.167 E.89142
G2 X144.667 Y104.436 I-.053 J-.783 E.03739
G1 X144.666 Y101.166 E.10847
G1 X152.834 Y101.166 E.27092
G1 X152.833 Y104.436 E.10847
G2 X153.565 Y105.167 I.794 J-.064 E.03732
G1 X169.334 Y105.166 E.52306
G1 X169.334 Y132.774 E.91578
G1 X168.941 Y132.441 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X159.439 Y132.441 E.29198
G2 X158.403 Y133.242 I.018 J1.094 E.04314
G3 X102.597 Y133.242 I-27.903 J-7.373 E2.32782
G2 X101.561 Y132.441 I-1.047 J.285 E.04318
G1 X91.059 Y132.441 E.32271
G1 X91.059 Y105.559 E.82604
G1 X107.452 Y105.559 E.50371
G2 X108.559 Y104.452 I-.085 J-1.192 E.05244
G1 X108.559 Y101.559 E.08891
G1 X115.941 Y101.559 E.22686
G1 X115.941 Y104.452 E.08889
G2 X117.048 Y105.559 I1.179 J-.072 E.05257
G1 X143.952 Y105.559 E.82669
G2 X145.059 Y104.452 I-.069 J-1.176 E.05259
G1 X145.059 Y101.559 E.08891
G1 X152.441 Y101.559 E.22686
G1 X152.441 Y104.452 E.08891
G2 X153.548 Y105.559 I1.192 J-.086 E.05244
G1 X168.941 Y105.559 E.47298
G1 X168.941 Y132.381 E.82419
M204 S10000
; WIPE_START
G1 F24000
G1 X166.941 Y132.394 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.315 J-1.176 P1  F30000
G1 X55.624 Y102.569 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
G1 X200.193 Y98.607 E4.6502
G3 X204.398 Y103.007 I-.195 J4.396 E.22296
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.411 J-.006 E.22946
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I.006 J-4.411 E.22946
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.234 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.211 Y98.215 E4.30821
G3 X204.79 Y103.003 I-.214 J4.788 E.22474
G1 X204.79 Y152.997 E1.5362
M73 P59 R19
G3 X199.997 Y157.79 I-4.804 J-.012 E.23117
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.012 J-4.804 E.23117
G1 X55.21 Y103.003 E1.5362
G3 X55.229 Y102.59 I4.804 J.012 E.01268
M204 S10000
; WIPE_START
G1 F24000
G1 X55.302 Y102.066 E-.20136
G1 X55.416 Y101.61 E-.17863
G1 X55.575 Y101.167 E-.17862
G1 X55.776 Y100.742 E-.17862
G1 X55.806 Y100.691 E-.02277
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.186 J.272 P1  F30000
G1 X56.363 Y103.116 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X56.679 Y101.534 I5.77 J.33 E.0537
G1 X58.544 Y99.668 E.08749
G3 X60.128 Y99.357 I1.494 J3.417 E.05399
G1 X56.953 Y101.009 F30000
G1 F15476.087
G1 X62.781 Y106.837 E.27342
G1 X59.051 Y106.837 E.12373
G1 X66.531 Y99.358 E.35088
G1 X62.978 Y99.358 E.11786
G1 X89.76 Y126.14 E1.25642
G1 X89.76 Y129.86 E.1234
G1 X62.978 Y156.643 E1.25642
G1 X66.531 Y156.643 E.11787
G1 X56.358 Y146.47 E.47723
G1 X56.358 Y147.91 E.04778
G1 X89.76 Y114.508 E1.56696
G1 X89.76 Y110.788 E.1234
G1 X78.33 Y99.358 E.5362
G1 X81.882 Y99.358 E.11782
G1 X64.163 Y117.077 E.83125
G1 X64.163 Y115.895 E.03924
G1 X104.911 Y156.643 E1.91157
G1 X101.357 Y156.643 E.11787
G1 X110.008 Y147.992 E.4058
G2 X111.231 Y149.066 I11.435 J-11.797 E.05402
G1 X122.757 Y156.643 F30000
G1 F15476.087
G1 X124.385 Y156.643 E.05401
G1 X125.257 Y155.771 E.04088
G1 X125.276 Y155.58 E.00636
G3 X119.425 Y153.927 I5.664 J-31.209 E.20198
G1 X116.709 Y156.643 E.12741
G1 X120.263 Y156.643 E.11787
G1 X115.853 Y152.233 E.20687
G3 X114.339 Y151.337 I8.271 J-15.715 E.05839
G1 X109.033 Y156.643 E.24888
G1 X112.587 Y156.643 E.11787
G1 X90.033 Y134.089 E1.05804
G1 X89.955 Y134.089 E.0026
G1 X89.411 Y133.546 E.02549
G1 X89.411 Y133.467 E.0026
G1 X64.163 Y108.219 E1.18445
G1 X64.163 Y109.402 E.03924
G1 X74.206 Y99.358 E.47116
G1 X70.654 Y99.358 E.11784
G1 X89.76 Y118.464 E.89631
G1 X89.76 Y122.184 E.1234
G1 X56.958 Y154.986 E1.5388
G1 X56.357 Y152.872 F30000
G1 F15476.087
G2 X56.668 Y154.456 I4.416 J-.044 E.05386
G1 X58.541 Y156.328 E.08783
G2 X60.126 Y156.643 I1.64 J-4.118 E.0539
G1 X56.359 Y134.185 F30000
G1 F15476.087
G1 X56.36 Y132.557 E.05401
G1 X57.753 Y131.163 E.06538
G1 X56.403 Y131.163 E.04479
G1 X81.883 Y156.643 E1.19531
G1 X78.33 Y156.643 E.11787
G1 X101.232 Y133.74 E1.07442
G1 X101.385 Y133.74 E.00507
G2 X103.446 Y139.202 I31.002 J-8.579 E.19392
G1 X86.005 Y156.643 E.81819
G1 X89.559 Y156.643 E.11787
G1 X64.079 Y131.163 E1.19531
G1 X64.163 Y131.163 E.00278
G1 X64.163 Y129.618 E.05124
G1 X63.349 Y108.587 F30000
G1 F15476.087
G1 X63.349 Y110.216 E.05401
G1 X55.954 Y117.61 E.34689
G1 X55.954 Y115.362 E.07457
G1 X63.349 Y122.756 E.34688
G1 X63.349 Y125.568 E.09325
G1 X58.568 Y130.349 E.22429
G1 X63.265 Y130.349 E.15582
G1 X55.954 Y123.037 E.34299
G1 X55.953 Y125.287 E.07463
G1 X63.349 Y117.892 E.34693
G1 X63.349 Y115.08 E.09325
G1 X55.955 Y107.687 E.34684
G1 X55.955 Y109.933 E.07451
G1 X58.237 Y107.651 E.10706
G1 X59.865 Y107.651 E.05401
G1 X89.411 Y105.437 F30000
G1 F15476.087
G1 X89.411 Y105.545 E.00357
G1 X89.76 Y105.689 E.01252
G1 X89.76 Y106.832 E.03792
G1 X56.359 Y140.233 E1.56692
G1 X56.359 Y138.795 E.04773
G1 X74.207 Y156.643 E.83728
G1 X70.654 Y156.643 E.11787
G1 X93.556 Y133.74 E1.07441
G1 X97.36 Y133.74 E.12618
G1 X104.131 Y140.511 E.31764
G2 X106.369 Y143.956 I28.466 J-16.041 E.13635
G1 X93.681 Y156.643 E.59518
G1 X97.235 Y156.643 E.11787
G1 X64.163 Y123.571 E1.55147
G1 X64.163 Y124.753 E.03924
G1 X89.558 Y99.359 E1.19133
G1 X86.006 Y99.358 E.1178
G1 X90.559 Y103.911 E.21359
G1 X91.045 Y103.911 E.0161
G1 X91.189 Y104.26 E.01252
G1 X92.333 Y104.26 E.03794
G1 X97.233 Y99.359 E.2299
G1 X93.683 Y99.359 E.11779
G1 X98.582 Y104.258 E.22982
G1 X100.011 Y104.257 E.04742
G1 X104.909 Y99.359 E.22978
G1 X101.359 Y99.359 E.11777
G1 X106.255 Y104.255 E.2297
G1 X107.255 Y104.255 E.03315
G1 X107.256 Y103.626 E.02086
G1 X107.743 Y100.989 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48437
G1 F14271.152
G1 X107.766 Y100.889 E.0037
; LINE_WIDTH: 0.525162
G1 F13064.002
G1 X107.789 Y100.789 E.00405
G1 X107.931 Y100.756 E.00573
G1 X108.076 Y100.03 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X108.078 Y98.952 E.03575
G1 X108.628 Y98.952 E.01826
G1 X110.494 Y100.818 E.08755
G1 X111.126 Y100.818 E.02096
G1 X112.992 Y98.952 E.08754
G1 X116.304 Y98.952 E.10987
G1 X116.423 Y99.071 E.00557
G1 X116.425 Y100.318 E.04137
G1 X116.227 Y100.318 E.00657
G1 X116.157 Y100.487 E.00607
G1 X116.731 Y100.81 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.537522
G1 F12737.514
G1 X116.744 Y100.9 E.00366
; LINE_WIDTH: 0.490087
G1 F14088.722
G1 X116.757 Y100.989 E.0033
G1 X116.537 Y100.742 E.01207
; LINE_WIDTH: 0.483998
G1 F14283.188
G1 X116.609 Y100.762 E.00269
; LINE_WIDTH: 0.509899
G1 F13490.97
G1 X116.681 Y100.781 E.00284
G1 X117.244 Y104.006 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X117.242 Y102.378 E.05401
G1 X120.261 Y99.36 E.14161
G1 X117.238 Y99.36 E.10028
G1 X117.238 Y99.886 E.01748
G1 X121.611 Y104.259 E.20515
G1 X123.037 Y104.259 E.04729
G1 X127.936 Y99.36 E.22984
G1 X124.388 Y99.36 E.11771
G1 X129.286 Y104.258 E.22978
G1 X130.715 Y104.258 E.0474
G1 X135.612 Y99.36 E.22975
G1 X132.064 Y99.36 E.11769
G1 X136.96 Y104.256 E.22969
G1 X138.392 Y104.256 E.0475
G1 X143.288 Y99.36 E.22966
G1 X139.74 Y99.36 E.11768
G1 X143.757 Y103.377 E.18842
G1 X143.755 Y104.255 E.02913
G1 X143.005 Y104.255 E.02489
G1 X144.243 Y100.989 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.484366
G1 F14271.281
G1 X144.266 Y100.889 E.0037
; LINE_WIDTH: 0.525159
G1 F13064.063
G1 X144.289 Y100.789 E.00405
G1 X144.431 Y100.756 E.00573
G1 X144.17 Y98.953 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X144.168 Y100.318 E.04528
G1 X143.818 Y100.623 E.01539
G1 X143.818 Y101.273 E.02154
G1 X144.166 Y101.417 E.0125
G1 X144.162 Y104.468 E.1012
G3 X143.975 Y104.662 I-.242 J-.046 E.00947
G1 X117.07 Y104.668 E.89248
G3 X116.838 Y104.468 I.042 J-.283 E.01072
G1 X116.834 Y101.417 E.1012
G1 X117.182 Y101.273 E.0125
G1 X117.182 Y100.623 E.02154
G1 X116.832 Y100.318 E.01539
G1 X116.83 Y98.952 E.04531
G1 X144.11 Y98.953 E.90493
G1 X145.381 Y98.953 F30000
G1 F15476.087
G1 X147.009 Y98.953 E.05401
G1 X148.874 Y100.818 E.08748
G1 X149.506 Y100.818 E.02096
G1 X151.37 Y98.954 E.08748
G1 X152.922 Y98.954 E.05148
G1 X152.923 Y99.03 E.00253
G1 X153.231 Y100.81 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.537516
G1 F12737.669
G1 X153.244 Y100.9 E.00365
; LINE_WIDTH: 0.490079
G1 F14088.967
G1 X153.257 Y100.989 E.0033
G1 X153.037 Y100.742 E.01207
; LINE_WIDTH: 0.483998
G1 F14283.188
G1 X153.109 Y100.762 E.00268
; LINE_WIDTH: 0.509897
G1 F13491.029
G1 X153.181 Y100.781 E.00284
G1 X153.743 Y102.626 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X153.745 Y104.255 E.05401
G1 X158.639 Y99.361 E.22958
G1 X155.093 Y99.361 E.11764
G1 X159.989 Y104.257 E.2297
G1 X161.418 Y104.258 E.04741
G1 X166.315 Y99.361 E.2297
G1 X162.769 Y99.361 E.11762
G1 X167.667 Y104.26 E.22979
G1 X168.811 Y104.26 E.03794
G1 X168.955 Y103.911 E.01252
G1 X169.441 Y103.911 E.0161
G1 X173.99 Y99.362 E.21344
G1 X170.445 Y99.361 E.1176
G1 X195.837 Y124.753 E1.19119
G1 X195.837 Y123.571 E.03924
G1 X162.765 Y156.643 E1.55147
G1 X166.319 Y156.643 E.11787
G1 X154.197 Y144.521 E.56867
G3 X150.472 Y148.472 I-31.411 J-25.882 E.18026
G1 X158.643 Y156.643 E.38331
G1 X155.089 Y156.643 E.11787
G1 X195.837 Y115.895 E1.91157
G1 X195.837 Y117.077 E.03924
G1 X178.121 Y99.362 E.83108
G1 X181.666 Y99.362 E.11758
G1 X170.24 Y110.788 E.53602
G1 X170.24 Y114.508 E.1234
G1 X203.637 Y147.905 E1.56673
G1 X203.637 Y146.475 E.04746
G1 X193.469 Y156.643 E.477
G1 X197.022 Y156.643 E.11787
G1 X170.24 Y129.86 E1.25642
G1 X170.24 Y126.14 E.1234
G1 X197.017 Y99.362 E1.25619
G1 X193.474 Y99.362 E.11755
G1 X200.949 Y106.837 E.35066
G1 X197.219 Y106.837 E.12373
G1 X203.047 Y101.009 E.27342
G1 X203.637 Y103.137 F30000
G1 F15476.087
G2 X203.338 Y101.55 I-3.726 J-.118 E.054
G1 X201.45 Y99.662 E.08855
G2 X199.863 Y99.362 I-1.471 J3.436 E.054
G1 X200.118 Y98.955 F30000
G1 F15476.087
G1 X153.33 Y98.954 E1.55207
G1 X153.332 Y100.318 E.04527
G1 X153.682 Y100.623 E.01539
G1 X153.682 Y101.273 E.02154
G1 X153.334 Y101.417 E.0125
G1 X153.339 Y104.477 E.1015
G2 X153.535 Y104.663 I.24 J-.057 E.00948
G1 X169.083 Y104.667 E.51576
G1 X169.227 Y104.318 E.01252
G1 X169.877 Y104.318 E.02154
G1 X170.182 Y104.623 E.0143
G1 X170.182 Y105.273 E.02155
G1 X169.833 Y105.417 E.01252
G1 X169.833 Y132.583 E.90114
G1 X170.182 Y132.727 E.01252
G1 X170.182 Y133.377 E.02154
G1 X169.877 Y133.682 E.0143
G1 X169.227 Y133.682 E.02154
G1 X169.083 Y133.333 E.01252
G1 X159.493 Y133.332 E.31811
G2 X159.322 Y133.382 I-.016 J.265 E.00604
G3 X135.283 Y155.254 I-29.056 J-7.788 E1.13891
G1 X135.462 Y157.05 E.05985
G1 X199.984 Y157.05 E2.14033
G2 X204.044 Y153.194 I-.01 J-4.076 E.20473
G1 X204.044 Y130.756 E.74433
G1 X196.244 Y130.756 E.25874
G1 X196.244 Y107.244 E.77992
G1 X204.044 Y107.244 E.25874
G1 X204.044 Y102.801 E.14738
G2 X203.966 Y102.21 I-3.043 J.1 E.01981
G1 X203.966 Y102.21 E0
G2 X200.178 Y98.955 I-3.976 J.796 E.17847
G1 X200.135 Y107.651 F30000
G1 F15476.087
G1 X201.763 Y107.651 E.05401
G1 X204.044 Y109.933 E.10702
G1 X204.044 Y107.688 E.07447
G1 X196.651 Y115.08 E.34681
G1 X196.651 Y117.892 E.09325
G1 X204.044 Y125.285 E.34681
G1 X204.044 Y123.04 E.07447
G1 X196.735 Y130.349 E.34289
G1 X201.432 Y130.349 E.15582
G1 X196.651 Y125.568 E.22429
G1 X196.651 Y122.756 E.09325
G1 X204.044 Y115.364 E.34681
G1 X204.044 Y117.609 E.07447
G1 X196.651 Y110.216 E.34681
G1 X196.651 Y108.587 E.05401
G1 X195.837 Y129.618 F30000
G1 F15476.087
G1 X195.837 Y131.163 E.05124
G1 X195.921 Y131.163 E.00278
G1 X170.441 Y156.643 E1.19531
G1 X173.995 Y156.643 E.11787
G1 X157.211 Y139.859 E.78735
G2 X157.879 Y138.501 I-13.344 J-7.405 E.05021
G1 X162.64 Y133.74 E.22337
G1 X159.615 Y133.739 E.10036
G1 X159.423 Y134.395 E.02266
G1 X181.67 Y156.643 E1.04368
G1 X178.117 Y156.643 E.11787
G1 X203.597 Y131.163 E1.19531
G1 X202.247 Y131.163 E.04479
G1 X203.637 Y132.553 E.06523
G1 X203.637 Y134.182 E.05401
G1 X203.637 Y152.884 F30000
G1 F15476.087
G3 X203.321 Y154.466 I-3.758 J.072 E.05394
G1 X201.45 Y156.337 E.08777
G3 X199.864 Y156.643 I-1.493 J-3.488 E.054
G1 X203.04 Y154.984 F30000
G1 F15476.087
G1 X170.24 Y122.184 E1.53872
G1 X170.24 Y118.464 E.1234
G1 X189.342 Y99.362 E.89611
G1 X185.798 Y99.362 E.11757
G1 X195.837 Y109.402 E.47097
G1 X195.837 Y108.219 E.03924
G1 X170.589 Y133.467 E1.18445
G1 X170.589 Y133.546 E.0026
G1 X170.045 Y134.089 E.02549
G1 X169.967 Y134.089 E.0026
G1 X147.413 Y156.643 E1.05804
G1 X150.967 Y156.643 E.11787
G1 X146.039 Y151.715 E.23117
G3 X143.115 Y153.265 I-16.066 J-26.77 E.10985
G1 X139.737 Y156.643 E.15844
G1 X143.291 Y156.643 E.11787
G1 X140.845 Y154.197 E.11472
G3 X139.302 Y154.714 I-5.979 J-15.287 E.05402
G1 X134.506 Y157.05 F30000
G1 F15476.087
G1 X135.052 Y157.05 E.01813
G1 X134.945 Y155.973 E.03588
G1 X134.216 Y155.244 E.03422
G3 X133.373 Y155.33 I-1.294 J-8.442 E.02811
G1 X131.654 Y157.05 E.08065
G1 X128.346 Y157.05 E.10975
G1 X126.497 Y155.201 E.08674
G2 X128.115 Y155.379 I2.607 J-16.225 E.05403
; WIPE_START
G1 F24000
G1 X126.497 Y155.201 E-.61863
G1 X126.76 Y155.464 E-.14137
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.603 J1.057 P1  F30000
G1 X164.815 Y133.74 Z6.8
G1 Z6.4
G1 E.8 F1800
G1 F15476.087
G1 X166.444 Y133.74 E.05401
G1 X189.346 Y156.643 E1.07442
G1 X185.793 Y156.643 E.11787
G1 X203.637 Y138.799 E.8371
G1 X203.637 Y140.229 E.04746
G1 X170.24 Y106.832 E1.56673
G1 X170.24 Y105.689 E.03792
G1 X170.589 Y105.545 E.01252
G1 X170.589 Y105.437 E.00357
G1 X169.731 Y104.81 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.537234
G1 F12744.935
G1 X169.744 Y104.9 E.00366
; LINE_WIDTH: 0.489723
G1 F14100.199
G1 X169.758 Y104.989 E.0033
G1 X169.537 Y104.742 E.01205
; LINE_WIDTH: 0.484092
G1 F14280.144
G1 X169.609 Y104.762 E.00268
; LINE_WIDTH: 0.509821
G1 F13493.225
G1 X169.681 Y104.781 E.00283
G1 X169.511 Y133.258 F30000
; LINE_WIDTH: 0.483984
G1 F14283.642
G1 X169.611 Y133.234 E.0037
; LINE_WIDTH: 0.524832
G1 F13072.945
G1 X169.711 Y133.211 E.00404
G1 X169.744 Y133.069 E.00572
; WIPE_START
G1 F24000
G1 X169.711 Y133.211 E-.44554
G1 X169.611 Y133.234 E-.31446
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.589 J-1.065 P1  F30000
G1 X107.67 Y98.952 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.668 Y100.318 E.04532
G1 X107.318 Y100.623 E.01539
G1 X107.318 Y101.273 E.02154
G1 X107.666 Y101.417 E.0125
G1 X107.661 Y104.477 E.1015
G3 X107.468 Y104.662 I-.24 J-.057 E.00939
G1 X90.917 Y104.667 E.54902
G1 X90.773 Y104.318 E.01252
G1 X90.123 Y104.318 E.02154
G1 X89.818 Y104.623 E.0143
G1 X89.818 Y105.273 E.02155
G1 X90.167 Y105.417 E.01252
G1 X90.167 Y132.583 E.90114
G1 X89.818 Y132.727 E.01252
G1 X89.818 Y133.377 E.02155
G1 X90.123 Y133.682 E.0143
G1 X90.773 Y133.682 E.02154
G1 X90.917 Y133.333 E.01252
G1 X101.525 Y133.333 E.35189
G3 X101.725 Y133.453 I.003 J.222 E.00817
G2 X125.717 Y155.254 I28.85 J-7.647 E1.13676
G1 X125.539 Y157.05 E.05986
G1 X59.987 Y157.047 E2.17447
G3 X55.95 Y152.984 I.039 J-4.075 E.21067
G1 X55.953 Y130.756 E.73736
G1 X63.756 Y130.756 E.25884
G1 X63.756 Y107.244 E.77992
G1 X55.955 Y107.244 E.25875
G1 X55.956 Y102.814 E.14697
G3 X60.016 Y98.95 I4.064 J.206 E.20508
G1 X107.61 Y98.952 E1.57879
G1 X90.242 Y104.989 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483998
G1 F14283.188
G1 X90.266 Y104.889 E.0037
; LINE_WIDTH: 0.524897
G1 F13071.177
G1 X90.289 Y104.789 E.00404
G1 X90.431 Y104.756 E.00573
G1 X90.242 Y133.011 F30000
; LINE_WIDTH: 0.483998
G1 F14283.188
G1 X90.266 Y133.111 E.0037
; LINE_WIDTH: 0.524848
G1 F13072.503
G1 X90.289 Y133.211 E.00404
G1 X90.431 Y133.244 E.00572
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X90.289 Y133.211 E-.44552
G1 X90.266 Y133.111 E-.31448
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/105
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
G3 Z6.8 I.002 J1.217 P1  F30000
G1 X169.485 Y132.985 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X159.47 Y132.984 E.3322
G2 X158.924 Y133.393 I-.017 J.546 E.02442
G3 X102.076 Y133.393 I-28.424 J-7.524 E2.55942
G2 X101.551 Y132.984 I-.549 J.163 E.02354
G1 X90.515 Y132.985 E.36607
G1 X90.515 Y105.015 E.92779
G1 X107.464 Y105.016 E.56222
G2 X108.016 Y104.465 I-.034 J-.586 E.02829
G1 X108.015 Y101.015 E.11442
G1 X116.485 Y101.015 E.28094
G1 X116.484 Y104.464 E.1144
G2 X117.035 Y105.016 I.586 J-.034 E.02827
G1 X143.966 Y105.016 E.89334
G2 X144.516 Y104.464 I-.036 J-.586 E.02826
G1 X144.515 Y101.015 E.1144
G1 X152.985 Y101.015 E.28094
G1 X152.984 Y104.465 E.11442
G2 X153.535 Y105.016 I.586 J-.035 E.02825
G1 X169.485 Y105.015 E.52909
G1 X169.485 Y132.925 E.9258
G1 X169.092 Y132.592 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X159.44 Y132.592 E.29659
G2 X158.551 Y133.274 I.013 J.938 E.0369
G3 X102.449 Y133.274 I-28.051 J-7.405 E2.34041
G2 X101.567 Y132.592 I-.896 J.247 E.03673
G1 X90.908 Y132.592 E.32755
G1 X90.908 Y105.408 E.83532
G1 X107.48 Y105.408 E.50923
G2 X108.408 Y104.48 I-.051 J-.979 E.04417
G1 X108.407 Y101.408 E.09442
G1 X116.093 Y101.408 E.23614
G1 X116.092 Y104.48 E.09441
G2 X117.02 Y105.408 I.979 J-.051 E.04416
G1 X143.981 Y105.408 E.82844
G2 X144.908 Y104.48 I-.051 J-.979 E.04416
G1 X144.907 Y101.408 E.09441
G1 X152.593 Y101.408 E.23614
G1 X152.592 Y104.48 E.09442
G2 X153.519 Y105.408 I.979 J-.051 E.04415
G1 X169.092 Y105.408 E.47852
G1 X169.092 Y132.532 E.83347
M204 S10000
; WIPE_START
G1 F24000
G1 X167.093 Y132.545 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.316 J-1.175 P1  F30000
G1 X55.624 Y102.569 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
G1 X200.199 Y98.607 E4.65042
G3 X204.398 Y103.007 I-.202 J4.396 E.22274
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.411 J-.006 E.22946
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I.006 J-4.411 E.22946
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.234 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.218 Y98.215 E4.30842
G3 X204.79 Y103.003 I-.221 J4.788 E.22453
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.804 J-.012 E.23117
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.012 J-4.804 E.23117
G1 X55.21 Y103.003 E1.5362
G3 X55.229 Y102.59 I4.804 J.012 E.01268
M204 S10000
; WIPE_START
G1 F24000
G1 X55.302 Y102.066 E-.20136
G1 X55.416 Y101.61 E-.17863
G1 X55.575 Y101.167 E-.17862
G1 X55.776 Y100.742 E-.17863
G1 X55.806 Y100.691 E-.02276
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.212 J.111 P1  F30000
G1 X56.426 Y107.425 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.402846
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X56.426 Y101.152 E.32577
G3 X56.879 Y100.471 I3.309 J1.71 E.04254
G1 X56.879 Y107.223 E.3506
G1 X57.332 Y107.223 E.02352
G1 X57.332 Y99.995 E.37534
G3 X57.785 Y99.648 I1.397 J1.354 E.02974
G1 X57.785 Y107.223 E.39336
G1 X58.237 Y107.223 E.02352
G1 X58.237 Y99.391 E.40671
M73 P60 R19
G3 X58.69 Y99.196 I1.016 J1.736 E.02567
G1 X58.69 Y107.223 E.41683
G1 X59.143 Y107.223 E.02352
G1 X59.143 Y99.068 E.42351
G3 X59.596 Y98.993 I.604 J2.262 E.02387
G1 X59.596 Y107.223 E.42737
G1 X60.049 Y107.223 E.02352
G1 X60.049 Y98.972 E.42848
G1 X60.502 Y98.972 E.02352
G1 X60.502 Y107.223 E.42848
G1 X60.955 Y107.223 E.02352
G1 X60.955 Y98.972 E.42848
G1 X61.407 Y98.972 E.02352
G1 X61.407 Y107.223 E.42848
G1 X61.86 Y107.223 E.02352
G1 X61.86 Y98.972 E.42848
G1 X62.313 Y98.972 E.02352
G1 X62.313 Y107.223 E.42848
G1 X62.766 Y107.223 E.02352
G1 X62.766 Y98.972 E.42848
G1 X63.219 Y98.972 E.02352
G1 X63.219 Y107.425 E.43899
M106 S127.5
G1 X63.349 Y108.587 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X63.349 Y110.216 E.05401
G1 X55.954 Y117.61 E.34689
G1 X55.954 Y115.362 E.07457
G1 X63.349 Y122.756 E.34688
G1 X63.349 Y125.568 E.09325
G1 X58.568 Y130.349 E.22429
G1 X63.265 Y130.349 E.15582
G1 X55.954 Y123.037 E.34299
G1 X55.953 Y125.287 E.07463
G1 X63.349 Y117.892 E.34693
G1 X63.349 Y115.08 E.09325
G1 X55.955 Y107.687 E.34684
G1 X55.955 Y109.933 E.07451
G1 X58.237 Y107.651 E.10706
G1 X59.865 Y107.651 E.05401
G1 X55.973 Y130.575 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.402846
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X55.973 Y153.013 E1.16525
G2 X56.426 Y154.832 I3.972 J-.023 E.09828
G1 X56.426 Y130.777 E1.2492
G1 X56.879 Y130.777 E.02352
G1 X56.879 Y155.543 E1.28612
G1 X57.332 Y156.012 E.03385
G1 X57.332 Y130.777 E1.31047
G1 X57.785 Y130.777 E.02352
G1 X57.785 Y156.361 E1.32858
G1 X58.237 Y156.617 E.02703
G1 X58.237 Y130.777 E1.3419
M73 P60 R18
G1 X58.69 Y130.777 E.02352
G1 X58.69 Y156.799 E1.35135
G2 X59.143 Y156.924 I.646 J-1.465 E.02448
G1 X59.143 Y130.777 E1.35782
G1 X59.596 Y130.777 E.02352
G1 X59.596 Y156.997 E1.36163
G2 X60.049 Y157.028 I.439 J-3.077 E.02359
G1 X60.049 Y130.777 E1.36324
G1 X60.502 Y130.777 E.02352
G1 X60.502 Y157.028 E1.36324
G1 X60.955 Y157.028 E.02352
G1 X60.955 Y130.777 E1.36324
G1 X61.407 Y130.777 E.02352
G1 X61.407 Y157.028 E1.36324
G1 X61.86 Y157.028 E.02352
G1 X61.86 Y130.777 E1.36324
G1 X62.313 Y130.777 E.02352
G1 X62.313 Y157.028 E1.36324
G1 X62.766 Y157.028 E.02352
G1 X62.766 Y130.777 E1.36324
G1 X63.219 Y130.777 E.02352
G1 X63.219 Y157.028 E1.36324
G1 X63.672 Y157.028 E.02352
G1 X63.672 Y98.972 E3.01493
G1 X64.124 Y98.972 E.02352
G1 X64.124 Y157.028 E3.01493
G1 X64.577 Y157.028 E.02352
G1 X64.577 Y98.972 E3.01493
G1 X65.03 Y98.972 E.02352
G1 X65.03 Y157.028 E3.01493
G1 X65.483 Y157.028 E.02352
G1 X65.483 Y98.972 E3.01493
G1 X65.936 Y98.972 E.02352
G1 X65.936 Y157.028 E3.01492
G1 X66.389 Y157.028 E.02352
G1 X66.389 Y98.972 E3.01492
G1 X66.842 Y98.972 E.02352
G1 X66.842 Y157.028 E3.01492
G1 X67.294 Y157.028 E.02352
G1 X67.294 Y98.972 E3.01492
G1 X67.747 Y98.972 E.02352
G1 X67.747 Y157.028 E3.01492
G1 X68.2 Y157.028 E.02352
G1 X68.2 Y98.972 E3.01492
G1 X68.653 Y98.972 E.02352
G1 X68.653 Y157.028 E3.01492
G1 X69.106 Y157.028 E.02352
G1 X69.106 Y98.972 E3.01492
G1 X69.559 Y98.972 E.02352
G1 X69.559 Y157.028 E3.01492
G1 X70.011 Y157.028 E.02352
G1 X70.011 Y98.972 E3.01492
G1 X70.464 Y98.972 E.02352
G1 X70.464 Y157.028 E3.01492
G1 X70.917 Y157.028 E.02352
G1 X70.917 Y98.972 E3.01492
G1 X71.37 Y98.972 E.02352
G1 X71.37 Y157.028 E3.01491
G1 X71.823 Y157.028 E.02352
G1 X71.823 Y98.972 E3.01491
G1 X72.276 Y98.972 E.02352
G1 X72.276 Y157.028 E3.01491
G1 X72.729 Y157.028 E.02352
G1 X72.729 Y98.972 E3.01491
G1 X73.181 Y98.972 E.02352
G1 X73.181 Y157.028 E3.01491
G1 X73.634 Y157.028 E.02352
G1 X73.634 Y98.972 E3.01491
G1 X74.087 Y98.972 E.02352
G1 X74.087 Y157.028 E3.01491
G1 X74.54 Y157.028 E.02352
G1 X74.54 Y98.972 E3.01491
G1 X74.993 Y98.972 E.02352
G1 X74.993 Y157.028 E3.01491
G1 X75.446 Y157.028 E.02352
G1 X75.446 Y98.972 E3.01491
G1 X75.898 Y98.972 E.02352
G1 X75.898 Y157.028 E3.01491
G1 X76.351 Y157.028 E.02352
G1 X76.351 Y98.972 E3.01491
G1 X76.804 Y98.972 E.02352
G1 X76.804 Y157.028 E3.0149
G1 X77.257 Y157.028 E.02352
G1 X77.257 Y98.972 E3.0149
G1 X77.71 Y98.972 E.02352
G1 X77.71 Y157.028 E3.0149
G1 X78.163 Y157.028 E.02352
G1 X78.163 Y98.972 E3.0149
G1 X78.616 Y98.972 E.02352
G1 X78.616 Y157.028 E3.0149
G1 X79.068 Y157.028 E.02352
G1 X79.068 Y98.972 E3.0149
G1 X79.521 Y98.973 E.02352
G1 X79.521 Y157.028 E3.0149
M73 P61 R18
G1 X79.974 Y157.028 E.02352
G1 X79.974 Y98.973 E3.0149
G1 X80.427 Y98.973 E.02352
G1 X80.427 Y157.028 E3.0149
G1 X80.88 Y157.028 E.02352
G1 X80.88 Y98.973 E3.0149
G1 X81.333 Y98.973 E.02352
G1 X81.333 Y157.028 E3.0149
G1 X81.785 Y157.028 E.02352
G1 X81.785 Y98.973 E3.01489
G1 X82.238 Y98.973 E.02352
G1 X82.238 Y157.028 E3.01489
G1 X82.691 Y157.028 E.02352
G1 X82.691 Y98.973 E3.01489
G1 X83.144 Y98.973 E.02352
G1 X83.144 Y157.028 E3.01489
G1 X83.597 Y157.028 E.02352
G1 X83.597 Y98.973 E3.01489
G1 X84.05 Y98.973 E.02352
G1 X84.05 Y157.028 E3.01489
G1 X84.503 Y157.028 E.02352
G1 X84.503 Y98.973 E3.01489
G1 X84.955 Y98.973 E.02352
G1 X84.955 Y157.028 E3.01489
G1 X85.408 Y157.028 E.02352
G1 X85.408 Y98.973 E3.01489
G1 X85.861 Y98.973 E.02352
G1 X85.861 Y157.028 E3.01489
G1 X86.314 Y157.028 E.02352
G1 X86.314 Y98.973 E3.01489
G1 X86.767 Y98.973 E.02352
G1 X86.767 Y157.028 E3.01489
G1 X87.22 Y157.028 E.02352
G1 X87.22 Y98.973 E3.01488
G1 X87.672 Y98.973 E.02352
G1 X87.672 Y157.028 E3.01488
G1 X88.125 Y157.028 E.02352
G1 X88.125 Y98.973 E3.01488
G1 X88.578 Y98.973 E.02352
G1 X88.578 Y157.028 E3.01488
G1 X89.031 Y157.028 E.02352
G1 X89.031 Y98.973 E3.01488
G1 X89.484 Y98.973 E.02352
G1 X89.484 Y157.231 E3.0254
M106 S127.5
G1 X125.259 Y157.231 F30000
M106 S255
G1 F3000
G1 X125.259 Y155.184 E.1063
G1 X124.806 Y155.093 E.02399
M73 P62 R18
G1 X124.806 Y157.028 E.10051
G1 X124.353 Y157.028 E.02352
G1 X124.353 Y155.002 E.10523
G3 X123.9 Y154.91 I.698 J-4.61 E.024
G1 X123.9 Y157.028 E.11
G1 X123.447 Y157.028 E.02352
G1 X123.447 Y154.795 E.11595
G1 X122.994 Y154.681 E.02426
G1 X122.994 Y157.028 E.1219
G1 X122.542 Y157.028 E.02352
G1 X122.542 Y154.566 E.12785
G3 X122.089 Y154.431 I1.142 J-4.633 E.02456
G1 X122.089 Y157.028 E.1349
G1 X121.636 Y157.028 E.02352
M73 P62 R17
G1 X121.636 Y154.292 E.1421
G1 X121.183 Y154.153 E.0246
G1 X121.183 Y157.028 E.14931
G1 X120.73 Y157.028 E.02352
G1 X120.73 Y153.995 E.1575
G1 X120.277 Y153.832 E.02501
G1 X120.277 Y157.028 E.166
G1 X119.825 Y157.028 E.02352
G1 X119.825 Y153.668 E.17451
G3 X119.372 Y153.486 I1.606 J-4.656 E.02535
G1 X119.372 Y157.028 E.18395
G1 X118.919 Y157.028 E.02352
G1 X118.919 Y153.297 E.19379
G1 X118.466 Y153.107 E.02549
G1 X118.466 Y157.028 E.20363
G1 X118.013 Y157.028 E.02352
G1 X118.013 Y152.899 E.21445
G1 X117.56 Y152.682 E.02607
G1 X117.56 Y157.028 E.22569
G1 X117.107 Y157.028 E.02352
G1 X117.107 Y152.466 E.23694
G3 X116.655 Y152.228 I2.171 J-4.684 E.02657
G1 X116.655 Y157.028 E.24929
G1 X116.202 Y157.028 E.02352
G1 X116.202 Y151.983 E.262
G1 X115.749 Y151.738 E.02673
G1 X115.749 Y157.028 E.27471
G1 X115.296 Y157.028 E.02352
G1 X115.296 Y151.467 E.2888
G1 X114.843 Y151.192 E.0275
G1 X114.843 Y157.028 E.30306
G1 X114.39 Y157.028 E.02352
G1 X114.39 Y150.914 E.31749
G1 X113.938 Y150.608 E.02839
G1 X113.938 Y157.028 E.3334
G1 X113.485 Y157.028 E.02352
G1 X113.485 Y150.302 E.34931
M73 P63 R17
G3 X113.032 Y149.982 I2.999 J-4.725 E.02881
G1 X113.032 Y157.028 E.36592
G1 X112.579 Y157.028 E.02352
G1 X112.579 Y149.642 E.38359
G1 X112.126 Y149.302 E.02941
G1 X112.126 Y157.028 E.40125
G1 X111.673 Y157.028 E.02352
G1 X111.673 Y148.932 E.42043
G1 X111.22 Y148.556 E.03059
G1 X111.22 Y157.028 E.43999
G1 X110.768 Y157.028 E.02352
G1 X110.768 Y148.167 E.46016
G1 X110.315 Y147.751 E.03194
G1 X110.315 Y157.028 E.48178
G1 X109.862 Y157.028 E.02352
G1 X109.862 Y147.335 E.5034
G3 X109.409 Y146.879 I4.363 J-4.793 E.03336
G1 X109.409 Y157.028 E.52704
G1 X108.956 Y157.028 E.02352
G1 X108.956 Y146.42 E.55091
G3 X108.503 Y145.931 I4.704 J-4.81 E.03463
G1 X108.503 Y157.028 E.5763
G1 X108.051 Y157.028 E.02352
G1 X108.051 Y145.423 E.60267
G3 X107.598 Y144.892 I5.132 J-4.831 E.03627
G1 X107.598 Y157.028 E.63027
G1 X107.145 Y157.028 E.02352
G1 X107.145 Y144.33 E.65942
G3 X106.692 Y143.745 I5.676 J-4.858 E.03846
G1 X106.692 Y157.028 E.68983
G1 X106.239 Y157.028 E.02352
G1 X106.239 Y143.123 E.72214
G3 X105.786 Y142.467 I6.382 J-4.893 E.04139
G1 X105.786 Y157.028 E.75618
G1 X105.333 Y157.028 E.02352
G1 X105.333 Y141.775 E.7921
G3 X104.881 Y141.027 I7.315 J-4.939 E.04543
G1 X104.881 Y157.028 E.83095
G1 X104.428 Y157.028 E.02352
G1 X104.428 Y140.25 E.87132
G1 X103.975 Y139.381 E.05087
G1 X103.975 Y157.028 E.91643
G1 X103.522 Y157.028 E.02352
G1 X103.522 Y138.45 E.96481
G3 X103.069 Y137.439 I9.966 J-5.071 E.05755
G1 X103.069 Y157.028 E1.01731
G1 X102.616 Y157.028 E.02352
G1 X102.616 Y136.309 E1.07595
G1 X102.164 Y135.001 E.0719
G1 X102.164 Y157.028 E1.14389
G1 X101.711 Y157.028 E.02352
G1 X101.711 Y133.479 E1.22293
G2 X101.524 Y133.354 I-.177 J.062 E.01254
G1 X101.258 Y133.354 E.0138
G1 X101.258 Y157.028 E1.22943
G1 X100.805 Y157.028 E.02352
G1 X100.805 Y133.354 E1.22942
G1 X100.352 Y133.354 E.02352
G1 X100.352 Y157.028 E1.22942
G1 X99.899 Y157.028 E.02352
G1 X99.899 Y133.354 E1.22942
G1 X99.446 Y133.354 E.02352
G1 X99.446 Y157.028 E1.22942
G1 X98.994 Y157.028 E.02352
G1 X98.994 Y133.354 E1.22942
G1 X98.541 Y133.354 E.02352
G1 X98.541 Y157.028 E1.22942
G1 X98.088 Y157.028 E.02352
G1 X98.088 Y133.354 E1.22942
G1 X97.635 Y133.354 E.02352
G1 X97.635 Y157.028 E1.22942
G1 X97.182 Y157.028 E.02352
G1 X97.182 Y133.354 E1.22942
G1 X96.729 Y133.354 E.02352
G1 X96.729 Y157.028 E1.22942
G1 X96.277 Y157.028 E.02352
G1 X96.277 Y133.354 E1.22942
G1 X95.824 Y133.354 E.02352
G1 X95.824 Y157.028 E1.22942
G1 X95.371 Y157.028 E.02352
G1 X95.371 Y133.354 E1.22942
G1 X94.918 Y133.354 E.02352
G1 X94.918 Y157.028 E1.22942
G1 X94.465 Y157.028 E.02352
G1 X94.465 Y133.354 E1.22942
G1 X94.012 Y133.354 E.02352
G1 X94.012 Y157.028 E1.22942
G1 X93.559 Y157.028 E.02352
G1 X93.559 Y133.354 E1.22942
G1 X93.107 Y133.354 E.02352
G1 X93.107 Y157.028 E1.22942
G1 X92.654 Y157.028 E.02352
G1 X92.654 Y133.354 E1.22942
G1 X92.201 Y133.354 E.02352
G1 X92.201 Y157.028 E1.22941
G1 X91.748 Y157.028 E.02352
G1 X91.748 Y133.354 E1.22941
G1 X91.295 Y133.354 E.02352
G1 X91.295 Y157.028 E1.22941
G1 X90.842 Y157.028 E.02352
G1 X90.842 Y133.354 E1.22941
G1 X90.39 Y133.354 E.02352
G1 X90.39 Y157.028 E1.22941
G1 X89.937 Y157.028 E.02352
G1 X89.937 Y98.973 E3.01488
G1 X90.39 Y98.973 E.02352
G1 X90.39 Y104.646 E.2946
G1 X90.842 Y104.646 E.02352
G1 X90.842 Y98.973 E.29459
G1 X91.295 Y98.973 E.02352
G1 X91.295 Y104.645 E.29458
G1 X91.748 Y104.645 E.02352
G1 X91.748 Y98.973 E.29457
G1 X92.201 Y98.973 E.02352
G1 X92.201 Y104.645 E.29456
G1 X92.654 Y104.645 E.02352
G1 X92.654 Y98.973 E.29456
G1 X93.107 Y98.973 E.02352
G1 X93.107 Y104.645 E.29455
G1 X93.559 Y104.645 E.02352
G1 X93.559 Y98.973 E.29454
G1 X94.012 Y98.973 E.02352
G1 X94.012 Y104.645 E.29453
G1 X94.465 Y104.644 E.02352
G1 X94.465 Y98.973 E.29452
G1 X94.918 Y98.973 E.02352
G1 X94.918 Y104.644 E.29452
G1 X95.371 Y104.644 E.02352
G1 X95.371 Y98.973 E.29451
G1 X95.824 Y98.973 E.02352
G1 X95.824 Y104.644 E.2945
G1 X96.277 Y104.644 E.02352
G1 X96.277 Y98.973 E.29449
G1 X96.729 Y98.973 E.02352
G1 X96.729 Y104.644 E.29448
G1 X97.182 Y104.644 E.02352
G1 X97.182 Y98.973 E.29448
G1 X97.635 Y98.973 E.02352
G1 X97.635 Y104.644 E.29447
G1 X98.088 Y104.643 E.02352
G1 X98.088 Y98.973 E.29446
G1 X98.541 Y98.973 E.02352
G1 X98.541 Y104.643 E.29445
G1 X98.994 Y104.643 E.02352
G1 X98.994 Y98.973 E.29444
G1 X99.446 Y98.973 E.02352
G1 X99.446 Y104.643 E.29444
G1 X99.899 Y104.643 E.02352
G1 X99.899 Y98.973 E.29443
G1 X100.352 Y98.973 E.02352
G1 X100.352 Y104.643 E.29442
G1 X100.805 Y104.643 E.02352
G1 X100.805 Y98.973 E.29441
G1 X101.258 Y98.973 E.02352
G1 X101.258 Y104.642 E.2944
G1 X101.711 Y104.642 E.02352
G1 X101.711 Y98.973 E.2944
G1 X102.164 Y98.973 E.02352
G1 X102.164 Y104.642 E.29439
G1 X102.616 Y104.642 E.02352
G1 X102.616 Y98.973 E.29438
G1 X103.069 Y98.973 E.02352
G1 X103.069 Y104.642 E.29437
G1 X103.522 Y104.642 E.02352
G1 X103.522 Y98.973 E.29436
G1 X103.975 Y98.973 E.02352
G1 X103.975 Y104.642 E.29436
G1 X104.428 Y104.641 E.02352
G1 X104.428 Y98.973 E.29435
G1 X104.881 Y98.973 E.02352
G1 X104.881 Y104.641 E.29434
G1 X105.333 Y104.641 E.02352
G1 X105.333 Y98.973 E.29433
G1 X105.786 Y98.973 E.02352
G1 X105.786 Y104.641 E.29432
G1 X106.239 Y104.641 E.02352
G1 X106.239 Y98.973 E.29432
G1 X106.692 Y98.973 E.02352
G1 X106.692 Y104.641 E.29431
G1 X107.145 Y104.641 E.02352
G1 X107.145 Y98.974 E.2943
G1 X107.598 Y98.974 E.02352
G1 X107.598 Y104.806 E.30288
M106 S127.5
; WIPE_START
G1 F24000
G1 X107.598 Y102.806 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I1.12 J.477 P1  F30000
G1 X108.875 Y99.81 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.539114
; LAYER_HEIGHT: 0.2
G1 F12696.647
G1 X115.565 Y99.81 E.27053
G1 X116.063 Y100.246 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X116.061 Y99.373 E.02683
G1 X108.439 Y99.373 E.23422
G1 X108.438 Y100.246 E.02683
G1 X116.003 Y100.246 E.23245
G1 X116.44 Y100.623 F30000
G1 F15000
G1 X116.438 Y98.996 E.05
G1 X108.062 Y98.996 E.25735
G1 X108.06 Y100.623 E.05001
G1 X116.38 Y100.623 E.25566
G1 X116.854 Y98.771 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.404882
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X116.862 Y104.47 E.29894
G2 X116.991 Y104.629 I.234 J-.057 E.01111
G2 X117.317 Y104.646 I.204 J-.786 E.01725
G1 X117.309 Y98.974 E.29755
G1 X117.764 Y98.974 E.02386
G1 X117.772 Y104.646 E.29754
G1 X118.227 Y104.646 E.02386
G1 X118.218 Y98.974 E.29754
G1 X118.673 Y98.974 E.02386
G1 X118.682 Y104.646 E.29753
G1 X119.137 Y104.646 E.02386
G1 X119.128 Y98.974 E.29752
G1 X119.583 Y98.974 E.02386
G1 X119.591 Y104.646 E.29752
G1 X120.046 Y104.645 E.02386
G1 X120.038 Y98.974 E.29751
G1 X120.493 Y98.974 E.02386
G1 X120.501 Y104.645 E.29751
G1 X120.956 Y104.645 E.02386
G1 X120.948 Y98.974 E.2975
G1 X121.403 Y98.974 E.02386
G1 X121.411 Y104.645 E.29749
G1 X121.866 Y104.645 E.02386
G1 X121.858 Y98.974 E.29749
G1 X122.312 Y98.974 E.02386
G1 X122.321 Y104.645 E.29748
G1 X122.776 Y104.645 E.02386
G1 X122.767 Y98.974 E.29748
G1 X123.222 Y98.974 E.02386
G1 X123.23 Y104.645 E.29747
G1 X123.685 Y104.645 E.02386
G1 X123.677 Y98.974 E.29746
G1 X124.132 Y98.974 E.02386
G1 X124.14 Y104.645 E.29746
G1 X124.595 Y104.644 E.02386
G1 X124.587 Y98.974 E.29745
G1 X125.042 Y98.974 E.02386
G1 X125.05 Y104.644 E.29745
G1 X125.505 Y104.644 E.02386
G1 X125.497 Y98.974 E.29744
G1 X125.951 Y98.974 E.02386
G1 X125.96 Y104.644 E.29743
M73 P64 R17
G1 X126.415 Y104.644 E.02386
G1 X126.406 Y98.974 E.29743
G1 X126.861 Y98.974 E.02386
G1 X126.87 Y104.644 E.29742
G1 X127.324 Y104.644 E.02386
G1 X127.316 Y98.974 E.29742
G1 X127.771 Y98.974 E.02386
G1 X127.779 Y104.644 E.29741
G1 X128.234 Y104.644 E.02386
G1 X128.226 Y98.974 E.2974
G1 X128.681 Y98.974 E.02386
G1 X128.689 Y104.644 E.2974
G1 X129.144 Y104.644 E.02386
G1 X129.136 Y98.974 E.29739
G1 X129.591 Y98.974 E.02386
G1 X129.599 Y104.643 E.29739
G1 X130.054 Y104.643 E.02386
G1 X130.045 Y98.974 E.29738
G1 X130.5 Y98.974 E.02386
G1 X130.509 Y104.643 E.29737
G1 X130.963 Y104.643 E.02386
G1 X130.955 Y98.974 E.29737
G1 X131.41 Y98.974 E.02386
G1 X131.418 Y104.643 E.29736
G1 X131.873 Y104.643 E.02386
G1 X131.865 Y98.974 E.29736
G1 X132.32 Y98.974 E.02386
G1 X132.328 Y104.643 E.29735
G1 X132.783 Y104.643 E.02386
G1 X132.775 Y98.974 E.29735
G1 X133.23 Y98.974 E.02386
G1 X133.238 Y104.643 E.29734
G1 X133.693 Y104.643 E.02386
G1 X133.684 Y98.974 E.29733
G1 X134.139 Y98.974 E.02386
G1 X134.148 Y104.642 E.29733
G1 X134.603 Y104.642 E.02386
G1 X134.594 Y98.975 E.29732
G1 X135.049 Y98.975 E.02386
G1 X135.057 Y104.642 E.29732
G1 X135.512 Y104.642 E.02386
G1 X135.504 Y98.975 E.29731
G1 X135.959 Y98.975 E.02386
G1 X135.967 Y104.642 E.2973
G1 X136.422 Y104.642 E.02386
G1 X136.414 Y98.975 E.2973
G1 X136.869 Y98.975 E.02386
G1 X136.877 Y104.642 E.29729
G1 X137.332 Y104.642 E.02386
G1 X137.324 Y98.975 E.29729
G1 X137.778 Y98.975 E.02386
G1 X137.787 Y104.642 E.29728
G1 X138.242 Y104.642 E.02386
G1 X138.233 Y98.975 E.29727
G1 X138.688 Y98.975 E.02386
G1 X138.696 Y104.641 E.29727
G1 X139.151 Y104.641 E.02386
G1 X139.143 Y98.975 E.29726
G1 X139.598 Y98.975 E.02386
G1 X139.606 Y104.641 E.29726
G1 X140.061 Y104.641 E.02386
G1 X140.053 Y98.975 E.29725
G1 X140.508 Y98.975 E.02386
G1 X140.516 Y104.641 E.29724
G1 X140.971 Y104.641 E.02386
G1 X140.963 Y98.975 E.29724
G1 X141.417 Y98.975 E.02386
G1 X141.426 Y104.641 E.29723
G1 X141.881 Y104.641 E.02386
G1 X141.872 Y98.975 E.29723
G1 X142.327 Y98.975 E.02386
G1 X142.336 Y104.641 E.29722
G1 X142.79 Y104.641 E.02386
G1 X142.782 Y98.975 E.29721
G1 X143.237 Y98.975 E.02386
G1 X143.245 Y104.641 E.29721
G1 X143.7 Y104.64 E.02386
G1 X143.692 Y98.975 E.2972
G1 X144.147 Y98.975 E.02386
G1 X144.155 Y104.785 E.30479
M106 S127.5
; WIPE_START
G1 F24000
G1 X144.152 Y102.785 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I1.126 J.462 P1  F30000
G1 X145.374 Y99.81 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.537794
; LAYER_HEIGHT: 0.2
G1 F12730.513
G1 X152.066 Y99.81 E.26986
G1 X144.937 Y100.246 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X152.563 Y100.246 E.2343
G1 X152.561 Y99.375 E.02678
G1 X144.939 Y99.374 E.23422
G1 X144.937 Y100.186 E.02495
G1 X144.56 Y100.623 F30000
G1 F15000
G1 X152.94 Y100.623 E.25751
G1 X152.938 Y98.998 E.04996
G1 X144.562 Y98.997 E.25735
G1 X144.56 Y100.563 E.04812
; WIPE_START
G1 F24000
G1 X144.562 Y98.997 E-.59514
G1 X144.996 Y98.997 E-.16486
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.675 J1.013 P1  F30000
G1 X153.769 Y104.844 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.402749
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X153.76 Y98.975 E.30461
G1 X154.213 Y98.975 E.0235
G1 X154.222 Y104.641 E.29411
G1 X154.675 Y104.641 E.0235
G1 X154.665 Y98.975 E.29411
G1 X155.118 Y98.975 E.0235
G1 X155.127 Y104.642 E.29412
G1 X155.58 Y104.642 E.0235
G1 X155.571 Y98.975 E.29412
G1 X156.024 Y98.975 E.0235
G1 X156.033 Y104.642 E.29413
G1 X156.486 Y104.642 E.0235
G1 X156.476 Y98.975 E.29414
G1 X156.929 Y98.975 E.0235
G1 X156.938 Y104.642 E.29414
G1 X157.391 Y104.642 E.0235
G1 X157.382 Y98.975 E.29415
G1 X157.835 Y98.975 E.0235
G1 X157.844 Y104.642 E.29415
G1 X158.297 Y104.643 E.0235
G1 X158.287 Y98.975 E.29416
G1 X158.74 Y98.975 E.0235
G1 X158.749 Y104.643 E.29417
G1 X159.202 Y104.643 E.0235
G1 X159.193 Y98.975 E.29417
G1 X159.646 Y98.975 E.0235
G1 X159.655 Y104.643 E.29418
G1 X160.108 Y104.643 E.0235
G1 X160.098 Y98.975 E.29418
G1 X160.551 Y98.975 E.0235
G1 X160.56 Y104.643 E.29419
G1 X161.013 Y104.643 E.0235
G1 X161.004 Y98.975 E.2942
G1 X161.457 Y98.975 E.0235
G1 X161.466 Y104.643 E.2942
G1 X161.919 Y104.644 E.0235
G1 X161.909 Y98.975 E.29421
G1 X162.362 Y98.976 E.0235
G1 X162.371 Y104.644 E.29421
G1 X162.824 Y104.644 E.0235
G1 X162.815 Y98.976 E.29422
G1 X163.268 Y98.976 E.0235
G1 X163.277 Y104.644 E.29422
G1 X163.73 Y104.644 E.0235
G1 X163.72 Y98.976 E.29423
G1 X164.173 Y98.976 E.0235
G1 X164.182 Y104.644 E.29424
G1 X164.635 Y104.644 E.0235
G1 X164.626 Y98.976 E.29424
G1 X165.079 Y98.976 E.0235
G1 X165.088 Y104.644 E.29425
G1 X165.541 Y104.645 E.0235
G1 X165.531 Y98.976 E.29425
G1 X165.984 Y98.976 E.0235
G1 X165.993 Y104.645 E.29426
G1 X166.446 Y104.645 E.0235
G1 X166.437 Y98.976 E.29427
G1 X166.89 Y98.976 E.0235
G1 X166.899 Y104.645 E.29427
G1 X167.352 Y104.645 E.0235
G1 X167.342 Y98.976 E.29428
G1 X167.795 Y98.976 E.0235
G1 X167.804 Y104.645 E.29428
G1 X168.257 Y104.645 E.0235
G1 X168.248 Y98.976 E.29429
G1 X168.701 Y98.976 E.0235
G1 X168.71 Y104.645 E.29429
G1 X169.163 Y104.646 E.0235
G1 X169.153 Y98.976 E.2943
G1 X169.606 Y98.976 E.0235
G1 X169.616 Y104.848 E.30482
M106 S127.5
G1 X196.651 Y108.587 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X196.651 Y110.216 E.05401
G1 X204.044 Y117.609 E.34681
G1 X204.044 Y115.364 E.07447
G1 X196.651 Y122.756 E.34681
G1 X196.651 Y125.568 E.09325
G1 X201.432 Y130.349 E.22429
G1 X196.735 Y130.349 E.15582
G1 X204.044 Y123.04 E.34289
G1 X204.044 Y125.285 E.07447
G1 X196.651 Y117.892 E.34681
M73 P64 R16
G1 X196.651 Y115.08 E.09325
G1 X204.044 Y107.688 E.34681
G1 X204.044 Y109.933 E.07447
G1 X201.763 Y107.651 E.10702
G1 X200.135 Y107.651 E.05401
G1 X204.029 Y107.425 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.402749
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X204.021 Y102.788 E.24071
G2 X203.566 Y101.131 I-3.969 J.2 E.08992
G1 X203.576 Y107.223 E.31622
G1 X203.123 Y107.223 E.0235
G1 X203.112 Y100.443 E.35189
G2 X202.658 Y99.98 I-2.577 J2.07 E.0337
G1 X202.67 Y107.223 E.37593
G1 X202.217 Y107.223 E.0235
G1 X202.205 Y99.632 E.39402
G2 X201.752 Y99.379 I-1.512 J2.175 E.02698
G1 X201.765 Y107.223 E.40716
G1 X201.312 Y107.223 E.0235
G1 X201.299 Y99.192 E.41683
G2 X200.846 Y99.065 I-.873 J2.236 E.02446
G1 X200.859 Y107.223 E.42344
G1 X200.407 Y107.223 E.0235
G1 X200.393 Y99.003 E.42666
G2 X199.94 Y98.977 I-.335 J1.861 E.0236
G1 X199.954 Y107.223 E.42801
G1 X199.501 Y107.223 E.0235
G1 X199.488 Y98.977 E.42801
G1 X199.035 Y98.977 E.0235
G1 X199.048 Y107.223 E.42802
G1 X198.596 Y107.223 E.0235
G1 X198.582 Y98.977 E.42802
G1 X198.129 Y98.977 E.0235
G1 X198.143 Y107.223 E.42802
G1 X197.69 Y107.223 E.0235
G1 X197.677 Y98.977 E.42802
G1 X197.224 Y98.977 E.0235
G1 X197.237 Y107.223 E.42802
G1 X196.785 Y107.223 E.0235
G1 X196.771 Y98.977 E.42802
G1 X196.318 Y98.977 E.0235
G1 X196.413 Y157.028 E3.01323
G1 X196.865 Y157.028 E.0235
G1 X196.823 Y130.777 E1.36259
G1 X197.276 Y130.777 E.0235
G1 X197.318 Y157.028 E1.36259
G1 X197.771 Y157.028 E.0235
G1 X197.728 Y130.777 E1.36259
G1 X198.181 Y130.777 E.0235
G1 X198.224 Y157.028 E1.36259
G1 X198.676 Y157.028 E.0235
G1 X198.634 Y130.777 E1.36259
G1 X199.087 Y130.777 E.0235
G1 X199.129 Y157.028 E1.36259
G1 X199.582 Y157.028 E.0235
G1 X199.539 Y130.777 E1.36259
G1 X199.992 Y130.777 E.0235
G1 X200.035 Y157.026 E1.36246
G2 X200.487 Y156.994 I.068 J-2.304 E.02359
G1 X200.445 Y130.777 E1.36084
G1 X200.898 Y130.777 E.0235
G1 X200.94 Y156.912 E1.35653
G2 X201.393 Y156.774 I-.471 J-2.367 E.02459
G1 X201.35 Y130.777 E1.34941
G1 X201.803 Y130.777 E.0235
G1 X201.845 Y156.577 E1.33919
G1 X202.297 Y156.299 E.02757
G1 X202.256 Y130.777 E1.32473
G1 X202.709 Y130.777 E.0235
G1 X202.749 Y155.933 E1.30574
G1 X202.836 Y155.858 E.00593
G1 X203.201 Y155.437 E.02895
G1 X203.161 Y130.777 E1.28
G1 X203.614 Y130.777 E.0235
G1 X203.654 Y155.113 E1.26319
M106 S127.5
G1 X195.96 Y157.231 F30000
M106 S255
G1 F3000
G1 X195.866 Y98.977 E3.02374
G1 X195.413 Y98.977 E.0235
G1 X195.507 Y157.028 E3.01323
G1 X195.054 Y157.028 E.0235
G1 X194.96 Y98.977 E3.01323
G1 X194.507 Y98.977 E.0235
G1 X194.602 Y157.028 E3.01324
G1 X194.149 Y157.028 E.0235
G1 X194.055 Y98.977 E3.01324
G1 X193.602 Y98.977 E.0235
G1 X193.696 Y157.028 E3.01324
G1 X193.243 Y157.028 E.0235
G1 X193.149 Y98.977 E3.01324
G1 X192.696 Y98.977 E.0235
G1 X192.791 Y157.028 E3.01324
G1 X192.338 Y157.028 E.0235
G1 X192.244 Y98.977 E3.01324
G1 X191.791 Y98.977 E.0235
G1 X191.885 Y157.028 E3.01324
G1 X191.433 Y157.028 E.0235
G1 X191.338 Y98.977 E3.01324
G1 X190.885 Y98.977 E.0235
G1 X190.98 Y157.028 E3.01324
G1 X190.527 Y157.028 E.0235
G1 X190.433 Y98.977 E3.01324
G1 X189.98 Y98.977 E.0235
G1 X190.074 Y157.028 E3.01324
G1 X189.622 Y157.028 E.0235
G1 X189.527 Y98.976 E3.01324
G1 X189.074 Y98.976 E.0235
G1 X189.169 Y157.028 E3.01325
G1 X188.716 Y157.028 E.0235
G1 X188.622 Y98.976 E3.01325
G1 X188.169 Y98.976 E.0235
G1 X188.263 Y157.028 E3.01325
G1 X187.811 Y157.028 E.0235
G1 X187.716 Y98.976 E3.01325
G1 X187.263 Y98.976 E.0235
G1 X187.358 Y157.028 E3.01325
G1 X186.905 Y157.028 E.0235
G1 X186.811 Y98.976 E3.01325
G1 X186.358 Y98.976 E.0235
G1 X186.452 Y157.028 E3.01325
G1 X186 Y157.028 E.0235
G1 X185.905 Y98.976 E3.01325
G1 X185.452 Y98.976 E.0235
G1 X185.547 Y157.028 E3.01325
G1 X185.094 Y157.028 E.0235
G1 X185 Y98.976 E3.01325
G1 X184.547 Y98.976 E.0235
G1 X184.641 Y157.028 E3.01325
G1 X184.189 Y157.028 E.0235
G1 X184.094 Y98.976 E3.01326
G1 X183.641 Y98.976 E.0235
G1 X183.736 Y157.028 E3.01326
M73 P65 R16
G1 X183.283 Y157.028 E.0235
G1 X183.189 Y98.976 E3.01326
G1 X182.736 Y98.976 E.0235
G1 X182.83 Y157.028 E3.01326
G1 X182.378 Y157.028 E.0235
G1 X182.283 Y98.976 E3.01326
G1 X181.83 Y98.976 E.0235
G1 X181.925 Y157.028 E3.01326
G1 X181.472 Y157.028 E.0235
G1 X181.378 Y98.976 E3.01326
G1 X180.925 Y98.976 E.0235
G1 X181.019 Y157.028 E3.01326
G1 X180.567 Y157.028 E.0235
G1 X180.472 Y98.976 E3.01326
G1 X180.019 Y98.976 E.0235
G1 X180.114 Y157.028 E3.01326
G1 X179.661 Y157.028 E.0235
G1 X179.567 Y98.976 E3.01326
G1 X179.114 Y98.976 E.0235
G1 X179.208 Y157.028 E3.01326
G1 X178.756 Y157.028 E.0235
G1 X178.661 Y98.976 E3.01327
G1 X178.208 Y98.976 E.0235
G1 X178.303 Y157.028 E3.01327
G1 X177.85 Y157.028 E.0235
G1 X177.756 Y98.976 E3.01327
G1 X177.303 Y98.976 E.0235
G1 X177.397 Y157.028 E3.01327
G1 X176.945 Y157.028 E.0235
G1 X176.85 Y98.976 E3.01327
G1 X176.397 Y98.976 E.0235
G1 X176.492 Y157.028 E3.01327
G1 X176.039 Y157.028 E.0235
G1 X175.945 Y98.976 E3.01327
G1 X175.492 Y98.976 E.0235
G1 X175.586 Y157.028 E3.01327
G1 X175.134 Y157.028 E.0235
G1 X175.039 Y98.976 E3.01327
G1 X174.586 Y98.976 E.0235
G1 X174.681 Y157.028 E3.01327
G1 X174.228 Y157.028 E.0235
G1 X174.134 Y98.976 E3.01327
G1 X173.681 Y98.976 E.0235
G1 X173.775 Y157.028 E3.01327
G1 X173.323 Y157.028 E.0235
G1 X173.228 Y98.976 E3.01328
G1 X172.775 Y98.976 E.0235
G1 X172.87 Y157.028 E3.01328
M73 P66 R16
G1 X172.417 Y157.028 E.0235
G1 X172.323 Y98.976 E3.01328
G1 X171.87 Y98.976 E.0235
G1 X171.964 Y157.028 E3.01328
G1 X171.512 Y157.028 E.0235
G1 X171.417 Y98.976 E3.01328
G1 X170.964 Y98.976 E.0235
G1 X171.059 Y157.028 E3.01328
G1 X170.606 Y157.028 E.0235
G1 X170.512 Y98.976 E3.01328
G1 X170.059 Y98.976 E.0235
G1 X170.153 Y157.028 E3.01328
G1 X169.701 Y157.028 E.0235
G1 X169.662 Y133.354 E1.22882
G1 X169.209 Y133.354 E.0235
G1 X169.248 Y157.028 E1.22882
G1 X168.795 Y157.028 E.0235
G1 X168.757 Y133.354 E1.22882
G1 X168.304 Y133.354 E.0235
G1 X168.342 Y157.028 E1.22882
G1 X167.89 Y157.028 E.0235
G1 X167.851 Y133.354 E1.22883
G1 X167.398 Y133.354 E.0235
G1 X167.437 Y157.028 E1.22883
M73 P66 R15
G1 X166.984 Y157.028 E.0235
G1 X166.946 Y133.354 E1.22883
G1 X166.493 Y133.354 E.0235
G1 X166.531 Y157.028 E1.22883
G1 X166.079 Y157.028 E.0235
G1 X166.04 Y133.354 E1.22883
G1 X165.587 Y133.354 E.0235
G1 X165.626 Y157.028 E1.22883
G1 X165.173 Y157.028 E.0235
G1 X165.135 Y133.354 E1.22883
G1 X164.682 Y133.354 E.0235
G1 X164.72 Y157.028 E1.22883
G1 X164.268 Y157.028 E.0235
G1 X164.229 Y133.354 E1.22883
G1 X163.776 Y133.354 E.0235
G1 X163.815 Y157.028 E1.22884
G1 X163.362 Y157.028 E.0235
G1 X163.324 Y133.354 E1.22884
G1 X162.871 Y133.354 E.0235
G1 X162.909 Y157.028 E1.22884
G1 X162.457 Y157.028 E.0235
G1 X162.418 Y133.354 E1.22884
G1 X161.965 Y133.354 E.0235
G1 X162.004 Y157.028 E1.22884
M73 P67 R15
G1 X161.551 Y157.028 E.0235
G1 X161.513 Y133.354 E1.22884
G1 X161.06 Y133.354 E.0235
G1 X161.098 Y157.028 E1.22884
G1 X160.646 Y157.028 E.0235
G1 X160.607 Y133.354 E1.22884
G1 X160.154 Y133.354 E.0235
G1 X160.193 Y157.028 E1.22884
G1 X159.74 Y157.028 E.0235
G1 X159.702 Y133.354 E1.22885
G2 X159.334 Y133.4 I-.113 J.589 E.01952
G2 X159.249 Y133.616 I.324 J.253 E.01224
G1 X159.287 Y157.028 E1.21523
G1 X158.835 Y157.028 E.0235
G1 X158.799 Y135.108 E1.13778
G1 X158.348 Y136.396 E.0708
G1 X158.382 Y157.028 E1.07095
G1 X157.929 Y157.028 E.0235
G1 X157.897 Y137.524 E1.0124
G3 X157.446 Y138.519 I-10.248 J-4.045 E.05675
G1 X157.476 Y157.028 E.96073
G1 X157.024 Y157.028 E.0235
G1 X156.995 Y139.439 E.91301
G3 X156.544 Y140.302 I-8.918 J-4.112 E.05059
G1 X156.571 Y157.028 E.86819
G1 X156.118 Y157.028 E.0235
G1 X156.092 Y141.074 E.82811
G3 X155.641 Y141.814 I-7.679 J-4.177 E.04502
G1 X155.665 Y157.028 E.7897
G1 X155.213 Y157.028 E.0235
G1 X155.189 Y142.506 E.75382
G3 X154.737 Y143.155 I-6.762 J-4.225 E.04106
G1 X154.76 Y157.028 E.72013
G1 X154.307 Y157.028 E.0235
G1 X154.285 Y143.776 E.68786
G3 X153.834 Y144.356 I-6.069 J-4.261 E.03818
G1 X153.854 Y157.028 E.65775
G1 X153.402 Y157.028 E.0235
G1 X153.382 Y144.918 E.62862
G3 X152.93 Y145.444 I-5.533 J-4.288 E.03605
G1 X152.949 Y157.028 E.60127
G1 X152.496 Y157.028 E.0235
G1 X152.478 Y145.952 E.57492
G3 X152.026 Y146.437 I-5.112 J-4.308 E.03443
G1 X152.043 Y157.028 E.54974
G1 X151.591 Y157.028 E.0235
G1 X151.574 Y146.897 E.52588
G3 X151.122 Y147.349 I-4.779 J-4.327 E.03319
G1 X151.138 Y157.028 E.50242
G1 X150.685 Y157.028 E.0235
G1 X150.67 Y147.765 E.48082
G1 X150.218 Y148.181 E.03189
G1 X150.232 Y157.028 E.45922
G1 X149.78 Y157.028 E.0235
G1 X149.766 Y148.567 E.4392
G1 X149.314 Y148.943 E.03054
G1 X149.327 Y157.028 E.41965
G1 X148.874 Y157.028 E.0235
G1 X148.861 Y149.31 E.4006
G1 X148.409 Y149.651 E.02937
G1 X148.421 Y157.028 E.38295
G1 X147.969 Y157.028 E.0235
G1 X147.957 Y149.991 E.36529
G3 X147.505 Y150.309 I-3.429 J-4.396 E.02871
G1 X147.516 Y157.028 E.34879
G1 X147.063 Y157.028 E.0235
G1 X147.053 Y150.615 E.33289
G1 X146.6 Y150.921 E.02835
G1 X146.61 Y157.028 E.31699
G1 X146.158 Y157.028 E.0235
G1 X146.148 Y151.197 E.30265
G1 X145.696 Y151.472 E.02747
G1 X145.705 Y157.028 E.2884
G1 X145.252 Y157.028 E.0235
G1 X145.243 Y151.742 E.27439
G1 X144.791 Y151.987 E.0267
G1 X144.799 Y157.028 E.26168
G1 X144.347 Y157.028 E.0235
G1 X144.339 Y152.232 E.24897
G3 X143.886 Y152.468 I-2.61 J-4.437 E.02651
G1 X143.894 Y157.028 E.23669
G1 X143.441 Y157.028 E.0235
G1 X143.434 Y152.685 E.22545
G1 X142.982 Y152.901 E.02603
G1 X142.988 Y157.028 E.21421
G1 X142.536 Y157.028 E.0235
G1 X142.529 Y153.109 E.20345
G1 X142.077 Y153.298 E.02546
G1 X142.083 Y157.028 E.1936
G1 X141.63 Y157.028 E.0235
G1 X141.624 Y153.488 E.18376
G3 X141.172 Y153.669 I-2.05 J-4.467 E.02531
G1 X141.177 Y157.028 E.17437
G1 X140.725 Y157.028 E.0235
G1 X140.719 Y153.833 E.16587
G1 X140.267 Y153.996 E.02498
G1 X140.272 Y157.028 E.15737
G1 X139.819 Y157.028 E.0235
G1 X139.814 Y154.154 E.14921
G1 X139.362 Y154.292 E.02457
G1 X139.366 Y157.028 E.142
G1 X138.914 Y157.028 E.0235
G1 X138.909 Y154.431 E.1348
G3 X138.457 Y154.567 I-1.589 J-4.49 E.02453
G1 X138.461 Y157.028 E.12777
G1 X138.008 Y157.028 E.0235
G1 X138.004 Y154.681 E.12183
G1 X137.552 Y154.796 E.02423
G1 X137.555 Y157.028 E.11588
G1 X137.103 Y157.028 E.0235
G1 X137.099 Y154.91 E.10993
G3 X136.647 Y155.002 I-1.147 J-4.511 E.02398
G1 X136.65 Y157.028 E.10518
G1 X136.197 Y157.028 E.0235
G1 X136.194 Y155.093 E.10046
G1 X135.741 Y155.184 E.02396
G1 X135.745 Y157.231 E.10624
M106 S127.5
G1 X126.798 Y156.226 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.470528
; LAYER_HEIGHT: 0.2
G1 F14733.12
G1 X127.269 Y156.25 E.01645
; LINE_WIDTH: 0.423751
G1 F15000
G1 X127.741 Y156.273 E.01465
; LINE_WIDTH: 0.376974
G1 X128.212 Y156.297 E.01285
; LINE_WIDTH: 0.330196
M73 P68 R15
G1 X128.257 Y156.298 E.00104
; LINE_WIDTH: 0.32689
G1 X128.99 Y156.316 E.01698
; LINE_WIDTH: 0.265145
G2 X131.277 Y156.335 I1.857 J-89.84 E.04141
; LINE_WIDTH: 0.254202
G1 X132.011 Y156.316 E.01264
; LINE_WIDTH: 0.292709
G2 X132.79 Y156.297 I-.41 J-31.355 E.01586
; LINE_WIDTH: 0.330366
G1 X133.241 Y156.274 E.01057
; LINE_WIDTH: 0.377116
G1 X133.691 Y156.252 E.01229
; LINE_WIDTH: 0.423865
G1 X134.142 Y156.229 E.01401
G1 X126.439 Y155.77 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X126.353 Y156.629 E.02653
G1 X134.647 Y156.629 E.25483
G1 X134.561 Y155.77 E.02653
G3 X126.498 Y155.778 I-4.064 J-30.252 E.24848
G1 X126.103 Y155.338 F30000
G1 F15000
G1 X125.937 Y157.006 E.0515
G1 X135.063 Y157.006 E.28042
G1 X134.897 Y155.338 E.0515
G3 X126.162 Y155.347 I-4.397 J-29.473 E.26937
M106 S160.65
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.823 Y155.446 E-.25385
G1 X128.148 Y155.577 E-.50615
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/105
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
G3 Z7 I.577 J1.072 P1  F30000
G1 X169.703 Y133.203 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X159.443 Y133.202 E.34035
G2 X159.136 Y133.445 I-.001 J.313 E.01399
G3 X101.864 Y133.445 I-28.636 J-7.576 E2.57866
G2 X101.558 Y133.203 I-.304 J.07 E.01398
G1 X90.297 Y133.203 E.37354
G1 X90.297 Y104.797 E.94228
G1 X107.472 Y104.797 E.56973
G2 X107.797 Y104.474 I-.007 J-.333 E.01677
G1 X107.797 Y100.797 E.12199
G1 X116.703 Y100.797 E.29543
G1 X116.703 Y104.472 E.12191
G2 X117.026 Y104.797 I.333 J-.007 E.01677
G1 X143.974 Y104.797 E.89394
G2 X144.297 Y104.472 I-.01 J-.333 E.01677
G1 X144.297 Y100.797 E.12191
G1 X153.203 Y100.797 E.29543
G1 X153.203 Y104.474 E.12199
G2 X153.528 Y104.797 I.333 J-.01 E.01677
G1 X169.703 Y104.797 E.53656
G1 X169.703 Y133.143 E.94029
G1 X169.311 Y132.811 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X159.427 Y132.81 E.30371
G2 X158.763 Y133.324 I.013 J.702 E.02765
G3 X102.237 Y133.324 I-28.263 J-7.456 E2.35832
G2 X101.573 Y132.811 I-.676 J.188 E.02764
G1 X90.689 Y132.811 E.33445
G1 X90.689 Y105.189 E.84874
G1 X107.495 Y105.189 E.51641
G2 X108.189 Y104.496 I-.028 J-.722 E.03314
G1 X108.189 Y101.189 E.10162
G1 X116.311 Y101.189 E.24956
G1 X116.311 Y104.495 E.10159
G2 X117.004 Y105.189 I.719 J-.025 E.03317
G1 X143.996 Y105.189 E.8294
G2 X144.689 Y104.495 I-.028 J-.722 E.03314
G1 X144.689 Y101.189 E.10159
G1 X152.811 Y101.189 E.24956
G1 X152.811 Y104.496 E.10162
G2 X153.505 Y105.189 I.722 J-.028 E.03314
G1 X169.311 Y105.189 E.48568
G1 X169.311 Y132.751 E.84689
M204 S10000
; WIPE_START
G1 F24000
G1 X167.311 Y132.763 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.318 J-1.175 P1  F30000
G1 X55.624 Y102.569 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X60.007 Y98.602 I4.389 J.444 E.2149
G1 X200.206 Y98.607 E4.65064
G3 X204.398 Y103.007 I-.209 J4.396 E.22252
G1 X204.398 Y152.993 E1.6581
G3 X199.993 Y157.398 I-4.411 J-.006 E.22946
G1 X60.007 Y157.398 E4.64356
G3 X55.602 Y152.993 I.006 J-4.411 E.22946
G1 X55.602 Y103.007 E1.6581
G3 X55.619 Y102.629 I4.411 J.006 E.01258
G1 X55.234 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.225 Y98.216 E4.30864
G3 X204.79 Y103.003 I-.228 J4.788 E.22432
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.804 J-.012 E.23117
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.012 J-4.804 E.23117
G1 X55.21 Y103.003 E1.5362
G3 X55.229 Y102.59 I4.804 J.012 E.01268
M204 S10000
; WIPE_START
G1 F24000
G1 X55.302 Y102.065 E-.20144
G1 X55.416 Y101.61 E-.17855
G1 X55.575 Y101.167 E-.17862
G1 X55.776 Y100.742 E-.17862
G1 X55.806 Y100.691 E-.02277
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.634 J1.039 P1  F30000
G1 X56.281 Y100.98 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420831
G1 F15000
G1 X56.993 Y100.268 E.03101
G3 X58.449 Y99.244 I3.301 J3.147 E.05516
G1 X58.608 Y99.187 E.00521
G1 X56.182 Y101.613 E.10564
G1 X56.015 Y102.207 E.01901
G1 X55.999 Y102.33 E.00382
G1 X59.334 Y98.995 E.14522
G3 X59.924 Y98.94 I.575 J2.954 E.01827
G1 X55.941 Y102.923 E.17347
G1 X55.941 Y103.457 E.01646
G1 X60.463 Y98.935 E.19694
G1 X60.997 Y98.935 E.01646
G1 X55.941 Y103.992 E.22021
G1 X55.941 Y104.526 E.01646
G1 X61.532 Y98.935 E.24349
G1 X62.066 Y98.935 E.01646
G1 X55.941 Y105.061 E.26677
G1 X55.941 Y105.595 E.01646
G1 X62.6 Y98.935 E.29005
G1 X63.135 Y98.935 E.01646
G1 X55.94 Y106.13 E.31332
G1 X55.94 Y106.664 E.01646
G1 X63.669 Y98.935 E.3366
G1 X64.204 Y98.936 E.01646
G1 X55.94 Y107.199 E.35988
G1 X55.94 Y107.259 E.00186
G1 X56.414 Y107.259 E.0146
G1 X64.738 Y98.936 E.3625
G1 X65.273 Y98.936 E.01646
G1 X56.949 Y107.259 E.3625
G1 X57.483 Y107.259 E.01646
G1 X65.807 Y98.936 E.3625
G1 X66.341 Y98.936 E.01646
G1 X58.018 Y107.259 E.3625
G1 X58.552 Y107.259 E.01646
G1 X66.876 Y98.936 E.3625
G1 X67.41 Y98.936 E.01646
G1 X59.087 Y107.259 E.3625
G1 X59.621 Y107.259 E.01646
G1 X67.945 Y98.936 E.3625
G1 X68.479 Y98.936 E.01646
G1 X60.156 Y107.259 E.3625
G1 X60.69 Y107.259 E.01646
G1 X69.014 Y98.936 E.3625
G1 X69.548 Y98.936 E.01646
G1 X61.224 Y107.259 E.3625
G1 X61.759 Y107.259 E.01646
G1 X70.082 Y98.936 E.36249
G1 X70.617 Y98.936 E.01646
G1 X62.293 Y107.259 E.36249
G1 X62.828 Y107.259 E.01646
G1 X71.151 Y98.936 E.36249
G1 X71.686 Y98.936 E.01646
G1 X63.362 Y107.259 E.36249
G1 X63.741 Y107.259 E.01166
G1 X63.741 Y107.415 E.0048
G1 X72.22 Y98.936 E.36928
G1 X72.755 Y98.936 E.01646
G1 X63.741 Y107.95 E.39256
G1 X63.741 Y108.484 E.01646
G1 X73.289 Y98.936 E.41583
G1 X73.823 Y98.936 E.01646
G1 X63.741 Y109.019 E.43911
G1 X63.741 Y109.553 E.01646
G1 X74.358 Y98.936 E.46238
G1 X74.892 Y98.936 E.01646
G1 X63.741 Y110.087 E.48566
G1 X63.741 Y110.622 E.01646
G1 X75.427 Y98.936 E.50893
G1 X75.961 Y98.936 E.01646
G1 X63.741 Y111.156 E.53221
G1 X63.741 Y111.691 E.01646
G1 X76.496 Y98.936 E.55548
G1 X77.03 Y98.936 E.01646
G1 X63.741 Y112.225 E.57875
G1 X63.741 Y112.76 E.01646
G1 X77.564 Y98.936 E.60203
G1 X78.099 Y98.936 E.01646
G1 X63.741 Y113.294 E.6253
G1 X63.741 Y113.829 E.01646
G1 X78.633 Y98.936 E.64858
G1 X79.168 Y98.936 E.01646
G1 X63.741 Y114.363 E.67185
G1 X63.741 Y114.897 E.01646
G1 X79.702 Y98.936 E.69513
G1 X80.237 Y98.936 E.01646
G1 X63.741 Y115.432 E.7184
G1 X63.741 Y115.966 E.01646
G1 X80.771 Y98.936 E.74168
G1 X81.305 Y98.936 E.01646
G1 X63.741 Y116.501 E.76495
G1 X63.741 Y117.035 E.01646
G1 X81.84 Y98.936 E.78823
G1 X82.374 Y98.936 E.01646
G1 X63.741 Y117.57 E.8115
G1 X63.741 Y118.104 E.01646
G1 X82.909 Y98.936 E.83478
G1 X83.443 Y98.936 E.01646
G1 X63.741 Y118.639 E.85805
G1 X63.741 Y119.173 E.01646
G1 X83.978 Y98.936 E.88132
G1 X84.512 Y98.936 E.01646
G1 X63.741 Y119.707 E.9046
G1 X63.741 Y120.242 E.01646
G1 X85.046 Y98.936 E.92787
G1 X85.581 Y98.936 E.01646
G1 X63.741 Y120.776 E.95115
G1 X63.741 Y121.311 E.01646
G1 X86.115 Y98.936 E.97442
G1 X86.65 Y98.936 E.01646
G1 X63.741 Y121.845 E.9977
G1 X63.741 Y122.38 E.01646
G1 X87.184 Y98.936 E1.02097
G1 X87.719 Y98.936 E.01646
G1 X63.741 Y122.914 E1.04425
G1 X63.741 Y123.449 E.01646
G1 X88.253 Y98.936 E1.06752
G1 X88.787 Y98.936 E.01646
G1 X63.741 Y123.983 E1.0908
G1 X63.741 Y124.517 E.01646
G1 X89.322 Y98.936 E1.11407
G1 X89.856 Y98.936 E.01646
G1 X63.741 Y125.052 E1.13735
G1 X63.741 Y125.586 E.01646
G1 X90.391 Y98.936 E1.16062
G1 X90.925 Y98.936 E.01646
G1 X63.741 Y126.121 E1.1839
G1 X63.741 Y126.655 E.01646
G1 X91.46 Y98.937 E1.20717
G1 X91.994 Y98.937 E.01646
G1 X63.741 Y127.19 E1.23044
G1 X63.741 Y127.724 E.01646
G1 X92.528 Y98.937 E1.25372
G1 X93.063 Y98.937 E.01646
G1 X63.741 Y128.259 E1.27699
G1 X63.741 Y128.793 E.01646
G1 X93.597 Y98.937 E1.30027
G1 X94.132 Y98.937 E.01646
G1 X63.741 Y129.328 E1.32354
G1 X63.741 Y129.862 E.01646
G1 X94.666 Y98.937 E1.34682
G1 X95.201 Y98.937 E.01646
G1 X63.571 Y130.566 E1.37748
G1 X55.768 Y131.421 F30000
G1 F15000
G1 X56.449 Y130.741 E.02964
G1 X56.983 Y130.741 E.01646
G1 X55.938 Y131.786 E.04553
G1 X55.938 Y132.321 E.01646
G1 X57.517 Y130.741 E.06881
G1 X58.052 Y130.741 E.01646
G1 X55.938 Y132.855 E.09208
G1 X55.937 Y133.39 E.01646
G1 X58.586 Y130.741 E.11536
G1 X59.121 Y130.741 E.01646
G1 X55.937 Y133.924 E.13864
G1 X55.937 Y134.459 E.01646
G1 X59.655 Y130.741 E.16192
G1 X60.19 Y130.741 E.01646
G1 X55.937 Y134.993 E.1852
G1 X55.937 Y135.528 E.01646
G1 X60.724 Y130.741 E.20847
G1 X61.259 Y130.741 E.01646
G1 X55.937 Y136.062 E.23175
G1 X55.937 Y136.597 E.01646
G1 X61.793 Y130.741 E.25503
G1 X62.328 Y130.741 E.01646
G1 X55.937 Y137.131 E.27831
G1 X55.937 Y137.666 E.01646
G1 X62.862 Y130.741 E.30159
G1 X63.396 Y130.741 E.01646
M73 P68 R14
G1 X55.767 Y138.37 E.33225
G1 X63.349 Y108.587 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X63.349 Y110.216 E.05401
G1 X55.954 Y117.61 E.34689
G1 X55.954 Y115.362 E.07457
G1 X63.349 Y122.756 E.34688
G1 X63.349 Y125.568 E.09325
G1 X58.568 Y130.349 E.22429
G1 X63.265 Y130.349 E.15582
G1 X55.954 Y123.037 E.34299
G1 X55.953 Y125.287 E.07463
G1 X63.349 Y117.892 E.34693
G1 X63.349 Y115.08 E.09325
G1 X55.955 Y107.687 E.34684
G1 X55.955 Y109.933 E.07451
G1 X58.237 Y107.651 E.10706
G1 X59.865 Y107.651 E.05401
; WIPE_START
G1 F24000
G1 X58.237 Y107.651 E-.61876
G1 X57.974 Y107.914 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.004 J1.217 P1  F30000
G1 X203.752 Y107.429 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420831
G1 F15000
G1 X204.059 Y107.122 E.01337
G1 X204.059 Y106.587 E.01646
G1 X203.387 Y107.259 E.02926
G1 X202.853 Y107.259 E.01646
G1 X204.059 Y106.053 E.05253
G1 X204.059 Y105.519 E.01646
G1 X202.318 Y107.259 E.07581
G1 X201.784 Y107.259 E.01646
G1 X204.059 Y104.984 E.09908
G1 X204.059 Y104.45 E.01646
G1 X201.25 Y107.259 E.12236
G1 X200.715 Y107.259 E.01646
G1 X204.059 Y103.915 E.14563
G1 X204.059 Y103.381 E.01646
G1 X200.181 Y107.259 E.16891
G1 X199.646 Y107.259 E.01646
G1 X204.059 Y102.846 E.19219
G2 X204.011 Y102.36 I-6.726 J.416 E.01506
G1 X199.112 Y107.259 E.21338
G1 X198.577 Y107.259 E.01646
G1 X203.913 Y101.924 E.23235
G1 X203.78 Y101.522 E.01303
G1 X198.043 Y107.259 E.24985
G1 X197.508 Y107.259 E.01646
G1 X203.616 Y101.152 E.26599
G2 X203.421 Y100.812 I-1.821 J.82 E.01208
G1 X196.804 Y107.429 E.28817
G1 X196.651 Y108.587 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X196.651 Y110.216 E.05401
G1 X204.044 Y117.609 E.34681
G1 X204.044 Y115.364 E.07447
G1 X196.651 Y122.756 E.34681
G1 X196.651 Y125.568 E.09325
G1 X201.432 Y130.349 E.22429
G1 X196.735 Y130.349 E.15582
G1 X204.044 Y123.04 E.34289
G1 X204.044 Y125.285 E.07447
G1 X196.651 Y117.892 E.34681
G1 X196.651 Y115.08 E.09325
G1 X204.044 Y107.688 E.34681
G1 X204.044 Y109.933 E.07447
G1 X201.763 Y107.651 E.10702
G1 X200.135 Y107.651 E.05401
; WIPE_START
G1 F24000
G1 X201.763 Y107.651 E-.61876
G1 X202.026 Y107.914 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.63 J-1.041 P1  F30000
G1 X159.202 Y133.808 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420831
G1 F15000
G1 X159.474 Y133.536 E.01185
G1 X160.009 Y133.536 E.01647
G1 X159.233 Y134.312 E.03379
G3 X159.002 Y135.077 I-7.894 J-1.964 E.02463
G1 X160.543 Y133.536 E.06712
G1 X161.077 Y133.536 E.01646
G1 X158.722 Y135.891 E.10256
G3 X158.405 Y136.742 I-8.733 J-2.767 E.02799
G1 X161.612 Y133.536 E.13964
G1 X162.146 Y133.536 E.01646
G1 X158.05 Y137.633 E.17841
G1 X157.603 Y138.614 E.03321
G1 X162.681 Y133.536 E.22115
G1 X163.215 Y133.536 E.01646
G1 X157.078 Y139.673 E.26729
G3 X156.431 Y140.854 I-12.216 J-5.92 E.04148
G1 X163.75 Y133.536 E.31872
G1 X164.284 Y133.536 E.01646
G1 X155.579 Y142.241 E.37912
G3 X154.33 Y144.025 I-18.585 J-11.686 E.06708
G1 X164.818 Y133.536 E.45679
G1 X165.353 Y133.536 E.01646
G1 X141.824 Y157.065 E1.02469
G1 X142.359 Y157.065 E.01646
G1 X165.887 Y133.536 E1.02469
G1 X166.422 Y133.536 E.01646
G1 X142.893 Y157.065 E1.02469
G1 X143.427 Y157.065 E.01646
G1 X166.956 Y133.536 E1.02469
G1 X167.49 Y133.536 E.01646
G1 X143.962 Y157.065 E1.02468
G1 X144.496 Y157.065 E.01646
G1 X168.025 Y133.536 E1.02468
G1 X168.559 Y133.536 E.01646
G1 X145.031 Y157.065 E1.02468
G1 X145.565 Y157.065 E.01646
G1 X169.094 Y133.536 E1.02468
G1 X169.628 Y133.536 E.01646
G1 X145.93 Y157.234 E1.03207
G1 X141.12 Y157.234 F30000
G1 F15000
G1 X148.68 Y149.674 E.32925
G3 X146.845 Y150.975 I-14.021 J-17.835 E.06932
G1 X140.755 Y157.065 E.2652
G1 X140.221 Y157.065 E.01646
G1 X145.454 Y151.831 E.22791
G1 X144.282 Y152.469 E.04108
G1 X139.686 Y157.065 E.20015
G1 X139.152 Y157.065 E.01646
G1 X143.235 Y152.982 E.17782
G3 X142.266 Y153.416 I-4.86 J-9.541 E.03271
G1 X138.617 Y157.065 E.1589
G1 X138.083 Y157.065 E.01646
G1 X141.35 Y153.798 E.14228
G1 X140.512 Y154.101 E.02743
G1 X137.549 Y157.065 E.12908
G1 X137.014 Y157.065 E.01646
G1 X139.7 Y154.379 E.11697
G1 X138.929 Y154.615 E.02483
G1 X136.48 Y157.065 E.10667
G1 X135.945 Y157.065 E.01646
G1 X138.188 Y154.822 E.09766
G1 X137.472 Y155.003 E.02274
G1 X135.411 Y157.065 E.08977
G1 X134.876 Y157.065 E.01646
G1 X136.781 Y155.16 E.08294
G1 X136.112 Y155.295 E.02101
G1 X134.342 Y157.065 E.07708
G1 X133.807 Y157.065 E.01646
G1 X135.457 Y155.415 E.07183
G1 X134.828 Y155.51 E.01958
G1 X133.273 Y157.065 E.06773
G1 X132.739 Y157.065 E.01646
G1 X134.2 Y155.603 E.06364
G1 X133.606 Y155.663 E.01837
G1 X132.204 Y157.065 E.06106
G1 X131.67 Y157.065 E.01646
G1 X133.013 Y155.722 E.05849
G3 X132.435 Y155.765 I-.721 J-5.794 E.01784
G1 X131.135 Y157.065 E.05662
G1 X130.601 Y157.065 E.01646
G1 X131.873 Y155.792 E.0554
G1 X131.311 Y155.82 E.01734
G1 X130.066 Y157.065 E.05419
G1 X129.532 Y157.065 E.01646
G1 X130.773 Y155.824 E.05404
G1 X130.238 Y155.824 E.01646
G1 X128.997 Y157.065 E.05404
G1 X128.463 Y157.065 E.01646
G1 X129.706 Y155.821 E.05415
G1 X129.197 Y155.796 E.0157
G1 X127.928 Y157.065 E.05525
G1 X127.394 Y157.065 E.01646
G1 X128.688 Y155.771 E.05635
G3 X128.183 Y155.741 I.046 J-5.105 E.01558
G1 X126.86 Y157.065 E.05764
G1 X126.325 Y157.065 E.01646
G1 X127.697 Y155.693 E.05975
G1 X127.211 Y155.644 E.01504
G1 X125.791 Y157.065 E.06185
G1 X125.256 Y157.065 E.01646
G1 X126.728 Y155.593 E.0641
G1 X126.263 Y155.523 E.01447
G1 X124.722 Y157.065 E.06713
G1 X124.187 Y157.065 E.01646
G1 X125.798 Y155.454 E.07016
G1 X125.334 Y155.384 E.01447
G1 X123.653 Y157.065 E.0732
G1 X123.118 Y157.065 E.01646
G1 X124.888 Y155.295 E.07708
G1 X124.443 Y155.205 E.01398
G1 X122.584 Y157.065 E.08098
G1 X122.05 Y157.065 E.01646
G1 X123.998 Y155.116 E.08487
G3 X123.567 Y155.013 I.821 J-4.403 E.01367
G1 X121.515 Y157.065 E.08935
G1 X120.981 Y157.065 E.01646
G1 X123.14 Y154.905 E.09405
G1 X122.714 Y154.797 E.01355
G1 X120.446 Y157.065 E.09875
G1 X119.912 Y157.065 E.01646
G1 X122.293 Y154.683 E.10371
G1 X121.884 Y154.558 E.01318
G1 X119.377 Y157.065 E.10917
G1 X118.843 Y157.065 E.01646
G1 X121.475 Y154.433 E.11463
G1 X121.066 Y154.307 E.01318
G1 X118.308 Y157.065 E.12009
G1 X117.774 Y157.065 E.01646
G1 X120.671 Y154.167 E.12618
G1 X120.279 Y154.025 E.01285
G1 X117.24 Y157.065 E.13236
G1 X116.705 Y157.065 E.01646
G1 X119.886 Y153.883 E.13855
G3 X119.499 Y153.736 I1.289 J-3.98 E.01277
G1 X116.171 Y157.065 E.14495
G1 X115.636 Y157.065 E.01646
G1 X119.122 Y153.579 E.15182
G1 X118.745 Y153.421 E.01258
G1 X115.102 Y157.065 E.15869
G1 X114.567 Y157.065 E.01646
G1 X118.369 Y153.263 E.16555
G3 X118.002 Y153.095 I1.513 J-3.776 E.01242
G1 X114.033 Y157.065 E.17288
G1 X113.498 Y157.065 E.01646
G1 X117.641 Y152.922 E.18041
G1 X117.279 Y152.749 E.01234
G1 X112.964 Y157.065 E.18794
G1 X112.43 Y157.065 E.01646
G1 X116.918 Y152.576 E.19547
G1 X116.571 Y152.389 E.01215
G1 X111.895 Y157.065 E.20363
G1 X111.361 Y157.065 E.01646
G1 X116.224 Y152.201 E.21179
G1 X115.877 Y152.014 E.01214
G1 X110.826 Y157.065 E.21996
G1 X110.292 Y157.065 E.01646
G1 X115.533 Y151.823 E.22827
G1 X115.2 Y151.621 E.01198
G1 X109.757 Y157.065 E.23705
G1 X109.223 Y157.065 E.01646
G1 X114.868 Y151.42 E.24584
G1 X114.535 Y151.218 E.01198
G1 X108.688 Y157.065 E.25463
G1 X108.154 Y157.065 E.01646
G1 X114.208 Y151.011 E.26366
G1 X113.889 Y150.795 E.01185
G1 X107.619 Y157.065 E.27305
G1 X107.085 Y157.065 E.01646
G1 X113.57 Y150.579 E.28244
G1 X113.252 Y150.364 E.01185
G1 X106.551 Y157.065 E.29183
G1 X106.016 Y157.065 E.01646
G1 X112.94 Y150.14 E.30155
G1 X112.635 Y149.911 E.01175
G1 X105.482 Y157.065 E.31154
G1 X104.947 Y157.065 E.01646
G1 X112.33 Y149.682 E.32152
G1 X112.025 Y149.453 E.01175
G1 X104.413 Y157.065 E.33151
G1 X103.878 Y157.065 E.01646
G1 X111.729 Y149.215 E.34188
G1 X111.437 Y148.972 E.01169
G1 X103.344 Y157.065 E.35245
G1 X102.809 Y157.065 E.01646
G1 X111.145 Y148.729 E.36302
G1 X110.853 Y148.486 E.01169
G1 X102.275 Y157.065 E.37358
G1 X101.741 Y157.065 E.01646
G1 X110.571 Y148.234 E.38459
G1 X110.293 Y147.978 E.01165
G1 X101.206 Y157.065 E.39574
G1 X100.672 Y157.065 E.01646
G1 X110.015 Y147.722 E.40689
G1 X109.736 Y147.466 E.01165
G1 X100.137 Y157.065 E.41804
G1 X99.603 Y157.065 E.01646
G1 X109.469 Y147.199 E.42966
G1 X109.203 Y146.93 E.01164
G1 X99.068 Y157.065 E.44139
G1 X98.534 Y157.065 E.01646
G1 X108.938 Y146.66 E.45311
G1 X108.673 Y146.391 E.01164
G1 X97.999 Y157.065 E.46484
G1 X97.465 Y157.065 E.01646
G1 X108.42 Y146.11 E.47709
G1 X108.168 Y145.827 E.01166
G1 X96.931 Y157.065 E.48939
G1 X96.396 Y157.065 E.01646
G1 X107.916 Y145.545 E.50169
G1 X107.664 Y145.262 E.01166
G1 X95.862 Y157.065 E.51399
G1 X95.327 Y157.065 E.01646
G1 X107.425 Y144.967 E.52687
G1 X107.186 Y144.671 E.0117
G1 X94.793 Y157.065 E.53975
G1 X94.258 Y157.065 E.01646
G1 X106.948 Y144.375 E.55263
G3 X106.71 Y144.078 I2.873 J-2.543 E.01171
G1 X93.724 Y157.065 E.56556
G1 X93.189 Y157.065 E.01646
G1 X106.485 Y143.769 E.57903
G1 X106.26 Y143.46 E.01178
G1 X92.655 Y157.065 E.5925
G1 X92.121 Y157.065 E.01646
G1 X106.035 Y143.15 E.60597
G3 X105.812 Y142.838 I3.034 J-2.399 E.0118
G1 X91.586 Y157.065 E.61956
G1 X91.052 Y157.065 E.01646
G1 X105.601 Y142.515 E.63363
G1 X105.389 Y142.192 E.01189
G1 X90.517 Y157.065 E.64769
M73 P69 R14
G1 X89.983 Y157.065 E.01646
G1 X105.178 Y141.869 E.66176
G3 X104.971 Y141.542 I3.202 J-2.246 E.01194
G1 X89.448 Y157.065 E.67604
G1 X88.914 Y157.065 E.01646
G1 X104.774 Y141.205 E.69072
G1 X104.576 Y140.868 E.01203
G1 X88.379 Y157.065 E.70539
G1 X87.845 Y157.065 E.01646
G1 X104.379 Y140.531 E.72007
G3 X104.189 Y140.186 I3.383 J-2.084 E.01212
G1 X87.311 Y157.065 E.73509
G1 X86.776 Y157.065 E.01646
G1 X104.006 Y139.834 E.75039
G1 X103.823 Y139.483 E.0122
G1 X86.242 Y157.065 E.76569
G1 X85.707 Y157.065 E.01646
G1 X103.64 Y139.132 E.78099
G3 X103.469 Y138.769 I3.577 J-1.908 E.01237
G1 X85.173 Y157.065 E.79681
G1 X84.638 Y157.065 E.01646
G1 X103.3 Y138.403 E.81275
G1 X103.132 Y138.036 E.01241
G1 X84.104 Y157.065 E.82869
G1 X83.569 Y157.065 E.01646
G1 X102.966 Y137.668 E.84472
G1 X102.813 Y137.287 E.01266
G1 X83.035 Y157.065 E.86133
G1 X82.5 Y157.065 E.01646
G1 X102.66 Y136.905 E.87794
G1 X102.507 Y136.524 E.01266
G1 X81.966 Y157.065 E.89456
G1 X81.432 Y157.065 E.01646
G1 X102.362 Y136.134 E.91153
G1 X102.225 Y135.737 E.01295
G1 X80.897 Y157.065 E.92884
G1 X80.363 Y157.065 E.01646
G1 X102.088 Y135.339 E.94615
G1 X101.951 Y134.942 E.01295
G1 X79.828 Y157.065 E.96346
G1 X79.294 Y157.065 E.01646
G1 X101.831 Y134.528 E.98149
G1 X101.71 Y134.114 E.01328
G1 X78.759 Y157.065 E.99953
G1 X78.225 Y157.065 E.01646
G1 X101.59 Y133.699 E1.01758
G2 X101.541 Y133.539 I-.635 J.108 E.00518
G1 X101.219 Y133.536 E.00991
G1 X77.69 Y157.065 E1.02469
G1 X77.156 Y157.065 E.01646
G1 X100.685 Y133.536 E1.02469
G1 X100.15 Y133.536 E.01646
G1 X76.622 Y157.065 E1.02469
G1 X76.087 Y157.065 E.01646
G1 X99.616 Y133.536 E1.02469
G1 X99.081 Y133.536 E.01646
G1 X75.553 Y157.065 E1.02469
G1 X75.018 Y157.065 E.01646
G1 X98.547 Y133.536 E1.02469
G1 X98.012 Y133.536 E.01646
G1 X74.484 Y157.065 E1.02469
G1 X73.949 Y157.065 E.01646
G1 X97.478 Y133.536 E1.02469
G1 X96.944 Y133.536 E.01646
G1 X73.415 Y157.065 E1.02469
G1 X72.88 Y157.065 E.01646
G1 X96.409 Y133.536 E1.02469
G1 X95.875 Y133.536 E.01646
G1 X72.346 Y157.065 E1.02469
G1 X71.812 Y157.065 E.01646
G1 X95.34 Y133.536 E1.02469
G1 X94.806 Y133.536 E.01646
G1 X71.277 Y157.065 E1.02468
G1 X70.743 Y157.065 E.01646
G1 X94.271 Y133.536 E1.02468
G1 X93.737 Y133.536 E.01646
G1 X70.208 Y157.065 E1.02468
G1 X69.674 Y157.065 E.01646
G1 X93.202 Y133.536 E1.02468
G1 X92.668 Y133.536 E.01646
G1 X69.139 Y157.065 E1.02468
G1 X68.605 Y157.065 E.01646
G1 X92.133 Y133.536 E1.02468
G1 X91.599 Y133.536 E.01646
G1 X68.07 Y157.065 E1.02468
G1 X67.536 Y157.065 E.01646
G1 X91.064 Y133.536 E1.02468
G1 X90.53 Y133.536 E.01646
G1 X67.002 Y157.065 E1.02468
G1 X66.467 Y157.065 E.01646
G1 X89.996 Y133.536 E1.02468
G1 X89.964 Y133.536 E.00098
G1 X89.964 Y133.033 E.01548
G1 X65.933 Y157.065 E1.04657
G1 X65.398 Y157.065 E.01646
G1 X89.964 Y132.499 E1.06985
G1 X89.964 Y131.965 E.01646
G1 X64.864 Y157.065 E1.09312
G1 X64.329 Y157.065 E.01646
G1 X89.964 Y131.43 E1.1164
G1 X89.964 Y130.896 E.01646
G1 X63.795 Y157.065 E1.13967
G1 X63.26 Y157.065 E.01646
G1 X89.964 Y130.361 E1.16295
G1 X89.964 Y129.827 E.01646
G1 X62.726 Y157.065 E1.18623
G1 X62.192 Y157.065 E.01646
G1 X89.964 Y129.292 E1.2095
G1 X89.964 Y128.758 E.01646
G1 X61.657 Y157.065 E1.23278
G1 X61.123 Y157.065 E.01646
G1 X89.964 Y128.223 E1.25605
G1 X89.964 Y127.689 E.01646
G1 X60.588 Y157.065 E1.27933
G1 X60.054 Y157.065 E.01646
G1 X89.964 Y127.155 E1.3026
G1 X89.964 Y126.62 E.01646
G1 X59.553 Y157.031 E1.32439
G3 X59.098 Y156.951 I.04 J-1.568 E.01427
G1 X89.964 Y126.086 E1.34421
G1 X89.964 Y125.551 E.01646
G1 X58.68 Y156.835 E1.36241
G1 X58.295 Y156.686 E.01273
G1 X89.964 Y125.017 E1.37921
G1 X89.964 Y124.482 E.01646
G1 X57.95 Y156.496 E1.39423
G3 X57.625 Y156.287 I.543 J-1.201 E.01195
G1 X89.964 Y123.948 E1.40839
G1 X89.964 Y123.413 E.01646
G1 X57.325 Y156.053 E1.42146
G3 X57.057 Y155.786 I.765 J-1.036 E.01168
G1 X89.964 Y122.879 E1.43312
G1 X89.964 Y122.345 E.01646
G1 X56.806 Y155.503 E1.44405
G1 X56.585 Y155.189 E.01181
G1 X89.964 Y121.81 E1.45367
G1 X89.964 Y121.276 E.01646
G1 X56.393 Y154.847 E1.46205
G3 X56.22 Y154.485 I1.381 J-.88 E.01238
G1 X89.964 Y120.741 E1.46956
G1 X89.964 Y120.207 E.01646
G1 X56.087 Y154.084 E1.47536
G3 X55.992 Y153.644 I2.184 J-.702 E.01387
G1 X89.964 Y119.672 E1.4795
G1 X89.964 Y119.138 E.01646
G1 X55.944 Y153.158 E1.48159
G3 X55.935 Y152.632 I5.382 J-.349 E.01621
G1 X89.964 Y118.603 E1.48196
G1 X89.964 Y118.069 E.01646
G1 X55.935 Y152.097 E1.48196
G1 X55.936 Y151.563 E.01646
G1 X89.964 Y117.535 E1.48195
G1 X89.964 Y117 E.01646
G1 X55.936 Y151.028 E1.48195
G1 X55.936 Y150.494 E.01646
G1 X89.964 Y116.466 E1.48195
G1 X89.964 Y115.931 E.01646
G1 X55.936 Y149.959 E1.48195
G1 X55.936 Y149.425 E.01646
G1 X89.964 Y115.397 E1.48194
G1 X89.964 Y114.862 E.01646
G1 X55.936 Y148.89 E1.48194
G1 X55.936 Y148.356 E.01646
G1 X89.964 Y114.328 E1.48194
G1 X89.964 Y113.793 E.01646
G1 X55.936 Y147.821 E1.48194
G1 X55.936 Y147.287 E.01646
G1 X89.964 Y113.259 E1.48193
G1 X89.964 Y112.725 E.01646
G1 X55.936 Y146.752 E1.48193
G1 X55.936 Y146.218 E.01646
G1 X89.964 Y112.19 E1.48193
G1 X89.964 Y111.656 E.01646
G1 X55.936 Y145.683 E1.48193
G1 X55.936 Y145.149 E.01646
G1 X89.964 Y111.121 E1.48192
G1 X89.964 Y110.587 E.01646
G1 X55.936 Y144.614 E1.48192
G1 X55.936 Y144.08 E.01646
G1 X89.964 Y110.052 E1.48192
G1 X89.964 Y109.518 E.01646
G1 X55.936 Y143.545 E1.48192
G1 X55.936 Y143.011 E.01646
G1 X89.964 Y108.983 E1.48191
G1 X89.964 Y108.449 E.01646
G1 X55.936 Y142.476 E1.48191
G1 X55.937 Y141.942 E.01646
G1 X89.964 Y107.914 E1.48191
G1 X89.964 Y107.38 E.01646
G1 X55.937 Y141.407 E1.48191
G1 X55.937 Y140.873 E.01646
G1 X89.964 Y106.846 E1.4819
G1 X89.964 Y106.311 E.01646
G1 X55.937 Y140.338 E1.4819
G1 X55.937 Y139.804 E.01646
G1 X89.964 Y105.777 E1.4819
G1 X89.964 Y105.242 E.01646
G1 X55.937 Y139.269 E1.4819
G1 X55.937 Y138.735 E.01646
G1 X95.735 Y98.937 E1.73323
G1 X96.269 Y98.937 E.01646
G1 X90.742 Y104.464 E.24071
G1 X91.277 Y104.464 E.01646
G1 X96.804 Y98.937 E.24071
G1 X97.338 Y98.937 E.01646
G1 X91.811 Y104.464 E.24071
G1 X92.346 Y104.464 E.01646
G1 X97.873 Y98.937 E.24071
G1 X98.407 Y98.937 E.01646
G1 X92.88 Y104.464 E.24071
G1 X93.414 Y104.464 E.01646
G1 X98.942 Y98.937 E.24071
G1 X99.476 Y98.937 E.01646
G1 X93.949 Y104.464 E.24071
G1 X94.483 Y104.464 E.01646
G1 X100.01 Y98.937 E.24071
G1 X100.545 Y98.937 E.01646
G1 X95.018 Y104.464 E.24071
G1 X95.552 Y104.464 E.01646
G1 X101.079 Y98.937 E.24071
G1 X101.614 Y98.937 E.01646
G1 X96.087 Y104.464 E.24071
G1 X96.621 Y104.464 E.01646
G1 X102.148 Y98.937 E.2407
G1 X102.682 Y98.937 E.01646
G1 X97.156 Y104.464 E.2407
G1 X97.69 Y104.464 E.01646
G1 X103.217 Y98.937 E.2407
G1 X103.751 Y98.937 E.01646
G1 X98.224 Y104.464 E.2407
G1 X98.759 Y104.464 E.01646
G1 X104.286 Y98.937 E.2407
G1 X104.82 Y98.937 E.01646
G1 X99.293 Y104.464 E.2407
G1 X99.828 Y104.464 E.01646
G1 X105.355 Y98.937 E.2407
G1 X105.889 Y98.937 E.01646
G1 X100.362 Y104.464 E.2407
G1 X100.897 Y104.464 E.01646
G1 X106.423 Y98.937 E.2407
G1 X106.958 Y98.937 E.01646
G1 X101.431 Y104.464 E.2407
G1 X101.965 Y104.464 E.01646
G1 X107.492 Y98.937 E.2407
G1 X108.027 Y98.937 E.01646
G1 X102.5 Y104.464 E.2407
G1 X103.034 Y104.464 E.01646
G1 X108.561 Y98.937 E.2407
G1 X109.096 Y98.937 E.01646
G1 X103.569 Y104.464 E.2407
G1 X104.103 Y104.464 E.01646
G1 X107.464 Y101.103 E.14636
G1 X107.464 Y101.638 E.01646
G1 X104.638 Y104.464 E.12308
G1 X105.172 Y104.464 E.01646
G1 X107.464 Y102.172 E.09981
G1 X107.464 Y102.707 E.01646
G1 X105.706 Y104.464 E.07654
G1 X106.241 Y104.464 E.01646
G1 X107.464 Y103.241 E.05327
G1 X107.464 Y103.775 E.01646
G1 X106.775 Y104.464 E.02999
G1 X107.31 Y104.464 E.01646
G1 X107.634 Y104.14 E.01411
; WIPE_START
G1 F24000
G1 X107.31 Y104.464 E-.17412
G1 X106.775 Y104.464 E-.20309
G1 X107.464 Y103.775 E-.37012
G1 X107.464 Y103.742 E-.01267
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I1.102 J.517 P1  F30000
G1 X109.8 Y98.768 Z7.2
G1 Z6.8
G1 E.8 F1800
G1 F15000
G1 X108.103 Y100.464 E.07387
G1 X108.638 Y100.464 E.01646
G1 X110.164 Y98.937 E.06648
G1 X110.699 Y98.937 E.01646
G1 X109.172 Y100.464 E.06648
G1 X109.707 Y100.464 E.01646
G1 X111.233 Y98.937 E.06648
G1 X111.768 Y98.937 E.01646
G1 X110.241 Y100.464 E.06648
G1 X110.776 Y100.464 E.01646
G1 X112.302 Y98.937 E.06648
G1 X112.837 Y98.937 E.01646
G1 X111.31 Y100.464 E.06648
G1 X111.845 Y100.464 E.01646
G1 X113.371 Y98.937 E.06648
G1 X113.905 Y98.937 E.01646
G1 X112.379 Y100.464 E.06648
G1 X112.913 Y100.464 E.01646
G1 X114.44 Y98.937 E.06648
G1 X114.974 Y98.937 E.01646
G1 X113.448 Y100.464 E.06648
G1 X113.982 Y100.464 E.01646
G1 X115.509 Y98.937 E.06648
G1 X116.043 Y98.937 E.01646
G1 X114.517 Y100.464 E.06647
G1 X115.051 Y100.464 E.01646
G1 X116.578 Y98.937 E.06647
G1 X117.112 Y98.937 E.01646
G1 X115.586 Y100.464 E.06647
G1 X116.12 Y100.464 E.01646
G1 X117.646 Y98.937 E.06647
G1 X118.181 Y98.938 E.01646
G1 X116.655 Y100.464 E.06647
G1 X117.036 Y100.464 E.01175
G1 X117.036 Y100.617 E.0047
G1 X118.715 Y98.938 E.07312
G1 X119.25 Y98.938 E.01646
G1 X117.036 Y101.151 E.0964
G1 X117.036 Y101.686 E.01646
G1 X119.784 Y98.938 E.11968
G1 X120.319 Y98.938 E.01646
G1 X117.036 Y102.22 E.14295
G1 X117.036 Y102.755 E.01646
G1 X120.853 Y98.938 E.16623
G1 X121.387 Y98.938 E.01646
G1 X117.036 Y103.289 E.18951
G1 X117.036 Y103.824 E.01646
G1 X121.922 Y98.938 E.21279
G1 X122.456 Y98.938 E.01646
G1 X117.036 Y104.358 E.23606
G1 X117.036 Y104.45 E.00282
G2 X117.057 Y104.464 I.017 J-.002 E.00088
G1 X117.464 Y104.464 E.01256
G1 X122.991 Y98.938 E.24067
G1 X123.525 Y98.938 E.01646
G1 X117.999 Y104.464 E.24067
G1 X118.534 Y104.464 E.01646
G1 X124.06 Y98.938 E.24066
G1 X124.594 Y98.938 E.01646
G1 X119.068 Y104.464 E.24065
G1 X119.603 Y104.463 E.01646
G1 X125.128 Y98.938 E.24065
G1 X125.663 Y98.938 E.01646
G1 X120.137 Y104.463 E.24064
G1 X120.672 Y104.463 E.01646
G1 X126.197 Y98.938 E.24063
G1 X126.732 Y98.938 E.01646
G1 X121.207 Y104.463 E.24062
G1 X121.741 Y104.463 E.01646
G1 X127.266 Y98.938 E.24062
G1 X127.801 Y98.938 E.01646
G1 X122.276 Y104.463 E.24061
G1 X122.81 Y104.463 E.01646
G1 X128.335 Y98.938 E.2406
G1 X128.869 Y98.938 E.01646
G1 X123.345 Y104.462 E.24059
G1 X123.88 Y104.462 E.01646
G1 X129.404 Y98.938 E.24059
G1 X129.938 Y98.938 E.01646
G1 X124.414 Y104.462 E.24058
G1 X124.949 Y104.462 E.01646
G1 X130.473 Y98.938 E.24057
G1 X131.007 Y98.938 E.01646
G1 X125.483 Y104.462 E.24056
G1 X126.018 Y104.462 E.01646
G1 X131.542 Y98.938 E.24056
G1 X132.076 Y98.938 E.01646
G1 X126.553 Y104.461 E.24055
G1 X127.087 Y104.461 E.01646
G1 X132.61 Y98.938 E.24054
G1 X133.145 Y98.938 E.01646
G1 X127.622 Y104.461 E.24053
G1 X128.156 Y104.461 E.01646
G1 X133.679 Y98.938 E.24053
G1 X134.214 Y98.938 E.01646
G1 X128.691 Y104.461 E.24052
G1 X129.226 Y104.461 E.01646
G1 X134.748 Y98.938 E.24051
G1 X135.283 Y98.938 E.01646
G1 X129.76 Y104.461 E.24051
G1 X130.295 Y104.46 E.01646
G1 X135.817 Y98.938 E.2405
G1 X136.351 Y98.938 E.01646
G1 X130.829 Y104.46 E.24049
G1 X131.364 Y104.46 E.01646
G1 X136.886 Y98.938 E.24048
G1 X137.42 Y98.938 E.01646
G1 X131.899 Y104.46 E.24048
G1 X132.433 Y104.46 E.01646
G1 X137.955 Y98.938 E.24047
G1 X138.489 Y98.938 E.01646
G1 X132.968 Y104.46 E.24046
G1 X133.502 Y104.46 E.01646
G1 X139.024 Y98.938 E.24045
G1 X139.558 Y98.938 E.01646
G1 X134.037 Y104.459 E.24045
G1 X134.571 Y104.459 E.01646
G1 X140.092 Y98.938 E.24044
G1 X140.627 Y98.938 E.01646
G1 X135.106 Y104.459 E.24043
G1 X135.641 Y104.459 E.01646
G1 X141.161 Y98.938 E.24042
G1 X141.696 Y98.938 E.01646
G1 X136.175 Y104.459 E.24042
G1 X136.71 Y104.459 E.01646
G1 X142.23 Y98.938 E.24041
G1 X142.765 Y98.938 E.01646
G1 X137.244 Y104.458 E.2404
G1 X137.779 Y104.458 E.01646
G1 X143.299 Y98.938 E.24039
G1 X143.833 Y98.938 E.01646
G1 X138.314 Y104.458 E.24039
G1 X138.848 Y104.458 E.01646
G1 X144.368 Y98.938 E.24038
G1 X144.902 Y98.939 E.01646
G1 X139.213 Y104.628 E.24776
G1 X144.134 Y103.983 F30000
G1 F15000
G1 X143.66 Y104.457 E.02065
G1 X143.125 Y104.457 E.01646
G1 X143.964 Y103.618 E.03654
G1 X143.964 Y103.083 E.01646
G1 X142.59 Y104.457 E.05982
G1 X142.056 Y104.457 E.01646
G1 X143.964 Y102.549 E.0831
G1 X143.964 Y102.015 E.01646
G1 X141.521 Y104.457 E.10638
G1 X140.987 Y104.457 E.01646
G1 X143.964 Y101.48 E.12966
G1 X143.964 Y100.946 E.01646
G1 X140.452 Y104.458 E.15294
G1 X139.917 Y104.458 E.01646
G1 X145.437 Y98.939 E.24036
G1 X145.971 Y98.939 E.01646
G1 X144.446 Y100.464 E.06643
G1 X144.98 Y100.464 E.01646
G1 X146.506 Y98.939 E.06642
G1 X147.04 Y98.939 E.01646
G1 X145.515 Y100.464 E.06642
G1 X146.049 Y100.464 E.01646
G1 X147.574 Y98.939 E.06642
G1 X148.109 Y98.939 E.01646
G1 X146.584 Y100.464 E.06642
G1 X147.118 Y100.464 E.01646
G1 X148.643 Y98.939 E.06642
G1 X149.178 Y98.939 E.01646
G1 X147.653 Y100.464 E.06642
G1 X148.187 Y100.464 E.01646
G1 X149.712 Y98.939 E.06642
G1 X150.246 Y98.939 E.01646
G1 X148.721 Y100.464 E.06642
G1 X149.256 Y100.464 E.01646
G1 X150.781 Y98.939 E.06642
G1 X151.315 Y98.939 E.01646
G1 X149.79 Y100.464 E.06642
G1 X150.325 Y100.464 E.01646
G1 X151.85 Y98.939 E.06642
G1 X152.384 Y98.939 E.01646
G1 X150.859 Y100.464 E.06642
G1 X151.394 Y100.464 E.01646
G1 X152.919 Y98.939 E.06641
G1 X153.453 Y98.939 E.01646
G1 X151.928 Y100.464 E.06641
G1 X152.463 Y100.464 E.01646
G1 X153.987 Y98.939 E.06641
G1 X154.522 Y98.939 E.01646
G1 X152.997 Y100.464 E.06641
G1 X153.531 Y100.464 E.01646
G1 X155.056 Y98.939 E.06641
G1 X155.591 Y98.939 E.01646
G1 X153.536 Y100.993 E.08948
G1 X153.536 Y101.528 E.01646
G1 X156.125 Y98.939 E.11275
G1 X156.66 Y98.939 E.01646
G1 X153.536 Y102.062 E.13603
G1 X153.536 Y102.597 E.01646
G1 X157.194 Y98.939 E.15931
G1 X157.728 Y98.939 E.01646
G1 X153.536 Y103.131 E.18258
G1 X153.536 Y103.666 E.01646
G1 X158.263 Y98.939 E.20586
G1 X158.797 Y98.939 E.01646
G1 X153.536 Y104.2 E.22914
G2 X153.537 Y104.456 I.761 J.123 E.00791
G1 X153.814 Y104.456 E.00853
G1 X159.332 Y98.939 E.24028
G1 X159.866 Y98.939 E.01646
G1 X154.349 Y104.457 E.24029
G1 X154.883 Y104.457 E.01645
G1 X160.401 Y98.939 E.2403
G1 X160.935 Y98.939 E.01646
G1 X155.417 Y104.457 E.24031
G1 X155.951 Y104.457 E.01645
G1 X161.469 Y98.939 E.24032
G1 X162.004 Y98.939 E.01646
G1 X156.485 Y104.458 E.24033
G1 X157.02 Y104.458 E.01645
G1 X162.538 Y98.939 E.24034
G1 X163.073 Y98.939 E.01646
G1 X157.554 Y104.458 E.24035
G1 X158.088 Y104.458 E.01645
G1 X163.607 Y98.939 E.24036
G1 X164.142 Y98.939 E.01646
G1 X158.622 Y104.459 E.24037
G1 X159.156 Y104.459 E.01645
G1 X164.676 Y98.939 E.24038
G1 X165.21 Y98.939 E.01646
G1 X159.691 Y104.459 E.24039
G1 X160.225 Y104.459 E.01645
G1 X165.745 Y98.939 E.2404
G1 X166.279 Y98.939 E.01646
G1 X160.759 Y104.46 E.24041
G1 X161.293 Y104.46 E.01645
G1 X166.814 Y98.939 E.24042
G1 X167.348 Y98.939 E.01646
G1 X161.827 Y104.46 E.24043
G1 X162.362 Y104.46 E.01645
G1 X167.883 Y98.939 E.24044
G1 X168.417 Y98.939 E.01646
G1 X162.896 Y104.461 E.24045
G1 X163.43 Y104.461 E.01645
G1 X168.951 Y98.939 E.24046
G1 X169.486 Y98.939 E.01646
G1 X163.964 Y104.461 E.24047
G1 X164.498 Y104.461 E.01645
G1 X170.02 Y98.939 E.24048
G1 X170.555 Y98.939 E.01646
M73 P70 R14
G1 X165.033 Y104.462 E.24049
G1 X165.567 Y104.462 E.01645
G1 X171.089 Y98.939 E.2405
G1 X171.624 Y98.94 E.01646
G1 X166.101 Y104.462 E.24051
G1 X166.635 Y104.462 E.01645
G1 X172.158 Y98.94 E.24052
G1 X172.692 Y98.94 E.01646
G1 X167.169 Y104.463 E.24053
G1 X167.704 Y104.463 E.01645
G1 X173.227 Y98.94 E.24054
G1 X173.761 Y98.94 E.01646
G1 X168.238 Y104.463 E.24055
G1 X168.772 Y104.463 E.01645
G1 X174.296 Y98.94 E.24056
G1 X174.83 Y98.94 E.01646
G1 X169.306 Y104.464 E.24057
G1 X169.84 Y104.464 E.01645
G1 X175.365 Y98.94 E.24058
G1 X175.899 Y98.94 E.01646
G1 X170.036 Y104.802 E.25533
G1 X170.036 Y105.337 E.01646
G1 X176.433 Y98.94 E.2786
G1 X176.968 Y98.94 E.01646
G1 X170.036 Y105.871 E.30188
G1 X170.036 Y106.406 E.01646
G1 X177.502 Y98.94 E.32515
G1 X178.037 Y98.94 E.01646
G1 X170.036 Y106.94 E.34843
G1 X170.036 Y107.475 E.01646
G1 X178.571 Y98.94 E.3717
G1 X179.106 Y98.94 E.01646
G1 X170.036 Y108.009 E.39498
G1 X170.036 Y108.544 E.01646
G1 X179.64 Y98.94 E.41825
G1 X180.174 Y98.94 E.01646
G1 X170.036 Y109.078 E.44153
G1 X170.036 Y109.612 E.01646
G1 X180.709 Y98.94 E.4648
G1 X181.243 Y98.94 E.01646
G1 X170.036 Y110.147 E.48808
G1 X170.036 Y110.681 E.01646
G1 X181.778 Y98.94 E.51135
G1 X182.312 Y98.94 E.01646
G1 X170.036 Y111.216 E.53462
G1 X170.036 Y111.75 E.01646
G1 X182.847 Y98.94 E.5579
G1 X183.381 Y98.94 E.01646
G1 X170.036 Y112.285 E.58117
G1 X170.036 Y112.819 E.01646
G1 X183.915 Y98.94 E.60445
G1 X184.45 Y98.94 E.01646
G1 X170.036 Y113.354 E.62772
G1 X170.036 Y113.888 E.01646
G1 X184.984 Y98.94 E.651
G1 X185.519 Y98.94 E.01646
G1 X170.036 Y114.423 E.67427
G1 X170.036 Y114.957 E.01646
G1 X186.053 Y98.94 E.69755
G1 X186.588 Y98.94 E.01646
G1 X170.036 Y115.491 E.72082
G1 X170.036 Y116.026 E.01646
G1 X187.122 Y98.94 E.7441
G1 X187.656 Y98.94 E.01646
G1 X170.036 Y116.56 E.76737
G1 X170.036 Y117.095 E.01646
G1 X188.191 Y98.94 E.79065
G1 X188.725 Y98.94 E.01646
G1 X170.036 Y117.629 E.81392
G1 X170.036 Y118.164 E.01646
G1 X189.26 Y98.94 E.83719
G1 X189.794 Y98.94 E.01646
G1 X170.036 Y118.698 E.86047
G1 X170.036 Y119.233 E.01646
G1 X190.329 Y98.94 E.88374
G1 X190.863 Y98.94 E.01646
G1 X170.036 Y119.767 E.90702
G1 X170.036 Y120.301 E.01646
G1 X191.397 Y98.94 E.93029
G1 X191.932 Y98.94 E.01646
G1 X170.036 Y120.836 E.95357
G1 X170.036 Y121.37 E.01646
G1 X192.466 Y98.94 E.97684
G1 X193.001 Y98.94 E.01646
G1 X170.036 Y121.905 E1.00012
G1 X170.036 Y122.439 E.01646
G1 X193.535 Y98.94 E1.02339
G1 X194.07 Y98.94 E.01646
G1 X170.036 Y122.974 E1.04667
G1 X170.036 Y123.508 E.01646
G1 X194.604 Y98.94 E1.06994
G1 X195.138 Y98.94 E.01646
G1 X170.036 Y124.043 E1.09322
G1 X170.036 Y124.577 E.01646
G1 X195.673 Y98.94 E1.11649
G1 X196.207 Y98.94 E.01646
G1 X170.036 Y125.111 E1.13976
G1 X170.036 Y125.646 E.01646
G1 X196.742 Y98.94 E1.16304
G1 X197.276 Y98.94 E.01646
G1 X170.036 Y126.18 E1.18631
G1 X170.036 Y126.715 E.01646
G1 X197.81 Y98.94 E1.20959
G1 X198.345 Y98.941 E.01646
G1 X170.036 Y127.249 E1.23286
G1 X170.036 Y127.784 E.01646
G1 X198.879 Y98.941 E1.25614
G1 X199.414 Y98.941 E.01646
G1 X170.036 Y128.318 E1.27941
G1 X170.036 Y128.853 E.01646
G1 X199.948 Y98.941 E1.30269
G3 X200.45 Y98.973 I.119 J2.078 E.01553
G1 X170.036 Y129.387 E1.32456
G1 X170.036 Y129.921 E.01646
G1 X200.913 Y99.044 E1.34472
G3 X201.328 Y99.164 I-.401 J2.165 E.01331
G1 X170.036 Y130.456 E1.36278
G1 X170.036 Y130.99 E.01646
G1 X201.709 Y99.318 E1.37936
G3 X202.059 Y99.502 I-.759 J1.872 E.01221
G1 X170.036 Y131.525 E1.39462
G1 X170.036 Y132.059 E.01646
G1 X202.382 Y99.713 E1.40869
G3 X202.68 Y99.95 I-1.055 J1.628 E.01173
G1 X170.036 Y132.594 E1.42164
G1 X170.036 Y133.128 E.01646
G1 X202.952 Y100.212 E1.4335
G3 X203.199 Y100.5 I-1.334 J1.4 E.01169
G1 X146.634 Y157.065 E2.46345
G1 X147.169 Y157.065 E.01646
G1 X196.259 Y107.974 E2.13793
G1 X196.259 Y108.508 E.01646
G1 X147.703 Y157.065 E2.11465
G1 X148.237 Y157.065 E.01646
G1 X196.259 Y109.043 E2.09138
G1 X196.259 Y109.577 E.01646
G1 X148.772 Y157.065 E2.0681
G1 X149.306 Y157.065 E.01646
G1 X196.259 Y110.112 E2.04483
G1 X196.259 Y110.646 E.01646
G1 X149.841 Y157.065 E2.02155
G1 X150.375 Y157.065 E.01646
G1 X196.259 Y111.181 E1.99828
G1 X196.259 Y111.715 E.01646
G1 X150.91 Y157.065 E1.975
G1 X151.444 Y157.065 E.01646
G1 X196.259 Y112.25 E1.95173
G1 X196.259 Y112.784 E.01646
G1 X151.979 Y157.065 E1.92845
G1 X152.513 Y157.065 E.01646
G1 X196.259 Y113.318 E1.90517
G1 X196.259 Y113.853 E.01646
G1 X153.047 Y157.065 E1.8819
G1 X153.582 Y157.065 E.01646
G1 X196.259 Y114.387 E1.85862
G1 X196.259 Y114.922 E.01646
G1 X154.116 Y157.065 E1.83535
G1 X154.651 Y157.065 E.01646
G1 X196.259 Y115.456 E1.81207
G1 X196.259 Y115.991 E.01646
G1 X155.185 Y157.065 E1.7888
G1 X155.72 Y157.065 E.01646
G1 X196.259 Y116.525 E1.76552
G1 X196.259 Y117.06 E.01646
G1 X156.254 Y157.065 E1.74225
G1 X156.789 Y157.065 E.01646
G1 X196.259 Y117.594 E1.71897
G1 X196.259 Y118.129 E.01646
G1 X157.323 Y157.065 E1.6957
G1 X157.858 Y157.065 E.01646
G1 X196.259 Y118.663 E1.67242
G1 X196.259 Y119.197 E.01646
G1 X158.392 Y157.065 E1.64914
G1 X158.926 Y157.065 E.01646
G1 X196.259 Y119.732 E1.62587
G1 X196.259 Y120.266 E.01646
G1 X159.461 Y157.065 E1.60259
G1 X159.995 Y157.065 E.01646
G1 X196.259 Y120.801 E1.57932
G1 X196.259 Y121.335 E.01646
G1 X160.53 Y157.065 E1.55604
G1 X161.064 Y157.065 E.01646
G1 X196.259 Y121.87 E1.53277
G1 X196.259 Y122.404 E.01646
G1 X161.599 Y157.065 E1.50949
G1 X162.133 Y157.065 E.01646
G1 X196.259 Y122.939 E1.48622
G1 X196.259 Y123.473 E.01646
G1 X162.668 Y157.065 E1.46294
G1 X163.202 Y157.065 E.01646
G1 X196.259 Y124.007 E1.43966
G1 X196.259 Y124.542 E.01646
G1 X163.736 Y157.065 E1.41639
G1 X164.271 Y157.065 E.01646
G1 X196.259 Y125.076 E1.39311
G1 X196.259 Y125.611 E.01646
G1 X164.805 Y157.065 E1.36984
G1 X165.34 Y157.065 E.01646
G1 X196.259 Y126.145 E1.34656
G1 X196.259 Y126.68 E.01646
G1 X165.874 Y157.065 E1.32329
G1 X166.409 Y157.065 E.01646
G1 X196.259 Y127.214 E1.30001
G1 X196.259 Y127.749 E.01646
G1 X166.943 Y157.065 E1.27674
G1 X167.478 Y157.065 E.01646
G1 X196.259 Y128.283 E1.25346
G1 X196.259 Y128.817 E.01646
G1 X168.012 Y157.065 E1.23018
G1 X168.546 Y157.065 E.01646
G1 X196.259 Y129.352 E1.20691
G1 X196.259 Y129.886 E.01646
G1 X169.081 Y157.065 E1.18363
G1 X169.615 Y157.065 E.01646
G1 X196.259 Y130.421 E1.16036
G1 X196.259 Y130.741 E.00985
G1 X196.474 Y130.741 E.0066
G1 X170.15 Y157.065 E1.14642
G1 X170.684 Y157.065 E.01646
G1 X197.008 Y130.741 E1.14642
G1 X197.543 Y130.741 E.01646
G1 X171.219 Y157.065 E1.14642
G1 X171.753 Y157.065 E.01646
G1 X198.077 Y130.741 E1.14642
G1 X198.611 Y130.741 E.01646
G1 X172.288 Y157.065 E1.14642
G1 X172.822 Y157.065 E.01646
G1 X199.146 Y130.741 E1.14642
G1 X199.68 Y130.741 E.01646
G1 X173.356 Y157.065 E1.14642
G1 X173.891 Y157.065 E.01646
G1 X200.215 Y130.741 E1.14642
G1 X200.749 Y130.741 E.01646
G1 X174.425 Y157.065 E1.14642
G1 X174.96 Y157.065 E.01646
G1 X201.284 Y130.741 E1.14642
G1 X201.818 Y130.741 E.01646
G1 X175.494 Y157.065 E1.14642
G1 X176.029 Y157.065 E.01646
G1 X202.353 Y130.741 E1.14642
G1 X202.887 Y130.741 E.01646
G1 X176.563 Y157.065 E1.14642
G1 X177.098 Y157.065 E.01646
G1 X203.421 Y130.741 E1.14642
G1 X203.956 Y130.741 E.01646
G1 X177.632 Y157.065 E1.14642
G1 X178.166 Y157.065 E.01646
M73 P70 R13
G1 X204.059 Y131.172 E1.12764
G1 X204.059 Y131.706 E.01646
G1 X178.701 Y157.065 E1.10437
G1 X179.235 Y157.065 E.01646
G1 X204.059 Y132.241 E1.08109
G1 X204.059 Y132.775 E.01646
G1 X179.77 Y157.065 E1.05782
G1 X180.304 Y157.065 E.01646
G1 X204.059 Y133.31 E1.03454
G1 X204.059 Y133.844 E.01646
G1 X180.839 Y157.065 E1.01127
G1 X181.373 Y157.065 E.01646
G1 X204.059 Y134.379 E.98799
G1 X204.059 Y134.913 E.01646
G1 X181.908 Y157.065 E.96471
G1 X182.442 Y157.065 E.01646
G1 X204.059 Y135.448 E.94144
G1 X204.059 Y135.982 E.01646
G1 X182.977 Y157.065 E.91816
G1 X183.511 Y157.065 E.01646
G1 X204.059 Y136.516 E.89489
G1 X204.059 Y137.051 E.01646
G1 X184.045 Y157.065 E.87161
G1 X184.58 Y157.065 E.01646
G1 X204.059 Y137.585 E.84834
G1 X204.059 Y138.12 E.01646
G1 X185.114 Y157.065 E.82506
G1 X185.649 Y157.065 E.01646
G1 X204.059 Y138.654 E.80179
G1 X204.059 Y139.189 E.01646
G1 X186.183 Y157.065 E.77851
G1 X186.718 Y157.065 E.01646
G1 X204.059 Y139.723 E.75523
G1 X204.059 Y140.258 E.01646
G1 X187.252 Y157.065 E.73196
G1 X187.787 Y157.065 E.01646
G1 X204.059 Y140.792 E.70868
G1 X204.059 Y141.326 E.01646
G1 X188.321 Y157.065 E.68541
G1 X188.855 Y157.065 E.01646
G1 X204.059 Y141.861 E.66213
G1 X204.059 Y142.395 E.01646
G1 X189.39 Y157.065 E.63886
G1 X189.924 Y157.065 E.01646
G1 X204.059 Y142.93 E.61558
G1 X204.059 Y143.464 E.01646
G1 X190.459 Y157.065 E.59231
G1 X190.993 Y157.065 E.01646
G1 X204.059 Y143.999 E.56903
G1 X204.059 Y144.533 E.01646
G1 X191.528 Y157.065 E.54576
G1 X192.062 Y157.065 E.01646
G1 X204.059 Y145.068 E.52248
G1 X204.059 Y145.602 E.01646
G1 X192.597 Y157.065 E.4992
G1 X193.131 Y157.065 E.01646
G1 X204.059 Y146.136 E.47593
G1 X204.059 Y146.671 E.01646
G1 X193.665 Y157.065 E.45265
G1 X194.2 Y157.065 E.01646
G1 X204.059 Y147.205 E.42938
G1 X204.059 Y147.74 E.01646
G1 X194.734 Y157.065 E.4061
G1 X195.269 Y157.065 E.01646
G1 X204.059 Y148.274 E.38283
G1 X204.059 Y148.809 E.01646
G1 X195.803 Y157.065 E.35955
G1 X196.338 Y157.065 E.01646
G1 X204.059 Y149.343 E.33628
G1 X204.059 Y149.878 E.01646
G1 X196.872 Y157.065 E.313
G1 X197.407 Y157.065 E.01646
G1 X204.059 Y150.412 E.28972
G1 X204.059 Y150.947 E.01646
G1 X197.941 Y157.065 E.26645
G1 X198.475 Y157.065 E.01646
G1 X204.059 Y151.481 E.24317
G1 X204.059 Y152.015 E.01646
G1 X199.01 Y157.065 E.2199
G1 X199.544 Y157.065 E.01646
G1 X204.059 Y152.55 E.19662
G1 X204.059 Y153.084 E.01646
G1 X200.084 Y157.06 E.17314
G2 X200.674 Y157.004 I.011 J-3.014 E.0183
G1 X204 Y153.678 E.14482
G1 X203.985 Y153.793 E.00355
G1 X203.812 Y154.4 E.01945
G1 X201.138 Y157.074 E.11647
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X202.552 Y155.66 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/105
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
G3 Z7.2 I.687 J-1.004 P1  F30000
G1 X169.673 Y133.173 Z7.2
G1 Z7
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X159.431 Y133.172 E.31473
G2 X159.128 Y133.372 I.027 J.37 E.01163
G3 X101.872 Y133.372 I-28.628 J-7.506 E2.39058
G2 X101.569 Y133.172 I-.33 J.171 E.01163
G1 X90.327 Y133.173 E.34546
G1 X90.327 Y104.827 E.87102
G1 X107.497 Y104.828 E.5276
G2 X107.814 Y104.573 I-.013 J-.341 E.01341
G1 X107.827 Y104.509 E.00199
G1 X107.827 Y100.827 E.11316
G1 X116.673 Y100.827 E.27184
G1 X116.673 Y104.511 E.11321
G2 X116.927 Y104.814 I.331 J-.019 E.01303
G1 X116.991 Y104.827 E.00199
G1 X143.996 Y104.828 E.82981
G2 X144.327 Y104.511 I-.011 J-.342 E.01541
G1 X144.327 Y100.827 E.11321
G1 X153.173 Y100.827 E.27184
G1 X153.173 Y104.511 E.11321
G2 X153.489 Y104.827 I.343 J-.027 E.01494
G1 X169.673 Y104.827 E.4973
G1 X169.673 Y133.113 E.86918
M204 S10000
; WIPE_START
G1 F24000
M73 P71 R13
G1 X167.673 Y133.125 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.275 J-1.185 P1  F30000
G1 X55.602 Y107.078 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X63.922 Y107.078 E.27599
G1 X63.922 Y130.922 E.79096
G1 X55.602 Y130.922 E.27599
G1 X55.602 Y107.138 E.78897
; WIPE_START
G1 F24000
G1 X57.602 Y107.123 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I0 J1.217 P1  F30000
G1 X196.078 Y107.078 Z7.4
G1 Z7
G1 E.8 F1800
G1 F15476.087
G1 X204.398 Y107.078 E.27599
G1 X204.398 Y130.922 E.79096
G1 X196.078 Y130.922 E.27599
G1 X196.078 Y107.138 E.78897
; WIPE_START
G1 F24000
G1 X198.078 Y107.123 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.039 J-1.216 P1  F30000
G1 X55.234 Y102.531 Z7.4
G1 Z7
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X60.003 Y98.21 I4.78 J.483 E.21664
G1 X200.232 Y98.216 E4.30885
G3 X204.79 Y103.003 I-.235 J4.788 E.22411
G1 X204.79 Y152.997 E1.5362
G3 X199.997 Y157.79 I-4.804 J-.012 E.23117
G1 X60.003 Y157.79 E4.30165
G3 X55.21 Y152.997 I.012 J-4.804 E.23117
G1 X55.21 Y103.003 E1.5362
G3 X55.229 Y102.59 I4.804 J.012 E.01268
M204 S10000
; WIPE_START
G1 F24000
G1 X55.302 Y102.065 E-.20139
G1 X55.416 Y101.61 E-.17861
G1 X55.575 Y101.167 E-.17862
G1 X55.776 Y100.742 E-.17862
G1 X55.806 Y100.691 E-.02277
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.174 J.322 P1  F30000
G1 X63.574 Y129.029 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X63.574 Y130.574 E.05124
G1 X63.49 Y130.574 E.00278
G1 X55.95 Y123.034 E.35371
G1 X55.95 Y125.29 E.07483
G1 X63.574 Y117.666 E.35764
G1 X63.574 Y115.306 E.07831
G1 X55.95 Y107.682 E.35764
G1 X55.95 Y109.938 E.07483
G1 X58.462 Y107.426 E.11784
G1 X63.37 Y107.426 E.1628
G1 X63.574 Y107.63 E.00956
G1 X63.574 Y109.99 E.07831
G1 X55.95 Y117.614 E.35764
G1 X55.95 Y115.358 E.07483
G1 X63.574 Y122.982 E.35764
G1 X63.574 Y125.342 E.07831
G1 X58.342 Y130.574 E.24543
G1 X56.714 Y130.574 E.05401
; WIPE_START
G1 F24000
G1 X58.342 Y130.574 E-.61876
G1 X58.605 Y130.311 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.011 J1.217 P1  F30000
G1 X196.426 Y129.029 Z7.4
G1 Z7
G1 E.8 F1800
G1 F15476.087
G1 X196.426 Y130.574 E.05124
G1 X196.51 Y130.574 E.00278
G1 X204.05 Y123.034 E.35371
G1 X204.05 Y125.29 E.07483
G1 X196.426 Y117.666 E.35764
G1 X196.426 Y115.306 E.07831
G1 X204.05 Y107.682 E.35764
G1 X204.05 Y109.938 E.07483
G1 X201.538 Y107.426 E.11784
G1 X196.63 Y107.426 E.1628
G1 X196.426 Y107.63 E.00956
G1 X196.426 Y109.99 E.07831
G1 X204.05 Y117.614 E.35764
G1 X204.05 Y115.358 E.07483
G1 X196.426 Y122.982 E.35764
G1 X196.426 Y125.342 E.07831
G1 X201.658 Y130.574 E.24543
G1 X203.286 Y130.574 E.05401
; WIPE_START
G1 F24000
G1 X201.658 Y130.574 E-.61876
G1 X201.395 Y130.311 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.211 J.116 P1  F30000
G1 X204.18 Y101.125 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X201.875 Y98.82 E.10018
G1 X201.065 Y98.544
G1 X204.456 Y101.935 E.14733
G1 X204.562 Y102.574
G1 X200.426 Y98.438 E.17973
G1 X199.872 Y98.417
G1 X204.583 Y103.128 E.20469
G1 X204.583 Y103.661
G1 X199.339 Y98.417 E.22786
G1 X198.806 Y98.417
G1 X204.583 Y104.194 E.25104
G1 X204.583 Y104.728
G1 X198.272 Y98.417 E.27421
G1 X197.739 Y98.417
G1 X204.583 Y105.261 E.29738
G1 X204.583 Y105.794
G1 X197.206 Y98.417 E.32055
G1 X196.673 Y98.417
G1 X204.583 Y106.327 E.34373
G1 X204.577 Y106.855
G1 X196.139 Y98.417 E.36667
G1 X195.606 Y98.417
G1 X204.044 Y106.855 E.36667
G1 X203.511 Y106.855
G1 X195.073 Y98.417 E.36667
G1 X194.54 Y98.417
G1 X202.978 Y106.855 E.36667
G1 X202.444 Y106.855
G1 X194.006 Y98.417 E.36667
G1 X193.473 Y98.417
G1 X201.911 Y106.855 E.36667
G1 X201.378 Y106.855
G1 X192.94 Y98.417 E.36667
G1 X192.406 Y98.417
G1 X200.844 Y106.855 E.36667
G1 X200.311 Y106.855
G1 X191.873 Y98.417 E.36667
G1 X191.34 Y98.417
G1 X199.778 Y106.855 E.36667
G1 X199.245 Y106.855
G1 X190.807 Y98.417 E.36667
G1 X190.273 Y98.417
G1 X198.711 Y106.855 E.36667
G1 X198.178 Y106.855
G1 X189.74 Y98.417 E.36667
G1 X189.207 Y98.417
G1 X197.645 Y106.855 E.36667
G1 X197.112 Y106.855
G1 X188.674 Y98.417 E.36667
G1 X188.14 Y98.417
G1 X196.578 Y106.855 E.36667
G1 X196.045 Y106.855
G1 X187.607 Y98.417 E.36667
G1 X187.074 Y98.417
G1 X195.855 Y107.199 E.38161
G1 X195.855 Y107.732
G1 X186.54 Y98.417 E.40478
G1 X186.007 Y98.417
G1 X195.855 Y108.266 E.42795
G1 X195.855 Y108.799
G1 X185.474 Y98.417 E.45112
G1 X184.941 Y98.417
G1 X195.855 Y109.332 E.4743
G1 X195.855 Y109.865
G1 X184.407 Y98.417 E.49747
G1 X183.874 Y98.417
G1 X195.855 Y110.399 E.52064
G1 X195.855 Y110.932
G1 X183.341 Y98.417 E.54382
G1 X182.808 Y98.417
G1 X195.855 Y111.465 E.56699
G1 X195.855 Y111.998
G1 X182.274 Y98.417 E.59016
G1 X181.741 Y98.417
G1 X195.855 Y112.532 E.61334
G1 X195.855 Y113.065
G1 X181.208 Y98.417 E.63651
G1 X180.674 Y98.417
G1 X195.855 Y113.598 E.65968
G1 X195.855 Y114.132
G1 X180.141 Y98.417 E.68286
G1 X179.608 Y98.417
G1 X195.855 Y114.665 E.70603
G1 X195.855 Y115.198
G1 X179.075 Y98.417 E.7292
G1 X178.541 Y98.417
G1 X195.855 Y115.731 E.75238
G1 X195.855 Y116.265
G1 X178.008 Y98.417 E.77555
G1 X177.475 Y98.417
G1 X195.855 Y116.798 E.79872
G1 X195.855 Y117.331
G1 X176.942 Y98.417 E.8219
G1 X176.408 Y98.417
G1 X195.855 Y117.864 E.84507
G1 X195.855 Y118.398
G1 X175.875 Y98.417 E.86824
G1 X175.342 Y98.417
G1 X195.855 Y118.931 E.89141
G1 X195.855 Y119.464
G1 X174.809 Y98.417 E.91459
G1 X174.275 Y98.417
G1 X195.855 Y119.998 E.93776
G1 X195.855 Y120.531
G1 X173.742 Y98.417 E.96093
G1 X173.209 Y98.417
G1 X195.855 Y121.064 E.98411
G1 X195.855 Y121.597
G1 X172.675 Y98.417 E1.00728
G1 X172.142 Y98.417
G1 X195.855 Y122.131 E1.03045
G1 X195.855 Y122.664
G1 X171.609 Y98.417 E1.05363
G1 X171.076 Y98.417
G1 X195.855 Y123.197 E1.0768
G1 X195.855 Y123.73
G1 X170.542 Y98.417 E1.09997
G1 X170.009 Y98.417
G1 X195.855 Y124.264 E1.12315
G1 X195.855 Y124.797
G1 X169.476 Y98.417 E1.14632
G1 X168.943 Y98.417
G1 X195.855 Y125.33 E1.16949
G1 X195.855 Y125.863
G1 X168.409 Y98.417 E1.19267
G1 X167.876 Y98.417
G1 X195.855 Y126.397 E1.21584
G1 X195.855 Y126.93
G1 X167.343 Y98.417 E1.23901
G1 X166.809 Y98.417
G1 X195.855 Y127.463 E1.26219
G1 X195.855 Y127.997
G1 X166.276 Y98.417 E1.28536
G1 X165.743 Y98.417
G1 X195.855 Y128.53 E1.30853
G1 X195.855 Y129.063
G1 X165.21 Y98.417 E1.33171
G1 X164.676 Y98.417
G1 X195.855 Y129.596 E1.35488
G1 X195.855 Y130.13
G1 X164.143 Y98.417 E1.37805
G1 X163.61 Y98.417
G1 X169.812 Y104.619 E.2695
G1 X169.278 Y104.619
G1 X163.077 Y98.417 E.2695
G1 X162.543 Y98.417
G1 X168.745 Y104.619 E.2695
G1 X168.212 Y104.619
G1 X162.01 Y98.417 E.2695
G1 X161.477 Y98.417
G1 X167.679 Y104.619 E.2695
G1 X167.145 Y104.619
G1 X160.943 Y98.417 E.2695
G1 X160.41 Y98.417
G1 X166.612 Y104.619 E.2695
G1 X166.079 Y104.619
G1 X159.877 Y98.417 E.2695
G1 X159.344 Y98.417
G1 X165.546 Y104.619 E.2695
G1 X165.012 Y104.619
G1 X158.81 Y98.417 E.2695
G1 X158.277 Y98.417
G1 X164.479 Y104.619 E.2695
G1 X163.946 Y104.619
G1 X157.744 Y98.417 E.2695
G1 X157.211 Y98.417
G1 X163.413 Y104.619 E.2695
G1 X162.879 Y104.619
G1 X156.677 Y98.417 E.2695
G1 X156.144 Y98.417
G1 X162.346 Y104.619 E.2695
G1 X161.813 Y104.619
G1 X155.611 Y98.417 E.2695
G1 X155.078 Y98.417
G1 X161.279 Y104.619 E.2695
G1 X160.746 Y104.619
G1 X154.544 Y98.417 E.2695
G1 X154.011 Y98.417
G1 X160.213 Y104.619 E.26951
G1 X159.68 Y104.619
G1 X153.478 Y98.417 E.26951
G1 X152.944 Y98.417
G1 X159.146 Y104.619 E.26951
G1 X158.613 Y104.619
G1 X152.411 Y98.417 E.26951
G1 X151.878 Y98.417
G1 X158.08 Y104.619 E.26951
G1 X157.547 Y104.619
G1 X151.345 Y98.417 E.26951
G1 X150.811 Y98.417
G1 X153.013 Y100.619 E.09568
G1 X152.48 Y100.619
G1 X150.278 Y98.417 E.09568
G1 X149.745 Y98.417
G1 X151.947 Y100.619 E.09568
G1 X151.413 Y100.619
G1 X149.212 Y98.417 E.09568
G1 X148.678 Y98.417
G1 X150.88 Y100.619 E.09568
G1 X150.347 Y100.619
G1 X148.145 Y98.417 E.09568
G1 X147.612 Y98.417
G1 X149.814 Y100.619 E.09568
G1 X149.28 Y100.619
G1 X147.078 Y98.417 E.09568
G1 X146.545 Y98.417
G1 X148.747 Y100.619 E.09568
G1 X148.214 Y100.619
G1 X146.012 Y98.417 E.09568
G1 X145.479 Y98.417
G1 X147.68 Y100.619 E.09568
G1 X147.147 Y100.619
G1 X144.945 Y98.417 E.09568
G1 X144.412 Y98.417
G1 X146.614 Y100.619 E.09568
G1 X146.081 Y100.619
G1 X143.879 Y98.417 E.09568
G1 X143.346 Y98.417
G1 X145.547 Y100.619 E.09568
G1 X145.014 Y100.619
G1 X142.812 Y98.417 E.09568
G1 X142.279 Y98.417
G1 X144.481 Y100.619 E.09568
G1 X144.119 Y100.791
G1 X141.746 Y98.417 E.10314
G1 X141.212 Y98.417
G1 X144.119 Y101.324 E.12631
G1 X144.119 Y101.857
G1 X140.679 Y98.417 E.14949
G1 X140.146 Y98.417
G1 X144.119 Y102.391 E.17266
G1 X144.119 Y102.924
G1 X139.613 Y98.417 E.19584
G1 X139.079 Y98.417
G1 X144.119 Y103.457 E.21901
G1 X144.119 Y103.991
G1 X138.546 Y98.417 E.24219
G1 X138.013 Y98.417
G1 X144.119 Y104.524 E.26536
G1 X143.683 Y104.62
G1 X137.48 Y98.417 E.26955
G1 X136.946 Y98.417
G1 X143.149 Y104.62 E.26955
G1 X142.616 Y104.62
M73 P72 R13
G1 X136.413 Y98.417 E.26955
G1 X135.88 Y98.417
G1 X142.083 Y104.62 E.26955
G1 X141.549 Y104.62
G1 X135.347 Y98.417 E.26955
G1 X134.813 Y98.417
G1 X141.016 Y104.62 E.26955
G1 X140.483 Y104.62
G1 X134.28 Y98.417 E.26955
G1 X133.747 Y98.417
G1 X139.95 Y104.62 E.26955
G1 X139.416 Y104.62
G1 X133.213 Y98.417 E.26954
G1 X132.68 Y98.417
G1 X138.883 Y104.62 E.26954
G1 X138.35 Y104.62
G1 X132.147 Y98.417 E.26954
G1 X131.614 Y98.417
G1 X137.816 Y104.62 E.26954
G1 X137.283 Y104.62
G1 X131.08 Y98.417 E.26954
G1 X130.547 Y98.417
G1 X136.75 Y104.62 E.26954
G1 X136.217 Y104.62
G1 X130.014 Y98.417 E.26954
G1 X129.481 Y98.417
G1 X135.683 Y104.62 E.26954
G1 X135.15 Y104.62
G1 X128.947 Y98.417 E.26954
G1 X128.414 Y98.417
G1 X134.617 Y104.62 E.26954
G1 X134.083 Y104.62
G1 X127.881 Y98.417 E.26954
G1 X127.347 Y98.417
G1 X133.55 Y104.62 E.26954
G1 X133.017 Y104.62
G1 X126.814 Y98.417 E.26953
G1 X126.281 Y98.417
G1 X132.484 Y104.62 E.26953
G1 X131.95 Y104.62
G1 X125.748 Y98.417 E.26953
G1 X125.214 Y98.417
G1 X131.417 Y104.62 E.26953
G1 X130.884 Y104.62
G1 X124.681 Y98.417 E.26953
G1 X124.148 Y98.417
G1 X130.35 Y104.62 E.26953
G1 X129.817 Y104.62
G1 X123.615 Y98.417 E.26953
G1 X123.081 Y98.417
G1 X129.284 Y104.62 E.26953
G1 X128.751 Y104.62
G1 X122.548 Y98.417 E.26953
G1 X122.015 Y98.417
G1 X128.217 Y104.62 E.26953
G1 X127.684 Y104.62
G1 X121.481 Y98.417 E.26953
G1 X120.948 Y98.417
G1 X127.151 Y104.62 E.26953
G1 X126.617 Y104.62
G1 X120.415 Y98.417 E.26952
G1 X119.882 Y98.417
G1 X126.084 Y104.62 E.26952
G1 X125.551 Y104.62
G1 X119.348 Y98.417 E.26952
G1 X118.815 Y98.417
G1 X125.018 Y104.62 E.26952
G1 X124.484 Y104.62
G1 X118.282 Y98.417 E.26952
G1 X117.749 Y98.417
G1 X123.951 Y104.62 E.26952
G1 X123.418 Y104.62
G1 X117.215 Y98.417 E.26952
G1 X116.682 Y98.417
G1 X122.884 Y104.62 E.26952
G1 X122.351 Y104.62
G1 X116.149 Y98.417 E.26952
G1 X115.616 Y98.417
G1 X121.818 Y104.62 E.26952
G1 X121.284 Y104.62
G1 X115.082 Y98.417 E.26952
G1 X114.549 Y98.417
G1 X116.751 Y100.619 E.09568
G1 X116.218 Y100.619
G1 X114.016 Y98.417 E.09568
G1 X113.482 Y98.417
G1 X115.684 Y100.619 E.09568
G1 X115.151 Y100.619
G1 X112.949 Y98.417 E.09568
G1 X112.416 Y98.417
G1 X114.618 Y100.619 E.09568
G1 X114.084 Y100.619
G1 X111.883 Y98.417 E.09568
G1 X111.349 Y98.417
G1 X113.551 Y100.619 E.09568
G1 X113.018 Y100.619
G1 X110.816 Y98.417 E.09568
G1 X110.283 Y98.417
G1 X112.485 Y100.619 E.09568
G1 X111.951 Y100.619
G1 X109.75 Y98.417 E.09568
G1 X109.216 Y98.417
G1 X111.418 Y100.619 E.09568
G1 X110.885 Y100.619
G1 X108.683 Y98.417 E.09568
G1 X108.15 Y98.417
G1 X110.352 Y100.619 E.09568
G1 X109.818 Y100.619
G1 X107.616 Y98.417 E.09568
G1 X107.083 Y98.417
G1 X109.285 Y100.619 E.09568
G1 X108.752 Y100.619
G1 X106.55 Y98.417 E.09568
G1 X106.017 Y98.417
G1 X108.218 Y100.619 E.09568
G1 X107.685 Y100.619
G1 X105.483 Y98.417 E.09568
G1 X104.95 Y98.417
G1 X107.619 Y101.086 E.11598
G1 X107.619 Y101.62
G1 X104.417 Y98.417 E.13916
G1 X103.884 Y98.417
G1 X107.619 Y102.153 E.16233
G1 X107.619 Y102.686
G1 X103.35 Y98.417 E.18551
G1 X102.817 Y98.417
G1 X107.619 Y103.22 E.20868
G1 X107.619 Y103.753
G1 X102.284 Y98.417 E.23186
G1 X101.75 Y98.417
G1 X107.619 Y104.286 E.25503
G1 X107.42 Y104.62
G1 X101.217 Y98.417 E.26955
G1 X100.684 Y98.417
G1 X106.887 Y104.62 E.26955
G1 X106.354 Y104.62
G1 X100.151 Y98.417 E.26955
G1 X99.617 Y98.417
G1 X105.82 Y104.62 E.26955
G1 X105.287 Y104.62
G1 X99.084 Y98.417 E.26955
G1 X98.551 Y98.417
G1 X104.754 Y104.62 E.26954
G1 X104.22 Y104.62
G1 X98.018 Y98.417 E.26954
G1 X97.484 Y98.417
G1 X103.687 Y104.62 E.26954
G1 X103.154 Y104.62
G1 X96.951 Y98.417 E.26954
G1 X96.418 Y98.417
G1 X102.62 Y104.62 E.26954
G1 X102.087 Y104.62
G1 X95.885 Y98.417 E.26953
G1 X95.351 Y98.417
G1 X101.554 Y104.62 E.26953
G1 X101.021 Y104.62
G1 X94.818 Y98.417 E.26953
G1 X94.285 Y98.417
G1 X100.487 Y104.62 E.26953
G1 X99.954 Y104.62
G1 X93.751 Y98.417 E.26953
G1 X93.218 Y98.417
G1 X99.421 Y104.62 E.26953
G1 X98.887 Y104.62
G1 X92.685 Y98.417 E.26952
G1 X92.152 Y98.417
G1 X98.354 Y104.62 E.26952
G1 X97.821 Y104.62
G1 X91.618 Y98.417 E.26952
G1 X91.085 Y98.417
G1 X97.287 Y104.62 E.26952
G1 X96.754 Y104.62
G1 X90.552 Y98.417 E.26952
G1 X90.019 Y98.417
G1 X96.221 Y104.62 E.26952
G1 X95.687 Y104.62
G1 X89.485 Y98.417 E.26951
G1 X88.952 Y98.417
G1 X95.154 Y104.62 E.26951
G1 X94.621 Y104.619
G1 X88.419 Y98.417 E.26951
G1 X87.885 Y98.417
G1 X94.088 Y104.619 E.26951
G1 X93.554 Y104.619
G1 X87.352 Y98.417 E.26951
G1 X86.819 Y98.417
G1 X93.021 Y104.619 E.26951
G1 X92.488 Y104.619
G1 X86.286 Y98.417 E.2695
G1 X85.752 Y98.417
G1 X91.954 Y104.619 E.2695
G1 X91.421 Y104.619
G1 X85.219 Y98.417 E.2695
G1 X84.686 Y98.417
G1 X90.888 Y104.619 E.2695
G1 X90.354 Y104.619
G1 X84.153 Y98.417 E.2695
G1 X83.619 Y98.417
G1 X90.119 Y104.917 E.28245
G1 X90.119 Y105.451
G1 X83.086 Y98.417 E.30562
G1 X82.553 Y98.417
G1 X90.119 Y105.984 E.3288
G1 X90.119 Y106.517
G1 X82.019 Y98.417 E.35197
G1 X81.486 Y98.417
G1 X90.119 Y107.05 E.37514
G1 X90.119 Y107.584
G1 X80.953 Y98.417 E.39832
G1 X80.42 Y98.417
G1 X90.119 Y108.117 E.42149
G1 X90.119 Y108.65
G1 X79.886 Y98.417 E.44466
G1 X79.353 Y98.417
G1 X90.119 Y109.183 E.46784
G1 X90.119 Y109.717
G1 X78.82 Y98.417 E.49101
G1 X78.287 Y98.417
G1 X90.119 Y110.25 E.51418
G1 X90.119 Y110.783
G1 X77.753 Y98.417 E.53736
G1 X77.22 Y98.417
G1 X90.119 Y111.317 E.56053
G1 X90.119 Y111.85
G1 X76.687 Y98.417 E.5837
G1 X76.154 Y98.417
G1 X90.119 Y112.383 E.60688
G1 X90.119 Y112.916
G1 X75.62 Y98.417 E.63005
G1 X75.087 Y98.417
G1 X90.119 Y113.45 E.65322
G1 X90.119 Y113.983
G1 X74.554 Y98.417 E.6764
G1 X74.02 Y98.417
G1 X90.119 Y114.516 E.69957
G1 X90.119 Y115.049
G1 X73.487 Y98.417 E.72274
G1 X72.954 Y98.417
G1 X90.119 Y115.583 E.74591
G1 X90.119 Y116.116
G1 X72.421 Y98.417 E.76909
G1 X71.887 Y98.417
G1 X90.119 Y116.649 E.79226
G1 X90.119 Y117.182
G1 X71.354 Y98.417 E.81543
G1 X70.821 Y98.417
G1 X90.119 Y117.716 E.83861
G1 X90.119 Y118.249
G1 X70.288 Y98.417 E.86178
G1 X69.754 Y98.417
G1 X90.119 Y118.782 E.88495
G1 X90.119 Y119.316
G1 X69.221 Y98.417 E.90813
G1 X68.688 Y98.417
G1 X90.119 Y119.849 E.9313
G1 X90.119 Y120.382
G1 X68.154 Y98.417 E.95447
G1 X67.621 Y98.417
G1 X90.119 Y120.915 E.97765
G1 X90.119 Y121.449
G1 X67.088 Y98.417 E1.00082
G1 X66.555 Y98.417
G1 X90.119 Y121.982 E1.02399
G1 X90.119 Y122.515
G1 X66.021 Y98.417 E1.04717
G1 X65.488 Y98.417
G1 X90.119 Y123.048 E1.07034
G1 X90.119 Y123.582
G1 X64.955 Y98.417 E1.09351
G1 X64.422 Y98.417
G1 X90.119 Y124.115 E1.11669
G1 X90.119 Y124.648
G1 X63.888 Y98.417 E1.13986
G1 X63.355 Y98.417
G1 X90.119 Y125.182 E1.16303
G1 X90.119 Y125.715
G1 X62.822 Y98.417 E1.18621
G1 X62.289 Y98.417
G1 X90.119 Y126.248 E1.20938
G1 X90.119 Y126.781
G1 X61.755 Y98.417 E1.23255
G1 X61.222 Y98.417
G1 X90.119 Y127.315 E1.25572
G1 X90.119 Y127.848
G1 X60.689 Y98.417 E1.2789
G1 X60.155 Y98.417
G1 X90.119 Y128.381 E1.30207
G1 X90.119 Y128.914
G1 X59.638 Y98.433 E1.32456
G1 X59.167 Y98.495
G1 X90.119 Y129.448 E1.34504
G1 X90.119 Y129.981
G1 X58.735 Y98.597 E1.3638
G1 X58.337 Y98.732
G1 X90.119 Y130.514 E1.38111
G1 X90.119 Y131.048
G1 X57.967 Y98.895 E1.39719
G1 X57.622 Y99.084
G1 X90.119 Y131.581 E1.41216
G1 X90.119 Y132.114
G1 X57.302 Y99.297 E1.42606
G1 X57.005 Y99.533
G1 X90.119 Y132.647 E1.43896
G1 X90.119 Y133.181
G1 X64.145 Y107.206 E1.12872
G1 X63.794 Y106.855
G1 X56.73 Y99.791 E.30698
M73 P72 R12
G1 X56.476 Y100.071
G1 X63.261 Y106.855 E.29481
G1 X62.727 Y106.855
G1 X56.246 Y100.374 E.28164
G1 X56.038 Y100.699
G1 X62.194 Y106.855 E.26751
G1 X61.661 Y106.855
G1 X55.854 Y101.049 E.25233
G1 X55.697 Y101.425
G1 X61.128 Y106.855 E.23597
G1 X60.594 Y106.855
G1 X55.57 Y101.831 E.21833
G1 X55.477 Y102.271
G1 X60.061 Y106.855 E.1992
G1 X59.528 Y106.855
G1 X55.425 Y102.752 E.1783
G1 X55.417 Y103.278
G1 X58.995 Y106.855 E.15544
G1 X58.461 Y106.855
G1 X55.417 Y103.811 E.13227
G1 X55.417 Y104.345
G1 X57.928 Y106.855 E.1091
G1 X57.395 Y106.855
G1 X55.417 Y104.878 E.08593
G1 X55.417 Y105.411
G1 X56.861 Y106.855 E.06275
G1 X56.328 Y106.855
G1 X55.417 Y105.945 E.03958
G1 X55.417 Y106.478
G1 X55.795 Y106.855 E.01641
M204 S10000
; WIPE_START
G1 F24000
G1 X55.417 Y106.478 E-.20289
G1 X55.417 Y105.945 E-.20264
G1 X56.077 Y106.604 E-.35447
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.117 J1.211 P1  F30000
G1 X116.881 Y100.749 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X120.751 Y104.62 E.16819
G1 X120.218 Y104.62
G1 X116.881 Y101.282 E.14501
G1 X116.881 Y101.816
M73 P73 R12
G1 X119.685 Y104.62 E.12184
G1 X119.151 Y104.62
G1 X116.881 Y102.349 E.09867
G1 X116.881 Y102.882
G1 X118.618 Y104.62 E.0755
G1 X118.085 Y104.62
G1 X116.881 Y103.415 E.05232
G1 X116.881 Y103.949
G1 X117.551 Y104.619 E.02915
M204 S10000
; WIPE_START
G1 F24000
G1 X116.881 Y103.949 E-.36053
G1 X116.881 Y103.415 E-.20263
G1 X117.247 Y103.782 E-.19685
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.094 J1.213 P1  F30000
G1 X153.381 Y100.987 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X157.013 Y104.619 E.15785
G1 X156.48 Y104.619
G1 X153.381 Y101.52 E.13468
G1 X153.381 Y102.053
G1 X155.947 Y104.619 E.11151
G1 X155.414 Y104.619
G1 X153.381 Y102.587 E.08834
G1 X153.381 Y103.12
G1 X154.88 Y104.619 E.06517
G1 X154.347 Y104.619
G1 X153.381 Y103.653 E.042
G1 X153.381 Y104.186
G1 X153.814 Y104.619 E.01883
M204 S10000
; WIPE_START
G1 F24000
G1 X153.381 Y104.186 E-.23282
G1 X153.381 Y103.653 E-.20263
G1 X153.985 Y104.257 E-.32455
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.033 J1.217 P1  F30000
G1 X169.881 Y104.688 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X195.855 Y130.663 E1.12872
M204 S10000
G1 X203.803 Y131.145 F30000
M204 S2000
G1 F12000
G1 X204.583 Y131.924 E.03388
G1 X204.583 Y132.458
G1 X203.27 Y131.145 E.05706
G1 X202.736 Y131.145
G1 X204.583 Y132.991 E.08023
G1 X204.583 Y133.524
G1 X202.203 Y131.145 E.1034
G1 X201.67 Y131.145
G1 X204.583 Y134.057 E.12658
G1 X204.583 Y134.591
G1 X201.137 Y131.145 E.14975
G1 X200.603 Y131.145
G1 X204.583 Y135.124 E.17292
G1 X204.583 Y135.657
G1 X200.07 Y131.145 E.1961
G1 X199.537 Y131.145
G1 X204.583 Y136.191 E.21927
G1 X204.583 Y136.724
G1 X199.003 Y131.145 E.24244
G1 X198.47 Y131.145
G1 X204.583 Y137.257 E.26562
G1 X204.583 Y137.79
G1 X197.937 Y131.145 E.28879
G1 X197.404 Y131.145
G1 X204.583 Y138.324 E.31196
G1 X204.583 Y138.857
G1 X196.87 Y131.145 E.33514
G1 X196.337 Y131.145
G1 X204.583 Y139.39 E.35831
G1 X204.583 Y139.923
G1 X169.881 Y105.222 E1.50796
G1 X169.881 Y105.755
G1 X204.583 Y140.457 E1.50796
G1 X204.583 Y140.99
G1 X169.881 Y106.288 E1.50796
G1 X169.881 Y106.821
G1 X204.583 Y141.523 E1.50796
G1 X204.583 Y142.057
G1 X169.881 Y107.355 E1.50796
G1 X169.881 Y107.888
G1 X204.583 Y142.59 E1.50796
G1 X204.583 Y143.123
G1 X169.881 Y108.421 E1.50796
G1 X169.881 Y108.955
G1 X204.583 Y143.656 E1.50796
G1 X204.583 Y144.19
G1 X169.881 Y109.488 E1.50796
G1 X169.881 Y110.021
G1 X204.583 Y144.723 E1.50796
G1 X204.583 Y145.256
G1 X169.881 Y110.554 E1.50796
G1 X169.881 Y111.088
G1 X204.583 Y145.789 E1.50796
G1 X204.583 Y146.323
G1 X169.881 Y111.621 E1.50796
G1 X169.881 Y112.154
G1 X204.583 Y146.856 E1.50796
G1 X204.583 Y147.389
G1 X169.881 Y112.687 E1.50796
G1 X169.881 Y113.221
G1 X204.583 Y147.922 E1.50796
G1 X204.583 Y148.456
G1 X169.881 Y113.754 E1.50796
G1 X169.881 Y114.287
G1 X204.583 Y148.989 E1.50796
G1 X204.583 Y149.522
G1 X169.881 Y114.82 E1.50796
G1 X169.881 Y115.354
G1 X204.583 Y150.056 E1.50796
G1 X204.583 Y150.589
G1 X169.881 Y115.887 E1.50796
G1 X169.881 Y116.42
G1 X204.583 Y151.122 E1.50796
G1 X204.583 Y151.655
G1 X169.881 Y116.954 E1.50796
G1 X169.881 Y117.487
G1 X204.583 Y152.189 E1.50796
G1 X204.583 Y152.722
G1 X169.881 Y118.02 E1.50796
G1 X169.881 Y118.553
G1 X204.575 Y153.248 E1.50764
G1 X204.523 Y153.729
G1 X169.881 Y119.087 E1.50537
G1 X169.881 Y119.62
G1 X204.43 Y154.169 E1.50132
G1 X204.303 Y154.575
G1 X169.881 Y120.153 E1.49579
G1 X169.881 Y120.686
G1 X204.146 Y154.952 E1.48899
G1 X203.962 Y155.301
G1 X169.881 Y121.22 E1.48098
G1 X169.881 Y121.753
G1 X203.754 Y155.626 E1.47195
G1 X203.523 Y155.929
G1 X169.881 Y122.286 E1.46194
G1 X169.881 Y122.82
G1 X203.27 Y156.209 E1.45093
G1 X202.995 Y156.467
G1 X169.881 Y123.353 E1.43896
G1 X169.881 Y123.886
G1 X202.698 Y156.703 E1.42606
G1 X202.378 Y156.917
G1 X169.881 Y124.419 E1.41216
G1 X169.881 Y124.953
G1 X202.033 Y157.105 E1.39719
G1 X201.663 Y157.268
G1 X169.881 Y125.486 E1.38111
G1 X169.881 Y126.019
G1 X201.265 Y157.403 E1.36379
G1 X200.833 Y157.505
G1 X169.881 Y126.552 E1.34504
G1 X169.881 Y127.086
G1 X200.362 Y157.567 E1.32455
G1 X199.844 Y157.583
G1 X169.881 Y127.619 E1.30207
G1 X169.881 Y128.152
G1 X199.311 Y157.583 E1.27889
G1 X198.778 Y157.583
G1 X169.881 Y128.686 E1.25572
G1 X169.881 Y129.219
G1 X198.245 Y157.583 E1.23255
G1 X197.711 Y157.583
G1 X169.881 Y129.752 E1.20937
G1 X169.881 Y130.285
G1 X197.178 Y157.583 E1.1862
G1 X196.645 Y157.583
G1 X169.881 Y130.819 E1.16303
G1 X169.881 Y131.352
G1 X196.112 Y157.583 E1.13985
G1 X195.578 Y157.583
G1 X169.881 Y131.885 E1.11668
G1 X169.881 Y132.418
G1 X195.045 Y157.583 E1.09351
G1 X194.512 Y157.583
G1 X169.881 Y132.952 E1.07033
G1 X169.777 Y133.381
G1 X193.978 Y157.583 E1.05168
G1 X193.445 Y157.583
G1 X169.243 Y133.381 E1.05169
G1 X168.71 Y133.381
G1 X192.912 Y157.583 E1.05169
G1 X192.379 Y157.583
G1 X168.177 Y133.381 E1.05169
G1 X167.643 Y133.381
G1 X191.845 Y157.583 E1.0517
G1 X191.312 Y157.583
G1 X167.11 Y133.381 E1.0517
G1 X166.577 Y133.38
G1 X190.779 Y157.583 E1.0517
G1 X190.246 Y157.583
G1 X166.043 Y133.38 E1.0517
G1 X165.51 Y133.38
G1 X189.712 Y157.583 E1.05171
G1 X189.179 Y157.583
G1 X164.977 Y133.38 E1.05171
G1 X164.443 Y133.38
G1 X188.646 Y157.583 E1.05171
G1 X188.112 Y157.583
G1 X163.91 Y133.38 E1.05172
G1 X163.377 Y133.38
G1 X187.579 Y157.583 E1.05172
G1 X187.046 Y157.583
G1 X162.843 Y133.38 E1.05172
G1 X162.31 Y133.38
G1 X186.513 Y157.583 E1.05172
G1 X185.979 Y157.583
G1 X161.777 Y133.38 E1.05173
G1 X161.243 Y133.38
G1 X185.446 Y157.583 E1.05173
G1 X184.913 Y157.583
G1 X160.71 Y133.38 E1.05173
G1 X160.177 Y133.38
G1 X184.38 Y157.583 E1.05174
G1 X183.846 Y157.583
G1 X159.643 Y133.38 E1.05174
G1 X159.29 Y133.559
G1 X183.313 Y157.583 E1.04393
G1 X182.78 Y157.583
G1 X159.17 Y133.972 E1.02598
G1 X159.049 Y134.385
G1 X182.247 Y157.583 E1.00803
G1 X181.713 Y157.583
G1 X158.929 Y134.798 E.99008
G1 X158.795 Y135.198
G1 X181.18 Y157.583 E.97274
G1 X180.647 Y157.583
G1 X158.659 Y135.595 E.95549
G1 X158.522 Y135.992
G1 X180.113 Y157.583 E.93824
G1 X179.58 Y157.583
G1 X158.381 Y136.383 E.92123
G1 X158.228 Y136.764
G1 X179.047 Y157.583 E.90467
G1 X178.514 Y157.583
G1 X158.076 Y137.145 E.88812
G1 X157.924 Y137.526
G1 X177.98 Y157.583 E.87156
G1 X177.447 Y157.583
G1 X157.76 Y137.895 E.8555
G1 X157.592 Y138.261
G1 X176.914 Y157.583 E.83961
G1 X176.381 Y157.583
G1 X157.425 Y138.627 E.82373
G1 X157.256 Y138.991
G1 X175.847 Y157.583 E.80788
G1 X175.314 Y157.583
G1 X157.074 Y139.342 E.79264
G1 X156.891 Y139.693
G1 X174.781 Y157.583 E.77739
M73 P74 R12
G1 X174.247 Y157.583
G1 X156.709 Y140.044 E.76215
G1 X156.521 Y140.39
G1 X173.714 Y157.583 E.74711
G1 X173.181 Y157.583
G1 X156.325 Y140.726 E.73248
G1 X156.128 Y141.063
G1 X172.648 Y157.583 E.71786
G1 X172.114 Y157.583
G1 X155.931 Y141.399 E.70324
G1 X155.727 Y141.728
G1 X171.581 Y157.583 E.68895
G1 X171.048 Y157.583
G1 X155.516 Y142.051 E.67493
G1 X155.305 Y142.373
G1 X170.515 Y157.583 E.66091
G1 X169.981 Y157.583
G1 X155.095 Y142.696 E.6469
G1 X154.874 Y143.009
G1 X169.448 Y157.583 E.6333
G1 X168.915 Y157.583
G1 X154.65 Y143.318 E.61988
G1 X154.425 Y143.627
G1 X168.381 Y157.583 E.60646
G1 X167.848 Y157.583
G1 X154.201 Y143.935 E.59304
G1 X153.965 Y144.233
G1 X167.315 Y157.583 E.5801
G1 X166.782 Y157.583
G1 X153.728 Y144.528 E.56727
G1 X153.49 Y144.824
G1 X166.248 Y157.583 E.55443
G1 X165.715 Y157.583
G1 X153.252 Y145.119 E.54159
G1 X153.001 Y145.402
G1 X165.182 Y157.583 E.5293
G1 X164.649 Y157.583
G1 X152.75 Y145.684 E.51704
G1 X152.499 Y145.966
G1 X164.115 Y157.583 E.50478
G1 X163.582 Y157.583
G1 X152.248 Y146.248 E.49254
G1 X151.983 Y146.517
G1 X163.049 Y157.583 E.48086
G1 X162.516 Y157.583
G1 X151.719 Y146.786 E.46918
G1 X151.454 Y147.055
G1 X161.982 Y157.583 E.45749
G1 X161.449 Y157.583
G1 X151.188 Y147.322 E.44587
G1 X150.911 Y147.578
G1 X160.916 Y157.583 E.43477
G1 X160.382 Y157.583
G1 X150.633 Y147.833 E.42366
G1 X150.355 Y148.089
G1 X159.849 Y157.583 E.41255
G1 X159.316 Y157.583
G1 X150.075 Y148.342 E.40155
G1 X149.784 Y148.584
G1 X158.783 Y157.583 E.39102
G1 X158.249 Y157.583
G1 X149.493 Y148.827 E.38049
G1 X149.202 Y149.069
G1 X157.716 Y157.583 E.36996
G1 X157.183 Y157.583
G1 X148.908 Y149.307 E.3596
G1 X148.603 Y149.536
G1 X156.65 Y157.583 E.34965
G1 X156.116 Y157.583
G1 X148.299 Y149.765 E.33971
G1 X147.994 Y149.994
G1 X155.583 Y157.583 E.32976
G1 X155.05 Y157.583
G1 X147.685 Y150.217 E.32005
G1 X147.367 Y150.433
G1 X154.516 Y157.583 E.3107
G1 X153.983 Y157.583
G1 X147.049 Y150.648 E.30134
G1 X146.731 Y150.863
G1 X153.45 Y157.583 E.29198
G1 X152.917 Y157.583
G1 X146.405 Y151.071 E.28296
G1 X146.073 Y151.272
G1 X152.383 Y157.583 E.27421
G1 X151.85 Y157.583
G1 X145.741 Y151.474 E.26545
G1 X145.41 Y151.675
G1 X151.317 Y157.583 E.2567
G1 X150.784 Y157.583
G1 X145.067 Y151.866 E.24841
G1 X144.721 Y152.053
G1 X150.25 Y157.583 E.24027
G1 X149.717 Y157.583
G1 X144.375 Y152.241 E.23213
G1 X144.029 Y152.428
G1 X149.184 Y157.583 E.224
G1 X148.65 Y157.583
G1 X143.668 Y152.601 E.21649
G1 X143.308 Y152.773
G1 X148.117 Y157.583 E.20899
G1 X147.584 Y157.583
G1 X142.947 Y152.946 E.20149
G1 X142.582 Y153.114
G1 X147.051 Y157.583 E.19419
G1 X146.517 Y157.583
G1 X142.206 Y153.271 E.18734
G1 X141.83 Y153.429
G1 X145.984 Y157.583 E.1805
G1 X145.451 Y157.583
G1 X141.455 Y153.586 E.17366
G1 X141.068 Y153.733
G1 X144.918 Y157.583 E.16727
G1 X144.384 Y157.583
G1 X140.677 Y153.875 E.16111
G1 X140.285 Y154.017
G1 X143.851 Y157.583 E.15496
G1 X143.318 Y157.583
G1 X139.892 Y154.156 E.14889
G1 X139.483 Y154.282
G1 X142.785 Y157.583 E.14345
G1 X142.251 Y157.583
G1 X139.075 Y154.407 E.13801
G1 X138.667 Y154.532
G1 X141.718 Y157.583 E.13257
G1 X141.185 Y157.583
G1 X138.248 Y154.646 E.12763
G1 X137.822 Y154.753
G1 X140.651 Y157.583 E.12295
G1 X140.118 Y157.583
G1 X137.397 Y154.861 E.11826
G1 X136.966 Y154.963
G1 X139.585 Y157.583 E.11382
G1 X139.052 Y157.583
G1 X136.522 Y155.053 E.10994
G1 X136.078 Y155.142
G1 X138.518 Y157.583 E.10606
G1 X137.985 Y157.583
G1 X135.633 Y155.231 E.10221
G1 X135.169 Y155.3
G1 X137.452 Y157.583 E.09918
G1 X136.919 Y157.583
G1 X134.706 Y155.37 E.09616
G1 X134.242 Y155.439
G1 X136.385 Y157.583 E.09314
G1 X135.852 Y157.583
G1 X133.759 Y155.49 E.09093
G1 X133.274 Y155.538
G1 X135.319 Y157.583 E.08883
G1 X134.785 Y157.583
G1 X132.789 Y155.587 E.08674
G1 X132.285 Y155.615
G1 X134.252 Y157.583 E.08549
G1 X133.719 Y157.583
G1 X131.777 Y155.641 E.08439
G1 X131.269 Y155.666
G1 X133.186 Y157.583 E.08329
G1 X132.652 Y157.583
G1 X130.737 Y155.667 E.08323
G1 X130.204 Y155.667
G1 X132.119 Y157.583 E.08323
G1 X131.586 Y157.583
G1 X129.666 Y155.663 E.08344
G1 X129.105 Y155.635
G1 X131.053 Y157.583 E.08465
G1 X130.519 Y157.583
G1 X128.544 Y155.607 E.08586
G1 X127.966 Y155.562
G1 X129.986 Y157.583 E.0878
G1 X129.453 Y157.583
G1 X127.373 Y155.503 E.09036
G1 X126.779 Y155.442
G1 X128.92 Y157.583 E.09301
G1 X128.386 Y157.583
G1 X126.152 Y155.348 E.09709
G1 X125.525 Y155.254
G1 X127.853 Y157.583 E.10117
G1 X127.32 Y157.583
G1 X124.868 Y155.131 E.10653
G1 X124.201 Y154.997
G1 X126.786 Y157.583 E.11236
G1 X126.253 Y157.583
G1 X123.507 Y154.837 E.11933
G1 X122.793 Y154.656
G1 X125.72 Y157.583 E.12717
G1 X125.187 Y157.583
G1 X122.049 Y154.445 E.13636
G1 X121.28 Y154.209
G1 X124.653 Y157.583 E.1466
G1 X124.12 Y157.583
G1 X120.463 Y153.925 E.15892
G1 X119.623 Y153.619
G1 X123.587 Y157.583 E.17226
G1 X123.054 Y157.583
G1 X118.705 Y153.235 E.18894
G1 X117.728 Y152.79
G1 X122.52 Y157.583 E.20825
G1 X121.987 Y157.583
G1 X116.668 Y152.264 E.23112
M204 S10000
; WIPE_START
G1 F24000
G1 X118.082 Y153.678 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.757 J-.952 P1  F30000
G1 X115.478 Y151.607 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X121.454 Y157.583 E.25969
G1 X120.92 Y157.583
G1 X114.058 Y150.72 E.29821
M204 S10000
; WIPE_START
G1 F24000
G1 X115.472 Y152.134 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.782 J-.933 P1  F30000
G1 X112.173 Y149.368 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X120.387 Y157.583 E.35696
M204 S10000
; WIPE_START
G1 F24000
G1 X118.973 Y156.168 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.959 J-.749 P1  F30000
G1 X101.936 Y134.332 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X100.984 Y133.38 E.04137
G1 X100.45 Y133.38
G1 X102.171 Y135.1 E.07477
G1 X102.451 Y135.914
G1 X99.917 Y133.38 E.11013
G1 X99.384 Y133.38
G1 X102.774 Y136.77 E.1473
G1 X103.132 Y137.661
G1 X98.851 Y133.38 E.18602
G1 X98.317 Y133.38
G1 X103.585 Y138.648 E.22892
G1 X104.122 Y139.717
G1 X97.784 Y133.38 E.27539
G1 X97.251 Y133.38
G1 X104.785 Y140.914 E.32738
M204 S10000
; WIPE_START
G1 F24000
G1 X103.371 Y139.499 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.945 J.767 P1  F30000
G1 X105.664 Y142.326 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X96.718 Y133.38 E.38874
G1 X96.185 Y133.38
G1 X107.019 Y144.215 E.47082
M204 S10000
; WIPE_START
G1 F24000
G1 X105.605 Y142.801 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.837 J-.884 P1  F30000
G1 X95.651 Y133.38 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X119.854 Y157.583 E1.05171
G1 X119.321 Y157.583
G1 X95.118 Y133.38 E1.05171
G1 X94.585 Y133.38
G1 X118.787 Y157.583 E1.05171
G1 X118.254 Y157.583
G1 X94.052 Y133.38 E1.0517
G1 X93.519 Y133.38
G1 X117.721 Y157.583 E1.0517
G1 X117.188 Y157.583
G1 X92.985 Y133.381 E1.0517
G1 X92.452 Y133.381
G1 X116.654 Y157.583 E1.0517
G1 X116.121 Y157.583
G1 X91.919 Y133.381 E1.05169
G1 X91.386 Y133.381
G1 X115.588 Y157.583 E1.05169
G1 X115.054 Y157.583
G1 X90.853 Y133.381 E1.05169
G1 X90.319 Y133.381
G1 X114.521 Y157.583 E1.05168
G1 X113.988 Y157.583
G1 X64.145 Y107.739 E2.16593
G1 X64.145 Y108.273
G1 X113.455 Y157.583 E2.14276
G1 X112.921 Y157.583
G1 X64.145 Y108.806 E2.11959
G1 X64.145 Y109.339
G1 X112.388 Y157.583 E2.09641
G1 X111.855 Y157.583
G1 X64.145 Y109.872 E2.07324
G1 X64.145 Y110.406
G1 X111.322 Y157.583 E2.05007
G1 X110.788 Y157.583
G1 X64.145 Y110.939 E2.02689
G1 X64.145 Y111.472
G1 X110.255 Y157.583 E2.00372
G1 X109.722 Y157.583
G1 X64.145 Y112.005 E1.98055
G1 X64.145 Y112.539
G1 X109.189 Y157.583 E1.95737
G1 X108.655 Y157.583
G1 X64.145 Y113.072 E1.9342
G1 X64.145 Y113.605
G1 X108.122 Y157.583 E1.91103
G1 X107.589 Y157.583
G1 X64.145 Y114.139 E1.88786
G1 X64.145 Y114.672
G1 X107.055 Y157.583 E1.86468
G1 X106.522 Y157.583
G1 X64.145 Y115.205 E1.84151
G1 X64.145 Y115.738
G1 X105.989 Y157.583 E1.81834
G1 X105.456 Y157.583
G1 X64.145 Y116.272 E1.79516
G1 X64.145 Y116.805
G1 X104.922 Y157.583 E1.77199
G1 X104.389 Y157.583
G1 X64.145 Y117.338 E1.74882
M73 P74 R11
G1 X64.145 Y117.871
G1 X103.856 Y157.583 E1.72564
G1 X103.323 Y157.583
G1 X64.145 Y118.405 E1.70247
G1 X64.145 Y118.938
G1 X102.789 Y157.583 E1.6793
G1 X102.256 Y157.583
G1 X64.145 Y119.471 E1.65612
G1 X64.145 Y120.005
G1 X101.723 Y157.583 E1.63295
G1 X101.189 Y157.583
G1 X64.145 Y120.538 E1.60978
G1 X64.145 Y121.071
G1 X100.656 Y157.583 E1.5866
G1 X100.123 Y157.583
G1 X64.145 Y121.604 E1.56343
G1 X64.145 Y122.138
G1 X99.59 Y157.583 E1.54026
G1 X99.056 Y157.583
G1 X64.145 Y122.671 E1.51708
G1 X64.145 Y123.204
G1 X98.523 Y157.583 E1.49391
M73 P75 R11
G1 X97.99 Y157.583
G1 X64.145 Y123.737 E1.47074
G1 X64.145 Y124.271
G1 X97.457 Y157.583 E1.44756
G1 X96.923 Y157.583
G1 X64.145 Y124.804 E1.42439
G1 X64.145 Y125.337
G1 X96.39 Y157.583 E1.40122
G1 X95.857 Y157.583
G1 X64.145 Y125.87 E1.37805
G1 X64.145 Y126.404
G1 X95.323 Y157.583 E1.35487
G1 X94.79 Y157.583
G1 X64.145 Y126.937 E1.3317
G1 X64.145 Y127.47
G1 X94.257 Y157.583 E1.30853
G1 X93.724 Y157.583
G1 X64.145 Y128.004 E1.28535
G1 X64.145 Y128.537
G1 X93.19 Y157.583 E1.26218
G1 X92.657 Y157.583
G1 X64.145 Y129.07 E1.23901
G1 X64.145 Y129.603
G1 X92.124 Y157.583 E1.21583
G1 X91.591 Y157.583
G1 X64.145 Y130.137 E1.19266
G1 X64.145 Y130.67
G1 X91.057 Y157.583 E1.16949
G1 X90.524 Y157.583
G1 X64.086 Y131.145 E1.14886
G1 X63.553 Y131.145
G1 X89.991 Y157.583 E1.14886
G1 X89.458 Y157.583
G1 X63.02 Y131.145 E1.14886
G1 X62.486 Y131.145
G1 X88.924 Y157.583 E1.14886
G1 X88.391 Y157.583
G1 X61.953 Y131.145 E1.14886
G1 X61.42 Y131.145
G1 X87.858 Y157.583 E1.14886
G1 X87.324 Y157.583
G1 X60.886 Y131.145 E1.14886
G1 X60.353 Y131.145
G1 X86.791 Y157.583 E1.14886
G1 X86.258 Y157.583
G1 X59.82 Y131.145 E1.14886
G1 X59.287 Y131.145
G1 X85.725 Y157.583 E1.14886
G1 X85.191 Y157.583
G1 X58.753 Y131.145 E1.14886
G1 X58.22 Y131.145
G1 X84.658 Y157.583 E1.14886
G1 X84.125 Y157.583
G1 X57.687 Y131.145 E1.14886
G1 X57.154 Y131.145
G1 X83.592 Y157.583 E1.14886
G1 X83.058 Y157.583
G1 X56.62 Y131.145 E1.14886
G1 X56.087 Y131.145
G1 X82.525 Y157.583 E1.14886
G1 X81.992 Y157.583
G1 X55.554 Y131.145 E1.14886
G1 X55.417 Y131.542
G1 X81.458 Y157.583 E1.13161
G1 X80.925 Y157.583
G1 X55.417 Y132.075 E1.10844
G1 X55.417 Y132.608
G1 X80.392 Y157.583 E1.08526
G1 X79.859 Y157.583
G1 X55.417 Y133.141 E1.06209
G1 X55.417 Y133.675
G1 X79.325 Y157.583 E1.03892
G1 X78.792 Y157.583
G1 X55.417 Y134.208 E1.01574
G1 X55.417 Y134.741
G1 X78.259 Y157.583 E.99257
G1 X77.726 Y157.583
G1 X55.417 Y135.274 E.9694
G1 X55.417 Y135.808
G1 X77.192 Y157.583 E.94622
G1 X76.659 Y157.583
G1 X55.417 Y136.341 E.92305
G1 X55.417 Y136.874
G1 X76.126 Y157.583 E.89988
G1 X75.592 Y157.583
G1 X55.417 Y137.408 E.87671
G1 X55.417 Y137.941
G1 X75.059 Y157.583 E.85353
G1 X74.526 Y157.583
G1 X55.417 Y138.474 E.83036
G1 X55.417 Y139.007
G1 X73.993 Y157.583 E.80719
G1 X73.459 Y157.583
G1 X55.417 Y139.541 E.78401
G1 X55.417 Y140.074
G1 X72.926 Y157.583 E.76084
G1 X72.393 Y157.583
G1 X55.417 Y140.607 E.73767
G1 X55.417 Y141.14
G1 X71.86 Y157.583 E.71449
G1 X71.326 Y157.583
G1 X55.417 Y141.674 E.69132
G1 X55.417 Y142.207
G1 X70.793 Y157.583 E.66815
G1 X70.26 Y157.583
G1 X55.417 Y142.74 E.64497
G1 X55.417 Y143.273
G1 X69.727 Y157.583 E.6218
G1 X69.193 Y157.583
G1 X55.417 Y143.807 E.59863
G1 X55.417 Y144.34
G1 X68.66 Y157.583 E.57545
G1 X68.127 Y157.583
G1 X55.417 Y144.873 E.55228
G1 X55.417 Y145.407
G1 X67.593 Y157.583 E.52911
G1 X67.06 Y157.583
G1 X55.417 Y145.94 E.50593
G1 X55.417 Y146.473
G1 X66.527 Y157.583 E.48276
G1 X65.994 Y157.583
G1 X55.417 Y147.006 E.45959
G1 X55.417 Y147.54
G1 X65.46 Y157.583 E.43641
G1 X64.927 Y157.583
G1 X55.417 Y148.073 E.41324
G1 X55.417 Y148.606
G1 X64.394 Y157.583 E.39007
G1 X63.861 Y157.583
G1 X55.417 Y149.139 E.3669
G1 X55.417 Y149.673
G1 X63.327 Y157.583 E.34372
G1 X62.794 Y157.583
G1 X55.417 Y150.206 E.32055
G1 X55.417 Y150.739
G1 X62.261 Y157.583 E.29738
G1 X61.727 Y157.583
G1 X55.417 Y151.273 E.2742
G1 X55.417 Y151.806
G1 X61.194 Y157.583 E.25103
G1 X60.661 Y157.583
G1 X55.417 Y152.339 E.22786
G1 X55.417 Y152.872
G1 X60.128 Y157.583 E.20468
G1 X59.574 Y157.562
G1 X55.438 Y153.426 E.17973
G1 X55.544 Y154.066
G1 X58.934 Y157.456 E.14732
G1 X58.125 Y157.18
G1 X55.82 Y154.875 E.10017
M204 S10000
G1 X55.882 Y154.813 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.212795
G1 F15000
G1 X55.653 Y154.478 E.00562
; WIPE_START
G1 F24000
G1 X55.882 Y154.813 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.215 J.07 P1  F30000
G1 X59.143 Y98.496 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.0881722
G1 F15000
G1 X58.984 Y98.579 E.00066
; WIPE_START
G1 F24000
G1 X59.143 Y98.496 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.017 J1.217 P1  F30000
G1 X203.816 Y100.465 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X203.663 Y100.283 E.00088
; LINE_WIDTH: 0.157042
G2 X202.717 Y99.337 I-7.68 J6.734 E.01245
; LINE_WIDTH: 0.125066
G1 X202.535 Y99.184 E.00159
; WIPE_START
G1 F24000
G1 X202.717 Y99.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.975 J.728 P1  F30000
G1 X204.347 Y101.522 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.207492
G1 F15000
G1 X204.118 Y101.187 E.00544
; WIPE_START
G1 F24000
G1 X204.347 Y101.522 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.215 J-.063 P1  F30000
M73 P76 R11
G1 X201.44 Y157.312 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.0961028
G1 F15000
G1 X201.295 Y157.397 E.00073
; WIPE_START
G1 F24000
G1 X201.44 Y157.312 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.004 J-1.217 P1  F30000
G1 X57.465 Y156.815 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.0881697
G1 F15000
G1 X57.283 Y156.663 E.00087
; LINE_WIDTH: 0.156942
G3 X56.337 Y155.717 I6.734 J-7.68 E.01244
; LINE_WIDTH: 0.124962
G1 X56.184 Y155.535 E.00158
; WIPE_START
G1 F24000
G1 X56.337 Y155.717 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.004 J1.217 P1  F30000
G1 X134.22 Y155.439 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.0951073
G1 F15000
G1 X134.056 Y155.52 E.00078
; WIPE_START
G1 F24000
G1 X134.22 Y155.439 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.109 J-1.212 P1  F30000
G1 X121.214 Y154.274 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.150277
G1 F15000
G1 X120.917 Y154.09 E.00306
; WIPE_START
G1 F24000
G1 X121.214 Y154.274 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.411 J-1.145 P1  F30000
G1 X119.56 Y153.681 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.210679
G1 F15000
G1 X119.443 Y153.602 E.00194
; LINE_WIDTH: 0.169843
G1 X119.325 Y153.523 E.00147
; LINE_WIDTH: 0.129007
G1 X119.207 Y153.444 E.00099
; WIPE_START
G1 F24000
G1 X119.325 Y153.523 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.456 J-1.128 P1  F30000
G1 X117.666 Y152.852 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.215713
G1 F15000
G1 X117.533 Y152.758 E.00229
; LINE_WIDTH: 0.173199
G1 X117.401 Y152.664 E.00173
; LINE_WIDTH: 0.130684
G1 X117.268 Y152.57 E.00116
G1 X116.607 Y152.325 F30000
; LINE_WIDTH: 0.220737
G1 F15000
G1 X116.454 Y152.211 E.00276
; LINE_WIDTH: 0.176548
G1 X116.302 Y152.097 E.00207
; LINE_WIDTH: 0.132359
G1 X116.149 Y151.984 E.00139
G1 X115.417 Y151.667 F30000
; LINE_WIDTH: 0.225757
G1 F15000
G1 X115.236 Y151.526 E.00342
; LINE_WIDTH: 0.179895
G1 X115.056 Y151.384 E.00256
; LINE_WIDTH: 0.134032
G1 X114.875 Y151.242 E.0017
G1 X113.997 Y150.781 F30000
; LINE_WIDTH: 0.230782
G1 F15000
G1 X113.775 Y150.597 E.00442
; LINE_WIDTH: 0.183245
G1 X113.552 Y150.413 E.0033
; LINE_WIDTH: 0.135708
G1 X113.33 Y150.229 E.00218
; WIPE_START
G1 F24000
G1 X113.552 Y150.413 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.687 J-1.004 P1  F30000
G1 X112.112 Y149.428 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.235532
G1 F15000
G1 X111.974 Y149.308 E.00288
; LINE_WIDTH: 0.22366
G1 X111.61 Y148.976 E.00725
; LINE_WIDTH: 0.178575
G1 X111.246 Y148.644 E.00544
; LINE_WIDTH: 0.131097
G1 X110.863 Y148.293 E.00374
; WIPE_START
G1 F24000
G1 X111.246 Y148.644 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.856 J-.865 P1  F30000
G1 X108.181 Y145.612 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.0882765
G1 F15000
G1 X107.762 Y145.169 E.00226
; LINE_WIDTH: 0.121746
G1 X107.477 Y144.851 E.00274
; LINE_WIDTH: 0.167269
G1 X107.218 Y144.563 E.00392
; LINE_WIDTH: 0.203303
G1 X106.959 Y144.275 E.00506
; WIPE_START
G1 F24000
G1 X107.218 Y144.563 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.995 J-.701 P1  F30000
G1 X106.158 Y143.057 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.0884873
G1 F15000
G1 X105.961 Y142.827 E.00112
; LINE_WIDTH: 0.131915
G1 X105.782 Y142.607 E.00206
; LINE_WIDTH: 0.180587
G1 X105.603 Y142.387 E.00318
; WIPE_START
G1 F24000
G1 X105.782 Y142.607 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.047 J-.62 P1  F30000
G1 X105.12 Y141.488 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X104.988 Y141.317 E.0008
; LINE_WIDTH: 0.133525
G1 X104.856 Y141.146 E.0016
; LINE_WIDTH: 0.178881
G1 X104.724 Y140.975 E.00239
G1 X104.382 Y140.217 F30000
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X104.274 Y140.071 E.00067
; LINE_WIDTH: 0.131852
G1 X104.167 Y139.925 E.00131
; LINE_WIDTH: 0.175535
G1 X104.06 Y139.779 E.00196
; WIPE_START
G1 F24000
G1 X104.167 Y139.925 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.107 J-.506 P1  F30000
G1 X103.336 Y138.106 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.0881681
G1 F15000
G1 X103.272 Y138.013 E.00042
; LINE_WIDTH: 0.125474
G1 X103.207 Y137.92 E.00076
; LINE_WIDTH: 0.162781
G1 X103.142 Y137.827 E.00111
; LINE_WIDTH: 0.200085
G1 X103.07 Y137.723 E.00163
; WIPE_START
G1 F24000
G1 X103.142 Y137.827 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.388 J-1.154 P1  F30000
G1 X90.217 Y133.484 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.129141
G1 F15000
G1 X90.016 Y133.283 E.00199
; WIPE_START
G1 F24000
G1 X90.217 Y133.484 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.944 J.769 P1  F30000
G1 X116.881 Y100.749 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.163195
G1 F15000
G1 X116.923 Y100.616 E.00136
G1 X116.884 Y100.577 E.00054
G1 X116.751 Y100.619 E.00136
; WIPE_START
G1 F24000
G1 X116.884 Y100.577 E-.31759
G1 X116.923 Y100.616 E-.12485
G1 X116.881 Y100.749 E-.31756
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.086 J1.214 P1  F30000
G1 X169.98 Y104.52 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.140725
G1 F15000
G2 X169.882 Y104.687 I.069 J.152 E.00164
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X169.897 Y104.603 E-.31854
G1 X169.98 Y104.52 E-.44146
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/105
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
G3 Z7.4 I-.099 J1.213 P1  F30000
G1 X195.602 Y106.602 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3761
G1 X204.398 Y106.602 E.29177
G1 X204.398 Y131.398 E.82252
G1 X195.602 Y131.398 E.29177
G1 X195.602 Y106.662 E.82053
G1 X195.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3761
G1 X204.79 Y106.21 E.29437
G1 X204.79 Y131.79 E.786
G1 X195.21 Y131.79 E.29437
G1 X195.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-1.215 J-.066 P1  F30000
G1 X195.95 Y129.505 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3761
G1 X195.95 Y131.05 E.05124
G1 X196.034 Y131.05 E.00278
G1 X204.05 Y123.034 E.37603
G1 X204.05 Y125.29 E.07483
G1 X195.95 Y117.191 E.37996
G1 X195.95 Y115.781 E.04675
G1 X204.05 Y107.682 E.37996
G1 X204.05 Y109.938 E.07483
G1 X201.062 Y106.95 E.14016
G1 X197.105 Y106.95 E.13124
G1 X195.95 Y108.105 E.05419
G1 X195.95 Y109.515 E.04675
G1 X204.05 Y117.614 E.37996
G1 X204.05 Y115.358 E.07483
G1 X195.95 Y123.457 E.37996
G1 X195.95 Y124.867 E.04675
G1 X202.133 Y131.05 E.29006
G1 X203.71 Y131.05 E.0523
G1 X204.05 Y130.71 E.01593
G1 X204.05 Y129.082 E.05401
; WIPE_START
G1 F24000
G1 X204.05 Y130.71 E-.61876
G1 X203.787 Y130.973 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I.21 J-1.199 P1  F30000
G1 X64.398 Y106.602 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3761
G1 X64.398 Y131.398 E.82252
G1 X55.602 Y131.398 E.29177
G1 X55.602 Y106.602 E.82252
G1 X64.338 Y106.602 E.28978
G1 X64.79 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3761
G1 X64.79 Y131.79 E.786
G1 X55.21 Y131.79 E.29437
G1 X55.21 Y106.21 E.786
G1 X64.73 Y106.21 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.735 Y108.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-1.216 J-.039 P1  F30000
G1 X64.05 Y129.505 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3761
G1 X64.05 Y131.05 E.05124
G1 X63.966 Y131.05 E.00278
G1 X55.95 Y123.034 E.37603
G1 X55.95 Y125.29 E.07483
G1 X64.05 Y117.191 E.37996
G1 X64.05 Y115.781 E.04675
G1 X55.95 Y107.682 E.37996
G1 X55.95 Y109.938 E.07483
G1 X58.938 Y106.95 E.14016
G1 X62.895 Y106.95 E.13124
G1 X64.05 Y108.105 E.05419
G1 X64.05 Y109.515 E.04675
G1 X55.95 Y117.614 E.37996
G1 X55.95 Y115.358 E.07483
G1 X64.05 Y123.457 E.37996
G1 X64.05 Y124.867 E.04675
G1 X57.867 Y131.05 E.29006
G1 X56.29 Y131.05 E.0523
G1 X55.95 Y130.71 E.01593
G1 X55.95 Y129.082 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X55.95 Y130.71 E-.61876
G1 X56.213 Y130.973 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/105
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
G3 Z7.6 I.21 J1.199 P1  F30000
G1 X195.602 Y106.602 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3886
G1 X204.398 Y106.602 E.29177
G1 X204.398 Y131.398 E.82252
G1 X195.602 Y131.398 E.29177
G1 X195.602 Y106.662 E.82053
G1 X195.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3886
G1 X204.79 Y106.21 E.29437
G1 X204.79 Y131.79 E.786
G1 X195.21 Y131.79 E.29437
G1 X195.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.215 J-.066 P1  F30000
G1 X195.95 Y129.505 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3886
G1 X195.95 Y131.05 E.05124
G1 X196.034 Y131.05 E.00278
G1 X204.05 Y123.034 E.37603
G1 X204.05 Y125.29 E.07483
G1 X195.95 Y117.191 E.37996
G1 X195.95 Y115.781 E.04675
G1 X204.05 Y107.682 E.37996
G1 X204.05 Y109.938 E.07483
G1 X201.062 Y106.95 E.14016
G1 X197.105 Y106.95 E.13124
G1 X195.95 Y108.105 E.05419
G1 X195.95 Y109.515 E.04675
G1 X204.05 Y117.614 E.37996
G1 X204.05 Y115.358 E.07483
G1 X195.95 Y123.457 E.37996
G1 X195.95 Y124.867 E.04675
G1 X202.133 Y131.05 E.29006
G1 X203.71 Y131.05 E.0523
G1 X204.05 Y130.71 E.01593
G1 X204.05 Y129.082 E.05401
; WIPE_START
G1 F24000
G1 X204.05 Y130.71 E-.61876
G1 X203.787 Y130.973 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I.21 J-1.199 P1  F30000
G1 X64.398 Y106.602 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3886
G1 X64.398 Y131.398 E.82252
G1 X55.602 Y131.398 E.29177
G1 X55.602 Y106.602 E.82252
G1 X64.338 Y106.602 E.28978
G1 X64.79 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3886
G1 X64.79 Y131.79 E.786
G1 X55.21 Y131.79 E.29437
G1 X55.21 Y106.21 E.786
G1 X64.73 Y106.21 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.735 Y108.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.216 J-.039 P1  F30000
G1 X64.05 Y129.505 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3886
G1 X64.05 Y131.05 E.05124
G1 X63.966 Y131.05 E.00278
G1 X55.95 Y123.034 E.37603
G1 X55.95 Y125.29 E.07483
G1 X64.05 Y117.191 E.37996
G1 X64.05 Y115.781 E.04675
G1 X55.95 Y107.682 E.37996
G1 X55.95 Y109.938 E.07483
G1 X58.938 Y106.95 E.14016
G1 X62.895 Y106.95 E.13124
G1 X64.05 Y108.105 E.05419
G1 X64.05 Y109.515 E.04675
G1 X55.95 Y117.614 E.37996
G1 X55.95 Y115.358 E.07483
G1 X64.05 Y123.457 E.37996
G1 X64.05 Y124.867 E.04675
G1 X57.867 Y131.05 E.29006
G1 X56.29 Y131.05 E.0523
G1 X55.95 Y130.71 E.01593
G1 X55.95 Y129.082 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X55.95 Y130.71 E-.61876
G1 X56.213 Y130.973 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/105
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
G3 Z7.8 I.21 J1.199 P1  F30000
G1 X195.602 Y106.602 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3886
G1 X204.398 Y106.602 E.29177
G1 X204.398 Y131.398 E.82252
G1 X195.602 Y131.398 E.29177
G1 X195.602 Y106.662 E.82053
G1 X195.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3886
G1 X204.79 Y106.21 E.29437
G1 X204.79 Y131.79 E.786
G1 X195.21 Y131.79 E.29437
G1 X195.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.215 J-.066 P1  F30000
G1 X195.95 Y129.505 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3886
G1 X195.95 Y131.05 E.05124
G1 X196.034 Y131.05 E.00278
G1 X204.05 Y123.034 E.37603
G1 X204.05 Y125.29 E.07483
G1 X195.95 Y117.191 E.37996
G1 X195.95 Y115.781 E.04675
G1 X204.05 Y107.682 E.37996
G1 X204.05 Y109.938 E.07483
G1 X201.062 Y106.95 E.14016
G1 X197.105 Y106.95 E.13124
G1 X195.95 Y108.105 E.05419
G1 X195.95 Y109.515 E.04675
G1 X204.05 Y117.614 E.37996
G1 X204.05 Y115.358 E.07483
G1 X195.95 Y123.457 E.37996
G1 X195.95 Y124.867 E.04675
G1 X202.133 Y131.05 E.29006
G1 X203.71 Y131.05 E.0523
G1 X204.05 Y130.71 E.01593
G1 X204.05 Y129.082 E.05401
; WIPE_START
G1 F24000
G1 X204.05 Y130.71 E-.61876
G1 X203.787 Y130.973 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I.21 J-1.199 P1  F30000
G1 X64.398 Y106.602 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3886
G1 X64.398 Y131.398 E.82252
G1 X55.602 Y131.398 E.29177
G1 X55.602 Y106.602 E.82252
G1 X64.338 Y106.602 E.28978
G1 X64.79 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3886
G1 X64.79 Y131.79 E.786
G1 X55.21 Y131.79 E.29437
G1 X55.21 Y106.21 E.786
G1 X64.73 Y106.21 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.735 Y108.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.216 J-.039 P1  F30000
G1 X64.05 Y129.505 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3886
G1 X64.05 Y131.05 E.05124
G1 X63.966 Y131.05 E.00278
G1 X55.95 Y123.034 E.37603
G1 X55.95 Y125.29 E.07483
G1 X64.05 Y117.191 E.37996
G1 X64.05 Y115.781 E.04675
G1 X55.95 Y107.682 E.37996
G1 X55.95 Y109.938 E.07483
G1 X58.938 Y106.95 E.14016
G1 X62.895 Y106.95 E.13124
G1 X64.05 Y108.105 E.05419
G1 X64.05 Y109.515 E.04675
G1 X55.95 Y117.614 E.37996
M73 P76 R10
G1 X55.95 Y115.358 E.07483
G1 X64.05 Y123.457 E.37996
G1 X64.05 Y124.867 E.04675
G1 X57.867 Y131.05 E.29006
G1 X56.29 Y131.05 E.0523
G1 X55.95 Y130.71 E.01593
G1 X55.95 Y129.082 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X55.95 Y130.71 E-.61876
G1 X56.213 Y130.973 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/105
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
G3 Z8 I.21 J1.199 P1  F30000
G1 X195.602 Y106.602 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3886
G1 X204.398 Y106.602 E.29177
G1 X204.398 Y131.398 E.82252
M73 P77 R10
G1 X195.602 Y131.398 E.29177
G1 X195.602 Y106.662 E.82053
G1 X195.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3886
G1 X204.79 Y106.21 E.29437
G1 X204.79 Y131.79 E.786
G1 X195.21 Y131.79 E.29437
G1 X195.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.215 J-.066 P1  F30000
G1 X195.95 Y129.505 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3886
G1 X195.95 Y131.05 E.05124
G1 X196.034 Y131.05 E.00278
G1 X204.05 Y123.034 E.37603
G1 X204.05 Y125.29 E.07483
G1 X195.95 Y117.191 E.37996
G1 X195.95 Y115.781 E.04675
G1 X204.05 Y107.682 E.37996
G1 X204.05 Y109.938 E.07483
G1 X201.062 Y106.95 E.14016
G1 X197.105 Y106.95 E.13124
G1 X195.95 Y108.105 E.05419
G1 X195.95 Y109.515 E.04675
G1 X204.05 Y117.614 E.37996
G1 X204.05 Y115.358 E.07483
G1 X195.95 Y123.457 E.37996
G1 X195.95 Y124.867 E.04675
G1 X202.133 Y131.05 E.29006
G1 X203.71 Y131.05 E.0523
G1 X204.05 Y130.71 E.01593
G1 X204.05 Y129.082 E.05401
; WIPE_START
G1 F24000
G1 X204.05 Y130.71 E-.61876
G1 X203.787 Y130.973 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I.21 J-1.199 P1  F30000
G1 X64.398 Y106.602 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3886
G1 X64.398 Y131.398 E.82252
G1 X55.602 Y131.398 E.29177
G1 X55.602 Y106.602 E.82252
G1 X64.338 Y106.602 E.28978
G1 X64.79 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3886
G1 X64.79 Y131.79 E.786
G1 X55.21 Y131.79 E.29437
G1 X55.21 Y106.21 E.786
G1 X64.73 Y106.21 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.735 Y108.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.216 J-.039 P1  F30000
G1 X64.05 Y129.505 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3886
G1 X64.05 Y131.05 E.05124
G1 X63.966 Y131.05 E.00278
G1 X55.95 Y123.034 E.37603
G1 X55.95 Y125.29 E.07483
G1 X64.05 Y117.191 E.37996
G1 X64.05 Y115.781 E.04675
G1 X55.95 Y107.682 E.37996
G1 X55.95 Y109.938 E.07483
G1 X58.938 Y106.95 E.14016
G1 X62.895 Y106.95 E.13124
G1 X64.05 Y108.105 E.05419
G1 X64.05 Y109.515 E.04675
G1 X55.95 Y117.614 E.37996
G1 X55.95 Y115.358 E.07483
G1 X64.05 Y123.457 E.37996
G1 X64.05 Y124.867 E.04675
G1 X57.867 Y131.05 E.29006
G1 X56.29 Y131.05 E.0523
G1 X55.95 Y130.71 E.01593
G1 X55.95 Y129.082 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X55.95 Y130.71 E-.61876
G1 X56.213 Y130.973 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/105
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
G3 Z8.2 I.21 J1.199 P1  F30000
G1 X195.602 Y106.602 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3886
G1 X204.398 Y106.602 E.29177
G1 X204.398 Y131.398 E.82252
G1 X195.602 Y131.398 E.29177
G1 X195.602 Y106.662 E.82053
G1 X195.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3886
G1 X204.79 Y106.21 E.29437
G1 X204.79 Y131.79 E.786
G1 X195.21 Y131.79 E.29437
G1 X195.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.215 J-.066 P1  F30000
G1 X195.95 Y129.505 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3886
G1 X195.95 Y131.05 E.05124
G1 X196.034 Y131.05 E.00278
G1 X204.05 Y123.034 E.37603
G1 X204.05 Y125.29 E.07483
G1 X195.95 Y117.191 E.37996
G1 X195.95 Y115.781 E.04675
G1 X204.05 Y107.682 E.37996
G1 X204.05 Y109.938 E.07483
G1 X201.062 Y106.95 E.14016
G1 X197.105 Y106.95 E.13124
G1 X195.95 Y108.105 E.05419
G1 X195.95 Y109.515 E.04675
G1 X204.05 Y117.614 E.37996
G1 X204.05 Y115.358 E.07483
G1 X195.95 Y123.457 E.37996
G1 X195.95 Y124.867 E.04675
G1 X202.133 Y131.05 E.29006
G1 X203.71 Y131.05 E.0523
G1 X204.05 Y130.71 E.01593
G1 X204.05 Y129.082 E.05401
; WIPE_START
G1 F24000
G1 X204.05 Y130.71 E-.61876
G1 X203.787 Y130.973 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I.21 J-1.199 P1  F30000
G1 X64.398 Y106.602 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3886
G1 X64.398 Y131.398 E.82252
G1 X55.602 Y131.398 E.29177
G1 X55.602 Y106.602 E.82252
G1 X64.338 Y106.602 E.28978
G1 X64.79 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3886
G1 X64.79 Y131.79 E.786
G1 X55.21 Y131.79 E.29437
G1 X55.21 Y106.21 E.786
G1 X64.73 Y106.21 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.735 Y108.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.216 J-.039 P1  F30000
G1 X64.05 Y129.505 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3886
G1 X64.05 Y131.05 E.05124
G1 X63.966 Y131.05 E.00278
G1 X55.95 Y123.034 E.37603
G1 X55.95 Y125.29 E.07483
G1 X64.05 Y117.191 E.37996
G1 X64.05 Y115.781 E.04675
G1 X55.95 Y107.682 E.37996
G1 X55.95 Y109.938 E.07483
G1 X58.938 Y106.95 E.14016
G1 X62.895 Y106.95 E.13124
G1 X64.05 Y108.105 E.05419
G1 X64.05 Y109.515 E.04675
G1 X55.95 Y117.614 E.37996
G1 X55.95 Y115.358 E.07483
G1 X64.05 Y123.457 E.37996
G1 X64.05 Y124.867 E.04675
G1 X57.867 Y131.05 E.29006
G1 X56.29 Y131.05 E.0523
G1 X55.95 Y130.71 E.01593
G1 X55.95 Y129.082 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X55.95 Y130.71 E-.61876
G1 X56.213 Y130.973 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/105
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
G3 Z8.4 I.21 J1.199 P1  F30000
G1 X195.602 Y106.602 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3886
G1 X204.398 Y106.602 E.29177
G1 X204.398 Y131.398 E.82252
G1 X195.602 Y131.398 E.29177
G1 X195.602 Y106.662 E.82053
G1 X195.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3886
G1 X204.79 Y106.21 E.29437
G1 X204.79 Y131.79 E.786
G1 X195.21 Y131.79 E.29437
G1 X195.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.215 J-.066 P1  F30000
G1 X195.95 Y129.505 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3886
G1 X195.95 Y131.05 E.05124
G1 X196.034 Y131.05 E.00278
G1 X204.05 Y123.034 E.37603
G1 X204.05 Y125.29 E.07483
G1 X195.95 Y117.191 E.37996
G1 X195.95 Y115.781 E.04675
G1 X204.05 Y107.682 E.37996
G1 X204.05 Y109.938 E.07483
G1 X201.062 Y106.95 E.14016
G1 X197.105 Y106.95 E.13124
G1 X195.95 Y108.105 E.05419
G1 X195.95 Y109.515 E.04675
G1 X204.05 Y117.614 E.37996
G1 X204.05 Y115.358 E.07483
G1 X195.95 Y123.457 E.37996
G1 X195.95 Y124.867 E.04675
G1 X202.133 Y131.05 E.29006
G1 X203.71 Y131.05 E.0523
G1 X204.05 Y130.71 E.01593
G1 X204.05 Y129.082 E.05401
; WIPE_START
G1 F24000
G1 X204.05 Y130.71 E-.61876
G1 X203.787 Y130.973 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I.21 J-1.199 P1  F30000
G1 X64.398 Y106.602 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3886
G1 X64.398 Y131.398 E.82252
G1 X55.602 Y131.398 E.29177
G1 X55.602 Y106.602 E.82252
G1 X64.338 Y106.602 E.28978
G1 X64.79 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3886
G1 X64.79 Y131.79 E.786
G1 X55.21 Y131.79 E.29437
G1 X55.21 Y106.21 E.786
G1 X64.73 Y106.21 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.735 Y108.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.216 J-.039 P1  F30000
G1 X64.05 Y129.505 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3886
G1 X64.05 Y131.05 E.05124
G1 X63.966 Y131.05 E.00278
G1 X55.95 Y123.034 E.37603
G1 X55.95 Y125.29 E.07483
G1 X64.05 Y117.191 E.37996
G1 X64.05 Y115.781 E.04675
G1 X55.95 Y107.682 E.37996
G1 X55.95 Y109.938 E.07483
G1 X58.938 Y106.95 E.14016
G1 X62.895 Y106.95 E.13124
G1 X64.05 Y108.105 E.05419
G1 X64.05 Y109.515 E.04675
G1 X55.95 Y117.614 E.37996
G1 X55.95 Y115.358 E.07483
G1 X64.05 Y123.457 E.37996
G1 X64.05 Y124.867 E.04675
G1 X57.867 Y131.05 E.29006
G1 X56.29 Y131.05 E.0523
G1 X55.95 Y130.71 E.01593
G1 X55.95 Y129.082 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X55.95 Y130.71 E-.61876
G1 X56.213 Y130.973 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/105
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
G3 Z8.6 I.21 J1.199 P1  F30000
G1 X195.602 Y106.602 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3886
G1 X204.398 Y106.602 E.29177
G1 X204.398 Y131.398 E.82252
G1 X195.602 Y131.398 E.29177
G1 X195.602 Y106.662 E.82053
G1 X195.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3886
G1 X204.79 Y106.21 E.29437
G1 X204.79 Y131.79 E.786
G1 X195.21 Y131.79 E.29437
G1 X195.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P78 R10
G3 Z8.8 I-1.215 J-.066 P1  F30000
G1 X195.95 Y129.505 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3886
G1 X195.95 Y131.05 E.05124
G1 X196.034 Y131.05 E.00278
G1 X204.05 Y123.034 E.37603
G1 X204.05 Y125.29 E.07483
G1 X195.95 Y117.191 E.37996
G1 X195.95 Y115.781 E.04675
G1 X204.05 Y107.682 E.37996
G1 X204.05 Y109.938 E.07483
G1 X201.062 Y106.95 E.14016
G1 X197.105 Y106.95 E.13124
G1 X195.95 Y108.105 E.05419
G1 X195.95 Y109.515 E.04675
G1 X204.05 Y117.614 E.37996
G1 X204.05 Y115.358 E.07483
G1 X195.95 Y123.457 E.37996
G1 X195.95 Y124.867 E.04675
G1 X202.133 Y131.05 E.29006
G1 X203.71 Y131.05 E.0523
G1 X204.05 Y130.71 E.01593
G1 X204.05 Y129.082 E.05401
; WIPE_START
G1 F24000
G1 X204.05 Y130.71 E-.61876
G1 X203.787 Y130.973 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I.21 J-1.199 P1  F30000
G1 X64.398 Y106.602 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3886
G1 X64.398 Y131.398 E.82252
G1 X55.602 Y131.398 E.29177
G1 X55.602 Y106.602 E.82252
G1 X64.338 Y106.602 E.28978
G1 X64.79 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3886
G1 X64.79 Y131.79 E.786
G1 X55.21 Y131.79 E.29437
G1 X55.21 Y106.21 E.786
G1 X64.73 Y106.21 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.735 Y108.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-1.216 J-.039 P1  F30000
G1 X64.05 Y129.505 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3886
G1 X64.05 Y131.05 E.05124
G1 X63.966 Y131.05 E.00278
G1 X55.95 Y123.034 E.37603
G1 X55.95 Y125.29 E.07483
G1 X64.05 Y117.191 E.37996
G1 X64.05 Y115.781 E.04675
G1 X55.95 Y107.682 E.37996
G1 X55.95 Y109.938 E.07483
G1 X58.938 Y106.95 E.14016
G1 X62.895 Y106.95 E.13124
G1 X64.05 Y108.105 E.05419
G1 X64.05 Y109.515 E.04675
G1 X55.95 Y117.614 E.37996
G1 X55.95 Y115.358 E.07483
G1 X64.05 Y123.457 E.37996
G1 X64.05 Y124.867 E.04675
G1 X57.867 Y131.05 E.29006
G1 X56.29 Y131.05 E.0523
G1 X55.95 Y130.71 E.01593
G1 X55.95 Y129.082 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X55.95 Y130.71 E-.61876
G1 X56.213 Y130.973 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/105
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
G3 Z8.8 I.21 J1.199 P1  F30000
G1 X195.602 Y106.602 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3886
G1 X204.398 Y106.602 E.29177
G1 X204.398 Y131.398 E.82252
G1 X195.602 Y131.398 E.29177
G1 X195.602 Y106.662 E.82053
G1 X195.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3886
G1 X204.79 Y106.21 E.29437
G1 X204.79 Y131.79 E.786
G1 X195.21 Y131.79 E.29437
G1 X195.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.215 J-.066 P1  F30000
G1 X195.95 Y129.505 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3886
G1 X195.95 Y131.05 E.05124
G1 X196.034 Y131.05 E.00278
G1 X204.05 Y123.034 E.37603
G1 X204.05 Y125.29 E.07483
G1 X195.95 Y117.191 E.37996
G1 X195.95 Y115.781 E.04675
G1 X204.05 Y107.682 E.37996
G1 X204.05 Y109.938 E.07483
G1 X201.062 Y106.95 E.14016
G1 X197.105 Y106.95 E.13124
G1 X195.95 Y108.105 E.05419
G1 X195.95 Y109.515 E.04675
G1 X204.05 Y117.614 E.37996
G1 X204.05 Y115.358 E.07483
G1 X195.95 Y123.457 E.37996
G1 X195.95 Y124.867 E.04675
G1 X202.133 Y131.05 E.29006
G1 X203.71 Y131.05 E.0523
G1 X204.05 Y130.71 E.01593
G1 X204.05 Y129.082 E.05401
; WIPE_START
G1 F24000
G1 X204.05 Y130.71 E-.61876
G1 X203.787 Y130.973 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I.21 J-1.199 P1  F30000
G1 X64.398 Y106.602 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3886
G1 X64.398 Y131.398 E.82252
G1 X55.602 Y131.398 E.29177
G1 X55.602 Y106.602 E.82252
G1 X64.338 Y106.602 E.28978
G1 X64.79 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3886
G1 X64.79 Y131.79 E.786
G1 X55.21 Y131.79 E.29437
G1 X55.21 Y106.21 E.786
G1 X64.73 Y106.21 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.735 Y108.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.216 J-.039 P1  F30000
G1 X64.05 Y129.505 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3886
G1 X64.05 Y131.05 E.05124
G1 X63.966 Y131.05 E.00278
G1 X55.95 Y123.034 E.37603
G1 X55.95 Y125.29 E.07483
G1 X64.05 Y117.191 E.37996
G1 X64.05 Y115.781 E.04675
G1 X55.95 Y107.682 E.37996
G1 X55.95 Y109.938 E.07483
G1 X58.938 Y106.95 E.14016
G1 X62.895 Y106.95 E.13124
G1 X64.05 Y108.105 E.05419
G1 X64.05 Y109.515 E.04675
G1 X55.95 Y117.614 E.37996
G1 X55.95 Y115.358 E.07483
G1 X64.05 Y123.457 E.37996
G1 X64.05 Y124.867 E.04675
G1 X57.867 Y131.05 E.29006
G1 X56.29 Y131.05 E.0523
G1 X55.95 Y130.71 E.01593
G1 X55.95 Y129.082 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X55.95 Y130.71 E-.61876
G1 X56.213 Y130.973 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/105
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
G3 Z9 I.21 J1.199 P1  F30000
G1 X195.602 Y106.602 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3886
G1 X204.398 Y106.602 E.29177
G1 X204.398 Y131.398 E.82252
G1 X195.602 Y131.398 E.29177
G1 X195.602 Y106.662 E.82053
G1 X195.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3886
G1 X204.79 Y106.21 E.29437
G1 X204.79 Y131.79 E.786
G1 X195.21 Y131.79 E.29437
G1 X195.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-1.215 J-.066 P1  F30000
G1 X195.95 Y129.505 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3886
G1 X195.95 Y131.05 E.05124
G1 X196.034 Y131.05 E.00278
G1 X204.05 Y123.034 E.37603
G1 X204.05 Y125.29 E.07483
G1 X195.95 Y117.191 E.37996
G1 X195.95 Y115.781 E.04675
G1 X204.05 Y107.682 E.37996
G1 X204.05 Y109.938 E.07483
G1 X201.062 Y106.95 E.14016
G1 X197.105 Y106.95 E.13124
G1 X195.95 Y108.105 E.05419
G1 X195.95 Y109.515 E.04675
G1 X204.05 Y117.614 E.37996
G1 X204.05 Y115.358 E.07483
G1 X195.95 Y123.457 E.37996
G1 X195.95 Y124.867 E.04675
G1 X202.133 Y131.05 E.29006
G1 X203.71 Y131.05 E.0523
G1 X204.05 Y130.71 E.01593
G1 X204.05 Y129.082 E.05401
; WIPE_START
G1 F24000
G1 X204.05 Y130.71 E-.61876
G1 X203.787 Y130.973 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.21 J-1.199 P1  F30000
G1 X64.398 Y106.602 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3886
G1 X64.398 Y131.398 E.82252
G1 X55.602 Y131.398 E.29177
G1 X55.602 Y106.602 E.82252
G1 X64.338 Y106.602 E.28978
G1 X64.79 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3886
G1 X64.79 Y131.79 E.786
G1 X55.21 Y131.79 E.29437
G1 X55.21 Y106.21 E.786
G1 X64.73 Y106.21 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.735 Y108.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-1.216 J-.039 P1  F30000
G1 X64.05 Y129.505 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3886
G1 X64.05 Y131.05 E.05124
G1 X63.966 Y131.05 E.00278
G1 X55.95 Y123.034 E.37603
G1 X55.95 Y125.29 E.07483
G1 X64.05 Y117.191 E.37996
G1 X64.05 Y115.781 E.04675
G1 X55.95 Y107.682 E.37996
G1 X55.95 Y109.938 E.07483
G1 X58.938 Y106.95 E.14016
G1 X62.895 Y106.95 E.13124
G1 X64.05 Y108.105 E.05419
G1 X64.05 Y109.515 E.04675
G1 X55.95 Y117.614 E.37996
G1 X55.95 Y115.358 E.07483
G1 X64.05 Y123.457 E.37996
G1 X64.05 Y124.867 E.04675
G1 X57.867 Y131.05 E.29006
G1 X56.29 Y131.05 E.0523
G1 X55.95 Y130.71 E.01593
G1 X55.95 Y129.082 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X55.95 Y130.71 E-.61876
G1 X56.213 Y130.973 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/105
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
G3 Z9.2 I.21 J1.199 P1  F30000
G1 X195.602 Y106.602 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3886
G1 X204.398 Y106.602 E.29177
G1 X204.398 Y131.398 E.82252
G1 X195.602 Y131.398 E.29177
G1 X195.602 Y106.662 E.82053
G1 X195.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3886
G1 X204.79 Y106.21 E.29437
G1 X204.79 Y131.79 E.786
G1 X195.21 Y131.79 E.29437
G1 X195.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.215 J-.066 P1  F30000
G1 X195.95 Y129.505 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3886
G1 X195.95 Y131.05 E.05124
G1 X196.034 Y131.05 E.00278
G1 X204.05 Y123.034 E.37603
G1 X204.05 Y125.29 E.07483
G1 X195.95 Y117.191 E.37996
G1 X195.95 Y115.781 E.04675
G1 X204.05 Y107.682 E.37996
G1 X204.05 Y109.938 E.07483
G1 X201.062 Y106.95 E.14016
G1 X197.105 Y106.95 E.13124
G1 X195.95 Y108.105 E.05419
G1 X195.95 Y109.515 E.04675
G1 X204.05 Y117.614 E.37996
G1 X204.05 Y115.358 E.07483
G1 X195.95 Y123.457 E.37996
G1 X195.95 Y124.867 E.04675
G1 X202.133 Y131.05 E.29006
G1 X203.71 Y131.05 E.0523
M73 P79 R10
G1 X204.05 Y130.71 E.01593
G1 X204.05 Y129.082 E.05401
; WIPE_START
G1 F24000
G1 X204.05 Y130.71 E-.61876
G1 X203.787 Y130.973 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.21 J-1.199 P1  F30000
G1 X64.398 Y106.602 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3886
G1 X64.398 Y131.398 E.82252
G1 X55.602 Y131.398 E.29177
G1 X55.602 Y106.602 E.82252
G1 X64.338 Y106.602 E.28978
G1 X64.79 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3886
G1 X64.79 Y131.79 E.786
G1 X55.21 Y131.79 E.29437
M73 P79 R9
G1 X55.21 Y106.21 E.786
G1 X64.73 Y106.21 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.735 Y108.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.216 J-.039 P1  F30000
G1 X64.05 Y129.505 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3886
G1 X64.05 Y131.05 E.05124
G1 X63.966 Y131.05 E.00278
G1 X55.95 Y123.034 E.37603
G1 X55.95 Y125.29 E.07483
G1 X64.05 Y117.191 E.37996
G1 X64.05 Y115.781 E.04675
G1 X55.95 Y107.682 E.37996
G1 X55.95 Y109.938 E.07483
G1 X58.938 Y106.95 E.14016
G1 X62.895 Y106.95 E.13124
G1 X64.05 Y108.105 E.05419
G1 X64.05 Y109.515 E.04675
G1 X55.95 Y117.614 E.37996
G1 X55.95 Y115.358 E.07483
G1 X64.05 Y123.457 E.37996
G1 X64.05 Y124.867 E.04675
G1 X57.867 Y131.05 E.29006
G1 X56.29 Y131.05 E.0523
G1 X55.95 Y130.71 E.01593
G1 X55.95 Y129.082 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X55.95 Y130.71 E-.61876
G1 X56.213 Y130.973 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/105
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
G3 Z9.4 I.21 J1.199 P1  F30000
G1 X195.602 Y106.602 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3886
G1 X204.398 Y106.602 E.29177
G1 X204.398 Y131.398 E.82252
G1 X195.602 Y131.398 E.29177
G1 X195.602 Y106.662 E.82053
G1 X195.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3886
G1 X204.79 Y106.21 E.29437
G1 X204.79 Y131.79 E.786
G1 X195.21 Y131.79 E.29437
G1 X195.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-1.215 J-.066 P1  F30000
G1 X195.95 Y129.505 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3886
G1 X195.95 Y131.05 E.05124
G1 X196.034 Y131.05 E.00278
G1 X204.05 Y123.034 E.37603
G1 X204.05 Y125.29 E.07483
G1 X195.95 Y117.191 E.37996
G1 X195.95 Y115.781 E.04675
G1 X204.05 Y107.682 E.37996
G1 X204.05 Y109.938 E.07483
G1 X201.062 Y106.95 E.14016
G1 X197.105 Y106.95 E.13124
G1 X195.95 Y108.105 E.05419
G1 X195.95 Y109.515 E.04675
G1 X204.05 Y117.614 E.37996
G1 X204.05 Y115.358 E.07483
G1 X195.95 Y123.457 E.37996
G1 X195.95 Y124.867 E.04675
G1 X202.133 Y131.05 E.29006
G1 X203.71 Y131.05 E.0523
G1 X204.05 Y130.71 E.01593
G1 X204.05 Y129.082 E.05401
; WIPE_START
G1 F24000
G1 X204.05 Y130.71 E-.61876
G1 X203.787 Y130.973 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I.21 J-1.199 P1  F30000
G1 X64.398 Y106.602 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3886
G1 X64.398 Y131.398 E.82252
G1 X55.602 Y131.398 E.29177
G1 X55.602 Y106.602 E.82252
G1 X64.338 Y106.602 E.28978
G1 X64.79 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3886
G1 X64.79 Y131.79 E.786
G1 X55.21 Y131.79 E.29437
G1 X55.21 Y106.21 E.786
G1 X64.73 Y106.21 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.735 Y108.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-1.216 J-.039 P1  F30000
G1 X64.05 Y129.505 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3886
G1 X64.05 Y131.05 E.05124
G1 X63.966 Y131.05 E.00278
G1 X55.95 Y123.034 E.37603
G1 X55.95 Y125.29 E.07483
G1 X64.05 Y117.191 E.37996
G1 X64.05 Y115.781 E.04675
G1 X55.95 Y107.682 E.37996
G1 X55.95 Y109.938 E.07483
G1 X58.938 Y106.95 E.14016
G1 X62.895 Y106.95 E.13124
G1 X64.05 Y108.105 E.05419
G1 X64.05 Y109.515 E.04675
G1 X55.95 Y117.614 E.37996
G1 X55.95 Y115.358 E.07483
G1 X64.05 Y123.457 E.37996
G1 X64.05 Y124.867 E.04675
G1 X57.867 Y131.05 E.29006
G1 X56.29 Y131.05 E.0523
G1 X55.95 Y130.71 E.01593
G1 X55.95 Y129.082 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X55.95 Y130.71 E-.61876
G1 X56.213 Y130.973 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/105
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
G3 Z9.6 I.21 J1.199 P1  F30000
G1 X195.602 Y106.602 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4510
G1 X204.398 Y106.602 E.29177
G1 X204.398 Y131.398 E.82252
G1 X195.602 Y131.398 E.29177
G1 X195.602 Y106.662 E.82053
G1 X195.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4510
G1 X204.79 Y106.21 E.29437
G1 X204.79 Y131.79 E.786
G1 X195.21 Y131.79 E.29437
G1 X195.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I-.504 J1.108 P1  F30000
G1 X198.734 Y106.95 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4510
G1 X197.105 Y106.95 E.05401
G1 X195.95 Y108.105 E.05419
G1 X195.95 Y109.515 E.04675
G1 X200.918 Y114.483 E.23306
G1 X197.249 Y114.483 E.12172
G1 X204.05 Y107.682 E.31903
G1 X204.05 Y109.938 E.07483
G1 X201.062 Y106.95 E.14016
G1 X199.434 Y106.95 E.05401
G1 X200.104 Y115.297 F30000
G1 F4510
G1 X201.733 Y115.297 E.05401
G1 X203.643 Y117.207 E.0896
G1 X203.643 Y115.765 E.04783
G1 X196.705 Y122.703 E.32547
G1 X201.463 Y122.703 E.15783
G1 X196.357 Y117.598 E.2395
G1 X196.357 Y115.969 E.05401
G1 X196.229 Y123.517 F30000
G1 F4510
G1 X195.95 Y123.517 E.00925
G1 X195.95 Y124.867 E.04476
G1 X202.133 Y131.05 E.29006
G1 X203.71 Y131.05 E.0523
G1 X204.05 Y130.71 E.01593
G1 X204.05 Y125.29 E.17979
G1 X202.277 Y123.517 E.08317
G1 X203.567 Y123.517 E.04278
G1 X196.034 Y131.05 E.35336
G1 X195.95 Y131.05 E.00278
G1 X195.95 Y129.505 E.05124
G1 X204.05 Y123.11 F30000
G1 F4510
G1 X195.95 Y123.11 E.26867
G1 X195.95 Y114.89 E.27268
G1 X204.05 Y114.89 E.26867
G1 X204.05 Y123.05 E.27069
; WIPE_START
G1 F24000
G1 X204.05 Y121.05 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I.125 J-1.211 P1  F30000
G1 X64.398 Y106.602 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4510
G1 X64.398 Y131.398 E.82252
G1 X55.602 Y131.398 E.29177
G1 X55.602 Y106.602 E.82252
G1 X64.338 Y106.602 E.28978
G1 X64.79 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4510
G1 X64.79 Y131.79 E.786
G1 X55.21 Y131.79 E.29437
G1 X55.21 Y106.21 E.786
G1 X64.73 Y106.21 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.735 Y108.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I.415 J-1.144 P1  F30000
G1 X61.266 Y106.95 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4510
G1 X62.895 Y106.95 E.05401
G1 X64.05 Y108.105 E.05419
G1 X64.05 Y109.515 E.04675
G1 X59.082 Y114.483 E.23306
G1 X62.751 Y114.483 E.12172
G1 X55.95 Y107.682 E.31904
G1 X55.95 Y109.938 E.07483
G1 X58.938 Y106.95 E.14016
G1 X57.31 Y106.95 E.05401
G1 X59.896 Y115.297 F30000
G1 F4510
G1 X58.267 Y115.297 E.05401
G1 X56.357 Y117.207 E.0896
G1 X56.357 Y115.765 E.04783
G1 X63.295 Y122.703 E.32547
G1 X58.537 Y122.703 E.15783
G1 X63.643 Y117.598 E.2395
G1 X63.643 Y115.969 E.05401
G1 X64.05 Y123.05 F30000
G1 F4510
G1 X64.05 Y114.89 E.27069
G1 X55.95 Y114.89 E.26867
G1 X55.95 Y123.11 E.27268
G1 X64.05 Y123.11 E.26867
G1 X63.771 Y123.517 F30000
G1 F4510
G1 X64.05 Y123.517 E.00925
G1 X64.05 Y124.867 E.04476
G1 X57.867 Y131.05 E.29006
G1 X56.29 Y131.05 E.0523
G1 X55.95 Y130.71 E.01593
G1 X55.95 Y125.29 E.17979
G1 X57.723 Y123.517 E.08317
G1 X56.433 Y123.517 E.04278
G1 X63.966 Y131.05 E.35336
G1 X64.05 Y131.05 E.00278
G1 X64.05 Y129.505 E.05124
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X64.05 Y131.05 E-.58696
G1 X63.966 Y131.05 E-.0318
G1 X63.703 Y130.787 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/105
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
G3 Z9.8 I.219 J1.197 P1  F30000
G1 X195.602 Y106.602 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4501
G1 X204.398 Y106.602 E.29177
G1 X204.398 Y131.398 E.82252
G1 X195.602 Y131.398 E.29177
G1 X195.602 Y106.662 E.82053
G1 X195.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4501
G1 X204.79 Y106.21 E.29437
G1 X204.79 Y131.79 E.786
G1 X195.21 Y131.79 E.29437
G1 X195.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I-.504 J1.108 P1  F30000
G1 X198.734 Y106.95 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4501
G1 X197.105 Y106.95 E.05401
G1 X195.95 Y108.105 E.05419
G1 X195.95 Y109.515 E.04675
G1 X200.918 Y114.483 E.23306
G1 X197.249 Y114.483 E.12172
G1 X204.05 Y107.682 E.31903
G1 X204.05 Y109.938 E.07483
G1 X201.062 Y106.95 E.14016
G1 X199.434 Y106.95 E.05401
G1 X200.104 Y115.297 F30000
G1 F4501
G1 X201.733 Y115.297 E.05401
G1 X203.643 Y117.207 E.0896
G1 X203.643 Y115.765 E.04783
G1 X196.705 Y122.703 E.32547
G1 X201.463 Y122.703 E.15783
G1 X196.357 Y117.598 E.2395
G1 X196.357 Y115.969 E.05401
G1 X196.229 Y123.517 F30000
G1 F4501
G1 X195.95 Y123.517 E.00925
G1 X195.95 Y124.867 E.04476
G1 X202.133 Y131.05 E.29006
G1 X203.71 Y131.05 E.0523
G1 X204.05 Y130.71 E.01593
G1 X204.05 Y125.29 E.17979
G1 X202.277 Y123.517 E.08317
G1 X203.567 Y123.517 E.04278
G1 X196.034 Y131.05 E.35336
G1 X195.95 Y131.05 E.00278
G1 X195.95 Y129.505 E.05124
G1 X204.05 Y123.11 F30000
G1 F4501
G1 X195.95 Y123.11 E.26867
G1 X195.95 Y114.89 E.27268
G1 X204.05 Y114.89 E.26867
M73 P80 R9
G1 X204.05 Y123.05 E.27069
; WIPE_START
G1 F24000
G1 X204.05 Y121.05 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I.125 J-1.211 P1  F30000
G1 X64.398 Y106.602 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4501
G1 X64.398 Y131.398 E.82252
G1 X55.602 Y131.398 E.29177
G1 X55.602 Y106.602 E.82252
G1 X64.338 Y106.602 E.28978
G1 X64.79 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4501
G1 X64.79 Y131.79 E.786
G1 X55.21 Y131.79 E.29437
G1 X55.21 Y106.21 E.786
G1 X64.73 Y106.21 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.735 Y108.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I.415 J-1.144 P1  F30000
G1 X61.266 Y106.95 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4501
G1 X62.895 Y106.95 E.05401
G1 X64.05 Y108.105 E.05419
G1 X64.05 Y109.515 E.04675
G1 X59.082 Y114.483 E.23306
G1 X62.751 Y114.483 E.12172
G1 X55.95 Y107.682 E.31904
G1 X55.95 Y109.938 E.07483
G1 X58.938 Y106.95 E.14016
G1 X57.31 Y106.95 E.05401
G1 X59.896 Y115.297 F30000
G1 F4501
G1 X58.267 Y115.297 E.05401
G1 X56.357 Y117.207 E.0896
G1 X56.357 Y115.765 E.04783
G1 X63.295 Y122.703 E.32547
G1 X58.537 Y122.703 E.15783
G1 X63.643 Y117.598 E.2395
G1 X63.643 Y115.969 E.05401
G1 X64.05 Y123.05 F30000
G1 F4501
G1 X64.05 Y114.89 E.27069
G1 X55.95 Y114.89 E.26867
G1 X55.95 Y123.11 E.27268
G1 X64.05 Y123.11 E.26867
G1 X63.771 Y123.517 F30000
G1 F4501
G1 X64.05 Y123.517 E.00925
G1 X64.05 Y124.867 E.04476
G1 X57.867 Y131.05 E.29006
G1 X56.29 Y131.05 E.0523
G1 X55.95 Y130.71 E.01593
G1 X55.95 Y125.29 E.17979
G1 X57.723 Y123.517 E.08317
G1 X56.433 Y123.517 E.04278
G1 X63.966 Y131.05 E.35336
G1 X64.05 Y131.05 E.00278
G1 X64.05 Y129.505 E.05124
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X64.05 Y131.05 E-.58696
G1 X63.966 Y131.05 E-.0318
G1 X63.703 Y130.787 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/105
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
G3 Z10 I.219 J1.197 P1  F30000
G1 X195.602 Y106.602 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4501
G1 X204.398 Y106.602 E.29177
G1 X204.398 Y131.398 E.82252
G1 X195.602 Y131.398 E.29177
G1 X195.602 Y106.662 E.82053
G1 X195.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4501
G1 X204.79 Y106.21 E.29437
G1 X204.79 Y131.79 E.786
G1 X195.21 Y131.79 E.29437
G1 X195.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-.504 J1.108 P1  F30000
G1 X198.734 Y106.95 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4501
G1 X197.105 Y106.95 E.05401
G1 X195.95 Y108.105 E.05419
G1 X195.95 Y109.515 E.04675
G1 X200.918 Y114.483 E.23306
G1 X197.249 Y114.483 E.12172
G1 X204.05 Y107.682 E.31903
G1 X204.05 Y109.938 E.07483
G1 X201.062 Y106.95 E.14016
G1 X199.434 Y106.95 E.05401
G1 X200.104 Y115.297 F30000
G1 F4501
G1 X201.733 Y115.297 E.05401
G1 X203.643 Y117.207 E.0896
G1 X203.643 Y115.765 E.04783
G1 X196.705 Y122.703 E.32547
G1 X201.463 Y122.703 E.15783
G1 X196.357 Y117.598 E.2395
G1 X196.357 Y115.969 E.05401
G1 X196.229 Y123.517 F30000
G1 F4501
G1 X195.95 Y123.517 E.00925
G1 X195.95 Y124.867 E.04476
G1 X202.133 Y131.05 E.29006
G1 X203.71 Y131.05 E.0523
G1 X204.05 Y130.71 E.01593
G1 X204.05 Y125.29 E.17979
G1 X202.277 Y123.517 E.08317
G1 X203.567 Y123.517 E.04278
G1 X196.034 Y131.05 E.35336
G1 X195.95 Y131.05 E.00278
G1 X195.95 Y129.505 E.05124
G1 X204.05 Y123.11 F30000
G1 F4501
G1 X195.95 Y123.11 E.26867
G1 X195.95 Y114.89 E.27268
G1 X204.05 Y114.89 E.26867
G1 X204.05 Y123.05 E.27069
; WIPE_START
G1 F24000
G1 X204.05 Y121.05 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I.125 J-1.211 P1  F30000
G1 X64.398 Y106.602 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4501
G1 X64.398 Y131.398 E.82252
G1 X55.602 Y131.398 E.29177
G1 X55.602 Y106.602 E.82252
G1 X64.338 Y106.602 E.28978
G1 X64.79 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4501
G1 X64.79 Y131.79 E.786
G1 X55.21 Y131.79 E.29437
G1 X55.21 Y106.21 E.786
G1 X64.73 Y106.21 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.735 Y108.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I.415 J-1.144 P1  F30000
G1 X61.266 Y106.95 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4501
G1 X62.895 Y106.95 E.05401
G1 X64.05 Y108.105 E.05419
G1 X64.05 Y109.515 E.04675
G1 X59.082 Y114.483 E.23306
G1 X62.751 Y114.483 E.12172
G1 X55.95 Y107.682 E.31904
G1 X55.95 Y109.938 E.07483
G1 X58.938 Y106.95 E.14016
G1 X57.31 Y106.95 E.05401
G1 X59.896 Y115.297 F30000
G1 F4501
G1 X58.267 Y115.297 E.05401
G1 X56.357 Y117.207 E.0896
G1 X56.357 Y115.765 E.04783
G1 X63.295 Y122.703 E.32547
G1 X58.537 Y122.703 E.15783
G1 X63.643 Y117.598 E.2395
G1 X63.643 Y115.969 E.05401
G1 X64.05 Y123.05 F30000
G1 F4501
G1 X64.05 Y114.89 E.27069
G1 X55.95 Y114.89 E.26867
G1 X55.95 Y123.11 E.27268
G1 X64.05 Y123.11 E.26867
G1 X63.771 Y123.517 F30000
G1 F4501
G1 X64.05 Y123.517 E.00925
G1 X64.05 Y124.867 E.04476
G1 X57.867 Y131.05 E.29006
G1 X56.29 Y131.05 E.0523
G1 X55.95 Y130.71 E.01593
G1 X55.95 Y125.29 E.17979
G1 X57.723 Y123.517 E.08317
G1 X56.433 Y123.517 E.04278
G1 X63.966 Y131.05 E.35336
G1 X64.05 Y131.05 E.00278
G1 X64.05 Y129.505 E.05124
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X64.05 Y131.05 E-.58696
G1 X63.966 Y131.05 E-.0318
G1 X63.703 Y130.787 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/105
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
G3 Z10.2 I.219 J1.197 P1  F30000
G1 X195.602 Y106.602 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4501
G1 X204.398 Y106.602 E.29177
G1 X204.398 Y131.398 E.82252
G1 X195.602 Y131.398 E.29177
G1 X195.602 Y106.662 E.82053
G1 X195.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4501
G1 X204.79 Y106.21 E.29437
G1 X204.79 Y131.79 E.786
G1 X195.21 Y131.79 E.29437
G1 X195.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I-.504 J1.108 P1  F30000
G1 X198.734 Y106.95 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4501
G1 X197.105 Y106.95 E.05401
G1 X195.95 Y108.105 E.05419
G1 X195.95 Y109.515 E.04675
G1 X200.918 Y114.483 E.23306
G1 X197.249 Y114.483 E.12172
G1 X204.05 Y107.682 E.31903
G1 X204.05 Y109.938 E.07483
G1 X201.062 Y106.95 E.14016
G1 X199.434 Y106.95 E.05401
G1 X200.104 Y115.297 F30000
G1 F4501
G1 X201.733 Y115.297 E.05401
G1 X203.643 Y117.207 E.0896
G1 X203.643 Y115.765 E.04783
G1 X196.705 Y122.703 E.32547
G1 X201.463 Y122.703 E.15783
G1 X196.357 Y117.598 E.2395
G1 X196.357 Y115.969 E.05401
G1 X196.229 Y123.517 F30000
G1 F4501
G1 X195.95 Y123.517 E.00925
G1 X195.95 Y124.867 E.04476
G1 X202.133 Y131.05 E.29006
G1 X203.71 Y131.05 E.0523
G1 X204.05 Y130.71 E.01593
G1 X204.05 Y125.29 E.17979
G1 X202.277 Y123.517 E.08317
G1 X203.567 Y123.517 E.04278
G1 X196.034 Y131.05 E.35336
G1 X195.95 Y131.05 E.00278
G1 X195.95 Y129.505 E.05124
G1 X204.05 Y123.11 F30000
G1 F4501
G1 X195.95 Y123.11 E.26867
G1 X195.95 Y114.89 E.27268
G1 X204.05 Y114.89 E.26867
G1 X204.05 Y123.05 E.27069
; WIPE_START
G1 F24000
G1 X204.05 Y121.05 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I.125 J-1.211 P1  F30000
G1 X64.398 Y106.602 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4501
G1 X64.398 Y131.398 E.82252
G1 X55.602 Y131.398 E.29177
G1 X55.602 Y106.602 E.82252
G1 X64.338 Y106.602 E.28978
G1 X64.79 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4501
G1 X64.79 Y131.79 E.786
G1 X55.21 Y131.79 E.29437
G1 X55.21 Y106.21 E.786
G1 X64.73 Y106.21 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.735 Y108.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I.415 J-1.144 P1  F30000
G1 X61.266 Y106.95 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4501
G1 X62.895 Y106.95 E.05401
G1 X64.05 Y108.105 E.05419
G1 X64.05 Y109.515 E.04675
G1 X59.082 Y114.483 E.23306
G1 X62.751 Y114.483 E.12172
G1 X55.95 Y107.682 E.31904
G1 X55.95 Y109.938 E.07483
G1 X58.938 Y106.95 E.14016
G1 X57.31 Y106.95 E.05401
G1 X59.896 Y115.297 F30000
G1 F4501
G1 X58.267 Y115.297 E.05401
G1 X56.357 Y117.207 E.0896
G1 X56.357 Y115.765 E.04783
G1 X63.295 Y122.703 E.32547
G1 X58.537 Y122.703 E.15783
G1 X63.643 Y117.598 E.2395
G1 X63.643 Y115.969 E.05401
G1 X64.05 Y123.05 F30000
G1 F4501
G1 X64.05 Y114.89 E.27069
G1 X55.95 Y114.89 E.26867
G1 X55.95 Y123.11 E.27268
G1 X64.05 Y123.11 E.26867
G1 X63.771 Y123.517 F30000
G1 F4501
G1 X64.05 Y123.517 E.00925
G1 X64.05 Y124.867 E.04476
G1 X57.867 Y131.05 E.29006
G1 X56.29 Y131.05 E.0523
G1 X55.95 Y130.71 E.01593
G1 X55.95 Y125.29 E.17979
G1 X57.723 Y123.517 E.08317
G1 X56.433 Y123.517 E.04278
G1 X63.966 Y131.05 E.35336
G1 X64.05 Y131.05 E.00278
G1 X64.05 Y129.505 E.05124
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X64.05 Y131.05 E-.58696
G1 X63.966 Y131.05 E-.0318
G1 X63.703 Y130.787 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/105
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
G3 Z10.4 I.219 J1.197 P1  F30000
G1 X195.602 Y106.606 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X204.398 Y106.606 E.29177
G1 X204.398 Y131.394 E.82225
G1 X195.602 Y131.394 E.29177
G1 X195.602 Y106.666 E.82025
G1 X195.21 Y106.214 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X204.79 Y106.214 E.29437
G1 X204.79 Y131.786 E.78574
G1 X195.21 Y131.786 E.29437
G1 X195.21 Y106.274 E.7839
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y106.262 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I-.505 J1.107 P1  F30000
G1 X198.73 Y106.955 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X197.101 Y106.955 E.05401
G1 X195.95 Y108.105 E.05399
G1 X195.95 Y109.515 E.04675
G1 X200.918 Y114.483 E.23306
G1 X197.249 Y114.483 E.12172
G1 X204.05 Y107.682 E.31903
G1 X204.05 Y109.938 E.07483
G1 X201.066 Y106.955 E.13996
G1 X199.438 Y106.955 E.05401
G1 X204.231 Y114.913 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40407
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X195.972 Y114.913 E.4315
G1 X195.972 Y115.367 E.02372
G1 X204.028 Y115.367 E.42092
G1 X204.028 Y115.822 E.02372
G1 X195.972 Y115.822 E.42092
G1 X195.972 Y116.276 E.02372
G1 X204.028 Y116.276 E.42092
G1 X204.028 Y116.73 E.02372
G1 X195.972 Y116.73 E.42092
G1 X195.972 Y117.184 E.02372
G1 X204.028 Y117.184 E.42092
G1 X204.028 Y117.638 E.02372
G1 X195.972 Y117.638 E.42092
G1 X195.972 Y118.092 E.02372
G1 X204.028 Y118.092 E.42092
G1 X204.028 Y118.546 E.02372
G1 X195.972 Y118.546 E.42092
G1 X195.972 Y119 E.02372
G1 X204.028 Y119 E.42092
G1 X204.028 Y119.454 E.02372
G1 X195.972 Y119.454 E.42092
G1 X195.972 Y119.908 E.02372
G1 X204.028 Y119.908 E.42092
G1 X204.028 Y120.362 E.02372
G1 X195.972 Y120.362 E.42092
G1 X195.972 Y120.816 E.02372
G1 X204.028 Y120.816 E.42092
G1 X204.028 Y121.27 E.02372
G1 X195.972 Y121.27 E.42092
G1 X195.972 Y121.724 E.02372
G1 X204.028 Y121.724 E.42092
G1 X204.028 Y122.179 E.02372
G1 X195.972 Y122.179 E.42092
G1 X195.972 Y122.633 E.02372
G1 X204.028 Y122.633 E.42092
G1 X204.028 Y123.087 E.02372
G1 X195.769 Y123.087 E.4315
M106 S252.45
G1 X196.229 Y123.517 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X195.95 Y123.517 E.00925
G1 X195.95 Y124.867 E.04476
G1 X202.129 Y131.045 E.28986
G1 X203.714 Y131.045 E.05258
G1 X204.05 Y130.71 E.01574
G1 X204.05 Y125.29 E.17979
G1 X202.277 Y123.517 E.08317
M73 P81 R9
G1 X203.567 Y123.517 E.04278
G1 X196.038 Y131.045 E.35317
G1 X195.95 Y131.045 E.00292
G1 X195.95 Y129.505 E.0511
; WIPE_START
G1 F24000
G1 X195.95 Y131.045 E-.58536
G1 X196.038 Y131.045 E-.0334
G1 X196.301 Y130.783 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I.219 J-1.197 P1  F30000
G1 X64.398 Y106.606 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X64.398 Y131.394 E.82225
G1 X55.602 Y131.394 E.29177
G1 X55.602 Y106.606 E.82225
G1 X64.338 Y106.606 E.28978
G1 X64.79 Y106.214 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X64.79 Y131.786 E.78574
G1 X55.21 Y131.786 E.29437
G1 X55.21 Y106.214 E.78574
G1 X64.73 Y106.214 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.735 Y108.214 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I.416 J-1.144 P1  F30000
G1 X61.27 Y106.955 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X62.899 Y106.955 E.05401
G1 X64.05 Y108.105 E.05399
G1 X64.05 Y109.515 E.04675
G1 X59.082 Y114.483 E.23306
G1 X62.751 Y114.483 E.12172
G1 X55.95 Y107.682 E.31903
G1 X55.95 Y109.938 E.07483
G1 X58.934 Y106.955 E.13996
G1 X57.306 Y106.955 E.05401
G1 X64.231 Y114.913 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40407
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X55.972 Y114.913 E.4315
G1 X55.972 Y115.367 E.02372
G1 X64.028 Y115.367 E.42092
G1 X64.028 Y115.822 E.02372
G1 X55.972 Y115.822 E.42092
G1 X55.972 Y116.276 E.02372
G1 X64.028 Y116.276 E.42092
G1 X64.028 Y116.73 E.02372
G1 X55.972 Y116.73 E.42092
G1 X55.972 Y117.184 E.02372
G1 X64.028 Y117.184 E.42092
G1 X64.028 Y117.638 E.02372
G1 X55.972 Y117.638 E.42092
G1 X55.972 Y118.092 E.02372
G1 X64.028 Y118.092 E.42092
G1 X64.028 Y118.546 E.02372
G1 X55.972 Y118.546 E.42092
G1 X55.972 Y119 E.02372
G1 X64.028 Y119 E.42092
G1 X64.028 Y119.454 E.02372
G1 X55.972 Y119.454 E.42092
G1 X55.972 Y119.908 E.02372
G1 X64.028 Y119.908 E.42092
G1 X64.028 Y120.362 E.02372
M73 P81 R8
G1 X55.972 Y120.362 E.42092
G1 X55.972 Y120.816 E.02372
G1 X64.028 Y120.816 E.42092
G1 X64.028 Y121.27 E.02372
G1 X55.972 Y121.27 E.42092
G1 X55.972 Y121.724 E.02372
G1 X64.028 Y121.724 E.42092
G1 X64.028 Y122.179 E.02372
G1 X55.972 Y122.179 E.42092
G1 X55.972 Y122.633 E.02372
G1 X64.028 Y122.633 E.42092
G1 X64.028 Y123.087 E.02372
G1 X55.769 Y123.087 E.4315
M106 S252.45
G1 X63.771 Y123.517 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X64.05 Y123.517 E.00925
G1 X64.05 Y124.867 E.04476
G1 X57.871 Y131.045 E.28986
G1 X56.286 Y131.045 E.05258
G1 X55.95 Y130.71 E.01574
G1 X55.95 Y125.29 E.17979
G1 X57.723 Y123.517 E.08316
G1 X56.434 Y123.517 E.04278
G1 X63.962 Y131.045 E.35317
G1 X64.05 Y131.045 E.00292
G1 X64.05 Y129.505 E.0511
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X64.05 Y131.045 E-.58536
G1 X63.962 Y131.045 E-.0334
G1 X63.699 Y130.783 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/105
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
G3 Z10.6 I.126 J1.21 P1  F30000
G1 X195.602 Y117.023 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6600
G1 X195.602 Y106.617 E.34518
G1 X204.398 Y106.617 E.29177
G1 X204.398 Y131.383 E.82151
G1 X195.602 Y131.383 E.29177
G1 X195.602 Y117.083 E.47434
G1 X195.21 Y117.023 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6600
G1 X195.21 Y106.225 E.33179
G1 X204.79 Y106.225 E.29437
G1 X204.79 Y131.775 E.78506
G1 X195.21 Y131.775 E.29437
G1 X195.21 Y117.083 E.45143
M204 S10000
; WIPE_START
G1 F24000
G1 X195.21 Y115.083 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I.316 J1.175 P1  F30000
G1 X196.617 Y114.705 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.430693
G1 F6600
G1 X195.935 Y115.387 E.03047
G1 X195.935 Y115.935 E.01733
G1 X196.996 Y114.875 E.0474
G1 X197.544 Y114.875 E.01733
G1 X195.935 Y116.484 E.0719
G1 X195.935 Y117.032 E.01733
G1 X198.093 Y114.875 E.09641
G1 X198.641 Y114.875 E.01733
G1 X195.935 Y117.581 E.12091
G1 X195.935 Y118.129 E.01733
G1 X199.19 Y114.875 E.14542
G1 X199.738 Y114.875 E.01733
G1 X195.935 Y118.677 E.16993
G1 X195.935 Y119.226 E.01733
G1 X200.286 Y114.875 E.19443
G1 X200.835 Y114.875 E.01733
G1 X195.935 Y119.774 E.21894
G1 X195.935 Y120.323 E.01733
G1 X201.383 Y114.875 E.24344
G1 X201.931 Y114.875 E.01733
G1 X195.935 Y120.871 E.26795
G1 X195.935 Y121.419 E.01733
G1 X202.48 Y114.875 E.29246
G1 X203.028 Y114.875 E.01733
G1 X195.935 Y121.968 E.31696
G1 X195.935 Y122.516 E.01733
G1 X203.577 Y114.875 E.34147
G1 X204.065 Y114.875 E.01542
G1 X204.065 Y114.935 E.00191
G1 X195.935 Y123.065 E.36328
G1 X195.935 Y123.125 E.00191
G1 X196.423 Y123.125 E.01542
G1 X204.065 Y115.484 E.34148
G1 X204.065 Y116.032 E.01733
G1 X196.972 Y123.125 E.31697
G1 X197.52 Y123.125 E.01733
G1 X204.065 Y116.58 E.29246
G1 X204.065 Y117.129 E.01733
G1 X198.068 Y123.125 E.26796
G1 X198.617 Y123.125 E.01733
G1 X204.065 Y117.677 E.24345
G1 X204.065 Y118.226 E.01733
G1 X199.165 Y123.125 E.21894
G1 X199.714 Y123.125 E.01733
G1 X204.065 Y118.774 E.19444
G1 X204.065 Y119.322 E.01733
G1 X200.262 Y123.125 E.16993
G1 X200.81 Y123.125 E.01733
G1 X204.065 Y119.871 E.14543
G1 X204.065 Y120.419 E.01733
G1 X201.359 Y123.125 E.12092
G1 X201.907 Y123.125 E.01733
G1 X204.065 Y120.968 E.09641
G1 X204.065 Y121.516 E.01733
G1 X202.456 Y123.125 E.07191
G1 X203.004 Y123.125 E.01733
G1 X204.065 Y122.064 E.0474
G1 X204.065 Y122.613 E.01733
G1 X203.383 Y123.295 E.03048
G1 X196.229 Y123.517 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6600
G1 X195.95 Y123.517 E.00925
G1 X195.95 Y124.867 E.04476
G1 X202.118 Y131.034 E.28934
G1 X203.725 Y131.034 E.05332
G1 X204.05 Y130.71 E.01522
G1 X204.05 Y125.29 E.17979
G1 X202.277 Y123.517 E.08317
G1 X203.567 Y123.517 E.04278
G1 X196.049 Y131.034 E.35265
G1 X195.95 Y131.034 E.00328
G1 X195.95 Y129.505 E.05073
G1 X198.718 Y106.966 F30000
G1 F6600
G1 X197.09 Y106.966 E.05401
G1 X195.95 Y108.105 E.05347
G1 X195.95 Y109.515 E.04675
G1 X200.918 Y114.483 E.23306
G1 X197.249 Y114.483 E.12172
G1 X204.05 Y107.682 E.31903
G1 X204.05 Y109.938 E.07483
G1 X201.077 Y106.966 E.13944
G1 X199.449 Y106.966 E.05401
; WIPE_START
G1 F24000
G1 X201.077 Y106.966 E-.61876
G1 X201.34 Y107.228 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I.005 J-1.217 P1  F30000
G1 X64.398 Y106.617 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6600
G1 X64.398 Y131.383 E.82151
G1 X55.602 Y131.383 E.29177
G1 X55.602 Y106.617 E.82151
G1 X64.338 Y106.617 E.28978
G1 X64.79 Y106.225 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6600
G1 X64.79 Y131.775 E.78506
G1 X55.21 Y131.775 E.29437
G1 X55.21 Y106.225 E.78506
G1 X64.73 Y106.225 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.735 Y108.225 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I.417 J-1.143 P1  F30000
G1 X61.282 Y106.966 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6600
G1 X62.91 Y106.966 E.05401
G1 X64.05 Y108.105 E.05347
G1 X64.05 Y109.515 E.04675
G1 X59.082 Y114.483 E.23306
G1 X62.751 Y114.483 E.12172
G1 X55.95 Y107.682 E.31903
G1 X55.95 Y109.938 E.07483
G1 X58.923 Y106.966 E.13944
G1 X57.294 Y106.966 E.05401
G1 X56.617 Y114.705 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.430693
G1 F6600
G1 X55.935 Y115.387 E.03047
G1 X55.935 Y115.935 E.01733
G1 X56.996 Y114.875 E.0474
G1 X57.544 Y114.875 E.01733
G1 X55.935 Y116.484 E.0719
G1 X55.935 Y117.032 E.01733
G1 X58.093 Y114.875 E.09641
G1 X58.641 Y114.875 E.01733
G1 X55.935 Y117.581 E.12091
G1 X55.935 Y118.129 E.01733
G1 X59.19 Y114.875 E.14542
G1 X59.738 Y114.875 E.01733
G1 X55.935 Y118.677 E.16993
G1 X55.935 Y119.226 E.01733
G1 X60.286 Y114.875 E.19443
G1 X60.835 Y114.875 E.01733
G1 X55.935 Y119.774 E.21894
G1 X55.935 Y120.323 E.01733
G1 X61.383 Y114.875 E.24344
G1 X61.931 Y114.875 E.01733
G1 X55.935 Y120.871 E.26795
G1 X55.935 Y121.419 E.01733
G1 X62.48 Y114.875 E.29246
G1 X63.028 Y114.875 E.01733
G1 X55.935 Y121.968 E.31696
G1 X55.935 Y122.516 E.01733
G1 X63.577 Y114.875 E.34147
G1 X64.065 Y114.875 E.01542
G1 X64.065 Y114.935 E.00191
G1 X55.935 Y123.065 E.36328
G1 X55.935 Y123.125 E.00191
G1 X56.423 Y123.125 E.01542
G1 X64.065 Y115.484 E.34148
G1 X64.065 Y116.032 E.01733
G1 X56.972 Y123.125 E.31697
G1 X57.52 Y123.125 E.01733
G1 X64.065 Y116.58 E.29246
G1 X64.065 Y117.129 E.01733
G1 X58.068 Y123.125 E.26796
G1 X58.617 Y123.125 E.01733
G1 X64.065 Y117.677 E.24345
G1 X64.065 Y118.226 E.01733
G1 X59.165 Y123.125 E.21894
G1 X59.714 Y123.125 E.01733
G1 X64.065 Y118.774 E.19444
G1 X64.065 Y119.322 E.01733
G1 X60.262 Y123.125 E.16993
G1 X60.81 Y123.125 E.01733
G1 X64.065 Y119.871 E.14543
G1 X64.065 Y120.419 E.01733
G1 X61.359 Y123.125 E.12092
G1 X61.907 Y123.125 E.01733
G1 X64.065 Y120.968 E.09641
G1 X64.065 Y121.516 E.01733
G1 X62.456 Y123.125 E.07191
G1 X63.004 Y123.125 E.01733
G1 X64.065 Y122.064 E.0474
G1 X64.065 Y122.613 E.01733
G1 X63.383 Y123.295 E.03048
G1 X63.771 Y123.517 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6600
G1 X64.05 Y123.517 E.00925
G1 X64.05 Y124.867 E.04476
G1 X57.882 Y131.034 E.28934
G1 X56.275 Y131.034 E.05331
G1 X55.95 Y130.71 E.01522
G1 X55.95 Y125.29 E.17979
G1 X57.723 Y123.517 E.08316
G1 X56.434 Y123.517 E.04278
G1 X63.951 Y131.034 E.35265
G1 X64.05 Y131.034 E.00328
G1 X64.05 Y129.505 E.05073
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X64.05 Y131.034 E-.58115
G1 X63.951 Y131.034 E-.03762
G1 X63.688 Y130.772 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/105
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
G3 Z10.8 I.091 J1.214 P1  F30000
G1 X195.602 Y120.877 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7105
G1 X204.398 Y120.877 E.29177
G1 X204.398 Y131.364 E.34788
G1 X195.602 Y131.364 E.29177
G1 X195.602 Y120.937 E.34589
; WIPE_START
G1 F24000
G1 X197.602 Y120.923 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I1.084 J-.553 P1  F30000
G1 X195.602 Y117.002 Z11
G1 Z10.6
G1 E.8 F1800
G1 F7105
G1 X195.602 Y106.636 E.34385
G1 X204.398 Y106.636 E.29177
G1 X204.398 Y117.123 E.34788
G1 X195.602 Y117.123 E.29177
G1 X195.602 Y117.062 E.00204
G1 X195.21 Y117.002 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7105
G1 X195.21 Y106.244 E.33056
G1 X204.79 Y106.244 E.29437
G1 X204.79 Y131.756 E.78391
G1 X195.21 Y131.756 E.29437
G1 X195.21 Y117.062 E.45151
M204 S10000
; WIPE_START
G1 F24000
G1 X195.21 Y115.062 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I.943 J.769 P1  F30000
G1 X195.95 Y114.153 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7105
G1 X195.95 Y114.998 E.02801
G1 X196.734 Y114.998 E.026
G1 X204.05 Y107.682 E.34318
G1 X204.05 Y109.938 E.07483
G1 X201.096 Y106.984 E.13856
G1 X197.071 Y106.984 E.1335
G1 X195.95 Y108.105 E.05259
G1 X195.95 Y109.515 E.04675
G1 X201.433 Y114.998 E.25721
G1 X203.061 Y114.998 E.05401
G1 X204.176 Y116.052 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F7105
G1 X203.343 Y115.22 E.03618
G1 X202.81 Y115.22
G1 X204.176 Y116.586 E.05935
G1 X203.957 Y116.901
G1 X202.276 Y115.22 E.07305
G1 X201.743 Y115.22
G1 X203.424 Y116.901 E.07305
G1 X202.891 Y116.901
G1 X201.21 Y115.22 E.07305
G1 X200.677 Y115.22
G1 X202.358 Y116.901 E.07305
G1 X201.824 Y116.901
G1 X200.143 Y115.22 E.07305
G1 X199.61 Y115.22
G1 X201.291 Y116.901 E.07305
G1 X200.758 Y116.901
G1 X199.077 Y115.22 E.07305
G1 X198.544 Y115.22
G1 X200.225 Y116.901 E.07305
G1 X199.691 Y116.901
G1 X198.01 Y115.22 E.07305
G1 X197.477 Y115.22
G1 X199.158 Y116.901 E.07305
G1 X198.625 Y116.901
G1 X196.944 Y115.22 E.07305
G1 X196.41 Y115.22
G1 X198.091 Y116.901 E.07305
G1 X197.558 Y116.901
G1 X195.877 Y115.22 E.07305
G1 X195.824 Y115.7
G1 X197.025 Y116.901 E.05216
G1 X196.492 Y116.901
G1 X195.824 Y116.234 E.02899
M204 S10000
G1 X203.869 Y117.346 F30000
M204 S2000
G1 F7105
G1 X204.583 Y118.059 E.03101
G1 X204.583 Y118.593
G1 X203.336 Y117.346 E.05419
G1 X202.802 Y117.346
G1 X204.583 Y119.126 E.07736
G1 X204.583 Y119.659
G1 X202.269 Y117.346 E.10053
G1 X201.736 Y117.346
G1 X204.583 Y120.192 E.12371
G1 X204.511 Y120.654
G1 X201.203 Y117.346 E.14378
G1 X200.669 Y117.346
G1 X203.978 Y120.654 E.14378
G1 X203.445 Y120.654
G1 X200.136 Y117.346 E.14378
G1 X199.603 Y117.346
G1 X202.911 Y120.654 E.14378
G1 X202.378 Y120.654
G1 X199.069 Y117.346 E.14378
G1 X198.536 Y117.346
G1 X201.845 Y120.654 E.14378
G1 X201.312 Y120.654
G1 X198.003 Y117.346 E.14378
G1 X197.47 Y117.346
G1 X200.778 Y120.654 E.14378
G1 X200.245 Y120.654
G1 X196.936 Y117.346 E.14378
G1 X196.403 Y117.346
G1 X199.712 Y120.654 E.14378
G1 X199.179 Y120.654
G1 X195.87 Y117.346 E.14378
G1 X195.417 Y117.426
G1 X198.645 Y120.654 E.14027
G1 X198.112 Y120.654
G1 X195.417 Y117.96 E.11709
G1 X195.417 Y118.493
G1 X197.579 Y120.654 E.09392
G1 X197.045 Y120.654
G1 X195.417 Y119.026 E.07075
G1 X195.417 Y119.56
G1 X196.512 Y120.654 E.04757
G1 X195.979 Y120.654
G1 X195.417 Y120.093 E.0244
M204 S10000
G1 X204.176 Y121.918 F30000
M204 S2000
G1 F7105
G1 X203.356 Y121.099 E.0356
G1 X202.823 Y121.099
G1 X204.176 Y122.452 E.05878
G1 X203.971 Y122.78
G1 X202.29 Y121.099 E.07305
G1 X201.756 Y121.099
G1 X203.437 Y122.78 E.07305
G1 X202.904 Y122.78
G1 X201.223 Y121.099 E.07305
G1 X200.69 Y121.099
G1 X202.371 Y122.78 E.07305
G1 X201.838 Y122.78
G1 X200.157 Y121.099 E.07305
G1 X199.623 Y121.099
G1 X201.304 Y122.78 E.07305
G1 X200.771 Y122.78
G1 X199.09 Y121.099 E.07305
G1 X198.557 Y121.099
G1 X200.238 Y122.78 E.07305
G1 X199.704 Y122.78
G1 X198.024 Y121.099 E.07305
G1 X197.49 Y121.099
G1 X199.171 Y122.78 E.07305
G1 X198.638 Y122.78
G1 X196.957 Y121.099 E.07305
G1 X196.424 Y121.099
G1 X198.105 Y122.78 E.07305
G1 X197.571 Y122.78
G1 X195.89 Y121.099 E.07305
G1 X195.824 Y121.566
G1 X197.038 Y122.78 E.05274
G1 X196.505 Y122.78
G1 X195.824 Y122.1 E.02957
M204 S10000
G1 X195.95 Y129.505 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7105
G1 X195.95 Y131.016 E.05011
G1 X196.068 Y131.016 E.00391
G1 X204.05 Y123.034 E.37443
G1 X204.05 Y125.29 E.07483
G1 X201.762 Y123.002 E.10731
G1 X196.405 Y123.002 E.1777
G1 X195.95 Y123.457 E.02134
G1 X195.95 Y124.867 E.04675
G1 X202.099 Y131.016 E.28846
G1 X203.744 Y131.016 E.05456
G1 X204.05 Y130.71 E.01434
G1 X204.05 Y129.082 E.05401
; WIPE_START
G1 F24000
G1 X204.05 Y130.71 E-.61876
G1 X203.787 Y130.973 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I.088 J-1.214 P1  F30000
G1 X64.398 Y120.877 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7105
G1 X64.398 Y131.364 E.34788
G1 X55.602 Y131.364 E.29177
G1 X55.602 Y120.877 E.34788
G1 X64.338 Y120.877 E.28978
; WIPE_START
G1 F24000
G1 X64.349 Y122.877 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I1.217 J.004 P1  F30000
G1 X64.398 Y106.636 Z11
G1 Z10.6
G1 E.8 F1800
G1 F7105
G1 X64.398 Y117.123 E.34788
G1 X55.602 Y117.123 E.29177
G1 X55.602 Y106.636 E.34788
G1 X64.338 Y106.636 E.28978
G1 X64.79 Y106.244 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7105
G1 X64.79 Y131.756 E.78391
G1 X55.21 Y131.756 E.29437
G1 X55.21 Y106.244 E.78391
G1 X64.73 Y106.244 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.735 Y108.244 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I-1.209 J-.14 P1  F30000
G1 X64.05 Y114.153 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7105
G1 X64.05 Y114.998 E.02801
G1 X63.266 Y114.998 E.026
G1 X55.95 Y107.682 E.34318
G1 X55.95 Y109.938 E.07483
G1 X58.904 Y106.984 E.13856
G1 X62.929 Y106.984 E.1335
G1 X64.05 Y108.105 E.05259
G1 X64.05 Y109.515 E.04675
G1 X58.567 Y114.998 E.25721
G1 X56.939 Y114.998 E.05401
G1 X64.176 Y115.769 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F7105
G1 X63.626 Y115.22 E.02387
G1 X63.093 Y115.22
G1 X64.176 Y116.303 E.04704
G1 X64.176 Y116.836
G1 X62.56 Y115.22 E.07022
G1 X62.026 Y115.22
G1 X63.707 Y116.901 E.07305
G1 X63.174 Y116.901
G1 X61.493 Y115.22 E.07305
G1 X60.96 Y115.22
G1 X62.641 Y116.901 E.07305
G1 X62.108 Y116.901
G1 X60.427 Y115.22 E.07305
M73 P82 R8
G1 X59.893 Y115.22
G1 X61.574 Y116.901 E.07305
G1 X61.041 Y116.901
G1 X59.36 Y115.22 E.07305
G1 X58.827 Y115.22
G1 X60.508 Y116.901 E.07305
G1 X59.974 Y116.901
G1 X58.293 Y115.22 E.07305
G1 X57.76 Y115.22
G1 X59.441 Y116.901 E.07305
G1 X58.908 Y116.901
G1 X57.227 Y115.22 E.07305
G1 X56.694 Y115.22
G1 X58.375 Y116.901 E.07305
G1 X57.841 Y116.901
G1 X56.16 Y115.22 E.07305
G1 X55.824 Y115.417
G1 X57.308 Y116.901 E.06447
G1 X56.775 Y116.901
G1 X55.824 Y115.951 E.0413
G1 X55.824 Y116.484
G1 X56.242 Y116.901 E.01812
M204 S10000
G1 X64.583 Y117.776 F30000
M204 S2000
G1 F7105
G1 X64.152 Y117.346 E.01871
G1 X63.619 Y117.346
G1 X64.583 Y118.309 E.04188
G1 X64.583 Y118.843
G1 X63.086 Y117.346 E.06505
G1 X62.552 Y117.346
G1 X64.583 Y119.376 E.08823
G1 X64.583 Y119.909
G1 X62.019 Y117.346 E.1114
G1 X61.486 Y117.346
G1 X64.583 Y120.442 E.13457
G1 X64.261 Y120.654
G1 X60.953 Y117.346 E.14378
G1 X60.419 Y117.346
G1 X63.728 Y120.654 E.14378
G1 X63.195 Y120.654
G1 X59.886 Y117.346 E.14378
G1 X59.353 Y117.346
G1 X62.661 Y120.654 E.14378
G1 X62.128 Y120.654
G1 X58.819 Y117.346 E.14378
G1 X58.286 Y117.346
G1 X61.595 Y120.654 E.14378
G1 X61.062 Y120.654
G1 X57.753 Y117.346 E.14378
G1 X57.22 Y117.346
G1 X60.528 Y120.654 E.14378
G1 X59.995 Y120.654
G1 X56.686 Y117.346 E.14378
G1 X56.153 Y117.346
G1 X59.462 Y120.654 E.14378
G1 X58.928 Y120.654
G1 X55.62 Y117.346 E.14378
G1 X55.417 Y117.677
G1 X58.395 Y120.654 E.1294
G1 X57.862 Y120.654
G1 X55.417 Y118.21 E.10623
G1 X55.417 Y118.743
G1 X57.329 Y120.654 E.08305
G1 X56.795 Y120.654
G1 X55.417 Y119.276 E.05988
G1 X55.417 Y119.81
G1 X56.262 Y120.654 E.03671
M204 S10000
G1 X64.176 Y121.635 F30000
M204 S2000
G1 F7105
G1 X63.639 Y121.099 E.0233
G1 X63.106 Y121.099
G1 X64.176 Y122.168 E.04647
G1 X64.176 Y122.702
G1 X62.573 Y121.099 E.06964
G1 X62.04 Y121.099
G1 X63.721 Y122.78 E.07305
G1 X63.187 Y122.78
G1 X61.506 Y121.099 E.07305
G1 X60.973 Y121.099
G1 X62.654 Y122.78 E.07305
G1 X62.121 Y122.78
G1 X60.44 Y121.099 E.07305
G1 X59.907 Y121.099
G1 X61.587 Y122.78 E.07305
G1 X61.054 Y122.78
G1 X59.373 Y121.099 E.07305
G1 X58.84 Y121.099
G1 X60.521 Y122.78 E.07305
G1 X59.988 Y122.78
G1 X58.307 Y121.099 E.07305
G1 X57.773 Y121.099
G1 X59.454 Y122.78 E.07305
G1 X58.921 Y122.78
G1 X57.24 Y121.099 E.07305
G1 X56.707 Y121.099
G1 X58.388 Y122.78 E.07305
G1 X57.855 Y122.78
G1 X56.174 Y121.099 E.07305
G1 X55.824 Y121.283
G1 X57.321 Y122.78 E.06505
G1 X56.788 Y122.78
G1 X55.824 Y121.816 E.04187
G1 X55.824 Y122.35
G1 X56.255 Y122.78 E.0187
M204 S10000
G1 X55.95 Y129.082 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7105
G1 X55.95 Y130.71 E.05401
G1 X56.256 Y131.016 E.01434
G1 X57.901 Y131.016 E.05456
G1 X64.05 Y124.867 E.28846
G1 X64.05 Y123.457 E.04675
G1 X63.595 Y123.002 E.02134
G1 X58.238 Y123.002 E.1777
G1 X55.95 Y125.29 E.10731
G1 X55.95 Y123.034 E.07483
G1 X63.932 Y131.016 E.37443
G1 X64.05 Y131.016 E.00391
G1 X64.05 Y129.505 E.05011
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X64.05 Y131.016 E-.57401
G1 X63.932 Y131.016 E-.04475
G1 X63.669 Y130.753 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/105
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
G3 Z11 I.095 J1.213 P1  F30000
G1 X195.602 Y120.401 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4828
G1 X204.398 Y120.401 E.29177
G1 X204.398 Y131.337 E.36278
G1 X195.602 Y131.337 E.29177
G1 X195.602 Y120.461 E.36079
G1 X195.21 Y120.009 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4828
G1 X204.79 Y120.009 E.29437
G1 X204.79 Y131.729 E.36014
G1 X195.21 Y131.729 E.29437
G1 X195.21 Y120.069 E.35829
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y120.056 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I-.867 J-.854 P1  F30000
G1 X196.029 Y121.257 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477612
G1 F4828
G1 X203.977 Y121.257 E.28154
G1 X203.977 Y120.822 E.0154
G1 X196.025 Y120.822 E.28168
G1 X196.028 Y121.197 E.01327
G1 X195.95 Y129.505 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4828
G1 X195.95 Y130.989 E.04923
G1 X196.095 Y130.989 E.00479
G1 X204.05 Y123.034 E.37319
G1 X204.05 Y125.29 E.07483
G1 X200.437 Y121.677 E.16947
G1 X197.73 Y121.677 E.08979
G1 X195.95 Y123.457 E.0835
G1 X195.95 Y124.867 E.04675
G1 X202.073 Y130.989 E.28721
G1 X203.771 Y130.989 E.05632
G1 X204.05 Y130.71 E.01309
G1 X204.05 Y129.082 E.05401
; WIPE_START
G1 F24000
G1 X204.05 Y130.71 E-.61876
G1 X203.787 Y130.973 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I1.038 J-.635 P1  F30000
G1 X195.602 Y117.599 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4828
G1 X195.602 Y106.663 E.36278
G1 X204.398 Y106.663 E.29177
G1 X204.398 Y117.599 E.36278
G1 X195.662 Y117.599 E.28978
G1 X195.21 Y117.991 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4828
G1 X195.21 Y106.271 E.36014
G1 X204.79 Y106.271 E.29437
G1 X204.79 Y117.991 E.36014
G1 X195.27 Y117.991 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.26 Y115.991 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I-1.024 J.658 P1  F30000
G1 X196.023 Y117.178 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477612
G1 F4828
G1 X203.975 Y117.178 E.28168
G1 X203.971 Y116.743 E.0154
G1 X196.023 Y116.743 E.28154
G1 X196.023 Y117.118 E.01327
G1 X197.038 Y116.323 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4828
G1 X195.95 Y116.323 E.03607
G1 X195.95 Y115.781 E.01795
G1 X204.05 Y107.682 E.37996
G1 X204.05 Y109.938 E.07483
G1 X201.123 Y107.011 E.13732
G1 X197.045 Y107.011 E.13526
G1 X195.95 Y108.105 E.05135
G1 X195.95 Y109.515 E.04675
G1 X202.758 Y116.323 E.31937
G1 X203.085 Y116.323 E.01085
G1 X204.05 Y115.358 E.04524
G1 X204.05 Y113.73 E.05401
; WIPE_START
G1 F24000
G1 X204.05 Y115.358 E-.61876
G1 X203.787 Y115.621 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I-.017 J-1.217 P1  F30000
G1 X64.398 Y117.599 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4828
G1 X55.602 Y117.599 E.29177
G1 X55.602 Y106.663 E.36278
G1 X64.398 Y106.663 E.29177
G1 X64.398 Y117.539 E.36079
G1 X64.79 Y117.991 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4828
G1 X55.21 Y117.991 E.29437
G1 X55.21 Y106.271 E.36014
G1 X64.79 Y106.271 E.29437
G1 X64.79 Y117.931 E.35829
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y117.944 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I.66 J1.022 P1  F30000
G1 X63.975 Y117.178 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477612
G1 F4828
G1 X63.971 Y116.743 E.0154
G1 X56.023 Y116.743 E.28154
G1 X56.023 Y117.178 E.0154
G1 X63.915 Y117.178 E.27955
G1 X62.962 Y116.323 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4828
G1 X64.05 Y116.323 E.03607
G1 X64.05 Y115.781 E.01795
G1 X55.95 Y107.682 E.37996
G1 X55.95 Y109.938 E.07483
G1 X58.877 Y107.011 E.13732
G1 X62.955 Y107.011 E.13527
G1 X64.05 Y108.105 E.05135
G1 X64.05 Y109.515 E.04675
G1 X57.242 Y116.323 E.31937
G1 X56.915 Y116.323 E.01085
G1 X55.95 Y115.358 E.04524
G1 X55.95 Y113.73 E.05401
; WIPE_START
G1 F24000
G1 X55.95 Y115.358 E-.61876
G1 X56.213 Y115.621 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I-.614 J1.051 P1  F30000
G1 X64.398 Y120.401 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4828
G1 X64.398 Y131.337 E.36278
G1 X55.602 Y131.337 E.29177
G1 X55.602 Y120.401 E.36278
G1 X64.338 Y120.401 E.28978
G1 X64.79 Y120.009 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4828
G1 X64.79 Y131.729 E.36014
G1 X55.21 Y131.729 E.29437
G1 X55.21 Y120.009 E.36014
G1 X64.73 Y120.009 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.74 Y122.009 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I.854 J-.867 P1  F30000
G1 X63.977 Y121.257 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477612
G1 F4828
G1 X63.977 Y120.822 E.0154
G1 X56.025 Y120.822 E.28168
G1 X56.029 Y121.257 E.0154
G1 X63.917 Y121.257 E.27941
G1 X64.05 Y129.505 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4828
G1 X64.05 Y130.989 E.04923
G1 X63.905 Y130.989 E.00479
G1 X55.95 Y123.034 E.37319
G1 X55.95 Y125.29 E.07483
G1 X59.563 Y121.677 E.16947
G1 X62.27 Y121.677 E.08979
G1 X64.05 Y123.457 E.0835
G1 X64.05 Y124.867 E.04675
G1 X57.927 Y130.989 E.28721
G1 X56.229 Y130.989 E.05632
G1 X55.95 Y130.71 E.01309
G1 X55.95 Y129.082 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X55.95 Y130.71 E-.61876
G1 X56.213 Y130.973 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/105
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
G3 Z11.2 I.088 J1.214 P1  F30000
G1 X195.602 Y120.887 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4756
G1 X204.398 Y120.887 E.29177
G1 X204.398 Y131.303 E.3455
G1 X195.602 Y131.303 E.29177
G1 X195.602 Y120.947 E.34351
G1 X195.21 Y120.495 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4756
G1 X204.79 Y120.495 E.29437
G1 X204.79 Y131.695 E.34413
G1 X195.21 Y131.695 E.29437
G1 X195.21 Y120.555 E.34229
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y120.543 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-.772 J-.94 P1  F30000
G1 X195.969 Y121.562 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.357084
G1 F4756
G1 X204.037 Y121.562 E.20656
G1 X204.037 Y121.248 E.00804
G1 X195.965 Y121.248 E.20666
G1 X195.968 Y121.502 E.00651
G1 X195.95 Y129.505 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4756
G1 X195.95 Y130.954 E.04808
G1 X196.129 Y130.954 E.00594
G1 X204.05 Y123.034 E.37156
G1 X204.05 Y125.29 E.07483
G1 X200.682 Y121.923 E.15797
G1 X197.485 Y121.923 E.10605
G1 X195.95 Y123.457 E.072
G1 X195.95 Y124.867 E.04675
G1 X202.038 Y130.954 E.28559
G1 X203.805 Y130.954 E.05862
G1 X204.05 Y130.71 E.01146
G1 X204.05 Y129.082 E.05401
; WIPE_START
G1 F24000
G1 X204.05 Y130.71 E-.61876
G1 X203.805 Y130.954 E-.1313
G1 X203.779 Y130.954 E-.00994
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I1.048 J-.619 P1  F30000
G1 X195.602 Y117.113 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4756
G1 X195.602 Y106.697 E.3455
G1 X204.398 Y106.697 E.29177
G1 X204.398 Y117.113 E.3455
G1 X195.662 Y117.113 E.28978
G1 X195.21 Y117.505 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4756
G1 X195.21 Y106.305 E.34413
G1 X204.79 Y106.305 E.29437
G1 X204.79 Y117.505 E.34413
G1 X195.27 Y117.505 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.259 Y115.505 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-1.06 J.598 P1  F30000
G1 X195.963 Y116.752 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.357084
G1 F4756
G1 X204.035 Y116.752 E.20666
G1 X204.031 Y116.438 E.00804
G1 X195.963 Y116.438 E.20656
G1 X195.963 Y116.692 E.00651
G1 X197.283 Y116.077 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4756
G1 X195.95 Y116.077 E.0442
G1 X195.95 Y115.781 E.00982
G1 X204.05 Y107.682 E.37996
G1 X204.05 Y109.938 E.07483
G1 X201.157 Y107.046 E.13569
G1 X197.01 Y107.046 E.13757
G1 X195.95 Y108.105 E.04972
G1 X195.95 Y109.515 E.04675
G1 X202.513 Y116.077 E.30787
G1 X203.33 Y116.077 E.02711
G1 X204.05 Y115.358 E.03374
G1 X204.05 Y113.73 E.05401
; WIPE_START
G1 F24000
G1 X204.05 Y115.358 E-.61876
G1 X203.787 Y115.621 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-.013 J-1.217 P1  F30000
G1 X64.398 Y117.113 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4756
G1 X55.602 Y117.113 E.29177
G1 X55.602 Y106.697 E.3455
G1 X64.398 Y106.697 E.29177
G1 X64.398 Y117.053 E.34351
G1 X64.79 Y117.505 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4756
G1 X55.21 Y117.505 E.29437
G1 X55.21 Y106.305 E.34413
G1 X64.79 Y106.305 E.29437
G1 X64.79 Y117.445 E.34229
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y117.457 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I.6 J1.059 P1  F30000
G1 X64.035 Y116.752 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.357084
G1 F4756
G1 X64.031 Y116.438 E.00804
G1 X55.963 Y116.438 E.20656
G1 X55.963 Y116.752 E.00804
G1 X63.975 Y116.752 E.20513
G1 X62.717 Y116.077 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4756
G1 X64.05 Y116.077 E.0442
G1 X64.05 Y115.781 E.00982
G1 X55.95 Y107.682 E.37996
G1 X55.95 Y109.938 E.07483
G1 X58.843 Y107.046 E.13569
G1 X62.99 Y107.046 E.13757
G1 X64.05 Y108.105 E.04972
G1 X64.05 Y109.515 E.04675
G1 X57.487 Y116.077 E.30787
G1 X56.67 Y116.077 E.02711
G1 X55.95 Y115.358 E.03375
G1 X55.95 Y113.73 E.05401
; WIPE_START
G1 F24000
G1 X55.95 Y115.358 E-.61876
G1 X56.213 Y115.621 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-.658 J1.023 P1  F30000
G1 X64.398 Y120.887 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4756
G1 X64.398 Y131.303 E.3455
G1 X55.602 Y131.303 E.29177
G1 X55.602 Y120.887 E.3455
G1 X64.338 Y120.887 E.28978
G1 X64.79 Y120.495 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4756
G1 X64.79 Y131.695 E.34413
G1 X55.21 Y131.695 E.29437
G1 X55.21 Y120.495 E.34413
G1 X64.73 Y120.495 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.741 Y122.495 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I.972 J-.733 P1  F30000
G1 X64.037 Y121.562 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.357084
G1 F4756
G1 X64.037 Y121.248 E.00804
G1 X55.965 Y121.248 E.20666
G1 X55.969 Y121.562 E.00804
G1 X63.977 Y121.562 E.20502
G1 X64.05 Y129.505 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4756
G1 X64.05 Y130.954 E.04808
G1 X63.871 Y130.954 E.00594
G1 X55.95 Y123.034 E.37156
G1 X55.95 Y125.29 E.07483
G1 X59.318 Y121.923 E.15797
G1 X62.515 Y121.923 E.10605
G1 X64.05 Y123.457 E.072
G1 X64.05 Y124.867 E.04675
G1 X57.962 Y130.954 E.28559
G1 X56.195 Y130.954 E.05862
G1 X55.95 Y130.71 E.01146
G1 X55.95 Y129.082 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X55.95 Y130.71 E-.61876
G1 X56.195 Y130.954 E-.13131
G1 X56.221 Y130.954 E-.00993
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/105
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
G3 Z11.4 I.085 J1.214 P1  F30000
G1 X195.602 Y121.21 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4379
G1 X204.398 Y121.21 E.29177
G1 X204.398 Y131.258 E.33329
G1 X195.602 Y131.258 E.29177
G1 X195.602 Y121.27 E.3313
G1 X195.21 Y120.818 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4379
G1 X204.79 Y120.818 E.29437
G1 X204.79 Y131.65 E.33283
G1 X195.21 Y131.65 E.29437
G1 X195.21 Y120.878 E.33098
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y120.866 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I-.695 J-.999 P1  F30000
G1 X196.061 Y121.665 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.545716
G1 F4379
G1 X203.879 Y121.665 E.32031
G1 X204.05 Y129.082 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4379
G1 X204.05 Y130.71 E.05401
G1 X203.85 Y130.91 E.00937
G1 X201.993 Y130.91 E.06159
G1 X195.95 Y124.867 E.28349
G1 X195.95 Y123.457 E.04675
G1 X197.287 Y122.12 E.06273
G1 X200.88 Y122.12 E.11917
G1 X204.05 Y125.29 E.1487
G1 X204.05 Y123.034 E.07483
G1 X196.174 Y130.91 E.36946
G1 X195.95 Y130.91 E.00742
G1 X195.95 Y129.505 E.04659
; WIPE_START
G1 F24000
G1 X195.95 Y130.91 E-.53375
G1 X196.174 Y130.91 E-.08501
G1 X196.437 Y130.647 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I1.215 J-.073 P1  F30000
G1 X195.602 Y116.79 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4379
G1 X195.602 Y106.742 E.33329
G1 X204.398 Y106.742 E.29177
G1 X204.398 Y116.79 E.33329
G1 X195.662 Y116.79 E.28978
G1 X195.21 Y117.182 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4379
G1 X195.21 Y106.35 E.33283
G1 X204.79 Y106.35 E.29437
G1 X204.79 Y117.182 E.33283
G1 X195.27 Y117.182 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.259 Y115.182 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I-.999 J.695 P1  F30000
G1 X196.061 Y116.335 Z11.6
G1 Z11.2
M73 P83 R8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.545716
G1 F4379
G1 X203.879 Y116.335 E.32031
G1 X204.05 Y113.73 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4379
G1 X204.05 Y115.358 E.05401
G1 X203.528 Y115.88 E.02447
G1 X202.315 Y115.88 E.04023
G1 X195.95 Y109.515 E.29859
G1 X195.95 Y108.105 E.04675
G1 X196.965 Y107.09 E.04762
G1 X201.202 Y107.09 E.14053
G1 X204.05 Y109.938 E.13359
G1 X204.05 Y107.682 E.07483
G1 X195.95 Y115.781 E.37996
G1 X195.95 Y115.88 E.00326
G1 X197.48 Y115.88 E.05075
; WIPE_START
G1 F24000
G1 X195.95 Y115.88 E-.58142
G1 X195.95 Y115.781 E-.03734
G1 X196.213 Y115.519 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I-.012 J-1.217 P1  F30000
G1 X64.398 Y116.79 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4379
G1 X55.602 Y116.79 E.29177
G1 X55.602 Y106.742 E.33329
G1 X64.398 Y106.742 E.29177
G1 X64.398 Y116.73 E.3313
G1 X64.79 Y117.182 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4379
G1 X55.21 Y117.182 E.29437
G1 X55.21 Y106.35 E.33283
G1 X64.79 Y106.35 E.29437
G1 X64.79 Y117.122 E.33098
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y117.134 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I1.19 J-.256 P1  F30000
G1 X62.52 Y115.88 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4379
G1 X64.05 Y115.88 E.05075
G1 X64.05 Y115.781 E.00326
G1 X55.95 Y107.682 E.37996
G1 X55.95 Y109.938 E.07483
G1 X58.798 Y107.09 E.13359
G1 X63.035 Y107.09 E.14053
G1 X64.05 Y108.105 E.04762
G1 X64.05 Y109.515 E.04675
G1 X57.685 Y115.88 E.2986
G1 X56.472 Y115.88 E.04023
G1 X55.95 Y115.358 E.02447
G1 X55.95 Y113.73 E.05401
G1 X56.061 Y116.335 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.545716
G1 F4379
G1 X63.879 Y116.335 E.32031
; WIPE_START
G1 F24000
G1 X61.879 Y116.335 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I-1.081 J.559 P1  F30000
G1 X64.398 Y121.21 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4379
G1 X64.398 Y131.258 E.33329
G1 X55.602 Y131.258 E.29177
G1 X55.602 Y121.21 E.33329
G1 X64.338 Y121.21 E.28978
G1 X64.79 Y120.818 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4379
G1 X64.79 Y131.65 E.33283
G1 X55.21 Y131.65 E.29437
G1 X55.21 Y120.818 E.33283
G1 X64.73 Y120.818 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.741 Y122.818 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I.999 J-.695 P1  F30000
G1 X63.939 Y121.665 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.545714
G1 F4379
G1 X56.121 Y121.665 E.32031
G1 X55.95 Y129.082 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4379
G1 X55.95 Y130.71 E.05401
G1 X56.15 Y130.91 E.00937
G1 X58.007 Y130.91 E.06159
G1 X64.05 Y124.867 E.28349
G1 X64.05 Y123.457 E.04675
G1 X62.713 Y122.12 E.06273
G1 X59.12 Y122.12 E.11917
G1 X55.95 Y125.29 E.1487
G1 X55.95 Y123.034 E.07483
G1 X63.826 Y130.91 E.36946
G1 X64.05 Y130.91 E.00742
G1 X64.05 Y129.505 E.04659
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X64.05 Y130.91 E-.53376
G1 X63.826 Y130.91 E-.085
G1 X63.563 Y130.647 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/105
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
G3 Z11.6 I.085 J1.214 P1  F30000
G1 X195.602 Y121.456 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4027
G1 X204.398 Y121.456 E.29177
G1 X204.398 Y131.205 E.3234
G1 X195.602 Y131.205 E.29177
G1 X195.602 Y121.516 E.32141
G1 X195.21 Y121.063 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4027
G1 X204.79 Y121.063 E.29437
G1 X204.79 Y131.597 E.32366
G1 X195.21 Y131.597 E.29437
G1 X195.21 Y121.123 E.32182
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y121.111 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I-1.203 J-.181 P1  F30000
G1 X195.95 Y129.505 Z11.8
G1 Z11.4
M73 P83 R7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4027
G1 X195.95 Y130.857 E.04483
G1 X196.227 Y130.857 E.00918
G1 X204.05 Y123.034 E.36697
G1 X204.05 Y125.29 E.07483
G1 X200.563 Y121.804 E.16355
G1 X197.604 Y121.804 E.09817
G1 X195.95 Y123.457 E.07757
G1 X195.95 Y124.867 E.04675
G1 X201.94 Y130.857 E.281
G1 X203.569 Y130.857 E.05401
; WIPE_START
G1 F24000
G1 X201.94 Y130.857 E-.61876
G1 X201.677 Y130.594 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I1.117 J-.483 P1  F30000
G1 X195.602 Y116.544 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4027
G1 X195.602 Y106.795 E.3234
G1 X204.398 Y106.795 E.29177
G1 X204.398 Y116.544 E.3234
G1 X195.662 Y116.544 E.28978
G1 X195.21 Y116.937 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4027
G1 X195.21 Y106.403 E.32366
G1 X204.79 Y106.403 E.29437
G1 X204.79 Y116.937 E.32366
G1 X195.27 Y116.937 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.259 Y114.937 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I-.671 J1.015 P1  F30000
G1 X197.164 Y116.196 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4027
G1 X195.95 Y116.196 E.04026
G1 X195.95 Y115.781 E.01376
G1 X204.05 Y107.682 E.37996
G1 X204.05 Y109.938 E.07483
G1 X201.255 Y107.143 E.1311
G1 X196.912 Y107.143 E.14405
G1 X195.95 Y108.105 E.04513
G1 X195.95 Y109.515 E.04675
G1 X202.632 Y116.196 E.31344
G1 X203.212 Y116.196 E.01923
G1 X204.05 Y115.358 E.03932
G1 X204.05 Y113.73 E.05401
; WIPE_START
G1 F24000
G1 X204.05 Y115.358 E-.61876
G1 X203.787 Y115.621 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I-.008 J-1.217 P1  F30000
G1 X64.398 Y116.544 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4027
G1 X55.602 Y116.544 E.29177
G1 X55.602 Y106.795 E.3234
G1 X64.398 Y106.795 E.29177
G1 X64.398 Y116.484 E.32141
G1 X64.79 Y116.937 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4027
G1 X55.21 Y116.937 E.29437
G1 X55.21 Y106.403 E.32366
G1 X64.79 Y106.403 E.29437
G1 X64.79 Y116.877 E.32182
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y116.889 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I1.214 J.081 P1  F30000
G1 X62.836 Y116.196 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4027
G1 X64.05 Y116.196 E.04026
G1 X64.05 Y115.781 E.01376
G1 X55.95 Y107.682 E.37996
G1 X55.95 Y109.938 E.07483
G1 X58.745 Y107.143 E.1311
G1 X63.088 Y107.143 E.14405
G1 X64.05 Y108.105 E.04513
G1 X64.05 Y109.515 E.04675
G1 X57.368 Y116.196 E.31344
G1 X56.788 Y116.196 E.01923
G1 X55.95 Y115.358 E.03932
G1 X55.95 Y113.73 E.05401
; WIPE_START
G1 F24000
G1 X55.95 Y115.358 E-.61876
G1 X56.213 Y115.621 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I-.706 J.991 P1  F30000
G1 X64.398 Y121.456 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4027
G1 X64.398 Y131.205 E.3234
G1 X55.602 Y131.205 E.29177
G1 X55.602 Y121.456 E.3234
G1 X64.338 Y121.456 E.28978
G1 X64.79 Y121.063 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4027
G1 X64.79 Y131.597 E.32366
G1 X55.21 Y131.597 E.29437
G1 X55.21 Y121.063 E.32366
G1 X64.73 Y121.063 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.741 Y123.063 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I-1.21 J-.13 P1  F30000
G1 X64.05 Y129.505 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4027
G1 X64.05 Y130.857 E.04483
G1 X63.773 Y130.857 E.00918
G1 X55.95 Y123.034 E.36697
G1 X55.95 Y125.29 E.07483
G1 X59.437 Y121.804 E.16354
G1 X62.396 Y121.804 E.09817
G1 X64.05 Y123.457 E.07757
G1 X64.05 Y124.867 E.04675
G1 X58.06 Y130.857 E.281
G1 X56.431 Y130.857 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X58.06 Y130.857 E-.61876
G1 X58.323 Y130.594 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/105
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
G3 Z11.8 I.079 J1.214 P1  F30000
G1 X195.602 Y121.653 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3988
G1 X204.398 Y121.653 E.29177
G1 X204.398 Y131.143 E.3148
G1 X195.602 Y131.143 E.29177
G1 X195.602 Y121.713 E.31281
G1 X195.21 Y121.261 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3988
G1 X204.79 Y121.261 E.29437
G1 X204.79 Y131.535 E.31569
G1 X195.21 Y131.535 E.29437
G1 X195.21 Y121.321 E.31385
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y121.309 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I-1.203 J-.185 P1  F30000
G1 X195.95 Y129.505 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3988
G1 X195.95 Y130.795 E.04278
G1 X196.289 Y130.795 E.01123
G1 X204.05 Y123.034 E.36408
G1 X204.05 Y125.29 E.07483
G1 X200.761 Y122.001 E.15427
G1 X197.406 Y122.001 E.11129
G1 X195.95 Y123.457 E.0683
G1 X195.95 Y124.867 E.04675
G1 X201.879 Y130.795 E.2781
G1 X203.507 Y130.795 E.05401
; WIPE_START
G1 F24000
G1 X201.879 Y130.795 E-.61876
G1 X201.616 Y130.532 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I1.12 J-.475 P1  F30000
G1 X195.602 Y116.347 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3988
G1 X195.602 Y106.857 E.3148
G1 X204.398 Y106.857 E.29177
G1 X204.398 Y116.347 E.3148
G1 X195.662 Y116.347 E.28978
G1 X195.21 Y116.739 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3988
G1 X195.21 Y106.465 E.31569
G1 X204.79 Y106.465 E.29437
G1 X204.79 Y116.739 E.31569
G1 X195.27 Y116.739 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.258 Y114.739 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I-.625 J1.044 P1  F30000
G1 X197.362 Y115.999 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3988
G1 X195.95 Y115.999 E.04681
G1 X195.95 Y115.781 E.0072
G1 X204.05 Y107.682 E.37996
G1 X204.05 Y109.938 E.07483
G1 X201.317 Y107.205 E.12821
G1 X196.851 Y107.205 E.14815
G1 X195.95 Y108.105 E.04224
G1 X195.95 Y109.515 E.04675
G1 X202.434 Y115.999 E.30417
G1 X203.409 Y115.999 E.03235
G1 X204.05 Y115.358 E.03004
G1 X204.05 Y113.73 E.05401
; WIPE_START
G1 F24000
G1 X204.05 Y115.358 E-.61876
G1 X203.787 Y115.621 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I-.006 J-1.217 P1  F30000
G1 X64.398 Y116.347 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3988
G1 X55.602 Y116.347 E.29177
G1 X55.602 Y106.857 E.3148
G1 X64.398 Y106.857 E.29177
G1 X64.398 Y116.287 E.31281
G1 X64.79 Y116.739 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3988
G1 X55.21 Y116.739 E.29437
G1 X55.21 Y106.465 E.31569
G1 X64.79 Y106.465 E.29437
G1 X64.79 Y116.679 E.31385
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y116.691 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I1.189 J-.26 P1  F30000
G1 X62.638 Y115.999 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3988
G1 X64.05 Y115.999 E.04681
G1 X64.05 Y115.781 E.0072
G1 X55.95 Y107.682 E.37996
G1 X55.95 Y109.938 E.07483
G1 X58.683 Y107.205 E.12821
G1 X63.149 Y107.205 E.14815
G1 X64.05 Y108.105 E.04224
G1 X64.05 Y109.515 E.04675
G1 X57.566 Y115.999 E.30417
G1 X56.591 Y115.999 E.03235
G1 X55.95 Y115.358 E.03004
G1 X55.95 Y113.73 E.05401
; WIPE_START
G1 F24000
G1 X55.95 Y115.358 E-.61876
G1 X56.213 Y115.621 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I-.722 J.98 P1  F30000
G1 X64.398 Y121.653 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3988
G1 X64.398 Y131.143 E.3148
G1 X55.602 Y131.143 E.29177
G1 X55.602 Y121.653 E.3148
G1 X64.338 Y121.653 E.28978
G1 X64.79 Y121.261 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3988
G1 X64.79 Y131.535 E.31569
G1 X55.21 Y131.535 E.29437
G1 X55.21 Y121.261 E.31569
G1 X64.73 Y121.261 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.742 Y123.261 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I-1.21 J-.134 P1  F30000
G1 X64.05 Y129.505 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3988
G1 X64.05 Y130.795 E.04279
G1 X63.711 Y130.795 E.01123
G1 X55.95 Y123.034 E.36408
G1 X55.95 Y125.29 E.07483
G1 X59.239 Y122.001 E.15427
G1 X62.594 Y122.001 E.11129
G1 X64.05 Y123.457 E.0683
G1 X64.05 Y124.867 E.04675
G1 X58.121 Y130.795 E.2781
G1 X56.493 Y130.795 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X58.121 Y130.795 E-.61876
G1 X58.384 Y130.532 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/105
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
G3 Z12 I.077 J1.215 P1  F30000
G1 X195.602 Y121.816 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3946
G1 X204.398 Y121.816 E.29177
G1 X204.398 Y131.072 E.30706
G1 X195.602 Y131.072 E.29177
G1 X195.602 Y121.876 E.30507
G1 X195.21 Y121.424 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3946
G1 X204.79 Y121.424 E.29437
G1 X204.79 Y131.464 E.30852
G1 X195.21 Y131.464 E.29437
G1 X195.21 Y121.484 E.30668
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y121.471 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I-1.202 J-.189 P1  F30000
G1 X195.95 Y129.505 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3946
G1 X195.95 Y130.724 E.04043
G1 X196.36 Y130.724 E.01358
G1 X204.05 Y123.034 E.36075
G1 X204.05 Y125.29 E.07483
G1 X200.924 Y122.164 E.14665
G1 X197.244 Y122.164 E.12207
G1 X195.95 Y123.457 E.06068
G1 X195.95 Y124.867 E.04675
G1 X201.808 Y130.724 E.27478
G1 X203.436 Y130.724 E.05401
; WIPE_START
G1 F24000
G1 X201.808 Y130.724 E-.61876
G1 X201.545 Y130.461 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I1.124 J-.468 P1  F30000
G1 X195.602 Y116.184 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3946
G1 X195.602 Y106.928 E.30706
G1 X204.398 Y106.928 E.29177
G1 X204.398 Y116.184 E.30706
G1 X195.662 Y116.184 E.28978
G1 X195.21 Y116.576 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3946
G1 X195.21 Y106.536 E.30852
G1 X204.79 Y106.536 E.29437
G1 X204.79 Y116.576 E.30852
G1 X195.27 Y116.576 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.258 Y114.576 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I-.591 J1.064 P1  F30000
G1 X197.524 Y115.836 Z12.2
G1 Z11.8
M73 P84 R7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3946
G1 X195.95 Y115.836 E.0522
G1 X195.95 Y115.781 E.00181
G1 X204.05 Y107.682 E.37996
G1 X204.05 Y109.938 E.07483
G1 X201.388 Y107.276 E.12488
G1 X196.78 Y107.276 E.15285
G1 X195.95 Y108.105 E.03891
G1 X195.95 Y109.515 E.04675
G1 X202.272 Y115.836 E.29655
G1 X203.572 Y115.836 E.04313
G1 X204.05 Y115.358 E.02242
G1 X204.05 Y113.73 E.05401
; WIPE_START
G1 F24000
G1 X204.05 Y115.358 E-.61876
G1 X203.787 Y115.621 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I-.005 J-1.217 P1  F30000
G1 X64.398 Y116.184 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3946
G1 X55.602 Y116.184 E.29177
G1 X55.602 Y106.928 E.30706
G1 X64.398 Y106.928 E.29177
G1 X64.398 Y116.124 E.30507
G1 X64.79 Y116.576 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3946
G1 X55.21 Y116.576 E.29437
G1 X55.21 Y106.536 E.30852
G1 X64.79 Y106.536 E.29437
G1 X64.79 Y116.516 E.30668
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y116.529 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I1.108 J-.502 P1  F30000
G1 X62.476 Y115.836 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3946
G1 X64.05 Y115.836 E.0522
G1 X64.05 Y115.781 E.00181
G1 X55.95 Y107.682 E.37996
G1 X55.95 Y109.938 E.07483
G1 X58.612 Y107.276 E.12488
G1 X63.22 Y107.276 E.15285
G1 X64.05 Y108.105 E.03891
G1 X64.05 Y109.515 E.04675
G1 X57.728 Y115.836 E.29655
G1 X56.428 Y115.836 E.04313
G1 X55.95 Y115.358 E.02242
G1 X55.95 Y113.73 E.05401
; WIPE_START
G1 F24000
G1 X55.95 Y115.358 E-.61876
G1 X56.213 Y115.621 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I-.734 J.97 P1  F30000
G1 X64.398 Y121.816 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3946
G1 X64.398 Y131.072 E.30706
G1 X55.602 Y131.072 E.29177
G1 X55.602 Y121.816 E.30706
G1 X64.338 Y121.816 E.28978
G1 X64.79 Y121.424 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3946
G1 X64.79 Y131.464 E.30852
G1 X55.21 Y131.464 E.29437
G1 X55.21 Y121.424 E.30852
G1 X64.73 Y121.424 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.742 Y123.424 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I-1.209 J-.138 P1  F30000
G1 X64.05 Y129.505 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3946
G1 X64.05 Y130.724 E.04043
G1 X63.64 Y130.724 E.01358
G1 X55.95 Y123.034 E.36075
G1 X55.95 Y125.29 E.07483
G1 X59.076 Y122.164 E.14665
G1 X62.756 Y122.164 E.12207
G1 X64.05 Y123.457 E.06068
G1 X64.05 Y124.867 E.04675
G1 X58.192 Y130.724 E.27478
G1 X56.564 Y130.724 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X58.192 Y130.724 E-.61876
G1 X58.455 Y130.461 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/105
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
G3 Z12.2 I.075 J1.215 P1  F30000
G1 X195.602 Y121.951 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3905
G1 X204.398 Y121.951 E.29177
G1 X204.398 Y130.992 E.29991
G1 X195.602 Y130.992 E.29177
G1 X195.602 Y122.011 E.29792
G1 X195.21 Y121.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3905
G1 X204.79 Y121.559 E.29437
G1 X204.79 Y131.384 E.3019
G1 X195.21 Y131.384 E.29437
G1 X195.21 Y121.619 E.30006
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y121.606 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I-1.202 J-.192 P1  F30000
G1 X195.95 Y129.505 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3905
G1 X195.95 Y130.644 E.03776
G1 X196.44 Y130.644 E.01625
G1 X204.05 Y123.034 E.35698
G1 X204.05 Y125.29 E.07483
G1 X201.059 Y122.299 E.14032
G1 X197.109 Y122.299 E.13102
G1 X195.95 Y123.457 E.05435
G1 X195.95 Y124.867 E.04675
G1 X201.727 Y130.644 E.271
G1 X203.356 Y130.644 E.05401
; WIPE_START
G1 F24000
G1 X201.727 Y130.644 E-.61876
G1 X201.464 Y130.381 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I1.126 J-.461 P1  F30000
G1 X195.602 Y116.049 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3905
G1 X195.602 Y107.008 E.29991
G1 X204.398 Y107.008 E.29177
G1 X204.398 Y116.049 E.29991
G1 X195.662 Y116.049 E.28978
G1 X195.21 Y116.441 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3905
G1 X195.21 Y106.616 E.3019
G1 X204.79 Y106.616 E.29437
G1 X204.79 Y116.441 E.3019
G1 X195.27 Y116.441 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.258 Y114.442 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I.468 J1.123 P1  F30000
G1 X195.95 Y114.153 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3905
G1 X195.95 Y115.701 E.05135
G1 X196.031 Y115.701 E.00266
G1 X204.05 Y107.682 E.37619
G1 X204.05 Y109.938 E.07483
G1 X201.468 Y107.356 E.12111
G1 X196.699 Y107.356 E.15819
G1 X195.95 Y108.105 E.03514
G1 X195.95 Y109.515 E.04675
G1 X202.137 Y115.701 E.29022
G1 X203.707 Y115.701 E.05207
G1 X204.05 Y115.358 E.01609
G1 X204.05 Y113.73 E.05401
; WIPE_START
G1 F24000
G1 X204.05 Y115.358 E-.61876
G1 X203.787 Y115.621 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I-.004 J-1.217 P1  F30000
G1 X64.398 Y116.049 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3905
G1 X55.602 Y116.049 E.29177
G1 X55.602 Y107.008 E.29991
G1 X64.398 Y107.008 E.29177
G1 X64.398 Y115.989 E.29792
G1 X64.79 Y116.441 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3905
G1 X55.21 Y116.441 E.29437
G1 X55.21 Y106.616 E.3019
G1 X64.79 Y106.616 E.29437
G1 X64.79 Y116.381 E.30006
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y116.394 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I1.061 J.596 P1  F30000
G1 X64.05 Y114.153 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3905
G1 X64.05 Y115.701 E.05135
G1 X63.969 Y115.701 E.00266
G1 X55.95 Y107.682 E.37619
G1 X55.95 Y109.938 E.07483
G1 X58.532 Y107.356 E.12111
G1 X63.301 Y107.356 E.15819
G1 X64.05 Y108.105 E.03514
G1 X64.05 Y109.515 E.04675
G1 X57.863 Y115.701 E.29022
G1 X56.293 Y115.701 E.05207
G1 X55.95 Y115.358 E.01609
G1 X55.95 Y113.73 E.05401
; WIPE_START
G1 F24000
G1 X55.95 Y115.358 E-.61876
G1 X56.213 Y115.621 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I-.744 J.963 P1  F30000
G1 X64.398 Y121.951 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3905
G1 X64.398 Y130.992 E.29991
G1 X55.602 Y130.992 E.29177
G1 X55.602 Y121.951 E.29991
G1 X64.338 Y121.951 E.28978
G1 X64.79 Y121.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3905
G1 X64.79 Y131.384 E.3019
G1 X55.21 Y131.384 E.29437
G1 X55.21 Y121.559 E.3019
G1 X64.73 Y121.559 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.742 Y123.558 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I-1.209 J-.141 P1  F30000
G1 X64.05 Y129.505 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3905
G1 X64.05 Y130.644 E.03777
G1 X63.56 Y130.644 E.01625
G1 X55.95 Y123.034 E.35698
G1 X55.95 Y125.29 E.07483
G1 X58.941 Y122.299 E.14032
G1 X62.891 Y122.299 E.13102
G1 X64.05 Y123.457 E.05435
G1 X64.05 Y124.867 E.04675
G1 X58.273 Y130.644 E.27101
G1 X56.644 Y130.644 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X58.273 Y130.644 E-.61876
G1 X58.536 Y130.381 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/105
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
G3 Z12.4 I.074 J1.215 P1  F30000
G1 X195.602 Y122.061 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3865
G1 X204.398 Y122.061 E.29177
G1 X204.398 Y130.901 E.29326
G1 X195.602 Y130.901 E.29177
G1 X195.602 Y122.121 E.29127
G1 X195.21 Y121.669 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3865
G1 X204.79 Y121.669 E.29437
G1 X204.79 Y131.293 E.29574
G1 X195.21 Y131.293 E.29437
G1 X195.21 Y121.729 E.2939
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y121.716 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I-1.201 J-.194 P1  F30000
G1 X195.95 Y129.505 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3865
G1 X195.95 Y130.553 E.03476
G1 X196.531 Y130.553 E.01926
G1 X204.05 Y123.034 E.35272
G1 X204.05 Y125.29 E.07483
G1 X201.169 Y122.409 E.13516
G1 X196.999 Y122.409 E.13831
G1 X195.95 Y123.457 E.04919
G1 X195.95 Y124.867 E.04675
G1 X201.637 Y130.553 E.26675
G1 X203.265 Y130.553 E.05401
; WIPE_START
G1 F24000
G1 X201.637 Y130.553 E-.61876
G1 X201.374 Y130.29 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I1.129 J-.454 P1  F30000
G1 X195.602 Y115.939 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3865
G1 X195.602 Y107.099 E.29326
G1 X204.398 Y107.099 E.29177
G1 X204.398 Y115.939 E.29326
G1 X195.662 Y115.939 E.28978
G1 X195.21 Y116.331 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3865
G1 X195.21 Y106.707 E.29574
G1 X204.79 Y106.707 E.29437
G1 X204.79 Y116.331 E.29574
G1 X195.27 Y116.331 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.258 Y114.332 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I.303 J1.179 P1  F30000
G1 X195.95 Y114.153 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3865
G1 X195.95 Y115.591 E.0477
G1 X196.141 Y115.591 E.00631
G1 X204.05 Y107.682 E.37103
G1 X204.05 Y109.938 E.07483
G1 X201.559 Y107.447 E.11685
G1 X196.609 Y107.447 E.1642
G1 X195.95 Y108.105 E.03088
G1 X195.95 Y109.515 E.04675
G1 X202.027 Y115.591 E.28506
G1 X203.817 Y115.591 E.05937
G1 X204.05 Y115.358 E.01093
G1 X204.05 Y113.73 E.05401
; WIPE_START
G1 F24000
G1 X204.05 Y115.358 E-.61876
G1 X203.817 Y115.591 E-.12525
G1 X203.775 Y115.591 E-.01599
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I-.003 J-1.217 P1  F30000
G1 X64.398 Y115.939 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3865
G1 X55.602 Y115.939 E.29177
G1 X55.602 Y107.099 E.29326
G1 X64.398 Y107.099 E.29177
G1 X64.398 Y115.879 E.29127
G1 X64.79 Y116.331 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3865
G1 X55.21 Y116.331 E.29437
G1 X55.21 Y106.707 E.29574
G1 X64.79 Y106.707 E.29437
G1 X64.79 Y116.271 E.2939
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y116.284 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I1.048 J.619 P1  F30000
G1 X64.05 Y114.153 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3865
G1 X64.05 Y115.591 E.0477
G1 X63.859 Y115.591 E.00631
G1 X55.95 Y107.682 E.37103
G1 X55.95 Y109.938 E.07483
G1 X58.441 Y107.447 E.11685
G1 X63.391 Y107.447 E.1642
G1 X64.05 Y108.105 E.03088
G1 X64.05 Y109.515 E.04675
G1 X57.973 Y115.591 E.28506
G1 X56.183 Y115.591 E.05937
G1 X55.95 Y115.358 E.01093
G1 X55.95 Y113.73 E.05401
; WIPE_START
G1 F24000
G1 X55.95 Y115.358 E-.61876
G1 X56.183 Y115.591 E-.12525
G1 X56.225 Y115.591 E-.01599
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I-.755 J.954 P1  F30000
G1 X64.398 Y122.061 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3865
G1 X64.398 Y130.901 E.29326
G1 X55.602 Y130.901 E.29177
G1 X55.602 Y122.061 E.29326
G1 X64.338 Y122.061 E.28978
G1 X64.79 Y121.669 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3865
G1 X64.79 Y131.293 E.29574
G1 X55.21 Y131.293 E.29437
G1 X55.21 Y121.669 E.29574
G1 X64.73 Y121.669 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.742 Y123.668 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I-1.208 J-.143 P1  F30000
G1 X64.05 Y129.505 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3865
G1 X64.05 Y130.553 E.03476
G1 X63.469 Y130.553 E.01926
G1 X55.95 Y123.034 E.35272
G1 X55.95 Y125.29 E.07483
G1 X58.831 Y122.409 E.13516
G1 X63.001 Y122.409 E.13832
G1 X64.05 Y123.457 E.04919
G1 X64.05 Y124.867 E.04675
G1 X58.363 Y130.553 E.26675
G1 X56.735 Y130.553 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X58.363 Y130.553 E-.61876
G1 X58.626 Y130.29 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/105
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
G3 Z12.6 I.072 J1.215 P1  F30000
G1 X195.602 Y122.151 Z12.6
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3786
G1 X204.398 Y122.151 E.29177
G1 X204.398 Y130.8 E.28689
G1 X195.602 Y130.8 E.29177
G1 X195.602 Y122.211 E.2849
G1 X195.21 Y121.759 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3786
G1 X204.79 Y121.759 E.29437
G1 X204.79 Y131.192 E.28984
G1 X195.21 Y131.192 E.29437
G1 X195.21 Y121.819 E.288
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y121.806 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I-1.201 J-.197 P1  F30000
G1 X195.95 Y129.505 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3786
G1 X195.95 Y130.451 E.03139
G1 X196.632 Y130.451 E.02263
G1 X204.05 Y123.034 E.34796
G1 X204.05 Y125.29 E.07483
G1 X201.259 Y122.499 E.13092
G1 X196.909 Y122.499 E.14431
G1 X195.95 Y123.457 E.04495
G1 X195.95 Y124.867 E.04675
G1 X201.535 Y130.451 E.26199
G1 X203.163 Y130.451 E.05401
; WIPE_START
G1 F24000
G1 X201.535 Y130.451 E-.61876
G1 X201.272 Y130.188 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I1.132 J-.447 P1  F30000
G1 X195.602 Y115.849 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3786
G1 X195.602 Y107.2 E.28689
G1 X204.398 Y107.2 E.29177
G1 X204.398 Y115.849 E.28689
G1 X195.662 Y115.849 E.28978
G1 X195.21 Y116.241 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3786
G1 X195.21 Y106.808 E.28984
G1 X204.79 Y106.808 E.29437
G1 X204.79 Y116.241 E.28984
G1 X195.27 Y116.241 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.257 Y114.241 E-.76
; WIPE_END
M73 P85 R7
G1 E-.04 F1800
G17
G3 Z12.8 I.153 J1.207 P1  F30000
G1 X195.95 Y114.153 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3786
G1 X195.95 Y115.501 E.04471
G1 X196.231 Y115.501 E.00931
G1 X204.05 Y107.682 E.36679
G1 X204.05 Y109.938 E.07483
G1 X201.66 Y107.549 E.11209
G1 X196.507 Y107.549 E.17094
G1 X195.95 Y108.105 E.02612
G1 X195.95 Y109.515 E.04675
G1 X201.936 Y115.501 E.28082
G1 X203.565 Y115.501 E.05401
; WIPE_START
G1 F24000
G1 X201.936 Y115.501 E-.61876
G1 X201.674 Y115.238 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I-.005 J-1.217 P1  F30000
G1 X64.398 Y115.849 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3786
G1 X55.602 Y115.849 E.29177
G1 X55.602 Y107.2 E.28689
G1 X64.398 Y107.2 E.29177
G1 X64.398 Y115.789 E.2849
G1 X64.79 Y116.241 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3786
G1 X55.21 Y116.241 E.29437
G1 X55.21 Y106.808 E.28984
G1 X64.79 Y106.808 E.29437
G1 X64.79 Y116.181 E.288
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y116.194 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I1.036 J.639 P1  F30000
G1 X64.05 Y114.153 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3786
G1 X64.05 Y115.501 E.04471
G1 X63.769 Y115.501 E.00931
G1 X55.95 Y107.682 E.36679
G1 X55.95 Y109.938 E.07483
G1 X58.34 Y107.549 E.11209
G1 X63.493 Y107.549 E.17094
G1 X64.05 Y108.105 E.02612
G1 X64.05 Y109.515 E.04675
G1 X58.064 Y115.501 E.28082
G1 X56.435 Y115.501 E.05401
; WIPE_START
G1 F24000
G1 X58.064 Y115.501 E-.61876
G1 X58.326 Y115.238 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I-.914 J.803 P1  F30000
G1 X64.398 Y122.151 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3786
G1 X64.398 Y130.8 E.28689
G1 X55.602 Y130.8 E.29177
G1 X55.602 Y122.151 E.28689
G1 X64.338 Y122.151 E.28978
G1 X64.79 Y121.759 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3786
G1 X64.79 Y131.192 E.28984
G1 X55.21 Y131.192 E.29437
G1 X55.21 Y121.759 E.28984
G1 X64.73 Y121.759 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.743 Y123.759 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I-1.208 J-.146 P1  F30000
G1 X64.05 Y129.505 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3786
G1 X64.05 Y130.451 E.03139
G1 X63.368 Y130.451 E.02263
G1 X55.95 Y123.034 E.34796
G1 X55.95 Y125.29 E.07483
G1 X58.741 Y122.499 E.13092
G1 X63.091 Y122.499 E.14431
G1 X64.05 Y123.457 E.04495
G1 X64.05 Y124.867 E.04675
G1 X58.465 Y130.451 E.26199
G1 X56.837 Y130.451 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X58.465 Y130.451 E-.61876
G1 X58.728 Y130.188 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/105
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
G3 Z12.8 I.071 J1.215 P1  F30000
G1 X195.602 Y122.223 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3748
G1 X204.398 Y122.223 E.29177
G1 X204.398 Y130.686 E.28073
G1 X195.602 Y130.686 E.29177
G1 X195.602 Y122.283 E.27874
G1 X195.21 Y121.831 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3748
G1 X204.79 Y121.831 E.29437
G1 X204.79 Y131.078 E.28414
G1 X195.21 Y131.078 E.29437
G1 X195.21 Y121.891 E.2823
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y121.879 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I-1.201 J-.198 P1  F30000
G1 X195.95 Y129.505 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3748
G1 X195.95 Y130.338 E.02763
G1 X196.746 Y130.338 E.02639
G1 X204.05 Y123.034 E.34264
G1 X204.05 Y125.29 E.07483
G1 X201.331 Y122.571 E.12753
G1 X196.836 Y122.571 E.1491
G1 X195.95 Y123.457 E.04156
G1 X195.95 Y124.867 E.04675
G1 X201.422 Y130.338 E.25667
G1 X203.05 Y130.338 E.05401
; WIPE_START
G1 F24000
G1 X201.422 Y130.338 E-.61876
G1 X201.159 Y130.075 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I1.134 J-.441 P1  F30000
G1 X195.602 Y115.777 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3748
G1 X195.602 Y107.314 E.28073
G1 X204.398 Y107.314 E.29177
G1 X204.398 Y115.777 E.28073
G1 X195.662 Y115.777 E.28978
G1 X195.21 Y116.169 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3748
G1 X195.21 Y106.922 E.28414
G1 X204.79 Y106.922 E.29437
G1 X204.79 Y116.169 E.28414
G1 X195.27 Y116.169 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.257 Y114.169 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I.028 J1.217 P1  F30000
G1 X195.95 Y114.153 Z13
G1 Z12.6
M73 P85 R6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3748
G1 X195.95 Y115.429 E.04231
G1 X196.303 Y115.429 E.01171
G1 X204.05 Y107.682 E.3634
G1 X204.05 Y109.938 E.07483
G1 X201.774 Y107.662 E.10677
G1 X196.394 Y107.662 E.17846
G1 X195.95 Y108.105 E.0208
G1 X195.95 Y109.515 E.04675
G1 X201.864 Y115.429 E.27743
G1 X203.492 Y115.429 E.05401
; WIPE_START
G1 F24000
G1 X201.864 Y115.429 E-.61876
G1 X201.601 Y115.166 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I-.005 J-1.217 P1  F30000
G1 X64.398 Y115.777 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3748
G1 X55.602 Y115.777 E.29177
G1 X55.602 Y107.314 E.28073
G1 X64.398 Y107.314 E.29177
G1 X64.398 Y115.717 E.27874
G1 X64.79 Y116.169 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3748
G1 X55.21 Y116.169 E.29437
G1 X55.21 Y106.922 E.28414
G1 X64.79 Y106.922 E.29437
G1 X64.79 Y116.109 E.2823
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y116.121 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I1.025 J.656 P1  F30000
G1 X64.05 Y114.153 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3748
G1 X64.05 Y115.429 E.04231
G1 X63.697 Y115.429 E.01171
G1 X55.95 Y107.682 E.3634
G1 X55.95 Y109.938 E.07483
G1 X58.226 Y107.662 E.10677
G1 X63.606 Y107.662 E.17846
G1 X64.05 Y108.105 E.0208
G1 X64.05 Y109.515 E.04675
G1 X58.136 Y115.429 E.27743
G1 X56.508 Y115.429 E.05401
; WIPE_START
G1 F24000
G1 X58.136 Y115.429 E-.61876
G1 X58.399 Y115.166 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I-.927 J.788 P1  F30000
G1 X64.398 Y122.223 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3748
G1 X64.398 Y130.686 E.28073
G1 X55.602 Y130.686 E.29177
G1 X55.602 Y122.223 E.28073
G1 X64.338 Y122.223 E.28978
G1 X64.79 Y121.831 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3748
G1 X64.79 Y131.078 E.28414
G1 X55.21 Y131.078 E.29437
G1 X55.21 Y121.831 E.28414
G1 X64.73 Y121.831 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.743 Y123.831 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I-1.208 J-.148 P1  F30000
G1 X64.05 Y129.505 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3748
G1 X64.05 Y130.338 E.02763
G1 X63.254 Y130.338 E.02638
G1 X55.95 Y123.034 E.34264
G1 X55.95 Y125.29 E.07483
G1 X58.669 Y122.571 E.12753
G1 X63.164 Y122.571 E.1491
G1 X64.05 Y123.457 E.04156
G1 X64.05 Y124.867 E.04675
G1 X58.578 Y130.338 E.25667
G1 X56.95 Y130.338 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X58.578 Y130.338 E-.61876
G1 X58.841 Y130.075 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/105
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
G3 Z13 I.069 J1.215 P1  F30000
G1 X195.602 Y122.278 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3705
G1 X204.398 Y122.278 E.29177
G1 X204.398 Y130.56 E.27471
G1 X195.602 Y130.56 E.29177
G1 X195.602 Y122.338 E.27272
G1 X195.21 Y121.886 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3705
G1 X204.79 Y121.886 E.29437
G1 X204.79 Y130.952 E.27856
G1 X195.21 Y130.952 E.29437
G1 X195.21 Y121.946 E.27672
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y121.933 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-.609 J1.054 P1  F30000
G1 X198.41 Y122.626 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3705
G1 X196.781 Y122.626 E.05401
G1 X195.95 Y123.457 E.03899
G1 X195.95 Y124.867 E.04675
G1 X201.295 Y130.211 E.25073
G1 X196.872 Y130.211 E.14671
G1 X204.05 Y123.034 E.3367
G1 X204.05 Y125.29 E.07483
G1 X201.386 Y122.626 E.12496
G1 X199.758 Y122.626 E.05401
; WIPE_START
G1 F24000
G1 X201.386 Y122.626 E-.61876
G1 X201.649 Y122.889 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I.93 J-.785 P1  F30000
G1 X195.602 Y115.722 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3705
G1 X195.602 Y107.44 E.27471
G1 X204.398 Y107.44 E.29177
G1 X204.398 Y115.722 E.27471
G1 X195.662 Y115.722 E.28978
G1 X195.21 Y116.114 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3705
G1 X195.21 Y107.048 E.27856
G1 X204.79 Y107.048 E.29437
G1 X204.79 Y116.114 E.27856
G1 X195.27 Y116.114 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.257 Y114.114 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I1.123 J.469 P1  F30000
G1 X197.895 Y107.789 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3705
G1 X196.267 Y107.789 E.05401
G1 X195.95 Y108.105 E.01486
G1 X195.95 Y109.515 E.04675
G1 X201.809 Y115.374 E.27486
G1 X196.358 Y115.374 E.18083
G1 X203.943 Y107.789 E.35583
G1 X201.9 Y107.789 E.06776
G1 X204.05 Y109.938 E.10083
G1 X204.05 Y111.566 E.05401
; WIPE_START
G1 F24000
G1 X204.05 Y109.938 E-.61876
G1 X203.787 Y109.675 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-.053 J-1.216 P1  F30000
G1 X64.398 Y115.722 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3705
G1 X55.602 Y115.722 E.29177
G1 X55.602 Y107.44 E.27471
G1 X64.398 Y107.44 E.29177
G1 X64.398 Y115.662 E.27272
G1 X64.79 Y116.114 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3705
G1 X55.21 Y116.114 E.29437
G1 X55.21 Y107.048 E.27856
G1 X64.79 Y107.048 E.29437
G1 X64.79 Y116.054 E.27672
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y116.067 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I1.213 J-.1 P1  F30000
G1 X62.105 Y107.789 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3705
G1 X63.733 Y107.789 E.05401
G1 X64.05 Y108.105 E.01486
G1 X64.05 Y109.515 E.04675
G1 X58.191 Y115.374 E.27486
G1 X63.642 Y115.374 E.18083
G1 X56.057 Y107.789 E.35583
G1 X58.1 Y107.789 E.06776
G1 X55.95 Y109.938 E.10083
G1 X55.95 Y111.566 E.05401
; WIPE_START
G1 F24000
G1 X55.95 Y109.938 E-.61876
G1 X56.213 Y109.675 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-1.021 J.663 P1  F30000
G1 X64.398 Y122.278 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3705
G1 X64.398 Y130.56 E.27471
G1 X55.602 Y130.56 E.29177
G1 X55.602 Y122.278 E.27471
G1 X64.338 Y122.278 E.28978
G1 X64.79 Y121.886 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3705
G1 X64.79 Y130.952 E.27856
G1 X55.21 Y130.952 E.29437
G1 X55.21 Y121.886 E.27856
G1 X64.73 Y121.886 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.743 Y123.886 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I.451 J-1.13 P1  F30000
G1 X61.59 Y122.626 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3705
G1 X63.219 Y122.626 E.05401
G1 X64.05 Y123.457 E.03899
G1 X64.05 Y124.867 E.04675
G1 X58.705 Y130.211 E.25073
G1 X63.128 Y130.211 E.14671
G1 X55.95 Y123.034 E.3367
G1 X55.95 Y125.29 E.07483
G1 X58.614 Y122.626 E.12496
G1 X56.986 Y122.626 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X58.614 Y122.626 E-.61876
G1 X58.351 Y122.889 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/105
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
G3 Z13.2 I.005 J1.217 P1  F30000
G1 X195.602 Y122.318 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3648
G1 X204.398 Y122.318 E.29177
G1 X204.398 Y130.419 E.26874
G1 X195.602 Y130.419 E.29177
G1 X195.602 Y122.378 E.26675
G1 X195.21 Y121.926 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3648
G1 X204.79 Y121.926 E.29437
G1 X204.79 Y130.811 E.27303
G1 X195.21 Y130.811 E.29437
G1 X195.21 Y121.986 E.27119
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y121.973 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-.624 J1.045 P1  F30000
G1 X198.37 Y122.666 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3648
G1 X196.742 Y122.666 E.05401
G1 X195.95 Y123.457 E.03713
G1 X195.95 Y124.867 E.04675
G1 X201.155 Y130.071 E.24414
G1 X197.013 Y130.071 E.13739
G1 X204.05 Y123.034 E.33012
G1 X204.05 Y125.29 E.07483
G1 X201.426 Y122.666 E.1231
G1 X199.797 Y122.666 E.05401
; WIPE_START
G1 F24000
G1 X201.426 Y122.666 E-.61876
G1 X201.688 Y122.929 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I.932 J-.783 P1  F30000
G1 X195.602 Y115.682 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3648
G1 X195.602 Y107.581 E.26874
G1 X204.398 Y107.581 E.29177
G1 X204.398 Y115.682 E.26874
G1 X195.662 Y115.682 E.28978
G1 X195.21 Y116.074 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3648
G1 X195.21 Y107.189 E.27303
G1 X204.79 Y107.189 E.29437
G1 X204.79 Y116.074 E.27303
G1 X195.27 Y116.074 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.256 Y114.074 E-.76
; WIPE_END
M73 P86 R6
G1 E-.04 F1800
G17
G3 Z13.4 I1.127 J.458 P1  F30000
G1 X197.755 Y107.929 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3648
G1 X196.127 Y107.929 E.05401
G1 X195.95 Y108.105 E.00828
G1 X195.95 Y109.515 E.04675
G1 X201.77 Y115.334 E.273
G1 X196.398 Y115.334 E.1782
G1 X203.803 Y107.929 E.34738
G1 X202.041 Y107.929 E.05845
G1 X204.05 Y109.938 E.09425
G1 X204.05 Y111.566 E.05401
; WIPE_START
G1 F24000
G1 X204.05 Y109.938 E-.61876
G1 X203.787 Y109.675 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-.052 J-1.216 P1  F30000
G1 X64.398 Y115.682 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3648
G1 X55.602 Y115.682 E.29177
G1 X55.602 Y107.581 E.26874
G1 X64.398 Y107.581 E.29177
G1 X64.398 Y115.622 E.26675
G1 X64.79 Y116.074 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3648
G1 X55.21 Y116.074 E.29437
G1 X55.21 Y107.189 E.27303
G1 X64.79 Y107.189 E.29437
G1 X64.79 Y116.014 E.27119
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y116.027 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I1.214 J-.082 P1  F30000
G1 X62.245 Y107.929 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3648
G1 X63.873 Y107.929 E.05401
G1 X64.05 Y108.105 E.00828
G1 X64.05 Y109.515 E.04675
G1 X58.23 Y115.334 E.273
G1 X63.602 Y115.334 E.1782
G1 X56.197 Y107.929 E.34738
G1 X57.959 Y107.929 E.05845
G1 X55.95 Y109.938 E.09425
G1 X55.95 Y111.566 E.05401
; WIPE_START
G1 F24000
G1 X55.95 Y109.938 E-.61876
G1 X56.213 Y109.675 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-1.022 J.661 P1  F30000
G1 X64.398 Y122.318 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3648
G1 X64.398 Y130.419 E.26874
G1 X55.602 Y130.419 E.29177
G1 X55.602 Y122.318 E.26874
G1 X64.338 Y122.318 E.28978
G1 X64.79 Y121.926 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3648
G1 X64.79 Y130.811 E.27303
G1 X55.21 Y130.811 E.29437
G1 X55.21 Y121.926 E.27303
G1 X64.73 Y121.926 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.744 Y123.926 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I.456 J-1.128 P1  F30000
G1 X61.63 Y122.666 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3648
G1 X63.258 Y122.666 E.05401
G1 X64.05 Y123.457 E.03713
G1 X64.05 Y124.867 E.04675
G1 X58.845 Y130.071 E.24414
G1 X62.987 Y130.071 E.13739
G1 X55.95 Y123.034 E.33012
G1 X55.95 Y125.29 E.07483
G1 X58.574 Y122.666 E.1231
G1 X60.203 Y122.666 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X58.574 Y122.666 E-.61876
G1 X58.312 Y122.929 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/105
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
G3 Z13.4 I.005 J1.217 P1  F30000
G1 X195.602 Y122.342 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3565
G1 X204.398 Y122.342 E.29177
G1 X204.398 Y130.264 E.26279
G1 X195.602 Y130.264 E.29177
G1 X195.602 Y122.402 E.2608
G1 X195.21 Y121.95 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3565
G1 X204.79 Y121.95 E.29437
G1 X204.79 Y130.656 E.26752
G1 X195.21 Y130.656 E.29437
G1 X195.21 Y122.01 E.26567
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y121.997 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-.634 J1.039 P1  F30000
G1 X198.346 Y122.69 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3565
G1 X196.718 Y122.69 E.05401
G1 X195.95 Y123.457 E.036
G1 X195.95 Y124.867 E.04675
G1 X200.999 Y129.915 E.23685
G1 X197.168 Y129.915 E.12708
G1 X204.05 Y123.034 E.32282
G1 X204.05 Y125.29 E.07483
G1 X201.45 Y122.69 E.12198
G1 X199.821 Y122.69 E.05401
; WIPE_START
G1 F24000
G1 X201.45 Y122.69 E-.61876
G1 X201.712 Y122.953 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I.933 J-.781 P1  F30000
G1 X195.602 Y115.658 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3565
G1 X195.602 Y107.736 E.26279
G1 X204.398 Y107.736 E.29177
G1 X204.398 Y115.658 E.26279
G1 X195.662 Y115.658 E.28978
G1 X195.21 Y116.05 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3565
G1 X195.21 Y107.344 E.26752
G1 X204.79 Y107.344 E.29437
G1 X204.79 Y116.05 E.26752
G1 X195.27 Y116.05 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.256 Y114.05 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I1.204 J.18 P1  F30000
G1 X196.149 Y108.085 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3565
G1 X195.95 Y108.085 E.00657
G1 X195.95 Y109.515 E.04744
G1 X201.746 Y115.31 E.27187
G1 X196.422 Y115.31 E.17661
G1 X203.647 Y108.085 E.33896
G1 X202.196 Y108.085 E.04813
G1 X204.05 Y109.938 E.08695
G1 X204.05 Y111.566 E.05401
; WIPE_START
G1 F24000
G1 X204.05 Y109.938 E-.61876
G1 X203.787 Y109.675 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-.052 J-1.216 P1  F30000
G1 X64.398 Y115.658 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3565
G1 X55.602 Y115.658 E.29177
G1 X55.602 Y107.736 E.26279
G1 X64.398 Y107.736 E.29177
G1 X64.398 Y115.598 E.2608
G1 X64.79 Y116.05 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3565
G1 X55.21 Y116.05 E.29437
G1 X55.21 Y107.344 E.26752
G1 X64.79 Y107.344 E.29437
G1 X64.79 Y115.99 E.26567
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y116.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I1.206 J.162 P1  F30000
G1 X63.851 Y108.085 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3565
G1 X64.05 Y108.085 E.00657
G1 X64.05 Y109.515 E.04744
G1 X58.254 Y115.31 E.27187
G1 X63.578 Y115.31 E.17661
G1 X56.353 Y108.085 E.33896
G1 X57.804 Y108.085 E.04813
G1 X55.95 Y109.938 E.08695
G1 X55.95 Y111.566 E.05401
; WIPE_START
G1 F24000
G1 X55.95 Y109.938 E-.61876
G1 X56.213 Y109.675 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-1.022 J.66 P1  F30000
G1 X64.398 Y122.342 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3565
G1 X64.398 Y130.264 E.26279
G1 X55.602 Y130.264 E.29177
G1 X55.602 Y122.342 E.26279
G1 X64.338 Y122.342 E.28978
G1 X64.79 Y121.95 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3565
G1 X64.79 Y130.656 E.26752
G1 X55.21 Y130.656 E.29437
G1 X55.21 Y121.95 E.26752
G1 X64.73 Y121.95 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.744 Y123.95 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I.459 J-1.127 P1  F30000
G1 X61.654 Y122.69 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3565
G1 X63.282 Y122.69 E.05401
G1 X64.05 Y123.457 E.036
G1 X64.05 Y124.867 E.04675
G1 X59.001 Y129.915 E.23685
G1 X62.832 Y129.915 E.12708
G1 X55.95 Y123.034 E.32282
G1 X55.95 Y125.29 E.07483
G1 X58.55 Y122.69 E.12198
G1 X60.179 Y122.69 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X58.55 Y122.69 E-.61876
G1 X58.288 Y122.953 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/105
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
G3 Z13.6 I.005 J1.217 P1  F30000
G1 X195.602 Y122.351 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3509
G1 X204.398 Y122.351 E.29177
G1 X204.398 Y130.09 E.25671
G1 X195.602 Y130.09 E.29177
G1 X195.602 Y122.411 E.25472
G1 X195.21 Y121.959 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3509
G1 X204.79 Y121.959 E.29437
G1 X204.79 Y130.482 E.26188
G1 X195.21 Y130.482 E.29437
G1 X195.21 Y122.019 E.26004
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y122.007 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-.638 J1.037 P1  F30000
G1 X198.336 Y122.7 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3509
G1 X196.708 Y122.7 E.05401
G1 X195.95 Y123.457 E.03555
G1 X195.95 Y124.867 E.04675
G1 X200.825 Y129.742 E.2287
G1 X197.342 Y129.742 E.11556
G1 X204.05 Y123.034 E.31467
G1 X204.05 Y125.29 E.07483
G1 X201.459 Y122.7 E.12152
G1 X199.831 Y122.7 E.05401
; WIPE_START
G1 F24000
G1 X201.459 Y122.7 E-.61876
G1 X201.722 Y122.962 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I.933 J-.781 P1  F30000
G1 X195.602 Y115.649 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3509
G1 X195.602 Y107.91 E.25671
G1 X204.398 Y107.91 E.29177
G1 X204.398 Y115.649 E.25671
G1 X195.662 Y115.649 E.28978
G1 X195.21 Y116.041 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3509
G1 X195.21 Y107.518 E.26188
G1 X204.79 Y107.518 E.29437
G1 X204.79 Y116.041 E.26188
G1 X195.27 Y116.041 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.256 Y114.041 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I1.197 J.221 P1  F30000
G1 X196.322 Y108.258 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3509
G1 X195.95 Y108.258 E.01233
G1 X195.95 Y109.515 E.04168
G1 X201.736 Y115.3 E.27142
G1 X196.431 Y115.3 E.17597
G1 X203.474 Y108.258 E.33036
G1 X202.37 Y108.258 E.03661
G1 X204.05 Y109.938 E.07881
G1 X204.05 Y111.566 E.05401
; WIPE_START
G1 F24000
G1 X204.05 Y109.938 E-.61876
G1 X203.787 Y109.675 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-.052 J-1.216 P1  F30000
G1 X64.398 Y115.649 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3509
G1 X55.602 Y115.649 E.29177
G1 X55.602 Y107.91 E.25671
G1 X64.398 Y107.91 E.29177
G1 X64.398 Y115.589 E.25472
G1 X64.79 Y116.041 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3509
G1 X55.21 Y116.041 E.29437
G1 X55.21 Y107.518 E.26188
G1 X64.79 Y107.518 E.29437
G1 X64.79 Y115.981 E.26004
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y115.993 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I1.209 J.139 P1  F30000
G1 X63.678 Y108.258 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3509
G1 X64.05 Y108.258 E.01233
G1 X64.05 Y109.515 E.04168
G1 X58.264 Y115.3 E.27142
G1 X63.569 Y115.3 E.17597
G1 X56.526 Y108.258 E.33036
G1 X57.63 Y108.258 E.03661
G1 X55.95 Y109.938 E.0788
G1 X55.95 Y111.566 E.05401
; WIPE_START
G1 F24000
G1 X55.95 Y109.938 E-.61876
G1 X56.213 Y109.675 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-1.022 J.66 P1  F30000
G1 X64.398 Y122.351 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3509
G1 X64.398 Y130.09 E.25671
G1 X55.602 Y130.09 E.29177
G1 X55.602 Y122.351 E.25671
G1 X64.338 Y122.351 E.28978
G1 X64.79 Y121.959 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3509
G1 X64.79 Y130.482 E.26188
G1 X55.21 Y130.482 E.29437
G1 X55.21 Y121.959 E.26188
G1 X64.73 Y121.959 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.744 Y123.959 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I.461 J-1.126 P1  F30000
G1 X61.664 Y122.7 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3509
G1 X63.292 Y122.7 E.05401
G1 X64.05 Y123.457 E.03555
G1 X64.05 Y124.867 E.04675
G1 X59.175 Y129.742 E.2287
G1 X62.658 Y129.742 E.11556
G1 X55.95 Y123.034 E.31467
G1 X55.95 Y125.29 E.07483
G1 X58.541 Y122.7 E.12152
G1 X60.169 Y122.7 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X58.541 Y122.7 E-.61876
G1 X58.278 Y122.962 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/105
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
G3 Z13.8 I.005 J1.217 P1  F30000
G1 X195.602 Y122.346 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3681
G1 X204.398 Y122.346 E.29177
G1 X204.398 Y129.898 E.2505
G1 X195.602 Y129.898 E.29177
G1 X195.602 Y122.406 E.24851
G1 X195.21 Y121.954 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3681
G1 X204.79 Y121.954 E.29437
G1 X204.79 Y130.29 E.25614
G1 X195.21 Y130.29 E.29437
G1 X195.21 Y122.014 E.25429
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y122.002 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-.635 J1.038 P1  F30000
G1 X198.342 Y122.694 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3681
G1 X196.713 Y122.694 E.05401
G1 X195.95 Y123.457 E.03579
G1 X195.95 Y124.867 E.04675
G1 X200.115 Y129.031 E.19535
G1 X198.053 Y129.031 E.06839
G1 X204.05 Y123.034 E.28132
G1 X204.05 Y125.29 E.07483
G1 X201.454 Y122.694 E.12176
G1 X199.826 Y122.694 E.05401
G1 X196.04 Y129.464 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3681
G1 X203.9 Y129.464 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y129.464 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I1.107 J-.505 P1  F30000
G1 X195.602 Y115.654 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3681
G1 X195.602 Y108.102 E.2505
G1 X204.398 Y108.102 E.29177
G1 X204.398 Y115.654 E.2505
G1 X195.662 Y115.654 E.28978
G1 X195.21 Y116.046 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3681
G1 X195.21 Y107.71 E.25614
M73 P87 R6
G1 X204.79 Y107.71 E.29437
G1 X204.79 Y116.046 E.25614
G1 X195.27 Y116.046 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.256 Y114.046 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I1.149 J.402 P1  F30000
G1 X197.033 Y108.969 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3681
G1 X195.95 Y108.969 E.03592
G1 X195.95 Y109.515 E.0181
G1 X201.741 Y115.305 E.27166
G1 X196.426 Y115.305 E.1763
G1 X202.763 Y108.969 E.29725
G1 X203.081 Y108.969 E.01055
G1 X204.05 Y109.938 E.04545
G1 X204.05 Y111.566 E.05401
G1 X196.04 Y108.536 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3681
G1 X203.9 Y108.536 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y108.536 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-.063 J-1.215 P1  F30000
G1 X64.398 Y115.654 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3681
G1 X55.602 Y115.654 E.29177
G1 X55.602 Y108.102 E.2505
G1 X64.398 Y108.102 E.29177
G1 X64.398 Y115.594 E.24851
G1 X64.79 Y116.046 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3681
G1 X55.21 Y116.046 E.29437
G1 X55.21 Y107.71 E.25614
G1 X64.79 Y107.71 E.29437
G1 X64.79 Y115.986 E.25429
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y115.998 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I1.217 J.031 P1  F30000
G1 X62.967 Y108.969 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3681
G1 X64.05 Y108.969 E.03592
G1 X64.05 Y109.515 E.0181
G1 X58.259 Y115.305 E.27166
G1 X63.574 Y115.305 E.1763
G1 X57.237 Y108.969 E.29725
G1 X56.919 Y108.969 E.01055
G1 X55.95 Y109.938 E.04545
G1 X55.95 Y111.566 E.05401
G1 X56.04 Y108.536 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3681
G1 X63.9 Y108.536 E.29465
; WIPE_START
G1 F24000
G1 X61.9 Y108.536 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-1.198 J.217 P1  F30000
G1 X64.398 Y122.346 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3681
G1 X64.398 Y129.898 E.2505
G1 X55.602 Y129.898 E.29177
G1 X55.602 Y122.346 E.2505
G1 X64.338 Y122.346 E.28978
G1 X64.79 Y121.954 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3681
G1 X64.79 Y130.29 E.25614
G1 X55.21 Y130.29 E.29437
G1 X55.21 Y121.954 E.25614
G1 X64.73 Y121.954 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.744 Y123.954 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I.46 J-1.127 P1  F30000
G1 X61.658 Y122.694 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3681
G1 X63.287 Y122.694 E.05401
G1 X64.05 Y123.457 E.03579
G1 X64.05 Y124.867 E.04675
G1 X59.885 Y129.031 E.19535
G1 X61.947 Y129.031 E.06839
G1 X55.95 Y123.034 E.28132
G1 X55.95 Y125.29 E.07483
G1 X58.546 Y122.694 E.12176
G1 X60.174 Y122.694 E.05401
G1 X56.04 Y129.464 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3681
G1 X63.9 Y129.464 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X61.9 Y129.464 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/105
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
G3 Z14 I.065 J1.215 P1  F30000
G1 X195.602 Y122.326 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3634
G1 X204.398 Y122.326 E.29177
G1 X204.398 Y129.698 E.24453
G1 X195.602 Y129.698 E.29177
G1 X195.602 Y122.386 E.24254
G1 X195.21 Y121.934 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3634
G1 X204.79 Y121.934 E.29437
G1 X204.79 Y130.09 E.2506
G1 X195.21 Y130.09 E.29437
G1 X195.21 Y121.994 E.24876
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y121.982 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-.627 J1.043 P1  F30000
G1 X198.361 Y122.675 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3634
G1 X196.733 Y122.675 E.05401
G1 X195.95 Y123.457 E.03672
G1 X195.95 Y124.867 E.04675
G1 X199.915 Y128.831 E.18597
G1 X198.253 Y128.831 E.05512
G1 X204.05 Y123.034 E.27194
G1 X204.05 Y125.29 E.07483
G1 X201.434 Y122.675 E.12269
G1 X199.806 Y122.675 E.05401
G1 X196.04 Y129.264 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3634
G1 X203.9 Y129.264 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y129.264 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I1.104 J-.512 P1  F30000
G1 X195.602 Y115.674 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3634
G1 X195.602 Y108.302 E.24453
G1 X204.398 Y108.302 E.29177
G1 X204.398 Y115.674 E.24453
G1 X195.662 Y115.674 E.28978
G1 X195.21 Y116.066 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3634
G1 X195.21 Y107.91 E.2506
G1 X204.79 Y107.91 E.29437
G1 X204.79 Y116.066 E.2506
G1 X195.27 Y116.066 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.255 Y114.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I1.128 J.456 P1  F30000
G1 X197.233 Y109.169 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3634
G1 X195.95 Y109.169 E.04255
G1 X195.95 Y109.515 E.01146
G1 X201.761 Y115.325 E.27259
G1 X196.406 Y115.325 E.17762
G1 X202.563 Y109.169 E.2888
G1 X203.281 Y109.169 E.02382
G1 X204.05 Y109.938 E.03607
G1 X204.05 Y111.566 E.05401
G1 X196.04 Y108.736 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3634
G1 X203.9 Y108.736 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y108.736 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-.061 J-1.215 P1  F30000
G1 X64.398 Y115.674 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3634
G1 X55.602 Y115.674 E.29177
G1 X55.602 Y108.302 E.24453
G1 X64.398 Y108.302 E.29177
G1 X64.398 Y115.614 E.24254
G1 X64.79 Y116.066 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3634
G1 X55.21 Y116.066 E.29437
G1 X55.21 Y107.91 E.2506
G1 X64.79 Y107.91 E.29437
G1 X64.79 Y116.006 E.24876
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y116.018 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I1.217 J-.004 P1  F30000
G1 X62.767 Y109.169 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P87 R5
G1 F3634
G1 X64.05 Y109.169 E.04255
G1 X64.05 Y109.515 E.01146
G1 X58.239 Y115.325 E.27259
G1 X63.594 Y115.325 E.17762
G1 X57.437 Y109.169 E.2888
G1 X56.719 Y109.169 E.02382
G1 X55.95 Y109.938 E.03607
G1 X55.95 Y111.566 E.05401
G1 X56.04 Y108.736 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3634
G1 X63.9 Y108.736 E.29465
; WIPE_START
G1 F24000
G1 X61.9 Y108.736 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-1.197 J.22 P1  F30000
G1 X64.398 Y122.326 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3634
G1 X64.398 Y129.698 E.24453
G1 X55.602 Y129.698 E.29177
G1 X55.602 Y122.326 E.24453
G1 X64.338 Y122.326 E.28978
G1 X64.79 Y121.934 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3634
G1 X64.79 Y130.09 E.2506
G1 X55.21 Y130.09 E.29437
G1 X55.21 Y121.934 E.2506
G1 X64.73 Y121.934 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.745 Y123.934 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I.457 J-1.128 P1  F30000
G1 X61.639 Y122.675 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3634
G1 X63.267 Y122.675 E.05401
G1 X64.05 Y123.457 E.03672
G1 X64.05 Y124.867 E.04675
G1 X60.085 Y128.831 E.18597
G1 X61.747 Y128.831 E.05512
G1 X55.95 Y123.034 E.27194
G1 X55.95 Y125.29 E.07483
G1 X58.566 Y122.675 E.12269
G1 X60.194 Y122.675 E.05401
G1 X56.04 Y129.264 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3634
G1 X63.9 Y129.264 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X61.9 Y129.264 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/105
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
G3 Z14.2 I.063 J1.215 P1  F30000
G1 X195.602 Y122.292 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3593
G1 X204.398 Y122.292 E.29177
G1 X204.398 Y129.498 E.23904
G1 X195.602 Y129.498 E.29177
G1 X195.602 Y122.352 E.23705
G1 X195.21 Y121.9 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3593
G1 X204.79 Y121.9 E.29437
G1 X204.79 Y129.89 E.24551
G1 X195.21 Y129.89 E.29437
G1 X195.21 Y121.96 E.24367
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y121.947 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-.614 J1.051 P1  F30000
G1 X198.396 Y122.64 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3593
G1 X196.768 Y122.64 E.05401
G1 X195.95 Y123.457 E.03834
G1 X195.95 Y124.867 E.04675
G1 X199.715 Y128.631 E.17659
G1 X198.453 Y128.631 E.04185
G1 X204.05 Y123.034 E.26256
G1 X204.05 Y125.29 E.07483
G1 X201.4 Y122.64 E.12431
G1 X199.772 Y122.64 E.05401
G1 X196.04 Y129.064 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3593
G1 X203.9 Y129.064 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y129.064 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I1.101 J-.519 P1  F30000
G1 X195.602 Y115.708 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3593
G1 X195.602 Y108.502 E.23904
G1 X204.398 Y108.502 E.29177
G1 X204.398 Y115.708 E.23904
G1 X195.662 Y115.708 E.28978
G1 X195.21 Y116.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3593
G1 X195.21 Y108.11 E.24551
G1 X204.79 Y108.11 E.29437
G1 X204.79 Y116.1 E.24551
G1 X195.27 Y116.1 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.255 Y114.1 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I1.105 J.509 P1  F30000
G1 X197.433 Y109.369 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3593
G1 X195.95 Y109.369 E.04919
G1 X195.95 Y109.515 E.00483
G1 X201.795 Y115.36 E.2742
G1 X196.372 Y115.36 E.17991
G1 X202.363 Y109.369 E.28103
G1 X203.481 Y109.369 E.03709
G1 X204.05 Y109.938 E.02669
G1 X204.05 Y111.566 E.05401
G1 X196.04 Y108.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3593
G1 X203.9 Y108.936 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y108.936 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-.06 J-1.215 P1  F30000
G1 X64.398 Y115.708 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3593
G1 X55.602 Y115.708 E.29177
G1 X55.602 Y108.502 E.23904
G1 X64.398 Y108.502 E.29177
G1 X64.398 Y115.648 E.23705
G1 X64.79 Y116.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3593
G1 X55.21 Y116.1 E.29437
G1 X55.21 Y108.11 E.24551
G1 X64.79 Y108.11 E.29437
G1 X64.79 Y116.04 E.24367
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y116.053 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I1.216 J-.041 P1  F30000
G1 X62.567 Y109.369 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3593
G1 X64.05 Y109.369 E.04919
G1 X64.05 Y109.515 E.00483
G1 X58.205 Y115.36 E.2742
G1 X63.628 Y115.36 E.17991
G1 X57.637 Y109.369 E.28103
G1 X56.519 Y109.369 E.03709
G1 X55.95 Y109.938 E.02669
G1 X55.95 Y111.566 E.05401
G1 X56.04 Y108.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3593
G1 X63.9 Y108.936 E.29465
; WIPE_START
G1 F24000
G1 X61.9 Y108.936 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-1.196 J.224 P1  F30000
G1 X64.398 Y122.292 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3593
G1 X64.398 Y129.498 E.23904
G1 X55.602 Y129.498 E.29177
G1 X55.602 Y122.292 E.23904
G1 X64.338 Y122.292 E.28978
G1 X64.79 Y121.9 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3593
G1 X64.79 Y129.89 E.24551
G1 X55.21 Y129.89 E.29437
G1 X55.21 Y121.9 E.24551
G1 X64.73 Y121.9 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.745 Y123.9 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I.453 J-1.13 P1  F30000
G1 X61.604 Y122.64 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3593
G1 X63.232 Y122.64 E.05401
G1 X64.05 Y123.457 E.03834
G1 X64.05 Y124.867 E.04675
G1 X60.285 Y128.631 E.17659
G1 X61.547 Y128.631 E.04185
G1 X55.95 Y123.034 E.26256
G1 X55.95 Y125.29 E.07483
G1 X58.6 Y122.64 E.12431
G1 X56.972 Y122.64 E.05401
G1 X56.04 Y129.064 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3593
G1 X63.9 Y129.064 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X61.9 Y129.064 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/105
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
G3 Z14.4 I.062 J1.215 P1  F30000
G1 X195.602 Y122.241 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3562
G1 X204.398 Y122.241 E.29177
G1 X204.398 Y129.298 E.23408
G1 X195.602 Y129.298 E.29177
G1 X195.602 Y122.301 E.23209
G1 X195.21 Y121.859 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3562
G1 X204.79 Y121.859 E.29437
G1 X204.79 Y129.69 E.24063
G1 X195.21 Y129.69 E.29437
G1 X195.21 Y121.919 E.23879
M204 S10000
; WIPE_START
G1 F24000
G1 X197.21 Y121.906 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-.589 J1.065 P1  F30000
G1 X198.446 Y122.59 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3562
G1 X196.818 Y122.59 E.05401
G1 X195.95 Y123.457 E.0407
G1 X195.95 Y124.867 E.04675
G1 X199.515 Y128.431 E.1672
G1 X198.653 Y128.431 E.02858
G1 X204.05 Y123.034 E.25318
G1 X204.05 Y125.29 E.07483
G1 X201.349 Y122.59 E.12667
G1 X199.721 Y122.59 E.05401
G1 X196.04 Y128.864 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3562
G1 X203.9 Y128.864 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y128.864 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I1.097 J-.527 P1  F30000
G1 X195.602 Y115.759 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3562
M73 P88 R5
G1 X195.602 Y108.702 E.23408
G1 X204.398 Y108.702 E.29177
G1 X204.398 Y115.759 E.23408
G1 X195.662 Y115.759 E.28978
G1 X195.21 Y116.141 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3562
G1 X195.21 Y108.31 E.24063
G1 X204.79 Y108.31 E.29437
G1 X204.79 Y116.141 E.24063
G1 X195.27 Y116.141 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.255 Y114.141 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I1.185 J.275 P1  F30000
G1 X195.95 Y111.143 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3562
G1 X195.95 Y109.569 E.05221
G1 X196.005 Y109.569 E.00181
G1 X201.846 Y115.41 E.27402
G1 X196.322 Y115.41 E.18325
G1 X202.163 Y109.569 E.27402
G1 X203.681 Y109.569 E.05036
G1 X204.05 Y109.938 E.01731
G1 X204.05 Y111.566 E.05401
G1 X196.04 Y109.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3562
G1 X203.9 Y109.136 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y109.136 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-.059 J-1.216 P1  F30000
G1 X64.398 Y115.759 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3562
G1 X55.602 Y115.759 E.29177
G1 X55.602 Y108.702 E.23408
G1 X64.398 Y108.702 E.29177
G1 X64.398 Y115.699 E.23209
G1 X64.79 Y116.141 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3562
G1 X55.21 Y116.141 E.29437
G1 X55.21 Y108.31 E.24063
G1 X64.79 Y108.31 E.29437
G1 X64.79 Y116.081 E.23879
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y116.094 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I1.179 J.3 P1  F30000
G1 X64.05 Y111.143 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3562
G1 X64.05 Y109.569 E.05221
G1 X63.995 Y109.569 E.00181
G1 X58.154 Y115.41 E.27402
G1 X63.679 Y115.41 E.18325
G1 X57.837 Y109.569 E.27402
G1 X56.319 Y109.569 E.05036
G1 X55.95 Y109.938 E.01731
G1 X55.95 Y111.566 E.05401
G1 X56.04 Y109.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3562
G1 X63.9 Y109.136 E.29465
; WIPE_START
G1 F24000
G1 X61.9 Y109.136 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-1.195 J.228 P1  F30000
G1 X64.398 Y122.241 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3562
G1 X64.398 Y129.298 E.23408
G1 X55.602 Y129.298 E.29177
G1 X55.602 Y122.241 E.23408
G1 X64.338 Y122.241 E.28978
G1 X64.79 Y121.859 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3562
G1 X64.79 Y129.69 E.24063
G1 X55.21 Y129.69 E.29437
G1 X55.21 Y121.859 E.24063
G1 X64.73 Y121.859 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.745 Y123.859 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I.45 J-1.131 P1  F30000
G1 X61.554 Y122.59 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3562
G1 X63.182 Y122.59 E.05401
G1 X64.05 Y123.457 E.0407
G1 X64.05 Y124.867 E.04675
G1 X60.485 Y128.431 E.16721
G1 X61.347 Y128.431 E.02859
G1 X55.95 Y123.034 E.25318
G1 X55.95 Y125.29 E.07483
G1 X58.651 Y122.59 E.12667
G1 X57.022 Y122.59 E.05401
G1 X56.04 Y128.864 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3562
G1 X63.9 Y128.864 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X61.9 Y128.864 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/105
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
G3 Z14.6 I.061 J1.215 P1  F30000
G1 X195.602 Y122.175 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3525
G1 X204.398 Y122.175 E.29177
G1 X204.398 Y129.098 E.22965
G1 X195.602 Y129.098 E.29177
G1 X195.602 Y122.235 E.22766
G1 X195.21 Y121.808 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3525
G1 X195.21 Y121.783 E.00079
G1 X204.79 Y121.783 E.29437
G1 X204.79 Y121.808 E.00079
G1 X204.79 Y129.49 E.23603
G1 X195.21 Y129.49 E.29437
G1 X195.21 Y121.868 E.23419
M204 S10000
; WIPE_START
G1 F24000
G1 X195.21 Y121.783 E-.03252
G1 X197.124 Y121.783 E-.72748
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-.573 J1.074 P1  F30000
G1 X198.513 Y122.523 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3525
G1 X196.885 Y122.523 E.05401
G1 X195.95 Y123.457 E.04383
G1 X195.95 Y124.867 E.04675
G1 X199.315 Y128.231 E.15782
G1 X198.853 Y128.231 E.01532
G1 X204.05 Y123.034 E.24379
G1 X204.05 Y125.29 E.07483
G1 X201.283 Y122.523 E.1298
G1 X199.654 Y122.523 E.05401
G1 X203.96 Y128.664 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502906
G1 F3525
G1 X196.1 Y128.664 E.29465
; WIPE_START
G1 F24000
G1 X198.1 Y128.664 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I1.195 J-.232 P1  F30000
G1 X195.602 Y115.825 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3525
G1 X195.602 Y108.902 E.22965
G1 X204.398 Y108.902 E.29177
G1 X204.398 Y115.825 E.22965
G1 X195.662 Y115.825 E.28978
G1 X195.21 Y116.217 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3525
G1 X195.21 Y116.192 E.00079
G1 X195.21 Y108.51 E.23603
G1 X204.79 Y108.51 E.29437
G1 X204.79 Y116.192 E.23603
G1 X204.79 Y116.217 E.00079
G1 X195.27 Y116.217 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.21 Y116.192 E-.02479
G1 X195.21 Y114.257 E-.73521
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I1.184 J.282 P1  F30000
G1 X195.95 Y111.143 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3525
G1 X195.95 Y109.769 E.04557
G1 X196.205 Y109.769 E.00844
G1 X201.912 Y115.477 E.26776
G1 X196.255 Y115.477 E.18767
G1 X201.963 Y109.769 E.26776
G1 X203.881 Y109.769 E.06363
G1 X204.05 Y109.938 E.00792
G1 X204.05 Y111.566 E.05401
G1 X196.04 Y109.336 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3525
G1 X203.9 Y109.336 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y109.336 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-.057 J-1.216 P1  F30000
G1 X64.398 Y115.825 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3525
G1 X55.602 Y115.825 E.29177
G1 X55.602 Y108.902 E.22965
G1 X64.398 Y108.902 E.29177
G1 X64.398 Y115.765 E.22766
G1 X64.79 Y116.192 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3525
G1 X64.79 Y116.217 E.00079
G1 X55.21 Y116.217 E.29437
G1 X55.21 Y116.192 E.00079
G1 X55.21 Y108.51 E.23603
G1 X64.79 Y108.51 E.29437
G1 X64.79 Y116.132 E.23419
M204 S10000
; WIPE_START
G1 F24000
G1 X64.79 Y116.217 E-.03252
G1 X62.876 Y116.217 E-.72748
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I1.186 J.274 P1  F30000
G1 X64.05 Y111.143 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3525
G1 X64.05 Y109.769 E.04557
G1 X63.795 Y109.769 E.00844
G1 X58.088 Y115.477 E.26776
G1 X63.745 Y115.477 E.18767
G1 X58.037 Y109.769 E.26776
G1 X56.119 Y109.769 E.06363
G1 X55.95 Y109.938 E.00792
G1 X55.95 Y111.566 E.05401
G1 X56.04 Y109.336 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3525
G1 X63.9 Y109.336 E.29465
; WIPE_START
G1 F24000
G1 X61.9 Y109.336 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-1.195 J.232 P1  F30000
G1 X64.398 Y122.175 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3525
G1 X64.398 Y129.098 E.22965
G1 X55.602 Y129.098 E.29177
G1 X55.602 Y122.175 E.22965
G1 X64.338 Y122.175 E.28978
G1 X64.79 Y121.783 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3525
G1 X64.79 Y121.808 E.00079
G1 X64.79 Y129.49 E.23603
G1 X55.21 Y129.49 E.29437
G1 X55.21 Y121.808 E.23603
G1 X55.21 Y121.783 E.00079
G1 X64.73 Y121.783 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.79 Y121.808 E-.02479
G1 X64.79 Y123.743 E-.73521
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I.422 J-1.142 P1  F30000
G1 X61.487 Y122.523 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3525
G1 X63.115 Y122.523 E.05401
G1 X64.05 Y123.457 E.04383
G1 X64.05 Y124.867 E.04675
G1 X60.685 Y128.231 E.15782
G1 X61.147 Y128.231 E.01532
G1 X55.95 Y123.034 E.24379
G1 X55.95 Y125.29 E.07483
G1 X58.717 Y122.523 E.1298
G1 X57.089 Y122.523 E.05401
G1 X63.96 Y128.664 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3525
G1 X56.1 Y128.664 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X58.1 Y128.664 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/105
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
G3 Z14.8 I.058 J1.216 P1  F30000
G1 X195.602 Y122.09 Z14.8
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3483
G1 X204.398 Y122.09 E.29177
G1 X204.398 Y128.898 E.22582
G1 X195.602 Y128.898 E.29177
G1 X195.602 Y122.15 E.22383
G1 X195.21 Y121.742 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3483
G1 X195.21 Y121.698 E.00133
G1 X204.79 Y121.698 E.29437
G1 X204.79 Y121.742 E.00133
G1 X204.79 Y129.29 E.23194
G1 X195.21 Y129.29 E.29437
G1 X195.21 Y121.802 E.23009
M204 S10000
; WIPE_START
G1 F24000
G1 X195.21 Y121.698 E-.03931
G1 X197.107 Y121.698 E-.72069
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-.541 J1.09 P1  F30000
G1 X198.597 Y122.439 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3483
G1 X196.969 Y122.439 E.05401
G1 X195.95 Y123.457 E.04779
G1 X195.95 Y124.867 E.04675
G1 X199.115 Y128.031 E.14844
G1 X199.053 Y128.031 E.00205
G1 X204.05 Y123.034 E.23441
G1 X204.05 Y125.29 E.07483
G1 X201.198 Y122.439 E.13376
G1 X199.57 Y122.439 E.05401
G1 X196.04 Y128.464 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3483
G1 X203.9 Y128.464 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y128.464 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I1.088 J-.546 P1  F30000
G1 X195.602 Y115.91 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3483
G1 X195.602 Y109.102 E.22582
G1 X204.398 Y109.102 E.29177
G1 X204.398 Y115.91 E.22582
G1 X195.662 Y115.91 E.28978
G1 X195.21 Y116.302 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3483
G1 X195.21 Y116.258 E.00133
G1 X195.21 Y108.71 E.23194
G1 X204.79 Y108.71 E.29437
G1 X204.79 Y116.258 E.23194
G1 X204.79 Y116.302 E.00133
G1 X195.27 Y116.302 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.21 Y116.258 E-.02815
G1 X195.21 Y114.332 E-.73185
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I.286 J1.183 P1  F30000
G1 X195.95 Y114.153 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3483
G1 X195.95 Y115.561 E.04671
G1 X196.17 Y115.561 E.0073
G1 X201.763 Y109.969 E.26234
G1 X196.405 Y109.969 E.17773
G1 X201.997 Y115.561 E.26234
G1 X203.846 Y115.561 E.06135
G1 X204.05 Y115.358 E.00953
G1 X204.05 Y113.73 E.05401
G1 X196.04 Y109.536 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3483
G1 X203.9 Y109.536 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y109.536 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-.056 J-1.216 P1  F30000
G1 X64.398 Y115.91 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3483
G1 X55.602 Y115.91 E.29177
G1 X55.602 Y109.102 E.22582
G1 X64.398 Y109.102 E.29177
G1 X64.398 Y115.85 E.22383
G1 X64.79 Y116.258 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3483
G1 X64.79 Y116.302 E.00133
G1 X55.21 Y116.302 E.29437
G1 X55.21 Y116.258 E.00133
G1 X55.21 Y108.71 E.23194
G1 X64.79 Y108.71 E.29437
G1 X64.79 Y116.198 E.23009
M204 S10000
; WIPE_START
G1 F24000
G1 X64.79 Y116.302 E-.03931
G1 X62.893 Y116.302 E-.72069
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I1.072 J.577 P1  F30000
G1 X64.05 Y114.153 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3483
G1 X64.05 Y115.561 E.04671
G1 X63.83 Y115.561 E.0073
G1 X58.237 Y109.969 E.26234
G1 X63.595 Y109.969 E.17773
G1 X58.003 Y115.561 E.26234
G1 X56.154 Y115.561 E.06135
G1 X55.95 Y115.358 E.00953
G1 X55.95 Y113.73 E.05401
G1 X56.04 Y109.536 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3483
G1 X63.9 Y109.536 E.29465
; WIPE_START
G1 F24000
G1 X61.9 Y109.536 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-1.194 J.237 P1  F30000
G1 X64.398 Y122.09 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3483
G1 X64.398 Y128.898 E.22582
G1 X55.602 Y128.898 E.29177
G1 X55.602 Y122.09 E.22582
G1 X64.338 Y122.09 E.28978
G1 X64.79 Y121.698 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3483
G1 X64.79 Y121.742 E.00133
G1 X64.79 Y129.29 E.23194
G1 X55.21 Y129.29 E.29437
G1 X55.21 Y121.742 E.23194
G1 X55.21 Y121.698 E.00133
G1 X64.73 Y121.698 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.79 Y121.742 E-.02815
G1 X64.79 Y123.668 E-.73185
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I.415 J-1.144 P1  F30000
G1 X61.403 Y122.439 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3483
G1 X63.031 Y122.439 E.05401
G1 X64.05 Y123.457 E.04779
G1 X64.05 Y124.867 E.04675
G1 X60.885 Y128.031 E.14844
G1 X60.947 Y128.031 E.00205
G1 X55.95 Y123.034 E.23441
G1 X55.95 Y125.29 E.07483
G1 X58.802 Y122.439 E.13376
G1 X57.173 Y122.439 E.05401
G1 X56.04 Y128.464 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3483
G1 X63.9 Y128.464 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X61.9 Y128.464 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/105
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
G3 Z15 I.059 J1.216 P1  F30000
G1 X195.602 Y121.986 Z15
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3453
G1 X204.398 Y121.986 E.29177
G1 X204.398 Y128.698 E.22265
G1 X195.602 Y128.698 E.29177
G1 X195.602 Y122.046 E.22066
G1 X195.21 Y121.657 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3453
G1 X195.21 Y121.594 E.00195
G1 X204.79 Y121.594 E.29437
G1 X204.79 Y121.657 E.00195
G1 X204.79 Y129.09 E.22838
G1 X195.21 Y129.09 E.29437
G1 X195.21 Y121.717 E.22654
M204 S10000
; WIPE_START
G1 F24000
G1 X195.21 Y121.594 E-.04696
G1 X197.086 Y121.594 E-.71304
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-.507 J1.106 P1  F30000
G1 X198.702 Y122.334 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3453
G1 X197.074 Y122.334 E.05401
G1 X195.95 Y123.457 E.0527
G1 X195.95 Y124.867 E.04675
G1 X198.915 Y127.831 E.13906
G1 X199.253 Y127.831 E.01122
G1 X204.05 Y123.034 E.22503
G1 X204.05 Y125.29 E.07483
G1 X201.094 Y122.334 E.13867
M73 P89 R5
G1 X199.465 Y122.334 E.05401
G1 X196.04 Y128.264 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3453
G1 X203.9 Y128.264 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y128.264 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I1.082 J-.556 P1  F30000
G1 X195.602 Y116.014 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3453
G1 X195.602 Y109.302 E.22265
G1 X204.398 Y109.302 E.29177
G1 X204.398 Y116.014 E.22265
G1 X195.662 Y116.014 E.28978
G1 X195.21 Y116.406 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3453
G1 X195.21 Y116.343 E.00195
G1 X195.21 Y108.91 E.22838
G1 X204.79 Y108.91 E.29437
G1 X204.79 Y116.343 E.22838
G1 X204.79 Y116.406 E.00195
G1 X195.27 Y116.406 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.21 Y116.343 E-.03322
G1 X195.21 Y114.43 E-.72678
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I.426 J1.14 P1  F30000
G1 X195.95 Y114.153 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3453
G1 X195.95 Y115.666 E.05018
G1 X196.066 Y115.666 E.00383
G1 X201.563 Y110.169 E.25786
G1 X196.605 Y110.169 E.16446
G1 X202.102 Y115.666 E.25786
G1 X203.742 Y115.666 E.05441
G1 X204.05 Y115.358 E.01444
G1 X204.05 Y113.73 E.05401
G1 X196.04 Y109.736 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3453
G1 X203.9 Y109.736 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y109.736 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-.056 J-1.216 P1  F30000
G1 X64.398 Y116.014 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3453
G1 X55.602 Y116.014 E.29177
G1 X55.602 Y109.302 E.22265
G1 X64.398 Y109.302 E.29177
G1 X64.398 Y115.954 E.22066
G1 X64.79 Y116.343 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3453
G1 X64.79 Y116.406 E.00195
G1 X55.21 Y116.406 E.29437
G1 X55.21 Y116.343 E.00195
G1 X55.21 Y108.91 E.22838
G1 X64.79 Y108.91 E.29437
G1 X64.79 Y116.283 E.22654
M204 S10000
; WIPE_START
G1 F24000
G1 X64.79 Y116.406 E-.04696
G1 X62.914 Y116.406 E-.71304
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I1.087 J.548 P1  F30000
G1 X64.05 Y114.153 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3453
G1 X64.05 Y115.666 E.05018
G1 X63.934 Y115.666 E.00383
G1 X58.437 Y110.169 E.25786
G1 X63.395 Y110.169 E.16446
G1 X57.898 Y115.666 E.25786
G1 X56.258 Y115.666 E.05441
G1 X55.95 Y115.358 E.01444
G1 X55.95 Y113.73 E.05401
G1 X56.04 Y109.736 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3453
G1 X63.9 Y109.736 E.29465
; WIPE_START
G1 F24000
G1 X61.9 Y109.736 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-1.192 J.243 P1  F30000
G1 X64.398 Y121.986 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3453
G1 X64.398 Y128.698 E.22265
G1 X55.602 Y128.698 E.29177
G1 X55.602 Y121.986 E.22265
G1 X64.338 Y121.986 E.28978
G1 X64.79 Y121.594 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3453
G1 X64.79 Y121.657 E.00195
G1 X64.79 Y129.09 E.22838
G1 X55.21 Y129.09 E.29437
G1 X55.21 Y121.657 E.22838
G1 X55.21 Y121.594 E.00195
G1 X64.73 Y121.594 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.79 Y121.657 E-.03322
G1 X64.79 Y123.57 E-.72678
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I.406 J-1.147 P1  F30000
G1 X61.298 Y122.334 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3453
G1 X62.926 Y122.334 E.05401
G1 X64.05 Y123.457 E.0527
G1 X64.05 Y124.867 E.04675
G1 X61.085 Y127.831 E.13906
G1 X60.747 Y127.831 E.01122
G1 X55.95 Y123.034 E.22503
G1 X55.95 Y125.29 E.07483
G1 X58.906 Y122.334 E.13867
G1 X57.278 Y122.334 E.05401
G1 X56.04 Y128.264 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3453
G1 X63.9 Y128.264 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X61.9 Y128.264 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/105
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
G3 Z15.2 I.058 J1.216 P1  F30000
G1 X195.602 Y121.86 Z15.2
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3495
G1 X204.398 Y121.86 E.29177
G1 X204.398 Y128.498 E.22021
G1 X195.602 Y128.498 E.29177
G1 X195.602 Y121.92 E.21822
G1 X195.21 Y121.553 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3495
G1 X195.21 Y121.471 E.00252
G1 F3000
G1 X204.79 Y121.471 E.29437
G1 F3495
G1 X204.79 Y121.553 E.00252
G1 X204.79 Y128.89 E.22545
G1 X195.21 Y128.89 E.29437
G1 X195.21 Y121.613 E.22361
M204 S10000
; WIPE_START
G1 F24000
G1 X195.21 Y121.471 E-.05396
G1 X197.068 Y121.471 E-.70604
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-.47 J1.123 P1  F30000
G1 X198.828 Y122.208 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3495
G1 X197.2 Y122.208 E.05401
G1 X195.95 Y123.457 E.05862
G1 X195.95 Y124.867 E.04675
G1 X198.715 Y127.631 E.12967
G1 X199.453 Y127.631 E.02449
G1 X204.05 Y123.034 E.21565
G1 X204.05 Y125.29 E.07483
G1 X200.968 Y122.208 E.14459
G1 X202.596 Y122.208 E.05401
G1 X196.04 Y128.064 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502912
G1 F3495
G1 X203.9 Y128.064 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y128.064 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I1.076 J-.568 P1  F30000
G1 X195.602 Y116.14 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3495
G1 X195.602 Y109.502 E.22021
G1 X204.398 Y109.502 E.29177
G1 X204.398 Y116.14 E.22021
G1 X195.662 Y116.14 E.28978
G1 X195.21 Y116.529 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3495
G1 X195.21 Y116.447 E.00252
G1 X195.21 Y109.11 E.22545
G1 X204.79 Y109.11 E.29437
G1 X204.79 Y116.447 E.22545
G1 X204.79 Y116.529 E.00252
G1 F3000
G1 X195.27 Y116.529 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.21 Y116.447 E-.03861
G1 X195.21 Y114.549 E-.72139
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-.568 J1.076 P1  F30000
G1 X197.568 Y115.792 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3495
G1 X195.95 Y115.781 E.05366
G1 X201.363 Y110.369 E.2539
G1 X196.805 Y110.369 E.15119
G1 X202.228 Y115.792 E.2544
G1 X203.616 Y115.792 E.04604
G1 X204.05 Y115.358 E.02036
G1 X204.05 Y113.73 E.05401
G1 X196.04 Y109.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3495
G1 X203.9 Y109.936 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y109.936 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-.055 J-1.216 P1  F30000
G1 X64.398 Y116.14 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3495
G1 X55.602 Y116.14 E.29177
G1 X55.602 Y109.502 E.22021
G1 X64.398 Y109.502 E.29177
G1 X64.398 Y116.08 E.21821
G1 X64.79 Y116.447 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3495
G1 X64.79 Y116.529 E.00252
G1 F3000
G1 X55.21 Y116.529 E.29437
G1 F3495
G1 X55.21 Y116.447 E.00252
G1 X55.21 Y109.11 E.22545
G1 X64.79 Y109.11 E.29437
G1 X64.79 Y116.387 E.22361
M204 S10000
; WIPE_START
G1 F24000
G1 X64.79 Y116.529 E-.05396
G1 X62.932 Y116.529 E-.70604
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I1.007 J-.683 P1  F30000
G1 X62.432 Y115.792 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3495
G1 X64.05 Y115.781 E.05366
G1 X58.637 Y110.369 E.2539
G1 X63.195 Y110.369 E.15119
G1 X57.772 Y115.792 E.2544
G1 X56.384 Y115.792 E.04604
G1 X55.95 Y115.358 E.02036
G1 X55.95 Y113.73 E.05401
G1 X56.04 Y109.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3495
G1 X63.9 Y109.936 E.29465
; WIPE_START
G1 F24000
G1 X61.9 Y109.936 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-1.191 J.249 P1  F30000
G1 X64.398 Y121.86 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3495
G1 X64.398 Y128.498 E.22021
G1 X55.602 Y128.498 E.29177
G1 X55.602 Y121.86 E.22021
G1 X64.338 Y121.86 E.28978
G1 X64.79 Y121.471 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3495
G1 X64.79 Y121.553 E.00252
G1 X64.79 Y128.89 E.22545
M73 P89 R4
G1 X55.21 Y128.89 E.29437
G1 X55.21 Y121.553 E.22545
G1 X55.21 Y121.471 E.00252
G1 F3000
G1 X64.73 Y121.471 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.79 Y121.553 E-.03861
G1 X64.79 Y123.451 E-.72139
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I.395 J-1.151 P1  F30000
G1 X61.172 Y122.208 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3495
G1 X62.8 Y122.208 E.05401
G1 X64.05 Y123.457 E.05862
G1 X64.05 Y124.867 E.04675
G1 X61.285 Y127.631 E.12968
G1 X60.547 Y127.631 E.02449
G1 X55.95 Y123.034 E.21565
G1 X55.95 Y125.29 E.07483
G1 X59.032 Y122.208 E.14459
G1 X57.404 Y122.208 E.05401
G1 X56.04 Y128.064 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502912
G1 F3495
G1 X63.9 Y128.064 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X61.9 Y128.064 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 76/105
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
G3 Z15.4 I.058 J1.216 P1  F30000
G1 X195.602 Y121.707 Z15.4
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3471
G1 X204.398 Y121.707 E.29177
G1 X204.398 Y128.298 E.21863
G1 X195.602 Y128.298 E.29177
G1 X195.602 Y121.767 E.21664
G1 X195.21 Y121.427 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3471
G1 X195.21 Y121.345 E.00252
G1 F3000
G1 X195.21 Y121.315 E.00091
G1 X204.79 Y121.315 E.29437
G1 X204.79 Y121.345 E.00091
G1 F3471
G1 X204.79 Y121.427 E.00252
G1 X204.79 Y128.69 E.22319
G1 X195.21 Y128.69 E.29437
G1 X195.21 Y121.487 E.22134
M204 S10000
; WIPE_START
G1 F24000
G1 X195.21 Y121.345 E-.05396
G1 X195.21 Y121.315 E-.01121
G1 X197.038 Y121.315 E-.69483
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-.433 J1.137 P1  F30000
G1 X198.981 Y122.055 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3471
G1 X197.352 Y122.055 E.05401
G1 X195.95 Y123.457 E.06577
G1 X195.95 Y124.867 E.04675
G1 X198.515 Y127.431 E.12029
G1 X199.653 Y127.431 E.03776
G1 X204.05 Y123.034 E.20626
G1 X204.05 Y125.29 E.07483
G1 X200.815 Y122.055 E.15174
G1 X202.443 Y122.055 E.05401
G1 X196.04 Y127.864 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502912
G1 F3471
G1 X203.9 Y127.864 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y127.864 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I1.069 J-.582 P1  F30000
G1 X195.602 Y116.293 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3471
G1 X195.602 Y109.702 E.21863
G1 X204.398 Y109.702 E.29177
G1 X204.398 Y116.293 E.21863
G1 X195.662 Y116.293 E.28978
G1 X195.21 Y116.685 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X195.21 Y116.655 E.00091
G1 F3471
G1 X195.21 Y116.573 E.00252
G1 X195.21 Y109.31 E.22319
G1 X204.79 Y109.31 E.29437
G1 X204.79 Y116.573 E.22319
G1 X204.79 Y116.655 E.00252
G1 F3000
G1 X204.79 Y116.685 E.00091
G1 X195.27 Y116.685 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.21 Y116.655 E-.02541
G1 X195.21 Y116.573 E-.03116
G1 X195.21 Y114.722 E-.70343
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-.59 J1.064 P1  F30000
G1 X197.415 Y115.945 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3471
G1 X195.95 Y115.945 E.0486
G1 X195.95 Y115.781 E.00541
G1 X201.163 Y110.569 E.24452
G1 X197.005 Y110.569 E.13792
G1 X202.38 Y115.945 E.25218
G1 X203.463 Y115.945 E.03592
G1 X204.05 Y115.358 E.02752
G1 X204.05 Y113.73 E.05401
G1 X196.04 Y110.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3471
G1 X203.9 Y110.136 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y110.136 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-.054 J-1.216 P1  F30000
G1 X64.398 Y116.293 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3471
G1 X55.602 Y116.293 E.29177
G1 X55.602 Y109.702 E.21863
G1 X64.398 Y109.702 E.29177
G1 X64.398 Y116.233 E.21664
G1 X64.79 Y116.573 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3471
G1 X64.79 Y116.655 E.00252
G1 F3000
G1 X64.79 Y116.685 E.00091
G1 X55.21 Y116.685 E.29437
G1 X55.21 Y116.655 E.00091
G1 F3471
G1 X55.21 Y116.573 E.00252
G1 X55.21 Y109.31 E.22319
G1 X64.79 Y109.31 E.29437
G1 X64.79 Y116.513 E.22134
M204 S10000
; WIPE_START
G1 F24000
G1 X64.79 Y116.655 E-.05396
G1 X64.79 Y116.685 E-.01121
G1 X62.962 Y116.685 E-.69483
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I1.084 J-.552 P1  F30000
G1 X62.585 Y115.945 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3471
G1 X64.05 Y115.945 E.0486
G1 X64.05 Y115.781 E.00541
G1 X58.837 Y110.569 E.24452
G1 X62.995 Y110.569 E.13792
G1 X57.62 Y115.945 E.25218
G1 X56.537 Y115.945 E.03592
G1 X55.95 Y115.358 E.02752
G1 X55.95 Y113.73 E.05401
G1 X56.04 Y110.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3471
G1 X63.9 Y110.136 E.29465
; WIPE_START
G1 F24000
G1 X61.9 Y110.136 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-1.19 J.257 P1  F30000
G1 X64.398 Y121.707 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3471
G1 X64.398 Y128.298 E.21863
G1 X55.602 Y128.298 E.29177
G1 X55.602 Y121.707 E.21863
G1 X64.338 Y121.707 E.28978
G1 X64.79 Y121.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X64.79 Y121.345 E.00091
G1 F3471
G1 X64.79 Y121.427 E.00252
G1 X64.79 Y128.69 E.22319
G1 X55.21 Y128.69 E.29437
G1 X55.21 Y121.427 E.22319
G1 X55.21 Y121.345 E.00252
G1 F3000
G1 X55.21 Y121.315 E.00091
G1 X64.73 Y121.315 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X64.79 Y121.345 E-.02541
G1 X64.79 Y121.427 E-.03116
G1 X64.79 Y123.278 E-.70343
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I.375 J-1.158 P1  F30000
G1 X61.019 Y122.055 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3471
G1 X62.648 Y122.055 E.05401
G1 X64.05 Y123.457 E.06577
G1 X64.05 Y124.867 E.04675
G1 X61.485 Y127.431 E.12029
G1 X60.347 Y127.431 E.03776
G1 X55.95 Y123.034 E.20626
G1 X55.95 Y125.29 E.07483
G1 X59.185 Y122.055 E.15174
G1 X57.557 Y122.055 E.05401
G1 X56.04 Y127.864 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502912
G1 F3471
G1 X63.9 Y127.864 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X61.9 Y127.864 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 77/105
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
G3 Z15.6 I.058 J1.216 P1  F30000
G1 X195.602 Y121.521 Z15.6
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3421
G1 X204.398 Y121.521 E.29177
G1 X204.398 Y128.098 E.21816
G1 X195.602 Y128.098 E.29177
G1 X195.602 Y121.581 E.21617
G1 X195.21 Y121.274 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3421
G1 X195.21 Y121.192 E.00252
G1 F3000
G1 X195.21 Y121.129 E.00193
G1 X204.79 Y121.129 E.29437
G1 X204.79 Y121.192 E.00193
G1 F3421
G1 X204.79 Y121.274 E.00252
G1 X204.79 Y128.49 E.22173
G1 X195.21 Y128.49 E.29437
G1 X195.21 Y121.334 E.21988
M204 S10000
G1 X195.95 Y121.91 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3421
G1 X195.95 Y121.87 E.00134
G1 X197.538 Y121.87 E.05267
G1 X195.95 Y123.457 E.07449
G1 X195.95 Y124.867 E.04675
M73 P90 R4
G1 X198.315 Y127.231 E.11091
G1 X199.853 Y127.231 E.05103
G1 X204.05 Y123.034 E.19688
G1 X204.05 Y125.29 E.07483
G1 X200.629 Y121.87 E.16046
G1 X202.258 Y121.87 E.05401
G1 X196.04 Y127.664 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F3421
G1 X203.9 Y127.664 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y127.664 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I1.06 J-.597 P1  F30000
G1 X195.602 Y116.479 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3421
G1 X195.602 Y109.902 E.21816
G1 X204.398 Y109.902 E.29177
G1 X204.398 Y116.479 E.21816
G1 X195.662 Y116.479 E.28978
G1 X195.21 Y116.871 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X195.21 Y116.808 E.00193
G1 F3421
G1 X195.21 Y116.726 E.00252
G1 X195.21 Y109.51 E.22173
G1 X204.79 Y109.51 E.29437
G1 X204.79 Y116.726 E.22173
G1 X204.79 Y116.808 E.00252
G1 F3000
G1 X204.79 Y116.871 E.00193
G1 X195.27 Y116.871 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.21 Y116.808 E-.033
G1 X195.21 Y116.726 E-.03116
G1 X195.21 Y114.895 E-.69584
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-.635 J1.038 P1  F30000
G1 X197.23 Y116.13 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3421
G1 X195.95 Y116.13 E.04244
G1 X195.95 Y115.781 E.01158
G1 X200.963 Y110.769 E.23514
G1 X197.205 Y110.769 E.12466
G1 X202.566 Y116.13 E.25151
G1 X203.277 Y116.13 E.02359
G1 X204.05 Y115.358 E.03623
G1 X204.05 Y113.73 E.05401
G1 X196.04 Y110.336 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3421
G1 X203.9 Y110.336 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y110.336 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-.054 J-1.216 P1  F30000
G1 X64.398 Y116.479 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3421
G1 X55.602 Y116.479 E.29177
G1 X55.602 Y109.902 E.21816
G1 X64.398 Y109.902 E.29177
G1 X64.398 Y116.419 E.21617
G1 X64.79 Y116.726 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3421
G1 X64.79 Y116.808 E.00252
G1 F3000
G1 X64.79 Y116.871 E.00193
G1 X55.21 Y116.871 E.29437
G1 X55.21 Y116.808 E.00193
G1 F3421
G1 X55.21 Y116.726 E.00252
G1 X55.21 Y109.51 E.22173
G1 X64.79 Y109.51 E.29437
G1 X64.79 Y116.666 E.21988
M204 S10000
; WIPE_START
G1 F24000
G1 X64.79 Y116.808 E-.05396
G1 X64.79 Y116.871 E-.02386
G1 X62.995 Y116.871 E-.68218
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I1.165 J-.353 P1  F30000
G1 X62.77 Y116.13 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3421
G1 X64.05 Y116.13 E.04244
G1 X64.05 Y115.781 E.01158
G1 X59.037 Y110.769 E.23514
G1 X62.795 Y110.769 E.12466
G1 X57.434 Y116.13 E.25151
G1 X56.723 Y116.13 E.02359
G1 X55.95 Y115.358 E.03623
G1 X55.95 Y113.73 E.05401
G1 X56.04 Y110.336 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3421
G1 X63.9 Y110.336 E.29465
; WIPE_START
G1 F24000
G1 X61.9 Y110.336 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-1.188 J.265 P1  F30000
G1 X64.398 Y121.521 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3421
G1 X64.398 Y128.098 E.21816
G1 X55.602 Y128.098 E.29177
G1 X55.602 Y121.521 E.21816
G1 X64.338 Y121.521 E.28978
G1 X64.79 Y121.192 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3421
G1 X64.79 Y121.274 E.00252
G1 X64.79 Y128.49 E.22173
G1 X55.21 Y128.49 E.29437
G1 X55.21 Y121.274 E.22173
G1 X55.21 Y121.192 E.00252
G1 F3000
G1 X55.21 Y121.129 E.00193
G1 X64.79 Y121.129 E.29437
G1 X64.79 Y121.132 E.00009
M204 S10000
; WIPE_START
G1 F24000
G1 X64.79 Y121.274 E-.05396
G1 X64.79 Y123.132 E-.70604
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I1.041 J-.631 P1  F30000
G1 X64.05 Y121.91 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3421
G1 X64.05 Y121.87 E.00134
G1 X62.462 Y121.87 E.05267
G1 X64.05 Y123.457 E.07449
G1 X64.05 Y124.867 E.04675
G1 X61.685 Y127.231 E.11091
G1 X60.147 Y127.231 E.05103
G1 X55.95 Y123.034 E.19688
G1 X55.95 Y125.29 E.07483
G1 X59.371 Y121.87 E.16046
G1 X57.742 Y121.87 E.05401
G1 X56.04 Y127.664 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F3421
G1 X63.9 Y127.664 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X61.9 Y127.664 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 78/105
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
G3 Z15.8 I.058 J1.216 P1  F30000
G1 X195.602 Y121.291 Z15.8
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4088
G1 X204.398 Y121.291 E.29177
G1 X204.398 Y127.898 E.21916
G1 X195.602 Y127.898 E.29177
G1 X195.602 Y121.351 E.21717
G1 X195.21 Y121.088 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4088
G1 X195.21 Y120.924 E.00504
M106 S255
G1 F1800
G1 X195.21 Y120.899 E.00078
G1 X204.79 Y120.899 E.29437
G1 X204.79 Y120.924 E.00078
M106 S252.45
G1 F4088
G1 X204.79 Y121.088 E.00504
G1 X204.79 Y128.29 E.22129
G1 X195.21 Y128.29 E.29437
G1 X195.21 Y121.148 E.21945
M204 S10000
; WIPE_START
G1 F24000
G1 X195.21 Y120.924 E-.08512
G1 X195.21 Y120.899 E-.00962
G1 X196.961 Y120.899 E-.66526
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-.821 J-.899 P1  F30000
G1 X196.048 Y121.733 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519004
G1 F4088
G1 X203.892 Y121.733 E.30433
G1 X202.562 Y122.174 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4088
G1 X200.934 Y122.174 E.05401
G1 X204.05 Y125.29 E.14617
G1 X204.05 Y123.034 E.07483
G1 X200.053 Y127.031 E.1875
G1 X198.115 Y127.031 E.0643
G1 X195.95 Y124.867 E.10153
G1 X195.95 Y123.457 E.04675
G1 X197.234 Y122.174 E.0602
G1 X198.862 Y122.174 E.05401
G1 X196.04 Y127.464 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F4088
G1 X203.9 Y127.464 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y127.464 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I1.05 J-.615 P1  F30000
G1 X195.602 Y116.709 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4088
G1 X195.602 Y110.102 E.21916
G1 X204.398 Y110.102 E.29177
G1 X204.398 Y116.709 E.21916
G1 X195.662 Y116.709 E.28978
G1 X195.21 Y116.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4088
G1 X195.21 Y109.71 E.22129
G1 X204.79 Y109.71 E.29437
G1 X204.79 Y116.912 E.22129
G1 X204.79 Y117.076 E.00504
M106 S255
G1 F1800
G1 X204.79 Y117.101 E.00078
G1 X195.21 Y117.101 E.29437
G1 X195.21 Y117.076 E.00078
M106 S252.45
G1 F4088
G1 X195.21 Y116.972 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X195.21 Y114.972 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-1.022 J.661 P1  F30000
G1 X196.048 Y116.267 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518998
G1 F4088
G1 X203.893 Y116.268 E.30434
G1 X204.05 Y113.73 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4088
G1 X204.05 Y115.358 E.05401
G1 X203.582 Y115.826 E.02196
G1 X202.262 Y115.826 E.04378
G1 X197.405 Y110.969 E.22785
G1 X200.763 Y110.969 E.11139
G1 X195.95 Y115.781 E.22575
G1 X195.95 Y115.826 E.00147
G1 X197.534 Y115.826 E.05254
G1 X196.04 Y110.536 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4088
G1 X203.9 Y110.536 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y110.536 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-.055 J-1.216 P1  F30000
G1 X64.398 Y116.709 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4088
G1 X55.602 Y116.709 E.29177
G1 X55.602 Y110.102 E.21916
G1 X64.398 Y110.102 E.29177
G1 X64.398 Y116.649 E.21717
G1 X64.79 Y116.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4088
G1 X64.79 Y117.076 E.00504
M106 S255
G1 F1800
G1 X64.79 Y117.101 E.00078
G1 X55.21 Y117.101 E.29437
G1 X55.21 Y117.076 E.00078
M106 S252.45
G1 F4088
G1 X55.21 Y116.912 E.00504
G1 X55.21 Y109.71 E.22129
G1 X64.79 Y109.71 E.29437
G1 X64.79 Y116.852 E.21945
M204 S10000
; WIPE_START
G1 F24000
G1 X64.79 Y117.076 E-.08512
G1 X64.79 Y117.101 E-.00962
G1 X63.039 Y117.101 E-.66526
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I1.11 J-.499 P1  F30000
G1 X62.466 Y115.826 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4088
G1 X64.05 Y115.826 E.05253
G1 X64.05 Y115.781 E.00149
G1 X59.237 Y110.969 E.22575
G1 X62.595 Y110.969 E.11139
G1 X57.738 Y115.826 E.22784
G1 X56.418 Y115.826 E.0438
G1 X55.95 Y115.358 E.02195
G1 X55.95 Y113.73 E.05401
G1 X56.048 Y116.267 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518998
G1 F4088
G1 X63.893 Y116.268 E.30434
G1 X56.04 Y110.536 F30000
; LINE_WIDTH: 0.502908
G1 F4088
G1 X63.9 Y110.536 E.29465
; WIPE_START
G1 F24000
G1 X61.9 Y110.536 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-1.185 J.275 P1  F30000
G1 X64.398 Y121.291 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4088
G1 X64.398 Y127.898 E.21916
G1 X55.602 Y127.898 E.29177
G1 X55.602 Y121.291 E.21916
G1 X64.338 Y121.291 E.28978
G1 X64.79 Y121.088 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4088
G1 X64.79 Y128.29 E.22129
G1 X55.21 Y128.29 E.29437
G1 X55.21 Y121.088 E.22129
G1 X55.21 Y120.924 E.00504
M106 S255
G1 F1800
G1 X55.21 Y120.899 E.00078
G1 X64.79 Y120.899 E.29437
G1 X64.79 Y120.924 E.00078
M106 S252.45
G1 F4088
G1 X64.79 Y121.028 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X64.79 Y123.028 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I.277 J-1.185 P1  F30000
G1 X61.138 Y122.174 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4088
G1 X62.766 Y122.174 E.05401
G1 X64.05 Y123.457 E.0602
G1 X64.05 Y124.867 E.04675
G1 X61.885 Y127.031 E.10153
G1 X59.947 Y127.031 E.0643
G1 X55.95 Y123.034 E.1875
G1 X55.95 Y125.29 E.07483
G1 X59.066 Y122.174 E.14617
G1 X57.438 Y122.174 E.05401
G1 X56.048 Y121.733 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519004
G1 F4088
G1 X63.892 Y121.733 E.30433
G1 X56.04 Y127.464 F30000
; LINE_WIDTH: 0.50291
G1 F4088
G1 X63.9 Y127.464 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X61.9 Y127.464 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 79/105
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
G3 Z16 I.059 J1.216 P1  F30000
G1 X195.602 Y120.997 Z16
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7568
G1 X204.398 Y120.997 E.29177
G1 X204.398 Y127.698 E.22229
G1 X195.602 Y127.698 E.29177
G1 X195.602 Y121.057 E.2203
G1 X195.21 Y120.858 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7568
G1 X195.21 Y120.776 E.00252
G1 F3000
G1 X195.21 Y120.612 E.00504
M106 S255
G1 F600
G1 X204.79 Y120.612 E.29437
M106 S252.45
G1 F3000
G1 X204.79 Y120.776 E.00504
G1 F7568
G1 X204.79 Y120.858 E.00252
G1 X204.79 Y128.09 E.22222
G1 X195.21 Y128.09 E.29437
G1 X195.21 Y120.918 E.22038
M204 S10000
; WIPE_START
G1 F24000
G1 X195.21 Y120.776 E-.05396
G1 X195.21 Y120.612 E-.06232
G1 X196.904 Y120.612 E-.64372
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-.9 J-.819 P1  F30000
G1 X196.102 Y121.493 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.627364
G1 F7568
G1 X203.842 Y121.493 E.36863
G1 X202.376 Y121.988 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7568
G1 X200.748 Y121.988 E.05401
G1 X204.05 Y125.29 E.15489
G1 X204.05 Y123.034 E.07483
G1 X200.253 Y126.831 E.17812
G1 X197.915 Y126.831 E.07757
G1 X195.95 Y124.867 E.09215
G1 X195.95 Y123.457 E.04675
G1 X197.419 Y121.988 E.06892
G1 X199.048 Y121.988 E.05401
G1 X196.04 Y127.264 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F7568
G1 X203.9 Y127.264 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y127.264 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I1.037 J-.637 P1  F30000
G1 X195.602 Y117.003 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7568
G1 X195.602 Y110.302 E.22229
G1 X204.398 Y110.302 E.29177
G1 X204.398 Y117.003 E.22229
G1 X195.662 Y117.003 E.28978
G1 X195.21 Y117.224 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7568
G1 X195.21 Y117.142 E.00252
G1 X195.21 Y109.91 E.22222
G1 X204.79 Y109.91 E.29437
G1 X204.79 Y117.142 E.22222
G1 X204.79 Y117.224 E.00252
G1 F3000
G1 X204.79 Y117.388 E.00504
M106 S255
G1 F600
G1 X195.21 Y117.388 E.29437
M106 S252.45
G1 F3000
G1 X195.21 Y117.284 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X195.21 Y117.142 E-.05396
G1 X195.21 Y115.284 E-.70604
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-.985 J.715 P1  F30000
G1 X196.098 Y116.507 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.627364
G1 F7568
G1 X203.838 Y116.507 E.36863
G1 X204.05 Y113.73 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7568
G1 X204.05 Y115.358 E.05401
G1 X203.396 Y116.012 E.03066
G1 X202.447 Y116.012 E.03148
G1 X197.605 Y111.169 E.22717
G1 X200.563 Y111.169 E.09812
G1 X195.95 Y115.781 E.21637
G1 X195.95 Y116.012 E.00764
G1 X197.348 Y116.012 E.04638
G1 X196.04 Y110.736 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F7568
G1 X203.9 Y110.736 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y110.736 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-.055 J-1.216 P1  F30000
G1 X64.398 Y117.003 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7568
G1 X55.602 Y117.003 E.29177
G1 X55.602 Y110.302 E.22229
G1 X64.398 Y110.302 E.29177
G1 X64.398 Y116.943 E.2203
G1 X64.79 Y117.142 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7568
G1 X64.79 Y117.224 E.00252
G1 F3000
G1 X64.79 Y117.388 E.00504
M106 S255
G1 F600
G1 X55.21 Y117.388 E.29437
M106 S252.45
G1 F3000
G1 X55.21 Y117.224 E.00504
G1 F7568
G1 X55.21 Y117.142 E.00252
G1 X55.21 Y109.91 E.22222
G1 X64.79 Y109.91 E.29437
G1 X64.79 Y117.082 E.22038
M204 S10000
; WIPE_START
G1 F24000
G1 X64.79 Y117.224 E-.05396
G1 X64.79 Y117.388 E-.06232
G1 X63.096 Y117.388 E-.64372
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I1.158 J-.374 P1  F30000
G1 X62.652 Y116.012 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7568
G1 X64.05 Y116.012 E.04638
G1 X64.05 Y115.781 E.00764
G1 X59.437 Y111.169 E.21637
G1 X62.395 Y111.169 E.09812
G1 X57.553 Y116.012 E.22717
G1 X56.604 Y116.012 E.03147
G1 X55.95 Y115.358 E.03066
G1 X55.95 Y113.73 E.05401
G1 X56.098 Y116.507 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.627364
G1 F7568
G1 X63.838 Y116.507 E.36863
G1 X56.04 Y110.736 F30000
; LINE_WIDTH: 0.502908
G1 F7568
G1 X63.9 Y110.736 E.29465
; WIPE_START
G1 F24000
G1 X61.9 Y110.736 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-1.182 J.288 P1  F30000
G1 X64.398 Y120.997 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7568
G1 X64.398 Y127.698 E.22229
G1 X55.602 Y127.698 E.29177
G1 X55.602 Y120.997 E.22229
G1 X64.338 Y120.997 E.28978
G1 X64.79 Y120.858 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7568
G1 X64.79 Y128.09 E.22222
G1 X55.21 Y128.09 E.29437
G1 X55.21 Y120.858 E.22222
G1 X55.21 Y120.776 E.00252
G1 F3000
G1 X55.21 Y120.612 E.00504
M106 S255
G1 F600
G1 X64.79 Y120.612 E.29437
M106 S252.45
G1 F3000
G1 X64.79 Y120.776 E.00504
G1 F7568
G1 X64.79 Y120.798 E.00068
M204 S10000
; WIPE_START
G1 F24000
G1 X64.79 Y122.798 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I.251 J-1.191 P1  F30000
G1 X60.952 Y121.988 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7568
G1 X62.581 Y121.988 E.05401
G1 X64.05 Y123.457 E.06891
G1 X64.05 Y124.867 E.04675
G1 X62.085 Y126.831 E.09215
G1 X59.747 Y126.831 E.07756
G1 X55.95 Y123.034 E.17812
G1 X55.95 Y125.29 E.07483
G1 X59.252 Y121.988 E.15489
G1 X57.624 Y121.988 E.05401
G1 X56.102 Y121.493 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.627364
G1 F7568
G1 X63.842 Y121.493 E.36863
G1 X56.04 Y127.264 F30000
; LINE_WIDTH: 0.50291
G1 F7568
G1 X63.9 Y127.264 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X61.9 Y127.264 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 80/105
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
G3 Z16.2 I-.002 J1.217 P1  F30000
G1 X195.602 Y127.498 Z16.2
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4090
G1 X195.602 Y120.58 E.22947
G1 X204.398 Y120.58 E.29177
G1 X204.398 Y127.498 E.22947
G1 X195.662 Y127.498 E.28978
G1 X195.21 Y127.89 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4090
G1 X195.21 Y120.195 E.23645
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X204.79 Y120.195 E.31779
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4090
M73 P91 R4
G1 X204.79 Y120.564 E.01134
G1 X204.79 Y127.89 E.22511
G1 X195.27 Y127.89 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.254 Y125.89 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I-1.012 J.676 P1  F30000
G1 X196.04 Y127.064 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4090
G1 X203.9 Y127.064 E.29465
G1 X202.146 Y121.758 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4090
G1 X200.518 Y121.758 E.05401
G1 X204.05 Y125.29 E.16569
G1 X204.05 Y123.034 E.07483
G1 X200.453 Y126.631 E.16873
G1 X197.715 Y126.631 E.09083
G1 X195.95 Y124.867 E.08276
G1 X195.95 Y123.457 E.04675
G1 X197.65 Y121.758 E.07972
G1 X196.021 Y121.758 E.05401
G1 X196.004 Y121.362 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.428193
G1 F4090
G1 X204.002 Y121.362 E.25108
G1 X204.002 Y120.977 E.0121
G1 X196 Y120.977 E.25121
G1 X196.004 Y121.302 E.01021
; WIPE_START
G1 F24000
G1 X196 Y120.977 E-.12361
G1 X197.675 Y120.977 E-.63639
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I1.051 J-.613 P1  F30000
G1 X195.602 Y117.42 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4090
G1 X195.602 Y110.502 E.22947
G1 X204.398 Y110.502 E.29177
G1 X204.398 Y117.42 E.22947
G1 X195.662 Y117.42 E.28978
G1 X195.21 Y117.436 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4090
G1 X195.21 Y110.11 E.22511
G1 X204.79 Y110.11 E.29437
G1 X204.79 Y117.805 E.23645
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X195.21 Y117.805 E.31779
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4090
G1 X195.21 Y117.496 E.00949
M204 S10000
G1 X195.998 Y117.023 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.428194
G1 F4090
G1 X204 Y117.023 E.25121
G1 X203.996 Y116.638 E.0121
G1 X195.998 Y116.638 E.25108
G1 X195.998 Y116.963 E.01021
G1 X197.118 Y116.242 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4090
G1 X195.95 Y116.242 E.03874
G1 X195.95 Y115.781 E.01528
G1 X200.363 Y111.369 E.20699
G1 X197.805 Y111.369 E.08485
G1 X202.678 Y116.242 E.22859
G1 X203.166 Y116.242 E.0162
G1 X204.05 Y115.358 E.04146
G1 X204.05 Y113.73 E.05401
G1 X196.04 Y110.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4090
G1 X203.9 Y110.936 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y110.936 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I-.054 J-1.216 P1  F30000
G1 X55.602 Y117.42 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4090
G1 X55.602 Y110.502 E.22947
G1 X64.398 Y110.502 E.29177
G1 X64.398 Y117.42 E.22947
G1 X55.662 Y117.42 E.28978
G1 X55.21 Y117.436 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4090
G1 X55.21 Y110.11 E.22511
G1 X64.79 Y110.11 E.29437
G1 X64.79 Y117.805 E.23645
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X55.21 Y117.805 E.31779
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4090
G1 X55.21 Y117.496 E.00949
M204 S10000
; WIPE_START
G1 F24000
G1 X55.21 Y115.496 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I1.122 J.47 P1  F30000
G1 X55.95 Y113.73 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4090
G1 X55.95 Y115.358 E.05401
G1 X56.834 Y116.242 E.04146
G1 X57.322 Y116.242 E.01619
G1 X62.195 Y111.369 E.22859
G1 X59.637 Y111.369 E.08485
G1 X64.05 Y115.781 E.20699
G1 X64.05 Y116.242 E.01528
G1 X62.882 Y116.242 E.03874
G1 X64 Y117.023 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.428194
G1 F4090
G1 X63.996 Y116.638 E.0121
G1 X55.998 Y116.638 E.25108
G1 X55.998 Y117.023 E.0121
G1 X63.94 Y117.023 E.24932
G1 X56.04 Y110.936 F30000
; LINE_WIDTH: 0.502908
G1 F4090
G1 X63.9 Y110.936 E.29465
; WIPE_START
G1 F24000
G1 X61.9 Y110.936 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I-1.178 J.305 P1  F30000
G1 X64.398 Y120.58 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4090
G1 X64.398 Y127.498 E.22947
G1 X55.602 Y127.498 E.29177
G1 X55.602 Y120.58 E.22947
G1 X64.338 Y120.58 E.28978
G1 X64.79 Y120.564 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4090
G1 X64.79 Y127.89 E.22511
G1 X55.21 Y127.89 E.29437
G1 X55.21 Y120.195 E.23645
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X64.79 Y120.195 E.31779
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4090
G1 X64.79 Y120.504 E.00949
M204 S10000
; WIPE_START
G1 F24000
G1 X64.79 Y122.504 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I1.002 J-.691 P1  F30000
G1 X64.002 Y121.362 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.428193
G1 F4090
G1 X64.002 Y120.977 E.0121
G1 X56 Y120.977 E.25121
G1 X56.004 Y121.362 E.0121
G1 X63.942 Y121.362 E.2492
G1 X63.979 Y121.758 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4090
G1 X62.35 Y121.758 E.05401
G1 X64.05 Y123.457 E.07972
G1 X64.05 Y124.867 E.04675
G1 X62.285 Y126.631 E.08276
G1 X59.547 Y126.631 E.09083
G1 X55.95 Y123.034 E.16873
G1 X55.95 Y125.29 E.07483
G1 X59.482 Y121.758 E.16569
G1 X57.854 Y121.758 E.05401
G1 X56.04 Y127.064 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4090
G1 X63.9 Y127.064 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X61.9 Y127.064 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 81/105
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
G3 Z16.4 I-.002 J1.217 P1  F30000
G1 X195.602 Y127.298 Z16.4
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5887
G1 X195.602 Y119.778 E.24944
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X195.602 Y118.222 E.05164
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5887
G1 X195.602 Y110.702 E.24944
G1 X204.398 Y110.702 E.29177
G1 X204.398 Y118.222 E.24944
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X204.398 Y119.778 E.05164
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5887
G1 X204.398 Y120.161 E.01269
G1 X204.398 Y127.298 E.23675
G1 X195.662 Y127.298 E.28978
G1 X195.21 Y127.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5887
G1 X195.21 Y119.778 E.2431
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X195.21 Y118.222 E.05164
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5887
G1 X195.21 Y110.31 E.2431
G1 X204.79 Y110.31 E.29437
G1 X204.79 Y118.222 E.2431
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X204.79 Y119.778 E.05164
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5887
G1 X204.79 Y120.147 E.01134
G1 X204.79 Y127.69 E.23176
G1 X195.27 Y127.69 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.255 Y125.69 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I-1.012 J.676 P1  F30000
G1 X196.04 Y126.864 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502898
G1 F5887
G1 X203.9 Y126.864 E.29464
G1 X202.281 Y126.431 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5887
G1 X200.653 Y126.431 E.05401
G1 X204.05 Y123.034 E.15935
G1 X204.05 Y125.29 E.07483
G1 X199.902 Y121.142 E.19459
G1 X198.266 Y121.142 E.05426
G1 X195.95 Y123.457 E.10862
G1 X195.95 Y124.867 E.04675
G1 X197.515 Y126.431 E.07338
G1 X199.143 Y126.431 E.05401
; WIPE_START
G1 F24000
G1 X197.515 Y126.431 E-.61876
G1 X197.252 Y126.168 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I1.204 J-.174 P1  F30000
G1 X195.94 Y117.08 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.429575
M106 S255
G1 F3000
G1 X195.94 Y120.75 E.11561
G1 X196.327 Y120.75 E.01218
G1 X196.327 Y117.25 E.11027
G1 X196.713 Y117.25 E.01218
G1 X196.713 Y120.75 E.11027
G1 X197.1 Y120.75 E.01218
G1 X197.1 Y117.25 E.11027
G1 X197.487 Y117.25 E.01218
G1 X197.487 Y120.75 E.11027
G1 X197.873 Y120.75 E.01218
G1 X197.873 Y117.25 E.11027
G1 X198.26 Y117.25 E.01218
G1 X198.26 Y120.75 E.11027
G1 X198.647 Y120.75 E.01218
G1 X198.647 Y117.25 E.11027
G1 X199.033 Y117.25 E.01218
G1 X199.033 Y120.75 E.11027
G1 X199.42 Y120.75 E.01218
G1 X199.42 Y117.25 E.11027
G1 X199.807 Y117.25 E.01218
G1 X199.807 Y120.75 E.11027
G1 X200.193 Y120.75 E.01218
G1 X200.193 Y117.25 E.11027
G1 X200.58 Y117.25 E.01218
G1 X200.58 Y120.75 E.11027
G1 X200.967 Y120.75 E.01218
G1 X200.967 Y117.25 E.11027
G1 X201.353 Y117.25 E.01218
G1 X201.353 Y120.75 E.11027
G1 X201.74 Y120.75 E.01218
G1 X201.74 Y117.25 E.11027
G1 X202.127 Y117.25 E.01218
G1 X202.127 Y120.75 E.11027
G1 X202.513 Y120.75 E.01218
G1 X202.513 Y117.25 E.11027
G1 X202.9 Y117.25 E.01218
G1 X202.9 Y120.75 E.11027
G1 X203.287 Y120.75 E.01218
G1 X203.287 Y117.25 E.11027
G1 X203.673 Y117.25 E.01218
G1 X203.673 Y120.75 E.11027
G1 X204.06 Y120.75 E.01218
G1 X204.06 Y117.08 E.11561
M106 S252.45
G1 X204.05 Y113.73 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5887
G1 X204.05 Y115.358 E.05401
G1 X202.55 Y116.858 E.07037
G1 X203.294 Y116.858 E.02468
G1 X198.005 Y111.569 E.24812
G1 X200.163 Y111.569 E.07158
G1 X195.95 Y115.781 E.19761
G1 X195.95 Y116.858 E.03571
G1 X196.502 Y116.858 E.0183
G1 X196.04 Y111.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502898
G1 F5887
G1 X203.9 Y111.136 E.29464
; WIPE_START
G1 F24000
G1 X201.9 Y111.136 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I-.083 J-1.214 P1  F30000
G1 X64.398 Y120.484 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5887
G1 X64.398 Y127.298 E.22603
G1 X55.602 Y127.298 E.29177
G1 X55.602 Y119.778 E.24944
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X55.602 Y118.222 E.05164
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5887
G1 X55.602 Y110.702 E.24944
G1 X64.398 Y110.702 E.29177
G1 X64.398 Y118.222 E.24944
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X64.398 Y119.778 E.05164
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5887
G1 X64.398 Y120.161 E.01269
G1 X64.398 Y120.424 E.00872
G1 X64.79 Y120.484 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5887
G1 X64.79 Y127.69 E.22142
G1 X55.21 Y127.69 E.29437
G1 X55.21 Y119.778 E.2431
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X55.21 Y118.222 E.05164
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5887
G1 X55.21 Y110.31 E.2431
G1 X64.79 Y110.31 E.29437
G1 X64.79 Y118.222 E.2431
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X64.79 Y119.778 E.05164
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5887
G1 X64.79 Y120.147 E.01134
G1 X64.79 Y120.424 E.0085
M204 S10000
; WIPE_START
G1 F24000
G1 X64.79 Y122.424 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I1.206 J-.165 P1  F30000
G1 X64.06 Y117.08 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.429575
M106 S255
G1 F3000
G1 X64.06 Y120.75 E.11561
G1 X63.673 Y120.75 E.01218
G1 X63.673 Y117.25 E.11027
G1 X63.287 Y117.25 E.01218
G1 X63.287 Y120.75 E.11027
G1 X62.9 Y120.75 E.01218
G1 X62.9 Y117.25 E.11027
G1 X62.513 Y117.25 E.01218
G1 X62.513 Y120.75 E.11027
G1 X62.127 Y120.75 E.01218
G1 X62.127 Y117.25 E.11027
G1 X61.74 Y117.25 E.01218
G1 X61.74 Y120.75 E.11027
G1 X61.353 Y120.75 E.01218
G1 X61.353 Y117.25 E.11027
G1 X60.967 Y117.25 E.01218
G1 X60.967 Y120.75 E.11027
G1 X60.58 Y120.75 E.01218
G1 X60.58 Y117.25 E.11027
G1 X60.193 Y117.25 E.01218
G1 X60.193 Y120.75 E.11027
G1 X59.807 Y120.75 E.01218
G1 X59.807 Y117.25 E.11027
G1 X59.42 Y117.25 E.01218
G1 X59.42 Y120.75 E.11027
G1 X59.033 Y120.75 E.01218
G1 X59.033 Y117.25 E.11027
G1 X58.647 Y117.25 E.01218
G1 X58.647 Y120.75 E.11027
G1 X58.26 Y120.75 E.01218
G1 X58.26 Y117.25 E.11027
G1 X57.873 Y117.25 E.01218
G1 X57.873 Y120.75 E.11027
G1 X57.487 Y120.75 E.01218
G1 X57.487 Y117.25 E.11027
G1 X57.1 Y117.25 E.01218
G1 X57.1 Y120.75 E.11027
G1 X56.713 Y120.75 E.01218
M73 P91 R3
G1 X56.713 Y117.25 E.11027
G1 X56.327 Y117.25 E.01218
G1 X56.327 Y120.75 E.11027
G1 X55.94 Y120.75 E.01218
G1 X55.94 Y117.08 E.11561
M106 S252.45
G1 X63.498 Y116.858 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5887
G1 X64.05 Y116.858 E.0183
G1 X64.05 Y115.781 E.03572
G1 X59.837 Y111.569 E.19761
G1 X61.995 Y111.569 E.07158
G1 X56.706 Y116.858 E.24812
G1 X57.45 Y116.858 E.02468
G1 X55.95 Y115.358 E.07037
G1 X55.95 Y113.73 E.05401
G1 X56.04 Y111.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502898
G1 F5887
G1 X63.9 Y111.136 E.29464
; WIPE_START
G1 F24000
G1 X61.9 Y111.136 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I-1.214 J-.083 P1  F30000
G1 X60.857 Y126.431 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5887
G1 X62.485 Y126.431 E.05401
G1 X64.05 Y124.867 E.07338
G1 X64.05 Y123.457 E.04675
G1 X61.734 Y121.142 E.10862
G1 X60.098 Y121.142 E.05426
G1 X55.95 Y125.29 E.19459
G1 X55.95 Y123.034 E.07483
G1 X59.347 Y126.431 E.15935
G1 X57.719 Y126.431 E.05401
G1 X56.04 Y126.864 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502898
G1 F5887
G1 X63.9 Y126.864 E.29464
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X61.9 Y126.864 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 82/105
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
G3 Z16.6 I-.002 J1.217 P1  F30000
G1 X195.602 Y127.098 Z16.6
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4581
G1 X195.602 Y110.902 E.53725
G1 X204.398 Y110.902 E.29177
G1 X204.398 Y127.098 E.53725
G1 X195.662 Y127.098 E.28978
G1 X195.21 Y127.49 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4581
G1 X195.21 Y110.51 E.52175
G1 X204.79 Y110.51 E.29437
G1 X204.79 Y127.49 E.52175
G1 X195.27 Y127.49 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.263 Y125.49 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I-1.015 J.671 P1  F30000
G1 X196.04 Y126.664 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502912
G1 F4581
G1 X203.9 Y126.664 E.29465
G1 X202.481 Y126.231 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4581
G1 X200.853 Y126.231 E.05401
G1 X204.05 Y123.034 E.14997
G1 X204.05 Y125.29 E.07483
G1 X200.416 Y121.657 E.17045
G1 X197.751 Y121.657 E.08841
G1 X195.95 Y123.457 E.08448
G1 X195.95 Y124.867 E.04675
G1 X197.315 Y126.231 E.064
G1 X198.943 Y126.231 E.05401
G1 X198.259 Y119 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42417
G1 F4581
G1 X201.681 Y119 E.10633
G1 X197.88 Y119.379 F30000
; LINE_WIDTH: 0.419999
G1 F4581
G1 X202.12 Y119.379 E.13031
G1 X202.12 Y118.621 E.0233
G1 X197.88 Y118.621 E.13031
G1 X197.88 Y119.319 E.02146
G1 X197.502 Y119.756 F30000
G1 F4581
G1 X202.498 Y119.756 E.15348
G1 X202.498 Y118.244 E.04647
G1 X197.502 Y118.244 E.15348
G1 X197.502 Y119.696 E.04463
G1 X197.125 Y120.133 F30000
G1 F4581
G1 X202.875 Y120.133 E.17666
G1 X202.875 Y117.867 E.06965
G1 X197.125 Y117.867 E.17666
G1 X197.125 Y120.073 E.0678
G1 X196.748 Y120.51 F30000
G1 F4581
G1 X203.252 Y120.51 E.19983
G1 X203.252 Y117.49 E.09282
G1 X196.748 Y117.49 E.19983
G1 X196.748 Y120.45 E.09098
G1 X196.371 Y120.887 F30000
G1 F4581
G1 X203.629 Y120.887 E.223
G1 X203.629 Y117.113 E.11599
G1 X196.371 Y117.113 E.223
G1 X196.371 Y120.827 E.11415
G1 X195.994 Y121.265 F30000
G1 F4581
G1 X204.006 Y121.265 E.24618
G1 X204.006 Y116.735 E.13917
G1 X195.994 Y116.735 E.24618
G1 X195.994 Y121.205 E.13732
G1 X197.017 Y116.343 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4581
G1 X195.95 Y116.343 E.03537
G1 X195.95 Y115.781 E.01864
G1 X199.963 Y111.769 E.18823
G1 X198.205 Y111.769 E.05831
G1 X202.779 Y116.343 E.21459
G1 X203.064 Y116.343 E.00947
G1 X204.05 Y115.358 E.04622
G1 X204.05 Y113.73 E.05401
G1 X196.04 Y111.336 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F4581
G1 X203.9 Y111.336 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y111.336 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I-.08 J-1.214 P1  F30000
G1 X64.398 Y120.433 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4581
G1 X64.398 Y127.098 E.22107
G1 X55.602 Y127.098 E.29177
G1 X55.602 Y110.902 E.53725
G1 X64.398 Y110.902 E.29177
G1 X64.398 Y120.373 E.31418
G1 X64.79 Y120.433 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4581
G1 X64.79 Y127.49 E.21683
G1 X55.21 Y127.49 E.29437
G1 X55.21 Y110.51 E.52175
G1 X64.79 Y110.51 E.29437
G1 X64.79 Y120.373 E.30307
M204 S10000
; WIPE_START
G1 F24000
G1 X64.79 Y122.373 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I1.166 J-.349 P1  F30000
G1 X62.983 Y116.343 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4581
G1 X64.05 Y116.343 E.03537
G1 X64.05 Y115.781 E.01864
G1 X60.037 Y111.769 E.18822
G1 X61.795 Y111.769 E.05831
G1 X57.221 Y116.343 E.21459
G1 X56.936 Y116.343 E.00947
G1 X55.95 Y115.358 E.04622
G1 X55.95 Y113.73 E.05401
G1 X56.04 Y111.336 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F4581
G1 X63.9 Y111.336 E.29465
G1 X58.259 Y119 F30000
; LINE_WIDTH: 0.42417
G1 F4581
G1 X61.681 Y119 E.10633
G1 X62.12 Y119.379 F30000
; LINE_WIDTH: 0.419999
G1 F4581
G1 X62.12 Y118.621 E.0233
G1 X57.88 Y118.621 E.13031
G1 X57.88 Y119.379 E.0233
G1 X62.06 Y119.379 E.12847
G1 X62.498 Y119.756 F30000
G1 F4581
G1 X62.498 Y118.244 E.04647
G1 X57.502 Y118.244 E.15348
G1 X57.502 Y119.756 E.04647
G1 X62.438 Y119.756 E.15164
G1 X62.875 Y120.133 F30000
G1 F4581
G1 X62.875 Y117.867 E.06965
G1 X57.125 Y117.867 E.17666
G1 X57.125 Y120.133 E.06965
G1 X62.815 Y120.133 E.17481
G1 X63.252 Y120.51 F30000
G1 F4581
G1 X63.252 Y117.49 E.09282
G1 X56.748 Y117.49 E.19983
G1 X56.748 Y120.51 E.09282
G1 X63.192 Y120.51 E.19799
G1 X63.629 Y120.887 F30000
G1 F4581
G1 X63.629 Y117.113 E.11599
G1 X56.371 Y117.113 E.223
G1 X56.371 Y120.887 E.11599
G1 X63.569 Y120.887 E.22116
G1 X64.006 Y121.265 F30000
G1 F4581
G1 X64.006 Y116.735 E.13917
G1 X55.994 Y116.735 E.24618
G1 X55.994 Y121.265 E.13917
G1 X63.946 Y121.265 E.24433
G1 X61.057 Y126.231 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4581
G1 X62.685 Y126.231 E.05401
G1 X64.05 Y124.867 E.064
G1 X64.05 Y123.457 E.04675
G1 X62.249 Y121.657 E.08448
G1 X59.584 Y121.657 E.08841
M73 P92 R3
G1 X55.95 Y125.29 E.17045
G1 X55.95 Y123.034 E.07483
G1 X59.147 Y126.231 E.14997
G1 X57.519 Y126.231 E.05401
G1 X56.04 Y126.664 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502912
G1 F4581
G1 X63.9 Y126.664 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X61.9 Y126.664 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 83/105
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
G3 Z16.8 I-.002 J1.217 P1  F30000
G1 X195.602 Y126.898 Z16.8
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4541
G1 X195.602 Y111.102 E.52398
G1 X204.398 Y111.102 E.29177
G1 X204.398 Y126.898 E.52398
G1 X195.662 Y126.898 E.28978
G1 X195.21 Y127.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4541
G1 X195.21 Y110.71 E.50946
G1 X204.79 Y110.71 E.29437
G1 X204.79 Y127.29 E.50946
G1 X195.27 Y127.29 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.263 Y125.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I-1.015 J.671 P1  F30000
G1 X196.04 Y126.464 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4541
G1 X203.9 Y126.464 E.29465
G1 X202.681 Y126.031 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4541
G1 X201.053 Y126.031 E.05401
G1 X204.05 Y123.034 E.14059
G1 X204.05 Y125.29 E.07483
G1 X200.416 Y121.657 E.17045
G1 X197.751 Y121.657 E.08841
G1 X195.95 Y123.457 E.08448
G1 X195.95 Y124.867 E.04675
G1 X197.115 Y126.031 E.05462
G1 X198.743 Y126.031 E.05401
G1 X198.259 Y119 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42417
G1 F4541
G1 X201.681 Y119 E.10633
G1 X197.88 Y119.379 F30000
; LINE_WIDTH: 0.419999
G1 F4541
G1 X202.12 Y119.379 E.13031
G1 X202.12 Y118.621 E.0233
G1 X197.88 Y118.621 E.13031
G1 X197.88 Y119.319 E.02146
G1 X197.502 Y119.756 F30000
G1 F4541
G1 X202.498 Y119.756 E.15348
G1 X202.498 Y118.244 E.04647
G1 X197.502 Y118.244 E.15348
G1 X197.502 Y119.696 E.04463
G1 X197.125 Y120.133 F30000
G1 F4541
G1 X202.875 Y120.133 E.17666
G1 X202.875 Y117.867 E.06965
G1 X197.125 Y117.867 E.17666
G1 X197.125 Y120.073 E.0678
G1 X196.748 Y120.51 F30000
G1 F4541
G1 X203.252 Y120.51 E.19983
G1 X203.252 Y117.49 E.09282
G1 X196.748 Y117.49 E.19983
G1 X196.748 Y120.45 E.09098
G1 X196.371 Y120.887 F30000
G1 F4541
G1 X203.629 Y120.887 E.223
G1 X203.629 Y117.113 E.11599
G1 X196.371 Y117.113 E.223
G1 X196.371 Y120.827 E.11415
G1 X195.994 Y121.265 F30000
G1 F4541
G1 X204.006 Y121.265 E.24618
G1 X204.006 Y116.735 E.13917
G1 X195.994 Y116.735 E.24618
G1 X195.994 Y121.205 E.13732
G1 X197.017 Y116.343 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4541
G1 X195.95 Y116.343 E.03537
G1 X195.95 Y115.781 E.01864
G1 X199.763 Y111.969 E.17884
G1 X198.405 Y111.969 E.04504
G1 X202.779 Y116.343 E.2052
G1 X203.064 Y116.343 E.00947
G1 X204.05 Y115.358 E.04622
G1 X204.05 Y113.73 E.05401
G1 X196.04 Y111.536 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4541
G1 X203.9 Y111.536 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y111.536 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I-.078 J-1.214 P1  F30000
G1 X64.398 Y120.384 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4541
G1 X64.398 Y126.898 E.21608
G1 X55.602 Y126.898 E.29177
G1 X55.602 Y111.102 E.52398
G1 X64.398 Y111.102 E.29177
G1 X64.398 Y120.324 E.30591
G1 X64.79 Y120.384 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4541
G1 X64.79 Y127.29 E.2122
G1 X55.21 Y127.29 E.29437
G1 X55.21 Y110.71 E.50946
G1 X64.79 Y110.71 E.29437
G1 X64.79 Y120.324 E.29541
M204 S10000
; WIPE_START
G1 F24000
G1 X64.79 Y122.324 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I1.165 J-.352 P1  F30000
G1 X62.983 Y116.343 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4541
G1 X64.05 Y116.343 E.03537
G1 X64.05 Y115.781 E.01864
G1 X60.237 Y111.969 E.17884
G1 X61.595 Y111.969 E.04504
G1 X57.221 Y116.343 E.2052
G1 X56.936 Y116.343 E.00947
G1 X55.95 Y115.358 E.04622
G1 X55.95 Y113.73 E.05401
G1 X58.259 Y119 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42417
G1 F4541
G1 X61.681 Y119 E.10633
G1 X62.12 Y119.379 F30000
; LINE_WIDTH: 0.419999
G1 F4541
G1 X62.12 Y118.621 E.0233
G1 X57.88 Y118.621 E.13031
G1 X57.88 Y119.379 E.0233
G1 X62.06 Y119.379 E.12847
G1 X62.498 Y119.756 F30000
G1 F4541
G1 X62.498 Y118.244 E.04647
G1 X57.502 Y118.244 E.15348
G1 X57.502 Y119.756 E.04647
G1 X62.438 Y119.756 E.15164
G1 X62.875 Y120.133 F30000
G1 F4541
G1 X62.875 Y117.867 E.06965
G1 X57.125 Y117.867 E.17666
G1 X57.125 Y120.133 E.06965
G1 X62.815 Y120.133 E.17481
G1 X63.252 Y120.51 F30000
G1 F4541
G1 X63.252 Y117.49 E.09282
G1 X56.748 Y117.49 E.19983
G1 X56.748 Y120.51 E.09282
G1 X63.192 Y120.51 E.19799
G1 X63.629 Y120.887 F30000
G1 F4541
G1 X63.629 Y117.113 E.11599
G1 X56.371 Y117.113 E.223
G1 X56.371 Y120.887 E.11599
G1 X63.569 Y120.887 E.22116
G1 X64.006 Y121.265 F30000
G1 F4541
G1 X64.006 Y116.735 E.13917
G1 X55.994 Y116.735 E.24618
G1 X55.994 Y121.265 E.13917
G1 X63.946 Y121.265 E.24433
G1 X64.05 Y125.567 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4541
G1 X64.05 Y126.031 E.01539
G1 X62.885 Y126.031 E.03862
G1 X64.05 Y124.867 E.05462
G1 X64.05 Y123.457 E.04675
G1 X62.249 Y121.657 E.08448
G1 X59.584 Y121.657 E.08841
G1 X55.95 Y125.29 E.17045
G1 X55.95 Y123.034 E.07483
G1 X58.947 Y126.031 E.14059
G1 X60.575 Y126.031 E.05401
G1 X56.04 Y126.464 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4541
G1 X63.9 Y126.464 E.29465
G1 X63.96 Y111.536 F30000
; LINE_WIDTH: 0.50291
G1 F4541
G1 X56.1 Y111.536 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X58.1 Y111.536 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 84/105
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
G3 Z17 I-.133 J1.21 P1  F30000
G1 X195.602 Y126.698 Z17
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2851
G1 X195.602 Y111.302 E.51071
G1 X204.398 Y111.302 E.29177
G1 X204.398 Y126.698 E.51071
G1 X195.662 Y126.698 E.28978
G1 X195.21 Y127.09 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2851
G1 X195.21 Y110.91 E.49717
G1 X204.79 Y110.91 E.29437
G1 X204.79 Y127.09 E.49717
G1 X195.27 Y127.09 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.263 Y125.09 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I-1.015 J.672 P1  F30000
G1 X196.04 Y126.264 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2851
G1 X203.9 Y126.264 E.29465
G1 X202.881 Y125.831 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2851
G1 X201.253 Y125.831 E.05401
G1 X204.05 Y123.034 E.1312
G1 X204.05 Y125.29 E.07483
G1 X195.95 Y117.191 E.37996
G1 X195.95 Y115.781 E.04675
G1 X199.563 Y112.169 E.16946
G1 X198.605 Y112.169 E.03177
G1 X204.05 Y117.614 E.25543
G1 X204.05 Y115.358 E.07483
G1 X195.95 Y123.457 E.37996
G1 X195.95 Y124.867 E.04675
G1 X196.915 Y125.831 E.04523
G1 X198.543 Y125.831 E.05401
G1 X196.04 Y111.736 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2851
G1 X203.9 Y111.736 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y111.736 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I-.076 J-1.215 P1  F30000
G1 X64.398 Y120.336 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2851
G1 X64.398 Y126.698 E.21104
G1 X55.602 Y126.698 E.29177
G1 X55.602 Y111.302 E.51071
G1 X64.398 Y111.302 E.29177
G1 X64.398 Y120.276 E.29768
G1 X64.79 Y120.336 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2851
G1 X64.79 Y127.09 E.20753
G1 X55.21 Y127.09 E.29437
G1 X55.21 Y110.91 E.49717
G1 X64.79 Y110.91 E.29437
G1 X64.79 Y120.276 E.28779
M204 S10000
; WIPE_START
G1 F24000
G1 X64.79 Y122.276 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I-.888 J-.832 P1  F30000
G1 X61.457 Y125.831 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2851
G1 X63.085 Y125.831 E.05401
G1 X64.05 Y124.867 E.04523
G1 X64.05 Y123.457 E.04675
G1 X55.95 Y115.358 E.37996
G1 X55.95 Y117.614 E.07483
G1 X61.395 Y112.169 E.25543
G1 X60.437 Y112.169 E.03177
G1 X64.05 Y115.781 E.16946
G1 X64.05 Y117.191 E.04675
G1 X55.95 Y125.29 E.37996
G1 X55.95 Y123.034 E.07483
G1 X58.747 Y125.831 E.1312
G1 X60.375 Y125.831 E.05401
G1 X56.04 Y126.264 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2851
G1 X63.9 Y126.264 E.29465
G1 X56.04 Y111.736 F30000
G1 F2851
G1 X63.9 Y111.736 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X61.9 Y111.736 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 85/105
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
G3 Z17.2 I-.134 J1.21 P1  F30000
G1 X195.602 Y126.498 Z17.2
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2797
G1 X195.602 Y111.502 E.49744
G1 X204.398 Y111.502 E.29177
G1 X204.398 Y126.498 E.49744
G1 X195.662 Y126.498 E.28978
G1 X195.21 Y126.89 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2797
G1 X195.21 Y111.11 E.48488
G1 X204.79 Y111.11 E.29437
G1 X204.79 Y126.89 E.48488
G1 X195.27 Y126.89 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.262 Y124.89 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I-1.015 J.672 P1  F30000
G1 X196.04 Y126.064 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2797
G1 X203.9 Y126.064 E.29465
G1 X199.825 Y125.631 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2797
G1 X201.453 Y125.631 E.05401
G1 X204.05 Y123.034 E.12182
G1 X204.05 Y125.29 E.07483
G1 X195.95 Y117.191 E.37996
G1 X195.95 Y115.781 E.04675
G1 X199.363 Y112.369 E.16008
G1 X198.805 Y112.369 E.01851
G1 X204.05 Y117.614 E.24605
G1 X204.05 Y115.358 E.07483
G1 X195.95 Y123.457 E.37996
G1 X195.95 Y124.867 E.04675
G1 X196.715 Y125.631 E.03585
G1 X198.343 Y125.631 E.05401
G1 X196.04 Y111.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2797
G1 X203.9 Y111.936 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y111.936 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I-.074 J-1.215 P1  F30000
G1 X64.398 Y120.289 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2797
G1 X64.398 Y126.498 E.20595
G1 X55.602 Y126.498 E.29177
G1 X55.602 Y111.502 E.49744
G1 X64.398 Y111.502 E.29177
G1 X64.398 Y120.229 E.2895
G1 X64.79 Y120.289 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2797
G1 X64.79 Y126.89 E.20282
G1 X55.21 Y126.89 E.29437
G1 X55.21 Y111.11 E.48488
G1 X64.79 Y111.11 E.29437
G1 X64.79 Y120.229 E.28021
M204 S10000
; WIPE_START
G1 F24000
G1 X64.79 Y122.229 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I-.895 J-.824 P1  F30000
G1 X61.657 Y125.631 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2797
G1 X63.285 Y125.631 E.05401
G1 X64.05 Y124.867 E.03585
G1 X64.05 Y123.457 E.04675
G1 X55.95 Y115.358 E.37996
G1 X55.95 Y117.614 E.07483
G1 X61.195 Y112.369 E.24605
G1 X60.637 Y112.369 E.01851
G1 X64.05 Y115.781 E.16008
G1 X64.05 Y117.191 E.04675
G1 X55.95 Y125.29 E.37996
G1 X55.95 Y123.034 E.07483
G1 X58.547 Y125.631 E.12182
G1 X60.175 Y125.631 E.05401
G1 X56.04 Y126.064 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2797
G1 X63.9 Y126.064 E.29465
G1 X56.04 Y111.936 F30000
G1 F2797
G1 X63.9 Y111.936 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 17.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X61.9 Y111.936 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 86/105
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
G3 Z17.4 I-.13 J1.21 P1  F30000
G1 X195.602 Y126.298 Z17.4
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2743
G1 X195.602 Y111.702 E.48417
G1 X204.398 Y111.702 E.29177
G1 X204.398 Y126.298 E.48417
G1 X195.662 Y126.298 E.28978
G1 X195.21 Y126.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2743
G1 X195.21 Y111.31 E.47258
G1 X204.79 Y111.31 E.29437
G1 X204.79 Y126.69 E.47258
G1 X195.27 Y126.69 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.262 Y124.69 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I-1.015 J.672 P1  F30000
G1 X196.04 Y125.864 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2743
G1 X203.9 Y125.864 E.29465
G1 X200.025 Y125.431 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2743
G1 X201.653 Y125.431 E.05401
G1 X204.05 Y123.034 E.11244
G1 X204.05 Y125.29 E.07483
G1 X195.95 Y117.191 E.37996
G1 X195.95 Y115.781 E.04675
G1 X199.163 Y112.569 E.1507
G1 X199.005 Y112.569 E.00524
G1 X204.05 Y117.614 E.23667
M73 P93 R3
G1 X204.05 Y115.358 E.07483
G1 X195.95 Y123.457 E.37996
G1 X195.95 Y124.867 E.04675
G1 X196.515 Y125.431 E.02647
G1 X198.143 Y125.431 E.05401
G1 X196.04 Y112.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2743
G1 X203.9 Y112.136 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y112.136 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I-.072 J-1.215 P1  F30000
G1 X64.398 Y120.244 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2743
G1 X64.398 Y126.298 E.20082
G1 X55.602 Y126.298 E.29177
G1 X55.602 Y111.702 E.48417
G1 X64.398 Y111.702 E.29177
G1 X64.398 Y120.184 E.28136
G1 X64.79 Y120.244 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2743
G1 X64.79 Y126.69 E.19806
G1 X55.21 Y126.69 E.29437
G1 X55.21 Y111.31 E.47258
G1 X64.79 Y111.31 E.29437
G1 X64.79 Y120.184 E.27268
M204 S10000
; WIPE_START
G1 F24000
G1 X64.79 Y122.184 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I-.903 J-.816 P1  F30000
G1 X61.857 Y125.431 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2743
G1 X63.485 Y125.431 E.05401
G1 X64.05 Y124.867 E.02647
G1 X64.05 Y123.457 E.04675
G1 X55.95 Y115.358 E.37996
G1 X55.95 Y117.614 E.07483
G1 X60.995 Y112.569 E.23667
G1 X60.837 Y112.569 E.00524
G1 X64.05 Y115.781 E.15069
G1 X64.05 Y117.191 E.04675
G1 X55.95 Y125.29 E.37996
G1 X55.95 Y123.034 E.07483
G1 X58.347 Y125.431 E.11244
G1 X59.975 Y125.431 E.05401
G1 X56.04 Y125.864 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2743
G1 X63.9 Y125.864 E.29465
G1 X56.04 Y112.136 F30000
G1 F2743
G1 X63.9 Y112.136 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 17.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X61.9 Y112.136 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 87/105
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
G3 Z17.6 I-.126 J1.21 P1  F30000
G1 X195.602 Y126.098 Z17.6
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2695
G1 X195.602 Y111.902 E.4709
G1 X204.398 Y111.902 E.29177
G1 X204.398 Y126.098 E.4709
G1 X195.662 Y126.098 E.28978
G1 X195.21 Y126.49 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2695
G1 X195.21 Y111.51 E.46029
G1 X204.79 Y111.51 E.29437
G1 X204.79 Y126.49 E.46029
G1 X195.27 Y126.49 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.262 Y124.49 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I-1.015 J.672 P1  F30000
G1 X196.04 Y125.664 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2695
G1 X203.9 Y125.664 E.29465
G1 X204.05 Y121.406 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2695
G1 X204.05 Y123.034 E.05401
G1 X201.853 Y125.231 E.10306
G1 X203.991 Y125.231 E.07091
G1 X195.95 Y117.191 E.37718
G1 X195.95 Y115.781 E.04675
G1 X198.963 Y112.769 E.14131
G1 X199.205 Y112.769 E.00803
G1 X204.05 Y117.614 E.22728
G1 X204.05 Y115.358 E.07483
G1 X195.95 Y123.457 E.37996
G1 X195.95 Y124.867 E.04675
G1 X196.315 Y125.231 E.01709
G1 X197.943 Y125.231 E.05401
G1 X196.04 Y112.336 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2695
G1 X203.9 Y112.336 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y112.336 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I-.069 J-1.215 P1  F30000
G1 X64.398 Y120.2 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2695
G1 X64.398 Y126.098 E.19563
G1 X55.602 Y126.098 E.29177
G1 X55.602 Y111.902 E.4709
G1 X64.398 Y111.902 E.29177
G1 X64.398 Y120.14 E.27328
G1 X64.79 Y120.2 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2695
G1 X64.79 Y126.49 E.19326
G1 X55.21 Y126.49 E.29437
G1 X55.21 Y111.51 E.46029
G1 X64.79 Y111.51 E.29437
G1 X64.79 Y120.14 E.26519
M204 S10000
; WIPE_START
G1 F24000
G1 X64.79 Y122.14 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I-.912 J-.806 P1  F30000
G1 X62.057 Y125.231 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2695
G1 X63.685 Y125.231 E.05401
G1 X64.05 Y124.867 E.01709
G1 X64.05 Y123.457 E.04675
G1 X55.95 Y115.358 E.37996
G1 X55.95 Y117.614 E.07483
G1 X60.795 Y112.769 E.22728
G1 X61.037 Y112.769 E.00803
G1 X64.05 Y115.781 E.14131
G1 X64.05 Y117.191 E.04675
G1 X56.009 Y125.231 E.37718
G1 X58.147 Y125.231 E.07091
G1 X55.95 Y123.034 E.10306
G1 X55.95 Y121.406 E.05401
G1 X56.04 Y125.664 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2695
G1 X63.9 Y125.664 E.29465
G1 X56.04 Y112.336 F30000
G1 F2695
G1 X63.9 Y112.336 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 17.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X61.9 Y112.336 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 88/105
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
G3 Z17.8 I-.123 J1.211 P1  F30000
G1 X195.602 Y125.898 Z17.8
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2644
G1 X195.602 Y112.102 E.45763
G1 X204.398 Y112.102 E.29177
G1 X204.398 Y125.898 E.45763
G1 X195.662 Y125.898 E.28978
G1 X195.21 Y126.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2644
G1 X195.21 Y111.71 E.448
G1 X204.79 Y111.71 E.29437
G1 X204.79 Y126.29 E.448
G1 X195.27 Y126.29 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.262 Y124.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I-1.015 J.672 P1  F30000
G1 X196.04 Y125.464 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2644
G1 X203.9 Y125.464 E.29465
G1 X204.05 Y121.406 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2644
G1 X204.05 Y123.034 E.05401
G1 X202.053 Y125.031 E.09367
G1 X203.791 Y125.031 E.05764
G1 X195.95 Y117.191 E.3678
G1 X195.95 Y115.781 E.04675
G1 X198.763 Y112.969 E.13193
G1 X199.405 Y112.969 E.0213
G1 X204.05 Y117.614 E.2179
G1 X204.05 Y115.358 E.07483
G1 X195.95 Y123.457 E.37996
G1 X195.95 Y124.867 E.04675
G1 X196.115 Y125.031 E.0077
G1 X197.743 Y125.031 E.05401
G1 X196.04 Y112.536 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2644
G1 X203.9 Y112.536 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y112.536 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I-.067 J-1.215 P1  F30000
G1 X64.398 Y120.159 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2644
G1 X64.398 Y125.898 E.19038
G1 X55.602 Y125.898 E.29177
G1 X55.602 Y112.102 E.45763
G1 X64.398 Y112.102 E.29177
G1 X64.398 Y120.099 E.26526
G1 X64.79 Y120.159 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2644
G1 X64.79 Y126.29 E.1884
G1 X55.21 Y126.29 E.29437
G1 X55.21 Y111.71 E.448
G1 X64.79 Y111.71 E.29437
G1 X64.79 Y120.099 E.25776
M204 S10000
; WIPE_START
G1 F24000
G1 X64.79 Y122.099 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P93 R2
G3 Z18 I-.921 J-.796 P1  F30000
G1 X62.257 Y125.031 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2644
G1 X63.885 Y125.031 E.05401
G1 X64.05 Y124.867 E.0077
G1 X64.05 Y123.457 E.04675
G1 X55.95 Y115.358 E.37996
G1 X55.95 Y117.614 E.07483
G1 X60.595 Y112.969 E.2179
G1 X61.237 Y112.969 E.0213
G1 X64.05 Y115.781 E.13193
G1 X64.05 Y117.191 E.04675
G1 X56.209 Y125.031 E.3678
G1 X57.947 Y125.031 E.05764
G1 X55.95 Y123.034 E.09367
G1 X55.95 Y121.406 E.05401
G1 X56.04 Y125.464 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2644
G1 X63.9 Y125.464 E.29465
G1 X56.04 Y112.536 F30000
G1 F2644
G1 X63.9 Y112.536 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 17.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X61.9 Y112.536 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 89/105
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
G3 Z18 I-.119 J1.211 P1  F30000
G1 X195.602 Y125.698 Z18
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2568
G1 X195.602 Y112.302 E.44436
G1 X204.398 Y112.302 E.29177
G1 X204.398 Y125.698 E.44436
G1 X195.662 Y125.698 E.28978
G1 X195.21 Y126.09 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2568
G1 X195.21 Y111.91 E.43571
G1 X204.79 Y111.91 E.29437
G1 X204.79 Y126.09 E.43571
G1 X195.27 Y126.09 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.262 Y124.09 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I-1.014 J.672 P1  F30000
G1 X196.04 Y125.264 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2568
G1 X203.9 Y125.264 E.29465
G1 X204.05 Y121.406 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2568
G1 X204.05 Y123.034 E.05401
G1 X202.253 Y124.831 E.08429
G1 X203.591 Y124.831 E.04437
G1 X195.95 Y117.191 E.35842
G1 X195.95 Y115.781 E.04675
G1 X198.563 Y113.169 E.12255
G1 X199.605 Y113.169 E.03457
G1 X204.05 Y117.614 E.20852
G1 X204.05 Y115.358 E.07483
G1 X195.95 Y123.457 E.37996
G1 X195.95 Y124.831 E.04556
G1 X196.205 Y124.831 E.00845
G1 X196.04 Y112.736 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2568
G1 X203.9 Y112.736 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y112.736 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I-.065 J-1.215 P1  F30000
G1 X64.398 Y120.119 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2568
G1 X64.398 Y125.698 E.18508
G1 X55.602 Y125.698 E.29177
G1 X55.602 Y112.302 E.44436
G1 X64.398 Y112.302 E.29177
G1 X64.398 Y120.059 E.2573
G1 X64.79 Y120.119 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2568
G1 X64.79 Y126.09 E.18349
G1 X55.21 Y126.09 E.29437
G1 X55.21 Y111.91 E.43571
M73 P94 R2
G1 X64.79 Y111.91 E.29437
G1 X64.79 Y120.059 E.25038
M204 S10000
; WIPE_START
G1 F24000
G1 X64.79 Y122.059 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I-1.145 J-.411 P1  F30000
G1 X63.795 Y124.831 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2568
G1 X64.05 Y124.831 E.00845
G1 X64.05 Y123.457 E.04556
G1 X55.95 Y115.358 E.37996
G1 X55.95 Y117.614 E.07483
G1 X60.395 Y113.169 E.20852
G1 X61.437 Y113.169 E.03457
G1 X64.05 Y115.781 E.12255
G1 X64.05 Y117.191 E.04675
G1 X56.409 Y124.831 E.35842
G1 X57.747 Y124.831 E.04437
G1 X55.95 Y123.034 E.08429
G1 X55.95 Y121.406 E.05401
G1 X56.04 Y125.264 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2568
G1 X63.9 Y125.264 E.29465
G1 X56.04 Y112.736 F30000
G1 F2568
G1 X63.9 Y112.736 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 18
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X61.9 Y112.736 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 90/105
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
G3 Z18.2 I-.116 J1.211 P1  F30000
G1 X195.602 Y125.498 Z18.2
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2522
G1 X195.602 Y112.502 E.4311
G1 X204.398 Y112.502 E.29177
G1 X204.398 Y125.498 E.4311
G1 X195.662 Y125.498 E.28978
G1 X195.21 Y125.89 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2522
G1 X195.21 Y112.11 E.42342
G1 X204.79 Y112.11 E.29437
G1 X204.79 Y125.89 E.42342
G1 X195.27 Y125.89 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.261 Y123.89 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I-1.014 J.672 P1  F30000
G1 X196.04 Y125.064 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2522
G1 X203.9 Y125.064 E.29465
G1 X204.05 Y121.406 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2522
G1 X204.05 Y123.034 E.05401
G1 X202.453 Y124.631 E.07491
G1 X203.391 Y124.631 E.0311
G1 X195.95 Y117.191 E.34903
G1 X195.95 Y115.781 E.04675
G1 X198.363 Y113.369 E.11317
G1 X199.805 Y113.369 E.04784
G1 X204.05 Y117.614 E.19914
G1 X204.05 Y115.358 E.07483
G1 X195.95 Y123.457 E.37996
G1 X195.95 Y124.631 E.03893
G1 X196.405 Y124.631 E.01509
G1 X196.04 Y112.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2522
G1 X203.9 Y112.936 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y112.936 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I-.063 J-1.215 P1  F30000
G1 X64.398 Y120.08 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2522
G1 X64.398 Y125.498 E.17971
G1 X55.602 Y125.498 E.29177
G1 X55.602 Y112.502 E.4311
G1 X64.398 Y112.502 E.29177
G1 X64.398 Y120.02 E.2494
G1 X64.79 Y120.08 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2522
G1 X64.79 Y125.89 E.17851
G1 X55.21 Y125.89 E.29437
G1 X55.21 Y112.11 E.42342
G1 X64.79 Y112.11 E.29437
G1 X64.79 Y120.02 E.24307
M204 S10000
; WIPE_START
G1 F24000
G1 X64.79 Y122.02 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I-1.107 J-.507 P1  F30000
G1 X63.595 Y124.631 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2522
G1 X64.05 Y124.631 E.01509
G1 X64.05 Y123.457 E.03893
G1 X55.95 Y115.358 E.37996
G1 X55.95 Y117.614 E.07483
G1 X60.195 Y113.369 E.19914
G1 X61.637 Y113.369 E.04784
G1 X64.05 Y115.781 E.11317
G1 X64.05 Y117.191 E.04675
G1 X56.609 Y124.631 E.34903
G1 X57.547 Y124.631 E.03111
G1 X55.95 Y123.034 E.07491
G1 X55.95 Y121.406 E.05401
G1 X56.04 Y125.064 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2522
G1 X63.9 Y125.064 E.29465
G1 X56.04 Y112.936 F30000
G1 F2522
G1 X63.9 Y112.936 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 18.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X61.9 Y112.936 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 91/105
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
G3 Z18.4 I-.112 J1.212 P1  F30000
G1 X195.602 Y125.298 Z18.4
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2476
G1 X195.602 Y112.702 E.41783
G1 X204.398 Y112.702 E.29177
G1 X204.398 Y125.298 E.41783
G1 X195.662 Y125.298 E.28978
G1 X195.21 Y125.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2476
G1 X195.21 Y112.31 E.41113
G1 X204.79 Y112.31 E.29437
G1 X204.79 Y125.69 E.41113
G1 X195.27 Y125.69 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.261 Y123.69 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I-1.014 J.672 P1  F30000
G1 X196.04 Y124.864 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2476
G1 X203.9 Y124.864 E.29465
G1 X204.05 Y121.406 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2476
G1 X204.05 Y123.034 E.05401
G1 X202.653 Y124.431 E.06553
G1 X203.191 Y124.431 E.01784
G1 X195.95 Y117.191 E.33965
G1 X195.95 Y115.781 E.04675
G1 X198.163 Y113.569 E.10378
G1 X200.005 Y113.569 E.06111
G1 X204.05 Y117.614 E.18975
G1 X204.05 Y115.358 E.07483
G1 X195.95 Y123.457 E.37996
G1 X195.95 Y124.431 E.03229
G1 X196.605 Y124.431 E.02172
G1 X196.04 Y113.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2476
G1 X203.9 Y113.136 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y113.136 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I-.107 J-1.212 P1  F30000
G1 X64.398 Y125.298 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2476
G1 X55.602 Y125.298 E.29177
G1 X55.602 Y112.702 E.41783
G1 X64.398 Y112.702 E.29177
G1 X64.398 Y125.238 E.41584
G1 X64.79 Y125.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2476
G1 X55.21 Y125.69 E.29437
G1 X55.21 Y112.31 E.41113
G1 X64.79 Y112.31 E.29437
G1 X64.79 Y125.63 E.40929
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y125.643 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I1.089 J.543 P1  F30000
G1 X63.395 Y124.431 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2476
G1 X64.05 Y124.431 E.02172
G1 X64.05 Y123.457 E.03229
G1 X55.95 Y115.358 E.37996
G1 X55.95 Y117.614 E.07483
G1 X59.995 Y113.569 E.18975
G1 X61.837 Y113.569 E.06111
G1 X64.05 Y115.781 E.10378
G1 X64.05 Y117.191 E.04675
G1 X56.809 Y124.431 E.33965
G1 X57.347 Y124.431 E.01784
G1 X55.95 Y123.034 E.06553
G1 X55.95 Y121.406 E.05401
G1 X56.04 Y124.864 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2476
G1 X63.9 Y124.864 E.29465
G1 X56.04 Y113.136 F30000
G1 F2476
G1 X63.9 Y113.136 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 18.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X61.9 Y113.136 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 92/105
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
G3 Z18.6 I-.108 J1.212 P1  F30000
G1 X195.602 Y125.098 Z18.6
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2430
G1 X195.602 Y112.902 E.40456
G1 X204.398 Y112.902 E.29177
G1 X204.398 Y125.098 E.40456
G1 X195.662 Y125.098 E.28978
G1 X195.21 Y125.49 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2430
G1 X195.21 Y112.51 E.39884
G1 X204.79 Y112.51 E.29437
G1 X204.79 Y125.49 E.39884
G1 X195.27 Y125.49 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.261 Y123.49 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.8 I-1.014 J.673 P1  F30000
G1 X196.04 Y124.664 Z18.8
G1 Z18.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2430
G1 X203.9 Y124.664 E.29465
G1 X204.05 Y121.406 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
G1 X204.05 Y123.034 E.05401
G1 X202.853 Y124.231 E.05614
G1 X202.991 Y124.231 E.00457
G1 X195.95 Y117.191 E.33027
G1 X195.95 Y115.781 E.04675
G1 X197.963 Y113.769 E.0944
G1 X200.205 Y113.769 E.07438
G1 X204.05 Y117.614 E.18037
G1 X204.05 Y115.358 E.07483
G1 X195.95 Y123.457 E.37996
G1 X195.95 Y124.231 E.02566
G1 X196.805 Y124.231 E.02836
G1 X196.04 Y113.336 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2430
G1 X203.9 Y113.336 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y113.336 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.8 I-.104 J-1.213 P1  F30000
G1 X64.398 Y125.098 Z18.8
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2430
G1 X55.602 Y125.098 E.29177
G1 X55.602 Y112.902 E.40456
G1 X64.398 Y112.902 E.29177
G1 X64.398 Y125.038 E.40257
G1 X64.79 Y125.49 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2430
G1 X55.21 Y125.49 E.29437
G1 X55.21 Y112.51 E.39884
G1 X64.79 Y112.51 E.29437
G1 X64.79 Y125.43 E.397
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y125.443 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.8 I1.154 J.386 P1  F30000
G1 X63.195 Y124.231 Z18.8
G1 Z18.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2430
G1 X64.05 Y124.231 E.02836
G1 X64.05 Y123.457 E.02566
G1 X55.95 Y115.358 E.37996
G1 X55.95 Y117.614 E.07483
G1 X59.795 Y113.769 E.18037
G1 X62.037 Y113.769 E.07438
G1 X64.05 Y115.781 E.0944
G1 X64.05 Y117.191 E.04675
G1 X57.009 Y124.231 E.33027
M73 P95 R2
G1 X57.147 Y124.231 E.00457
G1 X55.95 Y123.034 E.05615
G1 X55.95 Y121.406 E.05401
G1 X56.04 Y124.664 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2430
G1 X63.9 Y124.664 E.29465
G1 X56.04 Y113.336 F30000
G1 F2430
G1 X63.9 Y113.336 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 18.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X61.9 Y113.336 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 93/105
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
G3 Z18.8 I-.105 J1.212 P1  F30000
G1 X195.602 Y124.898 Z18.8
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2392
G1 X195.602 Y113.102 E.39129
G1 X204.398 Y113.102 E.29177
G1 X204.398 Y124.898 E.39129
G1 X195.662 Y124.898 E.28978
G1 X195.21 Y125.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2392
G1 X195.21 Y112.71 E.38655
G1 X204.79 Y112.71 E.29437
G1 X204.79 Y125.29 E.38655
G1 X195.27 Y125.29 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.26 Y123.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I-1.014 J.673 P1  F30000
G1 X196.04 Y124.464 Z19
G1 Z18.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2392
G1 X203.9 Y124.464 E.29465
G1 X204.05 Y121.406 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2392
G1 X204.05 Y123.034 E.05401
G1 X203.053 Y124.031 E.04676
G1 X202.791 Y124.031 E.0087
G1 X195.95 Y117.191 E.32089
G1 X195.95 Y115.781 E.04675
G1 X197.763 Y113.969 E.08502
G1 X200.405 Y113.969 E.08764
G1 X204.05 Y117.614 E.17099
G1 X204.05 Y115.358 E.07483
G1 X195.95 Y123.457 E.37996
G1 X195.95 Y124.031 E.01902
G1 X197.005 Y124.031 E.03499
G1 X196.04 Y113.536 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2392
G1 X203.9 Y113.536 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y113.536 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I-.1 J-1.213 P1  F30000
G1 X64.398 Y124.898 Z19
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2392
G1 X55.602 Y124.898 E.29177
G1 X55.602 Y113.102 E.39129
G1 X64.398 Y113.102 E.29177
G1 X64.398 Y124.838 E.3893
G1 X64.79 Y125.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2392
G1 X55.21 Y125.29 E.29437
G1 X55.21 Y112.71 E.38655
G1 X64.79 Y112.71 E.29437
G1 X64.79 Y125.23 E.3847
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y125.243 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I1.2 J.203 P1  F30000
G1 X62.995 Y124.031 Z19
G1 Z18.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2392
G1 X64.05 Y124.031 E.03499
G1 X64.05 Y123.457 E.01902
G1 X55.95 Y115.358 E.37996
G1 X55.95 Y117.614 E.07483
G1 X59.595 Y113.969 E.17099
G1 X62.237 Y113.969 E.08764
G1 X64.05 Y115.781 E.08502
G1 X64.05 Y117.191 E.04675
G1 X57.209 Y124.031 E.32089
G1 X56.947 Y124.031 E.0087
G1 X55.95 Y123.034 E.04676
G1 X55.95 Y121.406 E.05401
G1 X56.04 Y124.464 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2392
G1 X63.9 Y124.464 E.29465
G1 X56.04 Y113.536 F30000
G1 F2392
G1 X63.9 Y113.536 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 18.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X61.9 Y113.536 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 94/105
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
G3 Z19 I-.101 J1.213 P1  F30000
G1 X195.602 Y124.698 Z19
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2359
G1 X195.602 Y113.302 E.37802
G1 X204.398 Y113.302 E.29177
G1 X204.398 Y124.698 E.37802
G1 X195.662 Y124.698 E.28978
G1 X195.21 Y125.09 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2359
G1 X195.21 Y112.91 E.37426
G1 X204.79 Y112.91 E.29437
G1 X204.79 Y125.09 E.37426
G1 X195.27 Y125.09 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.26 Y123.09 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I-1.014 J.673 P1  F30000
G1 X196.04 Y124.264 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2359
G1 X203.9 Y124.264 E.29465
G1 X204.05 Y121.406 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2359
G1 X204.05 Y123.034 E.05401
G1 X203.253 Y123.831 E.03738
G1 X202.591 Y123.831 E.02197
G1 X195.95 Y117.191 E.3115
G1 X195.95 Y115.781 E.04675
G1 X197.563 Y114.169 E.07564
G1 X200.605 Y114.169 E.10091
G1 X204.05 Y117.614 E.16161
G1 X204.05 Y115.358 E.07483
G1 X195.95 Y123.457 E.37996
G1 X195.95 Y123.831 E.01239
G1 X197.205 Y123.831 E.04163
G1 X196.04 Y113.736 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2359
G1 X203.9 Y113.736 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y113.736 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I-.097 J-1.213 P1  F30000
G1 X64.398 Y124.698 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2359
G1 X55.602 Y124.698 E.29177
G1 X55.602 Y113.302 E.37802
G1 X64.398 Y113.302 E.29177
G1 X64.398 Y124.638 E.37603
G1 X64.79 Y125.09 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2359
G1 X55.21 Y125.09 E.29437
G1 X55.21 Y112.91 E.37426
G1 X64.79 Y112.91 E.29437
G1 X64.79 Y125.03 E.37241
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y125.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I1.217 J.005 P1  F30000
G1 X62.795 Y123.831 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2359
G1 X64.05 Y123.831 E.04163
G1 X64.05 Y123.457 E.01239
G1 X55.95 Y115.358 E.37996
G1 X55.95 Y117.614 E.07483
G1 X59.395 Y114.169 E.16161
G1 X62.437 Y114.169 E.10091
G1 X64.05 Y115.781 E.07564
G1 X64.05 Y117.191 E.04675
G1 X57.409 Y123.831 E.3115
G1 X56.747 Y123.831 E.02197
G1 X55.95 Y123.034 E.03738
G1 X55.95 Y121.406 E.05401
G1 X56.04 Y124.264 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2359
G1 X63.9 Y124.264 E.29465
G1 X56.04 Y113.736 F30000
G1 F2359
G1 X63.9 Y113.736 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 19
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X61.9 Y113.736 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 95/105
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
G3 Z19.2 I-.098 J1.213 P1  F30000
G1 X195.602 Y124.498 Z19.2
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2326
G1 X195.602 Y113.502 E.36475
G1 X204.398 Y113.502 E.29177
G1 X204.398 Y124.498 E.36475
G1 X195.662 Y124.498 E.28978
G1 X195.21 Y124.89 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2326
G1 X195.21 Y113.11 E.36197
G1 X204.79 Y113.11 E.29437
G1 X204.79 Y124.89 E.36197
G1 X195.27 Y124.89 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.26 Y122.89 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I-1.014 J.673 P1  F30000
G1 X196.04 Y124.064 Z19.4
G1 Z19
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2326
G1 X203.9 Y124.064 E.29465
G1 X204.05 Y121.406 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2326
G1 X204.05 Y123.034 E.05401
G1 X203.453 Y123.631 E.028
G1 X202.391 Y123.631 E.03524
G1 X195.95 Y117.191 E.30212
G1 X195.95 Y115.781 E.04675
G1 X197.363 Y114.369 E.06625
G1 X200.805 Y114.369 E.11418
G1 X204.05 Y117.614 E.15222
G1 X204.05 Y115.358 E.07483
G1 X195.95 Y123.457 E.37996
G1 X195.95 Y123.631 E.00575
G1 X197.405 Y123.631 E.04826
G1 X196.04 Y113.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2326
G1 X203.9 Y113.936 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y113.936 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I-.093 J-1.213 P1  F30000
G1 X64.398 Y124.498 Z19.4
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2326
G1 X55.602 Y124.498 E.29177
G1 X55.602 Y113.502 E.36475
G1 X64.398 Y113.502 E.29177
G1 X64.398 Y124.438 E.36276
G1 X64.79 Y124.89 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P95 R1
G1 F2326
G1 X55.21 Y124.89 E.29437
G1 X55.21 Y113.11 E.36197
G1 X64.79 Y113.11 E.29437
G1 X64.79 Y124.83 E.36012
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y124.843 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I1.201 J-.194 P1  F30000
G1 X62.595 Y123.631 Z19.4
G1 Z19
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2326
G1 X64.05 Y123.631 E.04826
G1 X64.05 Y123.457 E.00575
G1 X55.95 Y115.358 E.37996
G1 X55.95 Y117.614 E.07483
G1 X59.195 Y114.369 E.15222
G1 X62.637 Y114.369 E.11418
G1 X64.05 Y115.781 E.06625
G1 X64.05 Y117.191 E.04675
G1 X57.609 Y123.631 E.30212
G1 X56.547 Y123.631 E.03524
G1 X55.95 Y123.034 E.028
G1 X55.95 Y121.406 E.05401
G1 X56.04 Y124.064 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2326
G1 X63.9 Y124.064 E.29465
G1 X56.04 Y113.936 F30000
G1 F2326
G1 X63.9 Y113.936 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 19.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X61.9 Y113.936 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 96/105
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
G3 Z19.4 I-.094 J1.213 P1  F30000
G1 X195.602 Y124.298 Z19.4
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2293
G1 X195.602 Y113.702 E.35148
G1 X204.398 Y113.702 E.29177
G1 X204.398 Y124.298 E.35148
G1 X195.662 Y124.298 E.28978
G1 X195.21 Y124.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2293
G1 X195.21 Y113.31 E.34968
G1 X204.79 Y113.31 E.29437
G1 X204.79 Y124.69 E.34968
G1 X195.27 Y124.69 E.29252
M204 S10000
; WIPE_START
M73 P96 R1
G1 F24000
G1 X195.259 Y122.69 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.6 I.949 J.762 P1  F30000
G1 X195.95 Y121.829 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2293
G1 X195.977 Y123.431 E.05314
G1 X204.05 Y115.358 E.37871
G1 X204.05 Y117.614 E.07483
G1 X201.005 Y114.569 E.14284
G1 X197.163 Y114.569 E.12745
G1 X195.95 Y115.781 E.05687
G1 X195.95 Y117.191 E.04675
G1 X202.191 Y123.431 E.29274
G1 X203.653 Y123.431 E.04851
G1 X204.05 Y123.034 E.01862
G1 X204.05 Y121.406 E.05401
G1 X203.96 Y123.864 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2293
G1 X196.1 Y123.864 E.29465
G1 X196.04 Y114.136 F30000
G1 F2293
G1 X203.9 Y114.136 E.29465
; WIPE_START
G1 F24000
G1 X201.9 Y114.136 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.6 I-.09 J-1.214 P1  F30000
G1 X64.398 Y124.298 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2293
G1 X55.602 Y124.298 E.29177
G1 X55.602 Y113.702 E.35148
G1 X64.398 Y113.702 E.29177
G1 X64.398 Y124.238 E.34949
G1 X64.79 Y124.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2293
G1 X55.21 Y124.69 E.29437
G1 X55.21 Y113.31 E.34968
G1 X64.79 Y113.31 E.29437
G1 X64.79 Y124.63 E.34783
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y124.643 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.6 I1.111 J.497 P1  F30000
G1 X64.05 Y121.829 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2293
G1 X64.023 Y123.431 E.05314
G1 X55.95 Y115.358 E.37871
G1 X55.95 Y117.614 E.07483
G1 X58.995 Y114.569 E.14284
G1 X62.837 Y114.569 E.12745
G1 X64.05 Y115.781 E.05687
G1 X64.05 Y117.191 E.04675
G1 X57.809 Y123.431 E.29274
G1 X56.347 Y123.431 E.04851
G1 X55.95 Y123.034 E.01862
G1 X55.95 Y121.406 E.05401
G1 X56.04 Y123.864 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2293
G1 X63.9 Y123.864 E.29465
G1 X56.04 Y114.136 F30000
G1 F2293
G1 X63.9 Y114.136 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 19.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X61.9 Y114.136 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 97/105
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
G3 Z19.6 I-.09 J1.214 P1  F30000
G1 X195.602 Y124.098 Z19.6
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2254
G1 X195.602 Y113.902 E.33821
G1 X204.398 Y113.902 E.29177
G1 X204.398 Y124.098 E.33821
G1 X195.662 Y124.098 E.28978
G1 X195.21 Y124.49 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2254
G1 X195.21 Y113.51 E.33738
G1 X204.79 Y113.51 E.29437
G1 X204.79 Y124.49 E.33738
G1 X195.27 Y124.49 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.259 Y122.49 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.8 I-1.011 J.678 P1  F30000
G1 X196.044 Y123.66 Z19.8
G1 Z19.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.511188
G1 F2254
G1 X203.896 Y123.66 E.29963
G1 X204.05 Y121.406 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2254
G1 X204.05 Y123.034 E.05401
G1 X203.861 Y123.223 E.00884
G1 X201.982 Y123.223 E.06233
G1 X195.95 Y117.191 E.28297
G1 X195.95 Y115.781 E.04675
G1 X196.954 Y114.777 E.0471
G1 X201.213 Y114.777 E.14127
G1 X204.05 Y117.614 E.13307
G1 X204.05 Y115.358 E.07483
G1 X196.185 Y123.223 E.36894
G1 X195.95 Y123.223 E.00779
G1 X195.95 Y121.829 E.04623
G1 X196.044 Y114.34 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.511188
G1 F2254
G1 X203.896 Y114.34 E.29963
; WIPE_START
G1 F24000
G1 X201.896 Y114.34 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.8 I-.086 J-1.214 P1  F30000
G1 X64.398 Y124.098 Z19.8
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2254
G1 X55.602 Y124.098 E.29177
G1 X55.602 Y113.902 E.33821
G1 X64.398 Y113.902 E.29177
G1 X64.398 Y124.038 E.33622
G1 X64.79 Y124.49 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2254
G1 X55.21 Y124.49 E.29437
G1 X55.21 Y113.51 E.33738
G1 X64.79 Y113.51 E.29437
G1 X64.79 Y124.43 E.33554
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y124.443 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.8 I1.096 J.528 P1  F30000
G1 X64.05 Y121.829 Z19.8
G1 Z19.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2254
G1 X64.05 Y123.223 E.04623
G1 X63.815 Y123.223 E.00779
G1 X55.95 Y115.358 E.36894
G1 X55.95 Y117.614 E.07483
G1 X58.787 Y114.777 E.13307
G1 X63.046 Y114.777 E.14127
G1 X64.05 Y115.781 E.0471
G1 X64.05 Y117.191 E.04675
G1 X58.018 Y123.223 E.28297
G1 X56.139 Y123.223 E.06233
G1 X55.95 Y123.034 E.00884
G1 X55.95 Y121.406 E.05401
G1 X56.044 Y123.66 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.511188
G1 F2254
G1 X63.896 Y123.66 E.29963
G1 X56.044 Y114.34 F30000
G1 F2254
G1 X63.896 Y114.34 E.29963
; CHANGE_LAYER
; Z_HEIGHT: 19.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X61.896 Y114.34 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 98/105
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
G3 Z19.8 I-.087 J1.214 P1  F30000
G1 X195.602 Y123.898 Z19.8
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2770
G1 X195.602 Y114.102 E.32495
G1 X204.398 Y114.102 E.29177
G1 X204.398 Y123.898 E.32495
G1 X195.662 Y123.898 E.28978
G1 X195.21 Y124.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2770
G1 X195.21 Y113.71 E.32509
G1 X204.79 Y113.71 E.29437
G1 X204.79 Y124.29 E.32509
G1 X195.27 Y124.29 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.259 Y122.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20 I-.999 J.696 P1  F30000
G1 X196.062 Y123.442 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54679
G1 F2770
G1 X203.878 Y123.442 E.32095
G1 X204.05 Y122.315 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2770
G1 X195.95 Y122.315 E.26867
G1 X195.95 Y115.685 E.21994
G1 X204.05 Y115.685 E.26867
G1 X204.05 Y122.255 E.21795
G1 X203.643 Y118.835 F30000
G1 F2770
G1 X203.643 Y117.207 E.05401
G1 X202.528 Y116.092 E.05231
G1 X203.316 Y116.092 E.02615
G1 X197.5 Y121.908 E.27285
G1 X200.668 Y121.908 E.10509
G1 X196.357 Y117.598 E.20221
G1 X196.357 Y116.092 E.04995
G1 X196.48 Y116.092 E.00406
G1 X196.062 Y114.558 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54679
G1 F2770
G1 X203.878 Y114.558 E.32095
G1 X200.085 Y115.278 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2770
G1 X201.713 Y115.278 E.05401
G1 X201.449 Y115.013 E.01242
G1 X196.719 Y115.013 E.1569
G1 X196.454 Y115.278 E.01242
G1 X198.082 Y115.278 E.05401
G1 X198.049 Y122.987 F30000
G1 F2770
G1 X196.421 Y122.987 E.05401
G1 X196.686 Y122.722 E.01242
G1 X201.482 Y122.722 E.1591
G1 X201.747 Y122.987 E.01242
G1 X200.118 Y122.987 E.05401
; WIPE_START
G1 F24000
G1 X201.747 Y122.987 E-.61876
G1 X201.484 Y122.724 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20 I-.01 J-1.217 P1  F30000
G1 X64.398 Y123.898 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2770
G1 X55.602 Y123.898 E.29177
G1 X55.602 Y114.102 E.32495
G1 X64.398 Y114.102 E.29177
G1 X64.398 Y123.838 E.32296
G1 X64.79 Y124.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2770
G1 X55.21 Y124.29 E.29437
G1 X55.21 Y113.71 E.32509
G1 X64.79 Y113.71 E.29437
G1 X64.79 Y124.23 E.32325
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y124.243 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20 I1.019 J.666 P1  F30000
G1 X64.05 Y122.315 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2770
G1 X55.95 Y122.315 E.26867
G1 X55.95 Y115.685 E.21994
G1 X64.05 Y115.685 E.26867
G1 X64.05 Y122.255 E.21795
G1 X61.951 Y122.987 F30000
G1 F2770
G1 X63.579 Y122.987 E.05401
G1 X63.314 Y122.722 E.01242
G1 X58.518 Y122.722 E.15911
G1 X58.253 Y122.987 E.01242
G1 X56.625 Y122.987 E.05401
G1 X56.062 Y123.442 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54679
G1 F2770
G1 X63.878 Y123.442 E.32095
G1 X63.52 Y116.092 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2770
G1 X63.643 Y116.092 E.00406
G1 X63.643 Y117.598 E.04995
G1 X59.332 Y121.908 E.20221
G1 X62.5 Y121.908 E.10509
G1 X56.684 Y116.092 E.27285
G1 X57.472 Y116.092 E.02615
G1 X56.357 Y117.207 E.05231
G1 X56.357 Y118.835 E.05401
G1 X56.658 Y115.278 F30000
G1 F2770
G1 X58.287 Y115.278 E.05401
G1 X58.551 Y115.013 E.01242
G1 X63.281 Y115.013 E.1569
G1 X63.546 Y115.278 E.01242
G1 X61.918 Y115.278 E.05401
G1 X56.062 Y114.558 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54679
G1 F2770
G1 X63.878 Y114.558 E.32095
; CHANGE_LAYER
; Z_HEIGHT: 19.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X61.878 Y114.558 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 99/105
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
G3 Z20 I-.083 J1.214 P1  F30000
G1 X195.602 Y123.69 Z20
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2437
G1 X195.602 Y114.31 E.31113
G1 X204.398 Y114.31 E.29177
G1 X204.398 Y123.69 E.31113
G1 X195.662 Y123.69 E.28978
G1 X195.21 Y124.082 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2437
G1 X195.21 Y113.918 E.31229
G1 X204.79 Y113.918 E.29437
G1 X204.79 Y124.082 E.31229
G1 X195.27 Y124.082 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.258 Y122.082 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.2 I-.979 J.723 P1  F30000
G1 X196.087 Y123.204 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.60642
G1 F2437
G1 X203.849 Y123.204 E.35638
M73 P97 R1
G1 X204.05 Y122.315 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2437
G1 X195.95 Y122.315 E.26867
G1 X195.95 Y115.685 E.21994
G1 X204.05 Y115.685 E.26867
G1 X204.05 Y122.255 E.21795
G1 X203.643 Y118.835 F30000
G1 F2437
G1 X203.643 Y117.207 E.05401
G1 X202.528 Y116.092 E.05231
G1 X203.316 Y116.092 E.02615
G1 X197.5 Y121.908 E.27285
G1 X200.668 Y121.908 E.10509
G1 X196.357 Y117.598 E.20221
G1 X196.357 Y116.092 E.04995
G1 X196.48 Y116.092 E.00406
G1 X196.091 Y114.796 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.606418
G1 F2437
G1 X203.853 Y114.796 E.35638
; WIPE_START
G1 F24000
G1 X201.853 Y114.796 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.2 I-.079 J-1.214 P1  F30000
G1 X64.398 Y123.69 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2437
G1 X55.602 Y123.69 E.29177
G1 X55.602 Y114.31 E.31113
G1 X64.398 Y114.31 E.29177
G1 X64.398 Y123.63 E.30914
G1 X64.79 Y124.082 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2437
G1 X55.21 Y124.082 E.29437
G1 X55.21 Y113.918 E.31229
G1 X64.79 Y113.918 E.29437
G1 X64.79 Y124.022 E.31045
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y124.034 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.2 I.982 J.719 P1  F30000
G1 X64.05 Y122.315 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2437
G1 X55.95 Y122.315 E.26867
G1 X55.95 Y115.685 E.21994
G1 X64.05 Y115.685 E.26867
G1 X64.05 Y122.255 E.21795
G1 X63.52 Y116.092 F30000
G1 F2437
G1 X63.643 Y116.092 E.00406
G1 X63.643 Y117.598 E.04995
G1 X59.332 Y121.908 E.20221
G1 X62.5 Y121.908 E.10509
G1 X56.684 Y116.092 E.27285
G1 X57.472 Y116.092 E.02615
G1 X56.357 Y117.207 E.05231
G1 X56.357 Y118.835 E.05401
G1 X56.091 Y114.796 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.606418
G1 F2437
G1 X63.853 Y114.796 E.35638
G1 X56.087 Y123.204 F30000
; LINE_WIDTH: 0.60642
G1 F2437
G1 X63.849 Y123.204 E.35638
; CHANGE_LAYER
; Z_HEIGHT: 20
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X61.849 Y123.204 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 100/105
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
G3 Z20.2 I-.002 J1.217 P1  F30000
G1 X195.602 Y123.454 Z20.2
G1 Z20
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2700
G1 X195.602 Y114.546 E.2955
G1 X204.398 Y114.546 E.29177
G1 X204.398 Y123.454 E.2955
G1 X195.662 Y123.454 E.28978
G1 X195.21 Y123.846 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2700
G1 X195.21 Y114.154 E.29782
G1 X204.79 Y114.154 E.29437
G1 X204.79 Y123.846 E.29782
G1 X195.27 Y123.846 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.258 Y121.846 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.4 I-1.055 J.607 P1  F30000
G1 X195.97 Y123.086 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.372363
G1 F2700
G1 X204.028 Y123.086 E.2163
G1 X204.024 Y122.756 E.00884
G1 X195.97 Y122.756 E.2162
G1 X195.97 Y123.026 E.00723
G1 X196.48 Y116.092 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2700
G1 X196.357 Y116.092 E.00406
G1 X196.357 Y117.598 E.04995
G1 X200.668 Y121.908 E.20221
G1 X197.5 Y121.908 E.10509
G1 X203.316 Y116.092 E.27285
G1 X202.528 Y116.092 E.02615
G1 X203.643 Y117.207 E.05231
G1 X203.643 Y118.835 E.05401
G1 X204.05 Y122.255 F30000
G1 F2700
G1 X204.05 Y115.685 E.21795
G1 X195.95 Y115.685 E.26867
G1 X195.95 Y122.315 E.21994
G1 X204.05 Y122.315 E.26867
G1 X195.976 Y115.244 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.372365
G1 F2700
G1 X204.03 Y115.244 E.2162
G1 X204.03 Y114.914 E.00884
G1 X195.972 Y114.914 E.2163
G1 X195.976 Y115.184 E.00723
; WIPE_START
G1 F24000
G1 X195.972 Y114.914 E-.1024
G1 X197.703 Y114.914 E-.6576
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.4 I-.078 J-1.214 P1  F30000
G1 X64.398 Y123.454 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2700
G1 X55.602 Y123.454 E.29177
G1 X55.602 Y114.546 E.2955
G1 X64.398 Y114.546 E.29177
G1 X64.398 Y123.394 E.29351
G1 X64.79 Y123.846 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2700
G1 X55.21 Y123.846 E.29437
G1 X55.21 Y114.154 E.29782
G1 X64.79 Y114.154 E.29437
G1 X64.79 Y123.786 E.29597
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y123.799 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.4 I.607 J1.055 P1  F30000
G1 X64.028 Y123.086 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.372363
G1 F2700
G1 X64.024 Y122.756 E.00884
G1 X55.97 Y122.756 E.2162
G1 X55.97 Y123.086 E.00884
G1 X63.968 Y123.086 E.21469
G1 X64.05 Y122.315 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2700
G1 X55.95 Y122.315 E.26867
G1 X55.95 Y115.685 E.21994
G1 X64.05 Y115.685 E.26867
G1 X64.05 Y122.255 E.21795
G1 X64.03 Y115.244 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.372365
G1 F2700
G1 X64.03 Y114.914 E.00884
G1 X55.972 Y114.914 E.2163
G1 X55.976 Y115.244 E.00884
G1 X63.97 Y115.244 E.21459
G1 X63.52 Y116.092 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2700
G1 X63.643 Y116.092 E.00406
G1 X63.643 Y117.598 E.04995
G1 X59.332 Y121.908 E.20221
G1 X62.5 Y121.908 E.10509
G1 X56.684 Y116.092 E.27285
G1 X57.472 Y116.092 E.02615
G1 X56.357 Y117.207 E.05231
G1 X56.357 Y118.835 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 20.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X56.357 Y117.207 E-.61876
G1 X56.62 Y116.944 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 101/105
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
G3 Z20.4 I-.055 J1.216 P1  F30000
G1 X195.602 Y123.186 Z20.4
G1 Z20.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2576
G1 X195.602 Y114.814 E.27772
G1 X204.398 Y114.814 E.29177
G1 X204.398 Y123.186 E.27772
G1 X195.662 Y123.186 E.28978
G1 X195.21 Y123.578 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2576
G1 X195.21 Y114.422 E.28135
G1 X204.79 Y114.422 E.29437
G1 X204.79 Y123.578 E.28135
G1 X195.27 Y123.578 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.257 Y121.578 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.6 I-1.023 J.659 P1  F30000
G1 X196.022 Y122.767 Z20.6
G1 Z20.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.47488
G1 F2576
G1 X203.976 Y122.767 E.28
G1 X203.972 Y122.335 E.01521
G1 X196.022 Y122.335 E.27986
G1 X196.022 Y122.707 E.01309
G1 X196.88 Y116.492 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2576
G1 X196.357 Y116.492 E.01733
G1 X196.357 Y117.598 E.03668
G1 X200.268 Y121.508 E.18344
G1 X197.9 Y121.508 E.07855
G1 X202.916 Y116.492 E.23532
G1 X203.643 Y117.207 E.03382
G1 X203.643 Y118.835 E.05401
G1 X204.05 Y121.855 F30000
G1 F2576
G1 X204.05 Y116.085 E.19141
G1 X195.95 Y116.085 E.26867
G1 X195.95 Y121.915 E.1934
G1 X204.05 Y121.915 E.26867
G1 X196.028 Y115.665 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.474882
G1 F2576
G1 X203.978 Y115.665 E.27987
G1 X203.978 Y115.233 E.0152
G1 X196.024 Y115.233 E.28
G1 X196.027 Y115.605 E.01309
; WIPE_START
G1 F24000
G1 X196.024 Y115.233 E-.14135
G1 X197.652 Y115.233 E-.61865
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.6 I-.073 J-1.215 P1  F30000
G1 X64.398 Y123.186 Z20.6
G1 Z20.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2576
G1 X55.602 Y123.186 E.29177
G1 X55.602 Y114.814 E.27772
G1 X64.398 Y114.814 E.29177
G1 X64.398 Y123.126 E.27573
G1 X64.79 Y123.578 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2576
G1 X55.21 Y123.578 E.29437
G1 X55.21 Y114.422 E.28135
G1 X64.79 Y114.422 E.29437
G1 X64.79 Y123.518 E.27951
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y123.531 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.6 I.659 J1.023 P1  F30000
G1 X63.976 Y122.767 Z20.6
G1 Z20.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.474881
G1 F2576
G1 X63.972 Y122.335 E.01521
G1 X56.022 Y122.335 E.27986
G1 X56.022 Y122.767 E.0152
G1 X63.916 Y122.767 E.27789
G1 X64.05 Y121.915 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2576
G1 X55.95 Y121.915 E.26867
G1 X55.95 Y116.085 E.1934
G1 X64.05 Y116.085 E.26867
G1 X64.05 Y121.855 E.19141
G1 X63.978 Y115.665 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.474883
G1 F2576
G1 X63.978 Y115.233 E.0152
G1 X56.024 Y115.233 E.28001
G1 X56.028 Y115.665 E.01521
G1 X63.918 Y115.665 E.27775
G1 X63.12 Y116.492 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2576
G1 X63.643 Y116.492 E.01733
G1 X63.643 Y117.598 E.03668
G1 X59.732 Y121.508 E.18344
G1 X62.1 Y121.508 E.07855
G1 X57.084 Y116.492 E.23532
G1 X56.357 Y117.207 E.03382
G1 X56.357 Y118.835 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 20.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X56.357 Y117.207 E-.61876
G1 X56.622 Y116.946 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 102/105
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
G3 Z20.6 I-.052 J1.216 P1  F30000
G1 X195.602 Y122.877 Z20.6
G1 Z20.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4847
G1 X195.602 Y115.123 E.25724
G1 X204.398 Y115.123 E.29177
G1 X204.398 Y122.877 E.25724
G1 X195.662 Y122.877 E.28978
G1 X195.21 Y123.269 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4847
G1 X195.21 Y114.731 E.26237
G1 X204.79 Y114.731 E.29437
G1 X204.79 Y123.269 E.26237
G1 X195.27 Y123.269 E.29252
M204 S10000
G1 X195.883 Y122.596 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F4847
G1 X204.057 Y122.596 E.22646
G1 X204.017 Y122.496 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.422578
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X204.017 Y115.706 E.388
G1 X203.544 Y115.706 E.027
G1 X203.544 Y122.294 E.37642
G1 X203.072 Y122.294 E.027
G1 X203.072 Y115.706 E.37642
G1 X202.599 Y115.706 E.027
G1 X202.599 Y122.294 E.37642
G1 X202.127 Y122.294 E.027
G1 X202.127 Y115.706 E.37642
G1 X201.654 Y115.706 E.027
M73 P97 R0
G1 X201.654 Y122.294 E.37642
G1 X201.181 Y122.294 E.027
G1 X201.181 Y115.706 E.37642
G1 X200.709 Y115.706 E.027
G1 X200.709 Y122.294 E.37642
G1 X200.236 Y122.294 E.027
G1 X200.236 Y115.706 E.37642
G1 X199.764 Y115.706 E.027
G1 X199.764 Y122.294 E.37642
G1 X199.291 Y122.294 E.027
G1 X199.291 Y115.706 E.37642
G1 X198.819 Y115.706 E.027
G1 X198.819 Y122.294 E.37642
G1 X198.346 Y122.294 E.027
G1 X198.346 Y115.706 E.37642
G1 X197.873 Y115.706 E.027
G1 X197.873 Y122.294 E.37642
G1 X197.401 Y122.294 E.027
G1 X197.401 Y115.706 E.37642
G1 X196.928 Y115.706 E.027
G1 X196.928 Y122.294 E.37642
G1 X196.456 Y122.294 E.027
G1 X196.456 Y115.706 E.37642
G1 X195.983 Y115.706 E.027
G1 X195.983 Y122.496 E.388
M106 S252.45
G1 X195.883 Y115.404 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F4847
G1 X204.057 Y115.404 E.22646
; WIPE_START
G1 F24000
M73 P98 R0
G1 X202.057 Y115.404 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.8 I-.066 J-1.215 P1  F30000
G1 X64.398 Y122.877 Z20.8
G1 Z20.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4847
G1 X55.602 Y122.877 E.29177
G1 X55.602 Y115.123 E.25724
G1 X64.398 Y115.123 E.29177
G1 X64.398 Y122.817 E.25525
G1 X64.79 Y123.269 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4847
G1 X55.21 Y123.269 E.29437
G1 X55.21 Y114.731 E.26237
G1 X64.79 Y114.731 E.29437
G1 X64.79 Y123.209 E.26053
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y123.222 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.8 I.62 J1.047 P1  F30000
G1 X64.017 Y122.496 Z20.8
G1 Z20.4
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.422578
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X64.017 Y115.706 E.388
G1 X63.544 Y115.706 E.027
G1 X63.544 Y122.294 E.37642
G1 X63.072 Y122.294 E.027
G1 X63.072 Y115.706 E.37642
G1 X62.599 Y115.706 E.027
G1 X62.599 Y122.294 E.37642
G1 X62.127 Y122.294 E.027
G1 X62.127 Y115.706 E.37642
G1 X61.654 Y115.706 E.027
G1 X61.654 Y122.294 E.37642
G1 X61.181 Y122.294 E.027
G1 X61.181 Y115.706 E.37642
G1 X60.709 Y115.706 E.027
G1 X60.709 Y122.294 E.37642
G1 X60.236 Y122.294 E.027
G1 X60.236 Y115.706 E.37642
G1 X59.764 Y115.706 E.027
G1 X59.764 Y122.294 E.37642
G1 X59.291 Y122.294 E.027
G1 X59.291 Y115.706 E.37642
G1 X58.819 Y115.706 E.027
G1 X58.819 Y122.294 E.37642
G1 X58.346 Y122.294 E.027
G1 X58.346 Y115.706 E.37642
G1 X57.873 Y115.706 E.027
G1 X57.873 Y122.294 E.37642
G1 X57.401 Y122.294 E.027
G1 X57.401 Y115.706 E.37642
G1 X56.928 Y115.706 E.027
G1 X56.928 Y122.294 E.37642
G1 X56.456 Y122.294 E.027
G1 X56.456 Y115.706 E.37642
G1 X55.983 Y115.706 E.027
G1 X55.983 Y122.496 E.388
M106 S252.45
G1 X55.883 Y122.596 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F4847
G1 X64.057 Y122.596 E.22646
G1 X55.883 Y115.404 F30000
G1 F4847
G1 X64.057 Y115.404 E.22646
; CHANGE_LAYER
; Z_HEIGHT: 20.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X62.057 Y115.404 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 103/105
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
G3 Z20.8 I-.065 J1.215 P1  F30000
G1 X195.602 Y122.504 Z20.8
G1 Z20.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3582
G1 X195.602 Y115.496 E.23249
G1 X204.398 Y115.496 E.29177
G1 X204.398 Y122.504 E.23249
G1 X195.662 Y122.504 E.28978
G1 X195.21 Y122.896 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3582
G1 X195.21 Y115.104 E.23945
G1 X204.79 Y115.104 E.29437
G1 X204.79 Y122.896 E.23945
G1 X195.27 Y122.896 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.255 Y120.896 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21 I-.908 J.81 P1  F30000
G1 X196.544 Y122.341 Z21
G1 Z20.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427421
G1 F3582
G1 X195.935 Y121.732 E.02695
G1 X195.935 Y121.189 E.01704
G1 X196.918 Y122.171 E.04353
G1 X197.461 Y122.171 E.01704
G1 X195.935 Y120.645 E.06762
G1 X195.935 Y120.101 E.01704
G1 X198.005 Y122.171 E.09171
G1 X198.549 Y122.171 E.01704
G1 X195.935 Y119.557 E.11581
G1 X195.935 Y119.014 E.01704
G1 X199.093 Y122.171 E.1399
G1 X199.636 Y122.171 E.01704
G1 X195.935 Y118.47 E.164
G1 X195.935 Y117.926 E.01704
G1 X200.18 Y122.171 E.18809
G1 X200.724 Y122.171 E.01704
G1 X195.935 Y117.382 E.21219
G1 X195.935 Y116.839 E.01704
G1 X201.268 Y122.171 E.23628
G1 X201.812 Y122.171 E.01704
G1 X195.935 Y116.295 E.26037
G1 X195.935 Y115.829 E.01459
G1 X196.013 Y115.829 E.00244
G1 X202.355 Y122.171 E.28101
G1 X202.899 Y122.171 E.01704
G1 X196.557 Y115.829 E.28101
G1 X197.101 Y115.829 E.01704
G1 X203.443 Y122.171 E.28101
G1 X203.987 Y122.171 E.01704
G1 X197.645 Y115.829 E.28101
G1 X198.188 Y115.829 E.01704
G1 X204.065 Y121.705 E.26038
G1 X204.065 Y121.162 E.01704
G1 X198.732 Y115.829 E.23629
G1 X199.276 Y115.829 E.01704
G1 X204.065 Y120.618 E.21219
G1 X204.065 Y120.074 E.01704
G1 X199.82 Y115.829 E.1881
G1 X200.363 Y115.829 E.01704
G1 X204.065 Y119.53 E.164
G1 X204.065 Y118.986 E.01704
G1 X200.907 Y115.829 E.13991
G1 X201.451 Y115.829 E.01704
G1 X204.065 Y118.443 E.11581
G1 X204.065 Y117.899 E.01704
G1 X201.995 Y115.829 E.09172
G1 X202.538 Y115.829 E.01704
G1 X204.065 Y117.355 E.06762
G1 X204.065 Y116.811 E.01704
G1 X203.082 Y115.829 E.04353
G1 X203.626 Y115.829 E.01704
G1 X204.234 Y116.437 E.02696
; WIPE_START
G1 F24000
G1 X203.626 Y115.829 E-.32692
G1 X203.082 Y115.829 E-.20663
G1 X203.504 Y116.25 E-.22645
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21 I-.055 J-1.216 P1  F30000
G1 X64.398 Y122.504 Z21
G1 Z20.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3582
G1 X55.602 Y122.504 E.29177
G1 X55.602 Y115.496 E.23249
G1 X64.398 Y115.496 E.29177
G1 X64.398 Y122.444 E.23049
G1 X64.79 Y122.896 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3582
G1 X55.21 Y122.896 E.29437
G1 X55.21 Y115.104 E.23945
G1 X64.79 Y115.104 E.29437
G1 X64.79 Y122.836 E.2376
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y122.849 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21 I1.187 J.267 P1  F30000
G1 X64.234 Y116.437 Z21
G1 Z20.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.427421
G1 F3582
G1 X63.626 Y115.829 E.02696
G1 X63.082 Y115.829 E.01704
G1 X64.065 Y116.811 E.04353
G1 X64.065 Y117.355 E.01704
G1 X62.538 Y115.829 E.06762
G1 X61.995 Y115.829 E.01704
G1 X64.065 Y117.899 E.09172
G1 X64.065 Y118.443 E.01704
G1 X61.451 Y115.829 E.11581
G1 X60.907 Y115.829 E.01704
G1 X64.065 Y118.986 E.13991
G1 X64.065 Y119.53 E.01704
G1 X60.363 Y115.829 E.164
G1 X59.82 Y115.829 E.01704
G1 X64.065 Y120.074 E.1881
G1 X64.065 Y120.618 E.01704
G1 X59.276 Y115.829 E.21219
G1 X58.732 Y115.829 E.01704
G1 X64.065 Y121.162 E.23629
G1 X64.065 Y121.705 E.01704
G1 X58.188 Y115.829 E.26038
G1 X57.645 Y115.829 E.01704
G1 X63.987 Y122.171 E.28101
G1 X63.443 Y122.171 E.01704
G1 X57.101 Y115.829 E.28101
G1 X56.557 Y115.829 E.01704
G1 X62.899 Y122.171 E.28101
G1 X62.355 Y122.171 E.01704
G1 X56.013 Y115.829 E.28101
G1 X55.935 Y115.829 E.00244
G1 X55.935 Y116.295 E.01459
G1 X61.812 Y122.171 E.26037
G1 X61.268 Y122.171 E.01704
G1 X55.935 Y116.839 E.23628
G1 X55.935 Y117.382 E.01704
G1 X60.724 Y122.171 E.21219
G1 X60.18 Y122.171 E.01704
G1 X55.935 Y117.926 E.18809
G1 X55.935 Y118.47 E.01704
G1 X59.636 Y122.171 E.164
G1 X59.093 Y122.171 E.01704
G1 X55.935 Y119.014 E.1399
G1 X55.935 Y119.557 E.01704
G1 X58.549 Y122.171 E.11581
G1 X58.005 Y122.171 E.01704
G1 X55.935 Y120.101 E.09171
G1 X55.935 Y120.645 E.01704
G1 X57.461 Y122.171 E.06762
G1 X56.918 Y122.171 E.01704
G1 X55.935 Y121.189 E.04353
G1 X55.935 Y121.732 E.01704
G1 X56.544 Y122.341 E.02695
; CHANGE_LAYER
; Z_HEIGHT: 20.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X55.935 Y121.732 E-.32685
G1 X55.935 Y121.189 E-.20663
G1 X56.357 Y121.61 E-.22652
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 104/105
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
G3 Z21 I.007 J1.217 P1  F30000
G1 X195.602 Y120.844 Z21
G1 Z20.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3743
G1 X195.602 Y117.156 E.12234
G1 X204.398 Y117.156 E.29177
G1 X204.398 Y120.844 E.12234
G1 X195.662 Y120.844 E.28978
; WIPE_START
G1 F24000
G1 X195.63 Y118.844 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.2 I-1.209 J-.142 P1  F30000
G1 X195.21 Y122.423 Z21.2
G1 Z20.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3743
G1 X195.21 Y115.577 E.21038
G1 X204.79 Y115.577 E.29437
G1 X204.79 Y122.423 E.21038
G1 X195.27 Y122.423 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.252 Y120.423 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.2 I-.25 J1.191 P1  F30000
G1 X203.776 Y122.216 Z21.2
G1 Z20.8
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F3743
G1 X204.583 Y121.409 E.03506
G1 X204.392 Y121.066
G1 X203.243 Y122.216 E.04995
G1 X202.709 Y122.216
G1 X203.859 Y121.066 E.04995
G1 X203.326 Y121.066
G1 X202.176 Y122.216 E.04995
G1 X201.643 Y122.216
G1 X202.792 Y121.066 E.04995
G1 X202.259 Y121.066
G1 X201.11 Y122.216 E.04995
G1 X200.576 Y122.216
G1 X201.726 Y121.066 E.04995
G1 X201.193 Y121.066
G1 X200.043 Y122.216 E.04995
G1 X199.51 Y122.216
G1 X200.659 Y121.066 E.04995
G1 X200.126 Y121.066
G1 X198.976 Y122.216 E.04995
G1 X198.443 Y122.216
G1 X199.593 Y121.066 E.04995
G1 X199.059 Y121.066
G1 X197.91 Y122.216 E.04995
G1 X197.377 Y122.216
G1 X198.526 Y121.066 E.04995
G1 X197.993 Y121.066
G1 X196.843 Y122.216 E.04995
G1 X196.31 Y122.216
G1 X197.46 Y121.066 E.04995
G1 X196.926 Y121.066
G1 X195.777 Y122.216 E.04995
G1 X195.417 Y122.042
G1 X196.393 Y121.066 E.0424
G1 X195.86 Y121.066
G1 X195.417 Y121.509 E.01923
M204 S10000
G1 X204.176 Y120.217 F30000
M204 S2000
G1 F3743
G1 X203.77 Y120.622 E.01761
G1 X203.237 Y120.622
G1 X204.176 Y119.683 E.04078
G1 X204.176 Y119.15
G1 X202.704 Y120.622 E.06395
G1 X202.171 Y120.622
G1 X204.176 Y118.617 E.08712
G1 X204.176 Y118.083
G1 X201.637 Y120.622 E.1103
G1 X201.104 Y120.622
G1 X204.176 Y117.55 E.13347
G1 X203.814 Y117.378
G1 X200.571 Y120.622 E.14094
G1 X200.038 Y120.622
G1 X203.281 Y117.378 E.14094
G1 X202.748 Y117.378
G1 X199.504 Y120.622 E.14094
G1 X198.971 Y120.622
G1 X202.214 Y117.378 E.14094
G1 X201.681 Y117.378
G1 X198.438 Y120.622 E.14094
G1 X197.904 Y120.622
G1 X201.148 Y117.378 E.14094
G1 X200.615 Y117.378
G1 X197.371 Y120.622 E.14094
G1 X196.838 Y120.622
G1 X200.081 Y117.378 E.14094
G1 X199.548 Y117.378
G1 X196.305 Y120.622 E.14094
G1 X195.824 Y120.569
G1 X199.015 Y117.378 E.13863
G1 X198.481 Y117.378
G1 X195.824 Y120.035 E.11546
G1 X195.824 Y119.502
G1 X197.948 Y117.378 E.09229
G1 X197.415 Y117.378
G1 X195.824 Y118.969 E.06911
G1 X195.824 Y118.435
G1 X196.882 Y117.378 E.04594
G1 X196.348 Y117.378
G1 X195.824 Y117.902 E.02277
M204 S10000
G1 X203.726 Y116.934 F30000
M204 S2000
G1 F3743
G1 X204.583 Y116.077 E.03724
G1 X204.342 Y115.784
G1 X203.192 Y116.934 E.04995
G1 X202.659 Y116.934
G1 X203.809 Y115.784 E.04995
G1 X203.275 Y115.784
G1 X202.126 Y116.934 E.04995
G1 X201.593 Y116.934
G1 X202.742 Y115.784 E.04995
G1 X202.209 Y115.784
G1 X201.059 Y116.934 E.04995
G1 X200.526 Y116.934
G1 X201.676 Y115.784 E.04995
G1 X201.142 Y115.784
G1 X199.993 Y116.934 E.04995
G1 X199.46 Y116.934
G1 X200.609 Y115.784 E.04995
G1 X200.076 Y115.784
G1 X198.926 Y116.934 E.04995
G1 X198.393 Y116.934
G1 X199.542 Y115.784 E.04995
G1 X199.009 Y115.784
G1 X197.86 Y116.934 E.04995
G1 X197.326 Y116.934
G1 X198.476 Y115.784 E.04995
G1 X197.943 Y115.784
G1 X196.793 Y116.934 E.04995
G1 X196.26 Y116.934
G1 X197.409 Y115.784 E.04995
G1 X196.876 Y115.784
G1 X195.727 Y116.934 E.04995
G1 X195.417 Y116.709
G1 X196.343 Y115.784 E.04022
G1 X195.81 Y115.784
G1 X195.417 Y116.176 E.01704
M204 S10000
; WIPE_START
G1 F24000
G1 X195.81 Y115.784 E-.21077
G1 X196.343 Y115.784 E-.20264
G1 X195.698 Y116.429 E-.34658
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.2 I-.041 J-1.216 P1  F30000
G1 X64.398 Y120.844 Z21.2
G1 Z20.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3743
G1 X55.602 Y120.844 E.29177
G1 X55.602 Y117.156 E.12234
G1 X64.398 Y117.156 E.29177
G1 X64.398 Y120.784 E.12035
; WIPE_START
G1 F24000
G1 X62.398 Y120.798 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.2 I-.684 J1.007 P1  F30000
G1 X64.79 Y122.423 Z21.2
G1 Z20.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3743
G1 X55.21 Y122.423 E.29437
G1 X55.21 Y115.577 E.21038
G1 X64.79 Y115.577 E.29437
G1 X64.79 Y122.363 E.20854
M204 S10000
G1 X64.583 Y121.692 F30000
M204 S2000
; FEATURE: Top surface
G1 F3743
G1 X64.059 Y122.216 E.02275
G1 X63.526 Y122.216
G1 X64.583 Y121.159 E.04592
G1 X64.142 Y121.066
G1 X62.993 Y122.216 E.04995
G1 X62.459 Y122.216
G1 X63.609 Y121.066 E.04995
G1 X63.076 Y121.066
G1 X61.926 Y122.216 E.04995
G1 X61.393 Y122.216
G1 X62.542 Y121.066 E.04995
G1 X62.009 Y121.066
G1 X60.859 Y122.216 E.04995
G1 X60.326 Y122.216
G1 X61.476 Y121.066 E.04995
G1 X60.942 Y121.066
G1 X59.793 Y122.216 E.04995
G1 X59.26 Y122.216
G1 X60.409 Y121.066 E.04995
G1 X59.876 Y121.066
G1 X58.726 Y122.216 E.04995
G1 X58.193 Y122.216
G1 X59.343 Y121.066 E.04995
G1 X58.809 Y121.066
G1 X57.66 Y122.216 E.04995
G1 X57.127 Y122.216
G1 X58.276 Y121.066 E.04995
G1 X57.743 Y121.066
G1 X56.593 Y122.216 E.04995
G1 X56.06 Y122.216
G1 X57.21 Y121.066 E.04995
G1 X56.676 Y121.066
G1 X55.527 Y122.216 E.04995
G1 X55.417 Y121.792
G1 X56.143 Y121.066 E.03153
M204 S10000
G1 X64.176 Y119.966 F30000
M204 S2000
G1 F3743
G1 X63.52 Y120.622 E.02847
G1 X62.987 Y120.622
G1 X64.176 Y119.433 E.05165
G1 X64.176 Y118.9
G1 X62.454 Y120.622 E.07482
G1 X61.92 Y120.622
G1 X64.176 Y118.367 E.09799
G1 X64.176 Y117.833
G1 X61.387 Y120.622 E.12117
G1 X60.854 Y120.622
G1 X64.097 Y117.378 E.14094
G1 X63.564 Y117.378
G1 X60.321 Y120.622 E.14094
G1 X59.787 Y120.622
G1 X63.031 Y117.378 E.14094
G1 X62.498 Y117.378
G1 X59.254 Y120.622 E.14094
G1 X58.721 Y120.622
G1 X61.964 Y117.378 E.14094
G1 X61.431 Y117.378
G1 X58.188 Y120.622 E.14094
G1 X57.654 Y120.622
G1 X60.898 Y117.378 E.14094
G1 X60.364 Y117.378
G1 X57.121 Y120.622 E.14094
G1 X56.588 Y120.622
G1 X59.831 Y117.378 E.14094
G1 X59.298 Y117.378
G1 X56.055 Y120.622 E.14094
G1 X55.824 Y120.318
G1 X58.765 Y117.378 E.12776
G1 X58.231 Y117.378
G1 X55.824 Y119.785 E.10459
G1 X55.824 Y119.252
G1 X57.698 Y117.378 E.08142
G1 X57.165 Y117.378
G1 X55.824 Y118.719 E.05824
G1 X55.824 Y118.185
G1 X56.632 Y117.378 E.03507
M204 S10000
G1 X64.583 Y116.36 F30000
M204 S2000
G1 F3743
G1 X64.009 Y116.934 E.02493
G1 X63.476 Y116.934
G1 X64.583 Y115.826 E.04811
G1 X64.092 Y115.784
M73 P99 R0
G1 X62.942 Y116.934 E.04995
G1 X62.409 Y116.934
G1 X63.559 Y115.784 E.04995
G1 X63.025 Y115.784
G1 X61.876 Y116.934 E.04995
G1 X61.343 Y116.934
G1 X62.492 Y115.784 E.04995
G1 X61.959 Y115.784
G1 X60.809 Y116.934 E.04995
G1 X60.276 Y116.934
G1 X61.425 Y115.784 E.04995
G1 X60.892 Y115.784
G1 X59.743 Y116.934 E.04995
G1 X59.209 Y116.934
G1 X60.359 Y115.784 E.04995
G1 X59.826 Y115.784
G1 X58.676 Y116.934 E.04995
G1 X58.143 Y116.934
G1 X59.292 Y115.784 E.04995
G1 X58.759 Y115.784
G1 X57.61 Y116.934 E.04995
G1 X57.076 Y116.934
G1 X58.226 Y115.784 E.04995
G1 X57.693 Y115.784
G1 X56.543 Y116.934 E.04995
G1 X56.01 Y116.934
G1 X57.159 Y115.784 E.04995
G1 X56.626 Y115.784
G1 X55.477 Y116.934 E.04995
G1 X55.417 Y116.459
G1 X56.093 Y115.784 E.02935
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 21
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X55.417 Y116.459 E-.36295
G1 X55.477 Y116.934 E-.18156
G1 X55.878 Y116.533 E-.21548
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 105/105
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
G3 Z21.2 I-.045 J1.216 P1  F30000
G1 X195.21 Y121.712 Z21.2
G1 Z21
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
G1 F2874
G1 X195.21 Y116.288 E.16666
G1 X204.79 Y116.288 E.29437
G1 X204.79 Y121.712 E.16666
G1 X195.27 Y121.712 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X195.248 Y119.712 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.4 I.416 J1.144 P1  F30000
G1 X204.085 Y116.496 Z21.4
G1 Z21
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F2874
G1 X204.583 Y116.993 E.02161
G1 X204.583 Y117.526
G1 X203.552 Y116.496 E.04478
G1 X203.019 Y116.496
G1 X204.583 Y118.059 E.06796
G1 X204.583 Y118.593
G1 X202.486 Y116.496 E.09113
G1 X201.952 Y116.496
G1 X204.583 Y119.126 E.1143
G1 X204.583 Y119.659
G1 X201.419 Y116.496 E.13748
G1 X200.886 Y116.496
G1 X204.583 Y120.192 E.16065
G1 X204.583 Y120.726
G1 X200.352 Y116.496 E.18382
G1 X199.819 Y116.496
G1 X204.583 Y121.259 E.20699
G1 X204.295 Y121.504
G1 X199.286 Y116.496 E.21766
G1 X198.753 Y116.496
G1 X203.762 Y121.504 E.21766
G1 X203.228 Y121.504
G1 X198.219 Y116.496 E.21766
G1 X197.686 Y116.496
G1 X202.695 Y121.504 E.21766
G1 X202.162 Y121.504
G1 X197.153 Y116.496 E.21766
G1 X196.62 Y116.496
G1 X201.628 Y121.504 E.21766
G1 X201.095 Y121.504
G1 X196.086 Y116.496 E.21766
G1 X195.553 Y116.496
G1 X200.562 Y121.504 E.21766
G1 X200.029 Y121.504
G1 X195.417 Y116.893 E.20038
G1 X195.417 Y117.426
G1 X199.495 Y121.504 E.17721
G1 X198.962 Y121.504
G1 X195.417 Y117.96 E.15404
G1 X195.417 Y118.493
G1 X198.429 Y121.504 E.13086
G1 X197.896 Y121.504
G1 X195.417 Y119.026 E.10769
G1 X195.417 Y119.56
G1 X197.362 Y121.504 E.08452
G1 X196.829 Y121.504
G1 X195.417 Y120.093 E.06134
G1 X195.417 Y120.626
G1 X196.296 Y121.504 E.03817
G1 X195.763 Y121.504
G1 X195.417 Y121.159 E.015
M204 S10000
; WIPE_START
G1 F24000
G1 X195.763 Y121.504 E-.18548
G1 X196.296 Y121.504 E-.20264
G1 X195.604 Y120.812 E-.37188
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.4 I-.008 J-1.217 P1  F30000
G1 X64.79 Y121.712 Z21.4
G1 Z21
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
G1 F2874
G1 X55.21 Y121.712 E.29437
G1 X55.21 Y116.288 E.16666
G1 X64.79 Y116.288 E.29437
G1 X64.79 Y121.652 E.16481
M204 S10000
; WIPE_START
G1 F24000
G1 X62.79 Y121.664 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.4 I1.193 J.241 P1  F30000
G1 X63.835 Y116.496 Z21.4
G1 Z21
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F2874
G1 X64.583 Y117.243 E.03248
G1 X64.583 Y117.776
G1 X63.302 Y116.496 E.05565
G1 X62.769 Y116.496
G1 X64.583 Y118.309 E.07882
G1 X64.583 Y118.843
G1 X62.235 Y116.496 E.102
G1 X61.702 Y116.496
G1 X64.583 Y119.376 E.12517
G1 X64.583 Y119.909
G1 X61.169 Y116.496 E.14834
G1 X60.636 Y116.496
G1 X64.583 Y120.442 E.17152
G1 X64.583 Y120.976
G1 X60.102 Y116.496 E.19469
G1 X59.569 Y116.496
G1 X64.578 Y121.504 E.21766
G1 X64.045 Y121.504
G1 X59.036 Y116.496 E.21766
G1 X58.503 Y116.496
G1 X63.512 Y121.504 E.21766
G1 X62.978 Y121.504
G1 X57.969 Y116.496 E.21766
G1 X57.436 Y116.496
G1 X62.445 Y121.504 E.21766
G1 X61.912 Y121.504
G1 X56.903 Y116.496 E.21766
G1 X56.369 Y116.496
G1 X61.378 Y121.504 E.21766
G1 X60.845 Y121.504
G1 X55.836 Y116.496 E.21766
G1 X55.417 Y116.61
G1 X60.312 Y121.504 E.21269
G1 X59.779 Y121.504
G1 X55.417 Y117.143 E.18952
G1 X55.417 Y117.677
G1 X59.245 Y121.504 E.16634
G1 X58.712 Y121.504
G1 X55.417 Y118.21 E.14317
G1 X55.417 Y118.743
G1 X58.179 Y121.504 E.12
G1 X57.646 Y121.504
G1 X55.417 Y119.276 E.09682
G1 X55.417 Y119.81
G1 X57.112 Y121.504 E.07365
G1 X56.579 Y121.504
G1 X55.417 Y120.343 E.05048
G1 X55.417 Y120.876
G1 X56.046 Y121.504 E.0273
M204 S10000
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X55.417 Y120.876 E-.33767
G1 X55.417 Y120.343 E-.20264
G1 X55.826 Y120.752 E-.21969
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
G1 Z21.5 F900 ; lower z a little
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

    G1 Z121 F600
    G1 Z119

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

