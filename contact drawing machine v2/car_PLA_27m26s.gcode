; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 21m 37s; total estimated time: 27m 26s
; total layer number: 118
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
M73 P0 R27
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
M73 P15 R23
G1 Y245
M73 P16 R23
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
M73 P16 R22
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
G1 E-0.5 F300

G1 X70 F9000
M73 P17 R22
G1 X76 F15000
M73 P18 R22
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
    G29 A X89.6318 Y97.5397 I80.637 J88.088
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
M73 P19 R22
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
; layer num/total_layer_count: 1/118
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
G1 X166.723 Y166.355 F30000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X166.759 Y166.351 E.00136
G1 X167.414 Y166.423 E.02453
G1 X168.028 Y166.638 E.02422
G1 X168.578 Y166.983 E.0242
G1 X169.037 Y167.443 E.0242
G1 X169.383 Y167.993 E.0242
G1 X169.598 Y168.606 E.0242
G1 X169.67 Y169.252 E.0242
G1 X169.598 Y169.898 E.0242
G1 X169.383 Y170.511 E.0242
G1 X169.037 Y171.061 E.0242
G1 X168.578 Y171.52 E.0242
M73 P19 R21
G1 X168.028 Y171.866 E.0242
M73 P20 R21
G1 X167.414 Y172.081 E.0242
G1 X166.769 Y172.153 E.0242
G1 X166.123 Y172.081 E.0242
G1 X165.51 Y171.866 E.0242
G1 X164.96 Y171.52 E.0242
G1 X164.5 Y171.061 E.02422
G1 X164.151 Y170.502 E.02453
G1 X163.94 Y169.898 E.02384
G1 X163.867 Y169.252 E.0242
G1 X163.94 Y168.606 E.0242
G1 X164.155 Y167.993 E.0242
G1 X164.5 Y167.443 E.0242
G1 X164.96 Y166.983 E.0242
G1 X165.51 Y166.638 E.0242
G1 X166.123 Y166.423 E.0242
G1 X166.441 Y166.387 E.01193
G1 X166.663 Y166.362 E.00832
G1 X166.779 Y166.004 F30000
G1 F3000
G1 X166.779 Y166.004 E.00001
G1 X167.091 Y166.035 E.01168
G1 X167.403 Y166.066 E.01166
G1 X168.012 Y166.25 E.02372
G1 X168.574 Y166.551 E.02372
G1 X169.066 Y166.955 E.02372
G1 X169.47 Y167.447 E.02372
G1 X169.77 Y168.009 E.02372
G1 X169.955 Y168.618 E.02372
G1 X170.018 Y169.252 E.02372
G1 X169.955 Y169.886 E.02372
G1 X169.77 Y170.495 E.02372
G1 X169.47 Y171.057 E.02372
G1 X169.066 Y171.549 E.02372
M73 P21 R21
G1 X168.574 Y171.953 E.02372
G1 X168.012 Y172.253 E.02372
G1 X167.403 Y172.438 E.02372
G1 X166.769 Y172.501 E.02372
G1 X166.135 Y172.438 E.02372
G1 X165.526 Y172.253 E.02372
G1 X164.964 Y171.953 E.02372
G1 X164.472 Y171.549 E.02372
G1 X164.068 Y171.057 E.02372
G1 X163.767 Y170.495 E.02372
G1 X163.582 Y169.886 E.02372
G1 X163.52 Y169.252 E.02372
G1 X163.582 Y168.618 E.02372
G1 X163.767 Y168.009 E.02372
G1 X164.068 Y167.447 E.02372
G1 X164.472 Y166.955 E.02372
G1 X164.964 Y166.551 E.02372
G1 X165.526 Y166.25 E.02372
G1 X166.135 Y166.066 E.02371
G1 X166.719 Y166.01 E.02187
; WIPE_START
G1 F24000
G1 X166.779 Y166.004 E-.02287
G1 X167.091 Y166.035 E-.11914
G1 X167.403 Y166.066 E-.119
G1 X168.012 Y166.25 E-.24201
G1 X168.574 Y166.551 E-.24201
G1 X168.604 Y166.576 E-.01496
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.205 J-.173 P1  F30000
G1 X159.064 Y100.326 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X159.05 Y100.04 E.01068
G3 X161.926 Y97.09 I2.95 J0 E.16985
G1 X162.074 Y97.09 E.00548
G3 X159.071 Y100.386 I-.074 J2.949 E.50204
; WIPE_START
G1 F24000
G1 X159.05 Y100.04 E-.13177
G1 X159.065 Y99.746 E-.11175
G1 X159.108 Y99.455 E-.11176
G1 X159.228 Y99.031 E-.16756
G1 X159.342 Y98.76 E-.11176
G1 X159.483 Y98.501 E-.11176
G1 X159.503 Y98.472 E-.01365
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.025 J-1.217 P1  F30000
G1 X98.946 Y97.246 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X99.213 Y97.351 E.01069
G3 X97.926 Y97.09 I-1.213 J2.689 E.64098
G1 X98.074 Y97.09 E.00548
G3 X98.889 Y97.227 I-.074 J2.949 E.03091
; WIPE_START
G1 F24000
G1 X99.213 Y97.351 E-.13179
G1 X99.601 Y97.561 E-.16755
G1 X99.839 Y97.733 E-.11176
G1 X100.06 Y97.928 E-.11176
G1 X100.26 Y98.143 E-.11176
G1 X100.438 Y98.378 E-.11176
G1 X100.456 Y98.408 E-.01363
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.096 J.528 P1  F30000
G1 X128.169 Y155.912 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X128.152 Y155.901 E.00077
G3 X126.593 Y153.05 I1.848 J-2.862 E.12615
G1 X126.593 Y140.029 E.48499
G3 X129.915 Y136.633 I3.41 J.013 E.19575
G3 X133.407 Y140.029 I.075 J3.416 E.20195
G1 X133.407 Y153.05 E.48499
G3 X128.446 Y156.071 I-3.407 J-.011 E.25901
G1 X128.221 Y155.942 E.00965
G1 X128.354 Y155.485 F30000
; FEATURE: Outer wall
G1 F3000
G1 X128.161 Y155.346 E.00885
G3 X127.05 Y153.045 I1.839 J-2.307 E.09843
G1 X127.05 Y140.035 E.48457
G3 X129.926 Y137.09 I2.952 J.007 E.16964
G3 X132.95 Y140.035 I.065 J2.958 E.17501
G1 X132.95 Y153.045 E.48457
G3 X128.403 Y155.519 I-2.95 J-.006 E.23524
; WIPE_START
G1 F24000
G1 X128.161 Y155.346 E-.1131
G1 X127.94 Y155.152 E-.11175
G1 X127.74 Y154.936 E-.11176
G1 X127.562 Y154.702 E-.11176
G1 X127.409 Y154.451 E-.11176
G1 X127.282 Y154.186 E-.11176
G1 X127.202 Y153.968 E-.08812
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.046 J-.621 P1  F30000
G1 X93.499 Y97.202 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G3 X95.18 Y96.397 I1.676 J1.34 E.07183
G1 X96.165 Y96.397 E.03667
G1 X97.612 Y96.397 E.05391
G1 X97.631 Y96.65 E.00948
G2 X98.369 Y96.65 I.369 J3.388 E.76996
G1 X98.388 Y96.397 E.00948
G1 X161.611 Y96.397 E2.35484
G1 X161.63 Y96.651 E.00948
G2 X162.37 Y96.651 I.37 J3.388 E.7699
G1 X162.389 Y96.397 E.00948
G1 X164.825 Y96.397 E.09073
G3 X166.686 Y99.612 I.001 J2.146 E.16726
G1 X133.602 Y157.508 E2.48365
G3 X126.397 Y157.508 I-3.602 J-2.049 E.32528
G1 X93.314 Y99.612 E2.48362
G3 X93.462 Y97.249 I1.86 J-1.07 E.09339
G1 X93.142 Y96.917 F30000
; FEATURE: Outer wall
G1 F3000
G3 X95.175 Y95.94 I2.033 J1.626 E.08686
G1 X96.165 Y95.94 E.03688
G1 X164.83 Y95.94 E2.55753
G3 X167.085 Y99.834 I-.006 J2.603 E.2024
G1 X133.996 Y157.74 E2.48407
G3 X126.004 Y157.74 I-3.996 J-2.281 E.36066
G1 X92.915 Y99.834 E2.48406
G3 X93.106 Y96.964 I2.261 J-1.291 E.1135
; WIPE_START
G1 F24000
G1 X93.404 Y96.631 E-.16998
G1 X93.708 Y96.39 E-.14735
G1 X93.929 Y96.255 E-.0984
G1 X94.282 Y96.096 E-.14722
G1 X94.529 Y96.02 E-.09828
G1 X94.785 Y95.975 E-.09876
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.202 J.188 P1  F30000
G1 X94.885 Y96.611 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.535515
G1 F6300
G1 X95.483 Y97.209 E.03394
G2 X95.132 Y97.556 I1.207 J1.571 E.01982
G1 X94.5 Y96.924 E.03588
G2 X94.064 Y97.184 I.728 J1.718 E.02046
G1 X94.832 Y97.952 E.04361
G2 X94.582 Y98.399 I2.106 J1.473 E.02058
G1 X93.731 Y97.547 E.04833
G2 X93.5 Y98.014 I1.484 J1.023 E.02095
G1 X94.382 Y98.895 E.05003
G1 X94.249 Y99.459 E.02325
G1 X93.219 Y98.429 E.05848
; WIPE_START
G1 F24000
G1 X94.249 Y99.459 E-.55358
G1 X94.373 Y98.93 E-.20642
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.173 J-.323 P1  F30000
G1 X94.077 Y100.007 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.28329
G1 F3000
G2 X94.316 Y100.689 I27.602 J-9.258 E.01415
; LINE_WIDTH: 0.224201
G1 X94.347 Y100.776 E.00136
; LINE_WIDTH: 0.197117
G1 X94.382 Y100.866 E.00121
; LINE_WIDTH: 0.168932
G1 X94.415 Y100.951 E.00094
; LINE_WIDTH: 0.124224
G1 X94.487 Y101.122 E.00123
; LINE_WIDTH: 0.10322
G1 X94.542 Y101.246 E.00066
G1 X94.457 Y101.152 F30000
; LINE_WIDTH: 0.362065
G1 F3000
M73 P22 R21
G1 X94.09 Y100.004 E.03133
G1 X94.101 Y100.002 F30000
; LINE_WIDTH: 0.448375
G1 F3000
G2 X94.411 Y101.071 I43.165 J-11.92 E.03677
; WIPE_START
G1 F24000
G1 X94.101 Y100.002 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.106 J.508 P1  F30000
G1 X95.206 Y102.408 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.130377
G1 F3000
G1 X95.302 Y102.542 E.00117
; LINE_WIDTH: 0.176578
G1 X95.413 Y102.689 E.00201
; LINE_WIDTH: 0.204824
G1 X95.472 Y102.764 E.00125
; LINE_WIDTH: 0.233554
G1 X95.529 Y102.836 E.00142
; LINE_WIDTH: 0.265894
G1 X95.591 Y102.91 E.00176
; LINE_WIDTH: 0.299883
G1 X95.65 Y102.981 E.00193
; LINE_WIDTH: 0.30235
G1 X96.038 Y103.433 E.01258
G1 X96.046 Y103.424 F30000
; LINE_WIDTH: 0.380144
G1 F3000
G1 X95.252 Y102.542 E.03262
; WIPE_START
G1 F24000
G1 X96.046 Y103.424 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.217 J.022 P1  F30000
G1 X96.166 Y96.869 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.134
G1 F3000
G1 X96.32 Y96.764 E.00138
; LINE_WIDTH: 0.155055
G3 X96.487 Y96.677 I.372 J.511 E.00172
G1 X96.623 Y96.648 E.00127
; WIPE_START
G1 F24000
G1 X96.487 Y96.677 E-.3209
G1 X96.437 Y96.688 E-.11766
G1 X96.32 Y96.764 E-.32144
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.177 J1.204 P1  F30000
G1 X98 Y96.516 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.339318
G1 F3000
G1 X98 Y96.864 E.0084
G1 X98 Y96.516 F30000
; LINE_WIDTH: 0.369174
G1 F3000
G1 X98 Y96.168 E.00925
; WIPE_START
G1 F24000
G1 X98 Y96.516 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.116 J1.211 P1  F30000
G1 X99.377 Y96.648 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.145274
G1 F3000
G3 X99.679 Y96.763 I-.029 J.527 E.00274
; LINE_WIDTH: 0.103297
G1 X99.834 Y96.869 E.00092
; WIPE_START
G1 F24000
G1 X99.679 Y96.763 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.011 J1.217 P1  F30000
G1 X159.665 Y97.315 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.500178
G1 F6300
G1 X159.136 Y96.785 E.0279
G1 X158.489 Y96.785 E.0241
G1 X159.192 Y97.488 E.03701
G2 X158.907 Y97.85 I1.302 J1.317 E.0172
G1 X157.843 Y96.785 E.05609
G1 X157.196 Y96.785 E.0241
G1 X158.656 Y98.245 E.07692
G2 X158.456 Y98.692 I2.131 J1.224 E.01826
G1 X156.549 Y96.785 E.10045
G1 X155.903 Y96.785 E.0241
G1 X158.304 Y99.187 E.12656
G2 X158.22 Y99.749 I3.827 J.864 E.02119
G1 X155.256 Y96.785 E.15617
G1 X154.609 Y96.785 E.0241
G1 X158.463 Y100.639 E.20305
; WIPE_START
G1 F24000
G1 X157.048 Y99.224 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.687 J1.004 P1  F30000
G1 X163.189 Y103.425 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X163.743 Y103.979 E.02918
G1 X163.508 Y104.39 E.01766
G1 X162.855 Y103.738 E.03439
G3 X162.287 Y103.816 I-.88 J-4.272 E.02139
G1 X163.273 Y104.802 E.05194
G1 X163.038 Y105.213 E.01766
G1 X161.399 Y103.575 E.08634
; WIPE_START
G1 F24000
G1 X162.813 Y104.989 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.198 J.213 P1  F30000
G1 X162.953 Y105.776 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X160.813 Y103.636 E.11275
G3 X158.396 Y101.218 I1.141 J-3.558 E.13232
G1 X153.963 Y96.785 E.23359
G1 X153.316 Y96.785 E.0241
G1 X162.567 Y106.036 E.48749
G1 X162.332 Y106.448 E.01766
G1 X152.669 Y96.785 E.50917
G1 X152.023 Y96.785 E.0241
G1 X162.097 Y106.86 E.53086
G1 X161.862 Y107.271 E.01766
G1 X151.376 Y96.785 E.55254
G1 X150.729 Y96.785 E.0241
G1 X161.627 Y107.683 E.57422
G1 X161.391 Y108.094 E.01766
G1 X150.083 Y96.785 E.59591
G1 X149.436 Y96.785 E.0241
G1 X161.156 Y108.506 E.61759
G1 X160.921 Y108.917 E.01766
G1 X148.789 Y96.785 E.63928
G1 X148.143 Y96.785 E.0241
G1 X160.686 Y109.329 E.66096
G1 X160.451 Y109.74 E.01766
G1 X147.496 Y96.785 E.68265
G1 X146.849 Y96.785 E.0241
G1 X160.216 Y110.152 E.70433
G1 X159.981 Y110.563 E.01766
G1 X146.203 Y96.785 E.72602
G1 X145.556 Y96.785 E.0241
G1 X159.745 Y110.975 E.7477
G1 X159.51 Y111.386 E.01766
G1 X144.909 Y96.785 E.76938
G1 X144.263 Y96.785 E.0241
G1 X159.275 Y111.798 E.79107
G1 X159.04 Y112.209 E.01766
G1 X143.616 Y96.785 E.81275
G1 X142.969 Y96.785 E.0241
G1 X158.805 Y112.621 E.83444
G1 X158.57 Y113.032 E.01766
G1 X142.323 Y96.785 E.85612
G1 X141.676 Y96.785 E.0241
G1 X158.335 Y113.444 E.87781
G1 X158.099 Y113.855 E.01766
G1 X141.029 Y96.785 E.89949
G1 X140.383 Y96.785 E.0241
G1 X157.864 Y114.267 E.92118
G1 X157.629 Y114.678 E.01766
G1 X139.736 Y96.785 E.94286
G1 X139.09 Y96.785 E.0241
G1 X157.394 Y115.09 E.96455
G1 X157.159 Y115.501 E.01766
G1 X138.443 Y96.785 E.98623
G1 X137.796 Y96.785 E.0241
G1 X156.924 Y115.913 E1.00791
G1 X156.688 Y116.324 E.01766
G1 X137.15 Y96.785 E1.0296
G1 X136.503 Y96.785 E.0241
G1 X156.453 Y116.736 E1.05128
G1 X156.218 Y117.147 E.01766
G1 X135.856 Y96.785 E1.07297
G1 X135.21 Y96.785 E.0241
G1 X155.983 Y117.559 E1.09465
G1 X155.748 Y117.97 E.01766
G1 X134.563 Y96.785 E1.11634
G1 X133.916 Y96.785 E.0241
G1 X155.513 Y118.382 E1.13802
G1 X155.278 Y118.793 E.01766
G1 X133.27 Y96.785 E1.15971
M73 P23 R21
G1 X132.623 Y96.785 E.0241
G1 X155.042 Y119.205 E1.18139
G1 X154.807 Y119.616 E.01766
G1 X131.976 Y96.785 E1.20307
G1 X131.33 Y96.785 E.0241
G1 X154.572 Y120.028 E1.22476
G1 X154.337 Y120.439 E.01766
G1 X130.683 Y96.785 E1.24644
G1 X130.036 Y96.785 E.0241
G1 X154.102 Y120.851 E1.26813
G1 X153.867 Y121.262 E.01766
G1 X129.39 Y96.785 E1.28981
G1 X128.743 Y96.785 E.0241
G1 X153.632 Y121.674 E1.3115
G1 X153.396 Y122.085 E.01766
G1 X128.096 Y96.785 E1.33318
G1 X127.45 Y96.785 E.0241
G1 X153.161 Y122.497 E1.35487
G1 X152.926 Y122.908 E.01766
G1 X126.803 Y96.785 E1.37655
G1 X126.156 Y96.785 E.0241
G1 X152.691 Y123.32 E1.39823
G1 X152.456 Y123.731 E.01766
G1 X125.51 Y96.785 E1.41992
G1 X124.863 Y96.785 E.0241
G1 X152.221 Y124.143 E1.4416
G1 X151.985 Y124.554 E.01766
G1 X124.216 Y96.785 E1.46329
G1 X123.57 Y96.785 E.0241
G1 X151.75 Y124.966 E1.48497
G1 X151.515 Y125.378 E.01766
G1 X122.923 Y96.785 E1.50666
G1 X122.276 Y96.785 E.0241
G1 X151.28 Y125.789 E1.52834
G1 X151.045 Y126.201 E.01766
G1 X121.63 Y96.785 E1.55003
G1 X120.983 Y96.785 E.0241
G1 X150.81 Y126.612 E1.57171
G1 X150.575 Y127.024 E.01766
G1 X120.336 Y96.785 E1.5934
M73 P23 R20
G1 X119.69 Y96.785 E.0241
G1 X150.339 Y127.435 E1.61508
G1 X150.104 Y127.847 E.01766
G1 X119.043 Y96.785 E1.63676
G1 X118.396 Y96.785 E.0241
G1 X149.869 Y128.258 E1.65845
G1 X149.634 Y128.67 E.01766
G1 X117.75 Y96.785 E1.68013
G1 X117.103 Y96.785 E.0241
G1 X149.399 Y129.081 E1.70182
G1 X149.164 Y129.493 E.01766
G1 X116.456 Y96.785 E1.7235
G1 X115.81 Y96.785 E.0241
G1 X148.929 Y129.904 E1.74519
G1 X148.693 Y130.316 E.01766
G1 X115.163 Y96.785 E1.76687
G1 X114.516 Y96.785 E.0241
G1 X148.458 Y130.727 E1.78856
G1 X148.223 Y131.139 E.01766
G1 X113.87 Y96.785 E1.81024
G1 X113.223 Y96.785 E.0241
G1 X147.988 Y131.55 E1.83192
G1 X147.753 Y131.962 E.01766
G1 X112.576 Y96.785 E1.85361
G1 X111.93 Y96.785 E.0241
G1 X147.518 Y132.373 E1.87529
G1 X147.283 Y132.785 E.01766
G1 X111.283 Y96.785 E1.89698
G1 X110.636 Y96.785 E.0241
G1 X147.047 Y133.196 E1.91866
G1 X146.812 Y133.608 E.01766
G1 X109.99 Y96.785 E1.94035
M73 P24 R20
G1 X109.343 Y96.785 E.0241
G1 X146.577 Y134.019 E1.96203
G1 X146.342 Y134.431 E.01766
G1 X108.696 Y96.785 E1.98372
G1 X108.05 Y96.785 E.0241
G1 X146.107 Y134.842 E2.0054
G1 X145.872 Y135.254 E.01766
G1 X107.403 Y96.785 E2.02709
G1 X106.756 Y96.785 E.0241
G1 X145.636 Y135.665 E2.04877
G1 X145.401 Y136.077 E.01766
G1 X106.11 Y96.785 E2.07045
G1 X105.463 Y96.785 E.0241
G1 X145.166 Y136.488 E2.09214
G1 X144.931 Y136.9 E.01766
G1 X104.816 Y96.785 E2.11382
G1 X104.17 Y96.785 E.0241
G1 X144.696 Y137.311 E2.13551
G1 X144.461 Y137.723 E.01766
G1 X103.523 Y96.785 E2.15719
G1 X102.876 Y96.785 E.0241
G1 X144.226 Y138.134 E2.17888
G1 X143.99 Y138.546 E.01766
G1 X102.23 Y96.785 E2.20056
G1 X101.583 Y96.785 E.0241
G1 X143.755 Y138.957 E2.22225
G1 X143.52 Y139.369 E.01766
G1 X100.936 Y96.785 E2.24393
G1 X100.361 Y96.785 E.02146
G1 X100.332 Y96.827 E.0019
G1 X143.285 Y139.78 E2.2634
G1 X143.05 Y140.192 E.01766
G1 X101.531 Y98.673 E2.18781
G3 X101.761 Y99.549 I-3.242 J1.316 E.03383
G1 X142.815 Y140.603 E2.16333
G1 X142.58 Y141.015 E.01766
G1 X101.792 Y100.227 E2.1493
G3 X101.715 Y100.797 I-2.886 J-.098 E.02147
G1 X142.344 Y141.426 E2.14094
G1 X142.109 Y141.838 E.01766
G1 X101.577 Y101.306 E2.13582
G3 X101.382 Y101.757 I-5.142 J-1.957 E.01833
G1 X141.874 Y142.249 E2.13372
G1 X141.639 Y142.661 E.01766
G1 X101.141 Y102.163 E2.13401
G3 X100.861 Y102.529 I-1.969 J-1.219 E.01721
G1 X141.404 Y143.073 E2.13641
G1 X141.169 Y143.484 E.01766
G1 X100.542 Y102.857 E2.14082
G3 X100.182 Y103.144 I-4.218 J-4.918 E.01715
G1 X140.933 Y143.896 E2.14738
G1 X140.698 Y144.307 E.01766
M73 P25 R20
G1 X99.78 Y103.388 E2.1562
G3 X99.334 Y103.589 I-1.228 J-2.126 E.01825
G1 X140.463 Y144.719 E2.16729
G1 X140.228 Y145.13 E.01766
G1 X98.84 Y103.742 E2.18094
G3 X98.269 Y103.817 I-.587 J-2.241 E.02152
G1 X130.78 Y136.329 E1.71317
G2 X130.053 Y136.248 I-.788 J3.805 E.02729
G1 X97.618 Y103.813 E1.70915
G3 X96.785 Y103.627 I.389 J-3.698 E.03186
G1 X129.448 Y136.29 E1.72113
G2 X128.915 Y136.404 I.586 J4.019 E.0203
G1 X96.263 Y103.751 E1.72062
G1 X96.175 Y103.83 E.00439
G1 X96.815 Y104.951 E.04808
G1 X128.446 Y136.581 E1.66676
G2 X128.022 Y136.804 I.9 J2.231 E.01788
G1 X97.677 Y106.459 E1.59898
G1 X98.539 Y107.968 E.06474
G1 X127.645 Y137.074 E1.53371
G2 X127.301 Y137.376 I1.033 J1.524 E.01712
G1 X99.401 Y109.477 E1.47014
G1 X100.263 Y110.985 E.06474
G1 X126.997 Y137.719 E1.40874
G1 X126.74 Y138.109 E.01739
G1 X101.125 Y112.494 E1.34975
G1 X101.987 Y114.003 E.06474
G1 X126.524 Y138.539 E1.29292
G2 X126.354 Y139.016 I1.504 J.802 E.01895
G1 X102.849 Y115.511 E1.23859
G1 X103.711 Y117.02 E.06474
G1 X126.24 Y139.548 E1.18713
G2 X126.204 Y140.16 I4.909 J.591 E.02283
G1 X104.573 Y118.529 E1.13984
G1 X105.435 Y120.037 E.06474
G1 X126.204 Y140.806 E1.09441
G1 X126.204 Y141.453 E.0241
G1 X106.297 Y121.546 E1.04899
G1 X107.159 Y123.055 E.06474
G1 X126.204 Y142.1 E1.00357
G1 X126.204 Y142.746 E.0241
G1 X108.021 Y124.563 E.95814
G1 X108.883 Y126.072 E.06474
G1 X126.204 Y143.393 E.91272
M73 P26 R20
G1 X126.204 Y144.04 E.0241
G1 X109.746 Y127.581 E.8673
G1 X110.608 Y129.089 E.06474
G1 X126.204 Y144.686 E.82187
G1 X126.204 Y145.333 E.0241
G1 X111.47 Y130.598 E.77645
G1 X112.332 Y132.107 E.06474
G1 X126.204 Y145.98 E.73103
G1 X126.204 Y146.626 E.0241
G1 X113.194 Y133.615 E.6856
G1 X114.056 Y135.124 E.06474
G1 X126.204 Y147.273 E.64018
G1 X126.204 Y147.92 E.0241
G1 X114.918 Y136.633 E.59476
G1 X115.78 Y138.141 E.06474
G1 X126.204 Y148.566 E.54933
G1 X126.204 Y149.213 E.0241
G1 X116.642 Y139.65 E.50391
G1 X117.504 Y141.159 E.06474
G1 X126.204 Y149.86 E.45849
G1 X126.204 Y150.506 E.0241
G1 X118.366 Y142.667 E.41306
G1 X119.228 Y144.176 E.06474
G1 X126.204 Y151.153 E.36764
G1 X126.204 Y151.8 E.0241
G1 X120.09 Y145.685 E.32222
G1 X120.952 Y147.193 E.06474
G1 X126.204 Y152.446 E.27679
G2 X126.206 Y153.095 I6.39 J.307 E.02417
G1 X121.814 Y148.702 E.23146
G1 X122.676 Y150.211 E.06474
G1 X126.573 Y154.108 E.20536
; WIPE_START
G1 F24000
G1 X125.159 Y152.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.515 J1.103 P1  F30000
G1 X140.144 Y145.692 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X133.715 Y139.264 E.33875
G3 X133.794 Y139.989 I-4.844 J.895 E.02723
G1 X139.758 Y145.953 E.31425
G1 X139.523 Y146.365 E.01766
G1 X133.796 Y140.638 E.30178
G1 X133.796 Y141.284 E.0241
G1 X139.287 Y146.776 E.28939
G1 X139.052 Y147.188 E.01766
G1 X133.796 Y141.931 E.277
G1 X133.796 Y142.578 E.0241
G1 X138.817 Y147.599 E.26461
G1 X138.582 Y148.011 E.01766
G1 X133.796 Y143.224 E.25222
G1 X133.796 Y143.871 E.0241
G1 X138.347 Y148.422 E.23983
G1 X138.112 Y148.834 E.01766
M73 P27 R20
G1 X133.796 Y144.518 E.22744
G1 X133.796 Y145.164 E.0241
G1 X137.877 Y149.245 E.21504
G1 X137.641 Y149.657 E.01766
G1 X133.796 Y145.811 E.20265
G1 X133.796 Y146.458 E.0241
G1 X137.406 Y150.068 E.19026
G1 X137.171 Y150.48 E.01766
G1 X133.796 Y147.104 E.17787
G1 X133.796 Y147.751 E.0241
G1 X136.936 Y150.891 E.16548
G1 X136.701 Y151.303 E.01766
G1 X133.796 Y148.398 E.15309
G1 X133.796 Y149.044 E.0241
M73 P27 R19
G1 X136.466 Y151.714 E.1407
G1 X136.23 Y152.126 E.01766
G1 X133.796 Y149.691 E.12831
G1 X133.796 Y150.337 E.0241
G1 X135.995 Y152.537 E.11592
G1 X135.76 Y152.949 E.01766
G1 X133.796 Y150.984 E.10353
G1 X133.796 Y151.631 E.0241
G1 X135.525 Y153.36 E.09113
G1 X135.29 Y153.772 E.01766
G1 X133.796 Y152.277 E.07874
G1 X133.796 Y152.924 E.0241
G1 X135.055 Y154.183 E.06635
G1 X134.82 Y154.595 E.01766
G1 X133.76 Y153.535 E.05585
G3 X133.644 Y154.066 I-2.177 J-.194 E.02031
G1 X134.584 Y155.006 E.04953
G1 X134.349 Y155.418 E.01766
G1 X133.479 Y154.548 E.04586
G3 X133.262 Y154.977 I-2.259 J-.871 E.01797
G1 X134.114 Y155.829 E.0449
G1 X133.879 Y156.241 E.01766
G1 X132.996 Y155.358 E.04651
G3 X132.698 Y155.706 I-1.539 J-1.017 E.01713
G1 X133.644 Y156.652 E.04984
G1 X133.409 Y157.064 E.01766
G1 X132.359 Y156.014 E.05532
G1 X131.974 Y156.276 E.01734
G1 X133.167 Y157.469 E.06284
G3 X132.891 Y157.839 I-1.639 J-.931 E.01726
G1 X131.548 Y156.497 E.07076
G3 X131.081 Y156.676 I-.95 J-1.773 E.01869
G1 X132.58 Y158.175 E.07899
G3 X132.231 Y158.473 I-1.182 J-1.031 E.01715
G1 X130.548 Y156.79 E.08869
G3 X129.943 Y156.831 I-.466 J-2.396 E.02268
G1 X131.843 Y158.731 E.10014
G3 X131.404 Y158.939 I-2.725 J-5.198 E.0181
G1 X128.927 Y156.462 E.13052
; WIPE_START
G1 F24000
G1 X130.341 Y157.876 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.073 J.574 P1  F30000
G1 X131.084 Y159.266 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X123.538 Y151.719 E.39764
G1 X124.4 Y153.228 E.06474
G1 X130.366 Y159.194 E.31438
G3 X129.73 Y159.206 I-.375 J-3.231 E.02372
G1 X125.262 Y154.737 E.23548
G1 X126.124 Y156.245 E.06474
G1 X129.218 Y159.339 E.16304
; WIPE_START
G1 F24000
G1 X127.803 Y157.925 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.014 J.673 P1  F30000
G1 X163.962 Y103.433 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.295558
G1 F3000
G2 X164.409 Y102.91 I-20.706 J-18.132 E.01415
; LINE_WIDTH: 0.235122
G1 X164.468 Y102.839 E.00144
; LINE_WIDTH: 0.207196
G1 X164.528 Y102.764 E.00129
; LINE_WIDTH: 0.178075
G1 X164.585 Y102.692 E.00101
; LINE_WIDTH: 0.133019
G1 X164.694 Y102.548 E.00133
; LINE_WIDTH: 0.103281
G1 X164.794 Y102.408 E.00085
G1 X164.748 Y102.542 F30000
; LINE_WIDTH: 0.3765
G1 F3000
G1 X163.954 Y103.424 E.03227
; WIPE_START
G1 F24000
G1 X164.748 Y102.542 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.068 J.584 P1  F30000
G1 X165.458 Y101.246 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.12301
G1 F3000
G1 X165.512 Y101.124 E.00087
; LINE_WIDTH: 0.167591
G1 X165.584 Y100.954 E.00188
; LINE_WIDTH: 0.194939
G1 X165.618 Y100.866 E.00117
; LINE_WIDTH: 0.222741
G1 X165.652 Y100.78 E.00134
; LINE_WIDTH: 0.254267
G1 X165.684 Y100.689 E.00166
; LINE_WIDTH: 0.287325
G1 X165.716 Y100.603 E.00183
; LINE_WIDTH: 0.289609
G1 X165.923 Y100.007 E.01268
G1 X165.91 Y100.004 F30000
; LINE_WIDTH: 0.365449
G1 F3000
G1 X165.543 Y101.152 E.03166
G1 X165.589 Y101.071 F30000
; LINE_WIDTH: 0.454519
G1 F3000
G2 X165.899 Y100.002 I-43.205 J-13.089 E.03732
; WIPE_START
G1 F24000
G1 X165.589 Y101.071 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.216 J-.038 P1  F30000
G1 X165.453 Y96.692 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.505498
G1 F6300
G1 X166.15 Y97.388 E.03712
G3 X166.581 Y98.474 I-1.375 J1.174 E.04482
G1 X164.897 Y96.789 E.08978
G2 X164.36 Y96.785 I-.309 J5.456 E.02022
G1 X164.311 Y96.858 E.00331
G1 X166.504 Y99.051 E.11692
G3 X166.301 Y99.502 I-2.128 J-.687 E.01868
G1 X165.18 Y98.381 E.05976
; WIPE_START
G1 F24000
G1 X166.301 Y99.502 E-.60244
G1 X166.43 Y99.258 E-.10485
G1 X166.477 Y99.128 E-.0527
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.791 J-.925 P1  F30000
G1 X163.834 Y96.869 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.103297
G1 F3000
G1 X163.679 Y96.763 E.00092
; LINE_WIDTH: 0.14522
G2 X163.377 Y96.648 I-.33 J.411 E.00273
; WIPE_START
G1 F24000
G1 X163.563 Y96.688 E-.44054
G1 X163.679 Y96.763 E-.31946
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.177 J-1.204 P1  F30000
G1 X162 Y96.516 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.340837
G1 F3000
G1 X162 Y96.864 E.00845
G1 X162 Y96.516 F30000
; LINE_WIDTH: 0.370574
G1 F3000
G1 X162 Y96.168 E.00929
; WIPE_START
G1 F24000
G1 X162 Y96.516 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.116 J-1.211 P1  F30000
G1 X160.623 Y96.648 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.156122
G1 F3000
G1 X160.482 Y96.678 E.00133
G2 X160.32 Y96.764 I.226 J.621 E.0017
; LINE_WIDTH: 0.133824
G1 X160.166 Y96.869 E.00137
; WIPE_START
G1 F24000
G1 X160.32 Y96.764 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.673 J-1.014 P1  F30000
G1 X93.086 Y141.374 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X93.122 Y141.37 E.00136
G1 X93.777 Y141.441 E.02453
G1 X94.391 Y141.656 E.02422
G1 X94.941 Y142.002 E.0242
G1 X95.4 Y142.461 E.0242
G1 X95.746 Y143.011 E.0242
G1 X95.961 Y143.625 E.0242
G1 X96.033 Y144.27 E.0242
G1 X95.961 Y144.916 E.0242
G1 X95.746 Y145.529 E.0242
G1 X95.4 Y146.079 E.0242
G1 X94.941 Y146.539 E.0242
G1 X94.391 Y146.885 E.0242
G1 X93.777 Y147.099 E.0242
M73 P28 R19
G1 X93.132 Y147.172 E.0242
G1 X92.486 Y147.099 E.0242
G1 X91.873 Y146.885 E.0242
G1 X91.323 Y146.539 E.0242
G1 X90.863 Y146.079 E.02422
G1 X90.514 Y145.52 E.02453
G1 X90.303 Y144.916 E.02384
G1 X90.23 Y144.27 E.0242
G1 X90.303 Y143.625 E.0242
G1 X90.518 Y143.011 E.0242
G1 X90.863 Y142.461 E.0242
G1 X91.323 Y142.002 E.0242
G1 X91.873 Y141.656 E.0242
G1 X92.486 Y141.442 E.0242
G1 X92.804 Y141.406 E.01193
G1 X93.026 Y141.381 E.00832
G1 X93.142 Y141.023 F30000
G1 F3000
G1 X93.142 Y141.023 E.00001
G1 X93.454 Y141.053 E.01168
G1 X93.766 Y141.084 E.01166
G1 X94.375 Y141.269 E.02372
G1 X94.937 Y141.569 E.02372
G1 X95.429 Y141.973 E.02372
G1 X95.833 Y142.465 E.02372
G1 X96.133 Y143.027 E.02372
G1 X96.318 Y143.637 E.02372
G1 X96.381 Y144.27 E.02372
G1 X96.318 Y144.904 E.02372
G1 X96.133 Y145.514 E.02372
G1 X95.833 Y146.075 E.02372
G1 X95.429 Y146.568 E.02372
G1 X94.937 Y146.972 E.02372
G1 X94.375 Y147.272 E.02372
G1 X93.766 Y147.457 E.02372
G1 X93.132 Y147.519 E.02372
G1 X92.498 Y147.457 E.02372
G1 X91.889 Y147.272 E.02372
G1 X91.327 Y146.972 E.02372
G1 X90.835 Y146.568 E.02372
G1 X90.431 Y146.075 E.02372
G1 X90.13 Y145.514 E.02372
G1 X89.945 Y144.904 E.02372
G1 X89.883 Y144.27 E.02372
G1 X89.945 Y143.637 E.02372
G1 X90.13 Y143.027 E.02372
G1 X90.431 Y142.465 E.02372
G1 X90.835 Y141.973 E.02372
G1 X91.327 Y141.569 E.02372
G1 X91.889 Y141.269 E.02372
G1 X92.498 Y141.084 E.02371
G1 X93.082 Y141.028 E.02187
; WIPE_START
G1 F24000
G1 X93.142 Y141.023 E-.02287
G1 X93.454 Y141.053 E-.11914
G1 X93.766 Y141.084 E-.119
G1 X94.375 Y141.269 E-.24201
G1 X94.937 Y141.569 E-.24201
G1 X94.967 Y141.594 E-.01497
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.135 J.438 P1  F30000
G1 X108.731 Y177.231 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X108.767 Y177.227 E.00136
G1 X109.422 Y177.299 E.02453
G1 X110.035 Y177.513 E.02422
G1 X110.585 Y177.859 E.0242
G1 X111.045 Y178.319 E.0242
G1 X111.391 Y178.869 E.0242
G1 X111.605 Y179.482 E.0242
G1 X111.678 Y180.128 E.0242
G1 X111.605 Y180.773 E.0242
G1 X111.391 Y181.387 E.0242
G1 X111.045 Y181.937 E.0242
G1 X110.585 Y182.396 E.0242
G1 X110.035 Y182.742 E.0242
G1 X109.422 Y182.957 E.0242
G1 X108.776 Y183.029 E.0242
G1 X108.131 Y182.957 E.0242
G1 X107.517 Y182.742 E.0242
G1 X106.967 Y182.396 E.0242
G1 X106.507 Y181.937 E.02422
G1 X106.159 Y181.378 E.02453
G1 X105.947 Y180.773 E.02384
G1 X105.875 Y180.128 E.0242
G1 X105.947 Y179.482 E.0242
G1 X106.162 Y178.869 E.0242
G1 X106.508 Y178.319 E.0242
G1 X106.967 Y177.859 E.0242
G1 X107.517 Y177.513 E.0242
G1 X108.131 Y177.299 E.0242
G1 X108.449 Y177.263 E.01193
G1 X108.671 Y177.238 E.00832
G1 X108.786 Y176.88 F30000
G1 F3000
G1 X108.786 Y176.88 E.00001
G1 X109.098 Y176.911 E.01168
G1 X109.41 Y176.941 E.01166
G1 X110.02 Y177.126 E.02372
G1 X110.581 Y177.426 E.02372
G1 X111.074 Y177.83 E.02372
G1 X111.478 Y178.323 E.02372
G1 X111.778 Y178.884 E.02372
G1 X111.963 Y179.494 E.02372
G1 X112.025 Y180.128 E.02372
G1 X111.963 Y180.762 E.02372
G1 X111.778 Y181.371 E.02372
G1 X111.478 Y181.933 E.02372
G1 X111.074 Y182.425 E.02372
G1 X110.581 Y182.829 E.02372
G1 X110.02 Y183.129 E.02372
G1 X109.41 Y183.314 E.02372
G1 X108.776 Y183.376 E.02372
G1 X108.142 Y183.314 E.02372
G1 X107.533 Y183.129 E.02372
G1 X106.971 Y182.829 E.02372
G1 X106.479 Y182.425 E.02372
G1 X106.075 Y181.933 E.02372
G1 X105.775 Y181.371 E.02372
G1 X105.59 Y180.762 E.02372
G1 X105.528 Y180.128 E.02372
G1 X105.59 Y179.494 E.02372
G1 X105.775 Y178.884 E.02372
G1 X106.075 Y178.323 E.02372
G1 X106.479 Y177.83 E.02372
G1 X106.971 Y177.426 E.02372
G1 X107.533 Y177.126 E.02372
G1 X108.142 Y176.941 E.02371
G1 X108.727 Y176.886 E.02187
M106 S214.2
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.786 Y176.88 E-.02287
G1 X109.098 Y176.911 E-.11914
G1 X109.41 Y176.941 E-.119
G1 X110.02 Y177.126 E-.24201
G1 X110.581 Y177.426 E-.24201
G1 X110.612 Y177.451 E-.01497
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/118
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
G3 Z.6 I.235 J1.194 P1  F30000
G1 X166.714 Y166.397 Z.6
G1 Z.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F12000
G1 X166.718 Y166.396 E.00014
G1 X167.406 Y166.462 E.02122
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.006 Y171.036 E.01969
G1 X168.553 Y171.489 E.01969
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X164.985 Y171.489 E.01969
G1 X164.532 Y171.036 E.01969
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.654 Y166.404 E.01614
M204 S10000
G1 X166.791 Y165.965 F30000
M204 S5000
G1 F12000
G1 X167.41 Y166.026 E.01912
G1 X168.027 Y166.213 E.01981
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.731 Y165.969 E.01865
M204 S10000
; WIPE_START
G1 F24000
G1 X167.41 Y166.026 E-.25897
G1 X168.027 Y166.213 E-.24501
G1 X168.596 Y166.517 E-.24501
G1 X168.618 Y166.536 E-.01102
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.316 J-1.175 P1  F30000
G1 X128.275 Y155.677 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.035 Y155.504 E.00982
G3 X126.848 Y153.047 I1.965 J-2.465 E.0936
G1 X126.848 Y140.032 E.43173
G3 X129.921 Y136.888 I3.154 J.01 E.16136
G3 X133.152 Y140.032 I.07 J3.16 E.16647
G1 X133.152 Y153.049 E.43178
G3 X128.325 Y155.709 I-3.152 J-.01 E.22249
G1 X128.481 Y155.343 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.28 Y155.197 E.00765
G3 X127.24 Y153.042 I1.72 J-2.158 E.07603
G1 X127.24 Y140.037 E.39961
G3 X129.931 Y137.28 I2.762 J.005 E.131
G3 X132.76 Y140.037 I.061 J2.767 E.13514
G1 X132.76 Y153.043 E.39963
G3 X128.532 Y155.376 I-2.76 J-.004 E.18067
M204 S10000
; WIPE_START
G1 F24000
G1 X128.28 Y155.197 E-.11742
G1 X128.073 Y155.015 E-.10455
G1 X127.886 Y154.814 E-.10456
G1 X127.72 Y154.594 E-.10457
G1 X127.576 Y154.36 E-.10456
G1 X127.457 Y154.112 E-.10455
G1 X127.363 Y153.853 E-.10456
G1 X127.353 Y153.814 E-.01524
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.089 J-.544 P1  F30000
G1 X98.986 Y97.047 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.004 Y97.052 E.00061
G3 X97.921 Y96.888 I-1.004 J2.988 E.62041
G1 X98.079 Y96.888 E.00521
G3 X98.701 Y96.966 I-.079 J3.151 E.02086
G1 X98.929 Y97.03 E.00783
G1 X98.879 Y97.423 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X97.931 Y97.28 I-.879 J2.616 E.50318
G1 X98.069 Y97.28 E.00423
G3 X98.822 Y97.405 I-.069 J2.759 E.02353
M204 S10000
; WIPE_START
G1 F24000
G1 X99.135 Y97.524 E-.12732
G1 X99.38 Y97.649 E-.10455
G1 X99.611 Y97.799 E-.10456
G1 X99.826 Y97.97 E-.10456
G1 X100.023 Y98.162 E-.10456
G1 X100.2 Y98.373 E-.10456
G1 X100.355 Y98.6 E-.10456
G1 X100.362 Y98.613 E-.00533
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.037 J1.216 P1  F30000
G1 X158.866 Y100.372 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X158.864 Y100.353 E.00061
G3 X161.921 Y96.888 I3.136 J-.314 E.17206
G1 X162.079 Y96.888 E.00521
G3 X158.911 Y100.664 I-.079 J3.151 E.4692
G1 X158.875 Y100.431 E.00783
G1 X159.254 Y100.314 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X161.931 Y97.28 I2.746 J-.275 E.13955
G1 X162.069 Y97.28 E.00423
G3 X159.261 Y100.374 I-.069 J2.759 E.38716
M204 S10000
; WIPE_START
G1 F24000
G1 X159.24 Y100.04 E-.12732
G1 X159.254 Y99.765 E-.10456
G1 X159.295 Y99.493 E-.10455
G1 X159.411 Y99.083 E-.16175
G1 X159.513 Y98.842 E-.09955
G1 X159.645 Y98.6 E-.10456
G1 X159.73 Y98.475 E-.05771
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.026 J-1.217 P1  F30000
G1 X93.3 Y97.043 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X95.177 Y96.142 I1.875 J1.5 E.07144
G1 X164.838 Y96.142 E2.31077
G3 X166.909 Y99.736 I-.012 J2.401 E.1661
G1 X133.822 Y157.637 E2.21217
G3 X126.177 Y157.636 I-3.822 J-2.179 E.30731
G1 X93.091 Y99.736 E2.21213
G3 X93.263 Y97.09 I2.084 J-1.193 E.09317
G1 X92.995 Y96.792 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X93.178 Y96.591 E.00836
G3 X95.172 Y95.75 I1.998 J1.953 E.06829
G1 X164.843 Y95.75 E2.14078
G3 X167.252 Y99.926 I-.018 J2.793 E.17872
G1 X134.16 Y157.836 E2.04944
G3 X125.84 Y157.836 I-4.16 J-2.377 E.30968
G1 X92.748 Y99.926 E2.04943
G3 X92.961 Y96.84 I2.427 J-1.383 E.10072
M204 S10000
; WIPE_START
G1 F24000
G1 X93.178 Y96.591 E-.12571
G1 X93.488 Y96.313 E-.15822
G1 X93.838 Y96.088 E-.15794
G1 X94.217 Y95.917 E-.15812
G1 X94.483 Y95.836 E-.10546
G1 X94.624 Y95.811 E-.05455
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.182 J-.291 P1  F30000
G1 X94.013 Y98.287 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.536154
G1 F12772.841
G1 X94.287 Y97.777 E.02324
G1 X94.082 Y99.889 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X94.145 Y99.346 E.0168
G1 X94.318 Y98.702 E.0205
G3 X95.332 Y97.17 I4.195 J1.675 E.05683
G1 X95.651 Y96.911 E.01262
G1 X94.946 Y96.944 E.02167
G1 X94.733 Y96.98 E.00666
G1 X94.36 Y97.141 E.01246
G1 X93.967 Y97.459 E.01555
G1 X93.747 Y97.777 E.01188
G1 X93.581 Y98.242 E.01516
G1 X93.553 Y98.624 E.01177
G1 X93.62 Y99.01 E.01205
G2 X94.051 Y99.838 I3.531 J-1.309 E.02875
G1 X94.537 Y100.722 F30000
G1 F15000
G1 X94.472 Y100.376 E.01082
G3 X94.672 Y98.831 I3.819 J-.29 E.04822
G3 X95.595 Y97.44 I3.845 J1.549 E.05163
G1 X96.065 Y97.07 E.01838
G1 X96.298 Y96.941 E.0082
G1 X96.231 Y96.817 E.00433
G3 X96.364 Y96.534 I.627 J.123 E.00972
G1 X95.194 Y96.534 E.03597
G1 X94.674 Y96.598 E.0161
G1 X94.133 Y96.84 E.01821
G1 X93.734 Y97.142 E.01535
G1 X93.438 Y97.532 E.01505
G1 X93.217 Y98.092 E.0185
G1 X93.18 Y98.679 E.01807
G1 X93.273 Y99.156 E.01492
G1 X93.491 Y99.644 E.01645
G1 X94.244 Y100.963 E.04667
G1 X94.378 Y100.735 E.00811
G1 X94.477 Y100.727 E.00307
G1 X94.867 Y101.268 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.59659
G1 F11378.635
G1 X94.73 Y101.629 E.01741
G1 X95.118 Y102.292 E.03464
G1 X95.637 Y102.361 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421701
G1 F15000
G1 X95.216 Y102.782 E.01838
G1 X95.411 Y103.123 E.01212
G1 X95.798 Y102.736 E.01689
G2 X96.11 Y102.959 I1.046 J-1.136 E.01189
G1 X95.606 Y103.464 E.02203
G1 X95.8 Y103.805 E.01212
G1 X96.447 Y103.158 E.02824
G1 X96.824 Y103.317 E.01262
G1 X95.995 Y104.146 E.03618
G1 X96.19 Y104.487 E.01212
G1 X97.236 Y103.44 E.04568
G2 X97.706 Y103.506 I.497 J-1.842 E.01468
G1 X96.385 Y104.828 E.05769
G1 X96.579 Y105.169 E.01212
G1 X98.238 Y103.51 E.0724
G2 X98.872 Y103.412 I-.075 J-2.578 E.01985
G1 X96.774 Y105.509 E.09156
G1 X96.969 Y105.85 E.01212
G1 X106.344 Y96.475 E.40924
G1 X106.88 Y96.475 E.01653
G1 X97.164 Y106.191 E.42412
G1 X97.359 Y106.532 E.01212
G1 X107.416 Y96.475 E.439
G1 X107.951 Y96.475 E.01653
G1 X97.553 Y106.873 E.45388
G1 X97.748 Y107.214 E.01212
G1 X108.487 Y96.475 E.46876
G1 X109.023 Y96.475 E.01653
G1 X97.943 Y107.555 E.48364
G1 X98.138 Y107.896 E.01212
G1 X109.558 Y96.475 E.49852
G1 X110.094 Y96.475 E.01653
G1 X98.333 Y108.237 E.5134
G1 X98.527 Y108.577 E.01212
G1 X110.63 Y96.475 E.52828
G1 X111.165 Y96.475 E.01653
G1 X98.722 Y108.918 E.54316
G1 X98.917 Y109.259 E.01212
G1 X111.701 Y96.475 E.55804
G1 X112.237 Y96.475 E.01653
G1 X99.112 Y109.6 E.57292
G1 X99.307 Y109.941 E.01212
G1 X112.772 Y96.475 E.5878
G1 X113.308 Y96.475 E.01653
G1 X99.501 Y110.282 E.60268
G1 X99.696 Y110.623 E.01212
G1 X113.844 Y96.475 E.61756
G1 X114.379 Y96.475 E.01653
G1 X99.891 Y110.964 E.63244
G1 X100.086 Y111.304 E.01212
G1 X114.915 Y96.475 E.64732
G1 X115.451 Y96.475 E.01653
G1 X100.281 Y111.645 E.6622
G1 X100.475 Y111.986 E.01212
G1 X115.986 Y96.475 E.67708
G1 X116.522 Y96.475 E.01653
G1 X100.67 Y112.327 E.69196
G1 X100.865 Y112.668 E.01212
G1 X117.058 Y96.475 E.70684
G1 X117.594 Y96.475 E.01653
G1 X101.06 Y113.009 E.72172
G1 X101.254 Y113.35 E.01212
G1 X118.129 Y96.475 E.7366
G1 X118.665 Y96.475 E.01653
G1 X101.449 Y113.691 E.75148
G1 X101.644 Y114.032 E.01212
G1 X119.201 Y96.475 E.76636
G1 X119.736 Y96.475 E.01653
G1 X101.839 Y114.372 E.78124
G1 X102.034 Y114.713 E.01212
G1 X120.272 Y96.475 E.79611
G1 X120.808 Y96.475 E.01653
G1 X102.228 Y115.054 E.81099
G1 X102.423 Y115.395 E.01212
G1 X121.343 Y96.475 E.82587
G1 X121.879 Y96.475 E.01653
G1 X102.618 Y115.736 E.84075
G1 X102.813 Y116.077 E.01212
G1 X122.415 Y96.475 E.85563
G1 X122.95 Y96.475 E.01653
G1 X103.008 Y116.418 E.87051
G1 X103.202 Y116.759 E.01212
G1 X123.486 Y96.475 E.88539
G1 X124.022 Y96.475 E.01653
G1 X103.397 Y117.1 E.90027
G1 X103.592 Y117.44 E.01212
G1 X124.557 Y96.475 E.91515
G1 X125.093 Y96.475 E.01653
G1 X103.787 Y117.781 E.93003
G1 X103.982 Y118.122 E.01212
G1 X125.629 Y96.475 E.94491
G1 X126.164 Y96.475 E.01653
G1 X104.176 Y118.463 E.95979
G1 X104.371 Y118.804 E.01212
G1 X126.7 Y96.475 E.97467
G1 X127.236 Y96.475 E.01653
G1 X104.566 Y119.145 E.98955
G1 X104.761 Y119.486 E.01212
G1 X127.771 Y96.475 E1.00443
G1 X128.307 Y96.475 E.01653
G1 X104.956 Y119.827 E1.01931
G1 X105.15 Y120.168 E.01212
G1 X128.843 Y96.475 E1.03419
G1 X129.378 Y96.475 E.01653
G1 X105.345 Y120.508 E1.04907
G1 X105.54 Y120.849 E.01212
G1 X129.914 Y96.475 E1.06395
G1 X130.45 Y96.475 E.01653
G1 X105.735 Y121.19 E1.07883
G1 X105.929 Y121.531 E.01212
G1 X130.985 Y96.475 E1.09371
G1 X131.521 Y96.475 E.01653
G1 X106.124 Y121.872 E1.10859
G1 X106.319 Y122.213 E.01212
G1 X132.057 Y96.475 E1.12347
G1 X132.592 Y96.475 E.01653
G1 X106.514 Y122.554 E1.13835
G1 X106.709 Y122.895 E.01212
G1 X133.128 Y96.475 E1.15323
G1 X133.664 Y96.475 E.01653
G1 X106.903 Y123.235 E1.16811
G1 X107.098 Y123.576 E.01212
G1 X134.199 Y96.475 E1.18299
G1 X134.735 Y96.475 E.01653
G1 X107.293 Y123.917 E1.19787
G1 X107.488 Y124.258 E.01212
G1 X135.271 Y96.475 E1.21275
G1 X135.806 Y96.475 E.01653
G1 X107.683 Y124.599 E1.22763
G1 X107.877 Y124.94 E.01212
G1 X136.342 Y96.475 E1.24251
G1 X136.878 Y96.475 E.01653
G1 X108.072 Y125.281 E1.25739
G1 X108.267 Y125.622 E.01212
G1 X137.413 Y96.475 E1.27227
M73 P29 R19
G1 X137.949 Y96.475 E.01653
G1 X108.462 Y125.963 E1.28715
G1 X108.657 Y126.303 E.01212
G1 X138.485 Y96.475 E1.30203
G1 X139.02 Y96.475 E.01653
G1 X108.851 Y126.644 E1.31691
G1 X109.046 Y126.985 E.01212
G1 X139.556 Y96.475 E1.33179
G1 X140.092 Y96.475 E.01653
G1 X109.241 Y127.326 E1.34667
G1 X109.436 Y127.667 E.01212
G1 X140.628 Y96.475 E1.36155
G1 X141.163 Y96.475 E.01653
G1 X109.631 Y128.008 E1.37643
G1 X109.825 Y128.349 E.01212
G1 X141.699 Y96.475 E1.39131
G1 X142.235 Y96.475 E.01653
G1 X110.02 Y128.69 E1.40619
G1 X110.215 Y129.031 E.01212
G1 X142.77 Y96.475 E1.42107
G1 X143.306 Y96.475 E.01653
G1 X110.41 Y129.371 E1.43595
G1 X110.605 Y129.712 E.01212
G1 X143.842 Y96.475 E1.45083
G1 X144.377 Y96.475 E.01653
G1 X110.799 Y130.053 E1.46571
G1 X110.994 Y130.394 E.01212
G1 X144.913 Y96.475 E1.48059
G1 X145.449 Y96.475 E.01653
G1 X111.189 Y130.735 E1.49547
G1 X111.384 Y131.076 E.01212
G1 X145.984 Y96.475 E1.51035
G1 X146.52 Y96.475 E.01653
G1 X111.578 Y131.417 E1.52523
G1 X111.773 Y131.758 E.01212
G1 X147.056 Y96.475 E1.54011
G1 X147.591 Y96.475 E.01653
G1 X111.968 Y132.099 E1.55499
G1 X112.163 Y132.439 E.01212
G1 X148.127 Y96.475 E1.56987
G1 X148.663 Y96.475 E.01653
G1 X112.358 Y132.78 E1.58475
G1 X112.552 Y133.121 E.01212
G1 X149.198 Y96.475 E1.59963
G1 X149.734 Y96.475 E.01653
G1 X112.747 Y133.462 E1.61451
G1 X112.942 Y133.803 E.01212
G1 X150.27 Y96.475 E1.62939
G1 X150.805 Y96.475 E.01653
G1 X113.137 Y134.144 E1.64427
G1 X113.332 Y134.485 E.01212
G1 X151.341 Y96.475 E1.65915
G1 X151.877 Y96.475 E.01653
G1 X113.526 Y134.826 E1.67403
G1 X113.721 Y135.166 E.01212
G1 X152.412 Y96.475 E1.68891
G1 X152.948 Y96.475 E.01653
G1 X113.916 Y135.507 E1.70379
G1 X114.111 Y135.848 E.01212
G1 X153.484 Y96.475 E1.71866
G1 X154.019 Y96.475 E.01653
G1 X114.306 Y136.189 E1.73354
G1 X114.5 Y136.53 E.01212
G1 X154.555 Y96.475 E1.74842
G1 X155.091 Y96.475 E.01653
G1 X114.695 Y136.871 E1.7633
G1 X114.89 Y137.212 E.01212
G1 X155.626 Y96.475 E1.77818
G1 X156.162 Y96.475 E.01653
G1 X115.085 Y137.553 E1.79306
G1 X115.28 Y137.894 E.01212
G1 X156.698 Y96.475 E1.80794
G1 X157.233 Y96.475 E.01653
G1 X115.474 Y138.234 E1.82282
G1 X115.669 Y138.575 E.01212
G1 X157.769 Y96.475 E1.8377
G1 X158.305 Y96.475 E.01653
G1 X115.864 Y138.916 E1.85258
G1 X116.059 Y139.257 E.01212
G1 X158.84 Y96.475 E1.86746
G1 X159.376 Y96.475 E.01653
G1 X116.253 Y139.598 E1.88234
G1 X116.448 Y139.939 E.01212
G1 X159.912 Y96.475 E1.89722
G1 X160.447 Y96.475 E.01653
G1 X116.643 Y140.28 E1.9121
G1 X116.838 Y140.621 E.01212
G1 X158.807 Y98.652 E1.83197
G2 X158.584 Y99.344 I2.69 J1.247 E.02251
G1 X158.572 Y99.422 E.00242
G1 X117.033 Y140.962 E1.81324
G1 X117.227 Y141.302 E.01212
G1 X158.515 Y100.015 E1.80225
G2 X158.551 Y100.515 I4.546 J-.07 E.01549
G1 X117.422 Y141.643 E1.7953
G1 X117.617 Y141.984 E.01212
G1 X158.642 Y100.96 E1.79076
G2 X158.776 Y101.361 I2.072 J-.47 E.01309
G1 X117.812 Y142.325 E1.78812
G1 X118.007 Y142.666 E.01212
G1 X158.949 Y101.724 E1.78717
G2 X159.156 Y102.052 I1.743 J-.873 E.012
G1 X118.201 Y143.007 E1.78773
G1 X118.396 Y143.348 E.01212
G1 X159.394 Y102.35 E1.7896
G2 X159.661 Y102.619 I1.477 J-1.198 E.01171
G1 X118.591 Y143.689 E1.79274
G1 X118.786 Y144.029 E.01212
G1 X159.957 Y102.859 E1.79715
G2 X160.283 Y103.068 I1.211 J-1.524 E.01198
G1 X118.981 Y144.37 E1.80287
G1 X119.175 Y144.711 E.01212
G1 X160.641 Y103.246 E1.81
G2 X161.034 Y103.388 I.907 J-1.896 E.01294
G1 X119.246 Y145.177 E1.82411
G1 X128.178 Y159.279 F30000
G1 F15000
G1 X131.12 Y156.336 E.12845
G3 X130.431 Y156.49 I-1.003 J-2.878 E.02184
G1 X127.953 Y158.967 E.10816
G1 X127.633 Y158.752 E.01192
G1 X129.866 Y156.519 E.09749
G3 X129.38 Y156.469 I.254 J-4.887 E.01508
G1 X127.334 Y158.516 E.08932
G1 X127.054 Y158.259 E.0117
G1 X128.953 Y156.361 E.08288
G3 X128.566 Y156.212 I.549 J-2.008 E.01282
G1 X126.812 Y157.966 E.07656
G3 X126.586 Y157.657 I1.139 J-1.072 E.01186
G1 X128.214 Y156.029 E.07107
G3 X127.893 Y155.813 I.916 J-1.708 E.01193
G1 X126.383 Y157.324 E.06595
G1 X126.188 Y156.983 E.01212
G1 X127.603 Y155.568 E.06178
G3 X127.342 Y155.294 I1.24 J-1.443 E.01171
G1 X125.993 Y156.642 E.05887
G1 X125.798 Y156.301 E.01212
G1 X127.111 Y154.989 E.0573
G3 X126.912 Y154.652 I1.584 J-1.162 E.01209
G1 X125.603 Y155.96 E.05712
G1 X125.409 Y155.62 E.01212
G1 X126.747 Y154.281 E.05841
G3 X126.62 Y153.873 I1.977 J-.841 E.01322
G1 X125.214 Y155.279 E.06136
G1 X125.019 Y154.938 E.01212
G1 X126.536 Y153.42 E.06623
G3 X126.515 Y152.907 I6.295 J-.524 E.01588
G1 X124.824 Y154.597 E.07379
G1 X124.63 Y154.256 E.01212
G1 X126.515 Y152.371 E.08229
G1 X126.515 Y151.835 E.01653
M73 P30 R19
G1 X124.435 Y153.915 E.09079
G1 X124.24 Y153.574 E.01212
G1 X126.515 Y151.3 E.09929
G1 X126.515 Y150.764 E.01653
G1 X124.045 Y153.233 E.1078
G1 X123.85 Y152.893 E.01212
G1 X126.515 Y150.228 E.1163
G1 X126.515 Y149.693 E.01653
G1 X123.656 Y152.552 E.1248
G1 X123.461 Y152.211 E.01212
G1 X126.515 Y149.157 E.13331
G1 X126.515 Y148.621 E.01653
G1 X123.266 Y151.87 E.14181
G1 X123.071 Y151.529 E.01212
G1 X126.515 Y148.085 E.15031
G1 X126.515 Y147.55 E.01653
G1 X122.876 Y151.188 E.15881
G1 X122.682 Y150.847 E.01212
G1 X126.515 Y147.014 E.16732
G1 X126.515 Y146.478 E.01653
G1 X122.487 Y150.506 E.17582
G1 X122.292 Y150.165 E.01212
G1 X126.515 Y145.943 E.18432
G1 X126.515 Y145.407 E.01653
G1 X122.097 Y149.825 E.19283
G1 X121.902 Y149.484 E.01212
G1 X126.515 Y144.871 E.20133
G1 X126.515 Y144.336 E.01653
G1 X121.708 Y149.143 E.20983
G1 X121.513 Y148.802 E.01212
G1 X126.515 Y143.8 E.21833
G1 X126.515 Y143.264 E.01653
G1 X121.318 Y148.461 E.22684
G1 X121.123 Y148.12 E.01212
G1 X126.515 Y142.729 E.23534
G1 X126.515 Y142.193 E.01653
G1 X120.928 Y147.779 E.24384
G1 X120.734 Y147.438 E.01212
G1 X126.515 Y141.657 E.25235
G1 X126.515 Y141.122 E.01653
G1 X120.539 Y147.097 E.26085
G1 X120.344 Y146.757 E.01212
G1 X126.515 Y140.586 E.26935
G1 X126.515 Y140.05 E.01653
G1 X120.149 Y146.416 E.27785
G1 X119.955 Y146.075 E.01212
G1 X126.566 Y139.463 E.28859
G3 X126.776 Y138.718 I3.683 J.635 E.02396
G1 X119.76 Y145.734 E.30627
G1 X119.565 Y145.393 E.01212
G1 X161.475 Y103.483 E1.82942
G2 X161.972 Y103.522 I.443 J-2.462 E.01541
G1 X128.675 Y136.819 E1.45347
G1 X128.722 Y136.796 E.00164
G3 X129.426 Y136.603 I1.506 J4.11 E.02255
G1 X162.552 Y103.478 E1.44595
G2 X163.292 Y103.273 I-.564 J-3.476 E.02377
G1 X130.008 Y136.557 E1.4529
G3 X130.506 Y136.594 I.064 J2.51 E.01546
G1 X164.594 Y102.507 E1.48795
G1 X164.849 Y102.662 E.00923
G1 X164.683 Y102.954 E.01036
G1 X130.95 Y136.686 E1.47245
G3 X131.345 Y136.827 I-.506 J2.043 E.01296
G1 X163.969 Y104.203 E1.42405
G1 X163.255 Y105.453 E.04443
G1 X131.704 Y137.003 E1.3772
G3 X132.031 Y137.212 I-.879 J1.739 E.01199
G1 X162.541 Y106.703 E1.33176
G1 X161.827 Y107.952 E.04443
G1 X132.328 Y137.451 E1.28763
G3 X132.596 Y137.719 I-1.205 J1.472 E.01171
G1 X161.113 Y109.202 E1.24477
G1 X160.398 Y110.452 E.04443
G1 X132.835 Y138.016 E1.20319
G3 X133.043 Y138.343 I-1.53 J1.206 E.01199
G1 X159.684 Y111.702 E1.16291
G1 X158.97 Y112.951 E.04443
G1 X133.219 Y138.703 E1.12409
G3 X133.354 Y139.103 I-1.931 J.878 E.01306
G1 X158.256 Y114.201 E1.087
G1 X157.542 Y115.451 E.04443
G1 X133.447 Y139.547 E1.0518
G3 X133.485 Y140.043 I-4.752 J.62 E.01539
G1 X156.828 Y116.701 E1.01894
G1 X156.114 Y117.95 E.04443
G1 X133.485 Y140.579 E.98777
G1 X133.485 Y141.115 E.01653
G1 X155.4 Y119.2 E.9566
G1 X154.686 Y120.45 E.04443
G1 X133.485 Y141.65 E.92543
G1 X133.485 Y142.186 E.01653
G1 X153.972 Y121.7 E.89426
G1 X153.258 Y122.949 E.04443
G1 X133.485 Y142.722 E.86309
G1 X133.485 Y143.258 E.01653
G1 X152.544 Y124.199 E.83192
G1 X151.83 Y125.449 E.04443
G1 X133.485 Y143.793 E.80075
G1 X133.485 Y144.329 E.01653
G1 X151.116 Y126.698 E.76958
G1 X150.402 Y127.948 E.04443
G1 X133.485 Y144.865 E.73842
G1 X133.485 Y145.4 E.01653
G1 X149.688 Y129.198 E.70725
G1 X148.974 Y130.448 E.04443
G1 X133.485 Y145.936 E.67608
G1 X133.485 Y146.472 E.01653
G1 X148.26 Y131.697 E.64491
G1 X147.546 Y132.947 E.04443
G1 X133.485 Y147.007 E.61374
G1 X133.485 Y147.543 E.01653
G1 X146.831 Y134.197 E.58257
G1 X146.117 Y135.447 E.04443
G1 X133.485 Y148.079 E.5514
G1 X133.485 Y148.614 E.01653
G1 X145.403 Y136.696 E.52023
G1 X144.689 Y137.946 E.04443
G1 X133.485 Y149.15 E.48906
G1 X133.485 Y149.686 E.01653
G1 X143.975 Y139.196 E.45789
G1 X143.261 Y140.445 E.04443
G1 X133.485 Y150.221 E.42673
G1 X133.485 Y150.757 E.01653
G1 X142.547 Y141.695 E.39556
G1 X141.833 Y142.945 E.04443
G1 X133.485 Y151.293 E.36439
G1 X133.485 Y151.828 E.01653
G1 X141.119 Y144.195 E.33322
G1 X140.405 Y145.444 E.04443
G1 X133.485 Y152.364 E.30205
G1 X133.485 Y152.9 E.01653
G1 X139.691 Y146.694 E.27088
G1 X138.977 Y147.944 E.04443
G1 X133.457 Y153.464 E.24095
G3 X133.296 Y154.16 I-2.855 J-.292 E.02211
G1 X138.263 Y149.194 E.21679
G1 X137.549 Y150.443 E.04443
G1 X128.686 Y159.306 E.38685
G2 X129.103 Y159.425 I.817 J-2.061 E.01339
G1 X136.835 Y151.693 E.33751
G1 X136.121 Y152.943 E.04443
G1 X129.564 Y159.5 E.28623
G2 X130.079 Y159.52 I.362 J-2.614 E.01594
G1 X135.407 Y154.192 E.23257
G1 X134.693 Y155.442 E.04443
G1 X130.665 Y159.47 E.17581
G2 X131.394 Y159.276 I-.957 J-5.079 E.0233
G1 X133.979 Y156.692 E.11282
G1 X133.537 Y157.465 E.02748
G3 X133.069 Y158.126 I-3.586 J-2.042 E.02502
G3 X132.039 Y159.167 I-24.509 J-23.217 E.0452
G1 X164.882 Y102.292 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.585713
G1 F11606.65
G1 X165.27 Y101.629 E.03396
G1 X165.133 Y101.268 E.01707
G1 X165.675 Y97.715 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.550918
G1 F12401.624
G3 X165.934 Y98.164 I-1.205 J.995 E.02153
G1 X165.905 Y99.936 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X166.27 Y99.296 E.02263
G1 X166.419 Y98.852 E.01438
G1 X166.449 Y98.545 E.0095
G1 X166.37 Y98.043 E.01559
G1 X166.201 Y97.68 E.01232
G1 X165.949 Y97.371 E.01225
G1 X165.632 Y97.134 E.01217
G1 X165.215 Y96.976 E.0137
G1 X164.528 Y96.911 E.02121
G1 X164.354 Y96.911 E.00535
G1 X164.966 Y97.478 E.02562
G3 X165.754 Y98.906 I-4.021 J3.15 E.05036
G1 X165.894 Y99.593 E.02154
G1 X165.903 Y99.876 E.00868
G1 X165.458 Y100.724 F30000
G1 F15000
G1 X165.618 Y100.738 E.00494
G1 X165.751 Y100.966 E.0081
G1 X166.614 Y99.455 E.05346
G1 X166.786 Y98.978 E.01558
G1 X166.824 Y98.581 E.01226
G1 X166.758 Y97.991 E.01823
G1 X166.501 Y97.452 E.01835
G1 X166.184 Y97.076 E.01511
G1 X165.787 Y96.79 E.01504
G1 X165.329 Y96.612 E.01511
G1 X164.816 Y96.534 E.01594
G1 X163.628 Y96.534 E.03652
G1 X163.762 Y96.824 E.00981
G1 X163.699 Y96.937 E.00397
G1 X164.195 Y97.257 E.01814
G1 X164.703 Y97.747 E.02168
G3 X165.389 Y99.002 I-3.813 J2.902 E.04412
G1 X165.524 Y99.668 E.02087
G1 X165.528 Y100.374 E.02168
G1 X165.47 Y100.665 E.00913
G1 X163.113 Y96.868 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.423377
G1 F15000
G1 X162.959 Y96.614 E.00919
; LINE_WIDTH: 0.44522
G1 X162.947 Y96.596 E.00072
; LINE_WIDTH: 0.499716
G1 F13791.741
G1 X162.935 Y96.577 E.00082
G1 X162.789 Y96.559 E.00548
; LINE_WIDTH: 0.467595
G1 F14834.893
G1 X162.612 Y96.541 E.00616
; LINE_WIDTH: 0.420099
G1 F15000
G1 X162.259 Y96.52 E.01085
; LINE_WIDTH: 0.386838
G1 X161.555 Y96.529 E.01973
; LINE_WIDTH: 0.410556
G1 X161.378 Y96.542 E.00532
; LINE_WIDTH: 0.437965
G1 X161.2 Y96.56 E.00576
; LINE_WIDTH: 0.480128
G1 F14409.636
G1 X161.065 Y96.577 E.00486
G1 X161.041 Y96.614 E.00157
; LINE_WIDTH: 0.445158
G1 F15000
G1 X160.887 Y96.868 E.00972
G1 X101.117 Y101.167 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421701
G1 F15000
G1 X105.809 Y96.475 E.2048
G1 X105.273 Y96.475 E.01653
G1 X101.475 Y100.273 E.1658
G2 X101.467 Y99.745 I-3.321 J-.216 E.01632
G1 X104.737 Y96.475 E.14275
G1 X104.202 Y96.475 E.01653
G1 X101.399 Y99.278 E.12235
G2 X101.277 Y98.864 I-2.13 J.401 E.01334
G1 X103.666 Y96.475 E.10428
G1 X103.13 Y96.475 E.01653
G1 X101.113 Y98.492 E.08804
G2 X100.922 Y98.148 I-1.237 J.464 E.0122
G1 X102.595 Y96.475 E.07302
G1 X102.059 Y96.475 E.01653
G1 X100.698 Y97.836 E.05942
G2 X100.438 Y97.56 I-1.046 J.723 E.01174
G1 X101.523 Y96.475 E.04737
G1 X100.988 Y96.475 E.01653
G1 X100.153 Y97.309 E.03642
G2 X99.843 Y97.084 I-1.055 J1.124 E.01187
G1 X100.452 Y96.475 E.02657
G1 X99.916 Y96.475 E.01653
G1 X99.365 Y97.026 E.02406
G1 X99.112 Y96.867 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.421884
G1 F15000
G1 X98.958 Y96.615 E.00912
; LINE_WIDTH: 0.443581
G1 X98.946 Y96.596 E.00074
; LINE_WIDTH: 0.499602
G1 F13795.182
G1 X98.934 Y96.577 E.00084
G1 X98.789 Y96.559 E.00545
; LINE_WIDTH: 0.467938
G1 F14822.909
G1 X98.612 Y96.541 E.00617
; LINE_WIDTH: 0.420441
G1 F15000
G1 X98.259 Y96.519 E.01086
; LINE_WIDTH: 0.38718
G1 X97.555 Y96.529 E.01975
; LINE_WIDTH: 0.410901
G1 X97.378 Y96.542 E.00532
; LINE_WIDTH: 0.438311
G1 X97.2 Y96.56 E.00577
; LINE_WIDTH: 0.48064
G1 F14392.788
G1 X97.066 Y96.577 E.00484
G1 X97.042 Y96.615 E.00161
; LINE_WIDTH: 0.443504
G1 F15000
G1 X96.888 Y96.867 E.00964
; WIPE_START
G1 F24000
G1 X97.042 Y96.615 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.212 J-.107 P1  F30000
G1 X93.077 Y141.415 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X93.081 Y141.415 E.00014
G1 X93.769 Y141.481 E.02122
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.369 Y146.054 E.01969
G1 X94.916 Y146.507 E.01969
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.348 Y146.507 E.01969
G1 X90.895 Y146.054 E.01969
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X93.017 Y141.422 E.01614
M204 S10000
G1 X93.154 Y140.984 F30000
M204 S5000
G1 F12000
G1 X93.773 Y141.045 E.01912
G1 X94.39 Y141.232 E.01981
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
M73 P30 R18
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.094 Y140.987 E.01865
M204 S10000
; WIPE_START
G1 F24000
G1 X93.773 Y141.045 E-.25897
G1 X94.39 Y141.232 E-.24501
G1 X94.959 Y141.536 E-.24501
G1 X94.981 Y141.554 E-.01102
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.136 J.437 P1  F30000
G1 X108.721 Y177.273 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X108.726 Y177.272 E.00014
G1 X109.413 Y177.338 E.02122
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
G1 X111.354 Y181.369 E.01969
G1 X111.013 Y181.912 E.01969
G1 X110.56 Y182.365 E.01969
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X106.992 Y182.365 E.01969
G1 X106.539 Y181.912 E.01969
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.661 Y177.279 E.01614
M204 S10000
G1 X108.799 Y176.841 F30000
M204 S5000
G1 F12000
G1 X109.418 Y176.902 E.01912
G1 X110.035 Y177.089 E.01981
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.739 Y176.844 E.01865
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.418 Y176.902 E-.25897
G1 X110.035 Y177.089 E-.24501
G1 X110.604 Y177.393 E-.24501
G1 X110.626 Y177.411 E-.01102
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/118
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
G3 Z.8 I.235 J1.194 P1  F30000
G1 X166.699 Y166.398 Z.8
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X166.7 Y166.398 E.00002
G1 X166.769 Y166.391 E.00213
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.006 Y171.036 E.01969
G1 X168.553 Y171.489 E.01969
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X164.985 Y171.489 E.01969
G1 X164.532 Y171.036 E.01969
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.64 Y166.405 E.01569
M204 S10000
G1 X166.808 Y165.967 F30000
M204 S5000
G1 F12000
G1 X167.41 Y166.026 E.01862
G1 X168.027 Y166.213 E.01981
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.748 Y165.971 E.01914
M204 S10000
; WIPE_START
G1 F24000
G1 X167.41 Y166.026 E-.25271
G1 X168.027 Y166.213 E-.24501
G1 X168.596 Y166.517 E-.24501
G1 X168.631 Y166.546 E-.01728
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.316 J-1.175 P1  F30000
G1 X128.275 Y155.677 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.035 Y155.504 E.00982
G3 X126.848 Y153.047 I1.965 J-2.465 E.0936
G1 X126.848 Y140.032 E.43173
G3 X129.921 Y136.888 I3.154 J.01 E.16136
G3 X133.152 Y140.032 I.07 J3.16 E.16647
G1 X133.152 Y153.049 E.4318
G3 X128.325 Y155.709 I-3.152 J-.01 E.22246
G1 X128.5 Y155.357 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.28 Y155.197 E.00837
G3 X127.24 Y153.042 I1.72 J-2.158 E.07603
G1 X127.24 Y140.037 E.39961
G3 X129.931 Y137.28 I2.762 J.005 E.131
G3 X132.76 Y140.037 I.061 J2.767 E.13514
G1 X132.76 Y153.043 E.39964
G3 X128.551 Y155.388 I-2.76 J-.004 E.17995
M204 S10000
; WIPE_START
G1 F24000
G1 X128.28 Y155.197 E-.12625
G1 X128.073 Y155.015 E-.10455
G1 X127.886 Y154.814 E-.10455
G1 X127.72 Y154.594 E-.10457
G1 X127.576 Y154.36 E-.10456
G1 X127.457 Y154.112 E-.10456
G1 X127.363 Y153.853 E-.10456
G1 X127.358 Y153.837 E-.0064
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.089 J-.544 P1  F30000
G1 X98.986 Y97.047 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.004 Y97.052 E.00061
G3 X97.921 Y96.888 I-1.004 J2.988 E.62041
G1 X98.079 Y96.888 E.00521
G3 X98.701 Y96.966 I-.079 J3.151 E.02086
G1 X98.929 Y97.03 E.00783
G1 X98.879 Y97.423 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X97.931 Y97.28 I-.879 J2.616 E.50318
G1 X98.069 Y97.28 E.00423
G3 X98.822 Y97.405 I-.069 J2.759 E.02353
M204 S10000
; WIPE_START
G1 F24000
G1 X99.135 Y97.524 E-.12733
G1 X99.38 Y97.649 E-.10455
G1 X99.611 Y97.799 E-.10456
G1 X99.826 Y97.97 E-.10455
G1 X100.023 Y98.162 E-.10456
G1 X100.2 Y98.373 E-.10456
G1 X100.355 Y98.6 E-.10456
G1 X100.362 Y98.613 E-.00533
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.036 J1.216 P1  F30000
G1 X158.862 Y100.335 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X158.848 Y100.04 E.00982
G3 X161.921 Y96.888 I3.152 J0 E.16164
G1 X162.079 Y96.888 E.00521
M73 P31 R18
G3 X158.868 Y100.395 I-.079 J3.151 E.47825
G1 X159.254 Y100.314 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X161.931 Y97.28 I2.746 J-.275 E.13955
G1 X162.069 Y97.28 E.00423
G3 X159.261 Y100.374 I-.069 J2.759 E.38716
M204 S10000
; WIPE_START
G1 F24000
G1 X159.24 Y100.04 E-.12731
G1 X159.254 Y99.765 E-.10456
G1 X159.295 Y99.493 E-.10455
G1 X159.406 Y99.096 E-.15676
G1 X159.513 Y98.842 E-.10456
G1 X159.645 Y98.6 E-.10456
G1 X159.73 Y98.475 E-.05769
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.026 J-1.217 P1  F30000
G1 X93.3 Y97.043 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X95.177 Y96.142 I1.875 J1.5 E.07144
G1 X164.848 Y96.142 E2.3111
G3 X166.909 Y99.736 I-.024 J2.401 E.16573
G1 X133.822 Y157.637 E2.21217
G3 X126.177 Y157.636 I-3.822 J-2.179 E.30733
G1 X93.091 Y99.736 E2.2121
G3 X93.263 Y97.09 I2.084 J-1.193 E.09317
G1 X92.994 Y96.793 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X93.178 Y96.59 E.00842
G3 X95.172 Y95.75 I1.998 J1.953 E.06829
G1 X164.853 Y95.75 E2.14109
G3 X167.252 Y99.926 I-.029 J2.794 E.17838
G1 X134.16 Y157.836 E2.04944
G3 X125.839 Y157.835 I-4.16 J-2.377 E.30969
G1 X92.748 Y99.926 E2.04942
G3 X92.96 Y96.842 I2.427 J-1.383 E.10067
M204 S10000
; WIPE_START
G1 F24000
G1 X93.178 Y96.59 E-.12632
G1 X93.488 Y96.313 E-.15802
G1 X93.838 Y96.088 E-.15812
G1 X94.088 Y95.968 E-.10546
G1 X94.482 Y95.836 E-.15783
G1 X94.622 Y95.811 E-.05423
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.183 J-.287 P1  F30000
G1 X94.02 Y98.289 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.552279
G1 F12368.488
G1 X94.204 Y97.884 E.01847
G1 X94.281 Y97.774 E.00557
G1 X94.082 Y99.889 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G3 X95.643 Y96.911 I3.972 J.183 E.10667
G2 X94.733 Y96.98 I-.161 J3.893 E.02812
G1 X94.362 Y97.14 E.01239
G1 X93.967 Y97.46 E.01563
G1 X93.747 Y97.776 E.01184
G1 X93.58 Y98.244 E.01526
G2 X93.62 Y99.01 I1.571 J.302 E.02381
G2 X94.051 Y99.838 I3.531 J-1.309 E.02875
G1 X94.537 Y100.722 F30000
G1 F15000
G1 X94.472 Y100.376 E.01082
G3 X94.88 Y98.359 I3.828 J-.275 E.06401
G3 X95.513 Y97.514 I3.094 J1.659 E.03257
G1 X96.107 Y97.051 E.02312
G1 X96.283 Y96.941 E.00639
G1 X96.231 Y96.819 E.00409
G3 X96.364 Y96.534 I.618 J.116 E.00978
G1 X95.194 Y96.534 E.03597
G1 X94.674 Y96.598 E.01609
G1 X94.135 Y96.839 E.01814
G1 X93.734 Y97.142 E.01543
G1 X93.396 Y97.638 E.01844
G1 X93.216 Y98.093 E.01504
G1 X93.18 Y98.681 E.01811
G1 X93.273 Y99.155 E.01485
G1 X93.491 Y99.644 E.01645
G1 X94.244 Y100.963 E.04667
G1 X94.378 Y100.735 E.00811
G1 X94.477 Y100.727 E.00307
G1 X94.867 Y101.268 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.596582
G1 F11378.785
G1 X94.73 Y101.629 E.01741
G1 X95.118 Y102.292 E.03464
; WIPE_START
G1 F24000
G1 X94.73 Y101.629 E-.50575
G1 X94.867 Y101.268 E-.25425
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.106 J.508 P1  F30000
G1 X96.888 Y96.867 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.443536
G1 F15000
G1 X97.042 Y96.615 E.00964
; LINE_WIDTH: 0.480628
G1 F14393.169
G1 X97.066 Y96.577 E.00161
G1 X97.2 Y96.56 E.00484
; LINE_WIDTH: 0.438306
G1 F15000
G1 X97.378 Y96.542 E.00576
; LINE_WIDTH: 0.410896
G1 X97.555 Y96.529 E.00532
; LINE_WIDTH: 0.38717
G1 X98.259 Y96.519 E.01975
; LINE_WIDTH: 0.420432
G1 X98.612 Y96.541 E.01086
; LINE_WIDTH: 0.467924
G1 F14823.407
G1 X98.789 Y96.559 E.00616
; LINE_WIDTH: 0.499607
G1 F13795.012
G1 X98.934 Y96.577 E.00545
G1 X98.946 Y96.596 E.00084
; LINE_WIDTH: 0.443646
G1 F15000
G1 X98.958 Y96.615 E.00074
; LINE_WIDTH: 0.421934
G1 X99.112 Y96.867 E.00912
G1 X158.894 Y101.19 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421653
G1 F15000
G1 X154.18 Y96.476 E.20575
G1 X154.716 Y96.476 E.01653
G1 X158.526 Y100.286 E.16632
G3 X158.528 Y99.753 I2.666 J-.257 E.0165
G1 X155.251 Y96.476 E.14303
G1 X155.787 Y96.476 E.01653
G1 X158.6 Y99.288 E.12277
G1 X158.717 Y98.87 E.0134
G1 X156.322 Y96.476 E.10452
G1 X156.858 Y96.476 E.01653
G1 X158.877 Y98.495 E.08812
G3 X159.072 Y98.154 I1.8 J.804 E.01213
G1 X157.394 Y96.476 E.07325
G1 X157.929 Y96.476 E.01653
G1 X159.298 Y97.844 E.05972
G3 X159.553 Y97.563 I1.53 J1.134 E.01172
G1 X158.465 Y96.476 E.04747
G1 X159.001 Y96.476 E.01653
G1 X159.837 Y97.312 E.03649
G3 X160.15 Y97.09 I1.266 J1.456 E.01188
G1 X159.536 Y96.476 E.0268
G1 X160.072 Y96.476 E.01653
G1 X160.621 Y97.025 E.02397
G1 X160.887 Y96.868 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.446275
G1 F15000
G1 X161.041 Y96.614 E.00977
; LINE_WIDTH: 0.479771
G1 F14421.393
G1 X161.064 Y96.577 E.00154
G1 X161.2 Y96.56 E.00488
; LINE_WIDTH: 0.437728
G1 F15000
G1 X161.378 Y96.542 E.00576
; LINE_WIDTH: 0.41032
G1 X161.555 Y96.529 E.00532
; LINE_WIDTH: 0.3866
G1 X162.259 Y96.52 E.01972
; LINE_WIDTH: 0.419862
G1 X162.612 Y96.541 E.01085
; LINE_WIDTH: 0.467349
G1 F14843.497
G1 X162.789 Y96.559 E.00615
; LINE_WIDTH: 0.499789
G1 F13789.509
G1 X162.936 Y96.577 E.00551
G1 X162.947 Y96.596 E.0008
; LINE_WIDTH: 0.446375
G1 F15000
G1 X162.959 Y96.614 E.00071
; LINE_WIDTH: 0.424425
G1 X163.113 Y96.868 E.00924
G1 X165.675 Y97.716 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.550983
G1 F12400.053
G3 X165.935 Y98.166 I-1.206 J.996 E.02161
G1 X165.905 Y99.936 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X166.27 Y99.296 E.02263
G1 X166.419 Y98.852 E.01438
G1 X166.449 Y98.545 E.0095
G1 X166.371 Y98.046 E.01551
G1 X166.201 Y97.68 E.0124
G1 X165.949 Y97.371 E.01225
G1 X165.628 Y97.132 E.01229
G1 X165.216 Y96.976 E.01355
G1 X164.528 Y96.912 E.02124
G1 X164.354 Y96.912 E.00534
G1 X164.966 Y97.478 E.02561
G3 X165.754 Y98.906 I-4.027 J3.153 E.05036
G1 X165.894 Y99.593 E.02154
G1 X165.903 Y99.876 E.00868
G1 X165.461 Y100.726 F30000
G1 F15000
G1 X165.619 Y100.738 E.00486
G1 X165.751 Y100.966 E.00809
G1 X166.614 Y99.455 E.05346
G1 X166.786 Y98.978 E.01558
G1 X166.824 Y98.581 E.01227
G1 X166.759 Y97.994 E.01814
G1 X166.501 Y97.452 E.01844
G1 X166.184 Y97.076 E.01513
G1 X165.783 Y96.788 E.01516
G1 X165.329 Y96.611 E.01496
G1 X164.826 Y96.534 E.01565
G1 X163.629 Y96.534 E.03678
G1 X163.763 Y96.824 E.00981
G1 X163.7 Y96.938 E.00398
G1 X164.195 Y97.257 E.01811
G1 X164.703 Y97.747 E.02168
G3 X165.392 Y99.013 I-3.771 J2.874 E.04446
G1 X165.524 Y99.668 E.02053
G1 X165.528 Y100.374 E.02168
G1 X165.472 Y100.667 E.00916
G1 X165.133 Y101.268 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.585705
G1 F11606.815
G1 X165.27 Y101.629 E.01707
G1 X164.883 Y102.29 E.03386
G1 X164.902 Y102.912 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421653
G1 F15000
G1 X164.477 Y102.488 E.01854
G3 X164.196 Y102.742 I-1.437 J-1.308 E.01172
G1 X164.583 Y103.129 E.01689
G1 X164.388 Y103.47 E.01212
G1 X163.885 Y102.967 E.02195
G3 X163.543 Y103.161 I-1.14 J-1.61 E.01214
G1 X164.193 Y103.811 E.02836
G1 X163.998 Y104.151 E.01212
G1 X163.168 Y103.321 E.03623
G3 X162.753 Y103.442 I-1.806 J-5.427 E.01334
G1 X163.804 Y104.492 E.04584
G1 X163.609 Y104.833 E.01212
G1 X162.285 Y103.51 E.05777
G3 X161.756 Y103.516 I-.298 J-2.64 E.01635
G1 X163.414 Y105.174 E.07235
G1 X163.219 Y105.515 E.01212
G1 X160.852 Y103.148 E.10331
G1 X163.149 Y105.98 F30000
G1 F15000
G1 X153.644 Y96.476 E.41483
G1 X153.109 Y96.476 E.01653
G1 X162.83 Y106.197 E.42428
G1 X162.635 Y106.537 E.01212
G1 X152.573 Y96.476 E.43916
G1 X152.038 Y96.475 E.01653
G1 X162.44 Y106.878 E.45403
G1 X162.246 Y107.219 E.01212
G1 X151.502 Y96.475 E.46891
G1 X150.966 Y96.475 E.01653
G1 X162.051 Y107.56 E.48379
G1 X161.856 Y107.901 E.01212
G1 X150.431 Y96.475 E.49866
G1 X149.895 Y96.475 E.01653
G1 X161.661 Y108.242 E.51354
G1 X161.467 Y108.583 E.01212
G1 X149.359 Y96.475 E.52842
G1 X148.824 Y96.475 E.01653
G1 X161.272 Y108.923 E.5433
G1 X161.077 Y109.264 E.01212
G1 X148.288 Y96.475 E.55817
G1 X147.753 Y96.475 E.01653
G1 X160.882 Y109.605 E.57305
G1 X160.688 Y109.946 E.01212
G1 X147.217 Y96.475 E.58793
G1 X146.681 Y96.475 E.01653
G1 X160.493 Y110.287 E.6028
G1 X160.298 Y110.628 E.01212
G1 X146.146 Y96.475 E.61768
G1 X145.61 Y96.475 E.01653
G1 X160.103 Y110.969 E.63256
G1 X159.909 Y111.309 E.01212
G1 X145.075 Y96.475 E.64743
G1 X144.539 Y96.475 E.01653
G1 X159.714 Y111.65 E.66231
G1 X159.519 Y111.991 E.01212
G1 X144.003 Y96.475 E.67719
G1 X143.468 Y96.475 E.01653
G1 X159.324 Y112.332 E.69207
G1 X159.13 Y112.673 E.01212
G1 X142.932 Y96.475 E.70694
G1 X142.396 Y96.475 E.01653
G1 X158.935 Y113.014 E.72182
G1 X158.74 Y113.355 E.01212
G1 X141.861 Y96.475 E.7367
G1 X141.325 Y96.475 E.01653
G1 X158.545 Y113.695 E.75157
G1 X158.351 Y114.036 E.01212
G1 X140.79 Y96.475 E.76645
G1 X140.254 Y96.475 E.01653
G1 X158.156 Y114.377 E.78133
G1 X157.961 Y114.718 E.01212
G1 X139.718 Y96.475 E.7962
G1 X139.183 Y96.475 E.01653
G1 X157.766 Y115.059 E.81108
G1 X157.572 Y115.4 E.01212
G1 X138.647 Y96.475 E.82596
G1 X138.112 Y96.475 E.01653
G1 X157.377 Y115.741 E.84084
G1 X157.182 Y116.081 E.01212
G1 X137.576 Y96.475 E.85571
G1 X137.04 Y96.475 E.01653
G1 X156.987 Y116.422 E.87059
G1 X156.792 Y116.763 E.01212
G1 X136.505 Y96.475 E.88547
G1 X135.969 Y96.475 E.01653
G1 X156.598 Y117.104 E.90034
G1 X156.403 Y117.445 E.01212
G1 X135.434 Y96.475 E.91522
G1 X134.898 Y96.475 E.01653
G1 X156.208 Y117.786 E.9301
G1 X156.013 Y118.127 E.01212
G1 X134.362 Y96.475 E.94497
G1 X133.827 Y96.475 E.01653
G1 X155.819 Y118.467 E.95985
G1 X155.624 Y118.808 E.01212
G1 X133.291 Y96.475 E.97473
G1 X132.755 Y96.475 E.01653
G1 X155.429 Y119.149 E.98961
G1 X155.234 Y119.49 E.01212
G1 X132.22 Y96.475 E1.00448
G1 X131.684 Y96.475 E.01653
G1 X155.04 Y119.831 E1.01936
G1 X154.845 Y120.172 E.01212
G1 X131.149 Y96.475 E1.03424
G1 X130.613 Y96.475 E.01653
G1 X154.65 Y120.513 E1.04911
G1 X154.455 Y120.853 E.01212
G1 X130.077 Y96.475 E1.06399
G1 X129.542 Y96.475 E.01653
G1 X154.261 Y121.194 E1.07887
G1 X154.066 Y121.535 E.01212
G1 X129.006 Y96.475 E1.09374
G1 X128.471 Y96.475 E.01653
G1 X153.871 Y121.876 E1.10862
G1 X153.676 Y122.217 E.01212
G1 X127.935 Y96.475 E1.1235
G1 X127.399 Y96.475 E.01653
G1 X153.482 Y122.558 E1.13838
G1 X153.287 Y122.899 E.01212
G1 X126.864 Y96.475 E1.15325
G1 X126.328 Y96.475 E.01653
G1 X153.092 Y123.239 E1.16813
G1 X152.897 Y123.58 E.01212
G1 X125.792 Y96.475 E1.18301
G1 X125.257 Y96.475 E.01653
G1 X152.703 Y123.921 E1.19788
G1 X152.508 Y124.262 E.01212
G1 X124.721 Y96.475 E1.21276
G1 X124.186 Y96.475 E.01653
G1 X152.313 Y124.603 E1.22764
G1 X152.118 Y124.944 E.01212
G1 X123.65 Y96.475 E1.24251
G1 X123.114 Y96.475 E.01653
G1 X151.924 Y125.285 E1.25739
G1 X151.729 Y125.625 E.01212
G1 X122.579 Y96.475 E1.27227
G1 X122.043 Y96.475 E.01653
G1 X151.534 Y125.966 E1.28715
G1 X151.339 Y126.307 E.01212
G1 X121.508 Y96.475 E1.30202
G1 X120.972 Y96.475 E.01653
G1 X151.145 Y126.648 E1.3169
G1 X150.95 Y126.989 E.01212
G1 X120.436 Y96.475 E1.33178
G1 X119.901 Y96.475 E.01653
G1 X150.755 Y127.33 E1.34665
G1 X150.56 Y127.67 E.01212
G1 X119.365 Y96.475 E1.36153
G1 X118.829 Y96.475 E.01653
G1 X150.366 Y128.011 E1.37641
G1 X150.171 Y128.352 E.01212
G1 X118.294 Y96.475 E1.39128
G1 X117.758 Y96.475 E.01653
G1 X149.976 Y128.693 E1.40616
G1 X149.781 Y129.034 E.01212
G1 X117.223 Y96.475 E1.42104
G1 X116.687 Y96.475 E.01653
G1 X149.587 Y129.375 E1.43592
G1 X149.392 Y129.716 E.01212
G1 X116.151 Y96.475 E1.45079
G1 X115.616 Y96.475 E.01653
G1 X149.197 Y130.056 E1.46567
G1 X149.002 Y130.397 E.01212
G1 X115.08 Y96.475 E1.48055
G1 X114.545 Y96.475 E.01653
G1 X148.808 Y130.738 E1.49542
G1 X148.613 Y131.079 E.01212
G1 X114.009 Y96.475 E1.5103
G1 X113.473 Y96.475 E.01653
G1 X148.418 Y131.42 E1.52518
G1 X148.223 Y131.761 E.01212
G1 X112.938 Y96.475 E1.54005
G1 X112.402 Y96.475 E.01653
G1 X148.029 Y132.102 E1.55493
G1 X147.834 Y132.442 E.01212
G1 X111.866 Y96.475 E1.56981
G1 X111.331 Y96.475 E.01653
G1 X147.639 Y132.783 E1.58469
G1 X147.444 Y133.124 E.01212
G1 X110.795 Y96.475 E1.59956
G1 X110.26 Y96.475 E.01653
G1 X147.25 Y133.465 E1.61444
G1 X147.055 Y133.806 E.01212
G1 X109.724 Y96.475 E1.62932
G1 X109.188 Y96.475 E.01653
G1 X146.86 Y134.147 E1.64419
G1 X146.665 Y134.488 E.01212
G1 X108.653 Y96.475 E1.65907
G1 X108.117 Y96.475 E.01653
G1 X146.471 Y134.828 E1.67395
G1 X146.276 Y135.169 E.01212
G1 X107.582 Y96.475 E1.68882
G1 X107.046 Y96.475 E.01653
G1 X146.081 Y135.51 E1.7037
G1 X145.886 Y135.851 E.01212
G1 X106.51 Y96.475 E1.71858
G1 X105.975 Y96.475 E.01653
G1 X145.692 Y136.192 E1.73346
G1 X145.497 Y136.533 E.01212
G1 X105.439 Y96.475 E1.74833
G1 X104.904 Y96.475 E.01653
G1 X145.302 Y136.874 E1.76321
M73 P32 R18
G1 X145.107 Y137.214 E.01212
G1 X104.368 Y96.475 E1.77809
G1 X103.832 Y96.475 E.01653
G1 X144.913 Y137.555 E1.79296
G1 X144.718 Y137.896 E.01212
G1 X103.297 Y96.475 E1.80784
G1 X102.761 Y96.475 E.01653
G1 X144.523 Y138.237 E1.82272
G1 X144.328 Y138.578 E.01212
G1 X102.225 Y96.475 E1.83759
G1 X101.69 Y96.475 E.01653
G1 X144.134 Y138.919 E1.85247
G1 X143.939 Y139.26 E.01212
G1 X101.154 Y96.475 E1.86735
G1 X100.619 Y96.475 E.01653
G1 X143.744 Y139.6 E1.88223
G1 X143.549 Y139.941 E.01212
G1 X100.083 Y96.475 E1.8971
G1 X99.559 Y96.475 E.01617
G1 X143.355 Y140.282 E1.91173
G1 X143.16 Y140.623 E.01212
G1 X101.203 Y98.666 E1.83123
G1 X101.379 Y99.179 E.01675
G1 X101.421 Y99.42 E.00754
G1 X142.965 Y140.964 E1.8132
G1 X142.77 Y141.305 E.01212
G1 X101.485 Y100.019 E1.80191
G3 X101.446 Y100.516 I-3.979 J-.059 E.01539
G1 X142.575 Y141.646 E1.7951
G1 X142.381 Y141.986 E.01212
G1 X101.358 Y100.964 E1.79044
G3 X101.219 Y101.36 I-1.649 J-.36 E.01299
G1 X142.186 Y142.327 E1.78804
G1 X141.991 Y142.668 E.01212
G1 X101.049 Y101.726 E1.78692
G3 X100.842 Y102.054 I-1.739 J-.873 E.012
G1 X141.796 Y143.009 E1.78749
G1 X141.602 Y143.35 E.01212
G1 X100.603 Y102.351 E1.78942
G1 X100.338 Y102.622 E.01169
G1 X141.407 Y143.691 E1.79247
G1 X141.212 Y144.032 E.01212
G1 X100.044 Y102.863 E1.79682
G3 X99.717 Y103.072 I-5.284 J-7.905 E.01197
G1 X141.017 Y144.372 E1.80258
G1 X140.823 Y144.713 E.01212
G1 X99.356 Y103.246 E1.80985
G1 X98.963 Y103.389 E.0129
G1 X140.628 Y145.054 E1.81849
G1 X140.433 Y145.395 E.01212
G1 X98.52 Y103.482 E1.82932
G1 X98.025 Y103.522 E.01534
G1 X131.317 Y136.814 E1.45305
G2 X130.569 Y136.602 I-1.043 J2.255 E.02408
G1 X97.441 Y103.474 E1.44591
G3 X96.707 Y103.276 I.655 J-3.889 E.02347
G1 X129.988 Y136.557 E1.45255
G2 X129.492 Y136.596 I-.089 J1.999 E.01539
G1 X95.404 Y102.508 E1.4878
G1 X95.148 Y102.664 E.00924
G1 X95.314 Y102.954 E.01031
G1 X129.047 Y136.687 E1.4723
G2 X128.654 Y136.829 I.371 J1.641 E.01294
G1 X96.028 Y104.203 E1.42396
G1 X96.742 Y105.453 E.04442
G1 X128.292 Y137.003 E1.37701
G2 X127.969 Y137.216 I.545 J1.177 E.01198
G1 X97.456 Y106.703 E1.33176
G1 X98.17 Y107.953 E.04442
G1 X127.673 Y137.456 E1.28767
G2 X127.402 Y137.72 I.915 J1.213 E.01172
G1 X98.885 Y109.203 E1.24464
G1 X99.599 Y110.452 E.04442
G1 X127.165 Y138.018 E1.20312
G2 X126.96 Y138.349 I1.216 J.981 E.01204
G1 X100.313 Y111.702 E1.16301
G1 X101.027 Y112.952 E.04442
G1 X126.78 Y138.705 E1.12402
G2 X126.645 Y139.106 I1.943 J.88 E.01306
G1 X101.741 Y114.202 E1.08694
G1 X102.455 Y115.451 E.04442
G1 X126.553 Y139.549 E1.05175
G2 X126.515 Y140.046 I4.733 J.615 E.0154
G1 X103.169 Y116.701 E1.01891
G1 X103.884 Y117.951 E.04442
G1 X126.515 Y140.582 E.98774
G1 X126.515 Y141.117 E.01653
G1 X104.598 Y119.201 E.95657
G1 X105.312 Y120.45 E.04442
G1 X126.515 Y141.653 E.9254
G1 X126.515 Y142.189 E.01653
G1 X106.026 Y121.7 E.89423
G1 X106.74 Y122.95 E.04442
G1 X126.515 Y142.724 E.86306
G1 X126.515 Y143.26 E.01653
G1 X107.454 Y124.2 E.83189
G1 X108.169 Y125.449 E.04442
G1 X126.515 Y143.795 E.80072
G1 X126.515 Y144.331 E.01653
G1 X108.883 Y126.699 E.76956
G1 X109.597 Y127.949 E.04442
G1 X126.515 Y144.867 E.73839
G1 X126.515 Y145.402 E.01653
G1 X110.311 Y129.199 E.70722
G1 X111.025 Y130.448 E.04442
G1 X126.515 Y145.938 E.67605
G1 X126.515 Y146.474 E.01653
G1 X111.739 Y131.698 E.64488
G1 X112.453 Y132.948 E.04442
G1 X126.515 Y147.009 E.61371
G1 X126.515 Y147.545 E.01653
G1 X113.168 Y134.198 E.58254
G1 X113.882 Y135.447 E.04442
G1 X126.515 Y148.08 E.55137
G1 X126.515 Y148.616 E.01653
G1 X114.596 Y136.697 E.5202
G1 X115.31 Y137.947 E.04442
G1 X126.515 Y149.152 E.48903
G1 X126.515 Y149.687 E.01653
G1 X116.024 Y139.197 E.45786
G1 X116.738 Y140.446 E.04442
G1 X126.515 Y150.223 E.42669
G1 X126.515 Y150.758 E.01653
G1 X117.452 Y141.696 E.39553
G1 X118.167 Y142.946 E.04442
G1 X126.515 Y151.294 E.36436
G1 X126.515 Y151.83 E.01653
G1 X118.881 Y144.196 E.33319
G1 X119.595 Y145.445 E.04442
G1 X126.515 Y152.365 E.30202
G1 X126.515 Y152.901 E.01653
G1 X120.309 Y146.695 E.27085
G1 X121.023 Y147.945 E.04442
G1 X126.543 Y153.465 E.24092
G2 X126.703 Y154.16 I3.662 J-.475 E.02205
G1 X121.737 Y149.195 E.21672
G1 X122.451 Y150.444 E.04442
G1 X131.311 Y159.304 E.38667
M73 P33 R18
G2 X131.694 Y159.151 I-.586 J-2.027 E.01274
G1 X128.878 Y156.336 E.12289
G2 X129.573 Y156.495 I1.122 J-3.299 E.02204
G1 X132.046 Y158.968 E.10794
G2 X132.371 Y158.757 I-.913 J-1.759 E.01197
G1 X130.134 Y156.52 E.09762
G1 X130.619 Y156.47 E.01504
G1 X132.669 Y158.52 E.08949
G2 X132.943 Y158.258 I-1.199 J-1.524 E.01171
G1 X131.046 Y156.361 E.08278
G2 X131.43 Y156.21 I-.412 J-1.609 E.01278
G1 X133.191 Y157.971 E.07685
G2 X133.414 Y157.658 I-1.476 J-1.287 E.01187
G1 X131.786 Y156.03 E.07105
G1 X132.105 Y155.813 E.0119
G1 X133.617 Y157.325 E.066
G1 X133.812 Y156.984 E.01212
G1 X132.396 Y155.569 E.06178
G2 X132.657 Y155.294 I-1.24 J-1.443 E.01171
G1 X134.006 Y156.643 E.05887
G1 X134.201 Y156.302 E.01212
G1 X132.884 Y154.985 E.05751
G2 X133.082 Y154.648 I-1.018 J-.828 E.01211
G1 X134.396 Y155.962 E.05733
G1 X134.591 Y155.621 E.01212
G1 X133.253 Y154.283 E.0584
G2 X133.38 Y153.875 I-1.976 J-.841 E.01322
G1 X134.785 Y155.28 E.06133
G1 X134.98 Y154.939 E.01212
G1 X133.463 Y153.422 E.0662
G2 X133.485 Y152.909 I-6.143 J-.521 E.01587
G1 X135.175 Y154.598 E.07374
G1 X135.37 Y154.257 E.01212
G1 X133.485 Y152.373 E.08224
G1 X133.485 Y151.837 E.01653
G1 X135.564 Y153.916 E.09074
G1 X135.759 Y153.576 E.01212
G1 X133.485 Y151.302 E.09924
G1 X133.485 Y150.766 E.01653
G1 X135.954 Y153.235 E.10774
G1 X136.149 Y152.894 E.01212
G1 X133.485 Y150.231 E.11624
G1 X133.485 Y149.695 E.01653
G1 X136.343 Y152.553 E.12474
G1 X136.538 Y152.212 E.01212
G1 X133.485 Y149.159 E.13324
G1 X133.485 Y148.624 E.01653
G1 X136.733 Y151.871 E.14174
G1 X136.928 Y151.53 E.01212
G1 X133.485 Y148.088 E.15024
G1 X133.485 Y147.553 E.01653
G1 X137.122 Y151.19 E.15874
G1 X137.317 Y150.849 E.01212
G1 X133.485 Y147.017 E.16724
G1 X133.485 Y146.481 E.01653
G1 X137.512 Y150.508 E.17574
G1 X137.707 Y150.167 E.01212
G1 X133.485 Y145.946 E.18424
G1 X133.485 Y145.41 E.01653
G1 X137.901 Y149.826 E.19274
G1 X138.096 Y149.485 E.01212
G1 X133.485 Y144.874 E.20124
G1 X133.485 Y144.339 E.01653
G1 X138.291 Y149.144 E.20974
G1 X138.486 Y148.804 E.01212
G1 X133.485 Y143.803 E.21824
G1 X133.485 Y143.268 E.01653
G1 X138.68 Y148.463 E.22674
G1 X138.875 Y148.122 E.01212
G1 X133.485 Y142.732 E.23524
G1 X133.485 Y142.196 E.01653
G1 X139.07 Y147.781 E.24374
G1 X139.265 Y147.44 E.01212
G1 X133.485 Y141.661 E.25224
G1 X133.485 Y141.125 E.01653
G1 X139.459 Y147.099 E.26074
G1 X139.654 Y146.758 E.01212
G1 X133.485 Y140.59 E.26924
G1 X133.485 Y140.054 E.01653
G1 X139.849 Y146.418 E.27774
G1 X140.044 Y146.077 E.01212
G1 X133.435 Y139.468 E.28845
G2 X133.226 Y138.723 I-3.653 J.623 E.0239
G1 X140.363 Y145.86 E.31149
G1 X131.035 Y159.564 F30000
G1 F15000
G1 X123.166 Y151.694 E.34347
G1 X123.88 Y152.944 E.04442
G1 X130.434 Y159.498 E.28607
G3 X129.924 Y159.524 I-.387 J-2.585 E.01578
G1 X124.594 Y154.194 E.23265
G1 X125.308 Y155.443 E.04442
G1 X129.33 Y159.465 E.17554
G3 X128.602 Y159.273 I.686 J-4.072 E.02326
G1 X126.022 Y156.693 E.11261
G2 X126.683 Y157.81 I11.886 J-6.281 E.04006
G1 X127.062 Y158.269 E.01837
G1 X127.966 Y159.173 E.03945
; WIPE_START
G1 F24000
G1 X127.062 Y158.269 E-.48579
G1 X126.683 Y157.81 E-.22621
G1 X126.615 Y157.703 E-.048
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.531 J-1.095 P1  F30000
G1 X93.062 Y141.417 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X93.063 Y141.417 E.00002
G1 X93.132 Y141.409 E.00213
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.369 Y146.054 E.01969
G1 X94.916 Y146.507 E.01969
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.348 Y146.507 E.01969
G1 X90.895 Y146.054 E.01969
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X93.003 Y141.424 E.01569
M204 S10000
G1 X93.171 Y140.985 F30000
M204 S5000
G1 F12000
G1 X93.773 Y141.045 E.01862
G1 X94.39 Y141.232 E.01981
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.111 Y140.989 E.01914
M204 S10000
; WIPE_START
G1 F24000
G1 X93.773 Y141.045 E-.25271
G1 X94.39 Y141.232 E-.24501
G1 X94.959 Y141.536 E-.245
G1 X94.994 Y141.565 E-.01728
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.136 J.436 P1  F30000
G1 X108.707 Y177.274 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X108.707 Y177.274 E.00002
G1 X108.776 Y177.266 E.00213
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
G1 X111.354 Y181.369 E.01969
G1 X111.013 Y181.912 E.01969
G1 X110.56 Y182.365 E.01969
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X106.992 Y182.365 E.01969
G1 X106.539 Y181.912 E.01969
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.647 Y177.281 E.01569
M204 S10000
G1 X108.815 Y176.843 F30000
M204 S5000
G1 F12000
G1 X109.418 Y176.902 E.01862
G1 X110.035 Y177.089 E.01981
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.755 Y176.847 E.01914
M204 S10000
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.418 Y176.902 E-.25271
G1 X110.035 Y177.089 E-.24501
G1 X110.604 Y177.393 E-.245
G1 X110.639 Y177.422 E-.01728
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/118
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
G3 Z1 I.235 J1.194 P1  F30000
G1 X166.684 Y166.4 Z1
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X166.769 Y166.391 E.00262
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.006 Y171.036 E.01969
G1 X168.553 Y171.489 E.01969
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X164.985 Y171.489 E.01969
G1 X164.532 Y171.036 E.01969
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.625 Y166.407 E.01523
M204 S10000
G1 X166.825 Y165.968 F30000
M204 S5000
G1 F12000
G1 X167.41 Y166.026 E.01809
G1 X168.027 Y166.213 E.01981
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.765 Y165.973 E.01966
M204 S10000
; WIPE_START
G1 F24000
G1 X167.41 Y166.026 E-.24613
G1 X168.027 Y166.213 E-.24501
G1 X168.596 Y166.517 E-.24501
G1 X168.645 Y166.557 E-.02385
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.317 J-1.175 P1  F30000
G1 X128.275 Y155.677 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.035 Y155.504 E.00982
G3 X126.848 Y153.047 I1.965 J-2.465 E.0936
G1 X126.848 Y140.032 E.43173
G3 X129.921 Y136.888 I3.154 J.01 E.16136
G3 X133.152 Y140.032 I.07 J3.16 E.16647
G1 X133.152 Y153.05 E.43182
G3 X128.325 Y155.709 I-3.152 J-.011 E.22244
G1 X128.52 Y155.368 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.503 Y155.358 E.0006
G3 X127.24 Y153.042 I1.497 J-2.319 E.08449
G1 X127.24 Y140.037 E.39961
G3 X129.931 Y137.28 I2.762 J.005 E.131
G3 X132.76 Y140.037 I.061 J2.767 E.13514
G1 X132.76 Y153.043 E.39964
G3 X128.741 Y155.495 I-2.76 J-.004 E.17324
G1 X128.572 Y155.398 E.00601
M204 S10000
; WIPE_START
G1 F24000
G1 X128.503 Y155.358 E-.03027
G1 X128.279 Y155.198 E-.10455
G1 X128.073 Y155.015 E-.10455
G1 X127.886 Y154.814 E-.10456
G1 X127.72 Y154.594 E-.10456
G1 X127.576 Y154.36 E-.10455
G1 X127.457 Y154.112 E-.10456
G1 X127.365 Y153.859 E-.10239
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.089 J-.544 P1  F30000
G1 X98.986 Y97.047 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.004 Y97.052 E.00061
G3 X97.921 Y96.888 I-1.004 J2.988 E.62041
G1 X98.079 Y96.888 E.00521
G3 X98.701 Y96.966 I-.079 J3.151 E.02086
G1 X98.929 Y97.03 E.00783
G1 X98.879 Y97.423 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X97.931 Y97.28 I-.879 J2.616 E.50318
G1 X98.069 Y97.28 E.00423
G3 X98.822 Y97.405 I-.069 J2.759 E.02353
M204 S10000
; WIPE_START
G1 F24000
G1 X99.135 Y97.524 E-.12732
G1 X99.497 Y97.721 E-.15676
G1 X99.721 Y97.882 E-.10456
G1 X99.927 Y98.064 E-.10456
G1 X100.114 Y98.266 E-.10456
G1 X100.28 Y98.485 E-.10456
G1 X100.36 Y98.614 E-.05769
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.036 J1.216 P1  F30000
G1 X158.862 Y100.335 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X158.848 Y100.04 E.00982
G3 X161.921 Y96.888 I3.152 J0 E.16164
G1 X162.079 Y96.888 E.00521
G3 X158.868 Y100.395 I-.079 J3.151 E.47825
G1 X159.254 Y100.314 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X161.931 Y97.28 I2.746 J-.275 E.13955
G1 X162.069 Y97.28 E.00423
G3 X159.261 Y100.374 I-.069 J2.759 E.38716
M204 S10000
; WIPE_START
G1 F24000
G1 X159.24 Y100.04 E-.12731
G1 X159.254 Y99.765 E-.10456
G1 X159.295 Y99.493 E-.10456
G1 X159.406 Y99.096 E-.15676
G1 X159.513 Y98.842 E-.10456
G1 X159.645 Y98.6 E-.10456
G1 X159.73 Y98.475 E-.0577
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.026 J-1.217 P1  F30000
G1 X93.3 Y97.043 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X95.177 Y96.142 I1.875 J1.5 E.07144
G1 X164.858 Y96.143 E2.31143
G3 X166.909 Y99.736 I-.032 J2.4 E.16543
G1 X133.822 Y157.637 E2.21217
G3 X126.177 Y157.635 I-3.822 J-2.179 E.30736
G1 X93.091 Y99.736 E2.21208
G3 X93.263 Y97.09 I2.084 J-1.193 E.09317
G1 X92.99 Y96.799 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X92.994 Y96.798 E.00014
G3 X95.172 Y95.75 I2.181 J1.745 E.07681
G1 X164.863 Y95.751 E2.14139
G3 X167.252 Y99.926 I-.038 J2.793 E.17811
G1 X134.16 Y157.836 E2.04944
G3 X125.839 Y157.835 I-4.16 J-2.377 E.30969
G1 X92.748 Y99.926 E2.04941
G3 X92.759 Y97.141 I2.427 J-1.383 E.08959
G1 X92.956 Y96.848 E.01084
M204 S10000
; WIPE_START
G1 F24000
G1 X92.994 Y96.798 E-.02391
G1 X93.176 Y96.588 E-.1054
G1 X93.488 Y96.313 E-.15812
G1 X93.837 Y96.089 E-.15775
G1 X94.088 Y95.968 E-.10584
G1 X94.483 Y95.836 E-.15812
G1 X94.614 Y95.812 E-.05086
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.183 J-.286 P1  F30000
G1 X94.022 Y98.265 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.541502
G1 F12635.835
G1 X94.287 Y97.777 E.02257
G1 X94.082 Y99.889 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X94.145 Y99.346 E.0168
G1 X94.316 Y98.707 E.02033
G3 X95.331 Y97.178 I4.101 J1.623 E.05679
G1 X95.641 Y96.911 E.01256
G1 X94.969 Y96.942 E.02066
G1 X94.735 Y96.98 E.00728
G1 X94.36 Y97.142 E.01256
G1 X93.967 Y97.459 E.01553
G1 X93.746 Y97.777 E.01189
G1 X93.586 Y98.217 E.01437
G1 X93.554 Y98.629 E.01271
G1 X93.62 Y99.01 E.01187
G2 X94.051 Y99.838 I3.531 J-1.309 E.02875
G1 X94.537 Y100.722 F30000
G1 F15000
G1 X94.472 Y100.376 E.01082
G3 X94.671 Y98.836 I3.821 J-.29 E.04806
G3 X95.588 Y97.455 I3.752 J1.498 E.05129
G1 X96.071 Y97.066 E.01907
G1 X96.298 Y96.941 E.00796
G1 X96.231 Y96.817 E.00433
G3 X96.364 Y96.534 I.627 J.123 E.00972
G1 X95.194 Y96.534 E.03597
G1 X94.676 Y96.598 E.01603
G1 X94.132 Y96.841 E.0183
G1 X93.666 Y97.231 E.01868
G1 X93.396 Y97.636 E.01497
G1 X93.212 Y98.176 E.01751
G1 X93.181 Y98.684 E.01566
G1 X93.273 Y99.155 E.01474
G1 X93.491 Y99.644 E.01645
G1 X94.244 Y100.963 E.04667
G1 X94.378 Y100.735 E.00811
G1 X94.477 Y100.727 E.00307
G1 X94.867 Y101.268 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.596576
G1 F11378.912
G1 X94.73 Y101.629 E.01741
G1 X95.118 Y102.292 E.03464
G1 X96.301 Y103.094 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X97.852 Y103.528 I1.662 J-2.944 E.05396
G1 X131.017 Y136.693 E1.5558
G2 X128.983 Y136.693 I-1.017 J3.383 E.06841
G1 X162.14 Y103.536 E1.55546
G2 X163.694 Y103.101 I-.161 J-3.566 E.05398
G1 X164.882 Y102.292 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.585718
G1 F11606.528
G1 X165.27 Y101.629 E.03396
G1 X165.133 Y101.268 E.01707
G1 X165.675 Y97.715 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.550924
G1 F12401.495
G3 X165.934 Y98.164 I-1.205 J.996 E.02155
G1 X165.905 Y99.936 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X166.27 Y99.296 E.02263
G1 X166.419 Y98.852 E.01438
G1 X166.449 Y98.545 E.00949
G1 X166.37 Y98.044 E.01559
G1 X166.201 Y97.68 E.01233
G1 X165.949 Y97.371 E.01224
G1 X165.632 Y97.134 E.01217
G1 X165.217 Y96.975 E.01366
G2 X164.355 Y96.912 I-.643 J2.833 E.02666
G1 X164.966 Y97.478 E.02559
G3 X165.754 Y98.906 I-4.022 J3.15 E.05036
G1 X165.894 Y99.593 E.02154
G1 X165.903 Y99.876 E.00868
G1 X165.458 Y100.724 F30000
G1 F15000
G1 X165.618 Y100.738 E.00494
G1 X165.751 Y100.966 E.0081
G1 X166.614 Y99.455 E.05346
G1 X166.786 Y98.978 E.01558
G1 X166.824 Y98.581 E.01226
G1 X166.758 Y97.992 E.01822
G1 X166.501 Y97.452 E.01836
G1 X166.184 Y97.076 E.01511
G1 X165.787 Y96.79 E.01504
G1 X165.331 Y96.612 E.01505
G1 X164.835 Y96.535 E.01542
G1 X163.63 Y96.535 E.03703
G1 X163.764 Y96.824 E.00981
G1 X163.7 Y96.938 E.004
G1 X164.195 Y97.257 E.01809
G1 X164.703 Y97.747 E.02168
G3 X165.389 Y99.002 I-3.814 J2.903 E.04412
G1 X165.524 Y99.668 E.02087
G1 X165.528 Y100.374 E.02168
G1 X165.47 Y100.666 E.00914
G1 X163.114 Y96.868 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.425479
G1 F15000
G1 X162.959 Y96.613 E.0093
; LINE_WIDTH: 0.447526
G1 X162.948 Y96.595 E.00069
; LINE_WIDTH: 0.499864
G1 F13787.273
G1 X162.936 Y96.577 E.00078
G1 X162.789 Y96.559 E.00553
; LINE_WIDTH: 0.467116
G1 F14851.651
G1 X162.612 Y96.542 E.00615
; LINE_WIDTH: 0.419618
G1 F15000
G1 X162.259 Y96.52 E.01084
; LINE_WIDTH: 0.386363
G1 X161.555 Y96.529 E.0197
; LINE_WIDTH: 0.410082
G1 X161.378 Y96.542 E.00531
; LINE_WIDTH: 0.437491
G1 X161.2 Y96.56 E.00575
; LINE_WIDTH: 0.479427
G1 F14432.785
G1 X161.064 Y96.577 E.0049
G1 X161.041 Y96.613 E.0015
; LINE_WIDTH: 0.447332
G1 F15000
G1 X160.886 Y96.868 E.00982
G1 X158.27 Y96.491 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X159.899 Y96.491 E.05401
G1 X160.356 Y96.953 E.02157
G2 X158.553 Y99.447 I1.757 J3.168 E.10542
G1 X117.046 Y140.954 E1.9472
G1 X119.837 Y145.839 E.18662
G1 X126.65 Y139.026 E.31961
G2 X126.508 Y139.86 I3.569 J1.037 E.02812
G1 X102.97 Y116.322 E1.1042
G1 X103.089 Y116.531 E.00796
G1 X123.13 Y96.49 E.94013
G1 X121.518 Y96.49 E.05346
G1 X151.327 Y126.299 E1.39838
G1 X154.118 Y121.414 E.18663
G1 X129.194 Y96.49 E1.16922
G1 X130.806 Y96.49 E.05345
G1 X105.881 Y121.415 E1.16928
G1 X108.672 Y126.3 E.18662
G1 X138.482 Y96.491 E1.39843
G1 X136.87 Y96.491 E.05345
G1 X156.909 Y116.529 E.94005
G1 X157.024 Y116.328 E.00767
G1 X133.492 Y139.86 E1.10391
G2 X133.35 Y139.026 I-3.711 J.203 E.02812
G1 X140.163 Y145.838 E.31958
G1 X139.355 Y147.252 E.05401
G1 X133.773 Y157.022 F30000
G1 F15476.087
G1 X134.58 Y155.608 E.05401
G1 X133.266 Y154.294 E.06167
G3 X126.735 Y154.293 I-3.265 J-1.256 E.27939
G1 X125.42 Y155.608 E.06172
G1 X126.227 Y157.022 E.05401
G1 X115.062 Y137.483 F30000
G1 F15476.087
G1 X114.254 Y136.07 E.05401
G1 X153.833 Y96.491 E1.85672
G1 X152.222 Y96.491 E.05343
G1 X162.491 Y106.759 E.48172
G1 X159.7 Y111.644 E.18663
G1 X144.546 Y96.491 E.71088
G1 X146.157 Y96.491 E.05344
G1 X111.463 Y131.185 E1.62758
G1 X113.205 Y134.233 E.11645
G1 X126.5 Y147.528 E.62368
G1 X126.5 Y146.852 E.0224
G1 X122.628 Y150.724 E.18161
G1 X123.44 Y152.143 E.05424
G1 X130.737 Y159.441 E.34235
G3 X129.265 Y159.439 I-.73 J-4.084 E.0491
G1 X136.56 Y152.144 E.34221
G1 X137.371 Y150.723 E.05428
G1 X133.5 Y146.852 E.1816
G1 X133.5 Y147.528 E.0224
G1 X146.792 Y134.236 E.62352
G1 X148.536 Y131.184 E.11662
G1 X113.842 Y96.49 E1.62755
G1 X115.454 Y96.49 E.05347
G1 X100.298 Y111.646 E.71099
G1 X97.507 Y106.761 E.18662
G1 X107.778 Y96.49 E.48184
G1 X106.166 Y96.49 E.05347
G1 X145.745 Y136.069 E1.85671
G1 X142.954 Y140.954 E.18663
G1 X101.446 Y99.446 E1.94721
G2 X99.643 Y96.952 I-3.492 J.625 E.10559
G1 X100.102 Y96.49 E.02159
G1 X101.731 Y96.49 E.05401
G1 X99.112 Y96.867 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.421996
G1 F15000
M73 P34 R18
G1 X98.958 Y96.615 E.00912
; LINE_WIDTH: 0.443704
G1 X98.946 Y96.596 E.00074
; LINE_WIDTH: 0.499613
G1 F13794.829
G1 X98.934 Y96.577 E.00084
G1 X98.789 Y96.559 E.00545
; LINE_WIDTH: 0.467915
G1 F14823.702
G1 X98.612 Y96.541 E.00617
; LINE_WIDTH: 0.42042
G1 F15000
G1 X98.259 Y96.519 E.01086
; LINE_WIDTH: 0.38716
G1 X97.555 Y96.529 E.01975
; LINE_WIDTH: 0.410883
G1 X97.378 Y96.542 E.00533
; LINE_WIDTH: 0.438298
G1 X97.2 Y96.56 E.00576
; LINE_WIDTH: 0.480627
G1 F14393.186
G1 X97.066 Y96.577 E.00484
G1 X97.042 Y96.615 E.00161
; LINE_WIDTH: 0.443504
G1 F15000
G1 X96.888 Y96.867 E.00964
; WIPE_START
G1 F24000
G1 X97.042 Y96.615 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.212 J-.108 P1  F30000
G1 X93.047 Y141.419 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X93.132 Y141.409 E.00262
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.369 Y146.054 E.01969
G1 X94.916 Y146.507 E.01969
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.348 Y146.507 E.01969
G1 X90.895 Y146.054 E.01969
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.988 Y141.425 E.01523
M204 S10000
G1 X93.188 Y140.987 F30000
M204 S5000
G1 F12000
G1 X93.773 Y141.045 E.01809
G1 X94.39 Y141.232 E.01981
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.128 Y140.991 E.01966
M204 S10000
; WIPE_START
G1 F24000
G1 X93.773 Y141.045 E-.24613
G1 X94.39 Y141.232 E-.24501
G1 X94.959 Y141.536 E-.24501
G1 X95.008 Y141.575 E-.02385
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.136 J.436 P1  F30000
G1 X108.692 Y177.276 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X108.776 Y177.266 E.00262
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
G1 X111.354 Y181.369 E.01969
G1 X111.013 Y181.912 E.01969
G1 X110.56 Y182.365 E.01969
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X106.992 Y182.365 E.01969
G1 X106.539 Y181.912 E.01969
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.632 Y177.283 E.01523
M204 S10000
G1 X108.832 Y176.844 F30000
M204 S5000
G1 F12000
G1 X109.418 Y176.902 E.01809
G1 X110.035 Y177.089 E.01981
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.772 Y176.849 E.01966
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.418 Y176.902 E-.24613
G1 X110.035 Y177.089 E-.24501
G1 X110.604 Y177.393 E-.24501
G1 X110.652 Y177.433 E-.02385
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/118
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
G3 Z1.2 I.235 J1.194 P1  F30000
G1 X166.668 Y166.402 Z1.2
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X166.769 Y166.391 E.0031
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.006 Y171.036 E.01969
G1 X168.553 Y171.489 E.01969
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X164.985 Y171.489 E.01969
G1 X164.532 Y171.036 E.01969
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.609 Y166.409 E.01474
M204 S10000
G1 X166.843 Y165.97 F30000
M204 S5000
G1 F12000
G1 X166.843 Y165.97 E0
G1 X167.41 Y166.026 E.01753
G1 X168.027 Y166.213 E.01981
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X166.783 Y165.964 E.00044
M204 S10000
; WIPE_START
G1 F24000
G1 X166.843 Y165.97 E-.02283
G1 X167.41 Y166.026 E-.21677
G1 X168.027 Y166.213 E-.24501
G1 X168.596 Y166.517 E-.24501
G1 X168.658 Y166.568 E-.0304
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.317 J-1.175 P1  F30000
G1 X128.275 Y155.677 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.035 Y155.504 E.00982
G3 X126.848 Y153.047 I1.965 J-2.465 E.0936
G1 X126.848 Y140.032 E.43173
G3 X129.921 Y136.888 I3.154 J.01 E.16136
G3 X133.152 Y140.032 I.07 J3.16 E.16647
G1 X133.152 Y153.051 E.43184
G3 X128.325 Y155.709 I-3.152 J-.012 E.22242
G1 X128.543 Y155.382 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.503 Y155.358 E.00145
G3 X127.24 Y153.042 I1.497 J-2.319 E.08449
G1 X127.24 Y140.037 E.39961
G3 X129.931 Y137.28 I2.762 J.005 E.131
G3 X132.76 Y140.037 I.061 J2.767 E.13514
G1 X132.76 Y153.043 E.39965
G3 X128.741 Y155.495 I-2.76 J-.005 E.17324
G1 X128.596 Y155.412 E.00516
M204 S10000
; WIPE_START
G1 F24000
G1 X128.503 Y155.358 E-.04074
G1 X128.279 Y155.198 E-.10454
G1 X128.073 Y155.015 E-.10456
G1 X127.886 Y154.814 E-.10456
G1 X127.72 Y154.594 E-.10456
G1 X127.576 Y154.36 E-.10456
G1 X127.457 Y154.112 E-.10456
G1 X127.374 Y153.884 E-.09192
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.089 J-.544 P1  F30000
G1 X98.986 Y97.047 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.004 Y97.052 E.00061
G3 X97.921 Y96.888 I-1.004 J2.988 E.62041
G1 X98.079 Y96.888 E.00521
G3 X98.701 Y96.966 I-.079 J3.151 E.02086
G1 X98.929 Y97.03 E.00783
G1 X98.879 Y97.423 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X97.931 Y97.28 I-.879 J2.616 E.50318
G1 X98.069 Y97.28 E.00423
G3 X98.822 Y97.405 I-.069 J2.759 E.02353
M204 S10000
; WIPE_START
G1 F24000
G1 X99.135 Y97.524 E-.12732
G1 X99.497 Y97.721 E-.15676
G1 X99.721 Y97.882 E-.10455
G1 X99.927 Y98.064 E-.10456
G1 X100.114 Y98.266 E-.10455
G1 X100.28 Y98.485 E-.10457
G1 X100.36 Y98.614 E-.05769
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.037 J1.216 P1  F30000
G1 X158.866 Y100.372 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X158.864 Y100.353 E.00061
G3 X161.921 Y96.888 I3.136 J-.314 E.17206
G1 X162.079 Y96.888 E.00521
G3 X158.911 Y100.664 I-.079 J3.151 E.4692
G1 X158.875 Y100.431 E.00783
G1 X159.254 Y100.314 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X161.931 Y97.28 I2.746 J-.275 E.13955
G1 X162.069 Y97.28 E.00423
G3 X159.261 Y100.374 I-.069 J2.759 E.38716
M204 S10000
; WIPE_START
G1 F24000
G1 X159.24 Y100.04 E-.12732
G1 X159.254 Y99.765 E-.10456
G1 X159.295 Y99.493 E-.10455
G1 X159.406 Y99.096 E-.15676
G1 X159.513 Y98.842 E-.10456
G1 X159.645 Y98.6 E-.10456
G1 X159.73 Y98.475 E-.05768
; WIPE_END
G1 E-.04 F1800
G17
M73 P34 R17
G3 Z1.4 I.026 J-1.217 P1  F30000
G1 X93.3 Y97.043 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X95.177 Y96.142 I1.875 J1.5 E.07144
G1 X164.868 Y96.143 E2.31176
G3 X166.909 Y99.736 I-.042 J2.4 E.1651
G1 X133.822 Y157.637 E2.21217
G3 X126.178 Y157.637 I-3.822 J-2.179 E.30726
G1 X93.091 Y99.736 E2.21217
G3 X93.263 Y97.09 I2.084 J-1.193 E.09317
G1 X92.989 Y96.8 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X92.994 Y96.798 E.00018
G3 X95.172 Y95.75 I2.181 J1.745 E.07681
G1 X164.873 Y95.751 E2.1417
G3 X167.252 Y99.926 I-.047 J2.792 E.1778
G1 X134.16 Y157.836 E2.04944
G3 X125.84 Y157.836 I-4.16 J-2.377 E.30966
G1 X92.748 Y99.926 E2.04944
G3 X92.759 Y97.141 I2.427 J-1.383 E.08959
G1 X92.955 Y96.85 E.01078
M204 S10000
; WIPE_START
G1 F24000
G1 X92.994 Y96.798 E-.02458
G1 X93.176 Y96.588 E-.10541
G1 X93.488 Y96.313 E-.15812
G1 X93.838 Y96.088 E-.15811
G1 X94.217 Y95.917 E-.15812
G1 X94.483 Y95.836 E-.10546
G1 X94.613 Y95.813 E-.0502
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.203 J-.187 P1  F30000
G1 X94.316 Y97.724 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.542146
G1 F12619.534
G1 X94.039 Y98.234 E.02359
G1 X94.082 Y99.889 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X94.145 Y99.346 E.0168
G1 X94.318 Y98.701 E.0205
G3 X95.332 Y97.17 I4.195 J1.675 E.05683
G1 X95.651 Y96.911 E.01262
G1 X94.946 Y96.944 E.02167
G1 X94.733 Y96.98 E.00666
G1 X94.36 Y97.141 E.01246
G1 X93.967 Y97.459 E.01555
G1 X93.747 Y97.777 E.01187
G1 X93.58 Y98.243 E.01521
G1 X93.553 Y98.624 E.01172
G2 X93.62 Y99.01 I4.353 J-.557 E.01206
G2 X94.051 Y99.838 I3.531 J-1.309 E.02874
G1 X94.537 Y100.722 F30000
G1 F15000
G1 X94.472 Y100.376 E.01082
G3 X94.673 Y98.83 I3.819 J-.29 E.04823
G3 X95.595 Y97.44 I3.845 J1.549 E.05163
G1 X96.065 Y97.07 E.01838
G1 X96.298 Y96.941 E.00819
G1 X96.231 Y96.817 E.00433
G1 X96.364 Y96.534 E.00962
G1 X95.194 Y96.534 E.03597
G1 X94.674 Y96.598 E.0161
G1 X94.133 Y96.84 E.0182
G1 X93.734 Y97.142 E.01535
G1 X93.438 Y97.532 E.01505
G1 X93.217 Y98.094 E.01856
G1 X93.18 Y98.679 E.01801
G2 X93.491 Y99.644 I2.624 J-.311 E.03137
G1 X94.244 Y100.963 E.04667
G1 X94.378 Y100.735 E.00811
G1 X94.477 Y100.727 E.00307
G1 X94.867 Y101.268 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.596583
G1 F11378.773
G1 X94.73 Y101.629 E.01741
G1 X95.118 Y102.292 E.03464
G1 X96.301 Y103.094 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X97.852 Y103.528 I1.66 J-2.939 E.05396
G1 X131.017 Y136.692 E1.5558
G2 X128.983 Y136.693 I-1.017 J3.383 E.06841
G1 X162.14 Y103.536 E1.55546
G2 X163.694 Y103.101 I-.161 J-3.566 E.05398
G1 X164.882 Y102.292 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.5857
G1 F11606.921
G1 X165.27 Y101.629 E.03396
G1 X165.133 Y101.268 E.01707
G1 X165.957 Y98.219 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.561636
G1 F12145.391
G1 X165.783 Y97.865 E.01669
G1 X165.71 Y97.764 E.00526
G1 X165.905 Y99.936 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X166.27 Y99.296 E.02263
G1 X166.419 Y98.852 E.01438
G1 X166.446 Y98.443 E.0126
G1 X166.37 Y98.044 E.01249
G1 X166.201 Y97.68 E.01233
G1 X165.949 Y97.371 E.01224
G1 X165.632 Y97.134 E.01217
G1 X165.217 Y96.975 E.01364
G2 X164.355 Y96.912 I-.639 J2.802 E.02667
G1 X164.966 Y97.478 E.02558
G3 X165.754 Y98.906 I-4.022 J3.15 E.05036
G1 X165.894 Y99.593 E.02154
G1 X165.903 Y99.876 E.00868
G1 X165.458 Y100.724 F30000
G1 F15000
G1 X165.618 Y100.738 E.00494
G1 X165.751 Y100.966 E.0081
G1 X166.614 Y99.455 E.05346
G1 X166.786 Y98.978 E.01558
G1 X166.818 Y98.386 E.01822
G1 X166.717 Y97.896 E.01537
G1 X166.501 Y97.452 E.01518
G1 X166.184 Y97.076 E.01511
G1 X165.787 Y96.79 E.01504
G1 X165.332 Y96.611 E.01504
G1 X164.802 Y96.535 E.01644
G1 X163.631 Y96.535 E.03598
G1 X163.765 Y96.825 E.0098
G1 X163.701 Y96.939 E.00401
G1 X164.195 Y97.257 E.01806
G1 X164.703 Y97.747 E.02168
G3 X165.389 Y99.002 I-3.814 J2.903 E.04412
G1 X165.524 Y99.668 E.02087
G1 X165.528 Y100.374 E.02168
G1 X165.47 Y100.666 E.00914
G1 X163.114 Y96.868 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.426553
G1 F15000
G1 X162.959 Y96.613 E.00935
; LINE_WIDTH: 0.448704
G1 X162.948 Y96.595 E.00068
; LINE_WIDTH: 0.499934
G1 F13785.135
G1 X162.937 Y96.578 E.00077
G1 X162.789 Y96.559 E.00556
; LINE_WIDTH: 0.466867
G1 F14860.348
G1 X162.612 Y96.542 E.00615
; LINE_WIDTH: 0.419381
G1 F15000
G1 X162.259 Y96.52 E.01083
; LINE_WIDTH: 0.386124
G1 X161.555 Y96.529 E.01969
; LINE_WIDTH: 0.409843
G1 X161.378 Y96.542 E.00531
; LINE_WIDTH: 0.437255
G1 X161.2 Y96.56 E.00575
; LINE_WIDTH: 0.479063
G1 F14444.824
G1 X161.063 Y96.578 E.00492
G1 X161.041 Y96.613 E.00147
; LINE_WIDTH: 0.448475
G1 F15000
G1 X160.886 Y96.868 E.00988
G1 X158.27 Y96.491 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X159.899 Y96.491 E.05401
G1 X160.355 Y96.953 E.02156
G2 X158.553 Y99.447 I1.757 J3.168 E.1054
G1 X117.046 Y140.954 E1.9472
G1 X114.254 Y136.07 E.18662
G1 X153.833 Y96.491 E1.85671
G1 X152.223 Y96.491 E.05342
G1 X162.491 Y106.759 E.48171
G1 X159.7 Y111.644 E.18663
G1 X144.547 Y96.491 E.71088
G1 X146.157 Y96.491 E.05343
G1 X111.463 Y131.185 E1.62757
G1 X113.205 Y134.233 E.11645
G1 X126.5 Y147.528 E.62368
G1 X126.5 Y146.852 E.0224
G1 X122.628 Y150.724 E.18161
G1 X123.44 Y152.143 E.05424
G1 X130.737 Y159.441 E.34235
G3 X129.265 Y159.439 I-.73 J-4.084 E.0491
G1 X136.56 Y152.144 E.34221
G1 X137.371 Y150.723 E.05428
G1 X133.5 Y146.852 E.1816
G1 X133.5 Y147.528 E.0224
G1 X146.792 Y134.236 E.62352
G1 X148.536 Y131.184 E.11662
G1 X113.842 Y96.49 E1.62754
G1 X115.454 Y96.49 E.05346
G1 X100.298 Y111.646 E.71098
G1 X97.507 Y106.761 E.18662
G1 X107.778 Y96.49 E.48184
G1 X106.166 Y96.49 E.05347
G1 X145.745 Y136.069 E1.85671
G1 X142.954 Y140.954 E.18663
G1 X101.44 Y99.44 E1.9475
G2 X99.644 Y96.951 I-3.472 J.614 E.10531
G1 X100.102 Y96.49 E.02156
G1 X101.731 Y96.49 E.05401
G1 X99.112 Y96.867 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.42207
G1 F15000
G1 X98.958 Y96.615 E.00913
; LINE_WIDTH: 0.443784
G1 X98.946 Y96.596 E.00074
; LINE_WIDTH: 0.499619
G1 F13794.649
G1 X98.934 Y96.577 E.00084
G1 X98.789 Y96.559 E.00545
; LINE_WIDTH: 0.467897
G1 F14824.33
G1 X98.612 Y96.541 E.00616
; LINE_WIDTH: 0.420408
G1 F15000
G1 X98.259 Y96.519 E.01086
; LINE_WIDTH: 0.387149
G1 X97.555 Y96.529 E.01975
; LINE_WIDTH: 0.410874
G1 X97.378 Y96.542 E.00533
; LINE_WIDTH: 0.438288
G1 X97.2 Y96.56 E.00576
; LINE_WIDTH: 0.480611
G1 F14393.718
G1 X97.066 Y96.577 E.00484
G1 X97.042 Y96.615 E.00161
; LINE_WIDTH: 0.443552
G1 F15000
G1 X96.888 Y96.867 E.00964
; WIPE_START
G1 F24000
G1 X97.042 Y96.615 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.106 J.508 P1  F30000
G1 X119.029 Y144.425 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X119.837 Y145.839 E.05401
G1 X126.65 Y139.026 E.31961
G2 X126.508 Y139.86 I3.568 J1.037 E.02812
G1 X102.97 Y116.322 E1.1042
G1 X103.089 Y116.531 E.00796
G1 X123.13 Y96.49 E.94013
G1 X121.518 Y96.49 E.05345
G1 X151.327 Y126.299 E1.39838
G1 X154.118 Y121.414 E.18663
G1 X129.194 Y96.491 E1.16921
G1 X130.806 Y96.491 E.05344
G1 X105.881 Y121.415 E1.16928
G1 X108.672 Y126.3 E.18662
G1 X138.481 Y96.491 E1.39842
G1 X136.871 Y96.491 E.05344
G1 X156.909 Y116.529 E.94004
G1 X157.024 Y116.328 E.00767
G1 X133.492 Y139.86 E1.10391
G2 X133.35 Y139.026 I-3.71 J.203 E.02812
G1 X140.163 Y145.838 E.31958
G1 X140.97 Y144.425 E.05401
G1 X133.5 Y152.694 F30000
G1 F15476.087
G3 X133.265 Y154.293 I-3.905 J.242 E.054
G1 X134.58 Y155.608 E.06171
G1 X133.773 Y157.022 E.05401
G1 X127.546 Y155.642 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50878
G1 F13523.376
G1 X127.755 Y155.829 E.01063
G1 X126.227 Y157.022 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X125.42 Y155.608 E.05401
G1 X126.735 Y154.293 E.06172
G3 X126.5 Y152.694 I3.67 J-1.357 E.054
; WIPE_START
G1 F24000
G1 X126.516 Y153.388 E-.264
G1 X126.735 Y154.293 E-.3536
G1 X126.47 Y154.558 E-.1424
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.445 J-1.133 P1  F30000
G1 X93.031 Y141.42 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X93.132 Y141.409 E.0031
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.369 Y146.054 E.01969
G1 X94.916 Y146.507 E.01969
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
M73 P35 R17
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.348 Y146.507 E.01969
G1 X90.895 Y146.054 E.01969
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.972 Y141.427 E.01474
M204 S10000
G1 X93.206 Y140.989 F30000
M204 S5000
G1 F12000
G1 X93.206 Y140.989 E0
G1 X93.773 Y141.045 E.01753
G1 X94.39 Y141.232 E.01981
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
G1 X93.146 Y140.983 E.00044
M204 S10000
; WIPE_START
G1 F24000
G1 X93.206 Y140.989 E-.02283
G1 X93.773 Y141.045 E-.21676
G1 X94.39 Y141.232 E-.24501
G1 X94.959 Y141.536 E-.245
G1 X95.021 Y141.586 E-.0304
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.137 J.435 P1  F30000
G1 X108.676 Y177.278 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X108.776 Y177.266 E.0031
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
G1 X111.354 Y181.369 E.01969
G1 X111.013 Y181.912 E.01969
G1 X110.56 Y182.365 E.01969
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X106.992 Y182.365 E.01969
G1 X106.539 Y181.912 E.01969
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.616 Y177.284 E.01474
M204 S10000
G1 X108.85 Y176.846 F30000
M204 S5000
G1 F12000
G1 X108.85 Y176.846 E0
G1 X109.418 Y176.902 E.01753
G1 X110.035 Y177.089 E.01981
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X108.79 Y176.84 E.00044
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.85 Y176.846 E-.02283
G1 X109.418 Y176.902 E-.21676
G1 X110.035 Y177.089 E-.24501
G1 X110.604 Y177.393 E-.24501
G1 X110.665 Y177.444 E-.0304
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/118
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
G3 Z1.4 I.235 J1.194 P1  F30000
G1 X166.652 Y166.404 Z1.4
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X166.769 Y166.391 E.00361
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.006 Y171.036 E.01969
G1 X168.553 Y171.489 E.01969
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X164.985 Y171.489 E.01969
G1 X164.532 Y171.036 E.01969
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.592 Y166.41 E.01423
M204 S10000
G1 X166.861 Y165.972 F30000
M204 S5000
G1 F12000
G1 X166.864 Y165.972 E.00007
G1 X167.41 Y166.026 E.01688
G1 X168.027 Y166.213 E.01981
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X166.802 Y165.966 E.00101
M204 S10000
; WIPE_START
G1 F24000
G1 X166.864 Y165.972 E-.02371
G1 X167.41 Y166.026 E-.20874
G1 X168.027 Y166.213 E-.24501
G1 X168.596 Y166.517 E-.24501
G1 X168.672 Y166.58 E-.03753
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.317 J-1.175 P1  F30000
G1 X128.275 Y155.677 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.035 Y155.504 E.00982
G3 X126.848 Y153.047 I1.965 J-2.465 E.0936
G1 X126.848 Y140.026 E.43192
G3 X129.921 Y136.888 I3.154 J.015 E.16117
G3 X133.152 Y140.032 I.07 J3.16 E.16647
G1 X133.152 Y153.047 E.43173
G3 X128.325 Y155.709 I-3.152 J-.008 E.22253
G1 X128.568 Y155.396 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.503 Y155.358 E.00234
G3 X127.24 Y153.042 I1.497 J-2.319 E.08449
G1 X127.24 Y140.035 E.39968
G3 X129.931 Y137.28 I2.762 J.007 E.13093
G3 X132.76 Y140.037 I.061 J2.767 E.13514
G1 X132.76 Y153.042 E.39961
G3 X128.741 Y155.495 I-2.76 J-.003 E.17327
G1 X128.62 Y155.426 E.00427
M204 S10000
; WIPE_START
G1 F24000
G1 X128.503 Y155.358 E-.05169
G1 X128.279 Y155.198 E-.10454
G1 X128.073 Y155.016 E-.10455
G1 X127.886 Y154.814 E-.10456
G1 X127.72 Y154.594 E-.10456
G1 X127.576 Y154.36 E-.10455
G1 X127.457 Y154.112 E-.10456
G1 X127.384 Y153.912 E-.08097
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.089 J-.543 P1  F30000
G1 X99.021 Y97.058 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.296 Y97.167 E.00982
G3 X97.921 Y96.888 I-1.296 J2.871 E.60967
G1 X98.079 Y96.888 E.00521
G3 X98.964 Y97.039 I-.079 J3.149 E.0299
G1 X98.879 Y97.423 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X97.931 Y97.28 I-.879 J2.615 E.50294
G1 X98.069 Y97.28 E.00423
G3 X98.822 Y97.405 I-.069 J2.757 E.02353
M204 S10000
; WIPE_START
G1 F24000
G1 X99.135 Y97.524 E-.12732
G1 X99.497 Y97.721 E-.15676
G1 X99.721 Y97.882 E-.10456
G1 X99.927 Y98.064 E-.10455
G1 X100.114 Y98.266 E-.10457
G1 X100.28 Y98.485 E-.10456
G1 X100.36 Y98.614 E-.05769
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.037 J1.216 P1  F30000
G1 X158.866 Y100.372 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X158.864 Y100.353 E.0006
G3 X161.921 Y96.888 I3.136 J-.314 E.17206
G1 X162.079 Y96.888 E.00521
G3 X158.911 Y100.664 I-.079 J3.151 E.4692
G1 X158.875 Y100.431 E.00783
G1 X159.254 Y100.314 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X161.931 Y97.28 I2.746 J-.275 E.13955
G1 X162.069 Y97.28 E.00423
G3 X159.261 Y100.374 I-.069 J2.759 E.38716
M204 S10000
; WIPE_START
G1 F24000
G1 X159.24 Y100.04 E-.12732
G1 X159.254 Y99.765 E-.10456
G1 X159.295 Y99.493 E-.10455
G1 X159.406 Y99.096 E-.15677
G1 X159.513 Y98.842 E-.10455
G1 X159.645 Y98.6 E-.10456
G1 X159.73 Y98.475 E-.05769
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.026 J-1.217 P1  F30000
G1 X93.3 Y97.043 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X95.177 Y96.142 I1.875 J1.5 E.07144
G1 X164.878 Y96.143 E2.31209
G3 X166.909 Y99.736 I-.052 J2.4 E.16477
G1 X133.822 Y157.637 E2.21217
G3 X126.178 Y157.637 I-3.822 J-2.186 E.30708
G1 X93.091 Y99.736 E2.21217
G3 X93.263 Y97.09 I2.084 J-1.193 E.09317
G1 X92.988 Y96.802 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X92.994 Y96.798 E.00022
G3 X95.172 Y95.75 I2.181 J1.745 E.07681
G1 X164.883 Y95.751 E2.142
G3 X167.252 Y99.926 I-.057 J2.792 E.17749
G1 X134.16 Y157.836 E2.04944
G3 X125.84 Y157.836 I-4.16 J-2.386 E.30948
G1 X92.748 Y99.926 E2.04944
G3 X92.759 Y97.141 I2.427 J-1.383 E.08959
G1 X92.954 Y96.851 E.01073
M204 S10000
; WIPE_START
G1 F24000
G1 X92.994 Y96.798 E-.02528
G1 X93.176 Y96.588 E-.1054
G1 X93.488 Y96.313 E-.15814
G1 X93.838 Y96.088 E-.15812
G1 X94.217 Y95.917 E-.15811
G1 X94.483 Y95.836 E-.10546
G1 X94.611 Y95.813 E-.04949
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.183 J-.286 P1  F30000
G1 X94.013 Y98.288 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.53562
G1 F12786.685
G1 X94.287 Y97.777 E.0233
G1 X94.082 Y99.889 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X94.145 Y99.346 E.0168
G1 X94.319 Y98.7 E.02054
G3 X95.332 Y97.174 I4.153 J1.656 E.0567
G1 X95.648 Y96.911 E.01263
G1 X94.956 Y96.943 E.02127
G1 X94.733 Y96.98 E.00696
G1 X94.36 Y97.141 E.01246
G1 X93.967 Y97.459 E.01555
G1 X93.747 Y97.777 E.01188
G1 X93.58 Y98.244 E.01522
G1 X93.553 Y98.622 E.01165
G1 X93.62 Y99.009 E.01208
G2 X94.051 Y99.838 I3.53 J-1.308 E.02877
G1 X94.537 Y100.722 F30000
G1 F15000
G1 X94.472 Y100.376 E.01082
G3 X94.673 Y98.829 I3.819 J-.29 E.04826
G3 X95.592 Y97.447 I3.803 J1.531 E.05137
G1 X96.067 Y97.069 E.01866
G1 X96.298 Y96.941 E.00812
G1 X96.231 Y96.817 E.00433
G3 X96.364 Y96.534 I.627 J.123 E.00972
G1 X95.194 Y96.534 E.03597
G1 X94.674 Y96.598 E.0161
G1 X94.133 Y96.84 E.0182
G1 X93.734 Y97.142 E.01535
G1 X93.438 Y97.532 E.01505
G1 X93.216 Y98.094 E.01857
G1 X93.18 Y98.677 E.01793
G1 X93.272 Y99.155 E.01496
G1 X93.491 Y99.644 E.01647
G1 X94.244 Y100.963 E.04667
G1 X94.378 Y100.735 E.00811
G1 X94.477 Y100.727 E.00307
G1 X94.867 Y101.268 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.596578
G1 F11378.865
G1 X94.73 Y101.629 E.01741
G1 X95.118 Y102.292 E.03464
G1 X96.301 Y103.094 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X97.852 Y103.528 I1.66 J-2.939 E.05396
G1 X131.017 Y136.692 E1.5558
G2 X128.983 Y136.693 I-1.017 J3.383 E.06841
G1 X162.14 Y103.536 E1.55546
G2 X163.694 Y103.101 I-.161 J-3.566 E.05398
G1 X164.882 Y102.292 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.585724
G1 F11606.414
G1 X165.27 Y101.629 E.03396
G1 X165.133 Y101.268 E.01707
G1 X165.675 Y97.716 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.550931
G1 F12401.309
G3 X165.934 Y98.164 I-1.205 J.996 E.02154
G1 X165.905 Y99.936 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X166.27 Y99.296 E.02263
G1 X166.419 Y98.854 E.01434
G1 X166.449 Y98.546 E.00951
G1 X166.37 Y98.044 E.01562
G1 X166.201 Y97.68 E.01233
G1 X165.949 Y97.371 E.01224
G1 X165.631 Y97.133 E.0122
G1 X165.218 Y96.975 E.01359
G2 X164.355 Y96.912 I-.635 J2.774 E.02669
G1 X164.966 Y97.478 E.02556
G3 X165.754 Y98.907 I-4.019 J3.149 E.05038
G1 X165.894 Y99.593 E.02152
G1 X165.903 Y99.876 E.00868
G1 X165.458 Y100.724 F30000
G1 F15000
G1 X165.618 Y100.738 E.00494
G1 X165.751 Y100.966 E.0081
G1 X166.614 Y99.455 E.05346
G1 X166.785 Y98.98 E.01553
G1 X166.824 Y98.582 E.01226
G1 X166.758 Y97.992 E.01826
G1 X166.501 Y97.452 E.01836
G1 X166.184 Y97.076 E.01511
G1 X165.786 Y96.789 E.01508
G1 X165.331 Y96.611 E.01501
G1 X164.811 Y96.535 E.01616
G1 X163.632 Y96.535 E.03621
G1 X163.766 Y96.825 E.0098
G1 X163.702 Y96.939 E.00402
G1 X164.195 Y97.257 E.01803
G1 X164.703 Y97.747 E.02168
G3 X165.389 Y99.003 I-3.813 J2.902 E.04413
G1 X165.524 Y99.668 E.02086
G1 X165.528 Y100.374 E.02168
G1 X165.47 Y100.666 E.00914
G1 X163.115 Y96.868 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.42761
G1 F15000
G1 X162.959 Y96.612 E.0094
; LINE_WIDTH: 0.44986
G1 X162.948 Y96.595 E.00067
; LINE_WIDTH: 0.500001
G1 F13783.112
G1 X162.938 Y96.578 E.00075
G1 X162.789 Y96.559 E.00558
; LINE_WIDTH: 0.466632
G1 F14868.613
G1 X162.612 Y96.542 E.00615
; LINE_WIDTH: 0.419143
G1 F15000
G1 X162.259 Y96.52 E.01082
; LINE_WIDTH: 0.385888
G1 X161.555 Y96.529 E.01967
; LINE_WIDTH: 0.409606
G1 X161.378 Y96.543 E.00531
; LINE_WIDTH: 0.437015
G1 X161.2 Y96.561 E.00574
; LINE_WIDTH: 0.47871
G1 F14456.519
G1 X161.062 Y96.578 E.00494
G1 X161.041 Y96.612 E.00144
; LINE_WIDTH: 0.449586
G1 F15000
G1 X160.885 Y96.868 E.00993
G1 X158.271 Y96.491 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X159.899 Y96.491 E.05401
G1 X160.238 Y96.83 E.0159
G1 X160.215 Y96.868 E.00148
G1 X160.355 Y96.954 E.00545
G2 X158.553 Y99.447 I1.758 J3.168 E.10538
G1 X117.046 Y140.954 E1.9472
G1 X119.837 Y145.839 E.18662
G1 X126.657 Y139.019 E.31996
G2 X126.507 Y139.859 I3.689 J1.095 E.02837
G1 X102.97 Y116.322 E1.10414
G1 X103.089 Y116.531 E.00796
G1 X123.13 Y96.491 E.94013
G1 X121.518 Y96.491 E.05345
G1 X151.327 Y126.299 E1.39837
G1 X154.118 Y121.414 E.18663
G1 X129.195 Y96.491 E1.1692
G1 X130.805 Y96.491 E.05344
G1 X105.881 Y121.415 E1.16927
G1 X108.672 Y126.3 E.18662
G1 X138.481 Y96.491 E1.39841
G1 X136.871 Y96.491 E.05343
G1 X156.909 Y116.529 E.94004
G1 X157.024 Y116.328 E.00767
G1 X133.492 Y139.86 E1.10391
G2 X133.35 Y139.026 I-3.711 J.203 E.02812
G1 X140.163 Y145.838 E.31958
G1 X139.355 Y147.252 E.05401
G1 X133.773 Y157.022 F30000
G1 F15476.087
G1 X134.58 Y155.608 E.05401
G1 X133.265 Y154.293 E.06171
G3 X126.735 Y154.293 I-3.265 J-1.254 E.27939
G1 X125.42 Y155.608 E.06172
G1 X126.227 Y157.022 E.05401
G1 X115.062 Y137.483 F30000
G1 F15476.087
G1 X114.254 Y136.07 E.05401
G1 X153.833 Y96.491 E1.8567
G1 X152.223 Y96.491 E.05341
G1 X162.491 Y106.759 E.4817
G1 X159.7 Y111.644 E.18663
G1 X144.547 Y96.491 E.71087
G1 X146.157 Y96.491 E.05342
G1 X111.463 Y131.185 E1.62756
G1 X113.205 Y134.233 E.11645
G1 X126.5 Y147.528 E.62368
G1 X126.5 Y146.852 E.0224
G1 X122.628 Y150.724 E.18161
G1 X123.44 Y152.143 E.05424
G1 X130.737 Y159.441 E.34235
G3 X129.265 Y159.439 I-.73 J-4.084 E.0491
G1 X136.56 Y152.144 E.34221
G1 X137.371 Y150.723 E.05428
G1 X133.5 Y146.852 E.1816
G1 X133.5 Y147.528 E.0224
G1 X146.792 Y134.236 E.62352
G1 X148.536 Y131.184 E.11662
G1 X113.842 Y96.49 E1.62754
G1 X115.454 Y96.49 E.05346
G1 X100.298 Y111.646 E.71098
G1 X97.507 Y106.761 E.18662
G1 X107.778 Y96.49 E.48184
G1 X106.166 Y96.49 E.05347
G1 X145.745 Y136.069 E1.85671
G1 X142.954 Y140.954 E.18663
G1 X101.44 Y99.44 E1.9475
G2 X99.644 Y96.951 I-3.472 J.614 E.10531
G1 X100.102 Y96.49 E.02156
G1 X101.73 Y96.49 E.05401
G1 X99.112 Y96.867 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.422118
G1 F15000
G1 X98.958 Y96.615 E.00913
; LINE_WIDTH: 0.443836
G1 X98.946 Y96.596 E.00074
; LINE_WIDTH: 0.499624
G1 F13794.514
G1 X98.934 Y96.577 E.00084
G1 X98.789 Y96.559 E.00545
; LINE_WIDTH: 0.467891
G1 F14824.544
G1 X98.612 Y96.541 E.00617
; LINE_WIDTH: 0.420393
G1 F15000
G1 X98.259 Y96.519 E.01086
; LINE_WIDTH: 0.387141
G1 X97.555 Y96.529 E.01975
; LINE_WIDTH: 0.410868
G1 X97.378 Y96.542 E.00533
; LINE_WIDTH: 0.438282
G1 X97.2 Y96.56 E.00576
; LINE_WIDTH: 0.480606
G1 F14393.882
G1 X97.066 Y96.577 E.00484
G1 X97.042 Y96.615 E.00161
; LINE_WIDTH: 0.443572
G1 F15000
G1 X96.888 Y96.867 E.00964
; WIPE_START
G1 F24000
G1 X97.042 Y96.615 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.212 J-.109 P1  F30000
G1 X93.015 Y141.422 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X93.132 Y141.409 E.00361
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.369 Y146.054 E.01969
G1 X94.916 Y146.507 E.01969
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.348 Y146.507 E.01969
G1 X90.895 Y146.054 E.01969
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.955 Y141.429 E.01423
M204 S10000
G1 X93.224 Y140.99 F30000
M204 S5000
G1 F12000
G1 X93.227 Y140.991 E.00007
G1 X93.773 Y141.045 E.01688
G1 X94.39 Y141.232 E.01981
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
G1 X93.165 Y140.985 E.00101
M204 S10000
; WIPE_START
G1 F24000
G1 X93.227 Y140.991 E-.02371
G1 X93.773 Y141.045 E-.20874
G1 X94.39 Y141.232 E-.24501
G1 X94.959 Y141.536 E-.245
G1 X95.035 Y141.598 E-.03753
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.137 J.434 P1  F30000
G1 X108.659 Y177.28 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X108.776 Y177.266 E.00361
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
M73 P36 R17
G1 X111.354 Y181.369 E.01969
G1 X111.013 Y181.912 E.01969
G1 X110.56 Y182.365 E.01969
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X106.992 Y182.365 E.01969
G1 X106.539 Y181.912 E.01969
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.6 Y177.286 E.01423
M204 S10000
G1 X108.869 Y176.848 F30000
M204 S5000
G1 F12000
G1 X108.871 Y176.848 E.00007
G1 X109.418 Y176.902 E.01688
G1 X110.035 Y177.089 E.01981
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X108.809 Y176.842 E.00101
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.871 Y176.848 E-.02371
G1 X109.418 Y176.902 E-.20874
G1 X110.035 Y177.089 E-.24501
G1 X110.604 Y177.393 E-.245
G1 X110.68 Y177.456 E-.03753
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/118
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
G3 Z1.6 I.236 J1.194 P1  F30000
G1 X166.635 Y166.406 Z1.6
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X166.769 Y166.391 E.00414
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.006 Y171.036 E.01969
G1 X168.553 Y171.489 E.01969
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X164.985 Y171.489 E.01969
G1 X164.532 Y171.036 E.01969
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.026 Y168.481 E.00437
G1 X164.191 Y168.01 E.01531
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.575 Y166.412 E.01371
M204 S10000
G1 X166.881 Y165.974 F30000
M204 S5000
G1 F12000
G1 X166.885 Y165.974 E.00013
G1 X167.41 Y166.026 E.01623
G1 X168.027 Y166.213 E.01981
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X166.821 Y165.968 E.00161
M204 S10000
; WIPE_START
G1 F24000
G1 X166.885 Y165.974 E-.02435
G1 X167.41 Y166.026 E-.20072
G1 X168.027 Y166.213 E-.24501
G1 X168.596 Y166.517 E-.245
G1 X168.687 Y166.592 E-.04492
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.317 J-1.175 P1  F30000
G1 X128.275 Y155.677 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.035 Y155.504 E.00982
G3 X126.848 Y153.047 I1.965 J-2.465 E.0936
G1 X126.848 Y140.032 E.43173
G3 X129.921 Y136.888 I3.154 J.01 E.16136
G3 X133.152 Y140.032 I.07 J3.16 E.16647
G1 X133.152 Y153.052 E.43188
G3 X128.325 Y155.709 I-3.152 J-.013 E.22238
G1 X128.594 Y155.411 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.503 Y155.358 E.00325
G3 X127.24 Y153.042 I1.497 J-2.319 E.08449
G1 X127.24 Y140.037 E.39961
G3 X129.931 Y137.28 I2.762 J.005 E.131
G3 X132.76 Y140.037 I.061 J2.767 E.13514
G1 X132.76 Y153.044 E.39966
G3 X128.741 Y155.495 I-2.76 J-.005 E.17323
G1 X128.646 Y155.441 E.00336
M204 S10000
; WIPE_START
G1 F24000
G1 X128.503 Y155.358 E-.06294
G1 X128.279 Y155.198 E-.10455
G1 X128.073 Y155.015 E-.10456
G1 X127.886 Y154.814 E-.10456
G1 X127.72 Y154.594 E-.10455
G1 X127.576 Y154.36 E-.10456
G1 X127.457 Y154.112 E-.10456
G1 X127.394 Y153.939 E-.06972
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.089 J-.544 P1  F30000
G1 X98.986 Y97.047 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.004 Y97.052 E.0006
G3 X97.921 Y96.888 I-1.004 J2.988 E.62041
G1 X98.079 Y96.888 E.00521
G3 X98.701 Y96.966 I-.079 J3.151 E.02086
G1 X98.929 Y97.03 E.00783
G1 X98.879 Y97.423 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X97.931 Y97.28 I-.879 J2.616 E.50318
G1 X98.069 Y97.28 E.00423
G3 X98.822 Y97.405 I-.069 J2.759 E.02353
M204 S10000
; WIPE_START
G1 F24000
G1 X99.135 Y97.524 E-.12732
G1 X99.38 Y97.649 E-.10457
G1 X99.611 Y97.799 E-.10455
G1 X99.826 Y97.97 E-.10456
G1 X100.023 Y98.162 E-.10456
G1 X100.2 Y98.373 E-.10456
G1 X100.355 Y98.6 E-.10456
G1 X100.362 Y98.613 E-.00532
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.037 J1.216 P1  F30000
G1 X158.866 Y100.372 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X158.864 Y100.353 E.0006
G3 X161.921 Y96.888 I3.136 J-.314 E.17206
G1 X162.079 Y96.888 E.00521
G3 X158.911 Y100.664 I-.079 J3.151 E.4692
G1 X158.875 Y100.431 E.00783
G1 X159.254 Y100.314 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X161.931 Y97.28 I2.746 J-.275 E.13955
G1 X162.069 Y97.28 E.00423
G3 X159.261 Y100.374 I-.069 J2.759 E.38716
M204 S10000
; WIPE_START
G1 F24000
G1 X159.24 Y100.04 E-.12731
G1 X159.254 Y99.765 E-.10456
G1 X159.295 Y99.493 E-.10455
G1 X159.406 Y99.096 E-.15676
G1 X159.513 Y98.842 E-.10456
G1 X159.645 Y98.6 E-.10457
G1 X159.73 Y98.475 E-.05769
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.026 J-1.217 P1  F30000
G1 X93.3 Y97.043 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X95.177 Y96.142 I1.875 J1.5 E.07144
G1 X164.888 Y96.143 E2.31242
G3 X166.909 Y99.736 I-.062 J2.399 E.16444
G1 X133.822 Y157.637 E2.21217
G3 X126.178 Y157.637 I-3.822 J-2.186 E.30708
G1 X93.091 Y99.736 E2.21217
G3 X93.263 Y97.09 I2.084 J-1.193 E.09317
G1 X92.987 Y96.803 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X92.994 Y96.798 E.00028
G3 X95.172 Y95.75 I2.181 J1.745 E.07681
G1 X164.892 Y95.751 E2.14231
G3 X167.252 Y99.926 I-.067 J2.792 E.17719
G1 X134.16 Y157.836 E2.04944
G3 X125.84 Y157.836 I-4.16 J-2.386 E.30948
G1 X92.748 Y99.926 E2.04944
G3 X92.759 Y97.141 I2.427 J-1.383 E.08959
G1 X92.953 Y96.853 E.01067
M204 S10000
; WIPE_START
G1 F24000
G1 X92.994 Y96.798 E-.02601
G1 X93.176 Y96.588 E-.10541
G1 X93.488 Y96.313 E-.15811
G1 X93.838 Y96.088 E-.15812
G1 X94.217 Y95.917 E-.15812
G1 X94.483 Y95.836 E-.10546
G1 X94.609 Y95.813 E-.04877
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.184 J-.283 P1  F30000
G1 X94.028 Y98.245 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.547928
G1 F12475.047
G3 X94.281 Y97.774 I1.601 J.555 E.02212
G1 X94.084 Y99.922 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G3 X94.397 Y98.493 I4.664 J.273 E.04514
G3 X95.642 Y96.911 I3.817 J1.723 E.06247
G2 X94.732 Y96.98 I-.161 J3.88 E.02809
G1 X94.361 Y97.141 E.01244
G1 X93.967 Y97.459 E.01557
G1 X93.726 Y97.823 E.0134
G1 X93.584 Y98.257 E.01403
G1 X93.554 Y98.632 E.01157
G2 X93.785 Y99.4 I1.961 J-.171 E.02478
G1 X94.054 Y99.87 E.01665
G1 X94.522 Y100.719 F30000
G1 F15000
G1 X94.459 Y99.895 E.0254
G3 X94.884 Y98.351 I4.254 J.339 E.0495
G3 X96.302 Y96.948 I3.002 J1.617 E.0622
G1 X96.231 Y96.821 E.00447
G3 X96.364 Y96.534 I.611 J.11 E.00984
G1 X95.194 Y96.534 E.03597
G1 X94.674 Y96.598 E.0161
G1 X94.133 Y96.84 E.01819
G1 X93.734 Y97.142 E.01537
G1 X93.396 Y97.633 E.01833
G1 X93.217 Y98.151 E.01682
G1 X93.181 Y98.688 E.01654
G1 X93.289 Y99.195 E.01594
G1 X93.458 Y99.587 E.0131
G1 X94.244 Y100.963 E.04871
G1 X94.381 Y100.734 E.0082
G1 X94.463 Y100.725 E.00254
G1 X94.867 Y101.268 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.596565
G1 F11379.134
G1 X94.73 Y101.629 E.01741
G1 X95.118 Y102.292 E.03464
G1 X96.301 Y103.094 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X97.852 Y103.528 I1.662 J-2.944 E.05396
G1 X131.017 Y136.692 E1.5558
G2 X128.983 Y136.693 I-1.017 J3.383 E.06841
G1 X162.14 Y103.536 E1.55546
G2 X163.694 Y103.101 I-.161 J-3.566 E.05398
G1 X164.882 Y102.292 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.585705
G1 F11606.816
G1 X165.27 Y101.629 E.03396
G1 X165.133 Y101.268 E.01707
G1 X165.675 Y97.715 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.550958
G1 F12400.668
G3 X165.934 Y98.165 I-1.2 J.993 E.02161
G1 X165.905 Y99.936 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X166.27 Y99.296 E.02263
G1 X166.419 Y98.855 E.01431
G1 X166.449 Y98.547 E.0095
G1 X166.371 Y98.046 E.01559
G1 X166.202 Y97.681 E.01234
G1 X165.949 Y97.371 E.0123
G1 X165.632 Y97.134 E.01217
G1 X165.219 Y96.975 E.0136
G2 X164.356 Y96.912 I-.631 J2.74 E.0267
G1 X164.966 Y97.478 E.02555
G3 X165.754 Y98.907 I-4.024 J3.151 E.05039
G1 X165.894 Y99.593 E.02151
G1 X165.903 Y99.876 E.00868
G1 X165.458 Y100.724 F30000
G1 F15000
G1 X165.618 Y100.738 E.00494
G1 X165.751 Y100.966 E.0081
G1 X166.614 Y99.455 E.05346
G1 X166.785 Y98.98 E.0155
G1 X166.824 Y98.584 E.01225
G1 X166.758 Y97.994 E.01823
G1 X166.502 Y97.453 E.01838
G1 X166.184 Y97.076 E.01516
G1 X165.787 Y96.79 E.01503
G1 X165.333 Y96.611 E.015
G1 X164.819 Y96.535 E.01595
G1 X163.634 Y96.535 E.03644
G1 X163.767 Y96.825 E.00979
G1 X163.703 Y96.94 E.00404
G1 X164.195 Y97.257 E.018
G1 X164.703 Y97.747 E.02168
G3 X165.389 Y99.003 I-3.819 J2.905 E.04413
G1 X165.524 Y99.668 E.02086
G1 X165.528 Y100.374 E.02168
G1 X165.47 Y100.666 E.00914
G1 X163.115 Y96.869 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.428683
G1 F15000
G1 X162.959 Y96.611 E.00946
; LINE_WIDTH: 0.451035
G1 X162.949 Y96.595 E.00066
; LINE_WIDTH: 0.500065
G1 F13781.206
G1 X162.938 Y96.578 E.00073
G1 X162.789 Y96.559 E.00561
; LINE_WIDTH: 0.466388
G1 F14877.18
G1 X162.612 Y96.542 E.00614
; LINE_WIDTH: 0.4189
G1 F15000
G1 X162.259 Y96.52 E.01082
; LINE_WIDTH: 0.38565
G1 X161.556 Y96.529 E.01966
; LINE_WIDTH: 0.409368
G1 X161.378 Y96.543 E.0053
; LINE_WIDTH: 0.436775
G1 X161.2 Y96.561 E.00574
; LINE_WIDTH: 0.478347
G1 F14468.582
G1 X161.062 Y96.578 E.00496
G1 X161.041 Y96.612 E.00141
; LINE_WIDTH: 0.450717
G1 F15000
G1 X160.885 Y96.869 E.00999
G1 X158.271 Y96.491 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X159.899 Y96.491 E.05401
G1 X160.237 Y96.829 E.01585
G1 X160.214 Y96.868 E.00151
G1 X160.355 Y96.954 E.00547
G2 X158.553 Y99.447 I1.758 J3.168 E.10536
G1 X117.046 Y140.954 E1.9472
G1 X119.837 Y145.839 E.18662
G1 X126.661 Y139.015 E.32013
G2 X126.508 Y139.86 I3.142 J1.006 E.02856
G1 X102.97 Y116.322 E1.1042
G1 X103.089 Y116.531 E.00796
G1 X123.13 Y96.491 E.94012
G1 X121.519 Y96.491 E.05344
G1 X151.327 Y126.299 E1.39837
G1 X154.118 Y121.414 E.18663
G1 X129.195 Y96.491 E1.1692
G1 X130.805 Y96.491 E.05343
G1 X105.881 Y121.415 E1.16926
G1 X108.672 Y126.3 E.18662
G1 X138.481 Y96.491 E1.39841
G1 X136.871 Y96.491 E.05342
G1 X156.909 Y116.529 E.94003
G1 X157.024 Y116.328 E.00767
G1 X133.492 Y139.86 E1.10391
G2 X133.35 Y139.026 I-3.711 J.203 E.02812
G1 X140.163 Y145.838 E.31958
G1 X139.355 Y147.252 E.05401
G1 X133.773 Y157.022 F30000
G1 F15476.087
G1 X134.58 Y155.608 E.05401
G1 X133.265 Y154.293 E.06171
G3 X126.735 Y154.293 I-3.265 J-1.254 E.27939
G1 X125.42 Y155.608 E.06172
G1 X126.227 Y157.022 E.05401
G1 X115.062 Y137.483 F30000
G1 F15476.087
G1 X114.254 Y136.07 E.05401
G1 X153.833 Y96.491 E1.85669
G1 X152.223 Y96.491 E.05339
G1 X162.491 Y106.759 E.48169
G1 X159.7 Y111.644 E.18663
G1 X144.547 Y96.491 E.71086
G1 X146.157 Y96.491 E.05341
G1 X111.463 Y131.185 E1.62755
G1 X113.205 Y134.233 E.11645
G1 X126.5 Y147.528 E.62368
G1 X126.5 Y146.852 E.0224
G1 X122.628 Y150.724 E.18161
G1 X123.44 Y152.143 E.05424
G1 X130.737 Y159.441 E.34235
G3 X129.265 Y159.439 I-.73 J-4.084 E.0491
G1 X136.56 Y152.144 E.34221
G1 X137.371 Y150.723 E.05428
G1 X133.5 Y146.852 E.1816
G1 X133.5 Y147.528 E.0224
G1 X146.792 Y134.236 E.62352
G1 X148.536 Y131.184 E.11662
G1 X113.842 Y96.49 E1.62754
G1 X115.454 Y96.49 E.05345
G1 X100.298 Y111.646 E.71098
G1 X97.507 Y106.761 E.18662
G1 X107.778 Y96.49 E.48183
G1 X106.166 Y96.49 E.05346
G1 X145.745 Y136.069 E1.85671
G1 X142.954 Y140.954 E.18663
G1 X101.446 Y99.446 E1.94721
G2 X99.644 Y96.951 I-3.496 J.627 E.10557
G1 X100.102 Y96.49 E.02156
G1 X101.73 Y96.49 E.05401
G1 X99.112 Y96.867 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.42219
G1 F15000
G1 X98.958 Y96.615 E.00913
; LINE_WIDTH: 0.443918
G1 X98.946 Y96.596 E.00073
; LINE_WIDTH: 0.499631
G1 F13794.283
G1 X98.934 Y96.577 E.00084
G1 X98.789 Y96.559 E.00545
; LINE_WIDTH: 0.467875
G1 F14825.12
G1 X98.612 Y96.541 E.00616
; LINE_WIDTH: 0.420381
G1 F15000
G1 X98.259 Y96.519 E.01086
; LINE_WIDTH: 0.38713
G1 X97.555 Y96.529 E.01975
; LINE_WIDTH: 0.41086
G1 X97.378 Y96.542 E.00532
; LINE_WIDTH: 0.438271
G1 X97.2 Y96.56 E.00576
; LINE_WIDTH: 0.480594
G1 F14394.296
G1 X97.066 Y96.577 E.00484
G1 X97.042 Y96.615 E.00161
; LINE_WIDTH: 0.443609
G1 F15000
G1 X96.888 Y96.867 E.00964
; WIPE_START
G1 F24000
G1 X97.042 Y96.615 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.212 J-.109 P1  F30000
G1 X92.998 Y141.424 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X93.132 Y141.409 E.00414
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.369 Y146.054 E.01969
G1 X94.916 Y146.507 E.01969
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.348 Y146.507 E.01969
G1 X90.895 Y146.054 E.01969
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.389 Y143.499 E.00437
G1 X90.554 Y143.029 E.01531
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.938 Y141.431 E.01371
M204 S10000
G1 X93.244 Y140.992 F30000
M204 S5000
G1 F12000
G1 X93.248 Y140.993 E.00013
G1 X93.773 Y141.045 E.01623
G1 X94.39 Y141.232 E.01981
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
G1 X93.184 Y140.987 E.00161
M204 S10000
; WIPE_START
G1 F24000
G1 X93.248 Y140.993 E-.02435
G1 X93.773 Y141.045 E-.20072
G1 X94.39 Y141.232 E-.24501
G1 X94.959 Y141.536 E-.245
G1 X95.05 Y141.611 E-.04492
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.137 J.433 P1  F30000
G1 X108.643 Y177.281 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X108.776 Y177.266 E.00414
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
G1 X111.354 Y181.369 E.01969
G1 X111.013 Y181.912 E.01969
G1 X110.56 Y182.365 E.01969
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X106.992 Y182.365 E.01969
G1 X106.539 Y181.912 E.01969
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.034 Y179.357 E.00437
G1 X106.198 Y178.886 E.01531
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.583 Y177.288 E.01371
M204 S10000
G1 X108.888 Y176.85 F30000
M204 S5000
G1 F12000
G1 X108.892 Y176.85 E.00013
G1 X109.418 Y176.902 E.01623
G1 X110.035 Y177.089 E.01981
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X108.829 Y176.844 E.00161
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.892 Y176.85 E-.02435
G1 X109.418 Y176.902 E-.20072
G1 X110.035 Y177.089 E-.24501
G1 X110.604 Y177.393 E-.245
G1 X110.695 Y177.468 E-.04492
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/118
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
G3 Z1.8 I.236 J1.194 P1  F30000
G1 X166.618 Y166.408 Z1.8
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X166.769 Y166.391 E.00468
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.006 Y171.036 E.01969
G1 X168.553 Y171.489 E.01969
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X164.985 Y171.489 E.01969
G1 X164.532 Y171.036 E.01969
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.558 Y166.414 E.01317
M204 S10000
G1 X166.901 Y165.976 F30000
M204 S5000
G1 F12000
G1 X166.906 Y165.976 E.00016
G1 X167.41 Y166.026 E.01558
G1 X168.027 Y166.213 E.01981
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X166.841 Y165.97 E.00223
M204 S10000
; WIPE_START
G1 F24000
G1 X166.906 Y165.976 E-.02476
G1 X167.41 Y166.026 E-.1927
G1 X168.027 Y166.213 E-.24501
G1 X168.596 Y166.517 E-.245
G1 X168.703 Y166.605 E-.05253
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.316 J-1.175 P1  F30000
G1 X128.426 Y155.766 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.29 Y155.687 E.00521
G3 X126.848 Y153.047 I1.71 J-2.648 E.10402
G1 X126.848 Y140.027 E.4319
G3 X129.921 Y136.888 I3.162 J.022 E.1611
G3 X133.152 Y140.032 I.07 J3.16 E.16647
G1 X133.152 Y153.047 E.43173
G3 X128.562 Y155.844 I-3.152 J-.008 E.21349
G1 X128.478 Y155.796 E.00322
G1 X128.62 Y155.43 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.389 Y155.28 E.00845
G3 X127.24 Y153.042 I1.611 J-2.241 E.08026
G1 X127.24 Y140.035 E.39967
G3 X129.931 Y137.28 I2.769 J.013 E.13086
G3 X132.76 Y140.037 I.061 J2.767 E.13514
G1 X132.76 Y153.042 E.39961
G3 X128.672 Y155.458 I-2.76 J-.003 E.17568
M204 S10000
; WIPE_START
G1 F24000
G1 X128.389 Y155.28 E-.127
G1 X128.073 Y155.016 E-.15673
G1 X127.886 Y154.814 E-.10456
G1 X127.72 Y154.594 E-.10456
G1 X127.576 Y154.36 E-.10456
G1 X127.457 Y154.112 E-.10456
G1 X127.404 Y153.968 E-.05802
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.089 J-.544 P1  F30000
G1 X98.986 Y97.047 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.004 Y97.052 E.0006
G3 X97.921 Y96.888 I-1.004 J2.988 E.62041
G1 X98.079 Y96.888 E.00521
G3 X98.701 Y96.966 I-.079 J3.151 E.02086
M73 P37 R17
G1 X98.929 Y97.03 E.00783
G1 X98.879 Y97.423 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X97.931 Y97.28 I-.879 J2.616 E.50318
G1 X98.069 Y97.28 E.00423
G3 X98.822 Y97.405 I-.069 J2.759 E.02353
M204 S10000
; WIPE_START
G1 F24000
G1 X99.135 Y97.524 E-.12732
G1 X99.497 Y97.721 E-.15676
G1 X99.721 Y97.882 E-.10456
G1 X99.927 Y98.064 E-.10455
G1 X100.114 Y98.266 E-.10456
G1 X100.28 Y98.485 E-.10456
G1 X100.36 Y98.614 E-.05769
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.037 J1.216 P1  F30000
G1 X158.866 Y100.372 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X158.864 Y100.353 E.0006
G3 X161.921 Y96.888 I3.136 J-.314 E.17206
G1 X162.079 Y96.888 E.00521
G3 X158.911 Y100.664 I-.079 J3.151 E.4692
G1 X158.875 Y100.431 E.00783
G1 X159.254 Y100.314 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X161.931 Y97.28 I2.746 J-.275 E.13955
G1 X162.069 Y97.28 E.00423
G3 X159.261 Y100.374 I-.069 J2.759 E.38716
M204 S10000
; WIPE_START
G1 F24000
G1 X159.24 Y100.04 E-.12732
G1 X159.254 Y99.765 E-.10456
G1 X159.295 Y99.493 E-.10455
G1 X159.406 Y99.096 E-.15676
G1 X159.513 Y98.842 E-.10456
G1 X159.645 Y98.6 E-.10456
G1 X159.73 Y98.475 E-.05769
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.026 J-1.217 P1  F30000
G1 X93.3 Y97.043 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X95.177 Y96.142 I1.875 J1.5 E.07144
G1 X164.95 Y96.145 E2.31449
G3 X166.909 Y99.736 I-.121 J2.396 E.16249
G1 X133.822 Y157.637 E2.21217
G3 X126.178 Y157.637 I-3.822 J-2.179 E.30726
G1 X93.091 Y99.736 E2.21217
G3 X93.263 Y97.09 I2.084 J-1.193 E.09317
G1 X92.986 Y96.805 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X92.994 Y96.798 E.00033
G3 X95.172 Y95.75 I2.181 J1.745 E.07681
G1 X164.969 Y95.753 E2.14467
G3 X167.252 Y99.926 I-.14 J2.787 E.17494
G1 X134.16 Y157.836 E2.04944
G3 X125.84 Y157.836 I-4.16 J-2.377 E.30966
G1 X92.748 Y99.926 E2.04944
G3 X92.759 Y97.141 I2.427 J-1.383 E.08959
G1 X92.952 Y96.855 E.01061
M204 S10000
; WIPE_START
G1 F24000
G1 X92.994 Y96.798 E-.02674
G1 X93.176 Y96.588 E-.1054
G1 X93.488 Y96.313 E-.15813
G1 X93.838 Y96.088 E-.15812
G1 X94.217 Y95.917 E-.15812
G1 X94.483 Y95.836 E-.10546
G1 X94.607 Y95.814 E-.04803
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.183 J-.284 P1  F30000
G1 X94.013 Y98.287 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.53613
G1 F12773.464
G1 X94.287 Y97.777 E.02326
G1 X94.082 Y99.889 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X94.145 Y99.346 E.0168
G1 X94.318 Y98.703 E.02045
G3 X95.332 Y97.17 I4.194 J1.672 E.05688
G1 X95.651 Y96.911 E.01262
G1 X94.946 Y96.944 E.02167
G1 X94.733 Y96.98 E.00666
G1 X94.36 Y97.141 E.01246
G1 X93.967 Y97.459 E.01555
G1 X93.747 Y97.777 E.01188
G1 X93.58 Y98.243 E.01519
G2 X93.62 Y99.01 I1.571 J.302 E.02384
G2 X94.051 Y99.838 I3.531 J-1.309 E.02875
G1 X94.537 Y100.722 F30000
G1 F15000
G1 X94.472 Y100.376 E.01082
G3 X94.672 Y98.832 I3.82 J-.29 E.04817
G3 X95.595 Y97.44 I3.844 J1.547 E.05168
G1 X96.065 Y97.07 E.01838
G1 X96.298 Y96.94 E.0082
G1 X96.231 Y96.817 E.00433
G3 X96.364 Y96.534 I.627 J.123 E.00972
G1 X95.194 Y96.534 E.03597
G1 X94.674 Y96.598 E.0161
G1 X94.133 Y96.84 E.0182
G1 X93.734 Y97.142 E.01535
G1 X93.438 Y97.532 E.01505
G1 X93.216 Y98.093 E.01853
G1 X93.18 Y98.681 E.0181
G1 X93.273 Y99.155 E.01486
G1 X93.491 Y99.644 E.01645
G1 X94.244 Y100.963 E.04667
G1 X94.378 Y100.735 E.00811
G1 X94.477 Y100.727 E.00307
G1 X94.867 Y101.268 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.596568
G1 F11379.081
G1 X94.73 Y101.629 E.01741
G1 X95.118 Y102.292 E.03464
G1 X96.301 Y103.094 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X97.852 Y103.528 I1.66 J-2.939 E.05396
G1 X131.017 Y136.692 E1.5558
G2 X128.983 Y136.692 I-1.017 J3.383 E.06841
G1 X162.14 Y103.536 E1.55546
G2 X163.694 Y103.101 I-.161 J-3.566 E.05398
G1 X164.882 Y102.292 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.585726
G1 F11606.354
G1 X165.27 Y101.629 E.03396
G1 X165.133 Y101.268 E.01707
G1 X165.675 Y97.715 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.550924
G1 F12401.483
G3 X165.934 Y98.164 I-1.205 J.996 E.02154
G1 X165.905 Y99.936 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X166.27 Y99.296 E.02263
G1 X166.419 Y98.855 E.01431
G1 X166.449 Y98.547 E.00949
G1 X166.37 Y98.044 E.01566
G1 X166.201 Y97.68 E.01232
G1 X165.949 Y97.371 E.01224
G1 X165.632 Y97.134 E.01217
G1 X165.224 Y96.973 E.01347
G1 X164.871 Y96.914 E.01101
G1 X164.358 Y96.914 E.01575
G3 X165.038 Y97.564 I-4.487 J5.378 E.02892
G1 X165.415 Y98.116 E.02053
G3 X165.894 Y99.593 I-4.077 J2.138 E.04795
G1 X165.903 Y99.876 E.00868
G1 X165.458 Y100.724 F30000
G1 F15000
G1 X165.618 Y100.738 E.00494
G1 X165.751 Y100.965 E.0081
G1 X166.614 Y99.455 E.05346
G1 X166.785 Y98.98 E.0155
G1 X166.824 Y98.584 E.01224
G1 X166.758 Y97.992 E.01831
G1 X166.501 Y97.452 E.01836
G1 X166.184 Y97.076 E.01511
G1 X165.787 Y96.79 E.01504
G1 X165.289 Y96.602 E.01636
G1 X164.871 Y96.537 E.01301
G1 X163.627 Y96.537 E.03821
G1 X163.76 Y96.824 E.00973
G1 X163.698 Y96.936 E.00394
G1 X164.195 Y97.257 E.01818
G1 X164.703 Y97.747 E.02168
G3 X165.389 Y99.003 I-3.813 J2.902 E.04413
G1 X165.524 Y99.668 E.02086
G1 X165.528 Y100.374 E.02168
G1 X165.47 Y100.666 E.00914
G1 X163.112 Y96.867 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.421757
G1 F15000
G1 X162.958 Y96.615 E.00911
; LINE_WIDTH: 0.443443
G1 X162.946 Y96.596 E.00074
; LINE_WIDTH: 0.499589
G1 F13795.569
G1 X162.934 Y96.577 E.00084
G1 X162.789 Y96.559 E.00544
; LINE_WIDTH: 0.46796
G1 F14822.136
G1 X162.612 Y96.541 E.00617
; LINE_WIDTH: 0.42046
G1 F15000
G1 X162.259 Y96.519 E.01086
; LINE_WIDTH: 0.387195
G1 X161.555 Y96.529 E.01975
; LINE_WIDTH: 0.410914
G1 X161.378 Y96.542 E.00533
; LINE_WIDTH: 0.438327
G1 X161.2 Y96.56 E.00577
; LINE_WIDTH: 0.480662
G1 F14392.063
G1 X161.066 Y96.577 E.00483
G1 X161.042 Y96.615 E.00162
; LINE_WIDTH: 0.443443
G1 F15000
G1 X160.888 Y96.867 E.00963
G1 X158.272 Y96.493 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X159.901 Y96.493 E.05401
G1 X160.358 Y96.952 E.02149
G2 X158.553 Y99.447 I1.755 J3.169 E.10548
G1 X117.046 Y140.954 E1.9472
G1 X119.837 Y145.839 E.18662
G1 X126.65 Y139.026 E.31961
G2 X126.506 Y139.858 I4.254 J1.162 E.02806
G1 X102.97 Y116.322 E1.10412
G1 X103.089 Y116.531 E.00796
G1 X123.129 Y96.491 E.94009
G1 X121.519 Y96.491 E.0534
G1 X151.327 Y126.299 E1.39834
G1 X154.118 Y121.414 E.18663
G1 X129.195 Y96.492 E1.16916
G1 X130.805 Y96.492 E.05338
G1 X105.881 Y121.415 E1.16923
G1 X108.672 Y126.3 E.18662
G1 X138.48 Y96.492 E1.39836
G1 X136.872 Y96.492 E.05335
G1 X156.909 Y116.529 E.93999
G1 X157.024 Y116.328 E.00767
G1 X133.492 Y139.86 E1.10391
G2 X133.35 Y139.026 I-3.711 J.203 E.02812
G1 X140.163 Y145.838 E.31959
G1 X139.355 Y147.252 E.05401
G1 X133.773 Y157.022 F30000
G1 F15476.087
G1 X134.58 Y155.608 E.05401
G1 X133.265 Y154.293 E.0617
G3 X126.735 Y154.293 I-3.265 J-1.254 E.27939
G1 X125.42 Y155.608 E.06172
G1 X126.227 Y157.022 E.05401
G1 X115.062 Y137.483 F30000
G1 F15476.087
G1 X114.254 Y136.07 E.05401
G1 X153.831 Y96.493 E1.85663
G1 X152.224 Y96.493 E.05331
G1 X162.491 Y106.759 E.48163
G1 X159.7 Y111.644 E.18663
G1 X144.548 Y96.492 E.71081
G1 X146.156 Y96.492 E.05333
G1 X111.463 Y131.185 E1.6275
G1 X113.205 Y134.233 E.11645
G1 X126.5 Y147.528 E.62368
G1 X126.5 Y146.852 E.0224
G1 X122.628 Y150.724 E.18161
G1 X123.44 Y152.143 E.05424
G1 X130.737 Y159.441 E.34235
G3 X129.265 Y159.439 I-.73 J-4.084 E.0491
G1 X136.56 Y152.144 E.34221
G1 X137.371 Y150.723 E.05428
G1 X133.5 Y146.852 E.1816
G1 X133.5 Y147.528 E.0224
G1 X146.792 Y134.236 E.62352
G1 X148.536 Y131.184 E.11662
G1 X113.843 Y96.491 E1.62752
G1 X115.453 Y96.491 E.05342
G1 X100.298 Y111.646 E.71096
G1 X97.507 Y106.761 E.18662
G1 X107.778 Y96.491 E.48182
G1 X106.166 Y96.49 E.05345
G1 X145.745 Y136.069 E1.85669
G1 X142.954 Y140.954 E.18663
G1 X101.444 Y99.444 E1.94728
G2 X99.644 Y96.951 I-3.757 J.816 E.10495
G1 X100.102 Y96.49 E.02156
G1 X101.73 Y96.49 E.05401
G1 X99.112 Y96.867 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.421745
G1 F15000
G1 X98.958 Y96.615 E.00911
; LINE_WIDTH: 0.443427
G1 X98.946 Y96.596 E.00074
; LINE_WIDTH: 0.499587
G1 F13795.63
G1 X98.934 Y96.577 E.00084
G1 X98.789 Y96.559 E.00544
; LINE_WIDTH: 0.46796
G1 F14822.13
G1 X98.612 Y96.541 E.00617
; LINE_WIDTH: 0.420457
G1 F15000
G1 X98.259 Y96.519 E.01086
; LINE_WIDTH: 0.387195
G1 X97.555 Y96.529 E.01975
; LINE_WIDTH: 0.410914
G1 X97.378 Y96.542 E.00533
; LINE_WIDTH: 0.438325
G1 X97.2 Y96.56 E.00577
; LINE_WIDTH: 0.480662
G1 F14392.063
G1 X97.066 Y96.577 E.00483
G1 X97.042 Y96.615 E.00162
; LINE_WIDTH: 0.443443
G1 F15000
G1 X96.888 Y96.867 E.00963
; WIPE_START
G1 F24000
G1 X97.042 Y96.615 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.212 J-.11 P1  F30000
G1 X92.981 Y141.426 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X93.132 Y141.409 E.00468
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.369 Y146.054 E.01969
G1 X94.916 Y146.507 E.01969
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.348 Y146.507 E.01969
G1 X90.895 Y146.054 E.01969
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.921 Y141.433 E.01317
M204 S10000
G1 X93.264 Y140.994 F30000
M204 S5000
G1 F12000
G1 X93.269 Y140.995 E.00016
G1 X93.773 Y141.045 E.01558
G1 X94.39 Y141.232 E.01981
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
G1 X93.204 Y140.988 E.00223
M204 S10000
; WIPE_START
G1 F24000
G1 X93.269 Y140.995 E-.02476
G1 X93.773 Y141.045 E-.1927
G1 X94.39 Y141.232 E-.24501
G1 X94.959 Y141.536 E-.245
G1 X95.066 Y141.623 E-.05253
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.138 J.433 P1  F30000
G1 X108.625 Y177.283 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X108.776 Y177.266 E.00468
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
G1 X111.354 Y181.369 E.01969
G1 X111.013 Y181.912 E.01969
G1 X110.56 Y182.365 E.01969
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X106.992 Y182.365 E.01969
G1 X106.539 Y181.912 E.01969
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.565 Y177.29 E.01317
M204 S10000
G1 X108.908 Y176.852 F30000
M204 S5000
G1 F12000
G1 X108.913 Y176.852 E.00016
G1 X109.418 Y176.902 E.01558
G1 X110.035 Y177.089 E.01981
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X108.848 Y176.846 E.00223
M204 S10000
M106 S249.9
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.913 Y176.852 E-.02476
G1 X109.418 Y176.902 E-.1927
G1 X110.035 Y177.089 E-.24501
G1 X110.604 Y177.393 E-.245
G1 X110.71 Y177.481 E-.05253
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/118
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
G3 Z2 I.236 J1.194 P1  F30000
G1 X166.6 Y166.41 Z2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X166.769 Y166.391 E.00523
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.006 Y171.036 E.01969
G1 X168.553 Y171.489 E.01969
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X164.985 Y171.489 E.01969
G1 X164.532 Y171.036 E.01969
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.54 Y166.416 E.01261
M204 S10000
G1 X166.921 Y165.978 F30000
M204 S5000
G1 F12000
G1 X166.927 Y165.978 E.00018
G1 X167.41 Y166.026 E.01493
G1 X168.027 Y166.213 E.01981
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X166.861 Y165.972 E.00286
M204 S10000
; WIPE_START
G1 F24000
G1 X166.927 Y165.978 E-.02497
G1 X167.41 Y166.026 E-.18468
G1 X168.027 Y166.213 E-.24501
G1 X168.596 Y166.517 E-.245
G1 X168.719 Y166.618 E-.06034
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.315 J-1.175 P1  F30000
G1 X128.546 Y155.836 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.292 Y155.685 E.00982
G3 X126.848 Y153.047 I1.708 J-2.649 E.10398
G1 X126.848 Y140.028 E.43188
G3 X129.921 Y136.888 I3.162 J.021 E.16111
G3 X133.152 Y140.032 I.07 J3.16 E.16647
G1 X133.152 Y153.047 E.43173
G3 X128.601 Y155.86 I-3.152 J-.011 E.21197
G1 X128.648 Y155.442 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.504 Y155.356 E.00517
G3 X127.24 Y153.042 I1.496 J-2.319 E.08445
G1 X127.24 Y140.035 E.39966
G3 X129.931 Y137.28 I2.769 J.013 E.13087
G3 X132.76 Y140.037 I.061 J2.767 E.13514
G1 X132.76 Y153.042 E.39961
G3 X128.742 Y155.493 I-2.76 J-.006 E.17316
G1 X128.701 Y155.471 E.00144
M204 S10000
; WIPE_START
G1 F24000
G1 X128.504 Y155.356 E-.08666
G1 X128.279 Y155.198 E-.10451
G1 X128.073 Y155.015 E-.10456
G1 X127.886 Y154.814 E-.10456
G1 X127.72 Y154.594 E-.10457
G1 X127.576 Y154.36 E-.10456
G1 X127.457 Y154.112 E-.10455
G1 X127.415 Y153.998 E-.04603
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.089 J-.544 P1  F30000
G1 X98.986 Y97.047 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.004 Y97.052 E.0006
G3 X97.921 Y96.888 I-1.004 J2.988 E.62041
G1 X98.079 Y96.888 E.00521
G3 X98.701 Y96.966 I-.079 J3.151 E.02086
G1 X98.929 Y97.03 E.00783
G1 X98.879 Y97.423 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X97.931 Y97.28 I-.879 J2.616 E.50318
G1 X98.069 Y97.28 E.00423
G3 X98.822 Y97.405 I-.069 J2.759 E.02353
M204 S10000
; WIPE_START
G1 F24000
G1 X99.135 Y97.524 E-.12732
G1 X99.38 Y97.649 E-.10455
G1 X99.611 Y97.799 E-.10457
G1 X99.826 Y97.97 E-.10456
G1 X100.023 Y98.162 E-.10456
G1 X100.2 Y98.373 E-.10457
G1 X100.355 Y98.6 E-.10455
G1 X100.362 Y98.613 E-.00534
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.037 J1.216 P1  F30000
G1 X158.866 Y100.372 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X158.864 Y100.353 E.0006
G3 X161.921 Y96.888 I3.136 J-.314 E.17206
G1 X162.079 Y96.888 E.00521
G3 X158.911 Y100.664 I-.079 J3.151 E.4692
G1 X158.875 Y100.431 E.00783
G1 X159.254 Y100.314 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X161.931 Y97.28 I2.746 J-.275 E.13955
G1 X162.069 Y97.28 E.00423
G3 X159.261 Y100.374 I-.069 J2.759 E.38716
M204 S10000
; WIPE_START
G1 F24000
G1 X159.24 Y100.04 E-.12732
G1 X159.254 Y99.765 E-.10456
G1 X159.295 Y99.493 E-.10455
G1 X159.406 Y99.096 E-.15676
G1 X159.513 Y98.842 E-.10456
G1 X159.645 Y98.6 E-.10456
G1 X159.73 Y98.475 E-.05769
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.026 J-1.217 P1  F30000
G1 X93.3 Y97.043 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X95.177 Y96.142 I1.875 J1.5 E.07144
G1 X164.897 Y96.144 E2.31274
G3 X166.909 Y99.736 I-.067 J2.397 E.16423
G1 X133.822 Y157.637 E2.21217
G3 X126.178 Y157.637 I-3.822 J-2.186 E.30708
G1 X93.091 Y99.736 E2.21217
G3 X93.263 Y97.09 I2.084 J-1.193 E.09317
G1 X92.985 Y96.806 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X92.994 Y96.798 E.00039
G3 X95.172 Y95.75 I2.181 J1.745 E.07681
G1 X164.909 Y95.752 E2.14281
G3 X167.252 Y99.926 I-.079 J2.789 E.17679
G1 X134.16 Y157.836 E2.04944
G3 X125.84 Y157.836 I-4.16 J-2.386 E.30948
G1 X92.748 Y99.926 E2.04944
G3 X92.759 Y97.141 I2.427 J-1.383 E.08959
G1 X92.951 Y96.856 E.01055
M204 S10000
; WIPE_START
G1 F24000
G1 X92.994 Y96.798 E-.02747
G1 X93.176 Y96.588 E-.10541
G1 X93.488 Y96.313 E-.15812
G1 X93.838 Y96.088 E-.15813
G1 X94.219 Y95.917 E-.15871
G1 X94.483 Y95.836 E-.10486
G1 X94.605 Y95.814 E-.0473
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.184 J-.28 P1  F30000
G1 X94.02 Y98.289 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.552276
G1 F12368.56
G1 X94.204 Y97.884 E.01847
G1 X94.281 Y97.774 E.00558
G1 X94.082 Y99.889 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G3 X95.177 Y97.32 I4.002 J.187 E.08766
G1 X95.664 Y96.911 E.01954
M73 P38 R17
G2 X94.732 Y96.98 I-.186 J3.794 E.02879
G1 X94.361 Y97.141 E.01244
G1 X93.967 Y97.459 E.01557
G1 X93.747 Y97.776 E.01184
G1 X93.58 Y98.244 E.01526
G2 X93.62 Y99.009 I1.574 J.301 E.02379
G2 X94.051 Y99.838 I3.531 J-1.308 E.02877
G1 X94.537 Y100.722 F30000
G1 F15000
G1 X94.472 Y100.376 E.01082
G3 X94.88 Y98.359 I3.831 J-.274 E.06401
G1 X95.166 Y97.912 E.01631
G3 X96.298 Y96.941 I3.054 J2.416 E.04612
G1 X96.231 Y96.817 E.00433
G3 X96.364 Y96.534 I.627 J.123 E.00972
G1 X95.194 Y96.534 E.03597
G1 X94.674 Y96.598 E.0161
G1 X94.133 Y96.84 E.01819
G1 X93.734 Y97.142 E.01537
G1 X93.438 Y97.532 E.01506
G1 X93.216 Y98.093 E.01853
G1 X93.18 Y98.679 E.01806
G1 X93.272 Y99.155 E.01488
G1 X93.491 Y99.644 E.01647
G1 X94.244 Y100.963 E.04667
M73 P38 R16
G1 X94.378 Y100.735 E.00811
G1 X94.477 Y100.727 E.00307
G1 X94.867 Y101.268 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.59657
G1 F11379.031
G1 X94.73 Y101.629 E.01741
G1 X95.118 Y102.292 E.03464
; WIPE_START
G1 F24000
G1 X94.73 Y101.629 E-.50575
G1 X94.867 Y101.268 E-.25425
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.106 J.508 P1  F30000
G1 X96.888 Y96.867 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.44364
G1 F15000
G1 X97.042 Y96.615 E.00964
; LINE_WIDTH: 0.480577
G1 F14394.846
G1 X97.066 Y96.577 E.00161
G1 X97.2 Y96.56 E.00484
; LINE_WIDTH: 0.438261
G1 F15000
G1 X97.378 Y96.542 E.00576
; LINE_WIDTH: 0.410843
G1 X97.555 Y96.529 E.00532
; LINE_WIDTH: 0.387111
G1 X98.259 Y96.519 E.01975
; LINE_WIDTH: 0.420359
G1 X98.612 Y96.541 E.01086
; LINE_WIDTH: 0.467851
G1 F14825.966
G1 X98.789 Y96.559 E.00616
; LINE_WIDTH: 0.499649
G1 F13793.756
G1 X98.935 Y96.577 E.00546
G1 X98.946 Y96.596 E.00083
; LINE_WIDTH: 0.444101
G1 F15000
G1 X98.958 Y96.615 E.00073
; LINE_WIDTH: 0.422359
G1 X99.112 Y96.867 E.00914
G1 X101.509 Y98.338 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X101.903 Y99.903 I-3.698 J1.764 E.05389
G1 X142.655 Y140.655 E1.91175
G1 X139.864 Y145.54 E.18663
G1 X133.865 Y139.487 E.2827
G1 X155.93 Y117.422 E1.03513
G1 X156.611 Y116.231 E.04552
G1 X140.163 Y99.783 E.77159
G1 X140.163 Y102.485 E.08964
G1 X145.749 Y96.899 E.26206
G1 X144.955 Y96.899 E.02635
G1 X159.402 Y111.346 E.67773
G1 X160.209 Y109.932 E.05401
G1 X164.882 Y102.292 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.58573
G1 F11606.282
G1 X165.27 Y101.629 E.03396
G1 X165.133 Y101.268 E.01707
G1 X165.675 Y97.716 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.550935
G1 F12401.214
G3 X165.934 Y98.164 I-1.205 J.995 E.02154
G1 X165.905 Y99.936 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X166.27 Y99.296 E.02263
G1 X166.419 Y98.854 E.01434
G1 X166.449 Y98.546 E.00951
G1 X166.37 Y98.044 E.01562
G1 X166.201 Y97.68 E.01233
G1 X165.949 Y97.371 E.01224
G1 X165.63 Y97.133 E.01224
G1 X165.22 Y96.975 E.01351
G2 X164.356 Y96.913 I-.628 J2.701 E.0267
G1 X164.966 Y97.478 E.02552
G3 X165.754 Y98.907 I-4.019 J3.148 E.05038
G1 X165.894 Y99.593 E.02152
G1 X165.903 Y99.876 E.00868
G1 X165.458 Y100.724 F30000
G1 F15000
G1 X165.618 Y100.738 E.00494
G1 X165.751 Y100.966 E.0081
G1 X166.614 Y99.455 E.05346
G1 X166.785 Y98.979 E.01553
G1 X166.824 Y98.582 E.01227
G1 X166.758 Y97.992 E.01826
G1 X166.501 Y97.452 E.01836
G1 X166.184 Y97.076 E.01511
G1 X165.785 Y96.789 E.01511
G1 X165.336 Y96.612 E.01484
G1 X164.828 Y96.536 E.01578
G1 X163.636 Y96.536 E.03661
G1 X163.769 Y96.825 E.00978
G1 X163.704 Y96.941 E.00406
G1 X164.195 Y97.257 E.01795
G1 X164.703 Y97.747 E.02168
G3 X165.389 Y99.003 I-3.813 J2.902 E.04413
G1 X165.524 Y99.668 E.02086
G1 X165.528 Y100.374 E.02168
G1 X165.47 Y100.666 E.00914
G1 X163.117 Y96.869 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.430834
G1 F15000
G1 X162.96 Y96.61 E.00956
; LINE_WIDTH: 0.453391
G1 X162.95 Y96.594 E.00063
; LINE_WIDTH: 0.500183
G1 F13777.637
G1 X162.94 Y96.578 E.0007
G1 X162.789 Y96.56 E.00566
; LINE_WIDTH: 0.465909
G1 F14894.027
G1 X162.612 Y96.542 E.00613
; LINE_WIDTH: 0.418424
G1 F15000
G1 X162.259 Y96.52 E.0108
; LINE_WIDTH: 0.385176
G1 X161.556 Y96.53 E.01963
; LINE_WIDTH: 0.408895
G1 X161.378 Y96.543 E.00529
; LINE_WIDTH: 0.4363
G1 X161.201 Y96.561 E.00573
; LINE_WIDTH: 0.477623
G1 F14492.678
G1 X161.061 Y96.578 E.00499
G1 X161.04 Y96.611 E.00134
; LINE_WIDTH: 0.452923
G1 F15000
G1 X160.884 Y96.869 E.0101
G1 X158.484 Y98.333 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X158.098 Y99.902 I3.436 J1.678 E.054
G1 X117.344 Y140.656 E1.91186
G1 X120.135 Y145.541 E.18662
G1 X126.135 Y139.487 E.28272
G1 X104.064 Y117.416 E1.0354
G1 X103.388 Y116.232 E.04523
G1 X119.837 Y99.783 E.77167
G1 X119.837 Y102.485 E.08964
G1 X114.25 Y96.898 E.26212
G1 X115.046 Y96.898 E.02643
G1 X100.597 Y111.348 E.67787
G1 X99.789 Y109.934 E.05401
G1 X120.722 Y108.203 F30000
G1 F15476.087
G1 X119.837 Y108.203 E.02935
G1 X119.837 Y107.459 E.02466
G1 X106.179 Y121.117 E.64073
G1 X108.97 Y126.002 E.18662
G1 X135.27 Y99.703 E1.23375
G1 X132.406 Y99.703 E.09498
G1 X137.837 Y105.133 E.25477
G1 X137.837 Y104.811 E.01069
G1 X111.762 Y130.886 E1.22326
G1 X114.299 Y135.327 E.16965
G1 X126.093 Y147.12 E.55326
G1 X126.093 Y147.259 E.00461
G1 X122.927 Y150.425 E.14852
G1 X124.534 Y153.237 E.10744
G1 X125.75 Y154.454 E.05707
G1 X126.24 Y154.284 E.01719
G3 X126.099 Y153.184 I5.458 J-1.26 E.03685
G1 X125.499 Y155.403 F30000
G1 F15476.087
G1 X125.335 Y155.46 E.00578
G1 X125.42 Y155.608 E.00566
G1 X125.692 Y155.336 E.01277
G1 X126.398 Y155.102 E.02468
G1 X125.521 Y155.785 E.03689
G1 X126.613 Y156.876 F30000
G1 F15476.087
G1 X126.262 Y156.262 E.02345
G1 X126.977 Y155.681 E.03057
G1 X130.355 Y159.083 E.15905
G3 X129.623 Y159.081 I-.358 J-3.924 E.02433
G1 X133.024 Y155.68 E.15957
G1 X133.74 Y156.259 E.03054
G1 X133.389 Y156.873 E.02347
G1 X134.218 Y156.123 F30000
G1 F15476.087
G1 X132.948 Y155.094 E.05421
G1 X132.2 Y155.762 E.03327
G3 X127.651 Y155.63 I-2.198 J-2.72 E.16436
G1 X127.048 Y155.098 E.02669
G1 X125.737 Y156.165 E.05605
G1 X126.476 Y157.457 E.04938
G2 X128.7 Y159.295 I3.532 J-2.011 E.09782
G1 X128.7 Y159.295 E0
G2 X131.25 Y159.308 I1.295 J-3.862 E.08603
G1 X131.25 Y159.308 E0
G2 X132.484 Y158.66 I-1.968 J-5.243 E.04636
G2 X134.265 Y156.161 I-5.464 J-5.779 E.10245
G1 X133.761 Y155.229 F30000
G1 F15476.087
G1 X133.603 Y155.101 E.00675
G1 X134.308 Y155.335 E.02463
G1 X134.58 Y155.608 E.0128
G1 X134.469 Y155.802 E.00742
G1 X133.761 Y155.229 E.03023
G1 X133.902 Y153.184 F30000
G1 F15476.087
G3 X133.872 Y153.543 I-1.821 J.031 E.01199
G1 X133.76 Y154.283 E.02482
G1 X134.25 Y154.454 E.0172
G1 X135.466 Y153.238 E.05703
G1 X137.073 Y150.425 E.10747
G1 X133.907 Y147.259 E.14851
G1 X133.907 Y147.12 E.00461
G1 X145.698 Y135.33 E.55311
G1 X148.237 Y130.885 E.16981
G1 X122.163 Y104.811 E1.22321
G1 X122.163 Y105.133 E.01069
G1 X127.594 Y99.703 E.25477
G1 X124.73 Y99.703 E.09498
G1 X151.028 Y126.001 E1.23369
G1 X153.819 Y121.116 E.18663
G1 X140.163 Y107.459 E.64066
G1 X140.163 Y108.203 E.02466
G1 X139.278 Y108.203 E.02935
G1 X139.349 Y105.017 F30000
G1 F15476.087
G1 X139.349 Y106.645 E.05401
G1 X138.651 Y105.947 E.03272
G1 X138.651 Y103.997 E.06471
G1 X139.349 Y103.299 E.03272
G1 X139.349 Y98.969 E.14365
G1 X136.871 Y96.491 E.11623
G1 X138.481 Y96.491 E.0534
G1 X136.084 Y98.888 E.11245
G1 X131.592 Y98.888 E.14899
G1 X129.195 Y96.491 E.11246
G1 X130.805 Y96.491 E.05341
G1 X128.408 Y98.888 E.11246
G1 X123.916 Y98.888 E.14899
G1 X121.519 Y96.491 E.11247
G1 X123.129 Y96.491 E.05343
G1 X120.651 Y98.969 E.11625
G1 X120.651 Y103.299 E.14365
G1 X121.349 Y103.997 E.03272
G1 X121.349 Y105.947 E.06471
G1 X120.651 Y106.645 E.03272
G1 X120.651 Y105.017 E.05401
G1 X120.244 Y96.491 F30000
G1 F15476.087
G1 X120.244 Y107.795 E.37499
G1 X121.756 Y107.795 E.05014
G1 X121.756 Y99.954 E.26012
G1 X122.414 Y99.295 E.03089
G1 X137.627 Y99.313 E.50464
G1 X138.244 Y99.954 E.02952
G1 X138.244 Y107.795 E.26012
G1 X139.756 Y107.795 E.05014
G1 X139.756 Y96.492 E.37497
G1 X160.186 Y96.492 E.67772
G1 X159.073 Y98.126 E.06556
G2 X162.435 Y103.513 I2.951 J1.901 E.26324
G1 X164.56 Y103.139 E.07155
G1 X134.871 Y155.1 E1.98516
G1 X133.307 Y154.557 E.0549
G1 X133.469 Y153.483 E.03604
G2 X133.5 Y153.056 I-2.128 J-.369 E.01422
G1 X133.5 Y140.023 E.43231
G2 X126.5 Y140.021 I-3.5 J.039 E.36216
G1 X126.5 Y153.056 E.4324
G2 X126.693 Y154.557 I7.644 J-.219 E.0503
G1 X125.129 Y155.101 E.0549
G1 X95.437 Y103.138 E1.98526
G1 X97.302 Y103.467 E.06284
G2 X100.692 Y97.803 I.695 J-3.431 E.28595
G1 X99.749 Y96.49 E.05363
G1 X120.184 Y96.491 E.67789
G1 X114.553 Y135.771 F30000
G1 F15476.087
G1 X153.425 Y96.899 E1.82356
G1 X152.631 Y96.899 E.02633
G1 X162.193 Y106.461 E.44856
G1 X163.776 Y103.69 E.10584
G3 X161.738 Y103.938 I-1.829 J-6.549 E.06835
G1 X129.505 Y136.171 E1.51211
G3 X130.491 Y136.167 I.507 J3.515 E.03281
G1 X98.256 Y103.932 E1.51219
G3 X97.231 Y103.868 I-.311 J-3.24 E.03421
G1 X96.221 Y103.69 E.03405
G1 X97.805 Y106.463 E.10595
G1 X107.371 Y96.898 E.44873
G1 X106.573 Y96.898 E.02644
G1 X145.446 Y135.77 E1.8236
; WIPE_START
G1 F24000
G1 X144.032 Y134.356 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.167 J-1.205 P1  F30000
G1 X92.963 Y141.428 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X93.132 Y141.409 E.00523
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.369 Y146.054 E.01969
G1 X94.916 Y146.507 E.01969
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.348 Y146.507 E.01969
G1 X90.895 Y146.054 E.01969
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.903 Y141.435 E.01261
M204 S10000
G1 X93.284 Y140.996 F30000
M204 S5000
G1 F12000
G1 X93.29 Y140.997 E.00018
G1 X93.773 Y141.045 E.01493
G1 X94.39 Y141.232 E.01981
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
G1 X93.224 Y140.99 E.00286
M204 S10000
; WIPE_START
G1 F24000
G1 X93.29 Y140.997 E-.02497
G1 X93.773 Y141.045 E-.18468
G1 X94.39 Y141.232 E-.24501
G1 X94.959 Y141.536 E-.245
G1 X95.082 Y141.636 E-.06034
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.138 J.432 P1  F30000
G1 X108.607 Y177.285 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X108.776 Y177.266 E.00523
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
G1 X111.354 Y181.369 E.01969
G1 X111.013 Y181.912 E.01969
G1 X110.56 Y182.365 E.01969
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X106.992 Y182.365 E.01969
G1 X106.539 Y181.912 E.01969
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.548 Y177.292 E.01261
M204 S10000
G1 X108.929 Y176.854 F30000
M204 S5000
G1 F12000
G1 X108.934 Y176.854 E.00018
G1 X109.418 Y176.902 E.01493
G1 X110.035 Y177.089 E.01981
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X108.869 Y176.848 E.00286
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.934 Y176.854 E-.02497
G1 X109.418 Y176.902 E-.18468
G1 X110.035 Y177.089 E-.24501
G1 X110.604 Y177.393 E-.245
G1 X110.726 Y177.494 E-.06034
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/118
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
G3 Z2.2 I.237 J1.194 P1  F30000
G1 X166.581 Y166.412 Z2.2
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X166.769 Y166.391 E.0058
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.006 Y171.036 E.01969
G1 X168.553 Y171.489 E.01969
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X164.985 Y171.489 E.01969
G1 X164.532 Y171.036 E.01969
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.522 Y166.418 E.01205
M204 S10000
G1 X166.942 Y165.98 F30000
M204 S5000
G1 F12000
G1 X166.948 Y165.981 E.00018
G1 X167.41 Y166.026 E.01428
G1 X168.027 Y166.213 E.01981
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X166.882 Y165.974 E.00351
M204 S10000
; WIPE_START
G1 F24000
G1 X166.948 Y165.981 E-.025
G1 X167.41 Y166.026 E-.17665
G1 X168.027 Y166.213 E-.24501
G1 X168.596 Y166.517 E-.245
G1 X168.735 Y166.631 E-.06833
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.316 J-1.175 P1  F30000
G1 X128.546 Y155.836 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.292 Y155.685 E.00982
G3 X126.848 Y153.047 I1.708 J-2.649 E.10398
G1 X126.848 Y140.032 E.43173
G3 X129.921 Y136.888 I3.154 J.01 E.16136
G3 X133.152 Y140.032 I.07 J3.16 E.16647
G1 X133.152 Y153.053 E.43192
G3 X128.601 Y155.86 I-3.152 J-.017 E.21177
G1 X128.674 Y155.457 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.504 Y155.356 E.00608
G3 X127.24 Y153.042 I1.496 J-2.319 E.08445
G1 X127.24 Y140.037 E.39961
G3 X129.931 Y137.28 I2.762 J.005 E.131
G3 X132.76 Y140.037 I.061 J2.767 E.13514
G1 X132.76 Y153.044 E.39968
G3 X128.742 Y155.493 I-2.76 J-.008 E.1731
G1 X128.727 Y155.485 E.00053
M204 S10000
; WIPE_START
G1 F24000
G1 X128.504 Y155.356 E-.09791
G1 X128.279 Y155.198 E-.10451
G1 X128.073 Y155.016 E-.10456
G1 X127.886 Y154.814 E-.10456
G1 X127.72 Y154.594 E-.10455
G1 X127.576 Y154.36 E-.10457
G1 X127.457 Y154.112 E-.10456
G1 X127.425 Y154.026 E-.03479
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.089 J-.543 P1  F30000
G1 X99.021 Y97.058 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.296 Y97.166 E.00982
G3 X97.921 Y96.888 I-1.296 J2.873 E.60998
G1 X98.079 Y96.888 E.00521
G3 X98.964 Y97.039 I-.079 J3.151 E.0299
G1 X98.879 Y97.423 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X97.931 Y97.28 I-.879 J2.616 E.50318
G1 X98.069 Y97.28 E.00423
G3 X98.822 Y97.405 I-.069 J2.759 E.02353
M204 S10000
; WIPE_START
G1 F24000
G1 X99.135 Y97.524 E-.12732
G1 X99.38 Y97.649 E-.10455
G1 X99.611 Y97.799 E-.10456
G1 X99.826 Y97.97 E-.10456
G1 X100.023 Y98.162 E-.10456
G1 X100.2 Y98.373 E-.10456
G1 X100.355 Y98.6 E-.10455
G1 X100.362 Y98.613 E-.00533
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.036 J1.216 P1  F30000
G1 X158.862 Y100.335 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X158.848 Y100.04 E.00982
G3 X161.921 Y96.888 I3.152 J0 E.16164
G1 X162.079 Y96.888 E.00521
G3 X158.868 Y100.395 I-.079 J3.151 E.47824
G1 X159.254 Y100.314 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X161.931 Y97.28 I2.746 J-.275 E.13955
G1 X162.069 Y97.28 E.00423
G3 X159.261 Y100.374 I-.069 J2.759 E.38716
M204 S10000
; WIPE_START
G1 F24000
G1 X159.24 Y100.04 E-.12732
G1 X159.254 Y99.765 E-.10456
G1 X159.295 Y99.493 E-.10455
G1 X159.406 Y99.096 E-.15676
G1 X159.513 Y98.842 E-.10456
G1 X159.645 Y98.6 E-.10457
G1 X159.73 Y98.475 E-.05768
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.026 J-1.217 P1  F30000
G1 X93.3 Y97.043 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X95.177 Y96.142 I1.875 J1.5 E.07144
G1 X164.906 Y96.144 E2.31305
G3 X166.909 Y99.736 I-.076 J2.397 E.16391
G1 X133.822 Y157.637 E2.21217
G3 X126.178 Y157.637 I-3.822 J-2.186 E.30708
G1 X93.091 Y99.736 E2.21217
G3 X93.263 Y97.09 I2.084 J-1.193 E.09317
G1 X92.983 Y96.808 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X92.994 Y96.798 E.00045
G3 X95.172 Y95.75 I2.181 J1.745 E.07681
G1 X164.919 Y95.752 E2.14311
M73 P39 R16
G3 X167.252 Y99.926 I-.089 J2.789 E.17649
G1 X134.16 Y157.836 E2.04944
G3 X125.84 Y157.836 I-4.16 J-2.386 E.30948
G1 X92.748 Y99.926 E2.04944
G3 X92.759 Y97.141 I2.427 J-1.383 E.08959
G1 X92.95 Y96.858 E.01049
M204 S10000
; WIPE_START
G1 F24000
G1 X92.994 Y96.798 E-.02819
G1 X93.176 Y96.588 E-.10542
G1 X93.488 Y96.313 E-.15812
G1 X93.838 Y96.088 E-.15812
G1 X94.217 Y95.917 E-.1581
G1 X94.483 Y95.836 E-.10546
G1 X94.603 Y95.814 E-.04658
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.185 J-.277 P1  F30000
G1 X94.043 Y98.211 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5563
G1 F12271.612
G1 X94.286 Y97.776 E.02083
G1 X94.082 Y99.889 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G3 X95.642 Y96.911 I3.973 J.183 E.10666
G1 X94.969 Y96.942 E.02071
G1 X94.733 Y96.98 E.00736
G1 X94.36 Y97.141 E.01246
G1 X93.967 Y97.459 E.01555
G1 X93.742 Y97.779 E.01201
G1 X93.595 Y98.197 E.0136
G1 X93.555 Y98.596 E.01233
G1 X93.622 Y99.012 E.01294
G2 X94.051 Y99.838 I3.506 J-1.296 E.02869
G1 X94.537 Y100.722 F30000
G1 F15000
G1 X94.472 Y100.376 E.01082
G3 X94.681 Y98.808 I3.812 J-.29 E.04895
G3 X95.588 Y97.455 I3.781 J1.554 E.0504
G1 X96.107 Y97.051 E.02022
G1 X96.284 Y96.941 E.0064
G1 X96.23 Y96.819 E.00409
G3 X96.364 Y96.534 I.618 J.116 E.00978
G1 X95.194 Y96.534 E.03597
G1 X94.674 Y96.598 E.0161
G1 X94.133 Y96.84 E.0182
G1 X93.734 Y97.142 E.01535
G1 X93.395 Y97.632 E.01833
G1 X93.228 Y98.098 E.01521
G1 X93.181 Y98.646 E.0169
G1 X93.274 Y99.157 E.01595
G1 X93.491 Y99.644 E.0164
G1 X94.244 Y100.963 E.04667
G1 X94.378 Y100.735 E.00811
G1 X94.477 Y100.727 E.00307
G1 X94.867 Y101.268 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.59658
G1 F11378.833
G1 X94.73 Y101.629 E.01741
G1 X95.118 Y102.292 E.03464
; WIPE_START
G1 F24000
G1 X94.73 Y101.629 E-.50576
G1 X94.867 Y101.268 E-.25424
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.106 J.508 P1  F30000
G1 X96.888 Y96.867 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.443675
G1 F15000
G1 X97.042 Y96.615 E.00965
; LINE_WIDTH: 0.480568
G1 F14395.154
G1 X97.066 Y96.577 E.00161
G1 X97.2 Y96.56 E.00484
; LINE_WIDTH: 0.438247
G1 F15000
G1 X97.378 Y96.542 E.00576
; LINE_WIDTH: 0.410833
G1 X97.555 Y96.529 E.00532
; LINE_WIDTH: 0.387101
G1 X98.259 Y96.519 E.01975
; LINE_WIDTH: 0.420347
G1 X98.612 Y96.541 E.01086
; LINE_WIDTH: 0.467839
G1 F14826.384
G1 X98.789 Y96.559 E.00616
; LINE_WIDTH: 0.499649
G1 F13793.761
G1 X98.935 Y96.577 E.00546
G1 X98.947 Y96.596 E.00083
; LINE_WIDTH: 0.444121
G1 F15000
G1 X98.958 Y96.615 E.00073
; LINE_WIDTH: 0.422376
G1 X99.112 Y96.868 E.00914
G1 X101.508 Y98.337 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X101.903 Y99.903 I-4.081 J1.86 E.05386
G1 X142.655 Y140.655 E1.91179
G1 X139.864 Y145.54 E.18663
G1 X133.865 Y139.487 E.2827
G1 X155.93 Y117.422 E1.03513
G1 X156.611 Y116.231 E.04552
G1 X140.163 Y99.783 E.7716
G1 X140.163 Y102.485 E.08964
G1 X145.749 Y96.899 E.26206
G1 X144.955 Y96.899 E.02635
G1 X159.402 Y111.346 E.67773
G1 X160.209 Y109.932 E.05401
G1 X164.882 Y102.292 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.585718
G1 F11606.531
G1 X165.27 Y101.629 E.03396
G1 X165.133 Y101.268 E.01707
G1 X165.958 Y98.22 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.561532
G1 F12147.829
G1 X165.783 Y97.865 E.01672
G1 X165.71 Y97.764 E.00526
G1 X165.905 Y99.936 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X166.27 Y99.296 E.02263
G1 X166.419 Y98.854 E.01435
G1 X166.446 Y98.444 E.01263
G1 X166.371 Y98.045 E.01247
G1 X166.201 Y97.68 E.01235
G1 X165.949 Y97.371 E.01226
G1 X165.63 Y97.133 E.01224
G1 X165.221 Y96.975 E.01349
G2 X164.357 Y96.913 I-.617 J2.568 E.02672
G1 X164.966 Y97.478 E.02551
G3 X165.754 Y98.907 I-4.023 J3.15 E.05037
G1 X165.894 Y99.593 E.02153
G1 X165.903 Y99.876 E.00868
G1 X165.458 Y100.724 F30000
G1 F15000
G1 X165.618 Y100.738 E.00494
G1 X165.751 Y100.966 E.0081
G1 X166.614 Y99.455 E.05346
G1 X166.786 Y98.979 E.01554
G1 X166.818 Y98.387 E.01824
G1 X166.718 Y97.897 E.01534
G1 X166.501 Y97.452 E.0152
G1 X166.184 Y97.076 E.01513
G1 X165.785 Y96.789 E.01511
G1 X165.336 Y96.612 E.01484
G1 X164.882 Y96.536 E.01413
G1 X163.637 Y96.536 E.03824
G1 X163.77 Y96.825 E.00978
G1 X163.705 Y96.941 E.00408
G1 X164.195 Y97.257 E.01792
G1 X164.703 Y97.747 E.02168
G3 X165.389 Y99.003 I-3.816 J2.904 E.04413
G1 X165.524 Y99.668 E.02087
G1 X165.528 Y100.374 E.02168
G1 X165.47 Y100.666 E.00914
G1 X163.117 Y96.869 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431858
G1 F15000
G1 X162.96 Y96.61 E.00962
; LINE_WIDTH: 0.454514
G1 X162.95 Y96.594 E.00062
; LINE_WIDTH: 0.500233
G1 F13776.142
G1 X162.94 Y96.579 E.00068
G1 X162.789 Y96.56 E.00568
; LINE_WIDTH: 0.465669
G1 F14902.465
G1 X162.612 Y96.542 E.00613
; LINE_WIDTH: 0.418188
G1 F15000
G1 X162.259 Y96.52 E.0108
; LINE_WIDTH: 0.384939
G1 X161.556 Y96.53 E.01962
; LINE_WIDTH: 0.408658
G1 X161.379 Y96.543 E.00529
; LINE_WIDTH: 0.436062
G1 X161.201 Y96.561 E.00573
; LINE_WIDTH: 0.477261
G1 F14504.748
G1 X161.06 Y96.579 E.00501
G1 X161.04 Y96.61 E.00131
; LINE_WIDTH: 0.454045
G1 F15000
G1 X160.883 Y96.869 E.01015
G1 X158.484 Y98.333 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X158.098 Y99.902 I3.436 J1.678 E.054
G1 X117.344 Y140.656 E1.91186
G1 X120.135 Y145.541 E.18662
G1 X126.135 Y139.487 E.28272
G1 X104.064 Y117.416 E1.0354
G1 X103.388 Y116.232 E.04523
G1 X119.837 Y99.783 E.77167
G1 X119.837 Y102.485 E.08964
G1 X114.25 Y96.898 E.26212
G1 X115.046 Y96.898 E.02643
G1 X100.597 Y111.348 E.67787
G1 X99.789 Y109.934 E.05401
G1 X120.722 Y108.203 F30000
G1 F15476.087
G1 X119.837 Y108.203 E.02935
G1 X119.837 Y107.459 E.02466
G1 X106.179 Y121.117 E.64073
G1 X108.97 Y126.002 E.18662
G1 X135.27 Y99.703 E1.23375
G1 X132.406 Y99.703 E.09498
G1 X137.837 Y105.133 E.25477
G1 X137.837 Y104.811 E.01069
G1 X111.762 Y130.886 E1.22326
G1 X114.299 Y135.327 E.16965
G1 X126.093 Y147.12 E.55326
G1 X126.093 Y147.259 E.00461
G1 X122.927 Y150.425 E.14852
G1 X124.534 Y153.237 E.10744
G1 X125.75 Y154.454 E.05707
G1 X126.24 Y154.284 E.01719
G3 X126.099 Y153.184 I5.458 J-1.26 E.03685
G1 X125.499 Y155.403 F30000
G1 F15476.087
G1 X125.335 Y155.46 E.00578
G1 X125.42 Y155.608 E.00566
G1 X125.692 Y155.336 E.01277
G1 X126.398 Y155.102 E.02468
G1 X125.521 Y155.785 E.03689
G1 X126.613 Y156.876 F30000
G1 F15476.087
G1 X126.262 Y156.262 E.02345
G1 X126.977 Y155.681 E.03057
G1 X130.376 Y159.08 E.15948
G1 X130.315 Y159.088 E.00204
G3 X129.623 Y159.081 I-.306 J-4.244 E.023
G1 X133.024 Y155.68 E.15957
G1 X133.74 Y156.259 E.03054
G1 X133.389 Y156.873 E.02347
G1 X134.218 Y156.123 F30000
G1 F15476.087
G1 X132.948 Y155.094 E.05421
G1 X132.369 Y155.611 E.02576
G3 X127.753 Y155.72 I-2.371 J-2.628 E.16684
G1 X127.048 Y155.098 E.03121
G1 X125.737 Y156.165 E.05605
G1 X126.476 Y157.457 E.04938
G2 X132.484 Y158.66 I3.526 J-2.006 E.23035
G2 X134.265 Y156.161 I-5.465 J-5.779 E.10245
G1 X133.761 Y155.229 F30000
G1 F15476.087
G1 X133.603 Y155.101 E.00675
G1 X134.308 Y155.335 E.02463
G1 X134.58 Y155.608 E.0128
G1 X134.469 Y155.802 E.00742
G1 X133.761 Y155.229 E.03023
G1 X133.902 Y153.184 F30000
G1 F15476.087
G3 X133.837 Y153.776 I-3.182 J-.053 E.01978
G1 X133.76 Y154.283 E.01703
G1 X134.25 Y154.454 E.0172
G1 X135.466 Y153.238 E.05703
G1 X137.073 Y150.425 E.10747
G1 X133.907 Y147.259 E.14851
G1 X133.907 Y147.12 E.00461
G1 X145.698 Y135.33 E.55311
G1 X148.237 Y130.885 E.16981
G1 X122.163 Y104.811 E1.22321
G1 X122.163 Y105.133 E.01069
G1 X127.594 Y99.703 E.25477
G1 X124.73 Y99.703 E.09498
G1 X151.028 Y126.001 E1.23369
G1 X153.819 Y121.116 E.18663
G1 X140.163 Y107.459 E.64066
G1 X140.163 Y108.203 E.02466
G1 X139.278 Y108.203 E.02935
G1 X139.349 Y105.017 F30000
G1 F15476.087
G1 X139.349 Y106.645 E.05401
G1 X138.651 Y105.947 E.03272
G1 X138.651 Y103.997 E.06471
G1 X139.349 Y103.299 E.03272
G1 X139.349 Y98.969 E.14365
G1 X136.871 Y96.491 E.11622
G1 X138.481 Y96.491 E.05339
G1 X136.084 Y98.888 E.11244
G1 X131.592 Y98.888 E.14899
G1 X129.195 Y96.491 E.11246
G1 X130.805 Y96.491 E.0534
G1 X128.408 Y98.888 E.11246
G1 X123.916 Y98.888 E.14899
G1 X121.519 Y96.491 E.11247
G1 X123.129 Y96.491 E.05342
G1 X120.651 Y98.969 E.11624
G1 X120.651 Y103.299 E.14365
G1 X121.349 Y103.997 E.03272
G1 X121.349 Y105.947 E.06471
G1 X120.651 Y106.645 E.03272
G1 X120.651 Y105.017 E.05401
G1 X120.244 Y96.491 F30000
G1 F15476.087
G1 X120.244 Y107.795 E.37499
G1 X121.756 Y107.795 E.05014
G1 X121.756 Y99.954 E.26012
G1 X122.414 Y99.295 E.03089
G1 X137.627 Y99.313 E.50464
G1 X138.244 Y99.954 E.02952
G1 X138.244 Y107.795 E.26012
G1 X139.756 Y107.795 E.05014
G1 X139.756 Y96.492 E.37497
G1 X160.186 Y96.492 E.67772
G1 X159.155 Y98.005 E.06073
G2 X162.435 Y103.513 I2.844 J2.037 E.26892
G1 X164.56 Y103.139 E.07155
G1 X134.871 Y155.1 E1.98516
G1 X133.307 Y154.557 E.0549
G1 X133.434 Y153.715 E.02825
G2 X133.5 Y153.061 I-3.382 J-.672 E.02185
G1 X133.5 Y140.023 E.43247
G2 X126.5 Y140.023 I-3.5 J.035 E.36248
G1 X126.5 Y153.056 E.43231
G2 X126.693 Y154.557 I7.644 J-.219 E.0503
G1 X125.129 Y155.101 E.0549
G1 X95.437 Y103.138 E1.98526
G3 X97.565 Y103.514 I-6.83 J44.895 E.07169
G1 X98.03 Y103.537 E.01545
G2 X100.691 Y97.801 I-.03 J-3.499 E.26183
G1 X99.749 Y96.49 E.05357
G1 X120.184 Y96.491 E.67789
G1 X114.553 Y135.771 F30000
G1 F15476.087
G1 X153.425 Y96.899 E1.82356
G1 X152.631 Y96.899 E.02633
G1 X162.193 Y106.461 E.44856
G1 X163.776 Y103.69 E.10584
G3 X162.06 Y103.946 I-2.094 J-8.17 E.05765
G1 X161.738 Y103.938 E.01067
G1 X129.505 Y136.171 E1.51211
G3 X130.491 Y136.167 I.508 J3.698 E.0328
G1 X98.256 Y103.932 E1.51219
G3 X96.221 Y103.69 I-.193 J-7.043 E.06825
G1 X97.805 Y106.463 E.10595
G1 X107.371 Y96.898 E.44873
G1 X106.573 Y96.898 E.02644
G1 X145.446 Y135.77 E1.8236
; WIPE_START
G1 F24000
G1 X144.032 Y134.356 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.167 J-1.205 P1  F30000
G1 X92.944 Y141.43 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X93.132 Y141.409 E.0058
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.369 Y146.054 E.01969
G1 X94.916 Y146.507 E.01969
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.348 Y146.507 E.01969
G1 X90.895 Y146.054 E.01969
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.885 Y141.437 E.01205
M204 S10000
G1 X93.305 Y140.998 F30000
M204 S5000
G1 F12000
G1 X93.311 Y140.999 E.00018
G1 X93.773 Y141.045 E.01428
G1 X94.39 Y141.232 E.01981
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
G1 X93.245 Y140.993 E.00351
M204 S10000
; WIPE_START
G1 F24000
G1 X93.311 Y140.999 E-.025
G1 X93.773 Y141.045 E-.17665
G1 X94.39 Y141.232 E-.24501
G1 X94.959 Y141.536 E-.245
G1 X95.098 Y141.65 E-.06833
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.138 J.431 P1  F30000
G1 X108.589 Y177.288 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X108.776 Y177.266 E.0058
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
G1 X111.354 Y181.369 E.01969
G1 X111.013 Y181.912 E.01969
G1 X110.56 Y182.365 E.01969
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X106.992 Y182.365 E.01969
G1 X106.539 Y181.912 E.01969
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.529 Y177.294 E.01205
M204 S10000
G1 X108.95 Y176.856 F30000
M204 S5000
G1 F12000
G1 X108.955 Y176.856 E.00018
G1 X109.418 Y176.902 E.01428
G1 X110.035 Y177.089 E.01981
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X108.89 Y176.85 E.00351
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.955 Y176.856 E-.025
G1 X109.418 Y176.902 E-.17665
G1 X110.035 Y177.089 E-.24501
G1 X110.604 Y177.393 E-.245
G1 X110.743 Y177.507 E-.06833
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/118
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
G3 Z2.4 I.237 J1.194 P1  F30000
G1 X166.563 Y166.414 Z2.4
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X166.769 Y166.391 E.00638
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.006 Y171.036 E.01969
G1 X168.854 Y171.188 E.00662
G1 X168.553 Y171.489 E.01307
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X164.985 Y171.489 E.01969
G1 X164.684 Y171.188 E.01307
G1 X164.532 Y171.036 E.00662
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.503 Y166.421 E.01147
M204 S10000
G1 X166.963 Y165.982 F30000
M204 S5000
G1 F12000
G1 X166.969 Y165.983 E.00017
G1 X167.41 Y166.026 E.01364
G1 X168.027 Y166.213 E.01981
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X166.904 Y165.976 E.00416
M204 S10000
; WIPE_START
G1 F24000
G1 X166.969 Y165.983 E-.02488
G1 X167.41 Y166.026 E-.16863
G1 X168.027 Y166.213 E-.24501
G1 X168.596 Y166.517 E-.24501
G1 X168.752 Y166.645 E-.07647
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.316 J-1.175 P1  F30000
G1 X128.546 Y155.836 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.29 Y155.687 E.00982
G3 X126.848 Y153.047 I1.71 J-2.648 E.10402
G1 X126.848 Y140.032 E.43173
G3 X129.921 Y136.888 I3.154 J.01 E.16136
G3 X133.152 Y140.032 I.07 J3.16 E.16647
G1 X133.152 Y153.047 E.43173
G3 X128.6 Y155.863 I-3.152 J-.008 E.2121
G1 X128.699 Y155.472 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.503 Y155.358 E.00696
G3 X127.24 Y153.042 I1.497 J-2.319 E.08449
G1 X127.24 Y140.037 E.39961
G3 X129.931 Y137.28 I2.762 J.005 E.131
G3 X132.76 Y140.037 I.061 J2.767 E.13514
G1 X132.76 Y153.042 E.39961
G3 X128.751 Y155.5 I-2.76 J-.003 E.17292
M204 S10000
; WIPE_START
G1 F24000
G1 X128.503 Y155.358 E-.1089
G1 X128.279 Y155.198 E-.10455
G1 X128.073 Y155.015 E-.10456
G1 X127.886 Y154.814 E-.10456
G1 X127.72 Y154.594 E-.10455
G1 X127.576 Y154.36 E-.10456
G1 X127.457 Y154.112 E-.10456
G1 X127.435 Y154.053 E-.02376
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.089 J-.543 P1  F30000
G1 X99.021 Y97.058 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.296 Y97.166 E.00982
G3 X97.921 Y96.888 I-1.296 J2.873 E.60998
G1 X98.079 Y96.888 E.00521
G3 X98.964 Y97.039 I-.079 J3.151 E.0299
G1 X98.879 Y97.423 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.879 Y97.423 E0
G3 X97.931 Y97.28 I-.879 J2.616 E.50318
G1 X98.069 Y97.28 E.00423
G3 X98.614 Y97.349 I-.069 J2.759 E.01692
G1 X98.821 Y97.407 E.00661
M204 S10000
; WIPE_START
G1 F24000
G1 X98.879 Y97.423 E-.02283
G1 X99.135 Y97.524 E-.10456
G1 X99.497 Y97.721 E-.15676
G1 X99.721 Y97.882 E-.10456
G1 X99.927 Y98.064 E-.10457
G1 X100.114 Y98.266 E-.10455
G1 X100.28 Y98.485 E-.10456
G1 X100.36 Y98.614 E-.05761
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.037 J1.216 P1  F30000
G1 X158.866 Y100.372 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X158.864 Y100.353 E.00061
G3 X161.921 Y96.888 I3.136 J-.314 E.17206
G1 X162.079 Y96.888 E.00521
G3 X158.911 Y100.664 I-.079 J3.151 E.4692
G1 X158.875 Y100.431 E.00783
G1 X159.254 Y100.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X159.254 Y100.314 E.00001
G3 X161.931 Y97.28 I2.746 J-.275 E.13955
G1 X162.069 Y97.28 E.00423
G3 X159.295 Y100.586 I-.069 J2.759 E.38055
M73 P40 R16
G1 X159.263 Y100.374 E.00661
M204 S10000
; WIPE_START
G1 F24000
G1 X159.254 Y100.314 E-.02283
G1 X159.241 Y100.079 E-.08961
G1 X159.271 Y99.628 E-.17164
G1 X159.325 Y99.359 E-.10456
G1 X159.406 Y99.096 E-.10456
G1 X159.513 Y98.842 E-.10456
G1 X159.645 Y98.6 E-.10456
G1 X159.73 Y98.475 E-.05768
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.026 J-1.217 P1  F30000
G1 X93.3 Y97.043 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X95.177 Y96.142 I1.875 J1.5 E.07144
G1 X164.908 Y96.144 E2.31312
G3 X166.909 Y99.736 I-.079 J2.397 E.16385
G1 X133.822 Y157.637 E2.21217
G3 X126.178 Y157.637 I-3.822 J-2.186 E.30708
G1 X93.091 Y99.736 E2.21217
G3 X93.263 Y97.09 I2.084 J-1.193 E.09317
G1 X92.982 Y96.809 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X92.994 Y96.798 E.0005
G3 X95.172 Y95.75 I2.181 J1.745 E.07681
G1 X164.926 Y95.752 E2.14333
G3 X167.252 Y99.926 I-.096 J2.789 E.17627
G1 X134.16 Y157.836 E2.04944
G3 X125.84 Y157.836 I-4.16 J-2.386 E.30948
G1 X92.748 Y99.926 E2.04944
G3 X92.759 Y97.141 I2.427 J-1.383 E.08959
G1 X92.949 Y96.859 E.01044
M204 S10000
; WIPE_START
G1 F24000
G1 X92.994 Y96.798 E-.0289
G1 X93.176 Y96.588 E-.10541
G1 X93.488 Y96.313 E-.15811
G1 X93.838 Y96.088 E-.15813
G1 X94.218 Y95.917 E-.15856
G1 X94.483 Y95.836 E-.10501
G1 X94.601 Y95.815 E-.04588
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.184 J-.282 P1  F30000
G1 X94.013 Y98.287 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.536124
G1 F12773.619
G1 X94.287 Y97.777 E.02327
G1 X94.082 Y99.889 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X94.145 Y99.346 E.0168
G1 X94.318 Y98.702 E.02047
G3 X95.331 Y97.178 I4.103 J1.63 E.05665
G1 X95.643 Y96.911 E.01262
G1 X94.969 Y96.942 E.02076
G1 X94.733 Y96.98 E.00735
G1 X94.36 Y97.141 E.01246
G1 X93.967 Y97.459 E.01555
G1 X93.747 Y97.777 E.01188
G1 X93.58 Y98.243 E.01519
G2 X93.62 Y99.01 I1.573 J.302 E.02383
G2 X94.051 Y99.838 I3.531 J-1.309 E.02876
G1 X94.537 Y100.722 F30000
G1 F15000
G1 X94.472 Y100.376 E.01082
G3 X94.672 Y98.831 I3.82 J-.29 E.0482
G3 X95.588 Y97.455 I3.754 J1.504 E.05116
G1 X96.107 Y97.051 E.02022
G1 X96.284 Y96.941 E.00639
G1 X96.231 Y96.819 E.00409
G3 X96.364 Y96.534 I.619 J.116 E.00978
G1 X95.194 Y96.534 E.03597
G1 X94.674 Y96.598 E.0161
G1 X94.133 Y96.84 E.0182
G1 X93.734 Y97.142 E.01535
G1 X93.438 Y97.532 E.01506
G1 X93.216 Y98.093 E.01853
G1 X93.18 Y98.679 E.01806
G1 X93.272 Y99.155 E.01489
G1 X93.491 Y99.644 E.01646
G1 X94.244 Y100.963 E.04667
G1 X94.378 Y100.735 E.00811
G1 X94.477 Y100.727 E.00307
G1 X94.867 Y101.268 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.596568
G1 F11379.073
G1 X94.73 Y101.629 E.01741
G1 X95.118 Y102.292 E.03464
; WIPE_START
G1 F24000
G1 X94.73 Y101.629 E-.50576
G1 X94.867 Y101.268 E-.25424
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.106 J.508 P1  F30000
G1 X96.888 Y96.867 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.443448
G1 F15000
G1 X97.042 Y96.615 E.00963
; LINE_WIDTH: 0.480658
G1 F14392.184
G1 X97.066 Y96.577 E.00162
G1 X97.2 Y96.56 E.00484
; LINE_WIDTH: 0.438327
G1 F15000
G1 X97.378 Y96.542 E.00576
; LINE_WIDTH: 0.410914
G1 X97.555 Y96.529 E.00533
; LINE_WIDTH: 0.387195
G1 X98.259 Y96.519 E.01975
; LINE_WIDTH: 0.420459
G1 X98.612 Y96.541 E.01086
; LINE_WIDTH: 0.46796
G1 F14822.134
G1 X98.789 Y96.559 E.00617
; LINE_WIDTH: 0.499588
G1 F13795.578
G1 X98.934 Y96.577 E.00544
G1 X98.946 Y96.596 E.00084
; LINE_WIDTH: 0.443451
G1 F15000
G1 X98.958 Y96.615 E.00074
; LINE_WIDTH: 0.421762
G1 X99.112 Y96.867 E.00911
G1 X101.508 Y98.337 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X101.902 Y99.902 I-3.64 J1.747 E.05388
G1 X142.655 Y140.655 E1.91183
G1 X139.864 Y145.54 E.18663
G1 X133.865 Y139.487 E.2827
G1 X155.93 Y117.422 E1.03513
G1 X156.611 Y116.231 E.04552
G1 X140.163 Y99.783 E.77159
G1 X140.163 Y102.485 E.08964
G1 X145.749 Y96.899 E.26206
G1 X144.955 Y96.899 E.02635
G1 X159.402 Y111.346 E.67773
G1 X158.594 Y112.76 E.05401
G1 X164.013 Y102.994 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.510796
G1 F13465.106
G1 X164.214 Y102.857 E.00926
G1 X164.882 Y102.292 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.585726
G1 F11606.369
G1 X165.27 Y101.629 E.03396
G1 X165.133 Y101.268 E.01707
G1 X165.675 Y97.715 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.550909
G1 F12401.862
G3 X165.934 Y98.163 I-1.2 J.993 E.02149
G1 X165.905 Y99.936 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X166.27 Y99.296 E.02263
G1 X166.419 Y98.853 E.01435
G1 X166.449 Y98.547 E.00947
G1 X166.37 Y98.043 E.01567
G1 X166.201 Y97.68 E.01228
G1 X165.949 Y97.371 E.01226
G1 X165.632 Y97.133 E.01219
G1 X165.221 Y96.974 E.01354
G2 X164.357 Y96.913 I-.624 J2.677 E.02673
G1 X164.966 Y97.478 E.02552
G3 X165.754 Y98.907 I-4.016 J3.147 E.05037
G1 X165.894 Y99.593 E.02153
G1 X165.903 Y99.876 E.00868
G1 X165.458 Y100.724 F30000
G1 F15000
G1 X165.618 Y100.738 E.00494
G1 X165.751 Y100.966 E.0081
G1 X166.614 Y99.455 E.05346
G1 X166.786 Y98.979 E.01554
G1 X166.824 Y98.583 E.01223
G1 X166.757 Y97.99 E.01832
G1 X166.502 Y97.452 E.0183
G1 X166.184 Y97.076 E.01513
G1 X165.787 Y96.79 E.01506
G1 X165.333 Y96.611 E.01497
G1 X164.838 Y96.536 E.01541
G2 X163.627 Y96.536 I-.524 J1093.962 E.0372
G1 X163.76 Y96.824 E.00975
G1 X163.698 Y96.936 E.00394
G1 X164.195 Y97.257 E.01818
G1 X164.703 Y97.747 E.02168
G3 X165.389 Y99.003 I-3.809 J2.9 E.04413
G1 X165.524 Y99.668 E.02087
G1 X165.528 Y100.374 E.02168
G1 X165.47 Y100.666 E.00914
G1 X163.112 Y96.867 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.421778
G1 F15000
G1 X162.958 Y96.615 E.00911
; LINE_WIDTH: 0.443462
G1 X162.946 Y96.596 E.00074
; LINE_WIDTH: 0.49959
G1 F13795.53
G1 X162.934 Y96.577 E.00084
G1 X162.789 Y96.559 E.00544
; LINE_WIDTH: 0.46796
G1 F14822.134
G1 X162.612 Y96.541 E.00617
; LINE_WIDTH: 0.420459
G1 F15000
G1 X162.259 Y96.519 E.01086
; LINE_WIDTH: 0.387195
G1 X161.555 Y96.529 E.01975
; LINE_WIDTH: 0.410916
G1 X161.378 Y96.542 E.00533
; LINE_WIDTH: 0.438327
G1 X161.2 Y96.56 E.00576
; LINE_WIDTH: 0.480658
G1 F14392.179
G1 X161.066 Y96.577 E.00484
G1 X161.042 Y96.615 E.00162
; LINE_WIDTH: 0.443446
G1 F15000
G1 X160.888 Y96.867 E.00963
G1 X158.487 Y98.328 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X158.129 Y99.518 I3.755 J1.777 E.04137
G1 X158.103 Y99.897 E.01261
G1 X117.344 Y140.656 E1.91207
G1 X120.135 Y145.541 E.18662
G1 X126.135 Y139.487 E.28272
G1 X104.064 Y117.416 E1.0354
G1 X103.388 Y116.232 E.04523
G1 X119.837 Y99.783 E.77167
G1 X119.837 Y102.485 E.08964
G1 X114.25 Y96.898 E.26212
G1 X115.046 Y96.898 E.02643
G1 X100.597 Y111.348 E.67787
G1 X99.789 Y109.934 E.05401
G1 X120.722 Y108.203 F30000
G1 F15476.087
G1 X119.837 Y108.203 E.02935
G1 X119.837 Y107.459 E.02466
G1 X106.179 Y121.117 E.64073
G1 X108.97 Y126.002 E.18662
G1 X135.27 Y99.703 E1.23375
G1 X132.406 Y99.703 E.09498
G1 X137.837 Y105.133 E.25477
G1 X137.837 Y104.811 E.01069
G1 X111.762 Y130.886 E1.22326
G1 X114.299 Y135.327 E.16965
G1 X126.093 Y147.12 E.55326
G1 X126.093 Y147.259 E.00461
G1 X122.927 Y150.425 E.14852
G1 X124.534 Y153.237 E.10744
G1 X125.75 Y154.454 E.05707
G1 X126.24 Y154.284 E.01719
G3 X126.099 Y153.184 I5.458 J-1.26 E.03685
G1 X125.499 Y155.403 F30000
G1 F15476.087
G1 X125.335 Y155.46 E.00578
G1 X125.42 Y155.608 E.00566
G1 X125.692 Y155.336 E.01277
G1 X126.398 Y155.102 E.02468
G1 X125.521 Y155.785 E.03689
G1 X126.613 Y156.876 F30000
G1 F15476.087
G1 X126.262 Y156.262 E.02345
G1 X126.977 Y155.681 E.03057
G1 X130.355 Y159.083 E.15905
G3 X129.623 Y159.081 I-.358 J-3.924 E.02433
G1 X133.024 Y155.68 E.15957
G1 X133.74 Y156.259 E.03054
G1 X133.389 Y156.873 E.02347
G1 X134.218 Y156.123 F30000
G1 F15476.087
G1 X132.948 Y155.094 E.05421
G1 X132.2 Y155.762 E.03327
G3 X127.746 Y155.714 I-2.198 J-2.731 E.16011
G1 X127.048 Y155.098 E.03088
G1 X125.737 Y156.165 E.05605
G1 X126.476 Y157.457 E.04938
G2 X132.484 Y158.66 I3.535 J-2.052 E.22975
G2 X134.265 Y156.161 I-5.465 J-5.779 E.10245
G1 X133.761 Y155.229 F30000
G1 F15476.087
G1 X134.469 Y155.802 E.03023
G1 X134.58 Y155.608 E.00742
G1 X134.308 Y155.335 E.0128
G1 X133.603 Y155.101 E.02463
G1 X133.761 Y155.229 E.00675
G1 X133.901 Y153.184 F30000
G1 F15476.087
G3 X133.835 Y153.786 I-3.061 J-.032 E.02012
G1 X133.76 Y154.283 E.01669
G1 X134.25 Y154.454 E.0172
G1 X135.466 Y153.238 E.05703
G1 X137.073 Y150.425 E.10747
G1 X133.907 Y147.259 E.14851
G1 X133.907 Y147.12 E.00461
G1 X145.698 Y135.33 E.55311
G1 X148.237 Y130.885 E.16981
G1 X122.163 Y104.811 E1.22321
G1 X122.163 Y105.133 E.01069
G1 X127.594 Y99.703 E.25477
G1 X124.73 Y99.703 E.09498
G1 X151.028 Y126.001 E1.23369
G1 X153.819 Y121.116 E.18663
G1 X140.163 Y107.459 E.64066
G1 X140.163 Y108.203 E.02466
G1 X139.278 Y108.203 E.02935
G1 X139.349 Y105.017 F30000
G1 F15476.087
G1 X139.349 Y106.645 E.05401
G1 X138.651 Y105.947 E.03272
G1 X138.651 Y103.997 E.06471
G1 X139.349 Y103.299 E.03272
G1 X139.349 Y98.969 E.14365
G1 X136.871 Y96.491 E.11623
G1 X138.481 Y96.491 E.0534
G1 X136.084 Y98.888 E.11245
G1 X131.592 Y98.888 E.14899
G1 X129.195 Y96.491 E.11246
G1 X130.805 Y96.491 E.05341
G1 X128.408 Y98.888 E.11246
G1 X123.916 Y98.888 E.14899
G1 X121.519 Y96.491 E.11247
G1 X123.129 Y96.491 E.05343
G1 X120.651 Y98.969 E.11625
G1 X120.651 Y103.299 E.14365
G1 X121.349 Y103.997 E.03272
G1 X121.349 Y105.947 E.06471
G1 X120.651 Y106.645 E.03272
G1 X120.651 Y105.017 E.05401
G1 X120.244 Y96.491 F30000
G1 F15476.087
G1 X120.244 Y107.795 E.37499
G1 X121.756 Y107.795 E.05014
G1 X121.756 Y99.954 E.26012
G1 X122.414 Y99.295 E.03089
G1 X137.627 Y99.313 E.50464
G1 X138.244 Y99.954 E.02952
G1 X138.244 Y107.795 E.26012
G1 X139.756 Y107.795 E.05014
G1 X139.756 Y96.492 E.37497
G1 X160.186 Y96.492 E.67772
G1 X159.07 Y98.129 E.06572
G2 X162.769 Y103.455 I2.933 J1.91 E.27497
G1 X163.688 Y103.293 E.03094
G1 X163.892 Y103.593 E.01205
G1 X164.539 Y103.175 E.02554
G1 X134.871 Y155.1 E1.98378
G1 X133.307 Y154.557 E.0549
G1 X133.433 Y153.725 E.02791
G2 X133.5 Y153.056 I-3.332 J-.674 E.02235
G1 X133.5 Y140.023 E.43231
G2 X126.5 Y140.023 I-3.5 J.043 E.36196
G1 X126.5 Y153.056 E.43231
G2 X126.693 Y154.557 I7.644 J-.219 E.0503
G1 X125.129 Y155.101 E.0549
G1 X95.437 Y103.138 E1.98526
G3 X97.565 Y103.514 I-6.837 J44.93 E.07169
G1 X98.012 Y103.536 E.01485
G2 X100.692 Y97.803 I-.024 J-3.505 E.26195
G1 X99.749 Y96.49 E.05363
G1 X120.184 Y96.491 E.67789
G1 X114.553 Y135.771 F30000
G1 F15476.087
G1 X153.425 Y96.899 E1.82356
G1 X152.631 Y96.899 E.02633
G1 X162.193 Y106.461 E.44856
G1 X163.635 Y103.937 E.09641
G1 X163.499 Y103.739 E.00796
G3 X161.738 Y103.938 I-1.681 J-6.992 E.05895
G1 X129.505 Y136.171 E1.51211
G3 X130.491 Y136.167 I.508 J3.697 E.0328
G1 X98.256 Y103.932 E1.51219
G3 X96.221 Y103.69 I-.245 J-6.61 E.06828
G1 X97.805 Y106.463 E.10595
G1 X107.371 Y96.898 E.44873
G1 X106.573 Y96.898 E.02644
G1 X145.446 Y135.77 E1.8236
; WIPE_START
G1 F24000
G1 X144.032 Y134.356 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.167 J-1.205 P1  F30000
G1 X92.926 Y141.432 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X93.132 Y141.409 E.00638
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.369 Y146.054 E.01969
G1 X95.217 Y146.207 E.00662
G1 X94.916 Y146.507 E.01307
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.348 Y146.507 E.01969
G1 X91.047 Y146.207 E.01307
G1 X90.895 Y146.054 E.00662
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.866 Y141.439 E.01147
M204 S10000
G1 X93.326 Y141.001 F30000
M204 S5000
G1 F12000
G1 X93.332 Y141.001 E.00017
G1 X93.773 Y141.045 E.01364
G1 X94.39 Y141.232 E.01981
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
G1 X93.267 Y140.995 E.00416
M204 S10000
; WIPE_START
G1 F24000
G1 X93.332 Y141.001 E-.02488
G1 X93.773 Y141.045 E-.16863
G1 X94.39 Y141.232 E-.24501
G1 X94.959 Y141.536 E-.245
G1 X95.115 Y141.663 E-.07647
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.138 J.43 P1  F30000
G1 X108.57 Y177.29 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X108.776 Y177.266 E.00638
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
G1 X111.354 Y181.369 E.01969
G1 X111.013 Y181.912 E.01969
G1 X110.861 Y182.064 E.00662
G1 X110.56 Y182.365 E.01307
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X106.992 Y182.365 E.01969
G1 X106.692 Y182.064 E.01307
G1 X106.539 Y181.912 E.00662
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.51 Y177.296 E.01147
M204 S10000
G1 X108.971 Y176.858 F30000
M204 S5000
G1 F12000
G1 X108.976 Y176.858 E.00017
G1 X109.418 Y176.902 E.01364
G1 X110.035 Y177.089 E.01981
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X108.911 Y176.852 E.00416
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.976 Y176.858 E-.02488
G1 X109.418 Y176.902 E-.16863
G1 X110.035 Y177.089 E-.24501
G1 X110.604 Y177.393 E-.245
G1 X110.759 Y177.521 E-.07647
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/118
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
G3 Z2.6 I.238 J1.194 P1  F30000
G1 X166.544 Y166.416 Z2.6
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X166.769 Y166.391 E.00696
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.006 Y171.036 E.01969
G1 X168.841 Y171.201 E.00718
G1 X168.553 Y171.489 E.01251
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X164.985 Y171.489 E.01969
G1 X164.697 Y171.201 E.01251
G1 X164.532 Y171.036 E.00718
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.484 Y166.423 E.01088
M204 S10000
G1 X166.985 Y165.984 F30000
M204 S5000
G1 F12000
G1 X166.99 Y165.985 E.00015
G1 X167.41 Y166.026 E.01299
G1 X168.027 Y166.213 E.01981
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X166.925 Y165.978 E.00483
M204 S10000
; WIPE_START
G1 F24000
G1 X166.99 Y165.985 E-.02463
G1 X167.41 Y166.026 E-.16061
G1 X168.027 Y166.213 E-.24501
G1 X168.596 Y166.517 E-.245
G1 X168.768 Y166.659 E-.08475
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.316 J-1.175 P1  F30000
G1 X128.578 Y155.852 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.562 Y155.844 E.0006
G3 X126.848 Y153.047 I1.438 J-2.805 E.11445
G1 X126.848 Y140.032 E.43173
G3 X129.921 Y136.888 I3.154 J.01 E.16136
G3 X133.152 Y140.032 I.07 J3.16 E.16647
G1 X133.152 Y153.047 E.43173
G3 X128.849 Y155.973 I-3.152 J-.008 E.20306
G1 X128.633 Y155.877 E.00783
G1 X128.723 Y155.485 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.503 Y155.358 E.00781
G3 X127.24 Y153.042 I1.497 J-2.319 E.08449
G1 X127.24 Y140.037 E.39961
G3 X129.931 Y137.28 I2.762 J.005 E.131
G3 X132.76 Y140.037 I.061 J2.767 E.13514
G1 X132.76 Y153.042 E.39961
G3 X128.776 Y155.513 I-2.76 J-.003 E.17207
M204 S10000
; WIPE_START
G1 F24000
G1 X128.503 Y155.358 E-.11936
G1 X128.279 Y155.198 E-.10455
G1 X128.073 Y155.016 E-.10455
G1 X127.886 Y154.814 E-.10457
G1 X127.72 Y154.594 E-.10455
G1 X127.576 Y154.36 E-.10456
G1 X127.457 Y154.112 E-.10456
G1 X127.445 Y154.079 E-.0133
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.089 J-.543 P1  F30000
G1 X98.986 Y97.047 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.004 Y97.052 E.0006
G3 X97.921 Y96.888 I-1.004 J2.988 E.62041
G1 X98.079 Y96.888 E.00521
G3 X98.701 Y96.966 I-.079 J3.151 E.02086
G1 X98.929 Y97.03 E.00783
G1 X98.879 Y97.423 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X99.135 Y97.524 E.00845
G3 X97.931 Y97.28 I-1.135 J2.515 E.49473
G1 X98.069 Y97.28 E.00423
G3 X98.822 Y97.405 I-.069 J2.759 E.02354
M204 S10000
; WIPE_START
G1 F24000
G1 X99.135 Y97.524 E-.1272
G1 X99.497 Y97.721 E-.15676
G1 X99.721 Y97.882 E-.10456
G1 X99.927 Y98.064 E-.10456
G1 X100.114 Y98.266 E-.10456
M73 P41 R16
G1 X100.28 Y98.485 E-.10456
G1 X100.36 Y98.615 E-.05781
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.037 J1.216 P1  F30000
G1 X158.866 Y100.371 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X158.864 Y100.353 E.0006
G3 X161.921 Y96.888 I3.136 J-.314 E.17206
G1 X162.079 Y96.888 E.00521
G3 X158.911 Y100.664 I-.079 J3.151 E.4692
G1 X158.875 Y100.431 E.00783
G1 X159.254 Y100.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X159.254 Y100.314 E.00002
G3 X161.931 Y97.28 I2.746 J-.275 E.13955
G1 X162.069 Y97.28 E.00423
G3 X159.295 Y100.586 I-.069 J2.759 E.38055
G1 X159.263 Y100.374 E.0066
M204 S10000
; WIPE_START
G1 F24000
G1 X159.254 Y100.314 E-.02291
G1 X159.24 Y100.04 E-.10455
G1 X159.254 Y99.765 E-.10456
G1 X159.295 Y99.493 E-.10455
G1 X159.406 Y99.096 E-.15676
G1 X159.513 Y98.842 E-.10456
G1 X159.645 Y98.6 E-.10456
G1 X159.73 Y98.475 E-.05753
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.026 J-1.217 P1  F30000
G1 X93.283 Y97.068 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X93.456 Y96.867 E.00879
G3 X95.177 Y96.142 I1.719 J1.676 E.06363
G1 X164.918 Y96.144 E2.31342
G3 X166.909 Y99.736 I-.088 J2.397 E.16354
G1 X133.822 Y157.637 E2.21217
G3 X126.178 Y157.637 I-3.822 J-2.179 E.30726
G1 X93.091 Y99.736 E2.21217
G3 X93.228 Y97.138 I2.084 J-1.193 E.0912
G1 X93.246 Y97.115 E.00098
G1 X92.984 Y96.816 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X93.177 Y96.591 E.0091
G3 X95.172 Y95.75 I1.998 J1.952 E.06832
G1 X164.935 Y95.752 E2.14363
G3 X167.252 Y99.926 I-.106 J2.788 E.17598
G1 X134.16 Y157.836 E2.04944
G3 X125.84 Y157.836 I-4.16 J-2.377 E.30966
G1 X92.748 Y99.926 E2.04944
G3 X92.91 Y96.908 I2.427 J-1.383 E.09811
G1 X92.947 Y96.863 E.0018
M204 S10000
; WIPE_START
G1 F24000
G1 X93.177 Y96.591 E-.13533
G1 X93.488 Y96.313 E-.15842
G1 X93.838 Y96.088 E-.15812
G1 X94.217 Y95.917 E-.15812
G1 X94.483 Y95.836 E-.10545
G1 X94.598 Y95.815 E-.04456
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.184 J-.28 P1  F30000
G1 X94.013 Y98.287 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.536074
G1 F12774.915
G1 X94.287 Y97.778 E.02324
G1 X94.082 Y99.889 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X94.145 Y99.346 E.0168
G1 X94.318 Y98.702 E.02047
G3 X95.331 Y97.178 I4.102 J1.629 E.05666
G1 X95.641 Y96.911 E.01257
G1 X94.969 Y96.942 E.02068
G1 X94.733 Y96.98 E.00735
G1 X94.36 Y97.141 E.01246
G1 X93.967 Y97.459 E.01556
G1 X93.747 Y97.776 E.01182
G1 X93.58 Y98.243 E.01525
G2 X93.62 Y99.01 I1.573 J.302 E.02383
G2 X94.051 Y99.838 I3.531 J-1.309 E.02876
G1 X94.537 Y100.722 F30000
G1 F15000
G1 X94.472 Y100.376 E.01082
G3 X94.672 Y98.831 I3.82 J-.29 E.04819
G3 X95.588 Y97.455 I3.753 J1.503 E.05117
G1 X96.071 Y97.066 E.01906
G1 X96.298 Y96.941 E.00797
G1 X96.231 Y96.817 E.00433
G3 X96.364 Y96.534 I.627 J.123 E.00972
G1 X95.194 Y96.534 E.03597
G1 X94.674 Y96.598 E.0161
G1 X94.133 Y96.841 E.01821
G1 X93.667 Y97.231 E.01869
G1 X93.397 Y97.637 E.01498
G1 X93.205 Y98.205 E.01841
G1 X93.18 Y98.68 E.01462
G1 X93.272 Y99.155 E.01488
G1 X93.491 Y99.644 E.01646
G1 X94.244 Y100.963 E.04667
G1 X94.378 Y100.735 E.00811
G1 X94.477 Y100.727 E.00307
G1 X94.867 Y101.268 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.596585
G1 F11378.735
G1 X94.73 Y101.629 E.01741
G1 X95.118 Y102.292 E.03464
; WIPE_START
G1 F24000
G1 X94.73 Y101.629 E-.50576
G1 X94.867 Y101.268 E-.25424
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.106 J.508 P1  F30000
G1 X96.888 Y96.867 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.443456
G1 F15000
G1 X97.042 Y96.615 E.00964
; LINE_WIDTH: 0.480659
G1 F14392.163
G1 X97.066 Y96.577 E.00162
G1 X97.2 Y96.56 E.00483
; LINE_WIDTH: 0.438322
G1 F15000
G1 X97.378 Y96.542 E.00577
; LINE_WIDTH: 0.410914
G1 X97.555 Y96.529 E.00532
; LINE_WIDTH: 0.387195
G1 X98.259 Y96.519 E.01975
; LINE_WIDTH: 0.420459
G1 X98.612 Y96.541 E.01086
; LINE_WIDTH: 0.46796
G1 F14822.14
G1 X98.789 Y96.559 E.00617
; LINE_WIDTH: 0.499589
G1 F13795.548
G1 X98.934 Y96.577 E.00544
G1 X98.946 Y96.596 E.00084
; LINE_WIDTH: 0.443455
G1 F15000
G1 X98.958 Y96.615 E.00074
; LINE_WIDTH: 0.421768
G1 X99.112 Y96.867 E.00911
G1 X101.508 Y98.337 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X101.581 Y98.479 E.00529
G3 X101.902 Y99.902 I-3.967 J1.641 E.04862
G1 X142.655 Y140.655 E1.91183
G1 X139.864 Y145.54 E.18663
G1 X133.865 Y139.487 E.2827
G1 X155.93 Y117.422 E1.03513
G1 X156.611 Y116.231 E.04552
G1 X140.163 Y99.783 E.7716
G1 X140.163 Y102.485 E.08964
G1 X145.749 Y96.899 E.26206
G1 X144.955 Y96.899 E.02635
G1 X159.402 Y111.346 E.67773
G1 X160.209 Y109.932 E.05401
G1 X164.882 Y102.292 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.585711
G1 F11606.685
G1 X165.27 Y101.629 E.03396
G1 X165.133 Y101.268 E.01707
G1 X165.675 Y97.716 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.550928
G1 F12401.386
G3 X165.934 Y98.164 I-1.205 J.996 E.02154
G1 X165.905 Y99.936 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X166.27 Y99.296 E.02263
G1 X166.419 Y98.853 E.01436
G1 X166.449 Y98.545 E.0095
G1 X166.37 Y98.044 E.0156
G1 X166.201 Y97.68 E.01233
G1 X165.949 Y97.371 E.01224
G1 X165.63 Y97.133 E.01224
G1 X165.222 Y96.974 E.01346
G2 X164.357 Y96.913 I-.621 J2.639 E.02675
G1 X164.966 Y97.478 E.02551
G3 X165.754 Y98.907 I-4.02 J3.149 E.05037
G1 X165.894 Y99.593 E.02153
G1 X165.903 Y99.876 E.00868
G1 X165.458 Y100.724 F30000
G1 F15000
G1 X165.618 Y100.738 E.00494
G1 X165.751 Y100.966 E.0081
G1 X166.614 Y99.455 E.05346
G1 X166.786 Y98.979 E.01555
G1 X166.824 Y98.581 E.01227
G1 X166.758 Y97.992 E.01824
G1 X166.501 Y97.452 E.01836
G1 X166.184 Y97.076 E.01511
G1 X165.785 Y96.789 E.01511
G1 X165.336 Y96.611 E.01485
G1 X164.845 Y96.536 E.01524
G1 X163.627 Y96.536 E.03744
G1 X163.76 Y96.824 E.00975
G1 X163.698 Y96.936 E.00394
G1 X164.195 Y97.257 E.01818
G1 X164.703 Y97.747 E.02168
G3 X165.389 Y99.003 I-3.813 J2.902 E.04413
G1 X165.524 Y99.668 E.02087
G1 X165.528 Y100.374 E.02168
G1 X165.47 Y100.666 E.00914
G1 X163.112 Y96.867 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.421795
G1 F15000
G1 X162.958 Y96.615 E.00911
; LINE_WIDTH: 0.443488
G1 X162.946 Y96.596 E.00074
; LINE_WIDTH: 0.499593
G1 F13795.449
G1 X162.934 Y96.577 E.00084
G1 X162.789 Y96.559 E.00544
; LINE_WIDTH: 0.467958
G1 F14822.212
G1 X162.612 Y96.541 E.00617
; LINE_WIDTH: 0.42046
G1 F15000
G1 X162.259 Y96.519 E.01086
; LINE_WIDTH: 0.387195
G1 X161.555 Y96.529 E.01975
; LINE_WIDTH: 0.410916
G1 X161.378 Y96.542 E.00532
; LINE_WIDTH: 0.438322
G1 X161.2 Y96.56 E.00577
; LINE_WIDTH: 0.480659
G1 F14392.163
G1 X161.066 Y96.577 E.00483
G1 X161.042 Y96.615 E.00162
; LINE_WIDTH: 0.443456
G1 F15000
G1 X160.888 Y96.867 E.00964
G1 X158.484 Y98.333 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X158.098 Y99.902 I3.436 J1.678 E.054
G1 X117.344 Y140.656 E1.91186
G1 X120.135 Y145.541 E.18662
G1 X126.135 Y139.487 E.28272
G1 X104.064 Y117.416 E1.0354
G1 X103.388 Y116.232 E.04523
G1 X119.837 Y99.783 E.77167
G1 X119.837 Y102.485 E.08964
G1 X114.25 Y96.898 E.26212
G1 X115.046 Y96.898 E.02643
G1 X100.597 Y111.348 E.67787
G1 X101.404 Y112.761 E.05401
G1 X120.722 Y108.203 F30000
G1 F15476.087
G1 X119.837 Y108.203 E.02935
G1 X119.837 Y107.459 E.02466
G1 X106.179 Y121.117 E.64073
G1 X108.97 Y126.002 E.18662
G1 X135.27 Y99.703 E1.23375
G1 X132.406 Y99.703 E.09498
G1 X137.837 Y105.133 E.25477
G1 X137.837 Y104.811 E.01069
G1 X111.762 Y130.886 E1.22326
G1 X114.299 Y135.327 E.16965
G1 X126.093 Y147.12 E.55326
G1 X126.093 Y147.259 E.00461
G1 X122.927 Y150.425 E.14852
G1 X124.534 Y153.237 E.10744
G1 X125.75 Y154.454 E.05707
G1 X126.24 Y154.284 E.01719
G3 X126.099 Y153.184 I5.458 J-1.26 E.03685
G1 X125.499 Y155.403 F30000
G1 F15476.087
G1 X125.335 Y155.46 E.00578
G1 X125.42 Y155.608 E.00566
G1 X125.692 Y155.336 E.01277
G1 X126.398 Y155.102 E.02468
G1 X125.521 Y155.785 E.03689
G1 X126.613 Y156.876 F30000
G1 F15476.087
G1 X126.262 Y156.262 E.02345
G1 X126.977 Y155.681 E.03057
G1 X130.355 Y159.083 E.15905
G3 X129.623 Y159.081 I-.358 J-3.924 E.02433
G1 X133.024 Y155.68 E.15957
G1 X133.74 Y156.259 E.03054
G1 X133.389 Y156.873 E.02347
G1 X134.218 Y156.123 F30000
G1 F15476.087
G1 X132.948 Y155.094 E.05421
G1 X132.2 Y155.762 E.03328
G3 X127.563 Y155.553 I-2.199 J-2.737 E.1682
G1 X127.048 Y155.098 E.0228
G1 X125.737 Y156.165 E.05605
G1 X126.476 Y157.457 E.04938
G2 X132.233 Y158.835 I3.535 J-2.054 E.21957
G1 X132.484 Y158.66 E.01015
G2 X134.265 Y156.161 I-5.465 J-5.779 E.10245
G1 X133.761 Y155.229 F30000
G1 F15476.087
G1 X133.603 Y155.101 E.00675
G1 X134.308 Y155.335 E.02463
G1 X134.58 Y155.608 E.0128
G1 X134.469 Y155.802 E.00742
G1 X133.761 Y155.229 E.03023
G1 X133.902 Y153.184 F30000
G1 F15476.087
G3 X133.859 Y153.627 I-2.249 J.009 E.0148
G1 X133.76 Y154.283 E.02202
G1 X134.25 Y154.454 E.0172
G1 X135.466 Y153.238 E.05703
G1 X137.073 Y150.425 E.10747
G1 X133.907 Y147.259 E.14851
G1 X133.907 Y147.12 E.00461
G1 X145.698 Y135.33 E.55311
G1 X148.237 Y130.885 E.16981
G1 X122.163 Y104.811 E1.22321
G1 X122.163 Y105.133 E.01069
G1 X127.594 Y99.703 E.25477
G1 X124.73 Y99.703 E.09498
G1 X151.028 Y126.001 E1.23369
G1 X153.819 Y121.116 E.18663
G1 X140.163 Y107.459 E.64066
G1 X140.163 Y108.203 E.02466
G1 X139.278 Y108.203 E.02935
G1 X139.349 Y105.017 F30000
G1 F15476.087
G1 X139.349 Y106.645 E.05401
G1 X138.651 Y105.947 E.03272
G1 X138.651 Y103.997 E.06471
G1 X139.349 Y103.299 E.03272
G1 X139.349 Y98.969 E.14365
G1 X136.871 Y96.491 E.11622
G1 X138.481 Y96.491 E.05339
G1 X136.084 Y98.888 E.11244
G1 X131.592 Y98.888 E.14899
G1 X129.195 Y96.491 E.11246
G1 X130.805 Y96.491 E.0534
G1 X128.408 Y98.888 E.11245
G1 X123.916 Y98.888 E.14899
G1 X121.519 Y96.491 E.11247
G1 X123.129 Y96.491 E.05342
G1 X120.651 Y98.969 E.11624
G1 X120.651 Y103.299 E.14365
G1 X121.349 Y103.997 E.03272
G1 X121.349 Y105.947 E.06471
G1 X120.651 Y106.645 E.03272
G1 X120.651 Y105.017 E.05401
G1 X120.244 Y96.491 F30000
G1 F15476.087
G1 X120.244 Y107.795 E.37499
G1 X121.756 Y107.795 E.05014
G1 X121.756 Y99.954 E.26012
G1 X122.414 Y99.295 E.03089
G1 X137.627 Y99.313 E.50464
G1 X138.244 Y99.954 E.02952
G1 X138.244 Y107.795 E.26012
G1 X139.756 Y107.795 E.05014
G1 X139.756 Y96.492 E.37497
G1 X160.186 Y96.492 E.67772
G1 X159.204 Y97.934 E.05788
G2 X162.435 Y103.513 I2.802 J2.102 E.27162
G1 X164.56 Y103.139 E.07155
G1 X134.871 Y155.1 E1.98516
G1 X133.307 Y154.557 E.0549
G1 X133.457 Y153.566 E.03323
G2 X133.5 Y153.056 I-2.543 J-.475 E.01702
G1 X133.497 Y139.954 E.43461
G2 X126.5 Y140.023 I-3.498 J.111 E.35964
G1 X126.5 Y153.056 E.43231
G2 X126.693 Y154.557 I7.644 J-.219 E.0503
G1 X125.129 Y155.101 E.0549
G1 X95.437 Y103.138 E1.98526
G3 X97.565 Y103.514 I-6.846 J44.983 E.07169
G1 X98.032 Y103.537 E.01551
G2 X100.691 Y97.801 I-.044 J-3.505 E.2614
G1 X99.749 Y96.49 E.05357
G1 X120.184 Y96.491 E.67789
G1 X114.553 Y135.771 F30000
G1 F15476.087
G1 X153.425 Y96.899 E1.82356
G1 X152.631 Y96.899 E.02633
G1 X162.193 Y106.461 E.44856
G1 X163.776 Y103.69 E.10584
G3 X162.056 Y103.946 I-2.081 J-8.092 E.05777
G1 X161.738 Y103.938 E.01055
G1 X129.505 Y136.171 E1.51211
G3 X130.491 Y136.167 I.508 J3.697 E.0328
G1 X98.256 Y103.932 E1.51219
G3 X96.221 Y103.69 I-.236 J-6.688 E.06827
G1 X97.805 Y106.463 E.10595
G1 X107.371 Y96.898 E.44873
G1 X106.573 Y96.898 E.02644
G1 X145.446 Y135.77 E1.8236
; WIPE_START
G1 F24000
G1 X144.032 Y134.356 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.167 J-1.205 P1  F30000
G1 X92.907 Y141.434 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X93.132 Y141.409 E.00696
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.369 Y146.054 E.01969
G1 X95.204 Y146.22 E.00718
G1 X94.916 Y146.507 E.01251
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.348 Y146.507 E.01969
M73 P41 R15
G1 X91.06 Y146.22 E.01251
G1 X90.895 Y146.054 E.00718
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.847 Y141.441 E.01088
M204 S10000
G1 X93.348 Y141.003 F30000
M204 S5000
G1 F12000
G1 X93.353 Y141.003 E.00015
G1 X93.773 Y141.045 E.01299
G1 X94.39 Y141.232 E.01981
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
G1 X93.288 Y140.997 E.00483
M204 S10000
; WIPE_START
G1 F24000
G1 X93.353 Y141.003 E-.02463
G1 X93.773 Y141.045 E-.16061
G1 X94.39 Y141.232 E-.24501
G1 X94.959 Y141.536 E-.245
G1 X95.131 Y141.677 E-.08475
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.139 J.429 P1  F30000
G1 X108.551 Y177.292 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X108.776 Y177.266 E.00696
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
G1 X111.354 Y181.369 E.01969
G1 X111.013 Y181.912 E.01969
G1 X110.848 Y182.077 E.00718
G1 X110.56 Y182.365 E.01251
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X106.992 Y182.365 E.01969
G1 X106.704 Y182.077 E.01251
G1 X106.539 Y181.912 E.00718
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.492 Y177.298 E.01088
M204 S10000
G1 X108.993 Y176.86 F30000
M204 S5000
G1 F12000
G1 X108.997 Y176.86 E.00015
G1 X109.418 Y176.902 E.01299
G1 X110.035 Y177.089 E.01981
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X108.933 Y176.854 E.00483
M204 S10000
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.997 Y176.86 E-.02463
G1 X109.418 Y176.902 E-.16061
G1 X110.035 Y177.089 E-.24501
G1 X110.604 Y177.393 E-.245
G1 X110.776 Y177.534 E-.08475
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/118
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
G3 Z2.8 I.238 J1.193 P1  F30000
G1 X166.524 Y166.418 Z2.8
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X166.769 Y166.391 E.00756
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.006 Y171.036 E.01969
G1 X168.828 Y171.214 E.00774
G1 X168.553 Y171.489 E.01195
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X164.985 Y171.489 E.01969
G1 X164.71 Y171.214 E.01195
G1 X164.532 Y171.036 E.00774
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.465 Y166.425 E.01029
M204 S10000
G1 X167.007 Y165.986 F30000
M204 S5000
G1 F12000
G1 X167.011 Y165.987 E.00012
G1 X167.41 Y166.026 E.01234
G1 X168.027 Y166.213 E.01981
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X166.947 Y165.981 E.00551
M204 S10000
; WIPE_START
G1 F24000
G1 X167.011 Y165.987 E-.02428
G1 X167.41 Y166.026 E-.15259
G1 X168.027 Y166.213 E-.24501
M73 P42 R15
G1 X168.596 Y166.517 E-.24501
G1 X168.786 Y166.673 E-.09313
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.316 J-1.175 P1  F30000
G1 X128.546 Y155.836 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.29 Y155.687 E.00982
G3 X126.848 Y153.047 I1.71 J-2.648 E.10402
G1 X126.848 Y140.032 E.43173
G3 X129.921 Y136.888 I3.154 J.01 E.16136
G3 X133.152 Y140.032 I.07 J3.16 E.16647
G1 X133.152 Y153.047 E.43173
G3 X128.6 Y155.863 I-3.152 J-.008 E.2121
G1 X128.746 Y155.498 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.741 Y155.495 E.00018
G3 X127.24 Y153.042 I1.259 J-2.456 E.09295
G1 X127.24 Y140.037 E.39961
G3 X129.931 Y137.28 I2.762 J.005 E.131
G3 X132.76 Y140.037 I.061 J2.767 E.13514
G1 X132.76 Y153.042 E.39961
G3 X128.992 Y155.608 I-2.76 J-.003 E.16482
G1 X128.801 Y155.523 E.00643
M204 S10000
; WIPE_START
G1 F24000
G1 X128.741 Y155.495 E-.02507
G1 X128.503 Y155.358 E-.10455
G1 X128.279 Y155.198 E-.10456
G1 X128.073 Y155.015 E-.10456
G1 X127.886 Y154.814 E-.10456
G1 X127.72 Y154.594 E-.10455
G1 X127.576 Y154.36 E-.10456
G1 X127.457 Y154.112 E-.10456
G1 X127.454 Y154.104 E-.00303
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.089 J-.543 P1  F30000
G1 X99.021 Y97.058 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.296 Y97.166 E.00982
G3 X97.921 Y96.888 I-1.296 J2.873 E.60998
G1 X98.079 Y96.888 E.00521
G3 X98.964 Y97.038 I-.079 J3.151 E.0299
G1 X98.88 Y97.424 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X99.135 Y97.524 E.00844
G3 X97.931 Y97.28 I-1.135 J2.515 E.49473
G1 X98.069 Y97.28 E.00423
G3 X98.822 Y97.405 I-.069 J2.759 E.02355
M204 S10000
; WIPE_START
G1 F24000
G1 X99.135 Y97.524 E-.12712
G1 X99.38 Y97.649 E-.10456
G1 X99.611 Y97.799 E-.10455
G1 X99.826 Y97.97 E-.10456
G1 X100.023 Y98.162 E-.10456
G1 X100.2 Y98.373 E-.10456
G1 X100.355 Y98.6 E-.10456
G1 X100.362 Y98.613 E-.00553
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.037 J1.216 P1  F30000
G1 X158.866 Y100.372 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X158.864 Y100.353 E.0006
G3 X161.921 Y96.888 I3.136 J-.314 E.17206
G1 X162.079 Y96.888 E.00521
G3 X158.911 Y100.664 I-.079 J3.151 E.4692
G1 X158.875 Y100.431 E.00783
G1 X159.254 Y100.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X159.254 Y100.314 E.00002
G3 X161.931 Y97.28 I2.746 J-.275 E.13955
G1 X162.069 Y97.28 E.00423
G3 X159.295 Y100.586 I-.069 J2.759 E.38055
G1 X159.263 Y100.374 E.00659
M204 S10000
; WIPE_START
G1 F24000
G1 X159.254 Y100.314 E-.02299
G1 X159.24 Y100.062 E-.09622
G1 X159.271 Y99.628 E-.16505
G1 X159.325 Y99.359 E-.10456
G1 X159.406 Y99.096 E-.10456
G1 X159.513 Y98.842 E-.10455
G1 X159.645 Y98.6 E-.10456
G1 X159.73 Y98.475 E-.0575
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.026 J-1.217 P1  F30000
G1 X93.3 Y97.043 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X95.177 Y96.142 I1.875 J1.5 E.07144
G1 X164.927 Y96.144 E2.31373
G3 X166.909 Y99.736 I-.097 J2.396 E.16323
G1 X133.822 Y157.637 E2.21217
G3 X126.178 Y157.637 I-3.822 J-2.179 E.30726
G1 X93.091 Y99.736 E2.21217
G3 X93.263 Y97.09 I2.084 J-1.193 E.09317
G1 X92.98 Y96.812 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X92.994 Y96.798 E.00061
G3 X95.172 Y95.75 I2.181 J1.745 E.07681
G1 X164.945 Y95.753 E2.14393
G3 X167.252 Y99.926 I-.116 J2.788 E.17568
G1 X134.16 Y157.836 E2.04944
G3 X125.84 Y157.836 I-4.16 J-2.377 E.30966
G1 X92.748 Y99.926 E2.04944
G3 X92.759 Y97.141 I2.427 J-1.383 E.08959
G1 X92.947 Y96.862 E.01033
M204 S10000
; WIPE_START
G1 F24000
G1 X92.994 Y96.798 E-.03021
G1 X93.176 Y96.588 E-.10541
G1 X93.488 Y96.313 E-.15812
G1 X93.838 Y96.088 E-.15812
G1 X94.217 Y95.917 E-.15811
G1 X94.483 Y95.836 E-.10547
G1 X94.598 Y95.815 E-.04456
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.186 J-.274 P1  F30000
G1 X94.045 Y98.208 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.558749
G1 F12213.346
G3 X94.28 Y97.772 I1.517 J.539 E.02092
G1 X94.083 Y99.92 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X94.133 Y99.4 E.01606
G1 X94.299 Y98.75 E.02061
G1 X94.536 Y98.204 E.01827
G1 X94.881 Y97.676 E.0194
G1 X95.332 Y97.17 E.02081
G1 X95.651 Y96.911 E.01262
G1 X94.946 Y96.944 E.02167
G1 X94.733 Y96.98 E.00666
G1 X94.36 Y97.141 E.01246
G1 X93.967 Y97.459 E.01554
G1 X93.714 Y97.845 E.01417
G1 X93.602 Y98.15 E.00997
G1 X93.555 Y98.619 E.01448
G1 X93.622 Y99.013 E.01229
G2 X94.053 Y99.868 I5.059 J-2.018 E.02946
G1 X94.522 Y100.719 F30000
G1 F15000
G1 X94.46 Y99.891 E.0255
G1 X94.511 Y99.443 E.01385
G1 X94.664 Y98.843 E.01904
G3 X95.595 Y97.44 I3.748 J1.476 E.05211
G1 X96.065 Y97.07 E.01838
G1 X96.298 Y96.94 E.0082
G1 X96.231 Y96.817 E.00433
G3 X96.364 Y96.534 I.627 J.123 E.00972
G1 X95.194 Y96.534 E.03597
G1 X94.674 Y96.598 E.0161
G1 X94.133 Y96.84 E.0182
G1 X93.734 Y97.142 E.01535
G1 X93.395 Y97.631 E.0183
G1 X93.228 Y98.1 E.01529
G1 X93.182 Y98.672 E.01762
G1 X93.274 Y99.159 E.01523
G1 X93.483 Y99.631 E.01587
G1 X94.244 Y100.963 E.04716
G1 X94.381 Y100.734 E.00821
G1 X94.463 Y100.725 E.00254
G1 X94.867 Y101.268 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.596582
G1 F11378.79
G1 X94.73 Y101.629 E.01741
G1 X95.118 Y102.292 E.03464
G1 X95.513 Y102.585 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.616552
G1 F10982.651
G2 X95.519 Y102.699 I-.032 J.059 E.01329
G1 X95.821 Y104.177 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.400852
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X120.223 Y104.177 E1.25468
G1 X120.223 Y104.627 E.02318
G1 X96.312 Y104.627 E1.22944
G1 X96.57 Y105.078 E.0267
G1 X120.223 Y105.078 E1.21619
G1 X120.223 Y105.529 E.02318
G1 X96.828 Y105.529 E1.20294
G1 X97.085 Y105.98 E.0267
G1 X120.223 Y105.98 E1.1897
G1 X120.223 Y106.431 E.02318
G1 X97.343 Y106.431 E1.17645
G1 X97.6 Y106.882 E.0267
G1 X120.223 Y106.882 E1.1632
G1 X120.223 Y107.333 E.02318
G1 X97.858 Y107.333 E1.14996
G1 X98.116 Y107.783 E.0267
G1 X161.881 Y107.783 E3.27872
G1 X162.139 Y107.333 E.0267
G1 X139.777 Y107.333 E1.1498
G1 X139.777 Y106.882 E.02318
G1 X162.396 Y106.882 E1.16304
G1 X162.654 Y106.431 E.0267
G1 X139.777 Y106.431 E1.17629
G1 X139.777 Y105.98 E.02318
G1 X162.912 Y105.98 E1.18953
G1 X163.169 Y105.529 E.0267
G1 X139.777 Y105.529 E1.20278
G1 X139.777 Y105.078 E.02318
G1 X163.427 Y105.078 E1.21602
G1 X163.684 Y104.627 E.0267
G1 X139.777 Y104.627 E1.22927
G1 X139.777 Y104.177 E.02318
G1 X163.942 Y104.177 E1.24251
G1 X164.2 Y103.726 E.0267
G1 X139.777 Y103.726 E1.25576
G1 X139.777 Y103.275 E.02318
G1 X160.616 Y103.275 E1.0715
G3 X159.846 Y102.824 I1.47 J-3.394 E.046
G1 X139.777 Y102.824 E1.03191
G1 X139.777 Y102.373 E.02318
G1 X159.366 Y102.373 E1.00722
G3 X159.028 Y101.922 I2.823 J-2.471 E.02901
G1 X139.777 Y101.922 E.98982
G1 X139.777 Y101.471 E.02318
G1 X158.785 Y101.471 E.97734
G3 X158.619 Y101.021 I4.114 J-1.764 E.0247
G1 X139.777 Y101.021 E.96884
G1 X139.777 Y100.57 E.02318
G1 X158.522 Y100.57 E.96383
G3 X158.481 Y100.119 I2.279 J-.435 E.02332
G1 X139.777 Y100.119 E.96172
G1 X139.777 Y99.668 E.02318
G1 X158.505 Y99.668 E.96297
G3 X158.577 Y99.217 I1.769 J.05 E.02354
G1 X139.777 Y99.217 E.96666
G1 X139.777 Y98.766 E.02318
G1 X158.719 Y98.766 E.97395
G3 X158.933 Y98.315 I2.36 J.845 E.02571
G1 X139.777 Y98.315 E.98496
G1 X139.777 Y97.865 E.02318
G1 X159.225 Y97.865 E.99997
G1 X159.532 Y97.414 E.02806
G1 X139.777 Y97.414 E1.01578
G1 X139.777 Y96.963 E.02318
G1 X160.085 Y96.963 E1.04418
M106 S127.5
G1 X160.321 Y96.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X160.343 Y96.778 E.00505
G1 X160.536 Y96.467 E.01012
G1 X161.042 Y96.615 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.480656
G1 F14392.236
G1 X161.066 Y96.577 E.00162
G1 X161.2 Y96.56 E.00483
; LINE_WIDTH: 0.438327
G1 F15000
G1 X161.378 Y96.542 E.00577
; LINE_WIDTH: 0.410916
G1 X161.555 Y96.529 E.00533
; LINE_WIDTH: 0.387195
G1 X162.259 Y96.519 E.01975
; LINE_WIDTH: 0.420458
G1 X162.612 Y96.541 E.01086
; LINE_WIDTH: 0.467958
G1 F14822.222
G1 X162.789 Y96.559 E.00617
; LINE_WIDTH: 0.49959
G1 F13795.539
G1 X162.934 Y96.577 E.00544
G1 X162.946 Y96.596 E.00084
; LINE_WIDTH: 0.443456
G1 F15000
G1 X162.958 Y96.615 E.00074
; LINE_WIDTH: 0.421774
G1 X163.112 Y96.867 E.00911
G1 X161.042 Y96.615 F30000
; LINE_WIDTH: 0.44347
G1 F15000
G1 X160.888 Y96.867 E.00964
G1 X165.677 Y97.713 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.540038
G1 F12673.048
G1 X165.961 Y98.218 E.02347
; LINE_WIDTH: 0.555628
G1 F12287.696
M73 P43 R15
G1 X165.993 Y98.333 E.00498
; LINE_WIDTH: 0.519778
G1 F13211.48
G1 X166.025 Y98.448 E.00463
G1 X165.914 Y99.92 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X166.27 Y99.296 E.02207
G1 X166.419 Y98.852 E.0144
G1 X166.449 Y98.545 E.00948
G1 X166.371 Y98.044 E.01557
G1 X166.2 Y97.679 E.01237
G1 X165.911 Y97.34 E.01369
G1 X165.632 Y97.134 E.01066
G1 X165.27 Y96.982 E.01205
G2 X164.343 Y96.913 I-.702 J3.191 E.02867
G1 X164.777 Y97.274 E.01732
G1 X165.206 Y97.786 E.02054
G1 X165.57 Y98.431 E.02277
G3 X165.852 Y99.317 I-6.852 J2.667 E.02859
G1 X165.908 Y99.86 E.01678
G1 X165.468 Y100.725 F30000
G1 F15000
G1 X165.62 Y100.739 E.00468
G1 X165.751 Y100.966 E.00805
G1 X166.614 Y99.455 E.05346
G1 X166.786 Y98.979 E.01555
G1 X166.824 Y98.581 E.01228
G1 X166.758 Y97.992 E.01822
G1 X166.501 Y97.451 E.01839
G1 X166.185 Y97.076 E.01506
G1 X165.787 Y96.79 E.01505
G1 X165.334 Y96.61 E.01498
G1 X164.794 Y96.536 E.01673
G1 X163.627 Y96.536 E.03588
G1 X163.76 Y96.82 E.00961
G1 X163.695 Y96.941 E.00423
G1 X163.938 Y97.073 E.00853
G1 X164.461 Y97.49 E.02054
G1 X164.882 Y97.986 E.01998
G1 X165.239 Y98.611 E.02214
G1 X165.47 Y99.319 E.02287
G1 X165.543 Y99.999 E.02101
G1 X165.509 Y100.529 E.01631
G1 X165.48 Y100.666 E.00432
G1 X165.133 Y101.268 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.585719
G1 F11606.52
G1 X165.27 Y101.629 E.01707
G1 X164.882 Y102.292 E.03396
G1 X164.559 Y102.585 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.616508
G1 F10983.493
G2 X164.565 Y102.699 I-.032 J.059 E.01329
G1 X164.69 Y103.275 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.400852
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X162.746 Y103.275 E.09999
M106 S127.5
G1 X161.857 Y108.234 F30000
M106 S255
G1 F3000
G1 X98.373 Y108.234 E3.26422
G1 X98.631 Y108.685 E.0267
G1 X161.366 Y108.685 E3.22573
G1 X161.108 Y109.136 E.0267
G1 X98.889 Y109.136 E3.19924
G1 X99.146 Y109.587 E.0267
G1 X160.851 Y109.587 E3.17275
G1 X160.593 Y110.038 E.0267
G1 X99.404 Y110.038 E3.14626
G1 X99.661 Y110.488 E.0267
G1 X160.336 Y110.488 E3.11976
G1 X160.078 Y110.939 E.0267
G1 X99.919 Y110.939 E3.09327
G1 X100.177 Y111.39 E.0267
G1 X159.82 Y111.39 E3.06678
G1 X159.563 Y111.841 E.0267
G1 X100.434 Y111.841 E3.04029
G1 X100.692 Y112.292 E.0267
G1 X159.305 Y112.292 E3.01379
G1 X159.048 Y112.743 E.0267
G1 X100.95 Y112.743 E2.9873
G1 X101.207 Y113.194 E.0267
G1 X158.79 Y113.194 E2.96081
G1 X158.532 Y113.644 E.0267
G1 X101.465 Y113.644 E2.93432
G1 X101.722 Y114.095 E.0267
G1 X158.275 Y114.095 E2.90782
G1 X158.017 Y114.546 E.0267
G1 X101.98 Y114.546 E2.88133
G1 X102.238 Y114.997 E.0267
G1 X157.76 Y114.997 E2.85484
G1 X157.502 Y115.448 E.0267
G1 X102.495 Y115.448 E2.82835
G1 X102.753 Y115.899 E.0267
G1 X157.244 Y115.899 E2.80186
G1 X156.987 Y116.35 E.0267
G1 X103.011 Y116.35 E2.77536
G1 X103.268 Y116.8 E.0267
G1 X156.729 Y116.8 E2.74887
G1 X156.472 Y117.251 E.0267
G1 X103.526 Y117.251 E2.72238
G1 X103.784 Y117.702 E.0267
G1 X156.214 Y117.702 E2.69589
G1 X155.956 Y118.153 E.0267
G1 X104.041 Y118.153 E2.66939
G1 X104.299 Y118.604 E.0267
G1 X155.699 Y118.604 E2.6429
G1 X155.441 Y119.055 E.0267
G1 X104.556 Y119.055 E2.61641
G1 X104.814 Y119.506 E.0267
G1 X155.184 Y119.506 E2.58992
G1 X154.926 Y119.956 E.0267
G1 X105.072 Y119.956 E2.56342
G1 X105.329 Y120.407 E.0267
G1 X154.668 Y120.407 E2.53693
G1 X154.411 Y120.858 E.0267
G1 X105.587 Y120.858 E2.51044
G1 X105.845 Y121.309 E.0267
G1 X154.153 Y121.309 E2.48395
G1 X153.896 Y121.76 E.0267
G1 X106.102 Y121.76 E2.45746
G1 X106.36 Y122.211 E.0267
G1 X153.638 Y122.211 E2.43096
G1 X153.38 Y122.662 E.0267
G1 X106.617 Y122.661 E2.40447
G1 X106.875 Y123.112 E.0267
G1 X153.123 Y123.112 E2.37798
G1 X152.865 Y123.563 E.0267
G1 X107.133 Y123.563 E2.35149
M73 P44 R15
G1 X107.39 Y124.014 E.0267
G1 X152.608 Y124.014 E2.32499
G1 X152.35 Y124.465 E.0267
G1 X107.648 Y124.465 E2.2985
G1 X107.906 Y124.916 E.0267
G1 X152.092 Y124.916 E2.27201
G1 X151.835 Y125.367 E.0267
G1 X108.163 Y125.367 E2.24552
G1 X108.421 Y125.817 E.0267
G1 X151.577 Y125.817 E2.21902
G1 X151.32 Y126.268 E.0267
G1 X108.679 Y126.268 E2.19253
G1 X108.936 Y126.719 E.0267
G1 X151.062 Y126.719 E2.16604
G1 X150.804 Y127.17 E.0267
G1 X109.194 Y127.17 E2.13955
G1 X109.451 Y127.621 E.0267
G1 X150.547 Y127.621 E2.11305
G1 X150.289 Y128.072 E.0267
G1 X109.709 Y128.072 E2.08656
G1 X109.967 Y128.523 E.0267
G1 X150.032 Y128.523 E2.06007
G1 X149.774 Y128.973 E.0267
G1 X110.224 Y128.973 E2.03358
G1 X110.482 Y129.424 E.0267
G1 X149.516 Y129.424 E2.00709
G1 X149.259 Y129.875 E.0267
G1 X110.74 Y129.875 E1.98059
G1 X110.997 Y130.326 E.0267
G1 X149.001 Y130.326 E1.9541
M73 P45 R15
G1 X148.744 Y130.777 E.0267
G1 X111.255 Y130.777 E1.92761
G1 X111.512 Y131.228 E.0267
G1 X148.486 Y131.228 E1.90112
G1 X148.228 Y131.679 E.0267
G1 X111.77 Y131.679 E1.87462
G1 X112.028 Y132.129 E.0267
G1 X147.971 Y132.129 E1.84813
G1 X147.713 Y132.58 E.0267
G1 X112.285 Y132.58 E1.82164
G1 X112.543 Y133.031 E.0267
G1 X147.456 Y133.031 E1.79515
M73 P45 R14
G1 X147.198 Y133.482 E.0267
G1 X112.801 Y133.482 E1.76865
G1 X113.058 Y133.933 E.0267
G1 X146.94 Y133.933 E1.74216
G1 X146.683 Y134.384 E.0267
G1 X113.316 Y134.384 E1.71567
G1 X113.573 Y134.835 E.0267
G1 X146.425 Y134.835 E1.68918
G1 X146.168 Y135.285 E.0267
G1 X113.831 Y135.285 E1.66269
G1 X114.089 Y135.736 E.0267
G1 X145.91 Y135.736 E1.63619
G1 X145.652 Y136.187 E.0267
G1 X114.346 Y136.187 E1.6097
G1 X114.604 Y136.638 E.0267
G1 X145.395 Y136.638 E1.58321
G1 X145.137 Y137.089 E.0267
G1 X131.922 Y137.089 E.67948
G3 X132.48 Y137.54 I-2.537 J3.705 E.03689
G1 X144.88 Y137.54 E.63759
G1 X144.622 Y137.99 E.0267
G1 X132.861 Y137.99 E.60472
M73 P46 R14
G3 X133.135 Y138.441 I-3.234 J2.273 E.02714
G1 X144.364 Y138.441 E.57739
G1 X144.107 Y138.892 E.0267
G1 X133.326 Y138.892 E.55432
G3 X133.453 Y139.343 I-5.506 J1.789 E.02409
G1 X143.849 Y139.343 E.53456
G1 X143.592 Y139.794 E.0267
G1 X133.51 Y139.794 E.51836
G3 X133.522 Y140.245 I-4.456 J.34 E.0232
G1 X143.334 Y140.245 E.50452
G1 X143.076 Y140.696 E.0267
G1 X133.522 Y140.696 E.49128
G1 X133.522 Y141.146 E.02318
G1 X142.819 Y141.146 E.47803
G1 X142.561 Y141.597 E.0267
G1 X133.522 Y141.597 E.46479
G1 X133.522 Y142.048 E.02318
G1 X142.303 Y142.048 E.45154
G1 X142.046 Y142.499 E.0267
G1 X133.522 Y142.499 E.43829
G1 X133.522 Y142.95 E.02318
G1 X141.788 Y142.95 E.42505
G1 X141.531 Y143.401 E.0267
G1 X133.522 Y143.401 E.4118
G1 X133.522 Y143.852 E.02318
G1 X141.273 Y143.852 E.39856
G1 X141.015 Y144.302 E.0267
G1 X133.522 Y144.302 E.38531
G1 X133.522 Y144.753 E.02318
G1 X140.758 Y144.753 E.37207
G1 X140.5 Y145.204 E.0267
G1 X133.522 Y145.204 E.35882
G1 X133.522 Y145.655 E.02318
G1 X140.243 Y145.655 E.34558
G1 X139.985 Y146.106 E.0267
G1 X133.522 Y146.106 E.33233
G1 X133.522 Y146.557 E.02318
G1 X139.727 Y146.557 E.31909
G1 X139.47 Y147.008 E.0267
G1 X133.522 Y147.008 E.30584
G1 X133.522 Y147.458 E.02318
G1 X139.212 Y147.458 E.2926
G1 X138.955 Y147.909 E.0267
G1 X133.522 Y147.909 E.27935
M73 P47 R14
G1 X133.522 Y148.36 E.02318
G1 X138.697 Y148.36 E.2661
G1 X138.439 Y148.811 E.0267
G1 X133.522 Y148.811 E.25286
G1 X133.522 Y149.262 E.02318
G1 X138.182 Y149.262 E.23961
G1 X137.924 Y149.713 E.0267
G1 X133.522 Y149.713 E.22637
G1 X133.522 Y150.163 E.02318
G1 X137.667 Y150.163 E.21312
G1 X137.409 Y150.614 E.0267
G1 X133.522 Y150.614 E.19988
G1 X133.522 Y151.065 E.02318
G1 X137.151 Y151.065 E.18663
G1 X136.894 Y151.516 E.0267
G1 X133.522 Y151.516 E.17339
G1 X133.522 Y151.967 E.02318
G1 X136.636 Y151.967 E.16014
G1 X136.379 Y152.418 E.0267
G1 X133.522 Y152.418 E.1469
G1 X133.522 Y152.869 E.02318
G1 X136.121 Y152.869 E.13365
G1 X135.863 Y153.319 E.0267
G1 X133.509 Y153.319 E.12109
G3 X133.448 Y153.77 I-2.297 J-.08 E.02343
G1 X135.606 Y153.77 E.11097
G1 X135.348 Y154.221 E.0267
G1 X133.38 Y154.221 E.10122
G1 X133.331 Y154.543 E.01672
G1 X133.704 Y154.672 E.02027
G1 X135.324 Y154.672 E.08331
M106 S127.5
G1 X133.811 Y155.56 F30000
; LINE_WIDTH: 0.438627
M106 S255
G1 F3000
G1 X132.458 Y155.56 E.0833
G3 X131.823 Y156.049 I-2.189 J-2.188 E.04948
G1 X134.093 Y156.049 E.13974
G1 X134.237 Y156.166 E.01144
G1 X134.025 Y156.537 E.02635
G1 X125.975 Y156.537 E.49559
G1 X126.254 Y157.026 E.03465
G1 X133.746 Y157.026 E.46121
G3 X133.462 Y157.515 I-5.169 J-2.674 E.0348
G1 X126.538 Y157.515 E.42627
G2 X126.89 Y158.003 I2.157 J-1.183 E.03717
G1 X133.119 Y158.003 E.38349
G3 X132.646 Y158.492 I-3.201 J-2.625 E.04191
G1 X127.363 Y158.492 E.32527
G1 X127.53 Y158.642 E.01383
G1 X128.043 Y158.981 E.03781
G1 X131.95 Y158.981 E.24056
G3 X130.372 Y159.469 I-1.966 J-3.557 E.10242
G1 X128.649 Y159.469 E.10608
M106 S127.5
G1 X128.607 Y156.049 F30000
M106 S255
G1 F3000
G1 X125.914 Y156.049 E.16583
G1 X126.514 Y155.56 E.04764
G1 X127.845 Y155.56 E.08197
M106 S127.5
G1 X126.893 Y154.672 F30000
; LINE_WIDTH: 0.400852
M106 S255
G1 F3000
G1 X124.909 Y154.672 E.10201
G1 X124.652 Y154.221 E.0267
G1 X126.62 Y154.221 E.10123
G1 X126.552 Y153.77 E.02344
G1 X124.394 Y153.77 E.11098
G1 X124.136 Y153.319 E.0267
G1 X126.491 Y153.319 E.1211
G3 X126.478 Y152.869 I4.456 J-.357 E.0232
G1 X123.879 Y152.869 E.13366
G1 X123.621 Y152.418 E.0267
G1 X126.478 Y152.418 E.14691
G1 X126.478 Y151.967 E.02318
G1 X123.363 Y151.967 E.16016
G1 X123.106 Y151.516 E.0267
G1 X126.478 Y151.516 E.17341
G1 X126.478 Y151.065 E.02318
G1 X122.848 Y151.065 E.18665
G1 X122.591 Y150.614 E.0267
G1 X126.478 Y150.614 E.1999
G1 X126.478 Y150.163 E.02318
G1 X122.333 Y150.163 E.21315
G1 X122.075 Y149.713 E.0267
G1 X126.478 Y149.713 E.22639
G1 X126.478 Y149.262 E.02318
G1 X121.818 Y149.262 E.23964
G1 X121.56 Y148.811 E.0267
G1 X126.478 Y148.811 E.25289
G1 X126.478 Y148.36 E.02318
G1 X121.302 Y148.36 E.26613
G1 X121.045 Y147.909 E.0267
G1 X126.478 Y147.909 E.27938
G1 X126.478 Y147.458 E.02318
G1 X120.787 Y147.458 E.29263
G1 X120.529 Y147.008 E.0267
G1 X126.478 Y147.008 E.30587
G1 X126.478 Y146.557 E.02318
G1 X120.272 Y146.557 E.31912
G1 X120.014 Y146.106 E.0267
G1 X126.478 Y146.106 E.33237
G1 X126.478 Y145.655 E.02318
G1 X119.757 Y145.655 E.34561
G1 X119.499 Y145.204 E.0267
G1 X126.478 Y145.204 E.35886
G1 X126.478 Y144.753 E.02318
G1 X119.241 Y144.753 E.37211
G1 X118.984 Y144.302 E.0267
G1 X126.478 Y144.302 E.38536
G1 X126.478 Y143.852 E.02318
G1 X118.726 Y143.852 E.3986
G1 X118.468 Y143.401 E.0267
G1 X126.478 Y143.401 E.41185
G1 X126.478 Y142.95 E.02318
G1 X118.211 Y142.95 E.4251
G1 X117.953 Y142.499 E.0267
G1 X126.478 Y142.499 E.43834
G1 X126.478 Y142.048 E.02318
G1 X117.696 Y142.048 E.45159
G1 X117.438 Y141.597 E.0267
G1 X126.478 Y141.597 E.46484
G1 X126.478 Y141.146 E.02318
G1 X117.18 Y141.146 E.47808
G1 X116.923 Y140.696 E.0267
G1 X126.478 Y140.696 E.49133
G1 X126.478 Y140.245 E.02318
G1 X116.665 Y140.245 E.50458
G1 X116.407 Y139.794 E.0267
G1 X126.49 Y139.794 E.51842
G3 X126.547 Y139.343 I2.296 J.063 E.02341
G1 X116.15 Y139.343 E.53462
G1 X115.892 Y138.892 E.0267
G1 X126.673 Y138.892 E.55435
G3 X126.865 Y138.441 I3.831 J1.359 E.0252
G1 X115.635 Y138.441 E.57743
G1 X115.377 Y137.99 E.0267
G1 X127.146 Y137.99 E.60517
G3 X127.531 Y137.54 I1.688 J1.05 E.03058
G1 X115.119 Y137.54 E.63819
G1 X114.862 Y137.089 E.0267
G1 X128.497 Y137.089 E.70112
M106 S127.5
; WIPE_START
G1 F24000
G1 X126.497 Y137.089 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.217 J.003 P1  F30000
G1 X126.535 Y155.02 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.405093
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X125.358 Y155.428 E.03675
G1 X125.573 Y155.803 E.01274
G1 X126.488 Y155.057 E.03484
; WIPE_START
G1 F24000
G1 X125.573 Y155.803 E-.44862
G1 X125.358 Y155.428 E-.16403
G1 X125.725 Y155.301 E-.14735
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.044 J1.216 P1  F30000
G1 X133.464 Y155.018 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.403627
G1 F15000
G1 X134.43 Y155.8 E.03653
G1 X134.643 Y155.427 E.01262
G1 X133.521 Y155.038 E.03491
G1 X138.425 Y107.333 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.400852
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X121.777 Y107.333 E.85602
G1 X121.777 Y106.882 E.02318
G1 X138.223 Y106.882 E.8456
G1 X138.223 Y106.431 E.02318
G1 X121.777 Y106.431 E.8456
G1 X121.777 Y105.98 E.02318
G1 X138.223 Y105.98 E.8456
G1 X138.223 Y105.529 E.02318
G1 X121.777 Y105.529 E.8456
G1 X121.777 Y105.078 E.02318
G1 X138.223 Y105.078 E.8456
G1 X138.223 Y104.627 E.02318
G1 X121.777 Y104.627 E.8456
G1 X121.777 Y104.177 E.02318
G1 X138.223 Y104.177 E.8456
G1 X138.223 Y103.726 E.02318
G1 X121.777 Y103.726 E.8456
G1 X121.777 Y103.275 E.02318
G1 X138.223 Y103.275 E.8456
G1 X138.223 Y102.824 E.02318
G1 X121.777 Y102.824 E.8456
G1 X121.777 Y102.373 E.02318
G1 X138.223 Y102.373 E.8456
G1 X138.223 Y101.922 E.02318
G1 X121.777 Y101.922 E.8456
G1 X121.777 Y101.471 E.02318
G1 X138.223 Y101.471 E.8456
G1 X138.223 Y101.021 E.02318
G1 X121.777 Y101.021 E.8456
G1 X121.777 Y100.57 E.02318
G1 X138.223 Y100.57 E.8456
G1 X138.223 Y100.119 E.02318
G1 X121.777 Y100.119 E.8456
G1 X121.791 Y99.925 E.01002
G1 X122.048 Y99.668 E.01865
G1 X138.239 Y99.668 E.83251
M106 S127.5
G1 X138.104 Y99.324 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X138.173 Y99.393 E.00273
G1 X139.349 Y105.016 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.349 Y106.645 E.05401
G1 X138.651 Y105.947 E.03271
G1 X138.651 Y103.997 E.06471
G1 X139.349 Y103.299 E.03271
G1 X139.349 Y98.969 E.14365
G1 X136.871 Y96.492 E.11622
G1 X138.48 Y96.492 E.05338
G1 X136.084 Y98.888 E.11244
G1 X131.592 Y98.888 E.14899
G1 X129.195 Y96.491 E.11245
G1 X130.805 Y96.491 E.0534
G1 X128.408 Y98.888 E.11245
G1 X123.916 Y98.888 E.14899
G1 X121.519 Y96.491 E.11247
G1 X123.129 Y96.491 E.05342
G1 X120.651 Y98.969 E.11624
G1 X120.651 Y103.299 E.14365
G1 X121.349 Y103.997 E.03271
M73 P48 R14
G1 X121.349 Y105.947 E.06471
G1 X120.651 Y106.645 E.03271
G1 X120.651 Y105.016 E.05401
G1 X121.784 Y99.436 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X121.854 Y99.366 E.00273
G1 X120.425 Y96.512 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.400852
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X99.791 Y96.512 E1.06099
G1 X100.115 Y96.963 E.02855
G1 X120.223 Y96.963 E1.03392
G1 X120.223 Y97.414 E.02318
G1 X100.439 Y97.414 E1.01725
G1 X100.763 Y97.865 E.02855
G1 X120.223 Y97.865 E1.00058
G1 X120.223 Y98.315 E.02318
G1 X101.064 Y98.315 E.98511
G3 X101.28 Y98.766 I-1.691 J1.089 E.02578
G1 X120.223 Y98.766 E.97399
G1 X120.223 Y99.217 E.02318
G1 X101.416 Y99.217 E.96702
G3 X101.496 Y99.668 I-1.483 J.495 E.02363
G1 X120.223 Y99.668 E.96293
G1 X120.223 Y100.119 E.02318
G1 X101.517 Y100.119 E.96181
G3 X101.474 Y100.57 I-1.748 J.06 E.02335
G1 X120.223 Y100.57 E.96404
G1 X120.223 Y101.021 E.02318
G1 X101.379 Y101.021 E.96891
G3 X101.208 Y101.471 I-1.884 J-.456 E.02486
G1 X120.223 Y101.471 E.9777
G1 X120.223 Y101.922 E.02318
G1 X100.972 Y101.922 E.98982
G3 X100.632 Y102.373 I-2.901 J-1.839 E.0291
G1 X120.223 Y102.373 E1.00735
G1 X120.223 Y102.824 E.02318
G1 X100.151 Y102.824 E1.03205
G3 X99.379 Y103.275 I-2.137 J-2.773 E.04609
G1 X120.223 Y103.275 E1.07175
G1 X120.223 Y103.726 E.02318
G1 X95.797 Y103.726 E1.25593
G1 X95.539 Y103.275 E.0267
G1 X97.254 Y103.275 E.08817
M106 S127.5
; WIPE_START
G1 F24000
G1 X95.539 Y103.275 E-.65162
G1 X95.681 Y103.522 E-.10838
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.197 J.217 P1  F30000
G1 X96.888 Y96.867 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.44347
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X97.042 Y96.615 E.00964
; LINE_WIDTH: 0.480656
G1 F14392.236
G1 X97.066 Y96.577 E.00162
G1 X97.2 Y96.56 E.00483
; LINE_WIDTH: 0.438325
G1 F15000
G1 X97.378 Y96.542 E.00577
; LINE_WIDTH: 0.410914
G1 X97.555 Y96.529 E.00533
; LINE_WIDTH: 0.387195
G1 X98.259 Y96.519 E.01975
; LINE_WIDTH: 0.420458
G1 X98.612 Y96.541 E.01086
; LINE_WIDTH: 0.467958
G1 F14822.222
G1 X98.789 Y96.559 E.00617
; LINE_WIDTH: 0.49959
G1 F13795.522
G1 X98.934 Y96.577 E.00544
G1 X98.946 Y96.596 E.00084
; LINE_WIDTH: 0.443458
G1 F15000
G1 X98.958 Y96.615 E.00074
; LINE_WIDTH: 0.421771
G1 X99.112 Y96.867 E.00911
G1 X99.648 Y96.953 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X99.631 Y96.793 E.00445
G1 X99.513 Y96.607 E.00611
; WIPE_START
G1 F24000
G1 X99.631 Y96.793 E-.4398
G1 X99.648 Y96.953 E-.3202
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.203 J-.183 P1  F30000
G1 X92.887 Y141.437 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X93.132 Y141.409 E.00756
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.369 Y146.054 E.01969
G1 X95.191 Y146.232 E.00774
G1 X94.916 Y146.507 E.01195
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.348 Y146.507 E.01969
G1 X91.073 Y146.232 E.01195
G1 X90.895 Y146.054 E.00774
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.828 Y141.443 E.01029
M204 S10000
G1 X93.37 Y141.005 F30000
M204 S5000
G1 F12000
G1 X93.374 Y141.005 E.00012
G1 X93.773 Y141.045 E.01234
G1 X94.39 Y141.232 E.01981
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
G1 X93.31 Y140.999 E.00551
M204 S10000
; WIPE_START
G1 F24000
G1 X93.374 Y141.005 E-.02428
G1 X93.773 Y141.045 E-.15259
G1 X94.39 Y141.232 E-.24501
G1 X94.959 Y141.536 E-.245
G1 X95.149 Y141.691 E-.09313
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.139 J.428 P1  F30000
G1 X108.532 Y177.294 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X108.776 Y177.266 E.00756
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
G1 X111.354 Y181.369 E.01969
G1 X111.013 Y181.912 E.01969
G1 X110.835 Y182.09 E.00774
G1 X110.56 Y182.365 E.01195
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X106.992 Y182.365 E.01969
G1 X106.717 Y182.09 E.01195
G1 X106.539 Y181.912 E.00774
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.472 Y177.301 E.01029
M204 S10000
G1 X109.014 Y176.862 F30000
M204 S5000
G1 F12000
G1 X109.018 Y176.863 E.00012
G1 X109.418 Y176.902 E.01234
G1 X110.035 Y177.089 E.01981
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X108.955 Y176.856 E.00551
M204 S10000
M106 S214.2
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.018 Y176.863 E-.02428
G1 X109.418 Y176.902 E-.15259
G1 X110.035 Y177.089 E-.24501
G1 X110.604 Y177.393 E-.245
G1 X110.793 Y177.548 E-.09313
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/118
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
G3 Z3 I.238 J1.193 P1  F30000
G1 X166.505 Y166.42 Z3
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X166.769 Y166.391 E.00816
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.006 Y171.036 E.01969
G1 X168.815 Y171.227 E.0083
G1 X168.553 Y171.489 E.01139
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X164.985 Y171.489 E.01969
G1 X164.723 Y171.227 E.01139
G1 X164.532 Y171.036 E.0083
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.445 Y166.427 E.00969
M204 S10000
G1 X167.029 Y165.989 F30000
M204 S5000
G1 F12000
G1 X167.032 Y165.989 E.00008
G1 X167.41 Y166.026 E.01169
G1 X168.027 Y166.213 E.01981
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X166.969 Y165.983 E.00619
M204 S10000
; WIPE_START
G1 F24000
G1 X167.032 Y165.989 E-.02383
G1 X167.41 Y166.026 E-.14456
G1 X168.027 Y166.213 E-.24501
G1 X168.596 Y166.517 E-.24501
G1 X168.803 Y166.687 E-.10159
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.317 J-1.175 P1  F30000
G1 X128.546 Y155.836 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.29 Y155.687 E.00982
G3 X126.848 Y153.047 I1.71 J-2.648 E.10402
G1 X126.848 Y140.031 E.43178
G3 X129.92 Y136.888 I3.154 J.011 E.16127
G3 X133.152 Y140.032 I.071 J3.16 E.16652
G1 X133.152 Y153.047 E.43173
G3 X128.6 Y155.863 I-3.152 J-.008 E.2121
G1 X128.768 Y155.508 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.741 Y155.495 E.00093
G3 X127.24 Y153.042 I1.259 J-2.456 E.09295
G1 X127.24 Y140.037 E.39963
G3 X129.931 Y137.28 I2.762 J.005 E.13097
G3 X132.76 Y140.037 I.061 J2.767 E.13516
G1 X132.76 Y153.042 E.39961
G3 X128.992 Y155.608 I-2.76 J-.003 E.16482
G1 X128.823 Y155.533 E.00568
M204 S10000
; WIPE_START
G1 F24000
G1 X128.741 Y155.495 E-.03425
G1 X128.503 Y155.358 E-.10454
G1 X128.279 Y155.198 E-.10456
G1 X128.073 Y155.015 E-.10456
G1 X127.886 Y154.814 E-.10456
G1 X127.72 Y154.594 E-.10455
G1 X127.576 Y154.36 E-.10456
G1 X127.464 Y154.126 E-.09841
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.089 J-.543 P1  F30000
G1 X98.987 Y97.047 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.004 Y97.052 E.0006
G3 X97.921 Y96.888 I-1.004 J2.988 E.62041
G1 X98.079 Y96.888 E.00521
G3 X98.701 Y96.966 I-.079 J3.151 E.02086
G1 X98.929 Y97.03 E.00783
G1 X98.878 Y97.423 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.879 Y97.423 E.00002
G3 X97.931 Y97.28 I-.879 J2.616 E.50318
G1 X98.069 Y97.28 E.00423
G3 X98.614 Y97.349 I-.069 J2.759 E.01692
G1 X98.821 Y97.407 E.00659
M204 S10000
; WIPE_START
G1 F24000
G1 X98.879 Y97.423 E-.02308
G1 X99.135 Y97.524 E-.10456
G1 X99.38 Y97.649 E-.10456
G1 X99.611 Y97.799 E-.10456
G1 X99.826 Y97.97 E-.10456
G1 X100.023 Y98.162 E-.10456
G1 X100.2 Y98.373 E-.10456
G1 X100.355 Y98.6 E-.10456
G1 X100.361 Y98.612 E-.00501
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.037 J1.216 P1  F30000
G1 X158.866 Y100.371 Z3.2
G1 Z2.8
M73 P49 R14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X158.864 Y100.353 E.0006
G3 X161.921 Y96.888 I3.136 J-.314 E.17206
G1 X162.079 Y96.888 E.00521
G3 X158.911 Y100.664 I-.079 J3.151 E.4692
G1 X158.875 Y100.431 E.00783
G1 X159.254 Y100.315 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M73 P49 R13
G1 X159.254 Y100.314 E.00003
G3 X161.931 Y97.28 I2.746 J-.275 E.13955
G1 X162.069 Y97.28 E.00423
G3 X159.295 Y100.586 I-.069 J2.759 E.38055
G1 X159.263 Y100.375 E.00659
M204 S10000
; WIPE_START
G1 F24000
G1 X159.254 Y100.314 E-.02307
G1 X159.24 Y100.053 E-.09954
G1 X159.271 Y99.628 E-.16175
G1 X159.325 Y99.359 E-.10456
G1 X159.406 Y99.096 E-.10457
G1 X159.513 Y98.842 E-.10455
G1 X159.645 Y98.6 E-.10456
G1 X159.73 Y98.476 E-.05741
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.026 J-1.217 P1  F30000
G1 X93.3 Y97.043 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X95.177 Y96.142 I1.875 J1.5 E.07144
G1 X164.936 Y96.145 E2.31404
G3 X166.909 Y99.736 I-.107 J2.396 E.16293
G1 X133.822 Y157.637 E2.21217
G3 X126.178 Y157.637 I-3.822 J-2.179 E.30726
G1 X93.091 Y99.736 E2.21217
G3 X93.263 Y97.09 I2.084 J-1.193 E.09317
G1 X92.98 Y96.814 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X92.994 Y96.798 E.00065
G3 X95.172 Y95.75 I2.181 J1.745 E.07681
G1 X164.955 Y95.753 E2.14422
G3 X167.252 Y99.926 I-.126 J2.788 E.17538
G1 X134.16 Y157.836 E2.04944
G3 X125.84 Y157.836 I-4.16 J-2.377 E.30966
G1 X92.748 Y99.926 E2.04944
G3 X92.759 Y97.141 I2.427 J-1.383 E.08959
G1 X92.946 Y96.863 E.01028
M204 S10000
; WIPE_START
G1 F24000
G1 X92.994 Y96.798 E-.03081
G1 X93.176 Y96.588 E-.10541
G1 X93.379 Y96.4 E-.10548
G1 X93.717 Y96.158 E-.15793
G1 X94.088 Y95.968 E-.1583
G1 X94.483 Y95.836 E-.15812
G1 X94.596 Y95.816 E-.04396
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.184 J-.28 P1  F30000
G1 X94.013 Y98.287 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.536172
G1 F12772.376
G1 X94.295 Y97.765 E.02387
G1 X94.083 Y99.919 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G3 X94.402 Y98.483 I4.655 J.28 E.04538
G3 X95.078 Y97.428 I3.907 J1.761 E.03865
G1 X95.521 Y97.003 E.01886
G1 X95.641 Y96.911 E.00464
G1 X94.969 Y96.942 E.02068
G1 X94.74 Y96.981 E.00714
G1 X94.276 Y97.192 E.01566
G1 X93.976 Y97.447 E.0121
G1 X93.747 Y97.777 E.01235
G1 X93.58 Y98.243 E.01519
G1 X93.553 Y98.625 E.01178
G2 X93.785 Y99.4 I1.971 J-.168 E.02501
G1 X94.053 Y99.867 E.01656
G1 X94.522 Y100.719 F30000
G1 F15000
G1 X94.46 Y99.891 E.02553
G3 X94.682 Y98.814 I4.644 J.398 E.03385
G3 X95.121 Y97.979 I5.032 J2.114 E.02903
G1 X95.588 Y97.455 E.02156
G1 X96.071 Y97.066 E.01906
G1 X96.298 Y96.941 E.00797
G1 X96.231 Y96.817 E.00433
G3 X96.364 Y96.534 I.627 J.123 E.00972
G1 X95.194 Y96.534 E.03597
G1 X94.678 Y96.597 E.01595
G1 X94.124 Y96.831 E.01849
G1 X93.676 Y97.219 E.01822
G1 X93.396 Y97.639 E.01549
G1 X93.205 Y98.205 E.01834
G1 X93.18 Y98.68 E.01464
G1 X93.289 Y99.195 E.01616
G1 X93.458 Y99.587 E.0131
G1 X94.244 Y100.963 E.04871
G1 X94.381 Y100.734 E.0082
G1 X94.463 Y100.725 E.00254
G1 X94.867 Y101.268 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.596567
G1 F11379.094
G1 X94.73 Y101.629 E.01741
G1 X95.118 Y102.292 E.03464
G1 X95.637 Y102.361 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421701
G1 F15000
G1 X95.216 Y102.782 E.01838
G1 X95.411 Y103.123 E.01212
G1 X95.798 Y102.736 E.01689
G2 X96.11 Y102.959 I1.046 J-1.136 E.01189
G1 X95.606 Y103.464 E.02203
G1 X95.8 Y103.805 E.01212
G1 X96.447 Y103.158 E.02824
G1 X96.824 Y103.317 E.01262
G1 X95.995 Y104.146 E.03618
G1 X96.19 Y104.487 E.01212
G1 X97.236 Y103.44 E.04568
G2 X97.706 Y103.506 I.497 J-1.842 E.01468
G1 X96.385 Y104.828 E.05769
G1 X96.579 Y105.169 E.01212
G1 X98.238 Y103.51 E.0724
G2 X98.872 Y103.412 I-.075 J-2.578 E.01985
G1 X96.774 Y105.509 E.09156
G1 X96.969 Y105.85 E.01212
G1 X106.344 Y96.475 E.40922
G1 X106.88 Y96.475 E.01653
G1 X97.164 Y106.191 E.4241
G1 X97.359 Y106.532 E.01212
G1 X107.415 Y96.475 E.43898
G1 X107.951 Y96.476 E.01653
G1 X97.553 Y106.873 E.45386
G1 X97.748 Y107.214 E.01212
G1 X108.487 Y96.476 E.46874
G1 X109.022 Y96.476 E.01653
G1 X97.943 Y107.555 E.48362
G1 X98.138 Y107.896 E.01212
G1 X109.558 Y96.476 E.4985
G1 X110.094 Y96.476 E.01653
G1 X98.333 Y108.237 E.51338
G1 X98.527 Y108.577 E.01212
G1 X110.629 Y96.476 E.52825
G1 X111.165 Y96.476 E.01653
G1 X98.722 Y108.918 E.54313
G1 X98.917 Y109.259 E.01212
G1 X111.701 Y96.476 E.55801
G1 X112.236 Y96.476 E.01653
G1 X99.112 Y109.6 E.57289
G1 X99.307 Y109.941 E.01212
G1 X112.772 Y96.476 E.58777
G1 X113.307 Y96.476 E.01653
G1 X99.501 Y110.282 E.60265
G1 X99.696 Y110.623 E.01212
G1 X113.843 Y96.476 E.61753
G1 X114.379 Y96.476 E.01653
G1 X99.891 Y110.964 E.63241
G1 X100.086 Y111.304 E.01212
G1 X114.914 Y96.476 E.64729
G1 X115.45 Y96.476 E.01653
G1 X100.281 Y111.645 E.66217
G1 X100.475 Y111.986 E.01212
G1 X115.986 Y96.476 E.67704
G1 X116.521 Y96.476 E.01653
G1 X100.67 Y112.327 E.69192
G1 X100.865 Y112.668 E.01212
G1 X117.057 Y96.476 E.7068
G1 X117.593 Y96.476 E.01653
G1 X101.06 Y113.009 E.72168
G1 X101.254 Y113.35 E.01212
G1 X118.128 Y96.476 E.73656
G1 X118.664 Y96.476 E.01653
G1 X101.449 Y113.691 E.75144
G1 X101.644 Y114.032 E.01212
G1 X119.2 Y96.476 E.76632
G1 X119.735 Y96.476 E.01653
G1 X101.839 Y114.372 E.7812
G1 X102.034 Y114.713 E.01212
G1 X120.259 Y96.488 E.79556
G1 X120.259 Y97.023 E.01653
G1 X102.228 Y115.054 E.78706
G1 X102.423 Y115.395 E.01212
G1 X120.259 Y97.559 E.77856
G1 X120.259 Y98.095 E.01653
G1 X102.618 Y115.736 E.77005
G1 X102.813 Y116.077 E.01212
G1 X120.259 Y98.63 E.76155
G1 X120.259 Y99.166 E.01653
G1 X103.008 Y116.418 E.75305
G1 X103.202 Y116.759 E.01212
G1 X120.259 Y99.702 E.74455
G1 X120.259 Y100.238 E.01653
G1 X103.397 Y117.1 E.73604
G1 X103.592 Y117.44 E.01212
G1 X120.259 Y100.773 E.72754
G1 X120.259 Y101.309 E.01653
G1 X103.787 Y117.781 E.71904
G1 X103.982 Y118.122 E.01212
G1 X120.259 Y101.845 E.71053
G1 X120.259 Y102.38 E.01653
G1 X104.176 Y118.463 E.70203
G1 X104.371 Y118.804 E.01212
G1 X120.259 Y102.916 E.69353
G1 X120.259 Y103.452 E.01653
G1 X104.566 Y119.145 E.68503
G1 X104.761 Y119.486 E.01212
G1 X120.259 Y103.987 E.67652
G1 X120.259 Y104.523 E.01653
G1 X104.956 Y119.827 E.66802
G1 X105.15 Y120.168 E.01212
G1 X120.259 Y105.059 E.65952
G1 X120.259 Y105.594 E.01653
G1 X105.345 Y120.508 E.65101
G1 X105.54 Y120.849 E.01212
G1 X120.259 Y106.13 E.64251
G1 X120.259 Y106.666 E.01653
G1 X105.735 Y121.19 E.63401
G1 X105.929 Y121.531 E.01212
G1 X120.259 Y107.201 E.62551
G1 X120.259 Y107.737 E.01653
G1 X106.124 Y121.872 E.617
G1 X106.319 Y122.213 E.01212
G1 X120.751 Y107.78 E.62999
G1 X121.287 Y107.78 E.01653
G1 X106.39 Y122.678 E.6503
G1 X112.818 Y133.927 F30000
G1 F15000
G1 X138.965 Y107.78 E1.14134
G1 X138.429 Y107.78 E.01653
G1 X112.747 Y133.462 E1.12103
G1 X112.552 Y133.121 E.01212
G1 X138.259 Y107.414 E1.12213
G1 X138.259 Y106.879 E.01653
G1 X112.358 Y132.78 E1.13063
G1 X112.163 Y132.439 E.01212
G1 X138.259 Y106.343 E1.13913
G1 X138.259 Y105.807 E.01653
G1 X111.968 Y132.099 E1.14763
G1 X111.773 Y131.758 E.01212
G1 X138.259 Y105.272 E1.15614
G1 X138.259 Y104.736 E.01653
G1 X111.578 Y131.417 E1.16464
G1 X111.384 Y131.076 E.01212
G1 X138.259 Y104.2 E1.17314
G1 X138.259 Y103.665 E.01653
G1 X111.189 Y130.735 E1.18165
G1 X110.994 Y130.394 E.01212
G1 X138.259 Y103.129 E1.19015
G1 X138.259 Y102.593 E.01653
G1 X110.799 Y130.053 E1.19865
G1 X110.604 Y129.712 E.01212
G1 X138.259 Y102.058 E1.20715
G1 X138.259 Y101.522 E.01653
G1 X110.41 Y129.371 E1.21566
G1 X110.215 Y129.031 E.01212
G1 X138.259 Y100.986 E1.22416
G1 X138.259 Y100.451 E.01653
G1 X110.02 Y128.69 E1.23266
G1 X109.825 Y128.349 E.01212
G1 X138.249 Y99.925 E1.2407
G2 X138.153 Y99.817 I-.179 J.061 E.00459
G1 X138.153 Y99.486 E.01023
G1 X109.631 Y128.008 E1.24502
G1 X109.436 Y127.667 E.01212
G1 X137.719 Y99.383 E1.2346
G2 X137.589 Y99.28 I-.19 J.106 E.00527
G1 X137.287 Y99.28 E.00932
G1 X109.241 Y127.326 E1.22422
G1 X109.046 Y126.985 E.01212
G1 X136.751 Y99.28 E1.20934
G1 X136.215 Y99.28 E.01653
G1 X108.851 Y126.644 E1.19446
G1 X108.657 Y126.303 E.01212
G1 X135.68 Y99.28 E1.17958
G1 X135.144 Y99.28 E.01653
G1 X108.462 Y125.963 E1.1647
G1 X108.267 Y125.622 E.01212
G1 X134.608 Y99.28 E1.14982
G1 X134.073 Y99.28 E.01653
G1 X108.072 Y125.281 E1.13494
G1 X107.877 Y124.94 E.01212
G1 X133.537 Y99.28 E1.12006
G1 X133.001 Y99.28 E.01653
G1 X107.683 Y124.599 E1.10518
G1 X107.488 Y124.258 E.01212
G1 X132.466 Y99.28 E1.0903
G1 X131.93 Y99.28 E.01653
G1 X107.293 Y123.917 E1.07542
G1 X107.098 Y123.576 E.01212
G1 X131.394 Y99.28 E1.06054
G1 X130.859 Y99.28 E.01653
G1 X106.903 Y123.235 E1.04566
G1 X106.709 Y122.895 E.01212
G1 X130.323 Y99.28 E1.03078
G1 X129.787 Y99.28 E.01653
G1 X121.741 Y107.327 E.35123
G1 X121.741 Y106.791 E.01653
G1 X129.251 Y99.28 E.32785
G1 X128.716 Y99.28 E.01653
G1 X121.741 Y106.255 E.30447
G1 X121.741 Y105.72 E.01653
G1 X128.18 Y99.28 E.28108
G1 X127.644 Y99.28 E.01653
G1 X121.741 Y105.184 E.2577
G1 X121.741 Y104.648 E.01653
G1 X127.109 Y99.28 E.23432
G1 X126.573 Y99.28 E.01653
G1 X121.741 Y104.113 E.21094
G1 X121.741 Y103.577 E.01653
G1 X126.037 Y99.28 E.18755
G1 X125.502 Y99.28 E.01653
G1 X121.741 Y103.041 E.16417
G1 X121.741 Y102.506 E.01653
G1 X124.966 Y99.28 E.14079
G1 X124.43 Y99.28 E.01653
G1 X121.741 Y101.97 E.11741
G1 X121.741 Y101.434 E.01653
G1 X123.895 Y99.28 E.09402
G1 X123.359 Y99.28 E.01653
G1 X121.741 Y100.899 E.07064
G1 X121.741 Y100.363 E.01653
G1 X122.823 Y99.28 E.04726
G1 X122.411 Y99.28 E.01272
G2 X122.277 Y99.387 I.061 J.215 E.00542
G1 X122.181 Y99.387 E.00297
G1 X121.571 Y99.997 E.02663
G1 X120.651 Y105.016 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X120.651 Y106.645 E.05401
G1 X121.349 Y105.947 E.03271
G1 X121.349 Y103.997 E.06471
G1 X120.651 Y103.299 E.03271
G1 X120.651 Y98.969 E.14365
G1 X123.129 Y96.491 E.11624
G1 X121.519 Y96.491 E.05341
G1 X123.916 Y98.888 E.11246
M73 P50 R13
G1 X128.408 Y98.888 E.14899
G1 X130.805 Y96.491 E.11244
G1 X129.195 Y96.491 E.05339
G1 X131.592 Y98.888 E.11245
G1 X136.084 Y98.888 E.14899
G1 X138.48 Y96.492 E.11243
G1 X136.872 Y96.492 E.05337
G1 X139.349 Y98.969 E.11621
G1 X139.349 Y103.299 E.14365
G1 X138.651 Y103.997 E.03271
G1 X138.651 Y105.947 E.06471
G1 X139.349 Y106.645 E.03271
G1 X139.349 Y105.016 E.05401
G1 X140.26 Y96.307 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421701
G1 F15000
G1 X139.741 Y96.826 E.02266
G1 X139.741 Y97.362 E.01653
G1 X140.626 Y96.477 E.03864
G1 X141.162 Y96.477 E.01653
G1 X139.741 Y97.898 E.06202
G1 X139.741 Y98.433 E.01653
G1 X141.697 Y96.477 E.0854
G1 X142.233 Y96.477 E.01653
G1 X139.741 Y98.969 E.10878
G1 X139.741 Y99.505 E.01653
G1 X142.769 Y96.477 E.13217
G1 X143.304 Y96.477 E.01653
G1 X139.741 Y100.04 E.15555
G1 X139.741 Y100.576 E.01653
G1 X143.84 Y96.477 E.17893
G1 X144.376 Y96.477 E.01653
G1 X139.741 Y101.112 E.20231
G1 X139.741 Y101.647 E.01653
G1 X144.911 Y96.477 E.22569
G1 X145.447 Y96.477 E.01653
G1 X139.741 Y102.183 E.24907
G1 X139.741 Y102.719 E.01653
G1 X145.982 Y96.477 E.27246
G1 X146.518 Y96.477 E.01653
G1 X139.741 Y103.254 E.29584
G1 X139.741 Y103.79 E.01653
G1 X147.054 Y96.477 E.31922
G1 X147.589 Y96.477 E.01653
G1 X139.741 Y104.326 E.3426
G1 X139.741 Y104.861 E.01653
G1 X148.125 Y96.477 E.36598
G1 X148.661 Y96.477 E.01653
G1 X139.741 Y105.397 E.38937
G1 X139.741 Y105.933 E.01653
G1 X149.196 Y96.477 E.41275
G1 X149.732 Y96.477 E.01653
G1 X139.741 Y106.469 E.43613
G1 X139.741 Y107.004 E.01653
G1 X150.268 Y96.477 E.45951
G1 X150.803 Y96.477 E.01653
G1 X113.137 Y134.144 E1.64418
G1 X113.332 Y134.485 E.01212
G1 X151.339 Y96.477 E1.65906
G1 X151.875 Y96.477 E.01653
G1 X113.526 Y134.826 E1.67394
G1 X113.721 Y135.166 E.01212
G1 X152.41 Y96.477 E1.68882
G1 X152.946 Y96.477 E.01653
G1 X113.916 Y135.507 E1.7037
G1 X114.111 Y135.848 E.01212
G1 X153.482 Y96.477 E1.71858
G1 X154.017 Y96.477 E.01653
G1 X114.306 Y136.189 E1.73345
G1 X114.5 Y136.53 E.01212
G1 X154.553 Y96.477 E1.74833
G1 X155.089 Y96.477 E.01653
G1 X114.695 Y136.871 E1.76321
G1 X114.89 Y137.212 E.01212
G1 X155.624 Y96.477 E1.77809
G1 X156.16 Y96.477 E.01653
G1 X115.085 Y137.553 E1.79297
G1 X115.28 Y137.894 E.01212
G1 X156.696 Y96.477 E1.80785
G1 X157.231 Y96.478 E.01653
G1 X115.474 Y138.234 E1.82273
G1 X115.669 Y138.575 E.01212
G1 X157.767 Y96.478 E1.83761
G1 X158.303 Y96.478 E.01653
G1 X115.864 Y138.916 E1.85249
G1 X116.059 Y139.257 E.01212
G1 X158.838 Y96.478 E1.86737
G1 X159.374 Y96.478 E.01653
G1 X116.253 Y139.598 E1.88224
G1 X116.448 Y139.939 E.01212
G1 X159.91 Y96.478 E1.89712
G1 X160.445 Y96.478 E.01653
G1 X116.643 Y140.28 E1.912
G1 X116.838 Y140.621 E.01212
G1 X158.807 Y98.652 E1.83198
G2 X158.573 Y99.421 I3.262 J1.411 E.02487
G1 X117.033 Y140.962 E1.81327
G1 X117.227 Y141.302 E.01212
G1 X158.517 Y100.013 E1.80232
G2 X158.551 Y100.515 I3.867 J-.008 E.01554
G1 X117.422 Y141.643 E1.7953
G1 X117.617 Y141.984 E.01212
G1 X158.642 Y100.96 E1.79076
G2 X158.776 Y101.361 I2.072 J-.47 E.01309
G1 X117.812 Y142.325 E1.78812
G1 X118.007 Y142.666 E.01212
G1 X158.949 Y101.724 E1.78717
G2 X159.156 Y102.052 I1.743 J-.873 E.012
G1 X118.201 Y143.007 E1.78773
G1 X118.396 Y143.348 E.01212
G1 X159.394 Y102.35 E1.7896
G2 X159.661 Y102.619 I1.477 J-1.198 E.01171
G1 X118.591 Y143.689 E1.79274
G1 X118.786 Y144.029 E.01212
G1 X159.957 Y102.859 E1.79715
G2 X160.283 Y103.068 I1.211 J-1.524 E.01198
G1 X118.981 Y144.37 E1.80287
G1 X119.175 Y144.711 E.01212
G1 X160.641 Y103.246 E1.81
G2 X161.034 Y103.388 I.907 J-1.895 E.01294
G1 X119.246 Y145.177 E1.82411
G1 X128.178 Y159.279 F30000
G1 F15000
G1 X131.12 Y156.336 E.12845
G3 X130.43 Y156.491 I-1.027 J-2.967 E.02188
G1 X127.953 Y158.968 E.10812
G1 X127.631 Y158.754 E.01193
G1 X129.866 Y156.519 E.09754
G3 X129.38 Y156.469 I.254 J-4.887 E.01508
G1 X127.334 Y158.515 E.0893
G3 X127.054 Y158.26 I.898 J-1.27 E.01173
G1 X128.953 Y156.361 E.0829
G3 X128.566 Y156.212 I.549 J-2.008 E.01282
G1 X126.805 Y157.973 E.07686
G1 X126.59 Y157.653 E.01191
G1 X128.214 Y156.029 E.07089
G3 X127.893 Y155.813 I.916 J-1.708 E.01193
G1 X126.383 Y157.324 E.06595
G1 X126.188 Y156.983 E.01212
G1 X127.603 Y155.568 E.06178
G3 X127.342 Y155.294 I1.24 J-1.443 E.01171
G1 X125.993 Y156.642 E.05887
G1 X125.798 Y156.301 E.01212
G1 X127.111 Y154.989 E.0573
G3 X126.912 Y154.652 I1.585 J-1.162 E.01209
G1 X125.603 Y155.96 E.05712
G1 X125.409 Y155.62 E.01212
G1 X126.747 Y154.281 E.05841
G3 X126.62 Y153.873 I1.977 J-.841 E.01322
G1 X125.214 Y155.279 E.06136
G1 X125.019 Y154.938 E.01212
G1 X126.536 Y153.42 E.06624
G3 X126.515 Y152.907 I6.294 J-.524 E.01588
G1 X124.824 Y154.597 E.07379
G1 X124.63 Y154.256 E.01212
G1 X126.515 Y152.371 E.08229
G1 X126.515 Y151.835 E.01653
G1 X124.435 Y153.915 E.09079
G1 X124.24 Y153.574 E.01212
G1 X126.515 Y151.3 E.09929
G1 X126.515 Y150.764 E.01653
G1 X124.045 Y153.233 E.1078
G1 X123.85 Y152.893 E.01212
G1 X126.515 Y150.228 E.1163
G1 X126.515 Y149.693 E.01653
G1 X123.656 Y152.552 E.1248
G1 X123.461 Y152.211 E.01212
G1 X126.515 Y149.157 E.13331
G1 X126.515 Y148.621 E.01653
G1 X123.266 Y151.87 E.14181
G1 X123.071 Y151.529 E.01212
G1 X126.515 Y148.085 E.15031
G1 X126.515 Y147.55 E.01653
G1 X122.876 Y151.188 E.15881
G1 X122.682 Y150.847 E.01212
G1 X126.515 Y147.014 E.16732
G1 X126.515 Y146.478 E.01653
G1 X122.487 Y150.506 E.17582
G1 X122.292 Y150.165 E.01212
G1 X126.515 Y145.943 E.18432
G1 X126.515 Y145.407 E.01653
G1 X122.097 Y149.825 E.19283
G1 X121.902 Y149.484 E.01212
G1 X126.515 Y144.871 E.20133
G1 X126.515 Y144.336 E.01653
G1 X121.708 Y149.143 E.20983
G1 X121.513 Y148.802 E.01212
G1 X126.515 Y143.8 E.21833
G1 X126.515 Y143.264 E.01653
G1 X121.318 Y148.461 E.22684
G1 X121.123 Y148.12 E.01212
G1 X126.515 Y142.729 E.23534
G1 X126.515 Y142.193 E.01653
G1 X120.928 Y147.779 E.24384
G1 X120.734 Y147.438 E.01212
G1 X126.515 Y141.657 E.25235
G1 X126.515 Y141.122 E.01653
G1 X120.539 Y147.097 E.26085
G1 X120.344 Y146.757 E.01212
G1 X126.515 Y140.586 E.26935
G1 X126.515 Y140.05 E.01653
G1 X120.149 Y146.416 E.27785
G1 X119.955 Y146.075 E.01212
G1 X126.566 Y139.463 E.28859
G1 X126.584 Y139.345 E.0037
G1 X126.724 Y138.846 E.016
G1 X126.787 Y138.706 E.00472
G1 X119.76 Y145.734 E.30676
G1 X119.565 Y145.393 E.01212
G1 X161.475 Y103.483 E1.82942
G2 X161.972 Y103.522 I.443 J-2.463 E.01541
G1 X128.675 Y136.819 E1.45347
G3 X129.423 Y136.606 I1.663 J4.423 E.02406
G1 X162.552 Y103.478 E1.44608
G2 X163.292 Y103.273 I-.563 J-3.475 E.02377
G1 X130.008 Y136.557 E1.4529
G3 X130.506 Y136.594 I.064 J2.507 E.01546
G1 X164.594 Y102.507 E1.48795
G1 X164.849 Y102.662 E.00923
G1 X164.683 Y102.954 E.01036
G1 X130.95 Y136.686 E1.47245
G3 X131.345 Y136.827 I-.506 J2.043 E.01296
G1 X163.969 Y104.203 E1.42405
G1 X163.255 Y105.453 E.04443
G1 X131.704 Y137.003 E1.3772
G3 X132.031 Y137.212 I-.879 J1.739 E.01199
G1 X162.541 Y106.703 E1.33176
G1 X161.827 Y107.952 E.04443
G1 X132.328 Y137.451 E1.28763
G3 X132.596 Y137.719 I-1.205 J1.472 E.01171
G1 X161.113 Y109.202 E1.24477
G1 X160.398 Y110.452 E.04443
G1 X132.835 Y138.016 E1.20319
G3 X133.043 Y138.343 I-1.53 J1.206 E.01199
G1 X159.684 Y111.702 E1.16291
G1 X158.97 Y112.951 E.04443
G1 X133.219 Y138.703 E1.12409
G3 X133.354 Y139.103 I-1.931 J.878 E.01306
G1 X158.256 Y114.201 E1.087
G1 X157.542 Y115.451 E.04443
G1 X133.447 Y139.547 E1.0518
G3 X133.485 Y140.043 I-4.752 J.62 E.01539
G1 X156.828 Y116.701 E1.01894
G1 X156.114 Y117.95 E.04443
G1 X133.485 Y140.579 E.98777
G1 X133.485 Y141.115 E.01653
G1 X155.4 Y119.2 E.9566
G1 X154.686 Y120.45 E.04443
G1 X133.485 Y141.65 E.92543
G1 X133.485 Y142.186 E.01653
G1 X153.972 Y121.7 E.89426
G1 X153.258 Y122.949 E.04443
G1 X133.485 Y142.722 E.86309
G1 X133.485 Y143.258 E.01653
G1 X152.544 Y124.199 E.83192
G1 X151.83 Y125.449 E.04443
G1 X133.485 Y143.793 E.80075
G1 X133.485 Y144.329 E.01653
G1 X151.116 Y126.698 E.76959
G1 X150.402 Y127.948 E.04443
G1 X133.485 Y144.865 E.73842
G1 X133.485 Y145.4 E.01653
G1 X149.688 Y129.198 E.70725
G1 X148.974 Y130.448 E.04443
G1 X133.485 Y145.936 E.67608
G1 X133.485 Y146.472 E.01653
G1 X148.26 Y131.697 E.64491
G1 X147.546 Y132.947 E.04443
G1 X133.485 Y147.007 E.61374
G1 X133.485 Y147.543 E.01653
G1 X146.831 Y134.197 E.58257
G1 X146.117 Y135.447 E.04443
G1 X133.485 Y148.079 E.5514
G1 X133.485 Y148.614 E.01653
G1 X145.403 Y136.696 E.52023
G1 X144.689 Y137.946 E.04443
G1 X133.485 Y149.15 E.48906
M73 P51 R13
G1 X133.485 Y149.686 E.01653
G1 X143.975 Y139.196 E.45789
G1 X143.261 Y140.445 E.04443
G1 X133.485 Y150.221 E.42673
G1 X133.485 Y150.757 E.01653
G1 X142.547 Y141.695 E.39556
G1 X141.833 Y142.945 E.04443
G1 X133.485 Y151.293 E.36439
G1 X133.485 Y151.828 E.01653
G1 X141.119 Y144.195 E.33322
G1 X140.405 Y145.444 E.04443
G1 X133.485 Y152.364 E.30205
G1 X133.485 Y152.9 E.01653
G1 X139.691 Y146.694 E.27088
G1 X138.977 Y147.944 E.04443
G1 X133.457 Y153.464 E.24095
G3 X133.298 Y154.159 I-3.674 J-.476 E.02204
G1 X138.263 Y149.194 E.21673
G1 X137.549 Y150.443 E.04443
G1 X128.686 Y159.306 E.38685
G2 X129.103 Y159.425 I.817 J-2.061 E.01339
G1 X136.835 Y151.693 E.33751
G1 X136.121 Y152.943 E.04443
G1 X129.563 Y159.5 E.28623
G2 X130.079 Y159.52 I.362 J-2.614 E.01594
G1 X135.407 Y154.192 E.23257
G1 X134.693 Y155.442 E.04443
G1 X130.665 Y159.47 E.17581
G2 X131.394 Y159.276 I-.957 J-5.08 E.0233
G1 X133.979 Y156.692 E.11282
G1 X133.537 Y157.465 E.02748
G3 X133.069 Y158.126 I-3.586 J-2.042 E.02502
G3 X132.039 Y159.167 I-24.515 J-23.223 E.04521
G1 X164.882 Y102.292 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.585717
G1 F11606.552
G1 X165.27 Y101.629 E.03396
G1 X165.133 Y101.268 E.01707
G1 X165.675 Y97.715 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.550931
G1 F12401.318
G3 X165.934 Y98.164 I-1.205 J.996 E.02156
G1 X165.905 Y99.936 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X166.27 Y99.296 E.02263
G1 X166.419 Y98.853 E.01438
G1 X166.449 Y98.545 E.00949
G1 X166.37 Y98.044 E.01558
G1 X166.201 Y97.68 E.01234
G1 X165.949 Y97.371 E.01225
G1 X165.632 Y97.134 E.01218
G1 X165.223 Y96.974 E.01349
G2 X164.358 Y96.914 I-.614 J2.59 E.02678
G1 X164.966 Y97.478 E.02548
G3 X165.754 Y98.906 I-4.023 J3.151 E.05036
G1 X165.894 Y99.593 E.02154
G1 X165.903 Y99.876 E.00868
G1 X165.458 Y100.724 F30000
G1 F15000
G1 X165.618 Y100.738 E.00494
G1 X165.751 Y100.966 E.0081
G1 X166.614 Y99.455 E.05346
G1 X166.786 Y98.978 E.01557
G1 X166.824 Y98.581 E.01225
G1 X166.758 Y97.992 E.01821
G1 X166.501 Y97.452 E.01837
G1 X166.184 Y97.076 E.01511
G1 X165.787 Y96.79 E.01504
G1 X165.336 Y96.61 E.01492
G1 X164.861 Y96.537 E.01476
G1 X163.627 Y96.537 E.03793
G1 X163.76 Y96.824 E.00974
G1 X163.698 Y96.936 E.00394
G1 X164.195 Y97.257 E.01818
G1 X164.703 Y97.747 E.02168
G3 X165.389 Y99.002 I-3.815 J2.903 E.04412
G1 X165.524 Y99.668 E.02087
G1 X165.528 Y100.374 E.02168
G1 X165.47 Y100.666 E.00914
G1 X163.112 Y96.867 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.421753
G1 F15000
G1 X162.958 Y96.615 E.00911
; LINE_WIDTH: 0.443438
G1 X162.946 Y96.596 E.00074
; LINE_WIDTH: 0.499586
G1 F13795.641
G1 X162.934 Y96.577 E.00084
G1 X162.789 Y96.559 E.00544
; LINE_WIDTH: 0.46796
G1 F14822.136
G1 X162.612 Y96.541 E.00617
; LINE_WIDTH: 0.420458
G1 F15000
G1 X162.259 Y96.519 E.01086
; LINE_WIDTH: 0.387195
G1 X161.555 Y96.529 E.01975
; LINE_WIDTH: 0.410918
G1 X161.378 Y96.542 E.00532
; LINE_WIDTH: 0.438325
G1 X161.2 Y96.56 E.00577
; LINE_WIDTH: 0.480664
G1 F14391.984
G1 X161.066 Y96.577 E.00483
G1 X161.042 Y96.615 E.00162
; LINE_WIDTH: 0.443444
G1 F15000
G1 X160.888 Y96.867 E.00963
G1 X101.119 Y101.165 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421701
G1 F15000
G1 X105.808 Y96.475 E.2047
G1 X105.273 Y96.475 E.01653
G1 X101.472 Y100.276 E.16591
G2 X101.469 Y99.743 I-2.128 J-.256 E.0165
G1 X104.737 Y96.475 E.14264
G1 X104.201 Y96.475 E.01653
G1 X101.393 Y99.283 E.12257
G2 X101.277 Y98.864 I-1.732 J.255 E.01347
G1 X103.666 Y96.475 E.10426
G1 X103.13 Y96.475 E.01653
G1 X101.113 Y98.492 E.08802
G2 X100.922 Y98.148 I-1.237 J.464 E.0122
G1 X102.594 Y96.475 E.07301
G1 X102.059 Y96.475 E.01653
G1 X100.698 Y97.836 E.05941
G2 X100.444 Y97.555 I-1.25 J.873 E.01174
G1 X101.523 Y96.475 E.04712
G1 X100.987 Y96.475 E.01653
G1 X100.154 Y97.309 E.03638
G2 X99.838 Y97.089 I-.888 J.937 E.01192
G1 X100.452 Y96.475 E.02677
G1 X99.916 Y96.475 E.01653
G1 X99.365 Y97.026 E.02405
G1 X99.112 Y96.867 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.421754
G1 F15000
G1 X98.958 Y96.615 E.00911
; LINE_WIDTH: 0.443442
G1 X98.946 Y96.596 E.00074
; LINE_WIDTH: 0.499588
G1 F13795.596
G1 X98.934 Y96.577 E.00084
G1 X98.789 Y96.559 E.00544
; LINE_WIDTH: 0.46796
G1 F14822.136
G1 X98.612 Y96.541 E.00617
; LINE_WIDTH: 0.420458
G1 F15000
G1 X98.259 Y96.519 E.01086
; LINE_WIDTH: 0.387195
G1 X97.555 Y96.529 E.01975
; LINE_WIDTH: 0.410914
G1 X97.378 Y96.542 E.00533
; LINE_WIDTH: 0.438329
G1 X97.2 Y96.56 E.00577
; LINE_WIDTH: 0.480664
G1 F14391.984
G1 X97.066 Y96.577 E.00483
G1 X97.042 Y96.615 E.00162
; LINE_WIDTH: 0.443444
G1 F15000
G1 X96.888 Y96.867 E.00963
; WIPE_START
G1 F24000
G1 X97.042 Y96.615 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.212 J-.113 P1  F30000
G1 X92.868 Y141.439 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X93.132 Y141.409 E.00816
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.369 Y146.054 E.01969
G1 X95.178 Y146.245 E.0083
G1 X94.916 Y146.507 E.01139
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.348 Y146.507 E.01969
G1 X91.086 Y146.245 E.01139
G1 X90.895 Y146.054 E.0083
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.808 Y141.445 E.00969
M204 S10000
G1 X93.392 Y141.007 F30000
M204 S5000
G1 F12000
G1 X93.395 Y141.007 E.00008
G1 X93.773 Y141.045 E.01169
G1 X94.39 Y141.232 E.01981
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
G1 X93.332 Y141.001 E.00619
M204 S10000
; WIPE_START
G1 F24000
G1 X93.395 Y141.007 E-.02383
G1 X93.773 Y141.045 E-.14456
G1 X94.39 Y141.232 E-.24501
G1 X94.959 Y141.536 E-.245
G1 X95.166 Y141.705 E-.10159
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.139 J.427 P1  F30000
G1 X108.512 Y177.296 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X108.776 Y177.266 E.00816
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
G1 X111.354 Y181.369 E.01969
G1 X111.013 Y181.912 E.01969
G1 X110.822 Y182.103 E.0083
G1 X110.56 Y182.365 E.01139
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X106.992 Y182.365 E.01969
G1 X106.73 Y182.103 E.01139
G1 X106.539 Y181.912 E.0083
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.453 Y177.303 E.00969
M204 S10000
G1 X109.037 Y176.864 F30000
M204 S5000
G1 F12000
G1 X109.039 Y176.865 E.00008
G1 X109.418 Y176.902 E.01169
G1 X110.035 Y177.089 E.01981
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X108.977 Y176.858 E.00619
M204 S10000
M106 S188.7
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.039 Y176.865 E-.02383
G1 X109.418 Y176.902 E-.14456
G1 X110.035 Y177.089 E-.24501
G1 X110.604 Y177.393 E-.245
G1 X110.81 Y177.563 E-.10159
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/118
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
G3 Z3.2 I.239 J1.193 P1  F30000
G1 X166.485 Y166.423 Z3.2
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X166.769 Y166.391 E.00876
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.006 Y171.036 E.01969
G1 X168.802 Y171.24 E.00886
G1 X168.553 Y171.489 E.01083
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X164.985 Y171.489 E.01969
G1 X164.736 Y171.24 E.01083
G1 X164.532 Y171.036 E.00886
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.426 Y166.429 E.00908
M204 S10000
G1 X167.051 Y165.991 F30000
M204 S5000
G1 F12000
G1 X167.053 Y165.991 E.00004
G1 X167.41 Y166.026 E.01104
G1 X168.027 Y166.213 E.01981
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X166.992 Y165.985 E.00688
M204 S10000
; WIPE_START
G1 F24000
G1 X167.053 Y165.991 E-.02333
G1 X167.41 Y166.026 E-.13654
G1 X168.027 Y166.213 E-.24501
G1 X168.596 Y166.517 E-.24501
G1 X168.82 Y166.701 E-.11011
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.327 J-1.172 P1  F30000
G1 X128.788 Y155.517 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X128.741 Y155.495 E.00159
G3 X127.24 Y153.042 I1.259 J-2.456 E.09295
G1 X127.24 Y140.037 E.39962
G3 X129.931 Y137.28 I2.762 J.005 E.13099
G3 X132.76 Y140.037 I.061 J2.767 E.13514
G1 X132.76 Y153.042 E.39961
G3 X128.992 Y155.608 I-2.76 J-.003 E.16482
G1 X128.843 Y155.542 E.00502
M204 S10000
; WIPE_START
G1 F24000
G1 X128.741 Y155.495 E-.04249
G1 X128.503 Y155.358 E-.10454
G1 X128.279 Y155.198 E-.10456
G1 X128.073 Y155.016 E-.10456
G1 X127.886 Y154.814 E-.10457
G1 X127.72 Y154.594 E-.10455
G1 X127.576 Y154.36 E-.10457
G1 X127.473 Y154.146 E-.09017
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.217 J.028 P1  F30000
G1 X128.578 Y106.618 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X131.422 Y106.617 E.09434
G1 X131.422 Y107.962 E.0446
G1 X128.578 Y107.962 E.09435
G1 X128.578 Y106.678 E.0426
; WIPE_START
G1 F24000
G1 X130.577 Y106.635 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.832 J-.888 P1  F30000
G1 X120.078 Y96.803 Z3.4
G1 Z3
G1 E.8 F1800
G1 F15476.087
G1 X120.078 Y96.142 E.02194
G1 X139.922 Y96.142 E.65828
G1 X139.922 Y107.962 E.3921
G1 X138.078 Y107.962 E.06118
G1 X138.078 Y99.462 E.28196
G1 X121.922 Y99.462 E.53591
G1 X121.922 Y107.962 E.28196
G1 X120.078 Y107.962 E.06118
G1 X120.078 Y96.863 E.36817
; WIPE_START
G1 F24000
G1 X120.078 Y96.142 E-.27409
G1 X121.356 Y96.142 E-.48591
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.133 J1.21 P1  F30000
G1 X159.254 Y100.315 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X159.254 Y100.314 E.00003
G3 X161.931 Y97.28 I2.746 J-.275 E.13955
G1 X162.069 Y97.28 E.00423
G3 X159.295 Y100.586 I-.069 J2.759 E.38055
G1 X159.263 Y100.375 E.00658
M204 S10000
; WIPE_START
G1 F24000
G1 X159.254 Y100.314 E-.02314
G1 X159.24 Y100.044 E-.10288
G1 X159.271 Y99.628 E-.15843
G1 X159.325 Y99.359 E-.10456
G1 X159.406 Y99.096 E-.10456
G1 X159.513 Y98.842 E-.10456
G1 X159.645 Y98.6 E-.10456
G1 X159.73 Y98.476 E-.05733
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.021 J-1.217 P1  F30000
G1 X98.878 Y97.423 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X98.879 Y97.423 E.00003
G3 X97.931 Y97.28 I-.879 J2.616 E.50318
G1 X98.069 Y97.28 E.00423
G3 X98.614 Y97.349 I-.069 J2.759 E.01692
G1 X98.82 Y97.407 E.00658
M204 S10000
; WIPE_START
G1 F24000
G1 X98.879 Y97.423 E-.02315
G1 X99.135 Y97.524 E-.10456
G1 X99.38 Y97.649 E-.10456
G1 X99.611 Y97.799 E-.10456
G1 X99.826 Y97.97 E-.10455
G1 X100.023 Y98.162 E-.10456
G1 X100.2 Y98.373 E-.10456
G1 X100.355 Y98.6 E-.10456
G1 X100.361 Y98.612 E-.00494
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.288 J-1.182 P1  F30000
G1 X92.979 Y96.815 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X92.991 Y96.802 E.00055
G3 X95.172 Y95.75 I2.184 J1.741 E.07696
G1 X164.964 Y95.753 E2.14452
G3 X167.252 Y99.926 I-.135 J2.788 E.17509
G1 X134.16 Y157.836 E2.04944
G3 X125.84 Y157.836 I-4.16 J-2.377 E.30966
G1 X92.748 Y99.926 E2.04944
G3 X92.759 Y97.141 I2.427 J-1.383 E.08959
G1 X92.945 Y96.864 E.01024
M204 S10000
; WIPE_START
G1 F24000
G1 X92.991 Y96.802 E-.02951
G1 X93.176 Y96.588 E-.10723
G1 X93.488 Y96.313 E-.15811
G1 X93.834 Y96.09 E-.1563
G1 X94.088 Y95.968 E-.10729
G1 X94.483 Y95.836 E-.15812
G1 X94.595 Y95.816 E-.04345
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.417 J1.143 P1  F30000
G1 X120.426 Y105.242 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X120.426 Y106.87 E.05401
G1 X121.574 Y105.722 E.05385
G1 X121.574 Y104.222 E.04976
G1 X120.426 Y103.074 E.05385
G1 X120.426 Y99.194 E.12871
G1 X123.13 Y96.49 E.12686
G1 X121.518 Y96.49 E.05348
G1 X124.142 Y99.114 E.12308
G1 X128.183 Y99.114 E.13405
G1 X130.806 Y96.49 E.12308
G1 X129.194 Y96.49 E.05348
G1 X131.817 Y99.114 E.12308
G1 X135.858 Y99.114 E.13405
G1 X138.482 Y96.49 E.12308
G1 X136.87 Y96.49 E.05348
G1 X139.574 Y99.194 E.12686
G1 X139.574 Y103.074 E.12871
G1 X138.426 Y104.222 E.05385
G1 X138.426 Y105.722 E.04976
G1 X139.574 Y106.87 E.05385
G1 X139.574 Y105.242 E.05401
; WIPE_START
G1 F24000
G1 X139.574 Y106.87 E-.61876
G1 X139.311 Y106.607 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.032 J-1.217 P1  F30000
G1 X130.437 Y106.84 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X131.2 Y107.602 E.03312
G1 X130.804 Y107.739
G1 X129.904 Y106.84 E.03909
G1 X129.371 Y106.84
G1 X130.27 Y107.739 E.03909
G1 X129.737 Y107.739
G1 X128.838 Y106.84 E.03909
G1 X128.8 Y107.336
G1 X129.204 Y107.739 E.01754
M204 S10000
; WIPE_START
G1 F24000
G1 X128.8 Y107.336 E-.21689
G1 X128.838 Y106.84 E-.18898
G1 X129.496 Y107.499 E-.35412
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.3 J1.179 P1  F30000
G1 X167.322 Y97.864 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X165.507 Y96.048 E.0789
G1 X164.884 Y95.959
G1 X167.412 Y98.487 E.10986
G1 X167.375 Y98.983
G1 X164.349 Y95.957 E.13147
G1 X163.816 Y95.957
G1 X167.263 Y99.404 E.1498
G1 X167.099 Y99.773
G1 X163.283 Y95.957 E.16582
G1 X162.749 Y95.957
G1 X166.906 Y100.113 E.18061
G1 X166.712 Y100.453
G1 X162.216 Y95.957 E.19536
G1 X161.683 Y95.957
G1 X162.957 Y97.231 E.05535
G1 X162.279 Y97.086
G1 X161.15 Y95.957 E.04906
G1 X160.616 Y95.957
G1 X161.743 Y97.084 E.04897
G1 X161.286 Y97.16
G1 X160.083 Y95.957 E.05228
G1 X159.55 Y95.957
G1 X160.884 Y97.291 E.05796
G1 X160.525 Y97.465
G1 X159.016 Y95.957 E.06554
G1 X158.483 Y95.957
G1 X160.204 Y97.678 E.07479
G1 X159.918 Y97.925
G1 X157.95 Y95.957 E.08553
G1 X157.417 Y95.957
G1 X159.667 Y98.207 E.09778
G1 X159.45 Y98.524
G1 X156.883 Y95.957 E.11153
G1 X156.35 Y95.957
G1 X159.27 Y98.877 E.12689
G1 X159.134 Y99.274
G1 X155.817 Y95.957 E.14413
G1 X155.284 Y95.957
G1 X159.05 Y99.723 E.16366
G1 X159.041 Y100.247
G1 X154.75 Y95.957 E.18644
G1 X154.217 Y95.957
G1 X159.16 Y100.9 E.21482
M204 S10000
; WIPE_START
G1 F24000
G1 X157.746 Y99.486 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.07 J1.215 P1  F30000
G1 X164.808 Y99.082 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X166.518 Y100.792 E.07431
G1 X166.324 Y101.131
G1 X164.954 Y99.762 E.05953
G1 X164.956 Y100.296
G1 X166.13 Y101.471 E.05103
G1 X165.936 Y101.81
G1 X164.88 Y100.754 E.0459
G1 X164.749 Y101.156
G1 X165.742 Y102.15 E.04317
G1 X165.548 Y102.489
G1 X164.574 Y101.515 E.04234
G1 X164.362 Y101.836
G1 X165.354 Y102.828 E.04312
G1 X165.16 Y103.168
M73 P52 R13
G1 X164.114 Y102.121 E.04548
G1 X163.833 Y102.373
G1 X164.967 Y103.507 E.04927
G1 X164.773 Y103.846
G1 X163.516 Y102.59 E.0546
G1 X163.162 Y102.769
G1 X164.579 Y104.186 E.06155
G1 X164.385 Y104.525
G1 X162.766 Y102.906 E.07036
G1 X162.316 Y102.989
G1 X164.191 Y104.864 E.08147
G1 X163.997 Y105.204
G1 X161.793 Y103 E.09578
G1 X161.138 Y102.878
G1 X163.803 Y105.543 E.11579
G1 X163.609 Y105.882
G1 X153.684 Y95.957 E.43131
G1 X153.15 Y95.957
G1 X163.415 Y106.222 E.44605
G1 X163.221 Y106.561
G1 X152.617 Y95.957 E.4608
G1 X152.084 Y95.957
G1 X163.027 Y106.9 E.47555
G1 X162.833 Y107.24
G1 X151.551 Y95.957 E.49029
G1 X151.017 Y95.957
G1 X162.64 Y107.579 E.50504
G1 X162.446 Y107.919
G1 X150.484 Y95.957 E.51979
G1 X149.951 Y95.957
G1 X162.252 Y108.258 E.53453
G1 X162.058 Y108.597
G1 X149.418 Y95.957 E.54928
G1 X148.884 Y95.957
G1 X161.864 Y108.937 E.56403
G1 X161.67 Y109.276
G1 X148.351 Y95.957 E.57877
G1 X147.818 Y95.957
G1 X161.476 Y109.615 E.59352
G1 X161.282 Y109.955
G1 X147.284 Y95.957 E.60826
G1 X146.751 Y95.957
G1 X161.088 Y110.294 E.62301
G1 X160.894 Y110.633
G1 X146.218 Y95.957 E.63776
G1 X145.685 Y95.957
G1 X160.7 Y110.973 E.6525
G1 X160.506 Y111.312
G1 X145.151 Y95.957 E.66725
G1 X144.618 Y95.957
G1 X160.313 Y111.651 E.682
G1 X160.119 Y111.991
G1 X144.085 Y95.957 E.69674
G1 X143.552 Y95.957
G1 X159.925 Y112.33 E.71149
G1 X159.731 Y112.67
G1 X143.018 Y95.957 E.72624
G1 X142.485 Y95.957
G1 X159.537 Y113.009 E.74098
G1 X159.343 Y113.348
G1 X141.952 Y95.957 E.75573
G1 X141.419 Y95.957
G1 X159.149 Y113.688 E.77048
G1 X158.955 Y114.027
G1 X140.885 Y95.957 E.78522
G1 X140.352 Y95.957
G1 X158.761 Y114.366 E.79997
G1 X158.567 Y114.706
G1 X140.145 Y96.283 E.80055
G1 X140.145 Y96.816
G1 X158.373 Y115.045 E.79213
G1 X158.179 Y115.384
G1 X140.145 Y97.35 E.7837
G1 X140.145 Y97.883
G1 X157.986 Y115.724 E.77527
G1 X157.792 Y116.063
G1 X140.145 Y98.416 E.76685
G1 X140.145 Y98.949
G1 X157.598 Y116.402 E.75842
G1 X157.404 Y116.742
G1 X140.145 Y99.483 E.74999
G1 X140.145 Y100.016
G1 X157.21 Y117.081 E.74157
G1 X157.016 Y117.42
G1 X140.145 Y100.549 E.73314
G1 X140.145 Y101.082
G1 X156.822 Y117.76 E.72471
G1 X156.628 Y118.099
G1 X140.145 Y101.616 E.71629
G1 X140.145 Y102.149
G1 X156.434 Y118.439 E.70786
G1 X156.24 Y118.778
G1 X140.145 Y102.682 E.69943
G1 X140.145 Y103.215
G1 X156.046 Y119.117 E.69101
G1 X155.852 Y119.457
G1 X140.145 Y103.749 E.68258
G1 X140.145 Y104.282
G1 X155.659 Y119.796 E.67415
G1 X155.465 Y120.135
G1 X140.145 Y104.815 E.66573
G1 X140.145 Y105.349
G1 X155.271 Y120.475 E.6573
G1 X155.077 Y120.814
G1 X140.145 Y105.882 E.64887
G1 X140.145 Y106.415
G1 X154.883 Y121.153 E.64045
G1 X154.689 Y121.493
G1 X140.145 Y106.948 E.63202
G1 X140.145 Y107.482
G1 X154.495 Y121.832 E.62359
G1 X154.301 Y122.171
G1 X140.145 Y108.015 E.61517
G1 X139.781 Y108.184
G1 X154.107 Y122.511 E.62256
G1 X153.913 Y122.85
G1 X139.247 Y108.184 E.6373
G1 X138.714 Y108.184
G1 X153.719 Y123.189 E.65205
G1 X153.525 Y123.529
G1 X138.181 Y108.184 E.6668
M204 S10000
G1 X137.855 Y100.393 F30000
M204 S2000
G1 F12000
G1 X137.147 Y99.684 E.0308
G1 X136.613 Y99.684
G1 X137.855 Y100.926 E.05397
G1 X137.855 Y101.46
G1 X136.08 Y99.684 E.07714
G1 X135.547 Y99.684
G1 X137.855 Y101.993 E.10032
G1 X137.855 Y102.526
G1 X135.014 Y99.684 E.12349
G1 X134.48 Y99.684
G1 X137.855 Y103.059 E.14666
G1 X137.855 Y103.593
G1 X133.947 Y99.684 E.16984
G1 X133.414 Y99.684
G1 X137.855 Y104.126 E.19301
G1 X137.855 Y104.659
G1 X132.881 Y99.684 E.21618
G1 X132.347 Y99.684
G1 X137.855 Y105.192 E.23936
G1 X137.855 Y105.726
M73 P52 R12
G1 X131.814 Y99.684 E.26253
G1 X131.281 Y99.684
G1 X137.855 Y106.259 E.2857
G1 X137.855 Y106.792
G1 X130.747 Y99.684 E.30887
G1 X130.214 Y99.684
G1 X137.855 Y107.325 E.33205
G1 X137.855 Y107.859
G1 X129.681 Y99.684 E.35522
G1 X129.148 Y99.684
G1 X153.332 Y123.868 E1.05091
G1 X153.138 Y124.208
G1 X128.614 Y99.684 E1.06565
G1 X128.081 Y99.684
G1 X152.944 Y124.547 E1.0804
G1 X152.75 Y124.886
G1 X127.548 Y99.684 E1.09515
G1 X127.015 Y99.684
G1 X152.556 Y125.226 E1.10989
G1 X152.362 Y125.565
G1 X126.481 Y99.684 E1.12464
G1 X125.948 Y99.684
G1 X152.168 Y125.904 E1.13939
G1 X151.974 Y126.244
G1 X125.415 Y99.684 E1.15413
G1 X124.881 Y99.684
G1 X131.592 Y106.395 E.29162
G1 X131.059 Y106.395
G1 X124.348 Y99.684 E.29162
G1 X123.815 Y99.684
G1 X130.526 Y106.395 E.29162
G1 X129.992 Y106.395
G1 X123.282 Y99.684 E.29162
G1 X122.748 Y99.684
G1 X129.459 Y106.395 E.29162
G1 X128.926 Y106.395
G1 X122.341 Y99.811 E.28612
G1 X122.145 Y100.147
G1 X128.393 Y106.395 E.27152
G1 X128.355 Y106.891
G1 X122.145 Y100.68 E.26989
G1 X122.145 Y101.214
G1 X128.355 Y107.424 E.26989
G1 X128.355 Y107.958
G1 X122.145 Y101.747 E.26989
M204 S10000
G1 X119.855 Y96.791 F30000
M204 S2000
G1 F12000
G1 X119.021 Y95.957 E.03625
G1 X118.488 Y95.957
G1 X119.855 Y97.325 E.05942
G1 X119.855 Y97.858
G1 X117.955 Y95.957 E.0826
G1 X117.421 Y95.957
G1 X119.855 Y98.391 E.10577
G1 X119.855 Y98.924
G1 X116.888 Y95.957 E.12894
G1 X116.355 Y95.957
G1 X119.855 Y99.458 E.15212
G1 X119.855 Y99.991
G1 X115.822 Y95.957 E.17529
G1 X115.288 Y95.957
G1 X119.855 Y100.524 E.19846
G1 X119.855 Y101.057
M73 P53 R12
G1 X114.755 Y95.957 E.22164
G1 X114.222 Y95.957
G1 X119.855 Y101.591 E.24481
G1 X119.855 Y102.124
G1 X113.688 Y95.957 E.26798
G1 X113.155 Y95.957
G1 X119.855 Y102.657 E.29116
G1 X119.855 Y103.191
G1 X112.622 Y95.957 E.31433
G1 X112.089 Y95.957
G1 X119.855 Y103.724 E.3375
G1 X119.855 Y104.257
G1 X111.555 Y95.957 E.36068
G1 X111.022 Y95.957
G1 X119.855 Y104.79 E.38385
G1 X119.855 Y105.324
G1 X110.489 Y95.957 E.40702
G1 X109.956 Y95.957
G1 X119.855 Y105.857 E.4302
G1 X119.855 Y106.39
G1 X109.422 Y95.957 E.45337
G1 X108.889 Y95.957
G1 X119.855 Y106.923 E.47654
G1 X119.855 Y107.457
G1 X108.356 Y95.957 E.49971
G1 X107.822 Y95.957
G1 X119.855 Y107.99 E.52289
M204 S10000
; WIPE_START
G1 F24000
G1 X118.441 Y106.576 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.012 J1.217 P1  F30000
G1 X131.644 Y106.447 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X151.78 Y126.583 E.87501
G1 X151.586 Y126.922
G1 X131.644 Y106.98 E.86658
G1 X131.644 Y107.514
G1 X151.392 Y127.262 E.85815
G1 X151.198 Y127.601
G1 X131.644 Y108.047 E.84972
G1 X131.248 Y108.184
G1 X151.005 Y127.94 E.8585
G1 X150.811 Y128.28
G1 X130.715 Y108.184 E.87325
G1 X130.182 Y108.184
G1 X150.617 Y128.619 E.88799
G1 X150.423 Y128.958
G1 X129.649 Y108.184 E.90274
G1 X129.115 Y108.184
G1 X150.229 Y129.298 E.91749
G1 X150.035 Y129.637
G1 X128.582 Y108.184 E.93223
M204 S10000
; WIPE_START
G1 F24000
G1 X129.996 Y109.598 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.83 J-.89 P1  F30000
G1 X122.145 Y102.28 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X149.841 Y129.977 E1.20354
G1 X149.647 Y130.316
G1 X122.145 Y102.813 E1.19512
G1 X122.145 Y103.347
G1 X149.453 Y130.655 E1.18669
G1 X149.259 Y130.995
G1 X122.145 Y103.88 E1.17826
G1 X122.145 Y104.413
G1 X149.065 Y131.334 E1.16984
G1 X148.871 Y131.673
G1 X122.145 Y104.946 E1.16141
G1 X122.145 Y105.48
G1 X148.678 Y132.013 E1.15298
G1 X148.484 Y132.352
G1 X122.145 Y106.013 E1.14456
G1 X122.145 Y106.546
G1 X148.29 Y132.691 E1.13613
G1 X148.096 Y133.031
G1 X122.145 Y107.08 E1.1277
G1 X122.145 Y107.613
G1 X147.902 Y133.37 E1.11928
G1 X147.708 Y133.709
G1 X122.145 Y108.146 E1.11085
G1 X121.65 Y108.184
G1 X147.514 Y134.049 E1.12394
G1 X147.32 Y134.388
G1 X121.116 Y108.184 E1.13869
G1 X120.583 Y108.184
G1 X147.126 Y134.728 E1.15343
G1 X146.932 Y135.067
G1 X120.05 Y108.184 E1.16818
M204 S10000
; WIPE_START
G1 F24000
G1 X121.464 Y109.598 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.844 J-.877 P1  F30000
G1 X107.289 Y95.957 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X146.738 Y135.406 E1.71426
G1 X146.544 Y135.746
G1 X106.756 Y95.957 E1.729
G1 X106.223 Y95.957
G1 X146.351 Y136.085 E1.74375
G1 X146.157 Y136.424
G1 X105.689 Y95.957 E1.7585
G1 X105.156 Y95.957
G1 X145.963 Y136.764 E1.77324
G1 X145.769 Y137.103
G1 X104.623 Y95.957 E1.78799
G1 X104.09 Y95.957
G1 X145.575 Y137.442 E1.80274
G1 X145.381 Y137.782
G1 X103.556 Y95.957 E1.81748
G1 X103.023 Y95.957
G1 X145.187 Y138.121 E1.83223
G1 X144.993 Y138.46
G1 X102.49 Y95.957 E1.84698
G1 X101.957 Y95.957
G1 X144.799 Y138.8 E1.86172
G1 X144.605 Y139.139
G1 X101.423 Y95.957 E1.87647
G1 X100.89 Y95.957
G1 X144.411 Y139.478 E1.89122
G1 X144.217 Y139.818
G1 X100.357 Y95.957 E1.90596
G1 X99.823 Y95.957
G1 X144.024 Y140.157 E1.92071
G1 X143.83 Y140.497
G1 X99.29 Y95.957 E1.93546
G1 X98.757 Y95.957
G1 X143.636 Y140.836 E1.9502
G1 X143.442 Y141.175
G1 X98.224 Y95.957 E1.96495
G1 X97.69 Y95.957
G1 X98.968 Y97.235 E.05554
G1 X98.287 Y97.087
G1 X97.157 Y95.957 E.0491
G1 X96.624 Y95.957
G1 X97.75 Y97.083 E.04894
G1 X97.292 Y97.159
G1 X96.091 Y95.957 E.05221
G1 X95.557 Y95.957
G1 X96.889 Y97.289 E.05786
G1 X96.529 Y97.463
G1 X95.028 Y95.961 E.06523
G1 X94.564 Y96.03
G1 X96.209 Y97.675 E.07149
G1 X95.922 Y97.922
G1 X94.162 Y96.162 E.07646
G1 X93.811 Y96.344
G1 X95.67 Y98.203 E.08079
G1 X95.453 Y98.519
G1 X93.502 Y96.568 E.08476
G1 X93.233 Y96.832
G1 X95.272 Y98.872 E.08864
G1 X95.135 Y99.268
G1 X93.002 Y97.135 E.09268
G1 X92.815 Y97.48
G1 X95.051 Y99.717 E.09717
M73 P54 R12
G1 X95.04 Y100.239
G1 X92.675 Y97.874 E.10277
G1 X92.596 Y98.329
G1 X95.157 Y100.89 E.1113
M204 S10000
; WIPE_START
G1 F24000
G1 X93.743 Y99.476 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.07 J1.215 P1  F30000
G1 X100.804 Y99.071 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X143.248 Y141.515 E1.84439
G1 X143.054 Y141.854
G1 X100.953 Y99.753 E1.82947
G1 X100.956 Y100.289
G1 X142.86 Y142.193 E1.82093
G1 X142.666 Y142.533
G1 X100.881 Y100.748 E1.81575
G1 X100.751 Y101.151
G1 X142.472 Y142.872 E1.81299
G1 X142.278 Y143.211
G1 X100.577 Y101.51 E1.81213
G1 X100.365 Y101.832
G1 X142.084 Y143.551 E1.81289
G1 X141.89 Y143.89
G1 X100.118 Y102.117 E1.81523
G1 X99.837 Y102.37
G1 X141.697 Y144.229 E1.819
G1 X141.503 Y144.569
G1 X99.521 Y102.587 E1.82431
G1 X99.168 Y102.767
G1 X141.309 Y144.908 E1.83124
G1 X141.115 Y145.247
G1 X98.772 Y102.904 E1.84001
G1 X98.323 Y102.989
G1 X140.921 Y145.587 E1.85109
G1 X140.727 Y145.926
G1 X97.801 Y103 E1.86535
G1 X97.149 Y102.882
G1 X140.533 Y146.266 E1.88523
G1 X140.339 Y146.605
G1 X132.804 Y139.069 E.32746
G1 X132.953 Y139.752
G1 X140.145 Y146.944 E.31252
G1 X139.951 Y147.284
G1 X132.967 Y140.3 E.30348
G1 X132.967 Y140.833
G1 X139.757 Y147.623 E.29506
G1 X139.563 Y147.962
G1 X132.967 Y141.366 E.28663
G1 X132.967 Y141.9
G1 X139.37 Y148.302 E.2782
G1 X139.176 Y148.641
G1 X132.967 Y142.433 E.26978
G1 X132.967 Y142.966
G1 X138.982 Y148.98 E.26135
G1 X138.788 Y149.32
G1 X132.967 Y143.499 E.25292
G1 X132.967 Y144.033
G1 X138.594 Y149.659 E.2445
G1 X138.4 Y149.998
G1 X132.967 Y144.566 E.23607
G1 X132.967 Y145.099
G1 X138.206 Y150.338 E.22765
G1 X138.012 Y150.677
G1 X132.967 Y145.632 E.21922
G1 X132.967 Y146.166
G1 X137.818 Y151.016 E.21079
G1 X137.624 Y151.356
G1 X132.967 Y146.699 E.20237
G1 X132.967 Y147.232
G1 X137.43 Y151.695 E.19394
G1 X137.236 Y152.035
G1 X132.967 Y147.765 E.18551
G1 X132.967 Y148.299
G1 X137.043 Y152.374 E.17709
G1 X136.849 Y152.713
G1 X132.967 Y148.832 E.16866
G1 X132.967 Y149.365
G1 X136.655 Y153.053 E.16023
G1 X136.461 Y153.392
G1 X132.967 Y149.899 E.15181
G1 X132.967 Y150.432
G1 X136.267 Y153.731 E.14338
G1 X136.073 Y154.071
G1 X132.967 Y150.965 E.13495
G1 X132.967 Y151.498
G1 X135.879 Y154.41 E.12653
G1 X135.685 Y154.749
G1 X132.967 Y152.032 E.1181
G1 X132.967 Y152.565
G1 X135.491 Y155.089 E.10967
G1 X135.297 Y155.428
G1 X132.966 Y153.097 E.1013
G1 X132.917 Y153.581
G1 X135.103 Y155.767 E.09501
G1 X134.909 Y156.107
G1 X132.806 Y154.003 E.09141
G1 X132.648 Y154.378
G1 X134.716 Y156.446 E.08987
G1 X134.522 Y156.786
G1 X132.45 Y154.714 E.09002
G1 X132.215 Y155.013
G1 X134.328 Y157.125 E.09179
G1 X134.134 Y157.464
G1 X131.948 Y155.278 E.095
G1 X131.645 Y155.509
G1 X133.938 Y157.802 E.09966
G1 X133.728 Y158.125
G1 X131.306 Y155.703 E.10525
G1 X130.928 Y155.858
G1 X133.494 Y158.425 E.11154
G1 X133.239 Y158.702
G1 X130.501 Y155.964 E.11897
G1 X130.01 Y156.006
G1 X132.961 Y158.958 E.12827
G1 X132.661 Y159.191
G1 X129.419 Y155.949 E.14091
G1 X128.582 Y155.646
G1 X132.338 Y159.401 E.16321
M204 S10000
; WIPE_START
G1 F24000
G1 X130.924 Y157.987 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.217 J.003 P1  F30000
G1 X130.97 Y137.236 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X92.609 Y98.875 E1.66695
G1 X92.828 Y99.627
G1 X130.288 Y137.087 E1.62783
G1 X129.751 Y137.083
G1 X93.512 Y100.844 E1.57476
M204 S10000
; WIPE_START
G1 F24000
G1 X94.926 Y102.258 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X94.223 Y102.088 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
M73 P55 R12
G1 X129.293 Y137.158 E1.52396
G1 X128.89 Y137.288
G1 X94.934 Y103.333 E1.47553
M204 S10000
; WIPE_START
G1 F24000
G1 X96.348 Y104.747 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X95.645 Y104.577 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X128.53 Y137.462 E1.42902
G1 X128.209 Y137.675
G1 X96.356 Y105.821 E1.38417
M204 S10000
; WIPE_START
G1 F24000
G1 X97.77 Y107.236 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X97.067 Y107.066 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.922 Y137.921 E1.34081
G1 X127.671 Y138.203
G1 X97.778 Y108.31 E1.29898
M204 S10000
; WIPE_START
G1 F24000
G1 X99.192 Y109.724 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X98.489 Y109.554 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.453 Y138.518 E1.25862
G1 X127.273 Y138.871
G1 X99.2 Y110.799 E1.21989
M204 S10000
; WIPE_START
G1 F24000
G1 X100.614 Y112.213 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X99.911 Y112.043 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.136 Y139.267 E1.18303
G1 X127.051 Y139.716
G1 X100.622 Y113.287 E1.14845
M204 S10000
; WIPE_START
G1 F24000
G1 X102.036 Y114.701 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X101.333 Y114.531 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.033 Y140.231 E1.11676
G1 X127.033 Y140.764
G1 X102.044 Y115.776 E1.08587
M204 S10000
; WIPE_START
G1 F24000
G1 X103.458 Y117.19 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X102.755 Y117.02 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.033 Y141.297 E1.05497
G1 X127.033 Y141.831
G1 X103.466 Y118.264 E1.02407
M204 S10000
; WIPE_START
G1 F24000
G1 X104.88 Y119.679 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X104.177 Y119.509 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.033 Y142.364 E.99317
G1 X127.033 Y142.897
G1 X104.888 Y120.753 E.96228
M204 S10000
; WIPE_START
G1 F24000
G1 X106.303 Y122.167 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X105.599 Y121.997 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.033 Y143.431 E.93138
G1 X127.033 Y143.964
G1 X106.31 Y123.242 E.90048
M204 S10000
; WIPE_START
G1 F24000
G1 X107.725 Y124.656 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X107.021 Y124.486 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.033 Y144.497 E.86958
G1 X127.033 Y145.03
G1 X107.732 Y125.73 E.83869
M204 S10000
; WIPE_START
G1 F24000
G1 X109.147 Y127.144 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X108.443 Y126.974 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.033 Y145.564 E.80779
G1 X127.033 Y146.097
G1 X109.154 Y128.219 E.77689
M204 S10000
; WIPE_START
G1 F24000
G1 X110.569 Y129.633 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X109.866 Y129.463 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.033 Y146.63 E.74599
G1 X127.033 Y147.163
G1 X110.577 Y130.707 E.7151
M204 S10000
; WIPE_START
G1 F24000
G1 X111.991 Y132.122 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X111.288 Y131.952 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.033 Y147.697 E.6842
G1 X127.033 Y148.23
G1 X111.999 Y133.196 E.6533
M204 S10000
; WIPE_START
G1 F24000
G1 X113.413 Y134.61 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X112.71 Y134.44 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.033 Y148.763 E.6224
G1 X127.033 Y149.296
G1 X113.421 Y135.685 E.59151
M204 S10000
; WIPE_START
G1 F24000
G1 X114.835 Y137.099 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X114.132 Y136.929 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.033 Y149.83 E.56061
G1 X127.033 Y150.363
G1 X114.843 Y138.173 E.52971
M204 S10000
; WIPE_START
G1 F24000
G1 X116.257 Y139.587 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X115.554 Y139.417 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.033 Y150.896 E.49881
G1 X127.033 Y151.43
G1 X116.265 Y140.662 E.46792
M204 S10000
; WIPE_START
G1 F24000
G1 X117.679 Y142.076 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X116.976 Y141.906 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.033 Y151.963 E.43702
G1 X127.033 Y152.496
G1 X117.687 Y143.15 E.40612
M204 S10000
; WIPE_START
G1 F24000
G1 X119.101 Y144.565 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X118.398 Y144.395 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.033 Y153.029 E.37522
G1 X127.09 Y153.62
G1 X119.109 Y145.639 E.34682
M204 S10000
; WIPE_START
G1 F24000
G1 X120.523 Y147.053 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X119.82 Y146.883 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.392 Y154.455 E.32905
M204 S10000
; WIPE_START
G1 F24000
G1 X125.978 Y153.041 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.896 J.823 P1  F30000
G1 X131.991 Y159.588 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X120.531 Y148.127 E.49801
M204 S10000
; WIPE_START
G1 F24000
G1 X121.945 Y149.542 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X121.242 Y149.372 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X131.619 Y159.748 E.45091
G1 X131.217 Y159.88
G1 X121.953 Y150.616 E.40255
M204 S10000
; WIPE_START
G1 F24000
G1 X123.367 Y152.03 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X122.664 Y151.86 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X130.781 Y159.977 E.35272
G1 X130.304 Y160.034
G1 X123.375 Y153.105 E.30109
M204 S10000
; WIPE_START
G1 F24000
G1 X124.789 Y154.519 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X124.086 Y154.349 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X129.774 Y160.037 E.24719
G1 X129.172 Y159.968
G1 X124.797 Y155.593 E.1901
M204 S10000
; WIPE_START
G1 F24000
G1 X126.211 Y157.007 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X125.508 Y156.838 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X128.44 Y159.769 E.12739
M204 S10000
G1 X127.921 Y159.544 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881702
G1 F15000
G1 X127.842 Y159.486 E.00036
; LINE_WIDTH: 0.113841
G1 X127.763 Y159.427 E.00057
; LINE_WIDTH: 0.139514
G1 X127.675 Y159.359 E.00088
; LINE_WIDTH: 0.167066
G1 X127.587 Y159.29 E.00113
; LINE_WIDTH: 0.194617
G1 X127.409 Y159.144 E.00284
; LINE_WIDTH: 0.239832
G1 X127.248 Y159.006 E.00341
; LINE_WIDTH: 0.294248
G3 X126.473 Y158.233 I6.182 J-6.974 E.02243
; LINE_WIDTH: 0.274646
G1 X126.329 Y158.066 E.00416
; LINE_WIDTH: 0.242955
G1 X126.188 Y157.895 E.00361
; LINE_WIDTH: 0.200254
G1 X126.117 Y157.805 E.00147
; LINE_WIDTH: 0.172639
G1 X126.046 Y157.715 E.00121
; LINE_WIDTH: 0.145023
G1 X125.975 Y157.621 E.00099
; LINE_WIDTH: 0.116597
G1 X125.903 Y157.527 E.00071
; WIPE_START
G1 F24000
G1 X125.975 Y157.621 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.763 J.948 P1  F30000
G1 X128.796 Y159.892 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.19843
G1 F15000
G1 X128.503 Y159.706 E.0044
; WIPE_START
G1 F24000
M73 P56 R12
G1 X128.796 Y159.892 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.037 J.636 P1  F30000
G1 X167.142 Y97.39 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0922396
G1 F15000
G2 X167.043 Y97.256 I-2.749 J1.931 E.00067
; LINE_WIDTH: 0.130027
G1 X166.964 Y97.156 E.00091
; LINE_WIDTH: 0.171617
G2 X166.8 Y96.963 I-3.952 J3.199 E.00265
; LINE_WIDTH: 0.206321
G2 X166.257 Y96.441 I-4.181 J3.805 E.01003
; LINE_WIDTH: 0.170866
G1 X166.158 Y96.361 E.00133
; LINE_WIDTH: 0.143783
G1 X166.056 Y96.283 E.00106
; LINE_WIDTH: 0.110115
G1 X165.981 Y96.229 E.00051
; WIPE_START
G1 F24000
G1 X166.056 Y96.283 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.016 J-1.217 P1  F30000
G1 X140.18 Y95.938 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.15173
G1 F15000
G1 X140.18 Y96.129 E.00169
G1 X140.215 Y96.213 E.0008
G1 X137.874 Y100.072 F30000
; LINE_WIDTH: 0.145793
G1 F15000
G1 X137.467 Y99.665 E.00483
; WIPE_START
G1 F24000
G1 X137.874 Y100.072 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.553 J-1.084 P1  F30000
G1 X122.23 Y108.061 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.117774
G1 F15000
G1 X122.159 Y107.942 E.00084
; LINE_WIDTH: 0.10998
G1 X122.143 Y107.949 E.0001
; LINE_WIDTH: 0.0804994
G1 X122.126 Y107.956 E.00006
G1 X119.949 Y108.285 F30000
; LINE_WIDTH: 0.134051
G1 F15000
G1 X119.754 Y108.091 E.00204
; WIPE_START
G1 F24000
G1 X119.949 Y108.285 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.333 J-1.171 P1  F30000
G1 X93.573 Y100.783 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X93.447 Y100.618 E.00304
; LINE_WIDTH: 0.178142
G1 X93.321 Y100.454 E.00228
; LINE_WIDTH: 0.133156
G1 X93.195 Y100.289 E.00152
; WIPE_START
G1 F24000
G1 X93.321 Y100.454 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.673 J1.014 P1  F30000
G1 X97.083 Y102.948 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.144809
G1 F15000
G1 X96.903 Y102.831 E.00178
; LINE_WIDTH: 0.143754
G1 X96.834 Y102.784 E.00069
; LINE_WIDTH: 0.115961
G1 X96.764 Y102.738 E.0005
; WIPE_START
G1 F24000
G1 X96.834 Y102.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I0 J1.217 P1  F30000
G1 X99.124 Y102.785 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0938775
G1 F15000
G1 X99 Y102.866 E.00062
; WIPE_START
G1 F24000
G1 X99.124 Y102.785 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.105 J.51 P1  F30000
G1 X100.869 Y99.006 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.173582
G1 F15000
G1 X100.776 Y98.868 E.00177
; LINE_WIDTH: 0.172314
G1 X100.734 Y98.806 E.00079
; LINE_WIDTH: 0.144779
G1 X100.69 Y98.743 E.00064
; LINE_WIDTH: 0.117941
G1 X100.62 Y98.647 E.00072
; WIPE_START
G1 F24000
G1 X100.69 Y98.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.869 J-.852 P1  F30000
G1 X99.391 Y97.419 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0883351
G1 F15000
G1 X99.356 Y97.393 E.00016
; LINE_WIDTH: 0.0941633
G1 X99.235 Y97.306 E.00062
; LINE_WIDTH: 0.144116
G1 X99.233 Y97.305 E.00002
; LINE_WIDTH: 0.145043
G1 X99.17 Y97.263 E.00062
; LINE_WIDTH: 0.190488
G1 X99.031 Y97.172 E.002
; WIPE_START
G1 F24000
G1 X99.17 Y97.263 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.55 J-1.086 P1  F30000
G1 X95.055 Y99.348 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.092508
G1 F15000
G1 X95.101 Y99.5 E.00064
; WIPE_START
G1 F24000
G1 X95.055 Y99.348 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.207 J.153 P1  F30000
G1 X95.299 Y101.28 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.175823
G1 F15000
G1 X95.092 Y100.955 E.00417
G1 X95.304 Y101.277 F30000
; LINE_WIDTH: 0.107514
G1 F15000
G3 X95.089 Y100.959 I12.62 J-8.777 E.00202
; WIPE_START
G1 F24000
G1 X95.304 Y101.277 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.721 J-.98 P1  F30000
G1 X94.284 Y102.027 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X94.158 Y101.863 E.00304
; LINE_WIDTH: 0.178142
G1 X94.032 Y101.698 E.00228
; LINE_WIDTH: 0.133156
G1 X93.906 Y101.533 E.00152
; WIPE_START
G1 F24000
G1 X94.032 Y101.698 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X94.995 Y103.272 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X94.869 Y103.107 E.00304
; LINE_WIDTH: 0.178141
G1 X94.743 Y102.942 E.00228
; LINE_WIDTH: 0.133156
G1 X94.618 Y102.777 E.00152
; WIPE_START
G1 F24000
G1 X94.743 Y102.942 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X95.706 Y104.516 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X95.58 Y104.351 E.00304
; LINE_WIDTH: 0.178141
G1 X95.454 Y104.187 E.00228
; LINE_WIDTH: 0.133156
G1 X95.329 Y104.022 E.00152
; WIPE_START
G1 F24000
G1 X95.454 Y104.187 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X96.417 Y105.76 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X96.291 Y105.596 E.00304
; LINE_WIDTH: 0.178142
G1 X96.165 Y105.431 E.00228
; LINE_WIDTH: 0.133156
G1 X96.04 Y105.266 E.00152
; WIPE_START
G1 F24000
G1 X96.165 Y105.431 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X97.128 Y107.005 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X97.002 Y106.84 E.00304
; LINE_WIDTH: 0.178142
G1 X96.876 Y106.675 E.00228
; LINE_WIDTH: 0.133156
G1 X96.751 Y106.51 E.00152
; WIPE_START
G1 F24000
G1 X96.876 Y106.675 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X97.839 Y108.249 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X97.713 Y108.084 E.00304
; LINE_WIDTH: 0.178142
G1 X97.587 Y107.919 E.00228
; LINE_WIDTH: 0.133156
G1 X97.462 Y107.755 E.00152
; WIPE_START
G1 F24000
G1 X97.587 Y107.919 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X98.55 Y109.493 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X98.424 Y109.328 E.00304
; LINE_WIDTH: 0.178141
G1 X98.298 Y109.164 E.00228
; LINE_WIDTH: 0.133156
G1 X98.173 Y108.999 E.00152
; WIPE_START
G1 F24000
G1 X98.298 Y109.164 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X99.261 Y110.738 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X99.135 Y110.573 E.00304
; LINE_WIDTH: 0.178142
G1 X99.01 Y110.408 E.00228
; LINE_WIDTH: 0.133156
G1 X98.884 Y110.243 E.00152
; WIPE_START
G1 F24000
G1 X99.01 Y110.408 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X99.972 Y111.982 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X99.846 Y111.817 E.00304
; LINE_WIDTH: 0.178142
G1 X99.721 Y111.652 E.00228
; LINE_WIDTH: 0.133156
G1 X99.595 Y111.488 E.00152
; WIPE_START
G1 F24000
G1 X99.721 Y111.652 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X100.683 Y113.226 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X100.557 Y113.061 E.00304
; LINE_WIDTH: 0.178142
G1 X100.432 Y112.897 E.00228
; LINE_WIDTH: 0.133156
G1 X100.306 Y112.732 E.00152
; WIPE_START
G1 F24000
G1 X100.432 Y112.897 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P56 R11
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X101.394 Y114.47 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X101.268 Y114.306 E.00304
; LINE_WIDTH: 0.178142
G1 X101.143 Y114.141 E.00228
; LINE_WIDTH: 0.133156
G1 X101.017 Y113.976 E.00152
; WIPE_START
G1 F24000
G1 X101.143 Y114.141 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X102.105 Y115.715 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X101.979 Y115.55 E.00304
; LINE_WIDTH: 0.178142
G1 X101.854 Y115.385 E.00228
; LINE_WIDTH: 0.133156
G1 X101.728 Y115.22 E.00152
; WIPE_START
G1 F24000
G1 X101.854 Y115.385 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X102.816 Y116.959 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X102.69 Y116.794 E.00304
; LINE_WIDTH: 0.178142
G1 X102.565 Y116.63 E.00228
; LINE_WIDTH: 0.133156
G1 X102.439 Y116.465 E.00152
; WIPE_START
G1 F24000
G1 X102.565 Y116.63 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X103.527 Y118.203 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223128
G1 F15000
G1 X103.402 Y118.039 E.00304
; LINE_WIDTH: 0.178142
G1 X103.276 Y117.874 E.00228
; LINE_WIDTH: 0.133156
G1 X103.15 Y117.709 E.00152
; WIPE_START
G1 F24000
G1 X103.276 Y117.874 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X104.238 Y119.448 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X104.113 Y119.283 E.00304
; LINE_WIDTH: 0.178141
G1 X103.987 Y119.118 E.00228
; LINE_WIDTH: 0.133156
G1 X103.861 Y118.953 E.00152
; WIPE_START
G1 F24000
G1 X103.987 Y119.118 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X104.949 Y120.692 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223126
G1 F15000
G1 X104.824 Y120.527 E.00304
; LINE_WIDTH: 0.178141
G1 X104.698 Y120.362 E.00228
; LINE_WIDTH: 0.133156
G1 X104.572 Y120.198 E.00152
; WIPE_START
G1 F24000
G1 X104.698 Y120.362 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X105.66 Y121.936 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X105.535 Y121.771 E.00304
; LINE_WIDTH: 0.178142
G1 X105.409 Y121.607 E.00228
; LINE_WIDTH: 0.133156
G1 X105.283 Y121.442 E.00152
; WIPE_START
G1 F24000
G1 X105.409 Y121.607 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X106.371 Y123.18 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X106.246 Y123.016 E.00304
; LINE_WIDTH: 0.178142
G1 X106.12 Y122.851 E.00228
; LINE_WIDTH: 0.133156
G1 X105.994 Y122.686 E.00152
; WIPE_START
G1 F24000
G1 X106.12 Y122.851 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X107.082 Y124.425 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X106.957 Y124.26 E.00304
; LINE_WIDTH: 0.178142
G1 X106.831 Y124.095 E.00228
; LINE_WIDTH: 0.133156
G1 X106.705 Y123.931 E.00152
; WIPE_START
G1 F24000
G1 X106.831 Y124.095 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X107.794 Y125.669 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X107.668 Y125.504 E.00304
; LINE_WIDTH: 0.178142
G1 X107.542 Y125.34 E.00228
; LINE_WIDTH: 0.133156
G1 X107.416 Y125.175 E.00152
; WIPE_START
G1 F24000
G1 X107.542 Y125.34 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X108.505 Y126.913 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X108.379 Y126.749 E.00304
; LINE_WIDTH: 0.178142
G1 X108.253 Y126.584 E.00228
; LINE_WIDTH: 0.133156
G1 X108.127 Y126.419 E.00152
; WIPE_START
G1 F24000
G1 X108.253 Y126.584 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X109.216 Y128.158 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X109.09 Y127.993 E.00304
; LINE_WIDTH: 0.178142
G1 X108.964 Y127.828 E.00228
; LINE_WIDTH: 0.133156
G1 X108.838 Y127.663 E.00152
; WIPE_START
G1 F24000
G1 X108.964 Y127.828 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X109.927 Y129.402 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X109.801 Y129.237 E.00304
; LINE_WIDTH: 0.178142
G1 X109.675 Y129.072 E.00228
; LINE_WIDTH: 0.133156
G1 X109.549 Y128.908 E.00152
; WIPE_START
G1 F24000
G1 X109.675 Y129.072 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X110.638 Y130.646 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X110.512 Y130.482 E.00304
; LINE_WIDTH: 0.178142
G1 X110.386 Y130.317 E.00228
; LINE_WIDTH: 0.133156
G1 X110.26 Y130.152 E.00152
; WIPE_START
G1 F24000
G1 X110.386 Y130.317 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X111.349 Y131.891 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X111.223 Y131.726 E.00304
; LINE_WIDTH: 0.178141
G1 X111.097 Y131.561 E.00228
; LINE_WIDTH: 0.133156
G1 X110.971 Y131.396 E.00152
; WIPE_START
G1 F24000
G1 X111.097 Y131.561 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X112.06 Y133.135 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X111.934 Y132.97 E.00304
; LINE_WIDTH: 0.178141
G1 X111.808 Y132.805 E.00228
; LINE_WIDTH: 0.133156
G1 X111.682 Y132.641 E.00152
; WIPE_START
G1 F24000
G1 X111.808 Y132.805 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X112.771 Y134.379 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X112.645 Y134.214 E.00304
; LINE_WIDTH: 0.178142
G1 X112.519 Y134.05 E.00228
; LINE_WIDTH: 0.133156
G1 X112.393 Y133.885 E.00152
; WIPE_START
G1 F24000
G1 X112.519 Y134.05 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X113.482 Y135.623 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X113.356 Y135.459 E.00304
; LINE_WIDTH: 0.178142
G1 X113.23 Y135.294 E.00228
; LINE_WIDTH: 0.133156
G1 X113.104 Y135.129 E.00152
; WIPE_START
G1 F24000
G1 X113.23 Y135.294 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X114.193 Y136.868 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X114.067 Y136.703 E.00304
; LINE_WIDTH: 0.178142
G1 X113.941 Y136.538 E.00228
; LINE_WIDTH: 0.133156
G1 X113.815 Y136.374 E.00152
; WIPE_START
G1 F24000
G1 X113.941 Y136.538 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X114.904 Y138.112 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X114.778 Y137.947 E.00304
; LINE_WIDTH: 0.178141
G1 X114.652 Y137.783 E.00228
; LINE_WIDTH: 0.133156
G1 X114.526 Y137.618 E.00152
; WIPE_START
G1 F24000
G1 X114.652 Y137.783 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X115.615 Y139.356 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X115.489 Y139.192 E.00304
; LINE_WIDTH: 0.178142
G1 X115.363 Y139.027 E.00228
; LINE_WIDTH: 0.133156
G1 X115.237 Y138.862 E.00152
; WIPE_START
G1 F24000
G1 X115.363 Y139.027 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X116.326 Y140.601 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X116.2 Y140.436 E.00304
; LINE_WIDTH: 0.178142
G1 X116.074 Y140.271 E.00228
; LINE_WIDTH: 0.133156
G1 X115.948 Y140.106 E.00152
; WIPE_START
G1 F24000
G1 X116.074 Y140.271 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X117.037 Y141.845 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X116.911 Y141.68 E.00304
; LINE_WIDTH: 0.178141
G1 X116.785 Y141.515 E.00228
; LINE_WIDTH: 0.133156
G1 X116.659 Y141.351 E.00152
; WIPE_START
G1 F24000
G1 X116.785 Y141.515 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X117.748 Y143.089 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X117.622 Y142.924 E.00304
; LINE_WIDTH: 0.178141
G1 X117.496 Y142.76 E.00228
; LINE_WIDTH: 0.133156
G1 X117.37 Y142.595 E.00152
; WIPE_START
G1 F24000
G1 X117.496 Y142.76 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X118.459 Y144.334 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X118.333 Y144.169 E.00304
; LINE_WIDTH: 0.178141
G1 X118.207 Y144.004 E.00228
; LINE_WIDTH: 0.133156
G1 X118.081 Y143.839 E.00152
; WIPE_START
G1 F24000
G1 X118.207 Y144.004 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X119.17 Y145.578 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X119.044 Y145.413 E.00304
; LINE_WIDTH: 0.178141
G1 X118.918 Y145.248 E.00228
; LINE_WIDTH: 0.133156
G1 X118.792 Y145.084 E.00152
; WIPE_START
G1 F24000
G1 X118.918 Y145.248 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X119.881 Y146.822 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X119.755 Y146.657 E.00304
; LINE_WIDTH: 0.178141
G1 X119.629 Y146.493 E.00228
; LINE_WIDTH: 0.133156
G1 X119.503 Y146.328 E.00152
; WIPE_START
G1 F24000
G1 X119.629 Y146.493 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X120.592 Y148.066 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X120.466 Y147.902 E.00304
; LINE_WIDTH: 0.178141
G1 X120.34 Y147.737 E.00228
; LINE_WIDTH: 0.133156
G1 X120.214 Y147.572 E.00152
; WIPE_START
G1 F24000
G1 X120.34 Y147.737 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X121.303 Y149.311 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X121.177 Y149.146 E.00304
; LINE_WIDTH: 0.178141
G1 X121.051 Y148.981 E.00228
; LINE_WIDTH: 0.133156
G1 X120.926 Y148.816 E.00152
; WIPE_START
G1 F24000
G1 X121.051 Y148.981 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X122.014 Y150.555 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X121.888 Y150.39 E.00304
; LINE_WIDTH: 0.178141
G1 X121.762 Y150.226 E.00228
; LINE_WIDTH: 0.133156
G1 X121.637 Y150.061 E.00152
; WIPE_START
G1 F24000
G1 X121.762 Y150.226 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X122.725 Y151.799 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X122.599 Y151.635 E.00304
; LINE_WIDTH: 0.178141
G1 X122.473 Y151.47 E.00228
; LINE_WIDTH: 0.133156
G1 X122.348 Y151.305 E.00152
; WIPE_START
G1 F24000
G1 X122.473 Y151.47 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X123.436 Y153.044 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X123.31 Y152.879 E.00304
; LINE_WIDTH: 0.178141
G1 X123.184 Y152.714 E.00228
; LINE_WIDTH: 0.133156
G1 X123.059 Y152.549 E.00152
; WIPE_START
G1 F24000
G1 X123.184 Y152.714 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X124.147 Y154.288 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X124.021 Y154.123 E.00304
; LINE_WIDTH: 0.178141
G1 X123.895 Y153.958 E.00228
; LINE_WIDTH: 0.133156
G1 X123.77 Y153.794 E.00152
; WIPE_START
G1 F24000
G1 X123.895 Y153.958 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X124.858 Y155.532 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X124.732 Y155.367 E.00304
; LINE_WIDTH: 0.178142
G1 X124.606 Y155.203 E.00228
; LINE_WIDTH: 0.133156
G1 X124.481 Y155.038 E.00152
; WIPE_START
G1 F24000
G1 X124.606 Y155.203 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X125.569 Y156.777 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223126
G1 F15000
G1 X125.443 Y156.612 E.00304
; LINE_WIDTH: 0.178141
G1 X125.318 Y156.447 E.00228
; LINE_WIDTH: 0.133156
G1 X125.192 Y156.282 E.00152
; WIPE_START
G1 F24000
G1 X125.318 Y156.447 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.293 J1.181 P1  F30000
G1 X128.595 Y155.633 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.162937
G1 F15000
G1 X128.493 Y155.646 E.001
; LINE_WIDTH: 0.167621
G1 X128.471 Y155.649 E.00023
; LINE_WIDTH: 0.217558
G1 X128.449 Y155.652 E.00032
G1 X128.357 Y155.58 E.00166
; LINE_WIDTH: 0.180771
G1 X128.128 Y155.385 E.00338
; LINE_WIDTH: 0.135657
G1 X127.603 Y154.853 E.00564
; LINE_WIDTH: 0.156903
G1 X127.506 Y154.738 E.0014
; LINE_WIDTH: 0.196238
G1 X127.331 Y154.516 E.00353
G1 X127.175 Y153.951 F30000
; LINE_WIDTH: 0.173435
G1 F15000
G3 X127.025 Y153.685 I10.568 J-6.126 E.00325
G1 X127.178 Y153.95 F30000
; LINE_WIDTH: 0.0943995
G1 F15000
G3 X127.02 Y153.69 I10.71 J-6.659 E.00127
; WIPE_START
G1 F24000
G1 X127.178 Y153.95 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.194 J.234 P1  F30000
G1 X130.494 Y137.026 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.136463
G1 F15000
G1 X130.273 Y137.102 E.00178
G1 X130.577 Y137.133 F30000
; LINE_WIDTH: 0.106648
G1 F15000
G2 X130.358 Y137.017 I-4.568 J8.444 E.00129
; WIPE_START
G1 F24000
G1 X130.577 Y137.133 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.404 J1.148 P1  F30000
G1 X131.393 Y137.42 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0883486
G1 F15000
G1 X131.356 Y137.392 E.00017
; LINE_WIDTH: 0.0948494
G1 X131.235 Y137.306 E.00063
; LINE_WIDTH: 0.144809
G1 X131.233 Y137.305 E.00002
; LINE_WIDTH: 0.145741
G1 X131.171 Y137.263 E.00063
; LINE_WIDTH: 0.19105
G1 X131.033 Y137.173 E.00199
; WIPE_START
G1 F24000
G1 X131.171 Y137.263 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.871 J.85 P1  F30000
G1 X132.868 Y139.004 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.17428
G1 F15000
G1 X132.776 Y138.868 E.00177
; LINE_WIDTH: 0.173005
G1 X132.734 Y138.806 E.00079
; LINE_WIDTH: 0.145466
G1 X132.69 Y138.743 E.00064
; LINE_WIDTH: 0.11863
G1 X132.619 Y138.645 E.00075
; WIPE_START
G1 F24000
G1 X132.69 Y138.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.217 J.03 P1  F30000
G1 X133.038 Y152.902 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.100746
G1 F15000
G1 X132.948 Y153.115 E.00109
G1 X132.9 Y153.831 F30000
; LINE_WIDTH: 0.105007
G1 F15000
G1 X132.816 Y153.968 E.00082
; WIPE_START
G1 F24000
G1 X132.9 Y153.831 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.736 J-.969 P1  F30000
G1 X129.937 Y156.078 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0939989
G1 F15000
G1 X129.712 Y155.975 E.00103
G1 X130.026 Y155.99 F30000
; LINE_WIDTH: 0.127301
G1 F15000
G1 X129.812 Y156.075 E.00158
; WIPE_START
G1 F24000
G1 X130.026 Y155.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.216 J-.04 P1  F30000
G1 X128.471 Y108.295 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.107274
G1 F15000
G1 X128.245 Y108.068 E.00168
G1 X128.479 Y106.309 F30000
; LINE_WIDTH: 0.11757
G1 F15000
G1 X128.598 Y106.381 E.00084
; LINE_WIDTH: 0.109663
G1 X128.59 Y106.397 E.0001
; LINE_WIDTH: 0.0805025
G1 X128.583 Y106.414 E.00006
G1 X131.751 Y106.288 F30000
; LINE_WIDTH: 0.116265
G1 F15000
G1 X131.651 Y106.388 E.00085
G1 X131.64 Y106.451 E.00038
; WIPE_START
G1 F24000
G1 X131.651 Y106.388 E-.23506
G1 X131.751 Y106.288 E-.52494
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.217 J1.197 P1  F30000
G1 X159.305 Y101.294 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.181894
G1 F15000
G3 X159.097 Y100.964 I12.945 J-8.408 E.00442
G1 X159.31 Y101.291 F30000
; LINE_WIDTH: 0.110562
G1 F15000
G3 X159.092 Y100.969 I12.773 J-8.892 E.00214
; WIPE_START
G1 F24000
G1 X159.31 Y101.291 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.023 J.659 P1  F30000
G1 X162.016 Y97.09 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.118486
G1 F15000
G1 X161.817 Y97.01 E.00132
; WIPE_START
G1 F24000
G1 X162.016 Y97.09 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.279 J1.185 P1  F30000
G1 X163.375 Y97.41 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0891755
G1 F15000
G1 X163.234 Y97.309 E.00065
; LINE_WIDTH: 0.138515
G1 X163.232 Y97.307 E.00002
; LINE_WIDTH: 0.139487
G1 X163.169 Y97.266 E.00059
; LINE_WIDTH: 0.185883
G1 X163.019 Y97.168 E.00208
; WIPE_START
G1 F24000
G1 X163.169 Y97.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.872 J.849 P1  F30000
G1 X164.873 Y99.017 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.168007
G1 F15000
G1 X164.774 Y98.869 E.00182
; LINE_WIDTH: 0.166795
G1 X164.731 Y98.807 E.00075
; LINE_WIDTH: 0.139301
G1 X164.688 Y98.744 E.0006
; LINE_WIDTH: 0.112457
G1 X164.628 Y98.663 E.00057
; WIPE_START
G1 F24000
G1 X164.688 Y98.744 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.135 J-.44 P1  F30000
G1 X163.119 Y102.787 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0925124
G1 F15000
G1 X162.995 Y102.869 E.0006
; WIPE_START
G1 F24000
G1 X163.119 Y102.787 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.094 J-1.213 P1  F30000
G1 X161.072 Y102.945 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.150425
G1 F15000
G1 X160.902 Y102.834 E.00178
; LINE_WIDTH: 0.149313
G1 X160.84 Y102.792 E.00065
; LINE_WIDTH: 0.11156
G1 X160.751 Y102.731 E.00061
; WIPE_START
G1 F24000
G1 X160.84 Y102.792 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.601 J-1.058 P1  F30000
G1 X92.848 Y141.441 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X93.132 Y141.409 E.00876
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.369 Y146.054 E.01969
G1 X95.165 Y146.258 E.00886
G1 X94.916 Y146.507 E.01083
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.348 Y146.507 E.01969
G1 X91.099 Y146.258 E.01083
G1 X90.895 Y146.054 E.00886
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.789 Y141.448 E.00908
M204 S10000
G1 X93.414 Y141.009 F30000
M204 S5000
G1 F12000
G1 X93.416 Y141.009 E.00004
G1 X93.773 Y141.045 E.01104
G1 X94.39 Y141.232 E.01981
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
M73 P57 R11
G1 X93.355 Y141.003 E.00688
M204 S10000
; WIPE_START
G1 F24000
G1 X93.416 Y141.009 E-.02333
G1 X93.773 Y141.045 E-.13654
G1 X94.39 Y141.232 E-.24501
G1 X94.959 Y141.536 E-.245
G1 X95.183 Y141.719 E-.11011
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.14 J.426 P1  F30000
G1 X108.493 Y177.298 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X108.776 Y177.266 E.00876
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
G1 X111.354 Y181.369 E.01969
G1 X111.013 Y181.912 E.01969
G1 X110.809 Y182.116 E.00886
G1 X110.56 Y182.365 E.01083
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X106.992 Y182.365 E.01969
G1 X106.743 Y182.116 E.01083
G1 X106.539 Y181.912 E.00886
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.433 Y177.305 E.00908
M204 S10000
G1 X109.059 Y176.867 F30000
M204 S5000
G1 F12000
G1 X109.06 Y176.867 E.00004
G1 X109.418 Y176.902 E.01104
G1 X110.035 Y177.089 E.01981
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X108.999 Y176.861 E.00688
M204 S10000
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.06 Y176.867 E-.02333
G1 X109.418 Y176.902 E-.13654
G1 X110.035 Y177.089 E-.24501
G1 X110.604 Y177.393 E-.245
G1 X110.828 Y177.577 E-.11011
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/118
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
G3 Z3.4 I.239 J1.193 P1  F30000
G1 X166.466 Y166.425 Z3.4
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F3347
G1 X166.769 Y166.391 E.00937
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.006 Y171.036 E.01969
G1 X168.553 Y171.489 E.01969
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X164.985 Y171.489 E.01969
G1 X164.532 Y171.036 E.01969
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.406 Y166.431 E.00847
M204 S10000
G1 X167.074 Y165.993 F30000
M204 S5000
G1 F3347
G1 X167.41 Y166.026 E.01039
G1 X168.027 Y166.213 E.01981
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X167.014 Y165.987 E.00758
M204 S10000
; WIPE_START
G1 F24000
G1 X167.41 Y166.026 E-.15132
G1 X168.027 Y166.213 E-.24501
G1 X168.596 Y166.517 E-.24501
G1 X168.837 Y166.715 E-.11867
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.999 J-.695 P1  F30000
G1 X122.398 Y99.938 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3347
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3347
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3347
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3347
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3347
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G3 X132.026 Y105.751 I.352 J7.494 E.02262
G3 X132.289 Y106.028 I-.029 J.291 E.01279
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.045 E.08557
G3 X127.988 Y105.75 I.295 J0 E.01372
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F3347
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F3347
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423038
G1 F3347
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F3347
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F3347
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09252
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.82 J-.899 P1  F30000
G1 X92.829 Y141.443 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3347
G1 X93.132 Y141.409 E.00937
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.369 Y146.054 E.01969
G1 X94.916 Y146.507 E.01969
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.348 Y146.507 E.01969
G1 X90.895 Y146.054 E.01969
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.769 Y141.45 E.00847
M204 S10000
G1 X93.437 Y141.011 F30000
M204 S5000
G1 F3347
G1 X93.773 Y141.045 E.01039
G1 X94.39 Y141.232 E.01981
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
G1 X93.377 Y141.006 E.00758
M204 S10000
; WIPE_START
G1 F24000
G1 X93.773 Y141.045 E-.15132
G1 X94.39 Y141.232 E-.24501
G1 X94.959 Y141.536 E-.245
G1 X95.2 Y141.734 E-.11867
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.14 J.425 P1  F30000
G1 X108.473 Y177.301 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F3347
G1 X108.776 Y177.266 E.00937
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
G1 X111.354 Y181.369 E.01969
G1 X111.013 Y181.912 E.01969
G1 X110.56 Y182.365 E.01969
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X106.992 Y182.365 E.01969
G1 X106.539 Y181.912 E.01969
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.414 Y177.307 E.00847
M204 S10000
G1 X109.081 Y176.869 F30000
M204 S5000
G1 F3347
G1 X109.418 Y176.902 E.01039
G1 X110.035 Y177.089 E.01981
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X109.022 Y176.863 E.00758
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.418 Y176.902 E-.15132
G1 X110.035 Y177.089 E-.24501
G1 X110.604 Y177.393 E-.245
G1 X110.845 Y177.591 E-.11867
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/118
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
G3 Z3.6 I.24 J1.193 P1  F30000
G1 X166.446 Y166.427 Z3.6
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F4752
G1 X166.769 Y166.391 E.00998
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.595 Y169.566 E.0097
G1 X169.558 Y169.889 E.00998
G1 X169.347 Y170.493 E.01969
G1 X169.006 Y171.036 E.01969
G1 X168.553 Y171.489 E.01969
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.455 Y172.078 E.0097
G1 X166.132 Y172.041 E.00998
G1 X165.527 Y171.83 E.01969
G1 X164.985 Y171.489 E.01969
G1 X164.532 Y171.036 E.01969
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.386 Y166.434 E.00786
M204 S10000
G1 X167.096 Y165.995 F30000
M204 S5000
G1 F4752
G1 X167.41 Y166.026 E.0097
G1 X168.027 Y166.213 E.01981
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X167.037 Y165.989 E.00827
M204 S10000
; WIPE_START
G1 F24000
G1 X167.41 Y166.026 E-.14275
G1 X168.027 Y166.213 E-.24501
G1 X168.596 Y166.517 E-.24501
G1 X168.855 Y166.73 E-.12724
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.017 J-.669 P1  F30000
G1 X135.951 Y116.723 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Support interface
G1 F4752
G3 X135.523 Y116.588 I-.146 J-.282 E.01533
G1 X135.523 Y107.765 E.27111
G1 X135.658 Y107.629 E.00589
G1 X136.14 Y107.629 E.01479
G1 X136.14 Y116.723 E.27944
G1 X137.017 Y116.723 E.02695
G1 X137.017 Y109.578 E.21954
G1 X137.894 Y109.578 E.02695
G1 X137.894 Y116.723 E.21954
G1 X138.771 Y116.723 E.02695
G1 X138.771 Y109.578 E.21954
G1 X139.648 Y109.578 E.02695
G1 X139.648 Y116.723 E.21954
G1 X140.525 Y116.723 E.02695
G1 X140.525 Y109.578 E.21954
G1 X141.223 Y109.578 E.02145
G1 X141.402 Y109.399 E.00778
G1 X141.402 Y116.723 E.22504
G2 X141.74 Y116.588 I.101 J-.237 E.01242
G1 X141.74 Y107.765 E.27111
G2 X141.539 Y107.629 I-.168 J.033 E.00828
G1 X141.535 Y109.266 E.0503
; WIPE_START
G1 F24000
G1 X141.539 Y107.629 E-.62203
G1 X141.74 Y107.765 E-.09222
G1 X141.74 Y107.885 E-.04575
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.544 J-1.089 P1  F30000
G1 X124.049 Y116.723 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F4752
G2 X124.477 Y116.588 I.146 J-.282 E.01533
G1 X124.477 Y107.765 E.27111
G1 X124.342 Y107.629 E.00589
G1 X123.86 Y107.629 E.01479
G1 X123.86 Y116.723 E.27944
G1 X122.983 Y116.723 E.02695
G1 X122.983 Y109.578 E.21954
G1 X122.106 Y109.578 E.02695
G1 X122.106 Y116.723 E.21954
G1 X121.229 Y116.723 E.02695
G1 X121.229 Y109.578 E.21954
G1 X120.352 Y109.578 E.02695
G1 X120.352 Y116.723 E.21954
G1 X119.475 Y116.723 E.02695
G1 X119.475 Y109.578 E.21954
G1 X118.777 Y109.578 E.02145
G1 X118.598 Y109.399 E.00778
G1 X118.598 Y116.723 E.22504
G3 X118.26 Y116.588 I-.101 J-.237 E.01242
G1 X118.26 Y107.765 E.27111
G3 X118.461 Y107.629 I.168 J.033 E.00828
G1 X118.465 Y109.266 E.0503
; WIPE_START
G1 F24000
G1 X118.461 Y107.629 E-.62203
G1 X118.26 Y107.765 E-.09221
G1 X118.26 Y107.885 E-.04575
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.079 J.562 P1  F30000
G1 X122.398 Y99.938 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4752
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4752
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4752
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4752
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
M73 P58 R11
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4752
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.005 J.296 E.01388
G1 X132.29 Y108.83 E.08608
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.045 E.08557
G3 X127.988 Y105.75 I.303 J.008 E.01364
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F4752
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F4752
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F4752
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F4752
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F4752
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.82 J-.899 P1  F30000
G1 X92.809 Y141.445 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4752
G1 X93.132 Y141.409 E.00998
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.958 Y144.584 E.0097
G1 X95.921 Y144.907 E.00998
G1 X95.71 Y145.512 E.01969
G1 X95.369 Y146.054 E.01969
G1 X94.916 Y146.507 E.01969
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.818 Y147.096 E.0097
G1 X92.495 Y147.06 E.00998
G1 X91.89 Y146.848 E.01969
G1 X91.348 Y146.507 E.01969
G1 X90.895 Y146.054 E.01969
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.749 Y141.452 E.00786
M204 S10000
G1 X93.459 Y141.014 F30000
M204 S5000
G1 F4752
G1 X93.773 Y141.045 E.0097
G1 X94.39 Y141.232 E.01981
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
G1 X93.4 Y141.008 E.00827
M204 S10000
; WIPE_START
G1 F24000
G1 X93.773 Y141.045 E-.14275
G1 X94.39 Y141.232 E-.24501
G1 X94.959 Y141.536 E-.245
G1 X95.218 Y141.748 E-.12724
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.141 J.425 P1  F30000
G1 X108.453 Y177.303 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F4752
G1 X108.776 Y177.266 E.00998
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.602 Y180.442 E.0097
G1 X111.566 Y180.764 E.00998
G1 X111.354 Y181.369 E.01969
G1 X111.013 Y181.912 E.01969
G1 X110.56 Y182.365 E.01969
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.462 Y182.954 E.0097
G1 X108.14 Y182.917 E.00998
G1 X107.535 Y182.706 E.01969
G1 X106.992 Y182.365 E.01969
G1 X106.539 Y181.912 E.01969
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.394 Y177.309 E.00786
M204 S10000
G1 X109.104 Y176.871 F30000
M204 S5000
G1 F4752
G1 X109.418 Y176.902 E.0097
G1 X110.035 Y177.089 E.01981
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X109.044 Y176.865 E.00827
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.418 Y176.902 E-.14275
G1 X110.035 Y177.089 E-.24501
G1 X110.604 Y177.393 E-.245
G1 X110.862 Y177.605 E-.12724
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/118
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
G3 Z3.8 I.24 J1.193 P1  F30000
G1 X166.426 Y166.429 Z3.8
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F3347
G1 X166.428 Y166.429 E.00004
G1 X166.769 Y166.391 E.01055
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.006 Y171.036 E.01969
G1 X168.553 Y171.489 E.01969
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X164.985 Y171.489 E.01969
G1 X164.532 Y171.036 E.01969
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.367 Y166.436 E.00726
M204 S10000
G1 X167.119 Y165.997 F30000
M204 S5000
G1 F3347
G1 X167.41 Y166.026 E.00901
G1 X168.027 Y166.213 E.01981
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X167.059 Y165.992 E.00896
M204 S10000
; WIPE_START
G1 F24000
G1 X167.41 Y166.026 E-.13421
G1 X168.027 Y166.213 E-.24501
G1 X168.596 Y166.517 E-.245
G1 X168.872 Y166.744 E-.13578
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.999 J-.695 P1  F30000
G1 X122.398 Y99.938 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3347
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3347
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3347
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3347
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3347
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.007 J.293 E.01391
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.045 E.08557
G3 X127.988 Y105.75 I.303 J.008 E.01364
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F3347
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F3347
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F3347
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F3347
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F3347
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.82 J-.9 P1  F30000
G1 X92.789 Y141.448 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3347
G1 X92.791 Y141.447 E.00004
G1 X93.132 Y141.409 E.01055
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.369 Y146.054 E.01969
G1 X94.916 Y146.507 E.01969
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.348 Y146.507 E.01969
G1 X90.895 Y146.054 E.01969
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.73 Y141.454 E.00726
M204 S10000
G1 X93.482 Y141.016 F30000
M204 S5000
G1 F3347
G1 X93.773 Y141.045 E.00901
G1 X94.39 Y141.232 E.01981
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
G1 X93.422 Y141.01 E.00896
M204 S10000
; WIPE_START
G1 F24000
G1 X93.773 Y141.045 E-.13421
G1 X94.39 Y141.232 E-.24501
G1 X94.959 Y141.536 E-.245
G1 X95.235 Y141.762 E-.13578
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.141 J.424 P1  F30000
G1 X108.434 Y177.305 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F3347
G1 X108.435 Y177.305 E.00004
G1 X108.776 Y177.266 E.01055
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
G1 X111.354 Y181.369 E.01969
G1 X111.013 Y181.912 E.01969
G1 X110.56 Y182.365 E.01969
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X106.992 Y182.365 E.01969
G1 X106.539 Y181.912 E.01969
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.374 Y177.312 E.00726
M204 S10000
G1 X109.126 Y176.873 F30000
M204 S5000
G1 F3347
G1 X109.418 Y176.902 E.00901
G1 X110.035 Y177.089 E.01981
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X109.066 Y176.867 E.00896
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.67273
; LAYER_HEIGHT: 0.0727274
; WIPE_START
G1 F24000
G1 X109.418 Y176.902 E-.13421
G1 X110.035 Y177.089 E-.24501
G1 X110.604 Y177.393 E-.245
G1 X110.88 Y177.62 E-.13578
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/118
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
G3 Z4 I1.207 J.152 P1  F30000
G1 X118.598 Y116.492 Z4
G1 Z3.673
G1 E.8 F1800
; FEATURE: Support interface
; LAYER_HEIGHT: 0.272727
G1 F4625
G1 X118.598 Y109.399 E.28488
G1 X118.777 Y109.578 E.01017
G1 X119.475 Y109.578 E.02804
G1 X119.475 Y116.492 E.27769
G1 X120.352 Y116.492 E.03523
G1 X120.352 Y109.578 E.27769
G1 X121.229 Y109.578 E.03523
G1 X121.229 Y116.492 E.27769
G1 X122.106 Y116.492 E.03523
G1 X122.106 Y109.578 E.27769
G1 X122.983 Y109.578 E.03523
G1 X122.983 Y116.492 E.27769
G1 X123.86 Y116.492 E.03523
G1 X123.86 Y107.86 E.34669
G1 X124.246 Y107.86 E.01548
G1 X124.246 Y116.492 E.34669
G1 X124.049 Y116.492 E.00791
; WIPE_START
G1 F24000
G1 X124.246 Y116.492 E-.07481
G1 X124.246 Y114.689 E-.68519
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.073 I.613 J1.051 P1  F30000
G1 X135.951 Y107.86 Z4.073
G1 Z3.673
G1 E.8 F1800
G1 F4625
G1 X135.754 Y107.86 E.00791
G1 X135.754 Y116.492 E.34669
G1 X136.14 Y116.492 E.01548
G1 X136.14 Y107.86 E.34669
G1 X136.461 Y107.86 E.01293
G1 X136.461 Y109.263 E.05633
G1 X136.777 Y109.578 E.01792
G1 X137.017 Y109.578 E.00963
G1 X137.017 Y116.492 E.27769
G1 X137.894 Y116.492 E.03523
G1 X137.894 Y109.578 E.27769
G1 X138.771 Y109.578 E.03523
G1 X138.771 Y116.492 E.27769
G1 X139.648 Y116.492 E.03523
G1 X139.648 Y109.578 E.27769
G1 X140.525 Y109.578 E.03523
G1 X140.525 Y116.492 E.27769
G1 X141.402 Y116.492 E.03523
G1 X141.402 Y109.399 E.28488
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.127273
; WIPE_START
G1 F24000
G1 X141.402 Y111.399 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/118
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
G3 Z4.073 I-1.108 J.503 P1  F30000
G1 X166.407 Y166.431 Z4.073
G1 Z3.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LAYER_HEIGHT: 0.2
G1 F4625
G1 X166.41 Y166.431 E.00008
G1 X166.769 Y166.391 E.01111
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.198 Y170.73 E.00858
G1 X169.006 Y171.036 E.01111
G1 X168.553 Y171.489 E.01969
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X165.291 Y171.681 E.00858
G1 X164.985 Y171.489 E.01111
M73 P59 R11
G1 X164.532 Y171.036 E.01969
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.347 Y166.438 E.00666
M204 S10000
G1 X167.141 Y166 F30000
M204 S5000
G1 F4625
G1 X167.41 Y166.026 E.00832
G1 X168.027 Y166.213 E.01981
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X167.081 Y165.994 E.00965
M204 S10000
; WIPE_START
G1 F24000
G1 X167.41 Y166.026 E-.12569
G1 X168.027 Y166.213 E-.24501
G1 X168.596 Y166.517 E-.24501
G1 X168.89 Y166.758 E-.1443
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.999 J-.695 P1  F30000
G1 X122.398 Y99.938 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4625
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4625
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4625
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4625
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4625
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.007 J.293 E.01391
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.045 E.08557
G3 X127.988 Y105.75 I.303 J.008 E.01364
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F4625
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F4625
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F4625
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F4625
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F4625
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.819 J-.9 P1  F30000
G1 X92.77 Y141.45 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4625
G1 X92.773 Y141.449 E.00008
G1 X93.132 Y141.409 E.01111
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.561 Y145.748 E.00858
G1 X95.369 Y146.054 E.01111
G1 X94.916 Y146.507 E.01969
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.654 Y146.7 E.00858
G1 X91.348 Y146.507 E.01111
G1 X90.895 Y146.054 E.01969
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.71 Y141.457 E.00666
M204 S10000
G1 X93.504 Y141.018 F30000
M204 S5000
G1 F4625
G1 X93.773 Y141.045 E.00832
G1 X94.39 Y141.232 E.01981
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
G1 X93.444 Y141.012 E.00965
M204 S10000
; WIPE_START
G1 F24000
G1 X93.773 Y141.045 E-.12569
G1 X94.39 Y141.232 E-.24501
G1 X94.959 Y141.536 E-.245
G1 X95.253 Y141.777 E-.1443
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.141 J.423 P1  F30000
G1 X108.414 Y177.307 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F4625
G1 X108.417 Y177.307 E.00008
G1 X108.776 Y177.266 E.01111
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
G1 X111.354 Y181.369 E.01969
G1 X111.206 Y181.606 E.00858
G1 X111.013 Y181.912 E.01111
G1 X110.56 Y182.365 E.01969
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X107.298 Y182.557 E.00858
G1 X106.992 Y182.365 E.01111
G1 X106.539 Y181.912 E.01969
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.355 Y177.314 E.00666
M204 S10000
G1 X109.148 Y176.875 F30000
M204 S5000
G1 F4625
G1 X109.418 Y176.902 E.00832
G1 X110.035 Y177.089 E.01981
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X109.089 Y176.869 E.00965
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.94545
; LAYER_HEIGHT: 0.145455
; WIPE_START
G1 F24000
G1 X109.418 Y176.902 E-.12569
G1 X110.035 Y177.089 E-.24501
G1 X110.604 Y177.393 E-.245
G1 X110.897 Y177.634 E-.1443
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/118
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
G3 Z4.2 I1.189 J.26 P1  F30000
G1 X124.246 Y116.492 Z4.2
G1 Z3.945
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.272727
G1 F4036
G1 X118.492 Y116.492 E.23112
G1 X118.492 Y113.615 E.11556
G1 X124.246 Y113.615 E.23112
G1 X124.246 Y110.738 E.11556
G1 X118.492 Y110.738 E.23112
G1 X118.492 Y109.293 E.05802
G1 X118.777 Y109.578 E.0162
G1 X123.223 Y109.578 E.17859
G1 X123.539 Y109.263 E.01792
G1 X123.539 Y107.86 E.05632
G1 X124.246 Y107.86 E.02841
; WIPE_START
G1 F24000
G1 X123.539 Y107.86 E-.26878
G1 X123.539 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.345 I.128 J1.21 P1  F30000
G1 X135.754 Y107.86 Z4.345
G1 Z3.945
G1 E.8 F1800
G1 F4036
G1 X136.461 Y107.86 E.02841
G1 X136.461 Y109.263 E.05632
G1 X136.777 Y109.578 E.01792
G1 X141.223 Y109.578 E.17859
G1 X141.508 Y109.293 E.0162
G1 X141.508 Y110.738 E.05802
G1 X135.754 Y110.738 E.23112
G1 X135.754 Y113.615 E.11556
G1 X141.508 Y113.615 E.23112
G1 X141.508 Y116.492 E.11556
G1 X135.754 Y116.492 E.23112
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.0545454
; WIPE_START
G1 F24000
G1 X137.754 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/118
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
G3 Z4.345 I-1.056 J.605 P1  F30000
G1 X166.387 Y166.434 Z4.345
G1 Z4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LAYER_HEIGHT: 0.2
G1 F4036
G1 X166.392 Y166.433 E.00012
G1 X166.769 Y166.391 E.01167
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.006 Y171.036 E.01969
G1 X168.553 Y171.489 E.01969
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.509 Y172.084 E.00802
G1 X166.132 Y172.041 E.01167
G1 X165.527 Y171.83 E.01969
G1 X164.985 Y171.489 E.01969
G1 X164.532 Y171.036 E.01969
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.328 Y166.44 E.00605
M204 S10000
G1 X167.163 Y166.002 F30000
M204 S5000
G1 F4036
G1 X167.41 Y166.026 E.00764
G1 X168.027 Y166.213 E.01981
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X167.103 Y165.996 E.01033
M204 S10000
; WIPE_START
G1 F24000
G1 X167.41 Y166.026 E-.11724
G1 X168.027 Y166.213 E-.24501
G1 X168.596 Y166.517 E-.24501
G1 X168.907 Y166.772 E-.15275
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.999 J-.695 P1  F30000
G1 X122.398 Y99.938 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4036
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4036
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4036
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4036
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4036
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.007 J.293 E.01391
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.045 E.08557
G3 X127.989 Y105.75 I.291 J-.004 E.01378
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F4036
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
M73 P59 R10
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F4036
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F4036
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F4036
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F4036
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
M73 P60 R10
G1 X131.446 Y108.045 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.819 J-.9 P1  F30000
G1 X92.75 Y141.452 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4036
G1 X92.755 Y141.452 E.00012
G1 X93.132 Y141.409 E.01167
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.369 Y146.054 E.01969
G1 X94.916 Y146.507 E.01969
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.872 Y147.102 E.00802
G1 X92.495 Y147.06 E.01167
G1 X91.89 Y146.848 E.01969
G1 X91.348 Y146.507 E.01969
G1 X90.895 Y146.054 E.01969
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.691 Y141.459 E.00605
M204 S10000
G1 X93.526 Y141.02 F30000
M204 S5000
G1 F4036
G1 X93.773 Y141.045 E.00764
G1 X94.39 Y141.232 E.01981
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
G1 X93.466 Y141.014 E.01033
M204 S10000
; WIPE_START
G1 F24000
G1 X93.773 Y141.045 E-.11724
G1 X94.39 Y141.232 E-.24501
G1 X94.959 Y141.536 E-.245
G1 X95.27 Y141.791 E-.15275
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.142 J.422 P1  F30000
G1 X108.395 Y177.309 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F4036
G1 X108.399 Y177.309 E.00012
G1 X108.776 Y177.266 E.01167
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
G1 X111.354 Y181.369 E.01969
G1 X111.013 Y181.912 E.01969
G1 X110.56 Y182.365 E.01969
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.517 Y182.96 E.00802
G1 X108.14 Y182.917 E.01167
G1 X107.535 Y182.706 E.01969
G1 X106.992 Y182.365 E.01969
G1 X106.539 Y181.912 E.01969
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.335 Y177.316 E.00605
M204 S10000
G1 X109.171 Y176.878 F30000
M204 S5000
G1 F4036
G1 X109.418 Y176.902 E.00764
G1 X110.035 Y177.089 E.01981
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X109.111 Y176.872 E.01033
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.418 Y176.902 E-.11724
G1 X110.035 Y177.089 E-.24501
G1 X110.604 Y177.393 E-.245
G1 X110.914 Y177.648 E-.15275
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/118
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
G3 Z4.4 I.241 J1.193 P1  F30000
G1 X166.368 Y166.436 Z4.4
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F3348
G1 X166.373 Y166.435 E.00015
G1 X166.769 Y166.391 E.01223
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.006 Y171.036 E.01969
G1 X168.553 Y171.489 E.01969
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X164.985 Y171.489 E.01969
G1 X164.532 Y171.036 E.01969
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.309 Y166.442 E.00546
M204 S10000
G1 X167.185 Y166.004 F30000
M204 S5000
G1 F3348
G1 X167.41 Y166.026 E.00696
G1 X168.027 Y166.213 E.01981
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X167.125 Y165.998 E.01101
M204 S10000
; WIPE_START
G1 F24000
G1 X167.41 Y166.026 E-.10882
G1 X168.027 Y166.213 E-.24501
G1 X168.596 Y166.517 E-.245
G1 X168.924 Y166.786 E-.16117
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.999 J-.695 P1  F30000
G1 X122.398 Y99.938 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3348
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3348
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3348
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3348
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3348
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.045 E.08557
G3 X127.988 Y105.75 I.303 J.008 E.01364
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F3348
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F3348
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F3348
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F3348
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F3348
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.819 J-.9 P1  F30000
G1 X92.731 Y141.454 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3348
G1 X92.736 Y141.454 E.00015
G1 X93.132 Y141.409 E.01223
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.369 Y146.054 E.01969
G1 X94.916 Y146.507 E.01969
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.348 Y146.507 E.01969
G1 X90.895 Y146.054 E.01969
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.672 Y141.461 E.00546
M204 S10000
G1 X93.548 Y141.022 F30000
M204 S5000
G1 F3348
G1 X93.773 Y141.045 E.00696
G1 X94.39 Y141.232 E.01981
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
G1 X93.488 Y141.017 E.01101
M204 S10000
; WIPE_START
G1 F24000
G1 X93.773 Y141.045 E-.10882
G1 X94.39 Y141.232 E-.24501
G1 X94.959 Y141.536 E-.245
G1 X95.287 Y141.805 E-.16117
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.142 J.421 P1  F30000
G1 X108.376 Y177.311 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F3348
G1 X108.381 Y177.311 E.00015
G1 X108.776 Y177.266 E.01223
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
G1 X111.354 Y181.369 E.01969
G1 X111.013 Y181.912 E.01969
G1 X110.56 Y182.365 E.01969
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X106.992 Y182.365 E.01969
G1 X106.539 Y181.912 E.01969
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.316 Y177.318 E.00546
M204 S10000
G1 X109.193 Y176.88 F30000
M204 S5000
G1 F3348
G1 X109.418 Y176.902 E.00696
G1 X110.035 Y177.089 E.01981
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X109.133 Y176.874 E.01101
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.21818
; LAYER_HEIGHT: 0.0181818
; WIPE_START
G1 F24000
G1 X109.418 Y176.902 E-.10882
G1 X110.035 Y177.089 E-.24501
G1 X110.604 Y177.393 E-.245
G1 X110.931 Y177.662 E-.16117
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/118
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
G3 Z4.6 I1.189 J.259 P1  F30000
G1 X124.246 Y116.492 Z4.6
G1 Z4.218
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.272727
G1 F4146
G1 X118.492 Y116.492 E.23112
G1 X118.492 Y113.615 E.11556
G1 X124.246 Y113.615 E.23112
G1 X124.246 Y110.738 E.11556
G1 X118.492 Y110.738 E.23112
G1 X118.492 Y109.293 E.05802
G1 X118.777 Y109.578 E.0162
G1 X123.223 Y109.578 E.17859
G1 X123.539 Y109.263 E.01792
G1 X123.539 Y107.86 E.05632
G1 X124.246 Y107.86 E.02841
; WIPE_START
G1 F24000
G1 X123.539 Y107.86 E-.26878
G1 X123.539 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.618 I.128 J1.21 P1  F30000
G1 X135.754 Y107.86 Z4.618
G1 Z4.218
G1 E.8 F1800
G1 F4146
G1 X136.461 Y107.86 E.02841
G1 X136.461 Y109.263 E.05632
G1 X136.777 Y109.578 E.01792
G1 X141.223 Y109.578 E.17859
G1 X141.508 Y109.293 E.0162
G1 X141.508 Y110.738 E.05802
G1 X135.754 Y110.738 E.23112
G1 X135.754 Y113.615 E.11556
G1 X141.508 Y113.615 E.23112
G1 X141.508 Y116.492 E.11556
G1 X135.754 Y116.492 E.23112
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.181818
; WIPE_START
G1 F24000
G1 X137.754 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/118
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
G3 Z4.618 I-1.056 J.605 P1  F30000
G1 X166.349 Y166.438 Z4.618
G1 Z4.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LAYER_HEIGHT: 0.2
G1 F4146
G1 X166.355 Y166.437 E.00018
G1 X166.769 Y166.391 E.01279
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.125 Y167.658 E.0069
G1 X169.347 Y168.01 E.01279
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.006 Y171.036 E.01969
G1 X168.553 Y171.489 E.01969
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X164.985 Y171.489 E.01969
G1 X164.532 Y171.036 E.01969
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.29 Y166.445 E.00487
M204 S10000
; WIPE_START
G1 F24000
G1 X166.355 Y166.437 E-.02508
G1 X166.769 Y166.391 E-.15817
G1 X167.406 Y166.462 E-.24348
G1 X168.01 Y166.674 E-.24348
G1 X168.21 Y166.8 E-.0898
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.755 J-.955 P1  F30000
G1 X167.207 Y166.006 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F4146
G1 X167.41 Y166.026 E.00629
G1 X168.027 Y166.213 E.01981
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X167.147 Y166 E.01168
M204 S10000
; WIPE_START
G1 F24000
G1 X167.41 Y166.026 E-.10055
G1 X168.027 Y166.213 E-.24501
G1 X168.596 Y166.517 E-.24501
G1 X168.941 Y166.8 E-.16944
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.999 J-.695 P1  F30000
G1 X122.398 Y99.938 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4146
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4146
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4146
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z4.8
M73 P61 R10
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4146
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4146
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.007 J.293 E.01391
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.045 E.08557
G3 X127.988 Y105.75 I.291 J-.004 E.01378
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F4146
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F4146
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F4146
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F4146
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F4146
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.819 J-.9 P1  F30000
G1 X92.712 Y141.456 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4146
G1 X92.718 Y141.456 E.00018
G1 X93.132 Y141.409 E.01279
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.488 Y142.676 E.0069
G1 X95.71 Y143.029 E.01279
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.369 Y146.054 E.01969
G1 X94.916 Y146.507 E.01969
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.348 Y146.507 E.01969
G1 X90.895 Y146.054 E.01969
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.653 Y141.463 E.00487
M204 S10000
; WIPE_START
G1 F24000
G1 X92.718 Y141.456 E-.02508
G1 X93.132 Y141.409 E-.15817
G1 X93.769 Y141.481 E-.24348
G1 X94.373 Y141.692 E-.24348
G1 X94.573 Y141.818 E-.0898
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.755 J-.955 P1  F30000
G1 X93.57 Y141.025 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F4146
G1 X93.773 Y141.045 E.00629
G1 X94.39 Y141.232 E.01981
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
G1 X93.51 Y141.019 E.01168
M204 S10000
; WIPE_START
G1 F24000
G1 X93.773 Y141.045 E-.10055
G1 X94.39 Y141.232 E-.24501
G1 X94.959 Y141.536 E-.245
G1 X95.304 Y141.819 E-.16944
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.142 J.42 P1  F30000
G1 X108.357 Y177.314 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F4146
G1 X108.363 Y177.313 E.00018
G1 X108.776 Y177.266 E.01279
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.133 Y178.534 E.0069
G1 X111.354 Y178.886 E.01279
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
G1 X111.354 Y181.369 E.01969
G1 X111.013 Y181.912 E.01969
G1 X110.56 Y182.365 E.01969
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X106.992 Y182.365 E.01969
G1 X106.539 Y181.912 E.01969
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.297 Y177.32 E.00487
M204 S10000
; WIPE_START
G1 F24000
G1 X108.363 Y177.313 E-.02508
G1 X108.776 Y177.266 E-.15817
G1 X109.413 Y177.338 E-.24348
G1 X110.018 Y177.55 E-.24348
G1 X110.218 Y177.675 E-.0898
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.755 J-.955 P1  F30000
G1 X109.214 Y176.882 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F4146
G1 X109.418 Y176.902 E.00629
G1 X110.035 Y177.089 E.01981
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X109.155 Y176.876 E.01168
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.49091
; LAYER_HEIGHT: 0.090909
; WIPE_START
G1 F24000
G1 X109.418 Y176.902 E-.10055
G1 X110.035 Y177.089 E-.24501
G1 X110.604 Y177.393 E-.24501
G1 X110.948 Y177.676 E-.16944
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/118
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
G3 Z4.8 I1.189 J.258 P1  F30000
G1 X124.246 Y116.492 Z4.8
G1 Z4.491
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.272727
G1 F4146
G1 X118.492 Y116.492 E.23112
G1 X118.492 Y113.615 E.11556
G1 X124.246 Y113.615 E.23112
G1 X124.246 Y110.738 E.11556
G1 X118.492 Y110.738 E.23112
G1 X118.492 Y109.293 E.05802
G1 X118.777 Y109.578 E.0162
G1 X123.223 Y109.578 E.17859
G1 X123.539 Y109.263 E.01792
G1 X123.539 Y107.86 E.05632
G1 X124.246 Y107.86 E.02841
; WIPE_START
G1 F24000
G1 X123.539 Y107.86 E-.26878
G1 X123.539 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.891 I.128 J1.21 P1  F30000
G1 X135.754 Y107.86 Z4.891
G1 Z4.491
G1 E.8 F1800
G1 F4146
G1 X136.461 Y107.86 E.02841
G1 X136.461 Y109.263 E.05632
G1 X136.777 Y109.578 E.01792
G1 X141.223 Y109.578 E.17859
G1 X141.508 Y109.293 E.0162
G1 X141.508 Y110.738 E.05802
G1 X135.754 Y110.738 E.23112
G1 X135.754 Y113.615 E.11556
G1 X141.508 Y113.615 E.23112
G1 X141.508 Y116.492 E.11556
G1 X135.754 Y116.492 E.23112
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.109091
; WIPE_START
G1 F24000
G1 X137.754 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/118
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
G3 Z4.891 I-1.056 J.604 P1  F30000
G1 X166.331 Y166.44 Z4.891
G1 Z4.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LAYER_HEIGHT: 0.2
G1 F4146
G1 X166.337 Y166.439 E.0002
G1 X166.769 Y166.391 E.01335
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.237 Y170.668 E.00634
G1 X169.006 Y171.036 E.01335
G1 X168.553 Y171.489 E.01969
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X165.353 Y171.72 E.00634
G1 X164.985 Y171.489 E.01335
G1 X164.532 Y171.036 E.01969
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.271 Y166.447 E.00429
M204 S10000
; WIPE_START
G1 F24000
G1 X166.337 Y166.439 E-.02529
G1 X166.769 Y166.391 E-.1651
G1 X167.406 Y166.462 E-.24348
G1 X168.01 Y166.674 E-.24348
G1 X168.194 Y166.79 E-.08265
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.765 J-.946 P1  F30000
G1 X167.228 Y166.008 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F4146
G1 X167.41 Y166.026 E.00563
G1 X168.027 Y166.213 E.01981
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X167.168 Y166.002 E.01234
M204 S10000
; WIPE_START
G1 F24000
G1 X167.41 Y166.026 E-.0924
G1 X168.027 Y166.213 E-.24501
G1 X168.596 Y166.517 E-.24501
G1 X168.957 Y166.814 E-.17758
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.999 J-.695 P1  F30000
G1 X122.398 Y99.938 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4146
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4146
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4146
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4146
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4146
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.045 E.08557
G3 X127.989 Y105.75 I.291 J-.004 E.01378
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F4146
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z5
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F4146
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F4146
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F4146
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F4146
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.819 J-.9 P1  F30000
G1 X92.694 Y141.458 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4146
G1 X92.7 Y141.458 E.0002
G1 X93.132 Y141.409 E.01335
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.6 Y145.686 E.00634
G1 X95.369 Y146.054 E.01335
G1 X94.916 Y146.507 E.01969
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.716 Y146.739 E.00634
G1 X91.348 Y146.507 E.01335
G1 X90.895 Y146.054 E.01969
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.634 Y141.465 E.00429
M204 S10000
; WIPE_START
G1 F24000
G1 X92.7 Y141.458 E-.02529
G1 X93.132 Y141.409 E-.1651
G1 X93.769 Y141.481 E-.24348
G1 X94.373 Y141.692 E-.24348
G1 X94.557 Y141.808 E-.08265
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.765 J-.946 P1  F30000
G1 X93.591 Y141.027 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F4146
G1 X93.773 Y141.045 E.00563
G1 X94.39 Y141.232 E.01981
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
G1 X93.531 Y141.021 E.01234
M204 S10000
; WIPE_START
G1 F24000
G1 X93.773 Y141.045 E-.0924
G1 X94.39 Y141.232 E-.24501
G1 X94.959 Y141.536 E-.245
G1 X95.32 Y141.832 E-.17758
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.143 J.419 P1  F30000
G1 X108.338 Y177.316 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F4146
G1 X108.345 Y177.315 E.0002
G1 X108.776 Y177.266 E.01335
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
G1 X111.354 Y181.369 E.01969
G1 X111.245 Y181.544 E.00634
G1 X111.013 Y181.912 E.01335
G1 X110.56 Y182.365 E.01969
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X107.36 Y182.596 E.00634
G1 X106.992 Y182.365 E.01335
M73 P62 R10
G1 X106.539 Y181.912 E.01969
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.278 Y177.322 E.00429
M204 S10000
; WIPE_START
G1 F24000
G1 X108.345 Y177.315 E-.02529
G1 X108.776 Y177.266 E-.1651
G1 X109.413 Y177.338 E-.24348
G1 X110.018 Y177.55 E-.24348
G1 X110.202 Y177.665 E-.08265
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.765 J-.946 P1  F30000
G1 X109.236 Y176.884 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F4146
G1 X109.418 Y176.902 E.00563
G1 X110.035 Y177.089 E.01981
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X109.176 Y176.878 E.01234
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.76364
; LAYER_HEIGHT: 0.163637
; WIPE_START
G1 F24000
G1 X109.418 Y176.902 E-.0924
G1 X110.035 Y177.089 E-.24501
G1 X110.604 Y177.393 E-.245
G1 X110.965 Y177.689 E-.17758
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/118
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
G3 Z5 I1.189 J.258 P1  F30000
G1 X124.246 Y116.492 Z5
G1 Z4.764
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.272727
G1 F4146
G1 X118.492 Y116.492 E.23112
G1 X118.492 Y113.615 E.11556
G1 X124.246 Y113.615 E.23112
G1 X124.246 Y110.738 E.11556
G1 X118.492 Y110.738 E.23112
G1 X118.492 Y109.293 E.05802
G1 X118.777 Y109.578 E.0162
G1 X123.223 Y109.578 E.17859
G1 X123.539 Y109.263 E.01792
G1 X123.539 Y107.86 E.05632
G1 X124.246 Y107.86 E.02841
; WIPE_START
G1 F24000
G1 X123.539 Y107.86 E-.26878
G1 X123.539 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.164 I.128 J1.21 P1  F30000
G1 X135.754 Y107.86 Z5.164
G1 Z4.764
G1 E.8 F1800
G1 F4146
G1 X136.461 Y107.86 E.02841
G1 X136.461 Y109.263 E.05632
G1 X136.777 Y109.578 E.01792
G1 X141.223 Y109.578 E.17859
G1 X141.508 Y109.293 E.0162
G1 X141.508 Y110.738 E.05802
G1 X135.754 Y110.738 E.23112
G1 X135.754 Y113.615 E.11556
G1 X141.508 Y113.615 E.23112
G1 X141.508 Y116.492 E.11556
G1 X135.754 Y116.492 E.23112
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.0363636
; WIPE_START
G1 F24000
G1 X137.754 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/118
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
G3 Z5.164 I-1.056 J.604 P1  F30000
G1 X166.312 Y166.442 Z5.164
G1 Z4.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LAYER_HEIGHT: 0.2
G1 F4146
G1 X166.319 Y166.441 E.00021
G1 X166.769 Y166.391 E.01391
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.247 Y170.653 E.00578
G1 X169.006 Y171.036 E.01391
G1 X168.553 Y171.489 E.01969
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X165.368 Y171.73 E.00578
G1 X164.985 Y171.489 E.01391
G1 X164.532 Y171.036 E.01969
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.253 Y166.449 E.00373
M204 S10000
; WIPE_START
G1 F24000
G1 X166.319 Y166.441 E-.02536
G1 X166.769 Y166.391 E-.17204
G1 X167.406 Y166.462 E-.24348
G1 X168.01 Y166.674 E-.24348
G1 X168.179 Y166.78 E-.07564
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.776 J-.937 P1  F30000
G1 X167.249 Y166.01 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F4146
G1 X167.41 Y166.026 E.00498
G1 X168.027 Y166.213 E.01981
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X167.189 Y166.004 E.01299
M204 S10000
; WIPE_START
G1 F24000
G1 X167.41 Y166.026 E-.08442
G1 X168.027 Y166.213 E-.24501
G1 X168.596 Y166.517 E-.24501
G1 X168.974 Y166.827 E-.18557
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.999 J-.695 P1  F30000
G1 X122.398 Y99.938 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4146
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4146
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4146
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4146
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4146
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.007 J.293 E.01391
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.045 E.08557
G3 X127.988 Y105.75 I.299 J.004 E.01369
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F4146
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z5.2
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F4146
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F4146
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F4146
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F4146
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.818 J-.901 P1  F30000
G1 X92.675 Y141.46 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4146
G1 X92.682 Y141.46 E.00021
G1 X93.132 Y141.409 E.01391
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.61 Y145.671 E.00578
G1 X95.369 Y146.054 E.01391
G1 X94.916 Y146.507 E.01969
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.731 Y146.748 E.00578
G1 X91.348 Y146.507 E.01391
G1 X90.895 Y146.054 E.01969
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.616 Y141.467 E.00373
M204 S10000
; WIPE_START
G1 F24000
G1 X92.682 Y141.46 E-.02536
G1 X93.132 Y141.409 E-.17204
G1 X93.769 Y141.481 E-.24348
G1 X94.373 Y141.692 E-.24348
G1 X94.542 Y141.798 E-.07564
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.776 J-.937 P1  F30000
G1 X93.612 Y141.029 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F4146
G1 X93.773 Y141.045 E.00498
G1 X94.39 Y141.232 E.01981
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
G1 X93.552 Y141.023 E.01299
M204 S10000
; WIPE_START
G1 F24000
G1 X93.773 Y141.045 E-.08441
G1 X94.39 Y141.232 E-.24501
G1 X94.959 Y141.536 E-.245
G1 X95.337 Y141.845 E-.18557
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.143 J.418 P1  F30000
G1 X108.32 Y177.318 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F4146
G1 X108.326 Y177.317 E.00021
G1 X108.776 Y177.266 E.01391
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
G1 X111.354 Y181.369 E.01969
G1 X111.254 Y181.528 E.00578
G1 X111.013 Y181.912 E.01391
G1 X110.56 Y182.365 E.01969
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X107.376 Y182.606 E.00578
G1 X106.992 Y182.365 E.01391
G1 X106.539 Y181.912 E.01969
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.26 Y177.325 E.00373
M204 S10000
; WIPE_START
G1 F24000
G1 X108.326 Y177.317 E-.02536
G1 X108.776 Y177.266 E-.17204
G1 X109.413 Y177.338 E-.24348
G1 X110.018 Y177.55 E-.24348
G1 X110.186 Y177.656 E-.07564
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.776 J-.937 P1  F30000
G1 X109.257 Y176.886 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F4146
G1 X109.418 Y176.902 E.00498
G1 X110.035 Y177.089 E.01981
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X109.197 Y176.88 E.01299
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.418 Y176.902 E-.08441
G1 X110.035 Y177.089 E-.24501
G1 X110.604 Y177.393 E-.245
G1 X110.981 Y177.703 E-.18557
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/118
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
G3 Z5.2 I.243 J1.193 P1  F30000
G1 X166.294 Y166.444 Z5.2
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F3439
G1 X166.301 Y166.443 E.0002
G1 X166.769 Y166.391 E.01447
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.096 Y167.612 E.00522
G1 X169.347 Y168.01 E.01447
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.006 Y171.036 E.01969
G1 X168.553 Y171.489 E.01969
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X164.985 Y171.489 E.01969
G1 X164.532 Y171.036 E.01969
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.235 Y166.451 E.00317
M204 S10000
; WIPE_START
G1 F24000
G1 X166.301 Y166.443 E-.02528
G1 X166.769 Y166.391 E-.17898
G1 X167.406 Y166.462 E-.24348
G1 X168.01 Y166.674 E-.24348
G1 X168.164 Y166.77 E-.06878
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.787 J-.928 P1  F30000
G1 X167.27 Y166.012 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F3439
G1 X167.41 Y166.026 E.00435
G1 X168.027 Y166.213 E.01981
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X167.21 Y166.006 E.01362
M204 S10000
; WIPE_START
G1 F24000
G1 X167.41 Y166.026 E-.0766
G1 X168.027 Y166.213 E-.24501
G1 X168.596 Y166.517 E-.245
G1 X168.989 Y166.84 E-.19338
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.999 J-.695 P1  F30000
G1 X122.398 Y99.938 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3439
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3439
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3439
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3439
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3439
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
M73 P63 R10
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.045 E.08557
G3 X127.988 Y105.75 I.293 J-.002 E.01375
G1 X128.71 Y105.749 E.02218
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F3439
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F3439
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F3439
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F3439
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F3439
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.818 J-.901 P1  F30000
G1 X92.657 Y141.462 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3439
G1 X92.664 Y141.462 E.0002
G1 X93.132 Y141.409 E.01447
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.459 Y142.63 E.00522
G1 X95.71 Y143.029 E.01447
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.369 Y146.054 E.01969
G1 X94.916 Y146.507 E.01969
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.348 Y146.507 E.01969
G1 X90.895 Y146.054 E.01969
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.598 Y141.469 E.00317
M204 S10000
; WIPE_START
G1 F24000
G1 X92.664 Y141.462 E-.02528
G1 X93.132 Y141.409 E-.17898
G1 X93.769 Y141.481 E-.24348
G1 X94.373 Y141.692 E-.24348
G1 X94.527 Y141.789 E-.06878
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.787 J-.928 P1  F30000
G1 X93.633 Y141.031 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F3439
G1 X93.773 Y141.045 E.00435
G1 X94.39 Y141.232 E.01981
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
G1 X93.573 Y141.025 E.01362
M204 S10000
; WIPE_START
G1 F24000
G1 X93.773 Y141.045 E-.0766
G1 X94.39 Y141.232 E-.24501
G1 X94.959 Y141.536 E-.245
G1 X95.352 Y141.859 E-.19338
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.143 J.417 P1  F30000
G1 X108.302 Y177.32 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F3439
G1 X108.308 Y177.319 E.0002
G1 X108.776 Y177.266 E.01447
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.104 Y178.487 E.00522
G1 X111.354 Y178.886 E.01447
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
G1 X111.354 Y181.369 E.01969
G1 X111.013 Y181.912 E.01969
G1 X110.56 Y182.365 E.01969
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X106.992 Y182.365 E.01969
G1 X106.539 Y181.912 E.01969
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.242 Y177.327 E.00317
M204 S10000
; WIPE_START
G1 F24000
G1 X108.308 Y177.319 E-.02528
G1 X108.776 Y177.266 E-.17898
G1 X109.413 Y177.338 E-.24348
G1 X110.018 Y177.55 E-.24348
G1 X110.171 Y177.646 E-.06878
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.787 J-.928 P1  F30000
G1 X109.277 Y176.888 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F3439
G1 X109.418 Y176.902 E.00435
G1 X110.035 Y177.089 E.01981
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X109.217 Y176.882 E.01362
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.03636
; LAYER_HEIGHT: 0.0363636
; WIPE_START
G1 F24000
G1 X109.418 Y176.902 E-.0766
G1 X110.035 Y177.089 E-.24501
G1 X110.604 Y177.393 E-.245
G1 X110.997 Y177.716 E-.19338
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/118
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
G3 Z5.4 I1.189 J.257 P1  F30000
G1 X124.246 Y116.492 Z5.4
G1 Z5.036
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.272727
G1 F4145
G1 X118.492 Y116.492 E.23112
G1 X118.492 Y113.615 E.11556
G1 X124.246 Y113.615 E.23112
G1 X124.246 Y110.738 E.11556
G1 X118.492 Y110.738 E.23112
G1 X118.492 Y109.293 E.05802
G1 X118.777 Y109.578 E.0162
G1 X123.223 Y109.578 E.17859
G1 X123.539 Y109.263 E.01792
G1 X123.539 Y107.86 E.05632
G1 X124.246 Y107.86 E.02841
; WIPE_START
G1 F24000
G1 X123.539 Y107.86 E-.26878
G1 X123.539 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.436 I.128 J1.21 P1  F30000
G1 X135.754 Y107.86 Z5.436
G1 Z5.036
G1 E.8 F1800
G1 F4145
G1 X136.461 Y107.86 E.02841
G1 X136.461 Y109.263 E.05632
G1 X136.777 Y109.578 E.01792
G1 X141.223 Y109.578 E.17859
G1 X141.508 Y109.293 E.0162
G1 X141.508 Y110.738 E.05802
G1 X135.754 Y110.738 E.23112
G1 X135.754 Y113.615 E.11556
G1 X141.508 Y113.615 E.23112
G1 X141.508 Y116.492 E.11556
G1 X135.754 Y116.492 E.23112
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.163636
; WIPE_START
G1 F24000
G1 X137.754 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/118
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
G3 Z5.436 I-1.057 J.603 P1  F30000
G1 X166.277 Y166.446 Z5.436
G1 Z5.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LAYER_HEIGHT: 0.2
G1 F4145
G1 X166.283 Y166.445 E.00018
G1 X166.769 Y166.391 E.01503
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.266 Y170.622 E.00465
G1 X169.006 Y171.036 E.01503
G1 X168.553 Y171.489 E.01969
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X165.399 Y171.749 E.00465
G1 X164.985 Y171.489 E.01503
G1 X164.532 Y171.036 E.01969
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.217 Y166.453 E.00263
M204 S10000
; WIPE_START
G1 F24000
G1 X166.283 Y166.445 E-.02502
G1 X166.769 Y166.391 E-.18592
G1 X167.406 Y166.462 E-.24348
G1 X168.01 Y166.674 E-.24348
G1 X168.149 Y166.761 E-.0621
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.798 J-.919 P1  F30000
G1 X167.289 Y166.014 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F4145
G1 X167.41 Y166.026 E.00374
G1 X168.027 Y166.213 E.01981
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X167.23 Y166.008 E.01423
M204 S10000
; WIPE_START
G1 F24000
G1 X167.41 Y166.026 E-.06899
G1 X168.027 Y166.213 E-.24501
G1 X168.596 Y166.517 E-.245
G1 X169.005 Y166.853 E-.20099
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.999 J-.696 P1  F30000
G1 X122.398 Y99.938 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4145
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4145
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4145
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
M73 P63 R9
G1 F4145
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4145
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.045 E.08557
G3 X127.988 Y105.75 I.303 J.008 E.01364
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F4145
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z5.6
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F4145
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F4145
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F4145
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F4145
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.818 J-.901 P1  F30000
G1 X92.64 Y141.464 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4145
G1 X92.646 Y141.464 E.00018
G1 X93.132 Y141.409 E.01503
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.629 Y145.64 E.00465
G1 X95.369 Y146.054 E.01503
G1 X94.916 Y146.507 E.01969
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.762 Y146.768 E.00465
G1 X91.348 Y146.507 E.01503
G1 X90.895 Y146.054 E.01969
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.58 Y141.471 E.00263
M204 S10000
; WIPE_START
G1 F24000
G1 X92.646 Y141.464 E-.02502
G1 X93.132 Y141.409 E-.18592
G1 X93.769 Y141.481 E-.24348
G1 X94.373 Y141.692 E-.24348
G1 X94.512 Y141.779 E-.0621
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.798 J-.919 P1  F30000
G1 X93.652 Y141.033 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F4145
G1 X93.773 Y141.045 E.00374
G1 X94.39 Y141.232 E.01981
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
G1 X93.593 Y141.027 E.01423
M204 S10000
; WIPE_START
G1 F24000
G1 X93.773 Y141.045 E-.06899
G1 X94.39 Y141.232 E-.24501
G1 X94.959 Y141.536 E-.245
G1 X95.368 Y141.871 E-.20099
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.143 J.417 P1  F30000
G1 X108.284 Y177.322 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F4145
G1 X108.29 Y177.321 E.00018
G1 X108.776 Y177.266 E.01503
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
G1 X111.354 Y181.369 E.01969
G1 X111.274 Y181.497 E.00465
G1 X111.013 Y181.912 E.01503
G1 X110.56 Y182.365 E.01969
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X107.407 Y182.625 E.00465
G1 X106.992 Y182.365 E.01503
G1 X106.539 Y181.912 E.01969
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.225 Y177.329 E.00263
M204 S10000
; WIPE_START
G1 F24000
G1 X108.29 Y177.321 E-.02502
G1 X108.776 Y177.266 E-.18592
G1 X109.413 Y177.338 E-.24348
G1 X110.018 Y177.55 E-.24348
G1 X110.156 Y177.637 E-.0621
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.798 J-.919 P1  F30000
G1 X109.297 Y176.89 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
G1 F4145
G1 X109.418 Y176.902 E.00374
G1 X110.035 Y177.089 E.01981
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X109.237 Y176.884 E.01423
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.30909
; LAYER_HEIGHT: 0.109091
; WIPE_START
G1 F24000
G1 X109.418 Y176.902 E-.06899
G1 X110.035 Y177.089 E-.24501
G1 X110.604 Y177.393 E-.245
G1 X111.012 Y177.729 E-.20099
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/118
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
G3 Z5.6 I1.19 J.257 P1  F30000
G1 X124.246 Y116.492 Z5.6
G1 Z5.309
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.272727
G1 F4145
G1 X118.492 Y116.492 E.23112
G1 X118.492 Y113.615 E.11556
G1 X124.246 Y113.615 E.23112
G1 X124.246 Y110.738 E.11556
G1 X118.492 Y110.738 E.23112
G1 X118.492 Y109.293 E.05802
G1 X118.777 Y109.578 E.0162
G1 X123.223 Y109.578 E.17859
G1 X123.539 Y109.263 E.01792
G1 X123.539 Y107.86 E.05632
G1 X124.246 Y107.86 E.02841
; WIPE_START
G1 F24000
G1 X123.539 Y107.86 E-.26878
G1 X123.539 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.709 I.128 J1.21 P1  F30000
G1 X135.754 Y107.86 Z5.709
G1 Z5.309
G1 E.8 F1800
G1 F4145
G1 X136.461 Y107.86 E.02841
G1 X136.461 Y109.263 E.05632
G1 X136.777 Y109.578 E.01792
G1 X141.223 Y109.578 E.17859
G1 X141.508 Y109.293 E.0162
G1 X141.508 Y110.738 E.05802
G1 X135.754 Y110.738 E.23112
G1 X135.754 Y113.615 E.11556
G1 X141.508 Y113.615 E.23112
G1 X141.508 Y116.492 E.11556
G1 X135.754 Y116.492 E.23112
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.090909
; WIPE_START
G1 F24000
G1 X137.754 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/118
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
G3 Z5.709 I-1.057 J.603 P1  F30000
G1 X166.26 Y166.448 Z5.709
G1 Z5.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LAYER_HEIGHT: 0.2
G1 F4145
G1 X166.265 Y166.447 E.00014
G1 X166.769 Y166.391 E.01559
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
M73 P64 R9
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.276 Y170.606 E.00409
G1 X169.006 Y171.036 E.01559
G1 X168.553 Y171.489 E.01969
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X165.415 Y171.759 E.00409
G1 X164.985 Y171.489 E.01559
G1 X164.532 Y171.036 E.01969
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.2 Y166.455 E.00211
M204 S10000
; WIPE_START
G1 F24000
G1 X166.265 Y166.447 E-.02457
G1 X166.769 Y166.391 E-.19286
G1 X167.406 Y166.462 E-.24348
G1 X168.01 Y166.674 E-.24348
G1 X168.134 Y166.752 E-.05562
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.81 J-.908 P1  F30000
G1 X167.309 Y166.016 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F4145
G1 X167.41 Y166.026 E.00314
G1 X168.027 Y166.213 E.01981
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X167.249 Y166.01 E.01483
M204 S10000
; WIPE_START
G1 F24000
G1 X167.41 Y166.026 E-.06161
G1 X168.027 Y166.213 E-.24501
G1 X168.596 Y166.517 E-.24501
G1 X169.02 Y166.865 E-.20838
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.999 J-.696 P1  F30000
G1 X122.398 Y99.938 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4145
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4145
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4145
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4145
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4145
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.007 J.293 E.01391
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.045 E.08557
G3 X127.988 Y105.75 I.303 J.008 E.01363
G1 X128.71 Y105.749 E.02218
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F4145
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F4145
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F4145
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F4145
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F4145
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.818 J-.901 P1  F30000
G1 X92.623 Y141.466 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4145
G1 X92.627 Y141.466 E.00014
G1 X93.132 Y141.409 E.01559
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.639 Y145.625 E.00409
G1 X95.369 Y146.054 E.01559
G1 X94.916 Y146.507 E.01969
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.778 Y146.777 E.00409
G1 X91.348 Y146.507 E.01559
G1 X90.895 Y146.054 E.01969
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.563 Y141.473 E.00211
M204 S10000
; WIPE_START
G1 F24000
G1 X92.627 Y141.466 E-.02457
G1 X93.132 Y141.409 E-.19286
G1 X93.769 Y141.481 E-.24348
G1 X94.373 Y141.692 E-.24348
G1 X94.497 Y141.77 E-.05562
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.81 J-.908 P1  F30000
G1 X93.672 Y141.035 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F4145
G1 X93.773 Y141.045 E.00314
G1 X94.39 Y141.232 E.01981
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
G1 X93.612 Y141.029 E.01483
M204 S10000
; WIPE_START
G1 F24000
G1 X93.773 Y141.045 E-.06161
G1 X94.39 Y141.232 E-.24501
G1 X94.959 Y141.536 E-.245
G1 X95.383 Y141.884 E-.20838
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.144 J.416 P1  F30000
G1 X108.267 Y177.324 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F4145
G1 X108.272 Y177.323 E.00014
G1 X108.776 Y177.266 E.01559
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
G1 X111.354 Y181.369 E.01969
G1 X111.283 Y181.482 E.00409
G1 X111.013 Y181.912 E.01559
G1 X110.56 Y182.365 E.01969
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X107.422 Y182.635 E.00409
G1 X106.992 Y182.365 E.01559
G1 X106.539 Y181.912 E.01969
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.208 Y177.33 E.00211
M204 S10000
; WIPE_START
G1 F24000
G1 X108.272 Y177.323 E-.02457
G1 X108.776 Y177.266 E-.19286
G1 X109.413 Y177.338 E-.24348
G1 X110.018 Y177.55 E-.24348
G1 X110.142 Y177.628 E-.05562
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.81 J-.908 P1  F30000
G1 X109.316 Y176.892 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
G1 F4145
G1 X109.418 Y176.902 E.00314
G1 X110.035 Y177.089 E.01981
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X109.257 Y176.886 E.01483
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.58182
; LAYER_HEIGHT: 0.181818
; WIPE_START
G1 F24000
G1 X109.418 Y176.902 E-.06161
G1 X110.035 Y177.089 E-.24501
G1 X110.604 Y177.393 E-.245
G1 X111.027 Y177.741 E-.20838
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/118
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
G3 Z5.8 I1.19 J.257 P1  F30000
G1 X124.246 Y116.492 Z5.8
G1 Z5.582
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.272727
G1 F4145
G1 X118.492 Y116.492 E.23112
G1 X118.492 Y113.615 E.11556
G1 X124.246 Y113.615 E.23112
G1 X124.246 Y110.738 E.11556
G1 X118.492 Y110.738 E.23112
G1 X118.492 Y109.293 E.05802
G1 X118.777 Y109.578 E.0162
G1 X123.223 Y109.578 E.17859
G1 X123.539 Y109.263 E.01792
G1 X123.539 Y107.86 E.05632
G1 X124.246 Y107.86 E.02841
; WIPE_START
G1 F24000
G1 X123.539 Y107.86 E-.26878
G1 X123.539 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.982 I.128 J1.21 P1  F30000
G1 X135.754 Y107.86 Z5.982
G1 Z5.582
G1 E.8 F1800
G1 F4145
G1 X136.461 Y107.86 E.02841
G1 X136.461 Y109.263 E.05632
G1 X136.777 Y109.578 E.01792
G1 X141.223 Y109.578 E.17859
G1 X141.508 Y109.293 E.0162
G1 X141.508 Y110.738 E.05802
G1 X135.754 Y110.738 E.23112
G1 X135.754 Y113.615 E.11556
G1 X141.508 Y113.615 E.23112
G1 X141.508 Y116.492 E.11556
G1 X135.754 Y116.492 E.23112
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.0181818
; WIPE_START
G1 F24000
G1 X137.754 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/118
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
G3 Z5.982 I-1.057 J.603 P1  F30000
G1 X166.243 Y166.45 Z5.982
G1 Z5.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LAYER_HEIGHT: 0.2
G1 F4145
G1 X166.246 Y166.449 E.00009
G1 X166.769 Y166.391 E.01616
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.006 Y171.036 E.01969
G1 X168.553 Y171.489 E.01969
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X164.985 Y171.489 E.01969
G1 X164.532 Y171.036 E.01969
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.184 Y166.456 E.0016
M204 S10000
; WIPE_START
G1 F24000
G1 X166.246 Y166.449 E-.02389
G1 X166.769 Y166.391 E-.1998
G1 X167.406 Y166.462 E-.24348
G1 X168.01 Y166.674 E-.24348
G1 X168.12 Y166.743 E-.04935
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.821 J-.898 P1  F30000
G1 X167.328 Y166.018 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F4145
G1 X167.41 Y166.026 E.00256
G1 X168.027 Y166.213 E.01981
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X167.268 Y166.012 E.01541
M204 S10000
; WIPE_START
G1 F24000
G1 X167.41 Y166.026 E-.05447
G1 X168.027 Y166.213 E-.24501
G1 X168.596 Y166.517 E-.24501
G1 X169.034 Y166.877 E-.21551
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.999 J-.696 P1  F30000
G1 X122.398 Y99.938 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4145
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4145
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4145
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4145
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4145
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
M73 P65 R9
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.007 J.293 E.01391
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.045 E.08557
G3 X127.989 Y105.75 I.303 J.008 E.01364
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F4145
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z6
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F4145
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F4145
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F4145
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F4145
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.818 J-.901 P1  F30000
G1 X92.606 Y141.468 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4145
G1 X92.609 Y141.468 E.00009
G1 X93.132 Y141.409 E.01616
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.369 Y146.054 E.01969
G1 X94.916 Y146.507 E.01969
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.348 Y146.507 E.01969
G1 X90.895 Y146.054 E.01969
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.547 Y141.475 E.0016
M204 S10000
; WIPE_START
G1 F24000
G1 X92.609 Y141.468 E-.02389
G1 X93.132 Y141.409 E-.1998
G1 X93.769 Y141.481 E-.24348
G1 X94.373 Y141.692 E-.24348
G1 X94.483 Y141.761 E-.04935
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.821 J-.898 P1  F30000
G1 X93.691 Y141.036 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F4145
G1 X93.773 Y141.045 E.00256
G1 X94.39 Y141.232 E.01981
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
G1 X93.631 Y141.031 E.01541
M204 S10000
; WIPE_START
G1 F24000
G1 X93.773 Y141.045 E-.05447
G1 X94.39 Y141.232 E-.24501
G1 X94.959 Y141.536 E-.245
G1 X95.397 Y141.895 E-.21552
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.144 J.415 P1  F30000
G1 X108.251 Y177.326 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F4145
G1 X108.254 Y177.325 E.00009
G1 X108.776 Y177.266 E.01616
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
G1 X111.354 Y181.369 E.01969
G1 X111.013 Y181.912 E.01969
G1 X110.56 Y182.365 E.01969
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X106.992 Y182.365 E.01969
G1 X106.539 Y181.912 E.01969
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.191 Y177.332 E.0016
M204 S10000
; WIPE_START
G1 F24000
G1 X108.254 Y177.325 E-.02389
G1 X108.776 Y177.266 E-.1998
G1 X109.413 Y177.338 E-.24348
G1 X110.018 Y177.55 E-.24348
G1 X110.128 Y177.619 E-.04935
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.821 J-.898 P1  F30000
G1 X109.335 Y176.894 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
G1 F4145
G1 X109.418 Y176.902 E.00256
G1 X110.035 Y177.089 E.01981
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X109.275 Y176.888 E.01541
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.418 Y176.902 E-.05447
G1 X110.035 Y177.089 E-.24501
G1 X110.604 Y177.393 E-.245
G1 X111.042 Y177.753 E-.21552
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/118
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
G3 Z6 I.244 J1.192 P1  F30000
G1 X166.228 Y166.452 Z6
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F3438
G1 X166.228 Y166.451 E.00001
G1 X166.769 Y166.391 E.01672
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.619 Y169.348 E.00297
G1 X169.558 Y169.889 E.01672
G1 X169.347 Y170.493 E.01969
G1 X169.006 Y171.036 E.01969
G1 X168.553 Y171.489 E.01969
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.673 Y172.102 E.00297
G1 X166.132 Y172.041 E.01672
G1 X165.527 Y171.83 E.01969
G1 X164.985 Y171.489 E.01969
G1 X164.532 Y171.036 E.01969
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.168 Y166.458 E.00111
M204 S10000
; WIPE_START
G1 F24000
G1 X166.228 Y166.451 E-.02298
G1 X166.769 Y166.391 E-.20673
G1 X167.406 Y166.462 E-.24348
G1 X168.01 Y166.674 E-.24348
G1 X168.107 Y166.735 E-.04332
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.833 J-.887 P1  F30000
G1 X167.346 Y166.02 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F3438
G1 X167.347 Y166.02 E.00005
G1 X168.027 Y166.213 E.02174
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X167.286 Y166.014 E.01596
M204 S10000
; WIPE_START
G1 F24000
G1 X167.347 Y166.02 E-.02338
G1 X168.027 Y166.213 E-.26881
G1 X168.596 Y166.517 E-.24501
G1 X169.049 Y166.889 E-.22281
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.998 J-.696 P1  F30000
G1 X122.398 Y99.938 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3438
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3438
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3438
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3438
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3438
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.007 J.293 E.01391
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.045 E.08557
G3 X127.988 Y105.75 I.303 J.008 E.01364
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F3438
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z6.2
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F3438
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F3438
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F3438
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F3438
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.818 J-.901 P1  F30000
G1 X92.591 Y141.47 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3438
G1 X92.591 Y141.47 E.00001
G1 X93.132 Y141.409 E.01672
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.982 Y144.366 E.00297
G1 X95.921 Y144.907 E.01672
G1 X95.71 Y145.512 E.01969
G1 X95.369 Y146.054 E.01969
G1 X94.916 Y146.507 E.01969
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X93.036 Y147.121 E.00297
G1 X92.495 Y147.06 E.01672
G1 X91.89 Y146.848 E.01969
G1 X91.348 Y146.507 E.01969
G1 X90.895 Y146.054 E.01969
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.531 Y141.477 E.00111
M204 S10000
; WIPE_START
G1 F24000
G1 X92.591 Y141.47 E-.02298
G1 X93.132 Y141.409 E-.20673
G1 X93.769 Y141.481 E-.24348
G1 X94.373 Y141.692 E-.24348
G1 X94.47 Y141.753 E-.04332
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.833 J-.887 P1  F30000
G1 X93.709 Y141.038 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F3438
G1 X93.71 Y141.038 E.00005
G1 X94.39 Y141.232 E.02174
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
G1 X93.649 Y141.032 E.01596
M204 S10000
; WIPE_START
G1 F24000
G1 X93.71 Y141.038 E-.02338
G1 X94.39 Y141.232 E-.26881
G1 X94.959 Y141.536 E-.245
G1 X95.412 Y141.908 E-.22281
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.144 J.414 P1  F30000
G1 X108.235 Y177.327 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F3438
G1 X108.236 Y177.327 E.00001
G1 X108.776 Y177.266 E.01672
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.627 Y180.224 E.00297
G1 X111.566 Y180.764 E.01672
G1 X111.354 Y181.369 E.01969
G1 X111.013 Y181.912 E.01969
G1 X110.56 Y182.365 E.01969
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.68 Y182.978 E.00297
G1 X108.14 Y182.917 E.01672
G1 X107.535 Y182.706 E.01969
G1 X106.992 Y182.365 E.01969
G1 X106.539 Y181.912 E.01969
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.176 Y177.334 E.00111
M204 S10000
; WIPE_START
G1 F24000
G1 X108.236 Y177.327 E-.02298
G1 X108.776 Y177.266 E-.20673
G1 X109.413 Y177.338 E-.24348
G1 X110.018 Y177.55 E-.24348
G1 X110.114 Y177.61 E-.04332
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.833 J-.887 P1  F30000
G1 X109.353 Y176.896 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
G1 F3438
G1 X109.354 Y176.896 E.00005
G1 X110.035 Y177.089 E.02174
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X109.293 Y176.89 E.01596
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.85455
; LAYER_HEIGHT: 0.0545454
; WIPE_START
G1 F24000
G1 X109.354 Y176.896 E-.02338
G1 X110.035 Y177.089 E-.26881
G1 X110.604 Y177.393 E-.245
G1 X111.057 Y177.765 E-.22281
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/118
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
G3 Z6.2 I1.19 J.256 P1  F30000
G1 X124.246 Y116.492 Z6.2
G1 Z5.855
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.272727
G1 F4145
G1 X118.492 Y116.492 E.23112
G1 X118.492 Y113.615 E.11556
G1 X124.246 Y113.615 E.23112
G1 X124.246 Y110.738 E.11556
G1 X118.492 Y110.738 E.23112
G1 X118.492 Y109.293 E.05802
G1 X118.777 Y109.578 E.0162
G1 X123.223 Y109.578 E.17859
G1 X123.539 Y109.263 E.01792
G1 X123.539 Y107.86 E.05632
G1 X124.246 Y107.86 E.02841
; WIPE_START
G1 F24000
G1 X123.539 Y107.86 E-.26878
G1 X123.539 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.255 I.128 J1.21 P1  F30000
G1 X135.754 Y107.86 Z6.255
G1 Z5.855
G1 E.8 F1800
G1 F4145
G1 X136.461 Y107.86 E.02841
G1 X136.461 Y109.263 E.05632
G1 X136.777 Y109.578 E.01792
G1 X141.223 Y109.578 E.17859
G1 X141.508 Y109.293 E.0162
G1 X141.508 Y110.738 E.05802
G1 X135.754 Y110.738 E.23112
G1 X135.754 Y113.615 E.11556
G1 X141.508 Y113.615 E.23112
G1 X141.508 Y116.492 E.11556
G1 X135.754 Y116.492 E.23112
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.145454
; WIPE_START
G1 F24000
G1 X137.754 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/118
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
G3 Z6.255 I-1.057 J.602 P1  F30000
G1 X166.213 Y166.453 Z6.255
G1 Z6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LAYER_HEIGHT: 0.2
G1 F4145
G1 X166.769 Y166.391 E.0172
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.006 Y171.036 E.01969
G1 X168.553 Y171.489 E.01969
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X164.985 Y171.489 E.01969
G1 X164.532 Y171.036 E.01969
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.153 Y166.46 E.00065
M204 S10000
; WIPE_START
G1 F24000
G1 X166.769 Y166.391 E-.23549
G1 X167.406 Y166.462 E-.24348
G1 X168.01 Y166.674 E-.24348
G1 X168.094 Y166.727 E-.03755
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.845 J-.876 P1  F30000
G1 X167.363 Y166.021 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
G1 F4145
G1 X167.368 Y166.022 E.00016
G1 X168.027 Y166.213 E.0211
M73 P66 R9
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X167.303 Y166.016 E.01649
M204 S10000
; WIPE_START
G1 F24000
G1 X167.368 Y166.022 E-.02483
G1 X168.027 Y166.213 E-.26092
G1 X168.596 Y166.517 E-.245
G1 X169.062 Y166.9 E-.22925
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.998 J-.696 P1  F30000
G1 X122.398 Y99.938 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4145
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4145
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4145
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4145
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4145
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.007 J.293 E.01391
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.045 E.08557
G3 X127.988 Y105.75 I.299 J.004 E.01368
G1 X128.71 Y105.749 E.02218
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F4145
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z6.4
G1 Z6
G1 E.8 F1800
G1 F4145
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F4145
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F4145
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F4145
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.817 J-.902 P1  F30000
G1 X92.576 Y141.472 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4145
G1 X93.132 Y141.409 E.0172
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.369 Y146.054 E.01969
G1 X94.916 Y146.507 E.01969
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.348 Y146.507 E.01969
G1 X90.895 Y146.054 E.01969
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.516 Y141.478 E.00065
M204 S10000
; WIPE_START
G1 F24000
G1 X93.132 Y141.409 E-.23549
G1 X93.769 Y141.481 E-.24348
G1 X94.373 Y141.692 E-.24348
G1 X94.457 Y141.745 E-.03755
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.845 J-.876 P1  F30000
G1 X93.726 Y141.04 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
G1 F4145
G1 X93.731 Y141.04 E.00016
G1 X94.39 Y141.232 E.0211
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
G1 X93.666 Y141.034 E.01649
M204 S10000
; WIPE_START
G1 F24000
G1 X93.731 Y141.04 E-.02483
G1 X94.39 Y141.232 E-.26092
G1 X94.959 Y141.536 E-.245
G1 X95.425 Y141.918 E-.22925
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.145 J.414 P1  F30000
G1 X108.22 Y177.329 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
G1 F4145
G1 X108.776 Y177.266 E.0172
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
G1 X111.354 Y181.369 E.01969
G1 X111.013 Y181.912 E.01969
G1 X110.56 Y182.365 E.01969
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X106.992 Y182.365 E.01969
G1 X106.539 Y181.912 E.01969
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.16 Y177.336 E.00065
M204 S10000
; WIPE_START
G1 F24000
G1 X108.776 Y177.266 E-.23549
G1 X109.413 Y177.338 E-.24348
G1 X110.018 Y177.55 E-.24348
G1 X110.101 Y177.602 E-.03755
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.845 J-.876 P1  F30000
G1 X109.37 Y176.897 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
G1 F4145
G1 X109.375 Y176.898 E.00016
G1 X110.035 Y177.089 E.0211
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X109.31 Y176.891 E.01649
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6.12727
; LAYER_HEIGHT: 0.127273
; WIPE_START
G1 F24000
G1 X109.375 Y176.898 E-.02483
G1 X110.035 Y177.089 E-.26092
G1 X110.604 Y177.393 E-.245
G1 X111.07 Y177.776 E-.22925
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/118
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
G3 Z6.4 I1.19 J.256 P1  F30000
G1 X124.246 Y116.492 Z6.4
G1 Z6.127
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.272727
G1 F4145
G1 X118.492 Y116.492 E.23112
G1 X118.492 Y113.615 E.11556
G1 X124.246 Y113.615 E.23112
G1 X124.246 Y110.738 E.11556
G1 X118.492 Y110.738 E.23112
G1 X118.492 Y109.293 E.05802
G1 X118.777 Y109.578 E.0162
G1 X123.223 Y109.578 E.17859
G1 X123.539 Y109.263 E.01792
G1 X123.539 Y107.86 E.05632
G1 X124.246 Y107.86 E.02841
; WIPE_START
G1 F24000
G1 X123.539 Y107.86 E-.26878
G1 X123.539 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.527 I.128 J1.21 P1  F30000
G1 X135.754 Y107.86 Z6.527
G1 Z6.127
G1 E.8 F1800
G1 F4145
G1 X136.461 Y107.86 E.02841
G1 X136.461 Y109.263 E.05632
G1 X136.777 Y109.578 E.01792
G1 X141.223 Y109.578 E.17859
G1 X141.508 Y109.293 E.0162
G1 X141.508 Y110.738 E.05802
G1 X135.754 Y110.738 E.23112
G1 X135.754 Y113.615 E.11556
G1 X141.508 Y113.615 E.23112
G1 X141.508 Y116.492 E.11556
G1 X135.754 Y116.492 E.23112
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.0727272
; WIPE_START
G1 F24000
G1 X137.754 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/118
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
G3 Z6.527 I-1.058 J.602 P1  F30000
G1 X166.198 Y166.455 Z6.527
G1 Z6.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LAYER_HEIGHT: 0.2
G1 F4145
G1 X166.769 Y166.391 E.01764
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.63 Y169.252 E.01969
G1 X169.558 Y169.889 E.01969
G1 X169.347 Y170.493 E.01969
G1 X169.006 Y171.036 E.01969
G1 X168.553 Y171.489 E.01969
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X164.985 Y171.489 E.01969
G1 X164.532 Y171.036 E.01969
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.132 Y166.462 E.01969
G1 X166.139 Y166.462 E.0002
M204 S10000
; WIPE_START
G1 F24000
G1 X166.769 Y166.391 E-.24098
G1 X167.406 Y166.462 E-.24348
G1 X168.01 Y166.674 E-.24348
G1 X168.082 Y166.719 E-.03206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.856 J-.865 P1  F30000
G1 X167.379 Y166.023 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
G1 F4145
G1 X167.389 Y166.024 E.00031
G1 X168.027 Y166.213 E.02046
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X167.319 Y166.017 E.017
M204 S10000
; WIPE_START
G1 F24000
G1 X167.389 Y166.024 E-.02659
G1 X168.027 Y166.213 E-.25304
G1 X168.596 Y166.517 E-.24501
G1 X169.075 Y166.91 E-.23536
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.998 J-.696 P1  F30000
G1 X122.398 Y99.938 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4145
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4145
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4145
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4145
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4145
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.005 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.045 E.08557
G3 X127.988 Y105.75 I.303 J.008 E.01364
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.285 Y104.922 E.00748
G1 X129.29 Y105.75 E.02544
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F4145
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F4145
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F4145
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F4145
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F4145
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
M73 P67 R9
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.817 J-.902 P1  F30000
G1 X92.561 Y141.473 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4145
G1 X93.132 Y141.409 E.01764
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.993 Y144.27 E.01969
G1 X95.921 Y144.907 E.01969
G1 X95.71 Y145.512 E.01969
G1 X95.369 Y146.054 E.01969
G1 X94.916 Y146.507 E.01969
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.348 Y146.507 E.01969
G1 X90.895 Y146.054 E.01969
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.495 Y141.481 E.01969
G1 X92.502 Y141.48 E.0002
M204 S10000
; WIPE_START
G1 F24000
G1 X93.132 Y141.409 E-.24098
G1 X93.769 Y141.481 E-.24348
G1 X94.373 Y141.692 E-.24348
G1 X94.445 Y141.737 E-.03206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.856 J-.865 P1  F30000
G1 X93.742 Y141.041 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
G1 F4145
G1 X93.752 Y141.042 E.00031
G1 X94.39 Y141.232 E.02046
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
G1 X93.682 Y141.036 E.017
M204 S10000
; WIPE_START
G1 F24000
G1 X93.752 Y141.042 E-.02659
G1 X94.39 Y141.232 E-.25304
G1 X94.959 Y141.536 E-.245
G1 X95.438 Y141.929 E-.23536
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.145 J.413 P1  F30000
G1 X108.206 Y177.331 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
G1 F4145
G1 X108.776 Y177.266 E.01764
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.638 Y180.128 E.01969
G1 X111.566 Y180.764 E.01969
G1 X111.354 Y181.369 E.01969
G1 X111.013 Y181.912 E.01969
G1 X110.56 Y182.365 E.01969
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X106.992 Y182.365 E.01969
G1 X106.539 Y181.912 E.01969
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.14 Y177.338 E.01969
G1 X108.146 Y177.337 E.0002
M204 S10000
; WIPE_START
G1 F24000
G1 X108.776 Y177.266 E-.24098
G1 X109.413 Y177.338 E-.24348
G1 X110.018 Y177.55 E-.24348
G1 X110.089 Y177.595 E-.03206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.856 J-.865 P1  F30000
G1 X109.387 Y176.899 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
G1 F4145
G1 X109.397 Y176.9 E.00031
G1 X110.035 Y177.089 E.02046
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X109.327 Y176.893 E.017
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.397 Y176.9 E-.02659
G1 X110.035 Y177.089 E-.25304
G1 X110.604 Y177.393 E-.245
G1 X111.082 Y177.786 E-.23536
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/118
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
G3 Z6.6 I.245 J1.192 P1  F30000
G1 X166.185 Y166.456 Z6.6
G1 Z6.4
G1 E.8 F1800
M204 S5000
G1 F4063
G1 X166.769 Y166.391 E.01806
G1 X167.406 Y166.462 E.01969
G1 X168.01 Y166.674 E.01969
G1 X168.553 Y167.015 E.01969
G1 X169.006 Y167.468 E.01969
G1 X169.347 Y168.01 E.01969
G1 X169.558 Y168.615 E.01969
G1 X169.625 Y169.294 E.02095
G1 X169.558 Y169.889 E.0184
G1 X169.347 Y170.493 E.01969
G1 X169.006 Y171.036 E.01969
G1 X168.553 Y171.489 E.01969
G1 X168.01 Y171.83 E.01969
G1 X167.406 Y172.041 E.01969
G1 X166.769 Y172.113 E.01969
G1 X166.132 Y172.041 E.01969
G1 X165.527 Y171.83 E.01969
G1 X164.985 Y171.489 E.01969
G1 X164.532 Y171.036 E.01969
G1 X164.191 Y170.493 E.01969
G1 X163.979 Y169.889 E.01969
G1 X163.908 Y169.252 E.01969
G1 X163.979 Y168.615 E.01969
G1 X164.191 Y168.01 E.01969
G1 X164.532 Y167.468 E.01969
G1 X164.985 Y167.015 E.01969
G1 X165.527 Y166.674 E.01969
G1 X166.127 Y166.473 E.01944
M204 S10000
; WIPE_START
G1 F24000
G1 X166.769 Y166.391 E-.2458
G1 X167.406 Y166.462 E-.24348
G1 X168.01 Y166.674 E-.24348
G1 X168.071 Y166.712 E-.02724
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.868 J-.853 P1  F30000
G1 X167.395 Y166.025 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
G1 F4063
G1 X167.41 Y166.026 E.00048
G1 X168.027 Y166.213 E.01982
G1 X168.596 Y166.517 E.01981
G1 X169.094 Y166.926 E.01981
G1 X169.504 Y167.425 E.01981
G1 X169.807 Y167.993 E.01981
G1 X169.995 Y168.61 E.01981
G1 X170.058 Y169.252 E.01981
G1 X169.995 Y169.894 E.01981
G1 X169.807 Y170.511 E.01981
G1 X169.504 Y171.079 E.01981
G1 X169.094 Y171.578 E.01981
G1 X168.596 Y171.987 E.01981
G1 X168.027 Y172.291 E.01981
G1 X167.41 Y172.478 E.01981
M73 P67 R8
G1 X166.769 Y172.541 E.01981
G1 X166.127 Y172.478 E.01981
G1 X165.51 Y172.291 E.01981
G1 X164.942 Y171.987 E.01981
G1 X164.443 Y171.578 E.01981
G1 X164.034 Y171.079 E.01981
G1 X163.73 Y170.511 E.01981
G1 X163.543 Y169.894 E.01981
G1 X163.48 Y169.252 E.01981
G1 X163.543 Y168.61 E.01981
G1 X163.73 Y167.993 E.01981
G1 X164.034 Y167.425 E.01981
G1 X164.443 Y166.926 E.01981
G1 X164.942 Y166.517 E.01981
G1 X165.51 Y166.213 E.01981
G1 X166.127 Y166.026 E.01981
G1 X166.769 Y165.963 E.01981
G1 X167.335 Y166.019 E.01748
M204 S10000
; WIPE_START
G1 F24000
G1 X167.41 Y166.026 E-.0287
G1 X168.027 Y166.213 E-.24517
G1 X168.596 Y166.517 E-.24501
G1 X169.087 Y166.92 E-.24113
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.015 J-.671 P1  F30000
G1 X135.754 Y116.492 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.272727
G1 F4063
G1 X141.508 Y116.492 E.23112
G1 X141.508 Y113.615 E.11556
G1 X135.754 Y113.615 E.23112
G1 X135.754 Y110.738 E.11556
G1 X141.508 Y110.738 E.23112
G1 X141.508 Y109.293 E.05802
G1 X141.223 Y109.578 E.0162
G1 X136.777 Y109.578 E.17859
G1 X136.461 Y109.263 E.01792
G1 X136.461 Y107.86 E.05632
G1 X135.754 Y107.86 E.02841
; WIPE_START
G1 F24000
G1 X136.461 Y107.86 E-.26878
G1 X136.461 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.128 J-1.21 P1  F30000
G1 X124.246 Y107.86 Z6.8
G1 Z6.4
G1 E.8 F1800
G1 F4063
G1 X123.539 Y107.86 E.02841
G1 X123.539 Y109.263 E.05632
G1 X123.223 Y109.578 E.01792
G1 X118.777 Y109.578 E.17859
G1 X118.492 Y109.293 E.0162
G1 X118.492 Y110.738 E.05802
G1 X124.246 Y110.738 E.23112
G1 X124.246 Y113.615 E.11556
G1 X118.492 Y113.615 E.23112
G1 X118.492 Y116.492 E.11556
G1 X124.246 Y116.492 E.23112
; WIPE_START
G1 F24000
G1 X122.246 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.217 J.011 P1  F30000
G1 X122.398 Y99.938 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4063
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4063
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4063
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4063
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4063
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.007 J.293 E.01391
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.045 E.08557
G3 X127.988 Y105.75 I.292 J-.002 E.01376
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.281 Y104.917 E.00729
G1 X129.29 Y105.75 E.02557
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F4063
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F4063
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F4063
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F4063
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F4063
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.817 J-.902 P1  F30000
G1 X92.548 Y141.475 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4063
G1 X93.132 Y141.409 E.01806
G1 X93.769 Y141.481 E.01969
G1 X94.373 Y141.692 E.01969
G1 X94.916 Y142.033 E.01969
G1 X95.369 Y142.486 E.01969
G1 X95.71 Y143.029 E.01969
G1 X95.921 Y143.634 E.01969
G1 X95.988 Y144.312 E.02095
G1 X95.921 Y144.907 E.0184
G1 X95.71 Y145.512 E.01969
G1 X95.369 Y146.054 E.01969
G1 X94.916 Y146.507 E.01969
G1 X94.373 Y146.848 E.01969
G1 X93.769 Y147.06 E.01969
G1 X93.132 Y147.132 E.01969
G1 X92.495 Y147.06 E.01969
G1 X91.89 Y146.848 E.01969
G1 X91.348 Y146.507 E.01969
G1 X90.895 Y146.054 E.01969
G1 X90.554 Y145.512 E.01969
G1 X90.342 Y144.907 E.01969
G1 X90.27 Y144.27 E.01969
G1 X90.342 Y143.634 E.01969
G1 X90.554 Y143.029 E.01969
G1 X90.895 Y142.486 E.01969
G1 X91.348 Y142.033 E.01969
G1 X91.89 Y141.692 E.01969
G1 X92.49 Y141.492 E.01944
M204 S10000
; WIPE_START
G1 F24000
G1 X93.132 Y141.409 E-.2458
G1 X93.769 Y141.481 E-.24348
G1 X94.373 Y141.692 E-.24348
G1 X94.434 Y141.731 E-.02724
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.868 J-.853 P1  F30000
G1 X93.758 Y141.043 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
G1 F4063
G1 X93.773 Y141.045 E.00048
G1 X94.39 Y141.232 E.01982
G1 X94.959 Y141.536 E.01981
G1 X95.457 Y141.945 E.01981
G1 X95.867 Y142.443 E.01981
G1 X96.17 Y143.012 E.01981
G1 X96.358 Y143.629 E.01981
G1 X96.421 Y144.27 E.01981
G1 X96.358 Y144.912 E.01981
G1 X96.17 Y145.529 E.01981
G1 X95.867 Y146.098 E.01981
G1 X95.457 Y146.596 E.01981
G1 X94.959 Y147.005 E.01981
G1 X94.39 Y147.309 E.01981
G1 X93.773 Y147.496 E.01981
G1 X93.132 Y147.559 E.01981
G1 X92.49 Y147.496 E.01981
G1 X91.873 Y147.309 E.01981
G1 X91.305 Y147.005 E.01981
G1 X90.806 Y146.596 E.01981
G1 X90.397 Y146.098 E.01981
G1 X90.093 Y145.529 E.01981
G1 X89.906 Y144.912 E.01981
G1 X89.843 Y144.27 E.01981
G1 X89.906 Y143.629 E.01981
G1 X90.093 Y143.012 E.01981
G1 X90.397 Y142.443 E.01981
G1 X90.806 Y141.945 E.01981
G1 X91.305 Y141.536 E.01981
G1 X91.873 Y141.232 E.01981
G1 X92.49 Y141.045 E.01981
G1 X93.132 Y140.981 E.01981
G1 X93.698 Y141.037 E.01748
M204 S10000
; WIPE_START
G1 F24000
G1 X93.773 Y141.045 E-.0287
G1 X94.39 Y141.232 E-.24517
G1 X94.959 Y141.536 E-.24501
G1 X95.45 Y141.938 E-.24113
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.145 J.412 P1  F30000
G1 X108.192 Y177.332 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
G1 F4063
G1 X108.776 Y177.266 E.01806
G1 X109.413 Y177.338 E.01969
G1 X110.018 Y177.55 E.01969
G1 X110.56 Y177.891 E.01969
G1 X111.013 Y178.344 E.01969
G1 X111.354 Y178.886 E.01969
G1 X111.566 Y179.491 E.01969
G1 X111.633 Y180.169 E.02095
G1 X111.566 Y180.764 E.0184
G1 X111.354 Y181.369 E.01969
G1 X111.013 Y181.912 E.01969
G1 X110.56 Y182.365 E.01969
G1 X110.018 Y182.706 E.01969
G1 X109.413 Y182.917 E.01969
G1 X108.776 Y182.989 E.01969
G1 X108.14 Y182.917 E.01969
G1 X107.535 Y182.706 E.01969
G1 X106.992 Y182.365 E.01969
G1 X106.539 Y181.912 E.01969
G1 X106.198 Y181.369 E.01969
G1 X105.987 Y180.764 E.01969
G1 X105.915 Y180.128 E.01969
G1 X105.987 Y179.491 E.01969
G1 X106.198 Y178.886 E.01969
G1 X106.539 Y178.344 E.01969
G1 X106.992 Y177.891 E.01969
G1 X107.535 Y177.55 E.01969
G1 X108.135 Y177.349 E.01944
M204 S10000
; WIPE_START
G1 F24000
G1 X108.776 Y177.266 E-.2458
G1 X109.413 Y177.338 E-.24348
G1 X110.018 Y177.55 E-.24348
G1 X110.078 Y177.588 E-.02724
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.868 J-.853 P1  F30000
G1 X109.402 Y176.9 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
G1 F4063
G1 X109.418 Y176.902 E.00048
G1 X110.035 Y177.089 E.01982
G1 X110.604 Y177.393 E.01981
G1 X111.102 Y177.802 E.01981
G1 X111.511 Y178.3 E.01981
G1 X111.815 Y178.869 E.01981
G1 X112.002 Y179.486 E.01981
G1 X112.065 Y180.128 E.01981
G1 X112.002 Y180.769 E.01981
G1 X111.815 Y181.386 E.01981
G1 X111.511 Y181.955 E.01981
G1 X111.102 Y182.453 E.01981
G1 X110.604 Y182.862 E.01981
G1 X110.035 Y183.166 E.01981
G1 X109.418 Y183.353 E.01981
G1 X108.776 Y183.417 E.01981
G1 X108.135 Y183.353 E.01981
G1 X107.518 Y183.166 E.01981
G1 X106.949 Y182.862 E.01981
G1 X106.451 Y182.453 E.01981
G1 X106.042 Y181.955 E.01981
G1 X105.738 Y181.386 E.01981
G1 X105.551 Y180.769 E.01981
G1 X105.487 Y180.128 E.01981
G1 X105.551 Y179.486 E.01981
G1 X105.738 Y178.869 E.01981
G1 X106.042 Y178.3 E.01981
G1 X106.451 Y177.802 E.01981
G1 X106.949 Y177.393 E.01981
G1 X107.518 Y177.089 E.01981
G1 X108.135 Y176.902 E.01981
G1 X108.776 Y176.839 E.01981
G1 X109.342 Y176.894 E.01748
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.418 Y176.902 E-.0287
G1 X110.035 Y177.089 E-.24517
G1 X110.604 Y177.393 E-.24501
G1 X111.094 Y177.796 E-.24113
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/118
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
G3 Z6.8 I1.204 J.175 P1  F30000
G1 X122.398 Y99.938 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2223
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2223
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2223
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2223
M73 P68 R8
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2223
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.045 E.08557
G3 X127.988 Y105.75 I.303 J.008 E.01364
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.277 Y104.913 E.0071
G1 X129.29 Y104.927 E.00059
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2223
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z7
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2223
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2223
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2223
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2223
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 6.67273
; LAYER_HEIGHT: 0.0727272
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/118
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
G3 Z7 I.043 J-1.216 P1  F30000
G1 X124.246 Y107.86 Z7
G1 Z6.673
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F2742
G1 X123.539 Y107.86 E.02841
G1 X123.539 Y109.263 E.05632
G1 X123.223 Y109.578 E.01792
G1 X118.777 Y109.578 E.17859
G1 X118.492 Y109.293 E.0162
G1 X118.492 Y110.738 E.05802
G1 X124.246 Y110.738 E.23112
G1 X124.246 Y113.615 E.11556
G1 X118.492 Y113.615 E.23112
G1 X118.492 Y116.492 E.11556
G1 X124.246 Y116.492 E.23112
; WIPE_START
G1 F24000
G1 X122.246 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.073 I0 J1.217 P1  F30000
G1 X135.754 Y116.492 Z7.073
G1 Z6.673
G1 E.8 F1800
G1 F2742
G1 X141.508 Y116.492 E.23112
G1 X141.508 Y113.615 E.11556
G1 X135.754 Y113.615 E.23112
G1 X135.754 Y110.738 E.11556
G1 X141.508 Y110.738 E.23112
G1 X141.508 Y109.293 E.05802
G1 X141.223 Y109.578 E.0162
G1 X136.777 Y109.578 E.17859
G1 X136.461 Y109.263 E.01792
G1 X136.461 Y107.86 E.05632
G1 X135.754 Y107.86 E.02841
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.127273
; WIPE_START
G1 F24000
G1 X136.461 Y107.86 E-.26878
G1 X136.461 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/118
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
G3 Z7.073 I.667 J-1.018 P1  F30000
G1 X122.398 Y99.938 Z7.073
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2742
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2742
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2742
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.007 J.293 E.01391
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.045 E.08557
G3 X127.989 Y105.75 I.303 J.008 E.01364
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.272 Y104.909 E.00692
G1 X129.29 Y104.927 E.00077
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2742
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z7.2
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2742
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2742
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2742
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2742
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 6.94545
; LAYER_HEIGHT: 0.145454
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/118
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
G3 Z7.2 I.043 J-1.216 P1  F30000
G1 X124.246 Y107.86 Z7.2
G1 Z6.945
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F2742
G1 X123.539 Y107.86 E.02841
G1 X123.539 Y109.263 E.05632
G1 X123.223 Y109.578 E.01792
G1 X118.777 Y109.578 E.17859
G1 X118.492 Y109.293 E.0162
G1 X118.492 Y110.738 E.05802
G1 X124.246 Y110.738 E.23112
G1 X124.246 Y113.615 E.11556
G1 X118.492 Y113.615 E.23112
G1 X118.492 Y116.492 E.11556
G1 X124.246 Y116.492 E.23112
; WIPE_START
G1 F24000
G1 X122.246 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.345 I0 J1.217 P1  F30000
G1 X135.754 Y116.492 Z7.345
G1 Z6.945
G1 E.8 F1800
G1 F2742
G1 X141.508 Y116.492 E.23112
G1 X141.508 Y113.615 E.11556
G1 X135.754 Y113.615 E.23112
G1 X135.754 Y110.738 E.11556
G1 X141.508 Y110.738 E.23112
G1 X141.508 Y109.293 E.05802
G1 X141.223 Y109.578 E.0162
G1 X136.777 Y109.578 E.17859
G1 X136.461 Y109.263 E.01792
G1 X136.461 Y107.86 E.05632
G1 X135.754 Y107.86 E.02841
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.0545454
; WIPE_START
G1 F24000
G1 X136.461 Y107.86 E-.26878
G1 X136.461 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/118
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
G3 Z7.345 I.667 J-1.018 P1  F30000
G1 X122.398 Y99.938 Z7.345
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2742
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.15 J-.399 P1  F30000
M73 P69 R8
G1 X120.835 Y108.089 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2742
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2742
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.007 J.293 E.01391
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.045 E.08557
G3 X127.988 Y105.75 I.303 J.008 E.01364
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.268 Y104.905 E.00673
G1 X129.29 Y104.927 E.00096
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2742
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2742
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2742
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2742
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2742
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/118
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
G3 Z7.4 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2185
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2185
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2185
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2185
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2185
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.007 J.293 E.01391
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.045 E.08557
G3 X127.988 Y105.75 I.303 J.008 E.01364
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.264 Y104.9 E.00655
G1 X129.29 Y104.927 E.00114
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2185
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z7.6
G1 Z7.2
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2185
G1 X129 Y105.945 E.01531
G1 X130.75 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42322
G1 F2185
G1 X129.31 Y107.29 E.04462
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2185
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2185
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 7.21818
; LAYER_HEIGHT: 0.0181818
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/118
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
G3 Z7.6 I.043 J-1.216 P1  F30000
G1 X124.246 Y107.86 Z7.6
G1 Z7.218
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F2742
G1 X123.539 Y107.86 E.02841
G1 X123.539 Y109.263 E.05632
G1 X123.223 Y109.578 E.01792
G1 X118.777 Y109.578 E.17859
G1 X118.492 Y109.293 E.0162
G1 X118.492 Y110.738 E.05802
G1 X124.246 Y110.738 E.23112
G1 X124.246 Y113.615 E.11556
G1 X118.492 Y113.615 E.23112
G1 X118.492 Y116.492 E.11556
G1 X124.246 Y116.492 E.23112
; WIPE_START
M73 P70 R8
G1 F24000
G1 X122.246 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.618 I0 J1.217 P1  F30000
G1 X135.754 Y116.492 Z7.618
G1 Z7.218
G1 E.8 F1800
G1 F2742
G1 X141.508 Y116.492 E.23112
G1 X141.508 Y113.615 E.11556
G1 X135.754 Y113.615 E.23112
G1 X135.754 Y110.738 E.11556
G1 X141.508 Y110.738 E.23112
G1 X141.508 Y109.293 E.05802
G1 X141.223 Y109.578 E.0162
G1 X136.777 Y109.578 E.17859
G1 X136.461 Y109.263 E.01792
G1 X136.461 Y107.86 E.05632
G1 X135.754 Y107.86 E.02841
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.181818
; WIPE_START
G1 F24000
G1 X136.461 Y107.86 E-.26878
G1 X136.461 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/118
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
G3 Z7.618 I.667 J-1.018 P1  F30000
G1 X122.398 Y99.938 Z7.618
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2742
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2742
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2742
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.045 E.08557
G3 X127.988 Y105.75 I.303 J.008 E.01362
G1 X128.71 Y105.749 E.02219
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2742
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z7.8
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2742
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2742
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2742
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2742
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 7.49091
; LAYER_HEIGHT: 0.090909
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/118
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
G3 Z7.8 I.043 J-1.216 P1  F30000
G1 X124.246 Y107.86 Z7.8
G1 Z7.491
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F2742
G1 X123.539 Y107.86 E.02841
G1 X123.539 Y109.263 E.05632
G1 X123.223 Y109.578 E.01792
G1 X118.777 Y109.578 E.17859
G1 X118.492 Y109.293 E.0162
G1 X118.492 Y110.738 E.05802
G1 X124.246 Y110.738 E.23112
G1 X124.246 Y113.615 E.11556
G1 X118.492 Y113.615 E.23112
G1 X118.492 Y116.492 E.11556
G1 X124.246 Y116.492 E.23112
; WIPE_START
G1 F24000
G1 X122.246 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.891 I0 J1.217 P1  F30000
G1 X135.754 Y116.492 Z7.891
G1 Z7.491
G1 E.8 F1800
G1 F2742
G1 X141.508 Y116.492 E.23112
G1 X141.508 Y113.615 E.11556
G1 X135.754 Y113.615 E.23112
G1 X135.754 Y110.738 E.11556
G1 X141.508 Y110.738 E.23112
G1 X141.508 Y109.293 E.05802
G1 X141.223 Y109.578 E.0162
G1 X136.777 Y109.578 E.17859
G1 X136.461 Y109.263 E.01792
G1 X136.461 Y107.86 E.05632
G1 X135.754 Y107.86 E.02841
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.109091
; WIPE_START
G1 F24000
G1 X136.461 Y107.86 E-.26878
G1 X136.461 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/118
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
G3 Z7.891 I.667 J-1.018 P1  F30000
G1 X122.398 Y99.938 Z7.891
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2742
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2742
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2742
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P70 R7
G1 F2742
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.006 J.294 E.0139
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.0138
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.255 Y104.892 E.00617
G1 X129.29 Y104.927 E.00152
M73 P71 R7
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2742
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z8
G1 Z7.6
G1 E.8 F1800
G1 F2742
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2742
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2742
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2742
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 7.76364
; LAYER_HEIGHT: 0.163637
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/118
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
G3 Z8 I.043 J-1.216 P1  F30000
G1 X124.246 Y107.86 Z8
G1 Z7.764
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F2742
G1 X123.539 Y107.86 E.02841
G1 X123.539 Y109.263 E.05632
G1 X123.223 Y109.578 E.01792
G1 X118.777 Y109.578 E.17859
G1 X118.492 Y109.293 E.0162
G1 X118.492 Y110.738 E.05802
G1 X124.246 Y110.738 E.23112
G1 X124.246 Y113.615 E.11556
G1 X118.492 Y113.615 E.23112
G1 X118.492 Y116.492 E.11556
G1 X124.246 Y116.492 E.23112
; WIPE_START
G1 F24000
G1 X122.246 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.164 I0 J1.217 P1  F30000
G1 X135.754 Y116.492 Z8.164
G1 Z7.764
G1 E.8 F1800
G1 F2742
G1 X141.508 Y116.492 E.23112
G1 X141.508 Y113.615 E.11556
G1 X135.754 Y113.615 E.23112
G1 X135.754 Y110.738 E.11556
G1 X141.508 Y110.738 E.23112
G1 X141.508 Y109.293 E.05802
G1 X141.223 Y109.578 E.0162
G1 X136.777 Y109.578 E.17859
G1 X136.461 Y109.263 E.01792
G1 X136.461 Y107.86 E.05632
G1 X135.754 Y107.86 E.02841
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.0363636
; WIPE_START
G1 F24000
G1 X136.461 Y107.86 E-.26878
G1 X136.461 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/118
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
G3 Z8.164 I.667 J-1.018 P1  F30000
G1 X122.398 Y99.938 Z8.164
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2742
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2742
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2742
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.007 J.293 E.01391
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.0138
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.251 Y104.887 E.00599
G1 X129.29 Y104.927 E.0017
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2742
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z8.2
G1 Z7.8
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2742
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2742
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2742
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2742
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/118
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
G3 Z8.2 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2184
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2184
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2184
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2184
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2184
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
M73 P72 R7
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.007 J.293 E.01391
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.291 J-.009 E.01394
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2184
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z8.4
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2184
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2184
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2184
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2184
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 8.03636
; LAYER_HEIGHT: 0.0363636
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/118
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
G3 Z8.4 I.043 J-1.216 P1  F30000
G1 X124.246 Y107.86 Z8.4
G1 Z8.036
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F2742
G1 X123.539 Y107.86 E.02841
G1 X123.539 Y109.263 E.05632
G1 X123.223 Y109.578 E.01792
G1 X118.777 Y109.578 E.17859
G1 X118.492 Y109.293 E.0162
G1 X118.492 Y110.738 E.05802
G1 X124.246 Y110.738 E.23112
G1 X124.246 Y113.615 E.11556
G1 X118.492 Y113.615 E.23112
G1 X118.492 Y116.492 E.11556
G1 X124.246 Y116.492 E.23112
; WIPE_START
G1 F24000
G1 X122.246 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.436 I0 J1.217 P1  F30000
G1 X135.754 Y116.492 Z8.436
G1 Z8.036
G1 E.8 F1800
G1 F2742
G1 X141.508 Y116.492 E.23112
G1 X141.508 Y113.615 E.11556
G1 X135.754 Y113.615 E.23112
G1 X135.754 Y110.738 E.11556
G1 X141.508 Y110.738 E.23112
G1 X141.508 Y109.293 E.05802
G1 X141.223 Y109.578 E.0162
G1 X136.777 Y109.578 E.17859
G1 X136.461 Y109.263 E.01792
G1 X136.461 Y107.86 E.05632
G1 X135.754 Y107.86 E.02841
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.163636
; WIPE_START
G1 F24000
G1 X136.461 Y107.86 E-.26878
G1 X136.461 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/118
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
G3 Z8.436 I.667 J-1.018 P1  F30000
G1 X122.398 Y99.938 Z8.436
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2742
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2742
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2742
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.01379
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.242 Y104.879 E.00561
G1 X129.29 Y104.927 E.00208
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2742
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z8.6
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2742
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2742
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2742
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2742
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 8.30909
; LAYER_HEIGHT: 0.109091
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/118
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
G3 Z8.6 I.043 J-1.216 P1  F30000
G1 X124.246 Y107.86 Z8.6
G1 Z8.309
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F2742
G1 X123.539 Y107.86 E.02841
G1 X123.539 Y109.263 E.05632
G1 X123.223 Y109.578 E.01792
G1 X118.777 Y109.578 E.17859
G1 X118.492 Y109.293 E.0162
G1 X118.492 Y110.738 E.05802
G1 X124.246 Y110.738 E.23112
G1 X124.246 Y113.615 E.11556
G1 X118.492 Y113.615 E.23112
G1 X118.492 Y116.492 E.11556
G1 X124.246 Y116.492 E.23112
; WIPE_START
G1 F24000
G1 X122.246 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.709 I0 J1.217 P1  F30000
G1 X135.754 Y116.492 Z8.709
G1 Z8.309
G1 E.8 F1800
G1 F2742
G1 X141.508 Y116.492 E.23112
G1 X141.508 Y113.615 E.11556
G1 X135.754 Y113.615 E.23112
G1 X135.754 Y110.738 E.11556
G1 X141.508 Y110.738 E.23112
G1 X141.508 Y109.293 E.05802
G1 X141.223 Y109.578 E.0162
G1 X136.777 Y109.578 E.17859
G1 X136.461 Y109.263 E.01792
G1 X136.461 Y107.86 E.05632
G1 X135.754 Y107.86 E.02841
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.090909
; WIPE_START
G1 F24000
G1 X136.461 Y107.86 E-.26878
G1 X136.461 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/118
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
G3 Z8.709 I.667 J-1.018 P1  F30000
G1 X122.398 Y99.938 Z8.709
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2742
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2742
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z8.8
M73 P73 R7
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2742
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.01379
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.238 Y104.875 E.00543
G1 X129.29 Y104.927 E.00226
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2742
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z8.8
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2742
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2742
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2742
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2742
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 8.58182
; LAYER_HEIGHT: 0.181819
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/118
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
G3 Z8.8 I.043 J-1.216 P1  F30000
G1 X124.246 Y107.86 Z8.8
G1 Z8.582
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F2742
G1 X123.539 Y107.86 E.02841
G1 X123.539 Y109.263 E.05632
G1 X123.223 Y109.578 E.01792
G1 X118.777 Y109.578 E.17859
G1 X118.492 Y109.293 E.0162
G1 X118.492 Y110.738 E.05802
G1 X124.246 Y110.738 E.23112
G1 X124.246 Y113.615 E.11556
G1 X118.492 Y113.615 E.23112
G1 X118.492 Y116.492 E.11556
G1 X124.246 Y116.492 E.23112
; WIPE_START
G1 F24000
G1 X122.246 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.982 I0 J1.217 P1  F30000
G1 X135.754 Y116.492 Z8.982
G1 Z8.582
G1 E.8 F1800
G1 F2742
G1 X141.508 Y116.492 E.23112
G1 X141.508 Y113.615 E.11556
G1 X135.754 Y113.615 E.23112
G1 X135.754 Y110.738 E.11556
G1 X141.508 Y110.738 E.23112
G1 X141.508 Y109.293 E.05802
G1 X141.223 Y109.578 E.0162
G1 X136.777 Y109.578 E.17859
G1 X136.461 Y109.263 E.01792
G1 X136.461 Y107.86 E.05632
G1 X135.754 Y107.86 E.02841
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.0181818
; WIPE_START
G1 F24000
G1 X136.461 Y107.86 E-.26878
G1 X136.461 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/118
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
G3 Z8.982 I.667 J-1.018 P1  F30000
G1 X122.398 Y99.938 Z8.982
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2742
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2742
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2742
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.293 J-.007 E.01391
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2742
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z9
G1 Z8.6
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2742
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2742
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2742
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2742
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/118
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
G3 Z9 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2184
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2184
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2184
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.131 J-1.21 P1  F30000
M73 P74 R7
G1 X131.102 Y106.142 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2184
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2184
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.0138
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2184
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z9.2
G1 Z8.8
G1 E.8 F1800
G1 F2184
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2184
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2184
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2184
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 8.85455
; LAYER_HEIGHT: 0.0545454
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/118
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
G3 Z9.2 I.043 J-1.216 P1  F30000
G1 X124.246 Y107.86 Z9.2
G1 Z8.855
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F2742
G1 X123.539 Y107.86 E.02841
G1 X123.539 Y109.263 E.05632
G1 X123.223 Y109.578 E.01792
G1 X118.777 Y109.578 E.17859
G1 X118.492 Y109.293 E.0162
G1 X118.492 Y110.738 E.05802
G1 X124.246 Y110.738 E.23112
G1 X124.246 Y113.615 E.11556
G1 X118.492 Y113.615 E.23112
G1 X118.492 Y116.492 E.11556
G1 X124.246 Y116.492 E.23112
; WIPE_START
G1 F24000
G1 X122.246 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.255 I0 J1.217 P1  F30000
G1 X135.754 Y116.492 Z9.255
G1 Z8.855
G1 E.8 F1800
G1 F2742
G1 X141.508 Y116.492 E.23112
G1 X141.508 Y113.615 E.11556
G1 X135.754 Y113.615 E.23112
G1 X135.754 Y110.738 E.11556
G1 X141.508 Y110.738 E.23112
G1 X141.508 Y109.293 E.05802
G1 X141.223 Y109.578 E.0162
G1 X136.777 Y109.578 E.17859
G1 X136.461 Y109.263 E.01792
G1 X136.461 Y107.86 E.05632
G1 X135.754 Y107.86 E.02841
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.145454
; WIPE_START
G1 F24000
G1 X136.461 Y107.86 E-.26878
G1 X136.461 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/118
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
G3 Z9.255 I.667 J-1.018 P1  F30000
G1 X122.398 Y99.938 Z9.255
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2742
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.15 J-.399 P1  F30000
M73 P74 R6
G1 X120.835 Y108.089 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2742
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2742
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.01379
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.225 Y104.862 E.00487
G1 X129.29 Y104.927 E.00282
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2742
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2742
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2742
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2742
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2742
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 9.12727
; LAYER_HEIGHT: 0.127273
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/118
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
G3 Z9.4 I.043 J-1.216 P1  F30000
G1 X124.246 Y107.86 Z9.4
G1 Z9.127
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F2742
G1 X123.539 Y107.86 E.02841
G1 X123.539 Y109.263 E.05632
G1 X123.223 Y109.578 E.01792
G1 X118.777 Y109.578 E.17859
G1 X118.492 Y109.293 E.0162
G1 X118.492 Y110.738 E.05802
G1 X124.246 Y110.738 E.23112
G1 X124.246 Y113.615 E.11556
G1 X118.492 Y113.615 E.23112
G1 X118.492 Y116.492 E.11556
G1 X124.246 Y116.492 E.23112
; WIPE_START
G1 F24000
G1 X122.246 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.527 I0 J1.217 P1  F30000
M73 P75 R6
G1 X135.754 Y116.492 Z9.527
G1 Z9.127
G1 E.8 F1800
G1 F2742
G1 X141.508 Y116.492 E.23112
G1 X141.508 Y113.615 E.11556
G1 X135.754 Y113.615 E.23112
G1 X135.754 Y110.738 E.11556
G1 X141.508 Y110.738 E.23112
G1 X141.508 Y109.293 E.05802
G1 X141.223 Y109.578 E.0162
G1 X136.777 Y109.578 E.17859
G1 X136.461 Y109.263 E.01792
G1 X136.461 Y107.86 E.05632
G1 X135.754 Y107.86 E.02841
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.0727272
; WIPE_START
G1 F24000
G1 X136.461 Y107.86 E-.26878
G1 X136.461 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/118
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
G3 Z9.527 I.667 J-1.018 P1  F30000
G1 X122.398 Y99.938 Z9.527
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2742
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2742
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2742
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.007 J.293 E.01391
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.0138
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.221 Y104.857 E.00468
G1 X129.29 Y104.927 E.00301
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2742
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z9.6
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2742
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2742
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2742
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2742
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/118
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
G3 Z9.6 I.043 J-1.216 P1  F30000
G1 X124.246 Y107.86 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F2742
G1 X123.539 Y107.86 E.02841
G1 X123.539 Y109.263 E.05632
G1 X123.223 Y109.578 E.01792
G1 X118.777 Y109.578 E.17859
G1 X118.492 Y109.293 E.0162
G1 X118.492 Y110.738 E.05802
G1 X124.246 Y110.738 E.23112
G1 X124.246 Y113.615 E.11556
G1 X118.492 Y113.615 E.23112
G1 X118.492 Y116.492 E.11556
G1 X124.246 Y116.492 E.23112
; WIPE_START
G1 F24000
G1 X122.246 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I0 J1.217 P1  F30000
G1 X135.754 Y116.492 Z9.8
G1 Z9.4
G1 E.8 F1800
G1 F2742
G1 X141.508 Y116.492 E.23112
G1 X141.508 Y113.615 E.11556
G1 X135.754 Y113.615 E.23112
G1 X135.754 Y110.738 E.11556
G1 X141.508 Y110.738 E.23112
G1 X141.508 Y109.293 E.05802
G1 X141.223 Y109.578 E.0162
G1 X136.777 Y109.578 E.17859
G1 X136.461 Y109.263 E.01792
G1 X136.461 Y107.86 E.05632
G1 X135.754 Y107.86 E.02841
; WIPE_START
G1 F24000
G1 X136.461 Y107.86 E-.26878
G1 X136.461 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I.667 J-1.018 P1  F30000
G1 X122.398 Y99.938 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2742
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2742
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2742
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.291 J-.009 E.01394
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.217 Y104.853 E.0045
G1 X129.29 Y104.927 E.00319
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
M73 P76 R6
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2742
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z9.8
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2742
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2742
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2742
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2742
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/118
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
G3 Z9.8 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2184
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2184
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2184
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2184
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2184
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.006 J.294 E.0139
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.0138
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.212 Y104.849 E.00431
G1 X129.29 Y104.927 E.00338
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2184
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z10
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2184
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2184
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2184
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2184
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 9.67273
; LAYER_HEIGHT: 0.0727272
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/118
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
G3 Z10 I.043 J-1.216 P1  F30000
G1 X124.246 Y107.86 Z10
G1 Z9.673
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F2742
G1 X123.539 Y107.86 E.02841
G1 X123.539 Y109.263 E.05632
G1 X123.223 Y109.578 E.01792
G1 X118.777 Y109.578 E.17859
G1 X118.492 Y109.293 E.0162
G1 X118.492 Y110.738 E.05802
G1 X124.246 Y110.738 E.23112
G1 X124.246 Y113.615 E.11556
G1 X118.492 Y113.615 E.23112
G1 X118.492 Y116.492 E.11556
G1 X124.246 Y116.492 E.23112
; WIPE_START
G1 F24000
G1 X122.246 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.073 I0 J1.217 P1  F30000
G1 X135.754 Y116.492 Z10.073
G1 Z9.673
G1 E.8 F1800
G1 F2742
G1 X141.508 Y116.492 E.23112
G1 X141.508 Y113.615 E.11556
G1 X135.754 Y113.615 E.23112
G1 X135.754 Y110.738 E.11556
G1 X141.508 Y110.738 E.23112
G1 X141.508 Y109.293 E.05802
G1 X141.223 Y109.578 E.0162
G1 X136.777 Y109.578 E.17859
G1 X136.461 Y109.263 E.01792
G1 X136.461 Y107.86 E.05632
G1 X135.754 Y107.86 E.02841
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.127273
; WIPE_START
G1 F24000
G1 X136.461 Y107.86 E-.26878
G1 X136.461 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/118
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
G3 Z10.073 I.667 J-1.018 P1  F30000
G1 X122.398 Y99.938 Z10.073
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2742
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2742
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2742
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
M73 P77 R6
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.01379
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.208 Y104.845 E.00412
G1 X129.29 Y104.927 E.00357
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2742
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z10.2
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2742
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2742
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2742
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2742
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 9.94545
; LAYER_HEIGHT: 0.145454
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/118
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
G3 Z10.2 I.043 J-1.216 P1  F30000
G1 X124.246 Y107.86 Z10.2
G1 Z9.945
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F2742
G1 X123.539 Y107.86 E.02841
G1 X123.539 Y109.263 E.05632
G1 X123.223 Y109.578 E.01792
G1 X118.777 Y109.578 E.17859
G1 X118.492 Y109.293 E.0162
G1 X118.492 Y110.738 E.05802
G1 X124.246 Y110.738 E.23112
G1 X124.246 Y113.615 E.11556
G1 X118.492 Y113.615 E.23112
G1 X118.492 Y116.492 E.11556
G1 X124.246 Y116.492 E.23112
; WIPE_START
G1 F24000
G1 X122.246 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.345 I0 J1.217 P1  F30000
G1 X135.754 Y116.492 Z10.345
G1 Z9.945
G1 E.8 F1800
G1 F2742
G1 X141.508 Y116.492 E.23112
G1 X141.508 Y113.615 E.11556
G1 X135.754 Y113.615 E.23112
G1 X135.754 Y110.738 E.11556
G1 X141.508 Y110.738 E.23112
G1 X141.508 Y109.293 E.05802
G1 X141.223 Y109.578 E.0162
G1 X136.777 Y109.578 E.17859
G1 X136.461 Y109.263 E.01792
G1 X136.461 Y107.86 E.05632
G1 X135.754 Y107.86 E.02841
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.0545454
; WIPE_START
G1 F24000
G1 X136.461 Y107.86 E-.26878
G1 X136.461 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/118
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
G3 Z10.345 I.667 J-1.018 P1  F30000
G1 X122.398 Y99.938 Z10.345
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2742
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2742
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2742
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.01376
G1 X128.71 Y105.749 E.0222
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.204 Y104.84 E.00394
G1 X129.29 Y104.927 E.00375
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2742
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z10.4
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2742
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2742
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2742
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2742
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/118
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
G3 Z10.4 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2184
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2184
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2184
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2184
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P78 R6
G1 F2184
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.005 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.0138
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.199 Y104.836 E.00375
G1 X129.29 Y104.927 E.00394
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2184
M73 P78 R5
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z10.6
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2184
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2184
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2184
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2184
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 10.2182
; LAYER_HEIGHT: 0.0181818
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/118
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
G3 Z10.6 I.043 J-1.216 P1  F30000
G1 X124.246 Y107.86 Z10.6
G1 Z10.218
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F2742
G1 X123.539 Y107.86 E.02841
G1 X123.539 Y109.263 E.05632
G1 X123.223 Y109.578 E.01792
G1 X118.777 Y109.578 E.17859
G1 X118.492 Y109.293 E.0162
G1 X118.492 Y110.738 E.05802
G1 X124.246 Y110.738 E.23112
G1 X124.246 Y113.615 E.11556
G1 X118.492 Y113.615 E.23112
G1 X118.492 Y116.492 E.11556
G1 X124.246 Y116.492 E.23112
; WIPE_START
G1 F24000
G1 X122.246 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.618 I0 J1.217 P1  F30000
G1 X135.754 Y116.492 Z10.618
G1 Z10.218
G1 E.8 F1800
G1 F2742
G1 X141.508 Y116.492 E.23112
G1 X141.508 Y113.615 E.11556
G1 X135.754 Y113.615 E.23112
G1 X135.754 Y110.738 E.11556
G1 X141.508 Y110.738 E.23112
G1 X141.508 Y109.293 E.05802
G1 X141.223 Y109.578 E.0162
G1 X136.777 Y109.578 E.17859
G1 X136.461 Y109.263 E.01792
G1 X136.461 Y107.86 E.05632
G1 X135.754 Y107.86 E.02841
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.181818
; WIPE_START
G1 F24000
G1 X136.461 Y107.86 E-.26878
G1 X136.461 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/118
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
G3 Z10.618 I.667 J-1.018 P1  F30000
G1 X122.398 Y99.938 Z10.618
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2742
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2742
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2742
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.01379
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.195 Y104.832 E.00357
G1 X129.29 Y104.927 E.00412
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2742
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z10.8
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2742
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2742
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2742
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2742
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 10.4909
; LAYER_HEIGHT: 0.090909
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 76/118
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
G3 Z10.8 I.043 J-1.216 P1  F30000
G1 X124.246 Y107.86 Z10.8
G1 Z10.491
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F2744
G1 X123.539 Y107.86 E.02841
G1 X123.539 Y109.263 E.05632
G1 X123.223 Y109.578 E.01792
G1 X118.777 Y109.578 E.17859
G1 X118.492 Y109.293 E.0162
G1 X118.492 Y110.738 E.05802
G1 X124.246 Y110.738 E.23112
G1 X124.246 Y113.615 E.11556
G1 X118.492 Y113.615 E.23112
G1 X118.492 Y116.492 E.11556
G1 X124.246 Y116.492 E.23112
; WIPE_START
G1 F24000
G1 X122.246 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.891 I0 J1.217 P1  F30000
G1 X135.754 Y116.492 Z10.891
G1 Z10.491
G1 E.8 F1800
G1 F2744
G1 X141.508 Y116.492 E.23112
G1 X141.508 Y113.615 E.11556
G1 X135.754 Y113.615 E.23112
G1 X135.754 Y110.738 E.11556
G1 X141.508 Y110.738 E.23112
G1 X141.508 Y109.293 E.05802
G1 X141.223 Y109.578 E.0162
G1 X136.777 Y109.578 E.17859
G1 X136.461 Y109.263 E.01792
G1 X136.461 Y107.86 E.05632
G1 X135.754 Y107.86 E.02841
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.109092
; WIPE_START
G1 F24000
G1 X136.461 Y107.86 E-.26878
G1 X136.461 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 77/118
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
G3 Z10.891 I.667 J-1.018 P1  F30000
G1 X122.398 Y99.938 Z10.891
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2744
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2744
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2744
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
M73 P79 R5
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2744
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2744
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.007 J.293 E.01391
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.0138
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.191 Y104.827 E.00338
G1 X129.29 Y104.927 E.00431
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2744
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z11
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2744
G1 X129 Y105.945 E.01531
G1 X130.75 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42322
G1 F2744
G1 X129.31 Y107.29 E.04462
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2744
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2744
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 10.7636
; LAYER_HEIGHT: 0.163636
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 78/118
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
G3 Z11 I.043 J-1.216 P1  F30000
G1 X124.246 Y107.86 Z11
G1 Z10.764
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F2742
G1 X123.539 Y107.86 E.02841
G1 X123.539 Y109.263 E.05632
G1 X123.223 Y109.578 E.01792
G1 X118.777 Y109.578 E.17859
G1 X118.492 Y109.293 E.0162
G1 X118.492 Y110.738 E.05802
G1 X124.246 Y110.738 E.23112
G1 X124.246 Y113.615 E.11556
G1 X118.492 Y113.615 E.23112
G1 X118.492 Y116.492 E.11556
G1 X124.246 Y116.492 E.23112
; WIPE_START
G1 F24000
G1 X122.246 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.164 I0 J1.217 P1  F30000
G1 X135.754 Y116.492 Z11.164
G1 Z10.764
G1 E.8 F1800
G1 F2742
G1 X141.508 Y116.492 E.23112
G1 X141.508 Y113.615 E.11556
G1 X135.754 Y113.615 E.23112
G1 X135.754 Y110.738 E.11556
G1 X141.508 Y110.738 E.23112
G1 X141.508 Y109.293 E.05802
G1 X141.223 Y109.578 E.0162
G1 X136.777 Y109.578 E.17859
G1 X136.461 Y109.263 E.01792
G1 X136.461 Y107.86 E.05632
G1 X135.754 Y107.86 E.02841
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.0363636
; WIPE_START
G1 F24000
G1 X136.461 Y107.86 E-.26878
G1 X136.461 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 79/118
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
G3 Z11.164 I.667 J-1.018 P1  F30000
G1 X122.398 Y99.938 Z11.164
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2742
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2742
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2742
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.007 J.293 E.01391
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.291 J-.009 E.01394
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.187 Y104.823 E.00319
G1 X129.29 Y104.927 E.0045
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2742
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z11.2
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2742
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2742
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2742
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2742
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 80/118
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
G3 Z11.2 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2184
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2184
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z11.4
G1 Z11
M73 P80 R5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2184
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2184
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2184
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.0138
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.182 Y104.819 E.00301
G1 X129.29 Y104.927 E.00468
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2184
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z11.4
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2184
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2184
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2184
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2184
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 11.0364
; LAYER_HEIGHT: 0.0363636
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 81/118
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
G3 Z11.4 I.043 J-1.216 P1  F30000
G1 X124.246 Y107.86 Z11.4
G1 Z11.036
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F2742
G1 X123.539 Y107.86 E.02841
G1 X123.539 Y109.263 E.05632
G1 X123.223 Y109.578 E.01792
G1 X118.777 Y109.578 E.17859
G1 X118.492 Y109.293 E.0162
G1 X118.492 Y110.738 E.05802
G1 X124.246 Y110.738 E.23112
G1 X124.246 Y113.615 E.11556
G1 X118.492 Y113.615 E.23112
G1 X118.492 Y116.492 E.11556
G1 X124.246 Y116.492 E.23112
; WIPE_START
G1 F24000
G1 X122.246 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.436 I0 J1.217 P1  F30000
G1 X135.754 Y116.492 Z11.436
G1 Z11.036
G1 E.8 F1800
G1 F2742
G1 X141.508 Y116.492 E.23112
G1 X141.508 Y113.615 E.11556
G1 X135.754 Y113.615 E.23112
G1 X135.754 Y110.738 E.11556
G1 X141.508 Y110.738 E.23112
G1 X141.508 Y109.293 E.05802
G1 X141.223 Y109.578 E.0162
G1 X136.777 Y109.578 E.17859
G1 X136.461 Y109.263 E.01792
G1 X136.461 Y107.86 E.05632
G1 X135.754 Y107.86 E.02841
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.163636
; WIPE_START
G1 F24000
G1 X136.461 Y107.86 E-.26878
G1 X136.461 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 82/118
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
G3 Z11.436 I.667 J-1.018 P1  F30000
G1 X122.398 Y99.938 Z11.436
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2742
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2742
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2742
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.0138
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.178 Y104.815 E.00282
G1 X129.29 Y104.927 E.00487
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2742
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z11.6
M73 P81 R5
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2742
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2742
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2742
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2742
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 11.3091
; LAYER_HEIGHT: 0.109091
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 83/118
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
G3 Z11.6 I.043 J-1.216 P1  F30000
G1 X124.246 Y107.86 Z11.6
G1 Z11.309
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F2742
G1 X123.539 Y107.86 E.02841
G1 X123.539 Y109.263 E.05632
G1 X123.223 Y109.578 E.01792
G1 X118.777 Y109.578 E.17859
G1 X118.492 Y109.293 E.0162
G1 X118.492 Y110.738 E.05802
G1 X124.246 Y110.738 E.23112
G1 X124.246 Y113.615 E.11556
G1 X118.492 Y113.615 E.23112
G1 X118.492 Y116.492 E.11556
G1 X124.246 Y116.492 E.23112
; WIPE_START
G1 F24000
G1 X122.246 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.709 I0 J1.217 P1  F30000
G1 X135.754 Y116.492 Z11.709
G1 Z11.309
G1 E.8 F1800
G1 F2742
G1 X141.508 Y116.492 E.23112
G1 X141.508 Y113.615 E.11556
G1 X135.754 Y113.615 E.23112
G1 X135.754 Y110.738 E.11556
G1 X141.508 Y110.738 E.23112
G1 X141.508 Y109.293 E.05802
G1 X141.223 Y109.578 E.0162
G1 X136.777 Y109.578 E.17859
G1 X136.461 Y109.263 E.01792
G1 X136.461 Y107.86 E.05632
G1 X135.754 Y107.86 E.02841
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.090909
; WIPE_START
G1 F24000
G1 X136.461 Y107.86 E-.26878
G1 X136.461 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 84/118
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
G3 Z11.709 I.667 J-1.018 P1  F30000
G1 X122.398 Y99.938 Z11.709
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2742
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2742
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2742
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.007 J.293 E.01391
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.01379
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.174 Y104.81 E.00263
G1 X129.29 Y104.927 E.00506
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2742
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z11.8
G1 Z11.4
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2742
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2742
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2742
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2742
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 11.5818
; LAYER_HEIGHT: 0.181819
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 85/118
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
G3 Z11.8 I.043 J-1.216 P1  F30000
G1 X124.246 Y107.86 Z11.8
G1 Z11.582
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F2742
G1 X123.539 Y107.86 E.02841
G1 X123.539 Y109.263 E.05632
G1 X123.223 Y109.578 E.01792
G1 X118.777 Y109.578 E.17859
G1 X118.492 Y109.293 E.0162
G1 X118.492 Y110.738 E.05802
G1 X124.246 Y110.738 E.23112
G1 X124.246 Y113.615 E.11556
G1 X118.492 Y113.615 E.23112
G1 X118.492 Y116.492 E.11556
G1 X124.246 Y116.492 E.23112
; WIPE_START
G1 F24000
G1 X122.246 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.982 I0 J1.217 P1  F30000
G1 X135.754 Y116.492 Z11.982
G1 Z11.582
G1 E.8 F1800
G1 F2742
G1 X141.508 Y116.492 E.23112
G1 X141.508 Y113.615 E.11556
G1 X135.754 Y113.615 E.23112
G1 X135.754 Y110.738 E.11556
G1 X141.508 Y110.738 E.23112
G1 X141.508 Y109.293 E.05802
G1 X141.223 Y109.578 E.0162
G1 X136.777 Y109.578 E.17859
G1 X136.461 Y109.263 E.01792
G1 X136.461 Y107.86 E.05632
G1 X135.754 Y107.86 E.02841
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.0181818
; WIPE_START
G1 F24000
G1 X136.461 Y107.86 E-.26878
G1 X136.461 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 86/118
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
G3 Z11.982 I.667 J-1.018 P1  F30000
G1 X122.398 Y99.938 Z11.982
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2742
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2742
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
M73 P81 R4
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2742
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2742
G1 X130.71 Y104.927 E.02529
M73 P82 R4
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.005 J.295 E.01389
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.01379
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.169 Y104.806 E.00245
G1 X129.29 Y104.927 E.00524
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2742
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z12
G1 Z11.6
G1 E.8 F1800
G1 F2742
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2742
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2742
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2742
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 87/118
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
G3 Z12 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2184
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2184
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2184
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2184
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2184
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.0138
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.165 Y104.802 E.00226
G1 X129.29 Y104.927 E.00543
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2184
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z12.2
G1 Z11.8
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2184
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2184
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2184
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2184
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 11.8545
; LAYER_HEIGHT: 0.0545454
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 88/118
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
G3 Z12.2 I.043 J-1.216 P1  F30000
G1 X124.246 Y107.86 Z12.2
G1 Z11.855
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F2744
G1 X123.539 Y107.86 E.02841
G1 X123.539 Y109.263 E.05632
G1 X123.223 Y109.578 E.01792
G1 X118.777 Y109.578 E.17859
G1 X118.492 Y109.293 E.0162
G1 X118.492 Y110.738 E.05802
G1 X124.246 Y110.738 E.23112
G1 X124.246 Y113.615 E.11556
G1 X118.492 Y113.615 E.23112
G1 X118.492 Y116.492 E.11556
G1 X124.246 Y116.492 E.23112
; WIPE_START
G1 F24000
G1 X122.246 Y116.492 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.255 I0 J1.217 P1  F30000
G1 X135.754 Y116.492 Z12.255
G1 Z11.855
G1 E.8 F1800
G1 F2744
G1 X141.508 Y116.492 E.23112
G1 X141.508 Y113.615 E.11556
G1 X135.754 Y113.615 E.23112
G1 X135.754 Y110.738 E.11556
G1 X141.508 Y110.738 E.23112
G1 X141.508 Y109.293 E.05802
G1 X141.223 Y109.578 E.0162
G1 X136.777 Y109.578 E.17859
G1 X136.461 Y109.263 E.01792
G1 X136.461 Y107.86 E.05632
G1 X135.754 Y107.86 E.02841
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.145454
; WIPE_START
G1 F24000
G1 X136.461 Y107.86 E-.26878
G1 X136.461 Y109.153 E-.49122
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 89/118
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
G3 Z12.255 I.667 J-1.018 P1  F30000
G1 X122.398 Y99.938 Z12.255
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F2744
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2744
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2744
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2744
M73 P83 R4
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2744
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.005 J.295 E.01389
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.01379
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.161 Y104.797 E.00208
G1 X129.29 Y104.927 E.00561
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2744
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z12.4
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2744
G1 X129 Y105.945 E.01531
G1 X130.75 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42322
G1 F2744
G1 X129.31 Y107.29 E.04462
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2744
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2744
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 12.1273
; LAYER_HEIGHT: 0.127273
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 90/118
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
G3 Z12.4 I.035 J1.216 P1  F30000
G1 X135.951 Y107.86 Z12.4
G1 Z12.127
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F3278
G1 X135.754 Y107.86 E.00791
G1 X135.754 Y116.492 E.34669
G1 X136.14 Y116.492 E.01548
G1 X136.14 Y107.86 E.34669
G1 X136.461 Y107.86 E.01293
G1 X136.461 Y109.263 E.05633
G1 X136.777 Y109.578 E.01792
G1 X137.017 Y109.578 E.00963
G1 X137.017 Y116.492 E.27769
G1 X137.894 Y116.492 E.03523
G1 X137.894 Y109.578 E.27769
G1 X138.771 Y109.578 E.03523
G1 X138.771 Y116.492 E.27769
G1 X139.648 Y116.492 E.03523
G1 X139.648 Y109.578 E.27769
G1 X140.525 Y109.578 E.03523
G1 X140.525 Y116.492 E.27769
G1 X141.402 Y116.492 E.03523
G1 X141.402 Y109.399 E.28488
; WIPE_START
G1 F24000
G1 X141.402 Y111.399 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.527 I-.343 J-1.168 P1  F30000
G1 X124.049 Y116.492 Z12.527
G1 Z12.127
G1 E.8 F1800
G1 F3278
G1 X124.246 Y116.492 E.00791
G1 X124.246 Y107.86 E.34669
G1 X123.86 Y107.86 E.01548
G1 X123.86 Y116.492 E.34669
G1 X122.983 Y116.492 E.03523
G1 X122.983 Y109.578 E.27769
G1 X122.106 Y109.578 E.03523
G1 X122.106 Y116.492 E.27769
G1 X121.229 Y116.492 E.03523
G1 X121.229 Y109.578 E.27769
G1 X120.352 Y109.578 E.03523
G1 X120.352 Y116.492 E.27769
G1 X119.475 Y116.492 E.03523
G1 X119.475 Y109.578 E.27769
G1 X118.777 Y109.578 E.02804
G1 X118.598 Y109.399 E.01017
G1 X118.598 Y116.492 E.28488
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.0727272
; WIPE_START
G1 F24000
G1 X118.598 Y114.492 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 91/118
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
G3 Z12.527 I1.177 J.307 P1  F30000
G1 X122.398 Y99.938 Z12.527
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F3278
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3278
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3278
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3278
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3278
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.005 J.295 E.01389
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.0138
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.157 Y104.793 E.00189
G1 X129.29 Y104.927 E.0058
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F3278
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z12.6
G1 Z12.2
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F3278
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F3278
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F3278
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F3278
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 92/118
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
G3 Z12.6 I.035 J1.216 P1  F30000
G1 X135.951 Y107.86 Z12.6
G1 Z12.4
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F3278
G1 X135.754 Y107.86 E.00791
G1 X135.754 Y116.492 E.34669
G1 X136.14 Y116.492 E.01548
G1 X136.14 Y107.86 E.34669
G1 X136.461 Y107.86 E.01293
G1 X136.461 Y109.263 E.05633
G1 X136.777 Y109.578 E.01792
G1 X137.017 Y109.578 E.00963
G1 X137.017 Y116.492 E.27769
G1 X137.894 Y116.492 E.03523
G1 X137.894 Y109.578 E.27769
G1 X138.771 Y109.578 E.03523
G1 X138.771 Y116.492 E.27769
G1 X139.648 Y116.492 E.03523
G1 X139.648 Y109.578 E.27769
G1 X140.525 Y109.578 E.03523
G1 X140.525 Y116.492 E.27769
G1 X141.402 Y116.492 E.03523
G1 X141.402 Y109.399 E.28488
; WIPE_START
G1 F24000
G1 X141.402 Y111.399 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I-.343 J-1.168 P1  F30000
G1 X124.049 Y116.492 Z12.8
G1 Z12.4
G1 E.8 F1800
G1 F3278
G1 X124.246 Y116.492 E.00791
G1 X124.246 Y107.86 E.34669
G1 X123.86 Y107.86 E.01548
G1 X123.86 Y116.492 E.34669
G1 X122.983 Y116.492 E.03523
G1 X122.983 Y109.578 E.27769
G1 X122.106 Y109.578 E.03523
G1 X122.106 Y116.492 E.27769
G1 X121.229 Y116.492 E.03523
G1 X121.229 Y109.578 E.27769
G1 X120.352 Y109.578 E.03523
G1 X120.352 Y116.492 E.27769
G1 X119.475 Y116.492 E.03523
G1 X119.475 Y109.578 E.27769
G1 X118.777 Y109.578 E.02804
G1 X118.598 Y109.399 E.01017
G1 X118.598 Y116.492 E.28488
; WIPE_START
G1 F24000
G1 X118.598 Y114.492 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I1.177 J.307 P1  F30000
G1 X122.398 Y99.938 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F3278
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3278
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
M73 P84 R4
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3278
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3278
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3278
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.01379
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.152 Y104.789 E.0017
G1 X129.29 Y104.927 E.00599
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F3278
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z12.8
G1 Z12.4
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F3278
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F3278
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F3278
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F3278
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 93/118
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
G3 Z12.8 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2184
G1 X122.398 Y108.438 E.28196
G1 X119.602 Y108.438 E.09274
G1 X119.602 Y96.142 E.40788
G1 X140.398 Y96.142 E.68984
G1 X140.398 Y108.438 E.40788
G1 X137.602 Y108.438 E.09274
G1 X137.602 Y99.938 E.28196
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2184
G1 X122.79 Y108.83 E.26118
G1 X119.21 Y108.83 E.11
G1 X119.21 Y95.75 E.40191
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y108.83 E.40191
G1 X137.21 Y108.83 E.11
G1 X137.21 Y100.33 E.26118
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I-1.15 J-.399 P1  F30000
G1 X120.835 Y108.089 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2184
G1 X119.95 Y108.089 E.02935
G1 X119.95 Y107.346 E.02466
G1 X122.05 Y105.246 E.09848
G1 X122.05 Y104.698 E.0182
G1 X119.95 Y102.598 E.09848
G1 X119.95 Y99.67 E.09715
G1 X123.13 Y96.49 E.14917
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y108.089 E.02466
G1 X139.165 Y108.089 E.02935
; WIPE_START
G1 F24000
G1 X140.05 Y108.089 E-.33622
G1 X140.05 Y107.346 E-.28254
G1 X139.787 Y107.083 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I.131 J-1.21 P1  F30000
G1 X131.102 Y106.142 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2184
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2184
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.01379
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.148 Y104.785 E.00152
G1 X129.29 Y104.927 E.00617
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2184
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z13
G1 Z12.6
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2184
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2184
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2184
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2184
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 94/118
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
G3 Z13 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2962
G1 X122.398 Y109.24 E.30857
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X122.398 Y112.026 E.09242
G3 X119.604 Y112.109 I-1.398 J.013 E.14378
G1 X119.604 Y109.24 E.09518
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F2962
G1 X119.602 Y96.142 E.43448
G1 X140.398 Y96.142 E.68983
G1 X140.398 Y109.24 E.43448
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X140.398 Y112.026 E.09242
G3 X137.602 Y112.026 I-1.398 J.01 E.14633
G1 X137.602 Y109.24 E.09242
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F2962
G1 X137.602 Y108.857 E.01269
G1 X137.602 Y99.938 E.29588
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2962
G1 X122.79 Y109.24 E.27378
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X122.79 Y112.036 E.09274
G3 X119.212 Y112.128 I-1.79 J.004 E.18369
G1 X119.212 Y109.24 E.09582
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2962
G1 X119.21 Y95.75 E.41451
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y109.24 E.41451
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X140.79 Y112.035 E.09274
G3 X137.21 Y112.036 I-1.79 J-.001 E.18649
G1 X137.21 Y109.24 E.09274
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2962
G1 X137.21 Y108.871 E.01134
G1 X137.21 Y100.33 E.26244
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
M73 P85 R4
G1 X122.837 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-1.158 J-.373 P1  F30000
G1 X121.048 Y107.876 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2962
G1 X119.952 Y107.876 E.03637
G1 X119.952 Y107.344 E.01765
G1 X122.05 Y105.246 E.0984
G1 X122.05 Y104.698 E.0182
G1 X119.951 Y102.599 E.09843
G1 X119.951 Y99.669 E.0972
G1 X123.13 Y96.49 E.14914
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y107.876 E.01759
G1 X138.952 Y107.876 E.03642
G1 X137.956 Y108.099 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.460654
M106 S255
G1 F3000
G1 X137.956 Y112.181 E.13897
G2 X138.373 Y112.897 I.999 J-.103 E.02908
G1 X138.373 Y108.268 E.15756
G1 X138.791 Y108.268 E.01422
G1 X138.791 Y113.076 E.16366
G2 X139.209 Y113.08 I.222 J-1.46 E.01427
G1 X139.209 Y108.268 E.16378
G1 X139.627 Y108.268 E.01422
G1 X139.627 Y112.893 E.15743
G2 X140.044 Y112.22 I-.57 J-.82 E.02772
G1 X140.044 Y108.099 E.1403
M106 S252.45
; WIPE_START
G1 F24000
G1 X140.044 Y110.099 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I.134 J-1.21 P1  F30000
G1 X122.045 Y108.099 Z13.2
G1 Z12.8
G1 E.8 F1800
; LINE_WIDTH: 0.460351
M106 S255
G1 F3000
G1 X122.045 Y112.211 E.13987
G3 X121.628 Y112.89 I-1.011 J-.153 E.02786
G1 X121.627 Y108.268 E.15721
G1 X121.21 Y108.268 E.0142
G1 X121.21 Y113.073 E.16344
G1 X121.111 Y113.096 E.00346
G1 X120.793 Y113.077 E.01085
G1 X120.792 Y108.268 E.16357
G1 X120.375 Y108.268 E.0142
G1 X120.376 Y112.897 E.15744
G3 X119.958 Y112.22 I.646 J-.865 E.02771
G1 X119.957 Y108.099 E.14018
M106 S252.45
; WIPE_START
G1 F24000
G1 X119.958 Y110.099 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I.407 J1.147 P1  F30000
G1 X131.102 Y106.142 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2962
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2962
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.007 J.293 E.01391
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.01379
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.144 Y104.78 E.00133
G1 X129.29 Y104.927 E.00636
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2962
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z13.2
G1 Z12.8
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2962
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2962
M73 P85 R3
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2962
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2962
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 95/118
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
G3 Z13.2 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3003
G1 X122.398 Y112.026 E.40099
G3 X119.604 Y112.109 I-1.398 J.012 E.14366
G1 X119.602 Y96.142 E.52967
G1 X140.398 Y96.142 E.68983
G1 X140.398 Y112.026 E.52691
G3 X137.602 Y112.026 I-1.398 J.01 E.14633
G1 X137.602 Y99.938 E.40099
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3003
G1 X122.79 Y112.036 E.35969
G3 X119.212 Y112.128 I-1.79 J.002 E.17004
G1 X119.21 Y95.75 E.50327
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y112.035 E.50042
G3 X137.21 Y112.036 I-1.79 J-.001 E.17274
G1 X137.21 Y100.33 E.35969
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.84 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-.926 J-.79 P1  F30000
G1 X119.952 Y105.716 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3003
G1 X119.952 Y107.344 E.05401
G1 X122.05 Y105.246 E.0984
G1 X122.05 Y104.698 E.0182
G1 X119.951 Y102.599 E.09843
G1 X119.951 Y99.669 E.0972
G1 X123.13 Y96.49 E.14914
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y105.717 E.05401
G1 X138.942 Y112.241 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.482972
G1 F3003
G1 X139.108 Y112.206 E.00607
G2 X139.22 Y111.918 I-.304 J-.285 E.01137
G1 X139.22 Y108.539 E.12115
G1 X138.78 Y108.539 E.01579
G1 X138.78 Y111.918 E.12115
G1 X138.796 Y112.103 E.00668
G1 X138.898 Y112.199 E.00502
G1 X138.651 Y112.541 F30000
; LINE_WIDTH: 0.419999
G1 F3003
G1 X138.867 Y112.646 E.00738
G1 X139.185 Y112.621 E.00981
G2 X139.535 Y112.334 I-.242 J-.652 E.01415
G2 X139.629 Y111.918 I-1.067 J-.46 E.01319
G1 X139.629 Y108.131 E.11637
G1 X138.371 Y108.131 E.03864
G1 X138.371 Y111.981 E.11831
G1 X138.431 Y112.294 E.00978
G1 X138.611 Y112.496 E.00832
G1 X138.573 Y112.946 F30000
G1 F3003
G2 X139.148 Y113.031 I.499 J-1.404 E.01795
G1 X139.47 Y112.924 E.01044
G1 X139.778 Y112.671 E.01223
G1 X139.944 Y112.376 E.0104
G1 X140.006 Y111.918 E.01421
G1 X140.006 Y107.753 E.12796
G1 X137.994 Y107.753 E.06181
G1 X137.994 Y112.003 E.13058
G1 X138.057 Y112.368 E.01138
G1 X138.293 Y112.75 E.01379
G1 X138.524 Y112.912 E.00868
; WIPE_START
G1 F24000
G1 X138.293 Y112.75 E-.10732
G1 X138.057 Y112.368 E-.17052
G1 X137.994 Y112.003 E-.14068
G1 X137.994 Y111.104 E-.34147
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-.081 J-1.214 P1  F30000
G1 X121.109 Y112.224 Z13.4
G1 Z13
G1 E.8 F1800
; LINE_WIDTH: 0.4816
G1 F3003
G2 X121.221 Y111.916 I-.288 J-.278 E.01206
G1 X121.221 Y108.539 E.12074
G1 X120.781 Y108.539 E.0157
G1 X120.782 Y111.916 E.12074
G1 X120.806 Y112.134 E.00781
G1 X120.939 Y112.244 E.00617
G1 X121.05 Y112.231 E.00399
G1 X121.216 Y112.624 F30000
; LINE_WIDTH: 0.419999
G1 F3003
G1 X121.476 Y112.439 E.00981
G1 X121.581 Y112.255 E.0065
G1 X121.629 Y111.916 E.01052
G1 X121.629 Y108.131 E.11633
G1 X120.373 Y108.131 E.03858
G1 X120.374 Y112.043 E.12022
G1 X120.445 Y112.325 E.00895
G1 X120.625 Y112.539 E.00858
G1 X120.907 Y112.655 E.00935
G1 X121.156 Y112.63 E.0077
G1 X121.444 Y112.931 F30000
G1 F3003
G1 X121.773 Y112.678 E.01277
G1 X121.941 Y112.384 E.0104
G1 X122.006 Y111.916 E.0145
G1 X122.006 Y107.753 E.12791
G1 X119.996 Y107.753 E.06176
G1 X119.997 Y112.075 E.1328
G1 X120.113 Y112.508 E.01378
G1 X120.404 Y112.847 E.0137
G1 X120.734 Y112.999 E.01117
G1 X121.104 Y113.037 E.01144
G1 X121.387 Y112.949 E.00908
; WIPE_START
G1 F24000
G1 X121.104 Y113.037 E-.11232
G1 X120.734 Y112.999 E-.14147
G1 X120.404 Y112.847 E-.1382
G1 X120.113 Y112.508 E-.16942
G1 X119.997 Y112.075 E-.17042
G1 X119.997 Y112.001 E-.02818
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I.568 J1.076 P1  F30000
G1 X131.102 Y106.142 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3003
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3003
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.005 J.295 E.01389
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.302 J.002 E.01381
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
M73 P86 R3
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.139 Y104.776 E.00115
G1 X129.29 Y104.927 E.00655
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F3003
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z13.4
G1 Z13
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F3003
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F3003
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F3003
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F3003
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 96/118
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
G3 Z13.4 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3003
G1 X122.398 Y112.026 E.40099
G3 X119.604 Y112.109 I-1.398 J.012 E.14367
G1 X119.602 Y96.142 E.52967
G1 X140.398 Y96.142 E.68983
G1 X140.398 Y112.026 E.52691
G3 X137.602 Y112.026 I-1.398 J.01 E.14633
G1 X137.602 Y99.938 E.40099
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3003
G1 X122.79 Y112.036 E.35969
G3 X119.212 Y112.128 I-1.79 J.002 E.17005
G1 X119.21 Y95.75 E.50327
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y112.035 E.50042
G3 X137.21 Y112.036 I-1.79 J-.001 E.17274
G1 X137.21 Y100.33 E.35969
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.84 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-.926 J-.79 P1  F30000
G1 X119.952 Y105.716 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3003
G1 X119.952 Y107.344 E.05401
G1 X122.05 Y105.246 E.0984
G1 X122.05 Y104.698 E.0182
G1 X119.951 Y102.599 E.09843
G1 X119.951 Y99.669 E.0972
G1 X123.13 Y96.49 E.14914
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y105.717 E.05401
G1 X138.944 Y112.24 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.482986
G1 F3003
G1 X139.118 Y112.205 E.00635
G2 X139.22 Y111.918 I-.313 J-.273 E.01121
G1 X139.22 Y108.539 E.12116
G1 X138.78 Y108.539 E.01579
G1 X138.78 Y111.918 E.12116
G1 X138.826 Y112.146 E.00833
G1 X138.898 Y112.203 E.0033
G1 X138.858 Y112.646 F30000
; LINE_WIDTH: 0.419999
G1 F3003
G1 X139.189 Y112.62 E.01022
G1 X139.448 Y112.465 E.00926
G1 X139.584 Y112.241 E.00806
G1 X139.629 Y111.918 E.01001
G1 X139.629 Y108.131 E.11637
G1 X138.371 Y108.131 E.03864
G1 X138.371 Y111.981 E.11831
G1 X138.431 Y112.294 E.00981
G1 X138.558 Y112.473 E.00673
G1 X138.806 Y112.616 E.00879
G1 X138.712 Y112.996 F30000
G1 F3003
G1 X139.147 Y113.031 E.01341
G1 X139.473 Y112.923 E.01053
G1 X139.735 Y112.721 E.01017
G1 X139.944 Y112.373 E.01245
G1 X140.006 Y111.918 E.01413
G1 X140.006 Y107.753 E.12796
G1 X137.994 Y107.753 E.06181
G1 X137.994 Y112.003 E.13058
G1 X138.057 Y112.368 E.01139
G1 X138.291 Y112.748 E.0137
G1 X138.661 Y112.965 E.01317
; WIPE_START
G1 F24000
G1 X138.291 Y112.748 E-.16291
G1 X138.057 Y112.368 E-.16938
G1 X137.994 Y112.003 E-.14092
G1 X137.994 Y111.248 E-.28679
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-.07 J-1.215 P1  F30000
G1 X121.116 Y112.222 Z13.6
G1 Z13.2
G1 E.8 F1800
; LINE_WIDTH: 0.481517
G1 F3003
G2 X121.221 Y111.918 I-.356 J-.293 E.01176
G1 X121.221 Y108.539 E.12076
G1 X120.781 Y108.539 E.0157
G1 X120.782 Y111.918 E.12076
G1 X120.809 Y112.14 E.00801
G1 X120.943 Y112.246 E.00609
G1 X121.056 Y112.23 E.00407
G1 X121.216 Y112.624 F30000
; LINE_WIDTH: 0.419999
G1 F3003
G1 X121.446 Y112.471 E.00849
G1 X121.583 Y112.243 E.00816
G1 X121.629 Y111.918 E.0101
G1 X121.629 Y108.131 E.11636
G1 X120.373 Y108.131 E.03858
G1 X120.374 Y112.052 E.12049
G1 X120.45 Y112.333 E.00894
G1 X120.621 Y112.535 E.00813
G1 X120.907 Y112.655 E.00953
G1 X121.157 Y112.63 E.00771
G1 X121.458 Y112.925 F30000
G1 F3003
G1 X121.738 Y112.717 E.01072
G1 X121.943 Y112.376 E.01224
G1 X122.006 Y111.918 E.01421
G1 X122.006 Y107.753 E.12795
G1 X119.996 Y107.753 E.06176
G1 X119.997 Y112.08 E.13294
G1 X120.116 Y112.512 E.01377
G1 X120.398 Y112.842 E.01336
G1 X120.736 Y112.999 E.01144
G1 X121.099 Y113.037 E.0112
G1 X121.4 Y112.943 E.00971
; WIPE_START
G1 F24000
G1 X121.099 Y113.037 E-.12005
G1 X120.736 Y112.999 E-.13854
G1 X120.398 Y112.842 E-.14153
G1 X120.116 Y112.512 E-.16525
G1 X119.997 Y112.08 E-.17035
G1 X119.997 Y112.016 E-.02428
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I.569 J1.076 P1  F30000
G1 X131.102 Y106.142 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3003
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3003
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.302 J.002 E.01381
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.135 Y104.772 E.00096
G1 X129.29 Y104.927 E.00673
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F3003
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z13.6
G1 Z13.2
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F3003
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F3003
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F3003
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F3003
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 97/118
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
G3 Z13.6 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.398 Y112.026 E.40099
G3 X119.604 Y112.109 I-1.398 J.01 E.14355
G1 X119.602 Y96.142 E.52967
G1 X140.398 Y96.142 E.68983
G1 X140.398 Y112.026 E.52691
G3 X137.602 Y112.026 I-1.398 J.01 E.14633
G1 X137.602 Y99.938 E.40099
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2543
G1 X122.79 Y112.036 E.35969
G3 X119.212 Y112.128 I-1.79 J-.001 E.16989
G1 X119.21 Y95.75 E.50327
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y112.035 E.50042
G3 X137.21 Y112.036 I-1.79 J-.001 E.17274
G1 X137.21 Y100.33 E.35969
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.84 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-1.212 J-.114 P1  F30000
G1 X122.05 Y110.703 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.05 Y112.009 E.04331
G3 X122.003 Y112.327 I-.81 J.044 E.01074
G1 X119.952 Y110.277 E.0962
G1 X119.952 Y107.344 E.09727
G1 X122.05 Y105.246 E.0984
G1 X122.05 Y104.698 E.0182
G1 X119.951 Y102.599 E.09843
G1 X119.951 Y99.669 E.0972
G1 X123.13 Y96.49 E.14914
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y110.274 E.09715
G1 X137.996 Y112.328 E.09634
G3 X137.95 Y110.704 I5.395 J-.965 E.0541
; WIPE_START
G1 F24000
G1 X137.996 Y112.328 E-.61748
G1 X138.261 Y112.063 E-.14252
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I.776 J-.938 P1  F30000
G1 X131.102 Y106.142 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2543
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2543
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
M73 P87 R3
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.989 Y105.75 I.304 J.003 E.0138
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.131 Y104.767 E.00077
G1 X129.29 Y104.927 E.00692
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2543
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z13.8
G1 Z13.4
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2543
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2543
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2543
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2543
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 98/118
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
G3 Z13.8 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2545
G1 X122.398 Y112.026 E.40099
G3 X119.604 Y112.109 I-1.398 J.013 E.14378
G1 X119.602 Y96.142 E.52967
G1 X140.398 Y96.142 E.68983
G1 X140.398 Y112.026 E.52691
G3 X137.602 Y112.026 I-1.398 J.01 E.14633
G1 X137.602 Y99.938 E.40099
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2545
G1 X122.79 Y112.036 E.35969
G3 X119.212 Y112.128 I-1.79 J.004 E.17015
G1 X119.21 Y95.75 E.50327
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y112.035 E.50042
G3 X137.21 Y112.036 I-1.79 J-.001 E.17274
G1 X137.21 Y100.33 E.35969
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.84 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-1.212 J-.114 P1  F30000
G1 X122.05 Y110.705 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2545
G1 X122.05 Y112.009 E.04327
G3 X122.005 Y112.329 I-.91 J.036 E.01077
G1 X119.952 Y110.277 E.09629
G1 X119.952 Y107.344 E.09727
G1 X122.05 Y105.246 E.0984
G1 X122.05 Y104.698 E.0182
G1 X119.951 Y102.599 E.09843
G1 X119.951 Y99.669 E.0972
G1 X123.13 Y96.49 E.14914
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y110.274 E.09715
G1 X137.996 Y112.328 E.09633
G3 X137.95 Y110.704 I5.388 J-.965 E.0541
; WIPE_START
G1 F24000
G1 X137.996 Y112.328 E-.61747
G1 X138.261 Y112.063 E-.14253
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I.776 J-.938 P1  F30000
G1 X131.102 Y106.142 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2545
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2545
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.005 J.295 E.01389
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.291 J-.009 E.01394
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.127 Y104.763 E.00059
G1 X129.29 Y104.927 E.0071
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2545
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z14
G1 Z13.6
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2545
G1 X129 Y105.945 E.01531
G1 X130.75 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42322
G1 F2545
G1 X129.31 Y107.29 E.04462
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2545
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2545
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 99/118
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
G3 Z14 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.398 Y112.026 E.40099
G3 X119.604 Y112.109 I-1.398 J.01 E.14355
G1 X119.602 Y96.142 E.52967
G1 X140.398 Y96.142 E.68983
G1 X140.398 Y112.026 E.52691
G3 X137.602 Y112.026 I-1.398 J.01 E.14633
G1 X137.602 Y99.938 E.40099
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2543
G1 X122.79 Y112.036 E.35969
G3 X119.212 Y112.128 I-1.79 J-.001 E.16989
G1 X119.21 Y95.75 E.50327
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y112.035 E.50042
G3 X137.21 Y112.036 I-1.79 J-.001 E.17274
G1 X137.21 Y100.33 E.35969
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.84 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-1.212 J-.114 P1  F30000
G1 X122.05 Y110.705 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.05 Y112.009 E.04327
G3 X122.005 Y112.329 I-.913 J.036 E.01078
G1 X119.952 Y110.277 E.09629
G1 X119.952 Y107.344 E.09727
G1 X122.05 Y105.246 E.0984
G1 X122.05 Y104.698 E.0182
G1 X119.951 Y102.599 E.09843
G1 X119.951 Y99.669 E.0972
G1 X123.13 Y96.49 E.14914
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y110.274 E.09715
G1 X137.996 Y112.328 E.09633
G3 X137.95 Y110.704 I5.404 J-.965 E.0541
; WIPE_START
G1 F24000
G1 X137.996 Y112.328 E-.61748
G1 X138.261 Y112.063 E-.14252
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I.776 J-.938 P1  F30000
G1 X131.102 Y106.142 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2543
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P88 R3
G1 F2543
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.0138
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.122 Y104.759 E.00723
G1 X129.29 Y104.927 E.00729
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2543
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z14.2
G1 Z13.8
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2543
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2543
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2543
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2543
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 100/118
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
G3 Z14.2 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.398 Y112.026 E.40099
G3 X119.604 Y112.117 I-1.398 J.01 E.14332
G1 X119.602 Y96.142 E.52991
G1 X140.398 Y96.142 E.68983
G1 X140.398 Y112.026 E.52691
G3 X137.602 Y112.026 I-1.398 J.01 E.14633
G1 X137.602 Y99.938 E.40099
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2543
G1 X122.79 Y112.036 E.35969
G3 X119.212 Y112.131 I-1.79 J-.001 E.16981
G1 X119.21 Y95.75 E.50335
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y112.035 E.50042
G3 X137.21 Y112.036 I-1.79 J-.001 E.17274
G1 X137.21 Y100.33 E.35969
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.84 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-1.212 J-.114 P1  F30000
G1 X122.05 Y110.705 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.05 Y112.009 E.04327
G3 X122.005 Y112.329 I-.913 J.036 E.01077
G1 X119.952 Y110.277 E.09629
G1 X119.952 Y107.344 E.09727
G1 X122.05 Y105.246 E.0984
G1 X122.05 Y104.698 E.0182
G1 X119.951 Y102.599 E.09843
G1 X119.951 Y99.669 E.0972
G1 X123.13 Y96.49 E.14914
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y110.274 E.09715
G1 X137.998 Y112.326 E.09625
G3 X137.95 Y110.703 I5.389 J-.97 E.05408
; WIPE_START
G1 F24000
G1 X137.998 Y112.326 E-.61719
G1 X138.264 Y112.06 E-.14281
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I.775 J-.938 P1  F30000
G1 X131.102 Y106.142 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2543
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2543
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.291 J-.009 E.01394
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.118 Y104.755 E.0071
G1 X129.29 Y104.927 E.00748
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2543
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z14.4
G1 Z14
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2543
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2543
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2543
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2543
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 101/118
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
G3 Z14.4 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.398 Y112.026 E.40099
G3 X119.604 Y112.109 I-1.398 J.012 E.14366
G1 X119.602 Y96.142 E.52967
G1 X140.398 Y96.142 E.68983
G1 X140.398 Y112.026 E.52691
G3 X137.602 Y112.026 I-1.398 J.01 E.14633
G1 X137.602 Y99.938 E.40099
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2543
G1 X122.79 Y112.036 E.35969
G3 X119.212 Y112.128 I-1.79 J.002 E.17004
G1 X119.21 Y95.75 E.50327
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y112.035 E.50042
G3 X137.21 Y112.036 I-1.79 J-.001 E.17274
G1 X137.21 Y100.33 E.35969
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.84 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-1.212 J-.114 P1  F30000
G1 X122.05 Y110.704 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.05 Y112.009 E.0433
G3 X122.003 Y112.327 I-.827 J.043 E.01074
G1 X119.952 Y110.277 E.09621
G1 X119.952 Y107.344 E.09727
G1 X122.05 Y105.246 E.0984
G1 X122.05 Y104.698 E.0182
G1 X119.951 Y102.599 E.09843
G1 X119.951 Y99.669 E.0972
G1 X123.13 Y96.49 E.14914
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y110.274 E.09715
G1 X137.996 Y112.328 E.09633
G3 X137.95 Y110.704 I5.679 J-.973 E.05408
; WIPE_START
G1 F24000
G1 X137.996 Y112.328 E-.61745
G1 X138.261 Y112.063 E-.14255
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I.776 J-.938 P1  F30000
G1 X131.102 Y106.142 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2543
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
M73 P89 R3
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2543
M73 P89 R2
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.007 J.293 E.01391
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.303 J.002 E.01381
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.114 Y104.75 E.00696
G1 X129.29 Y104.927 E.00766
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2543
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z14.6
G1 Z14.2
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2543
G1 X129 Y105.945 E.0153
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2543
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2543
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2543
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 102/118
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
G3 Z14.6 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.398 Y112.026 E.40099
G3 X119.604 Y112.109 I-1.398 J.012 E.14366
G1 X119.602 Y96.142 E.52967
G1 X140.398 Y96.142 E.68983
G1 X140.398 Y112.026 E.52691
G3 X137.602 Y112.026 I-1.398 J.01 E.14633
G1 X137.602 Y99.938 E.40099
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2543
G1 X122.79 Y112.036 E.35969
G3 X119.212 Y112.128 I-1.79 J.002 E.17004
G1 X119.21 Y95.75 E.50327
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y112.035 E.50042
G3 X137.21 Y112.036 I-1.79 J-.001 E.17274
G1 X137.21 Y100.33 E.35969
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.84 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-1.212 J-.114 P1  F30000
G1 X122.05 Y110.705 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.05 Y112.009 E.04327
G3 X122.005 Y112.329 I-.914 J.036 E.01078
G1 X119.952 Y110.277 E.09629
G1 X119.952 Y107.344 E.09727
G1 X122.05 Y105.246 E.0984
G1 X122.05 Y104.698 E.0182
G1 X119.951 Y102.599 E.09843
G1 X119.951 Y99.669 E.0972
G1 X123.13 Y96.49 E.14914
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y110.274 E.09715
G1 X137.995 Y112.329 E.09638
G3 X137.95 Y110.704 I5.558 J-.967 E.0541
; WIPE_START
G1 F24000
G1 X137.995 Y112.329 E-.61755
G1 X138.26 Y112.064 E-.14245
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I.776 J-.938 P1  F30000
G1 X131.102 Y106.142 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2543
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2543
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.007 J.293 E.01391
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.01379
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2543
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z14.8
G1 Z14.4
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2543
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2543
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2543
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2543
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 103/118
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
G3 Z14.8 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z14.8
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.398 Y112.026 E.40099
G3 X119.604 Y112.109 I-1.398 J.006 E.14332
G1 X119.602 Y96.142 E.52967
G1 X140.398 Y96.142 E.68983
G1 X140.398 Y112.026 E.52691
G3 X137.602 Y112.026 I-1.398 J.01 E.14633
G1 X137.602 Y99.938 E.40099
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2543
G1 X122.79 Y112.036 E.35969
G3 X119.212 Y112.128 I-1.79 J-.005 E.16965
G1 X119.21 Y95.75 E.50327
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y112.035 E.50042
G3 X137.21 Y112.036 I-1.79 J-.001 E.17274
G1 X137.21 Y100.33 E.35969
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.84 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-1.212 J-.114 P1  F30000
G1 X122.05 Y110.704 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.05 Y112.009 E.0433
G3 X122.004 Y112.328 I-.837 J.042 E.01075
G1 X119.952 Y110.277 E.09622
G1 X119.952 Y107.344 E.09727
G1 X122.05 Y105.246 E.0984
G1 X122.05 Y104.698 E.0182
G1 X119.951 Y102.599 E.09843
G1 X119.951 Y99.669 E.0972
G1 X123.13 Y96.49 E.14914
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y110.274 E.09715
G1 X137.996 Y112.328 E.09633
G3 X137.95 Y110.704 I5.673 J-.973 E.05408
; WIPE_START
G1 F24000
G1 X137.996 Y112.328 E-.61745
G1 X138.262 Y112.063 E-.14255
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I.776 J-.938 P1  F30000
M73 P90 R2
G1 X131.102 Y106.142 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2543
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2543
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.0138
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2543
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z15
G1 Z14.6
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2543
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2543
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2543
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2543
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 104/118
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
G3 Z15 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z15
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.398 Y112.026 E.40099
G3 X119.604 Y112.117 I-1.398 J.011 E.14342
G1 X119.602 Y96.142 E.52991
G1 X140.398 Y96.142 E.68983
G1 X140.398 Y112.026 E.52691
G3 X137.602 Y112.026 I-1.398 J.01 E.14633
G1 X137.602 Y99.938 E.40099
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2543
G1 X122.79 Y112.036 E.35969
G3 X119.212 Y112.131 I-1.79 J.002 E.16997
G1 X119.21 Y95.75 E.50335
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y112.035 E.50042
G3 X137.21 Y112.036 I-1.79 J-.001 E.17274
G1 X137.21 Y100.33 E.35969
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.84 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-1.212 J-.114 P1  F30000
G1 X122.05 Y110.705 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.05 Y112.009 E.04327
G3 X122.005 Y112.329 I-.91 J.036 E.01077
G1 X119.952 Y110.277 E.09629
G1 X119.952 Y107.344 E.09727
G1 X122.05 Y105.246 E.0984
G1 X122.05 Y104.698 E.0182
G1 X119.951 Y102.599 E.09843
G1 X119.951 Y99.669 E.0972
G1 X123.13 Y96.49 E.14914
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y110.274 E.09715
G1 X137.995 Y112.329 E.09639
G3 X137.95 Y110.705 I5.808 J-.972 E.05408
; WIPE_START
G1 F24000
G1 X137.995 Y112.329 E-.61749
G1 X138.26 Y112.064 E-.14251
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I.776 J-.938 P1  F30000
G1 X131.102 Y106.142 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2543
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2543
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.0138
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2543
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z15.2
G1 Z14.8
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2543
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2543
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2543
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2543
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 105/118
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
G3 Z15.2 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z15.2
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.398 Y112.026 E.40099
G3 X119.604 Y112.109 I-1.398 J.012 E.14366
G1 X119.602 Y96.142 E.52967
G1 X140.398 Y96.142 E.68983
G1 X140.398 Y112.026 E.52691
G3 X137.602 Y112.026 I-1.398 J.01 E.14633
G1 X137.602 Y99.938 E.40099
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2543
G1 X122.79 Y112.036 E.35969
G3 X119.212 Y112.128 I-1.79 J.002 E.17004
G1 X119.21 Y95.75 E.50327
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y112.035 E.50042
G3 X137.21 Y112.036 I-1.79 J-.001 E.17274
G1 X137.21 Y100.33 E.35969
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.84 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-1.212 J-.114 P1  F30000
G1 X122.05 Y110.703 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.05 Y112.009 E.04332
G3 X122.003 Y112.327 I-.801 J.045 E.01073
G1 X119.952 Y110.277 E.09619
G1 X119.952 Y107.344 E.09727
G1 X122.05 Y105.246 E.0984
G1 X122.05 Y104.698 E.0182
G1 X119.951 Y102.599 E.09843
G1 X119.951 Y99.669 E.0972
G1 X123.13 Y96.49 E.14914
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y110.274 E.09715
G1 X137.997 Y112.327 E.09628
G3 X137.95 Y110.703 I5.475 J-.971 E.05408
; WIPE_START
G1 F24000
M73 P91 R2
G1 X137.997 Y112.327 E-.61726
G1 X138.263 Y112.061 E-.14274
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I.775 J-.938 P1  F30000
G1 X131.102 Y106.142 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2543
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2543
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.0138
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2543
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z15.4
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2543
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2543
G1 X130.69 Y107.29 E.0446
G1 X130.75 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2543
G1 X131.128 Y107.668 E.01164
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X130.69 Y107.668 E.05588
G1 X130.75 Y108.045 F30000
G1 F2543
G1 X131.506 Y108.045 E.02323
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X130.69 Y108.045 E.06746
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.69 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 106/118
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
G3 Z15.4 I.961 J-.746 P1  F30000
G1 X122.398 Y99.938 Z15.4
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.398 Y112.026 E.40099
G3 X119.604 Y112.109 I-1.398 J.01 E.14355
G1 X119.602 Y96.142 E.52967
G1 X140.398 Y96.142 E.68983
G1 X140.398 Y112.026 E.52691
G3 X137.602 Y112.026 I-1.398 J.01 E.14633
G1 X137.602 Y99.938 E.40099
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2543
G1 X122.79 Y112.036 E.35969
G3 X119.212 Y112.128 I-1.79 J-.001 E.16989
G1 X119.21 Y95.75 E.50327
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y112.035 E.50042
G3 X137.21 Y112.036 I-1.79 J-.001 E.17274
G1 X137.21 Y100.33 E.35969
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.84 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-1.212 J-.114 P1  F30000
G1 X122.05 Y110.705 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.05 Y112.009 E.04324
G3 X122.006 Y112.33 I-.971 J.031 E.01079
G1 X119.952 Y110.277 E.09633
G1 X119.952 Y107.344 E.09727
G1 X122.05 Y105.246 E.0984
G1 X122.05 Y104.698 E.0182
G1 X119.951 Y102.599 E.09843
G1 X119.951 Y99.669 E.0972
G1 X123.13 Y96.49 E.14914
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y110.274 E.09715
G1 X137.997 Y112.327 E.09628
G3 X137.95 Y110.703 I5.475 J-.971 E.05408
; WIPE_START
G1 F24000
G1 X137.997 Y112.327 E-.61726
G1 X138.263 Y112.061 E-.14274
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I.775 J-.938 P1  F30000
G1 X131.102 Y106.142 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2543
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2543
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.005 J.295 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.303 J.002 E.0138
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2543
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z15.6
G1 Z15.2
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2543
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2543
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2543
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2543
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 107/118
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
G3 Z15.6 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z15.6
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.398 Y112.026 E.40099
G3 X119.604 Y112.109 I-1.398 J.012 E.14366
G1 X119.602 Y96.142 E.52967
G1 X140.398 Y96.142 E.68983
G1 X140.398 Y112.026 E.52691
G3 X137.602 Y112.026 I-1.398 J.01 E.14633
G1 X137.602 Y99.938 E.40099
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2543
G1 X122.79 Y112.036 E.35969
G3 X119.212 Y112.128 I-1.79 J.002 E.17004
G1 X119.21 Y95.75 E.50327
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y112.035 E.50042
G3 X137.21 Y112.036 I-1.79 J-.001 E.17274
G1 X137.21 Y100.33 E.35969
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.84 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-1.212 J-.114 P1  F30000
G1 X122.05 Y110.705 Z15.8
G1 Z15.4
M73 P92 R2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.05 Y112.009 E.04326
G3 X122.005 Y112.329 I-.914 J.036 E.01078
G1 X119.952 Y110.277 E.09629
G1 X119.952 Y107.344 E.09727
G1 X122.05 Y105.246 E.0984
G1 X122.05 Y104.698 E.0182
G1 X119.951 Y102.599 E.09843
G1 X119.951 Y99.669 E.0972
G1 X123.13 Y96.49 E.14914
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y110.274 E.09715
G1 X137.996 Y112.328 E.09633
G3 X137.95 Y110.704 I5.681 J-.973 E.05408
; WIPE_START
G1 F24000
G1 X137.996 Y112.328 E-.61745
G1 X138.261 Y112.063 E-.14255
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I.776 J-.938 P1  F30000
G1 X131.102 Y106.142 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2543
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2543
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.986 Y105.75 I.304 J.003 E.01373
G1 X128.71 Y105.749 E.02223
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2543
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z15.8
G1 Z15.4
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2543
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2543
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2543
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2543
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 108/118
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
G3 Z15.8 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z15.8
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.398 Y112.026 E.40099
G3 X119.604 Y112.117 I-1.398 J.011 E.14342
G1 X119.602 Y96.142 E.52991
G1 X140.398 Y96.142 E.68983
G1 X140.398 Y112.026 E.52691
G3 X137.602 Y112.026 I-1.398 J.01 E.14633
G1 X137.602 Y99.938 E.40099
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2543
G1 X122.79 Y112.036 E.35969
G3 X119.212 Y112.131 I-1.79 J.002 E.16997
G1 X119.21 Y95.75 E.50335
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y112.035 E.50042
G3 X137.21 Y112.036 I-1.79 J-.001 E.17274
G1 X137.21 Y100.33 E.35969
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.84 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-1.212 J-.114 P1  F30000
G1 X122.05 Y110.705 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.05 Y112.009 E.04327
G3 X122.005 Y112.329 I-.91 J.036 E.01077
G1 X119.952 Y110.277 E.09629
G1 X119.952 Y107.344 E.09727
G1 X122.05 Y105.246 E.0984
G1 X122.05 Y104.698 E.0182
G1 X119.951 Y102.599 E.09843
G1 X119.951 Y99.669 E.0972
G1 X123.13 Y96.49 E.14914
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y110.274 E.09715
G1 X138 Y112.324 E.09615
G1 X137.973 Y112.242 E.00286
G3 X137.95 Y110.701 I7.992 J-.887 E.0512
; WIPE_START
G1 F24000
G1 X137.973 Y112.242 E-.58566
G1 X138 Y112.324 E-.03275
G1 X138.263 Y112.061 E-.14159
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I.775 J-.938 P1  F30000
G1 X131.102 Y106.142 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2543
M73 P92 R1
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2543
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.304 J.003 E.01379
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2543
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z16
G1 Z15.6
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2543
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2543
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2543
M73 P93 R1
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2543
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 109/118
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
G3 Z16 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z16
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.398 Y112.026 E.40099
G3 X119.604 Y112.109 I-1.398 J.01 E.14355
G1 X119.602 Y96.142 E.52967
G1 X140.398 Y96.142 E.68983
G1 X140.398 Y112.026 E.52691
G3 X137.602 Y112.026 I-1.398 J.01 E.14633
G1 X137.602 Y99.938 E.40099
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2543
G1 X122.79 Y112.036 E.35969
G3 X119.212 Y112.128 I-1.79 J-.001 E.16989
G1 X119.21 Y95.75 E.50327
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y112.035 E.50042
G3 X137.21 Y112.036 I-1.79 J-.001 E.17274
G1 X137.21 Y100.33 E.35969
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.84 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-1.212 J-.114 P1  F30000
G1 X122.05 Y110.703 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.05 Y112.009 E.04332
G3 X122.003 Y112.327 I-.801 J.045 E.01073
G1 X119.952 Y110.277 E.09619
G1 X119.952 Y107.344 E.09727
G1 X122.05 Y105.246 E.0984
G1 X122.05 Y104.698 E.0182
G1 X119.951 Y102.599 E.09843
G1 X119.951 Y99.669 E.0972
G1 X123.13 Y96.49 E.14914
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y110.274 E.09715
G1 X137.995 Y112.329 E.09639
G3 X137.95 Y110.705 I5.808 J-.972 E.05408
; WIPE_START
G1 F24000
G1 X137.995 Y112.329 E-.61749
G1 X138.26 Y112.064 E-.14251
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I.776 J-.938 P1  F30000
G1 X131.102 Y106.142 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2543
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2543
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.291 J-.009 E.01394
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2543
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z16.2
G1 Z15.8
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2543
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2543
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2543
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2543
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 110/118
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
G3 Z16.2 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z16.2
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.398 Y112.026 E.40099
G3 X119.604 Y112.113 I-1.398 J.011 E.14354
G1 X119.602 Y96.142 E.52979
G1 X140.398 Y96.142 E.68983
G1 X140.398 Y112.026 E.52691
G3 X137.602 Y112.026 I-1.398 J.01 E.14633
G1 X137.602 Y99.938 E.40099
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2543
G1 X122.79 Y112.036 E.35969
G3 X119.212 Y112.13 I-1.79 J.002 E.17
G1 X119.21 Y95.75 E.50331
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y112.035 E.50042
G3 X137.21 Y112.036 I-1.79 J-.001 E.17274
G1 X137.21 Y100.33 E.35969
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.84 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I-1.212 J-.114 P1  F30000
G1 X122.05 Y110.705 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.05 Y112.009 E.04327
G3 X122.005 Y112.329 I-.91 J.036 E.01077
G1 X119.952 Y110.277 E.09629
G1 X119.952 Y107.344 E.09727
G1 X122.05 Y105.246 E.0984
G1 X122.05 Y104.698 E.0182
G1 X119.951 Y102.599 E.09843
G1 X119.951 Y99.669 E.0972
G1 X123.13 Y96.49 E.14914
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y110.274 E.09715
G1 X137.996 Y112.328 E.09633
G3 X137.95 Y110.704 I5.673 J-.973 E.05408
; WIPE_START
G1 F24000
G1 X137.996 Y112.328 E-.61745
G1 X138.262 Y112.063 E-.14255
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I.776 J-.938 P1  F30000
G1 X131.102 Y106.142 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2543
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2543
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.005 J.295 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.291 J-.009 E.01394
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2543
M73 P94 R1
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z16.4
G1 Z16
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2543
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2543
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2543
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2543
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 111/118
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
G3 Z16.4 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z16.4
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.398 Y112.026 E.40099
G3 X119.604 Y112.109 I-1.398 J.01 E.14355
G1 X119.602 Y96.142 E.52967
G1 X140.398 Y96.142 E.68983
G1 X140.398 Y112.026 E.52691
G3 X137.602 Y112.026 I-1.398 J.01 E.14633
G1 X137.602 Y99.938 E.40099
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2543
G1 X122.79 Y112.036 E.35969
G3 X119.212 Y112.128 I-1.79 J-.001 E.16989
G1 X119.21 Y95.75 E.50327
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y112.035 E.50042
G3 X137.21 Y112.036 I-1.79 J-.001 E.17274
G1 X137.21 Y100.33 E.35969
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.84 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I-1.212 J-.114 P1  F30000
G1 X122.05 Y110.705 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2543
G1 X122.05 Y112.009 E.04327
G3 X122.005 Y112.329 I-.91 J.036 E.01077
G1 X119.952 Y110.277 E.09629
G1 X119.952 Y107.344 E.09727
G1 X122.05 Y105.246 E.0984
G1 X122.05 Y104.698 E.0182
G1 X119.951 Y102.599 E.09843
G1 X119.951 Y99.669 E.0972
G1 X123.13 Y96.49 E.14914
G1 X121.518 Y96.49 E.05348
G1 X124.617 Y99.589 E.14539
G1 X127.707 Y99.589 E.10249
G1 X130.806 Y96.49 E.14539
G1 X129.194 Y96.49 E.05348
G1 X132.293 Y99.589 E.14539
G1 X135.383 Y99.589 E.10249
G1 X138.482 Y96.49 E.14539
G1 X136.87 Y96.49 E.05348
G1 X140.05 Y99.67 E.14917
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X140.05 Y107.346 E.09848
G1 X140.05 Y110.274 E.09715
G1 X137.996 Y112.328 E.09633
G3 X137.95 Y110.704 I5.673 J-.973 E.05408
; WIPE_START
G1 F24000
G1 X137.996 Y112.328 E-.61745
G1 X138.262 Y112.063 E-.14255
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I.776 J-.938 P1  F30000
G1 X131.102 Y106.142 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2543
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2543
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.048 E.08548
G3 X127.988 Y105.75 I.293 J-.004 E.01384
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2543
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z16.6
G1 Z16.2
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2543
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2543
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F2543
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F2543
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 112/118
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
G3 Z16.6 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z16.6
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3235
G1 X122.398 Y112.026 E.40099
G3 X119.604 Y112.109 I-1.398 J.012 E.14366
G1 X119.602 Y96.142 E.52967
G1 X140.398 Y96.142 E.68983
G1 X140.398 Y112.026 E.52691
G3 X137.602 Y112.026 I-1.398 J.01 E.14633
G1 X137.602 Y99.938 E.40099
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3235
G1 X122.79 Y112.036 E.35969
G3 X119.212 Y112.128 I-1.79 J.002 E.17004
G1 X119.21 Y95.75 E.50327
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y112.035 E.50042
G3 X137.21 Y112.036 I-1.79 J-.001 E.17274
G1 X137.21 Y100.33 E.35969
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.84 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I-1.204 J-.18 P1  F30000
G1 X121.643 Y110.338 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3235
G1 X121.643 Y111.967 E.05401
G1 X120.36 Y110.684 E.06019
G1 X120.359 Y106.937 E.12428
G1 X121.643 Y105.654 E.06021
G1 X121.643 Y104.291 E.04521
G1 X120.359 Y103.007 E.06024
G1 X120.358 Y99.262 E.12421
G1 X122.723 Y96.897 E.11095
G1 X121.925 Y96.897 E.02647
G1 X124.21 Y99.182 E.1072
G1 X128.114 Y99.182 E.1295
G1 X130.399 Y96.897 E.1072
G1 X129.601 Y96.897 E.02647
G1 X131.886 Y99.182 E.1072
G1 X135.79 Y99.182 E.1295
G1 X138.075 Y96.897 E.1072
G1 X137.277 Y96.897 E.02647
G1 X139.643 Y99.263 E.11098
G1 X139.643 Y103.005 E.12415
G1 X138.357 Y104.291 E.06029
G1 X138.357 Y105.654 E.04521
G1 X139.643 Y106.939 E.06029
G1 X139.643 Y110.681 E.12415
G1 X138.357 Y111.967 E.06029
G1 X138.357 Y110.338 E.05401
G1 X140.05 Y111.949 F30000
G1 F3235
G1 X140.05 Y96.49 E.51281
G1 X119.95 Y96.49 E.66673
G1 X119.953 Y112.083 E.51726
G2 X122.05 Y112.009 I1.048 J-.055 E.10816
G1 X122.05 Y99.589 E.41199
G1 X137.95 Y99.589 E.52746
G1 X137.95 Y112.006 E.41187
G2 X140.05 Y112.009 I1.05 J.022 E.11074
; WIPE_START
G1 F24000
G1 X139.99 Y112.385 E-.14468
G1 X139.668 Y112.847 E-.214
G1 X139.36 Y113.024 E-.13471
G1 X138.892 Y113.081 E-.17918
G1 X138.67 Y113.021 E-.08742
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I.819 J-.901 P1  F30000
G1 X131.102 Y106.142 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3235
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3235
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
M73 P95 R1
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.048 E.08548
G3 X127.988 Y105.75 I.291 J-.007 E.01387
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F3235
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z16.8
G1 Z16.4
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F3235
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F3235
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F3235
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F3235
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 113/118
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
G3 Z16.8 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z16.8
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3235
G1 X122.398 Y112.026 E.40099
G3 X119.604 Y112.109 I-1.398 J.01 E.14355
G1 X119.602 Y96.142 E.52967
G1 X140.398 Y96.142 E.68983
G1 X140.398 Y112.026 E.52691
G3 X137.602 Y112.026 I-1.398 J.01 E.14633
G1 X137.602 Y99.938 E.40099
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3235
G1 X122.79 Y112.036 E.35969
G3 X119.212 Y112.128 I-1.79 J-.001 E.16989
G1 X119.21 Y95.75 E.50327
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y112.035 E.50042
G3 X137.21 Y112.036 I-1.79 J-.001 E.17274
G1 X137.21 Y100.33 E.35969
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.84 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I-1.204 J-.18 P1  F30000
G1 X121.643 Y110.338 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3235
G1 X121.643 Y111.967 E.05401
G1 X120.36 Y110.684 E.06019
G1 X120.359 Y106.937 E.12428
G1 X121.643 Y105.654 E.06021
G1 X121.643 Y104.291 E.04521
G1 X120.359 Y103.007 E.06024
G1 X120.358 Y99.262 E.12421
G1 X122.723 Y96.897 E.11095
G1 X121.925 Y96.897 E.02647
G1 X124.21 Y99.182 E.1072
G1 X128.114 Y99.182 E.1295
G1 X130.399 Y96.897 E.1072
G1 X129.601 Y96.897 E.02647
G1 X131.886 Y99.182 E.1072
G1 X135.79 Y99.182 E.1295
G1 X138.075 Y96.897 E.1072
G1 X137.277 Y96.897 E.02647
G1 X139.643 Y99.263 E.11098
G1 X139.643 Y103.005 E.12415
G1 X138.357 Y104.291 E.06029
G1 X138.357 Y105.654 E.04521
G1 X139.643 Y106.939 E.06029
G1 X139.643 Y110.681 E.12415
G1 X138.357 Y111.967 E.06029
G1 X138.357 Y110.338 E.05401
G1 X140.05 Y111.949 F30000
G1 F3235
G1 X140.05 Y96.49 E.5128
G1 X119.95 Y96.49 E.66673
G1 X119.953 Y112.083 E.51726
G2 X122.05 Y112.009 I1.048 J-.054 E.10822
G1 X122.05 Y99.589 E.41199
G1 X137.95 Y99.589 E.52746
G1 X137.95 Y112.006 E.41187
G2 X140.05 Y112.009 I1.05 J.029 E.11125
; WIPE_START
G1 F24000
G1 X139.989 Y112.387 E-.14549
G1 X139.668 Y112.847 E-.21314
G1 X139.358 Y113.024 E-.13558
G1 X138.892 Y113.081 E-.17845
G1 X138.67 Y113.021 E-.08734
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I.819 J-.901 P1  F30000
G1 X131.102 Y106.142 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3235
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3235
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.007 J.293 E.01391
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.048 E.08548
G3 X127.988 Y105.75 I.291 J-.007 E.01387
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F3235
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z17
G1 Z16.6
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F3235
G1 X129 Y105.945 E.01531
G1 X130.75 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423218
G1 F3235
G1 X129.31 Y107.29 E.04462
G1 X129.25 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F3235
G1 X131.128 Y107.668 E.05773
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X129.19 Y107.668 E.00979
G1 X129.25 Y108.045 F30000
G1 F3235
G1 X131.506 Y108.045 E.06931
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X129.19 Y108.045 E.02138
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X128.494 Y108.045 E-.26436
G1 X128.494 Y106.741 E-.49564
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 114/118
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
G3 Z17 I.906 J-.812 P1  F30000
G1 X122.398 Y99.938 Z17
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3234
G1 X122.398 Y112.026 E.40099
G3 X119.604 Y112.117 I-1.398 J.013 E.14354
G1 X119.602 Y96.142 E.52991
G1 X140.398 Y96.142 E.68983
G1 X140.398 Y112.026 E.52691
G3 X137.602 Y112.026 I-1.398 J.01 E.14633
G1 X137.602 Y99.938 E.40099
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3234
G1 X122.79 Y112.036 E.35969
G3 X119.212 Y112.131 I-1.79 J.004 E.17008
G1 X119.21 Y95.75 E.50335
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y112.035 E.50042
G3 X137.21 Y112.036 I-1.79 J-.001 E.17274
G1 X137.21 Y100.33 E.35969
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.84 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I-1.204 J-.18 P1  F30000
G1 X121.643 Y110.338 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3234
G1 X121.643 Y111.967 E.05401
G1 X120.36 Y110.684 E.06019
G1 X120.359 Y106.937 E.12428
G1 X121.643 Y105.654 E.06021
G1 X121.643 Y104.291 E.04521
G1 X120.359 Y103.007 E.06024
G1 X120.358 Y99.262 E.12421
G1 X122.723 Y96.897 E.11095
G1 X121.925 Y96.897 E.02647
G1 X124.21 Y99.182 E.1072
G1 X128.114 Y99.182 E.1295
G1 X130.399 Y96.897 E.1072
G1 X129.601 Y96.897 E.02647
G1 X131.886 Y99.182 E.1072
G1 X135.79 Y99.182 E.1295
G1 X138.075 Y96.897 E.1072
G1 X137.277 Y96.897 E.02647
G1 X139.643 Y99.263 E.11098
G1 X139.643 Y103.005 E.12415
G1 X138.357 Y104.291 E.06029
G1 X138.357 Y105.654 E.04521
G1 X139.643 Y106.939 E.06029
G1 X139.643 Y110.681 E.12415
G1 X138.357 Y111.967 E.06029
G1 X138.357 Y110.338 E.05401
G1 X140.05 Y111.949 F30000
G1 F3234
G1 X140.05 Y96.49 E.5128
G1 X119.95 Y96.49 E.66673
G1 X119.953 Y112.086 E.51736
G2 X122.05 Y112.009 I1.048 J-.056 E.10817
G1 X122.05 Y99.589 E.41199
G1 X137.95 Y99.589 E.52746
G1 X137.95 Y112.006 E.41187
G2 X138.267 Y112.788 I1.079 J.019 E.02877
G1 X138.267 Y112.788 E0
G2 X140.05 Y112.009 I.732 J-.755 E.08245
; WIPE_START
G1 F24000
G1 X139.898 Y112.579 E-.22394
G1 X139.669 Y112.847 E-.13417
G1 X139.356 Y113.025 E-.1368
M73 P96 R1
G1 X138.892 Y113.081 E-.17744
G1 X138.688 Y113.04 E-.07905
G1 X138.669 Y113.029 E-.0086
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I.819 J-.9 P1  F30000
G1 X131.102 Y106.142 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3234
G1 X131.897 Y106.142 E.02638
G1 X131.898 Y108.438 E.07616
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.142 E.07614
G1 X131.042 Y106.142 E.09753
G1 X130.71 Y105.75 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3234
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.005 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.05 E.08541
G3 X127.988 Y105.75 I.299 J-.001 E.01384
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00769
G1 X129.113 Y104.75 E.00695
G1 X129.29 Y104.927 E.00769
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
G1 X131 Y105.946 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F3234
G1 X131 Y104.946 E.01531
; WIPE_START
G1 F24000
G1 X131 Y105.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I.544 J-1.089 P1  F30000
G1 X129 Y104.946 Z17.2
G1 Z16.8
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F3234
G1 X129 Y105.945 E.01531
G1 X129.25 Y107.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F3234
G1 X130.69 Y107.29 E.0446
G1 X131.128 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F3234
G1 X131.128 Y106.911 E.02327
G1 X128.871 Y106.911 E.06935
G1 X128.871 Y107.668 E.02327
G1 X131.068 Y107.668 E.06752
G1 X131.506 Y108.045 F30000
G1 F3234
G1 X131.505 Y106.534 E.04645
G1 X128.494 Y106.534 E.09253
G1 X128.494 Y108.045 E.04644
G1 X131.446 Y108.045 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.446 Y108.045 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 115/118
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
G3 Z17.2 I.918 J-.798 P1  F30000
G1 X122.398 Y99.938 Z17.2
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3245
G1 X122.398 Y112.026 E.40099
G3 X119.604 Y112.109 I-1.398 J.01 E.14355
G1 X119.602 Y96.142 E.52967
G1 X140.398 Y96.142 E.68983
G1 X140.398 Y112.026 E.52691
G3 X137.602 Y112.026 I-1.398 J.006 E.14609
G1 X137.602 Y99.938 E.40099
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3245
G1 X122.79 Y112.036 E.35969
G3 X119.212 Y112.128 I-1.79 J-.001 E.16989
G1 X119.21 Y95.75 E.50327
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y112.035 E.50042
G3 X137.21 Y112.036 I-1.79 J-.005 E.1725
G1 X137.21 Y100.33 E.35969
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.84 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I-1.204 J-.18 P1  F30000
G1 X121.643 Y110.338 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3245
G1 X121.643 Y111.967 E.05401
G1 X120.36 Y110.684 E.06019
G1 X120.359 Y106.937 E.12428
G1 X121.643 Y105.654 E.06021
G1 X121.643 Y104.291 E.04521
G1 X120.359 Y103.007 E.06024
G1 X120.358 Y99.262 E.12421
G1 X122.723 Y96.897 E.11095
G1 X121.925 Y96.897 E.02647
G1 X124.21 Y99.182 E.1072
G1 X128.114 Y99.182 E.1295
G1 X130.399 Y96.897 E.1072
G1 X129.601 Y96.897 E.02647
G1 X131.886 Y99.182 E.1072
G1 X135.79 Y99.182 E.1295
G1 X138.075 Y96.897 E.1072
G1 X137.277 Y96.897 E.02647
G1 X139.643 Y99.263 E.11098
G1 X139.643 Y103.005 E.12415
G1 X138.357 Y104.291 E.06029
G1 X138.357 Y105.654 E.04521
G1 X139.643 Y106.939 E.06029
G1 X139.643 Y110.681 E.12415
G1 X138.357 Y111.967 E.06029
G1 X138.357 Y110.338 E.05401
G1 X140.05 Y111.949 F30000
G1 F3245
G1 X140.05 Y96.49 E.5128
G1 X119.95 Y96.49 E.66673
M73 P96 R0
G1 X119.953 Y112.083 E.51726
G2 X122.05 Y112.009 I1.048 J-.055 E.10815
G1 X122.05 Y99.589 E.41199
G1 X137.95 Y99.589 E.52746
G1 X137.95 Y112.006 E.41187
G2 X140.05 Y112.009 I1.05 J.026 E.11106
; WIPE_START
G1 F24000
G1 X139.989 Y112.387 E-.1455
G1 X139.664 Y112.85 E-.21504
G1 X139.357 Y113.024 E-.13398
G1 X138.892 Y113.081 E-.1779
G1 X138.67 Y113.019 E-.08757
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I.815 J-.903 P1  F30000
G1 X131.578 Y106.618 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3245
G1 X131.897 Y106.618 E.01059
G1 X131.898 Y108.438 E.06036
G1 X128.102 Y108.438 E.12591
G1 X128.102 Y106.617 E.06038
G1 X130.133 Y106.618 E.06737
G1 X131.518 Y106.618 E.04595
; WIPE_START
G1 F24000
G1 X131.897 Y106.618 E-.14412
G1 X131.898 Y108.239 E-.61588
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I1.098 J-.524 P1  F30000
G1 X130.71 Y105.75 Z17.4
G1 Z17
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3245
G1 X130.71 Y104.927 E.02529
G1 X130.887 Y104.75 E.00769
G1 X131.113 Y104.75 E.00695
G1 X131.29 Y104.927 E.00769
G1 X131.29 Y105.75 E.02529
G1 X131.99 Y105.75 E.0215
G3 X132.289 Y106.028 I.004 J.296 E.01388
G1 X132.29 Y108.83 E.08609
G1 X127.71 Y108.83 E.14073
G1 X127.71 Y106.047 E.08549
G3 X127.988 Y105.75 I.299 J.001 E.01376
G1 X128.71 Y105.749 E.02217
G1 X128.71 Y104.927 E.02528
G1 X128.887 Y104.75 E.00767
G1 X129.115 Y104.751 E.00701
G1 X129.29 Y104.927 E.00762
G1 X129.29 Y105.75 E.02529
G1 X130.65 Y105.75 E.04179
M204 S10000
; WIPE_START
G1 F24000
G1 X130.71 Y104.927 E-.31358
G1 X130.887 Y104.75 E-.09511
G1 X131.113 Y104.75 E-.08589
G1 X131.29 Y104.927 E-.09511
G1 X131.29 Y105.375 E-.17031
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I-1.213 J.098 P1  F30000
G1 X131.506 Y108.045 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3245
G1 X131.505 Y107.01 E.03182
G1 X128.494 Y107.01 E.09253
G1 X128.494 Y108.045 E.03183
G1 X131.446 Y108.045 E.09069
G1 X130.988 Y107.692 F30000
; LINE_WIDTH: 0.372223
G1 F3245
G1 X131.152 Y107.692 E.00442
G1 X131.152 Y107.363 E.00883
G1 X128.847 Y107.363 E.06185
G1 X128.847 Y107.692 E.00884
G1 X130.928 Y107.692 E.05583
G1 X128.136 Y106.176 F30000
; LINE_WIDTH: 0.518088
G1 F3245
G1 X131.803 Y106.176 E.14197
; CHANGE_LAYER
; Z_HEIGHT: 17.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.803 Y106.176 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 116/118
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
G3 Z17.4 I.784 J-.931 P1  F30000
G1 X122.398 Y99.938 Z17.4
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9051
G1 X122.398 Y112.026 E.40099
G3 X119.604 Y112.117 I-1.398 J.013 E.14354
G1 X119.602 Y96.142 E.52991
G1 X140.398 Y96.142 E.68983
G1 X140.398 Y112.026 E.52691
G3 X137.602 Y112.026 I-1.398 J.01 E.14633
G1 X137.602 Y99.938 E.40099
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9051
G1 X122.79 Y112.036 E.35969
G3 X119.212 Y112.131 I-1.79 J.004 E.17008
G1 X119.21 Y95.75 E.50335
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y112.035 E.50042
G3 X137.21 Y112.036 I-1.79 J-.001 E.17274
G1 X137.21 Y100.33 E.35969
G1 X122.85 Y100.33 E.44124
M204 S10000
G1 X122.231 Y100.685 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.400452
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X119.973 Y103.375 E.18024
G1 X119.973 Y104.076 E.03595
G1 X122.028 Y101.627 E.16407
G1 X122.028 Y102.327 E.03596
G1 X119.973 Y104.777 E.16406
G1 X119.973 Y105.477 E.03595
G1 X122.028 Y103.028 E.16405
G1 X122.028 Y103.729 E.03596
G1 X119.973 Y106.178 E.16404
G1 X119.973 Y106.878 E.03595
G1 X122.028 Y104.43 E.16404
G1 X122.028 Y105.131 E.03596
G1 X119.974 Y107.579 E.16403
G1 X119.974 Y108.28 E.03595
G1 X122.028 Y105.831 E.16402
G1 X122.028 Y106.532 E.03596
G1 X119.974 Y108.98 E.16401
G1 X119.974 Y109.681 E.03595
G1 X122.028 Y107.233 E.164
G1 X122.028 Y107.934 E.03596
G1 X119.974 Y110.382 E.164
G1 X119.974 Y111.082 E.03595
G1 X122.028 Y108.634 E.16399
G1 X122.028 Y109.335 E.03596
G1 X119.974 Y111.783 E.16398
G2 X120.044 Y112.4 I1.565 J.134 E.03208
G1 X122.028 Y110.036 E.15837
G1 X122.028 Y110.737 E.03596
G1 X120.306 Y112.789 E.13746
G2 X120.705 Y113.014 I.783 J-.92 E.02365
G1 X122.028 Y111.438 E.10563
G3 X122.014 Y112.155 I-3.762 J.285 E.03688
G1 X121.09 Y113.256 E.07376
M106 S252.45
G1 X119.77 Y97.311 F30000
M106 S255
G1 F3000
G1 X120.44 Y96.511 E.05353
G1 X121.028 Y96.511 E.03017
G1 X119.972 Y97.77 E.0843
G1 X119.972 Y98.471 E.03595
G1 X121.616 Y96.511 E.13124
G1 X122.204 Y96.511 E.03017
G1 X119.972 Y99.171 E.17817
G1 X119.972 Y99.872 E.03595
G1 X122.792 Y96.511 E.22511
G1 X123.38 Y96.511 E.03017
G1 X119.973 Y100.573 E.27205
G1 X119.973 Y101.273 E.03595
G1 X123.968 Y96.511 E.31898
M73 P97 R0
G1 X124.556 Y96.511 E.03017
G1 X119.973 Y101.974 E.36592
G1 X119.973 Y102.675 E.03595
G1 X122.028 Y100.225 E.16409
G1 X122.028 Y99.568 E.03373
G1 X122.58 Y99.568 E.0283
G1 X125.144 Y96.511 E.20474
G1 X125.732 Y96.511 E.03017
G1 X123.168 Y99.568 E.20474
G1 X123.756 Y99.568 E.03017
G1 X126.32 Y96.511 E.20474
G1 X126.908 Y96.511 E.03017
G1 X124.344 Y99.568 E.20474
G1 X124.932 Y99.568 E.03017
G1 X127.496 Y96.511 E.20474
G1 X128.084 Y96.511 E.03017
G1 X125.52 Y99.568 E.20474
G1 X126.108 Y99.568 E.03017
G1 X128.672 Y96.511 E.20474
G1 X129.26 Y96.511 E.03017
G1 X126.696 Y99.568 E.20474
G1 X127.284 Y99.568 E.03017
G1 X129.848 Y96.511 E.20474
G1 X130.436 Y96.511 E.03017
G1 X127.872 Y99.568 E.20474
G1 X128.46 Y99.568 E.03017
G1 X131.025 Y96.511 E.20474
G1 X131.613 Y96.511 E.03017
G1 X129.048 Y99.568 E.20474
G1 X129.636 Y99.568 E.03017
G1 X132.201 Y96.511 E.20474
G1 X132.789 Y96.511 E.03017
G1 X130.224 Y99.568 E.20474
G1 X130.812 Y99.568 E.03017
G1 X133.377 Y96.511 E.20474
G1 X133.965 Y96.511 E.03017
G1 X131.4 Y99.568 E.20474
G1 X131.988 Y99.568 E.03017
G1 X134.553 Y96.511 E.20474
G1 X135.141 Y96.511 E.03017
G1 X132.576 Y99.568 E.20474
G1 X133.164 Y99.568 E.03017
G1 X135.729 Y96.511 E.20474
G1 X136.317 Y96.511 E.03017
G1 X133.752 Y99.568 E.20474
G1 X134.34 Y99.568 E.03017
G1 X136.905 Y96.511 E.20474
G1 X137.493 Y96.511 E.03017
G1 X134.928 Y99.568 E.20474
G1 X135.516 Y99.568 E.03017
G1 X138.081 Y96.511 E.20474
G1 X138.669 Y96.511 E.03017
G1 X136.104 Y99.568 E.20474
G1 X136.692 Y99.568 E.03017
G1 X139.257 Y96.511 E.20474
G1 X139.845 Y96.511 E.03017
G1 X137.28 Y99.568 E.20474
G1 X137.868 Y99.568 E.03017
G1 X140.028 Y96.994 E.17243
G1 X140.028 Y97.695 E.03596
G1 X137.972 Y100.145 E.16417
G1 X137.972 Y100.846 E.03596
G1 X140.028 Y98.395 E.16417
G1 X140.028 Y99.096 E.03596
G1 X137.972 Y101.547 E.16417
G1 X137.972 Y102.248 E.03596
G1 X140.028 Y99.797 E.16417
G1 X140.028 Y100.498 E.03596
G1 X137.972 Y102.948 E.16417
G1 X137.972 Y103.649 E.03596
G1 X140.028 Y101.198 E.16417
G1 X140.028 Y101.899 E.03596
G1 X137.972 Y104.35 E.16417
G1 X137.972 Y105.051 E.03596
G1 X140.028 Y102.6 E.16417
G1 X140.028 Y103.301 E.03596
G1 X137.972 Y105.751 E.16417
G1 X137.972 Y106.452 E.03596
G1 X140.028 Y104.002 E.16417
G1 X140.028 Y104.702 E.03596
G1 X137.972 Y107.153 E.16417
G1 X137.972 Y107.854 E.03596
G1 X140.028 Y105.403 E.16417
G1 X140.028 Y106.104 E.03596
G1 X137.972 Y108.555 E.16417
G1 X137.972 Y109.255 E.03596
G1 X140.028 Y106.805 E.16417
G1 X140.028 Y107.505 E.03596
G1 X137.972 Y109.956 E.16417
G1 X137.972 Y110.657 E.03596
G1 X140.028 Y108.206 E.16417
G1 X140.028 Y108.907 E.03596
G1 X137.972 Y111.358 E.16417
G1 X137.977 Y112.052 E.03562
G1 X140.028 Y109.608 E.16373
G1 X140.028 Y110.309 E.03596
G1 X138.126 Y112.575 E.15185
G2 X138.444 Y112.897 I.714 J-.389 E.02352
G1 X140.028 Y111.009 E.12644
G1 X140.028 Y111.71 E.03596
G1 X138.747 Y113.237 E.10227
M106 S252.45
; WIPE_START
G1 F24000
G1 X140.028 Y111.71 E-.7573
G1 X140.028 Y111.703 E-.0027
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I.687 J-1.004 P1  F30000
G1 X131.898 Y106.142 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F9051
G1 X131.898 Y108.438 E.07614
G1 X128.102 Y108.438 E.12591
G1 X128.103 Y106.142 E.07616
G1 X131.838 Y106.142 E.12391
G1 X132.11 Y105.773 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9051
G3 X132.29 Y106.047 I-.116 J.272 E.01067
G1 X132.29 Y108.83 E.08549
G1 X127.71 Y108.83 E.14073
G1 X127.711 Y106.028 E.08609
G3 X128.01 Y105.75 I.298 J.021 E.01384
G1 X132.011 Y105.75 E.12293
G3 X132.053 Y105.756 I-.017 J.295 E.00129
M204 S10000
; WIPE_START
G1 F24000
G1 X132.192 Y105.824 E-.05904
G1 X132.271 Y105.94 E-.05338
G1 X132.29 Y106.047 E-.04149
G1 X132.29 Y107.642 E-.60609
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I.14 J-1.209 P1  F30000
G1 X129.25 Y107.29 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423186
G1 F9051
G1 X130.69 Y107.29 E.04462
G1 X128.872 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F9051
G1 X131.129 Y107.668 E.06936
G1 X131.129 Y106.911 E.02326
G1 X128.872 Y106.911 E.06935
G1 X128.872 Y107.608 E.02143
G1 X128.494 Y108.045 F30000
G1 F9051
G1 X131.506 Y108.045 E.09253
G1 X131.506 Y106.534 E.04643
G1 X128.495 Y106.534 E.09253
G1 X128.494 Y107.986 E.0446
; CHANGE_LAYER
; Z_HEIGHT: 17.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X128.495 Y106.534 E-.55161
G1 X129.043 Y106.534 E-.20839
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 117/118
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
G3 Z17.6 I.857 J-.864 P1  F30000
G1 X122.398 Y99.938 Z17.6
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4634
G1 X122.398 Y112.026 E.40099
G3 X119.604 Y112.109 I-1.398 J.012 E.14366
G1 X119.602 Y96.142 E.52967
G1 X140.398 Y96.142 E.68983
G1 X140.398 Y112.026 E.52691
G3 X137.602 Y112.026 I-1.398 J.01 E.14633
G1 X137.602 Y99.938 E.40099
G1 X122.458 Y99.938 E.50236
G1 X122.79 Y100.33 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4634
G1 X122.79 Y112.036 E.35969
G3 X119.212 Y112.128 I-1.79 J.002 E.17004
G1 X119.21 Y95.75 E.50327
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y112.035 E.50042
G3 X137.21 Y112.036 I-1.79 J-.001 E.17274
G1 X137.21 Y100.33 E.35969
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.84 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I-1.202 J-.19 P1  F30000
G1 X121.212 Y112.625 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F4634
G1 X121.444 Y112.474 E.00852
G1 X121.582 Y112.247 E.00816
G1 X121.629 Y111.916 E.01027
G1 X121.629 Y99.734 E.37433
G1 X121.747 Y99.387 E.01126
G1 X121.99 Y99.207 E.00929
G1 X122.194 Y99.168 E.0064
G1 X137.806 Y99.168 E.47969
G1 X138.01 Y99.207 E.0064
G1 X138.253 Y99.388 E.00929
G1 X138.371 Y99.734 E.01125
G1 X138.371 Y111.962 E.37573
G1 X138.429 Y112.271 E.00967
G1 X138.57 Y112.483 E.00782
G1 X138.844 Y112.63 E.00956
G1 X139.081 Y112.655 E.00733
G1 X139.368 Y112.527 E.00966
G2 X139.629 Y111.904 I-.621 J-.626 E.02129
G1 X139.629 Y96.911 E.46069
G1 X120.371 Y96.911 E.59172
G1 X120.374 Y112.052 E.46525
G1 X120.451 Y112.334 E.00897
G1 X120.622 Y112.536 E.00813
G1 X120.908 Y112.655 E.00954
G1 X121.152 Y112.631 E.00752
G1 X121.112 Y112.223 F30000
; LINE_WIDTH: 0.481757
G1 F4634
G2 X121.221 Y111.916 I-.317 J-.285 E.01195
G1 X121.22 Y99.734 E.43564
; LINE_WIDTH: 0.48284
G1 X121.335 Y99.445 E.01114
; LINE_WIDTH: 0.420553
G1 X121.449 Y99.156 E.00956
G1 X121.853 Y98.855 E.0155
G1 X122.194 Y98.791 E.01068
G1 X137.806 Y98.791 E.48039
G1 X138.147 Y98.855 E.01068
G1 X138.551 Y99.156 E.0155
; LINE_WIDTH: 0.419999
G1 X138.665 Y99.445 E.00955
; LINE_WIDTH: 0.48276
G1 X138.78 Y99.734 E.01114
G1 X138.78 Y111.924 E.43691
G1 X138.85 Y112.166 E.00904
G1 X138.998 Y112.249 E.00607
G1 X139.14 Y112.186 E.00557
G1 X139.22 Y111.937 E.00938
G1 X139.22 Y99.734 E.43737
; LINE_WIDTH: 0.483144
G1 X139.236 Y99.325 E.01467
; LINE_WIDTH: 0.420582
G2 X139.252 Y97.288 I-52.742 J-1.427 E.0627
G1 X120.749 Y97.288 E.56943
G1 X120.749 Y98.917 E.05012
; LINE_WIDTH: 0.419999
G1 X120.765 Y99.325 E.01257
; LINE_WIDTH: 0.481665
G1 X120.78 Y99.734 E.01462
G1 X120.782 Y111.916 E.43554
G1 X120.81 Y112.142 E.00812
G1 X120.938 Y112.244 E.00585
G1 X121.052 Y112.23 E.00409
G1 X121.56 Y98.099 F30000
; LINE_WIDTH: 0.533888
G1 F4634
G1 X121.771 Y98.079 E.0085
; LINE_WIDTH: 0.494276
G1 X121.983 Y98.059 E.00781
; LINE_WIDTH: 0.415584
G1 X122.194 Y98.04 E.00645
G1 X137.806 Y98.04 E.47407
; LINE_WIDTH: 0.415052
G1 X137.997 Y98.058 E.00584
; LINE_WIDTH: 0.454704
G1 X138.189 Y98.076 E.00646
; LINE_WIDTH: 0.494355
G1 X138.381 Y98.094 E.00708
G1 X138.875 Y99.001 F30000
; LINE_WIDTH: 0.419999
G1 F4634
G1 X138.875 Y97.665 E.04106
G1 X121.126 Y97.665 E.54537
G1 X121.126 Y99 E.04102
G1 X121.151 Y98.925 E.00242
G1 X121.717 Y98.504 E.02167
G1 X122.194 Y98.414 E.01493
G1 X137.806 Y98.414 E.47969
G1 X138.283 Y98.504 E.01494
G1 X138.855 Y98.944 E.02218
G1 X138.578 Y112.949 F30000
G1 F4634
G1 X138.903 Y113.037 E.01033
G2 X139.47 Y112.924 I-.001 J-1.491 E.0179
G1 X139.739 Y112.716 E.01043
G1 X139.945 Y112.37 E.01237
G1 X140.006 Y111.904 E.01446
G1 X140.006 Y96.534 E.47228
G1 X119.994 Y96.534 E.6149
G1 X119.997 Y112.08 E.47769
G1 X120.116 Y112.513 E.01379
G1 X120.399 Y112.843 E.01336
G1 X120.736 Y112.999 E.0114
G1 X121.099 Y113.037 E.01123
G1 X121.46 Y112.922 E.01164
G1 X121.734 Y112.721 E.01044
G1 X121.942 Y112.381 E.01224
G1 X122.006 Y111.916 E.01442
G1 X122.006 Y99.734 E.37433
G1 X122.045 Y99.619 E.00375
G1 X122.194 Y99.545 E.0051
G1 X137.806 Y99.545 E.47969
G1 X137.955 Y99.619 E.0051
G1 X137.994 Y99.734 E.00375
G1 X137.994 Y111.997 E.3768
G1 X138.072 Y112.416 E.01311
G1 X138.296 Y112.752 E.01238
G1 X138.529 Y112.915 E.00875
; WIPE_START
G1 F24000
G1 X138.296 Y112.752 E-.10826
G1 X138.072 Y112.416 E-.15314
G1 X137.994 Y111.997 E-.16208
G1 X137.994 Y111.111 E-.33653
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I.769 J-.943 P1  F30000
G1 X131.898 Y106.142 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4634
G1 X131.898 Y108.438 E.07614
G1 X128.102 Y108.438 E.12591
G1 X128.103 Y106.142 E.07616
G1 X131.838 Y106.142 E.12391
G1 X132.11 Y105.773 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4634
G3 X132.29 Y106.047 I-.116 J.272 E.01067
G1 X132.29 Y108.83 E.08549
G1 X127.71 Y108.83 E.14073
G1 X127.711 Y106.031 E.08601
G3 X128.008 Y105.75 I.298 J.018 E.01384
G1 X132.011 Y105.75 E.12302
G3 X132.053 Y105.756 I-.017 J.295 E.00128
M204 S10000
; WIPE_START
G1 F24000
G1 X132.192 Y105.824 E-.05903
G1 X132.271 Y105.94 E-.0534
G1 X132.29 Y106.047 E-.0415
G1 X132.29 Y107.642 E-.60607
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I.272 J-1.186 P1  F30000
G1 X130.75 Y107.29 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42296
G1 F4634
G1 X129.31 Y107.29 E.04459
G1 X129.25 Y107.668 F30000
; LINE_WIDTH: 0.419999
G1 F4634
G1 X131.129 Y107.668 E.05772
G1 X131.129 Y106.911 E.02326
G1 X128.872 Y106.911 E.06935
G1 X128.872 Y107.668 E.02327
G1 X129.19 Y107.668 E.00979
G1 X129.25 Y108.045 F30000
G1 F4634
G1 X131.506 Y108.045 E.06931
G1 X131.506 Y106.534 E.04643
G1 X128.495 Y106.534 E.09253
G1 X128.494 Y108.045 E.04645
G1 X129.19 Y108.045 E.02138
; CHANGE_LAYER
; Z_HEIGHT: 17.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.494 Y108.045 E-.26444
G1 X128.495 Y106.741 E-.49556
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 118/118
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
G3 Z17.8 I.909 J-.809 P1  F30000
G1 X122.79 Y100.33 Z17.8
G1 Z17.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5614
G1 X122.79 Y112.036 E.35969
G3 X119.212 Y112.128 I-1.79 J.002 E.17004
G1 X119.21 Y95.75 E.50327
G1 X140.79 Y95.75 E.66309
G1 X140.79 Y112.035 E.50042
G3 X137.21 Y112.036 I-1.79 J-.001 E.17274
G1 X137.21 Y100.33 E.35969
G1 X122.85 Y100.33 E.44124
M204 S10000
; WIPE_START
G1 F24000
M73 P98 R0
G1 X122.84 Y102.33 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I-.602 J1.058 P1  F30000
G1 X140.539 Y112.395 Z18
G1 Z17.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F5614
G1 X139.358 Y113.576 E.05131
G1 X138.799 Y113.601
G1 X140.583 Y111.818 E.07749
G1 X140.583 Y111.285
G1 X138.375 Y113.492 E.09592
G1 X138.04 Y113.294
G1 X140.583 Y110.751 E.11048
G1 X140.583 Y110.218
G1 X137.769 Y113.031 E.12225
G1 X137.567 Y112.701
G1 X140.583 Y109.685 E.13105
G1 X140.583 Y109.152
G1 X137.443 Y112.291 E.13641
G1 X137.417 Y111.784
G1 X140.583 Y108.618 E.13754
G1 X140.583 Y108.085
G1 X137.417 Y111.25 E.13754
G1 X137.417 Y110.717
G1 X140.583 Y107.552 E.13754
G1 X140.583 Y107.019
G1 X137.417 Y110.184 E.13754
G1 X137.417 Y109.651
G1 X140.583 Y106.485 E.13754
G1 X140.583 Y105.952
G1 X137.417 Y109.117 E.13754
G1 X137.417 Y108.584
G1 X140.583 Y105.419 E.13754
G1 X140.583 Y104.885
G1 X137.417 Y108.051 E.13754
G1 X137.417 Y107.517
G1 X140.583 Y104.352 E.13754
G1 X140.583 Y103.819
G1 X137.417 Y106.984 E.13754
G1 X137.417 Y106.451
G1 X140.583 Y103.286 E.13754
G1 X140.583 Y102.752
G1 X137.417 Y105.918 E.13754
G1 X137.417 Y105.384
G1 X140.583 Y102.219 E.13754
G1 X140.583 Y101.686
G1 X137.417 Y104.851 E.13754
G1 X137.417 Y104.318
G1 X140.583 Y101.153 E.13754
G1 X140.583 Y100.619
G1 X137.417 Y103.785 E.13754
G1 X137.417 Y103.251
G1 X140.583 Y100.086 E.13754
G1 X140.583 Y99.553
G1 X137.417 Y102.718 E.13754
G1 X137.417 Y102.185
G1 X140.583 Y99.02 E.13754
G1 X140.583 Y98.486
G1 X137.417 Y101.651 E.13754
G1 X137.417 Y101.118
G1 X140.583 Y97.953 E.13754
G1 X140.583 Y97.42
G1 X137.417 Y100.585 E.13754
G1 X137.347 Y100.122
G1 X140.583 Y96.886 E.14061
G1 X140.583 Y96.353
G1 X136.813 Y100.122 E.16379
G1 X136.28 Y100.122
G1 X140.445 Y95.957 E.181
G1 X139.912 Y95.957
G1 X135.747 Y100.122 E.181
G1 X135.214 Y100.122
G1 X139.379 Y95.957 E.181
G1 X138.846 Y95.957
G1 X134.68 Y100.122 E.181
G1 X134.147 Y100.122
G1 X138.312 Y95.957 E.181
G1 X137.779 Y95.957
G1 X133.614 Y100.122 E.181
G1 X133.081 Y100.122
G1 X137.246 Y95.957 E.181
G1 X136.713 Y95.957
G1 X132.547 Y100.122 E.181
G1 X132.014 Y100.122
G1 X136.179 Y95.957 E.181
G1 X135.646 Y95.957
G1 X131.481 Y100.122 E.181
G1 X130.948 Y100.122
G1 X135.113 Y95.957 E.181
G1 X134.579 Y95.957
G1 X130.414 Y100.122 E.181
G1 X129.881 Y100.122
G1 X134.046 Y95.957 E.181
G1 X133.513 Y95.957
G1 X129.348 Y100.122 E.181
G1 X128.814 Y100.122
G1 X132.98 Y95.957 E.181
G1 X132.446 Y95.957
G1 X128.281 Y100.122 E.181
G1 X127.748 Y100.122
G1 X131.913 Y95.957 E.181
G1 X131.38 Y95.957
G1 X127.215 Y100.122 E.181
G1 X126.681 Y100.122
G1 X130.847 Y95.957 E.181
G1 X130.313 Y95.957
G1 X126.148 Y100.122 E.181
G1 X125.615 Y100.122
G1 X129.78 Y95.957 E.181
G1 X129.247 Y95.957
G1 X125.082 Y100.122 E.181
G1 X124.548 Y100.122
G1 X128.713 Y95.957 E.181
G1 X128.18 Y95.957
G1 X124.015 Y100.122 E.181
G1 X123.482 Y100.122
G1 X127.647 Y95.957 E.181
G1 X127.114 Y95.957
G1 X122.948 Y100.122 E.181
M204 S10000
; WIPE_START
G1 F24000
G1 X124.363 Y98.708 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I-1.206 J-.161 P1  F30000
G1 X122.561 Y112.241 Z18
G1 Z17.6
G1 E.8 F1800
M204 S2000
G1 F5614
G1 X121.196 Y113.607 E.05935
G1 X120.682 Y113.588
G1 X122.583 Y111.687 E.0826
G1 X122.583 Y111.154
G1 X120.288 Y113.448 E.0997
G1 X119.969 Y113.234
G1 X122.583 Y110.62 E.11359
G1 X122.583 Y110.087
G1 X119.717 Y112.953 E.12453
G1 X119.531 Y112.606
G1 X122.583 Y109.554 E.13262
G1 X122.583 Y109.02
G1 X119.427 Y112.176 E.13712
G1 X119.42 Y111.65
G1 X122.583 Y108.487 E.13744
G1 X122.583 Y107.954
G1 X119.42 Y111.117 E.13745
G1 X119.42 Y110.584
G1 X122.583 Y107.421 E.13745
G1 X122.583 Y106.887
G1 X119.419 Y110.05 E.13745
G1 X119.419 Y109.517
G1 X122.583 Y106.354 E.13746
G1 X122.583 Y105.821
G1 X119.419 Y108.984 E.13746
G1 X119.419 Y108.451
G1 X122.583 Y105.288 E.13746
G1 X122.583 Y104.754
G1 X119.419 Y107.918 E.13747
G1 X119.419 Y107.385
G1 X122.583 Y104.221 E.13747
G1 X122.583 Y103.688
G1 X119.419 Y106.851 E.13747
G1 X119.419 Y106.318
G1 X122.583 Y103.154 E.13748
G1 X122.583 Y102.621
G1 X119.419 Y105.785 E.13748
G1 X119.419 Y105.252
G1 X122.583 Y102.088 E.13748
G1 X122.583 Y101.555
G1 X119.419 Y104.719 E.13749
G1 X119.419 Y104.185
G1 X122.583 Y101.021 E.13749
G1 X122.583 Y100.488
G1 X119.419 Y103.652 E.13749
G1 X119.418 Y103.119
G1 X126.58 Y95.957 E.31122
G1 X126.047 Y95.957
G1 X119.418 Y102.586 E.28805
G1 X119.418 Y102.053
G1 X125.514 Y95.957 E.26488
G1 X124.981 Y95.957
G1 X119.418 Y101.519 E.24171
G1 X119.418 Y100.986
G1 X124.447 Y95.957 E.21854
G1 X123.914 Y95.957
G1 X119.418 Y100.453 E.19537
G1 X119.418 Y99.92
G1 X123.381 Y95.957 E.1722
G1 X122.848 Y95.957
G1 X119.418 Y99.387 E.14903
G1 X119.418 Y98.853
G1 X122.314 Y95.957 E.12586
G1 X121.781 Y95.957
G1 X119.418 Y98.32 E.10269
G1 X119.418 Y97.787
G1 X121.248 Y95.957 E.07952
G1 X120.714 Y95.957
G1 X119.418 Y97.254 E.05635
G1 X119.418 Y96.721
G1 X120.181 Y95.957 E.03318
M204 S10000
; WIPE_START
G1 F24000
G1 X119.418 Y96.721 E-.41036
G1 X119.418 Y97.254 E-.20261
G1 X119.691 Y96.98 E-.14702
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I-1.215 J.071 P1  F30000
G1 X120.657 Y113.586 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881693
G1 F5614
G1 X120.501 Y113.502 E.00065
; WIPE_START
G1 F24000
G1 X120.657 Y113.586 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I.041 J1.216 P1  F30000
G1 X140.314 Y112.916 Z18
G1 Z17.6
G1 E.8 F1800
; LINE_WIDTH: 0.106025
G1 F5614
G3 X139.883 Y113.348 I-2.683 J-2.242 E.00314
; WIPE_START
G1 F24000
G1 X140.11 Y113.142 E-.3807
G1 X140.314 Y112.916 E-.3793
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I.019 J-1.217 P1  F30000
G1 X122.464 Y112.631 Z18
G1 Z17.6
G1 E.8 F1800
; LINE_WIDTH: 0.0881694
G1 F5614
G1 X122.415 Y112.702 E.00032
; LINE_WIDTH: 0.115588
G1 X122.366 Y112.774 E.00051
; LINE_WIDTH: 0.143006
G1 X122.276 Y112.889 E.00119
; LINE_WIDTH: 0.194913
G3 X121.852 Y113.314 I-2.732 J-2.304 E.00744
; LINE_WIDTH: 0.179725
G1 X121.721 Y113.413 E.00183
; LINE_WIDTH: 0.148213
G1 X121.59 Y113.513 E.00141
; WIPE_START
G1 F24000
G1 X121.721 Y113.413 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I.721 J.98 P1  F30000
G1 X132.111 Y105.773 Z18
G1 Z17.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5614
G3 X132.29 Y106.047 I-.113 J.27 E.0107
G1 X132.29 Y108.83 E.08549
G1 X127.71 Y108.83 E.14073
G1 X127.711 Y106.031 E.08601
G3 X128.01 Y105.75 I.298 J.018 E.01392
G1 X132.012 Y105.75 E.12295
G3 X132.053 Y105.755 I-.015 J.293 E.00128
M204 S10000
; WIPE_START
G1 F24000
G1 X132.222 Y105.854 E-.07444
G1 X132.271 Y105.94 E-.03758
G1 X132.29 Y106.047 E-.04149
G1 X132.29 Y107.643 E-.60648
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I-1.085 J-.551 P1  F30000
G1 X132.082 Y108.054 Z18
G1 Z17.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F5614
G1 X131.513 Y108.622 E.02471
G1 X130.98 Y108.622
G1 X132.081 Y107.521 E.04785
G1 X132.08 Y106.989
G1 X130.447 Y108.622 E.07099
G1 X129.913 Y108.622
G1 X132.08 Y106.456 E.09414
G1 X132.033 Y105.969
G1 X129.38 Y108.622 E.1153
G1 X128.847 Y108.622
G1 X131.511 Y105.958 E.11579
G1 X130.978 Y105.957
G1 X128.313 Y108.622 E.1158
G1 X127.918 Y108.485
G1 X130.445 Y105.957 E.10984
G1 X129.912 Y105.957
G1 X127.918 Y107.952 E.08666
G1 X127.918 Y107.418
G1 X129.379 Y105.957 E.06349
G1 X128.846 Y105.957
G1 X127.918 Y106.885 E.04031
G1 X127.918 Y106.351
G1 X128.312 Y105.957 E.01714
M204 S10000
G1 X128.027 Y105.954 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.101902
G1 F5614
G2 X127.914 Y106.066 I.064 J.178 E.00079
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X127.972 Y105.982 E-.47601
G1 X128.027 Y105.954 E-.28399
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
G1 Z18.1 F900 ; lower z a little
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

    G1 Z117.6 F600
    G1 Z115.6

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

