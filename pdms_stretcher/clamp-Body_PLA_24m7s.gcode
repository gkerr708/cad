; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 18m 18s; total estimated time: 24m 7s
; total layer number: 135
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
; support_type = normal(manual)
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
M73 P0 R24
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
M73 P18 R19
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
M73 P19 R19
G1 X76 F15000
M73 P20 R19
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
M73 P21 R19
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
M73 P21 R18
G1 X230 Y15
G29.2 S1 ; turn on ABL
;G28 ; home again after hard wipe mouth
M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag
M622 J1

    M1002 gcode_claim_action : 1
    G29 A X113.071 Y106.848 I33.4815 J28.1962
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
; layer num/total_layer_count: 1/135
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
G1 X123.307 Y123.215 F30000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.5
M73 P22 R18
G1 F3000
G1 X116.105 Y123.215 E.26825
G1 X115.9 Y123.42 E.0108
G1 X115.9 Y132.58 E.3412
G1 X116.105 Y132.785 E.0108
G1 X116.7 Y132.816 E.02219
G1 X113.676 Y132.816 E.11263
G1 X113.676 Y120.307 E.46588
G1 X123.307 Y120.307 E.35872
G1 X123.307 Y123.146 E.10573
G1 X122.896 Y122.803 F30000
G1 F3000
G1 X115.935 Y122.803 E.25928
G1 X115.489 Y123.249 E.02349
G1 X115.489 Y132.404 E.34099
G1 X114.088 Y132.404 E.05219
G1 X114.088 Y120.719 E.43524
G1 X122.896 Y120.719 E.32808
G1 X122.896 Y122.803 E.07764
M73 P23 R18
G1 X122.388 Y122.295 F30000
G1 F3000
G1 X115.724 Y122.295 E.2482
G1 X114.595 Y123.424 E.05946
G1 X114.595 Y121.227 E.08185
G1 X122.388 Y121.227 E.29024
G1 X122.388 Y122.295 E.03981
; WIPE_START
G1 F24000
G1 X122.388 Y121.227 E-.40611
G1 X121.457 Y121.227 E-.35389
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.56 J1.081 P1  F30000
G1 X130.744 Y126.039 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G3 X130.253 Y125.918 I-.742 J1.954 E.47019
G1 X130.677 Y126.022 E.01628
G1 X130.956 Y126.615 F30000
G1 F3000
G3 X130.597 Y126.426 I-.953 J1.38 E.37729
G1 X130.956 Y126.615 E.01511
G1 X130.665 Y127.036 F30000
G1 F3000
G3 X130.415 Y126.905 I-.663 J.96 E.26261
G1 X130.665 Y127.036 E.01052
G1 X130.375 Y127.457 F30000
G1 F3000
G3 X130.234 Y127.383 I-.374 J.541 E.14792
M73 P24 R18
G1 X130.375 Y127.457 E.00592
; WIPE_START
G1 F24000
G1 X130.234 Y127.383 E-.06044
G1 X129.766 Y127.383 E-.17783
G1 X129.416 Y127.693 E-.17783
G1 X129.359 Y128.158 E-.17783
G1 X129.608 Y128.518 E-.16607
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.303 J1.179 P1  F30000
G1 X146.324 Y132.816 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X143.3 Y132.816 E.11263
G1 X143.895 Y132.785 E.02219
G1 X144.1 Y132.58 E.0108
G1 X144.1 Y123.42 E.3412
G1 X143.895 Y123.215 E.0108
G1 X136.693 Y123.215 E.26825
G1 X136.693 Y120.307 E.10828
G1 X146.324 Y120.307 E.35872
G1 X146.324 Y132.747 E.46333
; WIPE_START
G1 F24000
G1 X146.324 Y130.747 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.794 J-.922 P1  F30000
G1 X137.104 Y122.803 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X137.104 Y120.719 E.07764
G1 X145.912 Y120.719 E.32808
G1 X145.912 Y132.404 E.43524
G1 X144.511 Y132.404 E.05219
G1 X144.511 Y123.249 E.34099
G1 X144.065 Y122.803 E.02349
G1 X137.104 Y122.803 E.25928
G1 X137.612 Y122.295 F30000
G1 F3000
G1 X137.612 Y121.227 E.03981
G1 X145.405 Y121.227 E.29024
G1 X145.405 Y123.424 E.08185
G1 X144.276 Y122.295 E.05946
G1 X137.612 Y122.295 E.2482
; WIPE_START
G1 F24000
G1 X139.612 Y122.295 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.612 J-1.052 P1  F30000
G1 X127.091 Y129.575 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X127.066 Y129.54 E.0016
G1 X126.783 Y128.793 E.02975
G1 X126.687 Y128 E.02975
G1 X126.783 Y127.207 E.02975
G1 X127.066 Y126.46 E.02975
G1 X127.52 Y125.803 E.02975
G1 X128.118 Y125.273 E.02975
G1 X128.825 Y124.902 E.02975
G1 X129.601 Y124.711 E.02975
G1 X130.399 Y124.711 E.02975
G1 X131.175 Y124.902 E.02975
G1 X131.882 Y125.273 E.02975
G1 X132.48 Y125.803 E.02975
G1 X132.934 Y126.46 E.02975
G1 X133.217 Y127.207 E.02975
G1 X133.313 Y128 E.02975
G1 X133.217 Y128.793 E.02975
G1 X132.934 Y129.54 E.02975
G1 X132.48 Y130.197 E.02975
G1 X131.882 Y130.727 E.02975
G1 X131.175 Y131.098 E.02975
G1 X130.399 Y131.289 E.02975
G1 X129.601 Y131.289 E.02975
G1 X128.825 Y131.098 E.02975
G1 X128.118 Y130.727 E.02975
G1 X127.52 Y130.197 E.02975
G1 X127.125 Y129.625 E.02591
G1 X127.484 Y129.34 F30000
; FEATURE: Outer wall
G1 F3000
G1 X127.474 Y129.326 E.00065
G1 X127.23 Y128.683 E.02562
G1 X127.147 Y128 E.02562
G1 X127.23 Y127.317 E.02562
G1 X127.474 Y126.674 E.02562
G1 X127.865 Y126.108 E.02562
G1 X128.379 Y125.652 E.02562
G1 X128.988 Y125.332 E.02562
G1 X129.656 Y125.168 E.02562
G1 X130.344 Y125.168 E.02562
G1 X131.012 Y125.332 E.02562
G1 X131.621 Y125.652 E.02562
G1 X132.135 Y126.108 E.02562
G1 X132.526 Y126.674 E.02562
G1 X132.77 Y127.317 E.02562
G1 X132.853 Y128 E.02562
G1 X132.77 Y128.683 E.02562
G1 X132.526 Y129.326 E.02562
G1 X132.135 Y129.892 E.02562
G1 X131.621 Y130.348 E.02562
G1 X131.012 Y130.668 E.02562
G1 X130.344 Y130.832 E.02562
G1 X129.656 Y130.832 E.02562
G1 X128.988 Y130.668 E.02562
G1 X128.379 Y130.348 E.02562
G1 X127.865 Y129.892 E.02562
G1 X127.518 Y129.39 E.02273
; WIPE_START
G1 F24000
G1 X127.474 Y129.326 E-.02946
G1 X127.23 Y128.683 E-.26135
G1 X127.147 Y128 E-.26135
G1 X127.213 Y127.457 E-.20784
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.309 J1.177 P1  F30000
G1 X142.893 Y131.578 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X117.107 Y131.578 E.96042
G1 X117.107 Y124.422 E.26656
G1 X142.893 Y124.422 E.96042
G1 X142.893 Y131.518 E.26432
G1 X143.35 Y132.035 F30000
; FEATURE: Outer wall
G1 F3000
G1 X116.65 Y132.035 E.99447
G1 X116.65 Y123.965 E.30061
G1 X143.35 Y123.965 E.99447
G1 X143.35 Y131.975 E.29837
; WIPE_START
G1 F24000
G1 X141.35 Y131.98 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.191 J.251 P1  F30000
G1 X142.71 Y125.535 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.503135
G1 F6300
G1 X141.985 Y124.81 E.03845
G1 X141.334 Y124.81 E.02441
G1 X142.504 Y125.98 E.06206
G1 X142.504 Y126.631 E.02441
G1 X140.683 Y124.81 E.09657
G1 X140.033 Y124.81 E.02441
G1 X142.504 Y127.282 E.13109
G1 X142.504 Y127.933 E.02441
G1 X139.382 Y124.81 E.16561
G1 X138.731 Y124.81 E.02441
G1 X142.504 Y128.584 E.20013
G1 X142.504 Y129.234 E.02441
G1 X138.08 Y124.81 E.23464
G1 X137.429 Y124.81 E.02441
G1 X142.504 Y129.885 E.26916
G1 X142.504 Y130.536 E.02441
G1 X136.778 Y124.81 E.30368
G1 X136.128 Y124.81 E.02441
G1 X142.504 Y131.187 E.3382
G1 X141.856 Y131.19 E.0243
G1 X135.477 Y124.81 E.33835
G1 X134.826 Y124.81 E.02441
G1 X141.206 Y131.19 E.33835
G1 X140.555 Y131.19 E.02441
G1 X134.175 Y124.81 E.33835
G1 X133.524 Y124.81 E.02441
G1 X139.904 Y131.19 E.33835
G1 X139.253 Y131.19 E.02441
G1 X132.873 Y124.81 E.33835
G1 X132.391 Y124.81 E.01808
G1 X132.402 Y124.818 E.00051
G1 X132.332 Y124.92 E.00464
G1 X138.602 Y131.19 E.33254
G1 X137.951 Y131.19 E.02441
G1 X133.427 Y126.666 E.23994
M73 P25 R18
G1 X133.597 Y127.113 E.01795
G1 X133.649 Y127.538 E.01604
G1 X137.301 Y131.19 E.19368
G1 X136.65 Y131.19 E.02441
G1 X133.678 Y128.218 E.15759
G1 X133.608 Y128.799 E.02192
G1 X135.999 Y131.19 E.12681
G1 X135.348 Y131.19 E.02441
G1 X133.445 Y129.287 E.10092
G1 X133.259 Y129.752 E.01878
G1 X134.697 Y131.19 E.07625
G1 X134.046 Y131.19 E.02441
G1 X132.994 Y130.137 E.05583
G1 X132.773 Y130.457 E.01456
G1 X132.714 Y130.509 E.00294
G1 X133.395 Y131.19 E.03613
G1 X132.745 Y131.19 E.02441
G1 X132.224 Y130.669 E.02764
G1 X131.833 Y131.041 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.10292
G1 F3000
G1 X131.609 Y131.195 E.00133
; LINE_WIDTH: 0.148796
G1 X131.385 Y131.35 E.00235
; WIPE_START
G1 F24000
G1 X131.609 Y131.195 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.063 J-1.215 P1  F30000
G1 X128.615 Y131.35 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.194674
G1 F3000
G1 X128.391 Y131.195 E.00336
; LINE_WIDTH: 0.148797
G1 X128.167 Y131.041 E.00235
; WIPE_START
G1 F24000
G1 X128.391 Y131.195 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.065 J.588 P1  F30000
G1 X131.833 Y124.959 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.10292
G1 F3000
M73 P25 R17
G1 X131.609 Y124.805 E.00133
; LINE_WIDTH: 0.148798
G1 X131.385 Y124.65 E.00235
; WIPE_START
G1 F24000
G1 X131.609 Y124.805 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.063 J-1.215 P1  F30000
G1 X128.615 Y124.65 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.194675
G1 F3000
G1 X128.391 Y124.805 E.00336
; LINE_WIDTH: 0.148798
G1 X128.167 Y124.959 E.00235
G1 X127.756 Y125.349 F30000
; FEATURE: Bottom surface
; LINE_WIDTH: 0.502077
G1 F6300
G1 X127.217 Y124.81 E.02853
G1 X126.568 Y124.81 E.0243
G1 X127.266 Y125.509 E.03696
G1 X126.992 Y125.884 E.01739
G1 X125.918 Y124.81 E.05681
G1 X125.269 Y124.81 E.0243
G1 X126.727 Y126.268 E.07714
G1 X126.546 Y126.736 E.01879
G1 X124.62 Y124.81 E.10192
G1 X123.97 Y124.81 E.0243
G1 X126.389 Y127.229 E.12798
G1 X126.319 Y127.808 E.02182
G1 X123.321 Y124.81 E.15861
G1 X122.672 Y124.81 E.0243
G1 X126.355 Y128.494 E.19491
G1 X126.403 Y128.887 E.01481
G1 X126.589 Y129.377 E.01961
G1 X122.022 Y124.81 E.24163
G1 X121.373 Y124.81 E.0243
G1 X127.658 Y131.095 E.33255
G1 X127.596 Y131.19 E.00423
G1 X127.103 Y131.19 E.01845
G1 X120.724 Y124.81 E.33757
G1 X120.074 Y124.81 E.0243
G1 X126.454 Y131.19 E.33757
G1 X125.805 Y131.19 E.0243
G1 X119.425 Y124.81 E.33757
G1 X118.776 Y124.81 E.0243
G1 X125.155 Y131.19 E.33757
G1 X124.506 Y131.19 E.0243
G1 X118.126 Y124.81 E.33757
G1 X117.496 Y124.81 E.0236
G1 X117.496 Y124.829 E.0007
G1 X123.857 Y131.19 E.33658
G1 X123.207 Y131.19 E.0243
G1 X117.496 Y125.478 E.30222
G1 X117.496 Y126.128 E.0243
G1 X122.558 Y131.19 E.26786
G1 X121.909 Y131.19 E.0243
G1 X117.496 Y126.777 E.23351
G1 X117.496 Y127.426 E.0243
G1 X121.259 Y131.19 E.19915
G1 X120.61 Y131.19 E.0243
G1 X117.496 Y128.076 E.16479
G1 X117.496 Y128.725 E.0243
G1 X119.961 Y131.19 E.13043
G1 X119.311 Y131.19 E.0243
G1 X117.496 Y129.374 E.09607
G1 X117.496 Y130.024 E.0243
G1 X118.662 Y131.19 E.06171
G1 X118.012 Y131.19 E.0243
G1 X117.29 Y130.467 E.03823
; WIPE_START
G1 F24000
G1 X118.012 Y131.19 E-.38832
G1 X118.662 Y131.19 E-.24675
G1 X118.429 Y130.957 E-.12493
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.194 J.234 P1  F30000
G1 X122.931 Y107.984 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.5
G1 F3000
G1 X115.728 Y107.984 E.26825
G1 X115.523 Y108.189 E.0108
G1 X115.523 Y117.35 E.3412
G1 X115.728 Y117.555 E.0108
G1 X116.323 Y117.585 E.02219
G1 X113.3 Y117.585 E.11263
G1 X113.3 Y105.077 E.46588
G1 X122.931 Y105.077 E.35872
G1 X122.931 Y107.915 E.10573
G1 X122.519 Y107.572 F30000
G1 F3000
G1 X115.558 Y107.572 E.25928
G1 X115.112 Y108.018 E.02349
G1 X115.112 Y117.173 E.34099
G1 X113.711 Y117.173 E.05219
G1 X113.711 Y105.488 E.43524
G1 X122.519 Y105.488 E.32808
G1 X122.519 Y107.572 E.07764
G1 X122.011 Y107.065 F30000
G1 F3000
G1 X115.348 Y107.065 E.2482
G1 X114.219 Y108.193 E.05946
G1 X114.219 Y105.996 E.08185
G1 X122.011 Y105.996 E.29024
G1 X122.011 Y107.065 E.03981
; WIPE_START
G1 F24000
G1 X122.011 Y105.996 E-.40611
G1 X121.08 Y105.996 E-.35389
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.56 J1.081 P1  F30000
M73 P26 R17
G1 X130.367 Y110.808 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G3 X129.876 Y110.687 I-.742 J1.954 E.47019
G1 X130.301 Y110.792 E.01628
G1 X130.58 Y111.384 F30000
G1 F3000
G3 X130.22 Y111.196 I-.953 J1.38 E.37729
G1 X130.58 Y111.384 E.01511
G1 X130.289 Y111.805 F30000
G1 F3000
G3 X130.039 Y111.674 I-.663 J.96 E.26261
G1 X130.289 Y111.805 E.01052
G1 X129.998 Y112.226 F30000
G1 F3000
G3 X129.857 Y112.152 I-.374 J.541 E.14792
G1 X129.998 Y112.226 E.00592
; WIPE_START
G1 F24000
G1 X129.857 Y112.152 E-.06044
G1 X129.389 Y112.152 E-.17783
G1 X129.039 Y112.463 E-.17783
G1 X128.983 Y112.927 E-.17783
G1 X129.231 Y113.287 E-.16607
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.303 J1.179 P1  F30000
G1 X145.947 Y117.585 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X142.923 Y117.585 E.11263
G1 X143.518 Y117.555 E.02219
G1 X143.723 Y117.35 E.0108
G1 X143.723 Y108.189 E.3412
G1 X143.518 Y107.984 E.0108
G1 X136.316 Y107.984 E.26825
G1 X136.316 Y105.077 E.10828
G1 X145.947 Y105.077 E.35872
G1 X145.947 Y117.516 E.46333
; WIPE_START
G1 F24000
G1 X145.947 Y115.516 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.794 J-.922 P1  F30000
G1 X136.728 Y107.572 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X136.728 Y105.488 E.07764
G1 X145.536 Y105.488 E.32808
G1 X145.536 Y117.173 E.43524
G1 X144.135 Y117.173 E.05219
G1 X144.135 Y108.018 E.34099
G1 X143.689 Y107.572 E.02349
G1 X136.728 Y107.572 E.25928
G1 X137.235 Y107.065 F30000
G1 F3000
G1 X137.235 Y105.996 E.03981
G1 X145.028 Y105.996 E.29024
G1 X145.028 Y108.193 E.08185
G1 X143.899 Y107.065 E.05946
G1 X137.235 Y107.065 E.2482
; WIPE_START
G1 F24000
G1 X139.235 Y107.065 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.612 J-1.052 P1  F30000
G1 X126.714 Y114.344 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X126.69 Y114.309 E.0016
G1 X126.406 Y113.562 E.02975
G1 X126.31 Y112.769 E.02975
G1 X126.406 Y111.976 E.02975
G1 X126.69 Y111.229 E.02975
G1 X127.143 Y110.572 E.02975
G1 X127.741 Y110.042 E.02975
G1 X128.448 Y109.671 E.02975
G1 X129.224 Y109.48 E.02975
G1 X130.023 Y109.48 E.02975
G1 X130.798 Y109.671 E.02975
G1 X131.506 Y110.042 E.02975
G1 X132.104 Y110.572 E.02975
G1 X132.557 Y111.229 E.02975
G1 X132.841 Y111.976 E.02975
G1 X132.937 Y112.769 E.02975
G1 X132.841 Y113.562 E.02975
G1 X132.557 Y114.309 E.02975
G1 X132.104 Y114.966 E.02975
G1 X131.506 Y115.496 E.02975
G1 X130.798 Y115.867 E.02975
G1 X130.023 Y116.058 E.02975
G1 X129.224 Y116.058 E.02975
G1 X128.448 Y115.867 E.02975
G1 X127.741 Y115.496 E.02975
G1 X127.143 Y114.966 E.02975
G1 X126.748 Y114.394 E.02591
G1 X127.107 Y114.109 F30000
; FEATURE: Outer wall
G1 F3000
G1 X127.097 Y114.095 E.00065
G1 X126.853 Y113.452 E.02562
G1 X126.77 Y112.769 E.02562
G1 X126.853 Y112.086 E.02562
G1 X127.097 Y111.443 E.02562
G1 X127.488 Y110.877 E.02562
G1 X128.003 Y110.421 E.02562
G1 X128.612 Y110.102 E.02562
G1 X129.28 Y109.937 E.02562
G1 X129.967 Y109.937 E.02562
G1 X130.635 Y110.102 E.02562
G1 X131.244 Y110.421 E.02562
G1 X131.759 Y110.877 E.02562
G1 X132.15 Y111.443 E.02562
G1 X132.393 Y112.087 E.02562
G1 X132.476 Y112.769 E.02562
G1 X132.393 Y113.452 E.02562
G1 X132.15 Y114.095 E.02562
G1 X131.759 Y114.661 E.02562
G1 X131.244 Y115.117 E.02562
G1 X130.635 Y115.437 E.02562
G1 X129.967 Y115.601 E.02562
G1 X129.28 Y115.601 E.02562
G1 X128.612 Y115.437 E.02562
G1 X128.003 Y115.117 E.02562
G1 X127.488 Y114.661 E.02562
G1 X127.141 Y114.159 E.02273
; WIPE_START
G1 F24000
G1 X127.097 Y114.095 E-.02946
G1 X126.853 Y113.452 E-.26135
G1 X126.77 Y112.769 E-.26135
G1 X126.836 Y112.226 E-.20784
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.309 J1.177 P1  F30000
G1 X142.516 Y116.348 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X116.731 Y116.348 E.96042
G1 X116.731 Y109.191 E.26656
G1 X142.516 Y109.191 E.96042
G1 X142.516 Y116.288 E.26432
G1 X142.973 Y116.805 F30000
; FEATURE: Outer wall
G1 F3000
G1 X116.273 Y116.805 E.99447
G1 X116.273 Y108.734 E.30061
G1 X142.973 Y108.734 E.99447
G1 X142.973 Y116.745 E.29837
; WIPE_START
G1 F24000
G1 X140.973 Y116.749 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.191 J.251 P1  F30000
G1 X142.334 Y110.304 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.503135
G1 F6300
G1 X141.609 Y109.579 E.03845
G1 X140.958 Y109.579 E.02441
G1 X142.128 Y110.749 E.06206
G1 X142.128 Y111.4 E.02441
G1 X140.307 Y109.579 E.09657
G1 X139.656 Y109.579 E.02441
G1 X142.128 Y112.051 E.13109
G1 X142.128 Y112.702 E.02441
G1 X139.005 Y109.579 E.16561
G1 X138.354 Y109.579 E.02441
G1 X142.128 Y113.353 E.20013
G1 X142.128 Y114.004 E.02441
G1 X137.704 Y109.579 E.23464
G1 X137.053 Y109.579 E.02441
G1 X142.128 Y114.655 E.26916
G1 X142.128 Y115.305 E.02441
G1 X136.402 Y109.579 E.30368
G1 X135.751 Y109.579 E.02441
G1 X142.128 Y115.956 E.3382
G1 X141.48 Y115.959 E.0243
G1 X135.1 Y109.579 E.33835
G1 X134.449 Y109.579 E.02441
G1 X140.829 Y115.959 E.33835
G1 X140.178 Y115.959 E.02441
G1 X133.798 Y109.579 E.33835
G1 X133.148 Y109.579 E.02441
G1 X139.527 Y115.959 E.33835
G1 X138.877 Y115.959 E.02441
G1 X132.497 Y109.579 E.33835
G1 X132.015 Y109.579 E.01808
M73 P27 R17
G1 X132.026 Y109.587 E.00051
G1 X131.956 Y109.689 E.00464
G1 X138.226 Y115.959 E.33254
G1 X137.575 Y115.959 E.02441
G1 X133.051 Y111.435 E.23994
G1 X133.221 Y111.883 E.01795
G1 X133.272 Y112.307 E.01604
G1 X136.924 Y115.959 E.19368
G1 X136.273 Y115.959 E.02441
G1 X133.302 Y112.988 E.15759
G1 X133.231 Y113.568 E.02192
G1 X135.622 Y115.959 E.12681
G1 X134.971 Y115.959 E.02441
G1 X133.069 Y114.056 E.10092
G1 X132.883 Y114.521 E.01878
G1 X134.321 Y115.959 E.07625
G1 X133.67 Y115.959 E.02441
G1 X132.617 Y114.906 E.05583
G1 X132.396 Y115.226 E.01456
G1 X132.338 Y115.278 E.00294
G1 X133.019 Y115.959 E.03613
G1 X132.368 Y115.959 E.02441
G1 X131.847 Y115.438 E.02764
G1 X131.456 Y115.81 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.10292
G1 F3000
G1 X131.232 Y115.964 E.00133
; LINE_WIDTH: 0.148796
G1 X131.008 Y116.119 E.00235
; WIPE_START
G1 F24000
G1 X131.232 Y115.964 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.063 J-1.215 P1  F30000
G1 X128.238 Y116.119 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.194674
G1 F3000
G1 X128.015 Y115.964 E.00336
; LINE_WIDTH: 0.148797
G1 X127.791 Y115.81 E.00235
; WIPE_START
G1 F24000
G1 X128.015 Y115.964 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.065 J.588 P1  F30000
G1 X131.456 Y109.729 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.10292
G1 F3000
G1 X131.232 Y109.574 E.00133
; LINE_WIDTH: 0.148798
G1 X131.008 Y109.419 E.00235
; WIPE_START
G1 F24000
G1 X131.232 Y109.574 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.063 J-1.215 P1  F30000
G1 X128.238 Y109.419 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.194675
G1 F3000
G1 X128.015 Y109.574 E.00336
; LINE_WIDTH: 0.148798
G1 X127.791 Y109.729 E.00235
G1 X127.38 Y110.119 F30000
; FEATURE: Bottom surface
; LINE_WIDTH: 0.502077
G1 F6300
G1 X126.841 Y109.579 E.02853
G1 X126.191 Y109.579 E.0243
G1 X126.89 Y110.278 E.03696
G1 X126.615 Y110.653 E.01739
G1 X125.542 Y109.579 E.05681
G1 X124.892 Y109.579 E.0243
G1 X126.35 Y111.037 E.07714
G1 X126.169 Y111.506 E.01879
G1 X124.243 Y109.579 E.10192
G1 X123.594 Y109.579 E.0243
G1 X126.012 Y111.998 E.12798
G1 X125.942 Y112.577 E.02182
G1 X122.944 Y109.579 E.15861
G1 X122.295 Y109.579 E.0243
G1 X125.979 Y113.263 E.19491
G1 X126.026 Y113.656 E.01481
G1 X126.212 Y114.146 E.01961
G1 X121.646 Y109.579 E.24163
G1 X120.996 Y109.579 E.0243
G1 X127.281 Y115.864 E.33255
G1 X127.22 Y115.959 E.00423
G1 X126.727 Y115.959 E.01845
G1 X120.347 Y109.579 E.33757
G1 X119.698 Y109.579 E.0243
G1 X126.077 Y115.959 E.33757
G1 X125.428 Y115.959 E.0243
G1 X119.048 Y109.579 E.33757
G1 X118.399 Y109.579 E.0243
G1 X124.779 Y115.959 E.33757
G1 X124.129 Y115.959 E.0243
G1 X117.75 Y109.579 E.33757
G1 X117.119 Y109.579 E.0236
G1 X117.119 Y109.598 E.0007
G1 X123.48 Y115.959 E.33658
G1 X122.831 Y115.959 E.0243
G1 X117.119 Y110.247 E.30222
G1 X117.119 Y110.897 E.0243
G1 X122.181 Y115.959 E.26786
G1 X121.532 Y115.959 E.0243
G1 X117.119 Y111.546 E.23351
G1 X117.119 Y112.195 E.0243
G1 X120.883 Y115.959 E.19915
G1 X120.233 Y115.959 E.0243
G1 X117.119 Y112.845 E.16479
G1 X117.119 Y113.494 E.0243
G1 X119.584 Y115.959 E.13043
G1 X118.935 Y115.959 E.0243
G1 X117.119 Y114.144 E.09607
G1 X117.119 Y114.793 E.0243
G1 X118.285 Y115.959 E.06171
G1 X117.636 Y115.959 E.0243
G1 X116.913 Y115.237 E.03823
M106 S252.45
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X117.636 Y115.959 E-.38832
G1 X118.285 Y115.959 E-.24675
G1 X118.053 Y115.727 E-.12493
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/135
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
G3 Z.6 I-1.009 J.681 P1  F30000
G1 X127.316 Y129.454 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X127.294 Y129.42 E.00134
G1 X127.032 Y128.731 E.02444
G1 X126.943 Y128 E.02444
G1 X127.032 Y127.269 E.02444
G1 X127.294 Y126.58 E.02444
G1 X127.712 Y125.973 E.02444
G1 X128.264 Y125.485 E.02444
G1 X128.381 Y125.423 E.00438
G1 X128.916 Y125.142 E.02006
G1 X129.632 Y124.966 E.02444
G1 X130.368 Y124.966 E.02444
G1 X131.084 Y125.142 E.02444
G1 X131.736 Y125.485 E.02444
G1 X132.288 Y125.973 E.02444
G1 X132.706 Y126.58 E.02444
G1 X132.968 Y127.269 E.02444
G1 X133.057 Y128 E.02444
G1 X132.968 Y128.731 E.02444
G1 X132.706 Y129.42 E.02444
G1 X132.288 Y130.027 E.02444
G1 X131.736 Y130.515 E.02444
G1 X131.084 Y130.858 E.02444
G1 X130.368 Y131.034 E.02444
G1 X129.632 Y131.034 E.02444
M73 P28 R17
G1 X128.916 Y130.858 E.02444
G1 X128.264 Y130.515 E.02444
G1 X127.712 Y130.027 E.02444
G1 X127.351 Y129.503 E.02112
G1 X127.643 Y129.237 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X127.416 Y128.637 E.01972
G1 X127.338 Y128 E.01972
G1 X127.416 Y127.363 E.01972
G1 X127.643 Y126.763 E.01972
G1 X128.008 Y126.235 E.01972
G1 X128.488 Y125.81 E.01972
G1 X128.563 Y125.77 E.0026
G1 X129.056 Y125.511 E.01712
G1 X129.679 Y125.358 E.01972
G1 X130.321 Y125.358 E.01972
G1 X130.944 Y125.511 E.01972
G1 X131.512 Y125.81 E.01972
G1 X131.992 Y126.235 E.01972
G1 X132.357 Y126.763 E.01972
G1 X132.584 Y127.363 E.01972
G1 X132.662 Y128 E.01972
G1 X132.584 Y128.637 E.01972
G1 X132.357 Y129.237 E.01972
G1 X131.992 Y129.765 E.01972
G1 X131.512 Y130.19 E.01972
G1 X130.944 Y130.489 E.01972
G1 X130.321 Y130.642 E.01972
G1 X129.679 Y130.642 E.01972
G1 X129.056 Y130.489 E.01972
G1 X128.488 Y130.19 E.01972
G1 X128.008 Y129.765 E.01972
G1 X127.677 Y129.286 E.01787
M204 S10000
; WIPE_START
G1 F24000
G1 X127.416 Y128.637 E-.26601
G1 X127.338 Y128 E-.24382
G1 X127.416 Y127.363 E-.24382
G1 X127.422 Y127.347 E-.00635
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.352 J1.165 P1  F30000
G1 X143.148 Y132.103 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.852 Y132.103 E.87228
G1 X116.852 Y123.897 E.27222
G1 X143.148 Y123.897 E.87228
G1 X143.148 Y132.043 E.27023
G1 X143.54 Y132.266 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.54 Y132.43 E.00504
M106 S255
G1 F1800
G1 X143.54 Y132.495 E.00199
G1 X116.46 Y132.495 E.83209
G1 X116.46 Y132.43 E.00199
M106 S252.45
G1 F12000
G1 X116.46 Y132.266 E.00504
G1 X116.46 Y123.734 E.26219
G1 X116.46 Y123.57 E.00504
M106 S255
G1 F1800
G1 X116.46 Y123.505 E.00199
G1 X143.54 Y123.505 E.83209
G1 X143.54 Y123.57 E.00199
M106 S252.45
G1 F12000
G1 X143.54 Y123.734 E.00504
G1 X143.54 Y132.206 E.26035
M204 S10000
; WIPE_START
G1 F24000
G1 X143.54 Y132.43 E-.08512
G1 X143.54 Y132.495 E-.02466
G1 X141.829 Y132.495 E-.65022
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1 J.694 P1  F30000
G1 X142.214 Y131.94 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423673
G1 F15000
G1 X142.815 Y131.339 E.02634
G1 X142.815 Y130.801 E.01671
G1 X141.846 Y131.77 E.04252
G1 X141.307 Y131.77 E.01671
G1 X142.815 Y130.262 E.06615
G1 X142.815 Y129.724 E.01671
G1 X140.769 Y131.77 E.08978
G1 X140.23 Y131.77 E.01671
G1 X142.815 Y129.185 E.11341
G1 X142.815 Y128.647 E.01671
G1 X139.692 Y131.77 E.13703
G1 X139.153 Y131.77 E.01671
G1 X142.815 Y128.108 E.16066
G1 X142.815 Y127.57 E.01671
G1 X138.615 Y131.77 E.18429
G1 X138.076 Y131.77 E.01671
G1 X142.815 Y127.032 E.20791
G1 X142.815 Y126.493 E.01671
G1 X137.538 Y131.77 E.23154
G1 X136.999 Y131.77 E.01671
G1 X142.815 Y125.955 E.25517
G1 X142.815 Y125.416 E.01671
G1 X136.461 Y131.77 E.27879
G1 X135.922 Y131.77 E.01671
G1 X142.815 Y124.878 E.30242
G1 X142.815 Y124.339 E.01671
G1 X135.384 Y131.77 E.32605
G1 X134.845 Y131.77 E.01671
G1 X142.385 Y124.23 E.33084
G1 X141.847 Y124.23 E.01671
G1 X134.307 Y131.77 E.33084
G1 X133.769 Y131.77 E.01671
G1 X141.308 Y124.23 E.33084
G1 X140.77 Y124.23 E.01671
G1 X133.23 Y131.77 E.33084
G1 X132.692 Y131.77 E.01671
G1 X140.232 Y124.23 E.33084
G1 X139.693 Y124.23 E.01671
G1 X132.153 Y131.77 E.33084
G1 X131.615 Y131.77 E.01671
G1 X139.155 Y124.23 E.33084
G1 X138.616 Y124.23 E.01671
G1 X131.076 Y131.77 E.33084
G1 X130.538 Y131.77 E.01671
G1 X131.114 Y131.194 E.02529
G1 X130.402 Y131.367 E.02275
G1 X129.999 Y131.77 E.01766
G1 X129.461 Y131.77 E.01671
G1 X129.863 Y131.367 E.01766
G3 X129.377 Y131.315 I-.136 J-1.012 E.01531
G1 X128.922 Y131.77 E.01997
G1 X128.384 Y131.77 E.01671
G1 X128.945 Y131.208 E.02464
G3 X128.565 Y131.05 I.131 J-.85 E.0129
G1 X127.845 Y131.77 E.03159
G1 X127.307 Y131.77 E.01671
G1 X128.212 Y130.865 E.03972
G3 X127.9 Y130.638 I.303 J-.746 E.01208
G1 X126.768 Y131.77 E.04965
G1 X126.23 Y131.77 E.01671
G1 X127.614 Y130.386 E.06075
G3 X127.359 Y130.102 I.447 J-.659 E.01195
G1 X125.692 Y131.77 E.07318
G1 X125.153 Y131.77 E.01671
G1 X127.139 Y129.784 E.08716
G3 X126.945 Y129.44 I.6 J-.567 E.01238
G1 X124.615 Y131.77 E.10224
G1 X124.076 Y131.77 E.01671
G1 X126.797 Y129.05 E.11937
G3 X126.684 Y128.624 I.807 J-.442 E.01379
G1 X123.538 Y131.77 E.13804
G1 X122.999 Y131.77 E.01671
G1 X126.625 Y128.144 E.15911
G1 X126.608 Y128 E.0045
G1 X126.66 Y127.571 E.01341
G1 X122.461 Y131.77 E.18425
G1 X121.922 Y131.77 E.01671
G1 X126.83 Y126.862 E.21534
G1 X126.996 Y126.424 E.01456
G1 X127.461 Y125.751 E.02537
G1 X128.073 Y125.208 E.02537
G1 X128.797 Y124.828 E.02537
G1 X128.886 Y124.806 E.00284
G1 X129.462 Y124.23 E.02529
G1 X130.001 Y124.23 E.01671
G1 X129.598 Y124.633 E.01766
G1 X130.137 Y124.633 E.01671
G1 X130.539 Y124.23 E.01766
G1 X131.078 Y124.23 E.01671
G1 X130.622 Y124.685 E.01997
G1 X131.054 Y124.792 E.0138
G1 X131.616 Y124.23 E.02464
G1 X132.155 Y124.23 E.01671
G1 X131.435 Y124.95 E.03159
G1 X131.788 Y125.135 E.01237
G1 X132.693 Y124.23 E.03972
G1 X133.231 Y124.23 E.01671
G1 X132.1 Y125.362 E.04965
G1 X132.386 Y125.614 E.01184
G1 X133.77 Y124.23 E.06075
G1 X134.308 Y124.23 E.01671
G1 X132.641 Y125.898 E.07318
G1 X132.861 Y126.216 E.01201
G1 X134.847 Y124.23 E.08715
G1 X135.385 Y124.23 E.01671
G1 X133.055 Y126.56 E.10223
G1 X133.203 Y126.95 E.01295
G1 X135.924 Y124.23 E.11936
G1 X136.462 Y124.23 E.01671
G1 X133.316 Y127.376 E.13803
G1 X133.375 Y127.856 E.01501
G1 X137.001 Y124.23 E.1591
G1 X137.539 Y124.23 E.01671
G1 X133.34 Y128.429 E.18425
G1 X133.294 Y128.812 E.01196
G1 X133.17 Y129.138 E.01081
G1 X138.247 Y124.06 E.22278
; WIPE_START
G1 F24000
G1 X136.833 Y125.475 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.465 J-1.124 P1  F30000
G1 X121.214 Y131.94 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X128.924 Y124.23 E.33829
G1 X128.385 Y124.23 E.01671
G1 X120.845 Y131.77 E.33084
G1 X120.307 Y131.77 E.01671
G1 X127.847 Y124.23 E.33084
G1 X127.308 Y124.23 E.01671
G1 X119.768 Y131.77 E.33084
G1 X119.23 Y131.77 E.01671
G1 X126.77 Y124.23 E.33084
G1 X126.231 Y124.23 E.01671
G1 X118.691 Y131.77 E.33084
G1 X118.153 Y131.77 E.01671
G1 X125.693 Y124.23 E.33084
G1 X125.154 Y124.23 E.01671
G1 X117.615 Y131.77 E.33084
G1 X117.185 Y131.77 E.01332
G1 X117.185 Y131.661 E.00339
G1 X124.616 Y124.23 E.32604
G1 X124.078 Y124.23 E.01671
G1 X117.185 Y131.122 E.30242
G1 X117.185 Y130.584 E.01671
G1 X123.539 Y124.23 E.27879
G1 X123.001 Y124.23 E.01671
G1 X117.185 Y130.045 E.25516
G1 X117.185 Y129.507 E.01671
G1 X122.462 Y124.23 E.23154
G1 X121.924 Y124.23 E.01671
G1 X117.185 Y128.968 E.20791
G1 X117.185 Y128.43 E.01671
G1 X121.385 Y124.23 E.18428
G1 X120.847 Y124.23 E.01671
G1 X117.185 Y127.891 E.16066
G1 X117.185 Y127.353 E.01671
G1 X120.308 Y124.23 E.13703
G1 X119.77 Y124.23 E.01671
G1 X117.185 Y126.814 E.1134
G1 X117.185 Y126.276 E.01671
G1 X119.231 Y124.23 E.08978
G1 X118.693 Y124.23 E.01671
G1 X117.185 Y125.738 E.06615
G1 X117.185 Y125.199 E.01671
G1 X118.154 Y124.23 E.04252
G1 X117.616 Y124.23 E.01671
G1 X117.016 Y124.83 E.02634
; WIPE_START
G1 F24000
G1 X117.616 Y124.23 E-.3226
G1 X118.154 Y124.23 E-.20462
G1 X117.721 Y124.663 E-.23278
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.912 J.805 P1  F30000
G1 X126.94 Y114.223 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X126.917 Y114.19 E.00134
G1 X126.656 Y113.501 E.02444
G1 X126.567 Y112.769 E.02444
G1 X126.656 Y112.038 E.02444
G1 X126.917 Y111.349 E.02444
G1 X127.336 Y110.742 E.02444
G1 X127.887 Y110.254 E.02444
G1 X128.004 Y110.192 E.00438
G1 X128.54 Y109.911 E.02006
G1 X129.255 Y109.735 E.02444
G1 X129.992 Y109.735 E.02444
G1 X130.707 Y109.911 E.02444
G1 X131.36 Y110.254 E.02444
G1 X131.911 Y110.742 E.02444
G1 X132.33 Y111.349 E.02444
G1 X132.591 Y112.038 E.02444
G1 X132.68 Y112.769 E.02444
G1 X132.591 Y113.501 E.02444
G1 X132.33 Y114.19 E.02444
G1 X131.911 Y114.796 E.02444
G1 X131.36 Y115.285 E.02444
G1 X130.707 Y115.627 E.02444
G1 X129.992 Y115.803 E.02444
G1 X129.255 Y115.803 E.02444
G1 X128.54 Y115.627 E.02444
G1 X127.887 Y115.285 E.02444
G1 X127.336 Y114.796 E.02444
G1 X126.974 Y114.272 E.02112
G1 X127.267 Y114.006 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X127.039 Y113.406 E.01972
G1 X126.962 Y112.769 E.01972
G1 X127.039 Y112.132 E.01972
G1 X127.267 Y111.532 E.01972
G1 X127.631 Y111.004 E.01972
G1 X128.112 Y110.579 E.01972
G1 X128.186 Y110.54 E.0026
G1 X128.68 Y110.281 E.01712
G1 X129.303 Y110.127 E.01972
G1 X129.944 Y110.127 E.01972
G1 X130.567 Y110.281 E.01972
G1 X131.135 Y110.579 E.01972
G1 X131.616 Y111.004 E.01972
G1 X131.98 Y111.532 E.01972
G1 X132.208 Y112.132 E.01972
G1 X132.285 Y112.769 E.01972
G1 X132.208 Y113.406 E.01972
G1 X131.98 Y114.006 E.01972
G1 X131.616 Y114.534 E.01972
G1 X131.135 Y114.96 E.01972
G1 X130.567 Y115.258 E.01972
G1 X129.944 Y115.411 E.01972
G1 X129.303 Y115.411 E.01972
G1 X128.68 Y115.258 E.01972
G1 X128.112 Y114.96 E.01972
G1 X127.631 Y114.534 E.01972
G1 X127.301 Y114.056 E.01787
M204 S10000
; WIPE_START
G1 F24000
G1 X127.039 Y113.406 E-.26601
G1 X126.962 Y112.769 E-.24382
G1 X127.039 Y112.132 E-.24382
G1 X127.045 Y112.117 E-.00635
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.352 J1.165 P1  F30000
G1 X142.771 Y116.872 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.476 Y116.872 E.87228
G1 X116.476 Y108.666 E.27222
G1 X142.771 Y108.666 E.87228
G1 X142.771 Y116.812 E.27023
G1 X143.163 Y117.036 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.163 Y117.2 E.00504
M106 S255
G1 F1800
G1 X143.163 Y117.265 E.00199
G1 X116.083 Y117.265 E.83209
G1 X116.083 Y117.2 E.00199
M106 S252.45
G1 F12000
G1 X116.083 Y117.036 E.00504
G1 X116.083 Y108.503 E.26219
G1 X116.083 Y108.339 E.00504
M106 S255
G1 F1800
G1 X116.083 Y108.274 E.00199
G1 X143.163 Y108.274 E.83209
G1 X143.163 Y108.339 E.00199
M106 S252.45
G1 F12000
G1 X143.163 Y108.503 E.00504
G1 X143.163 Y116.976 E.26035
M204 S10000
; WIPE_START
G1 F24000
G1 X143.163 Y117.2 E-.08512
G1 X143.163 Y117.265 E-.02466
G1 X141.452 Y117.265 E-.65022
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1 J.694 P1  F30000
G1 X141.838 Y116.709 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423673
G1 F15000
G1 X142.438 Y116.109 E.02634
G1 X142.438 Y115.57 E.01671
G1 X141.469 Y116.539 E.04252
G1 X140.93 Y116.539 E.01671
G1 X142.438 Y115.032 E.06615
G1 X142.438 Y114.493 E.01671
G1 X140.392 Y116.539 E.08978
G1 X139.854 Y116.539 E.01671
G1 X142.438 Y113.955 E.11341
G1 X142.438 Y113.416 E.01671
G1 X139.315 Y116.539 E.13703
G1 X138.777 Y116.539 E.01671
G1 X142.438 Y112.878 E.16066
G1 X142.438 Y112.339 E.01671
G1 X138.238 Y116.539 E.18429
G1 X137.7 Y116.539 E.01671
G1 X142.438 Y111.801 E.20791
G1 X142.438 Y111.262 E.01671
G1 X137.161 Y116.539 E.23154
G1 X136.623 Y116.539 E.01671
G1 X142.438 Y110.724 E.25517
G1 X142.438 Y110.185 E.01671
G1 X136.084 Y116.539 E.27879
G1 X135.546 Y116.539 E.01671
G1 X142.438 Y109.647 E.30242
G1 X142.438 Y109.108 E.01671
G1 X135.007 Y116.539 E.32605
G1 X134.469 Y116.539 E.01671
G1 X142.009 Y108.999 E.33084
G1 X141.47 Y108.999 E.01671
G1 X133.93 Y116.539 E.33084
G1 X133.392 Y116.539 E.01671
G1 X140.932 Y108.999 E.33084
G1 X140.393 Y108.999 E.01671
G1 X132.853 Y116.539 E.33084
G1 X132.315 Y116.539 E.01671
G1 X139.855 Y108.999 E.33084
G1 X139.317 Y108.999 E.01671
G1 X131.777 Y116.539 E.33084
G1 X131.238 Y116.539 E.01671
G1 X138.778 Y108.999 E.33084
G1 X138.24 Y108.999 E.01671
G1 X130.7 Y116.539 E.33084
G1 X130.161 Y116.539 E.01671
G1 X130.737 Y115.963 E.02529
G1 X130.025 Y116.137 E.02275
G1 X129.623 Y116.539 E.01766
G1 X129.084 Y116.539 E.01671
G1 X129.487 Y116.137 E.01766
G3 X129.001 Y116.084 I-.136 J-1.012 E.01531
G1 X128.546 Y116.539 E.01997
G1 X128.007 Y116.539 E.01671
G1 X128.569 Y115.978 E.02464
G3 X128.189 Y115.819 I.131 J-.85 E.0129
G1 X127.469 Y116.539 E.03159
G1 X126.93 Y116.539 E.01671
G1 X127.836 Y115.634 E.03972
G3 X127.523 Y115.408 I.303 J-.746 E.01208
G1 X126.392 Y116.539 E.04965
G1 X125.853 Y116.539 E.01671
G1 X127.238 Y115.155 E.06075
G3 X126.983 Y114.871 I.447 J-.659 E.01195
G1 X125.315 Y116.539 E.07318
G1 X124.776 Y116.539 E.01671
G1 X126.763 Y114.553 E.08716
G3 X126.568 Y114.209 I.6 J-.567 E.01238
G1 X124.238 Y116.539 E.10224
G1 X123.7 Y116.539 E.01671
G1 X126.42 Y113.819 E.11937
G3 X126.307 Y113.393 I.807 J-.442 E.01379
G1 X123.161 Y116.539 E.13804
G1 X122.623 Y116.539 E.01671
G1 X126.249 Y112.913 E.15911
G1 X126.231 Y112.769 E.0045
G1 X126.283 Y112.34 E.01341
G1 X122.084 Y116.539 E.18425
G1 X121.546 Y116.539 E.01671
G1 X126.453 Y111.632 E.21534
G1 X126.62 Y111.193 E.01456
G1 X127.084 Y110.52 E.02537
G1 X127.696 Y109.978 E.02537
G1 X128.421 Y109.597 E.02537
G1 X128.509 Y109.576 E.00284
M73 P29 R17
G1 X129.086 Y108.999 E.02529
G1 X129.624 Y108.999 E.01671
G1 X129.222 Y109.402 E.01766
G1 X129.76 Y109.402 E.01671
G1 X130.163 Y108.999 E.01766
G1 X130.701 Y108.999 E.01671
G1 X130.246 Y109.454 E.01997
G1 X130.678 Y109.561 E.0138
G1 X131.24 Y108.999 E.02464
G1 X131.778 Y108.999 E.01671
G1 X131.058 Y109.719 E.03159
G1 X131.411 Y109.904 E.01237
G1 X132.316 Y108.999 E.03972
G1 X132.855 Y108.999 E.01671
G1 X131.723 Y110.131 E.04965
G1 X132.009 Y110.384 E.01184
G1 X133.393 Y108.999 E.06075
G1 X133.932 Y108.999 E.01671
G1 X132.264 Y110.667 E.07318
G1 X132.484 Y110.986 E.01201
G1 X134.47 Y108.999 E.08715
G1 X135.009 Y108.999 E.01671
G1 X132.679 Y111.329 E.10223
G1 X132.827 Y111.72 E.01295
G1 X135.547 Y108.999 E.11936
G1 X136.086 Y108.999 E.01671
G1 X132.94 Y112.145 E.13803
G1 X132.998 Y112.625 E.01501
G1 X136.624 Y108.999 E.1591
G1 X137.163 Y108.999 E.01671
G1 X132.964 Y113.198 E.18425
G1 X132.917 Y113.581 E.01196
G1 X132.794 Y113.907 E.01081
G1 X137.871 Y108.83 E.22278
; WIPE_START
G1 F24000
G1 X136.457 Y110.244 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.465 J-1.124 P1  F30000
G1 X120.838 Y116.709 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X128.547 Y108.999 E.33829
G1 X128.009 Y108.999 E.01671
G1 X120.469 Y116.539 E.33084
G1 X119.93 Y116.539 E.01671
G1 X127.47 Y108.999 E.33084
G1 X126.932 Y108.999 E.01671
G1 X119.392 Y116.539 E.33084
G1 X118.853 Y116.539 E.01671
G1 X126.393 Y108.999 E.33084
G1 X125.855 Y108.999 E.01671
G1 X118.315 Y116.539 E.33084
G1 X117.776 Y116.539 E.01671
G1 X125.316 Y108.999 E.33084
G1 X124.778 Y108.999 E.01671
G1 X117.238 Y116.539 E.33084
G1 X116.809 Y116.539 E.01332
G1 X116.809 Y116.43 E.00339
G1 X124.239 Y108.999 E.32604
G1 X123.701 Y108.999 E.01671
G1 X116.809 Y115.891 E.30242
G1 X116.809 Y115.353 E.01671
G1 X123.163 Y108.999 E.27879
G1 X122.624 Y108.999 E.01671
G1 X116.809 Y114.815 E.25516
G1 X116.809 Y114.276 E.01671
G1 X122.086 Y108.999 E.23154
G1 X121.547 Y108.999 E.01671
G1 X116.809 Y113.738 E.20791
G1 X116.809 Y113.199 E.01671
G1 X121.009 Y108.999 E.18428
G1 X120.47 Y108.999 E.01671
G1 X116.809 Y112.661 E.16066
G1 X116.809 Y112.122 E.01671
G1 X119.932 Y108.999 E.13703
G1 X119.393 Y108.999 E.01671
G1 X116.809 Y111.584 E.1134
G1 X116.809 Y111.045 E.01671
G1 X118.855 Y108.999 E.08978
G1 X118.316 Y108.999 E.01671
G1 X116.809 Y110.507 E.06615
G1 X116.809 Y109.968 E.01671
G1 X117.778 Y108.999 E.04252
G1 X117.239 Y108.999 E.01671
G1 X116.639 Y109.6 E.02634
; CHANGE_LAYER
; Z_HEIGHT: 0.466667
; LAYER_HEIGHT: 0.0666667
; WIPE_START
G1 F24000
G1 X117.239 Y108.999 E-.3226
G1 X117.778 Y108.999 E-.20462
G1 X117.345 Y109.432 E-.23278
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/135
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
G3 Z.8 I-1.206 J-.163 P1  F30000
G1 X115.615 Y122.246 Z.8
G1 Z.467
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.266667
G1 F9000
G1 X121.369 Y122.246 E.2268
G1 X121.369 Y122.602 E.01404
G1 X116.027 Y122.602 E.21055
G1 X115.711 Y122.918 E.01758
G1 X115.711 Y125.123 E.08693
G1 X115.615 Y125.123 E.00382
G1 X115.711 Y130.877 E.22683
G1 X115.615 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.679 Y128.974 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.867 I.113 J1.212 P1  F30000
G1 X128.115 Y127.813 Z.867
G1 Z.467
G1 E.8 F1800
G1 F9000
G3 X128.946 Y126.415 I1.947 J.211 E.06609
G1 X128.946 Y126.415 E0
G3 X131.908 Y128 I1.045 J1.606 E.1614
G1 X128.092 Y128 E.15037
G2 X131.885 Y128.187 I1.901 J-.008 E.22743
; WIPE_START
G1 F24000
G1 X131.689 Y128.886 E-.27595
G1 X131.428 Y129.265 E-.17474
G1 X131.084 Y129.57 E-.17474
G1 X130.77 Y129.734 E-.13456
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.867 I.839 J.881 P1  F30000
G1 X138.631 Y122.246 Z.867
G1 Z.467
G1 E.8 F1800
G1 F9000
G1 X144.385 Y122.246 E.2268
G1 X144.385 Y125.123 E.1134
G1 X144.289 Y125.123 E.00382
G1 X144.385 Y130.877 E.22683
G1 X144.289 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X144.385 Y130.877 E-.03681
G1 X144.353 Y128.974 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.867 I1.216 J-.04 P1  F30000
G1 X143.912 Y115.646 Z.867
G1 Z.467
G1 E.8 F1800
G1 F9000
G1 X144.009 Y115.646 E.00382
G1 X143.912 Y109.892 E.22683
G1 X144.009 Y109.892 E.00382
G1 X144.009 Y107.015 E.1134
G1 X138.255 Y107.015 E.2268
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.867 I-.684 J-1.007 P1  F30000
G1 X131.508 Y112.956 Z.867
G1 Z.467
G1 E.8 F1800
G1 F9000
G3 X127.716 Y112.769 I-1.891 J-.195 E.22743
G1 X131.531 Y112.769 E.15037
G2 X128.569 Y111.184 I-1.917 J.021 E.1614
G1 X128.569 Y111.184 E0
G2 X127.739 Y112.582 I1.117 J1.609 E.06609
; WIPE_START
G1 F24000
G1 X127.934 Y111.883 E-.27595
G1 X128.196 Y111.504 E-.17474
G1 X128.569 Y111.184 E-.18696
G1 X128.569 Y111.184 E0
G1 X128.854 Y111.034 E-.12235
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.867 I-.39 J-1.153 P1  F30000
G1 X115.238 Y115.646 Z.867
G1 Z.467
G1 E.8 F1800
G1 F9000
G1 X115.335 Y115.646 E.00382
G1 X115.238 Y109.892 E.22683
G1 X115.335 Y109.892 E.00382
G1 X115.335 Y107.687 E.08693
G1 X115.65 Y107.371 E.01758
G1 X120.992 Y107.371 E.21055
G1 X120.992 Y107.015 E.01404
G1 X115.238 Y107.015 E.2268
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.133333
; WIPE_START
G1 F24000
G1 X117.238 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/135
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
G3 Z.867 I-1.11 J.499 P1  F30000
G1 X127.316 Y129.454 Z.867
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X127.294 Y129.42 E.00133
G1 X127.032 Y128.731 E.02444
G1 X126.943 Y128 E.02444
G1 X127.032 Y127.269 E.02444
G1 X127.294 Y126.58 E.02444
G1 X127.712 Y125.973 E.02444
G1 X128.264 Y125.485 E.02444
G1 X128.916 Y125.142 E.02444
G1 X129.632 Y124.966 E.02444
G1 X130.368 Y124.966 E.02444
G1 X131.084 Y125.142 E.02444
G1 X131.736 Y125.485 E.02444
G1 X131.865 Y125.598 E.00569
G1 X132.288 Y125.973 E.01875
G1 X132.706 Y126.58 E.02444
G1 X132.968 Y127.269 E.02444
G1 X133.057 Y128 E.02444
G1 X132.968 Y128.731 E.02444
G1 X132.706 Y129.42 E.02444
G1 X132.288 Y130.027 E.02444
G1 X131.736 Y130.515 E.02444
G1 X131.084 Y130.858 E.02444
G1 X130.368 Y131.034 E.02444
G1 X129.632 Y131.034 E.02444
G1 X128.916 Y130.858 E.02444
G1 X128.264 Y130.515 E.02444
G1 X127.712 Y130.027 E.02444
G1 X127.351 Y129.503 E.02112
G1 X127.643 Y129.237 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X127.416 Y128.637 E.01972
G1 X127.338 Y128 E.01972
G1 X127.416 Y127.363 E.01972
G1 X127.643 Y126.763 E.01972
G1 X128.008 Y126.235 E.01972
G1 X128.488 Y125.81 E.01972
G1 X128.598 Y125.752 E.00381
G1 X129.056 Y125.511 E.01591
G1 X129.679 Y125.358 E.01972
G1 X130.321 Y125.358 E.01972
G1 X130.944 Y125.511 E.01972
G1 X131.512 Y125.81 E.01972
G1 X131.605 Y125.892 E.00381
G1 X131.992 Y126.235 E.01591
G1 X132.357 Y126.763 E.01972
G1 X132.584 Y127.363 E.01972
G1 X132.662 Y128 E.01972
G1 X132.584 Y128.637 E.01972
G1 X132.357 Y129.237 E.01972
G1 X131.992 Y129.765 E.01972
G1 X131.512 Y130.19 E.01972
G1 X130.944 Y130.489 E.01972
G1 X130.321 Y130.642 E.01972
G1 X129.679 Y130.642 E.01972
G1 X129.056 Y130.489 E.01972
G1 X128.488 Y130.19 E.01972
G1 X128.008 Y129.765 E.01972
G1 X127.677 Y129.286 E.01787
M204 S10000
; WIPE_START
G1 F24000
G1 X127.416 Y128.637 E-.26601
G1 X127.338 Y128 E-.24382
G1 X127.416 Y127.363 E-.24382
G1 X127.422 Y127.347 E-.00635
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.363 J1.162 P1  F30000
G1 X143.148 Y132.257 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.852 Y132.257 E.87228
G1 X116.852 Y123.743 E.28245
G1 X143.148 Y123.743 E.87228
G1 X143.148 Y132.197 E.28046
G1 X143.54 Y132.536 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.54 Y132.618 E.00252
G1 F3000
G1 X143.54 Y132.649 E.00096
G1 X116.46 Y132.649 E.83209
G1 X116.46 Y132.618 E.00096
G1 F12000
G1 X116.46 Y132.536 E.00252
G1 X116.46 Y123.464 E.27878
G1 X116.46 Y123.382 E.00252
G1 F3000
G1 X116.46 Y123.351 E.00096
G1 X143.54 Y123.351 E.83209
G1 X143.54 Y123.382 E.00096
G1 F12000
G1 X143.54 Y123.464 E.00252
G1 X143.54 Y132.476 E.27693
M204 S10000
; WIPE_START
G1 F24000
G1 X143.54 Y132.618 E-.05396
G1 X143.54 Y132.649 E-.01182
G1 X141.713 Y132.649 E-.69422
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.202 J.191 P1  F30000
G1 X142.984 Y124.671 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421129
G1 F15000
G1 X142.389 Y124.076 E.02593
G1 X141.854 Y124.076 E.01648
G1 X142.815 Y125.036 E.04185
G1 X142.815 Y125.571 E.01648
G1 X141.32 Y124.076 E.06516
G1 X140.785 Y124.076 E.01648
G1 X142.815 Y126.106 E.08847
G1 X142.815 Y126.641 E.01648
G1 X140.25 Y124.076 E.11179
G1 X139.715 Y124.076 E.01648
G1 X142.815 Y127.176 E.1351
G1 X142.815 Y127.71 E.01648
G1 X139.18 Y124.076 E.15841
G1 X138.645 Y124.076 E.01648
G1 X142.815 Y128.245 E.18172
G1 X142.815 Y128.78 E.01648
G1 X138.11 Y124.076 E.20503
G1 X137.576 Y124.076 E.01648
G1 X142.815 Y129.315 E.22835
G1 X142.815 Y129.85 E.01648
G1 X137.041 Y124.076 E.25166
G1 X136.506 Y124.076 E.01648
G1 X142.815 Y130.385 E.27497
G1 X142.815 Y130.92 E.01648
G1 X135.971 Y124.076 E.29828
G1 X135.436 Y124.076 E.01648
G1 X142.815 Y131.455 E.3216
G1 X142.815 Y131.924 E.01447
G1 X142.749 Y131.924 E.00201
G1 X134.901 Y124.076 E.34206
M73 P29 R16
G1 X134.366 Y124.076 E.01648
G1 X142.215 Y131.924 E.34206
G1 X141.68 Y131.924 E.01648
G1 X133.831 Y124.076 E.34206
G1 X133.297 Y124.076 E.01648
G1 X141.145 Y131.924 E.34206
G1 X140.61 Y131.924 E.01648
G1 X132.762 Y124.076 E.34206
G1 X132.227 Y124.076 E.01648
G1 X140.075 Y131.924 E.34206
G1 X139.54 Y131.924 E.01648
G1 X131.692 Y124.076 E.34206
G1 X131.157 Y124.076 E.01648
G1 X139.005 Y131.924 E.34206
G1 X138.47 Y131.924 E.01648
G1 X133.024 Y126.478 E.23737
G1 X133.294 Y127.188 E.02341
G1 X133.307 Y127.295 E.00332
G1 X137.936 Y131.924 E.20175
G1 X137.401 Y131.924 E.01648
G1 X133.381 Y127.904 E.17522
G1 X133.392 Y128 E.00298
G1 X133.343 Y128.402 E.01247
G1 X136.866 Y131.924 E.15352
G1 X136.331 Y131.924 E.01648
G1 X133.273 Y128.866 E.13328
G1 X133.126 Y129.254 E.01278
G1 X135.796 Y131.924 E.11638
G1 X135.261 Y131.924 E.01648
G1 X132.967 Y129.63 E.1
G1 X132.748 Y129.946 E.01185
G1 X134.726 Y131.924 E.08621
G1 X134.191 Y131.924 E.01648
G1 X132.527 Y130.26 E.07253
G1 X132.244 Y130.511 E.01168
G1 X133.657 Y131.924 E.06158
G1 X133.122 Y131.924 E.01648
G1 X131.96 Y130.762 E.05063
G1 X131.617 Y130.954 E.01211
G1 X132.587 Y131.924 E.04227
G1 X132.052 Y131.924 E.01648
G1 X131.266 Y131.138 E.03424
G1 X131.203 Y131.172 E.00221
G1 X130.851 Y131.258 E.01116
G1 X131.517 Y131.924 E.02901
G1 X130.982 Y131.924 E.01648
G1 X130.422 Y131.364 E.0244
G1 X129.891 Y131.367 E.01638
G1 X130.447 Y131.924 E.02426
G1 X129.913 Y131.924 E.01648
G1 X129.279 Y131.291 E.02761
G1 X128.797 Y131.172 E.0153
G1 X128.436 Y130.982 E.01258
G1 X129.378 Y131.924 E.04106
G1 X128.843 Y131.924 E.01648
G1 X120.995 Y124.076 E.34206
G1 X121.529 Y124.076 E.01648
G1 X126.976 Y129.522 E.23738
G1 X126.706 Y128.812 E.02341
G1 X126.693 Y128.705 E.00332
G1 X122.064 Y124.076 E.20176
G1 X122.599 Y124.076 E.01648
G1 X126.619 Y128.096 E.17522
G1 X126.608 Y128 E.00298
G1 X126.657 Y127.598 E.01247
G1 X123.134 Y124.076 E.15353
G1 X123.669 Y124.076 E.01648
G1 X126.727 Y127.134 E.13328
G1 X126.874 Y126.746 E.01278
G1 X124.204 Y124.076 E.11638
G1 X124.739 Y124.076 E.01648
G1 X127.033 Y126.37 E.1
G1 X127.252 Y126.054 E.01185
G1 X125.274 Y124.076 E.08621
G1 X125.808 Y124.076 E.01648
G1 X127.473 Y125.74 E.07253
G1 X127.756 Y125.489 E.01168
G1 X126.343 Y124.076 E.06158
G1 X126.878 Y124.076 E.01648
G1 X128.04 Y125.238 E.05063
G1 X128.383 Y125.046 E.01211
G1 X127.413 Y124.076 E.04227
G1 X127.948 Y124.076 E.01648
G1 X128.734 Y124.862 E.03424
G1 X128.797 Y124.828 E.00221
G1 X129.148 Y124.742 E.01115
G1 X128.483 Y124.076 E.02901
G1 X129.018 Y124.076 E.01648
G1 X129.578 Y124.636 E.0244
G1 X130.109 Y124.633 E.01638
G1 X129.553 Y124.076 E.02426
G1 X130.087 Y124.076 E.01648
G1 X130.721 Y124.709 E.02761
G1 X131.203 Y124.828 E.0153
G1 X131.564 Y125.018 E.01257
G1 X130.453 Y123.906 E.04845
; WIPE_START
G1 F24000
G1 X131.564 Y125.018 E-.59738
G1 X131.203 Y124.828 E-.15505
G1 X131.184 Y124.823 E-.00757
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.141 J-.424 P1  F30000
G1 X128.478 Y132.094 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X120.46 Y124.076 E.34946
G1 X119.925 Y124.076 E.01648
G1 X127.773 Y131.924 E.34206
G1 X127.238 Y131.924 E.01648
G1 X119.39 Y124.076 E.34206
G1 X118.855 Y124.076 E.01648
G1 X126.703 Y131.924 E.34206
G1 X126.168 Y131.924 E.01648
G1 X118.32 Y124.076 E.34206
G1 X117.785 Y124.076 E.01648
G1 X125.634 Y131.924 E.34206
G1 X125.099 Y131.924 E.01648
G1 X117.251 Y124.076 E.34206
G1 X117.185 Y124.076 E.00201
G1 X117.185 Y124.546 E.01447
G1 X124.564 Y131.924 E.32159
G1 X124.029 Y131.924 E.01648
G1 X117.185 Y125.08 E.29828
G1 X117.185 Y125.615 E.01648
G1 X123.494 Y131.924 E.27497
G1 X122.959 Y131.924 E.01648
G1 X117.185 Y126.15 E.25166
G1 X117.185 Y126.685 E.01648
G1 X122.424 Y131.924 E.22834
G1 X121.89 Y131.924 E.01648
G1 X117.185 Y127.22 E.20503
G1 X117.185 Y127.755 E.01648
G1 X121.355 Y131.924 E.18172
G1 X120.82 Y131.924 E.01648
G1 X117.185 Y128.29 E.15841
G1 X117.185 Y128.825 E.01648
G1 X120.285 Y131.924 E.13509
G1 X119.75 Y131.924 E.01648
G1 X117.185 Y129.359 E.11178
G1 X117.185 Y129.894 E.01648
G1 X119.215 Y131.924 E.08847
G1 X118.68 Y131.924 E.01648
G1 X117.185 Y130.429 E.06516
G1 X117.185 Y130.964 E.01648
G1 X118.145 Y131.924 E.04185
G1 X117.611 Y131.924 E.01648
G1 X117.016 Y131.329 E.02593
; WIPE_START
G1 F24000
G1 X117.611 Y131.924 E-.3197
G1 X118.145 Y131.924 E-.20325
G1 X117.704 Y131.483 E-.23705
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.073 J.574 P1  F30000
G1 X126.94 Y114.223 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X126.917 Y114.19 E.00133
G1 X126.656 Y113.501 E.02444
G1 X126.567 Y112.769 E.02444
G1 X126.656 Y112.038 E.02444
G1 X126.917 Y111.349 E.02444
G1 X127.336 Y110.742 E.02444
G1 X127.887 Y110.254 E.02444
G1 X128.54 Y109.911 E.02444
G1 X129.255 Y109.735 E.02444
G1 X129.992 Y109.735 E.02444
G1 X130.707 Y109.911 E.02444
G1 X131.36 Y110.254 E.02444
G1 X131.488 Y110.368 E.00569
G1 X131.911 Y110.742 E.01875
G1 X132.33 Y111.349 E.02444
G1 X132.591 Y112.038 E.02444
G1 X132.68 Y112.769 E.02444
G1 X132.591 Y113.501 E.02444
G1 X132.33 Y114.19 E.02444
G1 X131.911 Y114.796 E.02444
G1 X131.36 Y115.285 E.02444
G1 X130.707 Y115.627 E.02444
G1 X129.992 Y115.803 E.02444
G1 X129.255 Y115.803 E.02444
G1 X128.54 Y115.627 E.02444
G1 X127.887 Y115.285 E.02444
G1 X127.336 Y114.796 E.02444
G1 X126.974 Y114.272 E.02112
G1 X127.267 Y114.006 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X127.039 Y113.406 E.01972
G1 X126.962 Y112.769 E.01972
G1 X127.039 Y112.132 E.01972
G1 X127.267 Y111.532 E.01972
G1 X127.631 Y111.004 E.01972
G1 X128.112 Y110.579 E.01972
G1 X128.221 Y110.521 E.00381
G1 X128.68 Y110.281 E.01591
G1 X129.303 Y110.127 E.01972
G1 X129.944 Y110.127 E.01972
G1 X130.567 Y110.281 E.01972
G1 X131.135 Y110.579 E.01972
G1 X131.228 Y110.661 E.00381
G1 X131.616 Y111.004 E.01591
G1 X131.98 Y111.532 E.01972
G1 X132.208 Y112.132 E.01972
G1 X132.285 Y112.769 E.01972
G1 X132.208 Y113.406 E.01972
G1 X131.98 Y114.006 E.01972
G1 X131.616 Y114.534 E.01972
G1 X131.135 Y114.96 E.01972
G1 X130.567 Y115.258 E.01972
G1 X129.944 Y115.411 E.01972
G1 X129.303 Y115.411 E.01972
G1 X128.68 Y115.258 E.01972
G1 X128.112 Y114.96 E.01972
G1 X127.631 Y114.534 E.01972
G1 X127.301 Y114.056 E.01787
M204 S10000
; WIPE_START
G1 F24000
G1 X127.039 Y113.406 E-.26601
G1 X126.962 Y112.769 E-.24382
G1 X127.039 Y112.132 E-.24382
G1 X127.045 Y112.117 E-.00635
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.363 J1.162 P1  F30000
G1 X142.771 Y117.027 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.476 Y117.027 E.87228
G1 X116.476 Y108.512 E.28245
G1 X142.771 Y108.512 E.87228
G1 X142.771 Y116.967 E.28046
G1 X143.163 Y117.306 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.163 Y117.388 E.00252
G1 F3000
G1 X143.163 Y117.419 E.00096
G1 X116.083 Y117.419 E.83209
G1 X116.083 Y117.388 E.00096
G1 F12000
G1 X116.083 Y117.306 E.00252
G1 X116.083 Y108.233 E.27878
G1 X116.083 Y108.151 E.00252
G1 F3000
G1 X116.083 Y108.12 E.00096
G1 X143.163 Y108.12 E.83209
G1 X143.163 Y108.151 E.00096
G1 F12000
G1 X143.163 Y108.233 E.00252
G1 X143.163 Y117.246 E.27693
M204 S10000
; WIPE_START
G1 F24000
G1 X143.163 Y117.388 E-.05396
G1 X143.163 Y117.419 E-.01182
G1 X141.337 Y117.419 E-.69422
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.202 J.191 P1  F30000
G1 X142.608 Y109.44 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421129
G1 F15000
G1 X142.013 Y108.845 E.02593
G1 X141.478 Y108.845 E.01648
G1 X142.438 Y109.805 E.04185
G1 X142.438 Y110.34 E.01648
G1 X140.943 Y108.845 E.06516
M73 P30 R16
G1 X140.408 Y108.845 E.01648
G1 X142.438 Y110.875 E.08847
G1 X142.438 Y111.41 E.01648
G1 X139.873 Y108.845 E.11179
G1 X139.338 Y108.845 E.01648
G1 X142.438 Y111.945 E.1351
G1 X142.438 Y112.48 E.01648
G1 X138.804 Y108.845 E.15841
G1 X138.269 Y108.845 E.01648
G1 X142.438 Y113.015 E.18172
G1 X142.438 Y113.549 E.01648
G1 X137.734 Y108.845 E.20503
G1 X137.199 Y108.845 E.01648
G1 X142.438 Y114.084 E.22835
G1 X142.438 Y114.619 E.01648
G1 X136.664 Y108.845 E.25166
G1 X136.129 Y108.845 E.01648
G1 X142.438 Y115.154 E.27497
G1 X142.438 Y115.689 E.01648
G1 X135.594 Y108.845 E.29828
G1 X135.06 Y108.845 E.01648
G1 X142.438 Y116.224 E.3216
G1 X142.438 Y116.693 E.01447
G1 X142.373 Y116.693 E.00201
G1 X134.525 Y108.845 E.34206
G1 X133.99 Y108.845 E.01648
G1 X141.838 Y116.693 E.34206
G1 X141.303 Y116.693 E.01648
G1 X133.455 Y108.845 E.34206
G1 X132.92 Y108.845 E.01648
G1 X140.768 Y116.693 E.34206
G1 X140.233 Y116.693 E.01648
G1 X132.385 Y108.845 E.34206
G1 X131.85 Y108.845 E.01648
G1 X139.698 Y116.693 E.34206
G1 X139.164 Y116.693 E.01648
G1 X131.315 Y108.845 E.34206
G1 X130.781 Y108.845 E.01648
G1 X138.629 Y116.693 E.34206
G1 X138.094 Y116.693 E.01648
G1 X132.648 Y111.247 E.23737
G1 X132.917 Y111.957 E.02341
G1 X132.93 Y112.064 E.00332
G1 X137.559 Y116.693 E.20175
G1 X137.024 Y116.693 E.01648
G1 X133.004 Y112.673 E.17522
G1 X133.016 Y112.769 E.00298
G1 X132.967 Y113.171 E.01247
G1 X136.489 Y116.693 E.15352
G1 X135.954 Y116.693 E.01648
G1 X132.896 Y113.635 E.13328
G1 X132.749 Y114.023 E.01278
G1 X135.42 Y116.693 E.11638
G1 X134.885 Y116.693 E.01648
G1 X132.59 Y114.399 E.1
G1 X132.372 Y114.715 E.01185
G1 X134.35 Y116.693 E.08621
G1 X133.815 Y116.693 E.01648
G1 X132.151 Y115.029 E.07253
G1 X131.867 Y115.28 E.01168
G1 X133.28 Y116.693 E.06158
G1 X132.745 Y116.693 E.01648
G1 X131.584 Y115.532 E.05063
G1 X131.241 Y115.724 E.01211
G1 X132.21 Y116.693 E.04227
G1 X131.675 Y116.693 E.01648
G1 X130.89 Y115.908 E.03424
G1 X130.826 Y115.941 E.00221
G1 X130.475 Y116.028 E.01116
G1 X131.141 Y116.693 E.02901
G1 X130.606 Y116.693 E.01648
G1 X130.046 Y116.133 E.0244
G1 X129.514 Y116.137 E.01638
G1 X130.071 Y116.693 E.02426
G1 X129.536 Y116.693 E.01648
G1 X128.902 Y116.06 E.02761
G1 X128.421 Y115.941 E.0153
G1 X128.059 Y115.751 E.01258
G1 X129.001 Y116.693 E.04106
G1 X128.466 Y116.693 E.01648
G1 X120.618 Y108.845 E.34206
G1 X121.153 Y108.845 E.01648
G1 X126.599 Y114.291 E.23738
G1 X126.33 Y113.581 E.02341
G1 X126.317 Y113.474 E.00332
G1 X121.688 Y108.845 E.20176
G1 X122.223 Y108.845 E.01648
G1 X126.243 Y112.865 E.17522
G1 X126.231 Y112.769 E.00298
G1 X126.28 Y112.368 E.01247
G1 X122.758 Y108.845 E.15353
G1 X123.292 Y108.845 E.01648
G1 X126.35 Y111.903 E.13328
G1 X126.497 Y111.515 E.01278
G1 X123.827 Y108.845 E.11638
G1 X124.362 Y108.845 E.01648
G1 X126.657 Y111.14 E.1
G1 X126.875 Y110.823 E.01185
G1 X124.897 Y108.845 E.08621
G1 X125.432 Y108.845 E.01648
G1 X127.096 Y110.509 E.07253
G1 X127.38 Y110.258 E.01168
G1 X125.967 Y108.845 E.06158
G1 X126.502 Y108.845 E.01648
G1 X127.663 Y110.007 E.05063
G1 X128.006 Y109.815 E.01211
G1 X127.036 Y108.845 E.04227
G1 X127.571 Y108.845 E.01648
G1 X128.357 Y109.631 E.03424
G1 X128.421 Y109.597 E.00221
G1 X128.772 Y109.511 E.01115
G1 X128.106 Y108.845 E.02901
G1 X128.641 Y108.845 E.01648
G1 X129.201 Y109.405 E.0244
G1 X129.733 Y109.402 E.01638
G1 X129.176 Y108.845 E.02426
G1 X129.711 Y108.845 E.01648
G1 X130.344 Y109.479 E.02761
G1 X130.826 Y109.597 E.0153
G1 X131.188 Y109.787 E.01257
G1 X130.076 Y108.675 E.04845
; WIPE_START
G1 F24000
G1 X131.188 Y109.787 E-.59738
G1 X130.826 Y109.597 E-.15505
G1 X130.807 Y109.593 E-.00757
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.141 J-.424 P1  F30000
G1 X128.101 Y116.863 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X120.083 Y108.845 E.34946
G1 X119.548 Y108.845 E.01648
G1 X127.396 Y116.693 E.34206
G1 X126.862 Y116.693 E.01648
G1 X119.013 Y108.845 E.34206
G1 X118.479 Y108.845 E.01648
G1 X126.327 Y116.693 E.34206
G1 X125.792 Y116.693 E.01648
G1 X117.944 Y108.845 E.34206
G1 X117.409 Y108.845 E.01648
G1 X125.257 Y116.693 E.34206
G1 X124.722 Y116.693 E.01648
G1 X116.874 Y108.845 E.34206
G1 X116.809 Y108.845 E.00201
G1 X116.809 Y109.315 E.01447
G1 X124.187 Y116.693 E.32159
G1 X123.652 Y116.693 E.01648
G1 X116.809 Y109.85 E.29828
G1 X116.809 Y110.385 E.01648
G1 X123.118 Y116.693 E.27497
G1 X122.583 Y116.693 E.01648
G1 X116.809 Y110.919 E.25166
G1 X116.809 Y111.454 E.01648
G1 X122.048 Y116.693 E.22834
G1 X121.513 Y116.693 E.01648
G1 X116.809 Y111.989 E.20503
G1 X116.809 Y112.524 E.01648
G1 X120.978 Y116.693 E.18172
G1 X120.443 Y116.693 E.01648
G1 X116.809 Y113.059 E.15841
G1 X116.809 Y113.594 E.01648
G1 X119.908 Y116.693 E.13509
G1 X119.373 Y116.693 E.01648
G1 X116.809 Y114.129 E.11178
G1 X116.809 Y114.664 E.01648
G1 X118.839 Y116.693 E.08847
G1 X118.304 Y116.693 E.01648
G1 X116.809 Y115.198 E.06516
G1 X116.809 Y115.733 E.01648
G1 X117.769 Y116.693 E.04185
G1 X117.234 Y116.693 E.01648
G1 X116.639 Y116.098 E.02593
; CHANGE_LAYER
; Z_HEIGHT: 0.733333
; LAYER_HEIGHT: 0.133333
; WIPE_START
G1 F24000
G1 X117.234 Y116.693 E-.3197
G1 X117.769 Y116.693 E-.20325
G1 X117.328 Y116.252 E-.23705
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/135
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
G3 Z1 I-1.059 J.599 P1  F30000
G1 X120.867 Y122.514 Z1
G1 Z.733
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.266667
G1 F5286
G1 X121.369 Y122.514 E.01979
G1 X121.369 Y122.246 E.01056
G1 X115.615 Y122.246 E.2268
G1 X115.711 Y128 E.22683
G1 X115.615 Y128 E.00382
G1 X115.615 Y130.877 E.1134
G1 X115.711 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X115.615 Y130.877 E-.03681
G1 X115.615 Y128.974 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.133 I.113 J1.212 P1  F30000
G1 X128.115 Y127.813 Z1.133
G1 Z.733
G1 E.8 F1800
G1 F5286
G3 X131.908 Y128 I1.891 J.202 E.22689
G1 X128.092 Y128 E.15037
G2 X131.885 Y128.187 I1.901 J-.009 E.22729
; WIPE_START
G1 F24000
G1 X131.689 Y128.886 E-.27595
G1 X131.428 Y129.265 E-.17474
G1 X131.084 Y129.57 E-.17474
G1 X130.77 Y129.734 E-.13457
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.133 I.839 J.881 P1  F30000
G1 X138.631 Y122.246 Z1.133
G1 Z.733
G1 E.8 F1800
G1 F5286
G1 X144.385 Y122.246 E.2268
G1 X144.385 Y125.123 E.1134
G1 X144.289 Y125.123 E.00382
G1 X144.385 Y130.877 E.22683
G1 X144.289 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X144.385 Y130.877 E-.03681
G1 X144.353 Y128.974 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.133 I1.216 J-.04 P1  F30000
G1 X143.912 Y115.646 Z1.133
G1 Z.733
G1 E.8 F1800
G1 F5286
G1 X144.009 Y115.646 E.00382
G1 X143.912 Y109.892 E.22683
G1 X144.009 Y109.892 E.00382
G1 X144.009 Y107.015 E.1134
G1 X138.255 Y107.015 E.2268
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.133 I-.684 J-1.007 P1  F30000
G1 X131.508 Y112.956 Z1.133
G1 Z.733
G1 E.8 F1800
G1 F5286
G3 X127.716 Y112.769 I-1.891 J-.197 E.22729
G1 X131.531 Y112.769 E.15037
G2 X127.739 Y112.582 I-1.902 J.015 E.22689
; WIPE_START
G1 F24000
G1 X127.934 Y111.883 E-.27595
G1 X128.196 Y111.504 E-.17474
G1 X128.54 Y111.199 E-.17474
G1 X128.853 Y111.035 E-.13457
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.133 I.498 J-1.11 P1  F30000
G1 X120.49 Y107.283 Z1.133
G1 Z.733
G1 E.8 F1800
G1 F5286
G1 X120.992 Y107.283 E.01979
G1 X120.992 Y107.015 E.01056
G1 X115.238 Y107.015 E.2268
G1 X115.335 Y112.769 E.22683
G1 X115.238 Y112.769 E.00382
G1 X115.238 Y115.646 E.1134
G1 X115.335 Y115.646 E.00382
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.0666667
; WIPE_START
G1 F24000
G1 X115.238 Y115.646 E-.03681
G1 X115.238 Y113.743 E-.72319
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/135
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
G3 Z1.133 I-.965 J.742 P1  F30000
G1 X127.316 Y129.453 Z1.133
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F5286
G1 X127.294 Y129.42 E.00133
G1 X127.032 Y128.731 E.02444
G1 X126.943 Y128 E.02444
G1 X127.032 Y127.269 E.02444
G1 X127.294 Y126.58 E.02444
G1 X127.712 Y125.973 E.02444
G1 X128.264 Y125.485 E.02444
G1 X128.45 Y125.387 E.007
G1 X128.916 Y125.142 E.01745
G1 X129.632 Y124.966 E.02444
G1 X130.368 Y124.966 E.02444
G1 X131.084 Y125.142 E.02444
G1 X131.736 Y125.485 E.02444
G1 X132.288 Y125.973 E.02444
G1 X132.706 Y126.58 E.02444
G1 X132.968 Y127.269 E.02444
G1 X133.057 Y128 E.02444
G1 X132.968 Y128.731 E.02444
G1 X132.706 Y129.42 E.02444
G1 X132.288 Y130.027 E.02444
G1 X131.736 Y130.515 E.02444
G1 X131.084 Y130.858 E.02444
G1 X130.368 Y131.034 E.02444
G1 X129.632 Y131.034 E.02444
G1 X128.916 Y130.858 E.02444
G1 X128.264 Y130.515 E.02444
G1 X127.712 Y130.027 E.02444
G1 X127.35 Y129.503 E.02112
G1 X127.643 Y129.237 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5286
G1 X127.416 Y128.637 E.01972
G1 X127.338 Y128 E.01972
G1 X127.416 Y127.363 E.01972
G1 X127.643 Y126.763 E.01972
G1 X128.008 Y126.235 E.01972
G1 X128.488 Y125.81 E.01972
G1 X128.633 Y125.734 E.00502
G1 X129.056 Y125.511 E.0147
G1 X129.679 Y125.358 E.01972
G1 X130.321 Y125.358 E.01972
G1 X130.944 Y125.511 E.01972
G1 X131.512 Y125.81 E.01972
G1 X131.992 Y126.235 E.01972
G1 X132.357 Y126.763 E.01972
G1 X132.584 Y127.363 E.01972
G1 X132.662 Y128 E.01972
G1 X132.584 Y128.637 E.01972
G1 X132.357 Y129.237 E.01972
G1 X131.992 Y129.765 E.01972
G1 X131.512 Y130.19 E.01972
G1 X130.944 Y130.489 E.01972
G1 X130.321 Y130.642 E.01972
G1 X129.679 Y130.642 E.01972
G1 X129.056 Y130.489 E.01972
G1 X128.488 Y130.19 E.01972
G1 X128.008 Y129.765 E.01972
G1 X127.677 Y129.286 E.01787
M204 S10000
; WIPE_START
G1 F24000
G1 X127.416 Y128.637 E-.26601
G1 X127.338 Y128 E-.24382
G1 X127.416 Y127.363 E-.24382
G1 X127.422 Y127.347 E-.00635
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.369 J1.16 P1  F30000
G1 X143.148 Y132.346 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5286
G1 X116.852 Y132.346 E.87228
G1 X116.852 Y123.654 E.28831
G1 X143.148 Y123.654 E.87228
G1 X143.148 Y132.286 E.28632
G1 X143.54 Y132.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5286
G1 X143.54 Y132.738 E.00146
G1 X116.46 Y132.738 E.83209
G1 X116.46 Y132.69 E.00146
G1 X116.46 Y123.31 E.28825
G1 X116.46 Y123.262 E.00146
G1 X143.54 Y123.262 E.83209
G1 X143.54 Y123.31 E.00146
G1 X143.54 Y132.63 E.2864
M204 S10000
; WIPE_START
G1 F24000
G1 X143.54 Y132.738 E-.04081
G1 X141.647 Y132.738 E-.71919
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.492 J-1.113 P1  F30000
G1 X133.23 Y129.022 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5286
G3 X132.396 Y130.396 I-3.43 J-1.141 E.05378
G1 X133.997 Y131.997 E.07512
G1 X133.678 Y131.997 E.01058
G1 X141.673 Y124.003 E.37506
G1 X141.354 Y124.003 E.01058
G1 X142.8 Y125.448 E.0678
G1 X142.8 Y130.552 E.16933
G1 X141.354 Y131.997 E.0678
G1 X141.673 Y131.997 E.01058
G1 X133.678 Y124.003 E.37506
G1 X133.997 Y124.003 E.01058
G1 X132.396 Y125.604 E.07512
G2 X127.604 Y125.604 I-2.396 J2.332 E.17723
G1 X126.003 Y124.003 E.07512
G1 X126.322 Y124.003 E.01058
G1 X118.327 Y131.997 E.37506
G1 X118.646 Y131.997 E.01058
G1 X117.2 Y130.552 E.0678
G1 X117.2 Y125.448 E.16933
G1 X118.646 Y124.003 E.0678
G1 X118.327 Y124.003 E.01058
G1 X126.322 Y131.997 E.37506
G1 X126.003 Y131.997 E.01058
G1 X127.604 Y130.396 E.07512
G3 X126.77 Y129.022 I2.596 J-2.516 E.05378
; WIPE_START
G1 F24000
G1 X126.983 Y129.583 E-.2283
G1 X127.604 Y130.396 E-.38863
G1 X127.338 Y130.662 E-.14306
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.217 J-.029 P1  F30000
G1 X126.94 Y114.223 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5286
G1 X126.917 Y114.19 E.00133
G1 X126.656 Y113.501 E.02444
G1 X126.567 Y112.769 E.02444
G1 X126.656 Y112.038 E.02444
G1 X126.917 Y111.349 E.02444
G1 X127.336 Y110.742 E.02444
G1 X127.887 Y110.254 E.02444
G1 X128.074 Y110.156 E.007
G1 X128.54 Y109.911 E.01745
G1 X129.255 Y109.735 E.02444
G1 X129.992 Y109.735 E.02444
G1 X130.707 Y109.911 E.02444
G1 X131.36 Y110.254 E.02444
G1 X131.911 Y110.742 E.02444
G1 X132.33 Y111.349 E.02444
G1 X132.591 Y112.038 E.02444
G1 X132.68 Y112.769 E.02444
G1 X132.591 Y113.501 E.02444
G1 X132.33 Y114.19 E.02444
G1 X131.911 Y114.796 E.02444
G1 X131.36 Y115.285 E.02444
G1 X130.707 Y115.627 E.02444
G1 X129.992 Y115.803 E.02444
G1 X129.255 Y115.803 E.02444
G1 X128.54 Y115.627 E.02444
G1 X127.887 Y115.285 E.02444
G1 X127.336 Y114.796 E.02444
G1 X126.974 Y114.272 E.02112
G1 X127.267 Y114.006 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5286
G1 X127.039 Y113.406 E.01972
G1 X126.962 Y112.769 E.01972
G1 X127.039 Y112.132 E.01972
G1 X127.267 Y111.532 E.01972
G1 X127.631 Y111.004 E.01972
G1 X128.112 Y110.579 E.01972
G1 X128.256 Y110.503 E.00502
G1 X128.68 Y110.281 E.0147
G1 X129.303 Y110.127 E.01972
G1 X129.944 Y110.127 E.01972
G1 X130.567 Y110.281 E.01972
G1 X131.135 Y110.579 E.01972
G1 X131.616 Y111.004 E.01972
G1 X131.98 Y111.532 E.01972
G1 X132.208 Y112.132 E.01972
G1 X132.285 Y112.769 E.01972
G1 X132.208 Y113.406 E.01972
G1 X131.98 Y114.006 E.01972
G1 X131.616 Y114.534 E.01972
G1 X131.135 Y114.96 E.01972
G1 X130.567 Y115.258 E.01972
G1 X129.944 Y115.411 E.01972
G1 X129.303 Y115.411 E.01972
G1 X128.68 Y115.258 E.01972
G1 X128.112 Y114.96 E.01972
G1 X127.631 Y114.534 E.01972
G1 X127.301 Y114.056 E.01787
M204 S10000
; WIPE_START
G1 F24000
G1 X127.039 Y113.406 E-.26601
G1 X126.962 Y112.769 E-.24382
G1 X127.039 Y112.132 E-.24382
G1 X127.045 Y112.117 E-.00635
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.369 J1.16 P1  F30000
G1 X142.771 Y117.115 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5286
G1 X116.476 Y117.115 E.87228
G1 X116.476 Y108.424 E.28831
G1 X142.771 Y108.424 E.87228
G1 X142.771 Y117.055 E.28632
G1 X143.163 Y117.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5286
G1 X143.163 Y117.507 E.00146
G1 X116.083 Y117.507 E.83209
G1 X116.083 Y117.46 E.00146
G1 X116.083 Y108.079 E.28825
G1 X116.083 Y108.031 E.00146
G1 X143.163 Y108.031 E.83209
G1 X143.163 Y108.079 E.00146
G1 X143.163 Y117.4 E.2864
M204 S10000
; WIPE_START
G1 F24000
G1 X143.163 Y117.507 E-.04081
G1 X141.271 Y117.507 E-.71919
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.492 J-1.113 P1  F30000
G1 X132.854 Y113.791 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5286
G3 X132.02 Y115.165 I-3.43 J-1.141 E.05378
G1 X133.621 Y116.767 E.07512
G1 X133.302 Y116.767 E.01058
G1 X141.297 Y108.772 E.37506
G1 X140.978 Y108.772 E.01058
G1 X142.423 Y110.217 E.0678
G1 X142.423 Y115.322 E.16933
G1 X140.978 Y116.767 E.0678
G1 X141.297 Y116.767 E.01058
G1 X133.302 Y108.772 E.37506
G1 X133.621 Y108.772 E.01058
G1 X132.02 Y110.373 E.07512
G2 X127.227 Y110.373 I-2.396 J2.332 E.17723
G1 X125.626 Y108.772 E.07512
G1 X125.945 Y108.772 E.01058
G1 X117.95 Y116.767 E.37506
G1 X118.269 Y116.767 E.01058
G1 X116.824 Y115.322 E.0678
M73 P31 R16
G1 X116.824 Y110.217 E.16933
G1 X118.269 Y108.772 E.0678
G1 X117.95 Y108.772 E.01058
G1 X125.945 Y116.767 E.37506
G1 X125.626 Y116.767 E.01058
G1 X127.227 Y115.165 E.07512
G3 X126.393 Y113.791 I2.596 J-2.516 E.05378
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.606 Y114.353 E-.2283
G1 X127.227 Y115.165 E-.38863
G1 X126.961 Y115.432 E-.14306
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/135
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
G3 Z1.2 I-.924 J-.792 P1  F30000
G1 X120.939 Y122.461 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.266667
G1 F5332
G1 X121.369 Y122.461 E.01695
G1 X121.369 Y122.246 E.0085
G1 X115.615 Y122.246 E.2268
G1 X115.711 Y128 E.22683
G1 X115.615 Y128 E.00382
G1 X115.615 Y130.877 E.1134
G1 X115.711 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X115.615 Y130.877 E-.03681
G1 X115.615 Y128.974 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.113 J1.212 P1  F30000
G1 X128.115 Y127.813 Z1.4
G1 Z1
G1 E.8 F1800
G1 F5332
G3 X131.908 Y128 I1.892 J.186 E.22804
G1 X128.092 Y128 E.15037
G2 X131.885 Y128.187 I1.903 J-.036 E.2254
; WIPE_START
G1 F24000
G1 X131.689 Y128.886 E-.27595
G1 X131.428 Y129.265 E-.17474
G1 X131.084 Y129.57 E-.17474
G1 X130.77 Y129.734 E-.13457
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.839 J.881 P1  F30000
G1 X138.631 Y122.246 Z1.4
G1 Z1
G1 E.8 F1800
G1 F5332
G1 X144.385 Y122.246 E.2268
G1 X144.385 Y125.123 E.1134
G1 X144.289 Y125.123 E.00382
G1 X144.385 Y130.877 E.22683
G1 X144.289 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X144.385 Y130.877 E-.03681
G1 X144.353 Y128.974 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.034 J-1.216 P1  F30000
G1 X127.316 Y129.453 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F5332
G1 X127.294 Y129.42 E.00133
G1 X127.032 Y128.731 E.02444
G1 X126.943 Y128 E.02444
G1 X127.032 Y127.269 E.02444
G1 X127.294 Y126.58 E.02444
G1 X127.712 Y125.973 E.02444
G1 X128.264 Y125.485 E.02444
G1 X128.916 Y125.142 E.02444
G1 X129.632 Y124.966 E.02444
G1 X130.368 Y124.966 E.02444
G1 X131.084 Y125.142 E.02444
G1 X131.736 Y125.485 E.02444
G1 X132.288 Y125.973 E.02444
G1 X132.706 Y126.58 E.02444
G1 X132.968 Y127.269 E.02444
G1 X133.057 Y128 E.02444
G1 X132.968 Y128.731 E.02444
G1 X132.706 Y129.42 E.02444
G1 X132.288 Y130.027 E.02444
G1 X131.736 Y130.515 E.02444
G1 X131.084 Y130.858 E.02444
G1 X130.368 Y131.034 E.02444
G1 X129.632 Y131.034 E.02444
G1 X128.916 Y130.858 E.02444
G1 X128.264 Y130.515 E.02444
G1 X127.712 Y130.027 E.02444
G1 X127.35 Y129.503 E.02112
G1 X127.643 Y129.237 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5332
G1 X127.416 Y128.637 E.01972
G1 X127.338 Y128 E.01972
G1 X127.416 Y127.363 E.01972
G1 X127.643 Y126.763 E.01972
G1 X128.008 Y126.235 E.01972
G1 X128.488 Y125.81 E.01972
G1 X129.056 Y125.511 E.01972
G1 X129.679 Y125.358 E.01972
G1 X130.321 Y125.358 E.01972
G1 X130.944 Y125.511 E.01972
G1 X131.512 Y125.81 E.01972
G1 X131.992 Y126.235 E.01972
G1 X132.357 Y126.763 E.01972
G1 X132.584 Y127.363 E.01972
G1 X132.662 Y128 E.01972
G1 X132.584 Y128.637 E.01972
G1 X132.357 Y129.237 E.01972
G1 X131.992 Y129.765 E.01972
G1 X131.512 Y130.19 E.01972
G1 X130.944 Y130.489 E.01972
G1 X130.321 Y130.642 E.01972
G1 X129.679 Y130.642 E.01972
G1 X129.056 Y130.489 E.01972
G1 X128.488 Y130.19 E.01972
G1 X128.008 Y129.765 E.01972
G1 X127.677 Y129.286 E.01787
M204 S10000
; WIPE_START
G1 F24000
G1 X127.416 Y128.637 E-.26601
G1 X127.338 Y128 E-.24382
G1 X127.416 Y127.363 E-.24382
G1 X127.422 Y127.347 E-.00635
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.371 J1.159 P1  F30000
G1 X143.148 Y132.387 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5332
G1 X116.852 Y132.387 E.87228
G1 X116.852 Y123.613 E.29103
G1 X143.148 Y123.613 E.87228
G1 X143.148 Y132.327 E.28904
G1 X143.54 Y132.779 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5332
G1 X116.46 Y132.779 E.83209
G1 X116.46 Y123.221 E.29367
G1 X143.54 Y123.221 E.83209
G1 X143.54 Y132.719 E.29183
M204 S10000
; WIPE_START
G1 F24000
G1 X141.54 Y132.723 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.495 J-1.112 P1  F30000
G1 X133.23 Y129.022 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5332
G3 X132.396 Y130.396 I-3.43 J-1.141 E.05378
G1 X134.038 Y132.038 E.07704
G1 X133.638 Y132.038 E.0133
G1 X141.714 Y123.962 E.3789
G1 X141.314 Y123.962 E.0133
G1 X142.8 Y125.448 E.06972
G1 X142.8 Y130.552 E.16933
G1 X141.314 Y132.038 E.06972
G1 X141.714 Y132.038 E.0133
G1 X133.638 Y123.962 E.3789
G1 X134.038 Y123.962 E.0133
G1 X132.396 Y125.604 E.07704
G2 X127.604 Y125.604 I-2.396 J2.417 E.17636
G1 X125.962 Y123.962 E.07704
G1 X126.362 Y123.962 E.0133
G1 X118.286 Y132.038 E.3789
G1 X118.686 Y132.038 E.0133
G1 X117.2 Y130.552 E.06972
G1 X117.2 Y125.448 E.16933
G1 X118.686 Y123.962 E.06972
G1 X118.286 Y123.962 E.0133
G1 X126.362 Y132.038 E.3789
G1 X125.962 Y132.038 E.0133
G1 X127.604 Y130.396 E.07704
G3 X126.77 Y129.022 I2.596 J-2.516 E.05378
; WIPE_START
G1 F24000
G1 X126.983 Y129.583 E-.2283
G1 X127.604 Y130.396 E-.38863
G1 X127.338 Y130.662 E-.14306
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.217 J.027 P1  F30000
G1 X127.739 Y112.582 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.266667
G1 F5332
G3 X131.531 Y112.769 I1.892 J.186 E.22804
G1 X127.716 Y112.769 E.15037
G2 X131.508 Y112.956 I1.903 J-.036 E.2254
; WIPE_START
G1 F24000
G1 X131.312 Y113.656 E-.27595
G1 X131.051 Y114.034 E-.17474
G1 X130.707 Y114.339 E-.17474
G1 X130.393 Y114.504 E-.13457
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.839 J.881 P1  F30000
G1 X138.255 Y107.015 Z1.4
G1 Z1
G1 E.8 F1800
G1 F5332
G1 X144.009 Y107.015 E.2268
G1 X144.009 Y109.892 E.1134
G1 X143.912 Y109.892 E.00382
G1 X144.009 Y115.646 E.22683
G1 X143.912 Y115.646 E.00382
; WIPE_START
G1 F24000
G1 X144.009 Y115.646 E-.03681
G1 X143.977 Y113.743 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.326 J-1.172 P1  F30000
G1 X120.562 Y107.231 Z1.4
G1 Z1
G1 E.8 F1800
G1 F5332
G1 X120.992 Y107.231 E.01695
G1 X120.992 Y107.015 E.0085
G1 X115.238 Y107.015 E.2268
G1 X115.335 Y112.769 E.22683
G1 X115.238 Y112.769 E.00382
G1 X115.238 Y115.646 E.1134
G1 X115.335 Y115.646 E.00382
; WIPE_START
G1 F24000
G1 X115.238 Y115.646 E-.03681
G1 X115.238 Y113.743 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.05 J1.216 P1  F30000
G1 X126.94 Y114.223 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F5332
G1 X126.917 Y114.19 E.00133
G1 X126.656 Y113.501 E.02444
G1 X126.567 Y112.769 E.02444
G1 X126.656 Y112.038 E.02444
G1 X126.917 Y111.349 E.02444
G1 X127.336 Y110.742 E.02444
G1 X127.887 Y110.254 E.02444
G1 X128.54 Y109.911 E.02444
G1 X129.255 Y109.735 E.02444
G1 X129.992 Y109.735 E.02444
G1 X130.707 Y109.911 E.02444
G1 X131.36 Y110.254 E.02444
G1 X131.911 Y110.742 E.02444
G1 X132.33 Y111.349 E.02444
G1 X132.591 Y112.038 E.02444
G1 X132.68 Y112.769 E.02444
G1 X132.591 Y113.501 E.02444
G1 X132.33 Y114.19 E.02444
G1 X131.911 Y114.796 E.02444
G1 X131.36 Y115.285 E.02444
G1 X130.707 Y115.627 E.02444
G1 X129.992 Y115.803 E.02444
G1 X129.255 Y115.803 E.02444
G1 X128.54 Y115.627 E.02444
G1 X127.887 Y115.285 E.02444
G1 X127.336 Y114.796 E.02444
G1 X126.974 Y114.272 E.02112
G1 X127.267 Y114.006 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5332
G1 X127.039 Y113.406 E.01972
G1 X126.962 Y112.769 E.01972
G1 X127.039 Y112.132 E.01972
G1 X127.267 Y111.532 E.01972
G1 X127.631 Y111.004 E.01972
G1 X128.112 Y110.579 E.01972
G1 X128.68 Y110.281 E.01972
G1 X129.303 Y110.127 E.01972
G1 X129.944 Y110.127 E.01972
G1 X130.567 Y110.281 E.01972
G1 X131.135 Y110.579 E.01972
G1 X131.616 Y111.004 E.01972
G1 X131.98 Y111.532 E.01972
G1 X132.208 Y112.132 E.01972
G1 X132.285 Y112.769 E.01972
G1 X132.208 Y113.406 E.01972
G1 X131.98 Y114.006 E.01972
G1 X131.616 Y114.534 E.01972
G1 X131.135 Y114.96 E.01972
G1 X130.567 Y115.258 E.01972
G1 X129.944 Y115.411 E.01972
G1 X129.303 Y115.411 E.01972
G1 X128.68 Y115.258 E.01972
G1 X128.112 Y114.96 E.01972
G1 X127.631 Y114.534 E.01972
G1 X127.301 Y114.056 E.01787
M204 S10000
; WIPE_START
G1 F24000
G1 X127.039 Y113.406 E-.26601
G1 X126.962 Y112.769 E-.24382
G1 X127.039 Y112.132 E-.24382
G1 X127.045 Y112.117 E-.00635
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.371 J1.159 P1  F30000
G1 X142.771 Y117.156 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5332
G1 X116.476 Y117.156 E.87228
G1 X116.476 Y108.383 E.29103
G1 X142.771 Y108.383 E.87228
G1 X142.771 Y117.096 E.28904
G1 X143.163 Y117.548 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5332
G1 X116.083 Y117.548 E.83209
G1 X116.083 Y107.991 E.29367
G1 X143.163 Y107.991 E.83209
G1 X143.163 Y117.488 E.29183
M204 S10000
; WIPE_START
G1 F24000
G1 X141.163 Y117.492 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.495 J-1.112 P1  F30000
G1 X132.854 Y113.791 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5332
G3 X132.02 Y115.165 I-3.43 J-1.141 E.05378
G1 X133.662 Y116.808 E.07704
G1 X133.261 Y116.808 E.0133
G1 X141.338 Y108.731 E.3789
G1 X140.937 Y108.731 E.0133
G1 X142.423 Y110.217 E.06972
G1 X142.423 Y115.322 E.16933
G1 X140.937 Y116.808 E.06972
G1 X141.338 Y116.808 E.0133
G1 X133.261 Y108.731 E.3789
G1 X133.662 Y108.731 E.0133
G1 X132.02 Y110.373 E.07704
G2 X127.227 Y110.373 I-2.396 J2.417 E.17636
G1 X125.585 Y108.731 E.07704
G1 X125.986 Y108.731 E.0133
G1 X117.909 Y116.808 E.3789
G1 X118.31 Y116.808 E.0133
G1 X116.824 Y115.322 E.06972
G1 X116.824 Y110.217 E.16933
G1 X118.31 Y108.731 E.06972
G1 X117.909 Y108.731 E.0133
G1 X125.986 Y116.808 E.3789
G1 X125.585 Y116.808 E.0133
G1 X127.227 Y115.165 E.07704
G3 X126.393 Y113.791 I2.596 J-2.516 E.05378
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.606 Y114.353 E-.2283
G1 X127.227 Y115.165 E-.38863
G1 X126.961 Y115.432 E-.14306
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/135
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
G3 Z1.4 I-1.217 J.028 P1  F30000
G1 X127.279 Y129.383 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4257
G1 X127.032 Y128.731 E.02312
G1 X126.943 Y128 E.02444
G1 X127.032 Y127.269 E.02444
G1 X127.294 Y126.58 E.02444
G1 X127.712 Y125.973 E.02444
G1 X128.264 Y125.485 E.02444
G1 X128.52 Y125.35 E.00961
G1 X128.916 Y125.142 E.01483
G1 X129.632 Y124.966 E.02444
G1 X130.368 Y124.966 E.02444
G1 X131.084 Y125.142 E.02444
G1 X131.736 Y125.485 E.02444
G1 X132.288 Y125.973 E.02444
G1 X132.706 Y126.58 E.02444
G1 X132.968 Y127.269 E.02444
G1 X133.057 Y128 E.02444
G1 X132.968 Y128.731 E.02444
G1 X132.706 Y129.42 E.02444
G1 X132.288 Y130.027 E.02444
G1 X131.736 Y130.515 E.02444
G1 X131.084 Y130.858 E.02444
G1 X130.368 Y131.034 E.02444
G1 X129.632 Y131.034 E.02444
G1 X128.916 Y130.858 E.02444
G1 X128.264 Y130.515 E.02444
G1 X127.712 Y130.027 E.02444
G1 X127.305 Y129.437 E.02378
G1 X127.643 Y129.237 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4257
G1 X127.416 Y128.637 E.01972
G1 X127.338 Y128 E.01972
G1 X127.416 Y127.363 E.01972
G1 X127.643 Y126.763 E.01972
G1 X128.008 Y126.235 E.01972
G1 X128.488 Y125.81 E.01972
G1 X128.702 Y125.697 E.00744
G1 X129.056 Y125.511 E.01228
G1 X129.679 Y125.358 E.01972
G1 X130.321 Y125.358 E.01972
G1 X130.944 Y125.511 E.01972
G1 X131.512 Y125.81 E.01972
G1 X131.992 Y126.235 E.01972
G1 X132.357 Y126.763 E.01972
G1 X132.584 Y127.363 E.01972
G1 X132.662 Y128 E.01972
G1 X132.584 Y128.637 E.01972
G1 X132.357 Y129.237 E.01972
G1 X131.992 Y129.765 E.01972
M73 P32 R16
G1 X131.512 Y130.19 E.01972
G1 X130.944 Y130.489 E.01972
G1 X130.321 Y130.642 E.01972
G1 X129.679 Y130.642 E.01972
G1 X129.056 Y130.489 E.01972
G1 X128.488 Y130.19 E.01972
G1 X128.008 Y129.765 E.01972
G1 X127.677 Y129.286 E.01787
M204 S10000
; WIPE_START
G1 F24000
G1 X127.416 Y128.637 E-.26601
G1 X127.338 Y128 E-.24382
G1 X127.416 Y127.363 E-.24382
G1 X127.422 Y127.347 E-.00635
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.372 J1.159 P1  F30000
G1 X143.148 Y132.398 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4257
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y123.602 E.29177
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y132.338 E.28978
G1 X143.54 Y132.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4257
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y123.21 E.29437
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y132.73 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X141.54 Y132.734 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.496 J-1.111 P1  F30000
G1 X133.23 Y129.022 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4257
G3 X132.396 Y130.396 I-3.43 J-1.141 E.05378
G1 X134.05 Y132.05 E.07757
G1 X133.626 Y132.05 E.01404
G1 X141.726 Y123.95 E.37996
G1 X141.302 Y123.95 E.01404
G1 X142.8 Y125.448 E.07025
G1 X142.8 Y130.552 E.16933
G1 X141.302 Y132.05 E.07025
G1 X141.726 Y132.05 E.01404
G1 X133.626 Y123.95 E.37996
G1 X134.05 Y123.95 E.01404
G1 X132.396 Y125.604 E.07757
G2 X127.604 Y125.604 I-2.396 J2.332 E.17723
G1 X125.95 Y123.95 E.07757
G1 X126.374 Y123.95 E.01404
G1 X118.274 Y132.05 E.37996
G1 X118.698 Y132.05 E.01404
G1 X117.2 Y130.552 E.07025
G1 X117.2 Y125.448 E.16933
G1 X118.698 Y123.95 E.07025
G1 X118.274 Y123.95 E.01404
G1 X126.374 Y132.05 E.37996
G1 X125.95 Y132.05 E.01404
G1 X127.604 Y130.396 E.07757
G3 X126.77 Y129.022 I2.596 J-2.516 E.05378
; WIPE_START
G1 F24000
G1 X126.983 Y129.583 E-.2283
G1 X127.604 Y130.396 E-.38863
G1 X127.338 Y130.662 E-.14306
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.217 J-.032 P1  F30000
G1 X126.903 Y114.152 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4257
G1 X126.656 Y113.501 E.02312
G1 X126.567 Y112.769 E.02444
G1 X126.656 Y112.038 E.02444
G1 X126.917 Y111.349 E.02444
G1 X127.336 Y110.742 E.02444
G1 X127.887 Y110.254 E.02444
G1 X128.144 Y110.119 E.00961
G1 X128.54 Y109.911 E.01483
G1 X129.255 Y109.735 E.02444
G1 X129.992 Y109.735 E.02444
G1 X130.707 Y109.911 E.02444
G1 X131.36 Y110.254 E.02444
G1 X131.911 Y110.742 E.02444
G1 X132.33 Y111.349 E.02444
G1 X132.591 Y112.038 E.02444
G1 X132.68 Y112.769 E.02444
G1 X132.591 Y113.501 E.02444
G1 X132.33 Y114.19 E.02444
G1 X131.911 Y114.796 E.02444
G1 X131.36 Y115.285 E.02444
G1 X130.707 Y115.627 E.02444
G1 X129.992 Y115.803 E.02444
G1 X129.255 Y115.803 E.02444
G1 X128.54 Y115.627 E.02444
G1 X127.887 Y115.285 E.02444
G1 X127.336 Y114.796 E.02444
G1 X126.928 Y114.206 E.02378
G1 X127.267 Y114.006 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4257
G1 X127.039 Y113.406 E.01972
G1 X126.962 Y112.769 E.01972
G1 X127.039 Y112.132 E.01972
G1 X127.267 Y111.532 E.01972
G1 X127.631 Y111.004 E.01972
G1 X128.112 Y110.579 E.01972
G1 X128.326 Y110.466 E.00744
G1 X128.68 Y110.281 E.01228
G1 X129.303 Y110.127 E.01972
G1 X129.944 Y110.127 E.01972
G1 X130.567 Y110.281 E.01972
G1 X131.135 Y110.579 E.01972
G1 X131.616 Y111.004 E.01972
G1 X131.98 Y111.532 E.01972
G1 X132.208 Y112.132 E.01972
G1 X132.285 Y112.769 E.01972
G1 X132.208 Y113.406 E.01972
G1 X131.98 Y114.006 E.01972
G1 X131.616 Y114.534 E.01972
G1 X131.135 Y114.96 E.01972
G1 X130.567 Y115.258 E.01972
G1 X129.944 Y115.411 E.01972
G1 X129.303 Y115.411 E.01972
G1 X128.68 Y115.258 E.01972
G1 X128.112 Y114.96 E.01972
G1 X127.631 Y114.534 E.01972
G1 X127.301 Y114.056 E.01787
M204 S10000
; WIPE_START
G1 F24000
G1 X127.039 Y113.406 E-.26601
G1 X126.962 Y112.769 E-.24382
G1 X127.039 Y112.132 E-.24382
G1 X127.045 Y112.117 E-.00635
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.372 J1.159 P1  F30000
G1 X142.771 Y117.167 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4257
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y108.371 E.29177
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y117.107 E.28978
G1 X143.163 Y117.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4257
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y107.979 E.29437
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y117.499 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X141.163 Y117.504 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.496 J-1.111 P1  F30000
G1 X132.854 Y113.791 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4257
G3 X132.02 Y115.165 I-3.43 J-1.141 E.05378
G1 X133.673 Y116.819 E.07757
G1 X133.25 Y116.819 E.01404
G1 X141.349 Y108.72 E.37996
G1 X140.926 Y108.72 E.01404
G1 X142.423 Y110.217 E.07025
G1 X142.423 Y115.322 E.16933
G1 X140.926 Y116.819 E.07025
G1 X141.349 Y116.819 E.01404
G1 X133.25 Y108.72 E.37996
G1 X133.673 Y108.72 E.01404
G1 X132.02 Y110.373 E.07757
G2 X127.227 Y110.373 I-2.396 J2.332 E.17723
G1 X125.574 Y108.72 E.07757
G1 X125.997 Y108.72 E.01404
G1 X117.898 Y116.819 E.37996
G1 X118.321 Y116.819 E.01404
G1 X116.824 Y115.322 E.07025
G1 X116.824 Y110.217 E.16933
G1 X118.321 Y108.72 E.07025
G1 X117.898 Y108.72 E.01404
G1 X125.997 Y116.819 E.37996
G1 X125.574 Y116.819 E.01404
G1 X127.227 Y115.165 E.07757
G3 X126.393 Y113.791 I2.596 J-2.516 E.05378
; CHANGE_LAYER
; Z_HEIGHT: 1.26667
; LAYER_HEIGHT: 0.0666666
; WIPE_START
G1 F24000
G1 X126.606 Y114.353 E-.2283
G1 X127.227 Y115.165 E-.38863
G1 X126.961 Y115.432 E-.14306
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/135
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
G3 Z1.6 I-.924 J-.792 P1  F30000
G1 X120.939 Y122.461 Z1.6
G1 Z1.267
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.266667
G1 F5323
G1 X121.369 Y122.461 E.01695
G1 X121.369 Y122.246 E.0085
G1 X115.615 Y122.246 E.2268
G1 X115.711 Y128 E.22683
G1 X115.615 Y128 E.00382
G1 X115.615 Y130.877 E.1134
G1 X115.711 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X115.615 Y130.877 E-.03681
G1 X115.615 Y128.974 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.667 I.113 J1.212 P1  F30000
G1 X128.115 Y127.813 Z1.667
G1 Z1.267
G1 E.8 F1800
G1 F5323
G3 X131.908 Y128 I1.892 J.186 E.22804
G1 X128.092 Y128 E.15037
G2 X131.885 Y128.187 I1.903 J-.038 E.22527
; WIPE_START
G1 F24000
G1 X131.689 Y128.886 E-.27595
G1 X131.428 Y129.265 E-.17474
G1 X131.084 Y129.57 E-.17474
G1 X130.77 Y129.734 E-.13457
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.667 I.839 J.881 P1  F30000
G1 X138.631 Y122.246 Z1.667
G1 Z1.267
G1 E.8 F1800
G1 F5323
G1 X144.385 Y122.246 E.2268
G1 X144.385 Y125.123 E.1134
G1 X144.289 Y125.123 E.00382
G1 X144.385 Y130.877 E.22683
G1 X144.289 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X144.385 Y130.877 E-.03681
G1 X144.353 Y128.974 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.667 I1.216 J-.04 P1  F30000
G1 X143.912 Y115.646 Z1.667
G1 Z1.267
G1 E.8 F1800
G1 F5323
G1 X144.009 Y115.646 E.00382
G1 X143.912 Y109.892 E.22683
G1 X144.009 Y109.892 E.00382
G1 X144.009 Y107.015 E.1134
G1 X138.255 Y107.015 E.2268
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.667 I-.684 J-1.007 P1  F30000
G1 X131.508 Y112.956 Z1.667
G1 Z1.267
G1 E.8 F1800
G1 F5323
G3 X127.716 Y112.769 I-1.89 J-.225 E.22527
G1 X131.531 Y112.769 E.15037
G2 X127.739 Y112.582 I-1.901 J-.001 E.22804
; WIPE_START
G1 F24000
G1 X127.934 Y111.883 E-.27595
G1 X128.196 Y111.504 E-.17474
G1 X128.54 Y111.199 E-.17474
G1 X128.853 Y111.035 E-.13457
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.667 I.507 J-1.106 P1  F30000
G1 X120.562 Y107.231 Z1.667
G1 Z1.267
G1 E.8 F1800
G1 F5323
G1 X120.992 Y107.231 E.01695
G1 X120.992 Y107.015 E.0085
G1 X115.238 Y107.015 E.2268
G1 X115.335 Y112.769 E.22683
G1 X115.238 Y112.769 E.00382
G1 X115.238 Y115.646 E.1134
G1 X115.335 Y115.646 E.00382
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.133333
; WIPE_START
G1 F24000
G1 X115.238 Y115.646 E-.03681
G1 X115.238 Y113.743 E-.72319
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/135
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
G3 Z1.667 I-.964 J.742 P1  F30000
G1 X127.279 Y129.383 Z1.667
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F5323
G1 X127.032 Y128.731 E.02312
G1 X126.943 Y128 E.02444
G1 X127.032 Y127.269 E.02444
G1 X127.294 Y126.58 E.02444
G1 X127.712 Y125.973 E.02444
G1 X128.264 Y125.485 E.02444
G1 X128.555 Y125.332 E.01092
G1 X128.916 Y125.142 E.01353
G1 X129.632 Y124.966 E.02444
G1 X130.368 Y124.966 E.02444
G1 X131.084 Y125.142 E.02444
G1 X131.736 Y125.485 E.02444
G1 X132.288 Y125.973 E.02444
G1 X132.706 Y126.58 E.02444
G1 X132.968 Y127.269 E.02444
G1 X133.057 Y128 E.02444
G1 X132.968 Y128.731 E.02444
G1 X132.851 Y129.039 E.01092
G1 X132.706 Y129.42 E.01353
G1 X132.288 Y130.027 E.02444
G1 X131.736 Y130.515 E.02444
G1 X131.084 Y130.858 E.02444
G1 X130.368 Y131.034 E.02444
G1 X129.632 Y131.034 E.02444
G1 X128.916 Y130.858 E.02444
G1 X128.264 Y130.515 E.02444
G1 X127.712 Y130.027 E.02444
G1 X127.305 Y129.437 E.02377
G1 X127.643 Y129.237 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5323
G1 X127.416 Y128.637 E.01972
G1 X127.338 Y128 E.01972
G1 X127.416 Y127.363 E.01972
G1 X127.516 Y127.1 E.00865
G1 X127.643 Y126.763 E.01107
G1 X128.008 Y126.235 E.01972
G1 X128.488 Y125.81 E.01972
G1 X128.737 Y125.679 E.00865
G1 X129.056 Y125.511 E.01107
G1 X129.679 Y125.358 E.01972
G1 X130.321 Y125.358 E.01972
G1 X130.944 Y125.511 E.01972
G1 X131.512 Y125.81 E.01972
G1 X131.992 Y126.235 E.01972
G1 X132.357 Y126.763 E.01972
G1 X132.584 Y127.363 E.01972
G1 X132.662 Y128 E.01972
G1 X132.584 Y128.637 E.01972
G1 X132.357 Y129.237 E.01972
G1 X131.992 Y129.765 E.01972
G1 X131.512 Y130.19 E.01972
G1 X130.944 Y130.489 E.01972
G1 X130.321 Y130.642 E.01972
G1 X129.679 Y130.642 E.01972
G1 X129.056 Y130.489 E.01972
G1 X128.488 Y130.19 E.01972
G1 X128.008 Y129.765 E.01972
G1 X127.677 Y129.286 E.01787
M204 S10000
; WIPE_START
G1 F24000
G1 X127.416 Y128.637 E-.26601
G1 X127.338 Y128 E-.24382
G1 X127.416 Y127.363 E-.24382
G1 X127.422 Y127.347 E-.00635
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.372 J1.159 P1  F30000
G1 X143.148 Y132.398 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5323
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y123.602 E.29177
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y132.338 E.28978
G1 X143.54 Y132.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5323
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y123.21 E.29437
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y132.73 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X141.54 Y132.734 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.496 J-1.111 P1  F30000
G1 X133.23 Y129.022 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5323
G1 X133.177 Y129.163 E.005
G3 X132.396 Y130.396 I-3.328 J-1.242 E.04877
G1 X134.05 Y132.05 E.07757
G1 X133.626 Y132.05 E.01404
G1 X141.726 Y123.95 E.37996
G1 X141.302 Y123.95 E.01404
G1 X142.8 Y125.448 E.07025
G1 X142.8 Y130.552 E.16933
G1 X141.302 Y132.05 E.07025
G1 X141.726 Y132.05 E.01404
G1 X133.626 Y123.95 E.37996
G1 X134.05 Y123.95 E.01404
G1 X132.396 Y125.604 E.07757
G2 X127.604 Y125.604 I-2.396 J2.332 E.17723
G1 X125.95 Y123.95 E.07757
G1 X126.374 Y123.95 E.01404
G1 X118.274 Y132.05 E.37996
G1 X118.698 Y132.05 E.01404
G1 X117.2 Y130.552 E.07025
G1 X117.2 Y125.448 E.16933
G1 X118.698 Y123.95 E.07025
G1 X118.274 Y123.95 E.01404
G1 X126.374 Y132.05 E.37996
G1 X125.95 Y132.05 E.01404
G1 X127.604 Y130.396 E.07757
G3 X126.77 Y129.022 I2.596 J-2.516 E.05378
; WIPE_START
G1 F24000
G1 X126.983 Y129.583 E-.2283
G1 X127.604 Y130.396 E-.38863
G1 X127.338 Y130.662 E-.14306
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.217 J-.032 P1  F30000
G1 X126.903 Y114.152 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5323
G1 X126.656 Y113.501 E.02312
G1 X126.567 Y112.769 E.02444
G1 X126.656 Y112.038 E.02444
G1 X126.917 Y111.349 E.02444
G1 X127.336 Y110.742 E.02444
G1 X127.887 Y110.254 E.02444
M73 P33 R16
G1 X128.178 Y110.101 E.01092
G1 X128.54 Y109.911 E.01353
G1 X129.255 Y109.735 E.02444
G1 X129.992 Y109.735 E.02444
G1 X130.707 Y109.911 E.02444
G1 X131.36 Y110.254 E.02444
G1 X131.911 Y110.742 E.02444
G1 X132.33 Y111.349 E.02444
G1 X132.591 Y112.038 E.02444
G1 X132.68 Y112.769 E.02444
G1 X132.591 Y113.501 E.02444
G1 X132.474 Y113.808 E.01092
G1 X132.33 Y114.19 E.01353
G1 X131.911 Y114.796 E.02444
G1 X131.36 Y115.285 E.02444
G1 X130.707 Y115.627 E.02444
G1 X129.992 Y115.803 E.02444
G1 X129.255 Y115.803 E.02444
G1 X128.54 Y115.627 E.02444
G1 X127.887 Y115.285 E.02444
G1 X127.336 Y114.796 E.02444
G1 X126.928 Y114.206 E.02377
G1 X127.267 Y114.006 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5323
G1 X127.039 Y113.406 E.01972
G1 X126.962 Y112.769 E.01972
G1 X127.039 Y112.132 E.01972
G1 X127.139 Y111.869 E.00865
G1 X127.267 Y111.532 E.01107
G1 X127.631 Y111.004 E.01972
G1 X128.112 Y110.579 E.01972
G1 X128.361 Y110.448 E.00865
G1 X128.68 Y110.281 E.01107
G1 X129.303 Y110.127 E.01972
G1 X129.944 Y110.127 E.01972
G1 X130.567 Y110.281 E.01972
G1 X131.135 Y110.579 E.01972
G1 X131.616 Y111.004 E.01972
G1 X131.98 Y111.532 E.01972
G1 X132.208 Y112.132 E.01972
G1 X132.285 Y112.769 E.01972
G1 X132.208 Y113.406 E.01972
G1 X131.98 Y114.006 E.01972
G1 X131.616 Y114.534 E.01972
G1 X131.135 Y114.96 E.01972
G1 X130.567 Y115.258 E.01972
G1 X129.944 Y115.411 E.01972
G1 X129.303 Y115.411 E.01972
G1 X128.68 Y115.258 E.01972
G1 X128.112 Y114.96 E.01972
G1 X127.631 Y114.534 E.01972
G1 X127.301 Y114.056 E.01787
M204 S10000
; WIPE_START
G1 F24000
G1 X127.039 Y113.406 E-.26601
G1 X126.962 Y112.769 E-.24382
G1 X127.039 Y112.132 E-.24382
G1 X127.045 Y112.117 E-.00635
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.372 J1.159 P1  F30000
G1 X142.771 Y117.167 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5323
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y108.371 E.29177
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y117.107 E.28978
G1 X143.163 Y117.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5323
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y107.979 E.29437
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y117.499 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X141.163 Y117.504 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.496 J-1.111 P1  F30000
G1 X132.854 Y113.791 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5323
G1 X132.8 Y113.932 E.005
G3 X132.02 Y115.165 I-3.328 J-1.242 E.04877
G1 X133.673 Y116.819 E.07757
G1 X133.25 Y116.819 E.01404
G1 X141.349 Y108.72 E.37996
G1 X140.926 Y108.72 E.01404
G1 X142.423 Y110.217 E.07025
G1 X142.423 Y115.322 E.16933
G1 X140.926 Y116.819 E.07025
G1 X141.349 Y116.819 E.01404
G1 X133.25 Y108.72 E.37996
G1 X133.673 Y108.72 E.01404
G1 X132.02 Y110.373 E.07757
G2 X127.227 Y110.373 I-2.396 J2.332 E.17723
G1 X125.574 Y108.72 E.07757
G1 X125.997 Y108.72 E.01404
G1 X117.898 Y116.819 E.37996
G1 X118.321 Y116.819 E.01404
G1 X116.824 Y115.322 E.07025
G1 X116.824 Y110.217 E.16933
G1 X118.321 Y108.72 E.07025
G1 X117.898 Y108.72 E.01404
G1 X125.997 Y116.819 E.37996
G1 X125.574 Y116.819 E.01404
G1 X127.227 Y115.165 E.07757
G3 X126.393 Y113.791 I2.596 J-2.516 E.05378
; CHANGE_LAYER
; Z_HEIGHT: 1.53333
; LAYER_HEIGHT: 0.133333
; WIPE_START
G1 F24000
G1 X126.606 Y114.353 E-.2283
G1 X127.227 Y115.165 E-.38863
G1 X126.961 Y115.432 E-.14306
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/135
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
G3 Z1.8 I-.924 J-.792 P1  F30000
G1 X120.939 Y122.461 Z1.8
G1 Z1.533
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.266667
G1 F5323
G1 X121.369 Y122.461 E.01695
G1 X121.369 Y122.246 E.0085
G1 X115.615 Y122.246 E.2268
G1 X115.711 Y128 E.22683
G1 X115.615 Y128 E.00382
G1 X115.615 Y130.877 E.1134
G1 X115.711 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X115.615 Y130.877 E-.03681
G1 X115.615 Y128.974 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.933 I.113 J1.212 P1  F30000
G1 X128.115 Y127.813 Z1.933
G1 Z1.533
G1 E.8 F1800
G1 F5323
G3 X131.908 Y128 I1.891 J.193 E.22753
G1 X128.092 Y128 E.15037
G2 X131.885 Y128.187 I1.901 J-.002 E.22785
; WIPE_START
G1 F24000
G1 X131.689 Y128.886 E-.27595
G1 X131.428 Y129.265 E-.17474
G1 X131.084 Y129.57 E-.17474
G1 X130.77 Y129.734 E-.13457
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.933 I.839 J.881 P1  F30000
G1 X138.631 Y122.246 Z1.933
G1 Z1.533
G1 E.8 F1800
G1 F5323
G1 X144.385 Y122.246 E.2268
G1 X144.385 Y125.123 E.1134
G1 X144.289 Y125.123 E.00382
G1 X144.385 Y130.877 E.22683
G1 X144.289 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X144.385 Y130.877 E-.03681
G1 X144.353 Y128.974 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.933 I1.216 J-.04 P1  F30000
G1 X143.912 Y115.646 Z1.933
G1 Z1.533
G1 E.8 F1800
G1 F5323
G1 X144.009 Y115.646 E.00382
G1 X143.912 Y109.892 E.22683
G1 X144.009 Y109.892 E.00382
G1 X144.009 Y107.015 E.1134
G1 X138.255 Y107.015 E.2268
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.933 I-.684 J-1.007 P1  F30000
G1 X131.508 Y112.956 Z1.933
G1 Z1.533
G1 E.8 F1800
G1 F5323
G3 X127.716 Y112.769 I-1.891 J-.189 E.22785
G1 X131.531 Y112.769 E.15037
G2 X127.739 Y112.582 I-1.901 J.006 E.22753
; WIPE_START
G1 F24000
G1 X127.934 Y111.883 E-.27595
G1 X128.196 Y111.504 E-.17474
G1 X128.54 Y111.199 E-.17474
G1 X128.853 Y111.035 E-.13456
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.933 I.507 J-1.106 P1  F30000
G1 X120.562 Y107.231 Z1.933
G1 Z1.533
G1 E.8 F1800
G1 F5323
G1 X120.992 Y107.231 E.01695
G1 X120.992 Y107.015 E.0085
G1 X115.238 Y107.015 E.2268
G1 X115.335 Y112.769 E.22683
G1 X115.238 Y112.769 E.00382
G1 X115.238 Y115.646 E.1134
G1 X115.335 Y115.646 E.00382
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.0666667
; WIPE_START
G1 F24000
G1 X115.238 Y115.646 E-.03681
G1 X115.238 Y113.743 E-.72319
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/135
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
G3 Z1.933 I-.965 J.742 P1  F30000
G1 X127.316 Y129.453 Z1.933
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F5323
G1 X127.294 Y129.42 E.00132
G1 X127.032 Y128.731 E.02444
G1 X126.943 Y128 E.02444
G1 X127.032 Y127.269 E.02444
G1 X127.294 Y126.58 E.02444
G1 X127.712 Y125.973 E.02444
G1 X128.264 Y125.485 E.02444
G1 X128.916 Y125.142 E.02444
G1 X129.632 Y124.966 E.02444
G1 X130.368 Y124.966 E.02444
G1 X131.084 Y125.142 E.02444
G1 X131.736 Y125.485 E.02444
G1 X132.288 Y125.973 E.02444
G1 X132.706 Y126.58 E.02444
G1 X132.968 Y127.269 E.02444
G1 X133.057 Y128 E.02444
G1 X132.968 Y128.731 E.02444
G1 X132.837 Y129.076 E.01222
G1 X132.706 Y129.42 E.01222
G1 X132.288 Y130.027 E.02444
G1 X131.736 Y130.515 E.02444
G1 X131.084 Y130.858 E.02444
G1 X130.368 Y131.034 E.02444
G1 X129.632 Y131.034 E.02444
G1 X128.916 Y130.858 E.02444
G1 X128.264 Y130.515 E.02444
G1 X127.712 Y130.027 E.02444
G1 X127.35 Y129.503 E.02113
G1 X127.643 Y129.237 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5323
G1 X127.416 Y128.637 E.01972
G1 X127.338 Y128 E.01972
G1 X127.416 Y127.363 E.01972
G1 X127.643 Y126.763 E.01972
G1 X128.008 Y126.235 E.01972
G1 X128.488 Y125.81 E.01972
G1 X129.056 Y125.511 E.01972
G1 X129.679 Y125.358 E.01972
G1 X130.321 Y125.358 E.01972
G1 X130.944 Y125.511 E.01972
G1 X131.512 Y125.81 E.01972
G1 X131.992 Y126.235 E.01972
G1 X132.357 Y126.763 E.01972
G1 X132.584 Y127.363 E.01972
G1 X132.662 Y128 E.01972
G1 X132.584 Y128.637 E.01972
G1 X132.47 Y128.937 E.00986
G1 X132.357 Y129.237 E.00986
G1 X131.992 Y129.765 E.01972
G1 X131.512 Y130.19 E.01972
G1 X130.944 Y130.489 E.01972
G1 X130.321 Y130.642 E.01972
G1 X129.679 Y130.642 E.01972
G1 X129.056 Y130.489 E.01972
G1 X128.488 Y130.19 E.01972
G1 X128.008 Y129.765 E.01972
G1 X127.677 Y129.286 E.01787
M204 S10000
; WIPE_START
G1 F24000
G1 X127.416 Y128.637 E-.26601
G1 X127.338 Y128 E-.24382
G1 X127.416 Y127.363 E-.24382
G1 X127.422 Y127.347 E-.00635
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.372 J1.159 P1  F30000
G1 X143.148 Y132.398 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5323
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y123.602 E.29177
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y132.338 E.28978
G1 X143.54 Y132.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5323
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y123.21 E.29437
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y132.73 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X141.54 Y132.734 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.496 J-1.111 P1  F30000
G1 X133.23 Y129.022 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5323
G1 X133.163 Y129.199 E.00631
G3 X132.396 Y130.396 I-3.314 J-1.279 E.04746
G1 X134.05 Y132.05 E.07757
G1 X133.626 Y132.05 E.01404
G1 X141.726 Y123.95 E.37996
G1 X141.302 Y123.95 E.01404
G1 X142.8 Y125.448 E.07025
G1 X142.8 Y130.552 E.16933
G1 X141.302 Y132.05 E.07025
G1 X141.726 Y132.05 E.01404
G1 X133.626 Y123.95 E.37996
G1 X134.05 Y123.95 E.01404
G1 X132.396 Y125.604 E.07757
G2 X127.604 Y125.604 I-2.396 J2.417 E.17636
G1 X125.95 Y123.95 E.07757
G1 X126.374 Y123.95 E.01404
G1 X118.274 Y132.05 E.37996
G1 X118.698 Y132.05 E.01404
G1 X117.2 Y130.552 E.07025
G1 X117.2 Y125.448 E.16933
G1 X118.698 Y123.95 E.07025
G1 X118.274 Y123.95 E.01404
G1 X126.374 Y132.05 E.37996
G1 X125.95 Y132.05 E.01404
G1 X127.604 Y130.396 E.07757
G3 X126.77 Y129.022 I2.596 J-2.516 E.05378
; WIPE_START
G1 F24000
G1 X126.983 Y129.583 E-.2283
G1 X127.604 Y130.396 E-.38863
G1 X127.338 Y130.662 E-.14306
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.217 J-.029 P1  F30000
G1 X126.94 Y114.222 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
M73 P33 R15
G1 F5323
G1 X126.917 Y114.19 E.00132
G1 X126.656 Y113.501 E.02444
G1 X126.567 Y112.769 E.02444
G1 X126.656 Y112.038 E.02444
G1 X126.917 Y111.349 E.02444
G1 X127.336 Y110.742 E.02444
G1 X127.887 Y110.254 E.02444
G1 X128.54 Y109.911 E.02444
G1 X129.255 Y109.735 E.02444
G1 X129.992 Y109.735 E.02444
G1 X130.707 Y109.911 E.02444
G1 X131.36 Y110.254 E.02444
G1 X131.911 Y110.742 E.02444
G1 X132.33 Y111.349 E.02444
G1 X132.591 Y112.038 E.02444
G1 X132.68 Y112.769 E.02444
G1 X132.591 Y113.501 E.02444
G1 X132.46 Y113.845 E.01222
G1 X132.33 Y114.19 E.01222
G1 X131.911 Y114.796 E.02444
G1 X131.36 Y115.285 E.02444
G1 X130.707 Y115.627 E.02444
G1 X129.992 Y115.803 E.02444
G1 X129.255 Y115.803 E.02444
G1 X128.54 Y115.627 E.02444
G1 X127.887 Y115.285 E.02444
G1 X127.336 Y114.796 E.02444
G1 X126.974 Y114.272 E.02113
G1 X127.267 Y114.006 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5323
G1 X127.039 Y113.406 E.01972
G1 X126.962 Y112.769 E.01972
G1 X127.039 Y112.132 E.01972
G1 X127.267 Y111.532 E.01972
G1 X127.631 Y111.004 E.01972
G1 X128.112 Y110.579 E.01972
G1 X128.68 Y110.281 E.01972
G1 X129.303 Y110.127 E.01972
G1 X129.944 Y110.127 E.01972
G1 X130.567 Y110.281 E.01972
G1 X131.135 Y110.579 E.01972
G1 X131.616 Y111.004 E.01972
G1 X131.98 Y111.532 E.01972
G1 X132.208 Y112.132 E.01972
G1 X132.285 Y112.769 E.01972
G1 X132.208 Y113.406 E.01972
G1 X132.094 Y113.706 E.00986
G1 X131.98 Y114.006 E.00986
G1 X131.616 Y114.534 E.01972
G1 X131.135 Y114.96 E.01972
G1 X130.567 Y115.258 E.01972
G1 X129.944 Y115.411 E.01972
G1 X129.303 Y115.411 E.01972
G1 X128.68 Y115.258 E.01972
G1 X128.112 Y114.96 E.01972
G1 X127.631 Y114.534 E.01972
G1 X127.301 Y114.056 E.01787
M204 S10000
; WIPE_START
G1 F24000
G1 X127.039 Y113.406 E-.26601
G1 X126.962 Y112.769 E-.24382
G1 X127.039 Y112.132 E-.24382
G1 X127.045 Y112.117 E-.00635
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.372 J1.159 P1  F30000
G1 X142.771 Y117.167 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5323
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y108.371 E.29177
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y117.107 E.28978
G1 X143.163 Y117.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5323
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y107.979 E.29437
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y117.499 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X141.163 Y117.504 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.496 J-1.111 P1  F30000
G1 X132.854 Y113.791 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5323
G1 X132.786 Y113.969 E.00631
G3 X132.02 Y115.165 I-3.314 J-1.279 E.04746
G1 X133.673 Y116.819 E.07757
G1 X133.25 Y116.819 E.01404
G1 X141.349 Y108.72 E.37996
G1 X140.926 Y108.72 E.01404
G1 X142.423 Y110.217 E.07025
G1 X142.423 Y115.322 E.16933
G1 X140.926 Y116.819 E.07025
G1 X141.349 Y116.819 E.01404
G1 X133.25 Y108.72 E.37996
G1 X133.673 Y108.72 E.01404
G1 X132.02 Y110.373 E.07757
G2 X127.227 Y110.373 I-2.396 J2.417 E.17636
G1 X125.574 Y108.72 E.07757
G1 X125.997 Y108.72 E.01404
G1 X117.898 Y116.819 E.37996
G1 X118.321 Y116.819 E.01404
G1 X116.824 Y115.322 E.07025
G1 X116.824 Y110.217 E.16933
G1 X118.321 Y108.72 E.07025
G1 X117.898 Y108.72 E.01404
G1 X125.997 Y116.819 E.37996
G1 X125.574 Y116.819 E.01404
G1 X127.227 Y115.165 E.07757
G3 X126.393 Y113.791 I2.596 J-2.516 E.05378
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.606 Y114.353 E-.2283
G1 X127.227 Y115.165 E-.38863
G1 X126.961 Y115.432 E-.14306
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/135
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
G3 Z2 I-.924 J-.792 P1  F30000
G1 X120.939 Y122.461 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.266667
G1 F6711
M73 P34 R15
G1 X121.369 Y122.461 E.01695
G1 X121.369 Y122.246 E.0085
G1 X115.615 Y122.246 E.2268
G1 X115.711 Y128 E.22683
G1 X115.615 Y128 E.00382
G1 X115.615 Y130.877 E.1134
G1 X115.711 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X115.615 Y130.877 E-.03681
G1 X115.615 Y128.974 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.113 J1.212 P1  F30000
G1 X128.115 Y127.813 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F6711
G3 X131.908 Y128 I1.891 J.195 E.22743
G1 X128.092 Y128 E.15037
G2 X131.885 Y128.187 I1.901 J.001 E.22804
; WIPE_START
G1 F24000
G1 X131.689 Y128.886 E-.27595
G1 X131.428 Y129.265 E-.17474
G1 X131.084 Y129.57 E-.17474
G1 X130.77 Y129.734 E-.13457
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.839 J.881 P1  F30000
G1 X138.631 Y122.246 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F6711
G1 X144.385 Y122.246 E.2268
G1 X144.385 Y125.123 E.1134
G1 X144.289 Y125.123 E.00382
G1 X144.385 Y130.877 E.22683
G1 X144.289 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X144.385 Y130.877 E-.03681
G1 X144.353 Y128.974 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.029 J-1.217 P1  F30000
G1 X127.28 Y129.383 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6711
G1 X127.032 Y128.731 E.02313
G1 X126.943 Y128 E.02444
G1 X127.032 Y127.269 E.02444
G1 X127.294 Y126.58 E.02444
G1 X127.712 Y125.973 E.02444
G1 X128.264 Y125.485 E.02444
G1 X128.916 Y125.142 E.02444
G1 X129.632 Y124.966 E.02444
G1 X130.368 Y124.966 E.02444
G1 X131.084 Y125.142 E.02444
G1 X131.736 Y125.485 E.02444
G1 X132.042 Y125.755 E.01353
G1 X132.288 Y125.973 E.01091
G1 X132.706 Y126.58 E.02444
G1 X132.968 Y127.269 E.02444
G1 X133.057 Y128 E.02444
G1 X132.968 Y128.731 E.02444
G1 X132.706 Y129.42 E.02444
G1 X132.288 Y130.027 E.02444
G1 X131.736 Y130.515 E.02444
G1 X131.084 Y130.858 E.02444
G1 X130.368 Y131.034 E.02444
G1 X129.632 Y131.034 E.02444
G1 X128.916 Y130.858 E.02444
G1 X128.264 Y130.515 E.02444
G1 X127.712 Y130.027 E.02444
G1 X127.305 Y129.437 E.02377
G1 X127.643 Y129.237 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6711
G1 X127.416 Y128.637 E.01972
G1 X127.338 Y128 E.01972
G1 X127.416 Y127.363 E.01972
G1 X127.643 Y126.763 E.01972
G1 X128.008 Y126.235 E.01972
G1 X128.488 Y125.81 E.01972
G1 X129.056 Y125.511 E.01972
G1 X129.679 Y125.358 E.01972
G1 X130.321 Y125.358 E.01972
G1 X130.944 Y125.511 E.01972
G1 X131.512 Y125.81 E.01972
G1 X131.992 Y126.235 E.01972
G1 X132.357 Y126.763 E.01972
G1 X132.584 Y127.363 E.01972
G1 X132.662 Y128 E.01972
G1 X132.584 Y128.637 E.01972
G1 X132.357 Y129.237 E.01972
G1 X131.992 Y129.765 E.01972
G1 X131.512 Y130.19 E.01972
G1 X130.944 Y130.489 E.01972
G1 X130.321 Y130.642 E.01972
G1 X129.679 Y130.642 E.01972
G1 X129.056 Y130.489 E.01972
G1 X128.488 Y130.19 E.01972
G1 X128.008 Y129.765 E.01972
G1 X127.677 Y129.286 E.01787
M204 S10000
; WIPE_START
G1 F24000
G1 X127.416 Y128.637 E-.26601
G1 X127.338 Y128 E-.24382
G1 X127.416 Y127.363 E-.24382
G1 X127.422 Y127.347 E-.00635
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.372 J1.159 P1  F30000
G1 X143.148 Y132.398 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6711
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y123.602 E.29177
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y132.338 E.28978
G1 X143.54 Y132.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6711
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y123.21 E.29437
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y132.73 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X141.54 Y132.734 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.581 J1.069 P1  F30000
G1 X142.8 Y132.05 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6711
G1 X130.53 Y132.05 E.40702
G1 X132.55 Y130.259 E.08955
G2 X132.188 Y125.42 I-2.528 J-2.244 E.17957
G1 X130.53 Y123.95 E.0735
G1 X142.8 Y123.95 E.40702
G1 X142.8 Y131.99 E.26668
G1 X133.549 Y129.328 F30000
G1 F6711
G3 X132.685 Y130.685 I-3.718 J-1.416 E.05374
G1 X133.643 Y131.643 E.04494
G1 X134.033 Y131.643 E.01296
G1 X141.319 Y124.357 E.34176
G1 X141.709 Y124.357 E.01296
G1 X142.393 Y125.041 E.03205
G1 X142.393 Y130.959 E.19633
G1 X141.709 Y131.643 E.03205
G1 X141.319 Y131.643 E.01296
G1 X134.033 Y124.357 E.34176
G1 X133.643 Y124.357 E.01296
G1 X132.685 Y125.315 E.04494
G1 X132.857 Y125.469 E.00766
G3 X133.549 Y126.672 I-2.095 J2.005 E.0465
; WIPE_START
G1 F24000
G1 X133.38 Y126.226 E-.18131
G1 X132.857 Y125.469 E-.3497
G1 X132.685 Y125.315 E-.08774
G1 X132.947 Y125.053 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.03 J-1.217 P1  F30000
G1 X128.091 Y125.172 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F6711
G1 X129.47 Y123.95 E.06113
G1 X117.2 Y123.95 E.40702
G1 X117.2 Y132.05 E.26867
G1 X129.47 Y132.05 E.40702
G1 X128.046 Y130.788 E.06312
G3 X128.046 Y125.212 I2.007 J-2.788 E.21577
G1 X126.451 Y126.672 F30000
G1 F6711
G3 X127.315 Y125.315 I3.718 J1.416 E.05374
G1 X126.357 Y124.357 E.04494
G1 X125.967 Y124.357 E.01296
G1 X118.681 Y131.643 E.34176
G1 X118.291 Y131.643 E.01296
G1 X117.607 Y130.959 E.03205
G1 X117.607 Y125.041 E.19633
G1 X118.291 Y124.357 E.03205
G1 X118.681 Y124.357 E.01296
G1 X125.967 Y131.643 E.34176
G1 X126.357 Y131.643 E.01296
G1 X127.315 Y130.685 E.04494
G1 X127.143 Y130.531 E.00766
G3 X126.451 Y129.328 I2.095 J-2.005 E.0465
; WIPE_START
G1 F24000
G1 X126.62 Y129.774 E-.18131
G1 X127.143 Y130.531 E-.34971
G1 X127.315 Y130.685 E-.08774
G1 X127.053 Y130.947 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.216 J.045 P1  F30000
G1 X127.739 Y112.582 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.266667
G1 F6711
G3 X131.531 Y112.769 I1.891 J.195 E.22743
G1 X127.716 Y112.769 E.15037
G2 X131.508 Y112.956 I1.901 J.001 E.22804
; WIPE_START
G1 F24000
G1 X131.312 Y113.656 E-.27595
G1 X131.051 Y114.034 E-.17474
G1 X130.707 Y114.339 E-.17474
G1 X130.393 Y114.504 E-.13457
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.839 J.881 P1  F30000
G1 X138.255 Y107.015 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F6711
G1 X144.009 Y107.015 E.2268
G1 X144.009 Y109.892 E.1134
G1 X143.912 Y109.892 E.00382
G1 X144.009 Y115.646 E.22683
G1 X143.912 Y115.646 E.00382
; WIPE_START
G1 F24000
G1 X144.009 Y115.646 E-.03681
G1 X143.977 Y113.743 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.326 J-1.172 P1  F30000
G1 X120.562 Y107.231 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F6711
G1 X120.992 Y107.231 E.01695
G1 X120.992 Y107.015 E.0085
G1 X115.238 Y107.015 E.2268
G1 X115.335 Y112.769 E.22683
G1 X115.238 Y112.769 E.00382
G1 X115.238 Y115.646 E.1134
G1 X115.335 Y115.646 E.00382
; WIPE_START
G1 F24000
G1 X115.238 Y115.646 E-.03681
G1 X115.238 Y113.743 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.043 J1.216 P1  F30000
G1 X126.903 Y114.153 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6711
G1 X126.656 Y113.501 E.02313
G1 X126.567 Y112.769 E.02444
G1 X126.656 Y112.038 E.02444
G1 X126.917 Y111.349 E.02444
G1 X127.336 Y110.742 E.02444
G1 X127.887 Y110.254 E.02444
G1 X128.54 Y109.911 E.02444
G1 X129.255 Y109.735 E.02444
G1 X129.992 Y109.735 E.02444
G1 X130.707 Y109.911 E.02444
G1 X131.36 Y110.254 E.02444
G1 X131.665 Y110.524 E.01353
G1 X131.911 Y110.742 E.01091
G1 X132.33 Y111.349 E.02444
G1 X132.591 Y112.038 E.02444
G1 X132.68 Y112.769 E.02444
G1 X132.591 Y113.501 E.02444
G1 X132.33 Y114.19 E.02444
G1 X131.911 Y114.796 E.02444
G1 X131.36 Y115.285 E.02444
G1 X130.707 Y115.627 E.02444
G1 X129.992 Y115.803 E.02444
G1 X129.255 Y115.803 E.02444
G1 X128.54 Y115.627 E.02444
G1 X127.887 Y115.285 E.02444
G1 X127.336 Y114.796 E.02444
G1 X126.929 Y114.206 E.02377
G1 X127.267 Y114.006 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6711
G1 X127.039 Y113.406 E.01972
G1 X126.962 Y112.769 E.01972
G1 X127.039 Y112.132 E.01972
G1 X127.267 Y111.532 E.01972
G1 X127.631 Y111.004 E.01972
G1 X128.112 Y110.579 E.01972
G1 X128.68 Y110.281 E.01972
G1 X129.303 Y110.127 E.01972
G1 X129.944 Y110.127 E.01972
G1 X130.567 Y110.281 E.01972
G1 X131.135 Y110.579 E.01972
G1 X131.616 Y111.004 E.01972
G1 X131.98 Y111.532 E.01972
G1 X132.208 Y112.132 E.01972
G1 X132.285 Y112.769 E.01972
G1 X132.208 Y113.406 E.01972
G1 X131.98 Y114.006 E.01972
G1 X131.616 Y114.534 E.01972
G1 X131.135 Y114.96 E.01972
G1 X130.567 Y115.258 E.01972
G1 X129.944 Y115.411 E.01972
G1 X129.303 Y115.411 E.01972
G1 X128.68 Y115.258 E.01972
G1 X128.112 Y114.96 E.01972
G1 X127.631 Y114.534 E.01972
G1 X127.301 Y114.056 E.01787
M204 S10000
; WIPE_START
G1 F24000
G1 X127.039 Y113.406 E-.26601
G1 X126.962 Y112.769 E-.24382
G1 X127.039 Y112.132 E-.24382
G1 X127.045 Y112.117 E-.00635
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.372 J1.159 P1  F30000
G1 X142.771 Y117.167 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6711
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y108.371 E.29177
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y117.107 E.28978
G1 X143.163 Y117.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6711
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y107.979 E.29437
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y117.499 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X141.163 Y117.504 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.581 J1.069 P1  F30000
G1 X142.423 Y116.819 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6711
G1 X130.153 Y116.819 E.40702
G1 X132.174 Y115.029 E.08955
G2 X131.812 Y110.189 I-2.528 J-2.244 E.17957
G1 X130.153 Y108.72 E.0735
G1 X142.423 Y108.72 E.40702
G1 X142.423 Y116.759 E.26668
G1 X133.173 Y114.097 F30000
G1 F6711
G3 X132.308 Y115.454 I-3.718 J-1.416 E.05374
G1 X133.266 Y116.412 E.04494
G1 X133.657 Y116.412 E.01296
G1 X140.942 Y109.127 E.34176
G1 X141.333 Y109.127 E.01296
G1 X142.016 Y109.81 E.03205
G1 X142.016 Y115.729 E.19633
G1 X141.333 Y116.412 E.03205
G1 X140.942 Y116.412 E.01296
G1 X133.657 Y109.127 E.34176
G1 X133.266 Y109.127 E.01296
G1 X132.308 Y110.085 E.04494
G1 X132.481 Y110.238 E.00766
G3 X133.173 Y111.441 I-2.095 J2.005 E.0465
; WIPE_START
G1 F24000
G1 X133.004 Y110.995 E-.18131
G1 X132.481 Y110.238 E-.3497
G1 X132.308 Y110.085 E-.08774
G1 X132.571 Y109.822 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.03 J-1.217 P1  F30000
G1 X127.714 Y109.942 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F6711
G1 X129.094 Y108.72 E.06113
G1 X116.824 Y108.72 E.40702
G1 X116.824 Y116.819 E.26867
G1 X129.094 Y116.819 E.40702
G1 X127.669 Y115.557 E.06312
G3 X127.669 Y109.981 I2.007 J-2.788 E.21577
G1 X126.074 Y111.441 F30000
G1 F6711
G3 X126.939 Y110.085 I3.718 J1.416 E.05374
G1 X125.981 Y109.127 E.04494
G1 X125.59 Y109.127 E.01296
G1 X118.305 Y116.412 E.34176
G1 X117.914 Y116.412 E.01296
G1 X117.231 Y115.729 E.03205
G1 X117.231 Y109.81 E.19633
G1 X117.914 Y109.127 E.03205
G1 X118.305 Y109.127 E.01296
G1 X125.59 Y116.412 E.34176
G1 X125.981 Y116.412 E.01296
G1 X126.939 Y115.454 E.04494
G1 X126.766 Y115.301 E.00766
G3 X126.074 Y114.097 I2.095 J-2.005 E.0465
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.243 Y114.543 E-.18131
G1 X126.766 Y115.301 E-.34971
G1 X126.939 Y115.454 E-.08774
G1 X126.676 Y115.717 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/135
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
G3 Z2.2 I-1.216 J.057 P1  F30000
G1 X127.316 Y129.453 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5520
G1 X127.294 Y129.42 E.00131
G1 X127.032 Y128.731 E.02444
G1 X126.943 Y128 E.02444
G1 X127.032 Y127.269 E.02444
G1 X127.294 Y126.58 E.02444
G1 X127.712 Y125.973 E.02444
G1 X128.264 Y125.485 E.02444
G1 X128.916 Y125.142 E.02444
G1 X129.632 Y124.966 E.02444
G1 X130.368 Y124.966 E.02444
G1 X131.084 Y125.142 E.02444
G1 X131.736 Y125.485 E.02444
G1 X132.288 Y125.973 E.02444
G1 X132.706 Y126.58 E.02444
G1 X132.968 Y127.269 E.02444
G1 X133.057 Y128 E.02444
G1 X132.968 Y128.731 E.02444
G1 X132.706 Y129.42 E.02444
G1 X132.288 Y130.027 E.02444
G1 X131.736 Y130.515 E.02444
G1 X131.084 Y130.858 E.02444
G1 X130.368 Y131.034 E.02444
G1 X129.632 Y131.034 E.02444
G1 X128.916 Y130.858 E.02444
G1 X128.264 Y130.515 E.02444
G1 X127.712 Y130.027 E.02444
G1 X127.35 Y129.502 E.02114
G1 X127.643 Y129.237 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5520
G1 X127.416 Y128.637 E.01972
G1 X127.338 Y128 E.01972
G1 X127.416 Y127.363 E.01972
M73 P35 R15
G1 X127.643 Y126.763 E.01972
G1 X128.008 Y126.235 E.01972
G1 X128.488 Y125.81 E.01972
G1 X129.056 Y125.511 E.01972
G1 X129.679 Y125.358 E.01972
G1 X130.321 Y125.358 E.01972
G1 X130.944 Y125.511 E.01972
G1 X131.512 Y125.81 E.01972
G1 X131.992 Y126.235 E.01972
G1 X132.357 Y126.763 E.01972
G1 X132.584 Y127.363 E.01972
G1 X132.662 Y128 E.01972
G1 X132.584 Y128.637 E.01972
G1 X132.443 Y129.011 E.01228
G1 X132.357 Y129.237 E.00744
G1 X131.992 Y129.765 E.01972
G1 X131.512 Y130.19 E.01972
G1 X130.944 Y130.489 E.01972
G1 X130.321 Y130.642 E.01972
G1 X129.679 Y130.642 E.01972
G1 X129.056 Y130.489 E.01972
G1 X128.488 Y130.19 E.01972
G1 X128.008 Y129.765 E.01972
G1 X127.677 Y129.286 E.01787
M204 S10000
; WIPE_START
G1 F24000
G1 X127.416 Y128.637 E-.26601
G1 X127.338 Y128 E-.24382
G1 X127.416 Y127.363 E-.24382
G1 X127.422 Y127.347 E-.00635
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.372 J1.159 P1  F30000
G1 X143.148 Y132.398 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5520
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y123.602 E.29177
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y132.338 E.28978
G1 X143.54 Y132.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5520
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y123.21 E.29437
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y132.73 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X141.54 Y132.734 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.581 J1.069 P1  F30000
G1 X142.8 Y132.05 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5520
G1 X130.53 Y132.05 E.40702
G1 X132.55 Y130.259 E.08955
G2 X132.55 Y125.741 I-2.55 J-2.259 E.16389
G1 X130.53 Y123.95 E.08955
G1 X142.8 Y123.95 E.40702
G1 X142.8 Y131.99 E.26668
G1 X133.549 Y129.328 F30000
G1 F5520
G3 X132.685 Y130.685 I-3.718 J-1.416 E.05374
G1 X133.643 Y131.643 E.04494
G1 X134.033 Y131.643 E.01296
G1 X141.319 Y124.357 E.34176
G1 X141.709 Y124.357 E.01296
G1 X142.393 Y125.041 E.03205
G1 X142.393 Y130.959 E.19633
G1 X141.709 Y131.643 E.03205
G1 X141.319 Y131.643 E.01296
G1 X134.033 Y124.357 E.34176
G1 X133.643 Y124.357 E.01296
G1 X132.685 Y125.315 E.04494
G1 X132.857 Y125.469 E.00766
G3 X133.549 Y126.672 I-2.095 J2.005 E.0465
; WIPE_START
G1 F24000
G1 X133.38 Y126.226 E-.18131
G1 X132.857 Y125.469 E-.3497
G1 X132.685 Y125.315 E-.08775
G1 X132.947 Y125.053 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.03 J-1.217 P1  F30000
G1 X128.091 Y125.172 Z2.4
G1 Z2
G1 E.8 F1800
G1 F5520
G1 X129.47 Y123.95 E.06113
G1 X117.2 Y123.95 E.40702
G1 X117.2 Y132.05 E.26867
G1 X129.47 Y132.05 E.40702
G1 X128.046 Y130.788 E.06312
G3 X128.046 Y125.212 I2.007 J-2.788 E.21577
G1 X126.451 Y126.672 F30000
G1 F5520
G3 X127.315 Y125.315 I3.718 J1.416 E.05374
G1 X126.357 Y124.357 E.04494
G1 X125.967 Y124.357 E.01296
G1 X118.681 Y131.643 E.34176
G1 X118.291 Y131.643 E.01296
G1 X117.607 Y130.959 E.03205
G1 X117.607 Y125.041 E.19633
G1 X118.291 Y124.357 E.03205
G1 X118.681 Y124.357 E.01296
G1 X125.967 Y131.643 E.34176
G1 X126.357 Y131.643 E.01296
G1 X127.315 Y130.685 E.04494
G1 X127.143 Y130.531 E.00766
G3 X126.451 Y129.328 I2.095 J-2.005 E.0465
; WIPE_START
G1 F24000
G1 X126.62 Y129.774 E-.18131
G1 X127.143 Y130.531 E-.34971
G1 X127.315 Y130.685 E-.08774
G1 X127.053 Y130.947 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.217 J-.008 P1  F30000
G1 X126.94 Y114.222 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5520
G1 X126.917 Y114.19 E.00131
G1 X126.656 Y113.501 E.02444
G1 X126.567 Y112.769 E.02444
G1 X126.656 Y112.038 E.02444
G1 X126.917 Y111.349 E.02444
G1 X127.336 Y110.742 E.02444
G1 X127.887 Y110.254 E.02444
G1 X128.54 Y109.911 E.02444
G1 X129.255 Y109.735 E.02444
G1 X129.992 Y109.735 E.02444
G1 X130.707 Y109.911 E.02444
G1 X131.36 Y110.254 E.02444
G1 X131.911 Y110.742 E.02444
G1 X132.33 Y111.349 E.02444
G1 X132.591 Y112.038 E.02444
G1 X132.68 Y112.769 E.02444
G1 X132.591 Y113.501 E.02444
G1 X132.33 Y114.19 E.02444
G1 X131.911 Y114.796 E.02444
G1 X131.36 Y115.285 E.02444
G1 X130.707 Y115.627 E.02444
G1 X129.992 Y115.803 E.02444
G1 X129.255 Y115.803 E.02444
G1 X128.54 Y115.627 E.02444
G1 X127.887 Y115.285 E.02444
G1 X127.336 Y114.796 E.02444
G1 X126.974 Y114.272 E.02114
G1 X127.267 Y114.006 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5520
G1 X127.039 Y113.406 E.01972
G1 X126.962 Y112.769 E.01972
G1 X127.039 Y112.132 E.01972
G1 X127.267 Y111.532 E.01972
G1 X127.631 Y111.004 E.01972
G1 X128.112 Y110.579 E.01972
G1 X128.68 Y110.281 E.01972
G1 X129.303 Y110.127 E.01972
G1 X129.944 Y110.127 E.01972
G1 X130.567 Y110.281 E.01972
G1 X131.135 Y110.579 E.01972
G1 X131.616 Y111.004 E.01972
G1 X131.98 Y111.532 E.01972
G1 X132.208 Y112.132 E.01972
G1 X132.285 Y112.769 E.01972
G1 X132.208 Y113.406 E.01972
G1 X132.066 Y113.78 E.01228
G1 X131.98 Y114.006 E.00744
G1 X131.616 Y114.534 E.01972
G1 X131.135 Y114.96 E.01972
G1 X130.567 Y115.258 E.01972
G1 X129.944 Y115.411 E.01972
G1 X129.303 Y115.411 E.01972
G1 X128.68 Y115.258 E.01972
G1 X128.112 Y114.96 E.01972
G1 X127.631 Y114.534 E.01972
G1 X127.301 Y114.056 E.01787
M204 S10000
; WIPE_START
G1 F24000
G1 X127.039 Y113.406 E-.26601
G1 X126.962 Y112.769 E-.24382
G1 X127.039 Y112.132 E-.24382
G1 X127.045 Y112.117 E-.00635
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.372 J1.159 P1  F30000
G1 X142.771 Y117.167 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5520
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y108.371 E.29177
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y117.107 E.28978
G1 X143.163 Y117.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5520
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y107.979 E.29437
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y117.499 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X141.163 Y117.504 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.581 J1.069 P1  F30000
G1 X142.423 Y116.819 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5520
G1 X130.153 Y116.819 E.40702
G1 X132.174 Y115.029 E.08955
G2 X132.174 Y110.51 I-2.55 J-2.259 E.16389
G1 X130.153 Y108.72 E.08955
G1 X142.423 Y108.72 E.40702
G1 X142.423 Y116.759 E.26668
G1 X133.173 Y114.097 F30000
G1 F5520
G3 X132.308 Y115.454 I-3.718 J-1.416 E.05374
G1 X133.266 Y116.412 E.04494
G1 X133.657 Y116.412 E.01296
G1 X140.942 Y109.127 E.34176
G1 X141.333 Y109.127 E.01296
G1 X142.016 Y109.81 E.03205
G1 X142.016 Y115.729 E.19633
G1 X141.333 Y116.412 E.03205
G1 X140.942 Y116.412 E.01296
G1 X133.657 Y109.127 E.34176
G1 X133.266 Y109.127 E.01296
G1 X132.308 Y110.085 E.04494
G1 X132.481 Y110.238 E.00766
G3 X133.173 Y111.441 I-2.095 J2.005 E.0465
; WIPE_START
G1 F24000
G1 X133.004 Y110.995 E-.18131
G1 X132.481 Y110.238 E-.3497
G1 X132.308 Y110.085 E-.08775
G1 X132.571 Y109.822 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.03 J-1.217 P1  F30000
G1 X127.714 Y109.942 Z2.4
G1 Z2
G1 E.8 F1800
G1 F5520
G1 X129.094 Y108.72 E.06113
G1 X116.824 Y108.72 E.40702
G1 X116.824 Y116.819 E.26867
G1 X129.094 Y116.819 E.40702
G1 X127.669 Y115.557 E.06312
G3 X127.669 Y109.981 I2.007 J-2.788 E.21577
G1 X126.074 Y111.441 F30000
G1 F5520
G3 X126.939 Y110.085 I3.718 J1.416 E.05374
G1 X125.981 Y109.127 E.04494
G1 X125.59 Y109.127 E.01296
G1 X118.305 Y116.412 E.34176
G1 X117.914 Y116.412 E.01296
G1 X117.231 Y115.729 E.03205
G1 X117.231 Y109.81 E.19633
G1 X117.914 Y109.127 E.03205
G1 X118.305 Y109.127 E.01296
G1 X125.59 Y116.412 E.34176
G1 X125.981 Y116.412 E.01296
G1 X126.939 Y115.454 E.04494
G1 X126.766 Y115.301 E.00766
G3 X126.074 Y114.097 I2.095 J-2.005 E.0465
; CHANGE_LAYER
; Z_HEIGHT: 2.06667
; LAYER_HEIGHT: 0.0666666
; WIPE_START
G1 F24000
G1 X126.243 Y114.543 E-.18131
G1 X126.766 Y115.301 E-.34971
G1 X126.939 Y115.454 E-.08774
G1 X126.676 Y115.717 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/135
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
G3 Z2.4 I-.927 J-.789 P1  F30000
G1 X120.939 Y122.461 Z2.4
G1 Z2.067
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.266667
G1 F6686
G1 X121.369 Y122.461 E.01695
G1 X121.369 Y122.246 E.0085
G1 X115.615 Y122.246 E.2268
G1 X115.711 Y128 E.22683
G1 X115.615 Y128 E.00382
G1 X115.615 Y130.877 E.1134
G1 X115.711 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X115.615 Y130.877 E-.03681
G1 X115.615 Y128.974 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.467 I.113 J1.212 P1  F30000
G1 X128.115 Y127.813 Z2.467
G1 Z2.067
G1 E.8 F1800
G1 F6686
G3 X131.908 Y128 I1.891 J.195 E.22743
G1 X128.092 Y128 E.15037
G2 X131.885 Y128.187 I1.901 J-.008 E.22743
; WIPE_START
G1 F24000
G1 X131.689 Y128.886 E-.27595
G1 X131.428 Y129.265 E-.17474
G1 X131.084 Y129.57 E-.17474
G1 X130.77 Y129.734 E-.13457
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.467 I.839 J.881 P1  F30000
G1 X138.631 Y122.246 Z2.467
G1 Z2.067
G1 E.8 F1800
G1 F6686
G1 X144.385 Y122.246 E.2268
G1 X144.385 Y125.123 E.1134
G1 X144.289 Y125.123 E.00382
G1 X144.385 Y130.877 E.22683
G1 X144.289 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X144.385 Y130.877 E-.03681
G1 X144.353 Y128.974 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.467 I1.216 J-.04 P1  F30000
G1 X143.912 Y115.646 Z2.467
G1 Z2.067
G1 E.8 F1800
G1 F6686
G1 X144.009 Y115.646 E.00382
G1 X143.912 Y109.892 E.22683
G1 X144.009 Y109.892 E.00382
G1 X144.009 Y107.015 E.1134
G1 X138.255 Y107.015 E.2268
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.467 I-.684 J-1.007 P1  F30000
G1 X131.508 Y112.956 Z2.467
G1 Z2.067
G1 E.8 F1800
G1 F6686
G3 X127.716 Y112.769 I-1.891 J-.195 E.22743
G1 X131.531 Y112.769 E.15037
G2 X127.739 Y112.582 I-1.901 J.008 E.22743
; WIPE_START
G1 F24000
G1 X127.934 Y111.883 E-.27595
G1 X128.196 Y111.504 E-.17474
G1 X128.54 Y111.199 E-.17474
G1 X128.853 Y111.035 E-.13457
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.467 I.507 J-1.106 P1  F30000
G1 X120.562 Y107.231 Z2.467
G1 Z2.067
G1 E.8 F1800
G1 F6686
G1 X120.992 Y107.231 E.01695
G1 X120.992 Y107.015 E.0085
G1 X115.238 Y107.015 E.2268
G1 X115.335 Y112.769 E.22683
G1 X115.238 Y112.769 E.00382
G1 X115.238 Y115.646 E.1134
G1 X115.335 Y115.646 E.00382
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.133333
; WIPE_START
G1 F24000
G1 X115.238 Y115.646 E-.03681
G1 X115.238 Y113.743 E-.72319
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/135
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
G3 Z2.467 I-.964 J.742 P1  F30000
G1 X127.28 Y129.384 Z2.467
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6686
G1 X127.032 Y128.731 E.02313
G1 X126.943 Y128 E.02444
G1 X127.032 Y127.269 E.02444
G1 X127.294 Y126.58 E.02444
G1 X127.712 Y125.973 E.02444
G1 X128.264 Y125.485 E.02444
G1 X128.916 Y125.142 E.02444
G1 X129.632 Y124.966 E.02444
G1 X130.368 Y124.966 E.02444
G1 X131.084 Y125.142 E.02444
G1 X131.736 Y125.485 E.02444
G1 X132.288 Y125.973 E.02444
G1 X132.706 Y126.58 E.02444
G1 X132.968 Y127.269 E.02444
G1 X133.057 Y128 E.02444
G1 X132.968 Y128.731 E.02444
G1 X132.706 Y129.42 E.02444
G1 X132.288 Y130.027 E.02444
G1 X131.736 Y130.515 E.02444
G1 X131.084 Y130.858 E.02444
G1 X130.368 Y131.034 E.02444
G1 X129.632 Y131.034 E.02444
G1 X128.916 Y130.858 E.02444
G1 X128.264 Y130.515 E.02444
G1 X127.712 Y130.027 E.02444
G1 X127.305 Y129.437 E.02376
G1 X127.643 Y129.237 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6686
G1 X127.416 Y128.637 E.01971
G1 X127.338 Y128 E.01972
G1 X127.416 Y127.363 E.01972
G1 X127.643 Y126.763 E.01972
G1 X128.008 Y126.235 E.01972
G1 X128.488 Y125.81 E.01972
G1 X129.056 Y125.511 E.01972
G1 X129.679 Y125.358 E.01972
G1 X130.321 Y125.358 E.01972
G1 X130.944 Y125.511 E.01972
G1 X131.512 Y125.81 E.01972
G1 X131.992 Y126.235 E.01972
G1 X132.357 Y126.763 E.01972
G1 X132.584 Y127.363 E.01972
G1 X132.662 Y128 E.01972
G1 X132.584 Y128.637 E.01972
G1 X132.357 Y129.237 E.01972
G1 X131.992 Y129.765 E.01972
G1 X131.512 Y130.19 E.01972
G1 X130.944 Y130.489 E.01972
G1 X130.321 Y130.642 E.01972
G1 X129.679 Y130.642 E.01972
G1 X129.056 Y130.489 E.01972
G1 X128.488 Y130.19 E.01972
G1 X128.008 Y129.765 E.01972
G1 X127.677 Y129.286 E.01788
M204 S10000
; WIPE_START
G1 F24000
G1 X127.416 Y128.637 E-.26593
G1 X127.338 Y128 E-.24382
G1 X127.416 Y127.363 E-.24382
G1 X127.422 Y127.347 E-.00643
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.372 J1.159 P1  F30000
G1 X143.148 Y132.398 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6686
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y123.602 E.29177
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y132.338 E.28978
G1 X143.54 Y132.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6686
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y123.21 E.29437
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y132.73 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X141.54 Y132.734 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.581 J1.069 P1  F30000
G1 X142.8 Y132.05 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6686
G1 X130.53 Y132.05 E.40702
G1 X132.55 Y130.259 E.08955
G2 X132.55 Y125.741 I-2.55 J-2.259 E.16389
G1 X130.53 Y123.95 E.08955
G1 X142.8 Y123.95 E.40702
G1 X142.8 Y131.99 E.26668
G1 X133.549 Y129.328 F30000
G1 F6686
G3 X132.685 Y130.685 I-3.718 J-1.416 E.05374
G1 X133.643 Y131.643 E.04494
G1 X134.033 Y131.643 E.01296
G1 X141.319 Y124.357 E.34176
G1 X141.709 Y124.357 E.01296
G1 X142.393 Y125.041 E.03205
G1 X142.393 Y130.959 E.19633
G1 X141.709 Y131.643 E.03205
G1 X141.319 Y131.643 E.01296
G1 X134.033 Y124.357 E.34176
G1 X133.643 Y124.357 E.01296
G1 X132.685 Y125.315 E.04494
G1 X132.857 Y125.469 E.00766
G3 X133.549 Y126.672 I-2.095 J2.005 E.0465
; WIPE_START
G1 F24000
G1 X133.38 Y126.226 E-.18131
G1 X132.857 Y125.469 E-.3497
G1 X132.685 Y125.315 E-.08775
G1 X132.947 Y125.053 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.03 J-1.217 P1  F30000
G1 X128.091 Y125.172 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F6686
G1 X129.47 Y123.95 E.06113
G1 X117.2 Y123.95 E.40702
M73 P36 R15
G1 X117.2 Y132.05 E.26867
G1 X129.47 Y132.05 E.40702
G1 X128.046 Y130.788 E.06312
G3 X128.046 Y125.212 I2.007 J-2.788 E.21577
G1 X126.451 Y126.672 F30000
G1 F6686
G3 X127.315 Y125.315 I3.718 J1.416 E.05374
G1 X126.357 Y124.357 E.04494
G1 X125.967 Y124.357 E.01296
G1 X118.681 Y131.643 E.34176
G1 X118.291 Y131.643 E.01296
G1 X117.607 Y130.959 E.03205
G1 X117.607 Y125.041 E.19633
G1 X118.291 Y124.357 E.03205
G1 X118.681 Y124.357 E.01296
G1 X125.967 Y131.643 E.34176
G1 X126.357 Y131.643 E.01296
G1 X127.315 Y130.685 E.04494
G1 X127.143 Y130.531 E.00766
G3 X126.451 Y129.328 I2.095 J-2.005 E.0465
; WIPE_START
G1 F24000
G1 X126.62 Y129.774 E-.18131
G1 X127.143 Y130.531 E-.34971
G1 X127.315 Y130.685 E-.08774
G1 X127.053 Y130.947 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.217 J-.011 P1  F30000
G1 X126.903 Y114.153 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6686
G1 X126.656 Y113.501 E.02313
G1 X126.567 Y112.769 E.02444
G1 X126.656 Y112.038 E.02444
G1 X126.917 Y111.349 E.02444
G1 X127.336 Y110.742 E.02444
G1 X127.887 Y110.254 E.02444
G1 X128.54 Y109.911 E.02444
G1 X129.255 Y109.735 E.02444
G1 X129.992 Y109.735 E.02444
G1 X130.707 Y109.911 E.02444
G1 X131.36 Y110.254 E.02444
G1 X131.911 Y110.742 E.02444
G1 X132.33 Y111.349 E.02444
G1 X132.591 Y112.038 E.02444
G1 X132.68 Y112.769 E.02444
G1 X132.591 Y113.501 E.02444
G1 X132.33 Y114.19 E.02444
G1 X131.911 Y114.796 E.02444
G1 X131.36 Y115.285 E.02444
G1 X130.707 Y115.627 E.02444
G1 X129.992 Y115.803 E.02444
G1 X129.255 Y115.803 E.02444
G1 X128.54 Y115.627 E.02444
G1 X127.887 Y115.285 E.02444
G1 X127.336 Y114.796 E.02444
G1 X126.929 Y114.207 E.02376
G1 X127.267 Y114.006 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6686
G1 X127.039 Y113.406 E.01971
G1 X126.962 Y112.769 E.01972
G1 X127.039 Y112.132 E.01972
G1 X127.267 Y111.532 E.01972
G1 X127.631 Y111.004 E.01972
G1 X128.112 Y110.579 E.01972
G1 X128.68 Y110.281 E.01972
G1 X129.303 Y110.127 E.01972
G1 X129.944 Y110.127 E.01972
G1 X130.567 Y110.281 E.01972
G1 X131.135 Y110.579 E.01972
G1 X131.616 Y111.004 E.01972
G1 X131.98 Y111.532 E.01972
G1 X132.208 Y112.132 E.01972
G1 X132.285 Y112.769 E.01972
G1 X132.208 Y113.406 E.01972
G1 X131.98 Y114.006 E.01972
G1 X131.616 Y114.534 E.01972
G1 X131.135 Y114.96 E.01972
G1 X130.567 Y115.258 E.01972
G1 X129.944 Y115.411 E.01972
G1 X129.303 Y115.411 E.01972
G1 X128.68 Y115.258 E.01972
G1 X128.112 Y114.96 E.01972
G1 X127.631 Y114.534 E.01972
G1 X127.301 Y114.055 E.01788
M204 S10000
; WIPE_START
G1 F24000
G1 X127.039 Y113.406 E-.26593
G1 X126.962 Y112.769 E-.24382
G1 X127.039 Y112.132 E-.24382
G1 X127.045 Y112.116 E-.00643
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.372 J1.159 P1  F30000
G1 X142.771 Y117.167 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6686
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y108.371 E.29177
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y117.107 E.28978
G1 X143.163 Y117.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6686
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y107.979 E.29437
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y117.499 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X141.163 Y117.504 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.581 J1.069 P1  F30000
G1 X142.423 Y116.819 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6686
G1 X130.153 Y116.819 E.40702
G1 X132.174 Y115.029 E.08955
G2 X132.174 Y110.51 I-2.55 J-2.259 E.16389
G1 X130.153 Y108.72 E.08955
G1 X142.423 Y108.72 E.40702
G1 X142.423 Y116.759 E.26668
G1 X133.173 Y114.097 F30000
G1 F6686
G3 X132.308 Y115.454 I-3.718 J-1.416 E.05374
G1 X133.266 Y116.412 E.04494
G1 X133.657 Y116.412 E.01296
G1 X140.942 Y109.127 E.34176
G1 X141.333 Y109.127 E.01296
G1 X142.016 Y109.81 E.03205
G1 X142.016 Y115.729 E.19633
G1 X141.333 Y116.412 E.03205
G1 X140.942 Y116.412 E.01296
G1 X133.657 Y109.127 E.34176
G1 X133.266 Y109.127 E.01296
G1 X132.308 Y110.085 E.04494
G1 X132.481 Y110.238 E.00766
G3 X133.173 Y111.441 I-2.095 J2.005 E.0465
; WIPE_START
G1 F24000
G1 X133.004 Y110.995 E-.18131
G1 X132.481 Y110.238 E-.3497
G1 X132.308 Y110.085 E-.08775
G1 X132.571 Y109.822 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.03 J-1.217 P1  F30000
G1 X127.714 Y109.942 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F6686
G1 X129.094 Y108.72 E.06113
G1 X116.824 Y108.72 E.40702
G1 X116.824 Y116.819 E.26867
G1 X129.094 Y116.819 E.40702
G1 X127.669 Y115.557 E.06312
G3 X127.669 Y109.981 I2.007 J-2.788 E.21577
G1 X126.074 Y111.441 F30000
G1 F6686
G3 X126.939 Y110.085 I3.718 J1.416 E.05374
G1 X125.981 Y109.127 E.04494
G1 X125.59 Y109.127 E.01296
G1 X118.305 Y116.412 E.34176
G1 X117.914 Y116.412 E.01296
G1 X117.231 Y115.729 E.03205
G1 X117.231 Y109.81 E.19633
G1 X117.914 Y109.127 E.03205
G1 X118.305 Y109.127 E.01296
G1 X125.59 Y116.412 E.34176
G1 X125.981 Y116.412 E.01296
G1 X126.939 Y115.454 E.04494
G1 X126.766 Y115.301 E.00766
G3 X126.074 Y114.097 I2.095 J-2.005 E.0465
; CHANGE_LAYER
; Z_HEIGHT: 2.33333
; LAYER_HEIGHT: 0.133333
; WIPE_START
G1 F24000
G1 X126.243 Y114.543 E-.18131
G1 X126.766 Y115.301 E-.34971
G1 X126.939 Y115.454 E-.08774
G1 X126.676 Y115.717 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/135
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
G3 Z2.6 I-.927 J-.789 P1  F30000
G1 X120.939 Y122.461 Z2.6
G1 Z2.333
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.266667
G1 F6686
G1 X121.369 Y122.461 E.01695
G1 X121.369 Y122.246 E.0085
G1 X115.615 Y122.246 E.2268
G1 X115.711 Y128 E.22683
G1 X115.615 Y128 E.00382
G1 X115.615 Y130.877 E.1134
G1 X115.711 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X115.615 Y130.877 E-.03681
G1 X115.615 Y128.974 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.733 I.113 J1.212 P1  F30000
G1 X128.115 Y127.813 Z2.733
G1 Z2.333
G1 E.8 F1800
G1 F6686
G3 X131.908 Y128 I1.891 J.195 E.22743
G1 X128.092 Y128 E.15037
G2 X131.885 Y128.187 I1.901 J-.008 E.22743
; WIPE_START
G1 F24000
G1 X131.689 Y128.886 E-.27595
G1 X131.428 Y129.265 E-.17474
G1 X131.084 Y129.57 E-.17474
G1 X130.77 Y129.734 E-.13457
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.733 I.839 J.881 P1  F30000
G1 X138.631 Y122.246 Z2.733
G1 Z2.333
G1 E.8 F1800
G1 F6686
G1 X144.385 Y122.246 E.2268
G1 X144.385 Y125.123 E.1134
G1 X144.289 Y125.123 E.00382
G1 X144.385 Y130.877 E.22683
G1 X144.289 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X144.385 Y130.877 E-.03681
G1 X144.353 Y128.974 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.733 I1.216 J-.04 P1  F30000
G1 X143.912 Y115.646 Z2.733
G1 Z2.333
G1 E.8 F1800
G1 F6686
G1 X144.009 Y115.646 E.00382
G1 X143.912 Y109.892 E.22683
G1 X144.009 Y109.892 E.00382
G1 X144.009 Y107.015 E.1134
G1 X138.255 Y107.015 E.2268
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.733 I-.684 J-1.007 P1  F30000
G1 X131.508 Y112.956 Z2.733
G1 Z2.333
G1 E.8 F1800
G1 F6686
G3 X127.716 Y112.769 I-1.891 J-.195 E.22743
G1 X131.531 Y112.769 E.15037
G2 X127.739 Y112.582 I-1.901 J.008 E.22743
; WIPE_START
G1 F24000
G1 X127.934 Y111.883 E-.27595
G1 X128.196 Y111.504 E-.17474
G1 X128.54 Y111.199 E-.17474
G1 X128.853 Y111.035 E-.13457
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.733 I.507 J-1.106 P1  F30000
G1 X120.562 Y107.231 Z2.733
G1 Z2.333
G1 E.8 F1800
G1 F6686
G1 X120.992 Y107.231 E.01695
G1 X120.992 Y107.015 E.0085
G1 X115.238 Y107.015 E.2268
G1 X115.335 Y112.769 E.22683
G1 X115.238 Y112.769 E.00382
G1 X115.238 Y115.646 E.1134
G1 X115.335 Y115.646 E.00382
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.0666668
; WIPE_START
G1 F24000
G1 X115.238 Y115.646 E-.03681
G1 X115.238 Y113.743 E-.72319
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/135
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
G3 Z2.733 I-.964 J.742 P1  F30000
G1 X127.28 Y129.384 Z2.733
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6686
G1 X127.032 Y128.731 E.02314
G1 X126.943 Y128 E.02444
G1 X127.032 Y127.269 E.02444
G1 X127.294 Y126.58 E.02444
G1 X127.712 Y125.973 E.02444
G1 X128.264 Y125.485 E.02444
G1 X128.916 Y125.142 E.02444
G1 X129.632 Y124.966 E.02444
G1 X130.368 Y124.966 E.02444
G1 X131.084 Y125.142 E.02444
G1 X131.736 Y125.485 E.02444
G1 X132.288 Y125.973 E.02444
G1 X132.706 Y126.58 E.02444
G1 X132.968 Y127.269 E.02444
G1 X133.057 Y128 E.02444
G1 X132.968 Y128.731 E.02444
G1 X132.706 Y129.42 E.02444
G1 X132.288 Y130.027 E.02444
G1 X131.736 Y130.515 E.02444
G1 X131.084 Y130.858 E.02444
G1 X130.368 Y131.034 E.02444
G1 X129.632 Y131.034 E.02444
G1 X128.916 Y130.858 E.02444
G1 X128.264 Y130.515 E.02444
G1 X127.712 Y130.027 E.02444
G1 X127.305 Y129.437 E.02376
G1 X127.643 Y129.236 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6686
G1 X127.416 Y128.637 E.01969
G1 X127.338 Y128 E.01972
G1 X127.416 Y127.363 E.01972
G1 X127.643 Y126.763 E.01972
G1 X128.008 Y126.235 E.01972
G1 X128.488 Y125.81 E.01972
G1 X129.056 Y125.511 E.01972
G1 X129.679 Y125.358 E.01972
G1 X130.321 Y125.358 E.01972
G1 X130.944 Y125.511 E.01972
G1 X131.512 Y125.81 E.01972
G1 X131.992 Y126.235 E.01972
G1 X132.357 Y126.763 E.01972
G1 X132.584 Y127.363 E.01972
G1 X132.662 Y128 E.01972
G1 X132.584 Y128.637 E.01972
G1 X132.357 Y129.237 E.01972
G1 X131.992 Y129.765 E.01972
G1 X131.512 Y130.19 E.01972
G1 X130.944 Y130.489 E.01972
G1 X130.321 Y130.642 E.01972
G1 X129.679 Y130.642 E.01972
G1 X129.056 Y130.489 E.01972
G1 X128.488 Y130.19 E.01972
G1 X128.008 Y129.765 E.01972
G1 X127.677 Y129.286 E.0179
M204 S10000
; WIPE_START
G1 F24000
G1 X127.416 Y128.637 E-.26573
G1 X127.338 Y128 E-.24382
G1 X127.416 Y127.363 E-.24382
G1 X127.422 Y127.347 E-.00663
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.372 J1.159 P1  F30000
G1 X143.148 Y132.398 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6686
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y123.602 E.29177
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y132.338 E.28978
G1 X143.54 Y132.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6686
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y123.21 E.29437
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y132.73 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X141.54 Y132.734 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.581 J1.069 P1  F30000
G1 X142.8 Y132.05 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6686
G1 X130.53 Y132.05 E.40702
G1 X132.55 Y130.259 E.08955
G2 X132.55 Y125.741 I-2.55 J-2.259 E.16389
G1 X130.53 Y123.95 E.08955
G1 X142.8 Y123.95 E.40702
G1 X142.8 Y131.99 E.26668
G1 X133.549 Y129.328 F30000
G1 F6686
G3 X132.685 Y130.685 I-3.718 J-1.416 E.05374
G1 X133.643 Y131.643 E.04494
G1 X134.033 Y131.643 E.01296
G1 X141.319 Y124.357 E.34176
G1 X141.709 Y124.357 E.01296
G1 X142.393 Y125.041 E.03205
G1 X142.393 Y130.959 E.19633
G1 X141.709 Y131.643 E.03205
G1 X141.319 Y131.643 E.01296
G1 X134.033 Y124.357 E.34176
G1 X133.643 Y124.357 E.01296
G1 X132.685 Y125.315 E.04494
G1 X132.857 Y125.469 E.00766
G3 X133.549 Y126.672 I-2.095 J2.005 E.0465
; WIPE_START
G1 F24000
G1 X133.38 Y126.226 E-.18131
G1 X132.857 Y125.469 E-.3497
G1 X132.685 Y125.315 E-.08775
G1 X132.947 Y125.053 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.03 J-1.217 P1  F30000
G1 X128.091 Y125.172 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F6686
G1 X129.47 Y123.95 E.06113
G1 X117.2 Y123.95 E.40702
G1 X117.2 Y132.05 E.26867
G1 X129.47 Y132.05 E.40702
G1 X128.046 Y130.788 E.06312
G3 X128.046 Y125.212 I2.007 J-2.788 E.21577
G1 X126.451 Y126.672 F30000
G1 F6686
G3 X127.315 Y125.315 I3.718 J1.416 E.05374
G1 X126.357 Y124.357 E.04494
G1 X125.967 Y124.357 E.01296
G1 X118.681 Y131.643 E.34176
G1 X118.291 Y131.643 E.01296
G1 X117.607 Y130.959 E.03205
G1 X117.607 Y125.041 E.19633
G1 X118.291 Y124.357 E.03205
G1 X118.681 Y124.357 E.01296
G1 X125.967 Y131.643 E.34176
G1 X126.357 Y131.643 E.01296
G1 X127.315 Y130.685 E.04494
G1 X127.143 Y130.531 E.00766
G3 X126.451 Y129.328 I2.095 J-2.005 E.0465
; WIPE_START
G1 F24000
G1 X126.62 Y129.774 E-.18131
G1 X127.143 Y130.531 E-.34971
G1 X127.315 Y130.685 E-.08774
G1 X127.053 Y130.947 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.217 J-.011 P1  F30000
G1 X126.903 Y114.153 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6686
G1 X126.656 Y113.501 E.02314
G1 X126.567 Y112.769 E.02444
G1 X126.656 Y112.038 E.02444
G1 X126.917 Y111.349 E.02444
G1 X127.336 Y110.742 E.02444
G1 X127.887 Y110.254 E.02444
G1 X128.54 Y109.911 E.02444
G1 X129.255 Y109.735 E.02444
G1 X129.992 Y109.735 E.02444
G1 X130.707 Y109.911 E.02444
G1 X131.36 Y110.254 E.02444
G1 X131.911 Y110.742 E.02444
G1 X132.33 Y111.349 E.02444
G1 X132.591 Y112.038 E.02444
G1 X132.68 Y112.769 E.02444
M73 P37 R15
G1 X132.591 Y113.501 E.02444
G1 X132.33 Y114.19 E.02444
G1 X131.911 Y114.796 E.02444
G1 X131.36 Y115.285 E.02444
G1 X130.707 Y115.627 E.02444
G1 X129.992 Y115.803 E.02444
G1 X129.255 Y115.803 E.02444
G1 X128.54 Y115.627 E.02444
G1 X127.887 Y115.285 E.02444
G1 X127.336 Y114.796 E.02444
G1 X126.929 Y114.207 E.02376
G1 X127.266 Y114.005 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6686
G1 X127.039 Y113.406 E.01969
G1 X126.962 Y112.769 E.01972
G1 X127.039 Y112.132 E.01972
G1 X127.267 Y111.532 E.01972
G1 X127.631 Y111.004 E.01972
G1 X128.112 Y110.579 E.01972
G1 X128.68 Y110.281 E.01972
G1 X129.303 Y110.127 E.01972
G1 X129.944 Y110.127 E.01972
G1 X130.567 Y110.281 E.01972
G1 X131.135 Y110.579 E.01972
G1 X131.616 Y111.004 E.01972
G1 X131.98 Y111.532 E.01972
G1 X132.208 Y112.132 E.01972
G1 X132.285 Y112.769 E.01972
G1 X132.208 Y113.406 E.01972
G1 X131.98 Y114.006 E.01972
G1 X131.616 Y114.534 E.01972
G1 X131.135 Y114.96 E.01972
G1 X130.567 Y115.258 E.01972
G1 X129.944 Y115.411 E.01972
G1 X129.303 Y115.411 E.01972
G1 X128.68 Y115.258 E.01972
G1 X128.112 Y114.96 E.01972
G1 X127.631 Y114.534 E.01972
G1 X127.3 Y114.055 E.0179
M204 S10000
; WIPE_START
G1 F24000
G1 X127.039 Y113.406 E-.26573
G1 X126.962 Y112.769 E-.24382
G1 X127.039 Y112.132 E-.24382
G1 X127.045 Y112.116 E-.00663
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.372 J1.159 P1  F30000
G1 X142.771 Y117.167 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6686
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y108.371 E.29177
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y117.107 E.28978
G1 X143.163 Y117.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6686
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y107.979 E.29437
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y117.499 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X141.163 Y117.504 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.581 J1.069 P1  F30000
G1 X142.423 Y116.819 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6686
G1 X130.153 Y116.819 E.40702
G1 X132.174 Y115.029 E.08955
G2 X132.174 Y110.51 I-2.55 J-2.259 E.16389
G1 X130.153 Y108.72 E.08955
G1 X142.423 Y108.72 E.40702
G1 X142.423 Y116.759 E.26668
G1 X133.173 Y114.097 F30000
G1 F6686
G3 X132.308 Y115.454 I-3.718 J-1.416 E.05374
G1 X133.266 Y116.412 E.04494
G1 X133.657 Y116.412 E.01296
G1 X140.942 Y109.127 E.34176
G1 X141.333 Y109.127 E.01296
G1 X142.016 Y109.81 E.03205
G1 X142.016 Y115.729 E.19633
G1 X141.333 Y116.412 E.03205
G1 X140.942 Y116.412 E.01296
G1 X133.657 Y109.127 E.34176
G1 X133.266 Y109.127 E.01296
G1 X132.308 Y110.085 E.04494
G1 X132.481 Y110.238 E.00766
G3 X133.173 Y111.441 I-2.095 J2.005 E.0465
; WIPE_START
G1 F24000
G1 X133.004 Y110.995 E-.18131
G1 X132.481 Y110.238 E-.3497
G1 X132.308 Y110.085 E-.08775
G1 X132.571 Y109.822 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.03 J-1.217 P1  F30000
G1 X127.714 Y109.942 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F6686
G1 X129.094 Y108.72 E.06113
G1 X116.824 Y108.72 E.40702
G1 X116.824 Y116.819 E.26867
G1 X129.094 Y116.819 E.40702
G1 X127.669 Y115.557 E.06312
G3 X127.669 Y109.981 I2.007 J-2.788 E.21577
G1 X126.074 Y111.441 F30000
G1 F6686
G3 X126.939 Y110.085 I3.718 J1.416 E.05374
G1 X125.981 Y109.127 E.04494
G1 X125.59 Y109.127 E.01296
G1 X118.305 Y116.412 E.34176
G1 X117.914 Y116.412 E.01296
G1 X117.231 Y115.729 E.03205
G1 X117.231 Y109.81 E.19633
G1 X117.914 Y109.127 E.03205
G1 X118.305 Y109.127 E.01296
G1 X125.59 Y116.412 E.34176
G1 X125.981 Y116.412 E.01296
G1 X126.939 Y115.454 E.04494
G1 X126.766 Y115.301 E.00766
G3 X126.074 Y114.097 I2.095 J-2.005 E.0465
M106 S232.05
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.243 Y114.543 E-.18131
G1 X126.766 Y115.301 E-.34971
G1 X126.939 Y115.454 E-.08774
G1 X126.676 Y115.717 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/135
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
G3 Z2.8 I-.927 J-.789 P1  F30000
G1 X120.939 Y122.461 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.266667
G1 F9000
G1 X121.369 Y122.461 E.01695
G1 X121.369 Y122.246 E.0085
G1 X115.615 Y122.246 E.2268
G1 X115.711 Y128 E.22683
G1 X115.615 Y128 E.00382
G1 X115.615 Y130.877 E.1134
G1 X115.711 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X115.615 Y130.877 E-.03681
G1 X115.615 Y128.974 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.113 J1.212 P1  F30000
G1 X128.115 Y127.813 Z3
G1 Z2.6
G1 E.8 F1800
G1 F9000
G3 X131.908 Y128 I1.891 J.197 E.22729
G1 X128.092 Y128 E.15037
G2 X131.885 Y128.187 I1.901 J-.008 E.22743
; WIPE_START
G1 F24000
G1 X131.689 Y128.886 E-.27595
G1 X131.428 Y129.265 E-.17474
G1 X131.084 Y129.57 E-.17474
G1 X130.77 Y129.734 E-.13457
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.839 J.881 P1  F30000
G1 X138.631 Y122.246 Z3
G1 Z2.6
G1 E.8 F1800
G1 F9000
G1 X144.385 Y122.246 E.2268
G1 X144.385 Y125.123 E.1134
G1 X144.289 Y125.123 E.00382
G1 X144.385 Y130.877 E.22683
G1 X144.289 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X144.385 Y130.877 E-.03681
G1 X144.353 Y128.974 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.029 J-1.217 P1  F30000
G1 X127.28 Y129.384 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X127.032 Y128.731 E.02314
G1 X126.943 Y128 E.02444
G1 X127.032 Y127.269 E.02444
G1 X127.294 Y126.58 E.02444
G1 X127.712 Y125.973 E.02444
G1 X128.264 Y125.485 E.02444
G1 X128.916 Y125.142 E.02444
G1 X129.632 Y124.966 E.02444
G1 X130.368 Y124.966 E.02444
G1 X131.084 Y125.142 E.02444
G1 X131.736 Y125.485 E.02444
G1 X132.288 Y125.973 E.02444
G1 X132.706 Y126.58 E.02444
G1 X132.968 Y127.269 E.02444
G1 X133.057 Y128 E.02444
G1 X132.968 Y128.731 E.02444
G1 X132.706 Y129.42 E.02444
G1 X132.288 Y130.027 E.02444
G1 X131.736 Y130.515 E.02444
G1 X131.084 Y130.858 E.02444
G1 X130.368 Y131.034 E.02444
G1 X129.632 Y131.034 E.02444
G1 X128.916 Y130.858 E.02444
G1 X128.264 Y130.515 E.02444
G1 X127.712 Y130.027 E.02444
G1 X127.305 Y129.437 E.02375
G1 X127.643 Y129.236 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X127.416 Y128.637 E.01968
G1 X127.338 Y128 E.01972
G1 X127.416 Y127.363 E.01972
G1 X127.643 Y126.763 E.01972
G1 X128.008 Y126.235 E.01972
G1 X128.488 Y125.81 E.01972
G1 X129.056 Y125.511 E.01972
G1 X129.679 Y125.358 E.01972
G1 X130.321 Y125.358 E.01972
G1 X130.944 Y125.511 E.01972
G1 X131.512 Y125.81 E.01972
G1 X131.992 Y126.235 E.01972
G1 X132.357 Y126.763 E.01972
G1 X132.584 Y127.363 E.01972
G1 X132.662 Y128 E.01972
G1 X132.584 Y128.637 E.01972
G1 X132.357 Y129.237 E.01972
G1 X131.992 Y129.765 E.01972
G1 X131.512 Y130.19 E.01972
G1 X130.944 Y130.489 E.01972
G1 X130.321 Y130.642 E.01972
G1 X129.679 Y130.642 E.01972
G1 X129.056 Y130.489 E.01972
G1 X128.488 Y130.19 E.01972
G1 X128.008 Y129.765 E.01972
G1 X127.677 Y129.285 E.01791
M204 S10000
; WIPE_START
G1 F24000
G1 X127.416 Y128.637 E-.26554
G1 X127.338 Y128 E-.24382
G1 X127.416 Y127.363 E-.24382
G1 X127.422 Y127.346 E-.00682
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.372 J1.159 P1  F30000
G1 X143.148 Y132.398 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y123.602 E.29177
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y132.338 E.28978
G1 X143.54 Y132.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y123.21 E.29437
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y132.73 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X141.54 Y132.734 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.197 J.217 P1  F30000
G1 X142.981 Y124.778 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40339
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X142.304 Y123.972 E.05481
G1 X141.712 Y123.972 E.03082
G1 X142.778 Y125.242 E.08635
G1 X142.778 Y125.947 E.03673
G1 X141.12 Y123.972 E.13429
G1 X140.529 Y123.972 E.03082
G1 X142.778 Y126.653 E.18224
G1 X142.778 Y127.358 E.03673
G1 X139.937 Y123.972 E.23019
G1 X139.345 Y123.972 E.03082
G1 X142.778 Y128.064 E.27813
G1 X142.778 Y128.769 E.03673
G1 X138.753 Y123.972 E.32608
G1 X138.161 Y123.972 E.03082
G1 X142.778 Y129.474 E.37402
G1 X142.778 Y130.18 E.03673
G1 X137.569 Y123.972 E.42197
G1 X136.977 Y123.972 E.03082
G1 X142.778 Y130.885 E.46992
G1 X142.778 Y131.59 E.03673
G1 X136.386 Y123.972 E.51786
G1 X135.794 Y123.972 E.03082
G1 X142.554 Y132.028 E.54763
G1 X141.962 Y132.028 E.03082
G1 X135.202 Y123.972 E.54763
G1 X134.61 Y123.972 E.03082
G1 X141.37 Y132.028 E.54763
G1 X140.778 Y132.028 E.03082
G1 X134.018 Y123.972 E.54763
G1 X133.426 Y123.972 E.03082
G1 X140.186 Y132.028 E.54763
G1 X139.595 Y132.028 E.03082
G1 X132.834 Y123.972 E.54763
G1 X132.243 Y123.972 E.03082
G1 X139.003 Y132.028 E.54763
G1 X138.411 Y132.028 E.03082
G1 X131.651 Y123.972 E.54763
G1 X131.059 Y123.972 E.03082
G1 X137.819 Y132.028 E.54763
G1 X137.227 Y132.028 E.03082
G1 X133.358 Y127.417 E.31341
G1 X133.429 Y128 E.03056
G1 X133.407 Y128.181 E.00949
G1 X136.635 Y132.028 E.26152
G1 X136.043 Y132.028 E.03082
G1 X133.332 Y128.797 E.21963
G1 X133.152 Y129.288 E.02722
G1 X135.452 Y132.028 E.18627
G1 X134.86 Y132.028 E.03082
G1 X132.937 Y129.737 E.15574
G1 X132.67 Y130.124 E.02449
G1 X134.268 Y132.028 E.12944
G1 X133.676 Y132.028 E.03082
G1 X132.359 Y130.458 E.10672
G1 X132.019 Y130.759 E.02362
G1 X133.084 Y132.028 E.08628
G1 X132.492 Y132.028 E.03082
G1 X131.68 Y131.06 E.06583
G1 X131.34 Y131.36 E.02362
G1 X131.9 Y132.028 E.04539
G1 X131.308 Y132.028 E.03082
G1 X131.001 Y131.661 E.02495
G1 X130.661 Y131.962 E.02362
G1 X130.887 Y132.231 E.01827
M106 S232.05
G1 X130.628 Y131.402 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.474971
; LAYER_HEIGHT: 0.2
G1 F14581.612
G1 X130.393 Y131.454 E.00845
G1 X129.607 Y131.454 E.02768
G1 X129.372 Y131.402 E.00845
G1 X130 Y131.958 E.02952
G1 X130.583 Y131.442 E.0274
G1 X129.111 Y132.231 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40339
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X122.181 Y123.972 E.56139
G1 X121.589 Y123.972 E.03082
G1 X128.349 Y132.028 E.54763
G1 X127.757 Y132.028 E.03082
G1 X120.997 Y123.972 E.54763
G1 X120.405 Y123.972 E.03082
G1 X127.165 Y132.028 E.54763
G1 X126.574 Y132.028 E.03082
G1 X119.814 Y123.972 E.54763
G1 X119.222 Y123.972 E.03082
G1 X125.982 Y132.028 E.54763
G1 X125.39 Y132.028 E.03082
G1 X118.63 Y123.972 E.54763
G1 X118.038 Y123.972 E.03082
G1 X124.798 Y132.028 E.54763
G1 X124.206 Y132.028 E.03082
M73 P37 R14
G1 X117.446 Y123.972 E.54763
G1 X117.222 Y123.972 E.01168
G1 X117.222 Y124.41 E.02281
G1 X123.614 Y132.028 E.51785
G1 X123.022 Y132.028 E.03082
G1 X117.222 Y125.115 E.46991
G1 X117.222 Y125.821 E.03673
G1 X122.431 Y132.028 E.42196
G1 X121.839 Y132.028 E.03082
G1 X117.222 Y126.526 E.37401
G1 X117.222 Y127.231 E.03673
G1 X121.247 Y132.028 E.32607
G1 X120.655 Y132.028 E.03082
G1 X117.222 Y127.937 E.27812
G1 X117.222 Y128.642 E.03673
G1 X120.063 Y132.028 E.23018
G1 X119.471 Y132.028 E.03082
G1 X117.222 Y129.347 E.18223
G1 X117.222 Y130.053 E.03673
G1 X118.879 Y132.028 E.13429
G1 X118.288 Y132.028 E.03082
G1 X117.222 Y130.758 E.08634
G1 X117.222 Y131.463 E.03673
G1 X117.866 Y132.231 E.05216
M106 S232.05
G1 X126.925 Y128.92 F30000
M106 S255
G1 F3000
G1 X122.773 Y123.972 E.33637
G1 X123.365 Y123.972 E.03082
G1 X126.593 Y127.819 E.26152
G1 X126.668 Y127.203 E.03232
G1 X123.957 Y123.972 E.21964
G1 X124.548 Y123.972 E.03082
G1 X126.848 Y126.712 E.18628
G1 X126.964 Y126.406 E.01703
G1 X127.063 Y126.263 E.00908
G1 X125.14 Y123.972 E.15575
G1 X125.732 Y123.972 E.03082
G1 X127.33 Y125.876 E.12944
G3 X127.641 Y125.542 I.834 J.465 E.02402
G1 X126.324 Y123.972 E.10673
G1 X126.916 Y123.972 E.03082
G1 X127.981 Y125.241 E.08628
G1 X128.32 Y124.94 E.02362
G1 X127.508 Y123.972 E.06584
M73 P38 R14
G1 X128.1 Y123.972 E.03082
G1 X128.66 Y124.64 E.04539
G1 X128.999 Y124.339 E.02362
G1 X128.691 Y123.972 E.02495
G1 X129.283 Y123.972 E.03082
G1 X129.469 Y124.193 E.01505
M106 S232.05
G1 X130.628 Y124.598 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.474971
; LAYER_HEIGHT: 0.2
G1 F14581.612
G1 X130 Y124.042 E.02952
G1 X129.372 Y124.598 E.02952
G1 X129.607 Y124.546 E.00845
G1 X130.393 Y124.546 E.02768
G1 X130.569 Y124.585 E.00634
; WIPE_START
G1 F24000
G1 X130.393 Y124.546 E-.06839
G1 X129.607 Y124.546 E-.29878
G1 X129.372 Y124.598 E-.09118
G1 X129.967 Y124.071 E-.30166
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.205 J.167 P1  F30000
G1 X131.508 Y112.956 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.266667
G1 F9000
G3 X127.716 Y112.769 I-1.891 J-.195 E.22743
G1 X131.531 Y112.769 E.15037
G2 X127.739 Y112.582 I-1.901 J.009 E.22729
; WIPE_START
G1 F24000
G1 X127.934 Y111.883 E-.27595
G1 X128.196 Y111.504 E-.17474
G1 X128.54 Y111.199 E-.17474
G1 X128.853 Y111.035 E-.13457
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.507 J-1.106 P1  F30000
G1 X120.562 Y107.231 Z3
G1 Z2.6
G1 E.8 F1800
G1 F9000
G1 X120.992 Y107.231 E.01695
G1 X120.992 Y107.015 E.0085
G1 X115.238 Y107.015 E.2268
G1 X115.335 Y112.769 E.22683
G1 X115.238 Y112.769 E.00382
G1 X115.238 Y115.646 E.1134
G1 X115.335 Y115.646 E.00382
; WIPE_START
G1 F24000
G1 X115.238 Y115.646 E-.03681
G1 X115.238 Y113.743 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.341 J1.168 P1  F30000
G1 X138.255 Y107.015 Z3
G1 Z2.6
G1 E.8 F1800
G1 F9000
G1 X144.009 Y107.015 E.2268
G1 X144.009 Y109.892 E.1134
G1 X143.912 Y109.892 E.00382
G1 X144.009 Y115.646 E.22683
G1 X143.912 Y115.646 E.00382
; WIPE_START
G1 F24000
G1 X144.009 Y115.646 E-.03681
G1 X143.977 Y113.743 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.029 J-1.217 P1  F30000
G1 X126.903 Y114.153 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X126.656 Y113.501 E.02314
G1 X126.567 Y112.769 E.02444
G1 X126.656 Y112.038 E.02444
G1 X126.917 Y111.349 E.02444
G1 X127.336 Y110.742 E.02444
G1 X127.887 Y110.254 E.02444
G1 X128.54 Y109.911 E.02444
G1 X129.255 Y109.735 E.02444
G1 X129.992 Y109.735 E.02444
G1 X130.707 Y109.911 E.02444
G1 X131.36 Y110.254 E.02444
G1 X131.911 Y110.742 E.02444
G1 X132.33 Y111.349 E.02444
G1 X132.591 Y112.038 E.02444
G1 X132.68 Y112.769 E.02444
G1 X132.591 Y113.501 E.02444
G1 X132.33 Y114.19 E.02444
G1 X131.911 Y114.796 E.02444
G1 X131.36 Y115.285 E.02444
G1 X130.707 Y115.627 E.02444
G1 X129.992 Y115.803 E.02444
G1 X129.255 Y115.803 E.02444
G1 X128.54 Y115.627 E.02444
G1 X127.887 Y115.285 E.02444
G1 X127.336 Y114.796 E.02444
G1 X126.929 Y114.207 E.02375
G1 X127.266 Y114.005 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X127.039 Y113.406 E.01968
G1 X126.962 Y112.769 E.01972
G1 X127.039 Y112.132 E.01972
G1 X127.267 Y111.532 E.01972
G1 X127.631 Y111.004 E.01972
G1 X128.112 Y110.579 E.01972
G1 X128.68 Y110.281 E.01972
G1 X129.303 Y110.127 E.01972
G1 X129.944 Y110.127 E.01972
G1 X130.567 Y110.281 E.01972
G1 X131.135 Y110.579 E.01972
G1 X131.616 Y111.004 E.01972
G1 X131.98 Y111.532 E.01972
G1 X132.208 Y112.132 E.01972
G1 X132.285 Y112.769 E.01972
G1 X132.208 Y113.406 E.01972
G1 X131.98 Y114.006 E.01972
G1 X131.616 Y114.534 E.01972
G1 X131.135 Y114.96 E.01972
G1 X130.567 Y115.258 E.01972
G1 X129.944 Y115.411 E.01972
G1 X129.303 Y115.411 E.01972
G1 X128.68 Y115.258 E.01972
G1 X128.112 Y114.96 E.01972
G1 X127.631 Y114.534 E.01972
G1 X127.3 Y114.054 E.01791
M204 S10000
; WIPE_START
G1 F24000
G1 X127.039 Y113.406 E-.26554
G1 X126.962 Y112.769 E-.24382
G1 X127.039 Y112.132 E-.24382
G1 X127.046 Y112.116 E-.00682
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.372 J1.159 P1  F30000
G1 X142.771 Y117.167 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y108.371 E.29177
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y117.107 E.28978
G1 X143.163 Y117.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y107.979 E.29437
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y117.499 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X141.163 Y117.504 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.197 J.217 P1  F30000
G1 X142.604 Y109.547 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40339
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X141.928 Y108.741 E.05481
G1 X141.336 Y108.741 E.03082
G1 X142.402 Y110.011 E.08635
G1 X142.402 Y110.717 E.03673
G1 X140.744 Y108.741 E.13429
G1 X140.152 Y108.741 E.03082
G1 X142.402 Y111.422 E.18224
G1 X142.402 Y112.127 E.03673
G1 X139.56 Y108.741 E.23019
G1 X138.968 Y108.741 E.03082
G1 X142.402 Y112.833 E.27813
G1 X142.402 Y113.538 E.03673
G1 X138.376 Y108.741 E.32608
G1 X137.785 Y108.741 E.03082
G1 X142.402 Y114.243 E.37402
G1 X142.402 Y114.949 E.03673
G1 X137.193 Y108.741 E.42197
G1 X136.601 Y108.741 E.03082
G1 X142.402 Y115.654 E.46992
G1 X142.402 Y116.36 E.03673
G1 X136.009 Y108.741 E.51786
G1 X135.417 Y108.741 E.03082
G1 X142.177 Y116.797 E.54763
G1 X141.585 Y116.797 E.03082
G1 X134.825 Y108.741 E.54763
G1 X134.233 Y108.741 E.03082
G1 X140.994 Y116.797 E.54763
G1 X140.402 Y116.797 E.03082
G1 X133.642 Y108.741 E.54763
G1 X133.05 Y108.741 E.03082
G1 X139.81 Y116.797 E.54763
G1 X139.218 Y116.797 E.03082
G1 X132.458 Y108.741 E.54763
G1 X131.866 Y108.741 E.03082
G1 X138.626 Y116.797 E.54763
G1 X138.034 Y116.797 E.03082
G1 X131.274 Y108.741 E.54763
G1 X130.682 Y108.741 E.03082
G1 X137.442 Y116.797 E.54763
G1 X136.851 Y116.797 E.03082
G1 X132.982 Y112.187 E.31341
G1 X133.052 Y112.769 E.03056
G1 X133.03 Y112.95 E.00949
G1 X136.259 Y116.797 E.26152
G1 X135.667 Y116.797 E.03082
G1 X132.956 Y113.566 E.21963
G1 X132.776 Y114.057 E.02722
G1 X135.075 Y116.797 E.18627
G1 X134.483 Y116.797 E.03082
G1 X132.561 Y114.506 E.15574
G1 X132.293 Y114.893 E.02449
G1 X133.891 Y116.797 E.12944
G1 X133.299 Y116.797 E.03082
G1 X131.982 Y115.227 E.10672
G1 X131.642 Y115.528 E.02362
G1 X132.708 Y116.797 E.08628
G1 X132.116 Y116.797 E.03082
G1 X131.303 Y115.829 E.06583
G1 X130.963 Y116.13 E.02362
G1 X131.524 Y116.797 E.04539
G1 X130.932 Y116.797 E.03082
G1 X130.624 Y116.43 E.02495
G1 X130.285 Y116.731 E.02362
G1 X130.51 Y117 E.01827
M106 S232.05
G1 X130.251 Y116.172 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.474971
; LAYER_HEIGHT: 0.2
G1 F14581.612
G1 X130.017 Y116.223 E.00845
G1 X129.23 Y116.223 E.02768
G1 X128.996 Y116.172 E.00845
G1 X129.623 Y116.728 E.02952
G1 X130.206 Y116.212 E.0274
G1 X128.734 Y117 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40339
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X121.804 Y108.741 E.56139
G1 X121.213 Y108.741 E.03082
G1 X127.973 Y116.797 E.54763
G1 X127.381 Y116.797 E.03082
G1 X120.621 Y108.741 E.54763
G1 X120.029 Y108.741 E.03082
G1 X126.789 Y116.797 E.54763
G1 X126.197 Y116.797 E.03082
G1 X119.437 Y108.741 E.54763
G1 X118.845 Y108.741 E.03082
G1 X125.605 Y116.797 E.54763
G1 X125.013 Y116.797 E.03082
G1 X118.253 Y108.741 E.54763
G1 X117.661 Y108.741 E.03082
G1 X124.421 Y116.797 E.54763
G1 X123.83 Y116.797 E.03082
G1 X117.07 Y108.741 E.54763
G1 X116.845 Y108.741 E.01168
G1 X116.845 Y109.179 E.02281
G1 X123.238 Y116.797 E.51785
G1 X122.646 Y116.797 E.03082
G1 X116.845 Y109.884 E.46991
G1 X116.845 Y110.59 E.03673
G1 X122.054 Y116.797 E.42196
G1 X121.462 Y116.797 E.03082
G1 X116.845 Y111.295 E.37401
G1 X116.845 Y112.001 E.03673
G1 X120.87 Y116.797 E.32607
G1 X120.278 Y116.797 E.03082
G1 X116.845 Y112.706 E.27812
G1 X116.845 Y113.411 E.03673
G1 X119.687 Y116.797 E.23018
G1 X119.095 Y116.797 E.03082
G1 X116.845 Y114.117 E.18223
G1 X116.845 Y114.822 E.03673
G1 X118.503 Y116.797 E.13429
G1 X117.911 Y116.797 E.03082
G1 X116.845 Y115.527 E.08634
G1 X116.845 Y116.233 E.03673
G1 X117.489 Y117 E.05216
M106 S232.05
G1 X126.549 Y113.69 F30000
M106 S255
G1 F3000
G1 X122.396 Y108.741 E.33637
G1 X122.988 Y108.741 E.03082
G1 X126.216 Y112.588 E.26152
G1 X126.291 Y111.972 E.03232
G1 X123.58 Y108.741 E.21964
G1 X124.172 Y108.741 E.03082
G1 X126.471 Y111.481 E.18628
G1 X126.587 Y111.176 E.01703
G1 X126.686 Y111.032 E.00908
G1 X124.764 Y108.741 E.15575
G1 X125.356 Y108.741 E.03082
G1 X126.953 Y110.645 E.12944
G3 X127.265 Y110.311 I.834 J.465 E.02402
G1 X125.947 Y108.741 E.10673
G1 X126.539 Y108.741 E.03082
G1 X127.604 Y110.01 E.08628
G1 X127.944 Y109.71 E.02362
G1 X127.131 Y108.741 E.06584
G1 X127.723 Y108.741 E.03082
G1 X128.283 Y109.409 E.04539
G1 X128.623 Y109.108 E.02362
G1 X128.315 Y108.741 E.02495
G1 X128.907 Y108.741 E.03082
G1 X129.093 Y108.963 E.01505
M106 S232.05
G1 X130.251 Y109.367 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.474971
; LAYER_HEIGHT: 0.2
G1 F14581.612
G1 X129.623 Y108.811 E.02952
G1 X128.996 Y109.367 E.02952
G1 X129.23 Y109.315 E.00845
G1 X130.017 Y109.315 E.02768
G1 X130.192 Y109.354 E.00634
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X130.017 Y109.315 E-.06839
G1 X129.23 Y109.315 E-.29878
G1 X128.996 Y109.367 E-.09118
G1 X129.59 Y108.84 E-.30166
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/135
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
G3 Z3 I-1.21 J-.133 P1  F30000
G1 X127.316 Y129.453 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10805
M73 P39 R14
G1 X127.294 Y129.42 E.0013
G1 X127.032 Y128.731 E.02444
G1 X126.943 Y128 E.02444
G1 X127.032 Y127.269 E.02444
G1 X127.294 Y126.58 E.02444
G1 X127.712 Y125.973 E.02444
G1 X128.264 Y125.485 E.02444
G1 X128.916 Y125.142 E.02444
G1 X129.632 Y124.966 E.02444
G1 X130.368 Y124.966 E.02444
G1 X131.084 Y125.142 E.02444
G1 X131.736 Y125.485 E.02444
G1 X132.288 Y125.973 E.02444
G1 X132.706 Y126.58 E.02444
G1 X132.968 Y127.269 E.02444
G1 X133.057 Y128 E.02444
G1 X132.968 Y128.731 E.02444
G1 X132.706 Y129.42 E.02444
G1 X132.288 Y130.027 E.02444
G1 X131.736 Y130.515 E.02444
G1 X131.084 Y130.858 E.02444
G1 X130.368 Y131.034 E.02444
G1 X129.632 Y131.034 E.02444
G1 X128.916 Y130.858 E.02444
G1 X128.264 Y130.515 E.02444
G1 X127.712 Y130.027 E.02444
G1 X127.35 Y129.502 E.02115
G1 X127.643 Y129.235 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10805
G1 X127.416 Y128.637 E.01966
G1 X127.338 Y128 E.01972
G1 X127.416 Y127.363 E.01972
G1 X127.613 Y126.842 E.01712
G1 X127.643 Y126.763 E.0026
G1 X128.008 Y126.235 E.01972
G1 X128.488 Y125.81 E.01972
G1 X129.056 Y125.511 E.01972
G1 X129.679 Y125.358 E.01972
G1 X130.321 Y125.358 E.01972
G1 X130.944 Y125.511 E.01972
G1 X131.512 Y125.81 E.01972
G1 X131.992 Y126.235 E.01972
G1 X132.357 Y126.763 E.01972
G1 X132.584 Y127.363 E.01972
G1 X132.662 Y128 E.01972
G1 X132.584 Y128.637 E.01972
G1 X132.387 Y129.158 E.01712
G1 X132.357 Y129.237 E.0026
G1 X131.992 Y129.765 E.01972
G1 X131.512 Y130.19 E.01972
G1 X130.944 Y130.489 E.01972
G1 X130.321 Y130.642 E.01972
G1 X129.679 Y130.642 E.01972
G1 X129.056 Y130.489 E.01972
G1 X128.488 Y130.19 E.01972
G1 X128.008 Y129.765 E.01972
G1 X127.676 Y129.285 E.01793
M204 S10000
; WIPE_START
G1 F24000
G1 X127.416 Y128.637 E-.26537
G1 X127.338 Y128 E-.24382
G1 X127.416 Y127.363 E-.24382
G1 X127.422 Y127.346 E-.007
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.372 J1.159 P1  F30000
G1 X143.148 Y132.398 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10805
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y123.602 E.29177
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y132.338 E.28978
G1 X143.54 Y132.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10805
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y123.21 E.29437
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y132.73 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X141.54 Y132.734 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.726 J.977 P1  F30000
G1 X142.213 Y132.234 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.424235
G1 F10805
G1 X142.815 Y131.633 E.02643
G1 X142.815 Y131.094 E.01676
G1 X141.844 Y132.065 E.04267
G1 X141.304 Y132.065 E.01676
G1 X142.815 Y130.554 E.06637
G1 X142.815 Y130.015 E.01676
G1 X140.765 Y132.065 E.09007
G1 X140.226 Y132.065 E.01676
G1 X142.815 Y129.476 E.11377
G1 X142.815 Y128.936 E.01676
G1 X139.686 Y132.065 E.13746
G1 X139.147 Y132.065 E.01676
G1 X142.815 Y128.397 E.16116
G1 X142.815 Y127.858 E.01676
G1 X138.608 Y132.065 E.18486
G1 X138.069 Y132.065 E.01676
G1 X142.815 Y127.319 E.20855
G1 X142.815 Y126.779 E.01676
G1 X137.529 Y132.065 E.23225
G1 X136.99 Y132.065 E.01676
G1 X142.815 Y126.24 E.25595
G1 X142.815 Y125.701 E.01676
G1 X136.451 Y132.065 E.27964
G1 X135.912 Y132.065 E.01676
G1 X142.815 Y125.162 E.30334
G1 X142.815 Y124.622 E.01676
G1 X135.372 Y132.065 E.32704
G1 X134.833 Y132.065 E.01676
G1 X142.815 Y124.083 E.35073
G1 X142.815 Y123.935 E.00459
G1 X142.423 Y123.935 E.01216
G1 X134.294 Y132.065 E.35723
G1 X133.755 Y132.065 E.01676
G1 X141.884 Y123.935 E.35723
G1 X141.345 Y123.935 E.01676
G1 X133.215 Y132.065 E.35723
G1 X132.676 Y132.065 E.01676
G1 X140.805 Y123.935 E.35723
G1 X140.266 Y123.935 E.01676
G1 X132.137 Y132.065 E.35723
G1 X131.598 Y132.065 E.01676
G1 X139.727 Y123.935 E.35723
G1 X139.188 Y123.935 E.01676
G1 X131.058 Y132.065 E.35723
G1 X130.519 Y132.065 E.01676
G1 X138.648 Y123.935 E.35723
G1 X138.109 Y123.935 E.01676
G1 X133.302 Y128.742 E.21123
G1 X133.377 Y128.129 E.01921
G1 X137.57 Y123.935 E.18426
G1 X137.031 Y123.935 E.01676
G1 X133.346 Y127.62 E.16191
G1 X133.278 Y127.148 E.01481
G1 X136.491 Y123.935 E.14118
G1 X135.952 Y123.935 E.01676
G1 X133.13 Y126.757 E.124
G1 X132.971 Y126.377 E.01281
G1 X135.413 Y123.935 E.10728
G1 X134.874 Y123.935 E.01676
G1 X132.751 Y126.058 E.09326
G1 X132.528 Y125.741 E.01203
G1 X134.334 Y123.935 E.07935
G1 X133.795 Y123.935 E.01676
G1 X132.243 Y125.488 E.06822
G1 X131.957 Y125.234 E.01187
G1 X133.256 Y123.935 E.05709
G1 X132.716 Y123.935 E.01676
G1 X131.61 Y125.042 E.04862
G1 X131.256 Y124.856 E.01241
G1 X132.177 Y123.935 E.04047
G1 X131.638 Y123.935 E.01676
G1 X130.836 Y124.738 E.03526
G1 X130.402 Y124.633 E.01388
G1 X131.099 Y123.935 E.03064
G1 X130.559 Y123.935 E.01676
G1 X129.862 Y124.633 E.03064
G1 X129.591 Y124.633 E.00843
G1 X129.235 Y124.72 E.01139
G1 X130.02 Y123.935 E.03449
G1 X129.481 Y123.935 E.01676
G1 X121.352 Y132.065 E.35723
G1 X121.891 Y132.065 E.01676
G1 X126.698 Y127.258 E.21124
G1 X126.623 Y127.871 E.01921
G1 X122.43 Y132.065 E.18427
G1 X122.969 Y132.065 E.01676
G1 X126.654 Y128.38 E.16191
G1 X126.722 Y128.852 E.01481
G1 X123.509 Y132.065 E.14118
G1 X124.048 Y132.065 E.01676
G1 X126.87 Y129.243 E.124
G1 X127.029 Y129.623 E.01281
G1 X124.587 Y132.065 E.10728
G1 X125.126 Y132.065 E.01676
G1 X127.249 Y129.942 E.09327
G1 X127.471 Y130.259 E.01203
G1 X125.666 Y132.065 E.07935
G1 X126.205 Y132.065 E.01676
G1 X127.757 Y130.512 E.06822
G1 X128.043 Y130.765 E.01187
G1 X126.744 Y132.065 E.05709
G1 X127.283 Y132.065 E.01676
G1 X128.39 Y130.958 E.04862
G1 X128.744 Y131.144 E.01241
G1 X127.823 Y132.065 E.04047
G1 X128.362 Y132.065 E.01676
G1 X129.164 Y131.262 E.03526
G1 X129.598 Y131.367 E.01388
G1 X128.901 Y132.065 E.03064
G1 X129.441 Y132.065 E.01676
G1 X130.138 Y131.367 E.03064
G1 X130.409 Y131.367 E.00843
G1 X130.765 Y131.28 E.01138
G1 X129.81 Y132.234 E.04195
G1 X120.643 Y132.234 F30000
G1 F10805
G1 X128.942 Y123.935 E.36468
G1 X128.402 Y123.935 E.01676
G1 X120.273 Y132.065 E.35723
G1 X119.734 Y132.065 E.01676
G1 X127.863 Y123.935 E.35723
G1 X127.324 Y123.935 E.01676
G1 X119.195 Y132.065 E.35723
G1 X118.655 Y132.065 E.01676
G1 X126.785 Y123.935 E.35723
G1 X126.245 Y123.935 E.01676
G1 X118.116 Y132.065 E.35723
G1 X117.577 Y132.065 E.01676
G1 X125.706 Y123.935 E.35723
G1 X125.167 Y123.935 E.01676
G1 X117.185 Y131.917 E.35073
G1 X117.185 Y131.378 E.01676
G1 X124.628 Y123.935 E.32703
G1 X124.088 Y123.935 E.01676
G1 X117.185 Y130.838 E.30334
G1 X117.185 Y130.299 E.01676
G1 X123.549 Y123.935 E.27964
G1 X123.01 Y123.935 E.01676
G1 X117.185 Y129.76 E.25594
G1 X117.185 Y129.221 E.01676
G1 X122.471 Y123.935 E.23225
G1 X121.931 Y123.935 E.01676
G1 X117.185 Y128.681 E.20855
G1 X117.185 Y128.142 E.01676
G1 X121.392 Y123.935 E.18485
G1 X120.853 Y123.935 E.01676
G1 X117.185 Y127.603 E.16116
G1 X117.185 Y127.063 E.01676
G1 X120.313 Y123.935 E.13746
G1 X119.774 Y123.935 E.01676
G1 X117.185 Y126.524 E.11376
G1 X117.185 Y125.985 E.01676
G1 X119.235 Y123.935 E.09007
G1 X118.696 Y123.935 E.01676
G1 X117.185 Y125.446 E.06637
G1 X117.185 Y124.906 E.01676
G1 X118.156 Y123.935 E.04267
G1 X117.617 Y123.935 E.01676
G1 X117.016 Y124.537 E.02643
; WIPE_START
G1 F24000
G1 X117.617 Y123.935 E-.32326
G1 X118.156 Y123.935 E-.20492
G1 X117.725 Y124.367 E-.23182
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.901 J.818 P1  F30000
G1 X126.939 Y114.222 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10805
G1 X126.917 Y114.19 E.0013
G1 X126.656 Y113.501 E.02444
G1 X126.567 Y112.769 E.02444
G1 X126.656 Y112.038 E.02444
G1 X126.917 Y111.349 E.02444
G1 X127.336 Y110.742 E.02444
G1 X127.887 Y110.254 E.02444
G1 X128.54 Y109.911 E.02444
G1 X129.255 Y109.735 E.02444
G1 X129.992 Y109.735 E.02444
G1 X130.707 Y109.911 E.02444
G1 X131.36 Y110.254 E.02444
G1 X131.911 Y110.742 E.02444
G1 X132.33 Y111.349 E.02444
G1 X132.591 Y112.038 E.02444
G1 X132.68 Y112.769 E.02444
G1 X132.591 Y113.501 E.02444
G1 X132.33 Y114.19 E.02444
G1 X131.911 Y114.796 E.02444
G1 X131.36 Y115.285 E.02444
G1 X130.707 Y115.627 E.02444
G1 X129.992 Y115.803 E.02444
G1 X129.255 Y115.803 E.02444
G1 X128.54 Y115.627 E.02444
G1 X127.887 Y115.285 E.02444
G1 X127.336 Y114.796 E.02444
G1 X126.973 Y114.271 E.02115
G1 X127.266 Y114.005 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10805
G1 X127.039 Y113.406 E.01966
G1 X126.962 Y112.769 E.01972
G1 X127.039 Y112.132 E.01972
G1 X127.237 Y111.611 E.01712
G1 X127.267 Y111.532 E.0026
G1 X127.631 Y111.004 E.01972
G1 X128.112 Y110.579 E.01972
G1 X128.68 Y110.281 E.01972
G1 X129.303 Y110.127 E.01972
G1 X129.944 Y110.127 E.01972
G1 X130.567 Y110.281 E.01972
G1 X131.135 Y110.579 E.01972
G1 X131.616 Y111.004 E.01972
G1 X131.98 Y111.532 E.01972
G1 X132.208 Y112.132 E.01972
G1 X132.285 Y112.769 E.01972
G1 X132.208 Y113.406 E.01972
G1 X132.01 Y113.927 E.01712
G1 X131.98 Y114.006 E.0026
G1 X131.616 Y114.534 E.01972
G1 X131.135 Y114.96 E.01972
G1 X130.567 Y115.258 E.01972
G1 X129.944 Y115.411 E.01972
G1 X129.303 Y115.411 E.01972
G1 X128.68 Y115.258 E.01972
G1 X128.112 Y114.96 E.01972
G1 X127.631 Y114.534 E.01972
G1 X127.3 Y114.054 E.01793
M204 S10000
; WIPE_START
G1 F24000
G1 X127.039 Y113.406 E-.26537
G1 X126.962 Y112.769 E-.24382
G1 X127.039 Y112.132 E-.24382
G1 X127.046 Y112.115 E-.007
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.372 J1.159 P1  F30000
G1 X142.771 Y117.167 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10805
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y108.371 E.29177
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y117.107 E.28978
G1 X143.163 Y117.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10805
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y107.979 E.29437
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y117.499 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X141.163 Y117.504 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.726 J.977 P1  F30000
G1 X141.837 Y117.004 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.424235
G1 F10805
G1 X142.438 Y116.402 E.02643
G1 X142.438 Y115.863 E.01676
G1 X141.467 Y116.834 E.04267
G1 X140.928 Y116.834 E.01676
G1 X142.438 Y115.324 E.06637
G1 X142.438 Y114.784 E.01676
G1 X140.388 Y116.834 E.09007
G1 X139.849 Y116.834 E.01676
G1 X142.438 Y114.245 E.11377
G1 X142.438 Y113.706 E.01676
G1 X139.31 Y116.834 E.13746
G1 X138.771 Y116.834 E.01676
G1 X142.438 Y113.166 E.16116
G1 X142.438 Y112.627 E.01676
G1 X138.231 Y116.834 E.18486
G1 X137.692 Y116.834 E.01676
G1 X142.438 Y112.088 E.20855
G1 X142.438 Y111.549 E.01676
G1 X137.153 Y116.834 E.23225
G1 X136.614 Y116.834 E.01676
G1 X142.438 Y111.009 E.25595
G1 X142.438 Y110.47 E.01676
G1 X136.074 Y116.834 E.27964
G1 X135.535 Y116.834 E.01676
G1 X142.438 Y109.931 E.30334
G1 X142.438 Y109.392 E.01676
G1 X134.996 Y116.834 E.32704
G1 X134.457 Y116.834 E.01676
G1 X142.438 Y108.852 E.35073
G1 X142.438 Y108.705 E.00459
G1 X142.047 Y108.705 E.01216
G1 X133.917 Y116.834 E.35723
G1 X133.378 Y116.834 E.01676
G1 X141.507 Y108.705 E.35723
G1 X140.968 Y108.705 E.01676
G1 X132.839 Y116.834 E.35723
G1 X132.3 Y116.834 E.01676
G1 X140.429 Y108.705 E.35723
G1 X139.89 Y108.705 E.01676
G1 X131.76 Y116.834 E.35723
G1 X131.221 Y116.834 E.01676
G1 X139.35 Y108.705 E.35723
G1 X138.811 Y108.705 E.01676
G1 X130.682 Y116.834 E.35723
G1 X130.142 Y116.834 E.01676
G1 X138.272 Y108.705 E.35723
G1 X137.733 Y108.705 E.01676
G1 X132.926 Y113.512 E.21123
G1 X133 Y112.898 E.01921
G1 X137.193 Y108.705 E.18426
G1 X136.654 Y108.705 E.01676
G1 X132.969 Y112.389 E.16191
G1 X132.902 Y111.917 E.01481
G1 X136.115 Y108.705 E.14118
G1 X135.575 Y108.705 E.01676
G1 X132.754 Y111.526 E.124
G1 X132.595 Y111.146 E.01281
G1 X135.036 Y108.705 E.10728
G1 X134.497 Y108.705 E.01676
G1 X132.375 Y110.827 E.09326
G1 X132.152 Y110.51 E.01203
G1 X133.958 Y108.705 E.07935
G1 X133.418 Y108.705 E.01676
G1 X131.866 Y110.257 E.06822
G1 X131.58 Y110.004 E.01187
G1 X132.879 Y108.705 E.05709
G1 X132.34 Y108.705 E.01676
G1 X131.233 Y109.811 E.04862
G1 X130.88 Y109.626 E.01241
G1 X131.801 Y108.705 E.04047
G1 X131.261 Y108.705 E.01676
G1 X130.459 Y109.507 E.03526
G1 X130.025 Y109.402 E.01388
G1 X130.722 Y108.705 E.03064
G1 X130.183 Y108.705 E.01676
G1 X129.486 Y109.402 E.03064
G1 X129.215 Y109.402 E.00843
G1 X128.859 Y109.489 E.01139
G1 X129.644 Y108.705 E.03449
G1 X129.104 Y108.705 E.01676
G1 X120.975 Y116.834 E.35723
G1 X121.514 Y116.834 E.01676
G1 X126.321 Y112.027 E.21124
G1 X126.247 Y112.641 E.01921
G1 X122.054 Y116.834 E.18427
G1 X122.593 Y116.834 E.01676
G1 X126.277 Y113.149 E.16191
G1 X126.345 Y113.621 E.01481
G1 X123.132 Y116.834 E.14118
G1 X123.671 Y116.834 E.01676
G1 X126.493 Y114.012 E.124
G1 X126.652 Y114.392 E.01281
G1 X124.211 Y116.834 E.10728
G1 X124.75 Y116.834 E.01676
G1 X126.872 Y114.711 E.09327
G1 X127.095 Y115.028 E.01203
G1 X125.289 Y116.834 E.07935
G1 X125.828 Y116.834 E.01676
G1 X127.381 Y115.281 E.06822
G1 X127.667 Y115.535 E.01187
G1 X126.368 Y116.834 E.05709
G1 X126.907 Y116.834 E.01676
G1 X128.013 Y115.727 E.04862
G1 X128.367 Y115.913 E.01241
G1 X127.446 Y116.834 E.04047
G1 X127.985 Y116.834 E.01676
G1 X128.788 Y116.032 E.03526
G1 X129.222 Y116.137 E.01388
G1 X128.525 Y116.834 E.03064
G1 X129.064 Y116.834 E.01676
G1 X129.761 Y116.137 E.03064
G1 X130.032 Y116.137 E.00843
G1 X130.388 Y116.049 E.01138
G1 X129.434 Y117.004 E.04195
G1 X120.266 Y117.004 F30000
G1 F10805
G1 X128.565 Y108.705 E.36468
G1 X128.026 Y108.705 E.01676
G1 X119.897 Y116.834 E.35723
G1 X119.357 Y116.834 E.01676
G1 X127.487 Y108.705 E.35723
G1 X126.947 Y108.705 E.01676
G1 X118.818 Y116.834 E.35723
G1 X118.279 Y116.834 E.01676
G1 X126.408 Y108.705 E.35723
G1 X125.869 Y108.705 E.01676
G1 X117.739 Y116.834 E.35723
G1 X117.2 Y116.834 E.01676
G1 X125.33 Y108.705 E.35723
G1 X124.79 Y108.705 E.01676
G1 X116.809 Y116.686 E.35073
G1 X116.809 Y116.147 E.01676
G1 X124.251 Y108.705 E.32703
G1 X123.712 Y108.705 E.01676
G1 X116.809 Y115.608 E.30334
G1 X116.809 Y115.068 E.01676
G1 X123.172 Y108.705 E.27964
G1 X122.633 Y108.705 E.01676
G1 X116.809 Y114.529 E.25594
G1 X116.809 Y113.99 E.01676
G1 X122.094 Y108.705 E.23225
G1 X121.555 Y108.705 E.01676
G1 X116.809 Y113.451 E.20855
G1 X116.809 Y112.911 E.01676
G1 X121.015 Y108.705 E.18485
G1 X120.476 Y108.705 E.01676
G1 X116.809 Y112.372 E.16116
G1 X116.809 Y111.833 E.01676
G1 X119.937 Y108.705 E.13746
G1 X119.398 Y108.705 E.01676
G1 X116.809 Y111.293 E.11376
G1 X116.809 Y110.754 E.01676
G1 X118.858 Y108.705 E.09007
G1 X118.319 Y108.705 E.01676
G1 X116.809 Y110.215 E.06637
G1 X116.809 Y109.676 E.01676
G1 X117.78 Y108.705 E.04267
G1 X117.241 Y108.705 E.01676
G1 X116.639 Y109.306 E.02643
M106 S249.9
; CHANGE_LAYER
; Z_HEIGHT: 2.86667
; LAYER_HEIGHT: 0.0666666
; WIPE_START
G1 F24000
G1 X117.241 Y108.705 E-.32326
G1 X117.78 Y108.705 E-.20492
G1 X117.348 Y109.136 E-.23182
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/135
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
G3 Z3.2 I-1.175 J.317 P1  F30000
G1 X120.939 Y122.461 Z3.2
G1 Z2.867
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.266667
G1 F9000
G1 X121.369 Y122.461 E.01695
G1 X121.369 Y122.246 E.0085
G1 X115.615 Y122.246 E.2268
G1 X115.711 Y128 E.22683
G1 X115.615 Y128 E.00382
G1 X115.615 Y130.877 E.1134
G1 X115.711 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X115.615 Y130.877 E-.03681
G1 X115.615 Y128.974 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.267 I.113 J1.212 P1  F30000
G1 X128.115 Y127.813 Z3.267
G1 Z2.867
M73 P40 R14
G1 E.8 F1800
G1 F9000
G3 X131.908 Y128 I1.891 J.195 E.22743
G1 X128.092 Y128 E.15037
G2 X130.329 Y129.869 I1.906 J-.008 E.13077
G1 X130.329 Y129.869 E0
G2 X131.885 Y128.187 I-.341 J-1.876 E.09689
; WIPE_START
G1 F24000
G1 X131.689 Y128.886 E-.27595
G1 X131.428 Y129.265 E-.17474
G1 X131.084 Y129.57 E-.17474
G1 X130.754 Y129.7 E-.13457
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.267 I.837 J.884 P1  F30000
G1 X138.631 Y122.246 Z3.267
G1 Z2.867
G1 E.8 F1800
G1 F9000
G1 X144.385 Y122.246 E.2268
G1 X144.385 Y125.123 E.1134
G1 X144.289 Y125.123 E.00382
G1 X144.385 Y130.877 E.22683
G1 X144.289 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X144.385 Y130.877 E-.03681
G1 X144.353 Y128.974 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.267 I1.216 J-.04 P1  F30000
G1 X143.912 Y115.646 Z3.267
G1 Z2.867
G1 E.8 F1800
G1 F9000
G1 X144.009 Y115.646 E.00382
G1 X143.912 Y109.892 E.22683
G1 X144.009 Y109.892 E.00382
G1 X144.009 Y107.015 E.1134
G1 X138.255 Y107.015 E.2268
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.267 I-.684 J-1.007 P1  F30000
G1 X131.508 Y112.956 Z3.267
G1 Z2.867
G1 E.8 F1800
G1 F9000
G3 X129.952 Y114.639 I-1.897 J-.194 E.09689
G1 X129.952 Y114.639 E0
G3 X127.716 Y112.769 I-.33 J-1.877 E.13077
G1 X131.531 Y112.769 E.15037
G2 X127.739 Y112.582 I-1.901 J.008 E.22743
; WIPE_START
G1 F24000
G1 X127.934 Y111.883 E-.27595
G1 X128.196 Y111.504 E-.17474
G1 X128.54 Y111.199 E-.17474
G1 X128.868 Y111.067 E-.13456
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.267 I.51 J-1.105 P1  F30000
G1 X120.562 Y107.231 Z3.267
G1 Z2.867
G1 E.8 F1800
G1 F9000
G1 X120.992 Y107.231 E.01695
G1 X120.992 Y107.015 E.0085
G1 X115.238 Y107.015 E.2268
G1 X115.335 Y112.769 E.22683
G1 X115.238 Y112.769 E.00382
G1 X115.238 Y115.646 E.1134
G1 X115.335 Y115.646 E.00382
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.133333
; WIPE_START
G1 F24000
G1 X115.238 Y115.646 E-.03681
G1 X115.238 Y113.743 E-.72319
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/135
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
G3 Z3.267 I-.95 J.761 P1  F30000
G1 X127.643 Y129.235 Z3.267
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LAYER_HEIGHT: 0.2
G1 F12000
G1 X127.416 Y128.637 E.01965
G1 X127.338 Y128 E.01972
G1 X127.416 Y127.363 E.01972
G1 X127.643 Y126.763 E.01972
G1 X128.008 Y126.235 E.01972
G1 X128.488 Y125.81 E.01972
G1 X129.056 Y125.511 E.01972
G1 X129.679 Y125.358 E.01972
G1 X130.321 Y125.358 E.01972
G1 X130.944 Y125.511 E.01972
G1 X131.512 Y125.81 E.01972
G1 X131.992 Y126.235 E.01972
G1 X132.357 Y126.763 E.01972
G1 X132.584 Y127.363 E.01972
G1 X132.662 Y128 E.01972
G1 X132.584 Y128.637 E.01972
G1 X132.357 Y129.237 E.01972
G1 X131.992 Y129.765 E.01972
G1 X131.512 Y130.19 E.01972
G1 X130.944 Y130.489 E.01972
G1 X130.321 Y130.642 E.01972
G1 X129.679 Y130.642 E.01972
G1 X129.056 Y130.489 E.01972
G1 X128.488 Y130.19 E.01972
G1 X128.008 Y129.765 E.01972
G1 X127.676 Y129.284 E.01794
M204 S10000
; WIPE_START
G1 F24000
G1 X127.416 Y128.637 E-.26521
G1 X127.338 Y128 E-.24382
G1 X127.416 Y127.363 E-.24382
G1 X127.422 Y127.345 E-.00715
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.259 J1.189 P1  F30000
G1 X143.148 Y123.922 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.852 Y123.922 E.87228
G1 X116.852 Y123.602 E.01062
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y123.862 E.00863
; WIPE_START
G1 F24000
G1 X141.148 Y123.867 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.185 J.278 P1  F30000
G1 X143.148 Y132.398 Z3.4
G1 Z3
G1 E.8 F1800
G1 F15476.087
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y132.078 E.01062
G1 X143.148 Y132.078 E.87228
G1 X143.148 Y132.338 E.00863
G1 X143.54 Y132.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y123.21 E.29437
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y132.73 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X141.54 Y132.734 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.189 J.26 P1  F30000
G1 X143.333 Y124.535 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X142.943 Y124.145 E.01695
G1 X142.409 Y124.145
G1 X143.333 Y125.068 E.04012
G1 X143.333 Y125.601
G1 X141.876 Y124.145 E.0633
G1 X141.343 Y124.145
G1 X143.333 Y126.134 E.08647
G1 X143.333 Y126.668
G1 X140.809 Y124.145 E.10964
G1 X140.276 Y124.145
G1 X143.333 Y127.201 E.13282
G1 X143.333 Y127.734
G1 X139.743 Y124.145 E.15599
G1 X139.21 Y124.145
G1 X143.333 Y128.268 E.17916
G1 X143.333 Y128.801
G1 X138.676 Y124.145 E.20233
G1 X138.143 Y124.145
G1 X143.333 Y129.334 E.22551
G1 X143.333 Y129.867
G1 X137.61 Y124.145 E.24868
G1 X137.077 Y124.145
G1 X143.333 Y130.401 E.27185
G1 X143.333 Y130.934
G1 X136.543 Y124.145 E.29503
G1 X136.01 Y124.145
G1 X143.333 Y131.467 E.3182
G1 X143.188 Y131.855
G1 X135.477 Y124.145 E.33507
G1 X134.944 Y124.145
G1 X142.654 Y131.855 E.33507
G1 X142.121 Y131.855
G1 X134.41 Y124.145 E.33507
G1 X133.877 Y124.145
G1 X141.588 Y131.855 E.33507
G1 X141.054 Y131.855
G1 X133.344 Y124.145 E.33507
G1 X132.81 Y124.145
G1 X140.521 Y131.855 E.33507
G1 X139.988 Y131.855
G1 X132.277 Y124.145 E.33507
G1 X131.744 Y124.145
G1 X139.455 Y131.855 E.33507
G1 X138.921 Y131.855
G1 X131.211 Y124.145 E.33507
G1 X130.677 Y124.145
G1 X138.388 Y131.855 E.33507
G1 X137.855 Y131.855
G1 X132.266 Y126.266 E.24287
G1 X132.788 Y127.322
G1 X137.322 Y131.855 E.197
G1 X136.788 Y131.855
G1 X132.862 Y127.929 E.17062
G1 X132.819 Y128.42
G1 X136.255 Y131.855 E.14929
G1 X135.722 Y131.855
G1 X132.723 Y128.856 E.13032
G1 X132.576 Y129.243
G1 X135.188 Y131.855 E.11352
G1 X134.655 Y131.855
G1 X132.375 Y129.575 E.09908
G1 X132.157 Y129.891
G1 X134.122 Y131.855 E.08537
G1 X133.589 Y131.855
G1 X131.877 Y130.144 E.07437
G1 X131.586 Y130.386
G1 X133.055 Y131.855 E.06386
G1 X132.522 Y131.855
G1 X131.236 Y130.569 E.05588
G1 X130.857 Y130.724
G1 X131.989 Y131.855 E.04918
G1 X131.456 Y131.855
G1 X130.429 Y130.829 E.0446
G1 X129.916 Y130.85
G1 X130.922 Y131.855 E.04371
G1 X130.389 Y131.855
G1 X129.295 Y130.761 E.04756
G1 X128.311 Y130.311
G1 X129.856 Y131.855 E.06712
M204 S10000
; WIPE_START
G1 F24000
G1 X128.442 Y130.441 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.005 J.686 P1  F30000
G1 X131.688 Y125.688 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X130.144 Y124.145 E.06708
G1 X129.611 Y124.145
G1 X130.705 Y125.239 E.04756
G1 X130.083 Y125.15
G1 X129.078 Y124.145 E.04371
G1 X128.544 Y124.145
G1 X129.571 Y125.171 E.0446
G1 X129.143 Y125.276
G1 X128.011 Y124.145 E.04918
G1 X127.478 Y124.145
G1 X128.764 Y125.431 E.05589
G1 X128.414 Y125.614
G1 X126.944 Y124.145 E.06386
G1 X126.411 Y124.145
G1 X128.123 Y125.856 E.07438
G1 X127.843 Y126.109
G1 X125.878 Y124.145 E.08538
G1 X125.345 Y124.145
G1 X127.625 Y126.425 E.09909
G1 X127.424 Y126.757
G1 X124.811 Y124.145 E.11352
G1 X124.278 Y124.145
G1 X127.277 Y127.144 E.13032
G1 X127.181 Y127.58
G1 X123.745 Y124.145 E.1493
G1 X123.212 Y124.145
G1 X127.138 Y128.071 E.17063
G1 X127.212 Y128.678
G1 X122.678 Y124.145 E.19701
G1 X122.145 Y124.145
G1 X127.735 Y129.734 E.24289
M204 S10000
; WIPE_START
G1 F24000
G1 X126.32 Y128.32 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.928 J.788 P1  F30000
G1 X129.323 Y131.855 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X121.612 Y124.145 E.33507
G1 X121.078 Y124.145
G1 X128.789 Y131.855 E.33507
G1 X128.256 Y131.855
G1 X120.545 Y124.145 E.33507
G1 X120.012 Y124.145
G1 X127.723 Y131.855 E.33507
G1 X127.189 Y131.855
G1 X119.479 Y124.145 E.33507
G1 X118.945 Y124.145
G1 X126.656 Y131.855 E.33507
G1 X126.123 Y131.855
G1 X118.412 Y124.145 E.33507
G1 X117.879 Y124.145
G1 X125.59 Y131.855 E.33507
G1 X125.056 Y131.855
G1 X117.346 Y124.145 E.33507
G1 X116.812 Y124.145
G1 X124.523 Y131.855 E.33507
G1 X123.99 Y131.855
G1 X116.667 Y124.533 E.31819
G1 X116.667 Y125.066
G1 X123.457 Y131.855 E.29502
G1 X122.923 Y131.855
G1 X116.667 Y125.6 E.27185
G1 X116.667 Y126.133
G1 X122.39 Y131.855 E.24868
G1 X121.857 Y131.855
G1 X116.667 Y126.666 E.2255
G1 X116.667 Y127.199
G1 X121.323 Y131.855 E.20233
G1 X120.79 Y131.855
G1 X116.667 Y127.733 E.17916
G1 X116.667 Y128.266
G1 X120.257 Y131.855 E.15598
G1 X119.724 Y131.855
G1 X116.667 Y128.799 E.13281
G1 X116.667 Y129.332
G1 X119.19 Y131.855 E.10964
G1 X118.657 Y131.855
G1 X116.667 Y129.866 E.08646
G1 X116.667 Y130.399
G1 X118.124 Y131.855 E.06329
G1 X117.591 Y131.855
G1 X116.667 Y130.932 E.04012
G1 X116.667 Y131.465
G1 X117.057 Y131.855 E.01694
M204 S10000
; WIPE_START
G1 F24000
G1 X116.667 Y131.465 E-.20954
G1 X116.667 Y130.932 E-.20264
G1 X117.315 Y131.579 E-.34782
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.134 J1.21 P1  F30000
G1 X128.251 Y130.371 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.236512
G1 F15000
G3 X127.795 Y129.94 I3.329 J-3.979 E.00991
G1 X127.674 Y129.795 E.00298
; WIPE_START
G1 F24000
G1 X127.795 Y129.94 E-.17574
G1 X128.251 Y130.371 E-.58426
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.171 J.333 P1  F30000
G1 X129.754 Y125.087 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.110621
G1 F15000
G2 X129.599 Y125.167 I.564 J1.296 E.00096
; WIPE_START
G1 F24000
G1 X129.754 Y125.087 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.485 J1.116 P1  F30000
G1 X132.326 Y126.206 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.217664
G1 F15000
G2 X132.191 Y126.045 I-1.396 J1.04 E.00299
G1 X131.748 Y125.628 E.00867
; WIPE_START
G1 F24000
G1 X132.191 Y126.045 E-.56509
G1 X132.326 Y126.206 E-.19491
; WIPE_END
G1 E-.04 F1800
G17
M73 P41 R14
G3 Z3.4 I1.124 J-.466 P1  F30000
G1 X127.266 Y114.004 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X127.039 Y113.406 E.01965
G1 X126.962 Y112.769 E.01972
G1 X127.039 Y112.132 E.01972
G1 X127.267 Y111.532 E.01972
G1 X127.631 Y111.004 E.01972
G1 X128.112 Y110.579 E.01972
G1 X128.68 Y110.281 E.01972
G1 X129.303 Y110.127 E.01972
G1 X129.944 Y110.127 E.01972
G1 X130.567 Y110.281 E.01972
G1 X131.135 Y110.579 E.01972
G1 X131.616 Y111.004 E.01972
G1 X131.98 Y111.532 E.01972
G1 X132.208 Y112.132 E.01972
G1 X132.285 Y112.769 E.01972
G1 X132.208 Y113.406 E.01972
G1 X131.98 Y114.006 E.01972
G1 X131.616 Y114.534 E.01972
G1 X131.135 Y114.96 E.01972
G1 X130.567 Y115.258 E.01972
G1 X129.944 Y115.411 E.01972
G1 X129.303 Y115.411 E.01972
G1 X128.68 Y115.258 E.01972
G1 X128.112 Y114.96 E.01972
G1 X127.631 Y114.534 E.01972
G1 X127.3 Y114.054 E.01794
M204 S10000
; WIPE_START
G1 F24000
G1 X127.039 Y113.406 E-.26521
G1 X126.962 Y112.769 E-.24382
G1 X127.039 Y112.132 E-.24382
G1 X127.046 Y112.115 E-.00715
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.259 J1.189 P1  F30000
G1 X142.771 Y108.691 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.476 Y108.691 E.87228
G1 X116.476 Y108.371 E.01062
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y108.631 E.00863
; WIPE_START
G1 F24000
G1 X140.771 Y108.636 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.185 J.278 P1  F30000
G1 X142.771 Y117.167 Z3.4
G1 Z3
G1 E.8 F1800
G1 F15476.087
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.847 E.01062
G1 X142.771 Y116.847 E.87228
G1 X142.771 Y117.107 E.00863
G1 X143.163 Y117.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y107.979 E.29437
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y117.499 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X141.163 Y117.504 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.189 J.26 P1  F30000
G1 X142.956 Y109.304 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X142.566 Y108.914 E.01695
G1 X142.033 Y108.914
G1 X142.956 Y109.837 E.04012
G1 X142.956 Y110.37
G1 X141.499 Y108.914 E.0633
G1 X140.966 Y108.914
G1 X142.956 Y110.904 E.08647
G1 X142.956 Y111.437
G1 X140.433 Y108.914 E.10964
G1 X139.9 Y108.914
G1 X142.956 Y111.97 E.13282
G1 X142.956 Y112.504
G1 X139.366 Y108.914 E.15599
G1 X138.833 Y108.914
G1 X142.956 Y113.037 E.17916
G1 X142.956 Y113.57
G1 X138.3 Y108.914 E.20233
G1 X137.767 Y108.914
G1 X142.956 Y114.103 E.22551
G1 X142.956 Y114.637
G1 X137.233 Y108.914 E.24868
G1 X136.7 Y108.914
G1 X142.956 Y115.17 E.27185
G1 X142.956 Y115.703
G1 X136.167 Y108.914 E.29503
G1 X135.633 Y108.914
G1 X142.956 Y116.236 E.3182
G1 X142.811 Y116.625
G1 X135.1 Y108.914 E.33507
G1 X134.567 Y108.914
G1 X142.278 Y116.625 E.33507
G1 X141.744 Y116.625
G1 X134.034 Y108.914 E.33507
G1 X133.5 Y108.914
G1 X141.211 Y116.625 E.33507
G1 X140.678 Y116.625
G1 X132.967 Y108.914 E.33507
G1 X132.434 Y108.914
G1 X140.145 Y116.625 E.33507
G1 X139.611 Y116.625
G1 X131.901 Y108.914 E.33507
G1 X131.367 Y108.914
G1 X139.078 Y116.625 E.33507
G1 X138.545 Y116.625
G1 X130.834 Y108.914 E.33507
G1 X130.301 Y108.914
G1 X138.012 Y116.625 E.33507
G1 X137.478 Y116.625
G1 X131.889 Y111.036 E.24287
G1 X132.412 Y112.091
G1 X136.945 Y116.625 E.197
G1 X136.412 Y116.625
G1 X132.485 Y112.698 E.17062
G1 X132.443 Y113.189
G1 X135.878 Y116.625 E.14929
G1 X135.345 Y116.625
G1 X132.346 Y113.626 E.13032
G1 X132.2 Y114.012
G1 X134.812 Y116.625 E.11352
G1 X134.279 Y116.625
G1 X131.999 Y114.345 E.09908
G1 X131.781 Y114.66
G1 X133.745 Y116.625 E.08537
G1 X133.212 Y116.625
G1 X131.501 Y114.913 E.07437
G1 X131.209 Y115.155
G1 X132.679 Y116.625 E.06386
G1 X132.146 Y116.625
G1 X130.86 Y115.339 E.05588
G1 X130.48 Y115.493
G1 X131.612 Y116.625 E.04918
G1 X131.079 Y116.625
G1 X130.053 Y115.598 E.0446
G1 X129.54 Y115.619
G1 X130.546 Y116.625 E.04371
G1 X130.012 Y116.625
G1 X128.918 Y115.53 E.04756
G1 X127.935 Y115.08
G1 X129.479 Y116.625 E.06712
M204 S10000
; WIPE_START
G1 F24000
G1 X128.065 Y115.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.005 J.686 P1  F30000
G1 X131.311 Y110.457 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X129.768 Y108.914 E.06708
G1 X129.234 Y108.914
G1 X130.329 Y110.008 E.04756
G1 X129.707 Y109.92
G1 X128.701 Y108.914 E.04371
G1 X128.168 Y108.914
G1 X129.194 Y109.94 E.0446
G1 X128.766 Y110.046
G1 X127.634 Y108.914 E.04918
G1 X127.101 Y108.914
G1 X128.387 Y110.2 E.05589
G1 X128.037 Y110.383
G1 X126.568 Y108.914 E.06386
G1 X126.035 Y108.914
G1 X127.746 Y110.625 E.07438
G1 X127.466 Y110.879
G1 X125.501 Y108.914 E.08538
G1 X124.968 Y108.914
G1 X127.248 Y111.194 E.09909
G1 X127.047 Y111.526
G1 X124.435 Y108.914 E.11352
G1 X123.902 Y108.914
G1 X126.901 Y111.913 E.13032
G1 X126.804 Y112.35
G1 X123.368 Y108.914 E.1493
G1 X122.835 Y108.914
G1 X126.762 Y112.841 E.17063
G1 X126.835 Y113.447
G1 X122.302 Y108.914 E.19701
G1 X121.768 Y108.914
G1 X127.358 Y114.503 E.24289
M204 S10000
; WIPE_START
G1 F24000
G1 X125.944 Y113.089 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.928 J.788 P1  F30000
G1 X128.946 Y116.625 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X121.235 Y108.914 E.33507
G1 X120.702 Y108.914
G1 X128.413 Y116.625 E.33507
G1 X127.879 Y116.625
G1 X120.169 Y108.914 E.33507
G1 X119.635 Y108.914
G1 X127.346 Y116.625 E.33507
G1 X126.813 Y116.625
G1 X119.102 Y108.914 E.33507
G1 X118.569 Y108.914
G1 X126.28 Y116.625 E.33507
G1 X125.746 Y116.625
G1 X118.036 Y108.914 E.33507
G1 X117.502 Y108.914
G1 X125.213 Y116.625 E.33507
G1 X124.68 Y116.625
G1 X116.969 Y108.914 E.33507
G1 X116.436 Y108.914
G1 X124.147 Y116.625 E.33507
G1 X123.613 Y116.625
G1 X116.291 Y109.302 E.31819
G1 X116.291 Y109.835
G1 X123.08 Y116.625 E.29502
G1 X122.547 Y116.625
G1 X116.291 Y110.369 E.27185
G1 X116.291 Y110.902
G1 X122.013 Y116.625 E.24868
G1 X121.48 Y116.625
G1 X116.291 Y111.435 E.2255
G1 X116.291 Y111.969
G1 X120.947 Y116.625 E.20233
G1 X120.414 Y116.625
G1 X116.291 Y112.502 E.17916
G1 X116.291 Y113.035
G1 X119.88 Y116.625 E.15598
G1 X119.347 Y116.625
G1 X116.291 Y113.568 E.13281
G1 X116.291 Y114.102
G1 X118.814 Y116.625 E.10964
G1 X118.281 Y116.625
G1 X116.291 Y114.635 E.08646
G1 X116.291 Y115.168
G1 X117.747 Y116.625 E.06329
G1 X117.214 Y116.625
G1 X116.291 Y115.701 E.04012
G1 X116.291 Y116.235
G1 X116.681 Y116.625 E.01694
M204 S10000
; WIPE_START
G1 F24000
G1 X116.291 Y116.235 E-.20954
G1 X116.291 Y115.701 E-.20264
G1 X116.938 Y116.349 E-.34782
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.134 J1.21 P1  F30000
G1 X127.874 Y115.14 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.236512
G1 F15000
G3 X127.418 Y114.709 I3.329 J-3.979 E.00991
G1 X127.298 Y114.564 E.00298
; WIPE_START
G1 F24000
G1 X127.418 Y114.709 E-.17574
G1 X127.874 Y115.14 E-.58426
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.171 J.333 P1  F30000
G1 X129.377 Y109.857 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.110621
G1 F15000
G2 X129.222 Y109.936 I.564 J1.296 E.00096
; WIPE_START
G1 F24000
G1 X129.377 Y109.857 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.485 J1.116 P1  F30000
G1 X131.95 Y110.975 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.217664
G1 F15000
G2 X131.814 Y110.815 I-1.396 J1.04 E.00299
G1 X131.371 Y110.397 E.00867
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 3.13333
; LAYER_HEIGHT: 0.133333
; WIPE_START
G1 F24000
G1 X131.814 Y110.815 E-.56509
G1 X131.95 Y110.975 E-.19491
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/135
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
G3 Z3.4 I-1.047 J.621 P1  F30000
G1 X138.631 Y122.246 Z3.4
G1 Z3.133
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.266667
G1 F5392
G1 X144.385 Y122.246 E.2268
G1 X144.385 Y125.123 E.1134
G1 X144.289 Y125.123 E.00382
G1 X144.385 Y130.877 E.22683
G1 X144.289 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X144.385 Y130.877 E-.03681
G1 X144.353 Y128.974 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.533 I.077 J-1.215 P1  F30000
G1 X131.885 Y128.187 Z3.533
G1 Z3.133
G1 E.8 F1800
G1 F5392
G3 X128.092 Y128 I-1.891 J-.195 E.22743
G1 X131.908 Y128 E.15037
G2 X128.115 Y127.813 I-1.901 J-.001 E.22804
; WIPE_START
G1 F24000
G1 X128.311 Y127.114 E-.27595
G1 X128.572 Y126.735 E-.17474
G1 X128.916 Y126.43 E-.17474
G1 X129.23 Y126.266 E-.13457
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.533 I.507 J-1.106 P1  F30000
G1 X120.939 Y122.461 Z3.533
G1 Z3.133
G1 E.8 F1800
G1 F5392
G1 X121.369 Y122.461 E.01695
G1 X121.369 Y122.246 E.0085
G1 X115.615 Y122.246 E.2268
G1 X115.711 Y128 E.22683
G1 X115.615 Y128 E.00382
G1 X115.615 Y130.877 E.1134
G1 X115.711 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X115.615 Y130.877 E-.03681
G1 X115.615 Y128.974 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.533 I1.217 J-.026 P1  F30000
G1 X115.335 Y115.646 Z3.533
G1 Z3.133
G1 E.8 F1800
G1 F5392
G1 X115.238 Y115.646 E.00382
G1 X115.238 Y112.769 E.1134
G1 X115.335 Y112.769 E.00382
G1 X115.238 Y107.015 E.22683
G1 X120.992 Y107.015 E.2268
M73 P41 R13
G1 X120.992 Y107.231 E.0085
G1 X120.562 Y107.231 E.01695
; WIPE_START
G1 F24000
G1 X120.992 Y107.231 E-.16342
M73 P42 R13
G1 X120.992 Y107.015 E-.08194
G1 X119.638 Y107.015 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.533 I-.689 J1.003 P1  F30000
G1 X127.739 Y112.582 Z3.533
G1 Z3.133
G1 E.8 F1800
G1 F5392
G3 X131.531 Y112.769 I1.892 J.186 E.22804
G1 X127.716 Y112.769 E.15037
G2 X131.508 Y112.956 I1.901 J-.008 E.22743
; WIPE_START
G1 F24000
G1 X131.312 Y113.656 E-.27595
G1 X131.051 Y114.034 E-.17474
G1 X130.707 Y114.339 E-.17474
G1 X130.393 Y114.504 E-.13456
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.533 I.839 J.881 P1  F30000
G1 X138.255 Y107.015 Z3.533
G1 Z3.133
G1 E.8 F1800
G1 F5392
G1 X144.009 Y107.015 E.2268
G1 X144.009 Y109.892 E.1134
G1 X143.912 Y109.892 E.00382
G1 X144.009 Y115.646 E.22683
G1 X143.912 Y115.646 E.00382
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.0666666
; WIPE_START
G1 F24000
G1 X144.009 Y115.646 E-.03681
G1 X143.977 Y113.743 E-.72319
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/135
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
G3 Z3.533 I-1.216 J-.056 P1  F30000
G1 X143.148 Y131.602 Z3.533
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F5392
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5392
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5392
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5392
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5392
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5392
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5392
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5392
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5392
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5392
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5392
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5392
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/135
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
G3 Z3.6 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.266667
G1 F9000
G1 X144.385 Y122.246 E.2268
G1 X144.385 Y125.123 E.1134
G1 X144.289 Y125.123 E.00382
G3 X144.139 Y125.373 I-.2 J.05 E.01277
G1 X144.139 Y128 E.10354
G1 X144.385 Y128 E.00973
G1 X144.385 Y130.877 E.1134
G1 X144.289 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X144.385 Y130.877 E-.03681
G1 X144.385 Y128.974 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.997 J-.698 P1  F30000
G1 X143.345 Y130.461 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G1 X143.981 Y130.47 E.01957
G1 X143.981 Y125.53 E.15178
G1 X143.156 Y125.539 E.02536
G1 X143.156 Y130.461 E.15127
G1 X142.279 Y130.461 E.02695
G1 X142.279 Y125.539 E.15127
G1 X141.402 Y125.539 E.02695
G1 X141.402 Y130.461 E.15127
G1 X140.525 Y130.461 E.02695
G1 X140.525 Y125.539 E.15127
G1 X139.648 Y125.539 E.02695
G1 X139.648 Y130.461 E.15127
G1 X138.771 Y130.461 E.02695
G1 X138.771 Y125.539 E.15127
G1 X137.894 Y125.539 E.02695
G1 X137.894 Y130.461 E.15127
G1 X137.017 Y130.461 E.02695
G1 X137.017 Y125.539 E.15127
G1 X136.14 Y125.539 E.02695
G1 X136.14 Y130.461 E.15127
G1 X135.262 Y130.461 E.02695
G1 X135.262 Y125.539 E.15127
G1 X134.385 Y125.539 E.02695
G1 X134.385 Y130.461 E.15127
G1 X133.508 Y130.461 E.02695
G1 X133.508 Y125.539 E.15127
G1 X132.631 Y125.539 E.02695
G1 X132.631 Y130.461 E.15127
G1 X131.754 Y130.461 E.02695
G1 X131.754 Y129.333 E.03469
G2 X131.754 Y126.667 I-1.677 J-1.333 E.08839
G1 X131.754 Y125.539 E.03469
G1 X130.877 Y125.539 E.02695
G1 X130.877 Y125.975 E.01341
G2 X130 Y125.799 I-.901 J2.221 E.02765
G1 X130 Y125.539 E.00801
G1 X129.123 Y125.539 E.02695
G1 X129.123 Y125.975 E.01341
G2 X128.357 Y126.516 I.714 J1.824 E.02909
G1 X127.964 Y127.813 F30000
; FEATURE: Support
; LAYER_HEIGHT: 0.266667
G1 F9000
G3 X132.059 Y128 I2.043 J.186 E.24671
G1 X127.941 Y128 E.16228
G2 X132.036 Y128.187 I2.052 J-.008 E.24604
; WIPE_START
G1 F24000
G1 X131.823 Y128.957 E-.30342
G1 X131.541 Y129.365 E-.18858
G1 X131.169 Y129.694 E-.18859
G1 X130.984 Y129.791 E-.07941
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.514 J1.103 P1  F30000
G1 X131.643 Y129.484 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G3 X130.877 Y130.025 I-1.48 J-1.284 E.02909
G1 X130.877 Y130.461 E.01341
G1 X130 Y130.461 E.02695
G1 X130 Y130.201 E.00801
G3 X129.123 Y130.025 I.024 J-2.396 E.02765
G1 X129.123 Y130.461 E.01341
G1 X128.246 Y130.461 E.02695
G1 X128.246 Y129.333 E.03469
G3 X128.246 Y126.667 I1.677 J-1.333 E.08839
G1 X128.246 Y125.539 E.03469
G1 X127.369 Y125.539 E.02695
G1 X127.369 Y130.461 E.15127
G1 X126.492 Y130.461 E.02695
G1 X126.492 Y125.539 E.15127
G1 X125.615 Y125.539 E.02695
G1 X125.615 Y130.461 E.15127
G1 X124.738 Y130.461 E.02695
G1 X124.738 Y125.539 E.15127
G1 X123.86 Y125.539 E.02695
G1 X123.86 Y130.461 E.15127
G1 X122.983 Y130.461 E.02695
G1 X122.983 Y125.539 E.15127
G1 X122.106 Y125.539 E.02695
G1 X122.106 Y130.461 E.15127
G1 X121.229 Y130.461 E.02695
G1 X121.229 Y125.539 E.15127
G1 X120.352 Y125.539 E.02695
G1 X120.352 Y130.461 E.15127
G1 X119.475 Y130.461 E.02695
G1 X119.475 Y125.539 E.15127
G1 X118.598 Y125.539 E.02695
G1 X118.598 Y130.461 E.15127
G1 X117.721 Y130.461 E.02695
G1 X117.721 Y125.539 E.15127
G1 X116.844 Y125.539 E.02695
G1 X116.844 Y130.461 E.15127
G1 X116.019 Y130.47 E.02536
G1 X116.019 Y125.53 E.15178
G1 X116.655 Y125.539 E.01957
; WIPE_START
G1 F24000
G1 X116.019 Y125.53 E-.24198
G1 X116.019 Y126.893 E-.51802
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.814 J.904 P1  F30000
G1 X120.939 Y122.461 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.266667
G1 F9000
G1 X121.369 Y122.461 E.01695
G1 X121.369 Y122.246 E.0085
G1 X115.615 Y122.246 E.2268
G1 X115.615 Y125.123 E.1134
G1 X115.711 Y125.123 E.00382
G2 X115.861 Y125.373 I.2 J.05 E.01277
G1 X115.861 Y128 E.10354
G1 X115.615 Y128 E.00973
G1 X115.615 Y130.877 E.1134
G1 X115.711 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X115.615 Y130.877 E-.03681
G1 X115.615 Y128.974 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.116 J1.211 P1  F30000
G1 X143.148 Y131.602 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F15000
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F15000
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.147 J.407 P1  F30000
G1 X143.912 Y115.646 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.266667
G1 F9000
G1 X144.009 Y115.646 E.00382
G1 X144.009 Y112.769 E.1134
G1 X143.762 Y112.769 E.00973
G1 X143.762 Y110.142 E.10354
G2 X143.912 Y109.892 I-.05 J-.2 E.01277
G1 X144.009 Y109.892 E.00382
G1 X144.009 Y107.015 E.1134
G1 X138.255 Y107.015 E.2268
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.156 J.382 P1  F30000
M73 P43 R13
G1 X142.968 Y115.231 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G1 X143.605 Y115.239 E.01957
G1 X143.605 Y110.299 E.15178
G1 X142.78 Y110.308 E.02536
G1 X142.78 Y115.231 E.15127
G1 X141.903 Y115.231 E.02695
G1 X141.903 Y110.308 E.15127
G1 X141.025 Y110.308 E.02695
G1 X141.025 Y115.231 E.15127
G1 X140.148 Y115.231 E.02695
G1 X140.148 Y110.308 E.15127
G1 X139.271 Y110.308 E.02695
G1 X139.271 Y115.231 E.15127
G1 X138.394 Y115.231 E.02695
G1 X138.394 Y110.308 E.15127
G1 X137.517 Y110.308 E.02695
G1 X137.517 Y115.231 E.15127
G1 X136.64 Y115.231 E.02695
G1 X136.64 Y110.308 E.15127
G1 X135.763 Y110.308 E.02695
G1 X135.763 Y115.231 E.15127
G1 X134.886 Y115.231 E.02695
G1 X134.886 Y110.308 E.15127
G1 X134.009 Y110.308 E.02695
G1 X134.009 Y115.231 E.15127
G1 X133.132 Y115.231 E.02695
G1 X133.132 Y110.308 E.15127
G1 X132.255 Y110.308 E.02695
G1 X132.255 Y115.231 E.15127
G1 X131.378 Y115.231 E.02695
G1 X131.378 Y114.102 E.03469
G2 X131.378 Y111.437 I-1.677 J-1.333 E.08839
G1 X131.378 Y110.308 E.03469
G1 X130.501 Y110.308 E.02695
G1 X130.501 Y110.744 E.01341
G2 X129.623 Y110.569 I-.901 J2.221 E.02765
G1 X129.623 Y110.308 E.00801
G1 X128.746 Y110.308 E.02695
G1 X128.746 Y110.744 E.01341
G2 X127.98 Y111.285 I.714 J1.824 E.02909
G1 X127.588 Y112.582 F30000
; FEATURE: Support
; LAYER_HEIGHT: 0.266667
G1 F9000
G3 X131.682 Y112.769 I2.043 J.186 E.24671
G1 X127.565 Y112.769 E.16228
G2 X131.659 Y112.956 I2.052 J-.008 E.24604
; WIPE_START
G1 F24000
G1 X131.446 Y113.726 E-.30342
G1 X131.164 Y114.134 E-.18858
G1 X130.793 Y114.463 E-.18859
G1 X130.608 Y114.561 E-.07941
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.514 J1.103 P1  F30000
G1 X131.267 Y114.254 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Support interface
; LAYER_HEIGHT: 0.2
G1 F4800
G3 X130.501 Y114.794 I-1.48 J-1.284 E.02909
G1 X130.501 Y115.231 E.01341
G1 X129.623 Y115.231 E.02695
G1 X129.623 Y114.97 E.00801
G3 X128.746 Y114.794 I.024 J-2.396 E.02765
G1 X128.746 Y115.231 E.01341
G1 X127.869 Y115.231 E.02695
G1 X127.869 Y114.102 E.03469
G3 X127.869 Y111.437 I1.677 J-1.333 E.08839
G1 X127.869 Y110.308 E.03469
G1 X126.992 Y110.308 E.02695
G1 X126.992 Y115.231 E.15127
G1 X126.115 Y115.231 E.02695
G1 X126.115 Y110.308 E.15127
G1 X125.238 Y110.308 E.02695
G1 X125.238 Y115.231 E.15127
G1 X124.361 Y115.231 E.02695
G1 X124.361 Y110.308 E.15127
G1 X123.484 Y110.308 E.02695
G1 X123.484 Y115.231 E.15127
G1 X122.607 Y115.231 E.02695
G1 X122.607 Y110.308 E.15127
G1 X121.73 Y110.308 E.02695
G1 X121.73 Y115.231 E.15127
G1 X120.853 Y115.231 E.02695
G1 X120.853 Y110.308 E.15127
G1 X119.976 Y110.308 E.02695
G1 X119.976 Y115.231 E.15127
G1 X119.098 Y115.231 E.02695
G1 X119.098 Y110.308 E.15127
G1 X118.221 Y110.308 E.02695
G1 X118.221 Y115.231 E.15127
G1 X117.344 Y115.231 E.02695
G1 X117.344 Y110.308 E.15127
G1 X116.467 Y110.308 E.02695
G1 X116.467 Y115.231 E.15127
G1 X115.642 Y115.239 E.02536
G1 X115.642 Y110.299 E.15178
G1 X116.279 Y110.308 E.01957
; WIPE_START
G1 F24000
G1 X115.642 Y110.299 E-.24198
G1 X115.642 Y111.663 E-.51802
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.814 J.904 P1  F30000
G1 X120.562 Y107.231 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.266667
G1 F9000
G1 X120.992 Y107.231 E.01695
G1 X120.992 Y107.015 E.0085
G1 X115.238 Y107.015 E.2268
G1 X115.238 Y109.892 E.1134
G1 X115.335 Y109.892 E.00382
G2 X115.485 Y110.142 I.2 J.05 E.01277
G1 X115.485 Y112.769 E.10354
G1 X115.238 Y112.769 E.00973
G1 X115.238 Y115.646 E.1134
G1 X115.335 Y115.646 E.00382
; WIPE_START
G1 F24000
G1 X115.238 Y115.646 E-.03681
G1 X115.238 Y113.743 E-.72319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.116 J1.211 P1  F30000
G1 X142.771 Y116.371 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F15000
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F15000
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/135
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
G3 Z3.8 I-1.209 J.137 P1  F30000
G1 X143.148 Y131.602 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 3.67647
; LAYER_HEIGHT: 0.0764706
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/135
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
G3 Z4 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z4
G1 Z3.676
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F9000
G1 X144.385 Y122.246 E.23378
G1 X144.359 Y130.877 E.35067
; WIPE_START
G1 F24000
G1 X144.365 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.076 I-1.023 J-.659 P1  F30000
G1 X143.345 Y130.461 Z4.076
G1 Z3.676
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X143.981 Y130.47 E.02587
G1 X143.981 Y125.53 E.20069
G1 X143.156 Y125.539 E.03353
G1 X143.156 Y130.461 E.20001
G1 X142.279 Y130.461 E.03563
G1 X142.279 Y125.539 E.20001
G1 X141.402 Y125.539 E.03563
G1 X141.402 Y130.461 E.20001
G1 X140.525 Y130.461 E.03563
G1 X140.525 Y125.539 E.20001
M73 P44 R13
G1 X139.648 Y125.539 E.03563
G1 X139.648 Y130.461 E.20001
G1 X138.771 Y130.461 E.03563
G1 X138.771 Y125.539 E.20001
G1 X137.894 Y125.539 E.03563
G1 X137.894 Y130.461 E.20001
G1 X137.017 Y130.461 E.03563
G1 X137.017 Y125.539 E.20001
G1 X136.14 Y125.539 E.03563
G1 X136.14 Y130.461 E.20001
G1 X135.262 Y130.461 E.03563
G1 X135.262 Y125.539 E.20001
G1 X134.385 Y125.539 E.03563
G1 X134.385 Y130.461 E.20001
G1 X133.508 Y130.461 E.03563
G1 X133.508 Y125.539 E.20001
G1 X132.631 Y125.539 E.03563
G1 X132.631 Y130.461 E.20001
G1 X131.754 Y130.461 E.03563
G1 X131.754 Y129.333 E.04586
G2 X131.754 Y126.667 I-1.677 J-1.333 E.11687
G1 X131.754 Y125.539 E.04586
G1 X130.877 Y125.539 E.03563
G1 X130.877 Y125.975 E.01773
G2 X130 Y125.799 I-.901 J2.221 E.03656
G1 X130 Y125.539 E.0106
G1 X129.123 Y125.539 E.03563
G1 X129.123 Y125.975 E.01773
G2 X128.357 Y126.516 I.714 J1.824 E.03847
G1 X128.186 Y127.813 F30000
; FEATURE: Support
G1 F9000
G3 X131.837 Y128 I1.821 J.186 E.22607
G1 X128.163 Y128 E.14926
G2 X131.814 Y128.187 I1.831 J-.007 E.22547
; WIPE_START
G1 F24000
G1 X131.627 Y128.854 E-.26313
G1 X131.375 Y129.218 E-.16828
G1 X131.044 Y129.512 E-.16828
G1 X130.67 Y129.708 E-.16031
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.076 I.272 J1.186 P1  F30000
G1 X131.643 Y129.484 Z4.076
G1 Z3.676
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G3 X130.877 Y130.025 I-1.48 J-1.284 E.03847
G1 X130.877 Y130.461 E.01773
G1 X130 Y130.461 E.03563
G1 X130 Y130.201 E.0106
G3 X129.123 Y130.025 I.024 J-2.396 E.03656
G1 X129.123 Y130.461 E.01773
G1 X128.246 Y130.461 E.03563
G1 X128.246 Y129.333 E.04586
G3 X128.246 Y126.667 I1.677 J-1.333 E.11687
G1 X128.246 Y125.539 E.04586
G1 X127.369 Y125.539 E.03563
G1 X127.369 Y130.461 E.20001
G1 X126.492 Y130.461 E.03563
G1 X126.492 Y125.539 E.20001
G1 X125.615 Y125.539 E.03563
G1 X125.615 Y130.461 E.20001
G1 X124.738 Y130.461 E.03563
G1 X124.738 Y125.539 E.20001
G1 X123.86 Y125.539 E.03563
G1 X123.86 Y130.461 E.20001
G1 X122.983 Y130.461 E.03563
G1 X122.983 Y125.539 E.20001
G1 X122.106 Y125.539 E.03563
G1 X122.106 Y130.461 E.20001
G1 X121.229 Y130.461 E.03563
G1 X121.229 Y125.539 E.20001
G1 X120.352 Y125.539 E.03563
G1 X120.352 Y130.461 E.20001
G1 X119.475 Y130.461 E.03563
G1 X119.475 Y125.539 E.20001
G1 X118.598 Y125.539 E.03563
G1 X118.598 Y130.461 E.20001
G1 X117.721 Y130.461 E.03563
G1 X117.721 Y125.539 E.20001
G1 X116.844 Y125.539 E.03563
G1 X116.844 Y130.461 E.20001
G1 X116.019 Y130.47 E.03353
G1 X116.019 Y125.53 E.20069
G1 X116.655 Y125.539 E.02587
; WIPE_START
G1 F24000
G1 X116.019 Y125.53 E-.24199
G1 X116.019 Y126.893 E-.51801
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.076 I.814 J.904 P1  F30000
G1 X120.939 Y122.461 Z4.076
G1 Z3.676
G1 E.8 F1800
; FEATURE: Support
G1 F9000
G1 X121.369 Y122.461 E.01747
G1 X121.369 Y122.246 E.00876
G1 X115.615 Y122.246 E.23378
G1 X115.641 Y130.877 E.35067
; WIPE_START
G1 F24000
G1 X115.635 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.076 I1.216 J-.034 P1  F30000
G1 X115.265 Y115.646 Z4.076
G1 Z3.676
G1 E.8 F1800
G1 F9000
G1 X115.238 Y107.015 E.35067
G1 X120.992 Y107.015 E.23378
G1 X120.992 Y107.231 E.00876
G1 X120.562 Y107.231 E.01747
; WIPE_START
G1 F24000
G1 X120.992 Y107.231 E-.16342
G1 X120.992 Y107.015 E-.08194
G1 X119.638 Y107.015 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.076 I-.852 J-.869 P1  F30000
G1 X116.279 Y110.308 Z4.076
G1 Z3.676
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X115.642 Y110.299 E.02587
G1 X115.642 Y115.239 E.20069
G1 X116.467 Y115.231 E.03353
G1 X116.467 Y110.308 E.20001
G1 X117.344 Y110.308 E.03563
G1 X117.344 Y115.231 E.20001
G1 X118.221 Y115.231 E.03563
G1 X118.221 Y110.308 E.20001
G1 X119.098 Y110.308 E.03563
G1 X119.098 Y115.231 E.20001
G1 X119.976 Y115.231 E.03563
G1 X119.976 Y110.308 E.20001
G1 X120.853 Y110.308 E.03563
G1 X120.853 Y115.231 E.20001
G1 X121.73 Y115.231 E.03563
G1 X121.73 Y110.308 E.20001
G1 X122.607 Y110.308 E.03563
G1 X122.607 Y115.231 E.20001
G1 X123.484 Y115.231 E.03563
G1 X123.484 Y110.308 E.20001
G1 X124.361 Y110.308 E.03563
G1 X124.361 Y115.231 E.20001
G1 X125.238 Y115.231 E.03563
G1 X125.238 Y110.308 E.20001
G1 X126.115 Y110.308 E.03563
G1 X126.115 Y115.231 E.20001
G1 X126.992 Y115.231 E.03563
G1 X126.992 Y110.308 E.20001
G1 X127.869 Y110.308 E.03563
G1 X127.869 Y111.437 E.04586
G2 X127.869 Y114.102 I1.677 J1.333 E.11687
G1 X127.869 Y115.231 E.04586
G1 X128.746 Y115.231 E.03563
G1 X128.746 Y114.794 E.01773
G2 X129.623 Y114.97 I.901 J-2.221 E.03656
G1 X129.623 Y115.231 E.0106
G1 X130.501 Y115.231 E.03563
G1 X130.501 Y114.794 E.01773
G2 X131.267 Y114.254 I-.714 J-1.824 E.03847
G1 X131.438 Y112.956 F30000
; FEATURE: Support
G1 F9000
G3 X127.786 Y112.769 I-1.82 J-.194 E.22547
G1 X131.46 Y112.769 E.14926
G2 X127.809 Y112.582 I-1.83 J-.001 E.22607
; WIPE_START
G1 F24000
G1 X127.997 Y111.916 E-.26313
G1 X128.248 Y111.551 E-.16828
G1 X128.58 Y111.257 E-.16828
G1 X128.953 Y111.061 E-.16031
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.076 I-.272 J-1.186 P1  F30000
G1 X127.98 Y111.285 Z4.076
G1 Z3.676
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G3 X128.746 Y110.744 I1.48 J1.284 E.03847
G1 X128.746 Y110.308 E.01773
G1 X129.623 Y110.308 E.03563
G1 X129.623 Y110.569 E.0106
G3 X130.501 Y110.744 I-.024 J2.396 E.03656
G1 X130.501 Y110.308 E.01773
G1 X131.378 Y110.308 E.03563
G1 X131.378 Y111.437 E.04586
G3 X131.378 Y114.102 I-1.677 J1.333 E.11687
G1 X131.378 Y115.231 E.04586
G1 X132.255 Y115.231 E.03563
G1 X132.255 Y110.308 E.20001
G1 X133.132 Y110.308 E.03563
G1 X133.132 Y115.231 E.20001
G1 X134.009 Y115.231 E.03563
G1 X134.009 Y110.308 E.20001
G1 X134.886 Y110.308 E.03563
G1 X134.886 Y115.231 E.20001
G1 X135.763 Y115.231 E.03563
G1 X135.763 Y110.308 E.20001
G1 X136.64 Y110.308 E.03563
G1 X136.64 Y115.231 E.20001
G1 X137.517 Y115.231 E.03563
G1 X137.517 Y110.308 E.20001
G1 X138.394 Y110.308 E.03563
G1 X138.394 Y115.231 E.20001
G1 X139.271 Y115.231 E.03563
G1 X139.271 Y110.308 E.20001
G1 X140.148 Y110.308 E.03563
G1 X140.148 Y115.231 E.20001
G1 X141.025 Y115.231 E.03563
G1 X141.025 Y110.308 E.20001
G1 X141.903 Y110.308 E.03563
G1 X141.903 Y115.231 E.20001
G1 X142.78 Y115.231 E.03563
G1 X142.78 Y110.308 E.20001
G1 X143.605 Y110.299 E.03353
G1 X143.605 Y115.239 E.20069
G1 X142.968 Y115.231 E.02587
; WIPE_START
G1 F24000
G1 X143.605 Y115.239 E-.24199
G1 X143.605 Y113.876 E-.51801
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.076 I-1.19 J.254 P1  F30000
G1 X143.982 Y115.646 Z4.076
G1 Z3.676
G1 E.8 F1800
; FEATURE: Support
G1 F9000
G1 X144.009 Y107.015 E.35067
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.123529
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/135
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
G3 Z4.076 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z4.076
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F15000
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F15000
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F15000
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F15000
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 3.95294
; LAYER_HEIGHT: 0.152941
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/135
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
G3 Z4.2 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z4.2
G1 Z3.953
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.353 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z4.353
G1 Z3.953
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
M73 P45 R13
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.353 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z4.353
G1 Z3.953
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.353 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z4.353
G1 Z3.953
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.0470588
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/135
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
G3 Z4.353 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z4.353
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/135
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
G3 Z4.4 I-1.209 J.137 P1  F30000
G1 X143.148 Y131.602 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 4.22941
; LAYER_HEIGHT: 0.0294118
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/135
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
G3 Z4.6 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z4.6
G1 Z4.229
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
M73 P46 R13
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
M73 P46 R12
G3 Z4.629 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z4.629
G1 Z4.229
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.629 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z4.629
G1 Z4.229
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.629 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z4.629
G1 Z4.229
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.170588
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/135
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
G3 Z4.629 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z4.629
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 4.50588
; LAYER_HEIGHT: 0.105882
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/135
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
G3 Z4.8 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z4.8
G1 Z4.506
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.906 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z4.906
G1 Z4.506
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
M73 P47 R12
G3 Z4.906 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z4.906
G1 Z4.506
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.906 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z4.906
G1 Z4.506
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.0941176
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/135
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
G3 Z4.906 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z4.906
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 4.78235
; LAYER_HEIGHT: 0.182353
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/135
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
G3 Z5 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z5
G1 Z4.782
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.182 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z5.182
G1 Z4.782
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.182 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z5.182
G1 Z4.782
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.182 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z5.182
G1 Z4.782
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.0176473
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/135
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
G3 Z5.182 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z5.182
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
M73 P48 R12
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/135
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
G3 Z5.2 I-1.209 J.137 P1  F30000
G1 X143.148 Y131.602 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 5.05882
; LAYER_HEIGHT: 0.0588236
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/135
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
G3 Z5.4 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z5.4
G1 Z5.059
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.459 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z5.459
G1 Z5.059
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.459 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z5.459
M73 P49 R12
G1 Z5.059
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.459 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z5.459
G1 Z5.059
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.141176
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/135
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
G3 Z5.459 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z5.459
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 5.33529
; LAYER_HEIGHT: 0.135294
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/135
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
G3 Z5.6 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z5.6
G1 Z5.335
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.735 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z5.735
G1 Z5.335
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.735 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z5.735
G1 Z5.335
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.735 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z5.735
G1 Z5.335
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.0647058
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/135
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
G3 Z5.735 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z5.735
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
M73 P50 R12
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/135
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
G3 Z5.8 I-1.209 J.137 P1  F30000
G1 X143.148 Y131.602 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z6
G1 Z5.6
M73 P50 R11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 5.61176
; LAYER_HEIGHT: 0.011765
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/135
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
G3 Z6 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z6
G1 Z5.612
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.012 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z6.012
G1 Z5.612
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.012 I1.204 J-.174 P1  F30000
M73 P51 R11
G1 X115.238 Y115.646 Z6.012
G1 Z5.612
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.012 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z6.012
G1 Z5.612
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.188235
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/135
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
G3 Z6.012 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z6.012
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 5.88824
; LAYER_HEIGHT: 0.0882349
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/135
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
G3 Z6.2 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z6.2
G1 Z5.888
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.288 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z6.288
G1 Z5.888
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.288 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z6.288
G1 Z5.888
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.288 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z6.288
G1 Z5.888
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.111765
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/135
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
G3 Z6.288 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z6.288
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
M73 P52 R11
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 6.16471
; LAYER_HEIGHT: 0.164706
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/135
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
G3 Z6.4 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z6.4
G1 Z6.165
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.565 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z6.565
G1 Z6.165
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.565 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z6.565
G1 Z6.165
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.565 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z6.565
G1 Z6.165
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.0352941
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/135
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
G3 Z6.565 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z6.565
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/135
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
G3 Z6.6 I-1.209 J.137 P1  F30000
G1 X143.148 Y131.602 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P53 R11
G1 F4358
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 6.44118
; LAYER_HEIGHT: 0.0411763
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/135
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
G3 Z6.8 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z6.8
G1 Z6.441
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.841 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z6.841
G1 Z6.441
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.841 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z6.841
G1 Z6.441
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.841 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z6.841
G1 Z6.441
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.158823
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/135
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
G3 Z6.841 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z6.841
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
M73 P54 R11
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 6.71765
; LAYER_HEIGHT: 0.117647
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/135
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
G3 Z7 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z7
G1 Z6.718
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.118 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z7.118
G1 Z6.718
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.118 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z7.118
G1 Z6.718
G1 E.8 F1800
G1 F6342
M73 P54 R10
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.118 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z7.118
G1 Z6.718
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.0823531
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/135
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
G3 Z7.118 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z7.118
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 6.99412
; LAYER_HEIGHT: 0.194118
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/135
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
G3 Z7.2 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z7.2
G1 Z6.994
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.394 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z7.394
M73 P55 R10
G1 Z6.994
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.394 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z7.394
G1 Z6.994
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.394 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z7.394
G1 Z6.994
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.00588226
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/135
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
G3 Z7.394 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z7.394
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/135
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
G3 Z7.4 I-1.209 J.137 P1  F30000
G1 X143.148 Y131.602 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
M73 P56 R10
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 7.27059
; LAYER_HEIGHT: 0.0705886
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/135
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
G3 Z7.6 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z7.6
G1 Z7.271
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.671 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z7.671
G1 Z7.271
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.671 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z7.671
G1 Z7.271
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.671 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z7.671
G1 Z7.271
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.129412
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/135
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
G3 Z7.671 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z7.671
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 7.54706
; LAYER_HEIGHT: 0.147059
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/135
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
G3 Z7.8 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z7.8
G1 Z7.547
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.947 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z7.947
M73 P57 R10
G1 Z7.547
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.947 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z7.947
G1 Z7.547
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.947 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z7.947
G1 Z7.547
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.0529408
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/135
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
G3 Z7.947 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z7.947
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/135
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
G3 Z8 I-1.209 J.137 P1  F30000
G1 X143.148 Y131.602 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
M73 P58 R10
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 7.82353
; LAYER_HEIGHT: 0.0235291
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/135
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
G3 Z8.2 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z8.2
G1 Z7.824
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.224 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z8.224
G1 Z7.824
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.224 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z8.224
G1 Z7.824
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.224 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z8.224
G1 Z7.824
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.176471
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/135
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
G3 Z8.224 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z8.224
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
M73 P58 R9
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 8.1
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/135
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
G3 Z8.4 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z8.4
G1 Z8.1
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.5 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z8.5
M73 P59 R9
G1 Z8.1
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.5 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z8.5
G1 Z8.1
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.5 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z8.5
G1 Z8.1
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.0999994
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/135
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
G3 Z8.5 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z8.5
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 8.37647
; LAYER_HEIGHT: 0.176471
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/135
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
G3 Z8.6 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z8.6
G1 Z8.376
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.776 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z8.776
G1 Z8.376
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.776 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z8.776
G1 Z8.376
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.776 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z8.776
G1 Z8.376
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.0235291
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/135
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
G3 Z8.776 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z8.776
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
M73 P60 R9
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/135
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
G3 Z8.8 I-1.209 J.137 P1  F30000
G1 X143.148 Y131.602 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 8.65294
; LAYER_HEIGHT: 0.0529404
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/135
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
G3 Z9 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z9
G1 Z8.653
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.053 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z9.053
G1 Z8.653
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
M73 P61 R9
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.053 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z9.053
G1 Z8.653
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.053 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z9.053
G1 Z8.653
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.147059
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/135
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
G3 Z9.053 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z9.053
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 8.92941
; LAYER_HEIGHT: 0.129412
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/135
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
G3 Z9.2 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z9.2
G1 Z8.929
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.329 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z9.329
G1 Z8.929
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.329 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z9.329
G1 Z8.929
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.329 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z9.329
G1 Z8.929
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.0705881
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/135
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
G3 Z9.329 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z9.329
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
M73 P62 R9
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/135
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
G3 Z9.4 I-1.209 J.137 P1  F30000
G1 X143.148 Y131.602 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
M73 P62 R8
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 9.20588
; LAYER_HEIGHT: 0.00588226
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/135
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
G3 Z9.6 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z9.6
G1 Z9.206
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.606 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z9.606
G1 Z9.206
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
M73 P63 R8
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.606 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z9.606
G1 Z9.206
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.606 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z9.606
G1 Z9.206
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.194118
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 76/135
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
G3 Z9.606 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z9.606
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 9.48235
; LAYER_HEIGHT: 0.0823536
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 77/135
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
G3 Z9.8 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z9.8
G1 Z9.482
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.882 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z9.882
G1 Z9.482
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.882 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z9.882
G1 Z9.482
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.882 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z9.882
G1 Z9.482
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.117647
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 78/135
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
G3 Z9.882 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z9.882
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
M73 P64 R8
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 9.75882
; LAYER_HEIGHT: 0.158823
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 79/135
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
G3 Z10 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z10
G1 Z9.759
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.159 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z10.159
G1 Z9.759
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.159 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z10.159
G1 Z9.759
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.159 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z10.159
G1 Z9.759
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.0411768
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 80/135
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
G3 Z10.159 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z10.159
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 81/135
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
G3 Z10.2 I-1.209 J.137 P1  F30000
G1 X143.148 Y131.602 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
M73 P65 R8
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 10.0353
; LAYER_HEIGHT: 0.0352945
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 82/135
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
G3 Z10.4 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z10.4
G1 Z10.035
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.435 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z10.435
G1 Z10.035
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.435 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z10.435
G1 Z10.035
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.435 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z10.435
G1 Z10.035
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.164705
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 83/135
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
G3 Z10.435 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z10.435
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
M73 P66 R8
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 10.3118
; LAYER_HEIGHT: 0.111765
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 84/135
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
G3 Z10.6 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z10.6
G1 Z10.312
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.712 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z10.712
G1 Z10.312
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.712 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z10.712
G1 Z10.312
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.712 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z10.712
G1 Z10.312
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.0882349
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 85/135
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
G3 Z10.712 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z10.712
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
M73 P66 R7
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 10.5882
; LAYER_HEIGHT: 0.188235
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 86/135
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
G3 Z10.8 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z10.8
G1 Z10.588
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
M73 P67 R7
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.988 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z10.988
G1 Z10.588
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.988 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z10.988
G1 Z10.588
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.988 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z10.988
G1 Z10.588
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.0117655
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 87/135
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
G3 Z10.988 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z10.988
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 88/135
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
G3 Z11 I-1.209 J.137 P1  F30000
G1 X143.148 Y131.602 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z11.2
M73 P68 R7
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 10.8647
; LAYER_HEIGHT: 0.0647058
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 89/135
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
G3 Z11.2 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z11.2
G1 Z10.865
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.265 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z11.265
G1 Z10.865
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.265 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z11.265
G1 Z10.865
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.265 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z11.265
G1 Z10.865
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.135294
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 90/135
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
G3 Z11.265 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z11.265
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 11.1412
; LAYER_HEIGHT: 0.141176
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 91/135
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
G3 Z11.4 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z11.4
G1 Z11.141
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
M73 P69 R7
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.541 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z11.541
G1 Z11.141
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.541 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z11.541
G1 Z11.141
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.541 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z11.541
G1 Z11.141
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.0588236
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 92/135
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
G3 Z11.541 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z11.541
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 93/135
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
G3 Z11.6 I-1.209 J.137 P1  F30000
G1 X143.148 Y131.602 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I1.169 J-.339 P1  F30000
M73 P70 R7
G1 X116.476 Y109.167 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 11.4176
; LAYER_HEIGHT: 0.0176477
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 94/135
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
G3 Z11.8 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z11.8
G1 Z11.418
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.818 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z11.818
G1 Z11.418
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.818 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z11.818
G1 Z11.418
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.818 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z11.818
G1 Z11.418
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.182353
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 95/135
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
G3 Z11.818 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z11.818
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 11.6941
; LAYER_HEIGHT: 0.0941172
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 96/135
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
G3 Z12 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z12
G1 Z11.694
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
M73 P71 R7
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
M73 P71 R6
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.094 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z12.094
G1 Z11.694
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.094 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z12.094
G1 Z11.694
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.094 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z12.094
G1 Z11.694
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.105883
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 97/135
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
G3 Z12.094 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z12.094
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 11.9706
; LAYER_HEIGHT: 0.170588
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 98/135
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
G3 Z12.2 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z12.2
G1 Z11.971
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.371 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z12.371
G1 Z11.971
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.371 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z12.371
G1 Z11.971
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.371 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z12.371
G1 Z11.971
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.0294113
; WIPE_START
G1 F24000
M73 P72 R6
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 99/135
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
G3 Z12.371 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z12.371
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 100/135
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
G3 Z12.4 I-1.209 J.137 P1  F30000
G1 X143.148 Y131.602 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4358
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4358
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F4358
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 12.2471
; LAYER_HEIGHT: 0.0470591
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 101/135
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
G3 Z12.6 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z12.6
G1 Z12.247
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F6342
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
M73 P73 R6
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.647 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z12.647
G1 Z12.247
G1 E.8 F1800
G1 F6342
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.647 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z12.647
G1 Z12.247
G1 E.8 F1800
G1 F6342
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.647 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z12.647
G1 Z12.247
G1 E.8 F1800
G1 F6342
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.152941
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 102/135
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
G3 Z12.647 I-1.209 J.142 P1  F30000
G1 X143.148 Y131.602 Z12.647
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6342
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I1.169 J-.339 P1  F30000
G1 X116.852 Y124.398 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X116.912 Y124.398 E.87029
G1 X116.46 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X116.52 Y124.79 E.83025
M204 S10000
G1 X117.056 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I1.183 J.283 P1  F30000
G1 X142.771 Y116.371 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I1.169 J-.339 P1  F30000
G1 X116.476 Y109.167 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6342
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X116.536 Y109.167 E.87029
G1 X116.083 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6342
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X116.143 Y109.559 E.83025
M204 S10000
G1 X116.679 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6342
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 12.5235
; LAYER_HEIGHT: 0.123529
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 103/135
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
G3 Z12.8 I-1.205 J-.173 P1  F30000
G1 X138.631 Y122.246 Z12.8
G1 Z12.524
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276471
G1 F7230
G1 X144.385 Y122.246 E.23378
G1 X144.385 Y125.123 E.11689
G1 X144.289 Y125.123 E.00394
G1 X144.289 Y125.223 E.00407
G1 X143.973 Y125.539 E.01813
G1 X116.027 Y125.539 E1.13538
G1 X115.711 Y125.223 E.01813
G1 X115.711 Y125.123 E.00407
G1 X115.615 Y125.123 E.00394
G1 X115.615 Y122.246 E.11689
G1 X121.369 Y122.246 E.23378
G1 X121.369 Y122.461 E.00876
G1 X120.939 Y122.461 E.01747
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.924 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z12.924
G1 Z12.524
G1 E.8 F1800
G1 F7230
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.924 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z12.924
G1 Z12.524
G1 E.8 F1800
G1 F7230
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.924 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z12.924
G1 Z12.524
G1 E.8 F1800
G1 F7230
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X143.597 Y110.308 E1.13538
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.0764713
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
M73 P74 R6
G1 E-.04 F1800
; layer num/total_layer_count: 104/135
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
G3 Z12.924 I-.75 J-.958 P1  F30000
G1 X118.054 Y124.398 Z12.924
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F7230
G1 X116.852 Y124.398 E.03987
G1 X116.852 Y123.602 E.0264
G1 X118.054 Y123.602 E.03987
G1 X118.054 Y124.338 E.02441
G1 X118.446 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7230
G1 X116.46 Y124.79 E.06103
G1 X116.46 Y123.21 E.04855
G1 X118.446 Y123.21 E.06103
G1 X118.446 Y124.73 E.04671
M204 S10000
G1 X117.851 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F7230
G1 X117.056 Y124 E.02518
; WIPE_START
G1 F24000
G1 X117.851 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I-.227 J1.196 P1  F30000
G1 X119.946 Y124.398 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7230
G1 X119.946 Y123.602 E.0264
G1 X140.054 Y123.602 E.66702
G1 X140.054 Y124.398 E.0264
G1 X120.006 Y124.398 E.66503
G1 X119.554 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7230
G1 X119.554 Y123.21 E.04855
G1 X140.446 Y123.21 E.64196
G1 X140.446 Y124.79 E.04855
G1 X119.614 Y124.79 E.64012
M204 S10000
G1 X120.149 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F7230
G1 X139.851 Y124 E.62412
; WIPE_START
G1 F24000
G1 X137.851 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I-.118 J1.211 P1  F30000
G1 X141.946 Y124.398 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7230
G1 X141.946 Y123.602 E.0264
G1 X143.148 Y123.602 E.03987
G1 X143.148 Y124.398 E.0264
G1 X142.006 Y124.398 E.03788
G1 X141.554 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7230
G1 X141.554 Y123.21 E.04855
G1 X143.54 Y123.21 E.06103
G1 X143.54 Y124.79 E.04855
G1 X141.614 Y124.79 E.05919
M204 S10000
G1 X142.149 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F7230
G1 X142.944 Y124 E.02518
; WIPE_START
G1 F24000
G1 X142.149 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I-1.14 J-.427 P1  F30000
G1 X139.302 Y131.602 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7230
G1 X139.302 Y132.398 E.0264
G1 X120.698 Y132.398 E.61711
G1 X120.698 Y131.602 E.0264
G1 X139.242 Y131.602 E.61512
; WIPE_START
G1 F24000
G1 X139.302 Y132.398 E-.30328
G1 X138.1 Y132.398 E-.45672
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I.19 J1.202 P1  F30000
G1 X143.148 Y131.602 Z13
G1 Z12.6
G1 E.8 F1800
G1 F7230
G1 X143.148 Y132.398 E.0264
G1 X142.698 Y132.398 E.01492
G1 X142.698 Y131.602 E.0264
G1 X143.088 Y131.602 E.01293
; WIPE_START
G1 F24000
G1 X143.148 Y132.398 E-.30328
G1 X142.698 Y132.398 E-.17088
G1 X142.698 Y131.646 E-.28584
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I.002 J-1.217 P1  F30000
G1 X117.302 Y131.602 Z13
G1 Z12.6
G1 E.8 F1800
G1 F7230
G1 X117.302 Y132.398 E.0264
G1 X116.852 Y132.398 E.01492
G1 X116.852 Y131.602 E.0264
G1 X117.242 Y131.602 E.01293
; WIPE_START
G1 F24000
G1 X117.302 Y132.398 E-.30328
G1 X116.852 Y132.398 E-.17088
G1 X116.852 Y131.646 E-.28584
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I.02 J1.217 P1  F30000
G1 X143.54 Y131.21 Z13
G1 Z12.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7230
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
; WIPE_START
G1 F24000
G1 X143.54 Y132.79 E-.60083
G1 X143.121 Y132.79 E-.15917
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I.84 J-.88 P1  F30000
G1 X141.683 Y131.417 Z13
G1 Z12.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F7230
G1 X142.476 Y132.21 E.03445
G1 X142.315 Y132.583
G1 X141.15 Y131.417 E.05063
G1 X140.616 Y131.417
G1 X141.782 Y132.583 E.05063
G1 X141.248 Y132.583
G1 X140.083 Y131.417 E.05063
G1 X139.55 Y131.417
G1 X140.715 Y132.583 E.05063
G1 X140.182 Y132.583
G1 X139.524 Y131.925 E.02858
M204 S10000
G1 X139.098 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F7230
G1 X120.902 Y132 E.57645
G1 X120.476 Y132.074 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F7230
G1 X119.819 Y131.417 E.02855
G1 X119.286 Y131.417
G1 X120.451 Y132.583 E.05063
G1 X119.918 Y132.583
G1 X118.752 Y131.417 E.05063
G1 X118.219 Y131.417
G1 X119.384 Y132.583 E.05063
G1 X118.851 Y132.583
G1 X117.686 Y131.417 E.05063
G1 X117.524 Y131.789
G1 X118.318 Y132.583 E.03449
M204 S10000
; WIPE_START
G1 F24000
G1 X117.524 Y131.789 E-.42649
G1 X117.686 Y131.417 E-.15399
G1 X118.02 Y131.751 E-.17951
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I1.217 J-.018 P1  F30000
G1 X117.678 Y109.167 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7230
G1 X116.476 Y109.167 E.03987
G1 X116.476 Y108.371 E.0264
G1 X117.678 Y108.371 E.03987
G1 X117.678 Y109.107 E.02441
G1 X118.07 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7230
G1 X116.083 Y109.559 E.06103
G1 X116.083 Y107.979 E.04855
G1 X118.07 Y107.979 E.06103
G1 X118.07 Y109.499 E.04671
M204 S10000
G1 X117.474 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F7230
G1 X116.679 Y108.769 E.02518
; WIPE_START
G1 F24000
G1 X117.474 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I-.227 J1.196 P1  F30000
G1 X119.569 Y109.167 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7230
G1 X119.569 Y108.371 E.0264
G1 X139.678 Y108.371 E.66702
G1 X139.678 Y109.167 E.0264
G1 X119.629 Y109.167 E.66503
G1 X119.177 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7230
G1 X119.177 Y107.979 E.04855
G1 X140.07 Y107.979 E.64196
G1 X140.07 Y109.559 E.04855
G1 X119.237 Y109.559 E.64012
M204 S10000
G1 X119.773 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F7230
G1 X139.474 Y108.769 E.62412
; WIPE_START
G1 F24000
G1 X137.474 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I-.118 J1.211 P1  F30000
G1 X141.569 Y109.167 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7230
G1 X141.569 Y108.371 E.0264
G1 X142.771 Y108.371 E.03987
G1 X142.771 Y109.167 E.0264
G1 X141.629 Y109.167 E.03788
G1 X141.177 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7230
G1 X141.177 Y107.979 E.04855
G1 X143.163 Y107.979 E.06103
G1 X143.163 Y109.559 E.04855
G1 X141.237 Y109.559 E.05919
M204 S10000
G1 X141.773 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F7230
G1 X142.568 Y108.769 E.02518
; WIPE_START
G1 F24000
G1 X141.773 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I-1.14 J-.427 P1  F30000
G1 X138.925 Y116.371 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7230
G1 X138.925 Y117.167 E.0264
G1 X120.322 Y117.167 E.61711
G1 X120.322 Y116.371 E.0264
G1 X138.865 Y116.371 E.61512
; WIPE_START
G1 F24000
G1 X138.925 Y117.167 E-.30328
G1 X137.723 Y117.167 E-.45672
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I.19 J1.202 P1  F30000
G1 X142.771 Y116.371 Z13
G1 Z12.6
G1 E.8 F1800
G1 F7230
G1 X142.771 Y117.167 E.0264
G1 X142.322 Y117.167 E.01492
G1 X142.322 Y116.371 E.0264
G1 X142.711 Y116.371 E.01293
; WIPE_START
G1 F24000
G1 X142.771 Y117.167 E-.30328
G1 X142.322 Y117.167 E-.17088
G1 X142.322 Y116.415 E-.28584
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I.002 J-1.217 P1  F30000
G1 X116.925 Y116.371 Z13
G1 Z12.6
G1 E.8 F1800
G1 F7230
G1 X116.925 Y117.167 E.0264
G1 X116.476 Y117.167 E.01492
G1 X116.476 Y116.371 E.0264
G1 X116.865 Y116.371 E.01293
; WIPE_START
G1 F24000
G1 X116.925 Y117.167 E-.30328
G1 X116.476 Y117.167 E-.17088
G1 X116.476 Y116.415 E-.28584
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I.02 J1.217 P1  F30000
G1 X143.163 Y115.979 Z13
G1 Z12.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7230
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
; WIPE_START
G1 F24000
G1 X143.163 Y117.559 E-.60083
G1 X142.745 Y117.559 E-.15917
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I.84 J-.88 P1  F30000
G1 X141.306 Y116.187 Z13
G1 Z12.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F7230
G1 X142.099 Y116.979 E.03445
G1 X141.938 Y117.352
G1 X140.773 Y116.187 E.05063
G1 X140.24 Y116.187
G1 X141.405 Y117.352 E.05063
G1 X140.872 Y117.352
G1 X139.707 Y116.187 E.05063
G1 X139.173 Y116.187
G1 X140.339 Y117.352 E.05063
G1 X139.805 Y117.352
G1 X139.148 Y116.694 E.02858
M204 S10000
G1 X138.722 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F7230
G1 X120.525 Y116.769 E.57645
G1 X120.099 Y116.844 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F7230
G1 X119.442 Y116.187 E.02855
G1 X118.909 Y116.187
G1 X120.074 Y117.352 E.05063
G1 X119.541 Y117.352
G1 X118.376 Y116.187 E.05063
G1 X117.843 Y116.187
G1 X119.008 Y117.352 E.05063
G1 X118.475 Y117.352
G1 X117.309 Y116.187 E.05063
G1 X117.148 Y116.558
G1 X117.941 Y117.352 E.03449
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X117.148 Y116.558 E-.42649
G1 X117.309 Y116.187 E-.15399
G1 X117.643 Y116.521 E-.17951
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 105/135
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
G3 Z13 I-1.064 J.59 P1  F30000
G1 X120.939 Y122.461 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.276471
G1 F6397
G1 X121.369 Y122.461 E.01747
G1 X121.369 Y122.246 E.00876
G1 X115.615 Y122.246 E.23378
G1 X115.615 Y125.123 E.11689
G1 X115.711 Y125.123 E.00394
G1 X115.711 Y125.223 E.00407
G1 X116.027 Y125.539 E.01813
G1 X118.879 Y125.539 E.11588
G1 X119 Y125.418 E.00694
G1 X119.121 Y125.539 E.00694
G1 X140.879 Y125.539 E.88399
G1 X141 Y125.418 E.00694
G1 X141.121 Y125.539 E.00694
G1 X143.973 Y125.539 E.11588
G1 X144.289 Y125.223 E.01813
G1 X144.289 Y125.123 E.00407
G1 X144.385 Y125.123 E.00394
G1 X144.385 Y122.246 E.11689
G1 X138.631 Y122.246 E.23378
; WIPE_START
G1 F24000
G1 X140.631 Y122.246 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-.148 J-1.208 P1  F30000
G1 X115.615 Y125.311 Z13.2
G1 Z12.8
G1 E.8 F1800
G1 F6397
G1 X115.615 Y128 E.10923
G1 X144.385 Y128 E1.16888
G1 X144.385 Y130.877 E.11689
G1 X144.289 Y130.877 E.00394
G1 X144.289 Y130.777 E.00407
G1 X143.973 Y130.461 E.01813
G1 X116.027 Y130.461 E1.13538
G1 X115.711 Y130.777 E.01813
G1 X115.711 Y130.877 E.00407
G1 X115.615 Y130.877 E.00394
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-.454 J1.129 P1  F30000
G1 X120.223 Y131.602 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6397
G1 X139.777 Y131.602 E.64867
G1 X139.777 Y132.398 E.0264
G1 X120.223 Y132.398 E.64867
G1 X120.223 Y131.662 E.02441
G1 X119.83 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6397
G1 X140.17 Y131.21 E.62496
G1 X140.17 Y132.79 E.04855
G1 X119.83 Y132.79 E.62496
G1 X119.83 Y131.27 E.04671
M204 S10000
G1 X120.426 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6397
G1 X139.574 Y132 E.60659
; WIPE_START
G1 F24000
G1 X137.574 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I.104 J1.213 P1  F30000
G1 X142.223 Y131.602 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6397
G1 X143.148 Y131.602 E.0307
G1 X143.148 Y132.398 E.0264
G1 X142.223 Y132.398 E.0307
G1 X142.223 Y131.662 E.02441
G1 X141.83 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6397
G1 X143.54 Y131.21 E.05253
G1 X143.54 Y132.79 E.04855
G1 X141.83 Y132.79 E.05253
G1 X141.83 Y131.27 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X143.54 Y131.21 E-.65003
G1 X143.54 Y131.499 E-.10997
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I1.203 J-.187 P1  F30000
G1 X142.436 Y124.398 Z13.2
G1 Z12.8
M73 P75 R6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6397
G1 X142.436 Y123.602 E.0264
G1 X143.148 Y123.602 E.02361
G1 X143.148 Y124.398 E.0264
G1 X142.496 Y124.398 E.02162
G1 X142.044 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6397
G1 X142.044 Y123.21 E.04855
G1 X143.54 Y123.21 E.04597
G1 X143.54 Y124.79 E.04855
G1 X142.104 Y124.79 E.04412
M204 S10000
; WIPE_START
G1 F24000
G1 X142.044 Y123.21 E-.60083
G1 X142.463 Y123.21 E-.15917
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-.066 J-1.215 P1  F30000
G1 X120.436 Y124.398 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6397
G1 X120.436 Y123.602 E.0264
G1 X139.564 Y123.602 E.6345
G1 X139.564 Y124.398 E.0264
G1 X120.496 Y124.398 E.63251
G1 X120.044 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6397
G1 X120.044 Y123.21 E.04855
G1 X139.956 Y123.21 E.61184
G1 X139.956 Y124.79 E.04855
G1 X120.104 Y124.79 E.60999
M204 S10000
G1 X120.64 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6397
G1 X139.36 Y124 E.59306
; WIPE_START
G1 F24000
G1 X137.36 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-.024 J-1.217 P1  F30000
G1 X117.564 Y124.398 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6397
G1 X116.852 Y124.398 E.02361
G1 X116.852 Y123.602 E.0264
G1 X117.564 Y123.602 E.02361
G1 X117.564 Y124.338 E.02441
G1 X117.956 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6397
G1 X116.46 Y124.79 E.04597
G1 X116.46 Y123.21 E.04855
G1 X117.956 Y123.21 E.04597
G1 X117.956 Y124.73 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X116.46 Y124.79 E-.56892
G1 X116.46 Y124.287 E-.19108
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-1.198 J.216 P1  F30000
G1 X117.777 Y131.602 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6397
G1 X117.777 Y132.398 E.0264
G1 X116.852 Y132.398 E.0307
M73 P75 R5
G1 X116.852 Y131.602 E.0264
G1 X117.717 Y131.602 E.02871
G1 X118.17 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6397
G1 X118.17 Y132.79 E.04855
G1 X116.46 Y132.79 E.05253
G1 X116.46 Y131.21 E.04855
G1 X118.11 Y131.21 E.05069
M204 S10000
; WIPE_START
G1 F24000
G1 X118.17 Y132.79 E-.60083
G1 X117.751 Y132.79 E-.15917
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I1.204 J-.176 P1  F30000
G1 X115.238 Y115.646 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.276471
G1 F6397
G1 X115.335 Y115.646 E.00394
G1 X115.335 Y115.546 E.00407
G1 X115.65 Y115.231 E.01813
G1 X143.597 Y115.231 E1.13538
G1 X143.912 Y115.546 E.01813
G1 X143.912 Y115.646 E.00407
G1 X144.009 Y115.646 E.00394
G1 X144.009 Y112.769 E.11689
G1 X115.238 Y112.769 E1.16888
G1 X115.238 Y110.081 E.10923
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z13.2
G1 Z12.8
G1 E.8 F1800
G1 F6397
G1 X120.992 Y107.231 E.01747
G1 X120.992 Y107.015 E.00876
G1 X115.238 Y107.015 E.23378
G1 X115.238 Y109.892 E.11689
G1 X115.335 Y109.892 E.00394
G1 X115.335 Y109.992 E.00407
G1 X115.65 Y110.308 E.01813
G1 X118.503 Y110.308 E.11588
G1 X118.623 Y110.187 E.00694
G1 X118.744 Y110.308 E.00694
G1 X140.503 Y110.308 E.88399
G1 X140.623 Y110.187 E.00694
G1 X140.744 Y110.308 E.00694
G1 X143.597 Y110.308 E.11588
G1 X143.912 Y109.992 E.01813
G1 X143.912 Y109.892 E.00407
G1 X144.009 Y109.892 E.00394
G1 X144.009 Y107.015 E.11689
G1 X138.255 Y107.015 E.23378
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-.507 J-1.106 P1  F30000
G1 X119.846 Y116.371 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6397
G1 X139.401 Y116.371 E.64867
G1 X139.401 Y117.167 E.0264
G1 X119.846 Y117.167 E.64867
G1 X119.846 Y116.431 E.02441
G1 X119.454 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6397
G1 X139.793 Y115.979 E.62496
G1 X139.793 Y117.559 E.04855
G1 X119.454 Y117.559 E.62496
G1 X119.454 Y116.039 E.04671
M204 S10000
G1 X120.049 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6397
G1 X139.197 Y116.769 E.60659
; WIPE_START
G1 F24000
G1 X137.197 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I.104 J1.213 P1  F30000
G1 X141.846 Y116.371 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6397
G1 X142.771 Y116.371 E.0307
G1 X142.771 Y117.167 E.0264
G1 X141.846 Y117.167 E.0307
G1 X141.846 Y116.431 E.02441
G1 X141.454 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6397
G1 X143.163 Y115.979 E.05253
G1 X143.163 Y117.559 E.04855
G1 X141.454 Y117.559 E.05253
G1 X141.454 Y116.039 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X143.163 Y115.979 E-.65003
G1 X143.163 Y116.269 E-.10997
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I1.203 J-.187 P1  F30000
G1 X142.06 Y109.167 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6397
G1 X142.06 Y108.371 E.0264
G1 X142.771 Y108.371 E.02361
G1 X142.771 Y109.167 E.0264
G1 X142.12 Y109.167 E.02162
G1 X141.667 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6397
G1 X141.667 Y107.979 E.04855
G1 X143.163 Y107.979 E.04597
G1 X143.163 Y109.559 E.04855
G1 X141.727 Y109.559 E.04412
M204 S10000
; WIPE_START
G1 F24000
G1 X141.667 Y107.979 E-.60083
G1 X142.086 Y107.979 E-.15917
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-.066 J-1.215 P1  F30000
G1 X120.06 Y109.167 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6397
G1 X120.06 Y108.371 E.0264
G1 X139.187 Y108.371 E.6345
G1 X139.187 Y109.167 E.0264
G1 X120.12 Y109.167 E.63251
G1 X119.667 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6397
G1 X119.667 Y107.979 E.04855
G1 X139.579 Y107.979 E.61184
G1 X139.579 Y109.559 E.04855
G1 X119.727 Y109.559 E.60999
M204 S10000
G1 X120.263 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6397
G1 X138.984 Y108.769 E.59306
; WIPE_START
G1 F24000
G1 X136.984 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-.024 J-1.217 P1  F30000
G1 X117.187 Y109.167 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6397
G1 X116.476 Y109.167 E.02361
G1 X116.476 Y108.371 E.0264
G1 X117.187 Y108.371 E.02361
G1 X117.187 Y109.107 E.02441
G1 X117.579 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6397
G1 X116.083 Y109.559 E.04597
G1 X116.083 Y107.979 E.04855
G1 X117.579 Y107.979 E.04597
G1 X117.579 Y109.499 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X116.083 Y109.559 E-.56892
G1 X116.083 Y109.056 E-.19108
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-1.198 J.216 P1  F30000
G1 X117.401 Y116.371 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6397
G1 X117.401 Y117.167 E.0264
G1 X116.476 Y117.167 E.0307
G1 X116.476 Y116.371 E.0264
G1 X117.341 Y116.371 E.02871
G1 X117.793 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6397
G1 X117.793 Y117.559 E.04855
G1 X116.083 Y117.559 E.05253
G1 X116.083 Y115.979 E.04855
G1 X117.733 Y115.979 E.05069
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X117.793 Y117.559 E-.60083
G1 X117.374 Y117.559 E-.15917
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 106/135
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
G3 Z13.2 I-.984 J.716 P1  F30000
G1 X120.939 Y122.461 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Support
G1 F6961
G1 X121.369 Y122.461 E.01321
G1 X121.369 Y122.246 E.00663
G1 X115.615 Y122.246 E.17681
G1 X115.615 Y125.123 E.0884
G1 X115.711 Y125.123 E.00298
G1 X115.711 Y125.223 E.00308
G1 X116.027 Y125.539 E.01371
G1 X117.844 Y125.539 E.05583
G1 X117.914 Y125.609 E.00304
G1 X120.086 Y125.609 E.06674
G1 X120.156 Y125.539 E.00304
G1 X139.844 Y125.539 E.60496
G1 X139.914 Y125.609 E.00304
G1 X142.086 Y125.609 E.06674
G1 X142.156 Y125.539 E.00304
G1 X143.973 Y125.539 E.05583
G1 X144.289 Y125.223 E.01371
G1 X144.289 Y125.123 E.00308
G1 X144.385 Y125.123 E.00298
G1 X144.385 Y122.246 E.0884
G1 X138.631 Y122.246 E.17681
; WIPE_START
G1 F24000
G1 X140.631 Y122.246 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-1.217 J.026 P1  F30000
G1 X140.696 Y125.231 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X140.696 Y122.769 E.07568
G1 X141.304 Y122.769 E.01868
G1 X141.304 Y125.231 E.07568
G1 X140.753 Y125.231 E.01694
; WIPE_START
G1 F24000
G1 X141.304 Y125.231 E-.20952
G1 X141.304 Y123.783 E-.55048
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I1.023 J.66 P1  F30000
G1 X142.156 Y122.461 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Support
G1 F6961
G1 X143.955 Y122.461 E.05529
; WIPE_START
G1 F24000
G1 X142.156 Y122.461 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-.143 J-1.209 P1  F30000
G1 X118.753 Y125.231 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X119.304 Y125.231 E.01694
G1 X119.304 Y122.769 E.07568
G1 X118.696 Y122.769 E.01868
G1 X118.696 Y125.231 E.07568
; WIPE_START
G1 F24000
G1 X118.696 Y123.231 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-.681 J-1.009 P1  F30000
G1 X115.615 Y125.311 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Support
G1 F6961
G1 X115.615 Y128 E.08261
G1 X144.385 Y128 E.88405
G1 X144.385 Y130.877 E.0884
G1 X144.289 Y130.877 E.00298
G1 X144.289 Y130.777 E.00308
G1 X143.973 Y130.461 E.01371
G1 X141.706 Y130.461 E.06966
G2 X141.232 Y130.839 I4.243 J5.813 E.01863
G1 X140.768 Y130.877 E.0143
G1 X140.54 Y130.611 E.01075
G3 X140.294 Y130.461 I-.048 J-.198 E.00985
G1 X119.706 Y130.461 E.63261
G2 X119.232 Y130.839 I4.243 J5.814 E.01863
G1 X118.768 Y130.877 E.0143
G1 X118.54 Y130.611 E.01075
G3 X118.294 Y130.461 I-.048 J-.198 E.00985
G1 X116.027 Y130.461 E.06966
G1 X115.711 Y130.777 E.01371
G1 X115.711 Y130.877 E.00308
G1 X115.615 Y130.877 E.00298
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-.415 J1.144 P1  F30000
G1 X120.531 Y131.602 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6961
G1 X139.469 Y131.602 E.6282
G1 X139.469 Y132.398 E.0264
G1 X120.531 Y132.398 E.6282
G1 X120.531 Y131.662 E.02441
G1 X120.139 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6961
G1 X139.861 Y131.21 E.606
G1 X139.861 Y132.79 E.04855
G1 X120.139 Y132.79 E.606
G1 X120.139 Y131.27 E.04671
M204 S10000
G1 X120.735 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6961
G1 X139.265 Y132 E.58704
; WIPE_START
G1 F24000
G1 X137.265 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I.092 J1.214 P1  F30000
G1 X142.531 Y131.602 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6961
G1 X143.148 Y131.602 E.02046
G1 X143.148 Y132.398 E.0264
G1 X142.531 Y132.398 E.02046
G1 X142.531 Y131.662 E.02441
G1 X142.139 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6961
G1 X143.54 Y131.21 E.04305
G1 X143.54 Y132.79 E.04855
G1 X142.139 Y132.79 E.04305
G1 X142.139 Y131.27 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X143.54 Y131.21 E-.53285
G1 X143.54 Y131.808 E-.22715
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I1.209 J-.14 P1  F30000
G1 X142.681 Y124.398 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6961
G1 X142.681 Y123.602 E.0264
G1 X143.148 Y123.602 E.01549
G1 X143.148 Y124.398 E.0264
G1 X142.741 Y124.398 E.0135
G1 X142.289 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6961
G1 X142.289 Y123.21 E.04855
G1 X143.54 Y123.21 E.03845
G1 X143.54 Y124.79 E.04855
G1 X142.349 Y124.79 E.0366
M204 S10000
G1 X142.914 Y124.194 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102944
G1 F6961
G1 X142.914 Y123.806 E.0019
; WIPE_START
G1 F24000
G1 X142.914 Y124.194 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-.011 J-1.217 P1  F30000
G1 X120.681 Y124.398 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6961
G1 X120.681 Y123.602 E.0264
G1 X139.319 Y123.602 E.61827
M73 P76 R5
G1 X139.319 Y124.398 E.0264
G1 X120.741 Y124.398 E.61628
G1 X120.289 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6961
G1 X120.289 Y123.21 E.04855
G1 X139.711 Y123.21 E.5968
G1 X139.711 Y124.79 E.04855
G1 X120.349 Y124.79 E.59496
M204 S10000
G1 X120.884 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6961
G1 X139.116 Y124 E.57756
; WIPE_START
G1 F24000
G1 X137.116 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-.024 J-1.217 P1  F30000
G1 X117.319 Y124.398 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6961
G1 X116.852 Y124.398 E.01549
G1 X116.852 Y123.602 E.0264
G1 X117.319 Y123.602 E.01549
G1 X117.319 Y124.338 E.02441
G1 X117.711 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6961
G1 X116.46 Y124.79 E.03845
G1 X116.46 Y123.21 E.04855
G1 X117.711 Y123.21 E.03845
G1 X117.711 Y124.73 E.04671
M204 S10000
G1 X117.086 Y124.194 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102944
G1 F6961
G1 X117.086 Y123.806 E.0019
; WIPE_START
G1 F24000
G1 X117.086 Y124.194 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-1.215 J.063 P1  F30000
G1 X117.469 Y131.602 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6961
G1 X117.469 Y132.398 E.0264
G1 X116.852 Y132.398 E.02046
G1 X116.852 Y131.602 E.0264
G1 X117.409 Y131.602 E.01847
G1 X117.861 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6961
G1 X117.861 Y132.79 E.04855
G1 X116.46 Y132.79 E.04305
G1 X116.46 Y131.21 E.04855
G1 X117.801 Y131.21 E.0412
M204 S10000
; WIPE_START
G1 F24000
G1 X117.861 Y132.79 E-.60083
G1 X117.442 Y132.79 E-.15917
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I1.207 J-.155 P1  F30000
G1 X115.238 Y115.646 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Support
G1 F6961
G1 X115.335 Y115.646 E.00298
G1 X115.335 Y115.546 E.00308
G1 X115.65 Y115.231 E.01371
G1 X117.917 Y115.231 E.06966
G2 X118.164 Y115.381 I.198 J-.048 E.00985
G1 X118.392 Y115.646 E.01075
G1 X118.855 Y115.608 E.0143
G3 X119.329 Y115.231 I4.717 J5.436 E.01863
G1 X139.917 Y115.231 E.63261
G2 X140.164 Y115.381 I.198 J-.048 E.00985
G1 X140.392 Y115.646 E.01075
G1 X140.855 Y115.608 E.0143
G3 X141.329 Y115.231 I4.717 J5.436 E.01863
G1 X143.597 Y115.231 E.06966
G1 X143.912 Y115.546 E.01371
G1 X143.912 Y115.646 E.00308
G1 X144.009 Y115.646 E.00298
G1 X144.009 Y112.769 E.0884
G1 X115.238 Y112.769 E.88405
G1 X115.238 Y110.081 E.08261
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I.681 J1.009 P1  F30000
G1 X118.319 Y110.001 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X118.319 Y107.538 E.07568
G1 X118.927 Y107.538 E.01868
G1 X118.927 Y110.001 E.07568
G1 X118.376 Y110.001 E.01694
; WIPE_START
G1 F24000
G1 X118.927 Y110.001 E-.20952
G1 X118.927 Y108.552 E-.55048
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I.765 J.946 P1  F30000
G1 X120.562 Y107.231 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Support
G1 F6961
G1 X120.992 Y107.231 E.01321
G1 X120.992 Y107.015 E.00663
G1 X115.238 Y107.015 E.17681
G1 X115.238 Y109.892 E.0884
G1 X115.335 Y109.892 E.00298
G1 X115.335 Y109.992 E.00308
G1 X115.65 Y110.308 E.01371
G1 X117.467 Y110.308 E.05583
G1 X117.537 Y110.378 E.00304
G1 X119.709 Y110.378 E.06674
G1 X119.779 Y110.308 E.00304
G1 X139.467 Y110.308 E.60496
G1 X139.537 Y110.378 E.00304
G1 X141.709 Y110.378 E.06674
G1 X141.779 Y110.308 E.00304
G1 X143.597 Y110.308 E.05583
G1 X143.912 Y109.992 E.01371
G1 X143.912 Y109.892 E.00308
G1 X144.009 Y109.892 E.00298
G1 X144.009 Y107.015 E.0884
G1 X138.255 Y107.015 E.17681
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-1.217 J.026 P1  F30000
G1 X140.319 Y110.001 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X140.319 Y107.538 E.07568
G1 X140.927 Y107.538 E.01868
G1 X140.927 Y110.001 E.07568
G1 X140.376 Y110.001 E.01694
; WIPE_START
G1 F24000
G1 X140.927 Y110.001 E-.20952
G1 X140.927 Y108.552 E-.55048
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I1.023 J.66 P1  F30000
G1 X141.779 Y107.231 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Support
G1 F6961
G1 X143.579 Y107.231 E.05529
; WIPE_START
G1 F24000
G1 X141.779 Y107.231 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-.474 J-1.121 P1  F30000
G1 X120.155 Y116.371 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6961
G1 X139.092 Y116.371 E.6282
G1 X139.092 Y117.167 E.0264
G1 X120.155 Y117.167 E.6282
G1 X120.155 Y116.431 E.02441
G1 X119.762 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6961
G1 X139.484 Y115.979 E.606
G1 X139.484 Y117.559 E.04855
G1 X119.762 Y117.559 E.606
G1 X119.762 Y116.039 E.04671
M204 S10000
G1 X120.358 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6961
G1 X138.889 Y116.769 E.58704
; WIPE_START
G1 F24000
G1 X136.889 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I.092 J1.214 P1  F30000
G1 X142.155 Y116.371 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6961
G1 X142.771 Y116.371 E.02046
G1 X142.771 Y117.167 E.0264
G1 X142.155 Y117.167 E.02046
G1 X142.155 Y116.431 E.02441
G1 X141.762 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6961
G1 X143.163 Y115.979 E.04305
G1 X143.163 Y117.559 E.04855
G1 X141.762 Y117.559 E.04305
G1 X141.762 Y116.039 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X143.163 Y115.979 E-.53285
G1 X143.163 Y116.577 E-.22715
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I1.209 J-.14 P1  F30000
G1 X142.304 Y109.167 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6961
G1 X142.304 Y108.371 E.0264
G1 X142.771 Y108.371 E.01549
G1 X142.771 Y109.167 E.0264
G1 X142.364 Y109.167 E.0135
G1 X141.912 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6961
G1 X141.912 Y107.979 E.04855
G1 X143.163 Y107.979 E.03845
G1 X143.163 Y109.559 E.04855
G1 X141.972 Y109.559 E.0366
M204 S10000
G1 X142.538 Y108.964 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102944
G1 F6961
G1 X142.538 Y108.575 E.0019
; WIPE_START
G1 F24000
G1 X142.538 Y108.964 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-.011 J-1.217 P1  F30000
G1 X120.304 Y109.167 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6961
G1 X120.304 Y108.371 E.0264
G1 X138.943 Y108.371 E.61827
G1 X138.943 Y109.167 E.0264
G1 X120.364 Y109.167 E.61628
G1 X119.912 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6961
G1 X119.912 Y107.979 E.04855
G1 X139.335 Y107.979 E.5968
G1 X139.335 Y109.559 E.04855
G1 X119.972 Y109.559 E.59496
M204 S10000
G1 X120.508 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6961
G1 X138.739 Y108.769 E.57756
; WIPE_START
G1 F24000
G1 X136.739 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-.024 J-1.217 P1  F30000
G1 X116.943 Y109.167 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6961
G1 X116.476 Y109.167 E.01549
G1 X116.476 Y108.371 E.0264
G1 X116.943 Y108.371 E.01549
G1 X116.943 Y109.107 E.02441
G1 X117.335 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6961
G1 X116.083 Y109.559 E.03845
G1 X116.083 Y107.979 E.04855
G1 X117.335 Y107.979 E.03845
G1 X117.335 Y109.499 E.04671
M204 S10000
G1 X116.709 Y108.964 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102944
G1 F6961
G1 X116.709 Y108.575 E.0019
; WIPE_START
G1 F24000
G1 X116.709 Y108.964 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-1.215 J.063 P1  F30000
G1 X117.092 Y116.371 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6961
G1 X117.092 Y117.167 E.0264
G1 X116.476 Y117.167 E.02046
G1 X116.476 Y116.371 E.0264
G1 X117.032 Y116.371 E.01847
G1 X117.484 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6961
G1 X117.484 Y117.559 E.04855
G1 X116.083 Y117.559 E.04305
G1 X116.083 Y115.979 E.04855
G1 X117.424 Y115.979 E.0412
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X117.484 Y117.559 E-.60083
G1 X117.066 Y117.559 E-.15917
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 107/135
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
G3 Z13.4 I-1.167 J.343 P1  F30000
G1 X118.598 Y122.769 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X118.598 Y125.231 E.07568
G2 X119 Y124.984 I.077 J-.325 E.01612
G2 X119.475 Y125.231 I.361 J-.114 E.01829
G1 X119.475 Y122.769 E.07568
G1 X120.939 Y122.461 F30000
; FEATURE: Support
G1 F6577
G1 X121.369 Y122.461 E.01321
G1 X121.369 Y122.246 E.00663
G1 X115.615 Y122.246 E.17681
G1 X115.615 Y125.123 E.0884
G1 X115.711 Y125.123 E.00298
G1 X115.711 Y125.223 E.00308
G1 X116.027 Y125.539 E.01371
G1 X117.599 Y125.539 E.04831
G1 X117.669 Y125.609 E.00304
G1 X118.908 Y125.609 E.03807
G1 X119 Y125.517 E.00399
G1 X119.092 Y125.609 E.00399
G1 X120.331 Y125.609 E.03807
G1 X120.401 Y125.539 E.00304
G1 X139.599 Y125.539 E.58992
G1 X139.669 Y125.609 E.00304
G1 X140.908 Y125.609 E.03807
G1 X141 Y125.517 E.00399
G1 X141.092 Y125.609 E.00399
G1 X142.331 Y125.609 E.03807
G1 X142.401 Y125.539 E.00304
G1 X143.973 Y125.539 E.04831
G1 X144.289 Y125.223 E.01371
G1 X144.289 Y125.123 E.00308
G1 X144.385 Y125.123 E.00298
G1 X144.385 Y122.246 E.0884
G1 X138.631 Y122.246 E.17681
; WIPE_START
G1 F24000
G1 X140.631 Y122.246 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-1.193 J-.243 P1  F30000
G1 X140.525 Y122.769 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X140.525 Y125.231 E.07568
G2 X141 Y124.984 I.114 J-.362 E.01829
G2 X141.402 Y125.231 I.325 J-.077 E.01612
G1 X141.402 Y122.769 E.07568
G1 X142.401 Y122.461 F30000
; FEATURE: Support
G1 F6577
G1 X143.955 Y122.461 E.04777
; WIPE_START
G1 F24000
G1 X142.401 Y122.461 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-.129 J-1.21 P1  F30000
G1 X115.615 Y125.311 Z13.6
G1 Z13.2
G1 E.8 F1800
G1 F6577
G1 X115.615 Y128 E.08261
G1 X144.385 Y128 E.88405
G1 X144.385 Y130.877 E.0884
G1 X144.289 Y130.877 E.00298
G1 X144.289 Y130.777 E.00308
G1 X143.973 Y130.461 E.01371
G1 X141.905 Y130.461 E.06355
G1 X141.589 Y130.79 E.014
G2 X141.54 Y130.877 I.019 J.068 E.0034
G1 X140.46 Y130.877 E.03322
G2 X140.411 Y130.79 I-.068 J-.019 E.0034
G1 X140.095 Y130.461 E.014
G1 X119.905 Y130.461 E.6204
G1 X119.589 Y130.79 E.014
G2 X119.54 Y130.877 I.019 J.068 E.0034
G1 X118.46 Y130.877 E.03322
G2 X118.411 Y130.79 I-.068 J-.019 E.0034
G1 X118.095 Y130.461 E.014
G1 X116.027 Y130.461 E.06355
G1 X115.711 Y130.777 E.01371
G1 X115.711 Y130.877 E.00308
G1 X115.615 Y130.877 E.00298
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-.393 J1.152 P1  F30000
G1 X120.73 Y131.602 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6577
G1 X139.27 Y131.602 E.61501
G1 X139.27 Y132.398 E.0264
G1 X120.73 Y132.398 E.61501
G1 X120.73 Y131.662 E.02441
G1 X120.338 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6577
G1 X139.662 Y131.21 E.59378
G1 X139.662 Y132.79 E.04855
G1 X120.338 Y132.79 E.59378
G1 X120.338 Y131.27 E.04671
M204 S10000
G1 X120.933 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6577
G1 X139.067 Y132 E.57445
; WIPE_START
G1 F24000
G1 X137.067 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I.085 J1.214 P1  F30000
G1 X142.73 Y131.602 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6577
G1 X143.148 Y131.602 E.01387
G1 X143.148 Y132.398 E.0264
G1 X142.73 Y132.398 E.01387
G1 X142.73 Y131.662 E.02441
G1 X142.338 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6577
G1 X143.54 Y131.21 E.03694
G1 X143.54 Y132.79 E.04855
G1 X142.338 Y132.79 E.03694
G1 X142.338 Y131.27 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X143.54 Y131.21 E-.4574
G1 X143.54 Y132.006 E-.3026
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I1.212 J-.11 P1  F30000
G1 X142.851 Y124.398 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6577
G1 X142.851 Y123.602 E.0264
G1 X143.148 Y123.602 E.00987
G1 X143.148 Y124.398 E.0264
G1 X142.911 Y124.398 E.00788
G1 X142.458 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6577
G1 X142.458 Y123.21 E.04855
G1 X143.54 Y123.21 E.03323
G1 X143.54 Y124.79 E.04855
G1 X142.518 Y124.79 E.03139
M204 S10000
; WIPE_START
G1 F24000
G1 X142.458 Y123.21 E-.60083
G1 X142.877 Y123.21 E-.15917
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-.066 J-1.215 P1  F30000
G1 X120.851 Y124.398 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6577
G1 X120.851 Y123.602 E.0264
G1 X139.149 Y123.602 E.60701
G1 X139.149 Y124.398 E.0264
G1 X120.911 Y124.398 E.60502
G1 X120.458 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6577
G1 X120.458 Y123.21 E.04855
G1 X139.542 Y123.21 E.58637
G1 X139.542 Y124.79 E.04855
G1 X120.518 Y124.79 E.58453
M204 S10000
G1 X121.054 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6577
G1 X138.946 Y124 E.5668
; WIPE_START
G1 F24000
G1 X136.946 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-.024 J-1.217 P1  F30000
G1 X117.149 Y124.398 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6577
G1 X116.852 Y124.398 E.00987
G1 X116.852 Y123.602 E.0264
G1 X117.149 Y123.602 E.00987
G1 X117.149 Y124.338 E.02441
G1 X117.542 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6577
G1 X116.46 Y124.79 E.03323
G1 X116.46 Y123.21 E.04855
G1 X117.542 Y123.21 E.03323
G1 X117.542 Y124.73 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X116.46 Y124.79 E-.41163
G1 X116.46 Y123.873 E-.34837
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-1.21 J.127 P1  F30000
G1 X117.27 Y131.602 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6577
G1 X117.27 Y132.398 E.0264
G1 X116.852 Y132.398 E.01387
G1 X116.852 Y131.602 E.0264
G1 X117.21 Y131.602 E.01188
G1 X117.662 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6577
G1 X117.662 Y132.79 E.04855
G1 X116.46 Y132.79 E.03694
G1 X116.46 Y131.21 E.04855
M73 P77 R5
G1 X117.602 Y131.21 E.0351
M204 S10000
; WIPE_START
G1 F24000
G1 X117.662 Y132.79 E-.60083
G1 X117.243 Y132.79 E-.15917
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I1.209 J-.141 P1  F30000
G1 X115.238 Y115.646 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Support
G1 F6577
G1 X115.335 Y115.646 E.00298
G1 X115.335 Y115.546 E.00308
G1 X115.65 Y115.231 E.01371
G1 X117.719 Y115.231 E.06355
G1 X118.034 Y115.56 E.014
G3 X118.083 Y115.646 I-.019 J.068 E.0034
G1 X119.164 Y115.646 E.03322
G3 X119.213 Y115.56 I.068 J-.019 E.0034
G1 X119.528 Y115.231 E.014
G1 X139.719 Y115.231 E.6204
G1 X140.034 Y115.56 E.014
G3 X140.083 Y115.646 I-.019 J.068 E.0034
G1 X141.164 Y115.646 E.03322
G3 X141.213 Y115.56 I.068 J-.019 E.0034
G1 X141.528 Y115.231 E.014
G1 X143.597 Y115.231 E.06355
G1 X143.912 Y115.546 E.01371
G1 X143.912 Y115.646 E.00308
G1 X144.009 Y115.646 E.00298
G1 X144.009 Y112.769 E.0884
G1 X115.238 Y112.769 E.88405
G1 X115.238 Y110.081 E.08261
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I1.017 J.668 P1  F30000
G1 X118.221 Y107.538 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X118.221 Y110.001 E.07568
G2 X118.623 Y109.753 I.077 J-.325 E.01612
G2 X119.098 Y110.001 I.361 J-.114 E.01829
G1 X119.098 Y107.538 E.07568
G1 X120.562 Y107.231 F30000
; FEATURE: Support
G1 F6577
G1 X120.992 Y107.231 E.01321
G1 X120.992 Y107.015 E.00663
G1 X115.238 Y107.015 E.17681
G1 X115.238 Y109.892 E.0884
G1 X115.335 Y109.892 E.00298
G1 X115.335 Y109.992 E.00308
G1 X115.65 Y110.308 E.01371
G1 X117.223 Y110.308 E.04831
G1 X117.293 Y110.378 E.00304
G1 X118.532 Y110.378 E.03807
G1 X118.623 Y110.286 E.00399
G1 X118.715 Y110.378 E.00399
G1 X119.954 Y110.378 E.03807
G1 X120.024 Y110.308 E.00304
G1 X139.223 Y110.308 E.58992
G1 X139.293 Y110.378 E.00304
G1 X140.532 Y110.378 E.03807
G1 X140.623 Y110.286 E.00399
G1 X140.715 Y110.378 E.00399
G1 X141.954 Y110.378 E.03807
G1 X142.024 Y110.308 E.00304
G1 X143.597 Y110.308 E.04831
G1 X143.912 Y109.992 E.01371
G1 X143.912 Y109.892 E.00308
G1 X144.009 Y109.892 E.00298
G1 X144.009 Y107.015 E.0884
G1 X138.255 Y107.015 E.17681
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-1.193 J-.243 P1  F30000
G1 X140.148 Y107.538 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X140.148 Y110.001 E.07568
G2 X140.623 Y109.753 I.114 J-.362 E.01829
G2 X141.025 Y110.001 I.325 J-.077 E.01612
G1 X141.025 Y107.538 E.07568
G1 X142.024 Y107.231 F30000
; FEATURE: Support
G1 F6577
G1 X143.579 Y107.231 E.04777
; WIPE_START
G1 F24000
G1 X142.024 Y107.231 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-.473 J-1.121 P1  F30000
G1 X120.353 Y116.371 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6577
G1 X138.894 Y116.371 E.61501
G1 X138.894 Y117.167 E.0264
G1 X120.353 Y117.167 E.61501
G1 X120.353 Y116.431 E.02441
G1 X119.961 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6577
G1 X139.286 Y115.979 E.59378
G1 X139.286 Y117.559 E.04855
G1 X119.961 Y117.559 E.59378
G1 X119.961 Y116.039 E.04671
M204 S10000
G1 X120.557 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6577
G1 X138.69 Y116.769 E.57445
; WIPE_START
G1 F24000
G1 X136.69 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I.085 J1.214 P1  F30000
G1 X142.353 Y116.371 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6577
G1 X142.771 Y116.371 E.01387
G1 X142.771 Y117.167 E.0264
G1 X142.353 Y117.167 E.01387
G1 X142.353 Y116.431 E.02441
G1 X141.961 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6577
G1 X143.163 Y115.979 E.03694
G1 X143.163 Y117.559 E.04855
G1 X141.961 Y117.559 E.03694
G1 X141.961 Y116.039 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X143.163 Y115.979 E-.4574
G1 X143.163 Y116.776 E-.3026
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I1.212 J-.11 P1  F30000
G1 X142.474 Y109.167 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6577
G1 X142.474 Y108.371 E.0264
G1 X142.771 Y108.371 E.00987
G1 X142.771 Y109.167 E.0264
G1 X142.534 Y109.167 E.00788
G1 X142.082 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6577
G1 X142.082 Y107.979 E.04855
G1 X143.163 Y107.979 E.03323
G1 X143.163 Y109.559 E.04855
G1 X142.142 Y109.559 E.03139
M204 S10000
; WIPE_START
G1 F24000
G1 X142.082 Y107.979 E-.60083
G1 X142.501 Y107.979 E-.15917
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-.066 J-1.215 P1  F30000
G1 X120.474 Y109.167 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6577
G1 X120.474 Y108.371 E.0264
G1 X138.773 Y108.371 E.60701
G1 X138.773 Y109.167 E.0264
G1 X120.534 Y109.167 E.60502
G1 X120.082 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6577
G1 X120.082 Y107.979 E.04855
G1 X139.165 Y107.979 E.58637
G1 X139.165 Y109.559 E.04855
G1 X120.142 Y109.559 E.58453
M204 S10000
G1 X120.677 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6577
G1 X138.569 Y108.769 E.5668
; WIPE_START
G1 F24000
G1 X136.569 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-.024 J-1.217 P1  F30000
G1 X116.773 Y109.167 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6577
G1 X116.476 Y109.167 E.00987
G1 X116.476 Y108.371 E.0264
G1 X116.773 Y108.371 E.00987
G1 X116.773 Y109.107 E.02441
G1 X117.165 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6577
G1 X116.083 Y109.559 E.03323
G1 X116.083 Y107.979 E.04855
G1 X117.165 Y107.979 E.03323
G1 X117.165 Y109.499 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X116.083 Y109.559 E-.41163
G1 X116.083 Y108.642 E-.34837
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-1.21 J.127 P1  F30000
G1 X116.894 Y116.371 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6577
G1 X116.894 Y117.167 E.0264
G1 X116.476 Y117.167 E.01387
G1 X116.476 Y116.371 E.0264
G1 X116.834 Y116.371 E.01188
G1 X117.286 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6577
G1 X117.286 Y117.559 E.04855
G1 X116.083 Y117.559 E.03694
G1 X116.083 Y115.979 E.04855
G1 X117.226 Y115.979 E.0351
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X117.286 Y117.559 E-.60083
G1 X116.867 Y117.559 E-.15917
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 108/135
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
G3 Z13.6 I-1.174 J.319 P1  F30000
G1 X118.29 Y122.797 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X118.397 Y122.904 E.00466
G1 X118.397 Y125.096 E.06735
G1 X118.29 Y125.203 E.00466
G1 X118.29 Y122.853 E.07221
; WIPE_START
G1 F24000
G1 X118.29 Y124.853 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-.221 J1.197 P1  F30000
G1 X119.603 Y125.096 Z13.8
G1 Z13.4
G1 E.8 F1800
G1 F4800
G1 X119.603 Y122.904 E.06735
G1 X119.71 Y122.797 E.00466
G1 X119.71 Y125.203 E.07394
G1 X119.643 Y125.136 E.00293
; WIPE_START
G1 F24000
G1 X119.71 Y125.203 E-.03619
G1 X119.71 Y123.298 E-.72381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I.685 J1.006 P1  F30000
G1 X120.939 Y122.461 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Support
G1 F6963
G1 X121.369 Y122.461 E.01321
G1 X121.369 Y122.246 E.00663
G1 X115.615 Y122.246 E.17681
G1 X115.615 Y125.123 E.0884
G1 X115.711 Y125.123 E.00298
G1 X115.711 Y125.223 E.00308
G1 X116.027 Y125.539 E.01371
G1 X117.43 Y125.539 E.0431
G1 X117.5 Y125.609 E.00304
G1 X118.418 Y125.609 E.02822
G1 X118.774 Y125.252 E.01549
G1 X118.774 Y125.123 E.00397
G1 X119.226 Y125.123 E.01386
G1 X119.226 Y125.252 E.00397
G1 X119.582 Y125.609 E.01549
G1 X120.5 Y125.609 E.02822
G1 X120.57 Y125.539 E.00304
G1 X139.43 Y125.539 E.57949
G1 X139.5 Y125.609 E.00304
G1 X140.418 Y125.609 E.02822
G1 X140.774 Y125.252 E.01549
G1 X140.774 Y125.123 E.00397
G1 X141.226 Y125.123 E.01386
G1 X141.226 Y125.252 E.00397
G1 X141.582 Y125.609 E.01549
G1 X142.5 Y125.609 E.02822
G1 X142.57 Y125.539 E.00304
G1 X143.973 Y125.539 E.0431
G1 X144.289 Y125.223 E.01371
G1 X144.289 Y125.123 E.00308
G1 X144.385 Y125.123 E.00298
G1 X144.385 Y122.246 E.0884
G1 X138.631 Y122.246 E.17681
; WIPE_START
G1 F24000
G1 X140.631 Y122.246 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-1.035 J-.641 P1  F30000
G1 X140.29 Y122.797 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X140.397 Y122.904 E.00466
G1 X140.397 Y125.096 E.06735
G1 X140.29 Y125.203 E.00466
G1 X140.29 Y122.853 E.07221
; WIPE_START
G1 F24000
G1 X140.29 Y124.853 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-.221 J1.197 P1  F30000
G1 X141.603 Y125.096 Z13.8
G1 Z13.4
G1 E.8 F1800
G1 F4800
G1 X141.603 Y122.904 E.06735
G1 X141.71 Y122.797 E.00466
G1 X141.71 Y125.203 E.07394
G1 X141.643 Y125.136 E.00293
; WIPE_START
G1 F24000
G1 X141.71 Y125.203 E-.03619
G1 X141.71 Y123.298 E-.72381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-.094 J-1.213 P1  F30000
G1 X115.615 Y125.311 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Support
G1 F6963
G1 X115.615 Y128 E.08261
G1 X144.385 Y128 E.88405
G1 X144.385 Y130.877 E.0884
G1 X144.289 Y130.877 E.00298
G1 X144.289 Y130.777 E.00308
G1 X143.973 Y130.461 E.01371
G1 X142.043 Y130.461 E.05931
G1 X141.727 Y130.777 E.01371
G1 X141.727 Y130.877 E.00308
G1 X140.273 Y130.877 E.0447
G1 X140.273 Y130.777 E.00308
G1 X139.957 Y130.461 E.01371
G1 X120.043 Y130.461 E.61191
G1 X119.727 Y130.777 E.01371
G1 X119.727 Y130.877 E.00308
G1 X118.273 Y130.877 E.0447
G1 X118.273 Y130.777 E.00308
G1 X117.957 Y130.461 E.01371
G1 X116.027 Y130.461 E.05931
G1 X115.711 Y130.777 E.01371
G1 X115.711 Y130.877 E.00308
G1 X115.615 Y130.877 E.00298
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-.379 J1.157 P1  F30000
G1 X120.868 Y131.602 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6963
G1 X139.132 Y131.602 E.60585
G1 X139.132 Y132.398 E.0264
G1 X120.868 Y132.398 E.60585
G1 X120.868 Y131.662 E.02441
G1 X120.476 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6963
G1 X139.524 Y131.21 E.5853
G1 X139.524 Y132.79 E.04855
G1 X120.476 Y132.79 E.5853
G1 X120.476 Y131.27 E.04671
M204 S10000
G1 X121.071 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6963
G1 X138.929 Y132 E.5657
; WIPE_START
G1 F24000
G1 X136.929 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I.081 J1.214 P1  F30000
G1 X142.868 Y131.602 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6963
G1 X143.148 Y131.602 E.00929
G1 X143.148 Y132.398 E.0264
G1 X142.868 Y132.398 E.00929
G1 X142.868 Y131.662 E.02441
G1 X142.476 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6963
G1 X143.54 Y131.21 E.0327
G1 X143.54 Y132.79 E.04855
G1 X142.476 Y132.79 E.0327
G1 X142.476 Y131.27 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X143.54 Y131.21 E-.40502
G1 X143.54 Y132.144 E-.35498
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I1.207 J-.156 P1  F30000
G1 X142.59 Y124.79 Z13.8
G1 Z13.4
G1 E.8 F1800
M204 S5000
G1 F6963
G1 X142.59 Y123.21 E.04855
G1 X143.54 Y123.21 E.02919
G1 X143.54 Y124.79 E.04855
G1 X142.65 Y124.79 E.02734
M204 S10000
G1 X143.065 Y124.594 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.600678
G1 F6963
G1 X143.065 Y123.406 E.05399
; WIPE_START
G1 F24000
G1 X143.065 Y124.594 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I.011 J-1.217 P1  F30000
G1 X120.982 Y124.398 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6963
G1 X120.982 Y123.602 E.0264
G1 X139.018 Y123.602 E.59827
G1 X139.018 Y124.398 E.0264
G1 X121.042 Y124.398 E.59628
G1 X120.59 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6963
G1 X120.59 Y123.21 E.04855
G1 X139.41 Y123.21 E.57828
G1 X139.41 Y124.79 E.04855
G1 X120.65 Y124.79 E.57643
M204 S10000
G1 X121.186 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6963
G1 X138.814 Y124 E.55846
; WIPE_START
G1 F24000
G1 X136.814 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-.05 J-1.216 P1  F30000
G1 X117.41 Y124.79 Z13.8
G1 Z13.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6963
G1 X116.46 Y124.79 E.02919
G1 X116.46 Y123.21 E.04855
G1 X117.41 Y123.21 E.02919
G1 X117.41 Y124.73 E.04671
M204 S10000
G1 X116.935 Y124.594 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.600678
G1 F6963
G1 X116.935 Y123.406 E.05399
; WIPE_START
G1 F24000
G1 X116.935 Y124.594 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-1.216 J.034 P1  F30000
G1 X117.132 Y131.602 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6963
G1 X117.132 Y132.398 E.0264
G1 X116.852 Y132.398 E.00929
G1 X116.852 Y131.602 E.0264
G1 X117.072 Y131.602 E.0073
G1 X117.524 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6963
G1 X117.524 Y132.79 E.04855
G1 X116.46 Y132.79 E.0327
G1 X116.46 Y131.21 E.04855
G1 X117.464 Y131.21 E.03085
M204 S10000
; WIPE_START
G1 F24000
G1 X117.524 Y132.79 E-.60083
G1 X117.105 Y132.79 E-.15917
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I1.21 J-.132 P1  F30000
G1 X115.238 Y115.646 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Support
G1 F6963
G1 X115.335 Y115.646 E.00298
G1 X115.335 Y115.546 E.00308
G1 X115.65 Y115.231 E.01371
G1 X117.581 Y115.231 E.05931
G1 X117.896 Y115.546 E.01371
G1 X117.896 Y115.646 E.00308
G1 X119.351 Y115.646 E.0447
M73 P78 R5
G1 X119.351 Y115.546 E.00308
G1 X119.666 Y115.231 E.01371
G1 X139.581 Y115.231 E.61191
G1 X139.896 Y115.546 E.01371
G1 X139.896 Y115.646 E.00308
G1 X141.351 Y115.646 E.0447
G1 X141.351 Y115.546 E.00308
G1 X141.666 Y115.231 E.01371
G1 X143.597 Y115.231 E.05931
G1 X143.912 Y115.546 E.01371
G1 X143.912 Y115.646 E.00308
G1 X144.009 Y115.646 E.00298
G1 X144.009 Y112.769 E.0884
G1 X115.238 Y112.769 E.88405
G1 X115.238 Y110.081 E.08261
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I.578 J1.071 P1  F30000
G1 X119.266 Y109.905 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X119.333 Y109.972 E.00293
G1 X119.333 Y107.566 E.07394
G1 X119.226 Y107.673 E.00466
G1 X119.226 Y109.865 E.06735
; WIPE_START
G1 F24000
G1 X119.226 Y107.865 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I.221 J-1.197 P1  F30000
G1 X117.914 Y107.623 Z13.8
G1 Z13.4
G1 E.8 F1800
G1 F4800
G1 X117.914 Y109.972 E.07221
G1 X118.021 Y109.865 E.00466
G1 X118.021 Y107.673 E.06735
G1 X117.914 Y107.566 E.00466
G1 X120.562 Y107.231 F30000
; FEATURE: Support
G1 F6963
G1 X120.992 Y107.231 E.01321
G1 X120.992 Y107.015 E.00663
G1 X115.238 Y107.015 E.17681
G1 X115.238 Y109.892 E.0884
G1 X115.335 Y109.892 E.00298
G1 X115.335 Y109.992 E.00308
G1 X115.65 Y110.308 E.01371
G1 X117.053 Y110.308 E.0431
G1 X117.123 Y110.378 E.00304
G1 X118.041 Y110.378 E.02822
G1 X118.398 Y110.021 E.01549
G1 X118.398 Y109.892 E.00397
G1 X118.849 Y109.892 E.01386
G1 X118.849 Y110.021 E.00397
G1 X119.205 Y110.378 E.01549
G1 X120.124 Y110.378 E.02822
G1 X120.194 Y110.308 E.00304
G1 X139.053 Y110.308 E.57949
G1 X139.123 Y110.378 E.00304
G1 X140.041 Y110.378 E.02822
G1 X140.398 Y110.021 E.01549
G1 X140.398 Y109.892 E.00397
G1 X140.849 Y109.892 E.01386
G1 X140.849 Y110.021 E.00397
G1 X141.205 Y110.378 E.01549
G1 X142.124 Y110.378 E.02822
G1 X142.194 Y110.308 E.00304
G1 X143.597 Y110.308 E.0431
G1 X143.912 Y109.992 E.01371
G1 X143.912 Y109.892 E.00308
G1 X144.009 Y109.892 E.00298
G1 X144.009 Y107.015 E.0884
G1 X138.255 Y107.015 E.17681
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-1.035 J-.641 P1  F30000
G1 X139.914 Y107.566 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X140.021 Y107.673 E.00466
G1 X140.021 Y109.865 E.06735
G1 X139.914 Y109.972 E.00466
G1 X139.914 Y107.623 E.07221
; WIPE_START
G1 F24000
G1 X139.914 Y109.623 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-.221 J1.197 P1  F30000
G1 X141.226 Y109.865 Z13.8
G1 Z13.4
G1 E.8 F1800
G1 F4800
G1 X141.226 Y107.673 E.06735
G1 X141.333 Y107.566 E.00466
G1 X141.333 Y109.972 E.07394
G1 X141.266 Y109.905 E.00293
; WIPE_START
G1 F24000
G1 X141.333 Y109.972 E-.03619
G1 X141.333 Y108.068 E-.72381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-.45 J-1.131 P1  F30000
G1 X120.491 Y116.371 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6963
G1 X138.755 Y116.371 E.60585
G1 X138.755 Y117.167 E.0264
G1 X120.491 Y117.167 E.60585
G1 X120.491 Y116.431 E.02441
G1 X120.099 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6963
G1 X139.148 Y115.979 E.5853
G1 X139.148 Y117.559 E.04855
G1 X120.099 Y117.559 E.5853
G1 X120.099 Y116.039 E.04671
M204 S10000
G1 X120.695 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6963
G1 X138.552 Y116.769 E.5657
; WIPE_START
G1 F24000
G1 X136.552 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I.081 J1.214 P1  F30000
G1 X142.491 Y116.371 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6963
G1 X142.771 Y116.371 E.00929
G1 X142.771 Y117.167 E.0264
G1 X142.491 Y117.167 E.00929
G1 X142.491 Y116.431 E.02441
G1 X142.099 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6963
G1 X143.163 Y115.979 E.0327
G1 X143.163 Y117.559 E.04855
G1 X142.099 Y117.559 E.0327
G1 X142.099 Y116.039 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X143.163 Y115.979 E-.40502
G1 X143.163 Y116.913 E-.35498
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I1.207 J-.156 P1  F30000
G1 X142.214 Y109.559 Z13.8
G1 Z13.4
G1 E.8 F1800
M204 S5000
G1 F6963
G1 X142.214 Y107.979 E.04855
G1 X143.163 Y107.979 E.02919
G1 X143.163 Y109.559 E.04855
G1 X142.274 Y109.559 E.02734
M204 S10000
G1 X142.689 Y109.363 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.600678
G1 F6963
G1 X142.689 Y108.175 E.05399
; WIPE_START
G1 F24000
G1 X142.689 Y109.363 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I.011 J-1.217 P1  F30000
G1 X120.606 Y109.167 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6963
G1 X120.606 Y108.371 E.0264
G1 X138.641 Y108.371 E.59827
G1 X138.641 Y109.167 E.0264
G1 X120.666 Y109.167 E.59628
G1 X120.214 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6963
G1 X120.214 Y107.979 E.04855
G1 X139.033 Y107.979 E.57828
G1 X139.033 Y109.559 E.04855
G1 X120.274 Y109.559 E.57643
M204 S10000
G1 X120.809 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6963
G1 X138.438 Y108.769 E.55846
; WIPE_START
G1 F24000
G1 X136.438 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-.05 J-1.216 P1  F30000
G1 X117.033 Y109.559 Z13.8
G1 Z13.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6963
G1 X116.083 Y109.559 E.02919
G1 X116.083 Y107.979 E.04855
G1 X117.033 Y107.979 E.02919
G1 X117.033 Y109.499 E.04671
M204 S10000
G1 X116.558 Y109.363 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.600678
G1 F6963
G1 X116.558 Y108.175 E.05399
; WIPE_START
G1 F24000
G1 X116.558 Y109.363 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-1.216 J.034 P1  F30000
G1 X116.755 Y116.371 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6963
G1 X116.755 Y117.167 E.0264
G1 X116.476 Y117.167 E.00929
G1 X116.476 Y116.371 E.0264
G1 X116.695 Y116.371 E.0073
G1 X117.148 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6963
G1 X117.148 Y117.559 E.04855
G1 X116.083 Y117.559 E.0327
G1 X116.083 Y115.979 E.04855
G1 X117.088 Y115.979 E.03085
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X117.148 Y117.559 E-.60083
G1 X116.729 Y117.559 E-.15917
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 109/135
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
G3 Z13.8 I-.923 J.793 P1  F30000
G1 X120.939 Y122.461 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Support
G1 F5854
G1 X121.369 Y122.461 E.01321
G1 X121.369 Y122.246 E.00663
G1 X115.615 Y122.246 E.17681
G1 X115.615 Y125.123 E.0884
G1 X115.711 Y125.123 E.00298
G1 X115.711 Y125.223 E.00308
G1 X116.027 Y125.539 E.01371
G1 X117.298 Y125.539 E.03905
G1 X117.368 Y125.609 E.00304
G1 X118.173 Y125.609 E.02475
G1 X118.53 Y125.252 E.01549
G1 X118.53 Y125.123 E.00397
G1 X119.47 Y125.123 E.0289
G1 X119.47 Y125.252 E.00397
G1 X119.827 Y125.609 E.01549
G1 X120.632 Y125.609 E.02475
G1 X120.702 Y125.539 E.00304
G1 X139.298 Y125.539 E.57139
G1 X139.368 Y125.609 E.00304
G1 X140.173 Y125.609 E.02475
G1 X140.53 Y125.252 E.01549
G1 X140.53 Y125.123 E.00397
G1 X141.47 Y125.123 E.0289
G1 X141.47 Y125.252 E.00397
G1 X141.827 Y125.609 E.01549
G1 X142.632 Y125.609 E.02475
G1 X142.702 Y125.539 E.00304
G1 X143.973 Y125.539 E.03905
G1 X144.289 Y125.223 E.01371
G1 X144.289 Y125.123 E.00308
G1 X144.385 Y125.123 E.00298
G1 X144.385 Y122.246 E.0884
G1 X138.631 Y122.246 E.17681
; WIPE_START
G1 F24000
G1 X140.631 Y122.246 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-.148 J-1.208 P1  F30000
G1 X115.615 Y125.311 Z14
G1 Z13.6
G1 E.8 F1800
G1 F5854
G1 X115.615 Y128 E.08261
G1 X144.385 Y128 E.88405
G1 X144.385 Y130.877 E.0884
G1 X144.289 Y130.877 E.00298
G1 X144.289 Y130.777 E.00308
G1 X143.973 Y130.461 E.01371
G1 X142.127 Y130.461 E.05673
G1 X141.811 Y130.777 E.01371
G1 X141.811 Y130.877 E.00308
G1 X140.189 Y130.877 E.04986
G1 X140.189 Y130.777 E.00308
G1 X139.873 Y130.461 E.01371
G1 X120.127 Y130.461 E.60675
G1 X119.811 Y130.777 E.01371
G1 X119.811 Y130.877 E.00308
G1 X118.189 Y130.877 E.04986
G1 X118.189 Y130.777 E.00308
G1 X117.873 Y130.461 E.01371
G1 X116.027 Y130.461 E.05673
G1 X115.711 Y130.777 E.01371
G1 X115.711 Y130.877 E.00308
G1 X115.615 Y130.877 E.00298
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I1.217 J-.011 P1  F30000
G1 X117.334 Y124.79 Z14
G1 Z13.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
G1 F5854
G1 X116.46 Y124.79 E.02686
G1 X116.46 Y123.21 E.04855
G1 X117.334 Y123.21 E.02686
G1 X117.334 Y124.73 E.04671
M204 S10000
G1 X116.897 Y124.594 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.524828
G1 F5854
G1 X116.897 Y123.406 E.04665
; WIPE_START
G1 F24000
G1 X116.897 Y124.594 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-1.213 J.1 P1  F30000
G1 X117.44 Y131.21 Z14
G1 Z13.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5854
G1 X117.44 Y132.79 E.04855
G1 X116.46 Y132.79 E.03012
G1 X116.46 Y131.21 E.04855
G1 X117.38 Y131.21 E.02827
M204 S10000
G1 X116.95 Y131.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.630998
G1 F5854
G1 X116.95 Y132.594 E.05693
; WIPE_START
G1 F24000
G1 X116.95 Y131.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-.06 J1.216 P1  F30000
G1 X120.952 Y131.602 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5854
G1 X139.048 Y131.602 E.60028
G1 X139.048 Y132.398 E.0264
G1 X120.952 Y132.398 E.60028
G1 X120.952 Y131.662 E.02441
G1 X120.56 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5854
G1 X139.44 Y131.21 E.58014
G1 X139.44 Y132.79 E.04855
G1 X120.56 Y132.79 E.58014
G1 X120.56 Y131.27 E.04671
M204 S10000
G1 X121.155 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5854
G1 X138.845 Y132 E.56038
; WIPE_START
G1 F24000
G1 X136.845 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I.167 J1.206 P1  F30000
G1 X142.56 Y131.21 Z14
G1 Z13.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5854
G1 X143.54 Y131.21 E.03012
G1 X143.54 Y132.79 E.04855
G1 X142.56 Y132.79 E.03012
G1 X142.56 Y131.27 E.04671
M204 S10000
G1 X143.05 Y131.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.631
G1 F5854
G1 X143.05 Y132.594 E.05693
; WIPE_START
G1 F24000
G1 X143.05 Y131.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I1.215 J-.07 P1  F30000
G1 X142.666 Y124.79 Z14
G1 Z13.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5854
G1 X142.666 Y123.21 E.04855
G1 X143.54 Y123.21 E.02686
G1 X143.54 Y124.79 E.04855
G1 X142.726 Y124.79 E.02501
M204 S10000
G1 X143.103 Y124.594 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.524828
G1 F5854
G1 X143.103 Y123.406 E.04665
; WIPE_START
G1 F24000
G1 X143.103 Y124.594 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I.011 J-1.217 P1  F30000
G1 X121.058 Y124.398 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5854
G1 X121.058 Y123.602 E.0264
G1 X138.942 Y123.602 E.59324
G1 X138.942 Y124.398 E.0264
G1 X121.118 Y124.398 E.59125
G1 X120.666 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5854
G1 X120.666 Y123.21 E.04855
G1 X139.334 Y123.21 E.57361
G1 X139.334 Y124.79 E.04855
G1 X120.726 Y124.79 E.57177
M204 S10000
G1 X121.262 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5854
G1 X138.738 Y124 E.55365
; WIPE_START
G1 F24000
G1 X136.738 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I1.212 J.108 P1  F30000
G1 X138.255 Y107.015 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F5854
G1 X144.009 Y107.015 E.17681
G1 X144.009 Y109.892 E.0884
G1 X143.912 Y109.892 E.00298
G1 X143.912 Y109.992 E.00308
G1 X143.597 Y110.308 E.01371
G1 X142.326 Y110.308 E.03905
G1 X142.256 Y110.378 E.00304
G1 X141.45 Y110.378 E.02475
G1 X141.094 Y110.021 E.01549
G1 X141.094 Y109.892 E.00397
G1 X140.153 Y109.892 E.0289
G1 X140.153 Y110.021 E.00397
G1 X139.797 Y110.378 E.01549
G1 X138.991 Y110.378 E.02475
G1 X138.921 Y110.308 E.00304
G1 X120.326 Y110.308 E.57139
G1 X120.256 Y110.378 E.00304
G1 X119.45 Y110.378 E.02475
G1 X119.094 Y110.021 E.01549
G1 X119.094 Y109.892 E.00397
G1 X118.153 Y109.892 E.0289
G1 X118.153 Y110.021 E.00397
G1 X117.797 Y110.378 E.01549
G1 X116.991 Y110.378 E.02475
G1 X116.921 Y110.308 E.00304
G1 X115.65 Y110.308 E.03905
G1 X115.335 Y109.992 E.01371
G1 X115.335 Y109.892 E.00308
G1 X115.238 Y109.892 E.00298
G1 X115.238 Y107.015 E.0884
G1 X120.992 Y107.015 E.17681
G1 X120.992 Y107.231 E.00663
G1 X120.562 Y107.231 E.01321
; WIPE_START
G1 F24000
G1 X120.992 Y107.231 E-.16342
G1 X120.992 Y107.015 E-.08194
G1 X119.638 Y107.015 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-.696 J-.998 P1  F30000
G1 X115.238 Y110.081 Z14
G1 Z13.6
G1 E.8 F1800
G1 F5854
G1 X115.238 Y112.769 E.08261
G1 X144.009 Y112.769 E.88405
G1 X144.009 Y115.646 E.0884
G1 X143.912 Y115.646 E.00298
G1 X143.912 Y115.546 E.00308
G1 X143.597 Y115.231 E.01371
G1 X141.75 Y115.231 E.05673
G1 X141.435 Y115.546 E.01371
G1 X141.435 Y115.646 E.00308
G1 X139.812 Y115.646 E.04986
G1 X139.812 Y115.546 E.00308
G1 X139.497 Y115.231 E.01371
G1 X119.75 Y115.231 E.60675
G1 X119.435 Y115.546 E.01371
G1 X119.435 Y115.646 E.00308
G1 X117.812 Y115.646 E.04986
G1 X117.812 Y115.546 E.00308
G1 X117.497 Y115.231 E.01371
G1 X115.65 Y115.231 E.05673
G1 X115.335 Y115.546 E.01371
G1 X115.335 Y115.646 E.00308
G1 X115.238 Y115.646 E.00298
; WIPE_START
G1 F24000
G1 X115.335 Y115.646 E-.03681
G1 X115.335 Y115.546 E-.03806
M73 P79 R5
G1 X115.65 Y115.231 E-.16953
G1 X117.007 Y115.231 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I1.217 J-.011 P1  F30000
G1 X116.957 Y109.559 Z14
G1 Z13.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
G1 F5854
G1 X116.083 Y109.559 E.02686
G1 X116.083 Y107.979 E.04855
G1 X116.957 Y107.979 E.02686
G1 X116.957 Y109.499 E.04671
M204 S10000
G1 X116.52 Y109.363 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.524828
G1 F5854
G1 X116.52 Y108.175 E.04665
; WIPE_START
G1 F24000
G1 X116.52 Y109.363 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-1.213 J.1 P1  F30000
G1 X117.064 Y115.979 Z14
G1 Z13.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5854
G1 X117.064 Y117.559 E.04855
G1 X116.083 Y117.559 E.03012
G1 X116.083 Y115.979 E.04855
G1 X117.004 Y115.979 E.02827
M204 S10000
G1 X116.574 Y116.175 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.630998
G1 F5854
G1 X116.574 Y117.363 E.05693
; WIPE_START
G1 F24000
G1 X116.574 Y116.175 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-.06 J1.216 P1  F30000
G1 X120.575 Y116.371 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5854
G1 X138.672 Y116.371 E.60028
G1 X138.672 Y117.167 E.0264
G1 X120.575 Y117.167 E.60028
G1 X120.575 Y116.431 E.02441
G1 X120.183 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5854
G1 X139.064 Y115.979 E.58014
G1 X139.064 Y117.559 E.04855
G1 X120.183 Y117.559 E.58014
G1 X120.183 Y116.039 E.04671
M204 S10000
G1 X120.779 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5854
G1 X138.468 Y116.769 E.56038
; WIPE_START
G1 F24000
G1 X136.468 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I.167 J1.206 P1  F30000
G1 X142.183 Y115.979 Z14
G1 Z13.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5854
G1 X143.163 Y115.979 E.03012
G1 X143.163 Y117.559 E.04855
G1 X142.183 Y117.559 E.03012
G1 X142.183 Y116.039 E.04671
M204 S10000
G1 X142.673 Y116.175 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.631
G1 F5854
G1 X142.673 Y117.363 E.05693
; WIPE_START
G1 F24000
G1 X142.673 Y116.175 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I1.215 J-.07 P1  F30000
G1 X142.289 Y109.559 Z14
G1 Z13.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5854
G1 X142.289 Y107.979 E.04855
G1 X143.163 Y107.979 E.02686
G1 X143.163 Y109.559 E.04855
G1 X142.349 Y109.559 E.02501
M204 S10000
G1 X142.726 Y109.363 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.524828
G1 F5854
G1 X142.726 Y108.175 E.04665
; WIPE_START
G1 F24000
G1 X142.726 Y109.363 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I.011 J-1.217 P1  F30000
G1 X120.682 Y109.167 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5854
G1 X120.682 Y108.371 E.0264
G1 X138.565 Y108.371 E.59324
G1 X138.565 Y109.167 E.0264
G1 X120.742 Y109.167 E.59125
G1 X120.289 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5854
G1 X120.289 Y107.979 E.04855
G1 X138.957 Y107.979 E.57361
G1 X138.957 Y109.559 E.04855
G1 X120.349 Y109.559 E.57177
M204 S10000
G1 X120.885 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5854
G1 X138.362 Y108.769 E.55365
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X136.362 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 110/135
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
G3 Z14 I-.782 J-.932 P1  F30000
G1 X117.276 Y124.79 Z14
G1 Z13.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3712
G1 X116.46 Y124.79 E.02509
G1 X116.46 Y123.21 E.04855
G1 X117.276 Y123.21 E.02509
G1 X117.276 Y124.73 E.04671
M204 S10000
G1 X116.868 Y124.594 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.467268
G1 F3712
G1 X116.868 Y123.406 E.04108
; WIPE_START
G1 F24000
G1 X116.868 Y124.594 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-1.213 J.093 P1  F30000
G1 X117.376 Y131.21 Z14.2
G1 Z13.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3712
G1 X117.376 Y132.79 E.04855
G1 X116.46 Y132.79 E.02816
G1 X116.46 Y131.21 E.04855
G1 X117.316 Y131.21 E.02632
M204 S10000
G1 X116.918 Y131.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.567268
G1 F3712
G1 X116.918 Y132.594 E.05076
; WIPE_START
G1 F24000
G1 X116.918 Y131.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-.058 J1.216 P1  F30000
G1 X121.016 Y131.602 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3712
G1 X138.984 Y131.602 E.59605
G1 X138.984 Y132.398 E.0264
M73 P79 R4
G1 X121.016 Y132.398 E.59605
G1 X121.016 Y131.662 E.02441
G1 X120.624 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3712
G1 X139.376 Y131.21 E.57622
G1 X139.376 Y132.79 E.04855
G1 X120.624 Y132.79 E.57622
G1 X120.624 Y131.27 E.04671
M204 S10000
G1 X121.219 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F3712
G1 X138.781 Y132 E.55634
; WIPE_START
G1 F24000
G1 X136.781 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I.163 J1.206 P1  F30000
G1 X142.624 Y131.21 Z14.2
G1 Z13.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3712
G1 X143.54 Y131.21 E.02816
G1 X143.54 Y132.79 E.04855
G1 X142.624 Y132.79 E.02816
G1 X142.624 Y131.27 E.04671
M204 S10000
G1 X143.082 Y131.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.567268
G1 F3712
G1 X143.082 Y132.594 E.05076
; WIPE_START
G1 F24000
G1 X143.082 Y131.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I1.215 J-.066 P1  F30000
G1 X142.724 Y124.79 Z14.2
G1 Z13.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3712
G1 X142.724 Y123.21 E.04855
G1 X143.54 Y123.21 E.02509
G1 X143.54 Y124.79 E.04855
G1 X142.784 Y124.79 E.02324
M204 S10000
G1 X143.132 Y124.594 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.46727
G1 F3712
G1 X143.132 Y123.406 E.04108
; WIPE_START
G1 F24000
G1 X143.132 Y124.594 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I.011 J-1.217 P1  F30000
G1 X121.116 Y124.398 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3712
G1 X121.116 Y123.602 E.0264
G1 X138.884 Y123.602 E.58942
G1 X138.884 Y124.398 E.0264
G1 X121.176 Y124.398 E.58743
G1 X120.724 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3712
G1 X120.724 Y123.21 E.04855
G1 X139.276 Y123.21 E.57008
G1 X139.276 Y124.79 E.04855
G1 X120.784 Y124.79 E.56823
M204 S10000
G1 X121.319 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F3712
G1 X138.681 Y124 E.55
; WIPE_START
G1 F24000
G1 X136.681 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I.718 J-.983 P1  F30000
G1 X116.9 Y109.559 Z14.2
G1 Z13.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3712
G1 X116.083 Y109.559 E.02509
G1 X116.083 Y107.979 E.04855
G1 X116.9 Y107.979 E.02509
G1 X116.9 Y109.499 E.04671
M204 S10000
G1 X116.492 Y109.363 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.467268
G1 F3712
G1 X116.492 Y108.175 E.04108
; WIPE_START
G1 F24000
G1 X116.492 Y109.363 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-1.213 J.093 P1  F30000
G1 X117 Y115.979 Z14.2
G1 Z13.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3712
G1 X117 Y117.559 E.04855
G1 X116.083 Y117.559 E.02816
G1 X116.083 Y115.979 E.04855
G1 X116.94 Y115.979 E.02632
M204 S10000
G1 X116.542 Y116.175 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.567268
G1 F3712
G1 X116.542 Y117.363 E.05076
; WIPE_START
G1 F24000
G1 X116.542 Y116.175 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-.058 J1.216 P1  F30000
G1 X120.639 Y116.371 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3712
G1 X138.608 Y116.371 E.59605
G1 X138.608 Y117.167 E.0264
G1 X120.639 Y117.167 E.59605
G1 X120.639 Y116.431 E.02441
G1 X120.247 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3712
G1 X139 Y115.979 E.57622
G1 X139 Y117.559 E.04855
G1 X120.247 Y117.559 E.57622
G1 X120.247 Y116.039 E.04671
M204 S10000
G1 X120.843 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F3712
G1 X138.404 Y116.769 E.55634
; WIPE_START
G1 F24000
G1 X136.404 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I.163 J1.206 P1  F30000
G1 X142.247 Y115.979 Z14.2
G1 Z13.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3712
G1 X143.163 Y115.979 E.02816
G1 X143.163 Y117.559 E.04855
G1 X142.247 Y117.559 E.02816
G1 X142.247 Y116.039 E.04671
M204 S10000
G1 X142.705 Y116.175 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.567268
G1 F3712
G1 X142.705 Y117.363 E.05076
; WIPE_START
G1 F24000
G1 X142.705 Y116.175 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I1.215 J-.066 P1  F30000
G1 X142.347 Y109.559 Z14.2
G1 Z13.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3712
G1 X142.347 Y107.979 E.04855
G1 X143.163 Y107.979 E.02509
G1 X143.163 Y109.559 E.04855
G1 X142.407 Y109.559 E.02324
M204 S10000
G1 X142.755 Y109.363 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.46727
G1 F3712
G1 X142.755 Y108.175 E.04108
; WIPE_START
G1 F24000
G1 X142.755 Y109.363 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I.011 J-1.217 P1  F30000
G1 X120.739 Y109.167 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3712
G1 X120.739 Y108.371 E.0264
G1 X138.508 Y108.371 E.58942
G1 X138.508 Y109.167 E.0264
G1 X120.799 Y109.167 E.58743
G1 X120.347 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3712
G1 X120.347 Y107.979 E.04855
G1 X138.9 Y107.979 E.57008
G1 X138.9 Y109.559 E.04855
G1 X120.407 Y109.559 E.56823
M204 S10000
G1 X120.943 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F3712
G1 X138.304 Y108.769 E.55
; CHANGE_LAYER
; Z_HEIGHT: 13.8667
; LAYER_HEIGHT: 0.0666666
; WIPE_START
G1 F24000
G1 X136.304 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 111/135
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
G3 Z14.2 I-1.199 J.207 P1  F30000
G1 X138.631 Y122.246 Z14.2
G1 Z13.867
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.266667
G1 F5864
G1 X144.385 Y122.246 E.2268
G1 X144.385 Y125.123 E.1134
G1 X144.289 Y125.123 E.00382
G1 X144.289 Y125.223 E.00395
G1 X143.973 Y125.539 E.01758
G1 X142.702 Y125.539 E.05009
G1 X142.632 Y125.609 E.0039
G1 X141.996 Y125.609 E.02506
G1 X141.64 Y125.252 E.01987
G1 X141.64 Y125.123 E.00509
G1 X140.36 Y125.123 E.05044
G1 X140.36 Y125.252 E.00509
G1 X140.004 Y125.609 E.01987
G1 X139.368 Y125.609 E.02506
G1 X139.298 Y125.539 E.0039
G1 X120.702 Y125.539 E.73295
G1 X120.632 Y125.609 E.0039
G1 X119.996 Y125.609 E.02506
G1 X119.64 Y125.252 E.01987
G1 X119.64 Y125.123 E.00509
G1 X118.36 Y125.123 E.05044
G1 X118.36 Y125.252 E.00509
G1 X118.004 Y125.609 E.01987
G1 X117.368 Y125.609 E.02506
G1 X117.298 Y125.539 E.0039
G1 X116.027 Y125.539 E.05009
G1 X115.711 Y125.223 E.01758
G1 X115.711 Y125.123 E.00395
G1 X115.615 Y125.123 E.00382
G1 X115.615 Y122.246 E.1134
G1 X121.369 Y122.246 E.2268
G1 X121.369 Y122.461 E.0085
G1 X120.939 Y122.461 E.01695
; WIPE_START
M73 P80 R4
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.267 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z14.267
G1 Z13.867
G1 E.8 F1800
G1 F5864
G1 X115.615 Y128 E.10597
G1 X144.385 Y128 E1.13401
G1 X144.385 Y130.877 E.1134
G1 X144.289 Y130.877 E.00382
G1 X144.289 Y130.777 E.00395
G1 X143.973 Y130.461 E.01758
G1 X142.191 Y130.461 E.07026
G1 X141.875 Y130.777 E.01758
G1 X141.875 Y130.877 E.00395
G1 X140.125 Y130.877 E.06898
G1 X140.125 Y130.777 E.00395
G1 X139.809 Y130.461 E.01758
G1 X120.191 Y130.461 E.77329
G1 X119.875 Y130.777 E.01758
G1 X119.875 Y130.877 E.00395
G1 X118.125 Y130.877 E.06898
G1 X118.125 Y130.777 E.00395
G1 X117.809 Y130.461 E.01758
G1 X116.027 Y130.461 E.07026
G1 X115.711 Y130.777 E.01758
G1 X115.711 Y130.877 E.00395
G1 X115.615 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.267 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z14.267
G1 Z13.867
G1 E.8 F1800
G1 F5864
G1 X115.335 Y115.646 E.00382
G1 X115.335 Y115.546 E.00395
G1 X115.65 Y115.231 E.01758
G1 X117.433 Y115.231 E.07026
G1 X117.748 Y115.546 E.01758
G1 X117.748 Y115.646 E.00395
G1 X119.498 Y115.646 E.06898
G1 X119.498 Y115.546 E.00395
G1 X119.814 Y115.231 E.01758
G1 X139.433 Y115.231 E.77329
G1 X139.748 Y115.546 E.01758
G1 X139.748 Y115.646 E.00395
G1 X141.498 Y115.646 E.06898
G1 X141.498 Y115.546 E.00395
G1 X141.814 Y115.231 E.01758
G1 X143.597 Y115.231 E.07026
G1 X143.912 Y115.546 E.01758
G1 X143.912 Y115.646 E.00395
G1 X144.009 Y115.646 E.00382
G1 X144.009 Y112.769 E.1134
G1 X115.238 Y112.769 E1.13401
G1 X115.238 Y110.081 E.10597
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.267 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z14.267
G1 Z13.867
G1 E.8 F1800
G1 F5864
G1 X120.992 Y107.231 E.01695
G1 X120.992 Y107.015 E.0085
G1 X115.238 Y107.015 E.2268
G1 X115.238 Y109.892 E.1134
G1 X115.335 Y109.892 E.00382
G1 X115.335 Y109.992 E.00395
G1 X115.65 Y110.308 E.01758
G1 X116.921 Y110.308 E.05009
G1 X116.991 Y110.378 E.0039
G1 X117.627 Y110.378 E.02506
G1 X117.984 Y110.021 E.01987
G1 X117.984 Y109.892 E.00509
G1 X119.263 Y109.892 E.05044
G1 X119.263 Y110.021 E.00509
G1 X119.62 Y110.378 E.01987
G1 X120.256 Y110.378 E.02506
G1 X120.326 Y110.308 E.0039
G1 X138.921 Y110.308 E.73295
G1 X138.991 Y110.378 E.0039
G1 X139.627 Y110.378 E.02506
G1 X139.984 Y110.021 E.01987
G1 X139.984 Y109.892 E.00509
G1 X141.263 Y109.892 E.05044
G1 X141.263 Y110.021 E.00509
G1 X141.62 Y110.378 E.01987
G1 X142.256 Y110.378 E.02506
G1 X142.326 Y110.308 E.0039
G1 X143.597 Y110.308 E.05009
G1 X143.912 Y109.992 E.01758
G1 X143.912 Y109.892 E.00395
G1 X144.009 Y109.892 E.00382
G1 X144.009 Y107.015 E.1134
G1 X138.255 Y107.015 E.2268
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.133333
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 112/135
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
G3 Z14.267 I-.744 J-.963 P1  F30000
G1 X117.252 Y124.79 Z14.267
G1 Z14
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LAYER_HEIGHT: 0.2
G1 F5864
G1 X116.46 Y124.79 E.02434
G1 X116.46 Y123.21 E.04855
G1 X117.252 Y123.21 E.02434
G1 X117.252 Y124.73 E.04671
M204 S10000
G1 X116.856 Y124.594 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.442984
G1 F5864
G1 X116.856 Y123.406 E.03873
; WIPE_START
G1 F24000
G1 X116.856 Y124.594 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-1.214 J.091 P1  F30000
G1 X117.352 Y131.21 Z14.4
G1 Z14
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5864
G1 X117.352 Y132.79 E.04855
G1 X116.46 Y132.79 E.02741
G1 X116.46 Y131.21 E.04855
G1 X117.292 Y131.21 E.02557
M204 S10000
G1 X116.906 Y131.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.542984
G1 F5864
G1 X116.906 Y132.594 E.04841
; WIPE_START
G1 F24000
G1 X116.906 Y131.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-.058 J1.216 P1  F30000
G1 X121.04 Y131.602 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5864
G1 X138.96 Y131.602 E.59444
G1 X138.96 Y132.398 E.0264
G1 X121.04 Y132.398 E.59444
G1 X121.04 Y131.662 E.02441
G1 X120.648 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5864
G1 X139.352 Y131.21 E.57473
G1 X139.352 Y132.79 E.04855
G1 X120.648 Y132.79 E.57473
G1 X120.648 Y131.27 E.04671
M204 S10000
G1 X121.243 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5864
G1 X138.757 Y132 E.5548
; WIPE_START
G1 F24000
G1 X136.757 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I.162 J1.206 P1  F30000
G1 X142.648 Y131.21 Z14.4
G1 Z14
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5864
G1 X143.54 Y131.21 E.02741
G1 X143.54 Y132.79 E.04855
G1 X142.648 Y132.79 E.02741
G1 X142.648 Y131.27 E.04671
M204 S10000
G1 X143.094 Y131.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.542984
G1 F5864
G1 X143.094 Y132.594 E.04841
; WIPE_START
G1 F24000
G1 X143.094 Y131.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I1.215 J-.064 P1  F30000
G1 X142.748 Y124.79 Z14.4
G1 Z14
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5864
G1 X142.748 Y123.21 E.04855
G1 X143.54 Y123.21 E.02434
G1 X143.54 Y124.79 E.04855
G1 X142.808 Y124.79 E.0225
M204 S10000
G1 X143.144 Y124.594 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.442986
G1 F5864
G1 X143.144 Y123.406 E.03873
; WIPE_START
G1 F24000
G1 X143.144 Y124.594 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I.011 J-1.217 P1  F30000
G1 X121.14 Y124.398 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5864
G1 X121.14 Y123.602 E.0264
G1 X138.86 Y123.602 E.58781
G1 X138.86 Y124.398 E.0264
G1 X121.2 Y124.398 E.58582
G1 X120.748 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5864
G1 X120.748 Y123.21 E.04855
G1 X139.252 Y123.21 E.56859
G1 X139.252 Y124.79 E.04855
G1 X120.808 Y124.79 E.56674
M204 S10000
G1 X121.343 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5864
G1 X138.657 Y124 E.54847
; WIPE_START
G1 F24000
G1 X136.657 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I.718 J-.983 P1  F30000
G1 X116.876 Y109.559 Z14.4
G1 Z14
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5864
G1 X116.083 Y109.559 E.02434
G1 X116.083 Y107.979 E.04855
G1 X116.876 Y107.979 E.02434
G1 X116.876 Y109.499 E.04671
M204 S10000
G1 X116.48 Y109.363 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.442984
G1 F5864
G1 X116.48 Y108.175 E.03873
; WIPE_START
G1 F24000
G1 X116.48 Y109.363 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-1.214 J.091 P1  F30000
G1 X116.976 Y115.979 Z14.4
G1 Z14
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5864
G1 X116.976 Y117.559 E.04855
G1 X116.083 Y117.559 E.02741
G1 X116.083 Y115.979 E.04855
G1 X116.916 Y115.979 E.02557
M204 S10000
G1 X116.53 Y116.175 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.542984
G1 F5864
G1 X116.53 Y117.363 E.04841
; WIPE_START
G1 F24000
G1 X116.53 Y116.175 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-.058 J1.216 P1  F30000
G1 X120.663 Y116.371 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5864
G1 X138.583 Y116.371 E.59444
G1 X138.583 Y117.167 E.0264
G1 X120.663 Y117.167 E.59444
G1 X120.663 Y116.431 E.02441
G1 X120.271 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5864
G1 X138.976 Y115.979 E.57473
G1 X138.976 Y117.559 E.04855
G1 X120.271 Y117.559 E.57473
G1 X120.271 Y116.039 E.04671
M204 S10000
G1 X120.867 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5864
G1 X138.38 Y116.769 E.5548
; WIPE_START
G1 F24000
G1 X136.38 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I.162 J1.206 P1  F30000
G1 X142.271 Y115.979 Z14.4
G1 Z14
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5864
G1 X143.163 Y115.979 E.02741
G1 X143.163 Y117.559 E.04855
G1 X142.271 Y117.559 E.02741
G1 X142.271 Y116.039 E.04671
M204 S10000
G1 X142.717 Y116.175 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.542984
G1 F5864
G1 X142.717 Y117.363 E.04841
; WIPE_START
G1 F24000
G1 X142.717 Y116.175 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I1.215 J-.064 P1  F30000
G1 X142.371 Y109.559 Z14.4
G1 Z14
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5864
G1 X142.371 Y107.979 E.04855
G1 X143.163 Y107.979 E.02434
G1 X143.163 Y109.559 E.04855
G1 X142.431 Y109.559 E.0225
M204 S10000
G1 X142.767 Y109.363 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.442986
G1 F5864
G1 X142.767 Y108.175 E.03873
; WIPE_START
G1 F24000
G1 X142.767 Y109.363 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I.011 J-1.217 P1  F30000
G1 X120.763 Y109.167 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5864
G1 X120.763 Y108.371 E.0264
G1 X138.484 Y108.371 E.58781
G1 X138.484 Y109.167 E.0264
G1 X120.823 Y109.167 E.58582
G1 X120.371 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5864
G1 X120.371 Y107.979 E.04855
G1 X138.876 Y107.979 E.56859
G1 X138.876 Y109.559 E.04855
G1 X120.431 Y109.559 E.56674
M204 S10000
G1 X120.967 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5864
G1 X138.28 Y108.769 E.54847
; CHANGE_LAYER
; Z_HEIGHT: 14.1333
; LAYER_HEIGHT: 0.133333
; WIPE_START
G1 F24000
G1 X136.28 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 113/135
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
G3 Z14.4 I-1.199 J.209 P1  F30000
G1 X138.631 Y122.246 Z14.4
G1 Z14.133
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.266667
G1 F5858
G1 X144.385 Y122.246 E.2268
G1 X144.385 Y125.123 E.1134
G1 X144.289 Y125.123 E.00382
G1 X144.289 Y125.223 E.00395
G1 X143.973 Y125.539 E.01758
G1 X142.315 Y125.539 E.06536
G1 X141.999 Y125.223 E.01758
G1 X141.999 Y125.123 E.00395
G1 X140.001 Y125.123 E.07878
G1 X140.001 Y125.223 E.00395
G1 X139.685 Y125.539 E.01758
G1 X120.315 Y125.539 E.76349
G1 X119.999 Y125.223 E.01758
G1 X119.999 Y125.123 E.00395
G1 X118.001 Y125.123 E.07878
G1 X118.001 Y125.223 E.00395
G1 X117.685 Y125.539 E.01758
G1 X116.027 Y125.539 E.06536
G1 X115.711 Y125.223 E.01758
G1 X115.711 Y125.123 E.00395
G1 X115.615 Y125.123 E.00382
G1 X115.615 Y122.246 E.1134
G1 X121.369 Y122.246 E.2268
G1 X121.369 Y122.461 E.0085
G1 X120.939 Y122.461 E.01695
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.533 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z14.533
G1 Z14.133
G1 E.8 F1800
G1 F5858
G1 X115.615 Y128 E.10597
G1 X144.385 Y128 E1.13401
G1 X144.385 Y130.877 E.1134
G1 X144.289 Y130.877 E.00382
G1 X144.289 Y130.777 E.00395
G1 X143.973 Y130.461 E.01758
G1 X142.215 Y130.461 E.0693
G1 X141.899 Y130.777 E.01758
G1 X141.899 Y130.877 E.00395
G1 X140.101 Y130.877 E.07089
G1 X140.101 Y130.777 E.00395
G1 X139.785 Y130.461 E.01758
G1 X120.215 Y130.461 E.77137
G1 X119.899 Y130.777 E.01758
G1 X119.899 Y130.877 E.00395
G1 X118.101 Y130.877 E.07089
G1 X118.101 Y130.777 E.00395
G1 X117.785 Y130.461 E.01758
G1 X116.027 Y130.461 E.0693
G1 X115.711 Y130.777 E.01758
G1 X115.711 Y130.877 E.00395
G1 X115.615 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.533 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z14.533
G1 Z14.133
G1 E.8 F1800
G1 F5858
G1 X115.335 Y115.646 E.00382
G1 X115.335 Y115.546 E.00395
G1 X115.65 Y115.231 E.01758
G1 X117.409 Y115.231 E.0693
G1 X117.724 Y115.546 E.01758
G1 X117.724 Y115.646 E.00395
M73 P81 R4
G1 X119.523 Y115.646 E.07089
G1 X119.523 Y115.546 E.00395
G1 X119.838 Y115.231 E.01758
G1 X139.409 Y115.231 E.77137
G1 X139.724 Y115.546 E.01758
G1 X139.724 Y115.646 E.00395
G1 X141.523 Y115.646 E.07089
G1 X141.523 Y115.546 E.00395
G1 X141.838 Y115.231 E.01758
G1 X143.597 Y115.231 E.0693
G1 X143.912 Y115.546 E.01758
G1 X143.912 Y115.646 E.00395
G1 X144.009 Y115.646 E.00382
G1 X144.009 Y112.769 E.1134
G1 X115.238 Y112.769 E1.13401
G1 X115.238 Y110.081 E.10597
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.533 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z14.533
G1 Z14.133
G1 E.8 F1800
G1 F5858
G1 X120.992 Y107.231 E.01695
G1 X120.992 Y107.015 E.0085
G1 X115.238 Y107.015 E.2268
G1 X115.238 Y109.892 E.1134
G1 X115.335 Y109.892 E.00382
G1 X115.335 Y109.992 E.00395
G1 X115.65 Y110.308 E.01758
G1 X117.309 Y110.308 E.06536
G1 X117.624 Y109.992 E.01758
G1 X117.624 Y109.892 E.00395
G1 X119.623 Y109.892 E.07878
G1 X119.623 Y109.992 E.00395
G1 X119.938 Y110.308 E.01758
G1 X139.309 Y110.308 E.76349
G1 X139.624 Y109.992 E.01758
G1 X139.624 Y109.892 E.00395
G1 X141.623 Y109.892 E.07878
G1 X141.623 Y109.992 E.00395
G1 X141.938 Y110.308 E.01758
G1 X143.597 Y110.308 E.06536
G1 X143.912 Y109.992 E.01758
G1 X143.912 Y109.892 E.00395
G1 X144.009 Y109.892 E.00382
G1 X144.009 Y107.015 E.1134
G1 X138.255 Y107.015 E.2268
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.0666666
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 114/135
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
G3 Z14.533 I-.744 J-.963 P1  F30000
G1 X117.252 Y124.79 Z14.533
G1 Z14.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LAYER_HEIGHT: 0.2
G1 F5858
G1 X116.46 Y124.79 E.02434
G1 X116.46 Y123.21 E.04855
G1 X117.252 Y123.21 E.02434
G1 X117.252 Y124.73 E.04671
M204 S10000
G1 X116.856 Y124.594 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.442984
G1 F5858
G1 X116.856 Y123.406 E.03873
; WIPE_START
G1 F24000
G1 X116.856 Y124.594 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-1.214 J.091 P1  F30000
G1 X117.352 Y131.21 Z14.6
G1 Z14.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5858
G1 X117.352 Y132.79 E.04855
G1 X116.46 Y132.79 E.02741
G1 X116.46 Y131.21 E.04855
G1 X117.292 Y131.21 E.02557
M204 S10000
G1 X116.906 Y131.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.542984
G1 F5858
G1 X116.906 Y132.594 E.04841
; WIPE_START
G1 F24000
G1 X116.906 Y131.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-.058 J1.216 P1  F30000
G1 X121.04 Y131.602 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5858
G1 X138.96 Y131.602 E.59444
G1 X138.96 Y132.398 E.0264
G1 X121.04 Y132.398 E.59444
G1 X121.04 Y131.662 E.02441
G1 X120.648 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5858
G1 X139.352 Y131.21 E.57473
G1 X139.352 Y132.79 E.04855
G1 X120.648 Y132.79 E.57473
G1 X120.648 Y131.27 E.04671
M204 S10000
G1 X121.243 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5858
G1 X138.757 Y132 E.5548
; WIPE_START
G1 F24000
G1 X136.757 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I.162 J1.206 P1  F30000
G1 X142.648 Y131.21 Z14.6
G1 Z14.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5858
G1 X143.54 Y131.21 E.02741
G1 X143.54 Y132.79 E.04855
G1 X142.648 Y132.79 E.02741
G1 X142.648 Y131.27 E.04671
M204 S10000
G1 X143.094 Y131.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.542984
G1 F5858
G1 X143.094 Y132.594 E.04841
; WIPE_START
G1 F24000
G1 X143.094 Y131.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I1.215 J-.064 P1  F30000
G1 X142.748 Y124.79 Z14.6
G1 Z14.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5858
G1 X142.748 Y123.21 E.04855
G1 X143.54 Y123.21 E.02434
G1 X143.54 Y124.79 E.04855
G1 X142.808 Y124.79 E.0225
M204 S10000
G1 X143.144 Y124.594 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.442986
G1 F5858
G1 X143.144 Y123.406 E.03873
; WIPE_START
G1 F24000
G1 X143.144 Y124.594 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I.011 J-1.217 P1  F30000
G1 X121.14 Y124.398 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5858
G1 X121.14 Y123.602 E.0264
G1 X138.86 Y123.602 E.58781
G1 X138.86 Y124.398 E.0264
G1 X121.2 Y124.398 E.58582
G1 X120.748 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5858
G1 X120.748 Y123.21 E.04855
G1 X139.252 Y123.21 E.56859
G1 X139.252 Y124.79 E.04855
G1 X120.808 Y124.79 E.56674
M204 S10000
G1 X121.343 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5858
G1 X138.657 Y124 E.54847
; WIPE_START
G1 F24000
G1 X136.657 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I.718 J-.983 P1  F30000
G1 X116.876 Y109.559 Z14.6
G1 Z14.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5858
G1 X116.083 Y109.559 E.02434
G1 X116.083 Y107.979 E.04855
G1 X116.876 Y107.979 E.02434
G1 X116.876 Y109.499 E.04671
M204 S10000
G1 X116.48 Y109.363 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.442984
G1 F5858
G1 X116.48 Y108.175 E.03873
; WIPE_START
G1 F24000
G1 X116.48 Y109.363 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-1.214 J.091 P1  F30000
G1 X116.976 Y115.979 Z14.6
G1 Z14.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5858
G1 X116.976 Y117.559 E.04855
G1 X116.083 Y117.559 E.02741
G1 X116.083 Y115.979 E.04855
G1 X116.916 Y115.979 E.02557
M204 S10000
G1 X116.53 Y116.175 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.542984
G1 F5858
G1 X116.53 Y117.363 E.04841
; WIPE_START
G1 F24000
G1 X116.53 Y116.175 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-.058 J1.216 P1  F30000
G1 X120.663 Y116.371 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5858
G1 X138.583 Y116.371 E.59444
G1 X138.583 Y117.167 E.0264
G1 X120.663 Y117.167 E.59444
G1 X120.663 Y116.431 E.02441
G1 X120.271 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5858
G1 X138.976 Y115.979 E.57473
G1 X138.976 Y117.559 E.04855
G1 X120.271 Y117.559 E.57473
G1 X120.271 Y116.039 E.04671
M204 S10000
G1 X120.867 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5858
G1 X138.38 Y116.769 E.5548
; WIPE_START
G1 F24000
G1 X136.38 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I.162 J1.206 P1  F30000
G1 X142.271 Y115.979 Z14.6
G1 Z14.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5858
G1 X143.163 Y115.979 E.02741
G1 X143.163 Y117.559 E.04855
G1 X142.271 Y117.559 E.02741
G1 X142.271 Y116.039 E.04671
M204 S10000
G1 X142.717 Y116.175 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.542984
G1 F5858
G1 X142.717 Y117.363 E.04841
; WIPE_START
G1 F24000
G1 X142.717 Y116.175 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I1.215 J-.064 P1  F30000
G1 X142.371 Y109.559 Z14.6
G1 Z14.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5858
G1 X142.371 Y107.979 E.04855
G1 X143.163 Y107.979 E.02434
G1 X143.163 Y109.559 E.04855
G1 X142.431 Y109.559 E.0225
M204 S10000
G1 X142.767 Y109.363 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.442986
G1 F5858
G1 X142.767 Y108.175 E.03873
; WIPE_START
G1 F24000
G1 X142.767 Y109.363 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I.011 J-1.217 P1  F30000
G1 X120.763 Y109.167 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5858
G1 X120.763 Y108.371 E.0264
G1 X138.484 Y108.371 E.58781
G1 X138.484 Y109.167 E.0264
G1 X120.823 Y109.167 E.58582
G1 X120.371 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5858
G1 X120.371 Y107.979 E.04855
G1 X138.876 Y107.979 E.56859
G1 X138.876 Y109.559 E.04855
G1 X120.431 Y109.559 E.56674
M204 S10000
G1 X120.967 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5858
G1 X138.28 Y108.769 E.54847
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X136.28 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 115/135
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
G3 Z14.6 I-1.199 J.209 P1  F30000
G1 X138.631 Y122.246 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.266667
G1 F5798
G1 X144.385 Y122.246 E.2268
G1 X144.385 Y125.123 E.1134
G1 X144.289 Y125.123 E.00382
G1 X144.289 Y125.223 E.00395
G1 X143.973 Y125.539 E.01758
G1 X142.233 Y125.539 E.06859
G1 X141.917 Y125.223 E.01758
G1 X141.917 Y125.123 E.00395
G1 X140.083 Y125.123 E.07232
G1 X140.083 Y125.223 E.00395
G1 X139.767 Y125.539 E.01758
G1 X120.233 Y125.539 E.76994
G1 X119.917 Y125.223 E.01758
G1 X119.917 Y125.123 E.00395
G1 X118.083 Y125.123 E.07232
G1 X118.083 Y125.223 E.00395
G1 X117.767 Y125.539 E.01758
G1 X116.027 Y125.539 E.06859
G1 X115.711 Y125.223 E.01758
G1 X115.711 Y125.123 E.00395
G1 X115.615 Y125.123 E.00382
G1 X115.615 Y122.246 E.1134
G1 X121.369 Y122.246 E.2268
G1 X121.369 Y122.461 E.0085
G1 X120.939 Y122.461 E.01695
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z14.8
G1 Z14.4
G1 E.8 F1800
G1 F5798
G1 X115.615 Y128 E.10597
G1 X144.385 Y128 E1.13401
G1 X144.385 Y130.877 E.1134
G1 X144.289 Y130.877 E.00382
G1 X144.289 Y130.777 E.00395
G1 X143.973 Y130.461 E.01758
G1 X142.127 Y130.461 E.07277
G1 X141.811 Y130.777 E.01758
G1 X141.811 Y130.877 E.00395
G1 X140.189 Y130.877 E.06396
G1 X140.189 Y130.777 E.00395
G1 X139.873 Y130.461 E.01758
G1 X120.127 Y130.461 E.77831
G1 X119.811 Y130.777 E.01758
G1 X119.811 Y130.877 E.00395
G1 X118.189 Y130.877 E.06396
G1 X118.189 Y130.777 E.00395
G1 X117.873 Y130.461 E.01758
G1 X116.027 Y130.461 E.07277
G1 X115.711 Y130.777 E.01758
G1 X115.711 Y130.877 E.00395
G1 X115.615 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I1.217 J-.023 P1  F30000
G1 X117.276 Y124.79 Z14.8
G1 Z14.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LAYER_HEIGHT: 0.2
G1 F5798
G1 X116.46 Y124.79 E.02509
G1 X116.46 Y123.21 E.04855
G1 X117.276 Y123.21 E.02509
G1 X117.276 Y124.73 E.04671
M204 S10000
G1 X116.868 Y124.594 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.467268
G1 F5798
G1 X116.868 Y123.406 E.04108
; WIPE_START
G1 F24000
G1 X116.868 Y124.594 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-1.213 J.093 P1  F30000
G1 X117.376 Y131.21 Z14.8
G1 Z14.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5798
G1 X117.376 Y132.79 E.04855
G1 X116.46 Y132.79 E.02816
G1 X116.46 Y131.21 E.04855
G1 X117.316 Y131.21 E.02632
M204 S10000
G1 X116.918 Y131.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.567268
G1 F5798
G1 X116.918 Y132.594 E.05076
; WIPE_START
G1 F24000
G1 X116.918 Y131.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-.058 J1.216 P1  F30000
G1 X121.016 Y131.602 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5798
G1 X138.984 Y131.602 E.59605
G1 X138.984 Y132.398 E.0264
G1 X121.016 Y132.398 E.59605
G1 X121.016 Y131.662 E.02441
G1 X120.624 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5798
G1 X139.376 Y131.21 E.57622
G1 X139.376 Y132.79 E.04855
G1 X120.624 Y132.79 E.57622
G1 X120.624 Y131.27 E.04671
M204 S10000
G1 X121.219 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5798
G1 X138.781 Y132 E.55634
; WIPE_START
G1 F24000
G1 X136.781 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I.163 J1.206 P1  F30000
G1 X142.624 Y131.21 Z14.8
G1 Z14.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5798
G1 X143.54 Y131.21 E.02816
G1 X143.54 Y132.79 E.04855
G1 X142.624 Y132.79 E.02816
G1 X142.624 Y131.27 E.04671
M204 S10000
G1 X143.082 Y131.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.567268
G1 F5798
G1 X143.082 Y132.594 E.05076
; WIPE_START
G1 F24000
G1 X143.082 Y131.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I1.215 J-.066 P1  F30000
G1 X142.724 Y124.79 Z14.8
G1 Z14.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5798
G1 X142.724 Y123.21 E.04855
G1 X143.54 Y123.21 E.02509
G1 X143.54 Y124.79 E.04855
G1 X142.784 Y124.79 E.02324
M204 S10000
G1 X143.132 Y124.594 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.46727
G1 F5798
G1 X143.132 Y123.406 E.04108
; WIPE_START
G1 F24000
G1 X143.132 Y124.594 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I.011 J-1.217 P1  F30000
G1 X121.116 Y124.398 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5798
G1 X121.116 Y123.602 E.0264
G1 X138.884 Y123.602 E.58942
G1 X138.884 Y124.398 E.0264
G1 X121.176 Y124.398 E.58743
M73 P82 R4
G1 X120.724 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5798
G1 X120.724 Y123.21 E.04855
G1 X139.276 Y123.21 E.57008
G1 X139.276 Y124.79 E.04855
G1 X120.784 Y124.79 E.56823
M204 S10000
G1 X121.319 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5798
G1 X138.681 Y124 E.55
; WIPE_START
G1 F24000
G1 X136.681 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I1.212 J.112 P1  F30000
G1 X138.255 Y107.015 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.266667
G1 F5798
G1 X144.009 Y107.015 E.2268
G1 X144.009 Y109.892 E.1134
G1 X143.912 Y109.892 E.00382
G1 X143.912 Y109.992 E.00395
G1 X143.597 Y110.308 E.01758
G1 X141.856 Y110.308 E.06859
G1 X141.541 Y109.992 E.01758
G1 X141.541 Y109.892 E.00395
G1 X139.706 Y109.892 E.07232
G1 X139.706 Y109.992 E.00395
G1 X139.39 Y110.308 E.01758
G1 X119.856 Y110.308 E.76994
G1 X119.541 Y109.992 E.01758
G1 X119.541 Y109.892 E.00395
G1 X117.706 Y109.892 E.07232
G1 X117.706 Y109.992 E.00395
G1 X117.39 Y110.308 E.01758
G1 X115.65 Y110.308 E.06859
G1 X115.335 Y109.992 E.01758
G1 X115.335 Y109.892 E.00395
G1 X115.238 Y109.892 E.00382
G1 X115.238 Y107.015 E.1134
G1 X120.992 Y107.015 E.2268
G1 X120.992 Y107.231 E.0085
G1 X120.562 Y107.231 E.01695
; WIPE_START
G1 F24000
G1 X120.992 Y107.231 E-.16342
G1 X120.992 Y107.015 E-.08194
G1 X119.638 Y107.015 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-.696 J-.998 P1  F30000
G1 X115.238 Y110.081 Z14.8
G1 Z14.4
G1 E.8 F1800
G1 F5798
G1 X115.238 Y112.769 E.10597
G1 X144.009 Y112.769 E1.13401
G1 X144.009 Y115.646 E.1134
G1 X143.912 Y115.646 E.00382
G1 X143.912 Y115.546 E.00395
G1 X143.597 Y115.231 E.01758
G1 X141.75 Y115.231 E.07277
G1 X141.435 Y115.546 E.01758
G1 X141.435 Y115.646 E.00395
G1 X139.812 Y115.646 E.06396
G1 X139.812 Y115.546 E.00395
G1 X139.497 Y115.231 E.01758
G1 X119.75 Y115.231 E.77831
G1 X119.435 Y115.546 E.01758
G1 X119.435 Y115.646 E.00395
G1 X117.812 Y115.646 E.06396
G1 X117.812 Y115.546 E.00395
G1 X117.497 Y115.231 E.01758
G1 X115.65 Y115.231 E.07277
G1 X115.335 Y115.546 E.01758
G1 X115.335 Y115.646 E.00395
G1 X115.238 Y115.646 E.00382
; WIPE_START
G1 F24000
G1 X115.335 Y115.646 E-.03681
G1 X115.335 Y115.546 E-.03806
G1 X115.65 Y115.231 E-.16953
G1 X117.007 Y115.231 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I1.217 J-.023 P1  F30000
G1 X116.9 Y109.559 Z14.8
G1 Z14.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LAYER_HEIGHT: 0.2
G1 F5798
G1 X116.083 Y109.559 E.02509
G1 X116.083 Y107.979 E.04855
G1 X116.9 Y107.979 E.02509
G1 X116.9 Y109.499 E.04671
M204 S10000
G1 X116.492 Y109.363 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.467268
G1 F5798
G1 X116.492 Y108.175 E.04108
; WIPE_START
G1 F24000
G1 X116.492 Y109.363 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-1.213 J.093 P1  F30000
G1 X117 Y115.979 Z14.8
G1 Z14.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5798
G1 X117 Y117.559 E.04855
G1 X116.083 Y117.559 E.02816
G1 X116.083 Y115.979 E.04855
G1 X116.94 Y115.979 E.02632
M204 S10000
G1 X116.542 Y116.175 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.567268
G1 F5798
G1 X116.542 Y117.363 E.05076
; WIPE_START
G1 F24000
G1 X116.542 Y116.175 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-.058 J1.216 P1  F30000
G1 X120.639 Y116.371 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5798
G1 X138.608 Y116.371 E.59605
G1 X138.608 Y117.167 E.0264
G1 X120.639 Y117.167 E.59605
G1 X120.639 Y116.431 E.02441
G1 X120.247 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5798
G1 X139 Y115.979 E.57622
G1 X139 Y117.559 E.04855
G1 X120.247 Y117.559 E.57622
G1 X120.247 Y116.039 E.04671
M204 S10000
G1 X120.843 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5798
G1 X138.404 Y116.769 E.55634
; WIPE_START
G1 F24000
G1 X136.404 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I.163 J1.206 P1  F30000
G1 X142.247 Y115.979 Z14.8
G1 Z14.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5798
G1 X143.163 Y115.979 E.02816
G1 X143.163 Y117.559 E.04855
G1 X142.247 Y117.559 E.02816
G1 X142.247 Y116.039 E.04671
M204 S10000
G1 X142.705 Y116.175 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.567268
G1 F5798
G1 X142.705 Y117.363 E.05076
; WIPE_START
G1 F24000
G1 X142.705 Y116.175 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I1.215 J-.066 P1  F30000
G1 X142.347 Y109.559 Z14.8
G1 Z14.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5798
G1 X142.347 Y107.979 E.04855
G1 X143.163 Y107.979 E.02509
G1 X143.163 Y109.559 E.04855
G1 X142.407 Y109.559 E.02324
M204 S10000
G1 X142.755 Y109.363 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.46727
G1 F5798
G1 X142.755 Y108.175 E.04108
; WIPE_START
G1 F24000
G1 X142.755 Y109.363 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I.011 J-1.217 P1  F30000
G1 X120.739 Y109.167 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5798
G1 X120.739 Y108.371 E.0264
G1 X138.508 Y108.371 E.58942
G1 X138.508 Y109.167 E.0264
G1 X120.799 Y109.167 E.58743
G1 X120.347 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5798
G1 X120.347 Y107.979 E.04855
G1 X138.9 Y107.979 E.57008
G1 X138.9 Y109.559 E.04855
G1 X120.407 Y109.559 E.56823
M204 S10000
G1 X120.943 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5798
G1 X138.304 Y108.769 E.55
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X136.304 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 116/135
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
G3 Z14.8 I-.785 J-.93 P1  F30000
G1 X117.317 Y124.79 Z14.8
G1 Z14.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3770
G1 X116.46 Y124.79 E.02635
G1 X116.46 Y123.21 E.04855
G1 X117.317 Y123.21 E.02635
G1 X117.334 Y123.21 E.00051
G1 X117.334 Y124.747 E.04721
M204 S10000
G1 X116.897 Y124.594 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.524828
G1 F3770
G1 X116.897 Y123.406 E.04665
; WIPE_START
G1 F24000
G1 X116.897 Y124.594 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-1.213 J.095 P1  F30000
G1 X117.417 Y131.21 Z15
G1 Z14.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3770
G1 X117.44 Y131.21 E.0007
G1 X117.44 Y132.79 E.04855
G1 X117.417 Y132.79 E.0007
G1 X116.46 Y132.79 E.02942
G1 X116.46 Y131.21 E.04855
G1 X117.357 Y131.21 E.02758
M204 S10000
G1 X116.95 Y131.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.630998
G1 F3770
G1 X116.95 Y132.594 E.05693
; WIPE_START
G1 F24000
G1 X116.95 Y131.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-.06 J1.216 P1  F30000
G1 X120.952 Y131.602 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3770
G1 X139.048 Y131.602 E.60028
G1 X139.048 Y132.398 E.0264
G1 X120.952 Y132.398 E.60028
G1 X120.952 Y131.662 E.02441
G1 X120.583 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3770
G1 X139.417 Y131.21 E.57874
G1 X139.44 Y131.21 E.0007
G1 X139.44 Y132.79 E.04855
G1 X139.417 Y132.79 E.0007
G1 X120.583 Y132.79 E.57874
G1 X120.56 Y132.79 E.0007
G1 X120.56 Y131.247 E.0474
M204 S10000
G1 X121.155 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F3770
G1 X138.845 Y132 E.56038
; WIPE_START
G1 F24000
G1 X136.845 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I.166 J1.206 P1  F30000
G1 X142.583 Y131.21 Z15
G1 Z14.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3770
G1 X143.54 Y131.21 E.02942
G1 X143.54 Y132.79 E.04855
G1 X142.583 Y132.79 E.02942
G1 X142.56 Y132.79 E.0007
G1 X142.56 Y131.247 E.0474
M204 S10000
G1 X143.05 Y131.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.631
G1 F3770
G1 X143.05 Y132.594 E.05693
; WIPE_START
G1 F24000
G1 X143.05 Y131.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I1.215 J-.067 P1  F30000
G1 X142.683 Y124.79 Z15
G1 Z14.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3770
G1 X142.666 Y124.79 E.00051
G1 X142.666 Y123.21 E.04855
G1 X142.683 Y123.21 E.00051
G1 X143.54 Y123.21 E.02635
G1 X143.54 Y124.79 E.04855
G1 X142.743 Y124.79 E.0245
M204 S10000
G1 X143.103 Y124.594 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.524828
G1 F3770
G1 X143.103 Y123.406 E.04665
; WIPE_START
G1 F24000
G1 X143.103 Y124.594 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I.011 J-1.217 P1  F30000
G1 X121.058 Y124.398 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3770
G1 X121.058 Y123.602 E.0264
G1 X138.942 Y123.602 E.59324
G1 X138.942 Y124.398 E.0264
G1 X121.118 Y124.398 E.59125
G1 X120.683 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3770
G1 X120.666 Y124.79 E.00051
G1 X120.666 Y123.21 E.04855
G1 X120.683 Y123.21 E.00051
G1 X139.317 Y123.21 E.5726
G1 X139.334 Y123.21 E.00051
G1 X139.334 Y124.79 E.04855
G1 X139.317 Y124.79 E.00051
G1 X120.743 Y124.79 E.57075
M204 S10000
G1 X121.262 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F3770
G1 X138.738 Y124 E.55365
; WIPE_START
G1 F24000
G1 X136.738 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I.717 J-.983 P1  F30000
G1 X116.941 Y109.559 Z15
G1 Z14.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3770
G1 X116.083 Y109.559 E.02635
G1 X116.083 Y107.979 E.04855
G1 X116.941 Y107.979 E.02635
G1 X116.957 Y107.979 E.00051
G1 X116.957 Y109.516 E.04721
M204 S10000
G1 X116.52 Y109.363 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.524828
G1 F3770
G1 X116.52 Y108.175 E.04665
; WIPE_START
G1 F24000
G1 X116.52 Y109.363 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-1.213 J.095 P1  F30000
G1 X117.041 Y115.979 Z15
G1 Z14.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3770
G1 X117.064 Y115.979 E.0007
G1 X117.064 Y117.559 E.04855
G1 X117.041 Y117.559 E.0007
G1 X116.083 Y117.559 E.02942
G1 X116.083 Y115.979 E.04855
G1 X116.981 Y115.979 E.02758
M204 S10000
G1 X116.574 Y116.175 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.630998
G1 F3770
G1 X116.574 Y117.363 E.05693
; WIPE_START
G1 F24000
G1 X116.574 Y116.175 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-.06 J1.216 P1  F30000
G1 X120.575 Y116.371 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3770
G1 X138.672 Y116.371 E.60028
G1 X138.672 Y117.167 E.0264
G1 X120.575 Y117.167 E.60028
G1 X120.575 Y116.431 E.02441
G1 X120.206 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3770
G1 X139.041 Y115.979 E.57874
G1 X139.064 Y115.979 E.0007
G1 X139.064 Y117.559 E.04855
G1 X139.041 Y117.559 E.0007
G1 X120.206 Y117.559 E.57874
G1 X120.183 Y117.559 E.0007
G1 X120.183 Y116.017 E.0474
M204 S10000
G1 X120.779 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F3770
G1 X138.468 Y116.769 E.56038
; WIPE_START
G1 F24000
G1 X136.468 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I.166 J1.206 P1  F30000
G1 X142.206 Y115.979 Z15
G1 Z14.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3770
M73 P83 R4
G1 X143.163 Y115.979 E.02942
G1 X143.163 Y117.559 E.04855
G1 X142.206 Y117.559 E.02942
G1 X142.183 Y117.559 E.0007
G1 X142.183 Y116.017 E.0474
M204 S10000
G1 X142.673 Y116.175 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.631
G1 F3770
G1 X142.673 Y117.363 E.05693
; WIPE_START
G1 F24000
G1 X142.673 Y116.175 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I1.215 J-.067 P1  F30000
G1 X142.306 Y109.559 Z15
G1 Z14.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3770
G1 X142.289 Y109.559 E.00051
G1 X142.289 Y107.979 E.04855
G1 X142.306 Y107.979 E.00051
G1 X143.163 Y107.979 E.02635
G1 X143.163 Y109.559 E.04855
G1 X142.366 Y109.559 E.0245
M204 S10000
G1 X142.726 Y109.363 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.524828
G1 F3770
G1 X142.726 Y108.175 E.04665
; WIPE_START
G1 F24000
G1 X142.726 Y109.363 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I.011 J-1.217 P1  F30000
G1 X120.682 Y109.167 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3770
G1 X120.682 Y108.371 E.0264
G1 X138.565 Y108.371 E.59324
G1 X138.565 Y109.167 E.0264
G1 X120.742 Y109.167 E.59125
G1 X120.306 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3770
G1 X120.289 Y109.559 E.00051
G1 X120.289 Y107.979 E.04855
G1 X120.306 Y107.979 E.00051
G1 X138.941 Y107.979 E.5726
G1 X138.957 Y107.979 E.00051
G1 X138.957 Y109.559 E.04855
G1 X138.941 Y109.559 E.00051
G1 X120.366 Y109.559 E.57075
M204 S10000
G1 X120.885 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F3770
G1 X138.362 Y108.769 E.55365
; CHANGE_LAYER
; Z_HEIGHT: 14.6667
; LAYER_HEIGHT: 0.0666666
; WIPE_START
G1 F24000
G1 X136.362 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 117/135
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
G3 Z15 I-1.2 J.202 P1  F30000
G1 X138.631 Y122.246 Z15
G1 Z14.667
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.266667
G1 F6061
G1 X144.385 Y122.246 E.2268
G1 X144.385 Y125.123 E.1134
G1 X144.289 Y125.123 E.00382
G1 X144.289 Y125.223 E.00395
G1 X143.973 Y125.539 E.01758
G1 X142.157 Y125.539 E.07158
G1 X141.842 Y125.223 E.01758
G1 X141.842 Y125.123 E.00395
G1 X140.158 Y125.123 E.06635
G1 X140.158 Y125.223 E.00395
G1 X139.843 Y125.539 E.01758
G1 X120.157 Y125.539 E.77592
G1 X119.842 Y125.223 E.01758
G1 X119.842 Y125.123 E.00395
G1 X118.158 Y125.123 E.06635
G1 X118.158 Y125.223 E.00395
G1 X117.843 Y125.539 E.01758
G1 X116.027 Y125.539 E.07158
G1 X115.711 Y125.223 E.01758
G1 X115.711 Y125.123 E.00395
G1 X115.615 Y125.123 E.00382
G1 X115.615 Y122.246 E.1134
G1 X121.369 Y122.246 E.2268
G1 X121.369 Y122.461 E.0085
G1 X120.939 Y122.461 E.01695
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.067 I-.696 J-.998 P1  F30000
G1 X115.615 Y125.311 Z15.067
G1 Z14.667
G1 E.8 F1800
G1 F6061
G1 X115.615 Y128 E.10597
G1 X144.385 Y128 E1.13401
G1 X144.385 Y130.877 E.1134
G1 X144.289 Y130.877 E.00382
G1 X144.289 Y130.777 E.00395
G1 X143.973 Y130.461 E.01758
G1 X142.043 Y130.461 E.07608
G1 X141.727 Y130.777 E.01758
G1 X141.727 Y130.877 E.00395
G1 X140.273 Y130.877 E.05733
G1 X140.273 Y130.777 E.00395
G1 X139.957 Y130.461 E.01758
G1 X120.043 Y130.461 E.78493
G1 X119.727 Y130.777 E.01758
G1 X119.727 Y130.877 E.00395
G1 X118.273 Y130.877 E.05733
G1 X118.273 Y130.777 E.00395
G1 X117.957 Y130.461 E.01758
G1 X116.027 Y130.461 E.07608
G1 X115.711 Y130.777 E.01758
G1 X115.711 Y130.877 E.00395
G1 X115.615 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.067 I1.204 J-.174 P1  F30000
G1 X115.238 Y115.646 Z15.067
G1 Z14.667
G1 E.8 F1800
G1 F6061
G1 X115.335 Y115.646 E.00382
G1 X115.335 Y115.546 E.00395
G1 X115.65 Y115.231 E.01758
G1 X117.581 Y115.231 E.07608
G1 X117.896 Y115.546 E.01758
G1 X117.896 Y115.646 E.00395
G1 X119.351 Y115.646 E.05733
G1 X119.351 Y115.546 E.00395
G1 X119.666 Y115.231 E.01758
G1 X139.581 Y115.231 E.78493
G1 X139.896 Y115.546 E.01758
G1 X139.896 Y115.646 E.00395
G1 X141.351 Y115.646 E.05733
G1 X141.351 Y115.546 E.00395
G1 X141.666 Y115.231 E.01758
G1 X143.597 Y115.231 E.07608
G1 X143.912 Y115.546 E.01758
G1 X143.912 Y115.646 E.00395
G1 X144.009 Y115.646 E.00382
G1 X144.009 Y112.769 E.1134
G1 X115.238 Y112.769 E1.13401
G1 X115.238 Y110.081 E.10597
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.067 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z15.067
G1 Z14.667
G1 E.8 F1800
G1 F6061
G1 X120.992 Y107.231 E.01695
G1 X120.992 Y107.015 E.0085
M73 P83 R3
G1 X115.238 Y107.015 E.2268
G1 X115.238 Y109.892 E.1134
G1 X115.335 Y109.892 E.00382
G1 X115.335 Y109.992 E.00395
G1 X115.65 Y110.308 E.01758
G1 X117.466 Y110.308 E.07158
G1 X117.782 Y109.992 E.01758
G1 X117.782 Y109.892 E.00395
G1 X119.465 Y109.892 E.06635
G1 X119.465 Y109.992 E.00395
G1 X119.781 Y110.308 E.01758
G1 X139.466 Y110.308 E.77592
G1 X139.782 Y109.992 E.01758
G1 X139.782 Y109.892 E.00395
G1 X141.465 Y109.892 E.06635
G1 X141.465 Y109.992 E.00395
G1 X141.781 Y110.308 E.01758
G1 X143.597 Y110.308 E.07158
G1 X143.912 Y109.992 E.01758
G1 X143.912 Y109.892 E.00395
G1 X144.009 Y109.892 E.00382
G1 X144.009 Y107.015 E.1134
G1 X138.255 Y107.015 E.2268
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.133333
; WIPE_START
G1 F24000
G1 X140.255 Y107.015 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 118/135
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
G3 Z15.067 I-.956 J-.754 P1  F30000
G1 X120.868 Y131.602 Z15.067
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6061
G1 X139.132 Y131.602 E.60585
G1 X139.132 Y132.398 E.0264
G1 X120.868 Y132.398 E.60585
G1 X120.868 Y131.662 E.02441
G1 X120.519 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6061
G1 X139.481 Y131.21 E.58266
G1 X139.524 Y131.21 E.00132
G1 X139.524 Y132.79 E.04855
G1 X139.481 Y132.79 E.00132
G1 X120.519 Y132.79 E.58266
G1 X120.476 Y132.79 E.00132
G1 X120.476 Y131.227 E.04803
M204 S10000
G1 X121.071 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6061
G1 X138.929 Y132 E.5657
; WIPE_START
G1 F24000
G1 X136.929 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I.081 J1.214 P1  F30000
G1 X142.868 Y131.602 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6061
G1 X143.148 Y131.602 E.00929
G1 X143.148 Y132.398 E.0264
G1 X142.868 Y132.398 E.00929
G1 X142.868 Y131.662 E.02441
G1 X142.519 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6061
G1 X143.54 Y131.21 E.03138
G1 X143.54 Y132.79 E.04855
G1 X142.519 Y132.79 E.03138
G1 X142.476 Y132.79 E.00132
G1 X142.476 Y131.227 E.04803
M204 S10000
; WIPE_START
G1 F24000
G1 X143.54 Y131.21 E-.40443
G1 X143.54 Y132.146 E-.35557
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I1.208 J-.15 P1  F30000
G1 X142.625 Y124.79 Z15.2
G1 Z14.8
G1 E.8 F1800
M204 S5000
G1 F6061
G1 X142.59 Y124.79 E.00107
G1 X142.59 Y123.21 E.04855
G1 X142.625 Y123.21 E.00107
G1 X143.54 Y123.21 E.02812
G1 X143.54 Y124.79 E.04855
G1 X142.685 Y124.79 E.02627
M204 S10000
G1 X143.065 Y124.594 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.600678
G1 F6061
G1 X143.065 Y123.406 E.05399
; WIPE_START
G1 F24000
G1 X143.065 Y124.594 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I.011 J-1.217 P1  F30000
G1 X120.982 Y124.398 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6061
G1 X120.982 Y123.602 E.0264
G1 X139.018 Y123.602 E.59827
G1 X139.018 Y124.398 E.0264
G1 X121.042 Y124.398 E.59628
G1 X120.625 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6061
G1 X120.59 Y124.79 E.00107
G1 X120.59 Y123.21 E.04855
G1 X120.625 Y123.21 E.00107
G1 X139.375 Y123.21 E.57613
G1 X139.41 Y123.21 E.00107
G1 X139.41 Y124.79 E.04855
G1 X139.375 Y124.79 E.00107
G1 X120.685 Y124.79 E.57429
M204 S10000
G1 X121.186 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6061
G1 X138.814 Y124 E.55846
; WIPE_START
G1 F24000
G1 X136.814 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-.049 J-1.216 P1  F30000
G1 X117.375 Y124.79 Z15.2
G1 Z14.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6061
G1 X116.46 Y124.79 E.02811
G1 X116.46 Y123.21 E.04855
G1 X117.375 Y123.21 E.02811
G1 X117.41 Y123.21 E.00107
G1 X117.41 Y124.765 E.04778
M204 S10000
G1 X116.935 Y124.594 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.600678
G1 F6061
G1 X116.935 Y123.406 E.05399
; WIPE_START
G1 F24000
G1 X116.935 Y124.594 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-1.216 J.034 P1  F30000
G1 X117.132 Y131.602 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6061
G1 X117.132 Y132.398 E.0264
G1 X116.852 Y132.398 E.00929
G1 X116.852 Y131.602 E.0264
G1 X117.072 Y131.602 E.0073
G1 X117.481 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6061
G1 X117.524 Y131.21 E.00132
G1 X117.524 Y132.79 E.04855
G1 X117.481 Y132.79 E.00132
G1 X116.46 Y132.79 E.03138
G1 X116.46 Y131.21 E.04855
G1 X117.421 Y131.21 E.02953
M204 S10000
; WIPE_START
G1 F24000
G1 X117.524 Y131.21 E-.03913
G1 X117.524 Y132.79 E-.6004
G1 X117.481 Y132.79 E-.01633
G1 X117.207 Y132.79 E-.10413
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I1.193 J.239 P1  F30000
G1 X120.491 Y116.371 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6061
G1 X138.755 Y116.371 E.60585
G1 X138.755 Y117.167 E.0264
G1 X120.491 Y117.167 E.60585
G1 X120.491 Y116.431 E.02441
G1 X120.142 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6061
G1 X139.105 Y115.979 E.58266
G1 X139.148 Y115.979 E.00132
G1 X139.148 Y117.559 E.04855
G1 X139.105 Y117.559 E.00132
G1 X120.142 Y117.559 E.58266
G1 X120.099 Y117.559 E.00132
G1 X120.099 Y115.996 E.04803
M204 S10000
G1 X120.695 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6061
G1 X138.552 Y116.769 E.5657
; WIPE_START
G1 F24000
G1 X136.552 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I.081 J1.214 P1  F30000
G1 X142.491 Y116.371 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6061
G1 X142.771 Y116.371 E.00929
G1 X142.771 Y117.167 E.0264
G1 X142.491 Y117.167 E.00929
G1 X142.491 Y116.431 E.02441
G1 X142.142 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6061
G1 X143.163 Y115.979 E.03138
G1 X143.163 Y117.559 E.04855
G1 X142.142 Y117.559 E.03138
G1 X142.099 Y117.559 E.00132
G1 X142.099 Y115.996 E.04803
M204 S10000
; WIPE_START
G1 F24000
G1 X143.163 Y115.979 E-.40443
G1 X143.163 Y116.915 E-.35557
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I1.208 J-.15 P1  F30000
G1 X142.248 Y109.559 Z15.2
G1 Z14.8
G1 E.8 F1800
M204 S5000
G1 F6061
G1 X142.214 Y109.559 E.00107
G1 X142.214 Y107.979 E.04855
G1 X142.248 Y107.979 E.00107
G1 X143.163 Y107.979 E.02812
G1 X143.163 Y109.559 E.04855
G1 X142.308 Y109.559 E.02627
M204 S10000
G1 X142.689 Y109.363 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.600678
G1 F6061
G1 X142.689 Y108.175 E.05399
; WIPE_START
G1 F24000
G1 X142.689 Y109.363 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I.011 J-1.217 P1  F30000
G1 X120.606 Y109.167 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6061
G1 X120.606 Y108.371 E.0264
G1 X138.641 Y108.371 E.59827
G1 X138.641 Y109.167 E.0264
G1 X120.666 Y109.167 E.59628
G1 X120.248 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6061
G1 X120.214 Y109.559 E.00107
G1 X120.214 Y107.979 E.04855
G1 X120.248 Y107.979 E.00107
G1 X138.998 Y107.979 E.57613
G1 X139.033 Y107.979 E.00107
G1 X139.033 Y109.559 E.04855
G1 X138.998 Y109.559 E.00107
G1 X120.308 Y109.559 E.57429
M204 S10000
G1 X120.809 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6061
G1 X138.438 Y108.769 E.55846
; WIPE_START
G1 F24000
G1 X136.438 Y108.769 E-.76
; WIPE_END
M73 P84 R3
G1 E-.04 F1800
G17
G3 Z15.2 I-.049 J-1.216 P1  F30000
G1 X116.998 Y109.559 Z15.2
G1 Z14.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6061
G1 X116.083 Y109.559 E.02811
G1 X116.083 Y107.979 E.04855
G1 X116.998 Y107.979 E.02811
G1 X117.033 Y107.979 E.00107
G1 X117.033 Y109.534 E.04778
M204 S10000
G1 X116.558 Y109.363 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.600678
G1 F6061
G1 X116.558 Y108.175 E.05399
; WIPE_START
G1 F24000
G1 X116.558 Y109.363 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-1.216 J.034 P1  F30000
G1 X116.755 Y116.371 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6061
G1 X116.755 Y117.167 E.0264
G1 X116.476 Y117.167 E.00929
G1 X116.476 Y116.371 E.0264
G1 X116.695 Y116.371 E.0073
G1 X117.105 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6061
G1 X117.148 Y115.979 E.00132
G1 X117.148 Y117.559 E.04855
G1 X117.105 Y117.559 E.00132
G1 X116.083 Y117.559 E.03138
G1 X116.083 Y115.979 E.04855
G1 X117.045 Y115.979 E.02953
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 14.9333
; LAYER_HEIGHT: 0.133333
; WIPE_START
G1 F24000
G1 X117.148 Y115.979 E-.03913
G1 X117.148 Y117.559 E-.6004
G1 X117.105 Y117.559 E-.01633
G1 X116.831 Y117.559 E-.10413
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 119/135
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
G3 Z15.2 I-.933 J.782 P1  F30000
G1 X120.939 Y122.461 Z15.2
G1 Z14.933
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.266667
G1 F6834
G1 X121.369 Y122.461 E.01695
G1 X121.369 Y122.246 E.0085
G1 X115.615 Y122.246 E.2268
G1 X115.615 Y125.123 E.1134
G1 X115.711 Y125.123 E.00382
G1 X115.711 Y125.223 E.00395
G1 X116.027 Y125.539 E.01758
G1 X117.975 Y125.539 E.07677
G1 X118.29 Y125.223 E.01758
G2 X118.31 Y125.123 I-.148 J-.081 E.00409
G1 X119.69 Y125.123 E.05441
G3 X119.71 Y125.223 I-.137 J.079 E.0041
G1 X120.025 Y125.539 E.01758
G1 X144.385 Y125.5 E.96016
G1 X144.385 Y128 E.09854
G1 X115.615 Y128 E1.13401
G1 X115.615 Y130.877 E.1134
G1 X115.711 Y130.877 E.00382
G1 X115.711 Y130.777 E.00395
G1 X116.027 Y130.461 E.01758
G1 X118.095 Y130.461 E.08152
G1 X118.411 Y130.79 E.01796
G3 X118.46 Y130.877 I-.019 J.068 E.00436
G1 X119.54 Y130.877 E.04261
G3 X119.589 Y130.79 I.068 J-.019 E.00436
G1 X119.905 Y130.461 E.01796
G1 X140.095 Y130.461 E.79581
G1 X140.411 Y130.79 E.01796
G3 X140.46 Y130.877 I-.019 J.068 E.00436
G1 X141.54 Y130.877 E.04261
G3 X141.589 Y130.79 I.068 J-.019 E.00436
G1 X141.905 Y130.461 E.01796
G1 X143.973 Y130.461 E.08152
G1 X144.289 Y130.777 E.01758
G1 X144.289 Y130.877 E.00395
G1 X144.385 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X144.289 Y130.877 E-.03681
G1 X144.289 Y130.777 E-.03806
G1 X143.973 Y130.461 E-.16953
G1 X142.616 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.333 I1.194 J.237 P1  F30000
G1 X144.167 Y122.655 Z15.333
G1 Z14.933
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X144.289 Y122.777 E.0068
G1 X144.289 Y125.123 E.09247
G1 X144.385 Y125.123 E.00382
G1 X144.385 Y122.246 E.1134
G1 X144.033 Y122.246 E.01388
G1 X144.033 Y122.522 E.01087
G1 X143.973 Y122.461 E.00336
G1 X143.156 Y122.461 E.0322
G1 X143.156 Y122.246 E.0085
G1 X142.279 Y122.246 E.03457
G1 X142.279 Y122.461 E.0085
G2 X141.613 Y122.671 I-.153 J.675 E.02885
G1 X142.091 Y122.246 F30000
G1 F4800
G1 X141.402 Y122.246 E.02714
G1 X141.402 Y125.123 E.1134
G1 X140.554 Y125.123 E.03341
G1 X140.525 Y122.246 E.11341
G1 X139.648 Y122.246 E.03457
G1 X139.648 Y122.461 E.0085
G1 X138.771 Y122.461 E.03457
G1 X138.771 Y122.246 E.0085
; WIPE_START
G1 F24000
G1 X138.771 Y122.461 E-.08195
G1 X139.648 Y122.461 E-.33329
G1 X139.648 Y122.246 E-.08195
G1 X140.339 Y122.246 E-.26282
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.333 I1.064 J.591 P1  F30000
G1 X144.009 Y115.646 Z15.333
G1 Z14.933
G1 E.8 F1800
; FEATURE: Support
G1 F6834
G1 X143.912 Y115.646 E.00382
G1 X143.912 Y115.546 E.00395
G1 X143.597 Y115.231 E.01758
G1 X141.528 Y115.231 E.08152
G1 X141.213 Y115.56 E.01796
G2 X141.164 Y115.646 I.019 J.068 E.00436
G1 X140.083 Y115.646 E.04261
G2 X140.034 Y115.56 I-.068 J-.019 E.00436
G1 X139.719 Y115.231 E.01796
G1 X119.528 Y115.231 E.79581
G1 X119.213 Y115.56 E.01796
G2 X119.164 Y115.646 I.019 J.068 E.00436
G1 X118.083 Y115.646 E.04261
G2 X118.034 Y115.56 I-.068 J-.019 E.00436
G1 X117.719 Y115.231 E.01796
G1 X115.65 Y115.231 E.08152
G1 X115.335 Y115.546 E.01758
G1 X115.335 Y115.646 E.00395
G1 X115.238 Y115.646 E.00382
G1 X115.238 Y112.769 E.1134
G1 X144.009 Y112.769 E1.13401
G1 X144.009 Y110.269 E.09854
G1 X119.649 Y110.308 E.96016
G1 X119.333 Y109.992 E.01758
G2 X119.314 Y109.892 I-.157 J-.021 E.0041
G1 X117.933 Y109.892 E.05441
G3 X117.914 Y109.992 I-.168 J.019 E.00409
G1 X117.598 Y110.308 E.01758
G1 X115.65 Y110.308 E.07677
G1 X115.335 Y109.992 E.01758
G1 X115.335 Y109.892 E.00395
G1 X115.238 Y109.892 E.00382
G1 X115.238 Y107.015 E.1134
G1 X120.992 Y107.015 E.2268
G1 X120.992 Y107.231 E.0085
G1 X120.562 Y107.231 E.01695
; WIPE_START
G1 F24000
G1 X120.992 Y107.231 E-.16342
G1 X120.992 Y107.015 E-.08194
G1 X119.638 Y107.015 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.333 I0 J1.217 P1  F30000
G1 X138.394 Y107.015 Z15.333
G1 Z14.933
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X138.394 Y107.231 E.0085
G1 X139.271 Y107.231 E.03457
G1 X139.271 Y107.015 E.0085
G1 X140.148 Y107.015 E.03457
G1 X140.178 Y109.892 E.11341
G1 X141.025 Y109.892 E.03341
G1 X141.025 Y107.015 E.1134
G1 X141.714 Y107.015 E.02714
G1 X141.237 Y107.441 F30000
G1 F4800
G3 X141.903 Y107.231 I.513 J.465 E.02885
G1 X141.903 Y107.015 E.0085
G1 X142.78 Y107.015 E.03457
G1 X142.78 Y107.231 E.0085
G1 X143.597 Y107.231 E.0322
G1 X143.657 Y107.291 E.00336
G1 X143.657 Y107.015 E.01087
G1 X144.009 Y107.015 E.01388
G1 X144.009 Y109.892 E.1134
G1 X143.912 Y109.892 E.00382
G1 X143.912 Y107.546 E.09247
G1 X143.79 Y107.424 E.0068
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.0666666
; WIPE_START
G1 F24000
G1 X143.912 Y107.546 E-.06553
G1 X143.912 Y109.374 E-.69447
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 120/135
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
G3 Z15.333 I-.842 J-.878 P1  F30000
G1 X120.73 Y131.602 Z15.333
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F6834
G1 X139.27 Y131.602 E.61501
G1 X139.27 Y132.398 E.0264
G1 X120.73 Y132.398 E.61501
G1 X120.73 Y131.662 E.02441
G1 X120.353 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6834
G1 X139.647 Y131.21 E.59286
G1 F3000
G1 X139.662 Y131.21 E.00046
G1 X139.662 Y132.79 E.04855
G1 X139.647 Y132.79 E.00046
G1 F6834
G1 X139.565 Y132.79 E.00252
G1 X120.353 Y132.79 E.59034
G1 F3000
G1 X120.338 Y132.79 E.00046
G1 X120.338 Y131.255 E.04717
M204 S10000
G1 X120.933 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6834
G1 X139.067 Y132 E.57445
; WIPE_START
G1 F24000
G1 X137.067 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I.085 J1.214 P1  F30000
G1 X142.73 Y131.602 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6834
G1 X143.148 Y131.602 E.01387
G1 X143.148 Y132.398 E.0264
G1 X142.73 Y132.398 E.01387
G1 X142.73 Y131.662 E.02441
G1 X142.435 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6834
G1 X143.54 Y131.21 E.03396
G1 X143.54 Y132.79 E.04855
G1 X142.353 Y132.79 E.03648
G1 F3000
G1 X142.338 Y132.79 E.00046
G1 X142.338 Y131.21 E.04855
G1 X142.353 Y131.21 E.00046
G1 F6834
G1 X142.375 Y131.21 E.00068
M204 S10000
; WIPE_START
G1 F24000
G1 X143.54 Y131.21 E-.44275
G1 X143.54 Y132.045 E-.31725
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I1.212 J-.109 P1  F30000
G1 X142.851 Y124.398 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6834
G1 X142.851 Y123.602 E.0264
G1 X143.148 Y123.602 E.00987
G1 X143.148 Y124.398 E.0264
G1 X142.911 Y124.398 E.00788
G1 X142.467 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X142.467 Y123.21 E.04855
G1 F6834
G1 X142.549 Y123.21 E.00252
G1 X143.54 Y123.21 E.03045
G1 X143.54 Y124.79 E.04855
G1 X142.527 Y124.79 E.03112
M204 S10000
; WIPE_START
G1 F24000
G1 X142.467 Y123.21 E-.60083
G1 X142.549 Y123.21 E-.03116
G1 X142.886 Y123.21 E-.12801
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-.066 J-1.215 P1  F30000
G1 X120.851 Y124.398 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6834
G1 X120.851 Y123.602 E.0264
G1 X139.149 Y123.602 E.60701
G1 X139.149 Y124.398 E.0264
G1 X120.911 Y124.398 E.60502
G1 X120.467 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X120.467 Y123.21 E.04855
G1 F6834
G1 X139.533 Y123.21 E.58583
G1 F3000
G1 X139.533 Y124.79 E.04855
G1 F6834
G1 X139.451 Y124.79 E.00252
G1 X120.527 Y124.79 E.58147
M204 S10000
G1 X121.054 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6834
G1 X138.946 Y124 E.5668
; WIPE_START
G1 F24000
G1 X136.946 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-.024 J-1.217 P1  F30000
G1 X117.149 Y124.398 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6834
G1 X116.852 Y124.398 E.00987
G1 X116.852 Y123.602 E.0264
G1 X117.149 Y123.602 E.00987
G1 X117.149 Y124.338 E.02441
G1 X117.451 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6834
G1 X116.46 Y124.79 E.03045
G1 X116.46 Y123.21 E.04855
G1 X117.533 Y123.21 E.03297
G1 F3000
G1 X117.533 Y124.79 E.04855
G1 F6834
G1 X117.511 Y124.79 E.00068
M204 S10000
; WIPE_START
G1 F24000
G1 X116.46 Y124.79 E-.39932
G1 X116.46 Y123.841 E-.36068
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-1.21 J.126 P1  F30000
G1 X117.27 Y131.602 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6834
G1 X117.27 Y132.398 E.0264
G1 X116.852 Y132.398 E.01387
G1 X116.852 Y131.602 E.0264
G1 X117.21 Y131.602 E.01188
G1 X117.647 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X117.662 Y131.21 E.00046
G1 X117.662 Y132.79 E.04855
G1 X117.647 Y132.79 E.00046
G1 F6834
G1 X117.565 Y132.79 E.00252
G1 X116.46 Y132.79 E.03396
G1 X116.46 Y131.21 E.04855
G1 X117.587 Y131.21 E.03463
M204 S10000
; WIPE_START
G1 F24000
G1 X117.662 Y131.21 E-.02852
G1 X117.662 Y132.79 E-.6004
G1 X117.647 Y132.79 E-.00572
G1 X117.565 Y132.79 E-.03116
G1 X117.317 Y132.79 E-.0942
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I1.197 J.221 P1  F30000
G1 X120.353 Y116.371 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6834
G1 X138.894 Y116.371 E.61501
G1 X138.894 Y117.167 E.0264
G1 X120.353 Y117.167 E.61501
G1 X120.353 Y116.431 E.02441
G1 X119.976 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6834
G1 X139.271 Y115.979 E.59286
G1 F3000
G1 X139.286 Y115.979 E.00046
G1 X139.286 Y117.559 E.04855
G1 X139.271 Y117.559 E.00046
G1 F6834
G1 X139.189 Y117.559 E.00252
G1 X119.976 Y117.559 E.59034
G1 F3000
G1 X119.961 Y117.559 E.00046
G1 X119.961 Y116.024 E.04717
M204 S10000
G1 X120.557 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6834
G1 X138.69 Y116.769 E.57445
; WIPE_START
G1 F24000
G1 X136.69 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I.085 J1.214 P1  F30000
G1 X142.353 Y116.371 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6834
G1 X142.771 Y116.371 E.01387
G1 X142.771 Y117.167 E.0264
G1 X142.353 Y117.167 E.01387
G1 X142.353 Y116.431 E.02441
G1 X142.058 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6834
G1 X143.163 Y115.979 E.03396
G1 X143.163 Y117.559 E.04855
G1 X141.976 Y117.559 E.03648
G1 F3000
G1 X141.961 Y117.559 E.00046
G1 X141.961 Y115.979 E.04855
G1 X141.976 Y115.979 E.00046
G1 F6834
G1 X141.998 Y115.979 E.00068
M204 S10000
; WIPE_START
G1 F24000
G1 X143.163 Y115.979 E-.44275
G1 X143.163 Y116.814 E-.31725
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I1.212 J-.109 P1  F30000
G1 X142.474 Y109.167 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6834
G1 X142.474 Y108.371 E.0264
G1 X142.771 Y108.371 E.00987
G1 X142.771 Y109.167 E.0264
G1 X142.534 Y109.167 E.00788
G1 X142.091 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X142.091 Y107.979 E.04855
G1 F6834
G1 X142.173 Y107.979 E.00252
G1 X143.163 Y107.979 E.03045
G1 X143.163 Y109.559 E.04855
G1 X142.151 Y109.559 E.03112
M204 S10000
; WIPE_START
G1 F24000
G1 X142.091 Y107.979 E-.60083
G1 X142.173 Y107.979 E-.03116
G1 X142.509 Y107.979 E-.12801
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-.066 J-1.215 P1  F30000
G1 X120.474 Y109.167 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6834
G1 X120.474 Y108.371 E.0264
G1 X138.773 Y108.371 E.60701
G1 X138.773 Y109.167 E.0264
G1 X120.534 Y109.167 E.60502
G1 X120.091 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X120.091 Y107.979 E.04855
G1 F6834
G1 X139.156 Y107.979 E.58583
G1 F3000
G1 X139.156 Y109.559 E.04855
G1 F6834
G1 X139.074 Y109.559 E.00252
G1 X120.151 Y109.559 E.58147
M204 S10000
G1 X120.677 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6834
G1 X138.569 Y108.769 E.5668
; WIPE_START
G1 F24000
G1 X136.569 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-.024 J-1.217 P1  F30000
G1 X116.773 Y109.167 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6834
G1 X116.476 Y109.167 E.00987
G1 X116.476 Y108.371 E.0264
G1 X116.773 Y108.371 E.00987
G1 X116.773 Y109.107 E.02441
G1 X117.074 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6834
G1 X116.083 Y109.559 E.03045
G1 X116.083 Y107.979 E.04855
G1 X117.156 Y107.979 E.03297
G1 F3000
G1 X117.156 Y109.559 E.04855
G1 F6834
G1 X117.134 Y109.559 E.00068
M204 S10000
; WIPE_START
G1 F24000
G1 X116.083 Y109.559 E-.39932
G1 X116.083 Y108.61 E-.36068
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-1.21 J.126 P1  F30000
G1 X116.894 Y116.371 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6834
G1 X116.894 Y117.167 E.0264
G1 X116.476 Y117.167 E.01387
G1 X116.476 Y116.371 E.0264
G1 X116.834 Y116.371 E.01188
G1 X117.271 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X117.286 Y115.979 E.00046
G1 X117.286 Y117.559 E.04855
G1 X117.271 Y117.559 E.00046
G1 F6834
G1 X117.189 Y117.559 E.00252
G1 X116.083 Y117.559 E.03396
G1 X116.083 Y115.979 E.04855
G1 X117.211 Y115.979 E.03463
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X117.286 Y115.979 E-.02852
G1 X117.286 Y117.559 E-.6004
G1 X117.271 Y117.559 E-.00572
G1 X117.189 Y117.559 E-.03116
G1 X116.941 Y117.559 E-.0942
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 121/135
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
G3 Z15.4 I-.943 J.769 P1  F30000
G1 X120.939 Y122.461 Z15.4
G1 Z15.2
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.266667
G1 F7000
G1 X121.369 Y122.461 E.01695
G1 X121.369 Y122.246 E.0085
M73 P85 R3
G1 X115.615 Y122.246 E.2268
G1 X115.615 Y125.123 E.1134
G1 X115.711 Y125.123 E.00382
G1 X115.711 Y125.223 E.00395
G1 X116.027 Y125.539 E.01758
G1 X118.144 Y125.539 E.08346
G1 X118.554 Y125.123 E.02302
G1 X119.446 Y125.123 E.03512
G1 X119.856 Y125.539 E.02302
G1 X144.385 Y125.5 E.96685
G1 X144.385 Y128 E.09854
G1 X115.615 Y128 E1.13401
G1 X115.615 Y130.877 E.1134
G1 X115.711 Y130.877 E.00382
G1 X115.711 Y130.777 E.00395
G1 X116.027 Y130.461 E.01758
G1 X118.294 Y130.461 E.08936
G2 X118.54 Y130.611 I.198 J-.048 E.01263
G1 X118.768 Y130.877 E.01379
G1 X119.232 Y130.839 E.01834
G3 X119.706 Y130.461 I4.717 J5.436 E.0239
G1 X140.294 Y130.461 E.81148
G2 X140.54 Y130.611 I.198 J-.048 E.01263
G1 X140.768 Y130.877 E.01379
G1 X141.232 Y130.839 E.01834
G3 X141.706 Y130.461 I4.717 J5.436 E.0239
G1 X143.973 Y130.461 E.08936
G1 X144.289 Y130.777 E.01758
G1 X144.289 Y130.877 E.00395
G1 X144.385 Y130.877 E.00382
; WIPE_START
G1 F24000
G1 X144.289 Y130.877 E-.03681
G1 X144.289 Y130.777 E-.03806
G1 X143.973 Y130.461 E-.16953
G1 X142.616 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I1.194 J.237 P1  F30000
G1 X144.167 Y122.655 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X144.289 Y122.777 E.0068
G1 X144.289 Y125.123 E.09247
G1 X144.385 Y125.123 E.00382
G1 X144.385 Y122.246 E.1134
G1 X144.033 Y122.246 E.01388
G1 X144.033 Y122.522 E.01087
G1 X143.973 Y122.461 E.00336
G1 X143.156 Y122.461 E.0322
G1 X143.156 Y122.246 E.0085
G1 X142.279 Y122.246 E.03457
G1 X142.279 Y122.461 E.0085
G2 X141.613 Y122.671 I-.174 J.609 E.02915
G1 X142.091 Y122.246 F30000
G1 F4800
G1 X141.402 Y122.246 E.02714
G1 X141.402 Y125.123 E.1134
G1 X140.554 Y125.123 E.03341
G1 X140.525 Y122.246 E.11341
G1 X139.648 Y122.246 E.03457
G1 X139.648 Y122.461 E.0085
G1 X138.771 Y122.461 E.03457
G1 X138.771 Y122.246 E.0085
; WIPE_START
G1 F24000
G1 X138.771 Y122.461 E-.08194
G1 X139.648 Y122.461 E-.33329
G1 X139.648 Y122.246 E-.08194
G1 X140.34 Y122.246 E-.26282
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-.52 J-1.1 P1  F30000
G1 X120.531 Y131.602 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F7000
G1 X139.469 Y131.602 E.6282
G1 X139.469 Y132.398 E.0264
G1 X120.531 Y132.398 E.6282
G1 X120.531 Y131.662 E.02441
G1 X120.215 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7000
G1 X139.785 Y131.21 E.60134
G1 F3000
G1 X139.861 Y131.21 E.00233
G1 X139.861 Y132.79 E.04855
G1 X139.785 Y132.79 E.00233
G1 F7000
G1 X139.703 Y132.79 E.00252
G1 X120.215 Y132.79 E.59882
G1 F3000
G1 X120.139 Y132.79 E.00233
G1 X120.139 Y131.21 E.04855
G1 X120.155 Y131.21 E.00048
M204 S10000
G1 X120.735 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F7000
G1 X139.265 Y132 E.58704
; WIPE_START
G1 F24000
G1 X137.265 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I.092 J1.214 P1  F30000
G1 X142.531 Y131.602 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7000
G1 X143.148 Y131.602 E.02046
G1 X143.148 Y132.398 E.0264
G1 X142.531 Y132.398 E.02046
G1 X142.531 Y131.662 E.02441
G1 X142.297 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7000
G1 X143.54 Y131.21 E.0382
G1 X143.54 Y132.79 E.04855
G1 X142.215 Y132.79 E.04072
G1 F3000
G1 X142.139 Y132.79 E.00233
G1 X142.139 Y131.21 E.04855
G1 X142.215 Y131.21 E.00233
G1 F7000
G1 X142.237 Y131.21 E.00068
M204 S10000
; WIPE_START
G1 F24000
G1 X143.54 Y131.21 E-.49521
G1 X143.54 Y131.907 E-.26479
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I1.209 J-.138 P1  F30000
G1 X142.681 Y124.398 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7000
G1 X142.681 Y123.602 E.0264
G1 X143.148 Y123.602 E.01549
G1 X143.148 Y124.398 E.0264
G1 X142.741 Y124.398 E.0135
G1 X142.335 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X142.289 Y124.79 E.00143
G1 X142.289 Y123.21 E.04855
G1 X142.335 Y123.21 E.00143
G1 F7000
G1 X142.417 Y123.21 E.00252
G1 X143.54 Y123.21 E.03449
G1 X143.54 Y124.79 E.04855
G1 X142.395 Y124.79 E.03517
M204 S10000
G1 X142.914 Y124.194 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102944
G1 F7000
G1 X142.914 Y123.806 E.0019
; WIPE_START
G1 F24000
G1 X142.914 Y124.194 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-.011 J-1.217 P1  F30000
G1 X120.681 Y124.398 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7000
G1 X120.681 Y123.602 E.0264
G1 X139.319 Y123.602 E.61827
G1 X139.319 Y124.398 E.0264
G1 X120.741 Y124.398 E.61628
G1 X120.335 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X120.289 Y124.79 E.00143
G1 X120.289 Y123.21 E.04855
G1 X120.335 Y123.21 E.00143
G1 F7000
G1 X139.665 Y123.21 E.59393
G1 F3000
G1 X139.711 Y123.21 E.00143
G1 X139.711 Y124.79 E.04855
G1 X139.665 Y124.79 E.00143
G1 F7000
G1 X139.583 Y124.79 E.00252
G1 X120.395 Y124.79 E.58957
M204 S10000
G1 X120.884 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F7000
G1 X139.116 Y124 E.57756
; WIPE_START
G1 F24000
G1 X137.116 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-.024 J-1.217 P1  F30000
G1 X117.319 Y124.398 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7000
G1 X116.852 Y124.398 E.01549
G1 X116.852 Y123.602 E.0264
G1 X117.319 Y123.602 E.01549
G1 X117.319 Y124.338 E.02441
G1 X117.583 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7000
G1 X116.46 Y124.79 E.03449
G1 X116.46 Y123.21 E.04855
G1 X117.665 Y123.21 E.03701
G1 F3000
G1 X117.711 Y123.21 E.00143
G1 X117.711 Y124.79 E.04855
G1 X117.665 Y124.79 E.00143
G1 F7000
G1 X117.643 Y124.79 E.00068
M204 S10000
G1 X117.086 Y124.194 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102944
G1 F7000
G1 X117.086 Y123.806 E.0019
; WIPE_START
G1 F24000
G1 X117.086 Y124.194 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-1.215 J.063 P1  F30000
G1 X117.469 Y131.602 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7000
G1 X117.469 Y132.398 E.0264
G1 X116.852 Y132.398 E.02046
G1 X116.852 Y131.602 E.0264
G1 X117.409 Y131.602 E.01847
G1 X117.785 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X117.861 Y131.21 E.00233
G1 X117.861 Y132.79 E.04855
G1 X117.785 Y132.79 E.00233
G1 F7000
G1 X117.703 Y132.79 E.00252
G1 X116.46 Y132.79 E.0382
G1 X116.46 Y131.21 E.04855
G1 X117.725 Y131.21 E.03888
M204 S10000
; WIPE_START
G1 F24000
G1 X117.861 Y131.21 E-.05159
G1 X117.861 Y132.79 E-.6004
G1 X117.785 Y132.79 E-.02879
G1 X117.703 Y132.79 E-.03116
G1 X117.577 Y132.79 E-.04805
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I1.209 J.141 P1  F30000
G1 X120.562 Y107.231 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.266667
G1 F7000
G1 X120.992 Y107.231 E.01695
G1 X120.992 Y107.015 E.0085
G1 X115.238 Y107.015 E.2268
G1 X115.238 Y109.892 E.1134
G1 X115.335 Y109.892 E.00382
G1 X115.335 Y109.992 E.00395
G1 X115.65 Y110.308 E.01758
G1 X117.768 Y110.308 E.08346
G1 X118.178 Y109.892 E.02302
G1 X119.069 Y109.892 E.03512
G1 X119.479 Y110.308 E.02302
G1 X144.009 Y110.269 E.96685
G1 X144.009 Y112.769 E.09854
G1 X115.238 Y112.769 E1.13401
G1 X115.238 Y115.646 E.1134
G1 X115.335 Y115.646 E.00382
G1 X115.335 Y115.546 E.00395
G1 X115.65 Y115.231 E.01758
G1 X117.917 Y115.231 E.08936
G2 X118.164 Y115.381 I.198 J-.048 E.01263
G1 X118.392 Y115.646 E.01379
G1 X118.855 Y115.608 E.01834
G3 X119.329 Y115.231 I4.717 J5.436 E.0239
G1 X139.917 Y115.231 E.81148
G2 X140.164 Y115.381 I.198 J-.048 E.01263
G1 X140.392 Y115.646 E.01379
G1 X140.855 Y115.608 E.01834
G3 X141.329 Y115.231 I4.717 J5.436 E.0239
G1 X143.597 Y115.231 E.08936
G1 X143.912 Y115.546 E.01758
G1 X143.912 Y115.646 E.00395
G1 X144.009 Y115.646 E.00382
; WIPE_START
G1 F24000
G1 X143.912 Y115.646 E-.03681
G1 X143.912 Y115.546 E-.03806
G1 X143.597 Y115.231 E-.16953
G1 X142.24 Y115.231 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I1.194 J.237 P1  F30000
G1 X143.79 Y107.424 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G1 X143.912 Y107.546 E.0068
G1 X143.912 Y109.892 E.09247
G1 X144.009 Y109.892 E.00382
G1 X144.009 Y107.015 E.1134
G1 X143.657 Y107.015 E.01388
G1 X143.657 Y107.291 E.01087
G1 X143.597 Y107.231 E.00336
G1 X142.78 Y107.231 E.0322
G1 X142.78 Y107.015 E.0085
G1 X141.903 Y107.015 E.03457
G1 X141.903 Y107.231 E.0085
G2 X141.237 Y107.441 I-.174 J.609 E.02915
G1 X141.714 Y107.015 F30000
G1 F4800
G1 X141.025 Y107.015 E.02714
G1 X141.025 Y109.892 E.1134
G1 X140.178 Y109.892 E.03341
G1 X140.148 Y107.015 E.11341
G1 X139.271 Y107.015 E.03457
G1 X139.271 Y107.231 E.0085
G1 X138.394 Y107.231 E.03457
G1 X138.394 Y107.015 E.0085
; WIPE_START
G1 F24000
G1 X138.394 Y107.231 E-.08194
G1 X139.271 Y107.231 E-.33329
G1 X139.271 Y107.015 E-.08194
G1 X139.963 Y107.015 E-.26282
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-.52 J-1.1 P1  F30000
G1 X120.155 Y116.371 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F7000
G1 X139.092 Y116.371 E.6282
G1 X139.092 Y117.167 E.0264
G1 X120.155 Y117.167 E.6282
G1 X120.155 Y116.431 E.02441
G1 X119.838 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7000
G1 X139.409 Y115.979 E.60134
G1 F3000
G1 X139.484 Y115.979 E.00233
G1 X139.484 Y117.559 E.04855
G1 X139.409 Y117.559 E.00233
G1 F7000
G1 X139.327 Y117.559 E.00252
G1 X119.838 Y117.559 E.59882
G1 F3000
G1 X119.762 Y117.559 E.00233
G1 X119.762 Y115.979 E.04855
G1 X119.778 Y115.979 E.00048
M204 S10000
G1 X120.358 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F7000
G1 X138.889 Y116.769 E.58704
; WIPE_START
G1 F24000
G1 X136.889 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I.092 J1.214 P1  F30000
G1 X142.155 Y116.371 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7000
G1 X142.771 Y116.371 E.02046
G1 X142.771 Y117.167 E.0264
G1 X142.155 Y117.167 E.02046
G1 X142.155 Y116.431 E.02441
G1 X141.92 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7000
G1 X143.163 Y115.979 E.0382
G1 X143.163 Y117.559 E.04855
G1 X141.838 Y117.559 E.04072
G1 F3000
G1 X141.762 Y117.559 E.00233
G1 X141.762 Y115.979 E.04855
G1 X141.838 Y115.979 E.00233
G1 F7000
G1 X141.86 Y115.979 E.00068
M204 S10000
; WIPE_START
G1 F24000
G1 X143.163 Y115.979 E-.49521
G1 X143.163 Y116.676 E-.26479
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I1.209 J-.138 P1  F30000
G1 X142.304 Y109.167 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7000
G1 X142.304 Y108.371 E.0264
G1 X142.771 Y108.371 E.01549
G1 X142.771 Y109.167 E.0264
G1 X142.364 Y109.167 E.0135
G1 X141.959 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X141.912 Y109.559 E.00143
G1 X141.912 Y107.979 E.04855
G1 X141.959 Y107.979 E.00143
G1 F7000
G1 X142.041 Y107.979 E.00252
G1 X143.163 Y107.979 E.03449
G1 X143.163 Y109.559 E.04855
G1 X142.019 Y109.559 E.03517
M204 S10000
G1 X142.538 Y108.964 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102944
G1 F7000
G1 X142.538 Y108.575 E.0019
; WIPE_START
G1 F24000
G1 X142.538 Y108.964 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-.011 J-1.217 P1  F30000
G1 X120.304 Y109.167 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7000
G1 X120.304 Y108.371 E.0264
G1 X138.943 Y108.371 E.61827
G1 X138.943 Y109.167 E.0264
G1 X120.364 Y109.167 E.61628
G1 X119.959 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X119.912 Y109.559 E.00143
G1 X119.912 Y107.979 E.04855
G1 X119.959 Y107.979 E.00143
G1 F7000
G1 X139.288 Y107.979 E.59393
G1 F3000
G1 X139.335 Y107.979 E.00143
G1 X139.335 Y109.559 E.04855
G1 X139.288 Y109.559 E.00143
G1 F7000
G1 X139.206 Y109.559 E.00252
G1 X120.019 Y109.559 E.58957
M204 S10000
G1 X120.508 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F7000
G1 X138.739 Y108.769 E.57756
; WIPE_START
G1 F24000
G1 X136.739 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-.024 J-1.217 P1  F30000
G1 X116.943 Y109.167 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7000
G1 X116.476 Y109.167 E.01549
G1 X116.476 Y108.371 E.0264
G1 X116.943 Y108.371 E.01549
G1 X116.943 Y109.107 E.02441
G1 X117.206 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7000
G1 X116.083 Y109.559 E.03449
G1 X116.083 Y107.979 E.04855
G1 X117.288 Y107.979 E.03701
G1 F3000
G1 X117.335 Y107.979 E.00143
G1 X117.335 Y109.559 E.04855
G1 X117.288 Y109.559 E.00143
G1 F7000
G1 X117.266 Y109.559 E.00068
M204 S10000
G1 X116.709 Y108.964 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102944
G1 F7000
G1 X116.709 Y108.575 E.0019
; WIPE_START
G1 F24000
G1 X116.709 Y108.964 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-1.215 J.063 P1  F30000
G1 X117.092 Y116.371 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7000
G1 X117.092 Y117.167 E.0264
G1 X116.476 Y117.167 E.02046
G1 X116.476 Y116.371 E.0264
G1 X117.032 Y116.371 E.01847
G1 X117.409 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X117.484 Y115.979 E.00233
G1 X117.484 Y117.559 E.04855
G1 X117.409 Y117.559 E.00233
G1 F7000
G1 X117.327 Y117.559 E.00252
G1 X116.083 Y117.559 E.0382
G1 X116.083 Y115.979 E.04855
G1 X117.349 Y115.979 E.03888
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X117.484 Y115.979 E-.05159
G1 X117.484 Y117.559 E-.6004
G1 X117.409 Y117.559 E-.02879
G1 X117.327 Y117.559 E-.03116
G1 X117.2 Y117.559 E-.04805
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 122/135
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
G3 Z15.6 I-.968 J.738 P1  F30000
G1 X120.939 Y122.461 Z15.6
G1 Z15.4
G1 E.8 F1800
; FEATURE: Support
G1 F8326
G1 X121.369 Y122.461 E.01321
G1 X121.369 Y122.246 E.00663
G1 X115.615 Y122.246 E.17681
G1 X115.615 Y125.123 E.0884
G1 X115.711 Y125.123 E.00298
G1 X115.711 Y125.223 E.00308
G1 X116.027 Y125.539 E.01371
G1 X118.389 Y125.539 E.07258
G1 X118.539 Y125.389 E.00652
G2 X119 Y125.206 I.139 J-.322 E.01693
G1 X119.183 Y125.389 E.00795
G3 X119.611 Y125.539 I.139 J.289 E.01548
G1 X143.973 Y125.539 E.74858
G1 X144.289 Y125.223 E.01371
G1 X144.289 Y125.123 E.00308
G1 X144.385 Y125.123 E.00298
G1 X144.385 Y122.246 E.0884
G1 X141.885 Y122.246 E.07682
G1 X141.402 Y122.246 F30000
; FEATURE: Support interface
G1 F4800
G1 X141.402 Y122.611 E.01124
G2 X141 Y122.794 I-.11 J.292 E.01507
G2 X140.525 Y122.597 I-.455 J.426 E.01629
G1 X140.525 Y122.246 E.0108
G1 X139.648 Y122.246 E.02695
G1 X139.648 Y122.461 E.00663
G1 X138.771 Y122.461 E.02695
G1 X138.771 Y122.246 E.00663
; WIPE_START
G1 F24000
G1 X138.771 Y122.461 E-.08194
G1 X139.648 Y122.461 E-.33329
G1 X139.648 Y122.246 E-.08194
G1 X140.34 Y122.246 E-.26282
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-.15 J-1.208 P1  F30000
G1 X115.615 Y125.311 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Support
G1 F8326
G1 X115.615 Y128 E.08261
G1 X144.385 Y128 E.88405
G1 X144.385 Y130.877 E.0884
G1 X144.289 Y130.877 E.00298
G1 X144.289 Y130.777 E.00308
G1 X143.973 Y130.461 E.01371
G1 X141.397 Y130.461 E.07914
G1 X141.247 Y130.611 E.00652
G1 X140.753 Y130.611 E.0152
G1 X140.603 Y130.461 E.00652
G1 X119.397 Y130.461 E.65158
G1 X119.247 Y130.611 E.00652
G1 X118.753 Y130.611 E.0152
G1 X118.603 Y130.461 E.00652
G1 X116.027 Y130.461 E.07914
G1 X115.711 Y130.777 E.01371
G1 X115.711 Y130.877 E.00308
G1 X115.615 Y130.877 E.00298
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.777 E-.03806
G1 X116.027 Y130.461 E-.16953
G1 X117.384 Y130.461 E-.5156
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-.454 J1.129 P1  F30000
G1 X120.223 Y131.602 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8326
G1 X139.777 Y131.602 E.64867
G1 X139.777 Y132.398 E.0264
G1 X120.223 Y132.398 E.64867
G1 X120.223 Y131.662 E.02441
G1 X120.098 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8326
G1 X139.902 Y131.21 E.60852
G1 X140.148 Y131.21 E.00756
M106 S255
G1 F600
G1 X140.17 Y131.21 E.00066
G1 X140.17 Y132.79 E.04855
G1 X140.148 Y132.79 E.00066
M106 S252.45
G1 F8326
G1 X139.902 Y132.79 E.00756
G1 X120.098 Y132.79 E.60852
G1 X119.852 Y132.79 E.00756
M106 S255
G1 F600
G1 X119.83 Y132.79 E.00066
G1 X119.83 Y131.21 E.04855
G1 X119.852 Y131.21 E.00066
M106 S252.45
G1 F8326
G1 X120.038 Y131.21 E.00572
M204 S10000
G1 X120.426 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F8326
G1 X139.574 Y132 E.60659
; WIPE_START
M73 P86 R3
G1 F24000
G1 X137.574 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I.104 J1.213 P1  F30000
G1 X142.223 Y131.602 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8326
G1 X143.148 Y131.602 E.0307
G1 X143.148 Y132.398 E.0264
G1 X142.223 Y132.398 E.0307
G1 X142.223 Y131.662 E.02441
G1 X142.098 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8326
G1 X143.54 Y131.21 E.04431
G1 X143.54 Y132.79 E.04855
G1 X142.098 Y132.79 E.04431
G1 X141.852 Y132.79 E.00756
M106 S255
G1 F600
G1 X141.83 Y132.79 E.00066
G1 X141.83 Y131.21 E.04855
G1 X141.852 Y131.21 E.00066
M106 S252.45
G1 F8326
G1 X142.038 Y131.21 E.00572
M204 S10000
; WIPE_START
G1 F24000
G1 X143.54 Y131.21 E-.57075
G1 X143.54 Y131.708 E-.18925
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I1.206 J-.164 P1  F30000
G1 X142.436 Y123.602 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8326
G1 X143.148 Y123.602 E.02361
G1 X143.148 Y124.398 E.0264
G1 X142.436 Y124.398 E.02361
G1 X142.436 Y123.662 E.02441
G1 X142.248 Y123.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8326
G1 X143.54 Y123.21 E.03971
G1 X143.54 Y124.79 E.04855
G1 X142.084 Y124.79 E.04475
M106 S255
G1 F1800
G1 X142.044 Y124.79 E.00122
G1 X142.044 Y123.21 E.04855
G1 X142.084 Y123.21 E.00122
M106 S252.45
G1 F8326
G1 X142.188 Y123.21 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X143.54 Y123.21 E-.51386
G1 X143.54 Y123.858 E-.24614
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-.164 J-1.206 P1  F30000
G1 X139.564 Y124.398 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8326
G1 X120.436 Y124.398 E.6345
G1 X120.436 Y123.602 E.0264
G1 X139.564 Y123.602 E.6345
G1 X139.564 Y124.338 E.02441
G1 X139.752 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8326
G1 X120.084 Y124.79 E.60436
M106 S255
G1 F1800
G1 X120.044 Y124.79 E.00122
G1 X120.044 Y123.21 E.04855
G1 X120.084 Y123.21 E.00122
M106 S252.45
G1 F8326
G1 X139.916 Y123.21 E.6094
M106 S255
G1 F1800
G1 X139.956 Y123.21 E.00122
G1 X139.956 Y124.79 E.04855
G1 X139.916 Y124.79 E.00122
M106 S252.45
G1 F8326
G1 X139.812 Y124.79 E.0032
M204 S10000
G1 X139.36 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F8326
G1 X120.64 Y124 E.59306
; WIPE_START
G1 F24000
G1 X122.64 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-.095 J-1.213 P1  F30000
G1 X117.564 Y124.398 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8326
G1 X116.852 Y124.398 E.02361
G1 X116.852 Y123.602 E.0264
G1 X117.564 Y123.602 E.02361
G1 X117.564 Y124.338 E.02441
G1 X117.752 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8326
G1 X116.46 Y124.79 E.03971
G1 X116.46 Y123.21 E.04855
G1 X117.916 Y123.21 E.04475
M106 S255
G1 F1800
G1 X117.956 Y123.21 E.00122
G1 X117.956 Y124.79 E.04855
G1 X117.916 Y124.79 E.00122
M106 S252.45
G1 F8326
G1 X117.812 Y124.79 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X116.46 Y124.79 E-.51386
G1 X116.46 Y124.142 E-.24614
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-1.198 J.212 P1  F30000
G1 X117.777 Y131.602 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8326
G1 X117.777 Y132.398 E.0264
G1 X116.852 Y132.398 E.0307
G1 X116.852 Y131.602 E.0264
G1 X117.717 Y131.602 E.02871
G1 X117.902 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8326
G1 X118.148 Y131.21 E.00756
M106 S255
G1 F600
G1 X118.17 Y131.21 E.00066
G1 X118.17 Y132.79 E.04855
G1 X118.148 Y132.79 E.00066
M106 S252.45
G1 F8326
G1 X117.902 Y132.79 E.00756
G1 X116.46 Y132.79 E.04431
G1 X116.46 Y131.21 E.04855
G1 X117.842 Y131.21 E.04246
M204 S10000
; WIPE_START
G1 F24000
G1 X118.148 Y131.21 E-.11628
G1 X118.17 Y131.21 E-.0082
G1 X118.17 Y132.79 E-.6004
G1 X118.148 Y132.79 E-.0082
G1 X118.077 Y132.79 E-.02691
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I1.201 J-.199 P1  F30000
G1 X115.238 Y115.646 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Support
G1 F8326
G1 X115.335 Y115.646 E.00298
G1 X115.335 Y115.546 E.00308
G1 X115.65 Y115.231 E.01371
G1 X118.226 Y115.231 E.07914
G1 X118.376 Y115.381 E.00652
G1 X118.871 Y115.381 E.0152
G1 X119.021 Y115.231 E.00652
G1 X140.226 Y115.231 E.65158
G1 X140.376 Y115.381 E.00652
G1 X140.871 Y115.381 E.0152
G1 X141.021 Y115.231 E.00652
G1 X143.597 Y115.231 E.07914
G1 X143.912 Y115.546 E.01371
G1 X143.912 Y115.646 E.00308
G1 X144.009 Y115.646 E.00298
G1 X144.009 Y112.769 E.0884
G1 X115.238 Y112.769 E.88405
G1 X115.238 Y110.081 E.08261
; WIPE_START
G1 F24000
G1 X115.238 Y112.081 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I.82 J.9 P1  F30000
G1 X120.562 Y107.231 Z15.8
G1 Z15.4
G1 E.8 F1800
G1 F8326
G1 X120.992 Y107.231 E.01321
G1 X120.992 Y107.015 E.00663
G1 X115.238 Y107.015 E.17681
G1 X115.238 Y109.892 E.0884
G1 X115.335 Y109.892 E.00298
G1 X115.335 Y109.992 E.00308
G1 X115.65 Y110.308 E.01371
G1 X118.012 Y110.308 E.07258
G1 X118.162 Y110.158 E.00652
G2 X118.623 Y109.975 I.139 J-.322 E.01693
G1 X118.806 Y110.158 E.00795
G3 X119.234 Y110.308 I.139 J.289 E.01548
G1 X143.597 Y110.308 E.74858
G1 X143.912 Y109.992 E.01371
G1 X143.912 Y109.892 E.00308
G1 X144.009 Y109.892 E.00298
G1 X144.009 Y107.015 E.0884
G1 X141.509 Y107.015 E.07682
G1 X141.025 Y107.015 F30000
; FEATURE: Support interface
G1 F4800
G1 X141.025 Y107.381 E.01124
G2 X140.623 Y107.564 I-.11 J.292 E.01507
G2 X140.148 Y107.367 I-.455 J.426 E.01629
G1 X140.148 Y107.015 E.0108
G1 X139.271 Y107.015 E.02695
G1 X139.271 Y107.231 E.00663
G1 X138.394 Y107.231 E.02695
G1 X138.394 Y107.015 E.00663
; WIPE_START
G1 F24000
G1 X138.394 Y107.231 E-.08194
G1 X139.271 Y107.231 E-.33329
G1 X139.271 Y107.015 E-.08194
G1 X139.963 Y107.015 E-.26282
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-.513 J-1.103 P1  F30000
G1 X119.846 Y116.371 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8326
G1 X139.401 Y116.371 E.64867
G1 X139.401 Y117.167 E.0264
G1 X119.846 Y117.167 E.64867
G1 X119.846 Y116.431 E.02441
G1 X119.721 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8326
G1 X139.525 Y115.979 E.60852
G1 X139.771 Y115.979 E.00756
M106 S255
G1 F600
G1 X139.793 Y115.979 E.00066
G1 X139.793 Y117.559 E.04855
G1 X139.771 Y117.559 E.00066
M106 S252.45
G1 F8326
G1 X139.525 Y117.559 E.00756
G1 X119.721 Y117.559 E.60852
G1 X119.475 Y117.559 E.00756
M106 S255
G1 F600
G1 X119.454 Y117.559 E.00066
G1 X119.454 Y115.979 E.04855
G1 X119.475 Y115.979 E.00066
M106 S252.45
G1 F8326
G1 X119.661 Y115.979 E.00572
M204 S10000
G1 X120.049 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F8326
G1 X139.197 Y116.769 E.60659
; WIPE_START
G1 F24000
G1 X137.197 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I.104 J1.213 P1  F30000
G1 X141.846 Y116.371 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8326
G1 X142.771 Y116.371 E.0307
G1 X142.771 Y117.167 E.0264
G1 X141.846 Y117.167 E.0307
G1 X141.846 Y116.431 E.02441
G1 X141.721 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8326
G1 X143.163 Y115.979 E.04431
G1 X143.163 Y117.559 E.04855
G1 X141.721 Y117.559 E.04431
G1 X141.475 Y117.559 E.00756
M106 S255
G1 F600
G1 X141.454 Y117.559 E.00066
G1 X141.454 Y115.979 E.04855
G1 X141.475 Y115.979 E.00066
M106 S252.45
G1 F8326
G1 X141.661 Y115.979 E.00572
M204 S10000
; WIPE_START
G1 F24000
G1 X143.163 Y115.979 E-.57075
G1 X143.163 Y116.477 E-.18925
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I1.206 J-.164 P1  F30000
G1 X142.06 Y108.371 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8326
G1 X142.771 Y108.371 E.02361
G1 X142.771 Y109.167 E.0264
G1 X142.06 Y109.167 E.02361
G1 X142.06 Y108.431 E.02441
G1 X141.871 Y107.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8326
G1 X143.163 Y107.979 E.03971
G1 X143.163 Y109.559 E.04855
G1 X141.707 Y109.559 E.04475
M106 S255
G1 F1800
G1 X141.667 Y109.559 E.00122
G1 X141.667 Y107.979 E.04855
G1 X141.707 Y107.979 E.00122
M106 S252.45
G1 F8326
G1 X141.811 Y107.979 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X143.163 Y107.979 E-.51386
G1 X143.163 Y108.627 E-.24614
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-.164 J-1.206 P1  F30000
G1 X139.187 Y109.167 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8326
G1 X120.06 Y109.167 E.6345
G1 X120.06 Y108.371 E.0264
G1 X139.187 Y108.371 E.6345
G1 X139.187 Y109.107 E.02441
G1 X139.376 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8326
G1 X119.707 Y109.559 E.60436
M106 S255
G1 F1800
G1 X119.667 Y109.559 E.00122
G1 X119.667 Y107.979 E.04855
G1 X119.707 Y107.979 E.00122
M106 S252.45
G1 F8326
G1 X139.54 Y107.979 E.6094
M106 S255
G1 F1800
G1 X139.579 Y107.979 E.00122
G1 X139.579 Y109.559 E.04855
G1 X139.54 Y109.559 E.00122
M106 S252.45
G1 F8326
G1 X139.436 Y109.559 E.0032
M204 S10000
G1 X138.984 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F8326
G1 X120.263 Y108.769 E.59306
; WIPE_START
G1 F24000
G1 X122.263 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-.095 J-1.213 P1  F30000
G1 X117.187 Y109.167 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8326
G1 X116.476 Y109.167 E.02361
G1 X116.476 Y108.371 E.0264
G1 X117.187 Y108.371 E.02361
G1 X117.187 Y109.107 E.02441
G1 X117.376 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8326
G1 X116.083 Y109.559 E.03971
G1 X116.083 Y107.979 E.04855
G1 X117.54 Y107.979 E.04475
M106 S255
G1 F1800
G1 X117.579 Y107.979 E.00122
G1 X117.579 Y109.559 E.04855
G1 X117.54 Y109.559 E.00122
M106 S252.45
G1 F8326
G1 X117.436 Y109.559 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X116.083 Y109.559 E-.51386
G1 X116.083 Y108.912 E-.24614
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-1.198 J.212 P1  F30000
G1 X117.401 Y116.371 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8326
G1 X117.401 Y117.167 E.0264
G1 X116.476 Y117.167 E.0307
G1 X116.476 Y116.371 E.0264
G1 X117.341 Y116.371 E.02871
G1 X117.525 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8326
G1 X117.771 Y115.979 E.00756
M106 S255
G1 F600
G1 X117.793 Y115.979 E.00066
G1 X117.793 Y117.559 E.04855
G1 X117.771 Y117.559 E.00066
M106 S252.45
G1 F8326
G1 X117.525 Y117.559 E.00756
G1 X116.083 Y117.559 E.04431
G1 X116.083 Y115.979 E.04855
G1 X117.465 Y115.979 E.04246
M204 S10000
M106 S249.9
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X117.771 Y115.979 E-.11628
G1 X117.793 Y115.979 E-.0082
G1 X117.793 Y117.559 E-.6004
G1 X117.771 Y117.559 E-.0082
G1 X117.701 Y117.559 E-.02691
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 123/135
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
G3 Z15.8 I-1.153 J-.389 P1  F30000
G1 X116.045 Y122.461 Z15.8
G1 Z15.6
G1 E.8 F1800
; FEATURE: Support
G1 F9000
G1 X115.711 Y122.777 E.0141
G1 X115.711 Y124.746 E.0605
G1 X115.615 Y124.746 E.00298
G1 X115.615 Y122.246 E.07682
G1 X121.369 Y122.246 E.17681
G1 X121.369 Y122.461 E.00663
G1 X120.939 Y122.461 E.01321
; WIPE_START
G1 F24000
G1 X121.369 Y122.461 E-.16342
G1 X121.369 Y122.246 E-.08194
G1 X120.014 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-.725 J-.978 P1  F30000
G1 X115.833 Y125.345 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G3 X115.711 Y125.123 I.05 J-.172 E.00865
G1 X115.615 Y125.123 E.00298
G1 X115.615 Y130.877 E.17681
G1 X115.711 Y130.877 E.00298
G1 X115.711 Y130.777 E.00308
G1 X115.967 Y130.522 E.01109
G1 X115.967 Y125.478 E.15497
G1 X116.027 Y125.539 E.00262
G1 X116.844 Y125.539 E.0251
G1 X116.844 Y130.461 E.15127
G1 X117.721 Y130.461 E.02695
G1 X117.721 Y125.539 E.15127
G1 X118.598 Y125.539 E.02695
G1 X118.598 Y130.461 E.15127
G1 X119.475 Y130.461 E.02695
G1 X119.475 Y125.539 E.15127
G1 X120.352 Y125.539 E.02695
G1 X120.352 Y130.461 E.15127
G1 X121.229 Y130.461 E.02695
G1 X121.229 Y125.539 E.15127
G1 X122.106 Y125.539 E.02695
G1 X122.106 Y130.461 E.15127
G1 X122.983 Y130.461 E.02695
G1 X122.983 Y125.539 E.15127
G1 X123.86 Y125.539 E.02695
G1 X123.86 Y130.461 E.15127
G1 X124.738 Y130.461 E.02695
G1 X124.738 Y125.539 E.15127
G1 X125.615 Y125.539 E.02695
G1 X125.615 Y130.461 E.15127
G1 X126.492 Y130.461 E.02695
G1 X126.492 Y125.539 E.15127
G1 X127.369 Y125.539 E.02695
G1 X127.369 Y130.461 E.15127
G1 X128.246 Y130.461 E.02695
G1 X128.246 Y125.539 E.15127
G1 X129.123 Y125.539 E.02695
G1 X129.123 Y130.461 E.15127
G1 X130 Y130.461 E.02695
G1 X130 Y125.539 E.15127
G1 X130.877 Y125.539 E.02695
G1 X130.877 Y130.461 E.15127
G1 X131.754 Y130.461 E.02695
G1 X131.754 Y125.539 E.15127
G1 X132.631 Y125.539 E.02695
G1 X132.631 Y130.461 E.15127
G1 X133.508 Y130.461 E.02695
G1 X133.508 Y125.539 E.15127
G1 X134.385 Y125.539 E.02695
G1 X134.385 Y130.461 E.15127
G1 X135.262 Y130.461 E.02695
G1 X135.262 Y125.539 E.15127
G1 X136.14 Y125.539 E.02695
G1 X136.14 Y130.461 E.15127
G1 X137.017 Y130.461 E.02695
G1 X137.017 Y125.539 E.15127
G1 X137.894 Y125.539 E.02695
G1 X137.894 Y130.461 E.15127
G1 X138.771 Y130.461 E.02695
G1 X138.771 Y125.539 E.15127
G1 X139.648 Y125.539 E.02695
G1 X139.648 Y130.461 E.15127
G1 X140.525 Y130.461 E.02695
G1 X140.525 Y125.539 E.15127
G1 X141.199 Y125.539 E.02071
G1 X141.402 Y125.539 E.00624
G1 X141.402 Y130.461 E.15127
G1 X142.279 Y130.461 E.02695
G1 X142.279 Y125.539 E.15127
G1 X143.156 Y125.539 E.02695
G1 X143.156 Y130.461 E.15127
G1 X143.973 Y130.461 E.0251
G1 X144.033 Y130.522 E.00262
G1 X144.033 Y125.478 E.15497
G1 X144.289 Y125.223 E.01109
G1 X144.289 Y125.123 E.00308
G1 X144.385 Y125.123 E.00298
G1 X144.385 Y130.877 E.17681
G1 X144.289 Y130.877 E.00298
G2 X144.167 Y130.655 I-.172 J-.05 E.00865
; WIPE_START
G1 F24000
G1 X144.289 Y130.877 E-.09629
G1 X144.385 Y130.877 E-.03682
G1 X144.385 Y129.227 E-.6269
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I1.215 J-.077 P1  F30000
G1 X143.955 Y122.461 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Support
G1 F9000
G1 X144.289 Y122.777 E.0141
G1 X144.289 Y124.746 E.0605
G1 X144.385 Y124.746 E.00298
G1 X144.385 Y122.246 E.07682
G1 X138.631 Y122.246 E.17681
G1 X138.631 Y122.461 E.00663
G1 X139.061 Y122.461 E.01321
; WIPE_START
G1 F24000
G1 X138.631 Y122.461 E-.16342
G1 X138.631 Y122.246 E-.08194
G1 X139.986 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-.118 J-1.211 P1  F30000
G1 X117.834 Y124.398 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.852 Y124.398 E.03257
G1 X116.852 Y123.602 E.0264
G1 X118.054 Y123.602 E.03987
G1 X118.054 Y124.398 E.0264
G1 X117.983 Y124.398 E.00234
G1 X117.894 Y124.398 E.00297
G1 X117.834 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P87 R3
G1 F12000
G1 X116.46 Y124.79 E.04222
G1 X116.46 Y123.21 E.04855
G1 X118.366 Y123.21 E.05856
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X118.446 Y123.21 E.00266
G1 X118.446 Y124.79 E.05241
G1 X118.366 Y124.79 E.00266
M106 S249.9
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X117.997 Y124.79 E.01134
G1 X117.894 Y124.79 E.00317
M204 S10000
G1 X117.851 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F15000
G1 X117.056 Y124 E.02518
; WIPE_START
G1 F24000
G1 X117.851 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-.04 J1.216 P1  F30000
G1 X129.815 Y124.398 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X119.946 Y124.398 E.32739
G1 X119.946 Y123.602 E.0264
G1 X140.054 Y123.602 E.66702
G1 X140.054 Y124.398 E.0264
G1 X139.983 Y124.398 E.00234
G1 X129.875 Y124.398 E.3353
G1 X129.815 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.634 Y124.79 E.31285
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X119.554 Y124.79 E.00266
G1 X119.554 Y123.21 E.05241
G1 X119.634 Y123.21 E.00266
M106 S249.9
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X140.366 Y123.21 E.63703
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X140.446 Y123.21 E.00266
G1 X140.446 Y124.79 E.05241
G1 X140.366 Y124.79 E.00266
M106 S249.9
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X139.997 Y124.79 E.01134
G1 X129.875 Y124.79 E.311
M204 S10000
; WIPE_START
G1 F24000
G1 X127.876 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I.124 J-1.211 P1  F30000
G1 X120.149 Y124 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F15000
G1 X139.851 Y124 E.62412
; WIPE_START
G1 F24000
G1 X137.851 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-.1 J1.213 P1  F30000
G1 X142.675 Y124.398 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X141.946 Y124.398 E.02419
G1 X141.946 Y123.602 E.0264
G1 X142.017 Y123.602 E.00234
G1 X143.148 Y123.602 E.03753
G1 X143.148 Y124.398 E.0264
G1 X142.735 Y124.398 E.01369
G1 X142.675 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X141.634 Y124.79 E.03199
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X141.554 Y124.79 E.00266
G1 X141.554 Y123.21 E.05241
G1 X141.634 Y123.21 E.00266
M106 S249.9
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X142.003 Y123.21 E.01134
G1 X143.54 Y123.21 E.04723
G1 X143.54 Y124.79 E.04855
G1 X142.735 Y124.79 E.02473
M204 S10000
G1 X142.944 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F15000
G1 X142.149 Y124 E.02518
; WIPE_START
G1 F24000
G1 X142.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-1.217 J-.02 P1  F30000
G1 X142.821 Y131.602 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.148 Y131.602 E.01085
G1 X143.148 Y132.398 E.0264
G1 X141.42 Y132.398 E.0573
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X140.58 Y132.398 E.02789
M106 S249.9
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X119.42 Y132.398 E.70189
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X118.58 Y132.398 E.02789
M106 S249.9
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X118.197 Y132.398 E.01269
G1 X116.852 Y132.398 E.04462
G1 X116.852 Y131.602 E.0264
G1 X118.58 Y131.602 E.0573
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X119.42 Y131.602 E.02789
M106 S249.9
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X140.58 Y131.602 E.70189
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X141.42 Y131.602 E.02789
M106 S249.9
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X142.761 Y131.602 E.04446
G1 X142.821 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.54 Y131.21 E.0221
G1 X143.54 Y132.79 E.04855
G1 X141.42 Y132.79 E.06513
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X140.58 Y132.79 E.02789
M106 S249.9
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.42 Y132.79 E.65016
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X118.58 Y132.79 E.02789
M106 S249.9
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.211 Y132.79 E.01134
G1 X116.46 Y132.79 E.05379
G1 X116.46 Y131.21 E.04855
G1 X118.58 Y131.21 E.06513
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X119.42 Y131.21 E.02789
M106 S249.9
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X140.58 Y131.21 E.65016
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X141.42 Y131.21 E.02789
M106 S249.9
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X142.761 Y131.21 E.04119
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F15000
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I1.201 J-.197 P1  F30000
G1 X115.457 Y110.114 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G3 X115.335 Y109.892 I.05 J-.172 E.00865
G1 X115.238 Y109.892 E.00298
G1 X115.238 Y115.646 E.17681
G1 X115.335 Y115.646 E.00298
G1 X115.335 Y115.546 E.00308
G1 X115.59 Y115.291 E.01109
G1 X115.59 Y110.248 E.15497
G1 X115.65 Y110.308 E.00262
G1 X116.467 Y110.308 E.0251
G1 X116.467 Y115.231 E.15127
G1 X117.344 Y115.231 E.02695
G1 X117.344 Y110.308 E.15127
G1 X118.221 Y110.308 E.02695
G1 X118.221 Y115.231 E.15127
G1 X119.098 Y115.231 E.02695
G1 X119.098 Y110.308 E.15127
G1 X119.976 Y110.308 E.02695
G1 X119.976 Y115.231 E.15127
G1 X120.853 Y115.231 E.02695
G1 X120.853 Y110.308 E.15127
G1 X121.73 Y110.308 E.02695
G1 X121.73 Y115.231 E.15127
G1 X122.607 Y115.231 E.02695
G1 X122.607 Y110.308 E.15127
G1 X123.484 Y110.308 E.02695
G1 X123.484 Y115.231 E.15127
G1 X124.361 Y115.231 E.02695
G1 X124.361 Y110.308 E.15127
G1 X125.238 Y110.308 E.02695
G1 X125.238 Y115.231 E.15127
G1 X126.115 Y115.231 E.02695
G1 X126.115 Y110.308 E.15127
G1 X126.992 Y110.308 E.02695
G1 X126.992 Y115.231 E.15127
G1 X127.869 Y115.231 E.02695
G1 X127.869 Y110.308 E.15127
G1 X128.746 Y110.308 E.02695
G1 X128.746 Y115.231 E.15127
G1 X129.623 Y115.231 E.02695
G1 X129.623 Y110.308 E.15127
G1 X130.501 Y110.308 E.02695
G1 X130.501 Y115.231 E.15127
G1 X131.378 Y115.231 E.02695
G1 X131.378 Y110.308 E.15127
G1 X132.255 Y110.308 E.02695
G1 X132.255 Y115.231 E.15127
G1 X133.132 Y115.231 E.02695
G1 X133.132 Y110.308 E.15127
G1 X134.009 Y110.308 E.02695
G1 X134.009 Y115.231 E.15127
G1 X134.886 Y115.231 E.02695
G1 X134.886 Y110.308 E.15127
G1 X135.763 Y110.308 E.02695
G1 X135.763 Y115.231 E.15127
G1 X136.64 Y115.231 E.02695
G1 X136.64 Y110.308 E.15127
G1 X137.517 Y110.308 E.02695
G1 X137.517 Y115.231 E.15127
G1 X138.394 Y115.231 E.02695
G1 X138.394 Y110.308 E.15127
G1 X139.271 Y110.308 E.02695
G1 X139.271 Y115.231 E.15127
G1 X140.148 Y115.231 E.02695
G1 X140.148 Y110.308 E.15127
G1 X140.822 Y110.308 E.02071
G1 X141.025 Y110.308 E.00624
G1 X141.025 Y115.231 E.15127
G1 X141.903 Y115.231 E.02695
G1 X141.903 Y110.308 E.15127
G1 X142.78 Y110.308 E.02695
G1 X142.78 Y115.231 E.15127
G1 X143.597 Y115.231 E.0251
G1 X143.657 Y115.291 E.00262
G1 X143.657 Y110.248 E.15497
G1 X143.912 Y109.992 E.01109
G1 X143.912 Y109.892 E.00308
G1 X144.009 Y109.892 E.00298
G1 X144.009 Y115.646 E.17681
G1 X143.912 Y115.646 E.00298
G2 X143.79 Y115.424 I-.172 J-.05 E.00865
; WIPE_START
G1 F24000
G1 X143.912 Y115.646 E-.09629
G1 X144.009 Y115.646 E-.03682
G1 X144.009 Y113.997 E-.6269
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I1.215 J-.077 P1  F30000
G1 X143.579 Y107.231 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Support
G1 F9000
G1 X143.912 Y107.546 E.0141
G1 X143.912 Y109.515 E.0605
G1 X144.009 Y109.515 E.00298
G1 X144.009 Y107.015 E.07682
G1 X138.255 Y107.015 E.17681
G1 X138.255 Y107.231 E.00663
G1 X138.685 Y107.231 E.01321
; WIPE_START
G1 F24000
G1 X138.255 Y107.231 E-.16342
G1 X138.255 Y107.015 E-.08194
G1 X139.609 Y107.015 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-.014 J-1.217 P1  F30000
G1 X120.562 Y107.231 Z16
G1 Z15.6
G1 E.8 F1800
G1 F9000
G1 X120.992 Y107.231 E.01321
G1 X120.992 Y107.015 E.00663
G1 X115.238 Y107.015 E.17681
G1 X115.238 Y109.515 E.07682
G1 X115.335 Y109.515 E.00298
G1 X115.335 Y107.546 E.0605
G1 X115.668 Y107.231 E.0141
; WIPE_START
G1 F24000
G1 X115.335 Y107.546 E-.17436
G1 X115.335 Y109.087 E-.58564
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-.046 J1.216 P1  F30000
G1 X117.457 Y109.167 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.476 Y109.167 E.03257
G1 X116.476 Y108.371 E.0264
G1 X117.678 Y108.371 E.03987
G1 X117.678 Y109.167 E.0264
G1 X117.607 Y109.167 E.00234
G1 X117.517 Y109.167 E.00297
G1 X117.457 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.083 Y109.559 E.04222
G1 X116.083 Y107.979 E.04855
G1 X117.989 Y107.979 E.05856
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X118.07 Y107.979 E.00266
G1 X118.07 Y109.559 E.05241
G1 X117.989 Y109.559 E.00266
M106 S249.9
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X117.62 Y109.559 E.01134
G1 X117.517 Y109.559 E.00317
M204 S10000
G1 X117.474 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F15000
G1 X116.679 Y108.769 E.02518
; WIPE_START
G1 F24000
G1 X117.474 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-.04 J1.216 P1  F30000
G1 X129.439 Y109.167 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X119.569 Y109.167 E.32739
G1 X119.569 Y108.371 E.0264
G1 X139.678 Y108.371 E.66702
G1 X139.678 Y109.167 E.0264
G1 X139.607 Y109.167 E.00234
G1 X129.499 Y109.167 E.3353
G1 X129.439 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.257 Y109.559 E.31285
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X119.177 Y109.559 E.00266
G1 X119.177 Y107.979 E.05241
G1 X119.257 Y107.979 E.00266
M106 S249.9
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X139.989 Y107.979 E.63703
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X140.07 Y107.979 E.00266
M73 P87 R2
G1 X140.07 Y109.559 E.05241
G1 X139.989 Y109.559 E.00266
M106 S249.9
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X139.62 Y109.559 E.01134
G1 X129.499 Y109.559 E.311
M204 S10000
; WIPE_START
G1 F24000
G1 X127.499 Y109.559 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I.124 J-1.211 P1  F30000
G1 X119.773 Y108.769 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F15000
G1 X139.474 Y108.769 E.62412
; WIPE_START
G1 F24000
G1 X137.474 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-.1 J1.213 P1  F30000
G1 X142.299 Y109.167 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X141.569 Y109.167 E.02419
G1 X141.569 Y108.371 E.0264
G1 X141.64 Y108.371 E.00234
G1 X142.771 Y108.371 E.03753
G1 X142.771 Y109.167 E.0264
G1 X142.359 Y109.167 E.01369
G1 X142.299 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X141.257 Y109.559 E.03199
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X141.177 Y109.559 E.00266
G1 X141.177 Y107.979 E.05241
G1 X141.257 Y107.979 E.00266
M106 S249.9
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X141.626 Y107.979 E.01134
G1 X143.163 Y107.979 E.04723
G1 X143.163 Y109.559 E.04855
G1 X142.359 Y109.559 E.02473
M204 S10000
G1 X142.568 Y108.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F15000
G1 X141.773 Y108.769 E.02518
; WIPE_START
G1 F24000
G1 X142.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-1.217 J-.02 P1  F30000
G1 X142.444 Y116.371 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X142.771 Y116.371 E.01085
G1 X142.771 Y117.167 E.0264
G1 X141.044 Y117.167 E.0573
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X140.203 Y117.167 E.02789
M106 S249.9
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X119.044 Y117.167 E.70189
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X118.203 Y117.167 E.02789
M106 S249.9
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X117.82 Y117.167 E.01269
G1 X116.476 Y117.167 E.04462
G1 X116.476 Y116.371 E.0264
G1 X118.203 Y116.371 E.0573
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X119.044 Y116.371 E.02789
M106 S249.9
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X140.203 Y116.371 E.70189
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X141.044 Y116.371 E.02789
M106 S249.9
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X142.384 Y116.371 E.04446
G1 X142.444 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.163 Y115.979 E.0221
G1 X143.163 Y117.559 E.04855
G1 X141.044 Y117.559 E.06513
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X140.203 Y117.559 E.02789
M106 S249.9
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.044 Y117.559 E.65016
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X118.203 Y117.559 E.02789
M106 S249.9
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X117.834 Y117.559 E.01134
G1 X116.083 Y117.559 E.05379
G1 X116.083 Y115.979 E.04855
G1 X118.203 Y115.979 E.06513
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X119.044 Y115.979 E.02789
M106 S249.9
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X140.203 Y115.979 E.65016
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X141.044 Y115.979 E.02789
M106 S249.9
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X142.384 Y115.979 E.04119
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F15000
G1 X116.679 Y116.769 E.82014
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 124/135
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
G3 Z16 I-1.21 J-.131 P1  F30000
G1 X118.062 Y122.461 Z16
G1 Z15.8
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
G1 X118.492 Y122.461 E.01321
G1 X118.492 Y122.246 E.00663
G1 X115.615 Y122.246 E.0884
G1 X115.615 Y124.746 E.07682
G1 X115.711 Y124.746 E.00298
G1 X115.711 Y122.777 E.0605
G1 X116.045 Y122.461 E.0141
; WIPE_START
G1 F24000
G1 X115.711 Y122.777 E-.17436
G1 X115.711 Y124.318 E-.58564
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-1.208 J.144 P1  F30000
G1 X115.833 Y125.345 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Support interface
G1 F4800
G3 X115.711 Y125.123 I.05 J-.172 E.00865
G1 X115.615 Y125.123 E.00298
G1 X115.615 Y130.877 E.17681
G1 X115.711 Y130.877 E.00298
G1 X115.711 Y130.777 E.00308
G1 X115.967 Y130.522 E.01109
G1 X115.967 Y125.478 E.15497
G1 X116.027 Y125.539 E.00262
G1 X116.844 Y125.539 E.0251
G1 X116.844 Y130.461 E.15127
G1 X117.721 Y130.461 E.02695
G1 X117.721 Y125.539 E.15127
G1 X118.598 Y125.539 E.02695
G1 X118.598 Y130.461 E.15127
G1 X119.475 Y130.461 E.02695
G1 X119.475 Y125.539 E.15127
G1 X120.352 Y125.539 E.02695
G1 X120.352 Y130.461 E.15127
G1 X121.229 Y130.461 E.02695
G1 X121.229 Y125.539 E.15127
G1 X122.106 Y125.539 E.02695
G1 X122.106 Y130.461 E.15127
G1 X122.983 Y130.461 E.02695
G1 X122.983 Y125.539 E.15127
G1 X123.86 Y125.539 E.02695
G1 X123.86 Y130.461 E.15127
G1 X124.738 Y130.461 E.02695
G1 X124.738 Y125.539 E.15127
G1 X125.615 Y125.539 E.02695
G1 X125.615 Y130.461 E.15127
G1 X126.492 Y130.461 E.02695
G1 X126.492 Y125.539 E.15127
G1 X127.369 Y125.539 E.02695
G1 X127.369 Y130.461 E.15127
G1 X128.246 Y130.461 E.02695
G1 X128.246 Y125.539 E.15127
G1 X129.123 Y125.539 E.02695
G1 X129.123 Y130.461 E.15127
G1 X130 Y130.461 E.02695
G1 X130 Y125.539 E.15127
G1 X130.877 Y125.539 E.02695
G1 X130.877 Y130.461 E.15127
G1 X131.754 Y130.461 E.02695
G1 X131.754 Y125.539 E.15127
G1 X132.631 Y125.539 E.02695
G1 X132.631 Y130.461 E.15127
G1 X133.508 Y130.461 E.02695
G1 X133.508 Y125.539 E.15127
G1 X134.385 Y125.539 E.02695
G1 X134.385 Y130.461 E.15127
G1 X135.262 Y130.461 E.02695
G1 X135.262 Y125.539 E.15127
G1 X136.14 Y125.539 E.02695
G1 X136.14 Y130.461 E.15127
G1 X137.017 Y130.461 E.02695
G1 X137.017 Y125.539 E.15127
G1 X137.894 Y125.539 E.02695
G1 X137.894 Y130.461 E.15127
G1 X138.771 Y130.461 E.02695
G1 X138.771 Y125.539 E.15127
G1 X139.648 Y125.539 E.02695
G1 X139.648 Y130.461 E.15127
G1 X140.525 Y130.461 E.02695
G1 X140.525 Y125.539 E.15127
G1 X141.402 Y125.539 E.02695
G1 X141.402 Y130.461 E.15127
G1 X142.279 Y130.461 E.02695
G1 X142.279 Y125.539 E.15127
G1 X143.156 Y125.539 E.02695
G1 X143.156 Y130.461 E.15127
G1 X143.973 Y130.461 E.0251
G1 X144.033 Y130.522 E.00262
G1 X144.033 Y125.478 E.15497
G1 X144.289 Y125.223 E.01109
G1 X144.289 Y125.123 E.00308
G1 X144.385 Y125.123 E.00298
G1 X144.385 Y130.877 E.17681
G1 X144.289 Y130.877 E.00298
G2 X144.167 Y130.655 I-.172 J-.05 E.00865
; WIPE_START
G1 F24000
G1 X144.289 Y130.877 E-.09629
G1 X144.385 Y130.877 E-.03682
G1 X144.385 Y129.227 E-.6269
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I1.215 J-.077 P1  F30000
G1 X143.955 Y122.461 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Support
G1 F9000
G1 X144.289 Y122.777 E.0141
G1 X144.289 Y124.746 E.0605
G1 X144.385 Y124.746 E.00298
G1 X144.385 Y122.246 E.07682
G1 X141.508 Y122.246 E.0884
G1 X141.508 Y122.461 E.00663
G1 X141.938 Y122.461 E.01321
; WIPE_START
G1 F24000
G1 X141.508 Y122.461 E-.16342
M73 P88 R2
G1 X141.508 Y122.246 E-.08194
G1 X142.863 Y122.246 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-1.216 J.037 P1  F30000
G1 X143.148 Y131.602 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F15000
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I1.203 J-.186 P1  F30000
G1 X117.882 Y124.398 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.852 Y124.398 E.03415
G1 X116.852 Y123.602 E.0264
G1 X118.856 Y123.602 E.06648
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X119.144 Y123.602 E.00954
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X140.856 Y123.602 E.72024
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X141.144 Y123.602 E.00954
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X143.148 Y123.602 E.06648
G1 X143.148 Y124.398 E.0264
G1 X141.144 Y124.398 E.06648
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X140.856 Y124.398 E.00954
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X119.144 Y124.398 E.72024
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X118.856 Y124.398 E.00954
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X118.474 Y124.398 E.01269
G1 X117.942 Y124.398 E.01765
G1 X117.882 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.46 Y124.79 E.04368
G1 X116.46 Y123.21 E.04855
G1 X118.856 Y123.21 E.07363
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X119.144 Y123.21 E.00954
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X140.856 Y123.21 E.66716
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X141.144 Y123.21 E.00954
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.54 Y123.21 E.07363
G1 X143.54 Y124.79 E.04855
G1 X141.144 Y124.79 E.07363
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X140.856 Y124.79 E.00954
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X119.144 Y124.79 E.66716
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X118.856 Y124.79 E.00954
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.487 Y124.79 E.01134
G1 X117.942 Y124.79 E.01677
M204 S10000
; WIPE_START
G1 F24000
G1 X116.46 Y124.79 E-.56299
G1 X116.46 Y124.272 E-.19701
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I.505 J1.107 P1  F30000
G1 X117.056 Y124 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F15000
G1 X142.944 Y124 E.82014
; WIPE_START
G1 F24000
G1 X140.944 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I1.155 J.383 P1  F30000
G1 X143.79 Y115.424 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G3 X143.912 Y115.646 I-.05 J.172 E.00865
G1 X144.009 Y115.646 E.00298
G1 X144.009 Y109.892 E.17681
G1 X143.912 Y109.892 E.00298
G1 X143.912 Y109.992 E.00308
G1 X143.657 Y110.248 E.01109
G1 X143.657 Y115.291 E.15497
G1 X143.597 Y115.231 E.00262
G1 X142.78 Y115.231 E.0251
G1 X142.78 Y110.308 E.15127
G1 X141.903 Y110.308 E.02695
G1 X141.903 Y115.231 E.15127
G1 X141.025 Y115.231 E.02695
G1 X141.025 Y110.308 E.15127
G1 X140.148 Y110.308 E.02695
G1 X140.148 Y115.231 E.15127
G1 X139.271 Y115.231 E.02695
G1 X139.271 Y110.308 E.15127
G1 X138.394 Y110.308 E.02695
G1 X138.394 Y115.231 E.15127
G1 X137.517 Y115.231 E.02695
G1 X137.517 Y110.308 E.15127
G1 X136.64 Y110.308 E.02695
G1 X136.64 Y115.231 E.15127
G1 X135.763 Y115.231 E.02695
G1 X135.763 Y110.308 E.15127
G1 X134.886 Y110.308 E.02695
G1 X134.886 Y115.231 E.15127
G1 X134.009 Y115.231 E.02695
G1 X134.009 Y110.308 E.15127
G1 X133.132 Y110.308 E.02695
G1 X133.132 Y115.231 E.15127
G1 X132.255 Y115.231 E.02695
G1 X132.255 Y110.308 E.15127
G1 X131.378 Y110.308 E.02695
G1 X131.378 Y115.231 E.15127
G1 X130.501 Y115.231 E.02695
G1 X130.501 Y110.308 E.15127
G1 X129.623 Y110.308 E.02695
G1 X129.623 Y115.231 E.15127
G1 X128.746 Y115.231 E.02695
G1 X128.746 Y110.308 E.15127
G1 X127.869 Y110.308 E.02695
G1 X127.869 Y115.231 E.15127
G1 X126.992 Y115.231 E.02695
G1 X126.992 Y110.308 E.15127
G1 X126.115 Y110.308 E.02695
G1 X126.115 Y115.231 E.15127
G1 X125.238 Y115.231 E.02695
G1 X125.238 Y110.308 E.15127
G1 X124.361 Y110.308 E.02695
G1 X124.361 Y115.231 E.15127
G1 X123.484 Y115.231 E.02695
G1 X123.484 Y110.308 E.15127
G1 X122.607 Y110.308 E.02695
G1 X122.607 Y115.231 E.15127
G1 X121.73 Y115.231 E.02695
G1 X121.73 Y110.308 E.15127
G1 X120.853 Y110.308 E.02695
G1 X120.853 Y115.231 E.15127
G1 X119.976 Y115.231 E.02695
G1 X119.976 Y110.308 E.15127
G1 X119.098 Y110.308 E.02695
G1 X119.098 Y115.231 E.15127
G1 X118.221 Y115.231 E.02695
G1 X118.221 Y110.308 E.15127
G1 X117.344 Y110.308 E.02695
G1 X117.344 Y115.231 E.15127
G1 X116.467 Y115.231 E.02695
G1 X116.467 Y110.308 E.15127
G1 X115.65 Y110.308 E.0251
G1 X115.59 Y110.248 E.00262
G1 X115.59 Y115.291 E.15497
G1 X115.335 Y115.546 E.01109
G1 X115.335 Y115.646 E.00308
G1 X115.238 Y115.646 E.00298
G1 X115.238 Y109.892 E.17681
G1 X115.335 Y109.892 E.00298
G2 X115.457 Y110.114 I.172 J.05 E.00865
; WIPE_START
G1 F24000
G1 X115.335 Y109.892 E-.09629
G1 X115.238 Y109.892 E-.03681
G1 X115.238 Y111.542 E-.6269
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I1.211 J.121 P1  F30000
G1 X115.668 Y107.231 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Support
G1 F9000
G1 X115.335 Y107.546 E.0141
G1 X115.335 Y109.515 E.0605
G1 X115.238 Y109.515 E.00298
G1 X115.238 Y107.015 E.07682
G1 X118.115 Y107.015 E.0884
G1 X118.115 Y107.231 E.00663
G1 X117.685 Y107.231 E.01321
; WIPE_START
G1 F24000
G1 X118.115 Y107.231 E-.16342
G1 X118.115 Y107.015 E-.08194
G1 X116.761 Y107.015 E-.51464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-.011 J1.217 P1  F30000
G1 X141.562 Y107.231 Z16.2
G1 Z15.8
G1 E.8 F1800
G1 F9000
G1 X141.132 Y107.231 E.01321
G1 X141.132 Y107.015 E.00663
G1 X144.009 Y107.015 E.0884
G1 X144.009 Y109.515 E.07682
G1 X143.912 Y109.515 E.00298
G1 X143.912 Y107.546 E.0605
G1 X143.579 Y107.231 E.0141
; WIPE_START
G1 F24000
G1 X143.912 Y107.546 E-.17436
G1 X143.912 Y109.087 E-.58564
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-1.202 J-.188 P1  F30000
G1 X142.771 Y116.371 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F15000
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I1.203 J-.186 P1  F30000
G1 X117.505 Y109.167 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.476 Y109.167 E.03415
G1 X116.476 Y108.371 E.0264
G1 X118.48 Y108.371 E.06648
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X118.767 Y108.371 E.00954
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X140.48 Y108.371 E.72024
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X140.767 Y108.371 E.00954
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X142.771 Y108.371 E.06648
G1 X142.771 Y109.167 E.0264
G1 X140.767 Y109.167 E.06648
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X140.48 Y109.167 E.00954
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X118.767 Y109.167 E.72024
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X118.48 Y109.167 E.00954
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X118.097 Y109.167 E.01269
G1 X117.565 Y109.167 E.01765
G1 X117.505 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.083 Y109.559 E.04368
G1 X116.083 Y107.979 E.04855
G1 X118.48 Y107.979 E.07363
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X118.767 Y107.979 E.00954
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X140.48 Y107.979 E.66716
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X140.767 Y107.979 E.00954
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.163 Y107.979 E.07363
G1 X143.163 Y109.559 E.04855
G1 X140.767 Y109.559 E.07363
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X140.48 Y109.559 E.00954
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.767 Y109.559 E.66716
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X118.48 Y109.559 E.00954
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X118.111 Y109.559 E.01134
G1 X117.565 Y109.559 E.01677
M204 S10000
; WIPE_START
G1 F24000
G1 X116.083 Y109.559 E-.56299
G1 X116.083 Y109.041 E-.19701
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I.505 J1.107 P1  F30000
G1 X116.679 Y108.769 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F15000
G1 X142.568 Y108.769 E.82014
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X140.568 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 125/135
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
G3 Z16.2 I-1.201 J.198 P1  F30000
G1 X144.139 Y130.443 Z16.2
G1 Z16
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G1 X144.139 Y130.627 E.00566
G3 X144.289 Y130.877 I-.05 J.2 E.00996
G1 X144.385 Y130.877 E.00298
G1 X144.385 Y128 E.08841
G1 X144.139 Y128 E.00759
G1 X144.139 Y128.597 E.01835
G1 X144.033 Y128.702 E.00457
G1 X144.033 Y130.298 E.04902
G1 X143.911 Y130.175 E.00532
G1 X143.156 Y130.175 E.02319
G1 X143.156 Y128.825 E.0415
G1 X142.279 Y128.825 E.02695
G1 X142.279 Y130.175 E.0415
G1 X141.402 Y130.175 E.02695
G1 X141.402 Y128.825 E.0415
G1 X140.525 Y128.825 E.02695
G1 X140.525 Y130.175 E.0415
G1 X139.648 Y130.175 E.02695
G1 X139.648 Y128.825 E.0415
G1 X138.771 Y128.825 E.02695
G1 X138.771 Y130.175 E.0415
G1 X137.894 Y130.175 E.02695
G1 X137.894 Y128.825 E.0415
G1 X137.017 Y128.825 E.02695
G1 X137.017 Y130.175 E.0415
G1 X136.14 Y130.175 E.02695
G1 X136.14 Y128.825 E.0415
G1 X135.262 Y128.825 E.02695
G1 X135.262 Y130.175 E.0415
G1 X134.385 Y130.175 E.02695
G1 X134.385 Y128.825 E.0415
G1 X133.508 Y128.825 E.02695
G1 X133.508 Y130.175 E.0415
G1 X132.631 Y130.175 E.02695
G1 X132.631 Y128.825 E.0415
G1 X131.754 Y128.825 E.02695
G1 X131.754 Y130.175 E.0415
G1 X130.877 Y130.175 E.02695
G1 X130.877 Y128.825 E.0415
G1 X130 Y128.825 E.02695
G1 X130 Y130.175 E.0415
G1 X129.123 Y130.175 E.02695
G1 X129.123 Y128.825 E.0415
G1 X128.246 Y128.825 E.02695
G1 X128.246 Y130.175 E.0415
G1 X127.369 Y130.175 E.02695
G1 X127.369 Y128.825 E.0415
G1 X126.492 Y128.825 E.02695
G1 X126.492 Y130.175 E.0415
G1 X125.615 Y130.175 E.02695
G1 X125.615 Y128.825 E.0415
G1 X124.738 Y128.825 E.02695
G1 X124.738 Y130.175 E.0415
G1 X123.86 Y130.175 E.02695
G1 X123.86 Y128.825 E.0415
G1 X122.983 Y128.825 E.02695
G1 X122.983 Y130.175 E.0415
G1 X122.106 Y130.175 E.02695
G1 X122.106 Y128.825 E.0415
G1 X121.229 Y128.825 E.02695
G1 X121.229 Y130.175 E.0415
G1 X120.352 Y130.175 E.02695
G1 X120.352 Y128.825 E.0415
G1 X119.475 Y128.825 E.02695
G1 X119.475 Y130.175 E.0415
G1 X118.598 Y130.175 E.02695
G1 X118.598 Y128.825 E.0415
G1 X117.721 Y128.825 E.02695
G1 X117.721 Y130.175 E.0415
G1 X116.844 Y130.175 E.02695
G1 X116.844 Y128.825 E.0415
G1 X116.089 Y128.825 E.02319
G1 X115.967 Y128.702 E.00532
G3 X115.861 Y130.627 I-6.168 J.628 E.05947
G2 X115.711 Y130.877 I.05 J.2 E.00996
G1 X115.615 Y130.877 E.00298
G1 X115.615 Y128 E.08841
G1 X115.861 Y128 E.00759
G1 X115.861 Y128.557 E.01713
; WIPE_START
G1 F24000
G1 X115.861 Y128 E-.21182
G1 X115.615 Y128 E-.09381
G1 X115.615 Y129.196 E-.45436
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I-.106 J1.212 P1  F30000
G1 X143.148 Y131.602 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6337
G1 X143.148 Y132.398 E.0264
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.602 E.0264
G1 X143.088 Y131.602 E.87029
G1 X143.54 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6337
G1 X143.54 Y132.79 E.04855
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y131.21 E.04855
G1 X143.48 Y131.21 E.83025
M204 S10000
G1 X142.944 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6337
G1 X117.056 Y132 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I.694 J1 P1  F30000
G1 X130 Y124.398 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6337
G1 X116.852 Y124.398 E.43614
G1 X116.852 Y123.602 E.0264
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y124.398 E.0264
G1 X130.06 Y124.398 E.43415
G1 X130 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6337
G1 X116.46 Y124.79 E.41605
G1 X116.46 Y123.21 E.04855
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y124.79 E.04855
G1 X130.06 Y124.79 E.4142
M204 S10000
; WIPE_START
G1 F24000
G1 X128.06 Y124.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I.065 J1.215 P1  F30000
G1 X142.944 Y124 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6337
G1 X117.056 Y124 E.82014
; WIPE_START
G1 F24000
G1 X119.056 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I1.154 J-.386 P1  F30000
G1 X115.485 Y113.327 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F4800
G1 X115.485 Y112.769 E.01713
G1 X115.238 Y112.769 E.00759
G1 X115.238 Y115.646 E.08841
G1 X115.335 Y115.646 E.00298
G3 X115.485 Y115.396 I.2 J-.05 E.00996
G2 X115.59 Y113.472 I-6.063 J-1.297 E.05947
G1 X115.713 Y113.594 E.00532
G1 X116.467 Y113.594 E.02319
G1 X116.467 Y114.945 E.0415
G1 X117.344 Y114.945 E.02695
G1 X117.344 Y113.594 E.0415
G1 X118.221 Y113.594 E.02695
G1 X118.221 Y114.945 E.0415
G1 X119.098 Y114.945 E.02695
G1 X119.098 Y113.594 E.0415
G1 X119.976 Y113.594 E.02695
G1 X119.976 Y114.945 E.0415
G1 X120.853 Y114.945 E.02695
G1 X120.853 Y113.594 E.0415
G1 X121.73 Y113.594 E.02695
G1 X121.73 Y114.945 E.0415
G1 X122.607 Y114.945 E.02695
G1 X122.607 Y113.594 E.0415
G1 X123.484 Y113.594 E.02695
M73 P89 R2
G1 X123.484 Y114.945 E.0415
G1 X124.361 Y114.945 E.02695
G1 X124.361 Y113.594 E.0415
G1 X125.238 Y113.594 E.02695
G1 X125.238 Y114.945 E.0415
G1 X126.115 Y114.945 E.02695
G1 X126.115 Y113.594 E.0415
G1 X126.992 Y113.594 E.02695
G1 X126.992 Y114.945 E.0415
G1 X127.869 Y114.945 E.02695
G1 X127.869 Y113.594 E.0415
G1 X128.746 Y113.594 E.02695
G1 X128.746 Y114.945 E.0415
G1 X129.623 Y114.945 E.02695
G1 X129.623 Y113.594 E.0415
G1 X130.501 Y113.594 E.02695
G1 X130.501 Y114.945 E.0415
G1 X131.378 Y114.945 E.02695
G1 X131.378 Y113.594 E.0415
G1 X132.255 Y113.594 E.02695
G1 X132.255 Y114.945 E.0415
G1 X133.132 Y114.945 E.02695
G1 X133.132 Y113.594 E.0415
G1 X134.009 Y113.594 E.02695
G1 X134.009 Y114.945 E.0415
G1 X134.886 Y114.945 E.02695
G1 X134.886 Y113.594 E.0415
G1 X135.763 Y113.594 E.02695
G1 X135.763 Y114.945 E.0415
G1 X136.64 Y114.945 E.02695
G1 X136.64 Y113.594 E.0415
G1 X137.517 Y113.594 E.02695
G1 X137.517 Y114.945 E.0415
G1 X138.394 Y114.945 E.02695
G1 X138.394 Y113.594 E.0415
G1 X139.271 Y113.594 E.02695
G1 X139.271 Y114.945 E.0415
G1 X140.148 Y114.945 E.02695
G1 X140.148 Y113.594 E.0415
G1 X141.025 Y113.594 E.02695
G1 X141.025 Y114.945 E.0415
G1 X141.903 Y114.945 E.02695
G1 X141.903 Y113.594 E.0415
G1 X142.78 Y113.594 E.02695
G1 X142.78 Y114.945 E.0415
G1 X143.534 Y114.945 E.02319
G1 X143.657 Y115.067 E.00532
G1 X143.657 Y113.472 E.04902
G1 X143.762 Y113.366 E.00457
G1 X143.762 Y112.769 E.01835
G1 X144.009 Y112.769 E.00759
G1 X144.009 Y115.646 E.08841
G1 X143.912 Y115.646 E.00298
G2 X143.762 Y115.396 I-.2 J-.05 E.00996
G1 X143.762 Y115.212 E.00566
; WIPE_START
G1 F24000
G1 X143.762 Y115.396 E-.07005
G1 X143.912 Y115.546 E-.08061
G1 X143.912 Y115.646 E-.03806
G1 X144.009 Y115.646 E-.03682
G1 X144.009 Y114.24 E-.53446
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I-1.052 J-.611 P1  F30000
G1 X142.771 Y116.371 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6337
G1 X142.771 Y117.167 E.0264
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y116.371 E.0264
G1 X142.711 Y116.371 E.87029
G1 X143.163 Y115.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6337
G1 X143.163 Y117.559 E.04855
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.979 E.04855
G1 X143.103 Y115.979 E.83025
M204 S10000
G1 X142.568 Y116.769 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6337
G1 X116.679 Y116.769 E.82014
; WIPE_START
G1 F24000
G1 X118.679 Y116.769 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I.694 J1 P1  F30000
G1 X129.623 Y109.167 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6337
G1 X116.476 Y109.167 E.43614
G1 X116.476 Y108.371 E.0264
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.167 E.0264
G1 X129.683 Y109.167 E.43415
G1 X129.623 Y109.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6337
G1 X116.083 Y109.559 E.41605
G1 X116.083 Y107.979 E.04855
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.559 E.04855
G1 X129.683 Y109.559 E.4142
M204 S10000
; WIPE_START
G1 F24000
G1 X127.683 Y109.559 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I.065 J1.215 P1  F30000
G1 X142.568 Y108.769 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F6337
G1 X116.679 Y108.769 E.82014
M106 S239.7
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X118.679 Y108.769 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 126/135
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
G3 Z16.4 I-1.202 J-.192 P1  F30000
G1 X115.615 Y128 Z16.4
G1 Z16.2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
G1 X115.711 Y128 E.00298
G1 X115.711 Y128.659 E.02026
G1 X116.089 Y129.094 E.01771
G1 X143.911 Y129.094 E.85489
G1 X144.289 Y128.659 E.01771
G1 X144.289 Y128 E.02026
G1 X144.385 Y128 E.00298
G1 X144.385 Y130.877 E.0884
G1 X144.289 Y130.877 E.00298
G1 X144.289 Y130.341 E.01648
G1 X143.911 Y129.906 E.01771
G1 X116.089 Y129.906 E.85489
G1 X115.711 Y130.341 E.01771
G1 X115.711 Y130.877 E.01648
G1 X115.615 Y130.877 E.00298
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.341 E-.20379
G1 X116.089 Y129.906 E-.21896
G1 X116.88 Y129.906 E-.30044
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I-.058 J1.216 P1  F30000
G1 X143.148 Y131.169 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.148 Y131.183 E.00045
G1 X143.148 Y132.398 E.04032
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y131.183 E.04032
G1 X116.852 Y131.166 E.00055
G1 X143.091 Y131.166 E.87039
G1 X143.54 Y131.169 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.54 Y132.79 E.04981
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y130.8 E.06115
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X116.46 Y130.774 E.00087
G1 X143.54 Y130.774 E.89829
G1 X143.54 Y130.8 E.00087
M106 S239.7
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.54 Y131.109 E.00949
M204 S10000
; WIPE_START
G1 F24000
G1 X143.54 Y132.79 E-.63878
G1 X143.221 Y132.79 E-.12122
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I.057 J-1.216 P1  F30000
G1 X117.262 Y131.576 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.455377
G1 F15000
G1 X117.262 Y131.988 E.01386
G1 X142.738 Y131.988 E.85626
G1 X142.738 Y131.576 E.01386
G1 X117.322 Y131.576 E.85424
; WIPE_START
G1 F24000
G1 X119.322 Y131.576 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I1.162 J-.36 P1  F30000
G1 X116.852 Y123.602 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y125.2 E.05301
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X143.148 Y127.834 E.08738
G1 X116.852 Y127.834 E.87228
G1 X116.852 Y125.2 E.08738
M106 S239.7
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X116.852 Y124.818 E.01269
G1 X116.852 Y123.662 E.03833
G1 X116.46 Y123.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y125.2 E.06115
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X143.54 Y128.226 E.10038
G1 X116.46 Y128.226 E.89829
G1 X116.46 Y125.2 E.10038
M106 S239.7
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.46 Y124.831 E.01134
G1 X116.46 Y123.27 E.04797
M204 S10000
; WIPE_START
G1 F24000
G1 X118.46 Y123.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I-1.151 J-.394 P1  F30000
G1 X117.016 Y127.487 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.448403
M106 S255
G1 F3000
G1 X142.815 Y127.487 E.85244
G1 X142.815 Y127.081 E.0134
G1 X117.185 Y127.081 E.84684
G1 X117.185 Y126.676 E.0134
G1 X142.815 Y126.676 E.84684
G1 X142.815 Y126.27 E.0134
G1 X117.185 Y126.27 E.84684
G1 X117.185 Y125.865 E.0134
G1 X142.815 Y125.865 E.84684
G1 X142.815 Y125.459 E.0134
G1 X117.185 Y125.459 E.84684
G1 X117.185 Y125.054 E.0134
G1 X142.815 Y125.054 E.84684
G1 X142.815 Y124.648 E.0134
G1 X117.185 Y124.648 E.84684
G1 X117.185 Y124.243 E.0134
G1 X142.984 Y124.243 E.85244
M106 S239.7
; WIPE_START
G1 F24000
G1 X140.984 Y124.243 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I1.148 J.404 P1  F30000
G1 X144.009 Y115.646 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
G1 X143.912 Y115.646 E.00298
G1 X143.912 Y115.11 E.01648
G1 X143.534 Y114.675 E.01771
G1 X138.255 Y114.675 E.16223
G1 X138.255 Y113.864 E.02492
G1 X143.534 Y113.864 E.16223
G1 X143.912 Y113.428 E.01771
G1 X143.912 Y112.769 E.02026
G1 X144.009 Y112.769 E.00298
; WIPE_START
G1 F24000
G1 X143.912 Y112.769 E-.03681
G1 X143.912 Y113.428 E-.2505
G1 X143.534 Y113.864 E-.21896
G1 X142.867 Y113.864 E-.25373
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I.048 J-1.216 P1  F30000
G1 X115.238 Y112.769 Z16.6
G1 Z16.2
G1 E.8 F1800
G1 F9000
G1 X115.335 Y112.769 E.00298
G1 X115.335 Y113.428 E.02026
G1 X115.712 Y113.864 E.01771
G1 X135.378 Y113.864 E.60425
G1 X135.378 Y114.675 E.02492
G1 X115.712 Y114.675 E.60425
G1 X115.335 Y115.11 E.01771
G1 X115.335 Y115.646 E.01648
G1 X115.238 Y115.646 E.00298
; WIPE_START
G1 F24000
G1 X115.335 Y115.646 E-.03681
G1 X115.335 Y115.11 E-.20379
G1 X115.712 Y114.675 E-.21896
G1 X116.503 Y114.675 E-.30044
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I-.058 J1.216 P1  F30000
M73 P90 R2
G1 X142.771 Y115.938 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X142.771 Y115.952 E.00045
G1 X142.771 Y117.167 E.04032
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y115.952 E.04032
G1 X116.476 Y115.935 E.00055
G1 X142.714 Y115.935 E.87039
G1 X143.163 Y115.938 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.163 Y117.559 E.04981
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.569 E.06115
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X116.083 Y115.543 E.00087
G1 X143.163 Y115.543 E.89829
G1 X143.163 Y115.569 E.00087
M106 S239.7
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.163 Y115.878 E.00949
M204 S10000
; WIPE_START
G1 F24000
G1 X143.163 Y117.559 E-.63878
G1 X142.844 Y117.559 E-.12122
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I.038 J-1.216 P1  F30000
G1 X117.092 Y116.757 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.455377
G1 F15000
G1 X142.362 Y116.757 E.84933
G1 X142.362 Y116.345 E.01386
G1 X116.885 Y116.345 E.85626
G1 X116.885 Y116.757 E.01386
G1 X117.032 Y116.757 E.00491
; WIPE_START
G1 F24000
G1 X116.885 Y116.757 E-.05557
G1 X116.885 Y116.345 E-.15673
G1 X118.327 Y116.345 E-.5477
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I1.185 J-.275 P1  F30000
G1 X116.476 Y108.371 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y109.969 E.05301
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X142.771 Y112.603 E.08738
G1 X116.476 Y112.603 E.87228
G1 X116.476 Y109.969 E.08738
M106 S239.7
M204 S10000
; FEATURE: Inner wall
G1 F15476.087
G1 X116.476 Y109.587 E.01269
G1 X116.476 Y108.431 E.03833
G1 X116.083 Y107.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y109.969 E.06115
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X143.163 Y112.995 E.10038
G1 X116.083 Y112.995 E.89829
G1 X116.083 Y109.969 E.10038
M106 S239.7
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.083 Y109.6 E.01134
G1 X116.083 Y108.039 E.04797
M204 S10000
; WIPE_START
G1 F24000
G1 X118.083 Y108.035 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I-1.151 J-.394 P1  F30000
G1 X116.639 Y112.256 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.448403
M106 S255
G1 F3000
G1 X142.438 Y112.256 E.85244
G1 X142.438 Y111.85 E.0134
G1 X116.809 Y111.85 E.84684
G1 X116.809 Y111.445 E.0134
G1 X142.438 Y111.445 E.84684
G1 X142.438 Y111.039 E.0134
G1 X116.809 Y111.039 E.84684
G1 X116.809 Y110.634 E.0134
G1 X142.438 Y110.634 E.84684
G1 X142.438 Y110.228 E.0134
G1 X116.809 Y110.228 E.84684
G1 X116.809 Y109.823 E.0134
G1 X142.438 Y109.823 E.84684
G1 X142.438 Y109.417 E.0134
G1 X116.809 Y109.417 E.84684
G1 X116.809 Y109.012 E.0134
G1 X142.608 Y109.012 E.85244
M106 S239.7
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X140.608 Y109.012 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 127/135
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
G3 Z16.6 I-.736 J-.969 P1  F30000
G1 X115.615 Y128 Z16.6
G1 Z16.4
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
G1 F9000
G1 X115.711 Y128 E.00298
G1 X115.711 Y128.929 E.02855
G1 X116.089 Y129.248 E.0152
G1 X143.911 Y129.248 E.85489
G1 X144.289 Y128.929 E.0152
G1 X144.289 Y128 E.02855
G1 X144.385 Y128 E.00298
G1 X144.385 Y130.877 E.0884
G1 X144.289 Y130.877 E.00298
G1 X144.289 Y130.071 E.02477
G1 X143.911 Y129.752 E.0152
G1 X116.089 Y129.752 E.85489
G1 X115.711 Y130.071 E.0152
G1 X115.711 Y130.877 E.02477
G1 X115.615 Y130.877 E.00298
; WIPE_START
G1 F24000
G1 X115.711 Y130.877 E-.03681
G1 X115.711 Y130.071 E-.3063
G1 X116.089 Y129.752 E-.18795
G1 X116.692 Y129.752 E-.22894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I-.053 J1.216 P1  F30000
G1 X143.148 Y130.896 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.148 Y132.398 E.04982
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y130.896 E.04982
G1 X143.088 Y130.896 E.87029
G1 X143.54 Y130.733 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.54 Y132.79 E.06321
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y130.733 E.06321
G1 X116.46 Y130.569 E.00504
M106 S255
G1 F1800
G1 X116.46 Y130.504 E.00199
G1 X143.54 Y130.504 E.83209
G1 X143.54 Y130.569 E.00199
M106 S252.45
G1 F12000
G1 X143.54 Y130.673 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X143.54 Y132.673 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I.064 J-1.215 P1  F30000
G1 X117.244 Y131.288 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X117.244 Y132.006 E.02205
G1 X142.756 Y132.006 E.7839
G1 X142.756 Y131.288 E.02205
G1 X117.304 Y131.288 E.78206
G1 X117.603 Y131.647 F30000
; LINE_WIDTH: 0.38344
G1 F15000
G1 X142.337 Y131.647 E.68632
; WIPE_START
G1 F24000
G1 X140.337 Y131.647 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I.953 J.756 P1  F30000
G1 X143.148 Y128.104 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.852 Y128.104 E.87228
G1 X116.852 Y123.602 E.14933
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y128.044 E.14734
G1 X143.54 Y128.267 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.54 Y128.431 E.00504
M106 S255
G1 F1800
G1 X143.54 Y128.496 E.00199
G1 X116.46 Y128.496 E.83209
G1 X116.46 Y128.431 E.00199
M106 S252.45
G1 F12000
G1 X116.46 Y128.267 E.00504
G1 X116.46 Y123.21 E.15539
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y128.207 E.15355
M204 S10000
; WIPE_START
G1 F24000
G1 X143.54 Y128.431 E-.08512
G1 X143.54 Y128.496 E-.02461
G1 X141.829 Y128.496 E-.65027
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I.141 J-1.209 P1  F30000
G1 X119.103 Y125.853 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.36681
G1 F15000
M73 P91 R2
G1 X140.837 Y125.853 E.57363
G1 X141.248 Y126.203 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X141.248 Y125.502 E.02154
G1 X118.752 Y125.502 E.69121
G1 X118.752 Y126.203 E.02154
G1 X141.188 Y126.203 E.68937
G1 X141.625 Y126.581 F30000
G1 F15000
G1 X141.625 Y125.125 E.04471
G1 X118.375 Y125.125 E.71438
G1 X118.375 Y126.581 E.04471
G1 X141.565 Y126.581 E.71254
G1 X142.002 Y126.958 F30000
G1 F15000
G1 X142.002 Y124.748 E.06789
G1 X117.998 Y124.748 E.73756
G1 X117.998 Y126.958 E.06789
G1 X141.942 Y126.958 E.73571
G1 X142.379 Y127.335 F30000
G1 F15000
G1 X142.379 Y124.371 E.09106
G1 X117.621 Y124.371 E.76073
G1 X117.621 Y127.335 E.09106
G1 X142.319 Y127.335 E.75889
G1 X142.756 Y127.712 F30000
G1 F15000
G1 X142.756 Y123.994 E.11423
G1 X117.244 Y123.994 E.7839
G1 X117.244 Y127.712 E.11423
G1 X142.696 Y127.712 E.78206
; WIPE_START
G1 F24000
G1 X140.696 Y127.712 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I1.199 J.207 P1  F30000
G1 X142.771 Y115.665 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X142.771 Y117.167 E.04982
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y115.665 E.04982
G1 X142.711 Y115.665 E.87029
G1 X143.163 Y115.502 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.163 Y117.559 E.06321
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.502 E.06321
G1 X116.083 Y115.338 E.00504
M106 S255
G1 F1800
G1 X116.083 Y115.273 E.00199
G1 X143.163 Y115.273 E.83209
G1 X143.163 Y115.338 E.00199
M106 S252.45
G1 F12000
G1 X143.163 Y115.442 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X143.163 Y117.442 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I.064 J-1.215 P1  F30000
G1 X116.868 Y116.057 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X116.868 Y116.775 E.02205
G1 X142.379 Y116.775 E.7839
G1 X142.379 Y116.057 E.02205
G1 X116.928 Y116.057 E.78206
G1 X117.226 Y116.416 F30000
; LINE_WIDTH: 0.38344
G1 F15000
G1 X141.96 Y116.416 E.68632
; WIPE_START
G1 F24000
G1 X139.96 Y116.416 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I.953 J.756 P1  F30000
G1 X142.771 Y112.873 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.476 Y112.873 E.87228
G1 X116.476 Y108.371 E.14933
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y112.813 E.14734
G1 X143.163 Y113.036 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.163 Y113.2 E.00504
M106 S255
G1 F1800
G1 X143.163 Y113.265 E.00199
G1 X116.083 Y113.265 E.83209
G1 X116.083 Y113.2 E.00199
M106 S252.45
G1 F12000
G1 X116.083 Y113.036 E.00504
G1 X116.083 Y107.979 E.15539
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y112.976 E.15355
M204 S10000
; WIPE_START
G1 F24000
G1 X143.163 Y113.2 E-.08512
G1 X143.163 Y113.265 E-.02461
G1 X141.452 Y113.265 E-.65027
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I.141 J-1.209 P1  F30000
G1 X118.726 Y110.622 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.36681
G1 F15000
G1 X140.46 Y110.622 E.57363
G1 X140.871 Y110.973 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X140.871 Y110.272 E.02154
G1 X118.376 Y110.272 E.69121
G1 X118.376 Y110.973 E.02154
G1 X140.811 Y110.973 E.68937
G1 X141.248 Y111.35 F30000
G1 F15000
G1 X141.248 Y109.895 E.04471
G1 X117.999 Y109.895 E.71438
G1 X117.999 Y111.35 E.04471
G1 X141.188 Y111.35 E.71254
G1 X141.625 Y111.727 F30000
G1 F15000
G1 X141.625 Y109.518 E.06789
G1 X117.622 Y109.518 E.73756
G1 X117.622 Y111.727 E.06789
G1 X141.565 Y111.727 E.73571
G1 X142.002 Y112.104 F30000
G1 F15000
G1 X142.002 Y109.14 E.09106
G1 X117.245 Y109.14 E.76073
G1 X117.245 Y112.104 E.09106
G1 X141.942 Y112.104 E.75889
G1 X142.379 Y112.481 F30000
G1 F15000
G1 X142.379 Y108.763 E.11423
G1 X116.868 Y108.763 E.7839
G1 X116.868 Y112.481 E.11423
G1 X142.319 Y112.481 E.78206
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X140.319 Y112.481 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 128/135
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
G3 Z16.8 I-1.203 J.186 P1  F30000
G1 X143.148 Y130.742 Z16.8
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12647
G1 X143.148 Y132.398 E.05492
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y130.742 E.05492
G1 X143.088 Y130.742 E.87029
G1 X143.54 Y130.463 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.54 Y132.79 E.0715
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y130.463 E.0715
G1 X116.46 Y130.381 E.00252
G1 F3000
G1 X116.46 Y130.35 E.00095
G1 X143.54 Y130.35 E.83209
G1 X143.54 Y130.381 E.00095
G1 F12000
G1 X143.54 Y130.403 E.00068
M204 S10000
; WIPE_START
G1 F24000
G1 X143.54 Y132.403 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I.705 J-.992 P1  F30000
G1 X142.577 Y131.718 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12647
G1 X142.8 Y131.718 E.00739
G1 X142.8 Y132.05 E.01099
G1 X141.726 Y132.05 E.03563
G1 X141.394 Y131.718 E.01555
G1 X141.634 Y131.718 E.00794
G1 X141.302 Y132.05 E.01555
G1 X134.05 Y132.05 E.24058
G1 X133.718 Y131.718 E.01555
G1 X133.958 Y131.718 E.00794
G1 X133.626 Y132.05 E.01555
G1 X126.374 Y132.05 E.24058
G1 X126.042 Y131.718 E.01555
G1 X126.282 Y131.718 E.00794
G1 X125.95 Y132.05 E.01555
G1 X118.698 Y132.05 E.24058
G1 X118.366 Y131.718 E.01555
G1 X118.606 Y131.718 E.00794
G1 X118.274 Y132.05 E.01555
G1 X117.2 Y132.05 E.03563
G1 X117.2 Y131.718 E.01099
G1 X117.423 Y131.718 E.00739
G1 X117.344 Y131.23 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.611902
G1 F11072.407
G1 X142.6 Y131.23 E1.17098
; WIPE_START
M73 P91 R1
G1 F24000
G1 X140.6 Y131.23 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I.924 J.792 P1  F30000
G1 X143.148 Y128.258 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12647
G1 X116.852 Y128.258 E.87228
G1 X116.852 Y123.602 E.15444
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y128.198 E.15245
G1 X143.54 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X116.46 Y128.65 E.83209
G1 X116.46 Y128.619 E.00095
G1 F12000
G1 X116.46 Y128.537 E.00252
G1 X116.46 Y123.21 E.16368
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y128.537 E.16368
G1 X143.54 Y128.59 E.00163
M204 S10000
; WIPE_START
G1 F24000
G1 X141.54 Y128.594 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I.144 J-1.208 P1  F30000
G1 X119.18 Y125.93 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.520778
G1 F12647
G1 X140.76 Y125.93 E.84032
G1 X118.752 Y126.357 F30000
; LINE_WIDTH: 0.419999
G1 F12647
G1 X141.248 Y126.357 E.69121
G1 X141.248 Y125.502 E.02627
G1 X118.752 Y125.502 E.69121
G1 X118.752 Y126.297 E.02443
G1 X118.375 Y126.734 F30000
G1 F12647
G1 X141.625 Y126.734 E.71438
G1 X141.625 Y125.125 E.04944
G1 X118.375 Y125.125 E.71438
G1 X118.375 Y126.674 E.0476
G1 X117.998 Y127.112 F30000
G1 F12647
G1 X142.002 Y127.112 E.73756
G1 X142.002 Y124.748 E.07262
G1 X117.998 Y124.748 E.73756
G1 X117.998 Y127.052 E.07077
G1 X117.621 Y127.489 F30000
G1 F12647
G1 X142.379 Y127.489 E.76073
G1 X142.379 Y124.371 E.09579
G1 X117.621 Y124.371 E.76073
G1 X117.621 Y127.429 E.09395
G1 X117.244 Y127.866 F30000
G1 F12647
G1 X142.756 Y127.866 E.7839
G1 X142.756 Y123.994 E.11896
G1 X117.244 Y123.994 E.7839
G1 X117.244 Y127.806 E.11712
; WIPE_START
G1 F24000
G1 X117.244 Y125.806 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I.455 J1.129 P1  F30000
G1 X142.771 Y115.511 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12647
G1 X142.771 Y117.167 E.05492
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y115.511 E.05492
G1 X142.711 Y115.511 E.87029
G1 X143.163 Y115.232 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.163 Y117.559 E.0715
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.232 E.0715
G1 X116.083 Y115.15 E.00252
G1 F3000
G1 X116.083 Y115.119 E.00095
G1 X143.163 Y115.119 E.83209
G1 X143.163 Y115.15 E.00095
M73 P92 R1
G1 F12000
G1 X143.163 Y115.172 E.00068
M204 S10000
; WIPE_START
G1 F24000
G1 X143.163 Y117.172 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I.705 J-.992 P1  F30000
G1 X142.2 Y116.488 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12647
G1 X142.423 Y116.488 E.00739
G1 X142.423 Y116.819 E.01099
G1 X141.349 Y116.819 E.03563
G1 X141.018 Y116.488 E.01555
G1 X141.257 Y116.488 E.00794
G1 X140.926 Y116.819 E.01555
G1 X133.673 Y116.819 E.24058
G1 X133.342 Y116.488 E.01555
G1 X133.581 Y116.488 E.00794
G1 X133.25 Y116.819 E.01555
G1 X125.997 Y116.819 E.24058
G1 X125.666 Y116.488 E.01555
G1 X125.905 Y116.488 E.00794
G1 X125.574 Y116.819 E.01555
G1 X118.321 Y116.819 E.24058
G1 X117.99 Y116.488 E.01555
G1 X118.229 Y116.488 E.00794
G1 X117.898 Y116.819 E.01555
G1 X116.824 Y116.819 E.03563
G1 X116.824 Y116.488 E.01099
G1 X117.047 Y116.488 E.00739
G1 X116.968 Y115.999 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.611902
G1 F11072.407
G1 X142.223 Y115.999 E1.17098
; WIPE_START
G1 F24000
G1 X140.223 Y115.999 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I.924 J.792 P1  F30000
G1 X142.771 Y113.027 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12647
G1 X116.476 Y113.027 E.87228
G1 X116.476 Y108.371 E.15444
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y112.967 E.15245
G1 X143.163 Y113.419 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X116.083 Y113.419 E.83209
G1 X116.083 Y113.388 E.00095
G1 F12000
G1 X116.083 Y113.306 E.00252
G1 X116.083 Y107.979 E.16368
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y113.306 E.16368
G1 X143.163 Y113.359 E.00163
M204 S10000
; WIPE_START
G1 F24000
G1 X141.163 Y113.364 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I.144 J-1.208 P1  F30000
G1 X118.803 Y110.699 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.520778
G1 F12647
G1 X140.383 Y110.699 E.84032
G1 X118.376 Y111.127 F30000
; LINE_WIDTH: 0.419999
G1 F12647
G1 X140.871 Y111.127 E.69121
G1 X140.871 Y110.272 E.02627
G1 X118.376 Y110.272 E.69121
G1 X118.376 Y111.067 E.02443
G1 X117.999 Y111.504 F30000
G1 F12647
G1 X141.248 Y111.504 E.71438
G1 X141.248 Y109.895 E.04944
G1 X117.999 Y109.895 E.71438
G1 X117.999 Y111.444 E.0476
G1 X117.622 Y111.881 F30000
G1 F12647
G1 X141.625 Y111.881 E.73756
G1 X141.625 Y109.518 E.07262
G1 X117.622 Y109.518 E.73756
G1 X117.622 Y111.821 E.07077
G1 X117.245 Y112.258 F30000
G1 F12647
G1 X142.002 Y112.258 E.76073
G1 X142.002 Y109.14 E.09579
G1 X117.245 Y109.14 E.76073
G1 X117.245 Y112.198 E.09395
G1 X116.868 Y112.635 F30000
G1 F12647
G1 X142.379 Y112.635 E.7839
G1 X142.379 Y108.763 E.11896
G1 X116.868 Y108.763 E.7839
G1 X116.868 Y112.575 E.11712
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X116.868 Y110.575 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 129/135
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
G3 Z17 I-.739 J.967 P1  F30000
G1 X143.148 Y130.654 Z17
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6127
G1 X143.148 Y132.398 E.05785
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y130.654 E.05785
G1 X143.088 Y130.654 E.87029
G1 X143.54 Y130.309 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6127
G1 X143.54 Y132.79 E.07623
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y130.309 E.07623
G1 X116.46 Y130.262 E.00145
G1 X143.527 Y130.262 E.8317
M204 S10000
; WIPE_START
G1 F24000
G1 X143.537 Y132.262 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I.289 J-1.182 P1  F30000
G1 X142.669 Y132.05 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6127
G1 X142.8 Y132.05 E.00434
G1 X142.8 Y131.002 E.03475
G1 X142.35 Y131.002 E.01493
G1 X141.302 Y132.05 E.04914
G1 X141.726 Y132.05 E.01404
G1 X140.678 Y131.002 E.04914
G1 X134.674 Y131.002 E.19918
G1 X133.626 Y132.05 E.04914
G1 X134.05 Y132.05 E.01404
G1 X133.002 Y131.002 E.04914
G1 X126.998 Y131.002 E.19918
G1 X125.95 Y132.05 E.04914
G1 X126.374 Y132.05 E.01404
G1 X125.326 Y131.002 E.04914
G1 X119.322 Y131.002 E.19918
G1 X118.274 Y132.05 E.04914
G1 X118.698 Y132.05 E.01404
G1 X117.65 Y131.002 E.04914
G1 X117.2 Y131.002 E.01493
G1 X117.2 Y132.05 E.03475
G1 X117.331 Y132.05 E.00434
; WIPE_START
G1 F24000
G1 X117.2 Y132.05 E-.04975
G1 X117.2 Y131.002 E-.39803
G1 X117.65 Y131.002 E-.17098
G1 X117.913 Y131.265 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I.14 J1.209 P1  F30000
G1 X143.148 Y128.346 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6127
G1 X116.852 Y128.346 E.87228
G1 X116.852 Y123.602 E.15737
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y128.286 E.15538
G1 X143.54 Y128.691 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6127
G1 X143.54 Y128.738 E.00145
G1 X116.46 Y128.738 E.83209
G1 X116.46 Y128.691 E.00145
G1 X116.46 Y123.21 E.16841
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y128.631 E.16657
M204 S10000
; WIPE_START
G1 F24000
G1 X143.54 Y128.738 E-.04075
G1 X141.647 Y128.738 E-.71925
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I.71 J.988 P1  F30000
G1 X142.8 Y127.91 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6127
G1 X117.2 Y127.91 E.84918
G1 X117.2 Y124.091 E.12667
G1 X142.8 Y124.091 E.84918
G1 X142.8 Y127.85 E.12468
G1 X142.393 Y126.669 F30000
G1 F6127
G1 X142.393 Y125.041 E.05401
G1 X141.85 Y124.498 E.02546
G1 X141.178 Y124.498 E.02229
G1 X138.174 Y127.502 E.14094
G1 X137.178 Y127.502 E.03301
G1 X134.174 Y124.498 E.14094
G1 X133.502 Y124.498 E.02229
G1 X130.498 Y127.502 E.14094
G1 X129.502 Y127.502 E.03301
G1 X126.498 Y124.498 E.14094
G1 X125.826 Y124.498 E.02229
G1 X122.822 Y127.502 E.14094
G1 X121.826 Y127.502 E.03301
G1 X118.822 Y124.498 E.14094
G1 X118.15 Y124.498 E.02229
G1 X117.607 Y125.041 E.02546
G1 X117.607 Y126.669 E.05401
; WIPE_START
G1 F24000
G1 X117.607 Y125.041 E-.61876
G1 X117.87 Y124.778 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I.428 J1.139 P1  F30000
G1 X142.771 Y115.423 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6127
G1 X142.771 Y117.167 E.05785
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y115.423 E.05785
G1 X142.711 Y115.423 E.87029
G1 X143.163 Y115.078 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6127
G1 X143.163 Y117.559 E.07623
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y115.078 E.07623
G1 X116.083 Y115.031 E.00145
G1 X143.151 Y115.031 E.8317
M204 S10000
; WIPE_START
G1 F24000
G1 X143.161 Y117.031 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I.289 J-1.182 P1  F30000
G1 X142.292 Y116.819 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6127
G1 X142.423 Y116.819 E.00434
G1 X142.423 Y115.771 E.03475
G1 X141.973 Y115.771 E.01493
G1 X140.926 Y116.819 E.04914
G1 X141.349 Y116.819 E.01404
G1 X140.302 Y115.771 E.04914
G1 X134.297 Y115.771 E.19918
G1 X133.25 Y116.819 E.04914
G1 X133.673 Y116.819 E.01404
G1 X132.626 Y115.771 E.04914
G1 X126.621 Y115.771 E.19918
G1 X125.574 Y116.819 E.04914
G1 X125.997 Y116.819 E.01404
G1 X124.95 Y115.771 E.04914
G1 X118.945 Y115.771 E.19918
G1 X117.898 Y116.819 E.04914
G1 X118.321 Y116.819 E.01404
G1 X117.274 Y115.771 E.04914
G1 X116.824 Y115.771 E.01493
G1 X116.824 Y116.819 E.03475
G1 X116.955 Y116.819 E.00434
; WIPE_START
G1 F24000
G1 X116.824 Y116.819 E-.04975
G1 X116.824 Y115.771 E-.39803
G1 X117.274 Y115.771 E-.17098
G1 X117.537 Y116.034 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I.14 J1.209 P1  F30000
G1 X142.771 Y113.115 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6127
G1 X116.476 Y113.115 E.87228
G1 X116.476 Y108.371 E.15737
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y113.055 E.15538
G1 X143.163 Y113.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6127
G1 X143.163 Y113.507 E.00145
G1 X116.083 Y113.507 E.83209
G1 X116.083 Y113.46 E.00145
G1 X116.083 Y107.979 E.16841
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y113.4 E.16657
M204 S10000
; WIPE_START
G1 F24000
G1 X143.163 Y113.507 E-.04075
G1 X141.271 Y113.507 E-.71925
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I.71 J.988 P1  F30000
G1 X142.423 Y112.679 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6127
G1 X116.824 Y112.679 E.84918
G1 X116.824 Y108.86 E.12667
G1 X142.423 Y108.86 E.84918
M73 P93 R1
G1 X142.423 Y112.619 E.12468
G1 X142.016 Y111.438 F30000
G1 F6127
G1 X142.016 Y109.81 E.05401
G1 X141.473 Y109.267 E.02546
G1 X140.801 Y109.267 E.02229
G1 X137.797 Y112.272 E.14094
G1 X136.802 Y112.272 E.03301
G1 X133.797 Y109.267 E.14094
G1 X133.125 Y109.267 E.02229
G1 X130.121 Y112.272 E.14094
G1 X129.126 Y112.272 E.03301
G1 X126.121 Y109.267 E.14094
G1 X125.449 Y109.267 E.02229
G1 X122.445 Y112.272 E.14094
G1 X121.45 Y112.272 E.03301
G1 X118.445 Y109.267 E.14094
G1 X117.773 Y109.267 E.02229
G1 X117.231 Y109.81 E.02546
G1 X117.231 Y111.438 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X117.231 Y109.81 E-.61876
G1 X117.494 Y109.547 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 130/135
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
G3 Z17.2 I-.772 J.941 P1  F30000
G1 X143.148 Y130.613 Z17.2
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6136
G1 X143.148 Y132.398 E.0592
G1 X116.852 Y132.398 E.87228
G1 X116.852 Y130.613 E.0592
G1 X143.088 Y130.613 E.87029
G1 X143.54 Y130.221 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6136
G1 X143.54 Y132.79 E.07893
G1 X116.46 Y132.79 E.83209
G1 X116.46 Y130.221 E.07893
G1 X143.48 Y130.221 E.83025
M204 S10000
; WIPE_START
G1 F24000
G1 X143.527 Y132.221 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I.238 J-1.194 P1  F30000
G1 X142.669 Y132.05 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6136
G1 X142.8 Y132.05 E.00434
G1 X142.8 Y130.961 E.0361
G1 X142.39 Y130.961 E.01357
G1 X141.302 Y132.05 E.05105
G1 X141.726 Y132.05 E.01404
G1 X140.637 Y130.961 E.05105
G1 X134.714 Y130.961 E.19648
G1 X133.626 Y132.05 E.05105
G1 X134.05 Y132.05 E.01404
G1 X132.961 Y130.961 E.05105
G1 X127.039 Y130.961 E.19648
G1 X125.95 Y132.05 E.05105
G1 X126.374 Y132.05 E.01404
G1 X125.286 Y130.961 E.05105
G1 X119.363 Y130.961 E.19648
G1 X118.274 Y132.05 E.05105
G1 X118.698 Y132.05 E.01404
G1 X117.61 Y130.961 E.05105
G1 X117.2 Y130.961 E.01357
G1 X117.2 Y132.05 E.0361
G1 X117.331 Y132.05 E.00434
; WIPE_START
G1 F24000
G1 X117.2 Y132.05 E-.04975
G1 X117.2 Y130.961 E-.41351
G1 X117.61 Y130.961 E-.15551
G1 X117.872 Y131.224 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I.136 J1.209 P1  F30000
G1 X143.148 Y128.387 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6136
G1 X116.852 Y128.387 E.87228
G1 X116.852 Y123.602 E.15872
G1 X143.148 Y123.602 E.87228
G1 X143.148 Y128.327 E.15673
G1 X143.54 Y128.779 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6136
G1 X116.46 Y128.779 E.83209
G1 X116.46 Y123.21 E.17112
G1 X143.54 Y123.21 E.83209
G1 X143.54 Y128.719 E.16927
M204 S10000
; WIPE_START
G1 F24000
G1 X141.54 Y128.723 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I.66 J1.022 P1  F30000
G1 X142.8 Y127.91 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6136
G1 X117.2 Y127.91 E.84918
G1 X117.2 Y124.091 E.12667
G1 X142.8 Y124.091 E.84918
G1 X142.8 Y127.85 E.12468
G1 X142.393 Y126.669 F30000
G1 F6136
G1 X142.393 Y125.041 E.05401
G1 X141.85 Y124.498 E.02546
G1 X141.178 Y124.498 E.02229
G1 X138.174 Y127.502 E.14094
G1 X137.178 Y127.502 E.03301
G1 X134.174 Y124.498 E.14094
G1 X133.502 Y124.498 E.02229
G1 X130.498 Y127.502 E.14094
G1 X129.502 Y127.502 E.03301
G1 X126.498 Y124.498 E.14094
G1 X125.826 Y124.498 E.02229
G1 X122.822 Y127.502 E.14094
G1 X121.826 Y127.502 E.03301
G1 X118.822 Y124.498 E.14094
G1 X118.15 Y124.498 E.02229
G1 X117.607 Y125.041 E.02546
G1 X117.607 Y126.669 E.05401
; WIPE_START
G1 F24000
G1 X117.607 Y125.041 E-.61876
G1 X117.87 Y124.778 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I.43 J1.139 P1  F30000
G1 X142.771 Y115.382 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6136
G1 X142.771 Y117.167 E.0592
G1 X116.476 Y117.167 E.87228
G1 X116.476 Y115.382 E.0592
G1 X142.711 Y115.382 E.87029
G1 X143.163 Y114.99 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6136
G1 X143.163 Y117.559 E.07893
G1 X116.083 Y117.559 E.83209
G1 X116.083 Y114.99 E.07893
G1 X143.103 Y114.99 E.83025
M204 S10000
; WIPE_START
G1 F24000
G1 X143.15 Y116.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I.238 J-1.194 P1  F30000
G1 X142.292 Y116.819 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6136
G1 X142.423 Y116.819 E.00434
G1 X142.423 Y115.731 E.0361
G1 X142.014 Y115.731 E.01357
G1 X140.926 Y116.819 E.05105
G1 X141.349 Y116.819 E.01404
G1 X140.261 Y115.731 E.05105
G1 X134.338 Y115.731 E.19648
G1 X133.25 Y116.819 E.05105
G1 X133.673 Y116.819 E.01404
G1 X132.585 Y115.731 E.05105
G1 X126.662 Y115.731 E.19648
G1 X125.574 Y116.819 E.05105
G1 X125.997 Y116.819 E.01404
G1 X124.909 Y115.731 E.05105
G1 X118.986 Y115.731 E.19648
G1 X117.898 Y116.819 E.05105
G1 X118.321 Y116.819 E.01404
G1 X117.233 Y115.731 E.05105
G1 X116.824 Y115.731 E.01357
G1 X116.824 Y116.819 E.0361
G1 X116.955 Y116.819 E.00434
; WIPE_START
G1 F24000
G1 X116.824 Y116.819 E-.04975
G1 X116.824 Y115.731 E-.41351
G1 X117.233 Y115.731 E-.15551
G1 X117.496 Y115.994 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I.136 J1.209 P1  F30000
G1 X142.771 Y113.156 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6136
G1 X116.476 Y113.156 E.87228
G1 X116.476 Y108.371 E.15872
G1 X142.771 Y108.371 E.87228
G1 X142.771 Y113.096 E.15673
G1 X143.163 Y113.548 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6136
G1 X116.083 Y113.548 E.83209
G1 X116.083 Y107.979 E.17112
G1 X143.163 Y107.979 E.83209
G1 X143.163 Y113.488 E.16927
M204 S10000
; WIPE_START
G1 F24000
G1 X141.163 Y113.493 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I.66 J1.022 P1  F30000
G1 X142.423 Y112.679 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6136
G1 X116.824 Y112.679 E.84918
G1 X116.824 Y108.86 E.12667
G1 X142.423 Y108.86 E.84918
G1 X142.423 Y112.619 E.12468
G1 X142.016 Y111.438 F30000
G1 F6136
G1 X142.016 Y109.81 E.05401
G1 X141.473 Y109.267 E.02546
G1 X140.801 Y109.267 E.02229
G1 X137.797 Y112.272 E.14094
G1 X136.802 Y112.272 E.03301
G1 X133.797 Y109.267 E.14094
G1 X133.125 Y109.267 E.02229
G1 X130.121 Y112.272 E.14094
G1 X129.126 Y112.272 E.03301
G1 X126.121 Y109.267 E.14094
G1 X125.449 Y109.267 E.02229
G1 X122.445 Y112.272 E.14094
G1 X121.45 Y112.272 E.03301
G1 X118.445 Y109.267 E.14094
G1 X117.773 Y109.267 E.02229
G1 X117.231 Y109.81 E.02546
G1 X117.231 Y111.438 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X117.231 Y109.81 E-.61876
G1 X117.494 Y109.547 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 131/135
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
G3 Z17.4 I-.772 J.941 P1  F30000
G1 X143.148 Y130.613 Z17.4
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6130
G1 X143.148 Y132.387 E.05883
G1 X116.852 Y132.387 E.87228
G1 X116.852 Y130.613 E.05883
G1 X143.088 Y130.613 E.87029
G1 X143.54 Y130.221 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6130
G1 X143.54 Y132.779 E.07859
G1 X116.46 Y132.779 E.83209
G1 X116.46 Y130.221 E.07859
G1 X143.48 Y130.221 E.83025
M204 S10000
; WIPE_START
G1 F24000
G1 X143.527 Y132.221 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I.25 J-1.191 P1  F30000
G1 X142.657 Y132.038 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6130
G1 X142.8 Y132.038 E.00472
G1 X142.8 Y130.961 E.03572
G1 X142.39 Y130.961 E.01357
G1 X141.314 Y132.038 E.05052
G1 X141.714 Y132.038 E.0133
G1 X140.637 Y130.961 E.05052
G1 X134.714 Y130.961 E.19648
G1 X133.638 Y132.038 E.05052
G1 X134.038 Y132.038 E.0133
G1 X132.961 Y130.961 E.05052
G1 X127.039 Y130.961 E.19648
G1 X125.962 Y132.038 E.05052
G1 X126.362 Y132.038 E.0133
G1 X125.286 Y130.961 E.05052
G1 X119.363 Y130.961 E.19648
G1 X118.286 Y132.038 E.05052
G1 X118.686 Y132.038 E.0133
G1 X117.61 Y130.961 E.05052
G1 X117.2 Y130.961 E.01357
G1 X117.2 Y132.038 E.03572
G1 X117.343 Y132.038 E.00472
; WIPE_START
G1 F24000
G1 X117.2 Y132.038 E-.05403
G1 X117.2 Y130.961 E-.40922
G1 X117.61 Y130.961 E-.15551
G1 X117.872 Y131.224 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I.136 J1.209 P1  F30000
G1 X143.148 Y128.387 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6130
G1 X116.852 Y128.387 E.87228
G1 X116.852 Y123.613 E.15834
G1 X143.148 Y123.613 E.87228
G1 X143.148 Y128.327 E.15635
G1 X143.54 Y128.779 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6130
M73 P94 R1
G1 X116.46 Y128.779 E.83209
G1 X116.46 Y123.221 E.17077
G1 X143.54 Y123.221 E.83209
G1 X143.54 Y128.719 E.16893
M204 S10000
; WIPE_START
G1 F24000
G1 X141.54 Y128.723 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I.66 J1.022 P1  F30000
G1 X142.8 Y127.91 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6130
G1 X117.2 Y127.91 E.84918
G1 X117.2 Y124.091 E.12667
G1 X142.8 Y124.091 E.84918
G1 X142.8 Y127.85 E.12468
G1 X142.393 Y126.669 F30000
G1 F6130
G1 X142.393 Y125.041 E.05401
G1 X141.85 Y124.498 E.02546
G1 X141.178 Y124.498 E.02229
G1 X138.174 Y127.502 E.14094
G1 X137.178 Y127.502 E.03301
G1 X134.174 Y124.498 E.14094
G1 X133.502 Y124.498 E.02229
G1 X130.498 Y127.502 E.14094
G1 X129.502 Y127.502 E.03301
G1 X126.498 Y124.498 E.14094
G1 X125.826 Y124.498 E.02229
G1 X122.822 Y127.502 E.14094
G1 X121.826 Y127.502 E.03301
G1 X118.822 Y124.498 E.14094
G1 X118.15 Y124.498 E.02229
G1 X117.607 Y125.041 E.02546
G1 X117.607 Y126.669 E.05401
; WIPE_START
G1 F24000
G1 X117.607 Y125.041 E-.61876
G1 X117.87 Y124.778 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I.43 J1.139 P1  F30000
G1 X142.771 Y115.382 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6130
G1 X142.771 Y117.156 E.05883
G1 X116.476 Y117.156 E.87228
G1 X116.476 Y115.382 E.05883
G1 X142.711 Y115.382 E.87029
G1 X143.163 Y114.99 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6130
G1 X143.163 Y117.548 E.07859
G1 X116.083 Y117.548 E.83209
G1 X116.083 Y114.99 E.07859
G1 X143.103 Y114.99 E.83025
M204 S10000
; WIPE_START
G1 F24000
G1 X143.15 Y116.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I.25 J-1.191 P1  F30000
G1 X142.281 Y116.808 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6130
G1 X142.423 Y116.808 E.00472
G1 X142.423 Y115.731 E.03572
G1 X142.014 Y115.731 E.01357
G1 X140.937 Y116.808 E.05052
G1 X141.338 Y116.808 E.0133
G1 X140.261 Y115.731 E.05052
G1 X134.338 Y115.731 E.19648
G1 X133.261 Y116.808 E.05052
G1 X133.662 Y116.808 E.0133
G1 X132.585 Y115.731 E.05052
G1 X126.662 Y115.731 E.19648
G1 X125.585 Y116.808 E.05052
G1 X125.986 Y116.808 E.0133
G1 X124.909 Y115.731 E.05052
G1 X118.986 Y115.731 E.19648
G1 X117.909 Y116.808 E.05052
G1 X118.31 Y116.808 E.0133
G1 X117.233 Y115.731 E.05052
G1 X116.824 Y115.731 E.01357
G1 X116.824 Y116.808 E.03572
G1 X116.966 Y116.808 E.00472
; WIPE_START
G1 F24000
G1 X116.824 Y116.808 E-.05403
G1 X116.824 Y115.731 E-.40922
G1 X117.233 Y115.731 E-.15551
G1 X117.496 Y115.994 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I.136 J1.209 P1  F30000
G1 X142.771 Y113.156 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6130
G1 X116.476 Y113.156 E.87228
G1 X116.476 Y108.383 E.15834
G1 X142.771 Y108.383 E.87228
G1 X142.771 Y113.096 E.15635
G1 X143.163 Y113.548 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6130
G1 X116.083 Y113.548 E.83209
G1 X116.083 Y107.991 E.17077
G1 X143.163 Y107.991 E.83209
G1 X143.163 Y113.488 E.16893
M204 S10000
; WIPE_START
G1 F24000
G1 X141.163 Y113.493 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I.66 J1.022 P1  F30000
G1 X142.423 Y112.679 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6130
G1 X116.824 Y112.679 E.84918
G1 X116.824 Y108.86 E.12667
G1 X142.423 Y108.86 E.84918
G1 X142.423 Y112.619 E.12468
G1 X142.016 Y111.438 F30000
G1 F6130
G1 X142.016 Y109.81 E.05401
G1 X141.473 Y109.267 E.02546
G1 X140.801 Y109.267 E.02229
G1 X137.797 Y112.272 E.14094
G1 X136.802 Y112.272 E.03301
G1 X133.797 Y109.267 E.14094
G1 X133.125 Y109.267 E.02229
G1 X130.121 Y112.272 E.14094
G1 X129.126 Y112.272 E.03301
G1 X126.121 Y109.267 E.14094
G1 X125.449 Y109.267 E.02229
G1 X122.445 Y112.272 E.14094
G1 X121.45 Y112.272 E.03301
G1 X118.445 Y109.267 E.14094
G1 X117.773 Y109.267 E.02229
G1 X117.231 Y109.81 E.02546
G1 X117.231 Y111.438 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X117.231 Y109.81 E-.61876
G1 X117.494 Y109.547 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 132/135
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
G3 Z17.6 I-.773 J.94 P1  F30000
G1 X143.148 Y130.654 Z17.6
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6103
G1 X143.148 Y132.346 E.05612
G1 X116.852 Y132.346 E.87228
G1 X116.852 Y130.654 E.05612
G1 X143.088 Y130.654 E.87029
G1 X143.54 Y130.262 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6103
G1 X143.54 Y132.738 E.07608
G1 X116.46 Y132.738 E.83209
G1 X116.46 Y130.262 E.07608
G1 X143.48 Y130.262 E.83025
M204 S10000
; WIPE_START
G1 F24000
G1 X143.528 Y132.261 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I.338 J-1.169 P1  F30000
G1 X142.617 Y131.997 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6103
G1 X142.8 Y131.997 E.00607
G1 X142.8 Y131.002 E.03301
G1 X142.35 Y131.002 E.01493
G1 X141.354 Y131.997 E.04669
G1 X141.673 Y131.997 E.01058
G1 X140.678 Y131.002 E.04669
G1 X134.674 Y131.002 E.19918
G1 X133.678 Y131.997 E.04669
G1 X133.997 Y131.997 E.01058
G1 X133.002 Y131.002 E.04669
G1 X126.998 Y131.002 E.19918
G1 X126.003 Y131.997 E.04669
G1 X126.322 Y131.997 E.01058
G1 X125.326 Y131.002 E.04669
G1 X119.322 Y131.002 E.19918
G1 X118.327 Y131.997 E.04669
G1 X118.646 Y131.997 E.01058
G1 X117.65 Y131.002 E.04669
G1 X117.2 Y131.002 E.01493
G1 X117.2 Y131.997 E.03301
G1 X117.383 Y131.997 E.00607
; WIPE_START
G1 F24000
G1 X117.2 Y131.997 E-.06958
G1 X117.2 Y131.002 E-.3782
G1 X117.65 Y131.002 E-.17098
G1 X117.913 Y131.265 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I.14 J1.209 P1  F30000
G1 X143.148 Y128.346 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6103
G1 X116.852 Y128.346 E.87228
G1 X116.852 Y123.654 E.15563
G1 X143.148 Y123.654 E.87228
G1 X143.148 Y128.286 E.15364
G1 X143.54 Y128.738 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6103
G1 X116.46 Y128.738 E.83209
G1 X116.46 Y123.262 E.16826
G1 X143.54 Y123.262 E.83209
G1 X143.54 Y128.678 E.16642
M204 S10000
; WIPE_START
G1 F24000
G1 X141.54 Y128.683 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I.637 J1.037 P1  F30000
G1 X142.8 Y127.91 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6103
G1 X117.2 Y127.91 E.84918
G1 X117.2 Y124.091 E.12667
G1 X142.8 Y124.091 E.84918
G1 X142.8 Y127.85 E.12468
G1 X142.393 Y126.669 F30000
G1 F6103
G1 X142.393 Y125.041 E.05401
G1 X141.85 Y124.498 E.02546
G1 X141.178 Y124.498 E.02229
G1 X138.174 Y127.502 E.14094
G1 X137.178 Y127.502 E.03301
G1 X134.174 Y124.498 E.14094
G1 X133.502 Y124.498 E.02229
G1 X130.498 Y127.502 E.14094
G1 X129.502 Y127.502 E.03301
G1 X126.498 Y124.498 E.14094
G1 X125.826 Y124.498 E.02229
G1 X122.822 Y127.502 E.14094
G1 X121.826 Y127.502 E.03301
G1 X118.822 Y124.498 E.14094
G1 X118.15 Y124.498 E.02229
G1 X117.607 Y125.041 E.02546
G1 X117.607 Y126.669 E.05401
; WIPE_START
G1 F24000
G1 X117.607 Y125.041 E-.61876
G1 X117.87 Y124.778 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I.428 J1.139 P1  F30000
G1 X142.771 Y115.423 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6103
G1 X142.771 Y117.115 E.05612
G1 X116.476 Y117.115 E.87228
G1 X116.476 Y115.423 E.05612
G1 X142.711 Y115.423 E.87029
G1 X143.163 Y115.031 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6103
G1 X143.163 Y117.507 E.07608
G1 X116.083 Y117.507 E.83209
G1 X116.083 Y115.031 E.07608
G1 X143.103 Y115.031 E.83025
M204 S10000
; WIPE_START
G1 F24000
G1 X143.152 Y117.031 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I.338 J-1.169 P1  F30000
G1 X142.24 Y116.767 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6103
G1 X142.423 Y116.767 E.00607
G1 X142.423 Y115.771 E.03301
G1 X141.973 Y115.771 E.01493
G1 X140.978 Y116.767 E.04669
G1 X141.297 Y116.767 E.01058
G1 X140.302 Y115.771 E.04669
G1 X134.297 Y115.771 E.19918
G1 X133.302 Y116.767 E.04669
G1 X133.621 Y116.767 E.01058
G1 X132.626 Y115.771 E.04669
G1 X126.621 Y115.771 E.19918
G1 X125.626 Y116.767 E.04669
G1 X125.945 Y116.767 E.01058
G1 X124.95 Y115.771 E.04669
G1 X118.945 Y115.771 E.19918
M73 P95 R1
G1 X117.95 Y116.767 E.04669
G1 X118.269 Y116.767 E.01058
G1 X117.274 Y115.771 E.04669
G1 X116.824 Y115.771 E.01493
G1 X116.824 Y116.767 E.03301
G1 X117.007 Y116.767 E.00607
; WIPE_START
G1 F24000
G1 X116.824 Y116.767 E-.06958
G1 X116.824 Y115.771 E-.3782
G1 X117.274 Y115.771 E-.17098
G1 X117.537 Y116.034 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I.14 J1.209 P1  F30000
G1 X142.771 Y113.115 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6103
G1 X116.476 Y113.115 E.87228
G1 X116.476 Y108.424 E.15563
G1 X142.771 Y108.424 E.87228
G1 X142.771 Y113.055 E.15364
G1 X143.163 Y113.507 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6103
G1 X116.083 Y113.507 E.83209
G1 X116.083 Y108.031 E.16826
G1 X143.163 Y108.031 E.83209
G1 X143.163 Y113.447 E.16642
M204 S10000
; WIPE_START
G1 F24000
G1 X141.163 Y113.452 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I.637 J1.037 P1  F30000
G1 X142.423 Y112.679 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6103
G1 X116.824 Y112.679 E.84918
G1 X116.824 Y108.86 E.12667
G1 X142.423 Y108.86 E.84918
G1 X142.423 Y112.619 E.12468
G1 X142.016 Y111.438 F30000
G1 F6103
G1 X142.016 Y109.81 E.05401
G1 X141.473 Y109.267 E.02546
G1 X140.801 Y109.267 E.02229
G1 X137.797 Y112.272 E.14094
G1 X136.802 Y112.272 E.03301
G1 X133.797 Y109.267 E.14094
G1 X133.125 Y109.267 E.02229
G1 X130.121 Y112.272 E.14094
G1 X129.126 Y112.272 E.03301
G1 X126.121 Y109.267 E.14094
G1 X125.449 Y109.267 E.02229
G1 X122.445 Y112.272 E.14094
G1 X121.45 Y112.272 E.03301
G1 X118.445 Y109.267 E.14094
G1 X117.773 Y109.267 E.02229
G1 X117.231 Y109.81 E.02546
G1 X117.231 Y111.438 E.05401
M106 S244.8
; CHANGE_LAYER
; Z_HEIGHT: 17.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X117.231 Y109.81 E-.61876
G1 X117.494 Y109.547 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 133/135
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
G3 Z17.8 I-.775 J.938 P1  F30000
G1 X143.148 Y130.742 Z17.8
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X143.148 Y132.257 E.05026
G1 X116.852 Y132.257 E.87228
G1 X116.852 Y130.742 E.05026
G1 X143.088 Y130.742 E.87029
G1 X143.54 Y130.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.54 Y132.649 E.07065
G1 X116.46 Y132.649 E.83209
G1 X116.46 Y130.35 E.07065
G1 X143.48 Y130.35 E.83025
M204 S10000
; WIPE_START
G1 F24000
G1 X143.532 Y132.349 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I.056 J-1.216 P1  F30000
G1 X117.244 Y131.134 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X117.244 Y131.865 E.02246
G1 X142.756 Y131.865 E.7839
G1 X142.756 Y131.134 E.02246
G1 X117.304 Y131.134 E.78206
G1 X117.61 Y131.5 F30000
; LINE_WIDTH: 0.39683
G1 F15000
G1 X142.33 Y131.5 E.71292
; WIPE_START
G1 F24000
G1 X140.33 Y131.5 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I.919 J.798 P1  F30000
G1 X143.148 Y128.258 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.852 Y128.258 E.87228
G1 X116.852 Y123.743 E.14978
G1 X143.148 Y123.743 E.87228
G1 X143.148 Y128.198 E.14779
G1 X143.54 Y128.65 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.46 Y128.65 E.83209
G1 X116.46 Y123.351 E.16283
G1 X143.54 Y123.351 E.83209
G1 X143.54 Y128.59 E.16099
M204 S10000
G1 X142.775 Y128.091 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.406252
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X142.775 Y124.112 E.2101
G1 X142.319 Y124.112 E.0241
G1 X142.319 Y127.888 E.19941
G1 X141.863 Y127.888 E.0241
G1 X141.863 Y124.112 E.19941
G1 X141.406 Y124.112 E.0241
G1 X141.406 Y127.888 E.19941
G1 X140.95 Y127.888 E.0241
G1 X140.95 Y124.112 E.19941
G1 X140.494 Y124.112 E.0241
G1 X140.494 Y127.888 E.19941
G1 X140.038 Y127.888 E.0241
G1 X140.038 Y124.112 E.19941
G1 X139.581 Y124.112 E.0241
G1 X139.581 Y127.888 E.19941
G1 X139.125 Y127.888 E.0241
G1 X139.125 Y124.112 E.19941
G1 X138.669 Y124.112 E.0241
G1 X138.669 Y127.888 E.19941
G1 X138.213 Y127.888 E.0241
G1 X138.213 Y124.112 E.19941
G1 X137.756 Y124.112 E.0241
G1 X137.756 Y127.888 E.19941
G1 X137.3 Y127.888 E.0241
G1 X137.3 Y124.112 E.19941
G1 X136.844 Y124.112 E.0241
G1 X136.844 Y127.888 E.19941
G1 X136.387 Y127.888 E.0241
G1 X136.387 Y124.112 E.19941
G1 X135.931 Y124.112 E.0241
G1 X135.931 Y127.888 E.19941
G1 X135.475 Y127.888 E.0241
G1 X135.475 Y124.112 E.19941
G1 X135.019 Y124.112 E.0241
G1 X135.019 Y127.888 E.19941
G1 X134.562 Y127.888 E.0241
G1 X134.562 Y124.112 E.19941
G1 X134.106 Y124.112 E.0241
G1 X134.106 Y127.888 E.19941
G1 X133.65 Y127.888 E.0241
G1 X133.65 Y124.112 E.19941
G1 X133.194 Y124.112 E.0241
G1 X133.194 Y127.888 E.19941
G1 X132.737 Y127.888 E.0241
G1 X132.737 Y124.112 E.19941
G1 X132.281 Y124.112 E.0241
G1 X132.281 Y127.888 E.19941
G1 X131.825 Y127.888 E.0241
G1 X131.825 Y124.112 E.19941
G1 X131.369 Y124.112 E.0241
G1 X131.369 Y127.888 E.19941
G1 X130.912 Y127.888 E.0241
G1 X130.912 Y124.112 E.19941
G1 X130.456 Y124.112 E.0241
G1 X130.456 Y127.888 E.19941
G1 X130 Y127.888 E.0241
G1 X130 Y124.112 E.19941
G1 X129.544 Y124.112 E.0241
G1 X129.544 Y127.888 E.19941
G1 X129.087 Y127.888 E.0241
G1 X129.087 Y124.112 E.19941
G1 X128.631 Y124.112 E.0241
G1 X128.631 Y127.888 E.19941
G1 X128.175 Y127.888 E.0241
G1 X128.175 Y124.112 E.19941
G1 X127.719 Y124.112 E.0241
G1 X127.719 Y127.888 E.19941
G1 X127.262 Y127.888 E.0241
G1 X127.262 Y124.112 E.19941
G1 X126.806 Y124.112 E.0241
G1 X126.806 Y127.888 E.19941
G1 X126.35 Y127.888 E.0241
G1 X126.35 Y124.112 E.19941
G1 X125.894 Y124.112 E.0241
G1 X125.894 Y127.888 E.19941
G1 X125.437 Y127.888 E.0241
G1 X125.437 Y124.112 E.19941
G1 X124.981 Y124.112 E.0241
G1 X124.981 Y127.888 E.19941
G1 X124.525 Y127.888 E.0241
G1 X124.525 Y124.112 E.19941
G1 X124.069 Y124.112 E.0241
G1 X124.069 Y127.888 E.19941
G1 X123.612 Y127.888 E.0241
G1 X123.612 Y124.112 E.19941
G1 X123.156 Y124.112 E.0241
G1 X123.156 Y127.888 E.19941
G1 X122.7 Y127.888 E.0241
G1 X122.7 Y124.112 E.19941
G1 X122.244 Y124.112 E.0241
G1 X122.244 Y127.888 E.19941
G1 X121.787 Y127.888 E.0241
G1 X121.787 Y124.112 E.19941
G1 X121.331 Y124.112 E.0241
G1 X121.331 Y127.888 E.19941
G1 X120.875 Y127.888 E.0241
G1 X120.875 Y124.112 E.19941
G1 X120.419 Y124.112 E.0241
G1 X120.419 Y127.888 E.19941
G1 X119.962 Y127.888 E.0241
G1 X119.962 Y124.112 E.19941
G1 X119.506 Y124.112 E.0241
G1 X119.506 Y127.888 E.19941
G1 X119.05 Y127.888 E.0241
G1 X119.05 Y124.112 E.19941
G1 X118.594 Y124.112 E.0241
G1 X118.594 Y127.888 E.19941
G1 X118.137 Y127.888 E.0241
G1 X118.137 Y124.112 E.19941
G1 X117.681 Y124.112 E.0241
G1 X117.681 Y127.888 E.19941
G1 X117.225 Y127.888 E.0241
G1 X117.225 Y123.91 E.2101
M106 S244.8
; WIPE_START
G1 F24000
G1 X117.225 Y125.91 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I.459 J1.127 P1  F30000
G1 X142.771 Y115.511 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X142.771 Y117.027 E.05026
G1 X116.476 Y117.027 E.87228
G1 X116.476 Y115.511 E.05026
G1 X142.711 Y115.511 E.87029
G1 X143.163 Y115.119 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.163 Y117.419 E.07065
G1 X116.083 Y117.419 E.83209
G1 X116.083 Y115.119 E.07065
G1 X143.103 Y115.119 E.83025
M204 S10000
; WIPE_START
G1 F24000
G1 X143.156 Y117.119 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I.056 J-1.216 P1  F30000
G1 X116.868 Y115.904 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X116.868 Y116.635 E.02246
G1 X142.379 Y116.635 E.7839
G1 X142.379 Y115.904 E.02246
G1 X116.928 Y115.904 E.78206
G1 X117.233 Y116.269 F30000
; LINE_WIDTH: 0.39683
G1 F15000
G1 X141.954 Y116.269 E.71292
; WIPE_START
G1 F24000
G1 X139.954 Y116.269 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I.919 J.798 P1  F30000
G1 X142.771 Y113.027 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
M73 P95 R0
G1 X116.476 Y113.027 E.87228
G1 X116.476 Y108.512 E.14978
G1 X142.771 Y108.512 E.87228
G1 X142.771 Y112.967 E.14779
G1 X143.163 Y113.419 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.083 Y113.419 E.83209
G1 X116.083 Y108.12 E.16283
G1 X143.163 Y108.12 E.83209
G1 X143.163 Y113.359 E.16099
M204 S10000
G1 X142.398 Y112.86 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.406252
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X142.398 Y108.882 E.2101
G1 X141.942 Y108.882 E.0241
G1 X141.942 Y112.657 E.19941
G1 X141.486 Y112.657 E.0241
G1 X141.486 Y108.882 E.19941
G1 X141.03 Y108.882 E.0241
G1 X141.03 Y112.657 E.19941
G1 X140.573 Y112.657 E.0241
G1 X140.573 Y108.882 E.19941
G1 X140.117 Y108.882 E.0241
G1 X140.117 Y112.657 E.19941
G1 X139.661 Y112.657 E.0241
G1 X139.661 Y108.882 E.19941
G1 X139.205 Y108.882 E.0241
G1 X139.205 Y112.657 E.19941
G1 X138.748 Y112.657 E.0241
G1 X138.748 Y108.882 E.19941
G1 X138.292 Y108.882 E.0241
G1 X138.292 Y112.657 E.19941
G1 X137.836 Y112.657 E.0241
G1 X137.836 Y108.882 E.19941
M73 P96 R0
G1 X137.38 Y108.882 E.0241
G1 X137.38 Y112.657 E.19941
G1 X136.923 Y112.657 E.0241
G1 X136.923 Y108.882 E.19941
G1 X136.467 Y108.882 E.0241
G1 X136.467 Y112.657 E.19941
G1 X136.011 Y112.657 E.0241
G1 X136.011 Y108.882 E.19941
G1 X135.555 Y108.882 E.0241
G1 X135.555 Y112.657 E.19941
G1 X135.098 Y112.657 E.0241
G1 X135.098 Y108.882 E.19941
G1 X134.642 Y108.882 E.0241
G1 X134.642 Y112.657 E.19941
G1 X134.186 Y112.657 E.0241
G1 X134.186 Y108.882 E.19941
G1 X133.73 Y108.882 E.0241
G1 X133.73 Y112.657 E.19941
G1 X133.273 Y112.657 E.0241
G1 X133.273 Y108.882 E.19941
G1 X132.817 Y108.882 E.0241
G1 X132.817 Y112.657 E.19941
G1 X132.361 Y112.657 E.0241
G1 X132.361 Y108.882 E.19941
G1 X131.905 Y108.882 E.0241
G1 X131.905 Y112.657 E.19941
G1 X131.448 Y112.657 E.0241
G1 X131.448 Y108.882 E.19941
G1 X130.992 Y108.882 E.0241
G1 X130.992 Y112.657 E.19941
G1 X130.536 Y112.657 E.0241
G1 X130.536 Y108.882 E.19941
G1 X130.08 Y108.882 E.0241
G1 X130.08 Y112.657 E.19941
G1 X129.623 Y112.657 E.0241
G1 X129.623 Y108.882 E.19941
G1 X129.167 Y108.882 E.0241
G1 X129.167 Y112.657 E.19941
G1 X128.711 Y112.657 E.0241
G1 X128.711 Y108.882 E.19941
G1 X128.255 Y108.882 E.0241
G1 X128.255 Y112.657 E.19941
G1 X127.798 Y112.657 E.0241
G1 X127.798 Y108.882 E.19941
G1 X127.342 Y108.882 E.0241
G1 X127.342 Y112.657 E.19941
G1 X126.886 Y112.657 E.0241
G1 X126.886 Y108.882 E.19941
G1 X126.43 Y108.882 E.0241
G1 X126.43 Y112.657 E.19941
G1 X125.973 Y112.657 E.0241
G1 X125.973 Y108.882 E.19941
G1 X125.517 Y108.882 E.0241
G1 X125.517 Y112.657 E.19941
G1 X125.061 Y112.657 E.0241
G1 X125.061 Y108.882 E.19941
G1 X124.605 Y108.882 E.0241
G1 X124.605 Y112.657 E.19941
G1 X124.148 Y112.657 E.0241
G1 X124.148 Y108.882 E.19941
G1 X123.692 Y108.882 E.0241
G1 X123.692 Y112.657 E.19941
G1 X123.236 Y112.657 E.0241
G1 X123.236 Y108.882 E.19941
G1 X122.78 Y108.882 E.0241
G1 X122.78 Y112.657 E.19941
G1 X122.323 Y112.657 E.0241
G1 X122.323 Y108.882 E.19941
G1 X121.867 Y108.882 E.0241
G1 X121.867 Y112.657 E.19941
G1 X121.411 Y112.657 E.0241
G1 X121.411 Y108.882 E.19941
G1 X120.955 Y108.882 E.0241
G1 X120.955 Y112.657 E.19941
G1 X120.498 Y112.657 E.0241
G1 X120.498 Y108.882 E.19941
G1 X120.042 Y108.882 E.0241
G1 X120.042 Y112.657 E.19941
G1 X119.586 Y112.657 E.0241
G1 X119.586 Y108.882 E.19941
G1 X119.13 Y108.882 E.0241
G1 X119.13 Y112.657 E.19941
G1 X118.673 Y112.657 E.0241
G1 X118.673 Y108.882 E.19941
G1 X118.217 Y108.882 E.0241
G1 X118.217 Y112.657 E.19941
G1 X117.761 Y112.657 E.0241
G1 X117.761 Y108.882 E.19941
G1 X117.305 Y108.882 E.0241
G1 X117.305 Y112.657 E.19941
G1 X116.848 Y112.657 E.0241
G1 X116.848 Y108.679 E.2101
M106 S244.8
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 17.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X116.848 Y110.679 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 134/135
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
G3 Z18 I-.742 J.965 P1  F30000
G1 X143.148 Y130.896 Z18
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9149
G1 X143.148 Y132.103 E.04004
G1 X116.852 Y132.103 E.87228
G1 X116.852 Y130.896 E.04004
G1 X143.088 Y130.896 E.87029
G1 X143.54 Y130.504 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9149
G1 X143.54 Y132.495 E.06119
G1 X116.46 Y132.495 E.83209
G1 X116.46 Y130.504 E.06119
G1 X143.48 Y130.504 E.83025
M204 S10000
; WIPE_START
G1 F24000
G1 X143.54 Y132.495 E-.75701
G1 X143.532 Y132.495 E-.00299
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I.055 J-1.216 P1  F30000
G1 X117.256 Y131.3 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.442919
G1 F9149
G1 X117.256 Y131.7 E.01304
G1 X142.744 Y131.7 E.8308
G1 X142.744 Y131.3 E.01304
G1 X117.316 Y131.3 E.82885
; WIPE_START
G1 F24000
G1 X119.316 Y131.3 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I.162 J1.206 P1  F30000
G1 X143.148 Y128.104 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9149
G1 X116.852 Y128.104 E.87228
G1 X116.852 Y123.897 E.13956
G1 X143.148 Y123.897 E.87228
G1 X143.148 Y128.044 E.13757
G1 X143.54 Y128.496 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9149
G1 X116.46 Y128.496 E.83209
G1 X116.46 Y123.505 E.15337
G1 X143.54 Y123.505 E.83209
G1 X143.54 Y128.436 E.15152
M204 S10000
; WIPE_START
G1 F24000
G1 X141.54 Y128.44 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I1.206 J-.161 P1  F30000
G1 X141.24 Y126.196 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.434605
G1 F9149
G1 X141.24 Y125.804 E.0125
G1 X118.76 Y125.804 E.71752
G1 X118.76 Y126.196 E.0125
G1 X141.18 Y126.196 E.7156
G1 X141.625 Y126.581 F30000
; LINE_WIDTH: 0.419999
G1 F9149
G1 X141.625 Y125.42 E.03566
G1 X118.375 Y125.42 E.71438
G1 X118.375 Y126.581 E.03566
G1 X141.565 Y126.581 E.71254
G1 X142.002 Y126.958 F30000
G1 F9149
G1 X142.002 Y125.043 E.05883
G1 X117.998 Y125.043 E.73756
G1 X117.998 Y126.958 E.05883
G1 X141.942 Y126.958 E.73571
G1 X142.379 Y127.335 F30000
G1 F9149
G1 X142.379 Y124.666 E.082
G1 X117.621 Y124.666 E.76073
G1 X117.621 Y127.335 E.082
G1 X142.319 Y127.335 E.75889
G1 X142.756 Y127.712 F30000
G1 F9149
G1 X142.756 Y124.289 E.10518
G1 X117.244 Y124.289 E.7839
G1 X117.244 Y127.712 E.10518
G1 X142.696 Y127.712 E.78206
; WIPE_START
G1 F24000
G1 X140.696 Y127.712 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I1.199 J.207 P1  F30000
G1 X142.771 Y115.665 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9149
G1 X142.771 Y116.872 E.04004
G1 X116.476 Y116.872 E.87228
G1 X116.476 Y115.665 E.04004
G1 X142.711 Y115.665 E.87029
G1 X143.163 Y115.273 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9149
G1 X143.163 Y117.265 E.06119
G1 X116.083 Y117.265 E.83209
G1 X116.083 Y115.273 E.06119
G1 X143.103 Y115.273 E.83025
M204 S10000
; WIPE_START
G1 F24000
G1 X143.163 Y117.265 E-.75701
G1 X143.156 Y117.265 E-.00299
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I.055 J-1.216 P1  F30000
G1 X116.879 Y116.069 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.442919
G1 F9149
G1 X116.879 Y116.469 E.01304
G1 X142.368 Y116.469 E.8308
G1 X142.368 Y116.069 E.01304
G1 X116.939 Y116.069 E.82885
; WIPE_START
G1 F24000
G1 X118.939 Y116.069 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I.162 J1.206 P1  F30000
G1 X142.771 Y112.873 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9149
G1 X116.476 Y112.873 E.87228
G1 X116.476 Y108.666 E.13956
G1 X142.771 Y108.666 E.87228
G1 X142.771 Y112.813 E.13757
G1 X143.163 Y113.265 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9149
G1 X116.083 Y113.265 E.83209
G1 X116.083 Y108.274 E.15337
G1 X143.163 Y108.274 E.83209
G1 X143.163 Y113.205 E.15152
M204 S10000
; WIPE_START
G1 F24000
G1 X141.163 Y113.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I1.206 J-.161 P1  F30000
G1 X140.864 Y110.965 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.434605
G1 F9149
G1 X140.864 Y110.574 E.0125
G1 X118.383 Y110.574 E.71752
G1 X118.383 Y110.965 E.0125
G1 X140.804 Y110.965 E.7156
G1 X141.248 Y111.35 F30000
; LINE_WIDTH: 0.419999
G1 F9149
G1 X141.248 Y110.189 E.03566
G1 X117.999 Y110.189 E.71438
G1 X117.999 Y111.35 E.03566
G1 X141.188 Y111.35 E.71254
G1 X141.625 Y111.727 F30000
G1 F9149
G1 X141.625 Y109.812 E.05883
G1 X117.622 Y109.812 E.73756
G1 X117.622 Y111.727 E.05883
G1 X141.565 Y111.727 E.73571
G1 X142.002 Y112.104 F30000
G1 F9149
G1 X142.002 Y109.435 E.082
G1 X117.245 Y109.435 E.76073
G1 X117.245 Y112.104 E.082
G1 X141.942 Y112.104 E.75889
G1 X142.379 Y112.481 F30000
G1 F9149
G1 X142.379 Y109.058 E.10518
G1 X116.868 Y109.058 E.7839
G1 X116.868 Y112.481 E.10518
G1 X142.319 Y112.481 E.78206
; CHANGE_LAYER
; Z_HEIGHT: 18
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X140.319 Y112.481 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 135/135
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
G3 Z18.2 I-1.199 J.211 P1  F30000
G1 X143.54 Y130.774 Z18.2
G1 Z18
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8933
G1 X143.54 Y132.225 E.0446
M73 P97 R0
G1 X116.46 Y132.225 E.83209
G1 X116.46 Y130.774 E.0446
G1 X143.48 Y130.774 E.83025
M204 S10000
; WIPE_START
G1 F24000
G1 X143.54 Y132.225 E-.55207
G1 X142.993 Y132.225 E-.20793
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I.849 J-.872 P1  F30000
G1 X142.78 Y132.018 Z18.4
G1 Z18
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F8933
G1 X143.333 Y131.465 E.02402
G1 X143.283 Y130.981
G1 X142.247 Y132.018 E.04505
G1 X141.713 Y132.018
G1 X142.75 Y130.981 E.04505
G1 X142.217 Y130.981
G1 X141.18 Y132.018 E.04505
G1 X140.647 Y132.018
G1 X141.684 Y130.981 E.04505
G1 X141.15 Y130.981
G1 X140.114 Y132.018 E.04505
G1 X139.58 Y132.018
G1 X140.617 Y130.981 E.04505
G1 X140.084 Y130.981
G1 X139.047 Y132.018 E.04505
G1 X138.514 Y132.018
G1 X139.551 Y130.981 E.04505
G1 X139.017 Y130.981
G1 X137.98 Y132.018 E.04505
G1 X137.447 Y132.018
G1 X138.484 Y130.981 E.04505
G1 X137.951 Y130.981
G1 X136.914 Y132.018 E.04505
G1 X136.381 Y132.018
G1 X137.417 Y130.981 E.04505
G1 X136.884 Y130.981
G1 X135.847 Y132.018 E.04505
G1 X135.314 Y132.018
G1 X136.351 Y130.981 E.04505
G1 X135.818 Y130.981
G1 X134.781 Y132.018 E.04505
G1 X134.248 Y132.018
G1 X135.284 Y130.981 E.04505
G1 X134.751 Y130.981
G1 X133.714 Y132.018 E.04505
G1 X133.181 Y132.018
G1 X134.218 Y130.981 E.04505
G1 X133.685 Y130.981
G1 X132.648 Y132.018 E.04505
G1 X132.115 Y132.018
G1 X133.151 Y130.981 E.04505
G1 X132.618 Y130.981
G1 X131.581 Y132.018 E.04505
G1 X131.048 Y132.018
G1 X132.085 Y130.981 E.04505
G1 X131.551 Y130.981
G1 X130.515 Y132.018 E.04505
G1 X129.981 Y132.018
G1 X131.018 Y130.981 E.04505
G1 X130.485 Y130.981
G1 X129.448 Y132.018 E.04505
G1 X128.915 Y132.018
G1 X129.952 Y130.981 E.04505
G1 X129.418 Y130.981
G1 X128.382 Y132.018 E.04505
G1 X127.848 Y132.018
G1 X128.885 Y130.981 E.04505
G1 X128.352 Y130.981
G1 X127.315 Y132.018 E.04505
G1 X126.782 Y132.018
G1 X127.819 Y130.981 E.04505
G1 X127.285 Y130.981
G1 X126.249 Y132.018 E.04505
G1 X125.715 Y132.018
G1 X126.752 Y130.981 E.04505
G1 X126.219 Y130.981
G1 X125.182 Y132.018 E.04505
G1 X124.649 Y132.018
G1 X125.686 Y130.981 E.04505
G1 X125.152 Y130.981
G1 X124.115 Y132.018 E.04505
G1 X123.582 Y132.018
G1 X124.619 Y130.981 E.04505
G1 X124.086 Y130.981
G1 X123.049 Y132.018 E.04505
G1 X122.516 Y132.018
G1 X123.552 Y130.981 E.04505
G1 X123.019 Y130.981
G1 X121.982 Y132.018 E.04505
G1 X121.449 Y132.018
G1 X122.486 Y130.981 E.04505
G1 X121.953 Y130.981
G1 X120.916 Y132.018 E.04505
G1 X120.383 Y132.018
G1 X121.419 Y130.981 E.04505
G1 X120.886 Y130.981
G1 X119.849 Y132.018 E.04505
G1 X119.316 Y132.018
G1 X120.353 Y130.981 E.04505
G1 X119.82 Y130.981
G1 X118.783 Y132.018 E.04505
G1 X118.249 Y132.018
G1 X119.286 Y130.981 E.04505
G1 X118.753 Y130.981
G1 X117.716 Y132.018 E.04505
G1 X117.183 Y132.018
G1 X118.22 Y130.981 E.04505
G1 X117.686 Y130.981
G1 X116.667 Y132 E.04428
G1 X116.667 Y131.467
G1 X117.153 Y130.981 E.02111
M204 S10000
; WIPE_START
G1 F24000
G1 X116.667 Y131.467 E-.26107
G1 X116.667 Y132 E-.20264
G1 X117.219 Y131.449 E-.29629
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I.148 J1.208 P1  F30000
G1 X143.54 Y128.226 Z18.4
G1 Z18
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
G1 F8933
G1 X116.46 Y128.226 E.83209
G1 X116.46 Y123.775 E.13678
G1 X143.54 Y123.775 E.83209
G1 X143.54 Y128.166 E.13494
M204 S10000
G1 X143.333 Y127.199 F30000
M204 S2000
; FEATURE: Top surface
G1 F8933
G1 X142.513 Y128.019 E.03561
G1 X141.98 Y128.019
G1 X143.333 Y126.666 E.05879
G1 X143.333 Y126.133
G1 X141.446 Y128.019 E.08196
G1 X140.913 Y128.019
G1 X143.333 Y125.599 E.10513
G1 X143.333 Y125.066
G1 X140.38 Y128.019 E.12831
G1 X139.847 Y128.019
G1 X143.333 Y124.533 E.15148
G1 X143.333 Y124
G1 X139.313 Y128.019 E.17465
G1 X138.78 Y128.019
G1 X142.817 Y123.982 E.17542
G1 X142.284 Y123.982
G1 X138.247 Y128.019 E.17542
G1 X137.714 Y128.019
G1 X141.75 Y123.982 E.17542
G1 X141.217 Y123.982
G1 X137.18 Y128.019 E.17542
G1 X136.647 Y128.019
G1 X140.684 Y123.982 E.17542
G1 X140.151 Y123.982
G1 X136.114 Y128.019 E.17542
G1 X135.581 Y128.019
G1 X139.617 Y123.982 E.17542
G1 X139.084 Y123.982
G1 X135.047 Y128.019 E.17542
G1 X134.514 Y128.019
G1 X138.551 Y123.982 E.17542
G1 X138.017 Y123.982
G1 X133.981 Y128.019 E.17542
G1 X133.447 Y128.019
G1 X137.484 Y123.982 E.17542
G1 X136.951 Y123.982
G1 X132.914 Y128.019 E.17542
G1 X132.381 Y128.019
G1 X136.418 Y123.982 E.17542
G1 X135.884 Y123.982
G1 X131.848 Y128.019 E.17542
G1 X131.314 Y128.019
G1 X135.351 Y123.982 E.17542
G1 X134.818 Y123.982
G1 X130.781 Y128.019 E.17542
G1 X130.248 Y128.019
G1 X134.285 Y123.982 E.17542
G1 X133.751 Y123.982
G1 X129.715 Y128.019 E.17542
G1 X129.181 Y128.019
G1 X133.218 Y123.982 E.17542
G1 X132.685 Y123.982
G1 X128.648 Y128.019 E.17542
G1 X128.115 Y128.019
G1 X132.152 Y123.982 E.17542
G1 X131.618 Y123.982
G1 X127.581 Y128.019 E.17542
G1 X127.048 Y128.019
G1 X131.085 Y123.982 E.17542
G1 X130.552 Y123.982
G1 X126.515 Y128.019 E.17542
G1 X125.982 Y128.019
G1 X130.018 Y123.982 E.17542
G1 X129.485 Y123.982
G1 X125.448 Y128.019 E.17542
G1 X124.915 Y128.019
G1 X128.952 Y123.982 E.17542
G1 X128.419 Y123.982
G1 X124.382 Y128.019 E.17542
G1 X123.849 Y128.019
G1 X127.885 Y123.982 E.17542
G1 X127.352 Y123.982
G1 X123.315 Y128.019 E.17542
G1 X122.782 Y128.019
G1 X126.819 Y123.982 E.17542
G1 X126.286 Y123.982
G1 X122.249 Y128.019 E.17542
G1 X121.715 Y128.019
G1 X125.752 Y123.982 E.17542
G1 X125.219 Y123.982
G1 X121.182 Y128.019 E.17542
G1 X120.649 Y128.019
G1 X124.686 Y123.982 E.17542
G1 X124.152 Y123.982
G1 X120.116 Y128.019 E.17542
G1 X119.582 Y128.019
G1 X123.619 Y123.982 E.17542
G1 X123.086 Y123.982
G1 X119.049 Y128.019 E.17542
G1 X118.516 Y128.019
G1 X122.553 Y123.982 E.17542
G1 X122.019 Y123.982
G1 X117.983 Y128.019 E.17542
G1 X117.449 Y128.019
G1 X121.486 Y123.982 E.17542
G1 X120.953 Y123.982
G1 X116.916 Y128.019 E.17542
G1 X116.667 Y127.734
G1 X120.42 Y123.982 E.16305
G1 X119.886 Y123.982
G1 X116.667 Y127.201 E.13988
G1 X116.667 Y126.668
G1 X119.353 Y123.982 E.1167
G1 X118.82 Y123.982
G1 X116.667 Y126.134 E.09353
G1 X116.667 Y125.601
G1 X118.286 Y123.982 E.07036
G1 X117.753 Y123.982
G1 X116.667 Y125.068 E.04718
G1 X116.667 Y124.535
G1 X117.22 Y123.982 E.02401
M204 S10000
; WIPE_START
G1 F24000
G1 X116.667 Y124.535 E-.29695
G1 X116.667 Y125.068 E-.20264
G1 X117.152 Y124.583 E-.26041
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I.4 J1.15 P1  F30000
G1 X143.163 Y115.543 Z18.4
G1 Z18
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
G1 F8933
G1 X143.163 Y116.995 E.0446
G1 X116.083 Y116.995 E.83209
G1 X116.083 Y115.543 E.0446
G1 X143.103 Y115.543 E.83025
M204 S10000
; WIPE_START
G1 F24000
G1 X143.163 Y116.995 E-.55207
G1 X142.616 Y116.995 E-.20793
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I.849 J-.872 P1  F30000
G1 X142.403 Y116.787 Z18.4
G1 Z18
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F8933
G1 X142.956 Y116.235 E.02402
G1 X142.907 Y115.75
G1 X141.87 Y116.787 E.04505
G1 X141.337 Y116.787
G1 X142.374 Y115.75 E.04505
G1 X141.84 Y115.75
G1 X140.804 Y116.787 E.04505
G1 X140.27 Y116.787
G1 X141.307 Y115.75 E.04505
G1 X140.774 Y115.75
G1 X139.737 Y116.787 E.04505
G1 X139.204 Y116.787
G1 X140.241 Y115.75 E.04505
G1 X139.707 Y115.75
G1 X138.67 Y116.787 E.04505
G1 X138.137 Y116.787
G1 X139.174 Y115.75 E.04505
G1 X138.641 Y115.75
G1 X137.604 Y116.787 E.04505
G1 X137.071 Y116.787
G1 X138.107 Y115.75 E.04505
G1 X137.574 Y115.75
G1 X136.537 Y116.787 E.04505
G1 X136.004 Y116.787
G1 X137.041 Y115.75 E.04505
G1 X136.508 Y115.75
G1 X135.471 Y116.787 E.04505
G1 X134.938 Y116.787
G1 X135.974 Y115.75 E.04505
G1 X135.441 Y115.75
G1 X134.404 Y116.787 E.04505
G1 X133.871 Y116.787
G1 X134.908 Y115.75 E.04505
G1 X134.375 Y115.75
G1 X133.338 Y116.787 E.04505
M73 P98 R0
G1 X132.804 Y116.787
G1 X133.841 Y115.75 E.04505
G1 X133.308 Y115.75
G1 X132.271 Y116.787 E.04505
G1 X131.738 Y116.787
G1 X132.775 Y115.75 E.04505
G1 X132.241 Y115.75
G1 X131.205 Y116.787 E.04505
G1 X130.671 Y116.787
G1 X131.708 Y115.75 E.04505
G1 X131.175 Y115.75
G1 X130.138 Y116.787 E.04505
G1 X129.605 Y116.787
G1 X130.642 Y115.75 E.04505
G1 X130.108 Y115.75
G1 X129.072 Y116.787 E.04505
G1 X128.538 Y116.787
G1 X129.575 Y115.75 E.04505
G1 X129.042 Y115.75
G1 X128.005 Y116.787 E.04505
G1 X127.472 Y116.787
G1 X128.509 Y115.75 E.04505
G1 X127.975 Y115.75
G1 X126.939 Y116.787 E.04505
G1 X126.405 Y116.787
G1 X127.442 Y115.75 E.04505
G1 X126.909 Y115.75
G1 X125.872 Y116.787 E.04505
G1 X125.339 Y116.787
G1 X126.375 Y115.75 E.04505
G1 X125.842 Y115.75
G1 X124.805 Y116.787 E.04505
G1 X124.272 Y116.787
G1 X125.309 Y115.75 E.04505
G1 X124.776 Y115.75
G1 X123.739 Y116.787 E.04505
G1 X123.206 Y116.787
G1 X124.242 Y115.75 E.04505
G1 X123.709 Y115.75
G1 X122.672 Y116.787 E.04505
G1 X122.139 Y116.787
G1 X123.176 Y115.75 E.04505
G1 X122.643 Y115.75
G1 X121.606 Y116.787 E.04505
G1 X121.073 Y116.787
G1 X122.109 Y115.75 E.04505
G1 X121.576 Y115.75
G1 X120.539 Y116.787 E.04505
G1 X120.006 Y116.787
G1 X121.043 Y115.75 E.04505
G1 X120.51 Y115.75
G1 X119.473 Y116.787 E.04505
G1 X118.939 Y116.787
G1 X119.976 Y115.75 E.04505
G1 X119.443 Y115.75
G1 X118.406 Y116.787 E.04505
G1 X117.873 Y116.787
G1 X118.91 Y115.75 E.04505
G1 X118.376 Y115.75
G1 X117.34 Y116.787 E.04505
G1 X116.806 Y116.787
G1 X117.843 Y115.75 E.04505
G1 X117.31 Y115.75
G1 X116.291 Y116.77 E.04428
G1 X116.291 Y116.236
G1 X116.777 Y115.75 E.02111
M204 S10000
; WIPE_START
G1 F24000
G1 X116.291 Y116.236 E-.26107
G1 X116.291 Y116.77 E-.20264
G1 X116.842 Y116.218 E-.29629
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I.148 J1.208 P1  F30000
G1 X143.163 Y112.995 Z18.4
G1 Z18
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
G1 F8933
G1 X116.083 Y112.995 E.83209
G1 X116.083 Y108.544 E.13678
G1 X143.163 Y108.544 E.83209
G1 X143.163 Y112.935 E.13494
M204 S10000
G1 X142.956 Y111.968 F30000
M204 S2000
; FEATURE: Top surface
G1 F8933
G1 X142.136 Y112.788 E.03561
G1 X141.603 Y112.788
G1 X142.956 Y111.435 E.05879
G1 X142.956 Y110.902
G1 X141.07 Y112.788 E.08196
G1 X140.537 Y112.788
G1 X142.956 Y110.369 E.10513
G1 X142.956 Y109.835
G1 X140.003 Y112.788 E.12831
G1 X139.47 Y112.788
G1 X142.956 Y109.302 E.15148
G1 X142.956 Y108.769
G1 X138.937 Y112.788 E.17465
G1 X138.404 Y112.788
G1 X142.44 Y108.751 E.17542
G1 X141.907 Y108.751
G1 X137.87 Y112.788 E.17542
G1 X137.337 Y112.788
G1 X141.374 Y108.751 E.17542
G1 X140.841 Y108.751
G1 X136.804 Y112.788 E.17542
G1 X136.27 Y112.788
G1 X140.307 Y108.751 E.17542
G1 X139.774 Y108.751
G1 X135.737 Y112.788 E.17542
G1 X135.204 Y112.788
G1 X139.241 Y108.751 E.17542
G1 X138.707 Y108.751
G1 X134.671 Y112.788 E.17542
G1 X134.137 Y112.788
G1 X138.174 Y108.751 E.17542
G1 X137.641 Y108.751
G1 X133.604 Y112.788 E.17542
G1 X133.071 Y112.788
G1 X137.108 Y108.751 E.17542
G1 X136.574 Y108.751
G1 X132.538 Y112.788 E.17542
G1 X132.004 Y112.788
G1 X136.041 Y108.751 E.17542
G1 X135.508 Y108.751
G1 X131.471 Y112.788 E.17542
G1 X130.938 Y112.788
G1 X134.975 Y108.751 E.17542
G1 X134.441 Y108.751
G1 X130.405 Y112.788 E.17542
G1 X129.871 Y112.788
G1 X133.908 Y108.751 E.17542
G1 X133.375 Y108.751
G1 X129.338 Y112.788 E.17542
G1 X128.805 Y112.788
G1 X132.841 Y108.751 E.17542
G1 X132.308 Y108.751
G1 X128.271 Y112.788 E.17542
G1 X127.738 Y112.788
G1 X131.775 Y108.751 E.17542
G1 X131.242 Y108.751
G1 X127.205 Y112.788 E.17542
G1 X126.672 Y112.788
G1 X130.708 Y108.751 E.17542
G1 X130.175 Y108.751
G1 X126.138 Y112.788 E.17542
G1 X125.605 Y112.788
G1 X129.642 Y108.751 E.17542
G1 X129.109 Y108.751
G1 X125.072 Y112.788 E.17542
G1 X124.539 Y112.788
G1 X128.575 Y108.751 E.17542
G1 X128.042 Y108.751
G1 X124.005 Y112.788 E.17542
G1 X123.472 Y112.788
G1 X127.509 Y108.751 E.17542
G1 X126.976 Y108.751
G1 X122.939 Y112.788 E.17542
G1 X122.405 Y112.788
G1 X126.442 Y108.751 E.17542
G1 X125.909 Y108.751
G1 X121.872 Y112.788 E.17542
G1 X121.339 Y112.788
G1 X125.376 Y108.751 E.17542
G1 X124.842 Y108.751
G1 X120.806 Y112.788 E.17542
G1 X120.272 Y112.788
G1 X124.309 Y108.751 E.17542
G1 X123.776 Y108.751
G1 X119.739 Y112.788 E.17542
G1 X119.206 Y112.788
G1 X123.243 Y108.751 E.17542
G1 X122.709 Y108.751
G1 X118.673 Y112.788 E.17542
G1 X118.139 Y112.788
G1 X122.176 Y108.751 E.17542
G1 X121.643 Y108.751
G1 X117.606 Y112.788 E.17542
G1 X117.073 Y112.788
G1 X121.11 Y108.751 E.17542
G1 X120.576 Y108.751
G1 X116.539 Y112.788 E.17542
G1 X116.291 Y112.503
G1 X120.043 Y108.751 E.16305
G1 X119.51 Y108.751
G1 X116.291 Y111.97 E.13988
G1 X116.291 Y111.437
G1 X118.976 Y108.751 E.1167
G1 X118.443 Y108.751
G1 X116.291 Y110.904 E.09353
G1 X116.291 Y110.37
G1 X117.91 Y108.751 E.07036
G1 X117.377 Y108.751
G1 X116.291 Y109.837 E.04718
G1 X116.291 Y109.304
G1 X116.843 Y108.751 E.02401
M204 S10000
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X116.291 Y109.304 E-.29695
G1 X116.291 Y109.837 E-.20264
G1 X116.775 Y109.352 E-.26041
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
G1 Z18.5 F900 ; lower z a little
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

    G1 Z118 F600
    G1 Z116

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

