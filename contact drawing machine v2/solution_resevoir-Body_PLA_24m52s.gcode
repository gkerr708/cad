; HEADER_BLOCK_START
; BambuStudio 01.07.01.62
; model printing time: 19m 6s; total estimated time: 24m 52s
; total layer number: 135
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
M73 P0 R24
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
M73 P17 R20
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
M73 P18 R20
G1 E-0.5 F300

M73 P19 R19
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
M73 P20 R19
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
    G29 A X118.5 Y118 I19 J21
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
M73 P21 R19
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
G1 X119.357 Y116.857 E.71832
G1 X134.643 Y116.857 E.56934
G1 X134.643 Y118.171 E.04896
G1 X134.645 Y118.187 E.00059
M73 P22 R19
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
M73 P23 R19
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
M73 P23 R18
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
M73 P24 R18
G1 X119.746 Y134.58 E.06244
G1 X119.746 Y135.233 E.02453
G1 X120.473 Y135.96 E.03868
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.746 Y135.233 E-.39091
G1 X119.746 Y134.58 E-.24796
G1 X119.971 Y134.806 E-.12113
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z.6 I.881 J.84 P1  F30000
G1 X135.432 Y118.59 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F7881
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
G1 F7881
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
G1 F7881
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
M73 P25 R18
G1 X135.418 Y134.246 F30000
G1 F7881
G1 X136.567 Y133.097 E.05046
G1 X136.567 Y133.636 E.01673
G1 X135.966 Y134.237 E.02638
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X136.567 Y133.636 E-.32291
G1 X136.567 Y133.097 E-.20474
G1 X136.135 Y133.529 E-.23235
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z.8 I1.216 J-.057 P1  F30000
G1 X135.432 Y118.59 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F7837
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
G1 F7837
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
G1 F7837
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
G1 F7837
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
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.433 Y135.636 E-.32287
G1 X119.433 Y135.097 E-.20474
G1 X119.866 Y135.529 E-.23239
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z1 I.048 J1.216 P1  F30000
G1 X134.91 Y134.932 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2973
G1 X134.898 Y134.979 E.00159
G1 X134.898 Y136.398 E.04708
G1 X119.102 Y136.398 E.52398
G1 X119.102 Y116.602 E.65666
G1 X134.898 Y116.602 E.52398
G1 X134.898 Y118.021 E.04708
G2 X135.195 Y118.528 I.651 J-.041 E.02019
G1 X135.479 Y118.602 E.00974
G1 X136.898 Y118.602 E.04708
G1 X136.898 Y120.021 E.04708
G1 X136.898 Y134.398 E.47689
G1 X135.479 Y134.398 E.04708
G2 X134.972 Y134.695 I.041 J.651 E.02019
G1 X134.925 Y134.874 E.00616
G1 X135.361 Y134.832 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2973
G1 X135.332 Y134.892 E.00205
G1 X135.29 Y134.979 E.00296
G1 X135.29 Y136.79 E.05566
G1 X118.71 Y136.79 E.50946
G1 X118.71 Y116.21 E.63237
G1 X135.29 Y116.21 E.50946
G1 X135.29 Y118.021 E.05566
G1 X135.332 Y118.139 E.00383
G1 X135.392 Y118.168 E.00205
G1 X135.479 Y118.21 E.00296
G1 X137.29 Y118.21 E.05566
G1 X137.29 Y120.021 E.05566
G1 X137.29 Y134.79 E.4538
G1 X135.479 Y134.79 E.05566
G1 X135.418 Y134.812 E.00199
M204 S10000
; WIPE_START
G1 F24000
G1 X135.332 Y134.892 E-.04458
G1 X135.29 Y134.979 E-.03656
G1 X135.29 Y136.765 E-.67887
; WIPE_END
G1 E-.04 F1800
G1 X136.145 Y131.579 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2973
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
G1 X134.552 Y118.032 F30000
G1 F2973
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
M73 P26 R18
G1 X122.921 Y117.355 F30000
G1 F2973
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
G1 X119.448 Y123.496 F30000
G1 F2973
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
G1 X119.855 Y128.097 F30000
G1 F2973
G1 X119.855 Y126.469 E.05401
G1 X120.228 Y126.096 E.0175
G1 X120.42 Y126.096 E.00636
G1 X129.969 Y135.645 E.44796
G1 X133.707 Y135.645 E.124
G1 X134.145 Y135.207 E.02053
G3 X134.812 Y133.819 I1.415 J-.174 E.05397
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X134.532 Y134.032 E-.13377
G1 X134.316 Y134.317 E-.13591
G1 X134.196 Y134.597 E-.11568
G1 X134.145 Y135.207 E-.23276
G1 X133.881 Y135.471 E-.14188
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z1.2 I1.212 J.111 P1  F30000
G1 X135.432 Y118.59 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2940
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
G1 F2940
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
G1 F2940
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
G1 F2940
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
G1 F2940
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
G1 F2940
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
G1 F2940
G2 X134.145 Y135.207 I.747 J1.214 E.05397
G1 X133.707 Y135.645 E.02053
G1 X129.969 Y135.645 E.124
G1 X120.42 Y126.096 E.44796
G1 X120.228 Y126.096 E.00636
G1 X119.855 Y126.469 E.0175
G1 X119.855 Y128.097 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.855 Y126.469 E-.61876
G1 X120.118 Y126.206 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z1.4 I.542 J1.09 P1  F30000
G1 X135.432 Y118.59 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2957
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
G1 F2957
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
G1 F2957
G2 X135.468 Y118.948 I.941 J-.025 E.0474
G1 X136.552 Y118.948 E.03596
G1 X136.552 Y134.052 E.50102
G2 X135.209 Y134.091 I-.542 J4.491 E.04473
G2 X134.552 Y134.968 I.305 J.913 E.03867
M73 P27 R18
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
G1 F2957
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
G1 F2957
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
G1 F2957
G1 X119.855 Y126.469 E.05401
G1 X120.228 Y126.096 E.0175
G1 X120.42 Y126.096 E.00636
G1 X129.969 Y135.645 E.44796
G1 X133.707 Y135.645 E.124
G1 X134.145 Y135.207 E.02053
G3 X134.812 Y133.819 I1.415 J-.174 E.05397
G1 X119.448 Y123.496 F30000
G1 F2957
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
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.782 Y125.282 E-.17189
G1 X133.782 Y124.106 E-.44687
G1 X133.519 Y123.843 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z1.6 I1.143 J.416 P1  F30000
G1 X135.432 Y118.59 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2931
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
G1 F2931
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
G1 F2931
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
G1 F2931
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
M73 P27 R17
G1 X133.329 Y125.282 F30000
G1 F2931
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
G1 F2931
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
G1 F2931
G2 X134.145 Y135.207 I.747 J1.214 E.05397
G1 X133.707 Y135.645 E.02053
G1 X129.969 Y135.645 E.124
G1 X120.42 Y126.096 E.44796
G1 X120.228 Y126.096 E.00636
G1 X119.855 Y126.469 E.0175
G1 X119.855 Y128.097 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.855 Y126.469 E-.61876
G1 X120.118 Y126.206 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
M106 S244.8
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z1.8 I.542 J1.09 P1  F30000
G1 X135.432 Y118.59 Z1.8
G1 Z1.6
M73 P28 R17
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
M106 S244.8
G1 X119.448 Y123.496 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X119.448 Y125.124 E.05401
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
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.782 Y125.282 E-.17189
G1 X133.782 Y124.106 E-.44687
G1 X133.519 Y123.843 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z2 I1.143 J.416 P1  F30000
G1 X135.432 Y118.59 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F6888
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
G1 F6888
G1 X135.392 Y118.168 E.00205
G1 X135.479 Y118.21 E.00296
G1 X137.29 Y118.21 E.05566
M73 P29 R17
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
G1 F6888
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
G1 F6888
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
G1 F6888
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
G1 F6888
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
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.435 Y120.082 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z2.2 I.542 J1.089 P1  F30000
G1 X135.432 Y118.59 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F7531
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
G1 F7531
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
G1 F7531
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
G1 F7531
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
G1 F7531
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
G1 F7531
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
M73 P30 R17
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
G1 F7531
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
G1 F7531
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
G1 F7531
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
G1 F7531
G1 X135.356 Y134.109 E.00147
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X135.568 Y134.188 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
M106 S255
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z2.4 I1.216 J-.052 P1  F30000
G1 X134.898 Y118.602 Z2.4
G1 Z2.2
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
G1 X127.631 Y120.508 Z2.6 F30000
G1 X119.448 Y120.828 Z2.6
G1 Z2.2
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
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z2.6 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z2.6
G1 Z2.4
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
G1 X127.785 Y121.763 Z2.8 F30000
M73 P31 R17
G1 X119.448 Y123.496 Z2.8
G1 Z2.4
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
; Z_HEIGHT: 2.6
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
G3 Z2.8 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z2.8
G1 Z2.6
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
G1 X127.631 Y120.508 Z3 F30000
G1 X119.448 Y120.828 Z3
G1 Z2.6
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
M73 P31 R16
G1 X127.376 Y118.948 E.0414
G1 X120.272 Y126.052 E.33325
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z3 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1200
G1 X134.898 Y126.398 E.2586
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X131 Y118.602 E.39468
G1 X134.838 Y118.602 E.12731
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X135.29 Y126.79 E.26364
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X131 Y118.21 E.37764
G1 X135.23 Y118.21 E.12998
M204 S10000
; WIPE_START
M73 P32 R16
G1 F24000
G1 X135.244 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.771 Y121.764 Z3.2 F30000
G1 X119.448 Y123.496 Z3.2
G1 Z2.8
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
; Z_HEIGHT: 3
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
G3 Z3.2 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z3.2
G1 Z3
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
G1 X127.631 Y120.508 Z3.4 F30000
G1 X119.448 Y120.828 Z3.4
G1 Z3
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
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z3.4 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z3.4
G1 Z3.2
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
M73 P33 R16
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
; Z_HEIGHT: 3.4
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
G3 Z3.6 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z3.6
G1 Z3.4
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
G1 X127.631 Y120.508 Z3.8 F30000
G1 X119.448 Y120.828 Z3.8
G1 Z3.4
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
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z3.8 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1200
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
M73 P34 R16
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
G1 X127.785 Y121.763 Z4 F30000
G1 X119.448 Y123.496 Z4
G1 Z3.6
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
; Z_HEIGHT: 3.8
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
G3 Z4 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z4
G1 Z3.8
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
G1 X127.631 Y120.508 Z4.2 F30000
G1 X119.448 Y120.828 Z4.2
G1 Z3.8
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
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
M73 P35 R16
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z4.2 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z4.2
G1 Z4
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
G1 X127.785 Y121.763 Z4.4 F30000
G1 X119.448 Y123.496 Z4.4
G1 Z4
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
; Z_HEIGHT: 4.2
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
G3 Z4.4 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z4.4
G1 Z4.2
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
M73 P35 R15
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
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P36 R15
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z4.6 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z4.6
G1 Z4.4
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
G1 X127.785 Y121.763 Z4.8 F30000
G1 X119.448 Y123.496 Z4.8
G1 Z4.4
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
; Z_HEIGHT: 4.6
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
G3 Z4.8 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z4.8
G1 Z4.6
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
G1 X127.631 Y120.508 Z5 F30000
G1 X119.448 Y120.828 Z5
G1 Z4.6
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
M73 P37 R15
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z5 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z5
G1 Z4.8
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
G1 X127.785 Y121.763 Z5.2 F30000
G1 X119.448 Y123.496 Z5.2
G1 Z4.8
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
; Z_HEIGHT: 5
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
G3 Z5.2 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z5.2
G1 Z5
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
G1 X127.631 Y120.508 Z5.4 F30000
G1 X119.448 Y120.828 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P38 R15
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
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z5.4 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1200
G1 X134.898 Y126.398 E.2586
G1 X131 Y126.398 E.1293
G1 X119.102 Y126.398 E.39468
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
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
G1 X127.771 Y121.764 Z5.6 F30000
G1 X119.448 Y123.496 Z5.6
G1 Z5.2
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
; Z_HEIGHT: 5.4
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
G3 Z5.6 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z5.6
G1 Z5.4
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
G1 X127.631 Y120.508 Z5.8 F30000
G1 X119.448 Y120.828 Z5.8
M73 P39 R15
G1 Z5.4
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
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z5.8 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z5.8
G1 Z5.6
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
G1 X127.785 Y121.763 Z6 F30000
G1 X119.448 Y123.496 Z6
G1 Z5.6
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
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.7 Y118.948 E-.13536
M73 P39 R14
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z6 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z6
G1 Z5.8
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
G1 X127.631 Y120.508 Z6.2 F30000
M73 P40 R14
G1 X119.448 Y120.828 Z6.2
G1 Z5.8
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
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z6.2 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1200
G1 X134.898 Y126.398 E.2586
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X131 Y118.602 E.39468
G1 X134.838 Y118.602 E.12731
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X135.29 Y126.79 E.26364
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X131 Y118.21 E.37764
G1 X135.23 Y118.21 E.12998
M204 S10000
; WIPE_START
G1 F24000
G1 X135.244 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.771 Y121.764 Z6.4 F30000
G1 X119.448 Y123.496 Z6.4
G1 Z6
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
; Z_HEIGHT: 6.2
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
G3 Z6.4 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z6.4
G1 Z6.2
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
M73 P41 R14
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.631 Y120.508 Z6.6 F30000
G1 X119.448 Y120.828 Z6.6
G1 Z6.2
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
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z6.6 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z6.6
G1 Z6.4
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
G1 X127.785 Y121.763 Z6.8 F30000
G1 X119.448 Y123.496 Z6.8
G1 Z6.4
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
; Z_HEIGHT: 6.6
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z6.8 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z6.8
G1 Z6.6
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
M73 P42 R14
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
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z7 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z7
G1 Z6.8
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
G1 X127.785 Y121.763 Z7.2 F30000
G1 X119.448 Y123.496 Z7.2
G1 Z6.8
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
; Z_HEIGHT: 7
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
G3 Z7.2 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z7.2
G1 Z7
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
M73 P43 R14
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
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z7.4 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1200
G1 X134.898 Y126.398 E.2586
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
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
G1 X127.771 Y121.764 Z7.6 F30000
G1 X119.448 Y123.496 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X119.448 Y125.124 E.05401
M73 P43 R13
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
; Z_HEIGHT: 7.4
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
G3 Z7.6 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z7.6
M73 P44 R13
G1 Z7.4
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
G1 X127.631 Y120.508 Z7.8 F30000
G1 X119.448 Y120.828 Z7.8
G1 Z7.4
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
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z7.8 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z7.8
G1 Z7.6
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
G1 X127.785 Y121.763 Z8 F30000
G1 X119.448 Y123.496 Z8
G1 Z7.6
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
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
M73 P45 R13
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z8 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z8
G1 Z7.8
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
G1 X127.631 Y120.508 Z8.2 F30000
G1 X119.448 Y120.828 Z8.2
G1 Z7.8
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
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z8.2 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z8.2
G1 Z8
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
G1 X127.785 Y121.763 Z8.4 F30000
G1 X119.448 Y123.496 Z8.4
G1 Z8
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
M73 P46 R13
G1 X119.448 Y120.828 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.2
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
G3 Z8.4 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z8.4
G1 Z8.2
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
G1 X127.631 Y120.508 Z8.6 F30000
G1 X119.448 Y120.828 Z8.6
G1 Z8.2
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
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z8.6 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z8.6
G1 Z8.4
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
G1 X127.785 Y121.763 Z8.8 F30000
G1 X119.448 Y123.496 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
M73 P47 R13
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
; Z_HEIGHT: 8.6
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
G3 Z8.8 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z8.8
G1 Z8.6
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
G1 X127.631 Y120.508 Z9 F30000
G1 X119.448 Y120.828 Z9
G1 Z8.6
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
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z9 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z9
G1 Z8.8
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
M73 P47 R12
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
M73 P48 R12
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
; Z_HEIGHT: 9
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
G3 Z9.2 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z9.2
G1 Z9
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
G1 X127.631 Y120.508 Z9.4 F30000
G1 X119.448 Y120.828 Z9.4
G1 Z9
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
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z9.4 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z9.4
G1 Z9.2
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
G1 X127.785 Y121.763 Z9.6 F30000
G1 X119.448 Y123.496 Z9.6
G1 Z9.2
M73 P49 R12
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
; Z_HEIGHT: 9.4
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
G3 Z9.6 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z9.6
G1 Z9.4
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
G1 X127.631 Y120.508 Z9.8 F30000
G1 X119.448 Y120.828 Z9.8
G1 Z9.4
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
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z9.8 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z9.8
G1 Z9.6
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
M73 P50 R12
G1 X135.258 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.785 Y121.763 Z10 F30000
G1 X119.448 Y123.496 Z10
G1 Z9.6
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
; Z_HEIGHT: 9.8
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
G3 Z10 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z10
G1 Z9.8
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
G1 X127.631 Y120.508 Z10.2 F30000
G1 X119.448 Y120.828 Z10.2
G1 Z9.8
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
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
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
G3 Z10.2 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z10.2
G1 Z10
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
M73 P51 R12
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
; Z_HEIGHT: 10.2
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z10.4 I.028 J1.217 P1  F30000
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
M73 P51 R11
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
M73 P52 R11
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
G1 X118.71 Y118.21 E.26364
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
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z11 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1200
G1 X134.898 Y126.398 E.2586
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
M73 P53 R11
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
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
G1 X127.771 Y121.764 Z11.2 F30000
G1 X119.448 Y123.496 Z11.2
G1 Z10.8
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
G1 X127.631 Y120.508 Z11.4 F30000
G1 X119.448 Y120.828 Z11.4
G1 Z11
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
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
M73 P54 R11
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
G1 X127.785 Y121.763 Z11.6 F30000
G1 X119.448 Y123.496 Z11.6
G1 Z11.2
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
G1 X127.631 Y120.508 Z11.8 F30000
G1 X119.448 Y120.828 Z11.8
G1 Z11.4
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
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
M73 P55 R11
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
G1 X127.785 Y121.763 Z12 F30000
G1 X119.448 Y123.496 Z12
G1 Z11.6
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
G1 F1200
G1 X134.898 Y126.398 E.2586
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
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
G1 X127.617 Y120.509 Z12.2 F30000
G1 X119.448 Y120.828 Z12.2
M73 P55 R10
G1 Z11.8
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
M73 P56 R10
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
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
G3 Z12.2 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z12.2
G1 Z12
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
G1 X127.785 Y121.763 Z12.4 F30000
G1 X119.448 Y123.496 Z12.4
G1 Z12
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
G3 Z12.4 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z12.4
G1 Z12.2
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
G1 X127.631 Y120.508 Z12.6 F30000
G1 X119.448 Y120.828 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P57 R10
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
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
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
G3 Z12.6 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z12.6
G1 Z12.4
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
G1 X127.785 Y121.763 Z12.8 F30000
G1 X119.448 Y123.496 Z12.8
G1 Z12.4
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
G3 Z12.8 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z12.8
G1 Z12.6
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
G1 X127.631 Y120.508 Z13 F30000
G1 X119.448 Y120.828 Z13
M73 P58 R10
G1 Z12.6
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
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
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
G3 Z13 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z13
G1 Z12.8
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
G1 X127.785 Y121.763 Z13.2 F30000
G1 X119.448 Y123.496 Z13.2
G1 Z12.8
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
; Z_HEIGHT: 13
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
G3 Z13.2 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z13.2
G1 Z13
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
G1 X127.631 Y120.508 Z13.4 F30000
M73 P59 R10
G1 X119.448 Y120.828 Z13.4
G1 Z13
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
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
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
G3 Z13.4 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z13.4
G1 Z13.2
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
G1 X127.785 Y121.763 Z13.6 F30000
G1 X119.448 Y123.496 Z13.6
G1 Z13.2
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
; Z_HEIGHT: 13.4
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
M73 P59 R9
G3 Z13.6 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1200
G1 X134.898 Y126.398 E.2586
G1 X131 Y126.398 E.1293
G1 X119.102 Y126.398 E.39468
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X135.29 Y126.79 E.26364
G1 X131 Y126.79 E.13182
G1 X118.71 Y126.79 E.37764
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
M73 P60 R9
G1 F24000
G1 X135.244 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.617 Y120.509 Z13.8 F30000
G1 X119.448 Y120.828 Z13.8
G1 Z13.4
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
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
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
G3 Z13.8 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z13.8
G1 Z13.6
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
G1 X127.785 Y121.763 Z14 F30000
G1 X119.448 Y123.496 Z14
G1 Z13.6
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
; Z_HEIGHT: 13.8
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
G3 Z14 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1200
G1 X134.898 Y126.398 E.2586
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1200
G1 X135.29 Y126.79 E.26364
G1 X118.71 Y126.79 E.50946
G1 X118.71 Y118.21 E.26364
G1 X135.23 Y118.21 E.50761
M204 S10000
; WIPE_START
M73 P61 R9
G1 F24000
G1 X135.244 Y120.21 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.617 Y120.509 Z14.2 F30000
G1 X119.448 Y120.828 Z14.2
G1 Z13.8
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
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
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
G3 Z14.2 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z14.2
G1 Z14
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
G1 X127.785 Y121.763 Z14.4 F30000
G1 X119.448 Y123.496 Z14.4
G1 Z14
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
; Z_HEIGHT: 14.2
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
G3 Z14.4 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z14.4
G1 Z14.2
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
M73 P62 R9
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
G1 X127.631 Y120.508 Z14.6 F30000
G1 X119.448 Y120.828 Z14.6
G1 Z14.2
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
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
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
G3 Z14.6 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z14.6
G1 Z14.4
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
G1 X127.785 Y121.763 Z14.8 F30000
G1 X119.448 Y123.496 Z14.8
G1 Z14.4
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
; Z_HEIGHT: 14.6
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
M73 P63 R9
G3 Z14.8 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z14.8
G1 Z14.6
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
G1 X127.631 Y120.508 Z15 F30000
G1 X119.448 Y120.828 Z15
G1 Z14.6
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
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
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
G3 Z15 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z15
G1 Z14.8
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
G1 X127.785 Y121.763 Z15.2 F30000
G1 X119.448 Y123.496 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
M73 P63 R8
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
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
M73 P64 R8
G1 X119.7 Y118.948 E-.13536
G1 X119.715 Y118.948 E-.00588
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
G3 Z15.2 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z15.2
G1 Z15
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
G1 X127.631 Y120.508 Z15.4 F30000
G1 X119.448 Y120.828 Z15.4
G1 Z15
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
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
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
G3 Z15.4 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z15.4
G1 Z15.2
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
G1 X127.785 Y121.763 Z15.6 F30000
G1 X119.448 Y123.496 Z15.6
G1 Z15.2
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
M73 P65 R8
G1 X119.448 Y120.828 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.4
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
G3 Z15.6 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z15.6
G1 Z15.4
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
G1 X127.631 Y120.508 Z15.8 F30000
G1 X119.448 Y120.828 Z15.8
G1 Z15.4
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
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
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
G3 Z15.8 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z15.8
G1 Z15.6
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
G1 X127.785 Y121.763 Z16 F30000
G1 X119.448 Y123.496 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
M73 P66 R8
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
; Z_HEIGHT: 15.8
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
M106 S252.45
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z16 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z16
G1 Z15.8
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
G1 X127.826 Y120.749 Z16.2 F30000
G1 Z15.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1396
G1 X127.822 Y120.742 E.00026
G2 X126.544 Y119.78 I-2.346 J1.784 E.05373
G1 X122.595 Y123.729 E.18526
G3 X122.742 Y121.574 I5.884 J-.682 E.07204
G3 X123.005 Y121.005 I2.905 J.995 E.02085
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
G1 X126.195 Y119.251 E.02002
G1 X126.771 Y119.431 E.02003
G1 X127.306 Y119.712 E.02003
G1 X127.78 Y120.086 E.02003
G1 X128.178 Y120.54 E.02002
G1 X128.488 Y121.058 E.02003
G1 X128.698 Y121.624 E.02003
G1 X128.803 Y122.22 E.02008
G3 X128.811 Y126.052 I-62.16 J2.052 E.12713
G1 X122.189 Y126.052 E.21968
G3 X122.19 Y122.326 I42.983 J-1.844 E.12364
G1 X122.339 Y121.497 E.02791
G1 X122.571 Y120.94 E.02003
G1 X122.902 Y120.434 E.02008
G1 X123.318 Y119.997 E.01998
G1 X123.808 Y119.642 E.02008
G1 X124.353 Y119.382 E.02003
G1 X124.936 Y119.226 E.02003
G1 X125.536 Y119.178 E.01997
G1 X119.448 Y120.828 F30000
G1 F1396
G1 X119.448 Y119.2 E.05401
M73 P67 R8
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.413 Y120.413 E.06874
G1 X121.951 Y121.375 E.03539
G1 X121.781 Y122.369 E.03347
G2 X121.781 Y124.543 I50.669 J1.081 E.07211
G1 X120.272 Y126.052 E.07079
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
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
G3 Z16.2 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z16.2
G1 Z16
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
G1 X128.415 Y120.181 Z16.4 F30000
G1 Z16
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
G1 X126.195 Y119.251 E.02002
G1 X126.771 Y119.431 E.02003
G1 X127.306 Y119.712 E.02003
G1 X127.78 Y120.086 E.02003
G1 X128.178 Y120.54 E.02002
G1 X128.488 Y121.058 E.02003
G1 X128.698 Y121.624 E.02003
G1 X128.803 Y122.22 E.02008
G3 X128.811 Y126.052 I-62.16 J2.052 E.12713
G1 X122.189 Y126.052 E.21968
G3 X122.19 Y122.326 I42.983 J-1.844 E.12364
G1 X122.339 Y121.497 E.02791
G1 X122.571 Y120.94 E.02003
G1 X122.902 Y120.434 E.02008
G1 X123.318 Y119.997 E.01998
G1 X123.808 Y119.642 E.02008
G1 X124.353 Y119.382 E.02003
G1 X124.936 Y119.226 E.02003
G1 X125.536 Y119.178 E.01997
G1 X119.448 Y123.496 F30000
G1 F1396
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X121.781 Y124.543 E.07079
G3 X121.817 Y121.959 I14.805 J-1.085 E.08581
G1 X122.063 Y121.066 E.03073
G1 X122.413 Y120.413 E.02457
G1 X120.948 Y118.948 E.06874
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.2
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
G3 Z16.4 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z16.4
G1 Z16.2
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
G1 X127.826 Y120.749 Z16.6 F30000
G1 Z16.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1396
G1 X127.822 Y120.742 E.00026
G2 X126.544 Y119.78 I-2.346 J1.784 E.05373
G1 X122.595 Y123.729 E.18526
G3 X122.742 Y121.574 I5.884 J-.682 E.07204
G3 X123.005 Y121.005 I2.905 J.995 E.02085
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
G1 X126.195 Y119.251 E.02002
G1 X126.771 Y119.431 E.02003
G1 X127.306 Y119.712 E.02003
G1 X127.78 Y120.086 E.02003
G1 X128.178 Y120.54 E.02002
G1 X128.488 Y121.058 E.02003
G1 X128.698 Y121.624 E.02003
G1 X128.803 Y122.22 E.02008
G3 X128.811 Y126.052 I-62.16 J2.052 E.12713
G1 X122.189 Y126.052 E.21968
G3 X122.19 Y122.326 I42.983 J-1.844 E.12364
G1 X122.339 Y121.497 E.02791
G1 X122.571 Y120.94 E.02003
M73 P67 R7
G1 X122.902 Y120.434 E.02008
G1 X123.318 Y119.997 E.01998
G1 X123.808 Y119.642 E.02008
G1 X124.353 Y119.382 E.02003
G1 X124.936 Y119.226 E.02003
M73 P68 R7
G1 X125.536 Y119.178 E.01997
G1 X119.448 Y120.828 F30000
G1 F1396
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.413 Y120.413 E.06874
G1 X121.951 Y121.375 E.03539
G1 X121.781 Y122.369 E.03347
G2 X121.781 Y124.543 I50.669 J1.081 E.07211
G1 X120.272 Y126.052 E.07079
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
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
G3 Z16.6 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z16.6
G1 Z16.4
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
G1 X128.415 Y120.181 Z16.8 F30000
G1 Z16.4
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
G1 X126.195 Y119.251 E.02002
G1 X126.771 Y119.431 E.02003
G1 X127.306 Y119.712 E.02003
G1 X127.78 Y120.086 E.02003
G1 X128.178 Y120.54 E.02002
G1 X128.488 Y121.058 E.02003
G1 X128.698 Y121.624 E.02003
G1 X128.803 Y122.22 E.02008
G3 X128.811 Y126.052 I-62.16 J2.052 E.12713
G1 X122.189 Y126.052 E.21968
G3 X122.19 Y122.326 I42.983 J-1.844 E.12364
G1 X122.339 Y121.497 E.02791
G1 X122.571 Y120.94 E.02003
G1 X122.902 Y120.434 E.02008
G1 X123.318 Y119.997 E.01998
G1 X123.808 Y119.642 E.02008
G1 X124.353 Y119.382 E.02003
G1 X124.936 Y119.226 E.02003
G1 X125.536 Y119.178 E.01997
G1 X119.448 Y123.496 F30000
G1 F1396
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X121.781 Y124.543 E.07079
G3 X121.817 Y121.959 I14.805 J-1.085 E.08581
G1 X122.063 Y121.066 E.03073
G1 X122.413 Y120.413 E.02457
G1 X120.948 Y118.948 E.06874
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.6
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
G3 Z16.8 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z16.8
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1423
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1423
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
G1 X129.937 Y125.681 Z17 F30000
G1 X129.576 Y126.052 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1423
G1 X129.218 Y126.052 E.01188
G1 X129.218 Y124.782 E.04213
G1 X134.552 Y119.448 E.25021
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X127.162 Y119.162 E.01005
G1 X127.812 Y119.576 E.02558
G1 X128.415 Y120.181 E.02832
G1 X128.246 Y126.233 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.423902
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X128.79 Y124.68 E.09459
G1 X128.79 Y123.247 E.08245
G1 X127.815 Y126.03 E.16961
G1 X127.313 Y126.03 E.02887
G1 X128.745 Y121.939 E.24925
G1 X128.662 Y121.574 E.02157
G1 X128.513 Y121.169 E.02479
G1 X126.811 Y126.03 E.29617
G1 X126.308 Y126.03 E.02887
G1 X128.204 Y120.617 E.32984
G1 X127.974 Y120.319 E.02164
G1 X127.852 Y120.19 E.01022
G1 X125.806 Y126.03 E.35583
G1 X125.304 Y126.03 E.02887
G1 X127.468 Y119.853 E.37639
G1 X127.244 Y119.699 E.0156
G1 X127.057 Y119.591 E.01241
G1 X124.802 Y126.03 E.39231
G1 X124.3 Y126.03 E.02887
G1 X126.622 Y119.398 E.40407
G1 X126.166 Y119.267 E.02729
G1 X123.798 Y126.03 E.41206
M73 P69 R7
G1 X123.296 Y126.03 E.02887
G1 X125.686 Y119.206 E.41577
G1 X125.18 Y119.216 E.02908
G1 X122.794 Y126.03 E.41517
G1 X122.291 Y126.03 E.02887
G1 X124.644 Y119.312 E.40932
G1 X124.36 Y119.402 E.01714
G1 X124.066 Y119.528 E.01837
G1 X122.21 Y124.83 E.323
G1 X122.21 Y123.397 E.0824
G1 X123.42 Y119.941 E.21052
G1 X123.156 Y120.179 E.02037
G1 X122.955 Y120.402 E.01727
G1 X122.776 Y120.642 E.01727
G1 X122.619 Y120.898 E.01725
G1 X122.495 Y121.147 E.016
G1 X122.007 Y122.542 E.08495
M106 S252.45
G1 X119.448 Y120.828 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1423
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.413 Y120.413 E.06874
G1 X121.951 Y121.375 E.03539
G1 X121.781 Y122.369 E.03347
G2 X121.781 Y124.543 I50.67 J1.081 E.07211
G1 X120.272 Y126.052 E.07079
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
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
G3 Z17 I.496 J1.111 P1  F30000
G1 X134.898 Y118.602 Z17
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1968
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1968
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
G1 X128.415 Y120.181 Z17.2 F30000
G1 Z16.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1968
G1 X127.813 Y119.577 E.02831
G1 X127.162 Y119.162 E.0256
G1 X127.376 Y118.948 E.01005
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X129.218 Y124.782 E.25021
G1 X129.218 Y126.052 E.04213
G1 X129.576 Y126.052 E.01188
G1 X128.136 Y126.237 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.434605
G1 F1968
G1 X128.826 Y125.546 E.03116
G1 X128.826 Y124.992 E.01768
G1 X127.752 Y126.067 E.0485
G1 X127.198 Y126.067 E.01768
G1 X128.826 Y124.438 E.07351
G1 X128.826 Y123.884 E.01768
G1 X126.644 Y126.067 E.09851
G1 X126.09 Y126.067 E.01768
G1 X128.826 Y123.331 E.12351
G1 X128.826 Y122.777 E.01768
G1 X125.536 Y126.067 E.14852
G1 X124.982 Y126.067 E.01768
G1 X128.818 Y122.231 E.17316
G1 X128.743 Y121.752 E.01548
G1 X124.428 Y126.067 E.19479
G1 X123.874 Y126.067 E.01768
G1 X128.617 Y121.324 E.2141
G1 X128.445 Y120.942 E.01336
G1 X123.32 Y126.067 E.23131
G1 X122.766 Y126.067 E.01768
G1 X128.235 Y120.598 E.24687
G1 X127.993 Y120.286 E.0126
G1 X122.212 Y126.067 E.26094
G1 X122.174 Y126.067 E.00124
G1 X122.174 Y125.552 E.01644
G1 X127.716 Y120.009 E.25019
G1 X127.406 Y119.765 E.01259
G1 X122.173 Y124.998 E.23621
G1 X122.173 Y124.444 E.01768
G1 X127.064 Y119.553 E.22076
G1 X126.683 Y119.381 E.01336
G1 X122.173 Y123.89 E.20355
G1 X122.173 Y123.337 E.01768
G1 X126.258 Y119.252 E.18439
G1 X125.78 Y119.176 E.01545
G1 X122.173 Y122.783 E.16281
G1 X122.185 Y122.217 E.01806
G1 X125.228 Y119.174 E.13737
G1 X124.931 Y119.211 E.00956
G1 X124.543 Y119.305 E.01275
G1 X122.313 Y121.535 E.10065
G1 X122.429 Y121.206 E.01115
G1 X122.559 Y120.931 E.00969
G1 X122.713 Y120.67 E.00969
G1 X122.889 Y120.426 E.00959
G1 X123.02 Y120.274 E.00642
G1 X123.924 Y119.37 E.04079
G1 X119.448 Y123.496 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1968
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X121.781 Y124.543 E.07079
G3 X121.817 Y121.959 I14.808 J-1.085 E.08583
G1 X122.063 Y121.066 E.0307
G1 X122.413 Y120.413 E.02459
G1 X120.948 Y118.948 E.06874
G1 X119.7 Y118.948 E.0414
G1 X119.448 Y119.2 E.01182
G1 X119.448 Y120.828 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17
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
G3 Z17.2 I.028 J1.217 P1  F30000
G1 X134.898 Y118.602 Z17.2
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1969
G1 X134.898 Y122.5 E.1293
G1 X134.898 Y126.398 E.1293
G1 X119.102 Y126.398 E.52398
G1 X119.102 Y118.602 E.2586
G1 X134.838 Y118.602 E.52199
G1 X135.29 Y118.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1969
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
M73 P70 R7
G1 E-.04 F1800
G1 X128.421 Y121.888 Z17.4 F30000
G1 Z17
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1969
G1 X126.102 Y119.569 E.10079
G1 X125.508 Y119.508
G1 X128.484 Y122.484 E.12931
G1 X128.481 Y123.015
G1 X125.014 Y119.547 E.15068
G1 X124.586 Y119.653
G1 X128.481 Y123.548 E.16927
G1 X128.481 Y124.081
G1 X124.204 Y119.804 E.18586
G1 X123.865 Y119.998
G1 X128.481 Y124.615 E.20061
G1 X128.481 Y125.148
G1 X123.559 Y120.226 E.21391
G1 X123.29 Y120.49
G1 X128.481 Y125.681 E.22559
G1 X128.442 Y126.176
G1 X123.053 Y120.786 E.23419
G1 X122.852 Y121.119
G1 X127.909 Y126.176 E.21975
G1 X127.376 Y126.176
G1 X122.691 Y121.491 E.20358
G1 X122.575 Y121.909
G1 X126.842 Y126.176 E.18542
G1 X126.309 Y126.176
G1 X122.518 Y122.385 E.16473
G1 X122.518 Y122.918
G1 X125.776 Y126.176 E.14157
G1 X125.242 Y126.176
G1 X122.518 Y123.451 E.11839
G1 X122.518 Y123.985
G1 X124.709 Y126.176 E.09521
G1 X124.176 Y126.176
G1 X122.518 Y124.518 E.07203
G1 X122.518 Y125.051
G1 X123.643 Y126.176 E.04885
G1 X123.109 Y126.176
G1 X122.519 Y125.585 E.02567
M204 S10000
; WIPE_START
G1 F24000
G1 X123.109 Y126.176 E-.31752
G1 X123.643 Y126.176 E-.20264
G1 X123.196 Y125.729 E-.23984
; WIPE_END
G1 E-.04 F1800
G1 X128.312 Y121.484 Z17.4 F30000
G1 Z17
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.115774
G1 F1969
G1 X128.223 Y121.353 E.00094
; LINE_WIDTH: 0.158489
G1 X128.134 Y121.223 E.00149
; LINE_WIDTH: 0.201205
G1 X128.109 Y121.188 E.00055
; LINE_WIDTH: 0.215112
G1 X128.041 Y121.098 E.00158
; LINE_WIDTH: 0.255453
G2 X127.949 Y120.976 I-2.721 J1.97 E.00266
; LINE_WIDTH: 0.294954
G2 X127.781 Y120.774 I-4.511 J3.572 E.00539
; LINE_WIDTH: 0.354162
G2 X127.231 Y120.222 I-4.798 J4.233 E.01977
; LINE_WIDTH: 0.333884
G2 X127.03 Y120.054 I-3.795 J4.34 E.00623
; LINE_WIDTH: 0.292675
G1 X126.94 Y119.985 E.00229
; LINE_WIDTH: 0.255061
G2 X126.817 Y119.892 I-2.107 J2.659 E.00267
; LINE_WIDTH: 0.220595
G1 X126.723 Y119.827 E.00166
; LINE_WIDTH: 0.180241
G1 X126.63 Y119.762 E.00128
; LINE_WIDTH: 0.139887
G1 X126.509 Y119.682 E.00114
G1 X129.576 Y126.052 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1969
G1 X128.704 Y126.052 E.02896
G1 X128.704 Y125.296 E.02506
G1 X134.552 Y119.448 E.27436
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.774 Y119.55 E.02826
G3 X128.044 Y120.541 I-1.254 J2.918 E.05402
; WIPE_START
G1 F24000
G1 X127.484 Y119.973 E-.30311
G1 X126.774 Y119.55 E-.31401
G1 X127.039 Y119.285 E-.14288
; WIPE_END
G1 E-.04 F1800
G1 X119.56 Y120.806 Z17.4 F30000
G1 X119.448 Y120.828 Z17.4
G1 Z17
G1 E.8 F1800
G1 F1969
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.786 Y120.786 E.08624
G2 X122.295 Y122.385 I2.787 J1.731 E.0561
G1 X122.296 Y124.028 E.0545
G1 X120.272 Y126.052 E.09494
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X119.448 Y125.124 E-.61876
G1 X119.711 Y125.387 E-.14124
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
G3 Z17.4 I.866 J.855 P1  F30000
G1 X122.927 Y122.131 Z17.4
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1263
G1 X122.897 Y122.41 E.00931
G1 X122.898 Y126.398 E.13229
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
G2 X128.094 Y122.376 I-121.102 J-1.77 E.13341
G1 X127.981 Y121.713 E.02233
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
G1 X123.305 Y122.242 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1263
G1 X123.289 Y122.41 E.00519
G1 X123.29 Y126.79 E.13459
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
G2 X127.706 Y122.43 I-186.828 J-2.004 E.13398
G1 X127.622 Y121.869 E.01742
G1 X127.375 Y121.319 E.01853
G1 X126.988 Y120.856 E.01853
G1 X126.491 Y120.515 E.01853
G1 X125.92 Y120.32 E.01853
G1 X125.317 Y120.288 E.01853
G1 X124.729 Y120.419 E.01853
G1 X124.197 Y120.705 E.01853
G1 X123.763 Y121.123 E.01853
G1 X123.458 Y121.644 E.01853
G1 X123.312 Y122.176 E.01697
G1 X123.311 Y122.182 E.00019
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.41 E-.08694
G1 X123.289 Y124.181 E-.67306
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
G1 X122.553 Y123.771 E.107
G3 X122.597 Y121.989 I7.106 J-.715 E.05928
G3 X122.987 Y120.987 I2.149 J.257 E.03606
G1 X120.838 Y118.838 E.10079
G1 X119.922 Y118.838 E.03039
G2 X119.448 Y119.2 I.646 J1.338 E.01992
G1 X119.448 Y120.828 E.05401
; WIPE_START
G1 F24000
G1 X119.448 Y119.2 E-.61876
G1 X119.711 Y118.937 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X127.165 Y120.577 Z17.6 F30000
G1 X127.844 Y120.726 Z17.6
G1 Z17.2
G1 E.8 F1800
G1 F1263
G2 X126.566 Y119.758 I-2.372 J1.805 E.05384
G1 X127.486 Y118.838 E.04317
G1 X128.514 Y118.838 E.0341
G1 X134.552 Y124.876 E.28325
G1 X134.552 Y119.448 E.18005
G1 X128.448 Y125.552 E.28636
G1 X128.448 Y126.052 E.01657
G1 X129.577 Y126.052 E.03744
; CHANGE_LAYER
; Z_HEIGHT: 17.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X128.448 Y126.052 E-.42892
M73 P71 R7
G1 X128.448 Y125.552 E-.18984
G1 X128.71 Y125.29 E-.14124
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
G3 Z17.6 I.584 J-1.068 P1  F30000
G1 X122.928 Y122.127 Z17.6
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1271
G1 X122.897 Y122.412 E.00953
G1 X122.898 Y126.398 E.13221
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
G2 X128.099 Y122.412 I-212.716 J-1.823 E.13222
G1 X127.981 Y121.711 E.02358
G1 X127.678 Y121.071 E.02347
G1 X127.215 Y120.536 E.02347
G1 X126.624 Y120.147 E.02348
G1 X125.947 Y119.93 E.0236
G1 X125.237 Y119.904 E.02358
G1 X124.552 Y120.07 E.02338
G1 X123.928 Y120.419 E.0237
G1 X123.428 Y120.92 E.02348
G1 X123.08 Y121.54 E.02358
G1 X122.934 Y122.067 E.01815
G1 X123.305 Y122.245 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1271
G1 X123.289 Y122.412 E.00517
G1 X123.29 Y126.79 E.13451
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
G2 X127.711 Y122.466 I-645.561 J-2.271 E.13288
G1 X127.621 Y121.868 E.01858
G1 X127.375 Y121.319 E.01849
G1 X126.989 Y120.857 E.01849
G1 X126.493 Y120.516 E.01849
G1 X125.921 Y120.321 E.01858
G1 X125.317 Y120.288 E.01858
G1 X124.733 Y120.418 E.01839
G1 X124.197 Y120.705 E.01868
G1 X123.764 Y121.122 E.01849
G1 X123.458 Y121.644 E.01858
G1 X123.312 Y122.172 E.01683
G1 X123.311 Y122.185 E.00041
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.412 E-.08672
G1 X123.289 Y124.184 E-.67328
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
G1 X122.985 Y120.985 E.11012
G2 X122.554 Y122.335 I3.193 J1.765 E.04732
G1 X122.553 Y123.771 E.04762
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
G1 X127.326 Y125.9 Z17.8 F30000
G1 X129.577 Y126.052 Z17.8
G1 Z17.4
G1 E.8 F1800
G1 F1271
G1 X128.448 Y126.052 E.03744
G1 X128.448 Y125.552 E.01657
G1 X134.552 Y119.448 E.28636
G1 X134.552 Y124.876 E.18005
G1 X128.314 Y118.638 E.29263
G1 X127.686 Y118.638 E.02084
G1 X126.565 Y119.759 E.05256
G3 X127.844 Y120.726 I-1.091 J2.769 E.05384
; CHANGE_LAYER
; Z_HEIGHT: 17.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.422 Y120.259 E-.23892
G1 X126.956 Y119.931 E-.21668
G1 X126.565 Y119.759 E-.16226
G1 X126.83 Y119.494 E-.14213
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
G3 Z17.8 I-.68 J-1.009 P1  F30000
G1 X122.928 Y122.124 Z17.8
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1366
G1 X122.897 Y122.414 E.00968
G1 X122.898 Y126.398 E.13215
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
G2 X128.099 Y122.412 I-211.794 J-1.823 E.13224
G1 X127.98 Y121.71 E.02361
G1 X127.679 Y121.071 E.02343
G1 X127.216 Y120.537 E.02343
G1 X126.626 Y120.148 E.02345
G1 X125.948 Y119.93 E.02364
G1 X125.237 Y119.904 E.0236
G1 X124.555 Y120.069 E.02327
G1 X123.928 Y120.42 E.02381
G1 X123.428 Y120.919 E.02345
G1 X123.08 Y121.54 E.0236
G1 X122.935 Y122.064 E.01805
G1 X123.305 Y122.248 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1366
G1 X123.289 Y122.414 E.00512
G1 X123.29 Y126.79 E.13446
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
G2 X127.711 Y122.465 I-642.532 J-2.27 E.13289
G1 X127.621 Y121.867 E.0186
G1 X127.375 Y121.319 E.01845
G1 X126.99 Y120.858 E.01845
G1 X126.495 Y120.517 E.01846
G1 X125.922 Y120.321 E.01862
G1 X125.317 Y120.288 E.01861
G1 X124.736 Y120.417 E.0183
G1 X124.197 Y120.705 E.01877
G1 X123.764 Y121.122 E.01846
G1 X123.458 Y121.644 E.01861
G1 X123.313 Y122.169 E.01674
G1 X123.311 Y122.188 E.00059
M204 S10000
; WIPE_START
G1 F24000
M73 P71 R6
G1 X123.289 Y122.414 E-.08615
G1 X123.289 Y124.187 E-.67385
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z18 F30000
G1 Z17.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1366
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.10691
G3 X122.598 Y121.984 I7.975 J-.685 E.0595
G3 X122.985 Y120.985 I2.541 J.41 E.03579
G1 X120.957 Y118.957 E.09514
G1 X119.962 Y118.957 E.03299
G1 X119.886 Y118.834 E.00481
G1 X119.778 Y118.87 E.00376
G1 X119.448 Y119.2 E.01549
G1 X119.448 Y120.828 E.05401
M73 P72 R6
G1 X120.311 Y118.524 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.500648
G1 F1366
G1 X133.629 Y118.524 E.49675
G1 X127.844 Y120.726 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1366
G2 X126.565 Y119.759 I-2.367 J1.8 E.05384
G1 X127.367 Y118.957 E.03762
G1 X128.633 Y118.957 E.04199
G1 X134.552 Y124.876 E.27768
G1 X134.552 Y119.448 E.18005
G1 X128.448 Y125.552 E.28636
G1 X128.448 Y126.052 E.01657
G1 X129.577 Y126.052 E.03744
; CHANGE_LAYER
; Z_HEIGHT: 17.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X128.448 Y126.052 E-.42892
G1 X128.448 Y125.552 E-.18984
G1 X128.71 Y125.29 E-.14124
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
G3 Z18 I.585 J-1.067 P1  F30000
G1 X122.929 Y122.121 Z18
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1374
G1 X122.897 Y122.416 E.00983
G1 X122.898 Y126.398 E.1321
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X119.521 Y118.602 E.01391
G1 X119.894 Y118.467 E.01314
G1 X120.102 Y118.021 E.01631
G1 X120.102 Y117.892 E.00429
G1 X133.898 Y117.892 E.45763
G1 X133.898 Y118.021 E.00429
G1 X134.098 Y118.46 E.01599
G1 X134.479 Y118.602 E.01347
G1 X134.898 Y118.602 E.01391
G1 X134.898 Y119.021 E.01391
G1 X134.898 Y126.398 E.24469
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.411 I-211.019 J-1.822 E.13224
G1 X127.98 Y121.709 E.02364
G1 X127.679 Y121.071 E.02339
G1 X127.217 Y120.538 E.02339
G1 X126.628 Y120.149 E.02341
G1 X125.949 Y119.93 E.02369
G1 X125.237 Y119.904 E.02363
G1 X124.558 Y120.068 E.02317
G1 X123.928 Y120.42 E.02392
G1 X123.429 Y120.919 E.02342
G1 X123.08 Y121.54 E.02363
G1 X122.935 Y122.062 E.01796
G1 X123.305 Y122.251 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1374
G1 X123.289 Y122.416 E.00507
G1 X123.29 Y126.79 E.13441
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X119.521 Y118.21 E.02493
G1 X119.637 Y118.168 E.00378
G1 X119.668 Y118.111 E.00198
G1 X119.71 Y118.021 E.00305
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
G2 X127.711 Y122.465 I-640.101 J-2.269 E.13289
G1 X127.621 Y121.866 E.01864
G1 X127.375 Y121.319 E.01842
G1 X126.991 Y120.858 E.01842
G1 X126.497 Y120.518 E.01843
G1 X125.923 Y120.321 E.01865
G1 X125.317 Y120.288 E.01864
G1 X124.738 Y120.416 E.01821
G1 X124.197 Y120.705 E.01887
G1 X123.765 Y121.121 E.01843
G1 X123.458 Y121.644 E.01864
G1 X123.313 Y122.167 E.01665
G1 X123.311 Y122.192 E.00077
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.416 E-.08553
G1 X123.289 Y124.191 E-.67447
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z18.2 F30000
G1 Z17.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1374
G1 X119.448 Y119.2 E.05401
G3 X120.073 Y118.757 I.787 J.447 E.02625
G1 X120.757 Y118.757 E.02267
G1 X122.985 Y120.985 E.10453
G2 X122.551 Y122.408 I3.312 J1.788 E.04967
G1 X122.551 Y123.773 E.04529
G1 X120.272 Y126.052 E.10691
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
G1 X120.418 Y118.324 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50065
G1 F1374
G1 X133.521 Y118.324 E.48874
G1 X129.577 Y126.052 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1374
G1 X128.448 Y126.052 E.03744
G1 X128.448 Y125.552 E.01657
G1 X134.552 Y119.448 E.28636
G1 X134.552 Y124.876 E.18005
G1 X128.433 Y118.757 E.28706
G1 X127.567 Y118.757 E.02872
G1 X126.565 Y119.759 E.047
G3 X127.844 Y120.726 I-1.086 J2.764 E.05384
; CHANGE_LAYER
; Z_HEIGHT: 18
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.425 Y120.261 E-.23773
G1 X126.961 Y119.933 E-.21593
G1 X126.565 Y119.759 E-.1642
G1 X126.83 Y119.494 E-.14213
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
G3 Z18.2 I-.679 J-1.01 P1  F30000
G1 X122.929 Y122.118 Z18.2
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1379
G1 X122.897 Y122.417 E.00997
G1 X122.898 Y126.398 E.13205
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X119.521 Y118.602 E.01391
G1 X119.894 Y118.467 E.01314
G1 X119.954 Y118.409 E.00277
G1 X120.102 Y118.021 E.01376
G1 X120.102 Y117.692 E.01093
G1 X133.898 Y117.692 E.45763
G2 X133.977 Y118.314 I1.19 J.165 E.02104
G1 X134.203 Y118.533 E.01043
G1 X134.479 Y118.602 E.00942
G1 X134.898 Y118.602 E.01391
G1 X134.898 Y119.021 E.01391
G1 X134.898 Y126.398 E.24469
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.411 I-210.252 J-1.822 E.13225
G1 X127.98 Y121.708 E.02367
G1 X127.679 Y121.071 E.02335
G1 X127.218 Y120.539 E.02335
G1 X126.63 Y120.15 E.02338
G1 X125.95 Y119.93 E.02373
G1 X125.237 Y119.904 E.02366
G1 X124.561 Y120.067 E.02306
G1 X123.928 Y120.42 E.02403
G1 X123.529 Y120.795 E.01817
G1 X123.404 Y120.96 E.00685
G1 X123.08 Y121.54 E.02205
G1 X122.936 Y122.059 E.01786
G1 X123.305 Y122.255 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1379
G1 X123.289 Y122.417 E.00502
G1 X123.29 Y126.79 E.13436
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X119.521 Y118.21 E.02493
G1 X119.637 Y118.168 E.00378
G1 X119.668 Y118.111 E.00198
G1 X119.71 Y118.021 E.00305
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
G2 X127.711 Y122.465 I-637.728 J-2.267 E.13289
G1 X127.62 Y121.864 E.01867
G1 X127.375 Y121.319 E.01839
G1 X126.991 Y120.859 E.01839
G1 X126.499 Y120.519 E.0184
G1 X125.924 Y120.321 E.01869
G1 X125.317 Y120.288 E.01867
G1 X124.741 Y120.415 E.01812
G1 X124.197 Y120.705 E.01896
G1 X123.74 Y121.162 E.01984
G1 X123.458 Y121.644 E.01718
G1 X123.314 Y122.164 E.01656
M73 P73 R6
G1 X123.311 Y122.195 E.00096
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.417 E-.08487
G1 X123.289 Y124.194 E-.67514
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
G1 X122.551 Y123.773 E.10691
G3 X122.841 Y121.225 I6.03 J-.605 E.08572
G1 X122.985 Y120.985 E.00928
G1 X120.557 Y118.557 E.11391
G1 X120.253 Y118.557 E.01007
G3 X119.787 Y118.861 I-.49 J-.243 E.01936
G1 X119.448 Y119.2 E.01592
G1 X119.448 Y120.828 E.05401
G1 X120.511 Y118.124 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.500648
G1 F1379
G1 X133.443 Y118.124 E.48236
G1 X127.844 Y120.726 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1379
G2 X126.565 Y119.759 I-2.362 J1.795 E.05384
G1 X127.767 Y118.557 E.05639
G1 X128.233 Y118.557 E.01545
G1 X134.552 Y124.876 E.29644
G1 X134.552 Y119.448 E.18005
G1 X128.448 Y125.552 E.28636
G1 X128.448 Y126.052 E.01657
G1 X129.577 Y126.052 E.03744
; CHANGE_LAYER
; Z_HEIGHT: 18.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.448 Y126.052 E-.42893
G1 X128.448 Y125.552 E-.18983
G1 X128.71 Y125.29 E-.14124
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
G3 Z18.4 I.586 J-1.067 P1  F30000
G1 X122.93 Y122.116 Z18.4
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1391
G1 X122.897 Y122.419 E.01012
G1 X122.898 Y126.398 E.13199
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X119.521 Y118.602 E.01391
G1 X119.894 Y118.467 E.01314
G1 X119.959 Y118.403 E.00305
G1 X120.102 Y118.021 E.0135
G1 X120.102 Y117.492 E.01756
G1 X133.898 Y117.492 E.45763
G1 X133.898 Y118.021 E.01756
G1 X133.967 Y118.296 E.00939
G1 X134.185 Y118.522 E.01043
G1 X134.479 Y118.602 E.01009
G1 X134.898 Y118.602 E.01391
G1 X134.898 Y119.021 E.01391
G1 X134.898 Y126.398 E.24469
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.411 I-209.495 J-1.821 E.13225
G1 X127.979 Y121.707 E.02371
G1 X127.679 Y121.071 E.02331
G1 X127.219 Y120.54 E.02331
G1 X126.632 Y120.151 E.02335
G1 X125.951 Y119.93 E.02377
G1 X125.237 Y119.904 E.02369
G1 X124.564 Y120.066 E.02296
G1 X123.928 Y120.42 E.02415
G1 X123.425 Y120.926 E.02368
G1 X123.08 Y121.54 E.02335
G1 X122.936 Y122.056 E.01777
G1 X123.305 Y122.258 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1391
G1 X123.289 Y122.419 E.00496
G1 X123.29 Y126.79 E.13431
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X119.521 Y118.21 E.02493
G1 X119.637 Y118.168 E.00378
G1 X119.668 Y118.111 E.00198
G1 X119.71 Y118.021 E.00305
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
G1 X135.29 Y119.021 E.02493
G1 X135.29 Y126.79 E.23871
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-635.352 J-2.266 E.13289
G1 X127.62 Y121.863 E.0187
G1 X127.375 Y121.319 E.01836
G1 X126.992 Y120.86 E.01836
G1 X126.5 Y120.52 E.01837
G1 X125.924 Y120.322 E.01872
G1 X125.317 Y120.288 E.0187
G1 X124.744 Y120.414 E.01802
G1 X124.196 Y120.705 E.01906
G1 X123.76 Y121.129 E.01867
G1 X123.457 Y121.645 E.01838
G1 X123.314 Y122.161 E.01647
G1 X123.31 Y122.199 E.00116
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.419 E-.08416
G1 X123.289 Y124.197 E-.67584
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z18.6 F30000
G1 Z18.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1391
G1 X119.448 Y119.2 E.05401
G3 X120.102 Y118.747 I.812 J.473 E.02726
G2 X120.357 Y118.357 I-1.445 J-1.224 E.01548
G1 X122.986 Y120.986 E.12333
G2 X122.551 Y122.411 I3.253 J1.772 E.04977
G1 X122.551 Y123.773 E.04518
G1 X120.272 Y126.052 E.10691
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
G1 X120.518 Y117.924 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50065
G1 F1391
G1 X133.403 Y117.924 E.48058
G1 X129.577 Y126.052 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1391
G1 X128.448 Y126.052 E.03744
G1 X128.448 Y125.552 E.01657
G1 X134.552 Y119.448 E.28636
G1 X134.552 Y124.876 E.18005
G1 X128.033 Y118.357 E.30582
G1 X127.967 Y118.357 E.00218
G1 X126.565 Y119.759 E.06578
G3 X127.844 Y120.726 I-1.082 J2.76 E.05384
; CHANGE_LAYER
; Z_HEIGHT: 18.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X127.427 Y120.263 E-.23657
G1 X126.965 Y119.936 E-.21518
G1 X126.565 Y119.759 E-.16612
G1 X126.829 Y119.495 E-.14213
; WIPE_END
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
G3 Z18.6 I-.681 J-1.009 P1  F30000
G1 X122.928 Y122.127 Z18.6
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1433
G1 X122.897 Y122.421 E.00979
G1 X122.898 Y126.398 E.13193
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X119.521 Y118.602 E.01391
G1 X119.894 Y118.467 E.01314
G1 X119.991 Y118.363 E.00471
G1 X120.102 Y118.021 E.01193
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
G2 X128.099 Y122.411 I-208.734 J-1.821 E.13226
G1 X127.979 Y121.705 E.02374
G1 X127.679 Y121.071 E.02327
G1 X127.22 Y120.541 E.02327
G1 X126.634 Y120.152 E.02331
G1 X125.951 Y119.931 E.02382
G1 X125.237 Y119.904 E.02372
G1 X124.567 Y120.065 E.02286
G1 X123.928 Y120.42 E.02426
G1 X123.424 Y120.927 E.0237
G1 X123.079 Y121.541 E.02337
G1 X122.934 Y122.067 E.01811
G1 X122.934 Y122.067 E0
G1 X123.304 Y122.262 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1433
G1 X123.289 Y122.421 E.00489
G1 X123.29 Y126.79 E.13426
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X119.521 Y118.21 E.02493
G1 X119.637 Y118.168 E.00378
G1 X119.668 Y118.111 E.00198
G1 X119.71 Y118.021 E.00305
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
M73 P74 R6
G1 X135.29 Y119.021 E.02493
G1 X135.29 Y126.79 E.23871
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-632.623 J-2.264 E.13289
G1 X127.62 Y121.862 E.01873
G1 X127.375 Y121.319 E.01832
G1 X126.993 Y120.86 E.01832
G1 X126.502 Y120.521 E.01834
G1 X125.925 Y120.322 E.01875
G1 X125.317 Y120.288 E.01873
G1 X124.747 Y120.413 E.01793
G1 X124.196 Y120.706 E.01915
G1 X123.76 Y121.129 E.01868
G1 X123.457 Y121.645 E.01838
G1 X123.312 Y122.172 E.01677
G1 X123.309 Y122.202 E.00095
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.421 E-.08333
G1 X123.289 Y124.201 E-.67667
; WIPE_END
G1 E-.04 F1800
G1 X120.285 Y118.546 Z18.8 F30000
G1 Z18.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1433
G3 X119.787 Y118.861 I-.638 J-.458 E.02001
G1 X119.448 Y119.2 E.01592
G1 X119.448 Y125.124 E.19651
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.10691
G3 X122.841 Y121.225 I6.042 J-.604 E.08571
G1 X122.986 Y120.986 E.00928
G1 X120.359 Y118.359 E.12324
G3 X120.491 Y118.157 I.246 J.017 E.00837
G1 X122.12 Y118.157 E.05401
G1 X120.534 Y117.724 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50065
G1 F1433
G1 X133.406 Y117.724 E.48008
G1 X127.843 Y120.726 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1433
G2 X126.565 Y119.759 I-2.358 J1.791 E.05384
G1 X128.167 Y118.157 E.07517
G1 X127.833 Y118.157 E.01109
G1 X134.552 Y124.876 E.3152
G1 X134.552 Y119.448 E.18005
G1 X128.448 Y125.552 E.28636
G1 X128.448 Y126.052 E.01657
G1 X129.577 Y126.052 E.03744
; CHANGE_LAYER
; Z_HEIGHT: 18.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.448 Y126.052 E-.42893
G1 X128.448 Y125.552 E-.18983
G1 X128.71 Y125.29 E-.14124
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
G3 Z18.8 I.584 J-1.068 P1  F30000
G1 X122.928 Y122.127 Z18.8
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1450
G1 X122.897 Y122.422 E.00987
G1 X122.898 Y126.398 E.13188
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X119.521 Y118.602 E.01391
G1 X119.894 Y118.467 E.01314
G1 X120.004 Y118.344 E.00547
G1 X120.102 Y118.021 E.0112
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
G2 X128.099 Y122.411 I-208.016 J-1.82 E.13226
G1 X127.979 Y121.704 E.02377
G1 X127.679 Y121.071 E.02323
G1 X127.221 Y120.542 E.02323
G1 X126.634 Y120.152 E.02335
G1 X125.936 Y119.928 E.02435
G1 X125.237 Y119.904 E.02318
G1 X124.57 Y120.064 E.02276
G1 X123.928 Y120.42 E.02437
G1 X123.424 Y120.927 E.02371
G1 X123.079 Y121.541 E.02336
G1 X122.934 Y122.067 E.01808
G1 X122.934 Y122.067 E.00001
G1 X123.303 Y122.266 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1450
G1 X123.289 Y122.422 E.00483
G1 X123.29 Y126.79 E.13421
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X119.521 Y118.21 E.02493
G1 X119.637 Y118.168 E.00378
G1 X119.668 Y118.111 E.00198
G1 X119.71 Y118.021 E.00305
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
G2 X127.711 Y122.465 I-630.261 J-2.263 E.13289
G1 X127.619 Y121.861 E.01876
G1 X127.375 Y121.319 E.01829
G1 X126.994 Y120.861 E.01829
G1 X126.503 Y120.522 E.01833
G1 X125.911 Y120.319 E.01925
G1 X125.317 Y120.288 E.01828
G1 X124.75 Y120.412 E.01784
G1 X124.196 Y120.706 E.01925
G1 X123.76 Y121.13 E.01869
G1 X123.457 Y121.646 E.01837
G1 X123.312 Y122.171 E.01674
G1 X123.309 Y122.206 E.00109
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.422 E-.08254
G1 X123.289 Y124.205 E-.67746
; WIPE_END
G1 E-.04 F1800
G1 X122.32 Y117.957 Z19 F30000
G1 Z18.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1450
G1 X120.691 Y117.957 E.05401
G1 X120.397 Y118.251 E.01379
G1 X120.369 Y118.369 E.00403
G1 X122.987 Y120.987 E.12281
G2 X122.551 Y122.415 I3.242 J1.771 E.04986
G1 X122.551 Y123.773 E.04506
G1 X120.272 Y126.052 E.10691
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y119.2 E.19651
G3 X120.106 Y118.745 I.816 J.477 E.02741
G1 X120.281 Y118.55 E.00868
G1 X120.534 Y117.524 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50065
G1 F1450
G1 X133.406 Y117.524 E.48008
G1 X129.577 Y126.052 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1450
G1 X128.448 Y126.052 E.03744
G1 X128.448 Y125.552 E.01657
G1 X134.552 Y119.448 E.28636
G1 X134.552 Y124.876 E.18005
G1 X127.633 Y117.957 E.32459
G1 X128.367 Y117.957 E.02436
G1 X126.564 Y119.76 E.08458
G3 X127.843 Y120.725 I-1.069 J2.746 E.05384
; CHANGE_LAYER
; Z_HEIGHT: 18.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X127.429 Y120.265 E-.23526
G1 X126.969 Y119.938 E-.21448
G1 X126.564 Y119.76 E-.16811
G1 X126.829 Y119.495 E-.14214
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
G3 Z19 I-.68 J-1.009 P1  F30000
G1 X122.928 Y122.126 Z19
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1686
G1 X122.897 Y122.424 E.00994
G1 X122.898 Y126.398 E.13182
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X119.521 Y118.602 E.01391
G1 X119.894 Y118.467 E.01314
G1 X120.009 Y118.337 E.00578
G1 X120.102 Y118.021 E.0109
G1 X120.102 Y116.892 E.03746
G1 X133.898 Y116.892 E.45763
G1 X133.898 Y118.021 E.03746
G2 X134.162 Y118.508 I.613 J-.018 E.01906
G1 X134.479 Y118.602 E.01095
G1 X134.898 Y118.602 E.01391
G1 X134.898 Y119.021 E.01391
G1 X134.898 Y126.398 E.24469
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.411 I-207.267 J-1.82 E.13227
G1 X127.978 Y121.703 E.02381
G1 X127.679 Y121.071 E.02319
G1 X127.222 Y120.542 E.02319
G1 X126.636 Y120.153 E.02333
G1 X125.934 Y119.927 E.02446
G1 X125.237 Y119.904 E.02313
G1 X124.573 Y120.063 E.02265
G1 X123.927 Y120.42 E.02448
G1 X123.424 Y120.928 E.02372
G1 X123.079 Y121.542 E.02335
G1 X122.934 Y122.066 E.01804
M73 P75 R6
G1 X122.934 Y122.066 E.00001
G1 X123.303 Y122.27 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1686
G1 X123.289 Y122.424 E.00476
G1 X123.29 Y126.79 E.13416
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X119.521 Y118.21 E.02493
G1 X119.637 Y118.168 E.00378
G1 X119.668 Y118.111 E.00198
G1 X119.71 Y118.021 E.00305
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
G2 X127.711 Y122.465 I-627.917 J-2.261 E.1329
G1 X127.619 Y121.86 E.01879
G1 X127.375 Y121.319 E.01826
G1 X126.994 Y120.862 E.01826
G1 X126.505 Y120.522 E.0183
G1 X125.91 Y120.319 E.01934
G1 X125.317 Y120.288 E.01824
G1 X124.752 Y120.411 E.01775
G1 X124.196 Y120.706 E.01935
G1 X123.76 Y121.131 E.01871
G1 X123.457 Y121.646 E.01836
G1 X123.312 Y122.17 E.01671
G1 X123.309 Y122.21 E.00122
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.424 E-.08171
G1 X123.289 Y124.209 E-.67829
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z19.2 F30000
G1 Z18.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1686
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.10691
G3 X122.841 Y121.225 I6.056 J-.602 E.08572
G1 X122.987 Y120.987 E.00926
G1 X121.718 Y119.718 E.05954
G1 X119.902 Y119.718 E.06025
G1 X119.977 Y118.792 E.03083
G2 X119.448 Y119.2 I.172 J.77 E.02289
G1 X119.448 Y120.828 E.05401
G1 X120.534 Y117.324 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.500652
G1 F1686
G1 X133.406 Y117.324 E.48008
G1 X127.843 Y120.725 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1686
G2 X126.564 Y119.76 I-2.345 J1.778 E.05384
G1 X126.606 Y119.718 E.00196
G1 X129.394 Y119.718 E.0925
G1 X134.552 Y124.876 E.24196
G1 X134.552 Y119.448 E.18005
G1 X128.448 Y125.552 E.28636
G1 X128.448 Y126.052 E.01657
G1 X129.577 Y126.052 E.03744
; WIPE_START
G1 F24000
G1 X128.448 Y126.052 E-.42893
G1 X128.448 Y125.552 E-.18983
G1 X128.71 Y125.29 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X125.792 Y118.904 Z19.2 F30000
G1 Z18.8
G1 E.8 F1800
G1 F1686
G1 X127.42 Y118.904 E.05401
G1 X128.16 Y118.164 E.03472
G1 X127.84 Y118.164 E.01062
G1 X128.58 Y118.904 E.03472
G1 X130.208 Y118.904 E.05401
G1 X123.894 Y117.757 F30000
G1 F1686
G1 X133.552 Y117.757 E.32038
G1 X133.552 Y118.015 E.00857
G2 X133.69 Y119.311 I5.867 J.03 E.04332
G1 X120.343 Y119.311 E.44273
G2 X120.448 Y117.757 I-9.522 J-1.422 E.05173
G1 X123.834 Y117.757 E.1123
; CHANGE_LAYER
; Z_HEIGHT: 19
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X121.834 Y117.757 E-.76
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
G3 Z19.2 I-1.18 J.296 P1  F30000
G1 X122.928 Y122.125 Z19.2
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1704
G1 X122.897 Y122.426 E.01002
G1 X122.898 Y126.398 E.13177
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X119.521 Y118.602 E.01391
G1 X119.894 Y118.467 E.01314
G1 X120.02 Y118.32 E.00642
G1 X120.102 Y118.021 E.01027
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
G2 X128.099 Y122.41 I-206.558 J-1.82 E.13227
G1 X128.021 Y121.854 E.01863
G1 X127.951 Y121.642 E.00742
G1 X127.679 Y121.072 E.02096
G1 X127.223 Y120.543 E.02315
G1 X126.638 Y120.154 E.0233
G1 X125.933 Y119.927 E.02457
G1 X125.237 Y119.904 E.02308
G1 X124.576 Y120.062 E.02255
G1 X123.927 Y120.42 E.02459
G1 X123.424 Y120.929 E.02373
G1 X123.079 Y121.542 E.02334
G1 X122.935 Y122.065 E.01801
G1 X122.935 Y122.066 E.00001
G1 X123.303 Y122.273 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1704
G1 X123.289 Y122.426 E.00469
G1 X123.29 Y126.79 E.13411
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X119.521 Y118.21 E.02493
G1 X119.637 Y118.168 E.00378
G1 X119.668 Y118.111 E.00198
G1 X119.71 Y118.021 E.00305
G1 X119.71 Y116.458 E.04804
G1 X119.71 Y116.374 E.00258
G1 X119.71 Y116.3 E.00227
G1 X134.29 Y116.3 E.448
G1 X134.29 Y116.374 E.00227
G1 X134.29 Y116.458 E.00258
G1 X134.29 Y118.021 E.04804
G1 X134.332 Y118.131 E.00362
G1 X134.4 Y118.168 E.00238
G1 X134.479 Y118.21 E.00273
G1 X135.29 Y118.21 E.02493
G1 X135.29 Y119.021 E.02493
G1 X135.29 Y126.79 E.23871
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-625.59 J-2.26 E.1329
G1 X127.592 Y121.799 E.02078
G1 X127.375 Y121.319 E.0162
G1 X126.995 Y120.863 E.01823
G1 X126.507 Y120.523 E.01827
G1 X125.908 Y120.318 E.01943
G1 X125.317 Y120.288 E.01821
G1 X124.755 Y120.41 E.01765
G1 X124.196 Y120.706 E.01944
G1 X123.759 Y121.131 E.01872
G1 X123.457 Y121.646 E.01835
G1 X123.313 Y122.169 E.01668
G1 X123.308 Y122.214 E.00137
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.426 E-.08086
G1 X123.289 Y124.213 E-.67914
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z19.4 F30000
G1 Z19
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1704
G1 X119.448 Y119.2 E.05401
G3 X119.977 Y118.792 I.701 J.362 E.02289
G1 X119.902 Y119.718 E.03084
G1 X121.718 Y119.718 E.06025
G1 X122.988 Y120.988 E.05955
G2 X122.551 Y122.418 I3.211 J1.763 E.04996
G1 X122.551 Y123.773 E.04495
G1 X120.272 Y126.052 E.10691
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
G1 X120.534 Y117.124 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50065
G1 F1704
G1 X133.406 Y117.124 E.48008
G1 X130.208 Y118.904 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1704
G1 X128.58 Y118.904 E.05401
G1 X127.64 Y117.964 E.0441
G1 X128.36 Y117.964 E.02389
G1 X127.42 Y118.904 E.0441
G1 X125.792 Y118.904 E.05401
G1 X122.609 Y117.557 F30000
G1 F1704
G1 X133.552 Y117.557 E.36299
G1 X133.552 Y118.016 E.01522
G2 X133.69 Y119.311 I5.781 J.039 E.0433
G1 X120.343 Y119.311 E.44273
G2 X120.448 Y117.557 I-10.75 J-1.522 E.05836
M73 P75 R5
G1 X122.549 Y117.557 E.0697
; WIPE_START
G1 F24000
G1 X120.549 Y117.557 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.108 Y122.787 Z19.4 F30000
G1 X129.577 Y126.052 Z19.4
G1 Z19
G1 E.8 F1800
G1 F1704
G1 X128.448 Y126.052 E.03744
G1 X128.448 Y125.552 E.01657
G1 X134.552 Y119.448 E.28636
G1 X134.552 Y124.876 E.18005
G1 X129.394 Y119.718 E.24196
G1 X126.606 Y119.718 E.0925
G1 X126.564 Y119.76 E.00197
G3 X127.843 Y120.725 I-1.062 J2.739 E.05384
; CHANGE_LAYER
; Z_HEIGHT: 19.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.431 Y120.267 E-.23405
G1 X126.973 Y119.941 E-.21376
G1 X126.564 Y119.76 E-.17004
G1 X126.606 Y119.718 E-.02261
G1 X126.92 Y119.718 E-.11954
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
G3 Z19.4 I-.594 J-1.062 P1  F30000
G1 X122.968 Y121.929 Z19.4
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
M73 P76 R5
G1 F1720
G1 X122.897 Y122.427 E.0167
G1 X122.898 Y126.398 E.13171
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X119.521 Y118.602 E.01391
G1 X119.893 Y118.467 E.01312
G1 X120.054 Y118.254 E.00886
G1 X120.102 Y118.021 E.00787
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
G2 X128.099 Y122.41 I-205.82 J-1.819 E.13228
G1 X128.021 Y121.853 E.01866
G1 X127.952 Y121.643 E.00732
G1 X127.679 Y121.072 E.02102
G1 X127.224 Y120.544 E.02311
G1 X126.64 Y120.155 E.02328
G1 X125.932 Y119.927 E.02468
G1 X125.238 Y119.904 E.02304
G1 X124.605 Y120.048 E.02154
G1 X124.126 Y120.283 E.01768
G1 X123.709 Y120.608 E.01752
G2 X123.166 Y121.345 I3.05 J2.816 E.03045
G1 X122.979 Y121.854 E.01798
G1 X122.977 Y121.87 E.00052
G1 X123.309 Y122.277 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1720
G1 X123.289 Y122.427 E.00466
G1 X123.29 Y126.79 E.13405
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
G1 X134.332 Y118.131 E.00362
G1 X134.4 Y118.168 E.00238
G1 X134.479 Y118.21 E.00273
G1 X135.29 Y118.21 E.02493
G1 X135.29 Y119.021 E.02493
G1 X135.29 Y126.79 E.23871
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-623.62 J-2.259 E.1329
G1 X127.593 Y121.801 E.02072
G1 X127.375 Y121.319 E.01626
G1 X126.996 Y120.863 E.0182
G1 X126.508 Y120.524 E.01825
G1 X125.907 Y120.318 E.01953
G1 X125.316 Y120.288 E.01817
G1 X124.807 Y120.392 E.01599
G1 X124.367 Y120.593 E.01485
G1 X123.903 Y120.963 E.01825
G1 X123.534 Y121.481 E.01952
G1 X123.347 Y121.989 E.01666
G1 X123.317 Y122.218 E.00708
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.427 E-.08039
G1 X123.289 Y124.216 E-.67961
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z19.6 F30000
G1 Z19.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1720
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.10691
G3 X122.651 Y121.742 I6.726 J-.686 E.06771
G3 X122.978 Y120.978 I2.564 J.646 E.02767
G1 X121.718 Y119.718 E.05912
G1 X119.902 Y119.718 E.06025
G1 X119.977 Y118.792 E.03083
G2 X119.448 Y119.2 I.171 J.769 E.02289
G1 X119.448 Y120.828 E.05401
G1 X120.534 Y116.924 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50065
G1 F1720
G1 X133.406 Y116.924 E.48008
G1 X127.843 Y120.725 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1720
G2 X126.564 Y119.761 I-2.338 J1.771 E.05384
G1 X126.606 Y119.718 E.00198
G1 X129.394 Y119.718 E.0925
G1 X134.552 Y124.876 E.24196
G1 X134.552 Y119.448 E.18005
G1 X128.448 Y125.552 E.28636
G1 X128.448 Y126.052 E.01657
G1 X129.577 Y126.052 E.03744
; WIPE_START
G1 F24000
G1 X128.448 Y126.052 E-.42894
G1 X128.448 Y125.552 E-.18982
G1 X128.71 Y125.29 E-.14124
; WIPE_END
G1 E-.04 F1800
G1 X125.792 Y118.904 Z19.6 F30000
G1 Z19.2
G1 E.8 F1800
G1 F1720
G1 X127.42 Y118.904 E.05401
G1 X128.56 Y117.764 E.05348
G1 X127.44 Y117.764 E.03716
G1 X128.58 Y118.904 E.05348
G1 X130.208 Y118.904 E.05401
G1 X122.53 Y117.357 F30000
G1 F1720
G1 X133.552 Y117.357 E.36561
G1 X133.552 Y118.016 E.02187
G2 X133.69 Y119.311 I5.616 J.056 E.0433
G1 X120.343 Y119.311 E.44273
G2 X120.448 Y117.357 I-11.978 J-1.621 E.06499
G1 X122.47 Y117.357 E.06708
; CHANGE_LAYER
; Z_HEIGHT: 19.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X120.47 Y117.357 E-.76
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
G3 Z19.6 I-1.082 J.558 P1  F30000
G1 X122.928 Y122.124 Z19.6
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1776
G1 X122.897 Y122.429 E.01017
G1 X122.898 Y126.398 E.13166
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X119.521 Y118.602 E.01391
G1 X119.894 Y118.467 E.01313
G1 X120.032 Y118.299 E.00723
G1 X120.102 Y118.021 E.00949
G1 X120.102 Y116.292 E.05737
G1 X133.898 Y116.292 E.45763
G1 X133.898 Y118.021 E.05737
G1 X133.96 Y118.283 E.00892
G1 X134.162 Y118.508 E.01003
G1 X134.479 Y118.602 E.01095
G1 X134.898 Y118.602 E.01391
G1 X134.898 Y119.021 E.01391
G1 X134.898 Y126.398 E.24469
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.41 I-205.088 J-1.819 E.13228
G1 X128.02 Y121.852 E.0187
G1 X127.953 Y121.645 E.00722
G1 X127.679 Y121.072 E.02109
G1 X127.225 Y120.545 E.02307
G1 X126.642 Y120.156 E.02326
G1 X125.93 Y119.927 E.02479
G1 X125.238 Y119.904 E.02299
G1 X124.608 Y120.047 E.02143
G1 X124.126 Y120.283 E.01778
G1 X123.652 Y120.656 E.02004
G1 X123.323 Y121.067 E.01744
G1 X123.079 Y121.542 E.01774
G1 X122.935 Y122.064 E.01795
G1 X122.935 Y122.064 E.00002
G1 X123.302 Y122.282 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1776
G1 X123.289 Y122.429 E.00455
G1 X123.29 Y126.79 E.134
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X119.521 Y118.21 E.02493
G1 X119.637 Y118.168 E.00379
G1 X119.668 Y118.111 E.00198
G1 X119.71 Y118.021 E.00305
G1 X119.71 Y116.058 E.06033
G1 X119.71 Y115.974 E.00258
G1 X119.71 Y115.9 E.00227
G1 X134.29 Y115.9 E.448
G1 X134.29 Y115.974 E.00227
G1 X134.29 Y116.058 E.00258
G1 X134.29 Y118.021 E.06033
G1 X134.332 Y118.131 E.00362
G1 X134.4 Y118.168 E.00238
G1 X134.479 Y118.21 E.00273
G1 X135.29 Y118.21 E.02493
G1 X135.29 Y119.021 E.02493
G1 X135.29 Y126.79 E.23871
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-620.992 J-2.257 E.1329
G1 X127.594 Y121.803 E.02066
G1 X127.374 Y121.319 E.01633
G1 X126.997 Y120.864 E.01816
G1 X126.51 Y120.525 E.01822
G1 X125.906 Y120.318 E.01962
G1 X125.316 Y120.288 E.01814
G1 X124.81 Y120.392 E.0159
G1 X124.367 Y120.593 E.01493
G1 X123.94 Y120.925 E.01662
G1 X123.686 Y121.227 E.01215
G1 X123.457 Y121.647 E.01468
G1 X123.313 Y122.168 E.01663
G1 X123.308 Y122.222 E.00166
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.429 E-.07906
G1 X123.289 Y124.221 E-.68094
; WIPE_END
G1 E-.04 F1800
G1 X121.299 Y118.904 Z19.8 F30000
G1 Z19.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1776
G1 X120.785 Y118.904 E.01706
G2 X120.855 Y117.793 I-6.779 J-.986 E.03697
G1 X121.084 Y117.564 E.01074
G1 X127.24 Y117.564 E.2042
G1 X128.58 Y118.904 E.06287
G1 X127.42 Y118.904 E.03848
G1 X128.76 Y117.564 E.06287
G1 X130.388 Y117.564 E.05401
G1 X128.179 Y121.107 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50982
G1 F1776
G1 X128.094 Y120.924 E.0077
G1 X129.577 Y126.052 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1776
G1 X128.448 Y126.052 E.03744
G1 X128.448 Y125.552 E.01657
G1 X134.552 Y119.448 E.28636
G1 X134.552 Y124.876 E.18005
G1 X129.394 Y119.718 E.24196
M73 P77 R5
G1 X126.606 Y119.718 E.0925
G1 X126.563 Y119.761 E.00199
G3 X127.668 Y120.509 I-1.094 J2.804 E.04464
G1 X127.923 Y120.4 E.00921
G1 X122.202 Y117.157 F30000
G1 F1776
G1 X133.552 Y117.157 E.3765
G2 X133.69 Y119.311 I10.078 J.436 E.07174
G1 X120.343 Y119.311 E.44273
G2 X120.448 Y117.157 I-13.158 J-1.719 E.07162
G1 X122.142 Y117.157 E.05618
G1 X120.534 Y116.724 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50066
G1 F1776
G1 X133.406 Y116.724 E.48009
G1 X119.448 Y120.828 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1776
G1 X119.448 Y119.2 E.05401
G3 X119.977 Y118.792 I.701 J.362 E.02289
G1 X119.902 Y119.718 E.03083
G1 X121.718 Y119.718 E.06025
G1 X122.979 Y120.979 E.05913
G2 X122.553 Y122.356 I3.456 J1.822 E.0481
G1 X122.553 Y123.771 E.04694
G1 X120.272 Y126.052 E.10698
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
G3 Z19.8 I.835 J.885 P1  F30000
G1 X122.906 Y122.373 Z19.8
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1766
G1 X122.897 Y122.431 E.00192
G1 X122.898 Y126.398 E.1316
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X119.521 Y118.602 E.01391
G1 X119.894 Y118.467 E.01313
G1 X120.029 Y118.304 E.00704
G1 X120.102 Y118.021 E.00968
G1 X120.102 Y116.092 E.064
G1 X133.898 Y116.092 E.45763
G1 X133.898 Y118.021 E.064
G1 X133.96 Y118.283 E.00891
G1 X134.162 Y118.508 E.01003
G1 X134.479 Y118.602 E.01095
G1 X134.898 Y118.602 E.01391
G1 X134.898 Y119.021 E.01391
G1 X134.898 Y126.398 E.24469
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.41 I-204.396 J-1.818 E.13229
G1 X128.02 Y121.851 E.01873
G1 X127.954 Y121.647 E.00712
G1 X127.679 Y121.072 E.02115
G1 X127.226 Y120.546 E.02303
G1 X126.669 Y120.167 E.02234
G1 X126.166 Y119.977 E.01782
G1 X125.477 Y119.891 E.02302
G1 X124.788 Y119.991 E.02312
G1 X124.127 Y120.283 E.02397
G1 X123.604 Y120.709 E.02238
G1 X123.28 Y121.137 E.0178
G1 X123 Y121.776 E.02314
G1 X122.915 Y122.314 E.01807
G1 X123.312 Y122.291 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1766
G1 X123.289 Y122.431 E.00436
G1 X123.29 Y126.79 E.13395
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X119.521 Y118.21 E.02493
G1 X119.637 Y118.168 E.00379
G1 X119.668 Y118.111 E.00198
G1 X119.71 Y118.021 E.00305
G1 X119.71 Y115.858 E.06648
G1 X119.71 Y115.774 E.00258
G1 X119.71 Y115.7 E.00227
G1 X134.29 Y115.7 E.448
G1 X134.29 Y115.774 E.00227
G1 X134.29 Y115.858 E.00258
G1 X134.29 Y118.021 E.06648
G1 X134.332 Y118.132 E.00362
G1 X134.4 Y118.168 E.00238
G1 X134.479 Y118.21 E.00273
G1 X135.29 Y118.21 E.02493
G1 X135.29 Y119.021 E.02493
G1 X135.29 Y126.79 E.23871
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-618.719 J-2.256 E.1329
G1 X127.595 Y121.804 E.0206
G1 X127.374 Y121.319 E.01639
G1 X126.998 Y120.865 E.01813
G1 X126.558 Y120.55 E.01659
G1 X126.106 Y120.365 E.01504
G1 X125.522 Y120.28 E.01813
G1 X124.935 Y120.354 E.01816
G1 X124.367 Y120.592 E.01893
G1 X123.941 Y120.924 E.01659
G1 X123.634 Y121.306 E.01505
G1 X123.387 Y121.842 E.01816
G1 X123.322 Y122.231 E.01213
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.431 E-.07673
G1 X123.289 Y124.229 E-.68327
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z20 F30000
G1 Z19.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1766
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.1069
G3 X122.732 Y121.484 I6.299 J-.654 E.07659
G1 X122.978 Y120.978 E.01867
G1 X121.718 Y119.718 E.0591
G1 X120.09 Y119.718 E.05401
G1 X119.946 Y119.323 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.426774
G1 F1766
G1 X119.985 Y118.842 E.0151
G1 X119.498 Y118.998 E.016
G1 X119.526 Y119.152 E.0049
G1 X119.724 Y119.323 E.00818
G1 X119.886 Y119.323 E.00507
G1 X120.534 Y116.524 F30000
; LINE_WIDTH: 0.50064
G1 F1766
G1 X133.406 Y116.524 E.48007
G1 X133.733 Y116.983 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.410228
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X120.47 Y116.983 E.71426
G1 X120.47 Y117.444 E.02478
G1 X133.53 Y117.444 E.70335
G1 X133.53 Y117.904 E.02478
G1 X120.47 Y117.904 E.70335
G3 X120.442 Y118.364 I-2.836 J.062 E.02486
G1 X133.566 Y118.364 E.70676
G1 X133.616 Y118.824 E.02493
G1 X120.405 Y118.824 E.71145
G1 X120.367 Y119.285 E.02487
G1 X133.869 Y119.285 E.72711
M106 S252.45
G1 X134.083 Y119.329 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.41421
; LAYER_HEIGHT: 0.2
G1 F1766
G1 X134.326 Y119.309 E.00737
G1 X134.509 Y119.126 E.00782
G1 X134.509 Y119.021 E.00317
G1 X134.479 Y118.991 E.00129
G1 X134.034 Y118.867 E.01398
G1 X134.077 Y119.269 E.01224
G1 X126.943 Y119.832 F30000
; LINE_WIDTH: 0.5046
G1 F1766
G1 X127.15 Y119.959 E.00913
G1 X128.45 Y123.923 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1766
G1 X128.449 Y125.551 E.05401
G1 X134.282 Y119.718 E.27363
G1 X129.394 Y119.718 E.16213
G1 X134.552 Y124.876 E.24196
G1 X134.552 Y126.052 E.03901
G1 X134.1 Y126.052 E.01501
; CHANGE_LAYER
; Z_HEIGHT: 19.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X134.552 Y126.052 E-.17189
G1 X134.552 Y124.876 E-.44687
G1 X134.289 Y124.613 E-.14124
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
G3 Z20 I.235 J-1.194 P1  F30000
G1 X122.906 Y122.375 Z20
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2267
G1 X122.897 Y122.432 E.00192
G1 X122.898 Y126.398 E.13155
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X119.521 Y118.602 E.01391
G1 X119.894 Y118.467 E.01313
G1 X120.029 Y118.304 E.00704
G1 X120.102 Y118.021 E.00967
G1 X120.102 Y115.892 E.07064
G1 X133.898 Y115.892 E.45763
G1 X133.898 Y118.021 E.07064
G1 X133.96 Y118.283 E.00891
G1 X134.162 Y118.508 E.01004
G1 X134.479 Y118.602 E.01095
G1 X134.898 Y118.602 E.01391
G1 X134.898 Y119.021 E.01391
G1 X134.898 Y126.398 E.24469
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.41 I-203.674 J-1.818 E.13229
G1 X128.02 Y121.85 E.01876
G1 X127.955 Y121.648 E.00702
G1 X127.679 Y121.072 E.02121
G1 X127.227 Y120.547 E.02299
G1 X126.671 Y120.168 E.02232
G1 X126.165 Y119.977 E.01792
G1 X125.478 Y119.891 E.02298
G1 X124.789 Y119.99 E.02309
G1 X124.264 Y120.203 E.01877
G1 X124.076 Y120.322 E.0074
G1 X123.605 Y120.708 E.02021
G1 X123.279 Y121.139 E.0179
G1 X123 Y121.777 E.02311
G1 X122.915 Y122.316 E.0181
G1 X123.311 Y122.295 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2267
G1 X123.289 Y122.432 E.00428
G1 X123.29 Y126.79 E.1339
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X119.521 Y118.21 E.02493
G1 X119.637 Y118.168 E.00379
G1 X119.668 Y118.111 E.00198
G1 X119.71 Y118.021 E.00305
G1 X119.71 Y115.658 E.07262
G1 X119.71 Y115.574 E.00258
G1 X119.71 Y115.5 E.00227
G1 X134.29 Y115.5 E.448
G1 X134.29 Y115.574 E.00227
G1 X134.29 Y115.658 E.00258
G1 X134.29 Y118.021 E.07262
G1 X134.332 Y118.132 E.00362
G1 X134.4 Y118.168 E.00237
G1 X134.479 Y118.21 E.00273
G1 X135.29 Y118.21 E.02493
G1 X135.29 Y119.021 E.02493
G1 X135.29 Y126.79 E.23871
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-616.461 J-2.255 E.1329
G1 X127.596 Y121.806 E.02054
G1 X127.374 Y121.319 E.01645
G1 X126.998 Y120.865 E.0181
G1 X126.56 Y120.551 E.01656
G1 X126.105 Y120.365 E.01513
G1 X125.522 Y120.28 E.01809
G1 X124.936 Y120.354 E.01813
G1 X124.367 Y120.592 E.01896
G1 X123.942 Y120.923 E.01656
M73 P78 R5
G1 X123.633 Y121.307 E.01514
G1 X123.386 Y121.843 E.01813
G1 X123.321 Y122.236 E.01223
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.432 E-.07574
G1 X123.289 Y124.233 E-.68426
; WIPE_END
G1 E-.04 F1800
G1 X120.09 Y119.718 Z20.2 F30000
G1 Z19.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2267
G1 X121.718 Y119.718 E.05401
G1 X122.978 Y120.978 E.0591
G2 X122.55 Y122.421 I2.577 J1.548 E.05047
G1 X122.551 Y123.773 E.04484
G1 X120.272 Y126.052 E.1069
G1 X120.376 Y126.052 E.00344
G1 X119.448 Y125.124 E.04353
G1 X119.448 Y123.496 E.05401
G1 X122.015 Y117.805 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.445384
G1 F2267
G1 X131.925 Y117.805 E.32499
G1 X132.39 Y118.195 F30000
; LINE_WIDTH: 0.419999
G1 F2267
G1 X132.375 Y117.415 E.02396
G1 X121.625 Y117.415 E.33029
G3 X121.609 Y118.195 I-4.017 J.303 E.024
G1 X132.33 Y118.195 E.32944
G1 X132.855 Y118.572 F30000
G1 F2267
G1 X132.766 Y118.187 E.01214
G1 X132.752 Y117.038 E.0353
G1 X121.248 Y117.038 E.35347
G1 X121.248 Y118.021 E.03021
G1 X121.172 Y118.5 E.01488
G1 X121.141 Y118.572 E.00243
G1 X132.795 Y118.572 E.35811
G1 X133.51 Y118.949 F30000
G1 F2267
G3 X133.248 Y118.566 I.842 J-.858 E.01435
G1 X133.138 Y118.121 E.0141
G3 X133.129 Y116.661 I26.208 J-.888 E.04485
G1 X120.871 Y116.661 E.37664
G1 X120.871 Y118.021 E.0418
G1 X120.802 Y118.427 E.01264
G1 X120.704 Y118.652 E.00755
G1 X120.487 Y118.949 E.01131
G1 X133.45 Y118.949 E.39832
G1 X134.277 Y119.326 F30000
G1 F2267
G1 X134.506 Y119.125 E.00936
G1 X134.506 Y118.994 E.00402
G1 X133.997 Y118.86 E.01616
G1 X133.693 Y118.592 E.01246
G1 X133.578 Y118.384 E.0073
G1 X133.506 Y118.021 E.01135
G1 X133.506 Y116.284 E.05338
G1 X120.494 Y116.284 E.39981
G1 X120.494 Y118.021 E.05338
G1 X120.4 Y118.429 E.01286
G1 X120.176 Y118.735 E.01163
G1 X120.088 Y118.801 E.00338
G2 X119.494 Y119.021 I1.86 J5.914 E.01948
G1 X119.523 Y119.154 E.00417
G1 X119.723 Y119.326 E.0081
G1 X134.217 Y119.326 E.44537
G1 X129.576 Y126.052 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2267
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.282 Y119.718 E.27363
G2 X134.552 Y119.634 I-.086 J-.747 E.00945
G1 X134.552 Y124.876 E.1739
G1 X129.394 Y119.718 E.24196
G1 X126.571 Y119.753 E.09365
G3 X127.843 Y120.731 I-1.148 J2.807 E.05385
; CHANGE_LAYER
; Z_HEIGHT: 20
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.436 Y120.271 E-.23325
G1 X126.983 Y119.947 E-.21159
G1 X126.571 Y119.753 E-.17306
G1 X126.945 Y119.748 E-.1421
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
G3 Z20.2 I-.664 J-1.02 P1  F30000
G1 X122.905 Y122.377 Z20.2
G1 Z20
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2405
G1 X122.896 Y122.434 E.00191
G1 X122.898 Y126.398 E.13149
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X119.521 Y118.602 E.01391
G1 X119.894 Y118.467 E.01313
G1 X120.029 Y118.304 E.00705
G1 X120.102 Y118.021 E.00967
G1 X120.102 Y115.692 E.07727
G1 X133.898 Y115.692 E.45763
G1 X133.898 Y118.021 E.07727
G1 X133.96 Y118.283 E.0089
G1 X134.162 Y118.508 E.01004
G1 X134.479 Y118.602 E.01095
G1 X134.898 Y118.602 E.01391
G1 X134.898 Y119.021 E.01391
G1 X134.898 Y126.398 E.24469
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.41 I-202.997 J-1.818 E.1323
G1 X128.019 Y121.849 E.0188
G1 X127.956 Y121.65 E.00692
G1 X127.679 Y121.072 E.02127
G1 X127.228 Y120.548 E.02295
G1 X126.673 Y120.169 E.02229
G1 X126.164 Y119.977 E.01802
G1 X125.478 Y119.891 E.02294
G1 X124.79 Y119.99 E.02306
G1 X124.127 Y120.283 E.02404
G1 X123.605 Y120.708 E.02233
G1 X123.278 Y121.14 E.01799
G1 X123 Y121.778 E.02308
G1 X122.915 Y122.318 E.01813
G1 X123.311 Y122.299 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2405
G1 X123.289 Y122.434 E.0042
G1 X123.29 Y126.79 E.13385
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X119.521 Y118.21 E.02493
G1 X119.637 Y118.168 E.00379
G1 X119.668 Y118.111 E.00198
G1 X119.71 Y118.021 E.00305
G1 X119.71 Y115.458 E.07877
G1 X119.71 Y115.374 E.00258
G1 X119.71 Y115.3 E.00227
G1 X134.29 Y115.3 E.448
G1 X134.29 Y115.374 E.00227
G1 X134.29 Y115.458 E.00258
G1 X134.29 Y118.021 E.07877
G1 X134.332 Y118.132 E.00362
G1 X134.4 Y118.168 E.00237
G1 X134.479 Y118.21 E.00273
G1 X135.29 Y118.21 E.02493
G1 X135.29 Y119.021 E.02493
G1 X135.29 Y126.79 E.23871
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-614.237 J-2.253 E.13291
G1 X127.597 Y121.808 E.02048
G1 X127.374 Y121.319 E.01651
G1 X126.999 Y120.866 E.01807
G1 X126.562 Y120.552 E.01653
G1 X126.104 Y120.364 E.01521
G1 X125.522 Y120.28 E.01806
G1 X124.938 Y120.353 E.0181
G1 X124.367 Y120.592 E.01899
G1 X123.942 Y120.922 E.01653
G1 X123.632 Y121.309 E.01522
G1 X123.386 Y121.844 E.0181
G1 X123.321 Y122.24 E.01234
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.434 E-.07473
G1 X123.289 Y124.237 E-.68527
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z20.4 F30000
G1 Z20
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2405
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.551 Y123.773 E.1069
G3 X122.731 Y121.486 I6.326 J-.653 E.07652
G1 X122.978 Y120.978 E.01874
G1 X121.204 Y119.204 E.08324
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
G1 X127.207 Y120.607 Z20.4 F30000
G1 X127.844 Y120.729 Z20.4
G1 Z20
G1 E.8 F1800
G1 F2405
G2 X126.571 Y119.753 I-2.433 J1.854 E.05386
G1 X127.121 Y119.204 E.02577
G1 X128.879 Y119.204 E.05835
G1 X134.552 Y124.876 E.2661
G1 X134.552 Y119.448 E.18005
G1 X128.449 Y125.551 E.2863
G1 X128.449 Y126.052 E.01661
G1 X129.576 Y126.052 E.0374
G1 X133.686 Y118.981 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2405
G1 X134.005 Y118.662 E.01387
G1 X133.764 Y118.37
G1 X133.152 Y118.981 E.02657
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
G1 X120.391 Y118.144 Z20.4 F30000
G1 Z20
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.127838
G1 F2405
G1 X120.312 Y117.931 E.00157
; WIPE_START
G1 F24000
G1 X120.391 Y118.144 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.009 Y118.621 Z20.4 F30000
G1 X134.052 Y119 Z20.4
G1 Z20
G1 E.8 F1800
; LINE_WIDTH: 0.209969
G1 F2405
G2 X134.223 Y118.822 I-.645 J-.79 E.00337
; LINE_WIDTH: 0.2199
G1 X134.168 Y118.76 E.00119
; LINE_WIDTH: 0.17762
G1 X134.114 Y118.698 E.0009
; CHANGE_LAYER
; Z_HEIGHT: 20.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X134.168 Y118.76 E-.76
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
G3 Z20.4 I-.372 J-1.159 P1  F30000
G1 X122.905 Y122.379 Z20.4
G1 Z20.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1262
G1 X122.896 Y122.436 E.00191
G1 X122.898 Y126.398 E.13144
G1 X119.102 Y126.398 E.12591
M73 P79 R5
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.409 I-202.287 J-1.817 E.13231
G1 X127.976 Y121.695 E.02404
G1 X127.679 Y121.072 E.0229
G1 X127.229 Y120.548 E.02291
G1 X126.674 Y120.17 E.02227
G1 X126.163 Y119.977 E.01812
G1 X125.479 Y119.891 E.0229
G1 X124.791 Y119.99 E.02303
G1 X124.127 Y120.282 E.02407
G1 X123.606 Y120.707 E.02231
G1 X123.277 Y121.142 E.01809
G1 X122.999 Y121.779 E.02305
G1 X122.915 Y122.32 E.01815
G1 X123.31 Y122.303 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1262
G1 X123.289 Y122.436 E.00412
G1 X123.29 Y126.79 E.1338
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-612.016 J-2.252 E.13291
G1 X127.617 Y121.853 E.01901
G1 X127.374 Y121.319 E.01803
G1 X127 Y120.867 E.01804
G1 X126.564 Y120.553 E.0165
G1 X126.103 Y120.364 E.0153
G1 X125.522 Y120.28 E.01803
G1 X124.939 Y120.353 E.01807
G1 X124.368 Y120.592 E.01903
G1 X123.943 Y120.921 E.0165
G1 X123.631 Y121.31 E.01531
G1 X123.386 Y121.844 E.01807
G1 X123.32 Y122.244 E.01245
M204 S10000
; WIPE_START
G1 F24000
G1 X123.289 Y122.436 E-.0737
G1 X123.289 Y124.242 E-.6863
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z20.6 F30000
G1 Z20.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1262
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.975 Y120.975 E.09509
G2 X122.55 Y122.425 I4.097 J1.987 E.05034
G1 X122.551 Y123.773 E.04473
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
G1 X127.326 Y125.9 Z20.6 F30000
G1 X129.576 Y126.052 Z20.6
G1 Z20.2
G1 E.8 F1800
G1 F1262
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.571 Y119.753 E.03776
G3 X127.846 Y120.728 I-1.169 J2.85 E.05386
; CHANGE_LAYER
; Z_HEIGHT: 20.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X127.438 Y120.273 E-.23215
G1 X126.988 Y119.949 E-.21085
G1 X126.571 Y119.753 E-.17499
G1 X126.835 Y119.489 E-.14201
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
G3 Z20.6 I-.721 J-.98 P1  F30000
G1 X122.905 Y122.381 Z20.6
G1 Z20.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.896 Y122.437 E.0019
G1 X122.898 Y126.398 E.13138
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.409 I-201.603 J-1.817 E.13231
G1 X127.975 Y121.694 E.02407
G1 X127.679 Y121.072 E.02286
G1 X127.23 Y120.549 E.02286
G1 X126.676 Y120.171 E.02224
G1 X126.163 Y119.977 E.01821
G1 X125.479 Y119.891 E.02286
G1 X124.793 Y119.989 E.023
G1 X124.128 Y120.282 E.02411
G1 X123.607 Y120.706 E.02228
G1 X123.276 Y121.144 E.01819
G1 X122.999 Y121.78 E.02301
G1 X122.915 Y122.321 E.01818
G1 X123.31 Y122.308 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.288 Y122.437 E.00403
G1 X123.29 Y126.79 E.13375
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-609.718 J-2.251 E.13291
G1 X127.617 Y121.852 E.01904
G1 X127.374 Y121.319 E.018
G1 X127.001 Y120.868 E.018
G1 X126.565 Y120.554 E.01647
G1 X126.102 Y120.364 E.01539
G1 X125.523 Y120.28 E.018
G1 X124.94 Y120.353 E.01804
G1 X124.368 Y120.592 E.01906
G1 X123.944 Y120.921 E.01647
G1 X123.63 Y121.311 E.0154
G1 X123.386 Y121.845 E.01804
G1 X123.319 Y122.249 E.01257
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.437 E-.07265
G1 X123.289 Y124.246 E-.68735
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
G1 X122.551 Y123.773 E.1069
G3 X122.73 Y121.489 I6.355 J-.651 E.07642
G3 X122.975 Y120.975 I2.307 J.786 E.01893
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
G1 X127.171 Y120.58 Z20.8 F30000
G1 X127.846 Y120.728 Z20.8
G1 Z20.4
G1 E.8 F1800
G1 F1260
G2 X126.571 Y119.753 I-2.442 J1.872 E.05386
G1 X127.376 Y118.948 E.03776
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.449 Y125.551 E.2863
M73 P79 R4
G1 X128.449 Y126.052 E.01661
G1 X129.576 Y126.052 E.0374
; CHANGE_LAYER
; Z_HEIGHT: 20.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
M73 P80 R4
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
G3 Z20.8 I.545 J-1.088 P1  F30000
G1 X122.905 Y122.382 Z20.8
G1 Z20.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1261
G1 X122.896 Y122.439 E.00189
G1 X122.898 Y126.398 E.13133
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.409 I-200.901 J-1.816 E.13232
G1 X127.975 Y121.693 E.02411
G1 X127.679 Y121.072 E.02282
G1 X127.231 Y120.55 E.02282
G1 X126.678 Y120.171 E.02222
G1 X126.162 Y119.976 E.01831
G1 X125.479 Y119.891 E.02282
G1 X124.794 Y119.989 E.02296
G1 X124.128 Y120.282 E.02414
G1 X123.607 Y120.706 E.02226
G1 X123.275 Y121.145 E.01828
G1 X122.999 Y121.781 E.02298
G1 X122.914 Y122.323 E.01821
G1 X123.309 Y122.312 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1261
G1 X123.288 Y122.439 E.00395
G1 X123.29 Y126.79 E.1337
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.465 I-607.528 J-2.25 E.13291
G1 X127.616 Y121.851 E.01907
G1 X127.374 Y121.319 E.01797
G1 X127.001 Y120.868 E.01797
G1 X126.567 Y120.555 E.01644
G1 X126.101 Y120.364 E.01548
G1 X125.523 Y120.28 E.01796
G1 X124.941 Y120.352 E.01801
G1 X124.368 Y120.592 E.01909
G1 X123.945 Y120.92 E.01644
G1 X123.63 Y121.313 E.01548
G1 X123.386 Y121.846 E.01801
G1 X123.319 Y122.253 E.01268
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.439 E-.07159
G1 X123.289 Y124.25 E-.68841
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
G1 X122.975 Y120.975 E.09509
G2 X122.55 Y122.428 I4.064 J1.977 E.05046
G1 X122.551 Y123.773 E.04462
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
G1 X126.571 Y119.753 E.03777
G3 X127.846 Y120.728 I-1.164 J2.844 E.05386
; CHANGE_LAYER
; Z_HEIGHT: 20.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X127.441 Y120.275 E-.23096
G1 X126.992 Y119.952 E-.21011
G1 X126.571 Y119.753 E-.17692
G1 X126.835 Y119.489 E-.14201
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
G3 Z21 I-.722 J-.98 P1  F30000
G1 X122.905 Y122.384 Z21
G1 Z20.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.896 Y122.441 E.00189
G1 X122.898 Y126.398 E.13127
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.409 I-200.237 J-1.816 E.13232
G1 X127.975 Y121.692 E.02414
G1 X127.679 Y121.072 E.02278
G1 X127.232 Y120.551 E.02278
G1 X126.68 Y120.172 E.02219
G1 X126.161 Y119.976 E.01841
G1 X125.48 Y119.891 E.02278
G1 X124.795 Y119.989 E.02293
G1 X124.128 Y120.282 E.02418
G1 X123.608 Y120.705 E.02223
G1 X123.274 Y121.147 E.01838
G1 X122.999 Y121.782 E.02295
G1 X122.914 Y122.325 E.01824
G1 X123.309 Y122.317 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.288 Y122.441 E.00386
G1 X123.29 Y126.79 E.13365
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.464 I-605.667 J-2.249 E.13291
G1 X127.616 Y121.85 E.0191
G1 X127.374 Y121.319 E.01794
G1 X127.002 Y120.869 E.01794
G1 X126.569 Y120.556 E.01641
G1 X126.101 Y120.363 E.01556
G1 X125.523 Y120.28 E.01793
G1 X124.942 Y120.352 E.01798
G1 X124.368 Y120.592 E.01912
G1 X123.946 Y120.919 E.01641
G1 X123.629 Y121.314 E.01557
G1 X123.385 Y121.846 E.01798
G1 X123.318 Y122.257 E.01279
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.441 E-.07051
G1 X123.289 Y124.255 E-.68949
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
G1 X122.551 Y123.773 E.1069
G3 X122.729 Y121.491 I6.383 J-.649 E.07635
G3 X122.975 Y120.975 I2.309 J.785 E.019
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
G1 X127.171 Y120.58 Z21.2 F30000
G1 X127.846 Y120.728 Z21.2
G1 Z20.8
G1 E.8 F1800
G1 F1260
G2 X126.571 Y119.753 I-2.437 J1.867 E.05386
G1 X127.376 Y118.948 E.03777
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
M73 P81 R4
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
G3 Z21.2 I.544 J-1.089 P1  F30000
G1 X122.905 Y122.386 Z21.2
G1 Z21
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1261
G1 X122.896 Y122.442 E.00188
G1 X122.898 Y126.398 E.13122
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.409 I-199.58 J-1.816 E.13233
G1 X127.974 Y121.691 E.02418
G1 X127.679 Y121.072 E.02274
G1 X127.233 Y120.552 E.02274
G1 X126.682 Y120.173 E.02217
G1 X126.16 Y119.976 E.01851
G1 X125.48 Y119.891 E.02273
G1 X124.797 Y119.988 E.02289
G1 X124.128 Y120.282 E.02422
G1 X123.609 Y120.704 E.02221
G1 X123.273 Y121.149 E.01848
G1 X122.998 Y121.783 E.02292
G1 X122.914 Y122.327 E.01827
G1 X123.308 Y122.321 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1261
G1 X123.288 Y122.442 E.00377
G1 X123.29 Y126.79 E.1336
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.464 I-603.507 J-2.247 E.13291
G1 X127.616 Y121.849 E.01913
G1 X127.374 Y121.319 E.01791
G1 X127.003 Y120.87 E.01791
G1 X126.571 Y120.557 E.01638
G1 X126.1 Y120.363 E.01565
G1 X125.523 Y120.28 E.0179
G1 X124.944 Y120.352 E.01795
G1 X124.368 Y120.592 E.01916
G1 X123.946 Y120.918 E.01638
G1 X123.628 Y121.316 E.01566
G1 X123.385 Y121.847 E.01795
G1 X123.318 Y122.262 E.01291
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.442 E-.06942
G1 X123.289 Y124.26 E-.69058
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
G1 X120.948 Y118.948 E.0414
G1 X122.975 Y120.975 E.09509
G2 X122.55 Y122.432 I4.033 J1.967 E.05057
G1 X122.551 Y123.773 E.04451
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
G1 X126.571 Y119.753 E.03778
G3 X127.846 Y120.728 I-1.159 J2.839 E.05386
; CHANGE_LAYER
; Z_HEIGHT: 21.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.443 Y120.277 E-.22976
G1 X126.996 Y119.954 E-.20937
G1 X126.571 Y119.753 E-.17886
G1 X126.835 Y119.489 E-.14201
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
G3 Z21.4 I-.709 J-.989 P1  F30000
G1 X122.911 Y122.3 Z21.4
G1 Z21.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.9 Y122.361 E.00204
G1 X122.898 Y126.398 E.13391
G1 X119.102 Y126.398 E.12592
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.409 I-198.926 J-1.815 E.13233
G1 X127.974 Y121.69 E.02421
G1 X127.679 Y121.072 E.0227
G1 X127.234 Y120.553 E.0227
G1 X126.684 Y120.174 E.02214
G1 X126.159 Y119.976 E.0186
G1 X125.48 Y119.891 E.02269
G1 X124.798 Y119.988 E.02286
G1 X124.128 Y120.282 E.02425
G1 X123.61 Y120.703 E.02218
G1 X123.272 Y121.15 E.01857
G1 X123 Y121.772 E.02252
G1 X122.921 Y122.241 E.01578
G1 X123.299 Y122.324 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.292 Y122.361 E.00117
G1 X123.29 Y126.79 E.13608
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.464 I-601.361 J-2.246 E.13291
G1 X127.615 Y121.848 E.01916
G1 X127.374 Y121.319 E.01787
G1 X127.004 Y120.87 E.01787
G1 X126.573 Y120.558 E.01635
G1 X126.099 Y120.363 E.01574
G1 X125.524 Y120.28 E.01787
G1 X124.945 Y120.352 E.01792
G1 X124.368 Y120.592 E.01919
G1 X123.947 Y120.917 E.01635
G1 X123.627 Y121.317 E.01574
G1 X123.386 Y121.844 E.01781
G1 X123.31 Y122.265 E.01313
M204 S10000
; WIPE_START
G1 F24000
G1 X123.292 Y122.361 E-.03723
G1 X123.291 Y124.263 E-.72277
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
G1 X122.554 Y123.77 E.10703
M73 P82 R4
G3 X122.661 Y121.701 I6.346 J-.707 E.06903
G3 X122.975 Y120.975 I5.642 J2.008 E.02627
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
G1 X127.171 Y120.58 Z21.6 F30000
G1 X127.846 Y120.728 Z21.6
G1 Z21.2
G1 E.8 F1800
G1 F1260
G2 X126.571 Y119.753 I-2.432 J1.862 E.05386
G1 X127.376 Y118.948 E.03778
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
G3 Z21.6 I.558 J-1.082 P1  F30000
G1 X122.911 Y122.298 Z21.6
G1 Z21.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1261
G1 X122.9 Y122.359 E.00204
G1 X122.898 Y126.398 E.13399
G1 X119.102 Y126.398 E.12593
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.409 I-198.244 J-1.815 E.13234
G1 X127.974 Y121.689 E.02424
G1 X127.679 Y121.072 E.02266
G1 X127.235 Y120.554 E.02266
G1 X126.685 Y120.175 E.02212
G1 X126.158 Y119.975 E.0187
G1 X125.481 Y119.891 E.02265
G1 X124.799 Y119.988 E.02283
G1 X124.129 Y120.281 E.02429
G1 X123.61 Y120.703 E.02216
G1 X123.271 Y121.152 E.01867
G1 X123 Y121.773 E.02247
G1 X122.921 Y122.239 E.01568
G1 X123.298 Y122.328 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1261
G1 X123.293 Y122.359 E.00096
G1 X123.29 Y126.79 E.13615
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.464 I-599.232 J-2.245 E.13292
G1 X127.615 Y121.847 E.0192
G1 X127.374 Y121.319 E.01784
G1 X127.004 Y120.871 E.01784
G1 X126.574 Y120.559 E.01632
G1 X126.098 Y120.363 E.01583
G1 X125.524 Y120.28 E.01783
G1 X124.946 Y120.351 E.01789
G1 X124.368 Y120.592 E.01922
G1 X123.948 Y120.917 E.01633
G1 X123.626 Y121.319 E.01583
G1 X123.385 Y121.845 E.01778
G1 X123.309 Y122.269 E.01325
M204 S10000
; WIPE_START
G1 F24000
G1 X123.293 Y122.359 E-.03462
G1 X123.292 Y124.268 E-.72538
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
G1 X120.948 Y118.948 E.0414
G1 X122.975 Y120.975 E.09509
G2 X122.554 Y122.347 I4.018 J1.983 E.0478
G1 X122.554 Y123.77 E.04722
G1 X120.272 Y126.052 E.10703
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
G1 X126.571 Y119.754 E.03778
G3 X127.846 Y120.728 I-1.155 J2.834 E.05386
; CHANGE_LAYER
; Z_HEIGHT: 21.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.445 Y120.279 E-.22856
G1 X127.001 Y119.957 E-.20862
G1 X126.571 Y119.754 E-.18081
G1 X126.835 Y119.489 E-.14201
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
G3 Z21.8 I-.708 J-.99 P1  F30000
G1 X122.911 Y122.296 Z21.8
G1 Z21.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.901 Y122.356 E.00204
G1 X122.898 Y126.398 E.13407
G1 X119.102 Y126.398 E.12593
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.408 I-197.599 J-1.815 E.13234
G1 X127.973 Y121.687 E.02428
G1 X127.679 Y121.072 E.02262
G1 X127.236 Y120.555 E.02262
G1 X126.687 Y120.176 E.02209
G1 X126.157 Y119.975 E.0188
G1 X125.481 Y119.891 E.02261
G1 X124.801 Y119.987 E.0228
G1 X124.129 Y120.281 E.02432
G1 X123.611 Y120.702 E.02213
G1 X123.27 Y121.153 E.01877
G1 X123 Y121.773 E.02243
G1 X122.921 Y122.236 E.01559
G1 X123.297 Y122.333 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.293 Y122.357 E.00074
G1 X123.29 Y126.79 E.13623
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.464 I-597.117 J-2.244 E.13292
G1 X127.615 Y121.846 E.01923
G1 X127.374 Y121.319 E.01781
G1 X127.005 Y120.872 E.01781
G1 X126.576 Y120.56 E.01629
G1 X126.097 Y120.363 E.01591
G1 X125.524 Y120.28 E.0178
G1 X124.947 Y120.351 E.01786
G1 X124.369 Y120.592 E.01925
G1 X123.949 Y120.916 E.01629
G1 X123.625 Y121.32 E.01592
G1 X123.385 Y121.845 E.01774
G1 X123.308 Y122.274 E.01338
M204 S10000
; WIPE_START
G1 F24000
G1 X123.293 Y122.357 E-.032
M73 P83 R4
G1 X123.292 Y124.272 E-.728
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
G1 X122.554 Y123.77 E.10704
G1 X122.555 Y122.344 E.04729
G3 X122.975 Y120.975 I4.424 J.609 E.04772
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
G1 X127.171 Y120.58 Z22 F30000
G1 X127.846 Y120.728 Z22
G1 Z21.6
G1 E.8 F1800
G1 F1260
G2 X126.57 Y119.754 I-2.428 J1.857 E.05386
G1 X127.376 Y118.948 E.03779
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
G3 Z22 I.558 J-1.081 P1  F30000
G1 X122.911 Y122.293 Z22
G1 Z21.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1261
G1 X122.901 Y122.354 E.00205
G1 X122.898 Y126.398 E.13414
G1 X119.102 Y126.398 E.12593
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.408 I-196.959 J-1.814 E.13234
G1 X127.973 Y121.686 E.02431
G1 X127.679 Y121.072 E.02258
G1 X127.236 Y120.555 E.02258
G1 X126.689 Y120.177 E.02207
G1 X126.157 Y119.975 E.0189
G1 X125.481 Y119.891 E.02257
G1 X124.802 Y119.987 E.02277
G1 X124.129 Y120.281 E.02436
G1 X123.612 Y120.701 E.02211
G1 X123.269 Y121.155 E.01886
G1 X123 Y121.774 E.02238
G1 X122.921 Y122.234 E.0155
G1 X123.296 Y122.337 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1261
G1 X123.293 Y122.354 E.00053
G1 X123.29 Y126.79 E.1363
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.464 I-595.017 J-2.242 E.13292
G1 X127.614 Y121.845 E.01926
G1 X127.374 Y121.319 E.01777
G1 X127.006 Y120.873 E.01778
G1 X126.578 Y120.561 E.01626
G1 X126.097 Y120.362 E.016
G1 X125.524 Y120.28 E.01777
G1 X124.948 Y120.351 E.01783
G1 X124.369 Y120.592 E.01928
G1 X123.95 Y120.915 E.01627
G1 X123.624 Y121.322 E.01601
G1 X123.385 Y121.846 E.01771
G1 X123.307 Y122.278 E.0135
M204 S10000
; WIPE_START
G1 F24000
G1 X123.293 Y122.354 E-.02939
G1 X123.292 Y124.277 E-.73061
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z22.2 F30000
G1 Z21.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1261
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.975 Y120.975 E.0951
G2 X122.555 Y122.342 I3.989 J1.975 E.04765
G1 X122.554 Y123.77 E.04737
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
G1 X127.326 Y125.9 Z22.2 F30000
G1 X129.576 Y126.052 Z22.2
G1 Z21.8
G1 E.8 F1800
G1 F1261
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.57 Y119.754 E.03779
G3 X127.846 Y120.727 I-1.15 J2.828 E.05387
; CHANGE_LAYER
; Z_HEIGHT: 22
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.448 Y120.281 E-.22737
G1 X127.005 Y119.959 E-.20788
G1 X126.57 Y119.754 E-.18274
G1 X126.835 Y119.489 E-.14201
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
G1 X122.9 Y122.413 Z22.2
G1 Z22
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1259
G1 X122.896 Y122.451 E.00126
G1 X122.898 Y126.398 E.13093
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14546
G1 X128.102 Y126.398 E.22542
G2 X128.097 Y122.389 I-155.548 J-1.79 E.133
G1 X128.025 Y121.87 E.01737
G1 X127.812 Y121.297 E.0203
G1 X127.499 Y120.828 E.01868
G1 X127.046 Y120.4 E.0207
M73 P83 R3
G1 X126.465 Y120.075 E.02206
G1 X125.913 Y119.924 E.01898
G1 X125.227 Y119.906 E.02276
G1 X124.515 Y120.085 E.02437
G1 X123.925 Y120.421 E.02252
G1 X123.44 Y120.905 E.02274
G1 X123.077 Y121.545 E.02438
G1 X122.936 Y122.054 E.01752
M73 P84 R3
G1 X122.906 Y122.353 E.00997
G1 X123.298 Y122.343 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1259
G1 X123.288 Y122.451 E.00331
G1 X123.29 Y126.79 E.13333
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11685
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.664 Y122.038 E.014
G1 X127.499 Y121.545 E.01599
G1 X127.222 Y121.105 E.01596
G1 X126.846 Y120.737 E.01616
G1 X126.391 Y120.468 E.01623
G1 X125.891 Y120.315 E.01609
G1 X125.312 Y120.289 E.01781
G1 X124.699 Y120.43 E.01931
G1 X124.193 Y120.708 E.01773
G1 X123.775 Y121.109 E.0178
G1 X123.455 Y121.65 E.01932
G1 X123.314 Y122.159 E.01623
G1 X123.303 Y122.284 E.00385
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.451 E-.06374
G1 X123.289 Y124.283 E-.69626
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y123.496 Z22.4 F30000
G1 Z22
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1259
G1 X119.448 Y125.124 E.05401
G1 X120.376 Y126.052 E.04353
G1 X120.272 Y126.052 E.00344
G1 X122.552 Y123.772 E.10696
G3 X122.6 Y121.972 I7.818 J-.693 E.05987
G3 X122.989 Y120.989 I2.103 J.265 E.03543
G1 X120.948 Y118.948 E.09574
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
G1 X127.179 Y120.546 Z22.4 F30000
G1 X127.826 Y120.684 Z22.4
G1 Z22
G1 E.8 F1800
G1 F1259
G2 X126.648 Y119.779 I-2.338 J1.823 E.04979
G1 X126.671 Y119.653 E.00424
G1 X127.376 Y118.948 E.03309
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
G3 Z22.4 I.559 J-1.081 P1  F30000
G1 X122.912 Y122.288 Z22.4
G1 Z22.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1261
G1 X122.901 Y122.349 E.00205
G1 X122.898 Y126.398 E.1343
G1 X119.102 Y126.398 E.12593
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14546
G1 X128.102 Y126.398 E.22542
G2 X128.097 Y122.391 I-159.385 J-1.792 E.13293
G1 X128.025 Y121.867 E.01754
G1 X127.811 Y121.297 E.0202
G1 X127.498 Y120.826 E.01877
G1 X127.046 Y120.4 E.02058
G1 X126.467 Y120.076 E.02203
G1 X125.912 Y119.924 E.01908
G1 X125.24 Y119.903 E.0223
G1 X124.651 Y120.033 E.02002
G1 X124.13 Y120.281 E.01915
G1 X123.613 Y120.7 E.02206
G1 X123.267 Y121.158 E.01906
G1 X122.999 Y121.774 E.02227
G1 X122.922 Y122.229 E.01531
G1 X123.294 Y122.346 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1261
G1 X123.293 Y122.35 E.00011
G1 X123.29 Y126.79 E.13644
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11685
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.663 Y122.036 E.01409
G1 X127.499 Y121.545 E.0159
G1 X127.22 Y121.103 E.01605
G1 X126.846 Y120.738 E.01607
G1 X126.393 Y120.469 E.0162
G1 X125.889 Y120.315 E.01618
G1 X125.352 Y120.284 E.01654
G1 X124.848 Y120.379 E.01574
G1 X124.369 Y120.591 E.01611
G1 X123.951 Y120.913 E.0162
G1 X123.622 Y121.324 E.01618
G1 X123.385 Y121.847 E.01764
G1 X123.305 Y122.287 E.01375
M204 S10000
; WIPE_START
G1 F24000
G1 X123.293 Y122.35 E-.02412
G1 X123.292 Y124.286 E-.73588
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z22.6 F30000
G1 Z22.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1261
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.975 Y120.975 E.0951
G2 X122.555 Y122.337 I3.959 J1.967 E.04749
G1 X122.554 Y123.77 E.04752
G1 X120.272 Y126.052 E.10705
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
G1 F1261
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.576 Y119.748 E.03751
G3 X127.857 Y120.723 I-1.115 J2.791 E.05404
; CHANGE_LAYER
; Z_HEIGHT: 22.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
M73 P85 R3
G1 F24000
G1 X127.23 Y120.107 E-.3338
G1 X126.576 Y119.748 E-.28353
G1 X126.842 Y119.482 E-.14267
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
G3 Z22.6 I-.724 J-.978 P1  F30000
G1 X122.904 Y122.399 Z22.6
G1 Z22.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.896 Y122.454 E.00185
G1 X122.898 Y126.398 E.13082
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14546
G1 X128.102 Y126.398 E.22542
G2 X128.097 Y122.393 I-163.477 J-1.795 E.13286
G1 X128.024 Y121.864 E.01771
G1 X127.811 Y121.297 E.0201
G1 X127.496 Y120.824 E.01886
G1 X127.047 Y120.401 E.02047
G1 X126.468 Y120.077 E.02201
G1 X125.911 Y119.923 E.01918
G1 X125.24 Y119.903 E.02225
G1 X124.654 Y120.032 E.01992
G1 X124.13 Y120.281 E.01924
G1 X123.614 Y120.699 E.02204
G1 X123.266 Y121.16 E.01915
G1 X122.999 Y121.775 E.02222
G1 X122.913 Y122.34 E.01896
G1 X123.304 Y122.353 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.288 Y122.454 E.00314
G1 X123.29 Y126.79 E.13323
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.662 Y122.033 E.01417
G1 X127.499 Y121.545 E.01581
G1 X127.219 Y121.101 E.01613
G1 X126.847 Y120.738 E.01597
G1 X126.394 Y120.47 E.01617
G1 X125.888 Y120.315 E.01627
G1 X125.352 Y120.284 E.01651
G1 X124.851 Y120.378 E.01565
G1 X124.369 Y120.591 E.01619
G1 X123.952 Y120.913 E.01618
G1 X123.621 Y121.326 E.01627
G1 X123.384 Y121.847 E.0176
G1 X123.314 Y122.294 E.01389
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.454 E-.06168
G1 X123.289 Y124.292 E-.69832
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
G1 X122.551 Y123.773 E.10692
G3 X122.726 Y121.499 I6.306 J-.658 E.07608
G3 X122.975 Y120.975 I2.311 J.779 E.01927
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
G1 X127.857 Y120.723 Z22.8
G1 Z22.4
G1 E.8 F1800
G1 F1260
G2 X126.576 Y119.748 I-2.923 J2.51 E.05378
G1 X127.376 Y118.948 E.03751
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
G3 Z22.8 I.542 J-1.09 P1  F30000
G1 X122.904 Y122.401 Z22.8
G1 Z22.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1261
G1 X122.896 Y122.456 E.00184
G1 X122.898 Y126.398 E.13077
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14546
G1 X128.102 Y126.398 E.22542
G2 X128.098 Y122.395 I-167.831 J-1.797 E.13278
G1 X128.023 Y121.861 E.01788
G1 X127.811 Y121.297 E.02
G1 X127.494 Y120.822 E.01894
G1 X127.048 Y120.401 E.02035
G1 X126.47 Y120.077 E.02198
G1 X125.909 Y119.923 E.01927
G1 X125.241 Y119.903 E.02219
G1 X124.657 Y120.031 E.01982
G1 X124.13 Y120.28 E.01934
G1 X123.615 Y120.698 E.02201
G1 X123.265 Y121.162 E.01925
G1 X122.999 Y121.775 E.02217
G1 X122.913 Y122.341 E.01901
G1 X123.304 Y122.358 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1261
G1 X123.288 Y122.456 E.00305
G1 X123.29 Y126.79 E.13318
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.662 Y122.03 E.01426
G1 X127.499 Y121.545 E.01571
G1 X127.217 Y121.099 E.01621
G1 X126.848 Y120.738 E.01587
G1 X126.396 Y120.47 E.01614
G1 X125.887 Y120.314 E.01636
G1 X125.352 Y120.284 E.01648
G1 X124.854 Y120.378 E.01556
G1 X124.369 Y120.591 E.01628
G1 X123.953 Y120.912 E.01615
G1 X123.62 Y121.327 E.01635
G1 X123.384 Y121.848 E.01757
G1 X123.313 Y122.298 E.01401
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.456 E-.06056
G1 X123.289 Y124.296 E-.69944
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z23 F30000
G1 Z22.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1261
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.975 Y120.975 E.0951
G2 X122.551 Y122.412 I2.604 J1.55 E.0502
G1 X122.551 Y123.773 E.04515
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
G1 X127.326 Y125.9 Z23 F30000
G1 X129.576 Y126.052 Z23
G1 Z22.6
G1 E.8 F1800
G1 F1261
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
M73 P86 R3
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.579 Y119.749 E.03747
G3 X127.857 Y120.723 I-1.116 J2.789 E.05395
; CHANGE_LAYER
; Z_HEIGHT: 22.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X127.232 Y120.108 E-.33296
G1 X126.579 Y119.749 E-.28324
G1 X126.846 Y119.481 E-.1438
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
G3 Z23 I-.725 J-.978 P1  F30000
G1 X122.904 Y122.403 Z23
G1 Z22.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.896 Y122.457 E.00184
G1 X122.898 Y126.398 E.13071
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14546
G1 X128.102 Y126.398 E.22542
G2 X128.098 Y122.397 I-172.495 J-1.8 E.13271
G1 X128.022 Y121.858 E.01805
G1 X127.811 Y121.297 E.0199
G1 X127.493 Y120.82 E.01903
G1 X127.048 Y120.402 E.02023
G1 X126.471 Y120.078 E.02196
G1 X125.908 Y119.923 E.01937
G1 X125.241 Y119.903 E.02214
G1 X124.66 Y120.03 E.01972
G1 X124.13 Y120.28 E.01943
G1 X123.615 Y120.698 E.02199
G1 X123.264 Y121.163 E.01935
G1 X122.999 Y121.775 E.02212
G1 X122.913 Y122.343 E.01905
G1 X123.303 Y122.362 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.288 Y122.457 E.00296
G1 X123.29 Y126.79 E.13313
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.661 Y122.027 E.01434
G1 X127.499 Y121.545 E.01562
G1 X127.216 Y121.097 E.01629
G1 X126.848 Y120.739 E.01578
G1 X126.397 Y120.471 E.01611
G1 X125.886 Y120.314 E.01644
G1 X125.351 Y120.284 E.01644
G1 X124.857 Y120.377 E.01546
G1 X124.369 Y120.591 E.01636
G1 X123.954 Y120.911 E.01612
G1 X123.62 Y121.329 E.01644
G1 X123.384 Y121.848 E.01753
G1 X123.312 Y122.303 E.01414
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.457 E-.05943
G1 X123.289 Y124.301 E-.70057
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
G3 X122.725 Y121.501 I6.336 J-.657 E.076
G3 X122.975 Y120.975 I2.312 J.777 E.01935
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
G1 X127.857 Y120.723 Z23.2
G1 Z22.8
G1 E.8 F1800
G1 F1260
G2 X126.576 Y119.748 I-2.906 J2.49 E.05378
G1 X127.376 Y118.948 E.03753
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
G3 Z23.2 I.541 J-1.09 P1  F30000
G1 X122.904 Y122.404 Z23.2
G1 Z23
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1261
G1 X122.896 Y122.459 E.00183
G1 X122.898 Y126.398 E.13066
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14546
G1 X128.102 Y126.398 E.22542
G2 X128.098 Y122.399 I-177.526 J-1.803 E.13264
G1 X128.022 Y121.855 E.01823
G1 X127.811 Y121.297 E.0198
G1 X127.491 Y120.818 E.01912
G1 X127.049 Y120.402 E.02012
G1 X126.473 Y120.078 E.02194
G1 X125.907 Y119.923 E.01947
G1 X125.241 Y119.903 E.02209
G1 X124.663 Y120.029 E.01962
G1 X124.131 Y120.28 E.01953
G1 X123.616 Y120.697 E.02197
G1 X123.263 Y121.165 E.01945
G1 X122.999 Y121.776 E.02207
G1 X122.913 Y122.345 E.0191
G1 X123.303 Y122.367 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1261
G1 X123.288 Y122.459 E.00287
G1 X123.29 Y126.79 E.13308
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.661 Y122.025 E.01443
G1 X127.499 Y121.546 E.01553
G1 X127.214 Y121.095 E.01637
G1 X126.849 Y120.739 E.01568
G1 X126.399 Y120.472 E.01608
G1 X125.885 Y120.314 E.01653
G1 X125.351 Y120.284 E.01641
G1 X124.86 Y120.376 E.01537
G1 X124.37 Y120.591 E.01644
G1 X123.955 Y120.91 E.01609
G1 X123.619 Y121.33 E.01653
G1 X123.384 Y121.849 E.0175
G1 X123.312 Y122.307 E.01426
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.459 E-.05832
G1 X123.289 Y124.306 E-.70168
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z23.4 F30000
G1 Z23
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1261
G1 X119.448 Y119.2 E.05401
M73 P87 R3
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.975 Y120.975 E.0951
G2 X122.551 Y122.415 I2.6 J1.549 E.05031
G1 X122.551 Y123.773 E.04504
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
G1 F1261
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.576 Y119.748 E.03753
G3 X127.856 Y120.722 I-1.618 J3.455 E.05378
; CHANGE_LAYER
; Z_HEIGHT: 23.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.234 Y120.109 E-.33211
G1 X126.576 Y119.748 E-.28516
G1 X126.841 Y119.483 E-.14273
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
G3 Z23.4 I-.726 J-.977 P1  F30000
G1 X122.904 Y122.406 Z23.4
G1 Z23.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.896 Y122.461 E.00183
G1 X122.898 Y126.398 E.1306
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.098 Y122.401 I-182.839 J-1.806 E.13257
G1 X128.021 Y121.852 E.0184
G1 X127.811 Y121.297 E.01969
G1 X127.489 Y120.816 E.01921
G1 X127.05 Y120.403 E.02
G1 X126.474 Y120.079 E.02191
G1 X125.905 Y119.922 E.01956
G1 X125.241 Y119.903 E.02204
G1 X124.666 Y120.028 E.01953
G1 X124.131 Y120.28 E.01963
G1 X123.617 Y120.696 E.02194
G1 X123.262 Y121.167 E.01954
G1 X122.999 Y121.776 E.02203
G1 X122.913 Y122.347 E.01915
G1 X123.302 Y122.371 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.288 Y122.461 E.00278
G1 X123.29 Y126.79 E.13303
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.66 Y122.022 E.01452
G1 X127.499 Y121.546 E.01544
G1 X127.213 Y121.093 E.01645
G1 X126.849 Y120.74 E.01559
G1 X126.4 Y120.472 E.01605
G1 X125.883 Y120.314 E.01662
G1 X125.362 Y120.285 E.01606
G1 X124.862 Y120.375 E.01559
G1 X124.37 Y120.591 E.01653
G1 X123.955 Y120.909 E.01606
G1 X123.618 Y121.332 E.01661
G1 X123.384 Y121.85 E.01747
G1 X123.311 Y122.312 E.01438
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.461 E-.05721
G1 X123.289 Y124.31 E-.70279
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
G1 X122.551 Y123.773 E.10691
G3 X122.725 Y121.503 I6.365 J-.655 E.07593
G3 X122.975 Y120.975 I2.313 J.775 E.01942
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
G1 X127.173 Y120.573 Z23.6 F30000
G1 X127.856 Y120.722 Z23.6
G1 Z23.2
G1 E.8 F1800
G1 F1260
G2 X126.576 Y119.748 I-2.89 J2.471 E.05378
G1 X127.376 Y118.948 E.03754
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
G3 Z23.6 I.541 J-1.09 P1  F30000
G1 X122.904 Y122.408 Z23.6
G1 Z23.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1261
G1 X122.896 Y122.462 E.00182
G1 X122.898 Y126.398 E.13055
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.098 Y122.403 I-188.561 J-1.809 E.13251
G1 X128.02 Y121.849 E.01857
G1 X127.811 Y121.297 E.01959
G1 X127.488 Y120.814 E.0193
G1 X127.051 Y120.403 E.01988
G1 X126.475 Y120.08 E.02189
G1 X125.904 Y119.922 E.01966
G1 X125.241 Y119.903 E.02199
G1 X124.669 Y120.027 E.01943
G1 X124.131 Y120.28 E.01972
G1 X123.618 Y120.696 E.02192
G1 X123.261 Y121.168 E.01963
G1 X122.998 Y121.776 E.02198
G1 X122.913 Y122.349 E.01919
G1 X123.302 Y122.376 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1261
G1 X123.288 Y122.462 E.00269
G1 X123.29 Y126.79 E.13298
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.659 Y122.019 E.0146
G1 X127.499 Y121.546 E.01535
G1 X127.211 Y121.091 E.01653
G1 X126.85 Y120.74 E.01549
G1 X126.402 Y120.473 E.01602
M73 P87 R2
G1 X125.882 Y120.314 E.0167
G1 X125.361 Y120.285 E.01603
M73 P88 R2
G1 X124.865 Y120.374 E.01549
G1 X124.37 Y120.591 E.01661
G1 X123.956 Y120.908 E.01603
G1 X123.617 Y121.333 E.0167
G1 X123.384 Y121.85 E.01743
G1 X123.311 Y122.316 E.01451
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.462 E-.05611
G1 X123.289 Y124.315 E-.70389
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z23.8 F30000
G1 Z23.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1261
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.975 Y120.975 E.0951
G2 X122.551 Y122.418 I2.595 J1.547 E.05043
G1 X122.551 Y123.773 E.04493
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
G1 X127.326 Y125.9 Z23.8 F30000
G1 X129.576 Y126.052 Z23.8
G1 Z23.4
G1 E.8 F1800
G1 F1261
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.576 Y119.748 E.03754
G3 X127.856 Y120.722 I-1.102 J2.778 E.05404
; CHANGE_LAYER
; Z_HEIGHT: 23.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.235 Y120.111 E-.33128
G1 X126.576 Y119.748 E-.28596
G1 X126.841 Y119.483 E-.14277
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
G3 Z23.8 I-.726 J-.977 P1  F30000
G1 X122.904 Y122.41 Z23.8
G1 Z23.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.896 Y122.464 E.00182
G1 X122.898 Y126.398 E.13049
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.405 I-194.712 J-1.813 E.13244
G1 X128.02 Y121.846 E.01873
G1 X127.811 Y121.297 E.01949
G1 X127.486 Y120.811 E.01939
G1 X127.051 Y120.404 E.01977
G1 X126.477 Y120.08 E.02187
G1 X125.903 Y119.922 E.01975
G1 X125.242 Y119.902 E.02194
G1 X124.672 Y120.026 E.01933
G1 X124.131 Y120.28 E.01982
G1 X123.618 Y120.695 E.02189
G1 X123.26 Y121.17 E.01973
G1 X122.998 Y121.777 E.02193
G1 X122.913 Y122.35 E.01924
G1 X123.301 Y122.38 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.288 Y122.464 E.00261
G1 X123.29 Y126.79 E.13292
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.659 Y122.016 E.01469
G1 X127.499 Y121.546 E.01526
G1 X127.209 Y121.089 E.01662
G1 X126.85 Y120.74 E.01539
G1 X126.362 Y120.455 E.01738
G1 X125.881 Y120.313 E.0154
G1 X125.351 Y120.284 E.01632
G1 X124.828 Y120.385 E.01635
G1 X124.37 Y120.591 E.01543
G1 X123.925 Y120.94 E.01738
G1 X123.616 Y121.334 E.0154
G1 X123.383 Y121.851 E.0174
G1 X123.31 Y122.321 E.01463
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.464 E-.05502
G1 X123.289 Y124.319 E-.70498
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
G1 X122.551 Y123.773 E.10691
G3 X122.724 Y121.505 I6.395 J-.653 E.07585
G3 X122.975 Y120.975 I2.314 J.774 E.01949
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
G1 X127.173 Y120.573 Z24 F30000
G1 X127.856 Y120.722 Z24
G1 Z23.6
G1 E.8 F1800
G1 F1260
G1 X127.854 Y120.719 E.00011
G2 X126.576 Y119.749 I-2.874 J2.457 E.05367
G1 X127.376 Y118.948 E.03755
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
G3 Z24 I.54 J-1.091 P1  F30000
G1 X122.904 Y122.412 Z24
G1 Z23.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1261
G1 X122.896 Y122.466 E.00181
G1 X122.898 Y126.398 E.13044
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.407 I-201.276 J-1.817 E.13237
G1 X128.019 Y121.843 E.0189
G1 X127.811 Y121.297 E.01939
G1 X127.484 Y120.809 E.01947
G1 X127.052 Y120.404 E.01965
G1 X126.478 Y120.081 E.02185
G1 X125.901 Y119.922 E.01985
G1 X125.242 Y119.902 E.02189
G1 X124.675 Y120.025 E.01924
G1 X124.132 Y120.28 E.01991
M73 P89 R2
G1 X123.619 Y120.694 E.02187
G1 X123.259 Y121.171 E.01983
G1 X122.998 Y121.777 E.02188
G1 X122.913 Y122.352 E.01929
G1 X123.301 Y122.385 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1261
G1 X123.288 Y122.466 E.00252
G1 X123.29 Y126.79 E.13287
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.658 Y122.014 E.01477
G1 X127.499 Y121.546 E.01517
G1 X127.234 Y121.12 E.01542
G1 X126.851 Y120.741 E.01657
G1 X126.363 Y120.456 E.01735
G1 X125.88 Y120.313 E.01549
G1 X125.351 Y120.284 E.01629
G1 X124.831 Y120.385 E.01626
G1 X124.37 Y120.591 E.01551
G1 X123.925 Y120.939 E.01736
G1 X123.615 Y121.336 E.01548
G1 X123.383 Y121.851 E.01736
G1 X123.31 Y122.325 E.01475
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.466 E-.05395
G1 X123.289 Y124.324 E-.70605
; WIPE_END
G1 E-.04 F1800
G1 X119.448 Y120.828 Z24.2 F30000
G1 Z23.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1261
G1 X119.448 Y119.2 E.05401
G1 X119.7 Y118.948 E.01182
G1 X120.948 Y118.948 E.0414
G1 X122.975 Y120.975 E.0951
G2 X122.551 Y122.422 I2.591 J1.546 E.05054
G1 X122.551 Y123.773 E.04482
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
G1 X127.326 Y125.9 Z24.2 F30000
G1 X129.576 Y126.052 Z24.2
G1 Z23.8
G1 E.8 F1800
G1 F1261
G1 X128.449 Y126.052 E.0374
G1 X128.449 Y125.551 E.01661
G1 X134.552 Y119.448 E.2863
G1 X134.552 Y124.876 E.18005
G1 X128.624 Y118.948 E.27809
G1 X127.376 Y118.948 E.0414
G1 X126.575 Y119.749 E.03756
G3 X127.856 Y120.722 I-1.094 J2.767 E.05403
; CHANGE_LAYER
; Z_HEIGHT: 24
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.237 Y120.112 E-.33038
G1 X126.575 Y119.749 E-.28678
G1 X126.841 Y119.483 E-.14284
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
G3 Z24.2 I-.727 J-.976 P1  F30000
G1 X122.904 Y122.413 Z24.2
G1 Z24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.896 Y122.467 E.00181
G1 X122.898 Y126.398 E.13038
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X125.35 Y118.602 E.20727
G1 X134.898 Y118.602 E.31671
G1 X134.898 Y126.398 E.2586
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.409 I-208.598 J-1.821 E.13231
G1 X128.018 Y121.84 E.01907
G1 X127.811 Y121.297 E.01929
G1 X127.482 Y120.807 E.01956
G1 X127.053 Y120.405 E.01953
G1 X126.48 Y120.081 E.02183
G1 X125.9 Y119.921 E.01994
G1 X125.242 Y119.902 E.02183
G1 X124.678 Y120.024 E.01914
G1 X124.132 Y120.279 E.02001
G1 X123.62 Y120.693 E.02184
G1 X123.258 Y121.173 E.01993
G1 X122.998 Y121.777 E.02183
G1 X122.913 Y122.354 E.01934
G1 X123.3 Y122.389 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.288 Y122.467 E.00243
G1 X123.29 Y126.79 E.13282
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X125.35 Y118.21 E.20404
G1 X135.29 Y118.21 E.30542
G1 X135.29 Y126.79 E.26364
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.658 Y122.011 E.01486
G1 X127.499 Y121.546 E.01508
G1 X127.233 Y121.118 E.0155
G1 X126.851 Y120.741 E.01648
G1 X126.365 Y120.456 E.01733
G1 X125.879 Y120.313 E.01557
G1 X125.35 Y120.284 E.01625
G1 X124.834 Y120.384 E.01616
G1 X124.37 Y120.591 E.0156
G1 X123.926 Y120.938 E.01733
G1 X123.614 Y121.337 E.01557
G1 X123.383 Y121.852 E.01733
G1 X123.309 Y122.33 E.01487
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.467 E-.0529
G1 X123.289 Y124.328 E-.7071
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
G1 X122.551 Y123.773 E.10691
G3 X122.723 Y121.507 I6.425 J-.652 E.07578
G3 X122.975 Y120.975 I2.314 J.772 E.01957
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
G1 X127.173 Y120.574 Z24.4 F30000
G1 X127.856 Y120.722 Z24.4
G1 Z24
G1 E.8 F1800
G1 F1260
G2 X126.575 Y119.749 I-2.37 J1.788 E.05403
G1 X127.376 Y118.948 E.03756
G1 X128.624 Y118.948 E.0414
G1 X134.552 Y124.876 E.27809
G1 X134.552 Y119.448 E.18005
G1 X128.449 Y125.551 E.2863
G1 X128.449 Y126.052 E.01661
M73 P90 R2
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
G3 Z24.4 I.54 J-1.091 P1  F30000
G1 X122.904 Y122.415 Z24.4
G1 Z24.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1262
G1 X122.896 Y122.469 E.0018
G1 X122.898 Y126.398 E.13033
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.099 Y122.411 I-216.293 J-1.825 E.13224
G1 X128.018 Y121.837 E.01924
G1 X127.811 Y121.297 E.01919
G1 X127.481 Y120.805 E.01965
G1 X127.053 Y120.405 E.01941
G1 X126.481 Y120.082 E.0218
G1 X125.899 Y119.921 E.02004
G1 X125.242 Y119.902 E.02178
G1 X124.681 Y120.023 E.01904
G1 X124.132 Y120.279 E.0201
G1 X123.62 Y120.693 E.02182
G1 X123.257 Y121.175 E.02002
G1 X122.998 Y121.778 E.02177
G1 X122.913 Y122.356 E.01939
G1 X123.3 Y122.393 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1262
G1 X123.288 Y122.469 E.00235
G1 X123.29 Y126.79 E.13277
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.657 Y122.008 E.01494
G1 X127.5 Y121.546 E.01499
G1 X127.231 Y121.116 E.01558
G1 X126.852 Y120.742 E.01638
G1 X126.366 Y120.457 E.0173
G1 X125.877 Y120.313 E.01566
G1 X125.35 Y120.284 E.01622
G1 X124.837 Y120.383 E.01607
G1 X124.37 Y120.59 E.01568
G1 X123.927 Y120.937 E.0173
G1 X123.613 Y121.339 E.01565
G1 X123.383 Y121.852 E.01729
G1 X123.309 Y122.334 E.01499
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.469 E-.05186
G1 X123.289 Y124.333 E-.70814
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
G1 X122.975 Y120.975 E.0951
G2 X122.551 Y122.425 I2.587 J1.545 E.05065
G1 X122.551 Y123.773 E.04471
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
G1 X126.575 Y119.749 E.03757
G3 X127.855 Y120.722 I-1.085 J2.756 E.05403
; CHANGE_LAYER
; Z_HEIGHT: 24.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X127.239 Y120.113 E-.32948
G1 X126.575 Y119.749 E-.28761
G1 X126.841 Y119.483 E-.14291
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
G3 Z24.6 I-.727 J-.976 P1  F30000
G1 X122.904 Y122.417 Z24.6
G1 Z24.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.896 Y122.471 E.0018
G1 X122.898 Y126.398 E.13027
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.413 I-224.704 J-1.83 E.13218
G1 X128.017 Y121.834 E.0194
G1 X127.811 Y121.297 E.01909
G1 X127.479 Y120.803 E.01975
G1 X127.054 Y120.406 E.01929
G1 X126.483 Y120.083 E.02178
G1 X125.897 Y119.921 E.02014
G1 X125.243 Y119.902 E.02173
G1 X124.684 Y120.022 E.01895
G1 X124.132 Y120.279 E.0202
G1 X123.621 Y120.692 E.02179
G1 X123.256 Y121.176 E.02012
G1 X122.998 Y121.778 E.02172
G1 X122.912 Y122.358 E.01943
G1 X123.299 Y122.398 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.288 Y122.471 E.00227
G1 X123.29 Y126.79 E.13272
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.657 Y122.005 E.01503
G1 X127.5 Y121.547 E.0149
G1 X127.229 Y121.114 E.01567
G1 X126.852 Y120.742 E.01628
G1 X126.368 Y120.457 E.01727
G1 X125.876 Y120.313 E.01574
G1 X125.35 Y120.284 E.01619
G1 X124.839 Y120.382 E.01598
G1 X124.371 Y120.59 E.01577
G1 X123.928 Y120.937 E.01727
G1 X123.612 Y121.34 E.01574
G1 X123.383 Y121.853 E.01726
G1 X123.308 Y122.338 E.0151
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.471 E-.05085
G1 X123.289 Y124.337 E-.70915
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
G1 X122.551 Y123.773 E.10691
G3 X122.722 Y121.509 I6.455 J-.65 E.0757
G3 X122.975 Y120.975 I2.315 J.771 E.01964
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
G1 X127.173 Y120.574 Z24.8 F30000
G1 X127.855 Y120.723 Z24.8
G1 Z24.4
G1 E.8 F1800
G1 F1260
G2 X126.575 Y119.749 I-2.361 J1.777 E.05403
G1 X127.376 Y118.948 E.03757
M73 P91 R2
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
G3 Z24.8 I.539 J-1.091 P1  F30000
G1 X122.904 Y122.419 Z24.8
G1 Z24.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1262
G1 X122.896 Y122.472 E.00179
G1 X122.898 Y126.398 E.13022
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.415 I-233.865 J-1.836 E.13211
G1 X128.016 Y121.831 E.01957
G1 X127.811 Y121.297 E.01898
G1 X127.477 Y120.801 E.01984
G1 X127.055 Y120.406 E.01918
G1 X126.484 Y120.083 E.02176
G1 X125.896 Y119.921 E.02024
G1 X125.243 Y119.902 E.02168
G1 X124.687 Y120.021 E.01885
G1 X124.132 Y120.279 E.02029
G1 X123.622 Y120.691 E.02177
G1 X123.255 Y121.178 E.02022
G1 X122.998 Y121.778 E.02167
G1 X122.912 Y122.359 E.01948
G1 X123.299 Y122.402 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1262
G1 X123.288 Y122.472 E.00219
G1 X123.29 Y126.79 E.13267
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.656 Y122.003 E.01511
G1 X127.5 Y121.547 E.01481
G1 X127.228 Y121.112 E.01575
G1 X126.853 Y120.742 E.01618
G1 X126.369 Y120.458 E.01724
G1 X125.875 Y120.312 E.01583
G1 X125.35 Y120.284 E.01616
G1 X124.842 Y120.381 E.01588
G1 X124.371 Y120.59 E.01585
G1 X123.928 Y120.936 E.01725
G1 X123.612 Y121.342 E.01582
G1 X123.383 Y121.853 E.01722
G1 X123.308 Y122.343 E.01521
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.472 E-.04985
G1 X123.289 Y124.341 E-.71015
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
G1 X122.975 Y120.975 E.0951
G2 X122.551 Y122.428 I2.583 J1.544 E.05076
G1 X122.551 Y123.773 E.0446
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
G1 X126.575 Y119.749 E.03758
G3 X127.855 Y120.723 I-1.077 J2.745 E.05403
; CHANGE_LAYER
; Z_HEIGHT: 24.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X127.24 Y120.114 E-.32859
G1 X126.575 Y119.749 E-.28844
G1 X126.841 Y119.483 E-.14298
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
G3 Z25 I-.728 J-.975 P1  F30000
G1 X122.904 Y122.421 Z25
G1 Z24.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.896 Y122.474 E.00179
G1 X122.898 Y126.398 E.13016
G1 X119.102 Y126.398 E.12591
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.417 I-243.844 J-1.841 E.13205
G1 X128.015 Y121.828 E.01973
G1 X127.811 Y121.297 E.01888
G1 X127.476 Y120.799 E.01993
G1 X127.056 Y120.407 E.01906
G1 X126.486 Y120.084 E.02173
G1 X125.895 Y119.921 E.02033
G1 X125.243 Y119.902 E.02162
G1 X124.69 Y120.02 E.01876
G1 X124.133 Y120.279 E.02039
G1 X123.623 Y120.69 E.02175
G1 X123.254 Y121.18 E.02032
G1 X122.998 Y121.779 E.02162
G1 X122.912 Y122.361 E.01953
G1 X123.298 Y122.406 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.288 Y122.474 E.00211
G1 X123.29 Y126.79 E.13262
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.655 Y122 E.0152
G1 X127.5 Y121.547 E.01472
G1 X127.226 Y121.11 E.01583
G1 X126.853 Y120.743 E.01609
G1 X126.37 Y120.459 E.01722
G1 X125.874 Y120.312 E.01591
G1 X125.35 Y120.284 E.01613
G1 X124.845 Y120.38 E.01579
G1 X124.371 Y120.59 E.01594
G1 X123.929 Y120.935 E.01722
G1 X123.611 Y121.343 E.01591
G1 X123.382 Y121.854 E.01718
G1 X123.307 Y122.347 E.01533
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.474 E-.04888
G1 X123.289 Y124.345 E-.71112
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
G3 X122.722 Y121.511 I6.487 J-.648 E.07563
G3 X122.975 Y120.975 I2.315 J.769 E.01972
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
G1 X127.855 Y120.723 Z25.2
G1 Z24.8
G1 E.8 F1800
G1 F1260
G2 X126.575 Y119.749 I-2.353 J1.766 E.05402
G1 X127.376 Y118.948 E.03759
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
G3 Z25.2 I.538 J-1.091 P1  F30000
G1 X122.903 Y122.422 Z25.2
G1 Z25
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1262
G1 X122.896 Y122.476 E.00178
G1 X122.898 Y126.398 E.13011
G1 X119.102 Y126.398 E.1259
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.419 I-254.914 J-1.848 E.13199
G1 X128.015 Y121.825 E.0199
G1 X127.811 Y121.297 E.01878
G1 X127.474 Y120.797 E.02002
G1 X127.056 Y120.407 E.01894
G1 X126.487 Y120.085 E.02171
G1 X125.893 Y119.92 E.02043
G1 X125.243 Y119.902 E.02157
G1 X124.693 Y120.019 E.01866
G1 X124.133 Y120.279 E.02048
G1 X123.623 Y120.69 E.02172
G1 X123.253 Y121.181 E.02042
G1 X122.997 Y121.779 E.02157
G1 X122.912 Y122.363 E.01958
G1 X123.298 Y122.41 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1262
G1 X123.288 Y122.476 E.00203
G1 X123.29 Y126.79 E.13257
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.655 Y121.997 E.01529
G1 X127.5 Y121.547 E.01463
G1 X127.225 Y121.108 E.01591
G1 X126.854 Y120.743 E.01599
G1 X126.372 Y120.459 E.01719
G1 X125.873 Y120.312 E.016
G1 X125.35 Y120.284 E.01609
G1 X124.848 Y120.379 E.01569
G1 X124.371 Y120.59 E.01602
G1 X123.93 Y120.934 E.01719
G1 X123.61 Y121.345 E.01599
G1 X123.382 Y121.854 E.01715
G1 X123.307 Y122.351 E.01544
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.476 E-.04794
G1 X123.289 Y124.349 E-.71206
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
G2 X122.551 Y122.432 I2.579 J1.543 E.05087
G1 X122.551 Y123.773 E.04449
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
G1 X126.575 Y119.749 E.03759
G3 X127.854 Y120.723 I-1.069 J2.734 E.05402
; CHANGE_LAYER
; Z_HEIGHT: 25.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.242 Y120.115 E-.32769
G1 X126.575 Y119.749 E-.28927
G1 X126.841 Y119.483 E-.14304
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
G3 Z25.4 I-.728 J-.975 P1  F30000
G1 X122.903 Y122.424 Z25.4
G1 Z25.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.896 Y122.477 E.00178
G1 X122.898 Y126.398 E.13005
G1 X119.102 Y126.398 E.1259
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.421 I-267.083 J-1.855 E.13193
G1 X128.014 Y121.822 E.02006
G1 X127.811 Y121.297 E.01867
G1 X127.472 Y120.795 E.02011
G1 X127.057 Y120.408 E.01882
G1 X126.488 Y120.085 E.02169
G1 X125.892 Y119.92 E.02052
G1 X125.244 Y119.902 E.02152
G1 X124.696 Y120.018 E.01857
G1 X124.133 Y120.278 E.02058
G1 X123.624 Y120.689 E.0217
G1 X123.252 Y121.183 E.02051
G1 X122.997 Y121.779 E.02152
G1 X122.912 Y122.365 E.01963
G1 X123.297 Y122.414 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.288 Y122.477 E.00196
G1 X123.29 Y126.79 E.13252
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.654 Y121.994 E.01537
G1 X127.5 Y121.547 E.01454
G1 X127.223 Y121.106 E.01599
G1 X126.855 Y120.744 E.01589
G1 X126.373 Y120.46 E.01716
M73 P93 R1
G1 X125.871 Y120.312 E.01608
G1 X125.349 Y120.284 E.01606
G1 X124.851 Y120.378 E.0156
G1 X124.371 Y120.59 E.0161
G1 X123.931 Y120.933 E.01716
G1 X123.609 Y121.346 E.01608
G1 X123.382 Y121.855 E.01711
G1 X123.306 Y122.355 E.01555
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.477 E-.04702
G1 X123.289 Y124.354 E-.71298
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
G3 X122.721 Y121.513 I6.518 J-.646 E.07555
G3 X122.975 Y120.975 I2.316 J.767 E.01979
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
G1 X127.854 Y120.723 Z25.6
G1 Z25.2
G1 E.8 F1800
G1 F1260
G2 X126.574 Y119.75 I-2.345 J1.755 E.05402
G1 X127.376 Y118.948 E.0376
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
G3 Z25.6 I.538 J-1.092 P1  F30000
G1 X122.903 Y122.426 Z25.6
G1 Z25.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1262
G1 X122.896 Y122.479 E.00177
G1 X122.898 Y126.398 E.13
G1 X119.102 Y126.398 E.1259
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.421 I-270.785 J-1.857 E.13191
G1 X128.013 Y121.819 E.02018
G1 X127.811 Y121.297 E.01857
G1 X127.47 Y120.792 E.0202
G1 X127.058 Y120.408 E.0187
G1 X126.49 Y120.086 E.02166
G1 X125.891 Y119.92 E.02062
G1 X125.244 Y119.902 E.02147
G1 X124.699 Y120.017 E.01848
G1 X124.133 Y120.278 E.02067
G1 X123.625 Y120.688 E.02167
G1 X123.251 Y121.185 E.02061
G1 X122.997 Y121.78 E.02146
G1 X122.912 Y122.367 E.01967
G1 X123.297 Y122.418 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1262
G1 X123.288 Y122.479 E.00189
G1 X123.29 Y126.79 E.13247
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.654 Y121.992 E.01545
G1 X127.5 Y121.547 E.01445
G1 X127.222 Y121.104 E.01607
G1 X126.855 Y120.744 E.0158
G1 X126.375 Y120.461 E.01714
G1 X125.87 Y120.311 E.01617
G1 X125.349 Y120.284 E.01603
G1 X124.853 Y120.377 E.0155
G1 X124.371 Y120.59 E.01619
G1 X123.931 Y120.933 E.01714
G1 X123.608 Y121.347 E.01616
G1 X123.382 Y121.855 E.01708
G1 X123.306 Y122.359 E.01565
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.479 E-.04614
G1 X123.289 Y124.358 E-.71386
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
G2 X122.551 Y122.435 I2.576 J1.541 E.05099
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
G1 X126.574 Y119.75 E.03761
G3 X127.854 Y120.723 I-1.061 J2.723 E.05402
; CHANGE_LAYER
; Z_HEIGHT: 25.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.244 Y120.117 E-.32679
G1 X126.574 Y119.75 E-.2901
G1 X126.841 Y119.483 E-.14311
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
G3 Z25.8 I-.729 J-.975 P1  F30000
G1 X122.903 Y122.428 Z25.8
G1 Z25.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1260
G1 X122.896 Y122.481 E.00177
G1 X122.898 Y126.398 E.12994
G1 X119.102 Y126.398 E.1259
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.421 I-268.596 J-1.856 E.13192
G1 X128.013 Y121.816 E.02027
G1 X127.811 Y121.297 E.01847
G1 X127.469 Y120.79 E.02029
G1 X127.059 Y120.409 E.01858
G1 X126.491 Y120.086 E.02164
G1 X125.889 Y119.92 E.02072
G1 X125.244 Y119.902 E.02141
G1 X124.702 Y120.016 E.01838
G1 X124.134 Y120.278 E.02076
G1 X123.626 Y120.688 E.02165
M73 P94 R1
G1 X123.25 Y121.186 E.02071
G1 X122.997 Y121.78 E.02141
G1 X122.912 Y122.368 E.01972
G1 X123.296 Y122.422 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1260
G1 X123.288 Y122.481 E.00182
G1 X123.29 Y126.79 E.13242
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.653 Y121.989 E.01554
G1 X127.5 Y121.547 E.01436
G1 X127.22 Y121.102 E.01615
G1 X126.856 Y120.744 E.0157
G1 X126.376 Y120.461 E.01711
G1 X125.869 Y120.311 E.01625
G1 X125.349 Y120.284 E.016
G1 X124.856 Y120.376 E.01541
G1 X124.371 Y120.59 E.01627
G1 X123.932 Y120.932 E.01711
G1 X123.607 Y121.349 E.01625
G1 X123.382 Y121.856 E.01704
G1 X123.305 Y122.363 E.01576
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.481 E-.04529
G1 X123.289 Y124.361 E-.71472
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
G3 X122.72 Y121.515 I6.551 J-.644 E.07548
G3 X122.975 Y120.975 I2.316 J.765 E.01987
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
G1 X127.854 Y120.723 Z26
G1 Z25.6
G1 E.8 F1800
G1 F1260
G2 X126.574 Y119.75 I-2.337 J1.745 E.05402
G1 X127.376 Y118.948 E.03761
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
G1 X122.903 Y122.43 Z26
G1 Z25.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1589
G1 X122.896 Y122.482 E.00176
G1 X122.898 Y126.398 E.12989
G1 X119.102 Y126.398 E.1259
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.421 I-266.431 J-1.855 E.13193
G1 X128.012 Y121.813 E.02037
G1 X127.811 Y121.297 E.01836
G1 X127.467 Y120.788 E.02038
G1 X127.059 Y120.409 E.01846
G1 X126.493 Y120.087 E.02162
G1 X125.888 Y119.919 E.02082
G1 X125.245 Y119.902 E.02136
G1 X124.705 Y120.015 E.01829
G1 X124.134 Y120.278 E.02086
G1 X123.626 Y120.687 E.02162
G1 X123.249 Y121.188 E.02081
G1 X122.997 Y121.78 E.02136
G1 X122.912 Y122.37 E.01977
G1 X123.296 Y122.426 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1589
G1 X123.288 Y122.482 E.00175
G1 X123.29 Y126.79 E.13237
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.652 Y121.986 E.01562
G1 X127.5 Y121.548 E.01427
G1 X127.219 Y121.101 E.01623
G1 X126.856 Y120.745 E.01561
G1 X126.378 Y120.462 E.01708
G1 X125.868 Y120.311 E.01634
G1 X125.359 Y120.285 E.01567
G1 X124.859 Y120.376 E.01561
G1 X124.372 Y120.59 E.01636
G1 X123.933 Y120.931 E.01708
G1 X123.606 Y121.35 E.01633
G1 X123.382 Y121.856 E.01701
G1 X123.305 Y122.367 E.01586
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.482 E-.04447
G1 X123.289 Y124.365 E-.71553
; WIPE_END
G1 E-.04 F1800
G1 X123.364 Y120.462 Z26.2 F30000
G1 Z25.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1589
G2 X122.55 Y122.445 I2.238 J2.077 E.07264
G1 X122.551 Y126.052 E.11966
G1 X119.448 Y126.052 E.10294
G1 X119.448 Y118.948 E.23565
G1 X124.569 Y118.948 E.16988
G1 X123.401 Y120.415 E.0622
G1 X119.855 Y119.483 F30000
G1 F1589
G1 X119.855 Y119.355 E.00426
G1 X121.355 Y119.355 E.04976
G1 X122.679 Y120.679 E.06212
G1 X122.595 Y120.817 E.00534
G2 X122.143 Y122.428 I3.663 J1.897 E.0559
G1 X122.144 Y124.18 E.05813
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
G2 X127.722 Y120.556 I-3.187 J.103 E.0696
G1 X126.41 Y118.948 E.06884
G1 X134.552 Y118.948 E.27008
G1 X134.552 Y125.992 E.23366
; CHANGE_LAYER
; Z_HEIGHT: 26
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
M73 P95 R1
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
G3 Z26.2 I.162 J-1.206 P1  F30000
G1 X122.903 Y122.431 Z26.2
G1 Z26
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1591
G1 X122.896 Y122.484 E.00176
G1 X122.898 Y126.398 E.12984
G1 X119.102 Y126.398 E.1259
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.42 I-264.321 J-1.853 E.13194
G1 X128.011 Y121.81 E.02046
G1 X127.811 Y121.297 E.01826
G1 X127.465 Y120.786 E.02047
G1 X127.06 Y120.41 E.01834
G1 X126.494 Y120.088 E.0216
G1 X125.887 Y119.919 E.02091
G1 X125.245 Y119.902 E.0213
G1 X124.708 Y120.014 E.01819
G1 X124.134 Y120.278 E.02095
G1 X123.627 Y120.686 E.0216
G1 X123.248 Y121.19 E.02091
G1 X122.997 Y121.781 E.0213
G1 X122.912 Y122.372 E.01982
G1 X123.296 Y122.43 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1591
G1 X123.288 Y122.484 E.00169
G1 X123.29 Y126.79 E.13231
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.652 Y121.983 E.01571
G1 X127.5 Y121.548 E.01418
G1 X127.217 Y121.099 E.01631
G1 X126.857 Y120.745 E.01551
G1 X126.379 Y120.462 E.01706
G1 X125.867 Y120.311 E.01642
G1 X125.358 Y120.285 E.01564
G1 X124.862 Y120.375 E.01551
G1 X124.372 Y120.59 E.01644
G1 X123.934 Y120.93 E.01705
G1 X123.605 Y121.352 E.01642
G1 X123.381 Y121.857 E.01697
G1 X123.305 Y122.37 E.01595
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.484 E-.04368
G1 X123.289 Y124.369 E-.71632
; WIPE_END
G1 E-.04 F1800
G1 X123.364 Y120.462 Z26.4 F30000
G1 Z26
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1591
G2 X122.55 Y122.444 I2.237 J2.076 E.07264
G1 X122.551 Y126.052 E.11967
G1 X119.448 Y126.052 E.10294
G1 X119.448 Y118.948 E.23565
G1 X124.569 Y118.948 E.16988
G1 X123.401 Y120.415 E.0622
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
G1 X128.451 Y122.483 E.11838
G2 X127.72 Y120.553 I-3.187 J.103 E.0697
G1 X126.41 Y118.948 E.06874
G1 X134.552 Y118.948 E.27008
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
G1 F1591
G1 X119.855 Y125.645 E.02668
G1 X120.679 Y125.645 E.02733
G1 X122.144 Y124.18 E.0687
G3 X122.168 Y122.113 I13.265 J-.881 E.06864
G1 X122.168 Y122.113 E0
G3 X122.679 Y120.679 I3.529 J.451 E.0509
G1 X121.355 Y119.355 E.06212
G1 X119.855 Y119.355 E.04976
G1 X119.855 Y119.483 E.00426
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
G1 X122.903 Y122.433 Z26.4
G1 Z26.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1587
G1 X122.895 Y122.486 E.00175
G1 X122.898 Y126.398 E.12978
G1 X119.102 Y126.398 E.1259
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.42 I-262.296 J-1.852 E.13195
G1 X128.01 Y121.807 E.02055
G1 X127.811 Y121.297 E.01815
G1 X127.464 Y120.784 E.02057
G1 X127.061 Y120.411 E.01822
G1 X126.496 Y120.088 E.02157
G1 X125.886 Y119.919 E.02101
G1 X125.245 Y119.902 E.02125
G1 X124.711 Y120.013 E.0181
G1 X124.134 Y120.278 E.02105
G1 X123.628 Y120.685 E.02157
G1 X123.247 Y121.191 E.021
G1 X122.997 Y121.781 E.02125
G1 X122.912 Y122.374 E.01987
G1 X123.295 Y122.433 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1587
G1 X123.288 Y122.486 E.00163
G1 X123.29 Y126.79 E.13226
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.651 Y121.981 E.0158
G1 X127.5 Y121.548 E.01409
G1 X127.216 Y121.097 E.01639
G1 X126.857 Y120.746 E.01541
G1 X126.381 Y120.463 E.01703
G1 X125.865 Y120.311 E.0165
G1 X125.358 Y120.285 E.01561
G1 X124.865 Y120.374 E.01541
G1 X124.372 Y120.59 E.01653
G1 X123.934 Y120.93 E.01703
G1 X123.604 Y121.353 E.0165
G1 X123.381 Y121.857 E.01693
G1 X123.304 Y122.374 E.01605
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.486 E-.04294
G1 X123.289 Y124.373 E-.71706
; WIPE_END
G1 E-.04 F1800
G1 X123.364 Y120.462 Z26.6 F30000
G1 Z26.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1587
G2 X122.55 Y122.452 I2.233 J2.074 E.07289
G1 X122.551 Y126.052 E.11941
G1 X119.448 Y126.052 E.10294
G1 X119.448 Y118.948 E.23565
G1 X124.569 Y118.948 E.16988
G1 X123.401 Y120.415 E.0622
G1 X119.855 Y119.483 F30000
G1 F1587
G1 X119.855 Y119.355 E.00426
G1 X121.355 Y119.355 E.04976
G1 X122.679 Y120.679 E.06212
G1 X122.593 Y120.82 E.00546
G2 X122.143 Y122.452 I2.963 J1.695 E.05676
G1 X122.144 Y124.18 E.05732
G1 X120.679 Y125.645 E.06871
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
G1 X129.983 Y125.645 Z26.6
M73 P96 R0
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
G1 X128.451 Y122.483 E.11838
G2 X127.719 Y120.551 I-3.188 J.103 E.06979
G1 X126.41 Y118.948 E.06864
G1 X134.552 Y118.948 E.27008
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
G1 X122.903 Y122.435 Z26.6
G1 Z26.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1591
G1 X122.895 Y122.487 E.00175
G1 X122.898 Y126.398 E.12973
G1 X119.102 Y126.398 E.1259
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y126.398 E.2586
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.42 I-260.247 J-1.851 E.13196
G1 X128.01 Y121.804 E.02065
G1 X127.811 Y121.297 E.01805
G1 X127.462 Y120.782 E.02066
G1 X127.061 Y120.411 E.0181
G1 X126.497 Y120.089 E.02155
G1 X125.884 Y119.919 E.02111
G1 X125.246 Y119.902 E.02119
G1 X124.714 Y120.012 E.01801
G1 X124.135 Y120.277 E.02114
G1 X123.629 Y120.685 E.02155
G1 X123.246 Y121.193 E.0211
G1 X122.996 Y121.781 E.0212
G1 X122.911 Y122.376 E.01992
G1 X123.295 Y122.437 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1591
G1 X123.288 Y122.487 E.00157
G1 X123.29 Y126.79 E.13221
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y126.79 E.26364
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.468 I-797.671 J-2.361 E.1328
G1 X127.651 Y121.978 E.01517
G1 X127.5 Y121.548 E.014
G1 X127.214 Y121.095 E.01647
G1 X126.858 Y120.746 E.01532
G1 X126.382 Y120.464 E.017
G1 X125.864 Y120.31 E.01659
G1 X125.358 Y120.285 E.01558
G1 X124.867 Y120.373 E.01532
G1 X124.372 Y120.589 E.01661
G1 X123.935 Y120.929 E.017
G1 X123.603 Y121.355 E.01659
G1 X123.381 Y121.858 E.0169
G1 X123.304 Y122.377 E.01614
M204 S10000
; WIPE_START
G1 F24000
G1 X123.288 Y122.487 E-.04223
G1 X123.289 Y124.376 E-.71777
; WIPE_END
G1 E-.04 F1800
G1 X123.356 Y120.471 Z26.8 F30000
G1 Z26.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1591
G2 X122.55 Y122.453 I2.236 J2.064 E.0725
G1 X122.551 Y126.052 E.1194
G1 X119.448 Y126.052 E.10294
G1 X119.448 Y118.948 E.23565
G1 X124.569 Y118.948 E.16988
G1 X123.394 Y120.424 E.0626
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
G1 X128.451 Y122.483 E.11838
G2 X127.717 Y120.549 I-3.187 J.103 E.06989
G1 X126.41 Y118.948 E.06855
G1 X134.552 Y118.948 E.27008
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
G1 X122.144 Y124.18 E.06871
G1 X122.143 Y122.453 E.05731
G3 X122.679 Y120.679 I3.39 J.057 E.06224
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
G3 Z26.8 I-1.107 J.505 P1  F30000
G1 X122.903 Y122.437 Z26.8
G1 Z26.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F1679
G1 X122.895 Y122.489 E.00174
G1 X122.898 Y126.398 E.12967
G1 X119.102 Y126.398 E.1259
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.42 I-258.285 J-1.85 E.13197
G1 X128.009 Y121.801 E.02074
G1 X127.811 Y121.298 E.01794
G1 X127.46 Y120.78 E.02075
G1 X127.062 Y120.412 E.01798
G1 X126.499 Y120.09 E.02153
G1 X125.883 Y119.919 E.0212
G1 X125.246 Y119.901 E.02114
G1 X124.717 Y120.011 E.01792
G1 X124.135 Y120.277 E.02123
G1 X123.629 Y120.684 E.02152
G1 X123.245 Y121.195 E.0212
G1 X122.996 Y121.782 E.02114
G1 X122.911 Y122.377 E.01997
G1 X123.295 Y122.44 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F1679
G1 X123.287 Y122.489 E.00152
G1 X123.29 Y126.79 E.13216
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.65 Y121.975 E.01597
G1 X127.5 Y121.548 E.01391
G1 X127.213 Y121.093 E.01655
G1 X126.858 Y120.746 E.01522
G1 X126.383 Y120.464 E.01698
G1 X125.863 Y120.31 E.01667
G1 X125.358 Y120.285 E.01555
G1 X124.87 Y120.372 E.01523
G1 X124.372 Y120.589 E.01669
G1 X123.936 Y120.928 E.01697
G1 X123.602 Y121.356 E.01667
G1 X123.381 Y121.858 E.01686
G1 X123.304 Y122.381 E.01623
M204 S10000
; WIPE_START
G1 F24000
G1 X123.287 Y122.489 E-.04157
G1 X123.289 Y124.379 E-.71843
; WIPE_END
G1 E-.04 F1800
G1 X121.968 Y126.233 Z27 F30000
G1 Z26.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.434038
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X122.53 Y124.991 E.08215
M73 P97 R0
G1 X122.529 Y123.817 E.0708
G1 X121.529 Y126.03 E.14645
G1 X120.997 Y126.03 E.03202
G1 X122.529 Y122.642 E.22414
G3 X123.026 Y120.851 I3.114 J-.1 E.1138
G1 X123.748 Y119.944 E.06989
G1 X124.189 Y118.97 E.06449
G1 X123.658 Y118.97 E.03202
G1 X120.466 Y126.03 E.46713
G1 X119.935 Y126.03 E.03202
G1 X123.127 Y118.97 E.46713
G1 X122.596 Y118.97 E.03202
G1 X119.47 Y125.885 E.45752
G1 X119.47 Y124.71 E.07084
G1 X122.064 Y118.97 E.37978
G1 X121.533 Y118.97 E.03202
G1 X119.47 Y123.535 E.30203
G1 X119.47 Y122.36 E.07084
G1 X121.002 Y118.97 E.22429
G1 X120.471 Y118.97 E.03202
G1 X119.47 Y121.185 E.14654
G1 X119.47 Y120.009 E.07084
G1 X120.031 Y118.767 E.08219
M106 S252.45
G1 X126.393 Y119.613 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.496056
; LAYER_HEIGHT: 0.2
G1 F1679
G1 X125.922 Y119.036 E.0275
G2 X125.052 Y119.032 I-.483 J13.181 E.03211
G1 X124.588 Y119.615 E.0275
G1 X124.77 Y119.55 E.00714
G1 X125.314 Y119.469 E.02029
G1 X126.103 Y119.52 E.02919
G1 X126.336 Y119.594 E.00902
G1 X126.362 Y118.767 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.419683
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X127.168 Y120.163 E.09086
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
G1 X130.556 Y126.03 E.23581
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
G3 Z27 I-.299 J-1.18 P1  F30000
G1 X123.011 Y121.77 Z27
G1 Z26.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2621
G1 X122.916 Y122.182 E.01402
G1 X122.895 Y122.491 E.01027
G1 X122.898 Y126.398 E.12962
G1 X119.102 Y126.398 E.1259
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.419 I-256.356 J-1.849 E.13198
G1 X128.008 Y121.798 E.02084
G1 X127.811 Y121.298 E.01783
G1 X127.458 Y120.778 E.02085
G1 X127.063 Y120.412 E.01786
G1 X126.5 Y120.09 E.02151
G1 X125.881 Y119.918 E.0213
G1 X125.246 Y119.901 E.02108
G1 X124.72 Y120.01 E.01783
G1 X124.135 Y120.277 E.02133
G1 X123.63 Y120.683 E.0215
G1 X123.244 Y121.196 E.0213
G1 X123.036 Y121.657 E.01676
G1 X123.024 Y121.711 E.00185
G1 X123.296 Y122.43 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2621
G1 X123.287 Y122.491 E.00187
G1 X123.29 Y126.79 E.13211
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G1 X127.713 Y122.491 E.13209
G1 X127.649 Y121.973 E.01605
G1 X127.501 Y121.548 E.01382
G1 X127.211 Y121.091 E.01664
G1 X126.859 Y120.747 E.01512
G1 X126.385 Y120.465 E.01695
G1 X125.862 Y120.31 E.01676
G1 X125.358 Y120.285 E.01552
G1 X124.873 Y120.371 E.01513
G1 X124.372 Y120.589 E.01678
G1 X123.937 Y120.927 E.01694
G1 X123.602 Y121.358 E.01676
G1 X123.381 Y121.859 E.01683
G1 X123.305 Y122.371 E.01591
M204 S10000
; WIPE_START
G1 F24000
G1 X123.287 Y122.491 E-.04593
G1 X123.289 Y124.37 E-.71407
; WIPE_END
G1 E-.04 F1800
G1 X122.736 Y125.693 Z27.2 F30000
G1 Z26.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421498
G1 F2621
G1 X122.362 Y126.067 E.01631
G1 X121.827 Y126.067 E.01652
G1 X122.566 Y125.328 E.03226
G1 X122.566 Y124.792 E.01651
G1 X121.291 Y126.067 E.05561
G1 X120.756 Y126.067 E.01652
G1 X122.566 Y124.257 E.07896
G1 X122.566 Y123.722 E.01651
G1 X120.221 Y126.067 E.10231
G1 X119.685 Y126.067 E.01652
G1 X122.566 Y123.187 E.12566
G1 X122.565 Y122.651 E.01651
G1 X119.433 Y125.784 E.13665
G1 X119.433 Y125.248 E.01652
G1 X122.598 Y122.083 E.13809
G3 X122.824 Y121.322 I2.332 J.278 E.02463
G1 X119.433 Y124.713 E.14796
G1 X119.433 Y124.178 E.01652
G1 X124.678 Y118.933 E.2288
G1 X125.213 Y118.933 E.01652
G1 X124.331 Y119.815 E.03849
G3 X125.08 Y119.601 I.941 J1.879 E.02417
G1 X125.748 Y118.933 E.02916
G1 X126.284 Y118.933 E.01652
G1 X125.641 Y119.575 E.02802
G3 X126.124 Y119.628 I-.014 J2.371 E.01501
G1 X126.819 Y118.933 E.03032
G1 X127.354 Y118.933 E.01652
G1 X126.534 Y119.754 E.03582
G3 X126.899 Y119.924 I-.538 J1.629 E.01246
G1 X127.89 Y118.933 E.04325
G1 X128.425 Y118.933 E.01652
G1 X127.231 Y120.127 E.05209
G3 X127.519 Y120.374 I-1.294 J1.798 E.01173
G1 X128.961 Y118.933 E.06288
G1 X129.496 Y118.933 E.01652
G1 X127.78 Y120.65 E.07489
G3 X127.994 Y120.971 I-1.319 J1.113 E.01193
G1 X130.031 Y118.933 E.08889
G1 X130.567 Y118.933 E.01652
G1 X128.185 Y121.315 E.10391
G3 X128.326 Y121.709 I-1.683 J.824 E.01295
G1 X131.102 Y118.933 E.12112
G1 X131.638 Y118.933 E.01652
G1 X128.4 Y122.171 E.14125
G3 X128.436 Y122.67 I-2.155 J.405 E.01549
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
G3 Z27.2 I-.664 J1.02 P1  F30000
G1 X123.086 Y121.547 Z27.2
G1 Z27
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.449999
G1 F2974
G1 X123.036 Y121.658 E.00404
G1 X122.916 Y122.179 E.01774
G1 X122.898 Y122.594 E.01376
G1 X122.898 Y126.398 E.12619
G1 X119.102 Y126.398 E.12591
M73 P98 R0
G1 X119.102 Y118.602 E.2586
G1 X134.898 Y118.602 E.52398
G1 X134.898 Y122.013 E.11315
G1 X134.898 Y126.398 E.14545
G1 X128.102 Y126.398 E.22542
G2 X128.1 Y122.419 I-254.511 J-1.848 E.13199
G1 X128.007 Y121.795 E.02093
G1 X127.811 Y121.298 E.01773
G1 X127.457 Y120.776 E.02094
G1 X127.064 Y120.413 E.01774
G1 X126.502 Y120.091 E.02148
G1 X125.88 Y119.918 E.0214
G1 X125.247 Y119.901 E.02102
G1 X124.723 Y120.009 E.01774
G1 X124.135 Y120.277 E.02142
G1 X123.631 Y120.682 E.02148
G1 X123.243 Y121.198 E.0214
G1 X123.111 Y121.492 E.0107
G1 X123.3 Y122.442 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.419999
G1 F2974
G1 X123.29 Y126.79 E.1336
G1 X118.71 Y126.79 E.14073
G1 X118.71 Y118.21 E.26364
G1 X135.29 Y118.21 E.50946
G1 X135.29 Y122.013 E.11686
G1 X135.29 Y126.79 E.14678
G1 X127.71 Y126.79 E.23291
G2 X127.711 Y122.469 I-836.467 J-2.383 E.13279
G1 X127.649 Y121.97 E.01544
G1 X127.482 Y121.51 E.01502
G1 X127.21 Y121.089 E.01542
G1 X126.859 Y120.747 E.01503
G1 X126.386 Y120.465 E.01692
G1 X125.861 Y120.31 E.01685
G1 X125.357 Y120.285 E.01549
G1 X124.876 Y120.37 E.01503
G1 X124.372 Y120.589 E.01686
G1 X123.937 Y120.927 E.01692
G1 X123.625 Y121.319 E.01542
G1 X123.445 Y121.704 E.01306
G1 X123.301 Y122.256 E.01753
G1 X123.301 Y122.382 E.00387
M204 S10000
; WIPE_START
G1 F24000
G1 X123.296 Y124.382 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.334 Y121.431 Z27.4 F30000
G1 X134.676 Y119.61 Z27.4
G1 Z27
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2974
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
G1 X130.69 Y118.824 E.1732
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
G1 X128.196 Y121.664 E.19606
G1 X128.306 Y122.307
G1 X132.175 Y126.176 E.16813
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
G1 X126.341 Y119.809 Z27.4 F30000
G1 Z27
G1 E.8 F1800
M204 S2000
G1 F2974
G1 X125.357 Y118.824 E.04277
G1 X124.824 Y118.824
G1 X125.686 Y119.686 E.03744
G1 X125.164 Y119.698
G1 X124.291 Y118.824 E.03796
G1 X123.757 Y118.824
G1 X124.714 Y119.781 E.04157
G1 X124.332 Y119.933
G1 X123.224 Y118.824 E.04816
G1 X122.691 Y118.824
G1 X123.981 Y120.115 E.05607
G1 X123.678 Y120.345
G1 X122.158 Y118.824 E.06607
G1 X121.624 Y118.824
G1 X123.407 Y120.607 E.07745
G1 X123.17 Y120.904
G1 X121.091 Y118.824 E.09035
G1 X120.558 Y118.824
G1 X122.978 Y121.245 E.10518
G1 X122.817 Y121.617
G1 X120.024 Y118.824 E.12134
G1 X119.491 Y118.824
G1 X122.722 Y122.055 E.14038
G1 X122.682 Y122.549
G1 X119.324 Y119.191 E.14592
G1 X119.324 Y119.724
G1 X122.681 Y123.081 E.14587
G1 X122.68 Y123.613
G1 X119.324 Y120.258 E.14583
G1 X119.324 Y120.791
G1 X122.679 Y124.146 E.14579
G1 X122.678 Y124.678
G1 X119.324 Y121.324 E.14574
G1 X119.324 Y121.857
G1 X122.677 Y125.21 E.1457
G1 X122.676 Y125.743
G1 X119.324 Y122.391 E.14566
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
G1 X119.336 Y118.806 Z27.4 F30000
G1 Z27
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.104173
G1 F2974
G1 X119.336 Y119.179 E.00186
; WIPE_START
G1 F24000
G1 X119.336 Y118.806 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.891 Y119.691 Z27.4 F30000
G1 Z27
G1 E.8 F1800
; LINE_WIDTH: 0.11127
G1 F2974
G2 X124.746 Y119.774 I1.138 J2.175 E.00093
; WIPE_START
G1 F24000
G1 X124.891 Y119.691 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.954 Y119.71 Z27.4 F30000
G1 Z27
G1 E.8 F1800
; LINE_WIDTH: 0.105931
G1 F2974
G2 X125.758 Y119.614 I-1.609 J3.023 E.00112
; WIPE_START
G1 F24000
G1 X125.954 Y119.71 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.721 Y119.948 Z27.4 F30000
G1 Z27
G1 E.8 F1800
; LINE_WIDTH: 0.0881691
G1 F2974
G1 X126.651 Y119.9 E.00031
; LINE_WIDTH: 0.133149
G2 X126.41 Y119.741 I-2.663 J3.783 E.00213
; WIPE_START
G1 F24000
G1 X126.651 Y119.9 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.673 Y124.59 Z27.4 F30000
G1 X134.694 Y126.164 Z27.4
G1 Z27
G1 E.8 F1800
; LINE_WIDTH: 0.103064
G1 F2974
G1 X134.319 Y126.164 E.00184
; WIPE_START
G1 F24000
G1 X134.694 Y126.164 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.474 Y121.742 Z27.4 F30000
G1 X128.266 Y121.594 Z27.4
G1 Z27
G1 E.8 F1800
; LINE_WIDTH: 0.104778
G1 F2974
G2 X128.046 Y121.274 I-5.819 J3.748 E.00196
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X128.266 Y121.594 E-.76
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

