; HEADER_BLOCK_START
; BambuStudio 01.07.04.52
; model printing time: 4m 45s; total estimated time: 10m 31s
; total layer number: 40
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
; upward_compatible_machine = "Bambu Lab P1S 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle"
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
M73 P41 R6
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
M73 P42 R6
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
M73 P44 R5
G1 E-0.5 F300

M73 P46 R5
G1 X70 F9000
M73 P47 R5
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
M73 P48 R5
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
    G29 A X123 Y123 I10 J10
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
M73 P49 R5
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
; layer num/total_layer_count: 1/40
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
G1 X132.143 Y130.143 F30000
M73 P50 R5
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F1644
G1 X123.857 Y130.143 E.30862
G1 X123.857 Y121.857 E.30862
G1 X132.143 Y121.857 E.30862
G1 X132.143 Y130.083 E.30638
G1 X132.6 Y130.6 F30000
; FEATURE: Outer wall
G1 F1644
M73 P51 R5
G1 X123.4 Y130.6 E.34267
G1 X123.4 Y121.4 E.34267
G1 X132.6 Y121.4 E.34267
G1 X132.6 Y130.54 E.34043
; WIPE_START
G1 F24000
G1 X130.6 Y130.553 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.967 Y122.929 Z.6 F30000
G1 X131.01 Y122.04 Z.6
M73 P52 R5
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.512315
M73 P52 R4
G1 F1644
G1 X131.754 Y122.784 E.04027
G1 X131.754 Y123.448 E.02539
G1 X130.552 Y122.246 E.06505
M73 P53 R4
G1 X129.888 Y122.246 E.02539
G1 X131.754 Y124.112 E.10096
G1 X131.754 Y124.776 E.02539
G1 X129.224 Y122.246 E.13687
G1 X128.56 Y122.246 E.02539
G1 X131.754 Y125.44 E.17278
G1 X131.754 Y126.103 E.02539
G1 X127.897 Y122.246 E.20868
G1 X127.233 Y122.246 E.02539
G1 X131.754 Y126.767 E.24459
G1 X131.754 Y127.431 E.02539
G1 X126.569 Y122.246 E.2805
G1 X125.905 Y122.246 E.02539
G1 X131.754 Y128.095 E.31641
G1 X131.754 Y128.759 E.02539
G1 X125.241 Y122.246 E.35232
G1 X124.577 Y122.246 E.02539
G1 X131.754 Y129.423 E.38823
M73 P54 R4
G1 X131.754 Y129.754 E.01269
G1 X131.422 Y129.754 E.0127
G1 X124.246 Y122.578 E.38822
G1 X124.246 Y123.241 E.02539
G1 X130.759 Y129.754 E.35231
G1 X130.095 Y129.754 E.02539
G1 X124.246 Y123.905 E.3164
G1 X124.246 Y124.569 E.02539
G1 X129.431 Y129.754 E.28049
G1 X128.767 Y129.754 E.02539
G1 X124.246 Y125.233 E.24459
G1 X124.246 Y125.897 E.02539
G1 X128.103 Y129.754 E.20868
G1 X127.439 Y129.754 E.02539
G1 X124.246 Y126.561 E.17277
M73 P55 R4
G1 X124.246 Y127.224 E.02539
G1 X126.776 Y129.754 E.13686
G1 X126.112 Y129.754 E.02539
G1 X124.246 Y127.888 E.10095
G1 X124.246 Y128.552 E.02539
G1 X125.448 Y129.754 E.06504
G1 X124.784 Y129.754 E.02539
G1 X124.04 Y129.01 E.04026
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.784 Y129.754 E-.39999
G1 X125.448 Y129.754 E-.25225
G1 X125.248 Y129.554 E-.10776
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 2/40
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
G3 Z.6 I-.143 J1.209 P1  F30000
G1 X132.398 Y130.398 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1985
G1 X123.602 Y130.398 E.29177
G1 X123.602 Y121.602 E.29177
G1 X132.398 Y121.602 E.29177
G1 X132.398 Y130.338 E.28978
G1 X132.79 Y130.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1985
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X132.79 Y121.21 E.29437
G1 X132.79 Y130.73 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X130.79 Y130.743 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.449 Y130.234 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.430979
G1 F1985
G1 X132.065 Y129.618 E.02754
G1 X132.065 Y129.07 E.01735
G1 X131.07 Y130.065 E.0445
G1 X130.521 Y130.065 E.01735
G1 X132.065 Y128.521 E.06904
G1 X132.065 Y127.972 E.01735
G1 X129.972 Y130.065 E.09358
G1 X129.423 Y130.065 E.01735
G1 X132.065 Y127.423 E.11812
M73 P56 R4
G1 X132.065 Y126.874 E.01735
G1 X128.874 Y130.065 E.14267
G1 X128.326 Y130.065 E.01735
G1 X132.065 Y126.326 E.16721
G1 X132.065 Y125.777 E.01735
G1 X127.777 Y130.065 E.19175
G1 X127.228 Y130.065 E.01735
G1 X132.065 Y125.228 E.21629
G1 X132.065 Y124.679 E.01735
G1 X126.679 Y130.065 E.24083
G1 X126.13 Y130.065 E.01735
G1 X132.065 Y124.13 E.26538
G1 X132.065 Y123.582 E.01735
G1 X125.582 Y130.065 E.28992
G1 X125.033 Y130.065 E.01735
G1 X132.065 Y123.033 E.31446
G1 X132.065 Y122.484 E.01735
G1 X124.484 Y130.065 E.339
G1 X123.935 Y130.065 E.01735
G1 X132.065 Y121.935 E.36354
G1 X131.516 Y121.935 E.01735
G1 X123.935 Y129.516 E.339
G1 X123.935 Y128.967 E.01735
G1 X130.967 Y121.935 E.31446
G1 X130.418 Y121.935 E.01735
G1 X123.935 Y128.418 E.28991
G1 X123.935 Y127.869 E.01735
G1 X129.869 Y121.935 E.26537
G1 X129.321 Y121.935 E.01735
G1 X123.935 Y127.321 E.24083
G1 X123.935 Y126.772 E.01735
G1 X128.772 Y121.935 E.21629
G1 X128.223 Y121.935 E.01735
G1 X123.935 Y126.223 E.19175
G1 X123.935 Y125.674 E.01735
G1 X127.674 Y121.935 E.1672
G1 X127.125 Y121.935 E.01735
G1 X123.935 Y125.125 E.14266
G1 X123.935 Y124.577 E.01735
G1 X126.577 Y121.935 E.11812
G1 X126.028 Y121.935 E.01735
G1 X123.935 Y124.028 E.09358
G1 X123.935 Y123.479 E.01735
G1 X125.479 Y121.935 E.06903
G1 X124.93 Y121.935 E.01735
G1 X123.935 Y122.93 E.04449
G1 X123.935 Y122.381 E.01735
G1 X124.551 Y121.766 E.02754
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.935 Y122.381 E-.33092
G1 X123.935 Y122.93 E-.20854
G1 X124.346 Y122.52 E-.22054
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 3/40
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
G3 Z.8 I-.851 J.87 P1  F30000
G1 X132.398 Y130.398 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1990
G1 X123.602 Y130.398 E.29177
G1 X123.602 Y121.602 E.29177
G1 X132.398 Y121.602 E.29177
G1 X132.398 Y130.338 E.28978
G1 X132.79 Y130.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1990
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
M73 P57 R4
G1 X132.79 Y121.21 E.29437
G1 X132.79 Y130.73 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X130.79 Y130.743 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.115 Y123.226 Z1 F30000
G1 X132.234 Y122.551 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.430979
G1 F1990
G1 X131.618 Y121.935 E.02754
G1 X131.07 Y121.935 E.01735
G1 X132.065 Y122.93 E.0445
G1 X132.065 Y123.479 E.01735
G1 X130.521 Y121.935 E.06904
G1 X129.972 Y121.935 E.01735
G1 X132.065 Y124.028 E.09358
G1 X132.065 Y124.577 E.01735
G1 X129.423 Y121.935 E.11812
G1 X128.874 Y121.935 E.01735
G1 X132.065 Y125.126 E.14267
G1 X132.065 Y125.674 E.01735
G1 X128.326 Y121.935 E.16721
G1 X127.777 Y121.935 E.01735
G1 X132.065 Y126.223 E.19175
G1 X132.065 Y126.772 E.01735
G1 X127.228 Y121.935 E.21629
G1 X126.679 Y121.935 E.01735
G1 X132.065 Y127.321 E.24083
G1 X132.065 Y127.87 E.01735
G1 X126.13 Y121.935 E.26538
G1 X125.582 Y121.935 E.01735
G1 X132.065 Y128.418 E.28992
G1 X132.065 Y128.967 E.01735
G1 X125.033 Y121.935 E.31446
G1 X124.484 Y121.935 E.01735
G1 X132.065 Y129.516 E.339
G1 X132.065 Y130.065 E.01735
G1 X123.935 Y121.935 E.36354
G1 X123.935 Y122.484 E.01735
G1 X131.516 Y130.065 E.339
G1 X130.967 Y130.065 E.01735
G1 X123.935 Y123.033 E.31446
G1 X123.935 Y123.582 E.01735
G1 X130.418 Y130.065 E.28991
G1 X129.869 Y130.065 E.01735
G1 X123.935 Y124.131 E.26537
G1 X123.935 Y124.679 E.01735
G1 X129.321 Y130.065 E.24083
G1 X128.772 Y130.065 E.01735
G1 X123.935 Y125.228 E.21629
G1 X123.935 Y125.777 E.01735
G1 X128.223 Y130.065 E.19175
G1 X127.674 Y130.065 E.01735
G1 X123.935 Y126.326 E.1672
G1 X123.935 Y126.875 E.01735
G1 X127.125 Y130.065 E.14266
G1 X126.577 Y130.065 E.01735
G1 X123.935 Y127.423 E.11812
G1 X123.935 Y127.972 E.01735
G1 X126.028 Y130.065 E.09358
M73 P58 R4
G1 X125.479 Y130.065 E.01735
G1 X123.935 Y128.521 E.06903
G1 X123.935 Y129.07 E.01735
G1 X124.93 Y130.065 E.04449
G1 X124.381 Y130.065 E.01735
G1 X123.766 Y129.449 E.02754
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.381 Y130.065 E-.33092
G1 X124.93 Y130.065 E-.20854
G1 X124.52 Y129.654 E-.22054
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 4/40
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
M106 S255
; start printing object, unique label id: 66
M624 AQAAAAAAAAA=
G17
G3 Z1 I-.114 J1.212 P1  F30000
G1 X132.398 Y130.398 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X123.602 Y130.398 E.29177
G1 X123.602 Y121.602 E.29177
G1 X132.398 Y121.602 E.29177
G1 X132.398 Y130.338 E.28978
G1 X132.79 Y130.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X132.79 Y121.21 E.29437
G1 X132.79 Y130.73 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X130.79 Y130.743 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.05 Y130.05 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X123.95 Y130.05 E.26867
G1 X123.95 Y121.95 E.26867
G1 X132.05 Y121.95 E.26867
G1 X132.05 Y129.99 E.26668
G1 X130.014 Y129.643 F30000
G1 F1200
G1 X131.643 Y129.643 E.05401
G1 X124.357 Y122.357 E.34176
G1 X124.357 Y129.643 E.24166
G1 X131.643 Y122.357 E.34176
G1 X130.014 Y122.357 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.643 Y122.357 E-.61876
G1 X131.38 Y122.62 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 5/40
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
G3 Z1.2 I-1.207 J.158 P1  F30000
G1 X132.398 Y130.398 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X123.602 Y130.398 E.29177
G1 X123.602 Y121.602 E.29177
G1 X132.398 Y121.602 E.29177
G1 X132.398 Y130.338 E.28978
G1 X132.79 Y130.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X132.79 Y121.21 E.29437
G1 X132.79 Y130.73 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X130.79 Y130.743 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.05 Y130.05 Z1.4 F30000
M73 P59 R4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X123.95 Y130.05 E.26867
G1 X123.95 Y121.95 E.26867
G1 X132.05 Y121.95 E.26867
G1 X132.05 Y129.99 E.26668
G1 X130.014 Y122.357 F30000
G1 F1200
G1 X131.643 Y122.357 E.05401
G1 X124.357 Y129.643 E.34176
G1 X124.357 Y122.357 E.24166
G1 X131.643 Y129.643 E.34176
G1 X130.014 Y129.643 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.643 Y129.643 E-.61876
G1 X131.38 Y129.38 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 6/40
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
G3 Z1.4 I-.861 J.861 P1  F30000
G1 X132.398 Y130.398 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X123.602 Y130.398 E.29177
G1 X123.602 Y121.602 E.29177
G1 X132.398 Y121.602 E.29177
M73 P60 R4
G1 X132.398 Y130.338 E.28978
G1 X132.79 Y130.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X132.79 Y121.21 E.29437
G1 X132.79 Y130.73 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X130.79 Y130.743 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.05 Y130.05 Z1.6 F30000
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X123.95 Y130.05 E.26867
G1 X123.95 Y121.95 E.26867
G1 X132.05 Y121.95 E.26867
G1 X132.05 Y129.99 E.26668
G1 X130.014 Y129.643 F30000
G1 F1200
G1 X131.643 Y129.643 E.05401
G1 X124.357 Y122.357 E.34176
G1 X124.357 Y129.643 E.24166
G1 X131.643 Y122.357 E.34176
G1 X130.014 Y122.357 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.643 Y122.357 E-.61876
G1 X131.38 Y122.62 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 7/40
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
G3 Z1.6 I-1.207 J.158 P1  F30000
G1 X132.398 Y130.398 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X123.602 Y130.398 E.29177
M73 P61 R4
G1 X123.602 Y121.602 E.29177
G1 X132.398 Y121.602 E.29177
G1 X132.398 Y130.338 E.28978
G1 X132.79 Y130.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X132.79 Y121.21 E.29437
G1 X132.79 Y130.73 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X130.79 Y130.743 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.05 Y130.05 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X123.95 Y130.05 E.26867
G1 X123.95 Y121.95 E.26867
G1 X132.05 Y121.95 E.26867
G1 X132.05 Y129.99 E.26668
G1 X130.014 Y122.357 F30000
G1 F1200
G1 X131.643 Y122.357 E.05401
G1 X124.357 Y129.643 E.34176
G1 X124.357 Y122.357 E.24166
G1 X131.643 Y129.643 E.34176
G1 X130.014 Y129.643 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.643 Y129.643 E-.61876
G1 X131.38 Y129.38 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 8/40
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
G3 Z1.8 I-.861 J.861 P1  F30000
M73 P62 R4
G1 X132.398 Y130.398 Z1.8
M73 P62 R3
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X123.602 Y130.398 E.29177
G1 X123.602 Y121.602 E.29177
G1 X132.398 Y121.602 E.29177
G1 X132.398 Y130.338 E.28978
G1 X132.79 Y130.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X132.79 Y121.21 E.29437
G1 X132.79 Y130.73 E.29252
M204 S10000
G1 X132.231 Y130.017 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.422577
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X123.972 Y130.017 E.47194
G1 X123.972 Y129.544 E.027
G1 X132.028 Y129.544 E.46036
G1 X132.028 Y129.072 E.027
G1 X123.972 Y129.072 E.46036
G1 X123.972 Y128.599 E.027
G1 X132.028 Y128.599 E.46036
G1 X132.028 Y128.127 E.027
G1 X123.972 Y128.127 E.46036
G1 X123.972 Y127.654 E.027
G1 X132.028 Y127.654 E.46036
G1 X132.028 Y127.181 E.027
G1 X123.972 Y127.181 E.46036
G1 X123.972 Y126.709 E.027
G1 X132.028 Y126.709 E.46036
G1 X132.028 Y126.236 E.027
G1 X123.972 Y126.236 E.46036
G1 X123.972 Y125.764 E.027
G1 X132.028 Y125.764 E.46036
M73 P63 R3
G1 X132.028 Y125.291 E.027
G1 X123.972 Y125.291 E.46036
G1 X123.972 Y124.819 E.027
G1 X132.028 Y124.819 E.46036
G1 X132.028 Y124.346 E.027
G1 X123.972 Y124.346 E.46036
G1 X123.972 Y123.873 E.027
G1 X132.028 Y123.873 E.46036
G1 X132.028 Y123.401 E.027
G1 X123.972 Y123.401 E.46036
G1 X123.972 Y122.928 E.027
G1 X132.028 Y122.928 E.46036
G1 X132.028 Y122.456 E.027
G1 X123.972 Y122.456 E.46036
G1 X123.972 Y121.983 E.027
G1 X132.231 Y121.983 E.47194
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X130.231 Y121.983 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 9/40
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
G3 Z2 I-1.179 J.304 P1  F30000
G1 X132.398 Y130.398 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1989
G1 X123.602 Y130.398 E.29177
G1 X123.602 Y121.602 E.29177
G1 X132.398 Y121.602 E.29177
G1 X132.398 Y130.338 E.28978
M73 P64 R3
G1 X132.79 Y130.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1989
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X132.79 Y121.21 E.29437
G1 X132.79 Y130.73 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X130.79 Y130.743 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.115 Y123.226 Z2.2 F30000
G1 X132.234 Y122.551 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.430979
G1 F1989
G1 X131.618 Y121.935 E.02754
G1 X131.07 Y121.935 E.01735
G1 X132.065 Y122.93 E.0445
G1 X132.065 Y123.479 E.01735
G1 X130.521 Y121.935 E.06904
G1 X129.972 Y121.935 E.01735
G1 X132.065 Y124.028 E.09358
G1 X132.065 Y124.577 E.01735
G1 X129.423 Y121.935 E.11812
G1 X128.874 Y121.935 E.01735
G1 X132.065 Y125.126 E.14267
G1 X132.065 Y125.674 E.01735
G1 X128.326 Y121.935 E.16721
G1 X127.777 Y121.935 E.01735
G1 X132.065 Y126.223 E.19175
G1 X132.065 Y126.772 E.01735
G1 X127.228 Y121.935 E.21629
G1 X126.679 Y121.935 E.01735
G1 X132.065 Y127.321 E.24083
G1 X132.065 Y127.87 E.01735
G1 X126.13 Y121.935 E.26538
G1 X125.582 Y121.935 E.01735
G1 X132.065 Y128.418 E.28992
G1 X132.065 Y128.967 E.01735
G1 X125.033 Y121.935 E.31446
G1 X124.484 Y121.935 E.01735
G1 X132.065 Y129.516 E.339
G1 X132.065 Y130.065 E.01735
G1 X123.935 Y121.935 E.36354
G1 X123.935 Y122.484 E.01735
G1 X131.516 Y130.065 E.339
G1 X130.967 Y130.065 E.01735
G1 X123.935 Y123.033 E.31446
G1 X123.935 Y123.582 E.01735
G1 X130.418 Y130.065 E.28991
G1 X129.869 Y130.065 E.01735
G1 X123.935 Y124.131 E.26537
G1 X123.935 Y124.679 E.01735
G1 X129.321 Y130.065 E.24083
G1 X128.772 Y130.065 E.01735
G1 X123.935 Y125.228 E.21629
G1 X123.935 Y125.777 E.01735
M73 P65 R3
G1 X128.223 Y130.065 E.19175
G1 X127.674 Y130.065 E.01735
G1 X123.935 Y126.326 E.1672
G1 X123.935 Y126.875 E.01735
G1 X127.125 Y130.065 E.14266
G1 X126.577 Y130.065 E.01735
G1 X123.935 Y127.423 E.11812
G1 X123.935 Y127.972 E.01735
G1 X126.028 Y130.065 E.09358
G1 X125.479 Y130.065 E.01735
G1 X123.935 Y128.521 E.06903
G1 X123.935 Y129.07 E.01735
G1 X124.93 Y130.065 E.04449
G1 X124.381 Y130.065 E.01735
G1 X123.766 Y129.449 E.02754
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.381 Y130.065 E-.33092
G1 X124.93 Y130.065 E-.20854
G1 X124.52 Y129.654 E-.22054
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 10/40
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
G3 Z2.2 I1.216 J.039 P1  F30000
G1 X124.773 Y121.775 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2313
G1 X124.601 Y121.89 E.00685
G1 X123.849 Y122.652 E.03551
G1 X123.777 Y122.762 E.00437
G1 X123.602 Y122.71 E.00604
G1 X123.602 Y121.602 E.03676
G1 X124.72 Y121.602 E.03708
G1 X124.755 Y121.718 E.00401
; WIPE_START
G1 F24000
G1 X124.601 Y121.89 E-.08786
G1 X123.849 Y122.652 E-.40681
G1 X123.777 Y122.762 E-.05004
G1 X123.602 Y122.71 E-.06923
G1 X123.602 Y122.326 E-.14607
; WIPE_END
G1 E-.04 F1800
G1 X131.224 Y122.733 Z2.4 F30000
G1 X132.229 Y122.787 Z2.4
G1 Z2
G1 E.8 F1800
G1 F2313
G1 X132.007 Y122.482 E.01253
G1 X131.312 Y121.821 E.03182
G1 X131.244 Y121.776 E.00269
G1 X131.296 Y121.602 E.00604
G1 X132.398 Y121.602 E.03655
G1 X132.398 Y122.732 E.03748
G1 X132.286 Y122.768 E.00389
; WIPE_START
G1 F24000
G1 X132.007 Y122.482 E-.15211
G1 X131.312 Y121.821 E-.36452
G1 X131.244 Y121.776 E-.03077
G1 X131.296 Y121.602 E-.06915
G1 X131.673 Y121.602 E-.14345
; WIPE_END
G1 E-.04 F1800
G1 X132.3 Y129.209 Z2.4 F30000
G1 X132.398 Y130.398 Z2.4
G1 Z2
G1 E.8 F1800
G1 F2313
G1 X131.258 Y130.398 E.03783
G1 X131.201 Y130.234 E.00577
G1 X131.699 Y129.842 E.02104
G1 X132.398 Y129.019 E.03581
G1 X132.398 Y130.338 E.04377
; WIPE_START
G1 F24000
G1 X131.258 Y130.398 E-.43395
G1 X131.201 Y130.234 E-.06611
G1 X131.699 Y129.842 E-.241
G1 X131.732 Y129.804 E-.01895
; WIPE_END
G1 E-.04 F1800
G1 X124.945 Y130.398 Z2.4 F30000
G1 Z2
G1 E.8 F1800
G1 F2313
G1 X123.602 Y130.398 E.04456
G1 X123.602 Y129.262 E.03769
G1 X123.771 Y129.207 E.00589
G1 X124.021 Y129.552 E.01414
G1 X124.901 Y130.357 E.03957
; WIPE_START
G1 F24000
G1 X123.602 Y130.398 E-.4939
M73 P66 R3
G1 X123.602 Y129.698 E-.2661
; WIPE_END
G1 E-.04 F1800
G1 X131.181 Y130.599 Z2.4 F30000
G1 X132.79 Y130.79 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2313
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X132.79 Y121.21 E.29437
G1 X132.79 Y130.73 E.29252
M204 S10000
G1 X132.194 Y129.965 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.292266
G1 F2313
G1 X131.637 Y130.191 E.01221
G1 X131.044 Y130.38 F30000
; LINE_WIDTH: 0.365724
G1 F2313
G1 X130.841 Y130.45 E.00565
; LINE_WIDTH: 0.33091
G1 X130.347 Y130.594 E.01208
G1 X132.367 Y128.714 F30000
; LINE_WIDTH: 0.124663
G1 F2313
G1 X132.481 Y128.55 E.00133
; LINE_WIDTH: 0.152405
G1 X132.594 Y128.385 E.00178
G1 X132.583 Y128.083 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2313
G1 X130.083 Y130.583 E.10861
G1 X129.55 Y130.583
G1 X132.583 Y127.55 E.13178
G1 X132.583 Y127.017
G1 X129.017 Y130.583 E.15496
G1 X128.483 Y130.583
G1 X132.583 Y126.483 E.17813
G1 X132.583 Y125.95
G1 X127.95 Y130.583 E.2013
G1 X127.417 Y130.583
G1 X132.583 Y125.417 E.22448
G1 X132.583 Y124.884
G1 X126.884 Y130.583 E.24765
G1 X126.35 Y130.583
G1 X132.583 Y124.35 E.27082
G1 X132.583 Y123.817
G1 X125.817 Y130.583 E.294
G1 X125.461 Y130.405
G1 X132.418 Y123.448 E.30232
G1 X132.204 Y123.129
G1 X125.128 Y130.205 E.3075
G1 X124.819 Y129.981
G1 X131.979 Y122.821 E.31113
G1 X131.736 Y122.531
G1 X124.541 Y129.726 E.31265
G1 X124.262 Y129.471
G1 X131.462 Y122.271 E.31287
G1 X131.189 Y122.011
G1 X124.024 Y129.176 E.31137
G1 X123.799 Y128.867
G1 X130.87 Y121.797 E.30724
G1 X130.716 Y121.417
G1 X123.578 Y128.556 E.3102
G1 X123.417 Y128.183
G1 X130.183 Y121.417 E.29399
G1 X129.65 Y121.417
G1 X123.417 Y127.65 E.27082
G1 X123.417 Y127.116
G1 X129.116 Y121.417 E.24764
G1 X128.583 Y121.417
G1 X123.417 Y126.583 E.22447
G1 X123.417 Y126.05
G1 X128.05 Y121.417 E.2013
G1 X127.516 Y121.417
G1 X123.417 Y125.516 E.17812
G1 X123.417 Y124.983
G1 X126.983 Y121.417 E.15495
G1 X126.45 Y121.417
G1 X123.417 Y124.45 E.13178
G1 X123.417 Y123.917
G1 X125.917 Y121.417 E.10861
M204 S10000
G1 X125.471 Y121.399 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.173909
G1 F2313
G1 X125.157 Y121.83 E.0057
; LINE_WIDTH: 0.155794
G1 X124.977 Y121.979 E.00215
; LINE_WIDTH: 0.238095
G1 X124.797 Y122.127 E.00371
G1 X124.085 Y122.843 E.01605
; LINE_WIDTH: 0.240404
G1 X123.966 Y122.99 E.00305
; LINE_WIDTH: 0.202346
G1 X123.846 Y123.137 E.00246
; LINE_WIDTH: 0.164287
G1 X123.727 Y123.284 E.00188
; LINE_WIDTH: 0.126229
G1 X123.607 Y123.432 E.00129
; WIPE_START
G1 F24000
G1 X123.727 Y123.284 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.347 Y123.721 Z2.4 F30000
G1 X132.584 Y123.792 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.0987746
G1 F2313
G1 X132.483 Y123.65 E.00079
G1 X132.386 Y128.574 F30000
; LINE_WIDTH: 0.0881686
G1 F2313
G1 X132.275 Y128.722 E.00068
; LINE_WIDTH: 0.136857
G1 X132.165 Y128.869 E.00141
; LINE_WIDTH: 0.185545
G1 X131.822 Y129.241 E.00588
; LINE_WIDTH: 0.226843
G1 X131.479 Y129.613 E.00758
; LINE_WIDTH: 0.268141
G1 X131.226 Y129.837 E.00621
; LINE_WIDTH: 0.227778
G1 X130.973 Y130.062 E.00509
; LINE_WIDTH: 0.187415
G1 X130.72 Y130.286 E.00398
; LINE_WIDTH: 0.147053
G1 X130.636 Y130.347 E.00088
; LINE_WIDTH: 0.117611
G1 X130.552 Y130.407 E.00063
G1 X125.568 Y130.594 F30000
; LINE_WIDTH: 0.180068
G1 F2313
G1 X125.346 Y130.428 E.00311
; LINE_WIDTH: 0.138494
M73 P67 R3
G1 X125.123 Y130.262 E.00216
G1 X124.026 Y130.194 F30000
; LINE_WIDTH: 0.117871
G1 F2313
G3 X123.824 Y129.658 I5.128 J-2.24 E.0035
G1 X123.606 Y129.054 F30000
; LINE_WIDTH: 0.215884
G1 F2313
G1 X123.413 Y128.344 E.01037
; WIPE_START
G1 F24000
G1 X123.606 Y129.054 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X130.148 Y125.123 Z2.4 F30000
G1 X132.589 Y123.657 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.243359
G1 F2313
G1 X132.39 Y122.941 E.01214
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.589 Y123.657 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 11/40
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
G3 Z2.4 I.284 J-1.183 P1  F30000
G1 X125.398 Y121.929 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z2.6 F30000
G1 X123.771 Y128.397 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z2.6 F30000
G1 X125.79 Y122.138 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02751
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X130.39 Y129.767 E.02752
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02752
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115027
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414675
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.482 Y121.991 E.00304
G1 X123.991 Y121.991 E.01485
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433772
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388128
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342483
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296838
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251194
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202338
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156674
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126797
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233646
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.124909
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.0969197
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408098
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348307
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388944
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332403
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.288519
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244635
M73 P68 R3
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139405
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.09692
G1 X131.335 Y129.813 E.00121
G1 X131.921 Y129.921 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.589342
G1 F1200
G1 X131.91 Y129.821 E.00447
; LINE_WIDTH: 0.618818
G1 X131.898 Y129.722 E.00471
G1 X132.369 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370639
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.35747
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314045
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.27062
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227195
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.18377
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189745
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.28257
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137195
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415377
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 12/40
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
G3 Z2.6 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z2.8 F30000
G1 Z2.4
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z2.8 F30000
G1 X123.771 Y128.397 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z2.8 F30000
G1 X125.79 Y122.138 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X130.39 Y129.767 E.02752
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02751
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115027
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414674
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.529 Y122.015 E.00152
G1 X123.991 Y121.991 E.0163
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433773
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388128
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342484
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296839
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251195
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.20234
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156676
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126798
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183922
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227422
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233642
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.124909
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.0969198
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408096
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348305
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388945
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332404
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
M73 P69 R3
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.14491
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.1929
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240889
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.288878
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.298168
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139406
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.0969211
G1 X131.335 Y129.813 E.00121
G1 X131.921 Y129.921 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.589338
G1 F1200
G1 X131.91 Y129.821 E.00447
; LINE_WIDTH: 0.618816
G1 X131.898 Y129.722 E.00471
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370639
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.357468
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314044
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.270619
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227194
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.18377
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189745
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.282572
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137195
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415376
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 13/40
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
G3 Z2.8 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z3 F30000
G1 Z2.6
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z3 F30000
G1 Z2.6
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z3 F30000
G1 X123.771 Y128.397 Z3
G1 Z2.6
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z3 F30000
G1 X125.79 Y122.138 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X130.39 Y129.767 E.02752
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02752
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115027
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414674
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.529 Y122.015 E.00152
G1 X123.991 Y121.991 E.0163
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433773
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388129
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296841
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251197
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202342
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156678
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126799
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233644
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.124909
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.096921
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408651
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.093 Y129.67 E.00388
G1 X123.988 Y129.654 E.00315
G1 X123.988 Y130.012 E.01066
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348305
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388945
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332404
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
M73 P70 R3
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139406
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.0969212
G1 X131.335 Y129.813 E.00121
G1 X131.921 Y129.921 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.589338
G1 F1200
G1 X131.91 Y129.821 E.00447
; LINE_WIDTH: 0.618816
G1 X131.898 Y129.722 E.00471
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370641
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.357471
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314046
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.270621
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227196
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.183771
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189745
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.282572
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137195
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415375
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 14/40
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
G3 Z3 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z3.2 F30000
G1 Z2.8
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z3.2 F30000
G1 X123.771 Y128.397 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z3.2 F30000
G1 X125.79 Y122.138 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X130.39 Y129.767 E.02752
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02752
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115027
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414674
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.529 Y122.015 E.00152
G1 X123.991 Y121.991 E.0163
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433773
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388129
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296841
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251197
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202342
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156678
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126799
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233644
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.124909
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.0969199
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408095
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348305
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388945
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332404
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
M73 P71 R3
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139406
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.0969212
G1 X131.335 Y129.813 E.00121
G1 X131.918 Y129.918 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.59526
G1 F1200
G1 X131.908 Y129.82 E.00443
; LINE_WIDTH: 0.621994
G1 X131.898 Y129.722 E.00464
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370642
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.357471
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314046
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.270621
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227196
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.183771
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189745
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.282572
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137195
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415375
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 15/40
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
G3 Z3.2 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z3.4 F30000
G1 Z3
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z3.4 F30000
G1 Z3
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z3.4 F30000
G1 X123.771 Y128.397 Z3.4
G1 Z3
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z3.4 F30000
G1 X125.79 Y122.138 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X130.39 Y129.767 E.02752
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02752
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
M73 P71 R2
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115027
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414674
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.529 Y122.015 E.00152
G1 X123.991 Y121.991 E.0163
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433774
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388129
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296841
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251197
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202342
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156678
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126799
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233644
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.12491
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.0969199
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408095
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348305
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388945
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332404
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
M73 P72 R2
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139406
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.0969212
G1 X131.335 Y129.813 E.00121
G1 X131.921 Y129.921 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.589338
G1 F1200
G1 X131.91 Y129.821 E.00447
; LINE_WIDTH: 0.618816
G1 X131.898 Y129.722 E.00471
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370642
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.357471
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314046
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.270621
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227196
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.183771
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189745
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.282572
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137195
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415375
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 16/40
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
G3 Z3.4 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z3.6 F30000
G1 Z3.2
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z3.6 F30000
G1 X123.771 Y128.397 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z3.6 F30000
G1 X125.79 Y122.138 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X130.39 Y129.767 E.02752
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02751
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115027
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414674
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.529 Y122.015 E.00152
G1 X123.991 Y121.991 E.0163
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433773
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388129
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296841
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251197
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202342
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156678
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126799
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233644
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.12491
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.0969199
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408095
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348305
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388945
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332404
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
M73 P73 R2
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139406
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.0969212
G1 X131.335 Y129.813 E.00121
G1 X131.921 Y129.921 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.589338
G1 F1200
G1 X131.91 Y129.821 E.00447
; LINE_WIDTH: 0.618816
G1 X131.898 Y129.722 E.00471
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370639
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.357469
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314044
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.270619
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227195
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.18377
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189745
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.282572
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137195
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415375
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 17/40
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
G3 Z3.6 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z3.8 F30000
G1 Z3.4
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z3.8 F30000
G1 Z3.4
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z3.8 F30000
G1 X123.771 Y128.397 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z3.8 F30000
G1 X125.79 Y122.138 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X130.206 Y129.859 E.02118
G1 X130.39 Y129.767 E.00633
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02752
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115027
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414674
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.529 Y122.015 E.00152
G1 X123.991 Y121.991 E.0163
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433773
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388129
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296841
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251197
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202342
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156678
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126799
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233644
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.124909
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.0969199
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408097
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348305
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388945
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332404
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
M73 P74 R2
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139406
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.0969212
G1 X131.335 Y129.813 E.00121
G1 X131.921 Y129.921 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.589338
G1 F1200
G1 X131.91 Y129.821 E.00447
; LINE_WIDTH: 0.618816
G1 X131.898 Y129.722 E.00471
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370641
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.357471
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314046
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.270621
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227196
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.183771
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189745
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.282572
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137196
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415376
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 18/40
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
G3 Z3.8 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z4 F30000
G1 Z3.6
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z4 F30000
G1 Z3.6
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z4 F30000
G1 X123.771 Y128.397 Z4
G1 Z3.6
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z4 F30000
G1 X125.79 Y122.138 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X130.39 Y129.767 E.02752
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02752
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115027
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414674
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.529 Y122.015 E.00152
G1 X123.991 Y121.991 E.0163
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433773
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388129
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296841
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251197
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202342
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156678
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126799
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233644
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.124909
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.0969197
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408097
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348305
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388945
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332404
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
M73 P75 R2
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139406
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.0969212
G1 X131.335 Y129.813 E.00121
G1 X131.921 Y129.921 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.589338
G1 F1200
G1 X131.91 Y129.821 E.00447
; LINE_WIDTH: 0.618816
G1 X131.898 Y129.722 E.00471
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370641
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.35747
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314045
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.27062
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227195
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.18377
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189745
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.282572
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137195
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415375
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 19/40
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
G3 Z4 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37033
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z4.2 F30000
G1 X123.771 Y128.397 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z4.2 F30000
G1 X125.79 Y122.138 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X130.39 Y129.767 E.02752
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02751
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115028
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414674
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.529 Y122.015 E.00152
G1 X123.991 Y121.991 E.0163
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433774
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.38813
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296841
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251197
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202342
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156678
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126799
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233644
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.124909
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.0969199
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408097
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348305
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388945
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332404
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
M73 P76 R2
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139406
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.0969212
G1 X131.335 Y129.813 E.00121
G1 X131.921 Y129.921 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.589338
G1 F1200
G1 X131.91 Y129.821 E.00447
; LINE_WIDTH: 0.618816
G1 X131.898 Y129.722 E.00471
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370639
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.357469
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314044
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.270619
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227195
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.18377
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189745
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.282572
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137195
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415375
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 20/40
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
G3 Z4.2 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z4.4 F30000
G1 Z4
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z4.4 F30000
G1 Z4
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z4.4 F30000
G1 X123.771 Y128.397 Z4.4
G1 Z4
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z4.4 F30000
G1 X125.79 Y122.138 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X125.851 Y129.886 E.01856
G1 X126.1 Y130.036 E.00895
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X130.13 Y129.897 E.01856
G1 X130.39 Y129.767 E.00895
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02752
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115027
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414674
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.529 Y122.015 E.00152
G1 X123.991 Y121.991 E.0163
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433773
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388129
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296841
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251197
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202342
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156678
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126799
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233644
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.124909
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.0969199
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408098
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348305
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388945
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332404
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
M73 P77 R2
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139407
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.0969212
G1 X131.335 Y129.813 E.00121
G1 X131.918 Y129.918 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.59526
G1 F1200
G1 X131.908 Y129.82 E.00443
; LINE_WIDTH: 0.621994
G1 X131.898 Y129.722 E.00464
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370642
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.357471
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314046
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.270621
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227196
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.183771
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189745
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.282572
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137196
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415375
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 21/40
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
G3 Z4.4 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z4.6 F30000
G1 Z4.2
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z4.6 F30000
G1 Z4.2
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z4.6 F30000
G1 X123.771 Y128.397 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z4.6 F30000
G1 X125.79 Y122.138 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X130.39 Y129.767 E.02752
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02751
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115027
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414674
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.482 Y121.991 E.00304
G1 X123.991 Y121.991 E.01485
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433773
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388129
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296841
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251197
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202342
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156678
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126799
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233644
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.124909
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.0969199
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408097
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348305
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388945
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332404
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
M73 P78 R2
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139406
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.0969212
G1 X131.335 Y129.813 E.00121
G1 X131.921 Y129.921 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.589338
G1 F1200
G1 X131.91 Y129.821 E.00447
; LINE_WIDTH: 0.618816
G1 X131.898 Y129.722 E.00471
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370639
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.357469
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314044
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.270619
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227195
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.18377
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189745
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.282572
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137195
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415375
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 22/40
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
G3 Z4.6 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z4.8 F30000
G1 Z4.4
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z4.8 F30000
G1 Z4.4
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z4.8 F30000
G1 X123.771 Y128.397 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z4.8 F30000
G1 X125.79 Y122.138 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X130.079 Y129.923 E.01682
G1 X130.39 Y129.767 E.0107
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02751
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115027
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414674
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.529 Y122.015 E.00152
G1 X123.991 Y121.991 E.0163
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433773
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388129
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296841
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251197
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202342
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156678
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126799
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233644
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.12491
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.0969199
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408095
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348305
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388945
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332404
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
M73 P79 R2
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139407
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.0969212
G1 X131.335 Y129.813 E.00121
G1 X131.918 Y129.918 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.59526
G1 F1200
G1 X131.908 Y129.82 E.00443
; LINE_WIDTH: 0.621994
G1 X131.898 Y129.722 E.00464
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370639
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.357469
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314044
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.270619
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227195
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.18377
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189745
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.282572
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137195
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415375
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 23/40
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
G3 Z4.8 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z5 F30000
G1 Z4.6
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z5 F30000
G1 Z4.6
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z5 F30000
G1 X123.771 Y128.397 Z5
G1 Z4.6
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z5 F30000
G1 X125.79 Y122.138 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X130.054 Y129.936 E.01594
G1 X130.39 Y129.767 E.01157
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02751
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115027
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414674
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.529 Y122.015 E.00152
G1 X123.991 Y121.991 E.0163
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433773
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388129
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296841
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251197
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202342
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156678
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126799
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233644
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.124909
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.0969199
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408097
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348305
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388945
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332404
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
M73 P80 R2
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139407
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.0969212
G1 X131.335 Y129.813 E.00121
G1 X131.918 Y129.918 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.59526
G1 F1200
G1 X131.908 Y129.82 E.00443
; LINE_WIDTH: 0.621994
G1 X131.898 Y129.722 E.00464
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370639
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.357469
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314044
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.270619
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227195
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.18377
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189745
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.282572
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137195
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415375
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 24/40
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
G3 Z5 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z5.2 F30000
G1 Z4.8
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z5.2 F30000
G1 Z4.8
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z5.2 F30000
G1 X123.771 Y128.397 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z5.2 F30000
G1 X125.79 Y122.138 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X130.39 Y129.767 E.02752
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02751
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115027
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414674
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.529 Y122.015 E.00152
G1 X123.991 Y121.991 E.0163
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433773
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388129
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296841
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251197
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202342
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156678
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126799
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233644
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.124908
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.0969197
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408097
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348305
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388945
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332404
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
M73 P81 R2
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139406
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.0969212
G1 X131.335 Y129.813 E.00121
G1 X131.921 Y129.921 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.589338
G1 F1200
G1 X131.91 Y129.821 E.00447
; LINE_WIDTH: 0.618816
G1 X131.898 Y129.722 E.00471
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370639
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.357469
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314044
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.270619
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227195
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.18377
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189745
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.282572
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137195
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415375
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P81 R1
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 25/40
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
G3 Z5.2 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z5.4 F30000
G1 Z5
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z5.4 F30000
G1 X123.771 Y128.397 Z5.4
G1 Z5
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z5.4 F30000
G1 X125.79 Y122.138 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X130.39 Y129.767 E.02752
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02752
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115027
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414674
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.529 Y122.015 E.00152
G1 X123.991 Y121.991 E.0163
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433773
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388129
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296841
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251197
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202342
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156678
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126799
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233644
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.124909
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.0969199
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408097
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348305
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388945
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332404
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
M73 P82 R1
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139406
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.0969212
G1 X131.335 Y129.813 E.00121
G1 X131.921 Y129.921 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.589338
G1 F1200
G1 X131.91 Y129.821 E.00447
; LINE_WIDTH: 0.618816
G1 X131.898 Y129.722 E.00471
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370641
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.35747
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314045
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.27062
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227195
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.18377
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189745
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.282572
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137195
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415375
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 26/40
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
G3 Z5.4 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z5.6 F30000
G1 Z5.2
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z5.6 F30000
G1 Z5.2
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z5.6 F30000
G1 X123.771 Y128.397 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z5.6 F30000
G1 X125.79 Y122.138 Z5.6
G1 Z5.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X129.977 Y129.974 E.01332
G1 X130.39 Y129.767 E.01419
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02751
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115027
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414674
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.529 Y122.015 E.00152
G1 X123.991 Y121.991 E.0163
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433773
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388129
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296841
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251197
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202342
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156678
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126799
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233644
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.124909
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.0969199
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408097
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348305
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388945
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332404
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139407
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.0969212
G1 X131.335 Y129.813 E.00121
G1 X131.918 Y129.918 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.59526
G1 F1200
G1 X131.908 Y129.82 E.00443
; LINE_WIDTH: 0.621994
G1 X131.898 Y129.722 E.00464
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370639
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.357469
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314044
M73 P83 R1
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.270619
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227195
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.18377
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189745
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.282572
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137195
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415375
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 27/40
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
G3 Z5.6 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z5.8 F30000
G1 Z5.4
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z5.8 F30000
G1 Z5.4
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z5.8 F30000
G1 X123.771 Y128.397 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z5.8 F30000
G1 X125.79 Y122.138 Z5.8
G1 Z5.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X130.39 Y129.767 E.02752
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02751
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115027
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414674
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.529 Y122.015 E.00152
G1 X123.991 Y121.991 E.0163
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433773
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388129
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296841
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251197
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202342
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156678
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126799
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233644
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.124909
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.0969199
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408097
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348305
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388945
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332404
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139406
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.0969212
G1 X131.335 Y129.813 E.00121
G1 X131.921 Y129.921 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.589338
G1 F1200
G1 X131.91 Y129.821 E.00447
; LINE_WIDTH: 0.618816
G1 X131.898 Y129.722 E.00471
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370639
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.357469
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314044
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.270619
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227195
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.18377
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
M73 P84 R1
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189745
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.28257
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137195
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415375
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 28/40
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
G3 Z5.8 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z6 F30000
G1 Z5.6
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z6 F30000
G1 Z5.6
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z6 F30000
G1 X123.771 Y128.397 Z6
G1 Z5.6
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z6 F30000
G1 X125.79 Y122.138 Z6
G1 Z5.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X129.926 Y129.999 E.01157
G1 X130.39 Y129.767 E.01594
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02751
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115027
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414674
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.529 Y122.015 E.00152
G1 X123.991 Y121.991 E.0163
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433773
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388129
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296841
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251197
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202342
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156678
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126799
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233644
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.124909
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.0969199
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408097
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348305
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388945
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332404
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139407
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.0969212
G1 X131.335 Y129.813 E.00121
G1 X131.918 Y129.918 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.59526
G1 F1200
G1 X131.908 Y129.82 E.00443
; LINE_WIDTH: 0.621994
G1 X131.898 Y129.722 E.00464
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370639
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.357469
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314044
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.270619
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227195
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.18377
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189745
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.28257
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137195
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415375
G1 F1200
M73 P85 R1
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 29/40
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
G3 Z6 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z6.2 F30000
G1 Z5.8
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z6.2 F30000
G1 Z5.8
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z6.2 F30000
G1 X123.771 Y128.397 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z6.2 F30000
G1 X125.79 Y122.138 Z6.2
G1 Z5.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X129.901 Y130.012 E.0107
G1 X130.39 Y129.767 E.01682
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02751
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115027
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414674
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.529 Y122.015 E.00152
G1 X123.991 Y121.991 E.0163
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433773
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388129
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296841
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251197
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202342
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156678
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126799
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233644
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.124909
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.0969199
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408097
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348305
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388945
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332404
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139407
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.0969212
G1 X131.335 Y129.813 E.00121
G1 X131.918 Y129.918 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.59526
G1 F1200
G1 X131.908 Y129.82 E.00443
; LINE_WIDTH: 0.621994
G1 X131.898 Y129.722 E.00464
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370639
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.357469
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314044
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.270619
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227195
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.18377
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189745
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.282572
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137195
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415375
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
M73 P86 R1
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 30/40
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
G3 Z6.2 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z6.4 F30000
G1 Z6
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z6.4 F30000
G1 Z6
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z6.4 F30000
G1 X123.771 Y128.397 Z6.4
G1 Z6
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z6.4 F30000
G1 X125.79 Y122.138 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X130.39 Y129.767 E.02752
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02751
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115027
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414674
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.529 Y122.015 E.00152
G1 X123.991 Y121.991 E.0163
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433773
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388129
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296841
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251197
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202342
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156678
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126799
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233644
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.124908
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.0969197
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408097
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348305
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388945
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332404
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139406
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.0969212
G1 X131.335 Y129.813 E.00121
G1 X131.921 Y129.921 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.589338
G1 F1200
G1 X131.91 Y129.821 E.00447
; LINE_WIDTH: 0.618816
G1 X131.898 Y129.722 E.00471
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370639
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.357469
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314044
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.270619
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227195
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.18377
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189745
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.282572
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137195
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415375
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 31/40
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
G3 Z6.4 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
M73 P87 R1
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z6.6 F30000
G1 Z6.2
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z6.6 F30000
G1 Z6.2
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z6.6 F30000
G1 X123.771 Y128.397 Z6.6
G1 Z6.2
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z6.6 F30000
G1 X125.79 Y122.138 Z6.6
G1 Z6.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X129.85 Y130.038 E.00895
G1 X130.39 Y129.767 E.01856
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02751
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115027
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414674
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.529 Y122.015 E.00152
G1 X123.991 Y121.991 E.0163
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433773
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388129
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296841
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251197
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202342
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156678
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126799
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233644
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.124908
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.0969197
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408097
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348305
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388945
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332404
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139407
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.0969212
G1 X131.335 Y129.813 E.00121
G1 X131.918 Y129.918 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.59526
G1 F1200
G1 X131.908 Y129.82 E.00443
; LINE_WIDTH: 0.621994
G1 X131.898 Y129.722 E.00464
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370639
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.357469
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314044
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.270619
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227195
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.18377
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189744
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236156
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.28257
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137195
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415375
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 32/40
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
G3 Z6.6 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z6.8 F30000
M73 P88 R1
G1 Z6.4
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z6.8 F30000
G1 Z6.4
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z6.8 F30000
G1 X123.771 Y128.397 Z6.8
G1 Z6.4
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z6.8 F30000
G1 X125.79 Y122.138 Z6.8
G1 Z6.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X129.825 Y130.05 E.00808
G1 X130.39 Y129.767 E.01944
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02752
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115027
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414675
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.529 Y122.015 E.00152
G1 X123.991 Y121.991 E.0163
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433773
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388129
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296841
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251197
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202342
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156678
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126799
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233644
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.124909
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.0969199
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408097
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348305
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388945
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332404
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139406
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.0969212
G1 X131.335 Y129.813 E.00121
G1 X131.921 Y129.921 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.589338
G1 F1200
G1 X131.91 Y129.821 E.00447
; LINE_WIDTH: 0.618816
G1 X131.898 Y129.722 E.00471
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370641
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.357471
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314046
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.270621
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227196
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.183771
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189745
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.282572
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137195
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415375
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 33/40
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
G3 Z6.8 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z7 F30000
G1 Z6.6
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
M73 P89 R1
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z7 F30000
G1 Z6.6
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z7 F30000
G1 X123.771 Y128.397 Z7
G1 Z6.6
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z7 F30000
G1 X125.79 Y122.138 Z7
G1 Z6.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X130.39 Y129.767 E.02752
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02752
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115027
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414674
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.529 Y122.015 E.00152
G1 X123.991 Y121.991 E.0163
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433773
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388129
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296841
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251197
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202342
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156678
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126799
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233644
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.124909
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.0969199
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408097
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348305
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388945
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332404
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139406
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.0969212
G1 X131.335 Y129.813 E.00121
G1 X131.921 Y129.921 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.589338
G1 F1200
G1 X131.91 Y129.821 E.00447
; LINE_WIDTH: 0.618816
G1 X131.898 Y129.722 E.00471
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370641
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.357471
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314046
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.270621
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227196
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.183771
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189745
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.282572
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137195
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415375
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 34/40
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
G3 Z7 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z7.2 F30000
G1 Z6.8
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
M73 P90 R1
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z7.2 F30000
G1 X123.771 Y128.397 Z7.2
G1 Z6.8
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z7.2 F30000
G1 X125.79 Y122.138 Z7.2
G1 Z6.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X129.774 Y130.076 E.00633
G1 X130.39 Y129.767 E.02118
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02751
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115027
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414674
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.529 Y122.015 E.00152
G1 X123.991 Y121.991 E.0163
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433773
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388129
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296841
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251197
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202342
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156678
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126799
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233644
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.124908
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.0969197
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408097
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348305
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388945
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332404
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
M73 P90 R0
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139406
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.0969212
G1 X131.335 Y129.813 E.00121
G1 X131.921 Y129.921 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.589338
G1 F1200
G1 X131.91 Y129.821 E.00447
; LINE_WIDTH: 0.618816
G1 X131.898 Y129.722 E.00471
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370639
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.357469
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314044
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.270619
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227195
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.18377
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189745
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.282572
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137195
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415375
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 35/40
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
G3 Z7.2 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z7.4 F30000
G1 Z7
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z7.4 F30000
G1 Z7
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
M73 P91 R0
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z7.4 F30000
G1 X123.771 Y128.397 Z7.4
G1 Z7
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z7.4 F30000
G1 X125.79 Y122.138 Z7.4
G1 Z7
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X129.749 Y130.089 E.00546
G1 X130.39 Y129.767 E.02206
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02751
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115027
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414675
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.529 Y122.015 E.00152
G1 X123.991 Y121.991 E.0163
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433773
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388129
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296841
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251197
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202342
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156678
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126799
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233644
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.124908
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.0969197
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408097
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348305
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388945
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332404
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139407
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.0969212
G1 X131.335 Y129.813 E.00121
G1 X131.918 Y129.918 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.59526
G1 F1200
G1 X131.908 Y129.82 E.00443
; LINE_WIDTH: 0.621994
G1 X131.898 Y129.722 E.00464
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370639
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.357469
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314044
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.270619
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227195
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.18377
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189745
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.282572
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137196
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415376
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 36/40
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
G3 Z7.4 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z7.6 F30000
G1 Z7.2
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z7.6 F30000
G1 Z7.2
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z7.6 F30000
G1 X123.771 Y128.397 Z7.6
M73 P92 R0
G1 Z7.2
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z7.6 F30000
G1 X125.79 Y122.138 Z7.6
G1 Z7.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X130.39 Y129.767 E.02752
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02751
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115027
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414674
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.529 Y122.015 E.00152
G1 X123.991 Y121.991 E.0163
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433773
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388129
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296841
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251197
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202342
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156678
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126799
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233644
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.124908
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.0969197
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408097
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348305
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388945
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332404
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139406
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.096921
G1 X131.335 Y129.813 E.00121
G1 X131.921 Y129.921 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.589338
G1 F1200
G1 X131.91 Y129.821 E.00447
; LINE_WIDTH: 0.618816
G1 X131.898 Y129.722 E.00471
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370639
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.357469
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314044
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.270619
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227195
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.18377
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189745
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.28257
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137195
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415375
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 37/40
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
G3 Z7.6 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z7.8 F30000
G1 Z7.4
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z7.8 F30000
G1 Z7.4
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z7.8 F30000
G1 X123.771 Y128.397 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F1200
M73 P93 R0
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z7.8 F30000
G1 X125.79 Y122.138 Z7.8
G1 Z7.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X129.698 Y130.114 E.00371
G1 X130.39 Y129.767 E.02381
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02751
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115027
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.523 Y122.091 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414674
G1 F1200
G1 X124.559 Y122.056 E.00152
G1 X124.482 Y121.991 E.00304
G1 X123.991 Y121.991 E.01485
G1 X123.991 Y122.578 E.01776
G1 X124.037 Y122.584 E.0014
G1 X124.481 Y122.134 E.01914
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433773
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388129
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296841
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251197
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202342
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156678
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126799
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233644
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.124908
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.0969197
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408097
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348305
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388945
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332404
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139406
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.0969212
G1 X131.335 Y129.813 E.00121
G1 X131.921 Y129.921 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.589338
G1 F1200
G1 X131.91 Y129.821 E.00447
; LINE_WIDTH: 0.618816
G1 X131.898 Y129.722 E.00471
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370639
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.357469
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314044
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.270619
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227195
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.18377
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189744
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236156
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.28257
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137195
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415377
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 38/40
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
G3 Z7.8 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z8 F30000
G1 Z7.6
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z8 F30000
G1 Z7.6
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z8 F30000
G1 X123.771 Y128.397 Z8
G1 Z7.6
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
M73 P94 R0
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z8 F30000
G1 X125.79 Y122.138 Z8
G1 Z7.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02751
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X129.672 Y130.127 E.00284
G1 X130.39 Y129.767 E.02468
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02752
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115027
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414675
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.529 Y122.015 E.00152
G1 X123.991 Y121.991 E.0163
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102526
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433773
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388129
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296841
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251197
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202342
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156678
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126799
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233644
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.12491
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.09692
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408092
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348302
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388945
G1 X125.99 Y130.405 E.00149
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332403
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.288519
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139406
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.0969212
G1 X131.335 Y129.813 E.00121
G1 X131.921 Y129.921 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.58934
G1 F1200
G1 X131.91 Y129.821 E.00447
; LINE_WIDTH: 0.618817
G1 X131.898 Y129.722 E.00471
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370641
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.357471
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314046
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.270621
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227196
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.183771
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189745
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.28257
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137195
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415375
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 39/40
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
G3 Z8 I.101 J-1.213 P1  F30000
G1 X125.398 Y121.929 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X124.906 Y122.259 E.01966
G1 X124.221 Y122.952 E.03233
G1 X123.777 Y123.633 E.02696
G1 X123.602 Y123.581 E.00604
G1 X123.602 Y121.602 E.06563
G1 X125.398 Y121.602 E.05957
G1 X125.398 Y121.869 E.00885
; WIPE_START
G1 F24000
G1 X124.906 Y122.259 E-.23863
G1 X124.221 Y122.952 E-.37034
G1 X124.004 Y123.285 E-.15104
; WIPE_END
G1 E-.04 F1800
G1 X130.602 Y121.925 Z8.2 F30000
G1 Z7.8
G1 E.8 F1800
G1 F1200
G1 X130.602 Y121.602 E.0107
G1 X132.398 Y121.602 E.05957
G1 X132.398 Y123.553 E.06472
G1 X132.208 Y123.596 E.00646
G1 X132.163 Y123.502 E.00347
G1 X131.648 Y122.797 E.02897
G1 X131.015 Y122.195 E.02897
G1 X130.652 Y121.958 E.01438
; WIPE_START
G1 F24000
G1 X130.602 Y121.602 E-.13643
G1 X132.243 Y121.602 E-.62357
; WIPE_END
G1 E-.04 F1800
G1 X132.214 Y128.361 Z8.2 F30000
G1 Z7.8
G1 E.8 F1800
G1 F1200
G1 X132.398 Y128.408 E.00628
G1 X132.398 Y130.398 E.066
G1 X130.426 Y130.398 E.06543
G1 X130.381 Y130.21 E.00641
G1 X130.601 Y130.099 E.00818
G1 X131.368 Y129.497 E.03233
G1 X131.998 Y128.754 E.03233
G1 X132.186 Y128.414 E.01289
; WIPE_START
G1 F24000
G1 X132.398 Y128.408 E-.08074
G1 X132.398 Y130.196 E-.67926
; WIPE_END
G1 E-.04 F1800
G1 X124.926 Y128.638 Z8.2 F30000
G1 X123.771 Y128.397 Z8.2
G1 Z7.8
G1 E.8 F1800
G1 F1200
G1 X124.378 Y129.233 E.03427
G1 X125.097 Y129.892 E.03233
G1 X125.642 Y130.219 E.02111
G1 X125.593 Y130.398 E.00616
G1 X123.602 Y130.398 E.06604
G1 X123.602 Y128.452 E.06454
M73 P95 R0
G1 X123.714 Y128.416 E.0039
; WIPE_START
G1 F24000
G1 X124.378 Y129.233 E-.40026
G1 X125.076 Y129.873 E-.35974
; WIPE_END
G1 E-.04 F1800
G1 X125.778 Y122.273 Z8.2 F30000
G1 X125.79 Y122.138 Z8.2
G1 Z7.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X130.39 Y129.767 E.02752
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02752
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.153 Y121.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115028
G1 F1200
G2 X124.962 Y121.947 I.05 J.29 E.00137
G1 X124.037 Y122.584 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.414674
G1 F1200
G1 X124.559 Y122.056 E.02248
G1 X124.529 Y122.015 E.00152
G1 X123.991 Y121.991 E.0163
G1 X123.991 Y122.564 E.01734
G1 X123.91 Y123.012 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.102525
G1 F1200
G2 X123.825 Y123.151 I.127 J.173 E.00081
G1 X123.638 Y123.796 F30000
; LINE_WIDTH: 0.433774
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388129
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.29684
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251195
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.20234
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156676
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126798
G1 X123.431 Y125.084 E.00125
G1 X123.43 Y126.914 F30000
; LINE_WIDTH: 0.140421
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.183923
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.227424
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.233646
G1 X123.618 Y128.241 E.01143
G1 X123.806 Y128.899 F30000
; LINE_WIDTH: 0.12491
G1 F1200
G1 X123.935 Y129.044 E.0013
; LINE_WIDTH: 0.0969199
G1 X124.064 Y129.189 E.00085
G1 X124.656 Y130.012 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.408095
G1 F1200
G1 X124.195 Y129.59 E.0186
G1 X124.09 Y129.674 E.00402
G1 X123.988 Y129.656 E.00307
G1 X123.988 Y130.012 E.0106
G1 X124.596 Y130.012 E.0181
G1 X125.867 Y130.144 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.348315
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388944
G1 X125.99 Y130.405 E.00148
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332404
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
G1 X128.942 Y130.571 F30000
; LINE_WIDTH: 0.144911
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.192901
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240891
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.28888
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.29817
G1 X130.218 Y130.374 E.01113
G1 X130.939 Y130.194 F30000
; LINE_WIDTH: 0.139405
G1 F1200
G1 X131.137 Y130.003 E.00216
; LINE_WIDTH: 0.09692
G1 X131.335 Y129.813 E.00121
G1 X131.921 Y129.921 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.589342
G1 F1200
G1 X131.91 Y129.821 E.00447
; LINE_WIDTH: 0.618819
G1 X131.898 Y129.722 E.00471
G1 X132.37 Y128.199 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.370641
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.357471
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314046
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.270621
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227196
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.183771
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
G1 X132.571 Y125.036 F30000
; LINE_WIDTH: 0.0969195
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143332
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189745
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.282572
G1 X132.371 Y123.76 E.01123
G1 X132.194 Y123.11 F30000
; LINE_WIDTH: 0.137196
G1 F1200
G1 X131.982 Y122.867 E.00248
G1 X131.849 Y122.465 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415375
G1 F1200
G1 X131.944 Y122.383 E.0038
G1 X132.008 Y122.391 E.00196
G1 X132.008 Y121.992 E.0121
G1 X131.364 Y121.992 E.01954
G1 X131.806 Y122.423 E.01874
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P96 R0
G1 F24000
G1 X131.364 Y121.992 E-.25372
G1 X132.008 Y121.992 E-.26452
G1 X132.008 Y122.391 E-.16381
G1 X131.944 Y122.383 E-.02649
G1 X131.849 Y122.465 E-.05146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 66
M625
; layer num/total_layer_count: 40/40
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
G3 Z8.2 I.066 J-1.215 P1  F30000
G1 X125.79 Y122.138 Z8.2
G1 Z8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.157 Y122.562 E.02342
G1 X124.528 Y123.199 E.02752
G1 X124.038 Y123.949 E.02752
G1 X123.708 Y124.782 E.02752
G1 X123.552 Y125.664 E.02752
G1 X123.574 Y126.559 E.02752
G1 X123.775 Y127.431 E.02752
G1 X124.146 Y128.246 E.02752
G1 X124.672 Y128.971 E.02752
G1 X125.332 Y129.576 E.02752
G1 X126.1 Y130.036 E.02752
G1 X126.945 Y130.334 E.02752
G1 X127.832 Y130.458 E.02752
G1 X128.725 Y130.402 E.02752
G1 X129.59 Y130.168 E.02752
G1 X130.39 Y129.767 E.02752
G1 X131.094 Y129.213 E.02752
G1 X131.674 Y128.531 E.02752
G1 X132.105 Y127.746 E.02752
G1 X132.371 Y126.891 E.02752
G1 X132.461 Y126.001 E.02748
G1 X132.389 Y125.201 E.02469
G1 X132.174 Y124.427 E.02466
G1 X131.825 Y123.705 E.02466
G1 X131.352 Y123.057 E.02466
G1 X130.77 Y122.504 E.02466
G1 X130.21 Y122.137 E.02059
G1 X130.21 Y121.21 E.02847
G1 X132.79 Y121.21 E.07928
G1 X132.79 Y130.79 E.29437
G1 X123.21 Y130.79 E.29437
G1 X123.21 Y121.21 E.29437
G1 X125.79 Y121.21 E.07928
G1 X125.79 Y122.078 E.02667
M204 S10000
G1 X125.583 Y121.751 F30000
M204 S2000
; FEATURE: Top surface
G1 F1200
G1 X123.731 Y123.603 E.08044
G1 X123.417 Y123.383
G1 X125.383 Y121.417 E.08543
G1 X124.85 Y121.417
G1 X123.417 Y122.85 E.06226
G1 X123.417 Y122.317
G1 X124.317 Y121.417 E.03909
G1 X123.784 Y121.417
G1 X123.417 Y121.784 E.01591
M204 S10000
; WIPE_START
G1 F24000
G1 X123.784 Y121.417 E-.19679
G1 X124.317 Y121.417 E-.20264
G1 X123.646 Y122.088 E-.36057
; WIPE_END
G1 E-.04 F1800
G1 X125.512 Y121.681 Z8.4 F30000
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.151715
G1 F1200
G2 X125.552 Y121.399 I-.321 J-.189 E.0026
; WIPE_START
G1 F24000
G1 X125.552 Y121.586 E-.48999
G1 X125.512 Y121.681 E-.27001
; WIPE_END
G1 E-.04 F1800
G1 X123.638 Y123.796 Z8.4 F30000
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.433773
G1 F1200
G1 X123.609 Y123.948 E.00492
; LINE_WIDTH: 0.388129
G1 X123.58 Y124.1 E.00435
; LINE_WIDTH: 0.342485
G1 X123.551 Y124.251 E.00377
; LINE_WIDTH: 0.296841
G1 X123.522 Y124.403 E.0032
; LINE_WIDTH: 0.251197
G1 X123.493 Y124.555 E.00262
; LINE_WIDTH: 0.202342
G1 X123.463 Y124.718 E.00216
; LINE_WIDTH: 0.156676
G1 X123.447 Y124.901 E.0017
; LINE_WIDTH: 0.126798
G1 X123.431 Y125.084 E.00125
; WIPE_START
G1 F24000
G1 X123.447 Y124.901 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.43 Y126.914 Z8.4 F30000
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.14042
G1 F1200
G1 X123.453 Y127.114 E.0016
; LINE_WIDTH: 0.18392
G1 X123.476 Y127.315 E.00232
; LINE_WIDTH: 0.22742
G1 X123.498 Y127.515 E.00303
; LINE_WIDTH: 0.23364
G1 X123.618 Y128.241 E.01143
; WIPE_START
G1 F24000
G1 X123.498 Y127.515 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.447 Y129.886 Z8.4 F30000
G1 Z8
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1200
G1 X124.75 Y130.583 E.03026
G1 X124.217 Y130.583
G1 X125.129 Y129.671 E.03963
G1 X124.851 Y129.416
G1 X123.684 Y130.583 E.0507
G1 X123.417 Y130.316
G1 X124.572 Y129.161 E.05019
G1 X124.337 Y128.863
G1 X123.417 Y129.783 E.03997
G1 X123.417 Y129.249
G1 X124.113 Y128.554 E.03022
M204 S10000
G1 X124.026 Y128.437 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0943346
M73 P97 R0
G1 F1200
G1 X123.99 Y128.397 E.00023
G1 X123.399 Y128.502 E.00252
; WIPE_START
G1 F24000
G1 X123.99 Y128.397 E-.69756
G1 X124.026 Y128.437 E-.06244
; WIPE_END
G1 E-.04 F1800
G1 X125.576 Y130.05 Z8.4 F30000
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.10327
G1 F1200
G2 X125.617 Y130.01 I-.046 J-.088 E.00028
G2 X125.52 Y129.931 I-.331 J.307 E.00062
G1 X125.867 Y130.144 F30000
; LINE_WIDTH: 0.348312
G1 F1200
G1 X125.966 Y130.359 E.00588
; LINE_WIDTH: 0.388943
G1 X125.99 Y130.405 E.00148
G1 X126.118 Y130.427 E.00366
; LINE_WIDTH: 0.332403
G1 X126.246 Y130.449 E.00307
; LINE_WIDTH: 0.28852
G1 X126.374 Y130.471 E.0026
; LINE_WIDTH: 0.244636
G1 X126.502 Y130.493 E.00214
; LINE_WIDTH: 0.200752
G1 X126.63 Y130.515 E.00167
; LINE_WIDTH: 0.156868
G1 X126.758 Y130.537 E.00121
; LINE_WIDTH: 0.112984
G1 X126.886 Y130.559 E.00074
; LINE_WIDTH: 0.0976493
G1 X127.024 Y130.569 E.00062
; WIPE_START
G1 F24000
G1 X126.886 Y130.559 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.942 Y130.571 Z8.4 F30000
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.14491
G1 F1200
G1 X129.13 Y130.546 E.00157
; LINE_WIDTH: 0.1929
G1 X129.317 Y130.521 E.00231
; LINE_WIDTH: 0.240889
G1 X129.505 Y130.496 E.00305
; LINE_WIDTH: 0.288878
G1 X129.692 Y130.471 E.00379
; LINE_WIDTH: 0.298168
G1 X130.218 Y130.374 E.01113
; WIPE_START
G1 F24000
G1 X129.692 Y130.471 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.583 Y130.216 Z8.4 F30000
G1 Z8
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1200
G1 X132.216 Y130.583 E.01592
G1 X131.683 Y130.583
G1 X132.583 Y129.683 E.03909
G1 X132.583 Y129.15
G1 X131.15 Y130.583 E.06227
G1 X130.616 Y130.583
G1 X132.583 Y128.616 E.08544
G1 X132.275 Y128.391
G1 X130.408 Y130.258 E.08113
M204 S10000
G1 X130.484 Y130.335 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.12772
G1 F1200
G2 X130.47 Y130.601 I.33 J.151 E.00189
; WIPE_START
G1 F24000
G1 X130.457 Y130.423 E-.50069
G1 X130.484 Y130.335 E-.25931
; WIPE_END
G1 E-.04 F1800
G1 X132.37 Y128.199 Z8.4 F30000
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.370641
G1 F1200
G1 X132.437 Y127.87 E.00896
; LINE_WIDTH: 0.357471
G1 X132.459 Y127.722 E.00382
; LINE_WIDTH: 0.314046
G1 X132.481 Y127.575 E.00329
; LINE_WIDTH: 0.270621
G1 X132.504 Y127.428 E.00277
; LINE_WIDTH: 0.227196
G1 X132.526 Y127.28 E.00224
; LINE_WIDTH: 0.183771
G1 X132.549 Y127.133 E.00171
; LINE_WIDTH: 0.140345
G1 X132.571 Y126.986 E.00118
; WIPE_START
G1 F24000
G1 X132.549 Y127.133 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.571 Y125.036 Z8.4 F30000
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.0969213
G1 F1200
G1 X132.546 Y124.858 E.00079
; LINE_WIDTH: 0.143334
G1 X132.522 Y124.681 E.00146
; LINE_WIDTH: 0.189746
G1 X132.498 Y124.503 E.00214
; LINE_WIDTH: 0.236158
G1 X132.474 Y124.326 E.00282
; LINE_WIDTH: 0.282572
G1 X132.371 Y123.76 E.01123
G1 X131.89 Y123.443 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1200
G1 X132.583 Y122.75 E.03008
G1 X132.583 Y122.217
G1 X131.665 Y123.134 E.03985
G1 X131.426 Y122.841
G1 X132.583 Y121.684 E.05027
G1 X132.316 Y121.417
G1 X131.152 Y122.581 E.05056
G1 X130.875 Y122.325
G1 X131.783 Y121.417 E.03942
G1 X131.249 Y121.417
G1 X130.553 Y122.113 E.03025
M204 S10000
G1 X130.465 Y122.054 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.091605
G1 F1200
G3 X130.399 Y121.959 I.055 J-.109 E.00048
; WIPE_START
G1 F24000
G1 X130.424 Y122.021 E-.42652
G1 X130.465 Y122.054 E-.33348
; WIPE_END
G1 E-.04 F1800
G1 X132.601 Y123.452 Z8.4 F30000
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.102542
G1 F1200
G1 X132.02 Y123.604 E.00292
G3 X131.979 Y123.561 I.106 J-.14 E.00029
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X132.02 Y123.604 E-.06777
G1 X132.601 Y123.452 E-.69223
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
G1 Z8.5 F900 ; lower z a little
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

    G1 Z108 F600
    G1 Z106

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

