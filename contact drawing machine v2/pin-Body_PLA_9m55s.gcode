; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 4m 7s; total estimated time: 9m 55s
; total layer number: 25
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
M73 P0 R9
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
M73 P44 R5
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

M73 P45 R5
G1 X70 F9000
M73 P47 R5
G1 X76 F15000
M73 P50 R4
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
M73 P51 R4
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
    G29 A X114.049 Y122.112 I28.6105 J33.494
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
M73 P52 R4
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
; layer num/total_layer_count: 1/25
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
G1 X117.933 Y139.709 F30000
G1 Z.4
M73 P53 R4
G1 Z.2
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.5
G1 F3000
G1 X118.216 Y141.61 E.07159
G1 X118.216 Y148.34 E.25068
G1 X117.339 Y148.34 E.03267
M73 P54 R4
G1 X117.339 Y139.709 E.32148
G1 X116.462 Y139.709 E.03267
G1 X116.462 Y148.34 E.32148
G1 X116.216 Y148.34 E.00916
G1 X116.216 Y147.874 E.01737
; WIPE_START
G1 F24000
G1 X116.216 Y148.34 E-.17717
G1 X116.462 Y148.34 E-.09343
G1 X116.462 Y147.052 E-.4894
; WIPE_END
M73 P55 R4
G1 E-.04 F1800
G17
G3 Z.6 I-1.131 J-.449 P1  F30000
G1 X115.778 Y148.778 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Support
G1 F3000
M73 P56 R4
G1 X122.409 Y148.778 E.247
G1 X122.409 Y146.778 E.07449
G1 X123.909 Y146.778 E.05586
G1 X123.909 Y153.155 E.23751
G1 X119.964 Y153.155 E.14694
G1 X119.552 Y152.942 E.01728
G2 X119.792 Y152.805 I.027 J-.231 E.01101
G1 X120.18 Y151.549 E.04897
G1 X120.036 Y151.288 E.0111
G2 X118.151 Y151.288 I-.942 J2.761 E.07149
G1 X118.007 Y151.549 E.0111
G1 X118.395 Y152.805 E.04897
G2 X118.635 Y152.942 I.213 J-.094 E.01101
G1 X118.223 Y153.155 E.01728
M73 P57 R4
G1 X114.278 Y153.155 E.14694
G1 X114.278 Y146.778 E.23751
G1 X115.778 Y146.778 E.05586
G1 X115.778 Y148.71 E.07194
G1 X115.366 Y147.19 F30000
G1 F3000
G1 X115.366 Y149.19 E.07449
G1 X122.82 Y149.19 E.27764
G1 X122.82 Y147.19 E.07449
G1 X123.497 Y147.19 E.02522
G1 X123.497 Y152.744 E.20687
G1 X120.241 Y152.744 E.12128
G1 X120.625 Y151.503 E.04838
G1 X120.311 Y150.936 E.02414
M73 P58 R4
G2 X117.875 Y150.936 I-1.218 J3.333 E.0926
G1 X117.562 Y151.503 E.02414
G1 X117.945 Y152.744 E.04838
G1 X114.689 Y152.744 E.12128
G1 X114.689 Y147.19 E.20687
G1 X115.366 Y147.19 E.02522
G1 X115.197 Y149.698 F30000
G1 F3000
G1 X122.99 Y149.698 E.29024
G1 X122.99 Y152.236 E.09455
G1 X120.93 Y152.236 E.07672
G1 X121.174 Y151.446 E.03078
G1 X120.651 Y150.501 E.04024
G2 X117.536 Y150.501 I-1.558 J4.061 E.11867
G1 X117.013 Y151.446 E.04024
G1 X117.257 Y152.236 E.03078
G1 X115.197 Y152.236 E.07672
G1 X115.197 Y149.698 E.09455
G1 X121.068 Y150.206 F30000
G1 F3000
G1 X122.482 Y150.206 E.05266
G1 X122.482 Y151.728 E.05671
G1 X121.618 Y151.728 E.03216
G1 X121.723 Y151.39 E.01319
G1 X121.068 Y150.206 E.0504
G1 X117.119 Y150.206 F30000
G1 F3000
G1 X116.464 Y151.39 E.0504
G1 X116.568 Y151.728 E.01319
G1 X115.705 Y151.728 E.03216
G1 X115.705 Y150.206 E.05671
G1 X117.119 Y150.206 E.05266
; WIPE_START
G1 F24000
G1 X115.705 Y150.206 E-.53724
G1 X115.705 Y150.792 E-.22276
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.151 J.395 P1  F30000
G1 X119.093 Y140.93 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Support interface
G1 F3000
G1 X119.093 Y148.34 E.27599
G1 X119.97 Y148.34 E.03267
M73 P59 R4
G1 X119.97 Y141.61 E.25068
G1 X120.254 Y139.709 E.07159
G1 X120.847 Y139.709 E.02211
G1 X120.847 Y148.34 E.32148
G1 X121.724 Y148.34 E.03267
G1 X121.724 Y139.709 E.32148
G1 X121.97 Y139.709 E.00916
G1 X121.97 Y140.175 E.01737
; WIPE_START
G1 F24000
G1 X121.97 Y139.709 E-.17717
G1 X121.724 Y139.709 E-.09343
G1 X121.724 Y140.996 E-.4894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.19 J-.257 P1  F30000
G1 X119.093 Y153.172 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
G1 F3000
G1 X119.182 Y153.265 E.0048
G1 X119.399 Y153.377 E.0091
G1 X118.788 Y153.377 E.02277
G1 X119.004 Y153.265 E.0091
G1 X119.052 Y153.215 E.00257
; WIPE_START
G1 F24000
G1 X119.182 Y153.265 E-.08092
G1 X119.399 Y153.377 E-.14192
G1 X118.788 Y153.377 E-.35515
G1 X119.004 Y153.265 E-.14192
G1 X119.052 Y153.215 E-.04009
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.217 J0 P1  F30000
G1 X119.052 Y140.665 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X118.939 Y140.665 E.00421
G1 X118.7 Y140.625 E.00901
G1 X118.516 Y140.52 E.00791
G1 X118.385 Y139.641 E.03311
G1 X118.316 Y139.509 E.00555
G1 X118.125 Y139.449 E.00745
G1 X117.963 Y139.473 E.00608
G1 X117.8 Y138.924 E.02132
G1 X117.761 Y138.685 E.00904
G1 X117.765 Y138.437 E.00924
G1 X117.824 Y138.248 E.00736
G1 X117.943 Y138.042 E.00886
G1 X118.116 Y137.891 E.00855
G1 X118.286 Y137.814 E.00698
G1 X118.555 Y137.765 E.01019
G1 X119.632 Y137.765 E.04011
G1 X119.878 Y137.807 E.00929
G1 X120.056 Y137.893 E.00736
G1 X120.243 Y138.041 E.00886
G1 X120.368 Y138.237 E.00867
G1 X120.405 Y138.353 E.00454
M73 P59 R3
G1 X120.425 Y138.69 E.01257
G1 X120.387 Y138.925 E.00886
G1 X120.29 Y139.251 E.0127
G1 X120.169 Y139.251 E.00449
G1 X120.02 Y139.307 E.00593
G1 X119.891 Y139.418 E.00632
G1 X119.814 Y139.557 E.00593
G1 X119.671 Y140.518 E.03618
G1 X119.457 Y140.635 E.00906
G1 X119.25 Y140.665 E.00782
G1 X119.112 Y140.665 E.00513
M73 P60 R3
G1 X119.112 Y140.208 F30000
G1 F3000
G1 X118.92 Y140.208 E.00716
G1 X118.786 Y140.165 E.00523
G1 X118.691 Y140.097 E.00436
G1 X118.607 Y139.979 E.00538
G1 X118.24 Y138.795 E.04618
G1 X118.21 Y138.6 E.00737
G1 X118.222 Y138.486 E.00426
G1 X118.256 Y138.395 E.00361
G1 X118.391 Y138.261 E.0071
G1 X118.535 Y138.222 E.00556
G1 X118.965 Y138.222 E.01601
G1 X119.651 Y138.222 E.02556
G1 X119.762 Y138.251 E.00426
G1 X119.847 Y138.298 E.00361
G1 X119.96 Y138.451 E.0071
G1 X119.974 Y138.519 E.00259
G1 X119.936 Y138.844 E.01218
G1 X119.58 Y139.98 E.04434
G1 X119.495 Y140.097 E.00537
G1 X119.4 Y140.165 E.00436
G1 X119.267 Y140.208 E.00523
G1 X119.172 Y140.208 E.00352
; WIPE_START
G1 F24000
G1 X118.92 Y140.208 E-.09581
G1 X118.786 Y140.165 E-.05337
G1 X118.691 Y140.097 E-.04445
G1 X118.607 Y139.979 E-.0549
G1 X118.24 Y138.795 E-.47112
G1 X118.224 Y138.69 E-.04036
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.216 J.058 P1  F30000
G1 X118.88 Y152.342 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
G1 X118.701 Y151.762 E.02259
G1 X118.815 Y151.732 E.00441
G1 X119.372 Y151.732 E.02073
G1 X119.486 Y151.762 E.00441
G1 X119.307 Y152.342 E.02259
G1 X118.94 Y152.342 E.01368
; WIPE_START
G1 F24000
G1 X118.701 Y151.762 E-.23819
G1 X118.815 Y151.732 E-.045
G1 X119.372 Y151.732 E-.21149
G1 X119.486 Y151.762 E-.045
G1 X119.315 Y152.316 E-.22032
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.217 J-.021 P1  F30000
G1 X119.093 Y139.609 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G3 X118.842 Y138.801 I13.821 J-4.742 E.03152
G1 X119.345 Y138.801 E.01872
G1 X119.176 Y139.359 E.02172
G1 X119.112 Y139.552 E.00756
; WIPE_START
G1 F24000
G1 X118.842 Y138.801 E-.3033
G1 X119.345 Y138.801 E-.19099
G1 X119.176 Y139.359 E-.22159
G1 X119.14 Y139.47 E-.04411
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.369 J1.16 P1  F30000
G1 X120.847 Y138.926 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
G1 F3000
G1 X120.883 Y138.695 E.00872
G1 X120.865 Y138.317 E.0141
G1 X120.769 Y138.016 E.01175
G1 X120.557 Y137.706 E.014
G1 X120.321 Y137.519 E.01122
G1 X120.048 Y137.381 E.01138
G1 X119.689 Y137.311 E.01363
G1 X119.41 Y137.308 E.01041
G1 X119.081 Y136.759 E.02385
G1 X118.833 Y136.187 E.0232
G1 X119.157 Y136.187 E.01206
G1 X119.258 Y136.164 E.00387
G1 X119.869 Y135.862 E.02536
G1 X119.973 Y135.756 E.00555
G1 X119.996 Y135.662 E.00361
G1 X119.999 Y135.495 E.0062
G1 X120.004 Y135.662 E.0062
G1 X120.056 Y135.802 E.00555
G1 X120.128 Y135.86 E.00345
G1 X120.685 Y136.149 E.02337
G1 X120.789 Y136.181 E.00407
G1 X124.91 Y136.187 E.1535
G1 X125.072 Y136.121 E.00651
G1 X125.206 Y135.987 E.00705
G1 X125.273 Y135.825 E.00651
G1 X125.273 Y133.694 E.07938
G1 X125.446 Y133.757 E.00689
G1 X135.246 Y133.757 E.36501
G1 X135.363 Y133.733 E.00442
G1 X135.499 Y133.624 E.00652
G1 X135.546 Y133.539 E.00361
G1 X135.575 Y133.429 E.00426
G1 X135.566 Y132.566 E.03215
G1 X135.551 Y132.512 E.00206
G1 X135.442 Y132.376 E.00652
G1 X135.357 Y132.329 E.00361
G1 X135.246 Y132.3 E.00426
G1 X125.446 Y132.3 E.36501
G1 X125.33 Y132.324 E.00442
G1 X125.273 Y132.37 E.00273
G1 X125.273 Y129.259 E.11588
G1 X125.206 Y129.097 E.00652
G1 X125.072 Y128.963 E.00705
G1 X124.91 Y128.896 E.00651
G1 X123.221 Y128.896 E.06291
G1 X123.088 Y128.951 E.00535
G1 X123.088 Y125.852 E.11545
G1 X123.486 Y125.721 E.01559
G1 X124.294 Y125.539 E.03083
G1 X125.456 Y125.444 E.04343
G1 X135.24 Y125.444 E.36442
G1 X136.073 Y125.493 E.03109
G1 X136.888 Y125.637 E.03084
G1 X137.679 Y125.875 E.03076
G1 X138.678 Y126.331 E.04091
G1 X139.461 Y126.82 E.03436
G1 X140.104 Y127.341 E.03082
G1 X140.682 Y127.933 E.03084
G1 X141.187 Y128.589 E.03084
G1 X141.613 Y129.3 E.03084
G1 X141.952 Y130.057 E.0309
G1 X142.154 Y130.669 E.024
G1 X142.336 Y131.476 E.03083
G1 X142.431 Y132.638 E.04343
G1 X142.431 Y133.422 E.0292
G1 X142.382 Y134.255 E.03109
G1 X142.238 Y135.071 E.03084
G1 X142 Y135.862 E.03076
G1 X141.544 Y136.861 E.04091
G1 X141.055 Y137.644 E.03436
G1 X140.534 Y138.287 E.03082
G1 X139.942 Y138.865 E.03084
G1 X139.286 Y139.37 E.03084
G1 X138.575 Y139.795 E.03084
G1 X137.818 Y140.135 E.0309
G1 X137.207 Y140.337 E.024
G1 X136.399 Y140.519 E.03083
G1 X135.237 Y140.614 E.04343
G1 X125.453 Y140.614 E.36442
G1 X124.62 Y140.565 E.03109
G1 X123.804 Y140.42 E.03084
G1 X123.013 Y140.182 E.03076
G1 X122.427 Y139.915 E.02399
G1 X122.427 Y139.614 E.0112
G1 X122.36 Y139.452 E.00652
G1 X122.227 Y139.318 E.00705
G1 X122.065 Y139.251 E.00651
G1 X121.63 Y139.251 E.01621
G1 X121.468 Y139.318 E.00651
G1 X121.426 Y139.361 E.00223
G1 X121.232 Y139.238 E.00854
G1 X120.893 Y138.964 E.01623
G1 X121.349 Y138.694 F30000
M73 P61 R3
G1 F3000
G1 X121.339 Y138.677 E.00073
G1 X121.322 Y138.304 E.01392
G1 X121.208 Y137.887 E.01609
G1 X121.141 Y137.749 E.00573
G1 X120.939 Y137.456 E.01324
G1 X120.833 Y137.342 E.00581
G1 X120.614 Y137.168 E.0104
G1 X120.262 Y136.977 E.01495
G1 X120.126 Y136.931 E.00533
G1 X119.727 Y136.858 E.01511
G1 X119.634 Y136.793 E.00422
G1 X119.569 Y136.685 E.0047
G1 X119.557 Y136.571 E.00426
G1 X119.626 Y136.492 E.00393
G1 X119.936 Y136.339 E.01287
G1 X120.058 Y136.339 E.00454
G1 X120.555 Y136.586 E.02069
G1 X120.802 Y136.638 E.00941
G1 X124.896 Y136.645 E.15247
G1 X125.098 Y136.605 E.00766
G1 X125.234 Y136.548 E.00551
G1 X125.405 Y136.434 E.00763
G1 X125.519 Y136.319 E.00605
G1 X125.633 Y136.149 E.00763
G1 X125.69 Y136.012 E.00551
G1 X125.73 Y135.812 E.00763
G1 X125.73 Y134.352 E.05438
G1 X125.777 Y134.248 E.00426
G1 X125.867 Y134.214 E.00355
G1 X135.236 Y134.214 E.34896
G1 X135.443 Y134.182 E.00782
G1 X135.66 Y134.081 E.00892
G1 X135.774 Y133.99 E.00541
G1 X135.902 Y133.838 E.00743
G1 X135.99 Y133.647 E.00782
G1 X136.032 Y133.411 E.00891
G1 X136.023 Y132.573 E.03124
G1 X135.99 Y132.393 E.0068
G1 X135.9 Y132.217 E.00737
G1 X135.808 Y132.101 E.00551
G1 X135.589 Y131.935 E.01023
G1 X135.364 Y131.859 E.00884
G1 X135.238 Y131.843 E.00475
G1 X125.867 Y131.843 E.34903
G1 X125.763 Y131.795 E.00426
G1 X125.73 Y131.706 E.00355
G1 X125.73 Y129.323 E.08877
G1 X125.777 Y129.219 E.00426
G1 X125.867 Y129.186 E.00355
G1 X134.789 Y129.186 E.33234
G1 X134.997 Y129.154 E.00782
G1 X135.214 Y129.052 E.00892
G1 X135.327 Y128.961 E.00541
G1 X135.456 Y128.809 E.00743
G1 X135.543 Y128.618 E.00783
G1 X135.586 Y128.388 E.00872
G1 X135.586 Y127.611 E.02894
G1 X135.554 Y127.403 E.00782
G1 X135.452 Y127.186 E.00892
G1 X135.361 Y127.073 E.00541
G1 X135.209 Y126.944 E.00743
G1 X135.018 Y126.857 E.00783
G1 X134.788 Y126.814 E.00871
G1 X124.893 Y126.827 E.36853
G1 X124.806 Y126.845 E.0033
G1 X124.586 Y126.948 E.00906
G1 X124.473 Y127.039 E.00541
G1 X124.304 Y127.26 E.01037
G1 X124.257 Y127.379 E.00475
G1 X124.214 Y127.612 E.00884
G1 X124.214 Y128.302 E.02569
G1 X124.167 Y128.406 E.00426
G1 X124.077 Y128.439 E.00355
G1 X123.683 Y128.439 E.0147
G1 X123.579 Y128.392 E.00426
G1 X123.545 Y128.302 E.00355
G1 X123.545 Y126.286 E.07511
G1 X123.593 Y126.182 E.00426
G1 X123.652 Y126.152 E.00247
G1 X124.353 Y125.994 E.02676
G1 X125.48 Y125.901 E.0421
G1 X135.23 Y125.901 E.36317
G1 X136.027 Y125.949 E.02974
G1 X136.774 Y126.081 E.02825
G1 X137.509 Y126.301 E.02856
G1 X138.454 Y126.731 E.03866
G1 X139.202 Y127.198 E.03285
G1 X139.801 Y127.685 E.02875
G1 X140.331 Y128.228 E.02825
G1 X140.804 Y128.841 E.02885
G1 X141.21 Y129.519 E.02944
G1 X141.523 Y130.216 E.02845
G1 X141.711 Y130.784 E.0223
G1 X141.884 Y131.555 E.02941
G1 X141.973 Y132.651 E.04097
G1 X141.974 Y133.405 E.02807
G1 X141.926 Y134.21 E.03004
G1 X141.794 Y134.957 E.02825
G1 X141.574 Y135.691 E.02856
G1 X141.144 Y136.636 E.03866
G1 X140.677 Y137.384 E.03285
G1 X140.19 Y137.984 E.02875
G1 X139.647 Y138.513 E.02825
G1 X139.034 Y138.987 E.02885
G1 X138.356 Y139.392 E.02944
G1 X137.659 Y139.705 E.02845
G1 X137.091 Y139.894 E.0223
G1 X136.32 Y140.066 E.02941
G1 X135.224 Y140.156 E.04097
G1 X125.47 Y140.156 E.36328
G1 X124.681 Y140.11 E.02945
G1 X123.903 Y139.973 E.02944
G1 X123.184 Y139.756 E.02796
G1 X122.947 Y139.649 E.00968
G1 X122.869 Y139.551 E.00465
G1 X122.845 Y139.427 E.00474
G1 X122.788 Y139.29 E.00551
G1 X122.674 Y139.12 E.00763
G1 X122.559 Y139.005 E.00605
G1 X122.389 Y138.891 E.00763
G1 X122.252 Y138.834 E.00551
G1 X122.052 Y138.794 E.00763
G1 X121.643 Y138.794 E.0152
G1 X121.519 Y138.819 E.00471
G1 X121.406 Y138.791 E.00434
G1 X121.38 Y138.746 E.00195
G1 X121.778 Y138.243 F30000
G1 F3000
G1 X121.771 Y138.237 E.00033
G1 X121.614 Y137.677 E.02167
G1 X121.513 Y137.483 E.00814
G1 X121.394 Y137.311 E.00779
G1 X121.375 Y137.198 E.00426
G1 X121.447 Y137.11 E.00426
G1 X121.507 Y137.096 E.00229
G1 X124.882 Y137.102 E.12568
G1 X125.282 Y137.022 E.01521
G1 X125.497 Y136.922 E.00883
G1 X125.647 Y136.822 E.00673
G1 X125.905 Y136.564 E.01358
G1 X126.058 Y136.316 E.01084
G1 X126.139 Y136.094 E.00883
G1 X126.187 Y135.801 E.01106
G1 X126.187 Y134.809 E.03694
G1 X126.234 Y134.705 E.00426
G1 X126.324 Y134.671 E.00355
G1 X135.227 Y134.671 E.3316
G1 X135.505 Y134.635 E.01044
G1 X135.646 Y134.592 E.00551
G1 X135.843 Y134.5 E.0081
G1 X136.053 Y134.351 E.00955
G1 X136.247 Y134.138 E.01076
G1 X136.32 Y134.022 E.0051
G1 X136.441 Y133.716 E.01228
G1 X136.489 Y133.396 E.01205
G1 X136.48 Y132.577 E.03048
G1 X136.441 Y132.319 E.00972
G1 X136.311 Y132.017 E.01227
G1 X136.168 Y131.821 E.00902
G1 X136.078 Y131.733 E.0047
G1 X135.875 Y131.578 E.0095
G1 X135.724 Y131.498 E.00637
G1 X135.521 Y131.43 E.00797
G1 X135.227 Y131.386 E.01106
G1 X126.324 Y131.386 E.33162
G1 X126.22 Y131.338 E.00426
G1 X126.187 Y131.249 E.00355
G1 X126.187 Y129.78 E.05472
G1 X126.234 Y129.676 E.00426
G1 X126.324 Y129.643 E.00355
G1 X134.781 Y129.643 E.31498
G1 X135.058 Y129.606 E.01044
G1 X135.2 Y129.563 E.00551
G1 X135.397 Y129.471 E.0081
G1 X135.606 Y129.323 E.00955
G1 X135.797 Y129.113 E.01056
G1 X135.954 Y128.816 E.01252
G1 X136.033 Y128.478 E.01293
G1 X136.043 Y127.619 E.03201
G1 X136.006 Y127.342 E.01041
G1 X135.964 Y127.203 E.0054
G1 X135.803 Y126.894 E.01299
G1 X135.648 Y126.717 E.00875
G1 X135.54 Y126.625 E.00529
G1 X135.491 Y126.522 E.00426
G1 X135.538 Y126.417 E.00426
G1 X135.637 Y126.384 E.00388
G1 X135.966 Y126.403 E.01228
G1 X136.661 Y126.525 E.02628
G1 X137.339 Y126.728 E.02636
G1 X138.229 Y127.131 E.0364
G1 X138.929 Y127.566 E.03069
G1 X139.486 Y128.018 E.02673
G1 X139.99 Y128.534 E.02687
G1 X140.43 Y129.106 E.02686
G1 X140.807 Y129.738 E.02743
G1 X141.093 Y130.375 E.02602
G1 X141.268 Y130.9 E.02059
G1 X141.432 Y131.633 E.02799
G1 X141.516 Y132.675 E.03895
G1 X141.517 Y133.395 E.02681
G1 X141.472 Y134.148 E.02809
G1 X141.346 Y134.859 E.02686
G1 X141.141 Y135.539 E.02646
G1 X140.735 Y136.427 E.03637
G1 X140.299 Y137.125 E.03066
G1 X139.847 Y137.681 E.02669
G1 X139.341 Y138.173 E.02628
G1 X138.77 Y138.612 E.02686
G1 X138.151 Y138.982 E.02684
G1 X137.487 Y139.281 E.02714
G1 X136.962 Y139.454 E.02057
G1 X136.261 Y139.611 E.02677
G1 X135.2 Y139.699 E.03965
G1 X125.488 Y139.699 E.36174
G1 X124.742 Y139.656 E.0278
G1 X124.017 Y139.529 E.02745
G1 X123.354 Y139.33 E.02578
G1 X123.269 Y139.257 E.00418
G1 X123.162 Y139.027 E.00942
M73 P62 R3
G1 X123.062 Y138.877 E.00674
G1 X122.802 Y138.617 E.01368
G1 X122.652 Y138.517 E.00673
G1 X122.435 Y138.416 E.00892
G1 X122.149 Y138.348 E.01095
G1 X121.898 Y138.337 E.00936
G1 X121.825 Y138.28 E.00343
G1 X122.21 Y137.887 F30000
G1 F3000
G1 X122.124 Y137.803 E.00449
G1 X122.103 Y137.729 E.00287
G1 X122.121 Y137.616 E.00426
G1 X122.235 Y137.554 E.00483
G1 X124.869 Y137.559 E.09809
G1 X125.359 Y137.473 E.01854
G1 X125.682 Y137.34 E.01301
G1 X125.979 Y137.136 E.01342
G1 X126.223 Y136.893 E.01281
G1 X126.297 Y136.799 E.00445
G1 X126.491 Y136.463 E.01443
G1 X126.592 Y136.156 E.01206
G1 X126.636 Y135.884 E.01027
G1 X126.644 Y135.264 E.02308
G1 X126.693 Y135.161 E.00426
G1 X126.781 Y135.129 E.00349
G1 X135.217 Y135.129 E.31423
G1 X135.647 Y135.069 E.01614
G1 X135.846 Y135.003 E.00782
G1 X136.113 Y134.868 E.01116
G1 X136.399 Y134.65 E.01339
G1 X136.579 Y134.452 E.00995
G1 X136.701 Y134.274 E.00804
G1 X136.864 Y133.889 E.01557
G1 X136.946 Y133.381 E.01916
G1 X136.937 Y132.581 E.02981
G1 X136.894 Y132.259 E.01211
G1 X136.858 Y132.132 E.00491
G1 X136.672 Y131.737 E.01625
G1 X136.543 Y131.559 E.0082
G1 X136.401 Y131.41 E.00767
G1 X136.159 Y131.22 E.01147
G1 X135.947 Y131.099 E.00909
G1 X135.578 Y130.976 E.01447
G1 X135.218 Y130.929 E.0135
G1 X126.781 Y130.929 E.31426
G1 X126.677 Y130.881 E.00426
G1 X126.644 Y130.792 E.00355
G1 X126.644 Y130.237 E.02067
G1 X126.692 Y130.133 E.00426
G1 X126.781 Y130.1 E.00355
G1 X134.771 Y130.1 E.2976
G1 X135.2 Y130.041 E.01614
G1 X135.582 Y129.889 E.01529
G1 X135.861 Y129.702 E.01252
G1 X136.131 Y129.425 E.0144
G1 X136.354 Y129.038 E.01663
G1 X136.401 Y128.913 E.00498
G1 X136.49 Y128.47 E.01683
G1 X136.5 Y127.632 E.03121
G1 X136.46 Y127.289 E.01287
G1 X136.425 Y127.148 E.00541
G1 X136.447 Y127.036 E.00426
G1 X136.598 Y126.984 E.00595
G1 X137.169 Y127.154 E.02222
G1 X138.005 Y127.531 E.03414
G1 X138.656 Y127.935 E.02853
G1 X139.183 Y128.362 E.02528
G1 X139.649 Y128.84 E.02487
G1 X140.055 Y129.37 E.02485
G1 X140.404 Y129.957 E.02543
G1 X140.664 Y130.535 E.02362
G1 X140.825 Y131.016 E.01887
G1 X140.979 Y131.711 E.02655
G1 X141.059 Y132.7 E.03693
G1 X141.059 Y133.386 E.02556
G1 X141.018 Y134.087 E.02615
G1 X140.902 Y134.744 E.02487
G1 X140.708 Y135.386 E.02495
G1 X140.336 Y136.202 E.03342
G1 X139.921 Y136.865 E.02913
G1 X139.514 Y137.365 E.02403
G1 X139.047 Y137.821 E.0243
G1 X138.518 Y138.229 E.02487
G1 X137.932 Y138.58 E.02544
G1 X137.327 Y138.851 E.02469
G1 X136.847 Y139.011 E.01887
G1 X136.182 Y139.159 E.02536
G1 X135.186 Y139.241 E.03721
G1 X125.505 Y139.242 E.3606
G1 X124.788 Y139.2 E.02676
G1 X124.13 Y139.084 E.02486
G1 X123.682 Y138.951 E.01743
G1 X123.6 Y138.884 E.00395
G1 X123.378 Y138.547 E.015
G1 X123.047 Y138.232 E.01703
G1 X122.837 Y138.099 E.00928
G1 X122.639 Y138.007 E.00813
G1 X122.264 Y137.909 E.01442
; WIPE_START
G1 F24000
G1 X122.124 Y137.803 E-.06688
G1 X122.103 Y137.729 E-.02926
G1 X122.121 Y137.616 E-.04347
G1 X122.235 Y137.554 E-.04933
G1 X123.738 Y137.557 E-.57107
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.211 J-.118 P1  F30000
G1 X123.684 Y138.118 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X123.755 Y138.028 E.00426
G1 X123.817 Y138.014 E.00235
G1 X124.857 Y138.016 E.03875
G1 X125.426 Y137.925 E.02147
G1 X125.845 Y137.766 E.01667
G1 X126.31 Y137.451 E.02092
G1 X126.653 Y137.085 E.01868
G1 X126.88 Y136.703 E.01656
G1 X127.045 Y136.218 E.01908
G1 X127.086 Y135.965 E.00953
G1 X127.095 Y135.718 E.00923
G1 X127.147 Y135.616 E.00426
G1 X127.233 Y135.586 E.00337
G1 X135.208 Y135.586 E.29704
G1 X135.802 Y135.499 E.02236
G1 X136.058 Y135.408 E.01014
G1 X136.398 Y135.225 E.01437
G1 X136.744 Y134.95 E.01647
G1 X136.958 Y134.706 E.01209
G1 X137.126 Y134.442 E.01167
G1 X137.282 Y134.075 E.01484
G1 X137.316 Y133.955 E.00466
G1 X137.403 Y133.366 E.02215
G1 X137.389 Y132.514 E.03176
G1 X137.332 Y132.127 E.01457
G1 X137.268 Y131.93 E.00771
G1 X137.091 Y131.553 E.01552
G1 X136.916 Y131.296 E.01156
G1 X136.676 Y131.045 E.01294
G1 X136.379 Y130.819 E.0139
G1 X136.08 Y130.662 E.01258
G1 X135.777 Y130.561 E.01188
G1 X135.694 Y130.483 E.00426
G1 X135.698 Y130.369 E.00426
G1 X135.747 Y130.315 E.0027
G1 X136.106 Y130.087 E.01583
G1 X136.453 Y129.748 E.01808
G1 X136.744 Y129.277 E.02064
G1 X136.851 Y128.993 E.01131
G1 X136.936 Y128.572 E.01597
G1 X136.955 Y127.768 E.02997
G1 X137.005 Y127.665 E.00426
G1 X137.149 Y127.646 E.00539
G1 X137.781 Y127.932 E.02585
G1 X138.383 Y128.304 E.02636
G1 X138.881 Y128.706 E.02382
G1 X139.297 Y129.134 E.02225
G1 X139.671 Y129.62 E.02285
G1 X139.994 Y130.161 E.02346
G1 X140.235 Y130.695 E.02183
G1 X140.385 Y131.145 E.01765
G1 X140.527 Y131.789 E.02458
G1 X140.602 Y132.713 E.0345
G1 X140.602 Y133.376 E.02473
G1 X140.562 Y134.041 E.02481
G1 X140.454 Y134.646 E.02288
G1 X140.276 Y135.232 E.02282
G1 X139.936 Y135.977 E.03048
G1 X139.543 Y136.605 E.0276
G1 X139.17 Y137.062 E.02196
G1 X138.752 Y137.47 E.02175
G1 X138.267 Y137.846 E.02287
G1 X137.713 Y138.177 E.02404
G1 X137.168 Y138.422 E.02227
G1 X136.731 Y138.568 E.01715
G1 X136.104 Y138.707 E.02394
G1 X135.173 Y138.784 E.03477
G1 X125.522 Y138.785 E.35946
G1 X124.833 Y138.744 E.02572
G1 X124.228 Y138.637 E.0229
G1 X123.973 Y138.561 E.0099
G1 X123.9 Y138.508 E.00336
G1 X123.704 Y138.23 E.01266
G1 X123.695 Y138.177 E.00203
; WIPE_START
G1 F24000
G1 X123.755 Y138.028 E-.06084
G1 X123.817 Y138.014 E-.02394
G1 X124.857 Y138.016 E-.39533
G1 X125.426 Y137.925 E-.21906
G1 X125.576 Y137.868 E-.06082
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.573 J1.074 P1  F30000
G1 X126.142 Y138.17 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X126.198 Y138.079 E.00397
G1 X126.652 Y137.754 E.02079
G1 X127.051 Y137.308 E.0223
G1 X127.317 Y136.838 E.02012
G1 X127.475 Y136.374 E.01826
G1 X127.519 Y136.153 E.00838
G1 X127.586 Y136.06 E.00426
G1 X127.653 Y136.043 E.00259
G1 X135.283 Y136.037 E.28418
G1 X135.856 Y135.953 E.02156
G1 X136.205 Y135.84 E.01367
G1 X136.605 Y135.633 E.01679
G1 X137.021 Y135.313 E.01955
G1 X137.296 Y135.014 E.01512
G1 X137.507 Y134.695 E.01425
G1 X137.723 Y134.195 E.0203
G1 X137.77 Y134.014 E.00696
G1 X137.853 Y133.443 E.02148
G1 X137.846 Y132.515 E.03455
G1 X137.763 Y131.977 E.02029
G1 X137.679 Y131.729 E.00974
G1 X137.464 Y131.289 E.01827
G1 X137.24 Y130.973 E.01443
G1 X137.014 Y130.737 E.01218
G1 X136.626 Y130.437 E.01825
G1 X136.573 Y130.335 E.00426
G1 X136.61 Y130.235 E.00398
G1 X136.849 Y129.978 E.01308
G1 X137.175 Y129.428 E.02382
G1 X137.301 Y129.074 E.01399
G1 X137.382 Y128.672 E.01527
G1 X137.396 Y128.468 E.00761
G1 X137.45 Y128.367 E.00426
G1 X137.605 Y128.36 E.00575
G1 X138.111 Y128.673 E.02216
G1 X138.566 Y129.039 E.02174
G1 X138.946 Y129.428 E.02026
G1 X139.297 Y129.885 E.02145
G1 X139.591 Y130.38 E.02147
G1 X139.806 Y130.856 E.01944
G1 X139.946 Y131.274 E.01642
G1 X140.075 Y131.867 E.02259
G1 X140.145 Y132.737 E.03251
G1 X140.145 Y133.367 E.02347
G1 X140.106 Y133.995 E.02344
G1 X140.007 Y134.547 E.02089
G1 X139.844 Y135.078 E.0207
G1 X139.536 Y135.752 E.02756
G1 X139.176 Y136.331 E.02542
G1 X138.837 Y136.747 E.01996
G1 X138.446 Y137.129 E.02039
G1 X138.002 Y137.472 E.02088
G1 X137.494 Y137.774 E.02201
G1 X137.008 Y137.993 E.01985
G1 X136.616 Y138.124 E.01541
G1 X136.026 Y138.255 E.02251
G1 X135.149 Y138.327 E.03277
G1 X126.278 Y138.328 E.33041
G1 X126.174 Y138.28 E.00426
M73 P63 R3
G1 X126.159 Y138.228 E.00203
; WIPE_START
G1 F24000
G1 X126.198 Y138.079 E-.05841
G1 X126.652 Y137.754 E-.21213
G1 X127.051 Y137.308 E-.22747
G1 X127.317 Y136.838 E-.20529
G1 X127.365 Y136.697 E-.0567
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.217 J-.001 P1  F30000
G1 X127.364 Y137.823 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X127.332 Y137.713 E.00426
G1 X127.359 Y137.651 E.00251
G1 X127.454 Y137.525 E.00587
G1 X127.709 Y137.073 E.01936
G1 X127.884 Y136.59 E.01913
G1 X128.013 Y136.5 E.00586
G1 X135.358 Y136.487 E.27359
G1 X135.911 Y136.407 E.02081
G1 X136.337 Y136.278 E.01657
G1 X136.806 Y136.043 E.01954
G1 X137.292 Y135.681 E.02256
G1 X137.625 Y135.331 E.01802
G1 X137.931 Y134.866 E.02072
G1 X138.167 Y134.301 E.02281
G1 X138.223 Y134.074 E.00871
G1 X138.304 Y133.519 E.02087
G1 X138.304 Y132.522 E.03715
G1 X138.192 Y131.819 E.02651
G1 X138.087 Y131.523 E.0117
G1 X137.831 Y131.017 E.02114
G1 X137.564 Y130.651 E.01684
G1 X137.274 Y130.358 E.01537
G1 X137.234 Y130.251 E.00426
G1 X137.253 Y130.192 E.00231
G1 X137.562 Y129.672 E.02253
G1 X137.741 Y129.193 E.01902
G1 X137.822 Y129.113 E.00426
G1 X137.956 Y129.135 E.00503
G1 X138.263 Y129.384 E.01474
G1 X138.605 Y129.735 E.01824
G1 X138.922 Y130.149 E.01943
G1 X139.189 Y130.599 E.01947
G1 X139.377 Y131.016 E.01706
G1 X139.506 Y131.402 E.01517
G1 X139.622 Y131.943 E.0206
G1 X139.688 Y132.76 E.03054
G1 X139.687 Y133.357 E.02222
G1 X139.65 Y133.948 E.02207
G1 X139.559 Y134.447 E.0189
G1 X139.412 Y134.924 E.01858
G1 X139.136 Y135.527 E.02469
G1 X138.807 Y136.058 E.02326
G1 X138.494 Y136.443 E.01852
G1 X138.139 Y136.788 E.01843
G1 X137.737 Y137.097 E.01888
G1 X137.275 Y137.371 E.02
G1 X136.847 Y137.564 E.01748
G1 X136.5 Y137.681 E.01365
G1 X135.948 Y137.803 E.02106
G1 X135.124 Y137.87 E.03078
G1 X127.468 Y137.871 E.28517
G1 X127.418 Y137.848 E.00203
G1 X128.163 Y137.366 F30000
G1 F3000
G1 X128.138 Y137.23 E.00516
G1 X128.205 Y137.046 E.00726
G1 X128.333 Y136.956 E.00585
G1 X135.434 Y136.938 E.26446
G1 X135.968 Y136.861 E.02009
G1 X136.459 Y136.718 E.01908
G1 X137.088 Y136.403 E.0262
G1 X137.63 Y135.989 E.02537
G1 X138.013 Y135.573 E.02108
G1 X138.357 Y135.031 E.0239
G1 X138.585 Y134.486 E.02201
G1 X138.676 Y134.133 E.01357
G1 X138.761 Y133.51 E.02345
G1 X138.761 Y132.532 E.03642
G1 X138.645 Y131.758 E.02915
G1 X138.519 Y131.376 E.01499
G1 X138.243 Y130.819 E.02312
G1 X137.937 Y130.387 E.01973
G1 X137.843 Y130.283 E.00522
G1 X137.827 Y130.121 E.00607
G1 X137.931 Y129.946 E.0076
G1 X138.025 Y129.881 E.00426
G1 X138.147 Y129.92 E.00478
G1 X138.263 Y130.041 E.00623
G1 X138.538 Y130.399 E.01681
G1 X138.778 Y130.803 E.01753
G1 X138.948 Y131.177 E.01527
G1 X139.066 Y131.531 E.01391
G1 X139.17 Y132.019 E.01859
G1 X139.23 Y132.773 E.02817
G1 X139.23 Y133.338 E.02104
G1 X139.196 Y133.885 E.02041
G1 X139.116 Y134.33 E.01687
G1 X138.986 Y134.753 E.01644
G1 X138.728 Y135.318 E.02316
G1 X138.439 Y135.785 E.02044
G1 X138.161 Y136.128 E.01646
G1 X137.845 Y136.437 E.01644
G1 X137.487 Y136.713 E.01687
G1 X137.057 Y136.968 E.01861
G1 X136.686 Y137.135 E.01514
G1 X136.385 Y137.237 E.01187
G1 X135.871 Y137.35 E.0196
G1 X135.111 Y137.412 E.02837
G1 X128.267 Y137.414 E.25491
G1 X128.218 Y137.391 E.00203
; WIPE_START
G1 F24000
G1 X128.138 Y137.23 E-.06831
G1 X128.205 Y137.046 E-.07409
G1 X128.333 Y136.956 E-.0597
G1 X129.802 Y136.952 E-.55791
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.195 J-.23 P1  F30000
G1 X128.218 Y128.729 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X125 Y128.729 E.11985
G1 X124.889 Y128.7 E.00426
G1 X124.805 Y128.653 E.00361
G1 X124.696 Y128.516 E.00652
G1 X124.671 Y128.4 E.00442
G1 X124.671 Y127.6 E.0298
G1 X124.7 Y127.489 E.00426
G1 X124.747 Y127.405 E.00361
G1 X124.884 Y127.296 E.00652
G1 X125 Y127.271 E.00442
G1 X134.8 Y127.271 E.36501
G1 X134.911 Y127.3 E.00426
G1 X134.995 Y127.347 E.00361
G1 X135.104 Y127.484 E.00652
G1 X135.129 Y127.6 E.00442
G1 X135.129 Y128.4 E.0298
G1 X135.1 Y128.511 E.00426
G1 X135.053 Y128.595 E.00361
G1 X134.916 Y128.704 E.00652
G1 X134.8 Y128.729 E.00442
G1 X128.278 Y128.729 E.24293
; WIPE_START
G1 F24000
G1 X126.278 Y128.729 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.977 J-.725 P1  F30000
G1 X122.931 Y133.238 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X122.931 Y133.566 E.01224
G1 X122.75 Y133.238 E.01399
G1 X122.871 Y133.238 E.00453
; WIPE_START
G1 F24000
G1 X122.931 Y133.566 E-.30542
G1 X122.75 Y133.238 E-.34332
G1 X122.871 Y133.238 E-.11127
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.015 J1.217 P1  F30000
G1 X125.671 Y133.204 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.449721
G1 F3000
G1 X125.671 Y132.854 E.01161
G1 X135.021 Y132.854 E.30995
G1 X135.021 Y133.204 E.01161
G1 X125.731 Y133.204 E.30796
; WIPE_START
G1 F24000
G1 X125.671 Y132.854 E-.13505
G1 X127.316 Y132.854 E-.62495
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.169 J-.338 P1  F30000
G1 X125.053 Y125.02 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
G1 F3000
G1 X124.209 Y125.09 E.03154
G1 X123.375 Y125.277 E.03184
G1 X123.088 Y125.371 E.01122
G1 X123.088 Y122.978 E.0891
G1 X123.247 Y122.93 E.00617
G1 X123.334 Y122.75 E.00745
G1 X123.334 Y122.189 E.02089
G1 X123.267 Y122.027 E.00652
G1 X123.133 Y121.893 E.00705
G1 X122.972 Y121.827 E.00651
G1 X122.537 Y121.827 E.01621
G1 X122.375 Y121.893 E.00651
G1 X122.241 Y122.027 E.00705
G1 X122.193 Y122.144 E.00471
G1 X122.144 Y122.027 E.00471
G1 X122.01 Y121.893 E.00705
G1 X121.849 Y121.827 E.00651
G1 X121.076 Y121.827 E.02879
G1 X120.927 Y121.882 E.00593
G1 X120.798 Y121.993 E.00632
G1 X120.721 Y122.132 E.00593
G1 X120.457 Y123.91 E.06692
G1 X120.457 Y123.505 E.01507
G1 X120.408 Y123.364 E.00555
G1 X120.229 Y123.277 E.00745
G1 X119.771 Y123.277 E.01702
G1 X119.631 Y123.325 E.00555
G1 X119.543 Y123.505 E.00745
M73 P64 R3
G1 X119.543 Y123.909 E.01504
G1 X119.423 Y123.099 E.0305
G1 X119.709 Y122.745 E.01694
G1 X119.827 Y122.783 E.00459
G1 X120.173 Y122.783 E.01291
G1 X120.307 Y122.74 E.00523
G1 X120.402 Y122.672 E.00436
G1 X120.486 Y122.556 E.00533
G1 X120.711 Y121.851 E.02757
G1 X120.961 Y121.659 E.01172
G1 X121.671 Y121.234 E.03084
G1 X122.428 Y120.894 E.0309
G1 X123.04 Y120.692 E.024
G1 X123.847 Y120.51 E.03083
G1 X125.009 Y120.415 E.04343
G1 X134.793 Y120.415 E.36442
G1 X135.627 Y120.464 E.03109
G1 X136.442 Y120.609 E.03084
G1 X137.232 Y120.846 E.03074
G1 X138.316 Y121.349 E.04448
G1 X139.014 Y121.791 E.03079
G1 X139.658 Y122.312 E.03084
G1 X140.236 Y122.904 E.03084
G1 X140.741 Y123.561 E.03084
G1 X141.166 Y124.271 E.03084
G1 X141.506 Y125.028 E.0309
G1 X141.708 Y125.64 E.024
G1 X141.89 Y126.447 E.03083
G1 X141.985 Y127.609 E.04343
G1 X141.985 Y128.393 E.0292
G1 X141.951 Y128.975 E.0217
G1 X141.558 Y128.321 E.02841
G1 X141.019 Y127.624 E.03283
G1 X140.402 Y126.994 E.03283
G1 X139.738 Y126.456 E.03184
G1 X138.882 Y125.922 E.03758
G1 X137.855 Y125.453 E.04204
G1 X136.981 Y125.19 E.03398
G1 X136.113 Y125.037 E.03283
G1 X135.246 Y124.987 E.03234
G1 X125.446 Y124.987 E.36501
G1 X125.112 Y125.015 E.01248
G1 X125.075 Y124.561 F30000
G1 F3000
G1 X124.18 Y124.633 E.03348
G1 X123.711 Y124.733 E.01784
G1 X123.599 Y124.708 E.00426
G1 X123.545 Y124.599 E.00453
G1 X123.545 Y123.317 E.04774
G1 X123.574 Y123.233 E.0033
G1 X123.664 Y123.117 E.00547
G1 X123.738 Y122.964 E.00635
G1 X123.791 Y122.734 E.00878
G1 X123.791 Y122.202 E.01981
G1 X123.751 Y122.002 E.00763
G1 X123.695 Y121.865 E.00551
G1 X123.581 Y121.695 E.00763
G1 X123.466 Y121.58 E.00605
G1 X123.297 Y121.467 E.00757
G1 X123.126 Y121.401 E.00682
G1 X123.047 Y121.319 E.00426
G1 X123.057 Y121.205 E.00426
G1 X123.133 Y121.143 E.00366
G1 X123.926 Y120.962 E.03029
G1 X125.034 Y120.872 E.04139
G1 X134.784 Y120.873 E.36317
G1 X135.581 Y120.92 E.02974
G1 X136.344 Y121.056 E.02885
G1 X137.078 Y121.279 E.02859
G1 X138.104 Y121.756 E.04213
G1 X138.754 Y122.168 E.02865
G1 X139.355 Y122.656 E.02885
G1 X139.895 Y123.211 E.02885
G1 X140.358 Y123.812 E.02825
G1 X140.764 Y124.49 E.02944
G1 X141.077 Y125.187 E.02845
G1 X141.268 Y125.768 E.0228
G1 X141.438 Y126.526 E.02892
G1 X141.484 Y127.099 E.02142
G1 X141.445 Y127.207 E.00426
G1 X141.338 Y127.247 E.00426
G1 X141.25 Y127.207 E.00361
G1 X140.684 Y126.634 E.03
G1 X140.032 Y126.106 E.03124
G1 X139.064 Y125.502 E.0425
G1 X137.978 Y125.013 E.04435
G1 X137.121 Y124.754 E.03336
G1 X136.199 Y124.588 E.03487
G1 X135.242 Y124.53 E.03572
G1 X125.452 Y124.53 E.36465
G1 X125.135 Y124.556 E.01183
G1 X125.099 Y124.101 F30000
G1 F3000
G1 X124.151 Y124.177 E.03544
G1 X124.043 Y124.138 E.00426
G1 X124.002 Y124.04 E.00393
G1 X124.002 Y123.471 E.0212
G1 X124.185 Y123.062 E.0167
G1 X124.248 Y122.723 E.01285
G1 X124.237 Y122.104 E.02306
G1 X124.17 Y121.819 E.01088
G1 X124.066 Y121.595 E.00922
G1 X124.065 Y121.481 E.00426
G1 X124.179 Y121.4 E.00518
G1 X125.058 Y121.329 E.03284
G1 X134.766 Y121.33 E.36161
G1 X135.535 Y121.376 E.02869
G1 X136.229 Y121.5 E.02625
G1 X136.905 Y121.704 E.02632
G1 X137.876 Y122.154 E.03985
G1 X138.493 Y122.544 E.02717
G1 X139.052 Y123 E.02685
G1 X139.543 Y123.505 E.02627
G1 X139.983 Y124.076 E.02686
G1 X140.353 Y124.695 E.02685
G1 X140.647 Y125.346 E.0266
G1 X140.803 Y125.817 E.01849
G1 X140.79 Y125.931 E.00426
G1 X140.696 Y125.996 E.00426
G1 X140.588 Y125.968 E.00416
G1 X140.267 Y125.714 E.01523
G1 X139.313 Y125.119 E.04189
G1 X138.174 Y124.6 E.04663
G1 X137.194 Y124.303 E.03813
G1 X136.22 Y124.132 E.03686
G1 X135.238 Y124.073 E.03662
G1 X125.457 Y124.073 E.36429
G1 X125.159 Y124.097 E.01116
G1 X125.123 Y123.642 F30000
G1 F3000
G1 X124.631 Y123.68 E.01839
G1 X124.524 Y123.641 E.00426
G1 X124.493 Y123.493 E.00562
G1 X124.636 Y123.133 E.01442
G1 X124.695 Y122.82 E.01188
G1 X124.694 Y122.103 E.02669
G1 X124.675 Y121.965 E.0052
G1 X124.707 Y121.855 E.00426
G1 X124.799 Y121.809 E.00384
G1 X125.082 Y121.787 E.01055
G1 X134.748 Y121.787 E.36005
G1 X135.473 Y121.83 E.02704
G1 X136.13 Y121.948 E.02486
G1 X136.751 Y122.136 E.02419
G1 X137.664 Y122.561 E.0375
G1 X138.231 Y122.921 E.02502
G1 X138.748 Y123.343 E.02485
G1 X139.202 Y123.811 E.0243
G1 X139.6 Y124.328 E.02428
G1 X139.724 Y124.533 E.00895
G1 X139.737 Y124.647 E.00426
G1 X139.658 Y124.731 E.00426
G1 X139.55 Y124.729 E.00405
G1 X138.298 Y124.16 E.05121
G1 X137.266 Y123.852 E.04012
G1 X136.239 Y123.675 E.03879
G1 X135.234 Y123.616 E.03751
G1 X125.463 Y123.616 E.36395
G1 X125.183 Y123.637 E.01044
G1 X125.268 Y123.172 F30000
G1 F3000
G1 X125.161 Y123.132 E.00426
G1 X125.123 Y123.017 E.00452
G1 X125.152 Y122.81 E.00779
G1 X125.152 Y122.381 E.01597
G1 X125.199 Y122.277 E.00426
G1 X125.289 Y122.244 E.00356
G1 X134.73 Y122.244 E.35167
G1 X135.427 Y122.286 E.02599
G1 X136.031 Y122.395 E.02286
G1 X136.597 Y122.569 E.02204
G1 X137.436 Y122.959 E.0345
G1 X137.98 Y123.307 E.02406
G1 X138.042 Y123.404 E.00426
G1 X138.009 Y123.513 E.00426
G1 X137.868 Y123.554 E.00547
G1 X137.336 Y123.4 E.02064
G1 X136.324 Y123.226 E.03823
G1 X135.265 Y123.16 E.03954
M73 P65 R3
G1 X125.467 Y123.159 E.36491
G1 X125.328 Y123.168 E.00519
; WIPE_START
G1 F24000
G1 X125.161 Y123.132 E-.06489
G1 X125.123 Y123.017 E-.04613
G1 X125.152 Y122.81 E-.07946
G1 X125.152 Y122.381 E-.16289
G1 X125.199 Y122.277 E-.04347
G1 X125.289 Y122.244 E-.03629
G1 X126.149 Y122.244 E-.32686
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.202 J-.187 P1  F30000
G1 X125.225 Y128.175 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.449721
G1 F3000
G1 X125.225 Y127.825 E.01161
G1 X134.575 Y127.825 E.30995
G1 X134.575 Y128.175 E.01161
G1 X125.285 Y128.175 E.30796
; WIPE_START
G1 F24000
G1 X125.225 Y127.825 E-.13505
G1 X126.869 Y127.825 E-.62495
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.956 J-.752 P1  F30000
G1 X122.877 Y122.75 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.5
G1 F3000
G1 X122.877 Y122.284 E.01737
G1 X122.631 Y122.284 E.00916
G1 X122.631 Y130.915 E.32148
G1 X121.754 Y130.915 E.03267
G1 X121.754 Y122.284 E.32148
G1 X121.161 Y122.284 E.02211
G1 X120.877 Y124.185 E.07159
G1 X120.877 Y130.915 E.25068
G1 X120 Y130.915 E.03267
G1 X120 Y123.505 E.27599
; WIPE_START
G1 F24000
G1 X120 Y125.505 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.145 J-.412 P1  F30000
G1 X118.839 Y122.284 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X119.123 Y124.185 E.07159
G1 X119.123 Y130.915 E.25068
G1 X118.246 Y130.915 E.03267
G1 X118.246 Y122.284 E.32148
G1 X117.369 Y122.284 E.03267
G1 X117.369 Y130.915 E.32148
G1 X117.123 Y130.915 E.00916
G1 X117.123 Y130.449 E.01737
; WIPE_START
G1 F24000
G1 X117.123 Y130.915 E-.17717
G1 X117.369 Y130.915 E-.09343
G1 X117.369 Y129.627 E-.4894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.131 J-.449 P1  F30000
G1 X116.684 Y131.354 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Support
G1 F3000
G1 X123.316 Y131.354 E.247
G1 X123.316 Y129.354 E.07449
G1 X124.816 Y129.354 E.05586
G1 X124.816 Y135.73 E.23751
G1 X120.871 Y135.73 E.14694
G1 X120.459 Y135.517 E.01728
G2 X120.699 Y135.38 I.027 J-.231 E.01101
G1 X121.087 Y134.124 E.04897
G1 X120.942 Y133.863 E.0111
G2 X119.058 Y133.863 I-.942 J2.761 E.07149
G1 X118.913 Y134.124 E.0111
G1 X119.301 Y135.38 E.04897
G2 X119.541 Y135.517 I.213 J-.094 E.01101
G1 X119.129 Y135.73 E.01728
G1 X115.184 Y135.73 E.14694
G1 X115.184 Y129.354 E.23751
G1 X116.684 Y129.354 E.05586
G1 X116.684 Y131.285 E.07194
G1 X116.273 Y129.765 F30000
G1 F3000
G1 X116.273 Y131.765 E.07449
G1 X123.727 Y131.765 E.27764
G1 X123.727 Y129.765 E.07449
G1 X124.404 Y129.765 E.02522
G1 X124.404 Y135.319 E.20687
G1 X121.148 Y135.319 E.12128
G1 X121.531 Y134.078 E.04838
G1 X121.218 Y133.511 E.02414
G2 X118.782 Y133.511 I-1.218 J3.333 E.0926
G1 X118.469 Y134.078 E.02414
G1 X118.852 Y135.319 E.04838
G1 X115.596 Y135.319 E.12128
G1 X115.596 Y129.765 E.20687
G1 X116.273 Y129.765 E.02522
G1 X116.104 Y132.273 F30000
G1 F3000
G1 X123.896 Y132.273 E.29024
G1 X123.896 Y134.811 E.09455
M73 P66 R3
G1 X121.836 Y134.811 E.07672
G1 X122.08 Y134.022 E.03078
G1 X121.558 Y133.076 E.04024
G2 X118.442 Y133.076 I-1.558 J4.061 E.11867
G1 X117.92 Y134.022 E.04024
G1 X118.164 Y134.811 E.03078
G1 X116.104 Y134.811 E.07672
G1 X116.104 Y132.273 E.09455
G1 X121.975 Y132.781 F30000
G1 F3000
G1 X123.388 Y132.781 E.05266
G1 X123.388 Y134.303 E.05671
G1 X122.525 Y134.303 E.03216
G1 X122.629 Y133.965 E.01319
G1 X121.975 Y132.781 E.0504
G1 X118.025 Y132.781 F30000
G1 F3000
G1 X117.371 Y133.965 E.0504
G1 X117.475 Y134.303 E.01319
G1 X116.612 Y134.303 E.03216
G1 X116.612 Y132.781 E.05671
G1 X118.025 Y132.781 E.05266
; WIPE_START
G1 F24000
G1 X116.612 Y132.781 E-.53724
G1 X116.612 Y133.367 E-.22276
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.181 J.295 P1  F30000
G1 X119.332 Y122.485 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
G1 F3000
G1 X119.291 Y122.216 E.01014
G1 X119.223 Y122.084 E.00555
G1 X119.032 Y122.024 E.00745
G1 X118.87 Y122.048 E.00607
G1 X118.704 Y121.486 E.02184
G1 X118.668 Y121.26 E.00851
G1 X118.672 Y121.012 E.00925
G1 X118.731 Y120.823 E.00736
G1 X118.849 Y120.617 E.00886
G1 X119.025 Y120.464 E.00867
G1 X119.134 Y120.411 E.00454
G1 X119.466 Y120.34 E.01262
G1 X120.539 Y120.34 E.03998
G1 X120.785 Y120.382 E.00929
G1 X120.963 Y120.468 E.00736
G1 X121.149 Y120.616 E.00886
G1 X121.275 Y120.812 E.00867
G1 X121.308 Y120.918 E.00416
G1 X120.883 Y121.173 E.01846
G1 X120.867 Y121.026 E.00549
G1 X120.753 Y120.873 E.0071
G1 X120.669 Y120.826 E.00361
G1 X120.558 Y120.798 E.00426
G1 X119.442 Y120.798 E.04157
G1 X119.297 Y120.836 E.00556
G1 X119.163 Y120.97 E.0071
G1 X119.129 Y121.061 E.00361
G1 X119.117 Y121.176 E.0043
G1 X119.15 Y121.385 E.0079
G1 X119.451 Y122.358 E.03793
G1 X119.373 Y122.442 E.00427
; WIPE_START
G1 F24000
G1 X119.291 Y122.216 E-.09108
G1 X119.223 Y122.084 E-.05666
G1 X119.032 Y122.024 E-.07604
G1 X118.87 Y122.048 E-.06197
G1 X118.704 Y121.486 E-.22278
G1 X118.668 Y121.26 E-.08681
G1 X118.672 Y121.012 E-.09441
G1 X118.727 Y120.835 E-.07026
; WIPE_END
G1 E-.04 F1800
G17
M73 P67 R3
G3 Z.6 I-1.214 J.091 P1  F30000
G1 X119.786 Y134.917 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
G1 X119.607 Y134.337 E.02259
G1 X119.722 Y134.307 E.00441
G1 X120.278 Y134.307 E.02073
G1 X120.393 Y134.337 E.00441
G1 X120.214 Y134.917 E.02259
G1 X119.846 Y134.917 E.01368
; WIPE_START
G1 F24000
G1 X119.607 Y134.337 E-.23819
G1 X119.722 Y134.307 E-.045
G1 X120.278 Y134.307 E-.21149
G1 X120.393 Y134.337 E-.045
G1 X120.222 Y134.891 E-.22032
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.217 J-.021 P1  F30000
G1 X120 Y122.184 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G3 X119.749 Y121.376 I13.821 J-4.742 E.03152
G1 X120.251 Y121.376 E.01872
G1 X120.083 Y121.934 E.02172
G1 X120.019 Y122.127 E.00756
M106 S252.45
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.749 Y121.376 E-.3033
G1 X120.251 Y121.376 E-.19099
G1 X120.083 Y121.934 E-.22159
G1 X120.046 Y122.045 E-.04411
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/25
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
G3 Z.6 I-1.212 J.111 P1  F30000
G1 X121.97 Y143.052 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F1502
G1 X121.97 Y142.586 E.01433
G1 X121.724 Y142.586 E.00755
G1 X121.724 Y151.217 E.26522
G1 X121.04 Y151.217 E.02103
G2 X120.847 Y151.074 I-.365 J.291 E.00744
G1 X120.847 Y142.586 E.26083
G1 X120.367 Y142.586 E.01476
G1 X120.052 Y144.697 E.06559
G1 X119.97 Y144.691 E.00252
G1 X119.97 Y150.585 E.18111
G2 X119.093 Y150.394 I-.78 J1.47 E.02793
G1 X119.093 Y144.626 E.17723
G1 X118.216 Y144.691 E.02702
G1 X118.216 Y150.585 E.18111
G2 X117.339 Y151.074 I1.563 J3.832 E.03094
G1 X117.339 Y142.586 E.26083
G1 X116.462 Y142.586 E.02695
G1 X116.462 Y151.217 E.26522
G1 X116.216 Y151.217 E.00755
G1 X116.216 Y150.751 E.01433
; WIPE_START
G1 F24000
G1 X116.216 Y151.217 E-.17717
G1 X116.462 Y151.217 E-.09343
G1 X116.462 Y149.929 E-.4894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.859 J.862 P1  F30000
G1 X118.198 Y151.659 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
M106 S255
G3 X118.79 Y151.464 I1.315 J3.001 E.01919
G1 X119.396 Y151.464 E.01862
G3 X119.989 Y151.659 I-.723 J3.196 E.01919
M106 S252.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X120.049 Y151.69 E.00225
G1 X119.951 Y152.367 E.02267
G1 X119.77 Y152.367 E.00599
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1502
G1 X119.384 Y152.367 E.01187
G1 X118.416 Y152.367 E.02974
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X118.236 Y152.367 E.00599
G1 X118.138 Y151.69 E.02267
G1 X118.144 Y151.687 E.00026
M106 S252.45
M204 S10000
G1 X118.379 Y151.987 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.507603
G1 F1502
G3 X118.749 Y151.929 I.991 J5.054 E.01421
; LINE_WIDTH: 0.553064
G1 X118.849 Y151.915 E.00419
; LINE_WIDTH: 0.548563
G1 X119.437 Y151.929 E.02422
; LINE_WIDTH: 0.500546
G1 X119.537 Y151.942 E.00376
; LINE_WIDTH: 0.482354
G1 X119.808 Y151.987 E.00983
; WIPE_START
G1 F24000
G1 X119.537 Y151.942 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.215 J-.065 P1  F30000
G1 X118.849 Y139.138 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1502
G1 X118.873 Y139.138 E.00079
G1 X119.337 Y139.138 E.01541
G1 X119.218 Y139.94 E.02689
G1 X118.969 Y139.94 E.00827
G1 X118.858 Y139.197 E.0249
G1 X118.741 Y138.746 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1502
G1 X119.769 Y138.746 E.03159
G1 X119.744 Y139.036 E.00894
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X119.556 Y140.332 E.04344
G1 X118.631 Y140.332 E.03069
M73 P68 R3
G1 X118.443 Y139.036 E.04344
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1502
G1 X118.418 Y138.746 E.00894
G1 X118.681 Y138.746 E.00808
M204 S10000
; WIPE_START
G1 F24000
G1 X119.769 Y138.746 E-.41347
G1 X119.744 Y139.036 E-.11058
G1 X119.655 Y139.65 E-.23596
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.89 J.83 P1  F30000
G1 X125.656 Y133.219 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F1502
G1 X125.656 Y132.839 E.01168
G1 X134.636 Y132.839 E.27593
G1 X134.636 Y133.219 E.01168
G1 X125.716 Y133.219 E.27409
M204 S10000
; WIPE_START
G1 F24000
G1 X125.656 Y132.839 E-.14619
G1 X127.272 Y132.839 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.112 J-.493 P1  F30000
G1 X125.21 Y128.19 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
G1 F1502
G1 X125.21 Y127.81 E.01168
G1 X134.19 Y127.81 E.27593
G1 X134.19 Y128.19 E.01168
G1 X125.27 Y128.19 E.27409
M204 S10000
; WIPE_START
G1 F24000
G1 X125.21 Y127.81 E-.14619
G1 X126.825 Y127.81 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.589 J-1.065 P1  F30000
G1 X122.877 Y125.627 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Support interface
G1 F1502
G1 X122.877 Y125.161 E.01433
G1 X122.631 Y125.161 E.00755
G1 X122.631 Y133.792 E.26522
G1 X121.947 Y133.792 E.02103
G2 X121.754 Y133.649 I-.365 J.291 E.00744
G1 X121.754 Y125.161 E.26083
G1 X121.274 Y125.161 E.01476
G1 X120.959 Y127.272 E.06559
G1 X120.877 Y127.266 E.00252
G1 X120.877 Y133.16 E.18111
G2 X120 Y132.969 I-.78 J1.47 E.02793
G1 X120 Y127.201 E.17723
G1 X119.123 Y127.266 E.02702
G1 X119.123 Y133.16 E.18111
G2 X118.246 Y133.649 I1.563 J3.832 E.03094
G1 X118.246 Y125.161 E.26083
G1 X117.369 Y125.161 E.02695
G1 X117.369 Y133.792 E.26522
G1 X117.123 Y133.792 E.00755
G1 X117.123 Y133.326 E.01433
; WIPE_START
G1 F24000
G1 X117.123 Y133.792 E-.17717
G1 X117.369 Y133.792 E-.09343
G1 X117.369 Y132.504 E-.4894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.859 J.862 P1  F30000
G1 X119.104 Y134.234 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
M106 S255
G3 X119.697 Y134.039 I1.315 J3.001 E.01919
G1 X120.303 Y134.039 E.01862
G3 X120.896 Y134.234 I-.723 J3.196 E.01919
M106 S252.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X120.956 Y134.265 E.00225
G1 X120.858 Y134.942 E.02267
G1 X120.677 Y134.942 E.00599
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1502
G1 X120.291 Y134.942 E.01187
G1 X119.323 Y134.942 E.02974
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X119.142 Y134.942 E.00599
G1 X119.044 Y134.265 E.02267
G1 X119.051 Y134.262 E.00026
M106 S252.45
M204 S10000
G1 X119.285 Y134.562 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.507603
G1 F1502
G3 X119.656 Y134.504 I.991 J5.054 E.01421
; LINE_WIDTH: 0.553064
G1 X119.756 Y134.49 E.00419
; LINE_WIDTH: 0.548563
G1 X120.344 Y134.504 E.02422
; LINE_WIDTH: 0.500546
G1 X120.444 Y134.517 E.00376
; LINE_WIDTH: 0.482354
G1 X120.715 Y134.562 E.00983
; WIPE_START
G1 F24000
G1 X120.444 Y134.517 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.215 J-.065 P1  F30000
G1 X119.756 Y121.713 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1502
G1 X119.78 Y121.713 E.00079
G1 X120.244 Y121.713 E.01541
G1 X120.125 Y122.515 E.02689
G1 X119.875 Y122.515 E.00827
G1 X119.765 Y121.772 E.0249
G1 X119.647 Y121.321 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1502
G1 X120.676 Y121.321 E.03159
G1 X120.651 Y121.611 E.00894
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X120.463 Y122.907 E.04344
G1 X119.537 Y122.907 E.03069
G1 X119.349 Y121.611 E.04344
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1502
G1 X119.324 Y121.321 E.00894
G1 X119.587 Y121.321 E.00808
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P69 R3
G1 F24000
G1 X120.676 Y121.321 E-.41347
G1 X120.651 Y121.611 E-.11058
G1 X120.561 Y122.225 E-.23596
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/25
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
G3 Z.8 I-1.21 J-.133 P1  F30000
G1 X118.009 Y145.463 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Support interface
G1 F1384
G2 X118.21 Y146.807 I8.741 J-.624 E.04181
G1 X118.216 Y150.585 E.11608
G2 X117.339 Y151.074 I1.563 J3.832 E.03094
G1 X117.339 Y145.463 E.17243
G1 X116.462 Y145.463 E.02695
G1 X116.462 Y151.217 E.17681
G1 X116.216 Y151.217 E.00755
G1 X116.216 Y150.751 E.01433
; WIPE_START
G1 F24000
G1 X116.216 Y151.217 E-.17717
G1 X116.462 Y151.217 E-.09343
G1 X116.462 Y149.929 E-.48941
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.883 J.837 P1  F30000
G1 X118.518 Y147.759 Z1
G1 Z.6
G1 E.8 F1800
G1 F1384
G2 X119.093 Y148.123 I.447 J-.07 E.02368
G1 X119.093 Y150.394 E.06977
G3 X119.97 Y150.585 I.097 J1.662 E.02793
G1 X119.97 Y146.826 E.11551
G2 X120.178 Y145.463 I-5.521 J-1.538 E.04246
G1 X120.847 Y145.463 E.02057
G1 X120.847 Y151.074 E.17243
G3 X121.032 Y151.211 I-.024 J.225 E.00741
G1 X121.724 Y151.217 E.02128
G1 X121.724 Y145.463 E.17681
G1 X121.97 Y145.463 E.00755
G1 X121.97 Y145.929 E.01433
; WIPE_START
G1 F24000
G1 X121.97 Y145.463 E-.17717
G1 X121.724 Y145.463 E-.09343
G1 X121.724 Y146.751 E-.4894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.037 J-.637 P1  F30000
G1 X118.525 Y151.959 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1384
G1 X118.491 Y151.756 E.00685
G1 X118.862 Y151.627 E.01303
G1 X119.325 Y151.627 E.01535
G1 X119.696 Y151.756 E.01303
G1 X119.661 Y151.959 E.00685
G1 X118.585 Y151.959 E.0357
G1 X118.192 Y152.351 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1384
G1 X117.865 Y152.351 E.01005
G1 X117.806 Y151.662 E.02124
G1 X117.84 Y151.639 E.00127
G3 X118.742 Y151.253 I1.834 J3.038 E.03025
G1 X118.789 Y151.235 E.00155
G1 X119.397 Y151.235 E.01868
G2 X119.968 Y151.435 I6.24 J-16.866 E.01859
G1 X120.27 Y151.592 E.01046
G3 X120.381 Y151.662 I-.64 J1.118 E.00403
G1 X120.321 Y152.351 E.02124
G1 X119.994 Y152.351 E.01005
G1 X118.252 Y152.351 E.05354
M204 S10000
; WIPE_START
G1 F24000
G1 X117.865 Y152.351 E-.14706
G1 X117.806 Y151.662 E-.2627
G1 X117.84 Y151.639 E-.01573
G1 X118.218 Y151.435 E-.16329
G1 X118.644 Y151.287 E-.17121
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.214 J.091 P1  F30000
G1 X119.499 Y139.924 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1384
G1 X118.687 Y139.924 E.02691
G1 X118.619 Y139.123 E.02669
G1 X119.567 Y139.123 E.03147
G1 X119.504 Y139.864 E.0247
G1 X119.6 Y140.316 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1384
G1 X118.383 Y140.316 E.03737
G1 X118.383 Y140.963 E.01989
G1 X118.313 Y140.149 E.02513
M106 S255
G1 F1800
G1 X118.191 Y138.73 E.04373
G1 X118.211 Y138.73 E.00059
M106 S252.45
G1 F1384
G1 X118.375 Y138.73 E.00506
G1 X119.811 Y138.73 E.04412
G1 X119.976 Y138.73 E.00506
M106 S255
G1 F1800
G1 X119.994 Y138.73 E.00057
G1 X119.872 Y140.155 E.04392
M106 S252.45
G1 F1384
G1 X119.803 Y140.961 E.02488
G1 X119.803 Y140.316 E.01982
G1 X119.66 Y140.316 E.00442
M204 S10000
; WIPE_START
G1 F24000
G1 X118.383 Y140.316 E-.48499
G1 X118.383 Y140.963 E-.24593
G1 X118.377 Y140.887 E-.02908
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.883 J.838 P1  F30000
G1 X125.656 Y133.219 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F1384
G1 X125.656 Y132.839 E.01168
G1 X134.236 Y132.839 E.26364
G1 X134.236 Y133.219 E.01168
G1 X125.716 Y133.219 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X125.656 Y132.839 E-.14619
G1 X127.272 Y132.839 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.112 J-.493 P1  F30000
G1 X125.21 Y128.19 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
G1 F1384
G1 X125.21 Y127.81 E.01168
G1 X133.79 Y127.81 E.26364
G1 X133.79 Y128.19 E.01168
G1 X125.27 Y128.19 E.2618
M204 S10000
; WIPE_START
G1 F24000
G1 X125.21 Y127.81 E-.14619
G1 X126.825 Y127.81 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.211 J-1.199 P1  F30000
G1 X122.877 Y128.504 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Support interface
G1 F1384
G1 X122.877 Y128.038 E.01433
G1 X122.631 Y128.038 E.00755
G1 X122.631 Y133.792 E.17681
G1 X121.939 Y133.786 E.02128
G2 X121.754 Y133.649 I-.209 J.088 E.00741
G1 X121.754 Y128.038 E.17243
G1 X121.085 Y128.038 E.02057
G3 X120.877 Y129.401 I-5.728 J-.175 E.04246
G1 X120.877 Y133.16 E.11551
G2 X120 Y132.969 I-.78 J1.47 E.02793
G1 X120 Y130.698 E.06977
G3 X119.425 Y130.334 I-.128 J-.434 E.02368
; WIPE_START
G1 F24000
G1 X119.496 Y130.551 E-.08653
G1 X119.7 Y130.698 E-.09563
G1 X120 Y130.698 E-.11413
G1 X120 Y131.918 E-.46372
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.172 J-.328 P1  F30000
G1 X118.915 Y128.038 Z1
G1 Z.6
G1 E.8 F1800
G1 F1384
G2 X119.117 Y129.382 I8.741 J-.624 E.04181
G1 X119.123 Y133.16 E.11608
G2 X118.246 Y133.649 I1.563 J3.832 E.03094
G1 X118.246 Y128.038 E.17243
G1 X117.369 Y128.038 E.02695
M73 P69 R2
G1 X117.369 Y133.792 E.17681
G1 X117.123 Y133.792 E.00755
G1 X117.123 Y133.326 E.01433
; WIPE_START
G1 F24000
G1 X117.123 Y133.792 E-.17717
G1 X117.369 Y133.792 E-.09343
G1 X117.369 Y132.504 E-.48941
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.854 J.867 P1  F30000
G1 X119.432 Y134.534 Z1
M73 P70 R2
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1384
G1 X119.398 Y134.331 E.00685
G1 X119.769 Y134.202 E.01303
G1 X120.231 Y134.202 E.01535
G1 X120.602 Y134.331 E.01303
G1 X120.568 Y134.534 E.00685
G1 X119.492 Y134.534 E.0357
G1 X119.099 Y134.926 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1384
G1 X118.772 Y134.926 E.01005
G1 X118.713 Y134.238 E.02124
G1 X118.747 Y134.214 E.00127
G3 X119.649 Y133.828 I1.834 J3.038 E.03025
G1 X119.696 Y133.81 E.00155
G1 X120.304 Y133.81 E.01868
G2 X120.875 Y134.01 I6.24 J-16.866 E.01859
G1 X121.177 Y134.167 E.01046
G3 X121.287 Y134.238 I-.64 J1.118 E.00403
G1 X121.228 Y134.926 E.02124
G1 X120.901 Y134.926 E.01005
G1 X119.159 Y134.926 E.05354
M204 S10000
; WIPE_START
G1 F24000
G1 X118.772 Y134.926 E-.14706
G1 X118.713 Y134.238 E-.2627
G1 X118.747 Y134.214 E-.01573
G1 X119.125 Y134.01 E-.16329
G1 X119.551 Y133.862 E-.17121
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.214 J.091 P1  F30000
G1 X120.405 Y122.499 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1384
G1 X119.594 Y122.499 E.02691
G1 X119.525 Y121.698 E.02669
G1 X120.474 Y121.698 E.03147
G1 X120.41 Y122.439 E.0247
G1 X120.506 Y122.891 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1384
G1 X119.29 Y122.891 E.03737
G1 X119.29 Y123.539 E.01989
G1 X119.22 Y122.724 E.02513
M106 S255
G1 F1800
G1 X119.098 Y121.306 E.04373
G1 X119.117 Y121.306 E.00059
M106 S252.45
G1 F1384
G1 X119.282 Y121.306 E.00506
G1 X120.718 Y121.306 E.04412
G1 X120.883 Y121.306 E.00506
M106 S255
G1 F1800
G1 X120.901 Y121.306 E.00057
G1 X120.779 Y122.73 E.04392
M106 S252.45
G1 F1384
G1 X120.71 Y123.536 E.02488
G1 X120.71 Y122.891 E.01982
G1 X120.566 Y122.891 E.00442
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.29 Y122.891 E-.48499
G1 X119.29 Y123.539 E-.24593
G1 X119.283 Y123.462 E-.02907
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/25
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
G3 Z1 I-1.215 J-.06 P1  F30000
G1 X118.047 Y148.34 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Support interface
G1 F1416
G2 X118.216 Y149.418 I3.76 J-.037 E.03366
G1 X118.216 Y150.354 E.02875
G2 X117.339 Y150.899 I2.886 J5.617 E.03177
G1 X117.339 Y148.34 E.07865
G1 X116.462 Y148.34 E.02695
G1 X116.462 Y151.217 E.08841
G1 X116.216 Y151.217 E.00755
G1 X116.216 Y150.751 E.01433
; WIPE_START
G1 F24000
G1 X116.216 Y151.217 E-.17717
G1 X116.462 Y151.217 E-.09343
G1 X116.462 Y149.929 E-.48941
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.116 J1.211 P1  F30000
G1 X119.914 Y149.598 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F1416
G1 X119.71 Y150.249 E.02097
G3 X119.97 Y150.354 I-2.735 J7.175 E.00861
G1 X119.97 Y149.418 E.02875
G2 X120.139 Y148.34 I-3.591 J-1.115 E.03366
G1 X120.847 Y148.34 E.02176
G1 X120.847 Y150.899 E.07865
G1 X121.269 Y151.217 E.01623
G1 X121.724 Y151.217 E.01398
G1 X121.724 Y148.34 E.08841
G1 X121.97 Y148.34 E.00755
G1 X121.97 Y148.806 E.01433
; WIPE_START
G1 F24000
G1 X121.97 Y148.34 E-.17717
G1 X121.724 Y148.34 E-.09343
G1 X121.724 Y149.628 E-.4894
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.661 J-1.022 P1  F30000
G1 X118.144 Y151.944 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1416
G1 X118.092 Y151.77 E.00603
G1 X118.359 Y151.594 E.01061
G1 X118.908 Y151.384 E.01949
G1 X119.279 Y151.384 E.01231
G1 X119.334 Y151.398 E.0019
G1 X119.828 Y151.594 E.0176
G1 X120.095 Y151.77 E.01061
G1 X120.043 Y151.944 E.00603
G1 X118.204 Y151.944 E.061
G1 X117.823 Y152.336 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1416
G1 X117.639 Y152.336 E.00565
G1 X117.579 Y151.645 E.02132
G1 X117.597 Y151.632 E.00068
G3 X118.177 Y151.244 I6.956 J9.775 E.02143
G1 X118.417 Y151.149 E.00792
M106 S255
G1 F1800
G3 X118.858 Y150.992 I.835 J1.647 E.01444
G1 X119.328 Y150.992 E.01443
G3 X119.77 Y151.149 I-.393 J1.804 E.01444
M106 S252.45
G1 F1416
G1 X120.009 Y151.244 E.00792
G3 X120.607 Y151.645 I-7.826 J12.333 E.02211
G1 X120.548 Y152.336 E.02132
G1 X120.364 Y152.336 E.00565
G1 X117.883 Y152.336 E.07625
M204 S10000
G1 X117.906 Y152.14 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.201591
G1 F1416
G1 X117.866 Y151.926 E.00282
; LINE_WIDTH: 0.170691
G1 X117.825 Y151.712 E.00227
G1 X118.657 Y151.718 F30000
; LINE_WIDTH: 0.146157
G1 F1416
G1 X118.802 Y151.691 E.00124
; LINE_WIDTH: 0.19561
G1 X118.948 Y151.664 E.00184
; LINE_WIDTH: 0.179468
G3 X119.248 Y151.665 I.148 J1.193 E.00335
G1 X119.389 Y151.691 E.0016
; LINE_WIDTH: 0.0969204
G1 X119.53 Y151.718 E.00063
G1 X120.362 Y151.712 F30000
; LINE_WIDTH: 0.139793
G1 F1416
G1 X120.321 Y151.926 E.00172
; LINE_WIDTH: 0.170692
G1 X120.28 Y152.14 E.00227
; WIPE_START
G1 F24000
G1 X120.321 Y151.926 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.203 J-.183 P1  F30000
G1 X119.38 Y145.736 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
M73 P71 R2
G1 F3000
G1 X119.532 Y145.736 E.00504
G1 X119.395 Y146.659 E.03096
G3 X119.116 Y147.525 I-27.895 J-8.531 E.03018
G1 X119.071 Y147.525 E.0015
G3 X118.791 Y146.659 I27.615 J-9.397 E.03018
G1 X118.654 Y145.736 E.03096
G1 X119.32 Y145.736 E.02209
M106 S252.45
M204 S10000
; WIPE_START
G1 F24000
G1 X119.532 Y145.736 E-.08057
G1 X119.395 Y146.659 E-.35463
G1 X119.133 Y147.472 E-.3248
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.216 J.04 P1  F30000
G1 X119.38 Y139.909 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1416
G1 X118.504 Y139.909 E.02907
G1 X118.462 Y139.107 E.02663
G1 X119.725 Y139.107 E.0419
G1 X119.683 Y139.909 E.02663
G1 X119.44 Y139.909 E.00804
G1 X119.38 Y140.301 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1416
G1 X118.383 Y140.301 E.03064
G1 X118.383 Y141.442 E.03507
G1 X118.383 Y142.681 E.03807
G1 X118.383 Y143.582 E.02769
G1 X118.313 Y142.767 E.02513
M106 S255
G1 F1800
G3 X118.15 Y140.639 I31.941 J-3.526 E.06562
M106 S252.45
G1 F1416
G1 X118.048 Y138.715 E.05918
G1 X118.067 Y138.715 E.00056
G1 X118.149 Y138.715 E.00253
G1 X120.037 Y138.715 E.05801
G1 X120.119 Y138.715 E.00253
G1 X120.138 Y138.715 E.00058
G1 X120.037 Y140.63 E.05893
M106 S255
G1 F1800
G3 X119.873 Y142.767 I-32.227 J-1.399 E.06587
M106 S252.45
G1 F1416
G1 X119.803 Y143.582 E.02513
G1 X119.803 Y142.681 E.02769
G1 X119.803 Y141.441 E.0381
G1 X119.803 Y140.301 E.03504
G1 X119.44 Y140.301 E.01115
M204 S10000
G1 X119.5 Y139.508 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.437508
G1 F1416
G1 X118.687 Y139.508 E.02615
; WIPE_START
G1 F24000
G1 X119.5 Y139.508 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.215 J-.077 P1  F30000
G1 X119.093 Y145.932 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.408336
G1 F1416
G1 X119.093 Y146.256 E.00966
; LINE_WIDTH: 0.361868
G1 X119.093 Y146.581 E.00844
; LINE_WIDTH: 0.315399
G1 X119.093 Y146.905 E.00721
; WIPE_START
G1 F24000
G1 X119.093 Y146.581 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.092 J.537 P1  F30000
G1 X125.656 Y133.219 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1416
G1 X125.656 Y132.839 E.01168
G1 X133.836 Y132.839 E.25135
G1 X133.836 Y133.219 E.01168
G1 X125.716 Y133.219 E.24951
M204 S10000
; WIPE_START
G1 F24000
G1 X125.656 Y132.839 E-.14619
G1 X127.272 Y132.839 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.112 J-.493 P1  F30000
G1 X125.21 Y128.19 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
G1 F1416
G1 X125.21 Y127.81 E.01168
G1 X133.39 Y127.81 E.25135
G1 X133.39 Y128.19 E.01168
G1 X125.27 Y128.19 E.24951
M204 S10000
; WIPE_START
G1 F24000
G1 X125.21 Y127.81 E-.14619
G1 X126.825 Y127.81 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.816 J-.903 P1  F30000
G1 X122.877 Y131.381 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Support interface
G1 F1416
G1 X122.877 Y130.915 E.01433
G1 X122.631 Y130.915 E.00755
G1 X122.631 Y133.792 E.08841
G1 X122.176 Y133.792 E.01398
G1 X121.754 Y133.475 E.01623
G1 X121.754 Y130.915 E.07865
G1 X121.046 Y130.915 E.02176
G3 X120.877 Y131.993 I-3.76 J-.037 E.03366
G1 X120.877 Y132.929 E.02875
G2 X120.617 Y132.824 I-2.995 J7.07 E.00861
G1 X120.821 Y132.173 E.02097
; WIPE_START
G1 F24000
G1 X120.617 Y132.824 E-.25927
G1 X120.877 Y132.929 E-.10646
G1 X120.877 Y131.993 E-.35556
G1 X120.893 Y131.893 E-.0387
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.548 J-1.087 P1  F30000
G1 X118.954 Y130.915 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F1416
G2 X119.123 Y131.993 I3.76 J-.037 E.03366
G1 X119.123 Y132.929 E.02875
G2 X118.246 Y133.475 I2.886 J5.617 E.03177
G1 X118.246 Y130.915 E.07865
G1 X117.369 Y130.915 E.02695
G1 X117.369 Y133.792 E.08841
G1 X117.123 Y133.792 E.00755
G1 X117.123 Y133.326 E.01433
; WIPE_START
G1 F24000
G1 X117.123 Y133.792 E-.17717
G1 X117.369 Y133.792 E-.09343
G1 X117.369 Y132.504 E-.48941
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.934 J.78 P1  F30000
G1 X119.051 Y134.519 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1416
G1 X118.998 Y134.345 E.00603
G1 X119.266 Y134.169 E.01061
G1 X119.814 Y133.959 E.01949
G1 X120.186 Y133.959 E.01231
G1 X120.241 Y133.973 E.0019
G1 X120.734 Y134.169 E.0176
G1 X121.002 Y134.345 E.01061
G1 X120.949 Y134.519 E.00603
G1 X119.111 Y134.519 E.061
G1 X118.729 Y134.911 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1416
G1 X118.545 Y134.911 E.00565
G1 X118.486 Y134.22 E.02132
G1 X118.504 Y134.207 E.00068
G3 X119.084 Y133.819 I6.956 J9.775 E.02143
G1 X119.324 Y133.724 E.00792
M106 S255
G1 F1800
G3 X119.765 Y133.567 I.835 J1.647 E.01444
G1 X120.235 Y133.567 E.01443
G3 X120.676 Y133.724 I-.393 J1.804 E.01444
M106 S252.45
G1 F1416
G1 X120.916 Y133.819 E.00792
G3 X121.514 Y134.22 I-7.826 J12.333 E.02211
G1 X121.455 Y134.911 E.02132
G1 X121.271 Y134.911 E.00565
G1 X118.789 Y134.911 E.07625
M204 S10000
G1 X118.813 Y134.715 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.201591
G1 F1416
G1 X118.772 Y134.501 E.00282
; LINE_WIDTH: 0.170691
G1 X118.732 Y134.287 E.00227
G1 X119.563 Y134.293 F30000
; LINE_WIDTH: 0.146157
G1 F1416
G1 X119.709 Y134.266 E.00124
; LINE_WIDTH: 0.19561
G1 X119.854 Y134.239 E.00184
; LINE_WIDTH: 0.179468
G3 X120.155 Y134.24 I.148 J1.193 E.00335
G1 X120.296 Y134.267 E.0016
; LINE_WIDTH: 0.0969204
G1 X120.437 Y134.293 E.00063
G1 X121.268 Y134.287 F30000
; LINE_WIDTH: 0.139793
G1 F1416
G1 X121.228 Y134.501 E.00172
; LINE_WIDTH: 0.170692
G1 X121.187 Y134.715 E.00227
; WIPE_START
G1 F24000
G1 X121.228 Y134.501 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.203 J-.183 P1  F30000
G1 X120.287 Y128.311 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
M73 P72 R2
G1 F3000
G1 X120.439 Y128.311 E.00504
G1 X120.302 Y129.234 E.03096
G3 X120.023 Y130.1 I-27.895 J-8.531 E.03018
G1 X119.977 Y130.1 E.0015
G3 X119.698 Y129.234 I27.615 J-9.397 E.03018
G1 X119.561 Y128.311 E.03096
G1 X120.227 Y128.311 E.02209
M106 S252.45
M204 S10000
; WIPE_START
G1 F24000
G1 X120.439 Y128.311 E-.08057
G1 X120.302 Y129.234 E-.35463
G1 X120.039 Y130.047 E-.3248
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.216 J.04 P1  F30000
G1 X120.287 Y122.484 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1416
G1 X119.411 Y122.484 E.02907
G1 X119.368 Y121.682 E.02663
G1 X120.632 Y121.682 E.0419
G1 X120.589 Y122.484 E.02663
G1 X120.347 Y122.484 E.00804
G1 X120.287 Y122.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1416
G1 X119.29 Y122.876 E.03064
G1 X119.29 Y124.017 E.03507
G1 X119.29 Y125.256 E.03807
G1 X119.29 Y126.157 E.02769
G1 X119.22 Y125.342 E.02513
M106 S255
G1 F1800
G3 X119.056 Y123.214 I31.941 J-3.526 E.06562
M106 S252.45
G1 F1416
G1 X118.955 Y121.29 E.05918
G1 X118.973 Y121.29 E.00056
G1 X119.056 Y121.29 E.00253
G1 X120.944 Y121.29 E.05801
G1 X121.026 Y121.29 E.00253
G1 X121.045 Y121.29 E.00058
G1 X120.944 Y123.205 E.05893
M106 S255
G1 F1800
G3 X120.78 Y125.342 I-32.227 J-1.399 E.06587
M106 S252.45
G1 F1416
G1 X120.71 Y126.157 E.02513
G1 X120.71 Y125.256 E.02769
G1 X120.71 Y124.016 E.0381
G1 X120.71 Y122.876 E.03504
G1 X120.347 Y122.876 E.01115
M204 S10000
G1 X120.407 Y122.083 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.437508
G1 F1416
G1 X119.593 Y122.083 E.02615
; WIPE_START
G1 F24000
G1 X120.407 Y122.083 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.215 J-.077 P1  F30000
G1 X120 Y128.507 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.408336
G1 F1416
G1 X120 Y128.831 E.00966
; LINE_WIDTH: 0.361868
G1 X120 Y129.156 E.00844
; LINE_WIDTH: 0.315399
G1 X120 Y129.48 E.00721
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120 Y129.156 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/25
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
G3 Z1.2 I-1.212 J-.115 P1  F30000
G1 X117.853 Y151.758 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1539
G2 X118.465 Y151.335 I-11.952 J-17.967 E.02468
G3 X118.983 Y151.141 I.895 J1.605 E.01841
G3 X119.405 Y151.193 I.11 J.85 E.01423
G3 X119.98 Y151.522 I-.636 J1.78 E.02209
G3 X120.333 Y151.758 I-3.88 J6.193 E.0141
G1 X120.28 Y151.929 E.00594
G1 X117.907 Y151.929 E.07871
G1 X117.871 Y151.815 E.00395
G1 X117.383 Y151.617 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1539
G3 X118.348 Y150.956 I12.013 J16.497 E.03595
M106 S255
G1 F1800
G3 X118.934 Y150.749 I1.006 J1.92 E.01917
G3 X119.7 Y150.888 I.106 J1.597 E.02418
G1 X119.839 Y150.956 E.00474
M106 S252.45
G1 F1539
G3 X120.804 Y151.617 I-11.048 J17.158 E.03595
G1 X120.785 Y151.966 E.01073
G1 X120.767 Y152.321 E.01092
G1 X120.59 Y152.321 E.00542
G1 X117.596 Y152.321 E.092
G1 X117.42 Y152.321 E.00542
G1 X117.401 Y151.966 E.01092
G1 X117.386 Y151.677 E.00888
M204 S10000
G1 X117.608 Y151.71 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137974
G1 F1539
G1 X117.645 Y151.917 E.00163
; LINE_WIDTH: 0.179028
G1 X117.683 Y152.125 E.00234
G1 X118.374 Y151.652 F30000
; LINE_WIDTH: 0.389104
G1 F1539
G1 X118.898 Y151.552 E.01505
; LINE_WIDTH: 0.411272
G3 X119.288 Y151.552 I.195 J1.115 E.01177
; LINE_WIDTH: 0.347352
G1 X119.812 Y151.652 E.01323
G1 X120.579 Y151.71 F30000
; LINE_WIDTH: 0.09692
G1 F1539
G1 X120.541 Y151.917 E.00093
; LINE_WIDTH: 0.137973
G1 X120.504 Y152.125 E.00163
; WIPE_START
G1 F24000
G1 X120.541 Y151.917 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.202 J-.187 P1  F30000
G1 X119.576 Y145.72 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1539
G1 X118.383 Y145.72 E.03665
G1 X118.383 Y145.306 E.01274
G1 X118.383 Y140.286 E.15425
G1 X119.803 Y140.286 E.04363
G1 X119.803 Y145.306 E.15425
G1 X119.803 Y145.72 E.01274
G1 X119.636 Y145.72 E.00514
M204 S10000
G1 X119.417 Y146.112 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1539
G1 X119.35 Y146.897 E.02612
G3 X119.198 Y147.926 I-165.329 J-23.799 E.03451
G1 X118.988 Y147.926 E.00698
G1 X118.908 Y147.39 E.01797
G3 X118.837 Y146.897 I3.917 J-.82 E.01655
G1 X118.769 Y146.112 E.02612
G1 X119.357 Y146.112 E.01951
; WIPE_START
G1 F24000
G1 X119.35 Y146.897 E-.2981
G1 X119.198 Y147.926 E-.39533
G1 X119.023 Y147.926 E-.06657
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.212 J.113 P1  F30000
G1 X119.844 Y139.092 Z1.4
G1 Z1
G1 E.8 F1800
G1 F1539
G1 X119.831 Y139.534 E.01467
G1 X119.821 Y139.894 E.01194
G1 X118.366 Y139.894 E.04825
G1 X118.343 Y139.092 E.0266
G1 X119.784 Y139.092 E.0478
G1 X120.247 Y138.7 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1539
G1 X120.229 Y139.323 E.01915
G1 X120.212 Y139.934 E.0188
G1 X120.037 Y143.257 E.10225
M106 S255
G1 F1800
G3 X119.872 Y145.401 I-32.324 J-1.409 E.06607
M106 S252.45
M106 S255
G1 F600
G1 X119.741 Y146.929 E.04711
M106 S252.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X119.737 Y146.976 E.00157
G2 X119.412 Y149.2 I188.977 J28.763 E.07456
G1 X119.119 Y150.134 E.03248
G1 X119.067 Y150.134 E.00173
G1 X118.775 Y149.2 E.03248
G3 X118.446 Y146.929 I1242.72 J-181.277 E.07613
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X118.314 Y145.401 E.04711
M106 S252.45
M106 S255
G1 F1800
G3 X118.15 Y143.257 I32.159 J-3.552 E.06607
M106 S252.45
G1 F1539
G1 X117.975 Y139.934 E.10225
G1 X117.957 Y139.323 E.0188
G1 X117.939 Y138.7 E.01915
G1 X118.007 Y138.7 E.00207
G1 X120.18 Y138.7 E.06678
G1 X120.187 Y138.7 E.00023
M204 S10000
; WIPE_START
G1 F24000
G1 X120.229 Y139.323 E-.23729
G1 X120.212 Y139.934 E-.23246
G1 X120.171 Y140.697 E-.29025
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.051 J-.613 P1  F30000
G1 X119.527 Y139.591 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.433367
G1 F1539
G1 X119.431 Y139.493 E.00438
G1 X118.558 Y139.493 E.02778
G1 X119.527 Y139.591 F30000
; LINE_WIDTH: 0.376648
G1 F1539
G1 X119.623 Y139.69 E.00374
; WIPE_START
G1 F24000
G1 X119.527 Y139.591 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.214 J-.078 P1  F30000
G1 X119.093 Y146.316 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.230742
G1 F1539
G1 X119.093 Y146.608 E.00447
; LINE_WIDTH: 0.188748
G1 X119.093 Y146.9 E.00347
; LINE_WIDTH: 0.146753
G1 X119.093 Y147.096 E.00166
; WIPE_START
G1 F24000
G1 X119.093 Y146.9 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.217 J0 P1  F30000
G1 X119.093 Y148.122 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.518986
G1 F1539
G1 X119.093 Y148.397 E.01067
; LINE_WIDTH: 0.475473
G1 X119.093 Y148.672 E.00969
; LINE_WIDTH: 0.431961
G1 X119.093 Y148.947 E.00872
; LINE_WIDTH: 0.388449
G1 X119.093 Y149.222 E.00774
; LINE_WIDTH: 0.344937
G1 X119.093 Y149.497 E.00677
; WIPE_START
G1 F24000
G1 X119.093 Y149.222 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.126 J.462 P1  F30000
G1 X125.656 Y133.219 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1539
G1 X125.656 Y132.839 E.01168
G1 X133.436 Y132.839 E.23906
G1 X133.436 Y133.219 E.01168
G1 X125.716 Y133.219 E.23721
M204 S10000
; WIPE_START
M73 P73 R2
G1 F24000
G1 X125.656 Y132.839 E-.14619
G1 X127.272 Y132.839 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.112 J-.493 P1  F30000
G1 X125.21 Y128.19 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
G1 F1539
G1 X125.21 Y127.81 E.01168
G1 X132.99 Y127.81 E.23906
G1 X132.99 Y128.19 E.01168
G1 X125.27 Y128.19 E.23721
M204 S10000
; WIPE_START
G1 F24000
G1 X125.21 Y127.81 E-.14619
G1 X126.825 Y127.81 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.765 J-.946 P1  F30000
G1 X118.76 Y134.333 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1539
G2 X119.372 Y133.91 I-11.952 J-17.967 E.02468
G3 X119.89 Y133.717 I.895 J1.605 E.01841
G3 X120.312 Y133.768 I.11 J.85 E.01423
G3 X120.887 Y134.097 I-.636 J1.78 E.02209
G3 X121.24 Y134.333 I-3.88 J6.193 E.0141
G1 X121.186 Y134.504 E.00594
G1 X118.814 Y134.504 E.07871
G1 X118.778 Y134.39 E.00395
G1 X118.289 Y134.192 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1539
G3 X119.254 Y133.531 I12.013 J16.497 E.03595
M106 S255
G1 F1800
G3 X119.841 Y133.324 I1.006 J1.92 E.01917
G3 X120.607 Y133.463 I.106 J1.597 E.02418
G1 X120.746 Y133.531 E.00474
M106 S252.45
G1 F1539
G3 X121.711 Y134.192 I-11.048 J17.158 E.03595
G1 X121.692 Y134.541 E.01073
G1 X121.674 Y134.896 E.01092
G1 X121.497 Y134.896 E.00542
G1 X118.503 Y134.896 E.092
G1 X118.326 Y134.896 E.00542
G1 X118.308 Y134.541 E.01092
G1 X118.293 Y134.252 E.00888
M204 S10000
G1 X118.514 Y134.285 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.137974
G1 F1539
G1 X118.552 Y134.492 E.00163
; LINE_WIDTH: 0.179028
G1 X118.589 Y134.7 E.00234
G1 X119.281 Y134.227 F30000
; LINE_WIDTH: 0.389104
G1 F1539
G1 X119.805 Y134.127 E.01505
; LINE_WIDTH: 0.411272
G3 X120.195 Y134.127 I.195 J1.115 E.01177
; LINE_WIDTH: 0.347352
G1 X120.719 Y134.227 E.01323
G1 X121.486 Y134.285 F30000
; LINE_WIDTH: 0.09692
G1 F1539
G1 X121.448 Y134.492 E.00093
; LINE_WIDTH: 0.137973
G1 X121.411 Y134.7 E.00163
; WIPE_START
G1 F24000
G1 X121.448 Y134.492 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.202 J-.187 P1  F30000
G1 X120.483 Y128.295 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1539
G1 X119.29 Y128.295 E.03665
G1 X119.29 Y127.881 E.01274
G1 X119.29 Y122.861 E.15425
G1 X120.71 Y122.861 E.04363
G1 X120.71 Y127.881 E.15425
G1 X120.71 Y128.295 E.01274
G1 X120.543 Y128.295 E.00514
M204 S10000
G1 X120.324 Y128.687 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1539
G1 X120.257 Y129.472 E.02612
G3 X120.105 Y130.501 I-165.329 J-23.799 E.03451
G1 X119.895 Y130.501 E.00698
G1 X119.815 Y129.965 E.01797
G3 X119.743 Y129.472 I3.917 J-.82 E.01655
G1 X119.676 Y128.687 E.02612
G1 X120.264 Y128.687 E.01951
; WIPE_START
G1 F24000
G1 X120.257 Y129.472 E-.2981
G1 X120.105 Y130.501 E-.39533
G1 X119.93 Y130.501 E-.06657
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.212 J.113 P1  F30000
G1 X120.75 Y121.667 Z1.4
G1 Z1
G1 E.8 F1800
G1 F1539
G1 X120.738 Y122.109 E.01467
G1 X120.727 Y122.469 E.01194
G1 X119.273 Y122.469 E.04825
G1 X119.25 Y121.667 E.0266
G1 X120.69 Y121.667 E.0478
G1 X121.154 Y121.275 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1539
G1 X121.136 Y121.898 E.01915
G1 X121.118 Y122.509 E.0188
G1 X120.944 Y125.832 E.10225
M106 S255
G1 F1800
G3 X120.779 Y127.976 I-32.324 J-1.409 E.06607
M106 S252.45
M106 S255
G1 F600
G1 X120.647 Y129.504 E.04711
M106 S252.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X120.643 Y129.551 E.00157
G2 X120.318 Y131.775 I188.977 J28.763 E.07456
G1 X120.026 Y132.709 E.03248
G1 X119.974 Y132.709 E.00173
G1 X119.682 Y131.775 E.03248
G3 X119.353 Y129.504 I1242.72 J-181.277 E.07613
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X119.221 Y127.976 E.04711
M106 S252.45
M106 S255
G1 F1800
G3 X119.056 Y125.832 I32.159 J-3.552 E.06607
M106 S252.45
G1 F1539
G1 X118.882 Y122.509 E.10225
G1 X118.864 Y121.898 E.0188
G1 X118.846 Y121.275 E.01915
G1 X118.913 Y121.275 E.00207
G1 X121.087 Y121.275 E.06678
G1 X121.094 Y121.275 E.00023
M204 S10000
; WIPE_START
G1 F24000
G1 X121.136 Y121.898 E-.23729
G1 X121.118 Y122.509 E-.23246
G1 X121.078 Y123.272 E-.29025
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.051 J-.613 P1  F30000
G1 X120.434 Y122.167 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.376648
G1 F1539
G1 X120.53 Y122.265 E.00374
G1 X120.434 Y122.167 F30000
; LINE_WIDTH: 0.433367
G1 F1539
G1 X120.338 Y122.068 E.00438
G1 X119.465 Y122.068 E.02778
; WIPE_START
G1 F24000
G1 X120.338 Y122.068 E-.65657
G1 X120.434 Y122.167 E-.10343
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.214 J-.078 P1  F30000
G1 X120 Y128.891 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.230742
G1 F1539
G1 X120 Y129.183 E.00447
; LINE_WIDTH: 0.188748
G1 X120 Y129.475 E.00347
; LINE_WIDTH: 0.146753
G1 X120 Y129.671 E.00166
; WIPE_START
G1 F24000
G1 X120 Y129.475 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.217 J0 P1  F30000
G1 X120 Y130.697 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.518986
G1 F1539
G1 X120 Y130.972 E.01067
; LINE_WIDTH: 0.475473
G1 X120 Y131.247 E.00969
; LINE_WIDTH: 0.431961
G1 X120 Y131.522 E.00872
; LINE_WIDTH: 0.388449
G1 X120 Y131.797 E.00774
; LINE_WIDTH: 0.344937
G1 X120 Y132.072 E.00677
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120 Y131.797 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/25
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
G3 Z1.4 I-1.215 J-.066 P1  F30000
G1 X118.988 Y150.571 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1764
G1 X118.903 Y149.985 E.01963
G3 X118.833 Y149.479 I4.297 J-.845 E.01695
G1 X118.554 Y146.097 E.11256
G1 X119.633 Y146.097 E.03579
G1 X119.353 Y149.479 E.11256
G3 X119.199 Y150.571 I-118.308 J-16.151 E.03658
G1 X119.048 Y150.571 E.00502
; WIPE_START
G1 F24000
G1 X118.903 Y149.985 E-.22929
G1 X118.833 Y149.479 E-.19409
M73 P74 R2
G1 X118.76 Y148.596 E-.33661
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.144 J-.415 P1  F30000
G1 X117.593 Y151.818 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F1764
G1 X117.875 Y151.569 E.01248
G2 X118.53 Y151.101 I-8.175 J-12.123 E.02671
G1 X119.093 Y150.825 E.02081
G1 X119.657 Y151.101 E.02081
G3 X120.703 Y151.913 I-4.156 J6.43 E.04399
G1 X117.484 Y151.913 E.10677
G1 X117.548 Y151.857 E.00281
; WIPE_START
G1 F24000
G1 X117.875 Y151.569 E-.16578
G1 X118.53 Y151.101 E-.30589
G1 X119.093 Y150.825 E-.23843
G1 X119.211 Y150.883 E-.0499
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.217 J.011 P1  F30000
G1 X119.311 Y140.27 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1764
G1 X119.803 Y140.27 E.01514
G1 X119.803 Y145.705 E.16699
G1 X118.383 Y145.705 E.04363
G1 X118.383 Y140.27 E.16699
G1 X119.251 Y140.27 E.02665
M204 S10000
G1 X119.311 Y139.878 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1764
G1 X118.29 Y139.878 E.03386
G1 X118.267 Y139.077 E.0266
G1 X119.92 Y139.077 E.05483
G1 X119.897 Y139.878 E.0266
G1 X119.371 Y139.878 E.01745
; WIPE_START
G1 F24000
G1 X118.29 Y139.878 E-.41064
G1 X118.267 Y139.077 E-.30476
G1 X118.384 Y139.077 E-.0446
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.213 J-.102 P1  F30000
G1 X117.334 Y151.523 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1764
G1 X117.504 Y151.373 E.00698
G3 X118.327 Y150.763 I5.14 J6.078 E.0315
G1 X118.599 Y150.623 E.00939
G1 X118.569 Y150.419 E.00633
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G3 X118.443 Y149.511 I7.715 J-1.54 E.03045
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X118.313 Y148.005 E.04643
M106 S252.45
M106 S255
G1 F1800
G3 X118.15 Y145.876 I31.94 J-3.526 E.06562
M106 S252.45
G1 F1764
G1 X117.975 Y142.553 E.10225
G1 X117.957 Y141.942 E.0188
G1 X117.863 Y138.685 E.10013
G1 X117.898 Y138.685 E.00106
G1 X120.289 Y138.685 E.07347
G1 X120.323 Y138.685 E.00106
G1 X120.229 Y141.942 E.10013
G1 X120.212 Y142.553 E.0188
G1 X120.037 Y145.876 E.10225
M106 S255
G1 F1800
G3 X119.873 Y148.005 I-32.104 J-1.397 E.06562
M106 S252.45
M106 S255
G1 F600
G1 X119.744 Y149.511 E.04643
M106 S252.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G3 X119.617 Y150.419 I-7.842 J-.632 E.03045
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1764
G1 X119.587 Y150.623 E.00633
G1 X119.859 Y150.763 E.00939
G3 X120.682 Y151.373 I-4.316 J6.688 E.0315
G1 X120.928 Y151.59 E.01007
G1 X120.942 Y151.602 E.00057
G1 X120.905 Y152.305 E.02164
G1 X120.809 Y152.305 E.00297
G1 X117.281 Y152.305 E.10839
G1 X117.244 Y151.602 E.02164
G1 X117.258 Y151.59 E.00057
G1 X117.289 Y151.563 E.00124
M204 S10000
; WIPE_START
G1 F24000
G1 X117.504 Y151.373 E-.10915
G1 X117.634 Y151.259 E-.06592
G1 X118.327 Y150.763 E-.3237
G1 X118.599 Y150.623 E-.11612
G1 X118.569 Y150.419 E-.07834
G1 X118.545 Y150.245 E-.06677
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.842 J.879 P1  F30000
G1 X119.093 Y149.72 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.146459
G1 F1764
G1 X119.093 Y149.521 E.00168
; LINE_WIDTH: 0.196445
G1 X119.093 Y149.199 E.00403
; LINE_WIDTH: 0.24643
G1 X119.093 Y148.877 E.00534
; LINE_WIDTH: 0.296416
G1 X119.093 Y148.555 E.00665
; LINE_WIDTH: 0.346401
G1 X119.093 Y148.233 E.00796
; LINE_WIDTH: 0.396387
G1 X119.093 Y147.911 E.00928
; LINE_WIDTH: 0.446372
G1 X119.093 Y147.589 E.01059
; LINE_WIDTH: 0.496358
G1 X119.093 Y147.267 E.0119
; LINE_WIDTH: 0.546343
G1 X119.093 Y146.945 E.01321
; LINE_WIDTH: 0.596329
G1 X119.093 Y146.623 E.01452
; LINE_WIDTH: 0.646314
G1 X119.093 Y146.301 E.01583
; WIPE_START
G1 F24000
G1 X119.093 Y146.623 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.199 J-.209 P1  F30000
G1 X118.161 Y141.27 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.0969193
G1 F1764
G1 X118.143 Y140.074 E.00526
G1 X118.482 Y139.478 F30000
; LINE_WIDTH: 0.437508
G1 F1764
G1 X119.705 Y139.478 E.03931
G1 X120.043 Y140.074 F30000
; LINE_WIDTH: 0.12942
G1 F1764
G1 X120.026 Y141.27 E.00843
; WIPE_START
G1 F24000
G1 X120.043 Y140.074 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.942 J.771 P1  F30000
G1 X125.656 Y133.219 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1764
G1 X125.656 Y132.839 E.01168
G1 X133.036 Y132.839 E.22677
G1 X133.036 Y133.219 E.01168
G1 X125.716 Y133.219 E.22492
M204 S10000
; WIPE_START
G1 F24000
G1 X125.656 Y132.839 E-.14619
G1 X127.272 Y132.839 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.112 J-.493 P1  F30000
G1 X125.21 Y128.19 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
G1 F1764
G1 X125.21 Y127.81 E.01168
G1 X132.59 Y127.81 E.22677
G1 X132.59 Y128.19 E.01168
G1 X125.27 Y128.19 E.22492
M204 S10000
; WIPE_START
G1 F24000
G1 X125.21 Y127.81 E-.14619
G1 X126.825 Y127.81 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.742 J-.964 P1  F30000
G1 X119.894 Y133.146 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1764
G1 X119.809 Y132.56 E.01963
G3 X119.74 Y132.054 I4.297 J-.845 E.01695
G1 X119.461 Y128.672 E.11256
G1 X120.539 Y128.672 E.03579
G1 X120.26 Y132.054 E.11256
G3 X120.106 Y133.146 I-118.308 J-16.151 E.03658
G1 X119.954 Y133.146 E.00502
; WIPE_START
G1 F24000
G1 X119.809 Y132.56 E-.22929
G1 X119.74 Y132.054 E-.19409
G1 X119.667 Y131.171 E-.33661
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.144 J-.415 P1  F30000
G1 X118.499 Y134.393 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F1764
G1 X118.782 Y134.144 E.01248
G2 X119.437 Y133.676 I-8.175 J-12.123 E.02671
G1 X120 Y133.4 E.02081
G1 X120.563 Y133.676 E.02081
G3 X121.609 Y134.488 I-4.156 J6.43 E.04399
G1 X118.391 Y134.488 E.10677
G1 X118.454 Y134.432 E.00281
; WIPE_START
G1 F24000
G1 X118.782 Y134.144 E-.16578
G1 X119.437 Y133.676 E-.30589
G1 X120 Y133.4 E-.23843
G1 X120.118 Y133.458 E-.0499
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.217 J.011 P1  F30000
G1 X120.217 Y122.846 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1764
G1 X120.71 Y122.846 E.01514
G1 X120.71 Y128.28 E.16699
G1 X119.29 Y128.28 E.04363
G1 X119.29 Y122.846 E.16699
G1 X120.157 Y122.846 E.02665
M204 S10000
G1 X120.217 Y122.453 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P75 R2
G1 F1764
G1 X119.197 Y122.453 E.03386
G1 X119.174 Y121.652 E.0266
G1 X120.826 Y121.652 E.05483
G1 X120.803 Y122.453 E.0266
G1 X120.277 Y122.453 E.01745
; WIPE_START
G1 F24000
G1 X119.197 Y122.453 E-.41064
G1 X119.174 Y121.652 E-.30476
G1 X119.291 Y121.652 E-.0446
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.213 J-.102 P1  F30000
G1 X118.24 Y134.098 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1764
G1 X118.411 Y133.948 E.00698
G3 X119.234 Y133.338 I5.14 J6.078 E.0315
G1 X119.506 Y133.198 E.00939
G1 X119.476 Y132.994 E.00633
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G3 X119.349 Y132.086 I7.715 J-1.54 E.03045
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M106 S255
G1 F600
G1 X119.22 Y130.58 E.04643
M106 S252.45
M106 S255
G1 F1800
G3 X119.056 Y128.451 I31.94 J-3.526 E.06562
M106 S252.45
G1 F1764
G1 X118.882 Y125.128 E.10225
G1 X118.864 Y124.517 E.0188
G1 X118.77 Y121.26 E.10013
G1 X118.805 Y121.26 E.00106
G1 X121.195 Y121.26 E.07347
G1 X121.23 Y121.26 E.00106
G1 X121.136 Y124.517 E.10013
G1 X121.118 Y125.128 E.0188
G1 X120.944 Y128.451 E.10225
M106 S255
G1 F1800
G3 X120.78 Y130.58 I-32.104 J-1.397 E.06562
M106 S252.45
M106 S255
G1 F600
G1 X120.651 Y132.086 E.04643
M106 S252.45
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G3 X120.524 Y132.994 I-7.842 J-.632 E.03045
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1764
G1 X120.494 Y133.198 E.00633
G1 X120.766 Y133.338 E.00939
G3 X121.589 Y133.948 I-4.316 J6.688 E.0315
G1 X121.835 Y134.165 E.01007
G1 X121.849 Y134.177 E.00057
G1 X121.812 Y134.88 E.02164
G1 X121.715 Y134.88 E.00297
G1 X118.188 Y134.88 E.10839
G1 X118.151 Y134.177 E.02164
G1 X118.165 Y134.165 E.00057
G1 X118.195 Y134.138 E.00124
M204 S10000
; WIPE_START
G1 F24000
G1 X118.411 Y133.948 E-.10915
G1 X118.541 Y133.834 E-.06592
G1 X119.234 Y133.338 E-.3237
G1 X119.506 Y133.198 E-.11612
G1 X119.476 Y132.994 E-.07834
G1 X119.452 Y132.82 E-.06677
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.842 J.879 P1  F30000
G1 X120 Y132.295 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.146459
G1 F1764
G1 X120 Y132.096 E.00168
; LINE_WIDTH: 0.196445
G1 X120 Y131.774 E.00403
; LINE_WIDTH: 0.24643
G1 X120 Y131.452 E.00534
; LINE_WIDTH: 0.296416
G1 X120 Y131.13 E.00665
; LINE_WIDTH: 0.346401
G1 X120 Y130.808 E.00796
; LINE_WIDTH: 0.396387
G1 X120 Y130.486 E.00928
; LINE_WIDTH: 0.446372
G1 X120 Y130.164 E.01059
; LINE_WIDTH: 0.496358
G1 X120 Y129.842 E.0119
; LINE_WIDTH: 0.546343
G1 X120 Y129.52 E.01321
; LINE_WIDTH: 0.596329
G1 X120 Y129.198 E.01452
; LINE_WIDTH: 0.646314
G1 X120 Y128.876 E.01583
; WIPE_START
G1 F24000
G1 X120 Y129.198 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.199 J.209 P1  F30000
G1 X120.933 Y123.845 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.12942
G1 F1764
G1 X120.95 Y122.649 E.00843
G1 X120.611 Y122.053 F30000
; LINE_WIDTH: 0.437508
G1 F1764
G1 X119.389 Y122.053 E.03931
G1 X119.05 Y122.649 F30000
; LINE_WIDTH: 0.0969193
G1 F1764
G1 X119.067 Y123.845 E.00526
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.05 Y122.649 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/25
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
G3 Z1.6 I-1.215 J-.064 P1  F30000
G1 X117.508 Y151.758 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1825
G1 X118.17 Y151.179 E.02919
G1 X118.72 Y150.782 E.02249
G1 X118.571 Y149.047 E.05774
G1 X118.415 Y146.082 E.09851
G1 X119.771 Y146.082 E.04498
G1 X119.615 Y149.047 E.09851
G1 X119.466 Y150.782 E.05774
G3 X120.305 Y151.441 I-2.551 J4.109 E.03548
G1 X120.839 Y151.898 E.0233
G1 X117.347 Y151.898 E.11584
G1 X117.463 Y151.797 E.00509
; WIPE_START
G1 F24000
G1 X118.17 Y151.179 E-.35715
G1 X118.72 Y150.782 E-.25769
G1 X118.688 Y150.401 E-.14516
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.215 J.07 P1  F30000
G1 X119.272 Y140.255 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1825
G1 X119.803 Y140.255 E.01633
G1 X119.803 Y145.69 E.16699
G1 X118.383 Y145.69 E.04363
G1 X118.383 Y140.255 E.16699
G1 X119.212 Y140.255 E.02546
M204 S10000
; WIPE_START
G1 F24000
G1 X119.803 Y140.255 E-.22472
G1 X119.803 Y141.664 E-.53528
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.917 J-.8 P1  F30000
G1 X118.231 Y139.863 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1825
G1 X118.223 Y139.061 E.02659
G1 X119.963 Y139.061 E.05771
G1 X119.956 Y139.863 E.02659
G1 X118.291 Y139.863 E.05523
; WIPE_START
G1 F24000
G1 X118.223 Y139.061 E-.30571
G1 X119.419 Y139.061 E-.45429
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.199 J-.21 P1  F30000
G1 X117.25 Y151.463 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1825
G1 X117.934 Y150.879 E.02763
G3 X118.311 Y150.594 I7.854 J9.988 E.01451
G1 X118.306 Y150.545 E.00149
M106 S255
G1 F1800
G3 X118.15 Y148.495 I30.761 J-3.385 E.06319
M106 S252.45
G1 F1825
G1 X117.975 Y145.172 E.10225
G1 X117.957 Y144.561 E.0188
G1 X117.847 Y140.736 E.11756
G1 X117.83 Y138.973 E.05418
G1 X117.828 Y138.669 E.00934
G1 X120.359 Y138.669 E.07777
G1 X120.356 Y138.973 E.00934
G1 X120.34 Y140.736 E.05418
G1 X120.229 Y144.561 E.11756
G1 X120.212 Y145.172 E.0188
G1 X120.037 Y148.495 E.10225
M106 S255
G1 F1800
G3 X119.88 Y150.545 I-30.918 J-1.335 E.06319
M106 S252.45
G1 F1825
G1 X119.876 Y150.594 E.00149
G3 X120.569 Y151.151 I-2.472 J3.785 E.02736
G1 X121.081 Y151.589 E.02069
G1 X121.044 Y152.29 E.02159
G1 X120.947 Y152.29 E.00297
G1 X117.239 Y152.29 E.11393
G1 X117.143 Y152.29 E.00297
M73 P76 R2
G1 X117.106 Y151.589 E.02159
G1 X117.12 Y151.577 E.00056
G1 X117.205 Y151.502 E.00348
M204 S10000
G1 X117.905 Y151.695 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.161774
G1 F1825
G1 X118.5 Y151.465 E.00617
G1 X118.985 Y151.434 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.56408
G1 F1825
G1 X119.137 Y151.43 E.00645
G1 X119.687 Y151.465 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.159136
G1 F1825
G1 X120.281 Y151.695 E.00604
G1 X119.259 Y150.817 F30000
; LINE_WIDTH: 0.316008
G1 F1825
G1 X119.204 Y150.737 E.00216
; LINE_WIDTH: 0.364981
G1 X119.148 Y150.658 E.00254
; LINE_WIDTH: 0.413954
G1 X119.093 Y150.578 E.00293
; LINE_WIDTH: 0.460078
G1 X119.093 Y150.239 E.01151
; LINE_WIDTH: 0.5062
G1 X119.093 Y149.9 E.01279
; LINE_WIDTH: 0.552324
G1 X119.093 Y149.562 E.01406
; LINE_WIDTH: 0.598446
G1 X119.093 Y149.223 E.01533
G1 X118.862 Y146.505 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.482598
G1 F1825
G1 X118.874 Y146.737 E.0083
G1 X118.891 Y147.388 E.02335
; LINE_WIDTH: 0.448351
G1 X118.908 Y148.04 E.02153
; LINE_WIDTH: 0.397144
G2 X118.933 Y148.851 I15.447 J-.079 E.02343
G1 X119.253 Y148.851 E.00923
G1 X119.261 Y148.691 E.00461
; LINE_WIDTH: 0.379855
G1 X119.279 Y148.04 E.0179
; LINE_WIDTH: 0.414103
G1 X119.296 Y147.388 E.01972
; LINE_WIDTH: 0.465252
G3 X119.325 Y146.505 I16.815 J.115 E.03041
G1 X118.922 Y146.505 E.01388
; WIPE_START
G1 F24000
G1 X119.325 Y146.505 E-.23824
G1 X119.296 Y147.388 E-.52176
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.158 J-.376 P1  F30000
G1 X118.161 Y143.889 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969193
G1 F1825
G1 X118.138 Y142.31 E.00695
; LINE_WIDTH: 0.142118
G1 X118.115 Y140.731 E.01276
; LINE_WIDTH: 0.187318
G1 X118.112 Y140.059 E.00791
G1 X118.431 Y139.462 F30000
; LINE_WIDTH: 0.437508
G1 F1825
G1 X119.756 Y139.462 E.04261
G1 X120.075 Y140.059 F30000
; LINE_WIDTH: 0.19284
G1 F1825
G1 X120.071 Y140.731 E.00821
; LINE_WIDTH: 0.187318
G1 X120.049 Y142.31 E.01858
; LINE_WIDTH: 0.142119
G1 X120.026 Y143.889 E.01276
; WIPE_START
G1 F24000
G1 X120.049 Y142.31 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.036 J.639 P1  F30000
G1 X125.656 Y133.219 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1825
G1 X125.656 Y132.839 E.01168
G1 X132.636 Y132.839 E.21448
G1 X132.636 Y133.219 E.01168
G1 X125.716 Y133.219 E.21263
M204 S10000
; WIPE_START
G1 F24000
G1 X125.656 Y132.839 E-.14619
G1 X127.272 Y132.839 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.112 J-.493 P1  F30000
G1 X125.21 Y128.19 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
G1 F1825
G1 X125.21 Y127.81 E.01168
G1 X132.19 Y127.81 E.21448
G1 X132.19 Y128.19 E.01168
G1 X125.27 Y128.19 E.21263
M204 S10000
; WIPE_START
G1 F24000
G1 X125.21 Y127.81 E-.14619
G1 X126.825 Y127.81 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.746 J-.962 P1  F30000
G1 X118.415 Y134.333 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1825
G1 X119.077 Y133.754 E.02919
G1 X119.627 Y133.357 E.02249
G1 X119.478 Y131.622 E.05774
G1 X119.322 Y128.657 E.09851
G1 X120.678 Y128.657 E.04498
G1 X120.522 Y131.622 E.09851
G1 X120.373 Y133.357 E.05774
G3 X121.212 Y134.016 I-2.551 J4.109 E.03548
G1 X121.746 Y134.473 E.0233
G1 X118.254 Y134.473 E.11584
G1 X118.37 Y134.372 E.00509
; WIPE_START
G1 F24000
G1 X119.077 Y133.754 E-.35715
G1 X119.627 Y133.357 E-.25769
G1 X119.594 Y132.976 E-.14516
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.215 J.07 P1  F30000
G1 X120.179 Y122.83 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1825
G1 X120.71 Y122.83 E.01633
G1 X120.71 Y128.265 E.16699
G1 X119.29 Y128.265 E.04363
G1 X119.29 Y122.83 E.16699
G1 X120.119 Y122.83 E.02546
M204 S10000
; WIPE_START
G1 F24000
G1 X120.71 Y122.83 E-.22472
G1 X120.71 Y124.239 E-.53528
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.917 J-.8 P1  F30000
G1 X119.138 Y122.438 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1825
G1 X119.13 Y121.637 E.02659
G1 X120.87 Y121.637 E.05771
G1 X120.862 Y122.438 E.02659
G1 X119.198 Y122.438 E.05523
; WIPE_START
G1 F24000
G1 X119.13 Y121.637 E-.30571
G1 X120.326 Y121.637 E-.45429
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.199 J-.21 P1  F30000
G1 X118.157 Y134.038 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1825
G1 X118.841 Y133.454 E.02763
G3 X119.217 Y133.169 I7.854 J9.988 E.01451
G1 X119.213 Y133.12 E.00149
M106 S255
G1 F1800
G3 X119.056 Y131.07 I30.761 J-3.385 E.06319
M106 S252.45
G1 F1825
G1 X118.882 Y127.747 E.10225
G1 X118.864 Y127.136 E.0188
G1 X118.754 Y123.312 E.11756
G1 X118.737 Y121.548 E.05418
G1 X118.734 Y121.244 E.00934
G1 X121.266 Y121.244 E.07777
G1 X121.263 Y121.548 E.00934
G1 X121.246 Y123.312 E.05418
G1 X121.136 Y127.136 E.11756
G1 X121.118 Y127.747 E.0188
G1 X120.944 Y131.07 E.10225
M106 S255
G1 F1800
G3 X120.787 Y133.12 I-30.918 J-1.335 E.06319
M106 S252.45
G1 F1825
G1 X120.783 Y133.169 E.00149
G3 X121.476 Y133.726 I-2.472 J3.785 E.02736
G1 X121.987 Y134.164 E.02069
G1 X121.95 Y134.865 E.02159
G1 X121.854 Y134.865 E.00297
G1 X118.146 Y134.865 E.11393
G1 X118.05 Y134.865 E.00297
G1 X118.013 Y134.164 E.02159
G1 X118.027 Y134.152 E.00056
M73 P77 R2
G1 X118.112 Y134.077 E.00348
M204 S10000
G1 X118.812 Y134.27 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.161774
G1 F1825
G1 X119.407 Y134.04 E.00617
G1 X119.892 Y134.009 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.56408
G1 F1825
G1 X120.044 Y134.005 E.00645
G1 X120.593 Y134.04 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.159136
G1 F1825
G1 X121.188 Y134.27 E.00604
G1 X120.166 Y133.392 F30000
; LINE_WIDTH: 0.316008
G1 F1825
G1 X120.11 Y133.312 E.00216
; LINE_WIDTH: 0.364981
G1 X120.055 Y133.233 E.00254
; LINE_WIDTH: 0.413954
G1 X120 Y133.153 E.00293
; LINE_WIDTH: 0.460078
G1 X120 Y132.814 E.01151
; LINE_WIDTH: 0.5062
G1 X120 Y132.476 E.01279
; LINE_WIDTH: 0.552324
G1 X120 Y132.137 E.01406
; LINE_WIDTH: 0.598446
G1 X120 Y131.798 E.01533
G1 X119.768 Y129.08 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.482598
G1 F1825
G1 X119.78 Y129.312 E.0083
G1 X119.798 Y129.963 E.02335
; LINE_WIDTH: 0.448351
G1 X119.815 Y130.615 E.02153
; LINE_WIDTH: 0.397144
G2 X119.84 Y131.426 I15.447 J-.079 E.02343
G1 X120.16 Y131.426 E.00923
G1 X120.168 Y131.266 E.00461
; LINE_WIDTH: 0.379855
G1 X120.185 Y130.615 E.0179
; LINE_WIDTH: 0.414103
G1 X120.202 Y129.963 E.01972
; LINE_WIDTH: 0.465252
G3 X120.232 Y129.08 I16.815 J.115 E.03041
G1 X119.828 Y129.08 E.01388
; WIPE_START
G1 F24000
G1 X120.232 Y129.08 E-.23824
G1 X120.202 Y129.963 E-.52176
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.158 J-.376 P1  F30000
G1 X119.067 Y126.464 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969193
G1 F1825
G1 X119.045 Y124.885 E.00695
; LINE_WIDTH: 0.142118
G1 X119.022 Y123.306 E.01276
; LINE_WIDTH: 0.187318
G1 X119.019 Y122.634 E.00791
G1 X119.337 Y122.037 F30000
; LINE_WIDTH: 0.437508
G1 F1825
G1 X120.663 Y122.037 E.04261
G1 X120.981 Y122.634 F30000
; LINE_WIDTH: 0.19284
G1 F1825
G1 X120.978 Y123.306 E.00821
; LINE_WIDTH: 0.187318
G1 X120.955 Y124.885 E.01858
; LINE_WIDTH: 0.142119
G1 X120.933 Y126.464 E.01276
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.955 Y124.885 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/25
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
G3 Z1.8 I-1.212 J-.115 P1  F30000
G1 X118.517 Y150.643 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1909
G1 X118.367 Y147.775 E.09527
G3 X118.317 Y146.067 I98.914 J-3.711 E.0567
G1 X119.869 Y146.067 E.05148
G1 X119.82 Y147.775 E.0567
G1 X119.664 Y150.742 E.09855
G2 X120.957 Y151.883 I111.47 J-125.014 E.05719
G1 X117.23 Y151.883 E.12363
G2 X118.523 Y150.742 I-110.107 J-126.076 E.05719
G1 X118.521 Y150.703 E.00129
; WIPE_START
G1 F24000
G1 X118.416 Y148.706 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.211 J.117 P1  F30000
G1 X119.232 Y140.24 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1909
G1 X119.803 Y140.24 E.01756
G1 X119.803 Y145.674 E.16699
G1 X118.383 Y145.674 E.04363
G1 X118.383 Y140.24 E.16699
G1 X119.172 Y140.24 E.02423
M204 S10000
G1 X119.232 Y139.848 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1909
G1 X118.206 Y139.848 E.03401
G1 X118.199 Y139.046 E.02659
G1 X119.986 Y139.046 E.05929
G1 X119.979 Y139.848 E.02659
G1 X119.292 Y139.848 E.02281
; WIPE_START
G1 F24000
G1 X118.206 Y139.848 E-.41239
G1 X118.199 Y139.046 E-.30465
G1 X118.312 Y139.046 E-.04297
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.217 J-.03 P1  F30000
G1 X118.022 Y150.655 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1909
G1 X118.055 Y150.627 E.00136
G1 X118.121 Y150.57 E.00266
G1 X117.957 Y147.18 E.1043
G1 X117.847 Y143.355 E.11756
G1 X117.83 Y141.592 E.05418
G1 X117.803 Y138.654 E.09029
G1 X120.382 Y138.654 E.07924
G1 X120.355 Y141.612 E.09088
G1 X120.34 Y143.355 E.05358
G1 X120.229 Y147.18 E.11756
G1 X120.066 Y150.57 E.1043
G1 X120.131 Y150.627 E.00266
G2 X121.024 Y151.425 I51.576 J-56.775 E.03681
G1 X121.164 Y151.565 E.00609
G1 X121.144 Y152.275 E.02181
G1 X121.086 Y152.275 E.00179
G1 X117.101 Y152.275 E.12244
G1 X117.043 Y152.275 E.00179
G1 X117.022 Y151.565 E.02181
G2 X117.83 Y150.82 I-149.042 J-162.354 E.03378
G1 X117.976 Y150.694 E.00592
M204 S10000
; WIPE_START
G1 F24000
G1 X118.055 Y150.627 E-.03956
G1 X118.121 Y150.57 E-.03292
G1 X118.034 Y148.763 E-.68752
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.166 J.348 P1  F30000
G1 X118.721 Y146.459 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1909
G1 X118.743 Y147.219 E.02338
G1 X118.772 Y147.397 E.00554
; LINE_WIDTH: 0.46883
G1 X118.802 Y147.575 E.00626
; LINE_WIDTH: 0.519283
G3 X118.832 Y147.759 I-.724 J.212 E.00726
; LINE_WIDTH: 0.566491
G1 X118.852 Y148.524 E.03266
; LINE_WIDTH: 0.526274
G1 X118.872 Y149.29 E.03015
; LINE_WIDTH: 0.486057
G1 X118.892 Y150.055 E.02764
; LINE_WIDTH: 0.44584
G1 X118.912 Y150.82 E.02513
; LINE_WIDTH: 0.405623
G1 X118.907 Y150.886 E.00195
; LINE_WIDTH: 0.452081
G1 X118.902 Y150.952 E.0022
; LINE_WIDTH: 0.543828
G1 X118.897 Y151.018 E.0027
G1 X118.432 Y151.428 E.02532
G1 X119.755 Y151.428 E.05398
G1 X119.289 Y151.018 E.02532
; LINE_WIDTH: 0.544996
G1 X119.284 Y150.952 E.0027
; LINE_WIDTH: 0.498539
G1 X119.279 Y150.886 E.00245
; LINE_WIDTH: 0.452081
G1 X119.274 Y150.82 E.0022
; LINE_WIDTH: 0.405623
G1 X119.294 Y150.055 E.02262
; LINE_WIDTH: 0.445841
G1 X119.315 Y149.29 E.02513
; LINE_WIDTH: 0.486058
G1 X119.335 Y148.524 E.02764
; LINE_WIDTH: 0.526275
G1 X119.355 Y147.759 E.03015
; LINE_WIDTH: 0.566492
G1 X119.384 Y147.579 E.00778
; LINE_WIDTH: 0.517661
G1 X119.414 Y147.399 E.00706
; LINE_WIDTH: 0.42547
G1 X119.444 Y147.219 E.00569
G1 X119.466 Y146.459 E.02372
G1 X118.781 Y146.459 E.02134
G1 X119.093 Y146.82 F30000
; LINE_WIDTH: 0.38932
G1 F1909
G1 X119.093 Y147.149 E.00928
G1 X118.151 Y145.871 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115599
G1 F1909
G1 X118.133 Y144.61 E.00746
; LINE_WIDTH: 0.151458
G1 X118.115 Y143.35 E.01115
; LINE_WIDTH: 0.187318
G1 X118.1 Y140.044 E.0389
G1 X118.406 Y139.447 F30000
; LINE_WIDTH: 0.437508
G1 F1909
G1 X119.779 Y139.447 E.04415
G1 X120.086 Y140.044 F30000
; LINE_WIDTH: 0.216377
G1 F1909
G1 X120.071 Y143.35 E.04673
; LINE_WIDTH: 0.187315
G1 X120.053 Y144.61 E.01483
; LINE_WIDTH: 0.151457
G1 X120.035 Y145.871 E.01115
; WIPE_START
G1 F24000
G1 X120.053 Y144.61 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.092 J.537 P1  F30000
G1 X125.656 Y133.219 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1909
M73 P78 R2
G1 X125.656 Y132.839 E.01168
G1 X132.236 Y132.839 E.20219
G1 X132.236 Y133.219 E.01168
G1 X125.716 Y133.219 E.20034
M204 S10000
; WIPE_START
G1 F24000
G1 X125.656 Y132.839 E-.14619
G1 X127.272 Y132.839 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.112 J-.493 P1  F30000
G1 X125.21 Y128.19 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
G1 F1909
G1 X125.21 Y127.81 E.01168
G1 X131.79 Y127.81 E.20219
G1 X131.79 Y128.19 E.01168
G1 X125.27 Y128.19 E.20034
M204 S10000
; WIPE_START
G1 F24000
G1 X125.21 Y127.81 E-.14619
G1 X126.825 Y127.81 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.718 J-.983 P1  F30000
G1 X119.424 Y133.218 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1909
G1 X119.273 Y130.35 E.09527
G3 X119.224 Y128.642 I98.914 J-3.711 E.0567
G1 X120.776 Y128.642 E.05148
G1 X120.727 Y130.35 E.0567
G1 X120.571 Y133.317 E.09855
G2 X121.863 Y134.458 I111.47 J-125.014 E.05719
G1 X118.137 Y134.458 E.12363
G2 X119.429 Y133.317 I-110.107 J-126.076 E.05719
G1 X119.427 Y133.278 E.00129
; WIPE_START
G1 F24000
G1 X119.322 Y131.281 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.211 J.117 P1  F30000
G1 X120.138 Y122.815 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1909
G1 X120.71 Y122.815 E.01756
G1 X120.71 Y128.25 E.16699
G1 X119.29 Y128.25 E.04363
G1 X119.29 Y122.815 E.16699
G1 X120.078 Y122.815 E.02423
M204 S10000
G1 X120.138 Y122.423 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1909
G1 X119.113 Y122.423 E.03401
G1 X119.106 Y121.621 E.02659
G1 X120.893 Y121.621 E.05929
G1 X120.886 Y122.423 E.02659
G1 X120.198 Y122.423 E.02281
; WIPE_START
G1 F24000
G1 X119.113 Y122.423 E-.41239
G1 X119.106 Y121.621 E-.30465
G1 X119.219 Y121.621 E-.04297
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.217 J-.03 P1  F30000
G1 X118.929 Y133.23 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1909
G1 X118.962 Y133.202 E.00136
G1 X119.028 Y133.145 E.00266
G1 X118.864 Y129.755 E.1043
G1 X118.754 Y125.93 E.11756
G1 X118.737 Y124.167 E.05418
G1 X118.71 Y121.229 E.09029
G1 X121.289 Y121.229 E.07924
G1 X121.262 Y124.187 E.09088
G1 X121.246 Y125.93 E.05358
G1 X121.136 Y129.755 E.11756
G1 X120.972 Y133.145 E.1043
G1 X121.038 Y133.202 E.00266
G2 X121.931 Y134 I51.576 J-56.775 E.03681
G1 X122.071 Y134.14 E.00609
G1 X122.051 Y134.85 E.02181
G1 X121.992 Y134.85 E.00179
G1 X118.008 Y134.85 E.12244
G1 X117.949 Y134.85 E.00179
G1 X117.929 Y134.14 E.02181
G2 X118.737 Y133.395 I-149.042 J-162.354 E.03378
G1 X118.883 Y133.269 E.00592
M204 S10000
; WIPE_START
G1 F24000
G1 X118.962 Y133.202 E-.03956
G1 X119.028 Y133.145 E-.03292
G1 X118.94 Y131.338 E-.68752
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.166 J.348 P1  F30000
G1 X119.628 Y129.034 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1909
G1 X119.65 Y129.794 E.02338
G1 X119.679 Y129.972 E.00554
; LINE_WIDTH: 0.46883
G1 X119.709 Y130.15 E.00626
; LINE_WIDTH: 0.519283
G3 X119.739 Y130.334 I-.724 J.212 E.00726
; LINE_WIDTH: 0.566491
G1 X119.759 Y131.1 E.03266
; LINE_WIDTH: 0.526274
G1 X119.779 Y131.865 E.03015
; LINE_WIDTH: 0.486057
G1 X119.799 Y132.63 E.02764
; LINE_WIDTH: 0.44584
G1 X119.819 Y133.395 E.02513
; LINE_WIDTH: 0.405623
G1 X119.814 Y133.461 E.00195
; LINE_WIDTH: 0.452081
G1 X119.809 Y133.527 E.0022
; LINE_WIDTH: 0.543828
G1 X119.804 Y133.593 E.0027
G1 X119.339 Y134.003 E.02532
G1 X120.661 Y134.003 E.05398
G1 X120.196 Y133.593 E.02532
; LINE_WIDTH: 0.544996
G1 X120.191 Y133.527 E.0027
; LINE_WIDTH: 0.498539
G1 X120.186 Y133.461 E.00245
; LINE_WIDTH: 0.452081
G1 X120.181 Y133.395 E.0022
; LINE_WIDTH: 0.405623
G1 X120.201 Y132.63 E.02262
; LINE_WIDTH: 0.445841
G1 X120.221 Y131.865 E.02513
; LINE_WIDTH: 0.486058
G1 X120.241 Y131.1 E.02764
; LINE_WIDTH: 0.526275
G1 X120.261 Y130.334 E.03015
; LINE_WIDTH: 0.566492
G1 X120.291 Y130.154 E.00778
; LINE_WIDTH: 0.517661
G1 X120.321 Y129.974 E.00706
; LINE_WIDTH: 0.42547
G1 X120.35 Y129.794 E.00569
G1 X120.372 Y129.034 E.02372
G1 X119.688 Y129.034 E.02134
G1 X120 Y129.395 F30000
; LINE_WIDTH: 0.38932
G1 F1909
G1 X120 Y129.724 E.00928
G1 X119.058 Y128.446 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.115599
G1 F1909
G1 X119.04 Y127.185 E.00746
; LINE_WIDTH: 0.151458
G1 X119.022 Y125.925 E.01115
; LINE_WIDTH: 0.187318
G1 X119.006 Y122.619 E.0389
G1 X119.313 Y122.022 F30000
; LINE_WIDTH: 0.437508
G1 F1909
G1 X120.686 Y122.022 E.04415
G1 X120.993 Y122.619 F30000
; LINE_WIDTH: 0.216377
G1 F1909
G1 X120.978 Y125.925 E.04673
; LINE_WIDTH: 0.187315
G1 X120.96 Y127.185 E.01483
; LINE_WIDTH: 0.151457
G1 X120.942 Y128.446 E.01115
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.96 Y127.185 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/25
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
G3 Z2 I-1.206 J-.164 P1  F30000
G1 X119.191 Y140.225 Z2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1918
G1 X119.803 Y140.225 E.01882
G1 X119.803 Y145.659 E.16699
G1 X118.383 Y145.659 E.04363
G1 X118.383 Y140.225 E.16699
G1 X119.131 Y140.225 E.02297
M204 S10000
G1 X119.191 Y139.833 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1918
G1 X118.209 Y139.833 E.03258
G1 X118.216 Y139.031 E.02659
G1 X119.97 Y139.031 E.0582
G1 X119.978 Y139.833 E.02659
G1 X119.251 Y139.833 E.02412
; WIPE_START
G1 F24000
G1 X118.209 Y139.833 E-.39603
G1 X118.216 Y139.031 E-.30465
G1 X118.372 Y139.031 E-.05933
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.217 J0 P1  F30000
G1 X118.374 Y150.597 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F1918
G1 X118.241 Y146.051 E.15085
G1 X119.945 Y146.051 E.05652
G1 X119.81 Y150.712 E.15465
G1 X120.537 Y151.411 E.03349
G3 X121.003 Y151.868 I-2.618 J3.139 E.02166
G1 X117.183 Y151.868 E.12672
G3 X118.377 Y150.712 I34.926 J34.872 E.05513
G1 X118.375 Y150.657 E.00182
G1 X117.854 Y150.671 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1918
M73 P79 R2
G1 X117.98 Y150.549 E.00538
G1 X117.979 Y150.53 E.00061
G1 X117.959 Y149.836 E.02131
G1 X117.847 Y145.974 E.11872
G1 X117.83 Y144.211 E.05418
G3 X117.828 Y138.639 I150.661 J-2.867 E.17123
G1 X120.359 Y138.639 E.07778
G1 X120.376 Y140.468 E.05621
G3 X120.356 Y144.211 I-101.217 J1.334 E.11503
G1 X120.34 Y145.974 E.05418
G1 X120.227 Y149.836 E.11872
G1 X120.207 Y150.53 E.02131
G1 X120.207 Y150.549 E.00061
G3 X121.24 Y151.55 I-29.24 J31.24 E.04422
G1 X121.22 Y152.26 E.02181
G1 X121.185 Y152.26 E.00106
G1 X117.001 Y152.26 E.12856
G1 X116.967 Y152.26 E.00106
G1 X116.946 Y151.55 E.02181
G1 X117.811 Y150.713 E.03699
M204 S10000
; WIPE_START
G1 F24000
G1 X117.98 Y150.549 E-.08938
G1 X117.979 Y150.53 E-.00749
G1 X117.959 Y149.836 E-.26353
G1 X117.929 Y148.785 E-.3996
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.164 J.356 P1  F30000
G1 X118.645 Y146.443 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1918
G1 X118.771 Y150.79 E.13361
G1 X118.714 Y150.931 E.00467
G1 X118.152 Y151.475 E.02406
G1 X120.035 Y151.475 E.05786
G1 X119.472 Y150.931 E.02406
G1 X119.415 Y150.79 E.00467
G1 X119.542 Y146.443 E.13361
G1 X118.705 Y146.443 E.02571
G1 X119.093 Y146.879 F30000
; LINE_WIDTH: 0.536706
G1 F1918
G1 X119.093 Y147.659 E.0314
; LINE_WIDTH: 0.491296
G1 X119.093 Y148.439 E.02851
; LINE_WIDTH: 0.445886
G1 X119.093 Y149.22 E.02562
; LINE_WIDTH: 0.400475
G1 X119.093 Y150 E.02274
; LINE_WIDTH: 0.355065
G1 X119.093 Y150.78 E.01985
; LINE_WIDTH: 0.309654
G1 X119.093 Y150.86 E.00173
; LINE_WIDTH: 0.358817
G1 X119.093 Y150.94 E.00205
; LINE_WIDTH: 0.40798
G1 X119.093 Y151.02 E.00237
G1 X120.072 Y145.855 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.229017
G1 F1918
G2 X120.09 Y140.471 I-291.204 J-3.642 E.08166
G1 X120.088 Y140.029 E.0067
G1 X119.771 Y139.432 F30000
; LINE_WIDTH: 0.437506
G1 F1918
G1 X118.416 Y139.432 E.04356
G1 X118.099 Y140.029 F30000
; LINE_WIDTH: 0.197902
G1 F1918
G2 X118.114 Y145.855 I315.06 J2.074 E.07359
; WIPE_START
G1 F24000
G1 X118.109 Y143.855 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.993 J.704 P1  F30000
G1 X125.656 Y133.219 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1918
G1 X125.656 Y132.839 E.01168
G1 X131.836 Y132.839 E.18989
G1 X131.836 Y133.219 E.01168
G1 X125.716 Y133.219 E.18805
M204 S10000
; WIPE_START
G1 F24000
G1 X125.656 Y132.839 E-.14619
G1 X127.272 Y132.839 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.112 J-.493 P1  F30000
G1 X125.21 Y128.19 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F1918
G1 X125.21 Y127.81 E.01168
G1 X131.39 Y127.81 E.18989
G1 X131.39 Y128.19 E.01168
G1 X125.27 Y128.19 E.18805
M204 S10000
; WIPE_START
G1 F24000
G1 X125.21 Y127.81 E-.14619
G1 X126.825 Y127.81 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.727 J-.976 P1  F30000
G1 X120.098 Y122.8 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F1918
G1 X120.71 Y122.8 E.01882
G1 X120.71 Y128.234 E.16699
G1 X119.29 Y128.234 E.04363
G1 X119.29 Y122.8 E.16699
G1 X120.038 Y122.8 E.02297
M204 S10000
G1 X120.098 Y122.408 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1918
G1 X119.115 Y122.408 E.03258
G1 X119.123 Y121.606 E.02659
G1 X120.877 Y121.606 E.0582
G1 X120.885 Y122.408 E.02659
G1 X120.158 Y122.408 E.02412
; WIPE_START
G1 F24000
G1 X119.115 Y122.408 E-.39603
G1 X119.123 Y121.606 E-.30465
G1 X119.279 Y121.606 E-.05933
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.217 J0 P1  F30000
G1 X119.28 Y133.172 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F1918
G1 X119.148 Y128.626 E.15085
G1 X120.852 Y128.626 E.05652
G1 X120.716 Y133.287 E.15465
G1 X121.444 Y133.986 E.03349
G3 X121.91 Y134.443 I-2.618 J3.139 E.02166
G1 X118.09 Y134.443 E.12672
G3 X119.284 Y133.287 I34.926 J34.872 E.05513
G1 X119.282 Y133.232 E.00182
G1 X118.761 Y133.246 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1918
G1 X118.887 Y133.124 E.00538
G1 X118.886 Y133.105 E.00061
G1 X118.866 Y132.411 E.02131
G1 X118.754 Y128.549 E.11872
G1 X118.737 Y126.786 E.05418
G3 X118.734 Y121.214 I150.661 J-2.867 E.17123
G1 X121.266 Y121.214 E.07778
G1 X121.283 Y123.043 E.05621
G3 X121.263 Y126.786 I-101.217 J1.334 E.11503
G1 X121.246 Y128.549 E.05418
G1 X121.134 Y132.411 E.11872
M73 P79 R1
G1 X121.114 Y133.105 E.02131
G1 X121.113 Y133.124 E.00061
G3 X122.147 Y134.125 I-29.24 J31.24 E.04422
G1 X122.127 Y134.835 E.02181
G1 X122.092 Y134.835 E.00106
G1 X117.908 Y134.835 E.12856
M73 P80 R1
G1 X117.873 Y134.835 E.00106
G1 X117.853 Y134.125 E.02181
G1 X118.718 Y133.288 E.03699
M204 S10000
; WIPE_START
G1 F24000
G1 X118.887 Y133.124 E-.08938
G1 X118.886 Y133.105 E-.00749
G1 X118.866 Y132.411 E-.26353
G1 X118.835 Y131.36 E-.3996
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.164 J.356 P1  F30000
G1 X119.552 Y129.018 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1918
G1 X119.678 Y133.365 E.13361
G1 X119.621 Y133.506 E.00467
G1 X119.058 Y134.05 E.02406
G1 X120.942 Y134.05 E.05786
G1 X120.379 Y133.506 E.02406
G1 X120.322 Y133.365 E.00467
G1 X120.448 Y129.018 E.13361
G1 X119.612 Y129.018 E.02571
G1 X120 Y129.454 F30000
; LINE_WIDTH: 0.536706
G1 F1918
G1 X120 Y130.234 E.0314
; LINE_WIDTH: 0.491296
G1 X120 Y131.015 E.02851
; LINE_WIDTH: 0.445886
G1 X120 Y131.795 E.02562
; LINE_WIDTH: 0.400475
G1 X120 Y132.575 E.02274
; LINE_WIDTH: 0.355065
G1 X120 Y133.355 E.01985
; LINE_WIDTH: 0.309654
G1 X120 Y133.435 E.00173
; LINE_WIDTH: 0.358817
G1 X120 Y133.515 E.00205
; LINE_WIDTH: 0.40798
G1 X120 Y133.595 E.00237
G1 X120.979 Y128.43 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.229017
G1 F1918
G2 X120.996 Y123.046 I-291.204 J-3.642 E.08166
G1 X120.994 Y122.604 E.0067
G1 X120.677 Y122.007 F30000
; LINE_WIDTH: 0.437506
G1 F1918
G1 X119.323 Y122.007 E.04356
G1 X119.006 Y122.604 F30000
; LINE_WIDTH: 0.197902
G1 F1918
G2 X119.021 Y128.43 I315.06 J2.074 E.07359
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.016 Y126.43 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/25
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
G3 Z2.2 I-1.216 J-.036 P1  F30000
G1 X118.296 Y150.579 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X118.239 Y148.586 E.06614
G3 X118.215 Y146.036 I118.842 J-2.374 E.08458
G1 X119.971 Y146.036 E.05825
G1 X119.948 Y148.586 E.08458
G1 X119.887 Y150.7 E.07017
G3 X121.072 Y151.852 I-143.792 J149.181 E.05484
G1 X117.114 Y151.852 E.1313
G3 X118.3 Y150.7 I144.862 J147.909 E.05484
G1 X118.298 Y150.639 E.00204
; WIPE_START
G1 F24000
G1 X118.24 Y148.64 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.21 J.131 P1  F30000
G1 X119.15 Y140.209 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X119.803 Y140.209 E.02008
G1 X119.803 Y145.644 E.16699
G1 X118.383 Y145.644 E.04363
G1 X118.383 Y140.209 E.16699
G1 X119.09 Y140.209 E.02171
M204 S10000
G1 X119.954 Y139.817 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X118.233 Y139.817 E.05708
G3 X118.244 Y139.016 I20.424 J-.13 E.0266
G1 X119.943 Y139.016 E.05637
G1 X119.948 Y139.18 E.00546
G1 X119.953 Y139.757 E.01915
; WIPE_START
G1 F24000
G1 X118.233 Y139.817 E-.65402
G1 X118.237 Y139.538 E-.10598
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.216 J-.049 P1  F30000
G1 X117.793 Y150.643 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X117.903 Y150.536 E.00472
G3 X117.83 Y146.82 I94.618 J-3.704 E.1142
G1 X117.803 Y143.883 E.09026
G1 X117.863 Y138.624 E.16161
G1 X120.324 Y138.624 E.07562
G1 X120.383 Y143.883 E.16161
G1 X120.356 Y146.82 E.09026
G3 X120.284 Y150.536 I-94.69 J.011 E.1142
G3 X121.312 Y151.539 I-401.832 J412.906 E.04417
G3 X121.296 Y152.244 I-17.962 J-.068 E.02167
G1 X121.261 Y152.244 E.00106
G1 X116.925 Y152.244 E.13324
G1 X116.891 Y152.244 E.00106
G3 X116.874 Y151.539 I17.946 J-.773 E.02167
G1 X117.75 Y150.685 E.0376
M204 S10000
; WIPE_START
G1 F24000
G1 X117.903 Y150.536 E-.08123
G1 X117.851 Y148.75 E-.67877
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.157 J.378 P1  F30000
G1 X118.611 Y146.428 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G2 X118.694 Y150.778 I110.867 J.05 E.1337
G1 X118.637 Y150.919 E.00466
G1 X118.08 Y151.46 E.02386
G1 X120.106 Y151.46 E.06225
G1 X119.549 Y150.919 E.02386
G1 X119.492 Y150.778 E.00466
G2 X119.576 Y146.428 I-110.788 J-4.3 E.1337
G1 X118.671 Y146.428 E.02779
G1 X119.093 Y146.906 F30000
; LINE_WIDTH: 0.621496
G1 F1963
G1 X119.093 Y148.569 E.07842
; LINE_WIDTH: 0.59074
G1 X119.093 Y149.302 E.0327
; LINE_WIDTH: 0.548452
G1 X119.093 Y150.034 E.03018
; LINE_WIDTH: 0.497455
G1 X119.093 Y150.957 E.03417
G1 X120.084 Y145.84 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.225005
G1 F1963
G2 X120.075 Y140.013 I-315.078 J-2.435 E.08645
G1 X119.746 Y139.416 F30000
; LINE_WIDTH: 0.437508
G1 F1963
G1 X118.44 Y139.416 E.042
G1 X118.111 Y140.013 F30000
; LINE_WIDTH: 0.225007
G1 F1963
G2 X118.102 Y145.84 I315.07 J3.391 E.08646
; WIPE_START
G1 F24000
G1 X118.093 Y143.883 E-.7437
G1 X118.093 Y143.84 E-.0163
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.991 J.706 P1  F30000
G1 X125.656 Y133.219 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P81 R1
G1 F1963
G1 X125.656 Y132.839 E.01168
G1 X131.436 Y132.839 E.1776
G1 X131.436 Y133.219 E.01168
G1 X125.716 Y133.219 E.17576
M204 S10000
; WIPE_START
G1 F24000
G1 X125.656 Y132.839 E-.14619
G1 X127.272 Y132.839 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.112 J-.493 P1  F30000
G1 X125.21 Y128.19 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
G1 F1963
G1 X125.21 Y127.81 E.01168
G1 X130.99 Y127.81 E.1776
G1 X130.99 Y128.19 E.01168
G1 X125.27 Y128.19 E.17576
M204 S10000
; WIPE_START
G1 F24000
G1 X125.21 Y127.81 E-.14619
G1 X126.825 Y127.81 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.699 J-.996 P1  F30000
G1 X119.203 Y133.154 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X119.146 Y131.161 E.06614
G3 X119.122 Y128.611 I118.842 J-2.374 E.08458
G1 X120.878 Y128.611 E.05825
G1 X120.854 Y131.161 E.08458
G1 X120.793 Y133.275 E.07017
G3 X121.979 Y134.427 I-143.792 J149.181 E.05484
G1 X118.021 Y134.427 E.1313
G3 X119.207 Y133.275 I144.862 J147.909 E.05484
G1 X119.205 Y133.214 E.00204
; WIPE_START
G1 F24000
G1 X119.147 Y131.215 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.21 J.131 P1  F30000
G1 X120.057 Y122.784 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X120.71 Y122.784 E.02008
G1 X120.71 Y128.219 E.16699
G1 X119.29 Y128.219 E.04363
G1 X119.29 Y122.784 E.16699
G1 X119.997 Y122.784 E.02171
M204 S10000
G1 X120.86 Y122.392 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X119.14 Y122.392 E.05708
G3 X119.15 Y121.591 I20.424 J-.13 E.0266
G1 X120.85 Y121.591 E.05637
G1 X120.854 Y121.755 E.00546
G1 X120.86 Y122.332 E.01915
; WIPE_START
G1 F24000
G1 X119.14 Y122.392 E-.65402
G1 X119.143 Y122.113 E-.10598
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.216 J-.049 P1  F30000
G1 X118.7 Y133.218 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X118.81 Y133.111 E.00472
G3 X118.737 Y129.395 I94.618 J-3.704 E.1142
G1 X118.71 Y126.458 E.09026
G1 X118.769 Y121.199 E.16161
G1 X121.231 Y121.199 E.07562
G1 X121.29 Y126.458 E.16161
G1 X121.263 Y129.395 E.09026
G3 X121.19 Y133.111 I-94.69 J.011 E.1142
G3 X122.219 Y134.114 I-401.832 J412.906 E.04417
G3 X122.203 Y134.819 I-17.962 J-.068 E.02167
G1 X122.168 Y134.819 E.00106
G1 X117.832 Y134.819 E.13324
G1 X117.797 Y134.819 E.00106
G3 X117.781 Y134.114 I17.946 J-.773 E.02167
G1 X118.657 Y133.26 E.0376
M204 S10000
; WIPE_START
G1 F24000
G1 X118.81 Y133.111 E-.08123
G1 X118.758 Y131.325 E-.67877
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.157 J.378 P1  F30000
G1 X119.518 Y129.003 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G2 X119.601 Y133.353 I110.867 J.05 E.1337
G1 X119.544 Y133.494 E.00466
G1 X118.987 Y134.035 E.02386
G1 X121.013 Y134.035 E.06225
G1 X120.456 Y133.494 E.02386
G1 X120.399 Y133.353 E.00466
G2 X120.482 Y129.003 I-110.788 J-4.3 E.1337
G1 X119.578 Y129.003 E.02779
G1 X120 Y129.481 F30000
; LINE_WIDTH: 0.621496
G1 F1963
G1 X120 Y131.144 E.07842
; LINE_WIDTH: 0.59074
G1 X120 Y131.877 E.0327
; LINE_WIDTH: 0.548452
G1 X120 Y132.609 E.03018
; LINE_WIDTH: 0.497455
G1 X120 Y133.532 E.03417
G1 X120.991 Y128.415 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.225005
G1 F1963
G2 X120.982 Y122.588 I-315.078 J-2.435 E.08645
G1 X120.653 Y121.992 F30000
; LINE_WIDTH: 0.437508
G1 F1963
G1 X119.347 Y121.992 E.042
G1 X119.018 Y122.588 F30000
; LINE_WIDTH: 0.225007
G1 F1963
G2 X119.009 Y128.415 I315.07 J3.391 E.08646
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119 Y126.458 E-.7437
G1 X119 Y126.415 E-.0163
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/25
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
G3 Z2.4 I-1.216 J-.043 P1  F30000
G1 X118.149 Y150.76 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2023
G1 X118.234 Y150.67 E.00408
G1 X118.2 Y146.021 E.15424
G1 X119.987 Y146.021 E.05927
M73 P82 R1
G1 X119.991 Y146.502 E.01596
G1 X119.953 Y150.67 E.13829
G2 X121.109 Y151.837 I12.433 J-11.166 E.0545
G1 X117.078 Y151.837 E.13372
G2 X117.578 Y151.36 I-11.277 J-12.333 E.02295
G1 X118.108 Y150.803 E.02548
; WIPE_START
G1 F24000
G1 X118.234 Y150.67 E-.06956
G1 X118.221 Y148.854 E-.69044
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.211 J.124 P1  F30000
G1 X119.11 Y140.194 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2023
G1 X119.803 Y140.194 E.02131
G1 X119.803 Y145.629 E.16699
G1 X118.383 Y145.629 E.04363
G1 X118.383 Y140.194 E.16699
G1 X119.05 Y140.194 E.02048
M204 S10000
G1 X119.11 Y139.802 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2023
G1 X118.296 Y139.802 E.02697
G1 X118.32 Y139 E.0266
G1 X119.867 Y139 E.05132
G1 X119.89 Y139.802 E.0266
G1 X119.17 Y139.802 E.0239
; WIPE_START
G1 F24000
G1 X118.296 Y139.802 E-.3318
G1 X118.32 Y139 E-.30476
G1 X118.644 Y139 E-.12344
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.213 J-.096 P1  F30000
G1 X117.721 Y150.64 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2023
G1 X117.84 Y150.515 E.0053
G1 X117.83 Y149.449 E.03277
G1 X117.803 Y146.502 E.09056
G1 X117.847 Y141.792 E.14474
G1 X117.939 Y138.608 E.09785
G1 X120.248 Y138.608 E.07095
G1 X120.34 Y141.792 E.09785
G1 X120.383 Y146.502 E.14474
G1 X120.356 Y149.449 E.09056
G1 X120.346 Y150.515 E.03277
G1 X120.557 Y150.738 E.00943
G2 X121.337 Y151.521 I20.265 J-19.392 E.03395
G1 X121.33 Y152.229 E.02177
G1 X116.856 Y152.229 E.13748
G1 X116.85 Y151.521 E.02177
G2 X117.629 Y150.738 I-19.486 J-20.175 E.03395
G1 X117.68 Y150.684 E.00228
M204 S10000
; WIPE_START
G1 F24000
G1 X117.84 Y150.515 E-.08837
G1 X117.83 Y149.449 E-.40523
G1 X117.824 Y148.748 E-.2664
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.156 J.381 P1  F30000
G1 X118.595 Y146.413 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2023
G1 X118.627 Y150.75 E.13327
G1 X118.575 Y150.881 E.00434
G1 X118.038 Y151.445 E.02391
G1 X120.148 Y151.445 E.06482
G1 X119.612 Y150.881 E.02391
G1 X119.56 Y150.749 E.00434
G1 X119.595 Y146.413 E.13326
G1 X118.655 Y146.413 E.02889
G1 X118.94 Y146.755 F30000
; LINE_WIDTH: 0.338165
G1 F2023
G3 X118.946 Y150.905 I-469.158 J2.801 E.09983
G1 X118.831 Y151.103 E.00551
G1 X119.356 Y151.103 E.01262
G1 X119.24 Y150.905 E.00551
G1 X119.232 Y150.747 E.0038
G3 X119.25 Y146.755 I517.103 J.28 E.09603
G1 X119 Y146.755 E.00602
G1 X118.096 Y145.825 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.223723
G1 F2023
G1 X118.115 Y141.797 E.05935
; LINE_WIDTH: 0.187318
G1 X118.128 Y140.897 E.01058
; LINE_WIDTH: 0.16203
G1 X118.141 Y139.998 E.00873
G1 X118.512 Y139.401 F30000
; LINE_WIDTH: 0.437508
G1 F2023
G1 X119.675 Y139.401 E.0374
G1 X120.046 Y139.998 F30000
; LINE_WIDTH: 0.161068
G1 F2023
G1 X120.058 Y140.888 E.00856
; LINE_WIDTH: 0.187316
G1 X120.071 Y141.797 E.0107
; LINE_WIDTH: 0.223724
G1 X120.09 Y145.825 E.05935
; WIPE_START
G1 F24000
G1 X120.081 Y143.825 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.077 J.566 P1  F30000
G1 X125.656 Y133.219 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2023
G1 X125.656 Y132.839 E.01168
G1 X131.036 Y132.839 E.16531
G1 X131.036 Y133.219 E.01168
G1 X125.716 Y133.219 E.16347
M204 S10000
; WIPE_START
G1 F24000
G1 X125.656 Y132.839 E-.14619
G1 X127.272 Y132.839 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.112 J-.493 P1  F30000
G1 X125.21 Y128.19 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
G1 F2023
G1 X125.21 Y127.81 E.01168
G1 X130.59 Y127.81 E.16531
G1 X130.59 Y128.19 E.01168
G1 X125.27 Y128.19 E.16347
M204 S10000
; WIPE_START
G1 F24000
G1 X125.21 Y127.81 E-.14619
G1 X126.825 Y127.81 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.705 J-.992 P1  F30000
G1 X119.056 Y133.335 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2023
G1 X119.141 Y133.246 E.00408
G1 X119.107 Y128.596 E.15424
G1 X120.893 Y128.596 E.05927
G1 X120.898 Y129.077 E.01596
G1 X120.859 Y133.246 E.13829
G2 X122.016 Y134.412 I12.433 J-11.166 E.0545
G1 X117.984 Y134.412 E.13372
G2 X118.485 Y133.935 I-11.277 J-12.333 E.02295
G1 X119.015 Y133.378 E.02548
; WIPE_START
G1 F24000
G1 X119.141 Y133.246 E-.06956
G1 X119.127 Y131.429 E-.69044
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.211 J.124 P1  F30000
G1 X120.016 Y122.769 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2023
G1 X120.71 Y122.769 E.02131
G1 X120.71 Y128.204 E.16699
M73 P83 R1
G1 X119.29 Y128.204 E.04363
G1 X119.29 Y122.769 E.16699
G1 X119.956 Y122.769 E.02048
M204 S10000
G1 X120.016 Y122.377 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2023
G1 X119.203 Y122.377 E.02697
G1 X119.226 Y121.575 E.0266
G1 X120.774 Y121.575 E.05132
G1 X120.797 Y122.377 E.0266
G1 X120.076 Y122.377 E.0239
; WIPE_START
G1 F24000
G1 X119.203 Y122.377 E-.3318
G1 X119.226 Y121.575 E-.30476
G1 X119.551 Y121.575 E-.12344
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.213 J-.096 P1  F30000
G1 X118.628 Y133.215 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2023
G1 X118.747 Y133.09 E.0053
G1 X118.737 Y132.024 E.03277
G1 X118.71 Y129.077 E.09056
G1 X118.754 Y124.367 E.14474
G1 X118.845 Y121.183 E.09785
G1 X121.155 Y121.183 E.07095
G1 X121.246 Y124.367 E.09785
G1 X121.29 Y129.077 E.14474
G1 X121.263 Y132.024 E.09056
G1 X121.253 Y133.09 E.03277
G1 X121.464 Y133.313 E.00943
G2 X122.244 Y134.096 I20.265 J-19.392 E.03395
G1 X122.237 Y134.804 E.02177
G1 X117.763 Y134.804 E.13748
G1 X117.756 Y134.096 E.02177
G2 X118.536 Y133.313 I-19.486 J-20.175 E.03395
G1 X118.587 Y133.259 E.00228
M204 S10000
; WIPE_START
G1 F24000
G1 X118.747 Y133.09 E-.08837
G1 X118.737 Y132.024 E-.40523
G1 X118.731 Y131.323 E-.2664
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.156 J.381 P1  F30000
G1 X119.502 Y128.988 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2023
G1 X119.533 Y133.325 E.13327
G1 X119.481 Y133.456 E.00434
G1 X118.945 Y134.02 E.02391
G1 X121.055 Y134.02 E.06482
G1 X120.518 Y133.456 E.02391
G1 X120.467 Y133.325 E.00434
G1 X120.502 Y128.988 E.13326
G1 X119.562 Y128.988 E.02889
G1 X119.846 Y129.33 F30000
; LINE_WIDTH: 0.338165
G1 F2023
G3 X119.853 Y133.48 I-469.158 J2.801 E.09983
G1 X119.738 Y133.678 E.00551
G1 X120.262 Y133.678 E.01262
G1 X120.147 Y133.48 E.00551
G1 X120.139 Y133.322 E.0038
G3 X120.157 Y129.33 I517.103 J.28 E.09603
G1 X119.906 Y129.33 E.00602
G1 X119.003 Y128.4 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.223723
G1 F2023
G1 X119.022 Y124.372 E.05935
; LINE_WIDTH: 0.187318
G1 X119.035 Y123.472 E.01058
; LINE_WIDTH: 0.16203
G1 X119.048 Y122.573 E.00873
G1 X119.418 Y121.976 F30000
; LINE_WIDTH: 0.437508
G1 F2023
G1 X120.582 Y121.976 E.0374
G1 X120.952 Y122.573 F30000
; LINE_WIDTH: 0.161068
G1 F2023
G1 X120.965 Y123.463 E.00856
; LINE_WIDTH: 0.187316
G1 X120.978 Y124.372 E.0107
; LINE_WIDTH: 0.223724
G1 X120.997 Y128.4 E.05935
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.988 Y126.4 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/25
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
G3 Z2.6 I-1.209 J-.139 P1  F30000
G1 X118.208 Y150.536 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1912
G1 X118.195 Y149.121 E.04694
G3 X118.224 Y146.005 I125.929 J-.393 E.10334
G1 X119.962 Y146.005 E.05766
G1 X119.991 Y149.121 E.10334
G1 X119.977 Y150.662 E.05113
G2 X120.776 Y151.471 I33.088 J-31.886 E.03773
G1 X121.123 Y151.822 E.01636
G1 X117.064 Y151.822 E.13464
G2 X117.713 Y151.165 I-25.063 J-25.408 E.03064
G1 X118.21 Y150.662 E.02344
G1 X118.209 Y150.596 E.0022
; WIPE_START
G1 F24000
G1 X118.195 Y149.121 E-.56049
G1 X118.2 Y148.596 E-.19951
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.211 J.125 P1  F30000
G1 X119.071 Y140.179 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1912
G1 X119.803 Y140.179 E.0225
G1 X119.803 Y145.613 E.16699
G1 X118.383 Y145.613 E.04363
G1 X118.383 Y140.179 E.16699
G1 X119.011 Y140.179 E.01929
M204 S10000
G1 X119.809 Y139.787 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1912
G1 X118.377 Y139.787 E.04749
G1 X118.42 Y138.985 E.02663
G1 X119.767 Y138.985 E.0447
G1 X119.8 Y139.61 E.02075
G1 X119.806 Y139.727 E.00389
; WIPE_START
G1 F24000
G1 X118.377 Y139.787 E-.54332
G1 X118.407 Y139.217 E-.21668
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.215 J-.074 P1  F30000
G1 X117.71 Y150.609 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1912
G1 X117.816 Y150.502 E.00462
G1 X117.803 Y149.121 E.04246
G3 X117.975 Y139.975 I233.077 J-.2 E.2811
G1 X118.048 Y138.593 E.04251
G1 X120.139 Y138.593 E.06426
G1 X120.191 Y139.589 E.03065
G1 X120.212 Y139.975 E.01186
G3 X120.37 Y150.502 I-267.67 J9.305 E.32355
G2 X121.051 Y151.191 I26.66 J-25.655 E.02975
G1 X121.361 Y151.505 E.01357
G1 X121.355 Y152.214 E.02177
G1 X116.832 Y152.214 E.13897
G1 X116.825 Y151.505 E.02177
G2 X117.431 Y150.892 I-22.747 J-23.077 E.02648
G1 X117.668 Y150.652 E.01037
M204 S10000
; WIPE_START
M73 P84 R1
G1 F24000
G1 X117.816 Y150.502 E-.07999
G1 X117.803 Y149.121 E-.52507
G1 X117.807 Y148.713 E-.15494
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.149 J.4 P1  F30000
G1 X118.613 Y146.398 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1912
G2 X118.602 Y150.743 I117.487 J2.448 E.13353
G1 X118.548 Y150.877 E.00445
G1 X118.002 Y151.43 E.02386
G1 X120.184 Y151.43 E.06704
G1 X119.638 Y150.877 E.02386
G1 X119.584 Y150.743 E.00445
G2 X119.574 Y146.398 I-117.497 J-1.897 E.13353
G1 X118.673 Y146.398 E.02769
G1 X119.093 Y146.883 F30000
; LINE_WIDTH: 0.653375
G1 F1912
G1 X119.093 Y150.738 E.1918
; LINE_WIDTH: 0.647488
G1 X119.093 Y150.857 E.00586
G1 X118.109 Y145.809 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.199482
G1 F1912
G1 X118.115 Y144.416 E.01778
; LINE_WIDTH: 0.187318
G1 X118.138 Y142.837 E.01858
; LINE_WIDTH: 0.142119
G1 X118.161 Y141.258 E.01276
; WIPE_START
G1 F24000
G1 X118.138 Y142.837 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.781 J.934 P1  F30000
G1 X120.026 Y141.258 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.142118
G1 F1912
G1 X120.049 Y142.837 E.01276
; LINE_WIDTH: 0.187316
G1 X120.071 Y144.416 E.01858
; LINE_WIDTH: 0.19948
G1 X120.078 Y145.809 E.01778
G1 X119.584 Y139.386 F30000
; LINE_WIDTH: 0.437508
G1 F1912
G1 X118.602 Y139.386 E.03157
; WIPE_START
G1 F24000
G1 X119.584 Y139.386 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.867 J.854 P1  F30000
G1 X125.656 Y133.219 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1912
G1 X125.656 Y132.839 E.01168
G1 X130.636 Y132.839 E.15302
G1 X130.636 Y133.219 E.01168
G1 X125.716 Y133.219 E.15118
M204 S10000
; WIPE_START
G1 F24000
G1 X125.656 Y132.839 E-.14619
G1 X127.272 Y132.839 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.112 J-.493 P1  F30000
G1 X125.21 Y128.19 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
G1 F1912
G1 X125.21 Y127.81 E.01168
G1 X130.19 Y127.81 E.15302
G1 X130.19 Y128.19 E.01168
G1 X125.27 Y128.19 E.15118
M204 S10000
; WIPE_START
G1 F24000
G1 X125.21 Y127.81 E-.14619
G1 X126.825 Y127.81 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.689 J-1.003 P1  F30000
G1 X119.115 Y133.111 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1912
G1 X119.102 Y131.696 E.04694
G3 X119.131 Y128.581 I125.929 J-.393 E.10334
G1 X120.869 Y128.581 E.05766
G1 X120.898 Y131.696 E.10334
G1 X120.884 Y133.237 E.05113
G2 X121.683 Y134.046 I33.088 J-31.886 E.03773
G1 X122.029 Y134.397 E.01636
G1 X117.971 Y134.397 E.13464
G2 X118.62 Y133.74 I-25.063 J-25.408 E.03064
G1 X119.116 Y133.237 E.02344
G1 X119.116 Y133.171 E.0022
; WIPE_START
G1 F24000
G1 X119.102 Y131.696 E-.56049
G1 X119.107 Y131.171 E-.19951
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.211 J.125 P1  F30000
G1 X119.978 Y122.754 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1912
G1 X120.71 Y122.754 E.0225
G1 X120.71 Y128.188 E.16699
G1 X119.29 Y128.188 E.04363
G1 X119.29 Y122.754 E.16699
G1 X119.918 Y122.754 E.01929
M204 S10000
G1 X120.716 Y122.362 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1912
G1 X119.284 Y122.362 E.04749
G1 X119.326 Y121.56 E.02663
G1 X120.674 Y121.56 E.0447
G1 X120.707 Y122.185 E.02075
G1 X120.713 Y122.302 E.00389
; WIPE_START
G1 F24000
G1 X119.284 Y122.362 E-.54332
G1 X119.314 Y121.792 E-.21668
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.215 J-.074 P1  F30000
G1 X118.617 Y133.185 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1912
G1 X118.723 Y133.077 E.00462
G1 X118.71 Y131.696 E.04246
G3 X118.882 Y122.55 I233.077 J-.2 E.2811
G1 X118.954 Y121.168 E.04251
G1 X121.046 Y121.168 E.06426
G1 X121.098 Y122.164 E.03065
G1 X121.118 Y122.55 E.01186
G3 X121.277 Y133.077 I-267.67 J9.305 E.32355
G2 X121.958 Y133.766 I26.66 J-25.655 E.02975
G1 X122.268 Y134.08 E.01357
G1 X122.261 Y134.789 E.02177
G1 X117.739 Y134.789 E.13897
G1 X117.732 Y134.08 E.02177
G2 X118.338 Y133.467 I-22.747 J-23.077 E.02648
G1 X118.575 Y133.227 E.01037
M204 S10000
; WIPE_START
G1 F24000
G1 X118.723 Y133.077 E-.07999
G1 X118.71 Y131.696 E-.52507
G1 X118.714 Y131.288 E-.15494
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.149 J.4 P1  F30000
G1 X119.519 Y128.973 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1912
G2 X119.509 Y133.318 I117.487 J2.448 E.13353
G1 X119.455 Y133.452 E.00445
G1 X118.909 Y134.005 E.02386
M73 P85 R1
G1 X121.091 Y134.005 E.06704
G1 X120.545 Y133.452 E.02386
G1 X120.491 Y133.318 E.00445
G2 X120.481 Y128.973 I-117.497 J-1.897 E.13353
G1 X119.579 Y128.973 E.02769
G1 X120 Y129.458 F30000
; LINE_WIDTH: 0.653375
G1 F1912
G1 X120 Y133.313 E.1918
; LINE_WIDTH: 0.647488
G1 X120 Y133.432 E.00586
G1 X119.015 Y128.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.199482
G1 F1912
G1 X119.022 Y126.991 E.01778
; LINE_WIDTH: 0.187318
G1 X119.045 Y125.412 E.01858
; LINE_WIDTH: 0.142119
G1 X119.067 Y123.833 E.01276
; WIPE_START
G1 F24000
G1 X119.045 Y125.412 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.781 J.934 P1  F30000
G1 X120.933 Y123.833 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.142118
G1 F1912
G1 X120.955 Y125.412 E.01276
; LINE_WIDTH: 0.187316
G1 X120.978 Y126.991 E.01858
; LINE_WIDTH: 0.19948
G1 X120.985 Y128.384 E.01778
G1 X120.491 Y121.961 F30000
; LINE_WIDTH: 0.437508
G1 F1912
G1 X119.509 Y121.961 E.03157
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.491 Y121.961 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/25
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
G3 Z2.8 I-1.213 J-.1 P1  F30000
G1 X118.116 Y150.743 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1848
G1 X118.205 Y150.654 E.00418
G1 X118.239 Y147.037 E.12001
G1 X118.269 Y145.99 E.03473
G1 X119.917 Y145.99 E.05468
G1 X119.948 Y147.037 E.03473
G1 X119.981 Y150.654 E.12001
G1 X121.14 Y151.806 E.05421
G1 X117.046 Y151.806 E.13581
G1 X118.074 Y150.786 E.04804
; WIPE_START
G1 F24000
G1 X118.205 Y150.654 E-.07065
G1 X118.222 Y148.84 E-.68935
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.212 J.113 P1  F30000
G1 X119.035 Y140.164 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1848
G1 X119.803 Y140.164 E.02362
G1 X119.803 Y145.598 E.16699
G1 X118.383 Y145.598 E.04363
G1 X118.383 Y140.164 E.16699
G1 X118.975 Y140.164 E.01817
M204 S10000
G1 X119.035 Y139.771 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1848
G1 X118.516 Y139.771 E.01721
G1 X118.558 Y138.97 E.02663
G1 X119.627 Y138.97 E.03545
G1 X119.669 Y139.771 E.02663
G1 X119.095 Y139.771 E.01906
; WIPE_START
G1 F24000
G1 X118.516 Y139.771 E-.21993
G1 X118.558 Y138.97 E-.30505
G1 X119.176 Y138.97 E-.23502
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.207 J-.152 P1  F30000
G1 X117.712 Y150.592 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1848
G1 X117.815 Y150.49 E.00445
G1 X117.847 Y147.029 E.10634
G1 X117.975 Y142.594 E.13636
G1 X118.19 Y138.578 E.12357
G1 X119.997 Y138.578 E.05552
G1 X120.001 Y138.627 E.00153
G1 X120.212 Y142.594 E.12205
G1 X120.34 Y147.029 E.13635
G1 X120.372 Y150.49 E.10634
G1 X121.381 Y151.493 E.04372
G3 X121.379 Y152.199 I-19.082 J.3 E.02169
G1 X116.807 Y152.199 E.14047
G3 X116.806 Y151.493 I19.08 J-.406 E.02169
G1 X117.67 Y150.634 E.03743
M204 S10000
; WIPE_START
G1 F24000
G1 X117.815 Y150.49 E-.07778
G1 X117.831 Y148.695 E-.68222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.955 J.755 P1  F30000
G1 X119.093 Y150.291 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.650608
G1 F1848
G1 X119.068 Y150.367 E.00396
; LINE_WIDTH: 0.60067
G1 X119.042 Y150.442 E.00363
; LINE_WIDTH: 0.550731
G1 X119.016 Y150.518 E.00331
; LINE_WIDTH: 0.500792
G1 X118.991 Y150.594 E.00298
; LINE_WIDTH: 0.450854
G1 X118.965 Y150.669 E.00266
; LINE_WIDTH: 0.369586
G2 X118.934 Y150.862 I.314 J.149 E.00528
G1 X118.823 Y151.063 E.0061
G1 X119.364 Y151.063 E.0144
G1 X119.252 Y150.862 E.0061
; LINE_WIDTH: 0.369272
G1 X119.247 Y150.689 E.0046
; LINE_WIDTH: 0.350462
G1 X119.228 Y150.64 E.00131
; LINE_WIDTH: 0.39334
G1 X119.209 Y150.592 E.0015
; LINE_WIDTH: 0.436218
G1 X119.19 Y150.543 E.00168
; LINE_WIDTH: 0.479096
G1 X119.171 Y150.494 E.00186
; LINE_WIDTH: 0.521974
G1 X119.153 Y150.445 E.00205
; LINE_WIDTH: 0.564852
G1 X119.134 Y150.396 E.00223
; LINE_WIDTH: 0.60773
G1 X119.115 Y150.347 E.00241
G1 X119.093 Y146.839 F30000
; LINE_WIDTH: 0.578352
G1 F1848
G1 X119.093 Y147.053 E.00936
; LINE_WIDTH: 0.59074
G1 X119.093 Y148.642 E.07093
; LINE_WIDTH: 0.620674
G1 X119.093 Y150.231 E.0748
G1 X118.65 Y146.382 F30000
; LINE_WIDTH: 0.419999
G1 F1848
G1 X118.597 Y150.742 E.13396
G1 X118.541 Y150.874 E.0044
G1 X117.997 Y151.414 E.02357
G1 X120.19 Y151.414 E.06737
G1 X119.645 Y150.874 E.02357
G1 X119.589 Y150.686 E.00601
G1 X119.537 Y146.382 E.13226
G1 X118.71 Y146.382 E.0254
G1 X118.133 Y145.794 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.149962
G1 F1848
G1 X118.147 Y144.835 E.00836
; LINE_WIDTH: 0.123441
G1 X118.161 Y143.877 E.00629
; WIPE_START
M73 P86 R1
G1 F24000
G1 X118.147 Y144.835 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.553 J1.084 P1  F30000
G1 X120.026 Y143.877 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.123441
G1 F1848
G1 X120.04 Y144.835 E.00629
; LINE_WIDTH: 0.149962
G1 X120.054 Y145.794 E.00836
; WIPE_START
G1 F24000
G1 X120.04 Y144.835 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.193 J-.24 P1  F30000
G1 X118.938 Y139.371 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.437508
G1 F1848
G1 X119.186 Y139.371 E.00798
; WIPE_START
G1 F24000
G1 X118.938 Y139.371 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.822 J.898 P1  F30000
G1 X125.656 Y133.219 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1848
G1 X125.656 Y132.839 E.01168
G1 X130.236 Y132.839 E.14073
G1 X130.236 Y133.219 E.01168
G1 X125.716 Y133.219 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X125.656 Y132.839 E-.14619
G1 X127.272 Y132.839 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.112 J-.493 P1  F30000
G1 X125.21 Y128.19 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
G1 F1848
G1 X125.21 Y127.81 E.01168
G1 X129.79 Y127.81 E.14073
G1 X129.79 Y128.19 E.01168
G1 X125.27 Y128.19 E.13889
M204 S10000
; WIPE_START
G1 F24000
G1 X125.21 Y127.81 E-.14619
G1 X126.825 Y127.81 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.702 J-.994 P1  F30000
G1 X119.023 Y133.318 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1848
G1 X119.112 Y133.23 E.00418
G1 X119.146 Y129.612 E.12001
G1 X119.176 Y128.565 E.03473
G1 X120.824 Y128.565 E.05468
G1 X120.854 Y129.612 E.03473
G1 X120.888 Y133.23 E.12001
G1 X122.047 Y134.381 E.05421
G1 X117.953 Y134.381 E.13581
G1 X118.98 Y133.361 E.04804
; WIPE_START
G1 F24000
G1 X119.112 Y133.23 E-.07065
G1 X119.129 Y131.416 E-.68935
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.212 J.113 P1  F30000
G1 X119.941 Y122.739 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1848
G1 X120.71 Y122.739 E.02362
G1 X120.71 Y128.173 E.16699
G1 X119.29 Y128.173 E.04363
G1 X119.29 Y122.739 E.16699
G1 X119.881 Y122.739 E.01817
M204 S10000
G1 X119.941 Y122.347 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1848
G1 X119.423 Y122.347 E.01721
G1 X119.465 Y121.545 E.02663
G1 X120.533 Y121.545 E.03545
G1 X120.576 Y122.347 E.02663
G1 X120.001 Y122.347 E.01906
; WIPE_START
G1 F24000
G1 X119.423 Y122.347 E-.21993
G1 X119.465 Y121.545 E-.30505
G1 X120.083 Y121.545 E-.23502
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.207 J-.152 P1  F30000
G1 X118.619 Y133.167 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1848
G1 X118.722 Y133.065 E.00445
G1 X118.754 Y129.604 E.10634
G1 X118.882 Y125.169 E.13636
G1 X119.097 Y121.153 E.12357
G1 X120.903 Y121.153 E.05552
G1 X120.908 Y121.202 E.00153
G1 X121.118 Y125.169 E.12205
G1 X121.246 Y129.604 E.13635
G1 X121.278 Y133.065 E.10634
G1 X122.288 Y134.068 E.04372
G3 X122.286 Y134.774 I-19.082 J.3 E.02169
G1 X117.714 Y134.774 E.14047
G3 X117.712 Y134.068 I19.08 J-.406 E.02169
G1 X118.576 Y133.209 E.03743
M204 S10000
; WIPE_START
G1 F24000
G1 X118.722 Y133.065 E-.07778
G1 X118.738 Y131.27 E-.68222
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.955 J.755 P1  F30000
G1 X120 Y132.866 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.650608
G1 F1848
G1 X119.974 Y132.942 E.00396
; LINE_WIDTH: 0.60067
G1 X119.949 Y133.017 E.00363
; LINE_WIDTH: 0.550731
G1 X119.923 Y133.093 E.00331
; LINE_WIDTH: 0.500792
G1 X119.897 Y133.169 E.00298
; LINE_WIDTH: 0.450854
G1 X119.872 Y133.244 E.00266
; LINE_WIDTH: 0.369586
G2 X119.841 Y133.438 I.314 J.149 E.00528
G1 X119.729 Y133.638 E.0061
G1 X120.271 Y133.638 E.0144
G1 X120.159 Y133.438 E.0061
; LINE_WIDTH: 0.369272
G1 X120.154 Y133.264 E.0046
; LINE_WIDTH: 0.350462
G1 X120.135 Y133.216 E.00131
; LINE_WIDTH: 0.39334
G1 X120.116 Y133.167 E.0015
; LINE_WIDTH: 0.436218
G1 X120.097 Y133.118 E.00168
; LINE_WIDTH: 0.479096
G1 X120.078 Y133.069 E.00186
; LINE_WIDTH: 0.521974
G1 X120.059 Y133.02 E.00205
; LINE_WIDTH: 0.564852
G1 X120.04 Y132.971 E.00223
; LINE_WIDTH: 0.60773
G1 X120.022 Y132.922 E.00241
G1 X120 Y129.414 F30000
; LINE_WIDTH: 0.578352
G1 F1848
G1 X120 Y129.628 E.00936
; LINE_WIDTH: 0.59074
G1 X120 Y131.217 E.07093
; LINE_WIDTH: 0.620674
G1 X120 Y132.806 E.0748
G1 X119.557 Y128.957 F30000
; LINE_WIDTH: 0.419999
G1 F1848
G1 X119.503 Y133.317 E.13396
G1 X119.448 Y133.449 E.0044
G1 X118.904 Y133.989 E.02357
G1 X121.096 Y133.989 E.06737
G1 X120.552 Y133.449 E.02357
G1 X120.496 Y133.261 E.00601
G1 X120.443 Y128.957 E.13226
G1 X119.617 Y128.957 E.0254
G1 X119.04 Y128.369 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.149962
G1 F1848
G1 X119.054 Y127.41 E.00836
; LINE_WIDTH: 0.123441
G1 X119.067 Y126.452 E.00629
; WIPE_START
G1 F24000
G1 X119.054 Y127.41 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.553 J1.084 P1  F30000
M73 P87 R1
G1 X120.933 Y126.452 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.123441
G1 F1848
G1 X120.946 Y127.41 E.00629
; LINE_WIDTH: 0.149962
G1 X120.96 Y128.369 E.00836
; WIPE_START
G1 F24000
G1 X120.946 Y127.41 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.193 J-.24 P1  F30000
G1 X119.845 Y121.946 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.437508
G1 F1848
G1 X120.093 Y121.946 E.00798
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.845 Y121.946 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/25
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
G3 Z3 I-1.215 J-.072 P1  F30000
G1 X118.141 Y150.722 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1672
G1 X118.23 Y150.634 E.00415
G1 X118.239 Y149.656 E.03246
G1 X118.345 Y145.975 E.12215
G1 X119.841 Y145.975 E.04963
G1 X119.948 Y149.656 E.12215
G1 X119.957 Y150.634 E.03246
G2 X121.116 Y151.791 I33.134 J-32.039 E.05434
G1 X117.07 Y151.791 E.1342
G1 X118.099 Y150.765 E.04819
; WIPE_START
G1 F24000
G1 X118.23 Y150.634 E-.07032
G1 X118.239 Y149.656 E-.37183
G1 X118.263 Y148.82 E-.31785
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.213 J.103 P1  F30000
G1 X119.001 Y140.148 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1672
G1 X119.803 Y140.148 E.02464
G1 X119.803 Y145.583 E.16699
G1 X118.383 Y145.583 E.04363
G1 X118.383 Y140.148 E.16699
G1 X118.941 Y140.148 E.01715
M204 S10000
G1 X119.479 Y139.756 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1672
G1 X118.707 Y139.756 E.02562
G1 X118.776 Y138.955 E.02669
G1 X119.41 Y138.955 E.02105
G1 X119.474 Y139.696 E.0247
; WIPE_START
G1 F24000
G1 X118.707 Y139.756 E-.2924
G1 X118.776 Y138.955 E-.30576
G1 X119.202 Y138.955 E-.16184
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.207 J-.152 P1  F30000
G1 X117.736 Y150.575 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1672
G1 X117.839 Y150.473 E.00446
G1 X117.847 Y149.648 E.02534
G1 X117.975 Y145.212 E.13636
G1 X118.18 Y141.31 E.12007
G1 X118.416 Y138.562 E.08474
G1 X119.77 Y138.562 E.04161
G1 X119.954 Y140.703 E.06602
G1 X120.006 Y141.31 E.01872
G1 X120.212 Y145.212 E.12007
G1 X120.34 Y149.648 E.13636
G1 X120.347 Y150.473 E.02534
G2 X121.357 Y151.478 I29.239 J-28.363 E.04376
G1 X121.363 Y152.183 E.02169
G1 X116.823 Y152.183 E.13949
G1 X116.83 Y151.478 E.02169
G1 X117.694 Y150.618 E.03745
M204 S10000
; WIPE_START
G1 F24000
G1 X117.839 Y150.473 E-.078
G1 X117.847 Y149.648 E-.31336
G1 X117.875 Y148.679 E-.36864
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.142 J.421 P1  F30000
G1 X118.726 Y146.367 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1672
G1 X118.631 Y149.663 E.10132
G1 X118.621 Y150.721 E.03251
G1 X118.566 Y150.853 E.00439
G1 X118.018 Y151.399 E.02376
G1 X120.168 Y151.399 E.06606
G1 X119.621 Y150.853 E.02376
G1 X119.565 Y150.721 E.00439
G1 X119.556 Y149.663 E.03251
G1 X119.46 Y146.367 E.10132
G1 X118.786 Y146.367 E.02072
G1 X119.093 Y146.745 F30000
; LINE_WIDTH: 0.421758
G1 F1672
G1 X119.093 Y147.477 E.02259
; LINE_WIDTH: 0.464004
G1 X119.093 Y148.208 E.02511
; LINE_WIDTH: 0.506249
G1 X119.093 Y148.94 E.02763
; LINE_WIDTH: 0.548495
G1 X119.093 Y149.672 E.03015
; LINE_WIDTH: 0.59074
G1 X119.093 Y150.725 E.04702
; LINE_WIDTH: 0.610216
G1 X119.093 Y150.842 E.00539
; WIPE_START
G1 F24000
G1 X119.093 Y150.725 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.217 J0 P1  F30000
G1 X119.093 Y139.402 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.38292
G1 F1672
G1 X119.093 Y139.36 E.00115
; WIPE_START
G1 F24000
G1 X119.093 Y139.402 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.834 J.886 P1  F30000
G1 X125.656 Y133.219 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1672
G1 X125.656 Y132.839 E.01168
G1 X129.836 Y132.839 E.12844
G1 X129.836 Y133.219 E.01168
G1 X125.716 Y133.219 E.1266
M204 S10000
; WIPE_START
G1 F24000
G1 X125.656 Y132.839 E-.14619
G1 X127.272 Y132.839 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.112 J-.493 P1  F30000
G1 X125.21 Y128.19 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
G1 F1672
G1 X125.21 Y127.81 E.01168
G1 X129.39 Y127.81 E.12844
G1 X129.39 Y128.19 E.01168
G1 X125.27 Y128.19 E.1266
M204 S10000
; WIPE_START
G1 F24000
G1 X125.21 Y127.81 E-.14619
G1 X126.825 Y127.81 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.702 J-.994 P1  F30000
G1 X119.048 Y133.297 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1672
G1 X119.137 Y133.209 E.00415
G1 X119.146 Y132.231 E.03246
G1 X119.252 Y128.55 E.12215
G1 X120.748 Y128.55 E.04963
G1 X120.854 Y132.231 E.12215
G1 X120.863 Y133.209 E.03246
G2 X122.023 Y134.366 I33.134 J-32.039 E.05434
G1 X117.977 Y134.366 E.1342
G1 X119.006 Y133.34 E.04819
; WIPE_START
G1 F24000
G1 X119.137 Y133.209 E-.07032
G1 X119.146 Y132.231 E-.37183
G1 X119.17 Y131.395 E-.31785
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.213 J.103 P1  F30000
M73 P88 R1
G1 X119.908 Y122.723 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1672
G1 X120.71 Y122.723 E.02464
G1 X120.71 Y128.158 E.16699
G1 X119.29 Y128.158 E.04363
G1 X119.29 Y122.723 E.16699
G1 X119.848 Y122.723 E.01715
M204 S10000
G1 X120.386 Y122.331 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1672
G1 X119.614 Y122.331 E.02562
G1 X119.683 Y121.53 E.02669
G1 X120.317 Y121.53 E.02105
G1 X120.381 Y122.271 E.0247
; WIPE_START
G1 F24000
G1 X119.614 Y122.331 E-.2924
G1 X119.683 Y121.53 E-.30576
G1 X120.109 Y121.53 E-.16184
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.207 J-.152 P1  F30000
G1 X118.643 Y133.15 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1672
G1 X118.746 Y133.048 E.00446
G1 X118.754 Y132.223 E.02534
G1 X118.882 Y127.787 E.13636
G1 X119.087 Y123.885 E.12007
G1 X119.323 Y121.138 E.08474
G1 X120.677 Y121.138 E.04161
G1 X120.861 Y123.278 E.06602
G1 X120.913 Y123.885 E.01872
G1 X121.118 Y127.787 E.12007
G1 X121.246 Y132.223 E.13636
G1 X121.254 Y133.048 E.02534
G2 X122.263 Y134.053 I29.239 J-28.363 E.04376
G1 X122.27 Y134.758 E.02169
G1 X117.73 Y134.758 E.13949
G1 X117.737 Y134.053 E.02169
G1 X118.6 Y133.193 E.03745
M204 S10000
; WIPE_START
G1 F24000
G1 X118.746 Y133.048 E-.078
G1 X118.754 Y132.223 E-.31336
G1 X118.782 Y131.254 E-.36864
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.142 J.421 P1  F30000
G1 X119.633 Y128.942 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1672
G1 X119.538 Y132.238 E.10132
G1 X119.528 Y133.296 E.03251
G1 X119.472 Y133.428 E.00439
G1 X118.925 Y133.974 E.02376
G1 X121.075 Y133.974 E.06606
G1 X120.528 Y133.428 E.02376
G1 X120.472 Y133.296 E.00439
G1 X120.462 Y132.238 E.03251
G1 X120.367 Y128.942 E.10132
G1 X119.693 Y128.942 E.02072
G1 X120 Y129.32 F30000
; LINE_WIDTH: 0.421758
G1 F1672
G1 X120 Y130.052 E.02259
; LINE_WIDTH: 0.464004
G1 X120 Y130.784 E.02511
; LINE_WIDTH: 0.506249
G1 X120 Y131.515 E.02763
; LINE_WIDTH: 0.548495
G1 X120 Y132.247 E.03015
; LINE_WIDTH: 0.59074
G1 X120 Y133.3 E.04702
; LINE_WIDTH: 0.610216
G1 X120 Y133.417 E.00539
; WIPE_START
G1 F24000
G1 X120 Y133.3 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.217 J0 P1  F30000
G1 X120 Y121.977 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.38292
G1 F1672
G1 X120 Y121.935 E.00115
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120 Y121.977 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/25
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
G3 Z3.2 I-1.215 J-.073 P1  F30000
G1 X118.289 Y150.522 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1449
G1 X118.367 Y147.847 E.08877
G3 X118.466 Y145.96 I99.131 J4.264 E.0627
G1 X119.721 Y145.96 E.04162
G1 X119.82 Y147.847 E.0627
G1 X119.901 Y150.647 E.09292
G3 X121.099 Y151.776 I-49.371 J53.618 E.0546
G1 X117.088 Y151.776 E.13306
G3 X118.286 Y150.647 I50.569 J52.489 E.0546
G1 X118.288 Y150.582 E.00216
G1 X117.792 Y150.569 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1449
G1 X117.899 Y150.468 E.00452
G1 X117.975 Y147.831 E.08104
G1 X118.18 Y143.929 E.12007
G1 X118.383 Y141.565 E.07292
G1 X118.383 Y145.568 E.123
G1 X119.803 Y145.568 E.04363
G1 X119.803 Y141.565 E.123
G1 X120.006 Y143.929 E.07292
G1 X120.212 Y147.831 E.12007
G1 X120.288 Y150.468 E.08104
G3 X121.332 Y151.462 I-23.899 J26.142 E.04432
G1 X121.339 Y152.168 E.02169
G1 X116.848 Y152.168 E.138
G1 X116.854 Y151.462 E.02169
G1 X117.749 Y150.61 E.03796
M204 S10000
; WIPE_START
G1 F24000
G1 X117.899 Y150.468 E-.07868
G1 X117.951 Y148.675 E-.68132
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.208 J.144 P1  F30000
G1 X118.972 Y140.133 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F1449
G1 X118.548 Y140.133 E.01303
G3 X118.783 Y138.547 I81.406 J11.288 E.04926
G1 X119.403 Y138.547 E.01903
G1 X119.416 Y138.589 E.00136
G2 X119.639 Y140.133 I88.793 J-12 E.04792
G1 X119.032 Y140.133 E.01865
M204 S10000
; WIPE_START
G1 F24000
G1 X118.548 Y140.133 E-.1839
G1 X118.771 Y138.633 E-.5761
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.178 J.307 P1  F30000
G1 X118.902 Y139.139 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F1449
G1 X119.347 Y139.584 E.01932
G1 X119.155 Y139.926
G1 X118.836 Y139.606 E.01388
M204 S10000
G1 X118.942 Y138.774 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104064
G1 F1449
M73 P89 R1
G1 X119.244 Y138.774 E.0015
; WIPE_START
G1 F24000
G1 X118.942 Y138.774 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.217 J-.011 P1  F30000
G1 X118.876 Y146.392 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.500564
G1 F1449
G1 X118.865 Y146.609 E.0081
G1 X118.848 Y147.236 E.0234
; LINE_WIDTH: 0.533528
G1 X118.832 Y147.863 E.02508
; LINE_WIDTH: 0.566492
G1 X118.802 Y148.043 E.00778
; LINE_WIDTH: 0.517661
G1 X118.773 Y148.223 E.00706
; LINE_WIDTH: 0.421021
G1 X118.743 Y148.403 E.00562
G1 X118.675 Y150.746 E.07222
G1 X118.612 Y150.881 E.00459
G2 X118.062 Y151.384 I4.015 J4.949 E.02297
G1 X120.124 Y151.384 E.06353
G1 X119.574 Y150.881 E.02296
G1 X119.511 Y150.746 E.00459
G1 X119.444 Y148.403 E.07222
; LINE_WIDTH: 0.419999
G1 X119.414 Y148.225 E.00554
; LINE_WIDTH: 0.46883
G1 X119.384 Y148.047 E.00626
; LINE_WIDTH: 0.519282
G3 X119.355 Y147.863 I.724 J-.212 E.00726
; LINE_WIDTH: 0.566492
G1 X119.338 Y147.236 E.02677
; LINE_WIDTH: 0.517534
G2 X119.31 Y146.392 I-16.07 J.108 E.03266
G1 X118.936 Y146.392 E.01447
G1 X119.093 Y148.413 F30000
; LINE_WIDTH: 0.366868
G1 F1449
G1 X119.093 Y149.195 E.02063
; LINE_WIDTH: 0.411998
G1 X119.093 Y149.977 E.02351
; LINE_WIDTH: 0.457128
G1 X119.093 Y150.758 E.02638
; LINE_WIDTH: 0.502258
G1 X119.093 Y150.817 E.00219
; LINE_WIDTH: 0.532474
G1 X119.093 Y150.875 E.00234
; WIPE_START
G1 F24000
G1 X119.093 Y150.817 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.14 J.425 P1  F30000
G1 X125.656 Y133.219 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1449
G1 X125.656 Y132.839 E.01168
G1 X129.436 Y132.839 E.11615
G1 X129.436 Y133.219 E.01168
G1 X125.716 Y133.219 E.11431
M204 S10000
; WIPE_START
G1 F24000
G1 X125.656 Y132.839 E-.14619
G1 X127.272 Y132.839 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.112 J-.493 P1  F30000
G1 X125.21 Y128.19 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F1449
G1 X125.21 Y127.81 E.01168
G1 X128.99 Y127.81 E.11615
G1 X128.99 Y128.19 E.01168
G1 X125.27 Y128.19 E.11431
M204 S10000
; WIPE_START
G1 F24000
G1 X125.21 Y127.81 E-.14619
G1 X126.825 Y127.81 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.693 J-1 P1  F30000
G1 X119.196 Y133.097 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1449
G1 X119.273 Y130.422 E.08877
G3 X119.373 Y128.535 I99.131 J4.264 E.0627
G1 X120.627 Y128.535 E.04162
G1 X120.727 Y130.422 E.0627
G1 X120.807 Y133.222 E.09292
G3 X122.006 Y134.351 I-49.371 J53.618 E.0546
G1 X117.994 Y134.351 E.13306
G3 X119.193 Y133.222 I50.569 J52.489 E.0546
G1 X119.194 Y133.157 E.00216
G1 X118.699 Y133.144 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1449
G1 X118.806 Y133.043 E.00452
G1 X118.882 Y130.406 E.08104
G1 X119.087 Y126.504 E.12007
G1 X119.29 Y124.14 E.07292
G1 X119.29 Y128.143 E.123
G1 X120.71 Y128.143 E.04363
G1 X120.71 Y124.14 E.123
G1 X120.913 Y126.504 E.07292
G1 X121.118 Y130.406 E.12007
G1 X121.194 Y133.043 E.08104
G3 X122.239 Y134.037 I-23.899 J26.142 E.04432
G1 X122.246 Y134.743 E.02169
G1 X117.754 Y134.743 E.138
G1 X117.761 Y134.037 E.02169
G1 X118.656 Y133.185 E.03796
M204 S10000
; WIPE_START
G1 F24000
G1 X118.806 Y133.043 E-.07868
G1 X118.857 Y131.25 E-.68132
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.208 J.144 P1  F30000
G1 X119.879 Y122.708 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F1449
G1 X119.455 Y122.708 E.01303
G3 X119.69 Y121.122 I81.406 J11.288 E.04926
G1 X120.31 Y121.122 E.01903
G1 X120.323 Y121.164 E.00136
G2 X120.545 Y122.708 I88.793 J-12 E.04792
G1 X119.939 Y122.708 E.01865
M204 S10000
; WIPE_START
G1 F24000
G1 X119.455 Y122.708 E-.1839
G1 X119.677 Y121.208 E-.5761
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.178 J.307 P1  F30000
G1 X119.809 Y121.714 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F1449
G1 X120.254 Y122.159 E.01932
G1 X120.062 Y122.501
G1 X119.743 Y122.181 E.01388
M204 S10000
G1 X119.849 Y121.349 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104064
G1 F1449
G1 X120.151 Y121.349 E.0015
; WIPE_START
G1 F24000
G1 X119.849 Y121.349 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.217 J-.011 P1  F30000
G1 X119.783 Y128.967 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.500564
G1 F1449
G1 X119.771 Y129.184 E.0081
G1 X119.755 Y129.811 E.0234
; LINE_WIDTH: 0.533528
M73 P90 R0
G1 X119.739 Y130.438 E.02508
; LINE_WIDTH: 0.566492
G1 X119.709 Y130.618 E.00778
; LINE_WIDTH: 0.517661
G1 X119.679 Y130.798 E.00706
; LINE_WIDTH: 0.421021
G1 X119.65 Y130.978 E.00562
G1 X119.582 Y133.321 E.07222
G1 X119.519 Y133.456 E.00459
G2 X118.969 Y133.959 I4.015 J4.949 E.02297
G1 X121.031 Y133.959 E.06353
G1 X120.481 Y133.456 E.02296
G1 X120.418 Y133.321 E.00459
G1 X120.35 Y130.978 E.07222
; LINE_WIDTH: 0.419999
G1 X120.321 Y130.8 E.00554
; LINE_WIDTH: 0.46883
G1 X120.291 Y130.622 E.00626
; LINE_WIDTH: 0.519282
G3 X120.261 Y130.438 I.724 J-.212 E.00726
; LINE_WIDTH: 0.566492
G1 X120.245 Y129.811 E.02677
; LINE_WIDTH: 0.517534
G2 X120.217 Y128.967 I-16.07 J.108 E.03266
G1 X119.843 Y128.967 E.01447
G1 X120 Y130.988 F30000
; LINE_WIDTH: 0.366868
G1 F1449
G1 X120 Y131.77 E.02063
; LINE_WIDTH: 0.411998
G1 X120 Y132.552 E.02351
; LINE_WIDTH: 0.457128
G1 X120 Y133.333 E.02638
; LINE_WIDTH: 0.502258
G1 X120 Y133.392 E.00219
; LINE_WIDTH: 0.532474
G1 X120 Y133.45 E.00234
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120 Y133.392 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/25
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
G3 Z3.4 I-1.211 J-.116 P1  F30000
G1 X118.364 Y150.524 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X118.571 Y146.575 E.13118
G1 X118.625 Y145.944 E.021
G1 X119.561 Y145.944 E.03104
G1 X119.615 Y146.575 E.021
G1 X119.829 Y150.637 E.13494
G3 X121.058 Y151.761 I-19.529 J22.608 E.05525
G1 X117.128 Y151.761 E.13036
G3 X118.358 Y150.637 I20.76 J21.486 E.05525
G1 X118.36 Y150.584 E.00177
G1 X117.854 Y150.564 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X117.975 Y150.454 E.00502
G1 X118.18 Y146.548 E.12017
G1 X118.383 Y144.183 E.07293
G1 X118.383 Y145.552 E.04206
G1 X119.803 Y145.552 E.04363
G1 X119.803 Y144.183 E.04206
G1 X120.006 Y146.548 E.07293
G1 X120.212 Y150.454 E.12017
G3 X121.302 Y151.452 I-17.356 J20.053 E.04543
G3 X121.314 Y152.153 I-17.844 J.661 E.02154
G1 X116.872 Y152.153 E.1365
G3 X116.884 Y151.452 I17.862 J-.04 E.02154
G1 X117.81 Y150.604 E.03857
M204 S10000
; WIPE_START
G1 F24000
G1 X117.975 Y150.454 E-.08485
G1 X118.068 Y148.679 E-.67515
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.106 J.507 P1  F30000
G1 X118.933 Y146.794 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.381044
G1 F1200
G1 X118.924 Y146.954 E.00442
G1 X118.901 Y147.846 E.02459
; LINE_WIDTH: 0.42794
G1 X118.878 Y148.738 E.028
; LINE_WIDTH: 0.474835
G1 X118.854 Y149.63 E.03141
; LINE_WIDTH: 0.53148
G1 X118.831 Y150.523 E.03553
G1 X118.776 Y150.751 E.00933
; LINE_WIDTH: 0.48394
G1 X118.457 Y151.06 E.01596
; LINE_WIDTH: 0.424591
G1 X118.139 Y151.369 E.01381
G1 X120.048 Y151.369 E.05938
G1 X119.503 Y150.87 E.02296
; LINE_WIDTH: 0.419999
G1 X119.454 Y150.807 E.00246
; LINE_WIDTH: 0.455467
G1 X119.406 Y150.743 E.00269
; LINE_WIDTH: 0.490935
G1 X119.381 Y150.633 E.00413
; LINE_WIDTH: 0.529781
G1 X119.356 Y150.523 E.00448
; LINE_WIDTH: 0.568626
G1 X119.332 Y149.63 E.03824
; LINE_WIDTH: 0.521731
G1 X119.309 Y148.738 E.03482
; LINE_WIDTH: 0.474835
G1 X119.285 Y147.846 E.03141
; LINE_WIDTH: 0.412904
G2 X119.254 Y146.794 I-20.041 J.08 E.03175
G1 X118.993 Y146.794 E.00786
G1 X118.801 Y146.274 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.294472
G1 F1200
G1 X119.385 Y146.274 E.01196
; WIPE_START
G1 F24000
G1 X118.801 Y146.274 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.077 J.566 P1  F30000
G1 X125.656 Y133.219 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.656 Y132.839 E.01168
G1 X129.036 Y132.839 E.10386
G1 X129.036 Y133.219 E.01168
G1 X125.716 Y133.219 E.10201
M204 S10000
; WIPE_START
G1 F24000
G1 X125.656 Y132.839 E-.14619
G1 X127.272 Y132.839 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.112 J-.493 P1  F30000
G1 X125.21 Y128.19 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X125.21 Y127.81 E.01168
G1 X128.59 Y127.81 E.10386
G1 X128.59 Y128.19 E.01168
G1 X125.27 Y128.19 E.10201
M204 S10000
; WIPE_START
G1 F24000
G1 X125.21 Y127.81 E-.14619
G1 X126.825 Y127.81 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.698 J-.997 P1  F30000
G1 X119.27 Y133.099 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X119.478 Y129.15 E.13118
G1 X119.532 Y128.519 E.021
G1 X120.468 Y128.519 E.03104
G1 X120.522 Y129.15 E.021
G1 X120.736 Y133.212 E.13494
G3 X121.965 Y134.336 I-19.529 J22.608 E.05525
G1 X118.035 Y134.336 E.13036
G3 X119.264 Y133.212 I20.76 J21.486 E.05525
G1 X119.267 Y133.159 E.00177
G1 X118.761 Y133.139 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M73 P91 R0
G1 X118.881 Y133.029 E.00502
G1 X119.087 Y129.123 E.12017
G1 X119.29 Y126.758 E.07293
G1 X119.29 Y128.127 E.04206
G1 X120.71 Y128.127 E.04363
G1 X120.71 Y126.758 E.04206
G1 X120.913 Y129.123 E.07293
G1 X121.119 Y133.029 E.12017
G3 X122.209 Y134.027 I-17.356 J20.053 E.04543
G3 X122.221 Y134.728 I-17.844 J.661 E.02154
G1 X117.779 Y134.728 E.1365
G3 X117.791 Y134.027 I17.862 J-.04 E.02154
G1 X118.717 Y133.179 E.03857
M204 S10000
; WIPE_START
G1 F24000
G1 X118.881 Y133.029 E-.08485
G1 X118.975 Y131.254 E-.67515
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.106 J.507 P1  F30000
G1 X119.84 Y129.369 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.381044
G1 F1200
G1 X119.831 Y129.529 E.00442
G1 X119.808 Y130.421 E.02459
; LINE_WIDTH: 0.42794
G1 X119.784 Y131.313 E.028
; LINE_WIDTH: 0.474835
G1 X119.761 Y132.205 E.03141
; LINE_WIDTH: 0.53148
G1 X119.738 Y133.098 E.03553
G1 X119.683 Y133.326 E.00933
; LINE_WIDTH: 0.48394
G1 X119.364 Y133.635 E.01596
; LINE_WIDTH: 0.424591
G1 X119.045 Y133.944 E.01381
G1 X120.955 Y133.944 E.05938
G1 X120.409 Y133.446 E.02296
; LINE_WIDTH: 0.419999
G1 X120.361 Y133.382 E.00246
; LINE_WIDTH: 0.455467
G1 X120.313 Y133.318 E.00269
; LINE_WIDTH: 0.490935
G1 X120.288 Y133.208 E.00413
; LINE_WIDTH: 0.529781
G1 X120.262 Y133.098 E.00448
; LINE_WIDTH: 0.568626
G1 X120.239 Y132.205 E.03824
; LINE_WIDTH: 0.521731
G1 X120.216 Y131.313 E.03482
; LINE_WIDTH: 0.474835
G1 X120.192 Y130.421 E.03141
; LINE_WIDTH: 0.412904
G2 X120.16 Y129.369 I-20.041 J.08 E.03175
G1 X119.9 Y129.369 E.00786
G1 X119.708 Y128.849 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.294472
G1 F1200
G1 X120.292 Y128.849 E.01196
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X119.708 Y128.849 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/25
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
G3 Z3.6 I-1.215 J-.068 P1  F30000
G1 X118.5 Y150.54 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X118.571 Y149.194 E.04471
G1 X118.861 Y145.929 E.10873
G1 X119.326 Y145.929 E.01541
G1 X119.347 Y146.074 E.00484
G1 X119.615 Y149.194 E.10389
G1 X119.692 Y150.645 E.04819
G3 X120.982 Y151.745 I-10.751 J13.914 E.05629
G1 X117.204 Y151.745 E.12532
G3 X118.495 Y150.645 I12.041 J12.813 E.05629
G1 X118.497 Y150.6 E.00149
G1 X117.996 Y150.544 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X118.113 Y150.447 E.00466
G1 X118.18 Y149.167 E.03938
G1 X118.45 Y146.028 E.09681
G1 X118.523 Y145.537 E.01525
G1 X119.663 Y145.537 E.03504
G1 X119.737 Y146.028 E.01525
G1 X120.006 Y149.167 E.09681
G1 X120.074 Y150.447 E.03938
G3 X121.226 Y151.436 I-10.723 J13.651 E.04669
G1 X121.246 Y152.137 E.02155
G1 X116.94 Y152.137 E.13232
G1 X116.96 Y151.436 E.02155
G3 X117.237 Y151.182 I11.875 J12.662 E.01155
G1 X117.95 Y150.582 E.02863
M204 S10000
G1 X118.32 Y151.331 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.136476
G1 F1200
G1 X117.786 Y151.525 E.00433
G1 X119.867 Y151.331 F30000
; LINE_WIDTH: 0.134634
G1 F1200
G1 X120.401 Y151.525 E.00425
G1 X118.933 Y149.39 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.379854
G1 F1200
G1 X118.925 Y149.55 E.00439
G1 X118.909 Y150.154 E.01659
; LINE_WIDTH: 0.4116
G1 X118.893 Y150.758 E.01815
; LINE_WIDTH: 0.443345
G1 X118.893 Y150.827 E.00225
; LINE_WIDTH: 0.53874
G1 X118.893 Y150.896 E.00278
G1 X118.702 Y151.058 E.01013
G1 X118.787 Y151.293 E.01011
G1 X119.399 Y151.293 E.02471
G1 X119.485 Y151.058 E.01011
G1 X119.293 Y150.896 E.01013
; LINE_WIDTH: 0.540733
G1 X119.293 Y150.827 E.00279
; LINE_WIDTH: 0.492039
G1 X119.293 Y150.758 E.00252
; LINE_WIDTH: 0.443345
G1 X119.277 Y150.154 E.01971
; LINE_WIDTH: 0.39859
G2 X119.253 Y149.39 I-14.539 J.079 E.02215
G1 X118.993 Y149.39 E.00753
G1 X119.093 Y149.018 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.598447
G1 F1200
G1 X119.093 Y148.698 E.01451
; LINE_WIDTH: 0.54995
G1 X119.093 Y148.377 E.01325
; LINE_WIDTH: 0.501452
G1 X119.093 Y148.056 E.01198
; LINE_WIDTH: 0.452955
G1 X119.093 Y147.736 E.01071
; LINE_WIDTH: 0.404457
G1 X119.093 Y147.415 E.00945
; LINE_WIDTH: 0.35596
G1 X119.093 Y147.095 E.00818
; LINE_WIDTH: 0.307463
G1 X119.093 Y146.774 E.00691
; LINE_WIDTH: 0.258965
G1 X119.093 Y146.453 E.00564
; LINE_WIDTH: 0.210468
G1 X119.093 Y146.133 E.00438
; WIPE_START
G1 F24000
G1 X119.093 Y146.453 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.09 J.541 P1  F30000
G1 X125.656 Y133.219 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P92 R0
G1 F1200
G1 X125.656 Y132.839 E.01168
G1 X128.636 Y132.839 E.09157
G1 X128.636 Y133.219 E.01168
G1 X125.716 Y133.219 E.08972
M204 S10000
; WIPE_START
G1 F24000
G1 X125.656 Y132.839 E-.14619
G1 X127.272 Y132.839 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.112 J-.493 P1  F30000
G1 X125.21 Y128.19 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X125.21 Y127.81 E.01168
G1 X128.19 Y127.81 E.09157
G1 X128.19 Y128.19 E.01168
G1 X125.27 Y128.19 E.08972
M204 S10000
; WIPE_START
G1 F24000
G1 X125.21 Y127.81 E-.14619
G1 X126.825 Y127.81 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.708 J-.99 P1  F30000
G1 X119.407 Y133.115 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X119.478 Y131.769 E.04471
G1 X119.768 Y128.504 E.10873
G1 X120.232 Y128.504 E.01541
G1 X120.254 Y128.649 E.00484
G1 X120.522 Y131.769 E.10389
G1 X120.598 Y133.22 E.04819
G3 X121.889 Y134.32 I-10.751 J13.914 E.05629
G1 X118.111 Y134.32 E.12532
G3 X119.402 Y133.22 I12.041 J12.813 E.05629
G1 X119.404 Y133.175 E.00149
G1 X118.903 Y133.119 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X119.019 Y133.022 E.00466
G1 X119.087 Y131.742 E.03938
G1 X119.357 Y128.603 E.09681
G1 X119.43 Y128.112 E.01525
G1 X120.57 Y128.112 E.03504
G1 X120.643 Y128.603 E.01525
G1 X120.913 Y131.742 E.09681
G1 X120.981 Y133.022 E.03938
G3 X122.133 Y134.011 I-10.723 J13.651 E.04669
G1 X122.153 Y134.712 E.02155
G1 X117.847 Y134.712 E.13232
G1 X117.867 Y134.011 E.02155
G3 X118.144 Y133.757 I11.875 J12.662 E.01155
G1 X118.857 Y133.157 E.02863
M204 S10000
G1 X119.226 Y133.906 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.136476
G1 F1200
G1 X118.692 Y134.1 E.00433
G1 X120.774 Y133.906 F30000
; LINE_WIDTH: 0.134634
G1 F1200
G1 X121.308 Y134.1 E.00425
G1 X119.84 Y131.965 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.379854
G1 F1200
G1 X119.832 Y132.125 E.00439
G1 X119.816 Y132.729 E.01659
; LINE_WIDTH: 0.4116
G1 X119.8 Y133.333 E.01815
; LINE_WIDTH: 0.443345
G1 X119.8 Y133.402 E.00225
; LINE_WIDTH: 0.53874
G1 X119.8 Y133.471 E.00278
G1 X119.609 Y133.633 E.01013
G1 X119.694 Y133.868 E.01011
G1 X120.306 Y133.868 E.02471
G1 X120.391 Y133.633 E.01011
G1 X120.2 Y133.471 E.01013
; LINE_WIDTH: 0.540733
G1 X120.2 Y133.402 E.00279
; LINE_WIDTH: 0.492039
G1 X120.2 Y133.333 E.00252
; LINE_WIDTH: 0.443345
G1 X120.184 Y132.729 E.01971
; LINE_WIDTH: 0.39859
G2 X120.16 Y131.965 I-14.539 J.079 E.02215
G1 X119.9 Y131.965 E.00753
G1 X120 Y131.593 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.598447
G1 F1200
G1 X120 Y131.273 E.01451
; LINE_WIDTH: 0.54995
G1 X120 Y130.952 E.01325
; LINE_WIDTH: 0.501452
G1 X120 Y130.632 E.01198
; LINE_WIDTH: 0.452955
G1 X120 Y130.311 E.01071
; LINE_WIDTH: 0.404457
G1 X120 Y129.99 E.00945
; LINE_WIDTH: 0.35596
G1 X120 Y129.67 E.00818
; LINE_WIDTH: 0.307463
G1 X120 Y129.349 E.00691
; LINE_WIDTH: 0.258965
G1 X120 Y129.028 E.00564
; LINE_WIDTH: 0.210468
G1 X120 Y128.708 E.00438
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120 Y129.028 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/25
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
G3 Z3.8 I-1.215 J-.075 P1  F30000
G1 X118.676 Y150.592 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X118.816 Y148.967 E.05411
G1 X119.371 Y148.967 E.01841
G1 X119.517 Y150.672 E.05676
G3 X120.365 Y151.289 I-2.071 J3.738 E.03487
G1 X120.715 Y151.566 E.01481
G1 X120.658 Y151.73 E.00576
G1 X117.529 Y151.73 E.10381
G1 X117.471 Y151.566 E.00576
G2 X118.183 Y150.984 I-43.883 J-54.386 E.03051
G1 X118.669 Y150.672 E.01915
G1 X118.671 Y150.652 E.00066
G1 X118.236 Y150.484 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X118.295 Y150.446 E.00214
G1 X118.45 Y148.647 E.0555
G1 X118.792 Y146.338 E.07171
G3 X119.059 Y145.522 I17.701 J5.322 E.02639
G1 X119.128 Y145.522 E.00212
G1 X119.343 Y146.17 E.02098
G1 X119.394 Y146.338 E.00541
G1 X119.737 Y148.647 E.07171
G1 X119.891 Y150.446 E.0555
G3 X120.617 Y150.988 I-2.002 J3.438 E.0279
G3 X121.15 Y151.421 I-2.209 J3.263 E.02112
G1 X121.17 Y152.122 E.02155
G1 X117.016 Y152.122 E.12764
G1 X117.036 Y151.421 E.02155
G3 X117.956 Y150.664 I19.655 J22.935 E.03659
G1 X118.186 Y150.516 E.00841
M204 S10000
G1 X118.511 Y151.288 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.136476
G1 F1200
G1 X117.901 Y151.51 E.00495
G1 X117.25 Y151.593 F30000
; LINE_WIDTH: 0.140208
G1 F1200
G1 X117.275 Y151.759 E.00134
; LINE_WIDTH: 0.183495
G1 X117.301 Y151.926 E.00193
G1 X119.108 Y151.047 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1200
G1 X118.78 Y151.376 E.01427
M204 S10000
G1 X119.267 Y151.527 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.295776
G1 F1200
G1 X119.369 Y151.115 E.00873
; LINE_WIDTH: 0.329517
G1 X119.273 Y151.103 E.00227
; LINE_WIDTH: 0.28834
G1 X119.176 Y151.091 E.00195
G1 X119.316 Y150.707 F30000
; LINE_WIDTH: 0.311502
G1 F1200
G1 X119.242 Y150.619 E.00252
; LINE_WIDTH: 0.354783
G1 X119.167 Y150.53 E.00293
; LINE_WIDTH: 0.398064
G1 X119.093 Y150.442 E.00334
; LINE_WIDTH: 0.441345
G1 X119.093 Y150.188 E.00826
; LINE_WIDTH: 0.401169
G1 X119.093 Y149.934 E.00742
; LINE_WIDTH: 0.360992
G1 X119.093 Y149.679 E.00659
; LINE_WIDTH: 0.320816
G1 X119.093 Y149.425 E.00576
; LINE_WIDTH: 0.28064
G1 X119.093 Y149.171 E.00493
; WIPE_START
G1 F24000
G1 X119.093 Y149.425 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.18 J.296 P1  F30000
G1 X119.439 Y148.05 Z4
G1 Z3.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1200
G1 X118.744 Y148.745 E.03017
G1 X118.721 Y148.235
G1 X119.37 Y147.586 E.0282
G1 X119.301 Y147.122
G1 X118.813 Y147.609 E.02117
M204 S10000
M73 P93 R0
G1 X119.305 Y147.024 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.188392
G1 F1200
G1 X119.26 Y146.979 E.00076
; LINE_WIDTH: 0.227799
G1 X119.215 Y146.933 E.00096
; LINE_WIDTH: 0.267207
G1 X119.17 Y146.888 E.00117
; LINE_WIDTH: 0.306614
G1 X119.125 Y146.843 E.00137
; LINE_WIDTH: 0.368064
G1 X119.072 Y146.855 E.00145
G1 X118.846 Y147.261 E.0123
G1 X119.093 Y146.684 F30000
; LINE_WIDTH: 0.286572
G1 F1200
G3 X119.117 Y146.112 I3.605 J-.139 E.01138
; WIPE_START
G1 F24000
G1 X119.093 Y146.684 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.207 J.153 P1  F30000
G1 X119.676 Y151.288 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.134622
G1 F1200
G1 X120.285 Y151.51 E.00485
G1 X120.937 Y151.593 F30000
; LINE_WIDTH: 0.140208
G1 F1200
G1 X120.911 Y151.759 E.00134
; LINE_WIDTH: 0.183495
G1 X120.885 Y151.926 E.00193
; WIPE_START
G1 F24000
G1 X120.911 Y151.759 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.179 J.302 P1  F30000
G1 X125.656 Y133.219 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.656 Y132.839 E.01168
G1 X128.236 Y132.839 E.07928
G1 X128.236 Y133.219 E.01168
G1 X125.716 Y133.219 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X125.656 Y132.839 E-.14619
G1 X127.272 Y132.839 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.112 J-.493 P1  F30000
G1 X125.21 Y128.19 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X125.21 Y127.81 E.01168
G1 X127.79 Y127.81 E.07928
G1 X127.79 Y128.19 E.01168
G1 X125.27 Y128.19 E.07743
M204 S10000
; WIPE_START
G1 F24000
G1 X125.21 Y127.81 E-.14619
G1 X126.825 Y127.81 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.724 J-.978 P1  F30000
G1 X119.583 Y133.167 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X119.723 Y131.542 E.05411
G1 X120.277 Y131.542 E.01841
G1 X120.424 Y133.247 E.05676
G3 X121.272 Y133.864 I-2.071 J3.738 E.03487
G1 X121.622 Y134.141 E.01481
G1 X121.565 Y134.305 E.00576
G1 X118.435 Y134.305 E.10381
G1 X118.378 Y134.141 E.00576
G2 X119.09 Y133.559 I-43.883 J-54.386 E.03051
G1 X119.576 Y133.247 E.01915
G1 X119.578 Y133.227 E.00066
G1 X119.143 Y133.059 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X119.202 Y133.021 E.00214
G1 X119.357 Y131.222 E.0555
G1 X119.699 Y128.913 E.07171
G3 X119.965 Y128.097 I17.701 J5.322 E.02639
G1 X120.035 Y128.097 E.00212
G1 X120.249 Y128.745 E.02098
G1 X120.301 Y128.913 E.00541
G1 X120.643 Y131.222 E.07171
G1 X120.798 Y133.021 E.0555
G3 X121.524 Y133.563 I-2.002 J3.438 E.0279
G3 X122.057 Y133.996 I-2.209 J3.263 E.02112
G1 X122.077 Y134.697 E.02155
G1 X117.923 Y134.697 E.12764
G1 X117.943 Y133.996 E.02155
G3 X118.862 Y133.239 I19.655 J22.935 E.03659
G1 X119.093 Y133.091 E.00841
M204 S10000
G1 X119.418 Y133.863 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.136476
G1 F1200
G1 X118.808 Y134.085 E.00495
G1 X118.156 Y134.168 F30000
; LINE_WIDTH: 0.140208
G1 F1200
G1 X118.182 Y134.335 E.00134
; LINE_WIDTH: 0.183495
G1 X118.208 Y134.501 E.00193
G1 X120.015 Y133.622 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1200
G1 X119.686 Y133.951 E.01427
M204 S10000
G1 X120.174 Y134.102 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.295776
G1 F1200
G1 X120.276 Y133.69 E.00873
; LINE_WIDTH: 0.329517
G1 X120.179 Y133.678 E.00227
; LINE_WIDTH: 0.28834
G1 X120.083 Y133.666 E.00195
G1 X120.223 Y133.282 F30000
; LINE_WIDTH: 0.311502
G1 F1200
G1 X120.148 Y133.194 E.00252
; LINE_WIDTH: 0.354783
G1 X120.074 Y133.105 E.00293
; LINE_WIDTH: 0.398064
G1 X120 Y133.017 E.00334
; LINE_WIDTH: 0.441345
G1 X120 Y132.763 E.00826
; LINE_WIDTH: 0.401169
G1 X120 Y132.509 E.00742
; LINE_WIDTH: 0.360992
G1 X120 Y132.254 E.00659
; LINE_WIDTH: 0.320816
G1 X120 Y132 E.00576
; LINE_WIDTH: 0.28064
G1 X120 Y131.746 E.00493
; WIPE_START
G1 F24000
G1 X120 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.18 J.296 P1  F30000
G1 X120.345 Y130.625 Z4
G1 Z3.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1200
G1 X119.651 Y131.32 E.03017
G1 X119.627 Y130.81
G1 X120.276 Y130.161 E.0282
G1 X120.207 Y129.697
G1 X119.72 Y130.184 E.02117
M204 S10000
G1 X120.212 Y129.599 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.188392
G1 F1200
G1 X120.167 Y129.554 E.00076
; LINE_WIDTH: 0.227799
G1 X120.122 Y129.508 E.00096
; LINE_WIDTH: 0.267207
G1 X120.077 Y129.463 E.00117
; LINE_WIDTH: 0.306614
G1 X120.032 Y129.418 E.00137
; LINE_WIDTH: 0.368064
G1 X119.979 Y129.43 E.00145
G1 X119.753 Y129.836 E.0123
G1 X120 Y129.259 F30000
; LINE_WIDTH: 0.286572
G1 F1200
G3 X120.023 Y128.687 I3.605 J-.139 E.01138
; WIPE_START
G1 F24000
G1 X120 Y129.259 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.207 J.153 P1  F30000
G1 X120.582 Y133.863 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.134622
G1 F1200
G1 X121.192 Y134.085 E.00485
G1 X121.844 Y134.168 F30000
; LINE_WIDTH: 0.140208
G1 F1200
G1 X121.818 Y134.335 E.00134
; LINE_WIDTH: 0.183495
G1 X121.792 Y134.501 E.00193
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X121.818 Y134.335 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/25
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
G3 Z4 I-1.195 J-.229 P1  F30000
G1 X118.535 Y151.497 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X119.025 Y151.389 E.01664
G1 X119.162 Y151.389 E.00454
G1 X119.652 Y151.497 E.01664
G1 X119.628 Y151.715 E.00727
G1 X118.559 Y151.715 E.03547
G1 X118.541 Y151.557 E.00528
G1 X118.097 Y150.705 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X118.32 Y150.563 E.00812
G1 X118.567 Y150.457 E.00826
G1 X118.775 Y149.04 E.044
G3 X119.069 Y148.099 I20.393 J5.863 E.03029
G1 X119.117 Y148.099 E.00146
G1 X119.202 Y148.357 E.00834
G1 X119.411 Y149.04 E.02195
G1 X119.62 Y150.457 E.044
G1 X119.867 Y150.563 E.00826
G3 X121.056 Y151.418 I-3.302 J5.847 E.04509
G1 X121.092 Y152.107 E.0212
G1 X117.095 Y152.107 E.12283
G1 X117.131 Y151.418 E.0212
G3 X117.707 Y150.954 I4.492 J4.992 E.02273
G1 X118.046 Y150.737 E.01238
M204 S10000
G1 X118.005 Y151.665 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.554738
G1 F1200
G1 X118.352 Y151.627 E.01457
G1 X118.005 Y151.665 F30000
; LINE_WIDTH: 0.511471
G1 F1200
G1 X117.657 Y151.703 E.01334
; LINE_WIDTH: 0.468203
G1 X117.31 Y151.741 E.01211
; WIPE_START
G1 F24000
G1 X117.657 Y151.703 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.095 J.53 P1  F30000
G1 X119.093 Y148.736 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.309238
G1 F1200
G1 X119.093 Y149.273 E.01166
; WIPE_START
G1 F24000
G1 X119.093 Y148.736 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.196 J.225 P1  F30000
G1 X119.385 Y150.287 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1200
G1 X118.876 Y149.779 E.02211
G1 X118.808 Y150.244
G1 X119.885 Y151.321 E.04681
G1 X119.201 Y151.17
G1 X118.67 Y150.638 E.02309
G1 X118.312 Y150.814
G1 X118.725 Y151.227 E.01796
M73 P94 R0
G1 X118.288 Y151.324
G1 X117.986 Y151.022 E.01312
M204 S10000
G1 X117.903 Y151.077 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0971491
G1 F1200
G2 X117.815 Y151.154 I.145 J.254 E.00052
G1 X117.826 Y151.182 E.00013
; LINE_WIDTH: 0.118971
G1 X117.903 Y151.297 E.00085
; LINE_WIDTH: 0.156852
G1 X117.979 Y151.411 E.00128
G1 X119.929 Y151.35 F30000
; LINE_WIDTH: 0.27411
G1 F1200
G1 X120.017 Y151.309 E.00182
; LINE_WIDTH: 0.315158
G1 X120.104 Y151.268 E.00214
; LINE_WIDTH: 0.362516
G1 X120.196 Y151.209 E.00284
; LINE_WIDTH: 0.401126
G1 X120.153 Y151.153 E.00208
; LINE_WIDTH: 0.351681
G1 X120.11 Y151.096 E.00179
; LINE_WIDTH: 0.302233
G1 X119.987 Y150.997 E.00333
; LINE_WIDTH: 0.26806
G1 X119.864 Y150.898 E.00289
; LINE_WIDTH: 0.233886
G1 X119.741 Y150.799 E.00245
; LINE_WIDTH: 0.199711
G1 X119.654 Y150.74 E.00135
; LINE_WIDTH: 0.162531
G1 X119.566 Y150.681 E.00103
; LINE_WIDTH: 0.12535
G1 X119.478 Y150.621 E.00071
G1 X119.835 Y151.627 F30000
; LINE_WIDTH: 0.51147
G1 F1200
G1 X120.182 Y151.665 E.01334
; LINE_WIDTH: 0.468203
G1 X120.529 Y151.703 E.01211
; LINE_WIDTH: 0.424936
G1 X120.876 Y151.741 E.01087
; WIPE_START
G1 F24000
G1 X120.529 Y151.703 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.173 J.325 P1  F30000
G1 X125.656 Y133.219 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.656 Y132.839 E.01168
G1 X127.836 Y132.839 E.06699
G1 X127.836 Y133.219 E.01168
G1 X125.716 Y133.219 E.06514
M204 S10000
; WIPE_START
G1 F24000
G1 X125.656 Y132.839 E-.14619
G1 X127.272 Y132.839 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.112 J-.493 P1  F30000
G1 X125.21 Y128.19 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X125.21 Y127.81 E.01168
G1 X127.39 Y127.81 E.06699
G1 X127.39 Y128.19 E.01168
G1 X125.27 Y128.19 E.06514
M204 S10000
; WIPE_START
G1 F24000
G1 X125.21 Y127.81 E-.14619
G1 X126.825 Y127.81 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.787 J-.928 P1  F30000
G1 X119.442 Y134.072 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X119.932 Y133.964 E.01664
G1 X120.068 Y133.964 E.00454
G1 X120.558 Y134.072 E.01664
G1 X120.535 Y134.29 E.00727
G1 X119.465 Y134.29 E.03547
G1 X119.448 Y134.132 E.00528
G1 X119.004 Y133.28 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X119.227 Y133.138 E.00812
G1 X119.474 Y133.032 E.00826
G1 X119.682 Y131.615 E.044
G3 X119.976 Y130.674 I20.393 J5.863 E.03029
G1 X120.024 Y130.674 E.00146
G1 X120.109 Y130.932 E.00834
G1 X120.318 Y131.615 E.02195
G1 X120.526 Y133.032 E.044
G1 X120.773 Y133.138 E.00826
G3 X121.962 Y133.993 I-3.302 J5.847 E.04509
G1 X121.999 Y134.682 E.0212
G1 X118.001 Y134.682 E.12283
G1 X118.038 Y133.993 E.0212
G3 X118.614 Y133.529 I4.492 J4.992 E.02273
G1 X118.953 Y133.312 E.01238
M204 S10000
G1 X118.911 Y134.24 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.554738
G1 F1200
G1 X119.259 Y134.202 E.01457
G1 X118.911 Y134.24 F30000
; LINE_WIDTH: 0.511471
G1 F1200
G1 X118.564 Y134.278 E.01334
; LINE_WIDTH: 0.468203
G1 X118.217 Y134.316 E.01211
; WIPE_START
G1 F24000
G1 X118.564 Y134.278 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.095 J.53 P1  F30000
G1 X120 Y131.311 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.309238
G1 F1200
G1 X120 Y131.848 E.01166
; WIPE_START
G1 F24000
G1 X120 Y131.311 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.196 J.225 P1  F30000
G1 X120.292 Y132.862 Z4.2
G1 Z3.8
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1200
G1 X119.783 Y132.354 E.02211
G1 X119.715 Y132.819
G1 X120.792 Y133.896 E.04681
G1 X120.108 Y133.745
G1 X119.576 Y133.213 E.02309
G1 X119.219 Y133.389
G1 X119.632 Y133.802 E.01796
G1 X119.195 Y133.899
G1 X118.893 Y133.597 E.01312
M204 S10000
G1 X118.81 Y133.652 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0971491
G1 F1200
G2 X118.722 Y133.729 I.145 J.254 E.00052
G1 X118.733 Y133.757 E.00013
; LINE_WIDTH: 0.118971
G1 X118.809 Y133.872 E.00085
; LINE_WIDTH: 0.156852
G1 X118.886 Y133.986 E.00128
G1 X120.836 Y133.925 F30000
; LINE_WIDTH: 0.27411
G1 F1200
G1 X120.923 Y133.884 E.00182
; LINE_WIDTH: 0.315158
G1 X121.011 Y133.843 E.00214
; LINE_WIDTH: 0.362516
G1 X121.103 Y133.785 E.00284
; LINE_WIDTH: 0.401126
G1 X121.06 Y133.728 E.00208
; LINE_WIDTH: 0.351681
G1 X121.017 Y133.671 E.00179
; LINE_WIDTH: 0.302233
G1 X120.894 Y133.572 E.00333
; LINE_WIDTH: 0.26806
G1 X120.771 Y133.473 E.00289
; LINE_WIDTH: 0.233886
G1 X120.648 Y133.375 E.00245
; LINE_WIDTH: 0.199711
G1 X120.56 Y133.315 E.00135
; LINE_WIDTH: 0.162531
G1 X120.473 Y133.256 E.00103
; LINE_WIDTH: 0.12535
G1 X120.385 Y133.196 E.00071
G1 X120.741 Y134.202 F30000
; LINE_WIDTH: 0.51147
G1 F1200
G1 X121.089 Y134.24 E.01334
; LINE_WIDTH: 0.468203
G1 X121.436 Y134.278 E.01211
; LINE_WIDTH: 0.424936
G1 X121.783 Y134.316 E.01087
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X121.436 Y134.278 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/25
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
G3 Z4.2 I-1.193 J-.238 P1  F30000
G1 X118.033 Y151.341 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X118.448 Y151.083 E.01621
G3 X119.432 Y150.961 I.644 J1.171 E.03368
G3 X120.095 Y151.31 I-.686 J2.106 E.02496
G3 X120.446 Y151.523 I-3.707 J6.532 E.01362
G1 X120.395 Y151.7 E.00611
G1 X117.791 Y151.7 E.08638
G1 X117.741 Y151.523 E.00611
G1 X117.982 Y151.372 E.00944
G1 X117.828 Y151.012 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X117.887 Y150.976 E.00213
G3 X118.93 Y150.521 I1.522 J2.066 E.03526
G3 X119.538 Y150.583 I.163 J1.407 E.01891
G3 X120.299 Y150.976 I-.78 J2.448 E.02645
G3 X120.917 Y151.402 I-1.581 J2.951 E.02312
G1 X120.953 Y152.092 E.02121
G1 X117.233 Y152.092 E.11432
G1 X117.269 Y151.402 E.02121
G3 X117.535 Y151.194 I2.199 J2.525 E.01038
G1 X117.777 Y151.043 E.00875
M204 S10000
G1 X117.492 Y151.475 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.165838
G1 F1200
G1 X117.516 Y151.685 E.00212
; LINE_WIDTH: 0.214238
G1 X117.54 Y151.896 E.00296
G1 X118.307 Y151.414 F30000
; LINE_WIDTH: 0.387246
G1 F1200
G1 X118.856 Y151.324 E.01559
; LINE_WIDTH: 0.410403
G3 X119.331 Y151.324 I.238 J1.607 E.01429
; LINE_WIDTH: 0.361046
G1 X119.879 Y151.414 E.0144
G1 X120.695 Y151.475 F30000
; LINE_WIDTH: 0.165837
G1 F1200
G1 X120.671 Y151.685 E.00212
; LINE_WIDTH: 0.214237
G1 X120.647 Y151.896 E.00296
; WIPE_START
G1 F24000
G1 X120.671 Y151.685 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.175 J.317 P1  F30000
G1 X125.656 Y133.219 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.656 Y132.839 E.01168
G1 X127.436 Y132.839 E.05469
G1 X127.436 Y133.219 E.01168
G1 X125.716 Y133.219 E.05285
M204 S10000
; WIPE_START
G1 F24000
G1 X125.656 Y132.839 E-.14619
G1 X127.272 Y132.839 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.112 J-.493 P1  F30000
G1 X125.21 Y128.19 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X125.21 Y127.81 E.01168
G1 X126.99 Y127.81 E.05469
G1 X126.99 Y128.19 E.01168
G1 X125.27 Y128.19 E.05285
M204 S10000
; WIPE_START
G1 F24000
G1 X125.21 Y127.81 E-.14619
G1 X126.825 Y127.81 E-.61381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.745 J-.962 P1  F30000
G1 X118.94 Y133.916 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X119.355 Y133.658 E.01621
G3 X120.339 Y133.536 I.644 J1.171 E.03368
G3 X121.001 Y133.885 I-.686 J2.106 E.02496
G3 X121.353 Y134.098 I-3.707 J6.532 E.01362
G1 X121.302 Y134.275 E.00611
G1 X118.698 Y134.275 E.08638
G1 X118.647 Y134.098 E.00611
G1 X118.889 Y133.948 E.00944
G1 X118.735 Y133.587 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X118.794 Y133.551 E.00213
G3 X119.837 Y133.096 I1.522 J2.066 E.03526
G3 X120.444 Y133.158 I.163 J1.407 E.01891
M73 P95 R0
G3 X121.206 Y133.551 I-.78 J2.448 E.02645
G3 X121.824 Y133.977 I-1.581 J2.951 E.02312
G1 X121.86 Y134.667 E.02121
G1 X118.14 Y134.667 E.11432
G1 X118.176 Y133.977 E.02121
G3 X118.442 Y133.769 I2.199 J2.525 E.01038
G1 X118.684 Y133.618 E.00875
M204 S10000
G1 X118.398 Y134.05 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.165838
G1 F1200
G1 X118.422 Y134.26 E.00212
; LINE_WIDTH: 0.214238
G1 X118.446 Y134.471 E.00296
G1 X119.214 Y133.989 F30000
; LINE_WIDTH: 0.387246
G1 F1200
G1 X119.762 Y133.899 E.01559
; LINE_WIDTH: 0.410403
G3 X120.238 Y133.899 I.238 J1.607 E.01429
; LINE_WIDTH: 0.361046
G1 X120.786 Y133.989 E.0144
G1 X121.602 Y134.05 F30000
; LINE_WIDTH: 0.165837
G1 F1200
G1 X121.578 Y134.26 E.00212
; LINE_WIDTH: 0.214237
G1 X121.554 Y134.471 E.00296
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X121.578 Y134.26 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/25
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
G3 Z4.4 I-1.191 J-.249 P1  F30000
G1 X117.975 Y151.504 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X118.908 Y151.092 I1.523 J2.184 E.03406
G1 X119.278 Y151.092 E.01226
G1 X119.371 Y151.112 E.00315
G1 X119.794 Y151.256 E.01483
G2 X120.211 Y151.504 I3.608 J-5.59 E.01611
G1 X120.162 Y151.684 E.00619
G1 X118.024 Y151.684 E.07093
G1 X117.991 Y151.562 E.0042
G1 X117.407 Y151.395 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X118.25 Y150.89 I8.88 J13.875 E.03019
G3 X118.866 Y150.7 I1.172 J2.699 E.01984
G1 X119.321 Y150.7 E.01398
G1 X119.476 Y150.734 E.0049
G3 X119.977 Y150.908 I-.856 J3.281 E.01631
G3 X120.779 Y151.395 I-40.373 J67.371 E.02883
G1 X120.815 Y152.076 E.02097
G1 X117.371 Y152.076 E.10581
G1 X117.404 Y151.455 E.01913
M204 S10000
; WIPE_START
G1 F24000
G1 X118.25 Y150.89 E-.38645
G1 X118.71 Y150.734 E-.18463
G1 X118.866 Y150.7 E-.06054
G1 X119.204 Y150.7 E-.12838
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.892 J-.828 P1  F30000
G1 X118.5 Y151.458 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.137319
G1 F1200
G1 X118.631 Y151.436 E.00102
; LINE_WIDTH: 0.177719
G1 X118.763 Y151.415 E.00146
; LINE_WIDTH: 0.218118
G1 X118.894 Y151.393 E.0019
; LINE_WIDTH: 0.227106
G3 X119.292 Y151.393 I.199 J3.89 E.00598
; LINE_WIDTH: 0.177719
G1 X119.424 Y151.415 E.00146
; LINE_WIDTH: 0.13732
G1 X119.555 Y151.436 E.00102
; LINE_WIDTH: 0.0969204
G1 X119.686 Y151.458 E.00059
; WIPE_START
G1 F24000
G1 X119.555 Y151.436 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.154 J.386 P1  F30000
G1 X125.656 Y133.219 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.656 Y132.839 E.01168
G1 X127.036 Y132.839 E.0424
G1 X127.036 Y133.219 E.01168
G1 X125.716 Y133.219 E.04056
M204 S10000
; WIPE_START
G1 F24000
G1 X125.656 Y132.839 E-.14619
G1 X127.036 Y132.839 E-.5244
G1 X127.036 Y133.074 E-.08941
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.14 J-.426 P1  F30000
G1 X125.21 Y128.19 Z4.6
G1 Z4.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X125.21 Y127.81 E.01168
G1 X126.59 Y127.81 E.0424
G1 X126.59 Y128.19 E.01168
G1 X125.27 Y128.19 E.04056
M204 S10000
; WIPE_START
G1 F24000
G1 X125.21 Y127.81 E-.14619
G1 X126.59 Y127.81 E-.5244
G1 X126.59 Y128.045 E-.08941
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.75 J-.958 P1  F30000
G1 X118.882 Y134.079 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G3 X119.815 Y133.667 I1.523 J2.184 E.03406
G1 X120.185 Y133.667 E.01226
G1 X120.278 Y133.687 E.00315
G1 X120.701 Y133.831 E.01483
G2 X121.118 Y134.079 I3.608 J-5.59 E.01611
G1 X121.069 Y134.259 E.00619
G1 X118.931 Y134.259 E.07093
G1 X118.898 Y134.137 E.0042
G1 X118.314 Y133.97 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X119.157 Y133.465 I8.88 J13.875 E.03019
G3 X119.772 Y133.275 I1.172 J2.699 E.01984
G1 X120.228 Y133.275 E.01398
G1 X120.383 Y133.309 E.0049
G3 X120.884 Y133.483 I-.856 J3.281 E.01631
G3 X121.686 Y133.97 I-40.373 J67.371 E.02883
G1 X121.722 Y134.651 E.02097
G1 X118.278 Y134.651 E.10581
G1 X118.311 Y134.03 E.01913
M204 S10000
; WIPE_START
G1 F24000
G1 X119.157 Y133.465 E-.38645
G1 X119.617 Y133.309 E-.18463
G1 X119.772 Y133.275 E-.06054
G1 X120.11 Y133.275 E-.12838
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.892 J-.828 P1  F30000
G1 X119.407 Y134.033 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.137319
G1 F1200
G1 X119.538 Y134.011 E.00102
; LINE_WIDTH: 0.177719
G1 X119.67 Y133.99 E.00146
; LINE_WIDTH: 0.218118
G1 X119.801 Y133.968 E.0019
; LINE_WIDTH: 0.227106
G3 X120.199 Y133.968 I.199 J3.89 E.00598
; LINE_WIDTH: 0.177719
G1 X120.33 Y133.99 E.00146
; LINE_WIDTH: 0.13732
G1 X120.462 Y134.011 E.00102
; LINE_WIDTH: 0.0969204
G1 X120.593 Y134.033 E.00059
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.462 Y134.011 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/25
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
G3 Z4.6 I-1.207 J-.153 P1  F30000
G1 X118.252 Y151.461 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G2 X118.856 Y151.27 I-2.591 J-9.272 E.02098
G1 X119.331 Y151.27 E.01577
G1 X119.535 Y151.34 E.00714
G1 X119.934 Y151.461 E.01384
G1 X119.903 Y151.669 E.00699
G1 X118.283 Y151.669 E.05373
G1 X118.261 Y151.52 E.005
G1 X117.643 Y151.374 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X118.031 Y151.139 E.01395
G3 X118.532 Y150.966 I1.014 J2.134 E.01633
G3 X118.801 Y150.878 I.533 J1.178 E.00872
G1 X119.415 Y150.885 E.01886
G3 X120.155 Y151.141 I-2.498 J8.406 E.02406
G3 X120.569 Y151.39 I-4.336 J7.702 E.01485
G1 X120.627 Y152.061 E.02071
G1 X117.56 Y152.061 E.09424
G1 X117.615 Y151.42 E.01977
M204 S10000
; WIPE_START
G1 F24000
G1 X118.031 Y151.139 E-.1908
G1 X118.191 Y151.069 E-.06636
G1 X118.532 Y150.966 E-.13539
G1 X118.801 Y150.878 E-.10764
G1 X119.415 Y150.885 E-.23324
G1 X119.482 Y150.906 E-.02657
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.149 J.401 P1  F30000
G1 X125.656 Y133.219 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X125.656 Y132.839 E.01168
G1 X126.636 Y132.839 E.03011
G1 X126.636 Y133.219 E.01168
G1 X125.716 Y133.219 E.02827
M204 S10000
; WIPE_START
G1 F24000
G1 X125.656 Y132.839 E-.14619
G1 X126.636 Y132.839 E-.3724
G1 X126.636 Y133.219 E-.1444
G1 X126.381 Y133.219 E-.09701
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.185 J-.276 P1  F30000
G1 X125.21 Y128.19 Z4.8
G1 Z4.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X125.21 Y127.81 E.01168
G1 X126.19 Y127.81 E.03011
G1 X126.19 Y128.19 E.01168
G1 X125.27 Y128.19 E.02827
M204 S10000
; WIPE_START
G1 F24000
G1 X125.21 Y127.81 E-.14619
G1 X126.19 Y127.81 E-.3724
G1 X126.19 Y128.19 E-.1444
G1 X125.935 Y128.19 E-.09701
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.795 J-.921 P1  F30000
G1 X119.159 Y134.036 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G2 X119.762 Y133.845 I-2.591 J-9.272 E.02098
G1 X120.238 Y133.845 E.01577
G1 X120.441 Y133.915 E.00714
G1 X120.841 Y134.036 E.01384
G1 X120.81 Y134.244 E.00699
G1 X119.19 Y134.244 E.05373
G1 X119.168 Y134.095 E.005
G1 X118.549 Y133.95 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P96 R0
G1 F1200
G1 X118.937 Y133.714 E.01395
G3 X119.439 Y133.541 I1.014 J2.134 E.01633
G3 X119.708 Y133.453 I.533 J1.178 E.00872
G1 X120.322 Y133.46 E.01886
G3 X121.061 Y133.716 I-2.498 J8.406 E.02406
G3 X121.476 Y133.965 I-4.336 J7.702 E.01485
G1 X121.534 Y134.636 E.02071
G1 X118.466 Y134.636 E.09424
G1 X118.522 Y133.995 E.01977
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.937 Y133.714 E-.1908
G1 X119.098 Y133.645 E-.06636
G1 X119.439 Y133.541 E-.13539
G1 X119.708 Y133.453 E-.10764
G1 X120.322 Y133.46 E-.23324
G1 X120.388 Y133.481 E-.02657
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/25
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
G3 Z4.8 I-1.205 J-.171 P1  F30000
G1 X117.843 Y151.383 Z4.8
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X118.778 Y151.051 I2.025 J4.224 E.03054
G1 X119.409 Y151.051 E.01938
G1 X119.519 Y151.077 E.00347
G3 X120.343 Y151.383 I-.767 J3.328 E.02711
G1 X120.4 Y152.046 E.02044
G1 X117.786 Y152.046 E.08033
G1 X117.838 Y151.443 E.01859
M204 S10000
G1 X118.015 Y151.669 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.553922
G1 F1200
G1 X118.275 Y151.63 E.01093
; LINE_WIDTH: 0.59504
G1 X118.535 Y151.592 E.01181
; LINE_WIDTH: 0.636158
G1 X118.794 Y151.553 E.01269
; LINE_WIDTH: 0.644569
G1 X119.392 Y151.553 E.0293
; LINE_WIDTH: 0.59504
G1 X119.652 Y151.592 E.01181
; LINE_WIDTH: 0.553921
G1 X119.911 Y151.63 E.01093
; LINE_WIDTH: 0.512802
G1 X120.171 Y151.669 E.01005
; WIPE_START
G1 F24000
G1 X119.911 Y151.63 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.162 J.362 P1  F30000
G1 X125.656 Y133.219 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.656 Y132.839 E.01168
G1 X126.236 Y132.839 E.01782
G1 X126.236 Y133.219 E.01168
G1 X125.716 Y133.219 E.01598
M204 S10000
; WIPE_START
G1 F24000
G1 X125.656 Y132.839 E-.1568
G1 X126.236 Y132.839 E-.23639
G1 X126.236 Y133.219 E-.15488
G1 X125.716 Y133.219 E-.21194
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.211 J-.122 P1  F30000
G1 X125.21 Y128.19 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X125.21 Y127.81 E.01168
G1 X125.79 Y127.81 E.01782
G1 X125.79 Y128.19 E.01168
G1 X125.27 Y128.19 E.01598
M204 S10000
; WIPE_START
G1 F24000
G1 X125.21 Y127.81 E-.1568
G1 X125.79 Y127.81 E-.23639
G1 X125.79 Y128.19 E-.15488
G1 X125.27 Y128.19 E-.21194
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.806 J-.911 P1  F30000
G1 X118.75 Y133.958 Z5
G1 Z4.6
G1 E.8 F1800
M204 S5000
G1 F1200
G3 X119.685 Y133.626 I2.025 J4.224 E.03054
G1 X120.315 Y133.626 E.01938
G1 X120.425 Y133.652 E.00347
G3 X121.25 Y133.958 I-.767 J3.328 E.02711
G1 X121.307 Y134.621 E.02044
G1 X118.693 Y134.621 E.08033
G1 X118.745 Y134.018 E.01859
M204 S10000
G1 X118.922 Y134.244 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.553922
G1 F1200
G1 X119.182 Y134.205 E.01093
; LINE_WIDTH: 0.59504
G1 X119.441 Y134.167 E.01181
; LINE_WIDTH: 0.636158
G1 X119.701 Y134.128 E.01269
; LINE_WIDTH: 0.644569
G1 X120.299 Y134.128 E.0293
; LINE_WIDTH: 0.59504
G1 X120.559 Y134.167 E.01181
; LINE_WIDTH: 0.553921
G1 X120.818 Y134.205 E.01093
; LINE_WIDTH: 0.512802
G1 X121.078 Y134.244 E.01005
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.818 Y134.205 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/25
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
G3 Z5 I-1.203 J-.184 P1  F30000
G1 X118.197 Y151.381 Z5
G1 Z4.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G3 X118.795 Y151.219 I.957 J2.351 E.01908
G1 X119.392 Y151.219 E.01834
G1 X119.785 Y151.309 E.01241
G3 X119.99 Y151.381 I-.173 J.822 E.00667
G1 X120.084 Y152.031 E.02017
G1 X118.102 Y152.031 E.06089
G1 X118.188 Y151.44 E.01833
M204 S10000
G1 X118.351 Y151.68 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.427349
G1 F1200
G1 X118.596 Y151.652 E.00771
; LINE_WIDTH: 0.462412
G1 X118.841 Y151.625 E.00842
; LINE_WIDTH: 0.450923
G3 X119.59 Y151.652 I.253 J3.326 E.025
; LINE_WIDTH: 0.392284
G1 X119.835 Y151.68 E.00701
; WIPE_START
G1 F24000
G1 X119.59 Y151.652 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.156 J.38 P1  F30000
G1 X125.636 Y133.24 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.37852
G1 F1200
G1 X125.636 Y132.818 E.01153
G1 X125.857 Y132.818 E.00606
G1 X125.857 Y133.24 E.01153
G1 X125.696 Y133.24 E.00442
M204 S10000
; WIPE_START
G1 F24000
G1 X125.636 Y132.818 E-.26302
G1 X125.857 Y132.818 E-.13683
G1 X125.857 Y133.24 E-.26039
G1 X125.696 Y133.24 E-.09976
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.211 J-.122 P1  F30000
G1 X125.189 Y128.211 Z5.2
G1 Z4.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X125.189 Y127.789 E.01153
G1 X125.411 Y127.789 E.00606
G1 X125.411 Y128.211 E.01153
G1 X125.249 Y128.211 E.00442
M204 S10000
; WIPE_START
G1 F24000
G1 X125.189 Y127.789 E-.26302
G1 X125.411 Y127.789 E-.13683
G1 X125.411 Y128.211 E-.26039
G1 X125.249 Y128.211 E-.09976
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.831 J-.889 P1  F30000
G1 X119.104 Y133.956 Z5.2
M73 P97 R0
G1 Z4.8
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G3 X119.701 Y133.794 I.957 J2.351 E.01908
G1 X120.299 Y133.794 E.01834
G1 X120.692 Y133.884 E.01241
G3 X120.896 Y133.956 I-.173 J.822 E.00667
G1 X120.991 Y134.606 E.02017
G1 X119.009 Y134.606 E.06089
G1 X119.095 Y134.015 E.01833
M204 S10000
G1 X119.258 Y134.255 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.427349
G1 F1200
G1 X119.503 Y134.227 E.00771
; LINE_WIDTH: 0.462412
G1 X119.747 Y134.2 E.00842
; LINE_WIDTH: 0.450923
G3 X120.497 Y134.227 I.253 J3.326 E.025
; LINE_WIDTH: 0.392284
G1 X120.742 Y134.255 E.00701
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X120.497 Y134.227 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/25
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
G3 Z5.2 I-1.211 J-.123 P1  F30000
G1 X118.757 Y151.399 Z5.2
G1 Z5
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X118.812 Y151.386 E.00172
G1 X119.43 Y151.399 E.01899
G1 X119.62 Y152.015 E.01982
G1 X118.566 Y152.015 E.03237
G1 X118.739 Y151.456 E.01798
M204 S10000
; WIPE_START
G1 F24000
G1 X118.812 Y151.386 E-.03822
G1 X119.43 Y151.399 E-.23491
G1 X119.62 Y152.015 E-.24511
G1 X118.984 Y152.015 E-.24176
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.216 J.046 P1  F30000
G1 X119.664 Y133.974 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X119.718 Y133.961 E.00172
G1 X120.336 Y133.974 E.01899
G1 X120.527 Y134.59 E.01982
G1 X119.473 Y134.59 E.03237
G1 X119.646 Y134.031 E.01798
M204 S10000
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X119.718 Y133.961 E-.03822
G1 X120.336 Y133.974 E-.23491
G1 X120.527 Y134.59 E-.24511
G1 X119.891 Y134.59 E-.24176
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
G1 Z5.5 F900 ; lower z a little
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

    G1 Z105 F600
    G1 Z103

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

