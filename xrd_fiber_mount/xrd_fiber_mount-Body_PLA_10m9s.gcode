; HEADER_BLOCK_START
; BambuStudio 01.07.01.62
; model printing time: 4m 22s; total estimated time: 10m 9s
; total layer number: 136
; model label id: 66
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
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
; chamber_temperatures = 0
; change_filament_gcode = M620 S[next_extruder]A\nM204 S9000\n{if toolchange_count > 1 && (z_hop_types[current_extruder] == 0 || z_hop_types[current_extruder] == 3)}\nG17\nG2 Z{z_after_toolchange + 0.4} I0.86 J0.86 P1 F10000 ; spiral lift a little from second lift\n{endif}\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\n\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F[old_filament_e_feedrate] T{nozzle_temperature_range_high[previous_extruder]}\nT[next_extruder]\nM620.1 E F[new_filament_e_feedrate] T{nozzle_temperature_range_high[next_extruder]}\n\n{if next_extruder < 255}\nM400\n\nG92 E0\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM109 S[nozzle_temperature_range_high]\n{if flush_length_1 > 23.7}\nG1 E23.7 F{old_filament_e_feedrate} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{old_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\n{else}\nG1 E{flush_length_1} F{old_filament_e_feedrate}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{new_filament_e_feedrate} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\nG1 X80 F15000\nG1 X60 F15000\nG1 X80 F15000\nG1 X60 F15000; shake to put down garbage\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A
; close_fan_the_first_x_layers = 1
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
; extruder_clearance_max_radius = 56
; extruder_clearance_radius = 57
; extruder_colour = #018001
; extruder_offset = 0x2
; extruder_type = DirectDrive
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
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}"
; filament_type = PLA
; filament_vendor = "Bambu Lab"
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; filter_out_gap_fill = 0
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
; only_one_wall_top = 1
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
; support_remove_small_overhang = 1
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
; upward_compatible_machine = "Bambu Lab P1S 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle"
; use_relative_e_distances = 1
; wall_distribution_count = 1
; wall_filament = 1
; wall_generator = arachne
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
M73 P0 R10
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
M73 P42 R5
G1 X60 F12000
G1 Y245
G1 Y265 F3000
M620 M
M620 S0A   ; switch material if AMS exist
    M109 S220
    G1 X120 F12000

M73 P43 R5
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
M73 P46 R5
G1 E-0.5 F300

M73 P48 R5
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
M73 P49 R5
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
M73 P50 R5
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
    G29 A X116.587 Y118.587 I22.8265 J18.8265
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
M73 P50 R4
G1 F30000
M73 P51 R4
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
; layer num/total_layer_count: 1/136
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
G1 X135.693 Y130.816 F30000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.5
G1 F3000
M73 P52 R4
G1 X123.184 Y130.816 E.46588
G1 X123.184 Y121.184 E.35872
G1 X135.693 Y121.184 E.46588
G1 X135.693 Y130.747 E.35617
; WIPE_START
G1 F24000
G1 X135.693 Y128.747 E-.76
; WIPE_END
M73 P53 R4
G1 E-.04 F1800
G1 X129.294 Y124.586 Z.6 F30000
G1 X127.855 Y123.65 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X127.65 Y123.855 E.0108
G1 X127.65 Y124.65 E.02961
G1 X123.855 Y124.65 E.14135
M73 P54 R4
G1 X123.65 Y124.855 E.0108
G1 X123.65 Y127.145 E.08529
G1 X123.855 Y127.35 E.0108
G1 X127.65 Y127.35 E.14135
G1 X127.65 Y128.145 E.02961
G1 X127.855 Y128.35 E.0108
M73 P55 R4
G1 X130.145 Y128.35 E.08529
G1 X130.35 Y128.145 E.0108
G1 X130.35 Y126.35 E.06686
G1 X132.145 Y126.35 E.06686
G1 X132.35 Y126.145 E.0108
G1 X132.35 Y123.855 E.08529
G1 X132.145 Y123.65 E.0108
G1 X127.924 Y123.65 E.15723
G1 X127.239 Y124.239 F30000
G1 F3000
G1 X123.685 Y124.239 E.13237
G1 X123.596 Y124.327 E.00468
G1 X123.596 Y121.596 E.10174
G1 X135.281 Y121.596 E.43524
G1 X135.281 Y130.404 E.32808
G1 X123.596 Y130.404 E.43524
G1 X123.596 Y127.673 E.10174
G1 X123.685 Y127.761 E.00468
M73 P56 R4
G1 X127.239 Y127.761 E.13237
G1 X127.239 Y128.315 E.02063
G1 X127.685 Y128.761 E.02349
G1 X130.315 Y128.761 E.09798
G1 X130.761 Y128.315 E.02349
G1 X130.761 Y126.761 E.05788
G1 X132.315 Y126.761 E.05788
G1 X132.761 Y126.315 E.02349
G1 X132.761 Y123.685 E.09798
G1 X132.315 Y123.239 E.02349
G1 X127.685 Y123.239 E.17248
G1 X127.239 Y123.685 E.02349
G1 X127.239 Y124.239 E.02063
G1 X126.731 Y123.731 F30000
G1 F3000
M73 P57 R4
G1 X124.104 Y123.731 E.09785
G1 X124.104 Y122.104 E.0606
G1 X134.773 Y122.104 E.3974
G1 X134.773 Y129.896 E.29024
G1 X124.104 Y129.896 E.3974
G1 X124.104 Y128.269 E.0606
G1 X126.731 Y128.269 E.09785
G1 X126.731 Y128.526 E.00955
G1 X127.474 Y129.269 E.03916
G1 X130.526 Y129.269 E.11366
G1 X131.269 Y128.526 E.03916
G1 X131.269 Y127.269 E.0468
G1 X132.526 Y127.269 E.0468
G1 X133.269 Y126.526 E.03916
G1 X133.269 Y123.474 E.11366
G1 X132.526 Y122.731 E.03916
G1 X127.474 Y122.731 E.18815
G1 X126.731 Y123.474 E.03916
G1 X126.731 Y123.731 E.00955
; WIPE_START
G1 F24000
G1 X126.731 Y123.474 E-.09747
G1 X127.474 Y122.731 E-.39956
G1 X128.166 Y122.731 E-.26297
; WIPE_END
G1 E-.04 F1800
G1 X131.777 Y127.777 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X132.736 Y127.777 E.03572
G1 X133.777 Y126.736 E.05483
G1 X133.777 Y123.264 E.12933
G1 X133.125 Y122.612 E.03436
G1 X134.266 Y122.612 E.04249
G1 X134.266 Y129.388 E.25241
G1 X131.125 Y129.388 E.11698
G1 X131.777 Y128.736 E.03436
G1 X131.777 Y127.777 E.03572
G1 X132.285 Y128.285 F30000
G1 F3000
G1 X132.946 Y128.285 E.02464
G1 X133.758 Y127.474 E.04273
G1 X133.758 Y128.881 E.0524
G1 X132.285 Y128.881 E.05485
G1 X132.285 Y128.285 E.02218
G1 X126.875 Y129.388 F30000
G1 F3000
G1 X124.612 Y129.388 E.08431
G1 X124.612 Y128.777 E.02277
G1 X126.264 Y128.777 E.06154
G1 X126.875 Y129.388 E.0322
; WIPE_START
G1 F24000
G1 X126.264 Y128.777 E-.32852
G1 X125.128 Y128.777 E-.43148
; WIPE_END
G1 E-.04 F1800
G1 X126.264 Y123.223 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X124.612 Y123.223 E.06154
G1 X124.612 Y122.612 E.02277
G1 X126.875 Y122.612 E.08431
G1 X126.264 Y123.223 E.0322
; WIPE_START
G1 F24000
G1 X126.875 Y122.612 E-.32852
G1 X125.74 Y122.612 E-.43148
; WIPE_END
G1 E-.04 F1800
G1 X124.422 Y117.783 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
G1 F3000
G1 X124.671 Y117.634 E.01082
G1 X125.428 Y117.294 E.0309
G1 X126.04 Y117.092 E.024
G1 X126.847 Y116.91 E.03083
G1 X128.009 Y116.815 E.04343
M73 P58 R4
G1 X131.993 Y116.815 E.14839
G1 X132.827 Y116.864 E.03109
G1 X133.642 Y117.009 E.03084
G1 X134.433 Y117.247 E.03076
G1 X135.432 Y117.703 E.04091
G1 X136.215 Y118.191 E.03436
G1 X136.858 Y118.712 E.03082
G1 X137.436 Y119.304 E.03084
G1 X137.941 Y119.961 E.03084
G1 X138.366 Y120.671 E.03084
G1 X138.706 Y121.428 E.03091
G1 X138.893 Y121.987 E.02195
G1 X139.09 Y122.848 E.03287
G1 X139.185 Y124.009 E.04341
G1 X139.185 Y125.993 E.0739
G1 X139.136 Y126.827 E.03109
G1 X138.991 Y127.642 E.03084
G1 X138.753 Y128.433 E.03076
G1 X138.297 Y129.432 E.04091
G1 X137.809 Y130.215 E.03436
G1 X137.288 Y130.858 E.03082
G1 X136.696 Y131.435 E.03081
G1 X135.973 Y131.982 E.03376
G1 X135.809 Y132.214 E.01059
G1 X135.288 Y132.858 E.03084
G1 X134.696 Y133.436 E.03084
G1 X134.039 Y133.941 E.03084
G1 X133.329 Y134.366 E.03084
G1 X132.572 Y134.706 E.0309
G1 X131.96 Y134.908 E.024
G1 X131.153 Y135.09 E.03083
G1 X129.991 Y135.185 E.04343
G1 X128.007 Y135.185 E.0739
G1 X127.173 Y135.136 E.03109
G1 X126.358 Y134.991 E.03084
G1 X125.567 Y134.753 E.03076
G1 X124.565 Y134.296 E.04103
G1 X124.429 Y134.216 E.00588
G1 X124.313 Y134.185 E.00446
G1 X124.007 Y134.185 E.01141
G1 X123.173 Y134.136 E.03109
G1 X122.358 Y133.991 E.03084
G1 X121.567 Y133.753 E.03076
G1 X120.568 Y133.297 E.04091
G1 X119.785 Y132.809 E.03436
G1 X119.142 Y132.288 E.03082
G1 X118.564 Y131.696 E.03084
G1 X118.059 Y131.039 E.03084
G1 X117.634 Y130.329 E.03084
G1 X117.294 Y129.572 E.0309
G1 X117.092 Y128.96 E.024
G1 X116.91 Y128.153 E.03083
G1 X116.815 Y126.991 E.04343
G1 X116.815 Y125.007 E.0739
G1 X116.864 Y124.173 E.03109
G1 X117.009 Y123.358 E.03084
G1 X117.247 Y122.567 E.03076
G1 X117.703 Y121.568 E.04091
G1 X118.191 Y120.785 E.03436
G1 X118.712 Y120.142 E.03082
G1 X119.304 Y119.564 E.03084
G1 X119.961 Y119.059 E.03084
G1 X120.671 Y118.634 E.03084
G1 X121.428 Y118.294 E.0309
G1 X122.04 Y118.092 E.024
G1 X122.847 Y117.91 E.03083
G1 X124.009 Y117.815 E.04343
G1 X124.305 Y117.815 E.011
G1 X124.364 Y117.799 E.0023
G1 X124.517 Y118.223 F30000
G1 F3000
G1 X124.668 Y118.168 E.00598
G1 X124.89 Y118.036 E.00962
G1 X125.587 Y117.723 E.02845
G1 X126.168 Y117.532 E.0228
G1 X126.926 Y117.362 E.02892
G1 X128.022 Y117.273 E.04097
G1 X131.984 Y117.273 E.14755
G1 X132.781 Y117.32 E.02974
G1 X133.528 Y117.453 E.02825
G1 X134.262 Y117.673 E.02856
G1 X135.207 Y118.102 E.03866
G1 X135.942 Y118.559 E.03222
G1 X136.555 Y119.056 E.02938
G1 X137.095 Y119.611 E.02885
G1 X137.558 Y120.212 E.02825
G1 X137.964 Y120.89 E.02944
G1 X138.282 Y121.601 E.02902
G1 X138.454 Y122.117 E.02026
G1 X138.635 Y122.908 E.03021
G1 X138.727 Y124.022 E.04165
G1 X138.728 Y125.976 E.07276
G1 X138.68 Y126.781 E.03004
G1 X138.547 Y127.528 E.02825
G1 X138.327 Y128.262 E.02856
G1 X137.898 Y129.207 E.03866
G1 X137.441 Y129.942 E.03222
G1 X136.955 Y130.543 E.02879
G1 X136.84 Y130.657 E.00603
G1 X136.732 Y130.695 E.00426
G1 X136.632 Y130.639 E.00426
G1 X136.607 Y130.559 E.00313
G1 X136.607 Y121.103 E.35217
G1 X136.567 Y120.902 E.00763
G1 X136.51 Y120.766 E.00551
G1 X136.396 Y120.595 E.00763
G1 X136.282 Y120.481 E.00605
G1 X136.111 Y120.367 E.00763
G1 X135.975 Y120.31 E.00551
G1 X135.774 Y120.27 E.00763
G1 X123.103 Y120.27 E.47193
G1 X122.902 Y120.31 E.00763
G1 X122.766 Y120.367 E.00551
G1 X122.595 Y120.481 E.00763
G1 X122.481 Y120.595 E.00605
G1 X122.367 Y120.766 E.00763
G1 X122.31 Y120.902 E.00551
G1 X122.27 Y121.103 E.00763
G1 X122.27 Y130.897 E.36477
G1 X122.31 Y131.098 E.00763
G1 X122.367 Y131.234 E.00551
G1 X122.481 Y131.405 E.00763
G1 X122.595 Y131.519 E.00605
G1 X122.766 Y131.633 E.00763
G1 X122.902 Y131.69 E.00551
G1 X123.103 Y131.73 E.00763
G1 X135.326 Y131.73 E.45525
G1 X135.43 Y131.777 E.00426
G1 X135.462 Y131.887 E.00426
G1 X135.433 Y131.953 E.00268
G1 X134.955 Y132.543 E.02827
G1 X134.401 Y133.085 E.02885
G1 X133.775 Y133.567 E.02944
G1 X133.11 Y133.964 E.02885
G1 X132.413 Y134.277 E.02845
G1 X131.832 Y134.468 E.0228
G1 X131.074 Y134.638 E.02892
G1 X129.966 Y134.728 E.04139
G1 X128.024 Y134.728 E.07235
G1 X127.219 Y134.68 E.03004
G1 X126.472 Y134.547 E.02825
G1 X125.738 Y134.327 E.02856
G1 X124.677 Y133.831 E.04361
G1 X124.442 Y133.747 E.0093
G1 X123.235 Y133.682 E.045
G1 X122.456 Y133.544 E.02946
G1 X121.72 Y133.321 E.02865
G1 X120.793 Y132.898 E.03797
G1 X120.058 Y132.441 E.03222
G1 X119.457 Y131.955 E.02879
G1 X118.915 Y131.401 E.02885
G1 X118.442 Y130.788 E.02885
G1 X118.044 Y130.124 E.02885
G1 X117.723 Y129.413 E.02905
G1 X117.532 Y128.832 E.0228
G1 X117.365 Y128.093 E.0282
G1 X117.272 Y126.966 E.0421
G1 X117.273 Y125.016 E.07265
G1 X117.32 Y124.219 E.02974
G1 X117.456 Y123.456 E.02885
G1 X117.679 Y122.72 E.02865
G1 X118.102 Y121.793 E.03797
G1 X118.559 Y121.058 E.03222
G1 X119.045 Y120.457 E.02879
G1 X119.599 Y119.915 E.02885
G1 X120.212 Y119.442 E.02885
G1 X120.876 Y119.044 E.02885
G1 X121.587 Y118.723 E.02905
G1 X122.168 Y118.532 E.0228
G1 X122.907 Y118.365 E.0282
G1 X124.434 Y118.253 E.05703
G1 X124.461 Y118.243 E.00105
G1 X124.555 Y118.688 F30000
G1 F3000
G1 X124.598 Y118.679 E.00162
G1 X124.813 Y118.602 E.00851
G1 X125.108 Y118.44 E.01256
M73 P59 R4
G1 X125.746 Y118.153 E.02605
G1 X126.297 Y117.971 E.02159
G1 X127.004 Y117.815 E.027
G1 X128.035 Y117.73 E.03854
G1 X131.974 Y117.73 E.14671
G1 X132.719 Y117.774 E.0278
G1 X133.43 Y117.9 E.02687
G1 X134.11 Y118.105 E.02646
G1 X134.983 Y118.503 E.03572
G1 X135.669 Y118.928 E.03007
G1 X136.24 Y119.389 E.02733
G1 X136.772 Y119.942 E.0286
G1 X136.81 Y120.05 E.00426
G1 X136.752 Y120.149 E.00426
G1 X136.594 Y120.149 E.0059
G1 X136.372 Y119.992 E.01012
G1 X136.159 Y119.893 E.00876
G1 X135.76 Y119.813 E.01515
G1 X123.114 Y119.813 E.47101
G1 X122.821 Y119.861 E.01106
G1 X122.599 Y119.942 E.00883
G1 X122.349 Y120.096 E.01094
G1 X122.165 Y120.265 E.00927
G1 X121.941 Y120.601 E.01504
G1 X121.861 Y120.821 E.00874
G1 X121.813 Y121.114 E.01106
G1 X121.825 Y130.999 E.36817
G1 X121.86 Y131.176 E.00674
G1 X121.941 Y131.399 E.00883
G1 X122.165 Y131.735 E.01504
G1 X122.349 Y131.904 E.00927
G1 X122.599 Y132.058 E.01094
G1 X122.824 Y132.14 E.00892
G1 X123.001 Y132.175 E.00674
G1 X134.329 Y132.187 E.42194
G1 X134.433 Y132.235 E.00426
G1 X134.465 Y132.345 E.00426
G1 X134.425 Y132.422 E.00324
G1 X134.095 Y132.744 E.01718
G1 X133.524 Y133.183 E.02682
G1 X132.905 Y133.553 E.02686
G1 X132.254 Y133.847 E.02661
G1 X131.716 Y134.025 E.02108
G1 X130.996 Y134.185 E.0275
G1 X129.953 Y134.27 E.03895
G1 X128.034 Y134.27 E.07151
G1 X127.28 Y134.226 E.0281
G1 X126.57 Y134.1 E.02686
G1 X125.892 Y133.895 E.02639
G1 X124.877 Y133.419 E.04176
G1 X124.603 Y133.319 E.01085
G1 X124.457 Y133.29 E.00556
G1 X123.28 Y133.225 E.04391
G1 X122.571 Y133.1 E.02681
G1 X121.891 Y132.895 E.02646
G1 X121.002 Y132.489 E.0364
G1 X120.331 Y132.072 E.02944
G1 X119.771 Y131.621 E.02675
G1 X119.267 Y131.106 E.02685
G1 X118.825 Y130.536 E.02685
G1 X118.454 Y129.919 E.02685
G1 X118.153 Y129.254 E.02719
G1 X117.971 Y128.703 E.02159
G1 X117.82 Y128.033 E.02559
G1 X117.729 Y126.942 E.04077
G1 X117.73 Y125.026 E.07138
G1 X117.774 Y124.281 E.02779
G1 X117.904 Y123.555 E.02744
G1 X118.112 Y122.874 E.02655
G1 X118.502 Y122.017 E.03506
G1 X118.928 Y121.331 E.03009
G1 X119.379 Y120.771 E.02675
G1 X119.894 Y120.267 E.02685
G1 X120.464 Y119.825 E.02685
G1 X121.081 Y119.454 E.02685
G1 X121.746 Y119.153 E.02719
G1 X122.297 Y118.971 E.02159
G1 X122.965 Y118.821 E.02549
G1 X124.458 Y118.709 E.0558
G1 X124.497 Y118.701 E.00146
; WIPE_START
G1 F24000
G1 X124.598 Y118.679 E-.03933
G1 X124.813 Y118.602 E-.08682
G1 X125.108 Y118.44 E-.1281
G1 X125.746 Y118.153 E-.26576
G1 X126.297 Y117.971 E-.22023
G1 X126.347 Y117.96 E-.01976
; WIPE_END
G1 E-.04 F1800
G1 X125.565 Y125.552 Z.6 F30000
G1 X124.835 Y132.634 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X133.041 Y132.643 E.30566
G1 X133.145 Y132.69 E.00426
G1 X133.176 Y132.8 E.00426
G1 X133.111 Y132.897 E.00435
G1 X132.686 Y133.151 E.01845
G1 X132.081 Y133.423 E.02471
G1 X131.588 Y133.585 E.01933
G1 X130.937 Y133.73 E.02485
G1 X129.929 Y133.813 E.03764
G1 X128.043 Y133.813 E.07026
G1 X127.342 Y133.771 E.02616
G1 X126.685 Y133.656 E.02486
G1 X126.047 Y133.463 E.02482
G1 X125.076 Y133.008 E.03995
G1 X124.787 Y132.9 E.01149
G1 X124.706 Y132.819 E.00426
G1 X124.715 Y132.705 E.00426
G1 X124.783 Y132.665 E.00295
; WIPE_START
G1 F24000
G1 X126.783 Y132.659 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X121.923 Y132.212 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X121.863 Y132.309 E.00426
G1 X121.73 Y132.319 E.00493
G1 X121.211 Y132.081 E.0213
G1 X120.603 Y131.703 E.02667
G1 X120.073 Y131.276 E.02532
G1 X119.607 Y130.799 E.02485
G1 X119.208 Y130.284 E.02426
G1 X118.856 Y129.699 E.02545
G1 X118.577 Y129.08 E.02526
G1 X118.411 Y128.574 E.01984
G1 X118.272 Y127.954 E.02368
G1 X118.187 Y126.917 E.03874
G1 X118.187 Y125.043 E.0698
G1 X118.23 Y124.327 E.02673
G1 X118.348 Y123.671 E.02483
G1 X118.537 Y123.045 E.02437
G1 X118.903 Y122.241 E.03286
G1 X119.297 Y121.603 E.02797
G1 X119.724 Y121.073 E.02532
G1 X120.201 Y120.607 E.02485
G1 X120.716 Y120.208 E.02426
G1 X121.301 Y119.856 E.02545
G1 X121.771 Y119.643 E.0192
G1 X121.886 Y119.644 E.00426
G1 X121.96 Y119.731 E.00426
G1 X121.921 Y119.869 E.00534
G1 X121.866 Y119.919 E.00275
G1 X121.565 Y120.342 E.01934
G1 X121.51 Y120.45 E.00452
G1 X121.408 Y120.758 E.01205
G1 X121.356 Y121.125 E.01381
G1 X121.368 Y130.989 E.3674
G1 X121.411 Y131.259 E.0102
G1 X121.509 Y131.549 E.01141
G1 X121.78 Y131.981 E.01897
G1 X121.89 Y132.103 E.00611
G1 X121.906 Y132.155 E.00203
; WIPE_START
G1 F24000
G1 X121.863 Y132.309 E-.06085
G1 X121.73 Y132.319 E-.05033
G1 X121.211 Y132.081 E-.21727
G1 X120.603 Y131.703 E-.27208
G1 X120.276 Y131.44 E-.15948
; WIPE_END
G1 E-.04 F1800
G1 X120.87 Y131.187 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X120.761 Y131.219 E.00426
G1 X120.695 Y131.19 E.00267
G1 X120.375 Y130.932 E.01531
G1 X119.958 Y130.504 E.02226
G1 X119.591 Y130.032 E.02227
G1 X119.266 Y129.493 E.02344
G1 X119.001 Y128.908 E.02392
G1 X118.851 Y128.447 E.01808
G1 X118.725 Y127.876 E.02178
G1 X118.644 Y126.893 E.03673
G1 X118.644 Y125.061 E.06821
G1 X118.685 Y124.389 E.02509
G1 X118.795 Y123.77 E.02343
G1 X118.97 Y123.198 E.02227
G1 X119.311 Y122.45 E.03063
G1 X119.667 Y121.874 E.02519
G1 X120.068 Y121.375 E.02386
G1 X120.496 Y120.958 E.02226
G1 X120.703 Y120.796 E.00981
G1 X120.815 Y120.77 E.00426
G1 X120.907 Y120.837 E.00426
G1 X120.923 Y120.923 E.00326
G1 X120.905 Y121.051 E.00479
G1 X120.918 Y131.083 E.37367
G1 X120.895 Y131.133 E.00203
; WIPE_START
G1 F24000
G1 X120.761 Y131.219 E-.06084
G1 X120.695 Y131.19 E-.02723
G1 X120.375 Y130.932 E-.15619
G1 X119.958 Y130.504 E-.22707
G1 X119.591 Y130.032 E-.22723
G1 X119.507 Y129.894 E-.06142
; WIPE_END
G1 E-.04 F1800
G1 X120.412 Y130.109 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X120.302 Y130.141 E.00426
G1 X120.214 Y130.089 E.0038
G1 X119.973 Y129.779 E.01463
G1 X119.675 Y129.287 E.02142
G1 X119.431 Y128.749 E.02201
G1 X119.291 Y128.319 E.01684
G1 X119.177 Y127.798 E.01987
G1 X119.101 Y126.88 E.03432
G1 X119.101 Y125.079 E.06706
G1 X119.141 Y124.435 E.02403
G1 X119.243 Y123.869 E.02143
G1 X119.402 Y123.352 E.02016
G1 X119.712 Y122.673 E.02778
G1 X120.046 Y122.132 E.02369
G1 X120.205 Y121.934 E.00946
G1 X120.308 Y121.883 E.00426
G1 X120.413 Y121.928 E.00426
G1 X120.449 Y122.02 E.0037
G1 X120.46 Y130.005 E.29741
G1 X120.437 Y130.055 E.00203
; WIPE_START
G1 F24000
G1 X120.302 Y130.141 E-.06084
G1 X120.214 Y130.089 E-.03873
G1 X119.973 Y129.779 E-.14924
G1 X119.675 Y129.287 E-.21856
G1 X119.431 Y128.749 E-.22456
G1 X119.376 Y128.579 E-.06807
; WIPE_END
G1 E-.04 F1800
G1 X119.921 Y128.268 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X119.843 Y128.291 E.00304
G1 X119.729 Y128.184 E.0058
G1 X119.629 Y127.721 E.01765
G1 X119.558 Y126.855 E.03236
G1 X119.558 Y125.089 E.06578
M73 P60 R4
G1 X119.597 Y124.479 E.02277
G1 X119.723 Y123.864 E.02336
G1 X119.791 Y123.772 E.00426
G1 X119.905 Y123.763 E.00426
G1 X119.995 Y123.892 E.00584
G1 X120 Y128.155 E.15879
G1 X119.964 Y128.234 E.00325
; WIPE_START
G1 F24000
G1 X119.843 Y128.291 E-.0508
G1 X119.729 Y128.184 E-.05913
G1 X119.629 Y127.721 E-.18008
G1 X119.558 Y126.855 E-.33013
G1 X119.558 Y126.487 E-.13986
; WIPE_END
G1 E-.04 F1800
G1 X124.031 Y120.302 Z.6 F30000
G1 X124.749 Y119.308 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X124.718 Y119.198 E.00426
G1 X124.803 Y119.091 E.00511
G1 X125.041 Y118.998 E.00951
G1 X125.317 Y118.847 E.01175
G1 X125.905 Y118.583 E.02401
G1 X126.425 Y118.411 E.02037
G1 X127.082 Y118.267 E.02506
G1 X128.06 Y118.187 E.03654
G1 X131.965 Y118.187 E.14545
G1 X132.674 Y118.23 E.02645
G1 X133.316 Y118.344 E.02428
G1 X133.94 Y118.532 E.02427
G1 X134.759 Y118.903 E.0335
G1 X135.083 Y119.103 E.01418
G1 X135.146 Y119.198 E.00426
G1 X135.115 Y119.308 E.00426
G1 X135.011 Y119.356 E.00428
G1 X124.853 Y119.356 E.37833
G1 X124.804 Y119.333 E.00203
; WIPE_START
G1 F24000
G1 X124.718 Y119.198 E-.06084
G1 X124.803 Y119.091 E-.05209
G1 X125.041 Y118.998 E-.09699
G1 X125.317 Y118.847 E-.11984
G1 X125.905 Y118.583 E-.24498
G1 X126.368 Y118.43 E-.18526
; WIPE_END
G1 E-.04 F1800
G1 X133.862 Y119.881 Z.6 F30000
G1 X136.947 Y120.478 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X137.04 Y120.412 E.00426
G1 X137.183 Y120.476 E.00584
G1 X137.561 Y121.109 E.02744
G1 X137.853 Y121.761 E.0266
G1 X138.011 Y122.235 E.0186
G1 X138.183 Y122.988 E.02878
G1 X138.27 Y124.047 E.03958
G1 X138.27 Y125.966 E.07149
G1 X138.226 Y126.72 E.0281
G1 X138.103 Y127.414 E.02627
G1 X137.895 Y128.11 E.02705
G1 X137.497 Y128.983 E.03572
G1 X137.317 Y129.274 E.01277
G1 X137.222 Y129.338 E.00426
G1 X137.112 Y129.306 E.00426
G1 X137.064 Y129.202 E.00428
G1 X137.064 Y121.114 E.30124
G1 X137.016 Y120.82 E.01109
G1 X136.936 Y120.592 E.00901
G1 X136.941 Y120.538 E.00203
; WIPE_START
G1 F24000
G1 X137.04 Y120.412 E-.06084
G1 X137.183 Y120.476 E-.05961
G1 X137.561 Y121.109 E-.27997
G1 X137.853 Y121.761 E-.27136
G1 X137.926 Y121.981 E-.08821
; WIPE_END
G1 E-.04 F1800
G1 X137.679 Y123.719 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X137.774 Y123.782 E.00426
G1 X137.813 Y124.072 E.01087
G1 X137.813 Y125.957 E.07023
G1 X137.795 Y126.261 E.01135
G1 X137.741 Y126.362 E.00426
G1 X137.629 Y126.387 E.00426
G1 X137.538 Y126.319 E.00426
G1 X137.521 Y126.253 E.00253
G1 X137.521 Y123.855 E.08932
G1 X137.569 Y123.751 E.00426
G1 X137.621 Y123.736 E.00203
; WIPE_START
G1 F24000
G1 X137.774 Y123.782 E-.06085
G1 X137.813 Y124.072 E-.11092
G1 X137.813 Y125.62 E-.58824
; WIPE_END
G1 E-.04 F1800
G1 X136.15 Y123.736 Z.6 F30000
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X136.15 Y130.747 E.26113
G1 X136.101 Y130.888 E.00555
G1 X135.921 Y130.976 E.00745
G1 X135.921 Y131.044 E.00255
G1 X135.873 Y131.185 E.00555
G1 X135.693 Y131.273 E.00745
G1 X123.09 Y131.273 E.46941
G1 X122.928 Y131.206 E.00651
G1 X122.794 Y131.072 E.00705
G1 X122.727 Y130.91 E.00651
G1 X122.727 Y121.09 E.36577
G1 X122.794 Y120.928 E.00651
G1 X122.928 Y120.794 E.00705
G1 X123.09 Y120.727 E.00651
G1 X135.787 Y120.727 E.47293
G1 X135.949 Y120.794 E.00651
G1 X136.083 Y120.928 E.00705
G1 X136.15 Y121.09 E.00651
G1 X136.15 Y123.676 E.09633
; WIPE_START
G1 F24000
G1 X136.15 Y125.676 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.779 Y126.72 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.455808
G1 F3000
G1 X128.775 Y126.709 E.0004
; LINE_WIDTH: 0.497235
G1 X128.736 Y126.59 E.00465
; LINE_WIDTH: 0.538662
G1 X128.697 Y126.47 E.00507
; LINE_WIDTH: 0.580089
G1 X128.658 Y126.351 E.0055
; LINE_WIDTH: 0.621516
G1 X128.619 Y126.231 E.00592
G1 X128.53 Y126.222 E.00424
; LINE_WIDTH: 0.580089
G1 X128.44 Y126.213 E.00394
; LINE_WIDTH: 0.538662
G1 X128.351 Y126.204 E.00364
; LINE_WIDTH: 0.497235
G1 X128.261 Y126.195 E.00333
; LINE_WIDTH: 0.455808
G1 X128.171 Y126.186 E.00303
; LINE_WIDTH: 0.414381
G1 X124.814 Y126.186 E.10162
G1 X124.814 Y125.814 E.01124
G1 X128.171 Y125.814 E.10162
; LINE_WIDTH: 0.455808
G1 X128.261 Y125.805 E.00303
; LINE_WIDTH: 0.497235
G1 X128.351 Y125.796 E.00333
; LINE_WIDTH: 0.538662
G1 X128.44 Y125.787 E.00364
; LINE_WIDTH: 0.580089
G1 X128.53 Y125.778 E.00394
; LINE_WIDTH: 0.621516
G1 X128.619 Y125.769 E.00424
G1 X128.653 Y125.713 E.00308
; LINE_WIDTH: 0.583086
G1 X128.687 Y125.657 E.00288
; LINE_WIDTH: 0.544656
G1 X128.879 Y125.171 E.02134
; LINE_WIDTH: 0.556535
G1 X128.885 Y124.885 E.01198
G2 X129.371 Y124.862 I.128 J-2.357 E.02038
; LINE_WIDTH: 0.509151
G1 X129.6 Y124.838 E.00874
; LINE_WIDTH: 0.461766
G1 X129.829 Y124.814 E.00785
; LINE_WIDTH: 0.41438
M73 P60 R3
G1 X131.186 Y124.814 E.04108
G1 X131.186 Y125 E.00562
; LINE_WIDTH: 0.414381
G1 X131.186 Y125.186 E.00562
G1 X129.829 Y125.186 E.04108
; LINE_WIDTH: 0.461766
G1 X129.66 Y125.232 E.00595
; LINE_WIDTH: 0.509151
G1 X129.492 Y125.278 E.00663
; LINE_WIDTH: 0.556535
G1 X129.324 Y125.324 E.0073
G1 X129.274 Y125.425 E.00471
; LINE_WIDTH: 0.518541
G1 X129.224 Y125.526 E.00436
; LINE_WIDTH: 0.527536
G1 X129.177 Y125.684 E.00652
; LINE_WIDTH: 0.574526
G1 X129.13 Y125.842 E.00715
; LINE_WIDTH: 0.621516
G2 X129.103 Y126.166 I.354 J.192 E.01577
; LINE_WIDTH: 0.580089
G1 X129.124 Y126.331 E.00731
; LINE_WIDTH: 0.538662
G1 X129.144 Y126.497 E.00675
; LINE_WIDTH: 0.497235
G1 X129.165 Y126.663 E.00618
; LINE_WIDTH: 0.455808
G1 X129.186 Y126.829 E.00562
; LINE_WIDTH: 0.414381
G1 X129.186 Y127.186 E.01081
G1 X128.814 Y127.186 E.01124
G1 X128.814 Y126.829 E.01081
; LINE_WIDTH: 0.455808
G1 X128.798 Y126.777 E.00181
G1 X128.4 Y126.829 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.499999
G1 F3000
G1 X128.309 Y126.646 E.00761
G1 X128.171 Y126.6 E.00538
G1 X124.4 Y126.6 E.14047
G1 X124.4 Y125.4 E.0447
G1 X128.171 Y125.4 E.14047
G1 X128.338 Y125.328 E.00675
G1 X128.4 Y125.171 E.00628
G1 X128.4 Y124.4 E.02873
G1 X131.6 Y124.4 E.11919
G1 X131.6 Y125 E.02235
G1 X131.6 Y125.6 E.02235
G1 X129.829 Y125.6 E.06598
G1 X129.667 Y125.667 E.00651
G1 X129.6 Y125.829 E.00651
G1 X129.6 Y127.6 E.06598
G1 X128.4 Y127.6 E.0447
M73 P61 R3
G1 X128.4 Y126.889 E.0265
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.309 Y126.646 E-.0986
G1 X128.171 Y126.6 E-.05493
G1 X126.575 Y126.6 E-.60648
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 2/136
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S255
M106 P2 S178
; open powerlost recovery
M1003 S1
M204 S10000
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z.6 I-.355 J1.164 P1  F30000
G1 X128.699 Y127.249 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X128.699 Y126.979 E.01324
G1 X128.617 Y126.862 E.00698
; LINE_WIDTH: 0.595786
G1 X128.535 Y126.746 E.00641
; LINE_WIDTH: 0.54719
G1 X128.452 Y126.63 E.00585
; LINE_WIDTH: 0.498595
G2 X128.283 Y126.461 I-.283 J.113 E.00915
; LINE_WIDTH: 0.54719
G1 X128.196 Y126.407 E.0042
; LINE_WIDTH: 0.595786
G1 X128.109 Y126.354 E.0046
; LINE_WIDTH: 0.644381
G1 X128.021 Y126.301 E.00501
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.109 Y125.646 E.00501
; LINE_WIDTH: 0.595786
G1 X128.196 Y125.593 E.0046
; LINE_WIDTH: 0.54719
G1 X128.283 Y125.539 E.0042
; LINE_WIDTH: 0.498595
G1 X128.37 Y125.486 E.00379
; LINE_WIDTH: 0.449999
G1 X128.519 Y125.321 E.00737
G1 X128.597 Y125.097 E.00788
G1 X128.602 Y124.602 E.01641
G3 X129.588 Y124.629 I.21 J10.376 E.03272
; LINE_WIDTH: 0.498595
G1 X129.685 Y124.647 E.00369
; LINE_WIDTH: 0.54719
G1 X129.783 Y124.664 E.00408
; LINE_WIDTH: 0.595786
G1 X129.881 Y124.682 E.00447
; LINE_WIDTH: 0.644381
G1 X129.979 Y124.699 E.00486
G1 X131.301 Y124.699 E.0648
G1 X131.301 Y125 E.01474
G1 X131.301 Y125.301 E.01474
G1 X129.979 Y125.301 E.0648
G1 X129.875 Y125.368 E.00604
; LINE_WIDTH: 0.595786
G1 X129.772 Y125.436 E.00556
; LINE_WIDTH: 0.54719
G1 X129.669 Y125.503 E.00507
; LINE_WIDTH: 0.498595
G1 X129.566 Y125.57 E.00458
; LINE_WIDTH: 0.449999
G1 X129.481 Y125.679 E.00456
G1 X129.398 Y126 E.011
; LINE_WIDTH: 0.498595
G1 X129.374 Y126.325 E.01211
; LINE_WIDTH: 0.54719
G1 X129.349 Y126.65 E.0134
; LINE_WIDTH: 0.595786
G1 X129.325 Y126.976 E.01469
; LINE_WIDTH: 0.644381
G1 X129.301 Y127.301 E.01598
G1 X128.707 Y127.301 E.02909
G1 X128.168 Y126.904 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X128.136 Y126.832 E.00242
G1 X128.021 Y126.79 E.00376
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.137 Y125.168 E.00377
G1 X128.168 Y125.105 E.00215
G1 X128.21 Y125.021 E.00289
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y125 E.02427
G1 X131.79 Y125.79 E.02427
G1 X129.979 Y125.79 E.05566
G1 X129.878 Y125.832 E.00335
G2 X129.832 Y125.876 I-.001 J.045 E.00218
G1 X129.79 Y125.979 E.0034
G1 X129.79 Y127.79 E.05566
G1 X128.21 Y127.79 E.04855
G1 X128.21 Y127 E.02427
G1 X128.192 Y126.959 E.00137
M204 S10000
G1 X128.384 Y126 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477178
G1 F1200
G3 X128.875 Y126.48 I-.78 J1.29 E.02451
G1 X129.008 Y125.91 E.02069
; LINE_WIDTH: 0.433393
G1 X129.077 Y125.735 E.00599
; LINE_WIDTH: 0.39381
G3 X129.319 Y125.278 I1.436 J.467 E.01486
G1 X129.618 Y125.049 E.01077
G2 X128.982 Y124.995 I-.872 J6.447 E.01825
G1 X128.961 Y125.194 E.00574
; LINE_WIDTH: 0.39108
G1 X128.66 Y125.757 E.01811
; LINE_WIDTH: 0.433393
G1 X128.429 Y125.96 E.00978
; CHANGE_LAYER
; Z_HEIGHT: 0.475
; LAYER_HEIGHT: 0.075
; WIPE_START
G1 F24000
G1 X128.66 Y125.757 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 3/136
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
G3 Z.8 I.727 J-.976 P1  F30000
G1 X125.123 Y123.123 Z.8
G1 Z.475
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275
G1 F1200
G1 X133.754 Y123.123 E.3491
G1 X133.754 Y126 E.11637
G1 X132.539 Y126 E.04917
G1 X132.539 Y126.223 E.00902
G1 X132.223 Y126.539 E.01804
G1 X130.539 Y126.539 E.06813
G1 X130.539 Y128.223 E.06813
G1 X130.223 Y128.539 E.01804
G1 X127.777 Y128.539 E.09894
G1 X127.461 Y128.223 E.01804
G1 X127.461 Y127.539 E.02769
G1 X125.123 Y127.539 E.09459
G1 X125.123 Y128.877 E.05414
G1 X133.754 Y128.877 E.3491
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.125
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 4/136
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
G3 Z.875 I.572 J-1.074 P1  F30000
G1 X128.699 Y127.249 Z.875
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X128.699 Y126.979 E.01324
G1 X128.617 Y126.862 E.00698
; LINE_WIDTH: 0.595786
G1 X128.535 Y126.746 E.00641
; LINE_WIDTH: 0.54719
G1 X128.452 Y126.63 E.00585
; LINE_WIDTH: 0.498595
G2 X128.283 Y126.461 I-.283 J.113 E.00915
; LINE_WIDTH: 0.54719
G1 X128.196 Y126.407 E.0042
; LINE_WIDTH: 0.595786
G1 X128.109 Y126.354 E.0046
; LINE_WIDTH: 0.644381
G1 X128.021 Y126.301 E.00501
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.109 Y125.646 E.00501
; LINE_WIDTH: 0.595786
G1 X128.196 Y125.593 E.0046
; LINE_WIDTH: 0.54719
G1 X128.283 Y125.539 E.0042
; LINE_WIDTH: 0.498595
G1 X128.37 Y125.486 E.00379
; LINE_WIDTH: 0.449999
G1 X128.519 Y125.321 E.00737
G1 X128.597 Y125.097 E.00788
G1 X128.602 Y124.602 E.01641
G3 X129.588 Y124.629 I.21 J10.376 E.03272
; LINE_WIDTH: 0.498595
G1 X129.685 Y124.647 E.00369
; LINE_WIDTH: 0.54719
G1 X129.783 Y124.664 E.00408
; LINE_WIDTH: 0.595786
G1 X129.881 Y124.682 E.00447
; LINE_WIDTH: 0.644381
G1 X129.979 Y124.699 E.00486
G1 X131.301 Y124.699 E.0648
G1 X131.301 Y125 E.01474
G1 X131.301 Y125.301 E.01474
G1 X129.979 Y125.301 E.0648
G1 X129.875 Y125.368 E.00604
; LINE_WIDTH: 0.595786
G1 X129.772 Y125.436 E.00556
; LINE_WIDTH: 0.54719
G1 X129.669 Y125.503 E.00507
; LINE_WIDTH: 0.498595
G1 X129.566 Y125.57 E.00458
; LINE_WIDTH: 0.449999
G1 X129.481 Y125.679 E.00456
G1 X129.398 Y126 E.011
; LINE_WIDTH: 0.498595
G1 X129.374 Y126.325 E.01211
; LINE_WIDTH: 0.54719
G1 X129.349 Y126.65 E.0134
; LINE_WIDTH: 0.595786
G1 X129.325 Y126.976 E.01469
; LINE_WIDTH: 0.644381
G1 X129.301 Y127.301 E.01598
G1 X128.707 Y127.301 E.02909
G1 X128.168 Y126.904 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X128.136 Y126.832 E.00242
G1 X128.021 Y126.79 E.00376
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.137 Y125.168 E.00377
G1 X128.168 Y125.105 E.00215
G1 X128.21 Y125.021 E.00289
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y125 E.02427
M73 P62 R3
G1 X131.79 Y125.79 E.02427
G1 X129.979 Y125.79 E.05566
G1 X129.878 Y125.832 E.00335
G2 X129.832 Y125.876 I-.001 J.045 E.00218
G1 X129.79 Y125.979 E.0034
G1 X129.79 Y127.79 E.05566
G1 X128.21 Y127.79 E.04855
G1 X128.21 Y127 E.02427
G1 X128.192 Y126.959 E.00137
M204 S10000
G1 X128.384 Y126 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477178
G1 F1200
G3 X128.875 Y126.48 I-.78 J1.29 E.02451
G1 X129.008 Y125.91 E.02069
; LINE_WIDTH: 0.433393
G1 X129.077 Y125.735 E.00599
; LINE_WIDTH: 0.39381
G3 X129.319 Y125.278 I1.436 J.467 E.01486
G1 X129.618 Y125.049 E.01077
G2 X128.982 Y124.995 I-.872 J6.447 E.01825
G1 X128.961 Y125.194 E.00574
; LINE_WIDTH: 0.39108
G1 X128.66 Y125.757 E.01811
; LINE_WIDTH: 0.433393
G1 X128.429 Y125.96 E.00978
; CHANGE_LAYER
; Z_HEIGHT: 0.75
; LAYER_HEIGHT: 0.15
; WIPE_START
G1 F24000
G1 X128.66 Y125.757 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 5/136
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
G3 Z1 I.727 J-.976 P1  F30000
G1 X125.123 Y123.123 Z1
G1 Z.75
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275
G1 F1200
G1 X133.754 Y123.123 E.3491
G1 X133.754 Y126 E.11637
G1 X132.539 Y126 E.04917
G1 X132.539 Y126.223 E.00902
G1 X132.223 Y126.539 E.01804
G1 X130.539 Y126.539 E.06813
G1 X130.539 Y128.223 E.06813
G1 X130.223 Y128.539 E.01804
G1 X127.777 Y128.539 E.09894
G1 X127.461 Y128.223 E.01804
G1 X127.461 Y127.539 E.02769
G1 X125.123 Y127.539 E.09459
G1 X125.123 Y128.877 E.05414
G1 X133.754 Y128.877 E.3491
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.05
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 6/136
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
G3 Z1.15 I.572 J-1.074 P1  F30000
G1 X128.699 Y127.249 Z1.15
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X128.699 Y126.979 E.01324
G1 X128.617 Y126.862 E.00698
; LINE_WIDTH: 0.595786
G1 X128.535 Y126.746 E.00641
; LINE_WIDTH: 0.54719
G1 X128.452 Y126.63 E.00585
; LINE_WIDTH: 0.498595
G2 X128.283 Y126.461 I-.283 J.113 E.00915
; LINE_WIDTH: 0.54719
G1 X128.196 Y126.407 E.0042
; LINE_WIDTH: 0.595786
G1 X128.109 Y126.354 E.0046
; LINE_WIDTH: 0.644381
G1 X128.021 Y126.301 E.00501
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.109 Y125.646 E.00501
; LINE_WIDTH: 0.595786
G1 X128.196 Y125.593 E.0046
; LINE_WIDTH: 0.54719
G1 X128.283 Y125.539 E.0042
; LINE_WIDTH: 0.498595
G1 X128.37 Y125.486 E.00379
; LINE_WIDTH: 0.449999
G1 X128.519 Y125.321 E.00737
G1 X128.597 Y125.097 E.00788
G1 X128.602 Y124.602 E.01641
G3 X129.588 Y124.629 I.21 J10.376 E.03272
; LINE_WIDTH: 0.498595
G1 X129.685 Y124.647 E.00369
; LINE_WIDTH: 0.54719
G1 X129.783 Y124.664 E.00408
; LINE_WIDTH: 0.595786
G1 X129.881 Y124.682 E.00447
; LINE_WIDTH: 0.644381
G1 X129.979 Y124.699 E.00486
G1 X131.301 Y124.699 E.0648
G1 X131.301 Y125 E.01474
G1 X131.301 Y125.301 E.01474
G1 X129.979 Y125.301 E.0648
G1 X129.875 Y125.368 E.00604
; LINE_WIDTH: 0.595786
G1 X129.772 Y125.436 E.00556
; LINE_WIDTH: 0.54719
G1 X129.669 Y125.503 E.00507
; LINE_WIDTH: 0.498595
G1 X129.566 Y125.57 E.00458
; LINE_WIDTH: 0.449999
G1 X129.481 Y125.679 E.00456
G1 X129.398 Y126 E.011
; LINE_WIDTH: 0.498595
G1 X129.374 Y126.325 E.01211
; LINE_WIDTH: 0.54719
G1 X129.349 Y126.65 E.0134
; LINE_WIDTH: 0.595786
G1 X129.325 Y126.976 E.01469
; LINE_WIDTH: 0.644381
G1 X129.301 Y127.301 E.01598
G1 X128.707 Y127.301 E.02909
G1 X128.168 Y126.904 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X128.136 Y126.832 E.00242
G1 X128.021 Y126.79 E.00376
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.137 Y125.168 E.00377
G1 X128.168 Y125.105 E.00215
G1 X128.21 Y125.021 E.00289
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y125 E.02427
G1 X131.79 Y125.79 E.02427
G1 X129.979 Y125.79 E.05566
G1 X129.878 Y125.832 E.00335
G2 X129.832 Y125.876 I-.001 J.045 E.00218
G1 X129.79 Y125.979 E.0034
G1 X129.79 Y127.79 E.05566
G1 X128.21 Y127.79 E.04855
G1 X128.21 Y127 E.02427
G1 X128.192 Y126.959 E.00137
M204 S10000
G1 X128.384 Y126 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477178
G1 F1200
G3 X128.875 Y126.48 I-.78 J1.29 E.02451
G1 X129.008 Y125.91 E.02069
; LINE_WIDTH: 0.433393
G1 X129.077 Y125.735 E.00599
; LINE_WIDTH: 0.39381
G3 X129.319 Y125.278 I1.436 J.467 E.01486
G1 X129.618 Y125.049 E.01077
G2 X128.982 Y124.995 I-.872 J6.447 E.01825
G1 X128.961 Y125.194 E.00574
; LINE_WIDTH: 0.39108
G1 X128.66 Y125.757 E.01811
; LINE_WIDTH: 0.433393
G1 X128.429 Y125.96 E.00978
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.66 Y125.757 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 7/136
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
G3 Z1.2 I-1.217 J.032 P1  F30000
G1 X128.699 Y127.249 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X128.699 Y126.979 E.01324
G1 X128.617 Y126.862 E.00698
; LINE_WIDTH: 0.595786
G1 X128.535 Y126.746 E.00641
; LINE_WIDTH: 0.54719
G1 X128.452 Y126.63 E.00585
; LINE_WIDTH: 0.498595
G2 X128.283 Y126.461 I-.283 J.113 E.00915
; LINE_WIDTH: 0.54719
G1 X128.196 Y126.407 E.0042
; LINE_WIDTH: 0.595786
G1 X128.109 Y126.354 E.0046
; LINE_WIDTH: 0.644381
G1 X128.021 Y126.301 E.00501
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.109 Y125.646 E.00501
; LINE_WIDTH: 0.595786
G1 X128.196 Y125.593 E.0046
; LINE_WIDTH: 0.54719
G1 X128.283 Y125.539 E.0042
; LINE_WIDTH: 0.498595
G1 X128.37 Y125.486 E.00379
; LINE_WIDTH: 0.449999
G1 X128.519 Y125.321 E.00737
G1 X128.597 Y125.097 E.00788
G1 X128.602 Y124.602 E.01641
G3 X129.588 Y124.629 I.21 J10.376 E.03272
; LINE_WIDTH: 0.498595
G1 X129.685 Y124.647 E.00369
; LINE_WIDTH: 0.54719
G1 X129.783 Y124.664 E.00408
; LINE_WIDTH: 0.595786
G1 X129.881 Y124.682 E.00447
; LINE_WIDTH: 0.644381
G1 X129.979 Y124.699 E.00486
G1 X131.301 Y124.699 E.0648
G1 X131.301 Y125 E.01474
G1 X131.301 Y125.301 E.01474
G1 X129.979 Y125.301 E.0648
G1 X129.875 Y125.368 E.00604
; LINE_WIDTH: 0.595786
M73 P63 R3
G1 X129.772 Y125.436 E.00556
; LINE_WIDTH: 0.54719
G1 X129.669 Y125.503 E.00507
; LINE_WIDTH: 0.498595
G1 X129.566 Y125.57 E.00458
; LINE_WIDTH: 0.449999
G1 X129.481 Y125.679 E.00456
G1 X129.398 Y126 E.011
; LINE_WIDTH: 0.498595
G1 X129.374 Y126.325 E.01211
; LINE_WIDTH: 0.54719
G1 X129.349 Y126.65 E.0134
; LINE_WIDTH: 0.595786
G1 X129.325 Y126.976 E.01469
; LINE_WIDTH: 0.644381
G1 X129.301 Y127.301 E.01598
G1 X128.707 Y127.301 E.02909
G1 X128.168 Y126.904 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X128.136 Y126.832 E.00242
G1 X128.021 Y126.79 E.00376
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.137 Y125.168 E.00377
G1 X128.168 Y125.105 E.00215
G1 X128.21 Y125.021 E.00289
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y125 E.02427
G1 X131.79 Y125.79 E.02427
G1 X129.979 Y125.79 E.05566
G1 X129.878 Y125.832 E.00335
G2 X129.832 Y125.876 I-.001 J.045 E.00218
G1 X129.79 Y125.979 E.0034
G1 X129.79 Y127.79 E.05566
G1 X128.21 Y127.79 E.04855
G1 X128.21 Y127 E.02427
G1 X128.192 Y126.959 E.00137
M204 S10000
G1 X128.384 Y126 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477178
G1 F1200
G3 X128.875 Y126.48 I-.78 J1.29 E.02451
G1 X129.008 Y125.91 E.02069
; LINE_WIDTH: 0.433393
G1 X129.077 Y125.735 E.00599
; LINE_WIDTH: 0.39381
G3 X129.319 Y125.278 I1.436 J.467 E.01486
G1 X129.618 Y125.049 E.01077
G2 X128.982 Y124.995 I-.872 J6.447 E.01825
G1 X128.961 Y125.194 E.00574
; LINE_WIDTH: 0.39108
G1 X128.66 Y125.757 E.01811
; LINE_WIDTH: 0.433393
G1 X128.429 Y125.96 E.00978
; CHANGE_LAYER
; Z_HEIGHT: 1.025
; LAYER_HEIGHT: 0.025
; WIPE_START
G1 F24000
G1 X128.66 Y125.757 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 8/136
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
G3 Z1.4 I.727 J-.976 P1  F30000
G1 X125.123 Y123.123 Z1.4
G1 Z1.025
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275
G1 F1200
G1 X133.754 Y123.123 E.3491
G1 X133.754 Y126 E.11637
G1 X132.539 Y126 E.04917
G1 X132.539 Y126.223 E.00902
G1 X132.223 Y126.539 E.01804
G1 X130.539 Y126.539 E.06813
G1 X130.539 Y128.223 E.06813
G1 X130.223 Y128.539 E.01804
G1 X127.777 Y128.539 E.09894
G1 X127.461 Y128.223 E.01804
G1 X127.461 Y127.539 E.02769
G1 X125.123 Y127.539 E.09459
G1 X125.123 Y128.877 E.05414
G1 X133.754 Y128.877 E.3491
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.175
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 9/136
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
G3 Z1.425 I.572 J-1.074 P1  F30000
G1 X128.699 Y127.249 Z1.425
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X128.699 Y126.979 E.01324
G1 X128.617 Y126.862 E.00698
; LINE_WIDTH: 0.595786
G1 X128.535 Y126.746 E.00641
; LINE_WIDTH: 0.54719
G1 X128.452 Y126.63 E.00585
; LINE_WIDTH: 0.498595
G2 X128.283 Y126.461 I-.283 J.113 E.00915
; LINE_WIDTH: 0.54719
G1 X128.196 Y126.407 E.0042
; LINE_WIDTH: 0.595786
G1 X128.109 Y126.354 E.0046
; LINE_WIDTH: 0.644381
G1 X128.021 Y126.301 E.00501
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.109 Y125.646 E.00501
; LINE_WIDTH: 0.595786
G1 X128.196 Y125.593 E.0046
; LINE_WIDTH: 0.54719
G1 X128.283 Y125.539 E.0042
; LINE_WIDTH: 0.498595
G1 X128.37 Y125.486 E.00379
; LINE_WIDTH: 0.449999
G1 X128.519 Y125.321 E.00737
G1 X128.597 Y125.097 E.00788
G1 X128.602 Y124.602 E.01641
G3 X129.588 Y124.629 I.21 J10.376 E.03272
; LINE_WIDTH: 0.498595
G1 X129.685 Y124.647 E.00369
; LINE_WIDTH: 0.54719
G1 X129.783 Y124.664 E.00408
; LINE_WIDTH: 0.595786
G1 X129.881 Y124.682 E.00447
; LINE_WIDTH: 0.644381
G1 X129.979 Y124.699 E.00486
G1 X131.301 Y124.699 E.0648
G1 X131.301 Y125 E.01474
G1 X131.301 Y125.301 E.01474
G1 X129.979 Y125.301 E.0648
G1 X129.875 Y125.368 E.00604
; LINE_WIDTH: 0.595786
G1 X129.772 Y125.436 E.00556
; LINE_WIDTH: 0.54719
G1 X129.669 Y125.503 E.00507
; LINE_WIDTH: 0.498595
G1 X129.566 Y125.57 E.00458
; LINE_WIDTH: 0.449999
G1 X129.481 Y125.679 E.00456
G1 X129.398 Y126 E.011
; LINE_WIDTH: 0.498595
G1 X129.374 Y126.325 E.01211
; LINE_WIDTH: 0.54719
G1 X129.349 Y126.65 E.0134
; LINE_WIDTH: 0.595786
G1 X129.325 Y126.976 E.01469
; LINE_WIDTH: 0.644381
G1 X129.301 Y127.301 E.01598
G1 X128.707 Y127.301 E.02909
G1 X128.168 Y126.904 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X128.136 Y126.832 E.00242
G1 X128.021 Y126.79 E.00376
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.137 Y125.168 E.00377
G1 X128.168 Y125.105 E.00215
G1 X128.21 Y125.021 E.00289
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y125 E.02427
G1 X131.79 Y125.79 E.02427
G1 X129.979 Y125.79 E.05566
G1 X129.878 Y125.832 E.00335
G2 X129.832 Y125.876 I-.001 J.045 E.00218
G1 X129.79 Y125.979 E.0034
G1 X129.79 Y127.79 E.05566
G1 X128.21 Y127.79 E.04855
G1 X128.21 Y127 E.02427
G1 X128.192 Y126.959 E.00137
M204 S10000
G1 X128.384 Y126 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477178
G1 F1200
G3 X128.875 Y126.48 I-.78 J1.29 E.02451
G1 X129.008 Y125.91 E.02069
; LINE_WIDTH: 0.433393
G1 X129.077 Y125.735 E.00599
; LINE_WIDTH: 0.39381
G3 X129.319 Y125.278 I1.436 J.467 E.01486
G1 X129.618 Y125.049 E.01077
G2 X128.982 Y124.995 I-.872 J6.447 E.01825
G1 X128.961 Y125.194 E.00574
; LINE_WIDTH: 0.39108
G1 X128.66 Y125.757 E.01811
; LINE_WIDTH: 0.433393
G1 X128.429 Y125.96 E.00978
; CHANGE_LAYER
; Z_HEIGHT: 1.3
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F24000
G1 X128.66 Y125.757 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 10/136
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
G3 Z1.6 I.727 J-.976 P1  F30000
G1 X125.123 Y123.123 Z1.6
G1 Z1.3
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275
G1 F1200
G1 X133.754 Y123.123 E.3491
G1 X133.754 Y126 E.11637
G1 X132.539 Y126 E.04917
G1 X132.539 Y126.223 E.00902
G1 X132.223 Y126.539 E.01804
G1 X130.539 Y126.539 E.06813
G1 X130.539 Y128.223 E.06813
G1 X130.223 Y128.539 E.01804
G1 X127.777 Y128.539 E.09894
G1 X127.461 Y128.223 E.01804
G1 X127.461 Y127.539 E.02769
G1 X125.123 Y127.539 E.09459
G1 X125.123 Y128.877 E.05414
G1 X133.754 Y128.877 E.3491
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
M73 P64 R3
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 11/136
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
G3 Z1.7 I.572 J-1.074 P1  F30000
G1 X128.699 Y127.249 Z1.7
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X128.699 Y126.979 E.01324
G1 X128.617 Y126.862 E.00698
; LINE_WIDTH: 0.595786
G1 X128.535 Y126.746 E.00641
; LINE_WIDTH: 0.54719
G1 X128.452 Y126.63 E.00585
; LINE_WIDTH: 0.498595
G2 X128.283 Y126.461 I-.283 J.113 E.00915
; LINE_WIDTH: 0.54719
G1 X128.196 Y126.407 E.0042
; LINE_WIDTH: 0.595786
G1 X128.109 Y126.354 E.0046
; LINE_WIDTH: 0.644381
G1 X128.021 Y126.301 E.00501
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.109 Y125.646 E.00501
; LINE_WIDTH: 0.595786
G1 X128.196 Y125.593 E.0046
; LINE_WIDTH: 0.54719
G1 X128.283 Y125.539 E.0042
; LINE_WIDTH: 0.498595
G1 X128.37 Y125.486 E.00379
; LINE_WIDTH: 0.449999
G1 X128.519 Y125.321 E.00737
G1 X128.597 Y125.097 E.00788
G1 X128.602 Y124.602 E.01641
G3 X129.588 Y124.629 I.21 J10.376 E.03272
; LINE_WIDTH: 0.498595
G1 X129.685 Y124.647 E.00369
; LINE_WIDTH: 0.54719
G1 X129.783 Y124.664 E.00408
; LINE_WIDTH: 0.595786
G1 X129.881 Y124.682 E.00447
; LINE_WIDTH: 0.644381
G1 X129.979 Y124.699 E.00486
G1 X131.301 Y124.699 E.0648
G1 X131.301 Y125 E.01474
G1 X131.301 Y125.301 E.01474
G1 X129.979 Y125.301 E.0648
G1 X129.875 Y125.368 E.00604
; LINE_WIDTH: 0.595786
G1 X129.772 Y125.436 E.00556
; LINE_WIDTH: 0.54719
G1 X129.669 Y125.503 E.00507
; LINE_WIDTH: 0.498595
G1 X129.566 Y125.57 E.00458
; LINE_WIDTH: 0.449999
G1 X129.481 Y125.679 E.00456
G1 X129.398 Y126 E.011
; LINE_WIDTH: 0.498595
G1 X129.374 Y126.325 E.01211
; LINE_WIDTH: 0.54719
G1 X129.349 Y126.65 E.0134
; LINE_WIDTH: 0.595786
G1 X129.325 Y126.976 E.01469
; LINE_WIDTH: 0.644381
G1 X129.301 Y127.301 E.01598
G1 X128.707 Y127.301 E.02909
G1 X128.168 Y126.904 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X128.136 Y126.832 E.00242
G1 X128.021 Y126.79 E.00376
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.137 Y125.168 E.00377
G1 X128.168 Y125.105 E.00215
G1 X128.21 Y125.021 E.00289
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y125 E.02427
G1 X131.79 Y125.79 E.02427
G1 X129.979 Y125.79 E.05566
G1 X129.878 Y125.832 E.00335
G2 X129.832 Y125.876 I-.001 J.045 E.00218
G1 X129.79 Y125.979 E.0034
G1 X129.79 Y127.79 E.05566
G1 X128.21 Y127.79 E.04855
G1 X128.21 Y127 E.02427
G1 X128.192 Y126.959 E.00137
M204 S10000
G1 X128.384 Y126 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477178
G1 F1200
G3 X128.875 Y126.48 I-.78 J1.29 E.02451
G1 X129.008 Y125.91 E.02069
; LINE_WIDTH: 0.433393
G1 X129.077 Y125.735 E.00599
; LINE_WIDTH: 0.39381
G3 X129.319 Y125.278 I1.436 J.467 E.01486
G1 X129.618 Y125.049 E.01077
G2 X128.982 Y124.995 I-.872 J6.447 E.01825
G1 X128.961 Y125.194 E.00574
; LINE_WIDTH: 0.39108
G1 X128.66 Y125.757 E.01811
; LINE_WIDTH: 0.433393
G1 X128.429 Y125.96 E.00978
; CHANGE_LAYER
; Z_HEIGHT: 1.575
; LAYER_HEIGHT: 0.175
; WIPE_START
G1 F24000
G1 X128.66 Y125.757 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 12/136
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
G3 Z1.8 I.727 J-.976 P1  F30000
G1 X125.123 Y123.123 Z1.8
G1 Z1.575
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275
G1 F1200
G1 X133.754 Y123.123 E.3491
G1 X133.754 Y126 E.11637
G1 X132.539 Y126 E.04917
G1 X132.539 Y126.223 E.00902
G1 X132.223 Y126.539 E.01804
G1 X130.539 Y126.539 E.06813
G1 X130.539 Y128.223 E.06813
G1 X130.223 Y128.539 E.01804
G1 X127.777 Y128.539 E.09894
G1 X127.461 Y128.223 E.01804
G1 X127.461 Y127.539 E.02769
G1 X125.123 Y127.539 E.09459
G1 X125.123 Y128.877 E.05414
G1 X133.754 Y128.877 E.3491
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.025
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 13/136
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
G3 Z1.975 I.572 J-1.074 P1  F30000
G1 X128.699 Y127.249 Z1.975
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X128.699 Y126.979 E.01324
G1 X128.617 Y126.862 E.00698
; LINE_WIDTH: 0.595786
G1 X128.535 Y126.746 E.00641
; LINE_WIDTH: 0.54719
G1 X128.452 Y126.63 E.00585
; LINE_WIDTH: 0.498595
G2 X128.283 Y126.461 I-.283 J.113 E.00915
; LINE_WIDTH: 0.54719
G1 X128.196 Y126.407 E.0042
; LINE_WIDTH: 0.595786
G1 X128.109 Y126.354 E.0046
; LINE_WIDTH: 0.644381
G1 X128.021 Y126.301 E.00501
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.109 Y125.646 E.00501
; LINE_WIDTH: 0.595786
G1 X128.196 Y125.593 E.0046
; LINE_WIDTH: 0.54719
G1 X128.283 Y125.539 E.0042
; LINE_WIDTH: 0.498595
G1 X128.37 Y125.486 E.00379
; LINE_WIDTH: 0.449999
G1 X128.519 Y125.321 E.00737
G1 X128.597 Y125.097 E.00788
G1 X128.602 Y124.602 E.01641
G3 X129.588 Y124.629 I.21 J10.376 E.03272
; LINE_WIDTH: 0.498595
G1 X129.685 Y124.647 E.00369
; LINE_WIDTH: 0.54719
G1 X129.783 Y124.664 E.00408
; LINE_WIDTH: 0.595786
G1 X129.881 Y124.682 E.00447
; LINE_WIDTH: 0.644381
G1 X129.979 Y124.699 E.00486
G1 X131.301 Y124.699 E.0648
G1 X131.301 Y125 E.01474
G1 X131.301 Y125.301 E.01474
G1 X129.979 Y125.301 E.0648
G1 X129.875 Y125.368 E.00604
; LINE_WIDTH: 0.595786
G1 X129.772 Y125.436 E.00556
; LINE_WIDTH: 0.54719
G1 X129.669 Y125.503 E.00507
; LINE_WIDTH: 0.498595
G1 X129.566 Y125.57 E.00458
; LINE_WIDTH: 0.449999
M73 P65 R3
G1 X129.481 Y125.679 E.00456
G1 X129.398 Y126 E.011
; LINE_WIDTH: 0.498595
G1 X129.374 Y126.325 E.01211
; LINE_WIDTH: 0.54719
G1 X129.349 Y126.65 E.0134
; LINE_WIDTH: 0.595786
G1 X129.325 Y126.976 E.01469
; LINE_WIDTH: 0.644381
G1 X129.301 Y127.301 E.01598
G1 X128.707 Y127.301 E.02909
G1 X128.168 Y126.904 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X128.136 Y126.832 E.00242
G1 X128.021 Y126.79 E.00376
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.137 Y125.168 E.00377
G1 X128.168 Y125.105 E.00215
G1 X128.21 Y125.021 E.00289
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y125 E.02427
G1 X131.79 Y125.79 E.02427
G1 X129.979 Y125.79 E.05566
G1 X129.878 Y125.832 E.00335
G2 X129.832 Y125.876 I-.001 J.045 E.00218
G1 X129.79 Y125.979 E.0034
G1 X129.79 Y127.79 E.05566
G1 X128.21 Y127.79 E.04855
G1 X128.21 Y127 E.02427
G1 X128.192 Y126.959 E.00137
M204 S10000
G1 X128.384 Y126 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477178
G1 F1200
G3 X128.875 Y126.48 I-.78 J1.29 E.02451
G1 X129.008 Y125.91 E.02069
; LINE_WIDTH: 0.433393
G1 X129.077 Y125.735 E.00599
; LINE_WIDTH: 0.39381
G3 X129.319 Y125.278 I1.436 J.467 E.01486
G1 X129.618 Y125.049 E.01077
G2 X128.982 Y124.995 I-.872 J6.447 E.01825
G1 X128.961 Y125.194 E.00574
; LINE_WIDTH: 0.39108
G1 X128.66 Y125.757 E.01811
; LINE_WIDTH: 0.433393
G1 X128.429 Y125.96 E.00978
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.66 Y125.757 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 14/136
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
G3 Z2 I-1.217 J.032 P1  F30000
G1 X128.699 Y127.249 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X128.699 Y126.979 E.01324
G1 X128.617 Y126.862 E.00698
; LINE_WIDTH: 0.595786
G1 X128.535 Y126.746 E.00641
; LINE_WIDTH: 0.54719
G1 X128.452 Y126.63 E.00585
; LINE_WIDTH: 0.498595
G2 X128.283 Y126.461 I-.283 J.113 E.00915
; LINE_WIDTH: 0.54719
G1 X128.196 Y126.407 E.0042
; LINE_WIDTH: 0.595786
G1 X128.109 Y126.354 E.0046
; LINE_WIDTH: 0.644381
G1 X128.021 Y126.301 E.00501
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.109 Y125.646 E.00501
; LINE_WIDTH: 0.595786
G1 X128.196 Y125.593 E.0046
; LINE_WIDTH: 0.54719
G1 X128.283 Y125.539 E.0042
; LINE_WIDTH: 0.498595
G1 X128.37 Y125.486 E.00379
; LINE_WIDTH: 0.449999
G1 X128.519 Y125.321 E.00737
G1 X128.597 Y125.097 E.00788
G1 X128.602 Y124.602 E.01641
G3 X129.588 Y124.629 I.21 J10.376 E.03272
; LINE_WIDTH: 0.498595
G1 X129.685 Y124.647 E.00369
; LINE_WIDTH: 0.54719
G1 X129.783 Y124.664 E.00408
; LINE_WIDTH: 0.595786
G1 X129.881 Y124.682 E.00447
; LINE_WIDTH: 0.644381
G1 X129.979 Y124.699 E.00486
G1 X131.301 Y124.699 E.0648
G1 X131.301 Y125 E.01474
G1 X131.301 Y125.301 E.01474
G1 X129.979 Y125.301 E.0648
G1 X129.875 Y125.368 E.00604
; LINE_WIDTH: 0.595786
G1 X129.772 Y125.436 E.00556
; LINE_WIDTH: 0.54719
G1 X129.669 Y125.503 E.00507
; LINE_WIDTH: 0.498595
G1 X129.566 Y125.57 E.00458
; LINE_WIDTH: 0.449999
G1 X129.481 Y125.679 E.00456
G1 X129.398 Y126 E.011
; LINE_WIDTH: 0.498595
G1 X129.374 Y126.325 E.01211
; LINE_WIDTH: 0.54719
G1 X129.349 Y126.65 E.0134
; LINE_WIDTH: 0.595786
G1 X129.325 Y126.976 E.01469
; LINE_WIDTH: 0.644381
G1 X129.301 Y127.301 E.01598
G1 X128.707 Y127.301 E.02909
G1 X128.168 Y126.904 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X128.136 Y126.832 E.00242
G1 X128.021 Y126.79 E.00376
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.137 Y125.168 E.00377
G1 X128.168 Y125.105 E.00215
G1 X128.21 Y125.021 E.00289
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y125 E.02427
G1 X131.79 Y125.79 E.02427
G1 X129.979 Y125.79 E.05566
G1 X129.878 Y125.832 E.00335
G2 X129.832 Y125.876 I-.001 J.045 E.00218
G1 X129.79 Y125.979 E.0034
G1 X129.79 Y127.79 E.05566
G1 X128.21 Y127.79 E.04855
G1 X128.21 Y127 E.02427
G1 X128.192 Y126.959 E.00137
M204 S10000
G1 X128.384 Y126 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477178
G1 F1200
G3 X128.875 Y126.48 I-.78 J1.29 E.02451
G1 X129.008 Y125.91 E.02069
; LINE_WIDTH: 0.433393
G1 X129.077 Y125.735 E.00599
; LINE_WIDTH: 0.39381
G3 X129.319 Y125.278 I1.436 J.467 E.01486
G1 X129.618 Y125.049 E.01077
G2 X128.982 Y124.995 I-.872 J6.447 E.01825
G1 X128.961 Y125.194 E.00574
; LINE_WIDTH: 0.39108
G1 X128.66 Y125.757 E.01811
; LINE_WIDTH: 0.433393
G1 X128.429 Y125.96 E.00978
; CHANGE_LAYER
; Z_HEIGHT: 1.85
; LAYER_HEIGHT: 0.0500001
; WIPE_START
G1 F24000
G1 X128.66 Y125.757 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 15/136
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
G3 Z2.2 I.727 J-.976 P1  F30000
G1 X125.123 Y123.123 Z2.2
G1 Z1.85
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275
G1 F1200
G1 X133.754 Y123.123 E.3491
G1 X133.754 Y126 E.11637
G1 X132.539 Y126 E.04917
G1 X132.539 Y126.223 E.00902
G1 X132.223 Y126.539 E.01804
G1 X130.539 Y126.539 E.06813
G1 X130.539 Y128.223 E.06813
G1 X130.223 Y128.539 E.01804
G1 X127.777 Y128.539 E.09894
G1 X127.461 Y128.223 E.01804
G1 X127.461 Y127.539 E.02769
G1 X125.123 Y127.539 E.09459
G1 X125.123 Y128.877 E.05414
G1 X133.754 Y128.877 E.3491
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.15
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 16/136
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
G3 Z2.25 I.572 J-1.074 P1  F30000
G1 X128.699 Y127.249 Z2.25
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X128.699 Y126.979 E.01324
G1 X128.617 Y126.862 E.00698
; LINE_WIDTH: 0.595786
G1 X128.535 Y126.746 E.00641
; LINE_WIDTH: 0.54719
G1 X128.452 Y126.63 E.00585
; LINE_WIDTH: 0.498595
G2 X128.283 Y126.461 I-.283 J.113 E.00915
; LINE_WIDTH: 0.54719
G1 X128.196 Y126.407 E.0042
; LINE_WIDTH: 0.595786
G1 X128.109 Y126.354 E.0046
; LINE_WIDTH: 0.644381
G1 X128.021 Y126.301 E.00501
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.109 Y125.646 E.00501
; LINE_WIDTH: 0.595786
G1 X128.196 Y125.593 E.0046
; LINE_WIDTH: 0.54719
G1 X128.283 Y125.539 E.0042
; LINE_WIDTH: 0.498595
G1 X128.37 Y125.486 E.00379
; LINE_WIDTH: 0.449999
G1 X128.519 Y125.321 E.00737
G1 X128.597 Y125.097 E.00788
G1 X128.602 Y124.602 E.01641
G3 X129.588 Y124.629 I.21 J10.376 E.03272
; LINE_WIDTH: 0.498595
G1 X129.685 Y124.647 E.00369
; LINE_WIDTH: 0.54719
G1 X129.783 Y124.664 E.00408
; LINE_WIDTH: 0.595786
G1 X129.881 Y124.682 E.00447
; LINE_WIDTH: 0.644381
G1 X129.979 Y124.699 E.00486
G1 X131.301 Y124.699 E.0648
G1 X131.301 Y125 E.01474
G1 X131.301 Y125.301 E.01474
G1 X129.979 Y125.301 E.0648
G1 X129.875 Y125.368 E.00604
; LINE_WIDTH: 0.595786
G1 X129.772 Y125.436 E.00556
; LINE_WIDTH: 0.54719
M73 P66 R3
G1 X129.669 Y125.503 E.00507
; LINE_WIDTH: 0.498595
G1 X129.566 Y125.57 E.00458
; LINE_WIDTH: 0.449999
G1 X129.481 Y125.679 E.00456
G1 X129.398 Y126 E.011
; LINE_WIDTH: 0.498595
G1 X129.374 Y126.325 E.01211
; LINE_WIDTH: 0.54719
G1 X129.349 Y126.65 E.0134
; LINE_WIDTH: 0.595786
G1 X129.325 Y126.976 E.01469
; LINE_WIDTH: 0.644381
G1 X129.301 Y127.301 E.01598
G1 X128.707 Y127.301 E.02909
G1 X128.168 Y126.904 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X128.136 Y126.832 E.00242
G1 X128.021 Y126.79 E.00376
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.137 Y125.168 E.00377
G1 X128.168 Y125.105 E.00215
G1 X128.21 Y125.021 E.00289
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y125 E.02427
G1 X131.79 Y125.79 E.02427
G1 X129.979 Y125.79 E.05566
G1 X129.878 Y125.832 E.00335
G2 X129.832 Y125.876 I-.001 J.045 E.00218
G1 X129.79 Y125.979 E.0034
G1 X129.79 Y127.79 E.05566
G1 X128.21 Y127.79 E.04855
G1 X128.21 Y127 E.02427
G1 X128.192 Y126.959 E.00137
M204 S10000
; WIPE_START
G1 F24000
G1 X128.136 Y126.832 E-.05269
G1 X128.021 Y126.79 E-.04652
G1 X126.283 Y126.79 E-.66079
; WIPE_END
G1 E-.04 F1800
G1 X129.131 Y126.202 Z2.4 F30000
G1 Z2
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1200
G1 X128.725 Y126.609 E.01767
G1 X128.479 Y126.321
G1 X129.837 Y124.963 E.05899
G1 X129.42 Y124.847
G1 X128.17 Y126.097 E.05432
M204 S10000
; WIPE_START
G1 F24000
G1 X129.42 Y124.847 E-.67182
G1 X129.643 Y124.909 E-.08818
; WIPE_END
G1 E-.04 F1800
G1 X128.988 Y124.806 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.106117
G1 F1200
G3 X128.804 Y125.173 I-3.248 J-1.403 E.00212
; CHANGE_LAYER
; Z_HEIGHT: 2.125
; LAYER_HEIGHT: 0.125
; WIPE_START
G1 F24000
G1 X128.988 Y124.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 17/136
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
G3 Z2.4 I.486 J-1.116 P1  F30000
G1 X125.123 Y123.123 Z2.4
G1 Z2.125
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275
G1 F1200
G1 X133.754 Y123.123 E.3491
G1 X133.754 Y126 E.11637
G1 X132.539 Y126 E.04917
G1 X132.539 Y126.223 E.00902
G1 X132.223 Y126.539 E.01804
G1 X130.539 Y126.539 E.06813
G1 X130.539 Y128.223 E.06813
G1 X130.223 Y128.539 E.01804
G1 X127.777 Y128.539 E.09894
G1 X127.461 Y128.223 E.01804
G1 X127.461 Y127.539 E.02769
G1 X125.123 Y127.539 E.09459
G1 X125.123 Y128.877 E.05414
G1 X133.754 Y128.877 E.3491
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.075
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 18/136
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
G3 Z2.525 I.451 J-1.13 P1  F30000
G1 X125.301 Y126.301 Z2.525
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 19/136
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
G3 Z2.6 I.617 J1.049 P1  F30000
G1 X126.934 Y124.769 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.53 Y124.769 E.01242
G1 X126.53 Y127.231 E.07568
G1 X127.123 Y127.231 E.01821
G1 X127.123 Y124.769 E.07568
G1 X127.698 Y124.769 E.01768
; WIPE_START
G1 F24000
G1 X127.123 Y124.769 E-.21866
G1 X127.123 Y126.193 E-.54134
; WIPE_END
G1 E-.04 F1800
G1 X127.769 Y127.784 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
G1 F1200
G2 X128 Y128.231 I.259 J.15 E.01841
G1 X128 Y123.769 E.13713
G1 X128.877 Y123.769 E.02695
G1 X128.877 Y128.231 E.13713
G1 X129.754 Y128.231 E.02695
G1 X129.754 Y123.769 E.13713
G1 X130.631 Y123.769 E.02695
G1 X130.631 Y126.231 E.07568
M73 P67 R3
G1 X131.508 Y126.231 E.02695
G1 X131.508 Y123.769 E.07568
G1 X132.096 Y123.769 E.01805
G1 X132.231 Y123.904 E.00589
G1 X132.231 Y126.096 E.06735
G1 X132.096 Y126.231 E.00589
G1 X131.697 Y126.231 E.01226
G1 X133.754 Y128.877 F30000
; FEATURE: Support
; LAYER_HEIGHT: 0.275
G1 F1200
G1 X125.123 Y128.877 E.3491
G1 X125.123 Y127.539 E.05414
G1 X126.223 Y127.539 E.0445
G1 X126.373 Y127.389 E.00858
G1 X127.611 Y127.389 E.05009
G1 X127.611 Y128.161 E.03124
G1 X127.839 Y128.389 E.01302
G1 X130.161 Y128.389 E.09391
G1 X130.389 Y128.161 E.01302
G1 X130.389 Y126.389 E.07169
G1 X132.161 Y126.389 E.07169
G2 X132.389 Y126 I-.08 J-.308 E.02023
G1 X133.754 Y126 E.05523
G1 X133.754 Y123.123 E.11637
G1 X125.123 Y123.123 E.3491
; WIPE_START
G1 F24000
G1 X127.123 Y123.123 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.301 Y126.301 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 20/136
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
G3 Z2.8 I.078 J1.214 P1  F30000
G1 X125.301 Y126.301 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2.68
; LAYER_HEIGHT: 0.0800002
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 21/136
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
G3 Z3 I.617 J1.049 P1  F30000
G1 X126.934 Y124.769 Z3
G1 Z2.68
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X126.53 Y124.769 E.0166
G1 X126.53 Y127.231 E.10113
G1 X127.123 Y127.231 E.02434
G1 X127.123 Y124.769 E.10113
G1 X127.698 Y124.769 E.02363
G1 X125.123 Y123.123 F30000
; FEATURE: Support
G1 F1200
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X132.609 Y126 E.04704
G1 X132.609 Y126.252 E.01035
G1 X132.252 Y126.609 E.0207
G1 X130.609 Y126.609 E.06748
G1 X130.609 Y128.252 E.06748
G1 X130.285 Y128.575 E.01878
; WIPE_START
G1 F24000
G1 X130.609 Y128.252 E-.17377
G1 X130.609 Y126.709 E-.58623
; WIPE_END
G1 E-.04 F1800
G1 X131.697 Y126.231 Z3.08 F30000
G1 Z2.68
G1 E.8 F1800
; FEATURE: Support interface
G1 F1200
G1 X132.096 Y126.231 E.01638
G1 X132.231 Y126.096 E.00787
G1 X132.231 Y123.904 E.08999
G1 X132.096 Y123.769 E.00787
G1 X131.508 Y123.769 E.02413
G1 X131.508 Y126.231 E.10113
G1 X130.631 Y126.231 E.03601
G1 X130.631 Y123.769 E.10113
G1 X129.754 Y123.769 E.03601
G1 X129.754 Y128.231 E.18325
G1 X128.877 Y128.231 E.03601
G1 X128.877 Y123.769 E.18325
G1 X128 Y123.769 E.03601
G1 X128 Y128.231 E.18325
G3 X127.769 Y127.784 I.028 J-.298 E.0246
G1 X127.715 Y128.575 F30000
; FEATURE: Support
G1 F1200
G1 X127.391 Y128.252 E.01878
G1 X127.391 Y127.609 E.02642
G1 X125.748 Y127.609 E.06748
G1 X125.678 Y127.539 E.00407
G1 X125.123 Y127.539 E.02279
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
G1 X133.754 Y126.189 E.11039
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F24000
G1 X133.754 Y128.189 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 22/136
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
G3 Z3.08 I.265 J-1.188 P1  F30000
M73 P68 R3
G1 X125.301 Y126.301 Z3.08
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 23/136
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
G3 Z3.2 I1.172 J.329 P1  F30000
G1 X125.123 Y123.123 Z3.2
G1 Z2.96
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X126.539 Y126 E.29627
G1 X126.539 Y127.223 E.05022
G1 X126.223 Y127.539 E.01832
G1 X125.123 Y127.539 E.04517
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 24/136
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
G3 Z3.36 I.451 J-1.13 P1  F30000
G1 X125.301 Y126.301 Z3.36
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 25/136
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
G3 Z3.4 I.078 J1.214 P1  F30000
G1 X125.301 Y126.301 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.24
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 26/136
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
G3 Z3.6 I1.172 J.329 P1  F30000
G1 X125.123 Y123.123 Z3.6
G1 Z3.24
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X126.539 Y126 E.29627
G1 X126.539 Y127.223 E.05022
G1 X126.223 Y127.539 E.01832
G1 X125.123 Y127.539 E.04517
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
M73 P69 R3
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 27/136
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
G3 Z3.64 I.451 J-1.13 P1  F30000
G1 X125.301 Y126.301 Z3.64
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.52
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 28/136
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
G3 Z3.8 I1.172 J.329 P1  F30000
G1 X125.123 Y123.123 Z3.8
G1 Z3.52
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X126.539 Y126 E.29627
G1 X126.539 Y127.223 E.05022
G1 X126.223 Y127.539 E.01832
G1 X125.123 Y127.539 E.04517
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 29/136
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
G3 Z3.92 I.451 J-1.13 P1  F30000
G1 X125.301 Y126.301 Z3.92
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 30/136
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
G3 Z4 I1.172 J.329 P1  F30000
G1 X125.123 Y123.123 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X126.539 Y126 E.29627
G1 X126.539 Y127.223 E.05022
G1 X126.223 Y127.539 E.01832
G1 X125.123 Y127.539 E.04517
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.301 Y126.301 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 31/136
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
G3 Z4.2 I.078 J1.214 P1  F30000
G1 X125.301 Y126.301 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126.241 E.02654
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126.73 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.08
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F24000
M73 P70 R3
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 32/136
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
G3 Z4.4 I1.172 J.329 P1  F30000
G1 X125.123 Y123.123 Z4.4
G1 Z4.08
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X126.539 Y126 E.29627
G1 X126.539 Y127.223 E.05022
G1 X126.223 Y127.539 E.01832
G1 X125.123 Y127.539 E.04517
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 33/136
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
G3 Z4.48 I.451 J-1.13 P1  F30000
G1 X125.301 Y126.301 Z4.48
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 34/136
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
G3 Z4.6 I1.172 J.329 P1  F30000
G1 X125.123 Y123.123 Z4.6
G1 Z4.36
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X126.539 Y126 E.29627
G1 X126.539 Y127.223 E.05022
G1 X126.223 Y127.539 E.01832
G1 X125.123 Y127.539 E.04517
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 35/136
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
G3 Z4.76 I.451 J-1.13 P1  F30000
G1 X125.301 Y126.301 Z4.76
G1 Z4.4
M73 P70 R2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 36/136
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
G3 Z4.8 I.078 J1.214 P1  F30000
G1 X125.301 Y126.301 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.64
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
M73 P71 R2
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 37/136
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
G3 Z5 I1.172 J.329 P1  F30000
G1 X125.123 Y123.123 Z5
G1 Z4.64
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X126.539 Y126 E.29627
G1 X126.539 Y127.223 E.05022
G1 X126.223 Y127.539 E.01832
G1 X125.123 Y127.539 E.04517
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 38/136
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
G3 Z5.04 I.451 J-1.13 P1  F30000
G1 X125.301 Y126.301 Z5.04
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.92
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 39/136
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
G3 Z5.2 I1.172 J.329 P1  F30000
G1 X125.123 Y123.123 Z5.2
G1 Z4.92
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X126.539 Y126 E.29627
G1 X126.539 Y127.223 E.05022
G1 X126.223 Y127.539 E.01832
G1 X125.123 Y127.539 E.04517
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 40/136
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
G3 Z5.32 I.451 J-1.13 P1  F30000
G1 X125.301 Y126.301 Z5.32
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 41/136
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
G3 Z5.4 I1.172 J.329 P1  F30000
G1 X125.123 Y123.123 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X126.539 Y126 E.29627
G1 X126.539 Y127.223 E.05022
G1 X126.223 Y127.539 E.01832
G1 X125.123 Y127.539 E.04517
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.301 Y126.301 Z5.6 F30000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
M73 P72 R2
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 42/136
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
G3 Z5.6 I.078 J1.214 P1  F30000
G1 X125.301 Y126.301 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126.241 E.02654
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126.73 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.48
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 43/136
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
G3 Z5.8 I1.172 J.329 P1  F30000
G1 X125.123 Y123.123 Z5.8
G1 Z5.48
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X126.539 Y126 E.29627
G1 X126.539 Y127.223 E.05022
G1 X126.223 Y127.539 E.01832
G1 X125.123 Y127.539 E.04517
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 44/136
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
G3 Z5.88 I.451 J-1.13 P1  F30000
G1 X125.301 Y126.301 Z5.88
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 45/136
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
G3 Z6 I1.172 J.329 P1  F30000
G1 X125.123 Y123.123 Z6
G1 Z5.76
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X126.539 Y126 E.29627
G1 X126.539 Y127.223 E.05022
G1 X126.223 Y127.539 E.01832
G1 X125.123 Y127.539 E.04517
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 46/136
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
G3 Z6.16 I.451 J-1.13 P1  F30000
G1 X125.301 Y126.301 Z6.16
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
M73 P73 R2
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 47/136
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
G3 Z6.2 I.078 J1.214 P1  F30000
G1 X125.301 Y126.301 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6.04
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 48/136
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
G3 Z6.4 I1.172 J.329 P1  F30000
G1 X125.123 Y123.123 Z6.4
G1 Z6.04
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X126.539 Y126 E.29627
G1 X126.539 Y127.223 E.05022
G1 X126.223 Y127.539 E.01832
G1 X125.123 Y127.539 E.04517
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 49/136
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
G3 Z6.44 I.451 J-1.13 P1  F30000
G1 X125.301 Y126.301 Z6.44
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6.32
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 50/136
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
G3 Z6.6 I1.172 J.329 P1  F30000
G1 X125.123 Y123.123 Z6.6
G1 Z6.32
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X126.539 Y126 E.29627
G1 X126.539 Y127.223 E.05022
G1 X126.223 Y127.539 E.01832
G1 X125.123 Y127.539 E.04517
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 51/136
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
G3 Z6.72 I.451 J-1.13 P1  F30000
G1 X125.301 Y126.301 Z6.72
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 52/136
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
G3 Z6.8 I1.172 J.329 P1  F30000
G1 X125.123 Y123.123 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X126.539 Y126 E.29627
G1 X126.539 Y127.223 E.05022
G1 X126.223 Y127.539 E.01832
G1 X125.123 Y127.539 E.04517
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
; WIPE_START
G1 F24000
M73 P74 R2
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.301 Y126.301 Z7 F30000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 53/136
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
G3 Z7 I.078 J1.214 P1  F30000
G1 X125.301 Y126.301 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6.88
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 54/136
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
G3 Z7.2 I1.172 J.329 P1  F30000
G1 X125.123 Y123.123 Z7.2
G1 Z6.88
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X126.539 Y126 E.29627
G1 X126.539 Y127.223 E.05022
G1 X126.223 Y127.539 E.01832
G1 X125.123 Y127.539 E.04517
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 55/136
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
G3 Z7.28 I.451 J-1.13 P1  F30000
G1 X125.301 Y126.301 Z7.28
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 7.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 56/136
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
G3 Z7.4 I1.172 J.329 P1  F30000
G1 X125.123 Y123.123 Z7.4
G1 Z7.16
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X126.539 Y126 E.29627
G1 X126.539 Y127.223 E.05022
G1 X126.223 Y127.539 E.01832
G1 X125.123 Y127.539 E.04517
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 57/136
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
G3 Z7.56 I.451 J-1.13 P1  F30000
G1 X125.301 Y126.301 Z7.56
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
M73 P75 R2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 58/136
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
G3 Z7.6 I.078 J1.214 P1  F30000
G1 X125.301 Y126.301 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 7.44
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 59/136
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
G3 Z7.8 I1.172 J.329 P1  F30000
G1 X125.123 Y123.123 Z7.8
G1 Z7.44
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X126.539 Y126 E.29627
G1 X126.539 Y127.223 E.05022
G1 X126.223 Y127.539 E.01832
G1 X125.123 Y127.539 E.04517
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 60/136
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
G3 Z7.84 I.451 J-1.13 P1  F30000
G1 X125.301 Y126.301 Z7.84
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126.241 E.02654
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126.73 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 7.72
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 61/136
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
G3 Z8 I1.172 J.329 P1  F30000
G1 X125.123 Y123.123 Z8
G1 Z7.72
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X126.539 Y126 E.29627
G1 X126.539 Y127.223 E.05022
G1 X126.223 Y127.539 E.01832
G1 X125.123 Y127.539 E.04517
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.0800004
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 62/136
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
G3 Z8.12 I.451 J-1.13 P1  F30000
G1 X125.301 Y126.301 Z8.12
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
M73 P76 R2
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 63/136
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
G3 Z8.2 I1.172 J.329 P1  F30000
G1 X125.123 Y123.123 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X126.539 Y126 E.29627
G1 X126.539 Y127.223 E.05022
G1 X126.223 Y127.539 E.01832
G1 X125.123 Y127.539 E.04517
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.301 Y126.301 Z8.4 F30000
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 64/136
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
G3 Z8.4 I.078 J1.214 P1  F30000
G1 X125.301 Y126.301 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 8.28
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 65/136
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
G3 Z8.6 I1.172 J.329 P1  F30000
G1 X125.123 Y123.123 Z8.6
G1 Z8.28
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X126.539 Y126 E.29627
G1 X126.539 Y127.223 E.05022
G1 X126.223 Y127.539 E.01832
G1 X125.123 Y127.539 E.04517
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 66/136
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
G3 Z8.68 I.451 J-1.13 P1  F30000
G1 X125.301 Y126.301 Z8.68
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
M73 P77 R2
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 8.56
; LAYER_HEIGHT: 0.160001
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 67/136
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
G3 Z8.8 I1.172 J.329 P1  F30000
G1 X125.123 Y123.123 Z8.8
G1 Z8.56
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X126.539 Y126 E.29627
G1 X126.539 Y127.223 E.05022
G1 X126.223 Y127.539 E.01832
G1 X125.123 Y127.539 E.04517
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 68/136
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
G3 Z8.96 I.451 J-1.13 P1  F30000
G1 X125.301 Y126.301 Z8.96
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 69/136
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
G3 Z9 I.078 J1.214 P1  F30000
G1 X125.301 Y126.301 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 8.84
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 70/136
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
G3 Z9.2 I1.172 J.329 P1  F30000
G1 X125.123 Y123.123 Z9.2
G1 Z8.84
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X126.539 Y126 E.29627
G1 X126.539 Y127.223 E.05022
G1 X126.223 Y127.539 E.01832
G1 X125.123 Y127.539 E.04517
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 71/136
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
G3 Z9.24 I.451 J-1.13 P1  F30000
G1 X125.301 Y126.301 Z9.24
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 9.12
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 72/136
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
G3 Z9.4 I1.172 J.329 P1  F30000
G1 X125.123 Y123.123 Z9.4
G1 Z9.12
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X126.539 Y126 E.29627
M73 P78 R2
G1 X126.539 Y127.223 E.05022
G1 X126.223 Y127.539 E.01832
G1 X125.123 Y127.539 E.04517
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 73/136
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
G3 Z9.52 I.451 J-1.13 P1  F30000
G1 X125.301 Y126.301 Z9.52
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 74/136
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
G3 Z9.6 I1.172 J.329 P1  F30000
G1 X125.123 Y123.123 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X126.539 Y126 E.29627
G1 X126.539 Y127.223 E.05022
G1 X126.223 Y127.539 E.01832
G1 X125.123 Y127.539 E.04517
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.301 Y126.301 Z9.8 F30000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 75/136
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
G3 Z9.8 I.078 J1.214 P1  F30000
G1 X125.301 Y126.301 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 9.68
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 76/136
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
G3 Z10 I1.172 J.329 P1  F30000
M73 P79 R2
G1 X125.123 Y123.123 Z10
G1 Z9.68
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X126.539 Y126 E.29627
G1 X126.539 Y127.223 E.05022
G1 X126.223 Y127.539 E.01832
G1 X125.123 Y127.539 E.04517
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 77/136
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
G3 Z10.08 I.451 J-1.13 P1  F30000
G1 X125.301 Y126.301 Z10.08
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 9.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 78/136
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
G3 Z10.2 I1.172 J.329 P1  F30000
G1 X125.123 Y123.123 Z10.2
G1 Z9.96
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X126.539 Y126 E.29627
G1 X126.539 Y127.223 E.05022
G1 X126.223 Y127.539 E.01832
G1 X125.123 Y127.539 E.04517
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 79/136
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
G3 Z10.36 I.451 J-1.13 P1  F30000
G1 X125.301 Y126.301 Z10.36
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 80/136
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
G3 Z10.4 I.078 J1.214 P1  F30000
G1 X125.301 Y126.301 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 10.24
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 81/136
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
G3 Z10.6 I1.172 J.329 P1  F30000
G1 X125.123 Y123.123 Z10.6
G1 Z10.24
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
M73 P80 R2
G1 X133.754 Y123.123 E.35439
G1 X133.754 Y126 E.11813
G1 X126.539 Y126 E.29627
G1 X126.539 Y127.223 E.05022
G1 X126.223 Y127.539 E.01832
G1 X125.123 Y127.539 E.04517
G1 X125.123 Y128.877 E.05496
G1 X133.754 Y128.877 E.35439
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 82/136
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
G3 Z10.64 I.451 J-1.13 P1  F30000
G1 X125.301 Y126.301 Z10.64
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 10.52
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 83/136
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
G3 Z10.8 I-1.062 J.594 P1  F30000
G1 X125.123 Y128.005 Z10.8
G1 Z10.52
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G1 X125.123 Y127.539 E.01914
G1 X125.369 Y127.539 E.01009
G1 X125.369 Y128.877 E.05496
G1 X125.123 Y128.877 E.01009
G1 X125.123 Y128.411 E.01914
; WIPE_START
G1 F24000
G1 X125.123 Y128.877 E-.17717
G1 X125.369 Y128.877 E-.09343
G1 X125.369 Y127.589 E-.48941
; WIPE_END
G1 E-.04 F1800
G1 X125.123 Y123.995 Z10.92 F30000
G1 Z10.52
G1 E.8 F1800
G1 F1200
G1 X125.123 Y124.461 E.01914
G1 X125.369 Y124.461 E.01009
M73 P80 R1
G1 X125.369 Y123.123 E.05496
G1 X126.246 Y123.123 E.03601
G1 X126.246 Y124.484 E.0559
G1 X126.539 Y124.777 E.017
G1 X126.539 Y127.223 E.10044
G1 X126.246 Y127.516 E.017
G1 X126.246 Y128.877 E.0559
G1 X127.123 Y128.877 E.03601
G1 X127.123 Y123.123 E.23626
G1 X128 Y123.123 E.03601
G1 X128 Y128.877 E.23626
G1 X128.877 Y128.877 E.03601
G1 X128.877 Y123.123 E.23626
G1 X129.754 Y123.123 E.03601
G1 X129.754 Y128.877 E.23626
G1 X130.631 Y128.877 E.03601
G1 X130.631 Y123.123 E.23626
G1 X131.32 Y123.123 E.02827
; WIPE_START
G1 F24000
G1 X130.631 Y123.123 E-.26164
G1 X130.631 Y124.434 E-.49836
; WIPE_END
G1 E-.04 F1800
G1 X133.451 Y126 Z10.92 F30000
G1 Z10.52
G1 E.8 F1800
G1 F1200
G1 X133.754 Y126 E.01245
G1 X133.754 Y123.123 E.11813
G1 X133.262 Y123.123 E.02019
G1 X133.262 Y126 E.11813
G1 X132.385 Y126 E.03601
G1 X132.385 Y123.123 E.11813
G1 X131.508 Y123.123 E.03601
G1 X131.508 Y126 E.11813
G1 X130.933 Y126 E.02363
G1 X131.254 Y128.689 F30000
; FEATURE: Support
G1 F1200
G1 X131.254 Y126.377 E.09491
G1 X133.754 Y126.377 E.10265
G1 X133.754 Y128.877 E.10265
G1 X131.254 Y128.877 E.10265
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F24000
G1 X133.254 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 84/136
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
G3 Z10.92 I.375 J-1.158 P1  F30000
G1 X125.301 Y126.301 Z10.92
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 85/136
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
G3 Z11 I.798 J.919 P1  F30000
M73 P81 R1
G1 X126.309 Y124.548 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F1200
G3 X126.539 Y125.123 I-.173 J.402 E.02825
G1 X133.754 Y125.123 E.29627
G1 X133.754 Y126 E.03601
G1 X126.539 Y126 E.29627
G1 X126.539 Y126.877 E.03601
G1 X130.877 Y126.877 E.17814
G1 X130.877 Y127.754 E.03601
G1 X125.123 Y127.754 E.23626
G1 X125.123 Y128.631 E.03601
G1 X130.877 Y128.631 E.23626
G1 X130.877 Y128.877 E.01009
G1 X130.411 Y128.877 E.01914
G1 X131.254 Y128.877 F30000
; FEATURE: Support
G1 F1200
G1 X133.754 Y128.877 E.10265
G1 X133.754 Y126.377 E.10265
G1 X131.254 Y126.377 E.10265
G1 X131.254 Y128.689 E.09491
; WIPE_START
G1 F24000
G1 X131.254 Y126.689 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X133.754 Y124.934 Z11.2 F30000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Support interface
G1 F1200
G1 X133.754 Y124.246 E.02827
G1 X125.123 Y124.246 E.3544
G1 X125.123 Y123.369 E.03601
G1 X133.754 Y123.369 E.3544
G1 X133.754 Y123.123 E.01009
G1 X133.288 Y123.123 E.01914
; WIPE_START
G1 F24000
G1 X133.754 Y123.123 E-.17717
G1 X133.754 Y123.369 E-.09343
G1 X132.466 Y123.369 E-.48941
; WIPE_END
G1 E-.04 F1800
G1 X125.402 Y126.259 Z11.2 F30000
G1 X125.301 Y126.301 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 86/136
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
G3 Z11.2 I.078 J1.214 P1  F30000
G1 X125.301 Y126.301 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.301 Y125.699 E.02948
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.241 E.0118
G1 X125.79 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.79 Y125.21 E.04855
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.73 E.02243
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 11.0727
; LAYER_HEIGHT: 0.0727272
; WIPE_START
G1 F24000
G1 X124.21 Y126.79 E-.60083
G1 X124.21 Y126.371 E-.15917
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 87/136
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
G3 Z11.4 I-.671 J1.015 P1  F30000
G1 X128 Y128.877 Z11.4
G1 Z11.073
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F1200
G1 X133.754 Y128.877 E.23112
G1 X133.754 Y126 E.11556
G1 X132.539 Y126 E.04883
G1 X132.539 Y126.223 E.00896
M73 P82 R1
G1 X132.223 Y126.539 E.01792
G1 X130.539 Y126.539 E.06766
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.127273
; WIPE_START
G1 F24000
G1 X132.223 Y126.539 E-.64012
G1 X132.446 Y126.315 E-.11988
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 88/136
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
G3 Z11.473 I.002 J-1.217 P1  F30000
G1 X124.699 Y126.301 Z11.473
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X124.699 Y125.699 E.02948
G1 X125.742 Y125.699 E.05112
G1 X125.871 Y125.699 E.00632
G1 X126 Y125.699 E.00632
G1 X126.129 Y125.699 E.00632
G1 X126.2 Y125.699 E.00349
M204 S5000
; FEATURE: Overhang wall
G1 F3000
G1 X128.021 Y125.699 E.08927
G1 X128.109 Y125.646 E.00501
; LINE_WIDTH: 0.595786

G1 X128.196 Y125.593 E.0046
; LINE_WIDTH: 0.54719

G1 X128.283 Y125.539 E.0042
; LINE_WIDTH: 0.498595

G1 X128.37 Y125.486 E.00379
; LINE_WIDTH: 0.449999

G1 X128.519 Y125.321 E.00737
G1 X128.597 Y125.097 E.00788
G1 X128.602 Y124.602 E.01641
G3 X129.588 Y124.629 I.21 J10.376 E.03272
; LINE_WIDTH: 0.498595

G1 X129.685 Y124.647 E.00369
; LINE_WIDTH: 0.54719

G1 X129.783 Y124.664 E.00408
; LINE_WIDTH: 0.595786

G1 X129.881 Y124.682 E.00447
; LINE_WIDTH: 0.644381

G1 X129.979 Y124.699 E.00486
G1 X131.301 Y124.699 E.0648
G1 X131.301 Y125 E.01474

G1 X131.301 Y125.301 E.01474
G1 X129.979 Y125.301 E.0648
G1 X129.875 Y125.368 E.00604
; LINE_WIDTH: 0.595786

G1 X129.772 Y125.436 E.00556
; LINE_WIDTH: 0.54719

G1 X129.669 Y125.503 E.00507
; LINE_WIDTH: 0.498595

G1 X129.566 Y125.57 E.00458
; LINE_WIDTH: 0.449999

G1 X129.481 Y125.679 E.00456
G1 X129.398 Y126 E.011
; LINE_WIDTH: 0.498595

G1 X129.374 Y126.325 E.01211
; LINE_WIDTH: 0.54719

G1 X129.349 Y126.65 E.0134
; LINE_WIDTH: 0.595786

G1 X129.325 Y126.976 E.01469
; LINE_WIDTH: 0.644381

G1 X129.301 Y127.301 E.01598
G1 X128.699 Y127.301 E.02948
G1 X128.699 Y126.979 E.01579
G1 X128.617 Y126.862 E.00698
; LINE_WIDTH: 0.595786

G1 X128.535 Y126.746 E.00641
; LINE_WIDTH: 0.54719

G1 X128.452 Y126.63 E.00585
; LINE_WIDTH: 0.498595

G2 X128.283 Y126.461 I-.283 J.113 E.00915
; LINE_WIDTH: 0.54719

G1 X128.196 Y126.407 E.0042
; LINE_WIDTH: 0.595786

G1 X128.109 Y126.354 E.0046
; LINE_WIDTH: 0.644381

G1 X128.021 Y126.301 E.00501
G1 X126.2 Y126.301 E.08927
M204 S10000
; FEATURE: Inner wall
G1 F1200
G1 X126.129 Y126.301 E.00349
G1 X126 Y126.301 E.00632
G1 X125.871 Y126.301 E.00632
G1 X125.742 Y126.301 E.00632
G1 X124.759 Y126.301 E.04818
G1 X124.21 Y126.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X124.21 Y125.21 E.04855
G1 X125.832 Y125.21 E.04984
G1 X125.916 Y125.21 E.00258
G1 X126 Y125.21 E.00258
G1 X126.084 Y125.21 E.00258
G1 X126.168 Y125.21 E.00258
G1 X126.2 Y125.21 E.00098
; FEATURE: Overhang wall
G1 F3000
G1 X128.021 Y125.21 E.05597
G1 X128.135 Y125.172 E.00366
G1 X128.21 Y125.021 E.00518
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y125 E.02427

G1 X131.79 Y125.79 E.02427
G1 X129.979 Y125.79 E.05566
G1 X129.844 Y125.846 E.00447
G1 X129.79 Y125.979 E.0044
G1 X129.79 Y127.79 E.05566
G1 X128.21 Y127.79 E.04855
G1 X128.21 Y127 E.02427
G1 X128.135 Y126.828 E.00578
G1 X128.021 Y126.79 E.00366
G1 X126.2 Y126.79 E.05597
; FEATURE: Outer wall
G1 F1200
G1 X126.168 Y126.79 E.00098
G1 X126.084 Y126.79 E.00258
G1 X126 Y126.79 E.00258
G1 X125.916 Y126.79 E.00258
G1 X125.832 Y126.79 E.00258
G1 X124.27 Y126.79 E.048
M204 S10000
; WIPE_START
G1 F24000
G1 X124.21 Y125.21 E-.60083
G1 X124.629 Y125.21 E-.15917
; WIPE_END
G1 E-.04 F1800
G1 X128.578 Y126.524 Z11.6 F30000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.495415
G1 F3000
G1 X128.77 Y125.532 E.03728
G2 X128.93 Y124.933 I-.717 J-.513 E.02335
G3 X129.344 Y124.949 I.113 J2.432 E.01527
G1 X128.95 Y126.983 E.0764
; CHANGE_LAYER
; Z_HEIGHT: 11.3455
; LAYER_HEIGHT: 0.145454
; WIPE_START
G1 F24000
G1 X129.33 Y125.02 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 89/136
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
G3 Z11.6 I-.952 J.758 P1  F30000
G1 X130.539 Y126.539 Z11.6
G1 Z11.345
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F1200
G1 X132.223 Y126.539 E.06766
G1 X132.539 Y126.223 E.01792
G1 X132.539 Y126 E.00896
G1 X133.754 Y126 E.04883
G1 X133.754 Y128.877 E.11556
G1 X128 Y128.877 E.23112
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.0545454
; WIPE_START
G1 F24000
G1 X130 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 90/136
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
G3 Z11.745 I1.195 J-.23 P1  F30000
G1 X129.426 Y125.893 Z11.745
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X129.398 Y126 E.00368
; LINE_WIDTH: 0.498595
G1 X129.374 Y126.325 E.01211
; LINE_WIDTH: 0.54719
G1 X129.349 Y126.65 E.0134
; LINE_WIDTH: 0.595786
G1 X129.325 Y126.976 E.01469
; LINE_WIDTH: 0.644381
G1 X129.301 Y127.301 E.01598
G1 X128.699 Y127.301 E.02948
G1 X128.699 Y126.979 E.01579
G1 X128.617 Y126.862 E.00698
; LINE_WIDTH: 0.595786
G1 X128.535 Y126.746 E.00641
; LINE_WIDTH: 0.54719
G1 X128.452 Y126.63 E.00585
; LINE_WIDTH: 0.498595
G2 X128.283 Y126.461 I-.283 J.113 E.00915
; LINE_WIDTH: 0.54719
G1 X128.196 Y126.407 E.0042
; LINE_WIDTH: 0.595786
G1 X128.109 Y126.354 E.0046
; LINE_WIDTH: 0.644381
G1 X128.021 Y126.301 E.00501
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.109 Y125.646 E.00501
; LINE_WIDTH: 0.595786
G1 X128.196 Y125.593 E.0046
; LINE_WIDTH: 0.54719
G1 X128.283 Y125.539 E.0042
; LINE_WIDTH: 0.498595
G1 X128.37 Y125.486 E.00379
; LINE_WIDTH: 0.449999
G1 X128.519 Y125.321 E.00737
G1 X128.597 Y125.097 E.00788
G1 X128.602 Y124.602 E.01641
G3 X129.588 Y124.629 I.21 J10.376 E.03272
; LINE_WIDTH: 0.498595
G1 X129.685 Y124.647 E.00369
; LINE_WIDTH: 0.54719
G1 X129.783 Y124.664 E.00408
; LINE_WIDTH: 0.595786
G1 X129.881 Y124.682 E.00447
; LINE_WIDTH: 0.644381
G1 X129.979 Y124.699 E.00486
G1 X131.301 Y124.699 E.0648
G1 X131.301 Y125 E.01474
G1 X131.301 Y125.301 E.01474
G1 X129.979 Y125.301 E.0648
G1 X129.875 Y125.368 E.00604
; LINE_WIDTH: 0.595786
G1 X129.772 Y125.436 E.00556
; LINE_WIDTH: 0.54719
G1 X129.669 Y125.503 E.00507
; LINE_WIDTH: 0.498595
G1 X129.566 Y125.57 E.00458
; LINE_WIDTH: 0.449999
G1 X129.481 Y125.679 E.00456
G1 X129.441 Y125.834 E.00533
G1 X129.79 Y125.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.79 Y127.79 E.05566
G1 X128.21 Y127.79 E.04855
G1 X128.21 Y127 E.02427
G1 X128.168 Y126.904 E.00322
G1 X128.136 Y126.832 E.00242
G1 X128.021 Y126.79 E.00376
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.137 Y125.168 E.00377
G1 X128.168 Y125.105 E.00215
G1 X128.21 Y125.021 E.00289
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y125 E.02427
G1 X131.79 Y125.79 E.02427
G1 X129.979 Y125.79 E.05566
G1 X129.878 Y125.832 E.00335
G2 X129.832 Y125.876 I-.001 J.045 E.00218
G1 X129.813 Y125.923 E.00155
M204 S10000
; WIPE_START
G1 F24000
G1 X129.79 Y127.79 E-.7095
G1 X129.657 Y127.79 E-.0505
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I.992 J-.705 P1  F30000
G1 X128.384 Y126 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477178
G1 F1200
G3 X128.875 Y126.48 I-.78 J1.29 E.02451
G1 X129.008 Y125.91 E.02069
; LINE_WIDTH: 0.433393
G1 X129.077 Y125.735 E.00599
; LINE_WIDTH: 0.39381
G3 X129.319 Y125.278 I1.436 J.467 E.01486
G1 X129.618 Y125.049 E.01077
G2 X128.982 Y124.995 I-.872 J6.447 E.01825
G1 X128.961 Y125.194 E.00574
; LINE_WIDTH: 0.39108
G1 X128.66 Y125.757 E.01811
; LINE_WIDTH: 0.433393
G1 X128.429 Y125.96 E.00978
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.66 Y125.757 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 91/136
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
G3 Z11.8 I-.212 J1.198 P1  F30000
G1 X129.426 Y125.893 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1200
G1 X129.398 Y126 E.00368
; LINE_WIDTH: 0.498595
G1 X129.374 Y126.325 E.01211
; LINE_WIDTH: 0.54719
G1 X129.349 Y126.65 E.0134
; LINE_WIDTH: 0.595786
G1 X129.325 Y126.976 E.01469
; LINE_WIDTH: 0.644381
G1 X129.301 Y127.301 E.01598
G1 X128.699 Y127.301 E.02948
G1 X128.699 Y126.979 E.01579
G1 X128.617 Y126.862 E.00698
; LINE_WIDTH: 0.595786
G1 X128.535 Y126.746 E.00641
; LINE_WIDTH: 0.54719
G1 X128.452 Y126.63 E.00585
; LINE_WIDTH: 0.498595
G2 X128.283 Y126.461 I-.283 J.113 E.00915
; LINE_WIDTH: 0.54719
G1 X128.196 Y126.407 E.0042
; LINE_WIDTH: 0.595786
G1 X128.109 Y126.354 E.0046
; LINE_WIDTH: 0.644381
M73 P83 R1
G1 X128.021 Y126.301 E.00501
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.109 Y125.646 E.00501
; LINE_WIDTH: 0.595786
G1 X128.196 Y125.593 E.0046
; LINE_WIDTH: 0.54719
G1 X128.283 Y125.539 E.0042
; LINE_WIDTH: 0.498595
G1 X128.37 Y125.486 E.00379
; LINE_WIDTH: 0.449999
G1 X128.519 Y125.321 E.00737
G1 X128.597 Y125.097 E.00788
G1 X128.602 Y124.602 E.01641
G3 X129.588 Y124.629 I.21 J10.376 E.03272
; LINE_WIDTH: 0.498595
G1 X129.685 Y124.647 E.00369
; LINE_WIDTH: 0.54719
G1 X129.783 Y124.664 E.00408
; LINE_WIDTH: 0.595786
G1 X129.881 Y124.682 E.00447
; LINE_WIDTH: 0.644381
G1 X129.979 Y124.699 E.00486
G1 X131.301 Y124.699 E.0648
G1 X131.301 Y125 E.01474
G1 X131.301 Y125.301 E.01474
G1 X129.979 Y125.301 E.0648
G1 X129.875 Y125.368 E.00604
; LINE_WIDTH: 0.595786
G1 X129.772 Y125.436 E.00556
; LINE_WIDTH: 0.54719
G1 X129.669 Y125.503 E.00507
; LINE_WIDTH: 0.498595
G1 X129.566 Y125.57 E.00458
; LINE_WIDTH: 0.449999
G1 X129.481 Y125.679 E.00456
G1 X129.441 Y125.834 E.00533
G1 X129.79 Y125.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.79 Y127.79 E.05566
G1 X128.21 Y127.79 E.04855
G1 X128.21 Y127 E.02427
G1 X128.168 Y126.904 E.00322
G1 X128.136 Y126.832 E.00242
G1 X128.021 Y126.79 E.00376
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.137 Y125.168 E.00377
G1 X128.168 Y125.105 E.00215
G1 X128.21 Y125.021 E.00289
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y125 E.02427
G1 X131.79 Y125.79 E.02427
G1 X129.979 Y125.79 E.05566
G1 X129.878 Y125.832 E.00335
G2 X129.832 Y125.876 I-.001 J.045 E.00218
G1 X129.813 Y125.923 E.00155
M204 S10000
; WIPE_START
G1 F24000
G1 X129.79 Y127.79 E-.7095
G1 X129.657 Y127.79 E-.0505
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I.992 J-.705 P1  F30000
G1 X128.384 Y126 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477178
G1 F1200
G3 X128.875 Y126.48 I-.78 J1.29 E.02451
G1 X129.008 Y125.91 E.02069
; LINE_WIDTH: 0.433393
G1 X129.077 Y125.735 E.00599
; LINE_WIDTH: 0.39381
G3 X129.319 Y125.278 I1.436 J.467 E.01486
G1 X129.618 Y125.049 E.01077
G2 X128.982 Y124.995 I-.872 J6.447 E.01825
G1 X128.961 Y125.194 E.00574
; LINE_WIDTH: 0.39108
G1 X128.66 Y125.757 E.01811
; LINE_WIDTH: 0.433393
G1 X128.429 Y125.96 E.00978
; CHANGE_LAYER
; Z_HEIGHT: 11.6182
; LAYER_HEIGHT: 0.0181818
; WIPE_START
G1 F24000
G1 X128.66 Y125.757 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 92/136
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
G3 Z12 I-.468 J1.124 P1  F30000
G1 X130.539 Y126.539 Z12
G1 Z11.618
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F1200
G1 X132.223 Y126.539 E.06766
G1 X132.539 Y126.223 E.01792
G1 X132.539 Y126 E.00896
G1 X133.754 Y126 E.04883
G1 X133.754 Y128.877 E.11556
G1 X128 Y128.877 E.23112
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.181818
; WIPE_START
G1 F24000
G1 X130 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 93/136
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
G3 Z12.018 I1.195 J-.23 P1  F30000
G1 X129.426 Y125.893 Z12.018
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X129.398 Y126 E.00368
; LINE_WIDTH: 0.498595
G1 X129.374 Y126.325 E.01211
; LINE_WIDTH: 0.54719
G1 X129.349 Y126.65 E.0134
; LINE_WIDTH: 0.595786
G1 X129.325 Y126.976 E.01469
; LINE_WIDTH: 0.644381
G1 X129.301 Y127.301 E.01598
G1 X128.699 Y127.301 E.02948
G1 X128.699 Y126.979 E.01579
G1 X128.617 Y126.862 E.00698
; LINE_WIDTH: 0.595786
G1 X128.535 Y126.746 E.00641
; LINE_WIDTH: 0.54719
G1 X128.452 Y126.63 E.00585
; LINE_WIDTH: 0.498595
G2 X128.283 Y126.461 I-.283 J.113 E.00915
; LINE_WIDTH: 0.54719
G1 X128.196 Y126.407 E.0042
; LINE_WIDTH: 0.595786
G1 X128.109 Y126.354 E.0046
; LINE_WIDTH: 0.644381
G1 X128.021 Y126.301 E.00501
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.109 Y125.646 E.00501
; LINE_WIDTH: 0.595786
G1 X128.196 Y125.593 E.0046
; LINE_WIDTH: 0.54719
G1 X128.283 Y125.539 E.0042
; LINE_WIDTH: 0.498595
G1 X128.37 Y125.486 E.00379
; LINE_WIDTH: 0.449999
G1 X128.519 Y125.321 E.00737
G1 X128.597 Y125.097 E.00788
G1 X128.602 Y124.602 E.01641
G3 X129.588 Y124.629 I.21 J10.376 E.03272
; LINE_WIDTH: 0.498595
G1 X129.685 Y124.647 E.00369
; LINE_WIDTH: 0.54719
G1 X129.783 Y124.664 E.00408
; LINE_WIDTH: 0.595786
G1 X129.881 Y124.682 E.00447
; LINE_WIDTH: 0.644381
G1 X129.979 Y124.699 E.00486
G1 X131.301 Y124.699 E.0648
G1 X131.301 Y125 E.01474
G1 X131.301 Y125.301 E.01474
G1 X129.979 Y125.301 E.0648
G1 X129.875 Y125.368 E.00604
; LINE_WIDTH: 0.595786
G1 X129.772 Y125.436 E.00556
; LINE_WIDTH: 0.54719
G1 X129.669 Y125.503 E.00507
; LINE_WIDTH: 0.498595
G1 X129.566 Y125.57 E.00458
; LINE_WIDTH: 0.449999
G1 X129.481 Y125.679 E.00456
G1 X129.441 Y125.834 E.00533
G1 X129.79 Y125.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.79 Y127.79 E.05566
G1 X128.21 Y127.79 E.04855
G1 X128.21 Y127 E.02427
G1 X128.168 Y126.904 E.00322
G1 X128.136 Y126.832 E.00242
G1 X128.021 Y126.79 E.00376
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.137 Y125.168 E.00377
G1 X128.168 Y125.105 E.00215
G1 X128.21 Y125.021 E.00289
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y125 E.02427
G1 X131.79 Y125.79 E.02427
G1 X129.979 Y125.79 E.05566
G1 X129.878 Y125.832 E.00335
G2 X129.832 Y125.876 I-.001 J.045 E.00218
G1 X129.813 Y125.923 E.00155
M204 S10000
; WIPE_START
G1 F24000
G1 X129.79 Y127.79 E-.7095
G1 X129.657 Y127.79 E-.0505
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I.992 J-.705 P1  F30000
G1 X128.384 Y126 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477178
G1 F1200
G3 X128.875 Y126.48 I-.78 J1.29 E.02451
G1 X129.008 Y125.91 E.02069
; LINE_WIDTH: 0.433393
G1 X129.077 Y125.735 E.00599
; LINE_WIDTH: 0.39381
G3 X129.319 Y125.278 I1.436 J.467 E.01486
G1 X129.618 Y125.049 E.01077
G2 X128.982 Y124.995 I-.872 J6.447 E.01825
G1 X128.961 Y125.194 E.00574
; LINE_WIDTH: 0.39108
G1 X128.66 Y125.757 E.01811
; LINE_WIDTH: 0.433393
G1 X128.429 Y125.96 E.00978
; CHANGE_LAYER
; Z_HEIGHT: 11.8909
; LAYER_HEIGHT: 0.090909
; WIPE_START
G1 F24000
G1 X128.66 Y125.757 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 94/136
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
G3 Z12.2 I-.468 J1.124 P1  F30000
G1 X130.539 Y126.539 Z12.2
G1 Z11.891
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F1200
G1 X132.223 Y126.539 E.06766
G1 X132.539 Y126.223 E.01792
G1 X132.539 Y126 E.00896
G1 X133.754 Y126 E.04883
G1 X133.754 Y128.877 E.11556
G1 X128 Y128.877 E.23112
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.109091
; WIPE_START
G1 F24000
G1 X130 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 95/136
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
G3 Z12.291 I1.195 J-.23 P1  F30000
G1 X129.426 Y125.893 Z12.291
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
; LAYER_HEIGHT: 0.2
M73 P84 R1
G1 F1200
G1 X129.398 Y126 E.00368
; LINE_WIDTH: 0.498595
G1 X129.374 Y126.325 E.01211
; LINE_WIDTH: 0.54719
G1 X129.349 Y126.65 E.0134
; LINE_WIDTH: 0.595786
G1 X129.325 Y126.976 E.01469
; LINE_WIDTH: 0.644381
G1 X129.301 Y127.301 E.01598
G1 X128.699 Y127.301 E.02948
G1 X128.699 Y126.979 E.01579
G1 X128.617 Y126.862 E.00698
; LINE_WIDTH: 0.595786
G1 X128.535 Y126.746 E.00641
; LINE_WIDTH: 0.54719
G1 X128.452 Y126.63 E.00585
; LINE_WIDTH: 0.498595
G2 X128.283 Y126.461 I-.283 J.113 E.00915
; LINE_WIDTH: 0.54719
G1 X128.196 Y126.407 E.0042
; LINE_WIDTH: 0.595786
G1 X128.109 Y126.354 E.0046
; LINE_WIDTH: 0.644381
G1 X128.021 Y126.301 E.00501
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.109 Y125.646 E.00501
; LINE_WIDTH: 0.595786
G1 X128.196 Y125.593 E.0046
; LINE_WIDTH: 0.54719
G1 X128.283 Y125.539 E.0042
; LINE_WIDTH: 0.498595
G1 X128.37 Y125.486 E.00379
; LINE_WIDTH: 0.449999
G1 X128.519 Y125.321 E.00737
G1 X128.597 Y125.097 E.00788
G1 X128.602 Y124.602 E.01641
G3 X129.588 Y124.629 I.21 J10.376 E.03272
; LINE_WIDTH: 0.498595
G1 X129.685 Y124.647 E.00369
; LINE_WIDTH: 0.54719
G1 X129.783 Y124.664 E.00408
; LINE_WIDTH: 0.595786
G1 X129.881 Y124.682 E.00447
; LINE_WIDTH: 0.644381
G1 X129.979 Y124.699 E.00486
G1 X131.301 Y124.699 E.0648
G1 X131.301 Y125 E.01474
G1 X131.301 Y125.301 E.01474
G1 X129.979 Y125.301 E.0648
G1 X129.875 Y125.368 E.00604
; LINE_WIDTH: 0.595786
G1 X129.772 Y125.436 E.00556
; LINE_WIDTH: 0.54719
G1 X129.669 Y125.503 E.00507
; LINE_WIDTH: 0.498595
G1 X129.566 Y125.57 E.00458
; LINE_WIDTH: 0.449999
G1 X129.481 Y125.679 E.00456
G1 X129.441 Y125.834 E.00533
G1 X129.79 Y125.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.79 Y127.79 E.05566
G1 X128.21 Y127.79 E.04855
G1 X128.21 Y127 E.02427
G1 X128.168 Y126.904 E.00322
G1 X128.136 Y126.832 E.00242
G1 X128.021 Y126.79 E.00376
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.137 Y125.168 E.00377
G1 X128.168 Y125.105 E.00215
G1 X128.21 Y125.021 E.00289
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y125 E.02427
G1 X131.79 Y125.79 E.02427
G1 X129.979 Y125.79 E.05566
G1 X129.878 Y125.832 E.00335
G2 X129.832 Y125.876 I-.001 J.045 E.00218
G1 X129.813 Y125.923 E.00155
M204 S10000
; WIPE_START
G1 F24000
G1 X129.79 Y127.79 E-.7095
G1 X129.657 Y127.79 E-.0505
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I.992 J-.705 P1  F30000
G1 X128.384 Y126 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477178
G1 F1200
G3 X128.875 Y126.48 I-.78 J1.29 E.02451
G1 X129.008 Y125.91 E.02069
; LINE_WIDTH: 0.433393
G1 X129.077 Y125.735 E.00599
; LINE_WIDTH: 0.39381
G3 X129.319 Y125.278 I1.436 J.467 E.01486
G1 X129.618 Y125.049 E.01077
G2 X128.982 Y124.995 I-.872 J6.447 E.01825
G1 X128.961 Y125.194 E.00574
; LINE_WIDTH: 0.39108
G1 X128.66 Y125.757 E.01811
; LINE_WIDTH: 0.433393
G1 X128.429 Y125.96 E.00978
; CHANGE_LAYER
; Z_HEIGHT: 12.1636
; LAYER_HEIGHT: 0.163636
; WIPE_START
G1 F24000
G1 X128.66 Y125.757 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 96/136
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
G3 Z12.4 I-.468 J1.124 P1  F30000
G1 X130.539 Y126.539 Z12.4
G1 Z12.164
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F1200
G1 X132.223 Y126.539 E.06766
G1 X132.539 Y126.223 E.01792
G1 X132.539 Y126 E.00896
G1 X133.754 Y126 E.04883
G1 X133.754 Y128.877 E.11556
G1 X128 Y128.877 E.23112
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.0363636
; WIPE_START
G1 F24000
G1 X130 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 97/136
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
G3 Z12.564 I1.195 J-.23 P1  F30000
G1 X129.426 Y125.893 Z12.564
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X129.398 Y126 E.00368
; LINE_WIDTH: 0.498595
G1 X129.374 Y126.325 E.01211
; LINE_WIDTH: 0.54719
G1 X129.349 Y126.65 E.0134
; LINE_WIDTH: 0.595786
G1 X129.325 Y126.976 E.01469
; LINE_WIDTH: 0.644381
G1 X129.301 Y127.301 E.01598
G1 X128.699 Y127.301 E.02948
G1 X128.699 Y126.979 E.01579
G1 X128.617 Y126.862 E.00698
; LINE_WIDTH: 0.595786
G1 X128.535 Y126.746 E.00641
; LINE_WIDTH: 0.54719
G1 X128.452 Y126.63 E.00585
; LINE_WIDTH: 0.498595
G2 X128.283 Y126.461 I-.283 J.113 E.00915
; LINE_WIDTH: 0.54719
G1 X128.196 Y126.407 E.0042
; LINE_WIDTH: 0.595786
G1 X128.109 Y126.354 E.0046
; LINE_WIDTH: 0.644381
G1 X128.021 Y126.301 E.00501
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.109 Y125.646 E.00501
; LINE_WIDTH: 0.595786
G1 X128.196 Y125.593 E.0046
; LINE_WIDTH: 0.54719
G1 X128.283 Y125.539 E.0042
; LINE_WIDTH: 0.498595
G1 X128.37 Y125.486 E.00379
; LINE_WIDTH: 0.449999
G1 X128.519 Y125.321 E.00737
G1 X128.597 Y125.097 E.00788
G1 X128.602 Y124.602 E.01641
G3 X129.588 Y124.629 I.21 J10.376 E.03272
; LINE_WIDTH: 0.498595
G1 X129.685 Y124.647 E.00369
; LINE_WIDTH: 0.54719
G1 X129.783 Y124.664 E.00408
; LINE_WIDTH: 0.595786
G1 X129.881 Y124.682 E.00447
; LINE_WIDTH: 0.644381
G1 X129.979 Y124.699 E.00486
G1 X131.301 Y124.699 E.0648
G1 X131.301 Y125 E.01474
G1 X131.301 Y125.301 E.01474
G1 X129.979 Y125.301 E.0648
G1 X129.875 Y125.368 E.00604
; LINE_WIDTH: 0.595786
G1 X129.772 Y125.436 E.00556
; LINE_WIDTH: 0.54719
G1 X129.669 Y125.503 E.00507
; LINE_WIDTH: 0.498595
G1 X129.566 Y125.57 E.00458
; LINE_WIDTH: 0.449999
G1 X129.481 Y125.679 E.00456
G1 X129.441 Y125.834 E.00533
G1 X129.79 Y125.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.79 Y127.79 E.05566
G1 X128.21 Y127.79 E.04855
G1 X128.21 Y127 E.02427
G1 X128.168 Y126.904 E.00322
G1 X128.136 Y126.832 E.00242
G1 X128.021 Y126.79 E.00376
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.137 Y125.168 E.00377
G1 X128.168 Y125.105 E.00215
G1 X128.21 Y125.021 E.00289
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y125 E.02427
G1 X131.79 Y125.79 E.02427
G1 X129.979 Y125.79 E.05566
G1 X129.878 Y125.832 E.00335
G2 X129.832 Y125.876 I-.001 J.045 E.00218
G1 X129.813 Y125.923 E.00155
M204 S10000
; WIPE_START
G1 F24000
G1 X129.79 Y127.79 E-.7095
G1 X129.657 Y127.79 E-.0505
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I.992 J-.705 P1  F30000
G1 X128.384 Y126 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477178
G1 F1200
G3 X128.875 Y126.48 I-.78 J1.29 E.02451
G1 X129.008 Y125.91 E.02069
; LINE_WIDTH: 0.433393
G1 X129.077 Y125.735 E.00599
; LINE_WIDTH: 0.39381
G3 X129.319 Y125.278 I1.436 J.467 E.01486
G1 X129.618 Y125.049 E.01077
G2 X128.982 Y124.995 I-.872 J6.447 E.01825
G1 X128.961 Y125.194 E.00574
; LINE_WIDTH: 0.39108
G1 X128.66 Y125.757 E.01811
; LINE_WIDTH: 0.433393
G1 X128.429 Y125.96 E.00978
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.66 Y125.757 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 98/136
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
G3 Z12.6 I-.212 J1.198 P1  F30000
M73 P85 R1
G1 X129.426 Y125.893 Z12.6
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1200
G1 X129.398 Y126 E.00368
; LINE_WIDTH: 0.498595
G1 X129.374 Y126.325 E.01211
; LINE_WIDTH: 0.54719
G1 X129.349 Y126.65 E.0134
; LINE_WIDTH: 0.595786
G1 X129.325 Y126.976 E.01469
; LINE_WIDTH: 0.644381
G1 X129.301 Y127.301 E.01598
G1 X128.699 Y127.301 E.02948
G1 X128.699 Y126.979 E.01579
G1 X128.617 Y126.862 E.00698
; LINE_WIDTH: 0.595786
G1 X128.535 Y126.746 E.00641
; LINE_WIDTH: 0.54719
G1 X128.452 Y126.63 E.00585
; LINE_WIDTH: 0.498595
G2 X128.283 Y126.461 I-.283 J.113 E.00915
; LINE_WIDTH: 0.54719
G1 X128.196 Y126.407 E.0042
; LINE_WIDTH: 0.595786
G1 X128.109 Y126.354 E.0046
; LINE_WIDTH: 0.644381
G1 X128.021 Y126.301 E.00501
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.109 Y125.646 E.00501
; LINE_WIDTH: 0.595786
G1 X128.196 Y125.593 E.0046
; LINE_WIDTH: 0.54719
G1 X128.283 Y125.539 E.0042
; LINE_WIDTH: 0.498595
G1 X128.37 Y125.486 E.00379
; LINE_WIDTH: 0.449999
G1 X128.519 Y125.321 E.00737
G1 X128.597 Y125.097 E.00788
G1 X128.602 Y124.602 E.01641
G3 X129.588 Y124.629 I.21 J10.376 E.03272
; LINE_WIDTH: 0.498595
G1 X129.685 Y124.647 E.00369
; LINE_WIDTH: 0.54719
G1 X129.783 Y124.664 E.00408
; LINE_WIDTH: 0.595786
G1 X129.881 Y124.682 E.00447
; LINE_WIDTH: 0.644381
G1 X129.979 Y124.699 E.00486
G1 X131.301 Y124.699 E.0648
G1 X131.301 Y125 E.01474
G1 X131.301 Y125.301 E.01474
G1 X129.979 Y125.301 E.0648
G1 X129.875 Y125.368 E.00604
; LINE_WIDTH: 0.595786
G1 X129.772 Y125.436 E.00556
; LINE_WIDTH: 0.54719
G1 X129.669 Y125.503 E.00507
; LINE_WIDTH: 0.498595
G1 X129.566 Y125.57 E.00458
; LINE_WIDTH: 0.449999
G1 X129.481 Y125.679 E.00456
G1 X129.441 Y125.834 E.00533
G1 X129.79 Y125.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.79 Y127.79 E.05566
G1 X128.21 Y127.79 E.04855
G1 X128.21 Y127 E.02427
G1 X128.168 Y126.904 E.00322
G1 X128.136 Y126.832 E.00242
G1 X128.021 Y126.79 E.00376
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.137 Y125.168 E.00377
G1 X128.168 Y125.105 E.00215
G1 X128.21 Y125.021 E.00289
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y125 E.02427
G1 X131.79 Y125.79 E.02427
G1 X129.979 Y125.79 E.05566
G1 X129.878 Y125.832 E.00335
G2 X129.832 Y125.876 I-.001 J.045 E.00218
G1 X129.813 Y125.923 E.00155
M204 S10000
; WIPE_START
G1 F24000
G1 X129.79 Y127.79 E-.7095
G1 X129.657 Y127.79 E-.0505
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I.992 J-.705 P1  F30000
G1 X128.384 Y126 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477178
G1 F1200
G3 X128.875 Y126.48 I-.78 J1.29 E.02451
G1 X129.008 Y125.91 E.02069
; LINE_WIDTH: 0.433393
G1 X129.077 Y125.735 E.00599
; LINE_WIDTH: 0.39381
G3 X129.319 Y125.278 I1.436 J.467 E.01486
G1 X129.618 Y125.049 E.01077
G2 X128.982 Y124.995 I-.872 J6.447 E.01825
G1 X128.961 Y125.194 E.00574
; LINE_WIDTH: 0.39108
G1 X128.66 Y125.757 E.01811
; LINE_WIDTH: 0.433393
G1 X128.429 Y125.96 E.00978
; CHANGE_LAYER
; Z_HEIGHT: 12.4364
; LAYER_HEIGHT: 0.0363636
; WIPE_START
G1 F24000
G1 X128.66 Y125.757 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 99/136
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
G3 Z12.8 I-.468 J1.124 P1  F30000
G1 X130.539 Y126.539 Z12.8
G1 Z12.436
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F1200
G1 X132.223 Y126.539 E.06766
G1 X132.539 Y126.223 E.01792
G1 X132.539 Y126 E.00896
G1 X133.754 Y126 E.04883
G1 X133.754 Y128.877 E.11556
G1 X128 Y128.877 E.23112
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.163637
; WIPE_START
G1 F24000
G1 X130 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 100/136
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
G3 Z12.836 I1.195 J-.23 P1  F30000
G1 X129.426 Y125.893 Z12.836
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X129.398 Y126 E.00368
; LINE_WIDTH: 0.498595
G1 X129.374 Y126.325 E.01211
; LINE_WIDTH: 0.54719
G1 X129.349 Y126.65 E.0134
; LINE_WIDTH: 0.595786
G1 X129.325 Y126.976 E.01469
; LINE_WIDTH: 0.644381
G1 X129.301 Y127.301 E.01598
G1 X128.699 Y127.301 E.02948
G1 X128.699 Y126.979 E.01579
G1 X128.617 Y126.862 E.00698
; LINE_WIDTH: 0.595786
G1 X128.535 Y126.746 E.00641
; LINE_WIDTH: 0.54719
G1 X128.452 Y126.63 E.00585
; LINE_WIDTH: 0.498595
G2 X128.283 Y126.461 I-.283 J.113 E.00915
; LINE_WIDTH: 0.54719
G1 X128.196 Y126.407 E.0042
; LINE_WIDTH: 0.595786
G1 X128.109 Y126.354 E.0046
; LINE_WIDTH: 0.644381
G1 X128.021 Y126.301 E.00501
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.109 Y125.646 E.00501
; LINE_WIDTH: 0.595786
G1 X128.196 Y125.593 E.0046
; LINE_WIDTH: 0.54719
G1 X128.283 Y125.539 E.0042
; LINE_WIDTH: 0.498595
G1 X128.37 Y125.486 E.00379
; LINE_WIDTH: 0.449999
G1 X128.519 Y125.321 E.00737
G1 X128.597 Y125.097 E.00788
G1 X128.602 Y124.602 E.01641
G3 X129.588 Y124.629 I.21 J10.376 E.03272
; LINE_WIDTH: 0.498595
G1 X129.685 Y124.647 E.00369
; LINE_WIDTH: 0.54719
G1 X129.783 Y124.664 E.00408
; LINE_WIDTH: 0.595786
G1 X129.881 Y124.682 E.00447
; LINE_WIDTH: 0.644381
G1 X129.979 Y124.699 E.00486
G1 X131.301 Y124.699 E.0648
G1 X131.301 Y125 E.01474
G1 X131.301 Y125.301 E.01474
G1 X129.979 Y125.301 E.0648
G1 X129.875 Y125.368 E.00604
; LINE_WIDTH: 0.595786
G1 X129.772 Y125.436 E.00556
; LINE_WIDTH: 0.54719
G1 X129.669 Y125.503 E.00507
; LINE_WIDTH: 0.498595
G1 X129.566 Y125.57 E.00458
; LINE_WIDTH: 0.449999
G1 X129.481 Y125.679 E.00456
G1 X129.441 Y125.834 E.00533
G1 X129.79 Y125.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.79 Y127.79 E.05566
G1 X128.21 Y127.79 E.04855
G1 X128.21 Y127 E.02427
G1 X128.168 Y126.904 E.00322
G1 X128.136 Y126.832 E.00242
G1 X128.021 Y126.79 E.00376
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.137 Y125.168 E.00377
G1 X128.168 Y125.105 E.00215
G1 X128.21 Y125.021 E.00289
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y125 E.02427
G1 X131.79 Y125.79 E.02427
G1 X129.979 Y125.79 E.05566
G1 X129.878 Y125.832 E.00335
G2 X129.832 Y125.876 I-.001 J.045 E.00218
G1 X129.813 Y125.923 E.00155
M204 S10000
; WIPE_START
G1 F24000
G1 X129.79 Y127.79 E-.7095
G1 X129.657 Y127.79 E-.0505
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I.992 J-.705 P1  F30000
G1 X128.384 Y126 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477178
G1 F1200
G3 X128.875 Y126.48 I-.78 J1.29 E.02451
G1 X129.008 Y125.91 E.02069
; LINE_WIDTH: 0.433393
G1 X129.077 Y125.735 E.00599
; LINE_WIDTH: 0.39381
G3 X129.319 Y125.278 I1.436 J.467 E.01486
G1 X129.618 Y125.049 E.01077
G2 X128.982 Y124.995 I-.872 J6.447 E.01825
G1 X128.961 Y125.194 E.00574
; LINE_WIDTH: 0.39108
G1 X128.66 Y125.757 E.01811
; LINE_WIDTH: 0.433393
G1 X128.429 Y125.96 E.00978
; CHANGE_LAYER
; Z_HEIGHT: 12.7091
; LAYER_HEIGHT: 0.109091
; WIPE_START
G1 F24000
G1 X128.66 Y125.757 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 101/136
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
G3 Z13 I-.468 J1.124 P1  F30000
G1 X130.539 Y126.539 Z13
G1 Z12.709
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F1200
G1 X132.223 Y126.539 E.06766
G1 X132.539 Y126.223 E.01792
G1 X132.539 Y126 E.00896
G1 X133.754 Y126 E.04883
G1 X133.754 Y128.877 E.11556
M73 P86 R1
G1 X128 Y128.877 E.23112
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.090909
; WIPE_START
G1 F24000
G1 X130 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 102/136
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
G3 Z13.109 I1.195 J-.23 P1  F30000
G1 X129.426 Y125.893 Z13.109
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X129.398 Y126 E.00368
; LINE_WIDTH: 0.498595
G1 X129.374 Y126.325 E.01211
; LINE_WIDTH: 0.54719
G1 X129.349 Y126.65 E.0134
; LINE_WIDTH: 0.595786
G1 X129.325 Y126.976 E.01469
; LINE_WIDTH: 0.644381
G1 X129.301 Y127.301 E.01598
G1 X128.699 Y127.301 E.02948
G1 X128.699 Y126.979 E.01579
G1 X128.617 Y126.862 E.00698
; LINE_WIDTH: 0.595786
G1 X128.535 Y126.746 E.00641
; LINE_WIDTH: 0.54719
G1 X128.452 Y126.63 E.00585
; LINE_WIDTH: 0.498595
G2 X128.283 Y126.461 I-.283 J.113 E.00915
; LINE_WIDTH: 0.54719
G1 X128.196 Y126.407 E.0042
; LINE_WIDTH: 0.595786
G1 X128.109 Y126.354 E.0046
; LINE_WIDTH: 0.644381
G1 X128.021 Y126.301 E.00501
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.109 Y125.646 E.00501
; LINE_WIDTH: 0.595786
G1 X128.196 Y125.593 E.0046
; LINE_WIDTH: 0.54719
G1 X128.283 Y125.539 E.0042
; LINE_WIDTH: 0.498595
G1 X128.37 Y125.486 E.00379
; LINE_WIDTH: 0.449999
G1 X128.519 Y125.321 E.00737
G1 X128.597 Y125.097 E.00788
G1 X128.602 Y124.602 E.01641
G3 X129.588 Y124.629 I.21 J10.376 E.03272
; LINE_WIDTH: 0.498595
G1 X129.685 Y124.647 E.00369
; LINE_WIDTH: 0.54719
G1 X129.783 Y124.664 E.00408
; LINE_WIDTH: 0.595786
G1 X129.881 Y124.682 E.00447
; LINE_WIDTH: 0.644381
G1 X129.979 Y124.699 E.00486
G1 X131.301 Y124.699 E.0648
G1 X131.301 Y125 E.01474
G1 X131.301 Y125.301 E.01474
G1 X129.979 Y125.301 E.0648
G1 X129.875 Y125.368 E.00604
; LINE_WIDTH: 0.595786
G1 X129.772 Y125.436 E.00556
; LINE_WIDTH: 0.54719
G1 X129.669 Y125.503 E.00507
; LINE_WIDTH: 0.498595
G1 X129.566 Y125.57 E.00458
; LINE_WIDTH: 0.449999
G1 X129.481 Y125.679 E.00456
G1 X129.441 Y125.834 E.00533
G1 X129.79 Y125.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.79 Y127.79 E.05566
G1 X128.21 Y127.79 E.04855
G1 X128.21 Y127 E.02427
G1 X128.168 Y126.904 E.00322
G1 X128.136 Y126.832 E.00242
G1 X128.021 Y126.79 E.00376
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.137 Y125.168 E.00377
G1 X128.168 Y125.105 E.00215
G1 X128.21 Y125.021 E.00289
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y125 E.02427
G1 X131.79 Y125.79 E.02427
G1 X129.979 Y125.79 E.05566
G1 X129.878 Y125.832 E.00335
G2 X129.832 Y125.876 I-.001 J.045 E.00218
G1 X129.813 Y125.923 E.00155
M204 S10000
; WIPE_START
G1 F24000
G1 X129.79 Y127.79 E-.7095
G1 X129.657 Y127.79 E-.0505
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I.992 J-.705 P1  F30000
G1 X128.384 Y126 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477178
G1 F1200
G3 X128.875 Y126.48 I-.78 J1.29 E.02451
G1 X129.008 Y125.91 E.02069
; LINE_WIDTH: 0.433393
G1 X129.077 Y125.735 E.00599
; LINE_WIDTH: 0.39381
G3 X129.319 Y125.278 I1.436 J.467 E.01486
G1 X129.618 Y125.049 E.01077
G2 X128.982 Y124.995 I-.872 J6.447 E.01825
G1 X128.961 Y125.194 E.00574
; LINE_WIDTH: 0.39108
G1 X128.66 Y125.757 E.01811
; LINE_WIDTH: 0.433393
G1 X128.429 Y125.96 E.00978
; CHANGE_LAYER
; Z_HEIGHT: 12.9818
; LAYER_HEIGHT: 0.181818
; WIPE_START
G1 F24000
G1 X128.66 Y125.757 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 103/136
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
G3 Z13.2 I-.468 J1.124 P1  F30000
G1 X130.539 Y126.539 Z13.2
G1 Z12.982
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F1200
G1 X132.223 Y126.539 E.06766
G1 X132.539 Y126.223 E.01792
G1 X132.539 Y126 E.00896
G1 X133.754 Y126 E.04883
G1 X133.754 Y128.877 E.11556
G1 X128 Y128.877 E.23112
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.0181818
; WIPE_START
G1 F24000
G1 X130 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 104/136
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
G3 Z13.382 I1.195 J-.23 P1  F30000
G1 X129.426 Y125.893 Z13.382
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X129.398 Y126 E.00368
; LINE_WIDTH: 0.498595
G1 X129.374 Y126.325 E.01211
; LINE_WIDTH: 0.54719
G1 X129.349 Y126.65 E.0134
; LINE_WIDTH: 0.595786
G1 X129.325 Y126.976 E.01469
; LINE_WIDTH: 0.644381
G1 X129.301 Y127.301 E.01598
G1 X128.699 Y127.301 E.02948
G1 X128.699 Y126.979 E.01579
G1 X128.617 Y126.862 E.00698
; LINE_WIDTH: 0.595786
G1 X128.535 Y126.746 E.00641
; LINE_WIDTH: 0.54719
G1 X128.452 Y126.63 E.00585
; LINE_WIDTH: 0.498595
G2 X128.283 Y126.461 I-.283 J.113 E.00915
; LINE_WIDTH: 0.54719
G1 X128.196 Y126.407 E.0042
; LINE_WIDTH: 0.595786
G1 X128.109 Y126.354 E.0046
; LINE_WIDTH: 0.644381
G1 X128.021 Y126.301 E.00501
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.109 Y125.646 E.00501
; LINE_WIDTH: 0.595786
G1 X128.196 Y125.593 E.0046
; LINE_WIDTH: 0.54719
G1 X128.283 Y125.539 E.0042
; LINE_WIDTH: 0.498595
G1 X128.37 Y125.486 E.00379
; LINE_WIDTH: 0.449999
G1 X128.519 Y125.321 E.00737
G1 X128.597 Y125.097 E.00788
G1 X128.602 Y124.602 E.01641
G3 X129.588 Y124.629 I.21 J10.376 E.03272
; LINE_WIDTH: 0.498595
G1 X129.685 Y124.647 E.00369
; LINE_WIDTH: 0.54719
G1 X129.783 Y124.664 E.00408
; LINE_WIDTH: 0.595786
G1 X129.881 Y124.682 E.00447
; LINE_WIDTH: 0.644381
G1 X129.979 Y124.699 E.00486
G1 X131.301 Y124.699 E.0648
G1 X131.301 Y125 E.01474
G1 X131.301 Y125.301 E.01474
G1 X129.979 Y125.301 E.0648
G1 X129.875 Y125.368 E.00604
; LINE_WIDTH: 0.595786
G1 X129.772 Y125.436 E.00556
; LINE_WIDTH: 0.54719
G1 X129.669 Y125.503 E.00507
; LINE_WIDTH: 0.498595
G1 X129.566 Y125.57 E.00458
; LINE_WIDTH: 0.449999
G1 X129.481 Y125.679 E.00456
G1 X129.441 Y125.834 E.00533
G1 X129.79 Y125.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.79 Y127.79 E.05566
G1 X128.21 Y127.79 E.04855
G1 X128.21 Y127 E.02427
G1 X128.168 Y126.904 E.00322
G1 X128.136 Y126.832 E.00242
G1 X128.021 Y126.79 E.00376
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.137 Y125.168 E.00377
G1 X128.168 Y125.105 E.00215
G1 X128.21 Y125.021 E.00289
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y125 E.02427
G1 X131.79 Y125.79 E.02427
G1 X129.979 Y125.79 E.05566
G1 X129.878 Y125.832 E.00335
G2 X129.832 Y125.876 I-.001 J.045 E.00218
G1 X129.813 Y125.923 E.00155
M204 S10000
; WIPE_START
G1 F24000
G1 X129.79 Y127.79 E-.7095
G1 X129.657 Y127.79 E-.0505
; WIPE_END
G1 E-.04 F1800
G17
M73 P87 R1
G3 Z13.4 I.992 J-.705 P1  F30000
G1 X128.384 Y126 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477178
G1 F1200
G3 X128.875 Y126.48 I-.78 J1.29 E.02451
G1 X129.008 Y125.91 E.02069
; LINE_WIDTH: 0.433393
G1 X129.077 Y125.735 E.00599
; LINE_WIDTH: 0.39381
G3 X129.319 Y125.278 I1.436 J.467 E.01486
G1 X129.618 Y125.049 E.01077
G2 X128.982 Y124.995 I-.872 J6.447 E.01825
G1 X128.961 Y125.194 E.00574
; LINE_WIDTH: 0.39108
G1 X128.66 Y125.757 E.01811
; LINE_WIDTH: 0.433393
G1 X128.429 Y125.96 E.00978
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.66 Y125.757 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 105/136
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
G3 Z13.4 I-.212 J1.198 P1  F30000
G1 X129.426 Y125.893 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1200
G1 X129.398 Y126 E.00368
; LINE_WIDTH: 0.498595
G1 X129.374 Y126.325 E.01211
; LINE_WIDTH: 0.54719
G1 X129.349 Y126.65 E.0134
; LINE_WIDTH: 0.595786
G1 X129.325 Y126.976 E.01469
; LINE_WIDTH: 0.644381
G1 X129.301 Y127.301 E.01598
G1 X128.699 Y127.301 E.02948
G1 X128.699 Y126.979 E.01579
G1 X128.617 Y126.862 E.00698
; LINE_WIDTH: 0.595786
G1 X128.535 Y126.746 E.00641
; LINE_WIDTH: 0.54719
G1 X128.452 Y126.63 E.00585
; LINE_WIDTH: 0.498595
G2 X128.283 Y126.461 I-.283 J.113 E.00915
; LINE_WIDTH: 0.54719
G1 X128.196 Y126.407 E.0042
; LINE_WIDTH: 0.595786
G1 X128.109 Y126.354 E.0046
; LINE_WIDTH: 0.644381
G1 X128.021 Y126.301 E.00501
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.109 Y125.646 E.00501
; LINE_WIDTH: 0.595786
G1 X128.196 Y125.593 E.0046
; LINE_WIDTH: 0.54719
G1 X128.283 Y125.539 E.0042
; LINE_WIDTH: 0.498595
G1 X128.37 Y125.486 E.00379
; LINE_WIDTH: 0.449999
G1 X128.519 Y125.321 E.00737
G1 X128.597 Y125.097 E.00788
G1 X128.602 Y124.602 E.01641
G3 X129.588 Y124.629 I.21 J10.376 E.03272
; LINE_WIDTH: 0.498595
G1 X129.685 Y124.647 E.00369
; LINE_WIDTH: 0.54719
G1 X129.783 Y124.664 E.00408
; LINE_WIDTH: 0.595786
G1 X129.881 Y124.682 E.00447
; LINE_WIDTH: 0.644381
G1 X129.979 Y124.699 E.00486
G1 X131.301 Y124.699 E.0648
G1 X131.301 Y125 E.01474
G1 X131.301 Y125.301 E.01474
G1 X129.979 Y125.301 E.0648
G1 X129.875 Y125.368 E.00604
; LINE_WIDTH: 0.595786
G1 X129.772 Y125.436 E.00556
; LINE_WIDTH: 0.54719
G1 X129.669 Y125.503 E.00507
; LINE_WIDTH: 0.498595
G1 X129.566 Y125.57 E.00458
; LINE_WIDTH: 0.449999
G1 X129.481 Y125.679 E.00456
G1 X129.441 Y125.834 E.00533
G1 X129.79 Y125.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.79 Y127.79 E.05566
G1 X128.21 Y127.79 E.04855
G1 X128.21 Y127 E.02427
G1 X128.168 Y126.904 E.00322
G1 X128.136 Y126.832 E.00242
G1 X128.021 Y126.79 E.00376
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.137 Y125.168 E.00377
G1 X128.168 Y125.105 E.00215
G1 X128.21 Y125.021 E.00289
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y125 E.02427
G1 X131.79 Y125.79 E.02427
G1 X129.979 Y125.79 E.05566
G1 X129.878 Y125.832 E.00335
G2 X129.832 Y125.876 I-.001 J.045 E.00218
G1 X129.813 Y125.923 E.00155
M204 S10000
; WIPE_START
G1 F24000
G1 X129.79 Y127.79 E-.7095
G1 X129.657 Y127.79 E-.0505
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I.992 J-.705 P1  F30000
G1 X128.384 Y126 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477178
G1 F1200
G3 X128.875 Y126.48 I-.78 J1.29 E.02451
G1 X129.008 Y125.91 E.02069
; LINE_WIDTH: 0.433393
G1 X129.077 Y125.735 E.00599
; LINE_WIDTH: 0.39381
G3 X129.319 Y125.278 I1.436 J.467 E.01486
G1 X129.618 Y125.049 E.01077
G2 X128.982 Y124.995 I-.872 J6.447 E.01825
G1 X128.961 Y125.194 E.00574
; LINE_WIDTH: 0.39108
G1 X128.66 Y125.757 E.01811
; LINE_WIDTH: 0.433393
G1 X128.429 Y125.96 E.00978
; CHANGE_LAYER
; Z_HEIGHT: 13.2545
; LAYER_HEIGHT: 0.0545454
; WIPE_START
G1 F24000
G1 X128.66 Y125.757 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 106/136
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
G3 Z13.6 I-.468 J1.124 P1  F30000
G1 X130.539 Y126.539 Z13.6
G1 Z13.255
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F1200
G1 X132.223 Y126.539 E.06766
G1 X132.539 Y126.223 E.01792
G1 X132.539 Y126 E.00896
G1 X133.754 Y126 E.04883
G1 X133.754 Y128.877 E.11556
G1 X128 Y128.877 E.23112
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.145454
; WIPE_START
G1 F24000
G1 X130 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 107/136
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
G3 Z13.655 I1.195 J-.23 P1  F30000
G1 X129.426 Y125.893 Z13.655
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X129.398 Y126 E.00368
; LINE_WIDTH: 0.498595
G1 X129.374 Y126.325 E.01211
; LINE_WIDTH: 0.54719
G1 X129.349 Y126.65 E.0134
; LINE_WIDTH: 0.595786
G1 X129.325 Y126.976 E.01469
; LINE_WIDTH: 0.644381
G1 X129.301 Y127.301 E.01598
G1 X128.699 Y127.301 E.02948
G1 X128.699 Y126.979 E.01579
G1 X128.617 Y126.862 E.00698
; LINE_WIDTH: 0.595786
G1 X128.535 Y126.746 E.00641
; LINE_WIDTH: 0.54719
G1 X128.452 Y126.63 E.00585
; LINE_WIDTH: 0.498595
G2 X128.283 Y126.461 I-.283 J.113 E.00915
; LINE_WIDTH: 0.54719
G1 X128.196 Y126.407 E.0042
; LINE_WIDTH: 0.595786
G1 X128.109 Y126.354 E.0046
; LINE_WIDTH: 0.644381
G1 X128.021 Y126.301 E.00501
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.109 Y125.646 E.00501
; LINE_WIDTH: 0.595786
G1 X128.196 Y125.593 E.0046
; LINE_WIDTH: 0.54719
G1 X128.283 Y125.539 E.0042
; LINE_WIDTH: 0.498595
G1 X128.37 Y125.486 E.00379
; LINE_WIDTH: 0.449999
G1 X128.519 Y125.321 E.00737
G1 X128.597 Y125.097 E.00788
G1 X128.602 Y124.602 E.01641
G3 X129.588 Y124.629 I.21 J10.376 E.03272
; LINE_WIDTH: 0.498595
G1 X129.685 Y124.647 E.00369
; LINE_WIDTH: 0.54719
G1 X129.783 Y124.664 E.00408
; LINE_WIDTH: 0.595786
G1 X129.881 Y124.682 E.00447
; LINE_WIDTH: 0.644381
G1 X129.979 Y124.699 E.00486
G1 X131.301 Y124.699 E.0648
G1 X131.301 Y125 E.01474
G1 X131.301 Y125.301 E.01474
G1 X129.979 Y125.301 E.0648
G1 X129.875 Y125.368 E.00604
; LINE_WIDTH: 0.595786
G1 X129.772 Y125.436 E.00556
; LINE_WIDTH: 0.54719
G1 X129.669 Y125.503 E.00507
; LINE_WIDTH: 0.498595
G1 X129.566 Y125.57 E.00458
; LINE_WIDTH: 0.449999
G1 X129.481 Y125.679 E.00456
G1 X129.441 Y125.834 E.00533
G1 X129.79 Y125.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.79 Y127.79 E.05566
G1 X128.21 Y127.79 E.04855
G1 X128.21 Y127 E.02427
G1 X128.168 Y126.904 E.00322
G1 X128.136 Y126.832 E.00242
G1 X128.021 Y126.79 E.00376
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.137 Y125.168 E.00377
G1 X128.168 Y125.105 E.00215
G1 X128.21 Y125.021 E.00289
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y125 E.02427
G1 X131.79 Y125.79 E.02427
G1 X129.979 Y125.79 E.05566
G1 X129.878 Y125.832 E.00335
G2 X129.832 Y125.876 I-.001 J.045 E.00218
G1 X129.813 Y125.923 E.00155
M204 S10000
; WIPE_START
G1 F24000
G1 X129.79 Y127.79 E-.7095
G1 X129.657 Y127.79 E-.0505
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I.992 J-.705 P1  F30000
M73 P88 R1
G1 X128.384 Y126 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477178
G1 F1200
G3 X128.875 Y126.48 I-.78 J1.29 E.02451
G1 X129.008 Y125.91 E.02069
; LINE_WIDTH: 0.433393
G1 X129.077 Y125.735 E.00599
; LINE_WIDTH: 0.39381
G3 X129.319 Y125.278 I1.436 J.467 E.01486
G1 X129.618 Y125.049 E.01077
G2 X128.982 Y124.995 I-.872 J6.447 E.01825
G1 X128.961 Y125.194 E.00574
; LINE_WIDTH: 0.39108
G1 X128.66 Y125.757 E.01811
; LINE_WIDTH: 0.433393
G1 X128.429 Y125.96 E.00978
; CHANGE_LAYER
; Z_HEIGHT: 13.5273
; LAYER_HEIGHT: 0.127274
; WIPE_START
G1 F24000
G1 X128.66 Y125.757 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 108/136
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
G3 Z13.8 I-.449 J1.131 P1  F30000
G1 X130.631 Y126.539 Z13.8
G1 Z13.527
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F1200
G1 X130.631 Y128.877 E.09393
G1 X131.508 Y128.877 E.03523
G1 X131.508 Y126.539 E.09393
G1 X132.223 Y126.539 E.02871
G1 X132.385 Y126.376 E.00922
G1 X132.385 Y128.877 E.10045
G1 X133.262 Y128.877 E.03523
G1 X133.262 Y126 E.11556
G1 X133.754 Y126 E.01975
G1 X133.754 Y128.877 E.11556
G1 X133.451 Y128.877 E.01218
; WIPE_START
G1 F24000
G1 X133.754 Y128.877 E-.1152
G1 X133.754 Y127.18 E-.6448
; WIPE_END
G1 E-.04 F1800
G1 X130.372 Y128.39 Z13.927 F30000
G1 Z13.527
G1 E.8 F1800
G1 F1200
G1 X130.223 Y128.539 E.00844
G1 X129.754 Y128.539 E.01883
G1 X129.754 Y128.877 E.0136
G1 X128.877 Y128.877 E.03523
G1 X128.877 Y128.539 E.0136
G1 X128 Y128.539 E.03523
G1 X128 Y128.877 E.0136
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.0727272
; WIPE_START
G1 F24000
G1 X128 Y128.539 E-.12866
G1 X128.877 Y128.539 E-.33329
G1 X128.877 Y128.877 E-.12866
G1 X129.323 Y128.877 E-.1694
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 109/136
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
G3 Z13.927 I1.216 J.042 P1  F30000
G1 X129.426 Y125.893 Z13.927
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X129.398 Y126 E.00368
; LINE_WIDTH: 0.498595
G1 X129.374 Y126.325 E.01211
; LINE_WIDTH: 0.54719
G1 X129.349 Y126.65 E.0134
; LINE_WIDTH: 0.595786
G1 X129.325 Y126.976 E.01469
; LINE_WIDTH: 0.644381
G1 X129.301 Y127.301 E.01598
G1 X128.699 Y127.301 E.02948
G1 X128.699 Y126.979 E.01579
G1 X128.617 Y126.862 E.00698
; LINE_WIDTH: 0.595786
G1 X128.535 Y126.746 E.00641
; LINE_WIDTH: 0.54719
G1 X128.452 Y126.63 E.00585
; LINE_WIDTH: 0.498595
G2 X128.283 Y126.461 I-.283 J.113 E.00915
; LINE_WIDTH: 0.54719
G1 X128.196 Y126.407 E.0042
; LINE_WIDTH: 0.595786
G1 X128.109 Y126.354 E.0046
; LINE_WIDTH: 0.644381
G1 X128.021 Y126.301 E.00501
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.109 Y125.646 E.00501
; LINE_WIDTH: 0.595786
G1 X128.196 Y125.593 E.0046
; LINE_WIDTH: 0.54719
G1 X128.283 Y125.539 E.0042
; LINE_WIDTH: 0.498595
G1 X128.37 Y125.486 E.00379
; LINE_WIDTH: 0.449999
G1 X128.519 Y125.321 E.00737
G1 X128.597 Y125.097 E.00788
G1 X128.602 Y124.602 E.01641
G3 X129.588 Y124.629 I.21 J10.376 E.03272
; LINE_WIDTH: 0.498595
G1 X129.685 Y124.647 E.00369
; LINE_WIDTH: 0.54719
G1 X129.783 Y124.664 E.00408
; LINE_WIDTH: 0.595786
G1 X129.881 Y124.682 E.00447
; LINE_WIDTH: 0.644381
G1 X129.979 Y124.699 E.00486
G1 X131.301 Y124.699 E.0648
G1 X131.301 Y125 E.01474
G1 X131.301 Y125.301 E.01474
G1 X129.979 Y125.301 E.0648
G1 X129.875 Y125.368 E.00604
; LINE_WIDTH: 0.595786
G1 X129.772 Y125.436 E.00556
; LINE_WIDTH: 0.54719
G1 X129.669 Y125.503 E.00507
; LINE_WIDTH: 0.498595
G1 X129.566 Y125.57 E.00458
; LINE_WIDTH: 0.449999
G1 X129.481 Y125.679 E.00456
G1 X129.441 Y125.834 E.00533
G1 X129.79 Y125.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.79 Y127.79 E.05566
G1 X128.21 Y127.79 E.04855
G1 X128.21 Y127 E.02427
G1 X128.168 Y126.904 E.00322
G1 X128.136 Y126.832 E.00242
G1 X128.021 Y126.79 E.00376
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.137 Y125.168 E.00377
G1 X128.168 Y125.105 E.00215
G1 X128.21 Y125.021 E.00289
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y125 E.02427
G1 X131.79 Y125.79 E.02427
G1 X129.979 Y125.79 E.05566
G1 X129.878 Y125.832 E.00335
G2 X129.832 Y125.876 I-.001 J.045 E.00218
G1 X129.813 Y125.923 E.00155
M204 S10000
; WIPE_START
G1 F24000
G1 X129.79 Y127.79 E-.7095
G1 X129.657 Y127.79 E-.0505
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I.992 J-.705 P1  F30000
G1 X128.384 Y126 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477178
G1 F1200
G3 X128.875 Y126.48 I-.78 J1.29 E.02451
G1 X129.008 Y125.91 E.02069
; LINE_WIDTH: 0.433393
G1 X129.077 Y125.735 E.00599
; LINE_WIDTH: 0.39381
G3 X129.319 Y125.278 I1.436 J.467 E.01486
G1 X129.618 Y125.049 E.01077
G2 X128.982 Y124.995 I-.872 J6.447 E.01825
G1 X128.961 Y125.194 E.00574
; LINE_WIDTH: 0.39108
G1 X128.66 Y125.757 E.01811
; LINE_WIDTH: 0.433393
G1 X128.429 Y125.96 E.00978
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.66 Y125.757 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 110/136
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
G3 Z14 I-1.215 J-.075 P1  F30000
G1 X128.466 Y128.877 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F1200
G1 X128 Y128.877 E.01873
G1 X128 Y128.631 E.00988
G1 X133.754 Y128.631 E.23113
G1 X133.754 Y127.754 E.03523
G1 X130.539 Y127.754 E.12916
G1 X130.539 Y126.877 E.03523
G1 X133.754 Y126.877 E.12916
G1 X133.754 Y126 E.03523
G1 X132.539 Y126 E.04883
; WIPE_START
G1 F24000
G1 X133.754 Y126 E-.46195
G1 X133.754 Y126.784 E-.29805
; WIPE_END
G1 E-.04 F1800
G1 X129.426 Y125.893 Z14.2 F30000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X129.398 Y126 E.00368
; LINE_WIDTH: 0.498595
G1 X129.374 Y126.325 E.01211
; LINE_WIDTH: 0.54719
G1 X129.349 Y126.65 E.0134
; LINE_WIDTH: 0.595786
G1 X129.325 Y126.976 E.01469
; LINE_WIDTH: 0.644381
G1 X129.301 Y127.301 E.01598
G1 X128.699 Y127.301 E.02948
G1 X128.699 Y126.979 E.01579
G1 X128.617 Y126.862 E.00698
; LINE_WIDTH: 0.595786
G1 X128.535 Y126.746 E.00641
; LINE_WIDTH: 0.54719
G1 X128.452 Y126.63 E.00585
; LINE_WIDTH: 0.498595
G2 X128.283 Y126.461 I-.283 J.113 E.00915
; LINE_WIDTH: 0.54719
G1 X128.196 Y126.407 E.0042
; LINE_WIDTH: 0.595786
G1 X128.109 Y126.354 E.0046
; LINE_WIDTH: 0.644381
G1 X128.021 Y126.301 E.00501
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.109 Y125.646 E.00501
; LINE_WIDTH: 0.595786
G1 X128.196 Y125.593 E.0046
; LINE_WIDTH: 0.54719
G1 X128.283 Y125.539 E.0042
; LINE_WIDTH: 0.498595
G1 X128.37 Y125.486 E.00379
; LINE_WIDTH: 0.449999
G1 X128.519 Y125.321 E.00737
G1 X128.597 Y125.097 E.00788
G1 X128.602 Y124.602 E.01641
G3 X129.588 Y124.629 I.21 J10.376 E.03272
; LINE_WIDTH: 0.498595
G1 X129.685 Y124.647 E.00369
; LINE_WIDTH: 0.54719
G1 X129.783 Y124.664 E.00408
; LINE_WIDTH: 0.595786
G1 X129.881 Y124.682 E.00447
; LINE_WIDTH: 0.644381
G1 X129.979 Y124.699 E.00486
M73 P89 R1
G1 X131.301 Y124.699 E.0648
G1 X131.301 Y125 E.01474
G1 X131.301 Y125.301 E.01474
G1 X129.979 Y125.301 E.0648
G1 X129.875 Y125.368 E.00604
; LINE_WIDTH: 0.595786
G1 X129.772 Y125.436 E.00556
; LINE_WIDTH: 0.54719
G1 X129.669 Y125.503 E.00507
; LINE_WIDTH: 0.498595
G1 X129.566 Y125.57 E.00458
; LINE_WIDTH: 0.449999
G1 X129.481 Y125.679 E.00456
G1 X129.441 Y125.834 E.00533
G1 X129.79 Y125.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.79 Y127.79 E.05566
G1 X128.21 Y127.79 E.04855
G1 X128.21 Y127 E.02427
G1 X128.168 Y126.904 E.00322
G1 X128.136 Y126.832 E.00242
G1 X128.021 Y126.79 E.00376
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.137 Y125.168 E.00377
G1 X128.168 Y125.105 E.00215
G1 X128.21 Y125.021 E.00289
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y125 E.02427
G1 X131.79 Y125.79 E.02427
G1 X129.979 Y125.79 E.05566
G1 X129.878 Y125.832 E.00335
G2 X129.832 Y125.876 I-.001 J.045 E.00218
G1 X129.813 Y125.923 E.00155
M204 S10000
; WIPE_START
G1 F24000
G1 X129.79 Y127.79 E-.7095
G1 X129.657 Y127.79 E-.0505
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I.992 J-.705 P1  F30000
G1 X128.384 Y126 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477178
G1 F1200
G3 X128.875 Y126.48 I-.78 J1.29 E.02451
G1 X129.008 Y125.91 E.02069
; LINE_WIDTH: 0.433393
G1 X129.077 Y125.735 E.00599
; LINE_WIDTH: 0.39381
G3 X129.319 Y125.278 I1.436 J.467 E.01486
G1 X129.618 Y125.049 E.01077
G2 X128.982 Y124.995 I-.872 J6.447 E.01825
G1 X128.961 Y125.194 E.00574
; LINE_WIDTH: 0.39108
G1 X128.66 Y125.757 E.01811
; LINE_WIDTH: 0.433393
G1 X128.429 Y125.96 E.00978
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.66 Y125.757 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 111/136
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
G3 Z14.2 I-.212 J1.198 P1  F30000
G1 X129.426 Y125.893 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1200
G1 X129.398 Y126 E.00368
; LINE_WIDTH: 0.498595
G1 X129.374 Y126.325 E.01211
; LINE_WIDTH: 0.54719
G1 X129.349 Y126.65 E.0134
; LINE_WIDTH: 0.595786
G1 X129.325 Y126.976 E.01469
; LINE_WIDTH: 0.644381
G1 X129.301 Y127.301 E.01598
G1 X128.699 Y127.301 E.02948
G1 X128.699 Y126.979 E.01579
G1 X128.617 Y126.862 E.00698
; LINE_WIDTH: 0.595786
G1 X128.535 Y126.746 E.00641
; LINE_WIDTH: 0.54719
G1 X128.452 Y126.63 E.00585
; LINE_WIDTH: 0.498595
G2 X128.283 Y126.461 I-.283 J.113 E.00915
; LINE_WIDTH: 0.54719
G1 X128.196 Y126.407 E.0042
; LINE_WIDTH: 0.595786
G1 X128.109 Y126.354 E.0046
; LINE_WIDTH: 0.644381
G1 X128.021 Y126.301 E.00501
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.109 Y125.646 E.00501
; LINE_WIDTH: 0.595786
G1 X128.196 Y125.593 E.0046
; LINE_WIDTH: 0.54719
G1 X128.283 Y125.539 E.0042
; LINE_WIDTH: 0.498595
G1 X128.37 Y125.486 E.00379
; LINE_WIDTH: 0.449999
G1 X128.519 Y125.321 E.00737
G1 X128.597 Y125.097 E.00788
G1 X128.602 Y124.602 E.01641
G3 X129.588 Y124.629 I.21 J10.376 E.03272
; LINE_WIDTH: 0.498595
G1 X129.685 Y124.647 E.00369
; LINE_WIDTH: 0.54719
G1 X129.783 Y124.664 E.00408
; LINE_WIDTH: 0.595786
G1 X129.881 Y124.682 E.00447
; LINE_WIDTH: 0.644381
G1 X129.979 Y124.699 E.00486
G1 X131.301 Y124.699 E.0648
G1 X131.301 Y125 E.01474
G1 X131.301 Y125.301 E.01474
G1 X129.979 Y125.301 E.0648
G1 X129.875 Y125.368 E.00604
; LINE_WIDTH: 0.595786
G1 X129.772 Y125.436 E.00556
; LINE_WIDTH: 0.54719
G1 X129.669 Y125.503 E.00507
; LINE_WIDTH: 0.498595
G1 X129.566 Y125.57 E.00458
; LINE_WIDTH: 0.449999
G1 X129.481 Y125.679 E.00456
G1 X129.441 Y125.834 E.00533
G1 X129.79 Y125.979 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.79 Y127.79 E.05566
G1 X128.21 Y127.79 E.04855
G1 X128.21 Y127 E.02427
G1 X128.168 Y126.904 E.00322
G1 X128.136 Y126.832 E.00242
G1 X128.021 Y126.79 E.00376
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.137 Y125.168 E.00377
G1 X128.168 Y125.105 E.00215
G1 X128.21 Y125.021 E.00289
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y125 E.02427
G1 X131.79 Y125.79 E.02427
G1 X129.979 Y125.79 E.05566
G1 X129.878 Y125.832 E.00335
G2 X129.832 Y125.876 I-.001 J.045 E.00218
G1 X129.813 Y125.923 E.00155
M204 S10000
; WIPE_START
G1 F24000
G1 X129.79 Y127.79 E-.7095
G1 X129.657 Y127.79 E-.0505
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I.992 J-.705 P1  F30000
G1 X128.384 Y126 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477178
G1 F1200
G3 X128.875 Y126.48 I-.78 J1.29 E.02451
G1 X129.008 Y125.91 E.02069
; LINE_WIDTH: 0.433393
G1 X129.077 Y125.735 E.00599
; LINE_WIDTH: 0.39381
G3 X129.319 Y125.278 I1.436 J.467 E.01486
G1 X129.618 Y125.049 E.01077
G2 X128.982 Y124.995 I-.872 J6.447 E.01825
G1 X128.961 Y125.194 E.00574
; LINE_WIDTH: 0.39108
G1 X128.66 Y125.757 E.01811
; LINE_WIDTH: 0.433393
G1 X128.429 Y125.96 E.00978
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.66 Y125.757 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 112/136
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
G3 Z14.4 I-1.203 J-.183 P1  F30000
G1 X128.519 Y126.682 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1200
G1 X128.405 Y126.542 E.00598
; LINE_WIDTH: 0.498595
G1 X128.309 Y126.482 E.00421
; LINE_WIDTH: 0.54719
G1 X128.213 Y126.422 E.00465
; LINE_WIDTH: 0.595786
G1 X128.117 Y126.361 E.0051
; LINE_WIDTH: 0.644381
G1 X128.021 Y126.301 E.00555
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.117 Y125.639 E.00555
; LINE_WIDTH: 0.595786
G1 X128.213 Y125.578 E.0051
; LINE_WIDTH: 0.54719
G1 X128.309 Y125.518 E.00465
; LINE_WIDTH: 0.498595
G1 X128.405 Y125.458 E.00421
; LINE_WIDTH: 0.449999
G1 X128.526 Y125.309 E.00638
G1 X128.602 Y125.021 E.00985
G1 X128.602 Y124.602 E.01391
G1 X131.398 Y124.602 E.09274
G1 X131.398 Y125.82 E.0404
G1 X131.398 Y125.91 E.00299
G1 X131.398 Y126 E.00299
G1 X131.398 Y126.09 E.00299
G1 X131.398 Y126.18 E.00299
G1 X131.398 Y126.2 E.00066
M204 S5000
; FEATURE: Overhang wall
G1 F3000
G1 X131.398 Y127.398 E.03974
G1 X130.2 Y127.398 E.03974
M204 S10000
; FEATURE: Inner wall
G1 F1200
G1 X130.18 Y127.398 E.00066
G1 X130.09 Y127.398 E.00299
G1 X130 Y127.398 E.00299
G1 X129.91 Y127.398 E.00299
G1 X129.82 Y127.398 E.00299
G1 X128.602 Y127.398 E.0404
G1 X128.602 Y126.979 E.01391
G1 X128.538 Y126.738 E.00826
G1 X128.185 Y126.885 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X128.168 Y126.875 E.00062
G1 X128.094 Y126.832 E.00264
G1 X128.021 Y126.79 E.00257
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.133 Y125.168 E.00366
G1 X128.168 Y125.114 E.00197
G1 X128.21 Y125.021 E.00313
G1 X128.21 Y124.21 E.02493
M73 P90 R1
G1 X131.79 Y124.21 E.11
G1 X131.79 Y125.832 E.04984
G1 X131.79 Y125.916 E.00258
G1 X131.79 Y126 E.00258
G1 X131.79 Y126.084 E.00258
G1 X131.79 Y126.168 E.00258
G1 X131.79 Y126.2 E.00098
; FEATURE: Overhang wall
G1 F3000
G1 X131.79 Y127.79 E.04886
G1 X130.2 Y127.79 E.04886
; FEATURE: Outer wall
G1 F1200
G1 X130.168 Y127.79 E.00098
G1 X130.084 Y127.79 E.00258
G1 X130 Y127.79 E.00258
G1 X129.916 Y127.79 E.00258
G1 X129.832 Y127.79 E.00258
G1 X128.21 Y127.79 E.04984
G1 X128.187 Y126.945 E.02597
M204 S10000
G1 X128.34 Y126 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.429567
G1 F1200
G1 X128.687 Y126.269 E.01385
G1 X128.849 Y126.467 E.00805
G3 X128.862 Y125.532 I10.271 J-.322 E.02946
G3 X128.387 Y125.964 I-1.848 J-1.556 E.02027
G1 X128.899 Y125.461 F30000
; LINE_WIDTH: 0.447802
G1 F1200
G1 X129.218 Y125.206 E.01348
; LINE_WIDTH: 0.407353
G1 X129.537 Y124.951 E.01213
G1 X129.605 Y124.924 E.00219
; LINE_WIDTH: 0.377046
G3 X128.962 Y124.962 I-.572 J-4.163 E.01756
; LINE_WIDTH: 0.356185
G1 X128.934 Y125.182 E.00565
; LINE_WIDTH: 0.401994
G1 X128.906 Y125.402 E.00648
G1 X129.262 Y125.431 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.48601
G1 F3000
G1 X129.262 Y127.067 E.05907
G1 X129.705 Y127.067 E.016
G1 X129.705 Y125.229 E.06638
G1 X130.148 Y125.229 E.016
G1 X130.148 Y127.067 E.06638
G1 X130.591 Y127.067 E.016
G1 X130.591 Y125.229 E.06638
G1 X131.034 Y125.229 E.016
G1 X131.034 Y127.237 E.0725
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.034 Y125.237 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 113/136
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
M73 P90 R0
G3 Z14.6 I-.606 J-1.055 P1  F30000
G1 X128.519 Y126.682 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1200
G1 X128.405 Y126.542 E.00598
; LINE_WIDTH: 0.498595
G1 X128.309 Y126.482 E.00421
; LINE_WIDTH: 0.54719
G1 X128.213 Y126.422 E.00465
; LINE_WIDTH: 0.595786
G1 X128.117 Y126.361 E.0051
; LINE_WIDTH: 0.644381
G1 X128.021 Y126.301 E.00555
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.117 Y125.639 E.00555
; LINE_WIDTH: 0.595786
G1 X128.213 Y125.578 E.0051
; LINE_WIDTH: 0.54719
G1 X128.309 Y125.518 E.00465
; LINE_WIDTH: 0.498595
G1 X128.405 Y125.458 E.00421
; LINE_WIDTH: 0.449999
G1 X128.526 Y125.309 E.00638
G1 X128.602 Y125.021 E.00985
G1 X128.602 Y124.602 E.01391
G1 X131.398 Y124.602 E.09274
G1 X131.398 Y127.398 E.09274
G1 X128.602 Y127.398 E.09274
G1 X128.602 Y126.979 E.01391
G1 X128.538 Y126.738 E.00826
G1 X128.185 Y126.885 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X128.168 Y126.875 E.00062
G1 X128.094 Y126.832 E.00264
G1 X128.021 Y126.79 E.00257
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.133 Y125.168 E.00366
G1 X128.168 Y125.114 E.00197
G1 X128.21 Y125.021 E.00313
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y127.79 E.11
G1 X128.21 Y127.79 E.11
G1 X128.187 Y126.945 E.02597
M204 S10000
G1 X128.335 Y126 F30000
; FEATURE: Internal solid infill
G1 F1200
G1 X128.685 Y126.27 E.01359
G1 X128.885 Y126.542 E.01038
G1 X129.021 Y127.006 E.01484
G1 X131.006 Y127.006 E.06097
G1 X131.006 Y124.994 E.06181
G1 X128.994 Y124.994 E.06181
G1 X128.867 Y125.503 E.0161
G3 X128.383 Y125.964 I-1.212 J-.787 E.02073
G1 X128.944 Y126 F30000
G1 F1200
G1 X129.195 Y126.311 E.01227
G1 X129.298 Y126.629 E.01027
G1 X130.629 Y126.629 E.04089
G1 X130.629 Y125.371 E.03864
G1 X129.298 Y125.371 E.04089
G1 X129.195 Y125.689 E.01027
G1 X128.982 Y125.953 E.01043
G1 X129.475 Y126 F30000
; LINE_WIDTH: 0.483146
G1 F1200
G1 X129.595 Y126.22 E.00899
G1 X130.22 Y126.22 E.02242
G1 X130.22 Y125.78 E.01579
G1 X129.595 Y125.78 E.02242
G1 X129.504 Y125.947 E.00684
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.595 Y125.78 E-.07247
G1 X130.22 Y125.78 E-.23745
G1 X130.22 Y126.22 E-.16729
G1 X129.595 Y126.22 E-.23745
G1 X129.538 Y126.115 E-.04534
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 114/136
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
G3 Z14.8 I-.591 J-1.064 P1  F30000
G1 X128.519 Y126.682 Z14.8
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1200
G1 X128.405 Y126.542 E.00598
; LINE_WIDTH: 0.498595
G1 X128.309 Y126.482 E.00421
; LINE_WIDTH: 0.54719
G1 X128.213 Y126.422 E.00465
; LINE_WIDTH: 0.595786
G1 X128.117 Y126.361 E.0051
; LINE_WIDTH: 0.644381
G1 X128.021 Y126.301 E.00555
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.117 Y125.639 E.00555
; LINE_WIDTH: 0.595786
G1 X128.213 Y125.578 E.0051
; LINE_WIDTH: 0.54719
G1 X128.309 Y125.518 E.00465
; LINE_WIDTH: 0.498595
G1 X128.405 Y125.458 E.00421
; LINE_WIDTH: 0.449999
G1 X128.526 Y125.309 E.00638
G1 X128.602 Y125.021 E.00985
G1 X128.602 Y124.602 E.01391
G1 X131.398 Y124.602 E.09274
G1 X131.398 Y126 E.04637
G1 X131.398 Y127.398 E.04637
G1 X128.602 Y127.398 E.09274
G1 X128.602 Y126.979 E.01391
G1 X128.538 Y126.738 E.00826
G1 X128.185 Y126.885 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X128.168 Y126.875 E.00062
G1 X128.094 Y126.832 E.00264
G1 X128.021 Y126.79 E.00257
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.133 Y125.168 E.00366
G1 X128.168 Y125.114 E.00197
G1 X128.21 Y125.021 E.00313
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y126 E.055
G1 X131.79 Y127.79 E.055
G1 X128.21 Y127.79 E.11
G1 X128.187 Y126.945 E.02597
M204 S10000
G1 X128.335 Y126 F30000
; FEATURE: Internal solid infill
G1 F1200
G1 X128.685 Y126.27 E.01359
G1 X128.885 Y126.542 E.01038
G1 X129.021 Y127.006 E.01484
G1 X131.006 Y127.006 E.06097
G1 X131.006 Y124.994 E.06181
G1 X128.994 Y124.994 E.06181
G1 X128.867 Y125.503 E.0161
G3 X128.383 Y125.964 I-1.212 J-.787 E.02073
G1 X128.944 Y126 F30000
G1 F1200
G1 X129.195 Y126.311 E.01227
G1 X129.298 Y126.629 E.01027
G1 X130.629 Y126.629 E.04089
G1 X130.629 Y125.371 E.03864
G1 X129.298 Y125.371 E.04089
G1 X129.195 Y125.689 E.01027
G1 X128.982 Y125.953 E.01043
G1 X129.475 Y126 F30000
; LINE_WIDTH: 0.483146
M73 P91 R0
G1 F1200
G1 X129.595 Y126.22 E.00899
G1 X130.22 Y126.22 E.02242
G1 X130.22 Y125.78 E.01579
G1 X129.595 Y125.78 E.02242
G1 X129.504 Y125.947 E.00684
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.595 Y125.78 E-.07247
G1 X130.22 Y125.78 E-.23745
G1 X130.22 Y126.22 E-.16729
G1 X129.595 Y126.22 E-.23745
G1 X129.538 Y126.115 E-.04534
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 115/136
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
G3 Z15 I-.591 J-1.064 P1  F30000
G1 X128.519 Y126.682 Z15
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1200
G1 X128.405 Y126.542 E.00598
; LINE_WIDTH: 0.498595
G1 X128.309 Y126.482 E.00421
; LINE_WIDTH: 0.54719
G1 X128.213 Y126.422 E.00465
; LINE_WIDTH: 0.595786
G1 X128.117 Y126.361 E.0051
; LINE_WIDTH: 0.644381
G1 X128.021 Y126.301 E.00555
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.117 Y125.639 E.00555
; LINE_WIDTH: 0.595786
G1 X128.213 Y125.578 E.0051
; LINE_WIDTH: 0.54719
G1 X128.309 Y125.518 E.00465
; LINE_WIDTH: 0.498595
G1 X128.405 Y125.458 E.00421
; LINE_WIDTH: 0.449999
G1 X128.526 Y125.309 E.00638
G1 X128.602 Y125.021 E.00985
G1 X128.602 Y124.602 E.01391
G1 X131.398 Y124.602 E.09274
G1 X131.398 Y126 E.04637
G1 X131.398 Y127.398 E.04637
G1 X128.602 Y127.398 E.09274
G1 X128.602 Y126.979 E.01391
G1 X128.538 Y126.738 E.00826
G1 X128.185 Y126.885 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X128.168 Y126.875 E.00062
G1 X128.094 Y126.832 E.00264
G1 X128.021 Y126.79 E.00257
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.133 Y125.168 E.00366
G1 X128.168 Y125.114 E.00197
G1 X128.21 Y125.021 E.00313
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y126 E.055
G1 X131.79 Y127.79 E.055
G1 X128.21 Y127.79 E.11
G1 X128.187 Y126.945 E.02597
M204 S10000
G1 X128.335 Y126 F30000
; FEATURE: Internal solid infill
G1 F1200
G1 X128.685 Y126.27 E.01359
G1 X128.885 Y126.542 E.01038
G1 X129.021 Y127.006 E.01484
G1 X131.006 Y127.006 E.06097
G1 X131.006 Y124.994 E.06181
G1 X128.994 Y124.994 E.06181
G1 X128.867 Y125.503 E.0161
G3 X128.383 Y125.964 I-1.212 J-.787 E.02073
G1 X128.944 Y126 F30000
G1 F1200
G1 X129.195 Y126.311 E.01227
G1 X129.298 Y126.629 E.01027
G1 X130.629 Y126.629 E.04089
G1 X130.629 Y125.371 E.03864
G1 X129.298 Y125.371 E.04089
G1 X129.195 Y125.689 E.01027
G1 X128.982 Y125.953 E.01043
G1 X129.475 Y126 F30000
; LINE_WIDTH: 0.483146
G1 F1200
G1 X129.595 Y126.22 E.00899
G1 X130.22 Y126.22 E.02242
G1 X130.22 Y125.78 E.01579
G1 X129.595 Y125.78 E.02242
G1 X129.504 Y125.947 E.00684
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.595 Y125.78 E-.07247
G1 X130.22 Y125.78 E-.23745
G1 X130.22 Y126.22 E-.16729
G1 X129.595 Y126.22 E-.23745
G1 X129.538 Y126.115 E-.04534
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 116/136
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
G3 Z15.2 I-.591 J-1.064 P1  F30000
G1 X128.519 Y126.682 Z15.2
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1200
G1 X128.405 Y126.542 E.00598
; LINE_WIDTH: 0.498595
G1 X128.309 Y126.482 E.00421
; LINE_WIDTH: 0.54719
G1 X128.213 Y126.422 E.00465
; LINE_WIDTH: 0.595786
G1 X128.117 Y126.361 E.0051
; LINE_WIDTH: 0.644381
G1 X128.021 Y126.301 E.00555
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.117 Y125.639 E.00555
; LINE_WIDTH: 0.595786
G1 X128.213 Y125.578 E.0051
; LINE_WIDTH: 0.54719
G1 X128.309 Y125.518 E.00465
; LINE_WIDTH: 0.498595
G1 X128.405 Y125.458 E.00421
; LINE_WIDTH: 0.449999
G1 X128.526 Y125.309 E.00638
G1 X128.602 Y125.021 E.00985
G1 X128.602 Y124.602 E.01391
G1 X131.398 Y124.602 E.09274
G1 X131.398 Y126 E.04637
G1 X131.398 Y127.398 E.04637
G1 X128.602 Y127.398 E.09274
G1 X128.602 Y126.979 E.01391
G1 X128.538 Y126.738 E.00826
G1 X128.185 Y126.885 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X128.168 Y126.875 E.00062
G1 X128.094 Y126.832 E.00264
G1 X128.021 Y126.79 E.00257
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.133 Y125.168 E.00366
G1 X128.168 Y125.114 E.00197
G1 X128.21 Y125.021 E.00313
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y126 E.055
G1 X131.79 Y127.79 E.055
G1 X128.21 Y127.79 E.11
G1 X128.187 Y126.945 E.02597
M204 S10000
; WIPE_START
G1 F24000
G1 X128.168 Y126.875 E-.02758
G1 X128.094 Y126.832 E-.03267
G1 X128.021 Y126.79 E-.03175
G1 X126.264 Y126.79 E-.66801
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I.38 J1.156 P1  F30000
G1 X131.176 Y125.176 Z15.4
G1 Z15
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.824 Y124.824 E.01528
G1 X130.291 Y124.824
G1 X131.176 Y125.709 E.03845
G1 X131.176 Y126.243
G1 X129.757 Y124.824 E.06163
G1 X129.224 Y124.824
G1 X131.176 Y126.776 E.0848
M73 P92 R0
G1 X131.042 Y127.176
G1 X128.824 Y124.958 E.09636
G1 X128.727 Y125.394
G1 X130.509 Y127.176 E.07744
G1 X129.975 Y127.176
G1 X128.479 Y125.679 E.06502
G1 X128.175 Y125.908
G1 X129.442 Y127.176 E.05507
M204 S10000
G1 X128.983 Y127.194 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.186104
G1 F1200
G1 X128.786 Y126.793 E.00522
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.983 Y127.194 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 117/136
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
G3 Z15.4 I.056 J1.216 P1  F30000
G1 X131.367 Y127.085 Z15.4
G1 Z15.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.497643
G1 F1200
G1 X131.106 Y127.352 E.01384
; LINE_WIDTH: 0.49817
G1 X130.742 Y127.581 E.01597
G1 X130.262 Y127.723 E.01856
; LINE_WIDTH: 0.492149
G1 X129.845 Y127.734 E.01528
; LINE_WIDTH: 0.490467
G1 X129.434 Y127.645 E.01533
; LINE_WIDTH: 0.490631
G1 X129.055 Y127.462 E.01533
G1 X128.733 Y127.194 E.01531
G1 X128.484 Y126.856 E.01531
; LINE_WIDTH: 0.490905
G1 X128.323 Y126.469 E.0153
G1 X128.261 Y126.054 E.01532
G1 X128.297 Y125.636 E.01532
G1 X128.434 Y125.24 E.01529
; LINE_WIDTH: 0.490465
G1 X128.662 Y124.887 E.01533
; LINE_WIDTH: 0.490905
G1 X128.967 Y124.598 E.01532
G1 X129.332 Y124.393 E.0153
; LINE_WIDTH: 0.490467
G1 X129.736 Y124.28 E.0153
; LINE_WIDTH: 0.491287
G1 X130.154 Y124.265 E.01526
G1 X130.561 Y124.351 E.01521
; LINE_WIDTH: 0.491181
G1 X130.936 Y124.531 E.0152
G1 X131.258 Y124.796 E.01524
; LINE_WIDTH: 0.491997
G1 X131.509 Y125.127 E.0152
; LINE_WIDTH: 0.492508
G1 X131.677 Y125.52 E.01566
; LINE_WIDTH: 0.494874
G1 X131.748 Y126.025 E.01878
G1 X131.713 Y126.336 E.01152
; LINE_WIDTH: 0.49583
G1 X131.586 Y126.734 E.01539
; LINE_WIDTH: 0.496865
G1 X131.402 Y127.036 E.0131
M204 S10000
; WIPE_START
G1 F24000
G1 X131.106 Y127.352 E-.16438
G1 X130.742 Y127.581 E-.16363
G1 X130.262 Y127.723 E-.19015
G1 X129.845 Y127.734 E-.15862
G1 X129.63 Y127.688 E-.08322
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I.993 J-.704 P1  F30000
G1 X128.902 Y126.661 Z15.6
G1 Z15.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.498353
G1 F1200
G1 X128.75 Y126.336 E.01333
; LINE_WIDTH: 0.490905
G1 X128.706 Y125.973 E.01334
; LINE_WIDTH: 0.498396
G1 X128.791 Y125.547 E.01612
G1 X129.014 Y125.162 E.01651
; LINE_WIDTH: 0.490905
G1 X129.287 Y124.92 E.01334
; LINE_WIDTH: 0.498354
G1 X129.686 Y124.747 E.01615
G1 X130.129 Y124.712 E.01648
; LINE_WIDTH: 0.498171
G1 X130.551 Y124.831 E.01625
G1 X130.794 Y124.979 E.01058
; LINE_WIDTH: 0.497535
G1 X131.008 Y125.188 E.01105
; LINE_WIDTH: 0.496864
G1 X131.161 Y125.422 E.01035
; LINE_WIDTH: 0.495833
G1 X131.265 Y125.716 E.01153
; LINE_WIDTH: 0.494543
G1 X131.295 Y126.025 E.01142
; LINE_WIDTH: 0.493449
G1 X131.251 Y126.336 E.01153
; LINE_WIDTH: 0.492579
G1 X131.134 Y126.626 E.01144
; LINE_WIDTH: 0.491906
G1 X130.951 Y126.878 E.01142
; LINE_WIDTH: 0.491442
G3 X130.434 Y127.219 I-.947 J-.874 E.02286
; LINE_WIDTH: 0.498519
G1 X130.007 Y127.292 E.01605
G1 X129.566 Y127.219 E.01659
; LINE_WIDTH: 0.490465
G1 X129.243 Y127.049 E.01332
; LINE_WIDTH: 0.498353
G1 X128.934 Y126.73 E.01648
G1 X128.928 Y126.715 E.00059
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.75 Y126.336 E-.15925
G1 X128.706 Y125.973 E-.13887
G1 X128.791 Y125.547 E-.16504
G1 X129.014 Y125.162 E-.16901
G1 X129.265 Y124.939 E-.12784
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 118/136
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
G3 Z15.6 I-.87 J.851 P1  F30000
G1 X131.366 Y127.086 Z15.6
G1 Z15.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.497373
G1 F1200
G1 X131.102 Y127.355 E.01397
; LINE_WIDTH: 0.497926
G1 X130.771 Y127.567 E.01455
; LINE_WIDTH: 0.498217
G3 X129.595 Y127.697 I-.792 J-1.773 E.04463
; LINE_WIDTH: 0.498077
G1 X129.2 Y127.551 E.0156
G1 X128.852 Y127.315 E.0156
G1 X128.54 Y126.956 E.01762
G1 X128.325 Y126.475 E.01955
; LINE_WIDTH: 0.491123
G1 X128.26 Y126.052 E.01563
; LINE_WIDTH: 0.490548
G1 X128.298 Y125.634 E.01531
G1 X128.435 Y125.238 E.01531
G1 X128.663 Y124.885 E.01531
G1 X128.969 Y124.598 E.01531
G1 X129.334 Y124.392 E.01531
G1 X129.739 Y124.279 E.01531
; LINE_WIDTH: 0.49118
G1 X130.156 Y124.265 E.01527
G1 X130.563 Y124.353 E.0152
; LINE_WIDTH: 0.49167
G1 X130.937 Y124.531 E.01512
G1 X131.258 Y124.798 E.01528
; LINE_WIDTH: 0.492163
G1 X131.509 Y125.127 E.01515
; LINE_WIDTH: 0.492514
G1 X131.677 Y125.519 E.01563
; LINE_WIDTH: 0.496413
G1 X131.747 Y126.026 E.01888
G1 X131.714 Y126.328 E.01125
; LINE_WIDTH: 0.495653
G1 X131.586 Y126.734 E.0157
; LINE_WIDTH: 0.496654
G1 X131.401 Y127.037 E.01314
M204 S10000
; WIPE_START
G1 F24000
G1 X131.102 Y127.355 E-.1658
G1 X130.771 Y127.567 E-.14917
G1 X130.401 Y127.699 E-.14937
G1 X130.013 Y127.746 E-.14866
G1 X129.628 Y127.701 E-.147
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I.996 J-.7 P1  F30000
G1 X128.911 Y126.68 Z15.8
G1 Z15.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.498079
G1 F1200
G1 X128.743 Y126.308 E.01516
; LINE_WIDTH: 0.490088
G1 X128.706 Y125.973 E.01227
; LINE_WIDTH: 0.498077
G1 X128.797 Y125.53 E.01677
G1 X129.014 Y125.162 E.01583
; LINE_WIDTH: 0.490547
G1 X129.287 Y124.92 E.01333
; LINE_WIDTH: 0.498077
G1 X129.703 Y124.743 E.01677
G1 X130.156 Y124.715 E.01683
G1 X130.571 Y124.841 E.01606
G1 X130.788 Y124.973 E.00944
; LINE_WIDTH: 0.497167
G1 X131.017 Y125.201 E.01193
; LINE_WIDTH: 0.496684
G1 X131.161 Y125.422 E.00976
; LINE_WIDTH: 0.495654
G1 X131.265 Y125.716 E.01153
; LINE_WIDTH: 0.496413
G1 X131.296 Y125.989 E.01015
G1 X131.251 Y126.336 E.01293
; LINE_WIDTH: 0.492578
G1 X131.134 Y126.626 E.01144
; LINE_WIDTH: 0.491893
G1 X130.951 Y126.878 E.01142
; LINE_WIDTH: 0.491379
G1 X130.713 Y127.08 E.0114
; LINE_WIDTH: 0.491077
G1 X130.434 Y127.219 E.01139
; LINE_WIDTH: 0.498205
G1 X129.989 Y127.291 E.01671
G1 X129.566 Y127.219 E.01591
; LINE_WIDTH: 0.490547
G1 X129.243 Y127.049 E.01333
; LINE_WIDTH: 0.498079
G1 X128.939 Y126.733 E.01628
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.743 Y126.308 E-.17779
G1 X128.706 Y125.973 E-.12801
G1 X128.797 Y125.53 E-.17185
G1 X129.014 Y125.162 E-.16218
G1 X129.251 Y124.953 E-.12018
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 119/136
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
G3 Z15.8 I-.865 J.856 P1  F30000
G1 X131.365 Y127.088 Z15.8
G1 Z15.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.497159
G1 F1200
G1 X131.098 Y127.359 E.01406
; LINE_WIDTH: 0.497626
G1 X130.764 Y127.57 E.01462
; LINE_WIDTH: 0.497884
G3 X129.584 Y127.695 I-.784 J-1.778 E.04471
; LINE_WIDTH: 0.499139
G1 X129.191 Y127.545 E.01563
G1 X128.844 Y127.307 E.01564
; LINE_WIDTH: 0.497731
G1 X128.565 Y126.993 E.01559
G1 X128.369 Y126.621 E.01559
G1 X128.268 Y126.212 E.01559
G1 X128.268 Y125.792 E.01559
; LINE_WIDTH: 0.499138
G1 X128.369 Y125.383 E.01563
G1 X128.563 Y125.011 E.01564
; LINE_WIDTH: 0.49773
G1 X128.842 Y124.695 E.01559
G1 X129.187 Y124.456 E.01559
G1 X129.634 Y124.294 E.0176
G1 X130.158 Y124.266 E.01945
; LINE_WIDTH: 0.491004
G1 X130.565 Y124.354 E.0152
; LINE_WIDTH: 0.490336
G1 X130.939 Y124.536 E.01517
; LINE_WIDTH: 0.489812
G1 X131.26 Y124.801 E.01515
; LINE_WIDTH: 0.492326
G1 X131.509 Y125.127 E.01503
; LINE_WIDTH: 0.492522
G1 X131.676 Y125.519 E.0156
; LINE_WIDTH: 0.494851
G1 X131.748 Y126.026 E.01886
G1 X131.713 Y126.336 E.01152
; LINE_WIDTH: 0.495477
G1 X131.585 Y126.734 E.0154
; LINE_WIDTH: 0.496449
G1 X131.399 Y127.039 E.01322
M204 S10000
; WIPE_START
G1 F24000
G1 X131.098 Y127.359 E-.16677
G1 X130.764 Y127.57 E-.14995
G1 X130.392 Y127.701 E-.14992
G1 X130.002 Y127.745 E-.14927
G1 X129.626 Y127.7 E-.14408
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I.998 J-.697 P1  F30000
G1 X128.885 Y126.64 Z16
G1 Z15.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.490474
G1 F1200
G1 X128.842 Y126.577 E.00277
; LINE_WIDTH: 0.489684
G3 X128.707 Y125.973 I1.158 J-.577 E.02276
; LINE_WIDTH: 0.499138
G1 X128.805 Y125.516 E.01737
G1 X128.867 Y125.375 E.00574
; LINE_WIDTH: 0.489685
G3 X129.871 Y124.713 I1.133 J.625 E.04553
; LINE_WIDTH: 0.497776
G1 X130.308 Y124.746 E.01624
G1 X130.713 Y124.92 E.01634
; LINE_WIDTH: 0.496514
G1 X131.025 Y125.213 E.01584
G1 X131.16 Y125.422 E.00918
; LINE_WIDTH: 0.495477
G1 X131.265 Y125.716 E.01152
; LINE_WIDTH: 0.494374
G1 X131.295 Y126.027 E.01149
; LINE_WIDTH: 0.493407
G1 X131.251 Y126.336 E.01146
; LINE_WIDTH: 0.492578
G1 X131.134 Y126.626 E.01144
; LINE_WIDTH: 0.491884
G1 X130.951 Y126.878 E.01142
; LINE_WIDTH: 0.491361
G1 X130.713 Y127.08 E.0114
; LINE_WIDTH: 0.490954
G1 X130.434 Y127.219 E.01139
; LINE_WIDTH: 0.490684
G1 X130.129 Y127.288 E.01138
; LINE_WIDTH: 0.490559
M73 P93 R0
G1 X129.817 Y127.281 E.01138
; LINE_WIDTH: 0.499139
G1 X129.376 Y127.128 E.01737
G1 X129.049 Y126.878 E.01528
; LINE_WIDTH: 0.490474
G1 X128.919 Y126.689 E.00837
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.842 Y126.577 E-.05165
G1 X128.738 Y126.283 E-.11851
G1 X128.707 Y125.973 E-.11851
G1 X128.805 Y125.516 E-.17758
G1 X128.867 Y125.375 E-.05864
G1 X129.05 Y125.122 E-.11851
G1 X129.284 Y124.924 E-.1166
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 120/136
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
G3 Z16 I-.878 J.843 P1  F30000
G1 X131.364 Y127.09 Z16
G1 Z15.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.496901
G1 F1200
G1 X131.093 Y127.362 E.01422
; LINE_WIDTH: 0.497329
G1 X130.758 Y127.573 E.01467
; LINE_WIDTH: 0.497557
G3 X129.574 Y127.692 I-.776 J-1.783 E.04478
; LINE_WIDTH: 0.497392
G1 X129.182 Y127.541 E.01557
G1 X128.837 Y127.3 E.01557
G1 X128.559 Y126.984 E.01557
G1 X128.366 Y126.61 E.01557
G1 X128.267 Y126.202 E.01557
G1 X128.269 Y125.781 E.01557
G1 X128.372 Y125.373 E.01557
G1 X128.569 Y125.002 E.01557
G1 X128.85 Y124.689 E.01557
G1 X129.197 Y124.451 E.01557
G1 X129.591 Y124.304 E.01557
G1 X130.064 Y124.256 E.01759
G1 X130.566 Y124.355 E.01898
; LINE_WIDTH: 0.4901
G1 X130.941 Y124.537 E.01517
; LINE_WIDTH: 0.489406
G1 X131.261 Y124.803 E.01514
; LINE_WIDTH: 0.492491
G1 X131.509 Y125.127 E.01495
G1 X131.676 Y125.518 E.01556
; LINE_WIDTH: 0.498806
G1 X131.746 Y126.026 E.01906
G1 X131.715 Y126.32 E.01099
; LINE_WIDTH: 0.495305
G1 X131.585 Y126.734 E.016
; LINE_WIDTH: 0.496274
G1 X131.398 Y127.04 E.01326
M204 S10000
; WIPE_START
G1 F24000
G1 X131.093 Y127.362 E-.16842
G1 X130.758 Y127.573 E-.15051
G1 X130.384 Y127.703 E-.15048
G1 X129.991 Y127.745 E-.14988
G1 X129.624 Y127.698 E-.14071
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I.996 J-.699 P1  F30000
G1 X128.91 Y126.68 Z16.2
G1 Z15.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.489345
G1 F1200
G1 X128.842 Y126.577 E.00449
G3 X129.871 Y124.713 I1.158 J-.577 E.09097
; LINE_WIDTH: 0.497416
G1 X130.318 Y124.749 E.01661
G1 X130.712 Y124.92 E.01594
; LINE_WIDTH: 0.496317
G1 X131.035 Y125.227 E.01644
G1 X131.16 Y125.422 E.00856
; LINE_WIDTH: 0.495305
G1 X131.265 Y125.716 E.01152
; LINE_WIDTH: 0.498806
G3 X131.251 Y126.336 I-1.381 J.279 E.02322
; LINE_WIDTH: 0.492583
G1 X131.134 Y126.626 E.01144
; LINE_WIDTH: 0.491909
G1 X130.951 Y126.878 E.01142
; LINE_WIDTH: 0.49133
G1 X130.713 Y127.08 E.0114
; LINE_WIDTH: 0.490859
G1 X130.434 Y127.219 E.01139
; LINE_WIDTH: 0.490494
G1 X130.129 Y127.287 E.01138
; LINE_WIDTH: 0.490244
G1 X129.817 Y127.281 E.01137
; LINE_WIDTH: 0.489345
G3 X129.014 Y126.837 I.183 J-1.281 E.03411
G1 X128.943 Y126.73 E.00467
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.842 Y126.577 E-.06972
G1 X128.738 Y126.283 E-.11849
G1 X128.707 Y125.973 E-.11849
G1 X128.751 Y125.664 E-.11849
G1 X128.867 Y125.375 E-.11849
G1 X129.05 Y125.122 E-.11849
G1 X129.246 Y124.956 E-.09782
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 121/136
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
G3 Z16.2 I-.864 J.857 P1  F30000
G1 X131.363 Y127.091 Z16.2
G1 Z16
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.496648
G1 F1200
G1 X131.088 Y127.366 E.01437
; LINE_WIDTH: 0.497038
G1 X130.751 Y127.576 E.01471
; LINE_WIDTH: 0.497238
G3 X129.564 Y127.689 I-.768 J-1.788 E.04486
; LINE_WIDTH: 0.497062
G1 X129.172 Y127.535 E.01556
G1 X128.829 Y127.293 E.01556
G1 X128.554 Y126.975 E.01556
G1 X128.362 Y126.6 E.01556
G1 X128.266 Y126.191 E.01556
G1 X128.271 Y125.771 E.01556
G1 X128.376 Y125.363 E.01556
G1 X128.576 Y124.993 E.01556
G1 X128.858 Y124.682 E.01556
G1 X129.207 Y124.447 E.01556
G1 X129.601 Y124.302 E.01556
G1 X130.021 Y124.256 E.01561
G3 X130.787 Y124.444 I-.021 J1.737 E.02945
; LINE_WIDTH: 0.496697
G1 X131.157 Y124.697 E.01657
; LINE_WIDTH: 0.496135
G1 X131.509 Y125.127 E.02053
; LINE_WIDTH: 0.492654
G1 X131.676 Y125.517 E.01554
; LINE_WIDTH: 0.494825
G1 X131.748 Y126.026 E.01893
G1 X131.713 Y126.337 E.01152
; LINE_WIDTH: 0.495136
G1 X131.585 Y126.734 E.0154
; LINE_WIDTH: 0.496065
G1 X131.396 Y127.041 E.0133
M204 S10000
; WIPE_START
G1 F24000
G1 X131.088 Y127.366 E-.17003
G1 X130.751 Y127.576 E-.15107
G1 X130.375 Y127.705 E-.15104
G1 X129.981 Y127.744 E-.1505
G1 X129.622 Y127.697 E-.13736
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I.996 J-.699 P1  F30000
G1 X128.922 Y126.697 Z16.4
G1 Z16
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.48907
G1 F1200
G1 X128.843 Y126.577 E.00522
G3 X129.288 Y124.921 I1.157 J-.577 E.06818
; LINE_WIDTH: 0.497062
G1 X129.436 Y124.838 E.00629
G1 X129.85 Y124.715 E.01598
; LINE_WIDTH: 0.489702
G1 X130.183 Y124.719 E.01211
; LINE_WIDTH: 0.496697
G1 X130.599 Y124.857 E.01621
G1 X130.95 Y125.123 E.01628
; LINE_WIDTH: 0.495136
G1 X131.16 Y125.422 E.01348
G1 X131.264 Y125.716 E.01151
; LINE_WIDTH: 0.494208
G1 X131.295 Y126.027 E.01149
; LINE_WIDTH: 0.493357
G1 X131.251 Y126.336 E.01146
; LINE_WIDTH: 0.492589
G1 X131.134 Y126.626 E.01144
; LINE_WIDTH: 0.491919
G1 X130.951 Y126.878 E.01142
; LINE_WIDTH: 0.491315
G1 X130.713 Y127.08 E.0114
; LINE_WIDTH: 0.490792
G1 X130.434 Y127.219 E.01138
; LINE_WIDTH: 0.490347
G1 X130.129 Y127.287 E.01137
; LINE_WIDTH: 0.489987
G1 X129.817 Y127.28 E.01136
; LINE_WIDTH: 0.48907
G3 X129.014 Y126.837 I.183 J-1.28 E.03409
G1 X128.955 Y126.747 E.00394
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.843 Y126.577 E-.07733
G1 X128.738 Y126.283 E-.11848
G1 X128.707 Y125.973 E-.11848
G1 X128.751 Y125.664 E-.11848
G1 X128.868 Y125.375 E-.11848
G1 X129.05 Y125.122 E-.11848
G1 X129.231 Y124.969 E-.09027
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 122/136
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
G3 Z16.4 I-.859 J.862 P1  F30000
G1 X131.362 Y127.093 Z16.4
G1 Z16.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.496397
G1 F1200
G1 X131.084 Y127.37 E.01452
G3 X130.771 Y127.564 I-1.046 J-1.336 E.01364
; LINE_WIDTH: 0.498206
G1 X130.366 Y127.706 E.01591
G1 X129.97 Y127.744 E.01475
; LINE_WIDTH: 0.496879
G1 X129.554 Y127.686 E.01555
; LINE_WIDTH: 0.498505
G1 X129.164 Y127.529 E.0156
G1 X128.821 Y127.285 E.01561
; LINE_WIDTH: 0.496741
G1 X128.548 Y126.966 E.01555
G1 X128.359 Y126.59 E.01555
G1 X128.265 Y126.18 E.01555
; LINE_WIDTH: 0.498502
G1 X128.274 Y125.76 E.0156
G1 X128.38 Y125.354 E.01561
; LINE_WIDTH: 0.496741
G1 X128.582 Y124.985 E.01555
G1 X128.866 Y124.675 E.01555
G1 X129.216 Y124.442 E.01555
; LINE_WIDTH: 0.498504
G1 X129.612 Y124.301 E.0156
G1 X130.031 Y124.256 E.01565
; LINE_WIDTH: 0.496782
G1 X130.426 Y124.309 E.01474
; LINE_WIDTH: 0.499153
G1 X130.798 Y124.452 E.0148
G1 X131.168 Y124.708 E.01672
; LINE_WIDTH: 0.495813
G1 X131.51 Y125.127 E.01996
; LINE_WIDTH: 0.492817
G1 X131.675 Y125.516 E.01551
; LINE_WIDTH: 0.501062
G1 X131.745 Y126.026 E.01922
G1 X131.715 Y126.313 E.01077
; LINE_WIDTH: 0.494973
G1 X131.584 Y126.735 E.01626
; LINE_WIDTH: 0.495861
G1 X131.395 Y127.043 E.01334
M204 S10000
; WIPE_START
G1 F24000
G1 X131.084 Y127.37 E-.17161
G1 X130.771 Y127.564 E-.13998
G1 X130.366 Y127.706 E-.16299
G1 X129.97 Y127.744 E-.15112
G1 X129.62 Y127.695 E-.1343
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I.997 J-.698 P1  F30000
G1 X128.929 Y126.707 Z16.6
G1 Z16.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.488861
G1 F1200
G1 X128.843 Y126.577 E.00567
G3 X128.738 Y126.283 I1.157 J-.577 E.01136
; LINE_WIDTH: 0.498502
G1 X128.728 Y125.783 E.01857
G1 X128.811 Y125.496 E.01111
; LINE_WIDTH: 0.49674
G1 X129.05 Y125.122 E.01639
; LINE_WIDTH: 0.48886
G1 X129.288 Y124.921 E.01133
; LINE_WIDTH: 0.498504
G1 X129.752 Y124.734 E.01857
G1 X130.183 Y124.719 E.01601
; LINE_WIDTH: 0.499153
G1 X130.618 Y124.871 E.01715
G1 X130.95 Y125.123 E.01547
; LINE_WIDTH: 0.494972
G1 X131.16 Y125.422 E.01347
G1 X131.264 Y125.716 E.01151
; LINE_WIDTH: 0.501062
G3 X131.251 Y126.336 I-1.553 J.276 E.0233
; LINE_WIDTH: 0.492597
G1 X131.134 Y126.626 E.01144
; LINE_WIDTH: 0.491937
G1 X130.951 Y126.878 E.01142
; LINE_WIDTH: 0.491317
G1 X130.713 Y127.08 E.0114
; LINE_WIDTH: 0.498206
G1 X130.231 Y127.271 E.01924
G1 X129.817 Y127.28 E.01533
; LINE_WIDTH: 0.498505
G1 X129.346 Y127.112 E.01857
G1 X129.014 Y126.837 E.016
; LINE_WIDTH: 0.488861
G1 X128.962 Y126.757 E.00348
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X128.843 Y126.577 E-.08211
G1 X128.738 Y126.283 E-.11847
G1 X128.728 Y125.783 E-.19006
G1 X128.811 Y125.496 E-.11372
G1 X129.05 Y125.122 E-.1684
G1 X129.225 Y124.974 E-.08724
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 123/136
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
G3 Z16.6 I-.857 J.864 P1  F30000
G1 X131.361 Y127.094 Z16.6
G1 Z16.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.496148
G1 F1200
G1 X131.079 Y127.373 E.01466
; LINE_WIDTH: 0.496469
G1 X130.737 Y127.582 E.0148
; LINE_WIDTH: 0.496618
G3 X129.558 Y127.686 I-.751 J-1.791 E.04447
; LINE_WIDTH: 0.498103
G1 X129.154 Y127.524 E.01613
G1 X128.814 Y127.278 E.01559
; LINE_WIDTH: 0.496428
G1 X128.542 Y126.957 E.01554
G1 X128.356 Y126.58 E.01554
G1 X128.264 Y126.17 E.01554
G1 X128.274 Y125.749 E.01554
G1 X128.384 Y125.344 E.01554
G1 X128.588 Y124.976 E.01553
G1 X128.874 Y124.668 E.01554
G1 X129.226 Y124.437 E.01553
G1 X129.622 Y124.298 E.01553
G1 X130.042 Y124.257 E.01557
G3 X130.81 Y124.457 I-.043 J1.736 E.02962
; LINE_WIDTH: 0.496043
G1 X131.14 Y124.683 E.01476
; LINE_WIDTH: 0.49551
G1 X131.439 Y125.021 E.01663
; LINE_WIDTH: 0.494806
G1 X131.678 Y125.521 E.02039
G1 X131.748 Y126.026 E.01879
; LINE_WIDTH: 0.494803
G3 X131.584 Y126.735 I-1.848 J-.054 E.02696
; LINE_WIDTH: 0.495642
G1 X131.394 Y127.044 E.01339
M204 S10000
; WIPE_START
G1 F24000
G1 X131.079 Y127.373 E-.17315
G1 X130.737 Y127.582 E-.15222
G1 X130.357 Y127.708 E-.15216
G1 X129.959 Y127.744 E-.15173
G1 X129.619 Y127.694 E-.13074
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I.997 J-.698 P1  F30000
G1 X128.936 Y126.719 Z16.8
G1 Z16.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.488716
G1 F1200
G1 X128.846 Y126.576 E.00615
G3 X129.871 Y124.713 I1.171 J-.569 E.09035
; LINE_WIDTH: 0.48915
G3 X130.484 Y124.801 I.13 J1.279 E.02273
; LINE_WIDTH: 0.49551
G1 X130.859 Y125.037 E.01637
G1 X131.132 Y125.376 E.01602
; LINE_WIDTH: 0.494045
G1 X131.264 Y125.716 E.01343
G1 X131.295 Y126.026 E.01143
; LINE_WIDTH: 0.493306
G1 X131.251 Y126.336 E.01151
; LINE_WIDTH: 0.492622
G1 X131.134 Y126.626 E.01144
; LINE_WIDTH: 0.491961
G1 X130.951 Y126.878 E.01142
; LINE_WIDTH: 0.491335
G1 X130.713 Y127.08 E.0114
; LINE_WIDTH: 0.49074
G1 X130.434 Y127.219 E.01138
; LINE_WIDTH: 0.490177
G1 X130.129 Y127.287 E.01137
; LINE_WIDTH: 0.489649
G1 X129.817 Y127.28 E.01135
; LINE_WIDTH: 0.498103
G1 X129.337 Y127.107 E.01895
G1 X129.014 Y126.837 E.01559
; LINE_WIDTH: 0.488716
G1 X128.969 Y126.769 E.00298
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.846 Y126.576 E-.08715
G1 X128.738 Y126.283 E-.11833
G1 X128.707 Y125.973 E-.11846
G1 X128.751 Y125.665 E-.11846
G1 X128.868 Y125.375 E-.11847
G1 X129.05 Y125.123 E-.11847
G1 X129.212 Y124.985 E-.08067
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 124/136
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
G3 Z16.8 I-.853 J.868 P1  F30000
G1 X131.36 Y127.095 Z16.8
G1 Z16.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.495901
G1 F1200
G1 X131.074 Y127.377 E.01482
; LINE_WIDTH: 0.496189
G1 X130.73 Y127.586 E.01485
; LINE_WIDTH: 0.496317
G3 X129.533 Y127.68 I-.744 J-1.802 E.04511
; LINE_WIDTH: 0.496122
G1 X129.145 Y127.519 E.01552
G1 X128.806 Y127.271 E.01552
G1 X128.536 Y126.948 E.01552
G1 X128.352 Y126.57 E.01552
G1 X128.292 Y126.313 E.00976
; LINE_WIDTH: 0.494685
G1 X128.271 Y125.843 E.01732
; LINE_WIDTH: 0.497627
G1 X128.389 Y125.334 E.01935
G1 X128.595 Y124.968 E.01558
; LINE_WIDTH: 0.496122
G1 X128.883 Y124.661 E.01553
G1 X129.235 Y124.433 E.01552
G1 X129.633 Y124.295 E.01552
G1 X130.052 Y124.257 E.01555
G3 X130.822 Y124.464 I-.054 J1.735 E.02971
; LINE_WIDTH: 0.495738
G1 X131.151 Y124.694 E.0148
; LINE_WIDTH: 0.495224
M73 P94 R0
G1 X131.448 Y125.035 E.01668
; LINE_WIDTH: 0.494549
G1 X131.678 Y125.52 E.01976
; LINE_WIDTH: 0.506605
G1 X131.742 Y126.027 E.01928
G1 X131.724 Y126.238 E.008
; LINE_WIDTH: 0.494929
G1 X131.594 Y126.707 E.01794
; LINE_WIDTH: 0.495389
G1 X131.392 Y127.045 E.01451
M204 S10000
; WIPE_START
G1 F24000
G1 X131.074 Y127.377 E-.17474
G1 X130.73 Y127.586 E-.15279
G1 X130.348 Y127.71 E-.15274
G1 X129.949 Y127.743 E-.15235
G1 X129.617 Y127.693 E-.12738
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I.997 J-.698 P1  F30000
G1 X128.956 Y126.749 Z17
G1 Z16.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.488635
G1 F1200
G1 X128.843 Y126.577 E.00748
; LINE_WIDTH: 0.491163
G1 X128.735 Y126.263 E.01213
; LINE_WIDTH: 0.496063
G1 X128.731 Y125.774 E.01804
G1 X128.868 Y125.375 E.01557
; LINE_WIDTH: 0.488637
G3 X129.871 Y124.713 I1.132 J.625 E.0454
; LINE_WIDTH: 0.48899
G3 X130.484 Y124.801 I.13 J1.279 E.02272
; LINE_WIDTH: 0.488426
G1 X130.756 Y124.952 E.01131
; LINE_WIDTH: 0.494549
G1 X131.062 Y125.269 E.01621
; LINE_WIDTH: 0.494973
G1 X131.262 Y125.696 E.01739
; LINE_WIDTH: 0.497118
G1 X131.27 Y126.224 E.01955
G1 X131.134 Y126.626 E.01568
; LINE_WIDTH: 0.491995
G1 X130.951 Y126.878 E.01142
; LINE_WIDTH: 0.491368
G1 X130.713 Y127.08 E.0114
; LINE_WIDTH: 0.493166
G1 X130.483 Y127.202 E.00956
G1 X130.129 Y127.287 E.01333
; LINE_WIDTH: 0.489566
G1 X129.817 Y127.28 E.01135
; LINE_WIDTH: 0.488635
G3 X129.014 Y126.837 I.183 J-1.28 E.03405
G1 X128.989 Y126.799 E.00166
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X128.843 Y126.577 E-.10109
G1 X128.735 Y126.263 E-.12618
G1 X128.731 Y125.774 E-.18568
G1 X128.868 Y125.375 E-.16018
G1 X129.05 Y125.123 E-.11846
G1 X129.187 Y125.006 E-.06841
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 125/136
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
G3 Z17 I-.846 J.875 P1  F30000
G1 X131.34 Y127.087 Z17
G1 Z16.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.492952
G1 F1200
G1 X131.225 Y127.236 E.0069
; LINE_WIDTH: 0.493789
G1 X130.817 Y127.535 E.01858
; LINE_WIDTH: 0.496768
G1 X130.339 Y127.711 E.01884
G1 X129.938 Y127.743 E.01489
; LINE_WIDTH: 0.495963
G1 X129.523 Y127.677 E.01552
; LINE_WIDTH: 0.495826
G1 X129.135 Y127.514 E.01551
G1 X128.798 Y127.263 E.01551
G1 X128.531 Y126.939 E.01551
G1 X128.349 Y126.56 E.01551
G1 X128.263 Y126.148 E.01551
G1 X128.278 Y125.728 E.01551
G1 X128.393 Y125.324 E.01551
G1 X128.601 Y124.959 E.01551
G1 X128.891 Y124.654 E.01552
G1 X129.245 Y124.428 E.01551
G1 X129.643 Y124.293 E.01551
G1 X130.063 Y124.257 E.01554
G3 X130.834 Y124.471 I-.064 J1.735 E.02981
; LINE_WIDTH: 0.495448
G1 X131.162 Y124.704 E.01485
; LINE_WIDTH: 0.494956
G1 X131.457 Y125.049 E.01673
; LINE_WIDTH: 0.505861
G1 X131.69 Y125.574 E.02164
G1 X131.743 Y126.027 E.01721
; LINE_WIDTH: 0.503782
G1 X131.704 Y126.402 E.01418
; LINE_WIDTH: 0.494837
G1 X131.512 Y126.867 E.01852
; LINE_WIDTH: 0.492952
G1 X131.377 Y127.04 E.00805
M204 S10000
; WIPE_START
G1 F24000
G1 X131.225 Y127.236 E-.09426
G1 X130.817 Y127.535 E-.19212
G1 X130.339 Y127.711 E-.19361
G1 X129.938 Y127.743 E-.15297
G1 X129.608 Y127.691 E-.12704
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I.999 J-.695 P1  F30000
G1 X128.963 Y126.764 Z17.2
G1 Z16.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.491393
G1 F1200
G1 X128.867 Y126.625 E.00616
G1 X128.738 Y126.283 E.01335
; LINE_WIDTH: 0.488621
G3 X129.871 Y124.713 I1.285 J-.267 E.07907
; LINE_WIDTH: 0.488906
G3 X130.483 Y124.801 I.13 J1.279 E.02271
; LINE_WIDTH: 0.488266
G1 X130.756 Y124.952 E.01131
; LINE_WIDTH: 0.487626
G1 X130.985 Y125.163 E.01129
; LINE_WIDTH: 0.489369
G1 X131.164 Y125.441 E.01203
; LINE_WIDTH: 0.496596
G1 X131.285 Y125.902 E.01759
G1 X131.251 Y126.336 E.01611
; LINE_WIDTH: 0.492653
G1 X131.134 Y126.626 E.01144
; LINE_WIDTH: 0.492952
G1 X130.936 Y126.891 E.01215
; LINE_WIDTH: 0.500125
G1 X130.538 Y127.172 E.01815
G1 X130.129 Y127.287 E.01581
; LINE_WIDTH: 0.489539
G1 X129.817 Y127.28 E.01135
; LINE_WIDTH: 0.488622
G3 X129.014 Y126.837 I.261 J-1.423 E.03389
; LINE_WIDTH: 0.491393
G1 X128.997 Y126.813 E.00109
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.867 Y126.625 E-.08684
G1 X128.738 Y126.283 E-.13883
G1 X128.707 Y125.973 E-.11846
G1 X128.751 Y125.665 E-.11846
G1 X128.868 Y125.375 E-.11846
G1 X129.05 Y125.123 E-.11846
G1 X129.171 Y125.02 E-.06049
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 126/136
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
G3 Z17.2 I-.838 J.882 P1  F30000
G1 X131.357 Y127.097 Z17.2
G1 Z17
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.495417
G1 F1200
G1 X131.065 Y127.385 E.01512
; LINE_WIDTH: 0.495644
G3 X129.927 Y127.743 I-1.127 J-1.593 E.04471
G1 X129.512 Y127.674 E.01551
; LINE_WIDTH: 0.495537
G1 X129.126 Y127.509 E.01551
G1 X128.79 Y127.256 E.0155
G1 X128.525 Y126.93 E.0155
G1 X128.345 Y126.55 E.01551
G1 X128.292 Y126.314 E.0089
; LINE_WIDTH: 0.492521
G1 X128.271 Y125.827 E.01788
; LINE_WIDTH: 0.496488
G1 X128.397 Y125.314 E.0195
G1 X128.607 Y124.95 E.01554
; LINE_WIDTH: 0.495538
G1 X128.899 Y124.648 E.01551
G1 X129.255 Y124.424 E.0155
G1 X129.654 Y124.291 E.0155
G1 X130.073 Y124.258 E.01553
G3 X130.846 Y124.477 I-.075 J1.735 E.0299
; LINE_WIDTH: 0.49517
G1 X131.173 Y124.714 E.01489
; LINE_WIDTH: 0.494706
G1 X131.466 Y125.064 E.01678
; LINE_WIDTH: 0.494103
G1 X131.678 Y125.52 E.01852
; LINE_WIDTH: 0.505278
G1 X131.742 Y126.027 E.01923
G1 X131.727 Y126.213 E.00704
; LINE_WIDTH: 0.494818
G1 X131.595 Y126.702 E.01866
G1 X131.39 Y127.047 E.01477
M204 S10000
; WIPE_START
G1 F24000
G1 X131.065 Y127.385 E-.17801
G1 X130.717 Y127.592 E-.15396
G1 X130.33 Y127.713 E-.1539
G1 X129.927 Y127.743 E-.15359
G1 X129.614 Y127.691 E-.12055
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I.997 J-.698 P1  F30000
G1 X128.979 Y126.783 Z17.4
G1 Z17
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.488672
G1 F1200
G1 X128.843 Y126.577 E.00896
; LINE_WIDTH: 0.490619
G1 X128.736 Y126.265 E.01204
; LINE_WIDTH: 0.499088
G1 X128.728 Y125.795 E.01745
G1 X128.868 Y125.375 E.01646
; LINE_WIDTH: 0.488672
G1 X129.05 Y125.123 E.01132
; LINE_WIDTH: 0.491778
G1 X129.242 Y124.95 E.00945
G1 X129.567 Y124.782 E.01336
; LINE_WIDTH: 0.488673
G1 X129.871 Y124.713 E.01132
; LINE_WIDTH: 0.488895
G3 X130.483 Y124.801 I.13 J1.279 E.02271
; LINE_WIDTH: 0.488203
G1 X130.756 Y124.952 E.01131
; LINE_WIDTH: 0.487498
G1 X130.985 Y125.163 E.01129
; LINE_WIDTH: 0.486773
G1 X131.156 Y125.423 E.01126
; LINE_WIDTH: 0.494498
G1 X131.266 Y125.735 E.01216
; LINE_WIDTH: 0.496739
G1 X131.273 Y126.198 E.01713
G1 X131.134 Y126.626 E.01662
; LINE_WIDTH: 0.492085
G1 X130.951 Y126.878 E.01142
; LINE_WIDTH: 0.491482
G1 X130.713 Y127.08 E.0114
; LINE_WIDTH: 0.49086
G1 X130.434 Y127.219 E.01139
; LINE_WIDTH: 0.490221
G1 X130.129 Y127.287 E.01137
; LINE_WIDTH: 0.489568
G1 X129.817 Y127.28 E.01135
; LINE_WIDTH: 0.488672
G3 X129.014 Y126.837 I.183 J-1.28 E.03405
G1 X129.012 Y126.833 E.00018
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 17.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.843 Y126.577 E-.11656
G1 X128.736 Y126.265 E-.12537
G1 X128.728 Y125.795 E-.17842
G1 X128.868 Y125.375 E-.16829
G1 X129.05 Y125.123 E-.11846
G1 X129.154 Y125.03 E-.0529
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 127/136
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
G3 Z17.4 I-.833 J.887 P1  F30000
G1 X131.356 Y127.098 Z17.4
G1 Z17.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.49512
G1 F1200
G1 X131.063 Y127.385 E.01511
; LINE_WIDTH: 0.495377
G1 X130.71 Y127.595 E.01514
G3 X129.42 Y127.643 I-.712 J-1.773 E.04856
; LINE_WIDTH: 0.492225
G1 X128.978 Y127.407 E.01835
; LINE_WIDTH: 0.488788
G1 X128.655 Y127.101 E.01615
; LINE_WIDTH: 0.490458
G1 X128.417 Y126.715 E.01653
; LINE_WIDTH: 0.491942
G1 X128.282 Y126.254 E.01758
; LINE_WIDTH: 0.495899
G1 X128.281 Y125.712 E.02
G1 X128.401 Y125.304 E.01569
; LINE_WIDTH: 0.495258
G1 X128.614 Y124.942 E.0155
G1 X128.907 Y124.641 E.0155
G1 X129.264 Y124.419 E.0155
G1 X129.664 Y124.289 E.0155
G1 X130.084 Y124.258 E.01551
G3 X130.858 Y124.484 I-.086 J1.735 E.03
; LINE_WIDTH: 0.494907
G1 X131.185 Y124.724 E.01494
; LINE_WIDTH: 0.494472
G1 X131.475 Y125.078 E.01683
; LINE_WIDTH: 0.504493
G1 X131.69 Y125.57 E.02021
; LINE_WIDTH: 0.505266
G1 X131.742 Y126.027 E.01732
G1 X131.716 Y126.3 E.01033
; LINE_WIDTH: 0.494427
G1 X131.583 Y126.736 E.01676
; LINE_WIDTH: 0.494685
G1 X131.389 Y127.049 E.01355
M204 S10000
; WIPE_START
G1 F24000
G1 X131.063 Y127.385 E-.17812
G1 X130.71 Y127.595 E-.15609
G1 X130.322 Y127.715 E-.15448
G1 X129.917 Y127.742 E-.15422
G1 X129.614 Y127.682 E-.11709
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I.993 J-.703 P1  F30000
G1 X128.992 Y126.803 Z17.6
G1 Z17.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.490458
G1 F1200
G1 X128.836 Y126.561 E.01051
; LINE_WIDTH: 0.50052
G1 X128.717 Y126.095 E.01792
G1 X128.751 Y125.664 E.01612
; LINE_WIDTH: 0.488788
G3 X129.871 Y124.713 I1.285 J.378 E.0565
; LINE_WIDTH: 0.48896
G3 X130.483 Y124.801 I.13 J1.279 E.02272
; LINE_WIDTH: 0.488237
G1 X130.756 Y124.952 E.01131
; LINE_WIDTH: 0.487488
G1 X130.985 Y125.163 E.01129
; LINE_WIDTH: 0.488141
G1 X131.163 Y125.439 E.01191
; LINE_WIDTH: 0.493478
G1 X131.279 Y125.839 E.01529
G1 X131.251 Y126.336 E.01828
; LINE_WIDTH: 0.492695
G1 X131.134 Y126.626 E.01144
; LINE_WIDTH: 0.492142
G1 X130.951 Y126.879 E.01142
; LINE_WIDTH: 0.49156
G1 X130.713 Y127.08 E.01141
; LINE_WIDTH: 0.490952
G1 X130.434 Y127.219 E.01139
; LINE_WIDTH: 0.490315
G1 X130.129 Y127.287 E.01137
; LINE_WIDTH: 0.489652
G1 X129.817 Y127.28 E.01135
; LINE_WIDTH: 0.488787
G3 X129.028 Y126.851 I.261 J-1.423 E.0332
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 17.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X128.836 Y126.561 E-.1322
G1 X128.717 Y126.095 E-.18257
G1 X128.751 Y125.664 E-.16426
G1 X128.868 Y125.375 E-.11847
G1 X129.05 Y125.123 E-.11847
G1 X129.138 Y125.048 E-.04403
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 128/136
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
G3 Z17.6 I-.827 J.893 P1  F30000
G1 X131.354 Y127.099 Z17.6
G1 Z17.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.494823
G1 F1200
G1 X131.062 Y127.386 E.01506
; LINE_WIDTH: 0.495113
G1 X130.703 Y127.598 E.01538
G3 X129.492 Y127.668 I-.713 J-1.818 E.04546
; LINE_WIDTH: 0.494987
G1 X129.042 Y127.456 E.01833
; LINE_WIDTH: 0.492741
G1 X128.668 Y127.118 E.01848
; LINE_WIDTH: 0.488968
G1 X128.43 Y126.746 E.01606
; LINE_WIDTH: 0.490374
G1 X128.292 Y126.317 E.01644
; LINE_WIDTH: 0.491497
G1 X128.27 Y125.844 E.0173
; LINE_WIDTH: 0.495443
G1 X128.4 Y125.31 E.02026
G1 X128.62 Y124.933 E.01609
; LINE_WIDTH: 0.494986
G1 X128.916 Y124.634 E.01549
G1 X129.274 Y124.414 E.01549
G1 X129.675 Y124.286 E.01549
G1 X130.094 Y124.258 E.0155
G3 X130.87 Y124.49 I-.096 J1.735 E.03009
; LINE_WIDTH: 0.494657
G1 X131.196 Y124.734 E.01499
; LINE_WIDTH: 0.494255
G1 X131.456 Y125.047 E.01497
; LINE_WIDTH: 0.493739
G1 X131.678 Y125.52 E.0192
; LINE_WIDTH: 0.494742
G1 X131.748 Y126.026 E.01881
G1 X131.712 Y126.337 E.01152
; LINE_WIDTH: 0.494077
G1 X131.582 Y126.736 E.01541
; LINE_WIDTH: 0.494468
G1 X131.388 Y127.05 E.01359
M204 S10000
; WIPE_START
G1 F24000
G1 X131.062 Y127.386 E-.17774
G1 X130.703 Y127.598 E-.15866
G1 X130.313 Y127.717 E-.15507
G1 X129.906 Y127.742 E-.15484
G1 X129.611 Y127.69 E-.11368
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I.997 J-.698 P1  F30000
G1 X129.001 Y126.816 Z17.8
G1 Z17.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.488968
G1 F1200
G1 X128.843 Y126.577 E.01043
; LINE_WIDTH: 0.490374
G1 X128.736 Y126.267 E.01194
; LINE_WIDTH: 0.50185
G1 X128.736 Y125.776 E.01838
G1 X128.868 Y125.375 E.01577
; LINE_WIDTH: 0.488969
G3 X129.871 Y124.713 I1.132 J.625 E.04544
; LINE_WIDTH: 0.489097
G3 X130.484 Y124.801 I.13 J1.279 E.02273
; LINE_WIDTH: 0.488364
G1 X130.756 Y124.952 E.01131
; LINE_WIDTH: 0.487598
G1 X130.985 Y125.163 E.01129
; LINE_WIDTH: 0.486796
G1 X131.149 Y125.407 E.01063
; LINE_WIDTH: 0.493645
G3 X131.295 Y126.027 I-1.1 J.587 E.02366
; LINE_WIDTH: 0.493192
G1 X131.251 Y126.336 E.01146
; LINE_WIDTH: 0.492719
G1 X131.134 Y126.626 E.01144
; LINE_WIDTH: 0.492206
G1 X130.951 Y126.879 E.01143
; LINE_WIDTH: 0.491655
G1 X130.713 Y127.08 E.01141
; LINE_WIDTH: 0.49107
G1 X130.434 Y127.219 E.01139
; LINE_WIDTH: 0.490448
M73 P95 R0
G1 X130.129 Y127.287 E.01137
; LINE_WIDTH: 0.489792
G1 X129.817 Y127.28 E.01135
; LINE_WIDTH: 0.488968
G3 X129.037 Y126.864 I.183 J-1.28 E.03281
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 17.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.843 Y126.577 E-.13163
G1 X128.736 Y126.267 E-.12447
G1 X128.736 Y125.776 E-.18675
G1 X128.868 Y125.375 E-.16028
G1 X129.05 Y125.122 E-.11848
G1 X129.127 Y125.057 E-.0384
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 129/136
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
G3 Z17.8 I-.823 J.897 P1  F30000
G1 X131.353 Y127.1 Z17.8
G1 Z17.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.494545
G1 F1200
G1 X131.062 Y127.386 E.01502
; LINE_WIDTH: 0.494786
G1 X130.7 Y127.599 E.01544
; LINE_WIDTH: 0.494899
G1 X130.304 Y127.719 E.01526
G1 X129.895 Y127.742 E.01507
G1 X129.482 Y127.666 E.01549
; LINE_WIDTH: 0.494724
G1 X129.098 Y127.493 E.01548
G1 X128.767 Y127.234 E.01548
G1 X128.507 Y126.903 E.01548
; LINE_WIDTH: 0.502255
G1 X128.339 Y126.519 E.01571
G1 X128.272 Y126.184 E.01277
; LINE_WIDTH: 0.495438
G1 X128.282 Y125.714 E.01736
; LINE_WIDTH: 0.495068
G1 X128.409 Y125.285 E.01649
; LINE_WIDTH: 0.494724
G1 X128.626 Y124.925 E.01548
G1 X128.924 Y124.627 E.01548
G1 X129.284 Y124.409 E.01548
G1 X129.685 Y124.284 E.01548
G1 X130.105 Y124.259 E.01549
G1 X130.508 Y124.332 E.01506
G1 X130.882 Y124.497 E.01506
; LINE_WIDTH: 0.494419
G1 X131.207 Y124.745 E.01504
; LINE_WIDTH: 0.494055
G1 X131.493 Y125.106 E.01695
; LINE_WIDTH: 0.502926
G1 X131.69 Y125.567 E.01879
; LINE_WIDTH: 0.506543
G1 X131.742 Y126.027 E.01749
G1 X131.716 Y126.296 E.01019
; LINE_WIDTH: 0.49447
G1 X131.582 Y126.736 E.01693
; LINE_WIDTH: 0.494263
G1 X131.387 Y127.051 E.01363
M204 S10000
; WIPE_START
G1 F24000
G1 X131.062 Y127.386 E-.17737
G1 X130.7 Y127.599 E-.15939
G1 X130.304 Y127.719 E-.15747
G1 X129.895 Y127.742 E-.15547
G1 X129.61 Y127.689 E-.1103
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I.997 J-.697 P1  F30000
G1 X129.011 Y126.833 Z18
G1 Z17.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.490367
G1 F1200
G1 X128.837 Y126.563 E.01171
; LINE_WIDTH: 0.495438
G1 X128.722 Y126.153 E.01571
G1 X128.751 Y125.664 E.01806
; LINE_WIDTH: 0.489215
G3 X130.484 Y124.801 I1.261 J.361 E.07919
; LINE_WIDTH: 0.488586
G1 X130.756 Y124.952 E.01132
; LINE_WIDTH: 0.487826
G1 X130.985 Y125.163 E.0113
; LINE_WIDTH: 0.4877
G1 X131.162 Y125.437 E.01181
; LINE_WIDTH: 0.495823
G1 X131.279 Y125.847 E.01573
G1 X131.251 Y126.336 E.01809
; LINE_WIDTH: 0.492746
G1 X131.134 Y126.626 E.01144
; LINE_WIDTH: 0.492277
G1 X130.951 Y126.879 E.01143
; LINE_WIDTH: 0.491766
G1 X130.713 Y127.08 E.01141
; LINE_WIDTH: 0.491213
G1 X130.434 Y127.219 E.0114
; LINE_WIDTH: 0.490619
G1 X130.129 Y127.287 E.01138
; LINE_WIDTH: 0.489985
G1 X129.817 Y127.28 E.01136
; LINE_WIDTH: 0.489214
G3 X129.052 Y126.877 I.261 J-1.423 E.03195
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 17.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X128.837 Y126.563 E-.14451
G1 X128.722 Y126.153 E-.16192
G1 X128.751 Y125.664 E-.18609
G1 X128.867 Y125.375 E-.11849
G1 X129.05 Y125.122 E-.11849
G1 X129.111 Y125.07 E-.03051
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 130/136
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
G3 Z18 I-.818 J.901 P1  F30000
G1 X131.345 Y127.097 Z18
G1 Z17.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.487396
G1 F1200
G1 X131.344 Y127.099 E.00011
; LINE_WIDTH: 0.488171
G1 X131.043 Y127.389 E.01514
; LINE_WIDTH: 0.488902
G1 X130.682 Y127.599 E.01518
; LINE_WIDTH: 0.489589
G1 X130.281 Y127.716 E.01521
G1 X129.862 Y127.734 E.01525
G1 X129.451 Y127.65 E.01526
G1 X129.072 Y127.471 E.01526
G1 X128.747 Y127.206 E.01526
G1 X128.495 Y126.871 E.01526
G1 X128.33 Y126.486 E.01526
G1 X128.262 Y126.072 E.01526
G1 X128.296 Y125.654 E.01526
G1 X128.428 Y125.256 E.01526
G1 X128.652 Y124.902 E.01526
G1 X128.954 Y124.611 E.01526
G1 X129.316 Y124.401 E.01526
G1 X129.719 Y124.284 E.01526
; LINE_WIDTH: 0.495365
G1 X130.108 Y124.258 E.01439
G1 X130.538 Y124.35 E.0162
; LINE_WIDTH: 0.491382
G1 X130.926 Y124.525 E.01556
; LINE_WIDTH: 0.491891
G1 X131.252 Y124.788 E.01532
; LINE_WIDTH: 0.492334
G1 X131.509 Y125.126 E.01556
; LINE_WIDTH: 0.494725
G1 X131.705 Y125.617 E.01946
G1 X131.742 Y125.919 E.0112
; LINE_WIDTH: 0.493145
G1 X131.695 Y126.347 E.01578
; LINE_WIDTH: 0.486575
G1 X131.566 Y126.746 E.01519
; LINE_WIDTH: 0.487396
G1 X131.377 Y127.046 E.01283
M204 S10000
; WIPE_START
G1 F24000
G1 X131.344 Y127.099 E-.02392
G1 X131.043 Y127.389 E-.15861
G1 X130.682 Y127.599 E-.15871
G1 X130.281 Y127.716 E-.1588
G1 X129.862 Y127.734 E-.15926
G1 X129.602 Y127.681 E-.1007
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I1 J-.693 P1  F30000
G1 X129.028 Y126.851 Z18.2
G1 Z17.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.494469
G1 F1200
G1 X129.013 Y126.831 E.0009
G3 X129.571 Y124.778 I1.002 J-.831 E.09167
; LINE_WIDTH: 0.495367
G3 X130.182 Y124.721 I.418 J1.178 E.02288
; LINE_WIDTH: 0.494459
G3 X130.758 Y124.949 I-.152 J1.223 E.02305
; LINE_WIDTH: 0.494285
G1 X130.988 Y125.161 E.01149
; LINE_WIDTH: 0.494066
G1 X131.16 Y125.422 E.01148
; LINE_WIDTH: 0.4938
G1 X131.264 Y125.716 E.01148
; LINE_WIDTH: 0.493489
G1 X131.294 Y126.027 E.01145
; LINE_WIDTH: 0.492825
G1 X131.232 Y126.386 E.01334
; LINE_WIDTH: 0.493453
G1 X131.111 Y126.659 E.01097
; LINE_WIDTH: 0.493869
G1 X130.928 Y126.9 E.01114
; LINE_WIDTH: 0.494195
G1 X130.693 Y127.092 E.01115
; LINE_WIDTH: 0.494433
G3 X129.287 Y127.08 I-.693 J-1.141 E.05447
; LINE_WIDTH: 0.494469
G1 X129.073 Y126.891 E.01052
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 18
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.013 Y126.831 E-.03194
G1 X128.838 Y126.573 E-.11846
G1 X128.735 Y126.279 E-.11868
G1 X128.705 Y125.968 E-.11868
G1 X128.75 Y125.659 E-.11868
G1 X128.868 Y125.37 E-.11869
G1 X129.052 Y125.117 E-.11868
G1 X129.084 Y125.09 E-.01619
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 131/136
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
G3 Z18.2 I-.808 J.91 P1  F30000
G1 X131.345 Y127.098 Z18.2
G1 Z18
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.48863
G1 F1200
G1 X131.045 Y127.388 E.01517
; LINE_WIDTH: 0.489309
G1 X130.684 Y127.599 E.0152
; LINE_WIDTH: 0.489943
G1 X130.282 Y127.717 E.01523
G1 X129.863 Y127.734 E.01527
G1 X129.452 Y127.651 E.01528
G1 X129.073 Y127.472 E.01528
G1 X128.748 Y127.208 E.01528
G1 X128.495 Y126.873 E.01528
G1 X128.33 Y126.487 E.01528
G1 X128.262 Y126.074 E.01528
G1 X128.295 Y125.655 E.01528
G1 X128.427 Y125.257 E.01528
G1 X128.65 Y124.903 E.01528
G1 X128.952 Y124.611 E.01528
G1 X129.315 Y124.401 E.01528
G1 X129.718 Y124.284 E.01528
; LINE_WIDTH: 0.495001
G1 X130.12 Y124.258 E.01487
G1 X130.538 Y124.348 E.01576
; LINE_WIDTH: 0.491576
G1 X130.925 Y124.524 E.01554
; LINE_WIDTH: 0.49203
G1 X131.251 Y124.787 E.01533
; LINE_WIDTH: 0.492442
G1 X131.505 Y125.121 E.01535
; LINE_WIDTH: 0.492782
G1 X131.673 Y125.509 E.01548
; LINE_WIDTH: 0.494706
G1 X131.748 Y126.027 E.01927
G1 X131.711 Y126.337 E.01152
; LINE_WIDTH: 0.493411
G1 X131.567 Y126.741 E.01573
; LINE_WIDTH: 0.487909
G1 X131.377 Y127.047 E.01307
M204 S10000
; WIPE_START
G1 F24000
G1 X131.045 Y127.388 E-.18093
G1 X130.684 Y127.599 E-.15884
G1 X130.282 Y127.717 E-.15892
G1 X129.863 Y127.734 E-.15932
G1 X129.6 Y127.681 E-.10199
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I1.005 J-.687 P1  F30000
G1 X129.046 Y126.87 Z18.4
G1 Z18
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.494189
G1 F1200
G1 X129.012 Y126.839 E.00167
G3 X129.516 Y124.8 I.987 J-.838 E.09007
; LINE_WIDTH: 0.495002
G1 X129.874 Y124.71 E.01359
G1 X130.182 Y124.72 E.01137
; LINE_WIDTH: 0.494161
G3 X130.758 Y124.949 I-.157 J1.233 E.02303
; LINE_WIDTH: 0.494042
G1 X130.988 Y125.161 E.01148
; LINE_WIDTH: 0.493879
G1 X131.16 Y125.422 E.01148
; LINE_WIDTH: 0.493658
G1 X131.264 Y125.716 E.01147
; LINE_WIDTH: 0.493411
G1 X131.295 Y126.027 E.01146
; LINE_WIDTH: 0.493121
G1 X131.25 Y126.336 E.01144
; LINE_WIDTH: 0.493255
G1 X131.118 Y126.65 E.0125
; LINE_WIDTH: 0.4937
G1 X130.938 Y126.891 E.01106
; LINE_WIDTH: 0.493983
G1 X130.704 Y127.087 E.01121
; LINE_WIDTH: 0.494189
G3 X129.242 Y127.051 I-.705 J-1.086 E.05716
G1 X129.09 Y126.91 E.00761
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 18.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.012 Y126.839 E-.04011
G1 X128.84 Y126.578 E-.11871
G1 X128.736 Y126.284 E-.11871
G1 X128.704 Y125.973 E-.11871
G1 X128.749 Y125.664 E-.11871
G1 X128.865 Y125.374 E-.11871
G1 X129.048 Y125.121 E-.11871
G1 X129.064 Y125.108 E-.00762
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 132/136
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
G3 Z18.4 I-.8 J.917 P1  F30000
G1 X131.345 Y127.099 Z18.4
G1 Z18.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.489204
G1 F1200
G1 X131.047 Y127.388 E.0151
; LINE_WIDTH: 0.489805
G1 X130.685 Y127.599 E.01523
; LINE_WIDTH: 0.490367
G1 X130.284 Y127.717 E.01526
G1 X129.865 Y127.735 E.01529
G1 X129.454 Y127.652 E.0153
G1 X129.074 Y127.473 E.0153
G1 X128.748 Y127.209 E.0153
G1 X128.495 Y126.874 E.0153
G1 X128.33 Y126.489 E.0153
G1 X128.262 Y126.075 E.0153
G1 X128.294 Y125.657 E.0153
G1 X128.426 Y125.258 E.0153
G1 X128.649 Y124.903 E.0153
G1 X128.951 Y124.612 E.0153
G1 X129.313 Y124.401 E.0153
G1 X129.716 Y124.283 E.0153
; LINE_WIDTH: 0.494638
G1 X130.129 Y124.259 E.01523
G1 X130.539 Y124.347 E.01544
; LINE_WIDTH: 0.491795
G1 X130.925 Y124.524 E.01552
; LINE_WIDTH: 0.492185
G1 X131.251 Y124.787 E.01535
; LINE_WIDTH: 0.492535
G1 X131.505 Y125.121 E.01536
; LINE_WIDTH: 0.492815
G1 X131.673 Y125.508 E.01547
; LINE_WIDTH: 0.494695
G1 X131.748 Y126.027 E.01931
G1 X131.711 Y126.337 E.01152
; LINE_WIDTH: 0.493334
G1 X131.569 Y126.74 E.01568
; LINE_WIDTH: 0.48856
G1 X131.377 Y127.049 E.01319
M204 S10000
; WIPE_START
G1 F24000
G1 X131.047 Y127.388 E-.17999
G1 X130.685 Y127.599 E-.15897
G1 X130.284 Y127.717 E-.15905
G1 X129.865 Y127.735 E-.15939
G1 X129.6 Y127.682 E-.10259
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I1.009 J-.68 P1  F30000
G1 X129.064 Y126.886 Z18.6
G1 Z18.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.493764
G1 F1200
G1 X129.02 Y126.833 E.00256
G3 X129.566 Y124.779 I.986 J-.837 E.0916
; LINE_WIDTH: 0.494638
G3 X130.183 Y124.72 I.423 J1.166 E.02304
; LINE_WIDTH: 0.493891
G3 X130.988 Y125.161 I-.246 J1.403 E.03436
; LINE_WIDTH: 0.493701
G1 X131.16 Y125.422 E.01147
; LINE_WIDTH: 0.493529
G1 X131.264 Y125.716 E.01147
; LINE_WIDTH: 0.493334
G1 X131.295 Y126.027 E.01145
; LINE_WIDTH: 0.493096
G3 X131.127 Y126.637 I-1.315 J-.035 E.02345
; LINE_WIDTH: 0.493544
G1 X130.948 Y126.882 E.01115
; LINE_WIDTH: 0.493764
G3 X129.247 Y127.043 I-.942 J-.887 E.06856
G1 X129.109 Y126.925 E.00666
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 18.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.02 Y126.833 E-.0491
G1 X128.84 Y126.578 E-.11832
G1 X128.736 Y126.284 E-.1187
G1 X128.705 Y125.973 E-.1187
G1 X128.749 Y125.664 E-.1187
G1 X128.866 Y125.374 E-.1187
G1 X129.047 Y125.123 E-.11779
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 133/136
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
G3 Z18.6 I-.794 J.922 P1  F30000
G1 X131.345 Y127.101 Z18.6
G1 Z18.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.48989
G1 F1200
G1 X131.049 Y127.388 E.01501
; LINE_WIDTH: 0.490392
G1 X130.687 Y127.599 E.01527
; LINE_WIDTH: 0.49086
G1 X130.285 Y127.717 E.01529
G1 X129.866 Y127.736 E.01532
G1 X129.455 Y127.653 E.01532
G1 X129.075 Y127.475 E.01532
G1 X128.749 Y127.21 E.01532
G1 X128.496 Y126.876 E.01532
G1 X128.33 Y126.49 E.01532
G1 X128.261 Y126.076 E.01532
G1 X128.293 Y125.658 E.01532
G1 X128.425 Y125.259 E.01532
G1 X128.648 Y124.904 E.01532
G1 X128.949 Y124.612 E.01532
G1 X129.312 Y124.401 E.01532
G1 X129.715 Y124.283 E.01532
; LINE_WIDTH: 0.494273
G1 X130.129 Y124.259 E.01527
G1 X130.54 Y124.346 E.01543
; LINE_WIDTH: 0.492036
G1 X130.924 Y124.523 E.01549
; LINE_WIDTH: 0.492354
G1 X131.251 Y124.786 E.01536
; LINE_WIDTH: 0.492635
G1 X131.505 Y125.12 E.01538
; LINE_WIDTH: 0.492852
M73 P96 R0
G1 X131.673 Y125.507 E.01546
; LINE_WIDTH: 0.494682
G1 X131.748 Y126.027 E.01934
G1 X131.711 Y126.338 E.01151
; LINE_WIDTH: 0.493259
G1 X131.571 Y126.74 E.01562
; LINE_WIDTH: 0.489351
G1 X131.378 Y127.051 E.01333
M204 S10000
; WIPE_START
G1 F24000
G1 X131.049 Y127.388 E-.17884
G1 X130.687 Y127.599 E-.15913
G1 X130.285 Y127.717 E-.15919
G1 X129.866 Y127.736 E-.15946
G1 X129.599 Y127.682 E-.10338
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.8 I1.014 J-.673 P1  F30000
G1 X129.081 Y126.902 Z18.8
G1 Z18.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.493546
G1 F1200
G1 X129.012 Y126.839 E.00344
G3 X129.566 Y124.779 I.988 J-.839 E.09197
; LINE_WIDTH: 0.494273
G3 X130.183 Y124.719 I.426 J1.177 E.02302
; LINE_WIDTH: 0.49365
G1 X130.485 Y124.798 E.01147
G3 X130.988 Y125.161 I-.485 J1.201 E.023
; LINE_WIDTH: 0.493532
G1 X131.159 Y125.422 E.01147
; LINE_WIDTH: 0.493405
G1 X131.264 Y125.716 E.01146
; LINE_WIDTH: 0.493259
G1 X131.295 Y126.027 E.01146
; LINE_WIDTH: 0.493075
G3 X131.134 Y126.626 I-1.327 J-.036 E.02295
; LINE_WIDTH: 0.493288
G1 X130.951 Y126.879 E.01146
; LINE_WIDTH: 0.493436
G1 X130.713 Y127.081 E.01147
; LINE_WIDTH: 0.493546
G3 X129.242 Y127.051 I-.713 J-1.081 E.05748
G1 X129.125 Y126.943 E.00582
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 18.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.012 Y126.839 E-.05844
G1 X128.84 Y126.578 E-.11868
G1 X128.736 Y126.284 E-.11868
G1 X128.705 Y125.973 E-.11868
G1 X128.749 Y125.664 E-.11868
G1 X128.866 Y125.374 E-.11868
G1 X129.032 Y125.143 E-.10814
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 134/136
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
G3 Z18.8 I-1.216 J.045 P1  F30000
G1 X129.098 Y126.917 Z18.8
G1 Z18.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.493307
G1 F1200
G1 X129.013 Y126.839 E.00427
G3 X129.566 Y124.779 I.987 J-.839 E.09192
; LINE_WIDTH: 0.493909
G3 X130.183 Y124.719 I.428 J1.189 E.023
; LINE_WIDTH: 0.493435
G3 X131.159 Y125.422 I-.179 J1.279 E.04596
; LINE_WIDTH: 0.493284
G3 X131.295 Y125.973 I-1.159 J.578 E.02099
; LINE_WIDTH: 0.493052
G1 X131.25 Y126.336 E.01341
; LINE_WIDTH: 0.492909
G1 X131.134 Y126.626 E.01145
; LINE_WIDTH: 0.493072
G1 X130.951 Y126.879 E.01145
; LINE_WIDTH: 0.493205
G1 X130.713 Y127.081 E.01146
; LINE_WIDTH: 0.493307
G3 X129.242 Y127.05 I-.713 J-1.081 E.05745
G1 X129.142 Y126.958 E.00499
M204 S10000
; WIPE_START
G1 F24000
G1 X129.013 Y126.839 E-.06697
G1 X128.841 Y126.578 E-.11867
G1 X128.736 Y126.284 E-.11867
G1 X128.705 Y125.973 E-.11867
G1 X128.749 Y125.664 E-.11867
G1 X128.866 Y125.374 E-.11867
G1 X129.019 Y125.161 E-.09967
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I-.78 J.934 P1  F30000
G1 X131.345 Y127.103 Z19
G1 Z18.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.490688
G1 F1200
G1 X131.051 Y127.387 E.01492
; LINE_WIDTH: 0.491069
G1 X130.689 Y127.599 E.01531
; LINE_WIDTH: 0.491423
G1 X130.287 Y127.718 E.01532
G1 X129.868 Y127.737 E.01534
G1 X129.456 Y127.654 E.01534
G1 X129.076 Y127.476 E.01534
G1 X128.749 Y127.212 E.01534
G1 X128.496 Y126.877 E.01534
G1 X128.329 Y126.492 E.01534
G1 X128.26 Y126.078 E.01534
G1 X128.292 Y125.659 E.01534
G1 X128.423 Y125.26 E.01534
G1 X128.646 Y124.905 E.01534
G1 X128.948 Y124.612 E.01534
G1 X129.31 Y124.401 E.01534
G1 X129.713 Y124.282 E.01534
; LINE_WIDTH: 0.493909
G1 X130.129 Y124.26 E.01532
G1 X130.54 Y124.345 E.01543
; LINE_WIDTH: 0.492303
G1 X130.924 Y124.522 E.01547
; LINE_WIDTH: 0.492537
G1 X131.25 Y124.786 E.01538
; LINE_WIDTH: 0.492741
G1 X131.505 Y125.12 E.01539
; LINE_WIDTH: 0.492892
G1 X131.672 Y125.506 E.01545
; LINE_WIDTH: 0.494671
G1 X131.748 Y126.027 E.01937
G1 X131.711 Y126.338 E.01151
; LINE_WIDTH: 0.493184
G1 X131.574 Y126.739 E.01557
; LINE_WIDTH: 0.490278
G1 X131.378 Y127.053 E.01349
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 18.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X131.051 Y127.387 E-.17772
G1 X130.689 Y127.599 E-.1593
G1 X130.287 Y127.718 E-.15934
G1 X129.868 Y127.737 E-.15954
G1 X129.599 Y127.683 E-.1041
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 135/136
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
G3 Z19 I.382 J1.156 P1  F30000
G1 X131.346 Y127.106 Z19
G1 Z18.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.493364
G1 F1200
G1 X131.057 Y127.387 E.01479
; LINE_WIDTH: 0.493226
G1 X130.692 Y127.598 E.01549
; LINE_WIDTH: 0.492053
G1 X130.289 Y127.718 E.0154
G1 X129.869 Y127.737 E.01537
G1 X129.457 Y127.656 E.01537
G1 X129.076 Y127.478 E.01537
G1 X128.75 Y127.214 E.01537
G1 X128.496 Y126.879 E.01537
G1 X128.329 Y126.494 E.01537
G1 X128.259 Y126.079 E.01537
G1 X128.291 Y125.66 E.01537
G1 X128.422 Y125.261 E.01537
G1 X128.645 Y124.905 E.01537
G1 X128.946 Y124.613 E.01537
G1 X129.309 Y124.401 E.01537
G1 X129.711 Y124.282 E.01537
; LINE_WIDTH: 0.493544
G1 X130.129 Y124.26 E.01536
G1 X130.541 Y124.344 E.01542
; LINE_WIDTH: 0.492523
G1 X130.923 Y124.521 E.01545
; LINE_WIDTH: 0.492679
G1 X131.25 Y124.785 E.01539
; LINE_WIDTH: 0.492855
G1 X131.505 Y125.119 E.0154
G1 X131.672 Y125.505 E.01543
; LINE_WIDTH: 0.494659
G1 X131.748 Y126.027 E.01941
G1 X131.711 Y126.338 E.01151
; LINE_WIDTH: 0.493107
G1 X131.576 Y126.738 E.01551
; LINE_WIDTH: 0.493364
G1 X131.381 Y127.057 E.01373
M204 S10000
; WIPE_START
G1 F24000
G1 X131.057 Y127.387 E-.17545
G1 X130.692 Y127.598 E-.1604
G1 X130.289 Y127.718 E-.15995
G1 X129.869 Y127.737 E-.15962
G1 X129.599 Y127.684 E-.10458
; WIPE_END
M73 P97 R0
G1 E-.04 F1800
G17
G3 Z19.2 I1.022 J-.66 P1  F30000
G1 X129.114 Y126.932 Z19.2
G1 Z18.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.493143
G1 F1200
G1 X129.013 Y126.838 E.00504
G3 X129.014 Y125.16 I.987 J-.838 E.06698
; LINE_WIDTH: 0.493144
G1 X129.287 Y124.919 E.01336
G1 X129.566 Y124.779 E.01146
; LINE_WIDTH: 0.493544
G3 X130.183 Y124.718 I.43 J1.202 E.02299
; LINE_WIDTH: 0.493225
G3 X131.264 Y125.716 I-.218 J1.321 E.05716
; LINE_WIDTH: 0.493107
G3 X131.251 Y126.336 I-1.258 J.283 E.02296
; LINE_WIDTH: 0.493364
G3 X130.951 Y126.879 I-1.237 J-.328 E.02298
; LINE_WIDTH: 0.492678
G1 X130.713 Y127.081 E.01144
; LINE_WIDTH: 0.493143
G3 X129.242 Y127.05 I-.714 J-1.08 E.05741
G1 X129.158 Y126.972 E.00422
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 19
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.013 Y126.838 E-.07499
G1 X128.841 Y126.578 E-.11867
G1 X128.736 Y126.284 E-.11867
G1 X128.705 Y125.973 E-.11867
G1 X128.749 Y125.664 E-.11866
G1 X128.866 Y125.374 E-.11867
G1 X129.003 Y125.176 E-.09167
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 136/136
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
G3 Z19.2 I-.774 J.939 P1  F30000
G1 X131.345 Y127.107 Z19.2
G1 Z19
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.493034
G1 F1200
G1 X131.057 Y127.387 E.01476
G1 X130.694 Y127.6 E.01541
G1 X130.291 Y127.719 E.01542
G1 X129.871 Y127.738 E.01544
; LINE_WIDTH: 0.492629
G1 X129.458 Y127.657 E.01542
G1 X129.077 Y127.479 E.0154
; LINE_WIDTH: 0.493179
G1 X128.75 Y127.216 E.01539
G1 X128.496 Y126.882 E.0154
; LINE_WIDTH: 0.493018
G1 X128.329 Y126.496 E.01544
; LINE_WIDTH: 0.493177
G1 X128.258 Y126.081 E.01542
G1 X128.289 Y125.663 E.0154
; LINE_WIDTH: 0.493019
G1 X128.421 Y125.263 E.01544
; LINE_WIDTH: 0.492628
G1 X128.643 Y124.906 E.01542
; LINE_WIDTH: 0.493178
G1 X128.943 Y124.613 E.01539
G1 X129.307 Y124.401 E.01542
; LINE_WIDTH: 0.492627
G1 X129.71 Y124.281 E.01542
G1 X130.13 Y124.262 E.0154
; LINE_WIDTH: 0.492771
G1 X130.542 Y124.343 E.0154
G1 X130.923 Y124.521 E.0154
; LINE_WIDTH: 0.492887
G1 X131.25 Y124.784 E.01541
; LINE_WIDTH: 0.493118
G1 X131.505 Y125.118 E.01541
G1 X131.671 Y125.503 E.01539
; LINE_WIDTH: 0.494646
G1 X131.748 Y126.027 E.01948
G1 X131.711 Y126.338 E.01151
; LINE_WIDTH: 0.493034
G1 X131.579 Y126.738 E.01545
G1 X131.38 Y127.058 E.01383
M204 S10000
; WIPE_START
G1 F24000
G1 X131.057 Y127.387 E-.17527
G1 X130.694 Y127.6 E-.15969
G1 X130.291 Y127.719 E-.15971
G1 X129.871 Y127.738 E-.15996
G1 X129.599 Y127.685 E-.10536
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I1.027 J-.653 P1  F30000
G1 X129.128 Y126.945 Z19.4
G1 Z19
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.493178
G1 F1200
G1 X129.013 Y126.838 E.00576
; LINE_WIDTH: 0.49263
G1 X128.841 Y126.578 E.01144
; LINE_WIDTH: 0.493179
G3 X128.705 Y125.973 I1.149 J-.576 E.02297
; LINE_WIDTH: 0.492625
G1 X128.749 Y125.664 E.01144
; LINE_WIDTH: 0.493015
G1 X128.866 Y125.374 E.01145
; LINE_WIDTH: 0.493174
G3 X129.287 Y124.919 I1.128 J.621 E.02297
; LINE_WIDTH: 0.493022
G3 X130.434 Y124.78 I.713 J1.079 E.04393
; LINE_WIDTH: 0.493067
G1 X130.758 Y124.95 E.01343
G3 X130.951 Y126.879 I-.786 J1.053 E.07999
; LINE_WIDTH: 0.492881
G3 X130.434 Y127.22 I-.951 J-.879 E.02295
; LINE_WIDTH: 0.492775
G1 X130.129 Y127.289 E.01145
; LINE_WIDTH: 0.493016
G3 X129.515 Y127.201 I-.13 J-1.285 E.02296
; LINE_WIDTH: 0.493178
G3 X129.242 Y127.05 I.481 J-1.196 E.01149
G1 X129.172 Y126.986 E.00349
M204 S10000
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X129.013 Y126.838 E-.08244
G1 X128.841 Y126.578 E-.11864
G1 X128.736 Y126.284 E-.11866
G1 X128.705 Y125.973 E-.11866
G1 X128.749 Y125.664 E-.11862
G1 X128.866 Y125.374 E-.11867
G1 X128.996 Y125.194 E-.0843
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
G1 Z19.5 F900 ; lower z a little
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

    G1 Z119 F600
    G1 Z117

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

