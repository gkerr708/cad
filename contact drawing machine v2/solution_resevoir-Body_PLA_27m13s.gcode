; HEADER_BLOCK_START
; BambuStudio 01.07.01.62
; model printing time: 21m 26s; total estimated time: 27m 13s
; total layer number: 135
; model label id: 66,140
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
; draft_shield = disabled
; elefant_foot_compensation = 0.15
; enable_arc_fitting = 1
; enable_overhang_bridge_fan = 1
; enable_overhang_speed = 1
; enable_pressure_advance = 0
; enable_prime_tower = 0
; enable_support = 0
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
M73 P0 R27
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
M73 P15 R22
G1 X60 F12000
M73 P16 R22
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
M73 P17 R22
G1 E-0.5 F300

M73 P18 R22
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
    G29 A X118.5 Y118 I66.6178 J29.8006
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
M73 P19 R22
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
M106 S0
M106 P2 S0
M204 S500
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
M73 P19 R21
G1 X134.654 Y118.246 F30000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.499999
G1 F3000
G1 X134.682 Y118.37 E.00471
G2 X134.993 Y118.769 I.73 J-.247 E.01922
G1 X135.329 Y118.857 E.01291
G1 X136.643 Y118.857 E.04896
G1 X136.643 Y120.171 E.04896
G1 X136.643 Y134.143 E.52038
G1 X135.329 Y134.143 E.04896
G2 X134.731 Y134.493 I.049 J.769 E.02677
G1 X134.643 Y134.829 E.01291
G1 X134.643 Y136.143 E.04896
G1 X119.357 Y136.143 E.56934
M73 P20 R21
G1 X119.357 Y116.857 E.71832
G1 X134.643 Y116.857 E.56934
G1 X134.643 Y118.171 E.04896
G1 X134.645 Y118.187 E.00059
G1 X135.1 Y118.171 F30000
; FEATURE: Outer wall
G1 F3000
G1 X135.167 Y118.333 E.00651
G1 X135.329 Y118.4 E.00651
G1 X137.1 Y118.4 E.06598
G1 X137.1 Y120.171 E.06598
G1 X137.1 Y134.6 E.53741
G1 X135.329 Y134.6 E.06598
G1 X135.167 Y134.667 E.00651
G1 X135.1 Y134.829 E.00651
G1 X135.1 Y136.6 E.06598
G1 X118.9 Y136.6 E.60339
G1 X118.9 Y116.4 E.75237
G1 X135.1 Y116.4 E.60339
G1 X135.1 Y118.111 E.06375
; WIPE_START
G1 F24000
G1 X135.167 Y118.333 E-.08797
G1 X135.329 Y118.4 E-.06647
G1 X136.922 Y118.4 E-.60557
; WIPE_END
G1 E-.04 F1800
G1 X136.46 Y119.973 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.504331
G1 F6300
G1 X135.527 Y119.04 E.04962
; WIPE_START
G1 F24000
G1 X136.46 Y119.973 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X134.46 Y117.973 Z.6 F30000
M73 P21 R21
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X133.733 Y117.246 E.03868
G1 X133.08 Y117.246 E.02453
G1 X136.254 Y120.42 E.16879
G1 X136.254 Y121.072 E.02453
G1 X132.428 Y117.246 E.20349
G1 X131.775 Y117.246 E.02453
G1 X136.254 Y121.725 E.23818
G1 X136.254 Y122.378 E.02453
G1 X131.122 Y117.246 E.27288
G1 X130.47 Y117.246 E.02453
G1 X136.254 Y123.03 E.30758
G1 X136.254 Y123.683 E.02453
G1 X129.817 Y117.246 E.34228
G1 X129.165 Y117.246 E.02453
G1 X136.254 Y124.335 E.37697
G1 X136.254 Y124.988 E.02453
G1 X128.512 Y117.246 E.41167
G1 X127.86 Y117.246 E.02453
G1 X136.254 Y125.64 E.44637
G1 X136.254 Y126.293 E.02453
G1 X127.207 Y117.246 E.48107
G1 X126.555 Y117.246 E.02453
G1 X136.254 Y126.945 E.51576
G1 X136.254 Y127.598 E.02453
G1 X125.902 Y117.246 E.55046
G1 X125.25 Y117.246 E.02453
G1 X136.254 Y128.25 E.58516
G1 X136.254 Y128.903 E.02453
G1 X124.597 Y117.246 E.61985
G1 X123.945 Y117.246 E.02453
G1 X136.254 Y129.555 E.65455
G1 X136.254 Y130.208 E.02453
G1 X123.292 Y117.246 E.68925
G1 X122.64 Y117.246 E.02453
G1 X136.254 Y130.86 E.72395
G1 X136.254 Y131.513 E.02453
G1 X121.987 Y117.246 E.75864
G1 X121.334 Y117.246 E.02453
G1 X136.254 Y132.166 E.79334
G1 X136.254 Y132.818 E.02453
G1 X120.682 Y117.246 E.82804
G1 X120.029 Y117.246 E.02453
G1 X136.254 Y133.471 E.86274
G1 X136.254 Y133.754 E.01067
G1 X135.886 Y133.754 E.01386
G1 X119.746 Y117.614 E.85822
G1 X119.746 Y118.267 E.02453
G1 X135.244 Y133.765 E.8241
G2 X134.754 Y133.927 I.071 J1.038 E.01963
G1 X119.746 Y118.919 E.79802
G1 X119.746 Y119.572 E.02453
G1 X134.427 Y134.254 E.78068
G2 X134.265 Y134.744 I.876 J.561 E.01963
G1 X119.746 Y120.224 E.77206
G1 X119.746 Y120.877 E.02453
G1 X134.254 Y135.386 E.77148
G1 X134.254 Y135.754 E.01386
G1 X133.971 Y135.754 E.01067
G1 X119.746 Y121.529 E.75639
G1 X119.746 Y122.182 E.02453
G1 X133.318 Y135.754 E.72169
G1 X132.665 Y135.754 E.02453
G1 X119.746 Y122.835 E.68699
G1 X119.746 Y123.487 E.02453
G1 X132.013 Y135.754 E.65229
G1 X131.36 Y135.754 E.02453
G1 X119.746 Y124.14 E.6176
G1 X119.746 Y124.792 E.02453
G1 X130.708 Y135.754 E.5829
G1 X130.055 Y135.754 E.02453
G1 X119.746 Y125.445 E.5482
G1 X119.746 Y126.097 E.02453
G1 X129.403 Y135.754 E.5135
G1 X128.75 Y135.754 E.02453
G1 X119.746 Y126.75 E.47881
G1 X119.746 Y127.402 E.02453
G1 X128.098 Y135.754 E.44411
G1 X127.445 Y135.754 E.02453
G1 X119.746 Y128.055 E.40941
G1 X119.746 Y128.707 E.02453
G1 X126.793 Y135.754 E.37471
G1 X126.14 Y135.754 E.02453
G1 X119.746 Y129.36 E.34002
G1 X119.746 Y130.012 E.02453
G1 X125.488 Y135.754 E.30532
G1 X124.835 Y135.754 E.02453
G1 X119.746 Y130.665 E.27062
G1 X119.746 Y131.317 E.02453
G1 X124.183 Y135.754 E.23593
G1 X123.53 Y135.754 E.02453
G1 X119.746 Y131.97 E.20123
G1 X119.746 Y132.623 E.02453
G1 X122.877 Y135.754 E.16653
G1 X122.225 Y135.754 E.02453
G1 X119.746 Y133.275 E.13183
G1 X119.746 Y133.928 E.02453
G1 X121.572 Y135.754 E.09714
G1 X120.92 Y135.754 E.02453
G1 X119.746 Y134.58 E.06244
G1 X119.746 Y135.233 E.02453
G1 X120.473 Y135.96 E.03868
; WIPE_START
G1 F24000
M73 P22 R21
G1 X119.746 Y135.233 E-.39091
G1 X119.746 Y134.58 E-.24796
G1 X119.971 Y134.806 E-.12113
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.51 Y135.994 Z.6 F30000
G1 X184.261 Y144.944 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.499999
G1 F3000
G1 X163.975 Y144.944 E.75557
G1 X163.975 Y124.658 E.75557
G1 X184.261 Y124.658 E.75557
G1 X184.261 Y130.349 E.212
G1 X184.261 Y144.884 E.54134
G1 X184.718 Y145.401 F30000
; FEATURE: Outer wall
G1 F3000
G1 X163.518 Y145.401 E.78962
G1 X163.518 Y124.201 E.78962
G1 X184.718 Y124.201 E.78962
G1 X184.718 Y130.349 E.22902
G1 X184.718 Y145.341 E.55836
; WIPE_START
G1 F24000
G1 X182.718 Y145.346 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.155 Y139.228 Z.6 F30000
G1 X175.428 Y135.57 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X175.454 Y135.618 E.00204
G1 X175.81 Y136.559 E.03747
G1 X175.85 Y136.719 E.00616
G1 X175.976 Y137.801 E.04055
G1 X175.85 Y138.882 E.04055
G1 X175.81 Y139.042 E.00616
G1 X175.454 Y139.983 E.03747
G1 X175.377 Y140.129 E.00616
G1 X174.805 Y140.957 E.03747
G1 X174.696 Y141.081 E.00616
G1 X173.943 Y141.748 E.03747
G1 X173.807 Y141.842 E.00616
G1 X172.916 Y142.309 E.03747
G1 X172.762 Y142.368 E.00616
G1 X171.785 Y142.609 E.03747
G1 X171.621 Y142.629 E.00616
G1 X170.615 Y142.629 E.03747
G1 X170.451 Y142.609 E.00616
G1 X169.474 Y142.368 E.03747
G1 X169.32 Y142.309 E.00616
G1 X168.429 Y141.842 E.03747
G1 X167.599 Y141.133 E.04064
G1 X167.43 Y140.957 E.00909
G1 X166.859 Y140.129 E.03747
G1 X166.782 Y139.983 E.00616
G1 X166.425 Y139.042 E.03747
G1 X166.386 Y138.882 E.00616
G1 X166.264 Y137.883 E.03747
G1 X166.264 Y137.718 E.00616
G1 X166.386 Y136.719 E.03747
G1 X166.425 Y136.559 E.00616
G1 X166.782 Y135.618 E.03747
G1 X166.859 Y135.472 E.00616
G1 X167.43 Y134.644 E.03747
G1 X167.54 Y134.52 E.00616
G1 X168.293 Y133.853 E.03747
G1 X168.429 Y133.759 E.00616
G1 X169.32 Y133.292 E.03747
G1 X169.474 Y133.233 E.00616
G1 X170.451 Y132.993 E.03747
G1 X170.615 Y132.973 E.00616
G1 X171.621 Y132.973 E.03747
G1 X171.785 Y132.993 E.00616
G1 X172.762 Y133.233 E.03747
G1 X172.916 Y133.292 E.00616
G1 X173.807 Y133.759 E.03747
G1 X173.943 Y133.853 E.00616
G1 X174.696 Y134.52 E.03747
G1 X174.805 Y134.644 E.00616
G1 X175.377 Y135.472 E.03747
G1 X175.4 Y135.517 E.00188
G1 X174.995 Y135.735 F30000
; FEATURE: Outer wall
G1 F3000
G1 X175.026 Y135.78 E.00206
G1 X175.396 Y136.774 E.0395
G1 X175.519 Y137.801 E.03849
G1 X175.396 Y138.827 E.03849
G1 X175.026 Y139.821 E.03951
G1 X174.393 Y140.739 E.04154
G1 X173.594 Y141.437 E.0395
G1 X172.652 Y141.924 E.0395
G1 X171.675 Y142.165 E.03747
G1 X170.615 Y142.171 E.0395
G1 X169.532 Y141.905 E.04154
G1 X168.641 Y141.437 E.03747
G1 X167.806 Y140.697 E.04154
G1 X167.235 Y139.87 E.03747
G1 X166.853 Y138.88 E.0395
G1 X166.718 Y137.773 E.04154
G1 X166.853 Y136.721 E.0395
G1 X167.209 Y135.78 E.03747
G1 X167.806 Y134.904 E.0395
G1 X168.596 Y134.195 E.03951
G1 X169.583 Y133.677 E.04154
G1 X170.56 Y133.436 E.03747
G1 X171.621 Y133.43 E.0395
G1 X172.704 Y133.697 E.04154
G1 X173.594 Y134.164 E.03747
G1 X174.393 Y134.863 E.03951
G1 X174.961 Y135.686 E.03725
; WIPE_START
G1 F24000
G1 X175.026 Y135.78 E-.04377
G1 X175.396 Y136.774 E-.40304
G1 X175.494 Y137.593 E-.31318
; WIPE_END
G1 E-.04 F1800
G1 X179.98 Y131.418 Z.6 F30000
G1 X184.078 Y125.777 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.505806
G1 F6300
G1 X183.347 Y125.046 E.03897
G1 X182.693 Y125.046 E.02469
G1 X183.872 Y126.226 E.06292
G1 X183.872 Y126.88 E.02469
G1 X182.038 Y125.046 E.09784
G1 X181.383 Y125.046 E.02469
G1 X183.872 Y127.535 E.13276
G1 X183.872 Y128.19 E.02469
G1 X180.729 Y125.046 E.16768
G1 X180.074 Y125.046 E.02469
G1 X183.872 Y128.844 E.2026
G1 X183.872 Y129.499 E.02469
G1 X179.42 Y125.046 E.23752
G1 X178.765 Y125.046 E.02469
G1 X183.872 Y130.153 E.27244
G1 X183.872 Y130.808 E.02469
G1 X178.11 Y125.046 E.30736
G1 X177.456 Y125.046 E.02469
G1 X183.872 Y131.463 E.34228
G1 X183.872 Y132.117 E.02469
G1 X176.801 Y125.046 E.3772
G1 X176.146 Y125.046 E.02469
G1 X183.872 Y132.772 E.41212
G1 X183.872 Y133.427 E.02469
G1 X175.492 Y125.046 E.44704
M73 P22 R20
G1 X174.837 Y125.046 E.02469
G1 X183.872 Y134.081 E.48195
G1 X183.872 Y134.736 E.02469
G1 X174.183 Y125.046 E.51687
G1 X173.528 Y125.046 E.02469
G1 X183.872 Y135.39 E.55179
G1 X183.872 Y136.045 E.02469
G1 X172.873 Y125.046 E.58671
G1 X172.219 Y125.046 E.02469
G1 X183.872 Y136.7 E.62163
G1 X183.872 Y137.354 E.02469
G1 X171.564 Y125.046 E.65655
G1 X170.91 Y125.046 E.02469
G1 X183.872 Y138.009 E.69147
G1 X183.872 Y138.664 E.02469
G1 X170.255 Y125.046 E.72639
G1 X169.6 Y125.046 E.02469
G1 X183.872 Y139.318 E.76131
G1 X183.872 Y139.973 E.02469
G1 X168.946 Y125.046 E.79623
G1 X168.291 Y125.046 E.02469
G1 X183.872 Y140.627 E.83115
G1 X183.872 Y141.282 E.02469
G1 X167.636 Y125.046 E.86607
G1 X166.982 Y125.046 E.02469
G1 X183.872 Y141.937 E.90099
G1 X183.872 Y142.591 E.02469
G1 X166.327 Y125.046 E.93591
G1 X165.673 Y125.046 E.02469
G1 X183.872 Y143.246 E.97083
G1 X183.872 Y143.9 E.02469
G1 X176.028 Y136.056 E.41843
G1 X176.213 Y136.543 E.01965
G1 X176.264 Y136.947 E.01536
G1 X183.872 Y144.555 E.40582
G1 X183.218 Y144.555 E.02469
G1 X176.358 Y137.695 E.36591
G3 X176.311 Y138.304 I-2.528 J.112 E.02306
G1 X182.563 Y144.555 E.33347
M73 P23 R20
G1 X181.908 Y144.555 E.02469
G1 X176.241 Y138.887 E.30233
G3 X176.093 Y139.394 I-2.215 J-.372 E.01995
G1 X181.254 Y144.555 E.27531
G1 X180.599 Y144.555 E.02469
G1 X175.913 Y139.869 E.24999
G3 X175.712 Y140.323 I-1.971 J-.598 E.01877
G1 X179.944 Y144.555 E.22576
G1 X179.29 Y144.555 E.02469
G1 X175.447 Y140.712 E.205
G1 X175.179 Y141.099 E.01775
G1 X178.635 Y144.555 E.18434
G1 X177.981 Y144.555 E.02469
G1 X174.871 Y141.445 E.1659
G1 X174.523 Y141.753 E.01749
G1 X177.326 Y144.555 E.14949
G1 X176.671 Y144.555 E.02469
G1 X174.174 Y142.058 E.13319
G3 X173.764 Y142.303 I-1.213 J-1.566 E.01805
G1 X176.017 Y144.555 E.12014
G1 X175.362 Y144.555 E.02469
G1 X173.335 Y142.528 E.10812
G3 X172.887 Y142.734 I-1.073 J-1.744 E.01866
G1 X174.707 Y144.555 E.09713
G1 X174.053 Y144.555 E.02469
G1 X172.363 Y142.865 E.09014
G1 X171.837 Y142.994 E.02043
G1 X173.398 Y144.555 E.08328
G1 X172.744 Y144.555 E.02469
G1 X171.199 Y143.01 E.08241
G1 X170.544 Y143.01 E.02471
G1 X172.089 Y144.555 E.08244
G1 X171.434 Y144.555 E.02469
G1 X169.421 Y142.541 E.10741
; WIPE_START
G1 F24000
G1 X170.835 Y143.956 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X172.489 Y136.505 Z.6 F30000
G1 X173.213 Y133.241 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X165.018 Y125.046 E.43716
G1 X164.363 Y125.046 E.02469
G1 X171.95 Y132.633 E.40472
G2 X171.247 Y132.584 I-.524 J2.436 E.0267
G1 X164.363 Y125.701 E.36718
G1 X164.363 Y126.356 E.02469
G1 X170.593 Y132.586 E.33233
G2 X170.046 Y132.692 I.165 J2.306 E.0211
G1 X164.363 Y127.01 E.30311
G1 X164.363 Y127.665 E.02469
G1 X169.521 Y132.822 E.2751
G2 X169.043 Y132.999 I.406 J1.833 E.01928
G1 X164.363 Y128.319 E.2496
G1 X164.363 Y128.974 E.02469
G1 X168.613 Y133.224 E.2267
G2 X168.189 Y133.455 I.738 J1.861 E.01825
G1 X164.363 Y129.629 E.20409
G1 X164.363 Y130.283 E.02469
G1 X167.827 Y133.747 E.18476
G1 X167.48 Y134.054 E.01749
G1 X164.363 Y130.938 E.16625
G1 X164.363 Y131.592 E.02469
G1 X167.149 Y134.378 E.1486
G2 X166.877 Y134.761 I1.441 J1.31 E.01775
G1 X164.363 Y132.247 E.13411
G1 X164.363 Y132.902 E.02469
G1 X166.61 Y135.148 E.11985
G2 X166.383 Y135.576 I1.627 J1.14 E.0183
G1 X164.363 Y133.556 E.10772
G1 X164.363 Y134.211 E.02469
G1 X166.203 Y136.05 E.09811
G2 X166.033 Y136.535 I1.911 J.942 E.01942
G1 X164.363 Y134.866 E.08905
G1 X164.363 Y135.52 E.02469
G1 X165.948 Y137.104 E.08451
G1 X165.878 Y137.689 E.02221
G1 X164.363 Y136.175 E.08077
G1 X164.363 Y136.829 E.02469
G1 X165.937 Y138.403 E.08393
G1 X166.009 Y138.988 E.02225
G2 X166.064 Y139.184 I1.063 J-.193 E.00769
G1 X164.363 Y137.484 E.09069
G1 X164.363 Y138.139 E.02469
G1 X166.497 Y140.272 E.11381
G1 X167.116 Y141.186 E.04163
G1 X167.275 Y141.365 E.00904
G1 X168.042 Y142.045 E.03867
G2 X168.59 Y142.365 I1.591 J-2.094 E.02397
G1 X170.78 Y144.555 E.11682
G1 X170.125 Y144.555 E.02469
G1 X164.363 Y138.793 E.30735
G1 X164.363 Y139.448 E.02469
G1 X169.471 Y144.555 E.27243
G1 X168.816 Y144.555 E.02469
G1 X164.363 Y140.103 E.23751
G1 X164.363 Y140.757 E.02469
G1 X168.161 Y144.555 E.20259
G1 X167.507 Y144.555 E.02469
G1 X164.363 Y141.412 E.16767
G1 X164.363 Y142.066 E.02469
G1 X166.852 Y144.555 E.13275
G1 X166.197 Y144.555 E.02469
G1 X164.363 Y142.721 E.09783
G1 X164.363 Y143.376 E.02469
G1 X165.543 Y144.555 E.06291
G1 X164.888 Y144.555 E.02469
G1 X164.158 Y143.825 E.03897
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X164.888 Y144.555 E-.39256
G1 X165.543 Y144.555 E-.24876
G1 X165.322 Y144.334 E-.11868
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
M106 S252.45
M106 P2 S178
; open powerlost recovery
M1003 S1
M204 S10000
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z.6 I.794 J-.922 P1  F30000
G1 X135.432 Y118.59 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F15476.11
G1 X135.479 Y118.602 E.00159
G1 X136.898 Y118.602 E.04708
G1 X136.898 Y120.021 E.04708
G1 X136.898 Y134.398 E.47689
G1 X135.479 Y134.398 E.04708
G2 X134.972 Y134.695 I.041 J.651 E.02019
G1 X134.898 Y134.979 E.00974
G1 X134.898 Y136.398 E.04708
G1 X119.102 Y136.398 E.52398
G1 X119.102 Y116.602 E.65666
G1 X134.898 Y116.602 E.52398
G1 X134.898 Y118.021 E.04708
G2 X135.195 Y118.528 I.651 J-.041 E.02019
G1 X135.374 Y118.575 E.00616
M73 P24 R20
G1 X135.332 Y118.139 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F12000
G1 X135.392 Y118.168 E.00205
G1 X135.479 Y118.21 E.00296
G1 X137.29 Y118.21 E.05566
G1 X137.29 Y120.021 E.05566
G1 X137.29 Y134.79 E.4538
G1 X135.479 Y134.79 E.05566
G1 X135.361 Y134.832 E.00383
G1 X135.332 Y134.892 E.00205
G1 X135.29 Y134.979 E.00296
G1 X135.29 Y136.79 E.05566
G1 X118.71 Y136.79 E.50946
G1 X118.71 Y116.21 E.63237
G1 X135.29 Y116.21 E.50946
G1 X135.29 Y118.021 E.05566
G1 X135.312 Y118.082 E.00199
M204 S10000
; WIPE_START
G1 F24000
G1 X135.392 Y118.168 E-.04458
G1 X135.479 Y118.21 E-.03656
G1 X137.265 Y118.21 E-.67887
; WIPE_END
G1 E-.04 F1800
G1 X129.659 Y117.571 Z.8 F30000
G1 X120.034 Y116.763 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423906
G1 F15000
G1 X119.433 Y117.364 E.02638
G1 X119.433 Y117.903 E.01673
G1 X120.403 Y116.933 E.04258
G1 X120.942 Y116.933 E.01673
G1 X119.433 Y118.442 E.06624
G1 X119.433 Y118.981 E.01673
G1 X121.481 Y116.933 E.0899
G1 X122.019 Y116.933 E.01673
G1 X119.433 Y119.519 E.11355
G1 X119.433 Y120.058 E.01673
G1 X122.558 Y116.933 E.13721
G1 X123.097 Y116.933 E.01673
G1 X119.433 Y120.597 E.16086
G1 X119.433 Y121.136 E.01673
G1 X123.636 Y116.933 E.18452
G1 X124.175 Y116.933 E.01673
G1 X119.433 Y121.675 E.20817
G1 X119.433 Y122.213 E.01673
G1 X124.713 Y116.933 E.23183
G1 X125.252 Y116.933 E.01673
G1 X119.433 Y122.752 E.25549
G1 X119.433 Y123.291 E.01673
G1 X125.791 Y116.933 E.27914
G1 X126.33 Y116.933 E.01673
G1 X119.433 Y123.83 E.3028
G1 X119.433 Y124.369 E.01673
G1 X126.869 Y116.933 E.32645
G1 X127.407 Y116.933 E.01673
G1 X119.433 Y124.907 E.35011
G1 X119.433 Y125.446 E.01673
G1 X127.946 Y116.933 E.37377
G1 X128.485 Y116.933 E.01673
G1 X119.433 Y125.985 E.39742
G1 X119.433 Y126.524 E.01673
G1 X129.024 Y116.933 E.42108
G1 X129.563 Y116.933 E.01673
G1 X119.433 Y127.063 E.44473
G1 X119.433 Y127.601 E.01673
G1 X130.101 Y116.933 E.46839
G1 X130.64 Y116.933 E.01673
G1 X119.433 Y128.14 E.49204
G1 X119.433 Y128.679 E.01673
G1 X131.179 Y116.933 E.5157
G1 X131.718 Y116.933 E.01673
G1 X119.433 Y129.218 E.53936
G1 X119.433 Y129.757 E.01673
G1 X132.257 Y116.933 E.56301
G1 X132.795 Y116.933 E.01673
G1 X119.433 Y130.295 E.58667
G1 X119.433 Y130.834 E.01673
G1 X133.334 Y116.933 E.61032
G1 X133.873 Y116.933 E.01673
G1 X119.433 Y131.373 E.63398
G1 X119.433 Y131.912 E.01673
G1 X134.412 Y116.933 E.65764
G1 X134.567 Y116.933 E.00482
G1 X134.567 Y117.317 E.01191
G1 X119.433 Y132.45 E.66445
G1 X119.433 Y132.989 E.01673
G1 X134.567 Y117.855 E.66445
G2 X134.605 Y118.287 I1.456 J.088 E.0135
G1 X134.626 Y118.335 E.00163
G1 X119.433 Y133.528 E.66704
G1 X119.433 Y134.067 E.01673
G1 X134.838 Y118.662 E.67634
G2 X135.165 Y118.874 I.601 J-.57 E.01221
G1 X119.433 Y134.606 E.6907
G1 X119.433 Y135.144 E.01673
G1 X135.644 Y118.933 E.71176
G1 X136.183 Y118.933 E.01673
G1 X119.433 Y135.683 E.73542
G1 X119.433 Y136.067 E.01191
G1 X119.588 Y136.067 E.00482
G1 X136.567 Y119.088 E.74545
G1 X136.567 Y119.627 E.01673
G1 X120.127 Y136.067 E.72179
G1 X120.666 Y136.067 E.01673
G1 X136.567 Y120.166 E.69814
G1 X136.567 Y120.705 E.01673
G1 X121.205 Y136.067 E.67448
G1 X121.743 Y136.067 E.01673
G1 X136.567 Y121.243 E.65083
G1 X136.567 Y121.782 E.01673
G1 X122.282 Y136.067 E.62717
G1 X122.821 Y136.067 E.01673
G1 X136.567 Y122.321 E.60351
G1 X136.567 Y122.86 E.01673
G1 X123.36 Y136.067 E.57986
G1 X123.899 Y136.067 E.01673
G1 X136.567 Y123.399 E.5562
G1 X136.567 Y123.937 E.01673
G1 X124.437 Y136.067 E.53255
G1 X124.976 Y136.067 E.01673
G1 X136.567 Y124.476 E.50889
G1 X136.567 Y125.015 E.01673
G1 X125.515 Y136.067 E.48523
G1 X126.054 Y136.067 E.01673
G1 X136.567 Y125.554 E.46158
G1 X136.567 Y126.093 E.01673
G1 X126.593 Y136.067 E.43792
G1 X127.131 Y136.067 E.01673
G1 X136.567 Y126.631 E.41427
G1 X136.567 Y127.17 E.01673
G1 X127.67 Y136.067 E.39061
G1 X128.209 Y136.067 E.01673
G1 X136.567 Y127.709 E.36696
G1 X136.567 Y128.248 E.01673
G1 X128.748 Y136.067 E.3433
G1 X129.287 Y136.067 E.01673
G1 X136.567 Y128.787 E.31964
G1 X136.567 Y129.325 E.01673
G1 X129.825 Y136.067 E.29599
G1 X130.364 Y136.067 E.01673
G1 X136.567 Y129.864 E.27233
G1 X136.567 Y130.403 E.01673
G1 X130.903 Y136.067 E.24868
G1 X131.442 Y136.067 E.01673
G1 X136.567 Y130.942 E.22502
G1 X136.567 Y131.481 E.01673
G1 X131.981 Y136.067 E.20136
G1 X132.519 Y136.067 E.01673
G1 X136.567 Y132.019 E.17771
G1 X136.567 Y132.558 E.01673
G1 X133.058 Y136.067 E.15405
G1 X133.597 Y136.067 E.01673
G1 X134.567 Y135.097 E.04259
G1 X134.567 Y135.636 E.01673
G1 X133.966 Y136.237 E.02638
G1 X135.418 Y134.246 F30000
G1 F15000
G1 X136.567 Y133.097 E.05046
G1 X136.567 Y133.636 E.01673
G1 X135.966 Y134.237 E.02638
; WIPE_START
G1 F24000
G1 X136.567 Y133.636 E-.32291
G1 X136.567 Y133.097 E-.20474
G1 X136.135 Y133.529 E-.23235
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X143.554 Y135.319 Z.8 F30000
G1 X184.516 Y145.199 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F15476.11
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y130.35 E.19727
G1 X184.516 Y145.139 E.49057
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F12000
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y130.35 E.19478
G1 X184.908 Y145.531 E.46647
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.202 Y139.527 Z.8 F30000
G1 X175.187 Y135.678 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F15476.11
G1 X175.565 Y136.632 E.03407
G1 X175.72 Y137.801 E.03909
G1 X175.599 Y138.833 E.03448
G1 X175.222 Y139.875 E.03677
G1 X174.606 Y140.797 E.03677
G1 X173.787 Y141.545 E.03677
G1 X172.814 Y142.075 E.03677
G1 X171.742 Y142.357 E.03677
G1 X170.633 Y142.374 E.03677
G1 X169.553 Y142.125 E.03677
G1 X168.563 Y141.624 E.03677
G1 X167.768 Y140.942 E.03475
G1 X167.63 Y140.797 E.00665
G1 X167.079 Y139.999 E.03216
G1 X166.67 Y138.969 E.03677
G1 X166.52 Y137.871 E.03677
G1 X166.637 Y136.768 E.03677
G1 X167.014 Y135.726 E.03677
G1 X167.63 Y134.804 E.03677
G1 X168.448 Y134.056 E.03677
G1 X169.422 Y133.526 E.03677
G1 X170.494 Y133.245 E.03677
G1 X171.603 Y133.228 E.03677
G1 X172.683 Y133.477 E.03677
G1 X173.672 Y133.977 E.03677
G1 X174.513 Y134.699 E.03677
G1 X175.157 Y135.602 E.03677
G1 X175.165 Y135.622 E.00071
G1 X174.836 Y135.83 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F12000
G1 X175.199 Y136.771 E.031
G1 X175.328 Y137.801 E.03188
G1 X175.21 Y138.786 E.03049
G1 X174.855 Y139.736 E.03118
G1 X174.283 Y140.575 E.03118
G1 X173.527 Y141.251 E.03118
G1 X172.631 Y141.728 E.03118
G1 X171.648 Y141.976 E.03118
G1 X170.633 Y141.981 E.03118
G1 X169.647 Y141.744 E.03118
G1 X168.746 Y141.277 E.03118
G1 X168.028 Y140.649 E.02931
G1 X167.402 Y139.777 E.033
G1 X167.037 Y138.83 E.03118
G1 X166.909 Y137.823 E.03118
G1 X167.026 Y136.815 E.03118
G1 X167.381 Y135.865 E.03118
G1 X167.952 Y135.027 E.03118
G1 X168.708 Y134.35 E.03118
G1 X169.604 Y133.873 E.03118
G1 X170.588 Y133.625 E.03118
G1 X171.603 Y133.62 E.03118
G1 X172.589 Y133.857 E.03118
G1 X173.49 Y134.324 E.03118
G1 X174.253 Y134.993 E.03118
G1 X174.803 Y135.78 E.02951
M204 S10000
; WIPE_START
G1 F24000
G1 X175.199 Y136.771 E-.40559
G1 X175.315 Y137.697 E-.35441
; WIPE_END
G1 E-.04 F1800
G1 X170.888 Y143.914 Z.8 F30000
G1 X170.088 Y145.037 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.424588
G1 F15000
G1 X172.653 Y142.473 E.11279
G1 X171.938 Y142.648 E.02288
G1 X169.718 Y144.868 E.09764
G1 X169.179 Y144.868 E.01679
G1 X171.349 Y142.697 E.09547
G1 X170.804 Y142.703 E.01697
G1 X168.639 Y144.868 E.09522
G1 X168.099 Y144.868 E.01679
G1 X170.313 Y142.653 E.0974
G1 X169.88 Y142.546 E.01387
G1 X167.559 Y144.868 E.10209
G1 X167.02 Y144.868 E.01679
G1 X169.449 Y142.438 E.10687
G3 X169.079 Y142.269 I.511 J-1.611 E.0127
G1 X166.48 Y144.868 E.11431
G1 X165.94 Y144.868 E.01679
G1 X168.725 Y142.083 E.12248
G3 X168.374 Y141.894 I.603 J-1.539 E.01242
G1 X165.4 Y144.868 E.13079
G1 X164.86 Y144.868 E.01679
G1 X168.073 Y141.655 E.1413
G1 X167.787 Y141.401 E.01189
G1 X164.321 Y144.868 E.15246
G1 X164.051 Y144.868 E.00839
G1 X164.051 Y144.598 E.0084
G1 X167.501 Y141.148 E.15174
G3 X167.262 Y140.847 I1.719 J-1.611 E.01196
G1 X164.051 Y144.058 E.14123
G1 X164.051 Y143.518 E.01679
G1 X167.041 Y140.528 E.13153
G1 X166.821 Y140.208 E.01207
G1 X164.051 Y142.978 E.12184
G1 X164.051 Y142.439 E.01679
G1 X166.647 Y139.842 E.1142
G1 X166.499 Y139.451 E.01302
G1 X164.051 Y141.899 E.10767
G1 X164.051 Y141.359 E.01679
G1 X166.352 Y139.058 E.10122
G3 X166.275 Y138.595 I1.533 J-.493 E.01464
G1 X164.051 Y140.819 E.09783
G1 X164.051 Y140.28 E.01679
G1 X166.216 Y138.114 E.09524
G3 X166.204 Y137.587 I1.792 J-.306 E.01647
G1 X164.051 Y139.74 E.09469
G1 X164.051 Y139.2 E.01679
G1 X166.278 Y136.972 E.09797
G3 X166.461 Y136.25 I2.127 J.154 E.0233
G1 X164.051 Y138.66 E.10601
G1 X164.051 Y138.12 E.01679
G1 X177.438 Y124.734 E.5888
G1 X177.977 Y124.734 E.01679
G1 X169.583 Y133.128 E.36923
G1 X170.299 Y132.952 E.02295
G1 X178.517 Y124.734 E.36146
G1 X179.057 Y124.734 E.01679
G1 X170.893 Y132.898 E.3591
G1 X171.429 Y132.901 E.0167
G1 X179.597 Y124.734 E.35923
G1 X180.136 Y124.734 E.01679
G1 X171.918 Y132.952 E.36147
G1 X172.353 Y133.057 E.01392
G1 X180.676 Y124.734 E.36608
G1 X181.216 Y124.734 E.01679
G1 X172.786 Y133.163 E.37077
G3 X173.157 Y133.333 I-.511 J1.611 E.0127
G1 X181.756 Y124.734 E.37821
G1 X182.295 Y124.734 E.01679
G1 X173.511 Y133.518 E.38638
G3 X173.862 Y133.707 I-.602 J1.539 E.01242
G1 X182.835 Y124.734 E.39469
G1 X183.375 Y124.734 E.01679
G1 X174.161 Y133.947 E.40524
G1 X174.446 Y134.202 E.01189
G1 X183.915 Y124.734 E.41647
G1 X184.185 Y124.734 E.0084
G1 X184.185 Y125.004 E.00839
G1 X174.731 Y134.458 E.41583
G3 X174.97 Y134.758 I-.504 J.648 E.01206
G1 X184.185 Y125.543 E.40529
G1 X184.185 Y126.083 E.01679
G1 X175.19 Y135.077 E.3956
G1 X175.411 Y135.397 E.01207
G1 X184.185 Y126.623 E.38591
G1 X184.185 Y127.163 E.01679
G1 X175.584 Y135.764 E.3783
G1 X175.732 Y136.155 E.01302
G1 X184.185 Y127.702 E.37177
G1 X184.185 Y128.242 E.01679
G1 X175.881 Y136.546 E.36524
G1 X175.908 Y136.619 E.00242
G1 X175.958 Y137.009 E.01223
G1 X184.185 Y128.782 E.36185
G1 X184.185 Y129.322 E.01679
G1 X176.019 Y137.488 E.35917
G3 X176.032 Y138.014 I-1.755 J.307 E.01644
G1 X184.185 Y129.861 E.35859
G1 X184.185 Y130.401 E.01679
G1 X175.957 Y138.629 E.36187
G3 X175.775 Y139.351 I-2.11 J-.149 E.0233
G1 X184.185 Y130.941 E.36991
G1 X184.185 Y131.481 E.01679
G1 X170.798 Y144.868 E.5888
G1 X171.338 Y144.868 E.01679
G1 X184.185 Y132.02 E.56506
G1 X184.185 Y132.56 E.01679
G1 X171.877 Y144.868 E.54132
G1 X172.417 Y144.868 E.01679
G1 X184.185 Y133.1 E.51758
G1 X184.185 Y133.64 E.01679
G1 X172.957 Y144.868 E.49384
G1 X173.497 Y144.868 E.01679
G1 X184.185 Y134.179 E.4701
G1 X184.185 Y134.719 E.01679
G1 X174.036 Y144.868 E.44636
G1 X174.576 Y144.868 E.01679
G1 X184.185 Y135.259 E.42262
G1 X184.185 Y135.799 E.01679
G1 X175.116 Y144.868 E.39888
G1 X175.656 Y144.868 E.01679
G1 X184.185 Y136.339 E.37514
G1 X184.185 Y136.878 E.01679
G1 X176.195 Y144.868 E.3514
G1 X176.735 Y144.868 E.01679
G1 X184.185 Y137.418 E.32766
G1 X184.185 Y137.958 E.01679
G1 X177.275 Y144.868 E.30392
G1 X177.815 Y144.868 E.01679
G1 X184.185 Y138.498 E.28018
G1 X184.185 Y139.037 E.01679
G1 X178.354 Y144.868 E.25643
G1 X178.894 Y144.868 E.01679
G1 X184.185 Y139.577 E.23269
G1 X184.185 Y140.117 E.01679
G1 X179.434 Y144.868 E.20895
G1 X179.974 Y144.868 E.01679
G1 X184.185 Y140.657 E.18521
G1 X184.185 Y141.196 E.01679
G1 X180.514 Y144.868 E.16147
G1 X181.053 Y144.868 E.01679
G1 X184.185 Y141.736 E.13773
G1 X184.185 Y142.276 E.01679
G1 X181.593 Y144.868 E.11399
G1 X182.133 Y144.868 E.01679
G1 X184.185 Y142.816 E.09025
G1 X184.185 Y143.355 E.01679
G1 X182.673 Y144.868 E.06651
G1 X183.212 Y144.868 E.01679
G1 X184.185 Y143.895 E.04277
G1 X184.185 Y144.435 E.01679
G1 X183.582 Y145.037 E.02649
; WIPE_START
G1 F24000
G1 X184.185 Y144.435 E-.32369
G1 X184.185 Y143.895 E-.20511
G1 X183.754 Y144.325 E-.2312
; WIPE_END
G1 E-.04 F1800
G1 X176.508 Y141.928 Z.8 F30000
G1 X163.881 Y137.75 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X176.898 Y124.734 E.57252
G1 X176.358 Y124.734 E.01679
G1 X164.051 Y137.041 E.54132
G1 X164.051 Y136.501 E.01679
G1 X175.818 Y124.734 E.51758
G1 X175.279 Y124.734 E.01679
G1 X164.051 Y135.961 E.49384
G1 X164.051 Y135.422 E.01679
G1 X174.739 Y124.734 E.47009
G1 X174.199 Y124.734 E.01679
G1 X164.051 Y134.882 E.44635
G1 X164.051 Y134.342 E.01679
M73 P25 R20
G1 X173.659 Y124.734 E.42261
G1 X173.12 Y124.734 E.01679
G1 X164.051 Y133.802 E.39887
G1 X164.051 Y133.263 E.01679
G1 X172.58 Y124.734 E.37513
G1 X172.04 Y124.734 E.01679
G1 X164.051 Y132.723 E.35139
G1 X164.051 Y132.183 E.01679
G1 X171.5 Y124.734 E.32765
G1 X170.961 Y124.734 E.01679
G1 X164.051 Y131.643 E.30391
G1 X164.051 Y131.104 E.01679
G1 X170.421 Y124.734 E.28017
G1 X169.881 Y124.734 E.01679
G1 X164.051 Y130.564 E.25643
G1 X164.051 Y130.024 E.01679
G1 X169.341 Y124.734 E.23269
G1 X168.801 Y124.734 E.01679
G1 X164.051 Y129.484 E.20895
G1 X164.051 Y128.945 E.01679
G1 X168.262 Y124.734 E.18521
G1 X167.722 Y124.734 E.01679
G1 X164.051 Y128.405 E.16147
G1 X164.051 Y127.865 E.01679
G1 X167.182 Y124.734 E.13773
G1 X166.642 Y124.734 E.01679
G1 X164.051 Y127.325 E.11399
G1 X164.051 Y126.786 E.01679
G1 X166.103 Y124.734 E.09024
G1 X165.563 Y124.734 E.01679
G1 X164.051 Y126.246 E.0665
G1 X164.051 Y125.706 E.01679
G1 X165.023 Y124.734 E.04276
G1 X164.483 Y124.734 E.01679
G1 X163.881 Y125.336 E.02649
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X164.483 Y124.734 E-.32362
G1 X165.023 Y124.734 E-.20511
G1 X164.593 Y125.164 E-.23127
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z.8 I.268 J-1.187 P1  F30000
G1 X135.432 Y118.59 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F15476.11
G1 X135.479 Y118.602 E.00159
G1 X136.898 Y118.602 E.04708
G1 X136.898 Y120.021 E.04708
G1 X136.898 Y134.398 E.47689
G1 X135.479 Y134.398 E.04708
G2 X134.972 Y134.695 I.041 J.651 E.02019
G1 X134.898 Y134.979 E.00974
G1 X134.898 Y136.398 E.04708
G1 X119.102 Y136.398 E.52398
G1 X119.102 Y116.602 E.65666
G1 X134.898 Y116.602 E.52398
G1 X134.898 Y118.021 E.04708
G2 X135.195 Y118.528 I.651 J-.041 E.02019
G1 X135.374 Y118.575 E.00616
G1 X135.332 Y118.139 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F12000
G1 X135.392 Y118.168 E.00205
G1 X135.479 Y118.21 E.00296
G1 X137.29 Y118.21 E.05566
G1 X137.29 Y120.021 E.05566
G1 X137.29 Y134.79 E.4538
G1 X135.479 Y134.79 E.05566
G1 X135.361 Y134.832 E.00383
G1 X135.332 Y134.892 E.00205
G1 X135.29 Y134.979 E.00296
G1 X135.29 Y136.79 E.05566
G1 X118.71 Y136.79 E.50946
G1 X118.71 Y116.21 E.63237
G1 X135.29 Y116.21 E.50946
G1 X135.29 Y118.021 E.05566
G1 X135.312 Y118.082 E.00199
M204 S10000
; WIPE_START
G1 F24000
G1 X135.392 Y118.168 E-.04458
G1 X135.479 Y118.21 E-.03656
G1 X137.265 Y118.21 E-.67887
; WIPE_END
G1 E-.04 F1800
G1 X133.966 Y116.763 Z1 F30000
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423906
G1 F15000
G1 X134.567 Y117.364 E.02638
G1 X134.567 Y117.903 E.01673
G1 X133.597 Y116.933 E.04259
G1 X133.058 Y116.933 E.01673
G1 X136.567 Y120.442 E.15405
G1 X136.567 Y119.903 E.01673
G1 X135.597 Y118.933 E.04259
G1 X136.136 Y118.933 E.01673
G1 X136.737 Y119.534 E.02638
G1 X136.737 Y121.15 F30000
G1 F15000
G1 X132.519 Y116.933 E.18516
G1 X131.981 Y116.933 E.01673
G1 X136.567 Y121.519 E.20136
G1 X136.567 Y122.058 E.01673
G1 X131.442 Y116.933 E.22502
G1 X130.903 Y116.933 E.01673
G1 X136.567 Y122.597 E.24868
G1 X136.567 Y123.136 E.01673
G1 X130.364 Y116.933 E.27233
G1 X129.825 Y116.933 E.01673
G1 X136.567 Y123.675 E.29599
G1 X136.567 Y124.213 E.01673
G1 X129.287 Y116.933 E.31964
G1 X128.748 Y116.933 E.01673
G1 X136.567 Y124.752 E.3433
G1 X136.567 Y125.291 E.01673
G1 X128.209 Y116.933 E.36696
G1 X127.67 Y116.933 E.01673
G1 X136.567 Y125.83 E.39061
G1 X136.567 Y126.369 E.01673
G1 X127.131 Y116.933 E.41427
G1 X126.593 Y116.933 E.01673
G1 X136.567 Y126.907 E.43792
G1 X136.567 Y127.446 E.01673
G1 X126.054 Y116.933 E.46158
G1 X125.515 Y116.933 E.01673
G1 X136.567 Y127.985 E.48523
G1 X136.567 Y128.524 E.01673
G1 X124.976 Y116.933 E.50889
G1 X124.437 Y116.933 E.01673
G1 X136.567 Y129.063 E.53255
G1 X136.567 Y129.601 E.01673
G1 X123.899 Y116.933 E.5562
G1 X123.36 Y116.933 E.01673
G1 X136.567 Y130.14 E.57986
G1 X136.567 Y130.679 E.01673
G1 X122.821 Y116.933 E.60351
G1 X122.282 Y116.933 E.01673
G1 X136.567 Y131.218 E.62717
G1 X136.567 Y131.757 E.01673
G1 X121.743 Y116.933 E.65083
G1 X121.205 Y116.933 E.01673
G1 X136.567 Y132.295 E.67448
G1 X136.567 Y132.834 E.01673
G1 X120.666 Y116.933 E.69814
G1 X120.127 Y116.933 E.01673
G1 X136.567 Y133.373 E.72179
G1 X136.567 Y133.912 E.01673
G1 X119.588 Y116.933 E.74545
G1 X119.433 Y116.933 E.00482
G1 X119.433 Y117.317 E.01191
G1 X136.183 Y134.067 E.73542
G1 X135.644 Y134.067 E.01673
G1 X119.433 Y117.856 E.71176
G1 X119.433 Y118.394 E.01673
G1 X135.165 Y134.126 E.6907
G2 X134.833 Y134.333 I.614 J1.354 E.01218
G1 X119.433 Y118.933 E.67614
G1 X119.433 Y119.472 E.01673
G1 X134.626 Y134.665 E.66704
G1 X134.605 Y134.713 E.00163
G2 X134.567 Y135.145 I1.417 J.344 E.0135
G1 X119.433 Y120.011 E.66445
G1 X119.433 Y120.55 E.01673
G1 X134.567 Y135.683 E.66445
G1 X134.567 Y136.067 E.01191
G1 X134.412 Y136.067 E.00482
G1 X119.433 Y121.088 E.65764
G1 X119.433 Y121.627 E.01673
G1 X133.873 Y136.067 E.63398
G1 X133.334 Y136.067 E.01673
G1 X119.433 Y122.166 E.61032
G1 X119.433 Y122.705 E.01673
G1 X132.795 Y136.067 E.58667
G1 X132.257 Y136.067 E.01673
G1 X119.433 Y123.243 E.56301
G1 X119.433 Y123.782 E.01673
G1 X131.718 Y136.067 E.53936
G1 X131.179 Y136.067 E.01673
G1 X119.433 Y124.321 E.5157
G1 X119.433 Y124.86 E.01673
G1 X130.64 Y136.067 E.49204
G1 X130.101 Y136.067 E.01673
G1 X119.433 Y125.399 E.46839
G1 X119.433 Y125.937 E.01673
G1 X129.563 Y136.067 E.44473
G1 X129.024 Y136.067 E.01673
G1 X119.433 Y126.476 E.42108
G1 X119.433 Y127.015 E.01673
G1 X128.485 Y136.067 E.39742
G1 X127.946 Y136.067 E.01673
G1 X119.433 Y127.554 E.37377
G1 X119.433 Y128.093 E.01673
G1 X127.407 Y136.067 E.35011
G1 X126.869 Y136.067 E.01673
G1 X119.433 Y128.631 E.32645
G1 X119.433 Y129.17 E.01673
G1 X126.33 Y136.067 E.3028
G1 X125.791 Y136.067 E.01673
G1 X119.433 Y129.709 E.27914
G1 X119.433 Y130.248 E.01673
G1 X125.252 Y136.067 E.25549
G1 X124.713 Y136.067 E.01673
G1 X119.433 Y130.787 E.23183
G1 X119.433 Y131.325 E.01673
G1 X124.175 Y136.067 E.20817
G1 X123.636 Y136.067 E.01673
G1 X119.433 Y131.864 E.18452
G1 X119.433 Y132.403 E.01673
G1 X123.097 Y136.067 E.16086
G1 X122.558 Y136.067 E.01673
G1 X119.433 Y132.942 E.13721
G1 X119.433 Y133.481 E.01673
G1 X122.019 Y136.067 E.11355
G1 X121.481 Y136.067 E.01673
G1 X119.433 Y134.019 E.0899
G1 X119.433 Y134.558 E.01673
G1 X120.942 Y136.067 E.06624
G1 X120.403 Y136.067 E.01673
G1 X119.433 Y135.097 E.04258
G1 X119.433 Y135.636 E.01673
G1 X120.034 Y136.237 E.02638
; WIPE_START
G1 F24000
G1 X119.433 Y135.636 E-.32287
G1 X119.433 Y135.097 E-.20474
G1 X119.866 Y135.529 E-.23239
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.498 Y135.55 Z1 F30000
G1 X175.187 Y135.678 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F15476.11
G1 X175.565 Y136.632 E.03407
G1 X175.716 Y137.731 E.03677
G1 X175.599 Y138.833 E.03677
G1 X175.222 Y139.875 E.03677
G1 X174.606 Y140.797 E.03677
G1 X173.787 Y141.545 E.03677
G1 X172.814 Y142.075 E.03677
G1 X171.742 Y142.357 E.03677
G1 X170.633 Y142.374 E.03677
G1 X169.553 Y142.125 E.03677
G1 X168.563 Y141.624 E.03677
G1 X167.768 Y140.942 E.03475
G1 X167.63 Y140.797 E.00665
G1 X167.079 Y139.999 E.03216
G1 X166.67 Y138.969 E.03677
G1 X166.52 Y137.871 E.03677
G1 X166.637 Y136.768 E.03677
G1 X167.014 Y135.726 E.03677
G1 X167.63 Y134.804 E.03677
G1 X168.448 Y134.056 E.03677
G1 X169.422 Y133.526 E.03677
G1 X170.563 Y133.232 E.03908
G1 X171.603 Y133.228 E.03449
G1 X172.683 Y133.477 E.03677
G1 X173.672 Y133.977 E.03677
G1 X174.513 Y134.699 E.03677
G1 X175.157 Y135.602 E.03677
G1 X175.165 Y135.622 E.00071
G1 X174.836 Y135.829 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F12000
G1 X175.199 Y136.771 E.03102
G1 X175.327 Y137.778 E.03118
G1 X175.21 Y138.786 E.03118
G1 X174.855 Y139.736 E.03118
G1 X174.283 Y140.575 E.03118
G1 X173.527 Y141.251 E.03118
G1 X172.632 Y141.728 E.03118
G1 X171.648 Y141.976 E.03118
G1 X170.633 Y141.981 E.03118
G1 X169.647 Y141.744 E.03118
G1 X168.746 Y141.277 E.03118
G1 X168.028 Y140.649 E.02931
G1 X167.402 Y139.777 E.033
G1 X167.037 Y138.83 E.03118
G1 X166.909 Y137.823 E.03118
G1 X167.026 Y136.815 E.03118
G1 X167.381 Y135.865 E.03118
G1 X167.952 Y135.027 E.03118
G1 X168.708 Y134.35 E.03118
G1 X169.604 Y133.873 E.03118
G1 X170.61 Y133.621 E.03187
G1 X171.603 Y133.62 E.03049
G1 X172.589 Y133.857 E.03118
G1 X173.49 Y134.324 E.03118
G1 X174.253 Y134.993 E.03118
G1 X174.803 Y135.78 E.02949
M204 S10000
; WIPE_START
G1 F24000
G1 X175.199 Y136.771 E-.4058
G1 X175.316 Y137.696 E-.3542
; WIPE_END
G1 E-.04 F1800
G1 X181.231 Y142.52 Z1 F30000
G1 X184.516 Y145.199 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F15476.11
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y130.35 E.19727
G1 X184.516 Y145.139 E.49057
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F12000
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y130.35 E.19478
G1 X184.908 Y145.531 E.46647
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X175.282 Y145.213 Z1 F30000
G1 X171.13 Y145.037 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.424588
G1 F15000
G1 X164.051 Y137.958 E.31137
G1 X164.051 Y138.498 E.01679
G1 X170.421 Y144.868 E.28017
G1 X169.881 Y144.868 E.01679
G1 X164.051 Y139.037 E.25643
G1 X164.051 Y139.577 E.01679
G1 X169.341 Y144.868 E.23269
G1 X168.801 Y144.868 E.01679
G1 X164.051 Y140.117 E.20895
G1 X164.051 Y140.657 E.01679
G1 X168.262 Y144.868 E.18521
G1 X167.722 Y144.868 E.01679
G1 X164.051 Y141.196 E.16147
G1 X164.051 Y141.736 E.01679
G1 X167.182 Y144.868 E.13773
G1 X166.642 Y144.868 E.01679
G1 X164.051 Y142.276 E.11399
G1 X164.051 Y142.816 E.01679
G1 X166.103 Y144.868 E.09024
G1 X165.563 Y144.868 E.01679
G1 X164.051 Y143.356 E.0665
G1 X164.051 Y143.895 E.01679
G1 X165.023 Y144.868 E.04276
G1 X164.483 Y144.868 E.01679
G1 X163.881 Y144.265 E.02649
G1 X164.151 Y124.564 F30000
G1 F15000
G1 X172.736 Y133.149 E.37759
G1 X172.025 Y132.978 E.02274
G1 X164.051 Y125.004 E.35073
G1 X164.051 Y125.543 E.01679
G1 X171.408 Y132.901 E.32361
G1 X170.866 Y132.898 E.01688
G1 X164.051 Y126.083 E.29974
G1 X164.051 Y126.623 E.01679
G1 X170.364 Y132.936 E.27766
G1 X169.931 Y133.043 E.01387
G1 X164.051 Y127.163 E.25862
G1 X164.051 Y127.702 E.01679
G1 X169.498 Y133.149 E.23958
G2 X169.12 Y133.311 I.495 J1.682 E.01282
G1 X164.051 Y128.242 E.22294
G1 X164.051 Y128.782 E.01679
G1 X168.766 Y133.497 E.20737
G1 X168.412 Y133.683 E.01243
G1 X164.051 Y129.322 E.1918
G1 X164.051 Y129.862 E.01679
G1 X168.106 Y133.917 E.17837
G1 X167.82 Y134.171 E.01189
G1 X164.051 Y130.401 E.16579
G1 X164.051 Y130.941 E.01679
G1 X167.534 Y134.424 E.1532
G2 X167.287 Y134.717 I1.242 J1.295 E.01194
G1 X164.051 Y131.481 E.14235
G1 X164.051 Y132.021 E.01679
G1 X167.067 Y135.037 E.13266
G1 X166.847 Y135.356 E.01207
G1 X164.051 Y132.56 E.12296
G1 X164.051 Y133.1 E.01679
G1 X166.665 Y135.714 E.11496
G1 X166.516 Y136.105 E.01302
G1 X164.051 Y133.64 E.10843
G1 X164.051 Y134.18 E.01679
G1 X166.368 Y136.496 E.1019
G2 X166.281 Y136.95 I2.021 J.621 E.01438
G1 X164.051 Y134.719 E.0981
G1 X164.051 Y135.259 E.01679
G1 X166.223 Y137.431 E.09553
G2 X166.195 Y137.943 I2.072 J.368 E.01599
G1 X164.051 Y135.799 E.09431
G1 X164.051 Y136.339 E.01679
G1 X166.271 Y138.558 E.09763
G2 X166.423 Y139.25 I1.927 J-.061 E.02216
G1 X164.051 Y136.878 E.10433
G1 X164.051 Y137.418 E.01679
G1 X166.789 Y140.157 E.12045
G1 X167.362 Y140.992 E.03149
G1 X167.497 Y141.145 E.00636
G1 X168.235 Y141.798 E.03063
G2 X168.706 Y142.073 I1.369 J-1.803 E.01701
G1 X171.5 Y144.868 E.12291
G1 X172.04 Y144.868 E.01679
G1 X169.666 Y142.493 E.10442
G1 X170.382 Y142.67 E.02294
G1 X172.58 Y144.868 E.09665
G1 X173.12 Y144.868 E.01679
G1 X170.953 Y142.701 E.09529
G1 X171.487 Y142.695 E.01661
G1 X173.659 Y144.868 E.09554
G1 X174.199 Y144.868 E.01679
G1 X171.971 Y142.64 E.098
G1 X172.405 Y142.533 E.01389
G1 X174.739 Y144.868 E.10266
G1 X175.279 Y144.868 E.01679
G1 X172.832 Y142.421 E.10762
G2 X173.198 Y142.247 I-.531 J-1.595 E.01264
G1 X175.818 Y144.868 E.11525
G1 X176.358 Y144.868 E.01679
G1 X173.552 Y142.061 E.12342
G2 X173.899 Y141.868 I-.621 J-1.525 E.01237
G1 X176.898 Y144.868 E.13191
G1 X177.438 Y144.868 E.01679
G1 X174.196 Y141.626 E.1426
G1 X174.482 Y141.372 E.01189
G1 X177.977 Y144.868 E.15375
G1 X178.517 Y144.868 E.01679
G1 X174.765 Y141.115 E.16505
G2 X174.999 Y140.81 I-1.139 J-1.119 E.012
G1 X179.057 Y144.868 E.17847
G1 X179.597 Y144.868 E.01679
G1 X175.22 Y140.491 E.19251
G2 X175.439 Y140.17 I-1.21 J-1.064 E.01211
G1 X180.136 Y144.868 E.20661
G1 X180.676 Y144.868 E.01679
G1 X175.605 Y139.797 E.22303
G1 X175.754 Y139.405 E.01302
G1 X181.216 Y144.868 E.24024
G1 X181.756 Y144.868 E.01679
G1 X175.896 Y139.008 E.25774
G2 X175.968 Y138.54 I-1.937 J-.539 E.01475
G1 X182.295 Y144.868 E.27831
G1 X182.835 Y144.868 E.01679
G1 X176.026 Y138.059 E.29948
G2 X176.022 Y137.515 I-1.75 J-.258 E.01699
G1 X183.375 Y144.868 E.32341
G1 X183.915 Y144.868 E.01679
G1 X175.944 Y136.896 E.3506
G1 X175.908 Y136.619 E.0087
G1 X175.726 Y136.139 E.01595
G1 X184.185 Y144.598 E.37203
G1 X184.185 Y144.058 E.01679
G1 X164.86 Y124.734 E.84995
G1 X165.4 Y124.734 E.01679
G1 X184.185 Y143.518 E.82621
G1 X184.185 Y142.978 E.01679
G1 X165.94 Y124.734 E.80247
G1 X166.48 Y124.734 E.01679
G1 X184.185 Y142.439 E.77873
G1 X184.185 Y141.899 E.01679
G1 X167.02 Y124.734 E.75499
G1 X167.559 Y124.734 E.01679
G1 X184.185 Y141.359 E.73125
G1 X184.185 Y140.819 E.01679
G1 X168.099 Y124.734 E.70751
G1 X168.639 Y124.734 E.01679
G1 X184.185 Y140.28 E.68377
G1 X184.185 Y139.74 E.01679
G1 X169.179 Y124.734 E.66002
G1 X169.718 Y124.734 E.01679
G1 X184.185 Y139.2 E.63628
G1 X184.185 Y138.66 E.01679
G1 X170.258 Y124.734 E.61254
G1 X170.798 Y124.734 E.01679
G1 X184.185 Y138.121 E.5888
G1 X184.185 Y137.581 E.01679
G1 X171.338 Y124.734 E.56506
G1 X171.877 Y124.734 E.01679
G1 X184.185 Y137.041 E.54132
G1 X184.185 Y136.501 E.01679
G1 X172.417 Y124.734 E.51758
G1 X172.957 Y124.734 E.01679
G1 X184.185 Y135.962 E.49384
G1 X184.185 Y135.422 E.01679
G1 X173.497 Y124.734 E.4701
G1 X174.036 Y124.734 E.01679
G1 X184.185 Y134.882 E.44636
G1 X184.185 Y134.342 E.01679
G1 X174.576 Y124.734 E.42262
G1 X175.116 Y124.734 E.01679
G1 X184.185 Y133.803 E.39888
G1 X184.185 Y133.263 E.01679
G1 X175.656 Y124.734 E.37514
G1 X176.195 Y124.734 E.01679
G1 X184.185 Y132.723 E.3514
G1 X184.185 Y132.183 E.01679
G1 X176.735 Y124.734 E.32766
G1 X177.275 Y124.734 E.01679
G1 X184.185 Y131.643 E.30392
G1 X184.185 Y131.104 E.01679
G1 X177.815 Y124.734 E.28018
G1 X178.354 Y124.734 E.01679
G1 X184.185 Y130.564 E.25643
G1 X184.185 Y130.024 E.01679
G1 X178.894 Y124.734 E.23269
M73 P26 R20
G1 X179.434 Y124.734 E.01679
G1 X184.185 Y129.484 E.20895
G1 X184.185 Y128.945 E.01679
G1 X179.974 Y124.734 E.18521
G1 X180.514 Y124.734 E.01679
G1 X184.185 Y128.405 E.16147
G1 X184.185 Y127.865 E.01679
G1 X181.053 Y124.734 E.13773
G1 X181.593 Y124.734 E.01679
G1 X184.185 Y127.325 E.11399
G1 X184.185 Y126.786 E.01679
G1 X182.133 Y124.734 E.09025
G1 X182.673 Y124.734 E.01679
G1 X184.185 Y126.246 E.06651
G1 X184.185 Y125.706 E.01679
G1 X183.212 Y124.734 E.04277
G1 X183.752 Y124.734 E.01679
G1 X184.354 Y125.336 E.02649
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X183.752 Y124.734 E-.32369
G1 X183.212 Y124.734 E-.20511
G1 X183.643 Y125.164 E-.2312
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z1 I.164 J-1.206 P1  F30000
G1 X135.432 Y118.59 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F6371
G1 X135.479 Y118.602 E.00159
G1 X136.898 Y118.602 E.04708
G1 X136.898 Y120.021 E.04708
G1 X136.898 Y134.398 E.47689
G1 X135.479 Y134.398 E.04708
G2 X134.972 Y134.695 I.041 J.651 E.02019
G1 X134.898 Y134.979 E.00974
G1 X134.898 Y136.398 E.04708
G1 X119.102 Y136.398 E.52398
G1 X119.102 Y116.602 E.65666
G1 X134.898 Y116.602 E.52398
G1 X134.898 Y118.021 E.04708
G2 X135.195 Y118.528 I.651 J-.041 E.02019
G1 X135.374 Y118.575 E.00616
G1 X135.332 Y118.139 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F6371
G1 X135.392 Y118.168 E.00205
G1 X135.479 Y118.21 E.00296
G1 X137.29 Y118.21 E.05566
G1 X137.29 Y120.021 E.05566
G1 X137.29 Y134.79 E.4538
G1 X135.479 Y134.79 E.05566
G1 X135.361 Y134.832 E.00383
G1 X135.332 Y134.892 E.00205
G1 X135.29 Y134.979 E.00296
G1 X135.29 Y136.79 E.05566
G1 X118.71 Y136.79 E.50946
G1 X118.71 Y116.21 E.63237
G1 X135.29 Y116.21 E.50946
G1 X135.29 Y118.021 E.05566
G1 X135.312 Y118.082 E.00199
M204 S10000
G1 X134.552 Y118.032 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6371
G2 X135.468 Y118.948 I.941 J-.025 E.0474
G1 X136.552 Y118.948 E.03596
G1 X136.552 Y134.052 E.50102
G2 X135.209 Y134.091 I-.542 J4.491 E.04473
G2 X134.552 Y134.968 I.305 J.913 E.03867
G1 X134.552 Y136.052 E.03596
G1 X119.448 Y136.052 E.50102
G1 X119.448 Y125.689 E.34376
G1 X134.189 Y125.689 E.48898
G1 X134.189 Y121.311 E.14522
G1 X119.448 Y121.311 E.48898
G1 X119.448 Y116.948 E.14473
G1 X134.552 Y116.948 E.50102
G1 X134.552 Y117.972 E.03397
G1 X122.921 Y117.355 F30000
G1 F6371
G1 X121.293 Y117.355 E.05401
G1 X119.855 Y118.793 E.06745
G1 X119.855 Y117.855 E.03111
G1 X122.904 Y120.904 E.14303
G1 X125.42 Y120.904 E.08346
G1 X128.969 Y117.355 E.16649
G1 X127.031 Y117.355 E.06428
G1 X130.58 Y120.904 E.16649
G1 X133.096 Y120.904 E.08346
G1 X134.818 Y119.182 E.08081
G2 X136.145 Y119.355 I1.092 J-3.188 E.04467
G1 X136.145 Y119.627 E.00903
G1 X136.145 Y131.579 F30000
G1 F6371
G1 X136.145 Y133.207 E.05401
G1 X135.707 Y133.645 E.02053
G1 X135.645 Y133.645 E.00207
G1 X128.096 Y126.096 E.35413
G1 X127.904 Y126.096 E.00636
G1 X119.855 Y134.145 E.37759
G1 X119.855 Y133.207 E.03111
G1 X122.293 Y135.645 E.11436
G1 X126.031 Y135.645 E.124
G1 X136.145 Y125.531 E.47445
G1 X136.145 Y126.469 E.03111
G1 X134.596 Y124.92 E.07266
G1 X134.596 Y126.096 E.03901
G1 X134.144 Y126.096 E.01501
G1 X119.855 Y128.097 F30000
G1 F6371
G1 X119.855 Y126.469 E.05401
G1 X120.228 Y126.096 E.0175
G1 X120.42 Y126.096 E.00636
G1 X129.969 Y135.645 E.44796
G1 X133.707 Y135.645 E.124
G1 X134.145 Y135.207 E.02053
G3 X134.812 Y133.819 I1.415 J-.174 E.05397
G1 X119.448 Y123.496 F30000
G1 F6371
G1 X119.448 Y125.124 E.05401
G1 X119.606 Y125.282 E.0074
G1 X121.042 Y125.282 E.04765
G1 X124.606 Y121.718 E.16717
G1 X123.718 Y121.718 E.02944
G1 X127.282 Y125.282 E.16717
G1 X128.718 Y125.282 E.04765
G1 X132.282 Y121.718 E.16717
G1 X131.394 Y121.718 E.02944
G1 X133.782 Y124.106 E.11201
G1 X133.782 Y125.282 E.03901
G1 X133.329 Y125.282 E.01501
; WIPE_START
G1 F24000
G1 X133.782 Y125.282 E-.17189
G1 X133.782 Y124.106 E-.44687
G1 X133.519 Y123.843 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X140.559 Y126.791 Z1.2 F30000
G1 X184.516 Y145.199 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F6371
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y130.35 E.19727
G1 X184.516 Y145.139 E.49057
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F6371
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y130.35 E.19478
G1 X184.908 Y145.531 E.46647
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.202 Y139.527 Z1.2 F30000
G1 X175.187 Y135.677 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F6371
G1 X175.565 Y136.632 E.03407
G1 X175.72 Y137.801 E.03909
G1 X175.599 Y138.833 E.03448
G1 X175.222 Y139.875 E.03677
G1 X174.606 Y140.797 E.03677
G1 X173.787 Y141.545 E.03677
G1 X172.814 Y142.075 E.03677
G1 X171.742 Y142.357 E.03677
G1 X170.633 Y142.374 E.03677
G1 X169.553 Y142.125 E.03677
G1 X168.563 Y141.624 E.03677
G1 X167.768 Y140.942 E.03475
G1 X167.63 Y140.797 E.00665
G1 X167.079 Y139.999 E.03216
G1 X166.67 Y138.969 E.03677
G1 X166.52 Y137.871 E.03677
G1 X166.637 Y136.768 E.03677
G1 X167.014 Y135.726 E.03677
G1 X167.63 Y134.804 E.03677
G1 X168.448 Y134.056 E.03677
G1 X169.422 Y133.526 E.03677
G1 X170.494 Y133.245 E.03677
G1 X171.603 Y133.228 E.03677
G1 X172.683 Y133.477 E.03677
G1 X173.672 Y133.977 E.03677
G1 X174.513 Y134.699 E.03677
G1 X175.157 Y135.602 E.03677
G1 X175.164 Y135.622 E.00071
G1 X174.836 Y135.829 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F6371
G1 X175.199 Y136.771 E.03104
G1 X175.328 Y137.801 E.03188
G1 X175.21 Y138.786 E.03049
G1 X174.855 Y139.736 E.03118
G1 X174.283 Y140.575 E.03118
M73 P26 R19
G1 X173.527 Y141.251 E.03118
G1 X172.632 Y141.728 E.03118
G1 X171.648 Y141.976 E.03118
G1 X170.633 Y141.981 E.03118
G1 X169.647 Y141.744 E.03118
G1 X168.746 Y141.277 E.03118
G1 X168.028 Y140.649 E.02931
G1 X167.402 Y139.777 E.033
G1 X167.037 Y138.83 E.03118
G1 X166.909 Y137.823 E.03118
G1 X167.026 Y136.815 E.03118
G1 X167.381 Y135.865 E.03118
G1 X167.952 Y135.027 E.03118
G1 X168.708 Y134.35 E.03118
G1 X169.604 Y133.873 E.03118
G1 X170.588 Y133.625 E.03118
G1 X171.603 Y133.62 E.03118
G1 X172.589 Y133.857 E.03118
G1 X173.49 Y134.324 E.03118
G1 X174.253 Y134.993 E.03118
G1 X174.802 Y135.779 E.02948
M204 S10000
; WIPE_START
G1 F24000
G1 X175.199 Y136.771 E-.40603
G1 X175.315 Y137.696 E-.35397
; WIPE_END
G1 E-.04 F1800
G1 X167.818 Y136.264 Z1.2 F30000
G1 X164.066 Y135.548 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6371
G1 X164.066 Y137.177 E.05401
G1 X176.494 Y124.749 E.58302
G1 X179.418 Y124.749 E.097
G1 X184.17 Y129.501 E.22292
G1 X184.17 Y132.425 E.097
G1 X171.742 Y144.853 E.58302
G1 X168.818 Y144.853 E.097
G1 X164.066 Y140.101 E.22292
G1 X164.066 Y144.853 E.15763
G1 X167.633 Y141.285 E.16735
G3 X166.897 Y135.256 I3.53 J-3.49 E.2168
G1 X164.066 Y132.425 E.13282
G1 X164.066 Y129.501 E.097
G1 X168.818 Y124.749 E.22292
G1 X171.742 Y124.749 E.097
G1 X184.17 Y137.177 E.58302
G1 X184.17 Y140.101 E.097
G1 X179.418 Y144.853 E.22292
G1 X176.494 Y144.853 E.097
G1 X173.662 Y142.021 E.13285
G2 X175.917 Y136.6 I-2.684 J-4.296 E.20773
G1 X184.17 Y144.853 E.38714
G1 X182.541 Y144.853 E.05401
G1 X165.694 Y124.749 F30000
G1 F6371
G1 X164.066 Y124.749 E.05401
G1 X172.36 Y133.043 E.3891
G3 X174.599 Y134.319 I-1.244 J4.783 E.08649
G1 X184.17 Y124.749 E.44898
G1 X182.541 Y124.749 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X184.17 Y124.749 E-.61876
G1 X183.907 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z1.2 I.16 J-1.206 P1  F30000
G1 X135.432 Y118.59 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F6342
G1 X135.479 Y118.602 E.00159
G1 X136.898 Y118.602 E.04708
G1 X136.898 Y120.021 E.04708
G1 X136.898 Y134.398 E.47689
G1 X135.479 Y134.398 E.04708
G2 X134.972 Y134.695 I.041 J.651 E.02019
G1 X134.898 Y134.979 E.00974
G1 X134.898 Y136.398 E.04708
G1 X119.102 Y136.398 E.52398
G1 X119.102 Y116.602 E.65666
G1 X134.898 Y116.602 E.52398
G1 X134.898 Y118.021 E.04708
G2 X135.195 Y118.528 I.651 J-.041 E.02019
G1 X135.374 Y118.575 E.00616
G1 X135.332 Y118.139 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F6342
G1 X135.392 Y118.168 E.00205
G1 X135.479 Y118.21 E.00296
G1 X137.29 Y118.21 E.05566
G1 X137.29 Y120.021 E.05566
G1 X137.29 Y134.79 E.4538
G1 X135.479 Y134.79 E.05566
G1 X135.361 Y134.832 E.00383
G1 X135.332 Y134.892 E.00205
G1 X135.29 Y134.979 E.00296
G1 X135.29 Y136.79 E.05566
G1 X118.71 Y136.79 E.50946
G1 X118.71 Y116.21 E.63237
G1 X135.29 Y116.21 E.50946
G1 X135.29 Y118.021 E.05566
G1 X135.312 Y118.082 E.00199
M204 S10000
G1 X134.552 Y118.032 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6342
G2 X135.468 Y118.948 I.941 J-.025 E.0474
G1 X136.552 Y118.948 E.03596
G1 X136.552 Y134.052 E.50102
G2 X135.209 Y134.091 I-.542 J4.491 E.04473
G2 X134.552 Y134.968 I.305 J.913 E.03867
G1 X134.552 Y136.052 E.03596
G1 X119.448 Y136.052 E.50102
G1 X119.448 Y125.689 E.34376
G1 X134.189 Y125.689 E.48898
G1 X134.189 Y121.311 E.14522
G1 X119.448 Y121.311 E.48898
G1 X119.448 Y116.948 E.14473
G1 X134.552 Y116.948 E.50102
G1 X134.552 Y117.972 E.03397
G1 X136.145 Y119.627 F30000
G1 F6342
G1 X136.145 Y119.355 E.00903
G3 X134.818 Y119.182 I-.235 J-3.362 E.04467
G1 X133.096 Y120.904 E.08081
G1 X130.58 Y120.904 E.08346
G1 X127.031 Y117.355 E.16649
G1 X128.969 Y117.355 E.06428
G1 X125.42 Y120.904 E.16649
G1 X122.904 Y120.904 E.08346
G1 X119.855 Y117.855 E.14303
G1 X119.855 Y118.793 E.03111
G1 X121.293 Y117.355 E.06745
G1 X122.921 Y117.355 E.05401
G1 X133.329 Y125.282 F30000
G1 F6342
G1 X133.782 Y125.282 E.01501
G1 X133.782 Y124.106 E.03901
G1 X131.394 Y121.718 E.11201
G1 X132.282 Y121.718 E.02944
G1 X128.718 Y125.282 E.16717
G1 X127.282 Y125.282 E.04765
G1 X123.718 Y121.718 E.16717
G1 X124.606 Y121.718 E.02944
G1 X121.042 Y125.282 E.16717
G1 X119.606 Y125.282 E.04765
G1 X119.448 Y125.124 E.0074
G1 X119.448 Y123.496 E.05401
G1 X134.144 Y126.096 F30000
G1 F6342
G1 X134.596 Y126.096 E.01501
G1 X134.596 Y124.92 E.03901
G1 X136.145 Y126.469 E.07266
G1 X136.145 Y125.531 E.03111
G1 X126.031 Y135.645 E.47445
G1 X122.293 Y135.645 E.124
G1 X119.855 Y133.207 E.11436
G1 X119.855 Y134.145 E.03111
G1 X127.904 Y126.096 E.37759
G1 X128.096 Y126.096 E.00636
G1 X135.645 Y133.645 E.35413
G1 X135.707 Y133.645 E.00207
G1 X136.145 Y133.207 E.02053
G1 X136.145 Y131.579 E.05401
G1 X134.812 Y133.819 F30000
G1 F6342
G2 X134.145 Y135.207 I.747 J1.214 E.05397
G1 X133.707 Y135.645 E.02053
G1 X129.969 Y135.645 E.124
G1 X120.42 Y126.096 E.44796
G1 X120.228 Y126.096 E.00636
G1 X119.855 Y126.469 E.0175
G1 X119.855 Y128.097 E.05401
; WIPE_START
G1 F24000
G1 X119.855 Y126.469 E-.61876
M73 P27 R19
G1 X120.118 Y126.206 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.439 Y128.365 Z1.4 F30000
G1 X184.516 Y145.199 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F6342
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y130.35 E.19727
G1 X184.516 Y145.139 E.49057
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F6342
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y130.35 E.19478
G1 X184.908 Y145.531 E.46647
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.202 Y139.527 Z1.4 F30000
G1 X175.187 Y135.677 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F6342
G1 X175.565 Y136.632 E.03408
G1 X175.72 Y137.801 E.03909
G1 X175.599 Y138.833 E.03448
G1 X175.222 Y139.875 E.03677
G1 X174.606 Y140.797 E.03677
G1 X173.787 Y141.545 E.03677
G1 X172.814 Y142.075 E.03677
G1 X171.742 Y142.357 E.03677
G1 X170.633 Y142.374 E.03677
G1 X169.553 Y142.125 E.03677
G1 X168.563 Y141.624 E.03677
G1 X167.768 Y140.942 E.03475
G1 X167.63 Y140.797 E.00665
G1 X167.079 Y139.999 E.03216
G1 X166.67 Y138.969 E.03677
G1 X166.52 Y137.871 E.03677
G1 X166.637 Y136.768 E.03677
G1 X167.014 Y135.726 E.03677
G1 X167.63 Y134.804 E.03677
G1 X168.448 Y134.056 E.03677
G1 X169.422 Y133.526 E.03677
G1 X170.494 Y133.245 E.03677
G1 X171.603 Y133.228 E.03677
G1 X172.683 Y133.477 E.03677
G1 X173.672 Y133.977 E.03677
G1 X174.513 Y134.699 E.03677
G1 X175.157 Y135.602 E.03677
G1 X175.164 Y135.622 E.00071
G1 X174.835 Y135.828 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F6342
G1 X175.199 Y136.771 E.03106
G1 X175.328 Y137.801 E.03188
G1 X175.21 Y138.786 E.03049
G1 X174.855 Y139.736 E.03118
G1 X174.283 Y140.575 E.03118
G1 X173.527 Y141.251 E.03118
G1 X172.632 Y141.728 E.03118
G1 X171.648 Y141.976 E.03118
G1 X170.633 Y141.981 E.03118
G1 X169.647 Y141.744 E.03118
G1 X168.746 Y141.277 E.03118
G1 X168.028 Y140.649 E.02931
G1 X167.402 Y139.777 E.033
G1 X167.037 Y138.83 E.03118
G1 X166.909 Y137.823 E.03118
G1 X167.026 Y136.815 E.03118
G1 X167.381 Y135.865 E.03118
G1 X167.952 Y135.027 E.03118
G1 X168.708 Y134.35 E.03118
G1 X169.604 Y133.873 E.03118
G1 X170.588 Y133.625 E.03118
G1 X171.603 Y133.62 E.03118
G1 X172.589 Y133.857 E.03118
G1 X173.49 Y134.324 E.03118
G1 X174.253 Y134.993 E.03118
G1 X174.802 Y135.779 E.02945
M204 S10000
; WIPE_START
G1 F24000
G1 X175.199 Y136.771 E-.40627
G1 X175.315 Y137.695 E-.35373
; WIPE_END
G1 E-.04 F1800
G1 X180.738 Y143.066 Z1.4 F30000
G1 X182.541 Y144.853 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6342
G1 X184.17 Y144.853 E.05401
G1 X175.923 Y136.615 E.38665
G3 X173.662 Y142.021 I-4.77 J1.18 E.20824
G1 X176.494 Y144.853 E.13285
G1 X179.418 Y144.853 E.097
G1 X184.17 Y140.101 E.22292
G1 X184.17 Y137.177 E.097
G1 X171.742 Y124.749 E.58302
G1 X168.818 Y124.749 E.097
G1 X164.066 Y129.501 E.22292
G1 X164.066 Y132.425 E.097
G1 X166.897 Y135.256 E.13282
G2 X167.633 Y141.285 I4.266 J2.539 E.2168
G1 X164.066 Y144.853 E.16735
G1 X164.066 Y140.101 E.15763
G1 X168.818 Y144.853 E.22292
G1 X171.742 Y144.853 E.097
G1 X184.17 Y132.425 E.58302
G1 X184.17 Y129.501 E.097
G1 X179.418 Y124.749 E.22292
G1 X176.494 Y124.749 E.097
G1 X164.066 Y137.177 E.58302
G1 X164.066 Y135.548 E.05401
G1 X182.541 Y124.749 F30000
G1 F6342
G1 X184.17 Y124.749 E.05401
G1 X174.599 Y134.319 E.44898
G2 X172.36 Y133.043 I-3.483 J3.506 E.08649
G1 X164.066 Y124.749 E.3891
G1 X165.694 Y124.749 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X164.066 Y124.749 E-.61876
G1 X164.329 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z1.4 I.264 J-1.188 P1  F30000
G1 X135.432 Y118.59 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F6339
G1 X135.479 Y118.602 E.00159
G1 X136.898 Y118.602 E.04708
G1 X136.898 Y120.021 E.04708
G1 X136.898 Y134.398 E.47689
G1 X135.479 Y134.398 E.04708
G2 X134.972 Y134.695 I.041 J.651 E.02019
G1 X134.898 Y134.979 E.00974
G1 X134.898 Y136.398 E.04708
G1 X119.102 Y136.398 E.52398
G1 X119.102 Y116.602 E.65666
G1 X134.898 Y116.602 E.52398
G1 X134.898 Y118.021 E.04708
G2 X135.195 Y118.528 I.651 J-.041 E.02019
G1 X135.374 Y118.575 E.00616
G1 X135.332 Y118.139 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F6339
G1 X135.392 Y118.168 E.00205
G1 X135.479 Y118.21 E.00296
G1 X137.29 Y118.21 E.05566
G1 X137.29 Y120.021 E.05566
G1 X137.29 Y134.79 E.4538
G1 X135.479 Y134.79 E.05566
G1 X135.361 Y134.832 E.00383
G1 X135.332 Y134.892 E.00205
G1 X135.29 Y134.979 E.00296
G1 X135.29 Y136.79 E.05566
G1 X118.71 Y136.79 E.50946
G1 X118.71 Y116.21 E.63237
G1 X135.29 Y116.21 E.50946
G1 X135.29 Y118.021 E.05566
G1 X135.312 Y118.082 E.00199
M204 S10000
G1 X134.552 Y118.032 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6339
G2 X135.468 Y118.948 I.941 J-.025 E.0474
G1 X136.552 Y118.948 E.03596
G1 X136.552 Y134.052 E.50102
G2 X135.209 Y134.091 I-.542 J4.491 E.04473
G2 X134.552 Y134.968 I.305 J.913 E.03867
G1 X134.552 Y136.052 E.03596
G1 X119.448 Y136.052 E.50102
G1 X119.448 Y125.689 E.34376
G1 X134.189 Y125.689 E.48898
G1 X134.189 Y121.311 E.14522
G1 X119.448 Y121.311 E.48898
G1 X119.448 Y116.948 E.14473
G1 X134.552 Y116.948 E.50102
G1 X134.552 Y117.972 E.03397
G1 X122.921 Y117.355 F30000
G1 F6339
G1 X121.293 Y117.355 E.05401
G1 X119.855 Y118.793 E.06745
G1 X119.855 Y117.855 E.03111
G1 X122.904 Y120.904 E.14303
G1 X125.42 Y120.904 E.08346
G1 X128.969 Y117.355 E.16649
G1 X127.031 Y117.355 E.06428
G1 X130.58 Y120.904 E.16649
G1 X133.096 Y120.904 E.08346
G1 X134.818 Y119.182 E.08081
G2 X136.145 Y119.355 I1.092 J-3.188 E.04467
G1 X136.145 Y119.627 E.00903
G1 X136.145 Y131.579 F30000
G1 F6339
G1 X136.145 Y133.207 E.05401
G1 X135.707 Y133.645 E.02053
G1 X135.645 Y133.645 E.00207
G1 X128.096 Y126.096 E.35413
G1 X127.904 Y126.096 E.00636
G1 X119.855 Y134.145 E.37759
G1 X119.855 Y133.207 E.03111
G1 X122.293 Y135.645 E.11436
G1 X126.031 Y135.645 E.124
G1 X136.145 Y125.531 E.47445
G1 X136.145 Y126.469 E.03111
G1 X134.596 Y124.92 E.07266
G1 X134.596 Y126.096 E.03901
G1 X134.144 Y126.096 E.01501
G1 X119.855 Y128.097 F30000
G1 F6339
G1 X119.855 Y126.469 E.05401
G1 X120.228 Y126.096 E.0175
G1 X120.42 Y126.096 E.00636
G1 X129.969 Y135.645 E.44796
G1 X133.707 Y135.645 E.124
G1 X134.145 Y135.207 E.02053
G3 X134.812 Y133.819 I1.415 J-.174 E.05397
G1 X119.448 Y123.496 F30000
G1 F6339
G1 X119.448 Y125.124 E.05401
G1 X119.606 Y125.282 E.0074
G1 X121.042 Y125.282 E.04765
G1 X124.606 Y121.718 E.16717
G1 X123.718 Y121.718 E.02944
G1 X127.282 Y125.282 E.16717
G1 X128.718 Y125.282 E.04765
G1 X132.282 Y121.718 E.16717
G1 X131.394 Y121.718 E.02944
G1 X133.782 Y124.106 E.11201
G1 X133.782 Y125.282 E.03901
G1 X133.329 Y125.282 E.01501
; WIPE_START
G1 F24000
G1 X133.782 Y125.282 E-.17189
G1 X133.782 Y124.106 E-.44687
G1 X133.519 Y123.843 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X140.559 Y126.791 Z1.6 F30000
G1 X184.516 Y145.199 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F6339
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y130.35 E.19727
G1 X184.516 Y145.139 E.49057
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F6339
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y130.35 E.19478
G1 X184.908 Y145.531 E.46647
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.202 Y139.527 Z1.6 F30000
G1 X175.187 Y135.677 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F6339
G1 X175.565 Y136.632 E.03408
G1 X175.72 Y137.801 E.03909
G1 X175.599 Y138.833 E.03448
G1 X175.222 Y139.875 E.03677
G1 X174.606 Y140.797 E.03677
G1 X173.787 Y141.545 E.03677
G1 X172.814 Y142.075 E.03677
G1 X171.742 Y142.357 E.03677
G1 X170.633 Y142.374 E.03677
G1 X169.553 Y142.125 E.03677
G1 X168.563 Y141.624 E.03677
G1 X167.768 Y140.942 E.03475
G1 X167.63 Y140.797 E.00665
G1 X167.079 Y139.999 E.03216
G1 X166.67 Y138.969 E.03677
G1 X166.52 Y137.871 E.03677
G1 X166.637 Y136.768 E.03677
G1 X167.014 Y135.726 E.03677
G1 X167.63 Y134.804 E.03677
G1 X168.448 Y134.056 E.03677
G1 X169.422 Y133.526 E.03677
G1 X170.494 Y133.245 E.03677
G1 X171.603 Y133.228 E.03677
G1 X172.683 Y133.477 E.03677
G1 X173.672 Y133.977 E.03677
G1 X174.513 Y134.699 E.03677
G1 X175.157 Y135.602 E.03677
G1 X175.164 Y135.622 E.0007
G1 X174.835 Y135.828 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F6339
G1 X175.199 Y136.771 E.03108
G1 X175.328 Y137.801 E.03188
G1 X175.21 Y138.786 E.03049
G1 X174.855 Y139.736 E.03118
G1 X174.283 Y140.575 E.03118
G1 X173.527 Y141.251 E.03118
G1 X172.632 Y141.728 E.03118
G1 X171.648 Y141.976 E.03118
G1 X170.633 Y141.981 E.03118
G1 X169.647 Y141.744 E.03118
G1 X168.746 Y141.277 E.03118
G1 X168.028 Y140.649 E.02931
G1 X167.402 Y139.777 E.033
G1 X167.037 Y138.83 E.03118
G1 X166.909 Y137.823 E.03118
G1 X167.026 Y136.815 E.03118
G1 X167.381 Y135.865 E.03118
G1 X167.952 Y135.027 E.03118
G1 X168.708 Y134.35 E.03118
G1 X169.604 Y133.873 E.03118
G1 X170.588 Y133.625 E.03118
G1 X171.603 Y133.62 E.03118
G1 X172.589 Y133.857 E.03118
G1 X173.49 Y134.324 E.03118
G1 X174.253 Y134.993 E.03118
G1 X174.801 Y135.778 E.02943
M204 S10000
; WIPE_START
G1 F24000
G1 X175.199 Y136.771 E-.40653
G1 X175.315 Y137.694 E-.35347
; WIPE_END
G1 E-.04 F1800
G1 X167.817 Y136.264 Z1.6 F30000
G1 X164.066 Y135.548 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6339
G1 X164.066 Y137.177 E.05401
G1 X176.494 Y124.749 E.58302
G1 X179.418 Y124.749 E.097
G1 X184.17 Y129.501 E.22292
G1 X184.17 Y132.425 E.097
G1 X171.742 Y144.853 E.58302
G1 X168.818 Y144.853 E.097
G1 X164.066 Y140.101 E.22292
G1 X164.066 Y144.853 E.15763
G1 X167.633 Y141.285 E.16735
G3 X166.897 Y135.256 I3.53 J-3.49 E.2168
G1 X164.066 Y132.425 E.13282
G1 X164.066 Y129.501 E.097
G1 X168.818 Y124.749 E.22292
G1 X171.742 Y124.749 E.097
G1 X184.17 Y137.177 E.58302
G1 X184.17 Y140.101 E.097
G1 X179.418 Y144.853 E.22292
G1 X176.494 Y144.853 E.097
G1 X173.662 Y142.021 E.13285
G2 X175.917 Y136.6 I-2.684 J-4.296 E.20773
G1 X184.17 Y144.853 E.38714
G1 X182.541 Y144.853 E.05401
G1 X165.694 Y124.749 F30000
G1 F6339
G1 X164.066 Y124.749 E.05401
G1 X172.36 Y133.043 E.3891
G3 X174.599 Y134.319 I-1.244 J4.783 E.08649
G1 X184.17 Y124.749 E.44898
G1 X182.541 Y124.749 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X184.17 Y124.749 E-.61876
G1 X183.907 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z1.6 I.16 J-1.206 P1  F30000
G1 X135.432 Y118.59 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F6342
G1 X135.479 Y118.602 E.00159
G1 X136.898 Y118.602 E.04708
G1 X136.898 Y120.021 E.04708
G1 X136.898 Y134.398 E.47689
G1 X135.479 Y134.398 E.04708
G2 X134.972 Y134.695 I.041 J.651 E.02019
G1 X134.898 Y134.979 E.00974
G1 X134.898 Y136.398 E.04708
G1 X119.102 Y136.398 E.52398
G1 X119.102 Y116.602 E.65666
G1 X134.898 Y116.602 E.52398
G1 X134.898 Y118.021 E.04708
G2 X135.195 Y118.528 I.651 J-.041 E.02019
G1 X135.374 Y118.575 E.00616
G1 X135.332 Y118.139 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F6342
G1 X135.392 Y118.168 E.00205
G1 X135.479 Y118.21 E.00296
G1 X137.29 Y118.21 E.05566
G1 X137.29 Y120.021 E.05566
G1 X137.29 Y134.79 E.4538
G1 X135.479 Y134.79 E.05566
G1 X135.361 Y134.832 E.00383
G1 X135.332 Y134.892 E.00205
G1 X135.29 Y134.979 E.00296
G1 X135.29 Y136.79 E.05566
G1 X118.71 Y136.79 E.50946
G1 X118.71 Y116.21 E.63237
G1 X135.29 Y116.21 E.50946
G1 X135.29 Y118.021 E.05566
G1 X135.312 Y118.082 E.00199
M204 S10000
M73 P28 R19
G1 X134.552 Y118.032 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6342
G2 X135.468 Y118.948 I.941 J-.025 E.0474
G1 X136.552 Y118.948 E.03596
G1 X136.552 Y134.052 E.50102
G2 X135.209 Y134.091 I-.542 J4.491 E.04473
G2 X134.552 Y134.968 I.305 J.913 E.03867
G1 X134.552 Y136.052 E.03596
G1 X119.448 Y136.052 E.50102
G1 X119.448 Y125.689 E.34376
G1 X134.189 Y125.689 E.48898
G1 X134.189 Y121.311 E.14522
G1 X119.448 Y121.311 E.48898
G1 X119.448 Y116.948 E.14473
G1 X134.552 Y116.948 E.50102
G1 X134.552 Y117.972 E.03397
G1 X136.145 Y119.627 F30000
G1 F6342
G1 X136.145 Y119.355 E.00903
G3 X134.818 Y119.182 I-.235 J-3.362 E.04467
G1 X133.096 Y120.904 E.08081
G1 X130.58 Y120.904 E.08346
G1 X127.031 Y117.355 E.16649
G1 X128.969 Y117.355 E.06428
G1 X125.42 Y120.904 E.16649
G1 X122.904 Y120.904 E.08346
G1 X119.855 Y117.855 E.14303
G1 X119.855 Y118.793 E.03111
G1 X121.293 Y117.355 E.06745
G1 X122.921 Y117.355 E.05401
G1 X133.329 Y125.282 F30000
G1 F6342
G1 X133.782 Y125.282 E.01501
G1 X133.782 Y124.106 E.03901
G1 X131.394 Y121.718 E.11201
G1 X132.282 Y121.718 E.02944
G1 X128.718 Y125.282 E.16717
G1 X127.282 Y125.282 E.04765
G1 X123.718 Y121.718 E.16717
G1 X124.606 Y121.718 E.02944
G1 X121.042 Y125.282 E.16717
G1 X119.606 Y125.282 E.04765
G1 X119.448 Y125.124 E.0074
G1 X119.448 Y123.496 E.05401
G1 X134.144 Y126.096 F30000
G1 F6342
G1 X134.596 Y126.096 E.01501
G1 X134.596 Y124.92 E.03901
G1 X136.145 Y126.469 E.07266
G1 X136.145 Y125.531 E.03111
G1 X126.031 Y135.645 E.47445
G1 X122.293 Y135.645 E.124
G1 X119.855 Y133.207 E.11436
G1 X119.855 Y134.145 E.03111
G1 X127.904 Y126.096 E.37759
G1 X128.096 Y126.096 E.00636
G1 X135.645 Y133.645 E.35413
G1 X135.707 Y133.645 E.00207
G1 X136.145 Y133.207 E.02053
G1 X136.145 Y131.579 E.05401
G1 X134.812 Y133.819 F30000
G1 F6342
G2 X134.145 Y135.207 I.747 J1.214 E.05397
G1 X133.707 Y135.645 E.02053
G1 X129.969 Y135.645 E.124
G1 X120.42 Y126.096 E.44796
G1 X120.228 Y126.096 E.00636
G1 X119.855 Y126.469 E.0175
G1 X119.855 Y128.097 E.05401
; WIPE_START
G1 F24000
G1 X119.855 Y126.469 E-.61876
G1 X120.118 Y126.206 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.439 Y128.365 Z1.8 F30000
G1 X184.516 Y145.199 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F6342
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y130.35 E.19727
G1 X184.516 Y145.139 E.49057
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F6342
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y130.35 E.19478
G1 X184.908 Y145.531 E.46647
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.202 Y139.527 Z1.8 F30000
G1 X175.187 Y135.677 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F6342
G1 X175.565 Y136.632 E.03408
G1 X175.72 Y137.801 E.03909
G1 X175.599 Y138.833 E.03448
G1 X175.222 Y139.875 E.03677
G1 X174.606 Y140.797 E.03677
G1 X173.787 Y141.545 E.03677
G1 X172.814 Y142.075 E.03677
G1 X171.742 Y142.357 E.03677
G1 X170.633 Y142.374 E.03677
G1 X169.553 Y142.125 E.03677
G1 X168.563 Y141.624 E.03677
G1 X167.768 Y140.942 E.03475
G1 X167.63 Y140.797 E.00665
G1 X167.079 Y139.999 E.03216
G1 X166.67 Y138.969 E.03677
G1 X166.52 Y137.871 E.03677
G1 X166.637 Y136.768 E.03677
G1 X167.014 Y135.726 E.03677
G1 X167.63 Y134.804 E.03677
G1 X168.448 Y134.056 E.03677
G1 X169.422 Y133.526 E.03677
G1 X170.494 Y133.245 E.03677
G1 X171.603 Y133.228 E.03677
G1 X172.683 Y133.477 E.03677
G1 X173.672 Y133.977 E.03677
G1 X174.513 Y134.699 E.03677
G1 X175.157 Y135.602 E.03677
G1 X175.164 Y135.621 E.0007
G1 X174.835 Y135.827 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F6342
G1 X175.199 Y136.771 E.0311
G1 X175.328 Y137.801 E.03188
G1 X175.21 Y138.786 E.03049
G1 X174.855 Y139.736 E.03118
G1 X174.283 Y140.575 E.03118
G1 X173.527 Y141.251 E.03118
G1 X172.632 Y141.728 E.03118
G1 X171.648 Y141.976 E.03118
G1 X170.633 Y141.981 E.03118
G1 X169.647 Y141.744 E.03118
G1 X168.746 Y141.277 E.03118
G1 X168.028 Y140.649 E.02931
G1 X167.402 Y139.777 E.033
G1 X167.037 Y138.83 E.03118
G1 X166.909 Y137.823 E.03118
G1 X167.026 Y136.815 E.03118
G1 X167.381 Y135.865 E.03118
G1 X167.952 Y135.027 E.03118
G1 X168.708 Y134.35 E.03118
G1 X169.604 Y133.873 E.03118
G1 X170.588 Y133.625 E.03118
G1 X171.603 Y133.62 E.03118
G1 X172.589 Y133.857 E.03118
G1 X173.49 Y134.324 E.03118
G1 X174.253 Y134.993 E.03118
G1 X174.801 Y135.777 E.02941
M204 S10000
; WIPE_START
G1 F24000
G1 X175.199 Y136.771 E-.40679
G1 X175.315 Y137.694 E-.35321
; WIPE_END
G1 E-.04 F1800
G1 X180.737 Y143.065 Z1.8 F30000
G1 X182.541 Y144.853 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6342
G1 X184.17 Y144.853 E.05401
G1 X175.923 Y136.615 E.38665
G3 X173.662 Y142.021 I-4.77 J1.18 E.20824
G1 X176.494 Y144.853 E.13285
G1 X179.418 Y144.853 E.097
G1 X184.17 Y140.101 E.22292
G1 X184.17 Y137.177 E.097
G1 X171.742 Y124.749 E.58302
G1 X168.818 Y124.749 E.097
G1 X164.066 Y129.501 E.22292
G1 X164.066 Y132.425 E.097
G1 X166.897 Y135.256 E.13282
G2 X167.633 Y141.285 I4.266 J2.539 E.2168
G1 X164.066 Y144.853 E.16735
G1 X164.066 Y140.101 E.15763
G1 X168.818 Y144.853 E.22292
G1 X171.742 Y144.853 E.097
G1 X184.17 Y132.425 E.58302
G1 X184.17 Y129.501 E.097
G1 X179.418 Y124.749 E.22292
G1 X176.494 Y124.749 E.097
G1 X164.066 Y137.177 E.58302
G1 X164.066 Y135.548 E.05401
G1 X182.541 Y124.749 F30000
G1 F6342
G1 X184.17 Y124.749 E.05401
G1 X174.599 Y134.319 E.44898
G2 X172.36 Y133.043 I-3.483 J3.506 E.08649
G1 X164.066 Y124.749 E.3891
G1 X165.694 Y124.749 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X164.066 Y124.749 E-.61876
G1 X164.329 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
M106 S242.25
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z1.8 I.264 J-1.188 P1  F30000
G1 X135.432 Y118.59 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F15476.11
G1 X135.479 Y118.602 E.00159
G1 X136.898 Y118.602 E.04708
G1 X136.898 Y120.021 E.04708
G1 X136.898 Y134.398 E.47689
G1 X135.479 Y134.398 E.04708
G2 X134.972 Y134.695 I.041 J.651 E.02019
G1 X134.898 Y134.979 E.00974
G1 X134.898 Y136.398 E.04708
G1 X119.102 Y136.398 E.52398
G1 X119.102 Y116.602 E.65666
G1 X134.898 Y116.602 E.52398
G1 X134.898 Y118.021 E.04708
G2 X135.195 Y118.528 I.651 J-.041 E.02019
G1 X135.374 Y118.575 E.00616
G1 X135.332 Y118.139 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F12000
G1 X135.392 Y118.168 E.00205
G1 X135.479 Y118.21 E.00296
G1 X137.29 Y118.21 E.05566
G1 X137.29 Y120.021 E.05566
G1 X137.29 Y134.79 E.4538
G1 X135.479 Y134.79 E.05566
G1 X135.361 Y134.832 E.00383
G1 X135.332 Y134.892 E.00205
G1 X135.29 Y134.979 E.00296
G1 X135.29 Y136.79 E.05566
G1 X118.71 Y136.79 E.50946
G1 X118.71 Y116.21 E.63237
G1 X135.29 Y116.21 E.50946
G1 X135.29 Y118.021 E.05566
G1 X135.312 Y118.082 E.00199
M204 S10000
; WIPE_START
G1 F24000
G1 X135.392 Y118.168 E-.04458
G1 X135.479 Y118.21 E-.03656
G1 X137.265 Y118.21 E-.67887
; WIPE_END
G1 E-.04 F1800
G1 X134.733 Y116.971 Z2 F30000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.403741
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X119.47 Y116.971 E.79617
G1 X119.47 Y117.425 E.02367
G1 X134.53 Y117.425 E.78561
G1 X134.53 Y117.879 E.02367
G1 X119.47 Y117.879 E.78561
G1 X119.47 Y118.333 E.02367
G1 X134.585 Y118.333 E.78847
G2 X134.921 Y118.786 I.84 J-.27 E.02998
G1 X119.47 Y118.786 E.80599
G1 X119.47 Y119.24 E.02367
G1 X136.53 Y119.24 E.88993
G1 X136.53 Y119.694 E.02367
G1 X119.47 Y119.694 E.88993
G1 X119.47 Y120.148 E.02367
G1 X136.53 Y120.148 E.88993
G1 X136.53 Y120.601 E.02367
G1 X119.47 Y120.601 E.88993
G1 X119.47 Y121.055 E.02367
G1 X136.53 Y121.055 E.88993
G1 X136.53 Y121.509 E.02367
G1 X134.21 Y121.509 E.12102
G1 X134.21 Y121.963 E.02367
G1 X136.53 Y121.963 E.12102
G1 X136.53 Y122.416 E.02367
G1 X134.21 Y122.416 E.12102
G1 X134.21 Y122.87 E.02367
G1 X136.53 Y122.87 E.12102
G1 X136.53 Y123.324 E.02367
G1 X134.21 Y123.324 E.12102
G1 X134.21 Y123.778 E.02367
G1 X136.53 Y123.778 E.12102
G1 X136.53 Y124.231 E.02367
G1 X134.21 Y124.231 E.12102
G1 X134.21 Y124.685 E.02367
G1 X136.53 Y124.685 E.12102
G1 X136.53 Y125.139 E.02367
G1 X134.21 Y125.139 E.12102
G1 X134.21 Y125.593 E.02367
G1 X136.53 Y125.593 E.12102
G1 X136.53 Y126.046 E.02367
G1 X119.47 Y126.046 E.88993
G1 X119.47 Y126.5 E.02367
G1 X136.53 Y126.5 E.88993
G1 X136.53 Y126.954 E.02367
G1 X119.47 Y126.954 E.88993
G1 X119.47 Y127.408 E.02367
G1 X136.53 Y127.408 E.88993
G1 X136.53 Y127.861 E.02367
G1 X119.47 Y127.861 E.88993
G1 X119.47 Y128.315 E.02367
G1 X136.53 Y128.315 E.88993
G1 X136.53 Y128.769 E.02367
G1 X119.47 Y128.769 E.88993
G1 X119.47 Y129.222 E.02367
G1 X136.53 Y129.222 E.88993
G1 X136.53 Y129.676 E.02367
G1 X119.47 Y129.676 E.88993
G1 X119.47 Y130.13 E.02367
G1 X136.53 Y130.13 E.88993
G1 X136.53 Y130.584 E.02367
G1 X119.47 Y130.584 E.88993
G1 X119.47 Y131.037 E.02367
G1 X136.53 Y131.037 E.88993
G1 X136.53 Y131.491 E.02367
G1 X119.47 Y131.491 E.88993
G1 X119.47 Y131.945 E.02367
G1 X136.53 Y131.945 E.88993
G1 X136.53 Y132.399 E.02367
G1 X119.47 Y132.399 E.88993
G1 X119.47 Y132.852 E.02367
G1 X136.53 Y132.852 E.88993
G1 X136.53 Y133.306 E.02367
G1 X119.47 Y133.306 E.88993
G1 X119.47 Y133.76 E.02367
G1 X136.53 Y133.76 E.88993
G1 X136.53 Y134.03 E.01411
G1 X135.466 Y134.03 E.05551
G2 X134.93 Y134.214 I.023 J.943 E.03001
G1 X119.47 Y134.214 E.80647
G1 X119.47 Y134.667 E.02367
G1 X134.585 Y134.667 E.78847
G1 X134.57 Y134.703 E.00202
G2 X134.53 Y135.121 I1.372 J.341 E.02199
G1 X119.47 Y135.121 E.78561
G1 X119.47 Y135.575 E.02367
G1 X134.53 Y135.575 E.78561
G1 X134.53 Y136.029 E.02367
G1 X119.267 Y136.029 E.79617
M106 S242.25
G1 X119.448 Y123.496 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X119.448 Y125.124 E.05401
M73 P29 R19
G1 X119.606 Y125.282 E.0074
G1 X121.042 Y125.282 E.04765
G1 X124.606 Y121.718 E.16717
G1 X123.718 Y121.718 E.02944
G1 X127.282 Y125.282 E.16717
G1 X128.718 Y125.282 E.04765
G1 X132.282 Y121.718 E.16717
G1 X131.394 Y121.718 E.02944
G1 X133.782 Y124.106 E.112
G1 X133.782 Y125.282 E.03901
G1 X133.329 Y125.282 E.01501
; WIPE_START
G1 F24000
G1 X133.782 Y125.282 E-.17189
G1 X133.782 Y124.106 E-.44687
G1 X133.519 Y123.843 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X140.559 Y126.791 Z2 F30000
G1 X184.516 Y145.199 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F15476.11
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y130.35 E.19727
G1 X184.516 Y145.139 E.49057
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F12000
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y130.35 E.19478
G1 X184.908 Y145.531 E.46647
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.202 Y139.527 Z2 F30000
G1 X175.186 Y135.677 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F15476.11
G1 X175.565 Y136.632 E.03409
G1 X175.72 Y137.801 E.03909
G1 X175.599 Y138.833 E.03448
G1 X175.222 Y139.875 E.03677
G1 X174.606 Y140.797 E.03677
G1 X173.787 Y141.545 E.03677
G1 X172.814 Y142.075 E.03677
G1 X171.742 Y142.357 E.03677
G1 X170.633 Y142.374 E.03677
G1 X169.553 Y142.125 E.03677
G1 X168.563 Y141.624 E.03677
G1 X167.768 Y140.942 E.03475
G1 X167.63 Y140.797 E.00665
G1 X167.079 Y139.999 E.03216
G1 X166.67 Y138.969 E.03677
G1 X166.52 Y137.871 E.03677
G1 X166.637 Y136.768 E.03677
G1 X167.014 Y135.726 E.03677
G1 X167.63 Y134.804 E.03677
G1 X168.448 Y134.056 E.03677
G1 X169.422 Y133.526 E.03677
G1 X170.494 Y133.245 E.03677
G1 X171.603 Y133.228 E.03677
G1 X172.683 Y133.477 E.03677
G1 X173.672 Y133.977 E.03677
G1 X174.513 Y134.699 E.03677
G1 X175.157 Y135.602 E.03677
G1 X175.164 Y135.621 E.0007
G1 X174.835 Y135.826 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F12000
G1 X175.199 Y136.771 E.03112
G1 X175.328 Y137.801 E.03188
G1 X175.21 Y138.786 E.03049
G1 X174.855 Y139.736 E.03118
G1 X174.283 Y140.575 E.03118
G1 X173.527 Y141.251 E.03118
G1 X172.632 Y141.728 E.03118
G1 X171.648 Y141.976 E.03118
G1 X170.633 Y141.981 E.03118
G1 X169.647 Y141.744 E.03118
G1 X168.746 Y141.277 E.03118
G1 X168.028 Y140.649 E.02931
G1 X167.402 Y139.777 E.033
G1 X167.037 Y138.83 E.03118
G1 X166.909 Y137.823 E.03118
G1 X167.026 Y136.815 E.03118
G1 X167.381 Y135.865 E.03118
G1 X167.952 Y135.027 E.03118
G1 X168.708 Y134.35 E.03118
G1 X169.604 Y133.873 E.03118
G1 X170.588 Y133.625 E.03118
G1 X171.603 Y133.62 E.03118
G1 X172.589 Y133.857 E.03118
G1 X173.49 Y134.324 E.03118
G1 X174.253 Y134.993 E.03118
G1 X174.801 Y135.777 E.02939
M204 S10000
; WIPE_START
G1 F24000
G1 X175.199 Y136.771 E-.40706
G1 X175.314 Y137.693 E-.35294
; WIPE_END
G1 E-.04 F1800
G1 X167.817 Y136.263 Z2 F30000
G1 X164.066 Y135.548 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X164.066 Y137.177 E.05401
G1 X176.494 Y124.749 E.58302
G1 X179.418 Y124.749 E.097
G1 X184.17 Y129.501 E.22292
G1 X184.17 Y132.425 E.097
G1 X171.742 Y144.853 E.58302
G1 X168.818 Y144.853 E.097
G1 X164.066 Y140.101 E.22292
G1 X164.066 Y144.853 E.15763
G1 X167.633 Y141.285 E.16735
G3 X166.897 Y135.256 I3.53 J-3.49 E.2168
G1 X164.066 Y132.425 E.13282
G1 X164.066 Y129.501 E.097
G1 X168.818 Y124.749 E.22292
G1 X171.742 Y124.749 E.097
G1 X184.17 Y137.177 E.58302
G1 X184.17 Y140.101 E.097
G1 X179.418 Y144.853 E.22292
G1 X176.494 Y144.853 E.097
G1 X173.662 Y142.021 E.13285
G2 X175.917 Y136.6 I-2.684 J-4.296 E.20773
G1 X184.17 Y144.853 E.38714
G1 X182.541 Y144.853 E.05401
G1 X165.694 Y124.749 F30000
G1 F15476.087
G1 X164.066 Y124.749 E.05401
G1 X172.36 Y133.043 E.3891
G3 X174.599 Y134.319 I-1.244 J4.783 E.08649
G1 X184.17 Y124.749 E.44898
G1 X182.541 Y124.749 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X184.17 Y124.749 E-.61876
G1 X183.907 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
M106 S252.45
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z2 I.16 J-1.206 P1  F30000
G1 X135.432 Y118.59 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F10438
G1 X135.479 Y118.602 E.00159
G1 X136.898 Y118.602 E.04708
G1 X136.898 Y120.021 E.04708
G1 X136.898 Y134.398 E.47689
G1 X135.479 Y134.398 E.04708
G2 X134.972 Y134.695 I.041 J.651 E.02019
G1 X134.898 Y134.979 E.00974
G1 X134.898 Y136.398 E.04708
G1 X119.102 Y136.398 E.52398
G1 X119.102 Y116.602 E.65666
G1 X134.898 Y116.602 E.52398
G1 X134.898 Y118.021 E.04708
G2 X135.195 Y118.528 I.651 J-.041 E.02019
G1 X135.374 Y118.575 E.00616
G1 X135.332 Y118.139 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F10438
G1 X135.392 Y118.168 E.00205
G1 X135.479 Y118.21 E.00296
G1 X137.29 Y118.21 E.05566
G1 X137.29 Y120.021 E.05566
G1 X137.29 Y134.79 E.4538
G1 X135.479 Y134.79 E.05566
G1 X135.361 Y134.832 E.00383
G1 X135.332 Y134.892 E.00205
G1 X135.29 Y134.979 E.00296
G1 X135.29 Y136.79 E.05566
G1 X118.71 Y136.79 E.50946
G1 X118.71 Y116.21 E.63237
G1 X135.29 Y116.21 E.50946
G1 X135.29 Y118.021 E.05566
G1 X135.312 Y118.082 E.00199
M204 S10000
; WIPE_START
G1 F24000
G1 X135.392 Y118.168 E-.04458
G1 X135.479 Y118.21 E-.03656
G1 X137.265 Y118.21 E-.67887
; WIPE_END
G1 E-.04 F1800
G1 X133.966 Y116.763 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423906
G1 F10438
G1 X134.567 Y117.364 E.02638
G1 X134.567 Y117.903 E.01673
G1 X133.597 Y116.933 E.04259
G1 X133.058 Y116.933 E.01673
G1 X136.567 Y120.442 E.15405
G1 X136.567 Y119.903 E.01673
G1 X135.597 Y118.933 E.04259
G1 X136.136 Y118.933 E.01673
G1 X136.737 Y119.534 E.02638
G1 X136.737 Y121.15 F30000
G1 F10438
G1 X132.519 Y116.933 E.18516
G1 X131.981 Y116.933 E.01673
G1 X136.567 Y121.519 E.20136
G1 X136.567 Y122.058 E.01673
G1 X131.442 Y116.933 E.22502
G1 X130.903 Y116.933 E.01673
G1 X136.567 Y122.597 E.24868
G1 X136.567 Y123.136 E.01673
G1 X130.364 Y116.933 E.27233
G1 X129.825 Y116.933 E.01673
G1 X136.567 Y123.675 E.29599
G1 X136.567 Y124.213 E.01673
G1 X134.174 Y121.82 E.10507
G1 X134.174 Y122.359 E.01673
G1 X136.567 Y124.752 E.10507
G1 X136.567 Y125.291 E.01673
G1 X134.174 Y122.898 E.10507
G1 X134.174 Y123.437 E.01673
G1 X136.567 Y125.83 E.10507
G1 X136.567 Y126.369 E.01673
G1 X134.174 Y123.976 E.10507
G1 X134.174 Y124.514 E.01673
G1 X136.567 Y126.907 E.10507
G1 X136.567 Y127.446 E.01673
G1 X134.174 Y125.053 E.10507
G1 X134.174 Y125.592 E.01673
G1 X136.567 Y127.985 E.10507
G1 X136.567 Y128.524 E.01673
G1 X133.717 Y125.674 E.12513
G1 X133.178 Y125.674 E.01673
G1 X136.567 Y129.063 E.14878
G1 X136.567 Y129.601 E.01673
G1 X132.639 Y125.674 E.17244
G1 X132.101 Y125.674 E.01673
G1 X136.567 Y130.14 E.1961
G1 X136.567 Y130.679 E.01673
G1 X131.562 Y125.674 E.21975
G1 X131.023 Y125.674 E.01673
G1 X136.567 Y131.218 E.24341
G1 X136.567 Y131.757 E.01673
G1 X130.484 Y125.674 E.26706
G1 X129.945 Y125.674 E.01673
G1 X136.567 Y132.295 E.29072
G1 X136.567 Y132.834 E.01673
G1 X129.407 Y125.674 E.31437
G1 X128.868 Y125.674 E.01673
G1 X136.567 Y133.373 E.33803
G1 X136.567 Y133.912 E.01673
G1 X128.329 Y125.674 E.36169
G1 X127.79 Y125.674 E.01673
G1 X136.183 Y134.067 E.3685
G1 X135.644 Y134.067 E.01673
G1 X127.251 Y125.674 E.3685
G1 X126.713 Y125.674 E.01673
G1 X135.165 Y134.126 E.37109
G2 X134.833 Y134.333 I.614 J1.354 E.01218
G1 X126.174 Y125.674 E.38018
G1 X125.635 Y125.674 E.01673
G1 X134.626 Y134.665 E.39475
G1 X134.605 Y134.713 E.00163
G2 X134.567 Y135.145 I1.417 J.344 E.0135
G1 X125.096 Y125.674 E.41581
G1 X124.557 Y125.674 E.01673
G1 X134.567 Y135.683 E.43947
G1 X134.567 Y136.067 E.01191
G1 X134.412 Y136.067 E.00482
G1 X124.019 Y125.674 E.45631
G1 X123.48 Y125.674 E.01673
G1 X133.873 Y136.067 E.45631
G1 X133.334 Y136.067 E.01673
G1 X122.941 Y125.674 E.45631
G1 X122.402 Y125.674 E.01673
G1 X132.795 Y136.067 E.45631
G1 X132.257 Y136.067 E.01673
G1 X121.863 Y125.674 E.45631
G1 X121.325 Y125.674 E.01673
G1 X131.718 Y136.067 E.45631
G1 X131.179 Y136.067 E.01673
G1 X120.786 Y125.674 E.45631
G1 X120.247 Y125.674 E.01673
G1 X130.64 Y136.067 E.45631
G1 X130.101 Y136.067 E.01673
G1 X119.708 Y125.674 E.45631
G1 X119.433 Y125.674 E.00854
G1 X119.433 Y125.937 E.00818
G1 X129.563 Y136.067 E.44473
G1 X129.024 Y136.067 E.01673
G1 X119.433 Y126.476 E.42108
G1 X119.433 Y127.015 E.01673
G1 X128.485 Y136.067 E.39742
G1 X127.946 Y136.067 E.01673
G1 X119.433 Y127.554 E.37377
G1 X119.433 Y128.093 E.01673
G1 X127.407 Y136.067 E.35011
G1 X126.869 Y136.067 E.01673
G1 X119.433 Y128.631 E.32645
G1 X119.433 Y129.17 E.01673
G1 X126.33 Y136.067 E.3028
G1 X125.791 Y136.067 E.01673
G1 X119.433 Y129.709 E.27914
G1 X119.433 Y130.248 E.01673
G1 X125.252 Y136.067 E.25549
G1 X124.713 Y136.067 E.01673
G1 X119.433 Y130.787 E.23183
G1 X119.433 Y131.325 E.01673
G1 X124.175 Y136.067 E.20817
G1 X123.636 Y136.067 E.01673
G1 X119.433 Y131.864 E.18452
G1 X119.433 Y132.403 E.01673
G1 X123.097 Y136.067 E.16086
G1 X122.558 Y136.067 E.01673
G1 X119.433 Y132.942 E.13721
M73 P30 R19
G1 X119.433 Y133.481 E.01673
G1 X122.019 Y136.067 E.11355
G1 X121.481 Y136.067 E.01673
G1 X119.433 Y134.019 E.0899
G1 X119.433 Y134.558 E.01673
G1 X120.942 Y136.067 E.06624
G1 X120.403 Y136.067 E.01673
G1 X119.433 Y135.097 E.04258
G1 X119.433 Y135.636 E.01673
G1 X120.034 Y136.237 E.02638
G1 X133.329 Y125.282 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10438
G1 X133.782 Y125.282 E.01501
G1 X133.782 Y124.106 E.03901
G1 X131.394 Y121.718 E.112
G1 X132.282 Y121.718 E.02944
G1 X128.718 Y125.282 E.16717
G1 X127.282 Y125.282 E.04765
G1 X123.718 Y121.718 E.16717
G1 X124.606 Y121.718 E.02944
G1 X121.042 Y125.282 E.16717
G1 X119.606 Y125.282 E.04765
G1 X119.448 Y125.124 E.0074
G1 X119.448 Y123.496 E.05401
G1 X119.263 Y120.919 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423906
G1 F10438
G1 X119.671 Y121.326 E.01789
G1 X120.21 Y121.326 E.01673
G1 X119.433 Y120.55 E.0341
G1 X119.433 Y120.011 E.01673
G1 X120.749 Y121.326 E.05775
G1 X121.287 Y121.326 E.01673
G1 X119.433 Y119.472 E.08141
G1 X119.433 Y118.933 E.01673
G1 X121.826 Y121.326 E.10507
G1 X122.365 Y121.326 E.01673
G1 X119.433 Y118.394 E.12872
G1 X119.433 Y117.856 E.01673
G1 X122.904 Y121.326 E.15238
G1 X123.443 Y121.326 E.01673
G1 X119.433 Y117.317 E.17603
G1 X119.433 Y116.933 E.01191
G1 X119.588 Y116.933 E.00482
G1 X123.981 Y121.326 E.19288
G1 X124.52 Y121.326 E.01673
G1 X120.127 Y116.933 E.19288
G1 X120.666 Y116.933 E.01673
G1 X125.059 Y121.326 E.19288
G1 X125.598 Y121.326 E.01673
G1 X121.205 Y116.933 E.19288
G1 X121.743 Y116.933 E.01673
G1 X126.136 Y121.326 E.19288
G1 X126.675 Y121.326 E.01673
G1 X122.282 Y116.933 E.19288
G1 X122.821 Y116.933 E.01673
G1 X127.214 Y121.326 E.19288
G1 X127.753 Y121.326 E.01673
G1 X123.36 Y116.933 E.19288
G1 X123.899 Y116.933 E.01673
G1 X128.292 Y121.326 E.19288
G1 X128.83 Y121.326 E.01673
G1 X124.437 Y116.933 E.19288
G1 X124.976 Y116.933 E.01673
G1 X129.369 Y121.326 E.19288
G1 X129.908 Y121.326 E.01673
G1 X125.515 Y116.933 E.19288
G1 X126.054 Y116.933 E.01673
G1 X130.447 Y121.326 E.19288
G1 X130.986 Y121.326 E.01673
G1 X126.593 Y116.933 E.19288
G1 X127.131 Y116.933 E.01673
G1 X131.524 Y121.326 E.19288
G1 X132.063 Y121.326 E.01673
G1 X127.67 Y116.933 E.19288
G1 X128.209 Y116.933 E.01673
G1 X132.602 Y121.326 E.19288
G1 X133.141 Y121.326 E.01673
G1 X128.748 Y116.933 E.19288
G1 X129.287 Y116.933 E.01673
G1 X133.849 Y121.496 E.20033
; WIPE_START
G1 F24000
G1 X132.435 Y120.082 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X139.605 Y122.697 Z2.2 F30000
G1 X175.186 Y135.677 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F10438
G1 X175.565 Y136.632 E.03409
G1 X175.716 Y137.731 E.03677
G1 X175.599 Y138.833 E.03677
G1 X175.222 Y139.875 E.03677
G1 X174.606 Y140.797 E.03677
G1 X173.787 Y141.545 E.03677
G1 X172.814 Y142.075 E.03677
G1 X171.742 Y142.357 E.03677
G1 X170.633 Y142.374 E.03677
G1 X169.553 Y142.125 E.03677
G1 X168.563 Y141.624 E.03677
G1 X167.768 Y140.942 E.03475
G1 X167.63 Y140.797 E.00665
G1 X167.079 Y139.999 E.03216
G1 X166.67 Y138.969 E.03677
G1 X166.52 Y137.871 E.03677
M73 P30 R18
G1 X166.637 Y136.768 E.03677
G1 X167.014 Y135.726 E.03677
G1 X167.63 Y134.804 E.03677
G1 X168.448 Y134.056 E.03677
G1 X169.422 Y133.526 E.03677
G1 X170.494 Y133.245 E.03677
G1 X171.603 Y133.228 E.03677
G1 X172.683 Y133.477 E.03677
G1 X173.672 Y133.977 E.03677
G1 X174.513 Y134.699 E.03677
G1 X175.157 Y135.602 E.03677
G1 X175.164 Y135.621 E.00069
G1 X174.834 Y135.826 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F10438
G1 X175.199 Y136.771 E.03114
G1 X175.327 Y137.778 E.03118
G1 X175.21 Y138.786 E.03118
G1 X174.855 Y139.736 E.03118
G1 X174.283 Y140.575 E.03118
G1 X173.527 Y141.251 E.03118
G1 X172.632 Y141.728 E.03118
G1 X171.648 Y141.976 E.03118
G1 X170.633 Y141.981 E.03118
G1 X169.647 Y141.744 E.03118
G1 X168.746 Y141.277 E.03118
G1 X168.028 Y140.649 E.02931
G1 X167.402 Y139.777 E.033
G1 X167.037 Y138.83 E.03118
G1 X166.909 Y137.823 E.03118
G1 X167.026 Y136.815 E.03118
G1 X167.381 Y135.865 E.03118
G1 X167.952 Y135.027 E.03118
G1 X168.708 Y134.35 E.03118
G1 X169.604 Y133.873 E.03118
G1 X170.588 Y133.625 E.03118
G1 X171.603 Y133.62 E.03118
G1 X172.589 Y133.857 E.03118
G1 X173.49 Y134.324 E.03118
G1 X174.253 Y134.993 E.03118
G1 X174.8 Y135.776 E.02937
M204 S10000
; WIPE_START
G1 F24000
G1 X175.199 Y136.771 E-.40732
G1 X175.316 Y137.692 E-.35268
; WIPE_END
G1 E-.04 F1800
G1 X181.229 Y142.517 Z2.2 F30000
G1 X184.516 Y145.199 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F10438
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y130.35 E.19727
G1 X184.516 Y145.139 E.49057
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F10438
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y130.35 E.19478
G1 X184.908 Y145.531 E.46647
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X182.541 Y144.853 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10438
G1 X184.17 Y144.853 E.05401
G1 X175.923 Y136.615 E.38665
G3 X173.662 Y142.021 I-4.77 J1.18 E.20824
G1 X176.494 Y144.853 E.13285
G1 X179.418 Y144.853 E.097
G1 X184.17 Y140.101 E.22292
G1 X184.17 Y137.177 E.097
G1 X171.742 Y124.749 E.58302
G1 X168.818 Y124.749 E.097
G1 X164.066 Y129.501 E.22292
G1 X164.066 Y132.425 E.097
G1 X166.897 Y135.256 E.13282
G2 X167.633 Y141.285 I4.266 J2.539 E.2168
G1 X164.066 Y144.853 E.16735
G1 X164.066 Y140.101 E.15763
G1 X168.818 Y144.853 E.22292
G1 X171.742 Y144.853 E.097
G1 X184.17 Y132.425 E.58302
G1 X184.17 Y129.501 E.097
G1 X179.418 Y124.749 E.22292
G1 X176.494 Y124.749 E.097
G1 X164.066 Y137.177 E.58302
G1 X164.066 Y135.548 E.05401
G1 X182.541 Y124.749 F30000
G1 F10438
G1 X184.17 Y124.749 E.05401
G1 X174.599 Y134.319 E.44898
G2 X172.36 Y133.043 I-3.483 J3.506 E.08649
G1 X164.066 Y124.749 E.3891
G1 X165.694 Y124.749 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X164.066 Y124.749 E-.61876
G1 X164.329 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z2.2 I.264 J-1.188 P1  F30000
G1 X135.432 Y118.59 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F11243
G1 X135.479 Y118.602 E.00159
G1 X136.898 Y118.602 E.04708
G1 X136.898 Y120.021 E.04708
G1 X136.898 Y134.398 E.47689
G1 X135.479 Y134.398 E.04708
G2 X134.972 Y134.695 I.041 J.651 E.02019
G1 X134.898 Y134.979 E.00974
G1 X134.898 Y136.398 E.04708
G1 X119.102 Y136.398 E.52398
G1 X119.102 Y116.602 E.65666
G1 X134.898 Y116.602 E.52398
G1 X134.898 Y118.021 E.04708
G2 X135.195 Y118.528 I.651 J-.041 E.02019
G1 X135.374 Y118.575 E.00616
G1 X135.332 Y118.139 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F11243
G1 X135.392 Y118.168 E.00205
G1 X135.479 Y118.21 E.00296
G1 X137.29 Y118.21 E.05566
G1 X137.29 Y120.021 E.05566
G1 X137.29 Y134.79 E.4538
G1 X135.479 Y134.79 E.05566
G1 X135.361 Y134.832 E.00383
G1 X135.332 Y134.892 E.00205
G1 X135.29 Y134.979 E.00296
G1 X135.29 Y136.79 E.05566
G1 X118.71 Y136.79 E.50946
G1 X118.71 Y116.21 E.63237
G1 X135.29 Y116.21 E.50946
G1 X135.29 Y118.021 E.05566
G1 X135.312 Y118.082 E.00199
M204 S10000
; WIPE_START
G1 F24000
G1 X135.392 Y118.168 E-.04458
G1 X135.479 Y118.21 E-.03656
G1 X137.265 Y118.21 E-.67887
; WIPE_END
G1 E-.04 F1800
G1 X129.948 Y120.381 Z2.4 F30000
G1 X119.448 Y123.496 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11243
G1 X119.448 Y125.124 E.05401
G1 X120.121 Y125.796 E.03154
G1 X120.528 Y125.796 E.0135
G1 X125.121 Y121.204 E.21546
G1 X123.204 Y121.204 E.06359
G1 X127.796 Y125.796 E.21546
G1 X128.204 Y125.796 E.0135
G1 X132.796 Y121.204 E.21546
G1 X130.879 Y121.204 E.06359
G1 X134.296 Y124.621 E.1603
G1 X134.296 Y125.796 E.03901
G1 X133.844 Y125.796 E.01501
; WIPE_START
G1 F24000
G1 X134.296 Y125.796 E-.17189
G1 X134.296 Y124.621 E-.44687
G1 X134.034 Y124.358 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X134.469 Y131.978 Z2.4 F30000
G1 X134.676 Y135.589 Z2.4
G1 Z2
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F11243
G1 X134.089 Y136.176 E.02548
G1 X133.556 Y136.176
G1 X134.676 Y135.056 E.04865
M204 S10000
; WIPE_START
G1 F24000
G1 X133.556 Y136.176 E-.60171
G1 X133.972 Y136.176 E-.15829
; WIPE_END
G1 E-.04 F1800
G1 X136.089 Y134.176 Z2.4 F30000
G1 Z2
G1 E.8 F1800
M204 S2000
G1 F11243
G1 X136.676 Y133.589 E.02548
G1 X136.676 Y133.056
G1 X135.556 Y134.176 E.04865
M204 S10000
; WIPE_START
G1 F24000
G1 X136.676 Y133.056 E-.60171
G1 X136.676 Y133.472 E-.15829
; WIPE_END
G1 E-.04 F1800
G1 X136.676 Y132.523 Z2.4 F30000
G1 Z2
G1 E.8 F1800
M204 S2000
G1 F11243
G1 X133.023 Y136.176 E.15874
G1 X132.489 Y136.176
G1 X136.676 Y131.989 E.18191
G1 X136.676 Y131.456
G1 X131.956 Y136.176 E.20508
G1 X131.423 Y136.176
G1 X136.676 Y130.923 E.22826
G1 X136.676 Y130.39
G1 X130.89 Y136.176 E.25143
G1 X130.356 Y136.176
G1 X136.676 Y129.856 E.2746
G1 X136.676 Y129.323
G1 X129.823 Y136.176 E.29778
G1 X129.29 Y136.176
G1 X136.676 Y128.79 E.32095
G1 X136.676 Y128.256
G1 X128.756 Y136.176 E.34412
G1 X128.223 Y136.176
G1 X136.676 Y127.723 E.3673
G1 X136.676 Y127.19
G1 X127.69 Y136.176 E.39047
G1 X127.157 Y136.176
G1 X136.676 Y126.657 E.41364
G1 X136.676 Y126.123
G1 X126.623 Y136.176 E.43682
G1 X126.09 Y136.176
G1 X136.676 Y125.59 E.45999
G1 X136.676 Y125.057
G1 X125.557 Y136.176 E.48316
G1 X125.024 Y136.176
G1 X136.676 Y124.524 E.50634
G1 X136.676 Y123.99
G1 X124.49 Y136.176 E.52951
G1 X123.957 Y136.176
G1 X134.114 Y126.019 E.44136
G1 X133.58 Y126.019
G1 X123.424 Y136.176 E.44136
G1 X122.89 Y136.176
G1 X133.047 Y126.019 E.44136
G1 X132.514 Y126.019
G1 X122.357 Y136.176 E.44136
G1 X121.824 Y136.176
G1 X131.981 Y126.019 E.44136
G1 X131.447 Y126.019
G1 X121.291 Y136.176 E.44136
G1 X120.757 Y136.176
G1 X130.914 Y126.019 E.44136
G1 X130.381 Y126.019
G1 X120.224 Y136.176 E.44136
G1 X119.691 Y136.176
G1 X129.848 Y126.019 E.44136
G1 X129.314 Y126.019
G1 X119.324 Y136.009 E.4341
G1 X119.324 Y135.475
G1 X128.781 Y126.019 E.41093
G1 X128.248 Y126.019
G1 X119.324 Y134.942 E.38776
G1 X119.324 Y134.409
G1 X127.714 Y126.019 E.36458
G1 X127.181 Y126.019
G1 X119.324 Y133.876 E.34141
G1 X119.324 Y133.342
G1 X126.648 Y126.019 E.31824
G1 X126.115 Y126.019
G1 X119.324 Y132.809 E.29506
G1 X119.324 Y132.276
G1 X125.581 Y126.019 E.27189
G1 X125.048 Y126.019
G1 X119.324 Y131.742 E.24872
G1 X119.324 Y131.209
G1 X124.515 Y126.019 E.22555
G1 X123.982 Y126.019
G1 X119.324 Y130.676 E.20237
G1 X119.324 Y130.143
G1 X123.448 Y126.019 E.1792
G1 X122.915 Y126.019
G1 X119.324 Y129.609 E.15603
G1 X119.324 Y129.076
G1 X122.382 Y126.019 E.13285
G1 X121.848 Y126.019
G1 X119.324 Y128.543 E.10968
G1 X119.324 Y128.01
G1 X121.315 Y126.019 E.08651
G1 X120.782 Y126.019
G1 X119.324 Y127.476 E.06333
G1 X119.324 Y126.943
G1 X120.249 Y126.019 E.04016
G1 X119.715 Y126.019
G1 X119.324 Y126.41 E.01699
M204 S10000
G1 X134.519 Y125.614 F30000
M204 S2000
G1 F11243
G1 X136.676 Y123.457 E.09372
G1 X136.676 Y122.924
G1 X134.519 Y125.08 E.09372
G1 X134.519 Y124.547
G1 X136.676 Y122.39 E.09372
G1 X136.676 Y121.857
G1 X134.519 Y124.014 E.09372
G1 X134.519 Y123.481
G1 X136.676 Y121.324 E.09372
G1 X136.676 Y120.791
G1 X134.519 Y122.947 E.09372
G1 X134.519 Y122.414
G1 X136.676 Y120.257 E.09372
G1 X136.676 Y119.724
G1 X134.519 Y121.881 E.09372
G1 X134.519 Y121.348
G1 X136.676 Y119.191 E.09372
G1 X136.509 Y118.824
M73 P31 R18
G1 X134.352 Y120.981 E.09372
G1 X133.819 Y120.981
G1 X135.975 Y118.824 E.09372
G1 X135.447 Y118.82
G1 X133.285 Y120.981 E.09392
G1 X132.752 Y120.981
G1 X135.041 Y118.692 E.09947
G1 X134.781 Y118.419
G1 X132.219 Y120.981 E.11134
G1 X131.686 Y120.981
G1 X134.676 Y117.991 E.12993
G1 X134.676 Y117.458
G1 X131.152 Y120.981 E.1531
G1 X130.619 Y120.981
G1 X134.676 Y116.925 E.17627
G1 X134.242 Y116.824
G1 X130.086 Y120.981 E.18063
G1 X129.553 Y120.981
G1 X133.709 Y116.824 E.18063
G1 X133.176 Y116.824
G1 X129.019 Y120.981 E.18063
G1 X128.486 Y120.981
G1 X132.643 Y116.824 E.18063
G1 X132.109 Y116.824
G1 X127.953 Y120.981 E.18063
G1 X127.419 Y120.981
G1 X131.576 Y116.824 E.18063
G1 X131.043 Y116.824
G1 X126.886 Y120.981 E.18063
G1 X126.353 Y120.981
G1 X130.51 Y116.824 E.18063
G1 X129.976 Y116.824
G1 X125.82 Y120.981 E.18063
G1 X125.286 Y120.981
G1 X129.443 Y116.824 E.18063
G1 X128.91 Y116.824
G1 X124.753 Y120.981 E.18063
G1 X124.22 Y120.981
G1 X128.377 Y116.824 E.18063
G1 X127.843 Y116.824
G1 X123.687 Y120.981 E.18063
G1 X123.153 Y120.981
G1 X127.31 Y116.824 E.18063
G1 X126.777 Y116.824
G1 X122.62 Y120.981 E.18063
G1 X122.087 Y120.981
G1 X126.243 Y116.824 E.18063
G1 X125.71 Y116.824
G1 X121.553 Y120.981 E.18063
G1 X121.02 Y120.981
G1 X125.177 Y116.824 E.18063
G1 X124.644 Y116.824
G1 X120.487 Y120.981 E.18063
G1 X119.954 Y120.981
G1 X124.11 Y116.824 E.18063
G1 X123.577 Y116.824
G1 X119.42 Y120.981 E.18063
G1 X119.324 Y120.544
G1 X123.044 Y116.824 E.16162
G1 X122.511 Y116.824
G1 X119.324 Y120.011 E.13845
G1 X119.324 Y119.477
G1 X121.977 Y116.824 E.11528
G1 X121.444 Y116.824
G1 X119.324 Y118.944 E.0921
G1 X119.324 Y118.411
G1 X120.911 Y116.824 E.06893
G1 X120.377 Y116.824
G1 X119.324 Y117.877 E.04576
G1 X119.324 Y117.344
G1 X119.844 Y116.824 E.02258
M204 S10000
; WIPE_START
G1 F24000
G1 X119.324 Y117.344 E-.27929
G1 X119.324 Y117.877 E-.20264
G1 X119.842 Y117.36 E-.27806
; WIPE_END
G1 E-.04 F1800
G1 X119.776 Y124.992 Z2.4 F30000
G1 X119.679 Y136.164 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.10434
G1 F11243
G1 X119.306 Y136.164 E.00187
; WIPE_START
G1 F24000
G1 X119.679 Y136.164 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.282 Y135.498 Z2.4 F30000
G1 X134.609 Y134.856 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.128247
G1 F11243
G1 X134.688 Y135.068 E.00157
; WIPE_START
G1 F24000
G1 X134.609 Y134.856 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X135.568 Y134.188 Z2.4 F30000
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.122606
G1 F11243
G1 X135.356 Y134.109 E.00147
; WIPE_START
G1 F24000
G1 X135.568 Y134.188 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X143.014 Y135.863 Z2.4 F30000
G1 X184.516 Y145.199 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F11243
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y130.35 E.19727
G1 X184.516 Y145.139 E.49057
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F11243
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y130.35 E.19478
G1 X184.908 Y145.531 E.46647
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.202 Y139.527 Z2.4 F30000
G1 X175.186 Y135.677 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F11243
G1 X175.565 Y136.632 E.03409
G1 X175.72 Y137.801 E.03909
G1 X175.599 Y138.833 E.03448
G1 X175.222 Y139.875 E.03677
G1 X174.606 Y140.797 E.03677
G1 X173.787 Y141.545 E.03677
G1 X172.814 Y142.075 E.03677
G1 X171.742 Y142.357 E.03677
G1 X170.633 Y142.374 E.03677
G1 X169.553 Y142.125 E.03677
G1 X168.563 Y141.624 E.03677
G1 X167.768 Y140.942 E.03475
G1 X167.63 Y140.797 E.00665
G1 X167.079 Y139.999 E.03216
G1 X166.67 Y138.969 E.03677
G1 X166.52 Y137.871 E.03677
G1 X166.637 Y136.768 E.03677
G1 X167.014 Y135.726 E.03677
G1 X167.63 Y134.804 E.03677
G1 X168.448 Y134.056 E.03677
G1 X169.422 Y133.526 E.03677
G1 X170.494 Y133.245 E.03677
G1 X171.603 Y133.228 E.03677
G1 X172.683 Y133.477 E.03677
G1 X173.672 Y133.977 E.03677
G1 X174.513 Y134.699 E.03677
G1 X175.157 Y135.602 E.03677
G1 X175.164 Y135.621 E.00069
G1 X174.834 Y135.825 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F11243
G1 X175.199 Y136.771 E.03116
G1 X175.328 Y137.801 E.03188
G1 X175.21 Y138.786 E.03049
G1 X174.855 Y139.736 E.03118
G1 X174.283 Y140.575 E.03118
G1 X173.527 Y141.251 E.03118
G1 X172.632 Y141.728 E.03118
G1 X171.648 Y141.976 E.03118
G1 X170.633 Y141.981 E.03118
G1 X169.647 Y141.744 E.03118
G1 X168.746 Y141.277 E.03118
G1 X168.028 Y140.649 E.02931
G1 X167.402 Y139.777 E.033
G1 X167.037 Y138.83 E.03118
G1 X166.909 Y137.823 E.03118
G1 X167.026 Y136.815 E.03118
G1 X167.381 Y135.865 E.03118
G1 X167.952 Y135.027 E.03118
G1 X168.708 Y134.35 E.03118
G1 X169.604 Y133.873 E.03118
G1 X170.588 Y133.625 E.03118
G1 X171.603 Y133.62 E.03118
G1 X172.589 Y133.857 E.03118
G1 X173.49 Y134.324 E.03118
G1 X174.253 Y134.993 E.03118
G1 X174.8 Y135.776 E.02935
M204 S10000
; WIPE_START
G1 F24000
G1 X175.199 Y136.771 E-.40758
G1 X175.314 Y137.692 E-.35242
; WIPE_END
G1 E-.04 F1800
G1 X182.374 Y134.791 Z2.4 F30000
G1 X184.17 Y134.053 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11243
G1 X184.17 Y132.425 E.05401
G1 X171.742 Y144.853 E.58302
G1 X168.818 Y144.853 E.097
G1 X164.066 Y140.101 E.22292
G1 X164.066 Y137.177 E.097
G1 X176.494 Y124.749 E.58302
G1 X179.418 Y124.749 E.097
G1 X184.17 Y129.501 E.22292
G1 X184.17 Y124.749 E.15763
G1 X174.599 Y134.319 E.44898
G2 X172.36 Y133.043 I-3.483 J3.506 E.08649
G1 X164.066 Y124.749 E.3891
G1 X165.694 Y124.749 E.05401
G1 X165.694 Y144.853 F30000
G1 F11243
G1 X164.066 Y144.853 E.05401
G1 X167.633 Y141.285 E.16735
G3 X166.897 Y135.256 I3.53 J-3.49 E.2168
G1 X164.066 Y132.425 E.13282
G1 X164.066 Y129.501 E.097
G1 X168.818 Y124.749 E.22292
G1 X171.742 Y124.749 E.097
G1 X184.17 Y137.177 E.58302
G1 X184.17 Y140.101 E.097
G1 X179.418 Y144.853 E.22292
G1 X176.494 Y144.853 E.097
G1 X173.662 Y142.021 E.13285
G2 X175.917 Y136.6 I-2.684 J-4.296 E.20773
G1 X184.17 Y144.853 E.38714
G1 X182.541 Y144.853 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X184.17 Y144.853 E-.61876
G1 X183.907 Y144.59 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z2.4 I.57 J-1.075 P1  F30000
G1 X134.898 Y118.602 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4465
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4465
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.631 Y120.508 Z2.6 F30000
G1 X119.448 Y120.828 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4465
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X128.052 Y126.052 E.33325
G1 X127.948 Y126.052 E.00344
G1 X134.552 Y119.448 E.3098
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X120.272 Y126.052 E.33325
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.01 Y127.618 Z2.6 F30000
G1 X184.516 Y145.199 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4465
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y130.35 E.19727
G1 X184.516 Y145.139 E.49057
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4465
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y130.35 E.19478
G1 X184.908 Y145.531 E.46647
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.202 Y139.527 Z2.6 F30000
G1 X175.186 Y135.677 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4465
G1 X175.565 Y136.632 E.0341
G1 X175.72 Y137.801 E.03909
G1 X175.599 Y138.833 E.03448
G1 X175.222 Y139.875 E.03677
G1 X174.606 Y140.797 E.03677
G1 X173.787 Y141.545 E.03677
G1 X172.814 Y142.075 E.03677
G1 X171.742 Y142.357 E.03677
G1 X170.633 Y142.374 E.03677
G1 X169.553 Y142.125 E.03677
G1 X168.563 Y141.624 E.03677
G1 X167.768 Y140.942 E.03475
G1 X167.63 Y140.797 E.00665
G1 X167.079 Y139.999 E.03216
G1 X166.67 Y138.969 E.03677
G1 X166.52 Y137.871 E.03677
G1 X166.637 Y136.768 E.03677
G1 X167.014 Y135.726 E.03677
G1 X167.63 Y134.804 E.03677
G1 X168.448 Y134.056 E.03677
G1 X169.422 Y133.526 E.03677
G1 X170.494 Y133.245 E.03677
G1 X171.603 Y133.228 E.03677
G1 X172.683 Y133.477 E.03677
G1 X173.672 Y133.977 E.03677
G1 X174.513 Y134.699 E.03677
G1 X175.157 Y135.602 E.03677
G1 X175.164 Y135.621 E.00069
G1 X174.834 Y135.824 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4465
G1 X174.834 Y135.825 E.00002
G1 X175.199 Y136.771 E.03118
G1 X175.328 Y137.801 E.03188
G1 X175.21 Y138.786 E.03049
G1 X174.855 Y139.736 E.03118
G1 X174.283 Y140.575 E.03118
G1 X173.527 Y141.251 E.03118
G1 X172.632 Y141.728 E.03118
G1 X171.648 Y141.976 E.03118
G1 X170.633 Y141.981 E.03118
M73 P32 R18
G1 X169.647 Y141.744 E.03118
G1 X168.746 Y141.277 E.03118
G1 X168.028 Y140.649 E.02931
G1 X167.402 Y139.777 E.033
G1 X167.037 Y138.83 E.03118
G1 X166.909 Y137.823 E.03118
G1 X167.026 Y136.815 E.03118
G1 X167.381 Y135.865 E.03118
G1 X167.952 Y135.027 E.03118
G1 X168.708 Y134.35 E.03118
G1 X169.604 Y133.873 E.03118
G1 X170.588 Y133.625 E.03118
G1 X171.603 Y133.62 E.03118
G1 X172.589 Y133.857 E.03118
G1 X173.49 Y134.324 E.03118
G1 X174.253 Y134.993 E.03118
G1 X174.799 Y135.775 E.02931
M204 S10000
; WIPE_START
G1 F24000
G1 X174.834 Y135.825 E-.02307
G1 X175.199 Y136.771 E-.38557
G1 X175.314 Y137.689 E-.35136
; WIPE_END
G1 E-.04 F1800
G1 X180.735 Y143.062 Z2.6 F30000
G1 X182.541 Y144.853 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4465
G1 X184.17 Y144.853 E.05401
G1 X175.923 Y136.615 E.38665
G3 X173.662 Y142.021 I-4.77 J1.18 E.20824
G1 X176.494 Y144.853 E.13285
G1 X179.418 Y144.853 E.097
G1 X184.17 Y140.101 E.22292
G1 X184.17 Y137.177 E.097
G1 X171.742 Y124.749 E.58302
G1 X168.818 Y124.749 E.097
G1 X164.066 Y129.501 E.22292
G1 X164.066 Y132.425 E.097
G1 X166.897 Y135.256 E.13282
G2 X167.633 Y141.285 I4.266 J2.539 E.2168
G1 X164.066 Y144.853 E.16735
G1 X164.066 Y140.101 E.15763
G1 X168.818 Y144.853 E.22292
G1 X171.742 Y144.853 E.097
G1 X184.17 Y132.425 E.58302
G1 X184.17 Y129.501 E.097
G1 X179.418 Y124.749 E.22292
G1 X176.494 Y124.749 E.097
G1 X164.066 Y137.177 E.58302
G1 X164.066 Y135.548 E.05401
G1 X182.541 Y124.749 F30000
G1 F4465
G1 X184.17 Y124.749 E.05401
G1 X174.599 Y134.319 E.44898
G2 X172.36 Y133.043 I-3.483 J3.506 E.08649
G1 X164.066 Y124.749 E.3891
G1 X165.694 Y124.749 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X164.066 Y124.749 E-.61876
G1 X164.329 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z2.6 I.259 J-1.189 P1  F30000
G1 X134.898 Y118.602 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4445
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4445
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.785 Y121.763 Z2.8 F30000
G1 X119.448 Y123.496 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4445
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X127.376 Y118.948 E.33325
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X127.948 Y126.052 E.3098
G1 X128.052 Y126.052 E.00344
G1 X120.948 Y118.948 E.33325
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X126.789 Y121.814 Z2.8 F30000
G1 X184.516 Y145.199 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4445
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y130.35 E.19727
G1 X184.516 Y145.139 E.49057
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4445
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y130.35 E.19478
G1 X184.908 Y145.531 E.46647
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.202 Y139.527 Z2.8 F30000
G1 X175.186 Y135.677 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4445
G1 X175.565 Y136.632 E.0341
G1 X175.716 Y137.731 E.03677
G1 X175.599 Y138.833 E.03677
G1 X175.222 Y139.875 E.03677
G1 X174.606 Y140.797 E.03677
G1 X173.787 Y141.545 E.03677
G1 X172.814 Y142.075 E.03677
G1 X171.742 Y142.357 E.03677
G1 X170.633 Y142.374 E.03677
G1 X169.553 Y142.125 E.03677
G1 X168.563 Y141.624 E.03677
G1 X167.768 Y140.942 E.03475
G1 X167.63 Y140.797 E.00665
G1 X167.079 Y139.999 E.03216
G1 X166.67 Y138.969 E.03677
G1 X166.52 Y137.871 E.03677
G1 X166.637 Y136.768 E.03677
G1 X167.014 Y135.726 E.03677
G1 X167.63 Y134.804 E.03677
G1 X168.448 Y134.056 E.03677
G1 X169.422 Y133.526 E.03677
G1 X170.494 Y133.245 E.03677
G1 X171.603 Y133.228 E.03677
G1 X172.683 Y133.477 E.03677
G1 X173.672 Y133.977 E.03677
G1 X174.513 Y134.699 E.03677
G1 X175.157 Y135.602 E.03677
G1 X175.164 Y135.621 E.00068
G1 X174.833 Y135.823 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4445
G1 X174.834 Y135.825 E.00008
G1 X175.199 Y136.771 E.03118
G1 X175.327 Y137.778 E.03118
G1 X175.21 Y138.786 E.03118
G1 X174.855 Y139.736 E.03118
G1 X174.283 Y140.575 E.03118
G1 X173.527 Y141.251 E.03118
G1 X172.632 Y141.728 E.03118
G1 X171.648 Y141.976 E.03118
G1 X170.633 Y141.981 E.03118
G1 X169.647 Y141.744 E.03118
G1 X168.746 Y141.277 E.03118
G1 X168.028 Y140.649 E.02931
G1 X167.402 Y139.777 E.033
G1 X167.037 Y138.83 E.03118
G1 X166.909 Y137.823 E.03118
G1 X167.026 Y136.815 E.03118
G1 X167.381 Y135.865 E.03118
G1 X167.952 Y135.027 E.03118
G1 X168.708 Y134.35 E.03118
G1 X169.604 Y133.873 E.03118
G1 X170.588 Y133.625 E.03118
G1 X171.603 Y133.62 E.03118
G1 X172.589 Y133.857 E.03118
G1 X173.49 Y134.324 E.03118
G1 X174.253 Y134.993 E.03118
G1 X174.798 Y135.773 E.02926
M204 S10000
; WIPE_START
G1 F24000
G1 X174.834 Y135.825 E-.02373
G1 X175.199 Y136.771 E-.38557
G1 X175.315 Y137.687 E-.3507
; WIPE_END
G1 E-.04 F1800
G1 X167.817 Y136.261 Z2.8 F30000
G1 X164.066 Y135.548 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4445
G1 X164.066 Y137.177 E.05401
G1 X176.494 Y124.749 E.58302
G1 X179.418 Y124.749 E.097
G1 X184.17 Y129.501 E.22292
G1 X184.17 Y132.425 E.097
G1 X171.742 Y144.853 E.58302
G1 X168.818 Y144.853 E.097
G1 X164.066 Y140.101 E.22292
G1 X164.066 Y144.853 E.15763
G1 X167.633 Y141.285 E.16735
G3 X166.897 Y135.256 I3.53 J-3.49 E.2168
G1 X164.066 Y132.425 E.13282
G1 X164.066 Y129.501 E.097
G1 X168.818 Y124.749 E.22292
G1 X171.742 Y124.749 E.097
G1 X184.17 Y137.177 E.58302
G1 X184.17 Y140.101 E.097
G1 X179.418 Y144.853 E.22292
G1 X176.494 Y144.853 E.097
G1 X173.662 Y142.021 E.13285
G2 X175.917 Y136.6 I-2.684 J-4.296 E.20773
G1 X184.17 Y144.853 E.38714
G1 X182.541 Y144.853 E.05401
G1 X165.694 Y124.749 F30000
G1 F4445
G1 X164.066 Y124.749 E.05401
G1 X172.36 Y133.043 E.3891
G3 X174.599 Y134.319 I-1.244 J4.783 E.08649
G1 X184.17 Y124.749 E.44898
G1 X182.541 Y124.749 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X184.17 Y124.749 E-.61876
G1 X183.907 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z2.8 I.158 J-1.207 P1  F30000
G1 X134.898 Y118.602 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4458
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4458
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.631 Y120.508 Z3 F30000
G1 X119.448 Y120.828 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4458
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X128.052 Y126.052 E.33325
G1 X127.948 Y126.052 E.00344
G1 X134.552 Y119.448 E.3098
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X120.272 Y126.052 E.33325
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.01 Y127.618 Z3 F30000
G1 X184.516 Y145.199 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4458
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y130.35 E.19727
G1 X184.516 Y145.139 E.49057
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4458
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y130.35 E.19478
G1 X184.908 Y145.531 E.46647
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.202 Y139.527 Z3 F30000
G1 X175.186 Y135.677 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4458
G1 X175.565 Y136.632 E.0341
G1 X175.72 Y137.801 E.03909
G1 X175.599 Y138.833 E.03448
G1 X175.222 Y139.875 E.03677
G1 X174.606 Y140.797 E.03677
G1 X173.787 Y141.545 E.03677
G1 X172.814 Y142.075 E.03677
G1 X171.742 Y142.357 E.03677
G1 X170.633 Y142.374 E.03677
G1 X169.553 Y142.125 E.03677
G1 X168.563 Y141.624 E.03677
G1 X167.768 Y140.942 E.03475
G1 X167.63 Y140.797 E.00665
G1 X167.079 Y139.999 E.03216
G1 X166.67 Y138.969 E.03677
G1 X166.52 Y137.871 E.03677
G1 X166.637 Y136.768 E.03677
G1 X167.014 Y135.726 E.03677
G1 X167.63 Y134.804 E.03677
G1 X168.448 Y134.056 E.03677
G1 X169.422 Y133.526 E.03677
G1 X170.494 Y133.245 E.03677
G1 X171.603 Y133.228 E.03677
G1 X172.683 Y133.477 E.03677
G1 X173.672 Y133.977 E.03677
G1 X174.513 Y134.699 E.03677
G1 X175.157 Y135.602 E.03677
G1 X175.164 Y135.621 E.00068
G1 X174.832 Y135.821 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4458
G1 X174.834 Y135.825 E.00013
M73 P33 R18
G1 X175.199 Y136.771 E.03118
G1 X175.328 Y137.801 E.03188
G1 X175.21 Y138.786 E.03049
G1 X174.855 Y139.736 E.03118
G1 X174.283 Y140.575 E.03118
G1 X173.527 Y141.251 E.03118
G1 X172.632 Y141.728 E.03118
G1 X171.648 Y141.976 E.03118
G1 X170.633 Y141.981 E.03118
G1 X169.647 Y141.744 E.03118
G1 X168.746 Y141.277 E.03118
G1 X168.028 Y140.649 E.02931
G1 X167.402 Y139.777 E.033
G1 X167.037 Y138.83 E.03118
G1 X166.909 Y137.823 E.03118
G1 X167.026 Y136.815 E.03118
G1 X167.381 Y135.865 E.03118
G1 X167.952 Y135.027 E.03118
G1 X168.708 Y134.35 E.03118
G1 X169.604 Y133.873 E.03118
G1 X170.588 Y133.625 E.03118
G1 X171.603 Y133.62 E.03118
G1 X172.589 Y133.857 E.03118
G1 X173.49 Y134.324 E.03118
G1 X174.253 Y134.993 E.03118
G1 X174.797 Y135.772 E.02921
M204 S10000
; WIPE_START
G1 F24000
G1 X174.834 Y135.825 E-.02435
G1 X175.199 Y136.771 E-.38556
G1 X175.314 Y137.685 E-.35008
; WIPE_END
G1 E-.04 F1800
G1 X180.733 Y143.06 Z3 F30000
G1 X182.541 Y144.853 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4458
G1 X184.17 Y144.853 E.05401
G1 X175.923 Y136.615 E.38665
G3 X173.662 Y142.021 I-4.77 J1.18 E.20824
G1 X176.494 Y144.853 E.13285
G1 X179.418 Y144.853 E.097
G1 X184.17 Y140.101 E.22292
G1 X184.17 Y137.177 E.097
G1 X171.742 Y124.749 E.58302
G1 X168.818 Y124.749 E.097
G1 X164.066 Y129.501 E.22292
G1 X164.066 Y132.425 E.097
G1 X166.897 Y135.256 E.13282
G2 X167.633 Y141.285 I4.266 J2.539 E.2168
G1 X164.066 Y144.853 E.16735
G1 X164.066 Y140.101 E.15763
G1 X168.818 Y144.853 E.22292
G1 X171.742 Y144.853 E.097
G1 X184.17 Y132.425 E.58302
G1 X184.17 Y129.501 E.097
G1 X179.418 Y124.749 E.22292
G1 X176.494 Y124.749 E.097
G1 X164.066 Y137.177 E.58302
G1 X164.066 Y135.548 E.05401
G1 X182.541 Y124.749 F30000
G1 F4458
G1 X184.17 Y124.749 E.05401
G1 X174.599 Y134.319 E.44898
G2 X172.36 Y133.043 I-3.483 J3.506 E.08649
G1 X164.066 Y124.749 E.3891
G1 X165.694 Y124.749 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X164.066 Y124.749 E-.61876
G1 X164.329 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z3 I.259 J-1.189 P1  F30000
G1 X134.898 Y118.602 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4748
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4748
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.785 Y121.763 Z3.2 F30000
G1 X119.448 Y123.496 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4748
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X127.376 Y118.948 E.33325
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X127.948 Y126.052 E.3098
G1 X128.052 Y126.052 E.00344
G1 X120.948 Y118.948 E.33325
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X126.789 Y121.814 Z3.2 F30000
G1 X184.516 Y145.199 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4748
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y130.35 E.19727
G1 X184.516 Y145.139 E.49057
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4748
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y130.35 E.19478
G1 X184.908 Y145.531 E.46647
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.202 Y139.527 Z3.2 F30000
G1 X175.186 Y135.677 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4748
G1 X175.565 Y136.632 E.0341
G1 X175.72 Y137.801 E.03909
G1 X175.599 Y138.833 E.03448
G1 X175.222 Y139.875 E.03677
G1 X174.606 Y140.797 E.03677
G1 X173.787 Y141.545 E.03677
G1 X172.814 Y142.075 E.03677
G1 X171.742 Y142.357 E.03677
G1 X170.633 Y142.374 E.03677
G1 X169.553 Y142.125 E.03677
G1 X168.563 Y141.624 E.03677
G1 X167.768 Y140.942 E.03475
G1 X167.63 Y140.797 E.00665
G1 X167.079 Y139.999 E.03216
G1 X166.67 Y138.969 E.03677
G1 X166.52 Y137.871 E.03677
G1 X166.637 Y136.768 E.03677
G1 X167.014 Y135.726 E.03677
G1 X167.63 Y134.804 E.03677
G1 X168.448 Y134.056 E.03677
G1 X169.422 Y133.526 E.03677
G1 X170.494 Y133.245 E.03677
G1 X171.603 Y133.228 E.03677
G1 X172.683 Y133.477 E.03677
G1 X173.672 Y133.977 E.03677
G1 X174.513 Y134.699 E.03677
G1 X175.157 Y135.602 E.03677
G1 X175.164 Y135.621 E.00068
G1 X174.831 Y135.82 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4748
G1 X174.834 Y135.825 E.00017
G1 X175.199 Y136.771 E.03118
G1 X175.328 Y137.801 E.03188
G1 X175.21 Y138.786 E.03049
G1 X174.855 Y139.736 E.03118
G1 X174.283 Y140.575 E.03118
G1 X173.527 Y141.251 E.03118
G1 X172.632 Y141.728 E.03118
G1 X171.648 Y141.976 E.03118
G1 X170.633 Y141.981 E.03118
G1 X169.647 Y141.744 E.03118
G1 X168.746 Y141.277 E.03118
G1 X168.028 Y140.649 E.02931
G1 X167.402 Y139.777 E.033
G1 X167.037 Y138.83 E.03118
G1 X166.909 Y137.823 E.03118
G1 X167.026 Y136.815 E.03118
G1 X167.381 Y135.865 E.03118
G1 X167.952 Y135.027 E.03118
G1 X168.708 Y134.35 E.03118
G1 X169.604 Y133.873 E.03118
G1 X170.588 Y133.625 E.03118
G1 X171.603 Y133.62 E.03118
G1 X172.589 Y133.857 E.03118
G1 X173.49 Y134.324 E.03118
G1 X174.253 Y134.993 E.03118
G1 X174.796 Y135.771 E.02916
M204 S10000
; WIPE_START
G1 F24000
G1 X174.834 Y135.825 E-.02493
G1 X175.199 Y136.771 E-.38557
G1 X175.313 Y137.684 E-.34951
; WIPE_END
G1 E-.04 F1800
G1 X173.053 Y132.455 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4748
G2 X171.462 Y132.144 I-1.688 J4.425 E.05406
G1 X169.828 Y130.51 E.07665
G2 X169.863 Y131.379 I3.461 J.294 E.02893
G1 X174.706 Y126.536 E.2272
G2 X173.53 Y126.536 I-.588 J5.829 E.0391
G1 X178.373 Y131.38 E.22721
G2 X178.408 Y130.51 I-3.249 J-.566 E.02894
G1 X175.125 Y133.794 E.15403
G3 X175.871 Y134.73 I-2.056 J2.405 E.03995
G1 X176.248 Y134.532 E.01412
G1 X174.49 Y126.1 F30000
G1 F4748
G3 X175.734 Y135.226 I-.388 J4.701 E.42338
G1 X175.741 Y135.258 E.00107
G2 X169.79 Y132.645 I-4.775 J2.793 E.23044
G3 X174.43 Y126.1 I4.342 J-1.839 E.31828
G1 X182.541 Y144.853 F30000
G1 F4748
G1 X184.17 Y144.853 E.05401
G1 X175.923 Y136.615 E.38665
G3 X173.662 Y142.021 I-4.77 J1.18 E.20824
G1 X176.494 Y144.853 E.13285
G1 X179.418 Y144.853 E.097
G1 X184.17 Y140.101 E.22292
G1 X184.17 Y137.177 E.097
G1 X179.074 Y132.081 E.23906
G2 X179.138 Y129.78 I-5.102 J-1.294 E.07695
G1 X184.17 Y124.749 E.23605
G1 X182.541 Y124.749 E.05401
; WIPE_START
G1 F24000
G1 X184.17 Y124.749 E-.61876
G1 X183.907 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X178.746 Y130.634 Z3.2 F30000
G1 X165.694 Y144.853 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F4748
G1 X164.066 Y144.853 E.05401
G1 X167.633 Y141.285 E.16735
G3 X166.897 Y135.256 I3.53 J-3.49 E.2168
G1 X164.066 Y132.425 E.13282
G1 X164.066 Y129.501 E.097
G1 X168.818 Y124.749 E.22292
G1 X171.742 Y124.749 E.097
G1 X172.846 Y125.853 E.05181
G3 X175.389 Y125.853 I1.272 J4.956 E.08525
G1 X176.494 Y124.749 E.05181
G1 X179.418 Y124.749 E.097
G1 X184.17 Y129.501 E.22292
G1 X184.17 Y132.425 E.097
G1 X171.742 Y144.853 E.58302
G1 X168.818 Y144.853 E.097
G1 X164.066 Y140.101 E.22292
G1 X164.066 Y137.177 E.097
G1 X169.162 Y132.081 E.23906
G3 X169.098 Y129.781 I4.883 J-1.287 E.077
G1 X164.066 Y124.749 E.23606
G1 X165.694 Y124.749 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X164.066 Y124.749 E-.61876
G1 X164.329 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z3.2 I.259 J-1.189 P1  F30000
G1 X134.898 Y118.602 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4696
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4696
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.631 Y120.508 Z3.4 F30000
G1 X119.448 Y120.828 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4696
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X128.052 Y126.052 E.33325
G1 X127.948 Y126.052 E.00344
G1 X134.552 Y119.448 E.3098
M73 P33 R17
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X120.272 Y126.052 E.33325
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.01 Y127.618 Z3.4 F30000
G1 X184.516 Y145.199 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4696
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y130.35 E.19727
G1 X184.516 Y145.139 E.49057
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4696
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y130.35 E.19478
G1 X184.908 Y145.531 E.46647
M204 S10000
; WIPE_START
M73 P34 R17
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.202 Y139.527 Z3.4 F30000
G1 X175.186 Y135.677 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4696
G1 X175.565 Y136.632 E.03411
G1 X175.72 Y137.801 E.03909
G1 X175.599 Y138.833 E.03448
G1 X175.222 Y139.875 E.03677
G1 X174.606 Y140.797 E.03677
G1 X173.787 Y141.545 E.03677
G1 X172.814 Y142.075 E.03677
G1 X171.742 Y142.357 E.03677
G1 X170.633 Y142.374 E.03677
G1 X169.553 Y142.125 E.03677
G1 X168.563 Y141.624 E.03677
G1 X167.768 Y140.942 E.03475
G1 X167.63 Y140.797 E.00665
G1 X167.079 Y139.999 E.03216
G1 X166.67 Y138.969 E.03677
G1 X166.52 Y137.871 E.03677
G1 X166.637 Y136.768 E.03677
G1 X167.014 Y135.726 E.03677
G1 X167.63 Y134.804 E.03677
G1 X168.448 Y134.056 E.03677
G1 X169.422 Y133.526 E.03677
G1 X170.494 Y133.245 E.03677
G1 X171.603 Y133.228 E.03677
G1 X172.683 Y133.477 E.03677
G1 X173.672 Y133.977 E.03677
G1 X174.513 Y134.699 E.03677
G1 X175.157 Y135.602 E.03677
G1 X175.164 Y135.621 E.00068
G1 X174.83 Y135.819 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4696
G1 X174.834 Y135.825 E.00021
G1 X175.199 Y136.771 E.03118
G1 X175.328 Y137.801 E.03188
G1 X175.21 Y138.786 E.03049
G1 X174.855 Y139.736 E.03118
G1 X174.283 Y140.575 E.03118
G1 X173.527 Y141.251 E.03118
G1 X172.632 Y141.728 E.03118
G1 X171.648 Y141.976 E.03118
G1 X170.633 Y141.981 E.03118
G1 X169.647 Y141.744 E.03118
G1 X168.746 Y141.277 E.03118
G1 X168.028 Y140.649 E.02931
G1 X167.402 Y139.777 E.033
G1 X167.037 Y138.83 E.03118
G1 X166.909 Y137.823 E.03118
G1 X167.026 Y136.815 E.03118
G1 X167.381 Y135.865 E.03118
G1 X167.952 Y135.027 E.03118
G1 X168.708 Y134.35 E.03118
G1 X169.604 Y133.873 E.03118
G1 X170.588 Y133.625 E.03118
G1 X171.603 Y133.62 E.03118
G1 X172.589 Y133.857 E.03118
G1 X173.49 Y134.324 E.03118
G1 X174.253 Y134.993 E.03118
G1 X174.796 Y135.77 E.02912
M204 S10000
; WIPE_START
G1 F24000
G1 X174.834 Y135.825 E-.02544
G1 X175.199 Y136.771 E-.38556
G1 X175.313 Y137.683 E-.34899
; WIPE_END
G1 E-.04 F1800
G1 X176.248 Y134.532 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4696
G1 X175.871 Y134.73 E.01412
G2 X175.125 Y133.794 I-2.802 J1.469 E.03995
G1 X178.408 Y130.51 E.15403
G3 X178.373 Y131.38 I-3.284 J.303 E.02894
G1 X173.53 Y126.536 E.22721
G3 X174.706 Y126.536 I.588 J5.829 E.0391
G1 X169.863 Y131.379 E.2272
G1 X169.817 Y131 E.01269
G3 X169.828 Y130.51 I3.942 J-.155 E.01624
G1 X171.462 Y132.144 E.07665
G3 X171.907 Y132.17 I.119 J1.845 E.01482
G3 X173.053 Y132.455 I-.6 J4.864 E.03929
G1 X174.49 Y126.1 F30000
G1 F4696
G3 X175.734 Y135.226 I-.388 J4.701 E.42338
G1 X175.741 Y135.258 E.00107
G2 X169.79 Y132.645 I-4.775 J2.793 E.23044
G3 X174.43 Y126.1 I4.342 J-1.839 E.31828
G1 X182.541 Y124.749 F30000
G1 F4696
G1 X184.17 Y124.749 E.05401
G1 X179.138 Y129.78 E.23605
G3 X179.074 Y132.081 I-5.166 J1.007 E.07695
G1 X184.17 Y137.177 E.23906
G1 X184.17 Y140.101 E.097
G1 X179.418 Y144.853 E.22292
G1 X176.494 Y144.853 E.097
G1 X173.662 Y142.021 E.13285
G2 X175.917 Y136.6 I-2.684 J-4.296 E.20773
G1 X184.17 Y144.853 E.38714
G1 X182.541 Y144.853 E.05401
G1 X165.694 Y124.749 F30000
G1 F4696
G1 X164.066 Y124.749 E.05401
G1 X169.098 Y129.781 E.23606
G2 X169.162 Y132.081 I4.947 J1.013 E.077
G1 X164.066 Y137.177 E.23906
G1 X164.066 Y140.101 E.097
G1 X168.818 Y144.853 E.22292
G1 X171.742 Y144.853 E.097
G1 X184.17 Y132.425 E.58302
G1 X184.17 Y129.501 E.097
G1 X179.418 Y124.749 E.22292
G1 X176.494 Y124.749 E.097
G1 X175.389 Y125.853 E.05181
G2 X172.846 Y125.853 I-1.272 J4.956 E.08525
G1 X171.742 Y124.749 E.05181
G1 X168.818 Y124.749 E.097
G1 X164.066 Y129.501 E.22292
G1 X164.066 Y132.425 E.097
G1 X166.897 Y135.256 E.13282
G2 X167.633 Y141.285 I4.266 J2.539 E.2168
G1 X164.066 Y144.853 E.16735
G1 X165.694 Y144.853 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X164.066 Y144.853 E-.61876
G1 X164.329 Y144.59 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z3.4 I.806 J-.912 P1  F30000
G1 X134.898 Y118.602 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F9245
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F9245
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.785 Y121.763 Z3.6 F30000
G1 X119.448 Y123.496 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9245
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X127.376 Y118.948 E.33325
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X127.948 Y126.052 E.3098
G1 X128.052 Y126.052 E.00344
G1 X120.948 Y118.948 E.33325
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X126.789 Y121.814 Z3.6 F30000
G1 X184.516 Y145.199 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F9245
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y134.801 E.34492
G1 X184.516 Y145.139 E.34293
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F9245
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y134.801 E.33155
G1 X184.908 Y145.531 E.3297
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.645 Y139.205 Z3.6 F30000
G1 X176.152 Y135.502 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9245
G1 X175.806 Y135.683 E.01298
G3 X176.175 Y136.858 I-2.673 J1.486 E.04114
G1 X184.17 Y144.853 E.37503
G1 X182.541 Y144.853 E.05401
G1 X169.828 Y142.542 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.422215
M106 S255
G1 F3000
G1 X171.654 Y142.542 E.05642
G1 X172.764 Y142.279 E.03526
G2 X173.012 Y142.162 I-.357 J-1.079 E.00849
G1 X169.224 Y142.162 E.11706
G1 X168.501 Y141.783 E.02523
G1 X173.734 Y141.783 E.16174
G2 X173.869 Y141.699 I-.278 J-.595 E.0049
G1 X174.202 Y141.404 E.01377
G1 X168.034 Y141.404 E.19065
G1 X167.605 Y141.025 E.01768
G1 X174.63 Y141.025 E.21712
G2 X174.917 Y140.645 I-1.061 J-1.099 E.01475
G1 X167.319 Y140.645 E.23482
G1 X167.057 Y140.266 E.01424
G1 X175.178 Y140.266 E.25101
G2 X175.399 Y139.887 I-.93 J-.794 E.01363
G1 X166.837 Y139.887 E.26462
G1 X166.693 Y139.507 E.01254
G1 X175.542 Y139.507 E.27351
G1 X175.686 Y139.128 E.01254
G1 X166.549 Y139.128 E.2824
G3 X166.456 Y138.749 I.988 J-.445 E.01214
G1 X175.78 Y138.749 E.28818
G1 X175.826 Y138.37 E.01181
G1 X166.41 Y138.37 E.29103
G1 X166.364 Y137.99 E.01181
G1 X175.872 Y137.99 E.29388
G2 X175.872 Y137.611 I-1.133 J-.19 E.01178
G1 X166.364 Y137.611 E.29388
G1 X166.41 Y137.232 E.01181
G1 X175.826 Y137.232 E.29103
G1 X175.78 Y136.852 E.01181
G1 X166.456 Y136.852 E.28818
G3 X166.549 Y136.473 I1.081 J.066 E.01214
G1 X175.686 Y136.473 E.2824
G1 X175.542 Y136.094 E.01254
G1 X166.693 Y136.094 E.27351
G1 X166.837 Y135.714 E.01254
G1 X175.399 Y135.714 E.26461
G2 X175.178 Y135.335 I-1.151 J.414 E.01363
G1 X167.057 Y135.335 E.251
G1 X167.319 Y134.956 E.01424
G1 X174.917 Y134.956 E.23482
G2 X174.63 Y134.577 I-1.347 J.719 E.01475
G1 X167.606 Y134.577 E.21711
G1 X168.034 Y134.197 E.01768
G1 X174.202 Y134.197 E.19065
G2 X173.788 Y133.846 I-1.653 J1.53 E.01682
G1 X173.734 Y133.818 E.00187
G1 X168.502 Y133.818 E.16173
G1 X169.224 Y133.439 E.02523
G1 X173.011 Y133.439 E.11705
G2 X172.764 Y133.322 I-.604 J.961 E.00848
G1 X171.653 Y133.059 E.03528
G1 X169.829 Y133.059 E.05638
M106 S252.45
G1 X173.053 Y132.455 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9245
G2 X171.462 Y132.144 I-1.688 J4.425 E.05406
G1 X169.828 Y130.51 E.07665
G2 X169.863 Y131.379 I3.461 J.294 E.02893
G1 X174.706 Y126.536 E.2272
G2 X173.53 Y126.536 I-.588 J5.829 E.0391
G1 X178.373 Y131.38 E.22721
G2 X178.408 Y130.51 I-3.249 J-.566 E.02894
G1 X175.125 Y133.794 E.15403
G3 X175.871 Y134.73 I-2.056 J2.405 E.03995
G1 X176.248 Y134.532 E.01412
G1 X174.49 Y126.1 F30000
G1 F9245
G3 X175.734 Y135.226 I-.388 J4.701 E.42338
G1 X175.741 Y135.258 E.00107
G2 X169.79 Y132.645 I-4.775 J2.793 E.23044
G3 X174.43 Y126.1 I4.342 J-1.839 E.31828
G1 X182.541 Y124.749 F30000
G1 F9245
G1 X184.17 Y124.749 E.05401
G1 X179.138 Y129.78 E.23605
G3 X179.074 Y132.081 I-5.166 J1.007 E.07695
G1 X184.17 Y137.177 E.23906
G1 X184.17 Y140.101 E.097
G1 X179.418 Y144.853 E.22292
G1 X176.494 Y144.853 E.097
G1 X173.821 Y142.18 E.12536
G3 X167.481 Y141.438 I-2.711 J-4.298 E.22898
G1 X164.066 Y144.853 E.16019
G1 X165.694 Y144.853 E.05401
G1 X165.694 Y124.749 F30000
G1 F9245
G1 X164.066 Y124.749 E.05401
G1 X169.098 Y129.781 E.23606
G2 X169.162 Y132.081 I4.947 J1.013 E.077
G1 X164.066 Y137.177 E.23906
G1 X164.066 Y140.101 E.097
G1 X168.818 Y144.853 E.22292
G1 X171.742 Y144.853 E.097
G1 X184.17 Y132.425 E.58302
M73 P35 R17
G1 X184.17 Y129.501 E.097
G1 X179.418 Y124.749 E.22292
G1 X176.494 Y124.749 E.097
G1 X175.389 Y125.853 E.05181
G2 X172.846 Y125.853 I-1.272 J4.956 E.08525
G1 X171.742 Y124.749 E.05181
G1 X168.818 Y124.749 E.097
G1 X164.066 Y129.501 E.22292
G1 X164.066 Y132.425 E.097
G1 X166.742 Y135.101 E.12556
G2 X166.512 Y135.466 I1.385 J1.13 E.01433
G2 X166.099 Y136.588 I4.415 J2.263 E.03977
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X166.512 Y135.466 E-.45444
G1 X166.742 Y135.101 E-.16381
G1 X166.479 Y134.837 E-.14175
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z3.6 I.556 J-1.082 P1  F30000
G1 X134.898 Y118.602 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F6088
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F6088
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.631 Y120.508 Z3.8 F30000
G1 X119.448 Y120.828 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6088
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X128.052 Y126.052 E.33325
G1 X127.948 Y126.052 E.00344
G1 X134.552 Y119.448 E.3098
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X120.272 Y126.052 E.33325
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.01 Y127.618 Z3.8 F30000
G1 X184.516 Y145.199 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F6088
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y134.801 E.34492
G1 X184.516 Y145.139 E.34293
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F6088
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y134.801 E.33155
G1 X184.908 Y145.531 E.3297
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X182.541 Y144.853 Z3.8 F30000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6088
G1 X184.17 Y144.853 E.05401
G1 X176.766 Y137.448 E.34734
G2 X176.426 Y135.866 I-3.904 J.011 E.05409
G1 X175.764 Y134.978 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420118
G1 F6088
G2 X174.051 Y133.403 I-11.154 J10.408 E.0716
G1 X173.217 Y132.965 E.02894
G1 X175.938 Y135.687 E.11828
G1 X176.249 Y136.53 E.02763
G1 X172.427 Y132.709 E.16611
G2 X171.831 Y132.562 I-1.509 J4.854 E.0189
G1 X171.736 Y132.551 E.00294
G1 X176.334 Y137.149 E.19989
G1 X176.404 Y137.752 E.01865
G1 X171.195 Y132.544 E.22641
G1 X170.662 Y132.544 E.0164
G1 X176.36 Y138.242 E.24769
G1 X176.302 Y138.717 E.01473
G1 X170.198 Y132.613 E.26535
G1 X169.77 Y132.719 E.01355
G1 X176.221 Y139.17 E.28042
G1 X176.074 Y139.557 E.01271
G1 X169.342 Y132.824 E.29265
G1 X169.172 Y132.885 E.00555
G2 X168.973 Y132.989 I.758 J1.694 E.00689
G1 X175.928 Y139.943 E.30229
G3 X175.767 Y140.316 I-1.649 J-.488 E.01251
G1 X168.624 Y133.173 E.31052
G1 X168.274 Y133.356 E.01214
G1 X175.55 Y140.633 E.31631
G1 X175.333 Y140.949 E.01179
G1 X167.959 Y133.575 E.3205
G1 X167.677 Y133.826 E.01162
G1 X175.113 Y141.262 E.32325
G1 X175.024 Y141.363 E.00413
G3 X174.842 Y141.525 I-1.428 J-1.423 E.00749
G1 X167.394 Y134.077 E.32376
G2 X167.123 Y134.339 I.97 J1.273 E.01162
G1 X174.559 Y141.775 E.32324
G1 X174.276 Y142.026 E.01162
G1 X166.903 Y134.653 E.3205
G1 X166.685 Y134.968 E.01179
G1 X173.962 Y142.245 E.31631
G1 X173.612 Y142.429 E.01214
G1 X166.468 Y135.285 E.31052
G1 X166.402 Y135.412 E.0044
G2 X166.308 Y135.658 I1.993 J.901 E.00811
G1 X173.262 Y142.612 E.30229
G3 X172.894 Y142.777 I-.889 J-1.491 E.01244
G1 X166.161 Y136.045 E.29265
G1 X166.015 Y136.432 E.01271
G1 X172.466 Y142.883 E.28042
G1 X172.038 Y142.988 E.01355
G1 X165.933 Y136.884 E.26535
G1 X165.876 Y137.36 E.01473
G1 X171.574 Y143.058 E.24769
G1 X171.04 Y143.058 E.0164
G1 X165.832 Y137.849 E.2264
G1 X165.901 Y138.452 E.01865
G1 X170.5 Y143.05 E.19988
G1 X170.405 Y143.039 E.00293
G3 X169.808 Y142.892 I.911 J-4.997 E.0189
G1 X165.987 Y139.071 E.1661
G1 X166.297 Y139.915 E.02764
G1 X169.018 Y142.636 E.11827
G1 X168.185 Y142.198 E.02894
G1 X168.046 Y142.103 E.00517
G3 X166.472 Y140.623 I11.443 J-13.75 E.06644
G1 X165.694 Y144.853 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6088
G1 X164.066 Y144.853 E.05401
G1 X167.116 Y141.802 E.14309
G3 X166.13 Y140.515 I2.957 J-3.286 E.05411
G1 X176.492 Y134.392 F30000
G1 F6088
G3 X176.228 Y134.543 I-.753 J-1.012 E.01011
G2 X175.408 Y133.51 I-3.195 J1.696 E.04397
G1 X178.408 Y130.51 E.14074
G3 X178.373 Y131.38 I-3.284 J.303 E.02894
G1 X173.53 Y126.536 E.22721
G3 X174.706 Y126.536 I.588 J5.829 E.0391
G1 X169.863 Y131.379 E.2272
G1 X169.817 Y131 E.01269
G3 X169.828 Y130.51 I3.942 J-.155 E.01624
G1 X171.062 Y131.744 E.05789
G3 X172.668 Y131.945 I.317 J3.991 E.05406
G1 X174.49 Y126.1 F30000
G1 F6088
G3 X176.088 Y135.057 I-.376 J4.688 E.41005
G2 X169.673 Y132.338 I-4.922 J2.686 E.24937
G1 X169.593 Y132.126 E.00755
G3 X174.43 Y126.1 I4.547 J-1.305 E.29997
G1 X182.541 Y124.749 F30000
G1 F6088
G1 X184.17 Y124.749 E.05401
G1 X179.138 Y129.78 E.23605
G3 X179.074 Y132.081 I-5.166 J1.007 E.07695
G1 X184.17 Y137.177 E.23906
G1 X184.17 Y140.101 E.097
G1 X179.418 Y144.853 E.22292
G1 X176.494 Y144.853 E.097
G1 X174.203 Y142.561 E.10748
G1 X173.845 Y142.749 E.01338
G1 X171.742 Y144.853 E.09869
G1 X168.818 Y144.853 E.097
G1 X164.066 Y140.101 E.22292
G1 X164.066 Y137.177 E.097
G1 X166.101 Y135.142 E.09547
G3 X166.372 Y134.731 I2.05 J1.061 E.01635
G1 X164.066 Y132.425 E.1082
G1 X164.066 Y129.501 E.097
G1 X168.818 Y124.749 E.22292
G1 X171.742 Y124.749 E.097
G1 X172.846 Y125.853 E.05181
G3 X175.389 Y125.853 I1.272 J4.956 E.08525
G1 X176.494 Y124.749 E.05181
G1 X179.418 Y124.749 E.097
G1 X184.17 Y129.501 E.22292
G1 X184.17 Y132.425 E.097
G1 X176.135 Y140.46 E.37694
G3 X175.166 Y141.761 I-4.039 J-1.994 E.05411
G1 X165.694 Y124.749 F30000
G1 F6088
G1 X164.066 Y124.749 E.05401
G1 X169.098 Y129.781 E.23606
G2 X169.162 Y132.081 I4.947 J1.013 E.077
G1 X168.39 Y132.852 E.0362
G1 X168.094 Y133.008 E.01109
G2 X167.092 Y133.82 I1.777 J3.217 E.04302
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X167.795 Y133.197 E-.35692
G1 X168.094 Y133.008 E-.13454
G1 X168.39 Y132.852 E-.12704
G1 X168.653 Y132.589 E-.1415
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z3.8 I.466 J-1.124 P1  F30000
G1 X134.898 Y118.602 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F8919
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F8919
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.785 Y121.763 Z4 F30000
G1 X119.448 Y123.496 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8919
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X127.376 Y118.948 E.33325
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X127.948 Y126.052 E.3098
G1 X128.052 Y126.052 E.00344
G1 X120.948 Y118.948 E.33325
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X126.789 Y121.814 Z4 F30000
G1 X184.516 Y145.199 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F8919
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y134.801 E.34492
G1 X184.516 Y145.139 E.34293
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F8919
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y134.801 E.33155
G1 X184.908 Y145.531 E.3297
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X176.048 Y142.191 Z4 F30000
G1 X175.166 Y141.761 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8919
G2 X176.135 Y140.46 I-3.07 J-3.296 E.05411
G1 X184.17 Y132.425 E.37694
G1 X184.17 Y129.501 E.097
G1 X179.418 Y124.749 E.22292
G1 X176.494 Y124.749 E.097
G1 X175.389 Y125.853 E.05181
G2 X172.846 Y125.853 I-1.272 J4.956 E.08525
G1 X171.742 Y124.749 E.05181
G1 X168.818 Y124.749 E.097
G1 X164.066 Y129.501 E.22292
G1 X164.066 Y132.425 E.097
G1 X166.372 Y134.731 E.1082
G2 X166.101 Y135.142 I1.778 J1.471 E.01635
G1 X164.066 Y137.177 E.09547
G1 X164.066 Y140.101 E.097
G1 X168.818 Y144.853 E.22292
G1 X171.742 Y144.853 E.097
G1 X173.845 Y142.749 E.09869
G1 X174.203 Y142.561 E.01338
G1 X176.494 Y144.853 E.10748
G1 X179.418 Y144.853 E.097
G1 X184.17 Y140.101 E.22292
G1 X184.17 Y137.177 E.097
G1 X179.074 Y132.081 E.23906
G2 X179.138 Y129.78 I-5.102 J-1.294 E.07695
G1 X184.17 Y124.749 E.23605
G1 X182.541 Y124.749 E.05401
G1 X171.781 Y126.514 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.418381
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X170.637 Y127.657 E.09059
G1 X170.477 Y127.838 E.01351
G2 X170.059 Y128.443 I4.782 J3.751 E.04122
G2 X169.698 Y129.259 I4.499 J2.481 E.05007
G1 X172.594 Y126.363 E.22943
G3 X173.358 Y126.169 I7.019 J26.012 E.04414
G1 X173.463 Y126.156 E.00596
G1 X169.485 Y130.134 E.31515
G2 X169.428 Y130.604 I3.859 J.704 E.02653
G1 X169.428 Y130.854 E.01396
G1 X174.16 Y126.121 E.37488
G3 X174.488 Y126.121 I.161 J2.696 E.01836
G1 X174.786 Y126.158 E.01683
G1 X169.484 Y131.46 E.42
G2 X169.588 Y132.019 I2.369 J-.15 E.03191
G1 X175.327 Y126.279 E.45464
G1 X175.592 Y126.344 E.01528
G1 X175.833 Y126.436 E.01443
G1 X169.761 Y132.508 E.48104
G1 X169.804 Y132.622 E.00681
G1 X170.379 Y132.552 E.03247
G1 X176.28 Y126.651 E.46746
G3 X176.62 Y126.83 I-1.307 J2.897 E.02152
G1 X176.705 Y126.888 E.00579
G1 X171.064 Y132.53 E.44692
G1 X171.721 Y132.535 E.0368
G1 X177.081 Y127.174 E.42467
G1 X177.433 Y127.486 E.02628
G1 X172.264 Y132.655 E.40947
G1 X172.795 Y132.786 E.03066
G1 X177.751 Y127.83 E.3926
G3 X178.023 Y128.22 I-1.789 J1.534 E.0267
G1 X173.267 Y132.976 E.37674
M73 P36 R17
G1 X173.701 Y133.204 E.02748
G1 X178.274 Y128.631 E.36224
G3 X178.474 Y129.094 I-1.894 J1.09 E.0283
G1 X174.128 Y133.439 E.34421
G3 X174.487 Y133.744 I-1.074 J1.627 E.02639
G1 X178.647 Y129.583 E.3296
G1 X178.717 Y129.863 E.01615
G1 X178.752 Y130.141 E.01572
G1 X174.838 Y134.055 E.31003
G3 X175.167 Y134.388 I-1.035 J1.35 E.02632
G1 X178.807 Y130.748 E.28841
G3 X178.751 Y131.467 I-3.013 J.124 E.0405
G1 X175.437 Y134.78 E.26249
G1 X175.708 Y135.172 E.02667
G1 X178.538 Y132.342 E.2242
G1 X178.364 Y132.801 E.02753
G3 X177.758 Y133.763 I-4.943 J-2.439 E.06378
G1 X177.599 Y133.943 E.01343
G1 X176.454 Y135.088 E.09069
M106 S252.45
G1 X176.426 Y135.866 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F8919
G3 X176.766 Y137.448 I-3.564 J1.593 E.05409
G1 X184.17 Y144.853 E.34734
G1 X182.541 Y144.853 E.05401
G1 X173.937 Y142.45 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420119
G1 F8919
G1 X175.125 Y141.249 E.05194
G1 X175.759 Y140.331 E.03427
G1 X175.834 Y140.19 E.00493
G2 X175.938 Y139.915 I-2.218 J-1.002 E.00905
G1 X173.217 Y142.636 E.11829
G1 X172.921 Y142.77 E.01
G3 X172.427 Y142.892 I-1.253 J-4.007 E.01563
G1 X176.249 Y139.071 E.16611
G1 X176.268 Y138.992 E.00251
G2 X176.334 Y138.452 I-4.429 J-.815 E.01672
G1 X171.736 Y143.05 E.19989
G1 X171.679 Y143.057 E.00176
G3 X171.195 Y143.058 I-.246 J-4.003 E.01489
G1 X176.404 Y137.849 E.22641
G1 X176.36 Y137.359 E.01511
G1 X170.662 Y143.058 E.24769
G1 X170.405 Y143.039 E.00791
G1 X170.198 Y142.988 E.00656
G1 X176.302 Y136.884 E.26535
G2 X176.221 Y136.432 I-1.846 J.098 E.01416
G1 X169.77 Y142.883 E.28042
G1 X169.342 Y142.777 E.01355
G1 X176.074 Y136.045 E.29265
G1 X175.928 Y135.658 E.01271
G1 X168.973 Y142.612 E.30229
G1 X168.624 Y142.429 E.01214
G1 X175.481 Y135.571 E.29807
G1 X175.263 Y135.256 E.01179
G1 X168.274 Y142.245 E.30381
G1 X168.052 Y142.107 E.00801
G1 X167.959 Y142.026 E.0038
G1 X175.045 Y134.94 E.308
G1 X174.827 Y134.625 E.01179
G1 X167.677 Y141.775 E.31083
G1 X167.394 Y141.525 E.01162
G1 X174.558 Y134.36 E.31144
G1 X174.276 Y134.109 E.01162
G1 X167.123 Y141.262 E.31093
G1 X167.111 Y141.249 E.00056
G3 X166.903 Y140.949 I2.375 J-1.866 E.01123
G1 X173.993 Y133.859 E.30819
G2 X173.666 Y133.652 I-.792 J.894 E.01194
G1 X166.685 Y140.633 E.30343
G3 X166.468 Y140.316 I1.427 J-1.208 E.01182
G1 X173.316 Y133.469 E.29764
G1 X172.966 Y133.285 E.01214
G1 X166.308 Y139.943 E.28941
G1 X166.161 Y139.556 E.01271
G1 X172.563 Y133.155 E.27828
G1 X172.135 Y133.049 E.01355
G1 X166.015 Y139.17 E.26606
G1 X165.967 Y138.992 E.00567
G3 X165.933 Y138.717 I2.254 J-.417 E.00849
G1 X171.701 Y132.95 E.25071
G1 X171.174 Y132.944 E.01621
G1 X165.876 Y138.242 E.2303
G1 X165.832 Y137.752 E.01511
G1 X170.64 Y132.944 E.20902
G1 X170.041 Y133.01 E.01854
G1 X165.901 Y137.149 E.17995
G3 X165.967 Y136.61 I4.494 J.276 E.01672
G1 X165.987 Y136.53 E.00252
G1 X169.434 Y133.083 E.14983
G1 X169.269 Y133.103 E.00511
G1 X169.239 Y132.86 E.00754
G1 X169.018 Y132.966 E.00752
G1 X166.297 Y135.686 E.11827
G3 X166.477 Y135.27 I2.215 J.708 E.01396
G1 X167.111 Y134.353 E.03427
G1 X168.299 Y133.151 E.05193
G1 X167.092 Y133.82 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8919
G3 X168.39 Y132.852 I2.96 J2.616 E.05409
G1 X169.162 Y132.081 E.0362
G3 X169.095 Y131.806 I2.193 J-.677 E.00937
G1 X169.095 Y131.806 E0
G3 X169.098 Y129.781 I5.027 J-1.006 E.06764
G1 X164.066 Y124.749 E.23606
G1 X165.694 Y124.749 E.05401
G1 X166.13 Y140.515 F30000
G1 F8919
G1 X166.131 Y140.517 E.0001
G2 X167.116 Y141.802 I4.006 J-2.05 E.054
G1 X164.066 Y144.853 E.14309
G1 X165.694 Y144.853 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X164.066 Y144.853 E-.61876
G1 X164.329 Y144.59 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z4 I.806 J-.912 P1  F30000
G1 X134.898 Y118.602 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F5434
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F5434
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.631 Y120.508 Z4.2 F30000
G1 X119.448 Y120.828 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5434
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X128.052 Y126.052 E.33325
G1 X127.948 Y126.052 E.00344
G1 X134.552 Y119.448 E.3098
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X120.272 Y126.052 E.33325
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.01 Y127.618 Z4.2 F30000
G1 X184.516 Y145.199 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F5434
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y134.801 E.34492
G1 X184.516 Y145.139 E.34293
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F5434
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y134.801 E.33155
G1 X184.908 Y145.531 E.3297
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X177.33 Y140.326 Z4.2 F30000
G1 X171.655 Y135.026 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421227
G1 F5434
G1 X170.705 Y134.075 E.04145
G1 X170.449 Y133.787 E.01187
G3 X170.029 Y133.178 I4.823 J-3.783 E.02282
G3 X169.752 Y132.587 I4.21 J-2.334 E.02015
G1 X172.349 Y135.184 E.11324
G2 X173.108 Y135.409 I1.314 J-3.049 E.02447
G1 X169.496 Y131.796 E.15751
G1 X169.482 Y131.74 E.00178
G3 X169.413 Y131.179 I4.609 J-.848 E.01745
G1 X173.751 Y135.517 E.18912
G1 X174.286 Y135.517 E.01649
G1 X169.392 Y130.622 E.21338
G3 X169.447 Y130.143 I2.199 J.011 E.01491
G1 X174.785 Y135.48 E.23271
G2 X175.225 Y135.385 I-.184 J-1.903 E.0139
G1 X169.525 Y129.685 E.24848
G1 X169.576 Y129.478 E.00659
G1 X169.652 Y129.277 E.00661
G1 X175.649 Y135.275 E.26146
G2 X175.985 Y135.147 I-.892 J-2.849 E.0111
G1 X176.032 Y135.122 E.00162
G1 X169.799 Y128.889 E.27173
G3 X169.973 Y128.528 I1.61 J.553 E.01238
G1 X176.383 Y134.938 E.27944
G2 X176.64 Y134.802 I-.992 J-2.194 E.00898
G1 X176.724 Y134.744 E.00314
G1 X170.181 Y128.202 E.28524
G1 X170.4 Y127.885 E.01186
G1 X177.033 Y134.518 E.28918
G1 X177.317 Y134.267 E.01168
G1 X170.644 Y127.594 E.2909
G3 X170.919 Y127.334 I1.238 J1.031 E.01169
G1 X177.591 Y134.007 E.2909
G2 X177.791 Y133.781 I-1.764 J-1.759 E.0093
G1 X177.836 Y133.716 E.00243
G1 X171.203 Y127.083 E.28918
G3 X171.512 Y126.857 I1.113 J1.198 E.01183
G1 X178.054 Y133.4 E.28524
G2 X178.211 Y133.172 I-1.805 J-1.409 E.00853
G1 X178.263 Y133.073 E.00343
G1 X171.853 Y126.663 E.27944
G1 X172.204 Y126.479 E.01222
G1 X178.437 Y132.712 E.27173
G1 X178.584 Y132.324 E.01279
G1 X172.586 Y126.327 E.26146
G3 X173.011 Y126.216 I.689 J1.779 E.01355
G1 X178.711 Y131.916 E.24848
G2 X178.788 Y131.459 I-1.877 J-.555 E.01433
G1 X173.45 Y126.121 E.23272
G3 X173.752 Y126.085 I.449 J2.474 E.00936
G1 X173.949 Y126.085 E.00609
G1 X178.844 Y130.979 E.21339
G2 X178.843 Y130.596 I-3.179 J-.188 E.01184
G1 X178.823 Y130.423 E.00536
G1 X174.484 Y126.085 E.18913
G3 X175.127 Y126.192 I-.473 J4.798 E.0201
G1 X178.741 Y129.806 E.15755
G2 X178.48 Y129.011 I-3.335 J.652 E.02587
G1 X175.886 Y126.417 E.11308
G1 X175.978 Y126.452 E.00303
G3 X176.634 Y126.795 I-2.512 J5.59 E.02282
G3 X176.965 Y127.023 I-1.724 J2.858 E.01241
G3 X178.363 Y128.358 I-13.263 J15.287 E.0596
G1 X182.541 Y124.749 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5434
G1 X184.17 Y124.749 E.05401
G1 X179.138 Y129.78 E.23605
G3 X179.074 Y132.081 I-5.166 J1.007 E.07695
G1 X184.17 Y137.177 E.23906
G1 X184.17 Y140.101 E.097
G1 X179.418 Y144.853 E.22292
G1 X176.494 Y144.853 E.097
G1 X164.066 Y132.425 E.58302
G1 X164.066 Y129.501 E.097
G1 X168.818 Y124.749 E.22292
G1 X171.742 Y124.749 E.097
G1 X172.846 Y125.853 E.05181
G3 X175.389 Y125.853 I1.272 J4.956 E.08525
G1 X176.494 Y124.749 E.05181
G1 X179.418 Y124.749 E.097
G1 X184.17 Y129.501 E.22292
G1 X184.17 Y132.425 E.097
G1 X171.742 Y144.853 E.58302
G1 X168.818 Y144.853 E.097
G1 X164.066 Y140.101 E.22292
G1 X164.066 Y137.177 E.097
G1 X169.162 Y132.081 E.23906
G3 X169.098 Y129.781 I5.094 J-1.293 E.07694
G1 X164.066 Y124.749 E.23606
G1 X165.694 Y124.749 E.05401
G1 X165.694 Y144.853 F30000
G1 F5434
G1 X164.066 Y144.853 E.05401
G1 X173.106 Y135.812 E.4241
G2 X175.129 Y135.812 I1.012 J-5.256 E.06752
G1 X184.17 Y144.853 E.4241
G1 X182.541 Y144.853 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X184.17 Y144.853 E-.61876
G1 X183.907 Y144.59 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z4.2 I.57 J-1.075 P1  F30000
G1 X134.898 Y118.602 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F5377
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F5377
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.785 Y121.763 Z4.4 F30000
G1 X119.448 Y123.496 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5377
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X127.376 Y118.948 E.33325
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X127.948 Y126.052 E.3098
G1 X128.052 Y126.052 E.00344
G1 X120.948 Y118.948 E.33325
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X126.789 Y121.814 Z4.4 F30000
G1 X184.516 Y145.199 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F5377
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y134.801 E.34492
G1 X184.516 Y145.139 E.34293
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F5377
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
M73 P37 R17
G1 X184.908 Y134.801 E.33155
G1 X184.908 Y145.531 E.3297
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X182.541 Y144.853 Z4.4 F30000
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5377
G1 X184.17 Y144.853 E.05401
G1 X174.686 Y135.369 E.44489
G3 X173.549 Y135.369 I-.568 J-6.451 E.03775
G1 X164.066 Y144.853 E.44489
G1 X165.694 Y144.853 E.05401
G1 X178.051 Y132.734 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5377
G1 X176.075 Y134.71 E.08587
G1 X175.221 Y135.03
G1 X178.362 Y131.89 E.13647
G1 X178.466 Y131.252
G1 X174.558 Y135.161 E.16983
G1 X174.013 Y135.172
G1 X178.499 Y130.686 E.19492
G1 X178.448 Y130.203
G1 X173.511 Y135.14 E.21453
G1 X173.073 Y135.045
G1 X178.371 Y129.748 E.23018
G1 X178.24 Y129.345
G1 X172.654 Y134.931 E.24274
G1 X172.28 Y134.772
G1 X178.091 Y128.961 E.25253
G1 X177.912 Y128.607
G1 X171.93 Y134.589 E.25995
G1 X171.6 Y134.386
G1 X177.696 Y128.29 E.26491
G1 X177.472 Y127.98
G1 X171.304 Y134.148 E.26802
G1 X171.022 Y133.897
G1 X177.214 Y127.704 E.2691
G1 X176.932 Y127.454
G1 X170.764 Y133.622 E.26802
G1 X170.54 Y133.312
G1 X176.637 Y127.216 E.26492
G1 X176.306 Y127.013
G1 X170.322 Y132.997 E.26002
G1 X170.142 Y132.644
G1 X175.956 Y126.829 E.25266
G1 X175.582 Y126.67
G1 X169.995 Y132.257 E.24277
G1 X169.865 Y131.854
G1 X175.163 Y126.556 E.23021
G1 X174.725 Y126.461
G1 X169.787 Y131.399 E.21456
G1 X169.737 Y130.916
G1 X174.223 Y126.43 E.19495
G1 X173.679 Y126.441
G1 X169.769 Y130.35 E.16988
G1 X169.874 Y129.712
G1 X173.016 Y126.571 E.13653
G1 X172.162 Y126.891
G1 X170.184 Y128.869 E.08598
M204 S10000
G1 X171.244 Y127.512 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0989061
G1 F5377
G2 X170.709 Y128.046 I4.151 J4.685 E.00345
; WIPE_START
G1 F24000
G1 X171.244 Y127.512 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X176.739 Y132.809 Z4.4 F30000
G1 X177.52 Y133.562 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.0986234
G1 F5377
G3 X176.999 Y134.083 I-4.569 J-4.048 E.00335
; WIPE_START
G1 F24000
G1 X177.52 Y133.562 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X171.4 Y129.001 Z4.4 F30000
G1 X165.694 Y124.749 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5377
G1 X164.066 Y124.749 E.05401
G1 X169.559 Y130.241 E.25768
G2 X169.594 Y131.649 I4.054 J.603 E.04693
G1 X164.066 Y137.177 E.25932
G1 X164.066 Y140.101 E.097
G1 X168.818 Y144.853 E.22292
G1 X171.742 Y144.853 E.097
G1 X184.17 Y132.425 E.58302
G1 X184.17 Y129.501 E.097
G1 X179.418 Y124.749 E.22292
G1 X176.494 Y124.749 E.097
G1 X174.964 Y126.278 E.07176
G2 X173.272 Y126.278 I-.846 J5 E.05641
G1 X171.742 Y124.749 E.07176
G1 X168.818 Y124.749 E.097
G1 X164.066 Y129.501 E.22292
G1 X164.066 Y132.425 E.097
G1 X176.494 Y144.853 E.58302
G1 X179.418 Y144.853 E.097
G1 X184.17 Y140.101 E.22292
G1 X184.17 Y137.177 E.097
G1 X178.642 Y131.649 E.25932
G2 X178.677 Y130.241 I-4.019 J-.804 E.04693
G1 X184.17 Y124.749 E.25768
G1 X182.541 Y124.749 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X184.17 Y124.749 E-.61876
G1 X183.907 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z4.4 I.158 J-1.207 P1  F30000
G1 X134.898 Y118.602 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4279
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4279
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.631 Y120.508 Z4.6 F30000
G1 X119.448 Y120.828 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4279
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X128.052 Y126.052 E.33325
G1 X127.948 Y126.052 E.00344
G1 X134.552 Y119.448 E.3098
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X120.272 Y126.052 E.33325
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
M73 P37 R16
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.01 Y127.618 Z4.6 F30000
G1 X184.516 Y145.199 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4279
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y128.77 E.14487
G1 X184.516 Y145.139 E.54297
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4279
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y128.77 E.14624
G1 X184.908 Y145.531 E.515
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.378 Y139.394 Z4.6 F30000
G1 X173.415 Y132.664 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4279
G1 X173.344 Y132.644 E.00245
G1 X172.925 Y132.405 E.01599
G1 X172.576 Y132.073 E.01599
G1 X172.316 Y131.667 E.01599
G1 X172.161 Y131.211 E.01599
G1 X172.12 Y130.731 E.01599
G1 X172.195 Y130.255 E.01599
G1 X172.381 Y129.81 E.01599
G1 X172.669 Y129.423 E.01599
G1 X173.04 Y129.117 E.01599
G1 X173.475 Y128.908 E.01599
G1 X173.946 Y128.809 E.01599
G1 X174.428 Y128.826 E.01599
G1 X174.892 Y128.957 E.01599
G1 X175.31 Y129.196 E.01599
G1 X175.66 Y129.528 E.01599
G1 X175.91 Y129.918 E.01535
G1 X176.074 Y130.39 E.01661
G1 X176.12 Y130.801 E.01369
G1 X176.041 Y131.347 E.0183
G1 X175.854 Y131.791 E.01599
G1 X175.567 Y132.178 E.01599
G1 X175.195 Y132.485 E.01599
G1 X174.761 Y132.694 E.01599
G1 X174.289 Y132.793 E.01599
G1 X173.807 Y132.776 E.01599
G1 X173.472 Y132.681 E.01155
G1 X173.527 Y132.294 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4279
G3 X175.544 Y130.06 I.594 J-1.491 E.19001
G1 X175.685 Y130.438 E.01238
G1 X175.728 Y130.801 E.01123
G1 X175.674 Y131.208 E.01262
G3 X173.583 Y132.315 I-1.553 J-.405 E.08174
M204 S10000
; WIPE_START
G1 F24000
G1 X173.185 Y132.112 E-.16982
G1 X172.899 Y131.85 E-.14739
G1 X172.683 Y131.528 E-.14739
G1 X172.55 Y131.164 E-.14739
G1 X172.509 Y130.778 E-.14739
G1 X172.509 Y130.776 E-.00061
; WIPE_END
G1 E-.04 F1800
G1 X171.764 Y130.22 Z4.6 F30000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50368
G1 F4279
G1 X171.786 Y130.145 E.00293
G1 X182.541 Y124.749 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4279
G1 X184.17 Y124.749 E.05401
G1 X164.066 Y144.853 E.94311
G1 X164.066 Y140.101 E.15763
G1 X168.818 Y144.853 E.22292
G1 X171.742 Y144.853 E.097
G1 X184.17 Y132.425 E.58302
G1 X184.17 Y129.501 E.097
G1 X179.418 Y124.749 E.22292
G1 X176.494 Y124.749 E.097
G1 X171.464 Y129.779 E.23597
G2 X171.411 Y129.831 I0 J.053 E.00274
G1 X164.066 Y137.177 E.34458
G1 X164.066 Y132.425 E.15763
G1 X176.494 Y144.853 E.58302
G1 X179.418 Y144.853 E.097
G1 X184.17 Y140.101 E.22292
G1 X184.17 Y137.177 E.097
G1 X171.742 Y124.749 E.58302
G1 X168.818 Y124.749 E.097
G1 X164.066 Y129.501 E.22292
G1 X164.066 Y124.749 E.15763
G1 X184.17 Y144.853 E.94311
G1 X182.541 Y144.853 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X184.17 Y144.853 E-.61876
G1 X183.907 Y144.59 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z4.6 I.57 J-1.075 P1  F30000
G1 X134.898 Y118.602 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4293
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4293
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.785 Y121.763 Z4.8 F30000
G1 X119.448 Y123.496 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4293
M73 P38 R16
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X127.376 Y118.948 E.33325
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X127.948 Y126.052 E.3098
G1 X128.052 Y126.052 E.00344
G1 X120.948 Y118.948 E.33325
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X126.789 Y121.814 Z4.8 F30000
G1 X184.516 Y145.199 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4293
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y128.77 E.14487
G1 X184.516 Y145.139 E.54297
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4293
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y128.77 E.14624
G1 X184.908 Y145.531 E.515
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.378 Y139.394 Z4.8 F30000
G1 X173.415 Y132.664 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4293
G1 X173.344 Y132.644 E.00245
G1 X172.925 Y132.405 E.01599
G1 X172.576 Y132.073 E.01599
G1 X172.316 Y131.667 E.01599
G1 X172.161 Y131.211 E.01599
G1 X172.12 Y130.731 E.01599
G1 X172.195 Y130.255 E.01599
G1 X172.381 Y129.81 E.01599
G1 X172.669 Y129.423 E.01599
G1 X173.04 Y129.117 E.01599
G1 X173.475 Y128.908 E.01599
G1 X173.946 Y128.809 E.01599
G1 X174.428 Y128.826 E.01599
G1 X174.892 Y128.957 E.01599
G1 X175.31 Y129.196 E.01599
G1 X175.66 Y129.528 E.01599
G1 X175.919 Y129.934 E.01599
G1 X176.074 Y130.39 E.01599
G1 X176.12 Y130.801 E.01369
G1 X176.041 Y131.347 E.0183
G1 X175.854 Y131.791 E.01599
G1 X175.597 Y132.139 E.01435
G1 X175.195 Y132.485 E.01759
G1 X174.761 Y132.694 E.01599
G1 X174.289 Y132.793 E.01599
G1 X173.807 Y132.776 E.01599
G1 X173.472 Y132.681 E.01155
G1 X173.527 Y132.295 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4293
G3 X175.728 Y130.801 I.597 J-1.49 E.21341
G1 X175.674 Y131.208 E.01262
G1 X175.532 Y131.568 E.01192
G1 X175.331 Y131.852 E.01067
G1 X175.013 Y132.138 E.01314
G3 X173.901 Y132.395 I-.941 J-1.534 E.03568
G3 X173.583 Y132.317 I.222 J-1.589 E.0101
M204 S10000
; WIPE_START
G1 F24000
G1 X173.185 Y132.112 E-.16988
G1 X172.899 Y131.85 E-.14739
G1 X172.683 Y131.528 E-.14739
G1 X172.55 Y131.164 E-.14739
G1 X172.509 Y130.778 E-.14739
G1 X172.509 Y130.776 E-.00055
; WIPE_END
G1 E-.04 F1800
G1 X176.939 Y136.992 Z4.8 F30000
G1 X182.541 Y144.853 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4293
G1 X184.17 Y144.853 E.05401
G1 X164.066 Y124.749 E.94311
G1 X164.066 Y129.501 E.15763
G1 X168.818 Y124.749 E.22292
G1 X171.742 Y124.749 E.097
G1 X184.17 Y137.177 E.58302
G1 X184.17 Y140.101 E.097
G1 X179.418 Y144.853 E.22292
G1 X176.494 Y144.853 E.097
G1 X164.066 Y132.425 E.58302
G1 X164.066 Y137.177 E.15763
G1 X176.494 Y124.749 E.58302
G1 X179.418 Y124.749 E.097
G1 X184.17 Y129.501 E.22292
G1 X184.17 Y132.425 E.097
G1 X171.742 Y144.853 E.58302
G1 X168.818 Y144.853 E.097
G1 X164.066 Y140.101 E.22292
G1 X164.066 Y144.853 E.15763
G1 X184.17 Y124.749 E.94311
G1 X182.541 Y124.749 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X184.17 Y124.749 E-.61876
G1 X183.907 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z4.8 I.158 J-1.207 P1  F30000
G1 X134.898 Y118.602 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4276
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4276
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.631 Y120.508 Z5 F30000
G1 X119.448 Y120.828 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4276
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X128.052 Y126.052 E.33325
G1 X127.948 Y126.052 E.00344
G1 X134.552 Y119.448 E.3098
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X120.272 Y126.052 E.33325
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.01 Y127.618 Z5 F30000
G1 X184.516 Y145.199 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4276
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y128.77 E.14487
G1 X184.516 Y145.139 E.54297
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4276
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y128.77 E.14624
G1 X184.908 Y145.531 E.515
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.378 Y139.394 Z5 F30000
G1 X173.415 Y132.664 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4276
G1 X173.344 Y132.644 E.00245
G1 X172.925 Y132.405 E.01599
G1 X172.576 Y132.073 E.01599
G1 X172.316 Y131.667 E.01599
G1 X172.161 Y131.211 E.01599
G1 X172.12 Y130.731 E.01599
G1 X172.195 Y130.255 E.01599
G1 X172.381 Y129.81 E.01599
G1 X172.669 Y129.423 E.01599
G1 X173.04 Y129.117 E.01599
G1 X173.475 Y128.908 E.01599
G1 X173.946 Y128.809 E.01599
G1 X174.428 Y128.826 E.01599
G1 X174.892 Y128.957 E.01599
G1 X175.31 Y129.196 E.01599
G1 X175.66 Y129.528 E.01599
G1 X175.919 Y129.934 E.01599
G1 X176.074 Y130.39 E.01599
G1 X176.12 Y130.801 E.01369
G1 X176.041 Y131.347 E.0183
G1 X175.854 Y131.791 E.01599
G1 X175.567 Y132.178 E.01599
G1 X175.195 Y132.485 E.01599
G1 X174.761 Y132.694 E.01599
G1 X174.289 Y132.793 E.01599
G1 X173.807 Y132.776 E.01599
G1 X173.472 Y132.681 E.01155
G1 X173.527 Y132.295 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4276
G3 X175.728 Y130.801 I.597 J-1.49 E.21341
G3 X173.901 Y132.395 I-1.634 J-.028 E.08394
G3 X173.583 Y132.317 I.222 J-1.589 E.0101
M204 S10000
; WIPE_START
G1 F24000
G1 X173.185 Y132.112 E-.16988
G1 X172.899 Y131.85 E-.14739
G1 X172.683 Y131.528 E-.14739
G1 X172.55 Y131.164 E-.14739
G1 X172.509 Y130.778 E-.14739
G1 X172.509 Y130.776 E-.00055
; WIPE_END
M73 P39 R16
G1 E-.04 F1800
G1 X179.052 Y126.846 Z5 F30000
G1 X182.541 Y124.749 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4276
G1 X184.17 Y124.749 E.05401
G1 X164.066 Y144.853 E.94311
G1 X164.066 Y140.101 E.15763
G1 X168.818 Y144.853 E.22292
G1 X171.742 Y144.853 E.097
G1 X184.17 Y132.425 E.58302
G1 X184.17 Y129.501 E.097
G1 X179.418 Y124.749 E.22292
G1 X176.494 Y124.749 E.097
G1 X164.066 Y137.177 E.58302
G1 X164.066 Y132.425 E.15763
G1 X176.494 Y144.853 E.58302
G1 X179.418 Y144.853 E.097
G1 X184.17 Y140.101 E.22292
G1 X184.17 Y137.177 E.097
G1 X171.742 Y124.749 E.58302
G1 X168.818 Y124.749 E.097
G1 X164.066 Y129.501 E.22292
G1 X164.066 Y124.749 E.15763
G1 X184.17 Y144.853 E.94311
G1 X182.541 Y144.853 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X184.17 Y144.853 E-.61876
G1 X183.907 Y144.59 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z5 I.57 J-1.075 P1  F30000
G1 X134.898 Y118.602 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4292
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4292
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.785 Y121.763 Z5.2 F30000
G1 X119.448 Y123.496 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4292
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X127.376 Y118.948 E.33325
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X127.948 Y126.052 E.3098
G1 X128.052 Y126.052 E.00344
G1 X120.948 Y118.948 E.33325
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X126.789 Y121.814 Z5.2 F30000
G1 X184.516 Y145.199 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4292
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y128.77 E.14487
G1 X184.516 Y145.139 E.54297
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4292
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y128.77 E.14624
G1 X184.908 Y145.531 E.515
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.378 Y139.394 Z5.2 F30000
G1 X173.415 Y132.664 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4292
G1 X173.344 Y132.644 E.00245
G1 X172.925 Y132.405 E.01599
G1 X172.576 Y132.073 E.01599
G1 X172.316 Y131.667 E.01599
G1 X172.161 Y131.211 E.01599
G1 X172.12 Y130.731 E.01599
G1 X172.195 Y130.255 E.01599
G1 X172.381 Y129.81 E.01599
G1 X172.669 Y129.423 E.01599
G1 X173.04 Y129.117 E.01599
G1 X173.475 Y128.908 E.01599
G1 X173.946 Y128.809 E.01599
G1 X174.428 Y128.826 E.01599
G1 X174.892 Y128.957 E.01599
G1 X175.31 Y129.196 E.01599
G1 X175.66 Y129.528 E.01599
G1 X175.919 Y129.934 E.01599
G1 X176.074 Y130.39 E.01599
G1 X176.12 Y130.801 E.01369
G1 X176.041 Y131.347 E.0183
G1 X175.854 Y131.791 E.01599
G1 X175.567 Y132.178 E.01599
G1 X175.195 Y132.485 E.01599
G1 X174.761 Y132.694 E.01599
G1 X174.289 Y132.793 E.01599
G1 X173.807 Y132.776 E.01599
G1 X173.472 Y132.681 E.01155
G1 X173.527 Y132.295 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4292
G3 X175.728 Y130.801 I.597 J-1.49 E.21341
G3 X173.901 Y132.395 I-1.634 J-.028 E.08394
G3 X173.583 Y132.317 I.222 J-1.589 E.0101
M204 S10000
; WIPE_START
G1 F24000
G1 X173.185 Y132.112 E-.16988
G1 X172.899 Y131.85 E-.14739
G1 X172.683 Y131.528 E-.14739
G1 X172.55 Y131.164 E-.14739
G1 X172.509 Y130.778 E-.14739
G1 X172.509 Y130.776 E-.00056
; WIPE_END
G1 E-.04 F1800
G1 X173.37 Y124.749 Z5.2 F30000
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4292
G1 X171.742 Y124.749 E.05401
G1 X184.17 Y137.177 E.58302
G1 X184.17 Y140.101 E.097
G1 X179.418 Y144.853 E.22292
G1 X176.494 Y144.853 E.097
G1 X164.066 Y132.425 E.58302
G1 X164.066 Y129.501 E.097
G1 X168.818 Y124.749 E.22292
G1 X164.066 Y124.749 E.15763
G1 X184.17 Y144.853 E.94311
G1 X182.541 Y144.853 E.05401
G1 X164.066 Y135.548 F30000
G1 F4292
G1 X164.066 Y137.177 E.05401
G1 X176.494 Y124.749 E.58302
G1 X179.418 Y124.749 E.097
G1 X184.17 Y129.501 E.22292
G1 X184.17 Y132.425 E.097
G1 X171.742 Y144.853 E.58302
G1 X168.818 Y144.853 E.097
G1 X164.066 Y140.101 E.22292
G1 X164.066 Y144.853 E.15763
G1 X184.17 Y124.749 E.94311
G1 X182.541 Y124.749 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X184.17 Y124.749 E-.61876
G1 X183.907 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z5.2 I.158 J-1.207 P1  F30000
G1 X134.898 Y118.602 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4282
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4282
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.631 Y120.508 Z5.4 F30000
G1 X119.448 Y120.828 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4282
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X128.052 Y126.052 E.33325
G1 X127.948 Y126.052 E.00344
G1 X134.552 Y119.448 E.3098
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X120.272 Y126.052 E.33325
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.01 Y127.618 Z5.4 F30000
G1 X184.516 Y145.199 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4282
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y128.77 E.14487
G1 X184.516 Y145.139 E.54297
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4282
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y128.77 E.14624
G1 X184.908 Y145.531 E.515
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.378 Y139.394 Z5.4 F30000
G1 X173.415 Y132.664 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4282
G1 X173.344 Y132.644 E.00245
G1 X172.925 Y132.405 E.01599
G1 X172.576 Y132.073 E.01599
G1 X172.316 Y131.667 E.01599
G1 X172.161 Y131.211 E.01599
G1 X172.12 Y130.731 E.01599
G1 X172.195 Y130.255 E.01599
G1 X172.381 Y129.81 E.01599
G1 X172.669 Y129.423 E.01599
G1 X173.04 Y129.117 E.01599
G1 X173.475 Y128.908 E.01599
G1 X173.946 Y128.809 E.01599
G1 X174.428 Y128.826 E.01599
G1 X174.892 Y128.957 E.01599
G1 X175.31 Y129.196 E.01599
G1 X175.66 Y129.528 E.01599
G1 X175.919 Y129.934 E.01599
G1 X176.074 Y130.39 E.01599
G1 X176.12 Y130.801 E.01369
G1 X176.041 Y131.347 E.0183
G1 X175.854 Y131.791 E.01599
G1 X175.567 Y132.178 E.01599
G1 X175.195 Y132.485 E.01599
G1 X174.761 Y132.694 E.01599
G1 X174.289 Y132.793 E.01599
G1 X173.807 Y132.776 E.01599
G1 X173.472 Y132.681 E.01155
M73 P40 R16
G1 X173.527 Y132.295 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4282
G3 X175.728 Y130.801 I.597 J-1.49 E.21341
G3 X173.901 Y132.395 I-1.634 J-.028 E.08394
G3 X173.583 Y132.317 I.222 J-1.589 E.0101
M204 S10000
; WIPE_START
G1 F24000
G1 X173.185 Y132.112 E-.16988
G1 X172.899 Y131.85 E-.14739
G1 X172.683 Y131.528 E-.14739
G1 X172.55 Y131.164 E-.14739
G1 X172.509 Y130.778 E-.14739
G1 X172.509 Y130.776 E-.00055
; WIPE_END
G1 E-.04 F1800
G1 X169.183 Y137.646 Z5.4 F30000
G1 X165.694 Y144.853 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4282
G1 X164.066 Y144.853 E.05401
G1 X184.17 Y124.749 E.94311
G1 X184.17 Y129.501 E.15763
G1 X179.418 Y124.749 E.22292
G1 X176.494 Y124.749 E.097
G1 X164.066 Y137.177 E.58302
G1 X164.066 Y140.101 E.097
G1 X168.818 Y144.853 E.22292
G1 X171.742 Y144.853 E.097
G1 X184.17 Y132.425 E.58302
G1 X184.17 Y134.053 E.05401
G1 X182.541 Y144.853 F30000
G1 F4282
G1 X184.17 Y144.853 E.05401
G1 X164.066 Y124.749 E.94311
G1 X168.818 Y124.749 E.15763
G1 X164.066 Y129.501 E.22292
G1 X164.066 Y132.425 E.097
G1 X176.494 Y144.853 E.58302
G1 X179.418 Y144.853 E.097
G1 X184.17 Y140.101 E.22292
G1 X184.17 Y137.177 E.097
G1 X171.742 Y124.749 E.58302
G1 X173.37 Y124.749 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X171.742 Y124.749 E-.61876
G1 X172.005 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z5.4 I.207 J-1.199 P1  F30000
G1 X134.898 Y118.602 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4272
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4272
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.785 Y121.763 Z5.6 F30000
G1 X119.448 Y123.496 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4272
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X127.376 Y118.948 E.33325
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X127.948 Y126.052 E.3098
G1 X128.052 Y126.052 E.00344
G1 X120.948 Y118.948 E.33325
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X126.789 Y121.814 Z5.6 F30000
G1 X184.516 Y145.199 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4272
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y128.77 E.14487
G1 X184.516 Y145.139 E.54297
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4272
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y128.77 E.14624
G1 X184.908 Y145.531 E.515
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.378 Y139.394 Z5.6 F30000
G1 X173.415 Y132.664 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4272
G1 X173.344 Y132.644 E.00245
G1 X172.925 Y132.405 E.01599
G1 X172.576 Y132.073 E.01599
G1 X172.316 Y131.667 E.01599
G1 X172.161 Y131.211 E.01599
G1 X172.12 Y130.731 E.01599
G1 X172.195 Y130.255 E.01599
G1 X172.381 Y129.81 E.01599
G1 X172.669 Y129.423 E.01599
G1 X173.04 Y129.117 E.01599
G1 X173.475 Y128.908 E.01599
G1 X173.946 Y128.809 E.01599
G1 X174.428 Y128.826 E.01599
G1 X174.892 Y128.957 E.01599
G1 X175.31 Y129.196 E.01599
G1 X175.66 Y129.528 E.01599
G3 X176.044 Y130.262 I-2.206 J1.622 E.02758
G1 X176.12 Y130.801 E.01804
G1 X176.041 Y131.347 E.0183
G1 X175.854 Y131.791 E.01599
G1 X175.666 Y132.048 E.01057
G1 X175.268 Y132.44 E.01853
G1 X174.825 Y132.674 E.01663
G1 X174.289 Y132.793 E.01819
G1 X173.807 Y132.776 E.01599
G1 X173.472 Y132.681 E.01155
G1 X173.528 Y132.291 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4272
G3 X175.337 Y129.751 I.596 J-1.489 E.17832
G1 X175.476 Y129.958 E.00767
G1 X175.685 Y130.438 E.01608
G1 X175.728 Y130.801 E.01123
G1 X175.674 Y131.208 E.01262
G1 X175.532 Y131.568 E.01192
G1 X175.388 Y131.772 E.00767
G1 X175.013 Y132.138 E.01608
G3 X173.584 Y132.312 I-.888 J-1.336 E.04586
M204 S10000
; WIPE_START
G1 F24000
G1 X173.185 Y132.112 E-.16974
G1 X172.899 Y131.85 E-.14739
G1 X172.683 Y131.528 E-.14739
G1 X172.55 Y131.164 E-.14739
G1 X172.509 Y130.778 E-.14739
G1 X172.509 Y130.776 E-.0007
; WIPE_END
G1 E-.04 F1800
G1 X176.939 Y136.992 Z5.6 F30000
G1 X182.541 Y144.853 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4272
G1 X184.17 Y144.853 E.05401
G1 X164.066 Y124.749 E.94311
G1 X164.066 Y129.501 E.15763
G1 X168.818 Y124.749 E.22292
G1 X171.742 Y124.749 E.097
G1 X184.17 Y137.177 E.58302
G1 X184.17 Y140.101 E.097
G1 X179.418 Y144.853 E.22292
G1 X176.494 Y144.853 E.097
G1 X164.066 Y132.425 E.58302
G1 X164.066 Y137.177 E.15763
G1 X176.494 Y124.749 E.58302
G1 X179.418 Y124.749 E.097
G1 X184.17 Y129.501 E.22292
G1 X184.17 Y132.425 E.097
G1 X171.742 Y144.853 E.58302
G1 X168.818 Y144.853 E.097
G1 X164.066 Y140.101 E.22292
G1 X164.066 Y144.853 E.15763
G1 X184.17 Y124.749 E.94311
G1 X182.541 Y124.749 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X184.17 Y124.749 E-.61876
G1 X183.907 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z5.6 I.158 J-1.207 P1  F30000
G1 X134.898 Y118.602 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4276
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4276
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.631 Y120.508 Z5.8 F30000
G1 X119.448 Y120.828 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4276
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X128.052 Y126.052 E.33325
G1 X127.948 Y126.052 E.00344
G1 X134.552 Y119.448 E.3098
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X120.272 Y126.052 E.33325
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.01 Y127.618 Z5.8 F30000
G1 X184.516 Y145.199 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4276
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y128.77 E.14487
G1 X184.516 Y145.139 E.54297
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4276
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y128.77 E.14624
G1 X184.908 Y145.531 E.515
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.378 Y139.394 Z5.8 F30000
G1 X173.415 Y132.664 Z5.8
G1 Z5.4
M73 P41 R16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4276
G1 X173.344 Y132.644 E.00245
G1 X172.925 Y132.405 E.01599
G1 X172.576 Y132.073 E.01599
G1 X172.316 Y131.667 E.01599
G1 X172.161 Y131.211 E.01599
G1 X172.12 Y130.731 E.01599
G1 X172.195 Y130.255 E.01599
G1 X172.381 Y129.81 E.01599
G1 X172.669 Y129.423 E.01599
G1 X173.04 Y129.117 E.01599
G1 X173.475 Y128.908 E.01599
G1 X173.946 Y128.809 E.01599
G1 X174.428 Y128.826 E.01599
G1 X174.892 Y128.957 E.01599
G1 X175.31 Y129.196 E.01599
G1 X175.66 Y129.528 E.01599
G1 X175.919 Y129.934 E.01599
G1 X176.074 Y130.39 E.01599
G1 X176.116 Y130.871 E.01599
G1 X176.041 Y131.347 E.01599
G1 X175.854 Y131.791 E.01599
G1 X175.567 Y132.178 E.01599
G1 X175.31 Y132.405 E.01137
G1 X174.825 Y132.674 E.01842
G1 X174.289 Y132.793 E.01819
G1 X173.807 Y132.776 E.01599
G1 X173.472 Y132.681 E.01155
G1 X173.527 Y132.295 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4276
G3 X175.05 Y132.112 I.594 J-1.489 E.26033
G1 X174.667 Y132.313 E.0133
G3 X173.583 Y132.316 I-.546 J-1.507 E.03399
M204 S10000
; WIPE_START
G1 F24000
G1 X173.185 Y132.112 E-.16986
G1 X172.899 Y131.85 E-.14739
G1 X172.683 Y131.528 E-.14739
G1 X172.55 Y131.164 E-.14739
G1 X172.509 Y130.778 E-.14739
G1 X172.509 Y130.776 E-.00057
; WIPE_END
G1 E-.04 F1800
M73 P41 R15
G1 X179.052 Y126.846 Z5.8 F30000
G1 X182.541 Y124.749 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4276
G1 X184.17 Y124.749 E.05401
G1 X164.066 Y144.853 E.94311
G1 X164.066 Y140.101 E.15763
G1 X168.818 Y144.853 E.22292
G1 X171.742 Y144.853 E.097
G1 X184.17 Y132.425 E.58302
G1 X184.17 Y129.501 E.097
G1 X179.418 Y124.749 E.22292
G1 X176.494 Y124.749 E.097
G1 X164.066 Y137.177 E.58302
G1 X164.066 Y132.425 E.15763
G1 X176.494 Y144.853 E.58302
G1 X179.418 Y144.853 E.097
G1 X184.17 Y140.101 E.22292
G1 X184.17 Y137.177 E.097
G1 X171.742 Y124.749 E.58302
G1 X168.818 Y124.749 E.097
G1 X164.066 Y129.501 E.22292
G1 X164.066 Y124.749 E.15763
G1 X184.17 Y144.853 E.94311
G1 X182.541 Y144.853 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X184.17 Y144.853 E-.61876
G1 X183.907 Y144.59 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z5.8 I.57 J-1.075 P1  F30000
G1 X134.898 Y118.602 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4296
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4296
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.785 Y121.763 Z6 F30000
G1 X119.448 Y123.496 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4296
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X127.376 Y118.948 E.33325
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X127.948 Y126.052 E.3098
G1 X128.052 Y126.052 E.00344
G1 X120.948 Y118.948 E.33325
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X126.789 Y121.814 Z6 F30000
G1 X184.516 Y145.199 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4296
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y128.77 E.14487
G1 X184.516 Y145.139 E.54297
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4296
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y128.77 E.14624
G1 X184.908 Y145.531 E.515
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.378 Y139.394 Z6 F30000
G1 X173.415 Y132.664 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4296
G1 X173.344 Y132.644 E.00245
G1 X172.925 Y132.405 E.01599
G1 X172.576 Y132.073 E.01599
G1 X172.316 Y131.667 E.01599
G1 X172.161 Y131.211 E.01599
G1 X172.12 Y130.731 E.01599
G1 X172.195 Y130.255 E.01599
G1 X172.381 Y129.81 E.01599
G1 X172.669 Y129.423 E.01599
G1 X173.04 Y129.117 E.01599
G1 X173.475 Y128.908 E.01599
G1 X173.946 Y128.809 E.01599
G1 X174.428 Y128.826 E.01599
G1 X174.892 Y128.957 E.01599
G1 X175.31 Y129.196 E.01599
G1 X175.66 Y129.528 E.01599
G1 X175.919 Y129.934 E.01599
G1 X176.074 Y130.39 E.01599
G1 X176.12 Y130.801 E.01369
G1 X176.041 Y131.347 E.0183
G1 X175.854 Y131.791 E.01599
G1 X175.567 Y132.178 E.01599
G1 X175.195 Y132.485 E.01599
G1 X174.761 Y132.694 E.01599
G1 X174.289 Y132.793 E.01599
G1 X173.807 Y132.776 E.01599
G1 X173.472 Y132.681 E.01155
G1 X173.527 Y132.295 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4296
G3 X175.728 Y130.801 I.597 J-1.49 E.21341
G3 X173.901 Y132.395 I-1.634 J-.028 E.08394
G3 X173.583 Y132.317 I.222 J-1.589 E.0101
M204 S10000
; WIPE_START
G1 F24000
G1 X173.185 Y132.112 E-.16988
G1 X172.899 Y131.85 E-.14739
G1 X172.683 Y131.528 E-.14739
G1 X172.55 Y131.164 E-.14739
G1 X172.509 Y130.778 E-.14739
G1 X172.509 Y130.776 E-.00055
; WIPE_END
G1 E-.04 F1800
G1 X176.473 Y130.221 Z6 F30000
G1 Z5.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50047
G1 F4296
G1 X176.453 Y130.141 E.00306
G1 X182.541 Y144.853 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4296
G1 X184.17 Y144.853 E.05401
G1 X164.066 Y124.749 E.94311
G1 X164.066 Y129.501 E.15763
G1 X168.818 Y124.749 E.22292
G1 X171.742 Y124.749 E.097
G1 X176.772 Y129.779 E.23597
G3 X176.824 Y129.831 I0 J.053 E.00274
G1 X184.17 Y137.177 E.34458
G1 X184.17 Y140.101 E.097
G1 X179.418 Y144.853 E.22292
G1 X176.494 Y144.853 E.097
G1 X164.066 Y132.425 E.58302
G1 X164.066 Y137.177 E.15763
G1 X176.494 Y124.749 E.58302
G1 X179.418 Y124.749 E.097
G1 X184.17 Y129.501 E.22292
G1 X184.17 Y132.425 E.097
G1 X171.742 Y144.853 E.58302
G1 X168.818 Y144.853 E.097
G1 X164.066 Y140.101 E.22292
G1 X164.066 Y144.853 E.15763
G1 X184.17 Y124.749 E.94311
G1 X182.541 Y124.749 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X184.17 Y124.749 E-.61876
G1 X183.907 Y125.012 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z6 I.158 J-1.207 P1  F30000
G1 X134.898 Y118.602 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F5132
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F5132
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.631 Y120.508 Z6.2 F30000
G1 X119.448 Y120.828 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5132
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X128.052 Y126.052 E.33325
G1 X127.948 Y126.052 E.00344
G1 X134.552 Y119.448 E.3098
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X120.272 Y126.052 E.33325
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.01 Y127.618 Z6.2 F30000
M73 P42 R15
G1 X184.516 Y145.199 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F5132
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y128.77 E.14487
G1 X184.516 Y145.139 E.54297
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F5132
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y128.77 E.14624
G1 X184.908 Y145.531 E.515
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.379 Y139.393 Z6.2 F30000
G1 X173.419 Y132.666 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F5132
G1 X173.351 Y132.648 E.00234
G1 X172.925 Y132.405 E.01626
G1 X172.576 Y132.073 E.01599
G1 X172.316 Y131.667 E.01599
G1 X172.161 Y131.211 E.01599
G1 X172.12 Y130.731 E.01599
G1 X172.195 Y130.255 E.01599
G1 X172.381 Y129.81 E.01599
G1 X172.669 Y129.423 E.01599
G1 X173.04 Y129.117 E.01599
G1 X173.475 Y128.908 E.01599
G1 X173.946 Y128.809 E.01599
G1 X174.428 Y128.826 E.01599
G1 X174.892 Y128.957 E.01599
G1 X175.31 Y129.196 E.01599
G1 X175.66 Y129.528 E.01599
G1 X175.919 Y129.934 E.01599
G1 X176.074 Y130.39 E.01599
G1 X176.116 Y130.871 E.01599
G1 X176.041 Y131.347 E.01599
G1 X175.854 Y131.791 E.01599
G1 X175.567 Y132.178 E.01599
G1 X175.195 Y132.485 E.01599
G1 X174.761 Y132.694 E.01599
G1 X174.289 Y132.793 E.01599
G1 X173.876 Y132.788 E.0137
G1 X173.477 Y132.682 E.0137
G1 X173.528 Y132.292 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F5132
G3 X172.561 Y130.394 I.621 J-1.511 E.07131
G3 X173.924 Y132.399 I1.551 J.412 E.22536
G3 X173.584 Y132.314 I.225 J-1.618 E.01079
M204 S10000
; WIPE_START
G1 F24000
G1 X173.185 Y132.112 E-.16978
G1 X172.899 Y131.85 E-.14739
G1 X172.683 Y131.528 E-.14739
G1 X172.55 Y131.164 E-.14739
G1 X172.509 Y130.778 E-.14739
G1 X172.509 Y130.776 E-.00065
; WIPE_END
G1 E-.04 F1800
G1 X173.788 Y128.476 Z6.2 F30000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5132
G1 X173.747 Y128.486 E.00141
G2 X173.848 Y128.471 I.398 J2.309 E.48505
G1 X173.27 Y124.749 F30000
G1 F5132
G1 X184.17 Y124.749 E.36155
G1 X184.17 Y144.853 E.66688
G1 X181.557 Y144.853 E.08668
G1 X181.557 Y137.612 E.24019
G1 X166.679 Y137.612 E.49352
G1 X166.679 Y144.853 E.24019
G1 X164.066 Y144.853 E.08668
G1 X164.066 Y124.749 E.66688
G1 X173.21 Y124.749 E.30334
G1 X183.763 Y126.784 F30000
G1 F5132
G1 X183.763 Y125.156 E.05401
G1 X171.714 Y137.205 E.56524
G1 X168.846 Y137.205 E.09513
G1 X164.473 Y132.832 E.20514
G1 X164.473 Y129.094 E.124
G1 X168.411 Y125.156 E.18473
G1 X172.149 Y125.156 E.12401
G1 X175.33 Y128.337 E.14922
G3 X176.593 Y129.6 I-1.197 J2.46 E.06036
G1 X183.763 Y136.769 E.33635
G1 X183.763 Y140.508 E.124
G1 X181.964 Y142.307 E.08439
G1 X181.964 Y142.647 E.01128
G1 X183.763 Y144.445 E.08439
G1 X183.763 Y142.817 E.05401
G1 X173.37 Y144.853 F30000
G1 F5132
G1 X171.742 Y144.853 E.05401
G1 X178.576 Y138.019 E.32058
G1 X177.336 Y138.019 E.04112
G1 X181.15 Y141.832 E.1789
G1 X181.15 Y143.121 E.04274
G1 X179.418 Y144.853 E.08124
G1 X176.494 Y144.853 E.097
G1 X169.66 Y138.019 E.32058
G1 X170.9 Y138.019 E.04112
G1 X167.086 Y141.832 E.1789
G1 X167.086 Y143.121 E.04274
G1 X168.818 Y144.853 E.08124
G1 X167.189 Y144.853 E.05401
G1 X164.473 Y142.817 F30000
G1 F5132
G1 X164.473 Y144.445 E.05401
G1 X166.272 Y142.647 E.08439
G1 X166.272 Y142.307 E.01128
G1 X164.473 Y140.508 E.08439
G1 X164.473 Y136.769 E.124
G1 X171.643 Y129.6 E.33635
G3 X172.906 Y128.337 I2.7 J1.437 E.06013
G1 X176.087 Y125.156 E.14922
G1 X179.825 Y125.156 E.12401
G1 X183.763 Y129.094 E.18473
G1 X183.763 Y132.832 E.124
G1 X179.39 Y137.205 E.20514
G1 X176.522 Y137.205 E.09513
G1 X164.473 Y125.156 E.56524
G1 X164.473 Y126.784 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X164.473 Y125.156 E-.61876
G1 X164.736 Y125.419 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z6.2 I.271 J-1.186 P1  F30000
G1 X134.898 Y118.602 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F5102
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F5102
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.785 Y121.763 Z6.4 F30000
G1 X119.448 Y123.496 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5102
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X127.376 Y118.948 E.33325
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X127.948 Y126.052 E.3098
G1 X128.052 Y126.052 E.00344
G1 X120.948 Y118.948 E.33325
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X126.789 Y121.814 Z6.4 F30000
G1 X184.516 Y145.199 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F5102
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y128.77 E.14487
G1 X184.516 Y145.139 E.54297
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F5102
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y128.77 E.14624
G1 X184.908 Y145.531 E.515
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.378 Y139.394 Z6.4 F30000
G1 X173.415 Y132.664 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F5102
G1 X173.344 Y132.644 E.00245
G1 X172.925 Y132.405 E.01599
G1 X172.576 Y132.073 E.01599
G1 X172.316 Y131.667 E.01599
G1 X172.161 Y131.211 E.01599
G1 X172.12 Y130.731 E.01599
G1 X172.195 Y130.255 E.01599
G1 X172.381 Y129.81 E.01599
G1 X172.57 Y129.553 E.01057
G1 X173.04 Y129.117 E.0213
G1 X173.475 Y128.908 E.01599
G1 X173.946 Y128.809 E.01599
G1 X174.428 Y128.826 E.01599
G1 X174.892 Y128.957 E.01599
G1 X175.31 Y129.196 E.01599
G1 X175.66 Y129.528 E.01599
G1 X175.919 Y129.934 E.01599
G1 X176.074 Y130.39 E.01599
G1 X176.12 Y130.801 E.01369
G1 X176.041 Y131.347 E.0183
G1 X175.854 Y131.791 E.01599
G1 X175.567 Y132.178 E.01599
G1 X175.195 Y132.485 E.01599
G1 X174.761 Y132.694 E.01599
G1 X174.289 Y132.793 E.01599
G1 X173.807 Y132.776 E.01599
G1 X173.472 Y132.681 E.01155
G1 X173.526 Y132.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F5102
G3 X172.704 Y130.033 I.592 J-1.496 E.08363
G1 X172.848 Y129.829 E.00767
G1 X173.223 Y129.464 E.01608
G3 X175.728 Y130.801 I.885 J1.358 E.10634
G1 X175.674 Y131.208 E.01262
G3 X173.582 Y132.318 I-1.557 J-.407 E.08179
M204 S10000
; WIPE_START
G1 F24000
G1 X173.185 Y132.112 E-.16992
G1 X172.899 Y131.85 E-.14739
G1 X172.683 Y131.528 E-.14739
G1 X172.55 Y131.164 E-.14739
G1 X172.509 Y130.778 E-.14739
G1 X172.509 Y130.777 E-.00051
; WIPE_END
G1 E-.04 F1800
G1 X173.788 Y128.476 Z6.4 F30000
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5102
G1 X173.578 Y128.527 E.00715
G2 X174.298 Y128.463 I.564 J2.269 E.46317
G2 X173.848 Y128.471 I-.179 J2.589 E.01495
G1 X171.879 Y124.749 F30000
G1 F5102
G1 X184.17 Y124.749 E.40772
G1 X184.17 Y144.853 E.66688
G1 X181.557 Y144.853 E.08668
G1 X181.557 Y137.612 E.24019
G1 X166.679 Y137.612 E.49352
G1 X166.679 Y144.853 E.24019
G1 X164.066 Y144.853 E.08668
G1 X164.066 Y124.749 E.66688
G1 X171.819 Y124.749 E.25717
G1 X164.473 Y126.784 F30000
G1 F5102
G1 X164.473 Y125.156 E.05401
G1 X176.522 Y137.205 E.56524
G1 X179.39 Y137.205 E.09513
G1 X183.763 Y132.832 E.20514
G1 X183.763 Y129.094 E.124
G1 X179.825 Y125.156 E.18473
G1 X176.087 Y125.156 E.12401
G1 X172.906 Y128.337 E.14922
G2 X171.643 Y129.6 I1.437 J2.7 E.06013
G1 X164.473 Y136.769 E.33635
G1 X164.473 Y140.508 E.124
G1 X166.272 Y142.307 E.08439
G1 X166.272 Y142.647 E.01128
G1 X164.473 Y144.445 E.08439
G1 X164.473 Y142.817 E.05401
G1 X167.189 Y144.853 F30000
G1 F5102
G1 X168.818 Y144.853 E.05401
G1 X167.086 Y143.121 E.08124
G1 X167.086 Y141.832 E.04274
G1 X170.9 Y138.019 E.1789
G1 X169.66 Y138.019 E.04112
G1 X176.494 Y144.853 E.32058
G1 X179.418 Y144.853 E.097
G1 X181.15 Y143.121 E.08124
G1 X181.15 Y141.832 E.04274
G1 X177.336 Y138.019 E.1789
G1 X178.576 Y138.019 E.04112
G1 X171.742 Y144.853 E.32058
G1 X173.37 Y144.853 E.05401
G1 X183.763 Y142.817 F30000
G1 F5102
G1 X183.763 Y144.445 E.05401
G1 X181.964 Y142.647 E.08439
G1 X181.964 Y142.307 E.01128
G1 X183.763 Y140.508 E.08439
G1 X183.763 Y136.769 E.124
G1 X176.593 Y129.6 E.33635
G1 X176.512 Y129.446 E.00576
G2 X175.33 Y128.337 I-2.672 J1.664 E.05439
G1 X172.149 Y125.156 E.14922
G1 X168.411 Y125.156 E.12401
G1 X164.473 Y129.094 E.18473
G1 X164.473 Y132.832 E.124
M73 P43 R15
G1 X168.846 Y137.205 E.20514
G1 X171.714 Y137.205 E.09513
G1 X183.763 Y125.156 E.56524
G1 X183.763 Y126.784 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X183.763 Y125.156 E-.61876
G1 X183.5 Y125.419 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z6.4 I.169 J-1.205 P1  F30000
G1 X134.898 Y118.602 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F5131
G1 X134.898 Y126.398 E.2586
G1 X131 Y126.398 E.1293
G1 X119.102 Y126.398 E.39468
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F5131
G1 X135.29 Y126.79 E.26364
G1 X131 Y126.79 E.13182
G1 X118.71 Y126.79 E.37764
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.244 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.617 Y120.509 Z6.6 F30000
G1 X119.448 Y120.828 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5131
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X128.052 Y126.052 E.33325
G1 X127.948 Y126.052 E.00344
G1 X134.552 Y119.448 E.3098
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X120.272 Y126.052 E.33325
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.01 Y127.618 Z6.6 F30000
G1 X184.516 Y145.199 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F5131
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y128.77 E.14487
G1 X184.516 Y145.139 E.54297
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F5131
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y128.77 E.14624
G1 X184.908 Y145.531 E.515
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.378 Y139.394 Z6.6 F30000
G1 X173.415 Y132.664 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F5131
G1 X173.344 Y132.644 E.00245
G1 X172.925 Y132.405 E.01599
G1 X172.576 Y132.073 E.01599
G1 X172.316 Y131.667 E.01599
G1 X172.161 Y131.211 E.01599
G1 X172.12 Y130.731 E.01599
G1 X172.195 Y130.255 E.01599
G1 X172.381 Y129.81 E.01599
G1 X172.669 Y129.423 E.01599
G1 X173.04 Y129.117 E.01599
G1 X173.475 Y128.908 E.01599
G1 X173.946 Y128.809 E.01599
G1 X174.428 Y128.826 E.01599
G1 X174.762 Y128.918 E.01148
G1 X175.31 Y129.196 E.0204
G1 X175.66 Y129.528 E.01599
G1 X175.919 Y129.934 E.01599
G1 X176.074 Y130.39 E.01599
G1 X176.12 Y130.801 E.01369
G1 X176.041 Y131.347 E.0183
G1 X175.854 Y131.791 E.01599
G1 X175.567 Y132.178 E.01599
G1 X175.195 Y132.485 E.01599
G1 X174.761 Y132.694 E.01599
G1 X174.289 Y132.793 E.01599
G1 X173.807 Y132.776 E.01599
G1 X173.472 Y132.681 E.01155
G1 X173.53 Y132.287 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F5131
G3 X174.334 Y129.206 I.594 J-1.49 E.14267
G1 X174.599 Y129.275 E.00841
G1 X175.05 Y129.49 E.01535
G3 X175.728 Y130.801 I-.942 J1.318 E.04708
G1 X175.674 Y131.208 E.01262
G3 X173.586 Y132.308 I-1.551 J-.411 E.08151
M204 S10000
; WIPE_START
G1 F24000
G1 X173.185 Y132.112 E-.16962
G1 X172.899 Y131.85 E-.14739
G1 X172.683 Y131.528 E-.14739
G1 X172.55 Y131.164 E-.14739
G1 X172.509 Y130.778 E-.14739
G1 X172.509 Y130.776 E-.00081
; WIPE_END
G1 E-.04 F1800
G1 X173.788 Y128.476 Z6.6 F30000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5131
G1 X173.747 Y128.486 E.00141
G2 X173.848 Y128.471 I.398 J2.307 E.48459
G1 X173.27 Y124.749 F30000
G1 F5131
G1 X184.17 Y124.749 E.36155
G1 X184.17 Y144.853 E.66688
G1 X181.557 Y144.853 E.08668
G1 X181.557 Y137.612 E.24019
G1 X166.679 Y137.612 E.49352
G1 X166.679 Y144.853 E.24019
G1 X164.066 Y144.853 E.08668
G1 X164.066 Y124.749 E.66688
G1 X173.21 Y124.749 E.30334
G1 X183.763 Y126.784 F30000
G1 F5131
G1 X183.763 Y125.156 E.05401
G1 X171.714 Y137.205 E.56524
G1 X168.846 Y137.205 E.09513
G1 X164.473 Y132.832 E.20514
G1 X164.473 Y129.094 E.124
G1 X168.411 Y125.156 E.18473
G1 X172.149 Y125.156 E.12401
G1 X175.33 Y128.337 E.14922
G3 X176.593 Y129.6 I-1.197 J2.46 E.06036
G1 X183.763 Y136.769 E.33635
G1 X183.763 Y140.508 E.124
G1 X181.964 Y142.307 E.08439
G1 X181.964 Y142.647 E.01128
G1 X183.763 Y144.445 E.08439
G1 X183.763 Y142.817 E.05401
G1 X173.37 Y144.853 F30000
G1 F5131
G1 X171.742 Y144.853 E.05401
G1 X178.576 Y138.019 E.32058
G1 X177.336 Y138.019 E.04112
G1 X181.15 Y141.832 E.1789
G1 X181.15 Y143.121 E.04274
G1 X179.418 Y144.853 E.08124
G1 X176.494 Y144.853 E.097
G1 X169.66 Y138.019 E.32058
G1 X170.9 Y138.019 E.04112
G1 X167.086 Y141.832 E.1789
G1 X167.086 Y143.121 E.04274
G1 X168.818 Y144.853 E.08124
G1 X167.189 Y144.853 E.05401
G1 X164.473 Y142.817 F30000
G1 F5131
G1 X164.473 Y144.445 E.05401
G1 X166.272 Y142.647 E.08439
G1 X166.272 Y142.307 E.01128
G1 X164.473 Y140.508 E.08439
G1 X164.473 Y136.769 E.124
G1 X171.643 Y129.6 E.33635
G3 X172.906 Y128.337 I2.7 J1.437 E.06013
G1 X176.087 Y125.156 E.14922
G1 X179.825 Y125.156 E.12401
G1 X183.763 Y129.094 E.18473
G1 X183.763 Y132.832 E.124
G1 X179.39 Y137.205 E.20514
G1 X176.522 Y137.205 E.09513
G1 X164.473 Y125.156 E.56524
G1 X164.473 Y126.784 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X164.473 Y125.156 E-.61876
G1 X164.736 Y125.419 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z6.6 I.271 J-1.186 P1  F30000
G1 X134.898 Y118.602 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F5107
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F5107
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.785 Y121.763 Z6.8 F30000
G1 X119.448 Y123.496 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5107
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X127.376 Y118.948 E.33325
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X127.948 Y126.052 E.3098
G1 X128.052 Y126.052 E.00344
G1 X120.948 Y118.948 E.33325
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X126.789 Y121.814 Z6.8 F30000
G1 X184.516 Y145.199 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F5107
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y128.77 E.14487
G1 X184.516 Y145.139 E.54297
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F5107
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y128.77 E.14624
G1 X184.908 Y145.531 E.515
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.378 Y139.394 Z6.8 F30000
G1 X173.415 Y132.664 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F5107
G1 X173.344 Y132.644 E.00245
G1 X172.925 Y132.405 E.01599
G1 X172.576 Y132.073 E.01599
G1 X172.316 Y131.667 E.01599
G1 X172.161 Y131.211 E.01599
G1 X172.12 Y130.731 E.01599
G1 X172.195 Y130.255 E.01599
G1 X172.381 Y129.81 E.01599
G1 X172.669 Y129.423 E.01599
G1 X173.04 Y129.117 E.01599
G1 X173.475 Y128.908 E.01599
G1 X173.946 Y128.809 E.01599
G1 X174.428 Y128.826 E.01599
G1 X174.892 Y128.957 E.01599
G1 X175.31 Y129.196 E.01599
G1 X175.66 Y129.528 E.01599
G1 X175.919 Y129.934 E.01599
G1 X176.074 Y130.39 E.01599
G1 X176.12 Y130.801 E.01369
G1 X176.041 Y131.347 E.0183
G1 X175.854 Y131.791 E.01599
G1 X175.567 Y132.178 E.01599
G1 X175.195 Y132.485 E.01599
G1 X174.761 Y132.694 E.01599
G1 X174.289 Y132.793 E.01599
G1 X173.807 Y132.776 E.01599
G1 X173.472 Y132.681 E.01155
G1 X173.527 Y132.295 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F5107
G3 X175.728 Y130.801 I.597 J-1.49 E.21341
G3 X173.901 Y132.395 I-1.634 J-.028 E.08394
G3 X173.583 Y132.317 I.222 J-1.589 E.0101
M204 S10000
; WIPE_START
G1 F24000
G1 X173.185 Y132.112 E-.16988
G1 X172.899 Y131.85 E-.14739
G1 X172.683 Y131.528 E-.14739
M73 P44 R15
G1 X172.55 Y131.164 E-.14739
G1 X172.509 Y130.778 E-.14739
G1 X172.509 Y130.776 E-.00056
; WIPE_END
G1 E-.04 F1800
G1 X173.788 Y128.476 Z6.8 F30000
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5107
G1 X173.747 Y128.486 E.00141
G2 X173.848 Y128.471 I.398 J2.308 E.48485
G1 X173.27 Y124.749 F30000
G1 F5107
G1 X184.17 Y124.749 E.36155
G1 X184.17 Y144.853 E.66688
G1 X181.557 Y144.853 E.08668
G1 X181.557 Y137.612 E.24019
G1 X166.679 Y137.612 E.49352
G1 X166.679 Y144.853 E.24019
G1 X164.066 Y144.853 E.08668
G1 X164.066 Y124.749 E.66688
G1 X173.21 Y124.749 E.30334
G1 X164.473 Y126.784 F30000
G1 F5107
G1 X164.473 Y125.156 E.05401
G1 X176.522 Y137.205 E.56524
G1 X179.39 Y137.205 E.09513
G1 X183.763 Y132.832 E.20514
G1 X183.763 Y129.094 E.124
G1 X179.825 Y125.156 E.18473
G1 X176.087 Y125.156 E.12401
G1 X172.906 Y128.337 E.14922
G2 X171.643 Y129.6 I1.437 J2.7 E.06013
G1 X164.473 Y136.769 E.33635
G1 X164.473 Y140.508 E.124
G1 X166.272 Y142.307 E.08439
G1 X166.272 Y142.647 E.01128
G1 X164.473 Y144.445 E.08439
G1 X164.473 Y142.817 E.05401
G1 X167.189 Y144.853 F30000
G1 F5107
G1 X168.818 Y144.853 E.05401
G1 X167.086 Y143.121 E.08124
G1 X167.086 Y141.832 E.04274
G1 X170.9 Y138.019 E.1789
G1 X169.66 Y138.019 E.04112
G1 X176.494 Y144.853 E.32058
G1 X179.418 Y144.853 E.097
G1 X181.15 Y143.121 E.08124
G1 X181.15 Y141.832 E.04274
G1 X177.336 Y138.019 E.1789
G1 X178.576 Y138.019 E.04112
G1 X171.742 Y144.853 E.32058
G1 X173.37 Y144.853 E.05401
G1 X183.763 Y142.817 F30000
G1 F5107
G1 X183.763 Y144.445 E.05401
G1 X181.964 Y142.647 E.08439
G1 X181.964 Y142.307 E.01128
G1 X183.763 Y140.508 E.08439
G1 X183.763 Y136.769 E.124
G1 X176.593 Y129.6 E.33635
G2 X175.33 Y128.337 I-2.471 J1.208 E.06034
G1 X172.149 Y125.156 E.14922
G1 X168.411 Y125.156 E.12401
G1 X164.473 Y129.094 E.18473
G1 X164.473 Y132.832 E.124
G1 X168.846 Y137.205 E.20514
G1 X171.714 Y137.205 E.09513
G1 X183.763 Y125.156 E.56524
G1 X183.763 Y126.784 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X183.763 Y125.156 E-.61876
G1 X183.5 Y125.419 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
M106 S239.7
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z6.8 I.169 J-1.205 P1  F30000
G1 X134.898 Y118.602 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F15476.11
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F12000
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.631 Y120.508 Z7 F30000
G1 X119.448 Y120.828 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X128.052 Y126.052 E.33325
G1 X127.948 Y126.052 E.00344
G1 X134.552 Y119.448 E.3098
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X120.272 Y126.052 E.33325
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.01 Y127.618 Z7 F30000
G1 X184.516 Y145.199 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F15476.11
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y128.77 E.14487
G1 X184.516 Y145.139 E.54297
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F12000
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y128.77 E.14624
G1 X184.908 Y145.531 E.515
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.378 Y139.394 Z7 F30000
G1 X173.415 Y132.664 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F15476.11
G1 X173.344 Y132.644 E.00245
G1 X172.925 Y132.405 E.01599
G1 X172.576 Y132.073 E.01599
G1 X172.316 Y131.667 E.01599
G1 X172.161 Y131.211 E.01599
G1 X172.12 Y130.731 E.01599
G1 X172.195 Y130.255 E.01599
G1 X172.381 Y129.81 E.01599
G1 X172.669 Y129.423 E.01599
G1 X173.04 Y129.117 E.01599
G1 X173.475 Y128.908 E.01599
G1 X173.946 Y128.809 E.01599
G1 X174.428 Y128.826 E.01599
G1 X174.892 Y128.957 E.01599
G1 X175.31 Y129.196 E.01599
G1 X175.66 Y129.528 E.01599
G1 X175.919 Y129.934 E.01599
G1 X176.074 Y130.39 E.01599
G1 X176.12 Y130.801 E.01369
G1 X176.041 Y131.347 E.0183
G1 X175.854 Y131.791 E.01599
G1 X175.567 Y132.178 E.01599
G1 X175.195 Y132.485 E.01599
G1 X174.761 Y132.694 E.01599
G1 X174.289 Y132.793 E.01599
G1 X173.807 Y132.776 E.01599
G1 X173.472 Y132.681 E.01155
G1 X173.527 Y132.295 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F12000
G3 X175.728 Y130.801 I.597 J-1.49 E.21341
G3 X173.901 Y132.395 I-1.634 J-.028 E.08394
G3 X173.583 Y132.317 I.222 J-1.589 E.0101
M204 S10000
G1 X172.808 Y132.522 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.405797
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X164.087 Y132.522 E.45954
G1 X164.087 Y132.066 E.02402
G1 X172.131 Y132.066 E.42387
G1 X172.018 Y131.903 E.01045
G1 X171.912 Y131.61 E.01641
G1 X164.087 Y131.61 E.41232
G1 X164.087 Y131.154 E.02402
G1 X171.785 Y131.154 E.40561
G3 X171.754 Y130.698 I1.818 J-.352 E.02413
G1 X164.087 Y130.698 E.40398
G1 X164.087 Y130.243 E.02402
G1 X171.82 Y130.243 E.40747
G3 X171.98 Y129.787 I4.625 J1.368 E.02547
G1 X164.087 Y129.787 E.4159
G1 X164.087 Y129.331 E.02402
G1 X172.265 Y129.331 E.43094
G3 X172.746 Y128.875 I1.544 J1.147 E.03507
G1 X164.087 Y128.875 E.45625
G1 X164.087 Y128.42 E.02402
G1 X184.148 Y128.42 E1.0571
G1 X184.148 Y127.964 E.02402
G1 X164.087 Y127.964 E1.0571
G1 X164.087 Y127.508 E.02402
G1 X184.148 Y127.508 E1.0571
G1 X184.148 Y127.052 E.02402
G1 X164.087 Y127.052 E1.0571
G1 X164.087 Y126.596 E.02402
G1 X184.148 Y126.596 E1.0571
G1 X184.148 Y126.141 E.02402
G1 X164.087 Y126.141 E1.0571
G1 X164.087 Y125.685 E.02402
G1 X184.148 Y125.685 E1.0571
G1 X184.148 Y125.229 E.02402
G1 X164.087 Y125.229 E1.0571
G1 X164.087 Y124.773 E.02402
G1 X184.351 Y124.773 E1.06777
M106 S239.7
G1 X184.351 Y128.875 F30000
M106 S255
G1 F3000
G1 X175.49 Y128.875 E.46692
G3 X175.97 Y129.331 I-1.064 J1.602 E.03507
G1 X184.148 Y129.331 E.43094
G1 X184.148 Y129.787 E.02402
G1 X176.256 Y129.787 E.4159
G3 X176.416 Y130.243 I-4.465 J1.824 E.02547
G1 X184.148 Y130.243 E.40747
G1 X184.148 Y130.698 E.02402
G1 X176.482 Y130.698 E.40398
G3 X176.452 Y131.154 I-1.892 J.103 E.02413
G1 X184.148 Y131.154 E.40558
G1 X184.148 Y131.61 E.02402
G1 X176.332 Y131.61 E.41187
G3 X176.104 Y132.066 I-1.091 J-.26 E.02709
G1 X184.148 Y132.066 E.42387
G1 X184.148 Y132.522 E.02402
G1 X175.419 Y132.522 E.46
M106 S239.7
G1 X173.37 Y144.853 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X171.742 Y144.853 E.05401
G1 X178.576 Y138.019 E.32058
G1 X177.336 Y138.019 E.04112
G1 X181.15 Y141.832 E.1789
G1 X181.15 Y143.121 E.04274
G1 X179.418 Y144.853 E.08124
G1 X176.494 Y144.853 E.097
G1 X169.66 Y138.019 E.32058
G1 X170.9 Y138.019 E.04112
G1 X167.086 Y141.832 E.1789
G1 X167.086 Y143.121 E.04274
G1 X168.818 Y144.853 E.08124
G1 X167.189 Y144.853 E.05401
G1 X163.885 Y144.828 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.405797
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X166.658 Y144.828 E.1461
G1 X166.658 Y144.372 E.02402
G1 X164.087 Y144.372 E.13543
G1 X164.087 Y143.917 E.02402
G1 X166.658 Y143.917 E.13543
G1 X166.658 Y143.461 E.02402
G1 X164.087 Y143.461 E.13543
G1 X164.087 Y143.005 E.02402
G1 X166.658 Y143.005 E.13543
G1 X166.658 Y142.549 E.02402
G1 X164.087 Y142.549 E.13543
G1 X164.087 Y142.093 E.02402
G1 X166.658 Y142.093 E.13543
G1 X166.658 Y141.638 E.02402
G1 X164.087 Y141.638 E.13543
G1 X164.087 Y141.182 E.02402
G1 X166.658 Y141.182 E.13543
G1 X166.658 Y140.726 E.02402
G1 X164.087 Y140.726 E.13543
G1 X164.087 Y140.27 E.02402
G1 X166.658 Y140.27 E.13543
M73 P44 R14
G1 X166.658 Y139.814 E.02402
G1 X164.087 Y139.814 E.13543
G1 X164.087 Y139.359 E.02402
G1 X166.658 Y139.359 E.13543
G1 X166.658 Y138.903 E.02402
G1 X164.087 Y138.903 E.13543
G1 X164.087 Y138.447 E.02402
G1 X166.658 Y138.447 E.13543
G1 X166.658 Y137.991 E.02402
G1 X164.087 Y137.991 E.13543
G1 X164.087 Y137.535 E.02402
G1 X184.148 Y137.535 E1.0571
G1 X184.148 Y137.08 E.02402
G1 X164.087 Y137.08 E1.0571
G1 X164.087 Y136.624 E.02402
G1 X184.148 Y136.624 E1.0571
M73 P45 R14
G1 X184.148 Y136.168 E.02402
G1 X164.087 Y136.168 E1.0571
G1 X164.087 Y135.712 E.02402
G1 X184.148 Y135.712 E1.0571
G1 X184.148 Y135.256 E.02402
G1 X164.087 Y135.256 E1.0571
G1 X164.087 Y134.801 E.02402
G1 X184.148 Y134.801 E1.0571
G1 X184.148 Y134.345 E.02402
G1 X164.087 Y134.345 E1.0571
G1 X164.087 Y133.889 E.02402
G1 X184.148 Y133.889 E1.0571
G1 X184.148 Y133.433 E.02402
G1 X164.087 Y133.433 E1.0571
G1 X164.087 Y132.977 E.02402
G1 X184.351 Y132.977 E1.06777
M106 S239.7
G1 X184.351 Y137.991 F30000
M106 S255
G1 F3000
G1 X181.578 Y137.991 E.1461
G1 X181.578 Y138.447 E.02402
G1 X184.148 Y138.447 E.13543
G1 X184.148 Y138.903 E.02402
G1 X181.578 Y138.903 E.13543
G1 X181.578 Y139.359 E.02402
G1 X184.148 Y139.359 E.13543
G1 X184.148 Y139.814 E.02402
G1 X181.578 Y139.814 E.13543
G1 X181.578 Y140.27 E.02402
G1 X184.148 Y140.27 E.13543
G1 X184.148 Y140.726 E.02402
G1 X181.578 Y140.726 E.13543
G1 X181.578 Y141.182 E.02402
G1 X184.148 Y141.182 E.13543
G1 X184.148 Y141.638 E.02402
G1 X181.578 Y141.638 E.13543
G1 X181.578 Y142.093 E.02402
G1 X184.148 Y142.093 E.13543
G1 X184.148 Y142.549 E.02402
G1 X181.578 Y142.549 E.13543
G1 X181.578 Y143.005 E.02402
G1 X184.148 Y143.005 E.13543
G1 X184.148 Y143.461 E.02402
G1 X181.578 Y143.461 E.13543
G1 X181.578 Y143.917 E.02402
G1 X184.148 Y143.917 E.13543
G1 X184.148 Y144.372 E.02402
G1 X181.578 Y144.372 E.13543
G1 X181.578 Y144.828 E.02402
G1 X184.351 Y144.828 E.1461
M106 S239.7
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X182.351 Y144.828 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
M106 S252.45
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z7 I.589 J-1.065 P1  F30000
G1 X134.898 Y118.602 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F9578
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F9578
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.785 Y121.763 Z7.2 F30000
G1 X119.448 Y123.496 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9578
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X127.376 Y118.948 E.33325
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X127.948 Y126.052 E.3098
G1 X128.052 Y126.052 E.00344
G1 X120.948 Y118.948 E.33325
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X126.789 Y121.814 Z7.2 F30000
G1 X184.516 Y145.199 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F9578
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y128.77 E.14487
G1 X184.516 Y145.139 E.54297
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F9578
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y128.77 E.14624
G1 X184.908 Y145.531 E.515
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.378 Y139.394 Z7.2 F30000
G1 X173.415 Y132.664 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F9578
G1 X173.344 Y132.644 E.00245
G1 X172.925 Y132.405 E.01599
G1 X172.576 Y132.073 E.01599
G1 X172.316 Y131.667 E.01599
G1 X172.161 Y131.211 E.01599
G1 X172.12 Y130.731 E.01599
G1 X172.195 Y130.255 E.01599
G1 X172.381 Y129.81 E.01599
G1 X172.638 Y129.462 E.01435
G1 X173.04 Y129.117 E.01759
G1 X173.475 Y128.908 E.01599
G1 X173.807 Y128.826 E.01137
G1 X174.289 Y128.809 E.01599
G1 X174.761 Y128.908 E.01599
G1 X175.195 Y129.117 E.01599
G1 X175.567 Y129.423 E.01599
G1 X175.854 Y129.81 E.01599
G1 X176.044 Y130.262 E.01625
G1 X176.12 Y130.801 E.01804
G1 X176.041 Y131.347 E.0183
G1 X175.854 Y131.791 E.01599
G1 X175.567 Y132.178 E.01599
G1 X175.195 Y132.485 E.01599
G1 X174.761 Y132.694 E.01599
G1 X174.289 Y132.793 E.01599
G1 X173.807 Y132.776 E.01599
G1 X173.472 Y132.681 E.01155
G1 X173.53 Y132.288 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F9578
G3 X172.704 Y130.033 I.585 J-1.493 E.08339
G3 X173.901 Y129.206 I1.444 J.812 E.04629
G1 X174.334 Y129.206 E.0133
G3 X173.586 Y132.309 I-.219 J1.589 E.16461
M204 S10000
; WIPE_START
G1 F24000
G1 X173.185 Y132.112 E-.16962
G1 X172.899 Y131.85 E-.14739
G1 X172.683 Y131.528 E-.14739
G1 X172.55 Y131.164 E-.14739
G1 X172.509 Y130.778 E-.14739
G1 X172.509 Y130.776 E-.00081
; WIPE_END
G1 E-.04 F1800
G1 X169.772 Y137.796 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.424588
G1 F9578
G1 X174.467 Y133.102 E.20649
G1 X174.399 Y133.118 E.00219
G1 X173.911 Y133.118 E.01515
G1 X169.402 Y137.627 E.19832
G1 X168.863 Y137.627 E.01679
G1 X173.46 Y133.03 E.20219
G3 X173.074 Y132.876 I.42 J-1.613 E.01295
G1 X168.323 Y137.627 E.20896
G1 X167.783 Y137.627 E.01679
G1 X172.735 Y132.675 E.21782
G3 X172.45 Y132.42 I.805 J-1.192 E.01193
G1 X167.074 Y137.796 E.23646
G1 X163.881 Y137.75 F30000
G1 F9578
G1 X176.898 Y124.734 E.57252
G1 X176.358 Y124.734 E.01679
G1 X164.051 Y137.041 E.54132
G1 X164.051 Y136.501 E.01679
G1 X175.818 Y124.734 E.51758
G1 X175.279 Y124.734 E.01679
G1 X164.051 Y135.961 E.49384
G1 X164.051 Y135.422 E.01679
G1 X174.739 Y124.734 E.47009
G1 X174.199 Y124.734 E.01679
G1 X164.051 Y134.882 E.44635
G1 X164.051 Y134.342 E.01679
G1 X173.659 Y124.734 E.42261
G1 X173.12 Y124.734 E.01679
G1 X164.051 Y133.802 E.39887
G1 X164.051 Y133.263 E.01679
G1 X172.58 Y124.734 E.37513
G1 X172.04 Y124.734 E.01679
G1 X164.051 Y132.723 E.35139
G1 X164.051 Y132.183 E.01679
G1 X171.5 Y124.734 E.32765
G1 X170.961 Y124.734 E.01679
G1 X164.051 Y131.643 E.30391
G1 X164.051 Y131.104 E.01679
G1 X170.421 Y124.734 E.28017
G1 X169.881 Y124.734 E.01679
G1 X164.051 Y130.564 E.25643
G1 X164.051 Y130.024 E.01679
G1 X169.341 Y124.734 E.23269
G1 X168.801 Y124.734 E.01679
G1 X164.051 Y129.484 E.20895
G1 X164.051 Y128.945 E.01679
G1 X168.262 Y124.734 E.18521
G1 X167.722 Y124.734 E.01679
G1 X164.051 Y128.405 E.16147
G1 X164.051 Y127.865 E.01679
G1 X167.182 Y124.734 E.13773
G1 X166.642 Y124.734 E.01679
G1 X164.051 Y127.325 E.11399
G1 X164.051 Y126.786 E.01679
G1 X166.103 Y124.734 E.09024
G1 X165.563 Y124.734 E.01679
G1 X164.051 Y126.246 E.0665
G1 X164.051 Y125.706 E.01679
G1 X165.023 Y124.734 E.04276
G1 X164.483 Y124.734 E.01679
G1 X163.881 Y125.336 E.02649
G1 X166.864 Y144.484 F30000
G1 F9578
G1 X166.48 Y144.868 E.01689
G1 X165.94 Y144.868 E.01679
G1 X166.694 Y144.114 E.03316
G1 X166.694 Y143.574 E.01679
G1 X165.4 Y144.868 E.0569
G1 X164.86 Y144.868 E.01679
G1 X166.694 Y143.034 E.08064
G1 X166.694 Y142.494 E.01679
G1 X164.321 Y144.868 E.10438
G1 X164.051 Y144.868 E.00839
G1 X164.051 Y144.598 E.0084
G1 X166.694 Y141.955 E.11625
G1 X166.694 Y141.415 E.01679
G1 X164.051 Y144.058 E.11625
G1 X164.051 Y143.518 E.01679
G1 X166.694 Y140.875 E.11625
G1 X166.694 Y140.335 E.01679
G1 X164.051 Y142.978 E.11625
G1 X164.051 Y142.439 E.01679
G1 X166.694 Y139.795 E.11625
G1 X166.694 Y139.256 E.01679
G1 X164.051 Y141.899 E.11625
G1 X164.051 Y141.359 E.01679
G1 X166.694 Y138.716 E.11625
G1 X166.694 Y138.176 E.01679
G1 X164.051 Y140.819 E.11625
G1 X164.051 Y140.28 E.01679
G1 X172.212 Y132.118 E.35895
G1 X172.051 Y131.886 E.00879
G1 X172.012 Y131.779 E.00355
G1 X164.051 Y139.74 E.35016
G1 X164.051 Y139.2 E.01679
G1 X171.868 Y131.383 E.34383
G1 X171.84 Y131.306 E.00253
G1 X171.792 Y130.919 E.01214
G1 X164.051 Y138.66 E.34049
G1 X164.051 Y138.12 E.01679
G1 X171.835 Y130.336 E.34238
G3 X172.106 Y129.626 I2.893 J.695 E.0237
G1 X172.405 Y129.227 E.0155
G3 X173.647 Y128.524 I1.735 J1.617 E.0451
G1 X177.438 Y124.734 E.16672
G1 X177.977 Y124.734 E.01679
G1 X174.233 Y128.478 E.16468
G3 X174.699 Y128.552 I-.056 J1.862 E.01471
G1 X178.517 Y124.734 E.16792
G1 X179.057 Y124.734 E.01679
G1 X175.099 Y128.692 E.1741
G3 X175.443 Y128.887 I-.632 J1.516 E.01235
G1 X179.597 Y124.734 E.18269
G1 X180.136 Y124.734 E.01679
G1 X175.738 Y129.132 E.19347
G3 X175.988 Y129.422 I-1.161 J1.26 E.01193
G1 X180.676 Y124.734 E.20619
G1 X181.216 Y124.734 E.01679
G1 X176.197 Y129.753 E.22077
G3 X176.351 Y130.139 I-1.507 J.827 E.01294
G1 X181.756 Y124.734 E.23772
G1 X182.295 Y124.734 E.01679
G1 X176.433 Y130.596 E.25786
G3 X176.415 Y131.154 I-1.897 J.218 E.01742
G1 X182.835 Y124.734 E.28239
G1 X183.375 Y124.734 E.01679
G1 X170.482 Y137.627 E.56708
G1 X171.022 Y137.627 E.01679
G1 X183.915 Y124.734 E.56708
G1 X184.185 Y124.734 E.0084
G1 X184.185 Y125.004 E.00839
G1 X171.561 Y137.627 E.55522
G1 X172.101 Y137.627 E.01679
G1 X184.185 Y125.543 E.53148
G1 X184.185 Y126.083 E.01679
G1 X172.641 Y137.627 E.50774
G1 X173.181 Y137.627 E.01679
G1 X184.185 Y126.623 E.48399
G1 X184.185 Y127.163 E.01679
G1 X173.72 Y137.627 E.46025
G1 X174.26 Y137.627 E.01679
G1 X184.185 Y127.702 E.43651
G1 X184.185 Y128.242 E.01679
G1 X174.8 Y137.627 E.41277
G1 X175.34 Y137.627 E.01679
G1 X184.185 Y128.782 E.38903
G1 X184.185 Y129.322 E.01679
G1 X175.88 Y137.627 E.36529
G1 X176.419 Y137.627 E.01679
G1 X184.185 Y129.861 E.34155
G1 X184.185 Y130.401 E.01679
G1 X176.959 Y137.627 E.31781
G1 X177.499 Y137.627 E.01679
G1 X184.185 Y130.941 E.29407
G1 X184.185 Y131.481 E.01679
G1 X178.039 Y137.627 E.27033
G1 X178.578 Y137.627 E.01679
G1 X184.185 Y132.02 E.24659
G1 X184.185 Y132.56 E.01679
G1 X179.118 Y137.627 E.22285
G1 X179.658 Y137.627 E.01679
G1 X184.185 Y133.1 E.19911
G1 X184.185 Y133.64 E.01679
G1 X180.198 Y137.627 E.17537
G1 X180.737 Y137.627 E.01679
G1 X184.185 Y134.179 E.15163
G1 X184.185 Y134.719 E.01679
G1 X181.277 Y137.627 E.12789
G1 X181.542 Y137.627 E.00823
G1 X181.542 Y137.902 E.00856
G1 X184.185 Y135.259 E.11625
G1 X184.185 Y135.799 E.01679
G1 X181.542 Y138.442 E.11625
G1 X181.542 Y138.982 E.01679
G1 X184.185 Y136.339 E.11625
G1 X184.185 Y136.878 E.01679
G1 X181.542 Y139.521 E.11625
G1 X181.542 Y140.061 E.01679
G1 X184.185 Y137.418 E.11625
G1 X184.185 Y137.958 E.01679
G1 X181.542 Y140.601 E.11625
G1 X181.542 Y141.141 E.01679
G1 X184.185 Y138.498 E.11625
G1 X184.185 Y139.037 E.01679
G1 X181.542 Y141.68 E.11625
G1 X181.542 Y142.22 E.01679
G1 X184.185 Y139.577 E.11625
G1 X184.185 Y140.117 E.01679
M73 P46 R14
G1 X181.542 Y142.76 E.11625
G1 X181.542 Y143.3 E.01679
G1 X184.185 Y140.657 E.11625
G1 X184.185 Y141.196 E.01679
G1 X181.542 Y143.839 E.11625
G1 X181.542 Y144.379 E.01679
G1 X184.185 Y141.736 E.11625
G1 X184.185 Y142.276 E.01679
G1 X181.593 Y144.868 E.11399
G1 X182.133 Y144.868 E.01679
G1 X184.185 Y142.816 E.09025
G1 X184.185 Y143.355 E.01679
G1 X182.673 Y144.868 E.06651
G1 X183.212 Y144.868 E.01679
G1 X184.185 Y143.895 E.04277
G1 X184.185 Y144.435 E.01679
G1 X183.582 Y145.037 E.02649
G1 X167.189 Y144.853 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9578
G1 X168.818 Y144.853 E.05401
G1 X167.086 Y143.121 E.08124
G1 X167.086 Y141.832 E.04274
G1 X170.9 Y138.019 E.1789
G1 X169.66 Y138.019 E.04112
G1 X176.494 Y144.853 E.32058
G1 X179.418 Y144.853 E.097
G1 X181.15 Y143.121 E.08124
G1 X181.15 Y141.832 E.04274
G1 X177.336 Y138.019 E.1789
G1 X178.576 Y138.019 E.04112
G1 X171.742 Y144.853 E.32058
G1 X173.37 Y144.853 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X171.742 Y144.853 E-.61876
G1 X172.005 Y144.59 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z7.2 I.698 J-.997 P1  F30000
G1 X134.898 Y118.602 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F10387
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F10387
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.631 Y120.508 Z7.4 F30000
G1 X119.448 Y120.828 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10387
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X128.052 Y126.052 E.33325
G1 X127.948 Y126.052 E.00344
G1 X134.552 Y119.448 E.3098
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X120.272 Y126.052 E.33325
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.01 Y127.618 Z7.4 F30000
G1 X184.516 Y145.199 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F10387
G1 X163.72 Y145.199 E.68984
G1 X163.72 Y124.403 E.68984
G1 X184.516 Y124.403 E.68984
G1 X184.516 Y128.77 E.14487
G1 X184.516 Y145.139 E.54297
G1 X184.908 Y145.591 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F10387
G1 X163.328 Y145.591 E.66309
G1 X163.328 Y124.011 E.66309
G1 X184.908 Y124.011 E.66309
G1 X184.908 Y128.77 E.14624
G1 X184.908 Y145.531 E.515
M204 S10000
; WIPE_START
G1 F24000
G1 X182.908 Y145.536 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X178.378 Y139.394 Z7.4 F30000
G1 X173.415 Y132.664 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F10387
G1 X173.344 Y132.644 E.00245
G1 X172.925 Y132.405 E.01599
G1 X172.576 Y132.073 E.01599
G1 X172.316 Y131.667 E.01599
G1 X172.161 Y131.211 E.01599
G1 X172.12 Y130.731 E.01599
G1 X172.191 Y130.273 E.01535
G1 X172.381 Y129.81 E.01661
G1 X172.669 Y129.423 E.01599
G1 X173.04 Y129.117 E.01599
G1 X173.475 Y128.908 E.01599
G1 X173.946 Y128.809 E.01599
G1 X174.428 Y128.826 E.01599
G1 X174.892 Y128.957 E.01599
G1 X175.31 Y129.196 E.01599
G1 X175.66 Y129.528 E.01599
G1 X175.919 Y129.934 E.01599
G1 X176.074 Y130.39 E.01599
G1 X176.12 Y130.801 E.01369
G1 X176.041 Y131.347 E.0183
G1 X175.854 Y131.791 E.01599
G1 X175.567 Y132.178 E.01599
G1 X175.195 Y132.485 E.01599
G1 X174.761 Y132.694 E.01599
G1 X174.289 Y132.793 E.01599
G1 X173.807 Y132.776 E.01599
G1 X173.472 Y132.681 E.01155
G1 X173.527 Y132.295 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F10387
G3 X175.728 Y130.801 I.597 J-1.49 E.21341
G3 X173.901 Y132.395 I-1.634 J-.028 E.08394
G3 X173.583 Y132.317 I.222 J-1.589 E.0101
M204 S10000
; WIPE_START
G1 F24000
G1 X173.185 Y132.112 E-.16988
G1 X172.899 Y131.85 E-.14739
G1 X172.683 Y131.528 E-.14739
G1 X172.55 Y131.164 E-.14739
G1 X172.509 Y130.778 E-.14739
G1 X172.509 Y130.776 E-.00056
; WIPE_END
G1 E-.04 F1800
G1 X179.358 Y127.407 Z7.4 F30000
G1 X184.293 Y124.979 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F10387
G1 X183.94 Y124.625 E.01536
G1 X183.407 Y124.625
G1 X184.293 Y125.512 E.03853
G1 X184.293 Y126.045
G1 X182.873 Y124.625 E.06171
G1 X182.34 Y124.625
G1 X184.293 Y126.578 E.08488
G1 X184.293 Y127.112
G1 X181.807 Y124.625 E.10805
G1 X181.273 Y124.625
G1 X184.293 Y127.645 E.13123
G1 X184.293 Y128.178
G1 X180.74 Y124.625 E.1544
G1 X180.207 Y124.625
G1 X184.293 Y128.711 E.17757
G1 X184.293 Y129.245
G1 X179.674 Y124.625 E.20075
G1 X179.14 Y124.625
G1 X184.293 Y129.778 E.22392
G1 X184.293 Y130.311
G1 X178.607 Y124.625 E.24709
G1 X178.074 Y124.625
G1 X184.293 Y130.845 E.27027
G1 X184.293 Y131.378
G1 X177.541 Y124.625 E.29344
G1 X177.007 Y124.625
G1 X184.293 Y131.911 E.31661
G1 X184.293 Y132.444
G1 X176.474 Y124.625 E.33979
G1 X175.941 Y124.625
G1 X184.293 Y132.978 E.36296
G1 X184.293 Y133.511
G1 X175.408 Y124.625 E.38613
G1 X174.874 Y124.625
G1 X184.293 Y134.044 E.40931
G1 X184.293 Y134.577
G1 X174.341 Y124.625 E.43248
G1 X173.808 Y124.625
G1 X184.293 Y135.111 E.45565
G1 X184.293 Y135.644
G1 X173.274 Y124.625 E.47882
G1 X172.741 Y124.625
G1 X184.293 Y136.177 E.502
G1 X184.293 Y136.711
G1 X172.208 Y124.625 E.52517
G1 X171.675 Y124.625
G1 X184.293 Y137.244 E.54834
G1 X184.293 Y137.777
G1 X171.141 Y124.625 E.57152
G1 X170.608 Y124.625
G1 X174.629 Y128.646 E.17473
G1 X174.036 Y128.586
G1 X170.075 Y124.625 E.17214
G1 X169.542 Y124.625
G1 X173.571 Y128.655 E.17511
G1 X173.177 Y128.794
G1 X169.008 Y124.625 E.18115
G1 X168.475 Y124.625
G1 X172.838 Y128.988 E.18959
G1 X172.549 Y129.232
G1 X167.942 Y124.625 E.20021
G1 X167.408 Y124.625
G1 X172.308 Y129.525 E.21291
G1 X172.108 Y129.858
G1 X166.875 Y124.625 E.22738
G1 X166.342 Y124.625
G1 X171.969 Y130.252 E.24451
G1 X171.899 Y130.715
G1 X165.809 Y124.625 E.26465
G1 X165.275 Y124.625
G1 X171.956 Y131.305 E.29029
M204 S10000
; WIPE_START
G1 F24000
G1 X170.541 Y129.891 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X176.279 Y130.296 Z7.4 F30000
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F10387
G1 X184.293 Y138.31 E.34825
G1 X184.293 Y138.844
G1 X176.337 Y130.887 E.34575
G1 X176.269 Y131.353
G1 X184.293 Y139.377 E.34869
G1 X184.293 Y139.91
G1 X181.887 Y137.503 E.10458
G1 X181.887 Y138.037
G1 X184.293 Y140.443 E.10458
G1 X184.293 Y140.977
G1 X181.887 Y138.57 E.10458
G1 X181.887 Y139.103
G1 X184.293 Y141.51 E.10458
G1 X184.293 Y142.043
G1 X181.887 Y139.637 E.10458
G1 X181.887 Y140.17
G1 X184.293 Y142.577 E.10458
G1 X184.293 Y143.11
G1 X181.887 Y140.703 E.10458
G1 X181.887 Y141.236
G1 X184.293 Y143.643 E.10458
G1 X184.293 Y144.176
G1 X181.887 Y141.77 E.10458
G1 X181.887 Y142.303
G1 X184.293 Y144.71 E.10458
G1 X184.027 Y144.976
G1 X181.887 Y142.836 E.09299
G1 X181.887 Y143.369
G1 X183.493 Y144.976 E.06982
G1 X182.96 Y144.976
G1 X181.887 Y143.903 E.04665
G1 X181.887 Y144.436
G1 X182.427 Y144.976 E.02347
M204 S10000
G1 X181.665 Y137.282 F30000
M204 S2000
G1 F10387
G1 X176.124 Y131.741 E.24076
G1 X175.923 Y132.073
G1 X181.132 Y137.282 E.22634
G1 X180.598 Y137.282
G1 X175.682 Y132.365 E.21364
G1 X175.399 Y132.616
G1 X180.065 Y137.282 E.20276
G1 X179.532 Y137.282
G1 X175.057 Y132.807 E.19444
G1 X174.662 Y132.945
G1 X178.999 Y137.282 E.18845
G1 X178.465 Y137.282
G1 X174.193 Y133.009 E.18567
G1 X173.602 Y132.952
G1 X177.932 Y137.282 E.18817
G1 X177.399 Y137.282
G1 X164.742 Y124.625 E.54999
G1 X164.209 Y124.625
G1 X176.865 Y137.282 E.54999
G1 X176.332 Y137.282
G1 X163.942 Y124.892 E.5384
G1 X163.942 Y125.425
G1 X175.799 Y137.282 E.51523
G1 X175.266 Y137.282
G1 X163.942 Y125.958 E.49206
G1 X163.942 Y126.492
G1 X174.732 Y137.282 E.46888
G1 X174.199 Y137.282
G1 X163.942 Y127.025 E.44571
G1 X163.942 Y127.558
G1 X173.666 Y137.282 E.42254
G1 X173.133 Y137.282
G1 X163.942 Y128.091 E.39936
G1 X163.942 Y128.625
G1 X172.599 Y137.282 E.37619
G1 X172.066 Y137.282
G1 X163.942 Y129.158 E.35302
G1 X163.942 Y129.691
G1 X171.533 Y137.282 E.32985
G1 X171 Y137.282
G1 X163.942 Y130.225 E.30667
G1 X163.942 Y130.758
G1 X170.466 Y137.282 E.2835
G1 X169.933 Y137.282
G1 X163.942 Y131.291 E.26033
G1 X163.942 Y131.824
G1 X169.4 Y137.282 E.23715
G1 X168.866 Y137.282
G1 X163.942 Y132.358 E.21398
G1 X163.942 Y132.891
G1 X168.333 Y137.282 E.19081
G1 X167.8 Y137.282
G1 X163.942 Y133.424 E.16763
G1 X163.942 Y133.957
G1 X167.267 Y137.282 E.14446
G1 X166.733 Y137.282
G1 X163.942 Y134.491 E.12129
G1 X163.942 Y135.024
G1 X166.349 Y137.431 E.10458
G1 X166.349 Y137.964
G1 X163.942 Y135.557 E.10458
G1 X163.942 Y136.09
G1 X166.349 Y138.497 E.10458
G1 X166.349 Y139.03
G1 X163.942 Y136.624 E.10458
G1 X163.942 Y137.157
G1 X166.349 Y139.564 E.10458
G1 X166.349 Y140.097
G1 X163.942 Y137.69 E.10458
G1 X163.942 Y138.224
G1 X166.349 Y140.63 E.10458
G1 X166.349 Y141.164
G1 X163.942 Y138.757 E.10458
G1 X163.942 Y139.29
G1 X166.349 Y141.697 E.10458
G1 X166.349 Y142.23
G1 X163.942 Y139.823 E.10458
G1 X163.942 Y140.357
G1 X166.349 Y142.763 E.10458
G1 X166.349 Y143.297
G1 X163.942 Y140.89 E.10458
G1 X163.942 Y141.423
G1 X166.349 Y143.83 E.10458
M73 P47 R14
G1 X166.349 Y144.363
G1 X163.942 Y141.956 E.10458
G1 X163.942 Y142.49
G1 X166.349 Y144.896 E.10458
G1 X165.895 Y144.976
G1 X163.942 Y143.023 E.08487
G1 X163.942 Y143.556
G1 X165.362 Y144.976 E.0617
G1 X164.829 Y144.976
G1 X163.942 Y144.09 E.03853
G1 X163.942 Y144.623
G1 X164.296 Y144.976 E.01536
M204 S10000
; WIPE_START
G1 F24000
G1 X163.942 Y144.623 E-.1899
G1 X163.942 Y144.09 E-.20264
G1 X164.626 Y144.773 E-.36746
; WIPE_END
G1 E-.04 F1800
G1 X168.41 Y138.145 Z7.4 F30000
G1 X172.096 Y131.687 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.192673
G1 F10387
G1 X171.893 Y131.368 E.00461
G1 X171.91 Y130.975 F30000
; LINE_WIDTH: 0.126452
G1 F10387
G1 X171.826 Y130.788 E.00139
; WIPE_START
G1 F24000
G1 X171.91 Y130.975 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X173.803 Y128.62 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.0886545
G1 F10387
G1 X173.653 Y128.573 E.00059
; WIPE_START
G1 F24000
G1 X173.803 Y128.62 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X174.983 Y128.751 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.153907
G1 F10387
G1 X174.697 Y128.578 E.00302
; WIPE_START
G1 F24000
G1 X174.983 Y128.751 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X176.41 Y130.814 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.12956
G1 F10387
G1 X176.326 Y130.628 E.00144
; WIPE_START
G1 F24000
G1 X176.41 Y130.814 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X173.533 Y133.02 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.158514
G1 F10387
G1 X173.251 Y132.85 E.0031
; WIPE_START
G1 F24000
G1 X173.533 Y133.02 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X180.314 Y136.525 Z7.4 F30000
G1 X181.996 Y137.394 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.111346
G1 F10387
G1 X181.774 Y137.173 E.00175
G1 X181.046 Y144.853 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10387
G1 X179.418 Y144.853 E.05401
G1 X181.664 Y142.606 E.10539
G1 X181.664 Y142.347 E.00859
G1 X176.821 Y137.504 E.22719
G1 X179.09 Y137.504 E.07526
G1 X171.742 Y144.853 E.34473
G1 X168.818 Y144.853 E.097
G1 X166.571 Y142.606 E.10539
G1 X166.571 Y142.347 E.00859
G1 X171.414 Y137.504 E.22719
G1 X169.145 Y137.504 E.07526
G1 X176.494 Y144.853 E.34473
G1 X174.865 Y144.853 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X176.494 Y144.853 E-.61876
G1 X176.231 Y144.59 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z7.4 I.648 J-1.03 P1  F30000
G1 X134.898 Y118.602 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2455
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2455
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.785 Y121.763 Z7.6 F30000
G1 X119.448 Y123.496 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X127.376 Y118.948 E.33325
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X127.948 Y126.052 E.3098
G1 X128.052 Y126.052 E.00344
G1 X120.948 Y118.948 E.33325
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.052 Y121.054 Z7.6 F30000
G1 X182.266 Y136.903 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2455
G1 X182.266 Y141.051 E.13759
G1 X182.266 Y145.199 E.13759
G1 X165.97 Y145.199 E.54056
G1 X165.97 Y136.903 E.27519
G1 X182.206 Y136.903 E.53857
G1 X182.658 Y136.511 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2455
G1 X182.658 Y141.051 E.1395
G1 X182.658 Y145.591 E.1395
G1 X165.578 Y145.591 E.52482
G1 X165.578 Y136.511 E.279
G1 X182.598 Y136.511 E.52298
M204 S10000
; WIPE_START
G1 F24000
G1 X182.624 Y138.51 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X176.715 Y143.341 Z7.6 F30000
G1 X174.865 Y144.853 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
G1 X176.494 Y144.853 E.05401
G1 X168.89 Y137.249 E.35671
G1 X171.67 Y137.249 E.09221
G1 X166.316 Y142.603 E.25116
G1 X166.316 Y142.351 E.00836
G1 X168.818 Y144.853 E.11737
G1 X171.742 Y144.853 E.097
G1 X179.346 Y137.249 E.35671
G1 X176.566 Y137.249 E.09221
G1 X181.92 Y142.603 E.25116
G1 X181.92 Y142.351 E.00836
G1 X179.418 Y144.853 E.11737
G1 X181.046 Y144.853 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X179.418 Y144.853 E-.61876
G1 X179.681 Y144.59 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z7.6 I.611 J-1.053 P1  F30000
G1 X134.898 Y118.602 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2454
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2454
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.631 Y120.508 Z7.8 F30000
G1 X119.448 Y120.828 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2454
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X128.052 Y126.052 E.33325
G1 X127.948 Y126.052 E.00344
G1 X134.552 Y119.448 E.3098
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X120.272 Y126.052 E.33325
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.217 Y126.769 Z7.8 F30000
G1 X182.266 Y136.903 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2454
G1 X182.266 Y141.051 E.13759
G1 X182.266 Y145.199 E.13759
G1 X165.97 Y145.199 E.54056
G1 X165.97 Y136.903 E.27519
G1 X182.206 Y136.903 E.53857
G1 X182.658 Y136.511 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2454
G1 X182.658 Y141.051 E.1395
G1 X182.658 Y145.591 E.1395
G1 X165.578 Y145.591 E.52482
G1 X165.578 Y136.511 E.279
G1 X182.598 Y136.511 E.52298
M204 S10000
; WIPE_START
G1 F24000
G1 X182.624 Y138.51 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X181.046 Y144.853 Z7.8 F30000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2454
G1 X179.418 Y144.853 E.05401
G1 X181.92 Y142.351 E.11737
G1 X181.92 Y142.603 E.00836
G1 X176.566 Y137.249 E.25116
G1 X179.346 Y137.249 E.09221
M73 P48 R14
G1 X171.742 Y144.853 E.35671
G1 X168.818 Y144.853 E.097
G1 X166.316 Y142.351 E.11737
G1 X166.316 Y142.603 E.00836
G1 X171.67 Y137.249 E.25116
G1 X168.89 Y137.249 E.09221
G1 X176.494 Y144.853 E.35671
G1 X174.865 Y144.853 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X176.494 Y144.853 E-.61876
G1 X176.231 Y144.59 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z7.8 I.648 J-1.03 P1  F30000
G1 X134.898 Y118.602 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2455
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2455
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.785 Y121.763 Z8 F30000
G1 X119.448 Y123.496 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X127.376 Y118.948 E.33325
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X127.948 Y126.052 E.3098
G1 X128.052 Y126.052 E.00344
G1 X120.948 Y118.948 E.33325
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.052 Y121.054 Z8 F30000
G1 X182.266 Y136.903 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2455
G1 X182.266 Y145.199 E.27519
G1 X170.118 Y145.199 E.40297
G1 X165.97 Y145.199 E.13759
G1 X165.97 Y136.903 E.27519
G1 X182.206 Y136.903 E.53857
G1 X182.658 Y136.511 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2455
G1 X182.658 Y145.591 E.279
G1 X170.118 Y145.591 E.38532
G1 X165.578 Y145.591 E.1395
G1 X165.578 Y136.511 E.279
G1 X182.598 Y136.511 E.52298
M204 S10000
; WIPE_START
G1 F24000
G1 X182.611 Y138.511 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X176.706 Y143.346 Z8 F30000
G1 X174.865 Y144.853 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
G1 X176.494 Y144.853 E.05401
G1 X168.89 Y137.249 E.35671
G1 X171.67 Y137.249 E.09221
G1 X166.316 Y142.603 E.25116
G1 X166.316 Y142.351 E.00836
G1 X168.818 Y144.853 E.11737
G1 X171.742 Y144.853 E.097
G1 X179.346 Y137.249 E.35671
G1 X176.566 Y137.249 E.09221
G1 X181.92 Y142.603 E.25116
G1 X181.92 Y142.351 E.00836
G1 X179.418 Y144.853 E.11737
G1 X181.046 Y144.853 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X179.418 Y144.853 E-.61876
G1 X179.681 Y144.59 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
M73 P48 R13
G3 Z8 I.611 J-1.053 P1  F30000
G1 X134.898 Y118.602 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2454
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2454
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.631 Y120.508 Z8.2 F30000
G1 X119.448 Y120.828 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2454
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X128.052 Y126.052 E.33325
G1 X127.948 Y126.052 E.00344
G1 X134.552 Y119.448 E.3098
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X120.272 Y126.052 E.33325
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.217 Y126.769 Z8.2 F30000
G1 X182.266 Y136.903 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2454
G1 X182.266 Y145.199 E.27519
G1 X165.97 Y145.199 E.54056
G1 X165.97 Y136.903 E.27519
G1 X182.206 Y136.903 E.53857
G1 X182.658 Y136.511 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2454
G1 X182.658 Y145.591 E.279
G1 X165.578 Y145.591 E.52482
G1 X165.578 Y136.511 E.279
G1 X182.598 Y136.511 E.52298
M204 S10000
; WIPE_START
G1 F24000
G1 X182.611 Y138.511 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X181.046 Y144.853 Z8.2 F30000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2454
G1 X179.418 Y144.853 E.05401
M73 P49 R13
G1 X181.92 Y142.351 E.11737
G1 X181.92 Y142.603 E.00836
G1 X176.566 Y137.249 E.25116
G1 X179.346 Y137.249 E.09221
G1 X171.742 Y144.853 E.35671
G1 X168.818 Y144.853 E.097
G1 X166.316 Y142.351 E.11737
G1 X166.316 Y142.603 E.00836
G1 X171.67 Y137.249 E.25116
G1 X168.89 Y137.249 E.09221
G1 X176.494 Y144.853 E.35671
G1 X174.865 Y144.853 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X176.494 Y144.853 E-.61876
G1 X176.231 Y144.59 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z8.2 I.648 J-1.03 P1  F30000
G1 X134.898 Y118.602 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2455
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2455
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.785 Y121.763 Z8.4 F30000
G1 X119.448 Y123.496 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X127.376 Y118.948 E.33325
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X127.948 Y126.052 E.3098
G1 X128.052 Y126.052 E.00344
G1 X120.948 Y118.948 E.33325
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.052 Y121.054 Z8.4 F30000
G1 X182.266 Y136.903 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2455
G1 X182.266 Y141.051 E.13759
G1 X182.266 Y145.199 E.13759
G1 X165.97 Y145.199 E.54056
G1 X165.97 Y136.903 E.27519
G1 X182.206 Y136.903 E.53857
G1 X182.658 Y136.511 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2455
G1 X182.658 Y141.051 E.1395
G1 X182.658 Y145.591 E.1395
G1 X165.578 Y145.591 E.52482
G1 X165.578 Y136.511 E.279
G1 X182.598 Y136.511 E.52298
M204 S10000
; WIPE_START
G1 F24000
G1 X182.624 Y138.51 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X176.715 Y143.341 Z8.4 F30000
G1 X174.865 Y144.853 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
G1 X176.494 Y144.853 E.05401
G1 X168.89 Y137.249 E.35671
G1 X171.67 Y137.249 E.09221
G1 X166.316 Y142.603 E.25116
G1 X166.316 Y142.351 E.00836
G1 X168.818 Y144.853 E.11737
G1 X171.742 Y144.853 E.097
G1 X179.346 Y137.249 E.35671
G1 X176.566 Y137.249 E.09221
G1 X181.92 Y142.603 E.25116
G1 X181.92 Y142.351 E.00836
G1 X179.418 Y144.853 E.11737
G1 X181.046 Y144.853 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X179.418 Y144.853 E-.61876
G1 X179.681 Y144.59 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z8.4 I.611 J-1.053 P1  F30000
G1 X134.898 Y118.602 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2454
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2454
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.631 Y120.508 Z8.6 F30000
G1 X119.448 Y120.828 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2454
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X128.052 Y126.052 E.33325
G1 X127.948 Y126.052 E.00344
G1 X134.552 Y119.448 E.3098
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X120.272 Y126.052 E.33325
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.217 Y126.769 Z8.6 F30000
G1 X182.266 Y136.903 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2454
G1 X182.266 Y141.051 E.13759
G1 X182.266 Y145.199 E.13759
G1 X165.97 Y145.199 E.54056
G1 X165.97 Y136.903 E.27519
G1 X182.206 Y136.903 E.53857
G1 X182.658 Y136.511 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2454
G1 X182.658 Y141.051 E.1395
G1 X182.658 Y145.591 E.1395
G1 X165.578 Y145.591 E.52482
G1 X165.578 Y136.511 E.279
G1 X182.598 Y136.511 E.52298
M204 S10000
; WIPE_START
M73 P50 R13
G1 F24000
G1 X182.624 Y138.51 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X181.046 Y144.853 Z8.6 F30000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2454
G1 X179.418 Y144.853 E.05401
G1 X181.92 Y142.351 E.11737
G1 X181.92 Y142.603 E.00836
G1 X176.566 Y137.249 E.25116
G1 X179.346 Y137.249 E.09221
G1 X171.742 Y144.853 E.35671
G1 X168.818 Y144.853 E.097
G1 X166.316 Y142.351 E.11737
G1 X166.316 Y142.603 E.00836
G1 X171.67 Y137.249 E.25116
G1 X168.89 Y137.249 E.09221
G1 X176.494 Y144.853 E.35671
G1 X174.865 Y144.853 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X176.494 Y144.853 E-.61876
G1 X176.231 Y144.59 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z8.6 I.648 J-1.03 P1  F30000
G1 X134.898 Y118.602 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2455
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2455
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.785 Y121.763 Z8.8 F30000
G1 X119.448 Y123.496 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X127.376 Y118.948 E.33325
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X127.948 Y126.052 E.3098
G1 X128.052 Y126.052 E.00344
G1 X120.948 Y118.948 E.33325
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.052 Y121.054 Z8.8 F30000
G1 X182.266 Y136.903 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2455
G1 X182.266 Y141.051 E.13759
G1 X182.266 Y145.199 E.13759
G1 X165.97 Y145.199 E.54056
G1 X165.97 Y136.903 E.27519
G1 X182.206 Y136.903 E.53857
G1 X182.658 Y136.511 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2455
G1 X182.658 Y141.051 E.1395
G1 X182.658 Y145.591 E.1395
G1 X165.578 Y145.591 E.52482
G1 X165.578 Y136.511 E.279
G1 X182.598 Y136.511 E.52298
M204 S10000
; WIPE_START
G1 F24000
G1 X182.624 Y138.51 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X176.715 Y143.341 Z8.8 F30000
G1 X174.865 Y144.853 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2455
G1 X176.494 Y144.853 E.05401
G1 X168.89 Y137.249 E.35671
G1 X171.67 Y137.249 E.09221
G1 X166.316 Y142.603 E.25116
G1 X166.316 Y142.351 E.00836
G1 X168.818 Y144.853 E.11737
G1 X171.742 Y144.853 E.097
G1 X179.346 Y137.249 E.35671
G1 X176.566 Y137.249 E.09221
G1 X181.92 Y142.603 E.25116
G1 X181.92 Y142.351 E.00836
G1 X179.418 Y144.853 E.11737
G1 X181.046 Y144.853 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X179.418 Y144.853 E-.61876
G1 X179.681 Y144.59 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z8.8 I.611 J-1.053 P1  F30000
G1 X134.898 Y118.602 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2454
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2454
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.631 Y120.508 Z9 F30000
G1 X119.448 Y120.828 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2454
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X128.052 Y126.052 E.33325
G1 X127.948 Y126.052 E.00344
G1 X134.552 Y119.448 E.3098
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X120.272 Y126.052 E.33325
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.217 Y126.769 Z9 F30000
G1 X182.266 Y136.903 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2454
G1 X182.266 Y141.051 E.13759
G1 X182.266 Y145.199 E.13759
G1 X165.97 Y145.199 E.54056
G1 X165.97 Y136.903 E.27519
G1 X182.206 Y136.903 E.53857
M73 P51 R13
G1 X182.658 Y136.511 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2454
G1 X182.658 Y141.051 E.1395
G1 X182.658 Y145.591 E.1395
G1 X165.578 Y145.591 E.52482
G1 X165.578 Y136.511 E.279
G1 X182.598 Y136.511 E.52298
M204 S10000
; WIPE_START
G1 F24000
G1 X182.624 Y138.51 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X181.046 Y144.853 Z9 F30000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2454
G1 X179.418 Y144.853 E.05401
G1 X181.92 Y142.351 E.11737
G1 X181.92 Y142.603 E.00836
G1 X176.566 Y137.249 E.25116
G1 X179.346 Y137.249 E.09221
G1 X171.742 Y144.853 E.35671
G1 X168.818 Y144.853 E.097
G1 X166.316 Y142.351 E.11737
G1 X166.316 Y142.603 E.00836
G1 X171.67 Y137.249 E.25116
G1 X168.89 Y137.249 E.09221
G1 X176.494 Y144.853 E.35671
G1 X174.865 Y144.853 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X176.494 Y144.853 E-.61876
G1 X176.231 Y144.59 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z9 I.648 J-1.03 P1  F30000
G1 X134.898 Y118.602 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2771
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2771
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.785 Y121.763 Z9.2 F30000
G1 X119.448 Y123.496 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2771
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X127.376 Y118.948 E.33325
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X127.948 Y126.052 E.3098
G1 X128.052 Y126.052 E.00344
G1 X120.948 Y118.948 E.33325
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.052 Y121.054 Z9.2 F30000
G1 X182.266 Y136.903 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2771
G1 X182.266 Y141.051 E.13759
G1 X182.266 Y145.199 E.13759
G1 X165.97 Y145.199 E.54056
G1 X165.97 Y136.903 E.27519
G1 X182.206 Y136.903 E.53857
G1 X182.658 Y136.511 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2771
G1 X182.658 Y141.051 E.1395
G1 X182.658 Y145.591 E.1395
G1 X165.578 Y145.591 E.52482
G1 X165.578 Y136.511 E.279
G1 X182.598 Y136.511 E.52298
M204 S10000
; WIPE_START
G1 F24000
G1 X182.624 Y138.51 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X181.92 Y144.853 Z9.2 F30000
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2771
G1 X166.316 Y144.853 E.51761
G1 X166.316 Y137.249 E.25223
G1 X181.92 Y137.249 E.51761
G1 X181.92 Y144.793 E.25024
G1 X174.458 Y144.445 F30000
G1 F2771
G1 X176.087 Y144.445 E.05401
G1 X169.297 Y137.656 E.31852
G1 X171.263 Y137.656 E.0652
G1 X166.723 Y142.195 E.21296
G1 X166.723 Y142.758 E.01865
G1 X168.411 Y144.445 E.07917
G1 X172.149 Y144.445 E.124
G1 X178.939 Y137.656 E.31852
G1 X176.973 Y137.656 E.0652
G1 X181.513 Y142.195 E.21296
G1 X181.513 Y142.758 E.01865
G1 X179.825 Y144.445 E.07917
G1 X178.197 Y144.445 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X179.825 Y144.445 E-.61876
G1 X180.088 Y144.183 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z9.2 I.599 J-1.059 P1  F30000
G1 X134.898 Y118.602 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2769
G1 X134.898 Y126.398 E.2586
G1 X131 Y126.398 E.1293
G1 X119.102 Y126.398 E.39468
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2769
G1 X135.29 Y126.79 E.26364
G1 X131 Y126.79 E.13182
G1 X118.71 Y126.79 E.37764
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.244 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.617 Y120.509 Z9.4 F30000
G1 X119.448 Y120.828 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2769
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X128.052 Y126.052 E.33325
G1 X127.948 Y126.052 E.00344
G1 X134.552 Y119.448 E.3098
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X120.272 Y126.052 E.33325
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
M73 P52 R13
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.217 Y126.769 Z9.4 F30000
G1 X182.266 Y136.903 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2769
G1 X182.266 Y141.051 E.13759
G1 X182.266 Y145.199 E.13759
G1 X165.97 Y145.199 E.54056
G1 X165.97 Y136.903 E.27519
G1 X182.206 Y136.903 E.53857
G1 X182.658 Y136.511 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2769
G1 X182.658 Y141.051 E.1395
G1 X182.658 Y145.591 E.1395
G1 X165.578 Y145.591 E.52482
G1 X165.578 Y136.511 E.279
G1 X182.598 Y136.511 E.52298
M204 S10000
; WIPE_START
G1 F24000
G1 X182.624 Y138.51 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X181.92 Y144.853 Z9.4 F30000
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2769
G1 X166.316 Y144.853 E.51761
G1 X166.316 Y137.249 E.25223
G1 X181.92 Y137.249 E.51761
G1 X181.92 Y144.793 E.25024
G1 X178.197 Y144.445 F30000
G1 F2769
G1 X179.825 Y144.445 E.05401
G1 X181.513 Y142.758 E.07917
G1 X181.513 Y142.195 E.01865
G1 X176.973 Y137.656 E.21296
G1 X178.939 Y137.656 E.0652
G1 X172.149 Y144.445 E.31852
G1 X168.411 Y144.445 E.124
G1 X166.723 Y142.758 E.07917
G1 X166.723 Y142.195 E.01865
G1 X171.263 Y137.656 E.21296
G1 X169.297 Y137.656 E.0652
G1 X176.087 Y144.445 E.31852
G1 X174.458 Y144.445 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P52 R12
G1 F24000
G1 X176.087 Y144.445 E-.61876
G1 X175.824 Y144.183 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z9.4 I.645 J-1.032 P1  F30000
G1 X134.898 Y118.602 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2771
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2771
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.785 Y121.763 Z9.6 F30000
G1 X119.448 Y123.496 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2771
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X127.376 Y118.948 E.33325
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X127.948 Y126.052 E.3098
G1 X128.052 Y126.052 E.00344
G1 X120.948 Y118.948 E.33325
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.052 Y121.054 Z9.6 F30000
G1 X182.266 Y136.903 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2771
G1 X182.266 Y141.051 E.13759
G1 X182.266 Y145.199 E.13759
G1 X165.97 Y145.199 E.54056
G1 X165.97 Y136.903 E.27519
G1 X182.206 Y136.903 E.53857
G1 X182.658 Y136.511 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2771
G1 X182.658 Y141.051 E.1395
G1 X182.658 Y145.591 E.1395
G1 X165.578 Y145.591 E.52482
G1 X165.578 Y136.511 E.279
G1 X182.598 Y136.511 E.52298
M204 S10000
; WIPE_START
G1 F24000
G1 X182.624 Y138.51 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X181.92 Y144.853 Z9.6 F30000
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2771
G1 X166.316 Y144.853 E.51761
G1 X166.316 Y137.249 E.25223
G1 X181.92 Y137.249 E.51761
G1 X181.92 Y144.793 E.25024
G1 X174.458 Y144.445 F30000
G1 F2771
G1 X176.087 Y144.445 E.05401
G1 X169.297 Y137.656 E.31852
G1 X171.263 Y137.656 E.0652
G1 X166.723 Y142.195 E.21296
G1 X166.723 Y142.758 E.01865
G1 X168.411 Y144.445 E.07917
G1 X172.149 Y144.445 E.124
G1 X178.939 Y137.656 E.31852
G1 X176.973 Y137.656 E.0652
G1 X181.513 Y142.195 E.21296
G1 X181.513 Y142.758 E.01865
G1 X179.825 Y144.445 E.07917
G1 X178.197 Y144.445 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X179.825 Y144.445 E-.61876
G1 X180.088 Y144.183 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z9.6 I.599 J-1.059 P1  F30000
G1 X134.898 Y118.602 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2769
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2769
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.631 Y120.508 Z9.8 F30000
G1 X119.448 Y120.828 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2769
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X128.052 Y126.052 E.33325
M73 P53 R12
G1 X127.948 Y126.052 E.00344
G1 X134.552 Y119.448 E.3098
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X120.272 Y126.052 E.33325
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.217 Y126.769 Z9.8 F30000
G1 X182.266 Y136.903 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2769
G1 X182.266 Y145.199 E.27519
G1 X165.97 Y145.199 E.54056
G1 X165.97 Y141.051 E.13759
G1 X165.97 Y136.903 E.13759
G1 X182.206 Y136.903 E.53857
G1 X182.658 Y136.511 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2769
G1 X182.658 Y145.591 E.279
G1 X165.578 Y145.591 E.52482
G1 X165.578 Y141.051 E.1395
G1 X165.578 Y136.511 E.1395
G1 X182.598 Y136.511 E.52298
M204 S10000
; WIPE_START
G1 F24000
G1 X182.611 Y138.511 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X181.92 Y144.853 Z9.8 F30000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2769
G1 X166.316 Y144.853 E.51761
G1 X166.316 Y137.249 E.25223
G1 X181.92 Y137.249 E.51761
G1 X181.92 Y144.793 E.25024
G1 X178.197 Y144.445 F30000
G1 F2769
G1 X179.825 Y144.445 E.05401
G1 X181.513 Y142.758 E.07917
G1 X181.513 Y142.195 E.01865
G1 X176.973 Y137.656 E.21296
G1 X178.939 Y137.656 E.0652
G1 X172.149 Y144.445 E.31852
G1 X168.411 Y144.445 E.124
G1 X166.723 Y142.758 E.07917
G1 X166.723 Y142.195 E.01865
G1 X171.263 Y137.656 E.21296
G1 X169.297 Y137.656 E.0652
G1 X176.087 Y144.445 E.31852
G1 X174.458 Y144.445 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X176.087 Y144.445 E-.61876
G1 X175.824 Y144.183 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z9.8 I.645 J-1.032 P1  F30000
G1 X134.898 Y118.602 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F7777
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F7777
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.785 Y121.763 Z10 F30000
G1 X119.448 Y123.496 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7777
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X127.376 Y118.948 E.33325
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X127.948 Y126.052 E.3098
G1 X128.052 Y126.052 E.00344
G1 X120.948 Y118.948 E.33325
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.052 Y121.054 Z10 F30000
G1 X182.266 Y136.903 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F7777
G1 X182.266 Y141.051 E.13759
G1 X182.266 Y145.199 E.13759
G1 X165.97 Y145.199 E.54056
G1 X165.97 Y136.903 E.27519
G1 X182.206 Y136.903 E.53857
G1 X182.658 Y136.511 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F7777
G1 X182.658 Y141.051 E.1395
G1 X182.658 Y145.591 E.1395
G1 X165.578 Y145.591 E.52482
G1 X165.578 Y136.511 E.279
G1 X182.598 Y136.511 E.52298
M204 S10000
; WIPE_START
G1 F24000
G1 X182.624 Y138.51 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X181.894 Y145.034 Z10 F30000
G1 Z9.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.407454
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X181.894 Y137.27 E.41244
G1 X181.437 Y137.27 E.0243
G1 X181.437 Y144.831 E.40168
G1 X180.98 Y144.831 E.0243
G1 X180.98 Y137.27 E.40168
G1 X180.522 Y137.27 E.0243
G1 X180.522 Y144.831 E.40168
G1 X180.065 Y144.831 E.0243
G1 X180.065 Y137.27 E.40168
G1 X179.607 Y137.27 E.0243
G1 X179.607 Y144.831 E.40168
G1 X179.15 Y144.831 E.0243
G1 X179.15 Y137.27 E.40168
G1 X178.692 Y137.27 E.0243
G1 X178.692 Y144.831 E.40168
G1 X178.235 Y144.831 E.0243
G1 X178.235 Y137.27 E.40168
G1 X177.777 Y137.27 E.0243
G1 X177.777 Y144.831 E.40168
G1 X177.32 Y144.831 E.0243
G1 X177.32 Y137.27 E.40168
G1 X176.862 Y137.27 E.0243
G1 X176.862 Y144.831 E.40168
G1 X176.405 Y144.831 E.0243
G1 X176.405 Y137.27 E.40168
G1 X175.948 Y137.27 E.0243
G1 X175.948 Y144.831 E.40168
G1 X175.49 Y144.831 E.0243
G1 X175.49 Y137.27 E.40168
G1 X175.033 Y137.27 E.0243
G1 X175.033 Y144.831 E.40168
G1 X174.575 Y144.831 E.0243
G1 X174.575 Y137.27 E.40168
G1 X174.118 Y137.27 E.0243
G1 X174.118 Y144.831 E.40168
G1 X173.66 Y144.831 E.0243
G1 X173.66 Y137.27 E.40168
G1 X173.203 Y137.27 E.0243
G1 X173.203 Y144.831 E.40168
G1 X172.745 Y144.831 E.0243
G1 X172.745 Y137.27 E.40168
G1 X172.288 Y137.27 E.0243
G1 X172.288 Y144.831 E.40168
G1 X171.83 Y144.831 E.0243
G1 X171.83 Y137.27 E.40168
G1 X171.373 Y137.27 E.0243
G1 X171.373 Y144.831 E.40168
G1 X170.916 Y144.831 E.0243
G1 X170.916 Y137.27 E.40168
G1 X170.458 Y137.27 E.0243
G1 X170.458 Y144.831 E.40168
G1 X170.001 Y144.831 E.0243
G1 X170.001 Y137.27 E.40168
G1 X169.543 Y137.27 E.0243
G1 X169.543 Y144.831 E.40168
G1 X169.086 Y144.831 E.0243
G1 X169.086 Y137.27 E.40168
G1 X168.628 Y137.27 E.0243
G1 X168.628 Y144.831 E.40168
G1 X168.171 Y144.831 E.0243
G1 X168.171 Y137.27 E.40168
G1 X167.713 Y137.27 E.0243
G1 X167.713 Y144.831 E.40168
G1 X167.256 Y144.831 E.0243
G1 X167.256 Y137.27 E.40168
G1 X166.798 Y137.27 E.0243
G1 X166.798 Y144.831 E.40168
G1 X166.341 Y144.831 E.0243
G1 X166.341 Y137.068 E.41244
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X166.341 Y139.068 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z10 I.664 J-1.02 P1  F30000
G1 X134.898 Y118.602 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4667
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
M73 P54 R12
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4667
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.631 Y120.508 Z10.2 F30000
G1 X119.448 Y120.828 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4667
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X128.052 Y126.052 E.33325
G1 X127.948 Y126.052 E.00344
G1 X134.552 Y119.448 E.3098
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X120.272 Y126.052 E.33325
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.217 Y126.769 Z10.2 F30000
G1 X182.266 Y136.903 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4667
G1 X182.266 Y145.199 E.27519
G1 X165.97 Y145.199 E.54056
G1 X165.97 Y136.903 E.27519
G1 X178.118 Y136.903 E.40297
G1 X182.206 Y136.903 E.1356
G1 X182.658 Y136.511 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4667
G1 X182.658 Y145.591 E.279
G1 X165.578 Y145.591 E.52482
G1 X165.578 Y136.511 E.279
G1 X178.118 Y136.511 E.38532
G1 X182.598 Y136.511 E.13766
M204 S10000
; WIPE_START
G1 F24000
G1 X182.611 Y138.511 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X182.104 Y137.827 Z10.2 F30000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420385
G1 F4667
G1 X181.511 Y137.234 E.02581
G1 X180.977 Y137.234 E.01642
G1 X181.935 Y138.191 E.04165
G1 X181.935 Y138.725 E.01642
G1 X180.443 Y137.234 E.06487
G1 X179.91 Y137.234 E.01642
G1 X181.935 Y139.259 E.08809
G1 X181.935 Y139.793 E.01642
G1 X179.376 Y137.234 E.11131
G1 X178.842 Y137.234 E.01642
G1 X181.935 Y140.327 E.13453
G1 X181.935 Y140.86 E.01642
G1 X178.308 Y137.234 E.15775
G1 X177.774 Y137.234 E.01642
G1 X181.935 Y141.394 E.18098
G1 X181.935 Y141.928 E.01642
G1 X177.24 Y137.234 E.2042
G1 X176.707 Y137.234 E.01642
G1 X181.935 Y142.462 E.22742
G1 X181.935 Y142.996 E.01642
G1 X176.173 Y137.234 E.25064
G1 X175.639 Y137.234 E.01642
G1 X181.935 Y143.529 E.27386
G1 X181.935 Y144.063 E.01642
G1 X175.105 Y137.234 E.29708
G1 X174.571 Y137.234 E.01642
G1 X181.935 Y144.597 E.3203
G1 X181.935 Y144.868 E.00832
G1 X181.671 Y144.868 E.0081
G1 X174.038 Y137.234 E.33207
G1 X173.504 Y137.234 E.01642
G1 X181.138 Y144.868 E.33207
G1 X180.604 Y144.868 E.01642
G1 X172.97 Y137.234 E.33207
G1 X172.436 Y137.234 E.01642
G1 X180.07 Y144.868 E.33207
G1 X179.536 Y144.868 E.01642
G1 X171.902 Y137.234 E.33207
G1 X171.368 Y137.234 E.01642
G1 X179.002 Y144.868 E.33207
G1 X178.468 Y144.868 E.01642
G1 X170.835 Y137.234 E.33207
G1 X170.301 Y137.234 E.01642
G1 X177.935 Y144.868 E.33207
G1 X177.401 Y144.868 E.01642
G1 X169.767 Y137.234 E.33207
G1 X169.233 Y137.234 E.01642
G1 X176.867 Y144.868 E.33207
G1 X176.333 Y144.868 E.01642
G1 X168.699 Y137.234 E.33207
G1 X168.166 Y137.234 E.01642
G1 X175.799 Y144.868 E.33207
G1 X175.266 Y144.868 E.01642
G1 X167.632 Y137.234 E.33207
G1 X167.098 Y137.234 E.01642
G1 X174.732 Y144.868 E.33207
G1 X174.198 Y144.868 E.01642
G1 X166.564 Y137.234 E.33207
G1 X166.301 Y137.234 E.0081
G1 X166.301 Y137.504 E.00832
G1 X173.664 Y144.868 E.3203
G1 X173.13 Y144.868 E.01642
G1 X166.301 Y138.038 E.29707
G1 X166.301 Y138.572 E.01642
G1 X172.596 Y144.868 E.27385
G1 X172.063 Y144.868 E.01642
G1 X166.301 Y139.106 E.25063
G1 X166.301 Y139.64 E.01642
G1 X171.529 Y144.868 E.22741
G1 X170.995 Y144.868 E.01642
G1 X166.301 Y140.173 E.20419
G1 X166.301 Y140.707 E.01642
G1 X170.461 Y144.868 E.18097
G1 X169.927 Y144.868 E.01642
G1 X166.301 Y141.241 E.15775
G1 X166.301 Y141.775 E.01642
G1 X169.394 Y144.868 E.13453
G1 X168.86 Y144.868 E.01642
G1 X166.301 Y142.309 E.11131
G1 X166.301 Y142.842 E.01642
G1 X168.326 Y144.868 E.08809
G1 X167.792 Y144.868 E.01642
G1 X166.301 Y143.376 E.06487
G1 X166.301 Y143.91 E.01642
G1 X167.258 Y144.868 E.04165
G1 X166.725 Y144.868 E.01642
G1 X166.131 Y144.274 E.02581
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X166.725 Y144.868 E-.31885
G1 X167.258 Y144.868 E-.20285
G1 X166.815 Y144.424 E-.2383
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z10.2 I.765 J-.946 P1  F30000
G1 X134.898 Y118.602 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4943
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4943
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.785 Y121.763 Z10.4 F30000
G1 X119.448 Y123.496 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4943
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X127.376 Y118.948 E.33325
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X127.948 Y126.052 E.3098
G1 X128.052 Y126.052 E.00344
G1 X120.948 Y118.948 E.33325
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; start printing object, unique label id: 140
M624 AgAAAAAAAAA=
G1 X127.052 Y121.054 Z10.4 F30000
G1 X182.266 Y136.903 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F4943
G1 X182.266 Y141.051 E.13759
G1 X182.266 Y145.199 E.13759
G1 X165.97 Y145.199 E.54056
G1 X165.97 Y136.903 E.27519
G1 X182.206 Y136.903 E.53857
G1 X182.658 Y136.511 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F4943
G1 X182.658 Y141.051 E.1395
G1 X182.658 Y145.591 E.1395
G1 X165.578 Y145.591 E.52482
G1 X165.578 Y136.511 E.279
G1 X182.598 Y136.511 E.52298
M204 S10000
; WIPE_START
G1 F24000
G1 X182.624 Y138.51 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X182.043 Y144.206 Z10.4 F30000
G1 Z10
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F4943
G1 X181.273 Y144.976 E.03345
G1 X180.74 Y144.976
G1 X182.043 Y143.673 E.05663
G1 X182.043 Y143.14
G1 X180.207 Y144.976 E.0798
G1 X179.674 Y144.976
G1 X182.043 Y142.607 E.10297
G1 X182.043 Y142.073
G1 X179.14 Y144.976 E.12615
G1 X178.607 Y144.976
G1 X182.043 Y141.54 E.14932
G1 X182.043 Y141.007
G1 X178.074 Y144.976 E.17249
G1 X177.541 Y144.976
G1 X182.043 Y140.473 E.19567
G1 X182.043 Y139.94
G1 X177.007 Y144.976 E.21884
G1 X176.474 Y144.976
G1 X182.043 Y139.407 E.24201
G1 X182.043 Y138.874
G1 X175.941 Y144.976 E.26519
G1 X175.408 Y144.976
G1 X182.043 Y138.34 E.28836
G1 X182.043 Y137.807
G1 X174.874 Y144.976 E.31153
G1 X174.341 Y144.976
G1 X182.043 Y137.274 E.3347
G1 X181.659 Y137.125
G1 X173.808 Y144.976 E.34117
G1 X173.274 Y144.976
G1 X181.125 Y137.125 E.34117
G1 X180.592 Y137.125
G1 X172.741 Y144.976 E.34117
G1 X172.208 Y144.976
G1 X180.059 Y137.125 E.34117
G1 X179.526 Y137.125
G1 X171.675 Y144.976 E.34117
G1 X171.141 Y144.976
G1 X178.992 Y137.125 E.34117
G1 X178.459 Y137.125
G1 X170.608 Y144.976 E.34117
G1 X170.075 Y144.976
M73 P55 R12
G1 X177.926 Y137.125 E.34117
G1 X177.393 Y137.125
G1 X169.542 Y144.976 E.34117
G1 X169.008 Y144.976
G1 X176.859 Y137.125 E.34117
G1 X176.326 Y137.125
G1 X168.475 Y144.976 E.34117
G1 X167.942 Y144.976
G1 X175.793 Y137.125 E.34117
G1 X175.26 Y137.125
G1 X167.408 Y144.976 E.34117
G1 X166.875 Y144.976
G1 X174.726 Y137.125 E.34117
G1 X174.193 Y137.125
G1 X166.342 Y144.976 E.34117
G1 X166.192 Y144.593
G1 X173.66 Y137.125 E.3245
G1 X173.126 Y137.125
G1 X166.192 Y144.059 E.30132
G1 X166.192 Y143.526
G1 X172.593 Y137.125 E.27815
G1 X172.06 Y137.125
G1 X166.192 Y142.993 E.25498
G1 X166.192 Y142.459
G1 X171.527 Y137.125 E.2318
G1 X170.993 Y137.125
G1 X166.192 Y141.926 E.20863
G1 X166.192 Y141.393
G1 X170.46 Y137.125 E.18546
G1 X169.927 Y137.125
G1 X166.192 Y140.86 E.16228
G1 X166.192 Y140.326
G1 X169.394 Y137.125 E.13911
G1 X168.86 Y137.125
G1 X166.192 Y139.793 E.11594
G1 X166.192 Y139.26
G1 X168.327 Y137.125 E.09276
G1 X167.794 Y137.125
G1 X166.192 Y138.727 E.06959
G1 X166.192 Y138.193
G1 X167.26 Y137.125 E.04642
G1 X166.727 Y137.125
G1 X166.192 Y137.66 E.02324
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X166.727 Y137.125 E-.28747
G1 X167.26 Y137.125 E-.20264
G1 X166.758 Y137.627 E-.26989
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 140
M625
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
M106 S255
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z10.4 I.624 J-1.045 P1  F30000
G1 X134.898 Y118.602 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1200
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.631 Y120.508 Z10.6 F30000
G1 X119.448 Y120.828 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X128.052 Y126.052 E.33325
G1 X127.948 Y126.052 E.00344
G1 X134.552 Y119.448 E.3098
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X120.272 Y126.052 E.33325
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z10.6 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1200
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.785 Y121.763 Z10.8 F30000
G1 X119.448 Y123.496 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X127.376 Y118.948 E.33325
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X127.948 Y126.052 E.3098
G1 X128.052 Y126.052 E.00344
G1 X120.948 Y118.948 E.33325
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z10.8 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1200
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
M73 P55 R11
G1 X118.71 Y118.21 E.26364
M73 P56 R11
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.631 Y120.508 Z11 F30000
G1 X119.448 Y120.828 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X128.052 Y126.052 E.33325
G1 X127.948 Y126.052 E.00344
G1 X134.552 Y119.448 E.3098
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X120.272 Y126.052 E.33325
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
M106 S252.45
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z11 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1396
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1396
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.415 Y120.181 Z11.2 F30000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1396
G1 X127.812 Y119.576 E.02832
G1 X127.162 Y119.162 E.02558
G1 X127.376 Y118.948 E.01005
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X129.218 Y124.782 E.25021
G1 X129.218 Y126.052 E.04213
G1 X129.576 Y126.052 E.01188
G1 X128.404 Y124.776 F30000
G1 F1396
G1 X128.404 Y125.645 E.02883
G1 X127.645 Y125.645 E.02519
G1 X123.005 Y121.005 E.21768
G2 X122.595 Y122.392 I2.557 J1.509 E.04846
G1 X122.595 Y123.729 E.04436
G1 X126.572 Y119.79 E.18569
G3 X127.826 Y120.749 I-1.073 J2.703 E.05303
G1 X125.596 Y119.179 F30000
G1 F1396
G1 X126.195 Y119.251 E.02003
G1 X126.771 Y119.431 E.02002
G1 X127.306 Y119.713 E.02003
G1 X127.78 Y120.086 E.02003
G1 X128.178 Y120.54 E.02003
G1 X128.488 Y121.058 E.02002
G1 X128.698 Y121.624 E.02003
G1 X128.803 Y122.22 E.02008
G3 X128.811 Y126.052 I-62.122 J2.052 E.12713
G1 X122.189 Y126.052 E.21968
G3 X122.19 Y122.326 I42.975 J-1.844 E.12365
G1 X122.339 Y121.497 E.02791
G1 X122.571 Y120.94 E.02003
G1 X122.902 Y120.434 E.02008
G1 X123.318 Y119.998 E.01997
G1 X123.808 Y119.642 E.02008
M73 P57 R11
G1 X124.353 Y119.382 E.02003
G1 X124.936 Y119.226 E.02002
G1 X125.536 Y119.178 E.01996
G1 X119.448 Y123.496 F30000
G1 F1396
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X121.781 Y124.543 E.07079
G3 X121.817 Y121.959 I14.806 J-1.085 E.08581
G1 X122.063 Y121.066 E.03073
G1 X122.413 Y120.413 E.02457
G1 X120.948 Y118.948 E.06874
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z11.2 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1396
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1396
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.826 Y120.749 Z11.4 F30000
G1 Z11
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1396
G1 X127.822 Y120.742 E.00026
G2 X126.544 Y119.78 I-2.346 J1.784 E.05374
G1 X122.595 Y123.729 E.18526
G3 X122.742 Y121.574 I5.884 J-.682 E.07204
G3 X123.005 Y121.005 I2.905 J.996 E.02085
G1 X127.645 Y125.645 E.21768
G1 X128.404 Y125.645 E.02519
G1 X128.404 Y124.776 E.02883
G1 X129.576 Y126.052 F30000
G1 F1396
G1 X129.218 Y126.052 E.01188
G1 X129.218 Y124.782 E.04213
G1 X134.552 Y119.448 E.25021
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X127.162 Y119.162 E.01005
G1 X127.812 Y119.576 E.02558
G1 X128.415 Y120.181 E.02832
G1 X125.596 Y119.179 F30000
G1 F1396
G1 X126.195 Y119.251 E.02003
G1 X126.771 Y119.431 E.02002
G1 X127.306 Y119.713 E.02003
G1 X127.78 Y120.086 E.02003
G1 X128.178 Y120.54 E.02003
G1 X128.488 Y121.058 E.02002
G1 X128.698 Y121.624 E.02003
G1 X128.803 Y122.22 E.02008
G3 X128.811 Y126.052 I-62.122 J2.052 E.12713
G1 X122.189 Y126.052 E.21968
G3 X122.19 Y122.326 I42.975 J-1.844 E.12365
G1 X122.339 Y121.497 E.02791
G1 X122.571 Y120.94 E.02003
G1 X122.902 Y120.434 E.02008
G1 X123.318 Y119.998 E.01997
G1 X123.808 Y119.642 E.02008
G1 X124.353 Y119.382 E.02003
G1 X124.936 Y119.226 E.02002
G1 X125.536 Y119.178 E.01996
G1 X119.448 Y120.828 F30000
G1 F1396
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.413 Y120.413 E.06874
G1 X121.951 Y121.375 E.03539
G1 X121.781 Y122.369 E.03347
G2 X121.781 Y124.543 I50.888 J1.081 E.07211
G1 X120.272 Y126.052 E.07079
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z11.4 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1396
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1396
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.415 Y120.181 Z11.6 F30000
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1396
G1 X127.812 Y119.576 E.02832
G1 X127.162 Y119.162 E.02558
G1 X127.376 Y118.948 E.01005
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X129.218 Y124.782 E.25021
G1 X129.218 Y126.052 E.04213
G1 X129.576 Y126.052 E.01188
G1 X128.404 Y124.776 F30000
G1 F1396
G1 X128.404 Y125.645 E.02883
G1 X127.645 Y125.645 E.02519
G1 X123.005 Y121.005 E.21768
G2 X122.595 Y122.392 I2.557 J1.509 E.04846
G1 X122.595 Y123.729 E.04436
G1 X126.572 Y119.79 E.18569
G3 X127.826 Y120.749 I-1.073 J2.703 E.05303
G1 X125.596 Y119.179 F30000
G1 F1396
G1 X126.195 Y119.251 E.02003
G1 X126.771 Y119.431 E.02002
G1 X127.306 Y119.713 E.02003
G1 X127.78 Y120.086 E.02003
G1 X128.178 Y120.54 E.02003
G1 X128.488 Y121.058 E.02002
G1 X128.698 Y121.624 E.02003
G1 X128.803 Y122.22 E.02008
G3 X128.811 Y126.052 I-62.122 J2.052 E.12713
G1 X122.189 Y126.052 E.21968
G3 X122.19 Y122.326 I42.975 J-1.844 E.12365
G1 X122.339 Y121.497 E.02791
G1 X122.571 Y120.94 E.02003
G1 X122.902 Y120.434 E.02008
G1 X123.318 Y119.998 E.01997
G1 X123.808 Y119.642 E.02008
M73 P58 R11
G1 X124.353 Y119.382 E.02003
G1 X124.936 Y119.226 E.02002
G1 X125.536 Y119.178 E.01996
G1 X119.448 Y123.496 F30000
G1 F1396
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X121.781 Y124.543 E.07079
G3 X121.817 Y121.959 I14.806 J-1.085 E.08581
G1 X122.063 Y121.066 E.03073
G1 X122.413 Y120.413 E.02457
G1 X120.948 Y118.948 E.06874
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z11.6 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1396
G1 X134.898 Y126.398 E.2586
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1396
G1 X135.29 Y126.79 E.26364
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.244 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.826 Y120.749 Z11.8 F30000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1396
G1 X127.822 Y120.742 E.00026
G2 X126.544 Y119.78 I-2.346 J1.784 E.05374
G1 X122.595 Y123.729 E.18526
G3 X122.742 Y121.574 I5.884 J-.682 E.07204
G3 X123.005 Y121.005 I2.905 J.996 E.02085
G1 X127.645 Y125.645 E.21768
G1 X128.404 Y125.645 E.02519
G1 X128.404 Y124.776 E.02883
G1 X129.576 Y126.052 F30000
G1 F1396
G1 X129.218 Y126.052 E.01188
G1 X129.218 Y124.782 E.04213
G1 X134.552 Y119.448 E.25021
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X127.162 Y119.162 E.01005
G1 X127.812 Y119.576 E.02558
G1 X128.415 Y120.181 E.02832
G1 X125.596 Y119.179 F30000
G1 F1396
G1 X126.195 Y119.251 E.02003
G1 X126.771 Y119.431 E.02002
G1 X127.306 Y119.713 E.02003
G1 X127.78 Y120.086 E.02003
G1 X128.178 Y120.54 E.02003
G1 X128.488 Y121.058 E.02002
G1 X128.698 Y121.624 E.02003
G1 X128.803 Y122.22 E.02008
G3 X128.811 Y126.052 I-62.122 J2.052 E.12713
G1 X122.189 Y126.052 E.21968
G3 X122.19 Y122.326 I42.975 J-1.844 E.12365
G1 X122.339 Y121.497 E.02791
G1 X122.571 Y120.94 E.02003
G1 X122.902 Y120.434 E.02008
G1 X123.318 Y119.998 E.01997
G1 X123.808 Y119.642 E.02008
G1 X124.353 Y119.382 E.02003
G1 X124.936 Y119.226 E.02002
G1 X125.536 Y119.178 E.01996
G1 X119.448 Y120.828 F30000
G1 F1396
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.413 Y120.413 E.06874
G1 X121.951 Y121.375 E.03539
G1 X121.781 Y122.369 E.03347
G2 X121.781 Y124.543 I50.888 J1.081 E.07211
G1 X120.272 Y126.052 E.07079
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z11.8 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1421
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1421
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.415 Y120.181 Z12 F30000
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1421
G1 X127.812 Y119.576 E.02832
G1 X127.162 Y119.162 E.02558
G1 X127.376 Y118.948 E.01005
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X129.218 Y124.782 E.25021
G1 X129.218 Y126.052 E.04213
G1 X129.576 Y126.052 E.01188
G1 X128.246 Y126.233 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.423907
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X128.79 Y124.68 E.09459
G1 X128.79 Y123.247 E.08244
G1 X127.815 Y126.03 E.1696
G1 X127.313 Y126.03 E.02887
G1 X128.745 Y121.94 E.24923
G1 X128.662 Y121.574 E.02158
G1 X128.513 Y121.169 E.02478
G1 X126.81 Y126.03 E.29617
G1 X126.308 Y126.03 E.02887
G1 X128.204 Y120.617 E.32984
G1 X127.974 Y120.319 E.02166
G1 X127.852 Y120.19 E.0102
G1 X125.806 Y126.03 E.35583
G1 X125.304 Y126.03 E.02887
G1 X127.468 Y119.853 E.37639
G1 X127.244 Y119.699 E.01561
G1 X127.057 Y119.591 E.0124
G1 X124.802 Y126.03 E.39232
G1 X124.3 Y126.03 E.02887
G1 X126.623 Y119.398 E.40408
G1 X126.166 Y119.267 E.0273
G1 X123.798 Y126.03 E.41207
G1 X123.296 Y126.03 E.02887
G1 X125.686 Y119.206 E.41579
G1 X125.18 Y119.216 E.02908
M73 P59 R11
G1 X122.793 Y126.03 E.41519
G1 X122.291 Y126.03 E.02887
G1 X124.644 Y119.312 E.40934
G1 X124.36 Y119.402 E.01714
G1 X124.067 Y119.528 E.01837
G1 X122.21 Y124.829 E.323
G1 X122.21 Y123.397 E.08239
G1 X123.42 Y119.941 E.21052
G1 X123.156 Y120.179 E.02039
G1 X122.956 Y120.402 E.01726
G1 X122.776 Y120.642 E.01727
G1 X122.619 Y120.898 E.01726
G1 X122.495 Y121.147 E.01599
G1 X122.007 Y122.542 E.08495
M106 S252.45
G1 X119.448 Y123.496 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1421
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X121.781 Y124.543 E.07079
G3 X121.817 Y121.959 I14.806 J-1.085 E.08581
G1 X122.063 Y121.066 E.03073
G1 X122.413 Y120.413 E.02457
G1 X120.948 Y118.948 E.06874
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z12 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1972
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1972
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.627 Y120.923 Z12.2 F30000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.434562
G1 F1972
G1 X127.698 Y119.993 E.04195
G1 X127.515 Y119.841 E.0076
G1 X127.265 Y119.669 E.00969
G1 X127 Y119.52 E.00969
G1 X126.723 Y119.395 E.00969
G1 X126.452 Y119.302 E.00916
G1 X128.689 Y121.538 E.10094
G1 X128.768 Y121.859 E.01056
G1 X128.818 Y122.221 E.01166
G1 X125.772 Y119.175 E.13746
G1 X125.538 Y119.163 E.00747
G1 X125.218 Y119.175 E.01023
G1 X128.826 Y122.783 E.16286
G1 X128.826 Y123.337 E.01768
G1 X124.741 Y119.252 E.18439
G1 X124.316 Y119.381 E.01416
G1 X128.826 Y123.891 E.20355
G1 X128.826 Y124.445 E.01768
G1 X123.936 Y119.555 E.2207
G1 X123.591 Y119.764 E.01287
G1 X128.826 Y124.999 E.23626
G1 X128.826 Y125.553 E.01768
G1 X123.283 Y120.01 E.25018
G1 X123.008 Y120.288 E.0125
G1 X128.787 Y126.067 E.26082
G1 X128.233 Y126.067 E.01768
G1 X122.763 Y120.598 E.24685
G1 X122.554 Y120.942 E.01287
G1 X127.679 Y126.067 E.2313
G1 X127.125 Y126.067 E.01768
G1 X122.384 Y121.326 E.21397
G1 X122.255 Y121.751 E.01416
G1 X126.571 Y126.067 E.19481
G1 X126.017 Y126.067 E.01768
G1 X122.183 Y122.233 E.17304
G1 X122.173 Y122.776 E.01735
G1 X125.463 Y126.067 E.14851
G1 X124.909 Y126.067 E.01768
G1 X122.173 Y123.33 E.1235
G1 X122.173 Y123.884 E.01768
G1 X124.356 Y126.067 E.0985
G1 X123.802 Y126.067 E.01768
G1 X122.173 Y124.438 E.0735
G1 X122.173 Y124.992 E.01768
G1 X123.248 Y126.067 E.0485
G1 X122.694 Y126.067 E.01768
G1 X122.004 Y125.377 E.03115
G1 X119.448 Y120.828 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1972
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
M73 P59 R10
G1 X120.948 Y118.948 E.0414
G1 X122.413 Y120.413 E.06874
G1 X121.951 Y121.374 E.03537
G1 X121.781 Y122.369 E.03347
G2 X121.781 Y124.543 I50.626 J1.082 E.07213
G1 X120.272 Y126.052 E.07079
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
G1 X129.576 Y126.052 F30000
G1 F1972
G1 X129.218 Y126.052 E.01188
G1 X129.218 Y124.782 E.04213
G1 X134.552 Y119.448 E.25021
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X127.162 Y119.162 E.01005
G1 X127.813 Y119.577 E.0256
G1 X128.415 Y120.181 E.02831
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.813 Y119.577 E-.32426
G1 X127.162 Y119.162 E-.29326
G1 X127.376 Y118.948 E-.11512
G1 X127.448 Y118.948 E-.02737
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z12.2 I.056 J1.216 P1  F30000
G1 X134.898 Y118.602 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1938
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1938
G1 X135.29 Y122.5 E.13182
G1 X135.29 Y126.79 E.13182
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.044 Y120.541 Z12.4 F30000
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1938
G2 X126.774 Y119.55 I-2.524 J1.927 E.05402
G1 X127.376 Y118.948 E.02826
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.704 Y125.296 E.27436
G1 X128.704 Y126.052 E.02506
G1 X129.576 Y126.052 E.02896
G1 X128.481 Y125.785 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1938
G1 X128.091 Y126.176 E.01695
G1 X127.558 Y126.176
G1 X128.481 Y125.252 E.04013
G1 X128.481 Y124.719
G1 X127.024 Y126.176 E.0633
G1 X126.491 Y126.176
G1 X128.481 Y124.186 E.08647
G1 X128.481 Y123.652
G1 X125.958 Y126.176 E.10964
G1 X125.425 Y126.176
G1 X128.481 Y123.119 E.13282
G1 X128.482 Y122.585
G1 X124.891 Y126.176 E.15601
G1 X124.358 Y126.176
G1 X128.453 Y122.08 E.17795
G1 X128.359 Y121.641
G1 X123.825 Y126.176 E.19704
G1 X123.292 Y126.176
G1 X128.213 Y121.254 E.21387
G1 X128.027 Y120.906
G1 X122.758 Y126.176 E.22897
G1 X122.519 Y125.882
G1 X127.803 Y120.598 E.22963
G1 X127.547 Y120.32
G1 X122.519 Y125.349 E.21851
G1 X122.518 Y124.816
M73 P60 R10
G1 X127.254 Y120.08 E.20579
G1 X126.928 Y119.873
G1 X122.518 Y124.283 E.19162
G1 X122.518 Y123.749
G1 X126.563 Y119.705 E.17577
G1 X126.153 Y119.581
G1 X122.518 Y123.216 E.15797
G1 X122.518 Y122.683
G1 X125.686 Y119.515 E.13765
G1 X125.136 Y119.532
G1 X122.538 Y122.129 E.11286
G1 X122.719 Y121.415
G1 X124.425 Y119.709 E.07413
M204 S10000
G1 X125.939 Y119.523 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.148326
G1 F1938
G1 X125.819 Y119.565 E.0011
G1 X125.675 Y119.496 E.00137
G1 X124.786 Y119.592 F30000
; LINE_WIDTH: 0.0881695
G1 F1938
G1 X124.481 Y119.766 E.00129
G1 X123.79 Y120.048 F30000
; LINE_WIDTH: 0.113642
G1 F1938
G2 X123.065 Y120.773 I4.053 J4.779 E.00592
G1 X119.448 Y123.496 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1938
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.296 Y124.028 E.09494
G3 X122.379 Y121.756 I8.567 J-.823 E.07563
G3 X122.786 Y120.786 I3.069 J.719 E.03506
G1 X120.948 Y118.948 E.08624
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z12.4 I-.857 J.864 P1  F30000
G1 X122.927 Y122.131 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1261
G1 X122.897 Y122.41 E.00931
G1 X122.898 Y126.398 E.13229
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.412 I-213.719 J-1.824 E.13223
G1 X127.981 Y121.713 E.02351
G1 X127.678 Y121.071 E.02353
G1 X127.214 Y120.535 E.02353
G1 X126.621 Y120.145 E.02353
G1 X125.945 Y119.929 E.02353
G1 X125.236 Y119.904 E.02353
G1 X124.547 Y120.072 E.02353
G1 X123.929 Y120.419 E.02353
G1 X123.427 Y120.921 E.02353
G1 X123.08 Y121.54 E.02353
G1 X122.934 Y122.071 E.01829
G1 X123.331 Y122.105 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1261
G1 X123.312 Y122.176 E.00225
G1 X123.289 Y122.41 E.00722
G1 X123.29 Y126.79 E.13459
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-648.426 J-2.274 E.13289
G1 X127.622 Y121.869 E.01852
G1 X127.375 Y121.319 E.01853
G1 X126.988 Y120.856 E.01853
G1 X126.491 Y120.515 E.01853
G1 X125.92 Y120.32 E.01853
G1 X125.317 Y120.288 E.01853
G1 X124.729 Y120.419 E.01853
G1 X124.197 Y120.705 E.01853
G1 X123.763 Y121.123 E.01853
G1 X123.458 Y121.644 E.01853
G1 X123.347 Y122.048 E.01287
M204 S10000
; WIPE_START
G1 F24000
G1 X123.312 Y122.176 E-.05061
G1 X123.289 Y122.41 E-.08926
G1 X123.289 Y124.042 E-.62012
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z12.6 F30000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1261
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.988 Y120.988 E.09568
G2 X122.554 Y122.334 I2.881 J1.671 E.04727
G1 X122.553 Y123.771 E.04768
G1 X120.272 Y126.052 E.107
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z12.6 F30000
G1 X129.577 Y126.052 Z12.6
G1 Z12.2
G1 E.8 F1800
G1 F1261
G1 X128.448 Y126.052 E.03743
G1 X128.448 Y125.552 E.01658
G1 X134.552 Y119.448 E.28635
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.566 Y119.758 E.03801
G3 X127.844 Y120.726 I-1.094 J2.773 E.05384
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.421 Y120.258 E-.23979
G1 X126.953 Y119.929 E-.21723
G1 X126.566 Y119.758 E-.16084
G1 X126.83 Y119.494 E-.14214
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z12.6 I-.681 J-1.009 P1  F30000
G1 X122.928 Y122.128 Z12.6
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1263
G1 X122.897 Y122.41 E.00942
G1 X122.898 Y126.398 E.13228
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.412 I-213.933 J-1.824 E.13222
G1 X127.981 Y121.713 E.02352
G1 X127.679 Y121.072 E.02349
G1 X127.214 Y120.535 E.02357
G1 X126.622 Y120.146 E.02349
G1 X125.945 Y119.929 E.02357
G1 X125.237 Y119.904 E.0235
G1 X124.547 Y120.072 E.02357
G1 X123.929 Y120.419 E.0235
G1 X123.427 Y120.921 E.02357
G1 X123.08 Y121.539 E.0235
G1 X122.934 Y122.068 E.01822
G1 X123.329 Y122.113 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1263
G1 X123.312 Y122.173 E.00193
G1 X123.289 Y122.41 E.00731
G1 X123.29 Y126.79 E.13458
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-649.341 J-2.274 E.13288
G1 X127.622 Y121.869 E.01853
G1 X127.375 Y121.32 E.0185
G1 X126.988 Y120.856 E.01857
G1 X126.492 Y120.515 E.0185
G1 X125.92 Y120.32 E.01857
G1 X125.318 Y120.288 E.0185
G1 X124.729 Y120.419 E.01857
G1 X124.198 Y120.704 E.0185
G1 X123.763 Y121.123 E.01856
G1 X123.458 Y121.643 E.01851
G1 X123.345 Y122.055 E.01313
M204 S10000
; WIPE_START
G1 F24000
G1 X123.312 Y122.173 E-.04667
G1 X123.289 Y122.41 E-.09044
G1 X123.289 Y124.049 E-.62289
; WIPE_END
G1 E-.04 F1800
G1 X124.353 Y119.687 Z12.8 F30000
G1 Z12.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.497944
G1 F1263
G1 X124.544 Y119.625 E.00745
G1 X127.843 Y120.726 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P61 R10
G1 F1263
G2 X126.566 Y119.758 I-2.369 J1.801 E.05384
G1 X127.376 Y118.948 E.03802
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.448 Y125.552 E.28635
G1 X128.448 Y126.052 E.01658
G1 X129.577 Y126.052 E.03743
; WIPE_START
G1 F24000
G1 X128.448 Y126.052 E-.42881
G1 X128.448 Y125.552 E-.18995
G1 X128.711 Y125.289 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X121.217 Y123.838 Z12.8 F30000
G1 X119.448 Y123.496 Z12.8
G1 Z12.4
G1 E.8 F1800
G1 F1263
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.553 Y123.771 E.107
G3 X122.598 Y121.986 I7.083 J-.715 E.05937
G3 X122.988 Y120.988 I2.145 J.261 E.03594
G1 X120.948 Y118.948 E.09568
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z12.8 I-.856 J.865 P1  F30000
G1 X122.928 Y122.126 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1261
G1 X122.897 Y122.413 E.00955
G1 X122.898 Y126.398 E.1322
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.412 I-212.433 J-1.823 E.13223
G1 X127.981 Y121.711 E.02358
G1 X127.678 Y121.071 E.02346
G1 X127.215 Y120.537 E.02347
G1 X126.625 Y120.147 E.02348
G1 X125.947 Y119.93 E.0236
G1 X125.237 Y119.904 E.02358
G1 X124.552 Y120.07 E.02336
G1 X123.928 Y120.419 E.02372
G1 X123.428 Y120.92 E.02348
G1 X123.08 Y121.54 E.02358
G1 X122.935 Y122.067 E.01813
G1 X123.326 Y122.12 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1261
G1 X123.312 Y122.172 E.00163
G1 X123.289 Y122.413 E.00744
G1 X123.29 Y126.79 E.13451
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-644.63 J-2.271 E.13288
G1 X127.621 Y121.867 E.01858
G1 X127.375 Y121.319 E.01848
G1 X126.989 Y120.857 E.01848
G1 X126.494 Y120.516 E.01848
G1 X125.921 Y120.321 E.01859
G1 X125.317 Y120.288 E.01858
G1 X124.733 Y120.418 E.01838
G1 X124.197 Y120.705 E.01869
G1 X123.764 Y121.122 E.01848
G1 X123.458 Y121.644 E.01858
G1 X123.342 Y122.063 E.01334
M204 S10000
; WIPE_START
G1 F24000
G1 X123.312 Y122.172 E-.04294
G1 X123.289 Y122.413 E-.09202
G1 X123.289 Y124.057 E-.62504
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z13 F30000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1261
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.988 Y120.988 E.09568
G2 X122.554 Y122.336 I2.86 J1.664 E.04734
G1 X122.553 Y123.771 E.04761
G1 X120.272 Y126.052 E.107
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z13 F30000
G1 X129.577 Y126.052 Z13
G1 Z12.6
G1 E.8 F1800
G1 F1261
G1 X128.448 Y126.052 E.03743
G1 X128.448 Y125.552 E.01658
G1 X134.552 Y119.448 E.28635
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.565 Y119.759 E.03802
G3 X127.844 Y120.726 I-1.091 J2.769 E.05384
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.422 Y120.259 E-.23881
G1 X126.957 Y119.931 E-.21663
G1 X126.565 Y119.759 E-.16242
G1 X126.83 Y119.494 E-.14213
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z13 I-.68 J-1.009 P1  F30000
G1 X122.928 Y122.124 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.897 Y122.414 E.00965
G1 X122.898 Y126.398 E.13216
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.412 I-211.934 J-1.823 E.13224
G1 X127.98 Y121.71 E.0236
G1 X127.678 Y121.071 E.02344
G1 X127.216 Y120.537 E.02344
G1 X126.626 Y120.147 E.02345
G1 X125.948 Y119.93 E.02363
G1 X125.237 Y119.904 E.0236
G1 X124.554 Y120.069 E.02329
G1 X123.928 Y120.42 E.02379
G1 X123.428 Y120.92 E.02346
G1 X123.08 Y121.54 E.0236
G1 X122.935 Y122.065 E.01807
G1 X123.324 Y122.129 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.313 Y122.17 E.00131
G1 X123.289 Y122.414 E.00753
G1 X123.29 Y126.79 E.13447
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-642.872 J-2.27 E.13289
G1 X127.621 Y121.867 E.0186
G1 X127.375 Y121.319 E.01846
G1 X126.99 Y120.858 E.01846
G1 X126.495 Y120.517 E.01846
G1 X125.922 Y120.321 E.01861
G1 X125.317 Y120.288 E.0186
G1 X124.735 Y120.417 E.01832
G1 X124.197 Y120.705 E.01876
G1 X123.764 Y121.122 E.01846
G1 X123.458 Y121.644 E.0186
G1 X123.34 Y122.071 E.0136
M204 S10000
; WIPE_START
G1 F24000
G1 X123.313 Y122.17 E-.03906
G1 X123.289 Y122.414 E-.09313
G1 X123.289 Y124.066 E-.62781
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z13.2 F30000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1260
G1 X119.448 Y125.124 E.05401
M73 P62 R10
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.553 Y123.771 E.107
G3 X122.599 Y121.983 I7.135 J-.713 E.0595
G3 X122.988 Y120.988 I2.138 J.263 E.03581
G1 X120.948 Y118.948 E.09568
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
G1 X127.172 Y120.579 Z13.2 F30000
G1 X127.844 Y120.726 Z13.2
G1 Z12.8
G1 E.8 F1800
G1 F1260
G2 X126.565 Y119.759 I-2.367 J1.8 E.05384
G1 X127.376 Y118.948 E.03803
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.448 Y125.552 E.28635
G1 X128.448 Y126.052 E.01658
G1 X129.577 Y126.052 E.03743
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.448 Y126.052 E-.42881
G1 X128.448 Y125.552 E-.18995
G1 X128.711 Y125.289 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z13.2 I.585 J-1.067 P1  F30000
G1 X122.929 Y122.123 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1262
G1 X122.897 Y122.415 E.00975
G1 X122.898 Y126.398 E.13213
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y122.415 E.13213
G1 X119.102 Y118.602 E.12648
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y126.398 E.2586
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.411 I-211.408 J-1.823 E.13224
G1 X127.98 Y121.709 E.02362
G1 X127.679 Y121.071 E.02341
G1 X127.216 Y120.538 E.02341
G1 X126.627 Y120.148 E.02343
G1 X125.948 Y119.93 E.02366
G1 X125.237 Y119.904 E.02362
G1 X124.556 Y120.069 E.02322
G1 X123.928 Y120.42 E.02387
G1 X123.429 Y120.919 E.02344
G1 X123.08 Y121.54 E.02362
G1 X122.935 Y122.063 E.018
G1 X123.322 Y122.137 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1262
G1 X123.313 Y122.168 E.00099
G1 X123.289 Y122.415 E.00762
G1 X123.29 Y126.79 E.13444
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y122.415 E.13444
G1 X118.71 Y118.21 E.1292
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y126.79 E.26364
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-641.139 J-2.269 E.13289
G1 X127.621 Y121.866 E.01862
G1 X127.375 Y121.319 E.01844
G1 X126.99 Y120.858 E.01844
G1 X126.496 Y120.518 E.01844
G1 X125.922 Y120.321 E.01863
G1 X125.317 Y120.288 E.01862
G1 X124.737 Y120.416 E.01825
G1 X124.197 Y120.705 E.01882
G1 X123.764 Y121.122 E.01844
G1 X123.458 Y121.644 E.01862
G1 X123.338 Y122.079 E.01386
M204 S10000
; WIPE_START
G1 F24000
G1 X123.313 Y122.168 E-.03504
G1 X123.289 Y122.415 E-.09426
G1 X123.289 Y124.075 E-.63069
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z13.4 F30000
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1262
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.988 Y120.988 E.09569
G2 X122.554 Y122.337 I2.843 J1.659 E.0474
G1 X122.553 Y123.771 E.04756
G1 X120.272 Y126.052 E.107
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z13.4 F30000
G1 X129.577 Y126.052 Z13.4
G1 Z13
G1 E.8 F1800
G1 F1262
G1 X128.448 Y126.052 E.03743
G1 X128.448 Y125.552 E.01658
G1 X134.552 Y119.448 E.28635
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.565 Y119.759 E.03803
G3 X127.844 Y120.726 I-1.087 J2.766 E.05384
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.424 Y120.261 E-.23804
G1 X126.959 Y119.933 E-.21612
G1 X126.565 Y119.759 E-.16371
G1 X126.83 Y119.494 E-.14213
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z13.4 I-.68 J-1.009 P1  F30000
G1 X122.929 Y122.121 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.897 Y122.416 E.00985
G1 X122.898 Y126.398 E.13209
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.411 I-210.879 J-1.822 E.13224
G1 X127.98 Y121.709 E.02365
G1 X127.679 Y121.071 E.02338
G1 X127.217 Y120.538 E.02338
G1 X126.629 Y120.149 E.02341
G1 X125.949 Y119.93 E.02369
G1 X125.237 Y119.904 E.02364
G1 X124.558 Y120.068 E.02315
G1 X123.928 Y120.42 E.02394
G1 X123.429 Y120.919 E.02341
G1 X123.08 Y121.54 E.02363
G1 X122.936 Y122.061 E.01794
G1 X123.319 Y122.145 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.313 Y122.166 E.00066
G1 X123.289 Y122.416 E.00771
G1 X123.29 Y126.79 E.1344
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-639.76 J-2.268 E.13289
G1 X127.621 Y121.865 E.01864
G1 X127.375 Y121.319 E.01842
G1 X126.991 Y120.858 E.01842
G1 X126.497 Y120.518 E.01842
G1 X125.923 Y120.321 E.01866
G1 X125.317 Y120.288 E.01864
G1 X124.739 Y120.416 E.01819
G1 X124.197 Y120.705 E.01888
G1 X123.765 Y121.121 E.01842
G1 X123.458 Y121.644 E.01864
G1 X123.335 Y122.088 E.01413
M204 S10000
; WIPE_START
G1 F24000
G1 X123.313 Y122.166 E-.03092
G1 X123.289 Y122.416 E-.09538
G1 X123.289 Y124.084 E-.6337
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z13.6 F30000
M73 P63 R10
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1260
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.553 Y123.771 E.107
G3 X122.599 Y121.979 I7.153 J-.712 E.05963
G3 X122.988 Y120.988 I2.133 J.265 E.03567
G1 X120.948 Y118.948 E.09569
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
G1 X127.172 Y120.579 Z13.6 F30000
G1 X127.844 Y120.726 Z13.6
G1 Z13.2
G1 E.8 F1800
G1 F1260
G2 X126.565 Y119.759 I-2.364 J1.797 E.05384
G1 X127.376 Y118.948 E.03804
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.448 Y125.552 E.28635
G1 X128.448 Y126.052 E.01658
G1 X129.577 Y126.052 E.03743
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P63 R9
G1 F24000
G1 X128.448 Y126.052 E-.42881
G1 X128.448 Y125.552 E-.18995
G1 X128.711 Y125.289 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z13.6 I.585 J-1.067 P1  F30000
G1 X122.929 Y122.119 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1262
G1 X122.897 Y122.417 E.00995
G1 X122.898 Y126.398 E.13205
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.411 I-210.393 J-1.822 E.13225
G1 X127.98 Y121.708 E.02367
G1 X127.679 Y121.071 E.02336
G1 X127.218 Y120.539 E.02336
G1 X126.63 Y120.149 E.02339
G1 X125.949 Y119.93 E.02372
G1 X125.237 Y119.904 E.02365
G1 X124.56 Y120.067 E.02308
G1 X123.928 Y120.42 E.02402
G1 X123.429 Y120.918 E.02339
G1 X123.08 Y121.54 E.02365
G1 X122.936 Y122.059 E.01788
G1 X123.316 Y122.154 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1262
G1 X123.314 Y122.164 E.00032
G1 X123.289 Y122.417 E.0078
G1 X123.29 Y126.79 E.13437
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-638.074 J-2.267 E.13289
G1 X127.62 Y121.865 E.01866
G1 X127.375 Y121.319 E.01839
G1 X126.991 Y120.859 E.01839
G1 X126.498 Y120.519 E.0184
G1 X125.923 Y120.321 E.01868
G1 X125.317 Y120.288 E.01866
G1 X124.741 Y120.415 E.01813
G1 X124.197 Y120.705 E.01895
G1 X123.765 Y121.121 E.0184
G1 X123.458 Y121.644 E.01866
G1 X123.332 Y122.097 E.01441
M204 S10000
; WIPE_START
G1 F24000
G1 X123.314 Y122.164 E-.0267
G1 X123.289 Y122.417 E-.0965
G1 X123.289 Y124.093 E-.6368
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z13.8 F30000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1262
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.988 Y120.988 E.09569
G2 X122.554 Y122.339 I2.827 J1.653 E.04745
G1 X122.553 Y123.771 E.0475
G1 X120.272 Y126.052 E.107
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z13.8 F30000
G1 X129.577 Y126.052 Z13.8
G1 Z13.4
G1 E.8 F1800
G1 F1262
G1 X128.448 Y126.052 E.03743
G1 X128.448 Y125.552 E.01658
G1 X134.552 Y119.448 E.28635
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.565 Y119.759 E.03804
G3 X127.844 Y120.726 I-1.084 J2.762 E.05384
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.425 Y120.262 E-.23726
G1 X126.962 Y119.934 E-.21562
G1 X126.565 Y119.759 E-.16498
G1 X126.83 Y119.494 E-.14213
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z13.8 I-.679 J-1.01 P1  F30000
G1 X122.93 Y122.117 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.897 Y122.418 E.01005
G1 X122.898 Y126.398 E.13202
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.411 I-209.876 J-1.822 E.13225
G1 X127.979 Y121.707 E.02369
G1 X127.679 Y121.071 E.02333
G1 X127.218 Y120.539 E.02333
G1 X126.631 Y120.15 E.02336
G1 X125.95 Y119.93 E.02375
G1 X125.237 Y119.904 E.02367
G1 X124.562 Y120.066 E.02301
G1 X123.928 Y120.42 E.02409
G1 X123.43 Y120.918 E.02337
G1 X123.08 Y121.54 E.02367
G1 X122.936 Y122.057 E.01781
G1 X123.314 Y122.164 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.289 Y122.418 E.00785
G1 X123.29 Y126.79 E.13434
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-636.373 J-2.266 E.13289
G1 X127.62 Y121.864 E.01868
G1 X127.375 Y121.319 E.01837
G1 X126.992 Y120.859 E.01837
G1 X126.5 Y120.519 E.01838
G1 X125.924 Y120.321 E.0187
G1 X125.317 Y120.288 E.01868
G1 X124.743 Y120.415 E.01807
M73 P64 R9
G1 X124.197 Y120.705 E.01901
G1 X123.765 Y121.12 E.01838
G1 X123.457 Y121.645 E.01868
G1 X123.33 Y122.106 E.01471
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.418 E-.11963
G1 X123.289 Y124.103 E-.64037
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z14 F30000
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1260
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.553 Y123.771 E.107
G3 X122.6 Y121.975 I7.171 J-.712 E.05977
G3 X122.988 Y120.988 I2.128 J.267 E.03554
G1 X120.948 Y118.948 E.09569
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
G1 X127.172 Y120.579 Z14 F30000
G1 X127.844 Y120.726 Z14
G1 Z13.6
G1 E.8 F1800
G1 F1260
G2 X126.565 Y119.759 I-2.361 J1.794 E.05384
G1 X127.376 Y118.948 E.03804
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.448 Y125.552 E.28635
G1 X128.448 Y126.052 E.01658
G1 X129.577 Y126.052 E.03743
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.448 Y126.052 E-.42881
G1 X128.448 Y125.552 E-.18995
G1 X128.711 Y125.289 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z14 I.586 J-1.067 P1  F30000
G1 X122.93 Y122.115 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1262
G1 X122.897 Y122.419 E.01015
G1 X122.898 Y126.398 E.13198
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.411 I-209.39 J-1.821 E.13225
G1 X127.979 Y121.706 E.02371
G1 X127.679 Y121.071 E.0233
G1 X127.219 Y120.54 E.0233
G1 X126.633 Y120.151 E.02334
G1 X125.951 Y119.93 E.02378
G1 X125.237 Y119.904 E.02369
G1 X124.564 Y120.066 E.02294
G1 X123.928 Y120.42 E.02417
G1 X123.43 Y120.917 E.02335
G1 X123.08 Y121.54 E.02369
G1 X122.937 Y122.055 E.01775
G1 X123.313 Y122.174 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1262
G1 X123.289 Y122.419 E.00758
G1 X123.29 Y126.79 E.1343
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-634.658 J-2.265 E.13289
G1 X127.62 Y121.863 E.0187
G1 X127.375 Y121.319 E.01835
G1 X126.992 Y120.86 E.01835
G1 X126.501 Y120.52 E.01836
G1 X125.925 Y120.322 E.01873
G1 X125.317 Y120.288 E.0187
G1 X124.745 Y120.414 E.01801
G1 X124.196 Y120.705 E.01908
G1 X123.766 Y121.12 E.01836
G1 X123.457 Y121.645 E.0187
G1 X123.327 Y122.115 E.01501
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.419 E-.11634
G1 X123.289 Y124.113 E-.64367
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z14.2 F30000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1262
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.988 Y120.988 E.09569
G2 X122.554 Y122.341 I2.811 J1.648 E.04751
G1 X122.553 Y123.771 E.04744
G1 X120.272 Y126.052 E.107
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z14.2 F30000
G1 X129.577 Y126.052 Z14.2
G1 Z13.8
G1 E.8 F1800
G1 F1262
G1 X128.448 Y126.052 E.03743
G1 X128.448 Y125.552 E.01658
G1 X134.552 Y119.448 E.28635
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.565 Y119.759 E.03805
G3 X127.844 Y120.726 I-1.081 J2.759 E.05384
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.427 Y120.263 E-.23647
G1 X126.965 Y119.936 E-.21512
G1 X126.565 Y119.759 E-.16627
G1 X126.829 Y119.495 E-.14213
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z14.2 I-.681 J-1.009 P1  F30000
G1 X122.928 Y122.127 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.897 Y122.42 E.00978
G1 X122.898 Y126.398 E.13194
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.411 I-208.873 J-1.821 E.13226
G1 X127.979 Y121.706 E.02373
G1 X127.679 Y121.071 E.02328
G1 X127.22 Y120.541 E.02328
G1 X126.634 Y120.152 E.02332
G1 X125.951 Y119.93 E.02381
G1 X125.237 Y119.904 E.02371
G1 X124.567 Y120.065 E.02288
G1 X123.928 Y120.42 E.02424
G1 X123.43 Y120.917 E.02333
G1 X123.079 Y121.541 E.02375
G1 X122.934 Y122.067 E.01811
G1 X123.311 Y122.184 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.289 Y122.42 E.0073
G1 X123.29 Y126.79 E.13427
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-633.306 J-2.264 E.13289
G1 X127.62 Y121.863 E.01872
G1 X127.375 Y121.319 E.01833
G1 X126.993 Y120.86 E.01833
G1 X126.502 Y120.521 E.01834
G1 X125.925 Y120.322 E.01875
M73 P65 R9
G1 X125.317 Y120.288 E.01872
G1 X124.746 Y120.413 E.01795
G1 X124.196 Y120.706 E.01914
G1 X123.766 Y121.12 E.01834
G1 X123.457 Y121.645 E.01874
G1 X123.325 Y122.126 E.01531
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.42 E-.11282
G1 X123.289 Y124.123 E-.64718
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z14.4 F30000
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1260
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.553 Y123.771 E.10699
G3 X122.598 Y121.985 I7.301 J-.709 E.05942
G3 X122.988 Y120.988 I2.136 J.261 E.03589
G1 X120.948 Y118.948 E.09569
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
G1 X127.172 Y120.579 Z14.4 F30000
G1 X127.843 Y120.726 Z14.4
G1 Z14
G1 E.8 F1800
G1 F1260
G2 X126.565 Y119.759 I-2.359 J1.791 E.05384
G1 X127.376 Y118.948 E.03805
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.448 Y125.552 E.28635
G1 X128.448 Y126.052 E.01658
G1 X129.577 Y126.052 E.03743
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.448 Y126.052 E-.42881
G1 X128.448 Y125.552 E-.18995
G1 X128.711 Y125.289 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z14.4 I.584 J-1.068 P1  F30000
G1 X122.928 Y122.127 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1261
G1 X122.897 Y122.421 E.00983
G1 X122.898 Y126.398 E.13191
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.411 I-208.394 J-1.821 E.13226
G1 X127.979 Y121.705 E.02376
G1 X127.679 Y121.071 E.02325
G1 X127.22 Y120.541 E.02325
G1 X126.636 Y120.152 E.0233
G1 X125.952 Y119.931 E.02384
G1 X125.237 Y119.904 E.02373
G1 X124.569 Y120.064 E.02281
G1 X123.928 Y120.42 E.02431
G1 X123.431 Y120.917 E.02331
G1 X123.079 Y121.541 E.02378
G1 X122.934 Y122.067 E.01809
G1 X122.934 Y122.067 E0
G1 X123.31 Y122.194 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1261
G1 X123.289 Y122.421 E.00702
G1 X123.29 Y126.79 E.13423
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-631.614 J-2.263 E.13289
G1 X127.619 Y121.862 E.01874
G1 X127.375 Y121.319 E.01831
G1 X126.993 Y120.861 E.01831
G1 X126.503 Y120.521 E.01832
G1 X125.926 Y120.322 E.01877
G1 X125.317 Y120.288 E.01874
G1 X124.748 Y120.413 E.01789
G1 X124.196 Y120.706 E.0192
G1 X123.766 Y121.119 E.01832
G1 X123.457 Y121.645 E.01876
G1 X123.322 Y122.136 E.01562
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.421 E-.10937
G1 X123.289 Y124.134 E-.65063
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z14.6 F30000
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1261
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.988 Y120.988 E.0957
G2 X122.553 Y122.347 I2.831 J1.654 E.04773
G1 X122.553 Y123.771 E.04723
G1 X120.272 Y126.052 E.10699
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z14.6 F30000
G1 X129.577 Y126.052 Z14.6
G1 Z14.2
G1 E.8 F1800
G1 F1261
G1 X128.448 Y126.052 E.03743
G1 X128.448 Y125.552 E.01658
G1 X134.552 Y119.448 E.28635
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.565 Y119.759 E.03805
G3 X127.843 Y120.726 I-1.078 J2.756 E.05384
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.429 Y120.265 E-.23569
G1 X126.968 Y119.938 E-.21462
G1 X126.565 Y119.759 E-.16756
G1 X126.829 Y119.495 E-.14213
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z14.6 I-.681 J-1.009 P1  F30000
G1 X122.928 Y122.126 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.897 Y122.423 E.00988
G1 X122.898 Y126.398 E.13187
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X130.007 Y118.602 E.36175
G1 X134.898 Y118.602 E.16223
G1 X134.898 Y126.398 E.2586
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.411 I-207.88 J-1.82 E.13227
G1 X127.978 Y121.704 E.02378
G1 X127.679 Y121.071 E.02322
G1 X127.221 Y120.542 E.02322
G1 X126.635 Y120.152 E.02335
G1 X125.935 Y119.928 E.02437
G1 X125.237 Y119.904 E.02317
G1 X124.571 Y120.064 E.02274
G1 X123.928 Y120.42 E.02439
G1 X123.431 Y120.916 E.02328
G1 X123.079 Y121.541 E.0238
G1 X122.934 Y122.067 E.01807
G1 X122.934 Y122.067 E.00001
G1 X123.309 Y122.205 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.289 Y122.423 E.00673
G1 X123.29 Y126.79 E.1342
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X130.007 Y118.21 E.34714
G1 X135.29 Y118.21 E.16232
G1 X135.29 Y126.79 E.26364
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-629.929 J-2.262 E.1329
G1 X127.619 Y121.861 E.01876
G1 X127.375 Y121.319 E.01829
G1 X126.994 Y120.861 E.01829
M73 P66 R9
G1 X126.504 Y120.522 E.01832
G1 X125.91 Y120.319 E.01926
G1 X125.317 Y120.288 E.01827
G1 X124.75 Y120.412 E.01782
G1 X124.196 Y120.706 E.01927
G1 X123.767 Y121.119 E.0183
G1 X123.457 Y121.646 E.01878
G1 X123.319 Y122.146 E.01594
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.423 E-.10587
G1 X123.289 Y124.144 E-.65413
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z14.8 F30000
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1260
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.553 Y123.771 E.10699
G3 X122.598 Y121.984 I7.341 J-.708 E.05945
G3 X122.988 Y120.988 I2.133 J.261 E.03586
G1 X120.948 Y118.948 E.0957
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
G1 X127.172 Y120.578 Z14.8 F30000
G1 X127.843 Y120.725 Z14.8
G1 Z14.4
G1 E.8 F1800
G1 F1260
G2 X126.564 Y119.76 I-2.347 J1.78 E.05384
G1 X127.376 Y118.948 E.03809
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.448 Y125.552 E.28635
G1 X128.448 Y126.052 E.01658
G1 X129.577 Y126.052 E.03743
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.448 Y126.052 E-.42881
G1 X128.448 Y125.552 E-.18995
G1 X128.711 Y125.289 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z14.8 I.584 J-1.068 P1  F30000
G1 X122.928 Y122.126 Z14.8
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1261
G1 X122.897 Y122.424 E.00993
G1 X122.898 Y126.398 E.13183
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.411 I-207.403 J-1.82 E.13227
G1 X127.978 Y121.703 E.0238
G1 X127.679 Y121.071 E.0232
G1 X127.222 Y120.542 E.0232
G1 X126.636 Y120.153 E.02333
G1 X125.934 Y119.927 E.02444
G1 X125.237 Y119.904 E.02314
G1 X124.573 Y120.063 E.02267
G1 X123.927 Y120.42 E.02446
G1 X123.431 Y120.916 E.02326
G1 X123.079 Y121.542 E.02382
G1 X122.934 Y122.066 E.01805
G1 X122.934 Y122.066 E.00001
G1 X123.308 Y122.215 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1261
G1 X123.289 Y122.424 E.00644
G1 X123.29 Y126.79 E.13416
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-628.592 J-2.262 E.1329
G1 X127.619 Y121.861 E.01879
G1 X127.375 Y121.319 E.01827
G1 X126.994 Y120.862 E.01827
G1 X126.505 Y120.522 E.01831
G1 X125.91 Y120.319 E.01932
G1 X125.317 Y120.288 E.01825
G1 X124.752 Y120.412 E.01776
G1 X124.196 Y120.706 E.01933
G1 X123.767 Y121.118 E.01828
G1 X123.457 Y121.646 E.0188
G1 X123.316 Y122.156 E.01626
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.424 E-.10233
G1 X123.289 Y124.154 E-.65767
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z15 F30000
G1 Z14.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1261
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.988 Y120.988 E.0957
G2 X122.553 Y122.35 I2.822 J1.651 E.04781
G1 X122.553 Y123.771 E.04714
G1 X120.272 Y126.052 E.10699
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z15 F30000
G1 X129.577 Y126.052 Z15
G1 Z14.6
G1 E.8 F1800
G1 F1261
G1 X128.448 Y126.052 E.03743
G1 X128.448 Y125.552 E.01658
G1 X134.552 Y119.448 E.28635
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.564 Y119.76 E.03809
G3 X127.843 Y120.725 I-1.066 J2.743 E.05384
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.43 Y120.266 E-.23477
G1 X126.971 Y119.939 E-.21419
G1 X126.564 Y119.76 E-.1689
G1 X126.828 Y119.496 E-.14214
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z15 I-.68 J-1.009 P1  F30000
G1 X122.928 Y122.126 Z15
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.897 Y122.425 E.00998
G1 X122.898 Y126.398 E.1318
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y121.003 E.17895
G1 X119.102 Y118.602 E.07965
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y126.398 E.2586
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.411 I-206.929 J-1.82 E.13227
G1 X127.978 Y121.703 E.02382
G1 X127.679 Y121.071 E.02317
G1 X127.222 Y120.543 E.02317
G1 X126.637 Y120.153 E.02332
G1 X125.934 Y119.927 E.02451
G1 X125.237 Y119.904 E.02311
G1 X124.575 Y120.062 E.0226
G1 X123.927 Y120.42 E.02453
G1 X123.432 Y120.915 E.02324
G1 X123.079 Y121.542 E.02385
G1 X122.935 Y122.066 E.01803
G1 X122.934 Y122.066 E.00001
G1 X123.307 Y122.226 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
M73 P66 R8
G1 F1260
G1 X123.289 Y122.425 E.00614
G1 X123.29 Y126.79 E.13413
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y121.003 E.17781
G1 X118.71 Y118.21 E.08583
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y126.79 E.26364
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-626.92 J-2.261 E.1329
G1 X127.619 Y121.86 E.01881
G1 X127.375 Y121.319 E.01824
M73 P67 R8
G1 X126.995 Y120.862 E.01824
G1 X126.506 Y120.523 E.01829
G1 X125.909 Y120.319 E.01939
G1 X125.317 Y120.288 E.01823
G1 X124.754 Y120.411 E.0177
G1 X124.196 Y120.706 E.01939
G1 X123.767 Y121.118 E.01826
G1 X123.457 Y121.646 E.01882
G1 X123.314 Y122.166 E.01658
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.425 E-.09876
G1 X123.289 Y124.165 E-.66124
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z15.2 F30000
G1 Z14.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1260
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.553 Y123.771 E.10699
G3 X122.598 Y121.983 I7.381 J-.707 E.05948
G3 X122.988 Y120.988 I2.131 J.261 E.03583
G1 X120.948 Y118.948 E.0957
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
G1 X127.172 Y120.578 Z15.2 F30000
G1 X127.843 Y120.725 Z15.2
G1 Z14.8
G1 E.8 F1800
G1 F1260
G2 X126.564 Y119.76 I-2.343 J1.776 E.05384
G1 X127.376 Y118.948 E.0381
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.448 Y125.552 E.28635
G1 X128.448 Y126.052 E.01658
G1 X129.577 Y126.052 E.03743
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.448 Y126.052 E-.42881
G1 X128.448 Y125.552 E-.18995
G1 X128.711 Y125.289 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z15.2 I.615 J-1.05 P1  F30000
G1 X122.968 Y121.928 Z15.2
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1261
G1 X122.897 Y122.426 E.01669
G1 X122.898 Y126.398 E.13176
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.41 I-206.424 J-1.82 E.13228
G1 X127.978 Y121.702 E.02385
G1 X127.679 Y121.072 E.02314
G1 X127.223 Y120.543 E.02314
G1 X126.638 Y120.154 E.0233
G1 X125.933 Y119.927 E.02459
G1 X125.237 Y119.904 E.02308
G1 X124.601 Y120.05 E.02165
G1 X124.126 Y120.283 E.01757
G1 X123.585 Y120.732 E.02332
G1 X123.167 Y121.343 E.02457
G1 X122.979 Y121.853 E.01801
G1 X122.977 Y121.868 E.00053
G1 X123.314 Y122.236 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1261
G1 X123.289 Y122.426 E.0059
G1 X123.29 Y126.79 E.1341
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-625.262 J-2.26 E.1329
G1 X127.619 Y121.859 E.01883
G1 X127.375 Y121.319 E.01822
G1 X126.995 Y120.863 E.01822
G1 X126.507 Y120.524 E.01827
G1 X125.908 Y120.318 E.01945
G1 X125.317 Y120.288 E.0182
G1 X124.804 Y120.393 E.01609
G1 X124.367 Y120.593 E.01476
G1 X123.902 Y120.964 E.01827
G1 X123.535 Y121.479 E.01945
G1 X123.347 Y121.988 E.01668
G1 X123.322 Y122.176 E.00582
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.426 E-.09571
G1 X123.289 Y124.174 E-.66429
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1261
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.978 Y120.978 E.09522
G2 X122.551 Y122.418 I2.97 J1.664 E.05024
G1 X122.551 Y123.773 E.04495
G1 X120.272 Y126.052 E.10691
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z15.4 F30000
G1 X129.577 Y126.052 Z15.4
G1 Z15
G1 E.8 F1800
G1 F1261
G1 X128.448 Y126.052 E.03743
G1 X128.448 Y125.552 E.01658
G1 X134.552 Y119.448 E.28635
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.564 Y119.76 E.0381
G3 X127.843 Y120.725 I-1.061 J2.738 E.05384
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.432 Y120.267 E-.23395
G1 X126.974 Y119.941 E-.21369
G1 X126.564 Y119.76 E-.17021
G1 X126.828 Y119.496 E-.14215
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z15.4 I-.649 J-1.03 P1  F30000
G1 X122.968 Y121.929 Z15.4
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.897 Y122.427 E.0167
G1 X122.898 Y126.398 E.13172
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.41 I-205.956 J-1.819 E.13228
G1 X127.978 Y121.701 E.02387
G1 X127.679 Y121.072 E.02312
G1 X127.224 Y120.544 E.02312
G1 X126.64 Y120.155 E.02328
G1 X125.932 Y119.927 E.02466
G1 X125.238 Y119.904 E.02305
G1 X124.603 Y120.049 E.02158
G1 X124.126 Y120.283 E.01763
G1 X123.586 Y120.732 E.0233
G1 X123.166 Y121.345 E.02464
G1 X122.979 Y121.854 E.01799
G1 X122.977 Y121.869 E.00052
G1 X123.313 Y122.246 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.289 Y122.427 E.0056
G1 X123.29 Y126.79 E.13406
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-623.949 J-2.259 E.1329
M73 P68 R8
G1 X127.618 Y121.858 E.01885
G1 X127.374 Y121.319 E.0182
G1 X126.996 Y120.863 E.0182
G1 X126.508 Y120.524 E.01825
G1 X125.907 Y120.318 E.01952
G1 X125.316 Y120.288 E.01818
G1 X124.806 Y120.393 E.01603
G1 X124.367 Y120.593 E.01481
G1 X123.903 Y120.963 E.01826
G1 X123.534 Y121.48 E.01951
G1 X123.347 Y121.989 E.01666
G1 X123.321 Y122.187 E.00613
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.427 E-.092
G1 X123.289 Y124.185 E-.668
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z15.6 F30000
G1 Z15.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1260
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.10691
G3 X122.651 Y121.742 I6.723 J-.686 E.06772
G3 X122.978 Y120.978 I2.742 J.72 E.02766
G1 X120.948 Y118.948 E.09522
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
G1 X127.172 Y120.578 Z15.6 F30000
G1 X127.843 Y120.725 Z15.6
G1 Z15.2
G1 E.8 F1800
G1 F1260
G2 X126.564 Y119.76 I-2.339 J1.772 E.05384
G1 X127.376 Y118.948 E.03811
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.448 Y125.552 E.28635
G1 X128.448 Y126.052 E.01658
G1 X129.577 Y126.052 E.03743
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.448 Y126.052 E-.42881
G1 X128.448 Y125.552 E-.18995
G1 X128.711 Y125.289 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z15.6 I.615 J-1.05 P1  F30000
G1 X122.968 Y121.93 Z15.6
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1261
G1 X122.897 Y122.428 E.0167
G1 X122.898 Y126.398 E.13169
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.41 I-205.454 J-1.819 E.13228
G1 X127.977 Y121.7 E.02389
G1 X127.679 Y121.072 E.02309
G1 X127.224 Y120.545 E.02309
G1 X126.641 Y120.155 E.02327
G1 X125.931 Y119.927 E.02473
G1 X125.238 Y119.904 E.02301
G1 X124.606 Y120.048 E.02149
G1 X124.126 Y120.283 E.01773
G1 X123.586 Y120.732 E.02329
G1 X123.165 Y121.346 E.02471
G1 X122.979 Y121.855 E.01797
G1 X122.976 Y121.87 E.00052
G1 X123.311 Y122.257 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1261
G1 X123.289 Y122.428 E.00529
G1 X123.29 Y126.79 E.13403
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-622.305 J-2.258 E.1329
G1 X127.618 Y121.858 E.01887
G1 X127.374 Y121.319 E.01818
G1 X126.996 Y120.864 E.01818
G1 X126.509 Y120.525 E.01823
G1 X125.907 Y120.318 E.01958
G1 X125.316 Y120.288 E.01816
G1 X124.808 Y120.392 E.01594
G1 X124.367 Y120.593 E.01489
G1 X123.903 Y120.963 E.01824
G1 X123.533 Y121.481 E.01957
G1 X123.347 Y121.99 E.01664
G1 X123.319 Y122.198 E.00645
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.428 E-.08828
G1 X123.289 Y124.196 E-.67172
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z15.8 F30000
G1 Z15.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1261
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.978 Y120.978 E.09523
G2 X122.551 Y122.42 I2.955 J1.66 E.05031
G1 X122.551 Y123.773 E.04488
G1 X120.272 Y126.052 E.1069
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z15.8 F30000
G1 X129.577 Y126.052 Z15.8
G1 Z15.4
G1 E.8 F1800
G1 F1261
G1 X128.448 Y126.052 E.03743
G1 X128.448 Y125.552 E.01658
G1 X134.552 Y119.448 E.28635
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.563 Y119.761 E.03812
G3 X127.843 Y120.725 I-1.057 J2.734 E.05384
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.433 Y120.269 E-.23314
G1 X126.976 Y119.942 E-.21322
G1 X126.563 Y119.761 E-.17149
G1 X126.828 Y119.496 E-.14215
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z15.8 I-.68 J-1.009 P1  F30000
G1 X122.928 Y122.124 Z15.8
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1262
G1 X122.897 Y122.429 E.01018
G1 X122.898 Y126.398 E.13165
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.41 I-204.99 J-1.819 E.13229
G1 X127.977 Y121.7 E.02391
G1 X127.679 Y121.072 E.02306
G1 X127.225 Y120.545 E.02306
G1 X126.667 Y120.166 E.02237
G1 X126.167 Y119.978 E.01774
G1 X125.477 Y119.891 E.02306
G1 X124.786 Y119.991 E.02315
G1 X124.126 Y120.283 E.02394
G1 X123.7 Y120.615 E.01794
G1 X123.323 Y121.066 E.01949
G1 X123.079 Y121.542 E.01776
G1 X122.935 Y122.064 E.01794
G1 X122.935 Y122.064 E.00002
M73 P69 R8
G1 X123.303 Y122.269 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1262
G1 X123.289 Y122.429 E.00496
G1 X123.29 Y126.79 E.13399
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-620.666 J-2.257 E.1329
G1 X127.618 Y121.857 E.01889
G1 X127.374 Y121.319 E.01816
G1 X126.997 Y120.864 E.01816
G1 X126.557 Y120.55 E.01662
G1 X126.106 Y120.365 E.01497
G1 X125.521 Y120.28 E.01815
G1 X124.934 Y120.354 E.01818
G1 X124.367 Y120.593 E.0189
G1 X123.94 Y120.924 E.01662
G1 X123.686 Y121.227 E.01214
G1 X123.457 Y121.647 E.01469
G1 X123.313 Y122.168 E.01662
G1 X123.309 Y122.209 E.00126
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.429 E-.0841
G1 X123.289 Y124.208 E-.6759
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z16 F30000
G1 Z15.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1262
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.553 Y123.771 E.10698
G1 X122.553 Y122.49 E.0425
G1 X122.386 Y122.45 E.0057
G3 X122.577 Y121.544 I9.797 J1.591 E.03073
G2 X122.978 Y120.978 I-.422 J-.724 E.02372
G1 X120.948 Y118.948 E.09522
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
G1 X127.171 Y120.581 Z16 F30000
G1 X127.846 Y120.728 Z16
G1 Z15.6
G1 E.8 F1800
G1 F1262
G2 X126.572 Y119.753 I-2.453 J1.884 E.05386
G1 X127.376 Y118.948 E.03774
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.449 Y125.551 E.2863
G1 X128.449 Y126.052 E.01661
G1 X129.576 Y126.052 E.0374
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.449 Y126.052 E-.42844
G1 X128.449 Y125.551 E-.19032
G1 X128.712 Y125.288 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z16 I.546 J-1.088 P1  F30000
G1 X122.906 Y122.373 Z16
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1261
G1 X122.897 Y122.43 E.00192
G1 X122.898 Y126.398 E.13161
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.41 I-204.529 J-1.818 E.13229
G1 X127.977 Y121.699 E.02393
G1 X127.679 Y121.072 E.02303
G1 X127.226 Y120.546 E.02303
G1 X126.669 Y120.166 E.02235
G1 X126.166 Y119.978 E.01781
G1 X125.477 Y119.891 E.02303
G1 X124.787 Y119.991 E.02313
G1 X124.127 Y120.283 E.02396
G1 X123.604 Y120.709 E.02238
G1 X123.28 Y121.137 E.01779
G1 X123 Y121.776 E.02314
G1 X122.915 Y122.314 E.01807
G1 X123.313 Y122.284 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1261
G1 X123.289 Y122.43 E.00455
G1 X123.29 Y126.79 E.13396
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-619.374 J-2.256 E.1329
G1 X127.618 Y121.856 E.01891
G1 X127.374 Y121.319 E.01814
G1 X126.997 Y120.865 E.01814
G1 X126.558 Y120.55 E.0166
G1 X126.106 Y120.365 E.01502
G1 X125.522 Y120.28 E.01813
G1 X124.935 Y120.354 E.01816
G1 X124.367 Y120.592 E.01893
G1 X123.941 Y120.924 E.0166
G1 X123.634 Y121.305 E.01503
G1 X123.387 Y121.842 E.01816
G1 X123.323 Y122.225 E.01193
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.43 E-.07912
G1 X123.289 Y124.222 E-.68088
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z16.2 F30000
G1 Z15.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1261
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.975 Y120.975 E.09508
G2 X122.551 Y122.419 I4.15 J2.004 E.05017
G1 X122.551 Y123.773 E.04491
G1 X120.272 Y126.052 E.1069
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z16.2 F30000
G1 X129.576 Y126.052 Z16.2
G1 Z15.8
G1 E.8 F1800
G1 F1261
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.571 Y119.753 E.03774
G3 X127.846 Y120.728 I-1.177 J2.858 E.05386
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.435 Y120.27 E-.23403
G1 X126.981 Y119.945 E-.21202
G1 X126.571 Y119.753 E-.17193
G1 X126.836 Y119.488 E-.14201
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z16.2 I-.72 J-.981 P1  F30000
G1 X122.906 Y122.374 Z16.2
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.897 Y122.431 E.00192
G1 X122.898 Y126.398 E.13158
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.41 I-204.035 J-1.818 E.13229
G1 X127.977 Y121.698 E.02396
G1 X127.679 Y121.072 E.02301
G1 X127.226 Y120.546 E.02301
G1 X126.67 Y120.167 E.02233
G1 X126.166 Y119.977 E.01787
G1 X125.478 Y119.891 E.023
G1 X124.788 Y119.991 E.02311
G1 X124.127 Y120.283 E.02399
G1 X123.604 Y120.709 E.02237
M73 P70 R8
G1 X123.28 Y121.138 E.01785
G1 X123 Y121.776 E.02312
G1 X122.915 Y122.315 E.01808
G1 X123.311 Y122.295 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.289 Y122.431 E.00425
G1 X123.29 Y126.79 E.13393
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-617.753 J-2.255 E.1329
G1 X127.618 Y121.856 E.01893
G1 X127.375 Y121.319 E.01811
G1 X126.998 Y120.865 E.01812
G1 X126.559 Y120.551 E.01658
G1 X126.105 Y120.365 E.01508
G1 X125.522 Y120.28 E.01811
G1 X124.936 Y120.354 E.01815
G1 X124.367 Y120.592 E.01895
G1 X123.941 Y120.923 E.01658
G1 X123.634 Y121.306 E.01509
G1 X123.386 Y121.843 E.01814
G1 X123.321 Y122.236 E.01225
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.431 E-.07542
G1 X123.289 Y124.233 E-.68458
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z16.4 F30000
G1 Z16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1260
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.1069
G3 X122.731 Y121.485 I6.308 J-.654 E.07655
G3 X122.975 Y120.975 I2.304 J.787 E.0188
G1 X120.948 Y118.948 E.09508
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
G1 X127.171 Y120.581 Z16.4 F30000
G1 X127.846 Y120.728 Z16.4
G1 Z16
G1 E.8 F1800
G1 F1260
G2 X126.571 Y119.753 I-2.45 J1.881 E.05386
G1 X127.376 Y118.948 E.03774
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.449 Y125.551 E.2863
G1 X128.449 Y126.052 E.01661
G1 X129.576 Y126.052 E.0374
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.449 Y126.052 E-.42844
G1 X128.449 Y125.551 E-.19032
G1 X128.712 Y125.288 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z16.4 I.546 J-1.088 P1  F30000
G1 X122.905 Y122.375 Z16.4
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1261
G1 X122.897 Y122.433 E.00192
G1 X122.898 Y126.398 E.13154
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.41 I-203.577 J-1.818 E.1323
G1 X127.976 Y121.697 E.02398
G1 X127.679 Y121.072 E.02298
G1 X127.227 Y120.547 E.02298
G1 X126.671 Y120.168 E.02231
G1 X126.165 Y119.977 E.01794
G1 X125.478 Y119.891 E.02297
G1 X124.789 Y119.99 E.02309
G1 X124.127 Y120.283 E.02401
G1 X123.605 Y120.708 E.02235
G1 X123.279 Y121.139 E.01791
G1 X123 Y121.777 E.0231
G1 X122.915 Y122.316 E.0181
G1 X123.31 Y122.305 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1261
G1 X123.289 Y122.433 E.00396
G1 X123.29 Y126.79 E.13389
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-616.143 J-2.254 E.1329
G1 X127.617 Y121.855 E.01895
G1 X127.374 Y121.319 E.01809
G1 X126.998 Y120.866 E.01809
G1 X126.56 Y120.552 E.01656
G1 X126.105 Y120.365 E.01514
G1 X125.522 Y120.28 E.01809
G1 X124.937 Y120.354 E.01812
G1 X124.367 Y120.592 E.01897
G1 X123.942 Y120.923 E.01656
G1 X123.633 Y121.307 E.01515
G1 X123.386 Y121.843 E.01812
G1 X123.319 Y122.246 E.01256
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.433 E-.07176
G1 X123.289 Y124.244 E-.68824
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z16.6 F30000
G1 Z16.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1261
M73 P70 R7
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.975 Y120.975 E.09509
G2 X122.55 Y122.422 I4.127 J1.997 E.05024
G1 X122.551 Y123.773 E.04483
G1 X120.272 Y126.052 E.1069
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z16.6 F30000
G1 X129.576 Y126.052 Z16.6
G1 Z16.2
G1 E.8 F1800
G1 F1261
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.571 Y119.753 E.03775
G3 X127.846 Y120.728 I-1.174 J2.854 E.05386
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X127.436 Y120.271 E-.23324
G1 X126.984 Y119.947 E-.21152
G1 X126.571 Y119.753 E-.17322
G1 X126.836 Y119.488 E-.14201
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z16.6 I-.721 J-.981 P1  F30000
G1 X122.905 Y122.377 Z16.6
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.896 Y122.434 E.00191
G1 X122.898 Y126.398 E.1315
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.41 I-203.095 J-1.818 E.1323
G1 X127.976 Y121.697 E.024
G1 X127.679 Y121.072 E.02295
G1 X127.227 Y120.547 E.02295
G1 X126.672 Y120.168 E.0223
M73 P71 R7
G1 X126.165 Y119.977 E.018
G1 X125.478 Y119.891 E.02295
G1 X124.79 Y119.99 E.02307
G1 X124.127 Y120.283 E.02403
G1 X123.605 Y120.708 E.02233
G1 X123.278 Y121.14 E.01798
G1 X123 Y121.778 E.02308
G1 X122.915 Y122.317 E.01812
G1 X123.308 Y122.316 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.289 Y122.434 E.00367
G1 X123.29 Y126.79 E.13386
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-614.558 J-2.253 E.13291
G1 X127.617 Y121.854 E.01897
G1 X127.374 Y121.319 E.01807
G1 X126.999 Y120.866 E.01807
G1 X126.562 Y120.552 E.01654
G1 X126.104 Y120.364 E.0152
G1 X125.522 Y120.28 E.01807
G1 X124.937 Y120.353 E.0181
G1 X124.367 Y120.592 E.01899
G1 X123.942 Y120.922 E.01654
G1 X123.632 Y121.308 E.01521
G1 X123.386 Y121.843 E.0181
G1 X123.318 Y122.257 E.01287
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.434 E-.06813
G1 X123.289 Y124.254 E-.69187
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z16.8 F30000
G1 Z16.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1260
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.1069
G3 X122.731 Y121.487 I6.326 J-.653 E.0765
G3 X122.975 Y120.975 I2.306 J.787 E.01885
G1 X120.948 Y118.948 E.09509
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
G1 X127.171 Y120.58 Z16.8 F30000
G1 X127.846 Y120.728 Z16.8
G1 Z16.4
G1 E.8 F1800
G1 F1260
G2 X126.571 Y119.753 I-2.447 J1.877 E.05386
G1 X127.376 Y118.948 E.03775
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.449 Y125.551 E.2863
G1 X128.449 Y126.052 E.01661
G1 X129.576 Y126.052 E.0374
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.449 Y126.052 E-.42844
G1 X128.449 Y125.551 E-.19032
G1 X128.712 Y125.288 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z16.8 I.545 J-1.088 P1  F30000
G1 X122.905 Y122.378 Z16.8
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1261
G1 X122.896 Y122.435 E.00191
G1 X122.898 Y126.398 E.13147
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.41 I-202.641 J-1.817 E.1323
G1 X127.976 Y121.696 E.02402
G1 X127.679 Y121.072 E.02293
G1 X127.228 Y120.548 E.02292
G1 X126.674 Y120.169 E.02228
G1 X126.164 Y119.977 E.01807
G1 X125.478 Y119.891 E.02292
G1 X124.791 Y119.99 E.02304
G1 X124.127 Y120.282 E.02406
G1 X123.606 Y120.707 E.02232
G1 X123.278 Y121.141 E.01804
G1 X122.999 Y121.778 E.02306
G1 X122.915 Y122.319 E.01814
G1 X123.306 Y122.326 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1261
G1 X123.289 Y122.435 E.00338
G1 X123.29 Y126.79 E.13383
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-613.286 J-2.253 E.13291
G1 X127.617 Y121.854 E.01899
G1 X127.374 Y121.319 E.01805
G1 X126.999 Y120.867 E.01805
G1 X126.563 Y120.553 E.01652
G1 X126.103 Y120.364 E.01526
G1 X125.522 Y120.28 E.01805
G1 X124.938 Y120.353 E.01809
G1 X124.368 Y120.592 E.01901
G1 X123.943 Y120.922 E.01652
G1 X123.632 Y121.309 E.01527
G1 X123.386 Y121.844 E.01808
G1 X123.316 Y122.267 E.01318
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.435 E-.06457
G1 X123.289 Y124.265 E-.69543
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z17 F30000
G1 Z16.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1261
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.975 Y120.975 E.09509
G2 X122.55 Y122.424 I4.105 J1.99 E.05031
G1 X122.551 Y123.773 E.04476
G1 X120.272 Y126.052 E.1069
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z17 F30000
G1 X129.576 Y126.052 Z17
G1 Z16.6
G1 E.8 F1800
G1 F1261
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.571 Y119.753 E.03775
G3 X127.846 Y120.728 I-1.171 J2.851 E.05386
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X127.438 Y120.273 E-.23243
G1 X126.987 Y119.949 E-.21103
G1 X126.571 Y119.753 E-.17452
G1 X126.835 Y119.489 E-.14201
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z17 I-.721 J-.98 P1  F30000
G1 X122.905 Y122.379 Z17
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.896 Y122.436 E.0019
G1 X122.898 Y126.398 E.13143
M73 P72 R7
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.409 I-202.19 J-1.817 E.13231
G1 X127.976 Y121.695 E.02405
G1 X127.679 Y121.072 E.0229
G1 X127.229 Y120.549 E.0229
G1 X126.675 Y120.17 E.02226
G1 X126.163 Y119.977 E.01813
G1 X125.479 Y119.891 E.02289
G1 X124.792 Y119.99 E.02302
G1 X124.127 Y120.282 E.02408
G1 X123.606 Y120.707 E.0223
G1 X123.277 Y121.142 E.01811
G1 X122.999 Y121.779 E.02304
G1 X122.915 Y122.32 E.01816
G1 X123.305 Y122.336 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.289 Y122.436 E.00309
G1 X123.29 Y126.79 E.13379
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-611.697 J-2.252 E.13291
G1 X127.617 Y121.853 E.01901
G1 X127.374 Y121.319 E.01803
G1 X127 Y120.867 E.01803
G1 X126.564 Y120.554 E.0165
G1 X126.103 Y120.364 E.01532
G1 X125.522 Y120.28 E.01802
G1 X124.939 Y120.353 E.01807
G1 X124.368 Y120.592 E.01903
G1 X123.943 Y120.921 E.0165
G1 X123.631 Y121.31 E.01532
G1 X123.386 Y121.844 E.01806
G1 X123.315 Y122.277 E.01348
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.436 E-.06107
G1 X123.289 Y124.275 E-.69893
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z17.2 F30000
G1 Z16.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1260
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.1069
G3 X122.73 Y121.488 I6.344 J-.652 E.07645
G3 X122.975 Y120.975 I2.308 J.787 E.0189
G1 X120.948 Y118.948 E.09509
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
G1 X127.171 Y120.58 Z17.2 F30000
G1 X127.846 Y120.728 Z17.2
G1 Z16.8
G1 E.8 F1800
G1 F1260
G2 X126.571 Y119.753 I-2.444 J1.874 E.05386
G1 X127.376 Y118.948 E.03776
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.449 Y125.551 E.2863
G1 X128.449 Y126.052 E.01661
G1 X129.576 Y126.052 E.0374
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.449 Y126.052 E-.42844
G1 X128.449 Y125.551 E-.19032
G1 X128.712 Y125.288 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z17.2 I.545 J-1.088 P1  F30000
G1 X122.905 Y122.38 Z17.2
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1261
G1 X122.896 Y122.437 E.0019
G1 X122.898 Y126.398 E.13139
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.409 I-201.697 J-1.817 E.13231
G1 X127.975 Y121.694 E.02407
G1 X127.679 Y121.072 E.02287
G1 X127.229 Y120.549 E.02287
G1 X126.676 Y120.17 E.02225
G1 X126.163 Y119.977 E.0182
G1 X125.479 Y119.891 E.02286
G1 X124.793 Y119.989 E.023
G1 X124.128 Y120.282 E.0241
G1 X123.607 Y120.706 E.02229
G1 X123.276 Y121.143 E.01817
G1 X122.999 Y121.78 E.02302
G1 X122.915 Y122.321 E.01818
G1 X123.303 Y122.346 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1261
G1 X123.288 Y122.437 E.00282
G1 X123.29 Y126.79 E.13376
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-610.352 J-2.251 E.13291
G1 X127.617 Y121.852 E.01903
G1 X127.374 Y121.319 E.01801
G1 X127 Y120.867 E.01801
G1 X126.565 Y120.554 E.01648
G1 X126.102 Y120.364 E.01537
G1 X125.523 Y120.28 E.018
G1 X124.94 Y120.353 E.01805
G1 X124.368 Y120.592 E.01905
G1 X123.944 Y120.921 E.01648
G1 X123.631 Y121.311 E.01538
G1 X123.386 Y121.845 E.01804
G1 X123.313 Y122.287 E.01378
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.437 E-.05764
G1 X123.289 Y124.285 E-.70236
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z17.4 F30000
G1 Z17
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1261
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.975 Y120.975 E.09509
G2 X122.55 Y122.426 I4.083 J1.983 E.05039
G1 X122.551 Y123.773 E.04468
G1 X120.272 Y126.052 E.1069
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z17.4 F30000
G1 X129.576 Y126.052 Z17.4
G1 Z17
G1 E.8 F1800
G1 F1261
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.571 Y119.753 E.03776
G3 X127.846 Y120.728 I-1.167 J2.847 E.05386
; CHANGE_LAYER
; Z_HEIGHT: 17.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.439 Y120.274 E-.23164
G1 X126.989 Y119.95 E-.21055
M73 P73 R7
G1 X126.571 Y119.753 E-.1758
G1 X126.835 Y119.489 E-.14201
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z17.4 I-.721 J-.98 P1  F30000
G1 X122.905 Y122.382 Z17.4
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1263
G1 X122.896 Y122.438 E.0019
G1 X122.898 Y126.398 E.13136
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X119.521 Y118.602 E.01391
G1 X119.734 Y118.562 E.00719
G1 X119.782 Y118.492 E.00279
G1 X134.218 Y118.492 E.47889
G1 X134.266 Y118.562 E.00279
G1 X134.479 Y118.602 E.00719
G1 X134.898 Y118.602 E.01391
G1 X134.898 Y119.021 E.01391
G1 X134.898 Y126.398 E.24469
G1 X128.102 Y126.398 E.22542
G2 X128.096 Y122.392 I-145.625 J-1.784 E.1329
G1 X127.975 Y121.694 E.0235
G1 X127.679 Y121.072 E.02284
G1 X127.23 Y120.55 E.02284
G1 X126.677 Y120.171 E.02223
G1 X126.162 Y119.976 E.01826
G1 X125.479 Y119.891 E.02284
G1 X124.793 Y119.989 E.02298
G1 X124.128 Y120.282 E.02413
G1 X123.607 Y120.706 E.02227
G1 X123.276 Y121.144 E.01824
G1 X122.999 Y121.78 E.023
G1 X122.914 Y122.322 E.0182
G1 X123.302 Y122.356 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1263
G1 X123.288 Y122.438 E.00255
G1 X123.29 Y126.79 E.13372
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X119.591 Y118.197 E.02706
G1 X119.61 Y118.168 E.00107
G1 X119.657 Y118.1 E.00253
G1 X134.343 Y118.1 E.45129
G1 X134.39 Y118.168 E.00253
G2 X134.479 Y118.21 I.065 J-.023 E.00335
G1 X135.29 Y118.21 E.02493
G1 X135.29 Y119.021 E.02493
G1 X135.29 Y126.79 E.23871
G1 X127.71 Y126.79 E.23291
G2 X127.708 Y122.447 I-271.872 J-2.054 E.13345
G1 X127.616 Y121.852 E.01851
G1 X127.374 Y121.319 E.01799
G1 X127.001 Y120.868 E.01799
G1 X126.566 Y120.555 E.01646
G1 X126.102 Y120.364 E.01543
G1 X125.523 Y120.28 E.01798
G1 X124.941 Y120.353 E.01803
G1 X124.368 Y120.592 E.01907
G1 X123.944 Y120.92 E.01646
G1 X123.63 Y121.312 E.01544
G1 X123.386 Y121.845 E.01802
G1 X123.312 Y122.297 E.01406
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.438 E-.05429
G1 X123.289 Y124.295 E-.70571
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z17.6 F30000
G1 Z17.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1263
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.1069
G3 X122.73 Y121.489 I6.362 J-.651 E.0764
G3 X122.975 Y120.975 I2.309 J.786 E.01895
G1 X120.838 Y118.838 E.10025
G1 X119.922 Y118.838 E.03039
G2 X119.448 Y119.2 I.646 J1.338 E.01992
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.711 Y118.937 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.165 Y120.578 Z17.6 F30000
G1 X127.846 Y120.728 Z17.6
G1 Z17.2
G1 E.8 F1800
G1 F1263
G2 X126.571 Y119.753 I-2.441 J1.871 E.05386
G1 X127.486 Y118.838 E.04292
G1 X128.514 Y118.838 E.0341
G1 X134.552 Y124.876 E.28325
G1 X134.552 Y119.448 E.18005
G1 X128.449 Y125.551 E.2863
G1 X128.449 Y126.052 E.01661
G1 X129.576 Y126.052 E.0374
; CHANGE_LAYER
; Z_HEIGHT: 17.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X128.449 Y126.052 E-.42844
G1 X128.449 Y125.551 E-.19032
G1 X128.712 Y125.288 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z17.6 I.545 J-1.088 P1  F30000
G1 X122.905 Y122.383 Z17.6
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1271
G1 X122.896 Y122.439 E.00189
G1 X122.898 Y126.398 E.13132
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X119.521 Y118.602 E.01391
G1 X119.825 Y118.516 E.01047
G1 X119.951 Y118.292 E.00852
G1 X134.049 Y118.292 E.46768
G1 X134.175 Y118.516 E.00852
G1 X134.479 Y118.602 E.01047
G1 X134.898 Y118.602 E.01391
G1 X134.898 Y119.021 E.01391
G1 X134.898 Y126.398 E.24469
G1 X128.102 Y126.398 E.22542
G1 X128.104 Y122.999 E.11274
G1 X128.07 Y122.207 E.02629
G1 X127.975 Y121.693 E.01736
G1 X127.679 Y121.072 E.02282
G1 X127.231 Y120.55 E.02282
G1 X126.678 Y120.172 E.02221
G1 X126.162 Y119.976 E.01833
G1 X125.479 Y119.891 E.02281
G1 X124.794 Y119.989 E.02296
G1 X124.128 Y120.282 E.02415
G1 X123.607 Y120.705 E.02225
G1 X123.275 Y121.146 E.0183
G1 X122.999 Y121.781 E.02298
G1 X122.914 Y122.323 E.01822
G1 X123.3 Y122.366 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1271
G1 X123.288 Y122.439 E.00228
G1 X123.29 Y126.79 E.13369
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X119.62 Y118.182 E.02798
G1 X119.628 Y118.168 E.0005
G1 X119.668 Y118.097 E.00252
G1 X119.69 Y118.058 E.00136
G2 X119.71 Y117.974 I-.065 J-.06 E.00278
G1 X119.71 Y117.9 E.00227
G1 X134.29 Y117.9 E.448
G1 X134.29 Y117.974 E.00227
G2 X134.31 Y118.058 I.085 J.024 E.00278
G1 X134.332 Y118.097 E.00136
G1 X134.372 Y118.168 E.00252
G1 X134.479 Y118.21 E.00352
G1 X135.29 Y118.21 E.02493
G1 X135.29 Y119.021 E.02493
G1 X135.29 Y126.79 E.23871
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-607.216 J-2.25 E.13291
G1 X127.616 Y121.851 E.01908
G1 X127.374 Y121.319 E.01796
G1 X127.001 Y120.868 E.01797
G1 X126.568 Y120.556 E.01644
G1 X126.101 Y120.364 E.01549
G1 X125.523 Y120.28 E.01796
G1 X124.941 Y120.352 E.01801
G1 X124.368 Y120.592 E.0191
G1 X123.945 Y120.92 E.01644
G1 X123.629 Y121.313 E.0155
G1 X123.385 Y121.846 E.018
G1 X123.31 Y122.307 E.01435
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.439 E-.05105
G1 X123.289 Y124.305 E-.70895
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z17.8 F30000
G1 Z17.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1271
G1 X119.448 Y119.2 E.05401
G3 X120.027 Y118.811 I.637 J.323 E.02418
G1 X120.124 Y118.638 E.00656
G1 X120.638 Y118.638 E.01706
G1 X122.975 Y120.975 E.10963
G2 X122.55 Y122.428 I4.062 J1.976 E.05046
G1 X122.551 Y123.773 E.04461
G1 X120.272 Y126.052 E.1069
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z17.8 F30000
G1 X129.576 Y126.052 Z17.8
G1 Z17.4
G1 E.8 F1800
G1 F1271
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X128.314 Y118.638 E.29263
G1 X127.686 Y118.638 E.02084
G1 X126.571 Y119.753 E.05231
G3 X127.846 Y120.728 I-1.164 J2.844 E.05386
; CHANGE_LAYER
; Z_HEIGHT: 17.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
M73 P74 R7
G1 X127.441 Y120.275 E-.23086
G1 X126.992 Y119.952 E-.21004
G1 X126.571 Y119.753 E-.17708
G1 X126.835 Y119.489 E-.14201
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z17.8 I-.722 J-.98 P1  F30000
G1 X122.905 Y122.384 Z17.8
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1377
G1 X122.896 Y122.44 E.00189
G1 X122.898 Y126.398 E.13128
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X119.521 Y118.602 E.01391
G1 X119.872 Y118.485 E.01225
G1 X120.067 Y118.092 E.01454
G1 X133.933 Y118.092 E.45996
G1 X134.128 Y118.485 E.01454
G1 X134.479 Y118.602 E.01225
G1 X134.898 Y118.602 E.01391
G1 X134.898 Y119.021 E.01391
G1 X134.898 Y126.398 E.24469
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.409 I-200.331 J-1.816 E.13232
G1 X127.975 Y121.692 E.02414
G1 X127.679 Y121.072 E.02279
G1 X127.231 Y120.551 E.02279
G1 X126.68 Y120.172 E.0222
G1 X126.161 Y119.976 E.01839
G1 X125.48 Y119.891 E.02278
G1 X124.795 Y119.989 E.02294
G1 X124.128 Y120.282 E.02417
G1 X123.608 Y120.705 E.02224
G1 X123.249 Y121.2 E.02027
G1 X122.999 Y121.781 E.02102
G1 X122.914 Y122.325 E.01824
G1 X123.299 Y122.375 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1377
G1 X123.288 Y122.44 E.00203
G1 X123.29 Y126.79 E.13366
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X119.521 Y118.21 E.02493
G1 X119.637 Y118.168 E.00378
G1 X119.668 Y118.106 E.00213
G1 X119.71 Y118.021 E.0029
G1 X119.71 Y117.858 E.00502
G1 X119.71 Y117.774 E.00258
G1 X119.71 Y117.7 E.00227
G1 X134.29 Y117.7 E.448
G1 X134.29 Y117.774 E.00227
G1 X134.29 Y117.858 E.00258
G1 X134.29 Y118.021 E.00502
G1 X134.332 Y118.106 E.0029
G1 X134.363 Y118.168 E.00213
G1 X134.479 Y118.21 E.00378
G1 X135.29 Y118.21 E.02493
G1 X135.29 Y119.021 E.02493
G1 X135.29 Y126.79 E.23871
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.464 I-605.976 J-2.249 E.13291
G1 X127.616 Y121.85 E.0191
G1 X127.374 Y121.319 E.01794
G1 X127.002 Y120.869 E.01794
G1 X126.569 Y120.556 E.01642
G1 X126.101 Y120.364 E.01555
G1 X125.523 Y120.28 E.01794
G1 X124.942 Y120.352 E.01799
G1 X124.368 Y120.592 E.01912
G1 X123.914 Y120.95 E.01778
G1 X123.604 Y121.367 E.01596
G1 X123.385 Y121.846 E.01619
G1 X123.309 Y122.316 E.01462
M204 S10000
; WIPE_START
M73 P74 R6
G1 F24000
G1 X123.288 Y122.44 E-.04791
G1 X123.289 Y124.314 E-.71209
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z18 F30000
G1 Z17.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1377
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.1069
G3 X122.729 Y121.491 I6.38 J-.65 E.07635
G3 X122.975 Y120.975 I2.309 J.785 E.019
G1 X120.957 Y118.957 E.09468
G1 X119.962 Y118.957 E.03299
G1 X119.886 Y118.834 E.00481
G1 X119.778 Y118.87 E.00376
G1 X119.448 Y119.2 E.01549
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.711 Y118.937 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.165 Y120.578 Z18 F30000
G1 X127.846 Y120.728 Z18
G1 Z17.6
G1 E.8 F1800
G1 F1377
G2 X126.571 Y119.753 I-2.437 J1.867 E.05386
G1 X127.367 Y118.957 E.03736
G1 X128.633 Y118.957 E.04199
G1 X134.552 Y124.876 E.27767
G1 X134.552 Y119.448 E.18005
G1 X128.449 Y125.551 E.2863
G1 X128.449 Y126.052 E.01661
G1 X129.576 Y126.052 E.0374
G1 X133.689 Y118.524 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.500646
G1 F1377
G1 X120.371 Y118.524 E.49675
; CHANGE_LAYER
; Z_HEIGHT: 17.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X122.371 Y118.524 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z18 I-1.205 J.167 P1  F30000
G1 X122.905 Y122.385 Z18
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1373
G1 X122.896 Y122.441 E.00189
G1 X122.898 Y126.398 E.13125
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X119.521 Y118.602 E.01391
G1 X119.893 Y118.467 E.01313
G1 X120.102 Y118.021 E.01633
G1 X120.102 Y117.892 E.00429
G1 X133.898 Y117.892 E.45763
G1 X133.898 Y118.021 E.00429
G1 X134.098 Y118.46 E.01599
G1 X134.479 Y118.602 E.01347
G1 X134.898 Y118.602 E.01391
G1 X134.898 Y119.021 E.01391
G1 X134.898 Y126.398 E.24469
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.409 I-199.892 J-1.816 E.13232
G1 X127.975 Y121.691 E.02416
G1 X127.679 Y121.072 E.02276
G1 X127.232 Y120.551 E.02276
G1 X126.681 Y120.173 E.02218
G1 X126.16 Y119.976 E.01846
G1 X125.48 Y119.891 E.02275
G1 X124.796 Y119.988 E.02291
G1 X124.128 Y120.282 E.0242
G1 X123.608 Y120.705 E.02222
G1 X123.274 Y121.148 E.01843
G1 X122.999 Y121.782 E.02294
G1 X122.914 Y122.326 E.01825
G1 X123.298 Y122.384 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1373
G1 X123.288 Y122.441 E.00179
G1 X123.29 Y126.79 E.13362
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X119.521 Y118.21 E.02493
G1 X119.637 Y118.168 E.00379
G1 X119.668 Y118.111 E.00198
G1 X119.71 Y118.021 E.00304
G1 X119.71 Y117.658 E.01117
G1 X119.71 Y117.574 E.00258
G1 X119.71 Y117.5 E.00227
G1 X134.29 Y117.5 E.448
G1 X134.29 Y117.574 E.00227
G1 X134.29 Y117.658 E.00258
G1 X134.29 Y118.021 E.01117
G1 X134.332 Y118.114 E.00311
G1 X134.366 Y118.168 E.00197
G1 X134.479 Y118.21 E.00369
G1 X135.29 Y118.21 E.02493
G1 X135.29 Y119.021 E.02493
G1 X135.29 Y126.79 E.23871
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.464 I-604.427 J-2.248 E.13291
G1 X127.616 Y121.85 E.01912
G1 X127.374 Y121.319 E.01792
G1 X127.002 Y120.869 E.01792
G1 X126.57 Y120.557 E.0164
G1 X126.1 Y120.363 E.01561
G1 X125.523 Y120.28 E.01791
G1 X124.943 Y120.352 E.01796
G1 X124.368 Y120.592 E.01914
G1 X123.946 Y120.919 E.0164
G1 X123.628 Y121.315 E.01561
G1 X123.385 Y121.847 E.01796
G1 X123.307 Y122.325 E.01488
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.441 E-.04488
G1 X123.289 Y124.323 E-.71512
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z18.2 F30000
G1 Z17.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1373
G1 X119.448 Y119.2 E.05401
G3 X120.074 Y118.757 I.786 J.447 E.02627
G1 X120.757 Y118.757 E.02265
G1 X122.974 Y120.974 E.10402
G2 X122.55 Y122.431 I2.672 J1.568 E.05083
G1 X122.551 Y123.773 E.04454
G1 X120.272 Y126.052 E.1069
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
G1 X120.418 Y118.324 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50065
G1 F1373
G1 X133.521 Y118.324 E.48874
G1 X129.576 Y126.052 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1373
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X128.433 Y118.757 E.28706
G1 X127.567 Y118.757 E.02872
G1 X126.571 Y119.753 E.04674
G3 X127.846 Y120.728 I-1.161 J2.84 E.05386
; CHANGE_LAYER
; Z_HEIGHT: 18
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.442 Y120.277 E-.23006
G1 X126.995 Y119.954 E-.20956
G1 X126.571 Y119.753 E-.17837
G1 X126.835 Y119.489 E-.14201
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
M73 P75 R6
G3 Z18.2 I-.722 J-.98 P1  F30000
G1 X122.905 Y122.386 Z18.2
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1379
G1 X122.896 Y122.442 E.00188
G1 X122.898 Y126.398 E.13121
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X119.521 Y118.602 E.01391
G1 X119.925 Y118.439 E.01442
G1 X120.102 Y118.021 E.01506
G1 X120.102 Y117.692 E.01093
G1 X133.898 Y117.692 E.45763
G2 X133.977 Y118.314 I1.19 J.165 E.02104
G1 X134.203 Y118.533 E.01043
G1 X134.479 Y118.602 E.00942
G1 X134.898 Y118.602 E.01391
G1 X134.898 Y119.021 E.01391
G1 X134.898 Y126.398 E.24469
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.409 I-199.454 J-1.816 E.13233
G1 X127.974 Y121.691 E.02418
G1 X127.679 Y121.072 E.02274
G1 X127.233 Y120.552 E.02274
G1 X126.682 Y120.174 E.02216
G1 X126.16 Y119.976 E.01852
G1 X125.48 Y119.891 E.02273
G1 X124.797 Y119.988 E.02289
G1 X124.128 Y120.282 E.02422
G1 X123.609 Y120.704 E.0222
G1 X123.273 Y121.149 E.01849
G1 X122.998 Y121.783 E.02291
G1 X122.914 Y122.327 E.01827
G1 X123.296 Y122.393 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1379
G1 X123.288 Y122.442 E.00155
G1 X123.29 Y126.79 E.13359
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X119.521 Y118.21 E.02493
G1 X119.637 Y118.168 E.00379
G1 X119.668 Y118.111 E.00198
G1 X119.71 Y118.021 E.00304
G1 X119.71 Y117.458 E.01731
G1 X119.71 Y117.374 E.00258
G1 X119.71 Y117.3 E.00227
G1 X134.29 Y117.3 E.448
G1 X134.29 Y117.374 E.00227
G1 X134.29 Y117.458 E.00258
G1 X134.29 Y118.021 E.01731
G1 X134.332 Y118.12 E.00329
G2 X134.374 Y118.168 I.045 J.003 E.00218
G1 X134.479 Y118.21 E.00345
G1 X135.29 Y118.21 E.02493
G1 X135.29 Y119.021 E.02493
G1 X135.29 Y126.79 E.23871
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.464 I-602.887 J-2.247 E.13291
G1 X127.616 Y121.849 E.01914
G1 X127.374 Y121.319 E.0179
G1 X127.003 Y120.87 E.0179
G1 X126.571 Y120.558 E.01638
G1 X126.1 Y120.363 E.01567
G1 X125.523 Y120.28 E.01789
G1 X124.944 Y120.352 E.01794
G1 X124.368 Y120.592 E.01916
G1 X123.947 Y120.918 E.01638
G1 X123.628 Y121.316 E.01567
G1 X123.385 Y121.847 E.01794
G1 X123.306 Y122.333 E.01513
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.442 E-.04198
G1 X123.289 Y124.332 E-.71802
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z18.4 F30000
G1 Z18
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1379
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.1069
G3 X122.729 Y121.492 I6.398 J-.649 E.07632
G1 X122.976 Y120.976 E.01898
G1 X120.557 Y118.557 E.11346
G1 X120.254 Y118.557 E.01006
G3 X119.787 Y118.861 I-.498 J-.254 E.01933
G1 X119.448 Y119.2 E.01591
G1 X119.448 Y120.828 E.05401
G1 X120.511 Y118.124 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.500648
G1 F1379
G1 X133.443 Y118.124 E.48236
G1 X127.846 Y120.728 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1379
G2 X126.571 Y119.753 I-2.434 J1.864 E.05386
G1 X127.767 Y118.557 E.05613
G1 X128.233 Y118.557 E.01545
G1 X134.552 Y124.876 E.29644
G1 X134.552 Y119.448 E.18005
G1 X128.449 Y125.551 E.2863
G1 X128.449 Y126.052 E.01661
G1 X129.576 Y126.052 E.0374
; CHANGE_LAYER
; Z_HEIGHT: 18.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.449 Y126.052 E-.42844
G1 X128.449 Y125.551 E-.19032
G1 X128.712 Y125.288 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z18.4 I.544 J-1.089 P1  F30000
G1 X122.905 Y122.388 Z18.4
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1392
G1 X122.896 Y122.444 E.00188
G1 X122.898 Y126.398 E.13117
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y120.217 E.20502
G1 X119.102 Y118.602 E.05358
G1 X119.521 Y118.602 E.01391
G1 X119.939 Y118.425 E.01503
G1 X120.102 Y118.021 E.01445
G1 X120.102 Y117.492 E.01756
G1 X133.898 Y117.492 E.45763
G1 X133.898 Y118.021 E.01756
G1 X133.967 Y118.296 E.00939
G1 X134.185 Y118.522 E.01043
G1 X134.479 Y118.602 E.01009
G1 X134.898 Y118.602 E.01391
G1 X134.898 Y126.398 E.2586
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.409 I-199.018 J-1.815 E.13233
G1 X127.974 Y121.69 E.0242
G1 X127.679 Y121.072 E.02271
G1 X127.233 Y120.553 E.02271
G1 X126.683 Y120.174 E.02215
G1 X126.159 Y119.976 E.01859
G1 X125.48 Y119.891 E.0227
G1 X124.798 Y119.988 E.02287
G1 X124.128 Y120.282 E.02425
G1 X123.609 Y120.704 E.02219
G1 X123.272 Y121.15 E.01856
G1 X122.998 Y121.783 E.02289
G1 X122.914 Y122.328 E.01829
G1 X123.295 Y122.401 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1392
G1 X123.288 Y122.444 E.00133
G1 X123.29 Y126.79 E.13355
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y120.217 E.20196
G1 X118.71 Y118.21 E.06168
G1 X119.521 Y118.21 E.02493
G1 X119.637 Y118.168 E.00379
G1 X119.668 Y118.111 E.00198
G1 X119.71 Y118.021 E.00304
G1 X119.71 Y117.258 E.02346
G1 X119.71 Y117.174 E.00258
G1 X119.71 Y117.1 E.00227
G1 X134.29 Y117.1 E.448
G1 X134.29 Y117.174 E.00227
G1 X134.29 Y117.258 E.00258
G1 X134.29 Y118.021 E.02346
G1 X134.332 Y118.126 E.00346
G2 X134.38 Y118.168 I.045 J-.003 E.00218
G1 X134.479 Y118.21 E.00329
G1 X135.29 Y118.21 E.02493
G1 X135.29 Y126.79 E.26364
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.464 I-601.665 J-2.246 E.13291
G1 X127.615 Y121.848 E.01916
G1 X127.374 Y121.319 E.01788
G1 X127.004 Y120.87 E.01788
G1 X126.572 Y120.558 E.01636
G1 X126.099 Y120.363 E.01572
G1 X125.523 Y120.28 E.01787
G1 X124.945 Y120.352 E.01792
G1 X124.368 Y120.592 E.01918
G1 X123.947 Y120.918 E.01636
G1 X123.627 Y121.317 E.01573
G1 X123.385 Y121.848 E.01792
G1 X123.305 Y122.342 E.01538
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.444 E-.03922
G1 X123.289 Y124.34 E-.72078
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z18.6 F30000
G1 Z18.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1392
G1 X119.448 Y119.2 E.05401
G3 X120.1 Y118.747 I.81 J.47 E.02719
G2 X120.357 Y118.357 I-1.889 J-1.522 E.01553
G1 X122.977 Y120.977 E.12293
G2 X122.55 Y122.433 I2.594 J1.552 E.05086
G1 X122.551 Y123.773 E.04446
G1 X120.272 Y126.052 E.10689
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
G1 X120.518 Y117.924 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.500648
G1 F1392
G1 X133.403 Y117.924 E.48058
G1 X129.576 Y126.052 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1392
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X128.033 Y118.357 E.30582
G1 X127.967 Y118.357 E.00218
G1 X126.571 Y119.753 E.06551
G3 X127.846 Y120.728 I-1.157 J2.837 E.05386
; CHANGE_LAYER
; Z_HEIGHT: 18.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X127.444 Y120.278 E-.22927
G1 X126.998 Y119.955 E-.20906
G1 X126.571 Y119.753 E-.17966
G1 X126.835 Y119.489 E-.14201
; WIPE_END
M73 P76 R6
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z18.6 I-.709 J-.989 P1  F30000
G1 X122.911 Y122.299 Z18.6
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1443
G1 X122.9 Y122.36 E.00204
G1 X122.898 Y126.398 E.13395
G1 X119.102 Y126.398 E.12592
G1 X119.102 Y118.602 E.2586
G1 X119.521 Y118.602 E.01391
G1 X119.893 Y118.467 E.01313
G1 X119.98 Y118.378 E.00411
G1 X120.102 Y118.021 E.01251
G1 X120.102 Y117.292 E.02419
G1 X133.898 Y117.292 E.45763
G1 X133.898 Y118.021 E.02419
G1 X133.959 Y118.281 E.00885
G1 X134.17 Y118.513 E.01039
G1 X134.479 Y118.602 E.01066
G1 X134.898 Y118.602 E.01391
G1 X134.898 Y119.021 E.01391
G1 X134.898 Y126.398 E.24469
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.409 I-198.584 J-1.815 E.13233
G1 X127.974 Y121.689 E.02423
G1 X127.679 Y121.072 E.02268
G1 X127.234 Y120.553 E.02268
G1 X126.684 Y120.175 E.02213
G1 X126.159 Y119.975 E.01865
G1 X125.481 Y119.891 E.02267
G1 X124.799 Y119.988 E.02285
G1 X124.129 Y120.282 E.02427
G1 X123.61 Y120.703 E.02217
G1 X123.272 Y121.151 E.01862
G1 X123 Y121.773 E.0225
G1 X122.921 Y122.24 E.01573
G1 X123.292 Y122.408 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1443
G1 X123.29 Y126.79 E.13465
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X119.521 Y118.21 E.02493
G1 X119.637 Y118.168 E.00379
G1 X119.668 Y118.111 E.00198
G1 X119.71 Y118.021 E.00304
G1 X119.71 Y117.058 E.0296
G1 X119.71 Y116.974 E.00258
G1 X119.71 Y116.9 E.00227
G1 X134.29 Y116.9 E.448
G1 X134.29 Y116.974 E.00227
G1 X134.29 Y117.058 E.00258
G1 X134.29 Y118.021 E.0296
G1 X134.332 Y118.131 E.00362
G2 X134.385 Y118.168 I.045 J-.008 E.00219
G1 X134.479 Y118.21 E.00316
G1 X135.29 Y118.21 E.02493
G1 X135.29 Y119.021 E.02493
G1 X135.29 Y126.79 E.23871
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.464 I-600.138 J-2.245 E.13292
G1 X127.615 Y121.848 E.01918
G1 X127.374 Y121.319 E.01786
G1 X127.004 Y120.871 E.01786
G1 X126.573 Y120.559 E.01634
G1 X126.099 Y120.363 E.01578
G1 X125.524 Y120.28 E.01785
G1 X124.945 Y120.351 E.0179
G1 X124.368 Y120.592 E.01921
G1 X123.948 Y120.917 E.01634
G1 X123.626 Y121.318 E.01579
G1 X123.385 Y121.844 E.01779
G1 X123.295 Y122.348 E.01572
M204 S10000
; WIPE_START
G1 F24000
G1 X123.293 Y124.348 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.846 Y120.728 Z18.8 F30000
G1 Z18.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1443
G2 X126.571 Y119.753 I-2.431 J1.861 E.05386
G1 X128.167 Y118.157 E.0749
G1 X127.833 Y118.157 E.01109
G1 X134.552 Y124.876 E.3152
G1 X134.552 Y119.448 E.18005
G1 X128.449 Y125.551 E.2863
G1 X128.449 Y126.052 E.01661
G1 X129.576 Y126.052 E.0374
; WIPE_START
G1 F24000
G1 X128.449 Y126.052 E-.42844
G1 X128.449 Y125.551 E-.19032
G1 X128.712 Y125.288 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X122.752 Y120.52 Z18.8 F30000
G1 X120.284 Y118.546 Z18.8
G1 Z18.4
G1 E.8 F1800
G1 F1443
G3 X119.787 Y118.861 I-.616 J-.421 E.02007
G1 X119.448 Y119.2 E.01591
G1 X119.448 Y125.124 E.19651
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.554 Y123.77 E.10703
G3 X122.661 Y121.702 I6.342 J-.708 E.06902
G3 X122.977 Y120.977 I2.772 J.778 E.0263
G1 X120.359 Y118.359 E.12284
G3 X120.491 Y118.157 I.246 J.017 E.00837
G1 X122.12 Y118.157 E.05401
G1 X120.534 Y117.724 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50065
G1 F1443
G1 X133.406 Y117.724 E.48008
; CHANGE_LAYER
; Z_HEIGHT: 18.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X131.406 Y117.724 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z18.8 I-.577 J-1.072 P1  F30000
G1 X122.911 Y122.298 Z18.8
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1451
G1 X122.901 Y122.358 E.00204
G1 X122.898 Y126.398 E.134
G1 X119.102 Y126.398 E.12593
G1 X119.102 Y118.602 E.2586
G1 X119.521 Y118.602 E.01391
G1 X119.893 Y118.467 E.01313
G1 X120.029 Y118.303 E.00708
G1 X120.102 Y118.021 E.00963
G1 X120.102 Y117.092 E.03083
G1 X133.898 Y117.092 E.45763
G1 X133.898 Y118.021 E.03083
G1 X133.95 Y118.261 E.00812
G1 X134.162 Y118.508 E.01081
G1 X134.479 Y118.602 E.01095
G1 X134.898 Y118.602 E.01391
G1 X134.898 Y119.021 E.01391
G1 X134.898 Y126.398 E.24469
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.409 I-198.152 J-1.815 E.13234
G1 X127.974 Y121.688 E.02425
G1 X127.679 Y121.072 E.02265
G1 X127.235 Y120.554 E.02265
G1 X126.686 Y120.176 E.02212
G1 X126.158 Y119.975 E.01872
G1 X125.481 Y119.891 E.02264
G1 X124.8 Y119.988 E.02283
G1 X124.129 Y120.281 E.02429
G1 X123.61 Y120.703 E.02216
G1 X123.271 Y121.152 E.01869
G1 X123 Y121.773 E.02247
G1 X122.921 Y122.239 E.01567
G1 X123.293 Y122.415 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1451
G1 X123.29 Y126.79 E.13442
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X119.521 Y118.21 E.02493
G1 X119.637 Y118.168 E.00379
G1 X119.668 Y118.111 E.00198
G1 X119.71 Y118.021 E.00304
G1 X119.71 Y116.858 E.03575
G1 X119.71 Y116.774 E.00258
G1 X119.71 Y116.7 E.00227
G1 X134.29 Y116.7 E.448
G1 X134.29 Y116.774 E.00227
G1 X134.29 Y116.858 E.00258
G1 X134.29 Y118.021 E.03575
G1 X134.332 Y118.14 E.00386
G1 X134.39 Y118.168 E.00199
G1 X134.479 Y118.21 E.003
G1 X135.29 Y118.21 E.02493
G1 X135.29 Y119.021 E.02493
G1 X135.29 Y126.79 E.23871
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.464 I-598.929 J-2.245 E.13292
G1 X127.615 Y121.847 E.0192
G1 X127.374 Y121.319 E.01783
G1 X127.005 Y120.871 E.01784
G1 X126.575 Y120.56 E.01632
G1 X126.098 Y120.363 E.01584
G1 X125.524 Y120.28 E.01783
G1 X124.946 Y120.351 E.01788
G1 X124.368 Y120.592 E.01923
G1 X123.948 Y120.916 E.01632
G1 X123.626 Y121.319 E.01585
G1 X123.385 Y121.845 E.01777
G1 X123.293 Y122.355 E.01594
M204 S10000
; WIPE_START
G1 F24000
G1 X123.292 Y124.355 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.32 Y117.957 Z19 F30000
G1 Z18.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1451
G1 X120.691 Y117.957 E.05401
G1 X120.397 Y118.251 E.01378
G1 X120.369 Y118.369 E.00404
G1 X122.977 Y120.977 E.12235
G2 X122.554 Y122.347 I2.558 J1.539 E.04801
G1 X122.554 Y123.77 E.04723
G1 X120.272 Y126.052 E.10703
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y119.2 E.19651
G3 X120.103 Y118.746 I.812 J.473 E.0273
G2 X120.28 Y118.549 I-.39 J-.526 E.00883
G1 X120.534 Y117.524 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50065
G1 F1451
G1 X133.406 Y117.524 E.48008
G1 X129.576 Y126.052 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1451
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X127.633 Y117.957 E.32459
G1 X128.367 Y117.957 E.02436
G1 X126.57 Y119.754 E.08429
G3 X127.846 Y120.728 I-1.154 J2.833 E.05386
; CHANGE_LAYER
; Z_HEIGHT: 18.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X127.445 Y120.279 E-.22847
G1 X127.001 Y119.957 E-.20856
G1 X126.57 Y119.754 E-.18096
M73 P77 R6
G1 X126.835 Y119.489 E-.14201
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z19 I-.708 J-.99 P1  F30000
G1 X122.911 Y122.296 Z19
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1687
G1 X122.901 Y122.357 E.00204
G1 X122.898 Y126.398 E.13405
G1 X119.102 Y126.398 E.12593
G1 X119.102 Y118.602 E.2586
G1 X119.521 Y118.602 E.01391
G1 X119.893 Y118.467 E.01313
G1 X120.03 Y118.303 E.00709
G1 X120.102 Y118.021 E.00963
G1 X120.102 Y116.892 E.03746
G1 X133.898 Y116.892 E.45763
G1 X133.898 Y118.021 E.03746
G2 X134.162 Y118.508 I.613 J-.018 E.01906
G1 X134.479 Y118.602 E.01095
G1 X134.898 Y118.602 E.01391
G1 X134.898 Y119.021 E.01391
G1 X134.898 Y126.398 E.24469
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.408 I-197.721 J-1.815 E.13234
G1 X127.973 Y121.688 E.02427
G1 X127.679 Y121.072 E.02263
G1 X127.235 Y120.554 E.02263
G1 X126.687 Y120.176 E.0221
G1 X126.158 Y119.975 E.01878
G1 X125.481 Y119.891 E.02262
G1 X124.8 Y119.987 E.0228
G1 X124.129 Y120.281 E.02432
G1 X123.611 Y120.702 E.02214
G1 X123.27 Y121.153 E.01875
G1 X123 Y121.773 E.02243
G1 X122.921 Y122.237 E.0156
G1 X123.293 Y122.423 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1687
G1 X123.29 Y126.79 E.1342
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X119.521 Y118.21 E.02493
G1 X119.637 Y118.168 E.00379
G1 X119.668 Y118.111 E.00198
G1 X119.71 Y118.021 E.00304
G1 X119.71 Y116.658 E.0419
G1 X119.71 Y116.574 E.00258
G1 X119.71 Y116.5 E.00227
G1 X134.29 Y116.5 E.448
G1 X134.29 Y116.574 E.00227
G1 X134.29 Y116.658 E.00258
G1 X134.29 Y118.021 E.0419
G1 X134.332 Y118.134 E.0037
G1 X134.397 Y118.168 E.00226
G1 X134.479 Y118.21 E.00281
G1 X135.29 Y118.21 E.02493
G1 X135.29 Y119.021 E.02493
G1 X135.29 Y126.79 E.23871
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.464 I-597.413 J-2.244 E.13292
G1 X127.615 Y121.846 E.01922
G1 X127.374 Y121.319 E.01781
G1 X127.005 Y120.872 E.01781
G1 X126.576 Y120.56 E.0163
G1 X126.098 Y120.363 E.0159
G1 X125.524 Y120.28 E.01781
G1 X124.947 Y120.351 E.01786
G1 X124.369 Y120.592 E.01925
G1 X123.949 Y120.916 E.0163
G1 X123.625 Y121.32 E.0159
G1 X123.385 Y121.845 E.01775
G1 X123.293 Y122.357 E.01598
G1 X123.293 Y122.363 E.00017
M204 S10000
; WIPE_START
G1 F24000
G1 X123.292 Y124.363 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z19.2 F30000
G1 Z18.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1687
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.554 Y123.77 E.10704
G3 X122.661 Y121.702 I6.33 J-.709 E.06901
G3 X122.977 Y120.977 I2.782 J.782 E.02632
G1 X121.718 Y119.718 E.05906
G1 X119.902 Y119.718 E.06025
G1 X119.977 Y118.792 E.03083
G2 X119.448 Y119.2 I.171 J.77 E.02289
G1 X119.448 Y120.828 E.05401
G1 X120.534 Y117.324 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.500652
G1 F1687
G1 X133.406 Y117.324 E.48008
G1 X127.846 Y120.728 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1687
G2 X126.57 Y119.754 I-2.428 J1.857 E.05386
G1 X129.394 Y119.718 E.09368
G1 X134.552 Y124.876 E.24196
G1 X134.552 Y119.448 E.18005
G1 X128.449 Y125.551 E.2863
G1 X128.449 Y126.052 E.01661
G1 X129.576 Y126.052 E.0374
; WIPE_START
G1 F24000
G1 X128.449 Y126.052 E-.42844
G1 X128.449 Y125.551 E-.19032
G1 X128.712 Y125.288 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X125.792 Y118.904 Z19.2 F30000
G1 Z18.8
G1 E.8 F1800
G1 F1687
G1 X127.42 Y118.904 E.05401
G1 X128.16 Y118.164 E.03472
G1 X127.84 Y118.164 E.01062
G1 X128.58 Y118.904 E.03472
G1 X130.208 Y118.904 E.05401
G1 X121.972 Y117.757 F30000
G1 F1687
G1 X133.552 Y117.757 E.38413
G1 X133.552 Y118.015 E.00857
G2 X133.69 Y119.311 I5.857 J.031 E.04332
G1 X120.343 Y119.311 E.44273
G2 X120.448 Y117.757 I-9.525 J-1.422 E.05173
G1 X121.912 Y117.757 E.04856
; CHANGE_LAYER
; Z_HEIGHT: 19
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X120.448 Y117.757 E-.55629
G1 X120.412 Y118.292 E-.20371
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z19.2 I-1.032 J.644 P1  F30000
G1 X122.911 Y122.294 Z19.2
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1699
G1 X122.901 Y122.355 E.00205
G1 X122.898 Y126.398 E.13411
G1 X119.102 Y126.398 E.12593
G1 X119.102 Y118.602 E.2586
G1 X119.521 Y118.602 E.01391
G1 X119.893 Y118.467 E.01313
G1 X120.03 Y118.302 E.00709
G1 X120.102 Y118.021 E.00963
G1 X120.102 Y116.692 E.0441
G1 X133.898 Y116.692 E.45763
G1 X133.898 Y118.021 E.0441
G1 X133.985 Y118.327 E.01052
G1 X134.162 Y118.508 E.00842
G1 X134.479 Y118.602 E.01095
G1 X134.898 Y118.602 E.01391
G1 X134.898 Y119.021 E.01391
G1 X134.898 Y126.398 E.24469
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.408 I-197.263 J-1.814 E.13234
G1 X128.017 Y121.839 E.01908
G2 X127.679 Y121.072 I-3.816 J1.221 E.02784
G1 X127.236 Y120.555 E.0226
G1 X126.688 Y120.177 E.02208
G1 X126.157 Y119.975 E.01885
G1 X125.481 Y119.891 E.02259
G1 X124.801 Y119.987 E.02278
G1 X124.129 Y120.281 E.02434
G1 X123.611 Y120.702 E.02212
G1 X123.27 Y121.154 E.01882
G1 X123 Y121.773 E.0224
G1 X122.921 Y122.235 E.01554
G1 X123.293 Y122.429 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1699
G1 X123.29 Y126.79 E.134
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X119.521 Y118.21 E.02493
G1 X119.637 Y118.168 E.00379
G1 X119.668 Y118.111 E.00198
G1 X119.71 Y118.021 E.00304
G1 X119.71 Y116.458 E.04804
G1 X119.71 Y116.374 E.00258
G1 X119.71 Y116.3 E.00227
G1 X134.29 Y116.3 E.448
G1 X134.29 Y116.374 E.00227
G1 X134.29 Y116.458 E.00258
G1 X134.29 Y118.021 E.04804
G1 X134.332 Y118.132 E.00363
G1 X134.4 Y118.168 E.00236
G1 X134.479 Y118.21 E.00274
G1 X135.29 Y118.21 E.02493
G1 X135.29 Y119.021 E.02493
G1 X135.29 Y126.79 E.23871
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.464 I-595.912 J-2.243 E.13292
G1 X127.605 Y121.823 E.01996
G1 X127.374 Y121.319 E.01705
G1 X127.006 Y120.872 E.01779
G1 X126.577 Y120.561 E.01628
G1 X126.097 Y120.362 E.01596
G1 X125.524 Y120.28 E.01778
G1 X124.948 Y120.351 E.01784
G1 X124.369 Y120.592 E.01927
G1 X123.94 Y120.923 E.01665
G1 X123.625 Y121.321 E.0156
G1 X123.385 Y121.846 E.01772
G1 X123.293 Y122.355 E.01592
G1 X123.293 Y122.369 E.00042
M204 S10000
; WIPE_START
G1 F24000
G1 X123.292 Y124.369 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z19.4 F30000
G1 Z19
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1699
G1 X119.448 Y119.2 E.05401
G3 X119.977 Y118.792 I.701 J.361 E.02289
G1 X119.902 Y119.718 E.03083
G1 X121.718 Y119.718 E.06025
G1 X122.977 Y120.977 E.05905
G2 X122.555 Y122.343 I2.559 J1.539 E.0479
G1 X122.554 Y123.77 E.04733
G1 X120.272 Y126.052 E.10704
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z19.4 F30000
G1 X129.576 Y126.052 Z19.4
G1 Z19
G1 E.8 F1800
G1 F1699
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X129.394 Y119.718 E.24196
G1 X126.57 Y119.754 E.09368
M73 P77 R5
G3 X127.846 Y120.728 I-1.151 J2.83 E.05387
G1 X130.208 Y118.904 F30000
M73 P78 R5
G1 F1699
G1 X128.58 Y118.904 E.05401
G1 X127.64 Y117.964 E.0441
G1 X128.36 Y117.964 E.02389
G1 X127.42 Y118.904 E.0441
G1 X125.792 Y118.904 E.05401
G1 X124.238 Y117.557 F30000
G1 F1699
G1 X133.552 Y117.557 E.30896
G1 X133.552 Y118.016 E.01523
G2 X133.69 Y119.311 I5.768 J.04 E.0433
G1 X120.343 Y119.311 E.44273
G2 X120.448 Y117.557 I-10.754 J-1.522 E.05836
G1 X124.178 Y117.557 E.12372
G1 X120.534 Y117.124 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50065
G1 F1699
G1 X133.406 Y117.124 E.48008
; CHANGE_LAYER
; Z_HEIGHT: 19.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X131.406 Y117.124 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z19.4 I-.633 J-1.04 P1  F30000
G1 X122.911 Y122.293 Z19.4
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1723
G1 X122.901 Y122.354 E.00205
G1 X122.898 Y126.398 E.13416
G1 X119.102 Y126.398 E.12593
G1 X119.102 Y118.602 E.2586
G1 X119.521 Y118.602 E.01391
G1 X119.893 Y118.467 E.01313
G1 X120.03 Y118.302 E.00709
G1 X120.102 Y118.021 E.00962
G1 X120.102 Y116.492 E.05073
G1 X133.898 Y116.492 E.45763
G1 X133.898 Y118.021 E.05073
G1 X133.967 Y118.297 E.00942
G1 X134.162 Y118.508 E.00953
G1 X134.479 Y118.602 E.01095
G1 X134.898 Y118.602 E.01391
G1 X134.898 Y119.021 E.01391
G1 X134.898 Y126.398 E.24469
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.408 I-196.836 J-1.814 E.13235
G1 X127.964 Y121.666 E.02503
G1 X127.679 Y121.072 E.02184
G1 X127.237 Y120.556 E.02257
G1 X126.689 Y120.177 E.02207
G1 X126.156 Y119.975 E.01891
G1 X125.481 Y119.891 E.02256
G1 X124.802 Y119.987 E.02276
G1 X124.129 Y120.281 E.02436
G1 X123.612 Y120.701 E.02211
G1 X123.269 Y121.155 E.01888
G1 X123 Y121.774 E.02237
G1 X122.921 Y122.234 E.01548
G1 X123.293 Y122.435 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1723
G1 X123.29 Y126.79 E.13381
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X119.521 Y118.21 E.02493
G1 X119.637 Y118.168 E.00379
G1 X119.668 Y118.111 E.00198
G1 X119.71 Y118.021 E.00304
G1 X119.71 Y116.258 E.05419
G1 X119.71 Y116.174 E.00258
G1 X119.71 Y116.1 E.00227
G1 X134.29 Y116.1 E.448
G1 X134.29 Y116.174 E.00227
G1 X134.29 Y116.258 E.00258
G1 X134.29 Y118.021 E.05419
G1 X134.332 Y118.132 E.00363
G1 X134.4 Y118.168 E.00236
G1 X134.479 Y118.21 E.00274
G1 X135.29 Y118.21 E.02493
G1 X135.29 Y119.021 E.02493
G1 X135.29 Y126.79 E.23871
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.464 I-594.718 J-2.242 E.13292
G1 X127.605 Y121.825 E.01992
G1 X127.374 Y121.319 E.01709
G1 X127.006 Y120.873 E.01777
G1 X126.578 Y120.561 E.01626
G1 X126.097 Y120.362 E.01602
G1 X125.524 Y120.28 E.01776
G1 X124.949 Y120.351 E.01782
G1 X124.369 Y120.591 E.01929
G1 X123.949 Y120.915 E.01628
G1 X123.624 Y121.322 E.016
G1 X123.385 Y121.846 E.0177
G1 X123.293 Y122.354 E.01586
G1 X123.293 Y122.375 E.00066
M204 S10000
; WIPE_START
G1 F24000
G1 X123.292 Y124.375 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z19.6 F30000
G1 Z19.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1723
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.554 Y123.77 E.10704
G1 X122.555 Y122.342 E.04738
G3 X122.977 Y120.977 I2.982 J.175 E.04785
G1 X121.718 Y119.718 E.05905
G1 X119.902 Y119.718 E.06025
G1 X119.977 Y118.792 E.03083
G2 X119.448 Y119.2 I.171 J.769 E.02289
G1 X119.448 Y120.828 E.05401
G1 X120.534 Y116.924 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50065
G1 F1723
G1 X133.406 Y116.924 E.48008
G1 X127.846 Y120.727 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1723
G2 X126.57 Y119.754 I-2.425 J1.854 E.05387
G1 X129.394 Y119.718 E.09368
G1 X134.552 Y124.876 E.24196
G1 X134.552 Y119.448 E.18005
G1 X128.449 Y125.551 E.2863
G1 X128.449 Y126.052 E.01661
G1 X129.576 Y126.052 E.0374
; WIPE_START
G1 F24000
G1 X128.449 Y126.052 E-.42844
G1 X128.449 Y125.551 E-.19032
G1 X128.712 Y125.288 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X125.792 Y118.904 Z19.6 F30000
G1 Z19.2
G1 E.8 F1800
G1 F1723
G1 X127.42 Y118.904 E.05401
G1 X128.56 Y117.764 E.05348
G1 X127.44 Y117.764 E.03716
G1 X128.58 Y118.904 E.05348
G1 X130.208 Y118.904 E.05401
G1 X122.091 Y117.357 F30000
G1 F1723
G1 X133.552 Y117.357 E.38017
G1 X133.552 Y118.016 E.02187
G2 X133.69 Y119.311 I5.604 J.057 E.0433
G1 X120.343 Y119.311 E.44273
G2 X120.448 Y117.357 I-11.982 J-1.621 E.06499
G1 X122.031 Y117.357 E.05252
; CHANGE_LAYER
; Z_HEIGHT: 19.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X120.448 Y117.357 E-.60164
G1 X120.426 Y117.773 E-.15836
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z19.6 I-1.074 J.573 P1  F30000
G1 X122.9 Y122.413 Z19.6
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1786
G1 X122.896 Y122.451 E.00126
G1 X122.898 Y126.398 E.13094
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X119.521 Y118.602 E.01391
G1 X119.894 Y118.467 E.01314
G1 X120.02 Y118.319 E.00646
G1 X120.102 Y118.021 E.01023
G1 X120.102 Y116.292 E.05737
G1 X133.898 Y116.292 E.45763
G1 X133.898 Y118.021 E.05737
G1 X133.974 Y118.309 E.00985
G1 X134.162 Y118.508 E.00909
G1 X134.479 Y118.602 E.01096
G1 X134.898 Y118.602 E.01391
G1 X134.898 Y119.021 E.01391
G1 X134.898 Y126.398 E.24469
G1 X128.102 Y126.398 E.22542
G2 X128.101 Y122.427 I-318.84 J-1.885 E.13172
G1 X128.022 Y121.861 E.01898
G1 X127.812 Y121.297 E.01997
G1 X127.5 Y120.828 E.01866
G1 X127.045 Y120.4 E.02072
G1 X126.465 Y120.075 E.02206
G1 X125.914 Y119.924 E.01897
G1 X125.227 Y119.906 E.02277
G1 X124.515 Y120.084 E.02436
G1 X123.925 Y120.421 E.02253
G1 X123.539 Y120.782 E.01753
G1 X123.421 Y120.937 E.00646
G1 X123.077 Y121.545 E.02316
G1 X122.936 Y122.054 E.01753
G1 X122.906 Y122.353 E.00996
G1 X123.289 Y122.442 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1786
G1 X123.288 Y122.451 E.00027
G1 X123.29 Y126.79 E.13334
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X119.521 Y118.21 E.02493
G1 X119.637 Y118.168 E.00378
G1 X119.668 Y118.111 E.00198
G1 X119.71 Y118.021 E.00305
G1 X119.71 Y116.058 E.06033
G1 X119.71 Y115.974 E.00258
G1 X119.71 Y115.9 E.00227
G1 X134.29 Y115.9 E.448
G1 X134.29 Y115.974 E.00227
G1 X134.29 Y116.058 E.00258
G1 X134.29 Y118.021 E.06033
G1 X134.332 Y118.132 E.00365
G1 X134.399 Y118.168 E.00234
G1 X134.479 Y118.21 E.00276
G1 X135.29 Y118.21 E.02493
G1 X135.29 Y119.021 E.02493
G1 X135.29 Y126.79 E.23871
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.664 Y122.039 E.01399
G1 X127.493 Y121.531 E.01646
G1 X127.222 Y121.105 E.0155
G1 X126.846 Y120.737 E.01618
G1 X126.391 Y120.468 E.01623
G1 X125.891 Y120.315 E.01608
G1 X125.312 Y120.289 E.01781
G1 X124.699 Y120.43 E.01931
G1 X124.193 Y120.708 E.01774
G1 X123.756 Y121.14 E.01889
G1 X123.455 Y121.65 E.01818
G1 X123.314 Y122.159 E.01624
G1 X123.294 Y122.382 E.00688
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.451 E-.02617
G1 X123.289 Y124.382 E-.73383
; WIPE_END
G1 E-.04 F1800
G1 X121.299 Y118.904 Z19.8 F30000
G1 Z19.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1786
G1 X120.785 Y118.904 E.01706
G2 X120.855 Y117.793 I-6.782 J-.986 E.03697
G1 X121.084 Y117.564 E.01074
G1 X127.24 Y117.564 E.2042
G1 X128.58 Y118.904 E.06287
G1 X127.42 Y118.904 E.03848
G1 X128.76 Y117.564 E.06287
G1 X130.388 Y117.564 E.05401
G1 X122.375 Y117.157 F30000
G1 F1786
G1 X133.552 Y117.157 E.37076
G2 X133.69 Y119.311 I10.069 J.436 E.07175
G1 X120.343 Y119.311 E.44273
G2 X120.448 Y117.157 I-13.163 J-1.719 E.07162
G1 X122.315 Y117.157 E.06192
G1 X120.534 Y116.724 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50065
G1 F1786
G1 X133.406 Y116.724 E.48008
M73 P79 R5
G1 X129.576 Y126.052 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1786
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X129.394 Y119.718 E.24196
G1 X126.576 Y119.748 E.09348
G3 X127.857 Y120.723 I-1.115 J2.791 E.05405
; WIPE_START
G1 F24000
G1 X127.229 Y120.106 E-.33426
G1 X126.576 Y119.748 E-.28308
G1 X126.952 Y119.744 E-.14267
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z19.8 F30000
G1 Z19.4
G1 E.8 F1800
G1 F1786
G1 X119.448 Y119.2 E.05401
G3 X119.977 Y118.792 I.701 J.362 E.02289
G1 X119.902 Y119.718 E.03084
G1 X121.718 Y119.718 E.06025
G1 X122.988 Y120.988 E.05958
G2 X122.553 Y122.381 I3.171 J1.757 E.04873
G1 X122.552 Y123.772 E.04614
G1 X120.272 Y126.052 E.10696
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z19.8 I.846 J.875 P1  F30000
G1 X122.911 Y122.29 Z19.8
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1802
G1 X122.901 Y122.35 E.00205
G1 X122.898 Y126.398 E.13426
G1 X119.102 Y126.398 E.12593
G1 X119.102 Y118.602 E.2586
G1 X119.521 Y118.602 E.01391
G1 X119.893 Y118.467 E.01313
G1 X120.03 Y118.302 E.0071
G1 X120.102 Y118.021 E.00962
G1 X120.102 Y116.092 E.064
G1 X133.898 Y116.092 E.45763
G1 X133.898 Y118.021 E.064
G1 X133.966 Y118.295 E.00936
G1 X134.162 Y118.508 E.00958
G1 X134.479 Y118.602 E.01096
G1 X134.898 Y118.602 E.01391
G1 X134.898 Y119.021 E.01391
G1 X134.898 Y126.398 E.24469
G1 X128.102 Y126.398 E.22542
G2 X128.101 Y122.427 I-316.499 J-1.884 E.13172
G1 X128.023 Y121.862 E.01893
G1 X127.811 Y121.297 E.02001
G1 X127.498 Y120.827 E.01872
G1 X127.046 Y120.4 E.02064
G1 X126.466 Y120.076 E.02204
G1 X125.913 Y119.924 E.01903
G1 X125.24 Y119.903 E.02232
G1 X124.649 Y120.033 E.02007
G1 X124.13 Y120.281 E.0191
G1 X123.613 Y120.7 E.02207
G1 X123.268 Y121.158 E.01901
G1 X122.999 Y121.774 E.0223
G1 X122.922 Y122.23 E.01535
G1 X123.293 Y122.446 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1802
G1 X123.29 Y126.79 E.13348
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X119.521 Y118.21 E.02493
G1 X119.637 Y118.168 E.00379
G1 X119.668 Y118.111 E.00198
G1 X119.71 Y118.021 E.00304
G1 X119.71 Y115.858 E.06648
G1 X119.71 Y115.774 E.00258
G1 X119.71 Y115.7 E.00227
G1 X134.29 Y115.7 E.448
G1 X134.29 Y115.774 E.00227
G1 X134.29 Y115.858 E.00258
G1 X134.29 Y118.021 E.06648
G1 X134.332 Y118.132 E.00364
G1 X134.399 Y118.168 E.00234
G1 X134.479 Y118.21 E.00276
G1 X135.29 Y118.21 E.02493
G1 X135.29 Y119.021 E.02493
G1 X135.29 Y126.79 E.23871
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.663 Y122.037 E.01404
G1 X127.491 Y121.526 E.01655
G1 X127.221 Y121.104 E.0154
G1 X126.846 Y120.737 E.01612
G1 X126.392 Y120.469 E.01621
G1 X125.89 Y120.315 E.01614
G1 X125.352 Y120.284 E.01656
G1 X124.847 Y120.38 E.01579
G1 X124.369 Y120.591 E.01607
G1 X123.934 Y120.928 E.01689
G1 X123.623 Y121.324 E.01547
G1 X123.385 Y121.847 E.01765
G1 X123.293 Y122.351 E.01574
G1 X123.293 Y122.386 E.00109
M204 S10000
; WIPE_START
G1 F24000
G1 X123.292 Y124.386 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.709 Y119.611 Z20 F30000
G1 Z19.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F1802
G1 X126.071 Y119.638 E.01003
; WIPE_START
G1 F24000
G1 X125.709 Y119.611 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.447 Y123.924 Z20 F30000
G1 Z19.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1802
G1 X128.448 Y125.552 E.05401
G1 X134.282 Y119.718 E.27367
G1 X129.394 Y119.718 E.16213
G1 X134.552 Y124.876 E.24196
G1 X134.552 Y126.052 E.03901
G1 X134.1 Y126.052 E.01501
G1 X134.083 Y119.329 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414179
G1 F1802
G1 X134.326 Y119.309 E.00736
G1 X134.509 Y119.126 E.00782
G1 X134.509 Y118.991 E.00409
G1 X134.034 Y118.867 E.01486
G1 X134.077 Y119.269 E.01224
G1 X133.869 Y119.285 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.410228
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X120.367 Y119.285 E.72711
G1 X120.405 Y118.824 E.02487
G1 X133.616 Y118.824 E.71146
G1 X133.566 Y118.364 E.02493
G1 X120.442 Y118.364 E.70677
G2 X120.47 Y117.904 I-2.81 J-.398 E.02486
G1 X133.53 Y117.904 E.70335
G1 X133.53 Y117.444 E.02478
G1 X120.47 Y117.444 E.70335
G1 X120.47 Y116.983 E.02478
G1 X133.733 Y116.983 E.71426
M106 S252.45
G1 X120.534 Y116.524 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.500638
; LAYER_HEIGHT: 0.2
G1 F1802
G1 X133.406 Y116.524 E.48007
G1 X119.946 Y119.323 F30000
; LINE_WIDTH: 0.426784
G1 F1802
G1 X119.985 Y118.842 E.0151
G1 X119.498 Y118.998 E.016
G1 X119.526 Y119.152 E.0049
G1 X119.724 Y119.323 E.00818
G1 X119.886 Y119.323 E.00507
G1 X119.448 Y123.496 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1802
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.554 Y123.77 E.10705
G1 X122.555 Y122.339 E.04748
G3 X122.977 Y120.977 I2.982 J.178 E.04775
G1 X121.718 Y119.718 E.05904
G1 X120.09 Y119.718 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X121.718 Y119.718 E-.61876
G1 X121.981 Y119.981 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z20 I-1.129 J.455 P1  F30000
G1 X122.912 Y122.288 Z20
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2262
G1 X122.901 Y122.349 E.00205
G1 X122.898 Y126.398 E.13431
G1 X119.102 Y126.398 E.12593
G1 X119.102 Y118.602 E.2586
G1 X119.521 Y118.602 E.01391
G1 X119.893 Y118.467 E.01313
G1 X120.03 Y118.302 E.0071
G1 X120.102 Y118.021 E.00961
G1 X120.102 Y115.892 E.07064
G1 X133.898 Y115.892 E.45763
G1 X133.898 Y118.021 E.07064
G1 X133.964 Y118.29 E.00918
G1 X134.162 Y118.508 E.00976
G1 X134.479 Y118.602 E.01096
G1 X134.898 Y118.602 E.01391
G1 X134.898 Y119.021 E.01391
G1 X134.898 Y126.398 E.24469
G1 X128.102 Y126.398 E.22542
G2 X128.101 Y122.427 I-314.278 J-1.883 E.13173
G1 X128.023 Y121.863 E.01887
G1 X127.811 Y121.297 E.02006
G1 X127.497 Y120.826 E.01878
G1 X127.046 Y120.4 E.02056
G1 X126.467 Y120.076 E.02203
G1 X125.912 Y119.923 E.0191
G1 X125.352 Y119.892 E.0186
G1 X124.773 Y119.994 E.01949
G1 X124.25 Y120.209 E.01876
G2 X123.613 Y120.7 I1.978 J3.228 E.02672
G1 X123.267 Y121.159 E.01907
G1 X122.999 Y121.774 E.02227
G1 X122.922 Y122.229 E.01529
G1 X123.293 Y122.451 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2262
G1 X123.29 Y126.79 E.13334
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X119.521 Y118.21 E.02493
G1 X119.637 Y118.168 E.00379
G1 X119.668 Y118.111 E.00198
G1 X119.71 Y118.021 E.00304
G1 X119.71 Y115.658 E.07262
G1 X119.71 Y115.574 E.00258
G1 X119.71 Y115.5 E.00227
G1 X134.29 Y115.5 E.448
G1 X134.29 Y115.574 E.00227
G1 X134.29 Y115.658 E.00258
G1 X134.29 Y118.021 E.07262
G1 X134.332 Y118.132 E.00364
G1 X134.399 Y118.168 E.00234
G1 X134.479 Y118.21 E.00276
G1 X135.29 Y118.21 E.02493
G1 X135.29 Y119.021 E.02493
G1 X135.29 Y126.79 E.23871
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.663 Y122.035 E.0141
G1 X127.49 Y121.525 E.01655
G1 X127.22 Y121.103 E.0154
G1 X126.847 Y120.738 E.01605
G1 X126.393 Y120.469 E.01619
G1 X125.889 Y120.315 E.0162
G1 X125.352 Y120.284 E.01653
G1 X124.849 Y120.379 E.01573
G1 X124.369 Y120.591 E.01612
G1 X123.935 Y120.928 E.01687
G1 X123.622 Y121.325 E.01553
G1 X123.385 Y121.847 E.01763
G1 X123.293 Y122.349 E.01568
G1 X123.293 Y122.391 E.00127
M204 S10000
; WIPE_START
G1 F24000
G1 X123.292 Y124.391 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X120.09 Y119.718 Z20.2 F30000
G1 Z19.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2262
G1 X121.718 Y119.718 E.05401
G1 X122.977 Y120.977 E.05904
G2 X122.555 Y122.337 I2.561 J1.539 E.0477
G1 X122.554 Y123.77 E.04753
G1 X120.272 Y126.052 E.10705
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
G1 X122.015 Y117.805 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.445384
G1 F2262
G1 X131.925 Y117.805 E.32499
G1 X132.391 Y118.195 F30000
; LINE_WIDTH: 0.419999
G1 F2262
G1 X132.375 Y117.415 E.02396
G1 X121.625 Y117.415 E.33029
G3 X121.609 Y118.195 I-4.079 J.303 E.024
G1 X132.331 Y118.195 E.32945
G1 X132.857 Y118.572 F30000
M73 P80 R5
G1 F2262
G1 X132.767 Y118.193 E.01197
G1 X132.752 Y117.038 E.03548
G1 X121.248 Y117.038 E.35347
G1 X121.248 Y118.021 E.03021
G1 X121.175 Y118.493 E.01465
G1 X121.14 Y118.572 E.00266
G1 X132.797 Y118.572 E.35817
G1 X133.504 Y118.949 F30000
G1 F2262
G1 X133.261 Y118.592 E.01327
G1 X133.138 Y118.124 E.01486
G3 X133.129 Y116.661 I24.757 J-.891 E.04496
G1 X120.871 Y116.661 E.37664
G1 X120.871 Y118.021 E.0418
G1 X120.804 Y118.421 E.01245
G1 X120.707 Y118.646 E.00755
G1 X120.486 Y118.949 E.0115
G1 X133.444 Y118.949 E.39814
G1 X134.277 Y119.326 F30000
G1 F2262
G1 X134.506 Y119.125 E.00936
G1 X134.506 Y118.994 E.00402
G1 X133.997 Y118.859 E.01617
G1 X133.723 Y118.631 E.01096
G1 X133.561 Y118.336 E.01033
G3 X133.506 Y117.805 I1.516 J-.425 E.01648
G1 X133.506 Y116.284 E.04674
G1 X120.494 Y116.284 E.39981
G1 X120.494 Y118.021 E.05338
G1 X120.402 Y118.425 E.01271
G1 X120.176 Y118.734 E.01177
G1 X120.088 Y118.801 E.00339
G2 X119.494 Y119.021 I1.855 J5.903 E.01948
G1 X119.523 Y119.154 E.00417
G1 X119.723 Y119.326 E.0081
G1 X134.217 Y119.326 E.44537
G1 X129.577 Y126.052 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2262
G1 X128.448 Y126.052 E.03743
G1 X128.448 Y125.552 E.01659
G1 X134.282 Y119.718 E.27367
G2 X134.552 Y119.634 I-.086 J-.747 E.00945
G1 X134.552 Y124.876 E.1739
G1 X129.394 Y119.718 E.24196
G1 X126.576 Y119.748 E.09348
G3 X127.857 Y120.723 I-1.115 J2.791 E.05404
; CHANGE_LAYER
; Z_HEIGHT: 20
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.23 Y120.107 E-.33374
G1 X126.576 Y119.748 E-.28359
G1 X126.952 Y119.744 E-.14267
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z20.2 I-.668 J-1.018 P1  F30000
G1 X122.904 Y122.399 Z20.2
G1 Z20
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2396
G1 X122.896 Y122.454 E.00185
G1 X122.898 Y126.398 E.13083
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X119.521 Y118.602 E.01391
G1 X119.893 Y118.467 E.01312
G1 X120.03 Y118.302 E.00711
G1 X120.102 Y118.021 E.00961
G1 X120.102 Y115.692 E.07727
G1 X133.898 Y115.692 E.45763
G1 X133.898 Y118.021 E.07727
G1 X133.964 Y118.29 E.00917
G1 X134.162 Y118.508 E.00977
G1 X134.479 Y118.602 E.01096
G1 X134.898 Y118.602 E.01391
G1 X134.898 Y119.021 E.01391
G1 X134.898 Y126.398 E.24469
G1 X128.102 Y126.398 E.22542
G2 X128.101 Y122.426 I-312.004 J-1.881 E.13174
G1 X128.024 Y121.864 E.01882
G1 X127.811 Y121.297 E.02011
G1 X127.496 Y120.824 E.01884
G1 X127.047 Y120.401 E.02049
G1 X126.468 Y120.076 E.02201
G1 X125.911 Y119.923 E.01916
G1 X125.24 Y119.903 E.02225
G1 X124.653 Y120.032 E.01994
G1 X124.13 Y120.281 E.01922
G1 X123.614 Y120.699 E.02204
G1 X123.266 Y121.16 E.01914
G1 X122.999 Y121.775 E.02223
G1 X122.913 Y122.339 E.01895
G1 X123.288 Y122.455 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2396
G1 X123.29 Y126.79 E.13319
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X119.521 Y118.21 E.02493
G1 X119.637 Y118.168 E.00379
G1 X119.668 Y118.111 E.00198
G1 X119.71 Y118.021 E.00304
G1 X119.71 Y115.458 E.07877
G1 X119.71 Y115.374 E.00258
G1 X119.71 Y115.3 E.00227
G1 X134.29 Y115.3 E.448
G1 X134.29 Y115.374 E.00227
G1 X134.29 Y115.458 E.00258
G1 X134.29 Y118.021 E.07877
G1 X134.332 Y118.132 E.00364
G1 X134.399 Y118.168 E.00234
G1 X134.479 Y118.21 E.00276
G1 X135.29 Y118.21 E.02493
G1 X135.29 Y119.021 E.02493
G1 X135.29 Y126.79 E.23871
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.663 Y122.033 E.01416
G1 X127.49 Y121.525 E.01649
G1 X127.219 Y121.102 E.01546
G1 X126.847 Y120.738 E.01599
G1 X126.394 Y120.469 E.01617
G1 X125.888 Y120.315 E.01625
G1 X125.352 Y120.284 E.01651
G1 X124.851 Y120.379 E.01567
G1 X124.369 Y120.591 E.01618
G1 X123.935 Y120.927 E.01686
G1 X123.622 Y121.326 E.01559
G1 X123.385 Y121.847 E.01761
G1 X123.297 Y122.396 E.01707
M204 S10000
; WIPE_START
G1 F24000
G1 X123.294 Y124.396 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z20.4 F30000
G1 Z20
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2396
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.10692
G3 X122.727 Y121.498 I6.301 J-.659 E.07611
G1 X122.977 Y120.977 E.01917
G1 X121.204 Y119.204 E.08318
G1 X119.746 Y119.204 E.04835
G1 X119.595 Y119.053 E.00707
G1 X119.448 Y119.2 E.00691
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.595 Y119.053 E-.0791
G1 X119.711 Y119.168 E-.06214
; WIPE_END
G1 E-.04 F1800
G1 X127.208 Y120.599 Z20.4 F30000
G1 X127.857 Y120.723 Z20.4
G1 Z20
G1 E.8 F1800
G1 F2396
G2 X126.576 Y119.748 I-2.924 J2.511 E.05378
G1 X127.121 Y119.204 E.02553
G1 X128.879 Y119.204 E.05835
G1 X134.552 Y124.876 E.2661
G1 X134.552 Y119.448 E.18005
G1 X128.448 Y125.552 E.28634
G1 X128.448 Y126.052 E.01659
G1 X129.577 Y126.052 E.03743
G1 X133.686 Y118.981 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2396
G1 X134.004 Y118.663 E.01383
G1 X133.764 Y118.369
G1 X133.152 Y118.981 E.0266
G1 X132.619 Y118.981
G1 X133.676 Y117.925 E.04591
G1 X133.676 Y117.391
G1 X132.086 Y118.981 E.06908
G1 X131.553 Y118.981
G1 X133.676 Y116.858 E.09225
G1 X133.676 Y116.325
G1 X131.019 Y118.981 E.11543
G1 X130.486 Y118.981
G1 X133.553 Y115.914 E.13326
G1 X133.019 Y115.914
G1 X129.953 Y118.981 E.13326
G1 X129.419 Y118.981
G1 X132.486 Y115.914 E.13326
G1 X131.953 Y115.914
G1 X128.886 Y118.981 E.13326
G1 X128.353 Y118.981
G1 X131.42 Y115.914 E.13326
G1 X130.886 Y115.914
G1 X127.82 Y118.981 E.13326
G1 X127.286 Y118.981
G1 X130.353 Y115.914 E.13326
G1 X129.82 Y115.914
G1 X126.753 Y118.981 E.13326
G1 X126.22 Y118.981
G1 X129.287 Y115.914 E.13326
G1 X128.753 Y115.914
G1 X125.687 Y118.981 E.13326
G1 X125.153 Y118.981
G1 X128.22 Y115.914 E.13326
G1 X127.687 Y115.914
G1 X124.62 Y118.981 E.13326
G1 X124.087 Y118.981
G1 X127.153 Y115.914 E.13326
G1 X126.62 Y115.914
G1 X123.553 Y118.981 E.13326
G1 X123.02 Y118.981
G1 X126.087 Y115.914 E.13326
G1 X125.554 Y115.914
G1 X122.487 Y118.981 E.13326
G1 X121.954 Y118.981
G1 X125.02 Y115.914 E.13326
G1 X124.487 Y115.914
G1 X121.42 Y118.981 E.13326
G1 X120.887 Y118.981
G1 X123.954 Y115.914 E.13326
G1 X123.421 Y115.914
G1 X120.354 Y118.981 E.13326
G1 X119.829 Y118.972
G1 X122.887 Y115.914 E.13288
G1 X122.354 Y115.914
G1 X120.324 Y117.944 E.08819
G1 X120.324 Y117.411
G1 X121.821 Y115.914 E.06502
G1 X121.287 Y115.914
G1 X120.324 Y116.877 E.04185
G1 X120.324 Y116.344
G1 X120.754 Y115.914 E.01867
M204 S10000
; WIPE_START
G1 F24000
G1 X120.324 Y116.344 E-.23093
G1 X120.324 Y116.877 E-.20264
G1 X120.932 Y116.27 E-.32643
; WIPE_END
G1 E-.04 F1800
G1 X128.404 Y117.825 Z20.4 F30000
G1 X134.052 Y119 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.209969
G1 F2396
G2 X134.222 Y118.822 I-.628 J-.773 E.00336
; LINE_WIDTH: 0.220369
G1 X134.167 Y118.76 E.0012
; LINE_WIDTH: 0.178494
G1 X134.113 Y118.697 E.00092
G1 X120.391 Y118.144 F30000
; LINE_WIDTH: 0.12766
G1 F2396
G1 X120.312 Y117.931 E.00157
; CHANGE_LAYER
; Z_HEIGHT: 20.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X120.391 Y118.144 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z20.4 I-1.048 J.619 P1  F30000
G1 X122.904 Y122.4 Z20.4
G1 Z20.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.896 Y122.455 E.00185
G1 X122.898 Y126.398 E.1308
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14546
G1 X128.102 Y126.398 E.22542
G2 X128.097 Y122.394 I-165.669 J-1.796 E.13282
G1 X128.023 Y121.863 E.0178
G1 X127.811 Y121.297 E.02005
G1 X127.495 Y120.823 E.0189
G1 X127.047 Y120.401 E.02041
G1 X126.469 Y120.077 E.022
G1 X125.91 Y119.923 E.01923
G1 X125.24 Y119.903 E.02222
G1 X124.655 Y120.031 E.01987
G1 X124.13 Y120.281 E.01929
G1 X123.614 Y120.699 E.02203
G1 X123.266 Y121.161 E.0192
G1 X122.999 Y121.775 E.0222
G1 X122.913 Y122.341 E.01898
G1 X123.288 Y122.459 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.29 Y126.79 E.13309
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.662 Y122.031 E.01421
G1 X127.499 Y121.545 E.01576
G1 X127.218 Y121.1 E.01617
G1 X126.847 Y120.738 E.01592
G1 X126.395 Y120.47 E.01615
G1 X125.888 Y120.315 E.01631
G1 X125.352 Y120.284 E.01649
G1 X124.853 Y120.378 E.0156
G1 X124.369 Y120.591 E.01623
G1 X123.953 Y120.912 E.01616
G1 X123.621 Y121.327 E.01631
G1 X123.384 Y121.848 E.01758
G1 X123.297 Y122.399 E.01716
M204 S10000
; WIPE_START
G1 F24000
G1 X123.294 Y124.399 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z20.6 F30000
G1 Z20.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1260
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
M73 P81 R5
G1 X122.975 Y120.975 E.0951
G2 X122.551 Y122.411 I2.605 J1.55 E.05017
G1 X122.551 Y123.773 E.04518
G1 X120.272 Y126.052 E.10692
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z20.6 F30000
G1 X129.576 Y126.052 Z20.6
G1 Z20.2
G1 E.8 F1800
G1 F1260
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.578 Y119.748 E.03748
G3 X127.857 Y120.723 I-1.116 J2.789 E.05397
; CHANGE_LAYER
; Z_HEIGHT: 20.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X127.232 Y120.108 E-.33317
G1 X126.578 Y119.748 E-.28336
G1 X126.845 Y119.481 E-.14347
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z20.6 I-.725 J-.978 P1  F30000
G1 X122.904 Y122.401 Z20.6
G1 Z20.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.896 Y122.456 E.00184
G1 X122.898 Y126.398 E.13076
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14546
G1 X128.102 Y126.398 E.22542
G2 X128.098 Y122.395 I-168.608 J-1.798 E.13277
G1 X128.023 Y121.861 E.01791
G1 X127.811 Y121.297 E.01998
G1 X127.494 Y120.821 E.01896
G1 X127.048 Y120.401 E.02033
G1 X126.47 Y120.077 E.02198
G1 X125.909 Y119.923 E.01929
G1 X125.241 Y119.903 E.02219
G1 X124.657 Y120.031 E.0198
G1 X124.13 Y120.28 E.01935
G1 X123.615 Y120.698 E.02201
G1 X123.265 Y121.162 E.01927
G1 X122.999 Y121.775 E.02217
G1 X122.913 Y122.342 E.01901
G1 X123.288 Y122.462 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.29 Y126.79 E.133
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.662 Y122.03 E.01427
G1 X127.499 Y121.545 E.0157
G1 X127.217 Y121.099 E.01622
G1 X126.848 Y120.738 E.01586
G1 X126.396 Y120.47 E.01613
G1 X125.887 Y120.314 E.01637
G1 X125.352 Y120.284 E.01647
G1 X124.855 Y120.377 E.01554
G1 X124.369 Y120.591 E.01629
G1 X123.953 Y120.912 E.01614
G1 X123.62 Y121.328 E.01637
G1 X123.384 Y121.848 E.01756
G1 X123.297 Y122.402 E.01724
M204 S10000
; WIPE_START
G1 F24000
G1 X123.294 Y124.402 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z20.8 F30000
G1 Z20.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1260
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.10692
G3 X122.726 Y121.5 I6.323 J-.657 E.07603
G3 X122.975 Y120.975 I2.312 J.778 E.01932
G1 X120.948 Y118.948 E.0951
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
G1 X127.173 Y120.574 Z20.8 F30000
G1 X127.857 Y120.723 Z20.8
G1 Z20.4
G1 E.8 F1800
G1 F1260
G2 X126.576 Y119.748 I-2.913 J2.498 E.05378
G1 X127.376 Y118.948 E.03752
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.449 Y125.551 E.2863
M73 P81 R4
G1 X128.449 Y126.052 E.01661
G1 X129.576 Y126.052 E.0374
; CHANGE_LAYER
; Z_HEIGHT: 20.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.449 Y126.052 E-.42844
G1 X128.449 Y125.551 E-.19032
G1 X128.712 Y125.288 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z20.8 I.542 J-1.09 P1  F30000
G1 X122.904 Y122.402 Z20.8
G1 Z20.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1261
G1 X122.896 Y122.457 E.00184
G1 X122.898 Y126.398 E.13072
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14546
G1 X128.102 Y126.398 E.22542
G2 X128.098 Y122.397 I-171.72 J-1.799 E.13273
G1 X128.023 Y121.859 E.01803
G1 X127.811 Y121.297 E.01991
G1 X127.493 Y120.82 E.01902
G1 X127.048 Y120.402 E.02025
G1 X126.471 Y120.078 E.02196
G1 X125.908 Y119.923 E.01936
G1 X125.241 Y119.903 E.02215
G1 X124.659 Y120.03 E.01974
G1 X124.13 Y120.28 E.01942
G1 X123.615 Y120.698 E.02199
G1 X123.264 Y121.163 E.01933
G1 X122.999 Y121.775 E.02213
G1 X122.913 Y122.343 E.01904
G1 X123.288 Y122.464 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1261
G1 X123.29 Y126.79 E.13292
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.661 Y122.028 E.01433
G1 X127.499 Y121.545 E.01564
G1 X127.216 Y121.098 E.01628
G1 X126.848 Y120.739 E.01579
G1 X126.397 Y120.471 E.01611
G1 X125.886 Y120.314 E.01643
G1 X125.351 Y120.284 E.01645
G1 X124.856 Y120.377 E.01548
G1 X124.369 Y120.591 E.01635
G1 X123.954 Y120.911 E.01612
G1 X123.62 Y121.329 E.01643
G1 X123.384 Y121.848 E.01754
G1 X123.296 Y122.405 E.01731
M204 S10000
; WIPE_START
G1 F24000
G1 X123.293 Y124.405 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z21 F30000
G1 Z20.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1261
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
M73 P82 R4
G1 X122.975 Y120.975 E.0951
G2 X122.551 Y122.413 I2.602 J1.55 E.05025
G1 X122.551 Y123.773 E.04511
G1 X120.272 Y126.052 E.10691
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z21 F30000
G1 X129.576 Y126.052 Z21
G1 Z20.6
G1 E.8 F1800
G1 F1261
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.576 Y119.748 E.03752
G3 X127.857 Y120.723 I-1.627 J3.466 E.05378
; CHANGE_LAYER
; Z_HEIGHT: 20.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X127.233 Y120.109 E-.3326
G1 X126.576 Y119.748 E-.28468
G1 X126.842 Y119.482 E-.14271
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z21 I-.725 J-.977 P1  F30000
G1 X122.904 Y122.404 Z21
G1 Z20.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.896 Y122.458 E.00184
G1 X122.898 Y126.398 E.13069
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14546
G1 X128.102 Y126.398 E.22542
G2 X128.098 Y122.398 I-174.968 J-1.801 E.13268
G1 X128.022 Y121.857 E.01814
G1 X127.811 Y121.297 E.01985
G1 X127.492 Y120.819 E.01907
G1 X127.049 Y120.402 E.02018
G1 X126.472 Y120.078 E.02195
G1 X125.907 Y119.923 E.01942
G1 X125.241 Y119.903 E.02212
G1 X124.661 Y120.029 E.01967
G1 X124.13 Y120.28 E.01948
G1 X123.616 Y120.697 E.02198
G1 X123.264 Y121.164 E.0194
G1 X122.999 Y121.776 E.0221
G1 X122.913 Y122.344 E.01908
G1 X123.288 Y122.466 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.29 Y126.79 E.13286
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.661 Y122.026 E.01439
G1 X127.499 Y121.546 E.01558
G1 X127.215 Y121.096 E.01633
G1 X126.848 Y120.739 E.01573
G1 X126.398 Y120.471 E.01609
G1 X125.885 Y120.314 E.01649
G1 X125.351 Y120.284 E.01643
G1 X124.858 Y120.376 E.01541
G1 X124.37 Y120.591 E.0164
G1 X123.954 Y120.911 E.0161
G1 X123.619 Y121.33 E.01649
G1 X123.384 Y121.849 E.01751
G1 X123.296 Y122.407 E.01736
M204 S10000
; WIPE_START
G1 F24000
G1 X123.293 Y124.407 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z21.2 F30000
G1 Z20.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1260
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.10691
G3 X122.725 Y121.501 I6.343 J-.656 E.07598
G3 X122.975 Y120.975 I2.312 J.777 E.01936
G1 X120.948 Y118.948 E.0951
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
G1 X127.173 Y120.574 Z21.2 F30000
G1 X127.856 Y120.723 Z21.2
G1 Z20.8
G1 E.8 F1800
G1 F1260
G2 X126.576 Y119.748 I-2.902 J2.485 E.05378
G1 X127.376 Y118.948 E.03753
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.449 Y125.551 E.2863
G1 X128.449 Y126.052 E.01661
G1 X129.576 Y126.052 E.0374
; CHANGE_LAYER
; Z_HEIGHT: 21
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.449 Y126.052 E-.42844
G1 X128.449 Y125.551 E-.19032
G1 X128.712 Y125.288 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z21.2 I.541 J-1.09 P1  F30000
G1 X122.904 Y122.405 Z21.2
G1 Z21
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1261
G1 X122.896 Y122.459 E.00183
G1 X122.898 Y126.398 E.13065
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14546
G1 X128.102 Y126.398 E.22542
G2 X128.098 Y122.4 I-178.365 J-1.803 E.13263
G1 X128.022 Y121.855 E.01825
G1 X127.811 Y121.297 E.01978
G1 X127.491 Y120.817 E.01913
G1 X127.049 Y120.402 E.0201
G1 X126.473 Y120.078 E.02193
G1 X125.906 Y119.923 E.01948
G1 X125.241 Y119.903 E.02208
G1 X124.663 Y120.029 E.01961
G1 X124.131 Y120.28 E.01955
G1 X123.616 Y120.697 E.02196
G1 X123.263 Y121.165 E.01946
G1 X122.999 Y121.776 E.02206
G1 X122.913 Y122.345 E.01911
G1 X123.288 Y122.468 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1261
G1 X123.29 Y126.79 E.13281
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.661 Y122.024 E.01444
G1 X127.499 Y121.546 E.01552
G1 X127.214 Y121.095 E.01639
G1 X126.849 Y120.739 E.01567
G1 X126.399 Y120.472 E.01607
G1 X125.884 Y120.314 E.01654
G1 X125.362 Y120.284 E.01608
G1 X124.86 Y120.376 E.01567
G1 X124.37 Y120.591 E.01646
G1 X123.955 Y120.91 E.01608
G1 X123.618 Y121.33 E.01654
G1 X123.384 Y121.849 E.01749
G1 X123.296 Y122.408 E.01739
M204 S10000
; WIPE_START
G1 F24000
G1 X123.293 Y124.408 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z21.4 F30000
G1 Z21
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1261
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
M73 P83 R4
G1 X120.948 Y118.948 E.0414
G1 X122.975 Y120.975 E.0951
G2 X122.551 Y122.415 I2.599 J1.549 E.05032
G1 X122.551 Y123.773 E.04503
G1 X120.272 Y126.052 E.10691
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z21.4 F30000
G1 X129.576 Y126.052 Z21.4
G1 Z21
G1 E.8 F1800
G1 F1261
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.576 Y119.748 E.03753
G3 X127.856 Y120.722 I-1.616 J3.453 E.05378
; CHANGE_LAYER
; Z_HEIGHT: 21.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.234 Y120.109 E-.33203
G1 X126.576 Y119.748 E-.28523
G1 X126.841 Y119.483 E-.14273
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z21.4 I-.725 J-.977 P1  F30000
G1 X122.904 Y122.406 Z21.4
G1 Z21.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.896 Y122.46 E.00183
G1 X122.898 Y126.398 E.13061
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.098 Y122.401 I-181.925 J-1.805 E.13259
G1 X128.021 Y121.853 E.01837
G1 X127.811 Y121.297 E.01971
G1 X127.489 Y120.816 E.01919
G1 X127.05 Y120.403 E.02002
G1 X126.474 Y120.079 E.02192
G1 X125.906 Y119.922 E.01955
G1 X125.241 Y119.903 E.02205
G1 X124.665 Y120.028 E.01954
G1 X124.131 Y120.28 E.01961
G1 X123.617 Y120.696 E.02194
G1 X123.262 Y121.166 E.01952
G1 X122.999 Y121.776 E.02204
G1 X122.913 Y122.347 E.01914
G1 X123.288 Y122.469 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.29 Y126.79 E.13278
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.66 Y122.022 E.0145
G1 X127.499 Y121.546 E.01546
G1 X127.213 Y121.094 E.01644
G1 X126.849 Y120.739 E.0156
G1 X126.4 Y120.472 E.01605
G1 X125.884 Y120.314 E.0166
G1 X125.362 Y120.285 E.01606
G1 X124.862 Y120.375 E.01561
G1 X124.37 Y120.591 E.01652
G1 X123.955 Y120.909 E.01606
G1 X123.618 Y121.331 E.0166
G1 X123.384 Y121.849 E.01747
G1 X123.296 Y122.409 E.01742
M204 S10000
; WIPE_START
G1 F24000
G1 X123.293 Y124.409 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z21.6 F30000
G1 Z21.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1260
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.10691
G3 X122.725 Y121.503 I6.362 J-.655 E.07593
G3 X122.975 Y120.975 I2.313 J.776 E.01941
G1 X120.948 Y118.948 E.0951
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
G1 X127.173 Y120.573 Z21.6 F30000
G1 X127.856 Y120.722 Z21.6
G1 Z21.2
G1 E.8 F1800
G1 F1260
G2 X126.576 Y119.748 I-2.891 J2.472 E.05378
G1 X127.376 Y118.948 E.03754
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.449 Y125.551 E.2863
G1 X128.449 Y126.052 E.01661
G1 X129.576 Y126.052 E.0374
; CHANGE_LAYER
; Z_HEIGHT: 21.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X128.449 Y126.052 E-.42844
G1 X128.449 Y125.551 E-.19032
G1 X128.712 Y125.288 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z21.6 I.541 J-1.09 P1  F30000
G1 X122.904 Y122.407 Z21.6
G1 Z21.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1261
G1 X122.896 Y122.462 E.00183
G1 X122.898 Y126.398 E.13058
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.098 Y122.402 I-185.597 J-1.807 E.13254
G1 X128.021 Y121.851 E.01848
G1 X127.811 Y121.297 E.01964
G1 X127.488 Y120.814 E.01925
G1 X127.05 Y120.403 E.01994
G1 X126.475 Y120.079 E.0219
G1 X125.905 Y119.922 E.01961
G1 X125.241 Y119.903 E.02202
G1 X124.668 Y120.027 E.01948
G1 X124.131 Y120.28 E.01967
G1 X123.617 Y120.696 E.02193
G1 X123.262 Y121.167 E.01959
G1 X122.999 Y121.776 E.022
G1 X122.913 Y122.348 E.01917
G1 X123.288 Y122.47 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1261
G1 X123.29 Y126.79 E.13276
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.66 Y122.02 E.01456
G1 X127.499 Y121.546 E.0154
G1 X127.212 Y121.092 E.0165
G1 X126.849 Y120.74 E.01553
G1 X126.401 Y120.473 E.01603
G1 X125.883 Y120.314 E.01666
G1 X125.362 Y120.285 E.01604
G1 X124.864 Y120.374 E.01554
G1 X124.37 Y120.591 E.01657
G1 X123.956 Y120.909 E.01604
G1 X123.617 Y121.332 E.01665
G1 X123.384 Y121.85 E.01745
G1 X123.296 Y122.41 E.01743
M204 S10000
; WIPE_START
G1 F24000
G1 X123.293 Y124.41 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z21.8 F30000
G1 Z21.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1261
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
M73 P84 R4
G1 X120.948 Y118.948 E.0414
G1 X122.975 Y120.975 E.0951
G2 X122.551 Y122.418 I2.596 J1.548 E.0504
G1 X122.551 Y123.773 E.04496
G1 X120.272 Y126.052 E.10691
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z21.8 F30000
G1 X129.576 Y126.052 Z21.8
G1 Z21.4
G1 E.8 F1800
G1 F1261
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.576 Y119.748 E.03754
G3 X127.856 Y120.722 I-1.605 J3.44 E.05378
; CHANGE_LAYER
; Z_HEIGHT: 21.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.235 Y120.11 E-.33147
G1 X126.576 Y119.748 E-.28578
G1 X126.841 Y119.483 E-.14276
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z21.8 I-.726 J-.977 P1  F30000
G1 X122.904 Y122.408 Z21.8
G1 Z21.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.896 Y122.463 E.00182
G1 X122.898 Y126.398 E.13054
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.098 Y122.404 I-189.499 J-1.81 E.1325
G1 X128.02 Y121.849 E.01859
G1 X127.811 Y121.297 E.01958
G1 X127.487 Y120.813 E.01931
G1 X127.051 Y120.403 E.01986
G1 X126.476 Y120.08 E.02189
G1 X125.904 Y119.922 E.01967
G1 X125.241 Y119.903 E.02198
G1 X124.67 Y120.027 E.01941
G1 X124.131 Y120.28 E.01974
G1 X123.618 Y120.695 E.02191
G1 X123.261 Y121.168 E.01965
G1 X122.998 Y121.776 E.02197
G1 X122.913 Y122.349 E.0192
G1 X123.288 Y122.47 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.29 Y126.79 E.13275
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.659 Y122.019 E.01462
G1 X127.499 Y121.546 E.01533
G1 X127.211 Y121.091 E.01655
G1 X126.85 Y120.74 E.01547
G1 X126.402 Y120.473 E.01602
G1 X125.882 Y120.314 E.01671
G1 X125.361 Y120.285 E.01602
G1 X124.866 Y120.374 E.01548
G1 X124.37 Y120.591 E.01663
G1 X123.956 Y120.908 E.01602
G1 X123.617 Y121.333 E.01671
G1 X123.384 Y121.85 E.01743
G1 X123.296 Y122.41 E.01743
M204 S10000
; WIPE_START
G1 F24000
G1 X123.293 Y124.41 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z22 F30000
G1 Z21.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1260
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.10691
G3 X122.724 Y121.504 I6.382 J-.654 E.07588
G3 X122.975 Y120.975 I2.313 J.775 E.01946
G1 X120.948 Y118.948 E.0951
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
G1 X127.173 Y120.573 Z22 F30000
G1 X127.856 Y120.722 Z22
G1 Z21.6
G1 E.8 F1800
G1 F1260
G1 X127.856 Y120.721 E.00004
G2 X126.576 Y119.748 I-2.881 J2.462 E.05374
G1 X127.376 Y118.948 E.03755
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.449 Y125.551 E.2863
G1 X128.449 Y126.052 E.01661
G1 X129.576 Y126.052 E.0374
; CHANGE_LAYER
; Z_HEIGHT: 21.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X128.449 Y126.052 E-.42844
G1 X128.449 Y125.551 E-.19032
G1 X128.712 Y125.288 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z22 I.54 J-1.09 P1  F30000
G1 X122.904 Y122.41 Z22
G1 Z21.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1262
G1 X122.896 Y122.464 E.00182
G1 X122.898 Y126.398 E.1305
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.405 I-193.623 J-1.812 E.13245
G1 X128.02 Y121.847 E.01871
G1 X127.811 Y121.297 E.01951
G1 X127.486 Y120.812 E.01937
G1 X127.051 Y120.404 E.01979
G1 X126.477 Y120.08 E.02188
G1 X125.903 Y119.922 E.01973
G1 X125.242 Y119.903 E.02195
G1 X124.672 Y120.026 E.01935
G1 X124.131 Y120.28 E.0198
G1 X123.618 Y120.695 E.0219
G1 X123.26 Y121.17 E.01972
G1 X122.998 Y121.777 E.02194
G1 X122.913 Y122.35 E.01923
G1 X123.288 Y122.47 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1262
G1 X123.29 Y126.79 E.13275
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.659 Y122.017 E.01467
G1 X127.499 Y121.546 E.01527
G1 X127.21 Y121.09 E.0166
G1 X126.85 Y120.74 E.01541
G1 X126.362 Y120.455 E.01738
G1 X125.881 Y120.313 E.01539
G1 X125.318 Y120.287 E.01732
G1 X124.828 Y120.386 E.01537
G1 X124.37 Y120.591 E.01542
G1 X123.924 Y120.94 E.01739
G1 X123.616 Y121.334 E.01538
G1 X123.383 Y121.85 E.0174
G1 X123.296 Y122.41 E.01741
M204 S10000
; WIPE_START
G1 F24000
G1 X123.293 Y124.41 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z22.2 F30000
G1 Z21.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1262
M73 P85 R4
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.975 Y120.975 E.0951
G2 X122.551 Y122.42 I2.594 J1.547 E.05047
G1 X122.551 Y123.773 E.04489
G1 X120.272 Y126.052 E.10691
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z22.2 F30000
G1 X129.576 Y126.052 Z22.2
G1 Z21.8
G1 E.8 F1800
G1 F1262
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.576 Y119.749 E.03755
G3 X127.856 Y120.722 I-1.098 J2.774 E.05404
; CHANGE_LAYER
; Z_HEIGHT: 22
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.236 Y120.111 E-.3309
G1 X126.576 Y119.749 E-.2863
G1 X126.841 Y119.483 E-.1428
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z22.2 I-.726 J-.977 P1  F30000
G1 X122.904 Y122.411 Z22.2
G1 Z22
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.896 Y122.465 E.00182
G1 X122.898 Y126.398 E.13047
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
M73 P85 R3
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.406 I-197.901 J-1.815 E.13241
G1 X128.019 Y121.845 E.01882
G1 X127.811 Y121.297 E.01944
G1 X127.485 Y120.81 E.01943
G1 X127.052 Y120.404 E.01971
G1 X126.477 Y120.08 E.02186
G1 X125.902 Y119.922 E.0198
G1 X125.242 Y119.902 E.02191
G1 X124.674 Y120.025 E.01929
G1 X124.131 Y120.28 E.01986
G1 X123.619 Y120.694 E.02188
G1 X123.26 Y121.171 E.01978
G1 X122.998 Y121.777 E.0219
G1 X122.913 Y122.351 E.01927
G1 X123.288 Y122.469 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.29 Y126.79 E.13276
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.659 Y122.015 E.01473
G1 X127.499 Y121.546 E.01521
G1 X127.235 Y121.121 E.01538
G1 X126.85 Y120.741 E.01662
G1 X126.363 Y120.455 E.01737
G1 X125.88 Y120.313 E.01545
G1 X125.351 Y120.284 E.0163
G1 X124.83 Y120.385 E.0163
G1 X124.37 Y120.591 E.01547
G1 X123.925 Y120.939 E.01737
G1 X123.616 Y121.335 E.01544
G1 X123.383 Y121.851 E.01738
G1 X123.296 Y122.41 E.01739
M204 S10000
; WIPE_START
G1 F24000
G1 X123.293 Y124.41 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z22.4 F30000
G1 Z22
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1260
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.10691
G3 X122.724 Y121.505 I6.402 J-.653 E.07584
G3 X122.975 Y120.975 I2.314 J.774 E.01951
G1 X120.948 Y118.948 E.0951
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
G1 X127.173 Y120.573 Z22.4 F30000
G1 X127.856 Y120.722 Z22.4
G1 Z22
G1 E.8 F1800
G1 F1260
G2 X126.575 Y119.749 I-2.376 J1.796 E.05404
G1 X127.376 Y118.948 E.03755
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.449 Y125.551 E.2863
G1 X128.449 Y126.052 E.01661
G1 X129.576 Y126.052 E.0374
; CHANGE_LAYER
; Z_HEIGHT: 22.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.449 Y126.052 E-.42844
G1 X128.449 Y125.551 E-.19032
G1 X128.712 Y125.288 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z22.4 I.54 J-1.091 P1  F30000
G1 X122.904 Y122.412 Z22.4
G1 Z22.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1262
G1 X122.896 Y122.466 E.00181
G1 X122.898 Y126.398 E.13043
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.408 I-202.428 J-1.817 E.13236
G1 X128.019 Y121.843 E.01893
G1 X127.811 Y121.297 E.01937
G1 X127.484 Y120.809 E.01949
G1 X127.052 Y120.404 E.01963
G1 X126.478 Y120.081 E.02184
G1 X125.901 Y119.922 E.01986
G1 X125.242 Y119.902 E.02188
G1 X124.676 Y120.025 E.01922
G1 X124.132 Y120.279 E.01993
G1 X123.619 Y120.694 E.02186
G1 X123.259 Y121.172 E.01985
G1 X122.998 Y121.777 E.02187
G1 X122.913 Y122.353 E.0193
G1 X123.288 Y122.469 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1262
G1 X123.29 Y126.79 E.13278
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.658 Y122.013 E.01479
G1 X127.499 Y121.546 E.01515
G1 X127.234 Y121.12 E.01544
G1 X126.851 Y120.741 E.01656
G1 X126.364 Y120.456 E.01735
G1 X125.88 Y120.313 E.0155
G1 X125.351 Y120.284 E.01628
G1 X124.832 Y120.384 E.01624
G1 X124.37 Y120.591 E.01553
G1 X123.925 Y120.939 E.01735
G1 X123.615 Y121.336 E.0155
G1 X123.383 Y121.851 E.01735
G1 X123.297 Y122.409 E.01735
M204 S10000
; WIPE_START
G1 F24000
M73 P86 R3
G1 X123.294 Y124.409 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z22.6 F30000
G1 Z22.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1262
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.975 Y120.975 E.0951
G2 X122.551 Y122.422 I2.591 J1.546 E.05055
G1 X122.551 Y123.773 E.04481
G1 X120.272 Y126.052 E.10691
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z22.6 F30000
G1 X129.576 Y126.052 Z22.6
G1 Z22.2
G1 E.8 F1800
G1 F1262
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.575 Y119.749 E.03756
G3 X127.856 Y120.722 I-1.093 J2.766 E.05403
; CHANGE_LAYER
; Z_HEIGHT: 22.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X127.237 Y120.112 E-.33031
G1 X126.575 Y119.749 E-.28685
G1 X126.841 Y119.483 E-.14284
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z22.6 I-.727 J-.976 P1  F30000
G1 X122.904 Y122.413 Z22.6
G1 Z22.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.896 Y122.467 E.00181
G1 X122.898 Y126.398 E.13039
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.409 I-207.33 J-1.82 E.13232
G1 X128.018 Y121.841 E.01904
G1 X127.811 Y121.297 E.01931
G1 X127.483 Y120.808 E.01955
G1 X127.053 Y120.405 E.01955
G1 X126.479 Y120.081 E.02183
G1 X125.9 Y119.922 E.01993
G1 X125.242 Y119.902 E.02184
G1 X124.678 Y120.024 E.01916
G1 X124.132 Y120.279 E.01999
G1 X123.62 Y120.693 E.02185
G1 X123.258 Y121.173 E.01991
G1 X122.998 Y121.777 E.02183
G1 X122.913 Y122.354 E.01933
G1 X123.288 Y122.467 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.29 Y126.79 E.13283
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.658 Y122.011 E.01484
G1 X127.499 Y121.546 E.01509
G1 X127.233 Y121.119 E.01549
G1 X126.851 Y120.741 E.01649
G1 X126.364 Y120.456 E.01733
G1 X125.879 Y120.313 E.01556
G1 X125.35 Y120.284 E.01626
G1 X124.833 Y120.384 E.01618
G1 X124.37 Y120.591 E.01558
G1 X123.926 Y120.938 E.01733
G1 X123.614 Y121.337 E.01555
G1 X123.383 Y121.852 E.01733
G1 X123.297 Y122.408 E.0173
M204 S10000
; WIPE_START
G1 F24000
G1 X123.294 Y124.408 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z22.8 F30000
G1 Z22.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1260
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.10691
G3 X122.723 Y121.507 I6.422 J-.652 E.07578
G3 X122.975 Y120.975 I2.314 J.772 E.01956
G1 X120.948 Y118.948 E.0951
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
G1 X127.173 Y120.574 Z22.8 F30000
G1 X127.856 Y120.722 Z22.8
G1 Z22.4
G1 E.8 F1800
G1 F1260
G2 X126.575 Y119.749 I-2.371 J1.789 E.05403
G1 X127.376 Y118.948 E.03756
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.449 Y125.551 E.2863
G1 X128.449 Y126.052 E.01661
G1 X129.576 Y126.052 E.0374
; CHANGE_LAYER
; Z_HEIGHT: 22.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.449 Y126.052 E-.42844
G1 X128.449 Y125.551 E-.19032
G1 X128.712 Y125.288 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z22.8 I.54 J-1.091 P1  F30000
G1 X122.904 Y122.414 Z22.8
G1 Z22.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1262
G1 X122.896 Y122.468 E.00181
G1 X122.898 Y126.398 E.13036
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.41 I-212.331 J-1.823 E.13227
G1 X128.018 Y121.839 E.01915
G1 X127.811 Y121.297 E.01924
G1 X127.482 Y120.806 E.01961
G1 X127.053 Y120.405 E.01947
G1 X126.48 Y120.082 E.02181
G1 X125.899 Y119.921 E.01999
G1 X125.242 Y119.902 E.02181
G1 X124.68 Y120.023 E.01909
G1 X124.132 Y120.279 E.02005
G1 X123.62 Y120.693 E.02183
G1 X123.258 Y121.174 E.01998
G1 X122.998 Y121.778 E.0218
G1 X122.913 Y122.355 E.01936
G1 X123.288 Y122.466 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1262
G1 X123.288 Y122.468 E.00006
G1 X123.29 Y126.79 E.1328
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.657 Y122.009 E.0149
G1 X127.499 Y121.546 E.01503
G1 X127.232 Y121.117 E.01554
G1 X126.852 Y120.741 E.01643
G1 X126.365 Y120.457 E.01731
M73 P87 R3
G1 X125.878 Y120.313 E.01561
G1 X125.35 Y120.284 E.01624
G1 X124.835 Y120.383 E.01612
G1 X124.37 Y120.59 E.01564
G1 X123.926 Y120.938 E.01732
G1 X123.614 Y121.338 E.01561
G1 X123.383 Y121.852 E.01731
G1 X123.297 Y122.407 E.01726
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.468 E-.02355
G1 X123.289 Y124.406 E-.73645
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z23 F30000
G1 Z22.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1262
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.975 Y120.975 E.0951
G2 X122.551 Y122.424 I2.588 J1.545 E.05062
G1 X122.551 Y123.773 E.04474
G1 X120.272 Y126.052 E.10691
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z23 F30000
G1 X129.576 Y126.052 Z23
G1 Z22.6
G1 E.8 F1800
G1 F1262
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.575 Y119.749 E.03757
G3 X127.855 Y120.722 I-1.087 J2.759 E.05403
; CHANGE_LAYER
; Z_HEIGHT: 22.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X127.238 Y120.113 E-.32971
G1 X126.575 Y119.749 E-.2874
G1 X126.841 Y119.483 E-.14289
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z23 I-.727 J-.976 P1  F30000
G1 X122.904 Y122.416 Z23
G1 Z22.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.896 Y122.469 E.0018
G1 X122.898 Y126.398 E.13032
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.412 I-217.547 J-1.826 E.13223
G1 X128.017 Y121.837 E.01926
G1 X127.811 Y121.297 E.01917
G1 X127.48 Y120.805 E.01967
G1 X127.054 Y120.405 E.01939
G1 X126.481 Y120.082 E.0218
G1 X125.899 Y119.921 E.02006
G1 X125.242 Y119.902 E.02177
G1 X124.682 Y120.023 E.01903
G1 X124.132 Y120.279 E.02012
G1 X123.621 Y120.693 E.02181
G1 X123.257 Y121.175 E.02004
G1 X122.998 Y121.778 E.02176
G1 X122.912 Y122.356 E.01939
G1 X123.289 Y122.465 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.288 Y122.469 E.00015
G1 X123.29 Y126.79 E.13276
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.657 Y122.008 E.01496
G1 X127.5 Y121.546 E.01497
G1 X127.231 Y121.116 E.0156
G1 X126.852 Y120.742 E.01636
G1 X126.366 Y120.457 E.01729
G1 X125.877 Y120.313 E.01567
G1 X125.35 Y120.284 E.01622
G1 X124.837 Y120.383 E.01605
G1 X124.37 Y120.59 E.0157
G1 X123.927 Y120.937 E.0173
G1 X123.613 Y121.339 E.01567
G1 X123.383 Y121.852 E.01728
G1 X123.298 Y122.405 E.0172
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.469 E-.0246
G1 X123.289 Y124.405 E-.7354
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z23.2 F30000
G1 Z22.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1260
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.10691
G3 X122.723 Y121.508 I6.443 J-.65 E.07574
G3 X122.975 Y120.975 I2.315 J.771 E.01961
G1 X120.948 Y118.948 E.0951
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
G1 X127.173 Y120.574 Z23.2 F30000
G1 X127.855 Y120.722 Z23.2
G1 Z22.8
G1 E.8 F1800
G1 F1260
G2 X126.575 Y119.749 I-2.365 J1.781 E.05403
G1 X127.376 Y118.948 E.03757
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.449 Y125.551 E.2863
G1 X128.449 Y126.052 E.01661
G1 X129.576 Y126.052 E.0374
; CHANGE_LAYER
; Z_HEIGHT: 23
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.449 Y126.052 E-.42844
G1 X128.449 Y125.551 E-.19032
G1 X128.712 Y125.288 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z23.2 I.539 J-1.091 P1  F30000
G1 X122.904 Y122.417 Z23.2
G1 Z23
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1262
G1 X122.896 Y122.47 E.0018
G1 X122.898 Y126.398 E.13028
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.413 I-223.285 J-1.829 E.13219
G1 X128.017 Y121.835 E.01938
G1 X127.811 Y121.297 E.0191
G1 X127.479 Y120.803 E.01973
G1 X127.054 Y120.406 E.01931
G1 X126.482 Y120.083 E.02178
G1 X125.898 Y119.921 E.02012
G1 X125.243 Y119.902 E.02174
G1 X124.684 Y120.022 E.01896
G1 X124.132 Y120.279 E.02018
G1 X123.621 Y120.692 E.0218
G1 X123.256 Y121.176 E.02011
G1 X122.998 Y121.778 E.02173
G1 X122.912 Y122.357 E.01942
G1 X123.289 Y122.463 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1262
G1 X123.288 Y122.47 E.00024
G1 X123.29 Y126.79 E.13273
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.657 Y122.006 E.01501
G1 X127.5 Y121.547 E.01491
G1 X127.23 Y121.115 E.01565
G1 X126.852 Y120.742 E.0163
G1 X126.367 Y120.457 E.01728
M73 P88 R3
G1 X125.876 Y120.313 E.01573
G1 X125.35 Y120.284 E.0162
G1 X124.839 Y120.382 E.01599
G1 X124.371 Y120.59 E.01575
G1 X123.927 Y120.937 E.01728
G1 X123.613 Y121.34 E.01572
G1 X123.383 Y121.853 E.01726
G1 X123.298 Y122.403 E.01712
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.47 E-.02575
G1 X123.289 Y124.403 E-.73425
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z23.4 F30000
G1 Z23
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1262
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.975 Y120.975 E.0951
G2 X122.551 Y122.426 I2.585 J1.544 E.0507
G1 X122.551 Y123.773 E.04467
G1 X120.272 Y126.052 E.10691
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z23.4 F30000
G1 X129.576 Y126.052 Z23.4
G1 Z23
G1 E.8 F1800
G1 F1262
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.575 Y119.749 E.03757
G3 X127.855 Y120.723 I-1.082 J2.751 E.05403
; CHANGE_LAYER
; Z_HEIGHT: 23.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.239 Y120.113 E-.32911
G1 X126.575 Y119.749 E-.28795
G1 X126.841 Y119.483 E-.14294
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z23.4 I-.727 J-.976 P1  F30000
G1 X122.904 Y122.418 Z23.4
G1 Z23.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.896 Y122.471 E.0018
G1 X122.898 Y126.398 E.13025
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.414 I-229.163 J-1.833 E.13215
G1 X128.016 Y121.833 E.01948
G1 X127.811 Y121.297 E.01903
G1 X127.478 Y120.802 E.01979
G1 X127.055 Y120.406 E.01924
G1 X126.483 Y120.083 E.02177
G1 X125.897 Y119.921 E.02019
G1 X125.243 Y119.902 E.0217
G1 X124.686 Y120.021 E.0189
G1 X124.132 Y120.279 E.02024
G1 X123.622 Y120.692 E.02178
G1 X123.256 Y121.177 E.02017
G1 X122.998 Y121.778 E.0217
G1 X122.912 Y122.359 E.01946
G1 X123.289 Y122.461 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.288 Y122.471 E.00034
G1 X123.29 Y126.79 E.1327
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.656 Y122.004 E.01507
G1 X127.5 Y121.547 E.01485
G1 X127.229 Y121.113 E.01571
G1 X126.853 Y120.742 E.01623
G1 X126.368 Y120.458 E.01726
G1 X125.876 Y120.312 E.01578
G1 X125.35 Y120.284 E.01617
G1 X124.841 Y120.381 E.01593
G1 X124.371 Y120.59 E.01581
G1 X123.928 Y120.936 E.01726
G1 X123.612 Y121.341 E.01578
G1 X123.383 Y121.853 E.01724
G1 X123.299 Y122.401 E.01705
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.471 E-.02699
G1 X123.289 Y124.4 E-.73301
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z23.6 F30000
G1 Z23.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1260
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.1069
G3 X122.722 Y121.51 I6.463 J-.649 E.07568
G3 X122.975 Y120.975 I2.315 J.77 E.01966
G1 X120.948 Y118.948 E.0951
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
G1 X127.173 Y120.574 Z23.6 F30000
G1 X127.855 Y120.723 Z23.6
G1 Z23.2
G1 E.8 F1800
G1 F1260
G2 X126.575 Y119.749 I-2.359 J1.774 E.05403
G1 X127.376 Y118.948 E.03758
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.449 Y125.551 E.2863
G1 X128.449 Y126.052 E.01661
G1 X129.576 Y126.052 E.0374
; CHANGE_LAYER
; Z_HEIGHT: 23.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X128.449 Y126.052 E-.42844
G1 X128.449 Y125.551 E-.19032
G1 X128.712 Y125.288 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z23.6 I.539 J-1.091 P1  F30000
G1 X122.904 Y122.419 Z23.6
G1 Z23.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1262
G1 X122.896 Y122.473 E.00179
G1 X122.898 Y126.398 E.13021
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.416 I-235.435 J-1.837 E.1321
G1 X128.016 Y121.831 E.01959
G1 X127.811 Y121.297 E.01897
G1 X127.477 Y120.801 E.01985
G1 X127.055 Y120.406 E.01915
G1 X126.484 Y120.083 E.02175
G1 X125.896 Y119.921 E.02025
G1 X125.243 Y119.902 E.02167
G1 X124.688 Y120.021 E.01884
G1 X124.132 Y120.279 E.02031
G1 X123.622 Y120.691 E.02176
G1 X123.255 Y121.178 E.02024
G1 X122.998 Y121.779 E.02166
G1 X122.912 Y122.36 E.01949
G1 X123.29 Y122.458 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1262
G1 X123.288 Y122.473 E.00045
G1 X123.29 Y126.79 E.13266
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.656 Y122.002 E.01513
G1 X127.5 Y121.547 E.01479
G1 X127.228 Y121.112 E.01576
G1 X126.853 Y120.742 E.01617
M73 P89 R2
G1 X126.369 Y120.458 E.01724
G1 X125.875 Y120.312 E.01584
G1 X125.35 Y120.284 E.01615
G1 X124.843 Y120.381 E.01586
G1 X124.371 Y120.59 E.01587
G1 X123.928 Y120.936 E.01724
G1 X123.611 Y121.342 E.01584
G1 X123.383 Y121.853 E.01721
G1 X123.299 Y122.399 E.01696
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.473 E-.02831
G1 X123.289 Y124.398 E-.73169
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z23.8 F30000
G1 Z23.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1262
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.975 Y120.975 E.09511
G2 X122.551 Y122.429 I2.583 J1.544 E.05077
G1 X122.551 Y123.773 E.04459
G1 X120.272 Y126.052 E.1069
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z23.8 F30000
G1 X129.576 Y126.052 Z23.8
G1 Z23.4
G1 E.8 F1800
G1 F1262
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.575 Y119.749 E.03758
G3 X127.855 Y120.723 I-1.076 J2.744 E.05403
; CHANGE_LAYER
; Z_HEIGHT: 23.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.241 Y120.114 E-.32851
G1 X126.575 Y119.749 E-.2885
G1 X126.841 Y119.483 E-.14298
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z23.8 I-.728 J-.975 P1  F30000
G1 X122.904 Y122.42 Z23.8
G1 Z23.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.896 Y122.474 E.00179
G1 X122.898 Y126.398 E.13017
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.417 I-242.148 J-1.84 E.13206
G1 X128.016 Y121.829 E.01971
G1 X127.811 Y121.297 E.0189
G1 X127.476 Y120.799 E.01991
G1 X127.055 Y120.407 E.01908
G1 X126.485 Y120.084 E.02174
G1 X125.895 Y119.921 E.02032
G1 X125.243 Y119.902 E.02163
G1 X124.69 Y120.02 E.01877
G1 X124.133 Y120.279 E.02037
G1 X123.623 Y120.691 E.02175
G1 X123.254 Y121.179 E.0203
G1 X122.998 Y121.779 E.02163
G1 X122.912 Y122.361 E.01952
G1 X123.291 Y122.456 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.288 Y122.474 E.00056
G1 X123.29 Y126.79 E.13263
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.655 Y122 E.01519
G1 X127.5 Y121.547 E.01473
G1 X127.227 Y121.111 E.01581
G1 X126.853 Y120.743 E.0161
G1 X126.37 Y120.459 E.01722
G1 X125.874 Y120.312 E.0159
G1 X125.35 Y120.284 E.01613
G1 X124.845 Y120.38 E.0158
G1 X124.371 Y120.59 E.01592
G1 X123.929 Y120.935 E.01722
G1 X123.611 Y121.343 E.01589
G1 X123.382 Y121.854 E.01719
G1 X123.3 Y122.396 E.01687
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.474 E-.02971
G1 X123.289 Y124.396 E-.73029
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z24 F30000
G1 Z23.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1260
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.1069
G3 X122.722 Y121.511 I6.484 J-.648 E.07564
G3 X122.975 Y120.975 I2.315 J.769 E.01971
G1 X120.948 Y118.948 E.09511
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
G1 X127.173 Y120.574 Z24 F30000
G1 X127.855 Y120.723 Z24
G1 Z23.6
G1 E.8 F1800
G1 F1260
G2 X126.575 Y119.749 I-2.354 J1.767 E.05402
G1 X127.376 Y118.948 E.03759
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.449 Y125.551 E.2863
G1 X128.449 Y126.052 E.01661
G1 X129.576 Y126.052 E.0374
; CHANGE_LAYER
; Z_HEIGHT: 23.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X128.449 Y126.052 E-.42844
G1 X128.449 Y125.551 E-.19032
G1 X128.712 Y125.288 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z24 I.539 J-1.091 P1  F30000
G1 X122.903 Y122.422 Z24
G1 Z23.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1262
G1 X122.896 Y122.475 E.00179
G1 X122.898 Y126.398 E.13014
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.418 I-249.245 J-1.845 E.13202
G1 X128.015 Y121.827 E.01982
G1 X127.811 Y121.297 E.01883
G1 X127.475 Y120.798 E.01997
G1 X127.056 Y120.407 E.019
G1 X126.486 Y120.084 E.02172
G1 X125.894 Y119.92 E.02038
G1 X125.243 Y119.902 E.0216
G1 X124.692 Y120.019 E.01871
G1 X124.133 Y120.279 E.02043
G1 X123.623 Y120.69 E.02173
G1 X123.254 Y121.181 E.02037
G1 X122.997 Y121.779 E.02159
G1 X122.912 Y122.362 E.01955
G1 X123.291 Y122.453 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1262
G1 X123.288 Y122.475 E.00068
G1 X123.29 Y126.79 E.13259
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.655 Y121.998 E.01524
G1 X127.5 Y121.547 E.01467
G1 X127.226 Y121.109 E.01587
M73 P90 R2
G1 X126.854 Y120.743 E.01604
G1 X126.371 Y120.459 E.0172
G1 X125.873 Y120.312 E.01595
G1 X125.35 Y120.284 E.01611
G1 X124.846 Y120.38 E.01574
G1 X124.371 Y120.59 E.01598
G1 X123.93 Y120.935 E.01721
G1 X123.61 Y121.344 E.01595
G1 X123.382 Y121.854 E.01717
G1 X123.3 Y122.394 E.01678
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.475 E-.03117
G1 X123.289 Y124.393 E-.72883
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z24.2 F30000
G1 Z23.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1262
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.975 Y120.975 E.09511
G2 X122.551 Y122.431 I2.58 J1.543 E.05085
G1 X122.551 Y123.773 E.04452
G1 X120.272 Y126.052 E.1069
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z24.2 F30000
G1 X129.576 Y126.052 Z24.2
G1 Z23.8
G1 E.8 F1800
G1 F1262
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.575 Y119.749 E.03759
G3 X127.854 Y120.723 I-1.071 J2.737 E.05402
; CHANGE_LAYER
; Z_HEIGHT: 24
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.242 Y120.115 E-.32791
G1 X126.575 Y119.749 E-.28906
G1 X126.841 Y119.483 E-.14303
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z24.2 I-.728 J-.975 P1  F30000
G1 X122.903 Y122.423 Z24.2
G1 Z24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.896 Y122.476 E.00178
G1 X122.898 Y126.398 E.1301
G1 X119.102 Y126.398 E.1259
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.419 I-256.814 J-1.849 E.13198
G1 X128.015 Y121.825 E.01993
G1 X127.811 Y121.297 E.01876
G1 X127.474 Y120.796 E.02003
G1 X127.056 Y120.407 E.01892
G1 X126.487 Y120.085 E.02171
G1 X125.893 Y119.92 E.02044
G1 X125.243 Y119.902 E.02156
G1 X124.694 Y120.019 E.01865
G1 X124.133 Y120.279 E.0205
G1 X123.624 Y120.69 E.02172
G1 X123.253 Y121.182 E.02043
G1 X122.997 Y121.779 E.02156
G1 X122.912 Y122.363 E.01958
G1 X123.292 Y122.45 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.288 Y122.476 E.0008
G1 X123.29 Y126.79 E.13256
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.655 Y121.997 E.0153
G1 X127.5 Y121.547 E.01461
G1 X127.225 Y121.108 E.01592
G1 X126.854 Y120.743 E.01598
G1 X126.372 Y120.459 E.01719
G1 X125.872 Y120.312 E.01601
G1 X125.35 Y120.284 E.01609
G1 X124.848 Y120.379 E.01568
G1 X124.371 Y120.59 E.01603
G1 X123.93 Y120.934 E.01719
G1 X123.61 Y121.345 E.01601
G1 X123.382 Y121.854 E.01714
G1 X123.301 Y122.391 E.01668
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.476 E-.0327
G1 X123.289 Y124.39 E-.7273
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z24.4 F30000
G1 Z24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1260
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.1069
G3 X122.721 Y121.512 I6.505 J-.647 E.07558
G3 X122.975 Y120.975 I2.315 J.768 E.01976
G1 X120.948 Y118.948 E.09511
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
G1 X127.173 Y120.574 Z24.4 F30000
G1 X127.854 Y120.723 Z24.4
G1 Z24
G1 E.8 F1800
G1 F1260
G2 X126.575 Y119.749 I-2.348 J1.76 E.05402
G1 X127.376 Y118.948 E.03759
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.449 Y125.551 E.2863
G1 X128.449 Y126.052 E.01661
G1 X129.576 Y126.052 E.0374
; CHANGE_LAYER
; Z_HEIGHT: 24.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.449 Y126.052 E-.42844
G1 X128.449 Y125.551 E-.19032
G1 X128.712 Y125.288 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z24.4 I.538 J-1.091 P1  F30000
G1 X122.903 Y122.424 Z24.4
G1 Z24.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1262
G1 X122.896 Y122.477 E.00178
G1 X122.898 Y126.398 E.13006
G1 X119.102 Y126.398 E.1259
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.421 I-264.961 J-1.854 E.13194
G1 X128.014 Y121.823 E.02003
G1 X127.811 Y121.297 E.01869
G1 X127.473 Y120.795 E.02009
G1 X127.057 Y120.408 E.01884
G1 X126.488 Y120.085 E.02169
G1 X125.892 Y119.92 E.02051
G1 X125.244 Y119.902 E.02153
G1 X124.696 Y120.018 E.01858
G1 X124.133 Y120.278 E.02056
G1 X123.624 Y120.689 E.0217
G1 X123.252 Y121.183 E.0205
G1 X122.997 Y121.779 E.02152
G1 X122.912 Y122.365 E.01962
G1 X123.292 Y122.447 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1262
G1 X123.288 Y122.477 E.00093
G1 X123.29 Y126.79 E.13253
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
M73 P91 R2
G1 X127.654 Y121.995 E.01536
G1 X127.5 Y121.547 E.01455
G1 X127.224 Y121.107 E.01597
G1 X126.854 Y120.744 E.01591
G1 X126.373 Y120.46 E.01717
G1 X125.872 Y120.312 E.01607
G1 X125.349 Y120.284 E.01607
G1 X124.85 Y120.378 E.01561
G1 X124.371 Y120.59 E.01609
G1 X123.931 Y120.934 E.01717
G1 X123.609 Y121.346 E.01606
G1 X123.382 Y121.855 E.01712
G1 X123.301 Y122.388 E.01657
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.477 E-.03428
G1 X123.289 Y124.387 E-.72572
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z24.6 F30000
G1 Z24.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1262
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.975 Y120.975 E.09511
G2 X122.551 Y122.433 I2.578 J1.542 E.05092
G1 X122.551 Y123.773 E.04445
G1 X120.272 Y126.052 E.1069
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z24.6 F30000
G1 X129.576 Y126.052 Z24.6
G1 Z24.2
G1 E.8 F1800
G1 F1262
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.574 Y119.75 E.0376
G3 X127.854 Y120.723 I-1.066 J2.73 E.05402
; CHANGE_LAYER
; Z_HEIGHT: 24.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X127.243 Y120.116 E-.32733
G1 X126.574 Y119.75 E-.2896
G1 X126.841 Y119.483 E-.14307
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z24.6 I-.728 J-.975 P1  F30000
G1 X122.903 Y122.425 Z24.6
G1 Z24.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.896 Y122.478 E.00178
G1 X122.898 Y126.398 E.13003
G1 X119.102 Y126.398 E.1259
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.101 Y122.422 I-271.924 J-1.858 E.13191
G1 X128.014 Y121.821 E.02014
G1 X127.811 Y121.297 E.01862
G1 X127.471 Y120.794 E.02016
G1 X127.057 Y120.408 E.01876
G1 X126.489 Y120.085 E.02168
G1 X125.891 Y119.92 E.02057
G1 X125.244 Y119.902 E.02149
G1 X124.698 Y120.017 E.01852
G1 X124.133 Y120.278 E.02062
G1 X123.624 Y120.689 E.02168
G1 X123.252 Y121.184 E.02056
G1 X122.997 Y121.78 E.02149
G1 X122.912 Y122.366 E.01965
G1 X123.293 Y122.444 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.288 Y122.478 E.00106
G1 X123.29 Y126.79 E.13249
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.654 Y121.993 E.01541
G1 X127.5 Y121.547 E.01449
G1 X127.223 Y121.105 E.01603
G1 X126.855 Y120.744 E.01584
G1 X126.374 Y120.46 E.01715
G1 X125.871 Y120.312 E.01612
G1 X125.349 Y120.284 E.01605
G1 X124.852 Y120.378 E.01555
G1 X124.371 Y120.59 E.01615
G1 X123.931 Y120.933 E.01715
G1 X123.608 Y121.347 E.01612
G1 X123.382 Y121.855 E.01709
G1 X123.302 Y122.385 E.01646
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.478 E-.0359
G1 X123.289 Y124.384 E-.7241
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z24.8 F30000
G1 Z24.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1260
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.1069
G3 X122.721 Y121.514 I6.527 J-.646 E.07553
G3 X122.975 Y120.975 I2.315 J.766 E.01981
G1 X120.948 Y118.948 E.09511
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
G1 X127.173 Y120.574 Z24.8 F30000
G1 X127.854 Y120.723 Z24.8
G1 Z24.4
G1 E.8 F1800
G1 F1260
G2 X126.574 Y119.75 I-2.343 J1.753 E.05402
G1 X127.376 Y118.948 E.0376
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.449 Y125.551 E.2863
G1 X128.449 Y126.052 E.01661
G1 X129.576 Y126.052 E.0374
; CHANGE_LAYER
; Z_HEIGHT: 24.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.449 Y126.052 E-.42844
G1 X128.449 Y125.551 E-.19032
G1 X128.712 Y125.288 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z24.8 I.538 J-1.092 P1  F30000
G1 X122.903 Y122.426 Z24.8
G1 Z24.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1262
G1 X122.896 Y122.479 E.00177
G1 X122.898 Y126.398 E.12999
G1 X119.102 Y126.398 E.1259
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.421 I-270.427 J-1.857 E.13191
G1 X128.013 Y121.819 E.0202
G1 X127.811 Y121.297 E.01855
G1 X127.47 Y120.792 E.02022
G1 X127.058 Y120.408 E.01868
G1 X126.49 Y120.086 E.02166
G1 X125.891 Y119.92 E.02064
G1 X125.244 Y119.902 E.02146
G1 X124.7 Y120.017 E.01846
G1 X124.133 Y120.278 E.02068
G1 X123.625 Y120.688 E.02167
G1 X123.251 Y121.185 E.02063
G1 X122.997 Y121.78 E.02145
M73 P92 R2
G1 X122.912 Y122.367 E.01968
G1 X123.293 Y122.441 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1262
G1 X123.288 Y122.479 E.00119
G1 X123.29 Y126.79 E.13246
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.653 Y121.991 E.01547
G1 X127.5 Y121.547 E.01443
G1 X127.222 Y121.104 E.01609
G1 X126.855 Y120.744 E.01578
G1 X126.375 Y120.461 E.01713
G1 X125.87 Y120.311 E.01618
G1 X125.349 Y120.284 E.01603
G1 X124.854 Y120.377 E.01549
G1 X124.371 Y120.59 E.0162
G1 X123.932 Y120.933 E.01713
G1 X123.608 Y121.348 E.01618
G1 X123.382 Y121.855 E.01707
G1 X123.302 Y122.381 E.01635
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.479 E-.03756
G1 X123.289 Y124.38 E-.72244
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z25 F30000
G1 Z24.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1262
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.975 Y120.975 E.09511
G2 X122.551 Y122.435 I2.575 J1.541 E.051
G1 X122.551 Y123.773 E.04438
G1 X120.272 Y126.052 E.1069
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z25 F30000
G1 X129.576 Y126.052 Z25
G1 Z24.6
G1 E.8 F1800
G1 F1262
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.574 Y119.75 E.03761
G3 X127.854 Y120.723 I-1.06 J2.722 E.05402
; CHANGE_LAYER
; Z_HEIGHT: 24.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X127.244 Y120.117 E-.32672
G1 X126.574 Y119.75 E-.29016
G1 X126.841 Y119.483 E-.14312
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z25 I-.729 J-.975 P1  F30000
G1 X122.903 Y122.428 Z25
G1 Z24.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.896 Y122.48 E.00177
G1 X122.898 Y126.398 E.12995
G1 X119.102 Y126.398 E.1259
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.421 I-268.948 J-1.856 E.13192
G1 X128.013 Y121.817 E.02026
G1 X127.811 Y121.297 E.01848
G1 X127.469 Y120.791 E.02028
G1 X127.058 Y120.409 E.0186
G1 X126.491 Y120.086 E.02165
G1 X125.89 Y119.92 E.0207
G1 X125.244 Y119.902 E.02142
G1 X124.702 Y120.016 E.0184
G1 X124.134 Y120.278 E.02075
G1 X123.625 Y120.688 E.02165
G1 X123.25 Y121.186 E.02069
G1 X122.997 Y121.78 E.02142
G1 X122.912 Y122.368 E.01971
G1 X123.294 Y122.437 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.288 Y122.48 E.00133
G1 X123.29 Y126.79 E.13242
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.653 Y121.989 E.01552
G1 X127.5 Y121.547 E.01437
G1 X127.22 Y121.103 E.01614
G1 X126.856 Y120.744 E.01572
G1 X126.376 Y120.461 E.01712
G1 X125.869 Y120.311 E.01624
G1 X125.349 Y120.284 E.016
G1 X124.856 Y120.377 E.01543
G1 X124.371 Y120.59 E.01626
G1 X123.932 Y120.932 E.01711
G1 X123.607 Y121.349 E.01623
G1 X123.382 Y121.856 E.01705
G1 X123.303 Y122.378 E.01624
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.48 E-.03926
G1 X123.289 Y124.377 E-.72074
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z25.2 F30000
G1 Z24.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1260
G1 X119.448 Y125.124 E.05401
M73 P92 R1
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.1069
G3 X122.72 Y121.515 I6.548 J-.645 E.07548
G3 X122.975 Y120.975 I2.316 J.765 E.01986
G1 X120.948 Y118.948 E.09511
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
G1 X127.173 Y120.574 Z25.2 F30000
G1 X127.854 Y120.723 Z25.2
G1 Z24.8
G1 E.8 F1800
G1 F1260
G2 X126.574 Y119.75 I-2.337 J1.746 E.05402
G1 X127.376 Y118.948 E.03761
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.449 Y125.551 E.2863
G1 X128.449 Y126.052 E.01661
G1 X129.576 Y126.052 E.0374
; CHANGE_LAYER
; Z_HEIGHT: 25
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.449 Y126.052 E-.42844
G1 X128.449 Y125.551 E-.19032
G1 X128.712 Y125.288 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z25.2 I.538 J-1.092 P1  F30000
G1 X122.903 Y122.429 Z25.2
G1 Z25
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1262
G1 X122.896 Y122.481 E.00177
G1 X122.898 Y126.398 E.12992
G1 X119.102 Y126.398 E.1259
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.421 I-267.483 J-1.855 E.13193
G1 X128.012 Y121.815 E.02032
G1 X127.811 Y121.297 E.01841
G1 X127.468 Y120.789 E.02034
G1 X127.059 Y120.409 E.01852
G1 X126.492 Y120.087 E.02163
G1 X125.889 Y119.92 E.02077
G1 X125.244 Y119.902 E.02138
G1 X124.704 Y120.015 E.01833
M73 P93 R1
G1 X124.134 Y120.278 E.02081
G1 X123.626 Y120.687 E.02164
G1 X123.25 Y121.187 E.02076
G1 X122.997 Y121.78 E.02138
G1 X122.912 Y122.369 E.01975
G1 X123.295 Y122.434 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1262
G1 X123.288 Y122.481 E.00147
G1 X123.29 Y126.79 E.13239
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.653 Y121.988 E.01558
G1 X127.5 Y121.547 E.01431
G1 X127.22 Y121.102 E.01619
G1 X126.856 Y120.745 E.01565
G1 X126.377 Y120.461 E.0171
G1 X125.868 Y120.311 E.01629
G1 X125.359 Y120.285 E.01568
G1 X124.858 Y120.376 E.01566
G1 X124.372 Y120.59 E.01631
G1 X123.933 Y120.932 E.0171
G1 X123.607 Y121.35 E.01629
G1 X123.382 Y121.856 E.01702
G1 X123.304 Y122.375 E.01612
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.481 E-.04097
G1 X123.289 Y124.374 E-.71903
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z25.4 F30000
G1 Z25
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1262
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.975 Y120.975 E.09511
G2 X122.55 Y122.438 I2.573 J1.541 E.05107
G1 X122.551 Y123.773 E.0443
G1 X120.272 Y126.052 E.1069
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z25.4 F30000
G1 X129.576 Y126.052 Z25.4
G1 Z25
G1 E.8 F1800
G1 F1262
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.574 Y119.75 E.03761
G3 X127.853 Y120.723 I-1.055 J2.715 E.05402
; CHANGE_LAYER
; Z_HEIGHT: 25.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.245 Y120.117 E-.32612
G1 X126.574 Y119.75 E-.29072
G1 X126.841 Y119.484 E-.14316
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z25.4 I-.729 J-.974 P1  F30000
G1 X122.903 Y122.43 Z25.4
G1 Z25.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.896 Y122.483 E.00176
G1 X122.898 Y126.398 E.12988
G1 X119.102 Y126.398 E.1259
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.421 I-266.086 J-1.854 E.13193
G1 X128.012 Y121.813 E.02038
G1 X127.811 Y121.297 E.01834
G1 X127.467 Y120.788 E.0204
G1 X127.059 Y120.41 E.01844
G1 X126.493 Y120.087 E.02162
G1 X125.888 Y119.919 E.02083
G1 X125.245 Y119.902 E.02135
G1 X124.706 Y120.015 E.01827
G1 X124.134 Y120.278 E.02087
G1 X123.626 Y120.687 E.02162
G1 X123.249 Y121.188 E.02082
G1 X122.997 Y121.78 E.02135
G1 X122.912 Y122.371 E.01978
G1 X123.295 Y122.431 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.288 Y122.483 E.00161
G1 X123.29 Y126.79 E.13236
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.652 Y121.986 E.01564
G1 X127.5 Y121.548 E.01425
G1 X127.218 Y121.1 E.01625
G1 X126.856 Y120.745 E.01559
G1 X126.378 Y120.462 E.01708
G1 X125.868 Y120.311 E.01635
G1 X125.359 Y120.285 E.01566
G1 X124.859 Y120.375 E.01559
G1 X124.372 Y120.59 E.01637
G1 X123.933 Y120.931 E.01708
G1 X123.606 Y121.351 E.01635
G1 X123.381 Y121.856 E.017
G1 X123.304 Y122.371 E.016
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.483 E-.04271
G1 X123.289 Y124.37 E-.71729
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z25.6 F30000
G1 Z25.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1260
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.1069
G3 X122.72 Y121.517 I6.57 J-.643 E.07543
G3 X122.975 Y120.975 I2.316 J.764 E.01991
G1 X120.948 Y118.948 E.09511
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
G1 X127.173 Y120.574 Z25.6 F30000
G1 X127.853 Y120.723 Z25.6
G1 Z25.2
G1 E.8 F1800
G1 F1260
G2 X126.574 Y119.75 I-2.332 J1.739 E.05401
G1 X127.376 Y118.948 E.03762
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.449 Y125.551 E.2863
G1 X128.449 Y126.052 E.01661
G1 X129.576 Y126.052 E.0374
; CHANGE_LAYER
; Z_HEIGHT: 25.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X128.449 Y126.052 E-.42844
G1 X128.449 Y125.551 E-.19032
G1 X128.712 Y125.288 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z25.6 I.537 J-1.092 P1  F30000
G1 X122.903 Y122.431 Z25.6
G1 Z25.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1262
G1 X122.896 Y122.484 E.00176
G1 X122.898 Y126.398 E.12984
G1 X119.102 Y126.398 E.1259
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.421 I-264.662 J-1.854 E.13194
G1 X128.011 Y121.811 E.02045
G1 X127.811 Y121.297 E.01827
G1 X127.466 Y120.787 E.02046
G1 X127.06 Y120.41 E.01836
G1 X126.494 Y120.088 E.0216
M73 P94 R1
G1 X125.887 Y119.919 E.0209
G1 X125.245 Y119.902 E.02131
G1 X124.708 Y120.014 E.01821
G1 X124.134 Y120.278 E.02094
G1 X123.627 Y120.686 E.0216
G1 X123.248 Y121.189 E.02089
G1 X122.997 Y121.781 E.02131
G1 X122.912 Y122.372 E.01981
G1 X123.296 Y122.427 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1262
G1 X123.288 Y122.484 E.00175
G1 X123.29 Y126.79 E.13232
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.652 Y121.984 E.0157
G1 X127.5 Y121.548 E.01419
G1 X127.217 Y121.099 E.0163
G1 X126.857 Y120.745 E.01552
G1 X126.379 Y120.462 E.01706
G1 X125.867 Y120.311 E.01641
G1 X125.358 Y120.285 E.01564
G1 X124.861 Y120.375 E.01553
G1 X124.372 Y120.59 E.01643
G1 X123.934 Y120.931 E.01706
G1 X123.605 Y121.352 E.0164
G1 X123.381 Y121.857 E.01698
G1 X123.305 Y122.368 E.01589
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.484 E-.04445
G1 X123.289 Y124.367 E-.71555
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z25.8 F30000
G1 Z25.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1262
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.975 Y120.975 E.09511
G2 X122.55 Y122.44 I2.571 J1.54 E.05114
G1 X122.551 Y123.773 E.04423
G1 X120.272 Y126.052 E.1069
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y125.9 Z25.8 F30000
G1 X129.576 Y126.052 Z25.8
G1 Z25.4
G1 E.8 F1800
G1 F1262
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.574 Y119.75 E.03762
G3 X127.853 Y120.723 I-1.05 J2.708 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 25.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.246 Y120.118 E-.32552
G1 X126.574 Y119.75 E-.29128
G1 X126.84 Y119.484 E-.14321
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z25.8 I-.729 J-.974 P1  F30000
G1 X122.903 Y122.432 Z25.8
G1 Z25.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.895 Y122.485 E.00176
G1 X122.898 Y126.398 E.12981
G1 X119.102 Y126.398 E.1259
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.42 I-263.305 J-1.853 E.13195
G1 X128.011 Y121.809 E.02051
G1 X127.811 Y121.297 E.0182
G1 X127.464 Y120.785 E.02052
G1 X127.06 Y120.41 E.01828
G1 X126.495 Y120.088 E.02158
G1 X125.886 Y119.919 E.02096
G1 X125.245 Y119.902 E.02128
G1 X124.71 Y120.013 E.01815
G1 X124.134 Y120.278 E.021
G1 X123.627 Y120.686 E.02159
G1 X123.248 Y121.191 E.02095
G1 X122.997 Y121.781 E.02128
G1 X122.912 Y122.373 E.01984
G1 X123.297 Y122.424 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.288 Y122.485 E.00189
G1 X123.29 Y126.79 E.13229
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.652 Y121.982 E.01575
G1 X127.5 Y121.548 E.01413
G1 X127.216 Y121.098 E.01635
G1 X126.857 Y120.745 E.01546
G1 X126.38 Y120.463 E.01704
G1 X125.866 Y120.311 E.01646
G1 X125.358 Y120.285 E.01562
G1 X124.863 Y120.374 E.01546
G1 X124.372 Y120.59 E.01649
G1 X123.934 Y120.93 E.01704
G1 X123.605 Y121.353 E.01646
G1 X123.381 Y121.857 E.01695
G1 X123.306 Y122.365 E.01577
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.485 E-.04619
G1 X123.289 Y124.363 E-.71381
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z26 F30000
G1 Z25.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1260
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.1069
G3 X122.719 Y121.518 I6.591 J-.642 E.07538
G3 X122.975 Y120.975 I2.316 J.762 E.01996
G1 X120.948 Y118.948 E.09511
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
G1 X127.173 Y120.574 Z26 F30000
G1 X127.853 Y120.723 Z26
G1 Z25.6
G1 E.8 F1800
G1 F1260
G2 X126.574 Y119.75 I-2.326 J1.732 E.05401
G1 X127.376 Y118.948 E.03763
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.449 Y125.551 E.2863
G1 X128.449 Y126.052 E.01661
G1 X129.576 Y126.052 E.0374
; CHANGE_LAYER
; Z_HEIGHT: 25.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X128.449 Y126.052 E-.42844
G1 X128.449 Y125.551 E-.19032
G1 X128.712 Y125.288 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z26 I.537 J-1.092 P1  F30000
G1 X122.903 Y122.433 Z26
G1 Z25.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1589
G1 X122.895 Y122.486 E.00175
G1 X122.898 Y126.398 E.12977
M73 P95 R1
G1 X119.102 Y126.398 E.1259
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.42 I-261.962 J-1.852 E.13195
G1 X128.01 Y121.807 E.02057
G1 X127.811 Y121.297 E.01813
G1 X127.463 Y120.784 E.02058
G1 X127.061 Y120.411 E.0182
G1 X126.496 Y120.088 E.02157
G1 X125.885 Y119.919 E.02102
G1 X125.245 Y119.902 E.02124
G1 X124.712 Y120.013 E.01808
G1 X124.134 Y120.278 E.02106
G1 X123.628 Y120.685 E.02157
G1 X123.247 Y121.192 E.02102
G1 X122.997 Y121.781 E.02124
G1 X122.911 Y122.374 E.01988
G1 X123.297 Y122.42 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1589
G1 X123.288 Y122.486 E.00203
G1 X123.29 Y126.79 E.13225
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.651 Y121.98 E.01581
G1 X127.5 Y121.548 E.01407
G1 X127.215 Y121.096 E.01641
G1 X126.857 Y120.746 E.0154
G1 X126.381 Y120.463 E.01703
G1 X125.865 Y120.311 E.01652
G1 X125.358 Y120.285 E.0156
G1 X124.865 Y120.374 E.0154
G1 X124.372 Y120.59 E.01654
G1 X123.935 Y120.93 E.01702
G1 X123.604 Y121.354 E.01652
G1 X123.381 Y121.857 E.01693
G1 X123.306 Y122.361 E.01565
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.486 E-.04793
G1 X123.289 Y124.36 E-.71207
; WIPE_END
G1 E-.04 F1800
G1 X121.578 Y118.948 Z26.2 F30000
G1 Z25.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1589
G1 X124.569 Y118.948 E.09924
G1 X123.364 Y120.461 E.06416
G2 X122.55 Y122.446 I2.237 J2.077 E.0727
G1 X122.551 Y126.052 E.11963
G1 X119.448 Y126.052 E.10294
G1 X119.448 Y118.948 E.23565
G1 X121.518 Y118.948 E.06865
G1 X119.855 Y119.484 F30000
G1 F1589
G1 X119.855 Y119.355 E.00426
G1 X121.355 Y119.355 E.04976
G1 X122.679 Y120.679 E.06212
G1 X122.593 Y120.82 E.00548
G2 X122.143 Y122.428 I3.654 J1.889 E.05577
G1 X122.144 Y124.18 E.05812
G1 X120.679 Y125.645 E.0687
G1 X119.855 Y125.645 E.02733
G1 X119.855 Y124.841 E.02668
; WIPE_START
G1 F24000
G1 X119.855 Y125.645 E-.30563
G1 X120.679 Y125.645 E-.31313
G1 X120.942 Y125.382 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X128.571 Y125.604 Z26.2 F30000
G1 X129.983 Y125.645 Z26.2
G1 Z25.8
G1 E.8 F1800
G1 F1589
G1 X128.856 Y125.645 E.03739
G1 X128.856 Y125.144 E.01662
G1 X134.145 Y119.855 E.2481
G1 X134.145 Y124.469 E.15304
G1 X129.031 Y119.355 E.23989
G1 X127.403 Y119.355 E.05401
G1 X134.552 Y126.052 F30000
G1 F1589
G1 X128.449 Y126.052 E.20246
G1 X128.451 Y122.483 E.11838
G2 X127.718 Y120.551 I-3.185 J.102 E.06981
G1 X126.409 Y118.948 E.06865
G1 X134.552 Y118.948 E.27012
G1 X134.552 Y125.992 E.23366
; CHANGE_LAYER
; Z_HEIGHT: 26
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X134.552 Y123.992 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z26.2 I.161 J-1.206 P1  F30000
G1 X122.903 Y122.435 Z26.2
G1 Z26
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1593
G1 X122.895 Y122.487 E.00175
G1 X122.898 Y126.398 E.12973
G1 X119.102 Y126.398 E.1259
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.42 I-260.578 J-1.851 E.13196
G1 X128.01 Y121.805 E.02063
G1 X127.811 Y121.297 E.01806
G1 X127.462 Y120.782 E.02064
G1 X127.061 Y120.411 E.01812
G1 X126.497 Y120.089 E.02155
G1 X125.884 Y119.919 E.02109
G1 X125.245 Y119.902 E.0212
G1 X124.714 Y120.012 E.01802
G1 X124.135 Y120.277 E.02113
G1 X123.628 Y120.685 E.02155
G1 X123.246 Y121.193 E.02108
G1 X122.996 Y121.781 E.02121
G1 X122.911 Y122.375 E.01991
G1 X123.298 Y122.417 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1593
G1 X123.288 Y122.487 E.00217
G1 X123.29 Y126.79 E.13222
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.651 Y121.978 E.01587
G1 X127.5 Y121.548 E.01401
G1 X127.214 Y121.095 E.01646
G1 X126.858 Y120.746 E.01533
G1 X126.382 Y120.464 E.01701
G1 X125.864 Y120.31 E.01658
G1 X125.358 Y120.285 E.01558
G1 X124.867 Y120.373 E.01534
G1 X124.372 Y120.589 E.0166
G1 X123.935 Y120.929 E.017
G1 X123.603 Y121.354 E.01657
G1 X123.381 Y121.858 E.0169
G1 X123.307 Y122.358 E.01553
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.487 E-.04965
G1 X123.289 Y124.356 E-.71035
; WIPE_END
G1 E-.04 F1800
G1 X122.132 Y118.948 Z26.4 F30000
G1 Z26
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1593
G1 X124.569 Y118.948 E.08086
G1 X123.364 Y120.461 E.06417
G2 X122.55 Y122.454 I2.324 J2.112 E.07287
G1 X122.551 Y126.052 E.11936
G1 X119.448 Y126.052 E.10294
G1 X119.448 Y118.948 E.23565
G1 X122.072 Y118.948 E.08703
G1 X127.403 Y119.355 F30000
G1 F1593
G1 X129.031 Y119.355 E.05401
G1 X134.145 Y124.469 E.23989
G1 X134.145 Y119.855 E.15304
G1 X128.856 Y125.144 E.2481
G1 X128.856 Y125.645 E.01662
G1 X129.983 Y125.645 E.03739
G1 X134.552 Y126.052 F30000
G1 F1593
G1 X128.449 Y126.052 E.20246
G1 X128.451 Y122.483 E.11838
G2 X127.717 Y120.549 I-3.185 J.102 E.06987
G1 X126.409 Y118.948 E.06859
G1 X134.552 Y118.948 E.27012
G1 X134.552 Y125.992 E.23366
; WIPE_START
G1 F24000
G1 X134.552 Y123.992 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.932 Y124.432 Z26.4 F30000
G1 X119.855 Y124.841 Z26.4
G1 Z26
G1 E.8 F1800
G1 F1593
G1 X119.855 Y125.645 E.02668
G1 X120.679 Y125.645 E.02733
G1 X122.144 Y124.18 E.06871
G1 X122.143 Y122.454 E.05727
G3 X122.327 Y121.407 I3.426 J.062 E.03538
G1 X122.327 Y121.407 E0
G3 X122.679 Y120.679 I5.953 J2.432 E.02685
G1 X121.355 Y119.355 E.06212
G1 X119.855 Y119.355 E.04976
G1 X119.855 Y119.484 E.00426
; CHANGE_LAYER
; Z_HEIGHT: 26.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.855 Y119.355 E-.04876
G1 X121.355 Y119.355 E-.57
G1 X121.618 Y119.618 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z26.4 I-1.107 J.505 P1  F30000
G1 X122.903 Y122.436 Z26.4
G1 Z26.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1587
G1 X122.895 Y122.488 E.00175
G1 X122.898 Y126.398 E.1297
G1 X119.102 Y126.398 E.1259
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
M73 P96 R1
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.42 I-259.262 J-1.85 E.13197
G1 X128.009 Y121.802 E.0207
G1 X127.811 Y121.298 E.01799
G1 X127.461 Y120.781 E.02071
G1 X127.062 Y120.411 E.01804
G1 X126.498 Y120.089 E.02154
G1 X125.884 Y119.919 E.02115
G1 X125.246 Y119.901 E.02117
G1 X124.715 Y120.011 E.01796
G1 X124.135 Y120.277 E.02119
G1 X123.629 Y120.684 E.02154
G1 X123.246 Y121.194 E.02115
G1 X122.996 Y121.781 E.02117
G1 X122.911 Y122.376 E.01994
G1 X123.299 Y122.414 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1587
G1 X123.287 Y122.488 E.00231
G1 X123.29 Y126.79 E.13219
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.65 Y121.977 E.01592
G1 X127.5 Y121.548 E.01395
G1 X127.213 Y121.094 E.01652
G1 X126.858 Y120.746 E.01526
G1 X126.383 Y120.464 E.01699
G1 X125.864 Y120.31 E.01663
G1 X125.358 Y120.285 E.01556
G1 X124.869 Y120.372 E.01527
G1 X124.372 Y120.589 E.01665
G1 X123.936 Y120.929 E.01699
G1 X123.603 Y121.355 E.01663
G1 X123.381 Y121.858 E.01688
G1 X123.307 Y122.354 E.01542
M204 S10000
; WIPE_START
G1 F24000
G1 X123.287 Y122.488 E-.05135
G1 X123.289 Y124.353 E-.70865
; WIPE_END
G1 E-.04 F1800
G1 X123.364 Y120.461 Z26.6 F30000
G1 Z26.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1587
G1 X123.363 Y120.462 E.00004
G2 X122.55 Y122.454 I2.238 J2.075 E.07292
G1 X122.551 Y126.052 E.11936
G1 X119.448 Y126.052 E.10294
G1 X119.448 Y118.948 E.23565
G1 X124.569 Y118.948 E.16988
G1 X123.402 Y120.414 E.06218
G1 X119.855 Y119.483 F30000
G1 F1587
G1 X119.855 Y119.355 E.00426
G1 X121.355 Y119.355 E.04976
G1 X122.679 Y120.679 E.06212
G1 X122.592 Y120.822 E.00556
G2 X122.143 Y122.454 I2.964 J1.693 E.05672
G1 X122.144 Y124.18 E.05727
G1 X120.679 Y125.645 E.0687
G1 X119.855 Y125.645 E.02733
G1 X119.855 Y124.841 E.02668
; WIPE_START
G1 F24000
G1 X119.855 Y125.645 E-.30563
G1 X120.679 Y125.645 E-.31313
G1 X120.942 Y125.382 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X128.571 Y125.604 Z26.6 F30000
M73 P96 R0
G1 X129.983 Y125.645 Z26.6
G1 Z26.2
G1 E.8 F1800
G1 F1587
G1 X128.856 Y125.645 E.03739
G1 X128.856 Y125.144 E.01662
G1 X134.145 Y119.855 E.2481
G1 X134.145 Y124.469 E.15304
G1 X129.031 Y119.355 E.23989
G1 X127.403 Y119.355 E.05401
G1 X134.552 Y126.052 F30000
G1 F1587
G1 X128.449 Y126.052 E.20246
G1 X128.451 Y122.483 E.11839
G2 X127.716 Y120.548 I-3.084 J.064 E.07003
G1 X126.409 Y118.948 E.06852
G1 X134.552 Y118.948 E.27012
G1 X134.552 Y125.992 E.23366
; CHANGE_LAYER
; Z_HEIGHT: 26.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X134.552 Y123.992 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z26.6 I.161 J-1.206 P1  F30000
G1 X122.903 Y122.437 Z26.6
G1 Z26.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1591
G1 X122.895 Y122.489 E.00174
G1 X122.898 Y126.398 E.12966
G1 X119.102 Y126.398 E.1259
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.42 I-257.962 J-1.85 E.13197
G1 X128.009 Y121.8 E.02076
G1 X127.811 Y121.298 E.01792
G1 X127.46 Y120.779 E.02077
G1 X127.062 Y120.412 E.01796
G1 X126.499 Y120.09 E.02152
G1 X125.883 Y119.919 E.02122
G1 X125.246 Y119.901 E.02113
G1 X124.717 Y120.011 E.0179
G1 X124.135 Y120.277 E.02125
G1 X123.629 Y120.684 E.02152
G1 X123.245 Y121.195 E.02122
G1 X122.996 Y121.782 E.02113
G1 X122.911 Y122.378 E.01997
G1 X123.299 Y122.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1591
G1 X123.287 Y122.489 E.00244
G1 X123.29 Y126.79 E.13215
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.65 Y121.975 E.01598
G1 X127.5 Y121.548 E.01389
G1 X127.212 Y121.092 E.01657
G1 X126.858 Y120.747 E.0152
G1 X126.384 Y120.464 E.01697
G1 X125.863 Y120.31 E.01669
G1 X125.358 Y120.285 E.01554
G1 X124.87 Y120.372 E.01521
G1 X124.372 Y120.589 E.01671
G1 X123.936 Y120.928 E.01697
G1 X123.602 Y121.356 E.01669
G1 X123.381 Y121.858 E.01686
G1 X123.308 Y122.351 E.01531
M204 S10000
; WIPE_START
G1 F24000
G1 X123.287 Y122.489 E-.05302
G1 X123.289 Y124.35 E-.70698
; WIPE_END
G1 E-.04 F1800
G1 X123.357 Y120.471 Z26.8 F30000
G1 Z26.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1591
G2 X122.55 Y122.451 I2.326 J2.102 E.07239
G1 X122.551 Y126.052 E.11944
G1 X119.448 Y126.052 E.10294
G1 X119.448 Y118.948 E.23565
G1 X124.569 Y118.948 E.16988
G1 X123.394 Y120.424 E.06258
G1 X127.403 Y119.355 F30000
G1 F1591
G1 X129.031 Y119.355 E.05401
G1 X134.145 Y124.469 E.23989
G1 X134.145 Y119.855 E.15304
G1 X128.856 Y125.144 E.2481
G1 X128.856 Y125.645 E.01662
G1 X129.983 Y125.645 E.03739
G1 X134.552 Y126.052 F30000
G1 F1591
G1 X128.449 Y126.052 E.20246
G1 X128.451 Y122.483 E.11839
G2 X128.378 Y121.863 I-2.565 J-.015 E.02076
G1 X128.34 Y121.701 E.00552
G2 X127.715 Y120.546 I-2.895 J.82 E.04391
G1 X126.409 Y118.948 E.06846
G1 X134.552 Y118.948 E.27012
G1 X134.552 Y125.992 E.23366
; WIPE_START
G1 F24000
G1 X134.552 Y123.992 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.932 Y124.432 Z26.8 F30000
G1 X119.855 Y124.841 Z26.8
G1 Z26.4
G1 E.8 F1800
G1 F1591
G1 X119.855 Y125.645 E.02668
G1 X120.679 Y125.645 E.02733
G1 X122.144 Y124.18 E.0687
G3 X122.171 Y122.067 I15.584 J-.855 E.07016
G3 X122.679 Y120.679 I3.925 J.651 E.04931
G1 X121.355 Y119.355 E.06212
G1 X119.855 Y119.355 E.04976
G1 X119.855 Y119.483 E.00426
; CHANGE_LAYER
; Z_HEIGHT: 26.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.855 Y119.355 E-.04876
G1 X121.355 Y119.355 E-.57
G1 X121.618 Y119.618 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z26.8 I-1.11 J.499 P1  F30000
G1 X122.897 Y122.464 Z26.8
G1 Z26.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1679
G1 X122.895 Y122.49 E.00088
M73 P97 R0
G1 X122.898 Y126.398 E.12962
G1 X119.102 Y126.398 E.1259
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.419 I-256.731 J-1.849 E.13198
G1 X128.008 Y121.798 E.02082
G1 X127.811 Y121.298 E.01785
G1 X127.459 Y120.778 E.02083
G1 X127.063 Y120.412 E.01788
G1 X126.5 Y120.09 E.02151
G1 X125.882 Y119.918 E.02128
G1 X125.246 Y119.901 E.02109
G1 X124.719 Y120.01 E.01784
G1 X124.135 Y120.277 E.02131
G1 X123.63 Y120.683 E.0215
G1 X123.244 Y121.196 E.02128
G1 X123.036 Y121.657 E.01676
G1 X122.916 Y122.182 E.01788
G1 X122.901 Y122.404 E.00737
G1 X123.3 Y122.407 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1679
G1 X123.287 Y122.49 E.00258
G1 X123.29 Y126.79 E.13212
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.65 Y121.973 E.01604
G1 X127.501 Y121.548 E.01383
G1 X127.211 Y121.091 E.01662
G1 X126.859 Y120.747 E.01514
G1 X126.385 Y120.465 E.01696
G1 X125.862 Y120.31 E.01674
G1 X125.358 Y120.285 E.01552
G1 X124.872 Y120.371 E.01514
G1 X124.372 Y120.589 E.01676
G1 X123.937 Y120.928 E.01695
G1 X123.602 Y121.357 E.01674
G1 X123.381 Y121.859 E.01683
G1 X123.308 Y122.348 E.0152
M204 S10000
; WIPE_START
G1 F24000
G1 X123.287 Y122.49 E-.05465
G1 X123.289 Y124.346 E-.70535
; WIPE_END
G1 E-.04 F1800
G1 X121.969 Y126.233 Z27 F30000
G1 Z26.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.433823
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X122.53 Y124.991 E.08208
G1 X122.529 Y123.815 E.07078
G1 X121.529 Y126.03 E.14636
G1 X120.999 Y126.03 E.03197
G1 X122.529 Y122.64 E.22401
G3 X123.025 Y120.852 I3.113 J-.098 E.11348
G1 X123.742 Y119.952 E.06929
G1 X124.186 Y118.97 E.06493
G1 X123.655 Y118.97 E.03197
G1 X120.468 Y126.03 E.46656
G1 X119.937 Y126.03 E.03197
G1 X123.124 Y118.97 E.46656
G1 X122.593 Y118.97 E.03197
G1 X119.47 Y125.89 E.45727
G1 X119.47 Y124.714 E.07082
G1 X122.063 Y118.97 E.37957
G1 X121.532 Y118.97 E.03197
G1 X119.47 Y123.538 E.30186
G1 X119.47 Y122.362 E.07082
G1 X121.001 Y118.97 E.22416
G1 X120.47 Y118.97 E.03197
G1 X119.47 Y121.186 E.14645
G1 X119.47 Y120.01 E.07082
G1 X120.031 Y118.767 E.08213
M106 S252.45
G1 X126.392 Y119.612 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.496016
; LAYER_HEIGHT: 0.2
G1 F1679
G1 X125.921 Y119.035 E.02751
G2 X125.052 Y119.032 I-.482 J13.199 E.03207
G1 X124.588 Y119.615 E.02751
G1 X124.773 Y119.549 E.00727
G1 X125.314 Y119.469 E.02018
G1 X126.102 Y119.52 E.02916
G1 X126.335 Y119.594 E.00902
G1 X126.362 Y118.767 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.419683
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X127.169 Y120.165 E.09096
M106 S252.45
G1 X129.045 Y126.233 F30000
M106 S255
G1 F3000
G1 X128.471 Y125.237 E.0648
G1 X128.471 Y124.299 E.05289
G1 X129.471 Y126.03 E.1127
G1 X130.013 Y126.03 E.03057
G1 X128.472 Y123.36 E.17377
G1 X128.464 Y122.407 E.05373
G1 X130.556 Y126.03 E.23582
G1 X131.098 Y126.03 E.03057
G1 X127.021 Y118.97 E.45954
G1 X127.564 Y118.97 E.03057
G1 X131.64 Y126.03 E.45954
G1 X132.183 Y126.03 E.03057
G1 X128.106 Y118.97 E.45954
G1 X128.648 Y118.97 E.03057
G1 X132.725 Y126.03 E.45954
G1 X133.267 Y126.03 E.03057
G1 X129.191 Y118.97 E.45954
G1 X129.733 Y118.97 E.03057
G1 X133.81 Y126.03 E.45954
G1 X134.352 Y126.03 E.03057
G1 X130.275 Y118.97 E.45954
G1 X130.818 Y118.97 E.03057
G1 X134.53 Y125.4 E.41852
G1 X134.53 Y124.461 E.05295
G1 X131.36 Y118.97 E.35738
G1 X131.902 Y118.97 E.03057
G1 X134.53 Y123.521 E.29625
G1 X134.53 Y122.582 E.05295
G1 X132.445 Y118.97 E.23511
G1 X132.987 Y118.97 E.03057
G1 X134.53 Y121.643 E.17398
G1 X134.53 Y120.703 E.05295
G1 X133.529 Y118.97 E.11284
G1 X134.072 Y118.97 E.03057
G1 X134.733 Y120.115 E.07453
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 26.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X134.072 Y118.97 E-.50249
G1 X133.529 Y118.97 E-.20609
G1 X133.597 Y119.087 E-.05142
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z27 I-.344 J-1.167 P1  F30000
G1 X122.914 Y122.234 Z27
G1 Z26.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2621
G1 X122.898 Y122.594 E.01193
G1 X122.898 Y126.398 E.1262
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.419 I-255.458 J-1.848 E.13198
G1 X128.008 Y121.796 E.02089
G1 X127.811 Y121.298 E.01778
G1 X127.457 Y120.777 E.02089
G1 X127.063 Y120.412 E.0178
G1 X126.501 Y120.09 E.0215
G1 X125.881 Y119.918 E.02135
G1 X125.246 Y119.901 E.02105
G1 X124.721 Y120.009 E.01778
G1 X124.135 Y120.277 E.02137
G1 X123.63 Y120.683 E.02149
G1 X123.244 Y121.197 E.02135
G1 X123.036 Y121.657 E.01674
G1 X122.918 Y122.175 E.0176
G1 X123.3 Y122.401 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2621
G1 X123.29 Y126.79 E.13487
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.469 I-836.469 J-2.383 E.13279
G1 X127.649 Y121.971 E.0154
G1 X127.482 Y121.51 E.01507
G1 X127.21 Y121.09 E.01538
G1 X126.859 Y120.747 E.01507
G1 X126.386 Y120.465 E.01694
G1 X125.861 Y120.31 E.0168
G1 X125.357 Y120.285 E.0155
G1 X124.874 Y120.371 E.01508
G1 X124.372 Y120.589 E.01682
G1 X123.937 Y120.927 E.01693
G1 X123.625 Y121.318 E.01537
G1 X123.445 Y121.705 E.01311
G1 X123.301 Y122.258 E.01755
G1 X123.301 Y122.341 E.00256
M204 S10000
; WIPE_START
G1 F24000
G1 X123.296 Y124.341 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.738 Y125.692 Z27.2 F30000
G1 Z26.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421498
G1 F2621
G1 X122.362 Y126.067 E.01637
G1 X121.827 Y126.067 E.01652
G1 X122.569 Y125.325 E.03236
G1 X122.57 Y124.789 E.01655
G1 X121.291 Y126.067 E.05576
G1 X120.756 Y126.067 E.01652
G1 X122.571 Y124.252 E.07916
G1 X122.571 Y123.716 E.01655
G1 X120.221 Y126.067 E.10256
G1 X119.685 Y126.067 E.01652
G1 X122.572 Y123.18 E.12596
G1 X122.573 Y122.643 E.01655
G1 X119.433 Y125.784 E.13701
G1 X119.433 Y125.248 E.01652
G1 X122.608 Y122.073 E.13852
G3 X122.824 Y121.322 I2.104 J.198 E.02427
G1 X119.433 Y124.713 E.14796
G1 X119.433 Y124.178 E.01652
G1 X124.678 Y118.933 E.2288
G1 X125.213 Y118.933 E.01652
G1 X124.331 Y119.815 E.03849
G3 X125.08 Y119.601 I.942 J1.879 E.02418
G1 X125.748 Y118.933 E.02915
G1 X126.284 Y118.933 E.01652
G1 X125.642 Y119.575 E.02802
G3 X126.124 Y119.628 I-.014 J2.36 E.015
G1 X126.819 Y118.933 E.03032
G1 X127.354 Y118.933 E.01652
G1 X126.533 Y119.754 E.03582
G3 X126.899 Y119.924 I-.536 J1.627 E.01246
G1 X127.89 Y118.933 E.04324
G1 X128.425 Y118.933 E.01652
G1 X127.231 Y120.127 E.05209
G3 X127.519 Y120.374 I-1.287 J1.791 E.01173
G1 X128.961 Y118.933 E.06288
G1 X129.496 Y118.933 E.01652
G1 X127.78 Y120.65 E.07489
G3 X127.994 Y120.971 I-1.319 J1.113 E.01193
G1 X130.031 Y118.933 E.08889
G1 X130.567 Y118.933 E.01652
G1 X128.185 Y121.315 E.10391
G3 X128.326 Y121.709 I-1.682 J.823 E.01295
G1 X131.102 Y118.933 E.12112
G1 X131.638 Y118.933 E.01652
G1 X128.4 Y122.171 E.14126
G3 X128.436 Y122.67 I-2.15 J.405 E.01549
G1 X132.173 Y118.933 E.16305
G1 X132.708 Y118.933 E.01652
G1 X128.435 Y123.206 E.18642
G1 X128.435 Y123.742 E.01653
G1 X133.244 Y118.933 E.2098
G1 X133.779 Y118.933 E.01652
G1 X128.435 Y124.278 E.23317
G1 X128.434 Y124.813 E.01653
G1 X134.315 Y118.933 E.25654
G1 X134.567 Y118.933 E.00778
G1 X134.567 Y119.216 E.00873
G1 X128.434 Y125.349 E.26756
G1 X128.434 Y125.885 E.01653
G1 X134.567 Y119.752 E.26758
G1 X134.567 Y120.287 E.01652
G1 X128.787 Y126.067 E.25217
G1 X129.322 Y126.067 E.01652
G1 X134.567 Y120.822 E.22881
G1 X134.567 Y121.358 E.01652
G1 X129.858 Y126.067 E.20545
G1 X130.393 Y126.067 E.01652
G1 X134.567 Y121.893 E.18209
G1 X134.567 Y122.428 E.01652
G1 X130.928 Y126.067 E.15874
G1 X131.464 Y126.067 E.01652
G1 X134.567 Y122.964 E.13538
G1 X134.567 Y123.499 E.01652
G1 X131.999 Y126.067 E.11202
G1 X132.535 Y126.067 E.01652
G1 X134.567 Y124.035 E.08866
G1 X134.567 Y124.57 E.01652
G1 X133.07 Y126.067 E.0653
G1 X133.605 Y126.067 E.01652
G1 X134.567 Y125.105 E.04195
M73 P98 R0
G1 X134.567 Y125.641 E.01652
G1 X133.971 Y126.237 E.02599
; WIPE_START
G1 F24000
G1 X134.567 Y125.641 E-.32016
G1 X134.567 Y125.105 E-.20345
G1 X134.127 Y125.545 E-.23639
; WIPE_END
G1 E-.04 F1800
G1 X126.546 Y124.661 Z27.2 F30000
G1 X119.263 Y123.812 Z27.2
G1 Z26.8
G1 E.8 F1800
G1 F2621
G1 X124.142 Y118.933 E.21285
G1 X123.607 Y118.933 E.01652
G1 X119.433 Y123.107 E.18209
G1 X119.433 Y122.571 E.01652
G1 X123.071 Y118.933 E.15873
G1 X122.536 Y118.933 E.01652
G1 X119.433 Y122.036 E.13537
G1 X119.433 Y121.501 E.01652
G1 X122.001 Y118.933 E.11201
G1 X121.465 Y118.933 E.01652
G1 X119.433 Y120.965 E.08866
G1 X119.433 Y120.43 E.01652
G1 X120.93 Y118.933 E.0653
G1 X120.394 Y118.933 E.01652
G1 X119.433 Y119.894 E.04194
G1 X119.433 Y119.359 E.01652
G1 X120.029 Y118.763 E.02599
; CHANGE_LAYER
; Z_HEIGHT: 27
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.433 Y119.359 E-.32009
G1 X119.433 Y119.894 E-.20345
G1 X119.873 Y119.454 E-.23646
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z27.2 I-.742 J.965 P1  F30000
G1 X122.987 Y121.85 Z27.2
G1 Z27
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2934
G1 X122.962 Y121.923 E.00255
G1 X122.895 Y122.493 E.01906
G1 X122.898 Y126.398 E.12952
G1 X119.102 Y126.398 E.1259
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11314
G1 X134.898 Y126.398 E.14547
G1 X128.102 Y126.398 E.22542
G2 X128.102 Y122.433 I-383.455 J-1.923 E.13152
G1 X128.034 Y121.905 E.01766
G1 X127.819 Y121.31 E.021
G1 X127.529 Y120.863 E.01767
G1 X127.076 Y120.42 E.021
G1 X126.635 Y120.149 E.01719
G1 X126.134 Y119.968 E.01767
G1 X125.506 Y119.889 E.021
G1 X124.976 Y119.944 E.01767
G1 X124.375 Y120.144 E.021
G1 X123.922 Y120.423 E.01766
G1 X123.553 Y120.766 E.01671
G1 X123.241 Y121.198 E.01767
G2 X123.129 Y121.447 I3.913 J1.928 E.00905
G1 X123.007 Y121.794 E.0122
G1 X123.299 Y122.394 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2934
G1 X123.287 Y122.493 E.00308
G1 X123.29 Y126.79 E.13202
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11685
G1 X135.29 Y126.79 E.14679
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.663 Y122.03 E.01425
G1 X127.502 Y121.553 E.01547
G1 X127.248 Y121.137 E.01497
G1 X126.896 Y120.777 E.01547
G1 X126.525 Y120.531 E.01367
G1 X126.075 Y120.356 E.01483
G1 X125.577 Y120.281 E.01547
G1 X125.092 Y120.318 E.01497
G1 X124.61 Y120.467 E.01547
G1 X124.189 Y120.711 E.01496
G1 X123.82 Y121.053 E.01547
G1 X123.546 Y121.456 E.01497
G1 X123.351 Y121.971 E.01692
G1 X123.307 Y122.334 E.01124
M204 S10000
; WIPE_START
G1 F24000
G1 X123.287 Y122.493 E-.06094
G1 X123.288 Y124.333 E-.69906
; WIPE_END
G1 E-.04 F1800
G1 X130.339 Y121.409 Z27.4 F30000
G1 X134.676 Y119.61 Z27.4
G1 Z27
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2934
G1 X133.89 Y118.824 E.03416
G1 X133.356 Y118.824
G1 X134.676 Y120.144 E.05733
G1 X134.676 Y120.677
G1 X132.823 Y118.824 E.0805
G1 X132.29 Y118.824
G1 X134.676 Y121.21 E.10368
G1 X134.676 Y121.744
G1 X131.756 Y118.824 E.12685
G1 X131.223 Y118.824
G1 X134.676 Y122.277 E.15002
G1 X134.676 Y122.81
G1 X130.69 Y118.824 E.17319
G1 X130.157 Y118.824
G1 X134.676 Y123.343 E.19637
G1 X134.676 Y123.877
G1 X129.623 Y118.824 E.21954
G1 X129.09 Y118.824
G1 X134.676 Y124.41 E.24271
G1 X134.676 Y124.943
G1 X128.557 Y118.824 E.26589
G1 X128.024 Y118.824
G1 X134.676 Y125.476 E.28906
G1 X134.676 Y126.01
G1 X127.49 Y118.824 E.31223
G1 X126.957 Y118.824
G1 X134.308 Y126.176 E.31944
G1 X133.775 Y126.176
G1 X126.424 Y118.824 E.31944
G1 X125.89 Y118.824
G1 X133.242 Y126.176 E.31944
G1 X132.708 Y126.176
G1 X128.183 Y121.651 E.19663
G1 X128.311 Y122.311
G1 X132.175 Y126.176 E.16793
G1 X131.642 Y126.176
G1 X128.327 Y122.861 E.14405
G1 X128.327 Y123.394
G1 X131.108 Y126.176 E.12089
G1 X130.575 Y126.176
G1 X128.326 Y123.927 E.09773
G1 X128.326 Y124.46
G1 X130.042 Y126.176 E.07457
G1 X129.509 Y126.176
G1 X128.326 Y124.993 E.05141
G1 X128.325 Y125.525
G1 X128.975 Y126.176 E.02825
M204 S10000
; WIPE_START
G1 F24000
G1 X128.325 Y125.525 E-.34934
G1 X128.326 Y124.993 E-.20252
G1 X128.713 Y125.38 E-.20814
; WIPE_END
G1 E-.04 F1800
G1 X126.323 Y119.79 Z27.4 F30000
G1 Z27
G1 E.8 F1800
M204 S2000
G1 F2934
G1 X125.357 Y118.824 E.04197
G1 X124.824 Y118.824
G1 X125.682 Y119.683 E.0373
G1 X125.159 Y119.692
G1 X124.291 Y118.824 E.03772
G1 X123.757 Y118.824
G1 X124.722 Y119.789 E.04192
G1 X124.325 Y119.925
G1 X123.224 Y118.824 E.04783
G1 X122.691 Y118.824
G1 X123.982 Y120.115 E.05609
G1 X123.679 Y120.346
G1 X122.158 Y118.824 E.06611
G1 X121.624 Y118.824
G1 X123.402 Y120.603 E.07727
G1 X123.172 Y120.905
G1 X121.091 Y118.824 E.09042
G1 X120.558 Y118.824
G1 X122.971 Y121.238 E.10489
G1 X122.821 Y121.621
G1 X120.024 Y118.824 E.12154
G1 X119.491 Y118.824
G1 X122.723 Y122.056 E.14042
G1 X122.673 Y122.539
G1 X119.324 Y119.191 E.14551
G1 X119.324 Y119.724
G1 X122.673 Y123.073 E.14552
G1 X122.674 Y123.607
G1 X119.324 Y120.258 E.14553
G1 X119.324 Y120.791
G1 X122.674 Y124.14 E.14555
G1 X122.674 Y124.674
G1 X119.324 Y121.324 E.14556
G1 X119.324 Y121.857
G1 X122.674 Y125.207 E.14558
G1 X122.675 Y125.741
G1 X119.324 Y122.391 E.14559
G1 X119.324 Y122.924
G1 X122.576 Y126.176 E.1413
G1 X122.043 Y126.176
G1 X119.324 Y123.457 E.11813
G1 X119.324 Y123.99
G1 X121.51 Y126.176 E.09495
G1 X120.976 Y126.176
G1 X119.324 Y124.524 E.07178
G1 X119.324 Y125.057
G1 X120.443 Y126.176 E.04861
G1 X119.91 Y126.176
G1 X119.324 Y125.59 E.02543
M204 S10000
; WIPE_START
G1 F24000
G1 X119.91 Y126.176 E-.31454
G1 X120.443 Y126.176 E-.20264
G1 X119.991 Y125.724 E-.24281
; WIPE_END
G1 E-.04 F1800
G1 X122.807 Y121.662 Z27.4 F30000
G1 Z27
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0944846
G1 F2934
G2 X122.726 Y121.792 I2.018 J1.346 E.00065
; WIPE_START
G1 F24000
G1 X122.807 Y121.662 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X119.336 Y118.806 Z27.4 F30000
G1 Z27
G1 E.8 F1800
; LINE_WIDTH: 0.104173
G1 F2934
G1 X119.336 Y119.179 E.00186
; WIPE_START
G1 F24000
G1 X119.336 Y118.806 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.219 Y122.104 Z27.4 F30000
G1 X134.694 Y126.164 Z27.4
G1 Z27
G1 E.8 F1800
; LINE_WIDTH: 0.103064
G1 F2934
G1 X134.319 Y126.164 E.00184
; WIPE_START
G1 F24000
G1 X134.694 Y126.164 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.475 Y121.74 Z27.4 F30000
G1 X128.252 Y121.582 Z27.4
G1 Z27
G1 E.8 F1800
; LINE_WIDTH: 0.113767
G1 F2934
G2 X128.045 Y121.272 I-5.566 J3.5 E.00215
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X128.252 Y121.582 E-.76
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
G1 Z27.5 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000

G1 X65 Y245 F12000
M73 P99 R0
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

    G1 Z127 F600
    G1 Z125

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

