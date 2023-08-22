; HEADER_BLOCK_START
; BambuStudio 01.07.01.62
; model printing time: 4m 29s; total estimated time: 10m 16s
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

    G1 X20 Y50 F12000
    G1 Y-3
    T0
    G1 X54 F12000
M73 P43 R5
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
M73 P45 R5
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
M73 P49 R5
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
M73 P50 R5
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
M73 P51 R5
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.5
G1 F3000
M73 P51 R4
G1 X123.184 Y130.816 E.46588
G1 X123.184 Y121.184 E.35872
G1 X135.693 Y121.184 E.46588
G1 X135.693 Y130.747 E.35617
; WIPE_START
G1 F24000
M73 P52 R4
G1 X135.693 Y128.747 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.294 Y124.586 Z.6 F30000
G1 X127.855 Y123.65 Z.6
G1 Z.2
G1 E.8 F1800
M73 P53 R4
G1 F3000
G1 X127.65 Y123.855 E.0108
G1 X127.65 Y124.65 E.02961
G1 X123.855 Y124.65 E.14135
G1 X123.65 Y124.855 E.0108
G1 X123.65 Y127.145 E.08529
M73 P54 R4
G1 X123.855 Y127.35 E.0108
G1 X127.65 Y127.35 E.14135
G1 X127.65 Y128.145 E.02961
G1 X127.855 Y128.35 E.0108
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
M73 P55 R4
G1 X135.281 Y130.404 E.32808
G1 X123.596 Y130.404 E.43524
G1 X123.596 Y127.673 E.10174
G1 X123.685 Y127.761 E.00468
G1 X127.239 Y127.761 E.13237
G1 X127.239 Y128.315 E.02063
G1 X127.685 Y128.761 E.02349
G1 X130.315 Y128.761 E.09798
G1 X130.761 Y128.315 E.02349
M73 P56 R4
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
M73 P57 R4
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
M73 P58 R4
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
M73 P59 R4
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
M73 P60 R4
G1 X128.885 Y124.885 E.01198
G2 X129.371 Y124.862 I.128 J-2.357 E.02038
; LINE_WIDTH: 0.509151
G1 X129.6 Y124.838 E.00874
; LINE_WIDTH: 0.461766
G1 X129.829 Y124.814 E.00785
; LINE_WIDTH: 0.41438
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
G3 Z.8 I-.017 J1.217 P1  F30000
G1 X132.539 Y125.811 Z.8
G1 Z.475
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275
G1 F1200
G1 X132.539 Y123.777 E.08229
G1 X132.223 Y123.461 E.01804
G1 X127.777 Y123.461 E.17983
G1 X127.461 Y123.777 E.01804
G1 X127.461 Y124.461 E.02769
G1 X125.123 Y124.461 E.09459
G1 X125.123 Y123.123 E.05414
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
M73 P61 R4
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
M73 P61 R3
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
G3 Z1 I-.017 J1.217 P1  F30000
G1 X132.539 Y125.811 Z1
G1 Z.75
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275
G1 F1200
G1 X132.539 Y123.777 E.08229
G1 X132.223 Y123.461 E.01804
G1 X127.777 Y123.461 E.17983
G1 X127.461 Y123.777 E.01804
G1 X127.461 Y124.461 E.02769
G1 X125.123 Y124.461 E.09459
G1 X125.123 Y123.123 E.05414
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
M73 P62 R3
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
G3 Z1.4 I-.017 J1.217 P1  F30000
G1 X132.539 Y125.811 Z1.4
G1 Z1.025
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275
G1 F1200
G1 X132.539 Y123.777 E.08229
G1 X132.223 Y123.461 E.01804
G1 X127.777 Y123.461 E.17983
G1 X127.461 Y123.777 E.01804
G1 X127.461 Y124.461 E.02769
G1 X125.123 Y124.461 E.09459
G1 X125.123 Y123.123 E.05414
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
M73 P63 R3
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
G3 Z1.6 I-.017 J1.217 P1  F30000
G1 X132.539 Y125.811 Z1.6
G1 Z1.3
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275
G1 F1200
G1 X132.539 Y123.777 E.08229
G1 X132.223 Y123.461 E.01804
G1 X127.777 Y123.461 E.17983
G1 X127.461 Y123.777 E.01804
G1 X127.461 Y124.461 E.02769
G1 X125.123 Y124.461 E.09459
G1 X125.123 Y123.123 E.05414
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
M73 P64 R3
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
G3 Z1.8 I-.017 J1.217 P1  F30000
G1 X132.539 Y125.811 Z1.8
G1 Z1.575
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275
G1 F1200
G1 X132.539 Y123.777 E.08229
G1 X132.223 Y123.461 E.01804
G1 X127.777 Y123.461 E.17983
G1 X127.461 Y123.777 E.01804
G1 X127.461 Y124.461 E.02769
G1 X125.123 Y124.461 E.09459
G1 X125.123 Y123.123 E.05414
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
M73 P65 R3
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
G3 Z2.2 I-.017 J1.217 P1  F30000
G1 X132.539 Y125.811 Z2.2
G1 Z1.85
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275
G1 F1200
G1 X132.539 Y123.777 E.08229
G1 X132.223 Y123.461 E.01804
G1 X127.777 Y123.461 E.17983
G1 X127.461 Y123.777 E.01804
G1 X127.461 Y124.461 E.02769
G1 X125.123 Y124.461 E.09459
G1 X125.123 Y123.123 E.05414
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
M73 P66 R3
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
G3 Z2.4 I-.332 J1.171 P1  F30000
G1 X132.539 Y125.811 Z2.4
G1 Z2.125
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.275
G1 F1200
G1 X132.539 Y123.777 E.08229
G1 X132.223 Y123.461 E.01804
G1 X127.777 Y123.461 E.17983
G1 X127.461 Y123.777 E.01804
G1 X127.461 Y124.461 E.02769
G1 X125.123 Y124.461 E.09459
G1 X125.123 Y123.123 E.05414
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
G3 Z2.525 I.538 J-1.092 P1  F30000
G1 X125.301 Y125.699 Z2.525
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z2.6 I.963 J.744 P1  F30000
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
G1 X131.508 Y126.231 E.02695
G1 X131.508 Y123.769 E.07568
G1 X132.096 Y123.769 E.01805
G1 X132.231 Y123.904 E.00589
G1 X132.231 Y126.096 E.06735
G1 X132.096 Y126.231 E.00589
M73 P67 R3
G1 X131.697 Y126.231 E.01226
G1 X132.389 Y125.811 F30000
; FEATURE: Support
; LAYER_HEIGHT: 0.275
G1 F1200
G1 X132.389 Y123.839 E.07978
G1 X132.161 Y123.611 E.01302
G1 X127.839 Y123.611 E.1748
G1 X127.611 Y123.839 E.01302
G1 X127.611 Y124.611 E.03124
G1 X126.373 Y124.611 E.05009
G1 X126.223 Y124.461 E.00858
G1 X125.123 Y124.461 E.0445
G1 X125.123 Y123.123 E.05414
G1 X133.754 Y123.123 E.3491
G1 X133.754 Y126 E.11637
G1 X132.389 Y126 E.05523
G3 X132.161 Y126.389 I-.308 J.08 E.02023
G1 X130.389 Y126.389 E.07169
G1 X130.389 Y128.161 E.07169
G1 X130.161 Y128.389 E.01302
G1 X127.839 Y128.389 E.09391
G1 X127.611 Y128.161 E.01302
G1 X127.611 Y127.389 E.03124
G1 X126.373 Y127.389 E.05009
G1 X126.223 Y127.539 E.00858
G1 X125.123 Y127.539 E.0445
G1 X125.123 Y128.877 E.05414
G1 X133.754 Y128.877 E.3491
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.301 Y125.699 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z2.8 I1.214 J-.08 P1  F30000
G1 X125.301 Y125.699 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2.68
; LAYER_HEIGHT: 0.0800002
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z3 I.963 J.744 P1  F30000
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
G1 X127.715 Y123.425 F30000
; FEATURE: Support
G1 F1200
G1 X127.391 Y123.748 E.01878
G1 X127.391 Y124.391 E.02642
G1 X125.748 Y124.391 E.06748
G1 X125.678 Y124.461 E.00407
G1 X125.123 Y124.461 E.02279
G1 X125.123 Y123.123 E.05496
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
M73 P68 R3
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
G3 Z3.08 I.344 J-1.167 P1  F30000
G1 X125.301 Y125.699 Z3.08
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126.301 E.02948
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126.79 E.04855
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 2.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X125.79 Y126.79 E-.60083
G1 X125.371 Y126.79 E-.15917
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
G3 Z3.2 I1.214 J-.082 P1  F30000
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
G3 Z3.36 I.538 J-1.092 P1  F30000
G1 X125.301 Y125.699 Z3.36
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z3.4 I1.214 J-.08 P1  F30000
G1 X125.301 Y125.699 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.24
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z3.6 I1.214 J-.083 P1  F30000
G1 X125.123 Y123.123 Z3.6
G1 Z3.24
M73 P69 R3
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
G3 Z3.64 I.538 J-1.092 P1  F30000
G1 X125.301 Y125.699 Z3.64
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.52
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z3.8 I1.214 J-.083 P1  F30000
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
G3 Z3.92 I.538 J-1.092 P1  F30000
G1 X125.301 Y125.699 Z3.92
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z4 I1.214 J-.083 P1  F30000
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
G1 X125.301 Y125.699 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z4.2 I1.214 J-.08 P1  F30000
G1 X125.301 Y125.699 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
M73 P70 R3
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.08
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z4.4 I1.214 J-.083 P1  F30000
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
G3 Z4.48 I.538 J-1.092 P1  F30000
G1 X125.301 Y125.699 Z4.48
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.36
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z4.6 I1.214 J-.083 P1  F30000
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
G3 Z4.76 I.538 J-1.092 P1  F30000
G1 X125.301 Y125.699 Z4.76
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z4.8 I1.214 J-.08 P1  F30000
G1 X125.301 Y125.699 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
M73 P70 R2
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.64
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
M73 P71 R2
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
; WIPE_END
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
G3 Z5 I1.214 J-.083 P1  F30000
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
G3 Z5.04 I.538 J-1.092 P1  F30000
G1 X125.301 Y125.699 Z5.04
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.92
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z5.2 I1.214 J-.083 P1  F30000
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
G3 Z5.32 I.538 J-1.092 P1  F30000
G1 X125.301 Y125.699 Z5.32
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z5.4 I1.214 J-.083 P1  F30000
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
G1 X125.301 Y125.699 Z5.6 F30000
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
M73 P72 R2
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z5.6 I1.214 J-.08 P1  F30000
G1 X125.301 Y125.699 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.48
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z5.8 I1.214 J-.083 P1  F30000
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
G3 Z5.88 I.538 J-1.092 P1  F30000
G1 X125.301 Y125.699 Z5.88
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.76
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z6 I1.214 J-.083 P1  F30000
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
G3 Z6.16 I.538 J-1.092 P1  F30000
G1 X125.301 Y125.699 Z6.16
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
M73 P73 R2
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z6.2 I1.214 J-.08 P1  F30000
G1 X125.301 Y125.699 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6.04
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z6.4 I1.214 J-.083 P1  F30000
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
G3 Z6.44 I.538 J-1.092 P1  F30000
G1 X125.301 Y125.699 Z6.44
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6.32
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z6.6 I1.214 J-.083 P1  F30000
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
G3 Z6.72 I.538 J-1.092 P1  F30000
G1 X125.301 Y125.699 Z6.72
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z6.8 I1.214 J-.083 P1  F30000
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
M73 P74 R2
G1 F24000
G1 X131.754 Y128.877 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.301 Y125.699 Z7 F30000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z7 I1.214 J-.08 P1  F30000
G1 X125.301 Y125.699 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X125.301 Y126.301 E.02948
G1 X125 Y126.301 E.01474
G1 X124.699 Y126.301 E.01474
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126.79 E.04855
G1 X125 Y126.79 E.02427
G1 X124.21 Y126.79 E.02427
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6.88
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F24000
G1 X125.79 Y126.79 E-.60083
G1 X125.371 Y126.79 E-.15917
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
G3 Z7.2 I1.214 J-.082 P1  F30000
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
G3 Z7.28 I.538 J-1.092 P1  F30000
G1 X125.301 Y125.699 Z7.28
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 7.16
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z7.4 I1.214 J-.083 P1  F30000
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
G3 Z7.56 I.538 J-1.092 P1  F30000
G1 X125.301 Y125.699 Z7.56
G1 Z7.2
M73 P75 R2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126.301 E.02948
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126.79 E.04855
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.79 Y126.79 E-.60083
G1 X125.371 Y126.79 E-.15917
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
G3 Z7.6 I1.214 J-.078 P1  F30000
G1 X125.301 Y125.699 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X125.301 Y126.301 E.02948
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126.79 E.04855
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 7.44
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X125.79 Y126.79 E-.60083
G1 X125.371 Y126.79 E-.15917
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
G3 Z7.8 I1.214 J-.082 P1  F30000
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
G3 Z7.84 I.538 J-1.092 P1  F30000
G1 X125.301 Y125.699 Z7.84
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 7.72
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z8 I1.214 J-.083 P1  F30000
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
G3 Z8.12 I.538 J-1.092 P1  F30000
G1 X125.301 Y125.699 Z8.12
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
M73 P76 R2
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z8.2 I1.214 J-.083 P1  F30000
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
G1 X125.301 Y125.699 Z8.4 F30000
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126.301 E.02948
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y126 E.01474
G1 X124.699 Y125.699 E.01474
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126.79 E.04855
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y126 E.02427
G1 X124.21 Y125.21 E.02427
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.79 Y126.79 E-.60083
G1 X125.371 Y126.79 E-.15917
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
G3 Z8.4 I1.214 J-.078 P1  F30000
G1 X125.301 Y125.699 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 8.28
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z8.6 I1.214 J-.083 P1  F30000
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
G3 Z8.68 I.538 J-1.092 P1  F30000
G1 X125.301 Y125.699 Z8.68
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 8.56
; LAYER_HEIGHT: 0.160001
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
; WIPE_END
M73 P77 R2
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
G3 Z8.8 I1.214 J-.083 P1  F30000
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
G3 Z8.96 I.538 J-1.092 P1  F30000
G1 X125.301 Y125.699 Z8.96
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z9 I1.214 J-.08 P1  F30000
G1 X125.301 Y125.699 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 8.84
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z9.2 I1.214 J-.083 P1  F30000
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
G3 Z9.24 I.538 J-1.092 P1  F30000
G1 X125.301 Y125.699 Z9.24
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 9.12
; LAYER_HEIGHT: 0.12
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z9.4 I1.214 J-.083 P1  F30000
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
G3 Z9.52 I.538 J-1.092 P1  F30000
G1 X125.301 Y125.699 Z9.52
M73 P78 R2
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z9.6 I1.214 J-.083 P1  F30000
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
G1 X125.301 Y125.699 Z9.8 F30000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z9.8 I1.214 J-.08 P1  F30000
G1 X125.301 Y125.699 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 9.68
; LAYER_HEIGHT: 0.0799999
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z10 I1.214 J-.083 P1  F30000
G1 X125.123 Y123.123 Z10
G1 Z9.68
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
M73 P79 R2
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
G3 Z10.08 I.538 J-1.092 P1  F30000
G1 X125.301 Y125.699 Z10.08
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 9.96
; LAYER_HEIGHT: 0.16
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z10.2 I1.214 J-.083 P1  F30000
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
G3 Z10.36 I.538 J-1.092 P1  F30000
G1 X125.301 Y125.699 Z10.36
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z10.4 I1.214 J-.08 P1  F30000
G1 X125.301 Y125.699 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 10.24
; LAYER_HEIGHT: 0.04
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z10.6 I1.214 J-.083 P1  F30000
G1 X125.123 Y123.123 Z10.6
G1 Z10.24
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
G3 Z10.64 I.538 J-1.092 P1  F30000
G1 X125.301 Y125.699 Z10.64
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
M73 P80 R2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 10.52
; LAYER_HEIGHT: 0.120001
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z10.8 I-1.192 J-.245 P1  F30000
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
M73 P80 R1
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
G3 Z10.92 I.452 J-1.13 P1  F30000
G1 X125.301 Y125.699 Z10.92
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126.301 E.02948
G1 X125 Y126.301 E.01474
G1 X124.699 Y126.301 E.01474
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126.79 E.04855
G1 X125 Y126.79 E.02427
G1 X124.21 Y126.79 E.02427
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.79 Y126.79 E-.60083
G1 X125.371 Y126.79 E-.15917
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
G3 Z11 I1.123 J.47 P1  F30000
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
M73 P81 R1
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
G1 X125.301 Y125.699 Z11.2 F30000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z11.2 I1.214 J-.08 P1  F30000
G1 X125.301 Y125.699 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
G1 F1200
G1 X125.301 Y126 E.01474
G1 X125.301 Y126.301 E.01474
G1 X124.699 Y126.301 E.02948
G1 X124.699 Y125.699 E.02948
G1 X125.241 Y125.699 E.02654
G1 X125.79 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X125.79 Y126 E.02427
G1 X125.79 Y126.79 E.02427
G1 X124.21 Y126.79 E.04855
G1 X124.21 Y125.21 E.04855
G1 X125.73 Y125.21 E.04671
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 11.0727
; LAYER_HEIGHT: 0.0727272
; WIPE_START
G1 F24000
G1 X125.79 Y126 E-.30107
G1 X125.79 Y126.79 E-.3002
G1 X125.372 Y126.79 E-.15873
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
G3 Z11.4 I.114 J1.212 P1  F30000
G1 X133.754 Y126 Z11.4
G1 Z11.073
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F1200
G1 X132.539 Y126 E.04883
G1 X132.539 Y126.223 E.00896
G1 X132.223 Y126.539 E.01792
G1 X130.539 Y126.539 E.06766
G1 X130.539 Y128.223 E.06766
G1 X130.223 Y128.539 E.01792
G1 X128 Y128.539 E.08929
G1 X128 Y128.877 E.0136
G1 X133.754 Y128.877 E.23112
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.127273
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
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
G3 Z11.473 I.5 J-1.11 P1  F30000
G1 X124.699 Y125.699 Z11.473
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.644381
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X125.742 Y125.699 E.05112
G1 X125.871 Y125.699 E.00632
G1 X126 Y125.699 E.00632
G1 X126.129 Y125.699 E.00632
M73 P82 R1
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
G1 X124.699 Y126.301 E.05112
G1 X124.699 Y125.759 E.02654
G1 X124.21 Y125.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
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
G1 X124.21 Y126.79 E.04984
G1 X124.21 Y125.27 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X125.832 Y125.21 E-.61678
G1 X125.916 Y125.21 E-.03192
G1 X126 Y125.21 E-.03192
G1 X126.084 Y125.21 E-.03192
G1 X126.168 Y125.21 E-.03192
G1 X126.2 Y125.21 E-.01216
G1 X126.209 Y125.21 E-.00338
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
G3 Z11.6 I-.263 J1.188 P1  F30000
G1 X133.754 Y126 Z11.6
G1 Z11.345
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F1200
G1 X132.539 Y126 E.04883
G1 X132.539 Y126.223 E.00896
G1 X132.223 Y126.539 E.01792
G1 X130.539 Y126.539 E.06766
G1 X130.539 Y128.223 E.06766
G1 X130.223 Y128.539 E.01792
G1 X128 Y128.539 E.08929
G1 X128 Y128.877 E.0136
G1 X133.754 Y128.877 E.23112
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.0545454
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
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
G3 Z11.745 I.96 J-.749 P1  F30000
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
G1 X128.021 Y126.301 E.00501
G1 X124.699 Y126.301 E.16283
G1 X124.699 Y125.699 E.02948
G1 X128.021 Y125.699 E.16283
G1 X128.109 Y125.646 E.00501
; LINE_WIDTH: 0.595786
G1 X128.196 Y125.593 E.0046
; LINE_WIDTH: 0.54719
M73 P83 R1
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
G3 Z12 I-.058 J1.216 P1  F30000
G1 X133.754 Y126 Z12
G1 Z11.618
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F1200
G1 X132.539 Y126 E.04883
G1 X132.539 Y126.223 E.00896
G1 X132.223 Y126.539 E.01792
G1 X130.539 Y126.539 E.06766
G1 X130.539 Y128.223 E.06766
G1 X130.223 Y128.539 E.01792
G1 X128 Y128.539 E.08929
G1 X128 Y128.877 E.0136
G1 X133.754 Y128.877 E.23112
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.181818
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
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
G3 Z12.018 I.96 J-.749 P1  F30000
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
G3 Z12.2 I-.058 J1.216 P1  F30000
G1 X133.754 Y126 Z12.2
G1 Z11.891
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F1200
G1 X132.539 Y126 E.04883
G1 X132.539 Y126.223 E.00896
G1 X132.223 Y126.539 E.01792
G1 X130.539 Y126.539 E.06766
G1 X130.539 Y128.223 E.06766
G1 X130.223 Y128.539 E.01792
G1 X128 Y128.539 E.08929
G1 X128 Y128.877 E.0136
G1 X133.754 Y128.877 E.23112
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.109091
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
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
G3 Z12.291 I.96 J-.749 P1  F30000
G1 X129.426 Y125.893 Z12.291
G1 Z12
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
M73 P84 R1
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
G3 Z12.4 I-.058 J1.216 P1  F30000
G1 X133.754 Y126 Z12.4
G1 Z12.164
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F1200
G1 X132.539 Y126 E.04883
G1 X132.539 Y126.223 E.00896
G1 X132.223 Y126.539 E.01792
G1 X130.539 Y126.539 E.06766
G1 X130.539 Y128.223 E.06766
G1 X130.223 Y128.539 E.01792
G1 X128 Y128.539 E.08929
G1 X128 Y128.877 E.0136
G1 X133.754 Y128.877 E.23112
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.0363636
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
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
G3 Z12.564 I.96 J-.749 P1  F30000
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
M73 P85 R1
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
G3 Z12.8 I-.058 J1.216 P1  F30000
G1 X133.754 Y126 Z12.8
G1 Z12.436
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F1200
G1 X132.539 Y126 E.04883
G1 X132.539 Y126.223 E.00896
G1 X132.223 Y126.539 E.01792
G1 X130.539 Y126.539 E.06766
G1 X130.539 Y128.223 E.06766
G1 X130.223 Y128.539 E.01792
G1 X128 Y128.539 E.08929
G1 X128 Y128.877 E.0136
G1 X133.754 Y128.877 E.23112
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.163637
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
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
G3 Z12.836 I.96 J-.749 P1  F30000
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
G3 Z13 I-.058 J1.216 P1  F30000
G1 X133.754 Y126 Z13
G1 Z12.709
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F1200
G1 X132.539 Y126 E.04883
G1 X132.539 Y126.223 E.00896
G1 X132.223 Y126.539 E.01792
G1 X130.539 Y126.539 E.06766
G1 X130.539 Y128.223 E.06766
G1 X130.223 Y128.539 E.01792
G1 X128 Y128.539 E.08929
G1 X128 Y128.877 E.0136
G1 X133.754 Y128.877 E.23112
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.090909
; WIPE_START
G1 F24000
M73 P86 R1
G1 X131.754 Y128.877 E-.76
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
G3 Z13.109 I.96 J-.749 P1  F30000
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
G3 Z13.2 I-.058 J1.216 P1  F30000
G1 X133.754 Y126 Z13.2
G1 Z12.982
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F1200
G1 X132.539 Y126 E.04883
G1 X132.539 Y126.223 E.00896
G1 X132.223 Y126.539 E.01792
G1 X130.539 Y126.539 E.06766
G1 X130.539 Y128.223 E.06766
G1 X130.223 Y128.539 E.01792
G1 X128 Y128.539 E.08929
G1 X128 Y128.877 E.0136
G1 X133.754 Y128.877 E.23112
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.0181818
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
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
G3 Z13.382 I.96 J-.749 P1  F30000
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
G3 Z13.6 I-.058 J1.216 P1  F30000
G1 X133.754 Y126 Z13.6
G1 Z13.255
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.272727
G1 F1200
G1 X132.539 Y126 E.04883
G1 X132.539 Y126.223 E.00896
G1 X132.223 Y126.539 E.01792
G1 X130.539 Y126.539 E.06766
G1 X130.539 Y128.223 E.06766
G1 X130.223 Y128.539 E.01792
G1 X128 Y128.539 E.08929
G1 X128 Y128.877 E.0136
G1 X133.754 Y128.877 E.23112
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.145454
; WIPE_START
G1 F24000
G1 X131.754 Y128.877 E-.76
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
G3 Z13.655 I.96 J-.749 P1  F30000
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
M73 P88 R1
G3 Z13.8 I.992 J-.705 P1  F30000
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
G1 X131.301 Y124.699 E.0648
M73 P89 R1
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
G3 Z14.4 I1.207 J-.152 P1  F30000
G1 X128.578 Y125.111 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1200
G1 X128.602 Y125.021 E.00309
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
G1 X128.526 Y126.691 E.00985
G1 X128.405 Y126.542 E.00638
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
G1 X128.563 Y125.169 E.00478
G1 X128.21 Y125.021 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X128.21 Y124.21 E.02493
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
M73 P90 R1
G1 F1200
G1 X130.168 Y127.79 E.00098
G1 X130.084 Y127.79 E.00258
G1 X130 Y127.79 E.00258
G1 X129.916 Y127.79 E.00258
G1 X129.832 Y127.79 E.00258
G1 X128.21 Y127.79 E.04984
G1 X128.185 Y126.885 E.02781
G1 X128.168 Y126.875 E.00062
G1 X128.094 Y126.832 E.00264
G1 X128.021 Y126.79 E.00257
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.133 Y125.168 E.00366
G1 X128.168 Y125.114 E.00197
G1 X128.185 Y125.076 E.00129
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
G3 Z14.6 I.062 J-1.215 P1  F30000
G1 X128.578 Y125.111 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1200
G1 X128.602 Y125.021 E.00309
G1 X128.602 Y124.602 E.01391
G1 X131.398 Y124.602 E.09274
G1 X131.398 Y126 E.04637
G1 X131.398 Y127.398 E.04637
G1 X128.602 Y127.398 E.09274
G1 X128.602 Y126.979 E.01391
G1 X128.526 Y126.691 E.00985
G1 X128.405 Y126.542 E.00638
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
G1 X128.563 Y125.169 E.00478
G1 X128.21 Y125.021 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
M73 P90 R0
G1 X131.79 Y126 E.055
G1 X131.79 Y127.79 E.055
G1 X128.21 Y127.79 E.11
G1 X128.185 Y126.885 E.02781
G1 X128.168 Y126.875 E.00062
G1 X128.094 Y126.832 E.00264
G1 X128.021 Y126.79 E.00257
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.133 Y125.168 E.00366
G1 X128.168 Y125.114 E.00197
G1 X128.185 Y125.076 E.00129
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
G3 Z14.8 I.88 J-.841 P1  F30000
G1 X128.578 Y125.111 Z14.8
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1200
G1 X128.602 Y125.021 E.00309
G1 X128.602 Y124.602 E.01391
G1 X131.398 Y124.602 E.09274
G1 X131.398 Y126 E.04637
G1 X131.398 Y127.398 E.04637
G1 X128.602 Y127.398 E.09274
G1 X128.602 Y126.979 E.01391
G1 X128.526 Y126.691 E.00985
G1 X128.405 Y126.542 E.00638
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
G1 X128.563 Y125.169 E.00478
G1 X128.21 Y125.021 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y126 E.055
G1 X131.79 Y127.79 E.055
G1 X128.21 Y127.79 E.11
G1 X128.185 Y126.885 E.02781
G1 X128.168 Y126.875 E.00062
G1 X128.094 Y126.832 E.00264
G1 X128.021 Y126.79 E.00257
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.133 Y125.168 E.00366
G1 X128.168 Y125.114 E.00197
G1 X128.185 Y125.076 E.00129
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
M73 P91 R0
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
G3 Z15 I.88 J-.841 P1  F30000
G1 X128.578 Y125.111 Z15
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1200
G1 X128.602 Y125.021 E.00309
G1 X128.602 Y124.602 E.01391
G1 X131.398 Y124.602 E.09274
G1 X131.398 Y126 E.04637
G1 X131.398 Y127.398 E.04637
G1 X128.602 Y127.398 E.09274
G1 X128.602 Y126.979 E.01391
G1 X128.526 Y126.691 E.00985
G1 X128.405 Y126.542 E.00638
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
G1 X128.563 Y125.169 E.00478
G1 X128.21 Y125.021 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y126 E.055
G1 X131.79 Y127.79 E.055
G1 X128.21 Y127.79 E.11
G1 X128.185 Y126.885 E.02781
G1 X128.168 Y126.875 E.00062
G1 X128.094 Y126.832 E.00264
G1 X128.021 Y126.79 E.00257
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.133 Y125.168 E.00366
G1 X128.168 Y125.114 E.00197
G1 X128.185 Y125.076 E.00129
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
G3 Z15.2 I.88 J-.841 P1  F30000
G1 X128.578 Y125.111 Z15.2
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1200
G1 X128.602 Y125.021 E.00309
G1 X128.602 Y124.602 E.01391
G1 X131.398 Y124.602 E.09274
G1 X131.398 Y126 E.04637
G1 X131.398 Y127.398 E.04637
G1 X128.602 Y127.398 E.09274
G1 X128.602 Y126.979 E.01391
G1 X128.526 Y126.691 E.00985
G1 X128.405 Y126.542 E.00638
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
G1 X128.563 Y125.169 E.00478
G1 X128.21 Y125.021 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X128.21 Y124.21 E.02493
G1 X131.79 Y124.21 E.11
G1 X131.79 Y126 E.055
G1 X131.79 Y127.79 E.055
G1 X128.21 Y127.79 E.11
G1 X128.185 Y126.885 E.02781
G1 X128.168 Y126.875 E.00062
G1 X128.094 Y126.832 E.00264
G1 X128.021 Y126.79 E.00257
G1 X124.21 Y126.79 E.11712
G1 X124.21 Y125.21 E.04855
G1 X128.021 Y125.21 E.11712
G1 X128.133 Y125.168 E.00366
G1 X128.168 Y125.114 E.00197
G1 X128.185 Y125.076 E.00129
M204 S10000
; WIPE_START
G1 F24000
G1 X128.21 Y124.21 E-.32926
G1 X129.344 Y124.21 E-.43074
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-.568 J1.076 P1  F30000
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
G1 X131.042 Y127.176
M73 P92 R0
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
G3 Z15.4 I.05 J1.216 P1  F30000
G1 X131.393 Y127.095 Z15.4
G1 Z15.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.44813
G1 F1200
G1 X131.12 Y127.373 E.01288
; LINE_WIDTH: 0.448677
G1 X130.755 Y127.602 E.01424
G1 X130.259 Y127.749 E.0171
; LINE_WIDTH: 0.441941
G1 X129.835 Y127.758 E.01378
; LINE_WIDTH: 0.440294
G1 X129.419 Y127.667 E.0138
; LINE_WIDTH: 0.44044
G1 X129.036 Y127.479 E.0138
G1 X128.71 Y127.206 E.01379
G1 X128.459 Y126.862 E.01379
; LINE_WIDTH: 0.440722
G1 X128.297 Y126.469 E.01378
G1 X128.236 Y126.055 E.01357
; LINE_WIDTH: 0.440862
G1 X128.274 Y125.626 E.01395
G1 X128.415 Y125.223 E.01386
; LINE_WIDTH: 0.440293
G1 X128.648 Y124.866 E.0138
; LINE_WIDTH: 0.440723
G1 X128.958 Y124.574 E.01379
G1 X129.322 Y124.37 E.01356
G1 X129.737 Y124.254 E.01394
; LINE_WIDTH: 0.441142
G1 X130.163 Y124.241 E.01384
G1 X130.576 Y124.33 E.01371
G1 X130.956 Y124.514 E.01371
G1 X131.282 Y124.785 E.01374
; LINE_WIDTH: 0.442126
G1 X131.535 Y125.123 E.01372
; LINE_WIDTH: 0.442735
G1 X131.704 Y125.521 E.0141
; LINE_WIDTH: 0.445485
G1 X131.773 Y126.023 E.01661
G1 X131.737 Y126.349 E.01078
; LINE_WIDTH: 0.446303
G1 X131.606 Y126.75 E.01387
; LINE_WIDTH: 0.447325
G1 X131.426 Y127.045 E.01139
M204 S10000
; WIPE_START
G1 F24000
G1 X131.12 Y127.373 E-.17059
G1 X130.755 Y127.602 E-.16368
G1 X130.259 Y127.749 E-.19649
G1 X129.835 Y127.758 E-.16102
G1 X129.66 Y127.719 E-.06822
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I1.144 J-.415 P1  F30000
G1 X128.799 Y125.343 Z15.6
G1 Z15.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.440438
G1 F1200
G1 X128.991 Y125.074 E.01069
; LINE_WIDTH: 0.448941
G1 X129.36 Y124.793 E.01536
G1 X129.81 Y124.644 E.01567
; LINE_WIDTH: 0.441702
G1 X130.189 Y124.643 E.01231
; LINE_WIDTH: 0.448676
G1 X130.584 Y124.764 E.01365
G1 X130.842 Y124.921 E.01
; LINE_WIDTH: 0.448031
G1 X131.067 Y125.142 E.01041
; LINE_WIDTH: 0.447325
G1 X131.227 Y125.388 E.00966
; LINE_WIDTH: 0.446305
G1 X131.337 Y125.695 E.01073
; LINE_WIDTH: 0.444959
G1 X131.37 Y126.016 E.01056
; LINE_WIDTH: 0.444574
G1 X131.325 Y126.351 E.01107
; LINE_WIDTH: 0.442798
G1 X131.202 Y126.658 E.01076
; LINE_WIDTH: 0.442041
G1 X131.009 Y126.926 E.01074
; LINE_WIDTH: 0.441494
G1 X130.758 Y127.141 E.01072
; LINE_WIDTH: 0.441373
G1 X130.463 Y127.289 E.01072
; LINE_WIDTH: 0.449049
G1 X130.007 Y127.366 E.0153
G1 X129.678 Y127.328 E.01096
; LINE_WIDTH: 0.448862
G1 X129.36 Y127.207 E.01125
G1 X128.991 Y126.926 E.01535
; LINE_WIDTH: 0.440438
G1 X128.777 Y126.615 E.01223
; LINE_WIDTH: 0.4489
G1 X128.645 Y126.171 E.01533
G1 X128.665 Y125.697 E.01569
; LINE_WIDTH: 0.440862
G1 X128.778 Y125.399 E.01034
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.991 Y125.074 E-.14756
G1 X129.36 Y124.793 E-.17638
G1 X129.81 Y124.644 E-.17996
G1 X130.189 Y124.643 E-.14399
G1 X130.471 Y124.729 E-.11211
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
G3 Z15.6 I-1.134 J.441 P1  F30000
G1 X131.392 Y127.097 Z15.6
G1 Z15.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.447855
G1 F1200
G1 X131.115 Y127.377 E.01299
; LINE_WIDTH: 0.448428
G1 X130.779 Y127.591 E.01316
; LINE_WIDTH: 0.448732
G3 X129.585 Y127.721 I-.801 J-1.8 E.04036
; LINE_WIDTH: 0.448623
G1 X129.186 Y127.572 E.01411
G1 X128.833 Y127.331 E.01411
G1 X128.548 Y127.013 E.01411
G1 X128.348 Y126.637 E.01411
G1 X128.244 Y126.223 E.01411
; LINE_WIDTH: 0.449757
G1 X128.242 Y125.796 E.01414
G1 X128.341 Y125.381 E.01415
; LINE_WIDTH: 0.448623
G1 X128.538 Y125.002 E.01411
G1 X128.856 Y124.649 E.01571
G1 X129.309 Y124.375 E.01751
; LINE_WIDTH: 0.441856
G1 X129.734 Y124.255 E.01436
; LINE_WIDTH: 0.440994
G1 X130.165 Y124.241 E.014
; LINE_WIDTH: 0.441779
G1 X130.556 Y124.324 E.01298
; LINE_WIDTH: 0.441959
G1 X130.951 Y124.51 E.01418
G1 X131.281 Y124.787 E.01403
; LINE_WIDTH: 0.442289
G1 X131.535 Y125.122 E.01369
; LINE_WIDTH: 0.442749
G1 X131.703 Y125.52 E.01407
; LINE_WIDTH: 0.446762
G1 X131.773 Y126.023 E.01669
G1 X131.737 Y126.344 E.01064
; LINE_WIDTH: 0.446148
G1 X131.605 Y126.753 E.01411
; LINE_WIDTH: 0.447112
G1 X131.424 Y127.046 E.01136
M204 S10000
; WIPE_START
G1 F24000
G1 X131.115 Y127.377 E-.17189
G1 X130.779 Y127.591 E-.15132
G1 X130.404 Y127.724 E-.15152
G1 X130.009 Y127.771 E-.15089
G1 X129.658 Y127.73 E-.13438
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I1.146 J-.409 P1  F30000
G1 X128.807 Y125.347 Z15.8
G1 Z15.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.439932
G1 F1200
G3 X129.242 Y124.86 I1.333 J.753 E.0213
; LINE_WIDTH: 0.44107
G3 X129.859 Y124.638 I.783 J1.211 E.02144
; LINE_WIDTH: 0.448674
G1 X130.315 Y124.671 E.01513
G1 X130.771 Y124.867 E.01643
; LINE_WIDTH: 0.447142
G1 X131.076 Y125.156 E.01382
G1 X131.226 Y125.385 E.00903
; LINE_WIDTH: 0.446158
G1 X131.337 Y125.695 E.01083
; LINE_WIDTH: 0.446762
G1 X131.37 Y125.988 E.0097
G1 X131.325 Y126.351 E.01204
; LINE_WIDTH: 0.442806
G1 X131.202 Y126.658 E.01076
; LINE_WIDTH: 0.442037
G1 X131.009 Y126.926 E.01074
; LINE_WIDTH: 0.441446
G1 X130.758 Y127.14 E.01072
; LINE_WIDTH: 0.441072
G1 X130.463 Y127.289 E.01071
; LINE_WIDTH: 0.440846
G3 X129.811 Y127.356 I-.461 J-1.282 E.02146
; LINE_WIDTH: 0.439932
G3 X128.665 Y126.304 I.228 J-1.399 E.05326
; LINE_WIDTH: 0.441068
G3 X128.677 Y125.649 I1.41 J-.303 E.02144
; LINE_WIDTH: 0.439932
G3 X128.779 Y125.4 I1.463 J.451 E.00873
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.991 Y125.074 E-.14774
G1 X129.242 Y124.86 E-.1254
G1 X129.513 Y124.723 E-.1152
G1 X129.859 Y124.638 E-.1354
G1 X130.315 Y124.671 E-.17386
G1 X130.466 Y124.736 E-.0624
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
G3 Z15.8 I-1.133 J.443 P1  F30000
G1 X131.39 Y127.099 Z15.8
G1 Z15.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.447637
G1 F1200
G1 X131.111 Y127.38 E.01307
; LINE_WIDTH: 0.448124
G1 X130.773 Y127.594 E.01322
; LINE_WIDTH: 0.448396
G1 X130.35 Y127.736 E.01473
G1 X129.832 Y127.757 E.01713
; LINE_WIDTH: 0.440249
G1 X129.416 Y127.666 E.01378
G1 X129.035 Y127.478 E.01378
G1 X128.709 Y127.204 E.01378
G1 X128.458 Y126.86 E.01378
G1 X128.297 Y126.466 E.01378
G1 X128.235 Y126.045 E.01378
G1 X128.276 Y125.621 E.01378
G1 X128.417 Y125.22 E.01378
G1 X128.649 Y124.863 E.01378
G1 X128.961 Y124.573 E.01378
G1 X129.332 Y124.366 E.01378
G1 X129.743 Y124.254 E.01378
; LINE_WIDTH: 0.440798
G1 X130.167 Y124.242 E.01376
G1 X130.58 Y124.333 E.01371
; LINE_WIDTH: 0.440175
G1 X130.959 Y124.519 E.01368
; LINE_WIDTH: 0.439702
G1 X131.283 Y124.789 E.01366
; LINE_WIDTH: 0.442454
G1 X131.535 Y125.122 E.01359
; LINE_WIDTH: 0.442764
G1 X131.703 Y125.52 E.01405
; LINE_WIDTH: 0.445012
G1 X131.773 Y126.023 E.01665
G1 X131.736 Y126.352 E.01084
; LINE_WIDTH: 0.445982
G1 X131.604 Y126.755 E.01393
; LINE_WIDTH: 0.446901
G1 X131.422 Y127.048 E.01137
M204 S10000
; WIPE_START
G1 F24000
G1 X131.111 Y127.38 E-.17293
G1 X130.773 Y127.594 E-.15212
G1 X130.35 Y127.736 E-.16938
G1 X129.832 Y127.757 E-.19705
G1 X129.656 Y127.719 E-.06853
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I1.145 J-.413 P1  F30000
G1 X128.799 Y125.343 Z16
G1 Z15.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.439548
G1 F1200
G3 X129.859 Y124.639 I1.201 J.657 E.04276
; LINE_WIDTH: 0.440409
G1 X130.189 Y124.644 E.01069
; LINE_WIDTH: 0.447932
G1 X130.612 Y124.779 E.01467
G1 X130.869 Y124.946 E.01009
; LINE_WIDTH: 0.44735
G1 X131.085 Y125.169 E.01024
; LINE_WIDTH: 0.446964
G1 X131.226 Y125.384 E.00847
; LINE_WIDTH: 0.445984
G1 X131.337 Y125.695 E.01086
; LINE_WIDTH: 0.444784
G1 X131.371 Y126.024 E.01082
; LINE_WIDTH: 0.443728
G1 X131.325 Y126.351 E.01079
; LINE_WIDTH: 0.442815
G1 X131.206 Y126.652 E.01052
; LINE_WIDTH: 0.441902
G1 X131.009 Y126.926 E.01098
; LINE_WIDTH: 0.441444
G1 X130.758 Y127.14 E.01072
; LINE_WIDTH: 0.440967
G1 X130.463 Y127.289 E.01071
; LINE_WIDTH: 0.440635
G1 X130.141 Y127.362 E.0107
; LINE_WIDTH: 0.440452
G1 X129.811 Y127.356 E.01069
; LINE_WIDTH: 0.439548
G3 X128.772 Y125.396 I.189 J-1.356 E.08359
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.992 Y125.075 E-.14793
G1 X129.242 Y124.86 E-.12538
G1 X129.537 Y124.712 E-.12539
G1 X129.859 Y124.639 E-.12538
G1 X130.189 Y124.644 E-.12542
G1 X130.466 Y124.732 E-.11051
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
G3 Z16 I-1.134 J.442 P1  F30000
G1 X131.389 Y127.101 Z16
M73 P93 R0
G1 Z15.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.447375
G1 F1200
G1 X131.106 Y127.384 E.01319
; LINE_WIDTH: 0.447823
G1 X130.766 Y127.597 E.01326
; LINE_WIDTH: 0.448067
G3 X129.565 Y127.715 I-.784 J-1.811 E.04049
; LINE_WIDTH: 0.447933
G1 X129.167 Y127.561 E.01408
G1 X128.817 Y127.316 E.01408
G1 X128.537 Y126.995 E.01408
G1 X128.341 Y126.616 E.01408
G1 X128.242 Y126.201 E.01408
G1 X128.245 Y125.775 E.01408
; LINE_WIDTH: 0.449791
G1 X128.351 Y125.362 E.01414
G1 X128.551 Y124.985 E.01414
; LINE_WIDTH: 0.447933
G1 X128.836 Y124.667 E.01408
G1 X129.188 Y124.427 E.01408
G1 X129.636 Y124.268 E.01568
G1 X130.168 Y124.242 E.01758
; LINE_WIDTH: 0.44068
G1 X130.581 Y124.334 E.01371
; LINE_WIDTH: 0.439914
G1 X130.96 Y124.52 E.01367
; LINE_WIDTH: 0.439266
G1 X131.284 Y124.792 E.01364
; LINE_WIDTH: 0.442618
G1 X131.536 Y125.122 E.01353
; LINE_WIDTH: 0.44278
G1 X131.703 Y125.519 E.01403
; LINE_WIDTH: 0.445001
G1 X131.773 Y126.023 E.01668
G1 X131.742 Y126.301 E.00917
; LINE_WIDTH: 0.445781
G1 X131.609 Y126.741 E.01509
; LINE_WIDTH: 0.446723
G1 X131.421 Y127.05 E.0119
M204 S10000
; WIPE_START
G1 F24000
G1 X131.106 Y127.384 E-.17434
G1 X130.766 Y127.597 E-.15268
G1 X130.386 Y127.728 E-.15265
G1 X129.988 Y127.77 E-.15211
G1 X129.653 Y127.727 E-.12821
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I1.141 J-.422 P1  F30000
G1 X128.784 Y125.377 Z16.2
G1 Z15.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.441234
G1 F1200
G1 X128.992 Y125.075 E.01192
; LINE_WIDTH: 0.439231
G3 X129.859 Y124.639 I1.086 J1.079 E.03189
; LINE_WIDTH: 0.43996
G1 X130.189 Y124.644 E.01068
; LINE_WIDTH: 0.447572
G1 X130.623 Y124.785 E.01505
G1 X130.879 Y124.955 E.01012
; LINE_WIDTH: 0.446997
G1 X131.095 Y125.183 E.01034
; LINE_WIDTH: 0.446761
G1 X131.226 Y125.384 E.00791
; LINE_WIDTH: 0.445802
G1 X131.337 Y125.695 E.01085
; LINE_WIDTH: 0.444698
G1 X131.371 Y126.024 E.01082
; LINE_WIDTH: 0.448397
G1 X131.336 Y126.295 E.00901
G1 X131.202 Y126.658 E.0128
; LINE_WIDTH: 0.442076
G1 X131.009 Y126.926 E.01074
; LINE_WIDTH: 0.441427
G1 X130.758 Y127.14 E.01072
; LINE_WIDTH: 0.440891
G1 X130.463 Y127.288 E.0107
; LINE_WIDTH: 0.440465
G1 X130.141 Y127.362 E.01069
; LINE_WIDTH: 0.440159
G1 X129.811 Y127.355 E.01068
; LINE_WIDTH: 0.43923
G3 X128.632 Y125.976 I.189 J-1.355 E.06408
; LINE_WIDTH: 0.442241
G3 X128.756 Y125.431 I1.541 J.065 E.01831
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.992 Y125.075 E-.16206
G1 X129.242 Y124.86 E-.12537
G1 X129.537 Y124.712 E-.12537
G1 X129.859 Y124.639 E-.12537
G1 X130.189 Y124.644 E-.1254
G1 X130.43 Y124.722 E-.09643
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
G3 Z16.2 I-1.129 J.454 P1  F30000
G1 X131.387 Y127.103 Z16.2
G1 Z16
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.447117
G1 F1200
G1 X131.102 Y127.388 E.01329
; LINE_WIDTH: 0.447527
G1 X130.759 Y127.6 E.0133
; LINE_WIDTH: 0.447743
G3 X129.554 Y127.712 I-.776 J-1.816 E.04056
; LINE_WIDTH: 0.4476
G1 X129.157 Y127.556 E.01407
G1 X128.81 Y127.309 E.01407
G1 X128.531 Y126.986 E.01407
G1 X128.338 Y126.606 E.01407
G1 X128.241 Y126.19 E.01407
G1 X128.246 Y125.764 E.01407
; LINE_WIDTH: 0.44962
G1 X128.355 Y125.352 E.01413
G1 X128.557 Y124.976 E.01414
; LINE_WIDTH: 0.4476
G1 X128.844 Y124.66 E.01407
G1 X129.198 Y124.423 E.01406
G1 X129.599 Y124.277 E.01407
G1 X130.072 Y124.232 E.01567
G1 X130.582 Y124.334 E.01717
; LINE_WIDTH: 0.439753
G1 X130.961 Y124.522 E.01367
; LINE_WIDTH: 0.438955
G1 X131.285 Y124.793 E.01363
; LINE_WIDTH: 0.442782
G1 X131.536 Y125.122 E.01347
G1 X131.703 Y125.518 E.014
; LINE_WIDTH: 0.444989
G1 X131.773 Y126.023 E.0167
G1 X131.736 Y126.352 E.01084
; LINE_WIDTH: 0.445625
G1 X131.604 Y126.755 E.01393
; LINE_WIDTH: 0.446511
G1 X131.419 Y127.052 E.0115
M204 S10000
; WIPE_START
G1 F24000
G1 X131.102 Y127.388 E-.17559
G1 X130.759 Y127.6 E-.15326
G1 X130.377 Y127.73 E-.15322
G1 X129.977 Y127.77 E-.15273
G1 X129.65 Y127.725 E-.12521
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I1.146 J-.409 P1  F30000
G1 X128.8 Y125.343 Z16.4
G1 Z16
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.438978
G1 F1200
G3 X129.859 Y124.639 I1.2 J.657 E.04269
; LINE_WIDTH: 0.439592
G3 X130.508 Y124.729 I.143 J1.354 E.02138
; LINE_WIDTH: 0.44666
G1 X130.889 Y124.964 E.01472
G1 X131.104 Y125.197 E.01044
; LINE_WIDTH: 0.446557
G1 X131.226 Y125.384 E.00734
; LINE_WIDTH: 0.445625
G1 X131.337 Y125.695 E.01085
; LINE_WIDTH: 0.444611
G1 X131.371 Y126.023 E.01077
; LINE_WIDTH: 0.443677
G1 X131.325 Y126.351 E.01083
; LINE_WIDTH: 0.442839
G1 X131.202 Y126.658 E.01076
; LINE_WIDTH: 0.442098
G1 X131.009 Y126.926 E.01074
; LINE_WIDTH: 0.441427
G1 X130.758 Y127.14 E.01072
; LINE_WIDTH: 0.440842
G1 X130.463 Y127.288 E.0107
; LINE_WIDTH: 0.440338
G1 X130.141 Y127.362 E.01069
; LINE_WIDTH: 0.439926
G1 X129.811 Y127.355 E.01067
; LINE_WIDTH: 0.438977
G3 X128.632 Y125.976 I.189 J-1.355 E.06404
; LINE_WIDTH: 0.443121
G1 X128.664 Y125.722 E.00837
G1 X128.779 Y125.4 E.01115
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.992 Y125.075 E-.14741
G1 X129.242 Y124.86 E-.12536
G1 X129.537 Y124.712 E-.12536
G1 X129.859 Y124.639 E-.12536
G1 X130.189 Y124.644 E-.12538
G1 X130.471 Y124.719 E-.11114
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
G3 Z16.4 I-1.136 J.436 P1  F30000
G1 X131.386 Y127.104 Z16.4
G1 Z16.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.4463
G1 F1200
G1 X131.385 Y127.107 E.00009
; LINE_WIDTH: 0.44686
G1 X131.097 Y127.391 E.01333
; LINE_WIDTH: 0.447236
G1 X130.752 Y127.604 E.01334
; LINE_WIDTH: 0.447425
G3 X129.544 Y127.709 I-.768 J-1.821 E.04063
; LINE_WIDTH: 0.447273
G1 X129.148 Y127.55 E.01405
G1 X128.802 Y127.302 E.01405
G1 X128.525 Y126.977 E.01405
G1 X128.334 Y126.596 E.01405
G1 X128.24 Y126.18 E.01405
G1 X128.248 Y125.753 E.01405
; LINE_WIDTH: 0.449341
G1 X128.359 Y125.342 E.01412
G1 X128.564 Y124.967 E.01412
; LINE_WIDTH: 0.447273
G1 X128.852 Y124.654 E.01405
G1 X129.208 Y124.418 E.01405
G1 X129.61 Y124.274 E.01405
G1 X130.035 Y124.231 E.01409
G3 X130.813 Y124.43 I-.036 J1.762 E.0267
; LINE_WIDTH: 0.446888
G1 X131.182 Y124.687 E.01481
; LINE_WIDTH: 0.446341
G1 X131.536 Y125.122 E.01843
; LINE_WIDTH: 0.442945
G1 X131.702 Y125.517 E.01398
; LINE_WIDTH: 0.444978
G1 X131.773 Y126.023 E.01673
G1 X131.736 Y126.352 E.01084
; LINE_WIDTH: 0.445452
G1 X131.603 Y126.755 E.01393
; LINE_WIDTH: 0.4463
G1 X131.418 Y127.053 E.01154
M204 S10000
; WIPE_START
G1 F24000
G1 X131.385 Y127.107 E-.02386
G1 X131.097 Y127.391 E-.1539
G1 X130.752 Y127.604 E-.15384
G1 X130.368 Y127.732 E-.15379
G1 X129.966 Y127.769 E-.15335
G1 X129.65 Y127.724 E-.12127
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I1.146 J-.409 P1  F30000
G1 X128.8 Y125.343 Z16.6
G1 Z16.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.438791
G1 F1200
G3 X129.859 Y124.639 I1.2 J.657 E.04267
; LINE_WIDTH: 0.439302
G3 X130.507 Y124.729 I.142 J1.353 E.02136
; LINE_WIDTH: 0.446341
G1 X130.899 Y124.973 E.01515
G1 X131.202 Y125.342 E.01571
; LINE_WIDTH: 0.444527
G1 X131.337 Y125.695 E.01238
G1 X131.371 Y126.023 E.01078
; LINE_WIDTH: 0.443657
G1 X131.325 Y126.351 E.01083
; LINE_WIDTH: 0.442856
G1 X131.202 Y126.658 E.01076
; LINE_WIDTH: 0.442128
G1 X131.009 Y126.926 E.01074
; LINE_WIDTH: 0.441445
G1 X130.758 Y127.14 E.01072
; LINE_WIDTH: 0.440821
G1 X130.463 Y127.288 E.0107
; LINE_WIDTH: 0.440255
G1 X130.141 Y127.361 E.01068
; LINE_WIDTH: 0.439751
G1 X129.811 Y127.355 E.01067
; LINE_WIDTH: 0.43879
G3 X128.632 Y125.976 I.189 J-1.355 E.064
; LINE_WIDTH: 0.444187
G1 X128.662 Y125.737 E.00789
G1 X128.78 Y125.4 E.01167
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X128.992 Y125.075 E-.14737
G1 X129.242 Y124.861 E-.12535
G1 X129.537 Y124.712 E-.12535
G1 X129.859 Y124.639 E-.12535
G1 X130.189 Y124.644 E-.12537
G1 X130.472 Y124.72 E-.11121
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
G3 Z16.6 I-1.137 J.435 P1  F30000
G1 X131.384 Y127.106 Z16.6
G1 Z16.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.446091
G1 F1200
G1 X131.382 Y127.11 E.00016
; LINE_WIDTH: 0.446606
G1 X131.092 Y127.395 E.01337
; LINE_WIDTH: 0.446948
G1 X130.745 Y127.607 E.01338
; LINE_WIDTH: 0.447113
G3 X129.533 Y127.706 I-.76 J-1.825 E.0407
; LINE_WIDTH: 0.446954
G1 X129.139 Y127.545 E.01404
G1 X128.794 Y127.294 E.01404
G1 X128.519 Y126.968 E.01404
G1 X128.331 Y126.585 E.01404
G1 X128.241 Y126.181 E.01362
; LINE_WIDTH: 0.448972
G1 X128.251 Y125.743 E.01451
G1 X128.362 Y125.331 E.01411
; LINE_WIDTH: 0.446954
G1 X128.57 Y124.959 E.01404
G1 X128.861 Y124.647 E.01404
G1 X129.207 Y124.42 E.01362
; LINE_WIDTH: 0.448972
G1 X129.62 Y124.273 E.01451
G1 X130.046 Y124.232 E.01414
; LINE_WIDTH: 0.446984
G3 X130.825 Y124.437 I-.047 J1.761 E.02678
; LINE_WIDTH: 0.446567
G1 X131.159 Y124.667 E.01334
; LINE_WIDTH: 0.446038
G1 X131.458 Y125.004 E.01482
; LINE_WIDTH: 0.445335
G1 X131.704 Y125.521 E.01878
; LINE_WIDTH: 0.444969
G1 X131.773 Y126.023 E.0166
G1 X131.736 Y126.352 E.01084
; LINE_WIDTH: 0.4453
G1 X131.603 Y126.755 E.01392
; LINE_WIDTH: 0.446091
G1 X131.416 Y127.055 E.0116
M204 S10000
; WIPE_START
G1 F24000
G1 X131.382 Y127.11 E-.02467
G1 X131.092 Y127.395 E-.15448
G1 X130.745 Y127.607 E-.15442
G1 X130.359 Y127.733 E-.15436
G1 X129.955 Y127.769 E-.15397
G1 X129.648 Y127.723 E-.11809
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I1.146 J-.409 P1  F30000
G1 X128.8 Y125.343 Z16.8
G1 Z16.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.43867
G1 F1200
G3 X129.242 Y124.861 I1.2 J.657 E.02133
; LINE_WIDTH: 0.448972
G1 X129.745 Y124.66 E.01791
G1 X130.189 Y124.645 E.01469
; LINE_WIDTH: 0.43909
G1 X130.507 Y124.729 E.01065
; LINE_WIDTH: 0.438579
G1 X130.797 Y124.888 E.01063
; LINE_WIDTH: 0.445335
G1 X131.115 Y125.214 E.01495
G1 X131.327 Y125.653 E.01599
; LINE_WIDTH: 0.443637
G1 X131.371 Y126.023 E.01215
G1 X131.325 Y126.351 E.01082
; LINE_WIDTH: 0.442887
G1 X131.202 Y126.658 E.01076
; LINE_WIDTH: 0.442163
G1 X131.009 Y126.926 E.01074
; LINE_WIDTH: 0.441478
G1 X130.758 Y127.14 E.01072
; LINE_WIDTH: 0.440827
G1 X130.463 Y127.288 E.0107
; LINE_WIDTH: 0.440212
G1 X130.141 Y127.361 E.01068
; LINE_WIDTH: 0.439635
G1 X129.811 Y127.355 E.01066
; LINE_WIDTH: 0.438669
G3 X128.666 Y126.304 I.228 J-1.398 E.05306
; LINE_WIDTH: 0.448972
G1 X128.656 Y125.763 E.01791
G1 X128.78 Y125.4 E.0127
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.992 Y125.075 E-.14732
G1 X129.242 Y124.861 E-.12534
G1 X129.745 Y124.66 E-.20564
G1 X130.189 Y124.645 E-.16868
G1 X130.476 Y124.721 E-.11301
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
G3 Z16.8 I-1.138 J.432 P1  F30000
G1 X131.383 Y127.108 Z16.8
G1 Z16.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.445884
G1 F1200
G1 X131.379 Y127.114 E.00023
; LINE_WIDTH: 0.446354
G1 X131.087 Y127.399 E.01342
; LINE_WIDTH: 0.446663
G1 X130.738 Y127.61 E.01342
; LINE_WIDTH: 0.446807
G3 X129.558 Y127.71 I-.748 J-1.813 E.03958
; LINE_WIDTH: 0.448525
G1 X129.13 Y127.539 E.01526
G1 X128.786 Y127.287 E.01409
; LINE_WIDTH: 0.446643
G1 X128.513 Y126.959 E.01403
G1 X128.327 Y126.575 E.01403
G1 X128.245 Y126.194 E.01284
; LINE_WIDTH: 0.448524
G1 X128.252 Y125.732 E.01526
G1 X128.366 Y125.321 E.01409
; LINE_WIDTH: 0.446643
G1 X128.576 Y124.95 E.01403
G1 X128.869 Y124.64 E.01403
G1 X129.196 Y124.427 E.01284
; LINE_WIDTH: 0.448525
G1 X129.631 Y124.271 E.01526
G1 X130.056 Y124.232 E.01412
; LINE_WIDTH: 0.446666
G1 X130.441 Y124.289 E.0128
; LINE_WIDTH: 0.449295
G1 X130.836 Y124.445 E.01406
G1 X131.17 Y124.677 E.01348
; LINE_WIDTH: 0.445751
G1 X131.467 Y125.019 E.01486
; LINE_WIDTH: 0.445081
G1 X131.705 Y125.521 E.01821
; LINE_WIDTH: 0.453945
G1 X131.769 Y126.024 E.01697
G1 X131.738 Y126.326 E.01016
; LINE_WIDTH: 0.445134
G1 X131.603 Y126.755 E.01477
; LINE_WIDTH: 0.445884
M73 P94 R0
G1 X131.414 Y127.057 E.01167
M204 S10000
; WIPE_START
G1 F24000
G1 X131.379 Y127.114 E-.02547
G1 X131.087 Y127.399 E-.15507
G1 X130.738 Y127.61 E-.155
G1 X130.35 Y127.735 E-.15495
G1 X129.945 Y127.768 E-.15459
G1 X129.646 Y127.723 E-.11492
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I1.147 J-.407 P1  F30000
G1 X128.8 Y125.343 Z17
G1 Z16.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.438616
G1 F1200
G3 X129.243 Y124.861 I1.2 J.657 E.02132
; LINE_WIDTH: 0.448525
G1 X129.756 Y124.657 E.01824
G1 X130.189 Y124.645 E.01432
; LINE_WIDTH: 0.449295
G1 X130.676 Y124.818 E.01712
G1 X131.008 Y125.075 E.01391
; LINE_WIDTH: 0.437694
G1 X131.221 Y125.386 E.01212
; LINE_WIDTH: 0.44436
G1 X131.337 Y125.695 E.01081
; LINE_WIDTH: 0.453945
G3 X131.335 Y126.32 I-2.05 J.305 E.02101
; LINE_WIDTH: 0.445063
G1 X131.202 Y126.658 E.01189
; LINE_WIDTH: 0.442209
G1 X131.009 Y126.926 E.01074
; LINE_WIDTH: 0.441528
G1 X130.758 Y127.14 E.01072
; LINE_WIDTH: 0.44086
G1 X130.463 Y127.288 E.0107
; LINE_WIDTH: 0.440209
G1 X130.141 Y127.361 E.01068
; LINE_WIDTH: 0.439577
G1 X129.811 Y127.355 E.01066
; LINE_WIDTH: 0.448525
G1 X129.292 Y127.167 E.01824
G1 X128.96 Y126.889 E.01432
; LINE_WIDTH: 0.438616
G3 X128.666 Y126.304 I1.04 J-.889 E.02132
; LINE_WIDTH: 0.448524
G1 X128.658 Y125.752 E.01824
G1 X128.78 Y125.4 E.01234
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X128.992 Y125.075 E-.14735
G1 X129.243 Y124.861 E-.12534
G1 X129.756 Y124.657 E-.20974
G1 X130.189 Y124.645 E-.16464
G1 X130.469 Y124.744 E-.11292
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
G3 Z17 I-1.135 J.438 P1  F30000
G1 X131.381 Y127.11 Z17
G1 Z16.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.445661
G1 F1200
G1 X131.377 Y127.116 E.00025
; LINE_WIDTH: 0.446105
G1 X131.082 Y127.403 E.0135
; LINE_WIDTH: 0.446382
G1 X130.731 Y127.613 E.01346
; LINE_WIDTH: 0.446506
G3 X129.513 Y127.7 I-.744 J-1.834 E.04084
; LINE_WIDTH: 0.446339
G1 X129.12 Y127.534 E.01402
G1 X128.778 Y127.279 E.01402
G1 X128.508 Y126.95 E.01402
G1 X128.399 Y126.736 E.00789
; LINE_WIDTH: 0.44378
G1 X128.252 Y126.233 E.01709
; LINE_WIDTH: 0.448005
G1 X128.254 Y125.721 E.0169
G1 X128.371 Y125.311 E.01408
; LINE_WIDTH: 0.446339
G1 X128.583 Y124.941 E.01402
G1 X128.745 Y124.764 E.00789
; LINE_WIDTH: 0.443782
G1 X129.162 Y124.449 E.01709
; LINE_WIDTH: 0.448006
G1 X129.641 Y124.269 E.0169
G1 X130.067 Y124.232 E.0141
; LINE_WIDTH: 0.446356
G3 X130.849 Y124.45 I-.069 J1.761 E.02693
; LINE_WIDTH: 0.445966
G1 X131.182 Y124.687 E.01341
; LINE_WIDTH: 0.445481
G1 X131.476 Y125.033 E.0149
; LINE_WIDTH: 0.45707
G1 X131.715 Y125.571 E.01985
G1 X131.768 Y126.024 E.0154
; LINE_WIDTH: 0.454844
G1 X131.738 Y126.323 E.0101
; LINE_WIDTH: 0.44497
G1 X131.602 Y126.756 E.01485
; LINE_WIDTH: 0.445661
G1 X131.413 Y127.059 E.01173
M204 S10000
; WIPE_START
G1 F24000
G1 X131.377 Y127.116 E-.02573
G1 X131.082 Y127.403 E-.15618
G1 X130.731 Y127.613 E-.15559
G1 X130.341 Y127.737 E-.15553
G1 X129.934 Y127.768 E-.15521
G1 X129.643 Y127.721 E-.11176
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I1.147 J-.407 P1  F30000
G1 X128.8 Y125.343 Z17.2
G1 Z16.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.440609
G1 F1200
G1 X129.005 Y125.063 E.01124
; LINE_WIDTH: 0.448522
G1 X129.411 Y124.769 E.01658
G1 X129.859 Y124.639 E.01541
; LINE_WIDTH: 0.4389
G3 X130.507 Y124.73 I.142 J1.353 E.02134
; LINE_WIDTH: 0.438221
G1 X130.796 Y124.888 E.01062
; LINE_WIDTH: 0.437544
G1 X131.039 Y125.111 E.0106
; LINE_WIDTH: 0.438875
G1 X131.228 Y125.402 E.01118
; LINE_WIDTH: 0.44662
G1 X131.359 Y125.89 E.01663
G1 X131.325 Y126.351 E.01521
; LINE_WIDTH: 0.442933
G1 X131.202 Y126.658 E.01077
; LINE_WIDTH: 0.442263
G1 X131.009 Y126.926 E.01075
; LINE_WIDTH: 0.441592
G1 X130.758 Y127.14 E.01072
; LINE_WIDTH: 0.44092
G1 X130.463 Y127.288 E.0107
; LINE_WIDTH: 0.440246
G1 X130.141 Y127.361 E.01068
; LINE_WIDTH: 0.439575
G1 X129.811 Y127.355 E.01066
; LINE_WIDTH: 0.438626
G3 X128.96 Y126.889 I.271 J-1.506 E.03184
; LINE_WIDTH: 0.440609
G1 X128.771 Y126.598 E.01124
; LINE_WIDTH: 0.44852
G1 X128.64 Y126.114 E.01658
G1 X128.673 Y125.663 E.01497
; LINE_WIDTH: 0.438627
G1 X128.778 Y125.399 E.00914
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.005 Y125.063 E-.15401
G1 X129.411 Y124.769 E-.19059
G1 X129.859 Y124.639 E-.17718
G1 X130.189 Y124.645 E-.12535
G1 X130.476 Y124.721 E-.11286
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
G3 Z17.2 I-1.138 J.43 P1  F30000
G1 X131.379 Y127.111 Z17.2
G1 Z17
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.445411
G1 F1200
G1 X131.376 Y127.116 E.00019
; LINE_WIDTH: 0.445857
G1 X131.078 Y127.407 E.01368
; LINE_WIDTH: 0.446104
G1 X130.724 Y127.616 E.0135
; LINE_WIDTH: 0.446208
G3 X129.502 Y127.698 I-.736 J-1.838 E.04092
; LINE_WIDTH: 0.446043
G1 X129.11 Y127.529 E.01401
G1 X128.77 Y127.272 E.01401
G1 X128.502 Y126.94 E.01401
G1 X128.32 Y126.555 E.01401
G1 X128.236 Y126.136 E.01401
G1 X128.255 Y125.71 E.01401
G1 X128.375 Y125.301 E.01401
G1 X128.589 Y124.933 E.01401
G1 X128.886 Y124.626 E.01401
G1 X129.247 Y124.399 E.01401
G1 X129.652 Y124.266 E.01401
G1 X130.078 Y124.233 E.01403
G3 X130.861 Y124.457 I-.08 J1.76 E.02702
; LINE_WIDTH: 0.445682
G1 X131.193 Y124.698 E.01345
; LINE_WIDTH: 0.445225
G1 X131.485 Y125.047 E.01495
; LINE_WIDTH: 0.444628
G1 X131.705 Y125.521 E.01709
; LINE_WIDTH: 0.444936
G1 X131.773 Y126.023 E.0166
G1 X131.735 Y126.352 E.01084
; LINE_WIDTH: 0.444812
G1 X131.602 Y126.756 E.01392
; LINE_WIDTH: 0.445411
G1 X131.411 Y127.061 E.01179
M204 S10000
; WIPE_START
G1 F24000
G1 X131.376 Y127.116 E-.02496
G1 X131.078 Y127.407 E-.15829
G1 X130.724 Y127.616 E-.15618
G1 X130.332 Y127.739 E-.15612
G1 X129.923 Y127.768 E-.15584
G1 X129.641 Y127.721 E-.1086
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I1.147 J-.406 P1  F30000
G1 X128.8 Y125.343 Z17.4
G1 Z17
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.438703
G1 F1200
G3 X129.859 Y124.639 I1.2 J.657 E.04266
; LINE_WIDTH: 0.438918
G3 X130.507 Y124.73 I.142 J1.353 E.02134
; LINE_WIDTH: 0.438189
G1 X130.796 Y124.888 E.01062
; LINE_WIDTH: 0.437448
G1 X131.039 Y125.111 E.0106
; LINE_WIDTH: 0.436689
G1 X131.221 Y125.386 E.01057
; LINE_WIDTH: 0.444194
G3 X131.37 Y126.024 I-1.149 J.606 E.02167
; LINE_WIDTH: 0.443575
G1 X131.325 Y126.351 E.01079
; LINE_WIDTH: 0.442961
G1 X131.202 Y126.658 E.01077
; LINE_WIDTH: 0.442324
G1 X131.009 Y126.926 E.01075
; LINE_WIDTH: 0.441672
G1 X130.758 Y127.14 E.01073
; LINE_WIDTH: 0.441006
G1 X130.463 Y127.288 E.01071
; LINE_WIDTH: 0.442314
G1 X130.187 Y127.357 E.00926
G1 X129.811 Y127.355 E.01222
; LINE_WIDTH: 0.438703
G3 X128.772 Y125.396 I.189 J-1.355 E.08338
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 17.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.992 Y125.075 E-.14789
G1 X129.242 Y124.861 E-.12534
G1 X129.537 Y124.712 E-.12535
G1 X129.859 Y124.639 E-.12534
G1 X130.189 Y124.645 E-.12535
G1 X130.47 Y124.72 E-.11072
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
G3 Z17.4 I-1.138 J.431 P1  F30000
G1 X131.378 Y127.113 Z17.4
G1 Z17.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.445172
G1 F1200
G1 X131.376 Y127.116 E.00012
; LINE_WIDTH: 0.445612
G1 X131.073 Y127.41 E.01385
; LINE_WIDTH: 0.445829
G1 X130.717 Y127.62 E.01355
G1 X130.241 Y127.752 E.01624
; LINE_WIDTH: 0.442488
G1 X129.728 Y127.742 E.0167
; LINE_WIDTH: 0.44033
G1 X129.291 Y127.613 E.01475
; LINE_WIDTH: 0.442372
G1 X128.863 Y127.346 E.01642
; LINE_WIDTH: 0.44679
G1 X128.496 Y126.931 E.01821
G1 X128.317 Y126.544 E.01404
; LINE_WIDTH: 0.445754
G1 X128.232 Y126.077 E.01558
G1 X128.296 Y125.541 E.01771
; LINE_WIDTH: 0.438848
G1 X128.468 Y125.128 E.01444
; LINE_WIDTH: 0.44033
G1 X128.743 Y124.765 E.01475
; LINE_WIDTH: 0.442372
G1 X129.145 Y124.46 E.01642
; LINE_WIDTH: 0.44679
G1 X129.663 Y124.264 E.01821
G1 X130.088 Y124.233 E.01405
; LINE_WIDTH: 0.445763
G1 X130.495 Y124.302 E.01352
G1 X130.873 Y124.463 E.01352
; LINE_WIDTH: 0.44541
G1 X131.204 Y124.708 E.0135
; LINE_WIDTH: 0.451098
G1 X131.492 Y125.064 E.01522
; LINE_WIDTH: 0.456766
G1 X131.714 Y125.567 E.01856
G1 X131.773 Y126.023 E.01551
; LINE_WIDTH: 0.444925
G1 X131.735 Y126.352 E.01084
; LINE_WIDTH: 0.444657
G1 X131.602 Y126.756 E.01392
; LINE_WIDTH: 0.445172
G1 X131.41 Y127.062 E.01186
M204 S10000
; WIPE_START
G1 F24000
G1 X131.376 Y127.116 E-.02419
G1 X131.073 Y127.41 E-.16041
G1 X130.717 Y127.62 E-.15678
G1 X130.241 Y127.752 E-.188
G1 X129.728 Y127.742 E-.19489
G1 X129.638 Y127.715 E-.03573
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I1.147 J-.405 P1  F30000
G1 X128.8 Y125.343 Z17.6
G1 Z17.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.44033
G1 F1200
G1 X129.003 Y125.065 E.01117
; LINE_WIDTH: 0.451626
G1 X129.428 Y124.766 E.01729
G1 X129.859 Y124.639 E.01496
; LINE_WIDTH: 0.439012
G3 X130.507 Y124.729 I.142 J1.353 E.02135
; LINE_WIDTH: 0.438253
G1 X130.796 Y124.888 E.01062
; LINE_WIDTH: 0.438528
G1 X131.048 Y125.124 E.01111
; LINE_WIDTH: 0.447397
G1 X131.283 Y125.541 E.01578
G1 X131.37 Y126.024 E.01619
; LINE_WIDTH: 0.443554
G1 X131.325 Y126.351 E.01079
; LINE_WIDTH: 0.442991
G1 X131.202 Y126.658 E.01077
; LINE_WIDTH: 0.442391
G1 X131.009 Y126.926 E.01075
; LINE_WIDTH: 0.441769
G1 X130.758 Y127.141 E.01073
; LINE_WIDTH: 0.441119
G1 X130.463 Y127.288 E.01071
; LINE_WIDTH: 0.440441
G1 X130.141 Y127.361 E.01069
; LINE_WIDTH: 0.439741
G1 X129.811 Y127.355 E.01067
; LINE_WIDTH: 0.44033
G1 X129.479 Y127.264 E.01117
; LINE_WIDTH: 0.451626
G1 X129.049 Y126.972 E.01729
G1 X128.777 Y126.615 E.01496
; LINE_WIDTH: 0.438847
G3 X128.772 Y125.396 I1.223 J-.615 E.04074
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 17.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.003 Y125.065 E-.1536
G1 X129.428 Y124.766 E-.19724
G1 X129.859 Y124.639 E-.1707
G1 X130.189 Y124.645 E-.12536
G1 X130.476 Y124.721 E-.11311
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
G3 Z17.6 I-1.139 J.428 P1  F30000
G1 X131.376 Y127.115 Z17.6
G1 Z17.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.444943
G1 F1200
G1 X131.375 Y127.117 E.00005
; LINE_WIDTH: 0.445342
G1 X131.069 Y127.413 E.01396
; LINE_WIDTH: 0.445557
G1 X130.71 Y127.623 E.01365
G1 X130.314 Y127.743 E.01358
G1 X129.901 Y127.767 E.01356
G1 X129.481 Y127.692 E.014
G1 X129.091 Y127.518 E.014
G1 X128.7 Y127.198 E.01661
; LINE_WIDTH: 0.442409
G1 X128.419 Y126.783 E.0163
; LINE_WIDTH: 0.440304
G1 X128.27 Y126.334 E.01533
; LINE_WIDTH: 0.441881
G1 X128.246 Y125.839 E.01611
; LINE_WIDTH: 0.446166
G1 X128.383 Y125.284 E.01876
G1 X128.602 Y124.915 E.01412
; LINE_WIDTH: 0.445472
G1 X128.902 Y124.612 E.01399
G1 X129.266 Y124.39 E.01399
G1 X129.673 Y124.261 E.01399
G1 X130.099 Y124.233 E.014
G1 X130.506 Y124.305 E.01356
G1 X130.885 Y124.47 E.01356
; LINE_WIDTH: 0.445152
G1 X131.216 Y124.718 E.01354
; LINE_WIDTH: 0.444759
G1 X131.494 Y125.055 E.01429
; LINE_WIDTH: 0.444251
G1 X131.705 Y125.521 E.01674
; LINE_WIDTH: 0.444916
G1 X131.773 Y126.024 E.01661
G1 X131.735 Y126.352 E.01084
; LINE_WIDTH: 0.444505
G1 X131.601 Y126.756 E.01392
; LINE_WIDTH: 0.444943
G1 X131.408 Y127.064 E.01192
M204 S10000
; WIPE_START
G1 F24000
G1 X131.375 Y127.117 E-.02342
G1 X131.069 Y127.413 E-.16175
G1 X130.71 Y127.623 E-.15814
G1 X130.314 Y127.743 E-.15732
G1 X129.901 Y127.767 E-.1571
G1 X129.636 Y127.719 E-.10226
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I1.148 J-.404 P1  F30000
G1 X128.8 Y125.343 Z17.8
G1 Z17.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.439057
G1 F1200
G3 X129.859 Y124.639 I1.2 J.657 E.0427
; LINE_WIDTH: 0.43918
G3 X130.507 Y124.729 I.142 J1.354 E.02136
; LINE_WIDTH: 0.438414
G1 X130.796 Y124.888 E.01063
; LINE_WIDTH: 0.437617
G1 X131.039 Y125.111 E.0106
; LINE_WIDTH: 0.436783
G1 X131.221 Y125.386 E.01058
; LINE_WIDTH: 0.444031
G3 X131.371 Y126.023 I-1.152 J.606 E.02164
; LINE_WIDTH: 0.443533
G1 X131.325 Y126.351 E.01081
; LINE_WIDTH: 0.443023
G1 X131.202 Y126.658 E.01077
; LINE_WIDTH: 0.442469
G1 X131.009 Y126.926 E.01075
; LINE_WIDTH: 0.441879
G1 X130.758 Y127.141 E.01073
; LINE_WIDTH: 0.441257
G1 X130.463 Y127.289 E.01071
; LINE_WIDTH: 0.440598
G1 X130.141 Y127.362 E.01069
; LINE_WIDTH: 0.439908
G1 X129.811 Y127.355 E.01067
; LINE_WIDTH: 0.439056
G3 X128.777 Y126.615 I.189 J-1.355 E.0427
; LINE_WIDTH: 0.440304
M73 P95 R0
G1 X128.664 Y126.29 E.01114
; LINE_WIDTH: 0.446099
G1 X128.649 Y125.826 E.01526
G1 X128.782 Y125.4 E.01465
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 17.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.992 Y125.075 E-.14719
G1 X129.242 Y124.86 E-.12536
G1 X129.537 Y124.712 E-.12536
G1 X129.859 Y124.639 E-.12536
G1 X130.189 Y124.645 E-.12537
G1 X130.472 Y124.72 E-.11137
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
G3 Z17.8 I-1.139 J.429 P1  F30000
G1 X131.374 Y127.117 Z17.8
G1 Z17.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.445045
G1 F1200
G1 X131.069 Y127.413 E.01392
; LINE_WIDTH: 0.445289
G1 X130.703 Y127.626 E.01387
G1 X130.305 Y127.744 E.01363
G1 X129.89 Y127.766 E.01361
G1 X129.471 Y127.689 E.01399
G1 X129.082 Y127.513 E.01399
G1 X128.747 Y127.249 E.01399
G1 X128.484 Y126.913 E.01399
G1 X128.31 Y126.524 E.01399
G1 X128.233 Y126.104 E.01399
G1 X128.26 Y125.678 E.01399
G1 X128.387 Y125.271 E.01399
G1 X128.609 Y124.906 E.01399
G1 X128.911 Y124.605 E.01399
G1 X129.276 Y124.385 E.01399
G1 X129.684 Y124.259 E.01399
G1 X130.11 Y124.234 E.014
G1 X130.518 Y124.309 E.01361
; LINE_WIDTH: 0.445155
G1 X130.898 Y124.477 E.0136
; LINE_WIDTH: 0.444903
G1 X131.227 Y124.729 E.01359
; LINE_WIDTH: 0.444548
G1 X131.488 Y125.05 E.01356
; LINE_WIDTH: 0.444089
G1 X131.705 Y125.521 E.01694
; LINE_WIDTH: 0.444905
G1 X131.773 Y126.024 E.01661
G1 X131.735 Y126.352 E.01084
; LINE_WIDTH: 0.444358
G1 X131.601 Y126.756 E.01392
; LINE_WIDTH: 0.444722
G1 X131.406 Y127.067 E.01201
M204 S10000
; WIPE_START
G1 F24000
G1 X131.069 Y127.413 E-.18363
G1 X130.703 Y127.626 E-.16079
G1 X130.305 Y127.744 E-.15792
G1 X129.89 Y127.766 E-.15773
G1 X129.632 Y127.719 E-.09992
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I1.149 J-.402 P1  F30000
G1 X128.799 Y125.343 Z18
G1 Z17.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.439332
G1 F1200
G3 X130.507 Y124.729 I1.2 J.657 E.06409
; LINE_WIDTH: 0.43867
G1 X130.797 Y124.888 E.01063
; LINE_WIDTH: 0.437882
G1 X131.039 Y125.111 E.01061
; LINE_WIDTH: 0.437051
G1 X131.221 Y125.386 E.01058
; LINE_WIDTH: 0.443951
G3 X131.37 Y126.024 I-1.155 J.606 E.02165
; LINE_WIDTH: 0.443513
G1 X131.325 Y126.351 E.01078
; LINE_WIDTH: 0.443056
G1 X131.202 Y126.658 E.01077
; LINE_WIDTH: 0.442551
G1 X131.009 Y126.926 E.01075
; LINE_WIDTH: 0.442007
G1 X130.758 Y127.141 E.01074
; LINE_WIDTH: 0.441421
G1 X130.463 Y127.289 E.01072
; LINE_WIDTH: 0.440794
G1 X130.141 Y127.362 E.0107
; LINE_WIDTH: 0.440129
G1 X129.811 Y127.356 E.01068
; LINE_WIDTH: 0.439331
G3 X128.777 Y126.615 I.189 J-1.356 E.04273
; LINE_WIDTH: 0.442981
G1 X128.675 Y126.351 E.00921
G1 X128.632 Y125.976 E.01231
; LINE_WIDTH: 0.439332
G3 X128.772 Y125.396 I1.368 J.024 E.01943
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 17.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X128.992 Y125.075 E-.14792
G1 X129.242 Y124.86 E-.12537
G1 X129.537 Y124.712 E-.12537
G1 X129.859 Y124.639 E-.12537
G1 X130.189 Y124.644 E-.12538
G1 X130.47 Y124.719 E-.11059
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
G3 Z18 I-1.14 J.426 P1  F30000
G1 X131.363 Y127.113 Z18
G1 Z17.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.437464
G1 F1200
G1 X131.358 Y127.122 E.00034
; LINE_WIDTH: 0.438264
G1 X131.051 Y127.414 E.01365
; LINE_WIDTH: 0.439019
G1 X130.684 Y127.626 E.01368
; LINE_WIDTH: 0.439734
G1 X130.276 Y127.743 E.01371
G1 X129.851 Y127.758 E.01375
G1 X129.435 Y127.671 E.01375
G1 X129.051 Y127.487 E.01375
G1 X128.723 Y127.217 E.01375
G1 X128.469 Y126.876 E.01375
G1 X128.303 Y126.484 E.01375
G1 X128.237 Y126.064 E.01375
G1 X128.273 Y125.64 E.01375
G1 X128.409 Y125.237 E.01375
G1 X128.638 Y124.879 E.01375
G1 X128.946 Y124.585 E.01375
G1 X129.315 Y124.374 E.01375
G1 X129.724 Y124.257 E.01375
; LINE_WIDTH: 0.44573
G1 X130.114 Y124.233 E.01284
G1 X130.556 Y124.328 E.01483
; LINE_WIDTH: 0.441611
G1 X130.948 Y124.509 E.01401
; LINE_WIDTH: 0.442149
G1 X131.277 Y124.777 E.01383
; LINE_WIDTH: 0.442624
G1 X131.535 Y125.121 E.01402
; LINE_WIDTH: 0.444908
G1 X131.729 Y125.608 E.01717
G1 X131.768 Y125.928 E.01055
; LINE_WIDTH: 0.443493
G1 X131.718 Y126.36 E.01421
; LINE_WIDTH: 0.436619
G1 X131.585 Y126.765 E.01366
; LINE_WIDTH: 0.437464
G1 X131.396 Y127.062 E.01134
M204 S10000
; WIPE_START
G1 F24000
G1 X131.358 Y127.122 E-.02685
G1 X131.051 Y127.414 E-.16097
G1 X130.684 Y127.626 E-.16107
G1 X130.276 Y127.743 E-.16117
G1 X129.851 Y127.758 E-.16159
G1 X129.623 Y127.711 E-.08836
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I1.149 J-.4 P1  F30000
G1 X128.799 Y125.344 Z18.2
G1 Z17.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.444893
G1 F1200
G1 X128.804 Y125.331 E.00047
G3 X128.99 Y125.073 I1.197 J.667 E.01043
; LINE_WIDTH: 0.444932
G3 X129.549 Y124.706 I1.014 J.936 E.02212
; LINE_WIDTH: 0.445731
G3 X130.188 Y124.646 I.442 J1.258 E.02129
; LINE_WIDTH: 0.444934
G3 X130.799 Y124.885 I-.162 J1.308 E.02171
; LINE_WIDTH: 0.444766
G1 X131.042 Y125.109 E.01082
; LINE_WIDTH: 0.444511
G1 X131.225 Y125.384 E.01082
; LINE_WIDTH: 0.444214
G1 X131.337 Y125.695 E.01081
; LINE_WIDTH: 0.443869
G1 X131.369 Y126.024 E.01079
; LINE_WIDTH: 0.443336
G1 X131.303 Y126.409 E.01274
; LINE_WIDTH: 0.443942
G1 X131.175 Y126.699 E.01036
; LINE_WIDTH: 0.44435
G1 X130.98 Y126.954 E.01049
; LINE_WIDTH: 0.444667
G1 X130.731 Y127.157 E.01051
; LINE_WIDTH: 0.444893
G3 X128.68 Y125.636 I-.73 J-1.159 E.10767
G1 X128.776 Y125.4 E.00838
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 18
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.804 Y125.331 E-.02829
G1 X128.99 Y125.073 E-.12068
G1 X129.252 Y124.852 E-.1304
G1 X129.549 Y124.706 E-.12552
G1 X129.88 Y124.636 E-.12847
G1 X130.188 Y124.646 E-.11743
G1 X130.467 Y124.717 E-.10922
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
G3 Z18.2 I-1.14 J.426 P1  F30000
G1 X131.363 Y127.115 Z18.2
G1 Z18
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.438021
G1 F1200
G1 X131.359 Y127.121 E.00021
; LINE_WIDTH: 0.438763
G1 X131.053 Y127.414 E.01367
; LINE_WIDTH: 0.439462
G1 X130.685 Y127.626 E.01371
; LINE_WIDTH: 0.44012
G1 X130.277 Y127.743 E.01374
G1 X129.852 Y127.759 E.01377
G1 X129.436 Y127.672 E.01377
G1 X129.052 Y127.489 E.01377
G1 X128.723 Y127.218 E.01377
G1 X128.469 Y126.877 E.01377
G1 X128.303 Y126.485 E.01377
G1 X128.236 Y126.065 E.01377
G1 X128.272 Y125.641 E.01377
G1 X128.408 Y125.238 E.01377
G1 X128.637 Y124.879 E.01377
G1 X128.944 Y124.586 E.01377
G1 X129.314 Y124.374 E.01377
G1 X129.723 Y124.257 E.01377
; LINE_WIDTH: 0.445365
G1 X130.126 Y124.233 E.01326
G1 X130.556 Y124.327 E.01444
; LINE_WIDTH: 0.441825
G1 X130.947 Y124.508 E.014
; LINE_WIDTH: 0.442305
G1 X131.277 Y124.777 E.01384
; LINE_WIDTH: 0.442741
G1 X131.532 Y125.117 E.01386
; LINE_WIDTH: 0.443107
G1 X131.7 Y125.511 E.01396
; LINE_WIDTH: 0.444883
G1 X131.773 Y126.024 E.01698
G1 X131.735 Y126.352 E.01084
; LINE_WIDTH: 0.44379
G1 X131.586 Y126.76 E.01417
; LINE_WIDTH: 0.438021
G1 X131.395 Y127.065 E.01158
M204 S10000
; WIPE_START
G1 F24000
G1 X131.359 Y127.121 E-.02531
G1 X131.053 Y127.414 E-.1611
G1 X130.685 Y127.626 E-.16119
G1 X130.277 Y127.743 E-.16129
G1 X129.852 Y127.759 E-.16165
G1 X129.622 Y127.711 E-.08946
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I1.149 J-.402 P1  F30000
G1 X128.796 Y125.348 Z18.4
G1 Z18
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.444673
G1 F1200
G1 X128.799 Y125.339 E.00032
G3 X129.54 Y124.709 I1.201 J.661 E.03254
; LINE_WIDTH: 0.445367
G3 X130.189 Y124.645 I.45 J1.252 E.0216
; LINE_WIDTH: 0.444651
G3 X130.799 Y124.885 I-.162 J1.306 E.0217
; LINE_WIDTH: 0.444504
G1 X131.042 Y125.109 E.01082
; LINE_WIDTH: 0.444312
G1 X131.225 Y125.384 E.01081
; LINE_WIDTH: 0.444065
G1 X131.337 Y125.695 E.0108
; LINE_WIDTH: 0.44379
G1 X131.37 Y126.024 E.01079
; LINE_WIDTH: 0.443473
G1 X131.324 Y126.351 E.01078
; LINE_WIDTH: 0.44374
G1 X131.181 Y126.689 E.01198
; LINE_WIDTH: 0.444166
G1 X130.99 Y126.945 E.01044
; LINE_WIDTH: 0.444442
G1 X130.742 Y127.151 E.01056
; LINE_WIDTH: 0.444638
G3 X129.488 Y127.272 I-.743 J-1.146 E.04286
; LINE_WIDTH: 0.444673
G3 X128.676 Y125.645 I.512 J-1.272 E.06507
G1 X128.773 Y125.403 E.00854
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 18.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.799 Y125.339 E-.02648
G1 X128.992 Y125.071 E-.12558
G1 X129.244 Y124.856 E-.12559
G1 X129.54 Y124.709 E-.12559
G1 X129.869 Y124.636 E-.12807
G1 X130.189 Y124.645 E-.12158
G1 X130.462 Y124.715 E-.10711
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
G3 Z18.4 I-1.14 J.427 P1  F30000
G1 X131.363 Y127.118 Z18.4
G1 Z18.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.438714
G1 F1200
G1 X131.361 Y127.12 E.00009
; LINE_WIDTH: 0.439377
G1 X131.055 Y127.414 E.01371
; LINE_WIDTH: 0.439997
G1 X130.687 Y127.626 E.01374
; LINE_WIDTH: 0.440578
G1 X130.279 Y127.743 E.01376
G1 X129.853 Y127.759 E.01379
G1 X129.437 Y127.673 E.01379
G1 X129.053 Y127.49 E.01379
G1 X128.724 Y127.22 E.01379
G1 X128.469 Y126.879 E.01379
G1 X128.303 Y126.487 E.01379
G1 X128.236 Y126.067 E.01379
G1 X128.271 Y125.642 E.01379
G1 X128.407 Y125.239 E.01379
G1 X128.635 Y124.88 E.01379
G1 X128.943 Y124.586 E.01379
G1 X129.312 Y124.374 E.01379
G1 X129.721 Y124.257 E.01379
; LINE_WIDTH: 0.445001
G1 X130.138 Y124.234 E.01368
G1 X130.557 Y124.326 E.01405
; LINE_WIDTH: 0.442064
G1 X130.947 Y124.507 E.01398
; LINE_WIDTH: 0.442475
G1 X131.276 Y124.776 E.01385
; LINE_WIDTH: 0.442846
G1 X131.532 Y125.116 E.01387
; LINE_WIDTH: 0.443148
G1 X131.7 Y125.51 E.01396
; LINE_WIDTH: 0.444872
G1 X131.773 Y126.024 E.01701
G1 X131.734 Y126.352 E.01084
; LINE_WIDTH: 0.44371
G1 X131.588 Y126.76 E.01413
; LINE_WIDTH: 0.438714
G1 X131.395 Y127.067 E.01172
M204 S10000
; WIPE_START
G1 F24000
G1 X131.361 Y127.12 E-.02385
G1 X131.055 Y127.414 E-.16124
G1 X130.687 Y127.626 E-.16133
G1 X130.279 Y127.743 E-.16141
G1 X129.853 Y127.759 E-.16172
G1 X129.62 Y127.711 E-.09044
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I1.151 J-.395 P1  F30000
G1 X128.804 Y125.333 Z18.6
G1 Z18.2
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.444392
G1 F1200
G1 X128.99 Y125.073 E.01047
G3 X129.537 Y124.71 I1.01 J.927 E.02168
; LINE_WIDTH: 0.445002
G3 X130.189 Y124.645 I.453 J1.237 E.0217
; LINE_WIDTH: 0.444355
G3 X131.042 Y125.109 I-.256 J1.486 E.03236
; LINE_WIDTH: 0.44412
G1 X131.225 Y125.384 E.0108
; LINE_WIDTH: 0.443928
G1 X131.337 Y125.695 E.0108
; LINE_WIDTH: 0.44371
G1 X131.37 Y126.024 E.01078
; LINE_WIDTH: 0.44345
G1 X131.324 Y126.351 E.01079
; LINE_WIDTH: 0.443656
G1 X131.19 Y126.676 E.01146
; LINE_WIDTH: 0.443996
G1 X131.001 Y126.935 E.01051
; LINE_WIDTH: 0.444226
G1 X130.753 Y127.145 E.0106
; LINE_WIDTH: 0.444392
G3 X128.775 Y125.385 I-.753 J-1.145 E.11738
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 18.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X128.99 Y125.073 E-.14415
G1 X129.241 Y124.858 E-.1256
G1 X129.537 Y124.71 E-.1256
G1 X129.859 Y124.636 E-.12563
G1 X130.189 Y124.645 E-.12539
G1 X130.478 Y124.719 E-.11364
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
G3 Z18.6 I-1.142 J.421 P1  F30000
G1 X131.363 Y127.12 Z18.6
G1 Z18.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.440104
G1 F1200
G1 X131.363 Y127.12 E.00001
G1 X131.057 Y127.414 E.01374
; LINE_WIDTH: 0.440621
G1 X130.689 Y127.626 E.01377
; LINE_WIDTH: 0.441106
G1 X130.28 Y127.744 E.01379
G1 X129.855 Y127.76 E.01382
G1 X129.438 Y127.674 E.01382
G1 X129.053 Y127.491 E.01382
G1 X128.724 Y127.221 E.01382
G1 X128.469 Y126.88 E.01382
G1 X128.303 Y126.488 E.01382
G1 X128.235 Y126.068 E.01382
G1 X128.27 Y125.644 E.01382
G1 X128.406 Y125.24 E.01382
G1 X128.634 Y124.88 E.01382
G1 X128.942 Y124.586 E.01382
G1 X129.311 Y124.374 E.01382
G1 X129.72 Y124.256 E.01382
; LINE_WIDTH: 0.444638
G1 X130.141 Y124.234 E.01381
G1 X130.557 Y124.325 E.01394
; LINE_WIDTH: 0.442328
G1 X130.946 Y124.506 E.01397
; LINE_WIDTH: 0.44266
M73 P96 R0
G1 X131.276 Y124.776 E.01387
; LINE_WIDTH: 0.442958
G1 X131.532 Y125.116 E.01388
; LINE_WIDTH: 0.443192
G1 X131.7 Y125.509 E.01395
; LINE_WIDTH: 0.444861
G1 X131.773 Y126.024 E.01703
G1 X131.734 Y126.353 E.01084
; LINE_WIDTH: 0.443632
G1 X131.59 Y126.759 E.01409
; LINE_WIDTH: 0.43955
G1 X131.395 Y127.069 E.01183
M204 S10000
; WIPE_START
G1 F24000
G1 X131.363 Y127.12 E-.02294
G1 X131.057 Y127.414 E-.16127
G1 X130.689 Y127.626 E-.16148
G1 X130.28 Y127.744 E-.16155
G1 X129.855 Y127.76 E-.1618
G1 X129.62 Y127.712 E-.09096
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.8 I1.151 J-.394 P1  F30000
G1 X128.806 Y125.33 Z18.8
G1 Z18.4
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.443949
G1 F1200
G1 X128.993 Y125.076 E.01033
G3 X129.537 Y124.71 I1.014 J.92 E.02162
; LINE_WIDTH: 0.444638
G3 X130.189 Y124.644 I.455 J1.248 E.02168
; LINE_WIDTH: 0.444091
G3 X131.042 Y125.109 I-.259 J1.491 E.03234
; LINE_WIDTH: 0.443938
G1 X131.225 Y125.384 E.0108
; LINE_WIDTH: 0.443796
G1 X131.336 Y125.695 E.01079
; LINE_WIDTH: 0.443632
G1 X131.37 Y126.024 E.01078
; LINE_WIDTH: 0.443429
G1 X131.324 Y126.351 E.01079
; LINE_WIDTH: 0.443582
G1 X131.199 Y126.662 E.01095
; LINE_WIDTH: 0.44382
G1 X131.01 Y126.927 E.01063
; LINE_WIDTH: 0.443949
G3 X128.782 Y125.385 I-1.003 J-.931 E.12776
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 18.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.993 Y125.076 E-.1423
G1 X129.241 Y124.858 E-.12541
G1 X129.537 Y124.71 E-.12559
G1 X129.859 Y124.636 E-.12561
G1 X130.189 Y124.644 E-.12542
G1 X130.483 Y124.72 E-.11566
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
G3 Z18.8 I-1.143 J.418 P1  F30000
G1 X131.362 Y127.122 Z18.8
G1 Z18.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.440946
G1 F1200
G1 X131.059 Y127.414 E.01365
; LINE_WIDTH: 0.441336
G1 X130.69 Y127.626 E.01381
; LINE_WIDTH: 0.441703
G1 X130.282 Y127.745 E.01383
G1 X129.856 Y127.761 E.01384
G1 X129.439 Y127.676 E.01384
G1 X129.054 Y127.492 E.01384
G1 X128.724 Y127.223 E.01384
G1 X128.469 Y126.882 E.01384
G1 X128.302 Y126.49 E.01384
G1 X128.234 Y126.069 E.01384
G1 X128.269 Y125.645 E.01384
G1 X128.404 Y125.241 E.01384
G1 X128.632 Y124.881 E.01384
G1 X128.94 Y124.586 E.01384
G1 X129.309 Y124.374 E.01384
G1 X129.718 Y124.255 E.01384
; LINE_WIDTH: 0.444273
G1 X130.141 Y124.235 E.01384
G1 X130.558 Y124.324 E.01393
; LINE_WIDTH: 0.442616
G1 X130.946 Y124.506 E.01395
; LINE_WIDTH: 0.442861
G1 X131.276 Y124.775 E.01388
; LINE_WIDTH: 0.443077
G1 X131.532 Y125.115 E.01389
; LINE_WIDTH: 0.443237
G1 X131.7 Y125.508 E.01394
; LINE_WIDTH: 0.444851
G1 X131.773 Y126.024 E.01706
G1 X131.734 Y126.353 E.01084
; LINE_WIDTH: 0.443555
G1 X131.593 Y126.759 E.01404
; LINE_WIDTH: 0.440524
G1 X131.395 Y127.072 E.012
M204 S10000
; WIPE_START
G1 F24000
G1 X131.059 Y127.414 E-.18217
G1 X130.69 Y127.626 E-.16164
G1 X130.282 Y127.745 E-.1617
G1 X129.856 Y127.761 E-.16188
G1 X129.617 Y127.712 E-.09261
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I1.152 J-.391 P1  F30000
G1 X128.808 Y125.328 Z19
G1 Z18.6
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.443671
G1 F1200
G1 X128.993 Y125.076 E.01022
G3 X129.537 Y124.71 I1.014 J.92 E.0216
; LINE_WIDTH: 0.444273
G3 X130.189 Y124.644 I.457 J1.259 E.02166
; LINE_WIDTH: 0.444505
G1 X130.496 Y124.72 E.01035
G1 X130.798 Y124.886 E.01129
; LINE_WIDTH: 0.443824
G3 X131.225 Y125.384 I-.798 J1.114 E.02164
; LINE_WIDTH: 0.443667
G1 X131.336 Y125.695 E.01079
; LINE_WIDTH: 0.443555
G1 X131.37 Y126.024 E.01079
; LINE_WIDTH: 0.443411
G3 X131.202 Y126.658 I-1.391 J-.03 E.02161
; LINE_WIDTH: 0.443552
G1 X131.01 Y126.927 E.01079
; LINE_WIDTH: 0.443671
G3 X128.783 Y125.382 I-1.003 J-.931 E.12775
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 18.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X128.993 Y125.076 E-.14117
G1 X129.241 Y124.858 E-.1254
G1 X129.537 Y124.71 E-.12558
G1 X129.859 Y124.636 E-.1256
G1 X130.189 Y124.644 E-.12546
G1 X130.487 Y124.718 E-.1168
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
G3 Z19 I-1.144 J.416 P1  F30000
G1 X131.364 Y127.126 Z19
G1 Z18.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.443728
G1 F1200
G1 X131.065 Y127.414 E.01354
; LINE_WIDTH: 0.443615
G1 X130.693 Y127.626 E.01398
; LINE_WIDTH: 0.442368
G1 X130.283 Y127.745 E.0139
G1 X129.857 Y127.762 E.01387
G1 X129.44 Y127.677 E.01387
G1 X129.055 Y127.494 E.01387
G1 X128.724 Y127.224 E.01387
G1 X128.469 Y126.883 E.01387
G1 X128.302 Y126.491 E.01387
G1 X128.233 Y126.071 E.01387
G1 X128.268 Y125.646 E.01387
G1 X128.403 Y125.241 E.01387
G1 X128.631 Y124.881 E.01387
G1 X128.938 Y124.586 E.01387
G1 X129.308 Y124.373 E.01387
G1 X129.717 Y124.255 E.01387
; LINE_WIDTH: 0.443908
G1 X130.141 Y124.235 E.01387
G1 X130.558 Y124.323 E.01393
; LINE_WIDTH: 0.442855
G1 X130.945 Y124.505 E.01394
; LINE_WIDTH: 0.443018
G1 X131.276 Y124.774 E.01389
; LINE_WIDTH: 0.443204
G1 X131.532 Y125.115 E.0139
G1 X131.699 Y125.508 E.01393
; LINE_WIDTH: 0.444841
G1 X131.773 Y126.024 E.01708
G1 X131.734 Y126.353 E.01084
; LINE_WIDTH: 0.443476
G1 X131.595 Y126.758 E.01399
; LINE_WIDTH: 0.443728
G1 X131.397 Y127.077 E.01225
M204 S10000
; WIPE_START
G1 F24000
G1 X131.065 Y127.414 E-.17984
G1 X130.693 Y127.626 E-.16269
G1 X130.283 Y127.745 E-.16225
G1 X129.857 Y127.762 E-.16197
G1 X129.617 Y127.713 E-.09325
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I1.153 J-.39 P1  F30000
G1 X128.809 Y125.325 Z19.2
G1 Z18.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.443559
G1 F1200
G1 X128.99 Y125.073 E.01013
G3 X129.537 Y124.71 I1.01 J.927 E.02163
; LINE_WIDTH: 0.443908
G3 X130.189 Y124.643 I.46 J1.271 E.02164
; LINE_WIDTH: 0.443622
G1 X130.509 Y124.727 E.01079
; LINE_WIDTH: 0.444708
G1 X130.783 Y124.873 E.01017
G1 X131.042 Y125.109 E.01148
; LINE_WIDTH: 0.443601
G3 X131.336 Y125.695 I-1.042 J.891 E.02163
; LINE_WIDTH: 0.443476
G3 X131.324 Y126.351 I-1.331 J.304 E.02162
; LINE_WIDTH: 0.443729
G3 X131.01 Y126.927 I-1.311 J-.344 E.02164
; LINE_WIDTH: 0.443018
G1 X130.758 Y127.141 E.01077
; LINE_WIDTH: 0.443559
G3 X128.779 Y125.377 I-.758 J-1.141 E.11763
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 19
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.99 Y125.073 E-.14052
G1 X129.241 Y124.858 E-.12556
G1 X129.537 Y124.71 E-.12557
G1 X129.859 Y124.636 E-.12558
G1 X130.189 Y124.643 E-.1255
G1 X130.487 Y124.722 E-.11726
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
G3 Z19.2 I-1.144 J.416 P1  F30000
G1 X131.362 Y127.127 Z19.2
G1 Z19
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.4434
G1 F1200
G1 X131.064 Y127.414 E.01349
G1 X130.695 Y127.627 E.01392
G1 X130.285 Y127.746 E.01392
G1 X129.859 Y127.763 E.01394
; LINE_WIDTH: 0.442974
G1 X129.44 Y127.678 E.01392
G1 X129.055 Y127.495 E.0139
; LINE_WIDTH: 0.444381
G1 X128.718 Y127.22 E.01423
G1 X128.469 Y126.886 E.01364
; LINE_WIDTH: 0.443401
G1 X128.302 Y126.493 E.01394
; LINE_WIDTH: 0.443542
G1 X128.232 Y126.072 E.01392
G1 X128.266 Y125.648 E.01391
; LINE_WIDTH: 0.443402
G1 X128.402 Y125.243 E.01394
; LINE_WIDTH: 0.442977
G1 X128.63 Y124.882 E.01392
; LINE_WIDTH: 0.443543
G1 X128.936 Y124.586 E.0139
G1 X129.306 Y124.373 E.01393
; LINE_WIDTH: 0.442974
G1 X129.716 Y124.254 E.01392
G1 X130.142 Y124.237 E.0139
; LINE_WIDTH: 0.443122
M73 P97 R0
G1 X130.56 Y124.322 E.0139
G1 X130.945 Y124.504 E.01391
; LINE_WIDTH: 0.443243
G1 X131.275 Y124.774 E.01391
; LINE_WIDTH: 0.443483
G1 X131.532 Y125.114 E.01391
G1 X131.699 Y125.506 E.0139
; LINE_WIDTH: 0.444831
G1 X131.773 Y126.024 E.01714
G1 X131.734 Y126.353 E.01084
; LINE_WIDTH: 0.4434
G1 X131.598 Y126.758 E.01395
G1 X131.396 Y127.078 E.01235
M204 S10000
; WIPE_START
G1 F24000
G1 X131.064 Y127.414 E-.1794
G1 X130.695 Y127.627 E-.16207
G1 X130.285 Y127.746 E-.16207
G1 X129.859 Y127.763 E-.16228
G1 X129.616 Y127.714 E-.09418
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I1.153 J-.388 P1  F30000
G1 X128.811 Y125.323 Z19.4
G1 Z19
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.443544
G1 F1200
G1 X128.99 Y125.073 E.01004
G3 X129.242 Y124.859 I1.004 J.922 E.01081
; LINE_WIDTH: 0.443401
G3 X130.509 Y124.727 I.759 J1.14 E.04323
; LINE_WIDTH: 0.444776
G1 X130.781 Y124.871 E.01009
G1 X131.042 Y125.109 E.01157
; LINE_WIDTH: 0.443483
G3 X131.37 Y126.024 I-1.208 J.95 E.03228
; LINE_WIDTH: 0.44337
G1 X131.325 Y126.351 E.01078
; LINE_WIDTH: 0.443483
G3 X131.01 Y126.927 I-1.32 J-.349 E.02162
; LINE_WIDTH: 0.443242
G3 X130.463 Y127.29 I-1.01 J-.927 E.02161
; LINE_WIDTH: 0.443122
G1 X130.141 Y127.363 E.01077
; LINE_WIDTH: 0.4434
G3 X129.491 Y127.273 I-.142 J-1.359 E.02162
; LINE_WIDTH: 0.443539
G3 X128.954 Y126.885 I.502 J-1.261 E.02185
; LINE_WIDTH: 0.442986
G1 X128.776 Y126.615 E.01054
; LINE_WIDTH: 0.443543
G3 X128.63 Y125.976 I1.214 J-.613 E.02163
; LINE_WIDTH: 0.442975
G1 X128.675 Y125.649 E.01077
; LINE_WIDTH: 0.443403
G1 X128.784 Y125.376 E.00957
M204 S10000
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X128.99 Y125.073 E-.1393
G1 X129.242 Y124.859 E-.12554
G1 X129.537 Y124.71 E-.12556
G1 X129.859 Y124.637 E-.12556
G1 X130.189 Y124.642 E-.12556
G1 X130.491 Y124.722 E-.11849
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

