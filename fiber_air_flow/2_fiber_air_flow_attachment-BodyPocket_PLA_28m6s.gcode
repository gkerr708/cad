; HEADER_BLOCK_START
; BambuStudio 01.07.07.89
; model printing time: 22m 20s; total estimated time: 28m 6s
; total layer number: 162
; model label id: 66
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0
; additional_cooling_fan_speed = 70
; auxiliary_fan = 0
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 0x0,18x0,18x28,0x28
; before_layer_change_gcode = 
; best_object_pos = 0.5,0.5
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
; chamber_temperatures = 0
; change_filament_gcode = M620 S[next_extruder]A\nM204 S9000\n{if toolchange_count > 1 && (z_hop_types[current_extruder] == 0 || z_hop_types[current_extruder] == 3)}\nG17\nG2 Z{z_after_toolchange + 0.4} I0.86 J0.86 P1 F10000 ; spiral lift a little from second lift\n{endif}\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\n\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F[old_filament_e_feedrate] T{nozzle_temperature_range_high[previous_extruder]}\nT[next_extruder]\nM620.1 E F[new_filament_e_feedrate] T{nozzle_temperature_range_high[next_extruder]}\n\n{if next_extruder < 255}\nM400\n\nG92 E0\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM109 S[nozzle_temperature_range_high]\n{if flush_length_1 > 23.7}\nG1 E23.7 F{old_filament_e_feedrate} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{old_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\n{else}\nG1 E{flush_length_1} F{old_filament_e_feedrate}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{new_filament_e_feedrate} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\nG1 X80 F15000\nG1 X60 F15000\nG1 X80 F15000\nG1 X60 F15000; shake to put down garbage\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A
; close_fan_the_first_x_layers = 1
; complete_print_exhaust_fan_speed = 70
; cool_plate_temp = 35
; cool_plate_temp_initial_layer = 35
; curr_bed_type = Textured PEI Plate
; default_acceleration = 10000
; default_filament_colour = ""
; default_filament_profile = "Bambu PLA Basic @BBL X1"
; default_jerk = 0
; default_print_profile = 0.20mm Standard @BBL P1P
; deretraction_speed = 30
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; different_settings_to_system = enable_support;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70
; elefant_foot_compensation = 0.15
; enable_arc_fitting = 1
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_pressure_advance = 0
; enable_prime_tower = 0
; enable_support = 1
; enforce_support_layers = 0
; eng_plate_temp = 0
; eng_plate_temp_initial_layer = 0
; ensure_vertical_shell_thickness = 1
; exclude_object = 1
; extruder_clearance_height_to_lid = 90
; extruder_clearance_height_to_rod = 36
; extruder_clearance_max_radius = 68
; extruder_clearance_radius = 57
; extruder_colour = #018001
; extruder_offset = 0x2
; extruder_type = DirectDrive
; fan_cooling_layer_time = 80
; fan_max_speed = 100
; fan_min_speed = 50
; filament_colour = #00AE42
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
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PLA
; filament_vendor = "Bambu Lab"
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
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
; infill_jerk = 9
; infill_wall_overlap = 15%
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 300
; interface_shells = 0
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 250
; ironing_flow = 10%
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\nM622.1 S1 ; for prev firware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n{if timelapse_type == 0} ; timelapse without wipe tower\nM971 S11 C10 O0\n{elsif timelapse_type == 1} ; timelapse with wipe tower\nG92 E0\nG1 E-[retraction_length] F1800\nG17\nG2 Z{layer_z + 0.4} I0.86 J0.86 P1 F20000 ; spiral lift a little\nG1 X65 Y245 F20000 ; move to safe pos\nG17\nG2 Z{layer_z} I0.86 J0.86 P1 F20000\nG1 Y265 F3000\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 E[retraction_length] F300\nG1 X100 F5000\nG1 Y255 F20000\n{endif}\nM623\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.2
; line_width = 0.42
; machine_end_gcode = ;===== date: 20230428 =====================\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X65 Y245 F12000 ; move to safe pos \nG1 Y265 F3000\n\nG1 X65 Y245 F12000\nG1 Y265 F3000\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\nG1 X100 F12000 ; wipe\n; pull back filament to AMS\nM620 S255\nG1 X20 Y50 F12000\nG1 Y-3\nT255\nG1 X65 F12000\nG1 Y265\nG1 X100 F12000 ; wipe\nM621 S255\nM104 S0 ; turn off hotend\n\nM622.1 S1 ; for prev firware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S3 ;wait for last picture to be taken\nM623; end of "timelapse_record_flag"\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 250}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z250 F600\n    G1 Z248\n{endif}\nM400 P100\nM17 R ; restore z current\n\nG90\nG1 X128 Y250 F3600\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\n
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
; machine_start_gcode = ;===== machine: P1P ========================\n;===== date: 20230707 =====================\n;===== turn on the HB fan =================\nM104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle\n;===== reset machine status =================\nG91\nM17 Z0.4 ; lower the z-motor current\nG380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed\nG380 S2 Z-25 F300 ;\nG1 Z5 F300;\nG90\nM17 X1.2 Y1.2 Z0.75 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 5\nM221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\nG29.1 Z{+0.0} ; clear z-trim value first\nM204 S10000 ; init ACC set to 10m/s^2\n\n;===== heatbed preheat ====================\nM1002 gcode_claim_action : 2\nM140 S[bed_temperature_initial_layer_single] ;set bed temp\nM190 S[bed_temperature_initial_layer_single] ;wait for bed temp\n\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {elsif (bed_temperature[initial_extruder] >50)||(bed_temperature_initial_layer[initial_extruder] >50)}\n    M106 P3 S255\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n;===== prepare print temperature and material ==========\nM104 S[nozzle_temperature_initial_layer] ;set extruder temp\nG91\nG0 Z10 F1200\nG90\nG28 X\nM975 S1 ; turn on\nG1 X60 F12000\nG1 Y245\nG1 Y265 F3000\nM620 M\nM620 S[initial_extruder]A   ; switch material if AMS exist\n    M109 S[nozzle_temperature_initial_layer]\n    G1 X120 F12000\n\n    G1 X20 Y50 F12000\n    G1 Y-3\n    T[initial_extruder]\n    G1 X54 F12000\n    G1 Y265\n    M400\nM621 S[initial_extruder]A\nM620.1 E F{filament_max_volumetric_speed[initial_extruder]/2.4053*60} T{nozzle_temperature_range_high[initial_extruder]}\n\n\nM412 S1 ; ===turn on filament runout detection===\n\nM109 S250 ;set nozzle to common flush temp\nM106 P1 S0\nG92 E0\nG1 E50 F200\nM400\nM104 S[nozzle_temperature_initial_layer]\nG92 E0\nG1 E50 F200\nM400\nM106 P1 S255\nG92 E0\nG1 E5 F300\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20} ; drop nozzle temp, make filament shink a bit\nG92 E0\nG1 E-0.5 F300\n\nG1 X70 F9000\nG1 X76 F15000\nG1 X65 F15000\nG1 X76 F15000\nG1 X65 F15000; shake to put down garbage\nG1 X80 F6000\nG1 X95 F15000\nG1 X80 F15000\nG1 X165 F15000; wipe and shake\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\nM106 S255\nG1 X65 Y230 F18000\nG1 Y264 F6000\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20}\nG1 X100 F18000 ; first wipe mouth\n\nG0 X135 Y253 F20000  ; move to exposed steel surface edge\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nG0 Z5 F20000\n\nG1 X60 Y265\nG92 E0\nG1 E-0.5 F300 ; retrack more\nG1 X100 F5000; second wipe mouth\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X90 F5000\nG0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle\nM104 S140 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM221 S; push soft endstop status\nM221 Z0 ;turn off Z axis endstop\nG0 Z0.5 F20000\nG0 X125 Y259.5 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 X128\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\n\nM109 S140 ; wait nozzle temp down to heatbed acceptable\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\n\nM221 R; pop softend status\nG1 Z10 F1200\nM400\nG1 Z10\nG1 F30000\nG1 X230 Y15\nG29.2 S1 ; turn on ABL\n;G28 ; home again after hard wipe mouth\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\nM622 J1\n\n    M1002 gcode_claim_action : 1\n    G29 A X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\n\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {elsif (bed_temperature[initial_extruder] >50)||(bed_temperature_initial_layer[initial_extruder] >50)}\n    M106 P3 S255\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; set extrude temp earlier, to reduce wait time\n\n;===== mech mode fast check============================\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q1 A7 B30 C80  H15 K0\nM974 Q1 S2 P0\n\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q0 A7 B30 C90 Q0 H15 K0\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X230 Y15\nG28 X ; re-home XY\n;===== fmech mode fast check============================\n\n\n;===== noozle load line ===============================\nM975 S1\nG90\nM83\nT1000\nG1 X18.0 Y1.0 Z0.8 F18000;Move to start position\nM109 S{nozzle_temperature_initial_layer[initial_extruder]}\nG1 Z0.2\nG0 E2 F300\nG0 X240 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 Y11 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\nG0 X239.5\nG0 E0.2\nG0 Y1.5 E0.700\nG0 X18 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.04} ; for Textured PEI Plate\n{endif}\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression
; machine_unload_filament_time = 28
; max_bridge_length = 10
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; nozzle_diameter = 0.4
; nozzle_temperature = 220
; nozzle_temperature_initial_layer = 220
; nozzle_temperature_range_high = 240
; nozzle_temperature_range_low = 190
; nozzle_type = stainless_steel
; nozzle_volume = 107
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100
; overhang_fan_threshold = 50%
; post_process = 
; pressure_advance = 0.02
; prime_tower_brim_width = 3
; prime_tower_width = 35
; prime_volume = 45
; print_compatible_printers = "Bambu Lab P1P 0.4 nozzle"
; print_flow_ratio = 1
; print_host = 
; print_host_webui = 
; print_sequence = by layer
; print_settings_id = 0.20mm Standard @BBL P1P
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 250
; printer_model = Bambu Lab P1P
; printer_settings_id = Bambu Lab P1P 0.4 nozzle
; printer_structure = corexy
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
; retract_lift_above = 0
; retract_lift_below = 249
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; scan_first_layer = 0
; seam_gap = 15%
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
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 15%
; sparse_infill_filament = 1
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 270
; spiral_mode = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
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
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = normal(auto)
; temperature_vitrification = 45
; template_custom_gcode = 
; textured_plate_temp = 65
; textured_plate_temp_initial_layer = 65
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = 
; timelapse_type = 0
; top_one_wall_type = all top
; top_shell_layers = 3
; top_shell_thickness = 0.6
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; travel_jerk = 9
; travel_speed = 500
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_distance = 5
; tree_support_brim_width = 0
; tree_support_wall_count = 1
; upward_compatible_machine = "Bambu Lab P1S 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle"
; use_relative_e_distances = 1
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
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 155
; wipe_tower_y = 220
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R28
M201 X20000 Y20000 Z500 E5000
M203 X500 Y500 Z20 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z3.00 E2.50
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: P1P ========================
;===== date: 20230707 =====================
;===== turn on the HB fan =================
M104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle
;===== reset machine status =================
G91
M17 Z0.4 ; lower the z-motor current
G380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed
G380 S2 Z-25 F300 ;
G1 Z5 F300;
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
M204 S10000 ; init ACC set to 10m/s^2

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
M73 P15 R23
G1 X60 F12000
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
M73 P16 R23
G1 E-0.5 F300

M73 P17 R23
G1 X70 F9000
G1 X76 F15000
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
M73 P18 R23
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000

M221 R; pop softend status
G1 Z10 F1200
M400
G1 Z10
M73 P18 R22
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
    G29 A X108.57 Y114.504 I38.8591 J26.9916
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
M83 ; use relative distances for extrusion
; filament start gcode
M106 P3 S200


M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
M204 S500
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G1 X114.987 Y121.259 F30000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.5
G1 F3000
G2 X115.016 Y130.816 I13.069 J4.738 E.36336
G1 X108.799 Y130.816 E.23156
G1 X108.799 Y121.184 E.35872
G1 X115.012 Y121.195 E.2314
; WIPE_START
G1 F24000
M73 P19 R22
G1 X113.012 Y121.192 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X114.181 Y128.734 Z.6 F30000
G1 X114.439 Y130.404 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X109.21 Y130.404 E.19476
G1 X109.21 Y121.596 E.32808
G1 X114.439 Y121.596 E.19476
G1 X114.375 Y121.787 E.00752
G2 X114.439 Y130.404 I13.681 J4.207 E.32601
G1 X113.745 Y129.896 F30000
G1 F3000
G1 X109.718 Y129.896 E.14996
G1 X109.718 Y122.104 E.29024
G1 X113.745 Y122.104 E.14996
G2 X113.745 Y129.896 I14.517 J3.896 E.2936
G1 X113.108 Y129.388 F30000
G1 F3000
G1 X110.226 Y129.388 E.10733
G1 X110.226 Y122.612 E.25241
G1 X113.108 Y122.612 E.10733
G2 X113.108 Y129.388 I14.726 J3.388 E.25458
G1 X112.484 Y128.881 F30000
M73 P20 R22
G1 F3000
G1 X110.734 Y128.881 E.06517
G1 X110.734 Y123.119 E.21458
G1 X112.484 Y123.119 E.06517
G2 X112.484 Y128.881 I15.307 J2.881 E.21582
G1 X111.881 Y128.373 F30000
G1 F3000
G1 X111.242 Y128.373 E.02381
G1 X111.242 Y123.627 E.17675
G1 X111.881 Y123.627 E.02381
G2 X111.881 Y128.373 I16.079 J2.373 E.17738
; WIPE_START
G1 F24000
G1 X111.733 Y126.378 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.306 Y127.326 Z.6 F30000
G1 X147.201 Y130.816 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X140.984 Y130.816 E.23156
G1 X141.013 Y130.741 E.00298
G2 X140.984 Y121.184 I-13.069 J-4.738 E.36336
G1 X147.201 Y121.184 E.23156
G1 X147.201 Y130.747 E.35617
G1 X141.561 Y121.596 F30000
G1 F3000
G1 X146.79 Y121.596 E.19476
G1 X146.79 Y130.404 E.32808
G1 X141.561 Y130.404 E.19476
G1 X141.625 Y130.213 E.00752
G2 X141.561 Y121.596 I-13.681 J-4.207 E.32601
G1 X142.255 Y122.104 F30000
G1 F3000
G1 X146.282 Y122.104 E.14996
G1 X146.282 Y129.896 E.29024
G1 X142.255 Y129.896 E.14996
G2 X142.255 Y122.104 I-14.517 J-3.896 E.2936
G1 X142.892 Y122.612 F30000
G1 F3000
G1 X145.774 Y122.612 E.10733
G1 X145.774 Y129.388 E.25241
G1 X142.892 Y129.388 E.10733
G2 X142.892 Y122.612 I-14.726 J-3.388 E.25458
G1 X143.516 Y123.119 F30000
G1 F3000
G1 X145.266 Y123.119 E.06517
G1 X145.266 Y128.881 E.21458
G1 X143.516 Y128.881 E.06517
G2 X143.516 Y123.119 I-15.305 J-2.881 E.21582
G1 X144.119 Y123.627 F30000
G1 F3000
G1 X144.758 Y123.627 E.02381
G1 X144.758 Y128.373 E.17675
G1 X144.119 Y128.373 E.02381
G2 X144.119 Y123.627 I-16.078 J-2.373 E.17738
; WIPE_START
G1 F24000
G1 X144.263 Y125.622 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.362 Y120.782 Z.6 F30000
G1 X130.628 Y114.438 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X130.639 Y114.44 E.0004
G3 X127.704 Y114.146 I-2.638 J11.559 E2.6645
G1 X128.296 Y114.146 E.02202
G3 X130.059 Y114.323 I-.296 J11.852 E.06607
G1 X130.569 Y114.426 E.01938
G1 X130.541 Y114.887 F30000
; FEATURE: Outer wall
G1 F3000
G1 X131.088 Y115.026 E.02102
G3 X127.716 Y114.603 I-3.088 J10.973 E2.54069
G1 X128.284 Y114.603 E.02117
G3 X130.482 Y114.873 I-.284 J11.396 E.08261
; WIPE_START
G1 F24000
G1 X131.088 Y115.026 E-.23727
G1 X131.631 Y115.194 E-.21599
G1 X132.165 Y115.388 E-.21601
G1 X132.385 Y115.481 E-.09074
; WIPE_END
G1 E-.04 F1800
G1 X136.989 Y121.568 Z.6 F30000
G1 X140.633 Y126.387 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X140.616 Y126.622 E.00879
M73 P21 R22
G3 X122.8 Y114.476 I-12.626 J-.62 E1.99638
G3 X128.001 Y113.361 I5.208 J11.606 E.19958
G3 X140.632 Y126 I-.01 J12.641 E.73911
G1 X140.633 Y126.327 E.01216
G1 X141.09 Y126.398 F30000
; FEATURE: Outer wall
G1 F3000
G1 X141.073 Y126.645 E.00921
G3 X122.612 Y114.059 I-13.082 J-.642 E2.06857
G3 X128.001 Y112.904 I5.396 J12.026 E.2068
G3 X141.088 Y126 I-.011 J13.098 E.76583
G1 X141.09 Y126.338 E.01258
G1 X140.242 Y126.317 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370905
G1 F3000
G1 X140.235 Y126.607 E.00775
G1 X140.188 Y127.226 E.0166
G1 X140.113 Y127.825 E.01615
G1 X140.007 Y128.429 E.01639
G1 X139.871 Y129.023 E.01627
G1 X139.706 Y129.611 E.01633
G1 X139.511 Y130.19 E.01632
G1 X139.288 Y130.758 E.01633
G1 X139.037 Y131.315 E.01632
G1 X138.758 Y131.859 E.01632
G1 X138.453 Y132.388 E.01632
G1 X138.121 Y132.901 E.01633
G1 X137.765 Y133.397 E.01632
G1 X137.384 Y133.874 E.01633
G1 X136.98 Y134.332 E.01632
G1 X136.553 Y134.769 E.01632
G1 X136.106 Y135.185 E.01633
G1 X135.638 Y135.577 E.01633
G1 X135.151 Y135.946 E.01632
G1 X134.646 Y136.29 E.01632
G1 X134.125 Y136.609 E.01633
G1 X133.589 Y136.901 E.01632
G1 X133.038 Y137.166 E.01632
G1 X132.475 Y137.403 E.01632
G1 X131.901 Y137.612 E.01633
G1 X131.318 Y137.792 E.01632
G1 X130.726 Y137.943 E.01632
G1 X130.127 Y138.064 E.01632
G1 X129.523 Y138.155 E.01633
G1 X128.915 Y138.216 E.01632
G1 X128.305 Y138.246 E.01632
G1 X127.699 Y138.246 E.01621
G1 X127.085 Y138.216 E.01643
G1 X126.477 Y138.155 E.01632
G1 X125.873 Y138.064 E.01633
G1 X125.274 Y137.943 E.01632
G1 X124.682 Y137.792 E.01633
G1 X124.099 Y137.612 E.01632
G1 X123.525 Y137.403 E.01633
G1 X122.966 Y137.168 E.01621
G1 X122.411 Y136.901 E.01643
G1 X121.875 Y136.609 E.01633
G1 X121.354 Y136.29 E.01632
G1 X120.853 Y135.949 E.01622
G1 X120.359 Y135.575 E.01654
G1 X119.894 Y135.185 E.01621
G1 X119.444 Y134.766 E.01643
G1 X119.02 Y134.332 E.01621
G1 X118.616 Y133.874 E.01632
G1 X118.235 Y133.397 E.01633
G1 X117.879 Y132.901 E.01632
G1 X117.547 Y132.388 E.01632
G1 X117.242 Y131.859 E.01633
G1 X116.963 Y131.315 E.01632
G1 X116.712 Y130.758 E.01632
G1 X116.489 Y130.19 E.01632
G1 X116.294 Y129.611 E.01632
G1 X116.129 Y129.023 E.01632
G1 X115.993 Y128.427 E.01633
G1 X115.887 Y127.826 E.01633
G1 X115.811 Y127.22 E.0163
G1 X115.765 Y126.611 E.01633
G1 X115.75 Y125.996 E.01645
G1 X115.765 Y125.393 E.01611
G1 X115.812 Y124.774 E.0166
G1 X115.887 Y124.175 E.01615
G1 X115.993 Y123.573 E.01634
G1 X116.129 Y122.977 E.01633
G1 X116.294 Y122.389 E.01632
G1 X116.489 Y121.81 E.01632
G1 X116.712 Y121.242 E.01632
G1 X116.963 Y120.685 E.01632
G1 X117.242 Y120.141 E.01632
G1 X117.547 Y119.612 E.01633
G1 X117.879 Y119.099 E.01632
G1 X118.235 Y118.603 E.01632
G1 X118.616 Y118.126 E.01632
G1 X119.02 Y117.668 E.01632
G1 X119.447 Y117.231 E.01632
G1 X119.894 Y116.815 E.01633
G1 X120.362 Y116.423 E.01633
G1 X120.849 Y116.054 E.01632
G1 X121.354 Y115.71 E.01633
G1 X121.875 Y115.391 E.01632
G1 X122.411 Y115.099 E.01632
G1 X122.962 Y114.834 E.01633
G1 X123.525 Y114.597 E.01632
G1 X124.099 Y114.388 E.01633
G1 X124.682 Y114.208 E.01632
G1 X125.274 Y114.057 E.01632
G1 X125.873 Y113.936 E.01632
G1 X126.477 Y113.845 E.01633
G1 X127.085 Y113.784 E.01632
G1 X127.695 Y113.754 E.01632
G1 X128.301 Y113.754 E.01622
G1 X128.919 Y113.785 E.01654
G1 X129.523 Y113.845 E.01622
G1 X130.131 Y113.937 E.01643
G1 X130.726 Y114.057 E.01622
G1 X131.318 Y114.208 E.01633
G1 X131.901 Y114.388 E.01632
G1 X132.479 Y114.598 E.01643
G1 X133.038 Y114.834 E.01621
G1 X133.589 Y115.099 E.01633
G1 X134.125 Y115.391 E.01632
G1 X134.646 Y115.71 E.01632
G1 X135.151 Y116.054 E.01632
G1 X135.638 Y116.423 E.01633
G1 X136.106 Y116.815 E.01632
G1 X136.556 Y117.234 E.01644
G1 X136.98 Y117.668 E.01621
G1 X137.384 Y118.126 E.01632
G1 X137.765 Y118.603 E.01633
G1 X138.121 Y119.099 E.01632
G1 X138.453 Y119.612 E.01632
G1 X138.758 Y120.141 E.01633
G1 X139.037 Y120.685 E.01632
G1 X139.288 Y121.242 E.01632
G1 X139.511 Y121.81 E.01632
G1 X139.706 Y122.389 E.01632
G1 X139.871 Y122.977 E.01632
G1 X140.007 Y123.573 E.01633
G1 X140.113 Y124.174 E.01633
G1 X140.189 Y124.78 E.01631
G1 X140.235 Y125.389 E.01633
G1 X140.25 Y126 E.01633
G1 X140.244 Y126.257 E.00686
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X140.235 Y126.607 E-.13297
G1 X140.188 Y127.226 E-.23602
G1 X140.113 Y127.825 E-.22958
G1 X140.039 Y128.244 E-.16142
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 2/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S252.45
M106 P2 S178
; open powerlost recovery
M1003 S1
M204 S10000
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z.6 I.998 J-.696 P1  F30000
G1 X130.591 Y114.691 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3535
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3535
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.095 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.10001
; WIPE_END
G1 E-.04 F1800
G1 X137.112 Y121.623 Z.8 F30000
G1 X140.89 Y126.336 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3535
G1 X140.878 Y126.619 E.0094
G3 X127.678 Y113.106 I-12.881 J-.621 E1.98466
G1 X128.328 Y113.107 E.02156
G3 X140.893 Y126 I-.331 J12.891 E.66102
G1 X140.89 Y126.276 E.00915
G1 X141.281 Y126.345 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3535
G1 X141.269 Y126.638 E.00901
G3 X127.669 Y112.714 I-13.272 J-.64 E1.89429
G1 X128.338 Y112.715 E.02057
G3 X141.285 Y126 I-.341 J13.283 E.63093
G1 X141.282 Y126.285 E.00877
M204 S10000
G1 X140.455 Y126.638 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.486909
G1 F3535
G1 X140.472 Y126.016 E.0225
G2 X140.407 Y127.266 I-12.47 J-.017 E2.78931
G1 X140.45 Y126.698 E.02061
G1 X140.014 Y126.582 F30000
; LINE_WIDTH: 0.486912
G1 F3535
G3 X140.028 Y125.994 I-12.012 J-.586 E2.71266
G1 X140.015 Y126.522 E.01908
; CHANGE_LAYER
; Z_HEIGHT: 0.476923
; LAYER_HEIGHT: 0.0769231
; WIPE_START
G1 F24000
G1 X140.028 Y125.994 E-.2004
G1 X140.013 Y125.401 E-.2257
G1 X139.968 Y124.797 E-.23001
G1 X139.933 Y124.526 E-.1039
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 3/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z.8 I.747 J.961 P1  F30000
G1 X141.739 Y123.123 Z.8
G1 Z.477
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276923
G1 F3867
G1 X145.262 Y123.123 E.14336
G1 X145.262 Y126 E.11705
G1 X142.039 Y126 E.13116
G3 X141.767 Y128.745 I-15.148 J-.114 E.11237
G1 X141.739 Y128.877 E.0055
M73 P21 R21
G1 X145.262 Y128.877 E.14336
; WIPE_START
G1 F24000
G1 X143.262 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.63 Y128.877 Z.877 F30000
G1 X114.261 Y128.877 Z.877
G1 Z.477
G1 E.8 F1800
G1 F3867
G1 X110.738 Y128.877 E.14336
G1 X110.738 Y126 E.11705
G1 X113.961 Y126 E.13116
G1 X113.964 Y125.887 E.00461
G3 X114.261 Y123.123 I13.676 J.073 E.11329
G1 X110.738 Y123.123 E.14336
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.123077
; WIPE_START
G1 F24000
G1 X112.738 Y123.123 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 4/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z.877 I.52 J1.1 P1  F30000
G1 X130.591 Y114.691 Z.877
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F3867
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3867
M73 P22 R21
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.23519
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.21241
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.129 Y121.609 Z1 F30000
G1 X140.891 Y126.275 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3867
G1 X140.876 Y126.603 E.01088
G3 X127.678 Y113.106 I-12.881 J-.605 E1.98525
G1 X128.333 Y113.107 E.0217
G3 X140.89 Y126 I-.338 J12.891 E.66081
G1 X140.891 Y126.215 E.00714
G1 X141.283 Y126.285 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3867
G1 X141.268 Y126.622 E.01038
G3 X127.669 Y112.714 I-13.273 J-.624 E1.89484
G1 X128.342 Y112.715 E.02071
G3 X141.282 Y126 I-.348 J13.283 E.63073
G1 X141.283 Y126.225 E.00691
M204 S10000
G1 X140.454 Y126.638 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.486905
G1 F3867
G1 X140.472 Y126.016 E.0225
G2 X140.406 Y127.279 I-12.469 J-.018 E2.78876
G1 X140.45 Y126.698 E.02107
G1 X140.014 Y126.566 F30000
; LINE_WIDTH: 0.486911
G1 F3867
G3 X140.013 Y125.405 I-12.012 J-.57 E2.69171
G3 X140.015 Y126.506 I-11.135 J.576 E.03987
; CHANGE_LAYER
; Z_HEIGHT: 0.753846
; LAYER_HEIGHT: 0.153846
; WIPE_START
G1 F24000
G1 X140.028 Y125.994 E-.19449
G1 X140.013 Y125.405 E-.22423
G1 X139.968 Y124.797 E-.23142
G1 X139.931 Y124.51 E-.10986
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 5/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z1 I.741 J.965 P1  F30000
G1 X141.739 Y123.123 Z1
G1 Z.754
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276923
G1 F3361
G1 X145.262 Y123.123 E.14336
G1 X145.262 Y126 E.11705
G1 X142.039 Y126 E.13116
G3 X141.759 Y128.788 I-15.069 J-.103 E.11416
G1 X141.739 Y128.877 E.00371
G1 X145.262 Y128.877 E.14336
; WIPE_START
G1 F24000
G1 X143.262 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.63 Y128.877 Z1.154 F30000
G1 X114.261 Y128.877 Z1.154
G1 Z.754
G1 E.8 F1800
G1 F3361
G1 X110.738 Y128.877 E.14336
G1 X110.738 Y126 E.11705
G1 X113.961 Y126 E.13116
G1 X113.983 Y125.24 E.03093
G2 X114.034 Y124.578 I-87.009 J-7.094 E.02702
G1 X114.036 Y124.559 E.00078
G3 X114.261 Y123.123 I17.012 J1.934 E.05914
G1 X110.738 Y123.123 E.14336
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.0461538
; WIPE_START
G1 F24000
G1 X112.738 Y123.123 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 6/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z1.154 I.52 J1.1 P1  F30000
G1 X130.572 Y114.687 Z1.154
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F3361
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3361
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.21239
G1 X132.095 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.10001
; WIPE_END
G1 E-.04 F1800
G1 X137.147 Y121.594 Z1.2 F30000
G1 X140.893 Y126.212 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3361
G1 X140.875 Y126.595 E.01272
G3 X127.678 Y113.106 I-12.882 J-.597 E1.98558
G1 X128.337 Y113.107 E.02185
G3 X140.888 Y126 I-.344 J12.891 E.6606
G1 X140.892 Y126.152 E.00503
G1 X141.285 Y126.221 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3361
G1 X141.266 Y126.609 E.01193
G3 X127.669 Y112.714 I-13.274 J-.611 E1.89531
G1 X128.347 Y112.715 E.02084
G3 X141.28 Y126 I-.354 J13.283 E.63053
G1 X141.284 Y126.161 E.00495
M204 S10000
; WIPE_START
G1 F24000
G1 X141.266 Y126.609 E-.17033
G1 X141.219 Y127.367 E-.28843
G1 X141.142 Y127.979 E-.23456
G1 X141.111 Y128.152 E-.06668
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3361
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.65 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.491 J-3.227 E.21642
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3361
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.157 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.84 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3361
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.649 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.494 J3.227 E.21642
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
M73 P23 R21
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.175 J-9.109 E.05401
G1 X122.342 Y137.2 F30000
G1 F3361
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.84 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 7/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z1.2 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3043
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3043
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.23519
G1 X131.57 Y115.374 E-.2124
G1 X132.095 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.10001
; WIPE_END
G1 E-.04 F1800
G1 X137.165 Y121.579 Z1.4 F30000
G1 X140.894 Y126.146 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3043
G1 X140.873 Y126.579 E.01439
G3 X127.678 Y113.106 I-12.883 J-.581 E1.98617
G1 X128.341 Y113.107 E.022
G3 X140.887 Y126 I-.35 J12.891 E.6604
G1 X140.891 Y126.086 E.00284
G1 X141.286 Y126.155 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3043
G1 X141.265 Y126.593 E.01348
G3 X127.669 Y112.714 I-13.274 J-.595 E1.89585
G1 X128.351 Y112.715 E.02098
G3 X141.278 Y126 I-.361 J13.283 E.63033
G1 X141.283 Y126.095 E.00292
M204 S10000
; WIPE_START
G1 F24000
G1 X141.265 Y126.593 E-.18946
G1 X141.219 Y127.372 E-.2965
G1 X141.142 Y127.979 E-.23229
G1 X141.123 Y128.087 E-.04175
; WIPE_END
G1 E-.04 F1800
G1 X138.368 Y120.969 Z1.4 F30000
G1 X137.52 Y118.776 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3043
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.124 Y129.227 I-12.482 J3.227 E.21642
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.493 J-1.796 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3043
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.839 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3043
G2 X119.552 Y134.448 I10.245 J-7.883 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.65 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.485 J-3.227 E.21642
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3043
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.682 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.161 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.523 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.522 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.03077
; LAYER_HEIGHT: 0.0307692
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 8/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z1.4 I-.806 J.912 P1  F30000
G1 X141.739 Y123.123 Z1.4
G1 Z1.031
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276923
G1 F3371
G1 X145.262 Y123.123 E.14336
G1 X145.262 Y126 E.11705
G1 X142.039 Y126 E.13116
G3 X141.766 Y128.75 I-14.173 J-.016 E.1126
G1 X141.739 Y128.877 E.0053
G1 X145.262 Y128.877 E.14336
; WIPE_START
G1 F24000
G1 X143.262 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.63 Y128.877 Z1.431 F30000
G1 X114.261 Y128.877 Z1.431
G1 Z1.031
G1 E.8 F1800
G1 F3371
G1 X110.738 Y128.877 E.14336
G1 X110.738 Y126 E.11705
G1 X113.961 Y126 E.13116
G1 X113.984 Y125.211 E.03209
G2 X114.036 Y124.564 I-234.784 J-18.901 E.02643
G1 X114.037 Y124.548 E.00065
G3 X114.261 Y123.123 I17.048 J1.952 E.0587
G1 X110.738 Y123.123 E.14336
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.169231
; WIPE_START
G1 F24000
G1 X112.738 Y123.123 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 9/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z1.431 I.52 J1.1 P1  F30000
G1 X130.591 Y114.691 Z1.431
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F3371
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3371
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.23519
G1 X131.57 Y115.374 E-.2124
G1 X132.095 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.10001
; WIPE_END
G1 E-.04 F1800
G1 X137.185 Y121.563 Z1.6 F30000
G1 X140.896 Y126.075 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3371
G1 X140.87 Y126.716 E.02129
G3 X127.036 Y113.138 I-12.876 J-.718 E1.96019
G3 X128.346 Y113.107 I.953 J12.656 E.04347
G3 X140.89 Y126.001 I-.351 J12.891 E.66036
G1 X140.891 Y126.015 E.00049
G1 X141.287 Y126.086 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3371
G1 X141.261 Y126.741 E.02013
G3 X127.007 Y112.747 I-13.267 J-.743 E1.87086
G3 X128.356 Y112.715 I.982 J13.037 E.04148
G3 X141.282 Y126 I-.362 J13.283 E.6303
G1 X141.284 Y126.026 E.00081
M204 S10000
; WIPE_START
G1 F24000
G1 X141.261 Y126.741 E-.27158
G1 X141.218 Y127.381 E-.24389
G1 X141.142 Y127.978 E-.22869
G1 X141.135 Y128.019 E-.01584
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z1.6 F30000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3371
G3 X136.448 Y134.448 I-10.434 J-8.049 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.65 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.472 J-3.227 E.21643
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3371
G2 X132.16 Y114.164 I-5.937 J11.887 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.164 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.84 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3371
G3 X119.552 Y117.552 I10.435 J8.05 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
M73 P24 R21
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.476 J3.227 E.21642
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3371
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.84 J-4.523 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.30769
; LAYER_HEIGHT: 0.107692
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 10/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z1.6 I.664 J1.02 P1  F30000
G1 X145.262 Y128.877 Z1.6
G1 Z1.308
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276923
G1 F3383
G1 X141.739 Y128.877 E.14336
G1 X141.759 Y128.788 E.00371
G2 X142.039 Y126 I-14.42 J-2.854 E.11417
G1 X145.262 Y126 E.13116
G1 X145.262 Y123.123 E.11705
G1 X141.739 Y123.123 E.14336
; WIPE_START
G1 F24000
G1 X143.739 Y123.123 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.248 Y124.585 Z1.708 F30000
G1 X114.261 Y128.877 Z1.708
G1 Z1.308
G1 E.8 F1800
G1 F3383
G1 X110.738 Y128.877 E.14336
G1 X110.738 Y126 E.11705
G1 X113.962 Y126 E.13116
G1 X114.04 Y124.522 E.06021
G3 X114.261 Y123.123 I16.94 J1.964 E.05765
G1 X110.738 Y123.123 E.14336
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.0923077
; WIPE_START
G1 F24000
G1 X112.738 Y123.123 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 11/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z1.708 I.52 J1.1 P1  F30000
G1 X130.572 Y114.687 Z1.708
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F3383
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3383
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.23519
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.10001
; WIPE_END
G1 E-.04 F1800
G1 X137.205 Y121.546 Z1.8 F30000
G1 X140.897 Y126.005 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3383
G1 X140.869 Y126.731 E.02412
G3 X127.036 Y113.138 I-12.876 J-.732 E1.95987
G3 X128.35 Y113.108 I.952 J12.622 E.04362
G3 X140.89 Y125.946 I-.357 J12.891 E.65837
G1 X141.289 Y126.016 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3383
G1 X141.26 Y126.756 E.02275
G3 X127.007 Y112.747 I-13.267 J-.757 E1.87055
G3 X128.36 Y112.716 I.98 J13.002 E.04162
G3 X141.282 Y125.956 I-.367 J13.283 E.62879
M204 S10000
; WIPE_START
G1 F24000
G1 X141.26 Y126.756 E-.30381
G1 X141.216 Y127.392 E-.24248
G1 X141.145 Y127.95 E-.21371
; WIPE_END
G1 E-.04 F1800
G1 X138.34 Y120.852 Z1.8 F30000
G1 X137.52 Y118.776 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3383
G2 X136.448 Y117.552 I-10.246 J7.884 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.48 J3.227 E.21642
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.175 J-9.109 E.05401
G1 X133.658 Y137.2 F30000
G1 F3383
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.523 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3383
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.467 J-3.227 E.21643
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3383
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.167 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.523 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.58462
; LAYER_HEIGHT: 0.184615
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 12/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z1.8 I-.806 J.912 P1  F30000
G1 X141.739 Y123.123 Z1.8
G1 Z1.585
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276923
G1 F3371
G1 X145.262 Y123.123 E.14336
G1 X145.262 Y126 E.11705
G1 X142.038 Y126 E.13118
G3 X141.759 Y128.788 I-14.579 J-.051 E.11417
G1 X141.739 Y128.877 E.00371
G1 X145.262 Y128.877 E.14336
; WIPE_START
G1 F24000
G1 X143.262 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.63 Y128.877 Z1.985 F30000
G1 X114.261 Y128.877 Z1.985
G1 Z1.585
G1 E.8 F1800
G1 F3371
G1 X110.738 Y128.877 E.14336
G1 X110.738 Y126 E.11705
G1 X113.962 Y126 E.13116
G1 X114.041 Y124.511 E.06067
G3 X114.261 Y123.123 I10.753 J.994 E.05721
G1 X110.738 Y123.123 E.14336
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.0153847
; WIPE_START
G1 F24000
G1 X112.738 Y123.123 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 13/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z1.985 I.52 J1.1 P1  F30000
G1 X130.572 Y114.687 Z1.985
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F3371
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3371
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.21239
G1 X132.095 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.10001
; WIPE_END
G1 E-.04 F1800
G1 X137.22 Y121.534 Z2 F30000
G1 X140.897 Y125.954 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3371
G1 X140.889 Y125.97 E.00061
G3 X127.036 Y113.138 I-12.896 J.029 E1.98514
G3 X128.354 Y113.108 I.95 J12.591 E.04376
G3 X140.871 Y125.329 I-.362 J12.891 E.63771
G1 X140.895 Y125.894 E.01876
G1 X141.289 Y125.943 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3371
G1 X141.281 Y125.969 E.00083
G3 X127.007 Y112.747 I-13.288 J.03 E1.89477
G3 X128.365 Y112.716 I.979 J12.969 E.04175
G3 X141.263 Y125.308 I-.372 J13.283 E.6087
G1 X141.287 Y125.883 E.01767
M204 S10000
; WIPE_START
G1 F24000
G1 X141.281 Y125.969 E-.03261
G1 X141.267 Y126.771 E-.30486
G1 X141.215 Y127.403 E-.24103
G1 X141.155 Y127.877 E-.1815
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z2 F30000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3371
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.65 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.473 J-3.227 E.21642
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.495 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.173 J9.107 E.05401
G1 X133.658 Y114.8 F30000
G1 F3371
M73 P25 R21
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.684 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.171 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.84 J4.523 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3371
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.457 J3.227 E.21643
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3371
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.84 J-4.523 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 14/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z2 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3043
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3043
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.23519
G1 X131.57 Y115.374 E-.2124
G1 X132.095 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.10001
; WIPE_END
G1 E-.04 F1800
G1 X137.24 Y121.517 Z2.2 F30000
G1 X140.895 Y125.88 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3043
G1 X140.888 Y125.966 E.00286
G3 X127.036 Y113.138 I-12.896 J.033 E1.98531
G3 X128.359 Y113.108 I.948 J12.561 E.04391
G3 X140.87 Y125.325 I-.367 J12.891 E.6374
G1 X140.893 Y125.82 E.01644
G1 X141.287 Y125.869 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3043
G1 X141.28 Y125.964 E.00294
G3 X127.007 Y112.747 I-13.288 J.035 E1.89494
G3 X128.369 Y112.716 I.977 J12.938 E.04189
G3 X141.262 Y125.304 I-.378 J13.283 E.60841
G1 X141.284 Y125.809 E.01553
M204 S10000
; WIPE_START
G1 F24000
G1 X141.28 Y125.964 E-.059
G1 X141.266 Y126.785 E-.31208
G1 X141.214 Y127.414 E-.23959
G1 X141.164 Y127.804 E-.14933
; WIPE_END
G1 E-.04 F1800
G1 X138.307 Y120.726 Z2.2 F30000
G1 X137.52 Y118.776 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3043
G2 X136.448 Y117.552 I-10.246 J7.884 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
M73 P25 R20
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.465 J3.227 E.21643
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3043
G3 X132.16 Y137.836 I-5.937 J-11.887 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.684 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3043
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.65 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.448 J-3.227 E.21643
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3043
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.174 E.21658
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.523 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.439 J12.522 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.86154
; LAYER_HEIGHT: 0.0615385
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 15/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z2.2 I-.806 J.912 P1  F30000
G1 X141.739 Y123.123 Z2.2
G1 Z1.862
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276923
G1 F3371
G1 X145.262 Y123.123 E.14336
G1 X145.262 Y126 E.11705
G1 X142.038 Y126 E.13119
G1 X142.035 Y126.124 E.00504
G3 X141.767 Y128.742 I-13.73 J-.083 E.10724
G1 X141.739 Y128.877 E.00561
G1 X145.262 Y128.877 E.14336
; WIPE_START
G1 F24000
G1 X143.262 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.63 Y128.877 Z2.262 F30000
G1 X114.261 Y128.877 Z2.262
G1 Z1.862
G1 E.8 F1800
G1 F3371
G1 X110.738 Y128.877 E.14336
G1 X110.738 Y126 E.11705
G1 X113.962 Y126 E.13117
G1 X114.118 Y123.911 E.08521
G3 X114.261 Y123.123 I36.891 J6.317 E.03261
G1 X110.738 Y123.123 E.14336
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.138462
; WIPE_START
G1 F24000
G1 X112.738 Y123.123 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 16/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z2.262 I.52 J1.1 P1  F30000
G1 X130.591 Y114.691 Z2.262
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F3371
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3371
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.21241
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.26 Y121.5 Z2.4 F30000
G1 X140.893 Y125.805 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3371
G1 X140.887 Y125.962 E.0052
G3 X127.036 Y113.138 I-12.896 J.037 E1.98545
G3 X128.363 Y113.108 I.947 J12.532 E.04405
G3 X140.869 Y125.321 I-.373 J12.891 E.63709
G1 X140.89 Y125.745 E.0141
G1 X141.285 Y125.794 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3371
G1 X141.278 Y125.96 E.0051
G3 X127.007 Y112.747 I-13.288 J.039 E1.89502
G3 X128.374 Y112.716 I.976 J12.907 E.04203
G3 X141.26 Y125.301 I-.383 J13.282 E.60812
G1 X141.282 Y125.734 E.01335
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y125.96 E-.0858
G1 X141.265 Y126.8 E-.31927
G1 X141.213 Y127.425 E-.23818
G1 X141.174 Y127.73 E-.11675
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3371
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.65 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.457 J-3.227 E.21643
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.495 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3371
M73 P26 R20
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.177 E.21658
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.84 J4.523 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.439 J12.522 E.05401
G1 X118.48 Y118.776 F30000
G1 F3371
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.461 J3.227 E.21643
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3371
G2 X123.84 Y137.836 I5.937 J-11.887 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.84 J-4.523 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.13846
; LAYER_HEIGHT: 0.138462
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 17/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z2.4 I.664 J1.02 P1  F30000
G1 X145.262 Y128.877 Z2.4
G1 Z2.138
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276923
G1 F3377
G1 X141.739 Y128.877 E.14336
G1 X141.766 Y128.75 E.0053
G2 X142.038 Y126 I-13.806 J-2.753 E.11259
G1 X145.262 Y126 E.13119
G1 X145.262 Y123.123 E.11705
G1 X141.739 Y123.123 E.14336
; WIPE_START
G1 F24000
G1 X143.739 Y123.123 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.248 Y124.585 Z2.538 F30000
G1 X114.261 Y128.877 Z2.538
G1 Z2.138
G1 E.8 F1800
G1 F3377
G1 X110.738 Y128.877 E.14336
G1 X110.738 Y126 E.11705
G1 X113.962 Y126 E.13118
G1 X114.045 Y124.478 E.06201
G3 X114.261 Y123.123 I17.104 J2.039 E.05585
G1 X110.738 Y123.123 E.14336
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.0615385
; WIPE_START
G1 F24000
G1 X112.738 Y123.123 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 18/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z2.538 I.52 J1.1 P1  F30000
G1 X130.591 Y114.691 Z2.538
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F3377
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3377
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.23519
G1 X131.57 Y115.374 E-.2124
G1 X132.095 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.10001
; WIPE_END
G1 E-.04 F1800
G1 X137.281 Y121.483 Z2.6 F30000
G1 X140.891 Y125.73 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3377
G1 X140.889 Y125.956 E.0075
G3 X126.396 Y113.202 I-12.896 J.043 E1.96427
G3 X128.368 Y113.109 I1.659 J14.107 E.06552
G3 X140.871 Y125.321 I-.375 J12.891 E.63702
G1 X140.888 Y125.67 E.0116
G1 X141.283 Y125.719 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3377
G1 X141.281 Y125.955 E.00726
G3 X126.347 Y112.813 I-13.288 J.044 E1.87479
G3 X128.378 Y112.717 I1.71 J14.541 E.06251
G3 X141.263 Y125.298 I-.385 J13.283 E.60797
G1 X141.28 Y125.659 E.01111
M204 S10000
; WIPE_START
G1 F24000
G1 X141.281 Y125.955 E-.11261
G1 X141.264 Y126.815 E-.32673
G1 X141.214 Y127.418 E-.23007
G1 X141.183 Y127.655 E-.0906
; WIPE_END
G1 E-.04 F1800
G1 X138.272 Y120.599 Z2.6 F30000
G1 X137.52 Y118.776 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3377
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.341 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.445 J3.227 E.21643
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3377
G3 X132.16 Y137.836 I-5.937 J-11.887 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.523 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3377
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.341 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.876 Y122.773 I12.453 J-3.227 E.21643
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3377
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.18 E.21658
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.523 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 19/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z2.6 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3023
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3023
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.21239
G1 X132.095 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.302 Y121.465 Z2.8 F30000
G1 X140.889 Y125.654 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3023
G1 X140.889 Y125.952 E.00987
G3 X126.396 Y113.202 I-12.896 J.048 E1.96441
G3 X128.372 Y113.109 I1.657 J14.083 E.06567
G3 X140.871 Y125.317 I-.38 J12.891 E.63672
G1 X140.886 Y125.594 E.00922
G1 X141.281 Y125.643 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3023
G1 X141.281 Y125.951 E.00946
G3 X126.347 Y112.813 I-13.288 J.048 E1.87496
G3 X128.383 Y112.717 I1.708 J14.516 E.06265
G3 X141.262 Y125.294 I-.39 J13.283 E.6077
G1 X141.278 Y125.583 E.00891
M204 S10000
; WIPE_START
G1 F24000
G1 X141.281 Y125.951 E-.13975
G1 X141.263 Y126.83 E-.33397
G1 X141.213 Y127.427 E-.22791
G1 X141.193 Y127.58 E-.05838
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3023
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02219
G3 X139.208 Y130.144 I-5.009 J-1.457 E.01602
G1 X140.124 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.437 J-3.227 E.21644
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3023
M73 P27 R20
G2 X132.16 Y114.164 I-5.937 J11.887 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.184 E.21658
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3023
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.446 J3.227 E.21643
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.493 J-1.796 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3023
G2 X123.84 Y137.836 I5.937 J-11.887 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.41538
; LAYER_HEIGHT: 0.0153844
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 20/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z2.8 I.664 J1.02 P1  F30000
G1 X145.262 Y128.877 Z2.8
G1 Z2.415
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276923
G1 F3377
G1 X141.739 Y128.877 E.14336
G1 X141.76 Y128.783 E.00394
G2 X142.038 Y126 I-14.054 J-2.807 E.11395
G1 X145.262 Y126 E.1312
G1 X145.262 Y123.123 E.11705
G1 X141.739 Y123.123 E.14336
; WIPE_START
G1 F24000
G1 X143.739 Y123.123 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.248 Y124.585 Z2.815 F30000
G1 X114.261 Y128.877 Z2.815
G1 Z2.415
G1 E.8 F1800
G1 F3377
G1 X110.738 Y128.877 E.14336
G1 X110.738 Y126 E.11705
G1 X113.962 Y126 E.13119
G1 X114.117 Y123.915 E.08507
G3 X114.261 Y123.123 I9.81 J1.378 E.03275
G1 X110.738 Y123.123 E.14336
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.184615
; WIPE_START
G1 F24000
G1 X112.738 Y123.123 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 21/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z2.815 I.52 J1.1 P1  F30000
G1 X130.591 Y114.691 Z2.815
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F3377
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3377
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.23519
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.21241
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.323 Y121.447 Z3 F30000
G1 X140.887 Y125.579 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3377
G1 X140.886 Y125.948 E.01223
G3 X127.036 Y113.138 I-12.895 J.051 E1.98578
G3 X128.363 Y113.108 I1.049 J17.028 E.04402
G3 X140.868 Y125.313 I-.372 J12.89 E.63684
G1 X140.883 Y125.519 E.00685
G1 X141.279 Y125.568 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3377
G1 X141.281 Y125.947 E.01165
G3 X126.347 Y112.813 I-13.288 J.053 E1.87509
G3 X128.382 Y112.717 I1.638 J13.041 E.06265
G3 X141.262 Y125.29 I-.39 J13.283 E.60759
G1 X141.275 Y125.508 E.00671
M204 S10000
; WIPE_START
G1 F24000
G1 X141.281 Y125.947 E-.16686
G1 X141.262 Y126.845 E-.34119
G1 X141.212 Y127.437 E-.22592
G1 X141.203 Y127.505 E-.02603
; WIPE_END
G1 E-.04 F1800
G1 X138.236 Y120.473 Z3 F30000
G1 X137.52 Y118.776 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3377
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.428 J3.227 E.21644
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3377
G3 X132.16 Y137.836 I-5.937 J-11.887 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.839 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3377
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.341 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.438 J-3.227 E.21644
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3377
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.176 E.21658
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.523 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.69231
; LAYER_HEIGHT: 0.0923078
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 22/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z3 I-.806 J.912 P1  F30000
G1 X141.739 Y123.123 Z3
G1 Z2.692
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276923
G1 F3371
G1 X145.262 Y123.123 E.14336
G1 X145.262 Y126 E.11705
G1 X142.038 Y126 E.1312
G3 X141.759 Y128.788 I-14.222 J-.013 E.11418
G1 X141.739 Y128.877 E.00371
G1 X145.262 Y128.877 E.14336
; WIPE_START
G1 F24000
G1 X143.262 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.63 Y128.877 Z3.092 F30000
G1 X114.261 Y128.877 Z3.092
G1 Z2.692
G1 E.8 F1800
G1 F3371
G1 X110.738 Y128.877 E.14336
G1 X110.738 Y126 E.11705
G1 X113.962 Y126 E.13118
G1 X114.045 Y124.472 E.06226
G3 X114.261 Y123.123 I17.4 J2.096 E.0556
G1 X110.738 Y123.123 E.14336
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.107692
; WIPE_START
G1 F24000
G1 X112.738 Y123.123 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 23/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z3.092 I.52 J1.1 P1  F30000
G1 X130.591 Y114.691 Z3.092
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F3371
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3371
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.21241
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.344 Y121.429 Z3.2 F30000
G1 X140.885 Y125.504 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3371
G1 X140.889 Y125.944 E.0146
G3 X126.396 Y113.202 I-12.896 J.055 E1.96465
G3 X128.367 Y113.109 I1.591 J12.665 E.06552
G3 X140.871 Y125.31 I-.374 J12.891 E.63668
G1 X140.881 Y125.444 E.00446
G1 X141.277 Y125.492 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3371
G1 X141.28 Y125.943 E.01384
G3 X126.347 Y112.813 I-13.288 J.057 E1.87521
G3 X128.387 Y112.717 I1.637 J13.03 E.06279
G3 X141.261 Y125.286 I-.395 J13.282 E.60732
G1 X141.272 Y125.433 E.00451
M204 S10000
; WIPE_START
G1 F24000
G1 X141.28 Y125.943 E-.19387
G1 X141.261 Y126.859 E-.34831
G1 X141.201 Y127.429 E-.21782
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3371
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.65 J-1.34 E.01601
M73 P28 R20
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.419 J-3.227 E.21644
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3371
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.179 E.21658
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.84 J4.523 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3371
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.43 J3.227 E.21644
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.493 J-1.796 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3371
G2 X123.84 Y137.836 I5.937 J-11.887 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.84 J-4.523 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.96923
; LAYER_HEIGHT: 0.169231
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 24/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z3.2 I.664 J1.02 P1  F30000
G1 X145.262 Y128.877 Z3.2
G1 Z2.969
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276923
G1 F3376
G1 X141.739 Y128.877 E.14336
G1 X141.882 Y128.09 E.03257
G2 X142.038 Y126 I-14.008 J-2.094 E.08532
G1 X145.262 Y126 E.13119
G1 X145.262 Y123.123 E.11705
G1 X141.739 Y123.123 E.14336
; WIPE_START
G1 F24000
G1 X143.739 Y123.123 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.248 Y124.585 Z3.369 F30000
G1 X114.261 Y128.877 Z3.369
G1 Z2.969
G1 E.8 F1800
G1 F3376
G1 X110.738 Y128.877 E.14336
G1 X110.738 Y126 E.11705
G1 X113.962 Y126 E.13118
G1 X114.117 Y123.914 E.08509
G3 X114.261 Y123.123 I36.911 J6.315 E.03272
G1 X110.738 Y123.123 E.14336
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.0307693
; WIPE_START
G1 F24000
G1 X112.738 Y123.123 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 25/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z3.369 I.52 J1.1 P1  F30000
G1 X130.572 Y114.687 Z3.369
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F3376
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3376
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.23519
G1 X131.57 Y115.374 E-.2124
G1 X132.095 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.10001
; WIPE_END
G1 E-.04 F1800
G1 X137.365 Y121.41 Z3.4 F30000
G1 X140.882 Y125.427 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3376
G1 X140.887 Y126.122 E.02308
G3 X126.396 Y113.202 I-12.895 J-.123 E1.95865
G3 X128.372 Y113.109 I1.589 J12.654 E.06566
G3 X140.869 Y125.304 I-.379 J12.89 E.63631
G1 X140.876 Y125.367 E.0021
G1 X141.273 Y125.418 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3376
G1 X141.278 Y126.127 E.02178
G3 X126.347 Y112.813 I-13.287 J-.128 E1.86949
G3 X128.391 Y112.717 I1.636 J13.02 E.06293
G3 X141.26 Y125.282 I-.4 J13.282 E.60701
G1 X141.267 Y125.358 E.00237
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y126.127 E-.29206
G1 X141.273 Y126.672 E-.20701
G1 X141.218 Y127.356 E-.26094
; WIPE_END
G1 E-.04 F1800
G1 X138.197 Y120.347 Z3.4 F30000
G1 X137.52 Y118.776 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3376
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.41 J3.227 E.21645
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3376
G3 X132.16 Y137.836 I-5.937 J-11.887 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3376
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.422 J-3.227 E.21644
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
M73 P28 R19
G1 X122.342 Y114.8 F30000
G1 F3376
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.182 E.21658
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 26/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z3.4 I-.241 J-1.193 P1  F30000
G1 X130.591 Y114.691 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3029
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3029
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.21241
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.386 Y121.392 Z3.6 F30000
G1 X140.88 Y125.353 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3029
G1 X140.888 Y126.131 E.02581
G3 X126.396 Y113.202 I-12.896 J-.132 E1.9585
G3 X128.376 Y113.109 I1.588 J12.644 E.06581
G3 X140.869 Y125.294 I-.384 J12.891 E.63583
G1 X141.272 Y125.345 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3029
G1 X141.278 Y126.136 E.02431
G3 X126.347 Y112.813 I-13.288 J-.136 E1.86932
G3 X128.396 Y112.717 I1.635 J13.01 E.06307
G3 X141.259 Y125.278 I-.405 J13.282 E.60674
G1 X141.261 Y125.286 E.00025
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y126.136 E-.32312
G1 X141.263 Y126.838 E-.26697
G1 X141.224 Y127.284 E-.16991
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3029
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
M73 P29 R19
G2 X140.125 Y122.773 I-12.4 J-3.227 E.21645
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.173 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3029
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.684 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.186 E.21658
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.439 J12.522 E.05401
G1 X118.48 Y118.776 F30000
G1 F3029
G3 X119.552 Y117.552 I10.246 J7.884 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.649 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.417 J3.227 E.21644
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3029
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.684 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.84 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.24615
; LAYER_HEIGHT: 0.0461538
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 27/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z3.6 I.664 J1.02 P1  F30000
G1 X145.262 Y128.877 Z3.6
G1 Z3.246
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276923
G1 F3382
G1 X141.739 Y128.877 E.14336
G1 X141.764 Y128.761 E.00485
G2 X142.038 Y126 I-13.709 J-2.753 E.11305
G1 X145.262 Y126 E.13119
G1 X145.262 Y123.123 E.11705
G1 X141.739 Y123.123 E.14336
; WIPE_START
G1 F24000
G1 X143.739 Y123.123 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X136.248 Y124.585 Z3.646 F30000
G1 X114.261 Y128.877 Z3.646
G1 Z3.246
G1 E.8 F1800
G1 F3382
G1 X110.738 Y128.877 E.14336
G1 X110.738 Y126 E.11705
G1 X113.962 Y126 E.13118
G1 X114.048 Y124.445 E.06337
G3 X114.261 Y123.123 I17.434 J2.133 E.05448
G1 X110.738 Y123.123 E.14336
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.153846
; WIPE_START
G1 F24000
G1 X112.738 Y123.123 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 28/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z3.646 I.52 J1.1 P1  F30000
G1 X130.591 Y114.691 Z3.646
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F3382
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.168 E2.30293
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.677 I-.289 J11.598 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3382
G3 X127.721 Y114.793 I-2.494 J10.929 E2.07834
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.206 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.21241
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.406 Y121.374 Z3.8 F30000
G1 X140.876 Y125.282 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3382
G1 X140.886 Y126.14 E.02846
G3 X126.396 Y113.202 I-12.894 J-.142 E1.95801
G3 X128.381 Y113.109 I1.587 J12.633 E.06596
G3 X140.863 Y125.224 I-.389 J12.889 E.6333
G1 X141.269 Y125.273 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3382
G1 X141.28 Y125.862 E.01811
G3 X125.692 Y112.912 I-13.288 J.138 E1.85735
G3 X128.4 Y112.718 I2.348 J13.76 E.08355
G3 X141.258 Y125.214 I-.408 J13.282 E.60468
M204 S10000
; WIPE_START
G1 F24000
G1 X141.28 Y125.862 E-.24648
G1 X141.262 Y126.85 E-.37544
G1 X141.224 Y127.211 E-.13808
; WIPE_END
G1 E-.04 F1800
G1 X138.155 Y120.223 Z3.8 F30000
G1 X137.52 Y118.776 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3382
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.432 J3.227 E.21644
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3382
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.523 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.522 E.05401
G1 X118.48 Y133.224 F30000
G1 F3382
G2 X119.552 Y134.448 I10.245 J-7.883 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.408 J-3.227 E.21645
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3382
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.189 E.21658
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.523 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.52308
; LAYER_HEIGHT: 0.123077
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 29/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z3.8 I-.824 J.896 P1  F30000
G1 X141.819 Y123.552 Z3.8
G1 Z3.523
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276923
G1 F3651
G2 X141.759 Y123.212 I-6.797 J1.028 E.01404
G1 X141.739 Y123.123 E.00371
G1 X142.033 Y123.123 E.01199
G3 X142.033 Y128.877 I-881.805 J2.877 E.2341
G1 X142.91 Y128.877 E.03568
G1 X142.91 Y123.123 E.2341
G1 X143.787 Y123.123 E.03568
G1 X143.787 Y128.877 E.2341
G1 X144.665 Y128.877 E.03568
G1 X144.665 Y123.123 E.2341
G1 X145.262 Y123.123 E.02433
G1 X145.262 Y128.877 E.2341
G1 X144.853 Y128.877 E.01666
; WIPE_START
G1 F24000
G1 X145.262 Y128.877 E-.15559
G1 X145.262 Y127.287 E-.60441
; WIPE_END
G1 E-.04 F1800
G1 X137.685 Y126.376 Z3.923 F30000
G1 X114.181 Y123.552 Z3.923
G1 Z3.523
G1 E.8 F1800
G1 F3651
G3 X114.261 Y123.123 I4.512 J.625 E.01775
G1 X113.967 Y123.123 E.01199
M73 P30 R19
G2 X113.967 Y128.877 I848.426 J2.877 E.2341
G1 X113.09 Y128.877 E.03568
G1 X113.09 Y123.123 E.2341
G1 X112.213 Y123.123 E.03568
G1 X112.213 Y128.877 E.2341
G1 X111.335 Y128.877 E.03568
G1 X111.335 Y123.123 E.2341
G1 X110.738 Y123.123 E.02433
G1 X110.738 Y128.877 E.2341
G1 X111.147 Y128.877 E.01666
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.0769229
; WIPE_START
G1 F24000
G1 X110.738 Y128.877 E-.15559
G1 X110.738 Y127.287 E-.60441
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 30/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z3.923 I.653 J1.027 P1  F30000
G1 X130.572 Y114.687 Z3.923
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F3651
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3651
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.21241
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.417 Y121.364 Z4 F30000
G1 X140.864 Y125.231 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3651
G3 X126.396 Y113.202 I-12.873 J.768 E1.98838
G3 X128.385 Y113.109 I1.586 J12.623 E.06611
G3 X140.86 Y125.171 I-.394 J12.89 E.63139
G1 X141.266 Y125.201 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3651
G1 X141.257 Y125.207 E.00033
G3 X125.692 Y112.912 I-13.265 J.793 E1.87749
G3 X128.405 Y112.718 I2.347 J13.746 E.08369
G3 X141.209 Y124.626 I-.413 J13.282 E.58642
G1 X141.26 Y125.142 E.01591
M204 S10000
; WIPE_START
G1 F24000
G1 X141.257 Y125.207 E-.02487
G1 X141.289 Y125.854 E-.24607
G1 X141.262 Y126.861 E-.38294
G1 X141.232 Y127.139 E-.10612
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z4 F30000
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3651
G3 X136.448 Y134.448 I-10.245 J-7.883 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.649 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.424 J-3.227 E.21644
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3651
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.192 E.21658
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3651
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.399 J3.227 E.21645
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3651
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.84 J-4.523 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 31/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z4 I.678 J1.01 P1  F30000
G1 X144.853 Y128.877 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.276923
G1 F3639
G1 X145.262 Y128.877 E.01666
G1 X145.262 Y123.123 E.2341
G1 X144.665 Y123.123 E.02433
G1 X144.665 Y128.877 E.2341
G1 X143.787 Y128.877 E.03568
G1 X143.787 Y123.123 E.2341
G1 X142.91 Y123.123 E.03568
G1 X142.91 Y128.877 E.2341
G1 X142.033 Y128.877 E.03568
G2 X142.033 Y123.123 I-888.012 J-2.877 E.2341
G1 X141.739 Y123.123 E.01199
G1 X141.759 Y123.212 E.00371
G3 X141.819 Y123.552 I-6.76 J1.372 E.01404
; WIPE_START
G1 F24000
G1 X141.759 Y123.212 E-.13113
G1 X141.739 Y123.123 E-.03464
G1 X142.033 Y123.123 E-.11198
G1 X142.033 Y124.392 E-.48225
; WIPE_END
G1 E-.04 F1800
G1 X134.404 Y124.162 Z4.2 F30000
G1 X114.181 Y123.552 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F3639
G1 X114.261 Y123.123 E.01774
G1 X113.967 Y123.123 E.01199
G2 X113.967 Y128.877 I850.357 J2.877 E.2341
G1 X113.09 Y128.877 E.03568
G1 X113.09 Y123.123 E.2341
G1 X112.213 Y123.123 E.03568
G1 X112.213 Y128.877 E.2341
G1 X111.335 Y128.877 E.03568
G1 X111.335 Y123.123 E.2341
G1 X110.738 Y123.123 E.02433
G1 X110.738 Y128.877 E.2341
G1 X111.147 Y128.877 E.01666
; WIPE_START
G1 F24000
G1 X110.738 Y128.877 E-.15559
G1 X110.738 Y127.287 E-.60441
; WIPE_END
G1 E-.04 F1800
G1 X117.18 Y123.194 Z4.2 F30000
G1 X130.572 Y114.687 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F3639
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.495 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3639
G1 X131.036 Y115.209 E.01717
G3 X127.721 Y114.793 I-3.036 J10.789 E2.06087
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06687
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.23517
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.10003
; WIPE_END
G1 E-.04 F1800
G1 X137.438 Y121.345 Z4.2 F30000
G1 X140.87 Y125.166 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3639
G1 X140.863 Y125.224 E.00194
G3 X126.396 Y113.202 I-12.872 J.776 E1.98859
G3 X128.389 Y113.11 I1.585 J12.614 E.06626
G3 X140.817 Y124.665 I-.399 J12.89 E.61435
G1 X140.863 Y125.106 E.01472
G1 X141.26 Y125.133 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3639
G1 X141.256 Y125.199 E.00203
G3 X125.692 Y112.912 I-13.264 J.801 E1.87776
G3 X128.409 Y112.718 I2.345 J13.732 E.08383
G3 X141.209 Y124.623 I-.417 J13.282 E.58616
G1 X141.254 Y125.074 E.01393
M204 S10000
; WIPE_START
G1 F24000
G1 X141.256 Y125.199 E-.04776
G1 X141.289 Y125.845 E-.24571
G1 X141.261 Y126.872 E-.39015
G1 X141.24 Y127.071 E-.07637
; WIPE_END
G1 E-.04 F1800
G1 X138.117 Y120.107 Z4.2 F30000
G1 X137.52 Y118.776 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3639
G2 X136.448 Y117.552 I-10.246 J7.884 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.417 J3.227 E.21644
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3639
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.682 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.522 E.05401
G1 X118.48 Y133.224 F30000
G1 F3639
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.399 J-3.227 E.21645
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
M73 P31 R19
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3639
G3 X123.84 Y114.164 I5.937 J11.887 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.682 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.195 E.21658
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 32/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z4.2 I-.824 J.896 P1  F30000
G1 X141.819 Y123.552 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F3679
G2 X141.759 Y123.212 I-6.812 J1.031 E.0106
G1 X141.739 Y123.123 E.0028
G1 X142.033 Y123.123 E.00906
G1 X142.033 Y124.988 E.05731
G1 X142.722 Y124.988 E.02116
; WIPE_START
G1 F24000
G1 X142.033 Y124.988 E-.26164
G1 X142.033 Y123.677 E-.49836
; WIPE_END
G1 E-.04 F1800
G1 X142.033 Y127.012 Z4.4 F30000
G1 Z4
G1 E.8 F1800
G1 F3679
G1 X142.033 Y128.877 E.05731
G1 X142.91 Y128.877 E.02695
G1 X142.91 Y127.012 E.05731
G2 X143.389 Y126.784 I.125 J-.353 E.01807
G1 X143.389 Y125.216 E.04821
G2 X142.91 Y124.988 I-.353 J.125 E.01807
G1 X142.91 Y123.123 E.05731
G1 X143.787 Y123.123 E.02695
G1 X143.787 Y128.877 E.17681
G1 X144.665 Y128.877 E.02695
G1 X144.665 Y123.123 E.17681
G1 X145.262 Y123.123 E.01837
G1 X145.262 Y128.877 E.17681
G1 X144.853 Y128.877 E.01258
; WIPE_START
G1 F24000
G1 X145.262 Y128.877 E-.15559
G1 X145.262 Y127.287 E-.60441
; WIPE_END
G1 E-.04 F1800
G1 X137.63 Y127.22 Z4.4 F30000
G1 X113.967 Y127.012 Z4.4
G1 Z4
G1 E.8 F1800
G1 F3679
G1 X113.967 Y128.877 E.05731
G1 X113.09 Y128.877 E.02695
G1 X113.09 Y127.012 E.05731
G3 X112.611 Y126.784 I-.125 J-.353 E.01807
G1 X112.611 Y125.216 E.04821
G3 X113.09 Y124.988 I.353 J.125 E.01807
G1 X113.09 Y123.123 E.05731
G1 X113.967 Y123.123 E.02695
G1 X113.967 Y124.988 E.0573
G1 X113.278 Y124.988 E.02116
; WIPE_START
G1 F24000
G1 X113.967 Y124.988 E-.26164
G1 X113.967 Y123.676 E-.49836
; WIPE_END
G1 E-.04 F1800
G1 X112.901 Y123.123 Z4.4 F30000
G1 Z4
G1 E.8 F1800
G1 F3679
G1 X112.213 Y123.123 E.02116
G1 X112.213 Y128.877 E.17681
G1 X111.335 Y128.877 E.02695
G1 X111.335 Y123.123 E.17681
G1 X110.738 Y123.123 E.01837
G1 X110.738 Y128.877 E.17681
G1 X111.147 Y128.877 E.01258
; WIPE_START
G1 F24000
G1 X110.738 Y128.877 E-.15559
G1 X110.738 Y127.287 E-.60441
; WIPE_END
G1 E-.04 F1800
G1 X117.182 Y123.198 Z4.4 F30000
G1 X130.591 Y114.691 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3679
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.495 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3679
G1 X131.036 Y115.209 E.01717
G3 X127.721 Y114.793 I-3.036 J10.789 E2.06087
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06687
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.23516
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.10004
; WIPE_END
G1 E-.04 F1800
G1 X137.455 Y121.33 Z4.4 F30000
G1 X140.855 Y125.093 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3679
G1 X140.885 Y125.759 E.02213
G3 X125.76 Y113.298 I-12.893 J.24 E1.94934
G3 X128.394 Y113.11 I2.277 J13.336 E.08772
G3 X140.818 Y124.661 I-.402 J12.889 E.61414
G1 X140.85 Y125.033 E.01238
G1 X141.255 Y125.068 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3679
G1 X141.254 Y125.192 E.0038
G3 X125.692 Y112.912 I-13.263 J.807 E1.87784
G3 X128.413 Y112.718 I2.344 J13.719 E.08396
G3 X141.207 Y124.62 I-.422 J13.281 E.5859
G1 X141.249 Y125.008 E.01201
M204 S10000
; WIPE_START
G1 F24000
G1 X141.254 Y125.192 E-.06972
G1 X141.288 Y125.752 E-.21343
G1 X141.26 Y126.883 E-.42976
G1 X141.247 Y127.006 E-.0471
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z4.4 F30000
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3679
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.409 J-3.227 E.21645
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3679
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.198 E.21657
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3679
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.388 J3.227 E.21646
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3679
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 33/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z4.4 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3150
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3150
G1 X130.494 Y115.071 E0
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X129.947 Y114.96 I-.279 J11.205 E.05153
G1 X130.436 Y115.059 E.01533
M204 S10000
; WIPE_START
G1 F24000
G1 X130.494 Y115.071 E-.02284
G1 X131.036 Y115.209 E-.21241
G1 X131.57 Y115.374 E-.2124
G1 X132.095 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.09996
; WIPE_END
G1 E-.04 F1800
G1 X137.225 Y121.53 Z4.6 F30000
G1 X140.92 Y125.964 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3150
G1 X140.921 Y125.974 E.00032
G3 X140.12 Y130.411 I-14.127 J-.26 E.15021
G3 X115.146 Y127.064 I-12.119 J-4.416 E1.1592
G1 X115.079 Y126.025 E.03454
G3 X115.88 Y121.589 I14.117 J.259 E.15017
G3 X128.398 Y113.11 I12.128 J4.426 E.53581
G3 X140.853 Y124.921 I-.406 J12.9 E.62286
G1 X140.917 Y125.905 E.03269
G1 X141.289 Y125.587 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3150
G1 X141.693 Y125.587 E.01242
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X142.79 Y125.587 E.03639
G1 X142.79 Y126.414 E.02743
G1 X141.693 Y126.413 E.03638
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3150
G1 X141.324 Y126.413 E.01135
G1 X141.288 Y126.413 E.00112
G3 X114.711 Y126.413 I-13.288 J-.422 E1.25743
G1 X114.307 Y126.413 E.01242
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X113.21 Y126.414 E.03639
G1 X113.21 Y125.586 E.02744
G1 X114.307 Y125.586 E.03639
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3150
G1 X114.712 Y125.586 E.01245
G3 X141.287 Y125.527 I13.288 J.423 E1.2556
M204 S10000
G1 X141.117 Y125.783 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.448601
G1 F3150
G1 X141.32 Y125.986 E.00949
; LINE_WIDTH: 0.477419
G1 X141.334 Y126 E.0007
G1 X142.594 Y126 E.04462
; WIPE_START
G1 F24000
G1 X141.334 Y126 E-.74821
G1 X141.32 Y125.986 E-.01179
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.618 J-1.048 P1  F30000
G1 X122.342 Y114.8 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3150
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.202 E.21657
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.523 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
G1 X137.52 Y118.776 F30000
G1 F3150
G2 X136.448 Y117.552 I-10.246 J7.884 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.171 J3.227 E.21654
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3150
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
M73 P32 R19
G2 X124.311 Y137.365 I1.84 J-4.523 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3150
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.341 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.184 J-3.227 E.21653
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X114.883 Y126.217 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.427543
G1 F3150
G1 X114.679 Y126.013 E.00905
; LINE_WIDTH: 0.477473
G1 X114.666 Y126 E.00065
G1 X113.406 Y126 E.04463
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.666 Y126 E-.74914
G1 X114.679 Y126.013 E-.01086
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 34/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z4.6 I.706 J.992 P1  F30000
G1 X130.591 Y114.691 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3227
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.495 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3227
G1 X131.036 Y115.209 E.01717
G3 X127.721 Y114.793 I-3.036 J10.789 E2.06087
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06687
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.23515
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.10005
; WIPE_END
G1 E-.04 F1800
G1 X137.348 Y121.425 Z4.8 F30000
G1 X140.937 Y125.548 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3227
G1 X142.398 Y125.549 E.04847
G1 X142.398 Y126.451 E.0299
G1 X141.313 Y126.451 E.03599
G1 X140.911 Y126.452 E.01335
G3 X139.327 Y132.168 I-13.703 J-.718 E.19834
G3 X115.184 Y127.449 I-11.326 J-6.174 E1.08236
G1 X115.088 Y126.451 E.03328
G1 X113.602 Y126.45 E.0493
G1 X113.602 Y125.549 E.02989
G1 X115.09 Y125.548 E.04936
G3 X116.673 Y119.832 I13.679 J.71 E.19835
G3 X140.818 Y124.567 I11.326 J6.174 E1.08292
G1 X140.908 Y125.514 E.03154
G1 X141.268 Y125.157 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3227
G1 X141.672 Y125.157 E.01241
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X142.79 Y125.157 E.0371
G1 X142.79 Y125.177 E.00063
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3227
G1 X142.79 Y126.824 E.05061
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X142.79 Y126.843 E.00063
G1 X141.673 Y126.843 E.03706
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3227
G1 X141.303 Y126.843 E.01136
G1 X141.268 Y126.844 E.00109
G3 X114.732 Y126.843 I-13.268 J-.852 E1.23101
G1 X114.328 Y126.843 E.01241
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X113.21 Y126.842 E.03709
G1 X113.21 Y126.824 E.00063
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3227
G1 X113.21 Y125.176 E.05061
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X113.21 Y125.157 E.00063
G1 X114.327 Y125.157 E.03705
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3227
G1 X114.733 Y125.157 E.01246
G3 X141.264 Y125.097 I13.268 J.855 E1.22899
M204 S10000
; WIPE_START
G1 F24000
G1 X141.672 Y125.157 E-.15663
G1 X142.79 Y125.157 E-.42498
G1 X142.79 Y125.177 E-.00725
G1 X142.79 Y125.627 E-.17115
; WIPE_END
G1 E-.04 F1800
G1 X140.733 Y126.248 Z4.8 F30000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.538136
G1 F3227
G1 X140.997 Y126 E.01462
G1 X142.194 Y126 E.04832
; WIPE_START
G1 F24000
G1 X140.997 Y126 E-.58348
G1 X140.733 Y126.248 E-.17652
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.105 J-.509 P1  F30000
G1 X137.52 Y133.224 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3227
M73 P32 R18
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.549 Y126.56 I-17.245 J-4.111 E.08967
G1 X140.057 Y126.037 E.02383
G1 X140.563 Y125.561 E.02305
G2 X140.125 Y122.773 I-14.535 J.855 E.09378
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3227
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.205 E.21657
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3227
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.876 Y122.773 E.04302
G2 X115.403 Y125.897 I18.679 J4.42 E.10492
G1 X115.352 Y125.897 E.0017
G1 X115.352 Y126.103 E.00683
G1 X115.405 Y126.103 E.00174
G2 X115.875 Y129.227 I24.524 J-2.096 E.1049
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3227
G2 X123.84 Y137.836 I5.937 J-11.887 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
G1 X125.6 Y133.259 Z4.8 F30000
G1 X115.004 Y126 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.538035
G1 F3227
G1 X113.806 Y126 E.04835
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.004 Y126 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 35/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z4.8 I.715 J.984 P1  F30000
G1 X130.572 Y114.687 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3263
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3263
G1 X130.494 Y115.071 E0
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X129.947 Y114.96 I-.279 J11.205 E.05153
G1 X130.436 Y115.059 E.01533
M204 S10000
; WIPE_START
G1 F24000
G1 X130.494 Y115.071 E-.02285
G1 X131.036 Y115.209 E-.21241
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.09994
; WIPE_END
G1 E-.04 F1800
G1 X137.421 Y121.36 Z5 F30000
G1 X140.921 Y125.28 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3263
G1 X142.398 Y125.279 E.04898
G1 X142.398 Y126.721 E.04781
G1 X140.896 Y126.72 E.04981
G3 X138.657 Y133.266 I-13.364 J-.917 E.23211
G3 X115.194 Y127.537 I-10.656 J-7.269 E1.03686
G1 X115.104 Y126.72 E.02727
G1 X113.602 Y126.721 E.04982
G1 X113.602 Y125.279 E.04781
G1 X115.104 Y125.279 E.04982
G3 X117.719 Y118.212 I13.308 J.906 E.25341
G3 X128.407 Y113.111 I10.291 J7.814 E.40812
G3 X140.804 Y124.451 I-.408 J12.893 E.60695
G1 X140.892 Y125.245 E.02652
G1 X141.247 Y124.888 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3263
G1 X141.448 Y124.888 E.00618
M106 S255
G1 F1800
G1 X142.79 Y124.887 E.04123
G1 X142.79 Y124.952 E.002
M106 S252.45
G1 F3263
G1 X142.79 Y125.116 E.00504
G1 X142.79 Y126.884 E.0543
G1 X142.79 Y127.048 E.00504
M106 S255
G1 F1800
G1 X142.79 Y127.113 E.002
G1 X141.448 Y127.113 E.04123
M106 S252.45
G1 F3263
G1 X141.284 Y127.112 E.00506
G1 X141.247 Y127.112 E.00111
G3 X114.753 Y127.112 I-13.247 J-1.121 E1.2144
G1 X114.552 Y127.112 E.00617
M106 S255
G1 F1800
G1 X113.21 Y127.113 E.04123
G1 X113.21 Y127.047 E.00201
M106 S252.45
G1 F3263
G1 X113.21 Y126.883 E.00504
G1 X113.21 Y125.116 E.0543
G1 X113.21 Y124.952 E.00504
M106 S255
G1 F1800
G1 X113.21 Y124.887 E.00201
G1 X114.552 Y124.887 E.04123
M106 S252.45
G1 F3263
G1 X114.753 Y124.887 E.00619
G3 X141.242 Y124.828 I13.247 J1.124 E1.21238
M204 S10000
; WIPE_START
G1 F24000
G1 X141.448 Y124.888 E-.08156
G1 X142.79 Y124.887 E-.50989
G1 X142.79 Y124.952 E-.02478
G1 X142.79 Y125.116 E-.06232
G1 X142.79 Y125.331 E-.08145
; WIPE_END
G1 E-.04 F1800
G1 X140.565 Y126.079 Z5 F30000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.559719
G1 F3263
G1 X140.73 Y126.258 E.01026
G1 X141.936 Y126.259 E.0508
G1 X141.936 Y125.742 E.02177
G1 X140.83 Y125.742 E.04657
G1 X140.602 Y126.032 E.01553
G1 X137.52 Y118.776 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3263
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
M73 P33 R18
G3 X140.547 Y125.29 I-18.83 J4.453 E.08473
G3 X140.111 Y125.823 I-2.134 J-1.299 E.02293
G1 X140.098 Y126.254 E.0143
G1 X140.463 Y126.642 E.01767
G2 X140.542 Y126.748 I.115 J-.004 E.00468
G3 X140.125 Y129.227 I-19.183 J-1.959 E.08347
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.175 J-9.109 E.05401
G1 X133.658 Y137.2 F30000
G1 F3263
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.523 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3263
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.453 Y126.71 I18.812 J-4.448 E.08472
G1 X115.588 Y126.565 E.00659
G3 X115.586 Y125.431 I3.975 J-.574 E.03773
G1 X115.454 Y125.289 E.00645
G3 X115.875 Y122.773 I19.224 J1.929 E.08471
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3263
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.208 E.21657
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
G1 X125.567 Y118.692 Z5 F30000
G1 X115.103 Y125.741 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.55994
G1 F3263
G1 X114.064 Y125.741 E.04376
G1 X114.064 Y126.258 E.02179
G1 X115.102 Y126.258 E.04372
G1 X115.103 Y125.801 E.01925
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.102 Y126.258 E-.17363
G1 X114.064 Y126.258 E-.39432
G1 X114.064 Y125.753 E-.19205
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 36/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z5 I.678 J1.011 P1  F30000
G1 X130.572 Y114.687 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3281
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.495 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3281
G1 X131.036 Y115.209 E.01717
G3 X127.721 Y114.793 I-3.036 J10.789 E2.06087
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06687
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.23514
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.10006
; WIPE_END
G1 E-.04 F1800
G1 X137.475 Y121.313 Z5.2 F30000
G1 X140.883 Y125.059 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3281
G1 X140.886 Y125.082 E.00077
G1 X142.398 Y125.083 E.05014
G1 X142.398 Y126.917 E.06087
G1 X140.886 Y126.918 E.05014
G3 X140.12 Y130.411 I-14.432 J-1.336 E.11894
G3 X115.244 Y127.91 I-12.119 J-4.417 E1.13093
G1 X115.114 Y126.917 E.03322
G1 X113.602 Y126.917 E.05015
G1 X113.602 Y125.083 E.06086
G1 X115.114 Y125.083 E.05014
G3 X115.88 Y121.589 I14.427 J1.334 E.11896
G3 X128.412 Y113.111 I12.119 J4.412 E.53633
G3 X140.755 Y124.089 I-.42 J12.9 E.59462
G1 X140.876 Y125 E.03047
G1 X141.23 Y124.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3281
G1 X141.349 Y124.69 E.00365
G1 F3000
G1 X142.79 Y124.691 E.04428
G1 X142.79 Y124.764 E.00226
G1 F3281
G1 X142.79 Y127.236 E.07595
G1 F3000
G1 X142.79 Y127.309 E.00226
G1 X141.349 Y127.31 E.04428
G1 F3281
G1 X141.267 Y127.31 E.00254
G1 X141.23 Y127.31 E.00112
G3 X114.77 Y127.309 I-13.23 J-1.32 E1.20224
G1 X114.651 Y127.309 E.00366
G1 F3000
G1 X113.21 Y127.309 E.04427
G1 X113.21 Y127.236 E.00226
G1 F3281
G1 X113.21 Y124.764 E.07595
G1 F3000
G1 X113.21 Y124.691 E.00226
G1 X114.651 Y124.691 E.04428
G1 F3281
G1 X114.77 Y124.691 E.00365
G3 X141.224 Y124.631 I13.23 J1.322 E1.20027
M204 S10000
; WIPE_START
G1 F24000
G1 X141.349 Y124.69 E-.05263
G1 X142.79 Y124.691 E-.54755
G1 X142.79 Y124.764 E-.02797
G1 X142.79 Y125.111 E-.13184
; WIPE_END
G1 E-.04 F1800
G1 X140.494 Y126.104 Z5.2 F30000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3281
G1 X140.774 Y126.401 E.01256
G1 X140.816 Y126.526 E.00404
G1 X142.006 Y126.526 E.03655
G1 X142.006 Y125.475 E.03229
G1 X140.829 Y125.474 E.03616
G1 X140.806 Y125.701 E.00701
G1 X140.498 Y125.998 E.01314
G1 X140.496 Y126.044 E.00142
G1 X140.948 Y126.064 F30000
; LINE_WIDTH: 0.380021
G1 F3281
G1 X141.062 Y126.169 E.00426
G1 X141.649 Y126.169 E.01611
G1 X141.649 Y125.832 E.00926
G1 X141.119 Y125.832 E.01455
G3 X140.991 Y126.023 I-.402 J-.129 E.00641
G1 X137.52 Y133.224 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3281
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.65 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.538 Y126.894 I-21.211 J-4.965 E.07864
G3 X140.425 Y126.602 I.075 J-.197 E.01173
G1 X140.098 Y126.254 E.01585
G1 X140.111 Y125.823 E.0143
G1 X140.439 Y125.514 E.01495
G3 X140.538 Y125.108 I.235 J-.158 E.01564
G2 X140.125 Y122.773 I-21.606 J2.626 E.0787
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3281
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.211 E.21657
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3281
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.462 Y125.106 I21.17 J4.957 E.07864
G1 X115.591 Y125.25 E.00642
G2 X115.471 Y126.175 I6.05 J1.256 E.03098
G3 X115.587 Y126.754 I-.749 J.45 E.01999
G1 X115.462 Y126.892 E.00616
G2 X115.875 Y129.227 I21.568 J-2.617 E.07873
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3281
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
G1 X125.713 Y133.099 Z5.2 F30000
G1 X115.173 Y125.475 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3281
G1 X113.994 Y125.475 E.03623
G1 X113.994 Y126.525 E.03228
G1 X115.171 Y126.525 E.03616
G1 X115.079 Y126.257 E.00872
G1 X115.079 Y125.742 E.01581
G1 X115.153 Y125.531 E.00687
G1 X114.722 Y126.168 F30000
; LINE_WIDTH: 0.379628
G1 F3281
G1 X114.722 Y125.832 E.00924
G1 X114.351 Y125.832 E.01018
G1 X114.351 Y126.168 E.00924
G1 X114.662 Y126.168 E.00854
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.351 Y126.168 E-.17444
G1 X114.351 Y125.832 E-.18875
G1 X114.722 Y125.832 E-.20804
G1 X114.722 Y126.168 E-.18876
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 37/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z5.2 I.714 J.986 P1  F30000
G1 X130.572 Y114.687 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3186
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3186
G1 X130.494 Y115.071 E0
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X129.947 Y114.96 I-.279 J11.205 E.05153
G1 X130.436 Y115.059 E.01533
M204 S10000
; WIPE_START
G1 F24000
G1 X130.494 Y115.071 E-.02286
G1 X131.036 Y115.209 E-.21241
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.21241
G1 X132.338 Y115.667 E-.09993
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y121.271 Z5.4 F30000
G1 X140.906 Y124.932 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3186
G1 X142.398 Y124.932 E.04949
G1 X142.398 Y127.068 E.07084
G1 X140.871 Y127.068 E.05064
G3 X138.657 Y133.266 I-13.45 J-1.312 E.22054
G3 X115.244 Y127.908 I-10.656 J-7.268 E1.02449
G1 X115.129 Y127.068 E.02813
G1 X113.602 Y127.068 E.05064
G1 X113.602 Y124.932 E.07084
G1 X115.129 Y124.932 E.05064
G3 X117.343 Y118.734 I13.451 J1.312 E.22054
G3 X128.416 Y113.111 I10.66 J7.276 E.42979
G3 X140.756 Y124.091 I-.416 J12.891 E.59463
G1 X140.868 Y124.907 E.02732
G1 X141.213 Y124.54 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3186
G1 X141.334 Y124.54 E.00373
G1 F3000
G1 X142.79 Y124.54 E.04473
G1 X142.79 Y124.568 E.00084
G1 F3186
G1 X142.79 Y127.432 E.08803
G1 F3000
G1 X142.79 Y127.46 E.00084
G1 X141.334 Y127.46 E.04472
G1 F3186
G1 X141.252 Y127.46 E.00254
G1 X141.213 Y127.46 E.00118
G3 X114.787 Y127.46 I-13.213 J-1.469 E1.1929
G1 X114.666 Y127.46 E.00372
G1 F3000
G1 X113.21 Y127.46 E.04473
G1 X113.21 Y127.432 E.00084
G1 F3186
G1 X113.21 Y124.568 E.08803
G1 F3000
G1 X113.21 Y124.54 E.00084
G1 X114.666 Y124.54 E.04473
G1 F3186
G1 X114.787 Y124.54 E.00372
G3 X141.206 Y124.48 I13.213 J1.469 E1.19107
M204 S10000
; WIPE_START
G1 F24000
G1 X141.334 Y124.54 E-.05365
G1 X142.79 Y124.54 E-.55311
G1 X142.79 Y124.568 E-.01038
G1 X142.79 Y124.944 E-.14286
; WIPE_END
G1 E-.04 F1800
G1 X137.832 Y119.141 Z5.4 F30000
G1 X137.52 Y118.776 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3186
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
M73 P34 R18
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.568 Y125.28 I-23.185 J5.39 E.08451
G1 X142.05 Y125.28 E.04916
G1 X142.05 Y126.72 E.04773
G1 X140.568 Y126.72 E.04916
G3 X140.125 Y129.227 I-23.652 J-2.887 E.08451
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3186
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3186
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.341 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.433 Y126.72 I23.181 J-5.388 E.0845
G1 X113.95 Y126.72 E.04917
G1 X113.95 Y125.281 E.04774
G1 X115.432 Y125.28 E.04916
G3 X115.875 Y122.773 I23.649 J2.886 E.08452
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3186
G3 X123.84 Y114.164 I5.937 J11.887 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.214 E.21657
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.523 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 38/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z5.4 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3171
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.495 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3171
G1 X131.036 Y115.209 E.01717
G3 X127.721 Y114.793 I-3.036 J10.789 E2.06087
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06687
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.23514
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.10006
; WIPE_END
G1 E-.04 F1800
G1 X137.551 Y121.242 Z5.6 F30000
G1 X140.894 Y124.816 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3171
G1 X142.398 Y124.816 E.04989
G1 X142.398 Y127.184 E.07852
G1 X140.859 Y127.184 E.05105
G3 X136.534 Y135.67 I-13.091 J-1.326 E.3233
G3 X115.244 Y127.906 I-8.532 J-9.676 E.9178
G1 X115.141 Y127.184 E.02421
G1 X113.602 Y127.184 E.05105
G1 X113.602 Y124.817 E.07852
G1 X115.141 Y124.816 E.05106
G3 X119.466 Y116.33 I13.088 J1.324 E.32331
G3 X128.421 Y113.111 I8.546 J9.711 E.32325
G3 X140.756 Y124.093 I-.421 J12.891 E.59453
G1 X140.855 Y124.791 E.02341
G1 X141.199 Y124.424 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3171
G1 X141.239 Y124.424 E.00122
G1 X142.79 Y124.425 E.04767
G1 X142.79 Y124.499 E.0023
G1 X142.79 Y127.501 E.09223
G1 X142.79 Y127.575 E.0023
G1 X141.239 Y127.576 E.04767
G1 X141.199 Y127.576 E.00121
G3 X114.801 Y127.576 I-13.199 J-1.583 E1.18575
G1 X114.761 Y127.576 E.00121
G1 X113.21 Y127.575 E.04767
G1 X113.21 Y127.501 E.0023
G1 X113.21 Y124.499 E.09223
G1 X113.21 Y124.425 E.0023
G1 X114.761 Y124.424 E.04767
G1 X114.801 Y124.424 E.00122
G3 X141.192 Y124.364 I13.199 J1.584 E1.18387
M204 S10000
; WIPE_START
G1 F24000
G1 X141.239 Y124.424 E-.02878
G1 X142.79 Y124.425 E-.58951
G1 X142.79 Y124.499 E-.02841
G1 X142.79 Y124.797 E-.11329
; WIPE_END
G1 E-.04 F1800
G1 X138.743 Y131.268 Z5.6 F30000
G1 X137.52 Y133.224 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3171
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.649 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.561 Y126.836 I-16.322 J-4.216 E.08072
G1 X142.05 Y126.835 E.04937
G1 X142.05 Y125.165 E.05542
G1 X140.561 Y125.164 E.04938
G2 X140.125 Y122.773 I-16.751 J1.823 E.08071
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3171
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.684 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.217 E.21657
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.344 Y114.804 I4.123 J11.704 E.05401
G1 X118.48 Y118.776 F30000
G1 F3171
G3 X119.552 Y117.552 I10.246 J7.884 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.649 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.439 Y125.165 I16.3 J4.211 E.08073
G1 X113.95 Y125.165 E.04938
G1 X113.95 Y126.835 E.05542
G1 X115.439 Y126.836 E.04937
G2 X115.875 Y129.227 I16.761 J-1.825 E.08072
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.175 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3171
G2 X123.84 Y137.836 I5.937 J-11.887 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.684 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.84 J-4.523 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 39/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z5.6 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3188
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3188
G1 X130.494 Y115.071 E0
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X129.947 Y114.96 I-.279 J11.205 E.05153
G1 X130.436 Y115.059 E.01533
M204 S10000
; WIPE_START
G1 F24000
G1 X130.494 Y115.071 E-.02286
G1 X131.036 Y115.209 E-.21241
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.09993
; WIPE_END
G1 E-.04 F1800
G1 X137.575 Y121.22 Z5.8 F30000
G1 X140.884 Y124.729 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3188
G1 X142.398 Y124.729 E.05022
G1 X142.398 Y127.271 E.08433
G1 X140.848 Y127.271 E.0514
G3 X136.042 Y136.084 I-12.993 J-1.37 E.34177
G3 X115.244 Y127.905 I-8.039 J-10.09 E.8965
G1 X115.151 Y127.271 E.02125
G1 X113.602 Y127.271 E.05139
G1 X113.602 Y124.729 E.08433
G1 X115.151 Y124.729 E.05139
G3 X119.466 Y116.33 I13.066 J1.404 E.3204
G3 X128.425 Y113.111 I8.529 J9.664 E.32345
G3 X140.756 Y124.094 I-.426 J12.892 E.59442
G1 X140.845 Y124.704 E.02045
G1 X141.188 Y124.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3188
G1 X141.228 Y124.337 E.00124
G1 X142.79 Y124.337 E.04799
G1 X142.79 Y124.384 E.00143
G1 X142.79 Y127.616 E.09934
G1 X142.79 Y127.663 E.00143
G1 X141.228 Y127.663 E.04799
G1 X141.188 Y127.663 E.00124
G3 X114.812 Y127.663 I-13.188 J-1.671 E1.18027
G1 X114.772 Y127.663 E.00124
G1 X113.21 Y127.663 E.04799
G1 X113.21 Y127.616 E.00143
G1 X113.21 Y124.384 E.09934
G1 X113.21 Y124.337 E.00143
G1 X114.772 Y124.337 E.04799
G1 X114.812 Y124.337 E.00124
G3 X141.18 Y124.277 I13.188 J1.674 E1.17829
M204 S10000
; WIPE_START
G1 F24000
G1 X141.228 Y124.337 E-.02904
G1 X142.79 Y124.337 E-.59351
G1 X142.79 Y124.384 E-.01773
G1 X142.79 Y124.699 E-.11973
; WIPE_END
G1 E-.04 F1800
G1 X137.716 Y118.997 Z5.8 F30000
G1 X137.52 Y118.776 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3188
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
M73 P35 R18
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.552 Y125.077 I-16.382 J4.231 E.07781
G1 X142.05 Y125.077 E.04968
G1 X142.05 Y126.923 E.06123
G1 X140.552 Y126.923 E.04969
G3 X140.125 Y129.227 I-16.764 J-1.916 E.0778
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.495 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.175 J-9.109 E.05401
G1 X133.658 Y137.2 F30000
G1 F3188
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3188
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.65 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.448 Y126.923 I16.361 J-4.226 E.07781
G1 X113.95 Y126.923 E.04968
G1 X113.95 Y125.077 E.06122
G1 X115.448 Y125.077 E.04968
G3 X115.875 Y122.773 I16.815 J1.928 E.07782
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3188
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.22 E.21657
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 40/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z5.8 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3172
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.495 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3172
G1 X131.036 Y115.209 E.01717
G3 X127.721 Y114.793 I-3.036 J10.789 E2.06087
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06687
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.23514
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.10006
; WIPE_END
G1 E-.04 F1800
G1 X137.592 Y121.204 Z6 F30000
G1 X140.849 Y124.637 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3172
G1 X140.854 Y124.666 E.00098
G1 X142.398 Y124.666 E.05122
G1 X142.398 Y127.334 E.08852
G1 X140.854 Y127.334 E.05122
G3 X140.325 Y129.802 I-16.671 J-2.285 E.08379
G3 X115.358 Y128.556 I-12.325 J-3.802 E1.13072
G1 X115.146 Y127.334 E.04115
G1 X113.602 Y127.334 E.05122
G1 X113.602 Y124.666 E.08852
G1 X115.146 Y124.666 E.05122
G3 X115.675 Y122.198 I16.673 J2.285 E.08379
G3 X128.43 Y113.112 I12.331 J3.814 E.55817
G3 X140.642 Y123.444 I-.436 J12.898 E.5723
G1 X140.839 Y124.578 E.03818
G1 X141.184 Y124.274 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3172
G1 X141.22 Y124.274 E.00112
G1 X142.79 Y124.274 E.04824
G1 X142.79 Y124.296 E.00068
G1 X142.79 Y127.704 E.10473
G1 X142.79 Y127.726 E.00068
G1 X141.22 Y127.726 E.04824
G1 X141.184 Y127.726 E.00111
G3 X114.816 Y127.726 I-13.184 J-1.739 E1.17652
G1 X114.78 Y127.726 E.00111
G1 X113.21 Y127.726 E.04824
G1 X113.21 Y127.704 E.00068
G1 X113.21 Y124.296 E.10473
G1 X113.21 Y124.274 E.00068
G1 X114.78 Y124.274 E.04824
G1 X114.816 Y124.274 E.00112
G3 X141.176 Y124.214 I13.184 J1.735 E1.17486
M204 S10000
; WIPE_START
G1 F24000
G1 X141.22 Y124.274 E-.02816
G1 X142.79 Y124.274 E-.59656
G1 X142.79 Y124.296 E-.00843
G1 X142.79 Y124.63 E-.12686
; WIPE_END
G1 E-.04 F1800
G1 X138.8 Y131.136 Z6 F30000
G1 X137.52 Y133.224 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3172
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.65 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.561 Y126.986 I-18.822 J-4.827 E.07579
G1 X142.05 Y126.986 E.04939
G1 X142.05 Y125.014 E.06541
G1 X140.561 Y125.014 E.04939
G2 X140.125 Y122.773 I-19.26 J2.586 E.0758
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3172
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.224 E.21657
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3172
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.439 Y125.014 I18.826 J4.828 E.0758
G1 X113.95 Y125.014 E.04939
G1 X113.95 Y126.986 E.06541
G1 X115.439 Y126.986 E.04939
G2 X115.875 Y129.227 I19.261 J-2.586 E.0758
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.175 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3172
G2 X123.84 Y137.836 I5.937 J-11.887 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 41/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z6 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3187
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3187
G1 X130.494 Y115.071 E0
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X129.947 Y114.96 I-.279 J11.205 E.05153
G1 X130.436 Y115.059 E.01533
M204 S10000
; WIPE_START
G1 F24000
G1 X130.494 Y115.071 E-.02285
G1 X131.036 Y115.209 E-.21241
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.09994
; WIPE_END
G1 E-.04 F1800
G1 X137.603 Y121.193 Z6.2 F30000
G1 X140.845 Y124.596 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3187
G1 X140.85 Y124.625 E.00099
G1 X142.398 Y124.625 E.05136
G1 X142.398 Y127.375 E.09123
G1 X140.85 Y127.375 E.05136
G3 X139.885 Y131.01 I-14.931 J-2.017 E.12508
G3 X115.358 Y128.556 I-11.885 J-5.013 E1.08795
G1 X115.15 Y127.375 E.03977
G1 X113.602 Y127.375 E.05136
G1 X113.602 Y124.625 E.09124
G1 X115.15 Y124.625 E.05136
G3 X116.115 Y120.99 I14.935 J2.019 E.12507
G3 X128.434 Y113.112 I11.892 J5.024 E.51566
G3 X140.642 Y123.444 I-.441 J12.899 E.57216
G1 X140.834 Y124.537 E.03679
G1 X141.179 Y124.233 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3187
G1 X142.79 Y124.233 E.04951
G1 X142.79 Y127.767 E.10861
G1 X141.179 Y127.767 E.04951
G3 X114.821 Y127.767 I-13.179 J-1.78 E1.17399
G1 X113.21 Y127.767 E.04951
G1 X113.21 Y124.233 E.10861
G1 X114.782 Y124.233 E.04829
G1 X114.821 Y124.233 E.00121
G3 X141.171 Y124.174 I13.179 J1.783 E1.17201
M204 S10000
; WIPE_START
G1 F24000
G1 X142.79 Y124.233 E-.61577
G1 X142.79 Y124.612 E-.14423
; WIPE_END
G1 E-.04 F1800
G1 X137.675 Y118.948 Z6.2 F30000
G1 X137.52 Y118.776 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3187
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
M73 P36 R17
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.557 Y124.973 I-19.198 J4.919 E.07444
G1 X142.05 Y124.973 E.0495
G1 X142.05 Y127.027 E.06813
G1 X140.557 Y127.027 E.04951
G3 X140.125 Y129.227 I-19.615 J-2.714 E.07444
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3187
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3187
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.649 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.443 Y127.027 I19.187 J-4.916 E.07444
G1 X113.95 Y127.027 E.0495
G1 X113.95 Y124.973 E.06813
G1 X115.443 Y124.973 E.04951
G3 X115.875 Y122.773 I19.627 J2.717 E.07443
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3187
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.227 E.21656
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 42/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z6.2 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3170
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.495 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3170
G1 X131.036 Y115.209 E.01717
G3 X127.721 Y114.793 I-3.036 J10.789 E2.06087
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06687
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.23514
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.21241
G1 X132.338 Y115.667 E-.10005
; WIPE_END
G1 E-.04 F1800
G1 X137.608 Y121.188 Z6.4 F30000
G1 X140.841 Y124.576 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3170
G1 X140.846 Y124.605 E.00099
G1 X142.398 Y124.605 E.05148
G1 X142.398 Y127.395 E.09257
G1 X140.846 Y127.395 E.05148
G3 X139.62 Y131.596 I-14.498 J-1.95 E.14571
G3 X115.358 Y128.556 I-11.62 J-5.602 E1.06653
G1 X115.154 Y127.395 E.03909
G1 X113.602 Y127.395 E.05148
G1 X113.602 Y124.605 E.09257
G1 X115.154 Y124.605 E.05148
G3 X116.38 Y120.404 I14.503 J1.952 E.14571
G3 X128.439 Y113.112 I11.627 J5.612 E.49448
G3 X140.642 Y123.444 I-.446 J12.899 E.57201
G1 X140.83 Y124.516 E.03611
G1 X141.175 Y124.213 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3170
G1 X142.79 Y124.213 E.04962
G1 X142.79 Y127.787 E.10985
G1 X141.175 Y127.787 E.04962
G3 X114.825 Y127.787 I-13.175 J-1.799 E1.17274
G1 X113.21 Y127.787 E.04962
G1 X113.21 Y124.213 E.10985
G1 X114.825 Y124.213 E.04962
G3 X128.458 Y112.721 I13.184 J1.808 E.60039
G3 X141.167 Y124.153 I-.468 J13.3 E.57039
M204 S10000
; WIPE_START
G1 F24000
G1 X142.79 Y124.213 E-.61718
G1 X142.79 Y124.588 E-.14282
; WIPE_END
G1 E-.04 F1800
G1 X138.814 Y131.103 Z6.4 F30000
G1 X137.52 Y133.224 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3170
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.65 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.554 Y127.047 I-19.021 J-4.876 E.07376
G1 X142.05 Y127.047 E.04963
G1 X142.05 Y124.953 E.06946
G1 X140.554 Y124.953 E.04962
G2 X140.125 Y122.773 I-19.465 J2.698 E.07376
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3170
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.23 E.21656
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.439 J12.522 E.05401
G1 X118.48 Y118.776 F30000
G1 F3170
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.446 Y124.953 I19.036 J4.879 E.07376
G1 X113.95 Y124.953 E.04962
G1 X113.95 Y127.047 E.06946
G1 X115.446 Y127.047 E.04963
G2 X115.875 Y129.227 I19.452 J-2.695 E.07376
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3170
G2 X123.84 Y137.836 I5.937 J-11.887 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 43/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z6.4 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3186
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.495 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3186
G1 X131.036 Y115.209 E.01717
G3 X127.721 Y114.793 I-3.036 J10.789 E2.06087
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06687
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.23515
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.10005
; WIPE_END
G1 E-.04 F1800
G1 X137.608 Y121.188 Z6.6 F30000
G1 X140.841 Y124.576 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3186
G1 X140.846 Y124.605 E.00099
G1 X142.398 Y124.605 E.05148
G1 X142.398 Y127.395 E.09257
G1 X140.846 Y127.395 E.05148
G3 X139.62 Y131.596 I-14.498 J-1.95 E.14571
G3 X115.358 Y128.556 I-11.62 J-5.602 E1.06653
G1 X115.154 Y127.395 E.03909
G1 X113.602 Y127.395 E.05148
G1 X113.602 Y124.605 E.09257
G1 X115.154 Y124.605 E.05148
G3 X116.38 Y120.404 I14.503 J1.952 E.14571
G3 X128.443 Y113.112 I11.627 J5.611 E.49463
G3 X140.642 Y123.444 I-.45 J12.899 E.57186
G1 X140.83 Y124.516 E.03611
G1 X141.175 Y124.213 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3186
G1 X142.79 Y124.213 E.04962
G1 X142.79 Y127.787 E.10985
G1 X141.175 Y127.787 E.04962
G3 X114.825 Y127.787 I-13.175 J-1.799 E1.17274
G1 X113.21 Y127.787 E.04962
G1 X113.21 Y124.213 E.10985
G1 X114.825 Y124.213 E.04962
G3 X128.463 Y112.721 I13.184 J1.807 E.60054
G3 X141.167 Y124.153 I-.47 J13.297 E.57028
M204 S10000
; WIPE_START
G1 F24000
G1 X142.79 Y124.213 E-.61718
G1 X142.79 Y124.588 E-.14282
; WIPE_END
G1 E-.04 F1800
G1 X137.663 Y118.934 Z6.6 F30000
G1 X137.52 Y118.776 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3186
G2 X136.448 Y117.552 I-10.246 J7.884 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
M73 P37 R17
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.554 Y124.953 I-19.036 J4.879 E.07376
G1 X142.05 Y124.953 E.04962
G1 X142.05 Y127.047 E.06946
G1 X140.554 Y127.047 E.04963
G3 X140.125 Y129.227 I-19.451 J-2.695 E.07376
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.175 J-9.109 E.05401
G1 X133.658 Y137.2 F30000
G1 F3186
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3186
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.341 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.446 Y127.047 I19.023 J-4.876 E.07376
G1 X113.95 Y127.047 E.04963
G1 X113.95 Y124.953 E.06946
G1 X115.446 Y124.953 E.04962
G3 X115.875 Y122.773 I19.465 J2.698 E.07377
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3186
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.233 E.21656
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 44/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z6.6 I-.241 J-1.193 P1  F30000
G1 X130.591 Y114.691 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3170
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3170
G1 X130.494 Y115.071 E0
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X129.947 Y114.96 I-.279 J11.205 E.05153
G1 X130.436 Y115.059 E.01533
M204 S10000
; WIPE_START
G1 F24000
G1 X130.494 Y115.071 E-.02284
G1 X131.036 Y115.209 E-.21241
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.09995
; WIPE_END
G1 E-.04 F1800
G1 X137.605 Y121.191 Z6.8 F30000
G1 X140.879 Y124.625 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3170
G1 X142.398 Y124.625 E.05037
G1 X142.398 Y127.375 E.09123
G1 X140.85 Y127.375 E.05136
G3 X139.885 Y131.01 I-14.924 J-2.015 E.12509
G3 X115.358 Y128.556 I-11.885 J-5.014 E1.08793
G1 X115.15 Y127.375 E.03978
G1 X113.602 Y127.375 E.05136
G1 X113.602 Y124.625 E.09123
G1 X115.15 Y124.625 E.05136
G3 X116.115 Y120.99 I14.928 J2.016 E.12508
G3 X128.448 Y113.113 I11.891 J5.024 E.51611
G3 X140.642 Y123.444 I-.444 J12.887 E.57181
G1 X140.844 Y124.595 E.03877
G1 X141.179 Y124.233 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3170
G1 X142.79 Y124.233 E.04951
G1 X142.79 Y127.767 E.10861
G1 X141.179 Y127.767 E.04951
G3 X114.821 Y127.767 I-13.179 J-1.78 E1.17401
G1 X113.21 Y127.767 E.04951
G1 X113.21 Y124.233 E.10861
G1 X114.821 Y124.233 E.04951
G3 X128.467 Y112.721 I13.187 J1.787 E.60132
G3 X141.171 Y124.174 I-.48 J13.304 E.57073
M204 S10000
; WIPE_START
G1 F24000
G1 X142.79 Y124.233 E-.61581
G1 X142.79 Y124.612 E-.14419
; WIPE_END
G1 E-.04 F1800
G1 X138.806 Y131.122 Z6.8 F30000
G1 X137.52 Y133.224 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3170
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.649 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.557 Y127.026 I-19.167 J-4.911 E.07445
G1 X142.05 Y127.027 E.04951
G1 X142.05 Y124.973 E.06812
G1 X140.557 Y124.973 E.04951
G2 X140.125 Y122.773 I-19.609 J2.713 E.07444
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3170
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.236 E.21656
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3170
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.443 Y124.973 I19.177 J4.914 E.07444
G1 X113.95 Y124.973 E.04951
G1 X113.95 Y127.027 E.06812
G1 X115.443 Y127.026 E.04951
G2 X115.875 Y129.227 I19.599 J-2.71 E.07445
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3170
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 45/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z6.8 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3185
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.495 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3185
G1 X131.036 Y115.209 E.01717
G3 X127.721 Y114.793 I-3.036 J10.789 E2.06087
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06687
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.23516
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.10004
; WIPE_END
G1 E-.04 F1800
G1 X137.594 Y121.202 Z7 F30000
G1 X140.883 Y124.666 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3185
G1 X142.398 Y124.666 E.05024
G1 X142.398 Y127.334 E.08851
G1 X140.854 Y127.334 E.05122
G3 X140.325 Y129.802 I-16.669 J-2.284 E.08381
G3 X115.358 Y128.556 I-12.325 J-3.805 E1.13057
G1 X115.146 Y127.334 E.04116
G1 X113.602 Y127.334 E.05122
G1 X113.602 Y124.666 E.08852
G1 X115.146 Y124.666 E.05122
G3 X115.675 Y122.198 I16.669 J2.284 E.08379
G3 X128.452 Y113.113 I12.331 J3.814 E.55892
G3 X140.642 Y123.444 I-.448 J12.886 E.57164
G1 X140.849 Y124.636 E.04014
G1 X141.184 Y124.274 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3185
G1 X142.79 Y124.274 E.04935
G1 X142.79 Y127.726 E.10609
G1 X141.184 Y127.726 E.04935
G3 X114.816 Y127.726 I-13.184 J-1.738 E1.17654
G1 X113.21 Y127.726 E.04935
G1 X113.21 Y124.274 E.10609
G1 X114.816 Y124.274 E.04936
G3 X128.472 Y112.721 I13.191 J1.745 E.60272
G3 X141.176 Y124.214 I-.484 J13.302 E.57185
M204 S10000
; WIPE_START
G1 F24000
G1 X142.79 Y124.274 E-.61382
G1 X142.79 Y124.658 E-.14618
; WIPE_END
G1 E-.04 F1800
G1 X137.697 Y118.974 Z7 F30000
G1 X137.52 Y118.776 Z7
G1 Z6.6
M73 P38 R17
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3185
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.561 Y125.014 I-18.824 J4.828 E.0758
G1 X142.05 Y125.014 E.04939
G1 X142.05 Y126.986 E.06541
G1 X140.561 Y126.985 E.04939
G3 X140.125 Y129.227 I-19.256 J-2.584 E.07581
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.175 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3185
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3185
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.439 Y126.985 I18.82 J-4.826 E.07581
G1 X113.95 Y126.986 E.04939
G1 X113.95 Y125.014 E.06541
G1 X115.439 Y125.014 E.04939
G3 X115.875 Y122.773 I19.258 J2.585 E.07579
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3185
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.239 E.21656
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 46/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z7 I-.241 J-1.193 P1  F30000
G1 X130.591 Y114.691 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3169
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3169
G1 X130.494 Y115.071 E0
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X129.947 Y114.96 I-.279 J11.205 E.05153
G1 X130.436 Y115.059 E.01533
M204 S10000
; WIPE_START
G1 F24000
G1 X130.494 Y115.071 E-.02283
G1 X131.036 Y115.209 E-.21241
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.21241
G1 X132.338 Y115.667 E-.09996
; WIPE_END
G1 E-.04 F1800
G1 X137.575 Y121.22 Z7.2 F30000
G1 X140.884 Y124.729 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3169
G1 X142.398 Y124.729 E.05022
G1 X142.398 Y127.271 E.08433
G1 X140.849 Y127.271 E.0514
G3 X136.042 Y136.084 I-13.046 J-1.399 E.3417
G3 X115.243 Y127.903 I-8.039 J-10.091 E.89654
G1 X115.151 Y127.271 E.02117
G1 X113.602 Y127.271 E.0514
G1 X113.602 Y124.729 E.08433
G1 X115.152 Y124.729 E.0514
G3 X119.958 Y115.916 I13.044 J1.398 E.34169
G3 X128.457 Y113.113 I8.051 J10.125 E.30311
G3 X140.757 Y124.099 I-.457 J12.89 E.59354
G1 X140.845 Y124.704 E.02028
G1 X141.188 Y124.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3169
G1 X142.79 Y124.337 E.04923
G1 X142.79 Y127.663 E.10221
G1 X141.188 Y127.663 E.04923
G3 X114.812 Y127.663 I-13.188 J-1.67 E1.18032
G1 X113.21 Y127.663 E.04923
G1 X113.21 Y124.337 E.10221
G1 X114.812 Y124.337 E.04923
G3 X128.476 Y112.721 I13.194 J1.677 E.60473
G3 X141.18 Y124.277 I-.484 J13.293 E.57361
M204 S10000
; WIPE_START
G1 F24000
G1 X142.79 Y124.337 E-.61218
G1 X142.79 Y124.726 E-.14782
; WIPE_END
G1 E-.04 F1800
G1 X138.767 Y131.212 Z7.2 F30000
G1 X137.52 Y133.224 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3169
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.552 Y126.923 I-16.351 J-4.224 E.07781
G1 X142.05 Y126.923 E.04969
G1 X142.05 Y125.077 E.06123
G1 X140.552 Y125.077 E.04968
G2 X140.125 Y122.773 I-16.803 J1.925 E.0778
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3169
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.242 E.21656
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3169
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.649 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.448 Y125.077 I16.336 J4.22 E.0778
G1 X113.95 Y125.077 E.04969
G1 X113.95 Y126.923 E.06123
G1 X115.448 Y126.923 E.04969
G2 X115.875 Y129.227 I16.779 J-1.919 E.07781
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3169
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 47/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z7.2 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3182
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.495 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3182
G1 X131.036 Y115.209 E.01717
G3 X127.721 Y114.793 I-3.036 J10.789 E2.06087
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06687
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.23517
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.10003
; WIPE_END
G1 E-.04 F1800
G1 X137.551 Y121.242 Z7.4 F30000
G1 X140.894 Y124.816 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3182
G1 X142.398 Y124.816 E.04989
G1 X142.398 Y127.183 E.07852
G1 X140.859 Y127.184 E.05106
G3 X136.534 Y135.671 I-13.086 J-1.323 E.32331
G3 X115.243 Y127.904 I-8.532 J-9.678 E.91783
G1 X115.141 Y127.184 E.02414
G1 X113.602 Y127.183 E.05106
G1 X113.602 Y124.817 E.07851
G1 X115.141 Y124.816 E.05106
G3 X119.466 Y116.329 I13.088 J1.324 E.3233
G3 X128.461 Y113.113 I8.527 J9.662 E.32464
G3 X140.757 Y124.098 I-.46 J12.889 E.59335
G1 X140.855 Y124.791 E.02323
G1 X141.199 Y124.424 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3182
G1 X142.79 Y124.425 E.04888
G1 X142.79 Y127.575 E.09682
G1 X141.199 Y127.576 E.04889
G3 X114.801 Y127.576 I-13.199 J-1.584 E1.18572
G1 X113.21 Y127.575 E.04889
G1 X113.21 Y124.425 E.09682
G1 X114.801 Y124.424 E.04888
G3 X128.481 Y112.722 I13.206 J1.59 E.60758
G3 X141.192 Y124.364 I-.489 J13.294 E.57619
M204 S10000
; WIPE_START
G1 F24000
G1 X142.79 Y124.425 E-.60775
G1 X142.79 Y124.825 E-.15225
; WIPE_END
G1 E-.04 F1800
G1 X137.776 Y119.07 Z7.4 F30000
G1 X137.52 Y118.776 Z7.4
G1 Z7
M73 P39 R17
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3182
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.561 Y125.164 I-16.303 J4.212 E.08071
G1 X142.05 Y125.165 E.04938
G1 X142.05 Y126.835 E.05542
G1 X140.561 Y126.835 E.04938
G3 X140.125 Y129.227 I-16.721 J-1.815 E.08073
G1 X139.202 Y130.15 E.04326
G1 X139.363 Y129.687 E.01625
G1 X139.837 Y130.161 E.02223
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G3 X135.222 Y135.517 I-14.201 J-15.061 E.05398
G1 X133.658 Y137.2 F30000
G1 F3182
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.523 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3182
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.341 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.439 Y126.835 I16.284 J-4.207 E.08073
G1 X113.95 Y126.835 E.04938
G1 X113.95 Y125.165 E.05541
G1 X115.439 Y125.164 E.04938
G3 X115.875 Y122.773 I16.733 J1.818 E.08072
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3182
G3 X123.84 Y114.164 I5.937 J11.887 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.245 E.21656
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 48/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z7.4 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3167
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3167
G1 X130.494 Y115.071 E0
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X129.947 Y114.96 I-.279 J11.205 E.05153
G1 X130.436 Y115.059 E.01533
M204 S10000
; WIPE_START
G1 F24000
G1 X130.494 Y115.071 E-.02282
G1 X131.036 Y115.209 E-.21241
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.09997
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y121.271 Z7.6 F30000
G1 X140.906 Y124.932 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3167
G1 X142.398 Y124.932 E.04949
G1 X142.398 Y127.068 E.07083
G1 X140.871 Y127.068 E.05064
G3 X138.657 Y133.266 I-13.454 J-1.313 E.22055
G3 X115.244 Y127.905 I-10.655 J-7.272 E1.02444
G1 X115.129 Y127.068 E.02805
G1 X113.602 Y127.068 E.05064
G1 X113.602 Y124.932 E.07083
G1 X115.129 Y124.932 E.05064
G3 X117.343 Y118.734 I13.451 J1.313 E.22053
G3 X128.466 Y113.113 I10.661 J7.28 E.4314
G3 X140.757 Y124.097 I-.472 J12.897 E.59308
G1 X140.868 Y124.907 E.02714
G1 X141.213 Y124.54 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3167
G1 X142.79 Y124.54 E.04845
G1 X142.79 Y127.46 E.08971
G1 X141.213 Y127.46 E.04845
G3 X114.787 Y127.46 I-13.213 J-1.468 E1.19296
G1 X113.21 Y127.46 E.04845
G1 X113.21 Y124.54 E.08971
G1 X114.787 Y124.54 E.04845
G3 X128.485 Y112.722 I13.216 J1.471 E.61136
G3 X141.206 Y124.48 I-.49 J13.291 E.57968
M204 S10000
; WIPE_START
G1 F24000
G1 X142.79 Y124.54 E-.60219
G1 X142.79 Y124.956 E-.15781
; WIPE_END
G1 E-.04 F1800
M73 P39 R16
G1 X138.688 Y131.392 Z7.6 F30000
G1 X137.52 Y133.224 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3167
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.568 Y126.719 I-23.29 J-5.41 E.08453
G1 X142.05 Y126.719 E.04916
G1 X142.05 Y125.28 E.04773
G1 X140.567 Y125.28 E.04917
G2 X140.125 Y122.773 I-23.697 J2.893 E.08451
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3167
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.248 E.21656
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3167
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.432 Y125.28 I23.316 J5.414 E.08451
G1 X113.95 Y125.28 E.04916
G1 X113.95 Y126.719 E.04773
G1 X115.432 Y126.719 E.04916
G2 X115.875 Y129.227 I23.734 J-2.902 E.08453
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.493 J-1.796 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3167
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 49/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z7.6 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3277
G1 X130.582 Y114.688 E.00031
G3 X117.255 Y121.631 I-2.58 J11.309 E1.87545
G1 X117.255 Y121.631 E0
G3 X127.711 Y114.401 I10.745 J4.364 E.44631
G3 X130.015 Y114.574 I.291 J11.596 E.07677
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3277
G3 X127.721 Y114.793 I-2.494 J10.929 E2.07837
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.207 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.476 Y121.311 Z7.8 F30000
G1 X140.91 Y125.082 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3277
G1 X142.398 Y125.082 E.04937
G1 X142.398 Y126.917 E.06086
G1 X140.886 Y126.917 E.05015
G3 X140.12 Y130.411 I-14.415 J-1.33 E.11896
G3 X115.244 Y127.907 I-12.119 J-4.416 E1.13106
G1 X115.114 Y126.917 E.03312
G1 X113.602 Y126.917 E.05015
G1 X113.602 Y125.083 E.06086
G1 X115.114 Y125.082 E.05015
G3 X115.88 Y121.589 I14.407 J1.329 E.11894
G3 X128.47 Y113.114 I12.118 J4.413 E.53825
G3 X140.756 Y124.095 I-.476 J12.896 E.59287
G1 X140.882 Y125.046 E.03181
G1 X141.23 Y124.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3277
G1 X142.79 Y124.691 E.04793
G1 X142.79 Y127.309 E.08047
G1 X141.23 Y127.309 E.04793
G3 X114.77 Y127.309 I-13.23 J-1.319 E1.20226
G1 X113.21 Y127.309 E.04793
G1 X113.21 Y124.691 E.08047
G1 X114.77 Y124.69 E.04794
M73 P40 R16
G3 X128.49 Y112.722 I13.235 J1.324 E.61614
G3 X141.224 Y124.63 I-.495 J13.293 E.58419
M204 S10000
; WIPE_START
G1 F24000
G1 X142.79 Y124.691 E-.59551
G1 X142.79 Y125.123 E-.16449
; WIPE_END
G1 E-.04 F1800
G1 X140.494 Y126.103 Z7.8 F30000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3277
G1 X140.775 Y126.402 E.0126
G1 X140.816 Y126.525 E.004
G1 X142.006 Y126.525 E.03656
G1 X142.006 Y125.474 E.03229
G1 X140.829 Y125.474 E.03616
G1 X140.806 Y125.701 E.00701
G1 X140.498 Y125.997 E.01313
G1 X140.496 Y126.043 E.00142
G1 X140.948 Y126.064 F30000
; LINE_WIDTH: 0.379887
G1 F3277
G1 X141.06 Y126.168 E.0042
G1 X141.649 Y126.168 E.01617
G1 X141.649 Y125.831 E.00925
G1 X141.119 Y125.831 E.01455
G3 X140.991 Y126.023 I-.402 J-.129 E.00641
; WIPE_START
G1 F24000
G1 X141.119 Y125.831 E-.09529
G1 X141.649 Y125.831 E-.21888
G1 X141.649 Y126.168 E-.1392
G1 X141.06 Y126.168 E-.24338
G1 X140.948 Y126.064 E-.06326
; WIPE_END
G1 E-.04 F1800
G1 X134.418 Y122.111 Z7.8 F30000
G1 X122.342 Y114.8 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3277
G3 X123.84 Y114.164 I5.937 J11.887 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.251 E.21655
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
G1 X137.52 Y118.776 F30000
G1 F3277
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.538 Y125.107 I-21.274 J4.975 E.0787
G2 X140.439 Y125.514 I.135 J.248 E.01563
G1 X140.111 Y125.822 E.01493
G1 X140.097 Y126.253 E.0143
G1 X140.425 Y126.602 E.01589
G2 X140.538 Y126.893 I.188 J.095 E.01169
G3 X140.125 Y129.227 I-21.6 J-2.624 E.07867
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3277
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3277
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.462 Y126.891 I21.192 J-4.959 E.07874
G1 X115.586 Y126.754 E.00615
G3 X115.47 Y125.827 I6.834 J-1.327 E.03102
G2 X115.591 Y125.249 I-.756 J-.459 E.01995
G1 X115.462 Y125.106 E.00638
G3 X115.875 Y122.773 I21.614 J2.626 E.07865
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X115.173 Y125.474 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3277
G1 X113.994 Y125.474 E.03621
G1 X113.994 Y126.525 E.03228
G1 X115.17 Y126.525 E.03614
G1 X115.078 Y126.257 E.00871
G1 X115.078 Y125.743 E.01579
G1 X115.153 Y125.531 E.00692
G1 X114.721 Y125.831 F30000
; LINE_WIDTH: 0.379807
G1 F3277
G1 X114.351 Y125.831 E.01016
G1 X114.351 Y126.168 E.00925
G1 X114.721 Y126.168 E.01016
G1 X114.721 Y125.891 E.0076
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.721 Y126.168 E-.15547
G1 X114.351 Y126.168 E-.20772
G1 X114.351 Y125.831 E-.18909
G1 X114.721 Y125.831 E-.20773
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 50/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z7.8 I.7 J.996 P1  F30000
G1 X130.572 Y114.687 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3299
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3299
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.422 Y121.36 Z8 F30000
G1 X140.923 Y125.28 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3299
G1 X142.398 Y125.279 E.04892
G1 X142.398 Y126.721 E.04781
G1 X140.896 Y126.72 E.04981
G3 X138.281 Y133.788 I-13.314 J-.908 E.25343
G3 X115.198 Y127.572 I-10.28 J-7.794 E1.01427
G1 X115.104 Y126.72 E.02843
G1 X113.602 Y126.721 E.04981
G1 X113.602 Y125.279 E.0478
G1 X115.103 Y125.28 E.0498
G3 X116.994 Y119.275 I13.419 J.925 E.21081
G3 X128.964 Y113.138 I11.018 J6.75 E.46927
G3 X140.796 Y124.383 I-.965 J12.863 E.58627
G1 X140.894 Y125.246 E.0288
G1 X141.248 Y124.888 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3299
G1 X142.79 Y124.887 E.04739
G1 X142.79 Y127.113 E.06839
G1 X141.247 Y127.112 E.04741
G3 X114.753 Y127.112 I-13.247 J-1.121 E1.21438
G1 X113.21 Y127.113 E.04741
G1 X113.21 Y124.887 E.06838
G1 X114.753 Y124.888 E.0474
G3 X128.993 Y112.747 I13.259 J1.13 E.6377
G3 X141.242 Y124.828 I-1.009 J13.274 E.57477
M204 S10000
; WIPE_START
G1 F24000
G1 X142.79 Y124.887 E-.58853
G1 X142.79 Y125.338 E-.17147
; WIPE_END
G1 E-.04 F1800
G1 X139.893 Y122.03 Z8 F30000
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3299
G1 X139.642 Y122.29 E.01199
G1 X139.208 Y121.856 E.02036
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3299
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3299
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X116.354 Y122.294 E.02056
G1 X116.098 Y122.032 E.01214
G1 X116.347 Y123.048 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.48887
G1 F3299
G1 X116.376 Y122.927 E.00453
G1 X116.017 Y122.561 E.01862
G2 X115.595 Y124.744 I12.068 J3.471 E.08089
G1 X115.529 Y125.351 E.02219
; LINE_WIDTH: 0.52231
G1 X115.501 Y125.48 E.00516
; LINE_WIDTH: 0.571102
G1 X115.473 Y125.609 E.00568
; LINE_WIDTH: 0.603861
G1 X115.445 Y125.738 E.00604
G1 X114.322 Y125.742 E.05131
; LINE_WIDTH: 0.559549
G1 X114.064 Y125.742 E.01088
G1 X114.064 Y126.258 E.02176
G1 X115.284 Y126.258 E.05137
; LINE_WIDTH: 0.580547
G1 X115.365 Y126.26 E.00353
; LINE_WIDTH: 0.623043
G1 X115.445 Y126.262 E.0038
; LINE_WIDTH: 0.61987
G1 X115.473 Y126.391 E.00621
; LINE_WIDTH: 0.571028
G1 X115.501 Y126.52 E.00568
; LINE_WIDTH: 0.522187
G1 X115.529 Y126.649 E.00516
; LINE_WIDTH: 0.487646
G2 X116.018 Y129.447 I14.105 J-1.02 E.1031
G1 X116.375 Y129.08 E.01858
G3 X115.982 Y126.605 I12.879 J-3.316 E.09093
; LINE_WIDTH: 0.522187
G1 X115.953 Y126.406 E.00787
; LINE_WIDTH: 0.571028
G1 X115.923 Y126.207 E.00867
; LINE_WIDTH: 0.61987
G1 X115.894 Y126.007 E.00947
; LINE_WIDTH: 0.620023
G1 X115.923 Y125.807 E.00953
; LINE_WIDTH: 0.571487
G1 X115.952 Y125.606 E.00873
; LINE_WIDTH: 0.522951
G1 X115.981 Y125.406 E.00793
; LINE_WIDTH: 0.489583
G3 X116.333 Y123.106 I13.013 J.814 E.08479
G1 X116.103 Y129.969 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3299
G1 X116.357 Y129.709 E.01205
G1 X116.792 Y130.144 E.02044
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.175 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3299
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
G1 X137.52 Y133.224 F30000
G1 F3299
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X139.646 Y129.706 E.02057
G1 X139.902 Y129.968 E.01214
G1 X139.653 Y128.952 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.488844
G1 F3299
G1 X139.624 Y129.073 E.00453
G1 X139.983 Y129.438 E.01861
G2 X140.405 Y127.256 I-12.043 J-3.465 E.08087
G1 X140.471 Y126.649 E.02219
; LINE_WIDTH: 0.522239
G1 X140.501 Y126.519 E.00523
; LINE_WIDTH: 0.571185
G1 X140.531 Y126.388 E.00576
; LINE_WIDTH: 0.604101
G1 X140.561 Y126.258 E.00612
G1 X141.677 Y126.258 E.05104
; LINE_WIDTH: 0.559663
G1 X141.936 Y126.258 E.01089
G1 X141.936 Y125.741 E.02177
G1 X140.716 Y125.742 E.05136
; LINE_WIDTH: 0.580746
G1 X140.633 Y125.738 E.00365
; LINE_WIDTH: 0.623318
G1 X140.55 Y125.734 E.00394
; LINE_WIDTH: 0.622393
G1 X140.528 Y125.659 E.00364
; LINE_WIDTH: 0.577969
G1 X140.506 Y125.585 E.00336
; LINE_WIDTH: 0.533546
G1 X140.484 Y125.511 E.00309
; LINE_WIDTH: 0.489349
G2 X139.982 Y122.55 I-14.489 J.937 E.10946
G1 X139.624 Y122.918 E.01867
G3 X140.018 Y125.551 I-11.506 J3.067 E.09704
; LINE_WIDTH: 0.533546
G1 X140.048 Y125.703 E.00619
; LINE_WIDTH: 0.577969
G1 X140.077 Y125.855 E.00676
; LINE_WIDTH: 0.622393
G1 X140.107 Y126.008 E.00732
; LINE_WIDTH: 0.620259
G1 X140.077 Y126.203 E.0093
; LINE_WIDTH: 0.571569
G1 X140.048 Y126.399 E.00852
; LINE_WIDTH: 0.522879
G1 X140.019 Y126.594 E.00773
; LINE_WIDTH: 0.489512
G3 X139.667 Y128.894 I-13.01 J-.813 E.08476
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P41 R16
G1 F24000
G1 X139.79 Y128.378 E-.20148
G1 X139.895 Y127.784 E-.229
G1 X139.985 Y126.922 E-.32952
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 51/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z8 I.965 J-.741 P1  F30000
G1 X130.591 Y114.691 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3333
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3333
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.348 Y121.425 Z8.2 F30000
G1 X140.937 Y125.548 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3333
G1 X142.398 Y125.549 E.04847
G1 X142.398 Y126.451 E.0299
G1 X140.911 Y126.451 E.04933
G3 X139.327 Y132.168 I-13.71 J-.719 E.19836
G3 X115.185 Y127.461 I-11.326 J-6.173 E1.08201
G1 X115.088 Y126.451 E.03365
G1 X113.602 Y126.451 E.04929
G1 X113.602 Y125.55 E.02989
G1 X115.089 Y125.549 E.04933
G3 X116.673 Y119.832 I13.714 J.72 E.19837
G3 X128.479 Y113.114 I11.33 J6.18 E.47451
G3 X140.816 Y124.553 I-.481 J12.891 E.60794
G1 X140.908 Y125.514 E.03201
G1 X141.268 Y125.156 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3333
G1 X142.79 Y125.157 E.04677
G1 X142.79 Y126.843 E.05178
G1 X141.268 Y126.843 E.04678
G3 X114.732 Y126.843 I-13.268 J-.852 E1.231
G1 X113.21 Y126.843 E.04676
G1 X113.21 Y125.158 E.05178
G1 X114.732 Y125.157 E.04677
G3 X128.499 Y112.723 I13.273 J.856 E.63079
G3 X141.264 Y125.096 I-.507 J13.295 E.59824
M204 S10000
; WIPE_START
G1 F24000
G1 X142.79 Y125.157 E-.58037
G1 X142.79 Y125.63 E-.17963
; WIPE_END
G1 E-.04 F1800
G1 X140.733 Y126.248 Z8.2 F30000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.537893
G1 F3333
G1 X140.997 Y126 E.01462
G1 X142.194 Y126 E.04829
; WIPE_START
G1 F24000
G1 X140.997 Y126 E-.58342
G1 X140.733 Y126.248 E-.17658
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.13 J-.451 P1  F30000
G1 X139.653 Y128.952 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.488859
G1 F3333
G1 X139.624 Y129.073 E.00453
G1 X139.983 Y129.438 E.01861
G2 X140.4 Y127.253 I-11.32 J-3.296 E.08097
G3 X140.467 Y126.588 I44.437 J4.092 E.02429
G1 X140.095 Y126.198 E.01957
G1 X140.034 Y126.076 E.00495
G3 X139.667 Y128.894 I-12.728 J-.224 E.10345
G1 X140.008 Y125.449 F30000
; LINE_WIDTH: 0.490316
G1 F3333
G1 X140.037 Y125.989 E.0197
G1 X140.104 Y125.875 E.00482
G1 X140.475 Y125.528 E.01853
G2 X139.982 Y122.55 I-13.877 J.77 E.11024
G1 X139.624 Y122.918 E.01871
G3 X140.004 Y125.389 I-10.806 J2.926 E.09132
G1 X139.902 Y129.968 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3333
G1 X139.646 Y129.706 E.01214
G1 X139.208 Y130.144 E.02057
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3333
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3333
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X116.357 Y129.709 E.02044
G1 X116.103 Y129.969 E.01205
G1 X115.003 Y126 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.537651
G1 F3333
G1 X113.806 Y126 E.04828
; WIPE_START
G1 F24000
G1 X115.003 Y126 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I1.108 J.504 P1  F30000
G1 X116.347 Y123.048 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.487597
G1 F3333
G1 X116.376 Y122.927 E.00451
G1 X116.017 Y122.561 E.01856
G2 X115.6 Y124.747 I11.332 J3.299 E.08076
G1 X115.54 Y125.354 E.02212
; LINE_WIDTH: 0.520573
G1 X115.488 Y125.87 E.02018
G1 X115.454 Y125.895 E.00164
G1 X115.454 Y126.105 E.00818
G1 X115.505 Y126.225 E.00509
; LINE_WIDTH: 0.490136
G2 X116.018 Y129.447 I14.819 J-.706 E.11912
G1 X116.375 Y129.08 E.01868
G3 X116.333 Y123.106 I11.581 J-3.07 E.22002
G1 X116.098 Y122.032 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3333
G1 X116.354 Y122.294 E.01214
G1 X116.792 Y121.856 E.02056
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3333
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.257 E.21655
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
G1 X137.52 Y118.776 F30000
G1 F3333
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X139.642 Y122.29 E.02036
G1 X139.893 Y122.03 E.01199
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.642 Y122.29 E-.13734
G1 X139.208 Y121.856 E-.23324
G1 X139.364 Y122.312 E-.18331
G1 X139.748 Y121.928 E-.20611
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 52/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z8.2 I.755 J-.955 P1  F30000
G1 X130.591 Y114.691 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3515
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3515
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X136.918 Y121.772 Z8.4 F30000
G1 X140.41 Y126.426 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3515
G1 X140.356 Y127.94 E.05025
G1 X140.75 Y127.94 E.01308
G3 X115.25 Y127.94 I-12.75 J-1.944 E1.21461
G1 X115.623 Y127.94 E.01237
G3 X115.613 Y124.06 I47.832 J-2.061 E.12874
G1 X115.25 Y124.06 E.01204
G3 X128.484 Y113.114 I12.754 J1.947 E.62334
G3 X140.75 Y124.059 I-.488 J12.893 E.59121
G1 X140.37 Y124.059 E.0126
G3 X140.418 Y126.09 I-33.806 J1.813 E.06741
G1 X140.411 Y126.366 E.00917
; WIPE_START
G1 F24000
G1 X140.356 Y127.94 E-.59838
G1 X140.75 Y127.94 E-.14979
G1 X140.744 Y127.971 E-.01182
; WIPE_END
G1 E-.04 F1800
G1 X141.289 Y125.587 Z8.4 F30000
G1 Z8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3515
G1 X142.79 Y125.586 E.04613
G1 X142.79 Y126.413 E.02541
G1 X141.288 Y126.413 E.04615
G3 X114.711 Y126.413 I-13.289 J-.422 E1.25748
G1 X113.21 Y126.413 E.04612
G1 X113.21 Y125.587 E.02541
G1 X114.713 Y125.587 E.04618
G3 X128.503 Y112.723 I13.294 J.427 E.64412
G3 X141.287 Y125.527 I-.513 J13.295 E.61133
M204 S10000
G1 X141.926 Y126.206 F30000
M204 S2000
; FEATURE: Top surface
G1 F3515
G1 X142.338 Y125.794 E.01789
G1 X141.804 Y125.794
G1 X141.393 Y126.205 E.01788
G1 X141.036 Y127.096
G1 X140.594 Y127.538 E.01921
G1 X140.615 Y126.983
G1 X141.074 Y126.525 E.01991
G1 X140.637 Y126.428
G1 X141.271 Y125.794 E.02756
G1 X141.073 Y125.459
G1 X140.643 Y125.889 E.01867
G1 X140.631 Y125.368
G1 X141.04 Y124.958 E.01778
G1 X140.993 Y124.473
G1 X140.616 Y124.849 E.01637
M204 S10000
; WIPE_START
G1 F24000
G1 X140.993 Y124.473 E-.20247
G1 X141.04 Y124.958 E-.18543
G1 X140.631 Y125.368 E-.21993
G1 X140.64 Y125.768 E-.15217
; WIPE_END
G1 E-.04 F1800
G1 X142.525 Y126.225 Z8.4 F30000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.195746
G1 F3515
G1 X142.525 Y125.873 E.00438
G1 X142.484 Y125.775 E.00132
; WIPE_START
G1 F24000
G1 X142.525 Y125.873 E-.17638
G1 X142.525 Y126.225 E-.58362
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-.844 J-.877 P1  F30000
G1 X140.993 Y127.698 Z8.4
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.119669
G1 F3515
G1 X140.569 Y127.698 E.00265
G1 X140.714 Y125.96 F30000
; LINE_WIDTH: 0.110911
G1 F3515
G1 X140.625 Y126.173 E.00128
G1 X140.998 Y124.352 F30000
; LINE_WIDTH: 0.142405
G1 F3515
G1 X140.891 Y124.307 E.00094
G1 X140.581 Y124.307 E.00251
G1 X139.944 Y124.503 F30000
; LINE_WIDTH: 0.527696
G1 F3515
G1 X139.921 Y124.209 E.01164
; LINE_WIDTH: 0.549243
G1 X139.885 Y123.855 E.01468
G1 X139.944 Y124.503 F30000
; LINE_WIDTH: 0.499042
G1 F3515
G1 X139.967 Y124.808 E.01136
; LINE_WIDTH: 0.463289
G1 X139.998 Y125.406 E.02052
G3 X139.963 Y127.203 I-15.503 J.592 E.06157
; LINE_WIDTH: 0.490436
G1 X139.939 Y127.496 E.01074
; LINE_WIDTH: 0.517638
G1 X139.877 Y128.143 E.02515
G1 X140.257 Y128.408 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3515
G1 X139.827 Y128.838 E.0187
M204 S10000
G1 X140.424 Y128.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.193388
G1 F3515
G3 X140.383 Y128.429 I-1.489 J-.07 E.00354
; LINE_WIDTH: 0.16775
G1 X140.349 Y128.426 E.00035
; LINE_WIDTH: 0.123143
G1 X140.315 Y128.424 E.00022
; LINE_WIDTH: 0.100839
G1 X140.277 Y128.406 E.0002
G1 X140.332 Y128.245 F30000
; LINE_WIDTH: 0.107934
G1 F3515
G1 X140.411 Y128.52 E.00152
G1 X140.391 Y128.742 E.00118
G1 X137.52 Y133.224 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3515
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
M73 P42 R16
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.652 J-1.341 E.01601
G1 X140.01 Y129.342 E.03765
G1 X139.589 Y128.913 E.01993
G3 X139.428 Y129.495 I-5.904 J-1.329 E.02003
G1 X140.316 Y123.016 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3515
G1 X139.679 Y123.653 E.02767
M204 S10000
G1 X140.436 Y123.855 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.171042
G1 F3515
G1 X140.401 Y123.598 E.00271
; LINE_WIDTH: 0.183812
G1 X140.373 Y123.551 E.00063
; LINE_WIDTH: 0.223254
G1 X140.344 Y123.504 E.0008
; LINE_WIDTH: 0.255145
G1 X140.329 Y123.493 E.00033
; LINE_WIDTH: 0.267315
G1 X140.199 Y123.399 E.00292
G1 X140.324 Y122.983 F30000
; LINE_WIDTH: 0.174465
G1 F3515
G1 X140.219 Y122.825 E.00204
; LINE_WIDTH: 0.166147
G1 X140.186 Y122.839 E.00036
; LINE_WIDTH: 0.127152
G1 X140.153 Y122.853 E.00024
G1 X139.532 Y123.484 E.00608
G1 X139.428 Y122.505 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3515
G3 X139.588 Y123.083 I-5.708 J1.9 E.01991
G1 X140.006 Y122.654 E.01986
G1 X139.208 Y121.856 E.03744
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.173 J9.107 E.05401
G1 X133.658 Y114.8 F30000
G1 F3515
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04316
G2 X124.772 Y113.876 I-3.228 J12.26 E.21655
G1 X123.852 Y114.796 E.04316
G3 X124.311 Y114.635 I1.84 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3515
G3 X119.552 Y117.552 I10.246 J7.884 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.99 Y122.658 E.03763
G1 X116.411 Y123.087 E.01992
G3 X116.572 Y122.505 I5.904 J1.329 E.02002
G1 X116.173 Y123.162 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3515
G1 X115.737 Y123.598 E.01894
M204 S10000
G1 X115.588 Y123.615 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151545
G1 F3515
G1 X115.555 Y123.857 E.00216
G1 X115.604 Y123.282 F30000
; LINE_WIDTH: 0.0904922
G1 F3515
G2 X115.62 Y123.605 I.422 J.141 E.00129
G1 X116.105 Y123.857 F30000
; LINE_WIDTH: 0.564442
G1 F3515
G1 X116.071 Y124.208 E.01501
; LINE_WIDTH: 0.54155
G1 X116.05 Y124.502 E.01198
; LINE_WIDTH: 0.509778
G1 X116.028 Y124.808 E.01164
; LINE_WIDTH: 0.466946
G1 X116 Y125.406 E.02071
G2 X116.031 Y127.203 I19.192 J.564 E.06212
; LINE_WIDTH: 0.50396
G1 X116.053 Y127.497 E.01107
; LINE_WIDTH: 0.535574
G1 X116.11 Y128.143 E.02604
G1 X116.322 Y128.346 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3515
G1 X115.684 Y128.984 E.02773
M204 S10000
G1 X115.802 Y128.599 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.286713
G1 F3515
G1 X115.67 Y128.505 E.00321
; LINE_WIDTH: 0.257635
G1 X115.658 Y128.495 E.00028
; LINE_WIDTH: 0.226756
G1 X115.628 Y128.447 E.00085
; LINE_WIDTH: 0.172037
G1 X115.599 Y128.398 E.0006
G1 X115.565 Y128.144 E.0027
G1 X116.468 Y128.515 F30000
; LINE_WIDTH: 0.118568
G1 F3515
G1 X115.846 Y129.146 E.00546
; LINE_WIDTH: 0.137479
G1 X115.813 Y129.16 E.00027
; LINE_WIDTH: 0.173919
G1 X115.78 Y129.174 E.00038
G1 X115.676 Y129.017 E.00201
G1 X116.572 Y129.495 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3515
G3 X116.411 Y128.915 I5.723 J-1.905 E.01996
G1 X115.993 Y129.345 E.01989
G1 X116.792 Y130.144 E.03752
G3 X116.636 Y129.688 I4.493 J-1.796 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3515
G2 X123.84 Y137.836 I5.937 J-11.887 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04316
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04316
G3 X131.689 Y137.365 I-1.84 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
G1 X125.441 Y133.5 Z8.4 F30000
G1 X115.381 Y127.154 Z8.4
G1 Z8
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F3515
G1 X115.008 Y127.527 E.0162
G1 X114.96 Y127.041
G1 X115.368 Y126.633 E.01772
G1 X115.356 Y126.112
G1 X114.927 Y126.541 E.01866
G1 X114.73 Y126.205
G1 X115.362 Y125.573 E.02748
G1 X114.927 Y125.475
G1 X115.372 Y125.029 E.01935
G1 X115.382 Y124.486
G1 X114.965 Y124.904 E.01816
G1 X114.607 Y125.795
G1 X114.196 Y126.206 E.01785
G1 X113.662 Y126.206
G1 X114.074 Y125.794 E.01788
M204 S10000
; WIPE_START
G1 F24000
G1 X113.662 Y126.206 E-.22107
G1 X114.196 Y126.206 E-.20274
G1 X114.607 Y125.795 E-.22077
G1 X114.72 Y125.513 E-.11541
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.16 J.369 P1  F30000
G1 X115.413 Y127.692 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.132805
G1 F3515
G1 X115.006 Y127.692 E.00298
; WIPE_START
G1 F24000
G1 X115.413 Y127.692 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X113.475 Y125.775 Z8.4 F30000
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.195918
G1 F3515
G1 X113.475 Y126.127 E.00438
G1 X113.516 Y126.225 E.00132
; WIPE_START
G1 F24000
G1 X113.475 Y126.127 E-.17647
G1 X113.475 Y125.775 E-.58353
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I.091 J1.214 P1  F30000
G1 X114.922 Y125.667 Z8.4
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.0912312
G1 F3515
G1 X114.817 Y125.825 E.00075
G1 X115.375 Y125.826 F30000
; LINE_WIDTH: 0.105391
G1 F3515
G1 X115.285 Y126.041 E.00118
G1 X115.405 Y124.316 F30000
; LINE_WIDTH: 0.147199
G1 F3515
G1 X115.009 Y124.316 E.00336
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.405 Y124.316 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 53/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z8.4 I.651 J1.028 P1  F30000
G1 X130.591 Y114.691 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3142
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3142
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.542 Y121.25 Z8.6 F30000
G1 X140.838 Y124.785 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3142
G1 X140.841 Y124.925 E.00464
G3 X123.892 Y113.774 I-12.85 J1.075 E1.91305
G3 X128.488 Y113.115 I4.092 J12.174 E.15486
G3 X140.784 Y124.376 I-.497 J12.885 E.60141
G1 X140.83 Y124.726 E.01172
G1 X141.228 Y124.744 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3142
G1 X141.232 Y124.893 E.00456
G3 X123.767 Y113.402 I-13.241 J1.107 E1.82595
G3 X128.508 Y112.723 I4.216 J12.543 E.14796
G3 X141.172 Y124.326 I-.517 J13.277 E.57387
G1 X141.22 Y124.685 E.01111
M204 S10000
; WIPE_START
G1 F24000
G1 X141.232 Y124.893 E-.07907
G1 X141.28 Y125.485 E-.22602
G1 X141.29 Y126.095 E-.23171
G1 X141.274 Y126.651 E-.21123
G1 X141.272 Y126.682 E-.01198
; WIPE_END
G1 E-.04 F1800
G1 X139.828 Y123.836 Z8.6 F30000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.484322
G1 F3142
G3 X139.836 Y128.184 I-12.403 J2.199 E.15719
G1 X140.117 Y128.214 E.01014
G1 X140.298 Y128.023 E.00947
G2 X140.302 Y123.967 I-12.421 J-2.039 E.14653
G1 X140.145 Y123.791 E.00849
G1 X139.887 Y123.827 E.00936
G1 X139.57 Y128.988 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3142
G2 X139.663 Y128.59 I-3.944 J-1.131 E.01358
G1 X140.266 Y128.637 E.02007
G3 X140.125 Y129.227 I-5.983 J-1.124 E.02014
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.493 J-1.796 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-10.888 J-10.608 E.054
G1 X133.658 Y137.2 F30000
G1 F3142
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3142
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.737 Y128.65 I5.714 J-1.678 E.01971
G1 X116.337 Y128.59 E.02001
G2 X116.436 Y129.01 I4.252 J-.782 E.01431
G1 X116.174 Y128.164 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.482749
G1 F3142
G3 X116.162 Y123.817 I12.463 J-2.207 E.15657
G1 X115.841 Y123.786 E.01158
G1 X115.707 Y123.944 E.00742
G2 X115.56 Y125.368 I8.111 J1.553 E.05136
G2 X115.701 Y128.035 I11.903 J.71 E.09593
G3 X115.858 Y128.208 I-5.259 J4.912 E.00839
G1 X116.115 Y128.172 E.0093
G1 X116.435 Y122.993 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3142
G2 X116.337 Y123.41 I4.132 J1.194 E.01423
G1 X115.736 Y123.352 E.02002
G3 X115.875 Y122.773 I5.872 J1.104 E.01977
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I10.888 J10.608 E.054
G1 X122.342 Y114.8 F30000
G1 F3142
G3 X123.84 Y114.164 I5.937 J11.887 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.263 E.21655
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
G1 X137.52 Y118.776 F30000
G1 F3142
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.263 Y123.347 I-5.689 J1.671 E.01962
G1 X139.663 Y123.409 E.02
G2 X139.563 Y122.986 I-4.28 J.789 E.0144
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X139.663 Y123.409 E-.1649
G1 X140.263 Y123.347 E-.22916
G1 X140.125 Y122.773 E-.22462
G1 X139.862 Y122.51 E-.14132
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 54/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z8.6 I.785 J-.93 P1  F30000
G1 X130.591 Y114.691 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3133
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3133
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.533 Y121.259 Z8.8 F30000
G1 X140.842 Y124.82 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3133
G1 X140.841 Y124.923 E.00342
G3 X123.892 Y113.774 I-12.85 J1.077 E1.91312
G3 X128.493 Y113.115 I4.091 J12.173 E.15501
G3 X140.783 Y124.373 I-.501 J12.885 E.60116
G1 X140.834 Y124.761 E.01297
G1 X141.232 Y124.779 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3133
G1 X141.233 Y124.89 E.00343
G3 X123.767 Y113.402 I-13.242 J1.111 E1.82624
G3 X128.512 Y112.723 I4.216 J12.542 E.1481
G3 X141.173 Y124.323 I-.521 J13.278 E.57367
G1 X141.224 Y124.719 E.01227
M204 S10000
; WIPE_START
G1 F24000
G1 X141.233 Y124.89 E-.06506
G1 X141.28 Y125.484 E-.22624
G1 X141.29 Y126.094 E-.23191
G1 X141.274 Y126.651 E-.2116
G1 X141.269 Y126.717 E-.02519
; WIPE_END
G1 E-.04 F1800
G1 X139.826 Y123.834 Z8.8 F30000
G1 Z8.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483658
G1 F3133
G3 X139.836 Y128.184 I-12.372 J2.206 E.15701
G1 X140.117 Y128.214 E.01013
G1 X140.298 Y128.023 E.00946
G2 X140.299 Y123.962 I-12.672 J-2.032 E.14646
G1 X140.145 Y123.789 E.00831
G1 X139.885 Y123.826 E.00943
G1 X139.563 Y122.986 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3133
G3 X139.663 Y123.409 I-4.18 J1.211 E.0144
G1 X140.263 Y123.347 E.02
G2 X140.125 Y122.773 I-5.826 J1.096 E.01962
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3133
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.266 E.21655
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X120.778 Y116.483 F30000
M73 P43 R16
G1 F3133
G2 X119.552 Y117.552 I12.973 J16.129 E.05398
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.639 Y122.315 E.02229
G1 X116.81 Y121.839 E.01678
G1 X115.876 Y122.773 E.04382
M73 P43 R15
G2 X115.736 Y123.352 I5.733 J1.684 E.01977
G1 X116.337 Y123.41 E.02002
G3 X116.435 Y122.993 I4.231 J.777 E.01423
G1 X116.174 Y128.164 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.482747
G1 F3133
G3 X116.162 Y123.817 I12.462 J-2.207 E.15657
G1 X115.841 Y123.786 E.01158
G1 X115.707 Y123.944 E.00742
G2 X115.56 Y125.368 I8.11 J1.553 E.05137
G2 X115.701 Y128.035 I11.904 J.71 E.09593
G3 X115.858 Y128.208 I-5.26 J4.913 E.00839
G1 X116.115 Y128.172 E.0093
G1 X116.436 Y129.01 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3133
G3 X116.337 Y128.59 I4.153 J-1.201 E.01431
G1 X115.737 Y128.65 E.02001
G2 X115.875 Y129.227 I5.854 J-1.101 E.01971
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.175 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3133
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
G1 X137.52 Y133.224 F30000
G1 F3133
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.341 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.266 Y128.637 I-5.843 J-1.714 E.02014
G1 X139.663 Y128.59 E.02007
G3 X139.57 Y128.988 I-4.038 J-.733 E.01358
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X139.663 Y128.59 E-.15548
G1 X140.266 Y128.637 E-.2299
G1 X140.125 Y129.227 E-.23066
G1 X139.857 Y129.495 E-.14396
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 55/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z8.8 I1.032 J-.646 P1  F30000
G1 X130.591 Y114.691 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3038
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3038
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.523 Y121.268 Z9 F30000
G1 X140.846 Y124.857 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3038
G1 X140.841 Y124.921 E.00213
G3 X123.892 Y113.774 I-12.85 J1.079 E1.91318
G3 X128.497 Y113.115 I4.091 J12.172 E.15516
G3 X140.783 Y124.37 I-.506 J12.885 E.60091
G1 X140.838 Y124.798 E.0143
G1 X141.236 Y124.816 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3038
G1 X141.233 Y124.889 E.00223
G3 X123.767 Y113.402 I-13.242 J1.113 E1.8263
G3 X128.517 Y112.723 I4.215 J12.542 E.14823
G3 X141.172 Y124.321 I-.526 J13.278 E.57344
G1 X141.228 Y124.757 E.0135
M204 S10000
; WIPE_START
G1 F24000
G1 X141.233 Y124.889 E-.05018
G1 X141.28 Y125.482 E-.22634
G1 X141.29 Y126.093 E-.23209
G1 X141.274 Y126.651 E-.2121
G1 X141.267 Y126.754 E-.03929
; WIPE_END
G1 E-.04 F1800
G1 X138.022 Y119.846 Z9 F30000
G1 X137.52 Y118.776 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3038
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.154 J3.227 E.21654
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.443 Y134.443 E.02011
G2 X137.52 Y133.224 I-8.851 J-8.904 E.054
G1 X133.658 Y137.2 F30000
G1 F3038
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3038
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.341 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.436 J-3.227 E.21644
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.557 Y117.557 E.02011
G2 X118.48 Y118.776 I8.851 J8.903 E.054
G1 X122.342 Y114.8 F30000
G1 F3038
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.269 E.21655
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 56/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z9 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3022
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.311 E2.32212
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.598 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3022
G3 X127.721 Y114.793 I-2.494 J10.929 E2.07834
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.206 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.512 Y121.278 Z9.2 F30000
G1 X140.849 Y124.896 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3022
G1 X140.846 Y124.981 E.00282
G3 X123.892 Y113.774 I-12.855 J1.019 E1.91121
G3 X128.502 Y113.115 I4.091 J12.172 E.15531
G3 X140.782 Y124.367 I-.511 J12.885 E.60065
G1 X140.841 Y124.836 E.01569
G1 X141.239 Y124.855 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3022
G1 X141.237 Y124.95 E.0029
G3 X123.767 Y113.402 I-13.246 J1.051 E1.82437
G3 X128.521 Y112.724 I4.215 J12.541 E.14837
G3 X141.172 Y124.318 I-.53 J13.277 E.5732
G1 X141.231 Y124.796 E.0148
M204 S10000
; WIPE_START
G1 F24000
G1 X141.237 Y124.95 E-.05855
G1 X141.283 Y125.561 E-.23291
G1 X141.289 Y126.184 E-.23675
G1 X141.27 Y126.734 E-.20894
G1 X141.265 Y126.793 E-.02284
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z9.2 F30000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3022
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.129 J-3.227 E.21655
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3022
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.272 E.21655
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X120.778 Y116.483 F30000
G1 F3022
G2 X119.552 Y117.552 I12.973 J16.128 E.05398
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
M73 P44 R15
G1 X116.639 Y122.314 E.02229
G1 X116.809 Y121.839 E.01677
G1 X115.875 Y122.773 E.04381
G2 X115.875 Y129.227 I12.436 J3.227 E.21644
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.175 J-9.109 E.05401
G1 X122.342 Y137.2 F30000
G1 F3022
G2 X123.84 Y137.836 I5.937 J-11.887 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 57/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z9.2 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.501 Y121.288 Z9.4 F30000
G1 X140.853 Y124.937 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.847 Y124.978 E.00139
G3 X123.892 Y113.774 I-12.856 J1.023 E1.91152
G3 X128.506 Y113.115 I4.091 J12.171 E.15546
G3 X140.783 Y124.364 I-.515 J12.886 E.60042
G1 X140.846 Y124.877 E.01715
G1 X141.243 Y124.896 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.237 Y124.947 E.00158
G3 X123.767 Y113.402 I-13.246 J1.054 E1.82445
G3 X128.526 Y112.724 I4.215 J12.54 E.14851
G3 X141.171 Y124.315 I-.535 J13.277 E.57297
G1 X141.235 Y124.837 E.01615
M204 S10000
; WIPE_START
G1 F24000
G1 X141.237 Y124.947 E-.04203
G1 X141.283 Y125.559 E-.23308
G1 X141.289 Y126.182 E-.2369
G1 X141.27 Y126.733 E-.20935
G1 X141.261 Y126.834 E-.03864
; WIPE_END
G1 E-.04 F1800
G1 X138.047 Y119.911 Z9.4 F30000
G1 X137.52 Y118.776 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.13 J3.227 E.21655
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.245 J-7.883 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.341 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.149 J-3.227 E.21654
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.275 E.21655
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 58/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z9.4 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3028
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3028
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.487 Y121.301 Z9.6 F30000
G1 X140.846 Y124.976 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3028
G3 X123.892 Y113.774 I-12.855 J1.026 E1.91161
G3 X128.51 Y113.116 I4.091 J12.17 E.15561
G3 X140.841 Y124.916 I-.52 J12.886 E.61867
G1 X141.247 Y124.938 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3028
G1 X141.236 Y124.945 E.00038
G3 X123.767 Y113.402 I-13.246 J1.057 E1.82453
G3 X128.53 Y112.724 I4.215 J12.54 E.14865
G3 X141.171 Y124.312 I-.54 J13.277 E.57274
G1 X141.24 Y124.879 E.01754
M204 S10000
; WIPE_START
G1 F24000
G1 X141.236 Y124.945 E-.02509
G1 X141.282 Y125.556 E-.23315
G1 X141.289 Y126.18 E-.23703
G1 X141.27 Y126.732 E-.20986
G1 X141.257 Y126.876 E-.05488
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z9.6 F30000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3028
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.158 J-3.227 E.21654
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3028
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.278 E.21654
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3028
G3 X119.552 Y117.552 I10.246 J7.884 E.05401
M73 P45 R15
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.649 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.149 J3.227 E.21654
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.175 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3028
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 59/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z9.6 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.483 Y121.305 Z9.8 F30000
G1 X140.858 Y125.004 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3047
G1 X140.88 Y125.567 E.01871
G3 X123.892 Y113.774 I-12.889 J.434 E1.89195
G3 X128.515 Y113.116 I4.09 J12.17 E.15576
G3 X140.844 Y124.946 I-.524 J12.885 E.61954
G1 X141.25 Y124.982 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X141.271 Y125.555 E.01762
G3 X123.767 Y113.402 I-13.28 J.446 E1.80571
G3 X128.535 Y112.724 I4.215 J12.539 E.14878
G3 X141.234 Y124.924 I-.544 J13.277 E.5915
M204 S10000
; WIPE_START
G1 F24000
G1 X141.271 Y125.555 E-.24005
G1 X141.289 Y126.178 E-.23712
G1 X141.265 Y126.81 E-.24007
G1 X141.253 Y126.922 E-.04275
; WIPE_END
G1 E-.04 F1800
G1 X138.073 Y119.983 Z9.8 F30000
G1 X137.52 Y118.776 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G2 X136.448 Y117.552 I-10.246 J7.884 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.159 J3.227 E.21654
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3047
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3047
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.149 J-3.227 E.21654
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3047
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.281 E.21654
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 60/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z9.8 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3026
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3026
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.471 Y121.316 Z10 F30000
G1 X140.861 Y125.048 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3026
G1 X140.879 Y125.565 E.01718
G3 X123.892 Y113.774 I-12.888 J.435 E1.89189
G3 X128.519 Y113.116 I4.09 J12.169 E.15591
G3 X140.845 Y124.971 I-.529 J12.885 E.62017
G1 X140.849 Y124.989 E.00062
G1 X141.251 Y125.025 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3026
G1 X141.259 Y125.257 E.00711
G3 X123.145 Y113.629 I-13.267 J.745 E1.79457
G3 X128.539 Y112.725 I4.864 J12.476 E.16926
G3 X141.212 Y124.66 I-.547 J13.277 E.58326
G1 X141.245 Y124.966 E.00945
M204 S10000
; WIPE_START
G1 F24000
G1 X141.259 Y125.257 E-.11066
G1 X141.29 Y125.918 E-.25166
G1 X141.281 Y126.485 E-.21545
G1 X141.244 Y126.963 E-.18223
; WIPE_END
G1 E-.04 F1800
G1 X136.85 Y133.204 Z10 F30000
G1 X135.222 Y135.517 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3026
G2 X136.448 Y134.448 I-12.974 J-16.13 E.05398
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.362 Y129.687 E.02225
G1 X139.2 Y130.152 E.01637
G1 X140.125 Y129.227 E.04339
G2 X140.125 Y122.773 I-12.159 J-3.227 E.21654
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
M73 P46 R15
G1 F3026
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.283 E.21654
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3026
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.446 J3.227 E.21643
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.175 J-9.109 E.05401
G1 X122.342 Y137.2 F30000
G1 F3026
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 61/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z10 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3039
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3039
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.456 Y121.329 Z10.2 F30000
G1 X140.864 Y125.1 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3039
G1 X140.868 Y125.28 E.00596
G3 X123.288 Y113.994 I-12.876 J.722 E1.88013
G3 X128.524 Y113.116 I4.721 J12.107 E.17736
G3 X140.822 Y124.7 I-.532 J12.885 E.61108
G1 X140.857 Y125.04 E.01134
G1 X141.254 Y125.069 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3039
G1 X141.259 Y125.257 E.00578
G3 X123.145 Y113.629 I-13.267 J.744 E1.79454
G3 X128.543 Y112.725 I4.864 J12.475 E.16939
G3 X141.212 Y124.66 I-.552 J13.277 E.58312
G1 X141.248 Y125.01 E.01079
M204 S10000
; WIPE_START
G1 F24000
G1 X141.259 Y125.257 E-.09423
G1 X141.29 Y125.919 E-.25167
G1 X141.281 Y126.487 E-.2158
G1 X141.241 Y127.007 E-.1983
; WIPE_END
G1 E-.04 F1800
G1 X138.097 Y120.052 Z10.2 F30000
G1 X137.52 Y118.776 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3039
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.65 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.159 J3.227 E.21654
G1 X139.199 Y130.153 E.0434
G1 X139.362 Y129.687 E.01638
G1 X139.837 Y130.161 E.02225
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G3 X135.222 Y135.517 I-14.201 J-15.061 E.05398
G1 X133.658 Y137.2 F30000
G1 F3039
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3039
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.341 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.447 J-3.227 E.21643
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
M73 P46 R14
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3039
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.286 E.21654
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 62/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z10.2 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3024
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.444 Y121.34 Z10.4 F30000
G1 X140.867 Y125.144 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3024
G1 X140.868 Y125.28 E.00453
G3 X123.288 Y113.994 I-12.876 J.721 E1.88011
G3 X128.528 Y113.117 I4.72 J12.106 E.17751
G3 X140.822 Y124.701 I-.537 J12.885 E.61092
G1 X140.861 Y125.084 E.01279
G1 X141.258 Y125.113 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G1 X141.259 Y125.258 E.00446
G3 X123.145 Y113.629 I-13.267 J.743 E1.79452
G3 X128.548 Y112.725 I4.864 J12.474 E.16953
G3 X141.212 Y124.66 I-.557 J13.277 E.58298
G1 X141.252 Y125.053 E.01214
M204 S10000
; WIPE_START
G1 F24000
G1 X141.259 Y125.258 E-.07788
G1 X141.29 Y125.92 E-.25166
G1 X141.281 Y126.488 E-.21611
G1 X141.238 Y127.051 E-.21434
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z10.4 F30000
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3024
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.65 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.159 J-3.227 E.21654
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3024
M73 P47 R14
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.289 E.21654
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3024
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.448 J3.227 E.21643
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.175 J-9.109 E.05401
G1 X122.342 Y137.2 F30000
G1 F3024
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 63/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z10.4 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.432 Y121.351 Z10.6 F30000
G1 X140.87 Y125.187 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.867 Y125.281 E.00313
G3 X123.288 Y113.994 I-12.876 J.72 E1.88008
G3 X128.533 Y113.117 I4.72 J12.105 E.17765
G3 X140.822 Y124.701 I-.541 J12.885 E.61078
G1 X140.864 Y125.127 E.01422
G1 X141.261 Y125.156 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.259 Y125.259 E.00316
G3 X123.145 Y113.629 I-13.267 J.742 E1.79449
G3 X128.552 Y112.725 I4.863 J12.472 E.16967
G3 X141.212 Y124.661 I-.561 J13.276 E.58284
G1 X141.255 Y125.097 E.01347
M204 S10000
; WIPE_START
G1 F24000
G1 X141.259 Y125.259 E-.06173
G1 X141.29 Y125.921 E-.25166
G1 X141.281 Y126.49 E-.21652
G1 X141.234 Y127.094 E-.23009
; WIPE_END
G1 E-.04 F1800
G1 X138.122 Y120.125 Z10.6 F30000
G1 X137.52 Y118.776 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.246 J7.884 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.65 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.159 J3.227 E.21654
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.245 J-7.883 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.341 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.449 J-3.227 E.21643
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.887 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.292 E.21654
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 64/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z10.6 I-.241 J-1.193 P1  F30000
G1 X130.591 Y114.691 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3024
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.421 Y121.361 Z10.8 F30000
G1 X140.874 Y125.229 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3024
G1 X140.866 Y125.282 E.00177
G3 X123.288 Y113.994 I-12.875 J.718 E1.87986
G3 X128.537 Y113.117 I4.72 J12.104 E.1778
G3 X140.821 Y124.701 I-.546 J12.883 E.61061
G1 X140.868 Y125.17 E.01562
G1 X141.265 Y125.199 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G1 X141.257 Y125.26 E.00189
G3 X123.145 Y113.629 I-13.266 J.741 E1.79429
G3 X128.557 Y112.725 I4.863 J12.471 E.16981
G3 X141.21 Y124.661 I-.566 J13.275 E.58269
G1 X141.259 Y125.139 E.01477
M204 S10000
; WIPE_START
G1 F24000
G1 X141.257 Y125.26 E-.04596
G1 X141.29 Y125.921 E-.25166
G1 X141.281 Y126.492 E-.21701
G1 X141.231 Y127.136 E-.24537
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z10.8 F30000
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3024
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.159 J-3.227 E.21654
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3024
M73 P48 R14
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.295 E.21654
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3024
G3 X119.552 Y117.552 I10.246 J7.884 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.45 J3.227 E.21643
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.175 J-9.109 E.05401
G1 X122.342 Y137.2 F30000
G1 F3024
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 65/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z10.8 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.41 Y121.371 Z11 F30000
G1 X140.877 Y125.27 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.866 Y125.283 E.00055
G3 X123.288 Y113.994 I-12.875 J.717 E1.87984
G3 X128.542 Y113.117 I4.719 J12.103 E.17795
G3 X140.821 Y124.702 I-.551 J12.883 E.61048
G1 X140.871 Y125.211 E.01698
G1 X141.268 Y125.24 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.257 Y125.261 E.00072
G3 X123.145 Y113.629 I-13.266 J.74 E1.79427
G3 X128.561 Y112.726 I4.863 J12.471 E.16995
G3 X141.21 Y124.661 I-.571 J13.275 E.58256
G1 X141.262 Y125.18 E.01602
M204 S10000
; WIPE_START
G1 F24000
G1 X141.257 Y125.261 E-.0307
G1 X141.29 Y125.922 E-.25167
G1 X141.281 Y126.494 E-.21734
G1 X141.228 Y127.177 E-.26029
; WIPE_END
G1 E-.04 F1800
G1 X138.146 Y120.195 Z11 F30000
G1 X137.52 Y118.776 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.159 J3.227 E.21654
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.451 J-3.227 E.21643
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.887 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.298 E.21654
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 66/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z11 I-.241 J-1.193 P1  F30000
G1 X130.591 Y114.691 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3029
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3029
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.404 Y121.376 Z11.2 F30000
G1 X140.878 Y125.291 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3029
G1 X140.886 Y125.926 E.02107
G3 X123.288 Y113.994 I-12.895 J.074 E1.85848
G3 X128.546 Y113.117 I4.719 J12.102 E.1781
G3 X140.864 Y125.238 I-.555 J12.883 E.62818
G1 X141.27 Y125.279 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3029
G1 X141.279 Y125.923 E.01978
G3 X123.145 Y113.629 I-13.288 J.079 E1.77412
G3 X128.566 Y112.726 I4.862 J12.47 E.17008
G3 X141.257 Y125.223 I-.575 J13.276 E.59976
M204 S10000
; WIPE_START
G1 F24000
G1 X141.279 Y125.923 E-.2663
G1 X141.281 Y126.496 E-.21766
G1 X141.225 Y127.22 E-.27604
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z11.2 F30000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3029
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.159 J-3.227 E.21654
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3029
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
M73 P49 R14
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.301 E.21654
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3029
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.451 J3.227 E.21643
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.175 J-9.109 E.05401
G1 X122.342 Y137.2 F30000
G1 F3029
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 67/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z11.2 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3048
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3048
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.393 Y121.385 Z11.4 F30000
G1 X140.879 Y125.329 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3048
G1 X140.886 Y125.927 E.01985
G3 X123.288 Y113.994 I-12.895 J.073 E1.85846
G3 X128.551 Y113.118 I4.719 J12.101 E.17825
G3 X140.865 Y125.271 I-.56 J12.883 E.62912
G1 X141.271 Y125.317 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3048
G1 X141.279 Y125.924 E.01865
G3 X123.145 Y113.629 I-13.288 J.078 E1.77406
G3 X128.57 Y112.726 I4.862 J12.469 E.17022
G3 X141.258 Y125.258 I-.579 J13.275 E.60071
M204 S10000
; WIPE_START
G1 F24000
G1 X141.279 Y125.924 E-.25302
G1 X141.281 Y126.498 E-.21802
G1 X141.222 Y127.256 E-.28896
; WIPE_END
G1 E-.04 F1800
G1 X138.168 Y120.261 Z11.4 F30000
G1 X137.52 Y118.776 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3048
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.159 J3.227 E.21654
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.444 Y134.444 E.02008
G2 X137.52 Y133.224 I-9.411 J-9.388 E.054
G1 X133.658 Y137.2 F30000
G1 F3048
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3048
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.452 J-3.227 E.21643
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.556 Y117.556 E.02008
G2 X118.48 Y118.776 I9.411 J9.388 E.054
G1 X122.342 Y114.8 F30000
G1 F3048
G3 X123.84 Y114.164 I5.937 J11.887 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.303 E.21654
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 68/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z11.4 I-.241 J-1.193 P1  F30000
G1 X130.591 Y114.691 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3024
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.383 Y121.394 Z11.6 F30000
G1 X140.88 Y125.364 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3024
G1 X140.886 Y125.928 E.01871
G3 X123.288 Y113.994 I-12.895 J.072 E1.85843
G3 X128.555 Y113.118 I4.719 J12.1 E.1784
G3 X140.866 Y125.286 I-.564 J12.883 E.62946
G1 X140.87 Y125.305 E.00066
G1 X141.272 Y125.352 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G1 X141.279 Y125.925 E.0176
G3 X123.145 Y113.629 I-13.288 J.077 E1.77407
G3 X128.575 Y112.726 I4.862 J12.468 E.17036
G3 X141.259 Y125.263 I-.584 J13.275 E.60072
G1 X141.263 Y125.293 E.00092
M204 S10000
; WIPE_START
G1 F24000
G1 X141.279 Y125.925 E-.24021
G1 X141.28 Y126.499 E-.21837
G1 X141.22 Y127.29 E-.30142
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z11.6 F30000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3024
G3 X136.444 Y134.444 I-10.538 J-8.212 E.054
G1 X136.872 Y134.872 E.02007
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.159 J-3.227 E.21654
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
M73 P50 R14
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3024
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.306 E.21653
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3024
G3 X119.556 Y117.556 I10.538 J8.212 E.054
G1 X119.128 Y117.128 E.02007
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.649 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.453 J3.227 E.21643
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
M73 P50 R13
G3 X118.48 Y133.224 I9.175 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3024
G2 X123.84 Y137.836 I5.937 J-11.887 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 69/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z11.6 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.374 Y121.402 Z11.8 F30000
G1 X140.881 Y125.397 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.886 Y125.929 E.01766
G3 X123.288 Y113.994 I-12.895 J.072 E1.85841
G3 X128.56 Y113.118 I4.718 J12.1 E.17855
G3 X140.866 Y125.286 I-.569 J12.882 E.62933
G1 X140.873 Y125.337 E.0017
G1 X141.273 Y125.385 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.279 Y125.926 E.01662
G3 X123.145 Y113.629 I-13.288 J.076 E1.77401
G3 X128.579 Y112.727 I4.862 J12.467 E.1705
G3 X141.258 Y125.264 I-.589 J13.275 E.6006
G1 X141.266 Y125.325 E.00189
M204 S10000
; WIPE_START
G1 F24000
G1 X141.279 Y125.926 E-.22824
G1 X141.28 Y126.501 E-.21874
G1 X141.217 Y127.323 E-.31302
; WIPE_END
G1 E-.04 F1800
G1 X138.187 Y120.318 Z11.8 F30000
G1 X137.52 Y118.776 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.159 J3.227 E.21654
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.341 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.454 J-3.227 E.21643
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.309 E.21653
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 70/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z11.8 I-.241 J-1.193 P1  F30000
G1 X130.591 Y114.691 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3024
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.366 Y121.41 Z12 F30000
G1 X140.882 Y125.426 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3024
G1 X140.887 Y125.93 E.01671
G3 X123.288 Y113.994 I-12.896 J.072 E1.8586
G3 X128.564 Y113.118 I4.718 J12.099 E.1787
G3 X140.867 Y125.287 I-.573 J12.883 E.62924
G1 X140.876 Y125.366 E.00264
G1 X141.274 Y125.414 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G1 X141.279 Y125.926 E.01575
G3 X123.145 Y113.629 I-13.288 J.075 E1.77398
G3 X128.584 Y112.727 I4.862 J12.466 E.17063
G3 X141.258 Y125.265 I-.593 J13.275 E.60049
G1 X141.268 Y125.354 E.00277
M204 S10000
; WIPE_START
G1 F24000
G1 X141.279 Y125.926 E-.21743
G1 X141.28 Y126.503 E-.21894
G1 X141.215 Y127.352 E-.32363
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z12 F30000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3024
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.159 J-3.227 E.21654
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
M73 P51 R13
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3024
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.312 E.21653
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3024
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.649 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.455 J3.227 E.21643
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3024
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 71/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z12 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3043
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3043
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.358 Y121.416 Z12.2 F30000
G1 X140.883 Y125.452 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3043
G1 X140.887 Y125.931 E.01588
G3 X123.288 Y113.994 I-12.896 J.071 E1.85857
G3 X128.569 Y113.119 I4.718 J12.098 E.17885
G3 X140.867 Y125.288 I-.578 J12.883 E.62911
G1 X140.877 Y125.392 E.00347
G1 X141.275 Y125.44 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3043
G1 X141.279 Y125.927 E.01498
G3 X123.145 Y113.629 I-13.288 J.074 E1.77396
G3 X128.588 Y112.727 I4.861 J12.466 E.17077
G3 X141.258 Y125.266 I-.598 J13.275 E.60037
G1 X141.269 Y125.38 E.00354
M204 S10000
; WIPE_START
G1 F24000
G1 X141.279 Y125.927 E-.20792
G1 X141.28 Y126.504 E-.2193
G1 X141.213 Y127.378 E-.33279
; WIPE_END
G1 E-.04 F1800
G1 X138.202 Y120.364 Z12.2 F30000
G1 X137.52 Y118.776 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3043
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.159 J3.227 E.21654
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3043
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3043
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.456 J-3.227 E.21643
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3043
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.315 E.21653
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 72/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z12.2 I-.241 J-1.193 P1  F30000
G1 X130.591 Y114.691 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3024
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.168 E2.30293
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.677 I-.289 J11.598 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G3 X127.721 Y114.793 I-2.494 J10.929 E2.07834
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.206 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.352 Y121.421 Z12.4 F30000
G1 X140.884 Y125.474 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3024
G1 X140.887 Y125.932 E.01518
G3 X123.288 Y113.994 I-12.896 J.07 E1.85855
G3 X128.573 Y113.119 I4.718 J12.097 E.17899
G3 X140.867 Y125.289 I-.582 J12.883 E.62899
G1 X140.879 Y125.414 E.00417
G1 X141.276 Y125.462 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G1 X141.278 Y125.928 E.01432
G3 X123.145 Y113.629 I-13.288 J.074 E1.77393
G3 X128.593 Y112.727 I4.861 J12.465 E.17091
G3 X141.258 Y125.267 I-.602 J13.274 E.60026
G1 X141.27 Y125.402 E.00419
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y125.928 E-.19985
G1 X141.28 Y126.506 E-.21965
G1 X141.212 Y127.4 E-.3405
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z12.4 F30000
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3024
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.65 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.159 J-3.227 E.21654
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
M73 P52 R13
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3024
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.317 E.21653
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3024
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.456 J3.227 E.21643
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3024
G2 X123.84 Y137.836 I5.937 J-11.887 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 73/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z12.4 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.347 Y121.426 Z12.6 F30000
G1 X140.884 Y125.492 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.887 Y125.932 E.01462
G3 X123.288 Y113.994 I-12.896 J.069 E1.85852
G3 X128.578 Y113.119 I4.718 J12.097 E.17914
G3 X140.867 Y125.29 I-.587 J12.883 E.62886
G1 X140.879 Y125.432 E.00473
G1 X141.276 Y125.48 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.278 Y125.929 E.0138
G3 X123.145 Y113.629 I-13.288 J.073 E1.77391
G3 X128.597 Y112.727 I4.861 J12.464 E.17105
G3 X141.258 Y125.267 I-.607 J13.274 E.60014
G1 X141.271 Y125.42 E.00471
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y125.929 E-.19337
G1 X141.28 Y126.508 E-.22001
G1 X141.21 Y127.417 E-.34662
; WIPE_END
G1 E-.04 F1800
G1 X138.213 Y120.398 Z12.6 F30000
G1 X137.52 Y118.776 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.159 J3.227 E.21654
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.457 J-3.227 E.21643
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.887 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.32 E.21653
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 74/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z12.6 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z12.6
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3024
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.344 Y121.429 Z12.8 F30000
G1 X140.885 Y125.505 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3024
G1 X140.887 Y125.933 E.01419
G3 X123.288 Y113.994 I-12.896 J.069 E1.85849
G3 X128.582 Y113.119 I4.718 J12.096 E.17929
G3 X140.867 Y125.291 I-.591 J12.883 E.62874
G1 X140.88 Y125.446 E.00516
G1 X141.277 Y125.494 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G1 X141.278 Y125.93 E.01341
G3 X123.145 Y113.629 I-13.288 J.072 E1.77384
G3 X128.602 Y112.728 I4.861 J12.464 E.17119
G3 X141.258 Y125.268 I-.611 J13.274 E.60002
G1 X141.272 Y125.434 E.0051
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y125.93 E-.18852
G1 X141.28 Y126.51 E-.22036
G1 X141.209 Y127.431 E-.35112
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z12.8 F30000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3024
G3 X136.444 Y134.444 I-10.863 J-8.492 E.054
G1 X136.872 Y134.872 E.02006
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.16 J-3.227 E.21654
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
M73 P53 R13
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3024
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.794 E.21636
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3024
G3 X119.556 Y117.556 I10.863 J8.492 E.054
G1 X119.128 Y117.128 E.02006
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.649 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.876 Y129.227 I12.458 J3.227 E.21643
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3024
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 75/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z12.8 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.341 Y121.431 Z13 F30000
G1 X140.885 Y125.515 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.887 Y125.934 E.01391
G3 X123.288 Y113.994 I-12.896 J.068 E1.85847
G3 X128.587 Y113.12 I4.717 J12.096 E.17944
G3 X140.867 Y125.291 I-.596 J12.882 E.62862
G1 X140.88 Y125.455 E.00544
G1 X141.277 Y125.503 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.278 Y125.931 E.01314
G3 X123.145 Y113.629 I-13.288 J.071 E1.77382
G3 X128.606 Y112.728 I4.861 J12.463 E.17132
G3 X141.258 Y125.269 I-.616 J13.274 E.59991
G1 X141.272 Y125.443 E.00537
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y125.931 E-.18523
G1 X141.28 Y126.511 E-.22071
G1 X141.209 Y127.44 E-.35406
; WIPE_END
G1 E-.04 F1800
G1 X138.219 Y120.418 Z13 F30000
G1 X137.52 Y118.776 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.341 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.16 J3.227 E.21654
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
M73 P53 R12
G3 X115.875 Y122.773 I12.458 J-3.227 E.21643
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.798 E.21636
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 76/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L76
M991 S0 P75 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z13 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3023
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3023
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.339 Y121.433 Z13.2 F30000
G1 X140.885 Y125.52 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3023
G1 X140.887 Y125.935 E.01375
G3 X123.288 Y113.994 I-12.896 J.067 E1.85844
G3 X128.591 Y113.12 I4.717 J12.095 E.17959
G3 X140.867 Y125.292 I-.6 J12.882 E.6285
G1 X140.881 Y125.461 E.0056
G1 X141.277 Y125.509 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3023
G1 X141.278 Y125.931 E.01299
G3 X123.145 Y113.629 I-13.288 J.07 E1.77379
G3 X128.611 Y112.728 I4.861 J12.463 E.17146
G3 X141.258 Y125.27 I-.62 J13.273 E.59979
G1 X141.272 Y125.449 E.00552
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y125.931 E-.18337
G1 X141.28 Y126.513 E-.22108
G1 X141.208 Y127.446 E-.35555
; WIPE_END
M73 P54 R12
G1 E-.04 F1800
G1 X137.52 Y133.224 Z13.2 F30000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3023
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.16 J-3.227 E.21654
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3023
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.803 E.21636
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3023
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.649 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.876 Y129.227 I12.459 J3.227 E.21643
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3023
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 77/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L77
M991 S0 P76 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z13.2 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.339 Y121.433 Z13.4 F30000
G1 X140.885 Y125.522 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.887 Y125.936 E.01371
G3 X123.288 Y113.994 I-12.896 J.066 E1.85841
G3 X128.596 Y113.12 I4.717 J12.095 E.17974
G3 X140.867 Y125.293 I-.605 J12.882 E.62837
G1 X140.881 Y125.463 E.00564
G1 X141.277 Y125.511 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.278 Y125.932 E.01295
G3 X123.145 Y113.629 I-13.288 J.069 E1.77377
G3 X128.615 Y112.728 I4.86 J12.462 E.1716
G3 X141.258 Y125.271 I-.625 J13.273 E.59968
G1 X141.272 Y125.451 E.00556
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y125.932 E-.1829
G1 X141.28 Y126.515 E-.22143
G1 X141.208 Y127.448 E-.35567
; WIPE_END
G1 E-.04 F1800
G1 X138.221 Y120.425 Z13.4 F30000
G1 X137.52 Y118.776 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.16 J3.227 E.21654
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.876 Y129.227 E.04302
G3 X115.875 Y122.773 I12.46 J-3.227 E.21643
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.808 E.21636
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 78/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L78
M991 S0 P77 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z13.4 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3023
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3023
G1 X131.036 Y115.209 E.01717
G3 X127.721 Y114.793 I-3.036 J10.789 E2.06087
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.23517
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.10002
; WIPE_END
G1 E-.04 F1800
G1 X137.339 Y121.433 Z13.6 F30000
G1 X140.885 Y125.521 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3023
G1 X140.887 Y125.937 E.01378
G3 X123.288 Y113.994 I-12.896 J.065 E1.85838
G3 X128.6 Y113.12 I4.717 J12.094 E.17989
G3 X140.867 Y125.294 I-.609 J12.882 E.62825
G1 X140.881 Y125.461 E.00557
G1 X141.277 Y125.509 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P55 R12
G1 F3023
G1 X141.278 Y125.933 E.01302
G3 X123.145 Y113.629 I-13.288 J.068 E1.77374
G3 X128.62 Y112.729 I4.86 J12.462 E.17174
G3 X141.258 Y125.271 I-.629 J13.273 E.59956
G1 X141.272 Y125.45 E.00549
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y125.933 E-.1837
G1 X141.28 Y126.517 E-.22179
G1 X141.209 Y127.447 E-.35451
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z13.6 F30000
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3023
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.65 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.16 J-3.227 E.21654
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3023
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.812 E.21636
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3023
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.461 J3.227 E.21643
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3023
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 79/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L79
M991 S0 P78 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z13.6 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.311 E2.32212
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.598 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.495 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X131.036 Y115.209 E.01717
G3 X127.721 Y114.793 I-3.036 J10.791 E2.06116
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.206 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.23518
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.10002
; WIPE_END
G1 E-.04 F1800
G1 X137.34 Y121.432 Z13.8 F30000
G1 X140.885 Y125.517 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.886 Y125.937 E.01395
G3 X123.288 Y113.994 I-12.896 J.064 E1.85832
G3 X128.605 Y113.12 I4.717 J12.094 E.18004
G3 X140.867 Y125.295 I-.614 J12.881 E.62812
G1 X140.88 Y125.457 E.0054
G1 X141.277 Y125.505 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.278 Y125.934 E.01317
G3 X123.145 Y113.629 I-13.288 J.068 E1.77372
G3 X128.624 Y112.729 I4.86 J12.461 E.17188
G3 X141.258 Y125.272 I-.634 J13.273 E.59945
G1 X141.272 Y125.445 E.00533
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y125.934 E-.18567
G1 X141.28 Y126.518 E-.22215
G1 X141.209 Y127.443 E-.35218
; WIPE_END
G1 E-.04 F1800
G1 X138.22 Y120.42 Z13.8 F30000
G1 X137.52 Y118.776 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.16 J3.227 E.21654
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.462 J-3.227 E.21643
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.817 E.21636
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 80/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L80
M991 S0 P79 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z13.8 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3023
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3023
G1 X130.494 Y115.071 E0
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X129.947 Y114.96 I-.279 J11.205 E.05153
G1 X130.436 Y115.059 E.01533
M204 S10000
; WIPE_START
G1 F24000
G1 X130.494 Y115.071 E-.02282
G1 X131.036 Y115.209 E-.21241
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.09997
; WIPE_END
G1 E-.04 F1800
G1 X137.342 Y121.43 Z14 F30000
M73 P56 R12
G1 X140.885 Y125.509 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3023
G1 X140.886 Y125.938 E.01422
G3 X123.288 Y113.994 I-12.896 J.063 E1.85829
G3 X128.609 Y113.121 I4.717 J12.093 E.18018
G3 X140.867 Y125.296 I-.618 J12.881 E.628
G1 X140.88 Y125.45 E.00513
G1 X141.277 Y125.498 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3023
G1 X141.278 Y125.935 E.01342
G3 X123.145 Y113.629 I-13.288 J.067 E1.77369
G3 X128.629 Y112.729 I4.86 J12.461 E.17201
G3 X141.258 Y125.273 I-.638 J13.272 E.59934
G1 X141.272 Y125.438 E.00509
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y125.935 E-.18874
G1 X141.28 Y126.52 E-.2225
G1 X141.209 Y127.435 E-.34876
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z14 F30000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3023
G3 X136.448 Y134.448 I-10.245 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.65 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.16 J-3.227 E.21654
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3023
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.821 E.21635
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3023
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.463 J3.227 E.21643
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.175 J-9.109 E.05401
G1 X122.342 Y137.2 F30000
G1 F3023
G2 X123.84 Y137.836 I5.937 J-11.887 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 81/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L81
M991 S0 P80 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z14 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X130.494 Y115.071 E0
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X129.947 Y114.96 I-.279 J11.205 E.05153
G1 X130.436 Y115.059 E.01533
M204 S10000
; WIPE_START
G1 F24000
G1 X130.494 Y115.071 E-.02282
G1 X131.036 Y115.209 E-.21241
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.09997
; WIPE_END
G1 E-.04 F1800
G1 X137.345 Y121.428 Z14.2 F30000
G1 X140.885 Y125.5 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.886 Y125.939 E.01458
G3 X123.288 Y113.994 I-12.896 J.063 E1.85826
G3 X128.614 Y113.121 I4.717 J12.093 E.18033
G3 X140.867 Y125.296 I-.623 J12.881 E.62788
G1 X140.88 Y125.44 E.00477
G1 X141.276 Y125.488 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.278 Y125.936 E.01375
G3 X123.145 Y113.629 I-13.288 J.066 E1.77367
G3 X128.633 Y112.729 I4.86 J12.461 E.17215
G3 X141.258 Y125.274 I-.643 J13.272 E.59922
G1 X141.271 Y125.428 E.00476
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y125.936 E-.19281
G1 X141.279 Y126.522 E-.22285
G1 X141.21 Y127.425 E-.34434
; WIPE_END
G1 E-.04 F1800
G1 X138.215 Y120.405 Z14.2 F30000
G1 X137.52 Y118.776 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.16 J3.227 E.21654
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.876 Y129.227 E.04302
G3 X115.875 Y122.773 I12.463 J-3.227 E.21643
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.826 E.21635
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 82/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L82
M991 S0 P81 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z14.2 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3023
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.495 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3023
G1 X131.036 Y115.209 E.01717
G3 X127.721 Y114.793 I-3.036 J10.789 E2.06087
G1 X128.279 Y114.793 E.01718
M73 P57 R12
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.23517
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.10003
; WIPE_END
G1 E-.04 F1800
G1 X137.349 Y121.425 Z14.4 F30000
G1 X140.884 Y125.487 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3023
G1 X140.886 Y125.94 E.01501
G3 X123.288 Y113.994 I-12.896 J.062 E1.85823
G3 X128.618 Y113.121 I4.717 J12.093 E.18048
G3 X140.867 Y125.297 I-.627 J12.881 E.62776
G1 X140.879 Y125.428 E.00434
G1 X141.276 Y125.476 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3023
G1 X141.278 Y125.936 E.01415
G3 X122.534 Y113.886 I-13.287 J.064 E1.75311
G3 X128.638 Y112.729 I5.45 J12.075 E.19268
G3 X141.258 Y125.275 I-.646 J13.271 E.59912
G1 X141.271 Y125.416 E.00436
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y125.936 E-.19778
G1 X141.279 Y126.524 E-.22321
G1 X141.211 Y127.413 E-.33902
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z14.4 F30000
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3023
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.467 J-3.227 E.21643
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3023
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.831 E.21635
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3023
G3 X119.552 Y117.552 I10.246 J7.884 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
M73 P57 R11
G2 X115.875 Y129.227 I12.464 J3.227 E.21643
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3023
G2 X123.84 Y137.836 I5.937 J-11.887 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 83/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L83
M991 S0 P82 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z14.4 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X131.036 Y115.209 E.01717
G3 X127.721 Y114.793 I-3.036 J10.789 E2.06087
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.23517
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.10002
; WIPE_END
G1 E-.04 F1800
G1 X137.353 Y121.421 Z14.6 F30000
G1 X140.884 Y125.473 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.886 Y125.941 E.01552
G3 X123.288 Y113.994 I-12.896 J.061 E1.85821
G3 X128.623 Y113.121 I4.717 J12.092 E.18063
G3 X140.867 Y125.298 I-.632 J12.88 E.62764
G1 X140.878 Y125.413 E.00383
G1 X141.276 Y125.461 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.279 Y125.937 E.01462
G3 X122.534 Y113.886 I-13.288 J.065 E1.7533
G3 X128.642 Y112.73 I5.45 J12.075 E.19282
G3 X141.26 Y125.275 I-.651 J13.272 E.59903
G1 X141.271 Y125.402 E.00389
M204 S10000
; WIPE_START
G1 F24000
G1 X141.279 Y125.937 E-.20357
G1 X141.279 Y126.525 E-.22357
G1 X141.212 Y127.399 E-.33286
; WIPE_END
G1 E-.04 F1800
G1 X138.208 Y120.383 Z14.6 F30000
G1 X137.52 Y118.776 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.65 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.468 J3.227 E.21643
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.245 J-7.883 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.464 J-3.227 E.21643
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.887 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.835 E.21635
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 84/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L84
M991 S0 P83 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z14.6 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z14.6
G1 Z14.4
M73 P58 R11
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3023
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3023
G1 X130.494 Y115.071 E0
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X129.947 Y114.96 I-.279 J11.205 E.05153
G1 X130.436 Y115.059 E.01533
M204 S10000
; WIPE_START
G1 F24000
G1 X130.494 Y115.071 E-.02281
G1 X131.036 Y115.209 E-.21241
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.09998
; WIPE_END
G1 E-.04 F1800
G1 X137.357 Y121.417 Z14.8 F30000
G1 X140.883 Y125.457 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3023
G1 X140.886 Y125.942 E.01609
G3 X123.288 Y113.994 I-12.896 J.06 E1.85818
G3 X128.627 Y113.122 I4.716 J12.092 E.18078
G3 X140.867 Y125.299 I-.636 J12.88 E.62751
G1 X140.877 Y125.397 E.00326
G1 X141.275 Y125.445 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3023
G1 X141.279 Y125.938 E.01515
G3 X122.534 Y113.886 I-13.288 J.064 E1.75327
G3 X128.647 Y112.73 I5.45 J12.075 E.19295
G3 X141.26 Y125.276 I-.655 J13.272 E.59892
G1 X141.27 Y125.385 E.00336
M204 S10000
; WIPE_START
G1 F24000
G1 X141.279 Y125.938 E-.21007
G1 X141.279 Y126.527 E-.22392
G1 X141.214 Y127.383 E-.326
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z14.8 F30000
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3023
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.468 J-3.227 E.21643
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3023
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.84 E.21635
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3023
G3 X119.552 Y117.552 I10.246 J7.884 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.649 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.464 J3.227 E.21643
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3023
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 85/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L85
M991 S0 P84 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z14.8 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z14.8
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.362 Y121.413 Z15 F30000
G1 X140.883 Y125.439 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.886 Y125.941 E.01668
G3 X123.288 Y113.994 I-12.896 J.06 E1.85819
G3 X128.631 Y113.122 I4.716 J12.092 E.18093
G3 X140.867 Y125.3 I-.641 J12.88 E.62739
G1 X140.876 Y125.379 E.00264
G1 X141.275 Y125.427 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.279 Y125.938 E.01571
G3 X122.534 Y113.886 I-13.288 J.064 E1.75326
G3 X128.651 Y112.73 I5.45 J12.075 E.19309
G3 X141.26 Y125.277 I-.66 J13.272 E.59881
G1 X141.269 Y125.367 E.00279
M204 S10000
; WIPE_START
G1 F24000
G1 X141.279 Y125.938 E-.21706
G1 X141.279 Y126.529 E-.22438
G1 X141.215 Y127.365 E-.31857
; WIPE_END
G1 E-.04 F1800
G1 X138.199 Y120.354 Z15 F30000
G1 X137.52 Y118.776 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.469 J3.227 E.21643
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.445 Y134.445 E.02002
G2 X137.52 Y133.224 I-10.476 J-10.307 E.054
G1 X133.658 Y137.2 F30000
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.245 J-7.883 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.465 J-3.227 E.21643
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.555 Y117.555 E.02002
G2 X118.48 Y118.776 I10.476 J10.307 E.054
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.844 E.21635
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
M73 P59 R11
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 86/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L86
M991 S0 P85 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z15 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z15
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3026
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3026
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.368 Y121.408 Z15.2 F30000
G1 X140.882 Y125.419 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3026
G1 X140.886 Y125.942 E.01735
G3 X123.288 Y113.994 I-12.896 J.06 E1.85816
G3 X128.636 Y113.122 I4.716 J12.092 E.18108
G3 X140.867 Y125.301 I-.645 J12.88 E.62727
G1 X140.875 Y125.36 E.00197
G1 X141.274 Y125.408 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3026
G1 X141.279 Y125.939 E.01634
G3 X122.534 Y113.886 I-13.288 J.063 E1.75324
G3 X128.656 Y112.73 I5.45 J12.075 E.19323
G3 X141.26 Y125.278 I-.664 J13.272 E.5987
G1 X141.268 Y125.348 E.00217
M204 S10000
; WIPE_START
G1 F24000
G1 X141.279 Y125.939 E-.22472
G1 X141.279 Y126.531 E-.22473
G1 X141.217 Y127.345 E-.31055
; WIPE_END
G1 E-.04 F1800
G1 X136.702 Y133.499 Z15.2 F30000
G1 X135.222 Y135.517 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3026
G2 X136.448 Y134.448 I-12.973 J-16.129 E.05398
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.362 Y129.686 E.02227
G1 X139.195 Y130.157 E.01657
G1 X140.125 Y129.227 E.0436
G2 X140.125 Y122.773 I-12.47 J-3.227 E.21643
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3026
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.849 E.21634
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3026
G3 X119.552 Y117.552 I10.245 J7.884 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.876 Y122.773 E.04302
G2 X115.875 Y129.227 I12.466 J3.227 E.21643
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3026
G2 X123.84 Y137.836 I5.937 J-11.887 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 87/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L87
M991 S0 P86 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z15.2 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z15.2
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.374 Y121.403 Z15.4 F30000
G1 X140.882 Y125.399 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.886 Y125.943 E.01806
G3 X123.288 Y113.994 I-12.896 J.059 E1.85813
G3 X128.64 Y113.122 I4.716 J12.092 E.18123
G3 X140.867 Y125.301 I-.65 J12.879 E.62715
G1 X140.873 Y125.339 E.00127
G1 X141.274 Y125.387 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.278 Y125.94 E.01699
G3 X122.534 Y113.886 I-13.287 J.061 E1.75299
G3 X128.66 Y112.731 I5.45 J12.075 E.19337
G3 X141.258 Y125.279 I-.669 J13.27 E.59856
G1 X141.265 Y125.328 E.00152
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y125.94 E-.23276
G1 X141.279 Y126.532 E-.22509
G1 X141.218 Y127.325 E-.30216
; WIPE_END
G1 E-.04 F1800
G1 X138.188 Y120.32 Z15.4 F30000
G1 X137.52 Y118.776 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.47 J3.227 E.21643
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.445 Y134.445 E.02002
G2 X137.52 Y133.224 I-10.616 J-10.428 E.054
G1 X133.658 Y137.2 F30000
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.467 J-3.227 E.21643
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.555 Y117.555 E.02002
G2 X118.48 Y118.776 I10.616 J10.428 E.054
M73 P60 R11
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.854 E.21634
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 88/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L88
M991 S0 P87 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z15.4 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z15.4
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3023
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3023
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.378 Y121.399 Z15.6 F30000
G1 X140.876 Y125.378 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3023
G1 X140.886 Y126.061 E.02266
G3 X123.288 Y113.994 I-12.896 J-.059 E1.85422
G3 X128.645 Y113.122 I4.716 J12.092 E.18138
G3 X140.859 Y125.161 I-.654 J12.879 E.62232
G1 X140.872 Y125.318 E.00524
G1 X141.268 Y125.366 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3023
G1 X141.278 Y126.064 E.02146
G3 X122.534 Y113.886 I-13.287 J-.063 E1.74919
G3 X128.664 Y112.731 I5.45 J12.076 E.1935
G3 X141.25 Y125.133 I-.673 J13.27 E.59394
G1 X141.263 Y125.306 E.00532
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y126.064 E-.2881
G1 X141.268 Y126.768 E-.26764
G1 X141.225 Y127.304 E-.20426
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z15.6 F30000
G1 Z15.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3023
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.569 J-3.227 E.21639
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3023
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.858 E.21634
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3023
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.649 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.471 J3.227 E.21643
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.175 J-9.109 E.05401
G1 X122.342 Y137.2 F30000
G1 F3023
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 89/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L89
M991 S0 P88 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z15.6 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z15.6
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.384 Y121.393 Z15.8 F30000
G1 X140.876 Y125.356 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.886 Y126.06 E.02337
G3 X123.288 Y113.994 I-12.896 J-.058 E1.85425
G3 X128.649 Y113.123 I4.716 J12.092 E.18152
G3 X140.859 Y125.163 I-.659 J12.879 E.62226
G1 X140.871 Y125.296 E.00441
G1 X141.267 Y125.343 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.278 Y126.063 E.02211
G3 X123.145 Y113.629 I-13.288 J-.062 E1.76975
G3 X128.669 Y112.731 I4.86 J12.459 E.17325
G3 X141.25 Y125.136 I-.679 J13.27 E.59388
G1 X141.262 Y125.284 E.00455
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y126.063 E-.29619
G1 X141.268 Y126.767 E-.26741
G1 X141.226 Y127.282 E-.1964
; WIPE_END
G1 E-.04 F1800
G1 X138.177 Y120.285 Z15.8 F30000
G1 X137.52 Y118.776 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.246 J7.884 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.568 J3.227 E.21639
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
M73 P60 R10
G2 X116.792 Y130.144 I4.651 J-1.341 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.472 J-3.227 E.21642
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
M73 P61 R10
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.863 E.21634
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 90/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L90
M991 S0 P89 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z15.8 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z15.8
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3023
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3023
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.391 Y121.388 Z16 F30000
G1 X140.875 Y125.333 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3023
G1 X140.886 Y126.059 E.02409
G3 X123.288 Y113.994 I-12.896 J-.057 E1.85428
G3 X128.654 Y113.123 I4.716 J12.092 E.18167
G3 X140.859 Y125.166 I-.663 J12.879 E.62221
G1 X140.87 Y125.273 E.00357
G1 X141.267 Y125.321 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3023
G1 X141.278 Y126.062 E.02278
G3 X123.145 Y113.629 I-13.288 J-.061 E1.76978
G3 X128.673 Y112.731 I4.86 J12.459 E.17339
G3 X141.25 Y125.139 I-.683 J13.27 E.59383
G1 X141.261 Y125.261 E.00377
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y126.062 E-.30443
G1 X141.268 Y126.765 E-.26721
G1 X141.228 Y127.259 E-.18836
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z16 F30000
G1 Z15.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3023
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.567 J-3.227 E.21639
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3023
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.867 E.21634
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3023
G3 X119.552 Y117.552 I10.246 J7.884 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.649 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.473 J3.227 E.21642
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.175 J-9.109 E.05401
G1 X122.342 Y137.2 F30000
G1 F3023
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 91/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L91
M991 S0 P90 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z16 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z16
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3040
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3040
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.397 Y121.382 Z16.2 F30000
G1 X140.875 Y125.31 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3040
G1 X140.886 Y126.058 E.02482
G3 X123.288 Y113.994 I-12.896 J-.057 E1.85431
G3 X128.658 Y113.123 I4.716 J12.092 E.18182
G3 X140.86 Y125.169 I-.668 J12.879 E.62215
G1 X140.868 Y125.25 E.00272
G1 X141.266 Y125.298 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3040
G1 X141.278 Y126.061 E.02345
G3 X123.145 Y113.629 I-13.288 J-.06 E1.7698
G3 X128.678 Y112.731 I4.86 J12.459 E.17353
G3 X141.25 Y125.142 I-.688 J13.27 E.59378
G1 X141.26 Y125.238 E.00298
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y126.061 E-.31275
G1 X141.268 Y126.764 E-.26698
G1 X141.23 Y127.237 E-.18027
; WIPE_END
G1 E-.04 F1800
G1 X138.165 Y120.247 Z16.2 F30000
G1 X137.52 Y118.776 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3040
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.65 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.567 J3.227 E.21639
G1 X139.194 Y130.158 E.04363
G1 X139.362 Y129.686 E.0166
G1 X139.837 Y130.161 E.02227
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G3 X135.222 Y135.517 I-14.2 J-15.06 E.05398
G1 X133.658 Y137.2 F30000
G1 F3040
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3040
G2 X119.552 Y134.448 I10.245 J-7.883 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.474 J-3.227 E.21642
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
M73 P62 R10
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3040
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.872 E.21634
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 92/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L92
M991 S0 P91 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z16.2 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z16.2
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3024
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.404 Y121.376 Z16.4 F30000
G1 X140.874 Y125.287 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3024
G1 X140.886 Y126.057 E.02554
G3 X123.288 Y113.994 I-12.896 J-.056 E1.85434
G3 X128.663 Y113.123 I4.716 J12.092 E.18197
G3 X140.86 Y125.172 I-.672 J12.878 E.62209
G1 X140.867 Y125.228 E.00188
G1 X141.266 Y125.275 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G1 X141.278 Y126.06 E.02413
G3 X123.145 Y113.629 I-13.288 J-.059 E1.76983
G3 X128.682 Y112.732 I4.86 J12.459 E.17367
G3 X141.25 Y125.145 I-.692 J13.27 E.59373
G1 X141.259 Y125.216 E.0022
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y126.06 E-.32105
G1 X141.268 Y126.762 E-.26677
G1 X141.232 Y127.214 E-.17218
; WIPE_END
G1 E-.04 F1800
G1 X136.757 Y133.397 Z16.4 F30000
G1 X135.222 Y135.517 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3024
G2 X136.448 Y134.448 I-12.974 J-16.13 E.05398
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.362 Y129.686 E.02227
G1 X139.194 Y130.158 E.01661
G1 X140.125 Y129.227 E.04364
G2 X140.125 Y122.773 I-12.566 J-3.227 E.21639
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3024
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.876 E.21634
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X120.778 Y116.483 F30000
G1 F3024
G2 X119.552 Y117.552 I12.973 J16.128 E.05398
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.638 Y122.314 E.02227
G1 X116.804 Y121.844 E.01655
G1 X115.875 Y122.773 E.04358
G2 X115.875 Y129.227 I12.475 J3.227 E.21642
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.175 J-9.109 E.05401
G1 X122.342 Y137.2 F30000
G1 F3024
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 93/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L93
M991 S0 P92 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z16.4 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z16.4
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3040
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3040
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.41 Y121.37 Z16.6 F30000
G1 X140.873 Y125.265 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3040
G1 X140.886 Y126.056 E.02626
G3 X123.288 Y113.994 I-12.896 J-.055 E1.85437
G3 X128.667 Y113.124 I4.716 J12.092 E.18212
G3 X140.86 Y125.174 I-.677 J12.878 E.62204
G1 X140.865 Y125.205 E.00104
G1 X141.265 Y125.253 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3040
G1 X141.278 Y126.059 E.02479
G3 X123.145 Y113.629 I-13.288 J-.058 E1.76986
G3 X128.687 Y112.732 I4.86 J12.46 E.17381
G3 X141.251 Y125.147 I-.697 J13.27 E.59368
G1 X141.257 Y125.193 E.00143
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y126.059 E-.32922
G1 X141.268 Y126.761 E-.26657
G1 X141.234 Y127.192 E-.16421
; WIPE_END
G1 E-.04 F1800
G1 X138.152 Y120.209 Z16.6 F30000
G1 X137.52 Y118.776 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3040
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.566 J3.227 E.21639
G1 X139.194 Y130.158 E.04365
G1 X139.362 Y129.686 E.01661
G1 X139.837 Y130.161 E.02228
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G3 X135.222 Y135.517 I-14.2 J-15.06 E.05398
G1 X133.658 Y137.2 F30000
G1 F3040
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3040
G2 X119.552 Y134.448 I10.245 J-7.883 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.179 J-3.227 E.21653
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
M73 P63 R10
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3040
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.881 E.21633
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 94/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L94
M991 S0 P93 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z16.6 I-.241 J-1.193 P1  F30000
G1 X130.591 Y114.691 Z16.6
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3024
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.416 Y121.365 Z16.8 F30000
G1 X140.873 Y125.243 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3024
G1 X140.887 Y126.055 E.02696
G3 X123.288 Y113.994 I-12.896 J-.054 E1.8544
G3 X128.672 Y113.124 I4.716 J12.092 E.18227
G3 X140.86 Y125.177 I-.681 J12.878 E.62198
G1 X140.862 Y125.184 E.00023
G1 X141.264 Y125.231 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G1 X141.278 Y126.059 E.02544
G3 X123.145 Y113.629 I-13.288 J-.057 E1.76988
G3 X128.691 Y112.732 I4.86 J12.46 E.17394
G3 X141.251 Y125.15 I-.701 J13.269 E.59363
G1 X141.254 Y125.172 E.00067
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y126.059 E-.33714
G1 X141.268 Y126.759 E-.26635
G1 X141.235 Y127.17 E-.15651
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z16.8 F30000
G1 Z16.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3024
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.565 J-3.227 E.21639
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3024
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.885 E.21633
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3024
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.649 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.478 J3.227 E.21642
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.175 J-9.109 E.05401
G1 X122.342 Y137.2 F30000
G1 F3024
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 95/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L95
M991 S0 P94 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z16.8 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z16.8
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3048
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3048
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.422 Y121.359 Z17 F30000
G1 X140.872 Y125.222 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3048
G1 X140.887 Y126.055 E.02764
G3 X123.288 Y113.994 I-12.896 J-.053 E1.85442
G3 X128.676 Y113.124 I4.716 J12.092 E.18242
G3 X140.859 Y125.163 I-.686 J12.878 E.62137
G1 X141.264 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3048
G1 X141.278 Y126.058 E.02606
G3 X123.145 Y113.629 I-13.288 J-.056 E1.76995
G3 X128.696 Y112.732 I4.86 J12.46 E.17408
G3 X141.251 Y125.151 I-.705 J13.269 E.59352
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y126.058 E-.34471
G1 X141.268 Y126.757 E-.26589
G1 X141.237 Y127.149 E-.1494
; WIPE_END
G1 E-.04 F1800
G1 X138.14 Y120.173 Z17 F30000
G1 X137.52 Y118.776 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3048
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.563 J3.227 E.21639
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.175 J-9.109 E.05401
G1 X133.658 Y137.2 F30000
G1 F3048
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3048
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.341 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.478 J-3.227 E.21642
G1 X116.792 Y121.856 E.04302
M73 P64 R10
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3048
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.89 E.21633
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 96/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L96
M991 S0 P95 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z17 I-.241 J-1.193 P1  F30000
G1 X130.591 Y114.691 Z17
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3029
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3029
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.428 Y121.354 Z17.2 F30000
G1 X140.872 Y125.201 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3029
G1 X140.887 Y126.054 E.02828
G3 X123.288 Y113.994 I-12.896 J-.052 E1.85445
G3 X128.681 Y113.124 I4.717 J12.092 E.18257
G3 X140.858 Y125.144 I-.69 J12.877 E.6206
G1 X141.263 Y125.189 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3029
G1 X141.278 Y126.057 E.02666
G3 X123.145 Y113.629 I-13.288 J-.055 E1.76998
G3 X128.7 Y112.733 I4.86 J12.46 E.17422
G3 X141.25 Y125.131 I-.71 J13.269 E.59278
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y126.057 E-.3518
G1 X141.268 Y126.756 E-.26568
G1 X141.239 Y127.13 E-.14252
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z17.2 F30000
G1 Z16.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3029
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.65 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.562 J-3.227 E.21639
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3029
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.894 E.21633
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3029
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.479 J3.227 E.21642
M73 P64 R9
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3029
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 97/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L97
M991 S0 P96 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z17.2 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z17.2
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3048
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3048
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.429 Y121.353 Z17.4 F30000
G1 X140.861 Y125.185 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3048
G3 X123.288 Y113.994 I-12.87 J.816 E1.88327
G3 X128.685 Y113.124 I4.717 J12.093 E.18272
G3 X140.857 Y125.126 I-.694 J12.877 E.61983
G1 X141.263 Y125.17 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3048
G1 X141.278 Y126.056 E.02721
G3 X123.145 Y113.629 I-13.288 J-.054 E1.77001
G3 X128.705 Y112.733 I4.86 J12.46 E.17436
G3 X141.249 Y125.115 I-.714 J13.269 E.59214
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y126.056 E-.35778
G1 X141.268 Y126.754 E-.26547
G1 X141.24 Y127.113 E-.13674
; WIPE_END
G1 E-.04 F1800
G1 X138.13 Y120.143 Z17.4 F30000
G1 X137.52 Y118.776 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3048
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.562 J3.227 E.21639
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3048
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3048
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.876 Y129.227 E.04302
G3 X115.875 Y122.773 I12.481 J-3.227 E.21642
M73 P65 R9
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3048
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.899 E.21633
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 98/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L98
M991 S0 P97 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z17.4 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z17.4
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3031
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3031
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.429 Y121.354 Z17.6 F30000
G1 X140.861 Y125.188 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3031
G3 X123.288 Y113.994 I-12.87 J.813 E1.88318
G3 X128.69 Y113.125 I4.717 J12.093 E.18286
G3 X140.857 Y125.128 I-.699 J12.877 E.61977
G1 X141.262 Y125.153 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3031
G1 X141.252 Y125.161 E.0004
G3 X123.145 Y113.629 I-13.261 J.84 E1.79751
G3 X128.709 Y112.733 I4.86 J12.461 E.1745
G3 X141.215 Y124.698 I-.719 J13.269 E.57913
G1 X141.256 Y125.093 E.01223
M204 S10000
; WIPE_START
G1 F24000
G1 X141.252 Y125.161 E-.02584
G1 X141.29 Y126.055 E-.33996
G1 X141.268 Y126.753 E-.26533
G1 X141.242 Y127.091 E-.12886
; WIPE_END
G1 E-.04 F1800
G1 X136.805 Y133.301 Z17.6 F30000
G1 X135.222 Y135.517 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3031
G2 X136.448 Y134.448 I-12.973 J-16.129 E.05398
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.362 Y129.686 E.02228
G1 X139.193 Y130.159 E.01665
G1 X140.125 Y129.227 E.04368
G2 X140.125 Y122.773 I-12.561 J-3.227 E.21639
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3031
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.903 E.21633
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3031
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.482 J3.227 E.21642
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3031
G2 X123.84 Y137.836 I5.937 J-11.887 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 99/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L99
M991 S0 P98 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z17.6 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z17.6
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3038
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3038
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.435 Y121.348 Z17.8 F30000
G1 X140.87 Y125.178 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3038
G1 X140.861 Y125.191 E.00052
G3 X123.288 Y113.994 I-12.87 J.811 E1.88309
G3 X128.694 Y113.125 I4.717 J12.093 E.18301
G3 X140.747 Y124.107 I-.703 J12.877 E.58554
G1 X140.863 Y125.119 E.03378
G1 X141.261 Y125.137 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3038
G1 X141.252 Y125.164 E.00086
G3 X123.145 Y113.629 I-13.262 J.838 E1.79743
G3 X128.714 Y112.733 I4.86 J12.461 E.17463
G3 X141.215 Y124.697 I-.723 J13.268 E.57899
G1 X141.254 Y125.078 E.01175
M204 S10000
; WIPE_START
G1 F24000
G1 X141.252 Y125.164 E-.03285
G1 X141.29 Y126.054 E-.33855
G1 X141.268 Y126.752 E-.26513
G1 X141.243 Y127.075 E-.12347
; WIPE_END
G1 E-.04 F1800
G1 X138.119 Y120.112 Z17.8 F30000
G1 X137.52 Y118.776 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3038
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.561 J3.227 E.21639
G1 X139.193 Y130.159 E.04369
G1 X139.362 Y129.686 E.01665
G1 X139.837 Y130.161 E.02228
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G3 X135.222 Y135.517 I-14.2 J-15.061 E.05398
G1 X133.658 Y137.2 F30000
G1 F3038
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3038
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
M73 P66 R9
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.483 J-3.227 E.21642
G1 X116.803 Y121.845 E.04352
G1 X116.638 Y122.314 E.0165
G1 X116.163 Y121.839 E.02226
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G3 X120.778 Y116.483 I14.201 J15.061 E.05398
G1 X122.342 Y114.8 F30000
G1 F3038
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.907 E.21633
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 100/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L100
M991 S0 P99 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z17.8 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z17.8
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3021
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3021
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.438 Y121.345 Z18 F30000
G1 X140.869 Y125.165 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3021
G1 X140.862 Y125.194 E.001
G3 X123.288 Y113.994 I-12.871 J.808 E1.88299
G3 X128.699 Y113.125 I4.717 J12.094 E.18316
G3 X140.747 Y124.105 I-.708 J12.876 E.58533
G1 X140.862 Y125.105 E.03339
G1 X141.26 Y125.124 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3021
G1 X141.253 Y125.167 E.00135
G3 X123.145 Y113.629 I-13.262 J.835 E1.79734
G3 X128.718 Y112.734 I4.86 J12.461 E.17477
G3 X141.215 Y124.698 I-.728 J13.268 E.57888
G1 X141.253 Y125.064 E.0113
M204 S10000
; WIPE_START
G1 F24000
G1 X141.253 Y125.167 E-.0391
G1 X141.29 Y126.053 E-.33716
G1 X141.269 Y126.75 E-.26492
G1 X141.244 Y127.062 E-.11882
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z18 F30000
G1 Z17.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3021
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.56 J-3.227 E.21639
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3021
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.912 E.21632
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X120.778 Y116.483 F30000
G1 F3021
G2 X119.552 Y117.552 I12.974 J16.13 E.05398
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.638 Y122.314 E.02226
G1 X116.803 Y121.845 E.01649
G1 X115.875 Y122.773 E.04351
G2 X115.875 Y129.227 I12.484 J3.227 E.21642
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3021
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 101/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L101
M991 S0 P100 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z18 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z18
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.441 Y121.343 Z18.2 F30000
G1 X140.867 Y125.153 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.862 Y125.197 E.00145
G3 X123.288 Y113.994 I-12.871 J.805 E1.8829
G3 X128.703 Y113.125 I4.717 J12.094 E.18331
G3 X140.747 Y124.105 I-.712 J12.876 E.58517
G1 X140.861 Y125.093 E.03302
G1 X141.259 Y125.112 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.253 Y125.17 E.00178
G3 X123.145 Y113.629 I-13.262 J.832 E1.79725
G3 X128.723 Y112.734 I4.86 J12.462 E.17491
G3 X141.215 Y124.698 I-.732 J13.268 E.57874
G1 X141.252 Y125.052 E.01095
M204 S10000
; WIPE_START
G1 F24000
G1 X141.253 Y125.17 E-.04455
G1 X141.29 Y126.052 E-.33574
G1 X141.269 Y126.749 E-.26472
G1 X141.245 Y127.05 E-.11499
; WIPE_END
G1 E-.04 F1800
G1 X138.112 Y120.091 Z18.2 F30000
G1 X137.52 Y118.776 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.559 J3.227 E.21639
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
M73 P67 R9
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.485 J-3.227 E.21642
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.887 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.916 E.21632
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 102/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L102
M991 S0 P101 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z18.2 I-.241 J-1.193 P1  F30000
G1 X130.591 Y114.691 Z18.2
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3024
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.447 Y121.338 Z18.4 F30000
G1 X140.867 Y125.134 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3024
G1 X140.862 Y125.199 E.00218
G3 X123.288 Y113.994 I-12.871 J.802 E1.88281
G3 X128.708 Y113.126 I4.717 J12.094 E.18346
G3 X140.825 Y124.737 I-.717 J12.876 E.60616
G1 X140.861 Y125.074 E.01124
G1 X141.258 Y125.103 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G1 X141.253 Y125.172 E.00214
G3 X123.145 Y113.629 I-13.262 J.829 E1.79717
G3 X128.727 Y112.734 I4.86 J12.462 E.17505
G3 X141.215 Y124.698 I-.736 J13.268 E.57859
G1 X141.252 Y125.043 E.01068
M204 S10000
; WIPE_START
G1 F24000
G1 X141.253 Y125.172 E-.04904
G1 X141.29 Y126.052 E-.33437
G1 X141.269 Y126.747 E-.26449
G1 X141.245 Y127.041 E-.1121
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z18.4 F30000
G1 Z18
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3024
G3 X136.448 Y134.448 I-10.245 J-7.883 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.559 J-3.227 E.21639
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3024
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3024
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.649 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.485 J3.227 E.21642
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3024
G2 X123.84 Y137.836 I5.937 J-11.887 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 103/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L103
M991 S0 P102 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z18.4 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z18.4
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.445 Y121.339 Z18.6 F30000
G1 X140.866 Y125.138 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.862 Y125.202 E.00214
G3 X123.288 Y113.994 I-12.871 J.799 E1.88272
G3 X128.712 Y113.126 I4.717 J12.095 E.18361
G3 X140.748 Y124.111 I-.721 J12.876 E.58508
G1 X140.859 Y125.078 E.0323
G1 X141.257 Y125.097 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.253 Y125.175 E.00242
G3 X123.145 Y113.629 I-13.262 J.826 E1.79708
G3 X128.732 Y112.734 I4.861 J12.463 E.17518
G3 X141.215 Y124.697 I-.741 J13.267 E.57844
G1 X141.251 Y125.037 E.0105
M204 S10000
; WIPE_START
G1 F24000
G1 X141.253 Y125.175 E-.05254
G1 X141.29 Y126.051 E-.33291
G1 X141.266 Y126.789 E-.28062
G1 X141.246 Y127.035 E-.09393
; WIPE_END
G1 E-.04 F1800
G1 X138.107 Y120.078 Z18.6 F30000
G1 X137.52 Y118.776 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.597 J3.227 E.21638
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
M73 P68 R8
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.341 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.486 J-3.227 E.21642
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 104/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L104
M991 S0 P103 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z18.6 I-.241 J-1.193 P1  F30000
G1 X130.591 Y114.691 Z18.6
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3024
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.168 E2.30293
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.677 I-.289 J11.598 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.446 Y121.338 Z18.8 F30000
G1 X140.865 Y125.134 Z18.8
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3024
G1 X140.863 Y125.205 E.00236
G3 X123.288 Y113.994 I-12.871 J.797 E1.88262
G3 X128.717 Y113.126 I4.717 J12.095 E.18376
G3 X140.748 Y124.11 I-.725 J12.876 E.58491
G1 X140.858 Y125.074 E.03219
G1 X141.257 Y125.093 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G1 X141.253 Y125.178 E.00262
G3 X123.145 Y113.629 I-13.263 J.824 E1.79699
G3 X128.736 Y112.734 I4.861 J12.463 E.17532
G3 X141.215 Y124.697 I-.745 J13.267 E.5783
G1 X141.251 Y125.033 E.0104
M204 S10000
; WIPE_START
G1 F24000
G1 X141.253 Y125.178 E-.055
G1 X141.29 Y126.05 E-.33153
G1 X141.266 Y126.786 E-.28012
G1 X141.247 Y127.031 E-.09336
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z18.8 F30000
G1 Z18.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3024
G3 X136.446 Y134.446 I-13.16 J-10.474 E.054
G1 X136.872 Y134.872 E.01995
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.596 J-3.227 E.21638
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3024
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3024
G3 X119.554 Y117.554 I13.16 J10.474 E.054
G1 X119.128 Y117.128 E.01995
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.649 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.487 J3.227 E.21642
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3024
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 105/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L105
M991 S0 P104 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z18.8 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z18.8
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.45 Y121.335 Z19 F30000
G1 X140.866 Y125.122 Z19
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.863 Y125.208 E.00283
G3 X123.288 Y113.994 I-12.871 J.794 E1.88249
G3 X128.721 Y113.126 I4.717 J12.096 E.18391
G3 X140.825 Y124.736 I-.73 J12.875 E.60568
G1 X140.86 Y125.063 E.01091
G1 X141.257 Y125.092 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.254 Y125.181 E.00274
G3 X123.145 Y113.629 I-13.263 J.821 E1.79687
G3 X128.741 Y112.735 I4.861 J12.463 E.17546
G3 X141.215 Y124.697 I-.75 J13.267 E.57815
G1 X141.25 Y125.032 E.01037
M204 S10000
; WIPE_START
G1 F24000
G1 X141.254 Y125.181 E-.05649
G1 X141.29 Y126.049 E-.33013
G1 X141.266 Y126.784 E-.27964
G1 X141.247 Y127.03 E-.09373
; WIPE_END
G1 E-.04 F1800
G1 X138.106 Y120.074 Z19 F30000
G1 X137.52 Y118.776 Z19
G1 Z18.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.246 J7.884 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.65 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.594 J3.227 E.21638
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.175 J-9.109 E.05401
G1 X133.658 Y137.2 F30000
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
M73 P69 R8
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.488 J-3.227 E.21642
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.492 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 106/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L106
M991 S0 P105 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z19 I-.241 J-1.193 P1  F30000
G1 X130.591 Y114.691 Z19
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3024
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.168 E2.30293
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.677 I-.289 J11.598 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.449 Y121.335 Z19.2 F30000
G1 X140.866 Y125.124 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3024
G1 X140.863 Y125.21 E.00288
G3 X123.288 Y113.994 I-12.872 J.791 E1.8824
G3 X128.726 Y113.126 I4.718 J12.096 E.18406
G3 X140.825 Y124.736 I-.734 J12.875 E.60552
G1 X140.86 Y125.064 E.01096
G1 X141.257 Y125.093 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G1 X141.254 Y125.184 E.00278
G3 X123.145 Y113.629 I-13.263 J.818 E1.79678
G3 X128.745 Y112.735 I4.861 J12.464 E.1756
G3 X141.215 Y124.696 I-.754 J13.267 E.578
G1 X141.251 Y125.033 E.01042
M204 S10000
; WIPE_START
G1 F24000
G1 X141.254 Y125.184 E-.05709
G1 X141.29 Y126.048 E-.32876
G1 X141.266 Y126.782 E-.27924
G1 X141.247 Y127.031 E-.0949
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z19.2 F30000
G1 Z18.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3024
G3 X136.446 Y134.446 I-13.375 J-10.659 E.05399
G1 X136.872 Y134.872 E.01995
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.65 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.594 J-3.227 E.21638
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3024
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3024
G3 X119.554 Y117.554 I13.374 J10.658 E.05399
G1 X119.128 Y117.128 E.01995
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.649 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.489 J3.227 E.21642
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3024
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 107/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L107
M991 S0 P106 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z19.2 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z19.2
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.448 Y121.336 Z19.4 F30000
G1 X140.864 Y125.125 Z19.4
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.871 Y125.388 E.00873
G3 X123.892 Y113.774 I-12.881 J.613 E1.89785
G3 X128.73 Y113.127 I4.09 J12.17 E.1629
G3 X140.824 Y124.735 I-.74 J12.875 E.60534
G1 X140.858 Y125.066 E.01101
G1 X141.257 Y125.097 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.254 Y125.186 E.00276
G3 X123.145 Y113.629 I-13.263 J.815 E1.7967
G3 X128.75 Y112.735 I4.861 J12.465 E.17574
G3 X141.215 Y124.696 I-.759 J13.266 E.57786
G1 X141.251 Y125.037 E.01054
M204 S10000
; WIPE_START
G1 F24000
G1 X141.254 Y125.186 E-.05683
G1 X141.29 Y126.047 E-.32736
G1 X141.267 Y126.78 E-.27876
G1 X141.246 Y127.035 E-.09705
; WIPE_END
G1 E-.04 F1800
G1 X138.107 Y120.078 Z19.4 F30000
G1 X137.52 Y118.776 Z19.4
G1 Z19
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.593 J3.227 E.21638
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
M73 P70 R8
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.688 J-3.227 E.21635
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 108/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L108
M991 S0 P107 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z19.4 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z19.4
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3023
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3023
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.447 Y121.338 Z19.6 F30000
G1 X140.864 Y125.131 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3023
G1 X140.872 Y125.388 E.00853
G3 X123.892 Y113.774 I-12.881 J.614 E1.89787
G3 X128.735 Y113.127 I4.09 J12.17 E.16305
G3 X140.824 Y124.735 I-.744 J12.874 E.60518
G1 X140.858 Y125.071 E.01121
G1 X141.258 Y125.102 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3023
G1 X141.254 Y125.189 E.00268
G3 X123.145 Y113.629 I-13.263 J.812 E1.79661
G3 X128.754 Y112.735 I4.861 J12.465 E.17587
G3 X141.215 Y124.696 I-.763 J13.266 E.57772
G1 X141.251 Y125.042 E.01072
M204 S10000
; WIPE_START
G1 F24000
G1 X141.254 Y125.189 E-.05578
G1 X141.29 Y126.046 E-.32597
G1 X141.267 Y126.778 E-.27827
G1 X141.246 Y127.04 E-.09999
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z19.6 F30000
G1 Z19.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3023
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.592 J-3.227 E.21638
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3023
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3023
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.649 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.685 J3.227 E.21635
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3023
G2 X123.84 Y137.836 I5.937 J-11.887 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 109/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L109
M991 S0 P108 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z19.6 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z19.6
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.445 Y121.339 Z19.8 F30000
G1 X140.865 Y125.138 Z19.8
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.872 Y125.387 E.00826
G3 X123.892 Y113.774 I-12.881 J.614 E1.89789
G3 X128.739 Y113.127 I4.091 J12.171 E.1632
G3 X140.824 Y124.735 I-.749 J12.874 E.60502
G1 X140.859 Y125.079 E.01147
G1 X141.256 Y125.11 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.263 Y125.37 E.00801
G3 X123.145 Y113.629 I-13.272 J.63 E1.79086
G3 X128.759 Y112.736 I4.861 J12.466 E.17601
G3 X141.214 Y124.695 I-.768 J13.265 E.57755
G1 X141.25 Y125.05 E.01095
M204 S10000
; WIPE_START
G1 F24000
G1 X141.263 Y125.37 E-.12178
G1 X141.29 Y126.045 E-.25676
G1 X141.267 Y126.776 E-.27777
G1 X141.245 Y127.048 E-.10369
; WIPE_END
G1 E-.04 F1800
G1 X138.111 Y120.089 Z19.8 F30000
G1 X137.52 Y118.776 Z19.8
G1 Z19.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.59 J3.227 E.21638
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
M73 P71 R8
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.682 J-3.227 E.21635
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 110/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L110
M991 S0 P109 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z19.8 I-.241 J-1.193 P1  F30000
G1 X130.591 Y114.691 Z19.8
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3024
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.168 E2.30293
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.677 I-.289 J11.598 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G3 X127.721 Y114.793 I-2.494 J10.929 E2.07834
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.206 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.442 Y121.342 Z20 F30000
G1 X140.866 Y125.148 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3024
G1 X140.872 Y125.386 E.00793
G3 X123.892 Y113.774 I-12.881 J.615 E1.89791
G3 X128.744 Y113.127 I4.091 J12.171 E.16335
G3 X140.824 Y124.734 I-.753 J12.874 E.60487
G1 X140.86 Y125.088 E.01179
G1 X141.257 Y125.119 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G1 X141.263 Y125.37 E.0077
G3 X123.145 Y113.629 I-13.272 J.631 E1.79087
G3 X128.763 Y112.736 I4.862 J12.466 E.17615
G3 X141.214 Y124.695 I-.772 J13.264 E.57741
G1 X141.251 Y125.059 E.01125
M204 S10000
; WIPE_START
G1 F24000
G1 X141.263 Y125.37 E-.11803
G1 X141.29 Y126.044 E-.25667
G1 X141.267 Y126.774 E-.27729
G1 X141.244 Y127.057 E-.10802
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z20 F30000
G1 Z19.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3024
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.589 J-3.227 E.21638
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3024
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.489 Y118.783 F30000
G1 F3024
G3 X119.552 Y117.552 I9.947 J7.51 E.054
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
M73 P71 R7
G3 X116.792 Y121.856 I4.649 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.876 Y129.227 I12.678 J3.227 E.21635
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3024
G2 X123.84 Y137.836 I5.937 J-11.887 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 111/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L111
M991 S0 P110 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z20 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z20
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3040
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.168 E2.30293
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.677 I-.289 J11.598 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3040
G3 X127.721 Y114.793 I-2.494 J10.929 E2.07834
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.206 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.439 Y121.344 Z20.2 F30000
G1 X140.866 Y125.158 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3040
G1 X140.872 Y125.39 E.00769
G3 X123.892 Y113.774 I-12.881 J.611 E1.8978
G3 X128.748 Y113.128 I4.091 J12.172 E.1635
G3 X140.824 Y124.733 I-.757 J12.874 E.60467
G1 X140.86 Y125.099 E.0122
G1 X141.257 Y125.13 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3040
G1 X141.263 Y125.37 E.0074
G3 X123.767 Y113.402 I-13.273 J.631 E1.81138
G3 X128.768 Y112.736 I4.215 J12.542 E.15596
G3 X141.214 Y124.694 I-.777 J13.265 E.57724
G1 X141.251 Y125.07 E.0116
M204 S10000
; WIPE_START
G1 F24000
G1 X141.263 Y125.37 E-.11422
G1 X141.29 Y126.044 E-.25601
G1 X141.267 Y126.772 E-.27681
G1 X141.244 Y127.068 E-.11296
; WIPE_END
G1 E-.04 F1800
G1 X138.117 Y120.105 Z20.2 F30000
G1 X137.52 Y118.776 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3040
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.65 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.586 J3.227 E.21639
G1 X139.192 Y130.16 E.04376
G1 X139.362 Y129.686 E.01672
G1 X139.837 Y130.161 E.02229
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G3 X135.222 Y135.517 I-14.201 J-15.061 E.05398
G1 X133.658 Y137.2 F30000
M73 P72 R7
G1 F3040
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3040
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.676 J-3.227 E.21635
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3040
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 20
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 112/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L112
M991 S0 P111 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z20.2 I-.241 J-1.193 P1  F30000
G1 X130.591 Y114.691 Z20.2
G1 Z20
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3027
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3027
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.436 Y121.347 Z20.4 F30000
G1 X140.867 Y125.171 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3027
G1 X140.872 Y125.389 E.00726
G3 X123.892 Y113.774 I-12.881 J.612 E1.89781
G3 X128.753 Y113.128 I4.091 J12.173 E.16365
G3 X140.824 Y124.732 I-.762 J12.873 E.60451
G1 X140.861 Y125.111 E.01262
G1 X141.258 Y125.142 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3027
G1 X141.263 Y125.37 E.007
G3 X123.767 Y113.402 I-13.273 J.631 E1.81144
G3 X128.772 Y112.736 I4.216 J12.542 E.15609
G3 X141.214 Y124.694 I-.782 J13.265 E.57709
G1 X141.252 Y125.082 E.012
M204 S10000
; WIPE_START
G1 F24000
G1 X141.263 Y125.37 E-.10932
G1 X141.29 Y126.043 E-.25591
G1 X141.267 Y126.769 E-.27632
G1 X141.243 Y127.08 E-.11846
; WIPE_END
G1 E-.04 F1800
G1 X136.809 Y133.293 Z20.4 F30000
G1 X135.222 Y135.517 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3027
G2 X136.448 Y134.448 I-12.973 J-16.129 E.05398
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.362 Y129.686 E.02229
G1 X139.192 Y130.16 E.01673
G1 X140.125 Y129.227 E.04377
G2 X140.125 Y122.773 I-12.584 J-3.227 E.21639
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3027
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3027
G3 X119.552 Y117.552 I10.246 J7.884 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.649 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.673 J3.227 E.21636
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3027
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 20.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 113/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L113
M991 S0 P112 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z20.4 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z20.4
G1 Z20.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3044
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3044
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.432 Y121.351 Z20.6 F30000
G1 X140.868 Y125.184 Z20.6
G1 Z20.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3044
G1 X140.872 Y125.389 E.00679
G3 X123.892 Y113.774 I-12.881 J.612 E1.89784
G3 X128.757 Y113.128 I4.091 J12.173 E.1638
G3 X140.824 Y124.732 I-.766 J12.873 E.60436
G1 X140.862 Y125.124 E.01308
G1 X141.259 Y125.156 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3044
G1 X141.264 Y125.369 E.00656
G3 X123.767 Y113.402 I-13.273 J.632 E1.81146
G3 X128.777 Y112.736 I4.216 J12.543 E.15623
G3 X141.214 Y124.694 I-.786 J13.265 E.57696
G1 X141.253 Y125.096 E.01242
M204 S10000
; WIPE_START
G1 F24000
G1 X141.264 Y125.369 E-.10391
G1 X141.29 Y126.042 E-.25582
G1 X141.267 Y126.767 E-.27582
G1 X141.241 Y127.094 E-.12445
; WIPE_END
G1 E-.04 F1800
G1 X140.008 Y126.686 Z20.6 F30000
G1 Z20.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.507444
G1 F3044
G1 X140.021 Y126.46 E.00856
G1 X137.52 Y118.776 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3044
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.65 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.583 J3.227 E.21639
M73 P73 R7
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3044
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3044
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.67 J-3.227 E.21636
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3044
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 20.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 114/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L114
M991 S0 P113 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z20.6 I-.241 J-1.193 P1  F30000
G1 X130.591 Y114.691 Z20.6
G1 Z20.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3024
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.428 Y121.354 Z20.8 F30000
G1 X140.869 Y125.199 Z20.8
G1 Z20.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3024
G1 X140.872 Y125.388 E.00628
G3 X123.892 Y113.774 I-12.881 J.613 E1.89786
G3 X128.761 Y113.128 I4.092 J12.174 E.16394
G3 X140.824 Y124.732 I-.77 J12.873 E.6042
G1 X140.864 Y125.139 E.01358
G1 X141.26 Y125.17 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G1 X141.264 Y125.368 E.00609
G3 X123.767 Y113.402 I-13.273 J.633 E1.81148
G3 X128.781 Y112.737 I4.216 J12.544 E.15637
G3 X141.214 Y124.693 I-.79 J13.265 E.57681
G1 X141.255 Y125.111 E.01288
M204 S10000
; WIPE_START
G1 F24000
G1 X141.264 Y125.368 E-.09807
G1 X141.29 Y126.041 E-.25574
G1 X141.267 Y126.765 E-.27533
G1 X141.24 Y127.108 E-.13086
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z20.8 F30000
G1 Z20.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3024
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.582 J-3.227 E.21639
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3024
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3024
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.637 J3.227 E.21637
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3024
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 20.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 115/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L115
M991 S0 P114 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z20.8 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z20.8
G1 Z20.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.424 Y121.358 Z21 F30000
G1 X140.871 Y125.215 Z21
G1 Z20.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.872 Y125.386 E.00569
G3 X123.892 Y113.774 I-12.881 J.615 E1.89788
G3 X128.766 Y113.128 I4.092 J12.175 E.16409
G3 X140.824 Y124.731 I-.775 J12.872 E.60404
G1 X140.865 Y125.155 E.01411
G1 X141.262 Y125.186 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.263 Y125.367 E.00558
G3 X123.767 Y113.402 I-13.273 J.634 E1.81148
G3 X128.785 Y112.737 I4.216 J12.544 E.15651
G3 X141.214 Y124.693 I-.795 J13.264 E.57666
G1 X141.256 Y125.126 E.01338
M204 S10000
; WIPE_START
G1 F24000
G1 X141.263 Y125.367 E-.09168
G1 X141.29 Y126.042 E-.25646
G1 X141.268 Y126.763 E-.27421
G1 X141.239 Y127.124 E-.13765
; WIPE_END
G1 E-.04 F1800
G1 X138.133 Y120.152 Z21 F30000
G1 X137.52 Y118.776 Z21
G1 Z20.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.246 J7.884 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.582 J3.227 E.21639
G1 X139.208 Y130.144 E.04302
M73 P74 R7
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.634 J-3.227 E.21637
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 20.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 116/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L116
M991 S0 P115 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z21 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z21
G1 Z20.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3026
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3026
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.42 Y121.362 Z21.2 F30000
G1 X140.872 Y125.231 Z21.2
G1 Z20.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3026
G1 X140.871 Y125.385 E.00512
G3 X123.892 Y113.774 I-12.88 J.614 E1.89771
G3 X128.77 Y113.129 I4.092 J12.176 E.16424
G3 X140.823 Y124.731 I-.779 J12.871 E.60388
G1 X140.866 Y125.171 E.01467
G1 X141.263 Y125.202 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3026
G1 X141.264 Y125.367 E.00505
G3 X123.767 Y113.402 I-13.273 J.634 E1.81149
G3 X128.79 Y112.737 I4.216 J12.545 E.15665
G3 X141.214 Y124.693 I-.799 J13.264 E.57652
G1 X141.257 Y125.143 E.01389
M204 S10000
; WIPE_START
G1 F24000
G1 X141.264 Y125.367 E-.08518
G1 X141.29 Y126.041 E-.25634
G1 X141.268 Y126.761 E-.27372
G1 X141.238 Y127.141 E-.14476
; WIPE_END
G1 E-.04 F1800
G1 X136.785 Y133.34 Z21.2 F30000
G1 X135.222 Y135.517 Z21.2
G1 Z20.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3026
G2 X136.448 Y134.448 I-12.974 J-16.129 E.05398
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.362 Y129.686 E.02229
G1 X139.191 Y130.161 E.01675
G1 X140.125 Y129.227 E.04379
G2 X140.125 Y122.773 I-12.581 J-3.227 E.21639
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3026
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3026
G3 X119.552 Y117.552 I10.246 J7.884 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.649 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.525 J3.227 E.21641
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.175 J-9.109 E.05401
G1 X122.342 Y137.2 F30000
G1 F3026
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 21
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 117/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L117
M991 S0 P116 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z21.2 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z21.2
G1 Z21
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3040
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3040
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.415 Y121.366 Z21.4 F30000
G1 X140.873 Y125.248 Z21.4
G1 Z21
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3040
G1 X140.871 Y125.385 E.00453
G3 X123.892 Y113.774 I-12.88 J.615 E1.89773
G3 X128.775 Y113.129 I4.092 J12.176 E.16439
G3 X140.823 Y124.731 I-.784 J12.871 E.60372
G1 X140.867 Y125.189 E.01525
G1 X141.264 Y125.22 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3040
G1 X141.264 Y125.366 E.0045
G3 X123.767 Y113.402 I-13.273 J.635 E1.81151
G3 X128.794 Y112.737 I4.217 J12.546 E.15678
G3 X141.214 Y124.692 I-.804 J13.264 E.57637
G1 X141.258 Y125.16 E.01443
M204 S10000
; WIPE_START
G1 F24000
G1 X141.264 Y125.366 E-.0784
G1 X141.29 Y126.04 E-.25626
G1 X141.268 Y126.759 E-.27323
G1 X141.236 Y127.158 E-.1521
; WIPE_END
G1 E-.04 F1800
G1 X138.143 Y120.18 Z21.4 F30000
G1 X137.52 Y118.776 Z21.4
G1 Z21
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3040
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.579 J3.227 E.21639
G1 X139.191 Y130.161 E.0438
G1 X139.361 Y129.686 E.01676
M73 P75 R7
G1 X139.837 Y130.161 E.02229
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G3 X135.222 Y135.517 I-14.2 J-15.061 E.05398
G1 X133.658 Y137.2 F30000
M73 P75 R6
G1 F3040
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3040
G2 X119.552 Y134.448 I10.245 J-7.883 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.525 J-3.227 E.21641
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3040
G3 X123.84 Y114.164 I5.937 J11.887 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 21.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 118/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L118
M991 S0 P117 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z21.4 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z21.4
G1 Z21.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3024
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.41 Y121.37 Z21.6 F30000
G1 X140.874 Y125.266 Z21.6
G1 Z21.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3024
G1 X140.871 Y125.384 E.00393
G3 X124.507 Y113.584 I-12.881 J.616 E1.9193
G3 X128.779 Y113.129 I3.501 J12.583 E.14318
G3 X140.823 Y124.73 I-.789 J12.872 E.60355
G1 X140.869 Y125.206 E.01585
G1 X141.265 Y125.237 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G1 X141.264 Y125.365 E.00394
G3 X123.767 Y113.402 I-13.273 J.635 E1.81153
G3 X128.799 Y112.738 I4.217 J12.547 E.15692
G3 X141.214 Y124.692 I-.808 J13.263 E.57623
G1 X141.26 Y125.178 E.01499
M204 S10000
; WIPE_START
G1 F24000
G1 X141.264 Y125.365 E-.07145
G1 X141.29 Y126.039 E-.25616
G1 X141.268 Y126.756 E-.27274
G1 X141.235 Y127.175 E-.15965
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z21.6 F30000
G1 Z21.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3024
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.65 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.578 J-3.227 E.21639
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3024
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3024
G3 X119.552 Y117.552 I10.246 J7.884 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.876 Y122.773 E.04302
G2 X115.875 Y129.227 I12.525 J3.227 E.21641
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.175 J-9.109 E.05401
G1 X122.342 Y137.2 F30000
G1 F3024
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 21.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 119/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L119
M991 S0 P118 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z21.6 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z21.6
G1 Z21.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.405 Y121.375 Z21.8 F30000
G1 X140.876 Y125.284 Z21.8
G1 Z21.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.871 Y125.384 E.00331
G3 X124.507 Y113.584 I-12.881 J.617 E1.91932
G3 X128.784 Y113.129 I3.501 J12.584 E.14333
G3 X140.823 Y124.73 I-.794 J12.871 E.60339
G1 X140.87 Y125.224 E.01646
G1 X141.267 Y125.255 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.263 Y125.365 E.00337
G3 X123.767 Y113.402 I-13.272 J.635 E1.81136
G3 X128.803 Y112.738 I4.217 J12.548 E.15706
G3 X141.213 Y124.692 I-.812 J13.262 E.57607
G1 X141.261 Y125.196 E.01555
M204 S10000
; WIPE_START
G1 F24000
G1 X141.263 Y125.365 E-.06437
G1 X141.29 Y126.038 E-.25606
G1 X141.268 Y126.754 E-.27224
G1 X141.234 Y127.193 E-.16733
; WIPE_END
G1 E-.04 F1800
G1 X138.153 Y120.21 Z21.8 F30000
G1 X137.52 Y118.776 Z21.8
G1 Z21.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.65 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.577 J3.227 E.21639
G1 X139.208 Y130.144 E.04302
M73 P76 R6
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.245 J-7.883 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.526 J-3.227 E.21641
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 21.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 120/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L120
M991 S0 P119 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z21.8 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z21.8
G1 Z21.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3024
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.4 Y121.379 Z22 F30000
G1 X140.877 Y125.302 Z22
G1 Z21.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3024
G1 X140.872 Y125.383 E.00269
G3 X124.507 Y113.584 I-12.881 J.618 E1.91934
G3 X128.788 Y113.13 I3.502 J12.586 E.14348
G3 X140.824 Y124.73 I-.798 J12.871 E.60324
G1 X140.871 Y125.242 E.01708
G1 X141.268 Y125.273 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G1 X141.263 Y125.364 E.00279
G3 X123.767 Y113.402 I-13.272 J.635 E1.81138
G3 X128.808 Y112.738 I4.217 J12.548 E.1572
G3 X141.214 Y124.691 I-.817 J13.262 E.57593
G1 X141.262 Y125.214 E.01612
M204 S10000
; WIPE_START
G1 F24000
G1 X141.263 Y125.364 E-.05721
G1 X141.29 Y126.037 E-.25595
G1 X141.268 Y126.752 E-.27175
G1 X141.232 Y127.211 E-.17509
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z22 F30000
G1 Z21.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3024
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.575 J-3.227 E.21639
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3024
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3024
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.526 J3.227 E.21641
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.175 J-9.109 E.05401
G1 X122.342 Y137.2 F30000
G1 F3024
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 21.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 121/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L121
M991 S0 P120 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z22 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z22
G1 Z21.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.395 Y121.384 Z22.2 F30000
G1 X140.878 Y125.32 Z22.2
G1 Z21.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.872 Y125.382 E.00207
G3 X124.507 Y113.584 I-12.881 J.618 E1.91936
G3 X128.793 Y113.13 I3.502 J12.587 E.14363
G3 X140.824 Y124.729 I-.802 J12.871 E.60309
G1 X140.873 Y125.261 E.0177
G1 X141.269 Y125.292 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.263 Y125.364 E.00222
G3 X124.401 Y113.207 I-13.272 J.637 E1.83193
G3 X128.812 Y112.738 I3.608 J12.968 E.13695
G3 X141.213 Y124.691 I-.822 J13.262 E.57577
G1 X141.264 Y125.232 E.01669
M204 S10000
; WIPE_START
G1 F24000
G1 X141.263 Y125.364 E-.05005
G1 X141.29 Y126.036 E-.25585
G1 X141.268 Y126.75 E-.27127
G1 X141.231 Y127.23 E-.18283
; WIPE_END
G1 E-.04 F1800
G1 X138.163 Y120.241 Z22.2 F30000
G1 X137.52 Y118.776 Z22.2
G1 Z21.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.246 J7.884 E.05401
G1 X136.872 Y117.128 E.01986
M73 P77 R6
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.574 J3.227 E.21639
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.493 J-1.796 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.245 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.526 J-3.227 E.21641
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 22
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 122/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L122
M991 S0 P121 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z22.2 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z22.2
G1 Z22
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3024
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.39 Y121.388 Z22.4 F30000
G1 X140.88 Y125.339 Z22.4
G1 Z22
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3024
G1 X140.872 Y125.382 E.00146
G3 X124.507 Y113.584 I-12.881 J.619 E1.91938
G3 X128.797 Y113.13 I3.502 J12.589 E.14378
G3 X140.824 Y124.729 I-.807 J12.871 E.60294
G1 X140.874 Y125.279 E.01831
G1 X141.271 Y125.31 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G1 X141.263 Y125.363 E.00165
G3 X124.401 Y113.207 I-13.273 J.638 E1.832
G3 X128.817 Y112.738 I3.609 J12.97 E.13709
G3 X141.214 Y124.691 I-.827 J13.262 E.57563
G1 X141.265 Y125.25 E.01726
M204 S10000
; WIPE_START
G1 F24000
G1 X141.263 Y125.363 E-.04292
G1 X141.29 Y126.036 E-.25576
G1 X141.268 Y126.748 E-.27077
G1 X141.229 Y127.248 E-.19055
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z22.4 F30000
G1 Z22
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3024
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.65 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.573 J-3.227 E.21639
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3024
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3024
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.526 J3.227 E.21641
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.175 J-9.109 E.05401
G1 X122.342 Y137.2 F30000
G1 F3024
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 22.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 123/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L123
M991 S0 P122 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z22.4 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z22.4
G1 Z22.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.386 Y121.392 Z22.6 F30000
G1 X140.881 Y125.356 Z22.6
G1 Z22.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.872 Y125.381 E.00087
G3 X124.507 Y113.584 I-12.881 J.619 E1.9194
G3 X128.802 Y113.13 I3.503 J12.591 E.14393
G3 X140.824 Y124.729 I-.811 J12.87 E.60279
G1 X140.876 Y125.297 E.01892
G1 X141.272 Y125.328 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.263 Y125.362 E.0011
G3 X124.401 Y113.207 I-13.273 J.638 E1.83201
G3 X128.821 Y112.739 I3.609 J12.972 E.13723
G3 X141.214 Y124.69 I-.831 J13.262 E.57549
G1 X141.267 Y125.268 E.01782
M204 S10000
; WIPE_START
M73 P78 R6
G1 F24000
G1 X141.263 Y125.362 E-.03592
G1 X141.29 Y126.035 E-.25566
G1 X141.269 Y126.746 E-.27029
G1 X141.228 Y127.265 E-.19813
; WIPE_END
G1 E-.04 F1800
G1 X138.173 Y120.271 Z22.6 F30000
G1 X137.52 Y118.776 Z22.6
G1 Z22.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.571 J3.227 E.21639
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.245 J-7.883 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.526 J-3.227 E.21641
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I10.872 J10.593 E.054
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 22.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 124/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L124
M991 S0 P123 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z22.6 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z22.6
G1 Z22.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3024
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.381 Y121.396 Z22.8 F30000
G1 X140.882 Y125.374 Z22.8
G1 Z22.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3024
G1 X140.872 Y125.381 E.00041
G3 X124.507 Y113.584 I-12.881 J.62 E1.91938
G3 X128.806 Y113.13 I3.503 J12.593 E.14408
G3 X140.824 Y124.729 I-.815 J12.87 E.60263
G1 X140.877 Y125.314 E.0195
G1 X141.273 Y125.345 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G1 X141.263 Y125.362 E.0006
G3 X124.401 Y113.207 I-13.273 J.639 E1.83203
G3 X128.826 Y112.739 I3.609 J12.974 E.13736
G3 X141.214 Y124.69 I-.835 J13.262 E.57535
G1 X141.268 Y125.285 E.01837
M204 S10000
; WIPE_START
G1 F24000
G1 X141.263 Y125.362 E-.02909
G1 X141.29 Y126.034 E-.25555
G1 X141.269 Y126.743 E-.26978
G1 X141.227 Y127.283 E-.20558
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z22.8 F30000
G1 Z22.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3024
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.57 J-3.227 E.21639
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3024
M73 P78 R5
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3024
G3 X119.552 Y117.552 I10.245 J7.884 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.649 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.876 Y129.227 I12.526 J3.227 E.21641
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3024
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 22.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 125/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L125
M991 S0 P124 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z22.8 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z22.8
G1 Z22.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.381 Y121.396 Z23 F30000
G1 X140.882 Y125.372 Z23
G1 Z22.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3047
G1 X140.896 Y125.971 E.01985
G3 X128.322 Y113.106 I-12.896 J.027 E2.02742
G1 X128.964 Y113.138 E.02133
M73 P79 R5
G3 X140.878 Y125.312 I-.964 J12.86 E.6172
G1 X141.274 Y125.362 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X141.288 Y125.97 E.01868
G3 X128.331 Y112.714 I-13.288 J.028 E1.93511
G1 X128.993 Y112.747 E.02036
G3 X141.27 Y125.302 I-.993 J13.251 E.58943
M204 S10000
; WIPE_START
G1 F24000
G1 X141.288 Y125.97 E-.2538
G1 X141.275 Y126.629 E-.25038
G1 X141.234 Y127.209 E-.22094
G1 X141.223 Y127.3 E-.03489
; WIPE_END
G1 E-.04 F1800
G1 X138.182 Y120.299 Z23 F30000
G1 X137.52 Y118.776 Z23
G1 Z22.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.5 J3.227 E.21642
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3047
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3047
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.496 J-3.227 E.21642
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3047
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 22.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 126/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L126
M991 S0 P125 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z23 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z23
G1 Z22.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3029
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3029
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.377 Y121.399 Z23.2 F30000
G1 X140.883 Y125.387 Z23.2
G1 Z22.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3029
G1 X140.886 Y126.032 E.02139
G3 X125.13 Y113.426 I-12.896 J-.032 E1.91913
G3 X128.815 Y113.131 I2.853 J12.492 E.12307
G3 X140.869 Y125.334 I-.825 J12.869 E.62244
G1 X141.275 Y125.378 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3029
G1 X141.279 Y126.032 E.02009
G3 X124.401 Y113.207 I-13.288 J-.032 E1.81139
G3 X128.835 Y112.739 I3.61 J12.977 E.13764
G3 X141.262 Y125.322 I-.844 J13.261 E.59454
M204 S10000
; WIPE_START
G1 F24000
G1 X141.279 Y126.032 E-.27008
G1 X141.269 Y126.739 E-.26872
G1 X141.224 Y127.319 E-.2212
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z23.2 F30000
G1 Z22.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3029
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.65 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.567 J-3.227 E.21639
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3029
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3029
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.526 J3.227 E.21641
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.175 J-9.109 E.05401
G1 X122.342 Y137.2 F30000
G1 F3029
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 127/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L127
M991 S0 P126 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z23.2 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z23.2
G1 Z23
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
M73 P80 R5
G1 E-.04 F1800
G1 X137.373 Y121.403 Z23.4 F30000
G1 X140.883 Y125.402 Z23.4
G1 Z23
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3047
G1 X140.886 Y126.031 E.02085
G3 X125.13 Y113.426 I-12.896 J-.031 E1.91916
G3 X128.82 Y113.131 I2.854 J12.495 E.12322
G3 X140.869 Y125.345 I-.829 J12.869 E.62268
G1 X141.275 Y125.393 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X141.279 Y126.031 E.0196
G3 X124.401 Y113.207 I-13.288 J-.031 E1.81142
G3 X128.839 Y112.74 I3.61 J12.979 E.13778
G3 X141.263 Y125.335 I-.848 J13.261 E.59484
M204 S10000
; WIPE_START
G1 F24000
G1 X141.279 Y126.031 E-.2645
G1 X141.269 Y126.737 E-.26823
G1 X141.223 Y127.333 E-.22726
; WIPE_END
G1 E-.04 F1800
G1 X138.192 Y120.328 Z23.4 F30000
G1 X137.52 Y118.776 Z23.4
G1 Z23
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G2 X136.448 Y117.552 I-10.246 J7.884 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.566 J3.227 E.21639
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.493 J-1.796 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3047
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3047
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.341 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.526 J-3.227 E.21641
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3047
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 128/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L128
M991 S0 P127 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z23.4 I-.241 J-1.193 P1  F30000
G1 X130.591 Y114.691 Z23.4
G1 Z23.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3029
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3029
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.369 Y121.407 Z23.6 F30000
G1 X140.884 Y125.417 Z23.6
G1 Z23.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3029
G1 X140.886 Y126.03 E.02035
G3 X125.13 Y113.426 I-12.896 J-.03 E1.91919
G3 X128.824 Y113.131 I2.854 J12.496 E.12336
G3 X140.87 Y125.358 I-.834 J12.869 E.62298
G1 X141.276 Y125.408 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3029
G1 X141.279 Y126.03 E.01914
G3 X124.401 Y113.207 I-13.288 J-.03 E1.81144
G3 X128.844 Y112.74 I3.611 J12.981 E.13792
G3 X141.263 Y125.349 I-.852 J13.261 E.59513
M204 S10000
; WIPE_START
G1 F24000
G1 X141.279 Y126.03 E-.25899
G1 X141.269 Y126.735 E-.26775
G1 X141.222 Y127.341 E-.231
G1 X141.221 Y127.347 E-.00226
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z23.6 F30000
G1 Z23.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3029
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.564 J-3.227 E.21639
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3029
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3029
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.526 J3.227 E.21641
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.175 J-9.109 E.05401
G1 X122.342 Y137.2 F30000
G1 F3029
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.84 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 129/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L129
M991 S0 P128 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z23.6 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z23.6
G1 Z23.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3044
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.309 E2.32185
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
M73 P81 R5
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3044
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.365 Y121.41 Z23.8 F30000
G1 X140.884 Y125.43 Z23.8
G1 Z23.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3044
G1 X140.887 Y126.029 E.01989
G3 X125.13 Y113.426 I-12.896 J-.029 E1.91922
G3 X128.829 Y113.132 I2.855 J12.498 E.12351
G3 X140.871 Y125.371 I-.838 J12.869 E.62326
G1 X141.276 Y125.42 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3044
G1 X141.278 Y126.029 E.01871
G3 X125.043 Y113.043 I-13.288 J-.029 E1.83186
G3 X128.848 Y112.74 I2.941 J12.876 E.11772
G3 X141.263 Y125.359 I-.858 J13.26 E.59526
G1 X141.263 Y125.362 E.0001
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y126.029 E-.25375
G1 X141.269 Y126.733 E-.26723
G1 X141.222 Y127.34 E-.23166
G1 X141.22 Y127.36 E-.00735
; WIPE_END
G1 E-.04 F1800
G1 X138.198 Y120.351 Z23.8 F30000
G1 X137.52 Y118.776 Z23.8
G1 Z23.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3044
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.563 J3.227 E.21639
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.492 J-1.796 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.175 J-9.109 E.05401
G1 X133.658 Y137.2 F30000
G1 F3044
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3044
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.526 J-3.227 E.21641
G1 X116.798 Y121.851 E.04325
G1 X116.637 Y122.313 E.01624
G1 X116.163 Y121.839 E.02223
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G3 X120.778 Y116.483 I14.199 J15.059 E.05398
G1 X122.342 Y114.8 F30000
G1 F3044
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 130/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L130
M991 S0 P129 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z23.8 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z23.8
G1 Z23.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3023
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3023
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.362 Y121.413 Z24 F30000
G1 X140.884 Y125.441 Z24
G1 Z23.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3023
G1 X140.886 Y126.028 E.01948
G3 X125.13 Y113.426 I-12.895 J-.029 E1.91906
G3 X128.833 Y113.132 I2.855 J12.501 E.12366
G3 X140.871 Y125.377 I-.842 J12.867 E.6233
G1 X140.872 Y125.382 E.00018
G1 X141.276 Y125.432 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3023
G1 X141.278 Y126.029 E.01833
G3 X125.043 Y113.043 I-13.288 J-.028 E1.83189
G3 X128.853 Y112.74 I2.941 J12.878 E.11785
G3 X141.263 Y125.358 I-.862 J13.26 E.59511
G1 X141.266 Y125.373 E.00046
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y126.029 E-.24915
G1 X141.269 Y126.73 E-.26676
G1 X141.222 Y127.34 E-.23227
G1 X141.218 Y127.371 E-.01182
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z24 F30000
G1 Z23.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3023
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.561 J-3.227 E.21639
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3023
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3023
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.876 Y122.773 E.04302
G2 X115.875 Y129.227 I12.526 J3.227 E.21641
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3023
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 131/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L131
M991 S0 P130 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z24 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z24
G1 Z23.8
M73 P82 R5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.359 Y121.415 Z24.2 F30000
G1 X140.884 Y125.451 Z24.2
G1 Z23.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.886 Y126.027 E.01912
G3 X125.13 Y113.426 I-12.895 J-.028 E1.91908
G3 X128.838 Y113.132 I2.856 J12.503 E.12381
G3 X140.871 Y125.376 I-.847 J12.867 E.62314
G1 X140.874 Y125.392 E.00053
G1 X141.276 Y125.442 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.279 Y126.028 E.01799
G3 X125.043 Y113.043 I-13.288 J-.027 E1.83191
G3 X128.857 Y112.74 I2.942 J12.88 E.11799
G3 X141.263 Y125.358 I-.867 J13.26 E.59496
G1 X141.267 Y125.383 E.00079
M204 S10000
; WIPE_START
G1 F24000
G1 X141.279 Y126.028 E-.24507
G1 X141.27 Y126.728 E-.26631
G1 X141.224 Y127.323 E-.22647
G1 X141.217 Y127.38 E-.02216
; WIPE_END
G1 E-.04 F1800
G1 X138.204 Y120.368 Z24.2 F30000
G1 X137.52 Y118.776 Z24.2
G1 Z23.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.246 J7.884 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.65 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.56 J3.227 E.21639
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
M73 P82 R4
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.526 J-3.227 E.21641
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.173 J9.107 E.05401
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 132/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L132
M991 S0 P131 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z24.2 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z24.2
G1 Z24
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3022
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3022
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.357 Y121.418 Z24.4 F30000
G1 X140.885 Y125.46 Z24.4
G1 Z24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3022
G1 X140.886 Y126 E.01793
G3 X125.13 Y113.426 I-12.895 J-.001 E1.91997
G3 X128.842 Y113.132 I2.856 J12.505 E.12396
G3 X140.871 Y125.376 I-.851 J12.867 E.62299
G1 X140.875 Y125.401 E.00082
G1 X141.277 Y125.45 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3022
G1 X141.279 Y126 E.01689
G3 X125.043 Y113.043 I-13.288 J0 E1.83276
G3 X128.862 Y112.741 I2.942 J12.882 E.11813
G3 X141.263 Y125.357 I-.871 J13.26 E.59482
G1 X141.268 Y125.391 E.00106
M204 S10000
; WIPE_START
G1 F24000
G1 X141.279 Y126 E-.23148
G1 X141.27 Y126.726 E-.27593
G1 X141.224 Y127.323 E-.22731
G1 X141.216 Y127.389 E-.02529
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z24.4 F30000
G1 Z24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3022
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.558 J-3.227 E.21639
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3022
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3022
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.526 J3.227 E.21641
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G2 X120.607 Y135.387 I20.835 J-22.356 E.04687
G1 X120.48 Y135.56 E.00712
G1 X120.906 Y135.714 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.505024
G1 F3022
M73 P83 R4
G1 X121.01 Y135.791 E.00487
G1 X122.342 Y137.2 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3022
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 133/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L133
M991 S0 P132 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z24.4 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z24.4
G1 Z24.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.355 Y121.419 Z24.6 F30000
G1 X140.885 Y125.467 Z24.6
G1 Z24.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.886 Y126 E.01771
G3 X125.76 Y113.298 I-12.896 J-.001 E1.94149
G3 X128.847 Y113.132 I2.251 J13.098 E.10276
G3 X140.871 Y125.376 I-.857 J12.867 E.6228
G1 X140.876 Y125.407 E.00106
G1 X141.277 Y125.457 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.278 Y126 E.01669
G3 X125.043 Y113.043 I-13.287 J-.001 E1.83257
G3 X128.866 Y112.741 I2.943 J12.884 E.11827
G3 X141.263 Y125.356 I-.875 J13.258 E.59465
G1 X141.268 Y125.398 E.00128
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y126 E-.22898
G1 X141.27 Y126.724 E-.27511
G1 X141.224 Y127.323 E-.22813
G1 X141.215 Y127.395 E-.02777
; WIPE_END
G1 E-.04 F1800
G1 X138.208 Y120.38 Z24.6 F30000
G1 X137.52 Y118.776 Z24.6
G1 Z24.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.557 J3.227 E.2164
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.245 J-7.883 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.525 J-3.227 E.21641
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.522 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 134/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L134
M991 S0 P133 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z24.6 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z24.6
G1 Z24.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3023
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3023
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.353 Y121.42 Z24.8 F30000
G1 X140.885 Y125.471 Z24.8
G1 Z24.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3023
G1 X140.886 Y126 E.01755
G3 X125.76 Y113.298 I-12.896 J0 E1.94154
G3 X128.851 Y113.133 I2.251 J13.103 E.10291
G3 X140.871 Y125.375 I-.861 J12.867 E.62265
G1 X140.876 Y125.412 E.00124
G1 X141.277 Y125.462 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3023
G1 X141.278 Y126 E.01654
G3 X125.043 Y113.043 I-13.287 J-.001 E1.83257
G3 X128.871 Y112.741 I2.943 J12.886 E.11841
G3 X141.263 Y125.356 I-.879 J13.258 E.5945
G1 X141.269 Y125.402 E.00144
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y126 E-.2272
G1 X141.27 Y126.722 E-.27427
G1 X141.224 Y127.323 E-.22901
G1 X141.214 Y127.4 E-.02952
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z24.8 F30000
G1 Z24.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3023
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.555 J-3.227 E.2164
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3023
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3023
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.649 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.525 J3.227 E.21641
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.173 J-9.108 E.05401
M73 P84 R4
G1 X122.342 Y137.2 F30000
G1 F3023
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 135/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L135
M991 S0 P134 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z24.8 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z24.8
G1 Z24.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3043
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3043
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.353 Y121.421 Z25 F30000
G1 X140.885 Y125.474 Z25
G1 Z24.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3043
G1 X140.887 Y126 E.01745
G3 X125.76 Y113.298 I-12.896 J-.001 E1.94149
G3 X128.856 Y113.133 I2.252 J13.107 E.10306
G3 X140.871 Y125.374 I-.865 J12.867 E.62249
G1 X140.877 Y125.415 E.00136
G1 X141.277 Y125.465 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3043
G1 X141.279 Y126 E.01645
G3 X125.043 Y113.043 I-13.287 J-.001 E1.83256
G3 X128.875 Y112.741 I2.944 J12.889 E.11854
G3 X141.263 Y125.355 I-.884 J13.258 E.59436
G1 X141.269 Y125.405 E.00155
M204 S10000
; WIPE_START
G1 F24000
G1 X141.279 Y126 E-.22607
G1 X141.27 Y126.72 E-.27345
G1 X141.224 Y127.323 E-.22983
G1 X141.214 Y127.403 E-.03065
; WIPE_END
G1 E-.04 F1800
G1 X138.209 Y120.387 Z25 F30000
G1 X137.52 Y118.776 Z25
G1 Z24.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3043
G2 X136.448 Y117.552 I-10.246 J7.884 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.554 J3.227 E.2164
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3043
G3 X132.16 Y137.836 I-5.937 J-11.887 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3043
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.525 J-3.227 E.21641
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.495 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3043
G3 X123.84 Y114.164 I5.937 J11.887 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 136/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L136
M991 S0 P135 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z25 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z25
G1 Z24.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3023
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3023
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.352 Y121.421 Z25.2 F30000
G1 X140.885 Y125.476 Z25.2
G1 Z24.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3023
G1 X140.887 Y126 E.0174
G3 X125.76 Y113.298 I-12.896 J-.001 E1.94149
G3 X128.86 Y113.133 I2.252 J13.112 E.1032
G3 X140.872 Y125.374 I-.869 J12.867 E.62233
G1 X140.877 Y125.416 E.00142
G1 X141.277 Y125.466 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3023
G1 X141.278 Y126 E.01641
G3 X125.692 Y112.912 I-13.288 J0 E1.85311
G3 X128.88 Y112.742 I2.32 J13.504 E.0983
G3 X141.263 Y125.355 I-.889 J13.258 E.59418
G1 X141.269 Y125.407 E.00161
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y126 E-.22552
G1 X141.27 Y126.718 E-.27263
G1 X141.224 Y127.323 E-.23059
G1 X141.214 Y127.404 E-.03125
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z25.2 F30000
G1 Z24.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3023
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.553 J-3.227 E.2164
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3023
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3023
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.525 J3.227 E.21641
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
M73 P85 R4
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3023
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 25
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 137/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L137
M991 S0 P136 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z25.2 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z25.2
G1 Z25
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3043
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3043
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.352 Y121.421 Z25.4 F30000
G1 X140.885 Y125.476 Z25.4
G1 Z25
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3043
G1 X140.886 Y126 E.01741
G3 X125.76 Y113.298 I-12.895 J-.001 E1.94134
G3 X128.865 Y113.133 I2.253 J13.117 E.10335
G3 X140.871 Y125.373 I-.873 J12.866 E.62216
G1 X140.877 Y125.416 E.00144
G1 X141.277 Y125.466 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3043
G1 X141.278 Y126 E.01641
G3 X125.692 Y112.912 I-13.288 J-.001 E1.85302
G3 X128.884 Y112.742 I2.321 J13.508 E.09844
G3 X141.262 Y125.354 I-.894 J13.258 E.59403
G1 X141.269 Y125.407 E.00163
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y126 E-.22559
G1 X141.27 Y126.715 E-.2718
G1 X141.224 Y127.323 E-.2315
G1 X141.214 Y127.404 E-.03112
; WIPE_END
G1 E-.04 F1800
G1 X138.21 Y120.388 Z25.4 F30000
G1 X137.52 Y118.776 Z25.4
G1 Z25
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3043
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.551 J3.227 E.2164
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.175 J-9.109 E.05401
G1 X133.658 Y137.2 F30000
G1 F3043
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3043
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.65 J-1.34 E.01601
G1 X115.876 Y129.227 E.04302
G3 X115.875 Y122.773 I12.532 J-3.227 E.2164
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3043
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 25.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 138/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L138
M991 S0 P137 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z25.4 I-.241 J-1.193 P1  F30000
G1 X130.591 Y114.691 Z25.4
G1 Z25.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3024
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.353 Y121.421 Z25.6 F30000
G1 X140.885 Y125.474 Z25.6
G1 Z25.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3024
G1 X140.888 Y125.999 E.01742
G3 X125.76 Y113.298 I-12.896 J.001 E1.94153
G3 X128.869 Y113.134 I2.254 J13.121 E.1035
G3 X140.872 Y125.372 I-.877 J12.866 E.62202
G1 X140.878 Y125.414 E.0014
G1 X141.277 Y125.464 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G1 X141.279 Y126 E.01645
G3 X125.692 Y112.912 I-13.288 J0 E1.85308
G3 X128.889 Y112.742 I2.321 J13.513 E.09858
G3 X141.263 Y125.353 I-.898 J13.258 E.59388
G1 X141.269 Y125.405 E.0016
M204 S10000
; WIPE_START
G1 F24000
G1 X141.279 Y126 E-.22605
G1 X141.27 Y126.715 E-.27198
G1 X141.224 Y127.323 E-.23149
G1 X141.214 Y127.402 E-.03048
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z25.6 F30000
G1 Z25.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3024
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.557 J-3.227 E.2164
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.493 J1.796 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3024
M73 P85 R3
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.84 J4.523 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3024
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.649 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.532 J3.227 E.2164
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
M73 P86 R3
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3024
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 25.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 139/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L139
M991 S0 P138 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z25.6 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z25.6
G1 Z25.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3043
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3043
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.353 Y121.42 Z25.8 F30000
G1 X140.885 Y125.471 Z25.8
G1 Z25.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3043
G1 X140.888 Y126 E.01756
G3 X125.76 Y113.298 I-12.896 J0 E1.94149
G3 X128.874 Y113.134 I2.254 J13.126 E.10365
G3 X140.873 Y125.372 I-.882 J12.866 E.62187
G1 X140.878 Y125.411 E.00132
G1 X141.277 Y125.461 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3043
G1 X141.279 Y126 E.01655
G3 X125.692 Y112.912 I-13.288 J0 E1.8531
G3 X128.893 Y112.742 I2.322 J13.518 E.09872
G3 X141.264 Y125.353 I-.902 J13.258 E.59374
G1 X141.27 Y125.402 E.00152
M204 S10000
; WIPE_START
G1 F24000
G1 X141.279 Y126 E-.22736
G1 X141.276 Y126.604 E-.22941
G1 X141.224 Y127.323 E-.27392
G1 X141.214 Y127.399 E-.02931
; WIPE_END
G1 E-.04 F1800
G1 X138.209 Y120.384 Z25.8 F30000
G1 X137.52 Y118.776 Z25.8
G1 Z25.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3043
G2 X136.448 Y117.552 I-10.246 J7.884 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.565 J3.227 E.21639
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3043
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3043
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.529 J-3.227 E.2164
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3043
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 25.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 140/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L140
M991 S0 P139 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z25.8 I-.241 J-1.193 P1  F30000
G1 X130.591 Y114.691 Z25.8
G1 Z25.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3024
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.355 Y121.419 Z26 F30000
G1 X140.885 Y125.467 Z26
G1 Z25.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3024
G1 X140.888 Y126 E.0177
G3 X125.76 Y113.298 I-12.896 J-.001 E1.94145
G3 X128.878 Y113.134 I2.255 J13.131 E.1038
G3 X140.873 Y125.371 I-.886 J12.866 E.62171
G1 X140.877 Y125.407 E.0012
G1 X141.277 Y125.457 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G1 X141.28 Y126 E.01668
G3 X125.692 Y112.912 I-13.288 J0 E1.8531
G3 X128.898 Y112.742 I2.322 J13.523 E.09885
G3 X141.264 Y125.352 I-.906 J13.257 E.5936
G1 X141.269 Y125.398 E.00141
M204 S10000
; WIPE_START
G1 F24000
G1 X141.28 Y126 E-.22899
G1 X141.276 Y126.606 E-.23038
G1 X141.224 Y127.323 E-.2729
G1 X141.215 Y127.395 E-.02773
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z26 F30000
G1 Z25.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3024
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.563 J-3.227 E.21639
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3024
G2 X132.16 Y114.164 I-5.937 J11.887 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3024
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.649 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.529 J3.227 E.21641
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
M73 P87 R3
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3024
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 25.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 141/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L141
M991 S0 P140 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z26 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z26
G1 Z25.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.356 Y121.418 Z26.2 F30000
G1 X140.885 Y125.461 Z26.2
G1 Z25.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.886 Y126 E.01788
G3 X126.396 Y113.202 I-12.895 J-.001 E1.96271
G3 X128.882 Y113.134 I1.591 J12.671 E.08264
G3 X140.871 Y125.371 I-.892 J12.865 E.62149
G1 X140.876 Y125.402 E.00105
G1 X141.277 Y125.452 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.28 Y126 E.01685
G3 X125.692 Y112.912 I-13.288 J0 E1.8531
G3 X128.902 Y112.743 I2.323 J13.528 E.09899
G3 X141.264 Y125.351 I-.91 J13.257 E.59346
G1 X141.269 Y125.392 E.00126
M204 S10000
; WIPE_START
G1 F24000
G1 X141.28 Y126 E-.23107
G1 X141.276 Y126.609 E-.23139
G1 X141.224 Y127.323 E-.27196
G1 X141.216 Y127.39 E-.02558
; WIPE_END
G1 E-.04 F1800
G1 X138.206 Y120.376 Z26.2 F30000
G1 X137.52 Y118.776 Z26.2
G1 Z25.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.246 J7.884 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.56 J3.227 E.21639
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.439 J-12.522 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.876 Y122.773 I12.528 J-3.227 E.21641
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 26
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 142/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L142
M991 S0 P141 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z26.2 I-.241 J-1.193 P1  F30000
G1 X130.591 Y114.691 Z26.2
G1 Z26
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3024
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.358 Y121.416 Z26.4 F30000
G1 X140.884 Y125.455 Z26.4
G1 Z26
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3024
G1 X140.887 Y126 E.0181
G3 X126.396 Y113.202 I-12.895 J-.001 E1.9627
G3 X128.887 Y113.134 I1.592 J12.677 E.08278
G3 X140.871 Y125.37 I-.896 J12.864 E.62133
G1 X140.875 Y125.395 E.00085
G1 X141.276 Y125.445 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G1 X141.28 Y126 E.01705
G3 X125.692 Y112.912 I-13.288 J0 E1.85307
G3 X128.907 Y112.743 I2.323 J13.532 E.09913
G3 X141.265 Y125.351 I-.914 J13.257 E.59331
G1 X141.269 Y125.386 E.00108
M204 S10000
; WIPE_START
G1 F24000
G1 X141.28 Y126 E-.23356
G1 X141.275 Y126.612 E-.23239
G1 X141.224 Y127.323 E-.27099
G1 X141.216 Y127.383 E-.02306
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z26.4 F30000
G1 Z26
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3024
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.649 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.558 J-3.227 E.21639
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.495 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3024
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3024
G3 X119.552 Y117.552 I10.246 J7.884 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.651 J1.341 E.01601
G1 X115.875 Y122.773 E.04302
M73 P88 R3
G2 X115.875 Y129.227 I12.528 J3.227 E.21641
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.495 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3024
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 26.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 143/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L143
M991 S0 P142 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z26.4 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z26.4
G1 Z26.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3043
G1 X131.143 Y114.831 E.01888
G3 X119.839 Y117.756 I-3.14 J11.168 E2.01201
G1 X119.839 Y117.756 E0
G3 X127.711 Y114.401 I8.161 J8.237 E.29073
G3 X130.533 Y114.677 I.291 J11.597 E.09429
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3043
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.36 Y121.414 Z26.6 F30000
G1 X140.884 Y125.447 Z26.6
G1 Z26.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3043
G1 X140.888 Y125.999 E.01831
G3 X126.396 Y113.202 I-12.896 J0 E1.96285
G3 X128.891 Y113.135 I1.592 J12.684 E.08293
G3 X140.872 Y125.369 I-.9 J12.865 E.62119
G1 X140.875 Y125.388 E.00061
G1 X141.276 Y125.437 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3043
G1 X141.278 Y126 E.01727
G3 X126.347 Y112.813 I-13.288 J-.001 E1.87338
G3 X128.911 Y112.743 I1.64 J13.059 E.07892
G3 X141.262 Y125.35 I-.92 J13.256 E.5931
G1 X141.267 Y125.378 E.00087
M204 S10000
; WIPE_START
G1 F24000
G1 X141.278 Y126 E-.23619
G1 X141.27 Y126.718 E-.27303
G1 X141.224 Y127.323 E-.23049
G1 X141.217 Y127.376 E-.02029
; WIPE_END
G1 E-.04 F1800
G1 X138.203 Y120.364 Z26.6 F30000
G1 X137.52 Y118.776 Z26.6
G1 Z26.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3043
G2 X136.448 Y117.552 I-10.246 J7.884 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.65 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.564 J3.227 E.21639
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.493 J-1.796 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3043
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.524 E.05401
G1 X118.48 Y133.224 F30000
G1 F3043
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.65 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.578 J-3.227 E.21639
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3043
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.524 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 26.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 144/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L144
M991 S0 P143 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z26.6 I-.241 J-1.193 P1  F30000
G1 X130.591 Y114.691 Z26.6
G1 Z26.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3024
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.363 Y121.412 Z26.8 F30000
G1 X140.884 Y125.439 Z26.8
G1 Z26.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3024
G1 X140.888 Y125.999 E.0186
G3 X126.396 Y113.202 I-12.896 J0 E1.96285
G3 X128.896 Y113.135 I1.593 J12.69 E.08308
G3 X140.873 Y125.369 I-.904 J12.864 E.62104
G1 X140.875 Y125.379 E.00035
G1 X141.276 Y125.429 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G1 X141.279 Y126 E.01754
G3 X126.347 Y112.813 I-13.288 J0 E1.87346
G3 X128.915 Y112.743 I1.64 J13.065 E.07906
G3 X141.263 Y125.35 I-.924 J13.256 E.59297
G1 X141.267 Y125.37 E.00062
M204 S10000
; WIPE_START
G1 F24000
G1 X141.279 Y126 E-.23946
G1 X141.27 Y126.715 E-.27193
G1 X141.224 Y127.323 E-.23159
G1 X141.218 Y127.367 E-.01701
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z26.8 F30000
G1 Z26.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3024
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.562 J-3.227 E.21639
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3024
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3024
G3 X119.552 Y117.552 I10.246 J7.884 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
M73 P89 R3
G3 X116.792 Y121.856 I4.649 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.876 Y129.227 I12.575 J3.227 E.21639
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.175 J-9.109 E.05401
G1 X122.342 Y137.2 F30000
G1 F3024
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 26.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 145/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L145
M991 S0 P144 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z26.8 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z26.8
G1 Z26.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.365 Y121.41 Z27 F30000
G1 X140.884 Y125.429 Z27
G1 Z26.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.889 Y125.999 E.01891
G3 X126.396 Y113.202 I-12.896 J0 E1.96281
G3 X128.9 Y113.135 I1.594 J12.697 E.08323
G3 X140.873 Y125.368 I-.908 J12.864 E.62089
G1 X140.874 Y125.37 E.00006
G1 X141.276 Y125.419 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.28 Y126 E.01783
G3 X126.347 Y112.813 I-13.288 J0 E1.87346
G3 X128.92 Y112.744 I1.641 J13.071 E.0792
G3 X141.264 Y125.349 I-.928 J13.256 E.59283
G1 X141.266 Y125.36 E.00036
M204 S10000
; WIPE_START
G1 F24000
G1 X141.28 Y126 E-.24303
G1 X141.27 Y126.712 E-.27084
G1 X141.224 Y127.323 E-.23266
G1 X141.22 Y127.358 E-.01347
; WIPE_END
G1 E-.04 F1800
G1 X138.198 Y120.349 Z27 F30000
G1 X137.52 Y118.776 Z27
G1 Z26.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.246 J7.884 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.65 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.56 J3.227 E.21639
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
M73 P89 R2
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3042
G3 X132.16 Y137.836 I-5.938 J-11.887 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.682 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.876 Y129.227 E.04302
G3 X115.875 Y122.773 I12.572 J-3.227 E.21639
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.887 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 26.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 146/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L146
M991 S0 P145 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z27 I-.241 J-1.193 P1  F30000
G1 X130.591 Y114.691 Z27
G1 Z26.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3024
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.368 Y121.408 Z27.2 F30000
G1 X140.883 Y125.419 Z27.2
G1 Z26.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3024
G1 X140.889 Y125.999 E.01925
G3 X126.396 Y113.202 I-12.895 J-.001 E1.96267
G3 X128.905 Y113.135 I1.594 J12.704 E.08338
G3 X140.873 Y125.356 I-.912 J12.863 E.62034
G1 X140.873 Y125.36 E.00013
G1 X141.275 Y125.409 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G1 X141.28 Y126 E.01814
G3 X126.347 Y112.813 I-13.288 J-.001 E1.87333
G3 X128.924 Y112.744 I1.642 J13.078 E.07934
G3 X141.263 Y125.337 I-.932 J13.255 E.59232
G1 X141.265 Y125.35 E.00042
M204 S10000
; WIPE_START
G1 F24000
G1 X141.28 Y126 E-.24692
G1 X141.271 Y126.71 E-.26973
G1 X141.224 Y127.323 E-.23378
G1 X141.221 Y127.348 E-.00957
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z27.2 F30000
G1 Z26.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3024
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.567 J-3.227 E.21639
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3024
G2 X132.16 Y114.164 I-5.937 J11.887 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.524 E.05401
G1 X118.48 Y118.776 F30000
G1 F3024
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
M73 P90 R2
G3 X116.792 Y121.856 I4.652 J1.341 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.576 J3.227 E.21639
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.175 J-9.109 E.05401
G1 X122.342 Y137.2 F30000
G1 F3024
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.84 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.524 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 27
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 147/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L147
M991 S0 P146 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z27.2 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z27.2
G1 Z27
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.371 Y121.405 Z27.4 F30000
G1 X140.883 Y125.408 Z27.4
G1 Z27
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3047
G1 X140.887 Y125.999 E.01961
G3 X127.036 Y113.138 I-12.895 J-.001 E1.98403
G3 X128.909 Y113.136 I.957 J14.279 E.06218
G3 X140.87 Y125.35 I-.918 J12.863 E.61993
G1 X141.275 Y125.398 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X141.28 Y126 E.01848
G3 X126.347 Y112.813 I-13.288 J-.001 E1.87331
G3 X128.929 Y112.744 I1.642 J13.085 E.07948
G3 X141.264 Y125.337 I-.936 J13.255 E.5922
G1 X141.264 Y125.339 E.00009
M204 S10000
; WIPE_START
G1 F24000
G1 X141.28 Y126 E-.251
G1 X141.271 Y126.707 E-.26865
G1 X141.224 Y127.323 E-.23481
G1 X141.222 Y127.337 E-.00554
; WIPE_END
G1 E-.04 F1800
G1 X138.193 Y120.332 Z27.4 F30000
G1 X137.52 Y118.776 Z27.4
G1 Z27
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G2 X136.448 Y117.552 I-10.246 J7.884 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.341 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.564 J3.227 E.21639
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3047
G3 X132.16 Y137.836 I-5.937 J-11.887 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.522 E.05401
G1 X118.48 Y133.224 F30000
G1 F3047
G2 X119.552 Y134.448 I10.245 J-7.883 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.573 J-3.227 E.21639
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3047
G3 X123.84 Y114.164 I5.937 J11.887 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 27.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 148/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L148
M991 S0 P147 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z27.4 I-.241 J-1.193 P1  F30000
G1 X130.591 Y114.691 Z27.4
G1 Z27.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3029
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3029
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.374 Y121.402 Z27.6 F30000
G1 X140.883 Y125.397 Z27.6
G1 Z27.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3029
G1 X140.888 Y125.999 E.01999
G3 X127.036 Y113.138 I-12.896 J0 E1.98416
G3 X128.914 Y113.136 I.958 J14.293 E.06233
G3 X140.871 Y125.338 I-.922 J12.863 E.61943
G1 X141.275 Y125.387 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3029
G1 X141.281 Y126 E.01883
G3 X126.347 Y112.813 I-13.288 J-.001 E1.8733
G3 X128.933 Y112.744 I1.643 J13.092 E.07961
G3 X141.264 Y125.328 I-.94 J13.254 E.59181
M204 S10000
; WIPE_START
G1 F24000
G1 X141.281 Y126 E-.25533
G1 X141.271 Y126.704 E-.26759
G1 X141.224 Y127.323 E-.23586
G1 X141.224 Y127.326 E-.00122
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z27.6 F30000
G1 Z27.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3029
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.341 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.561 J-3.227 E.21639
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3029
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.524 E.05401
G1 X118.48 Y118.776 F30000
G1 F3029
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.0222
G3 X116.792 Y121.856 I5.086 J1.482 E.01602
G1 X115.875 Y122.773 E.04302
M73 P91 R2
G2 X115.875 Y129.227 I12.57 J3.227 E.21639
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3029
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 27.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 149/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L149
M991 S0 P148 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z27.6 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z27.6
G1 Z27.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3048
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3048
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.378 Y121.399 Z27.8 F30000
G1 X140.882 Y125.385 Z27.8
G1 Z27.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3048
G1 X140.889 Y125.999 E.02039
G3 X127.036 Y113.138 I-12.896 J0 E1.98416
G3 X128.918 Y113.136 I.958 J14.309 E.06248
G3 X140.872 Y125.326 I-.926 J12.863 E.61892
G1 X141.274 Y125.375 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3048
G1 X141.279 Y126 E.0192
G3 X127.007 Y112.747 I-13.288 J-.002 E1.89369
G3 X128.938 Y112.744 I.987 J14.716 E.05938
G3 X141.261 Y125.317 I-.947 J13.254 E.59128
M204 S10000
; WIPE_START
G1 F24000
G1 X141.279 Y126 E-.2596
G1 X141.271 Y126.701 E-.26645
G1 X141.225 Y127.315 E-.23395
; WIPE_END
G1 E-.04 F1800
G1 X138.187 Y120.313 Z27.8 F30000
G1 X137.52 Y118.776 Z27.8
G1 Z27.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3048
G2 X136.448 Y117.552 I-10.246 J7.884 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.559 J3.227 E.21639
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.175 J-9.109 E.05401
G1 X133.658 Y137.2 F30000
G1 F3048
G3 X132.16 Y137.836 I-5.937 J-11.887 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3048
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.566 J-3.227 E.21639
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3048
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 27.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 150/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L150
M991 S0 P149 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z27.8 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z27.8
G1 Z27.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3029
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3029
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.095 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.381 Y121.396 Z28 F30000
G1 X140.882 Y125.372 Z28
G1 Z27.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3029
G1 X140.89 Y125.999 E.0208
G3 X127.036 Y113.138 I-12.896 J0 E1.98413
G3 X128.923 Y113.136 I.959 J14.325 E.06263
G3 X140.872 Y125.315 I-.929 J12.863 E.6184
G1 X141.274 Y125.363 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3029
G1 X141.28 Y126 E.01958
G3 X127.007 Y112.747 I-13.288 J-.001 E1.89381
G3 X128.942 Y112.745 I.987 J14.731 E.05952
G3 X141.262 Y125.305 I-.95 J13.254 E.5908
M204 S10000
; WIPE_START
G1 F24000
G1 X141.28 Y126 E-.26426
G1 X141.271 Y126.698 E-.26537
G1 X141.225 Y127.303 E-.23037
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z28 F30000
G1 Z27.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3029
G3 X136.448 Y134.448 I-10.245 J-7.883 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.556 J-3.227 E.2164
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3029
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.84 J4.523 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3029
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
M73 P92 R2
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.875 Y129.227 I12.563 J3.227 E.21639
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.175 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3029
G2 X123.84 Y137.836 I5.937 J-11.887 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.84 J-4.523 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 27.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 151/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L151
M991 S0 P150 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z28 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z28
G1 Z27.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3048
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3048
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.385 Y121.393 Z28.2 F30000
G1 X140.882 Y125.36 Z28.2
G1 Z27.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3048
G1 X140.887 Y125.999 E.02122
G3 X127.036 Y113.138 I-12.895 J-.001 E1.98402
G3 X128.913 Y113.136 I.958 J14.292 E.06231
G3 X140.869 Y125.307 I-.921 J12.862 E.61841
G1 X141.274 Y125.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3048
G1 X141.279 Y126 E.01997
G3 X127.007 Y112.747 I-13.288 J-.002 E1.89368
G3 X128.942 Y112.745 I.987 J14.73 E.0595
G3 X141.261 Y125.294 I-.95 J13.254 E.59047
M204 S10000
; WIPE_START
G1 F24000
G1 X141.279 Y126 E-.26838
G1 X141.271 Y126.695 E-.26427
G1 X141.226 Y127.292 E-.22735
; WIPE_END
G1 E-.04 F1800
G1 X138.18 Y120.294 Z28.2 F30000
G1 X137.52 Y118.776 Z28.2
G1 Z27.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3048
G2 X136.448 Y117.552 I-10.246 J7.884 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.553 J3.227 E.2164
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3048
G3 X132.16 Y137.836 I-5.937 J-11.885 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.439 J-12.522 E.05401
G1 X118.48 Y133.224 F30000
G1 F3048
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.341 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.56 J-3.227 E.21639
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.495 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3048
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 28
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 152/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L152
M991 S0 P151 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z28.2 I-.241 J-1.193 P1  F30000
G1 X130.591 Y114.691 Z28.2
G1 Z28
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3027
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3027
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.383 Y121.395 Z28.4 F30000
G1 X140.872 Y125.357 Z28.4
G1 Z28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3027
G3 X127.036 Y113.138 I-12.879 J.642 E2.00533
G3 X128.918 Y113.136 I.958 J14.307 E.06246
G3 X140.869 Y125.297 I-.925 J12.862 E.61794
G1 X141.264 Y125.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3027
G3 X127.007 Y112.747 I-13.271 J.661 E1.91403
G3 X128.946 Y112.745 I.988 J14.745 E.05964
G3 X141.261 Y125.277 I-.954 J13.253 E.58984
M204 S10000
; WIPE_START
G1 F24000
G1 X141.29 Y126 E-.27482
G1 X141.272 Y126.692 E-.2633
G1 X141.228 Y127.275 E-.22188
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z28.4 F30000
G1 Z28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3027
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.55 J-3.227 E.2164
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3027
M73 P92 R1
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
M73 P93 R1
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.439 J12.522 E.05401
G1 X118.48 Y118.776 F30000
G1 F3027
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.651 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.876 Y129.227 I12.55 J3.227 E.2164
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G2 X120.607 Y135.387 I20.835 J-22.356 E.04687
G1 X120.48 Y135.56 E.00712
G1 X120.906 Y135.714 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.505024
G1 F3027
G1 X121.01 Y135.791 E.00487
G1 X122.342 Y137.2 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3027
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 28.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 153/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L153
M991 S0 P152 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z28.4 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z28.4
G1 Z28.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.21241
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.387 Y121.391 Z28.6 F30000
G1 X140.881 Y125.353 Z28.6
G1 Z28.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.873 Y125.357 E.00031
G3 X127.036 Y113.138 I-12.88 J.641 E2.00531
G3 X128.922 Y113.136 I.959 J14.322 E.06261
G3 X140.825 Y124.715 I-.929 J12.862 E.59846
G1 X140.876 Y125.293 E.01926
G1 X141.272 Y125.324 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.264 Y125.337 E.00048
G3 X127.007 Y112.747 I-13.271 J.661 E1.91401
G3 X128.951 Y112.745 I.988 J14.761 E.05978
G3 X141.215 Y124.676 I-.958 J13.253 E.57119
G1 X141.267 Y125.264 E.01814
M204 S10000
; WIPE_START
G1 F24000
G1 X141.264 Y125.337 E-.02784
G1 X141.29 Y126 E-.25199
G1 X141.272 Y126.69 E-.26217
G1 X141.229 Y127.262 E-.21801
; WIPE_END
G1 E-.04 F1800
G1 X138.172 Y120.268 Z28.6 F30000
G1 X137.52 Y118.776 Z28.6
G1 Z28.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.547 J3.227 E.2164
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.173 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.885 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.523 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.547 J-3.227 E.2164
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.885 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.523 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 28.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 154/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L154
M991 S0 P153 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z28.6 I-.234 J-1.194 P1  F30000
G1 X130.572 Y114.687 Z28.6
G1 Z28.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3024
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.39 Y121.388 Z28.8 F30000
G1 X140.88 Y125.34 Z28.8
G1 Z28.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3024
G1 X140.871 Y125.357 E.00065
G3 X127.678 Y113.106 I-12.88 J.641 E2.02675
G3 X128.927 Y113.136 I.322 J12.519 E.04143
G3 X140.823 Y124.715 I-.936 J12.862 E.59826
G1 X140.875 Y125.28 E.01881
G1 X141.271 Y125.311 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G1 X141.262 Y125.337 E.00087
G3 X127.669 Y112.714 I-13.271 J.661 E1.93443
G3 X128.955 Y112.745 I.331 J12.906 E.03956
G3 X141.213 Y124.676 I-.964 J13.253 E.57101
G1 X141.266 Y125.251 E.01772
M204 S10000
; WIPE_START
G1 F24000
G1 X141.262 Y125.337 E-.03294
G1 X141.29 Y126 E-.25196
G1 X141.272 Y126.687 E-.26106
G1 X141.23 Y127.248 E-.21405
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z28.8 F30000
G1 Z28.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3024
G3 X136.448 Y134.448 I-10.246 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.34 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.545 J-3.227 E.2164
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.493 J1.796 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3024
M73 P94 R1
G2 X132.16 Y114.164 I-5.938 J11.887 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.684 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.84 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X118.48 Y118.776 F30000
G1 F3024
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.876 Y122.773 E.04302
G2 X115.875 Y129.227 I12.544 J3.227 E.2164
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3024
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.684 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.84 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 28.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 155/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L155
M991 S0 P154 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z28.8 I1.215 J-.069 P1  F30000
G1 X130.591 Y114.691 Z28.8
G1 Z28.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3043
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3043
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.095 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.394 Y121.385 Z29 F30000
G1 X140.879 Y125.327 Z29
G1 Z28.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3043
G1 X140.872 Y125.357 E.00103
G3 X127.678 Y113.106 I-12.88 J.642 E2.02683
G3 X128.931 Y113.137 I.322 J12.563 E.04158
G3 X140.824 Y124.715 I-.939 J12.862 E.59817
G1 X140.874 Y125.267 E.01837
G1 X141.27 Y125.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3043
G1 X141.264 Y125.337 E.00125
G3 X127.669 Y112.714 I-13.272 J.661 E1.93456
G3 X128.96 Y112.746 I.331 J12.951 E.0397
G3 X141.214 Y124.676 I-.968 J13.253 E.57092
G1 X141.265 Y125.238 E.01731
M204 S10000
; WIPE_START
G1 F24000
G1 X141.264 Y125.337 E-.03793
G1 X141.29 Y126 E-.25193
G1 X141.272 Y126.684 E-.26001
G1 X141.231 Y127.235 E-.21014
; WIPE_END
G1 E-.04 F1800
G1 X138.164 Y120.246 Z29 F30000
G1 X137.52 Y118.776 Z29
G1 Z28.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3043
G2 X136.448 Y117.552 I-10.246 J7.884 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.542 J3.227 E.2164
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.175 J-9.109 E.05401
G1 X133.658 Y137.2 F30000
G1 F3043
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.839 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.523 E.05401
G1 X118.48 Y133.224 F30000
G1 F3043
G2 X119.552 Y134.448 I10.245 J-7.883 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.341 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.542 J-3.227 E.2164
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3043
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.522 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 28.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 156/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L156
M991 S0 P155 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z29 I-.241 J-1.193 P1  F30000
G1 X130.591 Y114.691 Z29
G1 Z28.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3016
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3016
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.397 Y121.382 Z29.2 F30000
G1 X140.878 Y125.314 Z29.2
G1 Z28.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3016
G1 X140.873 Y125.357 E.00145
G3 X127.678 Y113.106 I-12.88 J.642 E2.0268
G3 X128.935 Y113.137 I.322 J12.607 E.04172
G3 X140.825 Y124.715 I-.942 J12.862 E.59805
G1 X140.873 Y125.254 E.01793
G1 X141.269 Y125.284 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3016
G1 X141.265 Y125.337 E.00164
G3 X127.669 Y112.714 I-13.272 J.661 E1.93452
G3 X128.964 Y112.746 I.331 J12.996 E.03984
G3 X141.216 Y124.676 I-.971 J13.253 E.57081
G1 X141.264 Y125.225 E.01691
M204 S10000
; WIPE_START
G1 F24000
G1 X141.265 Y125.337 E-.04293
G1 X141.29 Y126 E-.2519
G1 X141.272 Y126.681 E-.25888
G1 X141.232 Y127.222 E-.20629
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z29.2 F30000
G1 Z28.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3016
G3 X136.448 Y134.448 I-10.245 J-7.884 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.341 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.539 J-3.227 E.2164
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.493 J1.796 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3016
M73 P95 R1
G2 X132.16 Y114.164 I-5.937 J11.887 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.683 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X124.556 Y114.092 E.01011
G1 X124.536 Y114.028 E.00224
G1 X123.9 Y114.224 E.02208
G1 X123.84 Y114.164 E.00282
G2 X122.342 Y114.8 I4.44 J12.523 E.05401
G1 X123.963 Y114.664 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515008
G1 F3016
G1 X124.196 Y114.588 E.00944
G1 X120.778 Y116.483 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3016
G2 X119.552 Y117.552 I12.974 J16.129 E.05398
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.875 Y122.773 E.04302
G2 X115.876 Y129.227 I12.539 J3.227 E.2164
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.494 J-1.797 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.175 J-9.109 E.05401
G1 X122.342 Y137.2 F30000
G1 F3016
G2 X123.84 Y137.836 I5.937 J-11.886 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.683 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.84 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 29
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 157/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L157
M991 S0 P156 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z29.2 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z29.2
G1 Z29
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.23519
G1 X131.57 Y115.374 E-.2124
G1 X132.095 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.401 Y121.379 Z29.4 F30000
G1 X140.877 Y125.301 Z29.4
G1 Z29
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.874 Y125.357 E.00186
G3 X127.678 Y113.106 I-12.88 J.642 E2.02675
G3 X128.94 Y113.137 I.322 J12.651 E.04187
G3 X140.826 Y124.716 I-.946 J12.862 E.59795
G1 X140.872 Y125.241 E.01749
G1 X141.268 Y125.271 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.266 Y125.337 E.00203
G3 X127.669 Y112.714 I-13.272 J.661 E1.93448
G3 X128.969 Y112.746 I.331 J13.04 E.03997
G3 X141.217 Y124.677 I-.975 J13.253 E.57072
G1 X141.263 Y125.212 E.0165
M204 S10000
; WIPE_START
G1 F24000
G1 X141.266 Y125.337 E-.04776
G1 X141.29 Y126 E-.25198
G1 X141.272 Y126.678 E-.25779
G1 X141.232 Y127.209 E-.20247
; WIPE_END
G1 E-.04 F1800
G1 X138.157 Y120.224 Z29.4 F30000
G1 X137.52 Y118.776 Z29.4
G1 Z29
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.651 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.537 J3.227 E.2164
G1 X139.208 Y130.144 E.04302
G2 X139.364 Y129.688 I-4.493 J-1.796 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.683 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.522 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.524 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.246 J-7.884 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.651 J-1.341 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.536 J-3.227 E.2164
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.494 J1.797 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.886 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.523 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 29.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 158/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L158
M991 S0 P157 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z29.4 I-.241 J-1.193 P1  F30000
G1 X130.591 Y114.691 Z29.4
G1 Z29.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3024
G1 X131.142 Y114.831 E.01888
G3 X127.711 Y114.401 I-3.142 J11.167 E2.30267
G1 X128.289 Y114.401 E.01919
G3 X130.532 Y114.678 I-.289 J11.597 E.07509
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.23519
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.21241
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.404 Y121.376 Z29.6 F30000
G1 X140.877 Y125.288 Z29.6
G1 Z29.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3024
G1 X140.875 Y125.357 E.00229
G3 X127.678 Y113.106 I-12.88 J.642 E2.02671
G3 X128.944 Y113.137 I.322 J12.695 E.04201
G3 X140.827 Y124.716 I-.949 J12.861 E.59784
G1 X140.871 Y125.228 E.01706
G1 X141.268 Y125.259 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G1 X141.267 Y125.337 E.00242
G3 X127.669 Y112.714 I-13.272 J.661 E1.93444
G3 X128.973 Y112.746 I.331 J13.085 E.04011
G3 X141.218 Y124.677 I-.978 J13.252 E.57062
G1 X141.262 Y125.199 E.01611
M204 S10000
; WIPE_START
G1 F24000
G1 X141.267 Y125.337 E-.05265
G1 X141.29 Y126 E-.25191
G1 X141.273 Y126.675 E-.2567
G1 X141.233 Y127.197 E-.19874
; WIPE_END
G1 E-.04 F1800
G1 X137.52 Y133.224 Z29.6 F30000
G1 Z29.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3024
G3 X136.448 Y134.448 I-10.245 J-7.883 E.05401
G1 X136.872 Y134.872 E.01986
G2 X139.837 Y130.161 I-9.326 J-9.158 E.18607
G1 X139.364 Y129.688 E.02217
G3 X139.208 Y130.144 I-4.651 J-1.341 E.01601
G1 X140.125 Y129.227 E.04302
G2 X140.125 Y122.773 I-12.534 J-3.227 E.2164
G1 X139.208 Y121.856 E.04302
G3 X139.364 Y122.312 I-4.494 J1.797 E.01601
G1 X139.837 Y121.839 E.02217
G2 X136.872 Y117.128 I-12.291 J4.447 E.18607
G1 X136.448 Y117.552 E.01986
G3 X137.52 Y118.776 I-9.174 J9.108 E.05401
G1 X133.658 Y114.8 F30000
G1 F3024
M73 P96 R1
G2 X132.16 Y114.164 I-5.937 J11.886 E.05401
G1 X131.689 Y114.635 E.02213
G3 X132.148 Y114.796 I-1.38 J4.684 E.01615
G1 X131.228 Y113.876 E.04315
G2 X124.772 Y113.876 I-3.228 J12.146 E.21659
G1 X123.852 Y114.796 E.04315
G3 X124.311 Y114.635 I1.839 J4.522 E.01615
G1 X123.84 Y114.164 E.02213
G2 X122.342 Y114.8 I4.439 J12.522 E.05401
G1 X118.48 Y118.776 F30000
G1 F3024
G3 X119.552 Y117.552 I10.245 J7.883 E.05401
G1 X119.128 Y117.128 E.01986
G2 X116.163 Y121.839 I9.326 J9.158 E.18607
G1 X116.636 Y122.312 E.02217
G3 X116.792 Y121.856 I4.65 J1.34 E.01601
G1 X115.876 Y122.773 E.04302
G2 X115.875 Y129.227 I12.534 J3.227 E.2164
G1 X116.792 Y130.144 E.04302
G3 X116.636 Y129.688 I4.493 J-1.796 E.01601
G1 X116.163 Y130.161 E.02217
G2 X119.128 Y134.872 I12.291 J-4.447 E.18607
G1 X119.552 Y134.448 E.01986
G3 X118.48 Y133.224 I9.174 J-9.108 E.05401
G1 X122.342 Y137.2 F30000
G1 F3024
G2 X123.84 Y137.836 I5.937 J-11.887 E.05401
G1 X124.311 Y137.365 E.02213
G3 X123.852 Y137.204 I1.38 J-4.684 E.01615
G1 X124.772 Y138.124 E.04315
G2 X131.228 Y138.124 I3.228 J-12.146 E.21659
G1 X132.148 Y137.204 E.04315
G3 X131.689 Y137.365 I-1.839 J-4.522 E.01615
G1 X132.16 Y137.836 E.02213
G2 X133.658 Y137.2 I-4.44 J-12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 29.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X132.16 Y137.836 E-.61829
G1 X131.897 Y137.573 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 159/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L159
M991 S0 P158 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z29.6 I1.215 J-.07 P1  F30000
G1 X130.572 Y114.687 Z29.6
G1 Z29.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3042
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.2352
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.408 Y121.373 Z29.8 F30000
G1 X140.876 Y125.276 Z29.8
G1 Z29.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3042
G1 X140.872 Y125.357 E.0027
G3 X128.322 Y113.106 I-12.88 J.641 E2.04801
G1 X128.948 Y113.138 E.02082
G3 X140.824 Y124.716 I-.956 J12.86 E.59762
G1 X140.87 Y125.216 E.01665
G1 X141.267 Y125.246 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3042
G1 X141.264 Y125.338 E.0028
G3 X128.331 Y112.714 I-13.271 J.66 E1.95476
G1 X128.978 Y112.746 E.01988
G3 X141.214 Y124.677 I-.985 J13.251 E.57041
G1 X141.261 Y125.187 E.01572
M204 S10000
; WIPE_START
G1 F24000
G1 X141.264 Y125.338 E-.05735
G1 X141.29 Y126 E-.25191
G1 X141.273 Y126.672 E-.2556
G1 X141.234 Y127.184 E-.19515
; WIPE_END
G1 E-.04 F1800
G1 X138.15 Y120.203 Z29.8 F30000
G1 X137.52 Y118.776 Z29.8
G1 Z29.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3042
G2 X136.448 Y117.552 I-10.245 J7.883 E.05401
G1 X136.872 Y117.128 E.01986
G3 X139.837 Y121.839 I-9.326 J9.158 E.18607
G1 X139.364 Y122.312 E.02217
G2 X139.208 Y121.856 I-4.65 J1.34 E.01601
G1 X140.125 Y122.773 E.04302
G3 X140.125 Y129.227 I-12.531 J3.227 E.2164
G1 X139.208 Y130.144 E.04302
M73 P96 R0
G2 X139.364 Y129.688 I-4.494 J-1.797 E.01601
G1 X139.837 Y130.161 E.02217
G3 X136.872 Y134.872 I-12.291 J-4.447 E.18607
G1 X136.448 Y134.448 E.01986
G2 X137.52 Y133.224 I-9.174 J-9.108 E.05401
G1 X133.658 Y137.2 F30000
G1 F3042
G3 X132.16 Y137.836 I-5.937 J-11.886 E.05401
G1 X131.689 Y137.365 E.02213
G2 X132.148 Y137.204 I-1.38 J-4.682 E.01615
G1 X131.228 Y138.124 E.04315
G3 X124.772 Y138.124 I-3.228 J-12.146 E.21659
G1 X123.852 Y137.204 E.04315
G2 X124.311 Y137.365 I1.84 J-4.523 E.01615
G1 X123.84 Y137.836 E.02213
G3 X122.342 Y137.2 I4.44 J-12.524 E.05401
G1 X118.48 Y133.224 F30000
G1 F3042
G2 X119.552 Y134.448 I10.245 J-7.883 E.05401
G1 X119.128 Y134.872 E.01986
G3 X116.163 Y130.161 I9.326 J-9.158 E.18607
G1 X116.636 Y129.688 E.02217
G2 X116.792 Y130.144 I4.65 J-1.34 E.01601
G1 X115.875 Y129.227 E.04302
G3 X115.875 Y122.773 I12.531 J-3.227 E.2164
G1 X116.792 Y121.856 E.04302
G2 X116.636 Y122.312 I4.493 J1.796 E.01601
G1 X116.163 Y121.839 E.02217
G3 X119.128 Y117.128 I12.291 J4.447 E.18607
G1 X119.552 Y117.552 E.01986
G2 X118.48 Y118.776 I9.174 J9.108 E.05401
G1 X122.342 Y114.8 F30000
G1 F3042
G3 X123.84 Y114.164 I5.937 J11.887 E.05401
G1 X124.311 Y114.635 E.02213
G2 X123.852 Y114.796 I1.38 J4.683 E.01615
G1 X124.772 Y113.876 E.04315
G3 X131.228 Y113.876 I3.228 J12.146 E.21659
G1 X132.148 Y114.796 E.04315
G2 X131.689 Y114.635 I-1.84 J4.523 E.01615
G1 X132.16 Y114.164 E.02213
G3 X133.658 Y114.8 I-4.44 J12.523 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 29.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.16 Y114.164 E-.61829
G1 X131.897 Y114.427 E-.14171
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 160/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L160
M991 S0 P159 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z29.8 I-.234 J-1.194 P1  F30000
G1 X130.573 Y114.687 Z29.8
G1 Z29.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3589
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3589
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.23519
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.2124
G1 X132.338 Y115.667 E-.10001
; WIPE_END
G1 E-.04 F1800
G1 X137.411 Y121.37 Z30 F30000
G1 X140.875 Y125.264 Z30
G1 Z29.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3589
G1 X140.874 Y125.357 E.0031
G3 X128.322 Y113.106 I-12.88 J.641 E2.04794
G1 X128.953 Y113.138 E.02097
G3 X140.826 Y124.716 I-.958 J12.86 E.59754
G1 X140.869 Y125.204 E.01625
G1 X141.266 Y125.235 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3589
G1 X141.266 Y125.338 E.00317
G3 X128.331 Y112.714 I-13.271 J.66 E1.95469
G1 X128.982 Y112.747 E.02002
G3 X141.217 Y124.677 I-.987 J13.251 E.57033
G1 X141.26 Y125.175 E.01535
M204 S10000
; WIPE_START
G1 F24000
G1 X141.266 Y125.338 E-.06194
G1 X141.29 Y126 E-.25183
G1 X141.273 Y126.669 E-.25451
G1 X141.235 Y127.173 E-.19172
; WIPE_END
G1 E-.04 F1800
G1 X137.076 Y133.572 Z30 F30000
G1 X136.409 Y134.6 Z30
G1 Z29.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.486912
G1 F3589
G3 X136.821 Y134.177 I-8.405 J-8.602 E2.71256
G1 X136.451 Y134.557 E.01918
; WIPE_START
G1 F24000
G1 X136.821 Y134.177 E-.20149
G1 X137.217 Y133.727 E-.2279
G1 X137.591 Y133.258 E-.22789
G1 X137.749 Y133.038 E-.10271
; WIPE_END
G1 E-.04 F1800
G1 X134.606 Y126.083 Z30 F30000
G1 X128.948 Y113.565 Z30
M73 P97 R0
G1 Z29.6
G1 E.8 F1800
; LINE_WIDTH: 0.486913
G1 F3589
G2 X129.567 Y113.627 I-.941 J12.435 E2.81229
G1 X129.008 Y113.571 E.02034
; CHANGE_LAYER
; Z_HEIGHT: 29.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.567 Y113.627 E-.21359
G1 X130.182 Y113.721 E-.2363
G1 X130.791 Y113.845 E-.23629
G1 X130.98 Y113.893 E-.07382
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 161/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L161
M991 S0 P160 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z30 I-1.083 J-.555 P1  F30000
G1 X130.572 Y114.687 Z30
G1 Z29.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3592
G1 X130.582 Y114.689 E.00031
G3 X127.711 Y114.401 I-2.582 J11.31 E2.32186
G1 X128.289 Y114.401 E.01919
G3 X130.015 Y114.574 I-.289 J11.597 E.05758
G1 X130.514 Y114.675 E.01689
G1 X130.494 Y115.071 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3592
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.23519
G1 X131.57 Y115.374 E-.21239
G1 X132.096 Y115.565 E-.21241
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.414 Y121.367 Z30.2 F30000
G1 X140.874 Y125.253 Z30.2
G1 Z29.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3592
G1 X140.877 Y125.357 E.00347
G3 X128.322 Y113.106 I-12.88 J.641 E2.04787
G1 X128.957 Y113.138 E.02111
G3 X140.829 Y124.716 I-.96 J12.86 E.59747
G1 X140.869 Y125.193 E.01586
G1 X141.265 Y125.223 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3592
G1 X141.268 Y125.338 E.00351
G3 X128.331 Y112.714 I-13.271 J.66 E1.95464
G1 X128.986 Y112.747 E.02016
G3 X141.219 Y124.677 I-.99 J13.251 E.57027
G1 X141.26 Y125.163 E.015
M204 S10000
; WIPE_START
G1 F24000
G1 X141.268 Y125.338 E-.06624
G1 X141.29 Y126 E-.25186
G1 X141.273 Y126.667 E-.25347
G1 X141.236 Y127.161 E-.18842
; WIPE_END
G1 E-.04 F1800
G1 X136.119 Y121.499 Z30.2 F30000
G1 X128.948 Y113.565 Z30.2
G1 Z29.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.486914
G1 F3592
G2 X129.567 Y113.627 I-.944 J12.435 E2.81232
G1 X129.008 Y113.571 E.02033
; WIPE_START
G1 F24000
G1 X129.567 Y113.627 E-.21357
G1 X130.182 Y113.721 E-.2363
G1 X130.791 Y113.845 E-.23629
G1 X130.98 Y113.893 E-.07384
; WIPE_END
G1 E-.04 F1800
G1 X135.551 Y120.005 Z30.2 F30000
G1 X140.028 Y125.989 Z30.2
G1 Z29.8
G1 E.8 F1800
; LINE_WIDTH: 0.486912
G1 F3592
G3 X140.013 Y125.395 I-12.027 J.008 E2.71242
G1 X140.026 Y125.929 E.01932
; CHANGE_LAYER
; Z_HEIGHT: 30
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X140.013 Y125.395 E-.20294
G1 X139.967 Y124.797 E-.22789
G1 X139.893 Y124.202 E-.22789
G1 X139.846 Y123.939 E-.10128
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 162/162
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L162
M991 S0 P161 ;notify layer change
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z30.2 I.837 J-.883 P1  F30000
G1 X130.494 Y115.071 Z30.2
G1 Z30
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5277
G3 X127.721 Y114.793 I-2.494 J10.927 E2.07805
G1 X128.279 Y114.793 E.01718
G3 X130.436 Y115.058 I-.279 J11.205 E.06686
M204 S10000
; WIPE_START
G1 F24000
G1 X131.036 Y115.209 E-.23519
G1 X131.57 Y115.374 E-.2124
G1 X132.096 Y115.565 E-.21241
G1 X132.338 Y115.667 E-.1
; WIPE_END
G1 E-.04 F1800
G1 X137.551 Y121.242 Z30.4 F30000
G1 X141.264 Y125.212 Z30.4
G1 Z30
G1 E.8 F1800
M204 S5000
G1 F5277
G1 X141.27 Y125.338 E.00386
G3 X128.331 Y112.714 I-13.271 J.66 E1.95456
G1 X128.991 Y112.747 E.02029
G3 X141.221 Y124.677 I-.992 J13.251 E.57019
G1 X141.259 Y125.153 E.01466
M204 S10000
; WIPE_START
G1 F24000
G1 X141.27 Y125.338 E-.07057
G1 X141.29 Y126 E-.25164
G1 X141.273 Y126.664 E-.25233
G1 X141.237 Y127.15 E-.18546
; WIPE_END
G1 E-.04 F1800
G1 X137.038 Y133.524 Z30.4 F30000
G1 X134.527 Y137.338 Z30.4
G1 Z30
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F5277
G1 X139.328 Y132.537 E.20861
G1 X139.895 Y131.436
G1 X133.43 Y137.901 E.28093
G1 X132.528 Y138.27
G1 X140.274 Y130.524 E.33659
G1 X140.538 Y129.727
G1 X131.728 Y138.536 E.38281
M204 S10000
; WIPE_START
G1 F24000
G1 X133.142 Y137.122 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X134.055 Y135.676 Z30.4 F30000
G1 Z30
G1 E.8 F1800
M204 S2000
G1 F5277
G1 X130.999 Y138.732 E.13279
G1 X130.325 Y138.873
G1 X132.879 Y136.319 E.11099
G1 X131.96 Y136.705
G1 X129.694 Y138.971 E.09844
G1 X129.098 Y139.034
G1 X131.162 Y136.969 E.08972
G1 X130.448 Y137.15
G1 X128.53 Y139.068 E.08336
G1 X127.987 Y139.078
G1 X129.792 Y137.273 E.07846
G1 X129.179 Y137.353
G1 X127.464 Y139.068 E.07452
G1 X126.959 Y139.04
G1 X128.6 Y137.398 E.07132
G1 X128.051 Y137.414
G1 X126.474 Y138.991 E.06853
G1 X126.006 Y138.926
M73 P98 R0
G1 X127.527 Y137.405 E.0661
G1 X127.025 Y137.373
G1 X125.551 Y138.848 E.06407
G1 X125.107 Y138.758
G1 X126.542 Y137.323 E.06236
G1 X126.079 Y137.253
G1 X124.681 Y138.651 E.06072
G1 X124.265 Y138.534
G1 X125.633 Y137.166 E.05945
G1 X125.2 Y137.065
G1 X123.857 Y138.409 E.05837
G1 X123.465 Y138.267
G1 X124.781 Y136.952 E.05717
G1 X124.373 Y136.826
G1 X123.08 Y138.119 E.05619
G1 X122.705 Y137.961
G1 X123.982 Y136.684 E.05549
G1 X123.6 Y136.532
G1 X122.342 Y137.791 E.05471
G1 X121.984 Y137.616
G1 X123.229 Y136.371 E.0541
G1 X122.869 Y136.197
G1 X121.638 Y137.428 E.05346
G1 X121.3 Y137.233
G1 X122.52 Y136.013 E.05302
G1 X122.18 Y135.82
G1 X120.969 Y137.03 E.05261
G1 X120.649 Y136.817
G1 X121.849 Y135.617 E.05213
G1 X121.53 Y135.403
G1 X120.333 Y136.6 E.05199
G1 X120.03 Y136.37
G1 X121.218 Y135.182 E.05163
G1 X120.915 Y134.952
G1 X119.732 Y136.135 E.0514
G1 X119.442 Y135.891
G1 X120.623 Y134.71 E.05134
G1 X120.338 Y134.461
G1 X119.161 Y135.639 E.05118
G1 X118.884 Y135.383
G1 X120.062 Y134.205 E.05118
G1 X119.797 Y133.937
G1 X118.62 Y135.114 E.05115
G1 X118.359 Y134.841
G1 X119.538 Y133.662 E.05124
G1 X119.288 Y133.378
G1 X118.109 Y134.558 E.05124
G1 X117.866 Y134.268
G1 X119.05 Y133.084 E.05147
G1 X118.818 Y132.782
G1 X117.629 Y133.971 E.05168
G1 X117.403 Y133.664
G1 X118.595 Y132.472 E.05182
G1 X118.384 Y132.15
G1 X117.18 Y133.353 E.05231
G1 X116.971 Y133.029
G1 X118.18 Y131.82 E.05256
G1 X117.985 Y131.482
G1 X116.767 Y132.7 E.05295
G1 X116.572 Y132.362
G1 X117.804 Y131.13 E.05354
G1 X117.63 Y130.77
G1 X116.386 Y132.014 E.05406
G1 X116.206 Y131.661
G1 X117.466 Y130.401 E.05474
G1 X117.316 Y130.018
G1 X116.04 Y131.294 E.05541
G1 X115.881 Y130.92
G1 X117.177 Y129.624 E.05629
G1 X117.049 Y129.219
G1 X115.731 Y130.537 E.05726
G1 X115.594 Y130.14
G1 X116.932 Y128.802 E.05814
G1 X116.833 Y128.368
G1 X115.465 Y129.736 E.05945
G1 X115.348 Y129.32
G1 X116.748 Y127.919 E.06086
G1 X116.679 Y127.455
G1 X115.245 Y128.89 E.06233
G1 X115.152 Y128.449
G1 X116.627 Y126.974 E.06411
G1 X116.594 Y126.474
G1 X115.072 Y127.996 E.06616
G1 X115.01 Y127.524
G1 X116.584 Y125.951 E.06838
G1 X116.599 Y125.403
G1 X114.963 Y127.039 E.07109
G1 X114.931 Y126.537
G1 X116.644 Y124.824 E.07445
G1 X116.726 Y124.209
G1 X114.918 Y126.017 E.07856
G1 X114.931 Y125.471
G1 X116.852 Y123.55 E.08348
G1 X117.033 Y122.835
G1 X114.967 Y124.901 E.08978
G1 X115.032 Y124.303
G1 X117.291 Y122.044 E.09817
G1 X117.678 Y121.123
G1 X115.13 Y123.671 E.11072
G1 X115.27 Y122.998
G1 X118.322 Y119.946 E.13262
M204 S10000
; WIPE_START
G1 F24000
G1 X116.908 Y121.36 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.694 Y124.854 Z30.4 F30000
G1 X137.678 Y132.054 Z30.4
G1 Z30
G1 E.8 F1800
M204 S2000
G1 F5277
G1 X140.73 Y129.002 E.13261
G1 X140.87 Y128.329
G1 X138.322 Y130.876 E.11071
G1 X138.709 Y129.956
G1 X140.968 Y127.697 E.09817
G1 X141.033 Y127.099
G1 X138.967 Y129.165 E.08978
G1 X139.148 Y128.45
G1 X141.069 Y126.529 E.08347
G1 X141.082 Y125.983
G1 X139.274 Y127.791 E.07856
G1 X139.356 Y127.176
G1 X141.069 Y125.463 E.07445
G1 X141.037 Y124.961
G1 X139.401 Y126.597 E.07109
G1 X139.416 Y126.049
G1 X140.99 Y124.476 E.06837
G1 X140.928 Y124.004
G1 X139.406 Y125.526 E.06616
G1 X139.373 Y125.026
G1 X140.848 Y123.55 E.06411
G1 X140.755 Y123.11
G1 X139.321 Y124.545 E.06233
G1 X139.252 Y124.081
G1 X140.652 Y122.68 E.06086
G1 X140.535 Y122.264
G1 X139.167 Y123.632 E.05945
G1 X139.068 Y123.198
G1 X140.406 Y121.86 E.05814
G1 X140.269 Y121.463
G1 X138.951 Y122.781 E.05726
G1 X138.823 Y122.376
G1 X140.119 Y121.08 E.05629
G1 X139.96 Y120.706
G1 X138.684 Y121.981 E.05541
G1 X138.534 Y121.598
G1 X139.794 Y120.339 E.05474
G1 X139.614 Y119.986
G1 X138.37 Y121.23 E.05406
G1 X138.196 Y120.87
G1 X139.428 Y119.638 E.05354
G1 X139.233 Y119.3
G1 X138.015 Y120.518 E.05295
G1 X137.82 Y120.18
G1 X139.029 Y118.971 E.05256
G1 X138.82 Y118.647
G1 X137.616 Y119.85 E.05231
G1 X137.405 Y119.528
G1 X138.597 Y118.336 E.05182
G1 X138.371 Y118.029
G1 X137.182 Y119.218 E.05168
G1 X136.95 Y118.916
G1 X138.134 Y117.732 E.05147
G1 X137.891 Y117.442
G1 X136.712 Y118.622 E.05124
G1 X136.462 Y118.338
G1 X137.641 Y117.159 E.05124
G1 X137.38 Y116.886
G1 X136.203 Y118.063 E.05115
G1 X135.938 Y117.795
G1 X137.116 Y116.617 E.05118
G1 X136.839 Y116.361
G1 X135.662 Y117.538 E.05118
G1 X135.377 Y117.29
G1 X136.558 Y116.109 E.05134
G1 X136.268 Y115.865
G1 X135.085 Y117.048 E.0514
G1 X134.782 Y116.818
G1 X135.97 Y115.63 E.05163
G1 X135.667 Y115.4
G1 X134.47 Y116.597 E.05199
G1 X134.151 Y116.382
G1 X135.351 Y115.183 E.05213
G1 X135.031 Y114.969
G1 X133.82 Y116.18 E.05261
G1 X133.48 Y115.987
G1 X134.7 Y114.767 E.05302
G1 X134.362 Y114.572
G1 X133.131 Y115.803 E.05346
G1 X132.771 Y115.629
G1 X134.016 Y114.384 E.0541
G1 X133.658 Y114.209
G1 X132.399 Y115.468 E.05471
G1 X132.018 Y115.316
G1 X133.295 Y114.039 E.05549
G1 X132.92 Y113.881
G1 X131.627 Y115.174 E.05619
G1 X131.219 Y115.048
G1 X132.535 Y113.733 E.05717
G1 X132.143 Y113.591
G1 X130.8 Y114.935 E.05837
G1 X130.367 Y114.834
G1 X131.735 Y113.466 E.05945
G1 X131.318 Y113.349
G1 X129.921 Y114.747 E.06072
G1 X129.458 Y114.677
G1 X130.893 Y113.242 E.06235
G1 X130.449 Y113.152
G1 X128.975 Y114.627 E.06407
G1 X128.472 Y114.595
G1 X129.994 Y113.074 E.0661
G1 X129.526 Y113.009
G1 X127.949 Y114.586 E.06853
G1 X127.4 Y114.602
G1 X129.041 Y112.961 E.07132
G1 X128.536 Y112.932
G1 X126.821 Y114.647 E.07452
G1 X126.208 Y114.727
G1 X128.013 Y112.922 E.07847
G1 X127.47 Y112.932
G1 X125.551 Y114.85 E.08336
G1 X124.837 Y115.031
G1 X126.902 Y112.966 E.08972
G1 X126.306 Y113.029
G1 X124.04 Y115.295 E.09845
G1 X123.12 Y115.681
G1 X125.675 Y113.127 E.11099
G1 X125 Y113.268
G1 X121.944 Y116.324 E.1328
M204 S10000
; WIPE_START
G1 F24000
G1 X123.359 Y114.91 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.272 Y113.464 Z30.4 F30000
G1 Z30
G1 E.8 F1800
M204 S2000
G1 F5277
G1 X115.462 Y122.273 E.3828
G1 X115.726 Y121.476
G1 X123.471 Y113.731 E.33658
G1 X122.569 Y114.099
G1 X116.105 Y120.564 E.28092
G1 X116.673 Y119.463
G1 X121.473 Y114.663 E.20859
M204 S10000
G1 X121.997 Y114.378 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.110318
G1 F5277
G1 X121.842 Y114.493 E.00106
; LINE_WIDTH: 0.154611
G1 X121.688 Y114.609 E.00175
; LINE_WIDTH: 0.176758
G1 X121.534 Y114.724 E.0021
G1 X120.667 Y115.173 F30000
; LINE_WIDTH: 0.104261
G1 F5277
G1 X120.526 Y115.29 E.00092
; LINE_WIDTH: 0.136443
G1 X120.384 Y115.407 E.0014
; LINE_WIDTH: 0.174833
G1 X120.139 Y115.621 E.0035
; LINE_WIDTH: 0.219427
G1 X119.893 Y115.835 E.00468
; LINE_WIDTH: 0.255862
G1 X119.654 Y116.054 E.00562
; LINE_WIDTH: 0.284138
G1 X119.416 Y116.273 E.00637
; LINE_WIDTH: 0.307671
G2 X118.052 Y117.653 I20.064 J21.178 E.04186
; LINE_WIDTH: 0.255852
G1 X117.836 Y117.895 E.00563
; LINE_WIDTH: 0.21944
G1 X117.62 Y118.137 E.00467
; LINE_WIDTH: 0.18362
G1 X117.479 Y118.303 E.00249
; LINE_WIDTH: 0.148396
G1 X117.338 Y118.469 E.00187
; LINE_WIDTH: 0.123415
G2 X117.161 Y118.679 I4.132 J3.654 E.0018
; WIPE_START
G1 F24000
G1 X117.338 Y118.469 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X121.883 Y116.263 Z30.4 F30000
G1 Z30
G1 E.8 F1800
; LINE_WIDTH: 0.219904
G1 F5277
G1 X121.768 Y116.355 E.00213
; LINE_WIDTH: 0.195411
G1 X121.621 Y116.476 E.00236
; LINE_WIDTH: 0.159881
G1 X121.475 Y116.597 E.00181
; LINE_WIDTH: 0.124203
G1 X121.327 Y116.72 E.00127
; LINE_WIDTH: 0.106328
G1 X121.21 Y116.822 E.0008
; WIPE_START
G1 F24000
G1 X121.327 Y116.72 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.059 Y115.62 Z30.4 F30000
G1 Z30
G1 E.8 F1800
; LINE_WIDTH: 0.194799
G1 F5277
G1 X122.92 Y115.718 E.00211
; LINE_WIDTH: 0.152125
G1 X122.779 Y115.818 E.00154
; LINE_WIDTH: 0.130515
G1 X122.642 Y115.92 E.00122
; WIPE_START
G1 F24000
G1 X122.779 Y115.818 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X118.823 Y119.209 Z30.4 F30000
G1 Z30
G1 E.8 F1800
; LINE_WIDTH: 0.105162
G1 F5277
G1 X118.679 Y119.377 E.00112
; LINE_WIDTH: 0.139361
G1 X118.534 Y119.548 E.00176
; LINE_WIDTH: 0.174654
G1 X118.398 Y119.717 E.00233
; LINE_WIDTH: 0.192646
G1 X118.262 Y119.885 E.00265
G1 X117.92 Y120.642 F30000
; LINE_WIDTH: 0.109273
G1 F5277
G1 X117.835 Y120.758 E.00078
; LINE_WIDTH: 0.151476
G1 X117.751 Y120.874 E.00127
; LINE_WIDTH: 0.178128
G1 X117.666 Y120.99 E.00158
G1 X117.691 Y121.136 E.00163
; WIPE_START
G1 F24000
G1 X117.666 Y120.99 E-.38567
G1 X117.751 Y120.874 E-.37433
; WIPE_END
G1 E-.04 F1800
G1 X116.167 Y120.626 Z30.4 F30000
G1 Z30
G1 E.8 F1800
; LINE_WIDTH: 0.188604
G1 F5277
G1 X116.039 Y120.811 E.00267
; LINE_WIDTH: 0.163743
G1 X115.911 Y120.995 E.00221
; WIPE_START
G1 F24000
G1 X116.039 Y120.811 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X117.14 Y122.484 Z30.4 F30000
G1 Z30
G1 E.8 F1800
; LINE_WIDTH: 0.152065
G1 F5277
G1 X116.968 Y122.769 E.00297
; WIPE_START
G1 F24000
G1 X117.14 Y122.484 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.178 Y128.217 Z30.4 F30000
G1 X130.09 Y137.221 Z30.4
G1 Z30
G1 E.8 F1800
; LINE_WIDTH: 0.14076
G1 F5277
G1 X129.86 Y137.341 E.00207
; WIPE_START
G1 F24000
G1 X130.09 Y137.221 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.801 Y137.397 Z30.4 F30000
G1 Z30
G1 E.8 F1800
; LINE_WIDTH: 0.115522
G1 F5277
G1 X127.6 Y137.478 E.00128
; WIPE_START
G1 F24000
G1 X127.801 Y137.397 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.133 Y136.8 Z30.4 F30000
G1 Z30
G1 E.8 F1800
; LINE_WIDTH: 0.0924334
G1 F5277
G2 X124.019 Y136.696 I-.29 J.204 E.00062
; WIPE_START
G1 F24000
G1 X124.133 Y136.8 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.757 Y137.151 Z30.4 F30000
G1 X134.466 Y137.276 Z30.4
G1 Z30
G1 E.8 F1800
; LINE_WIDTH: 0.198906
G1 F5277
G1 X134.311 Y137.392 E.00245
; LINE_WIDTH: 0.154612
G1 X134.157 Y137.507 E.00175
; LINE_WIDTH: 0.132465
G1 X134.003 Y137.622 E.0014
; WIPE_START
G1 F24000
G1 X134.157 Y137.507 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X133.358 Y136.08 Z30.4 F30000
G1 Z30
G1 E.8 F1800
; LINE_WIDTH: 0.109568
G1 F5277
G1 X133.219 Y136.183 E.00094
; LINE_WIDTH: 0.152325
G1 X133.08 Y136.282 E.00152
; LINE_WIDTH: 0.173549
G1 X132.941 Y136.381 E.00182
; WIPE_START
G1 F24000
G1 X133.08 Y136.282 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X134.789 Y135.179 Z30.4 F30000
G1 Z30
G1 E.8 F1800
; LINE_WIDTH: 0.0972926
G1 F5277
G1 X134.672 Y135.281 E.00069
; LINE_WIDTH: 0.124253
G1 X134.525 Y135.403 E.00126
; LINE_WIDTH: 0.159786
G1 X134.379 Y135.524 E.00181
; LINE_WIDTH: 0.193468
G1 X134.116 Y135.737 E.00415
; WIPE_START
G1 F24000
G1 X134.379 Y135.524 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X138.839 Y133.32 Z30.4 F30000
G1 Z30
G1 E.8 F1800
; LINE_WIDTH: 0.0919142
G1 F5277
G1 X138.803 Y133.365 E.00023
; LINE_WIDTH: 0.113269
G1 X138.662 Y133.531 E.00125
; LINE_WIDTH: 0.148495
G1 X138.521 Y133.697 E.00187
; LINE_WIDTH: 0.183722
G1 X138.38 Y133.863 E.0025
; LINE_WIDTH: 0.21954
G1 X138.164 Y134.105 E.00467
; LINE_WIDTH: 0.255952
G1 X137.948 Y134.347 E.00564
; LINE_WIDTH: 0.30777
G3 X136.584 Y135.727 I-21.427 J-19.798 E.04188
; LINE_WIDTH: 0.284236
G1 X136.345 Y135.946 E.00637
; LINE_WIDTH: 0.255961
G1 X136.107 Y136.165 E.00563
; LINE_WIDTH: 0.219526
G1 X135.861 Y136.379 E.00468
; LINE_WIDTH: 0.174931
G1 X135.616 Y136.593 E.0035
; LINE_WIDTH: 0.13652
G1 X135.474 Y136.71 E.0014
; LINE_WIDTH: 0.120403
G1 X135.333 Y136.828 E.00116
; WIPE_START
G1 F24000
G1 X135.474 Y136.71 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X137.739 Y132.114 Z30.4 F30000
G1 Z30
G1 E.8 F1800
; LINE_WIDTH: 0.210613
G1 F5277
G1 X137.602 Y132.283 E.00297
; LINE_WIDTH: 0.174343
G1 X137.464 Y132.454 E.00235
; LINE_WIDTH: 0.139067
G1 X137.321 Y132.622 E.00173
; LINE_WIDTH: 0.122102
G1 X137.178 Y132.791 E.00143
; WIPE_START
G1 F24000
G1 X137.321 Y132.622 E-.76
; WIPE_END
M73 P99 R0
G1 E-.04 F1800
G1 X138.309 Y130.864 Z30.4 F30000
G1 Z30
G1 E.8 F1800
; LINE_WIDTH: 0.177275
G1 F5277
G1 X138.334 Y131.01 E.00162
; LINE_WIDTH: 0.193669
G1 X138.249 Y131.126 E.00176
; LINE_WIDTH: 0.15147
G1 X138.165 Y131.242 E.00127
; LINE_WIDTH: 0.13037
G1 X138.08 Y131.358 E.00102
; WIPE_START
G1 F24000
G1 X138.165 Y131.242 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.089 Y131.004 Z30.4 F30000
G1 Z30
G1 E.8 F1800
; LINE_WIDTH: 0.138959
G1 F5277
G1 X139.961 Y131.189 E.00176
; LINE_WIDTH: 0.163795
G1 X139.833 Y131.374 E.00221
; WIPE_START
G1 F24000
G1 X139.961 Y131.189 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.032 Y129.231 Z30.4 F30000
G1 Z30
G1 E.8 F1800
; LINE_WIDTH: 0.15332
G1 F5277
G1 X138.86 Y129.516 E.003
; WIPE_START
G1 F24000
G1 X139.032 Y129.231 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X134.561 Y123.045 Z30.4 F30000
G1 X128.4 Y114.522 Z30.4
G1 Z30
G1 E.8 F1800
; LINE_WIDTH: 0.117209
G1 F5277
G1 X128.199 Y114.603 E.00131
; WIPE_START
G1 F24000
G1 X128.4 Y114.522 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.14 Y114.659 Z30.4 F30000
G1 Z30
G1 E.8 F1800
; LINE_WIDTH: 0.14241
G1 F5277
G1 X125.91 Y114.779 E.0021
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X126.14 Y114.659 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; filament end gcode 
M106 P3 S0
;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z30.5 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000

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

M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
    M400 ; wait all motion done
    M991 S0 P-1 ;end smooth timelapse at safe pos
    M400 S3 ;wait for last picture to be taken
M623; end of "timelapse_record_flag"

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z130 F600
    G1 Z128

M400 P100
M17 R ; restore z current

G90
G1 X128 Y250 F3600

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M141 S0;set chamber_temperature
M73 P100 R0
; EXECUTABLE_BLOCK_END

