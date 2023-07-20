; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 36m 27s; total estimated time: 42m 15s
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
M73 P0 R42
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
M73 P10 R37
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
M73 P11 R37
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
M73 P12 R37
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
    G29 A X70 Y100 I120 J60
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
G1 X70.879 Y102.591 F30000
G1 Z.4
M73 P12 R36
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G3 X75.011 Y98.857 I4.134 J.422 E.22731
G1 X75.498 Y98.857 E.01815
G1 X184.993 Y98.857 E4.07828
G3 X189.143 Y103.011 I-.005 J4.155 E.24284
G1 X189.143 Y152.989 E1.86152
G3 X184.989 Y157.143 I-4.156 J-.002 E.24297
G1 X75.011 Y157.143 E4.0963
G3 X70.857 Y152.989 I.002 J-4.156 E.24297
G1 X70.857 Y103.011 E1.86152
G3 X70.873 Y102.651 I4.156 J.002 E.01343
G1 X70.422 Y102.557 F30000
; FEATURE: Outer wall
G1 F3000
G1 X70.424 Y102.546 E.00042
M73 P13 R36
G3 X75.005 Y98.4 I4.59 J.468 E.25215
G1 X75.498 Y98.4 E.01836
G1 X184.999 Y98.4 E4.07849
G3 X189.6 Y103.005 I-.012 J4.614 E.26915
G1 X189.6 Y152.995 E1.86194
G3 X184.995 Y157.6 I-4.614 J-.009 E.26928
G1 X75.005 Y157.6 E4.09672
G3 X70.4 Y152.995 I.009 J-4.614 E.26928
G1 X70.4 Y103.005 E1.86194
G1 X70.419 Y102.617 E.01447
; WIPE_START
G1 F24000
G1 X70.424 Y102.546 E-.02707
G1 X70.489 Y102.103 E-.17024
G1 X70.599 Y101.662 E-.17281
G1 X70.749 Y101.243 E-.16897
G1 X70.945 Y100.829 E-.17408
G1 X71.008 Y100.723 E-.04682
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.013 J1.217 P1  F30000
G1 X186.759 Y99.458 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.501602
G1 F6300
G1 X187.783 Y100.483 E.05417
G3 X188.6 Y101.948 I-2.745 J2.49 E.06324
G1 X186.05 Y99.398 E.13479
G2 X185.262 Y99.259 I-1.094 J3.903 E.02993
G1 X188.742 Y102.738 E.1839
G1 X188.749 Y103.395 E.02453
G1 X184.6 Y99.246 E.21931
G1 X183.952 Y99.246 E.02425
G1 X188.749 Y104.043 E.2536
G1 X188.749 Y104.692 E.02425
G1 X183.303 Y99.246 E.28789
G1 X182.654 Y99.246 E.02425
G1 X188.749 Y105.341 E.32219
G1 X188.75 Y105.99 E.02425
G1 X182.006 Y99.246 E.35648
G1 X181.357 Y99.246 E.02425
G1 X188.75 Y106.638 E.39077
G1 X188.75 Y107.287 E.02425
G1 X180.708 Y99.246 E.42506
G1 X180.06 Y99.246 E.02425
G1 X188.75 Y107.936 E.45935
G1 X188.75 Y108.585 E.02425
G1 X179.411 Y99.246 E.49364
G1 X178.762 Y99.246 E.02425
G1 X188.75 Y109.233 E.52794
M73 P14 R36
G1 X188.75 Y109.882 E.02425
G1 X178.113 Y99.246 E.56223
G1 X177.465 Y99.246 E.02425
G1 X188.75 Y110.531 E.59652
G1 X188.75 Y111.18 E.02425
G1 X176.816 Y99.246 E.63081
G1 X176.167 Y99.246 E.02425
G1 X188.75 Y111.828 E.6651
G1 X188.75 Y112.477 E.02425
G1 X175.519 Y99.246 E.6994
G1 X174.87 Y99.246 E.02425
G1 X188.75 Y113.126 E.73369
G1 X188.75 Y113.775 E.02425
G1 X174.221 Y99.246 E.76798
G1 X173.573 Y99.246 E.02425
G1 X188.75 Y114.423 E.80227
G1 X188.75 Y115.072 E.02425
G1 X172.924 Y99.246 E.83656
G1 X172.275 Y99.246 E.02425
G1 X188.751 Y115.721 E.87085
G1 X188.751 Y116.37 E.02425
G1 X171.627 Y99.246 E.90515
G1 X170.978 Y99.246 E.02425
G1 X188.751 Y117.018 E.93944
G1 X188.751 Y117.667 E.02425
G1 X170.329 Y99.246 E.97373
G1 X169.681 Y99.246 E.02425
G1 X188.751 Y118.316 E1.00802
G1 X188.751 Y118.964 E.02425
G1 X169.032 Y99.246 E1.04231
G1 X168.383 Y99.246 E.02425
G1 X188.751 Y119.613 E1.0766
G1 X188.751 Y120.262 E.02425
G1 X167.735 Y99.246 E1.1109
G1 X167.086 Y99.246 E.02425
G1 X188.751 Y120.911 E1.14519
G1 X188.751 Y121.559 E.02425
G1 X166.437 Y99.246 E1.17948
G1 X165.789 Y99.246 E.02425
G1 X188.751 Y122.208 E1.21377
G1 X188.751 Y122.857 E.02425
G1 X165.14 Y99.246 E1.24806
G1 X164.491 Y99.246 E.02425
G1 X188.751 Y123.506 E1.28235
G1 X188.751 Y124.154 E.02425
G1 X163.843 Y99.246 E1.31665
G1 X163.194 Y99.246 E.02425
G1 X188.751 Y124.803 E1.35094
G1 X188.752 Y125.452 E.02425
G1 X162.545 Y99.246 E1.38523
G1 X161.897 Y99.246 E.02425
G1 X188.752 Y126.101 E1.41952
G1 X188.752 Y126.749 E.02425
G1 X161.248 Y99.246 E1.45381
G1 X160.599 Y99.246 E.02425
G1 X188.752 Y127.398 E1.4881
G1 X188.752 Y128.047 E.02425
G1 X159.951 Y99.246 E1.5224
G1 X159.302 Y99.246 E.02425
G1 X188.752 Y128.696 E1.55669
G1 X188.752 Y129.344 E.02425
G1 X158.653 Y99.246 E1.59098
G1 X158.005 Y99.246 E.02425
G1 X188.752 Y129.993 E1.62527
G1 X188.752 Y130.642 E.02425
G1 X157.356 Y99.246 E1.65956
G1 X156.707 Y99.246 E.02425
G1 X188.752 Y131.291 E1.69385
G1 X188.752 Y131.939 E.02425
G1 X156.059 Y99.246 E1.72815
G1 X155.41 Y99.246 E.02425
G1 X188.752 Y132.588 E1.76244
G1 X188.752 Y133.237 E.02425
G1 X154.761 Y99.246 E1.79673
G1 X154.113 Y99.246 E.02425
G1 X188.752 Y133.886 E1.83102
G1 X188.752 Y134.534 E.02425
G1 X153.464 Y99.246 E1.86531
G1 X152.815 Y99.246 E.02425
G1 X188.753 Y135.183 E1.89961
G1 X188.753 Y135.832 E.02425
G1 X152.166 Y99.246 E1.9339
G1 X151.518 Y99.246 E.02425
G1 X188.753 Y136.481 E1.96819
G1 X188.753 Y137.129 E.02425
G1 X150.869 Y99.246 E2.00248
G1 X150.22 Y99.246 E.02425
G1 X188.753 Y137.778 E2.03677
G1 X188.753 Y138.427 E.02425
G1 X149.572 Y99.246 E2.07106
G1 X148.923 Y99.246 E.02425
G1 X188.753 Y139.075 E2.10536
G1 X188.753 Y139.724 E.02425
G1 X148.274 Y99.246 E2.13965
M73 P14 R35
G1 X147.626 Y99.246 E.02425
G1 X188.753 Y140.373 E2.17394
G1 X188.753 Y141.022 E.02425
G1 X146.977 Y99.246 E2.20823
G1 X146.328 Y99.246 E.02425
G1 X188.753 Y141.67 E2.24252
G1 X188.753 Y142.319 E.02425
G1 X145.68 Y99.246 E2.27681
G1 X145.031 Y99.246 E.02425
G1 X188.753 Y142.968 E2.31111
G1 X188.753 Y143.617 E.02425
G1 X144.382 Y99.246 E2.3454
G1 X143.734 Y99.246 E.02425
G1 X188.754 Y144.265 E2.37969
G1 X188.754 Y144.914 E.02425
G1 X143.085 Y99.246 E2.41398
M73 P15 R35
G1 X142.436 Y99.246 E.02425
G1 X188.754 Y145.563 E2.44827
G1 X188.754 Y146.212 E.02425
G1 X141.788 Y99.246 E2.48256
G1 X141.139 Y99.246 E.02425
G1 X188.754 Y146.86 E2.51686
G1 X188.754 Y147.509 E.02425
G1 X140.49 Y99.246 E2.55115
G1 X139.842 Y99.246 E.02425
G1 X188.754 Y148.158 E2.58544
G1 X188.754 Y148.807 E.02425
G1 X139.193 Y99.246 E2.61973
G1 X138.544 Y99.246 E.02425
G1 X188.754 Y149.455 E2.65402
G1 X188.754 Y150.104 E.02425
G1 X137.896 Y99.246 E2.68831
G1 X137.247 Y99.246 E.02425
G1 X188.754 Y150.753 E2.72261
G1 X188.754 Y151.402 E.02425
G1 X136.598 Y99.246 E2.7569
G1 X135.95 Y99.246 E.02425
G1 X188.754 Y152.05 E2.79119
G1 X188.754 Y152.699 E.02425
G1 X135.301 Y99.246 E2.82548
G1 X134.652 Y99.246 E.02425
G1 X188.737 Y153.331 E2.85887
G3 X188.643 Y153.885 I-4.527 J-.484 E.02104
G1 X134.004 Y99.246 E2.88818
G1 X133.355 Y99.246 E.02425
G1 X188.482 Y154.373 E2.91396
G3 X188.274 Y154.814 I-1.59 J-.48 E.01828
G1 X132.706 Y99.246 E2.93726
G1 X132.058 Y99.246 E.02425
G1 X188.023 Y155.211 E2.95824
G1 X187.781 Y155.52 E.01469
G1 X187.731 Y155.568 E.00257
G1 X131.409 Y99.246 E2.97712
G1 X130.76 Y99.246 E.02425
G1 X187.399 Y155.884 E2.99384
G1 X187.021 Y156.155 E.01738
G1 X130.112 Y99.246 E3.00815
G1 X129.463 Y99.246 E.02425
G1 X186.601 Y156.384 E3.02027
G3 X186.135 Y156.567 I-.848 J-1.48 E.01878
G1 X128.814 Y99.246 E3.02992
G1 X128.166 Y99.246 E.02425
G1 X185.612 Y156.693 E3.03657
G3 X185.024 Y156.752 I-.535 J-2.345 E.02218
G1 X127.517 Y99.246 E3.03973
G1 X126.868 Y99.246 E.02425
G1 X184.377 Y156.754 E3.03984
G1 X183.728 Y156.754 E.02425
G1 X126.219 Y99.246 E3.03984
G1 X125.571 Y99.246 E.02425
G1 X183.08 Y156.754 E3.03984
G1 X182.431 Y156.754 E.02425
G1 X124.922 Y99.246 E3.03984
G1 X124.273 Y99.246 E.02425
G1 X181.782 Y156.754 E3.03984
G1 X181.134 Y156.754 E.02425
G1 X123.625 Y99.246 E3.03984
G1 X122.976 Y99.246 E.02425
G1 X180.485 Y156.754 E3.03984
G1 X179.836 Y156.754 E.02425
G1 X122.327 Y99.246 E3.03984
G1 X121.679 Y99.246 E.02425
G1 X179.188 Y156.754 E3.03984
G1 X178.539 Y156.754 E.02425
M73 P16 R35
G1 X121.03 Y99.246 E3.03984
G1 X120.381 Y99.246 E.02425
G1 X177.89 Y156.754 E3.03984
G1 X177.242 Y156.754 E.02425
G1 X119.733 Y99.246 E3.03984
G1 X119.084 Y99.246 E.02425
G1 X176.593 Y156.754 E3.03984
G1 X175.944 Y156.754 E.02425
G1 X118.435 Y99.246 E3.03984
G1 X117.787 Y99.246 E.02425
G1 X175.296 Y156.754 E3.03984
G1 X174.647 Y156.754 E.02425
G1 X117.138 Y99.246 E3.03984
G1 X116.489 Y99.246 E.02425
G1 X173.998 Y156.754 E3.03984
G1 X173.349 Y156.754 E.02425
G1 X115.841 Y99.246 E3.03984
G1 X115.192 Y99.246 E.02425
G1 X172.701 Y156.754 E3.03984
G1 X172.052 Y156.754 E.02425
G1 X114.543 Y99.246 E3.03984
G1 X113.895 Y99.246 E.02425
G1 X171.403 Y156.754 E3.03984
G1 X170.755 Y156.754 E.02425
G1 X113.246 Y99.246 E3.03984
G1 X112.597 Y99.246 E.02425
G1 X170.106 Y156.754 E3.03984
G1 X169.457 Y156.754 E.02425
G1 X111.949 Y99.246 E3.03984
G1 X111.3 Y99.246 E.02425
G1 X168.809 Y156.754 E3.03984
G1 X168.16 Y156.754 E.02425
G1 X110.651 Y99.246 E3.03984
G1 X110.003 Y99.246 E.02425
G1 X167.511 Y156.754 E3.03984
G1 X166.863 Y156.754 E.02425
G1 X109.354 Y99.246 E3.03984
G1 X108.705 Y99.246 E.02425
G1 X166.214 Y156.754 E3.03984
G1 X165.565 Y156.754 E.02425
G1 X108.057 Y99.246 E3.03984
G1 X107.408 Y99.246 E.02425
G1 X164.917 Y156.754 E3.03984
G1 X164.268 Y156.754 E.02425
G1 X106.759 Y99.246 E3.03984
G1 X106.111 Y99.246 E.02425
G1 X163.619 Y156.754 E3.03984
G1 X162.971 Y156.754 E.02425
G1 X105.462 Y99.246 E3.03984
G1 X104.813 Y99.246 E.02425
G1 X162.322 Y156.754 E3.03984
G1 X161.673 Y156.754 E.02425
G1 X104.165 Y99.246 E3.03984
M73 P17 R35
G1 X103.516 Y99.246 E.02425
G1 X161.025 Y156.754 E3.03984
G1 X160.376 Y156.754 E.02425
G1 X102.867 Y99.246 E3.03984
G1 X102.219 Y99.246 E.02425
G1 X159.727 Y156.754 E3.03984
G1 X159.079 Y156.754 E.02425
G1 X101.57 Y99.246 E3.03984
G1 X100.921 Y99.246 E.02425
G1 X158.43 Y156.754 E3.03984
M73 P17 R34
G1 X157.781 Y156.754 E.02425
G1 X100.273 Y99.246 E3.03984
G1 X99.624 Y99.246 E.02425
G1 X157.133 Y156.754 E3.03984
G1 X156.484 Y156.754 E.02425
G1 X98.975 Y99.246 E3.03984
G1 X98.326 Y99.246 E.02425
G1 X155.835 Y156.754 E3.03984
G1 X155.187 Y156.754 E.02425
G1 X97.678 Y99.246 E3.03984
G1 X97.029 Y99.246 E.02425
G1 X154.538 Y156.754 E3.03984
G1 X153.889 Y156.754 E.02425
G1 X96.38 Y99.246 E3.03984
G1 X95.732 Y99.246 E.02425
G1 X153.241 Y156.754 E3.03984
G1 X152.592 Y156.754 E.02425
G1 X95.083 Y99.246 E3.03984
G1 X94.434 Y99.246 E.02425
G1 X151.943 Y156.754 E3.03984
G1 X151.295 Y156.754 E.02425
G1 X93.786 Y99.246 E3.03984
G1 X93.137 Y99.246 E.02425
G1 X150.646 Y156.754 E3.03984
G1 X149.997 Y156.754 E.02425
G1 X92.488 Y99.246 E3.03984
G1 X91.84 Y99.246 E.02425
G1 X149.349 Y156.754 E3.03984
G1 X148.7 Y156.754 E.02425
G1 X91.191 Y99.246 E3.03984
G1 X90.542 Y99.246 E.02425
G1 X148.051 Y156.754 E3.03984
G1 X147.403 Y156.754 E.02425
G1 X89.894 Y99.246 E3.03984
G1 X89.245 Y99.246 E.02425
G1 X146.754 Y156.754 E3.03984
G1 X146.105 Y156.754 E.02425
G1 X88.596 Y99.246 E3.03984
G1 X87.948 Y99.246 E.02425
G1 X145.456 Y156.754 E3.03984
G1 X144.808 Y156.754 E.02425
G1 X87.299 Y99.246 E3.03984
M73 P18 R34
G1 X86.65 Y99.246 E.02425
G1 X144.159 Y156.754 E3.03984
G1 X143.51 Y156.754 E.02425
G1 X86.002 Y99.246 E3.03984
G1 X85.353 Y99.246 E.02425
G1 X142.862 Y156.754 E3.03984
G1 X142.213 Y156.754 E.02425
G1 X84.704 Y99.246 E3.03984
G1 X84.056 Y99.246 E.02425
G1 X141.564 Y156.754 E3.03984
G1 X140.916 Y156.754 E.02425
G1 X83.407 Y99.246 E3.03984
G1 X82.758 Y99.246 E.02425
G1 X140.267 Y156.754 E3.03984
G1 X139.618 Y156.754 E.02425
G1 X82.11 Y99.246 E3.03984
G1 X81.461 Y99.246 E.02425
G1 X138.97 Y156.754 E3.03984
G1 X138.321 Y156.754 E.02425
G1 X80.812 Y99.246 E3.03984
G1 X80.164 Y99.246 E.02425
G1 X137.672 Y156.754 E3.03984
G1 X137.024 Y156.754 E.02425
G1 X79.515 Y99.246 E3.03984
G1 X78.866 Y99.246 E.02425
G1 X136.375 Y156.754 E3.03984
G1 X135.726 Y156.754 E.02425
G1 X78.218 Y99.246 E3.03984
G1 X77.569 Y99.246 E.02425
G1 X135.078 Y156.754 E3.03984
G1 X134.429 Y156.754 E.02425
G1 X76.92 Y99.246 E3.03984
G1 X76.272 Y99.246 E.02425
G1 X133.78 Y156.754 E3.03984
G1 X133.132 Y156.754 E.02425
G1 X75.623 Y99.246 E3.03984
G2 X74.986 Y99.257 I-.06 J14.255 E.02382
G1 X132.483 Y156.754 E3.03923
G1 X131.834 Y156.754 E.02425
G1 X74.381 Y99.302 E3.03689
G2 X73.858 Y99.427 I.771 J4.384 E.02013
G1 X131.186 Y156.754 E3.03027
G1 X130.537 Y156.754 E.02425
G1 X73.395 Y99.612 E3.02048
G2 X72.976 Y99.842 I.959 J2.239 E.01788
G1 X129.888 Y156.754 E3.00831
G1 X129.24 Y156.754 E.02425
G1 X72.6 Y100.115 E2.99389
G2 X72.268 Y100.431 I1.439 J1.844 E.01718
G1 X128.591 Y156.754 E2.97716
G1 X127.942 Y156.754 E.02425
G1 X71.978 Y100.79 E2.95819
M73 P19 R34
G2 X71.721 Y101.182 I1.457 J1.239 E.01755
G1 X127.294 Y156.754 E2.93751
G1 X126.645 Y156.754 E.02425
G1 X71.513 Y101.622 E2.91422
G2 X71.354 Y102.112 I4.749 J1.809 E.01926
G1 X125.996 Y156.754 E2.88832
G1 X125.348 Y156.754 E.02425
G1 X71.265 Y102.672 E2.85874
G2 X71.251 Y103.306 I3.216 J.389 E.02376
G1 X124.699 Y156.754 E2.8252
G1 X124.05 Y156.754 E.02425
G1 X71.251 Y103.955 E2.79091
G1 X71.251 Y104.604 E.02425
G1 X123.402 Y156.754 E2.75662
G1 X122.753 Y156.754 E.02425
G1 X71.251 Y105.252 E2.72233
G1 X71.251 Y105.901 E.02425
G1 X122.104 Y156.754 E2.68805
G1 X121.456 Y156.754 E.02425
G1 X71.251 Y106.55 E2.65376
G1 X71.251 Y107.198 E.02425
G1 X120.807 Y156.754 E2.61947
G1 X120.158 Y156.754 E.02425
G1 X71.251 Y107.847 E2.58518
G1 X71.251 Y108.496 E.02425
G1 X119.51 Y156.754 E2.55089
G1 X118.861 Y156.754 E.02425
G1 X71.251 Y109.144 E2.51661
M73 P19 R33
G1 X71.251 Y109.793 E.02425
G1 X118.212 Y156.754 E2.48232
G1 X117.564 Y156.754 E.02425
G1 X71.251 Y110.442 E2.44803
G1 X71.251 Y111.09 E.02425
G1 X116.915 Y156.754 E2.41374
G1 X116.266 Y156.754 E.02425
G1 X71.251 Y111.739 E2.37945
G1 X71.251 Y112.388 E.02425
G1 X115.617 Y156.754 E2.34517
G1 X114.969 Y156.754 E.02425
G1 X71.251 Y113.036 E2.31088
G1 X71.251 Y113.685 E.02425
G1 X114.32 Y156.754 E2.27659
G1 X113.671 Y156.754 E.02425
G1 X71.251 Y114.334 E2.2423
G1 X71.251 Y114.982 E.02425
G1 X113.023 Y156.754 E2.20801
G1 X112.374 Y156.754 E.02425
G1 X71.251 Y115.631 E2.17372
G1 X71.251 Y116.28 E.02425
G1 X111.725 Y156.754 E2.13944
M73 P20 R33
G1 X111.077 Y156.754 E.02425
G1 X71.251 Y116.928 E2.10515
G1 X71.251 Y117.577 E.02425
G1 X110.428 Y156.754 E2.07086
G1 X109.779 Y156.754 E.02425
G1 X71.251 Y118.226 E2.03657
G1 X71.251 Y118.875 E.02425
G1 X109.131 Y156.754 E2.00228
G1 X108.482 Y156.754 E.02425
G1 X71.251 Y119.523 E1.968
G1 X71.251 Y120.172 E.02425
G1 X107.833 Y156.754 E1.93371
G1 X107.185 Y156.754 E.02425
G1 X71.251 Y120.821 E1.89942
G1 X71.251 Y121.469 E.02425
G1 X106.536 Y156.754 E1.86513
G1 X105.887 Y156.754 E.02425
G1 X71.251 Y122.118 E1.83084
G1 X71.251 Y122.767 E.02425
G1 X105.239 Y156.754 E1.79656
G1 X104.59 Y156.754 E.02425
G1 X71.251 Y123.415 E1.76227
G1 X71.251 Y124.064 E.02425
G1 X103.941 Y156.754 E1.72798
G1 X103.293 Y156.754 E.02425
G1 X71.251 Y124.713 E1.69369
G1 X71.251 Y125.361 E.02425
G1 X102.644 Y156.754 E1.6594
G1 X101.995 Y156.754 E.02425
G1 X71.251 Y126.01 E1.62511
G1 X71.251 Y126.659 E.02425
G1 X101.347 Y156.754 E1.59083
G1 X100.698 Y156.754 E.02425
G1 X71.251 Y127.307 E1.55654
G1 X71.251 Y127.956 E.02425
G1 X100.049 Y156.754 E1.52225
G1 X99.401 Y156.754 E.02425
G1 X71.251 Y128.605 E1.48796
G1 X71.251 Y129.253 E.02425
G1 X98.752 Y156.754 E1.45367
G1 X98.103 Y156.754 E.02425
G1 X71.251 Y129.902 E1.41939
G1 X71.251 Y130.551 E.02425
G1 X97.455 Y156.754 E1.3851
G1 X96.806 Y156.754 E.02425
G1 X71.251 Y131.199 E1.35081
G1 X71.251 Y131.848 E.02425
G1 X96.157 Y156.754 E1.31652
G1 X95.509 Y156.754 E.02425
G1 X71.251 Y132.497 E1.28223
G1 X71.251 Y133.145 E.02425
G1 X94.86 Y156.754 E1.24795
G1 X94.211 Y156.754 E.02425
G1 X71.251 Y133.794 E1.21366
G1 X71.251 Y134.443 E.02425
G1 X93.563 Y156.754 E1.17937
G1 X92.914 Y156.754 E.02425
G1 X71.251 Y135.091 E1.14508
G1 X71.251 Y135.74 E.02425
G1 X92.265 Y156.754 E1.11079
M73 P21 R33
G1 X91.617 Y156.754 E.02425
G1 X71.251 Y136.389 E1.07651
G1 X71.251 Y137.037 E.02425
G1 X90.968 Y156.754 E1.04222
G1 X90.319 Y156.754 E.02425
G1 X71.251 Y137.686 E1.00793
G1 X71.251 Y138.335 E.02425
G1 X89.671 Y156.754 E.97364
G1 X89.022 Y156.754 E.02425
G1 X71.251 Y138.983 E.93935
G1 X71.251 Y139.632 E.02425
G1 X88.373 Y156.754 E.90506
G1 X87.724 Y156.754 E.02425
G1 X71.251 Y140.281 E.87078
G1 X71.251 Y140.929 E.02425
G1 X87.076 Y156.754 E.83649
G1 X86.427 Y156.754 E.02425
G1 X71.251 Y141.578 E.8022
G1 X71.251 Y142.227 E.02425
G1 X85.778 Y156.754 E.76791
G1 X85.13 Y156.754 E.02425
G1 X71.251 Y142.875 E.73362
G1 X71.251 Y143.524 E.02425
G1 X84.481 Y156.754 E.69934
G1 X83.832 Y156.754 E.02425
G1 X71.251 Y144.173 E.66505
G1 X71.251 Y144.821 E.02425
G1 X83.184 Y156.754 E.63076
G1 X82.535 Y156.754 E.02425
G1 X71.251 Y145.47 E.59647
G1 X71.251 Y146.119 E.02425
G1 X81.886 Y156.754 E.56218
G1 X81.238 Y156.754 E.02425
G1 X71.251 Y146.768 E.5279
G1 X71.251 Y147.416 E.02425
G1 X80.589 Y156.754 E.49361
G1 X79.94 Y156.754 E.02425
G1 X71.251 Y148.065 E.45932
G1 X71.251 Y148.714 E.02425
G1 X79.292 Y156.754 E.42503
G1 X78.643 Y156.754 E.02425
G1 X71.251 Y149.362 E.39074
G1 X71.251 Y150.011 E.02425
G1 X77.994 Y156.754 E.35645
G1 X77.346 Y156.754 E.02425
G1 X71.251 Y150.66 E.32217
G1 X71.251 Y151.308 E.02425
G1 X76.697 Y156.754 E.28788
G1 X76.048 Y156.754 E.02425
G1 X71.251 Y151.957 E.25359
G1 X71.251 Y152.606 E.02425
G1 X75.4 Y156.754 E.2193
G3 X74.737 Y156.741 I-.19 J-6.862 E.02477
G1 X71.258 Y153.262 E.18389
G2 X71.4 Y154.052 I3.276 J-.179 E.03009
G1 X73.938 Y156.59 E.13413
G3 X72.482 Y155.783 I.976 J-3.477 E.06277
G1 X71.458 Y154.759 E.0541
M106 S132.6
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X72.482 Y155.783 E-.55006
G1 X72.917 Y156.122 E-.20987
G1 X72.918 Y156.122 E-.00007
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
G3 Z.6 I1.216 J-.052 P1  F30000
G1 X70.625 Y102.569 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X75.007 Y98.602 I4.39 J.445 E.21489
G1 X185.003 Y98.602 E3.64876
G3 X189.398 Y103.007 I-.016 J4.411 E.22911
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.411 J-.006 E.22946
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I.006 J-4.411 E.22946
G1 X70.602 Y103.007 E1.6581
G3 X70.619 Y102.629 I4.412 J.007 E.01258
G1 X70.232 Y102.548 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.234 Y102.531 E.00053
G3 X75.003 Y98.21 I4.781 J.484 E.21663
G1 X185.008 Y98.21 E3.38016
G3 X189.79 Y103.003 I-.022 J4.804 E.23084
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.804 J-.012 E.23117
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.012 J-4.804 E.23117
G1 X70.21 Y103.003 E1.5362
G1 X70.229 Y102.608 E.01215
M204 S10000
; WIPE_START
G1 F24000
G1 X70.234 Y102.531 E-.0293
G1 X70.302 Y102.066 E-.1786
M73 P21 R32
G1 X70.42 Y101.6 E-.18254
G1 X70.575 Y101.167 E-.1747
G1 X70.776 Y100.742 E-.17862
G1 X70.798 Y100.705 E-.01624
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.534 J1.094 P1  F30000
G1 X71.306 Y100.954 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420659
G1 F15000
G1 X72.241 Y100.02 E.04066
G3 X73.614 Y99.18 I2.726 J2.917 E.04989
G1 X71.197 Y101.597 E.10521
M73 P22 R32
G2 X70.999 Y102.329 I3.103 J1.231 E.02338
G1 X74.333 Y98.995 E.14513
G3 X74.923 Y98.94 I.575 J2.953 E.01826
G1 X70.941 Y102.922 E.17335
G1 X70.941 Y103.456 E.01645
G1 X75.462 Y98.935 E.1968
G1 X75.996 Y98.935 E.01644
G1 X70.941 Y103.991 E.22006
G1 X70.941 Y104.525 E.01645
G1 X76.53 Y98.935 E.24332
G1 X77.064 Y98.935 E.01644
G1 X70.941 Y105.059 E.26658
G1 X70.941 Y105.593 E.01645
G1 X77.599 Y98.935 E.28983
G1 X78.133 Y98.935 E.01644
G1 X70.94 Y106.128 E.31309
G1 X70.94 Y106.662 E.01645
G1 X78.667 Y98.935 E.33635
G1 X79.201 Y98.935 E.01644
G1 X70.94 Y107.196 E.3596
G1 X70.94 Y107.73 E.01645
G1 X79.735 Y98.935 E.38286
G1 X80.27 Y98.935 E.01644
G1 X70.94 Y108.265 E.40612
G1 X70.94 Y108.799 E.01645
G1 X80.804 Y98.935 E.42937
G1 X81.338 Y98.935 E.01644
G1 X70.94 Y109.333 E.45263
G1 X70.94 Y109.868 E.01645
G1 X81.872 Y98.935 E.47589
G1 X82.406 Y98.935 E.01644
G1 X70.94 Y110.402 E.49914
G1 X70.94 Y110.936 E.01645
G1 X82.941 Y98.935 E.5224
G1 X83.475 Y98.935 E.01644
G1 X70.94 Y111.47 E.54566
G1 X70.94 Y112.005 E.01645
G1 X84.009 Y98.935 E.56891
G1 X84.543 Y98.935 E.01644
G1 X70.94 Y112.539 E.59217
G1 X70.94 Y113.073 E.01645
G1 X85.077 Y98.935 E.61543
G1 X85.612 Y98.935 E.01644
G1 X70.94 Y113.607 E.63868
G1 X70.94 Y114.142 E.01645
G1 X86.146 Y98.935 E.66194
G1 X86.68 Y98.935 E.01644
G1 X70.94 Y114.676 E.6852
G1 X70.939 Y115.21 E.01645
G1 X87.214 Y98.935 E.70845
G1 X87.748 Y98.935 E.01644
G1 X70.939 Y115.744 E.73171
G1 X70.939 Y116.279 E.01645
G1 X88.283 Y98.935 E.75497
G1 X88.817 Y98.935 E.01644
G1 X70.939 Y116.813 E.77823
G1 X70.939 Y117.347 E.01645
G1 X89.351 Y98.935 E.80148
G1 X89.885 Y98.935 E.01644
G1 X70.939 Y117.881 E.82474
G1 X70.939 Y118.416 E.01645
G1 X90.419 Y98.935 E.848
G1 X90.954 Y98.935 E.01644
G1 X70.939 Y118.95 E.87125
G1 X70.939 Y119.484 E.01645
G1 X91.488 Y98.935 E.89451
G1 X92.022 Y98.935 E.01644
G1 X70.939 Y120.019 E.91777
G1 X70.939 Y120.553 E.01645
G1 X92.556 Y98.935 E.94102
G1 X93.09 Y98.935 E.01644
G1 X70.939 Y121.087 E.96428
G1 X70.939 Y121.621 E.01645
G1 X93.625 Y98.935 E.98754
G1 X94.159 Y98.935 E.01644
G1 X70.939 Y122.156 E1.01079
G1 X70.939 Y122.69 E.01645
G1 X94.693 Y98.935 E1.03405
G1 X95.227 Y98.935 E.01644
G1 X70.939 Y123.224 E1.05731
G1 X70.939 Y123.758 E.01645
G1 X95.761 Y98.935 E1.08056
G1 X96.296 Y98.935 E.01644
G1 X70.938 Y124.293 E1.10382
G1 X70.938 Y124.827 E.01645
G1 X96.83 Y98.935 E1.12708
G1 X97.364 Y98.935 E.01644
G1 X70.938 Y125.361 E1.15033
G1 X70.938 Y125.895 E.01645
G1 X97.898 Y98.935 E1.17359
G1 X98.433 Y98.935 E.01644
G1 X70.938 Y126.43 E1.19685
G1 X70.938 Y126.964 E.01645
G1 X98.967 Y98.935 E1.2201
G1 X99.501 Y98.935 E.01644
G1 X70.938 Y127.498 E1.24336
G1 X70.938 Y128.032 E.01645
G1 X100.035 Y98.935 E1.26662
G1 X100.569 Y98.935 E.01644
G1 X70.938 Y128.567 E1.28988
G1 X70.938 Y129.101 E.01645
G1 X101.104 Y98.935 E1.31313
G1 X101.638 Y98.935 E.01644
G1 X70.938 Y129.635 E1.33639
G1 X70.938 Y130.169 E.01645
G1 X102.172 Y98.935 E1.35965
G1 X102.706 Y98.935 E.01644
G1 X70.938 Y130.704 E1.3829
G1 X70.938 Y131.238 E.01645
G1 X103.24 Y98.935 E1.40616
G1 X103.775 Y98.935 E.01644
G1 X70.938 Y131.772 E1.42942
G1 X70.938 Y132.307 E.01645
G1 X104.309 Y98.935 E1.45267
G1 X104.843 Y98.935 E.01644
G1 X70.938 Y132.841 E1.47593
G1 X70.937 Y133.375 E.01645
G1 X105.377 Y98.935 E1.49919
G1 X105.911 Y98.935 E.01644
G1 X70.937 Y133.909 E1.52244
G1 X70.937 Y134.444 E.01645
G1 X106.446 Y98.935 E1.5457
G1 X106.98 Y98.935 E.01644
G1 X70.937 Y134.978 E1.56896
G1 X70.937 Y135.512 E.01645
G1 X107.514 Y98.935 E1.59221
G1 X108.048 Y98.935 E.01644
G1 X70.937 Y136.046 E1.61547
G1 X70.937 Y136.581 E.01645
G1 X108.582 Y98.935 E1.63873
G1 X109.117 Y98.935 E.01644
G1 X70.937 Y137.115 E1.66198
G1 X70.937 Y137.649 E.01645
G1 X109.651 Y98.935 E1.68524
G1 X110.185 Y98.935 E.01644
G1 X70.937 Y138.183 E1.7085
G1 X70.937 Y138.718 E.01645
G1 X110.719 Y98.935 E1.73175
G1 X111.253 Y98.935 E.01644
G1 X70.937 Y139.252 E1.75501
G1 X70.937 Y139.786 E.01645
G1 X111.788 Y98.935 E1.77827
G1 X112.322 Y98.935 E.01644
G1 X70.937 Y140.32 E1.80152
G1 X70.937 Y140.855 E.01645
G1 X112.856 Y98.935 E1.82478
G1 X113.39 Y98.935 E.01644
G1 X70.937 Y141.389 E1.84804
G1 X70.937 Y141.923 E.01645
G1 X113.924 Y98.935 E1.8713
G1 X114.459 Y98.935 E.01644
G1 X70.936 Y142.458 E1.89455
G1 X70.936 Y142.992 E.01645
G1 X114.993 Y98.935 E1.91781
G1 X115.527 Y98.935 E.01644
G1 X70.936 Y143.526 E1.94107
G1 X70.936 Y144.06 E.01645
G1 X116.061 Y98.935 E1.96432
G1 X116.595 Y98.935 E.01644
G1 X70.936 Y144.595 E1.98758
G1 X70.936 Y145.129 E.01645
G1 X117.13 Y98.935 E2.01084
G1 X117.664 Y98.935 E.01644
G1 X70.936 Y145.663 E2.03409
G1 X70.936 Y146.197 E.01645
G1 X118.198 Y98.935 E2.05735
G1 X118.732 Y98.935 E.01644
G1 X70.936 Y146.732 E2.08061
G1 X70.936 Y147.266 E.01645
G1 X119.266 Y98.935 E2.10386
G1 X119.801 Y98.935 E.01644
G1 X70.936 Y147.8 E2.12712
G1 X70.936 Y148.334 E.01645
G1 X120.335 Y98.935 E2.15038
G1 X120.869 Y98.935 E.01644
G1 X70.936 Y148.869 E2.17363
G1 X70.936 Y149.403 E.01645
G1 X121.403 Y98.935 E2.19689
G1 X121.937 Y98.935 E.01644
G1 X70.936 Y149.937 E2.22015
G1 X70.936 Y150.471 E.01645
G1 X122.472 Y98.935 E2.2434
G1 X123.006 Y98.935 E.01644
G1 X70.936 Y151.006 E2.26666
G1 X70.936 Y151.54 E.01645
G1 X123.54 Y98.935 E2.28992
G1 X124.074 Y98.935 E.01644
G1 X70.935 Y152.074 E2.31317
G1 X70.935 Y152.608 E.01645
G1 X124.608 Y98.935 E2.33643
G1 X125.143 Y98.935 E.01644
G1 X70.943 Y153.135 E2.35937
G2 X70.989 Y153.623 I2.49 J.011 E.01511
G1 X125.677 Y98.935 E2.38061
G1 X126.211 Y98.935 E.01644
G1 X71.082 Y154.064 E2.39981
G2 X71.22 Y154.461 I1.676 J-.361 E.01295
G1 X126.745 Y98.935 E2.41706
G1 X127.279 Y98.935 E.01644
G1 X71.381 Y154.834 E2.4333
G1 X71.574 Y155.175 E.01206
G1 X127.814 Y98.935 E2.44814
G1 X128.348 Y98.935 E.01644
G1 X71.799 Y155.485 E2.46164
G2 X72.04 Y155.777 I1.107 J-.668 E.01172
G1 X128.882 Y98.935 E2.47438
G1 X129.416 Y98.935 E.01644
G1 X72.314 Y156.038 E2.48572
G2 X72.611 Y156.275 I.946 J-.885 E.01175
G1 X129.95 Y98.935 E2.49602
G1 X130.485 Y98.935 E.01644
G1 X72.927 Y156.493 E2.50554
G1 X73.282 Y156.672 E.01225
G1 X131.019 Y98.935 E2.51333
G1 X131.553 Y98.935 E.01644
G1 X73.662 Y156.826 E2.52003
G2 X74.069 Y156.954 I.72 J-1.586 E.01315
G1 X132.087 Y98.935 E2.52558
G1 X132.621 Y98.935 E.01644
G1 X74.528 Y157.029 E2.52884
G2 X75.026 Y157.065 I.495 J-3.38 E.01539
G1 X133.156 Y98.935 E2.53041
G1 X133.69 Y98.935 E.01644
G1 X75.561 Y157.065 E2.53041
G1 X76.095 Y157.065 E.01644
G1 X134.224 Y98.935 E2.53041
G1 X134.758 Y98.935 E.01644
G1 X76.629 Y157.065 E2.53041
G1 X77.163 Y157.065 E.01644
G1 X135.292 Y98.935 E2.53041
G1 X135.827 Y98.935 E.01644
G1 X77.697 Y157.065 E2.53041
G1 X78.232 Y157.065 E.01644
G1 X136.361 Y98.935 E2.53041
G1 X136.895 Y98.935 E.01644
G1 X78.766 Y157.065 E2.53041
G1 X79.3 Y157.065 E.01644
G1 X137.429 Y98.935 E2.53041
G1 X137.963 Y98.935 E.01644
G1 X79.834 Y157.065 E2.53041
G1 X80.369 Y157.065 E.01644
G1 X138.498 Y98.935 E2.53041
G1 X139.032 Y98.935 E.01644
G1 X80.903 Y157.065 E2.53041
G1 X81.437 Y157.065 E.01644
G1 X139.566 Y98.935 E2.53041
G1 X140.1 Y98.935 E.01644
G1 X81.971 Y157.065 E2.53041
G1 X82.505 Y157.065 E.01644
G1 X140.634 Y98.935 E2.53041
G1 X141.169 Y98.935 E.01644
G1 X83.04 Y157.065 E2.53041
G1 X83.574 Y157.065 E.01644
G1 X141.703 Y98.936 E2.53041
G1 X142.237 Y98.936 E.01644
G1 X84.108 Y157.065 E2.53041
M73 P23 R32
G1 X84.642 Y157.065 E.01644
G1 X142.771 Y98.936 E2.53041
G1 X143.306 Y98.936 E.01644
G1 X85.176 Y157.065 E2.53041
G1 X85.711 Y157.065 E.01644
G1 X143.84 Y98.936 E2.53041
G1 X144.374 Y98.936 E.01644
G1 X86.245 Y157.065 E2.53041
G1 X86.779 Y157.065 E.01644
G1 X144.908 Y98.936 E2.53041
G1 X145.442 Y98.936 E.01644
G1 X87.313 Y157.065 E2.53041
G1 X87.847 Y157.065 E.01644
G1 X145.977 Y98.936 E2.53041
G1 X146.511 Y98.936 E.01644
G1 X88.382 Y157.065 E2.53041
G1 X88.916 Y157.065 E.01644
G1 X147.045 Y98.936 E2.53041
G1 X147.579 Y98.936 E.01644
G1 X89.45 Y157.065 E2.53041
G1 X89.984 Y157.065 E.01644
G1 X148.113 Y98.936 E2.53041
G1 X148.648 Y98.936 E.01644
G1 X90.518 Y157.065 E2.53041
G1 X91.053 Y157.065 E.01644
G1 X149.182 Y98.936 E2.53041
G1 X149.716 Y98.936 E.01644
G1 X91.587 Y157.065 E2.53041
G1 X92.121 Y157.065 E.01644
G1 X150.25 Y98.936 E2.53041
G1 X150.784 Y98.936 E.01644
G1 X92.655 Y157.065 E2.53041
G1 X93.189 Y157.065 E.01644
G1 X151.319 Y98.936 E2.53041
G1 X151.853 Y98.936 E.01644
G1 X93.724 Y157.065 E2.53041
G1 X94.258 Y157.065 E.01644
G1 X152.387 Y98.936 E2.53041
G1 X152.921 Y98.936 E.01644
G1 X94.792 Y157.065 E2.53041
G1 X95.326 Y157.065 E.01644
G1 X153.455 Y98.936 E2.53041
G1 X153.99 Y98.936 E.01644
G1 X95.86 Y157.065 E2.53041
G1 X96.395 Y157.065 E.01644
G1 X154.524 Y98.936 E2.53041
G1 X155.058 Y98.936 E.01644
G1 X96.929 Y157.065 E2.53041
G1 X97.463 Y157.065 E.01644
G1 X155.592 Y98.936 E2.53041
G1 X156.126 Y98.936 E.01644
G1 X97.997 Y157.065 E2.53041
G1 X98.531 Y157.065 E.01644
G1 X156.661 Y98.936 E2.53041
G1 X157.195 Y98.936 E.01644
G1 X99.066 Y157.065 E2.53041
G1 X99.6 Y157.065 E.01644
G1 X157.729 Y98.936 E2.53041
G1 X158.263 Y98.936 E.01644
G1 X100.134 Y157.065 E2.53041
G1 X100.668 Y157.065 E.01644
G1 X158.797 Y98.936 E2.53041
G1 X159.332 Y98.936 E.01644
G1 X101.202 Y157.065 E2.53041
G1 X101.737 Y157.065 E.01644
G1 X159.866 Y98.936 E2.53041
G1 X160.4 Y98.936 E.01644
G1 X102.271 Y157.065 E2.53041
G1 X102.805 Y157.065 E.01644
G1 X160.934 Y98.936 E2.53041
G1 X161.468 Y98.936 E.01644
G1 X103.339 Y157.065 E2.53041
G1 X103.873 Y157.065 E.01644
G1 X162.003 Y98.936 E2.53041
G1 X162.537 Y98.936 E.01644
G1 X104.408 Y157.065 E2.53041
G1 X104.942 Y157.065 E.01644
G1 X163.071 Y98.936 E2.53041
G1 X163.605 Y98.936 E.01644
G1 X105.476 Y157.065 E2.53041
G1 X106.01 Y157.065 E.01644
G1 X164.139 Y98.936 E2.53041
G1 X164.674 Y98.936 E.01644
G1 X106.544 Y157.065 E2.53041
G1 X107.079 Y157.065 E.01644
G1 X165.208 Y98.936 E2.53041
G1 X165.742 Y98.936 E.01644
G1 X107.613 Y157.065 E2.53041
G1 X108.147 Y157.065 E.01644
G1 X166.276 Y98.936 E2.53041
G1 X166.81 Y98.936 E.01644
G1 X108.681 Y157.065 E2.53041
G1 X109.216 Y157.065 E.01644
G1 X167.345 Y98.936 E2.53041
G1 X167.879 Y98.936 E.01644
G1 X109.75 Y157.065 E2.53041
G1 X110.284 Y157.065 E.01644
G1 X168.413 Y98.936 E2.53041
G1 X168.947 Y98.936 E.01644
G1 X110.818 Y157.065 E2.53041
G1 X111.352 Y157.065 E.01644
G1 X169.481 Y98.936 E2.53041
G1 X170.016 Y98.936 E.01644
G1 X111.887 Y157.065 E2.53041
G1 X112.421 Y157.065 E.01644
G1 X170.55 Y98.936 E2.53041
G1 X171.084 Y98.936 E.01644
G1 X112.955 Y157.065 E2.53041
G1 X113.489 Y157.065 E.01644
G1 X171.618 Y98.936 E2.53041
G1 X172.152 Y98.936 E.01644
G1 X114.023 Y157.065 E2.53041
G1 X114.558 Y157.065 E.01644
G1 X172.687 Y98.936 E2.53041
G1 X173.221 Y98.936 E.01644
G1 X115.092 Y157.065 E2.53041
G1 X115.626 Y157.065 E.01644
G1 X173.755 Y98.936 E2.53041
G1 X174.289 Y98.936 E.01644
G1 X116.16 Y157.065 E2.53041
G1 X116.694 Y157.065 E.01644
G1 X174.823 Y98.936 E2.53041
G1 X175.358 Y98.936 E.01644
G1 X117.229 Y157.065 E2.53041
G1 X117.763 Y157.065 E.01644
G1 X175.892 Y98.936 E2.53041
G1 X176.426 Y98.936 E.01644
G1 X118.297 Y157.065 E2.53041
G1 X118.831 Y157.065 E.01644
G1 X176.96 Y98.936 E2.53041
G1 X177.494 Y98.936 E.01644
G1 X119.365 Y157.065 E2.53041
G1 X119.9 Y157.065 E.01644
G1 X178.029 Y98.936 E2.53041
G1 X178.563 Y98.936 E.01644
G1 X120.434 Y157.065 E2.53041
G1 X120.968 Y157.065 E.01644
G1 X179.097 Y98.936 E2.53041
M73 P24 R32
G1 X179.631 Y98.936 E.01644
G1 X121.502 Y157.065 E2.53041
G1 X122.036 Y157.065 E.01644
G1 X180.165 Y98.936 E2.53041
G1 X180.7 Y98.936 E.01644
G1 X122.571 Y157.065 E2.53041
G1 X123.105 Y157.065 E.01644
G1 X181.234 Y98.936 E2.53041
G1 X181.768 Y98.936 E.01644
G1 X123.639 Y157.065 E2.53041
G1 X124.173 Y157.065 E.01644
G1 X182.302 Y98.936 E2.53041
G1 X182.836 Y98.936 E.01644
G1 X124.707 Y157.065 E2.53041
G1 X125.242 Y157.065 E.01644
G1 X183.371 Y98.936 E2.53041
G1 X183.905 Y98.936 E.01644
G1 X125.776 Y157.065 E2.53041
G1 X126.31 Y157.065 E.01644
G1 X184.439 Y98.936 E2.53041
G1 X184.973 Y98.936 E.01644
G1 X126.844 Y157.065 E2.53041
G1 X127.378 Y157.065 E.01644
G1 X185.476 Y98.967 E2.52904
G3 X185.929 Y99.048 I-.185 J2.341 E.01419
G1 X127.913 Y157.065 E2.52551
G1 X128.447 Y157.065 E.01644
G1 X186.342 Y99.169 E2.52024
G3 X186.722 Y99.324 I-.597 J2.003 E.01263
G1 X128.981 Y157.065 E2.5135
G1 X129.515 Y157.065 E.01644
G1 X187.071 Y99.509 E2.50545
G3 X187.393 Y99.721 I-.916 J1.741 E.01189
G1 X130.049 Y157.065 E2.49621
G1 X130.584 Y157.065 E.01644
G1 X187.689 Y99.959 E2.48585
G3 X187.961 Y100.222 I-1.199 J1.509 E.01165
G1 X131.118 Y157.065 E2.47441
G1 X131.652 Y157.065 E.01644
G1 X188.207 Y100.51 E2.46188
G3 X188.428 Y100.823 I-1.481 J1.278 E.01182
G1 X132.186 Y157.065 E2.44824
M73 P24 R31
G1 X132.72 Y157.065 E.01644
G1 X188.622 Y101.163 E2.43343
G3 X188.784 Y101.535 I-1.408 J.836 E.01252
G1 X133.255 Y157.065 E2.41724
G1 X133.789 Y157.065 E.01644
G1 X188.916 Y101.937 E2.39973
G3 X189.014 Y102.374 I-1.732 J.618 E.01379
G1 X134.323 Y157.065 E2.38075
G1 X134.857 Y157.065 E.01644
G1 X189.059 Y102.863 E2.35945
G1 X189.059 Y103.397 E.01644
G1 X135.391 Y157.065 E2.3362
G1 X135.926 Y157.065 E.01644
G1 X189.059 Y103.931 E2.31294
G1 X189.059 Y104.465 E.01644
G1 X136.46 Y157.065 E2.28969
G1 X136.994 Y157.065 E.01644
G1 X189.059 Y105 E2.26644
G1 X189.059 Y105.534 E.01644
G1 X137.528 Y157.065 E2.24318
G1 X138.063 Y157.065 E.01644
G1 X189.059 Y106.068 E2.21993
G1 X189.059 Y106.602 E.01644
G1 X138.597 Y157.065 E2.19667
G1 X139.131 Y157.065 E.01644
G1 X189.059 Y107.136 E2.17342
G1 X189.059 Y107.671 E.01644
G1 X139.665 Y157.065 E2.15016
G1 X140.199 Y157.065 E.01644
G1 X189.059 Y108.205 E2.12691
G1 X189.059 Y108.739 E.01644
G1 X140.734 Y157.065 E2.10366
G1 X141.268 Y157.065 E.01644
G1 X189.059 Y109.273 E2.0804
G1 X189.059 Y109.807 E.01644
G1 X141.802 Y157.065 E2.05715
G1 X142.336 Y157.065 E.01644
G1 X189.059 Y110.342 E2.03389
G1 X189.059 Y110.876 E.01644
G1 X142.87 Y157.065 E2.01064
G1 X143.405 Y157.065 E.01644
G1 X189.059 Y111.41 E1.98738
G1 X189.059 Y111.944 E.01644
G1 X143.939 Y157.065 E1.96413
G1 X144.473 Y157.065 E.01644
G1 X189.059 Y112.478 E1.94088
G1 X189.059 Y113.013 E.01644
G1 X145.007 Y157.065 E1.91762
G1 X145.541 Y157.065 E.01644
G1 X189.059 Y113.547 E1.89437
G1 X189.059 Y114.081 E.01644
G1 X146.076 Y157.065 E1.87111
G1 X146.61 Y157.065 E.01644
G1 X189.059 Y114.615 E1.84786
G1 X189.059 Y115.149 E.01644
G1 X147.144 Y157.065 E1.8246
G1 X147.678 Y157.065 E.01644
G1 X189.059 Y115.684 E1.80135
G1 X189.059 Y116.218 E.01644
G1 X148.212 Y157.065 E1.7781
G1 X148.747 Y157.065 E.01644
G1 X189.059 Y116.752 E1.75484
G1 X189.059 Y117.286 E.01644
G1 X149.281 Y157.065 E1.73159
G1 X149.815 Y157.065 E.01644
G1 X189.059 Y117.82 E1.70833
G1 X189.059 Y118.355 E.01644
G1 X150.349 Y157.065 E1.68508
G1 X150.883 Y157.065 E.01644
G1 X189.059 Y118.889 E1.66182
G1 X189.059 Y119.423 E.01644
G1 X151.418 Y157.065 E1.63857
G1 X151.952 Y157.065 E.01644
G1 X189.059 Y119.957 E1.61531
G1 X189.059 Y120.491 E.01644
G1 X152.486 Y157.065 E1.59206
G1 X153.02 Y157.065 E.01644
G1 X189.059 Y121.026 E1.56881
G1 X189.059 Y121.56 E.01644
G1 X153.554 Y157.065 E1.54555
G1 X154.089 Y157.065 E.01644
G1 X189.059 Y122.094 E1.5223
G1 X189.059 Y122.628 E.01644
G1 X154.623 Y157.065 E1.49904
G1 X155.157 Y157.065 E.01644
G1 X189.059 Y123.163 E1.47579
G1 X189.059 Y123.697 E.01644
G1 X155.691 Y157.065 E1.45253
G1 X156.225 Y157.065 E.01644
G1 X189.059 Y124.231 E1.42928
G1 X189.059 Y124.765 E.01644
G1 X156.76 Y157.065 E1.40603
G1 X157.294 Y157.065 E.01644
G1 X189.059 Y125.299 E1.38277
G1 X189.059 Y125.834 E.01644
G1 X157.828 Y157.065 E1.35952
G1 X158.362 Y157.065 E.01644
G1 X189.059 Y126.368 E1.33626
G1 X189.059 Y126.902 E.01644
G1 X158.896 Y157.065 E1.31301
G1 X159.431 Y157.065 E.01644
G1 X189.059 Y127.436 E1.28975
G1 X189.059 Y127.97 E.01644
G1 X159.965 Y157.065 E1.2665
M73 P25 R31
G1 X160.499 Y157.065 E.01644
G1 X189.059 Y128.505 E1.24325
G1 X189.059 Y129.039 E.01644
G1 X161.033 Y157.065 E1.21999
G1 X161.567 Y157.065 E.01644
G1 X189.059 Y129.573 E1.19674
G1 X189.059 Y130.107 E.01644
G1 X162.102 Y157.065 E1.17348
G1 X162.636 Y157.065 E.01644
G1 X189.059 Y130.641 E1.15023
G1 X189.059 Y131.176 E.01644
G1 X163.17 Y157.065 E1.12697
G1 X163.704 Y157.065 E.01644
G1 X189.059 Y131.71 E1.10372
G1 X189.059 Y132.244 E.01644
G1 X164.238 Y157.065 E1.08047
G1 X164.773 Y157.065 E.01644
G1 X189.059 Y132.778 E1.05721
G1 X189.059 Y133.312 E.01644
G1 X165.307 Y157.065 E1.03396
G1 X165.841 Y157.065 E.01644
G1 X189.059 Y133.847 E1.0107
G1 X189.059 Y134.381 E.01644
G1 X166.375 Y157.065 E.98745
G1 X166.91 Y157.065 E.01644
G1 X189.059 Y134.915 E.96419
G1 X189.059 Y135.449 E.01644
G1 X167.444 Y157.065 E.94094
G1 X167.978 Y157.065 E.01644
G1 X189.059 Y135.983 E.91769
G1 X189.059 Y136.518 E.01644
G1 X168.512 Y157.065 E.89443
G1 X169.046 Y157.065 E.01644
G1 X189.059 Y137.052 E.87118
G1 X189.059 Y137.586 E.01644
G1 X169.581 Y157.065 E.84792
G1 X170.115 Y157.065 E.01644
G1 X189.059 Y138.12 E.82467
G1 X189.059 Y138.654 E.01644
G1 X170.649 Y157.065 E.80141
G1 X171.183 Y157.065 E.01644
G1 X189.059 Y139.189 E.77816
G1 X189.059 Y139.723 E.01644
G1 X171.717 Y157.065 E.7549
G1 X172.252 Y157.065 E.01644
G1 X189.059 Y140.257 E.73165
G1 X189.059 Y140.791 E.01644
G1 X172.786 Y157.065 E.7084
G1 X173.32 Y157.065 E.01644
G1 X189.059 Y141.325 E.68514
G1 X189.059 Y141.86 E.01644
G1 X173.854 Y157.065 E.66189
G1 X174.388 Y157.065 E.01644
G1 X189.059 Y142.394 E.63863
G1 X189.059 Y142.928 E.01644
G1 X174.923 Y157.065 E.61538
G1 X175.457 Y157.065 E.01644
G1 X189.059 Y143.462 E.59212
G1 X189.059 Y143.996 E.01644
G1 X175.991 Y157.065 E.56887
G1 X176.525 Y157.065 E.01644
G1 X189.059 Y144.531 E.54562
G1 X189.059 Y145.065 E.01644
G1 X177.059 Y157.065 E.52236
G1 X177.594 Y157.065 E.01644
G1 X189.059 Y145.599 E.49911
G1 X189.059 Y146.133 E.01644
G1 X178.128 Y157.065 E.47585
G1 X178.662 Y157.065 E.01644
G1 X189.059 Y146.667 E.4526
G1 X189.059 Y147.202 E.01644
G1 X179.196 Y157.065 E.42934
G1 X179.73 Y157.065 E.01644
G1 X189.059 Y147.736 E.40609
G1 X189.059 Y148.27 E.01644
G1 X180.265 Y157.065 E.38284
G1 X180.799 Y157.065 E.01644
G1 X189.059 Y148.804 E.35958
G1 X189.059 Y149.338 E.01644
G1 X181.333 Y157.065 E.33633
G1 X181.867 Y157.065 E.01644
G1 X189.059 Y149.873 E.31307
G1 X189.059 Y150.407 E.01644
G1 X182.401 Y157.065 E.28982
G1 X182.936 Y157.065 E.01644
G1 X189.059 Y150.941 E.26656
G1 X189.059 Y151.475 E.01644
G1 X183.47 Y157.065 E.24331
G1 X184.004 Y157.065 E.01644
G1 X189.059 Y152.009 E.22006
G1 X189.059 Y152.544 E.01644
G1 X184.538 Y157.065 E.1968
G2 X185.077 Y157.06 I.223 J-5.532 E.01659
G1 X189.059 Y153.078 E.17335
G3 X189.004 Y153.667 I-4.369 J-.111 E.01823
G1 X185.667 Y157.005 E.14528
G2 X186.403 Y156.803 I-.6 J-3.632 E.02353
G1 X188.802 Y154.403 E.10446
G3 X188.011 Y155.728 I-4.069 J-1.53 E.04776
G1 X187.046 Y156.694 E.04204
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X188.011 Y155.728 E-.51902
G1 X188.379 Y155.258 E-.2269
G1 X188.397 Y155.225 E-.01408
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
G3 Z.8 I.497 J-1.111 P1  F30000
G1 X70.625 Y102.569 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X75.007 Y98.602 I4.39 J.446 E.21488
G1 X185.01 Y98.603 E3.64899
G3 X189.398 Y103.007 I-.023 J4.41 E.22888
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.411 J-.006 E.22946
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I.006 J-4.411 E.22946
G1 X70.602 Y103.007 E1.6581
G3 X70.619 Y102.629 I4.413 J.007 E.01258
G1 X70.232 Y102.548 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.235 Y102.531 E.00053
G3 X75.003 Y98.21 I4.781 J.485 E.21662
G1 X185.015 Y98.21 E3.38037
G3 X189.79 Y103.003 I-.028 J4.803 E.23063
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.804 J-.012 E.23117
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.012 J-4.804 E.23117
G1 X70.21 Y103.003 E1.5362
G1 X70.229 Y102.608 E.01215
M204 S10000
; WIPE_START
G1 F24000
G1 X70.235 Y102.531 E-.02929
G1 X70.302 Y102.066 E-.17859
G1 X70.416 Y101.61 E-.17863
G1 X70.568 Y101.183 E-.17209
G1 X70.776 Y100.742 E-.18514
G1 X70.798 Y100.705 E-.01625
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.216 J.047 P1  F30000
G1 X72.961 Y156.701 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420675
G1 F15000
G1 X71.988 Y155.727 E.0424
G3 X71.326 Y154.737 I3.005 J-2.723 E.03677
G1 X71.197 Y154.402 E.01107
G1 X73.6 Y156.806 E.10465
G2 X74.325 Y156.996 I1.004 J-2.347 E.02315
G1 X70.995 Y153.666 E.14496
G3 X70.94 Y153.077 I2.953 J-.575 E.01826
G1 X74.923 Y157.06 E.17342
G2 X75.462 Y157.065 I.315 J-5.527 E.01659
G1 X70.935 Y152.538 E.19706
G1 X70.935 Y152.004 E.01644
G1 X75.996 Y157.065 E.22032
G1 X76.531 Y157.065 E.01644
G1 X70.936 Y151.47 E.24357
G1 X70.936 Y150.935 E.01644
G1 X77.065 Y157.065 E.26682
G1 X77.599 Y157.065 E.01644
G1 X70.936 Y150.401 E.29008
G1 X70.936 Y149.867 E.01644
G1 X78.133 Y157.065 E.31333
G1 X78.668 Y157.065 E.01644
G1 X70.936 Y149.333 E.33659
G1 X70.936 Y148.799 E.01644
G1 X79.202 Y157.065 E.35984
G1 X79.736 Y157.065 E.01644
G1 X70.936 Y148.265 E.38309
G1 X70.936 Y147.73 E.01644
G1 X80.27 Y157.065 E.40635
G1 X80.804 Y157.065 E.01644
G1 X70.936 Y147.196 E.4296
G1 X70.936 Y146.662 E.01644
G1 X81.339 Y157.065 E.45285
G1 X81.873 Y157.065 E.01644
G1 X70.936 Y146.128 E.47611
G1 X70.936 Y145.594 E.01644
G1 X82.407 Y157.065 E.49936
G1 X82.941 Y157.065 E.01644
G1 X70.936 Y145.06 E.52262
G1 X70.936 Y144.525 E.01644
G1 X83.476 Y157.065 E.54587
G1 X84.01 Y157.065 E.01644
G1 X70.936 Y143.991 E.56912
G1 X70.936 Y143.457 E.01644
G1 X84.544 Y157.065 E.59238
G1 X85.078 Y157.065 E.01644
G1 X70.936 Y142.923 E.61563
G1 X70.937 Y142.389 E.01644
G1 X85.612 Y157.065 E.63888
G1 X86.147 Y157.065 E.01644
G1 X70.937 Y141.855 E.66214
G1 X70.937 Y141.32 E.01644
G1 X86.681 Y157.065 E.68539
G1 X87.215 Y157.065 E.01644
G1 X70.937 Y140.786 E.70865
G1 X70.937 Y140.252 E.01644
G1 X87.749 Y157.065 E.7319
G1 X88.284 Y157.065 E.01644
G1 X70.937 Y139.718 E.75515
G1 X70.937 Y139.184 E.01644
G1 X88.818 Y157.065 E.77841
G1 X89.352 Y157.065 E.01644
G1 X70.937 Y138.65 E.80166
G1 X70.937 Y138.115 E.01644
G1 X89.886 Y157.065 E.82491
G1 X90.421 Y157.065 E.01644
G1 X70.937 Y137.581 E.84817
G1 X70.937 Y137.047 E.01644
G1 X90.955 Y157.065 E.87142
G1 X91.489 Y157.065 E.01644
G1 X70.937 Y136.513 E.89468
G1 X70.937 Y135.979 E.01644
G1 X92.023 Y157.065 E.91793
G1 X92.557 Y157.065 E.01644
G1 X70.937 Y135.444 E.94118
G1 X70.937 Y134.91 E.01644
G1 X93.092 Y157.065 E.96444
G1 X93.626 Y157.065 E.01644
G1 X70.937 Y134.376 E.98769
G1 X70.937 Y133.842 E.01644
G1 X94.16 Y157.065 E1.01094
G1 X94.694 Y157.065 E.01644
G1 X70.937 Y133.308 E1.0342
G1 X70.938 Y132.774 E.01644
G1 X95.229 Y157.065 E1.05745
G1 X95.763 Y157.065 E.01644
G1 X70.938 Y132.239 E1.08071
G1 X70.938 Y131.705 E.01644
G1 X96.297 Y157.065 E1.10396
G1 X96.831 Y157.065 E.01644
G1 X70.938 Y131.171 E1.12721
G1 X70.938 Y130.637 E.01644
G1 X97.365 Y157.065 E1.15047
G1 X97.9 Y157.065 E.01644
G1 X70.938 Y130.103 E1.17372
G1 X70.938 Y129.569 E.01644
G1 X98.434 Y157.065 E1.19697
G1 X98.968 Y157.065 E.01644
G1 X70.938 Y129.034 E1.22023
G1 X70.938 Y128.5 E.01644
G1 X99.502 Y157.065 E1.24348
G1 X100.037 Y157.065 E.01644
G1 X70.938 Y127.966 E1.26674
G1 X70.938 Y127.432 E.01644
G1 X100.571 Y157.065 E1.28999
G1 X101.105 Y157.065 E.01644
G1 X70.938 Y126.898 E1.31324
G1 X70.938 Y126.364 E.01644
G1 X101.639 Y157.065 E1.3365
G1 X102.173 Y157.065 E.01644
G1 X70.938 Y125.829 E1.35975
G1 X70.938 Y125.295 E.01644
G1 X102.708 Y157.065 E1.383
G1 X103.242 Y157.065 E.01644
G1 X70.938 Y124.761 E1.40626
G1 X70.938 Y124.227 E.01644
G1 X103.776 Y157.065 E1.42951
G1 X104.31 Y157.065 E.01644
G1 X70.939 Y123.693 E1.45277
G1 X70.939 Y123.159 E.01644
G1 X104.845 Y157.065 E1.47602
G1 X105.379 Y157.065 E.01644
G1 X70.939 Y122.624 E1.49927
G1 X70.939 Y122.09 E.01644
G1 X105.913 Y157.065 E1.52253
G1 X106.447 Y157.065 E.01644
G1 X70.939 Y121.556 E1.54578
G1 X70.939 Y121.022 E.01644
G1 X106.982 Y157.065 E1.56903
G1 X107.516 Y157.065 E.01644
G1 X70.939 Y120.488 E1.59229
G1 X70.939 Y119.954 E.01644
G1 X108.05 Y157.065 E1.61554
G1 X108.584 Y157.065 E.01644
G1 X70.939 Y119.419 E1.6388
G1 X70.939 Y118.885 E.01644
G1 X109.118 Y157.065 E1.66205
G1 X109.653 Y157.065 E.01644
G1 X70.939 Y118.351 E1.6853
G1 X70.939 Y117.817 E.01644
G1 X110.187 Y157.065 E1.70856
G1 X110.721 Y157.065 E.01644
G1 X70.939 Y117.283 E1.73181
G1 X70.939 Y116.749 E.01644
G1 X111.255 Y157.065 E1.75506
G1 X111.79 Y157.065 E.01644
G1 X70.939 Y116.214 E1.77832
G1 X70.939 Y115.68 E.01644
G1 X112.324 Y157.065 E1.80157
G1 X112.858 Y157.065 E.01644
G1 X70.939 Y115.146 E1.82483
G1 X70.94 Y114.612 E.01644
G1 X113.392 Y157.065 E1.84808
G1 X113.926 Y157.065 E.01644
G1 X70.94 Y114.078 E1.87133
G1 X70.94 Y113.544 E.01644
G1 X114.461 Y157.065 E1.89459
G1 X114.995 Y157.065 E.01644
G1 X70.94 Y113.009 E1.91784
G1 X70.94 Y112.475 E.01644
G1 X115.529 Y157.065 E1.9411
G1 X116.063 Y157.065 E.01644
G1 X70.94 Y111.941 E1.96435
G1 X70.94 Y111.407 E.01644
G1 X116.598 Y157.065 E1.9876
G1 X117.132 Y157.065 E.01644
G1 X70.94 Y110.873 E2.01086
G1 X70.94 Y110.339 E.01644
G1 X117.666 Y157.065 E2.03411
G1 X118.2 Y157.065 E.01644
G1 X70.94 Y109.804 E2.05736
G1 X70.94 Y109.27 E.01644
G1 X118.735 Y157.065 E2.08062
G1 X119.269 Y157.065 E.01644
G1 X70.94 Y108.736 E2.10387
G1 X70.94 Y108.202 E.01644
G1 X119.803 Y157.065 E2.12713
G1 X120.337 Y157.065 E.01644
G1 X70.94 Y107.668 E2.15038
M73 P26 R31
G1 X70.94 Y107.134 E.01644
G1 X120.871 Y157.065 E2.17363
G1 X121.406 Y157.065 E.01644
G1 X70.94 Y106.599 E2.19689
G1 X70.94 Y106.065 E.01644
G1 X121.94 Y157.065 E2.22014
G1 X122.474 Y157.065 E.01644
G1 X70.941 Y105.531 E2.24339
G1 X70.941 Y104.997 E.01644
G1 X123.008 Y157.065 E2.26665
G1 X123.543 Y157.065 E.01644
G1 X70.941 Y104.463 E2.2899
G1 X70.941 Y103.929 E.01644
G1 X124.077 Y157.065 E2.31316
G1 X124.611 Y157.065 E.01644
G1 X70.941 Y103.394 E2.33641
G1 X70.941 Y102.86 E.01644
G1 X125.145 Y157.065 E2.35966
G1 X125.679 Y157.065 E.01644
G1 X70.993 Y102.379 E2.38063
G3 X71.083 Y101.934 I1.849 J.139 E.01401
G1 X126.214 Y157.065 E2.40001
G1 X126.748 Y157.065 E.01644
G1 X71.221 Y101.537 E2.41725
G3 X71.382 Y101.165 I1.338 J.358 E.01255
G1 X127.282 Y157.065 E2.43348
G1 X127.816 Y157.065 E.01644
G1 X71.575 Y100.824 E2.44832
G3 X71.8 Y100.514 I1.157 J.602 E.01182
G1 X128.351 Y157.065 E2.46181
G1 X128.885 Y157.065 E.01644
G1 X72.04 Y100.22 E2.47461
G3 X72.311 Y99.957 I1.214 J.981 E.01166
G1 X129.419 Y157.065 E2.48606
G1 X129.953 Y157.065 E.01644
G1 X72.612 Y99.723 E2.49623
G3 X72.935 Y99.512 I.879 J.994 E.01193
G1 X130.487 Y157.065 E2.50541
G1 X131.022 Y157.065 E.01644
G1 X73.278 Y99.321 E2.51375
G1 X73.663 Y99.172 E.01272
G1 X131.556 Y157.065 E2.52022
G1 X132.09 Y157.065 E.01644
G1 X74.073 Y99.048 E2.52564
G3 X74.526 Y98.967 I.638 J2.261 E.0142
G1 X132.624 Y157.065 E2.52916
G1 X133.159 Y157.065 E.01644
G1 X75.029 Y98.935 E2.53052
G1 X75.564 Y98.935 E.01644
G1 X133.693 Y157.065 E2.53052
G1 X134.227 Y157.065 E.01644
G1 X76.098 Y98.935 E2.53052
G1 X76.632 Y98.935 E.01644
G1 X134.761 Y157.065 E2.53052
G1 X135.296 Y157.065 E.01644
G1 X77.166 Y98.935 E2.53052
G1 X77.7 Y98.935 E.01644
G1 X135.83 Y157.065 E2.53052
G1 X136.364 Y157.065 E.01644
G1 X78.235 Y98.935 E2.53052
G1 X78.769 Y98.935 E.01644
G1 X136.898 Y157.065 E2.53052
G1 X137.432 Y157.065 E.01644
G1 X79.303 Y98.935 E2.53052
G1 X79.837 Y98.935 E.01644
G1 X137.967 Y157.065 E2.53052
G1 X138.501 Y157.065 E.01644
G1 X80.372 Y98.935 E2.53052
G1 X80.906 Y98.935 E.01644
G1 X139.035 Y157.065 E2.53052
G1 X139.569 Y157.065 E.01644
G1 X81.44 Y98.935 E2.53052
G1 X81.974 Y98.935 E.01644
G1 X140.104 Y157.065 E2.53052
G1 X140.638 Y157.065 E.01644
G1 X82.508 Y98.935 E2.53052
G1 X83.043 Y98.935 E.01644
G1 X141.172 Y157.065 E2.53052
G1 X141.706 Y157.065 E.01644
G1 X83.577 Y98.935 E2.53052
G1 X84.111 Y98.935 E.01644
G1 X142.24 Y157.065 E2.53052
G1 X142.775 Y157.065 E.01644
G1 X84.645 Y98.935 E2.53052
G1 X85.18 Y98.935 E.01644
G1 X143.309 Y157.065 E2.53052
G1 X143.843 Y157.065 E.01644
G1 X85.714 Y98.935 E2.53052
G1 X86.248 Y98.935 E.01644
G1 X144.377 Y157.065 E2.53052
G1 X144.912 Y157.065 E.01644
G1 X86.782 Y98.935 E2.53052
G1 X87.317 Y98.935 E.01644
G1 X145.446 Y157.065 E2.53052
G1 X145.98 Y157.065 E.01644
G1 X87.851 Y98.935 E2.53052
G1 X88.385 Y98.935 E.01644
G1 X146.514 Y157.065 E2.53052
G1 X147.048 Y157.065 E.01644
G1 X88.919 Y98.935 E2.53052
G1 X89.453 Y98.935 E.01644
G1 X147.583 Y157.065 E2.53052
G1 X148.117 Y157.065 E.01644
G1 X89.988 Y98.935 E2.53052
G1 X90.522 Y98.935 E.01644
G1 X148.651 Y157.065 E2.53052
G1 X149.185 Y157.065 E.01644
G1 X91.056 Y98.935 E2.53052
M73 P26 R30
G1 X91.59 Y98.935 E.01644
G1 X149.72 Y157.065 E2.53052
G1 X150.254 Y157.065 E.01644
G1 X92.125 Y98.935 E2.53052
G1 X92.659 Y98.935 E.01644
G1 X150.788 Y157.065 E2.53052
G1 X151.322 Y157.065 E.01644
G1 X93.193 Y98.935 E2.53052
G1 X93.727 Y98.935 E.01644
G1 X151.857 Y157.065 E2.53052
G1 X152.391 Y157.065 E.01644
G1 X94.262 Y98.935 E2.53052
G1 X94.796 Y98.935 E.01644
G1 X152.925 Y157.065 E2.53052
G1 X153.459 Y157.065 E.01644
G1 X95.33 Y98.935 E2.53052
G1 X95.864 Y98.935 E.01644
G1 X153.993 Y157.065 E2.53052
G1 X154.528 Y157.065 E.01644
G1 X96.398 Y98.935 E2.53052
G1 X96.933 Y98.935 E.01644
G1 X155.062 Y157.065 E2.53052
G1 X155.596 Y157.065 E.01644
G1 X97.467 Y98.935 E2.53052
G1 X98.001 Y98.935 E.01644
G1 X156.13 Y157.065 E2.53052
G1 X156.665 Y157.065 E.01644
G1 X98.535 Y98.935 E2.53052
G1 X99.07 Y98.935 E.01644
G1 X157.199 Y157.065 E2.53052
G1 X157.733 Y157.065 E.01644
G1 X99.604 Y98.935 E2.53052
G1 X100.138 Y98.935 E.01644
G1 X158.267 Y157.065 E2.53052
G1 X158.801 Y157.065 E.01644
G1 X100.672 Y98.935 E2.53052
G1 X101.206 Y98.935 E.01644
G1 X159.336 Y157.065 E2.53052
G1 X159.87 Y157.065 E.01644
G1 X101.741 Y98.935 E2.53052
G1 X102.275 Y98.935 E.01644
G1 X160.404 Y157.065 E2.53052
G1 X160.938 Y157.065 E.01644
G1 X102.809 Y98.935 E2.53052
G1 X103.343 Y98.935 E.01644
G1 X161.473 Y157.065 E2.53052
M73 P27 R30
G1 X162.007 Y157.065 E.01644
G1 X103.878 Y98.935 E2.53052
G1 X104.412 Y98.935 E.01644
G1 X162.541 Y157.065 E2.53052
G1 X163.075 Y157.065 E.01644
G1 X104.946 Y98.935 E2.53052
G1 X105.48 Y98.935 E.01644
G1 X163.61 Y157.065 E2.53052
G1 X164.144 Y157.065 E.01644
G1 X106.015 Y98.935 E2.53052
G1 X106.549 Y98.935 E.01644
G1 X164.678 Y157.065 E2.53052
G1 X165.212 Y157.065 E.01644
G1 X107.083 Y98.935 E2.53052
G1 X107.617 Y98.935 E.01644
G1 X165.746 Y157.065 E2.53052
G1 X166.281 Y157.065 E.01644
G1 X108.151 Y98.935 E2.53052
G1 X108.686 Y98.935 E.01644
G1 X166.815 Y157.065 E2.53052
G1 X167.349 Y157.065 E.01644
G1 X109.22 Y98.935 E2.53052
G1 X109.754 Y98.935 E.01644
G1 X167.883 Y157.065 E2.53052
G1 X168.418 Y157.065 E.01644
G1 X110.288 Y98.935 E2.53052
G1 X110.823 Y98.935 E.01644
G1 X168.952 Y157.065 E2.53052
G1 X169.486 Y157.065 E.01644
G1 X111.357 Y98.935 E2.53052
G1 X111.891 Y98.935 E.01644
G1 X170.02 Y157.065 E2.53052
G1 X170.554 Y157.065 E.01644
G1 X112.425 Y98.935 E2.53052
G1 X112.96 Y98.935 E.01644
G1 X171.089 Y157.065 E2.53052
G1 X171.623 Y157.065 E.01644
G1 X113.494 Y98.935 E2.53052
G1 X114.028 Y98.935 E.01644
G1 X172.157 Y157.065 E2.53052
G1 X172.691 Y157.065 E.01644
G1 X114.562 Y98.935 E2.53052
G1 X115.096 Y98.936 E.01644
G1 X173.226 Y157.065 E2.53052
G1 X173.76 Y157.065 E.01644
G1 X115.631 Y98.936 E2.53052
G1 X116.165 Y98.936 E.01644
G1 X174.294 Y157.065 E2.53052
G1 X174.828 Y157.065 E.01644
G1 X116.699 Y98.936 E2.53052
G1 X117.233 Y98.936 E.01644
G1 X175.362 Y157.065 E2.53052
G1 X175.897 Y157.065 E.01644
G1 X117.768 Y98.936 E2.53052
G1 X118.302 Y98.936 E.01644
G1 X176.431 Y157.065 E2.53052
G1 X176.965 Y157.065 E.01644
G1 X118.836 Y98.936 E2.53052
G1 X119.37 Y98.936 E.01644
G1 X177.499 Y157.065 E2.53052
G1 X178.034 Y157.065 E.01644
G1 X119.904 Y98.936 E2.53052
G1 X120.439 Y98.936 E.01644
G1 X178.568 Y157.065 E2.53052
G1 X179.102 Y157.065 E.01644
G1 X120.973 Y98.936 E2.53052
G1 X121.507 Y98.936 E.01644
G1 X179.636 Y157.065 E2.53052
G1 X180.171 Y157.065 E.01644
G1 X122.041 Y98.936 E2.53052
G1 X122.576 Y98.936 E.01644
G1 X180.705 Y157.065 E2.53052
G1 X181.239 Y157.065 E.01644
G1 X123.11 Y98.936 E2.53052
G1 X123.644 Y98.936 E.01644
G1 X181.773 Y157.065 E2.53052
G1 X182.307 Y157.065 E.01644
G1 X124.178 Y98.936 E2.53052
G1 X124.713 Y98.936 E.01644
G1 X182.842 Y157.065 E2.53052
G1 X183.376 Y157.065 E.01644
G1 X125.247 Y98.936 E2.53052
G1 X125.781 Y98.936 E.01644
G1 X183.91 Y157.065 E2.53052
G1 X184.444 Y157.065 E.01644
G1 X126.315 Y98.936 E2.53052
G1 X126.849 Y98.936 E.01644
G1 X184.979 Y157.065 E2.53052
G2 X185.48 Y157.032 I-.297 J-8.516 E.01548
G1 X127.384 Y98.936 E2.52911
G1 X127.918 Y98.936 E.01644
G1 X185.933 Y156.951 E2.52556
G2 X186.342 Y156.826 I-.303 J-1.722 E.0132
G1 X128.452 Y98.936 E2.52012
G1 X128.986 Y98.936 E.01644
G1 X186.728 Y156.677 E2.51364
G2 X187.077 Y156.492 I-.575 J-1.51 E.0122
G1 X129.521 Y98.936 E2.5056
G1 X130.055 Y98.936 E.01644
G1 X187.392 Y156.272 E2.49602
G2 X187.689 Y156.035 I-.65 J-1.121 E.01174
G1 X130.589 Y98.936 E2.48571
G1 X131.123 Y98.936 E.01644
G1 X187.963 Y155.775 E2.47437
G2 X188.204 Y155.482 I-.867 J-.959 E.01173
G1 X131.658 Y98.936 E2.46161
G1 X132.192 Y98.936 E.01644
G1 X188.428 Y155.171 E2.4481
G1 X188.621 Y154.83 E.01207
G1 X132.726 Y98.936 E2.43325
G1 X133.26 Y98.936 E.01644
G1 X188.782 Y154.457 E2.41699
G2 X188.916 Y154.057 I-1.292 J-.658 E.01303
G1 X133.794 Y98.936 E2.3996
G1 X134.329 Y98.936 E.01644
G1 X189.015 Y153.622 E2.38063
G2 X189.059 Y153.132 I-7.495 J-.928 E.01514
G1 X134.863 Y98.936 E2.35931
G1 X135.397 Y98.936 E.01644
G1 X189.059 Y152.598 E2.33605
G1 X189.059 Y152.063 E.01644
G1 X135.931 Y98.936 E2.3128
G1 X136.466 Y98.936 E.01644
G1 X189.059 Y151.529 E2.28954
G1 X189.059 Y150.995 E.01644
G1 X137 Y98.936 E2.26628
G1 X137.534 Y98.936 E.01644
G1 X189.059 Y150.461 E2.24303
G1 X189.059 Y149.927 E.01644
G1 X138.068 Y98.936 E2.21977
G1 X138.602 Y98.936 E.01644
G1 X189.059 Y149.392 E2.19652
G1 X189.059 Y148.858 E.01644
G1 X139.137 Y98.936 E2.17326
G1 X139.671 Y98.936 E.01644
G1 X189.059 Y148.324 E2.15
G1 X189.059 Y147.79 E.01644
G1 X140.205 Y98.936 E2.12675
G1 X140.739 Y98.936 E.01644
G1 X189.059 Y147.255 E2.10349
M73 P28 R30
G1 X189.059 Y146.721 E.01644
G1 X141.274 Y98.936 E2.08023
G1 X141.808 Y98.936 E.01644
G1 X189.059 Y146.187 E2.05698
G1 X189.059 Y145.653 E.01644
G1 X142.342 Y98.936 E2.03372
G1 X142.876 Y98.936 E.01644
G1 X189.059 Y145.118 E2.01046
G1 X189.059 Y144.584 E.01644
G1 X143.411 Y98.936 E1.98721
G1 X143.945 Y98.936 E.01644
G1 X189.059 Y144.05 E1.96395
G1 X189.059 Y143.516 E.01644
G1 X144.479 Y98.936 E1.9407
G1 X145.013 Y98.936 E.01644
G1 X189.059 Y142.982 E1.91744
G1 X189.059 Y142.447 E.01644
G1 X145.547 Y98.936 E1.89418
G1 X146.082 Y98.936 E.01644
G1 X189.059 Y141.913 E1.87093
G1 X189.059 Y141.379 E.01644
G1 X146.616 Y98.936 E1.84767
G1 X147.15 Y98.936 E.01644
G1 X189.059 Y140.845 E1.82441
G1 X189.059 Y140.31 E.01644
G1 X147.684 Y98.936 E1.80116
G1 X148.219 Y98.936 E.01644
G1 X189.059 Y139.776 E1.7779
G1 X189.059 Y139.242 E.01644
G1 X148.753 Y98.936 E1.75464
G1 X149.287 Y98.936 E.01644
G1 X189.059 Y138.708 E1.73139
G1 X189.059 Y138.174 E.01644
G1 X149.821 Y98.936 E1.70813
G1 X150.355 Y98.936 E.01644
G1 X189.059 Y137.639 E1.68487
G1 X189.059 Y137.105 E.01644
G1 X150.89 Y98.936 E1.66162
G1 X151.424 Y98.936 E.01644
G1 X189.059 Y136.571 E1.63836
G1 X189.059 Y136.037 E.01644
G1 X151.958 Y98.936 E1.61511
G1 X152.492 Y98.936 E.01644
G1 X189.059 Y135.502 E1.59185
G1 X189.059 Y134.968 E.01644
G1 X153.027 Y98.936 E1.56859
G1 X153.561 Y98.936 E.01644
G1 X189.059 Y134.434 E1.54534
G1 X189.059 Y133.9 E.01644
G1 X154.095 Y98.936 E1.52208
G1 X154.629 Y98.936 E.01644
G1 X189.059 Y133.366 E1.49882
G1 X189.059 Y132.831 E.01644
G1 X155.164 Y98.936 E1.47557
G1 X155.698 Y98.936 E.01644
G1 X189.059 Y132.297 E1.45231
G1 X189.059 Y131.763 E.01644
G1 X156.232 Y98.936 E1.42905
G1 X156.766 Y98.936 E.01644
G1 X189.059 Y131.229 E1.4058
G1 X189.059 Y130.694 E.01644
G1 X157.3 Y98.936 E1.38254
G1 X157.835 Y98.936 E.01644
G1 X189.059 Y130.16 E1.35929
G1 X189.059 Y129.626 E.01644
G1 X158.369 Y98.936 E1.33603
G1 X158.903 Y98.936 E.01644
G1 X189.059 Y129.092 E1.31277
G1 X189.059 Y128.557 E.01644
G1 X159.437 Y98.936 E1.28952
G1 X159.972 Y98.936 E.01644
G1 X189.059 Y128.023 E1.26626
G1 X189.059 Y127.489 E.01644
G1 X160.506 Y98.936 E1.243
G1 X161.04 Y98.936 E.01644
G1 X189.059 Y126.955 E1.21975
G1 X189.059 Y126.421 E.01644
G1 X161.574 Y98.936 E1.19649
G1 X162.109 Y98.936 E.01644
G1 X189.059 Y125.886 E1.17323
G1 X189.059 Y125.352 E.01644
G1 X162.643 Y98.936 E1.14998
G1 X163.177 Y98.936 E.01644
G1 X189.059 Y124.818 E1.12672
G1 X189.059 Y124.284 E.01644
G1 X163.711 Y98.936 E1.10347
G1 X164.245 Y98.936 E.01644
G1 X189.059 Y123.749 E1.08021
G1 X189.059 Y123.215 E.01644
G1 X164.78 Y98.936 E1.05695
G1 X165.314 Y98.936 E.01644
G1 X189.059 Y122.681 E1.0337
G1 X189.059 Y122.147 E.01644
G1 X165.848 Y98.936 E1.01044
G1 X166.382 Y98.936 E.01644
G1 X189.059 Y121.613 E.98718
G1 X189.059 Y121.078 E.01644
G1 X166.917 Y98.936 E.96393
G1 X167.451 Y98.936 E.01644
G1 X189.059 Y120.544 E.94067
G1 X189.059 Y120.01 E.01644
G1 X167.985 Y98.936 E.91741
G1 X168.519 Y98.936 E.01644
G1 X189.059 Y119.476 E.89416
G1 X189.059 Y118.941 E.01644
G1 X169.053 Y98.936 E.8709
G1 X169.588 Y98.936 E.01644
G1 X189.059 Y118.407 E.84764
G1 X189.059 Y117.873 E.01644
G1 X170.122 Y98.936 E.82439
G1 X170.656 Y98.936 E.01644
G1 X189.059 Y117.339 E.80113
G1 X189.059 Y116.805 E.01644
G1 X171.19 Y98.936 E.77788
G1 X171.725 Y98.936 E.01644
G1 X189.059 Y116.27 E.75462
G1 X189.059 Y115.736 E.01644
G1 X172.259 Y98.936 E.73136
G1 X172.793 Y98.936 E.01644
G1 X189.059 Y115.202 E.70811
G1 X189.059 Y114.668 E.01644
G1 X173.327 Y98.936 E.68485
G1 X173.862 Y98.936 E.01644
G1 X189.059 Y114.133 E.66159
G1 X189.059 Y113.599 E.01644
G1 X174.396 Y98.936 E.63834
G1 X174.93 Y98.936 E.01644
G1 X189.059 Y113.065 E.61508
G1 X189.059 Y112.531 E.01644
G1 X175.464 Y98.936 E.59182
G1 X175.998 Y98.936 E.01644
G1 X189.059 Y111.996 E.56857
G1 X189.059 Y111.462 E.01644
G1 X176.533 Y98.936 E.54531
G1 X177.067 Y98.936 E.01644
G1 X189.059 Y110.928 E.52206
G1 X189.059 Y110.394 E.01644
G1 X177.601 Y98.936 E.4988
G1 X178.135 Y98.936 E.01644
G1 X189.059 Y109.86 E.47554
G1 X189.059 Y109.325 E.01644
G1 X178.67 Y98.936 E.45229
G1 X179.204 Y98.936 E.01644
G1 X189.059 Y108.791 E.42903
G1 X189.059 Y108.257 E.01644
G1 X179.738 Y98.936 E.40577
G1 X180.272 Y98.936 E.01644
G1 X189.059 Y107.723 E.38252
G1 X189.059 Y107.188 E.01644
G1 X180.807 Y98.936 E.35926
G1 X181.341 Y98.936 E.01644
G1 X189.059 Y106.654 E.336
G1 X189.059 Y106.12 E.01644
G1 X181.875 Y98.936 E.31275
G1 X182.409 Y98.936 E.01644
G1 X189.059 Y105.586 E.28949
G1 X189.059 Y105.052 E.01644
G1 X182.943 Y98.936 E.26624
G1 X183.478 Y98.936 E.01644
G1 X189.059 Y104.517 E.24298
G1 X189.059 Y103.983 E.01644
G1 X184.012 Y98.936 E.21972
G1 X184.546 Y98.936 E.01644
G1 X189.059 Y103.449 E.19647
G1 X189.059 Y102.915 E.01644
G1 X185.084 Y98.94 E.17303
G3 X185.675 Y98.997 I.006 J3.046 E.0183
G1 X189.005 Y102.326 E.14493
G2 X188.802 Y101.589 I-3.089 J.454 E.02359
G1 X186.404 Y99.191 E.10437
G3 X187.578 Y99.858 I-1.335 J3.715 E.04177
G3 X188.708 Y100.961 I-10.653 J12.048 E.04861
M106 S242.25
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X187.871 Y100.124 E-.44968
G1 X187.578 Y99.858 E-.15031
G1 X187.258 Y99.621 E-.15155
G1 X187.239 Y99.609 E-.00846
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
G3 Z1 I-.031 J-1.217 P1  F30000
G1 X70.625 Y102.568 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X70.627 Y102.546 E.00074
G3 X75.007 Y98.602 I4.386 J.467 E.21413
G1 X185.017 Y98.603 E3.64922
G3 X189.398 Y103.007 I-.029 J4.41 E.22864
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.411 J-.006 E.22946
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I.006 J-4.411 E.22946
G1 X70.602 Y103.007 E1.6581
G1 X70.622 Y102.628 E.0126
G1 X70.234 Y102.548 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.237 Y102.507 E.00126
G3 X75.003 Y98.21 I4.777 J.507 E.2159
G1 X185.022 Y98.211 E3.38059
G3 X189.79 Y103.003 I-.035 J4.803 E.23041
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.804 J-.012 E.23117
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.012 J-4.804 E.23117
G1 X70.21 Y103.003 E1.5362
G1 X70.231 Y102.608 E.01216
M204 S10000
; WIPE_START
G1 F24000
G1 X70.237 Y102.507 E-.03838
G1 X70.302 Y102.066 E-.16948
G1 X70.424 Y101.587 E-.18774
G1 X70.575 Y101.167 E-.16948
G1 X70.788 Y100.721 E-.18774
G1 X70.797 Y100.705 E-.00718
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.211 J.117 P1  F30000
G1 X76.219 Y157.05 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X74.591 Y157.027 I-.59 J-16.07 E.05402
G1 X70.972 Y153.408 E.16979
G2 X71.815 Y155.481 I4.145 J-.477 E.07517
G1 X128.346 Y98.951 E2.65197
G1 X131.655 Y98.951 E.10977
G1 X188.191 Y155.487 E2.65223
G2 X189.023 Y153.413 I-3.371 J-2.557 E.07503
G1 X185.408 Y157.028 E.16961
G3 X182.078 Y157.05 I-1.88 J-33.027 E.11052
G1 X123.979 Y98.951 E2.72555
G1 X120.67 Y98.951 E.10976
G1 X70.951 Y148.669 E2.33241
G1 X70.951 Y145.711 E.09814
G1 X82.29 Y157.05 E.53193
G1 X85.598 Y157.05 E.10975
G1 X143.697 Y98.951 E2.72554
G1 X147.007 Y98.951 E.10977
G1 X189.044 Y140.988 E1.97207
G1 X189.044 Y138.04 E.09782
G1 X170.034 Y157.05 E.8918
G1 X166.726 Y157.05 E.10975
M73 P29 R30
G1 X108.626 Y98.951 E2.72555
G1 X105.318 Y98.951 E.10976
G1 X70.952 Y133.316 E1.61214
G1 X70.953 Y130.361 E.09803
G1 X97.642 Y157.05 E1.25204
M73 P29 R29
G1 X100.95 Y157.05 E.10975
G1 X159.049 Y98.951 E2.72554
G1 X162.359 Y98.951 E.10978
G1 X189.044 Y125.636 E1.25188
G1 X189.044 Y122.688 E.09782
G1 X154.682 Y157.05 E1.612
G1 X151.374 Y157.05 E.10975
G1 X93.274 Y98.95 E2.72555
G1 X89.966 Y98.95 E.10975
G1 X70.954 Y117.962 E.89188
G1 X70.954 Y115.01 E.09792
G1 X112.994 Y157.05 E1.97215
G1 X116.302 Y157.05 E.10975
G1 X174.401 Y98.951 E2.72553
G1 X177.711 Y98.951 E.10978
G1 X189.044 Y110.285 E.53168
G1 X189.044 Y107.336 E.09782
G1 X139.33 Y157.05 E2.33219
G1 X136.022 Y157.05 E.10975
G1 X77.922 Y98.95 E2.72556
G2 X74.592 Y98.972 I-1.45 J33.044 E.11052
G1 X70.984 Y102.581 E.16929
G3 X71.815 Y100.519 I4.009 J.418 E.07472
G1 X128.346 Y157.05 E2.65198
G1 X131.654 Y157.05 E.10975
G1 X188.191 Y100.513 E2.65224
G3 X189.023 Y102.587 I-3.951 J2.79 E.07482
G1 X185.408 Y98.972 E.16961
G2 X182.077 Y98.951 I-1.867 J31.849 E.11054
G1 X123.978 Y157.05 E2.72553
G1 X120.67 Y157.05 E.10975
G1 X70.955 Y107.335 E2.33221
G1 X70.955 Y110.285 E.09786
G1 X82.29 Y98.95 E.53175
G1 X85.598 Y98.95 E.10975
G1 X143.698 Y157.05 E2.72556
G1 X147.006 Y157.05 E.10975
G1 X189.044 Y115.012 E1.97209
G1 X189.044 Y117.96 E.09782
G1 X170.035 Y98.951 E.89178
G1 X166.725 Y98.951 E.10978
G1 X108.626 Y157.05 E2.72554
G1 X105.318 Y157.05 E.10975
G1 X70.954 Y122.685 E1.6121
G1 X70.953 Y125.639 E.09797
G1 X97.642 Y98.95 E1.25201
G1 X100.95 Y98.95 E.10976
G1 X159.05 Y157.05 E2.72555
G1 X162.358 Y157.05 E.10975
G1 X189.044 Y130.364 E1.2519
G1 X189.044 Y133.312 E.09782
G1 X154.683 Y98.951 E1.61197
G1 X151.373 Y98.951 E.10977
G1 X93.274 Y157.05 E2.72554
G1 X89.966 Y157.05 E.10975
G1 X70.952 Y138.036 E.89199
G1 X70.952 Y140.993 E.09808
G1 X112.994 Y98.951 E1.97228
G1 X116.303 Y98.951 E.10976
G1 X174.402 Y157.05 E2.72555
G1 X177.71 Y157.05 E.10975
G1 X189.044 Y145.715 E.53171
G1 X189.044 Y148.664 E.09782
G1 X139.331 Y98.951 E2.33217
G1 X136.021 Y98.951 E.10977
G1 X77.922 Y157.05 E2.72554
G1 X79.551 Y157.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X77.922 Y157.05 E-.61876
G1 X78.185 Y156.787 E-.14124
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
G3 Z1.2 I1.205 J-.168 P1  F30000
G1 X70.624 Y102.569 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X75.007 Y98.602 I4.389 J.444 E.2149
G1 X185.024 Y98.603 E3.64946
G3 X189.398 Y103.007 I-.036 J4.41 E.22841
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.411 J-.006 E.22946
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I.006 J-4.411 E.22946
G1 X70.602 Y103.007 E1.6581
G3 X70.619 Y102.629 I4.411 J.006 E.01258
G1 X70.232 Y102.548 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.234 Y102.531 E.00052
G3 X75.003 Y98.21 I4.78 J.483 E.21664
G1 X185.029 Y98.211 E3.3808
G3 X189.79 Y103.003 I-.042 J4.803 E.23019
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.804 J-.012 E.23117
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.012 J-4.804 E.23117
G1 X70.21 Y103.003 E1.5362
G1 X70.229 Y102.607 E.01215
M204 S10000
; WIPE_START
G1 F24000
G1 X70.234 Y102.531 E-.02927
G1 X70.302 Y102.066 E-.1786
G1 X70.416 Y101.61 E-.17863
G1 X70.564 Y101.196 E-.16686
G1 X70.776 Y100.742 E-.19036
G1 X70.798 Y100.705 E-.01628
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.211 J.117 P1  F30000
G1 X76.219 Y157.05 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X74.591 Y157.027 I-.59 J-16.07 E.05402
G1 X70.972 Y153.408 E.16979
G2 X71.815 Y155.481 I4.141 J-.475 E.07517
G1 X128.345 Y98.951 E2.65196
G1 X131.655 Y98.951 E.10977
G1 X188.185 Y155.481 E2.65196
G2 X189.023 Y153.413 I-3.266 J-2.527 E.07497
G1 X185.408 Y157.028 E.16961
G3 X182.078 Y157.05 I-1.88 J-33.038 E.11052
G1 X123.979 Y98.951 E2.72554
G1 X120.67 Y98.951 E.10977
G1 X70.951 Y148.669 E2.33241
G1 X70.951 Y145.711 E.09814
G1 X82.29 Y157.05 E.53193
G1 X85.598 Y157.05 E.10975
G1 X143.697 Y98.951 E2.72554
G1 X147.007 Y98.951 E.10978
G1 X189.044 Y140.988 E1.97207
G1 X189.044 Y138.04 E.09782
G1 X170.034 Y157.05 E.8918
G1 X166.726 Y157.05 E.10975
G1 X108.627 Y98.951 E2.72555
G1 X105.318 Y98.951 E.10976
G1 X70.952 Y133.316 E1.61214
G1 X70.953 Y130.361 E.09803
G1 X97.642 Y157.05 E1.25204
G1 X100.95 Y157.05 E.10975
G1 X159.049 Y98.951 E2.72553
G1 X162.359 Y98.951 E.10979
G1 X189.044 Y125.636 E1.25187
G1 X189.044 Y122.688 E.09782
G1 X154.682 Y157.05 E1.612
G1 X151.374 Y157.05 E.10975
G1 X93.275 Y98.95 E2.72555
G1 X89.966 Y98.95 E.10975
G1 X70.954 Y117.962 E.89188
G1 X70.954 Y115.01 E.09792
G1 X112.994 Y157.05 E1.97215
G1 X116.302 Y157.05 E.10975
G1 X174.401 Y98.951 E2.72553
G1 X177.711 Y98.951 E.10979
G1 X189.044 Y110.285 E.53168
G1 X189.044 Y107.336 E.09782
G1 X139.33 Y157.05 E2.33219
G1 X136.022 Y157.05 E.10975
G1 X77.922 Y98.95 E2.72556
G2 X74.592 Y98.972 I-1.45 J33.055 E.11052
G1 X70.984 Y102.581 E.16929
G3 X71.809 Y100.513 I4.123 J.448 E.07477
G1 X128.346 Y157.05 E2.65224
G1 X131.654 Y157.05 E.10975
G1 X188.191 Y100.513 E2.65224
G3 X189.023 Y102.587 I-3.951 J2.79 E.07482
G1 X185.408 Y98.972 E.16961
G2 X182.077 Y98.951 I-1.864 J31.511 E.11054
G1 X123.978 Y157.05 E2.72552
G1 X120.67 Y157.05 E.10975
G1 X70.955 Y107.335 E2.33221
G1 X70.955 Y110.285 E.09786
G1 X82.29 Y98.95 E.53174
G1 X85.598 Y98.95 E.10975
G1 X143.698 Y157.05 E2.72555
G1 X147.006 Y157.05 E.10975
G1 X189.044 Y115.012 E1.97209
G1 X189.044 Y117.96 E.09782
G1 X170.035 Y98.951 E.89177
G1 X166.725 Y98.951 E.10979
G1 X108.626 Y157.05 E2.72553
G1 X105.318 Y157.05 E.10975
G1 X70.954 Y122.685 E1.6121
G1 X70.953 Y125.639 E.09797
G1 X97.642 Y98.951 E1.25201
G1 X100.951 Y98.951 E.10976
G1 X159.05 Y157.05 E2.72555
G1 X162.358 Y157.05 E.10975
G1 X189.044 Y130.364 E1.2519
G1 X189.044 Y133.312 E.09782
G1 X154.683 Y98.951 E1.61197
G1 X151.373 Y98.951 E.10978
G1 X93.274 Y157.05 E2.72553
G1 X89.966 Y157.05 E.10975
G1 X70.952 Y138.036 E.89199
G1 X70.952 Y140.993 E.09808
G1 X112.994 Y98.951 E1.97227
G1 X116.303 Y98.951 E.10976
G1 X174.402 Y157.05 E2.72554
G1 X177.71 Y157.05 E.10975
G1 X189.044 Y145.715 E.53171
G1 X189.044 Y148.664 E.09782
G1 X139.331 Y98.951 E2.33216
G1 X136.021 Y98.951 E.10978
G1 X77.922 Y157.05 E2.72554
G1 X79.551 Y157.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X77.922 Y157.05 E-.61876
G1 X78.185 Y156.787 E-.14124
; WIPE_END
M73 P30 R29
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
G3 Z1.4 I1.205 J-.168 P1  F30000
G1 X70.624 Y102.569 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X75.007 Y98.602 I4.389 J.444 E.2149
G1 X185.031 Y98.603 E3.64969
G3 X189.398 Y103.007 I-.043 J4.41 E.22818
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.411 J-.006 E.22946
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I.006 J-4.411 E.22946
G1 X70.602 Y103.007 E1.6581
G3 X70.619 Y102.629 I4.411 J.006 E.01258
G1 X70.232 Y102.548 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.234 Y102.531 E.00052
G3 X75.003 Y98.21 I4.78 J.483 E.21664
G1 X185.036 Y98.211 E3.38102
G3 X189.79 Y103.003 I-.049 J4.803 E.22998
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.804 J-.012 E.23117
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.012 J-4.804 E.23117
G1 X70.21 Y103.003 E1.5362
G1 X70.229 Y102.607 E.01216
M204 S10000
; WIPE_START
G1 F24000
G1 X70.234 Y102.531 E-.02926
G1 X70.302 Y102.066 E-.1786
G1 X70.428 Y101.574 E-.19296
G1 X70.575 Y101.167 E-.16425
G1 X70.776 Y100.742 E-.17862
G1 X70.798 Y100.705 E-.0163
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.211 J.117 P1  F30000
G1 X76.219 Y157.05 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X74.591 Y157.027 I-.59 J-16.069 E.05402
G1 X70.972 Y153.408 E.16979
G2 X71.815 Y155.481 I4.137 J-.473 E.07517
G1 X128.345 Y98.951 E2.65196
G1 X131.655 Y98.951 E.10978
G1 X188.185 Y155.481 E2.65196
G2 X189.023 Y153.413 I-3.266 J-2.527 E.07497
G1 X185.408 Y157.028 E.16961
G3 X182.078 Y157.05 I-1.88 J-33.028 E.11052
G1 X123.979 Y98.951 E2.72554
G1 X120.669 Y98.951 E.10977
G1 X70.951 Y148.669 E2.3324
G1 X70.951 Y145.711 E.09814
G1 X82.29 Y157.05 E.53193
G1 X85.598 Y157.05 E.10975
G1 X143.697 Y98.951 E2.72553
G1 X147.007 Y98.951 E.10979
G1 X189.044 Y140.988 E1.97206
G1 X189.044 Y138.04 E.09782
G1 X170.034 Y157.05 E.8918
G1 X166.726 Y157.05 E.10975
G1 X108.627 Y98.951 E2.72554
G1 X105.318 Y98.951 E.10976
G1 X70.952 Y133.316 E1.61214
G1 X70.953 Y130.361 E.09803
G1 X97.642 Y157.05 E1.25204
G1 X100.95 Y157.05 E.10975
G1 X159.049 Y98.951 E2.72552
G1 X162.359 Y98.951 E.1098
G1 X189.044 Y125.636 E1.25186
G1 X189.044 Y122.688 E.09782
G1 X154.682 Y157.05 E1.612
G1 X151.374 Y157.05 E.10975
G1 X93.275 Y98.951 E2.72555
G1 X89.966 Y98.95 E.10976
G1 X70.954 Y117.962 E.89188
G1 X70.954 Y115.01 E.09792
G1 X112.994 Y157.05 E1.97215
G1 X116.302 Y157.05 E.10975
G1 X174.401 Y98.951 E2.72552
G1 X177.711 Y98.951 E.1098
G1 X189.044 Y110.285 E.53167
G1 X189.044 Y107.336 E.09782
G1 X139.33 Y157.05 E2.33219
G1 X136.022 Y157.05 E.10975
G1 X77.922 Y98.95 E2.72556
G2 X74.592 Y98.972 I-1.45 J33.052 E.11052
G1 X70.984 Y102.581 E.16929
G3 X71.809 Y100.513 I4.099 J.438 E.07478
G1 X128.346 Y157.05 E2.65224
G1 X131.654 Y157.05 E.10975
G1 X188.191 Y100.513 E2.65224
G3 X189.023 Y102.587 I-3.203 J2.49 E.07511
G1 X185.408 Y98.972 E.16961
G2 X182.077 Y98.951 I-1.86 J31.167 E.11055
G1 X123.978 Y157.05 E2.72552
G1 X120.67 Y157.05 E.10975
G1 X70.955 Y107.335 E2.33221
G1 X70.955 Y110.285 E.09786
G1 X82.29 Y98.95 E.53174
G1 X85.599 Y98.95 E.10975
G1 X143.698 Y157.05 E2.72555
G1 X147.006 Y157.05 E.10975
G1 X189.044 Y115.012 E1.97209
G1 X189.044 Y117.96 E.09782
G1 X170.035 Y98.951 E.89177
G1 X166.725 Y98.951 E.1098
G1 X108.626 Y157.05 E2.72552
G1 X105.318 Y157.05 E.10975
G1 X70.954 Y122.685 E1.6121
G1 X70.953 Y125.639 E.09797
G1 X97.642 Y98.951 E1.25201
G1 X100.951 Y98.951 E.10976
G1 X159.05 Y157.05 E2.72555
G1 X162.358 Y157.05 E.10975
G1 X189.044 Y130.364 E1.2519
G1 X189.044 Y133.312 E.09782
G1 X154.683 Y98.951 E1.61196
G1 X151.373 Y98.951 E.10979
G1 X93.274 Y157.05 E2.72553
G1 X89.966 Y157.05 E.10975
G1 X70.952 Y138.036 E.89199
G1 X70.952 Y140.993 E.09808
G1 X112.994 Y98.951 E1.97227
G1 X116.303 Y98.951 E.10977
G1 X174.402 Y157.05 E2.72554
G1 X177.71 Y157.05 E.10975
G1 X189.044 Y145.715 E.53171
G1 X189.044 Y148.664 E.09782
G1 X139.331 Y98.951 E2.33216
G1 X136.021 Y98.951 E.10978
G1 X77.922 Y157.05 E2.72553
G1 X79.551 Y157.05 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X77.922 Y157.05 E-.61876
G1 X78.185 Y156.787 E-.14124
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
G3 Z1.6 I1.205 J-.168 P1  F30000
G1 X70.624 Y102.569 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X75.007 Y98.602 I4.389 J.444 E.2149
G1 X185.038 Y98.603 E3.64992
G3 X189.398 Y103.007 I-.05 J4.409 E.22794
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.411 J-.006 E.22946
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I.006 J-4.411 E.22946
G1 X70.602 Y103.007 E1.6581
G3 X70.619 Y102.629 I4.411 J.006 E.01258
G1 X70.232 Y102.547 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.234 Y102.531 E.00052
G3 X75.003 Y98.21 I4.78 J.483 E.21664
G1 X185.043 Y98.211 E3.38123
G3 X189.79 Y103.003 I-.056 J4.802 E.22976
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.804 J-.012 E.23117
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.012 J-4.804 E.23117
G1 X70.21 Y103.003 E1.5362
G1 X70.229 Y102.607 E.01216
M204 S10000
; WIPE_START
G1 F24000
G1 X70.234 Y102.531 E-.02924
G1 X70.302 Y102.066 E-.1786
G1 X70.43 Y101.567 E-.19559
G1 X70.575 Y101.167 E-.16163
G1 X70.776 Y100.742 E-.17862
G1 X70.798 Y100.705 E-.01631
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.019 J1.217 P1  F30000
G1 X180.448 Y98.951 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X182.076 Y98.951 E.05401
G1 X123.978 Y157.05 E2.72551
G1 X120.67 Y157.05 E.10975
G1 X70.955 Y107.335 E2.33221
G1 X70.955 Y110.285 E.09786
G1 X82.29 Y98.95 E.53174
G1 X85.599 Y98.95 E.10975
G1 X143.698 Y157.05 E2.72555
G1 X147.006 Y157.05 E.10975
G1 X189.044 Y115.012 E1.97209
G1 X189.044 Y117.96 E.09782
G1 X170.035 Y98.951 E.89176
G1 X166.725 Y98.951 E.10981
G1 X108.626 Y157.05 E2.72551
G1 X105.318 Y157.05 E.10975
G1 X70.954 Y122.685 E1.6121
G1 X70.953 Y125.639 E.09797
G1 X97.642 Y98.951 E1.25201
G1 X100.951 Y98.951 E.10976
G1 X159.05 Y157.05 E2.72555
G1 X162.358 Y157.05 E.10975
G1 X189.044 Y130.364 E1.2519
G1 X189.044 Y133.312 E.09782
G1 X154.683 Y98.951 E1.61196
G1 X151.373 Y98.951 E.1098
G1 X93.274 Y157.05 E2.72552
G1 X89.966 Y157.05 E.10975
G1 X70.952 Y138.036 E.89199
G1 X70.952 Y140.993 E.09808
G1 X112.993 Y98.951 E1.97227
G1 X116.303 Y98.951 E.10977
G1 X174.402 Y157.05 E2.72554
M73 P31 R29
G1 X177.71 Y157.05 E.10975
G1 X189.044 Y145.715 E.53171
G1 X189.044 Y148.664 E.09782
G1 X139.331 Y98.951 E2.33216
G1 X136.021 Y98.951 E.10979
G1 X77.922 Y157.05 E2.72553
G3 X74.591 Y157.027 I-1.458 J-30.542 E.11056
G1 X70.972 Y153.408 E.16979
G2 X71.815 Y155.481 I4.131 J-.471 E.07518
G1 X128.345 Y98.951 E2.65196
G1 X131.655 Y98.951 E.10978
G1 X188.185 Y155.481 E2.65196
G2 X189.023 Y153.413 I-3.266 J-2.527 E.07497
G1 X185.408 Y157.028 E.16961
G3 X182.078 Y157.05 I-1.88 J-33.036 E.11052
G1 X123.979 Y98.951 E2.72553
G1 X120.669 Y98.951 E.10978
G1 X70.951 Y148.669 E2.3324
G1 X70.951 Y145.711 E.09814
G1 X82.29 Y157.05 E.53193
G1 X85.598 Y157.05 E.10975
G1 X143.697 Y98.951 E2.72553
G1 X147.007 Y98.951 E.10979
G1 X189.044 Y140.988 E1.97206
G1 X189.044 Y138.04 E.09782
G1 X170.034 Y157.05 E.8918
G1 X166.726 Y157.05 E.10975
G1 X108.627 Y98.951 E2.72554
G1 X105.318 Y98.951 E.10977
G1 X70.952 Y133.316 E1.61214
G1 X70.953 Y130.361 E.09803
G1 X97.642 Y157.05 E1.25204
G1 X100.95 Y157.05 E.10975
G1 X159.049 Y98.951 E2.72552
G1 X162.359 Y98.951 E.1098
G1 X189.044 Y125.636 E1.25186
G1 X189.044 Y122.688 E.09782
G1 X154.682 Y157.05 E1.612
G1 X151.374 Y157.05 E.10975
G1 X93.275 Y98.951 E2.72555
G1 X89.966 Y98.95 E.10976
G1 X70.954 Y117.962 E.89187
G1 X70.954 Y115.01 E.09792
G1 X112.994 Y157.05 E1.97215
G1 X116.302 Y157.05 E.10975
G1 X174.401 Y98.951 E2.72551
G1 X177.711 Y98.951 E.10981
G1 X189.044 Y110.285 E.53166
G1 X189.044 Y107.336 E.09782
G1 X139.33 Y157.05 E2.33219
G1 X136.022 Y157.05 E.10975
G1 X77.922 Y98.95 E2.72556
G2 X74.592 Y98.972 I-1.45 J33.053 E.11052
G1 X70.984 Y102.581 E.16929
G3 X71.815 Y100.519 I3.998 J.413 E.07473
G1 X128.346 Y157.05 E2.65198
G1 X131.654 Y157.05 E.10975
G1 X188.191 Y100.513 E2.65224
G3 X189.023 Y102.587 I-3.951 J2.79 E.07482
G1 X185.408 Y98.972 E.16961
G2 X183.78 Y98.951 I-1.018 J16.126 E.05402
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X185.408 Y98.972 E-.61858
G1 X185.671 Y99.235 E-.14142
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
G3 Z1.8 I-.035 J-1.216 P1  F30000
G1 X70.624 Y102.569 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X75.007 Y98.602 I4.389 J.444 E.2149
G1 X185.045 Y98.603 E3.65015
G3 X189.398 Y103.007 I-.057 J4.409 E.22771
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.411 J-.006 E.22946
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I.006 J-4.411 E.22946
G1 X70.602 Y103.007 E1.6581
G3 X70.619 Y102.629 I4.411 J.006 E.01258
G1 X70.232 Y102.547 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.234 Y102.531 E.00052
M73 P31 R28
G3 X75.003 Y98.21 I4.78 J.483 E.21664
G1 X185.05 Y98.211 E3.38145
G3 X189.79 Y103.003 I-.063 J4.802 E.22955
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.804 J-.012 E.23117
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.012 J-4.804 E.23117
G1 X70.21 Y103.003 E1.5362
G1 X70.229 Y102.607 E.01216
M204 S10000
; WIPE_START
G1 F24000
G1 X70.234 Y102.531 E-.02923
G1 X70.302 Y102.066 E-.17859
G1 X70.416 Y101.61 E-.17862
G1 X70.556 Y101.215 E-.15899
G1 X70.776 Y100.742 E-.19822
G1 X70.798 Y100.705 E-.01634
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.375 J1.158 P1  F30000
G1 X76.218 Y98.95 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X74.59 Y98.974 I-.6 J14.465 E.05403
G1 X70.984 Y102.581 E.16918
G3 X71.809 Y100.513 I4.124 J.449 E.07477
G1 X128.346 Y157.05 E2.65224
G1 X131.654 Y157.05 E.10975
G1 X188.191 Y100.513 E2.65224
G3 X189.023 Y102.587 I-3.951 J2.79 E.07482
G1 X185.408 Y98.972 E.16961
G2 X182.076 Y98.952 I-1.853 J30.453 E.11056
G1 X123.978 Y157.05 E2.7255
G1 X120.67 Y157.05 E.10975
G1 X70.955 Y107.335 E2.33221
G1 X70.955 Y110.285 E.09786
G1 X82.29 Y98.95 E.53174
G1 X85.599 Y98.95 E.10975
G1 X143.698 Y157.05 E2.72555
G1 X147.006 Y157.05 E.10975
G1 X189.044 Y115.012 E1.97209
G1 X189.044 Y117.96 E.09782
G1 X170.035 Y98.951 E.89175
G1 X166.725 Y98.951 E.10982
G1 X108.626 Y157.05 E2.72551
G1 X105.318 Y157.05 E.10975
G1 X70.954 Y122.685 E1.6121
G1 X70.953 Y125.639 E.09797
G1 X97.642 Y98.951 E1.252
G1 X100.951 Y98.951 E.10977
G1 X159.05 Y157.05 E2.72554
G1 X162.358 Y157.05 E.10975
G1 X189.044 Y130.364 E1.2519
G1 X189.044 Y133.312 E.09782
G1 X154.683 Y98.951 E1.61195
G1 X151.373 Y98.951 E.10981
G1 X93.274 Y157.05 E2.72552
G1 X89.966 Y157.05 E.10975
G1 X70.952 Y138.036 E.89199
G1 X70.952 Y140.993 E.09808
G1 X112.993 Y98.951 E1.97227
G1 X116.303 Y98.951 E.10978
G1 X174.402 Y157.05 E2.72554
G1 X177.71 Y157.05 E.10975
G1 X189.044 Y145.715 E.53171
G1 X189.044 Y148.664 E.09782
G1 X139.331 Y98.951 E2.33215
G1 X136.021 Y98.951 E.10979
G1 X77.922 Y157.05 E2.72553
G3 X74.591 Y157.027 I-1.458 J-30.539 E.11056
G1 X70.972 Y153.408 E.16979
G2 X71.815 Y155.481 I4.162 J-.484 E.07516
G1 X128.345 Y98.951 E2.65195
G1 X131.655 Y98.951 E.10979
G1 X188.185 Y155.481 E2.65195
G2 X189.021 Y153.415 I-3.244 J-2.515 E.07489
G1 X185.408 Y157.028 E.16951
G3 X182.078 Y157.05 I-1.88 J-33.033 E.11052
G1 X123.979 Y98.951 E2.72553
G1 X120.669 Y98.951 E.10978
G1 X70.951 Y148.669 E2.3324
G1 X70.951 Y145.711 E.09814
G1 X82.29 Y157.05 E.53193
G1 X85.598 Y157.05 E.10975
G1 X143.697 Y98.951 E2.72552
G1 X147.007 Y98.951 E.1098
G1 X189.044 Y140.988 E1.97205
G1 X189.044 Y138.04 E.09782
G1 X170.034 Y157.05 E.8918
G1 X166.726 Y157.05 E.10975
G1 X108.627 Y98.951 E2.72554
G1 X105.318 Y98.951 E.10977
G1 X70.952 Y133.316 E1.61213
G1 X70.953 Y130.361 E.09803
G1 X97.642 Y157.05 E1.25204
G1 X100.95 Y157.05 E.10975
G1 X159.049 Y98.951 E2.72551
G1 X162.359 Y98.951 E.10981
G1 X189.044 Y125.636 E1.25185
G1 X189.044 Y122.688 E.09782
G1 X154.682 Y157.05 E1.612
G1 X151.374 Y157.05 E.10975
G1 X93.275 Y98.951 E2.72555
G1 X89.966 Y98.951 E.10976
G1 X70.954 Y117.962 E.89187
G1 X70.954 Y115.01 E.09792
G1 X112.994 Y157.05 E1.97215
G1 X116.302 Y157.05 E.10975
G1 X174.4 Y98.952 E2.7255
G1 X177.711 Y98.952 E.10982
G1 X189.044 Y110.285 E.53165
G1 X189.044 Y107.336 E.09782
G1 X139.33 Y157.05 E2.33219
G1 X136.022 Y157.05 E.10975
G1 X77.922 Y98.95 E2.72556
G1 X79.551 Y98.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X77.922 Y98.95 E-.61876
G1 X78.185 Y99.213 E-.14124
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
G3 Z2 I-.494 J-1.112 P1  F30000
G1 X70.624 Y102.569 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X75.007 Y98.602 I4.389 J.444 E.2149
G1 X185.052 Y98.604 E3.65039
M73 P32 R28
G3 X189.398 Y103.007 I-.064 J4.409 E.22748
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.411 J-.006 E.22946
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I.006 J-4.411 E.22946
G1 X70.602 Y103.007 E1.6581
G3 X70.619 Y102.629 I4.411 J.006 E.01258
G1 X70.232 Y102.547 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.234 Y102.531 E.00052
G3 X75.003 Y98.21 I4.78 J.483 E.21664
G1 X185.057 Y98.211 E3.38167
G3 X189.79 Y103.003 I-.069 J4.802 E.22933
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.804 J-.012 E.23117
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.012 J-4.804 E.23117
G1 X70.21 Y103.003 E1.5362
G1 X70.229 Y102.607 E.01216
M204 S10000
; WIPE_START
G1 F24000
G1 X70.234 Y102.531 E-.02922
G1 X70.302 Y102.066 E-.17859
G1 X70.435 Y101.554 E-.20083
G1 X70.575 Y101.167 E-.15638
G1 X70.776 Y100.742 E-.17862
G1 X70.798 Y100.705 E-.01635
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.419 J1.143 P1  F30000
G1 X90.349 Y107.872 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X90.349 Y106.244 E.05401
G1 X70.953 Y125.639 E.90988
G1 X70.954 Y122.685 E.09797
G1 X105.318 Y157.05 E1.6121
G1 X108.626 Y157.05 E.10975
G1 X114.213 Y151.463 E.2621
G2 X116.219 Y152.599 I12.592 J-19.892 E.07649
G1 X120.67 Y157.05 E.2088
G1 X123.978 Y157.05 E.10975
G1 X125.436 Y155.591 E.06841
G2 X127.095 Y155.799 I2.95 J-16.853 E.05547
G1 X128.346 Y157.05 E.05868
G1 X131.654 Y157.05 E.10975
G1 X132.905 Y155.799 E.05868
G2 X134.564 Y155.591 I-1.291 J-17.06 E.05547
G1 X136.022 Y157.05 E.06841
G1 X139.33 Y157.05 E.10975
G1 X143.781 Y152.599 E.2088
G2 X145.787 Y151.463 I-10.587 J-21.028 E.07649
G1 X151.374 Y157.05 E.2621
G1 X154.682 Y157.05 E.10975
G1 X189.044 Y122.688 E1.612
G1 X189.044 Y125.636 E.09782
G1 X169.651 Y106.244 E.90976
G1 X169.651 Y107.872 E.05401
G1 X168.837 Y106.375 F30000
G1 F15476.087
G1 X168.837 Y105.559 E.02708
G1 X168.441 Y105.163 E.01856
G1 X168.189 Y105.163 E.00837
G1 X119.992 Y153.36 E2.26103
G2 X121.536 Y153.874 I5.989 J-15.417 E.05402
G1 X120.894 Y154.529 F30000
G1 F15476.087
G3 X119.355 Y153.997 I4.697 J-16.044 E.05402
G1 X116.302 Y157.05 E.14323
G1 X112.994 Y157.05 E.10975
G1 X70.954 Y115.01 E1.97215
G1 X70.954 Y117.962 E.09792
G1 X89.966 Y98.951 E.89187
G1 X93.275 Y98.951 E.10976
G1 X98.673 Y104.349 E.25324
G1 X99.92 Y104.349 E.04136
G1 X105.317 Y98.951 E.25323
G1 X108.627 Y98.951 E.10977
G1 X109.025 Y99.349 E.01867
G1 X112.596 Y99.349 E.11845
G1 X112.993 Y98.951 E.01866
G1 X116.303 Y98.951 E.10978
G1 X121.701 Y104.349 E.25322
G1 X122.947 Y104.349 E.04136
G1 X128.345 Y98.951 E.25321
G1 X131.655 Y98.951 E.10979
G1 X137.053 Y104.349 E.25321
G1 X138.299 Y104.349 E.04136
G1 X143.697 Y98.951 E.2532
G1 X147.007 Y98.951 E.10981
G1 X147.404 Y99.349 E.01864
G1 X150.975 Y99.349 E.11845
G1 X151.373 Y98.951 E.01864
G1 X154.683 Y98.951 E.10981
G1 X160.08 Y104.349 E.2532
G1 X161.327 Y104.349 E.04136
G1 X166.724 Y98.952 E.25319
G1 X170.035 Y98.952 E.10983
G1 X189.044 Y117.96 E.89175
G1 X189.044 Y115.012 E.09782
G1 X147.006 Y157.05 E1.97209
G1 X143.698 Y157.05 E.10975
G1 X140.645 Y153.997 E.14323
G3 X139.106 Y154.529 I-6.235 J-15.512 E.05402
G1 X138.464 Y153.874 F30000
G1 F15476.087
G2 X140.008 Y153.36 I-4.444 J-15.932 E.05402
G1 X91.811 Y105.163 E2.26103
G1 X91.559 Y105.163 E.00837
G1 X91.163 Y105.559 E.01856
G1 X91.163 Y106.375 E.02708
G1 X116.086 Y105.163 F30000
G1 F15476.087
G1 X115.837 Y105.163 E.00824
G1 X115.837 Y103.783 E.04577
G1 X91.163 Y128.457 E1.15752
G1 X91.163 Y127.543 E.03034
G1 X96.457 Y132.837 E.24837
G1 X94.459 Y132.837 E.06629
G1 X122.133 Y105.163 E1.29826
G1 X122.515 Y105.163 E.01266
G1 X156.214 Y138.862 E1.58088
G3 X154.445 Y141.935 I-60.74 J-32.911 E.11764
G1 X146.051 Y150.328 E.39376
G3 X145.193 Y150.869 I-5.92 J-8.437 E.03366
G1 X99.487 Y105.163 E2.14419
G1 X99.105 Y105.163 E.01266
G1 X91.163 Y113.105 E.3726
G1 X91.163 Y112.191 E.03034
G1 X133.826 Y154.878 E2.00198
G1 X168.837 Y119.867 E1.64245
G1 X168.837 Y120.781 E.03034
G1 X153.219 Y105.163 E.7327
G1 X152.837 Y105.163 E.01266
G1 X110.407 Y147.593 E1.99047
G3 X106.727 Y143.597 I19.928 J-22.044 E.18045
G1 X150.161 Y100.163 E2.03757
G1 X148.219 Y100.163 E.06444
G1 X152.337 Y104.281 E.19321
G1 X152.337 Y102.653 E.05401
G1 X153.151 Y103.22 F30000
G1 F15476.087
G1 X153.151 Y104.349 E.03743
G1 X153.651 Y104.349 E.01659
G1 X159.049 Y98.951 E.2532
G1 X162.359 Y98.952 E.10982
G1 X167.756 Y104.349 E.25319
G1 X168.667 Y104.349 E.03019
G3 X168.891 Y104.461 I-.023 J.327 E.00854
G1 X174.4 Y98.952 E.25845
G1 X177.711 Y98.952 E.10984
G1 X189.044 Y110.285 E.53165
G1 X189.044 Y107.336 E.09782
G1 X169.651 Y126.729 E.90976
G1 X169.651 Y129.271 E.08435
G1 X189.044 Y148.664 E.90976
G1 X189.044 Y145.715 E.09782
G1 X177.71 Y157.05 E.53171
G1 X174.402 Y157.05 E.10975
G1 X156.819 Y139.467 E.82482
G1 X156.714 Y139.666 E.00744
G1 X162.729 Y133.651 E.28214
G1 X166.355 Y133.651 E.1203
G1 X188.185 Y155.481 E1.02409
G2 X189.023 Y153.413 I-3.266 J-2.527 E.07497
G1 X185.408 Y157.028 E.16961
G3 X182.078 Y157.05 I-1.88 J-33.033 E.11052
G1 X158.965 Y133.938 E1.08424
G3 X158.484 Y135.493 I-16.801 J-4.344 E.05402
G1 X157.847 Y134.835 F30000
G1 F15476.087
G2 X158.299 Y133.271 I-15.649 J-5.37 E.05403
G1 X130.191 Y105.163 E1.31861
G1 X129.809 Y105.163 E.01266
G1 X101.701 Y133.271 E1.31861
G2 X102.153 Y134.835 I16.101 J-3.806 E.05403
G1 X101.516 Y135.493 F30000
G1 F15476.087
G1 X101.418 Y135.216 E.00973
G3 X101.035 Y133.938 I25.84 J-8.439 E.04428
G1 X77.922 Y157.05 E1.08424
G3 X74.591 Y157.027 I-1.458 J-30.537 E.11056
G1 X70.972 Y153.408 E.16979
G2 X71.815 Y155.481 I4.122 J-.467 E.07518
G1 X93.645 Y133.651 E1.02409
G1 X97.271 Y133.651 E.1203
G1 X103.286 Y139.666 E.28214
G1 X103.181 Y139.467 E.00744
G1 X85.598 Y157.05 E.82482
G1 X82.29 Y157.05 E.10975
G1 X70.951 Y145.711 E.53193
G1 X70.951 Y148.669 E.09814
G1 X90.349 Y129.271 E.90999
G1 X90.349 Y126.729 E.08435
G1 X70.955 Y107.335 E.90978
G1 X70.955 Y110.285 E.09786
G1 X82.29 Y98.95 E.53174
G1 X85.599 Y98.95 E.10975
G1 X91.109 Y104.461 E.25851
G3 X91.333 Y104.349 I.248 J.215 E.00854
G1 X92.244 Y104.349 E.03019
G1 X97.642 Y98.951 E.25323
G1 X100.951 Y98.951 E.10977
G1 X106.349 Y104.349 E.25323
G1 X106.849 Y104.349 E.01659
G1 X106.849 Y103.22 E.03743
G1 X107.663 Y102.653 F30000
G1 F15476.087
G1 X107.663 Y104.281 E.05401
G1 X111.781 Y100.163 E.19321
G1 X109.839 Y100.163 E.06444
G1 X153.273 Y143.597 E2.03757
G3 X149.593 Y147.593 I-23.608 J-18.048 E.18045
G1 X107.163 Y105.163 E1.99047
G1 X106.781 Y105.163 E.01266
G1 X91.163 Y120.781 E.7327
G1 X91.163 Y119.867 E.03034
G1 X126.174 Y154.878 E1.64245
G1 X168.837 Y112.191 E2.00198
G1 X168.837 Y113.105 E.03034
G1 X160.895 Y105.163 E.3726
G1 X160.513 Y105.163 E.01266
G1 X114.807 Y150.869 E2.14419
G3 X113.949 Y150.328 I5.062 J-8.979 E.03366
G1 X105.555 Y141.935 E.39376
G3 X103.786 Y138.862 I25.846 J-16.921 E.11769
G1 X137.485 Y105.163 E1.58088
G1 X137.867 Y105.163 E.01266
G1 X165.541 Y132.837 E1.29826
G1 X163.543 Y132.837 E.06629
G1 X168.837 Y127.543 E.24837
G1 X168.837 Y128.457 E.03034
G1 X144.163 Y103.783 E1.15752
G1 X144.163 Y105.163 E.04577
G1 X143.914 Y105.163 E.00824
G1 X143.349 Y101.341 F30000
G1 F15476.087
G1 X143.349 Y102.969 E.05401
G1 X139.331 Y98.951 E.18848
G1 X136.021 Y98.951 E.1098
G1 X130.623 Y104.349 E.25321
G1 X129.377 Y104.349 E.04136
G1 X123.979 Y98.951 E.25322
G1 X120.669 Y98.951 E.10979
G1 X116.651 Y102.969 E.18849
G1 X116.651 Y101.341 E.05401
G1 X115.627 Y99.773 F30000
G1 F15476.087
G1 X115.927 Y100.073 E.01407
G3 X116.244 Y100.414 I-.254 J.554 E.01586
G1 X116.244 Y104.756 E.14401
G1 X143.756 Y104.756 E.91261
G1 X143.756 Y100.414 E.14401
G3 X144.414 Y99.756 I4.78 J4.121 E.03092
G1 X152.127 Y99.773 E.25585
G1 X152.744 Y100.414 E.02952
G1 X152.744 Y104.756 E.14401
G1 X168.586 Y104.756 E.52549
G1 X169.227 Y105.373 E.02952
G1 X169.244 Y132.586 E.9027
G1 X168.586 Y133.244 E.03089
G1 X158.725 Y133.244 E.3271
G1 X158.197 Y135.085 E.06353
G1 X157.156 Y137.81 E.09676
G1 X155.852 Y140.422 E.09683
G1 X155.104 Y141.678 E.04849
G1 X153.431 Y144.068 E.09677
G1 X152.506 Y145.2 E.04849
G1 X150.5 Y147.317 E.09677
G1 X148.293 Y149.228 E.09683
G1 X147.121 Y150.102 E.0485
G1 X144.657 Y151.667 E.09683
G1 X142.053 Y152.982 E.09677
G1 X140.703 Y153.543 E.0485
G1 X137.932 Y154.461 E.09683
G1 X135.086 Y155.102 E.09677
G1 X132.189 Y155.461 E.09683
G1 X130.729 Y155.532 E.04849
G1 X127.813 Y155.461 E.09677
G1 X124.916 Y155.102 E.09683
G1 X123.482 Y154.816 E.04849
G1 X120.669 Y154.036 E.09683
G1 X117.949 Y152.983 E.09677
G1 X115.343 Y151.667 E.09683
G1 X114.09 Y150.914 E.04849
G1 X111.708 Y149.23 E.09677
G1 X110.58 Y148.3 E.0485
G1 X108.47 Y146.283 E.09683
G1 X106.569 Y144.068 E.09683
G1 X104.896 Y141.678 E.09677
G1 X103.465 Y139.134 E.09683
G1 X102.844 Y137.81 E.0485
G1 X101.803 Y135.085 E.09676
G1 X101.275 Y133.244 E.06353
G1 X91.414 Y133.244 E.3271
G1 X90.756 Y132.586 E.03089
G1 X90.773 Y105.373 E.9027
G1 X91.414 Y104.756 E.02952
G1 X107.256 Y104.756 E.52549
G1 X107.256 Y100.414 E.14401
G1 X107.873 Y99.773 E.02952
G1 X115.571 Y99.756 E.25535
G1 X107.168 Y145.445 F30000
G1 F15476.087
G3 X106.145 Y144.179 I12.595 J-11.221 E.05403
G1 X93.274 Y157.05 E.6038
G1 X89.966 Y157.05 E.10975
G1 X70.952 Y138.036 E.89199
G1 X70.952 Y140.993 E.09808
G1 X90.349 Y121.596 E.90995
G1 X90.349 Y119.053 E.08435
G1 X71.815 Y100.519 E.86946
G2 X70.984 Y102.581 I3.158 J2.472 E.07473
G1 X74.592 Y98.972 E.16929
G3 X77.922 Y98.95 I1.88 J33.02 E.11052
G1 X90.349 Y111.377 E.58294
G1 X90.349 Y113.92 E.08435
G1 X70.952 Y133.316 E.90992
G1 X70.953 Y130.361 E.09803
G1 X97.642 Y157.05 E1.25204
G1 X100.95 Y157.05 E.10975
G1 X109.831 Y148.169 E.41661
G2 X111.067 Y149.229 I11.456 J-12.107 E.05402
G1 X148.933 Y149.229 F30000
G1 F15476.087
G2 X150.169 Y148.169 I-10.222 J-13.169 E.05402
G1 X159.05 Y157.05 E.41661
G1 X162.358 Y157.05 E.10975
G1 X189.044 Y130.364 E1.2519
G1 X189.044 Y133.312 E.09782
G1 X169.651 Y113.92 E.90976
G1 X169.651 Y111.377 E.08435
G1 X182.076 Y98.952 E.58287
G3 X185.408 Y98.972 I1.482 J30.12 E.11057
G1 X189.023 Y102.587 E.16961
G2 X188.191 Y100.513 I-4.784 J.716 E.07482
G1 X169.651 Y119.053 E.86972
G1 X169.651 Y121.596 E.08435
G1 X189.044 Y140.988 E.90976
G1 X189.044 Y138.04 E.09782
G1 X170.034 Y157.05 E.8918
G1 X166.726 Y157.05 E.10975
G1 X153.855 Y144.179 E.6038
G1 X153.756 Y144.313 E.00554
G3 X152.832 Y145.445 I-23.499 J-18.236 E.04848
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X153.756 Y144.313 E-.55527
G1 X153.855 Y144.179 E-.06349
G1 X154.118 Y144.442 E-.14124
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
G3 Z2.2 I.546 J-1.088 P1  F30000
G1 X70.624 Y102.569 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X75.007 Y98.602 I4.38 J.435 E.21503
G1 X185.059 Y98.604 E3.65062
G3 X189.398 Y103.007 I-.071 J4.409 E.22724
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.402 J.004 E.2296
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I-.004 J-4.402 E.2296
G1 X70.602 Y103.007 E1.6581
G3 X70.618 Y102.629 I4.402 J-.004 E.01258
G1 X70.232 Y102.547 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.233 Y102.531 E.00052
G3 X75.003 Y98.21 I4.77 J.473 E.21678
G1 X185.064 Y98.212 E3.38188
G3 X189.79 Y103.003 I-.076 J4.802 E.22911
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.794 J-.001 E.23131
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.001 J-4.794 E.23131
G1 X70.21 Y103.003 E1.5362
G1 X70.229 Y102.607 E.01216
M204 S10000
; WIPE_START
G1 F24000
G1 X70.233 Y102.531 E-.02922
G1 X70.302 Y102.066 E-.17861
G1 X70.416 Y101.61 E-.17862
M73 P33 R28
G1 X70.575 Y101.167 E-.17864
G1 X70.776 Y100.742 E-.17861
G1 X70.798 Y100.705 E-.0163
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.419 J1.143 P1  F30000
G1 X90.349 Y107.872 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X90.349 Y106.244 E.05401
G1 X70.953 Y125.639 E.90988
G1 X70.954 Y122.685 E.09797
G1 X105.318 Y157.05 E1.6121
G1 X108.626 Y157.05 E.10975
G1 X114.213 Y151.463 E.2621
G2 X116.219 Y152.599 I12.592 J-19.892 E.07649
G1 X120.67 Y157.05 E.2088
G1 X123.978 Y157.05 E.10975
G1 X125.436 Y155.591 E.06841
G2 X127.095 Y155.799 I2.95 J-16.853 E.05547
G1 X128.346 Y157.05 E.05868
G1 X131.654 Y157.05 E.10975
G1 X132.905 Y155.799 E.05868
G2 X134.564 Y155.591 I-1.291 J-17.06 E.05547
G1 X136.022 Y157.05 E.06841
G1 X139.33 Y157.05 E.10975
G1 X143.781 Y152.599 E.2088
G2 X145.787 Y151.463 I-10.587 J-21.028 E.07649
G1 X151.374 Y157.05 E.2621
G1 X154.682 Y157.05 E.10975
G1 X189.044 Y122.688 E1.612
G1 X189.044 Y125.636 E.09782
G1 X169.651 Y106.244 E.90976
G1 X169.651 Y107.872 E.05401
G1 X168.837 Y106.375 F30000
G1 F15476.087
G1 X168.837 Y105.559 E.02708
G1 X168.441 Y105.163 E.01856
G1 X168.189 Y105.163 E.00837
G1 X119.992 Y153.36 E2.26103
G2 X121.536 Y153.874 I5.989 J-15.417 E.05402
G1 X120.894 Y154.529 F30000
G1 F15476.087
G3 X119.355 Y153.997 I4.697 J-16.044 E.05402
G1 X116.302 Y157.05 E.14323
G1 X112.994 Y157.05 E.10975
G1 X70.954 Y115.01 E1.97215
G1 X70.954 Y117.962 E.09792
G1 X89.966 Y98.951 E.89187
G1 X93.275 Y98.951 E.10976
G1 X98.673 Y104.349 E.25323
G1 X99.92 Y104.349 E.04136
G1 X105.317 Y98.951 E.25323
G1 X108.627 Y98.951 E.10978
G1 X109.025 Y99.349 E.01866
G1 X112.596 Y99.349 E.11845
G1 X112.993 Y98.951 E.01866
G1 X116.303 Y98.951 E.10979
G1 X121.701 Y104.349 E.25322
G1 X122.947 Y104.349 E.04136
G1 X128.345 Y98.951 E.25321
G1 X131.655 Y98.951 E.1098
G1 X137.053 Y104.349 E.25321
G1 X138.299 Y104.349 E.04136
G1 X143.697 Y98.951 E.2532
G1 X147.007 Y98.951 E.10982
G1 X147.404 Y99.349 E.01864
G1 X150.975 Y99.349 E.11845
G1 X151.373 Y98.951 E.01863
G1 X154.683 Y98.952 E.10982
G1 X160.08 Y104.349 E.25319
G1 X161.327 Y104.349 E.04136
G1 X166.724 Y98.952 E.25318
G1 X170.035 Y98.952 E.10984
G1 X189.044 Y117.96 E.89174
G1 X189.044 Y115.012 E.09782
G1 X147.006 Y157.05 E1.97209
G1 X143.698 Y157.05 E.10975
G1 X140.645 Y153.997 E.14323
G3 X139.106 Y154.529 I-6.235 J-15.512 E.05402
G1 X138.464 Y153.874 F30000
G1 F15476.087
G2 X140.008 Y153.36 I-4.444 J-15.932 E.05402
G1 X91.811 Y105.163 E2.26103
G1 X91.559 Y105.163 E.00837
G1 X91.163 Y105.559 E.01856
G1 X91.163 Y106.375 E.02708
G1 X116.086 Y105.163 F30000
G1 F15476.087
G1 X115.837 Y105.163 E.00824
G1 X115.837 Y103.783 E.04577
G1 X91.163 Y128.457 E1.15752
G1 X91.163 Y127.543 E.03034
G1 X96.457 Y132.837 E.24837
G1 X94.459 Y132.837 E.06629
G1 X122.133 Y105.163 E1.29826
G1 X122.515 Y105.163 E.01266
G1 X156.214 Y138.862 E1.58088
G3 X154.445 Y141.935 I-60.74 J-32.911 E.11764
G1 X146.051 Y150.328 E.39376
G3 X145.193 Y150.869 I-5.92 J-8.437 E.03366
G1 X99.487 Y105.163 E2.14419
G1 X99.105 Y105.163 E.01266
G1 X91.163 Y113.105 E.3726
G1 X91.163 Y112.191 E.03034
G1 X133.826 Y154.878 E2.00198
G1 X168.837 Y119.867 E1.64245
G1 X168.837 Y120.781 E.03034
G1 X153.219 Y105.163 E.7327
G1 X152.837 Y105.163 E.01266
G1 X110.407 Y147.593 E1.99047
G3 X106.727 Y143.597 I19.928 J-22.044 E.18045
G1 X150.161 Y100.163 E2.03757
G1 X148.219 Y100.163 E.06444
G1 X152.337 Y104.281 E.19321
G1 X152.337 Y102.653 E.05401
G1 X153.151 Y103.22 F30000
G1 F15476.087
G1 X153.151 Y104.349 E.03743
G1 X153.651 Y104.349 E.01659
G1 X159.048 Y98.952 E.25319
G1 X162.359 Y98.952 E.10983
G1 X167.756 Y104.349 E.25319
G1 X168.667 Y104.349 E.03019
G3 X168.891 Y104.461 I-.023 J.327 E.00854
G1 X174.4 Y98.952 E.25845
G1 X177.712 Y98.952 E.10985
G1 X189.044 Y110.285 E.53164
G1 X189.044 Y107.336 E.09782
G1 X169.651 Y126.729 E.90976
G1 X169.651 Y129.271 E.08435
G1 X189.044 Y148.664 E.90976
G1 X189.044 Y145.715 E.09782
G1 X177.71 Y157.05 E.53171
G1 X174.402 Y157.05 E.10975
G1 X156.819 Y139.467 E.82482
G1 X156.714 Y139.666 E.00744
G1 X162.729 Y133.651 E.28214
G1 X166.355 Y133.651 E.1203
G1 X188.185 Y155.481 E1.02409
G2 X189.023 Y153.413 I-3.266 J-2.527 E.07497
G1 X185.408 Y157.028 E.16961
G3 X182.078 Y157.05 I-1.88 J-33.031 E.11052
G1 X158.965 Y133.938 E1.08424
G3 X158.484 Y135.493 I-16.801 J-4.344 E.05402
G1 X157.847 Y134.835 F30000
G1 F15476.087
G2 X158.299 Y133.271 I-15.649 J-5.37 E.05403
G1 X130.191 Y105.163 E1.31861
G1 X129.809 Y105.163 E.01266
G1 X101.701 Y133.271 E1.31861
G2 X102.153 Y134.835 I16.101 J-3.806 E.05403
G1 X101.516 Y135.493 F30000
G1 F15476.087
G1 X101.418 Y135.216 E.00973
G3 X101.035 Y133.938 I25.84 J-8.439 E.04428
G1 X77.922 Y157.05 E1.08424
G3 X74.591 Y157.027 I-1.458 J-30.543 E.11056
G1 X70.972 Y153.408 E.16979
G2 X71.815 Y155.481 I4.162 J-.484 E.07516
G1 X93.645 Y133.651 E1.02409
G1 X97.271 Y133.651 E.1203
G1 X103.286 Y139.666 E.28214
G1 X103.181 Y139.467 E.00744
G1 X85.598 Y157.05 E.82482
G1 X82.29 Y157.05 E.10975
G1 X70.951 Y145.711 E.53193
G1 X70.951 Y148.669 E.09814
G1 X90.349 Y129.271 E.90999
G1 X90.349 Y126.729 E.08435
G1 X70.955 Y107.335 E.90978
G1 X70.955 Y110.285 E.09786
G1 X82.29 Y98.95 E.53174
G1 X85.599 Y98.951 E.10976
G1 X91.109 Y104.461 E.25851
G3 X91.333 Y104.349 I.248 J.215 E.00854
G1 X92.244 Y104.349 E.03019
G1 X97.642 Y98.951 E.25323
G1 X100.951 Y98.951 E.10977
G1 X106.349 Y104.349 E.25323
G1 X106.849 Y104.349 E.01659
G1 X106.849 Y103.22 E.03743
G1 X107.663 Y102.653 F30000
G1 F15476.087
G1 X107.663 Y104.281 E.05401
G1 X111.781 Y100.163 E.19321
G1 X109.839 Y100.163 E.06444
G1 X153.273 Y143.597 E2.03757
G3 X149.593 Y147.593 I-23.608 J-18.048 E.18045
G1 X107.163 Y105.163 E1.99047
G1 X106.781 Y105.163 E.01266
G1 X91.163 Y120.781 E.7327
G1 X91.163 Y119.867 E.03034
G1 X126.174 Y154.878 E1.64245
G1 X168.837 Y112.191 E2.00198
G1 X168.837 Y113.105 E.03034
G1 X160.895 Y105.163 E.3726
G1 X160.513 Y105.163 E.01266
G1 X114.807 Y150.869 E2.14419
G3 X113.949 Y150.328 I5.062 J-8.979 E.03366
G1 X105.555 Y141.935 E.39376
G3 X103.786 Y138.862 I25.846 J-16.921 E.11769
G1 X137.485 Y105.163 E1.58088
G1 X137.867 Y105.163 E.01266
G1 X165.541 Y132.837 E1.29826
G1 X163.543 Y132.837 E.06629
G1 X168.837 Y127.543 E.24837
G1 X168.837 Y128.457 E.03034
G1 X144.163 Y103.783 E1.15752
G1 X144.163 Y105.163 E.04577
G1 X143.914 Y105.163 E.00824
G1 X143.349 Y101.341 F30000
G1 F15476.087
G1 X143.349 Y102.969 E.05401
G1 X139.331 Y98.951 E.18847
G1 X136.021 Y98.951 E.10981
G1 X130.623 Y104.349 E.25321
G1 X129.377 Y104.349 E.04136
G1 X123.979 Y98.951 E.25321
G1 X120.669 Y98.951 E.10979
G1 X116.651 Y102.969 E.18849
G1 X116.651 Y101.341 E.05401
G1 X115.627 Y99.773 F30000
G1 F15476.087
G1 X115.927 Y100.073 E.01407
G3 X116.244 Y100.414 I-.254 J.554 E.01586
G1 X116.244 Y104.756 E.14401
G1 X143.756 Y104.756 E.91261
G1 X143.756 Y100.414 E.14401
G3 X144.414 Y99.756 I4.78 J4.121 E.03092
G1 X152.127 Y99.773 E.25585
G1 X152.744 Y100.414 E.02952
G1 X152.744 Y104.756 E.14401
G1 X168.586 Y104.756 E.52549
G1 X169.227 Y105.373 E.02952
G1 X169.244 Y132.586 E.9027
G1 X168.586 Y133.244 E.03089
G1 X158.725 Y133.244 E.3271
G1 X158.197 Y135.085 E.06353
G1 X157.156 Y137.81 E.09676
G1 X155.852 Y140.422 E.09683
G1 X155.104 Y141.678 E.04849
G1 X153.431 Y144.068 E.09677
G1 X152.506 Y145.2 E.04849
G1 X150.5 Y147.317 E.09677
G1 X148.293 Y149.228 E.09683
G1 X147.121 Y150.102 E.0485
G1 X144.657 Y151.667 E.09683
G1 X142.053 Y152.982 E.09677
G1 X140.703 Y153.543 E.0485
G1 X137.932 Y154.461 E.09683
G1 X135.086 Y155.102 E.09677
G1 X132.189 Y155.461 E.09683
G1 X130.729 Y155.532 E.04849
G1 X127.813 Y155.461 E.09677
G1 X124.916 Y155.102 E.09683
G1 X123.482 Y154.816 E.04849
G1 X120.669 Y154.036 E.09683
G1 X117.949 Y152.983 E.09677
G1 X115.343 Y151.667 E.09683
G1 X114.09 Y150.914 E.04849
G1 X111.708 Y149.23 E.09677
G1 X110.58 Y148.3 E.0485
G1 X108.47 Y146.283 E.09683
G1 X106.569 Y144.068 E.09683
G1 X104.896 Y141.678 E.09677
G1 X103.465 Y139.134 E.09683
G1 X102.844 Y137.81 E.0485
G1 X101.803 Y135.085 E.09676
G1 X101.275 Y133.244 E.06353
G1 X91.414 Y133.244 E.3271
G1 X90.756 Y132.586 E.03089
G1 X90.773 Y105.373 E.9027
G1 X91.414 Y104.756 E.02952
G1 X107.256 Y104.756 E.52549
G1 X107.256 Y100.414 E.14401
G1 X107.873 Y99.773 E.02952
G1 X115.571 Y99.756 E.25535
G1 X107.168 Y145.445 F30000
G1 F15476.087
G3 X106.145 Y144.179 I12.595 J-11.221 E.05403
G1 X93.274 Y157.05 E.6038
G1 X89.966 Y157.05 E.10975
G1 X70.952 Y138.036 E.89199
G1 X70.952 Y140.993 E.09808
G1 X90.349 Y121.596 E.90995
G1 X90.349 Y119.053 E.08435
G1 X71.815 Y100.519 E.86946
G2 X70.984 Y102.581 I3.194 J2.486 E.07471
G1 X74.592 Y98.972 E.16929
G3 X77.922 Y98.95 I1.88 J33.026 E.11052
G1 X90.349 Y111.377 E.58294
G1 X90.349 Y113.92 E.08435
G1 X70.952 Y133.316 E.90992
G1 X70.953 Y130.361 E.09803
G1 X97.642 Y157.05 E1.25204
G1 X100.95 Y157.05 E.10975
G1 X109.831 Y148.169 E.41661
G2 X111.067 Y149.229 I11.456 J-12.107 E.05402
G1 X148.933 Y149.229 F30000
G1 F15476.087
G2 X150.169 Y148.169 I-10.222 J-13.169 E.05402
G1 X159.05 Y157.05 E.41661
G1 X162.358 Y157.05 E.10975
G1 X189.044 Y130.364 E1.2519
G1 X189.044 Y133.312 E.09782
G1 X169.651 Y113.92 E.90976
G1 X169.651 Y111.377 E.08435
G1 X182.076 Y98.952 E.58287
G3 X185.408 Y98.972 I1.486 J29.755 E.11058
G1 X189.023 Y102.587 E.16961
G2 X188.191 Y100.513 I-4.784 J.715 E.07482
G1 X169.651 Y119.053 E.86972
G1 X169.651 Y121.596 E.08435
G1 X189.044 Y140.988 E.90976
G1 X189.044 Y138.04 E.09782
G1 X170.034 Y157.05 E.8918
G1 X166.726 Y157.05 E.10975
G1 X153.855 Y144.179 E.6038
G1 X153.756 Y144.313 E.00554
G3 X152.832 Y145.445 I-23.499 J-18.236 E.04848
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X153.756 Y144.313 E-.55527
G1 X153.855 Y144.179 E-.06349
G1 X154.118 Y144.442 E-.14124
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
G3 Z2.4 I.546 J-1.088 P1  F30000
M73 P33 R27
G1 X70.624 Y102.569 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X75.007 Y98.602 I4.389 J.444 E.2149
G1 X185.066 Y98.604 E3.65085
G3 X189.398 Y103.007 I-.077 J4.409 E.22701
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.411 J-.006 E.22946
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I-.004 J-4.402 E.2296
G1 X70.602 Y103.007 E1.6581
G3 X70.619 Y102.629 I4.411 J.006 E.01258
G1 X70.243 Y102.548 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.263 Y102.297 E.00772
G3 X70.438 Y101.545 I4.805 J.717 E.02377
G1 X70.438 Y101.545 E0
G3 X70.809 Y100.682 I4.612 J1.477 E.02889
G1 X70.809 Y100.682 E0
G3 X75.003 Y98.21 I4.207 J2.343 E.15681
G1 X185.071 Y98.212 E3.3821
G3 X189.79 Y103.003 I-.083 J4.802 E.2289
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.794 J-.001 E.23131
G1 X75.003 Y157.79 E3.37983
G3 X70.438 Y154.455 I.014 J-4.811 E.18566
G1 X70.438 Y154.455 E0
G3 X70.21 Y152.997 I4.63 J-1.47 E.04552
G1 X70.21 Y103.003 E1.5362
G1 X70.239 Y102.608 E.01217
M204 S10000
; WIPE_START
G1 F24000
G1 X70.263 Y102.297 E-.11828
G1 X70.354 Y101.836 E-.1786
G1 X70.438 Y101.545 E-.11533
G1 X70.438 Y101.545 E0
G1 X70.575 Y101.167 E-.15262
G1 X70.799 Y100.705 E-.19516
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.419 J1.143 P1  F30000
G1 X90.349 Y107.872 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X90.349 Y106.244 E.05401
G1 X70.953 Y125.639 E.90988
G1 X70.954 Y122.685 E.09797
G1 X105.318 Y157.05 E1.6121
G1 X108.626 Y157.05 E.10975
G1 X114.213 Y151.463 E.2621
G2 X116.219 Y152.599 I12.592 J-19.892 E.07649
G1 X120.67 Y157.05 E.2088
G1 X123.978 Y157.05 E.10975
G1 X125.436 Y155.591 E.06841
G2 X127.095 Y155.799 I2.95 J-16.853 E.05547
G1 X128.346 Y157.05 E.05868
G1 X131.654 Y157.05 E.10975
G1 X132.905 Y155.799 E.05868
G2 X134.564 Y155.591 I-1.291 J-17.06 E.05547
G1 X136.022 Y157.05 E.06841
G1 X139.33 Y157.05 E.10975
G1 X143.781 Y152.599 E.2088
G2 X145.787 Y151.463 I-10.587 J-21.028 E.07649
G1 X151.374 Y157.05 E.2621
G1 X154.682 Y157.05 E.10975
G1 X189.044 Y122.688 E1.612
G1 X189.044 Y125.636 E.09782
G1 X169.651 Y106.244 E.90976
G1 X169.651 Y107.872 E.05401
G1 X168.837 Y106.375 F30000
G1 F15476.087
G1 X168.837 Y105.559 E.02708
G1 X168.441 Y105.163 E.01856
G1 X168.189 Y105.163 E.00837
G1 X119.992 Y153.36 E2.26103
G2 X121.536 Y153.874 I5.989 J-15.417 E.05402
G1 X120.894 Y154.529 F30000
G1 F15476.087
M73 P34 R27
G3 X119.355 Y153.997 I4.697 J-16.044 E.05402
G1 X116.302 Y157.05 E.14323
G1 X112.994 Y157.05 E.10975
G1 X70.954 Y115.01 E1.97215
G1 X70.954 Y117.962 E.09792
G1 X89.966 Y98.951 E.89187
G1 X93.275 Y98.951 E.10976
G1 X98.673 Y104.349 E.25323
G1 X99.92 Y104.349 E.04136
G1 X105.317 Y98.951 E.25322
G1 X108.627 Y98.951 E.10978
G1 X109.025 Y99.349 E.01866
G1 X112.596 Y99.349 E.11845
G1 X112.993 Y98.951 E.01866
G1 X116.303 Y98.951 E.10979
G1 X121.701 Y104.349 E.25322
G1 X122.947 Y104.349 E.04136
G1 X128.345 Y98.951 E.25321
G1 X131.655 Y98.951 E.10981
G1 X137.053 Y104.349 E.2532
G1 X138.299 Y104.349 E.04136
G1 X143.697 Y98.951 E.25319
G1 X147.007 Y98.952 E.10982
G1 X147.404 Y99.349 E.01863
G1 X150.975 Y99.349 E.11845
G1 X151.372 Y98.952 E.01863
G1 X154.683 Y98.952 E.10983
G1 X160.08 Y104.349 E.25319
G1 X161.327 Y104.349 E.04136
G1 X166.724 Y98.952 E.25318
G1 X170.036 Y98.952 E.10985
G1 X189.044 Y117.96 E.89173
G1 X189.044 Y115.012 E.09782
G1 X147.006 Y157.05 E1.97209
G1 X143.698 Y157.05 E.10975
G1 X140.645 Y153.997 E.14323
G3 X139.106 Y154.529 I-6.235 J-15.512 E.05402
G1 X138.464 Y153.874 F30000
G1 F15476.087
G2 X140.008 Y153.36 I-4.444 J-15.932 E.05402
G1 X91.811 Y105.163 E2.26103
G1 X91.559 Y105.163 E.00837
G1 X91.163 Y105.559 E.01856
G1 X91.163 Y106.375 E.02708
G1 X116.086 Y105.163 F30000
G1 F15476.087
G1 X115.837 Y105.163 E.00824
G1 X115.837 Y103.783 E.04577
G1 X91.163 Y128.457 E1.15752
G1 X91.163 Y127.543 E.03034
G1 X96.457 Y132.837 E.24837
G1 X94.459 Y132.837 E.06629
G1 X122.133 Y105.163 E1.29826
G1 X122.515 Y105.163 E.01266
G1 X156.214 Y138.862 E1.58088
G3 X154.445 Y141.935 I-60.74 J-32.911 E.11764
G1 X146.051 Y150.328 E.39376
G3 X145.193 Y150.869 I-5.92 J-8.437 E.03366
G1 X99.487 Y105.163 E2.14419
G1 X99.105 Y105.163 E.01266
G1 X91.163 Y113.105 E.3726
G1 X91.163 Y112.191 E.03034
G1 X133.826 Y154.878 E2.00198
G1 X168.837 Y119.867 E1.64245
G1 X168.837 Y120.781 E.03034
G1 X153.219 Y105.163 E.7327
G1 X152.837 Y105.163 E.01266
G1 X110.407 Y147.593 E1.99047
G3 X106.727 Y143.597 I19.928 J-22.044 E.18045
G1 X150.161 Y100.163 E2.03757
G1 X148.219 Y100.163 E.06444
G1 X152.337 Y104.281 E.19321
G1 X152.337 Y102.653 E.05401
G1 X153.151 Y103.22 F30000
G1 F15476.087
G1 X153.151 Y104.349 E.03743
G1 X153.651 Y104.349 E.01659
G1 X159.048 Y98.952 E.25318
G1 X162.36 Y98.952 E.10984
G1 X167.756 Y104.349 E.25318
G1 X168.667 Y104.349 E.03019
G3 X168.891 Y104.461 I-.023 J.327 E.00854
G1 X174.4 Y98.952 E.25844
G1 X177.712 Y98.952 E.10986
G1 X189.044 Y110.285 E.53163
G1 X189.044 Y107.336 E.09782
G1 X169.651 Y126.729 E.90976
G1 X169.651 Y129.271 E.08435
G1 X189.044 Y148.664 E.90976
G1 X189.044 Y145.715 E.09782
G1 X177.71 Y157.05 E.53171
G1 X174.402 Y157.05 E.10975
G1 X156.819 Y139.467 E.82482
G1 X156.714 Y139.666 E.00744
G1 X162.729 Y133.651 E.28214
G1 X166.355 Y133.651 E.1203
G1 X188.185 Y155.481 E1.02409
G2 X189.023 Y153.413 I-3.266 J-2.527 E.07497
G1 X185.408 Y157.028 E.16961
G3 X182.078 Y157.05 I-1.88 J-33.033 E.11052
G1 X158.965 Y133.938 E1.08424
G3 X158.484 Y135.493 I-16.801 J-4.344 E.05402
G1 X157.847 Y134.835 F30000
G1 F15476.087
G2 X158.299 Y133.271 I-15.649 J-5.37 E.05403
G1 X130.191 Y105.163 E1.31861
G1 X129.809 Y105.163 E.01266
G1 X101.701 Y133.271 E1.31861
G2 X102.153 Y134.835 I16.101 J-3.806 E.05403
G1 X101.516 Y135.493 F30000
G1 F15476.087
G1 X101.418 Y135.216 E.00973
G3 X101.035 Y133.938 I25.84 J-8.439 E.04428
G1 X77.922 Y157.05 E1.08424
G3 X74.591 Y157.027 I-1.458 J-30.539 E.11056
G1 X70.972 Y153.408 E.16979
G2 X71.815 Y155.481 I4.12 J-.466 E.07518
G1 X93.645 Y133.651 E1.02409
G1 X97.271 Y133.651 E.1203
G1 X103.286 Y139.666 E.28214
G1 X103.181 Y139.467 E.00744
G1 X85.598 Y157.05 E.82482
G1 X82.29 Y157.05 E.10975
G1 X70.951 Y145.711 E.53193
G1 X70.951 Y148.669 E.09814
G1 X90.349 Y129.271 E.90999
G1 X90.349 Y126.729 E.08435
G1 X70.955 Y107.335 E.90978
G1 X70.955 Y110.285 E.09786
G1 X82.29 Y98.95 E.53174
G1 X85.599 Y98.951 E.10976
G1 X91.109 Y104.461 E.25851
G3 X91.333 Y104.349 I.248 J.215 E.00854
G1 X92.244 Y104.349 E.03019
G1 X97.642 Y98.951 E.25323
G1 X100.951 Y98.951 E.10977
G1 X106.349 Y104.349 E.25323
G1 X106.849 Y104.349 E.01659
G1 X106.849 Y103.22 E.03743
G1 X107.663 Y102.653 F30000
G1 F15476.087
G1 X107.663 Y104.281 E.05401
G1 X111.781 Y100.163 E.19321
G1 X109.839 Y100.163 E.06444
G1 X153.273 Y143.597 E2.03757
G3 X149.593 Y147.593 I-23.608 J-18.048 E.18045
G1 X107.163 Y105.163 E1.99047
G1 X106.781 Y105.163 E.01266
G1 X91.163 Y120.781 E.7327
G1 X91.163 Y119.867 E.03034
G1 X126.174 Y154.878 E1.64245
G1 X168.837 Y112.191 E2.00198
G1 X168.837 Y113.105 E.03034
G1 X160.895 Y105.163 E.3726
G1 X160.513 Y105.163 E.01266
G1 X114.807 Y150.869 E2.14419
G3 X113.949 Y150.328 I5.062 J-8.979 E.03366
G1 X105.555 Y141.935 E.39376
G3 X103.786 Y138.862 I25.846 J-16.921 E.11769
G1 X137.485 Y105.163 E1.58088
G1 X137.867 Y105.163 E.01266
G1 X165.541 Y132.837 E1.29826
G1 X163.543 Y132.837 E.06629
G1 X168.837 Y127.543 E.24837
G1 X168.837 Y128.457 E.03034
G1 X144.163 Y103.783 E1.15752
G1 X144.163 Y105.163 E.04577
G1 X143.914 Y105.163 E.00824
G1 X143.349 Y101.341 F30000
G1 F15476.087
G1 X143.349 Y102.969 E.05401
G1 X139.331 Y98.951 E.18847
G1 X136.021 Y98.951 E.10981
G1 X130.623 Y104.349 E.2532
G1 X129.377 Y104.349 E.04136
G1 X123.979 Y98.951 E.25321
G1 X120.669 Y98.951 E.1098
G1 X116.651 Y102.969 E.18848
G1 X116.651 Y101.341 E.05401
G1 X115.627 Y99.773 F30000
G1 F15476.087
G1 X115.927 Y100.073 E.01407
G3 X116.244 Y100.414 I-.254 J.554 E.01586
G1 X116.244 Y104.756 E.14401
G1 X143.756 Y104.756 E.91261
G1 X143.756 Y100.414 E.14401
G3 X144.414 Y99.756 I4.78 J4.121 E.03092
G1 X152.127 Y99.773 E.25585
G1 X152.744 Y100.414 E.02952
G1 X152.744 Y104.756 E.14401
G1 X168.586 Y104.756 E.52549
G1 X169.227 Y105.373 E.02952
G1 X169.244 Y132.586 E.9027
G1 X168.586 Y133.244 E.03089
G1 X158.725 Y133.244 E.3271
G1 X158.197 Y135.085 E.06353
G1 X157.156 Y137.81 E.09676
G1 X155.852 Y140.422 E.09683
G1 X155.104 Y141.678 E.04849
G1 X153.431 Y144.068 E.09677
G1 X152.506 Y145.2 E.04849
G1 X150.5 Y147.317 E.09677
G1 X148.293 Y149.228 E.09683
G1 X147.121 Y150.102 E.0485
G1 X144.657 Y151.667 E.09683
G1 X142.053 Y152.982 E.09677
G1 X140.703 Y153.543 E.0485
G1 X137.932 Y154.461 E.09683
G1 X135.086 Y155.102 E.09677
G1 X132.189 Y155.461 E.09683
G1 X130.729 Y155.532 E.04849
G1 X127.813 Y155.461 E.09677
G1 X124.916 Y155.102 E.09683
G1 X123.482 Y154.816 E.04849
G1 X120.669 Y154.036 E.09683
G1 X117.949 Y152.983 E.09677
G1 X115.343 Y151.667 E.09683
G1 X114.09 Y150.914 E.04849
G1 X111.708 Y149.23 E.09677
G1 X110.58 Y148.3 E.0485
G1 X108.47 Y146.283 E.09683
G1 X106.569 Y144.068 E.09683
G1 X104.896 Y141.678 E.09677
G1 X103.465 Y139.134 E.09683
G1 X102.844 Y137.81 E.0485
G1 X101.803 Y135.085 E.09676
G1 X101.275 Y133.244 E.06353
G1 X91.414 Y133.244 E.3271
G1 X90.756 Y132.586 E.03089
G1 X90.773 Y105.373 E.9027
G1 X91.414 Y104.756 E.02952
G1 X107.256 Y104.756 E.52549
G1 X107.256 Y100.414 E.14401
G1 X107.873 Y99.773 E.02952
G1 X115.571 Y99.756 E.25535
G1 X107.168 Y145.445 F30000
G1 F15476.087
G3 X106.145 Y144.179 I12.595 J-11.221 E.05403
G1 X93.274 Y157.05 E.6038
G1 X89.966 Y157.05 E.10975
G1 X70.952 Y138.036 E.89199
G1 X70.952 Y140.993 E.09808
G1 X90.349 Y121.596 E.90995
G1 X90.349 Y119.053 E.08435
G1 X71.815 Y100.519 E.86946
G2 X70.984 Y102.581 I3.157 J2.471 E.07473
G1 X74.592 Y98.972 E.16929
G3 X77.922 Y98.95 I1.88 J33.025 E.11052
G1 X90.349 Y111.377 E.58294
G1 X90.349 Y113.92 E.08435
G1 X70.952 Y133.316 E.90992
G1 X70.953 Y130.361 E.09803
G1 X97.642 Y157.05 E1.25204
G1 X100.95 Y157.05 E.10975
G1 X109.831 Y148.169 E.41661
G2 X111.067 Y149.229 I11.456 J-12.107 E.05402
G1 X148.933 Y149.229 F30000
G1 F15476.087
G2 X150.169 Y148.169 I-10.222 J-13.169 E.05402
G1 X159.05 Y157.05 E.41661
G1 X162.358 Y157.05 E.10975
G1 X189.044 Y130.364 E1.2519
G1 X189.044 Y133.312 E.09782
G1 X169.651 Y113.92 E.90976
G1 X169.651 Y111.377 E.08435
G1 X182.076 Y98.952 E.58286
G3 X185.408 Y98.972 I1.49 J29.388 E.11059
G1 X189.023 Y102.587 E.16961
G2 X188.191 Y100.513 I-4.784 J.716 E.07482
G1 X169.651 Y119.053 E.86972
G1 X169.651 Y121.596 E.08435
G1 X189.044 Y140.988 E.90976
G1 X189.044 Y138.04 E.09782
G1 X170.034 Y157.05 E.8918
G1 X166.726 Y157.05 E.10975
G1 X153.855 Y144.179 E.6038
G1 X153.756 Y144.313 E.00554
G3 X152.832 Y145.445 I-23.499 J-18.236 E.04848
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X153.756 Y144.313 E-.55527
G1 X153.855 Y144.179 E-.06349
G1 X154.118 Y144.442 E-.14124
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
G3 Z2.6 I.546 J-1.088 P1  F30000
G1 X70.624 Y102.569 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X75.007 Y98.602 I4.38 J.435 E.21503
G1 X185.073 Y98.604 E3.65108
G3 X189.398 Y103.007 I-.084 J4.408 E.22678
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.402 J.004 E.2296
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I-.005 J-4.4 E.22962
G1 X70.602 Y103.007 E1.6581
G3 X70.618 Y102.629 I4.402 J-.004 E.01258
G1 X70.232 Y102.547 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.234 Y102.531 E.00052
G3 X75.003 Y98.21 I4.78 J.484 E.21664
G1 X185.078 Y98.212 E3.38231
G3 X189.79 Y103.003 I-.09 J4.801 E.22868
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.794 J-.001 E.23131
G1 X75.003 Y157.79 E3.37983
G3 X70.813 Y155.324 I.002 J-4.794 E.15667
G1 X70.813 Y155.324 E0
G3 X70.21 Y152.997 I4.211 J-2.333 E.07463
G1 X70.21 Y103.003 E1.5362
G1 X70.229 Y102.607 E.01216
M204 S10000
; WIPE_START
G1 F24000
G1 X70.234 Y102.531 E-.02917
G1 X70.302 Y102.066 E-.17859
G1 X70.416 Y101.61 E-.17862
G1 X70.575 Y101.167 E-.17864
G1 X70.776 Y100.742 E-.17861
G1 X70.798 Y100.705 E-.01636
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.419 J1.143 P1  F30000
G1 X90.349 Y107.872 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X90.349 Y106.244 E.05401
G1 X70.953 Y125.639 E.90988
G1 X70.954 Y122.685 E.09797
G1 X105.318 Y157.05 E1.6121
G1 X108.626 Y157.05 E.10975
G1 X114.213 Y151.463 E.2621
G2 X116.219 Y152.599 I12.592 J-19.892 E.07649
G1 X120.67 Y157.05 E.2088
G1 X123.978 Y157.05 E.10975
G1 X125.436 Y155.591 E.06841
G2 X127.095 Y155.799 I2.95 J-16.853 E.05547
G1 X128.346 Y157.05 E.05868
G1 X131.654 Y157.05 E.10975
G1 X132.905 Y155.799 E.05868
G2 X134.564 Y155.591 I-1.291 J-17.06 E.05547
G1 X136.022 Y157.05 E.06841
G1 X139.33 Y157.05 E.10975
G1 X143.781 Y152.599 E.2088
G2 X145.787 Y151.463 I-10.587 J-21.028 E.07649
G1 X151.374 Y157.05 E.2621
G1 X154.682 Y157.05 E.10975
G1 X189.044 Y122.688 E1.612
G1 X189.044 Y125.636 E.09782
G1 X169.651 Y106.244 E.90976
G1 X169.651 Y107.872 E.05401
G1 X168.837 Y106.375 F30000
G1 F15476.087
G1 X168.837 Y105.559 E.02708
G1 X168.441 Y105.163 E.01856
G1 X168.189 Y105.163 E.00837
G1 X119.992 Y153.36 E2.26103
G2 X121.536 Y153.874 I5.989 J-15.417 E.05402
G1 X120.894 Y154.529 F30000
G1 F15476.087
G3 X119.355 Y153.997 I4.697 J-16.044 E.05402
G1 X116.302 Y157.05 E.14323
G1 X112.994 Y157.05 E.10975
G1 X70.954 Y115.01 E1.97215
G1 X70.954 Y117.962 E.09792
G1 X89.966 Y98.951 E.89187
G1 X93.275 Y98.951 E.10977
G1 X98.673 Y104.349 E.25323
G1 X99.92 Y104.349 E.04136
G1 X105.317 Y98.951 E.25322
G1 X108.627 Y98.951 E.10978
G1 X109.025 Y99.349 E.01866
G1 X112.596 Y99.349 E.11845
G1 X112.993 Y98.951 E.01866
G1 X116.303 Y98.951 E.10979
G1 X121.701 Y104.349 E.25321
G1 X122.947 Y104.349 E.04136
G1 X128.345 Y98.951 E.2532
G1 X131.655 Y98.951 E.10981
G1 X137.053 Y104.349 E.2532
G1 X138.299 Y104.349 E.04136
G1 X143.696 Y98.952 E.25319
G1 X147.007 Y98.952 E.10983
G1 X147.404 Y99.349 E.01863
G1 X150.975 Y99.349 E.11845
G1 X151.372 Y98.952 E.01862
G1 X154.684 Y98.952 E.10984
G1 X160.08 Y104.349 E.25318
G1 X161.327 Y104.349 E.04136
G1 X166.724 Y98.952 E.25317
G1 X170.036 Y98.952 E.10986
G1 X189.044 Y117.96 E.89172
G1 X189.044 Y115.012 E.09782
G1 X147.006 Y157.05 E1.97209
G1 X143.698 Y157.05 E.10975
G1 X140.645 Y153.997 E.14323
G3 X139.106 Y154.529 I-6.235 J-15.512 E.05402
G1 X138.464 Y153.874 F30000
G1 F15476.087
G2 X140.008 Y153.36 I-4.444 J-15.932 E.05402
G1 X91.811 Y105.163 E2.26103
G1 X91.559 Y105.163 E.00837
G1 X91.163 Y105.559 E.01856
G1 X91.163 Y106.375 E.02708
G1 X116.086 Y105.163 F30000
G1 F15476.087
G1 X115.837 Y105.163 E.00824
G1 X115.837 Y103.783 E.04577
G1 X91.163 Y128.457 E1.15752
G1 X91.163 Y127.543 E.03034
G1 X96.457 Y132.837 E.24837
G1 X94.459 Y132.837 E.06629
G1 X122.133 Y105.163 E1.29826
G1 X122.515 Y105.163 E.01266
G1 X156.214 Y138.862 E1.58088
G3 X154.445 Y141.935 I-60.74 J-32.911 E.11764
G1 X146.051 Y150.328 E.39376
G3 X145.193 Y150.869 I-5.92 J-8.437 E.03366
G1 X99.487 Y105.163 E2.14419
G1 X99.105 Y105.163 E.01266
G1 X91.163 Y113.105 E.3726
G1 X91.163 Y112.191 E.03034
G1 X133.826 Y154.878 E2.00198
G1 X168.837 Y119.867 E1.64245
G1 X168.837 Y120.781 E.03034
G1 X153.219 Y105.163 E.7327
G1 X152.837 Y105.163 E.01266
G1 X110.407 Y147.593 E1.99047
G3 X106.727 Y143.597 I19.928 J-22.044 E.18045
G1 X150.161 Y100.163 E2.03757
G1 X148.219 Y100.163 E.06444
G1 X152.337 Y104.281 E.19321
G1 X152.337 Y102.653 E.05401
G1 X153.151 Y103.22 F30000
G1 F15476.087
G1 X153.151 Y104.349 E.03743
G1 X153.651 Y104.349 E.01659
G1 X159.048 Y98.952 E.25318
G1 X162.36 Y98.952 E.10985
M73 P35 R27
G1 X167.756 Y104.349 E.25317
G1 X168.667 Y104.349 E.03019
G3 X168.891 Y104.461 I-.023 J.327 E.00854
G1 X174.4 Y98.952 E.25843
G1 X177.712 Y98.952 E.10987
G1 X189.044 Y110.285 E.53162
G1 X189.044 Y107.336 E.09782
G1 X169.651 Y126.729 E.90976
G1 X169.651 Y129.271 E.08435
G1 X189.044 Y148.664 E.90976
G1 X189.044 Y145.715 E.09782
G1 X177.71 Y157.05 E.53171
G1 X174.402 Y157.05 E.10975
G1 X156.819 Y139.467 E.82482
G1 X156.714 Y139.666 E.00744
G1 X162.729 Y133.651 E.28214
G1 X166.355 Y133.651 E.1203
G1 X188.185 Y155.481 E1.02409
G2 X189.023 Y153.413 I-3.266 J-2.527 E.07497
G1 X185.408 Y157.028 E.16961
G3 X182.078 Y157.05 I-1.88 J-33.03 E.11052
G1 X158.965 Y133.938 E1.08424
G3 X158.484 Y135.493 I-16.801 J-4.344 E.05402
G1 X157.847 Y134.835 F30000
G1 F15476.087
G2 X158.299 Y133.271 I-15.649 J-5.37 E.05403
G1 X130.191 Y105.163 E1.31861
G1 X129.809 Y105.163 E.01266
G1 X101.701 Y133.271 E1.31861
G2 X102.153 Y134.835 I16.101 J-3.806 E.05403
G1 X101.516 Y135.493 F30000
G1 F15476.087
G1 X101.418 Y135.216 E.00973
G3 X101.035 Y133.938 I25.84 J-8.439 E.04428
G1 X77.922 Y157.05 E1.08424
G3 X74.591 Y157.027 I-1.458 J-30.539 E.11056
G1 X70.972 Y153.408 E.16979
G2 X71.815 Y155.481 I4.162 J-.484 E.07516
G1 X93.645 Y133.651 E1.02409
G1 X97.271 Y133.651 E.1203
G1 X103.286 Y139.666 E.28214
G1 X103.181 Y139.467 E.00744
G1 X85.598 Y157.05 E.82482
G1 X82.29 Y157.05 E.10975
G1 X70.951 Y145.711 E.53193
G1 X70.951 Y148.669 E.09814
G1 X90.349 Y129.271 E.90999
G1 X90.349 Y126.729 E.08435
G1 X70.955 Y107.335 E.90978
G1 X70.955 Y110.285 E.09786
G1 X82.29 Y98.95 E.53174
G1 X85.599 Y98.951 E.10976
G1 X91.109 Y104.461 E.25851
G3 X91.333 Y104.349 I.248 J.215 E.00854
G1 X92.244 Y104.349 E.03019
G1 X97.642 Y98.951 E.25323
G1 X100.951 Y98.951 E.10978
G1 X106.349 Y104.349 E.25323
G1 X106.849 Y104.349 E.01659
G1 X106.849 Y103.22 E.03743
G1 X107.663 Y102.653 F30000
G1 F15476.087
G1 X107.663 Y104.281 E.05401
G1 X111.781 Y100.163 E.19321
G1 X109.839 Y100.163 E.06444
G1 X153.273 Y143.597 E2.03757
G3 X149.593 Y147.593 I-23.608 J-18.048 E.18045
G1 X107.163 Y105.163 E1.99047
G1 X106.781 Y105.163 E.01266
G1 X91.163 Y120.781 E.7327
G1 X91.163 Y119.867 E.03034
G1 X126.174 Y154.878 E1.64245
G1 X168.837 Y112.191 E2.00198
G1 X168.837 Y113.105 E.03034
G1 X160.895 Y105.163 E.3726
G1 X160.513 Y105.163 E.01266
G1 X114.807 Y150.869 E2.14419
G3 X113.949 Y150.328 I5.062 J-8.979 E.03366
G1 X105.555 Y141.935 E.39376
G3 X103.786 Y138.862 I25.846 J-16.921 E.11769
G1 X137.485 Y105.163 E1.58088
G1 X137.867 Y105.163 E.01266
G1 X165.541 Y132.837 E1.29826
G1 X163.543 Y132.837 E.06629
G1 X168.837 Y127.543 E.24837
G1 X168.837 Y128.457 E.03034
G1 X144.163 Y103.783 E1.15752
G1 X144.163 Y105.163 E.04577
G1 X143.914 Y105.163 E.00824
G1 X143.349 Y101.341 F30000
G1 F15476.087
G1 X143.349 Y102.969 E.05401
G1 X139.331 Y98.952 E.18846
G1 X136.021 Y98.951 E.10982
G1 X130.623 Y104.349 E.2532
G1 X129.377 Y104.349 E.04136
G1 X123.979 Y98.951 E.25321
G1 X120.669 Y98.951 E.1098
G1 X116.651 Y102.969 E.18848
G1 X116.651 Y101.341 E.05401
G1 X115.627 Y99.773 F30000
G1 F15476.087
G1 X115.927 Y100.073 E.01407
G3 X116.244 Y100.414 I-.254 J.554 E.01586
G1 X116.244 Y104.756 E.14401
G1 X143.756 Y104.756 E.91261
G1 X143.756 Y100.414 E.14401
G3 X144.414 Y99.756 I4.78 J4.121 E.03092
G1 X152.127 Y99.773 E.25585
G1 X152.744 Y100.414 E.02952
G1 X152.744 Y104.756 E.14401
G1 X168.586 Y104.756 E.52549
G1 X169.227 Y105.373 E.02952
G1 X169.244 Y132.586 E.9027
G1 X168.586 Y133.244 E.03089
G1 X158.725 Y133.244 E.3271
G1 X158.197 Y135.085 E.06353
G1 X157.156 Y137.81 E.09676
G1 X155.852 Y140.422 E.09683
G1 X155.104 Y141.678 E.04849
G1 X153.431 Y144.068 E.09677
G1 X152.506 Y145.2 E.04849
G1 X150.5 Y147.317 E.09677
G1 X148.293 Y149.228 E.09683
G1 X147.121 Y150.102 E.0485
G1 X144.657 Y151.667 E.09683
G1 X142.053 Y152.982 E.09677
G1 X140.703 Y153.543 E.0485
G1 X137.932 Y154.461 E.09683
G1 X135.086 Y155.102 E.09677
G1 X132.189 Y155.461 E.09683
G1 X130.729 Y155.532 E.04849
G1 X127.813 Y155.461 E.09677
G1 X124.916 Y155.102 E.09683
G1 X123.482 Y154.816 E.04849
G1 X120.669 Y154.036 E.09683
G1 X117.949 Y152.983 E.09677
G1 X115.343 Y151.667 E.09683
G1 X114.09 Y150.914 E.04849
G1 X111.708 Y149.23 E.09677
G1 X110.58 Y148.3 E.0485
G1 X108.47 Y146.283 E.09683
G1 X106.569 Y144.068 E.09683
G1 X104.896 Y141.678 E.09677
G1 X103.465 Y139.134 E.09683
G1 X102.844 Y137.81 E.0485
G1 X101.803 Y135.085 E.09676
G1 X101.275 Y133.244 E.06353
G1 X91.414 Y133.244 E.3271
G1 X90.756 Y132.586 E.03089
G1 X90.773 Y105.373 E.9027
G1 X91.414 Y104.756 E.02952
G1 X107.256 Y104.756 E.52549
G1 X107.256 Y100.414 E.14401
G1 X107.873 Y99.773 E.02952
G1 X115.571 Y99.756 E.25535
G1 X107.168 Y145.445 F30000
G1 F15476.087
G3 X106.145 Y144.179 I12.595 J-11.221 E.05403
G1 X93.274 Y157.05 E.6038
G1 X89.966 Y157.05 E.10975
G1 X70.952 Y138.036 E.89199
G1 X70.952 Y140.993 E.09808
G1 X90.349 Y121.596 E.90995
G1 X90.349 Y119.053 E.08435
G1 X71.815 Y100.519 E.86946
G2 X70.984 Y102.581 I3.194 J2.486 E.07471
G1 X74.592 Y98.972 E.16929
G3 X77.922 Y98.95 I1.88 J33.022 E.11052
G1 X90.349 Y111.377 E.58294
G1 X90.349 Y113.92 E.08435
G1 X70.952 Y133.316 E.90992
G1 X70.953 Y130.361 E.09803
G1 X97.642 Y157.05 E1.25204
G1 X100.95 Y157.05 E.10975
G1 X109.831 Y148.169 E.41661
G2 X111.067 Y149.229 I11.456 J-12.107 E.05402
G1 X148.933 Y149.229 F30000
G1 F15476.087
G2 X150.169 Y148.169 I-10.222 J-13.169 E.05402
G1 X159.05 Y157.05 E.41661
G1 X162.358 Y157.05 E.10975
G1 X189.044 Y130.364 E1.2519
G1 X189.044 Y133.312 E.09782
G1 X169.651 Y113.92 E.90976
G1 X169.651 Y111.377 E.08435
G1 X182.076 Y98.952 E.58285
G3 X185.408 Y98.972 I1.494 J29.018 E.11059
G1 X189.023 Y102.587 E.16961
G2 X188.191 Y100.513 I-4.784 J.715 E.07482
G1 X169.651 Y119.053 E.86972
G1 X169.651 Y121.596 E.08435
G1 X189.044 Y140.988 E.90976
G1 X189.044 Y138.04 E.09782
G1 X170.034 Y157.05 E.8918
G1 X166.726 Y157.05 E.10975
G1 X153.855 Y144.179 E.6038
G1 X153.756 Y144.313 E.00554
G3 X152.832 Y145.445 I-23.499 J-18.236 E.04848
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X153.756 Y144.313 E-.55527
G1 X153.855 Y144.179 E-.06349
G1 X154.118 Y144.442 E-.14124
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
G3 Z2.8 I.546 J-1.088 P1  F30000
G1 X70.624 Y102.569 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G3 X75.007 Y98.602 I4.389 J.444 E.2149
G1 X185.08 Y98.604 E3.65132
G3 X189.398 Y103.007 I-.091 J4.408 E.22655
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.411 J-.006 E.22946
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I0 J-4.406 E.22954
G1 X70.602 Y103.007 E1.6581
G3 X70.619 Y102.629 I4.411 J.006 E.01258
G1 X70.243 Y102.548 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.263 Y102.297 E.00772
G3 X70.442 Y101.531 I4.798 J.717 E.0242
G1 X70.442 Y101.531 E0
G3 X75.003 Y98.21 I4.575 J1.49 E.18523
G1 X185.085 Y98.212 E3.38253
G3 X189.79 Y103.003 I-.097 J4.801 E.22847
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.804 J-.012 E.23117
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.001 J-4.794 E.23131
G1 X70.21 Y103.003 E1.5362
G1 X70.239 Y102.608 E.01217
M204 S10000
; WIPE_START
G1 F24000
G1 X70.263 Y102.297 E-.11827
G1 X70.354 Y101.836 E-.1786
G1 X70.442 Y101.531 E-.12066
G1 X70.442 Y101.531 E0
G1 X70.575 Y101.167 E-.14729
G1 X70.776 Y100.742 E-.17862
G1 X70.799 Y100.705 E-.01656
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.25 J1.191 P1  F30000
G1 X90.784 Y104.896 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X90.854 Y104.827 E.00273
G1 X90.349 Y107.872 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X90.349 Y106.244 E.05401
G1 X70.953 Y125.639 E.90988
G1 X70.954 Y122.685 E.09797
G1 X105.318 Y157.05 E1.6121
G1 X108.626 Y157.05 E.10975
G1 X114.213 Y151.463 E.2621
G2 X116.219 Y152.599 I12.592 J-19.891 E.07649
G1 X120.67 Y157.05 E.2088
G1 X123.978 Y157.05 E.10975
G1 X125.436 Y155.591 E.06841
G2 X127.095 Y155.799 I2.95 J-16.853 E.05547
G1 X128.346 Y157.05 E.05868
G1 X131.654 Y157.05 E.10975
G1 X132.905 Y155.799 E.05868
G2 X134.564 Y155.591 I-1.291 J-17.06 E.05547
G1 X136.022 Y157.05 E.06841
G1 X139.33 Y157.05 E.10975
G1 X143.781 Y152.599 E.2088
G2 X145.787 Y151.463 I-10.587 J-21.029 E.07649
G1 X151.374 Y157.05 E.2621
G1 X154.682 Y157.05 E.10975
G1 X189.044 Y122.688 E1.612
G1 X189.044 Y125.636 E.09782
G1 X169.651 Y106.244 E.90976
G1 X169.651 Y107.872 E.05401
G1 X169.425 Y105.601 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.400025
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X168.615 Y104.791 E.05868
G1 X168.581 Y104.777 E.00186
G1 X167.965 Y104.777 E.03158
G1 X169.223 Y106.035 E.09111
G1 X169.223 Y106.672 E.03259
G1 X167.328 Y104.777 E.1372
G1 X166.692 Y104.777 E.03259
G1 X169.223 Y107.308 E.18329
G1 X169.223 Y107.945 E.03259
G1 X166.055 Y104.777 E.22938
G1 X165.419 Y104.777 E.03259
G1 X169.223 Y108.581 E.27546
G1 X169.223 Y109.218 E.03259
G1 X164.782 Y104.777 E.32155
G1 X164.146 Y104.777 E.03259
G1 X169.223 Y109.854 E.36764
G1 X169.223 Y110.49 E.03259
G1 X163.51 Y104.777 E.41373
G1 X162.873 Y104.777 E.03259
G1 X169.223 Y111.127 E.45982
G1 X169.223 Y111.763 E.03259
G1 X162.237 Y104.777 E.50591
G1 X161.6 Y104.777 E.03259
G1 X169.223 Y112.4 E.55199
G1 X169.223 Y113.036 E.03259
G1 X160.964 Y104.777 E.59808
G1 X160.327 Y104.777 E.03259
G1 X169.223 Y113.673 E.64417
G1 X169.223 Y114.309 E.03259
G1 X159.691 Y104.777 E.69026
G1 X159.055 Y104.777 E.03259
G1 X169.223 Y114.945 E.73635
G1 X169.223 Y115.582 E.03259
G1 X158.418 Y104.777 E.78244
G1 X157.782 Y104.777 E.03259
G1 X169.223 Y116.218 E.82852
G1 X169.223 Y116.855 E.03259
G1 X157.145 Y104.777 E.87461
G1 X156.509 Y104.777 E.03259
G1 X169.223 Y117.491 E.9207
G1 X169.223 Y118.128 E.03259
G1 X155.872 Y104.777 E.96679
G1 X155.236 Y104.777 E.03259
G1 X169.223 Y118.764 E1.01288
G1 X169.223 Y119.4 E.03259
G1 X154.6 Y104.777 E1.05897
G1 X153.963 Y104.777 E.03259
G1 X169.223 Y120.037 E1.10505
G1 X169.223 Y120.673 E.03259
G1 X153.327 Y104.777 E1.15114
G1 X152.723 Y104.777 E.03092
G1 X152.723 Y104.173 E.03092
G1 X148.327 Y99.777 E.31835
G1 X148.963 Y99.777 E.03259
G1 X152.723 Y103.537 E.27226
G1 X152.723 Y102.9 E.03259
G1 X149.6 Y99.777 E.22617
G1 X150.236 Y99.777 E.03259
G1 X152.723 Y102.264 E.18008
G1 X152.723 Y101.628 E.03259
G1 X150.872 Y99.777 E.134
G1 X151.509 Y99.777 E.03259
G1 X152.925 Y101.194 E.10257
M106 S127.5
G1 X152.604 Y99.784 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X152.673 Y99.854 E.00273
G1 X153.151 Y103.22 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X153.151 Y104.349 E.03743
G1 X153.651 Y104.349 E.01659
G1 X159.048 Y98.952 E.25317
G1 X162.36 Y98.952 E.10986
G1 X167.756 Y104.349 E.25317
G1 X168.667 Y104.349 E.03019
G3 X168.897 Y104.455 I-.657 J1.723 E.00842
G1 X174.4 Y98.952 E.25815
G1 X177.712 Y98.952 E.10988
G1 X189.044 Y110.285 E.53162
G1 X189.044 Y107.336 E.09782
G1 X169.651 Y126.729 E.90976
G1 X169.651 Y129.271 E.08435
G1 X189.044 Y148.664 E.90976
G1 X189.044 Y145.715 E.09782
G1 X177.71 Y157.05 E.53171
G1 X174.402 Y157.05 E.10975
G1 X156.819 Y139.467 E.82482
G1 X156.714 Y139.666 E.00744
G1 X162.729 Y133.651 E.28214
G1 X166.355 Y133.651 E.1203
G1 X188.185 Y155.481 E1.02409
G2 X189.023 Y153.413 I-3.266 J-2.527 E.07497
G1 X185.408 Y157.028 E.16961
G3 X182.078 Y157.05 I-1.88 J-33.033 E.11052
G1 X158.965 Y133.938 E1.08424
G3 X158.484 Y135.493 I-16.801 J-4.344 E.05402
G1 X154.521 Y142.884 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.400025
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X111.414 Y99.777 E3.12166
G1 X110.777 Y99.777 E.03259
G1 X154.11 Y143.11 E3.13804
M73 P36 R27
G1 X153.84 Y143.477 E.02331
G1 X110.141 Y99.777 E3.16457
G1 X109.504 Y99.777 E.03259
G1 X153.57 Y143.843 E3.19109
G1 X153.293 Y144.202 E.02324
G1 X108.868 Y99.777 E3.21713
G1 X108.232 Y99.777 E.03259
G1 X153.007 Y144.553 E3.24251
G1 X152.721 Y144.903 E.02316
G1 X107.747 Y99.929 E3.25688
G1 X107.429 Y100.247 E.02304
G1 X152.432 Y145.251 E3.25898
G1 X152.13 Y145.585 E.02307
G1 X107.277 Y100.732 E3.2481
G1 X107.277 Y101.369 E.03259
G1 X151.828 Y145.92 E3.22624
G1 X151.526 Y146.254 E.02307
G1 X107.277 Y102.005 E3.20439
G1 X107.277 Y102.642 E.03259
G1 X151.21 Y146.574 E3.18144
G1 X150.892 Y146.893 E.02304
G1 X107.277 Y103.278 E3.15845
G1 X107.277 Y103.914 E.03259
G1 X150.575 Y147.212 E3.13546
G1 X150.246 Y147.519 E.02306
G1 X107.277 Y104.551 E3.11165
G1 X107.277 Y104.777 E.01159
G1 X106.867 Y104.777 E.021
G1 X149.913 Y147.823 E3.11722
G1 X149.58 Y148.126 E.02307
G1 X106.231 Y104.777 E3.13918
G1 X105.594 Y104.777 E.03259
G1 X149.239 Y148.422 E3.16059
G1 X148.89 Y148.709 E.02315
G1 X104.958 Y104.777 E3.18141
G1 X104.321 Y104.777 E.03259
G1 X148.541 Y148.997 E3.20223
G1 X148.188 Y149.28 E.02318
G1 X103.685 Y104.777 E3.22276
G1 X103.049 Y104.777 E.03259
G1 X147.823 Y149.552 E3.24243
G1 X147.458 Y149.823 E.02329
G1 X102.412 Y104.777 E3.2621
G1 X101.776 Y104.777 E.03259
G1 X147.093 Y150.094 E3.28172
G1 X146.712 Y150.35 E.02349
G1 X101.139 Y104.777 E3.30022
G1 X100.503 Y104.777 E.03259
G1 X146.331 Y150.605 E3.31872
G1 X145.95 Y150.861 E.02349
M73 P36 R26
G1 X99.866 Y104.777 E3.33722
G1 X99.23 Y104.777 E.03259
G1 X145.555 Y151.102 E3.35469
G1 X145.157 Y151.341 E.02375
G1 X98.594 Y104.777 E3.372
G1 X97.957 Y104.777 E.03259
G1 X144.76 Y151.58 E3.38931
G1 X144.351 Y151.807 E.02397
G1 X97.321 Y104.777 E3.40575
G1 X96.684 Y104.777 E.03259
G1 X143.936 Y152.029 E3.42184
G1 X143.522 Y152.251 E.02407
G1 X96.048 Y104.777 E3.43793
G1 X95.411 Y104.777 E.03259
G1 X143.097 Y152.463 E3.45325
G1 X142.666 Y152.668 E.02446
G1 X94.775 Y104.777 E3.46808
G1 X94.139 Y104.777 E.03259
G1 X142.234 Y152.873 E3.48291
G1 X141.792 Y153.067 E.02472
G1 X93.502 Y104.777 E3.49701
G1 X92.866 Y104.777 E.03259
G1 X141.343 Y153.254 E3.51054
G1 X140.893 Y153.441 E.02493
G1 X92.229 Y104.777 E3.52407
G1 X91.593 Y104.777 E.03259
G1 X140.433 Y153.617 E3.53684
G1 X139.965 Y153.785 E.02548
G1 X91.178 Y104.998 E3.53299
G1 X90.859 Y105.317 E.02304
G1 X139.496 Y153.953 E3.52212
G1 X139.015 Y154.109 E.02587
G1 X90.777 Y105.871 E3.49326
G1 X90.777 Y106.507 E.03259
G1 X138.527 Y154.258 E3.45792
M73 P37 R26
G1 X138.04 Y154.406 E.02612
G1 X90.777 Y107.144 E3.42258
G1 X90.777 Y107.78 E.03259
G1 X137.536 Y154.539 E3.38609
G1 X137.027 Y154.666 E.02686
G1 X90.777 Y108.417 E3.34926
G1 X90.777 Y109.053 E.03259
G1 X136.518 Y154.794 E3.31242
G1 X135.988 Y154.9 E.02769
G1 X90.777 Y109.69 E3.27402
G1 X90.777 Y110.326 E.03259
G1 X135.457 Y155.006 E3.2356
G1 X134.92 Y155.105 E.02798
G1 X90.777 Y110.962 E3.19668
G1 X90.777 Y111.599 E.03259
G1 X134.366 Y155.188 E3.15656
G1 X133.812 Y155.27 E.02868
G1 X90.777 Y112.235 E3.11644
G1 X90.777 Y112.872 E.03259
G1 X133.241 Y155.335 E3.07507
G1 X132.661 Y155.392 E.0298
G1 X90.777 Y113.508 E3.03312
G1 X90.777 Y114.145 E.03259
G1 X132.077 Y155.445 E2.99082
G1 X131.471 Y155.474 E.0311
G1 X90.777 Y114.781 E2.94689
G1 X90.777 Y115.417 E.03259
G1 X130.864 Y155.504 E2.90297
G1 X130.234 Y155.511 E.03225
G1 X90.777 Y116.054 E2.85736
G1 X90.777 Y116.69 E.03259
G1 X129.598 Y155.511 E2.81127
G1 X128.946 Y155.495 E.03342
G1 X90.777 Y117.327 E2.76403
G1 X90.777 Y117.963 E.03259
G1 X128.276 Y155.462 E2.71555
G1 X127.595 Y155.418 E.03493
G1 X90.777 Y118.6 E2.66625
M73 P38 R26
G1 X90.777 Y119.236 E.03259
G1 X126.889 Y155.348 E2.61511
G1 X126.173 Y155.268 E.03693
G1 X90.777 Y119.872 E2.56321
G1 X90.777 Y120.509 E.03259
G1 X125.425 Y155.156 E2.50907
G1 X124.662 Y155.03 E.0396
G1 X90.777 Y121.145 E2.45382
G1 X90.777 Y121.782 E.03259
G1 X123.867 Y154.871 E2.39625
G1 X123.043 Y154.684 E.04326
G1 X90.777 Y122.418 E2.33659
G1 X90.777 Y123.055 E.03259
G1 X122.193 Y154.47 E2.27504
G1 X121.288 Y154.201 E.04838
G1 X101.678 Y134.591 E1.42009
G1 X101.823 Y135.077 E.02595
G1 X101.985 Y135.535 E.02491
G1 X120.347 Y153.897 E1.3297
G1 X119.354 Y153.541 E.05401
M73 P38 R25
G1 X102.34 Y136.527 E1.23209
G1 X102.783 Y137.606 E.05974
G1 X118.27 Y153.093 E1.12153
G1 X117.956 Y152.963 E.01743
G1 X117.094 Y152.554 E.04884
G1 X103.324 Y138.783 E.99723
G1 X103.484 Y139.124 E.01929
G1 X103.998 Y140.094 E.05623
G1 X115.782 Y151.878 E.85337
G1 X115.352 Y151.648 E.025
G1 X114.256 Y150.988 E.06552
G1 X104.884 Y141.616 E.67868
G1 X105.72 Y142.881 E.07762
G1 X106.306 Y143.675 E.05052
G1 X113.096 Y150.465 E.49173
M106 S127.5
G1 X111.067 Y149.229 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G3 X109.831 Y148.169 I10.22 J-13.167 E.05402
G1 X100.95 Y157.05 E.41661
G1 X97.642 Y157.05 E.10975
M73 P39 R25
G1 X70.953 Y130.361 E1.25204
G1 X70.952 Y133.316 E.09803
G1 X90.349 Y113.92 E.90991
G1 X90.349 Y111.377 E.08435
G1 X77.923 Y98.95 E.58294
G2 X74.592 Y98.972 I-1.45 J33.045 E.11052
G1 X70.984 Y102.581 E.16929
G3 X71.815 Y100.519 I3.979 J.405 E.07474
G1 X90.349 Y119.053 E.86946
G1 X90.349 Y121.596 E.08435
G1 X70.952 Y140.993 E.90995
G1 X70.952 Y138.036 E.09808
G1 X89.966 Y157.05 E.89198
G1 X93.274 Y157.05 E.10975
G1 X106.145 Y144.179 E.6038
G2 X107.168 Y145.445 I13.619 J-9.955 E.05403
G1 X101.516 Y135.493 F30000
G1 F15476.087
G1 X101.418 Y135.216 E.00973
G3 X101.035 Y133.938 I25.699 J-8.397 E.04428
G1 X77.922 Y157.05 E1.08424
G3 X74.591 Y157.027 I-1.458 J-30.543 E.11056
G1 X70.972 Y153.408 E.16979
G2 X71.815 Y155.481 I4.162 J-.484 E.07516
G1 X93.645 Y133.651 E1.02409
G1 X97.271 Y133.651 E.1203
G1 X103.286 Y139.666 E.28214
G1 X103.181 Y139.467 E.00744
G1 X85.598 Y157.05 E.82482
G1 X82.29 Y157.05 E.10975
G1 X70.951 Y145.711 E.53193
G1 X70.951 Y148.669 E.09814
G1 X90.349 Y129.271 E.90999
G1 X90.349 Y126.729 E.08435
G1 X70.955 Y107.335 E.90978
G1 X70.955 Y110.285 E.09786
G1 X82.29 Y98.95 E.53174
G1 X85.599 Y98.951 E.10976
G1 X91.115 Y104.455 E.25851
G3 X91.333 Y104.349 I.238 J.21 E.00827
G1 X92.244 Y104.349 E.03019
G1 X97.641 Y98.951 E.25323
G1 X100.951 Y98.951 E.10978
G1 X106.349 Y104.349 E.25322
G1 X106.849 Y104.349 E.01659
G1 X106.849 Y103.22 E.03743
G1 X107.284 Y99.896 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X107.354 Y99.827 E.00273
G1 X116.104 Y99.784 F30000
G1 F15000
G1 X116.173 Y99.854 E.00273
G1 X116.425 Y100.97 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.400025
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X115.232 Y99.777 E.08639
G1 X114.596 Y99.777 E.03259
G1 X116.223 Y101.404 E.11782
G1 X116.223 Y102.041 E.03259
G1 X113.959 Y99.777 E.16391
G1 X113.323 Y99.777 E.03259
G1 X116.223 Y102.677 E.20999
G1 X116.223 Y103.313 E.03259
G1 X112.687 Y99.777 E.25608
G1 X112.05 Y99.777 E.03259
G1 X116.425 Y104.152 E.31684
M106 S127.5
G1 X116.848 Y104.575 F30000
M106 S255
G1 F3000
G1 X154.628 Y142.356 E2.73597
G1 X154.882 Y141.973 E.02351
G1 X117.687 Y104.777 E2.69361
G1 X118.323 Y104.777 E.03259
G1 X155.133 Y141.587 E2.66568
G1 X155.371 Y141.189 E.02377
G1 X118.959 Y104.777 E2.63679
G1 X119.596 Y104.777 E.03259
G1 X155.608 Y140.79 E2.6079
G1 X155.845 Y140.39 E.02379
G1 X120.232 Y104.777 E2.57895
G1 X120.869 Y104.777 E.03259
G1 X156.065 Y139.974 E2.54884
G1 X156.286 Y139.558 E.0241
G1 X121.505 Y104.777 E2.51873
G1 X122.142 Y104.777 E.03259
G1 X156.507 Y139.142 E2.48862
G1 X156.711 Y138.71 E.02448
G1 X122.778 Y104.777 E2.4573
G1 X123.414 Y104.777 E.03259
G1 X156.914 Y138.277 E2.42593
G1 X157.117 Y137.844 E.0245
G1 X124.051 Y104.777 E2.39455
G1 X124.687 Y104.777 E.03259
G1 X157.304 Y137.394 E2.362
G1 X157.489 Y136.943 E.02498
G1 X125.324 Y104.777 E2.32932
G1 X125.96 Y104.777 E.03259
G1 X157.674 Y136.491 E2.29664
G1 X157.842 Y136.023 E.02548
G1 X126.597 Y104.777 E2.26271
G1 X127.233 Y104.777 E.03259
G1 X158.009 Y135.553 E2.22867
G1 X158.175 Y135.083 E.02553
G1 X127.869 Y104.777 E2.19463
G1 X128.506 Y104.777 E.03259
G1 X158.322 Y134.593 E2.15918
G1 X158.468 Y134.103 E.02618
G1 X129.142 Y104.777 E2.12371
G1 X129.779 Y104.777 E.03259
G1 X158.612 Y133.611 E2.08804
G1 X158.708 Y133.223 E.02046
G1 X158.861 Y133.223 E.00782
G1 X130.415 Y104.777 E2.05993
G1 X131.052 Y104.777 E.03259
G1 X159.497 Y133.223 E2.05993
G1 X160.134 Y133.223 E.03259
G1 X131.688 Y104.777 E2.05993
G1 X132.324 Y104.777 E.03259
G1 X160.77 Y133.223 E2.05993
G1 X161.406 Y133.223 E.03259
G1 X132.961 Y104.777 E2.05993
G1 X133.597 Y104.777 E.03259
G1 X162.043 Y133.223 E2.05993
G1 X162.679 Y133.223 E.03259
G1 X134.234 Y104.777 E2.05993
G1 X134.87 Y104.777 E.03259
G1 X163.316 Y133.223 E2.05993
G1 X163.952 Y133.223 E.03259
M73 P40 R25
G1 X135.507 Y104.777 E2.05993
G1 X136.143 Y104.777 E.03259
G1 X164.589 Y133.223 E2.05993
G1 X165.225 Y133.223 E.03259
G1 X136.779 Y104.777 E2.05993
G1 X137.416 Y104.777 E.03259
G1 X165.861 Y133.223 E2.05993
G1 X166.498 Y133.223 E.03259
G1 X138.052 Y104.777 E2.05993
G1 X138.689 Y104.777 E.03259
G1 X167.134 Y133.223 E2.05993
G1 X167.771 Y133.223 E.03259
G1 X139.325 Y104.777 E2.05993
G1 X139.962 Y104.777 E.03259
G1 X168.407 Y133.223 E2.05993
G1 X168.615 Y133.209 E.01067
G1 X168.822 Y133.002 E.01501
G1 X140.598 Y104.777 E2.04391
G1 X141.234 Y104.777 E.03259
G1 X169.141 Y132.683 E2.02087
G2 X169.223 Y132.581 I-.082 J-.15 E.00688
G1 X169.223 Y132.129 E.02316
G1 X141.871 Y104.777 E1.98073
G1 X142.507 Y104.777 E.03259
G1 X169.223 Y131.493 E1.93464
G1 X169.223 Y130.856 E.03259
G1 X143.144 Y104.777 E1.88856
G1 X143.777 Y104.774 E.03244
G1 X169.223 Y130.22 E1.84268
G1 X169.223 Y129.583 E.03259
G1 X143.777 Y104.138 E1.84268
G1 X143.777 Y103.501 E.03259
G1 X169.223 Y128.947 E1.84268
G1 X169.223 Y128.31 E.03259
G1 X143.777 Y102.865 E1.84268
G1 X143.777 Y102.229 E.03259
G1 X169.223 Y127.674 E1.84268
G1 X169.223 Y127.038 E.03259
G1 X143.777 Y101.592 E1.84268
G1 X143.777 Y100.956 E.03259
G1 X169.223 Y126.401 E1.84268
G1 X169.223 Y125.765 E.03259
G1 X143.817 Y100.359 E1.8398
G1 X144.135 Y100.041 E.02304
G1 X169.223 Y125.128 E1.81676
G1 X169.223 Y124.492 E.03259
G1 X144.508 Y99.777 E1.78976
G1 X145.145 Y99.777 E.03259
G1 X169.223 Y123.855 E1.74367
G1 X169.223 Y123.219 E.03259
G1 X145.781 Y99.777 E1.69758
M73 P40 R24
G1 X146.417 Y99.777 E.03259
G1 X169.223 Y122.583 E1.65149
G1 X169.223 Y121.946 E.03259
G1 X147.054 Y99.777 E1.6054
G1 X147.69 Y99.777 E.03259
G1 X169.425 Y121.512 E1.57398
M106 S127.5
G1 X169.104 Y133.216 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
M73 P41 R24
G1 X169.173 Y133.146 E.00273
G1 X152.832 Y145.445 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X153.756 Y144.313 I-22.575 J-19.368 E.04848
G1 X153.855 Y144.179 E.00554
G1 X166.726 Y157.05 E.6038
G1 X170.034 Y157.05 E.10975
G1 X189.044 Y138.04 E.8918
G1 X189.044 Y140.988 E.09782
G1 X169.651 Y121.596 E.90976
G1 X169.651 Y119.053 E.08435
G1 X188.191 Y100.513 E.86972
G3 X189.023 Y102.587 I-3.951 J2.79 E.07482
G1 X185.408 Y98.972 E.16961
G2 X182.075 Y98.952 I-1.835 J28.618 E.1106
G1 X169.651 Y111.377 E.58284
G1 X169.651 Y113.92 E.08435
G1 X189.044 Y133.312 E.90976
G1 X189.044 Y130.364 E.09782
G1 X162.358 Y157.05 E1.2519
G1 X159.05 Y157.05 E.10975
G1 X150.169 Y148.169 E.41661
G3 X148.933 Y149.229 I-11.457 J-12.109 E.05402
G1 X139.106 Y154.529 F30000
G1 F15476.087
G2 X140.645 Y153.997 I-4.697 J-16.045 E.05402
G1 X143.698 Y157.05 E.14323
G1 X147.006 Y157.05 E.10975
G1 X189.044 Y115.012 E1.97209
G1 X189.044 Y117.96 E.09782
G1 X170.036 Y98.952 E.89172
G1 X166.724 Y98.952 E.10987
G1 X161.327 Y104.349 E.25316
G1 X160.08 Y104.349 E.04136
G1 X154.684 Y98.952 E.25317
G1 X151.372 Y98.952 E.10985
G1 X150.975 Y99.349 E.01862
G1 X147.404 Y99.349 E.11845
G1 X147.008 Y98.952 E.01862
G1 X143.696 Y98.952 E.10984
G1 X138.299 Y104.349 E.25318
G1 X137.053 Y104.349 E.04136
G1 X131.655 Y98.951 E.2532
G1 X128.345 Y98.951 E.10982
G1 X122.947 Y104.349 E.2532
G1 X121.701 Y104.349 E.04136
G1 X116.303 Y98.951 E.25321
G1 X112.993 Y98.951 E.1098
G1 X112.596 Y99.349 E.01865
G1 X109.025 Y99.349 E.11845
G1 X108.627 Y98.951 E.01866
G1 X105.317 Y98.951 E.10979
G1 X99.92 Y104.349 E.25322
G1 X98.673 Y104.349 E.04136
G1 X93.275 Y98.951 E.25323
G1 X89.966 Y98.951 E.10977
G1 X70.954 Y117.962 E.89187
G1 X70.954 Y115.01 E.09792
G1 X112.994 Y157.05 E1.97215
G1 X116.302 Y157.05 E.10975
G1 X119.355 Y153.997 E.14323
G2 X120.894 Y154.529 I6.235 J-15.511 E.05402
G1 X100.512 Y133.425 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.400025
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X90.777 Y123.691 E.70492
G1 X90.777 Y124.327 E.03259
G1 X99.673 Y133.223 E.64417
G1 X99.036 Y133.223 E.03259
G1 X90.777 Y124.964 E.59808
G1 X90.777 Y125.6 E.03259
G1 X98.4 Y133.223 E.552
G1 X97.763 Y133.223 E.03259
G1 X90.777 Y126.237 E.50591
G1 X90.777 Y126.873 E.03259
G1 X97.127 Y133.223 E.45982
G1 X96.49 Y133.223 E.03259
G1 X90.777 Y127.51 E.41373
G1 X90.777 Y128.146 E.03259
G1 X95.854 Y133.223 E.36764
G1 X95.218 Y133.223 E.03259
G1 X90.777 Y128.782 E.32155
G1 X90.777 Y129.419 E.03259
G1 X94.581 Y133.223 E.27547
G1 X93.945 Y133.223 E.03259
G1 X90.777 Y130.055 E.22938
G1 X90.777 Y130.692 E.03259
G1 X93.308 Y133.223 E.18329
G1 X92.672 Y133.223 E.03259
G1 X90.777 Y131.328 E.1372
G1 X90.777 Y131.965 E.03259
G1 X92.035 Y133.223 E.09111
G1 X91.419 Y133.223 E.03158
G1 X91.385 Y133.209 E.00186
G1 X90.575 Y132.399 E.05868
M106 S127.5
G1 X90.784 Y133.104 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X90.854 Y133.173 E.00273
G1 X116.651 Y101.341 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.651 Y102.969 E.05401
G1 X120.669 Y98.951 E.18847
G1 X123.979 Y98.951 E.10981
G1 X129.377 Y104.349 E.2532
G1 X130.623 Y104.349 E.04136
G1 X136.021 Y98.952 E.25319
G1 X139.331 Y98.952 E.10983
G1 X143.349 Y102.969 E.18846
G1 X143.349 Y101.341 E.05401
G1 X143.784 Y99.896 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X143.854 Y99.827 E.00273
G1 X169.104 Y104.784 F30000
G1 F15000
G1 X169.173 Y104.854 E.00273
M106 S188.7
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X169.104 Y104.784 E-.76
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
G3 Z3 I.027 J-1.217 P1  F30000
G1 X70.624 Y102.569 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X75.007 Y98.602 I4.38 J.435 E.21503
G1 X185.087 Y98.604 E3.65155
G3 X189.398 Y103.007 I-.098 J4.408 E.22631
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.402 J.004 E.2296
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I.006 J-4.411 E.22946
G1 X70.602 Y103.007 E1.6581
G3 X70.618 Y102.629 I4.402 J-.004 E.01258
G1 X70.232 Y102.547 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.233 Y102.531 E.00051
G3 X75.003 Y98.21 I4.77 J.473 E.21678
G1 X185.092 Y98.212 E3.38274
G3 X189.79 Y103.003 I-.104 J4.801 E.22825
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.794 J-.001 E.23131
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.001 J-4.794 E.23131
G1 X70.21 Y103.003 E1.5362
G1 X70.229 Y102.607 E.01216
M204 S10000
; WIPE_START
G1 F24000
G1 X70.233 Y102.531 E-.02916
G1 X70.302 Y102.066 E-.17861
G1 X70.416 Y101.61 E-.17862
G1 X70.575 Y101.167 E-.17864
G1 X70.776 Y100.742 E-.17862
G1 X70.798 Y100.705 E-.01635
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.262 J1.188 P1  F30000
G1 X90.678 Y105.093 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421201
G1 F15000
G1 X90.923 Y104.847 E.01071
G1 X91.277 Y104.847 E.01092
G3 X91.565 Y104.741 I.212 J.13 E.01018
G1 X90.741 Y105.565 E.03591
G1 X90.741 Y106.1 E.01649
G1 X92.1 Y104.741 E.05924
G1 X92.635 Y104.741 E.01649
G1 X90.741 Y106.635 E.08256
G1 X90.741 Y107.17 E.01649
G1 X93.17 Y104.741 E.10588
G1 X93.705 Y104.741 E.01649
G1 X90.741 Y107.705 E.1292
G1 X90.741 Y108.239 E.01649
G1 X94.239 Y104.741 E.15252
G1 X94.774 Y104.741 E.01649
M73 P42 R24
G1 X90.741 Y108.774 E.17584
G1 X90.741 Y109.309 E.01649
G1 X95.309 Y104.741 E.19916
G1 X95.844 Y104.741 E.01649
G1 X90.741 Y109.844 E.22248
G1 X90.741 Y110.379 E.01649
G1 X96.379 Y104.741 E.2458
G1 X96.914 Y104.741 E.01649
G1 X90.741 Y110.914 E.26913
G1 X90.741 Y111.449 E.01649
G1 X97.449 Y104.741 E.29245
G1 X97.984 Y104.741 E.01649
G1 X90.741 Y111.984 E.31577
G1 X90.741 Y112.519 E.01649
G1 X98.519 Y104.741 E.33909
G1 X99.054 Y104.741 E.01649
G1 X90.741 Y113.054 E.36241
G1 X90.741 Y113.589 E.01649
G1 X99.589 Y104.741 E.38573
G1 X100.124 Y104.741 E.01649
G1 X90.741 Y114.124 E.40905
G1 X90.741 Y114.659 E.01649
G1 X100.659 Y104.741 E.43237
G1 X101.194 Y104.741 E.01649
G1 X90.741 Y115.194 E.45569
G1 X90.741 Y115.729 E.01649
G1 X101.729 Y104.741 E.47902
G1 X102.264 Y104.741 E.01649
G1 X90.741 Y116.264 E.50234
G1 X90.741 Y116.799 E.01649
G1 X102.799 Y104.741 E.52566
G1 X103.334 Y104.741 E.01649
G1 X90.741 Y117.334 E.54898
G1 X90.741 Y117.869 E.01649
G1 X103.869 Y104.741 E.5723
G1 X104.404 Y104.741 E.01649
G1 X90.741 Y118.404 E.59562
G1 X90.741 Y118.939 E.01649
G1 X104.939 Y104.741 E.61894
G1 X105.474 Y104.741 E.01649
G1 X90.741 Y119.474 E.64226
G1 X90.741 Y120.009 E.01649
G1 X106.009 Y104.741 E.66558
G1 X106.544 Y104.741 E.01649
G1 X90.741 Y120.544 E.68891
G1 X90.741 Y121.079 E.01649
G1 X112.079 Y99.741 E.93019
G1 X112.614 Y99.741 E.01649
G1 X90.741 Y121.614 E.95351
G1 X90.741 Y122.149 E.01649
G1 X113.149 Y99.741 E.97684
G1 X113.684 Y99.741 E.01649
G1 X90.741 Y122.684 E1.00016
G1 X90.741 Y123.219 E.01649
G1 X114.219 Y99.741 E1.02348
G1 X114.754 Y99.741 E.01649
G1 X90.741 Y123.754 E1.0468
G1 X90.741 Y124.289 E.01649
G1 X115.289 Y99.741 E1.07012
G1 X115.589 Y99.741 E.00925
G3 X115.72 Y99.844 I-.059 J.21 E.00529
G1 X90.741 Y124.824 E1.08892
G1 X90.741 Y125.359 E.01649
G1 X116.153 Y99.947 E1.10779
G1 X116.153 Y100.277 E.01019
G3 X116.249 Y100.386 I-.083 J.17 E.00458
G1 X90.741 Y125.893 E1.11197
G1 X90.741 Y126.428 E.01649
G1 X116.259 Y100.91 E1.11243
G1 X116.259 Y101.445 E.01649
G1 X90.741 Y126.963 E1.11243
G1 X90.741 Y127.498 E.01649
G1 X116.259 Y101.98 E1.11243
G1 X116.259 Y102.515 E.01649
G1 X90.741 Y128.033 E1.11243
G1 X90.741 Y128.568 E.01649
G1 X116.259 Y103.05 E1.11243
G1 X116.259 Y103.585 E.01649
G1 X90.741 Y129.103 E1.11243
G1 X90.741 Y129.638 E.01649
G1 X116.259 Y104.12 E1.11243
G1 X116.259 Y104.655 E.01649
G1 X90.741 Y130.173 E1.11243
G1 X90.741 Y130.708 E.01649
G1 X116.708 Y104.741 E1.13201
G1 X117.243 Y104.741 E.01649
G1 X90.741 Y131.243 E1.15533
G1 X90.741 Y131.778 E.01649
G1 X117.778 Y104.741 E1.17865
G1 X118.313 Y104.741 E.01649
G1 X90.741 Y132.313 E1.20197
G1 X90.741 Y132.589 E.00849
G2 X90.847 Y132.723 I.215 J-.061 E.00542
G1 X90.847 Y132.742 E.00058
G1 X118.848 Y104.741 E1.22065
G1 X119.383 Y104.741 E.01649
G1 X90.971 Y133.153 E1.23857
G1 X91.277 Y133.153 E.00944
G2 X91.403 Y133.256 I.187 J-.1 E.00514
G1 X119.918 Y104.741 E1.24306
G1 X120.453 Y104.741 E.01649
G1 X91.935 Y133.259 E1.24321
G1 X92.47 Y133.259 E.01649
G1 X120.988 Y104.741 E1.24321
G1 X121.523 Y104.741 E.01649
G1 X93.004 Y133.259 E1.24321
G1 X93.539 Y133.259 E.01649
G1 X122.058 Y104.741 E1.24321
G1 X122.593 Y104.741 E.01649
G1 X94.074 Y133.259 E1.24321
G1 X94.609 Y133.259 E.01649
G1 X123.128 Y104.741 E1.24321
G1 X123.663 Y104.741 E.01649
G1 X95.144 Y133.259 E1.24321
G1 X95.679 Y133.259 E.01649
G1 X124.198 Y104.741 E1.24321
G1 X124.733 Y104.741 E.01649
G1 X96.214 Y133.259 E1.24321
G1 X96.749 Y133.259 E.01649
G1 X125.268 Y104.741 E1.24321
G1 X125.803 Y104.741 E.01649
G1 X97.284 Y133.259 E1.24321
G1 X97.819 Y133.259 E.01649
G1 X126.338 Y104.741 E1.24321
G1 X126.873 Y104.741 E.01649
G1 X98.354 Y133.259 E1.24321
G1 X98.889 Y133.259 E.01649
G1 X127.408 Y104.741 E1.24321
G1 X127.943 Y104.741 E.01649
G1 X99.424 Y133.259 E1.24321
G1 X99.959 Y133.259 E.01649
G1 X128.478 Y104.741 E1.24321
G1 X129.013 Y104.741 E.01649
G1 X100.494 Y133.259 E1.24321
G1 X101.029 Y133.259 E.01649
G1 X129.548 Y104.741 E1.24321
G1 X130.082 Y104.741 E.01649
G1 X101.323 Y133.5 E1.25372
G1 X101.438 Y133.92 E.01341
G1 X130.617 Y104.741 E1.27201
G1 X131.152 Y104.741 E.01649
G1 X101.562 Y134.331 E1.28996
G1 X101.685 Y134.743 E.01325
G1 X131.687 Y104.741 E1.3079
G1 X132.222 Y104.741 E.01649
G1 X101.811 Y135.152 E1.32573
G1 X101.951 Y135.547 E.01292
G1 X132.757 Y104.741 E1.34296
G1 X133.292 Y104.741 E.01649
G1 X102.091 Y135.942 E1.36019
G1 X102.23 Y136.338 E.01292
G1 X133.827 Y104.741 E1.37741
G1 X134.362 Y104.741 E.01649
G1 X102.381 Y136.722 E1.39417
G1 X102.537 Y137.101 E.01264
G1 X134.897 Y104.741 E1.41071
G1 X135.432 Y104.741 E.01649
G1 X102.692 Y137.481 E1.42724
G1 X102.85 Y137.858 E.01261
G1 X135.967 Y104.741 E1.44371
G1 X136.502 Y104.741 E.01649
G1 X103.02 Y138.223 E1.45958
G1 X103.191 Y138.587 E.0124
G1 X137.037 Y104.741 E1.47545
G1 X137.572 Y104.741 E.01649
G1 X103.362 Y138.951 E1.49133
G1 X103.54 Y139.308 E.0123
G1 X138.107 Y104.741 E1.5069
G1 X138.642 Y104.741 E.01649
G1 X103.725 Y139.657 E1.52213
G1 X103.911 Y140.007 E.0122
G1 X139.177 Y104.741 E1.53737
G1 X139.712 Y104.741 E.01649
G1 X104.096 Y140.357 E1.55261
G1 X104.293 Y140.695 E.01206
G1 X140.247 Y104.741 E1.56736
G1 X140.782 Y104.741 E.01649
G1 X104.493 Y141.03 E1.58197
G1 X104.692 Y141.365 E.01203
G1 X141.317 Y104.741 E1.59659
G1 X141.852 Y104.741 E.01649
G1 X104.892 Y141.7 E1.61118
G1 X105.106 Y142.022 E.0119
G1 X142.387 Y104.741 E1.62519
G1 X142.922 Y104.741 E.01649
G1 X105.319 Y142.343 E1.63921
G1 X105.533 Y142.665 E.0119
G1 X148.457 Y99.741 E1.87119
G1 X148.992 Y99.741 E.01649
G1 X105.75 Y142.982 E1.88505
G1 X105.977 Y143.29 E.01179
G1 X149.527 Y99.741 E1.89847
G1 X150.062 Y99.741 E.01649
G1 X106.204 Y143.598 E1.91189
G1 X106.431 Y143.906 E.01179
G1 X150.597 Y99.741 E1.92531
G1 X151.132 Y99.741 E.01649
G1 X106.664 Y144.208 E1.93848
G1 X106.905 Y144.503 E.01172
G1 X151.667 Y99.741 E1.95131
G1 X152.089 Y99.741 E.01301
G3 X152.159 Y99.783 I-.016 J.106 E.0026
G1 X107.145 Y144.797 E1.96229
G1 X107.386 Y145.092 E.01172
G1 X152.604 Y99.873 E1.97121
G1 X152.653 Y99.922 E.00213
G1 X152.653 Y100.277 E.01094
G1 X152.694 Y100.318 E.00179
G1 X107.634 Y145.378 E1.9643
G1 X107.888 Y145.659 E.01168
G1 X152.759 Y100.788 E1.95609
G1 X152.759 Y101.323 E.01649
G1 X108.142 Y145.941 E1.94503
G1 X108.395 Y146.222 E.01168
G1 X152.759 Y101.858 E1.93397
G1 X152.759 Y102.393 E.01649
G1 X108.659 Y146.493 E1.92248
G1 X108.926 Y146.761 E.01166
G1 X152.759 Y102.928 E1.91085
G1 X152.759 Y103.463 E.01649
G1 X109.193 Y147.03 E1.89922
G1 X109.459 Y147.298 E.01166
G1 X152.759 Y103.998 E1.88758
G1 X152.759 Y104.533 E.01649
G1 X109.738 Y147.554 E1.87544
G1 X110.018 Y147.809 E.01167
G1 X153.086 Y104.741 E1.87748
G1 X153.621 Y104.741 E.01649
G1 X110.298 Y148.064 E1.8886
G1 X110.578 Y148.318 E.01167
G1 X154.156 Y104.741 E1.89969
G1 X154.691 Y104.741 E.01649
G1 X110.872 Y148.56 E1.91023
G1 X111.165 Y148.802 E.01171
G1 X155.226 Y104.741 E1.92076
G1 X155.761 Y104.741 E.01649
G1 X111.458 Y149.043 E1.9313
G1 X111.754 Y149.283 E.01173
G1 X156.296 Y104.741 E1.94173
G1 X156.831 Y104.741 E.01649
G1 X112.061 Y149.511 E1.95168
G1 X112.367 Y149.739 E.01179
G1 X157.366 Y104.741 E1.96163
G1 X157.901 Y104.741 E.01649
G1 X112.674 Y149.968 E1.97158
G1 X112.986 Y150.191 E.01182
G1 X158.436 Y104.741 E1.98132
G1 X158.971 Y104.741 E.01649
G1 X113.306 Y150.406 E1.99068
G1 X113.626 Y150.62 E.01189
G1 X159.506 Y104.741 E2.00005
G1 X160.041 Y104.741 E.01649
G1 X113.946 Y150.835 E2.00941
G1 X114.275 Y151.042 E.01196
G1 X160.576 Y104.741 E2.01842
G1 X161.111 Y104.741 E.01649
G1 X114.609 Y151.243 E2.02718
G1 X114.943 Y151.444 E.01202
G1 X161.646 Y104.741 E2.03594
G1 X162.181 Y104.741 E.01649
G1 X115.277 Y151.645 E2.0447
G1 X115.622 Y151.834 E.01215
G1 X162.716 Y104.741 E2.05295
G1 X163.251 Y104.741 E.01649
G1 X115.971 Y152.021 E2.06109
G1 X116.319 Y152.207 E.01218
G1 X163.786 Y104.741 E2.06923
G1 X164.321 Y104.741 E.01649
G1 X116.669 Y152.392 E2.07729
G1 X117.032 Y152.564 E.01238
G1 X164.856 Y104.741 E2.08479
G1 X165.391 Y104.741 E.01649
G1 X117.395 Y152.737 E2.0923
G1 X117.757 Y152.909 E.01238
G1 X165.925 Y104.741 E2.0998
G1 X166.46 Y104.741 E.01649
G1 X118.128 Y153.074 E2.10698
G1 X118.506 Y153.231 E.01262
G1 X166.995 Y104.741 E2.11383
G1 X167.53 Y104.741 E.01649
G1 X118.884 Y153.388 E2.12068
M73 P43 R24
G1 X119.262 Y153.545 E.01262
G1 X168.065 Y104.741 E2.12752
G1 X168.597 Y104.744 E.01639
G1 X119.654 Y153.687 E2.13358
G1 X120.048 Y153.828 E.01289
G1 X169.029 Y104.847 E2.13525
G1 X169.078 Y104.847 E.0015
G1 X169.153 Y104.922 E.00327
G1 X169.153 Y105.258 E.01036
G1 X120.441 Y153.97 E2.12349
G1 X120.842 Y154.104 E.01303
G1 X169.259 Y105.687 E2.11066
G1 X169.259 Y106.222 E.01649
G1 X121.252 Y154.229 E2.09278
G1 X121.662 Y154.354 E.01322
G1 X169.259 Y106.757 E2.0749
G1 X169.259 Y107.292 E.01649
G1 X122.073 Y154.478 E2.057
G1 X122.501 Y154.585 E.01359
G1 X169.259 Y107.827 E2.03836
G1 X169.259 Y108.362 E.01649
G1 X122.928 Y154.693 E2.01972
G1 X123.356 Y154.8 E.01359
G1 X169.259 Y108.897 E2.00109
G1 X169.259 Y109.432 E.01649
G1 X123.796 Y154.894 E1.98188
G1 X124.242 Y154.983 E.01402
G1 X169.259 Y109.967 E1.96243
G1 X169.259 Y110.502 E.01649
G1 X124.688 Y155.072 E1.94299
G1 X125.144 Y155.152 E.01426
G1 X169.259 Y111.036 E1.92312
G1 X169.259 Y111.571 E.01649
G1 X125.61 Y155.221 E1.90282
G1 X126.076 Y155.29 E.01451
G1 X169.259 Y112.106 E1.88252
G1 X169.259 Y112.641 E.01649
G1 X126.55 Y155.351 E1.86185
G1 X127.036 Y155.399 E.01508
G1 X169.259 Y113.176 E1.84063
M73 P43 R23
G1 X169.259 Y113.711 E.01649
G1 X127.523 Y155.447 E1.8194
G1 X128.02 Y155.486 E.01534
G1 X169.259 Y114.246 E1.79777
G1 X169.259 Y114.781 E.01649
G1 X128.529 Y155.511 E1.77554
G1 X129.039 Y155.536 E.01574
G1 X169.259 Y115.316 E1.75332
G1 X169.259 Y115.851 E.01649
G1 X129.563 Y155.547 E1.73049
G1 X130.098 Y155.547 E.01649
G1 X169.259 Y116.386 E1.70717
G1 X169.259 Y116.921 E.01649
G1 X130.633 Y155.547 E1.68385
G1 X131.191 Y155.525 E.0172
G1 X169.259 Y117.456 E1.65954
G1 X169.259 Y117.991 E.01649
G1 X131.753 Y155.497 E1.63501
G1 X132.323 Y155.462 E.01759
G1 X169.259 Y118.526 E1.61018
G1 X169.259 Y119.061 E.01649
G1 X132.916 Y155.404 E1.5843
G1 X133.51 Y155.345 E.01839
G1 X169.259 Y119.596 E1.55842
G1 X169.259 Y120.131 E.01649
G1 X134.131 Y155.259 E1.53137
G1 X134.759 Y155.166 E.01959
G1 X169.259 Y120.666 E1.50397
G1 X169.259 Y121.201 E.01649
G1 X135.407 Y155.053 E1.47574
G1 X136.075 Y154.92 E.02101
G1 X169.259 Y121.736 E1.44661
G1 X169.259 Y122.271 E.01649
G1 X136.759 Y154.771 E1.41681
G1 X137.473 Y154.592 E.02271
G1 X169.259 Y122.806 E1.38566
G1 X169.259 Y123.341 E.01649
G1 X159.341 Y133.259 E.43238
G1 X159.876 Y133.259 E.01649
G1 X169.259 Y123.876 E.40906
G1 X169.259 Y124.411 E.01649
G1 X160.411 Y133.259 E.38573
G1 X160.946 Y133.259 E.01649
G1 X169.259 Y124.946 E.36241
G1 X169.259 Y125.481 E.01649
G1 X161.481 Y133.259 E.33909
G1 X162.016 Y133.259 E.01649
G1 X169.259 Y126.016 E.31577
G1 X169.259 Y126.551 E.01649
G1 X162.551 Y133.259 E.29245
G1 X163.086 Y133.259 E.01649
G1 X169.259 Y127.086 E.26913
G1 X169.259 Y127.621 E.01649
G1 X163.621 Y133.259 E.24581
G1 X164.156 Y133.259 E.01649
G1 X169.259 Y128.156 E.22249
G1 X169.259 Y128.691 E.01649
G1 X164.691 Y133.259 E.19917
G1 X165.225 Y133.259 E.01649
G1 X169.259 Y129.225 E.17584
G1 X169.259 Y129.76 E.01649
G1 X165.76 Y133.259 E.15252
G1 X166.295 Y133.259 E.01649
G1 X169.259 Y130.295 E.1292
G1 X169.259 Y130.83 E.01649
G1 X166.83 Y133.259 E.10588
G1 X167.365 Y133.259 E.01649
G1 X169.259 Y131.365 E.08256
G1 X169.259 Y131.9 E.01649
G1 X167.9 Y133.259 E.05924
G1 X168.435 Y133.259 E.01649
G1 X169.259 Y132.435 E.03592
G3 X169.153 Y132.723 I-.237 J.076 E.01018
G1 X169.153 Y133.077 E.01091
G1 X168.907 Y133.322 E.01071
G1 X158.484 Y135.493 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X158.965 Y133.938 I-16.334 J-5.904 E.05402
G1 X182.078 Y157.05 E1.08424
G2 X185.408 Y157.028 I1.45 J-33.054 E.11052
G1 X189.023 Y153.413 E.16961
G3 X188.185 Y155.481 I-4.104 J-.458 E.07497
G1 X166.355 Y133.651 E1.02409
G1 X162.729 Y133.651 E.1203
G1 X156.714 Y139.666 E.28214
G1 X156.819 Y139.467 E.00744
G1 X174.402 Y157.05 E.82482
G1 X177.71 Y157.05 E.10975
G1 X189.044 Y145.715 E.53171
G1 X189.044 Y148.664 E.09782
G1 X169.651 Y129.271 E.90976
G1 X169.651 Y126.729 E.08435
G1 X189.044 Y107.336 E.90976
G1 X189.044 Y110.285 E.09782
G1 X177.712 Y98.953 E.53161
G1 X174.4 Y98.952 E.10989
G1 X168.897 Y104.455 E.25814
G2 X168.667 Y104.349 I-.888 J1.617 E.00842
G1 X167.756 Y104.349 E.03019
G1 X162.36 Y98.952 E.25316
G1 X159.048 Y98.952 E.10987
G1 X153.651 Y104.349 E.25316
G1 X153.151 Y104.349 E.01659
G1 X153.151 Y103.22 E.03743
G1 X143.571 Y104.091 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421201
G1 F15000
G1 X147.922 Y99.741 E.18966
G1 X147.387 Y99.741 E.01649
G1 X143.741 Y103.387 E.15894
G1 X143.741 Y102.852 E.01649
G1 X146.852 Y99.741 E.13562
G1 X146.317 Y99.741 E.01649
G1 X143.741 Y102.317 E.1123
G1 X143.741 Y101.782 E.01649
G1 X145.782 Y99.741 E.08898
G1 X145.247 Y99.741 E.01649
G1 X143.741 Y101.247 E.06566
G1 X143.741 Y100.712 E.01649
G1 X144.712 Y99.741 E.04234
G1 X144.411 Y99.741 E.00927
G2 X144.277 Y99.847 I.061 J.215 E.00542
G1 X144.071 Y99.847 E.00637
G1 X143.593 Y100.325 E.02082
G1 X143.349 Y101.341 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.349 Y102.969 E.05401
G1 X139.332 Y98.952 E.18845
G1 X136.02 Y98.952 E.10983
G1 X130.623 Y104.349 E.25319
G1 X129.377 Y104.349 E.04136
G1 X123.979 Y98.951 E.2532
G1 X120.669 Y98.951 E.10981
G1 X116.651 Y102.969 E.18847
G1 X116.651 Y101.341 E.05401
G1 X107.071 Y100.469 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421201
G1 F15000
G1 X107.693 Y99.847 E.02709
G1 X107.777 Y99.847 E.00261
G3 X107.911 Y99.741 I.196 J.109 E.00542
G1 X108.334 Y99.741 E.01303
G1 X107.241 Y100.834 E.04766
G1 X107.241 Y101.369 E.01649
G1 X108.869 Y99.741 E.07098
G1 X109.404 Y99.741 E.01649
G1 X107.241 Y101.904 E.0943
G1 X107.241 Y102.439 E.01649
G1 X109.939 Y99.741 E.11762
G1 X110.474 Y99.741 E.01649
G1 X107.241 Y102.974 E.14094
G1 X107.241 Y103.509 E.01649
G1 X111.009 Y99.741 E.16426
G1 X111.544 Y99.741 E.01649
G1 X107.071 Y104.213 E.19498
G1 X106.849 Y103.22 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X106.849 Y104.349 E.03743
G1 X106.349 Y104.349 E.01659
G1 X100.951 Y98.951 E.25322
G1 X97.641 Y98.951 E.10978
G1 X92.244 Y104.349 E.25322
G1 X91.333 Y104.349 E.03019
G2 X91.115 Y104.455 I.019 J.317 E.00827
G1 X85.599 Y98.951 E.2585
G1 X82.29 Y98.95 E.10976
G1 X70.955 Y110.285 E.53174
G1 X70.955 Y107.335 E.09786
G1 X90.349 Y126.729 E.90978
G1 X90.349 Y129.271 E.08435
G1 X70.951 Y148.669 E.90999
G1 X70.951 Y145.711 E.09814
G1 X82.29 Y157.05 E.53193
G1 X85.598 Y157.05 E.10975
G1 X103.181 Y139.467 E.82482
G1 X103.286 Y139.666 E.00744
G1 X97.271 Y133.651 E.28214
G1 X93.645 Y133.651 E.1203
G1 X71.815 Y155.481 E1.02409
G3 X70.972 Y153.408 I3.32 J-2.557 E.07516
G1 X74.591 Y157.027 E.16979
G2 X77.922 Y157.05 I1.873 J-30.516 E.11056
G1 X101.035 Y133.938 E1.08424
G2 X101.418 Y135.217 I26.184 J-7.149 E.0443
G1 X101.516 Y135.493 E.00972
G1 X107.168 Y145.445 F30000
G1 F15476.087
G3 X106.145 Y144.179 I12.615 J-11.237 E.05403
G1 X93.274 Y157.05 E.6038
G1 X89.966 Y157.05 E.10975
G1 X70.952 Y138.036 E.89199
G1 X70.952 Y140.993 E.09808
G1 X90.349 Y121.596 E.90995
G1 X90.349 Y119.053 E.08435
G1 X71.809 Y100.513 E.86972
G2 X70.984 Y102.581 I3.295 J2.515 E.07477
G1 X74.592 Y98.972 E.16929
G3 X77.923 Y98.95 I1.88 J33.019 E.11052
G1 X90.349 Y111.377 E.58294
G1 X90.349 Y113.92 E.08435
G1 X70.952 Y133.316 E.90991
G1 X70.953 Y130.361 E.09803
G1 X97.642 Y157.05 E1.25204
G1 X100.95 Y157.05 E.10975
G1 X109.831 Y148.169 E.41661
G2 X111.067 Y149.229 I11.462 J-12.114 E.05402
G1 X120.894 Y154.529 F30000
G1 F15476.087
G3 X119.355 Y153.997 I4.701 J-16.056 E.05402
G1 X116.302 Y157.05 E.14323
G1 X112.994 Y157.05 E.10975
G1 X70.954 Y115.01 E1.97215
G1 X70.954 Y117.962 E.09792
G1 X89.966 Y98.951 E.89187
G1 X93.275 Y98.951 E.10977
G1 X98.673 Y104.349 E.25323
G1 X99.92 Y104.349 E.04136
G1 X105.317 Y98.951 E.25322
G1 X108.627 Y98.951 E.10979
G1 X109.025 Y99.349 E.01865
G1 X112.596 Y99.349 E.11845
G1 X112.993 Y98.951 E.01865
G1 X116.303 Y98.951 E.1098
G1 X121.701 Y104.349 E.25321
G1 X122.947 Y104.349 E.04136
G1 X128.345 Y98.951 E.25319
G1 X131.655 Y98.952 E.10982
G1 X137.053 Y104.349 E.25319
G1 X138.299 Y104.349 E.04136
G1 X143.696 Y98.952 E.25318
G1 X147.008 Y98.952 E.10984
G1 X147.404 Y99.349 E.01862
G1 X150.975 Y99.349 E.11845
G1 X151.372 Y98.952 E.01861
G1 X154.684 Y98.952 E.10986
G1 X160.08 Y104.349 E.25317
G1 X161.327 Y104.349 E.04136
G1 X166.724 Y98.952 E.25316
G1 X170.036 Y98.952 E.10988
G1 X189.044 Y117.96 E.89171
G1 X189.044 Y115.012 E.09782
G1 X147.006 Y157.05 E1.97209
G1 X143.698 Y157.05 E.10975
G1 X140.645 Y153.997 E.14323
G3 X139.106 Y154.529 I-6.239 J-15.524 E.05402
G1 X137.954 Y154.646 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421201
G1 F15000
G1 X158.511 Y134.089 E.89614
G1 X158.282 Y134.853 E.02457
G1 X138.976 Y154.159 E.84164
G1 X139.779 Y153.89 E.02613
G1 X158.009 Y135.661 E.79469
G1 X157.714 Y136.491 E.02716
G1 X140.614 Y153.591 E.74544
G1 X141.52 Y153.22 E.03018
G1 X157.342 Y137.398 E.68972
G1 X157.169 Y137.819 E.01401
G1 X156.915 Y138.359 E.01841
G1 X142.478 Y152.797 E.62939
G1 X143.511 Y152.299 E.03538
G1 X156.413 Y139.397 E.56243
G1 X155.791 Y140.554 E.04048
G1 X144.665 Y151.68 E.48503
G2 X145.918 Y150.926 I-14.815 J-26.049 E.04508
G1 X146.026 Y150.853 E.00401
G1 X154.965 Y141.915 E.38966
G1 X154.31 Y142.901 E.03648
G1 X153.738 Y143.677 E.02974
G1 X147.03 Y150.385 E.2924
G1 X148.933 Y149.229 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P44 R23
G1 F15476.087
G2 X150.169 Y148.169 I-10.228 J-13.175 E.05402
G1 X159.05 Y157.05 E.41661
G1 X162.358 Y157.05 E.10975
G1 X189.044 Y130.364 E1.2519
G1 X189.044 Y133.312 E.09782
G1 X169.651 Y113.92 E.90976
G1 X169.651 Y111.377 E.08435
G1 X182.075 Y98.953 E.58283
G3 X185.408 Y98.972 I1.501 J28.258 E.11061
G1 X189.023 Y102.587 E.16961
G2 X188.191 Y100.513 I-4.784 J.715 E.07482
G1 X169.651 Y119.053 E.86972
G1 X169.651 Y121.596 E.08435
G1 X189.044 Y140.988 E.90976
G1 X189.044 Y138.04 E.09782
G1 X170.034 Y157.05 E.8918
G1 X166.726 Y157.05 E.10975
G1 X153.855 Y144.179 E.6038
G1 X153.756 Y144.313 E.00553
G3 X152.832 Y145.445 I-23.531 J-18.261 E.04849
G1 X169.651 Y107.872 F30000
G1 F15476.087
G1 X169.651 Y106.244 E.05401
G1 X189.044 Y125.636 E.90976
G1 X189.044 Y122.688 E.09782
G1 X154.682 Y157.05 E1.612
G1 X151.374 Y157.05 E.10975
G1 X145.787 Y151.463 E.2621
G3 X143.781 Y152.599 I-12.597 J-19.9 E.07649
G1 X139.33 Y157.05 E.2088
G1 X136.022 Y157.05 E.10975
G1 X134.564 Y155.591 E.06841
G3 X132.905 Y155.799 I-2.951 J-16.861 E.05547
G1 X131.654 Y157.05 E.05868
G1 X128.346 Y157.05 E.10975
G1 X127.095 Y155.799 E.05868
G3 X125.436 Y155.591 I1.293 J-17.069 E.05547
G1 X123.978 Y157.05 E.06841
G1 X120.67 Y157.05 E.10975
G1 X116.219 Y152.599 E.2088
G3 X114.213 Y151.463 I10.591 J-21.036 E.07649
G1 X108.626 Y157.05 E.2621
G1 X105.318 Y157.05 E.10975
G1 X70.954 Y122.685 E1.6121
G1 X70.953 Y125.639 E.09797
G1 X90.349 Y106.244 E.90988
G1 X90.349 Y107.872 E.05401
M106 S168.3
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X90.349 Y106.244 E-.61876
G1 X90.086 Y106.506 E-.14124
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
G3 Z3.2 I1.076 J.568 P1  F30000
G1 X90.922 Y104.922 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X107.422 Y104.922 E.54734
G1 X107.422 Y99.922 E.16586
G1 X116.078 Y99.922 E.28712
G1 X116.078 Y104.922 E.16586
G1 X143.922 Y104.922 E.92365
G1 X143.922 Y99.922 E.16586
G1 X152.578 Y99.922 E.28712
G1 X152.578 Y104.922 E.16586
G1 X169.078 Y104.922 E.54734
G1 X169.078 Y133.078 E.93397
G1 X158.594 Y133.078 E.34775
G3 X132.176 Y155.295 I-28.615 J-7.211 E1.22306
G1 X132.094 Y155.299 E.00274
G3 X101.545 Y133.642 I-2.074 J-29.448 E1.34555
G1 X101.406 Y133.078 E.01927
G1 X90.922 Y133.078 E.34775
G1 X90.922 Y104.982 E.93198
; WIPE_START
G1 F24000
G1 X92.922 Y104.975 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.131 J-1.21 P1  F30000
G1 X70.624 Y102.569 Z3.4
G1 Z3
G1 E.8 F1800
G1 F15476.087
G3 X75.007 Y98.602 I4.389 J.444 E.2149
G1 X185.094 Y98.605 E3.65178
G3 X189.398 Y103.007 I-.105 J4.408 E.22608
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.402 J.004 E.2296
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I-.005 J-4.4 E.22962
G1 X70.602 Y103.007 E1.6581
G3 X70.619 Y102.629 I4.411 J.006 E.01258
G1 X70.243 Y102.548 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.263 Y102.297 E.00772
G3 X70.447 Y101.518 I4.794 J.716 E.02463
G1 X70.447 Y101.518 E0
G3 X73.478 Y98.46 I4.583 J1.511 E.13715
G1 X73.478 Y98.46 E0
G3 X75.003 Y98.21 I1.536 J4.595 E.04768
G1 X185.099 Y98.212 E3.38296
G3 X189.79 Y103.003 I-.111 J4.801 E.22803
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.804 J-.012 E.23117
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I0 J-4.792 E.23132
G1 X70.21 Y103.003 E1.5362
G1 X70.239 Y102.608 E.01217
M204 S10000
; WIPE_START
G1 F24000
G1 X70.263 Y102.297 E-.11826
G1 X70.354 Y101.836 E-.1786
G1 X70.447 Y101.518 E-.12598
G1 X70.447 Y101.518 E0
G1 X70.67 Y100.952 E-.23117
G1 X70.801 Y100.706 E-.10599
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.403 J1.148 P1  F30000
G1 X90.574 Y107.647 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X90.574 Y106.018 E.05401
G1 X70.953 Y125.639 E.92044
G1 X70.954 Y122.685 E.09797
G1 X105.318 Y157.05 E1.6121
G1 X108.626 Y157.05 E.10975
G1 X114.377 Y151.299 E.2698
G2 X115.668 Y152.047 I8.246 J-12.719 E.04951
G1 X120.67 Y157.05 E.23466
G1 X123.978 Y157.05 E.10975
G1 X125.635 Y155.393 E.07771
G2 X126.844 Y155.548 I2.173 J-12.196 E.04045
G1 X128.346 Y157.05 E.07046
G1 X131.654 Y157.05 E.10975
G1 X133.156 Y155.548 E.07046
G2 X134.365 Y155.393 I-.964 J-12.35 E.04045
G1 X136.022 Y157.05 E.07771
G1 X139.33 Y157.05 E.10975
G1 X144.332 Y152.047 E.23466
G2 X145.623 Y151.299 I-6.956 J-13.469 E.04951
G1 X151.374 Y157.05 E.2698
G1 X154.682 Y157.05 E.10975
G1 X189.044 Y122.688 E1.612
G1 X189.044 Y125.636 E.09782
G1 X169.426 Y106.018 E.92033
G1 X169.426 Y107.647 E.05401
; WIPE_START
G1 F24000
G1 X169.426 Y106.018 E-.61876
G1 X169.689 Y106.281 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.203 J-1.2 P1  F30000
G1 X152.926 Y103.446 Z3.4
G1 Z3
G1 E.8 F1800
G1 F15476.087
G1 X152.926 Y104.574 E.03743
G1 X153.426 Y104.574 E.01659
G1 X159.048 Y98.952 E.26373
G1 X162.36 Y98.952 E.10987
G1 X167.982 Y104.574 E.26372
G1 X168.778 Y104.574 E.02641
G1 X174.399 Y98.953 E.26371
G1 X177.712 Y98.953 E.1099
G1 X189.044 Y110.285 E.5316
G1 X189.044 Y107.336 E.09782
G1 X169.426 Y126.954 E.92033
G1 X169.426 Y129.046 E.06941
G1 X189.044 Y148.664 E.92033
G1 X189.044 Y145.715 E.09782
G1 X177.71 Y157.05 E.53171
G1 X174.402 Y157.05 E.10975
G1 X156.653 Y139.301 E.83263
G1 X158.309 Y135.314 F30000
G1 F15476.087
G2 X158.785 Y133.757 I-15.563 J-5.605 E.05403
G1 X182.078 Y157.05 E1.09273
G2 X185.408 Y157.028 I1.45 J-33.058 E.11051
G1 X189.023 Y153.413 E.16961
G3 X188.185 Y155.481 I-4.104 J-.458 E.07497
G1 X166.13 Y133.426 E1.03466
G1 X162.954 Y133.426 E.10536
G1 X156.171 Y140.209 E.31819
G3 X153.694 Y144.018 I-40.732 J-23.782 E.15078
G1 X166.726 Y157.05 E.61136
G1 X170.034 Y157.05 E.10975
G1 X189.044 Y138.04 E.89181
G1 X189.044 Y140.988 E.09782
G1 X169.426 Y121.37 E.92033
G1 X169.426 Y119.278 E.06941
G1 X188.191 Y100.513 E.88029
G3 X189.023 Y102.587 I-3.951 J2.79 E.07482
G1 X185.396 Y98.97 E.16993
G2 X182.075 Y98.953 I-1.817 J29.656 E.11021
G1 X169.426 Y111.602 E.5934
G1 X169.426 Y113.694 E.06941
G1 X189.044 Y133.312 E.92033
G1 X189.044 Y130.364 E.09782
G1 X162.358 Y157.05 E1.2519
G1 X159.05 Y157.05 E.10975
G1 X150.009 Y148.009 E.42409
G3 X148.773 Y149.069 I-11.368 J-12.017 E.05402
G1 X138.928 Y154.348 F30000
G1 F15476.087
G2 X140.468 Y153.82 I-4.585 J-15.893 E.05402
G1 X143.698 Y157.05 E.15149
G1 X147.006 Y157.05 E.10975
G1 X189.044 Y115.012 E1.97209
G1 X189.044 Y117.96 E.09782
G1 X170.036 Y98.952 E.8917
G1 X166.724 Y98.952 E.10989
G1 X161.102 Y104.574 E.26372
G1 X160.306 Y104.574 E.02641
G1 X154.684 Y98.952 E.26373
G1 X151.372 Y98.952 E.10986
G1 X150.75 Y99.574 E.02917
G1 X147.63 Y99.574 E.10351
G1 X147.008 Y98.952 E.02918
G1 X143.696 Y98.952 E.10985
G1 X138.074 Y104.574 E.26374
G1 X137.278 Y104.574 E.02641
G1 X131.655 Y98.952 E.26376
G1 X128.345 Y98.952 E.10983
G1 X122.722 Y104.574 E.26376
G1 X121.926 Y104.574 E.02641
G1 X116.303 Y98.951 E.26377
G1 X112.993 Y98.951 E.10981
G1 X112.37 Y99.574 E.02921
G1 X109.25 Y99.574 E.10351
G1 X108.627 Y98.951 E.02922
G1 X105.317 Y98.951 E.10979
G1 X99.694 Y104.574 E.26378
G1 X98.898 Y104.574 E.02641
G1 X93.275 Y98.951 E.2638
G1 X89.966 Y98.951 E.10977
G1 X70.954 Y117.962 E.89187
G1 X70.954 Y115.01 E.09792
G1 X112.994 Y157.05 E1.97215
G1 X116.302 Y157.05 E.10975
G1 X119.532 Y153.82 E.15149
G2 X121.072 Y154.348 I6.125 J-15.365 E.05402
G1 X111.227 Y149.069 F30000
G1 F15476.087
G3 X109.991 Y148.009 I10.131 J-13.075 E.05402
G1 X100.95 Y157.05 E.42409
G1 X97.642 Y157.05 E.10975
G1 X70.953 Y130.361 E1.25204
G1 X70.952 Y133.316 E.09803
G1 X90.574 Y113.694 E.92048
G1 X90.574 Y111.602 E.06941
G1 X77.923 Y98.95 E.59351
G2 X74.592 Y98.972 I-1.451 J33.037 E.11052
G1 X70.984 Y102.581 E.1693
G3 X71.809 Y100.513 I4.121 J.447 E.07477
G1 X90.574 Y119.278 E.88029
G1 X90.574 Y121.37 E.06941
G1 X70.952 Y140.993 E.92052
G1 X70.952 Y138.036 E.09809
G1 X89.966 Y157.05 E.89199
G1 X93.274 Y157.05 E.10975
G1 X106.306 Y144.018 E.61136
G3 X103.829 Y140.209 I38.256 J-27.592 E.15078
G1 X97.046 Y133.426 E.31819
G1 X93.87 Y133.426 E.10536
G1 X71.815 Y155.481 E1.03466
G3 X70.972 Y153.408 I3.32 J-2.557 E.07516
G1 X74.591 Y157.027 E.16979
G2 X77.922 Y157.05 I1.873 J-30.517 E.11055
G1 X101.215 Y133.757 E1.09273
G2 X101.691 Y135.314 I16.04 J-4.048 E.05403
G1 X103.347 Y139.301 F30000
G1 F15476.087
G1 X85.598 Y157.05 E.83263
G1 X82.29 Y157.05 E.10975
G1 X70.951 Y145.711 E.53193
G1 X70.951 Y148.669 E.09814
G1 X90.574 Y129.046 E.92056
G1 X90.574 Y126.954 E.06941
G1 X70.955 Y107.335 E.92035
G1 X70.955 Y110.285 E.09786
G1 X82.29 Y98.95 E.53174
G1 X85.599 Y98.951 E.10976
G1 X91.222 Y104.574 E.2638
G1 X92.018 Y104.574 E.02641
G1 X97.641 Y98.951 E.26379
G1 X100.951 Y98.951 E.10978
G1 X106.574 Y104.574 E.26379
G1 X107.074 Y104.574 E.01659
G1 X107.074 Y103.446 E.03743
; WIPE_START
G1 F24000
G1 X107.074 Y104.574 E-.42876
G1 X106.574 Y104.574 E-.19
G1 X106.311 Y104.311 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.319 J1.174 P1  F30000
G1 X116.426 Y101.566 Z3.4
G1 Z3
G1 E.8 F1800
G1 F15476.087
G1 X116.426 Y103.194 E.05401
G1 X120.669 Y98.951 E.19904
G1 X123.979 Y98.951 E.10982
G1 X129.602 Y104.574 E.26376
G1 X130.398 Y104.574 E.02641
G1 X136.02 Y98.952 E.26375
G1 X139.332 Y98.952 E.10984
G1 X143.574 Y103.194 E.19902
G1 X143.574 Y101.566 E.05401
; WIPE_START
G1 F24000
G1 X143.574 Y103.194 E-.61876
G1 X143.311 Y102.931 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.251 J1.191 P1  F30000
G1 X152.355 Y101.028 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X151.472 Y100.145 E.03839
G1 X150.939 Y100.145
G1 X152.355 Y101.561 E.06156
G1 X152.355 Y102.094
G1 X150.406 Y100.145 E.08473
G1 X149.872 Y100.145
G1 X152.355 Y102.628 E.1079
G1 X152.355 Y103.161
G1 X149.339 Y100.145 E.13108
G1 X148.806 Y100.145
G1 X152.355 Y103.694 E.15425
G1 X152.355 Y104.228
G1 X148.272 Y100.145 E.17742
G1 X147.739 Y100.145
G1 X152.355 Y104.761 E.2006
M204 S10000
G1 X168.855 Y105.796 F30000
M204 S2000
G1 F12000
G1 X168.204 Y105.145 E.02831
G1 X167.671 Y105.145
G1 X168.855 Y106.329 E.05148
G1 X168.855 Y106.863
G1 X167.137 Y105.145 E.07465
G1 X166.604 Y105.145
G1 X168.855 Y107.396 E.09783
G1 X168.855 Y107.929
G1 X166.071 Y105.145 E.121
G1 X165.538 Y105.145
G1 X168.855 Y108.462 E.14417
G1 X168.855 Y108.996
G1 X165.004 Y105.145 E.16735
G1 X164.471 Y105.145
G1 X168.855 Y109.529 E.19052
G1 X168.855 Y110.062
G1 X163.938 Y105.145 E.21369
G1 X163.405 Y105.145
G1 X168.855 Y110.595 E.23686
G1 X168.855 Y111.129
G1 X162.871 Y105.145 E.26004
G1 X162.338 Y105.145
G1 X168.855 Y111.662 E.28321
G1 X168.855 Y112.195
G1 X161.805 Y105.145 E.30638
G1 X161.271 Y105.145
G1 X168.855 Y112.729 E.32956
G1 X168.855 Y113.262
G1 X160.738 Y105.145 E.35273
G1 X160.205 Y105.145
G1 X168.855 Y113.795 E.3759
G1 X168.855 Y114.328
G1 X159.672 Y105.145 E.39908
G1 X159.138 Y105.145
G1 X168.855 Y114.862 E.42225
G1 X168.855 Y115.395
G1 X158.605 Y105.145 E.44542
G1 X158.072 Y105.145
G1 X168.855 Y115.928 E.4686
G1 X168.855 Y116.461
G1 X157.539 Y105.145 E.49177
G1 X157.005 Y105.145
G1 X168.855 Y116.995 E.51494
G1 X168.855 Y117.528
G1 X156.472 Y105.145 E.53812
G1 X155.939 Y105.145
G1 X168.855 Y118.061 E.56129
G1 X168.855 Y118.594
G1 X155.406 Y105.145 E.58446
G1 X154.872 Y105.145
G1 X168.855 Y119.128 E.60764
G1 X168.855 Y119.661
G1 X154.339 Y105.145 E.63081
G1 X153.806 Y105.145
G1 X168.855 Y120.194 E.65398
G1 X168.855 Y120.728
G1 X153.272 Y105.145 E.67716
G1 X152.739 Y105.145
G1 X168.855 Y121.261 E.70033
G1 X168.855 Y121.794
G1 X147.206 Y100.145 E.94078
G1 X146.673 Y100.145
G1 X168.855 Y122.327 E.96395
G1 X168.855 Y122.861
G1 X146.139 Y100.145 E.98712
G1 X145.606 Y100.145
G1 X168.855 Y123.394 E1.0103
G1 X168.855 Y123.927
G1 X145.073 Y100.145 E1.03347
G1 X144.54 Y100.145
G1 X168.855 Y124.46 E1.05664
G1 X168.855 Y124.994
G1 X144.237 Y100.375 E1.06979
G1 X144.145 Y100.816
G1 X168.855 Y125.527 E1.0738
G1 X168.855 Y126.06
G1 X144.145 Y101.35 E1.0738
G1 X144.145 Y101.883
G1 X168.855 Y126.594 E1.0738
G1 X168.855 Y127.127
G1 X144.145 Y102.416 E1.0738
G1 X144.145 Y102.949
G1 X168.855 Y127.66 E1.0738
G1 X168.855 Y128.193
G1 X144.145 Y103.483 E1.0738
G1 X144.145 Y104.016
G1 X168.855 Y128.727 E1.0738
G1 X168.855 Y129.26
G1 X144.145 Y104.549 E1.0738
G1 X144.145 Y105.082
G1 X168.855 Y129.793 E1.0738
G1 X168.855 Y130.326
G1 X143.674 Y105.145 E1.09427
G1 X143.14 Y105.145
G1 X168.855 Y130.86 E1.11745
G1 X168.855 Y131.393
G1 X142.607 Y105.145 E1.14062
G1 X142.074 Y105.145
G1 X168.855 Y131.926 E1.16379
G1 X168.855 Y132.46
G1 X141.54 Y105.145 E1.18696
G1 X141.007 Y105.145
G1 X168.625 Y132.762 E1.20013
M73 P45 R23
G1 X168.185 Y132.855
G1 X140.474 Y105.145 E1.20417
G1 X139.941 Y105.145
G1 X167.651 Y132.855 E1.20417
G1 X167.118 Y132.855
G1 X139.407 Y105.145 E1.20417
G1 X138.874 Y105.145
G1 X166.585 Y132.855 E1.20417
G1 X166.052 Y132.855
G1 X138.341 Y105.145 E1.20417
G1 X137.808 Y105.145
G1 X165.518 Y132.855 E1.20417
G1 X164.985 Y132.855
G1 X137.274 Y105.145 E1.20417
G1 X136.741 Y105.145
G1 X164.452 Y132.855 E1.20417
G1 X163.919 Y132.855
G1 X136.208 Y105.145 E1.20417
G1 X135.675 Y105.145
G1 X163.385 Y132.855 E1.20417
G1 X162.852 Y132.855
G1 X135.141 Y105.145 E1.20417
G1 X134.608 Y105.145
G1 X162.319 Y132.855 E1.20417
G1 X161.785 Y132.855
G1 X134.075 Y105.145 E1.20417
G1 X133.541 Y105.145
G1 X161.252 Y132.855 E1.20417
G1 X160.719 Y132.855
G1 X133.008 Y105.145 E1.20417
G1 X132.475 Y105.145
G1 X160.186 Y132.855 E1.20417
G1 X159.652 Y132.855
G1 X131.942 Y105.145 E1.20417
G1 X131.408 Y105.145
G1 X159.119 Y132.855 E1.20417
G1 X158.586 Y132.855
G1 X130.875 Y105.145 E1.20417
G1 X130.342 Y105.145
G1 X158.347 Y133.15 E1.21698
G1 X158.242 Y133.578
G1 X129.809 Y105.145 E1.23557
G1 X129.275 Y105.145
G1 X158.119 Y133.989 E1.25341
G1 X157.996 Y134.399
G1 X128.742 Y105.145 E1.27125
G1 X128.209 Y105.145
G1 X157.874 Y134.809 E1.28908
G1 X157.74 Y135.21
G1 X127.675 Y105.145 E1.30647
G1 X127.142 Y105.145
G1 X157.601 Y135.603 E1.32358
G1 X157.462 Y135.997
G1 X126.609 Y105.145 E1.3407
G1 X126.076 Y105.145
G1 X157.319 Y136.388 E1.35769
G1 X157.164 Y136.767
G1 X125.542 Y105.145 E1.37413
G1 X125.009 Y105.145
G1 X157.009 Y137.145 E1.39056
G1 X156.854 Y137.523
G1 X124.476 Y105.145 E1.40699
G1 X123.943 Y105.145
G1 X156.689 Y137.891 E1.42299
G1 X156.519 Y138.254
G1 X123.409 Y105.145 E1.43877
G1 X122.876 Y105.145
G1 X156.348 Y138.617 E1.45454
G1 X156.177 Y138.979
G1 X122.343 Y105.145 E1.47028
G1 X121.809 Y105.145
G1 X155.993 Y139.328 E1.48542
G1 X155.808 Y139.676
G1 X121.276 Y105.145 E1.50056
G1 X120.743 Y105.145
G1 X155.623 Y140.024 E1.5157
G1 X155.432 Y140.367
G1 X120.21 Y105.145 E1.53059
G1 X119.676 Y105.145
G1 X155.233 Y140.701 E1.54512
G1 X155.034 Y141.036
G1 X119.143 Y105.145 E1.55964
G1 X118.61 Y105.145
G1 X154.835 Y141.37 E1.57417
G1 X154.626 Y141.695
G1 X118.077 Y105.145 E1.58827
G1 X117.543 Y105.145
G1 X154.414 Y142.015 E1.60219
G1 X154.201 Y142.335
G1 X117.01 Y105.145 E1.61612
G1 X116.477 Y105.145
G1 X153.988 Y142.656 E1.63004
G1 X153.762 Y142.963
G1 X115.944 Y105.145 E1.64341
M204 S10000
G1 X115.855 Y100.79 F30000
M204 S2000
G1 F12000
G1 X115.21 Y100.145 E.02806
G1 X114.676 Y100.145
G1 X115.855 Y101.324 E.05123
G1 X115.855 Y101.857
G1 X114.143 Y100.145 E.07441
G1 X113.61 Y100.145
G1 X115.855 Y102.39 E.09758
G1 X115.855 Y102.923
M73 P45 R22
G1 X113.077 Y100.145 E.12075
G1 X112.543 Y100.145
G1 X115.855 Y103.457 E.14393
G1 X115.855 Y103.99
G1 X112.01 Y100.145 E.1671
G1 X111.477 Y100.145
G1 X115.855 Y104.523 E.19027
G1 X115.855 Y105.056
G1 X110.944 Y100.145 E.21344
G1 X110.41 Y100.145
G1 X153.536 Y143.27 E1.87402
G1 X153.31 Y143.577
G1 X109.877 Y100.145 E1.88736
G1 X109.344 Y100.145
G1 X153.081 Y143.882 E1.90059
G1 X152.841 Y144.175
G1 X108.81 Y100.145 E1.91335
G1 X108.277 Y100.145
G1 X152.601 Y144.469 E1.9261
G1 X152.362 Y144.762
G1 X107.856 Y100.257 E1.93399
G1 X107.645 Y100.579
G1 X152.117 Y145.051 E1.93254
G1 X151.864 Y145.331
G1 X107.645 Y101.112 E1.92155
G1 X107.645 Y101.645
G1 X151.611 Y145.612 E1.91056
G1 X151.358 Y145.892
G1 X107.645 Y102.178 E1.89957
G1 X107.645 Y102.712
G1 X151.098 Y146.165 E1.88826
G1 X150.832 Y146.432
G1 X107.645 Y103.245 E1.8767
G1 X107.645 Y103.778
G1 X150.566 Y146.7 E1.86514
G1 X150.3 Y146.967
G1 X107.645 Y104.312 E1.85358
G1 X107.645 Y104.845
G1 X150.024 Y147.224 E1.8416
G1 X149.745 Y147.479
G1 X107.411 Y105.145 E1.83961
G1 X106.878 Y105.145
G1 X149.466 Y147.733 E1.85065
G1 X149.187 Y147.987
G1 X106.345 Y105.145 E1.8617
G1 X105.811 Y105.145
G1 X148.895 Y148.229 E1.87221
G1 X148.603 Y148.47
G1 X105.278 Y105.145 E1.88268
G1 X104.745 Y105.145
G1 X148.311 Y148.71 E1.89315
G1 X148.017 Y148.95
G1 X104.212 Y105.145 E1.90355
G1 X103.678 Y105.145
G1 X147.711 Y149.177 E1.91343
G1 X147.405 Y149.405
G1 X103.145 Y105.145 E1.92332
G1 X102.612 Y105.145
G1 X147.1 Y149.632 E1.93321
G1 X146.789 Y149.856
G1 X102.078 Y105.145 E1.9429
G1 X101.545 Y105.145
G1 X146.47 Y150.07 E1.95221
G1 X146.151 Y150.284
G1 X101.012 Y105.145 E1.96151
G1 X100.479 Y105.145
G1 X145.832 Y150.498 E1.97081
G1 X145.504 Y150.704
G1 X99.945 Y105.145 E1.97976
M73 P46 R22
G1 X99.412 Y105.145
G1 X145.171 Y150.904 E1.98846
G1 X144.838 Y151.104
G1 X98.879 Y105.145 E1.99717
G1 X98.346 Y105.145
G1 X144.505 Y151.304 E2.00587
G1 X144.16 Y151.492
G1 X97.812 Y105.145 E2.01403
G1 X97.279 Y105.145
G1 X143.813 Y151.679 E2.02212
G1 X143.466 Y151.865
G1 X96.746 Y105.145 E2.03021
G1 X96.213 Y105.145
G1 X143.115 Y152.048 E2.03816
G1 X142.754 Y152.219
G1 X95.679 Y105.145 E2.04562
G1 X95.146 Y105.145
G1 X142.392 Y152.391 E2.05308
G1 X142.03 Y152.562
G1 X94.613 Y105.145 E2.06053
G1 X94.079 Y105.145
G1 X141.659 Y152.725 E2.06758
G1 X141.283 Y152.881
G1 X93.546 Y105.145 E2.07438
G1 X93.013 Y105.145
G1 X140.906 Y153.038 E2.08119
G1 X140.528 Y153.193
G1 X92.48 Y105.145 E2.08793
G1 X91.946 Y105.145
G1 X140.135 Y153.334 E2.09405
G1 X139.743 Y153.475
G1 X91.44 Y105.172 E2.09898
G1 X91.174 Y105.439
G1 X139.351 Y153.615 E2.09351
G1 X138.948 Y153.746
G1 X91.145 Y105.943 E2.07727
G1 X91.145 Y106.476
G1 X138.539 Y153.87 E2.05951
G1 X138.13 Y153.995
G1 X91.145 Y107.009 E2.04174
G1 X91.145 Y107.543
G1 X137.716 Y154.114 E2.02377
G1 X137.29 Y154.221
G1 X91.145 Y108.076 E2.00525
G1 X91.145 Y108.609
G1 X136.864 Y154.329 E1.98673
G1 X136.438 Y154.436
G1 X91.145 Y109.142 E1.96821
G1 X91.145 Y109.676
G1 X135.994 Y154.525 E1.9489
G1 X135.549 Y154.613
G1 X91.145 Y110.209 E1.92959
G1 X91.145 Y110.742
G1 X135.104 Y154.702 E1.91027
G1 X134.644 Y154.775
G1 X91.145 Y111.275 E1.89026
G1 X91.145 Y111.809
G1 X134.18 Y154.844 E1.87009
G1 X133.716 Y154.913
G1 X91.145 Y112.342 E1.84991
G1 X91.145 Y112.875
G1 X133.236 Y154.966 E1.82907
G1 X132.75 Y155.014
G1 X91.145 Y113.408 E1.80798
G1 X91.145 Y113.942
G1 X132.265 Y155.062 E1.78689
G1 X131.762 Y155.092
G1 X91.145 Y114.475 E1.76502
G1 X91.145 Y115.008
G1 X131.254 Y155.117 E1.74293
G1 X130.745 Y155.142
G1 X91.145 Y115.542 E1.72085
G1 X91.145 Y116.075
G1 X130.213 Y155.144 E1.69773
G1 X129.68 Y155.144
G1 X91.145 Y116.608 E1.67455
G1 X91.145 Y117.141
G1 X129.14 Y155.137 E1.65108
G1 X128.579 Y155.109
G1 X91.145 Y117.675 E1.62671
G1 X91.145 Y118.208
G1 X128.018 Y155.081 E1.60233
G1 X127.436 Y155.033
G1 X91.145 Y118.741 E1.57705
G1 X91.145 Y119.274
G1 X126.845 Y154.974 E1.55133
G1 X126.244 Y154.907
G1 X91.145 Y119.808 E1.52523
G1 X91.145 Y120.341
G1 X125.617 Y154.814 E1.498
G1 X124.991 Y154.72
G1 X91.145 Y120.874 E1.47078
G1 X91.145 Y121.408
G1 X124.325 Y154.588 E1.44186
G1 X123.659 Y154.455
G1 X91.145 Y121.941 E1.41291
G1 X91.145 Y122.474
G1 X101.526 Y132.855 E.45112
G1 X100.993 Y132.855
G1 X91.145 Y123.007 E.42794
G1 X91.145 Y123.541
G1 X100.459 Y132.855 E.40477
G1 X99.926 Y132.855
G1 X91.145 Y124.074 E.3816
G1 X91.145 Y124.607
G1 X99.393 Y132.855 E.35843
G1 X98.86 Y132.855
G1 X91.145 Y125.14 E.33525
G1 X91.145 Y125.674
G1 X98.326 Y132.855 E.31208
G1 X97.793 Y132.855
G1 X91.145 Y126.207 E.28891
G1 X91.145 Y126.74
G1 X97.26 Y132.855 E.26573
G1 X96.726 Y132.855
G1 X91.145 Y127.274 E.24256
G1 X91.145 Y127.807
G1 X96.193 Y132.855 E.21939
M73 P47 R22
G1 X95.66 Y132.855
G1 X91.145 Y128.34 E.19621
G1 X91.145 Y128.873
G1 X95.127 Y132.855 E.17304
G1 X94.593 Y132.855
G1 X91.145 Y129.407 E.14987
G1 X91.145 Y129.94
G1 X94.06 Y132.855 E.12669
G1 X93.527 Y132.855
G1 X91.145 Y130.473 E.10352
G1 X91.145 Y131.006
G1 X92.994 Y132.855 E.08035
G1 X92.46 Y132.855
G1 X91.145 Y131.54 E.05717
G1 X91.145 Y132.073
G1 X91.927 Y132.855 E.034
M204 S10000
G1 X101.598 Y132.927 F30000
M204 S2000
G1 F12000
G1 X122.953 Y154.283 E.92801
G1 X122.241 Y154.104
G1 X101.776 Y133.639 E.88931
G1 X102.004 Y134.4
G1 X121.48 Y153.876 E.84633
G1 X120.707 Y153.636
G1 X102.248 Y135.178 E.8021
G1 X102.54 Y136.003
G1 X119.875 Y153.337 E.75326
G1 X119.005 Y153.001
G1 X102.881 Y136.877 E.70066
G1 X103.266 Y137.795
G1 X118.091 Y152.62 E.64422
G1 X117.076 Y152.139
G1 X103.737 Y138.799 E.57965
G1 X104.319 Y139.914
G1 X115.962 Y151.558 E.50597
M204 S10000
G1 X114.694 Y150.823 F30000
M204 S2000
G1 F12000
G1 X105.053 Y141.182 E.41897
M204 S10000
G1 X106.059 Y142.722 F30000
M204 S2000
G1 F12000
G1 X113.158 Y149.82 E.30848
M204 S10000
; WIPE_START
G1 F24000
G1 X111.744 Y148.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.327 J1.172 P1  F30000
G1 X168.874 Y132.49 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.113128
G1 F15000
G1 X168.747 Y132.618 E.00103
G1 X168.874 Y105.504 F30000
; LINE_WIDTH: 0.105267
G1 F15000
G1 X168.496 Y105.126 E.00272
G1 X152.374 Y100.62 F30000
; LINE_WIDTH: 0.269278
G1 F15000
G1 X151.88 Y100.126 E.0129
G1 X144.509 Y100.126 F30000
; LINE_WIDTH: 0.112459
G1 F15000
G1 X144.382 Y100.253 E.00102
G1 X115.874 Y100.501 F30000
; LINE_WIDTH: 0.101251
G1 F15000
G1 X115.499 Y100.126 E.00252
; WIPE_START
G1 F24000
G1 X115.874 Y100.501 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.973 J-.731 P1  F30000
G1 X91.57 Y132.874 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.197932
G1 F15000
G1 X91.126 Y132.43 E.00793
G1 X101.695 Y132.758 F30000
; LINE_WIDTH: 0.144158
G1 F15000
G2 X101.591 Y132.933 I.074 J.162 E.00179
G1 X103.799 Y138.738 F30000
; LINE_WIDTH: 0.214961
G1 F15000
G1 X103.707 Y138.607 E.00223
; LINE_WIDTH: 0.172698
G1 X103.616 Y138.477 E.00168
; LINE_WIDTH: 0.130434
G1 X103.525 Y138.347 E.00113
G1 X105.114 Y141.121 F30000
; LINE_WIDTH: 0.224938
G1 F15000
G1 X104.977 Y140.945 E.00329
; LINE_WIDTH: 0.179349
G1 X104.841 Y140.77 E.00247
; LINE_WIDTH: 0.133759
G1 X104.704 Y140.595 E.00164
G1 X106.119 Y142.662 F30000
; LINE_WIDTH: 0.232804
G1 F15000
G1 X105.94 Y142.444 E.00436
; LINE_WIDTH: 0.184593
G1 X105.762 Y142.226 E.00325
; LINE_WIDTH: 0.136382
G1 X105.583 Y142.008 E.00215
G1 X112.004 Y148.963 F30000
; LINE_WIDTH: 0.08817
G1 F15000
G1 X111.952 Y148.917 E.00026
; LINE_WIDTH: 0.0949538
G1 X111.596 Y148.595 E.00204
; LINE_WIDTH: 0.141139
G1 X111.241 Y148.272 E.00384
; LINE_WIDTH: 0.187324
G1 X110.885 Y147.949 E.00565
; LINE_WIDTH: 0.233511
G1 X110.366 Y147.453 E.01116
; LINE_WIDTH: 0.289764
G3 X108.832 Y145.941 I29.944 J-31.906 E.04332
; LINE_WIDTH: 0.297829
G1 X108.337 Y145.42 E.01492
; LINE_WIDTH: 0.260866
G1 X107.842 Y144.899 E.01276
; LINE_WIDTH: 0.223905
G1 X107.536 Y144.56 E.00674
; LINE_WIDTH: 0.17866
G1 X107.229 Y144.221 E.00506
; LINE_WIDTH: 0.133415
G1 X106.923 Y143.882 E.00337
G1 X113.874 Y150.299 F30000
; LINE_WIDTH: 0.0881697
G1 F15000
G1 X113.656 Y150.119 E.00104
; LINE_WIDTH: 0.135573
G1 X113.437 Y149.939 E.00214
; LINE_WIDTH: 0.182977
G1 X113.219 Y149.76 E.00323
G1 X115.29 Y151.18 F30000
; LINE_WIDTH: 0.0881691
G1 F15000
G1 X115.112 Y151.041 E.00083
; LINE_WIDTH: 0.13391
G1 X114.933 Y150.902 E.00168
; LINE_WIDTH: 0.17965
G1 X114.755 Y150.762 E.00252
G1 X116.477 Y151.834 F30000
; LINE_WIDTH: 0.0881705
G1 F15000
G1 X116.326 Y151.721 E.00069
; LINE_WIDTH: 0.132248
G1 X116.175 Y151.609 E.00137
; LINE_WIDTH: 0.176326
G1 X116.024 Y151.497 E.00205
G1 X118.506 Y152.794 F30000
; LINE_WIDTH: 0.0881704
G1 F15000
G1 X118.388 Y152.715 E.00052
; LINE_WIDTH: 0.129153
G1 X118.271 Y152.637 E.00099
; LINE_WIDTH: 0.170135
G1 X118.153 Y152.558 E.00147
; WIPE_START
G1 F24000
G1 X118.271 Y152.637 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.034 J1.216 P1  F30000
G1 X143.277 Y151.942 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.11168
G1 F15000
G1 X143.166 Y152.024 E.00077
M106 S247.35
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X143.277 Y151.942 E-.76
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
G3 Z3.4 I.739 J.967 P1  F30000
G1 X168.602 Y132.602 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X158.222 Y132.602 E.34434
G3 X132.141 Y154.82 I-28.242 J-6.736 E1.21561
G1 X132.07 Y154.824 E.00235
G3 X101.778 Y132.602 I-2.076 J-28.927 E1.35562
G1 X91.398 Y132.602 E.34434
G1 X91.398 Y105.398 E.90241
G1 X107.898 Y105.398 E.54734
G1 X107.898 Y100.398 E.16586
G1 X115.602 Y100.398 E.25556
G1 X115.602 Y105.398 E.16586
G1 X144.398 Y105.398 E.95521
G1 X144.398 Y100.398 E.16586
G1 X152.102 Y100.398 E.25556
G1 X152.102 Y105.398 E.16586
G1 X168.602 Y105.398 E.54734
G1 X168.602 Y132.542 E.90042
G1 X168.21 Y132.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.915 Y132.21 E.31635
G3 X102.085 Y132.21 I-27.915 J-6.327 E2.37094
G1 X91.79 Y132.21 E.31635
G1 X91.79 Y105.79 E.81181
G1 X108.29 Y105.79 E.507
G1 X108.29 Y100.79 E.15364
G1 X115.21 Y100.79 E.21263
G1 X115.21 Y105.79 E.15364
G1 X144.79 Y105.79 E.90891
G1 X144.79 Y100.79 E.15364
G1 X151.71 Y100.79 E.21263
G1 X151.71 Y105.79 E.15364
G1 X168.21 Y105.79 E.507
G1 X168.21 Y132.15 E.80997
M204 S10000
; WIPE_START
G1 F24000
G1 X166.21 Y132.162 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.36 J-1.163 P1  F30000
G1 X70.624 Y102.569 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X75.007 Y98.602 I4.38 J.435 E.21503
G1 X185.094 Y98.605 E3.65177
G3 X189.398 Y103.007 I-.105 J4.408 E.22609
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.411 J-.006 E.22946
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I.006 J-4.411 E.22946
G1 X70.602 Y103.007 E1.6581
G3 X70.618 Y102.629 I4.402 J-.004 E.01258
G1 X70.232 Y102.547 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.233 Y102.531 E.00051
G3 X75.003 Y98.21 I4.77 J.473 E.21678
G1 X185.103 Y98.213 E3.38309
G3 X189.79 Y103.003 I-.116 J4.801 E.2279
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.804 J-.012 E.23117
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.001 J-4.794 E.23131
G1 X70.21 Y103.003 E1.5362
G1 X70.229 Y102.607 E.01217
M204 S10000
; WIPE_START
G1 F24000
G1 X70.233 Y102.531 E-.02913
G1 X70.302 Y102.066 E-.17861
G1 X70.416 Y101.61 E-.17862
G1 X70.575 Y101.167 E-.17863
G1 X70.776 Y100.742 E-.17863
G1 X70.798 Y100.705 E-.01638
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.37 J1.159 P1  F30000
G1 X91.05 Y107.171 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X91.05 Y105.543 E.05401
G1 X70.953 Y125.639 E.94276
G1 X70.954 Y122.685 E.09797
G1 X105.318 Y157.05 E1.6121
G1 X108.626 Y157.05 E.10975
G1 X114.724 Y150.952 E.28606
G1 X121.447 Y153.965 F30000
G1 F15476.087
G3 X119.903 Y153.448 I4.471 J-15.924 E.05402
G1 X116.302 Y157.05 E.16894
G1 X112.994 Y157.05 E.10975
G1 X70.954 Y115.01 E1.97215
G1 X70.954 Y117.962 E.09792
G1 X89.966 Y98.951 E.89187
G1 X93.275 Y98.951 E.10977
G1 X99.374 Y105.05 E.28611
G1 X99.219 Y105.05 E.00515
G1 X105.317 Y98.951 E.2861
G1 X108.627 Y98.951 E.10979
G1 X109.726 Y100.05 E.05154
G1 X111.895 Y100.05 E.07195
G1 X112.993 Y98.951 E.05153
G1 X116.303 Y98.951 E.10981
G1 X122.402 Y105.05 E.28609
G1 X122.246 Y105.05 E.00514
G1 X128.345 Y98.952 E.28607
G1 X131.655 Y98.952 E.10983
G1 X137.754 Y105.05 E.28607
G1 X137.598 Y105.05 E.00514
G1 X143.696 Y98.952 E.28606
G1 X147.008 Y98.952 E.10985
G1 X148.105 Y100.05 E.05149
G1 X150.274 Y100.05 E.07195
G1 X151.372 Y98.952 E.05149
G1 X154.684 Y98.952 E.10986
G1 X160.781 Y105.05 E.28605
G1 X160.626 Y105.05 E.00514
G1 X166.724 Y98.952 E.28603
G1 X170.036 Y98.952 E.10989
G1 X189.044 Y117.96 E.8917
G1 X189.044 Y115.012 E.09782
G1 X147.006 Y157.05 E1.97209
G1 X143.698 Y157.05 E.10975
G1 X140.097 Y153.448 E.16894
G3 X138.553 Y153.965 I-6.015 J-15.408 E.05402
G1 X145.276 Y150.952 F30000
G1 F15476.087
G1 X151.374 Y157.05 E.28606
G1 X154.682 Y157.05 E.10975
G1 X189.044 Y122.688 E1.612
G1 X189.044 Y125.636 E.09782
G1 X168.95 Y105.543 E.94264
G1 X168.95 Y107.171 E.05401
; WIPE_START
G1 F24000
G1 X168.95 Y105.543 E-.61876
G1 X169.213 Y105.805 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.017 J-1.217 P1  F30000
G1 X116.199 Y105.05 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F15476.087
G1 X115.95 Y105.05 E.00824
G1 X115.95 Y103.67 E.04577
G1 X120.669 Y98.951 E.22135
G1 X123.979 Y98.951 E.10982
G1 X130.078 Y105.05 E.28608
G1 X129.922 Y105.05 E.00514
G1 X136.02 Y98.952 E.28607
G1 X139.332 Y98.952 E.10984
G1 X144.05 Y103.67 E.22133
G1 X144.05 Y102.042 E.05401
; WIPE_START
G1 F24000
G1 X144.05 Y103.67 E-.61876
G1 X143.787 Y103.407 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.09 J1.214 P1  F30000
G1 X152.45 Y102.766 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F15476.087
G1 X152.45 Y104.395 E.05401
G1 X153.105 Y105.05 E.03073
G1 X152.95 Y105.05 E.00514
G1 X159.048 Y98.952 E.28604
G1 X162.36 Y98.952 E.10987
G1 X168.457 Y105.05 E.28604
G1 X168.302 Y105.05 E.00514
G1 X174.399 Y98.953 E.28603
G1 X177.712 Y98.953 E.1099
G1 X189.044 Y110.285 E.5316
G1 X189.044 Y107.336 E.09782
G1 X168.95 Y127.429 E.94264
G1 X168.95 Y128.571 E.03785
G1 X189.044 Y148.664 E.94264
G1 X189.044 Y145.715 E.09782
G1 X177.71 Y157.05 E.53171
G1 X174.402 Y157.05 E.10975
G1 X156.299 Y138.947 E.84924
G2 X158.392 Y133.365 I-27.335 J-13.436 E.19809
G1 X182.078 Y157.05 E1.11112
G2 X185.408 Y157.028 I1.45 J-33.052 E.11052
G1 X189.023 Y153.413 E.16961
G3 X188.185 Y155.481 I-4.104 J-.458 E.07497
G1 X165.654 Y132.95 E1.05697
G1 X163.429 Y132.95 E.0738
G1 X154.85 Y141.53 E.4025
G3 X153.354 Y143.678 I-22.538 J-14.108 E.08685
G1 X166.726 Y157.05 E.62731
G1 X170.034 Y157.05 E.10975
G1 X189.044 Y138.04 E.8918
G1 X189.044 Y140.988 E.09782
G1 X168.95 Y120.895 E.94264
G1 X168.95 Y119.754 E.03785
G1 X188.191 Y100.513 E.9026
G3 X189.023 Y102.587 I-3.951 J2.79 E.07482
G1 X185.408 Y98.972 E.16961
G2 X185.084 Y98.953 I-.267 J1.757 E.01077
G1 X182.075 Y98.953 E.09981
G1 X168.95 Y112.078 E.61571
G1 X168.95 Y113.219 E.03785
G1 X189.044 Y133.312 E.94264
G1 X189.044 Y130.364 E.09782
G1 X162.358 Y157.05 E1.2519
G1 X159.05 Y157.05 E.10975
G1 X149.673 Y147.673 E.43989
G3 X145.657 Y150.723 I-20.321 J-22.588 E.16745
G1 X139.33 Y157.05 E.29682
G1 X136.022 Y157.05 E.10975
G1 X133.947 Y154.975 E.09735
G1 X133.691 Y155.013 E.00856
G1 X131.654 Y157.05 E.09557
G1 X128.346 Y157.05 E.10975
G1 X126.309 Y155.013 E.09557
G1 X126.053 Y154.975 E.00856
G1 X123.978 Y157.05 E.09735
G1 X120.67 Y157.05 E.10975
G1 X114.343 Y150.723 E.29682
G3 X110.327 Y147.673 I16.306 J-25.637 E.16745
G1 X100.95 Y157.05 E.43989
G1 X97.642 Y157.05 E.10975
G1 X70.953 Y130.361 E1.25204
G1 X70.952 Y133.316 E.09803
G1 X91.05 Y113.219 E.9428
G1 X91.05 Y112.078 E.03785
G1 X77.923 Y98.95 E.61582
M73 P47 R21
G2 X74.592 Y98.972 I-1.45 J33.043 E.11052
G1 X70.984 Y102.581 E.16929
G3 X71.809 Y100.513 I4.121 J.447 E.07477
G1 X91.05 Y119.754 E.9026
G1 X91.05 Y120.895 E.03785
G1 X70.952 Y140.993 E.94284
G1 X70.952 Y138.036 E.09808
G1 X89.966 Y157.05 E.89199
G1 X93.274 Y157.05 E.10975
G1 X106.646 Y143.678 E.62731
G3 X105.15 Y141.53 I21.046 J-16.258 E.08685
G1 X96.571 Y132.95 E.4025
M73 P48 R21
G1 X94.346 Y132.95 E.0738
G1 X71.815 Y155.481 E1.05697
G3 X70.972 Y153.408 I3.32 J-2.557 E.07516
G1 X74.591 Y157.027 E.16979
G2 X77.922 Y157.05 I1.873 J-30.52 E.11056
G1 X101.608 Y133.365 E1.11112
G2 X103.701 Y138.947 I29.428 J-7.854 E.19809
G1 X85.598 Y157.05 E.84924
G1 X82.29 Y157.05 E.10975
G1 X70.951 Y145.711 E.53193
G1 X70.951 Y148.669 E.09814
G1 X91.05 Y128.571 E.94288
G1 X91.05 Y127.429 E.03785
G1 X70.955 Y107.335 E.94267
G1 X70.955 Y110.285 E.09786
G1 X82.29 Y98.951 E.53174
G1 X85.599 Y98.951 E.10976
G1 X91.698 Y105.05 E.28612
G1 X91.543 Y105.05 E.00515
G1 X97.641 Y98.951 E.28611
G1 X100.951 Y98.951 E.10978
G1 X107.05 Y105.05 E.2861
G1 X106.895 Y105.05 E.00515
G1 X107.55 Y104.395 E.03073
G1 X107.55 Y102.766 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X107.55 Y104.395 E-.61876
G1 X107.287 Y104.657 E-.14124
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
G3 Z3.6 I-.505 J1.107 P1  F30000
G1 X168.602 Y132.602 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X158.222 Y132.602 E.34434
G3 X101.778 Y132.602 I-28.222 J-6.717 E2.5735
G1 X91.398 Y132.602 E.34434
G1 X91.398 Y105.398 E.90241
G1 X107.898 Y105.398 E.54734
G1 X107.898 Y100.398 E.16586
G1 X115.602 Y100.398 E.25556
G1 X115.602 Y105.398 E.16586
G1 X144.398 Y105.398 E.95521
G1 X144.398 Y100.398 E.16586
G1 X152.102 Y100.398 E.25556
G1 X152.102 Y105.398 E.16586
G1 X168.602 Y105.398 E.54734
G1 X168.602 Y132.542 E.90042
G1 X168.21 Y132.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.915 Y132.21 E.31635
G3 X102.085 Y132.21 I-27.915 J-6.33 E2.37081
G1 X91.79 Y132.21 E.31635
G1 X91.79 Y105.79 E.81181
G1 X108.29 Y105.79 E.507
G1 X108.29 Y100.79 E.15364
G1 X115.21 Y100.79 E.21263
G1 X115.21 Y105.79 E.15364
G1 X144.79 Y105.79 E.90891
G1 X144.79 Y100.79 E.15364
G1 X151.71 Y100.79 E.21263
G1 X151.71 Y105.79 E.15364
G1 X168.21 Y105.79 E.507
G1 X168.21 Y132.15 E.80997
M204 S10000
; WIPE_START
G1 F24000
G1 X166.21 Y132.162 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.36 J-1.163 P1  F30000
G1 X70.625 Y102.569 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X75.007 Y98.602 I4.389 J.444 E.2149
G1 X185.101 Y98.605 E3.652
G3 X189.398 Y103.007 I-.112 J4.408 E.22586
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.411 J-.006 E.22946
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I.006 J-4.411 E.22946
G1 X70.602 Y103.007 E1.6581
G3 X70.619 Y102.629 I4.411 J.006 E.01258
G1 X70.232 Y102.547 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.233 Y102.531 E.00051
G3 X75.003 Y98.21 I4.77 J.473 E.21678
G1 X185.111 Y98.213 E3.38331
G3 X189.79 Y103.003 I-.123 J4.8 E.22768
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.804 J-.012 E.23117
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.001 J-4.794 E.23131
G1 X70.21 Y103.003 E1.5362
G1 X70.229 Y102.607 E.01217
M204 S10000
; WIPE_START
G1 F24000
G1 X70.233 Y102.531 E-.02912
G1 X70.302 Y102.066 E-.17861
G1 X70.416 Y101.61 E-.17862
G1 X70.575 Y101.167 E-.17864
G1 X70.776 Y100.742 E-.17861
G1 X70.798 Y100.705 E-.0164
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.37 J1.159 P1  F30000
G1 X91.05 Y107.171 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X91.05 Y105.543 E.05401
G1 X70.953 Y125.639 E.94276
G1 X70.954 Y122.685 E.09797
G1 X105.318 Y157.05 E1.6121
G1 X108.626 Y157.05 E.10975
G1 X114.724 Y150.952 E.28606
G1 X121.447 Y153.965 F30000
G1 F15476.087
G3 X119.903 Y153.448 I4.471 J-15.924 E.05402
G1 X116.302 Y157.05 E.16894
G1 X112.994 Y157.05 E.10975
G1 X70.954 Y115.01 E1.97215
G1 X70.954 Y117.962 E.09792
G1 X89.966 Y98.951 E.89186
G1 X93.275 Y98.951 E.10977
G1 X99.374 Y105.05 E.28611
G1 X99.219 Y105.05 E.00515
G1 X105.317 Y98.951 E.2861
G1 X108.627 Y98.951 E.1098
G1 X109.726 Y100.05 E.05153
G1 X111.895 Y100.05 E.07195
G1 X112.993 Y98.951 E.05153
G1 X116.303 Y98.951 E.10981
G1 X122.402 Y105.05 E.28608
G1 X122.246 Y105.05 E.00514
G1 X128.345 Y98.952 E.28607
G1 X131.656 Y98.952 E.10983
G1 X137.754 Y105.05 E.28607
G1 X137.598 Y105.05 E.00514
G1 X143.696 Y98.952 E.28605
G1 X147.008 Y98.952 E.10986
G1 X148.105 Y100.05 E.05149
G1 X150.274 Y100.05 E.07195
G1 X151.372 Y98.952 E.05148
G1 X154.684 Y98.952 E.10987
G1 X160.781 Y105.05 E.28604
G1 X160.626 Y105.05 E.00514
G1 X166.723 Y98.953 E.28603
G1 X170.036 Y98.953 E.1099
G1 X189.044 Y117.96 E.8917
G1 X189.044 Y115.012 E.09782
G1 X147.006 Y157.05 E1.97209
G1 X143.698 Y157.05 E.10975
G1 X140.097 Y153.448 E.16894
G3 X138.553 Y153.965 I-6.015 J-15.408 E.05402
G1 X145.276 Y150.952 F30000
G1 F15476.087
G1 X151.374 Y157.05 E.28606
G1 X154.682 Y157.05 E.10975
G1 X189.044 Y122.688 E1.612
G1 X189.044 Y125.636 E.09782
G1 X168.95 Y105.543 E.94264
G1 X168.95 Y107.171 E.05401
; WIPE_START
G1 F24000
G1 X168.95 Y105.543 E-.61876
G1 X169.213 Y105.805 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.017 J-1.217 P1  F30000
G1 X116.199 Y105.05 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F15476.087
G1 X115.95 Y105.05 E.00824
G1 X115.95 Y103.67 E.04577
G1 X120.669 Y98.951 E.22135
G1 X123.979 Y98.952 E.10982
G1 X130.078 Y105.05 E.28608
G1 X129.922 Y105.05 E.00514
G1 X136.02 Y98.952 E.28606
G1 X139.332 Y98.952 E.10985
G1 X144.05 Y103.67 E.22133
G1 X144.05 Y102.042 E.05401
; WIPE_START
G1 F24000
G1 X144.05 Y103.67 E-.61876
G1 X143.787 Y103.407 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.09 J1.214 P1  F30000
G1 X152.45 Y102.766 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F15476.087
G1 X152.45 Y104.395 E.05401
G1 X153.105 Y105.05 E.03073
G1 X152.95 Y105.05 E.00514
G1 X159.048 Y98.952 E.28604
G1 X162.36 Y98.952 E.10988
G1 X168.457 Y105.05 E.28603
G1 X168.302 Y105.05 E.00514
G1 X174.399 Y98.953 E.28602
G1 X177.712 Y98.953 E.10991
G1 X189.044 Y110.285 E.53159
G1 X189.044 Y107.336 E.09782
G1 X168.95 Y127.429 E.94264
G1 X168.95 Y128.571 E.03785
G1 X189.044 Y148.664 E.94264
G1 X189.044 Y145.715 E.09782
G1 X177.71 Y157.05 E.53171
G1 X174.402 Y157.05 E.10975
G1 X156.299 Y138.947 E.84924
G2 X158.392 Y133.365 I-27.335 J-13.436 E.19809
G1 X182.078 Y157.05 E1.11112
G2 X185.408 Y157.028 I1.45 J-33.052 E.11052
G1 X189.023 Y153.413 E.16961
G3 X188.185 Y155.481 I-4.104 J-.458 E.07497
G1 X165.654 Y132.95 E1.05697
G1 X163.429 Y132.95 E.0738
G1 X154.85 Y141.53 E.4025
G3 X153.354 Y143.678 I-22.539 J-14.109 E.08685
G1 X166.726 Y157.05 E.62731
G1 X170.034 Y157.05 E.10975
G1 X189.044 Y138.04 E.8918
G1 X189.044 Y140.988 E.09782
G1 X168.95 Y120.895 E.94264
G1 X168.95 Y119.754 E.03785
G1 X188.191 Y100.513 E.9026
G3 X189.023 Y102.587 I-3.951 J2.79 E.07482
G1 X185.408 Y98.972 E.16961
G2 X185.091 Y98.953 I-.263 J1.731 E.01054
G1 X182.075 Y98.953 E.10005
G1 X168.95 Y112.078 E.6157
G1 X168.95 Y113.219 E.03785
G1 X189.044 Y133.312 E.94264
G1 X189.044 Y130.364 E.09782
G1 X162.358 Y157.05 E1.2519
G1 X159.05 Y157.05 E.10975
G1 X149.673 Y147.673 E.43989
G3 X145.657 Y150.723 I-20.321 J-22.587 E.16745
G1 X139.33 Y157.05 E.29682
G1 X136.022 Y157.05 E.10975
G1 X133.947 Y154.975 E.09735
G1 X133.691 Y155.013 E.00856
G1 X131.654 Y157.05 E.09557
G1 X128.346 Y157.05 E.10975
G1 X126.309 Y155.013 E.09557
G1 X126.053 Y154.975 E.00856
G1 X123.978 Y157.05 E.09735
G1 X120.67 Y157.05 E.10975
G1 X114.343 Y150.723 E.29682
G3 X110.327 Y147.673 I16.306 J-25.637 E.16745
G1 X100.95 Y157.05 E.43989
G1 X97.642 Y157.05 E.10975
G1 X70.953 Y130.361 E1.25204
G1 X70.952 Y133.316 E.09803
G1 X91.05 Y113.219 E.9428
G1 X91.05 Y112.078 E.03785
G1 X77.923 Y98.95 E.61582
G2 X74.592 Y98.972 I-1.451 J33.042 E.11052
G1 X70.984 Y102.581 E.16929
G3 X71.809 Y100.513 I4.121 J.447 E.07477
G1 X91.05 Y119.754 E.9026
G1 X91.05 Y120.895 E.03785
G1 X70.952 Y140.993 E.94284
G1 X70.952 Y138.036 E.09808
G1 X89.966 Y157.05 E.89199
G1 X93.274 Y157.05 E.10975
G1 X106.646 Y143.678 E.62731
G3 X105.15 Y141.53 I21.046 J-16.258 E.08685
G1 X96.571 Y132.95 E.4025
G1 X94.346 Y132.95 E.0738
G1 X71.815 Y155.481 E1.05697
G3 X70.972 Y153.408 I3.32 J-2.557 E.07516
G1 X74.591 Y157.027 E.16979
G2 X77.922 Y157.05 I1.873 J-30.516 E.11056
G1 X101.608 Y133.365 E1.11112
G2 X103.701 Y138.947 I29.428 J-7.854 E.19809
G1 X85.598 Y157.05 E.84924
G1 X82.29 Y157.05 E.10975
G1 X70.951 Y145.711 E.53193
G1 X70.951 Y148.669 E.09814
G1 X91.05 Y128.571 E.94288
G1 X91.05 Y127.429 E.03785
G1 X70.955 Y107.335 E.94267
G1 X70.955 Y110.285 E.09786
G1 X82.29 Y98.951 E.53174
G1 X85.599 Y98.951 E.10976
G1 X91.698 Y105.05 E.28612
G1 X91.543 Y105.05 E.00515
G1 X97.641 Y98.951 E.28611
G1 X100.951 Y98.951 E.10979
G1 X107.05 Y105.05 E.2861
G1 X106.895 Y105.05 E.00515
G1 X107.55 Y104.395 E.03073
G1 X107.55 Y102.766 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X107.55 Y104.395 E-.61876
G1 X107.287 Y104.657 E-.14124
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
G3 Z3.8 I-.505 J1.107 P1  F30000
G1 X168.602 Y132.602 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X158.222 Y132.602 E.34434
G3 X101.778 Y132.602 I-28.222 J-6.718 E2.57344
G1 X91.398 Y132.602 E.34434
G1 X91.398 Y105.398 E.90241
G1 X107.898 Y105.398 E.54734
G1 X107.898 Y100.398 E.16586
G1 X115.602 Y100.398 E.25556
G1 X115.602 Y105.398 E.16586
G1 X144.398 Y105.398 E.95521
G1 X144.398 Y100.398 E.16586
G1 X152.102 Y100.398 E.25556
G1 X152.102 Y105.398 E.16586
G1 X168.602 Y105.398 E.54734
G1 X168.602 Y132.542 E.90042
G1 X168.21 Y132.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.915 Y132.21 E.31635
G3 X102.085 Y132.21 I-27.915 J-6.332 E2.37072
G1 X91.79 Y132.21 E.31635
G1 X91.79 Y105.79 E.81181
G1 X108.29 Y105.79 E.507
G1 X108.29 Y100.79 E.15364
G1 X115.21 Y100.79 E.21263
G1 X115.21 Y105.79 E.15364
G1 X144.79 Y105.79 E.90891
G1 X144.79 Y100.79 E.15364
G1 X151.71 Y100.79 E.21263
G1 X151.71 Y105.79 E.15364
G1 X168.21 Y105.79 E.507
G1 X168.21 Y132.15 E.80997
M204 S10000
; WIPE_START
G1 F24000
G1 X166.21 Y132.162 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.36 J-1.163 P1  F30000
G1 X70.624 Y102.569 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X75.007 Y98.602 I4.389 J.444 E.2149
G1 X185.216 Y98.608 E3.65581
G3 X189.398 Y103.007 I-.219 J4.396 E.22219
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.411 J-.006 E.22946
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I.006 J-4.411 E.22946
G1 X70.602 Y103.007 E1.6581
G3 X70.619 Y102.629 I4.411 J.006 E.01258
G1 X70.232 Y102.547 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.234 Y102.531 E.00051
G3 X75.003 Y98.21 I4.78 J.483 E.21664
G1 X185.235 Y98.216 E3.38714
G3 X189.79 Y103.003 I-.239 J4.788 E.224
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.804 J-.012 E.23117
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.012 J-4.804 E.23117
G1 X70.21 Y103.003 E1.5362
G1 X70.229 Y102.607 E.01217
M204 S10000
; WIPE_START
G1 F24000
G1 X70.234 Y102.531 E-.02908
G1 X70.302 Y102.066 E-.1786
G1 X70.416 Y101.61 E-.17862
G1 X70.575 Y101.167 E-.17865
G1 X70.776 Y100.742 E-.17861
G1 X70.798 Y100.705 E-.01645
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.37 J1.159 P1  F30000
G1 X91.05 Y107.171 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X91.05 Y105.543 E.05401
G1 X70.953 Y125.639 E.94276
G1 X70.954 Y122.685 E.09797
G1 X105.318 Y157.05 E1.6121
G1 X108.626 Y157.05 E.10975
G1 X114.724 Y150.952 E.28606
G1 X121.447 Y153.965 F30000
G1 F15476.087
G3 X119.903 Y153.448 I4.471 J-15.924 E.05402
G1 X116.302 Y157.05 E.16894
G1 X112.994 Y157.05 E.10975
G1 X70.954 Y115.01 E1.97215
M73 P49 R21
G1 X70.954 Y117.962 E.09792
G1 X89.965 Y98.951 E.89185
G1 X93.275 Y98.951 E.1098
G1 X99.374 Y105.05 E.28609
G1 X99.219 Y105.05 E.00515
G1 X105.316 Y98.952 E.28606
G1 X108.628 Y98.952 E.10985
G1 X109.726 Y100.05 E.05149
G1 X111.895 Y100.05 E.07195
G1 X112.992 Y98.952 E.05148
G1 X116.304 Y98.952 E.10988
G1 X122.402 Y105.05 E.28603
G1 X122.246 Y105.05 E.00514
G1 X128.343 Y98.953 E.28601
G1 X131.657 Y98.953 E.10993
G1 X137.754 Y105.05 E.286
G1 X137.598 Y105.05 E.00514
G1 X143.694 Y98.954 E.28597
G1 X147.01 Y98.954 E.10998
G1 X148.105 Y100.05 E.0514
G1 X150.274 Y100.05 E.07195
G1 X151.37 Y98.954 E.05139
G1 X154.686 Y98.954 E.11
G1 X160.781 Y105.05 E.28595
G1 X160.626 Y105.05 E.00514
G1 X166.721 Y98.955 E.28592
G1 X170.039 Y98.955 E.11005
G1 X189.044 Y117.96 E.89158
G1 X189.044 Y115.012 E.09782
G1 X147.006 Y157.05 E1.97209
G1 X143.698 Y157.05 E.10975
G1 X140.097 Y153.448 E.16894
G3 X138.553 Y153.965 I-6.015 J-15.408 E.05402
G1 X145.276 Y150.952 F30000
G1 F15476.087
G1 X151.374 Y157.05 E.28606
G1 X154.682 Y157.05 E.10975
G1 X189.044 Y122.688 E1.612
G1 X189.044 Y125.636 E.09782
G1 X168.95 Y105.543 E.94264
G1 X168.95 Y107.171 E.05401
; WIPE_START
G1 F24000
G1 X168.95 Y105.543 E-.61876
G1 X169.213 Y105.805 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.017 J-1.217 P1  F30000
G1 X116.199 Y105.05 Z4
G1 Z3.6
G1 E.8 F1800
G1 F15476.087
G1 X115.95 Y105.05 E.00824
G1 X115.95 Y103.67 E.04577
G1 X120.668 Y98.953 E.22129
G1 X123.981 Y98.953 E.1099
G1 X130.078 Y105.05 E.28602
G1 X129.922 Y105.05 E.00514
G1 X136.019 Y98.953 E.28599
G1 X139.333 Y98.954 E.10995
G1 X144.05 Y103.67 E.22125
G1 X144.05 Y102.042 E.05401
; WIPE_START
G1 F24000
G1 X144.05 Y103.67 E-.61876
G1 X143.787 Y103.407 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.09 J1.214 P1  F30000
G1 X152.45 Y102.766 Z4
G1 Z3.6
G1 E.8 F1800
G1 F15476.087
G1 X152.45 Y104.395 E.05401
G1 X153.105 Y105.05 E.03073
G1 X152.95 Y105.05 E.00514
G1 X159.045 Y98.955 E.28594
G1 X162.362 Y98.955 E.11003
G1 X168.457 Y105.05 E.28593
G1 X168.302 Y105.05 E.00514
G1 X174.397 Y98.955 E.2859
G1 X177.715 Y98.955 E.11008
G1 X189.044 Y110.285 E.53147
G1 X189.044 Y107.336 E.09782
G1 X168.95 Y127.429 E.94264
G1 X168.95 Y128.571 E.03785
G1 X189.044 Y148.664 E.94264
G1 X189.044 Y145.715 E.09782
G1 X177.71 Y157.05 E.53171
G1 X174.402 Y157.05 E.10975
G1 X156.299 Y138.947 E.84924
G2 X158.392 Y133.365 I-27.335 J-13.436 E.19809
G1 X182.078 Y157.05 E1.11112
G2 X185.408 Y157.028 I1.45 J-33.052 E.11052
G1 X189.023 Y153.413 E.16961
G3 X188.185 Y155.481 I-4.104 J-.458 E.07497
G1 X165.654 Y132.95 E1.05697
G1 X163.429 Y132.95 E.0738
G1 X154.85 Y141.53 E.4025
G3 X153.354 Y143.678 I-22.54 J-14.109 E.08685
G1 X166.726 Y157.05 E.62731
G1 X170.034 Y157.05 E.10975
G1 X189.044 Y138.04 E.8918
G1 X189.044 Y140.988 E.09782
G1 X168.95 Y120.895 E.94264
G1 X168.95 Y119.754 E.03785
G1 X188.191 Y100.513 E.9026
G3 X189.023 Y102.587 I-3.951 J2.79 E.07482
G1 X185.413 Y98.977 E.16938
G1 X182.072 Y98.956 E.11081
G1 X168.95 Y112.078 E.61558
G1 X168.95 Y113.219 E.03785
G1 X189.044 Y133.312 E.94264
G1 X189.044 Y130.364 E.09782
G1 X162.358 Y157.05 E1.2519
G1 X159.05 Y157.05 E.10975
G1 X149.673 Y147.673 E.43989
G3 X145.657 Y150.723 I-20.322 J-22.588 E.16745
G1 X139.33 Y157.05 E.29682
G1 X136.022 Y157.05 E.10975
G1 X133.947 Y154.975 E.09735
G1 X133.691 Y155.013 E.00856
G1 X131.654 Y157.05 E.09557
G1 X128.346 Y157.05 E.10975
G1 X126.309 Y155.013 E.09557
G1 X126.053 Y154.975 E.00856
G1 X123.978 Y157.05 E.09735
G1 X120.67 Y157.05 E.10975
G1 X114.343 Y150.723 E.29682
G3 X110.327 Y147.673 I16.306 J-25.637 E.16745
G1 X100.95 Y157.05 E.43989
G1 X97.642 Y157.05 E.10975
G1 X70.953 Y130.361 E1.25204
G1 X70.952 Y133.316 E.09803
G1 X91.05 Y113.219 E.9428
G1 X91.05 Y112.078 E.03785
G1 X77.923 Y98.95 E.61582
G2 X74.592 Y98.972 I-1.451 J33.029 E.11052
G1 X70.984 Y102.581 E.16929
G3 X71.815 Y100.519 I4.025 J.424 E.07471
G1 X91.05 Y119.754 E.90234
G1 X91.05 Y120.895 E.03785
G1 X70.952 Y140.993 E.94284
G1 X70.952 Y138.036 E.09808
G1 X89.966 Y157.05 E.89198
G1 X93.274 Y157.05 E.10975
G1 X106.646 Y143.678 E.62731
G3 X105.15 Y141.53 I21.046 J-16.258 E.08685
G1 X96.571 Y132.95 E.4025
G1 X94.346 Y132.95 E.0738
G1 X71.815 Y155.481 E1.05697
G3 X70.972 Y153.408 I3.32 J-2.557 E.07516
G1 X74.591 Y157.027 E.16979
G2 X77.922 Y157.05 I1.873 J-30.52 E.11056
G1 X101.608 Y133.365 E1.11112
G2 X103.701 Y138.947 I29.428 J-7.854 E.19809
G1 X85.598 Y157.05 E.84924
G1 X82.29 Y157.05 E.10975
G1 X70.951 Y145.711 E.53193
G1 X70.951 Y148.669 E.09814
G1 X91.05 Y128.571 E.94288
G1 X91.05 Y127.429 E.03785
G1 X70.955 Y107.335 E.94267
G1 X70.955 Y110.285 E.09786
G1 X82.29 Y98.951 E.53173
G1 X85.599 Y98.951 E.10978
G1 X91.698 Y105.05 E.28611
G1 X91.543 Y105.05 E.00515
G1 X97.641 Y98.951 E.28608
G1 X100.952 Y98.952 E.10983
G1 X107.05 Y105.05 E.28607
G1 X106.895 Y105.05 E.00515
G1 X107.55 Y104.395 E.03073
G1 X107.55 Y102.766 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X107.55 Y104.395 E-.61876
G1 X107.287 Y104.657 E-.14124
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
G3 Z4 I-.505 J1.107 P1  F30000
G1 X168.602 Y132.602 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X158.222 Y132.602 E.34434
G3 X101.778 Y132.602 I-28.222 J-6.719 E2.5734
G1 X91.398 Y132.602 E.34434
G1 X91.398 Y105.398 E.90241
G1 X107.898 Y105.398 E.54734
G1 X107.898 Y100.398 E.16586
G1 X115.602 Y100.398 E.25556
G1 X115.602 Y105.398 E.16586
G1 X144.398 Y105.398 E.95521
G1 X144.398 Y100.398 E.16586
G1 X152.102 Y100.398 E.25556
G1 X152.102 Y105.398 E.16586
G1 X168.602 Y105.398 E.54734
G1 X168.602 Y132.542 E.90042
G1 X168.21 Y132.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.915 Y132.21 E.31635
G3 X102.085 Y132.21 I-27.915 J-6.334 E2.37064
G1 X91.79 Y132.21 E.31635
G1 X91.79 Y105.79 E.81181
G1 X108.29 Y105.79 E.507
G1 X108.29 Y100.79 E.15364
G1 X115.21 Y100.79 E.21263
G1 X115.21 Y105.79 E.15364
G1 X144.79 Y105.79 E.90891
G1 X144.79 Y100.79 E.15364
G1 X151.71 Y100.79 E.21263
G1 X151.71 Y105.79 E.15364
G1 X168.21 Y105.79 E.507
G1 X168.21 Y132.15 E.80997
M204 S10000
; WIPE_START
G1 F24000
G1 X166.21 Y132.162 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.36 J-1.163 P1  F30000
G1 X70.625 Y102.569 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X75.007 Y98.602 I4.389 J.444 E.2149
G1 X185.115 Y98.605 E3.65247
G3 X189.398 Y103.007 I-.126 J4.407 E.22539
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.402 J.004 E.2296
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I.002 J-4.407 E.22952
G1 X70.602 Y103.007 E1.6581
G3 X70.619 Y102.629 I4.411 J.006 E.01258
G1 X70.232 Y102.547 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.234 Y102.531 E.00051
G3 X75.003 Y98.21 I4.78 J.484 E.21664
G1 X185.125 Y98.213 E3.38374
G3 X189.79 Y103.003 I-.137 J4.8 E.22725
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.794 J-.001 E.23131
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.007 J-4.8 E.23122
G1 X70.21 Y103.003 E1.5362
G1 X70.229 Y102.607 E.01217
M204 S10000
; WIPE_START
G1 F24000
G1 X70.234 Y102.531 E-.02907
G1 X70.302 Y102.066 E-.1786
G1 X70.416 Y101.61 E-.17861
G1 X70.575 Y101.167 E-.17863
G1 X70.776 Y100.742 E-.17863
G1 X70.798 Y100.705 E-.01647
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.37 J1.159 P1  F30000
G1 X91.05 Y107.171 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X91.05 Y105.543 E.05401
G1 X70.953 Y125.639 E.94276
G1 X70.954 Y122.685 E.09797
G1 X105.318 Y157.05 E1.6121
G1 X108.626 Y157.05 E.10975
G1 X114.724 Y150.952 E.28606
G1 X121.447 Y153.965 F30000
G1 F15476.087
G3 X119.903 Y153.448 I4.471 J-15.924 E.05402
G1 X116.302 Y157.05 E.16894
G1 X112.994 Y157.05 E.10975
G1 X70.954 Y115.01 E1.97215
G1 X70.954 Y117.962 E.09792
G1 X89.966 Y98.951 E.89186
G1 X93.275 Y98.951 E.10978
G1 X99.374 Y105.05 E.28611
G1 X99.219 Y105.05 E.00515
G1 X105.317 Y98.951 E.28609
G1 X108.627 Y98.951 E.1098
G1 X109.726 Y100.05 E.05153
G1 X111.895 Y100.05 E.07195
G1 X112.993 Y98.951 E.05152
G1 X116.303 Y98.951 E.10982
G1 X122.402 Y105.05 E.28608
G1 X122.246 Y105.05 E.00514
G1 X128.344 Y98.952 E.28606
G1 X131.656 Y98.952 E.10985
G1 X137.754 Y105.05 E.28606
G1 X137.598 Y105.05 E.00514
G1 X143.696 Y98.952 E.28604
G1 X147.008 Y98.952 E.10987
G1 X148.105 Y100.05 E.05148
G1 X150.274 Y100.05 E.07195
G1 X151.372 Y98.952 E.05147
G1 X154.684 Y98.953 E.10989
G1 X160.781 Y105.05 E.28603
G1 X160.626 Y105.05 E.00514
G1 X166.723 Y98.953 E.28601
G1 X170.037 Y98.953 E.10992
G1 X189.044 Y117.96 E.89168
G1 X189.044 Y115.012 E.09782
G1 X147.006 Y157.05 E1.97209
G1 X143.698 Y157.05 E.10975
G1 X140.097 Y153.448 E.16894
G3 X138.553 Y153.965 I-6.015 J-15.408 E.05402
G1 X145.276 Y150.952 F30000
G1 F15476.087
G1 X151.374 Y157.05 E.28606
G1 X154.682 Y157.05 E.10975
G1 X189.044 Y122.688 E1.612
G1 X189.044 Y125.636 E.09782
G1 X168.95 Y105.543 E.94264
G1 X168.95 Y107.171 E.05401
; WIPE_START
G1 F24000
G1 X168.95 Y105.543 E-.61876
G1 X169.213 Y105.805 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.017 J-1.217 P1  F30000
G1 X116.199 Y105.05 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F15476.087
G1 X115.95 Y105.05 E.00824
G1 X115.95 Y103.67 E.04577
G1 X120.669 Y98.952 E.22134
G1 X123.98 Y98.952 E.10983
G1 X130.078 Y105.05 E.28607
G1 X129.922 Y105.05 E.00514
G1 X136.02 Y98.952 E.28605
G1 X139.332 Y98.952 E.10986
G1 X144.05 Y103.67 E.22132
G1 X144.05 Y102.042 E.05401
; WIPE_START
G1 F24000
G1 X144.05 Y103.67 E-.61876
G1 X143.787 Y103.407 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.09 J1.214 P1  F30000
G1 X152.45 Y102.766 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F15476.087
G1 X152.45 Y104.395 E.05401
G1 X153.105 Y105.05 E.03073
G1 X152.95 Y105.05 E.00514
G1 X159.047 Y98.953 E.28602
G1 X162.36 Y98.953 E.1099
G1 X168.457 Y105.05 E.28602
G1 X168.302 Y105.05 E.00514
G1 X174.399 Y98.953 E.286
G1 X177.713 Y98.953 E.10993
G1 X189.044 Y110.285 E.53158
G1 X189.044 Y107.336 E.09782
G1 X168.95 Y127.429 E.94264
G1 X168.95 Y128.571 E.03785
G1 X189.044 Y148.664 E.94264
G1 X189.044 Y145.715 E.09782
G1 X177.71 Y157.05 E.53171
G1 X174.402 Y157.05 E.10975
G1 X156.299 Y138.947 E.84924
G2 X158.392 Y133.365 I-27.335 J-13.436 E.19809
G1 X182.078 Y157.05 E1.11112
G2 X185.408 Y157.028 I1.45 J-33.052 E.11052
G1 X189.023 Y153.413 E.16961
G3 X188.185 Y155.481 I-4.104 J-.458 E.07497
G1 X165.654 Y132.95 E1.05697
G1 X163.429 Y132.95 E.0738
G1 X154.85 Y141.53 E.4025
G3 X153.354 Y143.678 I-22.54 J-14.109 E.08685
G1 X166.726 Y157.05 E.62731
G1 X170.034 Y157.05 E.10975
G1 X189.044 Y138.04 E.8918
G1 X189.044 Y140.988 E.09782
G1 X168.95 Y120.895 E.94264
G1 X168.95 Y119.754 E.03785
G1 X188.191 Y100.513 E.9026
G3 X189.023 Y102.587 I-3.951 J2.79 E.07482
G1 X185.408 Y98.972 E.16961
G2 X185.105 Y98.953 I-.256 J1.683 E.01008
G1 X182.075 Y98.953 E.10052
G1 X168.95 Y112.078 E.61569
G1 X168.95 Y113.219 E.03785
G1 X189.044 Y133.312 E.94264
G1 X189.044 Y130.364 E.09782
G1 X162.358 Y157.05 E1.2519
G1 X159.05 Y157.05 E.10975
G1 X149.673 Y147.673 E.43989
G3 X145.657 Y150.723 I-20.322 J-22.588 E.16745
G1 X139.33 Y157.05 E.29682
G1 X136.022 Y157.05 E.10975
G1 X133.947 Y154.975 E.09735
G1 X133.691 Y155.013 E.00856
G1 X131.654 Y157.05 E.09557
G1 X128.346 Y157.05 E.10975
G1 X126.309 Y155.013 E.09557
G1 X126.053 Y154.975 E.00856
G1 X123.978 Y157.05 E.09735
G1 X120.67 Y157.05 E.10975
M73 P50 R21
G1 X114.343 Y150.723 E.29682
G3 X110.327 Y147.673 I16.306 J-25.637 E.16745
G1 X100.95 Y157.05 E.43989
G1 X97.642 Y157.05 E.10975
G1 X70.953 Y130.361 E1.25204
G1 X70.952 Y133.316 E.09803
G1 X91.05 Y113.219 E.9428
G1 X91.05 Y112.078 E.03785
G1 X77.923 Y98.95 E.61582
G2 X74.592 Y98.972 I-1.451 J33.04 E.11052
G1 X70.984 Y102.581 E.16929
G3 X71.809 Y100.513 I4.121 J.447 E.07477
G1 X91.05 Y119.754 E.9026
G1 X91.05 Y120.895 E.03785
G1 X70.952 Y140.993 E.94284
G1 X70.952 Y138.036 E.09808
G1 X89.966 Y157.05 E.89199
G1 X93.274 Y157.05 E.10975
G1 X106.646 Y143.678 E.62731
G3 X105.15 Y141.53 I21.046 J-16.258 E.08685
G1 X96.571 Y132.95 E.4025
G1 X94.346 Y132.95 E.0738
G1 X71.815 Y155.481 E1.05697
G3 X70.972 Y153.408 I3.32 J-2.557 E.07516
G1 X74.591 Y157.027 E.16979
G2 X77.922 Y157.05 I1.873 J-30.52 E.11056
G1 X101.608 Y133.365 E1.11112
G2 X103.701 Y138.947 I29.428 J-7.854 E.19809
G1 X85.598 Y157.05 E.84924
G1 X82.29 Y157.05 E.10975
G1 X70.951 Y145.711 E.53193
G1 X70.951 Y148.669 E.09814
G1 X91.05 Y128.571 E.94288
G1 X91.05 Y127.429 E.03785
G1 X70.955 Y107.335 E.94267
G1 X70.955 Y110.285 E.09786
G1 X82.29 Y98.951 E.53174
G1 X85.599 Y98.951 E.10976
G1 X91.698 Y105.05 E.28612
G1 X91.543 Y105.05 E.00515
G1 X97.641 Y98.951 E.2861
G1 X100.951 Y98.951 E.10979
G1 X107.05 Y105.05 E.2861
G1 X106.895 Y105.05 E.00515
G1 X107.55 Y104.395 E.03073
G1 X107.55 Y102.766 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X107.55 Y104.395 E-.61876
G1 X107.287 Y104.657 E-.14124
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
G3 Z4.2 I-.505 J1.107 P1  F30000
G1 X168.602 Y132.602 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X158.222 Y132.602 E.34434
G3 X101.778 Y132.602 I-28.222 J-6.712 E2.57372
G1 X91.398 Y132.602 E.34434
G1 X91.398 Y105.398 E.90241
G1 X107.898 Y105.398 E.54734
G1 X107.898 Y100.398 E.16586
G1 X115.602 Y100.398 E.25556
G1 X115.602 Y105.398 E.16586
G1 X144.398 Y105.398 E.95521
G1 X144.398 Y100.398 E.16586
G1 X152.102 Y100.398 E.25556
G1 X152.102 Y105.398 E.16586
G1 X168.602 Y105.398 E.54734
G1 X168.602 Y132.542 E.90042
G1 X168.21 Y132.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.915 Y132.21 E.31635
G3 X102.085 Y132.21 I-27.915 J-6.336 E2.37059
G1 X91.79 Y132.21 E.31635
G1 X91.79 Y105.79 E.81181
G1 X108.29 Y105.79 E.507
G1 X108.29 Y100.79 E.15364
G1 X115.21 Y100.79 E.21263
G1 X115.21 Y105.79 E.15364
G1 X144.79 Y105.79 E.90891
G1 X144.79 Y100.79 E.15364
G1 X151.71 Y100.79 E.21263
G1 X151.71 Y105.79 E.15364
G1 X168.21 Y105.79 E.507
G1 X168.21 Y132.15 E.80997
M204 S10000
; WIPE_START
G1 F24000
G1 X166.21 Y132.162 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.36 J-1.163 P1  F30000
G1 X70.624 Y102.569 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X75.007 Y98.602 I4.38 J.435 E.21503
G1 X185.122 Y98.605 E3.6527
G3 X189.398 Y103.007 I-.133 J4.407 E.22516
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.411 J-.006 E.22946
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I-.004 J-4.402 E.2296
G1 X70.602 Y103.007 E1.6581
G3 X70.618 Y102.629 I4.402 J-.004 E.01258
G1 X70.232 Y102.547 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.233 Y102.531 E.00051
G3 X75.003 Y98.21 I4.77 J.473 E.21678
G1 X185.132 Y98.213 E3.38396
G3 X189.79 Y103.003 I-.144 J4.8 E.22704
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.804 J-.012 E.23117
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.001 J-4.794 E.23131
G1 X70.21 Y103.003 E1.5362
G1 X70.229 Y102.607 E.01217
M204 S10000
; WIPE_START
G1 F24000
G1 X70.233 Y102.531 E-.02907
G1 X70.302 Y102.066 E-.17861
G1 X70.416 Y101.61 E-.17862
G1 X70.575 Y101.167 E-.17864
G1 X70.776 Y100.742 E-.17861
G1 X70.798 Y100.705 E-.01645
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.37 J1.159 P1  F30000
G1 X91.05 Y107.171 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X91.05 Y105.543 E.05401
M73 P50 R20
G1 X70.953 Y125.639 E.94276
G1 X70.954 Y122.685 E.09797
G1 X105.318 Y157.05 E1.6121
G1 X108.626 Y157.05 E.10975
G1 X114.724 Y150.952 E.28606
G1 X121.447 Y153.965 F30000
G1 F15476.087
G3 X119.903 Y153.448 I4.471 J-15.924 E.05402
G1 X116.302 Y157.05 E.16894
G1 X112.994 Y157.05 E.10975
G1 X70.954 Y115.01 E1.97215
G1 X70.954 Y117.962 E.09792
G1 X89.966 Y98.951 E.89186
G1 X93.275 Y98.951 E.10978
G1 X99.374 Y105.05 E.28611
G1 X99.219 Y105.05 E.00515
G1 X105.317 Y98.951 E.28609
G1 X108.627 Y98.951 E.10981
G1 X109.726 Y100.05 E.05153
G1 X111.895 Y100.05 E.07195
G1 X112.993 Y98.951 E.05152
G1 X116.303 Y98.952 E.10982
G1 X122.402 Y105.05 E.28608
G1 X122.246 Y105.05 E.00514
G1 X128.344 Y98.952 E.28606
G1 X131.656 Y98.952 E.10985
G1 X137.754 Y105.05 E.28605
G1 X137.598 Y105.05 E.00514
G1 X143.696 Y98.952 E.28604
G1 X147.008 Y98.952 E.10988
G1 X148.105 Y100.05 E.05147
G1 X150.274 Y100.05 E.07195
G1 X151.371 Y98.953 E.05147
G1 X154.684 Y98.953 E.1099
G1 X160.781 Y105.05 E.28602
G1 X160.626 Y105.05 E.00514
G1 X166.723 Y98.953 E.28601
G1 X170.037 Y98.953 E.10992
G1 X189.044 Y117.96 E.89168
G1 X189.044 Y115.012 E.09782
G1 X147.006 Y157.05 E1.97209
G1 X143.698 Y157.05 E.10975
G1 X140.097 Y153.448 E.16894
G3 X138.553 Y153.965 I-6.015 J-15.408 E.05402
G1 X145.276 Y150.952 F30000
G1 F15476.087
G1 X151.374 Y157.05 E.28606
G1 X154.682 Y157.05 E.10975
G1 X189.044 Y122.688 E1.612
G1 X189.044 Y125.636 E.09782
G1 X168.95 Y105.543 E.94264
G1 X168.95 Y107.171 E.05401
; WIPE_START
G1 F24000
G1 X168.95 Y105.543 E-.61876
G1 X169.213 Y105.805 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.017 J-1.217 P1  F30000
G1 X116.199 Y105.05 Z4.4
G1 Z4
G1 E.8 F1800
G1 F15476.087
G1 X115.95 Y105.05 E.00824
G1 X115.95 Y103.67 E.04577
G1 X120.669 Y98.952 E.22134
G1 X123.98 Y98.952 E.10984
G1 X130.078 Y105.05 E.28606
G1 X129.922 Y105.05 E.00514
G1 X136.02 Y98.952 E.28605
G1 X139.332 Y98.952 E.10987
G1 X144.05 Y103.67 E.22131
G1 X144.05 Y102.042 E.05401
; WIPE_START
G1 F24000
G1 X144.05 Y103.67 E-.61876
G1 X143.787 Y103.407 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.09 J1.214 P1  F30000
G1 X152.45 Y102.766 Z4.4
G1 Z4
G1 E.8 F1800
G1 F15476.087
G1 X152.45 Y104.395 E.05401
G1 X153.105 Y105.05 E.03073
G1 X152.95 Y105.05 E.00514
G1 X159.047 Y98.953 E.28602
G1 X162.361 Y98.953 E.10991
G1 X168.457 Y105.05 E.28601
G1 X168.302 Y105.05 E.00514
G1 X174.399 Y98.953 E.286
G1 X177.713 Y98.953 E.10994
G1 X189.044 Y110.285 E.53157
G1 X189.044 Y107.336 E.09782
G1 X168.95 Y127.429 E.94264
G1 X168.95 Y128.571 E.03785
G1 X189.044 Y148.664 E.94264
G1 X189.044 Y145.715 E.09782
G1 X177.71 Y157.05 E.53171
G1 X174.402 Y157.05 E.10975
G1 X156.299 Y138.947 E.84924
G2 X158.392 Y133.365 I-27.335 J-13.436 E.19809
G1 X182.078 Y157.05 E1.11112
G2 X185.408 Y157.028 I1.45 J-33.052 E.11052
G1 X189.023 Y153.413 E.16961
G3 X188.185 Y155.481 I-4.104 J-.458 E.07497
G1 X165.654 Y132.95 E1.05697
G1 X163.429 Y132.95 E.0738
G1 X154.85 Y141.53 E.4025
G3 X153.354 Y143.678 I-22.54 J-14.109 E.08685
G1 X166.726 Y157.05 E.62731
G1 X170.034 Y157.05 E.10975
G1 X189.044 Y138.04 E.8918
G1 X189.044 Y140.988 E.09782
G1 X168.95 Y120.895 E.94264
G1 X168.95 Y119.754 E.03785
G1 X188.191 Y100.513 E.9026
G3 X189.023 Y102.587 I-3.951 J2.79 E.07482
G1 X185.408 Y98.972 E.16961
G2 X185.112 Y98.954 I-.252 J1.658 E.00985
G1 X182.074 Y98.953 E.10075
G1 X168.95 Y112.078 E.61568
G1 X168.95 Y113.219 E.03785
G1 X189.044 Y133.312 E.94264
G1 X189.044 Y130.364 E.09782
G1 X162.358 Y157.05 E1.2519
G1 X159.05 Y157.05 E.10975
G1 X149.673 Y147.673 E.43989
G3 X145.657 Y150.723 I-20.321 J-22.587 E.16745
G1 X139.33 Y157.05 E.29682
G1 X136.022 Y157.05 E.10975
G1 X133.947 Y154.975 E.09735
G1 X133.691 Y155.013 E.00856
G1 X131.654 Y157.05 E.09557
G1 X128.346 Y157.05 E.10975
G1 X126.309 Y155.013 E.09557
G1 X126.053 Y154.975 E.00856
G1 X123.978 Y157.05 E.09735
G1 X120.67 Y157.05 E.10975
G1 X114.343 Y150.723 E.29682
G3 X110.327 Y147.673 I16.306 J-25.637 E.16745
G1 X100.95 Y157.05 E.43989
G1 X97.642 Y157.05 E.10975
G1 X70.953 Y130.361 E1.25204
G1 X70.952 Y133.316 E.09803
G1 X91.05 Y113.219 E.9428
G1 X91.05 Y112.078 E.03785
G1 X77.923 Y98.95 E.61582
G2 X74.592 Y98.972 I-1.451 J33.042 E.11052
G1 X70.984 Y102.581 E.16929
G3 X71.809 Y100.513 I4.121 J.447 E.07477
G1 X91.05 Y119.754 E.9026
G1 X91.05 Y120.895 E.03785
G1 X70.952 Y140.993 E.94284
G1 X70.952 Y138.036 E.09808
G1 X89.966 Y157.05 E.89199
G1 X93.274 Y157.05 E.10975
G1 X106.646 Y143.678 E.62731
G3 X105.15 Y141.53 I21.046 J-16.258 E.08685
G1 X96.571 Y132.95 E.4025
G1 X94.346 Y132.95 E.0738
G1 X71.815 Y155.481 E1.05697
G3 X70.972 Y153.408 I3.32 J-2.557 E.07516
G1 X74.591 Y157.027 E.16979
G2 X77.922 Y157.05 I1.873 J-30.514 E.11056
G1 X101.608 Y133.365 E1.11112
G2 X103.701 Y138.947 I29.428 J-7.854 E.19809
G1 X85.598 Y157.05 E.84924
G1 X82.29 Y157.05 E.10975
G1 X70.951 Y145.711 E.53193
G1 X70.951 Y148.669 E.09814
G1 X91.05 Y128.571 E.94288
G1 X91.05 Y127.429 E.03785
G1 X70.955 Y107.335 E.94267
G1 X70.955 Y110.285 E.09786
G1 X82.29 Y98.951 E.53174
G1 X85.599 Y98.951 E.10976
G1 X91.698 Y105.05 E.28612
G1 X91.543 Y105.05 E.00515
G1 X97.641 Y98.951 E.2861
G1 X100.951 Y98.951 E.10979
G1 X107.05 Y105.05 E.2861
G1 X106.895 Y105.05 E.00515
G1 X107.55 Y104.395 E.03073
G1 X107.55 Y102.766 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X107.55 Y104.395 E-.61876
G1 X107.287 Y104.657 E-.14124
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
G3 Z4.4 I-.505 J1.107 P1  F30000
G1 X168.602 Y132.602 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X158.222 Y132.602 E.34434
G3 X101.778 Y132.602 I-28.222 J-6.723 E2.57322
G1 X91.398 Y132.602 E.34434
G1 X91.398 Y105.398 E.90241
G1 X107.898 Y105.398 E.54734
G1 X107.898 Y100.398 E.16586
G1 X115.602 Y100.398 E.25556
G1 X115.602 Y105.398 E.16586
G1 X144.398 Y105.398 E.95521
G1 X144.398 Y100.398 E.16586
G1 X152.102 Y100.398 E.25556
G1 X152.102 Y105.398 E.16586
G1 X168.602 Y105.398 E.54734
G1 X168.602 Y132.542 E.90042
G1 X168.21 Y132.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.915 Y132.21 E.31635
G3 X102.085 Y132.21 I-27.915 J-6.336 E2.37055
G1 X91.79 Y132.21 E.31635
G1 X91.79 Y105.79 E.81181
G1 X108.29 Y105.79 E.507
G1 X108.29 Y100.79 E.15364
G1 X115.21 Y100.79 E.21263
G1 X115.21 Y105.79 E.15364
G1 X144.79 Y105.79 E.90891
G1 X144.79 Y100.79 E.15364
G1 X151.71 Y100.79 E.21263
G1 X151.71 Y105.79 E.15364
G1 X168.21 Y105.79 E.507
G1 X168.21 Y132.15 E.80997
M204 S10000
; WIPE_START
G1 F24000
G1 X166.21 Y132.162 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.36 J-1.163 P1  F30000
G1 X70.624 Y102.569 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X75.007 Y98.602 I4.389 J.444 E.2149
G1 X185.129 Y98.605 E3.65293
G3 X189.398 Y103.007 I-.14 J4.407 E.22493
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.402 J.004 E.2296
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I-.004 J-4.401 E.22961
G1 X70.602 Y103.007 E1.6581
G3 X70.619 Y102.629 I4.411 J.006 E.01258
G1 X70.232 Y102.547 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.236 Y102.531 E.00051
G3 X70.844 Y100.621 I4.914 J.512 E.062
G1 X70.844 Y100.621 E0
G3 X75.003 Y98.21 I4.168 J2.396 E.15468
G1 X185.139 Y98.213 E3.38417
G3 X189.79 Y103.003 I-.151 J4.8 E.22682
G1 X189.79 Y152.997 E1.5362
G3 X186.522 Y157.54 I-4.811 J-.014 E.18351
G1 X186.522 Y157.54 E0
G3 X184.997 Y157.79 I-1.536 J-4.596 E.04768
G1 X75.003 Y157.79 E3.37983
G3 X70.844 Y155.379 I.001 J-4.794 E.15473
G1 X70.844 Y155.379 E0
G3 X70.21 Y152.997 I4.177 J-2.387 E.07657
G1 X70.21 Y103.003 E1.5362
G1 X70.229 Y102.607 E.01217
M204 S10000
; WIPE_START
G1 F24000
G1 X70.236 Y102.531 E-.02901
G1 X70.354 Y101.836 E-.26771
G1 X70.575 Y101.167 E-.2678
G1 X70.802 Y100.706 E-.19548
; WIPE_END
M73 P51 R20
G1 E-.04 F1800
G17
G3 Z4.6 I-.37 J1.159 P1  F30000
G1 X91.05 Y107.171 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X91.05 Y105.543 E.05401
G1 X70.953 Y125.639 E.94276
G1 X70.954 Y122.685 E.09797
G1 X105.318 Y157.05 E1.6121
G1 X108.626 Y157.05 E.10975
G1 X114.724 Y150.952 E.28606
G1 X121.447 Y153.965 F30000
G1 F15476.087
G3 X119.903 Y153.448 I4.471 J-15.924 E.05402
G1 X116.302 Y157.05 E.16894
G1 X112.994 Y157.05 E.10975
G1 X70.954 Y115.01 E1.97215
G1 X70.954 Y117.962 E.09792
G1 X89.966 Y98.951 E.89186
G1 X93.275 Y98.951 E.10978
G1 X99.374 Y105.05 E.28611
G1 X99.219 Y105.05 E.00515
G1 X105.317 Y98.951 E.28609
G1 X108.627 Y98.951 E.10981
G1 X109.726 Y100.05 E.05152
G1 X111.895 Y100.05 E.07195
G1 X112.993 Y98.951 E.05152
G1 X116.304 Y98.952 E.10983
G1 X122.402 Y105.05 E.28607
G1 X122.246 Y105.05 E.00514
G1 X128.344 Y98.952 E.28606
G1 X131.656 Y98.952 E.10986
G1 X137.754 Y105.05 E.28605
G1 X137.598 Y105.05 E.00514
G1 X143.696 Y98.952 E.28603
G1 X147.008 Y98.953 E.10989
G1 X148.105 Y100.05 E.05147
G1 X150.274 Y100.05 E.07195
G1 X151.371 Y98.953 E.05146
G1 X154.685 Y98.953 E.1099
G1 X160.781 Y105.05 E.28602
G1 X160.626 Y105.05 E.00514
G1 X166.723 Y98.953 E.286
G1 X170.037 Y98.953 E.10993
G1 X189.044 Y117.96 E.89167
G1 X189.044 Y115.012 E.09782
G1 X147.006 Y157.05 E1.97209
G1 X143.698 Y157.05 E.10975
G1 X140.097 Y153.448 E.16894
G3 X138.553 Y153.965 I-6.015 J-15.408 E.05402
G1 X145.276 Y150.952 F30000
G1 F15476.087
G1 X151.374 Y157.05 E.28606
G1 X154.682 Y157.05 E.10975
G1 X189.044 Y122.688 E1.612
G1 X189.044 Y125.636 E.09782
G1 X168.95 Y105.543 E.94264
G1 X168.95 Y107.171 E.05401
; WIPE_START
G1 F24000
G1 X168.95 Y105.543 E-.61876
G1 X169.213 Y105.805 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.017 J-1.217 P1  F30000
G1 X116.199 Y105.05 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F15476.087
G1 X115.95 Y105.05 E.00824
G1 X115.95 Y103.67 E.04577
G1 X120.668 Y98.952 E.22134
G1 X123.98 Y98.952 E.10984
G1 X130.078 Y105.05 E.28606
G1 X129.922 Y105.05 E.00514
G1 X136.02 Y98.952 E.28604
G1 X139.332 Y98.952 E.10987
G1 X144.05 Y103.67 E.22131
G1 X144.05 Y102.042 E.05401
; WIPE_START
G1 F24000
G1 X144.05 Y103.67 E-.61876
G1 X143.787 Y103.407 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.09 J1.214 P1  F30000
G1 X152.45 Y102.766 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F15476.087
G1 X152.45 Y104.395 E.05401
G1 X153.105 Y105.05 E.03073
G1 X152.95 Y105.05 E.00514
G1 X159.047 Y98.953 E.28601
G1 X162.361 Y98.953 E.10992
G1 X168.457 Y105.05 E.28601
G1 X168.302 Y105.05 E.00514
G1 X174.399 Y98.953 E.28599
G1 X177.713 Y98.953 E.10995
G1 X189.044 Y110.285 E.53156
G1 X189.044 Y107.336 E.09782
G1 X168.95 Y127.429 E.94264
G1 X168.95 Y128.571 E.03785
G1 X189.044 Y148.664 E.94264
G1 X189.044 Y145.715 E.09782
G1 X177.71 Y157.05 E.53171
G1 X174.402 Y157.05 E.10975
G1 X156.299 Y138.947 E.84924
G2 X158.392 Y133.365 I-27.335 J-13.436 E.19809
G1 X182.078 Y157.05 E1.11112
G2 X185.408 Y157.028 I1.45 J-33.052 E.11052
G1 X189.023 Y153.413 E.16961
G3 X188.185 Y155.481 I-4.104 J-.458 E.07497
G1 X165.654 Y132.95 E1.05697
G1 X163.429 Y132.95 E.0738
G1 X154.85 Y141.53 E.4025
G3 X153.354 Y143.678 I-22.54 J-14.109 E.08685
G1 X166.726 Y157.05 E.62731
G1 X170.034 Y157.05 E.10975
G1 X189.044 Y138.04 E.8918
G1 X189.044 Y140.988 E.09782
G1 X168.95 Y120.895 E.94264
G1 X168.95 Y119.754 E.03785
G1 X188.191 Y100.513 E.9026
G3 X189.023 Y102.587 I-3.951 J2.79 E.07482
G1 X185.408 Y98.972 E.16961
G2 X185.119 Y98.954 I-.249 J1.634 E.00962
G1 X182.074 Y98.954 E.10098
G1 X168.95 Y112.078 E.61567
G1 X168.95 Y113.219 E.03785
G1 X189.044 Y133.312 E.94264
G1 X189.044 Y130.364 E.09782
G1 X162.358 Y157.05 E1.2519
G1 X159.05 Y157.05 E.10975
G1 X149.673 Y147.673 E.43989
G3 X145.657 Y150.723 I-20.322 J-22.588 E.16745
G1 X139.33 Y157.05 E.29682
G1 X136.022 Y157.05 E.10975
G1 X133.947 Y154.975 E.09735
G1 X133.691 Y155.013 E.00856
G1 X131.654 Y157.05 E.09557
G1 X128.346 Y157.05 E.10975
G1 X126.309 Y155.013 E.09557
G1 X126.053 Y154.975 E.00856
G1 X123.978 Y157.05 E.09735
G1 X120.67 Y157.05 E.10975
G1 X114.343 Y150.723 E.29682
G3 X110.327 Y147.673 I16.306 J-25.637 E.16745
G1 X100.95 Y157.05 E.43989
G1 X97.642 Y157.05 E.10975
G1 X70.953 Y130.361 E1.25204
G1 X70.952 Y133.316 E.09803
G1 X91.05 Y113.219 E.9428
G1 X91.05 Y112.078 E.03785
G1 X77.923 Y98.95 E.61582
G2 X74.592 Y98.972 I-1.451 J33.031 E.11052
G1 X70.984 Y102.581 E.16929
G3 X71.815 Y100.519 I4.025 J.424 E.07471
G1 X91.05 Y119.754 E.90234
G1 X91.05 Y120.895 E.03785
G1 X70.952 Y140.993 E.94284
G1 X70.952 Y138.036 E.09808
G1 X89.966 Y157.05 E.89198
G1 X93.274 Y157.05 E.10975
G1 X106.646 Y143.678 E.62731
G3 X105.15 Y141.53 I21.046 J-16.258 E.08685
G1 X96.571 Y132.95 E.4025
G1 X94.346 Y132.95 E.0738
G1 X71.815 Y155.481 E1.05697
G3 X70.972 Y153.408 I3.32 J-2.557 E.07516
G1 X74.591 Y157.027 E.16979
G2 X77.922 Y157.05 I1.873 J-30.52 E.11056
G1 X101.608 Y133.365 E1.11112
G2 X103.701 Y138.947 I29.428 J-7.854 E.19809
G1 X85.598 Y157.05 E.84924
G1 X82.29 Y157.05 E.10975
G1 X70.951 Y145.711 E.53193
G1 X70.951 Y148.669 E.09814
G1 X91.05 Y128.571 E.94288
G1 X91.05 Y127.429 E.03785
G1 X70.955 Y107.335 E.94267
G1 X70.955 Y110.285 E.09786
G1 X82.29 Y98.951 E.53174
G1 X85.599 Y98.951 E.10976
G1 X91.698 Y105.05 E.28612
G1 X91.543 Y105.05 E.00515
G1 X97.641 Y98.951 E.2861
G1 X100.951 Y98.951 E.1098
G1 X107.05 Y105.05 E.28609
G1 X106.895 Y105.05 E.00515
G1 X107.55 Y104.395 E.03073
G1 X107.55 Y102.766 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X107.55 Y104.395 E-.61876
G1 X107.287 Y104.657 E-.14124
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
G3 Z4.6 I-.505 J1.107 P1  F30000
G1 X168.602 Y132.602 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X158.222 Y132.602 E.34434
G3 X101.778 Y132.602 I-28.222 J-6.721 E2.57333
G1 X91.398 Y132.602 E.34434
G1 X91.398 Y105.398 E.90241
G1 X107.898 Y105.398 E.54734
G1 X107.898 Y100.398 E.16586
G1 X115.602 Y100.398 E.25556
G1 X115.602 Y105.398 E.16586
G1 X144.398 Y105.398 E.95521
G1 X144.398 Y100.398 E.16586
G1 X152.102 Y100.398 E.25556
G1 X152.102 Y105.398 E.16586
G1 X168.602 Y105.398 E.54734
G1 X168.602 Y132.542 E.90042
G1 X168.21 Y132.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.915 Y132.21 E.31635
G3 X102.085 Y132.21 I-27.915 J-6.334 E2.37066
G1 X91.79 Y132.21 E.31635
G1 X91.79 Y105.79 E.81181
G1 X108.29 Y105.79 E.507
G1 X108.29 Y100.79 E.15364
G1 X115.21 Y100.79 E.21263
G1 X115.21 Y105.79 E.15364
G1 X144.79 Y105.79 E.90891
G1 X144.79 Y100.79 E.15364
G1 X151.71 Y100.79 E.21263
G1 X151.71 Y105.79 E.15364
G1 X168.21 Y105.79 E.507
G1 X168.21 Y132.15 E.80997
M204 S10000
; WIPE_START
G1 F24000
G1 X166.21 Y132.162 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.36 J-1.163 P1  F30000
G1 X70.624 Y102.569 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X75.007 Y98.602 I4.389 J.444 E.2149
G1 X185.136 Y98.606 E3.65316
G3 X189.398 Y103.007 I-.147 J4.407 E.2247
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.411 J-.006 E.22946
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I-.004 J-4.402 E.2296
G1 X70.602 Y103.007 E1.6581
G3 X70.619 Y102.629 I4.411 J.006 E.01258
G1 X70.243 Y102.548 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.264 Y102.298 E.00771
G3 X73.525 Y98.444 I4.757 J.72 E.16327
G1 X73.525 Y98.444 E0
G3 X75.003 Y98.21 I1.489 J4.615 E.04617
G1 X185.146 Y98.214 E3.38439
G3 X189.79 Y103.003 I-.158 J4.8 E.22661
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.804 J-.012 E.23117
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.012 J-4.804 E.23117
G1 X70.21 Y103.003 E1.5362
G1 X70.239 Y102.608 E.01217
M204 S10000
; WIPE_START
G1 F24000
G1 X70.264 Y102.298 E-.11819
G1 X70.416 Y101.61 E-.26773
G1 X70.67 Y100.952 E-.26781
G1 X70.802 Y100.705 E-.10626
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.37 J1.159 P1  F30000
G1 X91.05 Y107.171 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X91.05 Y105.543 E.05401
G1 X70.953 Y125.639 E.94276
G1 X70.954 Y122.685 E.09797
G1 X105.318 Y157.05 E1.6121
G1 X108.626 Y157.05 E.10975
G1 X114.724 Y150.952 E.28606
G1 X121.447 Y153.965 F30000
G1 F15476.087
G3 X119.903 Y153.448 I4.471 J-15.924 E.05402
G1 X116.302 Y157.05 E.16894
G1 X112.994 Y157.05 E.10975
G1 X70.954 Y115.01 E1.97215
G1 X70.954 Y117.962 E.09792
G1 X89.965 Y98.951 E.89186
G1 X93.275 Y98.951 E.10978
G1 X99.374 Y105.05 E.2861
G1 X99.219 Y105.05 E.00515
G1 X105.317 Y98.951 E.28609
G1 X108.627 Y98.951 E.10981
G1 X109.726 Y100.05 E.05152
G1 X111.895 Y100.05 E.07195
G1 X112.993 Y98.952 E.05151
G1 X116.304 Y98.952 E.10983
G1 X122.402 Y105.05 E.28607
G1 X122.246 Y105.05 E.00514
G1 X128.344 Y98.952 E.28605
G1 X131.656 Y98.952 E.10986
G1 X137.754 Y105.05 E.28605
G1 X137.598 Y105.05 E.00514
G1 X143.696 Y98.953 E.28603
G1 X147.008 Y98.953 E.1099
G1 X148.105 Y100.05 E.05146
G1 X150.274 Y100.05 E.07195
G1 X151.371 Y98.953 E.05146
G1 X154.685 Y98.953 E.10991
G1 X160.781 Y105.05 E.28601
G1 X160.626 Y105.05 E.00514
G1 X166.723 Y98.953 E.28599
G1 X170.037 Y98.953 E.10994
G1 X189.044 Y117.96 E.89166
G1 X189.044 Y115.012 E.09782
G1 X147.006 Y157.05 E1.97209
G1 X143.698 Y157.05 E.10975
G1 X140.097 Y153.448 E.16894
G3 X138.553 Y153.965 I-6.015 J-15.408 E.05402
G1 X145.276 Y150.952 F30000
G1 F15476.087
G1 X151.374 Y157.05 E.28606
G1 X154.682 Y157.05 E.10975
G1 X189.044 Y122.688 E1.612
G1 X189.044 Y125.636 E.09782
G1 X168.95 Y105.543 E.94264
G1 X168.95 Y107.171 E.05401
; WIPE_START
G1 F24000
G1 X168.95 Y105.543 E-.61876
G1 X169.213 Y105.805 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.017 J-1.217 P1  F30000
G1 X116.199 Y105.05 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F15476.087
G1 X115.95 Y105.05 E.00824
G1 X115.95 Y103.67 E.04577
G1 X120.668 Y98.952 E.22133
G1 X123.98 Y98.952 E.10985
G1 X130.078 Y105.05 E.28606
G1 X129.922 Y105.05 E.00514
G1 X136.02 Y98.952 E.28604
G1 X139.332 Y98.952 E.10988
G1 X144.05 Y103.67 E.2213
G1 X144.05 Y102.042 E.05401
; WIPE_START
G1 F24000
G1 X144.05 Y103.67 E-.61876
G1 X143.787 Y103.407 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.09 J1.214 P1  F30000
G1 X152.45 Y102.766 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F15476.087
G1 X152.45 Y104.395 E.05401
G1 X153.105 Y105.05 E.03073
G1 X152.95 Y105.05 E.00514
G1 X159.047 Y98.953 E.28601
G1 X162.361 Y98.953 E.10993
G1 X168.457 Y105.05 E.286
G1 X168.302 Y105.05 E.00514
G1 X174.398 Y98.954 E.28598
G1 X177.713 Y98.954 E.10996
G1 X189.044 Y110.285 E.53156
G1 X189.044 Y107.336 E.09782
G1 X168.95 Y127.429 E.94264
G1 X168.95 Y128.571 E.03785
G1 X189.044 Y148.664 E.94264
G1 X189.044 Y145.715 E.09782
G1 X177.71 Y157.05 E.53171
G1 X174.402 Y157.05 E.10975
G1 X156.299 Y138.947 E.84924
G2 X158.392 Y133.365 I-27.335 J-13.436 E.19809
M73 P52 R20
G1 X182.078 Y157.05 E1.11112
G2 X185.408 Y157.028 I1.45 J-33.052 E.11052
G1 X189.023 Y153.413 E.16961
G3 X188.185 Y155.481 I-4.104 J-.458 E.07497
G1 X165.654 Y132.95 E1.05697
G1 X163.429 Y132.95 E.0738
G1 X154.85 Y141.53 E.4025
G3 X153.354 Y143.678 I-22.539 J-14.109 E.08685
G1 X166.726 Y157.05 E.62731
G1 X170.034 Y157.05 E.10975
G1 X189.044 Y138.04 E.8918
G1 X189.044 Y140.988 E.09782
G1 X168.95 Y120.895 E.94264
G1 X168.95 Y119.754 E.03785
G1 X188.191 Y100.513 E.9026
G3 X189.023 Y102.587 I-3.951 J2.79 E.07482
G1 X185.408 Y98.972 E.16961
G2 X185.125 Y98.954 I-.245 J1.61 E.00939
G1 X182.074 Y98.954 E.10122
G1 X168.95 Y112.078 E.61566
G1 X168.95 Y113.219 E.03785
G1 X189.044 Y133.312 E.94264
G1 X189.044 Y130.364 E.09782
G1 X162.358 Y157.05 E1.2519
G1 X159.05 Y157.05 E.10975
G1 X149.673 Y147.673 E.43989
G3 X145.657 Y150.723 I-20.322 J-22.588 E.16745
G1 X139.33 Y157.05 E.29682
G1 X136.022 Y157.05 E.10975
G1 X133.947 Y154.975 E.09735
G1 X133.691 Y155.013 E.00856
G1 X131.654 Y157.05 E.09557
G1 X128.346 Y157.05 E.10975
G1 X126.309 Y155.013 E.09557
G1 X126.053 Y154.975 E.00856
G1 X123.978 Y157.05 E.09735
G1 X120.67 Y157.05 E.10975
G1 X114.343 Y150.723 E.29682
G3 X110.327 Y147.673 I16.306 J-25.637 E.16745
G1 X100.95 Y157.05 E.43989
G1 X97.642 Y157.05 E.10975
G1 X70.953 Y130.361 E1.25204
G1 X70.952 Y133.316 E.09803
G1 X91.05 Y113.219 E.9428
G1 X91.05 Y112.078 E.03785
G1 X77.923 Y98.95 E.61582
G2 X74.592 Y98.972 I-1.451 J33.04 E.11052
G1 X70.984 Y102.581 E.16929
G3 X71.809 Y100.513 I4.121 J.447 E.07477
G1 X91.05 Y119.754 E.9026
G1 X91.05 Y120.895 E.03785
G1 X70.952 Y140.993 E.94284
G1 X70.952 Y138.036 E.09808
G1 X89.966 Y157.05 E.89198
G1 X93.274 Y157.05 E.10975
G1 X106.646 Y143.678 E.62731
G3 X105.15 Y141.53 I21.046 J-16.258 E.08685
G1 X96.571 Y132.95 E.4025
G1 X94.346 Y132.95 E.0738
G1 X71.815 Y155.481 E1.05697
G3 X70.972 Y153.408 I3.32 J-2.557 E.07516
G1 X74.591 Y157.027 E.16979
G2 X77.922 Y157.05 I1.873 J-30.52 E.11056
G1 X101.608 Y133.365 E1.11112
G2 X103.701 Y138.947 I29.428 J-7.854 E.19809
G1 X85.598 Y157.05 E.84924
G1 X82.29 Y157.05 E.10975
G1 X70.951 Y145.711 E.53193
G1 X70.951 Y148.669 E.09814
G1 X91.05 Y128.571 E.94288
G1 X91.05 Y127.429 E.03785
G1 X70.955 Y107.335 E.94267
G1 X70.955 Y110.285 E.09786
G1 X82.29 Y98.951 E.53174
G1 X85.599 Y98.951 E.10977
G1 X91.698 Y105.05 E.28612
G1 X91.543 Y105.05 E.00515
G1 X97.641 Y98.951 E.2861
G1 X100.951 Y98.951 E.1098
G1 X107.05 Y105.05 E.28609
G1 X106.895 Y105.05 E.00515
G1 X107.55 Y104.395 E.03073
G1 X107.55 Y102.766 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X107.55 Y104.395 E-.61876
G1 X107.287 Y104.657 E-.14124
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
G3 Z4.8 I-.505 J1.107 P1  F30000
G1 X168.602 Y132.602 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X158.222 Y132.602 E.34434
G3 X101.778 Y132.602 I-28.222 J-6.721 E2.5733
G1 X91.398 Y132.602 E.34434
G1 X91.398 Y105.398 E.90241
G1 X107.898 Y105.398 E.54734
G1 X107.898 Y100.398 E.16586
G1 X115.602 Y100.398 E.25556
G1 X115.602 Y105.398 E.16586
G1 X144.398 Y105.398 E.95521
G1 X144.398 Y100.398 E.16586
G1 X152.102 Y100.398 E.25556
G1 X152.102 Y105.398 E.16586
G1 X168.602 Y105.398 E.54734
G1 X168.602 Y132.542 E.90042
G1 X168.21 Y132.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.915 Y132.21 E.31635
G3 X102.085 Y132.21 I-27.915 J-6.335 E2.37063
G1 X91.79 Y132.21 E.31635
G1 X91.79 Y105.79 E.81181
G1 X108.29 Y105.79 E.507
G1 X108.29 Y100.79 E.15364
G1 X115.21 Y100.79 E.21263
G1 X115.21 Y105.79 E.15364
G1 X144.79 Y105.79 E.90891
G1 X144.79 Y100.79 E.15364
G1 X151.71 Y100.79 E.21263
G1 X151.71 Y105.79 E.15364
G1 X168.21 Y105.79 E.507
G1 X168.21 Y132.15 E.80997
M204 S10000
; WIPE_START
G1 F24000
G1 X166.21 Y132.162 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.36 J-1.163 P1  F30000
G1 X70.624 Y102.569 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X75.007 Y98.602 I4.38 J.435 E.21503
G1 X185.143 Y98.606 E3.6534
G3 X189.398 Y103.007 I-.154 J4.407 E.22446
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.402 J.004 E.2296
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I-.004 J-4.402 E.2296
G1 X70.602 Y103.007 E1.6581
G3 X70.618 Y102.629 I4.402 J-.004 E.01258
G1 X70.232 Y102.547 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.233 Y102.531 E.0005
G3 X75.003 Y98.21 I4.77 J.473 E.21678
G1 X185.153 Y98.214 E3.3846
G3 X189.79 Y103.003 I-.165 J4.8 E.22639
G1 X189.79 Y152.997 E1.5362
G3 X186.535 Y157.536 I-4.806 J-.011 E.18311
G1 X186.535 Y157.536 E0
G3 X184.997 Y157.79 I-1.549 J-4.594 E.04811
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.001 J-4.794 E.23131
G1 X70.21 Y103.003 E1.5362
G1 X70.229 Y102.607 E.01218
M204 S10000
; WIPE_START
G1 F24000
G1 X70.233 Y102.531 E-.02902
G1 X70.302 Y102.066 E-.17861
G1 X70.416 Y101.61 E-.17862
G1 X70.575 Y101.167 E-.17864
G1 X70.776 Y100.742 E-.17863
G1 X70.798 Y100.705 E-.01648
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.37 J1.159 P1  F30000
G1 X91.05 Y107.171 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X91.05 Y105.543 E.05401
G1 X70.953 Y125.639 E.94276
G1 X70.954 Y122.685 E.09797
G1 X105.318 Y157.05 E1.6121
G1 X108.626 Y157.05 E.10975
G1 X114.724 Y150.952 E.28606
G1 X121.447 Y153.965 F30000
G1 F15476.087
G3 X119.903 Y153.448 I4.471 J-15.924 E.05402
G1 X116.302 Y157.05 E.16894
G1 X112.994 Y157.05 E.10975
G1 X70.954 Y115.01 E1.97215
G1 X70.954 Y117.962 E.09792
G1 X89.965 Y98.951 E.89186
G1 X93.275 Y98.951 E.10978
G1 X99.374 Y105.05 E.2861
G1 X99.219 Y105.05 E.00515
G1 X105.317 Y98.951 E.28608
G1 X108.627 Y98.951 E.10982
G1 X109.726 Y100.05 E.05152
G1 X111.895 Y100.05 E.07195
G1 X112.993 Y98.952 E.05151
G1 X116.304 Y98.952 E.10983
G1 X122.402 Y105.05 E.28607
G1 X122.246 Y105.05 E.00514
G1 X128.344 Y98.952 E.28605
G1 X131.656 Y98.952 E.10987
G1 X137.754 Y105.05 E.28604
G1 X137.598 Y105.05 E.00514
G1 X143.695 Y98.953 E.28602
G1 X147.009 Y98.953 E.1099
G1 X148.105 Y100.05 E.05146
G1 X150.274 Y100.05 E.07195
G1 X151.371 Y98.953 E.05145
G1 X154.685 Y98.953 E.10992
G1 X160.781 Y105.05 E.28601
G1 X160.626 Y105.05 E.00514
G1 X166.723 Y98.953 E.28599
G1 X170.037 Y98.954 E.10995
G1 X189.044 Y117.96 E.89166
G1 X189.044 Y115.012 E.09782
G1 X147.006 Y157.05 E1.97209
G1 X143.698 Y157.05 E.10975
G1 X140.097 Y153.448 E.16894
G3 X138.553 Y153.965 I-6.015 J-15.408 E.05402
G1 X145.276 Y150.952 F30000
G1 F15476.087
G1 X151.374 Y157.05 E.28606
G1 X154.682 Y157.05 E.10975
G1 X189.044 Y122.688 E1.612
G1 X189.044 Y125.636 E.09782
G1 X168.95 Y105.543 E.94264
G1 X168.95 Y107.171 E.05401
; WIPE_START
G1 F24000
G1 X168.95 Y105.543 E-.61876
G1 X169.213 Y105.805 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.017 J-1.217 P1  F30000
G1 X116.199 Y105.05 Z5
G1 Z4.6
G1 E.8 F1800
G1 F15476.087
G1 X115.95 Y105.05 E.00824
G1 X115.95 Y103.67 E.04577
G1 X120.668 Y98.952 E.22133
G1 X123.98 Y98.952 E.10985
G1 X130.078 Y105.05 E.28605
G1 X129.922 Y105.05 E.00514
G1 X136.02 Y98.952 E.28604
G1 X139.332 Y98.953 E.10989
G1 X144.05 Y103.67 E.2213
G1 X144.05 Y102.042 E.05401
; WIPE_START
G1 F24000
G1 X144.05 Y103.67 E-.61876
G1 X143.787 Y103.407 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.09 J1.214 P1  F30000
G1 X152.45 Y102.766 Z5
G1 Z4.6
G1 E.8 F1800
G1 F15476.087
G1 X152.45 Y104.395 E.05401
G1 X153.105 Y105.05 E.03073
G1 X152.95 Y105.05 E.00514
G1 X159.047 Y98.953 E.286
G1 X162.361 Y98.953 E.10994
G1 X168.457 Y105.05 E.28599
G1 X168.302 Y105.05 E.00514
G1 X174.398 Y98.954 E.28597
G1 X177.713 Y98.954 E.10997
G1 X189.044 Y110.285 E.53155
G1 X189.044 Y107.336 E.09782
G1 X168.95 Y127.429 E.94264
G1 X168.95 Y128.571 E.03785
G1 X189.044 Y148.664 E.94264
G1 X189.044 Y145.715 E.09782
G1 X177.71 Y157.05 E.53171
G1 X174.402 Y157.05 E.10975
G1 X156.299 Y138.947 E.84924
G2 X158.392 Y133.365 I-27.335 J-13.436 E.19809
G1 X182.078 Y157.05 E1.11112
G2 X185.408 Y157.028 I1.45 J-33.052 E.11052
G1 X189.023 Y153.413 E.16961
G3 X188.185 Y155.481 I-4.104 J-.458 E.07497
M73 P52 R19
G1 X165.654 Y132.95 E1.05697
G1 X163.429 Y132.95 E.0738
G1 X154.85 Y141.53 E.4025
G3 X153.354 Y143.678 I-22.54 J-14.109 E.08685
G1 X166.726 Y157.05 E.62731
G1 X170.034 Y157.05 E.10975
G1 X189.044 Y138.04 E.8918
G1 X189.044 Y140.988 E.09782
G1 X168.95 Y120.895 E.94264
G1 X168.95 Y119.754 E.03785
G1 X188.191 Y100.513 E.9026
G3 X189.023 Y102.587 I-3.951 J2.79 E.07482
G1 X185.408 Y98.972 E.16961
G2 X185.132 Y98.954 I-.242 J1.587 E.00917
G1 X182.074 Y98.954 E.10145
G1 X168.95 Y112.078 E.61566
G1 X168.95 Y113.219 E.03785
G1 X189.044 Y133.312 E.94264
G1 X189.044 Y130.364 E.09782
G1 X162.358 Y157.05 E1.2519
G1 X159.05 Y157.05 E.10975
G1 X149.673 Y147.673 E.43989
G3 X145.657 Y150.723 I-20.321 J-22.588 E.16745
G1 X139.33 Y157.05 E.29682
G1 X136.022 Y157.05 E.10975
G1 X133.947 Y154.975 E.09735
G1 X133.691 Y155.013 E.00856
G1 X131.654 Y157.05 E.09557
G1 X128.346 Y157.05 E.10975
G1 X126.309 Y155.013 E.09557
G1 X126.053 Y154.975 E.00856
G1 X123.978 Y157.05 E.09735
G1 X120.67 Y157.05 E.10975
G1 X114.343 Y150.723 E.29682
G3 X110.327 Y147.673 I16.306 J-25.637 E.16745
G1 X100.95 Y157.05 E.43989
G1 X97.642 Y157.05 E.10975
G1 X70.953 Y130.361 E1.25204
G1 X70.952 Y133.316 E.09803
G1 X91.05 Y113.219 E.9428
G1 X91.05 Y112.078 E.03785
G1 X77.923 Y98.95 E.61582
G2 X74.592 Y98.972 I-1.451 J33.033 E.11052
G1 X70.984 Y102.581 E.16929
G3 X71.815 Y100.519 I4.025 J.424 E.07471
G1 X91.05 Y119.754 E.90234
G1 X91.05 Y120.895 E.03785
G1 X70.952 Y140.993 E.94284
G1 X70.952 Y138.036 E.09808
G1 X89.966 Y157.05 E.89199
G1 X93.274 Y157.05 E.10975
G1 X106.646 Y143.678 E.62731
G3 X105.15 Y141.53 I21.046 J-16.258 E.08685
G1 X96.571 Y132.95 E.4025
G1 X94.346 Y132.95 E.0738
G1 X71.815 Y155.481 E1.05697
G3 X70.972 Y153.408 I3.32 J-2.557 E.07516
G1 X74.591 Y157.027 E.16979
G2 X77.922 Y157.05 I1.873 J-30.516 E.11056
G1 X101.608 Y133.365 E1.11112
G2 X103.701 Y138.947 I29.428 J-7.854 E.19809
G1 X85.598 Y157.05 E.84924
G1 X82.29 Y157.05 E.10975
G1 X70.951 Y145.711 E.53193
G1 X70.951 Y148.669 E.09814
G1 X91.05 Y128.571 E.94288
G1 X91.05 Y127.429 E.03785
G1 X70.955 Y107.335 E.94267
G1 X70.955 Y110.285 E.09786
G1 X82.29 Y98.951 E.53174
G1 X85.599 Y98.951 E.10977
G1 X91.698 Y105.05 E.28611
G1 X91.543 Y105.05 E.00515
G1 X97.641 Y98.951 E.2861
G1 X100.951 Y98.951 E.1098
G1 X107.05 Y105.05 E.28609
G1 X106.895 Y105.05 E.00515
G1 X107.55 Y104.395 E.03073
G1 X107.55 Y102.766 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X107.55 Y104.395 E-.61876
G1 X107.287 Y104.657 E-.14124
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
G3 Z5 I-.505 J1.107 P1  F30000
G1 X168.602 Y132.602 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X158.222 Y132.602 E.34434
G3 X101.778 Y132.602 I-28.222 J-6.722 E2.57327
G1 X91.398 Y132.602 E.34434
G1 X91.398 Y105.398 E.90241
G1 X107.898 Y105.398 E.54734
G1 X107.898 Y100.398 E.16586
G1 X115.602 Y100.398 E.25556
G1 X115.602 Y105.398 E.16586
G1 X144.398 Y105.398 E.95521
G1 X144.398 Y100.398 E.16586
G1 X152.102 Y100.398 E.25556
G1 X152.102 Y105.398 E.16586
G1 X168.602 Y105.398 E.54734
G1 X168.602 Y132.542 E.90042
G1 X168.21 Y132.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.915 Y132.21 E.31635
G3 X102.085 Y132.21 I-27.915 J-6.335 E2.3706
G1 X91.79 Y132.21 E.31635
G1 X91.79 Y105.79 E.81181
G1 X108.29 Y105.79 E.507
G1 X108.29 Y100.79 E.15364
G1 X115.21 Y100.79 E.21263
G1 X115.21 Y105.79 E.15364
G1 X144.79 Y105.79 E.90891
G1 X144.79 Y100.79 E.15364
G1 X151.71 Y100.79 E.21263
G1 X151.71 Y105.79 E.15364
G1 X168.21 Y105.79 E.507
G1 X168.21 Y132.15 E.80997
M204 S10000
; WIPE_START
G1 F24000
G1 X166.21 Y132.162 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.36 J-1.163 P1  F30000
G1 X70.624 Y102.569 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X75.007 Y98.602 I4.38 J.435 E.21503
G1 X185.15 Y98.606 E3.65363
G3 X189.398 Y103.007 I-.162 J4.407 E.22423
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.402 J.004 E.2296
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I.006 J-4.411 E.22946
G1 X70.602 Y103.007 E1.6581
G3 X70.618 Y102.629 I4.402 J-.004 E.01258
G1 X70.243 Y102.548 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.264 Y102.297 E.00771
G3 X73.538 Y98.44 I4.757 J.719 E.1637
G1 X73.538 Y98.44 E0
G3 X75.003 Y98.21 I1.477 J4.624 E.04574
G1 X185.16 Y98.214 E3.38482
M73 P53 R19
G3 X189.79 Y103.003 I-.172 J4.799 E.22618
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.802 J-.009 E.2312
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.012 J-4.804 E.23117
G1 X70.21 Y103.003 E1.5362
G1 X70.239 Y102.607 E.01217
M204 S10000
; WIPE_START
G1 F24000
G1 X70.264 Y102.297 E-.11818
G1 X70.416 Y101.61 E-.26773
G1 X70.67 Y100.952 E-.26781
G1 X70.802 Y100.705 E-.10628
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.37 J1.159 P1  F30000
G1 X91.05 Y107.171 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X91.05 Y105.543 E.05401
G1 X70.953 Y125.639 E.94276
G1 X70.954 Y122.685 E.09797
G1 X105.318 Y157.05 E1.6121
G1 X108.626 Y157.05 E.10975
G1 X114.724 Y150.952 E.28606
G1 X121.447 Y153.965 F30000
G1 F15476.087
G3 X119.903 Y153.448 I4.471 J-15.924 E.05402
G1 X116.302 Y157.05 E.16894
G1 X112.994 Y157.05 E.10975
G1 X70.954 Y115.01 E1.97215
G1 X70.954 Y117.962 E.09792
G1 X89.965 Y98.951 E.89186
G1 X93.275 Y98.951 E.10979
G1 X99.374 Y105.05 E.2861
G1 X99.219 Y105.05 E.00515
G1 X105.317 Y98.951 E.28608
G1 X108.627 Y98.952 E.10982
G1 X109.726 Y100.05 E.05152
G1 X111.895 Y100.05 E.07195
G1 X112.993 Y98.952 E.05151
G1 X116.304 Y98.952 E.10984
G1 X122.402 Y105.05 E.28606
G1 X122.246 Y105.05 E.00514
G1 X128.344 Y98.952 E.28604
G1 X131.656 Y98.952 E.10987
G1 X137.754 Y105.05 E.28604
G1 X137.598 Y105.05 E.00514
G1 X143.695 Y98.953 E.28602
G1 X147.009 Y98.953 E.10991
G1 X148.105 Y100.05 E.05145
G1 X150.274 Y100.05 E.07195
G1 X151.371 Y98.953 E.05145
G1 X154.685 Y98.953 E.10993
G1 X160.781 Y105.05 E.286
G1 X160.626 Y105.05 E.00514
G1 X166.722 Y98.954 E.28598
G1 X170.037 Y98.954 E.10996
G1 X189.044 Y117.96 E.89165
G1 X189.044 Y115.012 E.09782
G1 X147.006 Y157.05 E1.97209
G1 X143.698 Y157.05 E.10975
G1 X140.097 Y153.448 E.16894
G3 X138.553 Y153.965 I-6.015 J-15.408 E.05402
G1 X145.276 Y150.952 F30000
G1 F15476.087
G1 X151.374 Y157.05 E.28606
G1 X154.682 Y157.05 E.10975
G1 X189.044 Y122.688 E1.612
G1 X189.044 Y125.636 E.09782
G1 X168.95 Y105.543 E.94264
G1 X168.95 Y107.171 E.05401
; WIPE_START
G1 F24000
G1 X168.95 Y105.543 E-.61876
G1 X169.213 Y105.805 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.017 J-1.217 P1  F30000
G1 X116.199 Y105.05 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F15476.087
G1 X115.95 Y105.05 E.00824
G1 X115.95 Y103.67 E.04577
G1 X120.668 Y98.952 E.22133
G1 X123.98 Y98.952 E.10986
G1 X130.078 Y105.05 E.28605
G1 X129.922 Y105.05 E.00514
G1 X136.02 Y98.952 E.28603
G1 X139.332 Y98.953 E.10989
G1 X144.05 Y103.67 E.22129
G1 X144.05 Y102.042 E.05401
; WIPE_START
G1 F24000
G1 X144.05 Y103.67 E-.61876
G1 X143.787 Y103.407 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.09 J1.214 P1  F30000
G1 X152.45 Y102.766 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F15476.087
G1 X152.45 Y104.395 E.05401
G1 X153.105 Y105.05 E.03073
G1 X152.95 Y105.05 E.00514
G1 X159.047 Y98.953 E.28599
G1 X162.361 Y98.953 E.10995
G1 X168.457 Y105.05 E.28599
G1 X168.302 Y105.05 E.00514
G1 X174.398 Y98.954 E.28597
G1 X177.714 Y98.954 E.10998
G1 X189.044 Y110.285 E.53154
G1 X189.044 Y107.336 E.09782
G1 X168.95 Y127.429 E.94264
G1 X168.95 Y128.571 E.03785
G1 X189.044 Y148.664 E.94264
G1 X189.044 Y145.715 E.09782
G1 X177.71 Y157.05 E.53171
G1 X174.402 Y157.05 E.10975
G1 X156.299 Y138.947 E.84924
G2 X158.392 Y133.365 I-27.335 J-13.436 E.19809
G1 X182.078 Y157.05 E1.11112
G2 X185.408 Y157.028 I1.45 J-33.055 E.11052
G1 X189.023 Y153.413 E.16961
G3 X188.185 Y155.481 I-4.104 J-.458 E.07497
G1 X165.654 Y132.95 E1.05697
G1 X163.429 Y132.95 E.0738
G1 X154.85 Y141.53 E.4025
G3 X153.354 Y143.678 I-22.54 J-14.109 E.08685
G1 X166.726 Y157.05 E.62731
G1 X170.034 Y157.05 E.10975
G1 X189.044 Y138.04 E.8918
G1 X189.044 Y140.988 E.09782
G1 X168.95 Y120.895 E.94264
G1 X168.95 Y119.754 E.03785
G1 X188.191 Y100.513 E.9026
G3 X189.023 Y102.587 I-3.951 J2.79 E.07482
G1 X185.408 Y98.972 E.16961
G2 X185.139 Y98.954 I-.239 J1.566 E.00894
G1 X182.074 Y98.954 E.10168
G1 X168.95 Y112.078 E.61565
G1 X168.95 Y113.219 E.03785
G1 X189.044 Y133.312 E.94264
G1 X189.044 Y130.364 E.09782
G1 X162.358 Y157.05 E1.2519
G1 X159.05 Y157.05 E.10975
G1 X149.673 Y147.673 E.43989
G3 X145.657 Y150.723 I-20.321 J-22.587 E.16745
G1 X139.33 Y157.05 E.29682
G1 X136.022 Y157.05 E.10975
G1 X133.947 Y154.975 E.09735
G1 X133.691 Y155.013 E.00856
G1 X131.654 Y157.05 E.09557
G1 X128.346 Y157.05 E.10975
G1 X126.309 Y155.013 E.09557
G1 X126.053 Y154.975 E.00856
G1 X123.978 Y157.05 E.09735
G1 X120.67 Y157.05 E.10975
G1 X114.343 Y150.723 E.29682
G3 X110.327 Y147.673 I16.306 J-25.637 E.16745
G1 X100.95 Y157.05 E.43989
G1 X97.642 Y157.05 E.10975
G1 X70.953 Y130.361 E1.25204
G1 X70.952 Y133.316 E.09803
G1 X91.05 Y113.219 E.9428
G1 X91.05 Y112.078 E.03785
G1 X77.923 Y98.95 E.61582
G2 X74.592 Y98.972 I-1.451 J33.029 E.11052
G1 X70.984 Y102.581 E.16929
G3 X71.815 Y100.519 I4.025 J.424 E.07471
G1 X91.05 Y119.754 E.90234
G1 X91.05 Y120.895 E.03785
G1 X70.952 Y140.993 E.94284
G1 X70.952 Y138.036 E.09808
G1 X89.966 Y157.05 E.89199
G1 X93.274 Y157.05 E.10975
G1 X106.646 Y143.678 E.62731
G3 X105.15 Y141.53 I21.046 J-16.258 E.08685
G1 X96.571 Y132.95 E.4025
G1 X94.346 Y132.95 E.0738
G1 X71.815 Y155.481 E1.05697
G3 X70.972 Y153.408 I3.32 J-2.557 E.07516
G1 X74.591 Y157.027 E.16979
G2 X77.922 Y157.05 I1.873 J-30.52 E.11056
G1 X101.608 Y133.365 E1.11112
G2 X103.701 Y138.947 I29.428 J-7.854 E.19809
G1 X85.598 Y157.05 E.84924
G1 X82.29 Y157.05 E.10975
G1 X70.951 Y145.711 E.53193
G1 X70.951 Y148.669 E.09814
G1 X91.05 Y128.571 E.94288
G1 X91.05 Y127.429 E.03785
G1 X70.955 Y107.335 E.94267
G1 X70.955 Y110.285 E.09786
G1 X82.29 Y98.951 E.53174
G1 X85.599 Y98.951 E.10977
G1 X91.698 Y105.05 E.28611
G1 X91.543 Y105.05 E.00515
G1 X97.641 Y98.951 E.28609
G1 X100.951 Y98.951 E.1098
G1 X107.05 Y105.05 E.28609
G1 X106.895 Y105.05 E.00515
G1 X107.55 Y104.395 E.03073
G1 X107.55 Y102.766 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X107.55 Y104.395 E-.61876
G1 X107.287 Y104.657 E-.14124
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
G3 Z5.2 I-.505 J1.107 P1  F30000
G1 X168.602 Y132.602 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X158.222 Y132.602 E.34434
G3 X101.778 Y132.602 I-28.222 J-6.723 E2.57325
G1 X91.398 Y132.602 E.34434
G1 X91.398 Y105.398 E.90241
G1 X107.898 Y105.398 E.54734
G1 X107.898 Y100.398 E.16586
G1 X115.602 Y100.398 E.25556
G1 X115.602 Y105.398 E.16586
G1 X144.398 Y105.398 E.95521
G1 X144.398 Y100.398 E.16586
G1 X152.102 Y100.398 E.25556
G1 X152.102 Y105.398 E.16586
G1 X168.602 Y105.398 E.54734
G1 X168.602 Y132.542 E.90042
G1 X168.21 Y132.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.915 Y132.21 E.31635
G3 X102.085 Y132.21 I-27.915 J-6.336 E2.37058
G1 X91.79 Y132.21 E.31635
G1 X91.79 Y105.79 E.81181
G1 X108.29 Y105.79 E.507
G1 X108.29 Y100.79 E.15364
G1 X115.21 Y100.79 E.21263
G1 X115.21 Y105.79 E.15364
G1 X144.79 Y105.79 E.90891
G1 X144.79 Y100.79 E.15364
G1 X151.71 Y100.79 E.21263
G1 X151.71 Y105.79 E.15364
G1 X168.21 Y105.79 E.507
G1 X168.21 Y132.15 E.80997
M204 S10000
; WIPE_START
G1 F24000
G1 X166.21 Y132.162 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.36 J-1.163 P1  F30000
G1 X70.624 Y102.569 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X75.007 Y98.602 I4.38 J.435 E.21503
G1 X185.157 Y98.606 E3.65386
G3 X189.398 Y103.007 I-.169 J4.407 E.224
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.402 J.004 E.2296
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I-.004 J-4.402 E.2296
G1 X70.602 Y103.007 E1.6581
G3 X70.618 Y102.629 I4.402 J-.004 E.01258
G1 X70.232 Y102.547 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.233 Y102.531 E.0005
G3 X72.48 Y98.928 I4.772 J.474 E.13513
G1 X72.48 Y98.928 E0
G3 X75.003 Y98.21 I2.554 J4.182 E.0816
G1 X185.167 Y98.214 E3.38503
G3 X189.79 Y103.003 I-.179 J4.799 E.22596
G1 X189.79 Y152.997 E1.5362
G3 X186.549 Y157.531 I-4.793 J-.001 E.18276
G1 X186.549 Y157.531 E0
G3 X184.997 Y157.79 I-1.563 J-4.594 E.04854
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.001 J-4.794 E.23131
G1 X70.21 Y103.003 E1.5362
G1 X70.229 Y102.607 E.01218
M204 S10000
; WIPE_START
G1 F24000
G1 X70.233 Y102.531 E-.02898
G1 X70.354 Y101.836 E-.26779
G1 X70.515 Y101.322 E-.20458
G1 X70.776 Y100.742 E-.24182
G1 X70.798 Y100.704 E-.01683
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.37 J1.159 P1  F30000
G1 X91.05 Y107.171 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X91.05 Y105.543 E.05401
G1 X70.953 Y125.639 E.94276
G1 X70.954 Y122.685 E.09797
G1 X105.318 Y157.05 E1.6121
G1 X108.626 Y157.05 E.10975
G1 X114.724 Y150.952 E.28606
G1 X121.447 Y153.965 F30000
G1 F15476.087
G3 X119.903 Y153.448 I4.471 J-15.924 E.05402
G1 X116.302 Y157.05 E.16894
G1 X112.994 Y157.05 E.10975
G1 X70.954 Y115.01 E1.97215
G1 X70.954 Y117.962 E.09792
G1 X89.965 Y98.951 E.89186
G1 X93.275 Y98.951 E.10979
G1 X99.374 Y105.05 E.2861
G1 X99.219 Y105.05 E.00515
G1 X105.317 Y98.951 E.28608
G1 X108.628 Y98.952 E.10982
G1 X109.726 Y100.05 E.05151
G1 X111.895 Y100.05 E.07195
G1 X112.992 Y98.952 E.05151
G1 X116.304 Y98.952 E.10984
G1 X122.402 Y105.05 E.28606
G1 X122.246 Y105.05 E.00514
G1 X128.344 Y98.952 E.28604
G1 X131.656 Y98.952 E.10988
G1 X137.754 Y105.05 E.28603
G1 X137.598 Y105.05 E.00514
G1 X143.695 Y98.953 E.28601
G1 X147.009 Y98.953 E.10992
G1 X148.105 Y100.05 E.05145
G1 X150.274 Y100.05 E.07195
G1 X151.371 Y98.953 E.05144
G1 X154.685 Y98.953 E.10994
G1 X160.781 Y105.05 E.28599
G1 X160.626 Y105.05 E.00514
G1 X166.722 Y98.954 E.28597
G1 X170.038 Y98.954 E.10997
G1 X189.044 Y117.96 E.89164
G1 X189.044 Y115.012 E.09782
G1 X147.006 Y157.05 E1.97209
G1 X143.698 Y157.05 E.10975
G1 X140.097 Y153.448 E.16894
G3 X138.553 Y153.965 I-6.015 J-15.408 E.05402
G1 X145.276 Y150.952 F30000
G1 F15476.087
G1 X151.374 Y157.05 E.28606
G1 X154.682 Y157.05 E.10975
G1 X189.044 Y122.688 E1.612
G1 X189.044 Y125.636 E.09782
G1 X168.95 Y105.543 E.94264
G1 X168.95 Y107.171 E.05401
; WIPE_START
G1 F24000
G1 X168.95 Y105.543 E-.61876
G1 X169.213 Y105.805 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.017 J-1.217 P1  F30000
G1 X116.199 Y105.05 Z5.4
G1 Z5
G1 E.8 F1800
G1 F15476.087
G1 X115.95 Y105.05 E.00824
G1 X115.95 Y103.67 E.04577
G1 X120.668 Y98.952 E.22132
G1 X123.98 Y98.952 E.10986
G1 X130.078 Y105.05 E.28605
G1 X129.922 Y105.05 E.00514
M73 P54 R19
G1 X136.02 Y98.953 E.28603
G1 X139.333 Y98.953 E.1099
G1 X144.05 Y103.67 E.22129
G1 X144.05 Y102.042 E.05401
; WIPE_START
G1 F24000
G1 X144.05 Y103.67 E-.61876
G1 X143.787 Y103.407 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.09 J1.214 P1  F30000
G1 X152.45 Y102.766 Z5.4
G1 Z5
G1 E.8 F1800
G1 F15476.087
G1 X152.45 Y104.395 E.05401
G1 X153.105 Y105.05 E.03073
G1 X152.95 Y105.05 E.00514
G1 X159.047 Y98.953 E.28599
G1 X162.361 Y98.954 E.10995
G1 X168.457 Y105.05 E.28598
G1 X168.302 Y105.05 E.00514
G1 X174.398 Y98.954 E.28596
G1 X177.714 Y98.954 E.10999
G1 X189.044 Y110.285 E.53153
G1 X189.044 Y107.336 E.09782
G1 X168.95 Y127.429 E.94264
G1 X168.95 Y128.571 E.03785
G1 X189.044 Y148.664 E.94264
G1 X189.044 Y145.715 E.09782
G1 X177.71 Y157.05 E.53171
G1 X174.402 Y157.05 E.10975
G1 X156.299 Y138.947 E.84924
G2 X158.392 Y133.365 I-27.335 J-13.436 E.19809
G1 X182.078 Y157.05 E1.11112
G2 X185.408 Y157.028 I1.45 J-33.054 E.11052
G1 X189.023 Y153.413 E.16961
G3 X188.185 Y155.481 I-4.104 J-.458 E.07497
G1 X165.654 Y132.95 E1.05697
G1 X163.429 Y132.95 E.0738
G1 X154.85 Y141.53 E.4025
G3 X153.354 Y143.678 I-22.539 J-14.109 E.08685
G1 X166.726 Y157.05 E.62731
G1 X170.034 Y157.05 E.10975
G1 X189.044 Y138.04 E.8918
G1 X189.044 Y140.988 E.09782
G1 X168.95 Y120.895 E.94264
G1 X168.95 Y119.754 E.03785
G1 X188.191 Y100.513 E.9026
G3 X189.023 Y102.587 I-3.951 J2.79 E.07482
G1 X185.408 Y98.972 E.16961
G2 X185.146 Y98.954 I-.236 J1.543 E.00871
G1 X182.074 Y98.954 E.10191
G1 X168.95 Y112.078 E.61564
G1 X168.95 Y113.219 E.03785
G1 X189.044 Y133.312 E.94264
G1 X189.044 Y130.364 E.09782
G1 X162.358 Y157.05 E1.2519
G1 X159.05 Y157.05 E.10975
G1 X149.673 Y147.673 E.43989
G3 X145.657 Y150.723 I-20.321 J-22.587 E.16745
G1 X139.33 Y157.05 E.29682
G1 X136.022 Y157.05 E.10975
G1 X133.947 Y154.975 E.09735
G1 X133.691 Y155.013 E.00856
G1 X131.654 Y157.05 E.09557
G1 X128.346 Y157.05 E.10975
G1 X126.309 Y155.013 E.09557
G1 X126.053 Y154.975 E.00856
G1 X123.978 Y157.05 E.09735
G1 X120.67 Y157.05 E.10975
G1 X114.343 Y150.723 E.29682
G3 X110.327 Y147.673 I16.306 J-25.637 E.16745
G1 X100.95 Y157.05 E.43989
G1 X97.642 Y157.05 E.10975
G1 X70.953 Y130.361 E1.25204
G1 X70.952 Y133.316 E.09803
G1 X91.05 Y113.219 E.9428
G1 X91.05 Y112.078 E.03785
G1 X77.923 Y98.95 E.61582
G2 X74.592 Y98.972 I-1.451 J33.028 E.11052
G1 X70.984 Y102.581 E.16929
G3 X71.815 Y100.519 I4.025 J.424 E.07471
G1 X91.05 Y119.754 E.90234
G1 X91.05 Y120.895 E.03785
G1 X70.952 Y140.993 E.94284
G1 X70.952 Y138.036 E.09808
G1 X89.966 Y157.05 E.89198
G1 X93.274 Y157.05 E.10975
G1 X106.646 Y143.678 E.62731
G3 X105.15 Y141.53 I21.046 J-16.258 E.08685
G1 X96.571 Y132.95 E.4025
G1 X94.346 Y132.95 E.0738
G1 X71.815 Y155.481 E1.05697
G3 X70.972 Y153.408 I3.32 J-2.557 E.07516
G1 X74.591 Y157.027 E.16979
G2 X77.922 Y157.05 I1.873 J-30.52 E.11056
G1 X101.608 Y133.365 E1.11112
G2 X103.701 Y138.947 I29.428 J-7.854 E.19809
G1 X85.598 Y157.05 E.84924
G1 X82.29 Y157.05 E.10975
G1 X70.951 Y145.711 E.53193
G1 X70.951 Y148.669 E.09814
G1 X91.05 Y128.571 E.94288
G1 X91.05 Y127.429 E.03785
G1 X70.955 Y107.335 E.94267
G1 X70.955 Y110.285 E.09786
G1 X82.29 Y98.951 E.53173
G1 X85.599 Y98.951 E.10977
G1 X91.698 Y105.05 E.28611
G1 X91.543 Y105.05 E.00515
G1 X97.641 Y98.951 E.28609
G1 X100.951 Y98.951 E.10981
G1 X107.05 Y105.05 E.28609
G1 X106.895 Y105.05 E.00515
G1 X107.55 Y104.395 E.03073
G1 X107.55 Y102.766 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X107.55 Y104.395 E-.61876
G1 X107.287 Y104.657 E-.14124
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
G3 Z5.4 I-.505 J1.107 P1  F30000
G1 X168.602 Y132.602 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X158.222 Y132.602 E.34434
G3 X101.778 Y132.602 I-28.222 J-6.723 E2.57323
G1 X91.398 Y132.602 E.34434
G1 X91.398 Y105.398 E.90241
G1 X107.898 Y105.398 E.54734
G1 X107.898 Y100.398 E.16586
G1 X115.602 Y100.398 E.25556
G1 X115.602 Y105.398 E.16586
G1 X144.398 Y105.398 E.95521
G1 X144.398 Y100.398 E.16586
G1 X152.102 Y100.398 E.25556
G1 X152.102 Y105.398 E.16586
G1 X168.602 Y105.398 E.54734
G1 X168.602 Y132.542 E.90042
G1 X168.21 Y132.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.915 Y132.21 E.31635
G3 X102.085 Y132.21 I-27.915 J-6.336 E2.37056
G1 X91.79 Y132.21 E.31635
G1 X91.79 Y105.79 E.81181
G1 X108.29 Y105.79 E.507
G1 X108.29 Y100.79 E.15364
G1 X115.21 Y100.79 E.21263
G1 X115.21 Y105.79 E.15364
G1 X144.79 Y105.79 E.90891
G1 X144.79 Y100.79 E.15364
G1 X151.71 Y100.79 E.21263
G1 X151.71 Y105.79 E.15364
G1 X168.21 Y105.79 E.507
G1 X168.21 Y132.15 E.80997
M204 S10000
; WIPE_START
G1 F24000
G1 X166.21 Y132.162 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.36 J-1.163 P1  F30000
G1 X70.624 Y102.569 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X75.007 Y98.602 I4.38 J.435 E.21503
G1 X185.164 Y98.606 E3.65409
G3 X189.398 Y103.007 I-.176 J4.406 E.22377
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.409 J-.004 E.22949
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I.006 J-4.411 E.22946
G1 X70.602 Y103.007 E1.6581
G3 X70.618 Y102.629 I4.402 J-.004 E.01258
G1 X70.232 Y102.547 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.233 Y102.531 E.0005
G3 X75.003 Y98.21 I4.77 J.473 E.21678
G1 X185.174 Y98.214 E3.38525
G3 X189.79 Y103.003 I-.186 J4.799 E.22575
G1 X189.79 Y152.997 E1.5362
G3 X186.555 Y157.529 I-4.793 J-.001 E.18254
G1 X186.555 Y157.529 E0
G3 X184.997 Y157.79 I-1.57 J-4.594 E.04875
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.001 J-4.794 E.23131
G1 X70.21 Y103.003 E1.5362
G1 X70.229 Y102.607 E.01218
M204 S10000
; WIPE_START
G1 F24000
G1 X70.233 Y102.531 E-.02898
G1 X70.302 Y102.066 E-.17861
G1 X70.416 Y101.61 E-.17862
G1 X70.575 Y101.167 E-.17864
G1 X70.776 Y100.742 E-.17861
G1 X70.798 Y100.705 E-.01654
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.37 J1.159 P1  F30000
G1 X91.05 Y107.171 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X91.05 Y105.543 E.05401
G1 X70.953 Y125.639 E.94276
G1 X70.954 Y122.685 E.09797
G1 X105.318 Y157.05 E1.6121
G1 X108.626 Y157.05 E.10975
G1 X114.724 Y150.952 E.28606
G1 X121.447 Y153.965 F30000
G1 F15476.087
G3 X119.903 Y153.448 I4.471 J-15.924 E.05402
G1 X116.302 Y157.05 E.16894
G1 X112.994 Y157.05 E.10975
G1 X70.954 Y115.01 E1.97215
G1 X70.954 Y117.962 E.09792
G1 X89.965 Y98.951 E.89186
G1 X93.275 Y98.951 E.10979
G1 X99.374 Y105.05 E.2861
G1 X99.219 Y105.05 E.00515
G1 X105.317 Y98.952 E.28608
G1 X108.628 Y98.952 E.10983
G1 X109.726 Y100.05 E.05151
G1 X111.895 Y100.05 E.07195
G1 X112.992 Y98.952 E.0515
G1 X116.304 Y98.952 E.10985
G1 X122.402 Y105.05 E.28606
G1 X122.246 Y105.05 E.00514
G1 X128.344 Y98.952 E.28604
G1 X131.656 Y98.953 E.10989
G1 X137.754 Y105.05 E.28603
G1 X137.598 Y105.05 E.00514
G1 X143.695 Y98.953 E.28601
G1 X147.009 Y98.953 E.10992
G1 X148.105 Y100.05 E.05144
G1 X150.274 Y100.05 E.07195
G1 X151.371 Y98.953 E.05143
G1 X154.685 Y98.953 E.10994
G1 X160.781 Y105.05 E.28599
G1 X160.626 Y105.05 E.00514
G1 X166.722 Y98.954 E.28597
G1 X170.038 Y98.954 E.10998
G1 X189.044 Y117.96 E.89163
G1 X189.044 Y115.012 E.09782
G1 X147.006 Y157.05 E1.97209
G1 X143.698 Y157.05 E.10975
G1 X140.097 Y153.448 E.16894
G3 X138.553 Y153.965 I-6.015 J-15.408 E.05402
G1 X145.276 Y150.952 F30000
G1 F15476.087
G1 X151.374 Y157.05 E.28606
G1 X154.682 Y157.05 E.10975
G1 X189.044 Y122.688 E1.612
G1 X189.044 Y125.636 E.09782
G1 X168.95 Y105.543 E.94264
G1 X168.95 Y107.171 E.05401
; WIPE_START
G1 F24000
G1 X168.95 Y105.543 E-.61876
G1 X169.213 Y105.805 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.017 J-1.217 P1  F30000
G1 X116.199 Y105.05 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F15476.087
G1 X115.95 Y105.05 E.00824
G1 X115.95 Y103.67 E.04577
G1 X120.668 Y98.952 E.22132
G1 X123.98 Y98.952 E.10987
G1 X130.078 Y105.05 E.28604
G1 X129.922 Y105.05 E.00514
G1 X136.019 Y98.953 E.28602
G1 X139.333 Y98.953 E.1099
G1 X144.05 Y103.67 E.22129
G1 X144.05 Y102.042 E.05401
; WIPE_START
G1 F24000
G1 X144.05 Y103.67 E-.61876
G1 X143.787 Y103.407 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.09 J1.214 P1  F30000
G1 X152.45 Y102.766 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F15476.087
G1 X152.45 Y104.395 E.05401
G1 X153.105 Y105.05 E.03073
G1 X152.95 Y105.05 E.00514
G1 X159.046 Y98.954 E.28598
G1 X162.361 Y98.954 E.10996
G1 X168.457 Y105.05 E.28597
G1 X168.302 Y105.05 E.00514
G1 X174.398 Y98.954 E.28595
G1 X177.714 Y98.954 E.11
G1 X189.044 Y110.285 E.53153
G1 X189.044 Y107.336 E.09782
G1 X168.95 Y127.429 E.94264
G1 X168.95 Y128.571 E.03785
G1 X189.044 Y148.664 E.94264
G1 X189.044 Y145.715 E.09782
G1 X177.71 Y157.05 E.53171
G1 X174.402 Y157.05 E.10975
G1 X156.299 Y138.947 E.84924
G2 X158.392 Y133.365 I-27.335 J-13.436 E.19809
G1 X182.078 Y157.05 E1.11112
G2 X185.408 Y157.028 I1.45 J-33.052 E.11052
G1 X189.023 Y153.413 E.16961
G3 X188.191 Y155.487 I-4.204 J-.483 E.07503
G1 X165.654 Y132.95 E1.05723
G1 X163.429 Y132.95 E.0738
G1 X154.85 Y141.53 E.4025
G3 X153.354 Y143.678 I-22.54 J-14.109 E.08685
G1 X166.726 Y157.05 E.62731
G1 X170.034 Y157.05 E.10975
G1 X189.044 Y138.04 E.8918
G1 X189.044 Y140.988 E.09782
G1 X168.95 Y120.895 E.94264
G1 X168.95 Y119.754 E.03785
G1 X188.191 Y100.513 E.9026
G3 X189.023 Y102.587 I-3.951 J2.79 E.07482
G1 X185.408 Y98.972 E.16961
G2 X185.153 Y98.955 I-.232 J1.521 E.00849
G1 X182.073 Y98.954 E.10215
G1 X168.95 Y112.078 E.61563
G1 X168.95 Y113.219 E.03785
G1 X189.044 Y133.312 E.94264
G1 X189.044 Y130.364 E.09782
G1 X162.358 Y157.05 E1.2519
G1 X159.05 Y157.05 E.10975
G1 X149.673 Y147.673 E.43989
G3 X145.657 Y150.723 I-20.322 J-22.588 E.16745
G1 X139.33 Y157.05 E.29682
G1 X136.022 Y157.05 E.10975
G1 X133.947 Y154.975 E.09735
G1 X133.691 Y155.013 E.00856
G1 X131.654 Y157.05 E.09557
G1 X128.346 Y157.05 E.10975
G1 X126.309 Y155.013 E.09557
G1 X126.053 Y154.975 E.00856
G1 X123.978 Y157.05 E.09735
G1 X120.67 Y157.05 E.10975
G1 X114.343 Y150.723 E.29682
G3 X110.327 Y147.673 I16.306 J-25.637 E.16745
G1 X100.95 Y157.05 E.43989
G1 X97.642 Y157.05 E.10975
G1 X70.953 Y130.361 E1.25204
G1 X70.952 Y133.316 E.09803
G1 X91.05 Y113.219 E.9428
G1 X91.05 Y112.078 E.03785
G1 X77.923 Y98.95 E.61582
G2 X74.592 Y98.972 I-1.451 J33.027 E.11052
G1 X70.984 Y102.581 E.16929
G3 X71.809 Y100.513 I4.121 J.447 E.07477
G1 X91.05 Y119.754 E.9026
G1 X91.05 Y120.895 E.03785
G1 X70.952 Y140.993 E.94284
G1 X70.952 Y138.036 E.09808
G1 X89.966 Y157.05 E.89199
G1 X93.274 Y157.05 E.10975
G1 X106.646 Y143.678 E.62731
G3 X105.15 Y141.53 I21.046 J-16.258 E.08685
G1 X96.571 Y132.95 E.4025
G1 X94.346 Y132.95 E.0738
G1 X71.815 Y155.481 E1.05697
G3 X70.972 Y153.408 I3.32 J-2.557 E.07516
G1 X74.591 Y157.027 E.16979
G2 X77.922 Y157.05 I1.873 J-30.516 E.11056
G1 X101.608 Y133.365 E1.11112
G2 X103.701 Y138.947 I29.428 J-7.854 E.19809
G1 X85.598 Y157.05 E.84924
G1 X82.29 Y157.05 E.10975
G1 X70.951 Y145.711 E.53193
G1 X70.951 Y148.669 E.09814
G1 X91.05 Y128.571 E.94288
G1 X91.05 Y127.429 E.03785
G1 X70.955 Y107.335 E.94267
G1 X70.955 Y110.285 E.09786
G1 X82.29 Y98.951 E.53173
G1 X85.599 Y98.951 E.10977
G1 X91.698 Y105.05 E.28611
G1 X91.543 Y105.05 E.00515
G1 X97.641 Y98.951 E.28609
G1 X100.951 Y98.951 E.10981
G1 X107.05 Y105.05 E.28608
G1 X106.895 Y105.05 E.00515
G1 X107.55 Y104.395 E.03073
G1 X107.55 Y102.766 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X107.55 Y104.395 E-.61876
G1 X107.287 Y104.657 E-.14124
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
G3 Z5.6 I-.505 J1.107 P1  F30000
G1 X168.602 Y132.602 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X158.222 Y132.602 E.34434
G3 X101.778 Y132.602 I-28.222 J-6.723 E2.57322
G1 X91.398 Y132.602 E.34434
G1 X91.398 Y105.398 E.90241
G1 X107.898 Y105.398 E.54734
G1 X107.898 Y100.398 E.16586
G1 X115.602 Y100.398 E.25556
G1 X115.602 Y105.398 E.16586
G1 X144.398 Y105.398 E.95521
G1 X144.398 Y100.398 E.16586
G1 X152.102 Y100.398 E.25556
G1 X152.102 Y105.398 E.16586
G1 X168.602 Y105.398 E.54734
G1 X168.602 Y132.542 E.90042
G1 X168.21 Y132.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.915 Y132.21 E.31635
G3 X102.085 Y132.21 I-27.915 J-6.336 E2.37056
G1 X91.79 Y132.21 E.31635
G1 X91.79 Y105.79 E.81181
G1 X108.29 Y105.79 E.507
G1 X108.29 Y100.79 E.15364
G1 X115.21 Y100.79 E.21263
G1 X115.21 Y105.79 E.15364
G1 X144.79 Y105.79 E.90891
G1 X144.79 Y100.79 E.15364
G1 X151.71 Y100.79 E.21263
M73 P55 R19
G1 X151.71 Y105.79 E.15364
G1 X168.21 Y105.79 E.507
G1 X168.21 Y132.15 E.80997
M204 S10000
; WIPE_START
G1 F24000
G1 X166.21 Y132.162 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.36 J-1.163 P1  F30000
G1 X70.624 Y102.569 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X75.007 Y98.602 I4.389 J.444 E.2149
G1 X185.159 Y98.606 E3.65393
G3 X189.398 Y103.007 I-.161 J4.397 E.22406
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.411 J-.006 E.22946
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I.006 J-4.411 E.22946
G1 X70.602 Y103.007 E1.6581
G3 X70.619 Y102.629 I4.411 J.006 E.01258
G1 X70.232 Y102.547 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.234 Y102.531 E.0005
G3 X75.003 Y98.21 I4.78 J.483 E.21664
G1 X185.176 Y98.214 E3.38534
G3 X189.79 Y103.003 I-.178 J4.789 E.22579
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.804 J-.012 E.23117
M73 P55 R18
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.012 J-4.804 E.23117
G1 X70.21 Y103.003 E1.5362
G1 X70.229 Y102.607 E.01218
M204 S10000
; WIPE_START
G1 F24000
G1 X70.234 Y102.531 E-.02895
G1 X70.302 Y102.066 E-.1786
G1 X70.416 Y101.611 E-.17824
G1 X70.575 Y101.167 E-.179
G1 X70.776 Y100.742 E-.17862
G1 X70.798 Y100.705 E-.01658
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.37 J1.159 P1  F30000
G1 X91.05 Y107.171 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X91.05 Y105.543 E.05401
G1 X70.953 Y125.639 E.94276
G1 X70.954 Y122.685 E.09797
G1 X105.318 Y157.05 E1.6121
G1 X108.626 Y157.05 E.10975
G1 X114.724 Y150.952 E.28606
G1 X121.447 Y153.965 F30000
G1 F15476.087
G3 X119.903 Y153.448 I4.471 J-15.924 E.05402
G1 X116.302 Y157.05 E.16894
G1 X112.994 Y157.05 E.10975
G1 X70.954 Y115.01 E1.97215
G1 X70.954 Y117.962 E.09792
G1 X89.965 Y98.951 E.89186
G1 X93.275 Y98.951 E.10979
G1 X99.374 Y105.05 E.2861
G1 X99.219 Y105.05 E.00515
G1 X105.317 Y98.951 E.28608
G1 X108.628 Y98.952 E.10983
G1 X109.726 Y100.05 E.05151
G1 X111.895 Y100.05 E.07195
G1 X112.992 Y98.952 E.0515
G1 X116.304 Y98.952 E.10984
G1 X122.402 Y105.05 E.28606
G1 X122.246 Y105.05 E.00514
G1 X128.344 Y98.952 E.28604
G1 X131.656 Y98.952 E.10988
G1 X137.754 Y105.05 E.28603
G1 X137.598 Y105.05 E.00514
G1 X143.695 Y98.953 E.28601
G1 X147.009 Y98.953 E.10992
G1 X148.105 Y100.05 E.05145
G1 X150.274 Y100.05 E.07195
G1 X151.371 Y98.953 E.05144
G1 X154.685 Y98.953 E.10994
G1 X160.781 Y105.05 E.28599
G1 X160.626 Y105.05 E.00514
G1 X166.722 Y98.954 E.28597
G1 X170.038 Y98.954 E.10998
G1 X189.044 Y117.96 E.89164
G1 X189.044 Y115.012 E.09782
G1 X147.006 Y157.05 E1.97209
G1 X143.698 Y157.05 E.10975
G1 X140.097 Y153.448 E.16894
G3 X138.553 Y153.965 I-6.015 J-15.408 E.05402
G1 X145.276 Y150.952 F30000
G1 F15476.087
G1 X151.374 Y157.05 E.28606
G1 X154.682 Y157.05 E.10975
G1 X189.044 Y122.688 E1.612
G1 X189.044 Y125.636 E.09782
G1 X168.95 Y105.543 E.94264
G1 X168.95 Y107.171 E.05401
; WIPE_START
G1 F24000
G1 X168.95 Y105.543 E-.61876
G1 X169.213 Y105.805 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.017 J-1.217 P1  F30000
G1 X116.199 Y105.05 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F15476.087
G1 X115.95 Y105.05 E.00824
G1 X115.95 Y103.67 E.04577
G1 X120.668 Y98.952 E.22132
G1 X123.98 Y98.952 E.10986
G1 X130.078 Y105.05 E.28605
G1 X129.922 Y105.05 E.00514
G1 X136.019 Y98.953 E.28602
G1 X139.333 Y98.953 E.1099
G1 X144.05 Y103.67 E.22129
G1 X144.05 Y102.042 E.05401
; WIPE_START
G1 F24000
G1 X144.05 Y103.67 E-.61876
G1 X143.787 Y103.407 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.09 J1.214 P1  F30000
G1 X152.45 Y102.766 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F15476.087
G1 X152.45 Y104.395 E.05401
G1 X153.105 Y105.05 E.03073
G1 X152.95 Y105.05 E.00514
G1 X159.047 Y98.953 E.28598
G1 X162.361 Y98.954 E.10996
G1 X168.457 Y105.05 E.28598
G1 X168.302 Y105.05 E.00514
G1 X174.398 Y98.954 E.28596
G1 X177.714 Y98.954 E.10999
G1 X189.044 Y110.285 E.53153
G1 X189.044 Y107.336 E.09782
G1 X168.95 Y127.429 E.94264
G1 X168.95 Y128.571 E.03785
G1 X189.044 Y148.664 E.94264
G1 X189.044 Y145.715 E.09782
G1 X177.71 Y157.05 E.53171
G1 X174.402 Y157.05 E.10975
G1 X156.299 Y138.947 E.84924
G2 X158.392 Y133.365 I-27.335 J-13.436 E.19809
G1 X182.078 Y157.05 E1.11112
G2 X185.408 Y157.028 I1.45 J-33.054 E.11052
G1 X189.023 Y153.413 E.16961
G3 X188.185 Y155.481 I-4.104 J-.458 E.07497
G1 X165.654 Y132.95 E1.05697
G1 X163.429 Y132.95 E.0738
G1 X154.85 Y141.53 E.4025
G3 X153.353 Y143.677 I-24.466 J-15.465 E.08684
G1 X166.726 Y157.05 E.62735
G1 X170.034 Y157.05 E.10975
G1 X189.044 Y138.04 E.8918
G1 X189.044 Y140.988 E.09782
G1 X168.95 Y120.895 E.94264
G1 X168.95 Y119.754 E.03785
G1 X188.191 Y100.513 E.9026
G3 X189.023 Y102.587 I-3.951 J2.79 E.07482
G1 X185.408 Y98.972 E.16961
G2 X185.148 Y98.954 I-.235 J1.544 E.00864
G1 X182.074 Y98.954 E.10198
G1 X168.95 Y112.078 E.61564
G1 X168.95 Y113.219 E.03785
G1 X189.044 Y133.312 E.94264
G1 X189.044 Y130.364 E.09782
G1 X162.358 Y157.05 E1.2519
G1 X159.05 Y157.05 E.10975
G1 X149.673 Y147.673 E.43989
G3 X145.657 Y150.723 I-20.321 J-22.587 E.16745
G1 X139.33 Y157.05 E.29682
G1 X136.022 Y157.05 E.10975
G1 X133.947 Y154.975 E.09735
G1 X133.691 Y155.013 E.00856
G1 X131.654 Y157.05 E.09557
G1 X128.346 Y157.05 E.10975
G1 X126.309 Y155.013 E.09557
G1 X126.053 Y154.975 E.00856
G1 X123.978 Y157.05 E.09735
G1 X120.67 Y157.05 E.10975
G1 X114.343 Y150.723 E.29682
G3 X110.327 Y147.673 I16.306 J-25.637 E.16745
G1 X100.95 Y157.05 E.43989
G1 X97.642 Y157.05 E.10975
G1 X70.953 Y130.361 E1.25204
G1 X70.952 Y133.316 E.09803
G1 X91.05 Y113.219 E.9428
G1 X91.05 Y112.078 E.03785
G1 X77.923 Y98.95 E.61582
G2 X74.592 Y98.972 I-1.454 J32.192 E.11053
G1 X70.977 Y102.587 E.16959
G3 X71.815 Y100.519 I4.108 J.46 E.07497
G1 X91.05 Y119.754 E.90235
G1 X91.05 Y120.895 E.03785
G1 X70.952 Y140.993 E.94284
G1 X70.952 Y138.036 E.09808
G1 X89.966 Y157.05 E.89198
G1 X93.274 Y157.05 E.10975
G1 X106.646 Y143.678 E.62731
G3 X105.15 Y141.53 I21.046 J-16.258 E.08685
G1 X96.571 Y132.95 E.4025
G1 X94.346 Y132.95 E.0738
G1 X71.815 Y155.481 E1.05697
G3 X70.972 Y153.408 I3.321 J-2.558 E.07516
G1 X74.582 Y157.018 E.16935
G1 X77.922 Y157.05 E.11082
G1 X101.608 Y133.365 E1.11112
G2 X103.701 Y138.947 I29.428 J-7.854 E.19809
G1 X85.598 Y157.05 E.84924
G1 X82.29 Y157.05 E.10975
G1 X70.951 Y145.711 E.53193
G1 X70.951 Y148.669 E.09814
G1 X91.05 Y128.571 E.94288
G1 X91.05 Y127.429 E.03785
G1 X70.955 Y107.335 E.94267
G1 X70.955 Y110.285 E.09786
G1 X82.29 Y98.951 E.53173
G1 X85.599 Y98.951 E.10977
G1 X91.698 Y105.05 E.28611
G1 X91.543 Y105.05 E.00515
G1 X97.641 Y98.951 E.28609
G1 X100.951 Y98.951 E.10981
G1 X107.05 Y105.05 E.28609
G1 X106.895 Y105.05 E.00515
G1 X107.55 Y104.395 E.03073
G1 X107.55 Y102.766 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X107.55 Y104.395 E-.61876
G1 X107.287 Y104.657 E-.14124
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
G3 Z5.8 I-.505 J1.107 P1  F30000
G1 X168.602 Y132.602 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X158.222 Y132.602 E.34434
G3 X101.778 Y132.602 I-28.222 J-6.723 E2.57322
G1 X91.398 Y132.602 E.34434
G1 X91.398 Y105.398 E.90241
G1 X107.898 Y105.398 E.54734
G1 X107.898 Y100.398 E.16586
G1 X115.602 Y100.398 E.25556
G1 X115.602 Y105.398 E.16586
G1 X144.398 Y105.398 E.95521
G1 X144.398 Y100.398 E.16586
G1 X152.102 Y100.398 E.25556
G1 X152.102 Y105.398 E.16586
G1 X168.602 Y105.398 E.54734
G1 X168.602 Y132.542 E.90042
G1 X168.21 Y132.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.915 Y132.21 E.31635
G3 X102.085 Y132.21 I-27.915 J-6.336 E2.37055
G1 X91.79 Y132.21 E.31635
G1 X91.79 Y105.79 E.81181
G1 X108.29 Y105.79 E.507
G1 X108.29 Y100.79 E.15364
G1 X115.21 Y100.79 E.21263
G1 X115.21 Y105.79 E.15364
G1 X144.79 Y105.79 E.90891
G1 X144.79 Y100.79 E.15364
G1 X151.71 Y100.79 E.21263
G1 X151.71 Y105.79 E.15364
G1 X168.21 Y105.79 E.507
G1 X168.21 Y132.15 E.80997
M204 S10000
; WIPE_START
G1 F24000
G1 X166.21 Y132.162 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.36 J-1.163 P1  F30000
G1 X70.624 Y102.569 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X75.007 Y98.602 I4.387 J.443 E.21492
G1 X185.166 Y98.606 E3.65416
G3 X189.398 Y103.007 I-.168 J4.397 E.22384
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.411 J-.006 E.22946
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I.006 J-4.411 E.22946
G1 X70.602 Y103.007 E1.6581
G3 X70.619 Y102.629 I4.41 J.004 E.01258
G1 X70.232 Y102.547 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.234 Y102.531 E.0005
G3 X75.003 Y98.21 I4.778 J.482 E.21666
G1 X185.183 Y98.215 E3.38555
G3 X189.79 Y103.003 I-.185 J4.788 E.22558
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.804 J-.012 E.23117
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.012 J-4.804 E.23117
G1 X70.21 Y103.003 E1.5362
G1 X70.229 Y102.607 E.01218
M204 S10000
; WIPE_START
G1 F24000
G1 X70.234 Y102.531 E-.02894
G1 X70.302 Y102.066 E-.1786
G1 X70.416 Y101.61 E-.17862
G1 X70.575 Y101.167 E-.17863
G1 X70.776 Y100.742 E-.17862
G1 X70.798 Y100.705 E-.01659
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.37 J1.159 P1  F30000
G1 X91.05 Y107.171 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X91.05 Y105.543 E.05401
G1 X70.953 Y125.639 E.94276
G1 X70.954 Y122.685 E.09797
G1 X105.318 Y157.05 E1.6121
G1 X108.626 Y157.05 E.10975
G1 X114.724 Y150.952 E.28606
G1 X121.447 Y153.965 F30000
G1 F15476.087
G3 X119.903 Y153.448 I4.471 J-15.924 E.05402
G1 X116.302 Y157.05 E.16894
G1 X112.994 Y157.05 E.10975
G1 X70.954 Y115.01 E1.97215
G1 X70.954 Y117.962 E.09792
G1 X89.965 Y98.951 E.89185
G1 X93.275 Y98.951 E.10979
G1 X99.374 Y105.05 E.2861
G1 X99.219 Y105.05 E.00515
G1 X105.317 Y98.952 E.28608
G1 X108.628 Y98.952 E.10983
G1 X109.726 Y100.05 E.05151
G1 X111.895 Y100.05 E.07195
G1 X112.992 Y98.952 E.0515
G1 X116.304 Y98.952 E.10985
G1 X122.402 Y105.05 E.28606
G1 X122.246 Y105.05 E.00514
G1 X128.344 Y98.952 E.28603
G1 X131.656 Y98.953 E.10989
G1 X137.754 Y105.05 E.28603
G1 X137.598 Y105.05 E.00514
G1 X143.695 Y98.953 E.28601
G1 X147.009 Y98.953 E.10993
G1 X148.105 Y100.05 E.05144
G1 X150.274 Y100.05 E.07195
G1 X151.371 Y98.953 E.05143
G1 X154.685 Y98.953 E.10995
G1 X160.781 Y105.05 E.28599
G1 X160.626 Y105.05 E.00514
G1 X166.722 Y98.954 E.28596
M73 P56 R18
G1 X170.038 Y98.954 E.10999
G1 X189.044 Y117.96 E.89163
G1 X189.044 Y115.012 E.09782
G1 X147.006 Y157.05 E1.97209
G1 X143.698 Y157.05 E.10975
G1 X140.097 Y153.448 E.16894
G3 X138.553 Y153.965 I-6.015 J-15.408 E.05402
G1 X145.276 Y150.952 F30000
G1 F15476.087
G1 X151.374 Y157.05 E.28606
G1 X154.682 Y157.05 E.10975
G1 X189.044 Y122.688 E1.612
G1 X189.044 Y125.636 E.09782
G1 X168.95 Y105.543 E.94264
G1 X168.95 Y107.171 E.05401
; WIPE_START
G1 F24000
G1 X168.95 Y105.543 E-.61876
G1 X169.213 Y105.805 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.017 J-1.217 P1  F30000
G1 X116.199 Y105.05 Z6
G1 Z5.6
G1 E.8 F1800
G1 F15476.087
G1 X115.95 Y105.05 E.00824
G1 X115.95 Y103.67 E.04577
G1 X120.668 Y98.952 E.22132
G1 X123.98 Y98.952 E.10987
G1 X130.078 Y105.05 E.28604
G1 X129.922 Y105.05 E.00514
G1 X136.019 Y98.953 E.28602
G1 X139.333 Y98.953 E.10991
G1 X144.05 Y103.67 E.22128
G1 X144.05 Y102.042 E.05401
; WIPE_START
G1 F24000
G1 X144.05 Y103.67 E-.61876
G1 X143.787 Y103.407 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.09 J1.214 P1  F30000
G1 X152.45 Y102.766 Z6
G1 Z5.6
G1 E.8 F1800
G1 F15476.087
G1 X152.45 Y104.395 E.05401
G1 X153.105 Y105.05 E.03073
G1 X152.95 Y105.05 E.00514
G1 X159.046 Y98.954 E.28598
G1 X162.361 Y98.954 E.10997
G1 X168.457 Y105.05 E.28597
G1 X168.302 Y105.05 E.00514
G1 X174.398 Y98.954 E.28595
G1 X177.714 Y98.954 E.11
G1 X189.044 Y110.285 E.53152
G1 X189.044 Y107.336 E.09782
G1 X168.95 Y127.429 E.94264
G1 X168.95 Y128.571 E.03785
G1 X189.044 Y148.664 E.94264
G1 X189.044 Y145.715 E.09782
G1 X177.71 Y157.05 E.53171
G1 X174.402 Y157.05 E.10975
G1 X156.299 Y138.947 E.84924
G2 X158.392 Y133.365 I-27.335 J-13.436 E.19809
G1 X182.078 Y157.05 E1.11112
G2 X185.408 Y157.028 I1.45 J-33.054 E.11052
G1 X189.023 Y153.413 E.16961
G3 X188.185 Y155.481 I-4.102 J-.458 E.07497
G1 X165.654 Y132.95 E1.05697
G1 X163.429 Y132.95 E.0738
G1 X154.85 Y141.53 E.4025
G3 X153.354 Y143.678 I-22.54 J-14.109 E.08685
G1 X166.726 Y157.05 E.62731
G1 X170.034 Y157.05 E.10975
G1 X189.044 Y138.04 E.8918
G1 X189.044 Y140.988 E.09782
G1 X168.95 Y120.895 E.94264
G1 X168.95 Y119.754 E.03785
G1 X188.191 Y100.513 E.9026
G3 X189.023 Y102.587 I-3.951 J2.79 E.07482
G1 X185.408 Y98.972 E.16961
G2 X185.154 Y98.955 I-.232 J1.524 E.00843
G1 X182.073 Y98.954 E.1022
G1 X168.95 Y112.078 E.61563
G1 X168.95 Y113.219 E.03785
G1 X189.044 Y133.312 E.94264
G1 X189.044 Y130.364 E.09782
G1 X162.358 Y157.05 E1.2519
G1 X159.05 Y157.05 E.10975
G1 X149.673 Y147.673 E.43989
G3 X145.657 Y150.723 I-20.322 J-22.588 E.16745
G1 X139.33 Y157.05 E.29682
G1 X136.022 Y157.05 E.10975
G1 X133.947 Y154.975 E.09735
G1 X133.691 Y155.013 E.00856
G1 X131.654 Y157.05 E.09557
G1 X128.346 Y157.05 E.10975
G1 X126.309 Y155.013 E.09557
G1 X126.053 Y154.975 E.00856
G1 X123.978 Y157.05 E.09735
G1 X120.67 Y157.05 E.10975
G1 X114.343 Y150.723 E.29682
G3 X110.327 Y147.673 I16.306 J-25.637 E.16745
G1 X100.95 Y157.05 E.43989
G1 X97.642 Y157.05 E.10975
G1 X70.953 Y130.361 E1.25204
G1 X70.952 Y133.316 E.09803
G1 X91.05 Y113.219 E.9428
G1 X91.05 Y112.078 E.03785
G1 X77.923 Y98.95 E.61582
G2 X74.592 Y98.972 I-1.451 J33.026 E.11052
G1 X70.984 Y102.581 E.16929
G3 X71.815 Y100.519 I4.024 J.424 E.07471
G1 X91.05 Y119.754 E.90235
G1 X91.05 Y120.895 E.03785
G1 X70.952 Y140.993 E.94284
G1 X70.952 Y138.036 E.09808
G1 X89.966 Y157.05 E.89198
G1 X93.274 Y157.05 E.10975
G1 X106.646 Y143.678 E.62731
G3 X105.15 Y141.53 I21.046 J-16.258 E.08685
G1 X96.571 Y132.95 E.4025
G1 X94.346 Y132.95 E.0738
G1 X71.815 Y155.481 E1.05697
G3 X70.972 Y153.408 I3.32 J-2.558 E.07516
G1 X74.582 Y157.018 E.16935
G1 X77.922 Y157.05 E.11082
G1 X101.608 Y133.365 E1.11112
G2 X103.701 Y138.947 I29.428 J-7.854 E.19809
G1 X85.598 Y157.05 E.84924
G1 X82.29 Y157.05 E.10975
G1 X70.951 Y145.711 E.53193
G1 X70.951 Y148.669 E.09814
G1 X91.05 Y128.571 E.94288
G1 X91.05 Y127.429 E.03785
G1 X70.955 Y107.335 E.94267
G1 X70.955 Y110.285 E.09786
G1 X82.29 Y98.951 E.53173
G1 X85.599 Y98.951 E.10977
G1 X91.698 Y105.05 E.28611
G1 X91.543 Y105.05 E.00515
G1 X97.641 Y98.951 E.28609
G1 X100.951 Y98.951 E.10981
G1 X107.05 Y105.05 E.28608
G1 X106.895 Y105.05 E.00515
G1 X107.55 Y104.395 E.03073
G1 X107.55 Y102.766 E.05401
M106 S242.25
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X107.55 Y104.395 E-.61876
G1 X107.287 Y104.657 E-.14124
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
G3 Z6 I-.505 J1.107 P1  F30000
G1 X168.615 Y132.615 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X158.238 Y132.616 E.34422
G3 X156.081 Y138.632 I-29.015 J-7.008 E.21242
G1 X156.064 Y138.717 E.00289
G3 X155.42 Y139.905 I-29.12 J-15.031 E.04481
G1 X155.401 Y139.985 E.00273
G3 X154.698 Y141.141 I-28.715 J-16.673 E.04491
G1 X154.676 Y141.218 E.00263
G3 X153.915 Y142.34 I-28.209 J-18.306 E.045
G1 X153.892 Y142.413 E.00253
G3 X153.075 Y143.499 I-27.596 J-19.918 E.04509
G1 X153.05 Y143.568 E.00243
G3 X152.173 Y144.621 I-27.183 J-21.752 E.04546
G1 X152.147 Y144.68 E.00213
G3 X151.223 Y145.691 I-26.015 J-22.868 E.04546
G1 X151.196 Y145.746 E.00204
G3 X150.221 Y146.712 I-25.167 J-24.436 E.04554
G1 X150.194 Y146.765 E.00195
G3 X149.171 Y147.683 I-24.214 J-25.963 E.04561
G1 X149.144 Y147.732 E.00186
G3 X148.055 Y148.615 I-23.84 J-28.265 E.04652
G1 X148.009 Y148.669 E.00234
G3 X146.91 Y149.48 I-18.57 J-24.044 E.04531
G1 X146.866 Y149.528 E.00217
G3 X145.725 Y150.285 I-17.639 J-25.35 E.04543
G1 X145.682 Y150.329 E.00203
G3 X144.502 Y151.031 I-16.629 J-26.627 E.04554
G1 X144.462 Y151.071 E.00189
G3 X136.541 Y154.165 I-14.464 J-25.34 E.28308
G1 X135.357 Y154.412 E.04012
G3 X101.761 Y132.616 I-5.343 J-28.554 E1.4657
G1 X91.385 Y132.615 E.34421
G1 X91.385 Y105.385 E.9033
G1 X107.885 Y105.385 E.54734
G1 X107.885 Y100.385 E.16586
G1 X115.615 Y100.385 E.25645
G1 X115.615 Y105.385 E.16586
G1 X144.385 Y105.385 E.95432
G1 X144.385 Y100.385 E.16586
G1 X152.115 Y100.385 E.25645
G1 X152.115 Y105.385 E.16586
G1 X168.615 Y105.385 E.54734
G1 X168.615 Y132.555 E.90131
G1 X168.223 Y132.223 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.927 Y132.224 E.31637
G3 X155.722 Y138.475 I-28.668 J-6.599 E.20412
G2 X155.691 Y138.586 I.33 J.153 E.00356
G3 X155.066 Y139.735 I-29.639 J-15.368 E.04019
G2 X155.033 Y139.837 I.289 J.149 E.00331
G3 X154.349 Y140.959 I-29.435 J-17.169 E.04038
G2 X154.315 Y141.054 I.254 J.146 E.00312
G3 X153.573 Y142.146 I-29.135 J-18.994 E.04058
G2 X153.538 Y142.234 I.222 J.14 E.00293
G3 X152.739 Y143.293 I-28.737 J-20.839 E.04077
G2 X152.703 Y143.374 I.192 J.133 E.00273
G3 X151.849 Y144.398 I-28.235 J-22.697 E.04097
G2 X151.813 Y144.466 I.19 J.142 E.00237
G3 X150.905 Y145.457 I-26.578 J-23.442 E.0413
G2 X150.87 Y145.518 I.161 J.131 E.00219
G3 X149.91 Y146.467 I-25.885 J-25.225 E.04148
G2 X149.877 Y146.523 I.136 J.119 E.00201
G3 X148.867 Y147.428 I-25.086 J-27.003 E.04167
G2 X148.836 Y147.478 I.113 J.105 E.00182
G3 X146.647 Y149.185 I-21.139 J-24.837 E.08533
G1 X146.607 Y149.23 E.00184
G3 X144.263 Y150.716 I-16.489 J-23.412 E.08531
G1 X144.226 Y150.752 E.00158
G3 X102.072 Y132.224 I-14.206 J-24.897 E1.6429
G1 X91.777 Y132.223 E.31636
G1 X91.777 Y105.777 E.81264
G1 X108.277 Y105.777 E.507
G1 X108.277 Y100.777 E.15364
G1 X115.223 Y100.777 E.21346
G1 X115.223 Y105.777 E.15364
G1 X144.777 Y105.777 E.90809
G1 X144.777 Y100.777 E.15364
G1 X151.723 Y100.777 E.21346
G1 X151.723 Y105.777 E.15364
G1 X168.223 Y105.777 E.507
G1 X168.223 Y132.163 E.81079
M204 S10000
; WIPE_START
G1 F24000
G1 X166.223 Y132.175 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.36 J-1.162 P1  F30000
G1 X70.624 Y102.569 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X75.007 Y98.602 I4.387 J.443 E.21492
G1 X185.173 Y98.606 E3.65438
G3 X189.398 Y103.007 I-.175 J4.397 E.22362
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.411 J-.006 E.22946
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I.006 J-4.411 E.22946
G1 X70.602 Y103.007 E1.6581
G3 X70.619 Y102.629 I4.41 J.004 E.01258
G1 X70.232 Y102.547 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.234 Y102.531 E.0005
G3 X75.003 Y98.21 I4.778 J.482 E.21666
G1 X185.19 Y98.215 E3.38576
G3 X189.79 Y103.003 I-.192 J4.788 E.22537
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.804 J-.012 E.23117
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.012 J-4.804 E.23117
G1 X70.21 Y103.003 E1.5362
G1 X70.229 Y102.607 E.01218
M204 S10000
; WIPE_START
G1 F24000
G1 X70.234 Y102.531 E-.02892
G1 X70.302 Y102.066 E-.1786
G1 X70.416 Y101.61 E-.17831
G1 X70.575 Y101.167 E-.17893
G1 X70.776 Y100.742 E-.17862
G1 X70.798 Y100.705 E-.01661
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.196 J.226 P1  F30000
G1 X71.363 Y103.696 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X71.486 Y102.078 I5.262 J-.413 E.05402
G1 X74.082 Y99.482 E.12179
G3 X75.699 Y99.357 I1.179 J4.741 E.05405
G1 X73.331 Y99.773 F30000
G1 F15476.087
G2 X72.105 Y100.809 I1.994 J3.604 E.05357
G1 X78.133 Y106.837 E.2828
G1 X74.403 Y106.837 E.12373
G1 X81.883 Y99.358 E.35087
G1 X78.33 Y99.358 E.11786
G1 X90.26 Y111.288 E.55968
G1 X90.26 Y114.008 E.09023
G1 X79.163 Y125.105 E.52059
G1 X79.163 Y123.219 E.06259
G1 X112.587 Y156.643 E1.56798
G1 X109.033 Y156.643 E.11787
G1 X114.149 Y151.527 E.23998
G2 X116.432 Y152.812 I21.635 J-35.781 E.08691
G1 X120.263 Y156.643 E.17972
G1 X116.709 Y156.643 E.11787
G1 X119.286 Y154.066 E.12089
G2 X124.775 Y155.58 I10.962 J-29.034 E.18914
G1 X124.701 Y156.327 E.0249
G1 X124.385 Y156.643 E.01482
G1 X122.757 Y156.643 E.05401
G1 X125.449 Y157.039 F30000
G1 F15476.087
G1 X125.609 Y155.419 E.05401
G1 X126.041 Y154.986 E.02029
G1 X126.325 Y155.029 E.0095
G1 X128.346 Y157.05 E.09481
G1 X131.654 Y157.05 E.10975
G1 X133.675 Y155.029 E.09479
G1 X133.959 Y154.987 E.00953
G1 X134.391 Y155.419 E.02028
G1 X134.552 Y157.039 E.05401
G1 X137.243 Y156.643 F30000
G1 F15476.087
G1 X135.615 Y156.643 E.05401
G1 X135.3 Y156.327 E.01478
G1 X135.225 Y155.58 E.0249
G2 X140.713 Y154.065 I-7.972 J-39.548 E.189
G1 X143.291 Y156.643 E.12094
G1 X139.737 Y156.643 E.11787
G1 X143.573 Y152.807 E.17993
G2 X145.85 Y151.526 I-17.083 J-33.039 E.0867
G1 X150.967 Y156.643 E.24002
G1 X147.413 Y156.643 E.11787
G1 X180.837 Y123.219 E1.56798
G1 X180.837 Y125.105 E.06259
G1 X169.74 Y114.008 E.52059
G1 X169.74 Y111.288 E.09023
G1 X181.666 Y99.362 E.55946
G1 X178.122 Y99.362 E.11755
G1 X185.597 Y106.837 E.35067
G1 X181.867 Y106.837 E.12373
G1 X187.9 Y100.804 E.28302
G2 X186.665 Y99.764 I-2.929 J2.223 E.05398
G1 X185.171 Y98.955 F30000
G1 F15476.087
G3 X189.044 Y102.801 I-.183 J4.057 E.19855
G1 X189.044 Y107.244 E.14738
G1 X181.244 Y107.244 E.25874
G1 X181.244 Y130.756 E.77992
G1 X189.044 Y130.756 E.25874
G1 X189.044 Y153.194 E.74433
G3 X184.984 Y157.05 I-4.072 J-.222 E.20471
G1 X134.962 Y157.05 E1.65932
G1 X134.784 Y155.254 E.05986
G2 X158.812 Y133.333 I-4.867 J-29.464 E1.14095
G1 X169.333 Y133.333 E.34899
G1 X169.333 Y104.667 E.95089
G1 X152.833 Y104.667 E.54734
G1 X152.833 Y98.954 E.18952
G1 X185.111 Y98.955 E1.07073
G1 X184.297 Y99.362 F30000
G1 F15476.087
G3 X185.916 Y99.48 I.398 J5.719 E.054
G1 X188.521 Y102.086 E.12224
G3 X188.637 Y103.704 I-6.491 J1.278 E.05394
G1 X189.044 Y111.913 F30000
G1 F15476.087
G1 X189.044 Y110.285 E.05401
G1 X186.411 Y107.651 E.12353
G1 X188.729 Y107.651 E.07688
G1 X181.651 Y114.729 E.33201
G1 X181.651 Y118.244 E.1166
G1 X189.044 Y125.636 E.34682
G1 X189.044 Y122.688 E.09782
G1 X181.651 Y130.08 E.34682
G1 X181.651 Y130.349 E.0089
G1 X186.08 Y130.349 E.14692
G1 X181.651 Y125.92 E.20778
G1 X181.651 Y122.405 E.1166
G1 X189.044 Y115.012 E.34682
G1 X189.044 Y117.96 E.09782
G1 X181.651 Y110.568 E.34682
G1 X181.651 Y108.939 E.05401
G1 X169.74 Y107.961 F30000
G1 F15476.087
G1 X169.74 Y106.332 E.05401
G1 X180.837 Y117.429 E.52059
G1 X180.837 Y115.543 E.06259
G1 X169.74 Y126.64 E.52059
G1 X169.74 Y129.36 E.09023
G1 X188.637 Y148.257 E.88651
G1 X188.637 Y146.123 E.07081
G1 X178.117 Y156.643 E.49352
G1 X181.67 Y156.643 E.11787
G1 X159.037 Y134.009 E1.06178
G3 X158.548 Y135.562 I-16.002 J-4.182 E.05402
G1 X182.197 Y131.163 F30000
G1 F15476.087
G1 X180.837 Y131.163 E.04512
G1 X180.837 Y130.895 E.0089
G1 X155.089 Y156.643 E1.20789
G1 X158.643 Y156.643 E.11787
G1 X150.232 Y148.232 E.39456
G2 X153.92 Y144.244 I-28.179 J-29.761 E.18032
G1 X166.319 Y156.643 E.58163
G1 X162.765 Y156.643 E.11787
G1 X188.245 Y131.163 E1.19531
G1 X186.895 Y131.163 E.04479
G1 X188.637 Y132.905 E.08174
G1 X188.637 Y134.534 E.05401
G1 X188.637 Y152.304 F30000
G1 F15476.087
G3 X188.514 Y153.922 I-5.289 J.411 E.05402
G1 X185.925 Y156.511 E.12147
G3 X184.309 Y156.643 I-1.313 J-6.143 E.05392
G1 X186.669 Y156.227 F30000
G1 F15476.087
G2 X187.895 Y155.191 I-1.72 J-3.278 E.05366
G1 X166.444 Y133.74 E1.00633
G1 X162.64 Y133.74 E.12618
G1 X156.882 Y139.53 E.27087
G1 X173.995 Y156.643 E.80276
G1 X170.441 Y156.643 E.11787
G1 X188.637 Y138.447 E.85361
G1 X188.637 Y140.581 E.07081
G1 X169.74 Y121.684 E.88651
G1 X169.74 Y118.964 E.09023
G1 X180.837 Y107.867 E.52059
G1 X180.837 Y109.753 E.06259
G1 X170.446 Y99.362 E.48749
G1 X173.99 Y99.362 E.11758
G1 X169.092 Y104.26 E.22978
G1 X167.668 Y104.26 E.04724
G1 X162.769 Y99.361 E.2298
G1 X166.314 Y99.362 E.1176
G1 X161.416 Y104.26 E.2298
G1 X159.992 Y104.26 E.04724
G1 X155.093 Y99.361 E.22982
G1 X158.639 Y99.361 E.11762
G1 X153.74 Y104.26 E.22981
G1 X153.24 Y104.26 E.01659
G1 X153.24 Y103.132 E.03743
; WIPE_START
G1 F24000
G1 X153.24 Y104.26 E-.42876
G1 X153.74 Y104.26 E-.19
G1 X154.003 Y103.997 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.93 J-.785 P1  F30000
G1 X149.742 Y98.953 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F15476.087
G1 X151.371 Y98.953 E.05401
G1 X150.288 Y100.036 E.0508
G1 X148.092 Y100.036 E.07284
G1 X147.009 Y98.953 E.05081
G1 X145.381 Y98.953 E.05401
G1 X143.667 Y98.954 F30000
G1 F15476.087
G1 X143.667 Y104.667 E.18953
G1 X116.333 Y104.667 E.90673
G1 X116.333 Y98.952 E.18957
G1 X143.607 Y98.954 E.90474
G1 X138.112 Y99.36 F30000
G1 F15476.087
G1 X139.74 Y99.36 E.05401
G1 X143.26 Y102.88 E.16512
G1 X143.26 Y99.388 E.11584
G1 X138.388 Y104.26 E.22856
G1 X136.964 Y104.26 E.04724
G1 X132.064 Y99.36 E.22987
G1 X135.612 Y99.36 E.11769
G1 X130.712 Y104.26 E.22986
G1 X129.288 Y104.26 E.04724
G1 X124.388 Y99.36 E.22989
G1 X127.936 Y99.36 E.11772
G1 X123.036 Y104.26 E.22988
G1 X121.612 Y104.26 E.04724
G1 X116.74 Y99.388 E.22856
G1 X116.74 Y102.88 E.11585
G1 X120.261 Y99.36 E.16517
G1 X121.889 Y99.36 E.05401
G1 X114.621 Y98.952 F30000
G1 F15476.087
G1 X112.992 Y98.952 E.05401
G1 X111.908 Y100.036 E.05087
M73 P57 R18
G1 X109.712 Y100.036 E.07284
G1 X108.628 Y98.952 E.05088
G1 X110.256 Y98.952 E.05401
G1 X107.167 Y98.952 F30000
G1 F15476.087
G1 X107.167 Y104.667 E.18959
G1 X90.667 Y104.667 E.54734
G1 X90.667 Y133.333 E.95089
G1 X101.188 Y133.333 E.34899
G2 X125.216 Y155.253 I29.005 J-7.665 E1.14026
G1 X125.039 Y157.05 E.0599
G1 X75.02 Y157.05 E1.65921
G3 X70.95 Y152.984 I.072 J-4.142 E.21093
G1 X70.953 Y130.756 E.73735
G1 X78.756 Y130.756 E.25884
G1 X78.756 Y107.244 E.77992
G1 X70.955 Y107.244 E.25875
G1 X70.956 Y102.805 E.14724
G3 X75.016 Y98.95 I4.101 J.253 E.20433
G1 X107.107 Y98.952 E1.06452
G1 X106.76 Y103.132 F30000
G1 F15476.087
G1 X106.76 Y104.26 E.03743
G1 X106.26 Y104.26 E.01659
G1 X101.359 Y99.359 E.22994
G1 X104.909 Y99.359 E.11779
G1 X100.008 Y104.26 E.22993
G1 X98.584 Y104.26 E.04724
G1 X93.682 Y99.358 E.22995
G1 X97.234 Y99.358 E.11781
G1 X92.332 Y104.26 E.22995
G1 X90.908 Y104.26 E.04724
G1 X86.006 Y99.358 E.22997
G1 X89.558 Y99.358 E.11783
G1 X79.163 Y109.753 E.48767
G1 X79.163 Y107.867 E.06259
G1 X90.26 Y118.964 E.52059
G1 X90.26 Y121.684 E.09023
G1 X71.359 Y140.585 E.8867
G1 X71.359 Y138.443 E.07108
G1 X89.559 Y156.643 E.85379
G1 X86.005 Y156.643 E.11787
G1 X103.115 Y139.533 E.80265
G1 X97.36 Y133.74 E.27087
G1 X93.556 Y133.74 E.12618
G1 X72.105 Y155.191 E1.00632
G2 X73.325 Y156.222 I3.732 J-3.183 E.05322
G1 X75.696 Y156.643 F30000
G1 F15476.087
G3 X74.078 Y156.514 I-.23 J-7.344 E.05394
G1 X71.489 Y153.925 E.12147
G3 X71.358 Y152.309 I6.14 J-1.313 E.05392
G1 X71.359 Y134.537 F30000
G1 F15476.087
G1 X71.36 Y132.909 E.05401
G1 X73.105 Y131.163 E.0819
G1 X71.755 Y131.163 E.04479
G1 X97.235 Y156.643 E1.19531
G1 X93.681 Y156.643 E.11787
G1 X106.082 Y144.242 E.58173
G2 X109.768 Y148.232 I24.498 J-18.939 E.18042
G1 X101.357 Y156.643 E.39458
G1 X104.911 Y156.643 E.11787
G1 X79.163 Y130.895 E1.20789
G1 X79.163 Y131.163 E.0089
G1 X77.803 Y131.163 E.04512
G1 X70.955 Y111.914 F30000
G1 F15476.087
G1 X70.955 Y110.285 E.05401
G1 X73.589 Y107.651 E.12357
G1 X71.271 Y107.651 E.07688
G1 X78.349 Y114.729 E.33201
G1 X78.349 Y118.244 E.1166
G1 X70.953 Y125.639 E.34693
G1 X70.954 Y122.685 E.09797
G1 X78.349 Y130.08 E.34692
G1 X78.349 Y130.349 E.0089
G1 X73.92 Y130.349 E.14692
G1 X78.349 Y125.92 E.20778
G1 X78.349 Y122.405 E.1166
G1 X70.954 Y115.01 E.34688
G1 X70.954 Y117.962 E.09792
G1 X78.349 Y110.568 E.34689
G1 X78.349 Y108.939 E.05401
G1 X90.26 Y107.961 F30000
G1 F15476.087
G1 X90.26 Y106.332 E.05401
G1 X79.163 Y117.429 E.52059
G1 X79.163 Y115.543 E.06259
G1 X90.26 Y126.64 E.52059
G1 X90.26 Y129.36 E.09023
G1 X71.358 Y148.262 E.88674
G1 X71.358 Y146.118 E.07113
G1 X81.883 Y156.643 E.49374
G1 X78.33 Y156.643 E.11787
G1 X100.963 Y134.009 E1.06178
G2 X101.449 Y135.563 I17.487 J-4.621 E.05402
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X100.963 Y134.009 E-.61862
G1 X100.7 Y134.272 E-.14138
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
G3 Z6.2 I.029 J1.217 P1  F30000
G1 X168.656 Y132.656 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X158.271 Y132.657 E.3445
G3 X156.148 Y138.585 I-28.993 J-7.036 E.20927
G1 X156.141 Y138.641 E.00186
G1 X155.555 Y139.764 E.04203
G2 X155.479 Y139.915 I.16 J.175 E.00571
G1 X154.837 Y141.011 E.04216
G2 X154.756 Y141.154 I.14 J.173 E.00557
G1 X154.058 Y142.221 E.04231
G2 X153.973 Y142.356 I.12 J.169 E.00541
G1 X153.22 Y143.391 E.04248
G2 X153.132 Y143.518 I.101 J.163 E.00524
G1 X152.325 Y144.518 E.04265
G2 X152.229 Y144.63 I.094 J.177 E.005
G1 X151.278 Y145.704 E.04757
G1 X150.275 Y146.728 E.04755
G1 X149.224 Y147.702 E.04753
G1 X148.12 Y148.62 E.04764
G3 X101.728 Y132.657 I-18.113 J-22.751 E1.93669
G1 X91.344 Y132.656 E.34448
G1 X91.344 Y105.344 E.90602
G1 X107.844 Y105.344 E.54734
G1 X107.844 Y100.344 E.16586
G1 X115.656 Y100.344 E.25917
G1 X115.656 Y105.344 E.16586
G1 X144.344 Y105.344 E.95161
G1 X144.344 Y100.344 E.16586
G1 X152.156 Y100.344 E.25917
G1 X152.156 Y105.344 E.16586
G1 X168.656 Y105.344 E.54734
G1 X168.656 Y132.596 E.90403
G1 X168.264 Y132.264 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X157.96 Y132.265 E.31661
G3 X155.769 Y138.472 I-28.688 J-6.638 E.20271
G1 X155.762 Y138.519 E.00144
G1 X155.106 Y139.776 E.04359
G1 X154.388 Y141 E.04359
G1 X153.612 Y142.187 E.04358
G1 X152.777 Y143.333 E.04358
G1 X152.027 Y144.263 E.03671
G1 X151.001 Y145.419 E.0475
G2 X150.945 Y145.483 I.051 J.1 E.00268
G1 X150.008 Y146.435 E.04104
G2 X149.95 Y146.495 I.04 J.096 E.00262
G1 X148.965 Y147.4 E.04111
G2 X148.907 Y147.455 I.031 J.091 E.00254
G1 X147.877 Y148.312 E.04119
G3 X102.04 Y132.265 I-17.87 J-22.444 E1.77929
G1 X91.736 Y132.264 E.31661
G1 X91.736 Y105.736 E.81515
G1 X108.236 Y105.736 E.507
G1 X108.236 Y100.736 E.15364
G1 X115.264 Y100.736 E.21597
G1 X115.264 Y105.736 E.15364
G1 X144.736 Y105.736 E.90557
G1 X144.736 Y100.736 E.15364
G1 X151.764 Y100.736 E.21597
G1 X151.764 Y105.736 E.15364
G1 X168.264 Y105.736 E.507
G1 X168.264 Y132.204 E.81331
M204 S10000
; WIPE_START
G1 F24000
G1 X166.264 Y132.216 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.36 J-1.162 P1  F30000
G1 X70.624 Y102.569 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X75.007 Y98.602 I4.389 J.444 E.2149
G1 X185.179 Y98.607 E3.6546
G3 X189.398 Y103.007 I-.181 J4.396 E.2234
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.411 J-.006 E.22946
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I.006 J-4.411 E.22946
G1 X70.602 Y103.007 E1.6581
G3 X70.619 Y102.629 I4.411 J.006 E.01258
G1 X70.232 Y102.547 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.234 Y102.531 E.00049
G3 X75.003 Y98.21 I4.78 J.483 E.21664
G1 X185.197 Y98.215 E3.38597
G3 X189.79 Y103.003 I-.2 J4.788 E.22516
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.804 J-.012 E.23117
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.012 J-4.804 E.23117
G1 X70.21 Y103.003 E1.5362
G1 X70.229 Y102.607 E.01218
M204 S10000
; WIPE_START
G1 F24000
G1 X70.234 Y102.531 E-.02891
G1 X70.302 Y102.066 E-.1786
G1 X70.416 Y101.61 E-.17863
G1 X70.575 Y101.167 E-.17863
G1 X70.776 Y100.742 E-.17862
G1 X70.798 Y100.705 E-.01662
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.196 J.226 P1  F30000
G1 X71.363 Y103.692 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X71.489 Y102.075 I5.092 J-.416 E.054
G1 X74.083 Y99.482 E.12167
G3 X75.7 Y99.357 I1.179 J4.753 E.05405
G1 X73.331 Y99.773 F30000
G1 F15476.087
G2 X72.105 Y100.809 I1.672 J3.222 E.05367
G1 X78.133 Y106.837 E.28281
G1 X74.403 Y106.837 E.12373
G1 X81.883 Y99.358 E.35087
G1 X78.33 Y99.358 E.11786
G1 X90.26 Y111.288 E.55968
G1 X90.26 Y114.008 E.09023
G1 X79.163 Y125.105 E.52059
G1 X79.163 Y123.219 E.06259
G1 X112.587 Y156.643 E1.56798
M73 P57 R17
G1 X109.033 Y156.643 E.11787
G1 X114.149 Y151.527 E.23998
G2 X116.432 Y152.812 I21.635 J-35.781 E.08691
G1 X120.263 Y156.643 E.17972
G1 X116.709 Y156.643 E.11787
G1 X119.286 Y154.066 E.12089
G2 X124.775 Y155.58 I10.962 J-29.034 E.18914
G1 X124.701 Y156.327 E.0249
G1 X124.385 Y156.643 E.01482
G1 X122.757 Y156.643 E.05401
G1 X125.449 Y157.039 F30000
G1 F15476.087
G1 X125.609 Y155.419 E.05401
G1 X126.005 Y155.023 E.01859
G1 X126.373 Y155.077 E.01235
G1 X128.346 Y157.05 E.09253
G1 X131.654 Y157.05 E.10975
G1 X133.626 Y155.077 E.09252
G2 X133.995 Y155.023 I-.367 J-3.741 E.01236
G1 X134.391 Y155.419 E.01859
G1 X134.552 Y157.039 E.05401
G1 X137.243 Y156.643 F30000
G1 F15476.087
G1 X135.615 Y156.643 E.05401
G1 X135.3 Y156.327 E.01478
G1 X135.225 Y155.58 E.0249
G2 X140.713 Y154.065 I-7.972 J-39.548 E.189
G1 X143.291 Y156.643 E.12094
G1 X139.737 Y156.643 E.11787
G1 X143.573 Y152.807 E.17993
G2 X145.85 Y151.526 I-17.083 J-33.039 E.0867
G1 X150.967 Y156.643 E.24002
G1 X147.413 Y156.643 E.11787
G1 X180.837 Y123.219 E1.56798
G1 X180.837 Y125.105 E.06259
G1 X169.74 Y114.008 E.52059
G1 X169.74 Y111.288 E.09023
G1 X181.666 Y99.362 E.55946
G1 X178.122 Y99.362 E.11755
G1 X185.597 Y106.837 E.35067
G1 X181.867 Y106.837 E.12373
G1 X187.9 Y100.804 E.28302
G2 X186.665 Y99.764 I-3.343 J2.716 E.05385
G1 X185.175 Y98.955 F30000
G1 F15476.087
G3 X189.044 Y102.801 I-.227 J4.098 E.19795
G1 X189.044 Y107.244 E.14738
G1 X181.244 Y107.244 E.25874
G1 X181.244 Y130.756 E.77992
G1 X189.044 Y130.756 E.25874
G1 X189.044 Y153.194 E.74433
G3 X184.984 Y157.05 I-4.124 J-.278 E.20404
G1 X134.962 Y157.05 E1.65932
G1 X134.784 Y155.254 E.05986
G2 X158.812 Y133.333 I-4.867 J-29.464 E1.14095
G1 X169.333 Y133.333 E.34899
G1 X169.333 Y104.667 E.95089
G1 X152.833 Y104.667 E.54734
G1 X152.833 Y98.954 E.18952
G1 X185.115 Y98.955 E1.07086
G1 X184.297 Y99.362 F30000
G1 F15476.087
G3 X185.916 Y99.48 I.398 J5.719 E.054
G1 X188.521 Y102.086 E.12224
G3 X188.637 Y103.704 I-6.491 J1.278 E.05394
G1 X189.044 Y111.913 F30000
G1 F15476.087
G1 X189.044 Y110.285 E.05401
G1 X186.411 Y107.651 E.12353
G1 X188.729 Y107.651 E.07688
G1 X181.651 Y114.729 E.33201
G1 X181.651 Y118.244 E.1166
G1 X189.044 Y125.636 E.34682
G1 X189.044 Y122.688 E.09782
G1 X181.651 Y130.08 E.34682
G1 X181.651 Y130.349 E.0089
G1 X186.08 Y130.349 E.14692
G1 X181.651 Y125.92 E.20778
G1 X181.651 Y122.405 E.1166
G1 X189.044 Y115.012 E.34682
G1 X189.044 Y117.96 E.09782
G1 X181.651 Y110.568 E.34682
G1 X181.651 Y108.939 E.05401
G1 X169.74 Y107.961 F30000
G1 F15476.087
G1 X169.74 Y106.332 E.05401
G1 X180.837 Y117.429 E.52059
G1 X180.837 Y115.543 E.06259
G1 X169.74 Y126.64 E.52059
G1 X169.74 Y129.36 E.09023
G1 X188.637 Y148.257 E.88651
G1 X188.637 Y146.123 E.07081
G1 X178.117 Y156.643 E.49352
G1 X181.67 Y156.643 E.11787
G1 X159.037 Y134.009 E1.06178
G3 X158.548 Y135.562 I-16.002 J-4.182 E.05402
G1 X182.197 Y131.163 F30000
G1 F15476.087
G1 X180.837 Y131.163 E.04512
G1 X180.837 Y130.895 E.0089
G1 X155.089 Y156.643 E1.20789
G1 X158.643 Y156.643 E.11787
G1 X150.232 Y148.232 E.39456
G2 X153.92 Y144.244 I-28.179 J-29.761 E.18032
G1 X166.319 Y156.643 E.58163
G1 X162.765 Y156.643 E.11787
G1 X188.245 Y131.163 E1.19531
G1 X186.895 Y131.163 E.04479
G1 X188.637 Y132.905 E.08174
G1 X188.637 Y134.534 E.05401
G1 X188.637 Y152.3 F30000
G1 F15476.087
G3 X188.518 Y153.917 I-5.49 J.41 E.054
G1 X185.924 Y156.512 E.12169
G3 X184.308 Y156.643 I-1.314 J-6.179 E.05392
G1 X186.669 Y156.227 F30000
G1 F15476.087
G2 X187.895 Y155.191 I-2.297 J-3.962 E.05351
G1 X166.444 Y133.74 E1.00633
G1 X162.64 Y133.74 E.12618
G1 X156.882 Y139.53 E.27087
G1 X173.995 Y156.643 E.80276
G1 X170.441 Y156.643 E.11787
G1 X188.637 Y138.447 E.85361
G1 X188.637 Y140.581 E.07081
G1 X169.74 Y121.684 E.88651
G1 X169.74 Y118.964 E.09023
G1 X180.837 Y107.867 E.52059
G1 X180.837 Y109.753 E.06259
G1 X170.446 Y99.362 E.48749
G1 X173.99 Y99.362 E.11758
G1 X169.092 Y104.26 E.22978
G1 X167.668 Y104.26 E.04724
G1 X162.769 Y99.361 E.2298
G1 X166.314 Y99.362 E.1176
G1 X161.416 Y104.26 E.2298
G1 X159.992 Y104.26 E.04724
G1 X155.093 Y99.361 E.22982
G1 X158.639 Y99.361 E.11762
G1 X153.74 Y104.26 E.22981
G1 X153.24 Y104.26 E.01659
G1 X153.24 Y103.132 E.03743
; WIPE_START
G1 F24000
G1 X153.24 Y104.26 E-.42876
G1 X153.74 Y104.26 E-.19
G1 X154.003 Y103.997 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.93 J-.785 P1  F30000
G1 X149.742 Y98.953 Z6.4
G1 Z6
G1 E.8 F1800
G1 F15476.087
G1 X151.371 Y98.954 E.05401
G1 X150.329 Y99.995 E.04887
G1 X148.051 Y99.995 E.07555
G1 X147.009 Y98.953 E.04888
G1 X145.381 Y98.953 E.05401
G1 X143.667 Y98.954 F30000
G1 F15476.087
G1 X143.667 Y104.667 E.18953
G1 X116.333 Y104.667 E.90673
G1 X116.333 Y98.952 E.18957
G1 X143.607 Y98.954 E.90474
G1 X138.112 Y99.36 F30000
G1 F15476.087
G1 X139.74 Y99.36 E.05401
G1 X143.26 Y102.88 E.16512
G1 X143.26 Y99.388 E.11584
G1 X138.388 Y104.26 E.22856
G1 X136.964 Y104.26 E.04724
G1 X132.064 Y99.36 E.22987
G1 X135.612 Y99.36 E.11769
G1 X130.712 Y104.26 E.22986
G1 X129.288 Y104.26 E.04724
G1 X124.388 Y99.36 E.22989
G1 X127.936 Y99.36 E.11772
G1 X123.036 Y104.26 E.22988
G1 X121.612 Y104.26 E.04724
G1 X116.74 Y99.388 E.22856
G1 X116.74 Y102.88 E.11585
G1 X120.261 Y99.36 E.16517
G1 X121.889 Y99.36 E.05401
G1 X114.621 Y98.952 F30000
G1 F15476.087
G1 X112.992 Y98.952 E.05401
G1 X111.949 Y99.995 E.04895
G1 X109.671 Y99.995 E.07555
G1 X108.628 Y98.952 E.04896
G1 X110.256 Y98.952 E.05401
G1 X107.167 Y98.952 F30000
G1 F15476.087
G1 X107.167 Y104.667 E.18959
G1 X90.667 Y104.667 E.54734
G1 X90.667 Y133.333 E.95089
G1 X101.188 Y133.333 E.34899
G2 X125.216 Y155.253 I29.005 J-7.665 E1.14026
G1 X125.039 Y157.05 E.0599
G1 X75.02 Y157.05 E1.65921
G3 X70.95 Y152.984 I.006 J-4.076 E.21183
G1 X70.953 Y130.756 E.73735
G1 X78.756 Y130.756 E.25884
G1 X78.756 Y107.244 E.77992
G1 X70.955 Y107.244 E.25875
G1 X70.956 Y102.806 E.14724
G3 X75.016 Y98.95 I4.087 J.239 E.20451
G1 X107.107 Y98.952 E1.06452
G1 X106.76 Y103.132 F30000
G1 F15476.087
G1 X106.76 Y104.26 E.03743
G1 X106.26 Y104.26 E.01659
G1 X101.359 Y99.359 E.22994
G1 X104.909 Y99.359 E.11779
G1 X100.008 Y104.26 E.22993
G1 X98.584 Y104.26 E.04724
G1 X93.682 Y99.358 E.22995
G1 X97.234 Y99.358 E.11781
G1 X92.332 Y104.26 E.22995
G1 X90.908 Y104.26 E.04724
G1 X86.006 Y99.358 E.22997
G1 X89.558 Y99.358 E.11783
G1 X79.163 Y109.753 E.48767
G1 X79.163 Y107.867 E.06259
G1 X90.26 Y118.964 E.52059
G1 X90.26 Y121.684 E.09023
G1 X71.359 Y140.585 E.8867
G1 X71.359 Y138.443 E.07108
G1 X89.559 Y156.643 E.85379
G1 X86.005 Y156.643 E.11787
G1 X103.115 Y139.533 E.80265
G1 X97.36 Y133.74 E.27087
G1 X93.556 Y133.74 E.12618
G1 X72.105 Y155.191 E1.00632
G2 X72.421 Y155.557 I1.394 J-.884 E.01611
G1 X72.421 Y155.557 E0
G2 X73.325 Y156.222 I2.775 J-2.83 E.03734
G1 X75.696 Y156.643 F30000
G1 F15476.087
G3 X74.078 Y156.514 I-.23 J-7.344 E.05394
G1 X71.48 Y153.915 E.1219
G3 X71.358 Y152.298 I6.849 J-1.331 E.05394
G1 X71.359 Y134.537 F30000
G1 F15476.087
G1 X71.36 Y132.909 E.05401
G1 X73.105 Y131.163 E.0819
G1 X71.755 Y131.163 E.04479
G1 X97.235 Y156.643 E1.19531
G1 X93.681 Y156.643 E.11787
G1 X106.082 Y144.242 E.58173
G2 X109.768 Y148.232 I24.498 J-18.939 E.18042
G1 X101.357 Y156.643 E.39458
G1 X104.911 Y156.643 E.11787
G1 X79.163 Y130.895 E1.20789
G1 X79.163 Y131.163 E.0089
G1 X77.803 Y131.163 E.04512
G1 X70.955 Y111.914 F30000
G1 F15476.087
G1 X70.955 Y110.285 E.05401
G1 X73.589 Y107.651 E.12357
G1 X71.271 Y107.651 E.07688
G1 X78.349 Y114.729 E.33201
G1 X78.349 Y118.244 E.1166
G1 X70.953 Y125.639 E.34693
G1 X70.954 Y122.685 E.09797
G1 X78.349 Y130.08 E.34692
G1 X78.349 Y130.349 E.0089
M73 P58 R17
G1 X73.92 Y130.349 E.14692
G1 X78.349 Y125.92 E.20778
G1 X78.349 Y122.405 E.1166
G1 X70.954 Y115.01 E.34688
G1 X70.954 Y117.962 E.09792
G1 X78.349 Y110.568 E.34689
G1 X78.349 Y108.939 E.05401
G1 X90.26 Y107.961 F30000
G1 F15476.087
G1 X90.26 Y106.332 E.05401
G1 X79.163 Y117.429 E.52059
G1 X79.163 Y115.543 E.06259
G1 X90.26 Y126.64 E.52059
G1 X90.26 Y129.36 E.09023
G1 X71.358 Y148.262 E.88674
G1 X71.358 Y146.118 E.07113
G1 X81.883 Y156.643 E.49374
G1 X78.33 Y156.643 E.11787
G1 X100.963 Y134.009 E1.06178
G2 X101.449 Y135.563 I17.487 J-4.621 E.05402
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X100.963 Y134.009 E-.61862
G1 X100.7 Y134.272 E-.14138
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
G3 Z6.4 I.028 J1.217 P1  F30000
G1 X168.727 Y132.727 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X158.327 Y132.727 E.34499
G3 X101.67 Y132.727 I-28.328 J-6.854 E2.57834
G1 X91.273 Y132.727 E.34492
G1 X91.273 Y105.273 E.91073
G1 X107.773 Y105.273 E.54734
G1 X107.773 Y100.273 E.16586
G1 X115.727 Y100.273 E.26388
G1 X115.727 Y105.273 E.16586
G1 X144.273 Y105.273 E.9469
G1 X144.273 Y100.273 E.16586
G1 X152.227 Y100.273 E.26388
G1 X152.227 Y105.273 E.16586
G1 X168.727 Y105.273 E.54734
G1 X168.727 Y132.667 E.90874
G1 X168.335 Y132.335 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X158.017 Y132.335 E.31706
G3 X101.983 Y132.335 I-28.017 J-6.465 E2.37488
G1 X91.665 Y132.335 E.31706
G1 X91.665 Y105.665 E.81952
G1 X108.165 Y105.665 E.507
G1 X108.165 Y100.665 E.15364
G1 X115.335 Y100.665 E.22033
G1 X115.335 Y105.665 E.15364
G1 X144.665 Y105.665 E.90121
G1 X144.665 Y100.665 E.15364
G1 X151.835 Y100.665 E.22033
G1 X151.835 Y105.665 E.15364
G1 X168.335 Y105.665 E.507
G1 X168.335 Y132.275 E.81767
M204 S10000
; WIPE_START
G1 F24000
G1 X166.335 Y132.287 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.361 J-1.162 P1  F30000
G1 X70.624 Y102.569 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X75.007 Y98.602 I4.389 J.444 E.2149
G1 X185.186 Y98.607 E3.65482
G3 X189.398 Y103.007 I-.188 J4.396 E.22318
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.411 J-.006 E.22946
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I.006 J-4.411 E.22946
G1 X70.602 Y103.007 E1.6581
G3 X70.619 Y102.629 I4.411 J.006 E.01258
G1 X70.232 Y102.547 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.234 Y102.531 E.00049
G3 X75.003 Y98.21 I4.78 J.483 E.21664
G1 X185.204 Y98.215 E3.38618
G3 X189.79 Y103.003 I-.207 J4.788 E.22495
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.804 J-.012 E.23117
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.012 J-4.804 E.23117
G1 X70.21 Y103.003 E1.5362
G1 X70.229 Y102.606 E.01219
M204 S10000
; WIPE_START
G1 F24000
G1 X70.234 Y102.531 E-.02889
G1 X70.302 Y102.066 E-.1786
G1 X70.416 Y101.61 E-.1784
G1 X70.575 Y101.167 E-.17886
G1 X70.776 Y100.742 E-.17862
G1 X70.798 Y100.704 E-.01663
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.196 J.226 P1  F30000
G1 X71.363 Y103.696 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X71.486 Y102.078 I5.261 J-.413 E.05402
G1 X74.084 Y99.48 E.1219
G1 X74.203 Y99.45 E.00407
G3 X75.702 Y99.357 I1.256 J8.16 E.04988
G1 X73.331 Y99.773 F30000
G1 F15476.087
G2 X72.105 Y100.809 I2.716 J4.459 E.05344
G1 X78.133 Y106.837 E.28281
G1 X74.403 Y106.837 E.12373
G1 X81.883 Y99.358 E.35087
G1 X78.33 Y99.358 E.11786
G1 X90.26 Y111.288 E.55968
G1 X90.26 Y114.008 E.09023
G1 X79.163 Y125.105 E.52059
G1 X79.163 Y123.219 E.06259
G1 X112.587 Y156.643 E1.56798
G1 X109.033 Y156.643 E.11787
G1 X114.149 Y151.527 E.23998
G2 X116.432 Y152.812 I21.635 J-35.781 E.08691
G1 X120.263 Y156.643 E.17972
G1 X116.709 Y156.643 E.11787
G1 X119.286 Y154.066 E.12089
G2 X124.775 Y155.58 I10.962 J-29.034 E.18914
G1 X124.701 Y156.327 E.0249
G1 X124.385 Y156.643 E.01482
G1 X122.757 Y156.643 E.05401
G1 X125.449 Y157.039 F30000
G1 F15476.087
G1 X125.609 Y155.419 E.05401
G1 X125.943 Y155.085 E.01568
G2 X126.453 Y155.157 I.988 J-5.139 E.01709
G1 X128.346 Y157.05 E.08879
G1 X131.654 Y157.05 E.10975
G1 X133.548 Y155.156 E.08882
G2 X134.057 Y155.085 I-.465 J-5.171 E.01707
G1 X134.391 Y155.419 E.01567
G1 X134.552 Y157.039 E.05401
G1 X137.243 Y156.643 F30000
G1 F15476.087
G1 X135.615 Y156.643 E.05401
G1 X135.3 Y156.327 E.01478
G1 X135.225 Y155.58 E.0249
G2 X140.713 Y154.065 I-7.972 J-39.548 E.189
G1 X143.291 Y156.643 E.12094
G1 X139.737 Y156.643 E.11787
G1 X143.573 Y152.807 E.17993
G2 X145.85 Y151.526 I-17.083 J-33.039 E.0867
G1 X150.967 Y156.643 E.24002
G1 X147.413 Y156.643 E.11787
G1 X180.837 Y123.219 E1.56798
G1 X180.837 Y125.105 E.06259
G1 X169.74 Y114.008 E.52059
G1 X169.74 Y111.288 E.09023
G1 X181.666 Y99.362 E.55946
G1 X178.122 Y99.362 E.11755
G1 X185.597 Y106.837 E.35067
G1 X181.867 Y106.837 E.12373
G1 X187.9 Y100.804 E.28302
G2 X186.665 Y99.764 I-2.901 J2.191 E.05399
G1 X185.178 Y98.955 F30000
G1 F15476.087
G3 X189.044 Y102.801 I-.187 J4.054 E.19835
G1 X189.044 Y107.244 E.14738
G1 X181.244 Y107.244 E.25874
G1 X181.244 Y130.756 E.77992
G1 X189.044 Y130.756 E.25874
G1 X189.044 Y153.194 E.74433
G3 X184.984 Y157.05 I-4.073 J-.224 E.20469
G1 X134.962 Y157.05 E1.65932
G1 X134.784 Y155.254 E.05986
G2 X158.812 Y133.333 I-4.867 J-29.464 E1.14095
G1 X169.333 Y133.333 E.34899
G1 X169.333 Y104.667 E.95089
G1 X152.833 Y104.667 E.54734
G1 X152.833 Y98.954 E.18952
G1 X185.118 Y98.955 E1.07097
G1 X184.297 Y99.362 F30000
G1 F15476.087
G3 X185.916 Y99.48 I.398 J5.72 E.054
G1 X188.521 Y102.086 E.12224
G3 X188.637 Y103.704 I-6.49 J1.278 E.05394
G1 X189.044 Y111.913 F30000
G1 F15476.087
G1 X189.044 Y110.285 E.05401
G1 X186.411 Y107.651 E.12353
G1 X188.729 Y107.651 E.07688
G1 X181.651 Y114.729 E.33201
G1 X181.651 Y118.244 E.1166
G1 X189.044 Y125.636 E.34682
G1 X189.044 Y122.688 E.09782
G1 X181.651 Y130.08 E.34682
G1 X181.651 Y130.349 E.0089
G1 X186.08 Y130.349 E.14692
G1 X181.651 Y125.92 E.20778
G1 X181.651 Y122.405 E.1166
G1 X189.044 Y115.012 E.34682
G1 X189.044 Y117.96 E.09782
G1 X181.651 Y110.568 E.34682
G1 X181.651 Y108.939 E.05401
G1 X169.74 Y107.961 F30000
G1 F15476.087
G1 X169.74 Y106.332 E.05401
G1 X180.837 Y117.429 E.52059
G1 X180.837 Y115.543 E.06259
G1 X169.74 Y126.64 E.52059
G1 X169.74 Y129.36 E.09023
G1 X188.637 Y148.257 E.88651
G1 X188.637 Y146.123 E.07081
G1 X178.117 Y156.643 E.49352
G1 X181.67 Y156.643 E.11787
G1 X159.037 Y134.009 E1.06178
G3 X158.548 Y135.562 I-16.002 J-4.182 E.05402
G1 X182.197 Y131.163 F30000
G1 F15476.087
G1 X180.837 Y131.163 E.04512
G1 X180.837 Y130.895 E.0089
G1 X155.089 Y156.643 E1.20789
G1 X158.643 Y156.643 E.11787
G1 X150.232 Y148.232 E.39456
G2 X153.92 Y144.244 I-28.179 J-29.761 E.18032
G1 X166.319 Y156.643 E.58163
G1 X162.765 Y156.643 E.11787
G1 X188.245 Y131.163 E1.19531
G1 X186.895 Y131.163 E.04479
G1 X188.637 Y132.905 E.08174
G1 X188.637 Y134.534 E.05401
G1 X188.637 Y152.304 F30000
G1 F15476.087
G3 X188.514 Y153.922 I-5.289 J.411 E.05402
G1 X185.925 Y156.511 E.12147
G3 X184.309 Y156.643 I-1.313 J-6.144 E.05392
G1 X186.669 Y156.227 F30000
G1 F15476.087
G2 X187.895 Y155.191 I-2.301 J-3.967 E.05351
G1 X166.444 Y133.74 E1.00633
G1 X162.64 Y133.74 E.12618
G1 X156.882 Y139.53 E.27087
G1 X173.995 Y156.643 E.80276
G1 X170.441 Y156.643 E.11787
G1 X188.637 Y138.447 E.85361
G1 X188.637 Y140.581 E.07081
G1 X169.74 Y121.684 E.88651
G1 X169.74 Y118.964 E.09023
G1 X180.837 Y107.867 E.52059
G1 X180.837 Y109.753 E.06259
G1 X170.446 Y99.362 E.48749
G1 X173.99 Y99.362 E.11758
G1 X169.092 Y104.26 E.22978
G1 X167.668 Y104.26 E.04724
G1 X162.769 Y99.361 E.2298
G1 X166.314 Y99.362 E.1176
G1 X161.416 Y104.26 E.2298
G1 X159.992 Y104.26 E.04724
G1 X155.093 Y99.361 E.22982
G1 X158.639 Y99.361 E.11762
G1 X153.74 Y104.26 E.22981
G1 X153.24 Y104.26 E.01659
G1 X153.24 Y103.132 E.03743
; WIPE_START
G1 F24000
G1 X153.24 Y104.26 E-.42876
G1 X153.74 Y104.26 E-.19
G1 X154.003 Y103.997 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.93 J-.785 P1  F30000
G1 X149.742 Y98.954 Z6.6
G1 Z6.2
G1 E.8 F1800
G1 F15476.087
G1 X151.37 Y98.954 E.05401
G1 X150.4 Y99.924 E.04554
G1 X147.98 Y99.924 E.08026
G1 X147.009 Y98.953 E.04555
G1 X145.381 Y98.953 E.05401
G1 X143.667 Y98.954 F30000
G1 F15476.087
G1 X143.667 Y104.667 E.18953
G1 X116.333 Y104.667 E.90673
G1 X116.333 Y98.952 E.18957
G1 X143.607 Y98.954 E.90474
G1 X138.112 Y99.36 F30000
G1 F15476.087
G1 X139.74 Y99.36 E.05401
G1 X143.26 Y102.88 E.16512
G1 X143.26 Y99.388 E.11584
G1 X138.388 Y104.26 E.22856
G1 X136.964 Y104.26 E.04724
G1 X132.064 Y99.36 E.22987
G1 X135.612 Y99.36 E.11769
G1 X130.712 Y104.26 E.22986
G1 X129.288 Y104.26 E.04724
G1 X124.388 Y99.36 E.22989
G1 X127.936 Y99.36 E.11772
G1 X123.036 Y104.26 E.22988
G1 X121.612 Y104.26 E.04724
G1 X116.74 Y99.388 E.22856
G1 X116.74 Y102.88 E.11585
G1 X120.261 Y99.36 E.16517
G1 X121.889 Y99.36 E.05401
G1 X114.621 Y98.952 F30000
G1 F15476.087
G1 X112.992 Y98.952 E.05401
G1 X112.02 Y99.924 E.04561
G1 X109.6 Y99.924 E.08026
G1 X108.628 Y98.952 E.04562
G1 X110.256 Y98.952 E.05401
G1 X107.167 Y98.952 F30000
G1 F15476.087
G1 X107.167 Y104.667 E.18959
G1 X90.667 Y104.667 E.54734
G1 X90.667 Y133.333 E.95089
G1 X101.188 Y133.333 E.34899
G2 X125.216 Y155.253 I29.005 J-7.665 E1.14026
G1 X125.039 Y157.05 E.0599
G1 X75.016 Y157.05 E1.65935
G3 X70.95 Y152.984 I.044 J-4.11 E.21122
G1 X70.953 Y130.756 E.73735
G1 X78.756 Y130.756 E.25884
G1 X78.756 Y107.244 E.77992
G1 X70.955 Y107.244 E.25875
G1 X70.956 Y102.805 E.14724
G3 X75.016 Y98.95 I4.067 J.218 E.20477
G1 X107.107 Y98.952 E1.06452
G1 X106.76 Y103.132 F30000
G1 F15476.087
G1 X106.76 Y104.26 E.03743
G1 X106.26 Y104.26 E.01659
G1 X101.359 Y99.359 E.22994
G1 X104.909 Y99.359 E.11779
G1 X100.008 Y104.26 E.22993
G1 X98.584 Y104.26 E.04724
G1 X93.682 Y99.358 E.22995
G1 X97.234 Y99.358 E.11781
G1 X92.332 Y104.26 E.22995
G1 X90.908 Y104.26 E.04724
G1 X86.006 Y99.358 E.22997
G1 X89.558 Y99.358 E.11783
G1 X79.163 Y109.753 E.48767
G1 X79.163 Y107.867 E.06259
G1 X90.26 Y118.964 E.52059
G1 X90.26 Y121.684 E.09023
G1 X71.359 Y140.585 E.8867
G1 X71.359 Y138.443 E.07108
G1 X89.559 Y156.643 E.85379
G1 X86.005 Y156.643 E.11787
G1 X103.115 Y139.533 E.80265
G1 X97.36 Y133.74 E.27087
G1 X93.556 Y133.74 E.12618
G1 X72.105 Y155.191 E1.00632
G2 X72.411 Y155.548 I1.355 J-.853 E.01563
G1 X72.411 Y155.548 E0
G2 X73.325 Y156.221 I2.638 J-2.622 E.03783
G1 X75.704 Y156.643 F30000
G1 F15476.087
G3 X74.086 Y156.521 I-.099 J-9.542 E.0539
G1 X71.48 Y153.915 E.12225
G1 X71.44 Y153.758 E.00538
G3 X71.358 Y152.298 I9.091 J-1.249 E.04857
G1 X71.359 Y134.537 F30000
G1 F15476.087
G1 X71.36 Y132.909 E.05401
G1 X73.105 Y131.163 E.0819
G1 X71.755 Y131.163 E.04479
G1 X97.235 Y156.643 E1.19531
G1 X93.681 Y156.643 E.11787
G1 X106.082 Y144.242 E.58173
G2 X109.768 Y148.232 I24.498 J-18.939 E.18042
G1 X101.357 Y156.643 E.39458
G1 X104.911 Y156.643 E.11787
G1 X79.163 Y130.895 E1.20789
G1 X79.163 Y131.163 E.0089
G1 X77.803 Y131.163 E.04512
G1 X70.955 Y111.914 F30000
G1 F15476.087
G1 X70.955 Y110.285 E.05401
G1 X73.589 Y107.651 E.12357
G1 X71.271 Y107.651 E.07688
G1 X78.349 Y114.729 E.33201
G1 X78.349 Y118.244 E.1166
G1 X70.953 Y125.639 E.34693
G1 X70.954 Y122.685 E.09797
G1 X78.349 Y130.08 E.34692
G1 X78.349 Y130.349 E.0089
G1 X73.92 Y130.349 E.14692
G1 X78.349 Y125.92 E.20778
G1 X78.349 Y122.405 E.1166
G1 X70.954 Y115.01 E.34688
G1 X70.954 Y117.962 E.09792
G1 X78.349 Y110.568 E.34689
G1 X78.349 Y108.939 E.05401
G1 X90.26 Y107.961 F30000
G1 F15476.087
G1 X90.26 Y106.332 E.05401
G1 X79.163 Y117.429 E.52059
G1 X79.163 Y115.543 E.06259
G1 X90.26 Y126.64 E.52059
G1 X90.26 Y129.36 E.09023
G1 X71.358 Y148.262 E.88674
G1 X71.358 Y146.118 E.07113
G1 X81.883 Y156.643 E.49374
G1 X78.33 Y156.643 E.11787
G1 X100.963 Y134.009 E1.06178
G2 X101.449 Y135.563 I17.487 J-4.621 E.05402
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X100.963 Y134.009 E-.61862
G1 X100.7 Y134.272 E-.14138
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
G3 Z6.6 I.026 J1.217 P1  F30000
G1 X168.834 Y132.834 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X158.413 Y132.834 E.34568
G3 X101.59 Y132.834 I-28.411 J-6.964 E2.58195
G1 X91.166 Y132.834 E.34577
G1 X91.166 Y105.166 E.91777
G1 X107.666 Y105.166 E.54734
G1 X107.666 Y100.166 E.16586
G1 X115.834 Y100.166 E.27092
G1 X115.834 Y105.166 E.16586
G1 X144.166 Y105.166 E.93986
G1 X144.166 Y100.166 E.16586
G1 X152.334 Y100.166 E.27092
G1 X152.334 Y105.166 E.16586
G1 X168.834 Y105.166 E.54734
G1 X168.834 Y132.774 E.91578
G1 X168.441 Y132.441 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X158.101 Y132.441 E.31772
G3 X101.899 Y132.441 I-28.101 J-6.568 E2.37858
G1 X91.559 Y132.441 E.31774
G1 X91.559 Y105.559 E.82604
G1 X108.059 Y105.559 E.507
G1 X108.059 Y100.559 E.15364
G1 X115.441 Y100.559 E.22686
G1 X115.441 Y105.559 E.15364
G1 X144.559 Y105.559 E.89469
G1 X144.559 Y100.559 E.15364
G1 X151.941 Y100.559 E.22686
G1 X151.941 Y105.559 E.15364
G1 X168.441 Y105.559 E.507
G1 X168.441 Y132.381 E.82419
M204 S10000
; WIPE_START
G1 F24000
G1 X166.441 Y132.393 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.362 J-1.162 P1  F30000
G1 X70.624 Y102.569 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X75.007 Y98.602 I4.388 J.443 E.21491
G1 X185.193 Y98.607 E3.65504
G3 X189.398 Y103.007 I-.195 J4.396 E.22296
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.411 J-.006 E.22946
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I.006 J-4.411 E.22946
G1 X70.602 Y103.007 E1.6581
G3 X70.619 Y102.629 I4.41 J.005 E.01258
G1 X70.232 Y102.547 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P59 R17
G1 F12000
G1 X70.234 Y102.531 E.00049
G3 X75.003 Y98.21 I4.779 J.483 E.21665
G1 X185.211 Y98.215 E3.3864
G3 X189.79 Y103.003 I-.214 J4.788 E.22474
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.804 J-.012 E.23117
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.012 J-4.804 E.23117
G1 X70.21 Y103.003 E1.5362
G1 X70.229 Y102.606 E.01219
M204 S10000
; WIPE_START
G1 F24000
G1 X70.234 Y102.531 E-.02888
G1 X70.302 Y102.066 E-.17861
G1 X70.416 Y101.61 E-.17861
G1 X70.575 Y101.167 E-.17863
G1 X70.776 Y100.742 E-.17862
G1 X70.798 Y100.704 E-.01665
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.196 J.225 P1  F30000
G1 X71.363 Y103.702 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X71.481 Y102.084 I5.567 J-.408 E.05401
G1 X74.083 Y99.481 E.1221
G3 X75.701 Y99.357 I1.259 J5.83 E.05398
G1 X73.331 Y99.773 F30000
G1 F15476.087
G2 X72.105 Y100.809 I1.986 J3.593 E.05358
G1 X78.133 Y106.837 E.2828
G1 X74.403 Y106.837 E.12373
G1 X81.883 Y99.358 E.35087
G1 X78.33 Y99.358 E.11786
G1 X90.26 Y111.288 E.55968
G1 X90.26 Y114.008 E.09023
G1 X79.163 Y125.105 E.52059
G1 X79.163 Y123.219 E.06259
G1 X112.587 Y156.643 E1.56798
G1 X109.033 Y156.643 E.11787
G1 X114.149 Y151.527 E.23998
G2 X116.432 Y152.812 I21.635 J-35.781 E.08691
G1 X120.263 Y156.643 E.17972
G1 X116.709 Y156.643 E.11787
G1 X119.286 Y154.066 E.12089
G2 X124.775 Y155.58 I10.962 J-29.034 E.18914
G1 X124.701 Y156.327 E.0249
G1 X124.385 Y156.643 E.01482
G1 X122.757 Y156.643 E.05401
G1 X125.449 Y157.039 F30000
G1 F15476.087
G1 X125.609 Y155.419 E.05401
G1 X125.85 Y155.178 E.01129
G2 X126.571 Y155.275 I1.346 J-7.276 E.02417
G1 X128.346 Y157.05 E.08324
G1 X131.654 Y157.05 E.10975
G1 X133.429 Y155.275 E.08326
G2 X134.15 Y155.178 I-.612 J-7.32 E.02415
G1 X134.391 Y155.419 E.01129
G1 X134.552 Y157.039 E.05401
G1 X137.243 Y156.643 F30000
G1 F15476.087
G1 X135.615 Y156.643 E.05401
G1 X135.3 Y156.327 E.01478
G1 X135.225 Y155.58 E.0249
G2 X140.713 Y154.065 I-7.972 J-39.548 E.189
G1 X143.291 Y156.643 E.12094
G1 X139.737 Y156.643 E.11787
G1 X143.573 Y152.807 E.17993
G2 X145.85 Y151.526 I-17.083 J-33.039 E.0867
G1 X150.967 Y156.643 E.24002
G1 X147.413 Y156.643 E.11787
G1 X180.837 Y123.219 E1.56798
G1 X180.837 Y125.105 E.06259
G1 X169.74 Y114.008 E.52059
G1 X169.74 Y111.288 E.09023
G1 X181.666 Y99.362 E.55946
G1 X178.122 Y99.362 E.11755
G1 X185.597 Y106.837 E.35067
G1 X181.867 Y106.837 E.12373
G1 X187.9 Y100.804 E.28302
G1 X187.869 Y100.762 E.00173
G2 X186.665 Y99.764 I-2.844 J2.204 E.05228
G1 X185.178 Y98.955 F30000
G1 F15476.087
G3 X188.504 Y100.98 I-.191 J4.058 E.13471
G1 X188.504 Y100.98 E0
G3 X189.044 Y102.801 I-4.741 J2.396 E.06334
G1 X189.044 Y107.244 E.14738
G1 X181.244 Y107.244 E.25874
G1 X181.244 Y130.756 E.77992
G1 X189.044 Y130.756 E.25874
G1 X189.044 Y153.194 E.74433
G3 X184.984 Y157.05 I-4.124 J-.278 E.20403
G1 X134.962 Y157.05 E1.65931
G1 X134.784 Y155.254 E.05986
G2 X158.66 Y133.849 I-4.849 J-29.428 E1.12304
G1 X159.334 Y133.333 E.02817
G1 X168.583 Y133.333 E.30679
G1 X168.727 Y133.682 E.01252
G1 X169.377 Y133.682 E.02154
G1 X169.682 Y133.377 E.0143
G1 X169.682 Y132.727 E.02154
G1 X169.333 Y132.583 E.01252
G1 X169.333 Y105.417 E.90114
G1 X169.682 Y105.273 E.01252
G1 X169.682 Y104.623 E.02154
G1 X169.377 Y104.318 E.0143
G1 X168.727 Y104.318 E.02154
G1 X168.583 Y104.667 E.01252
G1 X153.342 Y104.667 E.50558
G1 X152.833 Y104.158 E.02387
G1 X152.833 Y100.417 E.1241
G1 X153.182 Y100.273 E.01252
G1 X153.182 Y99.623 E.02154
G1 X152.833 Y99.318 E.01537
G1 X152.833 Y98.954 E.01209
G1 X185.118 Y98.955 E1.07097
G1 X184.297 Y99.362 F30000
G1 F15476.087
G3 X185.916 Y99.48 I.398 J5.719 E.054
G1 X188.521 Y102.086 E.12224
G3 X188.637 Y103.703 I-4.379 J1.127 E.0541
G1 X189.044 Y111.913 F30000
G1 F15476.087
G1 X189.044 Y110.285 E.05401
G1 X186.411 Y107.651 E.12353
G1 X188.729 Y107.651 E.07688
G1 X181.651 Y114.729 E.33201
G1 X181.651 Y118.244 E.1166
G1 X189.044 Y125.636 E.34681
G1 X189.044 Y122.688 E.09782
G1 X181.651 Y130.08 E.34681
G1 X181.651 Y130.349 E.0089
G1 X186.08 Y130.349 E.14692
G1 X181.651 Y125.92 E.20778
G1 X181.651 Y122.405 E.1166
G1 X189.044 Y115.012 E.34681
G1 X189.044 Y117.96 E.09782
G1 X181.651 Y110.568 E.34681
G1 X181.651 Y108.939 E.05401
G1 X169.74 Y107.961 F30000
G1 F15476.087
G1 X169.74 Y106.332 E.05401
G1 X180.837 Y117.429 E.52059
G1 X180.837 Y115.543 E.06259
G1 X169.74 Y126.64 E.52059
G1 X169.74 Y129.36 E.09023
G1 X188.637 Y148.257 E.88651
G1 X188.637 Y146.123 E.07081
G1 X178.117 Y156.643 E.49352
G1 X181.67 Y156.643 E.11787
G1 X159.095 Y134.067 E1.05906
G1 X159.518 Y133.74 E.01775
G1 X162.64 Y133.74 E.10354
G1 X156.882 Y139.53 E.27087
G1 X173.995 Y156.643 E.80276
G1 X170.441 Y156.643 E.11787
G1 X188.637 Y138.447 E.85361
G1 X188.637 Y140.581 E.07081
G1 X169.74 Y121.684 E.88651
G1 X169.74 Y118.964 E.09023
G1 X180.837 Y107.867 E.52059
G1 X180.837 Y109.753 E.06259
G1 X170.446 Y99.362 E.48749
G1 X173.99 Y99.362 E.11758
G1 X169.441 Y103.911 E.21342
G1 X168.455 Y103.911 E.03268
G1 X168.311 Y104.26 E.01252
G1 X167.668 Y104.26 E.02133
G1 X162.769 Y99.361 E.2298
G1 X166.314 Y99.362 E.1176
G1 X161.416 Y104.26 E.2298
G1 X159.992 Y104.26 E.04724
G1 X155.093 Y99.361 E.22982
G1 X158.639 Y99.361 E.11762
G1 X153.74 Y104.26 E.22981
G1 X153.51 Y104.26 E.00762
G1 X153.24 Y103.99 E.01268
G1 X153.24 Y102.973 E.03371
G1 X152.805 Y104.673 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518906
G1 F13235.683
G2 X152.804 Y104.776 I-.03 J.051 E.00963
G1 X152.731 Y99.81 F30000
; LINE_WIDTH: 0.537176
G1 F12746.43
G1 X152.744 Y99.9 E.00365
; LINE_WIDTH: 0.489714
G1 F14100.482
G1 X152.758 Y99.989 E.0033
G1 X152.537 Y99.742 E.01205
; LINE_WIDTH: 0.483998
G1 F14283.188
G1 X152.609 Y99.762 E.00268
; LINE_WIDTH: 0.509741
G1 F13495.537
G1 X152.681 Y99.781 E.00284
G1 X149.742 Y98.954 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X151.37 Y98.954 E.05401
G1 X150.506 Y99.818 E.04055
G1 X147.874 Y99.818 E.0873
G1 X147.009 Y98.954 E.04056
G1 X145.381 Y98.953 E.05401
G1 X143.667 Y98.954 F30000
G1 F15476.087
G1 X143.667 Y99.318 E.0121
G1 X143.318 Y99.623 E.01537
G1 X143.318 Y100.273 E.02154
G1 X143.667 Y100.417 E.01252
G1 X143.667 Y104.158 E.1241
G1 X143.158 Y104.667 E.02387
G1 X116.842 Y104.667 E.87297
G1 X116.333 Y104.158 E.02387
G1 X116.333 Y100.417 E.1241
G1 X116.682 Y100.273 E.01252
G1 X116.682 Y99.623 E.02154
G1 X116.333 Y99.318 E.01537
G1 X116.333 Y98.952 E.01214
G1 X143.607 Y98.954 E.90474
G1 X143.742 Y99.989 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483998
G1 F14283.188
G1 X143.766 Y99.889 E.0037
; LINE_WIDTH: 0.524839
G1 F13072.756
G1 X143.789 Y99.789 E.00404
G1 X143.931 Y99.756 E.00572
G1 X143.755 Y104.673 F30000
; LINE_WIDTH: 0.518908
G1 F13235.627
G2 X143.754 Y104.776 I-.03 J.051 E.00963
G1 X138.112 Y99.36 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.74 Y99.36 E.05401
G1 X143.26 Y102.88 E.16512
G1 X143.26 Y100.689 E.07269
G1 X142.911 Y100.545 E.01252
G1 X142.911 Y99.737 E.0268
G1 X138.388 Y104.26 E.2122
G1 X136.964 Y104.26 E.04724
G1 X132.064 Y99.36 E.22987
G1 X135.612 Y99.36 E.11769
G1 X130.712 Y104.26 E.22986
G1 X129.288 Y104.26 E.04724
G1 X124.388 Y99.36 E.22989
G1 X127.936 Y99.36 E.11772
G1 X123.036 Y104.26 E.22988
G1 X121.612 Y104.26 E.04724
G1 X117.089 Y99.737 E.2122
G1 X117.089 Y100.545 E.0268
G1 X116.74 Y100.689 E.01252
G1 X116.74 Y102.88 E.07269
G1 X120.261 Y99.36 E.16517
G1 X121.889 Y99.36 E.05401
G1 X116.231 Y99.81 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.537182
G1 F12746.276
G1 X116.244 Y99.9 E.00365
; LINE_WIDTH: 0.489721
G1 F14100.234
G1 X116.258 Y99.989 E.0033
G1 X116.037 Y99.742 E.01205
; LINE_WIDTH: 0.483998
G1 F14283.188
G1 X116.109 Y99.762 E.00268
; LINE_WIDTH: 0.509742
G1 F13495.508
G1 X116.181 Y99.781 E.00284
G1 X114.62 Y98.952 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X112.992 Y98.952 E.05401
G1 X112.126 Y99.818 E.04063
G1 X109.494 Y99.818 E.0873
G1 X108.628 Y98.952 E.04064
G1 X110.256 Y98.952 E.05401
G1 X107.167 Y98.952 F30000
G1 F15476.087
G1 X107.167 Y99.318 E.01216
G1 X106.818 Y99.623 E.01537
G1 X106.818 Y100.273 E.02154
G1 X107.167 Y100.417 E.01252
G1 X107.167 Y104.158 E.1241
G1 X106.658 Y104.667 E.02387
G1 X91.417 Y104.667 E.50558
G1 X91.273 Y104.318 E.01252
G1 X90.623 Y104.318 E.02154
G1 X90.318 Y104.623 E.0143
G1 X90.318 Y105.273 E.02154
G1 X90.667 Y105.417 E.01252
G1 X90.667 Y132.583 E.90114
G1 X90.318 Y132.727 E.01252
G1 X90.318 Y133.377 E.02154
G1 X90.623 Y133.682 E.0143
G1 X91.273 Y133.682 E.02154
G1 X91.417 Y133.333 E.01252
G1 X100.666 Y133.333 E.30679
G1 X101.341 Y133.851 E.02822
G2 X125.216 Y155.253 I28.838 J-8.152 E1.12228
G1 X125.039 Y157.05 E.0599
G1 X75.02 Y157.05 E1.65921
G3 X70.95 Y152.984 I.009 J-4.079 E.21179
G1 X70.953 Y130.756 E.73735
G1 X78.756 Y130.756 E.25884
G1 X78.756 Y107.244 E.77992
G1 X70.955 Y107.244 E.25875
G1 X70.956 Y102.806 E.14724
G3 X75.016 Y98.95 I4.1 J.252 E.20435
G1 X107.107 Y98.952 E1.06452
G1 X107.242 Y99.989 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483998
G1 F14283.188
G1 X107.266 Y99.889 E.0037
; LINE_WIDTH: 0.524837
G1 F13072.797
G1 X107.289 Y99.789 E.00404
G1 X107.431 Y99.756 E.00572
G1 X106.76 Y102.973 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X106.76 Y103.99 E.03371
G1 X106.49 Y104.26 E.01268
G1 X106.26 Y104.26 E.00762
G1 X101.359 Y99.359 E.22994
G1 X104.909 Y99.359 E.11779
G1 X100.008 Y104.26 E.22993
G1 X98.584 Y104.26 E.04724
G1 X93.682 Y99.358 E.22995
G1 X97.234 Y99.358 E.11781
G1 X92.332 Y104.26 E.22995
G1 X91.689 Y104.26 E.02133
G1 X91.545 Y103.911 E.01252
G1 X90.559 Y103.911 E.03268
G1 X86.006 Y99.358 E.21361
G1 X89.558 Y99.358 E.11783
G1 X79.163 Y109.753 E.48767
G1 X79.163 Y107.867 E.06259
G1 X90.26 Y118.964 E.52059
G1 X90.26 Y121.684 E.09023
G1 X71.359 Y140.585 E.8867
G1 X71.359 Y138.443 E.07108
G1 X89.559 Y156.643 E.85379
G1 X86.005 Y156.643 E.11787
G1 X103.115 Y139.533 E.80265
G1 X97.36 Y133.74 E.27087
G1 X100.482 Y133.74 E.10354
G1 X100.905 Y134.067 E.01775
G1 X78.33 Y156.643 E1.05906
G1 X81.883 Y156.643 E.11787
G1 X71.358 Y146.118 E.49374
G1 X71.358 Y148.262 E.07113
G1 X90.26 Y129.36 E.88674
G1 X90.26 Y126.64 E.09023
G1 X79.163 Y115.543 E.52059
G1 X79.163 Y117.429 E.06259
G1 X90.26 Y106.332 E.52059
G1 X90.26 Y107.961 E.05401
G1 X90.742 Y104.989 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483998
G1 F14283.188
G1 X90.766 Y104.889 E.0037
; LINE_WIDTH: 0.524837
G1 F13072.797
G1 X90.789 Y104.789 E.00404
G1 X90.931 Y104.756 E.00572
G1 X78.349 Y108.939 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X78.349 Y110.568 E.05401
G1 X70.954 Y117.962 E.34689
G1 X70.954 Y115.01 E.09792
G1 X78.349 Y122.404 E.34688
G1 X78.349 Y125.92 E.1166
G1 X73.92 Y130.349 E.20778
G1 X78.349 Y130.349 E.14692
G1 X78.349 Y130.08 E.0089
G1 X70.954 Y122.685 E.34692
G1 X70.953 Y125.639 E.09797
G1 X78.349 Y118.244 E.34693
G1 X78.349 Y114.729 E.1166
G1 X71.271 Y107.651 E.33201
G1 X73.589 Y107.651 E.07688
G1 X70.955 Y110.285 E.12357
G1 X70.955 Y111.914 E.05401
G1 X77.803 Y131.163 F30000
G1 F15476.087
G1 X79.163 Y131.163 E.04512
G1 X79.163 Y130.895 E.0089
G1 X104.911 Y156.643 E1.20789
G1 X101.357 Y156.643 E.11787
G1 X109.768 Y148.232 E.39458
G3 X106.082 Y144.242 I20.811 J-22.929 E.18042
G1 X93.681 Y156.643 E.58173
G1 X97.235 Y156.643 E.11787
G1 X71.755 Y131.163 E1.19531
G1 X73.105 Y131.163 E.04479
G1 X71.36 Y132.909 E.0819
G1 X71.359 Y134.537 E.05401
G1 X71.358 Y152.298 F30000
G1 F15476.087
G2 X71.48 Y153.915 I6.97 J.286 E.05394
G1 X74.078 Y156.514 E.1219
G2 X75.696 Y156.643 I1.388 J-7.215 E.05394
G1 X73.325 Y156.222 F30000
G1 F15476.087
G1 X73.141 Y156.129 E.00686
G3 X72.201 Y155.314 I6.561 J-8.521 E.04126
G1 X72.105 Y155.191 E.00518
G1 X93.556 Y133.74 E1.00632
G1 X95.185 Y133.74 E.05401
G1 X90.742 Y133.011 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483998
G1 F14283.188
G1 X90.766 Y133.111 E.0037
; LINE_WIDTH: 0.52485
G1 F13072.451
G1 X90.789 Y133.211 E.00404
G1 X90.931 Y133.244 E.00572
G1 X101.281 Y133.219 F30000
; LINE_WIDTH: 0.50789
G1 F13549.262
G2 X101.279 Y133.32 I-.029 J.05 E.00909
; WIPE_START
G1 F24000
G1 X101.223 Y133.32 E-.18536
G1 X101.194 Y133.27 E-.19155
G1 X101.223 Y133.219 E-.19155
G1 X101.281 Y133.219 E-.19155
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.191 J.249 P1  F30000
G1 X107.255 Y104.673 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.518908
G1 F13235.627
G2 X107.254 Y104.776 I-.03 J.051 E.00963
; WIPE_START
G1 F24000
G1 X107.195 Y104.776 E-.1888
G1 X107.165 Y104.725 E-.1904
G1 X107.195 Y104.673 E-.1904
G1 X107.255 Y104.673 E-.1904
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I0 J1.217 P1  F30000
G1 X116.305 Y104.673 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.51891
M73 P59 R16
G1 F13235.572
G2 X116.304 Y104.776 I-.03 J.051 E.00963
; WIPE_START
G1 F24000
G1 X116.245 Y104.776 E-.1888
G1 X116.216 Y104.725 E-.1904
G1 X116.245 Y104.673 E-.1904
G1 X116.305 Y104.673 E-.1904
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.679 J1.01 P1  F30000
G1 X158.779 Y133.219 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.50705
G1 F13573.784
G2 X158.777 Y133.319 I-.029 J.05 E.00905
G1 X164.815 Y133.74 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X166.444 Y133.74 E.05401
G1 X187.895 Y155.191 E1.00633
G3 X186.77 Y156.17 I-3.601 J-3.004 E.04968
G1 X186.669 Y156.227 E.00383
G1 X184.308 Y156.643 F30000
G1 F15476.087
G2 X185.924 Y156.512 I.302 J-6.31 E.05392
G1 X188.514 Y153.922 E.12149
G2 X188.637 Y152.304 I-5.166 J-1.207 E.05402
G1 X188.637 Y134.534 F30000
G1 F15476.087
G1 X188.637 Y132.905 E.05401
G1 X186.895 Y131.163 E.08174
G1 X188.245 Y131.163 E.04479
G1 X162.765 Y156.643 E1.19531
G1 X166.319 Y156.643 E.11787
G1 X153.92 Y144.244 E.58163
G3 X150.232 Y148.232 I-31.867 J-25.773 E.18032
G1 X158.643 Y156.643 E.39456
G1 X155.089 Y156.643 E.11787
G1 X180.837 Y130.895 E1.20789
G1 X180.837 Y131.163 E.0089
G1 X182.197 Y131.163 E.04512
G1 X169.011 Y133.258 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.484004
G1 F14282.993
G1 X169.111 Y133.234 E.0037
; LINE_WIDTH: 0.524843
G1 F13072.633
G1 X169.211 Y133.211 E.00404
G1 X169.244 Y133.069 E.00572
G1 X169.231 Y104.81 F30000
; LINE_WIDTH: 0.537176
G1 F12746.43
G1 X169.244 Y104.9 E.00365
; LINE_WIDTH: 0.489714
G1 F14100.479
G1 X169.258 Y104.989 E.0033
G1 X169.037 Y104.742 E.01205
; LINE_WIDTH: 0.483998
G1 F14283.188
G1 X169.109 Y104.762 E.00268
; LINE_WIDTH: 0.509741
G1 F13495.537
G1 X169.181 Y104.781 E.00284
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X169.109 Y104.762 E-.76
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
G3 Z6.8 I-1.217 J-.005 P1  F30000
G1 X168.985 Y132.985 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X158.528 Y132.985 E.34685
G3 X101.471 Y132.985 I-28.529 J-7.115 E2.58736
G1 X91.015 Y132.985 E.34683
G1 X91.015 Y105.015 E.92779
G1 X107.515 Y105.015 E.54734
G1 X107.515 Y100.015 E.16586
G1 X115.985 Y100.015 E.28094
G1 X115.985 Y105.015 E.16586
G1 X144.015 Y105.015 E.92984
G1 X144.015 Y100.015 E.16586
G1 X152.485 Y100.015 E.28094
G1 X152.485 Y105.015 E.16586
G1 X168.985 Y105.015 E.54734
G1 X168.985 Y132.925 E.9258
G1 X168.592 Y132.592 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X158.221 Y132.592 E.3187
G3 X101.779 Y132.592 I-28.221 J-6.722 E2.38352
G1 X91.408 Y132.592 E.3187
G1 X91.408 Y105.408 E.83532
G1 X107.908 Y105.408 E.507
G1 X107.908 Y100.408 E.15364
G1 X115.592 Y100.408 E.23614
G1 X115.592 Y105.408 E.15364
G1 X144.408 Y105.408 E.88541
G1 X144.408 Y100.408 E.15364
G1 X152.092 Y100.408 E.23614
G1 X152.092 Y105.408 E.15364
G1 X168.592 Y105.408 E.507
G1 X168.592 Y132.532 E.83347
M204 S10000
; WIPE_START
G1 F24000
G1 X166.593 Y132.544 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.363 J-1.162 P1  F30000
G1 X70.624 Y102.569 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X75.007 Y98.602 I4.389 J.444 E.2149
G1 X185.199 Y98.607 E3.65526
G3 X189.398 Y103.007 I-.202 J4.396 E.22274
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.411 J-.006 E.22946
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I.005 J-4.411 E.22947
G1 X70.602 Y103.007 E1.6581
G3 X70.619 Y102.629 I4.411 J.006 E.01258
G1 X70.232 Y102.547 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.234 Y102.531 E.00049
G3 X75.003 Y98.21 I4.78 J.483 E.21664
G1 X185.218 Y98.215 E3.38661
G3 X189.79 Y103.003 I-.221 J4.788 E.22453
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.804 J-.012 E.23117
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.011 J-4.804 E.23118
G1 X70.21 Y103.003 E1.5362
G1 X70.229 Y102.606 E.01219
M204 S10000
; WIPE_START
G1 F24000
G1 X70.234 Y102.531 E-.02887
G1 X70.299 Y102.082 E-.17207
G1 X70.416 Y101.61 E-.18513
G1 X70.575 Y101.167 E-.17864
G1 X70.776 Y100.742 E-.17862
G1 X70.798 Y100.704 E-.01667
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.212 J.113 P1  F30000
G1 X71.425 Y107.425 Z7
G1 Z6.6
M73 P60 R16
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.401985
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X71.425 Y101.163 E.32381
G3 X71.877 Y100.458 I3.084 J1.48 E.04341
G1 X71.877 Y107.223 E.34979
G1 X72.329 Y107.223 E.02337
G1 X72.329 Y99.99 E.37398
G1 X72.781 Y99.641 E.02953
G1 X72.781 Y107.223 E.39203
G1 X73.233 Y107.223 E.02337
G1 X73.233 Y99.385 E.40527
G1 X73.685 Y99.203 E.02521
G1 X73.685 Y107.223 E.41471
G1 X74.137 Y107.223 E.02337
G1 X74.137 Y99.069 E.42162
G3 X74.589 Y98.994 I.607 J2.257 E.02373
G1 X74.589 Y107.223 E.42549
G1 X75.041 Y107.223 E.02337
G1 X75.041 Y98.972 E.42665
G1 X75.493 Y98.972 E.02337
G1 X75.493 Y107.223 E.42665
G1 X75.945 Y107.223 E.02337
G1 X75.945 Y98.972 E.42665
G1 X76.397 Y98.972 E.02337
G1 X76.397 Y107.223 E.42665
G1 X76.849 Y107.223 E.02337
G1 X76.849 Y98.972 E.42665
G1 X77.301 Y98.972 E.02337
G1 X77.301 Y107.223 E.42665
G1 X77.753 Y107.223 E.02337
G1 X77.753 Y98.972 E.42665
G1 X78.205 Y98.972 E.02337
G1 X78.205 Y107.425 E.43712
M106 S127.5
G1 X78.349 Y108.939 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X78.349 Y110.568 E.05401
G1 X70.954 Y117.962 E.34689
G1 X70.954 Y115.01 E.09792
G1 X78.349 Y122.404 E.34688
G1 X78.349 Y125.92 E.1166
G1 X73.92 Y130.349 E.20778
G1 X78.349 Y130.349 E.14692
G1 X78.349 Y130.08 E.0089
G1 X70.954 Y122.685 E.34692
G1 X70.953 Y125.639 E.09797
G1 X78.349 Y118.244 E.34693
G1 X78.349 Y114.729 E.1166
G1 X71.271 Y107.651 E.33201
G1 X73.589 Y107.651 E.07688
G1 X70.955 Y110.285 E.12357
G1 X70.955 Y111.914 E.05401
G1 X70.973 Y130.575 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.401985
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X70.973 Y153.005 E1.15986
G2 X71.36 Y154.722 I4.014 J-.002 E.09174
G1 X71.425 Y154.837 E.00684
G1 X71.425 Y130.777 E1.24411
G1 X71.877 Y130.777 E.02337
G1 X71.877 Y155.526 E1.27973
G2 X72.329 Y156.002 I1.831 J-1.285 E.03407
G1 X72.329 Y130.777 E1.30436
G1 X72.781 Y130.777 E.02337
G1 X72.781 Y156.349 E1.32231
G2 X73.233 Y156.607 I1.095 J-1.396 E.027
G1 X73.233 Y130.777 E1.33563
G1 X73.685 Y130.777 E.02337
G1 X73.685 Y156.795 E1.34537
G2 X74.137 Y156.926 I.668 J-1.458 E.02443
G1 X74.137 Y130.777 E1.35215
G1 X74.589 Y130.777 E.02337
G1 X74.589 Y157.005 E1.35621
G2 X75.041 Y157.028 I.923 J-13.423 E.0234
G1 X75.041 Y130.777 E1.35742
G1 X75.493 Y130.777 E.02337
G1 X75.493 Y157.028 E1.35742
G1 X75.945 Y157.028 E.02337
G1 X75.945 Y130.777 E1.35742
G1 X76.397 Y130.777 E.02337
G1 X76.397 Y157.028 E1.35742
G1 X76.849 Y157.028 E.02337
G1 X76.849 Y130.777 E1.35742
G1 X77.301 Y130.777 E.02337
G1 X77.301 Y157.028 E1.35742
G1 X77.753 Y157.028 E.02337
G1 X77.753 Y130.777 E1.35742
G1 X78.205 Y130.777 E.02337
G1 X78.205 Y157.028 E1.35742
G1 X78.657 Y157.028 E.02337
G1 X78.657 Y98.972 E3.00205
G1 X79.109 Y98.972 E.02337
G1 X79.109 Y157.028 E3.00205
G1 X79.561 Y157.028 E.02337
G1 X79.561 Y98.972 E3.00205
G1 X80.013 Y98.972 E.02337
G1 X80.013 Y157.028 E3.00205
G1 X80.465 Y157.028 E.02337
G1 X80.465 Y98.972 E3.00205
G1 X80.917 Y98.972 E.02337
G1 X80.917 Y157.028 E3.00205
G1 X81.368 Y157.028 E.02337
G1 X81.369 Y98.972 E3.00205
G1 X81.82 Y98.972 E.02337
G1 X81.82 Y157.028 E3.00205
G1 X82.272 Y157.028 E.02337
G1 X82.272 Y98.972 E3.00205
G1 X82.724 Y98.972 E.02337
G1 X82.724 Y157.028 E3.00204
G1 X83.176 Y157.028 E.02337
G1 X83.176 Y98.972 E3.00204
G1 X83.628 Y98.972 E.02337
G1 X83.628 Y157.028 E3.00204
G1 X84.08 Y157.028 E.02337
G1 X84.08 Y98.972 E3.00204
G1 X84.532 Y98.972 E.02337
G1 X84.532 Y157.028 E3.00204
G1 X84.984 Y157.028 E.02337
G1 X84.984 Y98.972 E3.00204
G1 X85.436 Y98.972 E.02337
G1 X85.436 Y157.028 E3.00204
G1 X85.888 Y157.028 E.02337
G1 X85.888 Y98.972 E3.00204
G1 X86.34 Y98.972 E.02337
G1 X86.34 Y157.028 E3.00204
G1 X86.792 Y157.028 E.02337
G1 X86.792 Y98.972 E3.00204
G1 X87.244 Y98.972 E.02337
G1 X87.244 Y157.028 E3.00203
G1 X87.696 Y157.028 E.02337
G1 X87.696 Y98.972 E3.00203
G1 X88.148 Y98.972 E.02337
G1 X88.148 Y157.028 E3.00203
G1 X88.6 Y157.028 E.02337
G1 X88.6 Y98.972 E3.00203
G1 X89.052 Y98.972 E.02337
G1 X89.052 Y157.028 E3.00203
G1 X89.504 Y157.028 E.02337
G1 X89.504 Y98.972 E3.00203
G1 X89.956 Y98.972 E.02337
G1 X89.956 Y157.231 E3.0125
M106 S127.5
G1 X124.759 Y157.231 F30000
M106 S255
G1 F3000
G1 X124.759 Y155.183 E.10587
G1 X124.307 Y155.093 E.02383
G1 X124.307 Y157.028 E.10006
G1 X123.855 Y157.028 E.02337
G1 X123.855 Y155.003 E.10473
G3 X123.403 Y154.91 I.718 J-4.634 E.02387
G1 X123.403 Y157.028 E.10954
G1 X122.951 Y157.028 E.02337
G1 X122.951 Y154.796 E.11541
G1 X122.499 Y154.683 E.0241
G1 X122.499 Y157.028 E.12128
G1 X122.047 Y157.028 E.02337
M73 P61 R16
G1 X122.047 Y154.569 E.12715
G3 X121.595 Y154.432 I1.165 J-4.657 E.02443
G1 X121.595 Y157.028 E.13424
G1 X121.143 Y157.028 E.02337
G1 X121.143 Y154.295 E.14135
G1 X120.691 Y154.157 E.02443
G1 X120.691 Y157.028 E.14846
G1 X120.239 Y157.028 E.02337
G1 X120.239 Y153.998 E.15669
G1 X119.787 Y153.836 E.02483
G1 X119.787 Y157.028 E.16508
G1 X119.335 Y157.028 E.02337
G1 X119.335 Y153.674 E.17347
G3 X118.883 Y153.49 I1.635 J-4.679 E.02523
G1 X118.883 Y157.028 E.18295
G1 X118.431 Y157.028 E.02337
G1 X118.431 Y153.302 E.19266
G1 X117.979 Y153.115 E.02531
G1 X117.979 Y157.028 E.20237
G1 X117.527 Y157.028 E.02337
G1 X117.527 Y152.905 E.21323
G1 X117.075 Y152.69 E.02587
G1 X117.075 Y157.028 E.22432
G1 X116.623 Y157.028 E.02337
G1 X116.623 Y152.476 E.23541
G3 X116.171 Y152.236 I2.206 J-4.706 E.02647
G1 X116.171 Y157.028 E.2478
G1 X115.719 Y157.028 E.02337
G1 X115.719 Y151.994 E.26034
G3 X115.267 Y151.75 I2.248 J-4.709 E.02656
G1 X115.267 Y157.028 E.27294
G1 X114.815 Y157.028 E.02337
G1 X114.815 Y151.478 E.287
G1 X114.363 Y151.206 E.02727
G1 X114.363 Y157.028 E.30106
G1 X113.911 Y157.028 E.02337
G1 X113.911 Y150.926 E.31554
G1 X113.459 Y150.623 E.02814
G1 X113.459 Y157.028 E.33122
G1 X113.007 Y157.028 E.02337
G1 X113.007 Y150.32 E.34689
G3 X112.555 Y149.997 I3.045 J-4.749 E.02872
G1 X112.555 Y157.028 E.36355
G1 X112.103 Y157.028 E.02337
G1 X112.103 Y149.661 E.38095
G1 X111.651 Y149.325 E.02914
G1 X111.651 Y157.028 E.39835
G1 X111.2 Y157.028 E.02337
G1 X111.2 Y148.953 E.41756
G1 X110.748 Y148.581 E.03028
G1 X110.748 Y157.028 E.43682
G1 X110.296 Y157.028 E.02337
G1 X110.296 Y148.19 E.45703
G1 X109.844 Y147.778 E.0316
G1 X109.844 Y157.028 E.4783
G1 X109.392 Y157.028 E.02337
G1 X109.392 Y147.364 E.49973
G1 X108.94 Y146.91 E.03313
G1 X108.94 Y157.028 E.52321
G1 X108.488 Y157.028 E.02337
G1 X108.488 Y146.456 E.54669
G3 X108.036 Y145.965 I4.758 J-4.833 E.03452
G1 X108.036 Y157.028 E.57208
G1 X107.584 Y157.028 E.02337
G1 X107.584 Y145.464 E.59799
G3 X107.132 Y144.931 I5.187 J-4.854 E.03616
G1 X107.132 Y157.028 E.62557
G1 X106.68 Y157.028 E.02337
G1 X106.68 Y144.377 E.65419
G3 X106.228 Y143.79 I5.731 J-4.88 E.03832
G1 X106.228 Y157.028 E.68454
G1 X105.776 Y157.028 E.02337
G1 X105.776 Y143.177 E.71623
G3 X105.324 Y142.521 I6.434 J-4.916 E.04122
G1 X105.324 Y157.028 E.75016
G1 X104.872 Y157.028 E.02337
G1 X104.872 Y141.84 E.78535
G3 X104.42 Y141.093 I7.356 J-4.961 E.04517
G1 X104.42 Y157.028 E.82398
G1 X103.968 Y157.028 E.02337
G1 X103.968 Y140.317 E.86413
G1 X103.516 Y139.465 E.04987
G1 X103.516 Y157.028 E.90818
G1 X103.064 Y157.028 E.02337
G1 X103.064 Y138.532 E.95644
G3 X102.612 Y137.545 I9.029 J-4.733 E.05615
G1 X102.612 Y157.028 E1.00747
G1 X102.16 Y157.028 E.02337
G1 X102.16 Y136.418 E1.06577
M73 P62 R16
G1 X101.708 Y135.129 E.07058
G1 X101.708 Y157.028 E1.13237
G1 X101.256 Y157.028 E.02337
G1 X101.256 Y133.639 E1.20944
G1 X101.172 Y133.354 E.01536
G1 X100.804 Y133.354 E.01903
G1 X100.804 Y157.028 E1.22417
G1 X100.352 Y157.028 E.02337
G1 X100.352 Y133.354 E1.22417
G1 X99.9 Y133.354 E.02337
G1 X99.9 Y157.028 E1.22417
G1 X99.448 Y157.028 E.02337
G1 X99.448 Y133.354 E1.22417
G1 X98.996 Y133.354 E.02337
G1 X98.996 Y157.028 E1.22417
G1 X98.544 Y157.028 E.02337
G1 X98.544 Y133.354 E1.22417
G1 X98.092 Y133.354 E.02337
G1 X98.092 Y157.028 E1.22417
G1 X97.64 Y157.028 E.02337
G1 X97.64 Y133.354 E1.22417
G1 X97.188 Y133.354 E.02337
G1 X97.188 Y157.028 E1.22417
G1 X96.736 Y157.028 E.02337
G1 X96.736 Y133.354 E1.22417
G1 X96.284 Y133.354 E.02337
G1 X96.284 Y157.028 E1.22417
G1 X95.832 Y157.028 E.02337
G1 X95.832 Y133.354 E1.22417
G1 X95.38 Y133.354 E.02337
G1 X95.38 Y157.028 E1.22417
G1 X94.928 Y157.028 E.02337
G1 X94.928 Y133.354 E1.22417
G1 X94.476 Y133.354 E.02337
G1 X94.476 Y157.028 E1.22417
G1 X94.024 Y157.028 E.02337
G1 X94.024 Y133.354 E1.22417
G1 X93.572 Y133.354 E.02337
M73 P62 R15
G1 X93.572 Y157.028 E1.22417
G1 X93.12 Y157.028 E.02337
G1 X93.12 Y133.354 E1.22417
G1 X92.668 Y133.354 E.02337
G1 X92.668 Y157.028 E1.22417
G1 X92.216 Y157.028 E.02337
G1 X92.216 Y133.354 E1.22417
G1 X91.764 Y133.354 E.02337
G1 X91.764 Y157.028 E1.22417
G1 X91.312 Y157.028 E.02337
G1 X91.312 Y133.354 E1.22416
G1 X90.86 Y133.354 E.02337
G1 X90.86 Y157.028 E1.22416
G1 X90.408 Y157.028 E.02337
G1 X90.408 Y98.973 E3.00203
G1 X90.86 Y98.973 E.02337
G1 X90.86 Y104.646 E.29336
G1 X91.312 Y104.646 E.02337
G1 X91.312 Y98.973 E.29336
G1 X91.764 Y98.973 E.02337
G1 X91.764 Y104.646 E.29336
G1 X92.216 Y104.646 E.02337
G1 X92.216 Y98.973 E.29335
G1 X92.668 Y98.973 E.02337
G1 X92.668 Y104.646 E.29335
G1 X93.12 Y104.646 E.02337
G1 X93.12 Y98.973 E.29335
G1 X93.572 Y98.973 E.02337
G1 X93.572 Y104.646 E.29335
G1 X94.024 Y104.646 E.02337
G1 X94.024 Y98.973 E.29335
G1 X94.476 Y98.973 E.02337
G1 X94.476 Y104.646 E.29335
G1 X94.928 Y104.646 E.02337
G1 X94.928 Y98.973 E.29335
G1 X95.38 Y98.973 E.02337
G1 X95.38 Y104.646 E.29335
G1 X95.832 Y104.646 E.02337
G1 X95.832 Y98.973 E.29335
G1 X96.284 Y98.973 E.02337
G1 X96.284 Y104.646 E.29334
G1 X96.736 Y104.646 E.02337
G1 X96.736 Y98.973 E.29334
G1 X97.188 Y98.973 E.02337
G1 X97.188 Y104.646 E.29334
G1 X97.64 Y104.646 E.02337
G1 X97.64 Y98.973 E.29334
G1 X98.092 Y98.973 E.02337
G1 X98.092 Y104.646 E.29334
G1 X98.544 Y104.646 E.02337
G1 X98.544 Y98.973 E.29334
G1 X98.996 Y98.973 E.02337
G1 X98.996 Y104.646 E.29334
G1 X99.448 Y104.646 E.02337
G1 X99.448 Y98.973 E.29334
G1 X99.9 Y98.973 E.02337
G1 X99.9 Y104.646 E.29334
G1 X100.352 Y104.646 E.02337
G1 X100.352 Y98.973 E.29333
G1 X100.804 Y98.973 E.02337
G1 X100.804 Y104.646 E.29333
G1 X101.256 Y104.646 E.02337
G1 X101.256 Y98.973 E.29333
G1 X101.708 Y98.973 E.02337
G1 X101.708 Y104.646 E.29333
G1 X102.16 Y104.646 E.02337
G1 X102.16 Y98.973 E.29333
G1 X102.612 Y98.973 E.02337
G1 X102.612 Y104.646 E.29333
G1 X103.064 Y104.646 E.02337
G1 X103.064 Y98.973 E.29333
G1 X103.516 Y98.973 E.02337
G1 X103.516 Y104.646 E.29333
G1 X103.968 Y104.646 E.02337
G1 X103.968 Y98.973 E.29333
G1 X104.42 Y98.973 E.02337
G1 X104.42 Y104.646 E.29333
G1 X104.872 Y104.646 E.02337
G1 X104.872 Y98.973 E.29332
G1 X105.324 Y98.973 E.02337
G1 X105.324 Y104.646 E.29332
G1 X105.776 Y104.646 E.02337
G1 X105.776 Y98.973 E.29332
G1 X106.228 Y98.973 E.02337
G1 X106.228 Y104.646 E.29332
G1 X106.68 Y104.646 E.02337
G1 X106.68 Y98.973 E.29332
G1 X107.132 Y98.973 E.02337
G1 X107.132 Y104.848 E.30379
M106 S127.5
; WIPE_START
G1 F24000
G1 X107.132 Y102.848 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.428 J1.139 P1  F30000
G1 X115.878 Y99.561 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.545214
; LAYER_HEIGHT: 0.2
G1 F12542.46
G1 X115.878 Y99.059 E.02056
G1 X107.622 Y99.058 E.33793
G1 X107.622 Y99.561 E.02056
G1 X115.818 Y99.561 E.33548
G1 X116.357 Y98.771 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.404777
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X116.357 Y104.646 E.308
G1 X116.811 Y104.646 E.02384
G1 X116.811 Y98.974 E.29738
G1 X117.266 Y98.974 E.02384
G1 X117.266 Y104.646 E.29738
G1 X117.721 Y104.646 E.02384
G1 X117.721 Y98.974 E.29738
G1 X118.176 Y98.974 E.02384
G1 X118.176 Y104.646 E.29738
G1 X118.631 Y104.646 E.02384
G1 X118.631 Y98.974 E.29738
G1 X119.085 Y98.974 E.02384
G1 X119.085 Y104.646 E.29738
G1 X119.54 Y104.646 E.02384
G1 X119.54 Y98.974 E.29738
G1 X119.995 Y98.974 E.02384
G1 X119.995 Y104.646 E.29738
G1 X120.45 Y104.646 E.02384
G1 X120.45 Y98.974 E.29738
G1 X120.904 Y98.974 E.02384
G1 X120.904 Y104.646 E.29737
G1 X121.359 Y104.646 E.02384
G1 X121.359 Y98.974 E.29737
G1 X121.814 Y98.974 E.02384
G1 X121.814 Y104.646 E.29737
G1 X122.269 Y104.646 E.02384
G1 X122.269 Y98.974 E.29737
G1 X122.724 Y98.974 E.02384
G1 X122.724 Y104.646 E.29737
G1 X123.178 Y104.646 E.02384
G1 X123.178 Y98.974 E.29737
G1 X123.633 Y98.974 E.02384
G1 X123.633 Y104.646 E.29737
G1 X124.088 Y104.646 E.02384
G1 X124.088 Y98.974 E.29737
G1 X124.543 Y98.974 E.02384
G1 X124.543 Y104.646 E.29737
G1 X124.997 Y104.646 E.02384
G1 X124.997 Y98.974 E.29736
G1 X125.452 Y98.974 E.02384
G1 X125.452 Y104.646 E.29736
G1 X125.907 Y104.646 E.02384
G1 X125.907 Y98.974 E.29736
G1 X126.362 Y98.974 E.02384
G1 X126.362 Y104.646 E.29736
G1 X126.817 Y104.646 E.02384
G1 X126.817 Y98.974 E.29736
G1 X127.271 Y98.974 E.02384
G1 X127.271 Y104.646 E.29736
G1 X127.726 Y104.646 E.02384
M73 P63 R15
G1 X127.726 Y98.974 E.29736
G1 X128.181 Y98.974 E.02384
G1 X128.181 Y104.646 E.29736
G1 X128.636 Y104.646 E.02384
G1 X128.636 Y98.974 E.29736
G1 X129.09 Y98.974 E.02384
G1 X129.09 Y104.646 E.29735
G1 X129.545 Y104.646 E.02384
G1 X129.545 Y98.974 E.29735
G1 X130 Y98.974 E.02384
G1 X130 Y104.646 E.29735
G1 X130.455 Y104.646 E.02384
G1 X130.455 Y98.974 E.29735
G1 X130.91 Y98.974 E.02384
G1 X130.91 Y104.646 E.29735
G1 X131.364 Y104.646 E.02384
G1 X131.364 Y98.974 E.29735
G1 X131.819 Y98.974 E.02384
G1 X131.819 Y104.646 E.29735
G1 X132.274 Y104.646 E.02384
G1 X132.274 Y98.974 E.29735
G1 X132.729 Y98.974 E.02384
G1 X132.729 Y104.646 E.29735
G1 X133.183 Y104.646 E.02384
G1 X133.183 Y98.974 E.29734
G1 X133.638 Y98.974 E.02384
G1 X133.638 Y104.646 E.29734
G1 X134.093 Y104.646 E.02384
G1 X134.093 Y98.975 E.29734
G1 X134.548 Y98.975 E.02384
G1 X134.548 Y104.646 E.29734
G1 X135.003 Y104.646 E.02384
G1 X135.003 Y98.975 E.29734
G1 X135.457 Y98.975 E.02384
G1 X135.457 Y104.646 E.29734
G1 X135.912 Y104.646 E.02384
G1 X135.912 Y98.975 E.29734
G1 X136.367 Y98.975 E.02384
G1 X136.367 Y104.646 E.29734
G1 X136.822 Y104.646 E.02384
G1 X136.822 Y98.975 E.29734
G1 X137.276 Y98.975 E.02384
G1 X137.276 Y104.646 E.29733
G1 X137.731 Y104.646 E.02384
G1 X137.731 Y98.975 E.29733
G1 X138.186 Y98.975 E.02384
G1 X138.186 Y104.646 E.29733
G1 X138.641 Y104.646 E.02384
G1 X138.641 Y98.975 E.29733
G1 X139.096 Y98.975 E.02384
G1 X139.096 Y104.646 E.29733
G1 X139.55 Y104.646 E.02384
G1 X139.55 Y98.975 E.29733
G1 X140.005 Y98.975 E.02384
G1 X140.005 Y104.646 E.29733
G1 X140.46 Y104.646 E.02384
G1 X140.46 Y98.975 E.29733
G1 X140.915 Y98.975 E.02384
G1 X140.915 Y104.646 E.29733
G1 X141.369 Y104.646 E.02384
G1 X141.369 Y98.975 E.29732
G1 X141.824 Y98.975 E.02384
G1 X141.824 Y104.646 E.29732
G1 X142.279 Y104.646 E.02384
G1 X142.279 Y98.975 E.29732
G1 X142.734 Y98.975 E.02384
G1 X142.734 Y104.646 E.29732
G1 X143.189 Y104.646 E.02384
G1 X143.189 Y98.975 E.29732
G1 X143.643 Y98.975 E.02384
G1 X143.643 Y104.848 E.30794
M106 S127.5
G1 X144.121 Y99.561 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.544373
; LAYER_HEIGHT: 0.2
G1 F12563.498
G1 X152.379 Y99.561 E.3374
G1 X152.379 Y99.06 E.02049
G1 X144.121 Y99.06 E.3374
G1 X144.121 Y99.501 E.01804
G1 X152.867 Y98.773 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40194
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X152.867 Y104.646 E.30361
G1 X153.318 Y104.646 E.02336
G1 X153.318 Y98.975 E.29314
G1 X153.77 Y98.975 E.02336
G1 X153.77 Y104.646 E.29314
G1 X154.222 Y104.646 E.02336
G1 X154.222 Y98.975 E.29314
G1 X154.674 Y98.975 E.02336
G1 X154.674 Y104.646 E.29314
G1 X155.126 Y104.646 E.02336
G1 X155.126 Y98.975 E.29314
G1 X155.578 Y98.976 E.02336
G1 X155.578 Y104.646 E.29314
G1 X156.03 Y104.646 E.02336
G1 X156.03 Y98.976 E.29314
G1 X156.482 Y98.976 E.02336
G1 X156.482 Y104.646 E.29314
G1 X156.934 Y104.646 E.02336
G1 X156.934 Y98.976 E.29313
G1 X157.386 Y98.976 E.02336
G1 X157.386 Y104.646 E.29313
G1 X157.838 Y104.646 E.02336
G1 X157.838 Y98.976 E.29313
G1 X158.29 Y98.976 E.02336
G1 X158.29 Y104.646 E.29313
G1 X158.742 Y104.646 E.02336
G1 X158.742 Y98.976 E.29313
G1 X159.194 Y98.976 E.02336
G1 X159.194 Y104.646 E.29313
G1 X159.646 Y104.646 E.02336
G1 X159.646 Y98.976 E.29313
G1 X160.098 Y98.976 E.02336
G1 X160.098 Y104.646 E.29313
G1 X160.549 Y104.646 E.02336
G1 X160.549 Y98.976 E.29313
G1 X161.001 Y98.976 E.02336
G1 X161.001 Y104.646 E.29312
G1 X161.453 Y104.646 E.02336
G1 X161.453 Y98.976 E.29312
G1 X161.905 Y98.976 E.02336
G1 X161.905 Y104.646 E.29312
G1 X162.357 Y104.646 E.02336
G1 X162.357 Y98.976 E.29312
G1 X162.809 Y98.976 E.02336
G1 X162.809 Y104.646 E.29312
G1 X163.261 Y104.646 E.02336
G1 X163.261 Y98.976 E.29312
G1 X163.713 Y98.976 E.02336
G1 X163.713 Y104.646 E.29312
G1 X164.165 Y104.646 E.02336
G1 X164.165 Y98.976 E.29312
G1 X164.617 Y98.976 E.02336
G1 X164.617 Y104.646 E.29312
G1 X165.069 Y104.646 E.02336
G1 X165.069 Y98.976 E.29312
G1 X165.521 Y98.976 E.02336
G1 X165.521 Y104.646 E.29311
G1 X165.973 Y104.646 E.02336
G1 X165.973 Y98.976 E.29311
G1 X166.425 Y98.976 E.02336
G1 X166.425 Y104.646 E.29311
G1 X166.877 Y104.646 E.02336
G1 X166.877 Y98.976 E.29311
G1 X167.329 Y98.976 E.02336
G1 X167.329 Y104.646 E.29311
G1 X167.781 Y104.646 E.02336
G1 X167.781 Y98.976 E.29311
G1 X168.232 Y98.976 E.02336
G1 X168.232 Y104.646 E.29311
G1 X168.684 Y104.646 E.02336
G1 X168.684 Y98.976 E.29311
G1 X169.136 Y98.976 E.02336
G1 X169.136 Y104.848 E.30357
M106 S127.5
G1 X181.651 Y108.939 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X181.651 Y110.568 E.05401
G1 X189.044 Y117.96 E.34681
G1 X189.044 Y115.012 E.09782
G1 X181.651 Y122.404 E.34681
G1 X181.651 Y125.92 E.1166
G1 X186.08 Y130.349 E.20778
G1 X181.651 Y130.349 E.14692
G1 X181.651 Y130.08 E.0089
G1 X189.044 Y122.688 E.34681
G1 X189.044 Y125.636 E.09782
G1 X181.651 Y118.244 E.34681
G1 X181.651 Y114.729 E.1166
G1 X188.729 Y107.651 E.33201
G1 X186.411 Y107.651 E.07688
G1 X189.044 Y110.285 E.12353
G1 X189.044 Y111.913 E.05401
G1 X189.022 Y107.425 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40194
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X189.022 Y102.792 E.23953
G2 X188.57 Y101.139 I-3.974 J.198 E.0893
G1 X188.57 Y107.223 E.31452
G1 X188.118 Y107.223 E.02336
G1 X188.118 Y100.451 E.35009
G2 X187.666 Y99.987 I-4.221 J3.66 E.0335
G1 X187.666 Y107.223 E.37407
G1 X187.214 Y107.223 E.02336
G1 X187.214 Y99.637 E.39217
G2 X186.762 Y99.383 I-1.514 J2.168 E.02683
G1 X186.762 Y107.223 E.40528
G1 X186.31 Y107.223 E.02336
G1 X186.31 Y99.196 E.41495
G2 X185.858 Y99.068 I-.877 J2.23 E.02433
G1 X185.858 Y107.223 E.42159
G1 X185.406 Y107.223 E.02336
G1 X185.406 Y99.005 E.42486
G2 X184.954 Y98.977 I-.341 J1.857 E.02346
G1 X184.954 Y107.223 E.4263
G1 X184.502 Y107.223 E.02336
G1 X184.502 Y98.977 E.4263
G1 X184.05 Y98.977 E.02336
G1 X184.05 Y107.223 E.4263
G1 X183.598 Y107.223 E.02336
G1 X183.598 Y98.977 E.4263
G1 X183.146 Y98.977 E.02336
G1 X183.146 Y107.223 E.4263
G1 X182.695 Y107.223 E.02336
G1 X182.695 Y98.977 E.4263
G1 X182.243 Y98.977 E.02336
G1 X182.243 Y107.223 E.4263
G1 X181.791 Y107.223 E.02336
G1 X181.791 Y98.977 E.4263
G1 X181.339 Y98.977 E.02336
G1 X181.339 Y157.028 E3.00114
G1 X180.887 Y157.028 E.02336
G1 X180.887 Y98.977 E3.00114
G1 X180.435 Y98.977 E.02336
G1 X180.435 Y157.028 E3.00114
G1 X179.983 Y157.028 E.02336
G1 X179.983 Y98.977 E3.00114
G1 X179.531 Y98.977 E.02336
G1 X179.531 Y157.028 E3.00114
G1 X179.079 Y157.028 E.02336
G1 X179.079 Y98.977 E3.00114
G1 X178.627 Y98.977 E.02336
G1 X178.627 Y157.028 E3.00114
G1 X178.175 Y157.028 E.02336
G1 X178.175 Y98.977 E3.00115
G1 X177.723 Y98.977 E.02336
G1 X177.723 Y157.028 E3.00115
G1 X177.271 Y157.028 E.02336
G1 X177.271 Y98.977 E3.00115
G1 X176.819 Y98.976 E.02336
G1 X176.819 Y157.028 E3.00115
G1 X176.367 Y157.028 E.02336
G1 X176.367 Y98.976 E3.00115
G1 X175.915 Y98.976 E.02336
G1 X175.915 Y157.028 E3.00115
G1 X175.464 Y157.028 E.02336
G1 X175.464 Y98.976 E3.00115
G1 X175.012 Y98.976 E.02336
G1 X175.012 Y157.028 E3.00115
G1 X174.56 Y157.028 E.02336
G1 X174.56 Y98.976 E3.00115
G1 X174.108 Y98.976 E.02336
G1 X174.108 Y157.028 E3.00116
G1 X173.656 Y157.028 E.02336
G1 X173.656 Y98.976 E3.00116
G1 X173.204 Y98.976 E.02336
G1 X173.204 Y157.028 E3.00116
G1 X172.752 Y157.028 E.02336
G1 X172.752 Y98.976 E3.00116
G1 X172.3 Y98.976 E.02336
G1 X172.3 Y157.028 E3.00116
G1 X171.848 Y157.028 E.02336
G1 X171.848 Y98.976 E3.00116
G1 X171.396 Y98.976 E.02336
G1 X171.396 Y157.028 E3.00116
G1 X170.944 Y157.028 E.02336
G1 X170.944 Y98.976 E3.00116
G1 X170.492 Y98.976 E.02336
G1 X170.492 Y157.028 E3.00116
G1 X170.04 Y157.028 E.02336
G1 X170.04 Y98.976 E3.00116
G1 X169.588 Y98.976 E.02336
G1 X169.588 Y157.028 E3.00117
G1 X169.136 Y157.028 E.02336
G1 X169.136 Y133.354 E1.22389
G1 X168.684 Y133.354 E.02336
G1 X168.684 Y157.028 E1.22389
G1 X168.232 Y157.028 E.02336
G1 X168.232 Y133.354 E1.22389
G1 X167.781 Y133.354 E.02336
G1 X167.781 Y157.028 E1.22389
G1 X167.329 Y157.028 E.02336
G1 X167.329 Y133.354 E1.22389
G1 X166.877 Y133.354 E.02336
G1 X166.877 Y157.028 E1.22389
G1 X166.425 Y157.028 E.02336
G1 X166.425 Y133.354 E1.22389
M73 P64 R15
G1 X165.973 Y133.354 E.02336
G1 X165.973 Y157.028 E1.22389
G1 X165.521 Y157.028 E.02336
G1 X165.521 Y133.354 E1.22389
G1 X165.069 Y133.354 E.02336
G1 X165.069 Y157.028 E1.22389
G1 X164.617 Y157.028 E.02336
G1 X164.617 Y133.354 E1.22389
G1 X164.165 Y133.354 E.02336
G1 X164.165 Y157.028 E1.22389
G1 X163.713 Y157.028 E.02336
G1 X163.713 Y133.354 E1.22389
G1 X163.261 Y133.354 E.02336
G1 X163.261 Y157.028 E1.22389
G1 X162.809 Y157.028 E.02336
G1 X162.809 Y133.354 E1.22389
G1 X162.357 Y133.354 E.02336
G1 X162.357 Y157.028 E1.22389
G1 X161.905 Y157.028 E.02336
G1 X161.905 Y133.354 E1.22389
G1 X161.453 Y133.354 E.02336
G1 X161.453 Y157.028 E1.22389
M73 P64 R14
G1 X161.001 Y157.028 E.02336
G1 X161.001 Y133.354 E1.22389
G1 X160.549 Y133.354 E.02336
G1 X160.549 Y157.028 E1.22389
G1 X160.098 Y157.028 E.02336
G1 X160.098 Y133.354 E1.22389
G1 X159.646 Y133.354 E.02336
G1 X159.646 Y157.028 E1.22389
G1 X159.194 Y157.028 E.02336
G1 X159.194 Y133.354 E1.22389
G1 X158.828 Y133.354 E.0189
G1 X158.742 Y133.647 E.0158
G1 X158.742 Y157.028 E1.20874
G1 X158.29 Y157.028 E.02336
G1 X158.29 Y135.133 E1.13194
G1 X157.838 Y136.427 E.07088
G1 X157.838 Y157.028 E1.06502
G1 X157.386 Y157.028 E.02336
G1 X157.386 Y137.54 E1.00751
G3 X156.934 Y138.55 I-11.356 J-4.475 E.05723
G1 X156.934 Y157.028 E.95529
G1 X156.482 Y157.028 E.02336
G1 X156.482 Y139.464 E.90802
G3 X156.03 Y140.327 I-8.922 J-4.125 E.05037
G1 X156.03 Y157.028 E.86343
G1 X155.578 Y157.028 E.02336
M73 P65 R14
G1 X155.578 Y141.098 E.82356
G3 X155.126 Y141.837 I-7.679 J-4.187 E.04481
G1 X155.126 Y157.028 E.78534
G1 X154.674 Y157.028 E.02336
G1 X154.674 Y142.528 E.74965
G3 X154.222 Y143.176 I-6.76 J-4.232 E.04087
G1 X154.222 Y157.028 E.71614
G1 X153.77 Y157.028 E.02336
G1 X153.77 Y143.797 E.68404
G3 X153.318 Y144.376 I-6.066 J-4.266 E.038
G1 X153.318 Y157.028 E.65409
G1 X152.867 Y157.028 E.02336
G1 X152.867 Y144.936 E.62513
G3 X152.415 Y145.462 I-5.531 J-4.293 E.03587
G1 X152.415 Y157.028 E.59793
G1 X151.963 Y157.028 E.02336
G1 X151.963 Y145.969 E.57173
G3 X151.511 Y146.454 I-5.11 J-4.314 E.03427
G1 X151.511 Y157.028 E.54668
G1 X151.059 Y157.028 E.02336
G1 X151.059 Y146.912 E.52297
G3 X150.607 Y147.364 I-4.775 J-4.33 E.03303
G1 X150.607 Y157.028 E.49964
G1 X150.155 Y157.028 E.02336
G1 X150.155 Y147.779 E.47816
G1 X149.703 Y148.195 E.03174
G1 X149.703 Y157.028 E.45668
G1 X149.251 Y157.028 E.02336
G1 X149.251 Y148.58 E.43678
G1 X148.799 Y148.955 E.03039
G1 X148.799 Y157.028 E.41734
G1 X148.347 Y157.028 E.02336
G1 X148.347 Y149.322 E.3984
G1 X147.895 Y149.661 E.02922
G1 X147.895 Y157.028 E.38085
G1 X147.443 Y157.028 E.02336
G1 X147.443 Y150.001 E.3633
G3 X146.991 Y150.318 I-3.426 J-4.397 E.02857
G1 X146.991 Y157.028 E.34689
G1 X146.539 Y157.028 E.02336
G1 X146.539 Y150.624 E.33108
G1 X146.087 Y150.93 E.02821
G1 X146.087 Y157.028 E.31528
G1 X145.635 Y157.028 E.02336
G1 X145.635 Y151.205 E.30102
G1 X145.184 Y151.48 E.02732
G1 X145.184 Y157.028 E.28686
G1 X144.732 Y157.028 E.02336
G1 X144.732 Y151.749 E.27293
G1 X144.28 Y151.993 E.02656
G1 X144.28 Y157.028 E.2603
G1 X143.828 Y157.028 E.02336
G1 X143.828 Y152.238 E.24767
G3 X143.376 Y152.474 I-2.608 J-4.438 E.02638
G1 X143.376 Y157.028 E.23545
G1 X142.924 Y157.028 E.02336
G1 X142.924 Y152.69 E.22428
G1 X142.472 Y152.906 E.0259
G1 X142.472 Y157.028 E.21311
G1 X142.02 Y157.028 E.02336
G1 X142.02 Y153.113 E.20241
G1 X141.568 Y153.302 E.02533
G1 X141.568 Y157.028 E.19263
G1 X141.116 Y157.028 E.02336
G1 X141.116 Y153.491 E.18284
G3 X140.664 Y153.672 I-2.048 J-4.466 E.02517
G1 X140.664 Y157.028 E.1735
G1 X140.212 Y157.028 E.02336
G1 X140.212 Y153.836 E.16505
G1 X139.76 Y153.999 E.02484
G1 X139.76 Y157.028 E.15661
G1 X139.308 Y157.028 E.02336
G1 X139.308 Y154.156 E.14849
G1 X138.856 Y154.294 E.02444
G1 X138.856 Y157.028 E.14133
G1 X138.404 Y157.028 E.02336
G1 X138.404 Y154.433 E.13418
G3 X137.952 Y154.568 I-1.589 J-4.488 E.0244
G1 X137.952 Y157.028 E.12719
G1 X137.501 Y157.028 E.02336
G1 X137.501 Y154.682 E.12128
G1 X137.049 Y154.797 E.0241
G1 X137.049 Y157.028 E.11537
G1 X136.597 Y157.028 E.02336
G1 X136.597 Y154.911 E.10945
G3 X136.145 Y155.002 I-1.147 J-4.507 E.02385
G1 X136.145 Y157.028 E.10473
G1 X135.693 Y157.028 E.02336
G1 X135.693 Y155.093 E.10003
G1 X135.241 Y155.184 E.02383
G1 X135.241 Y157.231 E.10581
M106 S127.5
G1 X126.297 Y156.227 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.469844
; LAYER_HEIGHT: 0.2
G1 F14756.726
G1 X126.774 Y156.25 E.01661
; LINE_WIDTH: 0.422853
G1 F15000
G1 X127.251 Y156.274 E.01478
; LINE_WIDTH: 0.375862
G1 X127.728 Y156.297 E.01295
; LINE_WIDTH: 0.32887
G1 X127.772 Y156.299 E.00103
; LINE_WIDTH: 0.32561
G1 X128.501 Y156.317 E.01679
; LINE_WIDTH: 0.264663
G2 X130.776 Y156.335 I1.844 J-89.986 E.04112
; LINE_WIDTH: 0.253998
G1 X131.51 Y156.317 E.01262
; LINE_WIDTH: 0.292431
G2 X132.288 Y156.297 I-.412 J-31.437 E.01582
; LINE_WIDTH: 0.330016
G1 X132.739 Y156.274 E.01059
; LINE_WIDTH: 0.376825
G1 X133.191 Y156.252 E.01231
; LINE_WIDTH: 0.423634
G1 X133.643 Y156.229 E.01404
G1 X129.271 Y156.042 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G3 X125.938 Y155.769 I.642 J-28.39 E.10282
G1 X125.853 Y156.629 E.02653
G1 X134.147 Y156.629 E.25485
G1 X134.062 Y155.77 E.02653
G3 X129.331 Y156.042 I-4.206 J-31.862 E.14573
G1 X129.271 Y155.665 F30000
G1 F15000
G3 X125.602 Y155.338 I.639 J-27.968 E.11328
G1 X125.437 Y157.006 E.05149
G1 X134.564 Y157.006 E.28044
G1 X134.398 Y155.338 E.0515
G3 X129.331 Y155.665 I-4.345 J-27.936 E.15622
; WIPE_START
G1 F24000
G1 X130.743 Y155.664 E-.53633
G1 X131.331 Y155.635 E-.22367
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.541 J1.09 P1  F30000
G1 X181.791 Y130.575 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.40194
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X181.791 Y157.028 E1.36759
G1 X182.243 Y157.028 E.02336
G1 X182.243 Y130.777 E1.35712
G1 X182.695 Y130.777 E.02336
G1 X182.695 Y157.028 E1.35712
G1 X183.146 Y157.028 E.02336
G1 X183.146 Y130.777 E1.35712
G1 X183.598 Y130.777 E.02336
G1 X183.598 Y157.028 E1.35712
G1 X184.05 Y157.028 E.02336
G1 X184.05 Y130.777 E1.35712
G1 X184.502 Y130.777 E.02336
G1 X184.502 Y157.028 E1.35712
G1 X184.954 Y157.028 E.02336
G1 X184.954 Y130.777 E1.35712
G1 X185.406 Y130.777 E.02336
G1 X185.406 Y157.006 E1.356
G2 X185.858 Y156.93 I-.089 J-1.89 E.02376
G1 X185.858 Y130.777 E1.35203
G1 X186.31 Y130.777 E.02336
G1 X186.31 Y156.805 E1.34559
G2 X186.762 Y156.618 I-1.906 J-5.227 E.02531
G1 X186.762 Y130.777 E1.33589
G1 X187.214 Y130.777 E.02336
G1 X187.214 Y156.362 E1.32266
G1 X187.666 Y156.014 E.02948
G1 X187.666 Y130.777 E1.30468
G1 X188.118 Y130.777 E.02336
G1 X188.118 Y155.533 E1.2798
G2 X188.57 Y154.846 I-2.084 J-1.864 E.04264
G1 X188.57 Y130.777 E1.24432
G1 X189.022 Y130.777 E.02336
G1 X189.022 Y154.298 E1.21597
M106 S127.5
M106 S193.8
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X189.022 Y152.298 E-.76
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
G3 Z7 I.844 J-.876 P1  F30000
G1 X169.203 Y133.203 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X158.7 Y133.203 E.34839
G3 X101.3 Y133.203 I-28.7 J-7.335 E2.59532
G1 X90.797 Y133.203 E.3484
G1 X90.797 Y104.797 E.94227
G1 X107.297 Y104.797 E.54734
G1 X107.297 Y99.797 E.16586
G1 X116.203 Y99.797 E.29542
G1 X116.203 Y104.797 E.16586
G1 X143.797 Y104.797 E.91535
G1 X143.797 Y99.797 E.16586
G1 X152.703 Y99.797 E.29542
G1 X152.703 Y104.797 E.16586
G1 X169.203 Y104.797 E.54734
G1 X169.203 Y133.143 E.94028
G1 X168.811 Y132.811 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X158.393 Y132.811 E.32011
G3 X101.607 Y132.811 I-28.393 J-6.941 E2.39088
G1 X91.189 Y132.811 E.3201
G1 X91.189 Y105.189 E.84874
G1 X107.689 Y105.189 E.507
G1 X107.689 Y100.189 E.15364
G1 X115.811 Y100.189 E.24956
G1 X115.811 Y105.189 E.15364
G1 X144.189 Y105.189 E.87199
G1 X144.189 Y100.189 E.15364
G1 X152.311 Y100.189 E.24956
G1 X152.311 Y105.189 E.15364
G1 X168.811 Y105.189 E.507
G1 X168.811 Y132.751 E.84689
M204 S10000
; WIPE_START
G1 F24000
G1 X166.811 Y132.762 E-.76
; WIPE_END
M73 P66 R14
G1 E-.04 F1800
G17
G3 Z7.2 I.364 J-1.161 P1  F30000
G1 X70.624 Y102.569 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G3 X75.007 Y98.602 I4.388 J.444 E.2149
G1 X185.206 Y98.607 E3.65549
G3 X189.398 Y103.007 I-.209 J4.396 E.22252
G1 X189.398 Y152.993 E1.6581
G3 X184.993 Y157.398 I-4.411 J-.006 E.22946
G1 X75.007 Y157.398 E3.64841
G3 X70.602 Y152.993 I.006 J-4.411 E.22946
G1 X70.602 Y103.007 E1.6581
G3 X70.619 Y102.629 I4.411 J.006 E.01258
G1 X70.234 Y102.531 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X75.003 Y98.21 I4.779 J.483 E.21664
G1 X185.225 Y98.216 E3.38682
G3 X189.79 Y103.003 I-.228 J4.788 E.22432
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.804 J-.012 E.23117
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.012 J-4.804 E.23117
G1 X70.21 Y103.003 E1.5362
G3 X70.229 Y102.59 I4.804 J.011 E.01268
M204 S10000
; WIPE_START
G1 F24000
G1 X70.3 Y102.076 E-.19744
G1 X70.416 Y101.61 E-.18245
G1 X70.575 Y101.167 E-.1787
G1 X70.776 Y100.742 E-.17862
G1 X70.806 Y100.691 E-.02279
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.661 J1.022 P1  F30000
G1 X72.971 Y99.29 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420659
G1 F15000
G1 X71.989 Y100.272 E.04276
G2 X71.327 Y101.263 I3.009 J2.727 E.03681
G1 X71.198 Y101.597 E.01103
G1 X73.614 Y99.18 E.10519
G1 X74.202 Y99.015 E.01879
G1 X74.333 Y98.996 E.00408
G1 X70.996 Y102.332 E.14524
G2 X70.941 Y102.922 I4.069 J.681 E.01825
G1 X74.923 Y98.94 E.17335
G3 X75.462 Y98.935 I.315 J5.521 E.01659
G1 X70.941 Y103.456 E.1968
G1 X70.941 Y103.991 E.01645
G1 X75.996 Y98.935 E.22006
G1 X76.53 Y98.935 E.01644
G1 X70.941 Y104.525 E.24332
G1 X70.941 Y105.059 E.01645
G1 X77.064 Y98.935 E.26657
G1 X77.598 Y98.935 E.01644
G1 X70.941 Y105.593 E.28983
G1 X70.94 Y106.128 E.01645
G1 X78.133 Y98.935 E.31308
G1 X78.667 Y98.936 E.01644
G1 X70.94 Y106.662 E.33634
G1 X70.94 Y107.196 E.01645
G1 X79.201 Y98.936 E.35959
G1 X79.735 Y98.936 E.01644
G1 X71.412 Y107.259 E.36234
G1 X71.946 Y107.259 E.01644
G1 X80.269 Y98.936 E.36233
G1 X80.804 Y98.936 E.01644
G1 X72.48 Y107.259 E.36233
G1 X73.014 Y107.259 E.01644
G1 X81.338 Y98.936 E.36233
G1 X81.872 Y98.936 E.01644
G1 X73.548 Y107.259 E.36233
G1 X74.083 Y107.259 E.01644
G1 X82.406 Y98.936 E.36233
G1 X82.94 Y98.936 E.01644
G1 X74.617 Y107.259 E.36233
G1 X75.151 Y107.259 E.01644
G1 X83.474 Y98.936 E.36233
G1 X84.009 Y98.936 E.01644
G1 X75.685 Y107.259 E.36233
G1 X76.219 Y107.259 E.01644
G1 X84.543 Y98.936 E.36233
G1 X85.077 Y98.936 E.01644
G1 X76.754 Y107.259 E.36232
G1 X77.288 Y107.259 E.01644
G1 X85.611 Y98.936 E.36232
G1 X86.145 Y98.936 E.01644
G1 X77.822 Y107.259 E.36232
G1 X78.356 Y107.259 E.01644
G1 X86.68 Y98.936 E.36232
G1 X87.214 Y98.936 E.01644
G1 X78.741 Y107.409 E.36883
G1 X78.741 Y107.943 E.01644
G1 X87.748 Y98.936 E.39209
G1 X88.282 Y98.936 E.01644
G1 X78.741 Y108.477 E.41534
G1 X78.741 Y109.011 E.01644
G1 X88.816 Y98.936 E.43859
G1 X89.35 Y98.936 E.01644
G1 X78.741 Y109.546 E.46185
G1 X78.741 Y110.08 E.01644
G1 X89.885 Y98.936 E.4851
G1 X90.419 Y98.936 E.01644
G1 X78.741 Y110.614 E.50835
G1 X78.741 Y111.148 E.01644
G1 X90.953 Y98.936 E.53161
G1 X91.487 Y98.936 E.01644
G1 X78.741 Y111.682 E.55486
G1 X78.741 Y112.217 E.01644
G1 X92.021 Y98.936 E.57811
G1 X92.555 Y98.936 E.01644
G1 X78.741 Y112.751 E.60137
G1 X78.741 Y113.285 E.01644
G1 X93.09 Y98.936 E.62462
G1 X93.624 Y98.936 E.01644
G1 X78.741 Y113.819 E.64787
G1 X78.741 Y114.354 E.01644
G1 X94.158 Y98.936 E.67113
G1 X94.692 Y98.936 E.01644
G1 X78.741 Y114.888 E.69438
G1 X78.741 Y115.422 E.01644
G1 X95.226 Y98.936 E.71763
G1 X95.761 Y98.936 E.01644
G1 X78.571 Y116.126 E.74827
G1 X78.349 Y108.939 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X78.349 Y110.568 E.05401
G1 X70.954 Y117.962 E.34689
G1 X70.954 Y115.01 E.09792
G1 X78.349 Y122.404 E.34688
G1 X78.349 Y125.92 E.1166
G1 X73.92 Y130.349 E.20778
G1 X78.349 Y130.349 E.14692
G1 X78.349 Y130.08 E.0089
G1 X70.954 Y122.685 E.34692
G1 X70.953 Y125.639 E.09797
G1 X78.349 Y118.244 E.34693
G1 X78.349 Y114.729 E.1166
G1 X71.271 Y107.651 E.33201
G1 X73.589 Y107.651 E.07688
G1 X70.955 Y110.285 E.12357
G1 X70.955 Y111.914 E.05401
; WIPE_START
G1 F24000
G1 X70.955 Y110.285 E-.61876
G1 X71.218 Y110.023 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.311 J1.177 P1  F30000
G1 X159.624 Y133.366 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420659
G1 F15000
G1 X158.751 Y134.24 E.03801
G3 X158.531 Y134.993 I-6.665 J-1.532 E.02418
G1 X159.988 Y133.536 E.06344
G1 X160.523 Y133.536 E.01644
G1 X158.245 Y135.814 E.09917
G3 X157.951 Y136.642 I-7.86 J-2.321 E.02704
G1 X161.057 Y133.536 E.1352
G1 X161.591 Y133.536 E.01644
G1 X157.579 Y137.548 E.17464
G3 X157.154 Y138.507 I-10.782 J-4.201 E.03229
G1 X162.125 Y133.536 E.21638
G1 X162.659 Y133.536 E.01644
G1 X156.639 Y139.557 E.26208
G3 X156.011 Y140.718 I-12.026 J-5.745 E.04066
G1 X163.194 Y133.536 E.31265
G1 X163.728 Y133.536 E.01644
G1 X155.186 Y142.078 E.37184
G3 X153.979 Y143.82 I-18.158 J-11.299 E.06525
G1 X164.262 Y133.536 E.44765
G1 X164.796 Y133.536 E.01644
G1 X141.268 Y157.065 E1.02421
G1 X141.802 Y157.065 E.01644
G1 X165.33 Y133.536 E1.02421
G1 X165.865 Y133.536 E.01644
G1 X142.336 Y157.065 E1.02421
G1 X142.87 Y157.065 E.01644
G1 X166.399 Y133.536 E1.02421
G1 X166.933 Y133.536 E.01644
G1 X143.405 Y157.065 E1.02421
G1 X143.939 Y157.065 E.01644
G1 X167.467 Y133.536 E1.02421
G1 X168.001 Y133.536 E.01644
G1 X144.473 Y157.065 E1.02421
G1 X145.007 Y157.065 E.01644
G1 X168.536 Y133.536 E1.02421
G1 X169.07 Y133.536 E.01644
G1 X145.372 Y157.234 E1.0316
G1 X140.564 Y157.234 F30000
G1 F15000
G1 X147.952 Y149.846 E.32162
G1 X147.391 Y150.268 E.02162
G1 X146.172 Y151.092 E.04529
G1 X140.199 Y157.065 E.25999
G1 X139.665 Y157.065 E.01644
G1 X144.824 Y151.906 E.22457
G1 X143.661 Y152.534 E.04068
G1 X139.131 Y157.065 E.19721
G1 X138.597 Y157.065 E.01644
G1 X142.629 Y153.033 E.17552
G3 X141.671 Y153.456 I-4.75 J-9.444 E.03225
G1 X138.063 Y157.065 E.15707
G1 X137.528 Y157.065 E.01644
G1 X140.763 Y153.83 E.14082
G1 X139.927 Y154.132 E.02738
G1 X136.994 Y157.065 E.12765
G1 X136.46 Y157.065 E.01644
G1 X139.121 Y154.403 E.11585
G1 X138.351 Y154.639 E.0248
G1 X135.926 Y157.065 E.10557
G1 X135.391 Y157.065 E.01644
G1 X137.615 Y154.841 E.0968
G1 X136.9 Y155.022 E.02271
G1 X134.857 Y157.065 E.08893
G1 X134.323 Y157.065 E.01644
G1 X136.214 Y155.174 E.0823
G1 X135.545 Y155.308 E.02099
G1 X133.789 Y157.065 E.07645
G1 X133.255 Y157.065 E.01644
G1 X134.894 Y155.425 E.07137
G1 X134.266 Y155.519 E.01956
G1 X132.72 Y157.065 E.06728
G1 X132.186 Y157.065 E.01644
G1 X133.641 Y155.61 E.06334
G1 X133.048 Y155.669 E.01835
G1 X131.652 Y157.065 E.06077
G1 X131.118 Y157.065 E.01644
G1 X132.455 Y155.728 E.0582
G3 X131.881 Y155.768 I-.69 J-5.768 E.01772
G1 X130.584 Y157.065 E.05646
G1 X130.049 Y157.065 E.01644
G1 X131.319 Y155.795 E.05525
G1 X130.757 Y155.823 E.01732
G1 X129.515 Y157.065 E.05403
G1 X128.981 Y157.065 E.01644
G1 X130.222 Y155.824 E.054
G1 X129.687 Y155.824 E.01644
G1 X128.447 Y157.065 E.054
G1 X127.913 Y157.065 E.01644
G1 X129.158 Y155.819 E.05422
G1 X128.649 Y155.794 E.01569
G1 X127.378 Y157.065 E.05531
G1 X126.844 Y157.065 E.01644
G1 X128.14 Y155.769 E.05641
G3 X127.638 Y155.737 I.076 J-5.11 E.01549
G1 X126.31 Y157.065 E.05781
G1 X125.776 Y157.065 E.01644
G1 X127.152 Y155.689 E.0599
G1 X126.666 Y155.641 E.01504
G1 X125.242 Y157.065 E.06199
G1 X124.707 Y157.065 E.01644
G1 X126.186 Y155.586 E.06435
G1 X125.721 Y155.517 E.01447
G1 X124.173 Y157.065 E.06736
G1 X123.639 Y157.065 E.01644
G1 X125.256 Y155.448 E.07038
G3 X124.794 Y155.376 I.503 J-4.723 E.0144
G1 X123.105 Y157.065 E.07352
G1 X122.571 Y157.065 E.01644
G1 X124.348 Y155.287 E.07739
G1 X123.903 Y155.198 E.01398
G1 X122.036 Y157.065 E.08126
G1 X121.502 Y157.065 E.01644
G1 X123.458 Y155.109 E.08513
G3 X123.029 Y155.003 I.858 J-4.403 E.01359
G1 X120.968 Y157.065 E.08973
G1 X120.434 Y157.065 E.01644
G1 X122.602 Y154.896 E.09439
G1 X122.175 Y154.789 E.01355
G1 X119.9 Y157.065 E.09906
G1 X119.365 Y157.065 E.01644
G1 X121.758 Y154.672 E.10416
G1 X121.349 Y154.547 E.01318
G1 X118.831 Y157.065 E.10958
G1 X118.297 Y157.065 E.01644
G1 X120.939 Y154.423 E.11501
G3 X120.531 Y154.296 I1.08 J-4.198 E.01314
G1 X117.763 Y157.065 E.12052
G1 X117.229 Y157.065 E.01644
G1 X120.138 Y154.155 E.12666
G1 X119.745 Y154.014 E.01286
G1 X116.694 Y157.065 E.1328
G1 X116.16 Y157.065 E.01644
G1 X119.352 Y153.873 E.13894
G3 X118.968 Y153.722 I1.334 J-3.971 E.01269
G1 X115.626 Y157.065 E.14549
G1 X115.092 Y157.065 E.01644
G1 X118.591 Y153.566 E.15232
G1 X118.213 Y153.409 E.01258
G1 X114.558 Y157.065 E.15914
G1 X114.023 Y157.065 E.01644
G1 X117.836 Y153.252 E.16597
G3 X117.473 Y153.08 I1.558 J-3.761 E.01235
G1 X113.489 Y157.065 E.17344
G1 X112.955 Y157.065 E.01644
G1 X117.111 Y152.908 E.18092
G1 X116.749 Y152.737 E.01234
G1 X112.421 Y157.065 E.18841
G1 X111.887 Y157.065 E.01644
G1 X116.391 Y152.56 E.19608
G1 X116.043 Y152.374 E.01215
G1 X111.352 Y157.065 E.2042
G1 X110.818 Y157.065 E.01644
G1 X115.696 Y152.187 E.21232
G1 X115.348 Y152.001 E.01215
G1 X110.284 Y157.065 E.22044
G1 X109.75 Y157.065 E.01644
G1 X115.008 Y151.806 E.22891
G1 X114.675 Y151.606 E.01198
G1 X109.216 Y157.065 E.23764
G1 X108.681 Y157.065 E.01644
G1 X114.341 Y151.405 E.24637
G1 X114.007 Y151.204 E.01198
G1 X108.147 Y157.065 E.25511
G1 X107.613 Y157.065 E.01644
G1 X113.685 Y150.993 E.26431
G1 X113.365 Y150.778 E.01185
G1 X107.079 Y157.065 E.27364
G1 X106.544 Y157.065 E.01644
G1 X113.045 Y150.564 E.28298
G1 X112.725 Y150.35 E.01185
G1 X106.01 Y157.065 E.29231
G1 X105.476 Y157.065 E.01644
G1 X112.419 Y150.122 E.30221
G1 X112.112 Y149.894 E.01175
G1 X104.942 Y157.065 E.31213
G1 X104.408 Y157.065 E.01644
G1 X111.806 Y149.666 E.32206
G3 X111.501 Y149.437 I2.174 J-3.211 E.01175
G1 X103.873 Y157.065 E.33203
G1 X103.339 Y157.065 E.01644
G1 X111.208 Y149.196 E.34254
G1 X110.915 Y148.954 E.01168
G1 X102.805 Y157.065 E.35304
G1 X102.271 Y157.065 E.01644
G1 X110.622 Y148.713 E.36355
G3 X110.332 Y148.469 I2.332 J-3.067 E.01168
G1 X101.737 Y157.065 E.37417
G1 X101.202 Y157.065 E.01644
G1 X110.053 Y148.215 E.38525
G1 X109.773 Y147.96 E.01164
G1 X100.668 Y157.065 E.39633
G1 X100.134 Y157.065 E.01644
G1 X109.493 Y147.706 E.40741
G3 X109.218 Y147.447 I2.486 J-2.927 E.01164
G1 X99.6 Y157.065 E.41867
G1 X99.066 Y157.065 E.01644
G1 X108.951 Y147.179 E.43032
G1 X108.685 Y146.912 E.01163
G1 X98.531 Y157.065 E.44197
G1 X97.997 Y157.065 E.01644
G1 X108.418 Y146.644 E.45363
G3 X108.157 Y146.371 I2.64 J-2.788 E.01163
G1 X97.463 Y157.065 E.46551
G1 X96.929 Y157.065 E.01644
G1 X107.904 Y146.09 E.47774
G1 X107.65 Y145.809 E.01164
G1 X96.395 Y157.065 E.48996
G1 X95.86 Y157.065 E.01644
G1 X107.397 Y145.528 E.50219
G3 X107.15 Y145.241 I2.795 J-2.647 E.01167
G1 X95.326 Y157.065 E.51471
G1 X94.792 Y157.065 E.01644
G1 X106.91 Y144.947 E.52751
G1 X106.67 Y144.653 E.01169
G1 X94.258 Y157.065 E.54031
G1 X93.724 Y157.065 E.01644
G1 X106.43 Y144.358 E.55311
G3 X106.198 Y144.056 I2.953 J-2.504 E.01173
G1 X93.189 Y157.065 E.56627
G1 X92.655 Y157.065 E.01644
G1 X105.971 Y143.749 E.57966
G1 X105.744 Y143.441 E.01176
G1 X92.121 Y157.065 E.59304
G1 X91.587 Y157.065 E.01644
G1 X105.518 Y143.134 E.60642
G3 X105.301 Y142.816 I3.118 J-2.356 E.01184
G1 X91.053 Y157.065 E.62026
G1 X90.518 Y157.065 E.01644
G1 X105.088 Y142.495 E.63423
G1 X104.875 Y142.174 E.01186
G1 X89.984 Y157.065 E.64821
G1 X89.45 Y157.065 E.01644
G1 X104.662 Y141.853 E.66218
G3 X104.461 Y141.519 I3.289 J-2.199 E.01199
G1 X88.916 Y157.065 E.67672
G1 X88.382 Y157.065 E.01644
G1 X104.262 Y141.184 E.69129
G1 X104.063 Y140.849 E.012
G1 X87.847 Y157.065 E.70587
G1 X87.313 Y157.065 E.01644
G1 X103.866 Y140.512 E.72054
G1 X103.68 Y140.163 E.01216
G1 X86.779 Y157.065 E.73573
G1 X86.245 Y157.065 E.01644
G1 X103.495 Y139.814 E.75093
G1 X103.31 Y139.465 E.01216
G1 X85.711 Y157.065 E.76612
G1 X85.176 Y157.065 E.01644
G1 X103.131 Y139.11 E.7816
G1 X102.962 Y138.745 E.01238
G1 X84.642 Y157.065 E.79748
G1 X84.108 Y157.065 E.01644
G1 X102.793 Y138.38 E.81337
G1 X102.623 Y138.015 E.01238
G1 X83.574 Y157.065 E.82925
G1 X83.04 Y157.065 E.01644
G1 X102.457 Y137.647 E.84525
G1 X102.304 Y137.266 E.01265
G1 X82.505 Y157.065 E.86185
G1 X81.971 Y157.065 E.01644
G1 X102.151 Y136.885 E.87845
M73 P66 R13
G1 X101.998 Y136.503 E.01265
G1 X81.437 Y157.065 E.89505
G1 X80.903 Y157.065 E.01644
G1 X101.854 Y136.113 E.91204
G1 X101.717 Y135.716 E.01294
G1 X80.369 Y157.065 E.92934
G1 X79.834 Y157.065 E.01644
G1 X101.581 Y135.318 E.94663
G3 X101.444 Y134.921 I3.64 J-1.471 E.01295
G1 X79.3 Y157.065 E.96395
G1 X78.766 Y157.065 E.01644
G1 X101.325 Y134.505 E.98203
G1 X101.207 Y134.09 E.0133
G1 X78.232 Y157.065 E1.00012
G1 X77.697 Y157.065 E.01644
G1 X101.088 Y133.674 E1.01821
G1 X101.049 Y133.536 E.00442
G1 X100.692 Y133.536 E.01099
G1 X77.163 Y157.065 E1.02422
G1 X76.629 Y157.065 E.01644
G1 X100.158 Y133.536 E1.02422
G1 X99.623 Y133.536 E.01644
G1 X76.095 Y157.065 E1.02422
G1 X75.561 Y157.065 E.01644
G1 X99.089 Y133.536 E1.02422
G1 X98.555 Y133.536 E.01644
G1 X75.026 Y157.065 E1.02422
G3 X74.528 Y157.029 I-.003 J-3.421 E.01539
G1 X98.021 Y133.536 E1.02265
G1 X97.487 Y133.536 E.01644
G1 X74.077 Y156.946 E1.01906
G3 X73.661 Y156.827 I.193 J-1.459 E.01334
G1 X96.952 Y133.536 E1.01388
G1 X96.418 Y133.536 E.01644
G1 X73.276 Y156.679 E1.00741
G3 X72.927 Y156.494 I.564 J-1.488 E.0122
G1 X95.884 Y133.536 E.99936
G1 X95.35 Y133.536 E.01644
G1 X72.611 Y156.275 E.98982
G3 X72.314 Y156.038 I.653 J-1.127 E.01174
G1 X94.816 Y133.536 E.97952
G1 X94.281 Y133.536 E.01644
G1 X72.04 Y155.777 E.96818
G3 X71.799 Y155.485 I.866 J-.96 E.01172
G1 X93.747 Y133.536 E.95544
G1 X93.213 Y133.536 E.01644
M73 P67 R13
G1 X71.574 Y155.175 E.94195
G1 X71.381 Y154.834 E.01206
G1 X92.679 Y133.536 E.9271
G1 X92.145 Y133.536 E.01644
G1 X71.22 Y154.461 E.91087
G3 X71.082 Y154.064 I1.538 J-.757 E.01295
G1 X91.61 Y133.536 E.89361
G1 X91.076 Y133.536 E.01644
G1 X70.989 Y153.623 E.87441
G3 X70.943 Y153.135 I2.444 J-.477 E.01511
G1 X90.542 Y133.536 E.85317
G1 X90.464 Y133.536 E.0024
G1 X90.464 Y133.08 E.01404
G1 X70.935 Y152.608 E.85009
G1 X70.935 Y152.074 E.01645
G1 X90.464 Y132.546 E.85009
G1 X90.464 Y132.012 E.01644
G1 X70.936 Y151.54 E.85008
G1 X70.936 Y151.006 E.01645
G1 X90.464 Y131.477 E.85008
G1 X90.464 Y130.943 E.01644
G1 X70.936 Y150.471 E.85008
G1 X70.936 Y149.937 E.01645
G1 X90.464 Y130.409 E.85008
G1 X90.464 Y129.875 E.01644
G1 X70.936 Y149.403 E.85007
G1 X70.936 Y148.869 E.01645
G1 X90.464 Y129.341 E.85007
G1 X90.464 Y128.806 E.01644
G1 X70.936 Y148.334 E.85007
G1 X70.936 Y147.8 E.01645
G1 X90.464 Y128.272 E.85007
G1 X90.464 Y127.738 E.01644
G1 X70.936 Y147.266 E.85006
G1 X70.936 Y146.732 E.01645
G1 X90.464 Y127.204 E.85006
G1 X90.464 Y126.67 E.01644
G1 X70.936 Y146.197 E.85006
G1 X70.936 Y145.663 E.01645
G1 X90.464 Y126.135 E.85006
G1 X90.464 Y125.601 E.01644
G1 X70.936 Y145.129 E.85005
G1 X70.936 Y144.595 E.01645
G1 X90.464 Y125.067 E.85005
G1 X90.464 Y124.533 E.01644
G1 X70.936 Y144.06 E.85005
G1 X70.936 Y143.526 E.01645
G1 X90.464 Y123.999 E.85005
G1 X90.464 Y123.464 E.01644
G1 X70.936 Y142.992 E.85004
G1 X70.936 Y142.458 E.01645
G1 X90.464 Y122.93 E.85004
G1 X90.464 Y122.396 E.01644
G1 X70.937 Y141.923 E.85004
G1 X70.937 Y141.389 E.01645
G1 X90.464 Y121.862 E.85003
G1 X90.464 Y121.328 E.01644
G1 X70.937 Y140.855 E.85003
G1 X70.937 Y140.32 E.01645
G1 X90.464 Y120.793 E.85003
G1 X90.464 Y120.259 E.01644
G1 X70.937 Y139.786 E.85003
G1 X70.937 Y139.252 E.01645
G1 X90.464 Y119.725 E.85002
G1 X90.464 Y119.191 E.01644
G1 X70.937 Y138.718 E.85002
G1 X70.937 Y138.183 E.01645
G1 X78.38 Y130.741 E.32398
G1 X77.845 Y130.741 E.01644
G1 X70.937 Y137.649 E.30073
G1 X70.937 Y137.115 E.01645
G1 X77.311 Y130.741 E.27747
G1 X76.777 Y130.741 E.01644
G1 X70.937 Y136.581 E.25421
G1 X70.937 Y136.046 E.01645
G1 X76.243 Y130.741 E.23096
G1 X75.709 Y130.741 E.01644
G1 X70.937 Y135.512 E.2077
G1 X70.937 Y134.978 E.01645
G1 X75.174 Y130.741 E.18444
G1 X74.64 Y130.741 E.01644
G1 X70.937 Y134.444 E.16119
G1 X70.937 Y133.909 E.01645
G1 X74.106 Y130.741 E.13793
G1 X73.572 Y130.741 E.01644
G1 X70.937 Y133.375 E.11467
G1 X70.938 Y132.841 E.01645
G1 X73.038 Y130.741 E.09142
G1 X72.503 Y130.741 E.01644
G1 X70.938 Y132.307 E.06816
G1 X70.938 Y131.772 E.01645
G1 X71.969 Y130.741 E.0449
G1 X71.435 Y130.741 E.01644
G1 X70.768 Y131.408 E.02903
G1 X78.571 Y130.549 F30000
G1 F15000
G1 X90.464 Y118.657 E.5177
G1 X90.464 Y118.122 E.01644
G1 X78.741 Y129.845 E.51031
G1 X78.741 Y129.311 E.01644
G1 X90.464 Y117.588 E.51031
G1 X90.464 Y117.054 E.01644
G1 X78.741 Y128.777 E.51031
G1 X78.741 Y128.243 E.01644
G1 X90.464 Y116.52 E.51031
G1 X90.464 Y115.986 E.01644
G1 X78.741 Y127.709 E.51031
G1 X78.741 Y127.174 E.01644
G1 X90.464 Y115.451 E.51031
G1 X90.464 Y114.917 E.01644
G1 X78.741 Y126.64 E.51031
G1 X78.741 Y126.106 E.01644
G1 X90.464 Y114.383 E.51031
G1 X90.464 Y113.849 E.01644
G1 X78.741 Y125.572 E.51031
G1 X78.741 Y125.038 E.01644
G1 X90.464 Y113.315 E.51031
G1 X90.464 Y112.78 E.01644
G1 X78.741 Y124.503 E.51031
G1 X78.741 Y123.969 E.01644
G1 X90.464 Y112.246 E.51031
G1 X90.464 Y111.712 E.01644
G1 X78.741 Y123.435 E.51031
G1 X78.741 Y122.901 E.01644
G1 X90.464 Y111.178 E.51031
G1 X90.464 Y110.644 E.01644
G1 X78.741 Y122.367 E.51031
G1 X78.741 Y121.832 E.01644
G1 X90.464 Y110.109 E.51031
G1 X90.464 Y109.575 E.01644
G1 X78.741 Y121.298 E.51031
G1 X78.741 Y120.764 E.01644
G1 X90.464 Y109.041 E.51031
G1 X90.464 Y108.507 E.01644
G1 X78.741 Y120.23 E.51031
G1 X78.741 Y119.696 E.01644
G1 X90.464 Y107.973 E.51031
G1 X90.464 Y107.438 E.01644
G1 X78.741 Y119.161 E.51031
G1 X78.741 Y118.627 E.01644
G1 X90.464 Y106.904 E.51031
G1 X90.464 Y106.37 E.01644
G1 X78.741 Y118.093 E.51031
G1 X78.741 Y117.559 E.01644
G1 X90.464 Y105.836 E.51031
G1 X90.464 Y105.301 E.01644
G1 X78.741 Y117.025 E.51031
G1 X78.741 Y116.49 E.01644
G1 X96.295 Y98.936 E.76414
G1 X96.829 Y98.936 E.01644
G1 X91.301 Y104.464 E.24061
G1 X91.836 Y104.464 E.01644
G1 X97.363 Y98.936 E.24061
G1 X97.897 Y98.936 E.01644
G1 X92.37 Y104.464 E.24061
G1 X92.904 Y104.464 E.01644
G1 X98.431 Y98.936 E.24061
G1 X98.966 Y98.936 E.01644
G1 X93.438 Y104.464 E.24061
G1 X93.973 Y104.464 E.01644
G1 X99.5 Y98.937 E.24061
G1 X100.034 Y98.937 E.01644
G1 X94.507 Y104.464 E.24061
G1 X95.041 Y104.464 E.01644
G1 X100.568 Y98.937 E.24061
G1 X101.102 Y98.937 E.01644
G1 X95.575 Y104.464 E.2406
G1 X96.109 Y104.464 E.01644
G1 X101.637 Y98.937 E.2406
G1 X102.171 Y98.937 E.01644
G1 X96.644 Y104.464 E.2406
G1 X97.178 Y104.464 E.01644
G1 X102.705 Y98.937 E.2406
G1 X103.239 Y98.937 E.01644
G1 X97.712 Y104.464 E.2406
G1 X98.246 Y104.464 E.01644
G1 X103.773 Y98.937 E.2406
G1 X104.307 Y98.937 E.01644
G1 X98.78 Y104.464 E.2406
G1 X99.315 Y104.464 E.01644
G1 X104.842 Y98.937 E.2406
G1 X105.376 Y98.937 E.01644
G1 X99.849 Y104.464 E.2406
G1 X100.383 Y104.464 E.01644
G1 X105.91 Y98.937 E.24059
G1 X106.444 Y98.937 E.01644
G1 X100.917 Y104.464 E.24059
G1 X101.451 Y104.464 E.01644
G1 X106.978 Y98.937 E.24059
G1 X107.512 Y98.937 E.01644
G1 X101.816 Y104.633 E.24798
G1 X106.624 Y104.633 F30000
G1 F15000
G1 X106.964 Y104.293 E.0148
G1 X106.964 Y103.759 E.01644
G1 X106.259 Y104.464 E.03067
G1 X105.725 Y104.464 E.01644
G1 X106.964 Y103.225 E.05393
G1 X106.964 Y102.691 E.01644
G1 X105.191 Y104.464 E.07718
G1 X104.657 Y104.464 E.01644
G1 X106.964 Y102.157 E.10044
G1 X106.964 Y101.622 E.01644
G1 X104.122 Y104.464 E.12369
G1 X103.588 Y104.464 E.01644
G1 X106.964 Y101.088 E.14694
G1 X106.964 Y100.554 E.01644
G1 X103.054 Y104.464 E.1702
G1 X102.52 Y104.464 E.01644
G1 X107.133 Y99.85 E.20084
G1 X107.35 Y99.633 F30000
G1 F15000
G1 X108.047 Y98.937 E.03032
G1 X108.581 Y98.937 E.01644
G1 X108.054 Y99.464 E.02293
G1 X108.588 Y99.464 E.01644
G1 X109.115 Y98.937 E.02293
G1 X109.649 Y98.937 E.01644
G1 X109.122 Y99.464 E.02293
G1 X109.657 Y99.464 E.01644
G1 X110.183 Y98.937 E.02293
G1 X110.718 Y98.937 E.01644
G1 X110.191 Y99.464 E.02293
G1 X110.725 Y99.464 E.01644
G1 X111.252 Y98.937 E.02293
G1 X111.786 Y98.937 E.01644
G1 X111.259 Y99.464 E.02293
G1 X111.793 Y99.464 E.01644
G1 X112.32 Y98.937 E.02293
G1 X112.854 Y98.937 E.01644
G1 X112.328 Y99.464 E.02293
G1 X112.862 Y99.464 E.01644
G1 X113.388 Y98.937 E.02293
G1 X113.923 Y98.937 E.01644
G1 X113.396 Y99.464 E.02292
G1 X113.93 Y99.464 E.01644
G1 X114.457 Y98.937 E.02292
G1 X114.991 Y98.937 E.01644
G1 X114.464 Y99.464 E.02292
G1 X114.999 Y99.464 E.01644
G1 X115.525 Y98.937 E.02292
G1 X116.059 Y98.937 E.01644
G1 X115.533 Y99.464 E.02292
G1 X116.067 Y99.464 E.01644
G1 X116.594 Y98.937 E.02292
G1 X117.128 Y98.937 E.01644
G1 X116.536 Y99.529 E.02575
G1 X116.536 Y100.063 E.01644
G1 X117.662 Y98.937 E.049
G1 X118.196 Y98.937 E.01644
G1 X116.536 Y100.597 E.07226
G1 X116.536 Y101.131 E.01644
G1 X118.73 Y98.937 E.09551
G1 X119.264 Y98.937 E.01644
G1 X116.536 Y101.666 E.11876
G1 X116.536 Y102.2 E.01644
G1 X119.799 Y98.937 E.14201
G1 X120.333 Y98.937 E.01644
G1 X116.536 Y102.734 E.16527
G1 X116.536 Y103.268 E.01644
G1 X120.867 Y98.938 E.18852
G1 X121.401 Y98.938 E.01644
G1 X116.536 Y103.802 E.21177
G1 X116.536 Y104.337 E.01644
G1 X121.935 Y98.938 E.23503
G1 X122.469 Y98.938 E.01644
G1 X116.943 Y104.464 E.24056
G1 X117.477 Y104.464 E.01644
G1 X123.004 Y98.938 E.24056
G1 X123.538 Y98.938 E.01644
G1 X118.012 Y104.464 E.24056
G1 X118.546 Y104.464 E.01644
G1 X124.072 Y98.938 E.24056
G1 X124.606 Y98.938 E.01644
G1 X119.08 Y104.464 E.24056
G1 X119.614 Y104.464 E.01644
G1 X125.14 Y98.938 E.24055
G1 X125.675 Y98.938 E.01644
G1 X120.148 Y104.464 E.24055
G1 X120.683 Y104.464 E.01644
G1 X126.209 Y98.938 E.24055
G1 X126.743 Y98.938 E.01644
G1 X121.217 Y104.464 E.24055
G1 X121.751 Y104.464 E.01644
G1 X127.277 Y98.938 E.24055
G1 X127.811 Y98.938 E.01644
G1 X122.285 Y104.464 E.24055
G1 X122.82 Y104.464 E.01644
G1 X128.345 Y98.938 E.24055
G1 X128.88 Y98.938 E.01644
G1 X123.354 Y104.464 E.24055
G1 X123.888 Y104.464 E.01644
G1 X129.414 Y98.938 E.24055
G1 X129.948 Y98.938 E.01644
G1 X124.422 Y104.464 E.24054
G1 X124.956 Y104.464 E.01644
G1 X130.482 Y98.938 E.24054
G1 X131.016 Y98.938 E.01644
G1 X125.491 Y104.464 E.24054
G1 X126.025 Y104.464 E.01644
G1 X131.551 Y98.938 E.24054
G1 X132.085 Y98.938 E.01644
G1 X126.559 Y104.464 E.24054
G1 X127.093 Y104.464 E.01644
G1 X132.619 Y98.938 E.24054
G1 X133.153 Y98.938 E.01644
G1 X127.627 Y104.464 E.24054
G1 X128.162 Y104.464 E.01644
G1 X133.687 Y98.938 E.24054
G1 X134.221 Y98.938 E.01644
G1 X128.696 Y104.464 E.24054
G1 X129.23 Y104.464 E.01644
G1 X134.756 Y98.938 E.24053
G1 X135.29 Y98.938 E.01644
G1 X129.764 Y104.464 E.24053
G1 X130.298 Y104.464 E.01644
G1 X135.824 Y98.938 E.24053
G1 X136.358 Y98.938 E.01644
G1 X130.833 Y104.464 E.24053
G1 X131.367 Y104.464 E.01644
G1 X136.892 Y98.938 E.24053
G1 X137.426 Y98.938 E.01644
G1 X131.901 Y104.464 E.24053
G1 X132.435 Y104.464 E.01644
G1 X137.961 Y98.938 E.24053
G1 X138.495 Y98.938 E.01644
G1 X132.969 Y104.464 E.24053
G1 X133.504 Y104.464 E.01644
G1 X139.029 Y98.938 E.24053
G1 X139.563 Y98.938 E.01644
G1 X134.038 Y104.464 E.24052
G1 X134.572 Y104.464 E.01644
G1 X140.097 Y98.938 E.24052
G1 X140.632 Y98.938 E.01644
G1 X135.106 Y104.464 E.24052
G1 X135.64 Y104.464 E.01644
G1 X141.166 Y98.938 E.24052
G1 X141.7 Y98.939 E.01644
G1 X136.175 Y104.464 E.24052
G1 X136.709 Y104.464 E.01644
G1 X142.234 Y98.939 E.24052
G1 X142.768 Y98.939 E.01644
G1 X137.243 Y104.464 E.24052
G1 X137.777 Y104.464 E.01644
G1 X143.302 Y98.939 E.24052
G1 X143.837 Y98.939 E.01644
G1 X138.142 Y104.633 E.2479
G1 X142.95 Y104.633 F30000
G1 F15000
G1 X143.464 Y104.119 E.02239
G1 X143.464 Y103.585 E.01644
G1 X142.585 Y104.464 E.03825
G1 X142.051 Y104.464 E.01644
G1 X143.464 Y103.051 E.06151
G1 X143.464 Y102.517 E.01644
G1 X141.517 Y104.464 E.08476
G1 X140.982 Y104.464 E.01644
G1 X143.464 Y101.982 E.10802
G1 X143.464 Y101.448 E.01644
G1 X140.448 Y104.464 E.13127
G1 X139.914 Y104.464 E.01644
G1 X143.464 Y100.914 E.15453
G1 X143.464 Y100.38 E.01644
G1 X139.38 Y104.464 E.17778
G1 X138.846 Y104.464 E.01644
G1 X143.464 Y99.846 E.20103
G1 X143.464 Y99.464 E.01175
G1 X143.846 Y99.464 E.01175
G1 X144.371 Y98.939 E.02286
G1 X144.905 Y98.939 E.01644
G1 X144.38 Y99.464 E.02286
G1 X144.914 Y99.464 E.01644
G1 X145.439 Y98.939 E.02286
G1 X145.973 Y98.939 E.01644
G1 X145.448 Y99.464 E.02286
G1 X145.982 Y99.464 E.01644
G1 X146.508 Y98.939 E.02286
G1 X147.042 Y98.939 E.01644
G1 X146.517 Y99.464 E.02286
G1 X147.051 Y99.464 E.01644
G1 X147.576 Y98.939 E.02285
G1 X148.11 Y98.939 E.01644
G1 X147.585 Y99.464 E.02285
G1 X148.119 Y99.464 E.01644
G1 X148.644 Y98.939 E.02285
G1 X149.178 Y98.939 E.01644
G1 X148.653 Y99.464 E.02285
G1 X149.188 Y99.464 E.01644
G1 X149.713 Y98.939 E.02285
G1 X150.247 Y98.939 E.01644
G1 X149.722 Y99.464 E.02285
G1 X150.256 Y99.464 E.01644
G1 X150.781 Y98.939 E.02285
G1 X151.315 Y98.939 E.01644
G1 X150.79 Y99.464 E.02285
G1 X151.324 Y99.464 E.01644
G1 X151.849 Y98.939 E.02285
G1 X152.383 Y98.939 E.01644
G1 X151.859 Y99.464 E.02284
G1 X152.393 Y99.464 E.01644
G1 X152.918 Y98.939 E.02284
G1 X153.452 Y98.939 E.01644
G1 X152.927 Y99.464 E.02284
G1 X153.036 Y99.464 E.00336
G1 X153.036 Y99.889 E.01308
G1 X153.986 Y98.939 E.04135
G1 X154.52 Y98.939 E.01644
G1 X153.036 Y100.423 E.0646
G1 X153.036 Y100.957 E.01644
G1 X155.054 Y98.939 E.08785
G1 X155.589 Y98.939 E.01644
G1 X153.036 Y101.492 E.11111
G1 X153.036 Y102.026 E.01644
G1 X156.123 Y98.939 E.13436
G1 X156.657 Y98.939 E.01644
G1 X153.036 Y102.56 E.15761
G1 X153.036 Y103.094 E.01644
G1 X157.191 Y98.939 E.18087
G1 X157.725 Y98.939 E.01644
G1 X153.036 Y103.628 E.20412
G1 X153.036 Y104.163 E.01644
G1 X158.259 Y98.939 E.22737
G1 X158.794 Y98.939 E.01644
G1 X153.269 Y104.464 E.24049
G1 X153.803 Y104.464 E.01644
G1 X159.328 Y98.939 E.24048
G1 X159.862 Y98.939 E.01644
G1 X154.338 Y104.464 E.24048
G1 X154.872 Y104.464 E.01644
G1 X160.396 Y98.939 E.24048
G1 X160.93 Y98.939 E.01644
G1 X155.406 Y104.464 E.24048
G1 X155.94 Y104.464 E.01644
G1 X161.464 Y98.939 E.24048
G1 X161.999 Y98.939 E.01644
G1 X156.474 Y104.464 E.24048
G1 X157.009 Y104.464 E.01644
G1 X162.533 Y98.94 E.24048
G1 X163.067 Y98.94 E.01644
G1 X157.543 Y104.464 E.24048
G1 X158.077 Y104.464 E.01644
G1 X163.601 Y98.94 E.24048
G1 X164.135 Y98.94 E.01644
G1 X158.611 Y104.464 E.24047
G1 X159.145 Y104.464 E.01644
G1 X164.67 Y98.94 E.24047
G1 X165.204 Y98.94 E.01644
G1 X159.68 Y104.464 E.24047
G1 X160.214 Y104.464 E.01644
G1 X165.738 Y98.94 E.24047
G1 X166.272 Y98.94 E.01644
G1 X160.748 Y104.464 E.24047
G1 X161.282 Y104.464 E.01644
G1 X166.806 Y98.94 E.24047
G1 X167.34 Y98.94 E.01644
G1 X161.816 Y104.464 E.24047
G1 X162.351 Y104.464 E.01644
G1 X167.875 Y98.94 E.24047
G1 X168.409 Y98.94 E.01644
G1 X162.885 Y104.464 E.24047
G1 X163.419 Y104.464 E.01644
G1 X168.943 Y98.94 E.24046
G1 X169.477 Y98.94 E.01644
G1 X163.953 Y104.464 E.24046
G1 X164.487 Y104.464 E.01644
G1 X170.011 Y98.94 E.24046
G1 X170.546 Y98.94 E.01644
G1 X165.022 Y104.464 E.24046
G1 X165.556 Y104.464 E.01644
G1 X171.08 Y98.94 E.24046
G1 X171.614 Y98.94 E.01644
G1 X166.09 Y104.464 E.24046
G1 X166.624 Y104.464 E.01644
G1 X172.148 Y98.94 E.24046
G1 X172.682 Y98.94 E.01644
G1 X167.158 Y104.464 E.24046
G1 X167.693 Y104.464 E.01644
G1 X173.216 Y98.94 E.24046
G1 X173.751 Y98.94 E.01644
G1 X168.227 Y104.464 E.24045
G1 X168.761 Y104.464 E.01644
G1 X174.285 Y98.94 E.24045
G1 X174.819 Y98.94 E.01644
G1 X169.295 Y104.464 E.24045
G1 X169.536 Y104.464 E.00742
G1 X169.536 Y104.757 E.00903
G1 X175.353 Y98.94 E.25322
G1 X175.887 Y98.94 E.01644
G1 X169.536 Y105.291 E.27647
G1 X169.536 Y105.825 E.01644
G1 X176.421 Y98.94 E.29972
G1 X176.956 Y98.94 E.01644
G1 X169.536 Y106.36 E.32298
G1 X169.536 Y106.894 E.01644
G1 X177.49 Y98.94 E.34623
G1 X178.024 Y98.94 E.01644
G1 X169.536 Y107.428 E.36948
G1 X169.536 Y107.962 E.01644
G1 X178.558 Y98.94 E.39274
G1 X179.092 Y98.94 E.01644
G1 X169.536 Y108.496 E.41599
G1 X169.536 Y109.031 E.01644
G1 X179.627 Y98.94 E.43924
G1 X180.161 Y98.94 E.01644
G1 X169.536 Y109.565 E.46249
G1 X169.536 Y110.099 E.01644
G1 X180.695 Y98.94 E.48575
G1 X181.229 Y98.94 E.01644
G1 X169.536 Y110.633 E.509
G1 X169.536 Y111.167 E.01644
G1 X181.763 Y98.94 E.53225
G1 X182.297 Y98.94 E.01644
G1 X169.536 Y111.702 E.55551
G1 X169.536 Y112.236 E.01644
G1 X182.832 Y98.94 E.57876
G1 X183.366 Y98.94 E.01644
G1 X169.536 Y112.77 E.60201
G1 X169.536 Y113.304 E.01644
G1 X183.9 Y98.941 E.62527
G1 X184.434 Y98.941 E.01644
G1 X169.536 Y113.839 E.64852
G1 X169.536 Y114.373 E.01644
G1 X184.968 Y98.941 E.67177
G3 X185.468 Y98.975 I.109 J2.069 E.01546
G1 X169.536 Y114.907 E.69353
G1 X169.536 Y115.441 E.01644
G1 X185.929 Y99.048 E.7136
G3 X186.342 Y99.169 I-.407 J2.158 E.01327
G1 X169.536 Y115.975 E.73159
G1 X169.536 Y116.51 E.01644
G1 X186.722 Y99.324 E.7481
G3 X187.071 Y99.509 I-.764 J1.866 E.01219
G1 X169.536 Y117.044 E.76331
G1 X169.536 Y117.578 E.01644
G1 X187.393 Y99.721 E.77732
G3 X187.689 Y99.959 I-1.06 J1.623 E.01171
G1 X169.536 Y118.112 E.79022
G1 X169.536 Y118.646 E.01644
G1 X187.961 Y100.222 E.80203
G3 X188.207 Y100.51 I-1.338 J1.395 E.01168
G1 X169.367 Y119.35 E.82014
G1 X181.651 Y108.939 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X181.651 Y110.568 E.05401
G1 X189.044 Y117.96 E.34681
G1 X189.044 Y115.012 E.09782
G1 X181.651 Y122.404 E.34681
G1 X181.651 Y125.92 E.1166
G1 X186.08 Y130.349 E.20778
G1 X181.651 Y130.349 E.14692
G1 X181.651 Y130.08 E.0089
G1 X189.044 Y122.688 E.34681
G1 X189.044 Y125.636 E.09782
G1 X181.651 Y118.244 E.34681
G1 X181.651 Y114.729 E.1166
G1 X188.729 Y107.651 E.33201
G1 X186.411 Y107.651 E.07688
G1 X189.044 Y110.285 E.12353
G1 X189.044 Y111.913 E.05401
G1 X188.767 Y107.429 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420659
G1 F15000
G1 X189.059 Y107.136 E.01273
G1 X189.059 Y106.602 E.01644
G1 X188.402 Y107.259 E.0286
G1 X187.868 Y107.259 E.01644
G1 X189.059 Y106.068 E.05186
G1 X189.059 Y105.534 E.01644
G1 X187.334 Y107.259 E.07511
G1 X186.8 Y107.259 E.01644
G1 X189.059 Y105 E.09836
G1 X189.059 Y104.465 E.01644
G1 X186.265 Y107.259 E.12162
G1 X185.731 Y107.259 E.01644
G1 X189.059 Y103.931 E.14487
G1 X189.059 Y103.397 E.01644
G1 X185.197 Y107.259 E.16813
G1 X184.663 Y107.259 E.01644
G1 X189.059 Y102.863 E.19138
G2 X189.014 Y102.374 I-6.746 J.375 E.01512
G1 X184.129 Y107.259 E.21267
G1 X183.594 Y107.259 E.01644
G1 X188.917 Y101.937 E.23169
G1 X188.784 Y101.535 E.01302
G1 X183.06 Y107.259 E.24917
G1 X182.526 Y107.259 E.01644
G1 X188.622 Y101.163 E.26535
G2 X188.428 Y100.823 I-1.824 J.814 E.01207
G1 X181.822 Y107.429 E.28755
G1 X181.429 Y107.822 F30000
G1 F15000
G1 X169.536 Y119.715 E.5177
G1 X169.536 Y120.249 E.01644
G1 X181.259 Y108.526 E.51031
G1 X181.259 Y109.06 E.01644
G1 X169.536 Y120.783 E.51031
G1 X169.536 Y121.317 E.01644
G1 X181.259 Y109.594 E.51031
G1 X181.259 Y110.129 E.01644
G1 X169.536 Y121.852 E.51031
G1 X169.536 Y122.386 E.01644
G1 X181.259 Y110.663 E.51031
G1 X181.259 Y111.197 E.01644
G1 X169.536 Y122.92 E.51031
G1 X169.536 Y123.454 E.01644
G1 X181.259 Y111.731 E.51031
G1 X181.259 Y112.265 E.01644
G1 X169.536 Y123.988 E.51031
G1 X169.536 Y124.523 E.01644
G1 X181.259 Y112.8 E.51031
G1 X181.259 Y113.334 E.01644
M73 P68 R13
G1 X169.536 Y125.057 E.51031
G1 X169.536 Y125.591 E.01644
G1 X181.259 Y113.868 E.51031
G1 X181.259 Y114.402 E.01644
G1 X169.536 Y126.125 E.51031
G1 X169.536 Y126.659 E.01644
G1 X181.259 Y114.936 E.51031
G1 X181.259 Y115.471 E.01644
G1 X169.536 Y127.194 E.51031
G1 X169.536 Y127.728 E.01644
G1 X181.259 Y116.005 E.51031
G1 X181.259 Y116.539 E.01644
G1 X169.536 Y128.262 E.51031
G1 X169.536 Y128.796 E.01644
G1 X181.259 Y117.073 E.51031
G1 X181.259 Y117.607 E.01644
G1 X169.536 Y129.33 E.51031
G1 X169.536 Y129.865 E.01644
G1 X181.259 Y118.142 E.51031
G1 X181.259 Y118.676 E.01644
G1 X169.536 Y130.399 E.51031
G1 X169.536 Y130.933 E.01644
G1 X181.259 Y119.21 E.51031
G1 X181.259 Y119.744 E.01644
G1 X169.536 Y131.467 E.51031
G1 X169.536 Y132.001 E.01644
G1 X181.259 Y120.278 E.51031
G1 X181.259 Y120.813 E.01644
G1 X169.536 Y132.536 E.51031
G1 X169.536 Y133.07 E.01644
G1 X181.259 Y121.347 E.51031
G1 X181.259 Y121.881 E.01644
G1 X146.076 Y157.065 E1.53157
G1 X146.61 Y157.065 E.01644
G1 X181.259 Y122.415 E1.50832
G1 X181.259 Y122.949 E.01644
G1 X147.144 Y157.065 E1.48507
G1 X147.678 Y157.065 E.01644
G1 X181.259 Y123.484 E1.46181
G1 X181.259 Y124.018 E.01644
G1 X148.212 Y157.065 E1.43856
G1 X148.747 Y157.065 E.01644
G1 X181.259 Y124.552 E1.4153
G1 X181.259 Y125.086 E.01644
G1 X149.281 Y157.065 E1.39205
G1 X149.815 Y157.065 E.01644
G1 X181.259 Y125.62 E1.36879
G1 X181.259 Y126.155 E.01644
G1 X150.349 Y157.065 E1.34554
G1 X150.883 Y157.065 E.01644
G1 X181.259 Y126.689 E1.32228
G1 X181.259 Y127.223 E.01644
G1 X151.418 Y157.065 E1.29903
G1 X151.952 Y157.065 E.01644
G1 X181.259 Y127.757 E1.27578
G1 X181.259 Y128.291 E.01644
G1 X152.486 Y157.065 E1.25252
G1 X153.02 Y157.065 E.01644
G1 X181.259 Y128.826 E1.22927
G1 X181.259 Y129.36 E.01644
G1 X153.554 Y157.065 E1.20601
G1 X154.089 Y157.065 E.01644
G1 X181.259 Y129.894 E1.18276
G1 X181.259 Y130.428 E.01644
G1 X154.623 Y157.065 E1.1595
G1 X155.157 Y157.065 E.01644
G1 X181.481 Y130.741 E1.1459
G1 X182.015 Y130.741 E.01644
G1 X155.691 Y157.065 E1.1459
G1 X156.225 Y157.065 E.01644
G1 X182.549 Y130.741 E1.1459
G1 X183.084 Y130.741 E.01644
G1 X156.76 Y157.065 E1.1459
G1 X157.294 Y157.065 E.01644
G1 X183.618 Y130.741 E1.1459
G1 X184.152 Y130.741 E.01644
G1 X157.828 Y157.065 E1.1459
G1 X158.362 Y157.065 E.01644
G1 X184.686 Y130.741 E1.1459
G1 X185.22 Y130.741 E.01644
G1 X158.896 Y157.065 E1.1459
G1 X159.431 Y157.065 E.01644
G1 X185.755 Y130.741 E1.1459
G1 X186.289 Y130.741 E.01644
G1 X159.965 Y157.065 E1.1459
G1 X160.499 Y157.065 E.01644
G1 X186.823 Y130.741 E1.1459
G1 X187.357 Y130.741 E.01644
G1 X161.033 Y157.065 E1.1459
G1 X161.567 Y157.065 E.01644
G1 X187.891 Y130.741 E1.1459
G1 X188.426 Y130.741 E.01644
G1 X162.102 Y157.065 E1.1459
G1 X162.636 Y157.065 E.01644
G1 X188.96 Y130.741 E1.1459
G1 X189.059 Y130.741 E.00306
G1 X189.059 Y131.176 E.01338
G1 X163.17 Y157.065 E1.12697
G1 X163.704 Y157.065 E.01644
G1 X189.059 Y131.71 E1.10372
G1 X189.059 Y132.244 E.01644
G1 X164.238 Y157.065 E1.08047
G1 X164.773 Y157.065 E.01644
G1 X189.059 Y132.778 E1.05721
G1 X189.059 Y133.312 E.01644
G1 X165.307 Y157.065 E1.03396
G1 X165.841 Y157.065 E.01644
G1 X189.059 Y133.847 E1.0107
G1 X189.059 Y134.381 E.01644
G1 X166.375 Y157.065 E.98745
G1 X166.91 Y157.065 E.01644
G1 X189.059 Y134.915 E.96419
G1 X189.059 Y135.449 E.01644
G1 X167.444 Y157.065 E.94094
G1 X167.978 Y157.065 E.01644
G1 X189.059 Y135.983 E.91768
G1 X189.059 Y136.518 E.01644
G1 X168.512 Y157.065 E.89443
G1 X169.046 Y157.065 E.01644
G1 X189.059 Y137.052 E.87118
G1 X189.059 Y137.586 E.01644
G1 X169.581 Y157.065 E.84792
G1 X170.115 Y157.065 E.01644
G1 X189.059 Y138.12 E.82467
G1 X189.059 Y138.654 E.01644
G1 X170.649 Y157.065 E.80141
G1 X171.183 Y157.065 E.01644
G1 X189.059 Y139.189 E.77816
G1 X189.059 Y139.723 E.01644
G1 X171.717 Y157.065 E.7549
G1 X172.252 Y157.065 E.01644
G1 X189.059 Y140.257 E.73165
G1 X189.059 Y140.791 E.01644
G1 X172.786 Y157.065 E.7084
G1 X173.32 Y157.065 E.01644
G1 X189.059 Y141.325 E.68514
G1 X189.059 Y141.86 E.01644
G1 X173.854 Y157.065 E.66189
G1 X174.388 Y157.065 E.01644
G1 X189.059 Y142.394 E.63863
G1 X189.059 Y142.928 E.01644
G1 X174.923 Y157.065 E.61538
G1 X175.457 Y157.065 E.01644
G1 X189.059 Y143.462 E.59212
G1 X189.059 Y143.996 E.01644
G1 X175.991 Y157.065 E.56887
G1 X176.525 Y157.065 E.01644
G1 X189.059 Y144.531 E.54562
G1 X189.059 Y145.065 E.01644
G1 X177.059 Y157.065 E.52236
G1 X177.594 Y157.065 E.01644
G1 X189.059 Y145.599 E.49911
G1 X189.059 Y146.133 E.01644
G1 X178.128 Y157.065 E.47585
G1 X178.662 Y157.065 E.01644
G1 X189.059 Y146.667 E.4526
G1 X189.059 Y147.202 E.01644
G1 X179.196 Y157.065 E.42934
G1 X179.73 Y157.065 E.01644
G1 X189.059 Y147.736 E.40609
G1 X189.059 Y148.27 E.01644
G1 X180.265 Y157.065 E.38284
G1 X180.799 Y157.065 E.01644
G1 X189.059 Y148.804 E.35958
G1 X189.059 Y149.338 E.01644
G1 X181.333 Y157.065 E.33633
G1 X181.867 Y157.065 E.01644
G1 X189.059 Y149.873 E.31307
G1 X189.059 Y150.407 E.01644
G1 X182.401 Y157.065 E.28982
G1 X182.936 Y157.065 E.01644
G1 X189.059 Y150.941 E.26656
G1 X189.059 Y151.475 E.01644
G1 X183.47 Y157.065 E.24331
G1 X184.004 Y157.065 E.01644
G1 X189.059 Y152.01 E.22005
G1 X189.059 Y152.544 E.01644
G1 X184.538 Y157.065 E.1968
G2 X185.077 Y157.06 I.223 J-5.533 E.01659
G1 X189.059 Y153.078 E.17335
G3 X189 Y153.671 I-2.431 J.059 E.01839
G1 X185.667 Y157.005 E.14513
G1 X185.789 Y156.987 E.00381
G1 X186.387 Y156.818 E.01913
G1 X188.803 Y154.403 E.10516
G3 X188.011 Y155.728 I-4.079 J-1.536 E.04778
G1 X187.046 Y156.694 E.04202
M106 S168.3
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X188.011 Y155.728 E-.51869
G1 X188.379 Y155.258 E-.2269
G1 X188.397 Y155.225 E-.01442
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
G3 Z7.2 I.917 J-.8 P1  F30000
G1 X169.173 Y133.173 Z7.2
G1 Z7
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X158.675 Y133.173 E.32258
G3 X101.325 Y133.173 I-28.675 J-7.299 E2.40313
G1 X90.827 Y133.173 E.32258
G1 X90.827 Y104.827 E.87102
G1 X107.327 Y104.827 E.507
G1 X107.327 Y99.827 E.15364
G1 X116.173 Y99.827 E.27184
G1 X116.173 Y104.827 E.15364
G1 X143.827 Y104.827 E.84971
G1 X143.827 Y99.827 E.15364
G1 X152.673 Y99.827 E.27184
G1 X152.673 Y104.827 E.15364
G1 X169.173 Y104.827 E.507
G1 X169.173 Y133.113 E.86918
M204 S10000
; WIPE_START
G1 F24000
G1 X167.173 Y133.125 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.317 J-1.175 P1  F30000
G1 X70.602 Y107.078 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X78.922 Y107.078 E.27599
G1 X78.922 Y130.922 E.79096
G1 X70.602 Y130.922 E.27599
G1 X70.602 Y107.138 E.78897
; WIPE_START
G1 F24000
G1 X72.602 Y107.123 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.001 J1.217 P1  F30000
G1 X181.078 Y107.078 Z7.4
G1 Z7
G1 E.8 F1800
G1 F15476.087
G1 X189.398 Y107.078 E.27599
G1 X189.398 Y130.922 E.79096
G1 X181.078 Y130.922 E.27599
G1 X181.078 Y107.138 E.78897
; WIPE_START
G1 F24000
G1 X183.078 Y107.123 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.049 J-1.216 P1  F30000
G1 X70.232 Y102.546 Z7.4
G1 Z7
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.234 Y102.531 E.00049
G3 X75.003 Y98.21 I4.78 J.484 E.21664
G1 X185.232 Y98.216 E3.38703
G3 X189.79 Y103.003 I-.235 J4.788 E.22411
G1 X189.79 Y152.997 E1.5362
G3 X184.997 Y157.79 I-4.804 J-.012 E.23117
G1 X75.003 Y157.79 E3.37983
G3 X70.21 Y152.997 I.012 J-4.804 E.23117
G1 X70.21 Y103.003 E1.5362
G1 X70.229 Y102.606 E.01219
M204 S10000
; WIPE_START
G1 F24000
G1 X70.234 Y102.531 E-.02885
G1 X70.302 Y102.069 E-.17729
G1 X70.416 Y101.61 E-.1799
G1 X70.575 Y101.167 E-.17866
G1 X70.776 Y100.742 E-.17863
G1 X70.798 Y100.704 E-.01668
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.217 J.017 P1  F30000
G1 X70.95 Y111.918 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X70.95 Y110.29 E.05401
G1 X73.814 Y107.426 E.13435
G1 X71.046 Y107.426 E.09182
G1 X78.574 Y114.954 E.35314
G1 X78.574 Y118.018 E.10166
G1 X70.95 Y125.642 E.35764
G1 X70.95 Y122.682 E.09818
G1 X78.574 Y130.306 E.35764
G1 X78.574 Y130.574 E.0089
G1 X77.214 Y130.574 E.04512
G1 X70.95 Y128.73 F30000
G1 F15476.087
G1 X70.95 Y130.358 E.05401
G1 X71.166 Y130.574 E.01013
G1 X73.694 Y130.574 E.08386
G1 X78.574 Y125.694 E.22892
G1 X78.574 Y122.63 E.10166
G1 X70.95 Y115.006 E.35764
G1 X70.95 Y117.966 E.09818
G1 X78.574 Y110.342 E.35764
G1 X78.574 Y108.714 E.05401
; WIPE_START
G1 F24000
G1 X78.574 Y110.342 E-.61876
G1 X78.311 Y110.605 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.022 J1.217 P1  F30000
G1 X181.426 Y108.714 Z7.4
G1 Z7
G1 E.8 F1800
G1 F15476.087
G1 X181.426 Y110.342 E.05401
G1 X189.05 Y117.966 E.35764
G1 X189.05 Y115.006 E.09818
G1 X181.426 Y122.63 E.35764
G1 X181.426 Y125.694 E.10166
G1 X186.306 Y130.574 E.22892
G1 X188.834 Y130.574 E.08386
G1 X189.05 Y130.358 E.01013
G1 X189.05 Y128.73 E.05401
G1 X182.786 Y130.574 F30000
G1 F15476.087
G1 X181.426 Y130.574 E.04512
G1 X181.426 Y130.306 E.0089
G1 X189.05 Y122.682 E.35764
G1 X189.05 Y125.642 E.09818
G1 X181.426 Y118.018 E.35764
G1 X181.426 Y114.954 E.10166
G1 X188.954 Y107.426 E.35314
G1 X186.186 Y107.426 E.09182
G1 X189.05 Y110.29 E.13435
G1 X189.05 Y111.918 E.05401
; WIPE_START
G1 F24000
G1 X189.05 Y110.29 E-.61876
G1 X188.787 Y110.027 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.202 J-.192 P1  F30000
G1 X187.002 Y98.879 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X189.121 Y100.998 E.09207
G1 X189.433 Y101.843
G1 X186.157 Y98.567 E.14238
G1 X185.503 Y98.446
G1 X189.554 Y102.497 E.17604
G1 X189.583 Y103.059
G1 X184.941 Y98.417 E.20172
G1 X184.407 Y98.417
G1 X189.583 Y103.593 E.22489
G1 X189.583 Y104.126
G1 X183.874 Y98.417 E.24806
G1 X183.341 Y98.417
G1 X189.583 Y104.659 E.27123
G1 X189.583 Y105.192
G1 X182.808 Y98.417 E.29441
G1 X182.274 Y98.417
G1 X189.583 Y105.726 E.31758
G1 X189.583 Y106.259
G1 X181.741 Y98.417 E.34075
G1 X181.208 Y98.417
G1 X189.583 Y106.792 E.36393
G1 X189.112 Y106.855
G1 X180.674 Y98.417 E.36667
G1 X180.141 Y98.417
G1 X188.579 Y106.855 E.36667
G1 X188.046 Y106.855
G1 X179.608 Y98.417 E.36667
G1 X179.075 Y98.417
G1 X187.513 Y106.855 E.36667
G1 X186.979 Y106.855
G1 X178.541 Y98.417 E.36667
G1 X178.008 Y98.417
G1 X186.446 Y106.855 E.36667
G1 X185.913 Y106.855
G1 X177.475 Y98.417 E.36667
G1 X176.942 Y98.417
G1 X185.38 Y106.855 E.36667
G1 X184.846 Y106.855
G1 X176.408 Y98.417 E.36667
G1 X175.875 Y98.417
G1 X184.313 Y106.855 E.36667
G1 X183.78 Y106.855
G1 X175.342 Y98.417 E.36667
G1 X174.809 Y98.417
G1 X183.247 Y106.855 E.36667
G1 X182.713 Y106.855
G1 X174.275 Y98.417 E.36667
G1 X173.742 Y98.417
G1 X182.18 Y106.855 E.36667
G1 X181.647 Y106.855
G1 X173.209 Y98.417 E.36667
G1 X172.675 Y98.417
G1 X181.113 Y106.855 E.36667
G1 X180.855 Y107.131
G1 X172.142 Y98.417 E.37863
G1 X171.609 Y98.417
G1 X180.855 Y107.664 E.4018
G1 X180.855 Y108.197
G1 X171.076 Y98.417 E.42498
G1 X170.542 Y98.417
G1 X180.855 Y108.73 E.44815
G1 X180.855 Y109.264
G1 X170.009 Y98.417 E.47132
G1 X169.476 Y98.417
G1 X180.855 Y109.797 E.4945
G1 X180.855 Y110.33
G1 X168.943 Y98.417 E.51767
G1 X168.409 Y98.417
G1 X180.855 Y110.863 E.54084
G1 X180.855 Y111.397
G1 X167.876 Y98.417 E.56402
G1 X167.343 Y98.417
G1 X180.855 Y111.93 E.58719
G1 X180.855 Y112.463
G1 X166.809 Y98.417 E.61036
G1 X166.276 Y98.417
G1 X180.855 Y112.997 E.63354
G1 X180.855 Y113.53
G1 X165.743 Y98.417 E.65671
G1 X165.21 Y98.417
G1 X180.855 Y114.063 E.67988
M73 P69 R13
G1 X180.855 Y114.596
G1 X164.676 Y98.417 E.70306
G1 X164.143 Y98.417
G1 X180.855 Y115.13 E.72623
G1 X180.855 Y115.663
G1 X163.61 Y98.417 E.7494
G1 X163.077 Y98.417
G1 X169.278 Y104.619 E.2695
G1 X168.745 Y104.619
G1 X162.543 Y98.417 E.2695
G1 X162.01 Y98.417
G1 X168.212 Y104.619 E.2695
G1 X167.679 Y104.619
G1 X161.477 Y98.417 E.2695
G1 X160.943 Y98.417
G1 X167.145 Y104.619 E.2695
G1 X166.612 Y104.619
G1 X160.41 Y98.417 E.2695
G1 X159.877 Y98.417
G1 X166.079 Y104.619 E.2695
G1 X165.545 Y104.619
G1 X159.344 Y98.417 E.2695
G1 X158.81 Y98.417
G1 X165.012 Y104.619 E.2695
G1 X164.479 Y104.619
G1 X158.277 Y98.417 E.2695
G1 X157.744 Y98.417
G1 X163.946 Y104.619 E.2695
G1 X163.412 Y104.619
G1 X157.211 Y98.417 E.2695
G1 X156.677 Y98.417
G1 X162.879 Y104.619 E.2695
G1 X162.346 Y104.619
G1 X156.144 Y98.417 E.2695
G1 X155.611 Y98.417
G1 X161.813 Y104.619 E.2695
G1 X161.279 Y104.619
G1 X155.078 Y98.417 E.2695
G1 X154.544 Y98.417
G1 X160.746 Y104.619 E.2695
G1 X160.213 Y104.619
G1 X154.011 Y98.417 E.2695
G1 X153.478 Y98.417
G1 X159.68 Y104.619 E.2695
G1 X159.146 Y104.619
G1 X152.944 Y98.417 E.2695
G1 X152.411 Y98.417
G1 X158.613 Y104.619 E.2695
G1 X158.08 Y104.619
G1 X151.878 Y98.417 E.2695
G1 X151.345 Y98.417
G1 X152.546 Y99.619 E.05222
G1 X152.013 Y99.619
G1 X150.811 Y98.417 E.05222
G1 X150.278 Y98.417
G1 X151.48 Y99.619 E.05222
G1 X150.947 Y99.619
G1 X149.745 Y98.417 E.05222
G1 X149.212 Y98.417
G1 X150.413 Y99.619 E.05222
G1 X149.88 Y99.619
G1 X148.678 Y98.417 E.05222
G1 X148.145 Y98.417
G1 X149.347 Y99.619 E.05222
G1 X148.814 Y99.619
G1 X147.612 Y98.417 E.05222
G1 X147.078 Y98.417
G1 X148.28 Y99.619 E.05222
G1 X147.747 Y99.619
G1 X146.545 Y98.417 E.05222
G1 X146.012 Y98.417
G1 X147.214 Y99.619 E.05222
M73 P69 R12
G1 X146.68 Y99.619
G1 X145.479 Y98.417 E.05222
G1 X144.945 Y98.417
G1 X146.147 Y99.619 E.05222
G1 X145.614 Y99.619
G1 X144.412 Y98.417 E.05222
G1 X143.879 Y98.417
G1 X145.081 Y99.619 E.05222
G1 X144.547 Y99.619
G1 X143.346 Y98.417 E.05222
G1 X142.812 Y98.417
G1 X144.014 Y99.619 E.05222
G1 X143.619 Y99.758
G1 X142.279 Y98.417 E.05824
G1 X141.746 Y98.417
G1 X143.619 Y100.291 E.08141
G1 X143.619 Y100.824
G1 X141.212 Y98.417 E.10458
G1 X140.679 Y98.417
G1 X143.619 Y101.357 E.12776
G1 X143.619 Y101.891
G1 X140.146 Y98.417 E.15093
G1 X139.613 Y98.417
G1 X143.619 Y102.424 E.1741
G1 X143.619 Y102.957
G1 X139.079 Y98.417 E.19728
G1 X138.546 Y98.417
G1 X143.619 Y103.49 E.22045
G1 X143.619 Y104.024
G1 X138.013 Y98.417 E.24362
G1 X137.48 Y98.417
G1 X143.619 Y104.557 E.2668
G1 X143.148 Y104.619
G1 X136.946 Y98.417 E.2695
G1 X136.413 Y98.417
G1 X142.615 Y104.619 E.2695
G1 X142.082 Y104.619
G1 X135.88 Y98.417 E.2695
G1 X135.347 Y98.417
G1 X141.548 Y104.619 E.2695
G1 X141.015 Y104.619
G1 X134.813 Y98.417 E.2695
G1 X134.28 Y98.417
G1 X140.482 Y104.619 E.2695
G1 X139.949 Y104.619
G1 X133.747 Y98.417 E.2695
G1 X133.213 Y98.417
G1 X139.415 Y104.619 E.2695
G1 X138.882 Y104.619
G1 X132.68 Y98.417 E.2695
G1 X132.147 Y98.417
G1 X138.349 Y104.619 E.2695
G1 X137.815 Y104.619
G1 X131.614 Y98.417 E.2695
G1 X131.08 Y98.417
G1 X137.282 Y104.619 E.2695
G1 X136.749 Y104.619
G1 X130.547 Y98.417 E.2695
G1 X130.014 Y98.417
G1 X136.216 Y104.619 E.2695
G1 X135.682 Y104.619
G1 X129.481 Y98.417 E.2695
G1 X128.947 Y98.417
G1 X135.149 Y104.619 E.2695
G1 X134.616 Y104.619
G1 X128.414 Y98.417 E.2695
G1 X127.881 Y98.417
G1 X134.083 Y104.619 E.2695
G1 X133.549 Y104.619
G1 X127.347 Y98.417 E.2695
G1 X126.814 Y98.417
G1 X133.016 Y104.619 E.2695
G1 X132.483 Y104.619
G1 X126.281 Y98.417 E.2695
G1 X125.748 Y98.417
G1 X131.949 Y104.619 E.2695
G1 X131.416 Y104.619
G1 X125.214 Y98.417 E.2695
G1 X124.681 Y98.417
G1 X130.883 Y104.619 E.2695
G1 X130.35 Y104.619
G1 X124.148 Y98.417 E.2695
G1 X123.615 Y98.417
G1 X129.816 Y104.619 E.2695
G1 X129.283 Y104.619
G1 X123.081 Y98.417 E.2695
G1 X122.548 Y98.417
G1 X128.75 Y104.619 E.2695
G1 X128.217 Y104.619
G1 X122.015 Y98.417 E.2695
G1 X121.481 Y98.417
G1 X127.683 Y104.619 E.2695
G1 X127.15 Y104.619
G1 X120.948 Y98.417 E.2695
G1 X120.415 Y98.417
G1 X126.617 Y104.619 E.2695
G1 X126.083 Y104.619
G1 X119.882 Y98.417 E.2695
G1 X119.348 Y98.417
G1 X125.55 Y104.619 E.2695
G1 X125.017 Y104.619
G1 X118.815 Y98.417 E.2695
G1 X118.282 Y98.417
G1 X124.484 Y104.619 E.2695
G1 X123.95 Y104.619
G1 X117.749 Y98.417 E.2695
G1 X117.215 Y98.417
G1 X123.417 Y104.619 E.2695
G1 X122.884 Y104.619
G1 X116.682 Y98.417 E.2695
G1 X116.149 Y98.417
G1 X122.351 Y104.619 E.2695
G1 X121.817 Y104.619
G1 X115.616 Y98.417 E.2695
G1 X115.082 Y98.417
G1 X116.284 Y99.619 E.05222
G1 X115.751 Y99.619
G1 X114.549 Y98.417 E.05222
G1 X114.016 Y98.417
G1 X115.218 Y99.619 E.05222
G1 X114.684 Y99.619
G1 X113.482 Y98.417 E.05222
G1 X112.949 Y98.417
G1 X114.151 Y99.619 E.05222
G1 X113.618 Y99.619
G1 X112.416 Y98.417 E.05222
G1 X111.883 Y98.417
G1 X113.084 Y99.619 E.05222
G1 X112.551 Y99.619
G1 X111.349 Y98.417 E.05222
G1 X110.816 Y98.417
G1 X112.018 Y99.619 E.05222
G1 X111.485 Y99.619
G1 X110.283 Y98.417 E.05222
G1 X109.75 Y98.417
G1 X110.951 Y99.619 E.05222
G1 X110.418 Y99.619
G1 X109.216 Y98.417 E.05222
G1 X108.683 Y98.417
G1 X109.885 Y99.619 E.05222
G1 X109.352 Y99.619
G1 X108.15 Y98.417 E.05222
G1 X107.616 Y98.417
G1 X108.818 Y99.619 E.05222
G1 X108.285 Y99.619
G1 X107.083 Y98.417 E.05222
G1 X106.55 Y98.417
G1 X107.752 Y99.619 E.05222
G1 X107.218 Y99.619
G1 X106.017 Y98.417 E.05222
G1 X105.483 Y98.417
G1 X107.119 Y100.053 E.07108
G1 X107.119 Y100.586
G1 X104.95 Y98.417 E.09426
G1 X104.417 Y98.417
G1 X107.119 Y101.12 E.11743
G1 X107.119 Y101.653
G1 X103.884 Y98.417 E.1406
G1 X103.35 Y98.417
G1 X107.119 Y102.186 E.16378
G1 X107.119 Y102.72
G1 X102.817 Y98.417 E.18695
G1 X102.284 Y98.417
G1 X107.119 Y103.253 E.21012
G1 X107.119 Y103.786
G1 X101.75 Y98.417 E.2333
G1 X101.217 Y98.417
G1 X107.119 Y104.319 E.25647
G1 X106.886 Y104.619
G1 X100.684 Y98.417 E.2695
G1 X100.151 Y98.417
G1 X106.352 Y104.619 E.2695
G1 X105.819 Y104.619
G1 X99.617 Y98.417 E.2695
G1 X99.084 Y98.417
G1 X105.286 Y104.619 E.2695
G1 X104.753 Y104.619
G1 X98.551 Y98.417 E.2695
G1 X98.018 Y98.417
G1 X104.219 Y104.619 E.2695
G1 X103.686 Y104.619
G1 X97.484 Y98.417 E.2695
G1 X96.951 Y98.417
G1 X103.153 Y104.619 E.2695
G1 X102.62 Y104.619
G1 X96.418 Y98.417 E.2695
G1 X95.885 Y98.417
G1 X102.086 Y104.619 E.2695
G1 X101.553 Y104.619
G1 X95.351 Y98.417 E.2695
G1 X94.818 Y98.417
G1 X101.02 Y104.619 E.2695
G1 X100.487 Y104.619
G1 X94.285 Y98.417 E.2695
G1 X93.751 Y98.417
G1 X99.953 Y104.619 E.2695
G1 X99.42 Y104.619
G1 X93.218 Y98.417 E.2695
G1 X92.685 Y98.417
G1 X98.887 Y104.619 E.2695
G1 X98.353 Y104.619
G1 X92.152 Y98.417 E.2695
G1 X91.618 Y98.417
G1 X97.82 Y104.619 E.2695
G1 X97.287 Y104.619
G1 X91.085 Y98.417 E.2695
G1 X90.552 Y98.417
G1 X96.754 Y104.619 E.2695
G1 X96.22 Y104.619
G1 X90.019 Y98.417 E.2695
G1 X89.485 Y98.417
G1 X95.687 Y104.619 E.2695
G1 X95.154 Y104.619
G1 X88.952 Y98.417 E.2695
G1 X88.419 Y98.417
G1 X94.621 Y104.619 E.2695
G1 X94.087 Y104.619
G1 X87.885 Y98.417 E.2695
G1 X87.352 Y98.417
G1 X93.554 Y104.619 E.2695
G1 X93.021 Y104.619
G1 X86.819 Y98.417 E.2695
G1 X86.286 Y98.417
G1 X92.487 Y104.619 E.2695
G1 X91.954 Y104.619
G1 X85.752 Y98.417 E.2695
G1 X85.219 Y98.417
G1 X91.421 Y104.619 E.2695
G1 X90.888 Y104.619
G1 X84.686 Y98.417 E.2695
G1 X84.153 Y98.417
G1 X90.619 Y104.884 E.28101
G1 X90.619 Y105.417
G1 X83.619 Y98.417 E.30418
G1 X83.086 Y98.417
G1 X90.619 Y105.951 E.32735
G1 X90.619 Y106.484
G1 X82.553 Y98.417 E.35053
G1 X82.019 Y98.417
G1 X90.619 Y107.017 E.3737
G1 X90.619 Y107.55
G1 X81.486 Y98.417 E.39687
G1 X80.953 Y98.417
G1 X90.619 Y108.084 E.42004
G1 X90.619 Y108.617
G1 X80.42 Y98.417 E.44322
G1 X79.886 Y98.417
G1 X90.619 Y109.15 E.46639
G1 X90.619 Y109.683
G1 X79.353 Y98.417 E.48956
G1 X78.82 Y98.417
G1 X90.619 Y110.217 E.51274
G1 X90.619 Y110.75
G1 X78.287 Y98.417 E.53591
G1 X77.753 Y98.417
G1 X90.619 Y111.283 E.55908
G1 X90.619 Y111.817
G1 X77.22 Y98.417 E.58226
G1 X76.687 Y98.417
G1 X90.619 Y112.35 E.60543
G1 X90.619 Y112.883
G1 X76.154 Y98.417 E.6286
G1 X75.62 Y98.417
G1 X90.619 Y113.416 E.65178
G1 X90.619 Y113.95
G1 X75.087 Y98.417 E.67495
G1 X74.574 Y98.438
G1 X90.619 Y114.483 E.69723
G1 X90.619 Y115.016
G1 X74.108 Y98.505 E.71748
G1 X73.681 Y98.612
G1 X90.619 Y115.549 E.73603
G1 X90.619 Y116.083
G1 X73.287 Y98.751 E.75316
G1 X72.921 Y98.918
G1 X90.619 Y116.616 E.76907
G1 X90.619 Y117.149
G1 X72.58 Y99.11 E.78389
G1 X72.262 Y99.326
G1 X90.619 Y117.682 E.7977
G1 X90.619 Y118.216
G1 X71.968 Y99.565 E.81046
G1 X71.696 Y99.826
G1 X78.726 Y106.855 E.30545
G1 X78.192 Y106.855
G1 X71.445 Y100.109 E.29318
G1 X71.218 Y100.414
G1 X77.659 Y106.855 E.2799
G1 X77.126 Y106.855
G1 X71.013 Y100.743 E.26561
G1 X70.833 Y101.096
G1 X76.592 Y106.855 E.25028
G1 X76.059 Y106.855
G1 X70.679 Y101.475 E.23379
G1 X70.555 Y101.885
G1 X75.526 Y106.855 E.216
G1 X74.993 Y106.855
G1 X70.467 Y102.33 E.19667
G1 X70.422 Y102.818
G1 X74.459 Y106.855 E.17544
M73 P70 R12
G1 X73.926 Y106.855
G1 X70.417 Y103.347 E.15247
G1 X70.417 Y103.88
G1 X73.393 Y106.855 E.1293
G1 X72.86 Y106.855
G1 X70.417 Y104.413 E.10612
G1 X70.417 Y104.946
G1 X72.326 Y106.855 E.08295
G1 X71.793 Y106.855
G1 X70.417 Y105.48 E.05978
G1 X70.417 Y106.013
G1 X71.26 Y106.855 E.03661
M204 S10000
G1 X79.145 Y107.274 F30000
M204 S2000
G1 F12000
G1 X90.619 Y118.749 E.49863
G1 X90.619 Y119.282
G1 X79.145 Y107.808 E.49863
G1 X79.145 Y108.341
G1 X90.619 Y119.816 E.49863
G1 X90.619 Y120.349
G1 X79.145 Y108.874 E.49863
G1 X79.145 Y109.408
G1 X90.619 Y120.882 E.49863
G1 X90.619 Y121.415
G1 X79.145 Y109.941 E.49863
G1 X79.145 Y110.474
G1 X90.619 Y121.949 E.49863
G1 X90.619 Y122.482
G1 X79.145 Y111.007 E.49863
G1 X79.145 Y111.541
G1 X90.619 Y123.015 E.49863
G1 X90.619 Y123.548
G1 X79.145 Y112.074 E.49863
G1 X79.145 Y112.607
G1 X90.619 Y124.082 E.49863
G1 X90.619 Y124.615
G1 X79.145 Y113.14 E.49863
G1 X79.145 Y113.674
G1 X90.619 Y125.148 E.49863
G1 X90.619 Y125.682
G1 X79.145 Y114.207 E.49863
G1 X79.145 Y114.74
G1 X90.619 Y126.215 E.49863
G1 X90.619 Y126.748
G1 X79.145 Y115.274 E.49863
G1 X79.145 Y115.807
G1 X90.619 Y127.281 E.49863
G1 X90.619 Y127.815
G1 X79.145 Y116.34 E.49863
G1 X79.145 Y116.873
G1 X90.619 Y128.348 E.49863
G1 X90.619 Y128.881
G1 X79.145 Y117.407 E.49863
G1 X79.145 Y117.94
G1 X90.619 Y129.414 E.49863
G1 X90.619 Y129.948
G1 X79.145 Y118.473 E.49863
G1 X79.145 Y119.006
G1 X90.619 Y130.481 E.49863
G1 X90.619 Y131.014
G1 X79.145 Y119.54 E.49863
G1 X79.145 Y120.073
G1 X90.619 Y131.548 E.49863
G1 X90.619 Y132.081
G1 X79.145 Y120.606 E.49863
G1 X79.145 Y121.139
G1 X90.619 Y132.614 E.49863
G1 X90.619 Y133.147
G1 X79.145 Y121.673 E.49863
M204 S10000
; WIPE_START
G1 F24000
G1 X80.559 Y123.087 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.559 J1.081 P1  F30000
G1 X100.451 Y133.38 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X101.446 Y134.375 E.04325
G1 X101.679 Y135.142
G1 X99.918 Y133.38 E.07656
G1 X99.384 Y133.38
G1 X101.966 Y135.962 E.11217
G1 X102.288 Y136.818
G1 X98.851 Y133.38 E.14937
G1 X98.318 Y133.38
G1 X102.656 Y137.718 E.18851
G1 X103.117 Y138.713
G1 X97.785 Y133.38 E.23172
G1 X97.251 Y133.38
G1 X103.657 Y139.786 E.27835
M204 S10000
; WIPE_START
G1 F24000
G1 X102.243 Y138.372 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.952 J.758 P1  F30000
G1 X104.329 Y140.991 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X96.718 Y133.38 E.33072
G1 X96.185 Y133.38
G1 X105.228 Y142.424 E.39298
M204 S10000
; WIPE_START
G1 F24000
G1 X103.814 Y141.01 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.931 J.783 P1  F30000
G1 X106.639 Y144.368 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X95.652 Y133.38 E.47745
M204 S10000
; WIPE_START
G1 F24000
G1 X97.066 Y134.795 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.949 J.762 P1  F30000
G1 X121.284 Y104.619 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X116.381 Y99.716 E.21307
G1 X116.381 Y100.249
G1 X120.751 Y104.619 E.1899
G1 X120.218 Y104.619
G1 X116.381 Y100.782 E.16672
G1 X116.381 Y101.316
G1 X119.684 Y104.619 E.14355
G1 X119.151 Y104.619
G1 X116.381 Y101.849 E.12038
G1 X116.381 Y102.382
G1 X118.618 Y104.619 E.0972
G1 X118.084 Y104.619
G1 X116.381 Y102.916 E.07403
G1 X116.381 Y103.449
G1 X117.551 Y104.619 E.05086
G1 X117.018 Y104.619
G1 X116.381 Y103.982 E.02768
M204 S10000
; WIPE_START
G1 F24000
G1 X117.018 Y104.619 E-.34237
G1 X117.551 Y104.619 E-.20264
G1 X117.151 Y104.219 E-.21498
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.144 J1.208 P1  F30000
G1 X152.881 Y99.954 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X157.546 Y104.619 E.20274
G1 X157.013 Y104.619
G1 X152.881 Y100.487 E.17957
G1 X152.881 Y101.02
G1 X156.48 Y104.619 E.1564
G1 X155.947 Y104.619
G1 X152.881 Y101.553 E.13322
G1 X152.881 Y102.087
G1 X155.413 Y104.619 E.11005
G1 X154.88 Y104.619
G1 X152.881 Y102.62 E.08688
G1 X152.881 Y103.153
G1 X154.347 Y104.619 E.06371
G1 X153.814 Y104.619
G1 X152.881 Y103.686 E.04053
G1 X152.881 Y104.22
G1 X153.28 Y104.619 E.01736
M204 S10000
; WIPE_START
G1 F24000
G1 X152.881 Y104.22 E-.21468
G1 X152.881 Y103.686 E-.20264
G1 X153.518 Y104.324 E-.34268
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.03 J1.217 P1  F30000
G1 X169.381 Y104.722 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X180.855 Y116.196 E.49863
G1 X180.855 Y116.729
G1 X169.381 Y105.255 E.49863
G1 X169.381 Y105.788
G1 X180.855 Y117.263 E.49863
G1 X180.855 Y117.796
G1 X169.381 Y106.321 E.49863
G1 X169.381 Y106.855
G1 X180.855 Y118.329 E.49863
G1 X180.855 Y118.863
G1 X169.381 Y107.388 E.49863
G1 X169.381 Y107.921
G1 X180.855 Y119.396 E.49863
G1 X180.855 Y119.929
G1 X169.381 Y108.455 E.49863
G1 X169.381 Y108.988
G1 X180.855 Y120.462 E.49863
G1 X180.855 Y120.996
G1 X169.381 Y109.521 E.49863
G1 X169.381 Y110.054
G1 X180.855 Y121.529 E.49863
G1 X180.855 Y122.062
G1 X169.381 Y110.588 E.49863
G1 X169.381 Y111.121
G1 X180.855 Y122.595 E.49863
G1 X180.855 Y123.129
G1 X169.381 Y111.654 E.49863
G1 X169.381 Y112.187
G1 X180.855 Y123.662 E.49863
G1 X180.855 Y124.195
G1 X169.381 Y112.721 E.49863
G1 X169.381 Y113.254
G1 X180.855 Y124.729 E.49863
G1 X180.855 Y125.262
G1 X169.381 Y113.787 E.49863
G1 X169.381 Y114.32
G1 X180.855 Y125.795 E.49863
G1 X180.855 Y126.328
G1 X169.381 Y114.854 E.49863
G1 X169.381 Y115.387
G1 X180.855 Y126.862 E.49863
G1 X180.855 Y127.395
G1 X169.381 Y115.92 E.49863
G1 X169.381 Y116.454
G1 X180.855 Y127.928 E.49863
G1 X180.855 Y128.461
G1 X169.381 Y116.987 E.49863
G1 X169.381 Y117.52
G1 X180.855 Y128.995 E.49863
G1 X180.855 Y129.528
G1 X169.381 Y118.053 E.49863
G1 X169.381 Y118.587
G1 X180.855 Y130.061 E.49863
G1 X180.855 Y130.594
G1 X169.381 Y119.12 E.49863
G1 X169.381 Y119.653
G1 X180.855 Y131.128 E.49863
M204 S10000
G1 X189.583 Y131.856 F30000
M204 S2000
G1 F12000
G1 X188.871 Y131.145 E.03091
G1 X188.338 Y131.145
G1 X189.583 Y132.389 E.05408
G1 X189.583 Y132.922
G1 X187.805 Y131.145 E.07726
G1 X187.271 Y131.145
G1 X189.583 Y133.456 E.10043
G1 X189.583 Y133.989
G1 X186.738 Y131.145 E.1236
G1 X186.205 Y131.145
G1 X189.583 Y134.522 E.14678
G1 X189.583 Y135.056
G1 X185.672 Y131.145 E.16995
G1 X185.138 Y131.145
G1 X189.583 Y135.589 E.19312
G1 X189.583 Y136.122
G1 X184.605 Y131.145 E.2163
G1 X184.072 Y131.145
G1 X189.583 Y136.655 E.23947
G1 X189.583 Y137.189
G1 X183.539 Y131.145 E.26264
G1 X183.005 Y131.145
G1 X189.583 Y137.722 E.28582
G1 X189.583 Y138.255
G1 X182.472 Y131.145 E.30899
G1 X181.939 Y131.145
G1 X189.583 Y138.788 E.33216
G1 X189.583 Y139.322
G1 X181.406 Y131.145 E.35533
G1 X180.872 Y131.145
G1 X189.583 Y139.855 E.37851
G1 X189.583 Y140.388
G1 X169.381 Y120.186 E.87787
G1 X169.381 Y120.72
G1 X189.583 Y140.922 E.87787
G1 X189.583 Y141.455
G1 X169.381 Y121.253 E.87787
G1 X169.381 Y121.786
G1 X189.583 Y141.988 E.87787
G1 X189.583 Y142.521
G1 X169.381 Y122.32 E.87787
G1 X169.381 Y122.853
G1 X189.583 Y143.055 E.87787
G1 X189.583 Y143.588
G1 X169.381 Y123.386 E.87787
G1 X169.381 Y123.919
G1 X189.583 Y144.121 E.87787
G1 X189.583 Y144.654
G1 X169.381 Y124.453 E.87787
G1 X169.381 Y124.986
G1 X189.583 Y145.188 E.87787
G1 X189.583 Y145.721
G1 X169.381 Y125.519 E.87787
G1 X169.381 Y126.052
G1 X189.583 Y146.254 E.87787
G1 X189.583 Y146.788
G1 X169.381 Y126.586 E.87787
G1 X169.381 Y127.119
G1 X189.583 Y147.321 E.87787
G1 X189.583 Y147.854
G1 X169.381 Y127.652 E.87787
G1 X169.381 Y128.186
G1 X189.583 Y148.387 E.87787
G1 X189.583 Y148.921
G1 X169.381 Y128.719 E.87787
G1 X169.381 Y129.252
G1 X189.583 Y149.454 E.87787
G1 X189.583 Y149.987
G1 X169.381 Y129.785 E.87787
G1 X169.381 Y130.319
G1 X189.583 Y150.52 E.87787
G1 X189.583 Y151.054
G1 X169.381 Y130.852 E.87787
G1 X169.381 Y131.385
G1 X189.583 Y151.587 E.87787
G1 X189.583 Y152.12
G1 X169.381 Y131.918 E.87787
G1 X169.381 Y132.452
G1 X189.583 Y152.653 E.87787
G1 X189.578 Y153.182
G1 X169.381 Y132.985 E.87767
G1 X169.243 Y133.381
G1 X189.533 Y153.67 E.88168
G1 X189.445 Y154.115
G1 X168.71 Y133.381 E.90102
G1 X168.177 Y133.381
G1 X189.321 Y154.525 E.91881
G1 X189.167 Y154.904
G1 X167.643 Y133.381 E.9353
G1 X167.11 Y133.381
G1 X188.987 Y155.257 E.95063
G1 X188.782 Y155.586
G1 X166.577 Y133.381 E.96492
G1 X166.044 Y133.381
G1 X188.554 Y155.892 E.97821
G1 X188.304 Y156.174
G1 X165.51 Y133.381 E.99048
G1 X164.977 Y133.381
G1 X188.031 Y156.435 E1.00183
G1 X187.738 Y156.675
G1 X164.444 Y133.38 E1.01224
M73 P71 R12
G1 X163.91 Y133.38
G1 X187.42 Y156.89 E1.0216
G1 X187.079 Y157.082
G1 X163.377 Y133.38 E1.02996
G1 X162.844 Y133.38
G1 X186.713 Y157.249 E1.03722
G1 X186.318 Y157.388
G1 X162.31 Y133.38 E1.04327
G1 X161.777 Y133.38
G1 X185.892 Y157.495 E1.04789
G1 X185.426 Y157.562
G1 X161.244 Y133.38 E1.05082
G1 X160.71 Y133.38
G1 X184.913 Y157.583 E1.05171
G1 X184.38 Y157.583
G1 X160.177 Y133.38 E1.05171
G1 X159.644 Y133.38
G1 X183.846 Y157.583 E1.05171
G1 X183.313 Y157.583
G1 X159.111 Y133.38 E1.05172
G1 X158.782 Y133.585
G1 X182.78 Y157.583 E1.04281
G1 X182.247 Y157.583
G1 X158.664 Y134.001 E1.02476
G1 X158.543 Y134.412
G1 X181.713 Y157.583 E1.00686
G1 X181.18 Y157.583
G1 X158.422 Y134.824 E.98896
G1 X158.291 Y135.227
G1 X180.647 Y157.583 E.97147
G1 X180.113 Y157.583
G1 X158.153 Y135.622 E.95429
G1 X158.015 Y136.017
G1 X179.58 Y157.583 E.93712
G1 X179.047 Y157.583
G1 X157.874 Y136.41 E.92006
G1 X157.722 Y136.791
G1 X178.514 Y157.583 E.90349
G1 X177.98 Y157.583
G1 X157.568 Y137.171 E.887
G1 X157.414 Y137.55
G1 X177.447 Y157.583 E.87052
G1 X176.914 Y157.583
G1 X157.254 Y137.923 E.85433
G1 X157.085 Y138.287
G1 X176.381 Y157.583 E.8385
G1 X175.847 Y157.583
G1 X156.915 Y138.651 E.82268
G1 X156.746 Y139.014
G1 X175.314 Y157.583 E.80689
G1 X174.781 Y157.583
G1 X156.563 Y139.365 E.79166
G1 X156.38 Y139.715
G1 X174.247 Y157.583 E.77642
G1 X173.714 Y157.583
G1 X156.197 Y140.066 E.76119
G1 X156.01 Y140.412
G1 X173.181 Y157.583 E.74616
G1 X172.648 Y157.583
G1 X155.813 Y140.748 E.73155
G1 X155.616 Y141.084
G1 X172.114 Y157.583 E.71694
G1 X171.581 Y157.583
G1 X155.419 Y141.42 E.70233
G1 X155.214 Y141.749
G1 X171.048 Y157.583 E.68804
G1 X170.515 Y157.583
G1 X155.003 Y142.072 E.67403
G1 X154.793 Y142.394
G1 X169.981 Y157.583 E.66003
G1 X169.448 Y157.583
G1 X154.582 Y142.716 E.64602
G1 X154.361 Y143.029
G1 X168.915 Y157.583 E.63243
G1 X168.381 Y157.583
G1 X154.136 Y143.337 E.61902
G1 X153.912 Y143.646
G1 X167.848 Y157.583 E.60561
G1 X167.315 Y157.583
G1 X153.687 Y143.955 E.5922
G1 X153.451 Y144.252
G1 X166.782 Y157.583 E.57927
G1 X166.248 Y157.583
G1 X153.213 Y144.547 E.56645
G1 X152.975 Y144.843
G1 X165.715 Y157.583 E.55362
G1 X165.182 Y157.583
G1 X152.737 Y145.138 E.54079
G1 X152.486 Y145.42
G1 X164.649 Y157.583 E.52851
G1 X164.115 Y157.583
G1 X152.235 Y145.702 E.51626
G1 X151.984 Y145.984
G1 X163.582 Y157.583 E.50401
G1 X163.049 Y157.583
G1 X151.732 Y146.266 E.49178
G1 X151.467 Y146.534
G1 X162.516 Y157.583 E.4801
G1 X161.982 Y157.583
G1 X151.203 Y146.803 E.46843
G1 X150.938 Y147.072
G1 X161.449 Y157.583 E.45676
G1 X160.916 Y157.583
G1 X150.672 Y147.339 E.44515
G1 X150.394 Y147.594
G1 X160.382 Y157.583 E.43405
G1 X159.849 Y157.583
G1 X150.116 Y147.85 E.42295
G1 X149.838 Y148.105
G1 X159.316 Y157.583 E.41185
G1 X158.783 Y157.583
G1 X149.558 Y148.358 E.40086
G1 X149.267 Y148.6
G1 X158.249 Y157.583 E.39034
G1 X157.716 Y157.583
G1 X148.976 Y148.842 E.37982
G1 X148.684 Y149.084
G1 X157.183 Y157.583 E.3693
G1 X156.65 Y157.583
G1 X148.389 Y149.322 E.35895
G1 X148.085 Y149.551
G1 X156.116 Y157.583 E.34901
M73 P71 R11
G1 X155.583 Y157.583
G1 X147.78 Y149.78 E.33907
G1 X147.476 Y150.009
G1 X155.05 Y157.583 E.32913
G1 X154.516 Y157.583
G1 X147.165 Y150.232 E.31944
G1 X146.847 Y150.447
G1 X153.983 Y157.583 E.31009
G1 X153.45 Y157.583
G1 X146.529 Y150.662 E.30074
G1 X146.211 Y150.877
G1 X152.917 Y157.583 E.29139
G1 X152.383 Y157.583
G1 X145.885 Y151.084 E.28239
G1 X145.553 Y151.285
G1 X151.85 Y157.583 E.27364
G1 X151.317 Y157.583
G1 X145.221 Y151.487 E.26489
G1 X144.889 Y151.688
G1 X150.784 Y157.583 E.25615
G1 X150.25 Y157.583
G1 X144.546 Y151.878 E.24788
G1 X144.2 Y152.066
G1 X149.717 Y157.583 E.23974
G1 X149.184 Y157.583
G1 X143.854 Y152.253 E.23161
G1 X143.507 Y152.439
G1 X148.65 Y157.583 E.2235
G1 X148.117 Y157.583
G1 X143.147 Y152.612 E.216
G1 X142.786 Y152.784
G1 X147.584 Y157.583 E.2085
G1 X147.051 Y157.583
G1 X142.425 Y152.957 E.20101
G1 X142.059 Y153.124
G1 X146.517 Y157.583 E.19373
G1 X145.984 Y157.583
G1 X141.683 Y153.282 E.18689
G1 X141.307 Y153.439
G1 X145.451 Y157.583 E.18005
G1 X144.918 Y157.583
G1 X140.931 Y153.596 E.17322
G1 X140.544 Y153.743
G1 X144.384 Y157.583 E.16686
G1 X143.851 Y157.583
G1 X140.153 Y153.884 E.16071
G1 X139.761 Y154.026
G1 X143.318 Y157.583 E.15456
G1 X142.785 Y157.583
G1 X139.367 Y154.165 E.14852
G1 X138.959 Y154.29
G1 X142.251 Y157.583 E.14308
G1 X141.718 Y157.583
G1 X138.55 Y154.415 E.13765
G1 X138.142 Y154.54
G1 X141.185 Y157.583 E.13221
G1 X140.651 Y157.583
G1 X137.722 Y154.653 E.12731
G1 X137.296 Y154.761
G1 X140.118 Y157.583 E.12263
G1 X139.585 Y157.583
G1 X136.87 Y154.868 E.11795
G1 X136.439 Y154.97
G1 X139.052 Y157.583 E.11355
G1 X138.518 Y157.583
G1 X135.995 Y155.059 E.10967
G1 X135.55 Y155.148
G1 X137.985 Y157.583 E.1058
G1 X137.452 Y157.583
G1 X135.105 Y155.236 E.10199
G1 X134.641 Y155.305
G1 X136.919 Y157.583 E.09897
G1 X136.385 Y157.583
G1 X134.177 Y155.375 E.09595
G1 X133.713 Y155.444
G1 X135.852 Y157.583 E.09293
G1 X135.319 Y157.583
G1 X133.23 Y155.494 E.09078
G1 X132.745 Y155.542
G1 X134.785 Y157.583 E.08868
G1 X134.252 Y157.583
G1 X132.26 Y155.59 E.08658
G1 X131.754 Y155.618
G1 X133.719 Y157.583 E.08539
G1 X133.186 Y157.583
G1 X131.246 Y155.643 E.0843
G1 X130.738 Y155.668
G1 X132.652 Y157.583 E.0832
G1 X132.119 Y157.583
G1 X130.204 Y155.668 E.0832
G1 X129.671 Y155.668
G1 X131.586 Y157.583 E.0832
G1 X131.053 Y157.583
G1 X129.131 Y155.661 E.08349
G1 X128.57 Y155.634
G1 X130.519 Y157.583 E.08469
G1 X129.986 Y157.583
G1 X128.009 Y155.606 E.08589
G1 X127.429 Y155.559
G1 X129.453 Y157.583 E.08793
G1 X128.92 Y157.583
G1 X126.837 Y155.501 E.09047
G1 X126.24 Y155.436
G1 X128.386 Y157.583 E.09326
G1 X127.853 Y157.583
G1 X125.614 Y155.343 E.09731
G1 X124.987 Y155.25
G1 X127.32 Y157.583 E.10136
G1 X126.786 Y157.583
G1 X124.327 Y155.123 E.10687
G1 X123.661 Y154.99
G1 X126.253 Y157.583 E.11265
G1 X125.72 Y157.583
G1 X122.963 Y154.826 E.1198
G1 X122.251 Y154.647
G1 X125.187 Y157.583 E.12757
G1 X124.653 Y157.583
G1 X121.501 Y154.43 E.13698
G1 X120.735 Y154.197
G1 X124.12 Y157.583 E.14711
G1 X123.587 Y157.583
G1 X119.912 Y153.908 E.15969
G1 X119.064 Y153.593
M73 P72 R11
G1 X123.054 Y157.583 E.17336
G1 X122.52 Y157.583
G1 X118.152 Y153.214 E.18984
G1 X117.166 Y152.762
G1 X121.987 Y157.583 E.2095
G1 X121.454 Y157.583
G1 X116.096 Y152.224 E.23284
M204 S10000
; WIPE_START
G1 F24000
G1 X117.51 Y153.639 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.758 J-.952 P1  F30000
G1 X114.892 Y151.554 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X120.92 Y157.583 E.26198
G1 X120.387 Y157.583
G1 X113.456 Y150.651 E.30119
M204 S10000
; WIPE_START
G1 F24000
G1 X114.87 Y152.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.783 J-.932 P1  F30000
G1 X111.529 Y149.258 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X119.854 Y157.583 E.36174
G1 X119.321 Y157.583
G1 X95.119 Y133.381 E1.0517
G1 X94.585 Y133.381
G1 X118.787 Y157.583 E1.0517
G1 X118.254 Y157.583
G1 X94.052 Y133.381 E1.05169
G1 X93.519 Y133.381
G1 X117.721 Y157.583 E1.05169
G1 X117.188 Y157.583
G1 X92.986 Y133.381 E1.05169
G1 X92.452 Y133.381
G1 X116.654 Y157.583 E1.05169
G1 X116.121 Y157.583
G1 X91.919 Y133.381 E1.05169
G1 X91.386 Y133.381
G1 X115.588 Y157.583 E1.05169
G1 X115.054 Y157.583
G1 X90.853 Y133.381 E1.05168
M204 S10000
; WIPE_START
G1 F24000
G1 X92.267 Y134.795 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.842 J-.878 P1  F30000
G1 X79.145 Y122.206 Z7.4
G1 Z7
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X114.521 Y157.583 E1.53728
G1 X113.988 Y157.583
G1 X79.145 Y122.739 E1.51411
G1 X79.145 Y123.273
G1 X113.455 Y157.583 E1.49094
G1 X112.921 Y157.583
G1 X79.145 Y123.806 E1.46776
G1 X79.145 Y124.339
G1 X112.388 Y157.583 E1.44459
G1 X111.855 Y157.583
G1 X79.145 Y124.872 E1.42142
G1 X79.145 Y125.406
G1 X111.322 Y157.583 E1.39824
G1 X110.788 Y157.583
G1 X79.145 Y125.939 E1.37507
G1 X79.145 Y126.472
G1 X110.255 Y157.583 E1.3519
G1 X109.722 Y157.583
G1 X79.145 Y127.005 E1.32873
G1 X79.145 Y127.539
G1 X109.189 Y157.583 E1.30555
G1 X108.655 Y157.583
G1 X79.145 Y128.072 E1.28238
G1 X79.145 Y128.605
G1 X108.122 Y157.583 E1.25921
G1 X107.589 Y157.583
G1 X79.145 Y129.139 E1.23603
G1 X79.145 Y129.672
G1 X107.055 Y157.583 E1.21286
G1 X106.522 Y157.583
G1 X79.145 Y130.205 E1.18969
G1 X79.145 Y130.738
G1 X105.989 Y157.583 E1.16651
G1 X105.456 Y157.583
G1 X79.018 Y131.145 E1.14886
G1 X78.484 Y131.145
G1 X104.922 Y157.583 E1.14886
G1 X104.389 Y157.583
G1 X77.951 Y131.145 E1.14886
G1 X77.418 Y131.145
G1 X103.856 Y157.583 E1.14886
G1 X103.323 Y157.583
G1 X76.885 Y131.145 E1.14886
G1 X76.351 Y131.145
G1 X102.789 Y157.583 E1.14886
G1 X102.256 Y157.583
G1 X75.818 Y131.145 E1.14886
G1 X75.285 Y131.145
G1 X101.723 Y157.583 E1.14886
G1 X101.189 Y157.583
G1 X74.751 Y131.145 E1.14886
G1 X74.218 Y131.145
G1 X100.656 Y157.583 E1.14886
G1 X100.123 Y157.583
G1 X73.685 Y131.145 E1.14886
G1 X73.152 Y131.145
G1 X99.59 Y157.583 E1.14886
G1 X99.056 Y157.583
G1 X72.618 Y131.145 E1.14886
G1 X72.085 Y131.145
G1 X98.523 Y157.583 E1.14886
G1 X97.99 Y157.583
G1 X71.552 Y131.145 E1.14886
G1 X71.019 Y131.145
G1 X97.457 Y157.583 E1.14886
G1 X96.923 Y157.583
G1 X70.485 Y131.145 E1.14886
G1 X70.417 Y131.61
G1 X96.39 Y157.583 E1.12864
G1 X95.857 Y157.583
G1 X70.417 Y132.143 E1.10546
G1 X70.417 Y132.677
G1 X95.323 Y157.583 E1.08229
G1 X94.79 Y157.583
G1 X70.417 Y133.21 E1.05912
G1 X70.417 Y133.743
G1 X94.257 Y157.583 E1.03594
G1 X93.724 Y157.583
G1 X70.417 Y134.276 E1.01277
G1 X70.417 Y134.81
G1 X93.19 Y157.583 E.9896
G1 X92.657 Y157.583
G1 X70.417 Y135.343 E.96642
G1 X70.417 Y135.876
G1 X92.124 Y157.583 E.94325
G1 X91.591 Y157.583
G1 X70.417 Y136.409 E.92008
G1 X70.417 Y136.943
G1 X91.057 Y157.583 E.8969
G1 X90.524 Y157.583
G1 X70.417 Y137.476 E.87373
G1 X70.417 Y138.009
G1 X89.991 Y157.583 E.85056
G1 X89.458 Y157.583
G1 X70.417 Y138.542 E.82738
G1 X70.417 Y139.076
G1 X88.924 Y157.583 E.80421
G1 X88.391 Y157.583
G1 X70.417 Y139.609 E.78104
G1 X70.417 Y140.142
G1 X87.858 Y157.583 E.75787
G1 X87.324 Y157.583
G1 X70.417 Y140.676 E.73469
G1 X70.417 Y141.209
G1 X86.791 Y157.583 E.71152
G1 X86.258 Y157.583
G1 X70.417 Y141.742 E.68835
G1 X70.417 Y142.275
G1 X85.725 Y157.583 E.66517
G1 X85.191 Y157.583
G1 X70.417 Y142.809 E.642
G1 X70.417 Y143.342
G1 X84.658 Y157.583 E.61883
G1 X84.125 Y157.583
G1 X70.417 Y143.875 E.59565
G1 X70.417 Y144.408
G1 X83.592 Y157.583 E.57248
G1 X83.058 Y157.583
G1 X70.417 Y144.942 E.54931
G1 X70.417 Y145.475
G1 X82.525 Y157.583 E.52613
G1 X81.992 Y157.583
G1 X70.417 Y146.008 E.50296
G1 X70.417 Y146.542
G1 X81.458 Y157.583 E.47979
G1 X80.925 Y157.583
G1 X70.417 Y147.075 E.45661
G1 X70.417 Y147.608
G1 X80.392 Y157.583 E.43344
G1 X79.859 Y157.583
G1 X70.417 Y148.141 E.41027
G1 X70.417 Y148.675
G1 X79.325 Y157.583 E.38709
G1 X78.792 Y157.583
G1 X70.417 Y149.208 E.36392
G1 X70.417 Y149.741
G1 X78.259 Y157.583 E.34075
G1 X77.726 Y157.583
G1 X70.417 Y150.274 E.31758
G1 X70.417 Y150.808
G1 X77.192 Y157.583 E.2944
G1 X76.659 Y157.583
G1 X70.417 Y151.341 E.27123
G1 X70.417 Y151.874
G1 X76.126 Y157.583 E.24806
G1 X75.592 Y157.583
G1 X70.417 Y152.408 E.22488
G1 X70.417 Y152.941
G1 X75.059 Y157.583 E.20171
G1 X74.497 Y157.554
G1 X70.446 Y153.503 E.17603
G1 X70.567 Y154.157
G1 X73.843 Y157.433 E.14237
G1 X72.998 Y157.121
G1 X70.879 Y155.002 E.09205
M204 S10000
; WIPE_START
G1 F24000
G1 X72.293 Y156.417 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.529 J1.096 P1  F30000
G1 X188.634 Y100.214 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.112291
G1 F15000
G2 X187.786 Y99.366 I-7.652 J6.804 E.00678
G1 X186.941 Y98.94 F30000
; LINE_WIDTH: 0.214846
G1 F15000
G1 X186.762 Y98.817 E.00304
; LINE_WIDTH: 0.186028
G1 X186.583 Y98.695 E.00253
; WIPE_START
G1 F24000
G1 X186.762 Y98.817 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.001 J-1.217 P1  F30000
G1 X72.866 Y98.945 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.0872673
G1 F15000
G1 X72.761 Y99.025 E.00048
; WIPE_START
G1 F24000
G1 X72.866 Y98.945 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.216 J-.042 P1  F30000
G1 X70.94 Y154.941 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.21486
G1 F15000
G1 X70.818 Y154.762 E.00304
; LINE_WIDTH: 0.185976
G1 X70.695 Y154.583 E.00253
; WIPE_START
G1 F24000
G1 X70.818 Y154.762 E-.76
; WIPE_END
M73 P73 R11
G1 E-.04 F1800
G17
G3 Z7.4 I-.975 J.728 P1  F30000
G1 X72.213 Y156.633 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.112225
G1 F15000
G3 X71.367 Y155.787 I6.806 J-7.653 E.00677
; WIPE_START
G1 F24000
G1 X71.776 Y156.224 E-.38
G1 X72.213 Y156.633 E-.38
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.498 J1.11 P1  F30000
G1 X74.162 Y157.507 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.0881706
G1 F15000
G1 X73.903 Y157.373 E.00107
; WIPE_START
G1 F24000
G1 X74.162 Y157.507 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.526 J1.097 P1  F30000
G1 X189.507 Y102.162 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.0881696
G1 F15000
G1 X189.373 Y101.903 E.00107
; WIPE_START
G1 F24000
G1 X189.507 Y102.162 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.368 J-1.16 P1  F30000
G1 X90.74 Y133.493 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.101595
G1 F15000
G1 X90.507 Y133.26 E.00158
; WIPE_START
G1 F24000
G1 X90.74 Y133.493 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.054 J1.216 P1  F30000
G1 X101.325 Y133.967 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.205962
G1 F15000
G1 X100.972 Y133.361 E.00931
; WIPE_START
G1 F24000
G1 X101.325 Y133.967 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.136 J.438 P1  F30000
G1 X103.33 Y139.165 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X103.238 Y139.035 E.00059
; LINE_WIDTH: 0.130434
G1 X103.147 Y138.905 E.00113
; LINE_WIDTH: 0.172698
G1 X103.055 Y138.775 E.00168
; WIPE_START
G1 F24000
G1 X103.147 Y138.905 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.061 J.595 P1  F30000
G1 X103.926 Y140.295 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X103.816 Y140.146 E.00068
; LINE_WIDTH: 0.132097
G1 X103.706 Y139.996 E.00135
; LINE_WIDTH: 0.176024
G1 X103.596 Y139.847 E.00201
; WIPE_START
G1 F24000
G1 X103.706 Y139.996 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.037 J.637 P1  F30000
G1 X104.677 Y141.578 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.088171
G1 F15000
G1 X104.541 Y141.403 E.00082
; LINE_WIDTH: 0.13376
G1 X104.405 Y141.227 E.00164
; LINE_WIDTH: 0.179349
G1 X104.268 Y141.052 E.00247
; WIPE_START
G1 F24000
G1 X104.405 Y141.227 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.004 J.688 P1  F30000
G1 X105.732 Y143.164 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.0884277
G1 F15000
G1 X105.575 Y142.982 E.00089
; LINE_WIDTH: 0.120795
G1 X105.439 Y142.816 E.00136
; LINE_WIDTH: 0.157173
G1 X105.304 Y142.65 E.002
; LINE_WIDTH: 0.19355
G1 X105.168 Y142.484 E.00263
; WIPE_START
G1 F24000
G1 X105.304 Y142.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.945 J.767 P1  F30000
G1 X107.96 Y145.924 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.088278
G1 F15000
G1 X107.37 Y145.303 E.00316
; LINE_WIDTH: 0.131112
G1 X107.111 Y145.017 E.00277
; LINE_WIDTH: 0.169959
G1 X106.845 Y144.722 E.00411
; LINE_WIDTH: 0.204952
G1 X106.579 Y144.428 E.00524
; WIPE_START
G1 F24000
G1 X106.845 Y144.722 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.858 J.863 P1  F30000
G1 X111.469 Y149.318 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.240398
G1 F15000
G1 X111.139 Y149.019 E.00717
; LINE_WIDTH: 0.200695
G1 X110.809 Y148.719 E.00573
; LINE_WIDTH: 0.160821
G1 X110.478 Y148.418 E.0043
; LINE_WIDTH: 0.12115
G1 X109.954 Y147.918 E.00462
; WIPE_START
G1 F24000
G1 X110.478 Y148.418 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.752 J.957 P1  F30000
G1 X113.395 Y150.712 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.230377
G1 F15000
G1 X113.196 Y150.548 E.00395
; LINE_WIDTH: 0.186189
G1 X112.996 Y150.383 E.00302
; LINE_WIDTH: 0.14177
G1 X112.795 Y150.218 E.00209
; LINE_WIDTH: 0.0975825
G1 X112.729 Y150.161 E.00039
; WIPE_START
G1 F24000
G1 X112.795 Y150.218 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.688 J1.004 P1  F30000
G1 X114.831 Y151.615 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.225391
G1 F15000
G1 X114.653 Y151.475 E.00336
; LINE_WIDTH: 0.17965
G1 X114.474 Y151.336 E.00252
; LINE_WIDTH: 0.13391
G1 X114.296 Y151.197 E.00168
; WIPE_START
G1 F24000
G1 X114.474 Y151.336 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.633 J1.039 P1  F30000
G1 X116.034 Y152.286 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.220404
G1 F15000
G1 X115.883 Y152.173 E.00272
; LINE_WIDTH: 0.176326
G1 X115.732 Y152.061 E.00205
; LINE_WIDTH: 0.132248
G1 X115.581 Y151.949 E.00137
; WIPE_START
G1 F24000
G1 X115.732 Y152.061 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.591 J1.064 P1  F30000
G1 X117.104 Y152.823 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.215413
G1 F15000
G1 X116.972 Y152.73 E.00227
; LINE_WIDTH: 0.172999
G1 X116.841 Y152.637 E.00171
; LINE_WIDTH: 0.130584
G1 X116.709 Y152.545 E.00115
; WIPE_START
G1 F24000
G1 X116.841 Y152.637 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.519 J1.101 P1  F30000
G1 X119.002 Y153.655 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.210409
G1 F15000
G1 X118.885 Y153.577 E.00192
; LINE_WIDTH: 0.169663
G1 X118.768 Y153.499 E.00145
; LINE_WIDTH: 0.128917
G1 X118.651 Y153.421 E.00099
; WIPE_START
G1 F24000
G1 X118.768 Y153.499 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.407 J1.147 P1  F30000
G1 X122.185 Y154.713 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.138084
G1 F15000
G1 X121.916 Y154.556 E.00241
; WIPE_START
G1 F24000
G1 X122.185 Y154.713 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.289 J1.182 P1  F30000
G1 X123.594 Y155.057 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.133063
G1 F15000
G1 X123.446 Y154.976 E.00124
G2 X123.359 Y154.955 I-.061 J.066 E.00068
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X123.446 Y154.976 E-.26232
G1 X123.594 Y155.057 E-.49768
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
G3 Z7.4 I.788 J.927 P1  F30000
G1 X180.602 Y106.602 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3826
G1 X189.398 Y106.602 E.29177
G1 X189.398 Y131.398 E.82252
G1 X180.602 Y131.398 E.29177
G1 X180.602 Y106.662 E.82053
G1 X180.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3826
G1 X189.79 Y106.21 E.29437
G1 X189.79 Y131.79 E.786
G1 X180.21 Y131.79 E.29437
G1 X180.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-1.164 J.354 P1  F30000
G1 X189.05 Y128.73 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3826
G1 X189.05 Y130.358 E.05401
G1 X188.358 Y131.05 E.03244
G1 X186.781 Y131.05 E.0523
G1 X180.95 Y125.219 E.27355
G1 X180.95 Y123.105 E.0701
G1 X189.05 Y115.006 E.37996
G1 X189.05 Y117.966 E.09818
G1 X180.95 Y109.867 E.37996
G1 X180.95 Y107.754 E.0701
G1 X181.754 Y106.95 E.03768
G1 X185.71 Y106.95 E.13124
G1 X189.05 Y110.29 E.15667
G1 X189.05 Y107.33 E.09818
G1 X180.95 Y115.43 E.37996
G1 X180.95 Y117.543 E.0701
G1 X189.05 Y125.642 E.37996
G1 X189.05 Y122.682 E.09818
G1 X180.95 Y130.781 E.37996
G1 X180.95 Y131.05 E.0089
G1 X182.31 Y131.05 E.04512
; WIPE_START
G1 F24000
G1 X180.95 Y131.05 E-.51683
G1 X180.95 Y130.781 E-.10193
G1 X181.213 Y130.519 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-.011 J-1.217 P1  F30000
G1 X79.398 Y131.398 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3826
G1 X70.602 Y131.398 E.29177
G1 X70.602 Y106.602 E.82252
G1 X79.398 Y106.602 E.29177
G1 X79.398 Y131.338 E.82053
G1 X79.79 Y131.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3826
G1 X70.21 Y131.79 E.29437
G1 X70.21 Y106.21 E.786
G1 X79.79 Y106.21 E.29437
G1 X79.79 Y131.73 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I1.204 J-.175 P1  F30000
G1 X77.69 Y131.05 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3826
G1 X79.05 Y131.05 E.04512
G1 X79.05 Y130.781 E.0089
G1 X70.95 Y122.682 E.37996
G1 X70.95 Y125.642 E.09818
G1 X79.05 Y117.543 E.37996
G1 X79.05 Y115.429 E.0701
G1 X70.95 Y107.33 E.37996
G1 X70.95 Y110.29 E.09818
G1 X74.29 Y106.95 E.15667
G1 X78.246 Y106.95 E.13124
G1 X79.05 Y107.754 E.03768
G1 X79.05 Y109.867 E.0701
G1 X70.95 Y117.966 E.37996
G1 X70.95 Y115.006 E.09818
G1 X79.05 Y123.105 E.37996
G1 X79.05 Y125.219 E.0701
G1 X73.219 Y131.05 E.27355
G1 X71.642 Y131.05 E.0523
G1 X70.95 Y130.358 E.03244
G1 X70.95 Y128.73 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X70.95 Y130.358 E-.61876
G1 X71.213 Y130.621 E-.14124
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
G3 Z7.6 I.261 J1.189 P1  F30000
G1 X180.602 Y106.602 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3867
G1 X189.398 Y106.602 E.29177
G1 X189.398 Y131.398 E.82252
G1 X180.602 Y131.398 E.29177
G1 X180.602 Y106.662 E.82053
G1 X180.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3867
G1 X189.79 Y106.21 E.29437
G1 X189.79 Y131.79 E.786
G1 X180.21 Y131.79 E.29437
G1 X180.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.164 J.354 P1  F30000
G1 X189.05 Y128.73 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3867
G1 X189.05 Y130.358 E.05401
G1 X188.358 Y131.05 E.03244
G1 X186.781 Y131.05 E.0523
G1 X180.95 Y125.219 E.27355
G1 X180.95 Y123.105 E.0701
G1 X189.05 Y115.006 E.37996
G1 X189.05 Y117.966 E.09818
G1 X180.95 Y109.867 E.37996
G1 X180.95 Y107.754 E.0701
G1 X181.754 Y106.95 E.03768
G1 X185.71 Y106.95 E.13124
G1 X189.05 Y110.29 E.15667
G1 X189.05 Y107.33 E.09818
G1 X180.95 Y115.43 E.37996
G1 X180.95 Y117.543 E.0701
G1 X189.05 Y125.642 E.37996
G1 X189.05 Y122.682 E.09818
G1 X180.95 Y130.781 E.37996
G1 X180.95 Y131.05 E.0089
G1 X182.31 Y131.05 E.04512
; WIPE_START
G1 F24000
G1 X180.95 Y131.05 E-.51683
G1 X180.95 Y130.781 E-.10193
G1 X181.213 Y130.519 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-.011 J-1.217 P1  F30000
G1 X79.398 Y131.398 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3867
G1 X70.602 Y131.398 E.29177
G1 X70.602 Y106.602 E.82252
G1 X79.398 Y106.602 E.29177
G1 X79.398 Y131.338 E.82053
G1 X79.79 Y131.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3867
G1 X70.21 Y131.79 E.29437
G1 X70.21 Y106.21 E.786
G1 X79.79 Y106.21 E.29437
G1 X79.79 Y131.73 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I1.204 J-.175 P1  F30000
G1 X77.69 Y131.05 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3867
G1 X79.05 Y131.05 E.04512
G1 X79.05 Y130.781 E.0089
G1 X70.95 Y122.682 E.37996
G1 X70.95 Y125.642 E.09818
G1 X79.05 Y117.543 E.37996
G1 X79.05 Y115.429 E.0701
G1 X70.95 Y107.33 E.37996
G1 X70.95 Y110.29 E.09818
G1 X74.29 Y106.95 E.15667
G1 X78.246 Y106.95 E.13124
G1 X79.05 Y107.754 E.03768
G1 X79.05 Y109.867 E.0701
G1 X70.95 Y117.966 E.37996
G1 X70.95 Y115.006 E.09818
G1 X79.05 Y123.105 E.37996
G1 X79.05 Y125.219 E.0701
G1 X73.219 Y131.05 E.27355
G1 X71.642 Y131.05 E.0523
G1 X70.95 Y130.358 E.03244
G1 X70.95 Y128.73 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X70.95 Y130.358 E-.61876
G1 X71.213 Y130.621 E-.14124
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
G3 Z7.8 I.261 J1.189 P1  F30000
G1 X180.602 Y106.602 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3867
G1 X189.398 Y106.602 E.29177
G1 X189.398 Y131.398 E.82252
G1 X180.602 Y131.398 E.29177
G1 X180.602 Y106.662 E.82053
G1 X180.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3867
G1 X189.79 Y106.21 E.29437
G1 X189.79 Y131.79 E.786
G1 X180.21 Y131.79 E.29437
G1 X180.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.164 J.354 P1  F30000
G1 X189.05 Y128.73 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3867
G1 X189.05 Y130.358 E.05401
G1 X188.358 Y131.05 E.03244
G1 X186.781 Y131.05 E.0523
G1 X180.95 Y125.219 E.27355
G1 X180.95 Y123.105 E.0701
G1 X189.05 Y115.006 E.37996
G1 X189.05 Y117.966 E.09818
G1 X180.95 Y109.867 E.37996
G1 X180.95 Y107.754 E.0701
G1 X181.754 Y106.95 E.03768
G1 X185.71 Y106.95 E.13124
G1 X189.05 Y110.29 E.15667
G1 X189.05 Y107.33 E.09818
G1 X180.95 Y115.43 E.37996
G1 X180.95 Y117.543 E.0701
G1 X189.05 Y125.642 E.37996
G1 X189.05 Y122.682 E.09818
G1 X180.95 Y130.781 E.37996
G1 X180.95 Y131.05 E.0089
G1 X182.31 Y131.05 E.04512
; WIPE_START
G1 F24000
G1 X180.95 Y131.05 E-.51683
G1 X180.95 Y130.781 E-.10193
G1 X181.213 Y130.519 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-.011 J-1.217 P1  F30000
G1 X79.398 Y131.398 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3867
G1 X70.602 Y131.398 E.29177
G1 X70.602 Y106.602 E.82252
G1 X79.398 Y106.602 E.29177
G1 X79.398 Y131.338 E.82053
G1 X79.79 Y131.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P73 R10
G1 F3867
M73 P74 R10
G1 X70.21 Y131.79 E.29437
G1 X70.21 Y106.21 E.786
G1 X79.79 Y106.21 E.29437
G1 X79.79 Y131.73 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I1.204 J-.175 P1  F30000
G1 X77.69 Y131.05 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3867
G1 X79.05 Y131.05 E.04512
G1 X79.05 Y130.781 E.0089
G1 X70.95 Y122.682 E.37996
G1 X70.95 Y125.642 E.09818
G1 X79.05 Y117.543 E.37996
G1 X79.05 Y115.429 E.0701
G1 X70.95 Y107.33 E.37996
G1 X70.95 Y110.29 E.09818
G1 X74.29 Y106.95 E.15667
G1 X78.246 Y106.95 E.13124
G1 X79.05 Y107.754 E.03768
G1 X79.05 Y109.867 E.0701
G1 X70.95 Y117.966 E.37996
G1 X70.95 Y115.006 E.09818
G1 X79.05 Y123.105 E.37996
G1 X79.05 Y125.219 E.0701
G1 X73.219 Y131.05 E.27355
G1 X71.642 Y131.05 E.0523
G1 X70.95 Y130.358 E.03244
G1 X70.95 Y128.73 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X70.95 Y130.358 E-.61876
G1 X71.213 Y130.621 E-.14124
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
G3 Z8 I.261 J1.189 P1  F30000
G1 X180.602 Y106.602 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3867
G1 X189.398 Y106.602 E.29177
G1 X189.398 Y131.398 E.82252
G1 X180.602 Y131.398 E.29177
G1 X180.602 Y106.662 E.82053
G1 X180.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3867
G1 X189.79 Y106.21 E.29437
G1 X189.79 Y131.79 E.786
G1 X180.21 Y131.79 E.29437
G1 X180.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.164 J.354 P1  F30000
G1 X189.05 Y128.73 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3867
G1 X189.05 Y130.358 E.05401
G1 X188.358 Y131.05 E.03244
G1 X186.781 Y131.05 E.0523
G1 X180.95 Y125.219 E.27355
G1 X180.95 Y123.105 E.0701
G1 X189.05 Y115.006 E.37996
G1 X189.05 Y117.966 E.09818
G1 X180.95 Y109.867 E.37996
G1 X180.95 Y107.754 E.0701
G1 X181.754 Y106.95 E.03768
G1 X185.71 Y106.95 E.13124
G1 X189.05 Y110.29 E.15667
G1 X189.05 Y107.33 E.09818
G1 X180.95 Y115.43 E.37996
G1 X180.95 Y117.543 E.0701
G1 X189.05 Y125.642 E.37996
G1 X189.05 Y122.682 E.09818
G1 X180.95 Y130.781 E.37996
G1 X180.95 Y131.05 E.0089
G1 X182.31 Y131.05 E.04512
; WIPE_START
G1 F24000
G1 X180.95 Y131.05 E-.51683
G1 X180.95 Y130.781 E-.10193
G1 X181.213 Y130.519 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-.011 J-1.217 P1  F30000
G1 X79.398 Y131.398 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3867
G1 X70.602 Y131.398 E.29177
G1 X70.602 Y106.602 E.82252
G1 X79.398 Y106.602 E.29177
G1 X79.398 Y131.338 E.82053
G1 X79.79 Y131.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3867
G1 X70.21 Y131.79 E.29437
G1 X70.21 Y106.21 E.786
G1 X79.79 Y106.21 E.29437
G1 X79.79 Y131.73 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I1.204 J-.175 P1  F30000
G1 X77.69 Y131.05 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3867
G1 X79.05 Y131.05 E.04512
G1 X79.05 Y130.781 E.0089
G1 X70.95 Y122.682 E.37996
G1 X70.95 Y125.642 E.09818
G1 X79.05 Y117.543 E.37996
G1 X79.05 Y115.429 E.0701
G1 X70.95 Y107.33 E.37996
G1 X70.95 Y110.29 E.09818
G1 X74.29 Y106.95 E.15667
G1 X78.246 Y106.95 E.13124
G1 X79.05 Y107.754 E.03768
G1 X79.05 Y109.867 E.0701
G1 X70.95 Y117.966 E.37996
G1 X70.95 Y115.006 E.09818
G1 X79.05 Y123.105 E.37996
G1 X79.05 Y125.219 E.0701
G1 X73.219 Y131.05 E.27355
G1 X71.642 Y131.05 E.0523
G1 X70.95 Y130.358 E.03244
G1 X70.95 Y128.73 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X70.95 Y130.358 E-.61876
G1 X71.213 Y130.621 E-.14124
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
G3 Z8.2 I.261 J1.189 P1  F30000
G1 X180.602 Y106.602 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3867
G1 X189.398 Y106.602 E.29177
G1 X189.398 Y131.398 E.82252
G1 X180.602 Y131.398 E.29177
G1 X180.602 Y106.662 E.82053
G1 X180.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3867
G1 X189.79 Y106.21 E.29437
G1 X189.79 Y131.79 E.786
G1 X180.21 Y131.79 E.29437
G1 X180.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.164 J.354 P1  F30000
G1 X189.05 Y128.73 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3867
G1 X189.05 Y130.358 E.05401
G1 X188.358 Y131.05 E.03244
G1 X186.781 Y131.05 E.0523
G1 X180.95 Y125.219 E.27355
G1 X180.95 Y123.105 E.0701
G1 X189.05 Y115.006 E.37996
G1 X189.05 Y117.966 E.09818
G1 X180.95 Y109.867 E.37996
G1 X180.95 Y107.754 E.0701
G1 X181.754 Y106.95 E.03768
G1 X185.71 Y106.95 E.13124
G1 X189.05 Y110.29 E.15667
G1 X189.05 Y107.33 E.09818
G1 X180.95 Y115.43 E.37996
G1 X180.95 Y117.543 E.0701
G1 X189.05 Y125.642 E.37996
G1 X189.05 Y122.682 E.09818
G1 X180.95 Y130.781 E.37996
G1 X180.95 Y131.05 E.0089
G1 X182.31 Y131.05 E.04512
; WIPE_START
G1 F24000
G1 X180.95 Y131.05 E-.51683
G1 X180.95 Y130.781 E-.10193
G1 X181.213 Y130.519 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-.011 J-1.217 P1  F30000
G1 X79.398 Y131.398 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3867
G1 X70.602 Y131.398 E.29177
G1 X70.602 Y106.602 E.82252
G1 X79.398 Y106.602 E.29177
G1 X79.398 Y131.338 E.82053
G1 X79.79 Y131.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3867
G1 X70.21 Y131.79 E.29437
G1 X70.21 Y106.21 E.786
G1 X79.79 Y106.21 E.29437
G1 X79.79 Y131.73 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I1.204 J-.175 P1  F30000
G1 X77.69 Y131.05 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3867
G1 X79.05 Y131.05 E.04512
G1 X79.05 Y130.781 E.0089
G1 X70.95 Y122.682 E.37996
G1 X70.95 Y125.642 E.09818
G1 X79.05 Y117.543 E.37996
G1 X79.05 Y115.429 E.0701
G1 X70.95 Y107.33 E.37996
G1 X70.95 Y110.29 E.09818
G1 X74.29 Y106.95 E.15667
G1 X78.246 Y106.95 E.13124
G1 X79.05 Y107.754 E.03768
G1 X79.05 Y109.867 E.0701
G1 X70.95 Y117.966 E.37996
G1 X70.95 Y115.006 E.09818
G1 X79.05 Y123.105 E.37996
G1 X79.05 Y125.219 E.0701
G1 X73.219 Y131.05 E.27355
G1 X71.642 Y131.05 E.0523
G1 X70.95 Y130.358 E.03244
G1 X70.95 Y128.73 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X70.95 Y130.358 E-.61876
G1 X71.213 Y130.621 E-.14124
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
G3 Z8.4 I.261 J1.189 P1  F30000
G1 X180.602 Y106.602 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3867
G1 X189.398 Y106.602 E.29177
G1 X189.398 Y131.398 E.82252
G1 X180.602 Y131.398 E.29177
G1 X180.602 Y106.662 E.82053
G1 X180.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3867
G1 X189.79 Y106.21 E.29437
G1 X189.79 Y131.79 E.786
G1 X180.21 Y131.79 E.29437
G1 X180.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.164 J.354 P1  F30000
G1 X189.05 Y128.73 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3867
G1 X189.05 Y130.358 E.05401
G1 X188.358 Y131.05 E.03244
G1 X186.781 Y131.05 E.0523
G1 X180.95 Y125.219 E.27355
G1 X180.95 Y123.105 E.0701
G1 X189.05 Y115.006 E.37996
G1 X189.05 Y117.966 E.09818
G1 X180.95 Y109.867 E.37996
G1 X180.95 Y107.754 E.0701
G1 X181.754 Y106.95 E.03768
G1 X185.71 Y106.95 E.13124
G1 X189.05 Y110.29 E.15667
G1 X189.05 Y107.33 E.09818
G1 X180.95 Y115.43 E.37996
G1 X180.95 Y117.543 E.0701
G1 X189.05 Y125.642 E.37996
G1 X189.05 Y122.682 E.09818
G1 X180.95 Y130.781 E.37996
M73 P75 R10
G1 X180.95 Y131.05 E.0089
G1 X182.31 Y131.05 E.04512
; WIPE_START
G1 F24000
G1 X180.95 Y131.05 E-.51683
G1 X180.95 Y130.781 E-.10193
G1 X181.213 Y130.519 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-.011 J-1.217 P1  F30000
G1 X79.398 Y131.398 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3867
G1 X70.602 Y131.398 E.29177
G1 X70.602 Y106.602 E.82252
G1 X79.398 Y106.602 E.29177
G1 X79.398 Y131.338 E.82053
G1 X79.79 Y131.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3867
G1 X70.21 Y131.79 E.29437
G1 X70.21 Y106.21 E.786
G1 X79.79 Y106.21 E.29437
G1 X79.79 Y131.73 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I1.204 J-.175 P1  F30000
G1 X77.69 Y131.05 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3867
G1 X79.05 Y131.05 E.04512
G1 X79.05 Y130.781 E.0089
G1 X70.95 Y122.682 E.37996
G1 X70.95 Y125.642 E.09818
G1 X79.05 Y117.543 E.37996
G1 X79.05 Y115.429 E.0701
G1 X70.95 Y107.33 E.37996
G1 X70.95 Y110.29 E.09818
G1 X74.29 Y106.95 E.15667
G1 X78.246 Y106.95 E.13124
G1 X79.05 Y107.754 E.03768
G1 X79.05 Y109.867 E.0701
G1 X70.95 Y117.966 E.37996
G1 X70.95 Y115.006 E.09818
G1 X79.05 Y123.105 E.37996
G1 X79.05 Y125.219 E.0701
G1 X73.219 Y131.05 E.27355
G1 X71.642 Y131.05 E.0523
G1 X70.95 Y130.358 E.03244
G1 X70.95 Y128.73 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X70.95 Y130.358 E-.61876
G1 X71.213 Y130.621 E-.14124
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
G3 Z8.6 I.261 J1.189 P1  F30000
G1 X180.602 Y106.602 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3867
G1 X189.398 Y106.602 E.29177
G1 X189.398 Y131.398 E.82252
G1 X180.602 Y131.398 E.29177
G1 X180.602 Y106.662 E.82053
G1 X180.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3867
G1 X189.79 Y106.21 E.29437
G1 X189.79 Y131.79 E.786
G1 X180.21 Y131.79 E.29437
G1 X180.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-1.164 J.354 P1  F30000
G1 X189.05 Y128.73 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3867
G1 X189.05 Y130.358 E.05401
G1 X188.358 Y131.05 E.03244
G1 X186.781 Y131.05 E.0523
G1 X180.95 Y125.219 E.27355
G1 X180.95 Y123.105 E.0701
G1 X189.05 Y115.006 E.37996
G1 X189.05 Y117.966 E.09818
G1 X180.95 Y109.867 E.37996
G1 X180.95 Y107.754 E.0701
G1 X181.754 Y106.95 E.03768
G1 X185.71 Y106.95 E.13124
G1 X189.05 Y110.29 E.15667
G1 X189.05 Y107.33 E.09818
G1 X180.95 Y115.43 E.37996
G1 X180.95 Y117.543 E.0701
G1 X189.05 Y125.642 E.37996
G1 X189.05 Y122.682 E.09818
G1 X180.95 Y130.781 E.37996
G1 X180.95 Y131.05 E.0089
G1 X182.31 Y131.05 E.04512
; WIPE_START
G1 F24000
G1 X180.95 Y131.05 E-.51683
G1 X180.95 Y130.781 E-.10193
G1 X181.213 Y130.519 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-.011 J-1.217 P1  F30000
G1 X79.398 Y131.398 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3867
G1 X70.602 Y131.398 E.29177
G1 X70.602 Y106.602 E.82252
G1 X79.398 Y106.602 E.29177
G1 X79.398 Y131.338 E.82053
G1 X79.79 Y131.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3867
G1 X70.21 Y131.79 E.29437
G1 X70.21 Y106.21 E.786
G1 X79.79 Y106.21 E.29437
G1 X79.79 Y131.73 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I1.204 J-.175 P1  F30000
G1 X77.69 Y131.05 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3867
G1 X79.05 Y131.05 E.04512
G1 X79.05 Y130.781 E.0089
G1 X70.95 Y122.682 E.37996
G1 X70.95 Y125.642 E.09818
G1 X79.05 Y117.543 E.37996
G1 X79.05 Y115.429 E.0701
G1 X70.95 Y107.33 E.37996
G1 X70.95 Y110.29 E.09818
G1 X74.29 Y106.95 E.15667
G1 X78.246 Y106.95 E.13124
G1 X79.05 Y107.754 E.03768
G1 X79.05 Y109.867 E.0701
G1 X70.95 Y117.966 E.37996
G1 X70.95 Y115.006 E.09818
G1 X79.05 Y123.105 E.37996
G1 X79.05 Y125.219 E.0701
G1 X73.219 Y131.05 E.27355
G1 X71.642 Y131.05 E.0523
G1 X70.95 Y130.358 E.03244
G1 X70.95 Y128.73 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X70.95 Y130.358 E-.61876
G1 X71.213 Y130.621 E-.14124
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
G3 Z8.8 I.261 J1.189 P1  F30000
G1 X180.602 Y106.602 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3867
G1 X189.398 Y106.602 E.29177
G1 X189.398 Y131.398 E.82252
G1 X180.602 Y131.398 E.29177
G1 X180.602 Y106.662 E.82053
G1 X180.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3867
G1 X189.79 Y106.21 E.29437
G1 X189.79 Y131.79 E.786
G1 X180.21 Y131.79 E.29437
G1 X180.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.164 J.354 P1  F30000
G1 X189.05 Y128.73 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3867
G1 X189.05 Y130.358 E.05401
G1 X188.358 Y131.05 E.03244
G1 X186.781 Y131.05 E.0523
G1 X180.95 Y125.219 E.27355
G1 X180.95 Y123.105 E.0701
G1 X189.05 Y115.006 E.37996
G1 X189.05 Y117.966 E.09818
G1 X180.95 Y109.867 E.37996
G1 X180.95 Y107.754 E.0701
G1 X181.754 Y106.95 E.03768
G1 X185.71 Y106.95 E.13124
G1 X189.05 Y110.29 E.15667
G1 X189.05 Y107.33 E.09818
G1 X180.95 Y115.43 E.37996
G1 X180.95 Y117.543 E.0701
G1 X189.05 Y125.642 E.37996
G1 X189.05 Y122.682 E.09818
G1 X180.95 Y130.781 E.37996
G1 X180.95 Y131.05 E.0089
G1 X182.31 Y131.05 E.04512
; WIPE_START
G1 F24000
G1 X180.95 Y131.05 E-.51683
G1 X180.95 Y130.781 E-.10193
G1 X181.213 Y130.519 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-.011 J-1.217 P1  F30000
G1 X79.398 Y131.398 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3867
G1 X70.602 Y131.398 E.29177
G1 X70.602 Y106.602 E.82252
G1 X79.398 Y106.602 E.29177
G1 X79.398 Y131.338 E.82053
G1 X79.79 Y131.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3867
G1 X70.21 Y131.79 E.29437
G1 X70.21 Y106.21 E.786
G1 X79.79 Y106.21 E.29437
G1 X79.79 Y131.73 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I1.204 J-.175 P1  F30000
G1 X77.69 Y131.05 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3867
G1 X79.05 Y131.05 E.04512
G1 X79.05 Y130.781 E.0089
G1 X70.95 Y122.682 E.37996
G1 X70.95 Y125.642 E.09818
G1 X79.05 Y117.543 E.37996
G1 X79.05 Y115.429 E.0701
G1 X70.95 Y107.33 E.37996
G1 X70.95 Y110.29 E.09818
G1 X74.29 Y106.95 E.15667
G1 X78.246 Y106.95 E.13124
G1 X79.05 Y107.754 E.03768
G1 X79.05 Y109.867 E.0701
G1 X70.95 Y117.966 E.37996
G1 X70.95 Y115.006 E.09818
G1 X79.05 Y123.105 E.37996
G1 X79.05 Y125.219 E.0701
G1 X73.219 Y131.05 E.27355
G1 X71.642 Y131.05 E.0523
G1 X70.95 Y130.358 E.03244
G1 X70.95 Y128.73 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X70.95 Y130.358 E-.61876
G1 X71.213 Y130.621 E-.14124
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
G3 Z9 I.261 J1.189 P1  F30000
G1 X180.602 Y106.602 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3867
G1 X189.398 Y106.602 E.29177
G1 X189.398 Y131.398 E.82252
G1 X180.602 Y131.398 E.29177
G1 X180.602 Y106.662 E.82053
G1 X180.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3867
G1 X189.79 Y106.21 E.29437
G1 X189.79 Y131.79 E.786
G1 X180.21 Y131.79 E.29437
G1 X180.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-1.164 J.354 P1  F30000
G1 X189.05 Y128.73 Z9.2
M73 P76 R10
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3867
G1 X189.05 Y130.358 E.05401
G1 X188.358 Y131.05 E.03244
G1 X186.781 Y131.05 E.0523
G1 X180.95 Y125.219 E.27355
G1 X180.95 Y123.105 E.0701
G1 X189.05 Y115.006 E.37996
G1 X189.05 Y117.966 E.09818
G1 X180.95 Y109.867 E.37996
G1 X180.95 Y107.754 E.0701
G1 X181.754 Y106.95 E.03768
G1 X185.71 Y106.95 E.13124
G1 X189.05 Y110.29 E.15667
G1 X189.05 Y107.33 E.09818
G1 X180.95 Y115.43 E.37996
G1 X180.95 Y117.543 E.0701
G1 X189.05 Y125.642 E.37996
G1 X189.05 Y122.682 E.09818
G1 X180.95 Y130.781 E.37996
G1 X180.95 Y131.05 E.0089
G1 X182.31 Y131.05 E.04512
; WIPE_START
G1 F24000
G1 X180.95 Y131.05 E-.51683
G1 X180.95 Y130.781 E-.10193
G1 X181.213 Y130.519 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-.011 J-1.217 P1  F30000
G1 X79.398 Y131.398 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3867
G1 X70.602 Y131.398 E.29177
G1 X70.602 Y106.602 E.82252
G1 X79.398 Y106.602 E.29177
G1 X79.398 Y131.338 E.82053
G1 X79.79 Y131.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3867
G1 X70.21 Y131.79 E.29437
G1 X70.21 Y106.21 E.786
G1 X79.79 Y106.21 E.29437
G1 X79.79 Y131.73 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I1.204 J-.175 P1  F30000
G1 X77.69 Y131.05 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3867
G1 X79.05 Y131.05 E.04512
G1 X79.05 Y130.781 E.0089
G1 X70.95 Y122.682 E.37996
G1 X70.95 Y125.642 E.09818
G1 X79.05 Y117.543 E.37996
G1 X79.05 Y115.429 E.0701
G1 X70.95 Y107.33 E.37996
G1 X70.95 Y110.29 E.09818
G1 X74.29 Y106.95 E.15667
G1 X78.246 Y106.95 E.13124
G1 X79.05 Y107.754 E.03768
G1 X79.05 Y109.867 E.0701
G1 X70.95 Y117.966 E.37996
G1 X70.95 Y115.006 E.09818
G1 X79.05 Y123.105 E.37996
G1 X79.05 Y125.219 E.0701
G1 X73.219 Y131.05 E.27355
G1 X71.642 Y131.05 E.0523
G1 X70.95 Y130.358 E.03244
G1 X70.95 Y128.73 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X70.95 Y130.358 E-.61876
G1 X71.213 Y130.621 E-.14124
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
G3 Z9.2 I.261 J1.189 P1  F30000
G1 X180.602 Y106.602 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3867
G1 X189.398 Y106.602 E.29177
G1 X189.398 Y131.398 E.82252
G1 X180.602 Y131.398 E.29177
G1 X180.602 Y106.662 E.82053
G1 X180.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3867
G1 X189.79 Y106.21 E.29437
G1 X189.79 Y131.79 E.786
G1 X180.21 Y131.79 E.29437
G1 X180.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.164 J.354 P1  F30000
G1 X189.05 Y128.73 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3867
M73 P76 R9
G1 X189.05 Y130.358 E.05401
G1 X188.358 Y131.05 E.03244
G1 X186.781 Y131.05 E.0523
G1 X180.95 Y125.219 E.27355
G1 X180.95 Y123.105 E.0701
G1 X189.05 Y115.006 E.37996
G1 X189.05 Y117.966 E.09818
G1 X180.95 Y109.867 E.37996
G1 X180.95 Y107.754 E.0701
G1 X181.754 Y106.95 E.03768
G1 X185.71 Y106.95 E.13124
G1 X189.05 Y110.29 E.15667
G1 X189.05 Y107.33 E.09818
G1 X180.95 Y115.43 E.37996
G1 X180.95 Y117.543 E.0701
G1 X189.05 Y125.642 E.37996
G1 X189.05 Y122.682 E.09818
G1 X180.95 Y130.781 E.37996
G1 X180.95 Y131.05 E.0089
G1 X182.31 Y131.05 E.04512
; WIPE_START
G1 F24000
G1 X180.95 Y131.05 E-.51683
G1 X180.95 Y130.781 E-.10193
G1 X181.213 Y130.519 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.011 J-1.217 P1  F30000
G1 X79.398 Y131.398 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3867
G1 X70.602 Y131.398 E.29177
G1 X70.602 Y106.602 E.82252
G1 X79.398 Y106.602 E.29177
G1 X79.398 Y131.338 E.82053
G1 X79.79 Y131.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3867
G1 X70.21 Y131.79 E.29437
G1 X70.21 Y106.21 E.786
G1 X79.79 Y106.21 E.29437
G1 X79.79 Y131.73 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.204 J-.175 P1  F30000
G1 X77.69 Y131.05 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3867
G1 X79.05 Y131.05 E.04512
G1 X79.05 Y130.781 E.0089
G1 X70.95 Y122.682 E.37996
G1 X70.95 Y125.642 E.09818
G1 X79.05 Y117.543 E.37996
G1 X79.05 Y115.429 E.0701
G1 X70.95 Y107.33 E.37996
G1 X70.95 Y110.29 E.09818
G1 X74.29 Y106.95 E.15667
G1 X78.246 Y106.95 E.13124
G1 X79.05 Y107.754 E.03768
G1 X79.05 Y109.867 E.0701
G1 X70.95 Y117.966 E.37996
G1 X70.95 Y115.006 E.09818
G1 X79.05 Y123.105 E.37996
G1 X79.05 Y125.219 E.0701
G1 X73.219 Y131.05 E.27355
G1 X71.642 Y131.05 E.0523
G1 X70.95 Y130.358 E.03244
G1 X70.95 Y128.73 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X70.95 Y130.358 E-.61876
G1 X71.213 Y130.621 E-.14124
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
G3 Z9.4 I.261 J1.189 P1  F30000
G1 X180.602 Y106.602 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3867
G1 X189.398 Y106.602 E.29177
G1 X189.398 Y131.398 E.82252
G1 X180.602 Y131.398 E.29177
G1 X180.602 Y106.662 E.82053
G1 X180.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3867
G1 X189.79 Y106.21 E.29437
G1 X189.79 Y131.79 E.786
G1 X180.21 Y131.79 E.29437
G1 X180.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-1.164 J.354 P1  F30000
G1 X189.05 Y128.73 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3867
G1 X189.05 Y130.358 E.05401
G1 X188.358 Y131.05 E.03244
G1 X186.781 Y131.05 E.0523
G1 X180.95 Y125.219 E.27355
G1 X180.95 Y123.105 E.0701
G1 X189.05 Y115.006 E.37996
G1 X189.05 Y117.966 E.09818
G1 X180.95 Y109.867 E.37996
G1 X180.95 Y107.754 E.0701
G1 X181.754 Y106.95 E.03768
G1 X185.71 Y106.95 E.13124
G1 X189.05 Y110.29 E.15667
G1 X189.05 Y107.33 E.09818
G1 X180.95 Y115.43 E.37996
G1 X180.95 Y117.543 E.0701
G1 X189.05 Y125.642 E.37996
G1 X189.05 Y122.682 E.09818
G1 X180.95 Y130.781 E.37996
G1 X180.95 Y131.05 E.0089
G1 X182.31 Y131.05 E.04512
; WIPE_START
G1 F24000
G1 X180.95 Y131.05 E-.51683
G1 X180.95 Y130.781 E-.10193
G1 X181.213 Y130.519 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-.011 J-1.217 P1  F30000
G1 X79.398 Y131.398 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3867
G1 X70.602 Y131.398 E.29177
G1 X70.602 Y106.602 E.82252
G1 X79.398 Y106.602 E.29177
G1 X79.398 Y131.338 E.82053
G1 X79.79 Y131.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3867
G1 X70.21 Y131.79 E.29437
G1 X70.21 Y106.21 E.786
G1 X79.79 Y106.21 E.29437
G1 X79.79 Y131.73 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I1.204 J-.175 P1  F30000
G1 X77.69 Y131.05 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3867
G1 X79.05 Y131.05 E.04512
G1 X79.05 Y130.781 E.0089
G1 X70.95 Y122.682 E.37996
G1 X70.95 Y125.642 E.09818
G1 X79.05 Y117.543 E.37996
G1 X79.05 Y115.429 E.0701
G1 X70.95 Y107.33 E.37996
G1 X70.95 Y110.29 E.09818
G1 X74.29 Y106.95 E.15667
G1 X78.246 Y106.95 E.13124
G1 X79.05 Y107.754 E.03768
G1 X79.05 Y109.867 E.0701
G1 X70.95 Y117.966 E.37996
G1 X70.95 Y115.006 E.09818
G1 X79.05 Y123.105 E.37996
G1 X79.05 Y125.219 E.0701
G1 X73.219 Y131.05 E.27355
G1 X71.642 Y131.05 E.0523
G1 X70.95 Y130.358 E.03244
G1 X70.95 Y128.73 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X70.95 Y130.358 E-.61876
G1 X71.213 Y130.621 E-.14124
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
G3 Z9.6 I.261 J1.189 P1  F30000
G1 X180.602 Y106.602 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4451
G1 X189.398 Y106.602 E.29177
G1 X189.398 Y131.398 E.82252
G1 X180.602 Y131.398 E.29177
G1 X180.602 Y106.662 E.82053
G1 X180.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4451
G1 X189.79 Y106.21 E.29437
G1 X189.79 Y131.79 E.786
G1 X180.21 Y131.79 E.29437
M73 P77 R9
G1 X180.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I-.619 J1.048 P1  F30000
G1 X183.382 Y106.95 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4451
G1 X181.754 Y106.95 E.05401
G1 X180.95 Y107.754 E.03768
G1 X180.95 Y109.867 E.0701
G1 X185.567 Y114.483 E.21655
G1 X181.897 Y114.483 E.12172
G1 X189.05 Y107.33 E.33554
G1 X189.05 Y110.29 E.09818
G1 X185.71 Y106.95 E.15667
G1 X184.082 Y106.95 E.05401
G1 X184.752 Y115.297 F30000
G1 F4451
G1 X186.381 Y115.297 E.05401
G1 X188.643 Y117.559 E.10611
G1 X188.643 Y115.413 E.07117
G1 X181.357 Y122.698 E.34176
G1 X181.357 Y117.95 E.15752
G1 X186.111 Y122.703 E.22299
G1 X187.739 Y122.703 E.05401
G1 X189.05 Y123.05 F30000
G1 F4451
G1 X189.05 Y114.89 E.27069
G1 X180.95 Y114.89 E.26867
G1 X180.95 Y123.11 E.27268
G1 X189.05 Y123.11 E.26867
G1 X180.95 Y123.59 F30000
G1 F4451
G1 X180.95 Y125.219 E.05401
G1 X186.781 Y131.05 E.27355
G1 X188.358 Y131.05 E.0523
G1 X189.05 Y130.358 E.03244
G1 X189.05 Y125.642 E.15644
G1 X186.925 Y123.517 E.09968
G1 X188.215 Y123.517 E.04278
G1 X180.95 Y130.781 E.34078
G1 X180.95 Y131.05 E.0089
G1 X182.31 Y131.05 E.04512
; WIPE_START
G1 F24000
G1 X180.95 Y131.05 E-.51683
G1 X180.95 Y130.781 E-.10193
G1 X181.213 Y130.519 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I-.011 J-1.217 P1  F30000
G1 X79.398 Y131.398 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4451
G1 X70.602 Y131.398 E.29177
G1 X70.602 Y106.602 E.82252
G1 X79.398 Y106.602 E.29177
G1 X79.398 Y131.338 E.82053
G1 X79.79 Y131.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4451
G1 X70.21 Y131.79 E.29437
G1 X70.21 Y106.21 E.786
G1 X79.79 Y106.21 E.29437
G1 X79.79 Y131.73 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I1.204 J-.175 P1  F30000
G1 X77.69 Y131.05 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4451
G1 X79.05 Y131.05 E.04512
G1 X79.05 Y130.781 E.0089
G1 X71.785 Y123.517 E.34078
G1 X73.075 Y123.517 E.04278
G1 X70.95 Y125.642 E.09968
G1 X70.95 Y130.358 E.15644
G1 X71.642 Y131.05 E.03244
G1 X73.219 Y131.05 E.0523
G1 X79.05 Y125.219 E.27355
G1 X79.05 Y123.59 E.05401
G1 X79.05 Y123.11 F30000
G1 F4451
G1 X70.95 Y123.11 E.26867
G1 X70.95 Y114.89 E.27268
G1 X79.05 Y114.89 E.26867
G1 X79.05 Y123.05 E.27069
G1 X72.261 Y122.703 F30000
G1 F4451
G1 X73.889 Y122.703 E.05401
G1 X78.643 Y117.95 E.22299
G1 X78.643 Y122.698 E.15752
G1 X71.357 Y115.413 E.34176
G1 X71.357 Y117.559 E.07118
G1 X73.619 Y115.297 E.10611
G1 X75.248 Y115.297 E.05401
G1 X76.618 Y106.95 F30000
G1 F4451
G1 X78.246 Y106.95 E.05401
G1 X79.05 Y107.754 E.03768
G1 X79.05 Y109.867 E.0701
G1 X74.433 Y114.483 E.21655
G1 X78.103 Y114.483 E.12172
G1 X70.95 Y107.33 E.33555
G1 X70.95 Y110.29 E.09818
G1 X74.29 Y106.95 E.15667
G1 X72.662 Y106.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X74.29 Y106.95 E-.61876
G1 X74.027 Y107.213 E-.14124
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
G3 Z9.8 I.007 J1.217 P1  F30000
G1 X180.602 Y106.602 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4444
G1 X189.398 Y106.602 E.29177
G1 X189.398 Y131.398 E.82252
G1 X180.602 Y131.398 E.29177
G1 X180.602 Y106.662 E.82053
G1 X180.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4444
G1 X189.79 Y106.21 E.29437
G1 X189.79 Y131.79 E.786
G1 X180.21 Y131.79 E.29437
G1 X180.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I-.619 J1.048 P1  F30000
G1 X183.382 Y106.95 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4444
G1 X181.754 Y106.95 E.05401
G1 X180.95 Y107.754 E.03768
G1 X180.95 Y109.867 E.0701
G1 X185.567 Y114.483 E.21655
G1 X181.897 Y114.483 E.12172
G1 X189.05 Y107.33 E.33554
G1 X189.05 Y110.29 E.09818
G1 X185.71 Y106.95 E.15667
G1 X184.082 Y106.95 E.05401
G1 X184.752 Y115.297 F30000
G1 F4444
G1 X186.381 Y115.297 E.05401
G1 X188.643 Y117.559 E.10611
G1 X188.643 Y115.413 E.07117
G1 X181.357 Y122.698 E.34176
G1 X181.357 Y117.95 E.15752
G1 X186.111 Y122.703 E.22299
G1 X187.739 Y122.703 E.05401
G1 X189.05 Y123.05 F30000
G1 F4444
G1 X189.05 Y114.89 E.27069
G1 X180.95 Y114.89 E.26867
G1 X180.95 Y123.11 E.27268
G1 X189.05 Y123.11 E.26867
G1 X180.95 Y123.59 F30000
G1 F4444
G1 X180.95 Y125.219 E.05401
G1 X186.781 Y131.05 E.27355
G1 X188.358 Y131.05 E.0523
G1 X189.05 Y130.358 E.03244
G1 X189.05 Y125.642 E.15644
G1 X186.925 Y123.517 E.09968
G1 X188.215 Y123.517 E.04278
G1 X180.95 Y130.781 E.34078
G1 X180.95 Y131.05 E.0089
G1 X182.31 Y131.05 E.04512
; WIPE_START
G1 F24000
G1 X180.95 Y131.05 E-.51683
G1 X180.95 Y130.781 E-.10193
G1 X181.213 Y130.519 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I-.011 J-1.217 P1  F30000
G1 X79.398 Y131.398 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4444
G1 X70.602 Y131.398 E.29177
G1 X70.602 Y106.602 E.82252
G1 X79.398 Y106.602 E.29177
G1 X79.398 Y131.338 E.82053
G1 X79.79 Y131.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4444
G1 X70.21 Y131.79 E.29437
G1 X70.21 Y106.21 E.786
G1 X79.79 Y106.21 E.29437
G1 X79.79 Y131.73 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I1.204 J-.175 P1  F30000
G1 X77.69 Y131.05 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4444
G1 X79.05 Y131.05 E.04512
G1 X79.05 Y130.781 E.0089
G1 X71.785 Y123.517 E.34078
G1 X73.075 Y123.517 E.04278
G1 X70.95 Y125.642 E.09968
G1 X70.95 Y130.358 E.15644
G1 X71.642 Y131.05 E.03244
G1 X73.219 Y131.05 E.0523
G1 X79.05 Y125.219 E.27355
G1 X79.05 Y123.59 E.05401
G1 X79.05 Y123.11 F30000
G1 F4444
G1 X70.95 Y123.11 E.26867
G1 X70.95 Y114.89 E.27268
G1 X79.05 Y114.89 E.26867
G1 X79.05 Y123.05 E.27069
G1 X72.261 Y122.703 F30000
G1 F4444
G1 X73.889 Y122.703 E.05401
G1 X78.643 Y117.95 E.22299
G1 X78.643 Y122.698 E.15752
G1 X71.357 Y115.413 E.34176
G1 X71.357 Y117.559 E.07118
G1 X73.619 Y115.297 E.10611
G1 X75.248 Y115.297 E.05401
G1 X76.618 Y106.95 F30000
G1 F4444
G1 X78.246 Y106.95 E.05401
G1 X79.05 Y107.754 E.03768
G1 X79.05 Y109.867 E.0701
G1 X74.433 Y114.483 E.21655
G1 X78.103 Y114.483 E.12172
G1 X70.95 Y107.33 E.33555
G1 X70.95 Y110.29 E.09818
G1 X74.29 Y106.95 E.15667
G1 X72.662 Y106.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X74.29 Y106.95 E-.61876
G1 X74.027 Y107.213 E-.14124
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
G3 Z10 I.007 J1.217 P1  F30000
G1 X180.602 Y106.602 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4444
G1 X189.398 Y106.602 E.29177
G1 X189.398 Y131.398 E.82252
G1 X180.602 Y131.398 E.29177
G1 X180.602 Y106.662 E.82053
G1 X180.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4444
G1 X189.79 Y106.21 E.29437
G1 X189.79 Y131.79 E.786
G1 X180.21 Y131.79 E.29437
G1 X180.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-.619 J1.048 P1  F30000
G1 X183.382 Y106.95 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4444
G1 X181.754 Y106.95 E.05401
G1 X180.95 Y107.754 E.03768
G1 X180.95 Y109.867 E.0701
G1 X185.567 Y114.483 E.21655
G1 X181.897 Y114.483 E.12172
G1 X189.05 Y107.33 E.33554
G1 X189.05 Y110.29 E.09818
G1 X185.71 Y106.95 E.15667
G1 X184.082 Y106.95 E.05401
G1 X184.752 Y115.297 F30000
G1 F4444
G1 X186.381 Y115.297 E.05401
G1 X188.643 Y117.559 E.10611
G1 X188.643 Y115.413 E.07117
G1 X181.357 Y122.698 E.34176
G1 X181.357 Y117.95 E.15752
G1 X186.111 Y122.703 E.22299
G1 X187.739 Y122.703 E.05401
G1 X189.05 Y123.05 F30000
G1 F4444
G1 X189.05 Y114.89 E.27069
G1 X180.95 Y114.89 E.26867
G1 X180.95 Y123.11 E.27268
G1 X189.05 Y123.11 E.26867
G1 X180.95 Y123.59 F30000
G1 F4444
G1 X180.95 Y125.219 E.05401
G1 X186.781 Y131.05 E.27355
G1 X188.358 Y131.05 E.0523
G1 X189.05 Y130.358 E.03244
G1 X189.05 Y125.642 E.15644
G1 X186.925 Y123.517 E.09968
G1 X188.215 Y123.517 E.04278
G1 X180.95 Y130.781 E.34078
G1 X180.95 Y131.05 E.0089
G1 X182.31 Y131.05 E.04512
; WIPE_START
G1 F24000
G1 X180.95 Y131.05 E-.51683
G1 X180.95 Y130.781 E-.10193
G1 X181.213 Y130.519 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-.011 J-1.217 P1  F30000
G1 X79.398 Y131.398 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4444
G1 X70.602 Y131.398 E.29177
G1 X70.602 Y106.602 E.82252
G1 X79.398 Y106.602 E.29177
G1 X79.398 Y131.338 E.82053
G1 X79.79 Y131.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4444
G1 X70.21 Y131.79 E.29437
G1 X70.21 Y106.21 E.786
G1 X79.79 Y106.21 E.29437
G1 X79.79 Y131.73 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I1.204 J-.175 P1  F30000
G1 X77.69 Y131.05 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4444
G1 X79.05 Y131.05 E.04512
G1 X79.05 Y130.781 E.0089
G1 X71.785 Y123.517 E.34078
G1 X73.075 Y123.517 E.04278
G1 X70.95 Y125.642 E.09968
G1 X70.95 Y130.358 E.15644
G1 X71.642 Y131.05 E.03244
G1 X73.219 Y131.05 E.0523
G1 X79.05 Y125.219 E.27355
M73 P78 R9
G1 X79.05 Y123.59 E.05401
G1 X79.05 Y123.11 F30000
G1 F4444
G1 X70.95 Y123.11 E.26867
G1 X70.95 Y114.89 E.27268
G1 X79.05 Y114.89 E.26867
G1 X79.05 Y123.05 E.27069
G1 X72.261 Y122.703 F30000
G1 F4444
G1 X73.889 Y122.703 E.05401
G1 X78.643 Y117.95 E.22299
G1 X78.643 Y122.698 E.15752
G1 X71.357 Y115.413 E.34176
G1 X71.357 Y117.559 E.07118
G1 X73.619 Y115.297 E.10611
G1 X75.248 Y115.297 E.05401
G1 X76.618 Y106.95 F30000
G1 F4444
G1 X78.246 Y106.95 E.05401
G1 X79.05 Y107.754 E.03768
G1 X79.05 Y109.867 E.0701
G1 X74.433 Y114.483 E.21655
G1 X78.103 Y114.483 E.12172
G1 X70.95 Y107.33 E.33555
G1 X70.95 Y110.29 E.09818
G1 X74.29 Y106.95 E.15667
G1 X72.662 Y106.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X74.29 Y106.95 E-.61876
G1 X74.027 Y107.213 E-.14124
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
G3 Z10.2 I.007 J1.217 P1  F30000
G1 X180.602 Y106.602 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4444
G1 X189.398 Y106.602 E.29177
G1 X189.398 Y131.398 E.82252
G1 X180.602 Y131.398 E.29177
G1 X180.602 Y106.662 E.82053
G1 X180.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4444
G1 X189.79 Y106.21 E.29437
G1 X189.79 Y131.79 E.786
G1 X180.21 Y131.79 E.29437
G1 X180.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I-.619 J1.048 P1  F30000
G1 X183.382 Y106.95 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4444
G1 X181.754 Y106.95 E.05401
G1 X180.95 Y107.754 E.03768
G1 X180.95 Y109.867 E.0701
G1 X185.567 Y114.483 E.21655
G1 X181.897 Y114.483 E.12172
G1 X189.05 Y107.33 E.33554
G1 X189.05 Y110.29 E.09818
G1 X185.71 Y106.95 E.15667
G1 X184.082 Y106.95 E.05401
G1 X184.752 Y115.297 F30000
G1 F4444
G1 X186.381 Y115.297 E.05401
G1 X188.643 Y117.559 E.10611
G1 X188.643 Y115.413 E.07117
G1 X181.357 Y122.698 E.34176
G1 X181.357 Y117.95 E.15752
G1 X186.111 Y122.703 E.22299
G1 X187.739 Y122.703 E.05401
G1 X189.05 Y123.05 F30000
G1 F4444
G1 X189.05 Y114.89 E.27069
G1 X180.95 Y114.89 E.26867
G1 X180.95 Y123.11 E.27268
G1 X189.05 Y123.11 E.26867
G1 X180.95 Y123.59 F30000
G1 F4444
G1 X180.95 Y125.219 E.05401
G1 X186.781 Y131.05 E.27355
G1 X188.358 Y131.05 E.0523
G1 X189.05 Y130.358 E.03244
G1 X189.05 Y125.642 E.15644
G1 X186.925 Y123.517 E.09968
G1 X188.215 Y123.517 E.04278
G1 X180.95 Y130.781 E.34078
G1 X180.95 Y131.05 E.0089
G1 X182.31 Y131.05 E.04512
; WIPE_START
G1 F24000
G1 X180.95 Y131.05 E-.51683
G1 X180.95 Y130.781 E-.10193
G1 X181.213 Y130.519 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I-.011 J-1.217 P1  F30000
G1 X79.398 Y131.398 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4444
G1 X70.602 Y131.398 E.29177
G1 X70.602 Y106.602 E.82252
G1 X79.398 Y106.602 E.29177
G1 X79.398 Y131.338 E.82053
G1 X79.79 Y131.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4444
G1 X70.21 Y131.79 E.29437
G1 X70.21 Y106.21 E.786
G1 X79.79 Y106.21 E.29437
G1 X79.79 Y131.73 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I1.204 J-.175 P1  F30000
G1 X77.69 Y131.05 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4444
G1 X79.05 Y131.05 E.04512
G1 X79.05 Y130.781 E.0089
G1 X71.785 Y123.517 E.34078
G1 X73.075 Y123.517 E.04278
G1 X70.95 Y125.642 E.09968
G1 X70.95 Y130.358 E.15644
G1 X71.642 Y131.05 E.03244
G1 X73.219 Y131.05 E.0523
G1 X79.05 Y125.219 E.27355
G1 X79.05 Y123.59 E.05401
G1 X79.05 Y123.11 F30000
G1 F4444
G1 X70.95 Y123.11 E.26867
G1 X70.95 Y114.89 E.27268
G1 X79.05 Y114.89 E.26867
G1 X79.05 Y123.05 E.27069
G1 X72.261 Y122.703 F30000
G1 F4444
G1 X73.889 Y122.703 E.05401
G1 X78.643 Y117.95 E.22299
G1 X78.643 Y122.698 E.15752
G1 X71.357 Y115.413 E.34176
G1 X71.357 Y117.559 E.07118
G1 X73.619 Y115.297 E.10611
G1 X75.248 Y115.297 E.05401
G1 X76.618 Y106.95 F30000
G1 F4444
G1 X78.246 Y106.95 E.05401
G1 X79.05 Y107.754 E.03768
G1 X79.05 Y109.867 E.0701
G1 X74.433 Y114.483 E.21655
G1 X78.103 Y114.483 E.12172
G1 X70.95 Y107.33 E.33555
G1 X70.95 Y110.29 E.09818
G1 X74.29 Y106.95 E.15667
G1 X72.662 Y106.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X74.29 Y106.95 E-.61876
G1 X74.027 Y107.213 E-.14124
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
G3 Z10.4 I.007 J1.217 P1  F30000
G1 X180.602 Y106.602 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X189.398 Y106.602 E.29177
G1 X189.398 Y131.398 E.82252
G1 X180.602 Y131.398 E.29177
G1 X180.602 Y106.662 E.82053
G1 X180.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X189.79 Y106.21 E.29437
G1 X189.79 Y131.79 E.786
G1 X180.21 Y131.79 E.29437
G1 X180.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I-.619 J1.048 P1  F30000
G1 X183.382 Y106.95 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X181.754 Y106.95 E.05401
G1 X180.95 Y107.754 E.03768
G1 X180.95 Y109.867 E.0701
G1 X185.566 Y114.483 E.21655
G1 X181.897 Y114.483 E.12172
G1 X189.05 Y107.33 E.33554
G1 X189.05 Y110.29 E.09818
G1 X185.71 Y106.95 E.15667
G1 X184.082 Y106.95 E.05401
G1 X189.231 Y114.913 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40407
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X180.972 Y114.913 E.4315
G1 X180.972 Y115.367 E.02372
G1 X189.028 Y115.367 E.42092
G1 X189.028 Y115.822 E.02372
G1 X180.972 Y115.822 E.42092
G1 X180.972 Y116.276 E.02372
G1 X189.028 Y116.276 E.42092
G1 X189.028 Y116.73 E.02372
G1 X180.972 Y116.73 E.42092
G1 X180.972 Y117.184 E.02372
G1 X189.028 Y117.184 E.42092
G1 X189.028 Y117.638 E.02372
G1 X180.972 Y117.638 E.42092
G1 X180.972 Y118.092 E.02372
G1 X189.028 Y118.092 E.42092
G1 X189.028 Y118.546 E.02372
G1 X180.972 Y118.546 E.42092
G1 X180.972 Y119 E.02372
G1 X189.028 Y119 E.42092
G1 X189.028 Y119.454 E.02372
G1 X180.972 Y119.454 E.42092
G1 X180.972 Y119.908 E.02372
G1 X189.028 Y119.908 E.42092
G1 X189.028 Y120.362 E.02372
G1 X180.972 Y120.362 E.42092
G1 X180.972 Y120.816 E.02372
G1 X189.028 Y120.816 E.42092
G1 X189.028 Y121.27 E.02372
G1 X180.972 Y121.27 E.42092
G1 X180.972 Y121.724 E.02372
G1 X189.028 Y121.724 E.42092
G1 X189.028 Y122.179 E.02372
G1 X180.972 Y122.179 E.42092
G1 X180.972 Y122.633 E.02372
G1 X189.028 Y122.633 E.42092
G1 X189.028 Y123.087 E.02372
G1 X180.769 Y123.087 E.4315
M106 S252.45
G1 X180.95 Y123.59 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X180.95 Y125.219 E.05401
G1 X186.781 Y131.05 E.27355
G1 X188.358 Y131.05 E.0523
G1 X189.05 Y130.358 E.03244
G1 X189.05 Y125.642 E.15644
G1 X186.925 Y123.517 E.09967
G1 X188.215 Y123.517 E.04278
G1 X180.95 Y130.781 E.34078
G1 X180.95 Y131.05 E.0089
G1 X182.31 Y131.05 E.04512
; WIPE_START
G1 F24000
G1 X180.95 Y131.05 E-.51683
G1 X180.95 Y130.781 E-.10193
G1 X181.213 Y130.519 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I-.011 J-1.217 P1  F30000
G1 X79.398 Y131.398 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X70.602 Y131.398 E.29177
G1 X70.602 Y106.602 E.82252
G1 X79.398 Y106.602 E.29177
G1 X79.398 Y131.338 E.82053
G1 X79.79 Y131.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X70.21 Y131.79 E.29437
G1 X70.21 Y106.21 E.786
G1 X79.79 Y106.21 E.29437
G1 X79.79 Y131.73 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.743 E-.76
; WIPE_END
M73 P78 R8
G1 E-.04 F1800
G17
G3 Z10.6 I1.204 J-.175 P1  F30000
G1 X77.69 Y131.05 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X79.05 Y131.05 E.04512
G1 X79.05 Y130.781 E.0089
G1 X71.785 Y123.517 E.34078
G1 X73.075 Y123.517 E.04278
G1 X70.95 Y125.642 E.09967
G1 X70.95 Y130.358 E.15644
G1 X71.642 Y131.05 E.03244
G1 X73.219 Y131.05 E.0523
G1 X79.05 Y125.219 E.27355
G1 X79.05 Y123.59 E.05401
G1 X70.769 Y123.087 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40407
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X79.028 Y123.087 E.4315
G1 X79.028 Y122.633 E.02372
G1 X70.972 Y122.633 E.42092
G1 X70.972 Y122.179 E.02372
G1 X79.028 Y122.179 E.42092
G1 X79.028 Y121.724 E.02372
G1 X70.972 Y121.724 E.42092
G1 X70.972 Y121.27 E.02372
G1 X79.028 Y121.27 E.42092
G1 X79.028 Y120.816 E.02372
G1 X70.972 Y120.816 E.42092
G1 X70.972 Y120.362 E.02372
G1 X79.028 Y120.362 E.42092
G1 X79.028 Y119.908 E.02372
G1 X70.972 Y119.908 E.42092
G1 X70.972 Y119.454 E.02372
G1 X79.028 Y119.454 E.42092
G1 X79.028 Y119 E.02372
G1 X70.972 Y119 E.42092
G1 X70.972 Y118.546 E.02372
G1 X79.028 Y118.546 E.42092
G1 X79.028 Y118.092 E.02372
G1 X70.972 Y118.092 E.42092
G1 X70.972 Y117.638 E.02372
G1 X79.028 Y117.638 E.42092
G1 X79.028 Y117.184 E.02372
G1 X70.972 Y117.184 E.42092
G1 X70.972 Y116.73 E.02372
G1 X79.028 Y116.73 E.42092
G1 X79.028 Y116.276 E.02372
G1 X70.972 Y116.276 E.42092
G1 X70.972 Y115.822 E.02372
G1 X79.028 Y115.822 E.42092
G1 X79.028 Y115.367 E.02372
G1 X70.972 Y115.367 E.42092
G1 X70.972 Y114.913 E.02372
G1 X79.231 Y114.913 E.4315
M106 S252.45
G1 X76.618 Y106.95 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X78.246 Y106.95 E.05401
G1 X79.05 Y107.754 E.03768
G1 X79.05 Y109.867 E.0701
G1 X74.433 Y114.483 E.21655
G1 X78.103 Y114.483 E.12172
G1 X70.95 Y107.33 E.33554
G1 X70.95 Y110.29 E.09818
G1 X74.29 Y106.95 E.15667
G1 X72.662 Y106.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X74.29 Y106.95 E-.61876
G1 X74.027 Y107.213 E-.14124
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
G3 Z10.6 I.007 J1.217 P1  F30000
G1 X180.602 Y106.602 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6486
G1 X189.398 Y106.602 E.29177
G1 X189.398 Y131.398 E.82252
G1 X180.602 Y131.398 E.29177
G1 X180.602 Y106.662 E.82053
G1 X180.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6486
G1 X189.79 Y106.21 E.29437
G1 X189.79 Y131.79 E.786
G1 X180.21 Y131.79 E.29437
G1 X180.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I-.619 J1.048 P1  F30000
G1 X183.382 Y106.95 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6486
G1 X181.754 Y106.95 E.05401
G1 X180.95 Y107.754 E.03768
G1 X180.95 Y109.867 E.0701
G1 X185.566 Y114.483 E.21655
G1 X181.897 Y114.483 E.12172
G1 X189.05 Y107.33 E.33554
G1 X189.05 Y110.29 E.09818
G1 X185.71 Y106.95 E.15667
G1 X184.082 Y106.95 E.05401
G1 X181.617 Y114.705 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.430693
G1 F6486
G1 X180.935 Y115.387 E.03047
M73 P79 R8
G1 X180.935 Y115.935 E.01733
G1 X181.996 Y114.875 E.0474
G1 X182.544 Y114.875 E.01733
G1 X180.935 Y116.484 E.0719
G1 X180.935 Y117.032 E.01733
G1 X183.093 Y114.875 E.09641
G1 X183.641 Y114.875 E.01733
G1 X180.935 Y117.581 E.12091
G1 X180.935 Y118.129 E.01733
G1 X184.19 Y114.875 E.14542
G1 X184.738 Y114.875 E.01733
G1 X180.935 Y118.677 E.16993
G1 X180.935 Y119.226 E.01733
G1 X185.286 Y114.875 E.19443
G1 X185.835 Y114.875 E.01733
G1 X180.935 Y119.774 E.21894
G1 X180.935 Y120.323 E.01733
G1 X186.383 Y114.875 E.24344
G1 X186.931 Y114.875 E.01733
G1 X180.935 Y120.871 E.26795
G1 X180.935 Y121.419 E.01733
G1 X187.48 Y114.875 E.29246
G1 X188.028 Y114.875 E.01733
G1 X180.935 Y121.968 E.31696
G1 X180.935 Y122.516 E.01733
G1 X188.577 Y114.875 E.34147
G1 X189.065 Y114.875 E.01542
G1 X189.065 Y114.935 E.00191
G1 X180.935 Y123.065 E.36328
G1 X180.935 Y123.125 E.00191
G1 X181.423 Y123.125 E.01542
G1 X189.065 Y115.484 E.34148
G1 X189.065 Y116.032 E.01733
G1 X181.972 Y123.125 E.31697
G1 X182.52 Y123.125 E.01733
G1 X189.065 Y116.58 E.29246
G1 X189.065 Y117.129 E.01733
G1 X183.068 Y123.125 E.26796
G1 X183.617 Y123.125 E.01733
G1 X189.065 Y117.677 E.24345
G1 X189.065 Y118.226 E.01733
G1 X184.165 Y123.125 E.21894
G1 X184.714 Y123.125 E.01733
G1 X189.065 Y118.774 E.19444
G1 X189.065 Y119.322 E.01733
G1 X185.262 Y123.125 E.16993
G1 X185.81 Y123.125 E.01733
G1 X189.065 Y119.871 E.14543
G1 X189.065 Y120.419 E.01733
G1 X186.359 Y123.125 E.12092
G1 X186.907 Y123.125 E.01733
G1 X189.065 Y120.968 E.09641
G1 X189.065 Y121.516 E.01733
G1 X187.456 Y123.125 E.07191
G1 X188.004 Y123.125 E.01733
G1 X189.065 Y122.064 E.0474
G1 X189.065 Y122.613 E.01733
G1 X188.383 Y123.295 E.03048
G1 X180.95 Y123.59 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6486
G1 X180.95 Y125.219 E.05401
G1 X186.781 Y131.05 E.27355
G1 X188.358 Y131.05 E.0523
G1 X189.05 Y130.358 E.03244
G1 X189.05 Y125.642 E.15644
G1 X186.925 Y123.517 E.09967
G1 X188.215 Y123.517 E.04278
G1 X180.95 Y130.781 E.34078
G1 X180.95 Y131.05 E.0089
G1 X182.31 Y131.05 E.04512
; WIPE_START
G1 F24000
G1 X180.95 Y131.05 E-.51683
G1 X180.95 Y130.781 E-.10193
G1 X181.213 Y130.519 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I-.011 J-1.217 P1  F30000
G1 X79.398 Y131.398 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6486
G1 X70.602 Y131.398 E.29177
G1 X70.602 Y106.602 E.82252
G1 X79.398 Y106.602 E.29177
G1 X79.398 Y131.338 E.82053
G1 X79.79 Y131.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6486
G1 X70.21 Y131.79 E.29437
G1 X70.21 Y106.21 E.786
G1 X79.79 Y106.21 E.29437
G1 X79.79 Y131.73 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I1.204 J-.175 P1  F30000
G1 X77.69 Y131.05 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6486
G1 X79.05 Y131.05 E.04512
G1 X79.05 Y130.781 E.0089
G1 X71.785 Y123.517 E.34078
G1 X73.075 Y123.517 E.04278
G1 X70.95 Y125.642 E.09967
G1 X70.95 Y130.358 E.15644
G1 X71.642 Y131.05 E.03244
G1 X73.219 Y131.05 E.0523
G1 X79.05 Y125.219 E.27355
G1 X79.05 Y123.59 E.05401
G1 X78.383 Y123.295 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.430693
G1 F6486
G1 X79.065 Y122.613 E.03048
G1 X79.065 Y122.064 E.01733
G1 X78.004 Y123.125 E.0474
G1 X77.456 Y123.125 E.01733
G1 X79.065 Y121.516 E.07191
G1 X79.065 Y120.968 E.01733
G1 X76.907 Y123.125 E.09641
G1 X76.359 Y123.125 E.01733
G1 X79.065 Y120.419 E.12092
G1 X79.065 Y119.871 E.01733
G1 X75.81 Y123.125 E.14543
G1 X75.262 Y123.125 E.01733
G1 X79.065 Y119.322 E.16993
G1 X79.065 Y118.774 E.01733
G1 X74.714 Y123.125 E.19444
G1 X74.165 Y123.125 E.01733
G1 X79.065 Y118.226 E.21894
G1 X79.065 Y117.677 E.01733
G1 X73.617 Y123.125 E.24345
G1 X73.068 Y123.125 E.01733
G1 X79.065 Y117.129 E.26796
G1 X79.065 Y116.58 E.01733
G1 X72.52 Y123.125 E.29246
G1 X71.972 Y123.125 E.01733
G1 X79.065 Y116.032 E.31697
G1 X79.065 Y115.484 E.01733
G1 X71.423 Y123.125 E.34148
G1 X70.935 Y123.125 E.01542
G1 X70.935 Y123.065 E.00191
G1 X79.065 Y114.935 E.36328
G1 X79.065 Y114.875 E.00191
G1 X78.577 Y114.875 E.01542
G1 X70.935 Y122.516 E.34147
G1 X70.935 Y121.968 E.01733
G1 X78.028 Y114.875 E.31696
G1 X77.48 Y114.875 E.01733
G1 X70.935 Y121.419 E.29246
G1 X70.935 Y120.871 E.01733
G1 X76.931 Y114.875 E.26795
G1 X76.383 Y114.875 E.01733
G1 X70.935 Y120.323 E.24344
G1 X70.935 Y119.774 E.01733
G1 X75.835 Y114.875 E.21894
G1 X75.286 Y114.875 E.01733
G1 X70.935 Y119.226 E.19443
G1 X70.935 Y118.677 E.01733
G1 X74.738 Y114.875 E.16993
G1 X74.19 Y114.875 E.01733
G1 X70.935 Y118.129 E.14542
G1 X70.935 Y117.581 E.01733
G1 X73.641 Y114.875 E.12091
G1 X73.093 Y114.875 E.01733
G1 X70.935 Y117.032 E.09641
G1 X70.935 Y116.484 E.01733
G1 X72.544 Y114.875 E.0719
G1 X71.996 Y114.875 E.01733
G1 X70.935 Y115.935 E.0474
G1 X70.935 Y115.387 E.01733
G1 X71.617 Y114.705 E.03047
G1 X72.662 Y106.95 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6486
G1 X74.29 Y106.95 E.05401
G1 X70.95 Y110.29 E.15667
G1 X70.95 Y107.33 E.09818
G1 X78.103 Y114.483 E.33554
G1 X74.433 Y114.483 E.12172
G1 X79.05 Y109.867 E.21655
G1 X79.05 Y107.754 E.0701
G1 X78.246 Y106.95 E.03768
G1 X76.618 Y106.95 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X78.246 Y106.95 E-.61876
G1 X78.509 Y107.213 E-.14124
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
G3 Z10.8 I-.161 J1.206 P1  F30000
G1 X180.602 Y120.877 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7227
G1 X189.398 Y120.877 E.29177
G1 X189.398 Y131.398 E.34901
G1 X180.602 Y131.398 E.29177
G1 X180.602 Y120.937 E.34702
; WIPE_START
G1 F24000
G1 X182.602 Y120.923 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I1.205 J-.168 P1  F30000
G1 X180.602 Y106.602 Z11
G1 Z10.6
G1 E.8 F1800
G1 F7227
G1 X189.398 Y106.602 E.29177
G1 X189.398 Y117.123 E.34901
G1 X180.602 Y117.123 E.29177
G1 X180.602 Y106.662 E.34702
G1 X180.21 Y106.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7227
G1 X189.79 Y106.21 E.29437
G1 X189.79 Y131.79 E.786
G1 X180.21 Y131.79 E.29437
G1 X180.21 Y106.27 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y106.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I-1.2 J-.2 P1  F30000
G1 X180.95 Y113.801 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7227
G1 X180.95 Y114.998 E.03968
G1 X181.382 Y114.998 E.01433
G1 X189.05 Y107.33 E.35969
G1 X189.05 Y110.29 E.09818
G1 X185.71 Y106.95 E.15667
G1 X181.754 Y106.95 E.13124
G1 X180.95 Y107.754 E.03768
G1 X180.95 Y109.867 E.0701
G1 X186.081 Y114.998 E.2407
G1 X187.71 Y114.998 E.05401
G1 X189.176 Y115.984 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F7227
G1 X188.411 Y115.22 E.0332
G1 X187.878 Y115.22
G1 X189.176 Y116.517 E.05638
G1 X189.026 Y116.901
G1 X187.345 Y115.22 E.07305
G1 X186.812 Y115.22
G1 X188.493 Y116.901 E.07305
G1 X187.959 Y116.901
G1 X186.278 Y115.22 E.07305
G1 X185.745 Y115.22
G1 X187.426 Y116.901 E.07305
G1 X186.893 Y116.901
G1 X185.212 Y115.22 E.07305
G1 X184.679 Y115.22
G1 X186.359 Y116.901 E.07305
G1 X185.826 Y116.901
G1 X184.145 Y115.22 E.07305
G1 X183.612 Y115.22
G1 X185.293 Y116.901 E.07305
G1 X184.76 Y116.901
G1 X183.079 Y115.22 E.07305
G1 X182.545 Y115.22
G1 X184.226 Y116.901 E.07305
G1 X183.693 Y116.901
G1 X182.012 Y115.22 E.07305
G1 X181.479 Y115.22
G1 X183.16 Y116.901 E.07305
G1 X182.627 Y116.901
G1 X180.946 Y115.22 E.07305
G1 X180.824 Y115.632
G1 X182.093 Y116.901 E.05514
G1 X181.56 Y116.901
G1 X180.824 Y116.165 E.03196
M204 S10000
; WIPE_START
G1 F24000
G1 X181.56 Y116.901 E-.3953
G1 X182.093 Y116.901 E-.20264
G1 X181.792 Y116.599 E-.16206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I-1.208 J-.145 P1  F30000
G1 X180.95 Y123.59 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7227
G1 X180.95 Y125.219 E.05401
G1 X186.781 Y131.05 E.27355
G1 X188.358 Y131.05 E.0523
G1 X189.05 Y130.358 E.03244
G1 X189.05 Y125.642 E.15644
G1 X186.41 Y123.002 E.12382
G1 X188.729 Y123.002 E.07693
G1 X180.95 Y130.781 E.36493
G1 X180.95 Y131.05 E.0089
G1 X182.31 Y131.05 E.04512
G1 X189.176 Y121.85 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F7227
G1 X188.425 Y121.099 E.03263
G1 X187.891 Y121.099
G1 X189.176 Y122.383 E.0558
G1 X189.039 Y122.78
G1 X187.358 Y121.099 E.07305
G1 X186.825 Y121.099
G1 X188.506 Y122.78 E.07305
G1 X187.973 Y122.78
G1 X186.292 Y121.099 E.07305
G1 X185.758 Y121.099
G1 X187.439 Y122.78 E.07305
G1 X186.906 Y122.78
G1 X185.225 Y121.099 E.07305
G1 X184.692 Y121.099
G1 X186.373 Y122.78 E.07305
G1 X185.839 Y122.78
G1 X184.159 Y121.099 E.07305
G1 X183.625 Y121.099
G1 X185.306 Y122.78 E.07305
G1 X184.773 Y122.78
G1 X183.092 Y121.099 E.07305
G1 X182.559 Y121.099
G1 X184.24 Y122.78 E.07305
G1 X183.706 Y122.78
G1 X182.025 Y121.099 E.07305
G1 X181.492 Y121.099
G1 X183.173 Y122.78 E.07305
G1 X182.64 Y122.78
G1 X180.959 Y121.099 E.07305
G1 X180.824 Y121.498
G1 X182.107 Y122.78 E.05571
G1 X181.573 Y122.78
G1 X180.824 Y122.031 E.03254
M204 S10000
; WIPE_START
G1 F24000
G1 X181.573 Y122.78 E-.40242
G1 X182.107 Y122.78 E-.20264
G1 X181.818 Y122.492 E-.15494
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I.713 J.986 P1  F30000
G1 X188.937 Y117.346 Z11
G1 Z10.6
G1 E.8 F1800
M204 S2000
G1 F7227
G1 X189.583 Y117.991 E.02804
G1 X189.583 Y118.524
G1 X188.404 Y117.346 E.05121
G1 X187.871 Y117.346
G1 X189.583 Y119.057 E.07439
G1 X189.583 Y119.591
G1 X187.338 Y117.346 E.09756
G1 X186.804 Y117.346
G1 X189.583 Y120.124 E.12073
G1 X189.58 Y120.654
G1 X186.271 Y117.346 E.14378
G1 X185.738 Y117.346
G1 X189.046 Y120.654 E.14378
G1 X188.513 Y120.654
G1 X185.204 Y117.346 E.14378
G1 X184.671 Y117.346
G1 X187.98 Y120.654 E.14378
G1 X187.447 Y120.654
G1 X184.138 Y117.346 E.14378
G1 X183.605 Y117.346
G1 X186.913 Y120.654 E.14378
G1 X186.38 Y120.654
G1 X183.071 Y117.346 E.14378
G1 X182.538 Y117.346
G1 X185.847 Y120.654 E.14378
G1 X185.314 Y120.654
G1 X182.005 Y117.346 E.14378
G1 X181.472 Y117.346
G1 X184.78 Y120.654 E.14378
G1 X184.247 Y120.654
G1 X180.938 Y117.346 E.14378
G1 X180.417 Y117.358
G1 X183.714 Y120.654 E.14324
G1 X183.18 Y120.654
G1 X180.417 Y117.891 E.12007
G1 X180.417 Y118.425
G1 X182.647 Y120.654 E.09689
G1 X182.114 Y120.654
G1 X180.417 Y118.958 E.07372
G1 X180.417 Y119.491
G1 X181.581 Y120.654 E.05055
G1 X181.047 Y120.654
G1 X180.417 Y120.024 E.02737
M204 S10000
; WIPE_START
G1 F24000
G1 X181.047 Y120.654 E-.33854
G1 X181.581 Y120.654 E-.20264
G1 X181.173 Y120.247 E-.21881
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I-.133 J-1.21 P1  F30000
G1 X79.398 Y131.398 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7227
G1 X70.602 Y131.398 E.29177
G1 X70.602 Y120.877 E.34901
G1 X79.398 Y120.877 E.29177
G1 X79.398 Y131.338 E.34702
; WIPE_START
G1 F24000
G1 X77.398 Y131.352 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I1.205 J.169 P1  F30000
G1 X79.398 Y117.123 Z11
G1 Z10.6
G1 E.8 F1800
G1 F7227
G1 X70.602 Y117.123 E.29177
G1 X70.602 Y106.602 E.34901
G1 X79.398 Y106.602 E.29177
G1 X79.398 Y117.063 E.34702
; WIPE_START
G1 F24000
G1 X77.398 Y117.077 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I-1.201 J.195 P1  F30000
G1 X79.79 Y131.79 Z11
G1 Z10.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7227
G1 X70.21 Y131.79 E.29437
G1 X70.21 Y106.21 E.786
G1 X79.79 Y106.21 E.29437
G1 X79.79 Y131.73 E.78416
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I1.204 J-.175 P1  F30000
G1 X77.69 Y131.05 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7227
G1 X79.05 Y131.05 E.04512
G1 X79.05 Y130.781 E.0089
G1 X71.271 Y123.002 E.36493
G1 X73.59 Y123.002 E.07693
G1 X70.95 Y125.642 E.12382
G1 X70.95 Y130.358 E.15644
G1 X71.642 Y131.05 E.03244
G1 X73.219 Y131.05 E.0523
G1 X79.05 Y125.219 E.27355
G1 X79.05 Y123.59 E.05401
G1 X79.176 Y121.704 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F7227
G1 X78.571 Y121.099 E.02627
G1 X78.038 Y121.099
G1 X79.176 Y122.237 E.04944
G1 X79.176 Y122.77
G1 X77.504 Y121.099 E.07262
G1 X76.971 Y121.099
G1 X78.652 Y122.78 E.07305
G1 X78.119 Y122.78
G1 X76.438 Y121.099 E.07305
G1 X75.905 Y121.099
G1 X77.586 Y122.78 E.07305
G1 X77.052 Y122.78
G1 X75.371 Y121.099 E.07305
G1 X74.838 Y121.099
G1 X76.519 Y122.78 E.07305
G1 X75.986 Y122.78
G1 X74.305 Y121.099 E.07305
G1 X73.772 Y121.099
G1 X75.453 Y122.78 E.07305
G1 X74.919 Y122.78
G1 X73.238 Y121.099 E.07305
G1 X72.705 Y121.099
G1 X74.386 Y122.78 E.07305
G1 X73.853 Y122.78
G1 X72.172 Y121.099 E.07305
G1 X71.638 Y121.099
G1 X73.319 Y122.78 E.07305
G1 X72.786 Y122.78
G1 X71.105 Y121.099 E.07305
G1 X70.824 Y121.352
G1 X72.253 Y122.78 E.06207
G1 X71.72 Y122.78
G1 X70.824 Y121.885 E.0389
G1 X70.824 Y122.418
G1 X71.186 Y122.78 E.01573
M204 S10000
; WIPE_START
G1 F24000
G1 X70.824 Y122.418 E-.19448
G1 X70.824 Y121.885 E-.20264
G1 X71.5 Y122.56 E-.36288
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I1.21 J.127 P1  F30000
G1 X72.29 Y114.998 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7227
G1 X73.919 Y114.998 E.05401
G1 X79.05 Y109.867 E.2407
G1 X79.05 Y107.754 E.0701
G1 X78.246 Y106.95 E.03768
G1 X74.29 Y106.95 E.13124
G1 X70.95 Y110.29 E.15667
G1 X70.95 Y107.33 E.09818
G1 X78.618 Y114.998 E.35969
G1 X79.05 Y114.998 E.01433
G1 X79.05 Y113.801 E.03969
G1 X79.176 Y115.838 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F7227
G1 X78.558 Y115.22 E.02685
G1 X78.024 Y115.22
G1 X79.176 Y116.371 E.05002
G1 X79.172 Y116.901
G1 X77.491 Y115.22 E.07305
G1 X76.958 Y115.22
G1 X78.639 Y116.901 E.07305
G1 X78.106 Y116.901
G1 X76.425 Y115.22 E.07305
G1 X75.891 Y115.22
G1 X77.572 Y116.901 E.07305
G1 X77.039 Y116.901
G1 X75.358 Y115.22 E.07305
G1 X74.825 Y115.22
G1 X76.506 Y116.901 E.07305
G1 X75.973 Y116.901
G1 X74.292 Y115.22 E.07305
G1 X73.758 Y115.22
G1 X75.439 Y116.901 E.07305
G1 X74.906 Y116.901
G1 X73.225 Y115.22 E.07305
G1 X72.692 Y115.22
G1 X74.373 Y116.901 E.07305
G1 X73.839 Y116.901
G1 X72.159 Y115.22 E.07305
G1 X71.625 Y115.22
G1 X73.306 Y116.901 E.07305
G1 X72.773 Y116.901
G1 X71.092 Y115.22 E.07305
G1 X70.824 Y115.486
G1 X72.24 Y116.901 E.0615
G1 X71.706 Y116.901
G1 X70.824 Y116.019 E.03832
G1 X70.824 Y116.552
G1 X71.173 Y116.901 E.01515
M204 S10000
G1 X79.583 Y117.845 F30000
M204 S2000
G1 F7227
G1 X79.084 Y117.346 E.02168
G1 X78.55 Y117.346
G1 X79.583 Y118.378 E.04485
G1 X79.583 Y118.911
G1 X78.017 Y117.346 E.06803
G1 X77.484 Y117.346
G1 X79.583 Y119.444 E.0912
G1 X79.583 Y119.978
G1 X76.951 Y117.346 E.11437
G1 X76.417 Y117.346
G1 X79.583 Y120.511 E.13755
G1 X79.193 Y120.654
G1 X75.884 Y117.346 E.14378
G1 X75.351 Y117.346
G1 X78.659 Y120.654 E.14378
G1 X78.126 Y120.654
G1 X74.818 Y117.346 E.14378
G1 X74.284 Y117.346
G1 X77.593 Y120.654 E.14378
G1 X77.06 Y120.654
G1 X73.751 Y117.346 E.14378
G1 X73.218 Y117.346
G1 X76.526 Y120.654 E.14378
G1 X75.993 Y120.654
G1 X72.684 Y117.346 E.14378
G1 X72.151 Y117.346
G1 X75.46 Y120.654 E.14378
G1 X74.927 Y120.654
G1 X71.618 Y117.346 E.14378
G1 X71.085 Y117.346
G1 X74.393 Y120.654 E.14378
G1 X73.86 Y120.654
G1 X70.551 Y117.346 E.14378
G1 X70.417 Y117.745
G1 X73.327 Y120.654 E.12643
G1 X72.794 Y120.654
G1 X70.417 Y118.278 E.10325
G1 X70.417 Y118.811
G1 X72.26 Y120.654 E.08008
G1 X71.727 Y120.654
G1 X70.417 Y119.345 E.05691
G1 X70.417 Y119.878
G1 X71.194 Y120.654 E.03373
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X70.417 Y119.878 E-.41718
M73 P80 R8
G1 X70.417 Y119.345 E-.20264
G1 X70.678 Y119.606 E-.14017
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
G3 Z11 I-.009 J1.217 P1  F30000
G1 X180.602 Y120.401 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4833
G1 X189.398 Y120.401 E.29177
G1 X189.398 Y131.398 E.36479
G1 X180.602 Y131.398 E.29177
G1 X180.602 Y120.461 E.3628
G1 X180.21 Y120.009 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4833
G1 X189.79 Y120.009 E.29437
G1 X189.79 Y131.79 E.362
G1 X180.21 Y131.79 E.29437
G1 X180.21 Y120.069 E.36016
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y120.056 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I-.867 J-.854 P1  F30000
G1 X181.029 Y121.257 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477612
G1 F4833
G1 X188.977 Y121.257 E.28154
G1 X188.977 Y120.822 E.0154
G1 X181.025 Y120.822 E.28168
G1 X181.028 Y121.197 E.01327
G1 X182.31 Y131.05 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4833
G1 X180.95 Y131.05 E.04512
G1 X180.95 Y130.781 E.0089
G1 X189.05 Y122.682 E.37996
G1 X189.05 Y125.642 E.09818
G1 X185.085 Y121.677 E.18598
G1 X182.378 Y121.677 E.08979
G1 X180.95 Y123.105 E.06699
G1 X180.95 Y125.219 E.0701
G1 X186.781 Y131.05 E.27355
G1 X188.358 Y131.05 E.0523
G1 X189.05 Y130.358 E.03244
G1 X189.05 Y128.73 E.05401
; WIPE_START
G1 F24000
G1 X189.05 Y130.358 E-.61876
G1 X188.787 Y130.621 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I1.03 J-.648 P1  F30000
G1 X180.602 Y117.599 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4833
G1 X180.602 Y106.602 E.36479
G1 X189.398 Y106.602 E.29177
G1 X189.398 Y117.599 E.36479
G1 X180.662 Y117.599 E.28978
G1 X180.21 Y117.991 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4833
G1 X180.21 Y106.21 E.362
G1 X189.79 Y106.21 E.29437
G1 X189.79 Y117.991 E.362
G1 X180.27 Y117.991 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.26 Y115.991 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I-1.024 J.658 P1  F30000
G1 X181.023 Y117.178 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477612
G1 F4833
G1 X188.975 Y117.178 E.28168
G1 X188.971 Y116.743 E.0154
G1 X181.023 Y116.743 E.28154
G1 X181.023 Y117.118 E.01327
G1 X181.686 Y116.323 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4833
G1 X180.95 Y116.323 E.02439
G1 X180.95 Y115.429 E.02962
G1 X189.05 Y107.33 E.37996
G1 X189.05 Y110.29 E.09818
G1 X185.71 Y106.95 E.15667
G1 X181.754 Y106.95 E.13124
G1 X180.95 Y107.754 E.03768
G1 X180.95 Y109.867 E.0701
G1 X187.406 Y116.323 E.30286
G1 X187.733 Y116.323 E.01085
G1 X189.05 Y115.006 E.06175
G1 X189.05 Y113.378 E.05401
; WIPE_START
G1 F24000
G1 X189.05 Y115.006 E-.61876
G1 X188.787 Y115.269 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I-.026 J-1.217 P1  F30000
G1 X79.398 Y117.599 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4833
G1 X70.602 Y117.599 E.29177
G1 X70.602 Y106.602 E.36479
G1 X79.398 Y106.602 E.29177
G1 X79.398 Y117.539 E.3628
G1 X79.79 Y117.991 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4833
G1 X70.21 Y117.991 E.29437
G1 X70.21 Y106.21 E.362
G1 X79.79 Y106.21 E.29437
G1 X79.79 Y117.931 E.36016
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y117.944 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I.66 J1.022 P1  F30000
G1 X78.975 Y117.178 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477612
G1 F4833
G1 X78.971 Y116.743 E.0154
G1 X71.023 Y116.743 E.28154
G1 X71.023 Y117.178 E.0154
G1 X78.915 Y117.178 E.27955
G1 X78.314 Y116.323 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4833
G1 X79.05 Y116.323 E.02439
G1 X79.05 Y115.429 E.02962
G1 X70.95 Y107.33 E.37996
G1 X70.95 Y110.29 E.09818
G1 X74.29 Y106.95 E.15667
G1 X78.246 Y106.95 E.13124
G1 X79.05 Y107.754 E.03768
G1 X79.05 Y109.867 E.0701
G1 X72.594 Y116.323 E.30286
G1 X72.267 Y116.323 E.01085
G1 X70.95 Y115.006 E.06175
G1 X70.95 Y113.378 E.05401
; WIPE_START
G1 F24000
G1 X70.95 Y115.006 E-.61876
G1 X71.213 Y115.269 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I-1.085 J.551 P1  F30000
G1 X79.398 Y131.398 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4833
G1 X70.602 Y131.398 E.29177
G1 X70.602 Y120.401 E.36479
G1 X79.398 Y120.401 E.29177
G1 X79.398 Y131.338 E.3628
G1 X79.79 Y131.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4833
G1 X70.21 Y131.79 E.29437
G1 X70.21 Y120.009 E.362
G1 X79.79 Y120.009 E.29437
G1 X79.79 Y131.73 E.36016
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I1.204 J-.175 P1  F30000
G1 X77.69 Y131.05 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4833
G1 X79.05 Y131.05 E.04512
G1 X79.05 Y130.781 E.0089
G1 X70.95 Y122.682 E.37996
G1 X70.95 Y125.642 E.09818
G1 X74.915 Y121.677 E.18598
G1 X77.622 Y121.677 E.08979
G1 X79.05 Y123.105 E.06699
G1 X79.05 Y125.219 E.0701
G1 X73.219 Y131.05 E.27355
G1 X71.642 Y131.05 E.0523
G1 X70.95 Y130.358 E.03244
G1 X70.95 Y128.73 E.05401
G1 X78.977 Y121.257 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477612
G1 F4833
G1 X78.977 Y120.822 E.0154
G1 X71.025 Y120.822 E.28168
G1 X71.029 Y121.257 E.0154
G1 X78.917 Y121.257 E.27941
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X76.917 Y121.257 E-.76
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
G3 Z11.2 I.004 J1.217 P1  F30000
G1 X180.602 Y120.887 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4750
G1 X189.398 Y120.887 E.29177
G1 X189.398 Y131.398 E.34866
G1 X180.602 Y131.398 E.29177
G1 X180.602 Y120.947 E.34667
G1 X180.21 Y120.495 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4750
G1 X189.79 Y120.495 E.29437
G1 X189.79 Y131.79 E.34706
G1 X180.21 Y131.79 E.29437
G1 X180.21 Y120.555 E.34522
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y120.543 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-.772 J-.94 P1  F30000
G1 X180.969 Y121.562 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.357084
G1 F4750
G1 X189.037 Y121.562 E.20656
G1 X189.037 Y121.248 E.00804
G1 X180.965 Y121.248 E.20666
G1 X180.968 Y121.502 E.00651
G1 X182.31 Y131.05 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4750
G1 X180.95 Y131.05 E.04512
G1 X180.95 Y130.781 E.0089
G1 X189.05 Y122.682 E.37996
G1 X189.05 Y125.642 E.09818
G1 X185.33 Y121.923 E.17448
G1 X182.133 Y121.923 E.10605
G1 X180.95 Y123.105 E.05549
G1 X180.95 Y125.219 E.0701
G1 X186.781 Y131.05 E.27355
G1 X188.358 Y131.05 E.0523
G1 X189.05 Y130.358 E.03244
G1 X189.05 Y128.73 E.05401
; WIPE_START
G1 F24000
G1 X189.05 Y130.358 E-.61876
G1 X188.787 Y130.621 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I1.041 J-.631 P1  F30000
G1 X180.602 Y117.113 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4750
G1 X180.602 Y106.602 E.34866
G1 X189.398 Y106.602 E.29177
G1 X189.398 Y117.113 E.34866
G1 X180.662 Y117.113 E.28978
G1 X180.21 Y117.505 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4750
G1 X180.21 Y106.21 E.34706
G1 X189.79 Y106.21 E.29437
G1 X189.79 Y117.505 E.34706
G1 X180.27 Y117.505 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.259 Y115.505 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-1.06 J.598 P1  F30000
G1 X180.963 Y116.752 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.357084
G1 F4750
G1 X189.035 Y116.752 E.20666
G1 X189.031 Y116.438 E.00804
G1 X180.963 Y116.438 E.20656
G1 X180.963 Y116.692 E.00651
G1 X181.931 Y116.077 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4750
G1 X180.95 Y116.077 E.03252
G1 X180.95 Y115.429 E.02149
G1 X189.05 Y107.33 E.37996
G1 X189.05 Y110.29 E.09818
G1 X185.71 Y106.95 E.15667
G1 X181.754 Y106.95 E.13124
G1 X180.95 Y107.754 E.03768
G1 X180.95 Y109.867 E.0701
G1 X187.161 Y116.077 E.29136
G1 X187.978 Y116.077 E.02711
G1 X189.05 Y115.006 E.05025
G1 X189.05 Y113.378 E.05401
; WIPE_START
G1 F24000
G1 X189.05 Y115.006 E-.61876
G1 X188.787 Y115.269 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-.021 J-1.217 P1  F30000
G1 X79.398 Y117.113 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4750
G1 X70.602 Y117.113 E.29177
G1 X70.602 Y106.602 E.34866
G1 X79.398 Y106.602 E.29177
G1 X79.398 Y117.053 E.34667
G1 X79.79 Y117.505 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4750
G1 X70.21 Y117.505 E.29437
G1 X70.21 Y106.21 E.34706
G1 X79.79 Y106.21 E.29437
G1 X79.79 Y117.445 E.34522
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y117.457 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I.6 J1.059 P1  F30000
G1 X79.035 Y116.752 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.357084
G1 F4750
G1 X79.031 Y116.438 E.00804
G1 X70.963 Y116.438 E.20656
G1 X70.963 Y116.752 E.00804
G1 X78.975 Y116.752 E.20513
G1 X78.069 Y116.077 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4750
G1 X79.05 Y116.077 E.03252
G1 X79.05 Y115.429 E.02149
G1 X70.95 Y107.33 E.37996
G1 X70.95 Y110.29 E.09818
G1 X74.29 Y106.95 E.15667
G1 X78.246 Y106.95 E.13124
G1 X79.05 Y107.754 E.03768
G1 X79.05 Y109.867 E.0701
G1 X72.839 Y116.077 E.29136
G1 X72.022 Y116.077 E.02711
G1 X70.95 Y115.006 E.05026
G1 X70.95 Y113.378 E.05401
; WIPE_START
G1 F24000
G1 X70.95 Y115.006 E-.61876
G1 X71.213 Y115.269 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-1.085 J.551 P1  F30000
G1 X79.398 Y131.398 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4750
G1 X70.602 Y131.398 E.29177
G1 X70.602 Y120.887 E.34866
G1 X79.398 Y120.887 E.29177
G1 X79.398 Y131.338 E.34667
G1 X79.79 Y131.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4750
G1 X70.21 Y131.79 E.29437
G1 X70.21 Y120.495 E.34706
G1 X79.79 Y120.495 E.29437
G1 X79.79 Y131.73 E.34522
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I1.204 J-.175 P1  F30000
G1 X77.69 Y131.05 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4750
G1 X79.05 Y131.05 E.04512
G1 X79.05 Y130.781 E.0089
G1 X70.95 Y122.682 E.37996
G1 X70.95 Y125.642 E.09818
G1 X74.67 Y121.923 E.17448
G1 X77.867 Y121.923 E.10605
G1 X79.05 Y123.105 E.05549
G1 X79.05 Y125.219 E.0701
G1 X73.219 Y131.05 E.27355
G1 X71.642 Y131.05 E.0523
G1 X70.95 Y130.358 E.03244
G1 X70.95 Y128.73 E.05401
G1 X79.037 Y121.562 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.357084
G1 F4750
G1 X79.037 Y121.248 E.00804
G1 X70.965 Y121.248 E.20666
G1 X70.969 Y121.562 E.00804
G1 X78.977 Y121.562 E.20502
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X76.977 Y121.562 E-.76
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
G3 Z11.4 I.004 J1.217 P1  F30000
G1 X180.602 Y121.21 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4383
G1 X189.398 Y121.21 E.29177
G1 X189.398 Y131.398 E.33794
G1 X180.602 Y131.398 E.29177
G1 X180.602 Y121.27 E.33595
G1 X180.21 Y120.818 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4383
G1 X189.79 Y120.818 E.29437
G1 X189.79 Y131.79 E.33713
G1 X180.21 Y131.79 E.29437
G1 X180.21 Y120.878 E.33528
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y120.866 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I-.695 J-.999 P1  F30000
G1 X181.061 Y121.665 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.545716
G1 F4383
G1 X188.879 Y121.665 E.32031
G1 X189.05 Y128.73 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4383
G1 X189.05 Y130.358 E.05401
G1 X188.358 Y131.05 E.03244
G1 X186.781 Y131.05 E.0523
G1 X180.95 Y125.219 E.27355
G1 X180.95 Y123.105 E.0701
G1 X181.936 Y122.12 E.04622
G1 X185.528 Y122.12 E.11917
G1 X189.05 Y125.642 E.16521
G1 X189.05 Y122.682 E.09818
G1 X180.95 Y130.781 E.37996
G1 X180.95 Y131.05 E.0089
G1 X182.31 Y131.05 E.04512
; WIPE_START
G1 F24000
G1 X180.95 Y131.05 E-.51683
G1 X180.95 Y130.781 E-.10193
G1 X181.213 Y130.519 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I1.216 J-.054 P1  F30000
G1 X180.602 Y116.79 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4383
G1 X180.602 Y106.602 E.33794
G1 X189.398 Y106.602 E.29177
G1 X189.398 Y116.79 E.33794
G1 X180.662 Y116.79 E.28978
G1 X180.21 Y117.182 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4383
G1 X180.21 Y106.21 E.33713
G1 X189.79 Y106.21 E.29437
G1 X189.79 Y117.182 E.33713
G1 X180.27 Y117.182 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.259 Y115.182 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I-.999 J.695 P1  F30000
G1 X181.061 Y116.335 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.545716
G1 F4383
G1 X188.879 Y116.335 E.32031
G1 X189.05 Y113.378 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4383
G1 X189.05 Y115.006 E.05401
G1 X188.176 Y115.88 E.04098
G1 X186.963 Y115.88 E.04023
G1 X180.95 Y109.867 E.28208
G1 X180.95 Y107.754 E.0701
G1 X181.754 Y106.95 E.03768
G1 X185.71 Y106.95 E.13124
G1 X189.05 Y110.29 E.15667
G1 X189.05 Y107.33 E.09818
G1 X180.95 Y115.429 E.37996
G1 X180.95 Y115.88 E.01493
G1 X182.128 Y115.88 E.03908
; WIPE_START
G1 F24000
G1 X180.95 Y115.88 E-.44768
G1 X180.95 Y115.429 E-.17108
G1 X181.213 Y115.167 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I-.019 J-1.217 P1  F30000
G1 X79.398 Y116.79 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4383
G1 X70.602 Y116.79 E.29177
G1 X70.602 Y106.602 E.33794
G1 X79.398 Y106.602 E.29177
G1 X79.398 Y116.73 E.33595
G1 X79.79 Y117.182 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4383
G1 X70.21 Y117.182 E.29437
G1 X70.21 Y106.21 E.33713
G1 X79.79 Y106.21 E.29437
G1 X79.79 Y117.122 E.33528
M204 S10000
; WIPE_START
G1 F24000
M73 P81 R8
G1 X77.79 Y117.134 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I1.214 J.079 P1  F30000
G1 X77.872 Y115.88 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4383
G1 X79.05 Y115.88 E.03908
G1 X79.05 Y115.429 E.01493
G1 X70.95 Y107.33 E.37996
G1 X70.95 Y110.29 E.09818
G1 X74.29 Y106.95 E.15667
G1 X78.246 Y106.95 E.13124
G1 X79.05 Y107.754 E.03768
G1 X79.05 Y109.867 E.0701
G1 X73.037 Y115.88 E.28209
G1 X71.824 Y115.88 E.04023
G1 X70.95 Y115.006 E.04098
G1 X70.95 Y113.378 E.05401
G1 X71.061 Y116.335 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.545716
G1 F4383
G1 X78.879 Y116.335 E.32031
; WIPE_START
G1 F24000
G1 X76.879 Y116.335 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I-1.2 J.201 P1  F30000
G1 X79.398 Y131.398 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4383
G1 X70.602 Y131.398 E.29177
G1 X70.602 Y121.21 E.33794
G1 X79.398 Y121.21 E.29177
G1 X79.398 Y131.338 E.33595
G1 X79.79 Y131.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4383
G1 X70.21 Y131.79 E.29437
G1 X70.21 Y120.818 E.33713
G1 X79.79 Y120.818 E.29437
G1 X79.79 Y131.73 E.33528
M204 S10000
; WIPE_START
M73 P81 R7
G1 F24000
G1 X77.79 Y131.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I1.204 J-.175 P1  F30000
G1 X77.69 Y131.05 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4383
G1 X79.05 Y131.05 E.04512
G1 X79.05 Y130.781 E.0089
G1 X70.95 Y122.682 E.37996
G1 X70.95 Y125.642 E.09818
G1 X74.472 Y122.12 E.16521
G1 X78.064 Y122.12 E.11917
G1 X79.05 Y123.105 E.04622
G1 X79.05 Y125.219 E.0701
G1 X73.219 Y131.05 E.27355
G1 X71.642 Y131.05 E.0523
G1 X70.95 Y130.358 E.03244
G1 X70.95 Y128.73 E.05401
G1 X71.061 Y121.665 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.545716
G1 F4383
G1 X78.879 Y121.665 E.32031
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X76.879 Y121.665 E-.76
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
G3 Z11.6 I.002 J1.217 P1  F30000
G1 X180.602 Y121.456 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4089
G1 X189.398 Y121.456 E.29177
G1 X189.398 Y131.398 E.32981
G1 X180.602 Y131.398 E.29177
G1 X180.602 Y121.516 E.32782
G1 X180.21 Y121.063 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4089
G1 X189.79 Y121.063 E.29437
G1 X189.79 Y131.79 E.3296
G1 X180.21 Y131.79 E.29437
G1 X180.21 Y121.123 E.32775
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y121.111 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I-1.217 J.012 P1  F30000
G1 X182.31 Y131.05 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4089
G1 X180.95 Y131.05 E.04512
G1 X180.95 Y130.781 E.0089
G1 X189.05 Y122.682 E.37996
G1 X189.05 Y125.642 E.09818
G1 X185.212 Y121.804 E.18006
G1 X182.252 Y121.804 E.09817
G1 X180.95 Y123.105 E.06106
G1 X180.95 Y125.219 E.0701
G1 X186.781 Y131.05 E.27355
G1 X188.358 Y131.05 E.0523
G1 X189.05 Y130.358 E.03244
G1 X189.05 Y128.73 E.05401
; WIPE_START
G1 F24000
G1 X189.05 Y130.358 E-.61876
G1 X188.787 Y130.621 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I1.052 J-.612 P1  F30000
G1 X180.602 Y116.544 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4089
G1 X180.602 Y106.602 E.32981
G1 X189.398 Y106.602 E.29177
G1 X189.398 Y116.544 E.32981
G1 X180.662 Y116.544 E.28978
G1 X180.21 Y116.937 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4089
G1 X180.21 Y106.21 E.3296
G1 X189.79 Y106.21 E.29437
G1 X189.79 Y116.937 E.3296
G1 X180.27 Y116.937 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.259 Y114.937 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I-.767 J.945 P1  F30000
G1 X181.812 Y116.196 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4089
G1 X180.95 Y116.196 E.02858
G1 X180.95 Y115.43 E.02543
G1 X189.05 Y107.33 E.37996
G1 X189.05 Y110.29 E.09818
G1 X185.71 Y106.95 E.15667
G1 X181.754 Y106.95 E.13124
G1 X180.95 Y107.754 E.03768
G1 X180.95 Y109.867 E.0701
G1 X187.28 Y116.196 E.29693
G1 X187.86 Y116.196 E.01923
G1 X189.05 Y115.006 E.05583
G1 X189.05 Y113.378 E.05401
; WIPE_START
G1 F24000
G1 X189.05 Y115.006 E-.61876
G1 X188.787 Y115.269 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I-.014 J-1.217 P1  F30000
G1 X79.398 Y116.544 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4089
G1 X70.602 Y116.544 E.29177
G1 X70.602 Y106.602 E.32981
G1 X79.398 Y106.602 E.29177
G1 X79.398 Y116.484 E.32782
G1 X79.79 Y116.937 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4089
G1 X70.21 Y116.937 E.29437
G1 X70.21 Y106.21 E.3296
G1 X79.79 Y106.21 E.29437
G1 X79.79 Y116.877 E.32775
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y116.889 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I1.055 J.606 P1  F30000
G1 X78.188 Y116.196 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4089
G1 X79.05 Y116.196 E.02858
G1 X79.05 Y115.429 E.02543
G1 X70.95 Y107.33 E.37996
G1 X70.95 Y110.29 E.09818
G1 X74.29 Y106.95 E.15667
G1 X78.246 Y106.95 E.13124
G1 X79.05 Y107.754 E.03768
G1 X79.05 Y109.867 E.0701
G1 X72.72 Y116.196 E.29693
G1 X72.14 Y116.196 E.01923
G1 X70.95 Y115.006 E.05583
G1 X70.95 Y113.378 E.05401
; WIPE_START
G1 F24000
G1 X70.95 Y115.006 E-.61876
G1 X71.213 Y115.269 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I-1.085 J.551 P1  F30000
G1 X79.398 Y131.398 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4089
G1 X70.602 Y131.398 E.29177
G1 X70.602 Y121.456 E.32981
G1 X79.398 Y121.456 E.29177
G1 X79.398 Y131.338 E.32782
G1 X79.79 Y131.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4089
G1 X70.21 Y131.79 E.29437
G1 X70.21 Y121.063 E.3296
G1 X79.79 Y121.063 E.29437
G1 X79.79 Y131.73 E.32775
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I1.204 J-.175 P1  F30000
G1 X77.69 Y131.05 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4089
G1 X79.05 Y131.05 E.04512
G1 X79.05 Y130.781 E.0089
G1 X70.95 Y122.682 E.37996
G1 X70.95 Y125.642 E.09818
G1 X74.788 Y121.804 E.18005
G1 X77.748 Y121.804 E.09817
G1 X79.05 Y123.105 E.06106
G1 X79.05 Y125.219 E.0701
G1 X73.219 Y131.05 E.27355
G1 X71.642 Y131.05 E.0523
G1 X70.95 Y130.358 E.03244
G1 X70.95 Y128.73 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X70.95 Y130.358 E-.61876
G1 X71.213 Y130.621 E-.14124
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
G3 Z11.8 I.099 J1.213 P1  F30000
G1 X180.602 Y121.653 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4063
G1 X189.398 Y121.653 E.29177
G1 X189.398 Y131.398 E.32325
G1 X180.602 Y131.398 E.29177
G1 X180.602 Y121.713 E.32126
G1 X180.21 Y121.261 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4063
G1 X189.79 Y121.261 E.29437
G1 X189.79 Y131.79 E.32352
G1 X180.21 Y131.79 E.29437
G1 X180.21 Y121.321 E.32168
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y121.309 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I-1.217 J.013 P1  F30000
G1 X182.31 Y131.05 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4063
G1 X180.95 Y131.05 E.04512
G1 X180.95 Y130.781 E.0089
G1 X189.05 Y122.682 E.37996
G1 X189.05 Y125.642 E.09818
G1 X185.409 Y122.001 E.17078
G1 X182.054 Y122.001 E.11129
G1 X180.95 Y123.105 E.05179
G1 X180.95 Y125.219 E.0701
G1 X186.781 Y131.05 E.27355
G1 X188.358 Y131.05 E.0523
G1 X189.05 Y130.358 E.03244
G1 X189.05 Y128.73 E.05401
; WIPE_START
G1 F24000
G1 X189.05 Y130.358 E-.61876
G1 X188.787 Y130.621 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I1.056 J-.605 P1  F30000
G1 X180.602 Y116.347 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4063
G1 X180.602 Y106.602 E.32325
G1 X189.398 Y106.602 E.29177
G1 X189.398 Y116.347 E.32325
G1 X180.662 Y116.347 E.28978
G1 X180.21 Y116.739 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4063
G1 X180.21 Y106.21 E.32352
G1 X189.79 Y106.21 E.29437
G1 X189.79 Y116.739 E.32352
G1 X180.27 Y116.739 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.259 Y114.739 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I-.711 J.988 P1  F30000
G1 X182.01 Y115.999 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4063
G1 X180.95 Y115.999 E.03514
G1 X180.95 Y115.43 E.01887
G1 X189.05 Y107.33 E.37996
G1 X189.05 Y110.29 E.09818
G1 X185.71 Y106.95 E.15667
G1 X181.754 Y106.95 E.13124
G1 X180.95 Y107.754 E.03768
G1 X180.95 Y109.867 E.0701
G1 X187.082 Y115.999 E.28766
G1 X188.057 Y115.999 E.03235
G1 X189.05 Y115.006 E.04655
G1 X189.05 Y113.378 E.05401
; WIPE_START
G1 F24000
G1 X189.05 Y115.006 E-.61876
G1 X188.787 Y115.269 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I-.012 J-1.217 P1  F30000
G1 X79.398 Y116.347 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4063
G1 X70.602 Y116.347 E.29177
G1 X70.602 Y106.602 E.32325
G1 X79.398 Y106.602 E.29177
G1 X79.398 Y116.287 E.32126
G1 X79.79 Y116.739 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4063
G1 X70.21 Y116.739 E.29437
G1 X70.21 Y106.21 E.32352
G1 X79.79 Y106.21 E.29437
G1 X79.79 Y116.679 E.32168
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y116.691 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I1.169 J.338 P1  F30000
G1 X77.99 Y115.999 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4063
G1 X79.05 Y115.999 E.03514
G1 X79.05 Y115.429 E.01888
G1 X70.95 Y107.33 E.37996
G1 X70.95 Y110.29 E.09818
G1 X74.29 Y106.95 E.15667
G1 X78.246 Y106.95 E.13124
G1 X79.05 Y107.754 E.03768
G1 X79.05 Y109.867 E.0701
G1 X72.918 Y115.999 E.28766
G1 X71.943 Y115.999 E.03235
G1 X70.95 Y115.006 E.04655
G1 X70.95 Y113.378 E.05401
; WIPE_START
G1 F24000
G1 X70.95 Y115.006 E-.61876
G1 X71.213 Y115.269 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I-1.085 J.551 P1  F30000
G1 X79.398 Y131.398 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4063
G1 X70.602 Y131.398 E.29177
G1 X70.602 Y121.653 E.32325
G1 X79.398 Y121.653 E.29177
G1 X79.398 Y131.338 E.32126
G1 X79.79 Y131.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4063
G1 X70.21 Y131.79 E.29437
G1 X70.21 Y121.261 E.32352
G1 X79.79 Y121.261 E.29437
G1 X79.79 Y131.73 E.32168
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I1.204 J-.175 P1  F30000
G1 X77.69 Y131.05 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4063
G1 X79.05 Y131.05 E.04512
G1 X79.05 Y130.781 E.0089
G1 X70.95 Y122.682 E.37996
G1 X70.95 Y125.642 E.09818
G1 X74.591 Y122.001 E.17078
G1 X77.946 Y122.001 E.11129
G1 X79.05 Y123.105 E.05179
G1 X79.05 Y125.219 E.0701
G1 X73.219 Y131.05 E.27355
G1 X71.642 Y131.05 E.0523
G1 X70.95 Y130.358 E.03244
G1 X70.95 Y128.73 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X70.95 Y130.358 E-.61876
G1 X71.213 Y130.621 E-.14124
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
G3 Z12 I.098 J1.213 P1  F30000
G1 X180.602 Y121.816 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4036
G1 X189.398 Y121.816 E.29177
G1 X189.398 Y131.398 E.31786
G1 X180.602 Y131.398 E.29177
G1 X180.602 Y121.876 E.31587
G1 X180.21 Y121.424 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4036
G1 X189.79 Y121.424 E.29437
G1 X189.79 Y131.79 E.31853
G1 X180.21 Y131.79 E.29437
G1 X180.21 Y121.484 E.31669
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y121.471 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I-1.217 J.013 P1  F30000
G1 X182.31 Y131.05 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4036
G1 X180.95 Y131.05 E.04512
G1 X180.95 Y130.781 E.0089
G1 X189.05 Y122.682 E.37996
G1 X189.05 Y125.642 E.09818
G1 X185.572 Y122.164 E.16316
G1 X181.892 Y122.164 E.12207
G1 X180.95 Y123.105 E.04417
G1 X180.95 Y125.219 E.0701
G1 X186.781 Y131.05 E.27355
M73 P82 R7
G1 X188.358 Y131.05 E.0523
G1 X189.05 Y130.358 E.03244
G1 X189.05 Y128.73 E.05401
; WIPE_START
G1 F24000
G1 X189.05 Y130.358 E-.61876
G1 X188.787 Y130.621 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I1.059 J-.6 P1  F30000
G1 X180.602 Y116.184 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4036
G1 X180.602 Y106.602 E.31786
G1 X189.398 Y106.602 E.29177
G1 X189.398 Y116.184 E.31786
G1 X180.662 Y116.184 E.28978
G1 X180.21 Y116.576 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4036
G1 X180.21 Y106.21 E.31853
G1 X189.79 Y106.21 E.29437
G1 X189.79 Y116.576 E.31853
G1 X180.27 Y116.576 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.258 Y114.576 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I-.669 J1.017 P1  F30000
G1 X182.172 Y115.836 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4036
G1 X180.95 Y115.836 E.04053
G1 X180.95 Y115.43 E.01348
G1 X189.05 Y107.33 E.37996
G1 X189.05 Y110.29 E.09818
G1 X185.71 Y106.95 E.15667
G1 X181.754 Y106.95 E.13124
G1 X180.95 Y107.754 E.03768
G1 X180.95 Y109.867 E.0701
G1 X186.92 Y115.836 E.28004
G1 X188.22 Y115.836 E.04313
G1 X189.05 Y115.006 E.03893
G1 X189.05 Y113.378 E.05401
; WIPE_START
G1 F24000
G1 X189.05 Y115.006 E-.61876
G1 X188.787 Y115.269 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I-.01 J-1.217 P1  F30000
G1 X79.398 Y116.184 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4036
G1 X70.602 Y116.184 E.29177
G1 X70.602 Y106.602 E.31786
G1 X79.398 Y106.602 E.29177
G1 X79.398 Y116.124 E.31587
G1 X79.79 Y116.576 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4036
G1 X70.21 Y116.576 E.29437
G1 X70.21 Y106.21 E.31853
G1 X79.79 Y106.21 E.29437
G1 X79.79 Y116.516 E.31669
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y116.529 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I1.215 J.066 P1  F30000
G1 X77.828 Y115.836 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4036
G1 X79.05 Y115.836 E.04053
G1 X79.05 Y115.429 E.01349
G1 X70.95 Y107.33 E.37996
G1 X70.95 Y110.29 E.09818
G1 X74.29 Y106.95 E.15667
G1 X78.246 Y106.95 E.13124
G1 X79.05 Y107.754 E.03768
G1 X79.05 Y109.867 E.0701
G1 X73.08 Y115.836 E.28004
G1 X71.78 Y115.836 E.04313
G1 X70.95 Y115.006 E.03893
G1 X70.95 Y113.378 E.05401
; WIPE_START
G1 F24000
G1 X70.95 Y115.006 E-.61876
G1 X71.213 Y115.269 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I-1.085 J.551 P1  F30000
G1 X79.398 Y131.398 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4036
G1 X70.602 Y131.398 E.29177
G1 X70.602 Y121.816 E.31786
G1 X79.398 Y121.816 E.29177
G1 X79.398 Y131.338 E.31587
G1 X79.79 Y131.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4036
G1 X70.21 Y131.79 E.29437
G1 X70.21 Y121.424 E.31853
G1 X79.79 Y121.424 E.29437
G1 X79.79 Y131.73 E.31669
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I1.204 J-.175 P1  F30000
G1 X77.69 Y131.05 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4036
G1 X79.05 Y131.05 E.04512
G1 X79.05 Y130.781 E.0089
G1 X70.95 Y122.682 E.37996
G1 X70.95 Y125.642 E.09818
G1 X74.428 Y122.164 E.16316
G1 X78.108 Y122.164 E.12207
G1 X79.05 Y123.105 E.04417
G1 X79.05 Y125.219 E.0701
G1 X73.219 Y131.05 E.27355
G1 X71.642 Y131.05 E.0523
G1 X70.95 Y130.358 E.03244
G1 X70.95 Y128.73 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X70.95 Y130.358 E-.61876
G1 X71.213 Y130.621 E-.14124
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
G3 Z12.2 I.096 J1.213 P1  F30000
G1 X180.602 Y121.951 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4014
G1 X189.398 Y121.951 E.29177
G1 X189.398 Y131.398 E.31338
G1 X180.602 Y131.398 E.29177
G1 X180.602 Y122.011 E.31139
G1 X180.21 Y121.559 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4014
G1 X189.79 Y121.559 E.29437
G1 X189.79 Y131.79 E.31438
G1 X180.21 Y131.79 E.29437
G1 X180.21 Y121.619 E.31254
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y121.606 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I-1.217 J.013 P1  F30000
G1 X182.31 Y131.05 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4014
G1 X180.95 Y131.05 E.04512
G1 X180.95 Y130.781 E.0089
G1 X189.05 Y122.682 E.37996
G1 X189.05 Y125.642 E.09818
G1 X185.707 Y122.299 E.15683
G1 X181.757 Y122.299 E.13102
G1 X180.95 Y123.105 E.03784
G1 X180.95 Y125.219 E.0701
G1 X186.781 Y131.05 E.27355
G1 X188.358 Y131.05 E.0523
G1 X189.05 Y130.358 E.03244
G1 X189.05 Y128.73 E.05401
; WIPE_START
G1 F24000
G1 X189.05 Y130.358 E-.61876
G1 X188.787 Y130.621 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I1.061 J-.596 P1  F30000
G1 X180.602 Y116.049 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4014
G1 X180.602 Y106.602 E.31338
G1 X189.398 Y106.602 E.29177
G1 X189.398 Y116.049 E.31338
G1 X180.662 Y116.049 E.28978
G1 X180.21 Y116.441 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4014
G1 X180.21 Y106.21 E.31438
G1 X189.79 Y106.21 E.29437
G1 X189.79 Y116.441 E.31438
G1 X180.27 Y116.441 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.258 Y114.442 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I-.637 J1.037 P1  F30000
G1 X182.307 Y115.701 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4014
G1 X180.95 Y115.701 E.045
G1 X180.95 Y115.43 E.00901
G1 X189.05 Y107.33 E.37996
G1 X189.05 Y110.29 E.09818
G1 X185.71 Y106.95 E.15667
G1 X181.754 Y106.95 E.13124
G1 X180.95 Y107.754 E.03768
G1 X180.95 Y109.867 E.0701
G1 X186.785 Y115.701 E.27371
G1 X188.355 Y115.701 E.05207
G1 X189.05 Y115.006 E.0326
G1 X189.05 Y113.378 E.05401
; WIPE_START
G1 F24000
G1 X189.05 Y115.006 E-.61876
G1 X188.787 Y115.269 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I-.009 J-1.217 P1  F30000
G1 X79.398 Y116.049 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4014
G1 X70.602 Y116.049 E.29177
G1 X70.602 Y106.602 E.31338
G1 X79.398 Y106.602 E.29177
G1 X79.398 Y115.989 E.31139
G1 X79.79 Y116.441 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4014
G1 X70.21 Y116.441 E.29437
G1 X70.21 Y106.21 E.31438
G1 X79.79 Y106.21 E.29437
G1 X79.79 Y116.381 E.31254
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y116.394 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I1.205 J-.169 P1  F30000
G1 X77.693 Y115.701 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4014
G1 X79.05 Y115.701 E.045
G1 X79.05 Y115.429 E.00901
G1 X70.95 Y107.33 E.37996
G1 X70.95 Y110.29 E.09818
G1 X74.29 Y106.95 E.15667
G1 X78.246 Y106.95 E.13124
G1 X79.05 Y107.754 E.03768
G1 X79.05 Y109.867 E.0701
G1 X73.215 Y115.701 E.27371
G1 X71.645 Y115.701 E.05207
G1 X70.95 Y115.006 E.0326
G1 X70.95 Y113.378 E.05401
; WIPE_START
G1 F24000
G1 X70.95 Y115.006 E-.61876
G1 X71.213 Y115.269 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I-1.085 J.551 P1  F30000
G1 X79.398 Y131.398 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4014
G1 X70.602 Y131.398 E.29177
G1 X70.602 Y121.951 E.31338
G1 X79.398 Y121.951 E.29177
G1 X79.398 Y131.338 E.31139
G1 X79.79 Y131.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4014
G1 X70.21 Y131.79 E.29437
G1 X70.21 Y121.559 E.31438
G1 X79.79 Y121.559 E.29437
G1 X79.79 Y131.73 E.31254
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.743 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I1.204 J-.175 P1  F30000
G1 X77.69 Y131.05 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4014
G1 X79.05 Y131.05 E.04512
G1 X79.05 Y130.781 E.0089
G1 X70.95 Y122.682 E.37996
G1 X70.95 Y125.642 E.09818
G1 X74.293 Y122.299 E.15683
G1 X78.243 Y122.299 E.13102
G1 X79.05 Y123.105 E.03784
G1 X79.05 Y125.219 E.0701
G1 X73.219 Y131.05 E.27355
G1 X71.642 Y131.05 E.0523
G1 X70.95 Y130.358 E.03244
G1 X70.95 Y128.73 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X70.95 Y130.358 E-.61876
G1 X71.213 Y130.621 E-.14124
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
G3 Z12.4 I.095 J1.213 P1  F30000
G1 X180.602 Y122.061 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4179
G1 X189.398 Y122.061 E.29177
G1 X189.398 Y131.298 E.30642
G1 X180.602 Y131.298 E.29177
G1 X180.602 Y122.121 E.30443
G1 X180.21 Y121.669 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4179
G1 X189.79 Y121.669 E.29437
G1 X189.79 Y131.69 E.30793
G1 X180.21 Y131.69 E.29437
G1 X180.21 Y121.729 E.30609
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y121.716 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I-1.2 J-.203 P1  F30000
G1 X180.95 Y129.153 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4179
G1 X180.95 Y130.431 E.04239
G1 X181.301 Y130.431 E.01163
G1 X189.05 Y122.682 E.36351
G1 X189.05 Y125.642 E.09818
G1 X185.817 Y122.409 E.15167
G1 X181.647 Y122.409 E.13832
G1 X180.95 Y123.105 E.03268
G1 X180.95 Y125.219 E.0701
G1 X186.163 Y130.431 E.24452
G1 X187.791 Y130.431 E.05401
G1 X181.04 Y130.864 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4179
G1 X188.9 Y130.864 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y130.864 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I1.121 J-.473 P1  F30000
G1 X180.602 Y115.939 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4179
G1 X180.602 Y106.702 E.30642
G1 X189.398 Y106.702 E.29177
G1 X189.398 Y115.939 E.30642
G1 X180.662 Y115.939 E.28978
G1 X180.21 Y116.331 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4179
G1 X180.21 Y106.31 E.30793
G1 X189.79 Y106.31 E.29437
G1 X189.79 Y116.331 E.30793
G1 X180.27 Y116.331 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.258 Y114.332 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I-.613 J1.051 P1  F30000
G1 X182.417 Y115.591 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4179
G1 X180.95 Y115.591 E.04865
G1 X180.95 Y115.429 E.00536
G1 X188.811 Y107.569 E.36875
G1 X186.329 Y107.569 E.08233
G1 X189.05 Y110.29 E.12764
G1 X189.05 Y115.006 E.15644
G1 X188.465 Y115.591 E.02744
G1 X186.675 Y115.591 E.05937
G1 X180.95 Y109.867 E.26855
G1 X180.95 Y107.754 E.0701
G1 X181.135 Y107.569 E.00865
G1 X182.763 Y107.569 E.05401
G1 X181.04 Y107.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4179
G1 X188.9 Y107.136 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y107.136 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I-.099 J-1.213 P1  F30000
G1 X79.398 Y115.939 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4179
G1 X70.602 Y115.939 E.29177
G1 X70.602 Y106.702 E.30642
G1 X79.398 Y106.702 E.29177
G1 X79.398 Y115.879 E.30443
G1 X79.79 Y116.331 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4179
G1 X70.21 Y116.331 E.29437
G1 X70.21 Y106.31 E.30793
G1 X79.79 Y106.31 E.29437
G1 X79.79 Y116.271 E.30609
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y116.284 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I1.166 J-.348 P1  F30000
G1 X77.583 Y115.591 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4179
G1 X79.05 Y115.591 E.04865
G1 X79.05 Y115.429 E.00536
G1 X71.189 Y107.569 E.36875
G1 X73.671 Y107.569 E.08233
G1 X70.95 Y110.29 E.12764
G1 X70.95 Y115.006 E.15644
G1 X71.535 Y115.591 E.02744
G1 X73.325 Y115.591 E.05937
G1 X79.05 Y109.867 E.26855
G1 X79.05 Y107.754 E.0701
G1 X78.865 Y107.569 E.00865
G1 X77.237 Y107.569 E.05401
G1 X71.04 Y107.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4179
G1 X78.9 Y107.136 E.29465
; WIPE_START
G1 F24000
G1 X76.9 Y107.136 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I-1.211 J.125 P1  F30000
G1 X79.398 Y131.298 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4179
G1 X70.602 Y131.298 E.29177
G1 X70.602 Y122.061 E.30642
G1 X79.398 Y122.061 E.29177
G1 X79.398 Y131.238 E.30443
G1 X79.79 Y131.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4179
G1 X70.21 Y131.69 E.29437
G1 X70.21 Y121.669 E.30793
M73 P83 R7
G1 X79.79 Y121.669 E.29437
G1 X79.79 Y131.63 E.30609
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.643 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I1.086 J.549 P1  F30000
G1 X79.05 Y129.153 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4179
G1 X79.05 Y130.431 E.04239
G1 X78.699 Y130.431 E.01163
G1 X70.95 Y122.682 E.36351
G1 X70.95 Y125.642 E.09818
G1 X74.183 Y122.409 E.15167
G1 X78.353 Y122.409 E.13832
G1 X79.05 Y123.105 E.03268
G1 X79.05 Y125.219 E.0701
G1 X73.837 Y130.431 E.24452
G1 X72.209 Y130.431 E.05401
G1 X71.04 Y130.864 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4179
G1 X78.9 Y130.864 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X76.9 Y130.864 E-.76
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
G3 Z12.6 I.102 J1.213 P1  F30000
G1 X180.602 Y122.151 Z12.6
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4068
G1 X189.398 Y122.151 E.29177
G1 X189.398 Y131.098 E.29679
G1 X180.602 Y131.098 E.29177
G1 X180.602 Y122.211 E.2948
G1 X180.21 Y121.759 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4068
G1 X189.79 Y121.759 E.29437
G1 X189.79 Y131.49 E.29901
G1 X180.21 Y131.49 E.29437
G1 X180.21 Y121.819 E.29717
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y121.806 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I-1.199 J-.206 P1  F30000
G1 X180.95 Y129.153 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4068
G1 X180.95 Y130.231 E.03575
G1 X181.501 Y130.231 E.01826
G1 X189.05 Y122.682 E.35413
G1 X189.05 Y125.642 E.09818
G1 X185.907 Y122.499 E.14743
G1 X181.557 Y122.499 E.14431
G1 X180.95 Y123.105 E.02844
G1 X180.95 Y125.219 E.0701
G1 X185.963 Y130.231 E.23514
G1 X187.591 Y130.231 E.05401
G1 X181.04 Y130.664 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4068
G1 X188.9 Y130.664 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y130.664 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I1.12 J-.476 P1  F30000
G1 X180.602 Y115.849 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4068
G1 X180.602 Y106.902 E.29679
G1 X189.398 Y106.902 E.29177
G1 X189.398 Y115.849 E.29679
G1 X180.662 Y115.849 E.28978
G1 X180.21 Y116.241 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4068
G1 X180.21 Y106.51 E.29901
G1 X189.79 Y106.51 E.29437
G1 X189.79 Y116.241 E.29901
G1 X180.27 Y116.241 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.258 Y114.241 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I-.595 J1.062 P1  F30000
G1 X182.507 Y115.501 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4068
G1 X180.95 Y115.501 E.05165
G1 X180.95 Y115.429 E.00237
G1 X188.611 Y107.769 E.35936
G1 X186.529 Y107.769 E.06906
G1 X189.05 Y110.29 E.11826
G1 X189.05 Y115.006 E.15644
G1 X188.555 Y115.501 E.02321
G1 X186.585 Y115.501 E.06537
G1 X180.95 Y109.867 E.26431
G1 X180.95 Y108.238 E.05401
G1 X188.96 Y107.336 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502906
G1 F4068
G1 X181.1 Y107.336 E.29465
; WIPE_START
G1 F24000
G1 X183.1 Y107.336 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I-.1 J-1.213 P1  F30000
G1 X79.398 Y115.849 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4068
G1 X70.602 Y115.849 E.29177
G1 X70.602 Y106.902 E.29679
G1 X79.398 Y106.902 E.29177
G1 X79.398 Y115.789 E.2948
G1 X79.79 Y116.241 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4068
G1 X70.21 Y116.241 E.29437
G1 X70.21 Y106.51 E.29901
G1 X79.79 Y106.51 E.29437
G1 X79.79 Y116.181 E.29717
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y116.194 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I1.118 J-.48 P1  F30000
G1 X77.493 Y115.501 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4068
G1 X79.05 Y115.501 E.05165
G1 X79.05 Y115.429 E.00237
G1 X71.389 Y107.769 E.35936
G1 X73.471 Y107.769 E.06906
G1 X70.95 Y110.29 E.11826
G1 X70.95 Y115.006 E.15644
G1 X71.445 Y115.501 E.02321
G1 X73.415 Y115.501 E.06536
G1 X79.05 Y109.867 E.26431
G1 X79.05 Y108.238 E.05401
G1 X71.04 Y107.336 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4068
G1 X78.9 Y107.336 E.29465
; WIPE_START
G1 F24000
G1 X76.9 Y107.336 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I-1.21 J.127 P1  F30000
G1 X79.398 Y131.098 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4068
G1 X70.602 Y131.098 E.29177
G1 X70.602 Y122.151 E.29679
G1 X79.398 Y122.151 E.29177
G1 X79.398 Y131.038 E.2948
G1 X79.79 Y131.49 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4068
G1 X70.21 Y131.49 E.29437
G1 X70.21 Y121.759 E.29901
G1 X79.79 Y121.759 E.29437
G1 X79.79 Y131.43 E.29717
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.443 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I1.066 J.587 P1  F30000
G1 X79.05 Y129.153 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4068
G1 X79.05 Y130.231 E.03575
G1 X78.499 Y130.231 E.01826
G1 X70.95 Y122.682 E.35413
G1 X70.95 Y125.642 E.09818
G1 X74.093 Y122.499 E.14743
G1 X78.443 Y122.499 E.14431
G1 X79.05 Y123.105 E.02844
G1 X79.05 Y125.219 E.0701
G1 X74.037 Y130.231 E.23514
G1 X72.409 Y130.231 E.05401
G1 X71.04 Y130.664 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4068
G1 X78.9 Y130.664 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X76.9 Y130.664 E-.76
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
G3 Z12.8 I.099 J1.213 P1  F30000
G1 X180.602 Y122.223 Z12.8
G1 Z12.6
M73 P83 R6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4000
G1 X189.398 Y122.223 E.29177
G1 X189.398 Y130.898 E.28776
G1 X180.602 Y130.898 E.29177
G1 X180.602 Y122.283 E.28577
G1 X180.21 Y121.831 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4000
G1 X189.79 Y121.831 E.29437
G1 X189.79 Y131.29 E.29064
G1 X180.21 Y131.29 E.29437
G1 X180.21 Y121.891 E.2888
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y121.879 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I-.741 J.965 P1  F30000
G1 X183.113 Y122.571 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4000
G1 X181.484 Y122.571 E.05401
G1 X180.95 Y123.105 E.02505
G1 X180.95 Y125.219 E.0701
G1 X185.763 Y130.031 E.22575
G1 X181.701 Y130.031 E.13473
G1 X189.05 Y122.682 E.34474
G1 X189.05 Y125.642 E.09818
G1 X185.979 Y122.571 E.14404
G1 X184.351 Y122.571 E.05401
G1 X181.04 Y130.464 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4000
G1 X188.9 Y130.464 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y130.464 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I1.118 J-.48 P1  F30000
G1 X180.602 Y115.777 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4000
G1 X180.602 Y107.102 E.28776
G1 X189.398 Y107.102 E.29177
G1 X189.398 Y115.777 E.28776
G1 X180.662 Y115.777 E.28978
G1 X180.21 Y116.169 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4000
G1 X180.21 Y106.71 E.29064
G1 X189.79 Y106.71 E.29437
G1 X189.79 Y116.169 E.29064
G1 X180.27 Y116.169 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.257 Y114.169 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I.57 J1.075 P1  F30000
G1 X180.95 Y113.801 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4000
G1 X180.95 Y115.429 E.05398
G1 X188.411 Y107.969 E.34996
G1 X186.729 Y107.969 E.05579
G1 X189.05 Y110.29 E.10888
G1 X189.05 Y115.006 E.15644
G1 X188.627 Y115.429 E.01981
G1 X186.512 Y115.429 E.07016
G1 X180.95 Y109.867 E.26092
G1 X180.95 Y108.238 E.05401
G1 X181.04 Y107.536 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4000
G1 X188.9 Y107.536 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y107.536 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I-.093 J-1.213 P1  F30000
G1 X79.398 Y115.777 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4000
G1 X70.602 Y115.777 E.29177
G1 X70.602 Y107.102 E.28776
G1 X79.398 Y107.102 E.29177
G1 X79.398 Y115.717 E.28577
G1 X79.79 Y116.169 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4000
G1 X70.21 Y116.169 E.29437
G1 X70.21 Y106.71 E.29064
G1 X79.79 Y106.71 E.29437
G1 X79.79 Y116.109 E.2888
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y116.121 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I1.07 J.581 P1  F30000
G1 X79.05 Y113.801 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4000
G1 X79.049 Y115.429 E.05398
G1 X71.589 Y107.969 E.34994
G1 X73.271 Y107.969 E.05579
G1 X70.95 Y110.29 E.10888
G1 X70.95 Y115.006 E.15644
G1 X71.373 Y115.429 E.01981
G1 X73.488 Y115.429 E.07016
G1 X79.05 Y109.867 E.26092
G1 X79.05 Y108.238 E.05401
G1 X71.04 Y107.536 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4000
G1 X78.9 Y107.536 E.29465
; WIPE_START
G1 F24000
G1 X76.9 Y107.536 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I-1.21 J.129 P1  F30000
G1 X79.398 Y130.898 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4000
G1 X70.602 Y130.898 E.29177
G1 X70.602 Y122.223 E.28776
G1 X79.398 Y122.223 E.29177
G1 X79.398 Y130.838 E.28577
G1 X79.79 Y131.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4000
G1 X70.21 Y131.29 E.29437
G1 X70.21 Y121.831 E.29064
G1 X79.79 Y121.831 E.29437
G1 X79.79 Y131.23 E.2888
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.243 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I.139 J-1.209 P1  F30000
G1 X71.04 Y130.464 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4000
G1 X78.9 Y130.464 E.29465
G1 X76.887 Y122.571 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4000
G1 X78.516 Y122.571 E.05401
G1 X79.05 Y123.105 E.02505
G1 X79.05 Y125.219 E.0701
G1 X74.237 Y130.031 E.22575
G1 X78.299 Y130.031 E.13474
G1 X70.95 Y122.682 E.34475
G1 X70.95 Y125.642 E.09818
G1 X74.021 Y122.571 E.14404
G1 X72.392 Y122.571 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X74.021 Y122.571 E-.61876
G1 X73.758 Y122.834 E-.14124
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
G3 Z13 I.006 J1.217 P1  F30000
G1 X180.602 Y122.278 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3928
G1 X189.398 Y122.278 E.29177
G1 X189.398 Y130.698 E.2793
G1 X180.602 Y130.698 E.29177
G1 X180.602 Y122.338 E.27731
G1 X180.21 Y121.886 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3928
G1 X189.79 Y121.886 E.29437
G1 X189.79 Y131.09 E.28282
G1 X180.21 Y131.09 E.29437
G1 X180.21 Y121.946 E.28097
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y121.933 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-.77 J.942 P1  F30000
G1 X183.058 Y122.626 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3928
G1 X181.43 Y122.626 E.05401
G1 X180.95 Y123.105 E.02248
G1 X180.95 Y125.219 E.0701
G1 X185.563 Y129.831 E.21637
G1 X181.901 Y129.831 E.12147
G1 X189.05 Y122.682 E.33536
G1 X189.05 Y125.642 E.09818
G1 X186.034 Y122.626 E.14147
G1 X184.406 Y122.626 E.05401
G1 X181.04 Y130.264 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3928
G1 X188.9 Y130.264 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y130.264 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I1.117 J-.484 P1  F30000
G1 X180.602 Y115.722 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3928
G1 X180.602 Y107.302 E.2793
G1 X189.398 Y107.302 E.29177
G1 X189.398 Y115.722 E.2793
G1 X180.662 Y115.722 E.28978
G1 X180.21 Y116.114 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3928
G1 X180.21 Y106.91 E.28282
G1 X189.79 Y106.91 E.29437
G1 X189.79 Y116.114 E.28282
G1 X180.27 Y116.114 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.257 Y114.114 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I.501 J1.109 P1  F30000
G1 X180.95 Y113.801 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3928
G1 X180.95 Y115.374 E.05216
G1 X181.006 Y115.374 E.00185
G1 X188.211 Y108.169 E.33798
G1 X186.929 Y108.169 E.04252
M73 P84 R6
G1 X189.05 Y110.29 E.09949
G1 X189.05 Y115.006 E.15644
G1 X188.682 Y115.374 E.01724
G1 X186.457 Y115.374 E.0738
G1 X180.95 Y109.867 E.25835
G1 X180.95 Y108.238 E.05401
G1 X181.04 Y107.736 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3928
G1 X188.9 Y107.736 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y107.736 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-.09 J-1.214 P1  F30000
G1 X79.398 Y115.722 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3928
G1 X70.602 Y115.722 E.29177
G1 X70.602 Y107.302 E.2793
G1 X79.398 Y107.302 E.29177
G1 X79.398 Y115.662 E.27731
G1 X79.79 Y116.114 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3928
G1 X70.21 Y116.114 E.29437
G1 X70.21 Y106.91 E.28282
G1 X79.79 Y106.91 E.29437
G1 X79.79 Y116.054 E.28097
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y116.067 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I1.064 J.591 P1  F30000
G1 X79.05 Y113.801 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3928
G1 X79.05 Y115.374 E.05216
G1 X78.994 Y115.374 E.00185
G1 X71.789 Y108.169 E.33798
G1 X73.071 Y108.169 E.04252
G1 X70.95 Y110.29 E.09949
G1 X70.95 Y115.006 E.15644
G1 X71.318 Y115.374 E.01724
G1 X73.543 Y115.374 E.0738
G1 X79.05 Y109.867 E.25835
G1 X79.05 Y108.238 E.05401
G1 X71.04 Y107.736 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3928
G1 X78.9 Y107.736 E.29465
; WIPE_START
G1 F24000
G1 X76.9 Y107.736 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-1.21 J.132 P1  F30000
G1 X79.398 Y130.698 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3928
G1 X70.602 Y130.698 E.29177
G1 X70.602 Y122.278 E.2793
G1 X79.398 Y122.278 E.29177
G1 X79.398 Y130.638 E.27731
G1 X79.79 Y131.09 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3928
G1 X70.21 Y131.09 E.29437
G1 X70.21 Y121.886 E.28282
G1 X79.79 Y121.886 E.29437
G1 X79.79 Y131.03 E.28097
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y131.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I.139 J-1.209 P1  F30000
G1 X71.04 Y130.264 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3928
G1 X78.9 Y130.264 E.29465
G1 X76.942 Y122.626 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3928
G1 X78.57 Y122.626 E.05401
G1 X79.05 Y123.105 E.02248
G1 X79.05 Y125.219 E.0701
G1 X74.437 Y129.831 E.21637
G1 X78.099 Y129.831 E.12147
G1 X70.95 Y122.682 E.33536
G1 X70.95 Y125.642 E.09818
G1 X73.966 Y122.626 E.14147
G1 X72.338 Y122.626 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X73.966 Y122.626 E-.61876
G1 X73.703 Y122.889 E-.14124
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
G3 Z13.2 I.007 J1.217 P1  F30000
G1 X180.602 Y122.318 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3857
G1 X189.398 Y122.318 E.29177
G1 X189.398 Y130.498 E.27135
G1 X180.602 Y130.498 E.29177
G1 X180.602 Y122.378 E.26936
G1 X180.21 Y121.926 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3857
G1 X189.79 Y121.926 E.29437
G1 X189.79 Y130.89 E.27545
G1 X180.21 Y130.89 E.29437
G1 X180.21 Y121.986 E.27361
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y121.973 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-.792 J.924 P1  F30000
G1 X183.018 Y122.666 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3857
G1 X181.39 Y122.666 E.05401
G1 X180.95 Y123.105 E.02062
G1 X180.95 Y125.219 E.0701
G1 X185.363 Y129.631 E.20699
G1 X182.101 Y129.631 E.1082
G1 X189.05 Y122.682 E.32598
G1 X189.05 Y125.642 E.09818
G1 X186.074 Y122.666 E.13961
G1 X184.445 Y122.666 E.05401
G1 X181.04 Y130.064 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3857
G1 X188.9 Y130.064 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y130.064 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I1.115 J-.488 P1  F30000
G1 X180.602 Y115.682 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3857
G1 X180.602 Y107.502 E.27135
G1 X189.398 Y107.502 E.29177
G1 X189.398 Y115.682 E.27135
G1 X180.662 Y115.682 E.28978
G1 X180.21 Y116.074 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3857
G1 X180.21 Y107.11 E.27545
G1 X189.79 Y107.11 E.29437
G1 X189.79 Y116.074 E.27545
G1 X180.27 Y116.074 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.257 Y114.074 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I.446 J1.132 P1  F30000
G1 X180.95 Y113.801 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3857
G1 X180.95 Y115.334 E.05085
G1 X181.046 Y115.334 E.00317
G1 X188.011 Y108.369 E.32674
G1 X187.129 Y108.369 E.02925
G1 X189.05 Y110.29 E.09011
G1 X189.05 Y115.006 E.15644
G1 X188.722 Y115.334 E.01538
G1 X186.418 Y115.334 E.07643
G1 X180.95 Y109.867 E.25649
G1 X180.95 Y108.369 E.04968
G1 X181.081 Y108.369 E.00434
G1 X181.04 Y107.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3857
G1 X188.9 Y107.936 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y107.936 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-.087 J-1.214 P1  F30000
G1 X79.398 Y115.682 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3857
G1 X70.602 Y115.682 E.29177
G1 X70.602 Y107.502 E.27135
G1 X79.398 Y107.502 E.29177
G1 X79.398 Y115.622 E.26936
G1 X79.79 Y116.074 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3857
G1 X70.21 Y116.074 E.29437
G1 X70.21 Y107.11 E.27545
G1 X79.79 Y107.11 E.29437
G1 X79.79 Y116.014 E.27361
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y116.027 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I1.059 J.599 P1  F30000
G1 X79.05 Y113.801 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3857
G1 X79.05 Y115.334 E.05085
G1 X78.954 Y115.334 E.00317
G1 X71.989 Y108.369 E.32674
G1 X72.871 Y108.369 E.02925
G1 X70.95 Y110.29 E.09011
G1 X70.95 Y115.006 E.15644
G1 X71.278 Y115.334 E.01538
G1 X73.582 Y115.334 E.07643
G1 X79.05 Y109.867 E.25649
G1 X79.05 Y108.369 E.04968
G1 X78.919 Y108.369 E.00434
G1 X71.04 Y107.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3857
G1 X78.9 Y107.936 E.29465
; WIPE_START
G1 F24000
G1 X76.9 Y107.936 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-1.21 J.134 P1  F30000
G1 X79.398 Y130.498 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3857
G1 X70.602 Y130.498 E.29177
G1 X70.602 Y122.318 E.27135
G1 X79.398 Y122.318 E.29177
G1 X79.398 Y130.438 E.26936
G1 X79.79 Y130.89 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3857
G1 X70.21 Y130.89 E.29437
G1 X70.21 Y121.926 E.27545
G1 X79.79 Y121.926 E.29437
G1 X79.79 Y130.83 E.27361
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y130.843 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I1.211 J-.12 P1  F30000
G1 X76.982 Y122.666 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3857
G1 X78.61 Y122.666 E.05401
G1 X79.05 Y123.105 E.02062
G1 X79.05 Y125.219 E.0701
G1 X74.637 Y129.631 E.20699
G1 X77.899 Y129.631 E.1082
G1 X70.95 Y122.682 E.32598
G1 X70.95 Y125.642 E.09818
G1 X73.926 Y122.666 E.13961
G1 X75.555 Y122.666 E.05401
G1 X71.04 Y130.064 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3857
G1 X78.9 Y130.064 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X76.9 Y130.064 E-.76
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
G3 Z13.4 I.09 J1.214 P1  F30000
G1 X180.602 Y122.342 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3781
G1 X189.398 Y122.342 E.29177
G1 X189.398 Y130.298 E.26392
G1 X180.602 Y130.298 E.29177
G1 X180.602 Y122.402 E.26193
G1 X180.21 Y121.95 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3781
G1 X189.79 Y121.95 E.29437
G1 X189.79 Y130.69 E.26857
G1 X180.21 Y130.69 E.29437
G1 X180.21 Y122.01 E.26673
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y121.997 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-.806 J.912 P1  F30000
G1 X182.994 Y122.69 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3781
G1 X181.366 Y122.69 E.05401
G1 X180.95 Y123.105 E.01949
G1 X180.95 Y125.219 E.0701
G1 X185.163 Y129.431 E.19761
G1 X182.301 Y129.431 E.09493
G1 X189.042 Y122.69 E.31623
G1 X186.098 Y122.69 E.09766
G1 X189.05 Y125.642 E.13848
G1 X189.05 Y127.27 E.05401
G1 X181.04 Y129.864 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3781
G1 X188.9 Y129.864 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y129.864 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I1.113 J-.493 P1  F30000
G1 X180.602 Y115.658 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3781
G1 X180.602 Y107.702 E.26392
G1 X189.398 Y107.702 E.29177
G1 X189.398 Y115.658 E.26392
G1 X180.662 Y115.658 E.28978
G1 X180.21 Y116.05 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3781
G1 X180.21 Y107.31 E.26857
G1 X189.79 Y107.31 E.29437
G1 X189.79 Y116.05 E.26857
G1 X180.27 Y116.05 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.256 Y114.05 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I.411 J1.145 P1  F30000
G1 X180.95 Y113.801 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3781
G1 X180.95 Y115.31 E.05005
G1 X181.07 Y115.31 E.00396
G1 X187.811 Y108.569 E.31623
G1 X187.329 Y108.569 E.01599
G1 X189.05 Y110.29 E.08073
G1 X189.05 Y115.006 E.15644
G1 X188.746 Y115.31 E.01426
G1 X186.394 Y115.31 E.07802
G1 X180.95 Y109.867 E.25536
G1 X180.95 Y108.569 E.04304
G1 X181.281 Y108.569 E.01097
G1 X181.04 Y108.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3781
G1 X188.9 Y108.136 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y108.136 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-.085 J-1.214 P1  F30000
G1 X79.398 Y115.658 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3781
G1 X70.602 Y115.658 E.29177
G1 X70.602 Y107.702 E.26392
G1 X79.398 Y107.702 E.29177
G1 X79.398 Y115.598 E.26193
G1 X79.79 Y116.05 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3781
G1 X70.21 Y116.05 E.29437
G1 X70.21 Y107.31 E.26857
G1 X79.79 Y107.31 E.29437
G1 X79.79 Y115.99 E.26673
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y116.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I1.056 J.604 P1  F30000
G1 X79.05 Y113.801 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3781
G1 X79.05 Y115.31 E.05005
G1 X78.93 Y115.31 E.00396
G1 X72.189 Y108.569 E.31623
G1 X72.671 Y108.569 E.01599
G1 X70.95 Y110.29 E.08073
G1 X70.95 Y115.006 E.15644
G1 X71.254 Y115.31 E.01426
G1 X73.606 Y115.31 E.07802
G1 X79.05 Y109.867 E.25536
G1 X79.05 Y108.569 E.04304
G1 X78.719 Y108.569 E.01097
G1 X71.04 Y108.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3781
G1 X78.9 Y108.136 E.29465
; WIPE_START
G1 F24000
G1 X76.9 Y108.136 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-1.209 J.136 P1  F30000
G1 X79.398 Y130.298 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3781
G1 X70.602 Y130.298 E.29177
G1 X70.602 Y122.342 E.26392
G1 X79.398 Y122.342 E.29177
G1 X79.398 Y130.238 E.26193
G1 X79.79 Y130.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3781
G1 X70.21 Y130.69 E.29437
G1 X70.21 Y121.95 E.26857
G1 X79.79 Y121.95 E.29437
G1 X79.79 Y130.63 E.26673
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y130.643 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I1.211 J-.119 P1  F30000
G1 X77.006 Y122.69 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3781
G1 X78.634 Y122.69 E.05401
G1 X79.05 Y123.105 E.01949
G1 X79.05 Y125.219 E.0701
G1 X74.837 Y129.431 E.19761
G1 X77.699 Y129.431 E.09493
G1 X70.958 Y122.69 E.31623
G1 X73.902 Y122.69 E.09766
G1 X70.95 Y125.642 E.13848
G1 X70.95 Y127.27 E.05401
G1 X71.04 Y129.864 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3781
G1 X78.9 Y129.864 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X76.9 Y129.864 E-.76
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
G3 Z13.6 I.088 J1.214 P1  F30000
G1 X180.602 Y122.351 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3717
G1 X189.398 Y122.351 E.29177
G1 X189.398 Y130.098 E.25697
G1 X180.602 Y130.098 E.29177
G1 X180.602 Y122.411 E.25498
M73 P85 R6
G1 X180.21 Y121.959 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3717
G1 X189.79 Y121.959 E.29437
G1 X189.79 Y130.49 E.26213
G1 X180.21 Y130.49 E.29437
G1 X180.21 Y122.019 E.26028
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y122.007 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-.811 J.907 P1  F30000
G1 X182.985 Y122.7 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3717
G1 X181.356 Y122.7 E.05401
G1 X180.95 Y123.105 E.01904
G1 X180.95 Y125.219 E.0701
G1 X184.963 Y129.231 E.18822
G1 X182.501 Y129.231 E.08166
G1 X189.032 Y122.7 E.3064
G1 X186.107 Y122.7 E.09702
G1 X189.05 Y125.642 E.13803
G1 X189.05 Y127.27 E.05401
G1 X181.04 Y129.664 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3717
G1 X188.9 Y129.664 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y129.664 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I1.11 J-.499 P1  F30000
G1 X180.602 Y115.649 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3717
G1 X180.602 Y107.902 E.25697
G1 X189.398 Y107.902 E.29177
G1 X189.398 Y115.649 E.25697
G1 X180.662 Y115.649 E.28978
G1 X180.21 Y116.041 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3717
G1 X180.21 Y107.51 E.26213
G1 X189.79 Y107.51 E.29437
G1 X189.79 Y116.041 E.26213
G1 X180.27 Y116.041 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.256 Y114.041 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I.397 J1.15 P1  F30000
G1 X180.95 Y113.801 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3717
G1 X180.95 Y115.3 E.04973
G1 X181.079 Y115.3 E.00428
G1 X187.611 Y108.769 E.3064
G1 X187.529 Y108.769 E.00272
G1 X189.05 Y110.29 E.07135
G1 X189.05 Y115.006 E.15644
G1 X188.755 Y115.3 E.0138
G1 X186.384 Y115.3 E.07866
G1 X180.95 Y109.867 E.25491
G1 X180.95 Y108.769 E.03641
G1 X181.481 Y108.769 E.01761
G1 X181.04 Y108.336 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3717
G1 X188.9 Y108.336 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y108.336 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-.083 J-1.214 P1  F30000
G1 X79.398 Y115.649 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3717
G1 X70.602 Y115.649 E.29177
G1 X70.602 Y107.902 E.25697
G1 X79.398 Y107.902 E.29177
G1 X79.398 Y115.589 E.25498
G1 X79.79 Y116.041 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3717
G1 X70.21 Y116.041 E.29437
G1 X70.21 Y107.51 E.26213
G1 X79.79 Y107.51 E.29437
G1 X79.79 Y115.981 E.26028
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y115.993 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I1.055 J.606 P1  F30000
G1 X79.05 Y113.801 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3717
G1 X79.05 Y115.3 E.04973
G1 X78.921 Y115.3 E.00428
G1 X72.389 Y108.769 E.3064
G1 X72.471 Y108.769 E.00272
G1 X70.95 Y110.29 E.07135
G1 X70.95 Y115.006 E.15644
G1 X71.245 Y115.3 E.0138
G1 X73.616 Y115.3 E.07866
G1 X79.05 Y109.867 E.25491
G1 X79.05 Y108.769 E.03641
G1 X78.519 Y108.769 E.01761
G1 X71.04 Y108.336 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3717
G1 X78.9 Y108.336 E.29465
; WIPE_START
G1 F24000
G1 X76.9 Y108.336 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-1.209 J.139 P1  F30000
G1 X79.398 Y130.098 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3717
G1 X70.602 Y130.098 E.29177
G1 X70.602 Y122.351 E.25697
G1 X79.398 Y122.351 E.29177
G1 X79.398 Y130.038 E.25498
G1 X79.79 Y130.49 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3717
G1 X70.21 Y130.49 E.29437
G1 X70.21 Y121.959 E.26213
G1 X79.79 Y121.959 E.29437
G1 X79.79 Y130.43 E.26028
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y130.443 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I1.211 J-.121 P1  F30000
G1 X77.015 Y122.7 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3717
G1 X78.644 Y122.7 E.05401
G1 X79.05 Y123.105 E.01904
G1 X79.05 Y125.219 E.0701
G1 X75.037 Y129.231 E.18822
G1 X77.499 Y129.231 E.08166
G1 X70.968 Y122.7 E.3064
G1 X73.893 Y122.7 E.09702
G1 X70.95 Y125.642 E.13803
G1 X70.95 Y127.27 E.05401
G1 X71.04 Y129.664 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3717
G1 X78.9 Y129.664 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X76.9 Y129.664 E-.76
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
G3 Z13.8 I.086 J1.214 P1  F30000
G1 X180.602 Y122.346 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3668
G1 X189.398 Y122.346 E.29177
G1 X189.398 Y129.898 E.2505
G1 X180.602 Y129.898 E.29177
G1 X180.602 Y122.406 E.24851
G1 X180.21 Y121.954 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3668
G1 X189.79 Y121.954 E.29437
G1 X189.79 Y130.29 E.25614
G1 X180.21 Y130.29 E.29437
G1 X180.21 Y122.014 E.25429
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y122.002 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-.808 J.91 P1  F30000
G1 X182.99 Y122.694 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3668
G1 X181.361 Y122.694 E.05401
G1 X180.95 Y123.105 E.01928
G1 X180.95 Y125.219 E.0701
G1 X184.763 Y129.031 E.17884
G1 X182.701 Y129.031 E.06839
G1 X189.037 Y122.694 E.29725
G1 X186.102 Y122.694 E.09736
G1 X189.05 Y125.642 E.13827
G1 X189.05 Y127.27 E.05401
G1 X181.04 Y129.464 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3668
G1 X188.9 Y129.464 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y129.464 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I1.107 J-.505 P1  F30000
G1 X180.602 Y115.654 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3668
G1 X180.602 Y108.102 E.2505
G1 X189.398 Y108.102 E.29177
G1 X189.398 Y115.654 E.2505
G1 X180.662 Y115.654 E.28978
G1 X180.21 Y116.046 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3668
G1 X180.21 Y107.71 E.25614
G1 X189.79 Y107.71 E.29437
G1 X189.79 Y116.046 E.25614
G1 X180.27 Y116.046 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.256 Y114.046 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I.404 J1.148 P1  F30000
G1 X180.95 Y113.801 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3668
G1 X180.95 Y115.305 E.0499
G1 X181.074 Y115.305 E.00411
G1 X187.411 Y108.969 E.29725
G1 X187.729 Y108.969 E.01055
G1 X189.05 Y110.29 E.06196
G1 X189.05 Y115.006 E.15644
G1 X188.75 Y115.305 E.01404
G1 X186.389 Y115.305 E.07832
G1 X180.95 Y109.867 E.25515
G1 X180.95 Y108.969 E.02977
G1 X181.681 Y108.969 E.02424
G1 X181.04 Y108.536 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3668
G1 X188.9 Y108.536 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y108.536 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-.08 J-1.214 P1  F30000
G1 X79.398 Y115.654 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3668
G1 X70.602 Y115.654 E.29177
G1 X70.602 Y108.102 E.2505
G1 X79.398 Y108.102 E.29177
G1 X79.398 Y115.594 E.24851
G1 X79.79 Y116.046 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3668
G1 X70.21 Y116.046 E.29437
G1 X70.21 Y107.71 E.25614
G1 X79.79 Y107.71 E.29437
G1 X79.79 Y115.986 E.25429
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y115.998 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I1.056 J.605 P1  F30000
G1 X79.05 Y113.801 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3668
G1 X79.05 Y115.305 E.0499
G1 X78.926 Y115.305 E.00411
G1 X72.589 Y108.969 E.29725
G1 X72.271 Y108.969 E.01055
G1 X70.95 Y110.29 E.06196
G1 X70.95 Y115.006 E.15644
G1 X71.25 Y115.305 E.01404
G1 X73.611 Y115.305 E.07832
G1 X79.05 Y109.867 E.25515
G1 X79.05 Y108.969 E.02977
G1 X78.319 Y108.969 E.02424
G1 X71.04 Y108.536 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3668
G1 X78.9 Y108.536 E.29465
; WIPE_START
G1 F24000
G1 X76.9 Y108.536 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-1.209 J.141 P1  F30000
G1 X79.398 Y129.898 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3668
G1 X70.602 Y129.898 E.29177
G1 X70.602 Y122.346 E.2505
G1 X79.398 Y122.346 E.29177
G1 X79.398 Y129.838 E.24851
G1 X79.79 Y130.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3668
G1 X70.21 Y130.29 E.29437
G1 X70.21 Y121.954 E.25614
G1 X79.79 Y121.954 E.29437
G1 X79.79 Y130.23 E.25429
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y130.243 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I1.211 J-.125 P1  F30000
G1 X77.01 Y122.694 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3668
G1 X78.639 Y122.694 E.05401
G1 X79.05 Y123.105 E.01928
G1 X79.05 Y125.219 E.0701
G1 X75.237 Y129.031 E.17884
G1 X77.299 Y129.031 E.06839
G1 X70.963 Y122.694 E.29725
G1 X73.898 Y122.694 E.09736
G1 X70.95 Y125.642 E.13827
G1 X70.95 Y127.27 E.05401
G1 X71.04 Y129.464 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3668
G1 X78.9 Y129.464 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X76.9 Y129.464 E-.76
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
G3 Z14 I.084 J1.214 P1  F30000
G1 X180.602 Y122.326 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3631
G1 X189.398 Y122.326 E.29177
G1 X189.398 Y129.698 E.24453
G1 X180.602 Y129.698 E.29177
G1 X180.602 Y122.386 E.24254
G1 X180.21 Y121.934 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3631
G1 X189.79 Y121.934 E.29437
G1 X189.79 Y130.09 E.2506
G1 X180.21 Y130.09 E.29437
G1 X180.21 Y121.994 E.24876
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y121.982 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-.797 J.92 P1  F30000
G1 X183.009 Y122.675 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3631
G1 X181.381 Y122.675 E.05401
G1 X180.95 Y123.105 E.02021
G1 X180.95 Y125.219 E.0701
G1 X184.563 Y128.831 E.16946
G1 X182.901 Y128.831 E.05512
G1 X189.05 Y122.682 E.28845
M73 P85 R5
G1 X189.05 Y125.642 E.09818
G1 X186.082 Y122.675 E.1392
G1 X184.454 Y122.675 E.05401
G1 X181.04 Y129.264 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3631
G1 X188.9 Y129.264 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y129.264 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I1.104 J-.512 P1  F30000
G1 X180.602 Y115.674 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3631
G1 X180.602 Y108.302 E.24453
G1 X189.398 Y108.302 E.29177
G1 X189.398 Y115.674 E.24453
G1 X180.662 Y115.674 E.28978
G1 X180.21 Y116.066 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3631
G1 X180.21 Y107.91 E.2506
G1 X189.79 Y107.91 E.29437
G1 X189.79 Y116.066 E.2506
G1 X180.27 Y116.066 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.255 Y114.066 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I.433 J1.137 P1  F30000
G1 X180.95 Y113.801 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3631
G1 X180.95 Y115.325 E.05056
G1 X181.055 Y115.325 E.00346
G1 X187.211 Y109.169 E.2888
G1 X187.929 Y109.169 E.02382
G1 X189.05 Y110.29 E.05258
G1 X189.05 Y115.006 E.15644
G1 X188.731 Y115.325 E.01497
G1 X186.409 Y115.325 E.07701
G1 X180.95 Y109.867 E.25608
G1 X180.95 Y109.169 E.02314
G1 X181.881 Y109.169 E.03088
G1 X181.04 Y108.736 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3631
G1 X188.9 Y108.736 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y108.736 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-.078 J-1.214 P1  F30000
G1 X79.398 Y115.674 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3631
G1 X70.602 Y115.674 E.29177
G1 X70.602 Y108.302 E.24453
G1 X79.398 Y108.302 E.29177
G1 X79.398 Y115.614 E.24254
G1 X79.79 Y116.066 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3631
G1 X70.21 Y116.066 E.29437
G1 X70.21 Y107.91 E.2506
G1 X79.79 Y107.91 E.29437
G1 X79.79 Y116.006 E.24876
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y116.018 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I1.058 J.601 P1  F30000
G1 X79.05 Y113.801 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3631
G1 X79.05 Y115.325 E.05056
G1 X78.945 Y115.325 E.00346
M73 P86 R5
G1 X72.789 Y109.169 E.2888
G1 X72.071 Y109.169 E.02382
G1 X70.95 Y110.29 E.05258
G1 X70.95 Y115.006 E.15644
G1 X71.27 Y115.325 E.01497
G1 X73.591 Y115.325 E.07701
G1 X79.05 Y109.867 E.25608
G1 X79.05 Y109.169 E.02314
G1 X78.119 Y109.169 E.03088
G1 X71.04 Y108.736 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3631
G1 X78.9 Y108.736 E.29465
; WIPE_START
G1 F24000
G1 X76.9 Y108.736 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-1.208 J.144 P1  F30000
G1 X79.398 Y129.698 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3631
G1 X70.602 Y129.698 E.29177
G1 X70.602 Y122.326 E.24453
G1 X79.398 Y122.326 E.29177
G1 X79.398 Y129.638 E.24254
G1 X79.79 Y130.09 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3631
G1 X70.21 Y130.09 E.29437
G1 X70.21 Y121.934 E.2506
G1 X79.79 Y121.934 E.29437
G1 X79.79 Y130.03 E.24876
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y130.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I1.21 J-.131 P1  F30000
G1 X76.991 Y122.675 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3631
G1 X78.619 Y122.675 E.05401
G1 X79.05 Y123.105 E.02021
G1 X79.05 Y125.219 E.0701
G1 X75.437 Y128.831 E.16946
G1 X77.099 Y128.831 E.05512
G1 X70.95 Y122.682 E.28845
G1 X70.95 Y125.642 E.09818
G1 X73.918 Y122.675 E.1392
G1 X75.546 Y122.675 E.05401
G1 X71.04 Y129.264 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3631
G1 X78.9 Y129.264 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X76.9 Y129.264 E-.76
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
G3 Z14.2 I.082 J1.214 P1  F30000
G1 X180.602 Y122.292 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3589
G1 X189.398 Y122.292 E.29177
G1 X189.398 Y129.498 E.23904
G1 X180.602 Y129.498 E.29177
G1 X180.602 Y122.352 E.23705
G1 X180.21 Y121.9 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3589
G1 X189.79 Y121.9 E.29437
G1 X189.79 Y129.89 E.24551
G1 X180.21 Y129.89 E.29437
G1 X180.21 Y121.96 E.24367
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y121.947 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-.778 J.936 P1  F30000
G1 X183.044 Y122.64 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3589
G1 X181.416 Y122.64 E.05401
G1 X180.95 Y123.105 E.02183
G1 X180.95 Y125.219 E.0701
G1 X184.363 Y128.631 E.16008
G1 X183.101 Y128.631 E.04185
G1 X189.05 Y122.682 E.27907
G1 X189.05 Y125.642 E.09818
G1 X186.048 Y122.64 E.14082
G1 X184.42 Y122.64 E.05401
G1 X181.04 Y129.064 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3589
G1 X188.9 Y129.064 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y129.064 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I1.101 J-.519 P1  F30000
G1 X180.602 Y115.708 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3589
G1 X180.602 Y108.502 E.23904
G1 X189.398 Y108.502 E.29177
G1 X189.398 Y115.708 E.23904
G1 X180.662 Y115.708 E.28978
G1 X180.21 Y116.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3589
G1 X180.21 Y108.11 E.24551
G1 X189.79 Y108.11 E.29437
G1 X189.79 Y116.1 E.24551
G1 X180.27 Y116.1 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.255 Y114.1 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I.481 J1.118 P1  F30000
G1 X180.95 Y113.801 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3589
G1 X180.95 Y115.36 E.0517
G1 X181.02 Y115.36 E.00231
G1 X187.011 Y109.369 E.28103
G1 X188.129 Y109.369 E.03709
G1 X189.05 Y110.29 E.0432
G1 X189.05 Y115.006 E.15644
G1 X188.696 Y115.36 E.01659
G1 X186.443 Y115.36 E.07472
G1 X180.95 Y109.867 E.25769
G1 X180.95 Y109.369 E.0165
G1 X182.081 Y109.369 E.03751
G1 X181.04 Y108.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3589
G1 X188.9 Y108.936 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y108.936 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-.077 J-1.215 P1  F30000
G1 X79.398 Y115.708 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3589
G1 X70.602 Y115.708 E.29177
G1 X70.602 Y108.502 E.23904
G1 X79.398 Y108.502 E.29177
G1 X79.398 Y115.648 E.23705
G1 X79.79 Y116.1 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3589
G1 X70.21 Y116.1 E.29437
G1 X70.21 Y108.11 E.24551
G1 X79.79 Y108.11 E.29437
G1 X79.79 Y116.04 E.24367
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y116.053 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I1.062 J.594 P1  F30000
G1 X79.05 Y113.801 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3589
G1 X79.05 Y115.36 E.0517
G1 X78.98 Y115.36 E.00231
G1 X72.989 Y109.369 E.28103
G1 X71.871 Y109.369 E.03709
G1 X70.95 Y110.29 E.0432
G1 X70.95 Y115.006 E.15644
G1 X71.304 Y115.36 E.01659
G1 X73.557 Y115.36 E.07472
G1 X79.05 Y109.867 E.25769
G1 X79.05 Y109.369 E.0165
G1 X77.919 Y109.369 E.03751
G1 X71.04 Y108.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3589
G1 X78.9 Y108.936 E.29465
; WIPE_START
G1 F24000
G1 X76.9 Y108.936 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-1.208 J.147 P1  F30000
G1 X79.398 Y129.498 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3589
G1 X70.602 Y129.498 E.29177
G1 X70.602 Y122.292 E.23904
G1 X79.398 Y122.292 E.29177
G1 X79.398 Y129.438 E.23705
G1 X79.79 Y129.89 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3589
G1 X70.21 Y129.89 E.29437
G1 X70.21 Y121.9 E.24551
G1 X79.79 Y121.9 E.29437
G1 X79.79 Y129.83 E.24367
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y129.843 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I1.209 J-.14 P1  F30000
G1 X76.956 Y122.64 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3589
G1 X78.584 Y122.64 E.05401
G1 X79.05 Y123.105 E.02183
G1 X79.05 Y125.219 E.0701
G1 X75.637 Y128.631 E.16008
G1 X76.899 Y128.631 E.04185
G1 X70.95 Y122.682 E.27907
G1 X70.95 Y125.642 E.09818
G1 X73.952 Y122.64 E.14082
G1 X72.324 Y122.64 E.05401
G1 X71.04 Y129.064 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3589
G1 X78.9 Y129.064 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X76.9 Y129.064 E-.76
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
G3 Z14.4 I.08 J1.214 P1  F30000
G1 X180.602 Y122.241 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3559
G1 X189.398 Y122.241 E.29177
G1 X189.398 Y129.298 E.23408
G1 X180.602 Y129.298 E.29177
G1 X180.602 Y122.301 E.23209
G1 X180.21 Y121.859 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3559
G1 X189.79 Y121.859 E.29437
G1 X189.79 Y129.69 E.24063
G1 X180.21 Y129.69 E.29437
G1 X180.21 Y121.919 E.23879
M204 S10000
; WIPE_START
G1 F24000
G1 X182.21 Y121.906 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-.744 J.963 P1  F30000
G1 X183.094 Y122.59 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3559
G1 X181.466 Y122.59 E.05401
G1 X180.95 Y123.105 E.02419
G1 X180.95 Y125.219 E.0701
G1 X184.163 Y128.431 E.15069
G1 X183.301 Y128.431 E.02858
G1 X189.05 Y122.682 E.26969
G1 X189.05 Y125.642 E.09818
G1 X185.997 Y122.59 E.14318
G1 X184.369 Y122.59 E.05401
G1 X181.04 Y128.864 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3559
G1 X188.9 Y128.864 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y128.864 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I1.097 J-.527 P1  F30000
G1 X180.602 Y115.759 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3559
G1 X180.602 Y108.702 E.23408
G1 X189.398 Y108.702 E.29177
G1 X189.398 Y115.759 E.23408
G1 X180.662 Y115.759 E.28978
G1 X180.21 Y116.141 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3559
G1 X180.21 Y108.31 E.24063
G1 X189.79 Y108.31 E.29437
G1 X189.79 Y116.141 E.24063
G1 X180.27 Y116.141 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.255 Y114.141 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I.534 J1.093 P1  F30000
G1 X180.95 Y113.801 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3559
G1 X180.97 Y115.41 E.05338
G1 X186.811 Y109.569 E.27402
G1 X188.329 Y109.569 E.05036
G1 X189.05 Y110.29 E.03382
G1 X189.05 Y115.006 E.15644
G1 X188.646 Y115.41 E.01896
G1 X186.494 Y115.41 E.07137
G1 X180.95 Y109.867 E.26006
G1 X180.95 Y109.569 E.00987
G1 X182.281 Y109.569 E.04415
G1 X181.04 Y109.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3559
G1 X188.9 Y109.136 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y109.136 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-.075 J-1.215 P1  F30000
G1 X79.398 Y115.759 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3559
G1 X70.602 Y115.759 E.29177
G1 X70.602 Y108.702 E.23408
G1 X79.398 Y108.702 E.29177
G1 X79.398 Y115.699 E.23209
G1 X79.79 Y116.141 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3559
G1 X70.21 Y116.141 E.29437
G1 X70.21 Y108.31 E.24063
G1 X79.79 Y108.31 E.29437
G1 X79.79 Y116.081 E.23879
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y116.094 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I1.067 J.586 P1  F30000
G1 X79.05 Y113.801 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3559
G1 X79.03 Y115.41 E.05338
G1 X73.189 Y109.569 E.27402
G1 X71.671 Y109.569 E.05036
G1 X70.95 Y110.29 E.03382
G1 X70.95 Y115.006 E.15644
G1 X71.354 Y115.41 E.01896
G1 X73.506 Y115.41 E.07137
G1 X79.05 Y109.867 E.26006
G1 X79.05 Y109.569 E.00987
G1 X77.719 Y109.569 E.04415
G1 X78.96 Y109.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F3559
G1 X71.1 Y109.136 E.29465
; WIPE_START
G1 F24000
G1 X73.1 Y109.136 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-1.162 J.363 P1  F30000
G1 X79.398 Y129.298 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3559
G1 X70.602 Y129.298 E.29177
G1 X70.602 Y122.241 E.23408
G1 X79.398 Y122.241 E.29177
G1 X79.398 Y129.238 E.23209
G1 X79.79 Y129.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3559
G1 X70.21 Y129.69 E.29437
G1 X70.21 Y121.859 E.24063
G1 X79.79 Y121.859 E.29437
G1 X79.79 Y129.63 E.23879
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y129.643 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I1.208 J-.151 P1  F30000
G1 X76.906 Y122.59 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3559
G1 X78.534 Y122.59 E.05401
G1 X79.05 Y123.105 E.02419
G1 X79.05 Y125.219 E.0701
G1 X75.837 Y128.431 E.1507
G1 X76.699 Y128.431 E.02859
G1 X70.95 Y122.682 E.26969
G1 X70.95 Y125.642 E.09818
G1 X74.003 Y122.59 E.14318
G1 X72.374 Y122.59 E.05401
G1 X71.04 Y128.864 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3559
G1 X78.9 Y128.864 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X76.9 Y128.864 E-.76
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
G3 Z14.6 I.078 J1.214 P1  F30000
G1 X180.602 Y122.175 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3524
G1 X189.398 Y122.175 E.29177
G1 X189.398 Y129.098 E.22965
G1 X180.602 Y129.098 E.29177
G1 X180.602 Y122.235 E.22766
G1 X180.21 Y121.808 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3524
G1 X180.21 Y121.783 E.00079
G1 X189.79 Y121.783 E.29437
G1 X189.79 Y121.808 E.00079
G1 X189.79 Y129.49 E.23603
G1 X180.21 Y129.49 E.29437
G1 X180.21 Y121.868 E.23419
M204 S10000
; WIPE_START
G1 F24000
G1 X180.21 Y121.783 E-.03252
G1 X182.124 Y121.783 E-.72748
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-.707 J.99 P1  F30000
G1 X183.161 Y122.523 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3524
G1 X181.533 Y122.523 E.05401
G1 X180.95 Y123.105 E.02732
G1 X180.95 Y125.219 E.0701
G1 X183.963 Y128.231 E.14131
G1 X183.501 Y128.231 E.01532
G1 X189.05 Y122.682 E.2603
G1 X189.05 Y125.642 E.09818
G1 X185.931 Y122.523 E.14631
G1 X184.303 Y122.523 E.05401
G1 X181.04 Y128.664 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3524
G1 X188.9 Y128.664 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y128.664 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I1.093 J-.536 P1  F30000
G1 X180.602 Y115.825 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3524
G1 X180.602 Y108.902 E.22965
G1 X189.398 Y108.902 E.29177
G1 X189.398 Y115.825 E.22965
M73 P87 R5
G1 X180.662 Y115.825 E.28978
G1 X180.21 Y116.217 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3524
G1 X180.21 Y116.192 E.00079
G1 X180.21 Y108.51 E.23603
G1 X189.79 Y108.51 E.29437
G1 X189.79 Y116.192 E.23603
G1 X189.79 Y116.217 E.00079
G1 X180.27 Y116.217 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.21 Y116.192 E-.02479
G1 X180.21 Y114.257 E-.73521
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-.566 J1.077 P1  F30000
G1 X182.531 Y115.477 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3524
G1 X180.95 Y115.477 E.05244
G1 X180.95 Y115.429 E.00157
G1 X186.611 Y109.769 E.26554
G1 X188.529 Y109.769 E.06363
G1 X189.05 Y110.29 E.02443
G1 X189.05 Y115.006 E.15644
G1 X188.579 Y115.477 E.02208
G1 X186.561 Y115.477 E.06695
G1 X180.95 Y109.867 E.26319
G1 X180.95 Y109.769 E.00323
G1 X182.481 Y109.769 E.05078
G1 X188.96 Y109.336 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502906
G1 F3524
G1 X181.1 Y109.336 E.29465
; WIPE_START
G1 F24000
G1 X183.1 Y109.336 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-.076 J-1.215 P1  F30000
G1 X79.398 Y115.825 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3524
G1 X70.602 Y115.825 E.29177
G1 X70.602 Y108.902 E.22965
G1 X79.398 Y108.902 E.29177
G1 X79.398 Y115.765 E.22766
G1 X79.79 Y116.192 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3524
G1 X79.79 Y116.217 E.00079
G1 X70.21 Y116.217 E.29437
G1 X70.21 Y116.192 E.00079
G1 X70.21 Y108.51 E.23603
G1 X79.79 Y108.51 E.29437
G1 X79.79 Y116.132 E.23419
M204 S10000
; WIPE_START
G1 F24000
G1 X79.79 Y116.217 E-.03252
G1 X77.876 Y116.217 E-.72748
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I1.067 J-.586 P1  F30000
G1 X77.469 Y115.477 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3524
G1 X79.05 Y115.477 E.05244
G1 X79.05 Y115.429 E.00157
G1 X73.389 Y109.769 E.26554
G1 X71.471 Y109.769 E.06363
G1 X70.95 Y110.29 E.02443
G1 X70.95 Y115.006 E.15644
G1 X71.421 Y115.477 E.02208
G1 X73.439 Y115.477 E.06695
G1 X79.05 Y109.867 E.26319
G1 X79.05 Y109.769 E.00323
G1 X77.519 Y109.769 E.05078
G1 X71.04 Y109.336 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3524
G1 X78.9 Y109.336 E.29465
; WIPE_START
G1 F24000
G1 X76.9 Y109.336 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-1.207 J.153 P1  F30000
G1 X79.398 Y129.098 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3524
G1 X70.602 Y129.098 E.29177
G1 X70.602 Y122.175 E.22965
G1 X79.398 Y122.175 E.29177
G1 X79.398 Y129.038 E.22766
G1 X79.79 Y129.49 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3524
G1 X70.21 Y129.49 E.29437
G1 X70.21 Y121.808 E.23603
G1 X70.21 Y121.783 E.00079
G1 X79.79 Y121.783 E.29437
G1 X79.79 Y121.808 E.00079
G1 X79.79 Y129.43 E.23419
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y129.443 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I1.206 J-.166 P1  F30000
G1 X76.839 Y122.523 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3524
G1 X78.467 Y122.523 E.05401
G1 X79.05 Y123.105 E.02732
G1 X79.05 Y125.219 E.0701
G1 X76.037 Y128.231 E.14131
G1 X76.499 Y128.231 E.01532
G1 X70.95 Y122.682 E.2603
G1 X70.95 Y125.642 E.09818
G1 X74.069 Y122.523 E.14631
G1 X72.441 Y122.523 E.05401
G1 X71.04 Y128.664 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3524
G1 X78.9 Y128.664 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X76.9 Y128.664 E-.76
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
G3 Z14.8 I.077 J1.215 P1  F30000
G1 X180.602 Y122.09 Z14.8
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3492
G1 X189.398 Y122.09 E.29177
G1 X189.398 Y128.898 E.22582
G1 X180.602 Y128.898 E.29177
G1 X180.602 Y122.15 E.22383
G1 X180.21 Y121.742 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3492
G1 X180.21 Y121.698 E.00133
G1 X189.79 Y121.698 E.29437
G1 X189.79 Y121.742 E.00133
G1 X189.79 Y129.29 E.23194
G1 X180.21 Y129.29 E.29437
G1 X180.21 Y121.802 E.23009
M204 S10000
; WIPE_START
G1 F24000
G1 X180.21 Y121.698 E-.03931
G1 X182.107 Y121.698 E-.72069
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-.663 J1.02 P1  F30000
G1 X183.245 Y122.439 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3492
G1 X181.617 Y122.439 E.05401
G1 X180.95 Y123.105 E.03128
G1 X180.95 Y125.219 E.0701
G1 X183.763 Y128.031 E.13193
G1 X183.701 Y128.031 E.00205
G1 X189.05 Y122.682 E.25092
G1 X189.05 Y125.642 E.09818
G1 X185.846 Y122.439 E.15027
G1 X184.218 Y122.439 E.05401
G1 X181.04 Y128.464 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3492
G1 X188.9 Y128.464 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y128.464 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I1.088 J-.546 P1  F30000
G1 X180.602 Y115.91 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3492
G1 X180.602 Y109.102 E.22582
G1 X189.398 Y109.102 E.29177
G1 X189.398 Y115.91 E.22582
G1 X180.662 Y115.91 E.28978
G1 X180.21 Y116.302 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3492
G1 X180.21 Y116.258 E.00133
G1 X180.21 Y108.71 E.23194
G1 X189.79 Y108.71 E.29437
G1 X189.79 Y116.258 E.23194
G1 X189.79 Y116.302 E.00133
G1 X180.27 Y116.302 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.21 Y116.258 E-.02815
G1 X180.21 Y114.332 E-.73185
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-.586 J1.067 P1  F30000
G1 X182.447 Y115.561 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3492
G1 X180.95 Y115.561 E.04964
G1 X180.95 Y115.429 E.00437
G1 X186.411 Y109.969 E.25616
G1 X188.729 Y109.969 E.0769
G1 X189.05 Y110.29 E.01505
G1 X189.05 Y115.006 E.15644
G1 X188.495 Y115.561 E.02604
G1 X186.645 Y115.561 E.06135
G1 X181.053 Y109.969 E.26234
G1 X180.95 Y109.969 E.0034
G1 X180.95 Y111.495 E.05061
G1 X181.04 Y109.536 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3492
G1 X188.9 Y109.536 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y109.536 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-.072 J-1.215 P1  F30000
G1 X79.398 Y115.91 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3492
G1 X70.602 Y115.91 E.29177
G1 X70.602 Y109.102 E.22582
G1 X79.398 Y109.102 E.29177
G1 X79.398 Y115.85 E.22383
G1 X79.79 Y116.258 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3492
G1 X79.79 Y116.302 E.00133
G1 X70.21 Y116.302 E.29437
G1 X70.21 Y116.258 E.00133
G1 X70.21 Y108.71 E.23194
G1 X79.79 Y108.71 E.29437
G1 X79.79 Y116.198 E.23009
M204 S10000
; WIPE_START
G1 F24000
G1 X79.79 Y116.302 E-.03931
G1 X77.893 Y116.302 E-.72069
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I1.106 J-.508 P1  F30000
G1 X77.553 Y115.561 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3492
G1 X79.05 Y115.561 E.04964
G1 X79.05 Y115.429 E.00437
G1 X73.589 Y109.969 E.25616
G1 X71.271 Y109.969 E.0769
G1 X70.95 Y110.29 E.01505
G1 X70.95 Y115.006 E.15644
G1 X71.505 Y115.561 E.02604
G1 X73.355 Y115.561 E.06135
G1 X78.947 Y109.969 E.26234
G1 X79.05 Y109.969 E.0034
G1 X79.05 Y111.495 E.05061
G1 X71.04 Y109.536 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3492
G1 X78.9 Y109.536 E.29465
; WIPE_START
G1 F24000
G1 X76.9 Y109.536 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-1.207 J.156 P1  F30000
G1 X79.398 Y128.898 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3492
G1 X70.602 Y128.898 E.29177
G1 X70.602 Y122.09 E.22582
G1 X79.398 Y122.09 E.29177
G1 X79.398 Y128.838 E.22383
G1 X79.79 Y129.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3492
G1 X70.21 Y129.29 E.29437
G1 X70.21 Y121.742 E.23194
G1 X70.21 Y121.698 E.00133
G1 X79.79 Y121.698 E.29437
G1 X79.79 Y121.742 E.00133
G1 X79.79 Y129.23 E.23009
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y129.243 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I1.203 J-.183 P1  F30000
G1 X76.755 Y122.439 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3492
G1 X78.383 Y122.439 E.05401
G1 X79.05 Y123.105 E.03128
G1 X79.05 Y125.219 E.0701
G1 X76.237 Y128.031 E.13193
G1 X76.299 Y128.031 E.00205
G1 X70.95 Y122.682 E.25092
G1 X70.95 Y125.642 E.09818
G1 X74.154 Y122.439 E.15027
G1 X72.525 Y122.439 E.05401
G1 X71.04 Y128.464 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3492
G1 X78.9 Y128.464 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X76.9 Y128.464 E-.76
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
G3 Z15 I.076 J1.215 P1  F30000
G1 X180.602 Y121.986 Z15
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3471
G1 X189.398 Y121.986 E.29177
G1 X189.398 Y128.698 E.22265
G1 X180.602 Y128.698 E.29177
G1 X180.602 Y122.046 E.22066
G1 X180.21 Y121.657 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3471
G1 X180.21 Y121.594 E.00195
G1 X189.79 Y121.594 E.29437
G1 X189.79 Y121.657 E.00195
G1 X189.79 Y129.09 E.22838
G1 X180.21 Y129.09 E.29437
G1 X180.21 Y121.717 E.22654
M204 S10000
; WIPE_START
G1 F24000
G1 X180.21 Y121.594 E-.04696
G1 X182.086 Y121.594 E-.71304
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-.615 J1.05 P1  F30000
G1 X183.35 Y122.334 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3471
G1 X181.722 Y122.334 E.05401
G1 X180.95 Y123.105 E.03619
G1 X180.95 Y125.219 E.0701
G1 X183.563 Y127.831 E.12255
G1 X183.901 Y127.831 E.01122
G1 X189.05 Y122.682 E.24154
G1 X189.05 Y125.642 E.09818
G1 X185.742 Y122.334 E.15518
G1 X184.114 Y122.334 E.05401
G1 X181.04 Y128.264 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3471
G1 X188.9 Y128.264 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y128.264 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I1.082 J-.556 P1  F30000
G1 X180.602 Y116.014 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3471
G1 X180.602 Y109.302 E.22265
G1 X189.398 Y109.302 E.29177
G1 X189.398 Y116.014 E.22265
G1 X180.662 Y116.014 E.28978
G1 X180.21 Y116.406 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3471
G1 X180.21 Y116.343 E.00195
G1 X180.21 Y108.91 E.22838
G1 X189.79 Y108.91 E.29437
G1 X189.79 Y116.343 E.22838
G1 X189.79 Y116.406 E.00195
G1 X180.27 Y116.406 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.21 Y116.343 E-.03322
G1 X180.21 Y114.43 E-.72678
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-.61 J1.053 P1  F30000
G1 X182.342 Y115.666 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3471
G1 X180.95 Y115.666 E.04617
G1 X180.95 Y115.429 E.00784
G1 X186.211 Y110.169 E.24677
G1 X188.929 Y110.169 E.09016
G1 X189.05 Y110.29 E.00567
G1 X189.05 Y115.006 E.15644
G1 X188.39 Y115.666 E.03095
G1 X186.75 Y115.666 E.05441
G1 X181.253 Y110.169 E.25786
G1 X180.95 Y110.169 E.01003
G1 X180.95 Y111.495 E.04398
G1 X181.04 Y109.736 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3471
G1 X188.9 Y109.736 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y109.736 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-.071 J-1.215 P1  F30000
G1 X79.398 Y116.014 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3471
G1 X70.602 Y116.014 E.29177
G1 X70.602 Y109.302 E.22265
G1 X79.398 Y109.302 E.29177
G1 X79.398 Y115.954 E.22066
G1 X79.79 Y116.343 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3471
G1 X79.79 Y116.406 E.00195
G1 X70.21 Y116.406 E.29437
G1 X70.21 Y116.343 E.00195
G1 X70.21 Y108.91 E.22838
G1 X79.79 Y108.91 E.29437
G1 X79.79 Y116.283 E.22654
M204 S10000
; WIPE_START
G1 F24000
G1 X79.79 Y116.406 E-.04696
G1 X77.914 Y116.406 E-.71304
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I1.15 J-.398 P1  F30000
G1 X77.658 Y115.666 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3471
G1 X79.05 Y115.666 E.04617
G1 X79.05 Y115.429 E.00784
G1 X73.789 Y110.169 E.24677
G1 X71.071 Y110.169 E.09016
G1 X70.95 Y110.29 E.00567
G1 X70.95 Y115.006 E.15644
G1 X71.61 Y115.666 E.03095
G1 X73.25 Y115.666 E.05441
G1 X78.747 Y110.169 E.25786
G1 X79.05 Y110.169 E.01003
G1 X79.05 Y111.495 E.04398
G1 X71.04 Y109.736 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3471
G1 X78.9 Y109.736 E.29465
; WIPE_START
G1 F24000
G1 X76.9 Y109.736 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-1.207 J.159 P1  F30000
G1 X79.398 Y128.698 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3471
G1 X70.602 Y128.698 E.29177
G1 X70.602 Y121.986 E.22265
G1 X79.398 Y121.986 E.29177
G1 X79.398 Y128.638 E.22066
G1 X79.79 Y129.09 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3471
G1 X70.21 Y129.09 E.29437
G1 X70.21 Y121.657 E.22838
G1 X70.21 Y121.594 E.00195
G1 X79.79 Y121.594 E.29437
G1 X79.79 Y121.657 E.00195
G1 X79.79 Y129.03 E.22654
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y129.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I1.2 J-.204 P1  F30000
G1 X76.65 Y122.334 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P88 R5
G1 F3471
G1 X78.278 Y122.334 E.05401
G1 X79.05 Y123.105 E.03619
G1 X79.05 Y125.219 E.0701
G1 X76.437 Y127.831 E.12255
G1 X76.099 Y127.831 E.01122
G1 X70.95 Y122.682 E.24154
G1 X70.95 Y125.642 E.09818
G1 X74.258 Y122.334 E.15518
G1 X72.63 Y122.334 E.05401
G1 X71.04 Y128.264 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3471
G1 X78.9 Y128.264 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X76.9 Y128.264 E-.76
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
G3 Z15.2 I.075 J1.215 P1  F30000
G1 X180.602 Y121.86 Z15.2
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3462
G1 X189.398 Y121.86 E.29177
G1 X189.398 Y128.498 E.22021
G1 X180.602 Y128.498 E.29177
G1 X180.602 Y121.92 E.21822
G1 X180.21 Y121.553 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3462
G1 X180.21 Y121.471 E.00252
G1 F3000
G1 X189.79 Y121.471 E.29437
G1 F3462
G1 X189.79 Y121.553 E.00252
G1 X189.79 Y128.89 E.22545
G1 X180.21 Y128.89 E.29437
G1 X180.21 Y121.613 E.22361
M204 S10000
; WIPE_START
G1 F24000
G1 X180.21 Y121.471 E-.05396
G1 X182.068 Y121.471 E-.70604
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-.564 J1.078 P1  F30000
G1 X183.476 Y122.208 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3462
G1 X181.848 Y122.208 E.05401
G1 X180.95 Y123.105 E.04211
G1 X180.95 Y125.219 E.0701
G1 X183.363 Y127.631 E.11317
G1 X184.101 Y127.631 E.02449
G1 X189.05 Y122.682 E.23216
G1 X189.05 Y125.642 E.09818
G1 X185.616 Y122.208 E.1611
G1 X187.244 Y122.208 E.05401
G1 X188.96 Y128.064 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F3462
G1 X181.1 Y128.064 E.29465
; WIPE_START
G1 F24000
G1 X183.1 Y128.064 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I1.191 J-.249 P1  F30000
G1 X180.602 Y116.14 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3462
G1 X180.602 Y109.502 E.22021
G1 X189.398 Y109.502 E.29177
G1 X189.398 Y116.14 E.22021
G1 X180.662 Y116.14 E.28978
G1 X180.21 Y116.529 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3462
G1 X180.21 Y116.447 E.00252
G1 X180.21 Y109.11 E.22545
G1 X189.79 Y109.11 E.29437
G1 X189.79 Y116.447 E.22545
G1 X189.79 Y116.529 E.00252
G1 F3000
G1 X180.27 Y116.529 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.21 Y116.447 E-.03861
G1 X180.21 Y114.549 E-.72139
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-.641 J1.034 P1  F30000
M73 P88 R4
G1 X182.216 Y115.792 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3462
G1 X180.95 Y115.792 E.04199
G1 X180.95 Y115.429 E.01203
G1 X186.011 Y110.369 E.23739
G1 X181.453 Y110.369 E.15119
G1 X186.876 Y115.792 E.2544
G1 X188.264 Y115.792 E.04604
G1 X189.05 Y115.006 E.03687
G1 X189.05 Y113.378 E.05401
G1 X181.04 Y109.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3462
G1 X188.9 Y109.936 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y109.936 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-.07 J-1.215 P1  F30000
G1 X79.398 Y116.14 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3462
G1 X70.602 Y116.14 E.29177
G1 X70.602 Y109.502 E.22021
G1 X79.398 Y109.502 E.29177
G1 X79.398 Y116.08 E.21821
G1 X79.79 Y116.447 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3462
G1 X79.79 Y116.529 E.00252
G1 F3000
G1 X70.21 Y116.529 E.29437
G1 F3462
G1 X70.21 Y116.447 E.00252
G1 X70.21 Y109.11 E.22545
G1 X79.79 Y109.11 E.29437
G1 X79.79 Y116.387 E.22361
M204 S10000
; WIPE_START
G1 F24000
G1 X79.79 Y116.529 E-.05396
G1 X77.932 Y116.529 E-.70604
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I1.193 J-.24 P1  F30000
G1 X77.784 Y115.792 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3462
G1 X79.05 Y115.792 E.04198
G1 X79.05 Y115.429 E.01203
G1 X73.989 Y110.369 E.23739
G1 X78.547 Y110.369 E.15119
G1 X73.124 Y115.792 E.2544
G1 X71.736 Y115.792 E.04604
G1 X70.95 Y115.006 E.03687
G1 X70.95 Y113.378 E.05401
G1 X71.04 Y109.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3462
G1 X78.9 Y109.936 E.29465
; WIPE_START
G1 F24000
G1 X76.9 Y109.936 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-1.206 J.162 P1  F30000
G1 X79.398 Y128.498 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3462
G1 X70.602 Y128.498 E.29177
G1 X70.602 Y121.86 E.22021
G1 X79.398 Y121.86 E.29177
G1 X79.398 Y128.438 E.21822
G1 X79.79 Y128.89 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3462
G1 X70.21 Y128.89 E.29437
G1 X70.21 Y121.553 E.22545
G1 X70.21 Y121.471 E.00252
G1 F3000
G1 X79.79 Y121.471 E.29437
G1 F3462
G1 X79.79 Y121.553 E.00252
G1 X79.79 Y128.83 E.22361
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y128.843 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I1.195 J-.228 P1  F30000
G1 X76.524 Y122.208 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3462
G1 X78.152 Y122.208 E.05401
G1 X79.05 Y123.105 E.04211
G1 X79.05 Y125.219 E.0701
G1 X76.637 Y127.631 E.11317
G1 X75.899 Y127.631 E.02449
G1 X70.95 Y122.682 E.23216
G1 X70.95 Y125.642 E.09818
G1 X74.384 Y122.208 E.1611
G1 X72.756 Y122.208 E.05401
G1 X71.04 Y128.064 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502912
G1 F3462
G1 X78.9 Y128.064 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X76.9 Y128.064 E-.76
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
G3 Z15.4 I.074 J1.215 P1  F30000
G1 X180.602 Y121.707 Z15.4
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3439
G1 X189.398 Y121.707 E.29177
G1 X189.398 Y128.298 E.21863
G1 X180.602 Y128.298 E.29177
G1 X180.602 Y121.767 E.21664
G1 X180.21 Y121.427 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3439
G1 X180.21 Y121.345 E.00252
G1 F3000
G1 X180.21 Y121.315 E.00091
G1 X189.79 Y121.315 E.29437
G1 X189.79 Y121.345 E.00091
G1 F3439
G1 X189.79 Y121.427 E.00252
G1 X189.79 Y128.69 E.22319
G1 X180.21 Y128.69 E.29437
G1 X180.21 Y121.487 E.22134
M204 S10000
; WIPE_START
G1 F24000
G1 X180.21 Y121.345 E-.05396
G1 X180.21 Y121.315 E-.01121
G1 X182.038 Y121.315 E-.69483
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-.514 J1.103 P1  F30000
G1 X183.629 Y122.055 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3439
G1 X182 Y122.055 E.05401
G1 X180.95 Y123.105 E.04926
G1 X180.95 Y125.219 E.0701
G1 X183.163 Y127.431 E.10378
G1 X184.301 Y127.431 E.03776
G1 X189.05 Y122.682 E.22277
G1 X189.05 Y125.642 E.09818
G1 X185.463 Y122.055 E.16825
G1 X187.091 Y122.055 E.05401
G1 X181.04 Y127.864 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502912
G1 F3439
G1 X188.9 Y127.864 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y127.864 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I1.069 J-.582 P1  F30000
G1 X180.602 Y116.293 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3439
G1 X180.602 Y109.702 E.21863
G1 X189.398 Y109.702 E.29177
G1 X189.398 Y116.293 E.21863
G1 X180.662 Y116.293 E.28978
G1 X180.21 Y116.685 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X180.21 Y116.655 E.00091
G1 F3439
G1 X180.21 Y116.573 E.00252
G1 X180.21 Y109.31 E.22319
G1 X189.79 Y109.31 E.29437
G1 X189.79 Y116.573 E.22319
G1 X189.79 Y116.655 E.00252
G1 F3000
G1 X189.79 Y116.685 E.00091
G1 X180.27 Y116.685 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.21 Y116.655 E-.02541
G1 X180.21 Y116.573 E-.03116
G1 X180.21 Y114.722 E-.70343
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-.67 J1.016 P1  F30000
G1 X182.064 Y115.945 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3439
G1 X180.95 Y115.945 E.03693
G1 X180.95 Y115.429 E.01709
G1 X185.811 Y110.569 E.22801
G1 X181.653 Y110.569 E.13792
G1 X187.028 Y115.945 E.25218
G1 X188.111 Y115.945 E.03592
G1 X189.05 Y115.006 E.04403
G1 X189.05 Y113.378 E.05401
G1 X181.04 Y110.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3439
G1 X188.9 Y110.136 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y110.136 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-.07 J-1.215 P1  F30000
G1 X79.398 Y116.293 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3439
G1 X70.602 Y116.293 E.29177
G1 X70.602 Y109.702 E.21863
G1 X79.398 Y109.702 E.29177
G1 X79.398 Y116.233 E.21664
G1 X79.79 Y116.573 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3439
G1 X79.79 Y116.655 E.00252
G1 F3000
G1 X79.79 Y116.685 E.00091
G1 X70.21 Y116.685 E.29437
G1 X70.21 Y116.655 E.00091
G1 F3439
G1 X70.21 Y116.573 E.00252
G1 X70.21 Y109.31 E.22319
G1 X79.79 Y109.31 E.29437
G1 X79.79 Y116.513 E.22134
M204 S10000
; WIPE_START
G1 F24000
G1 X79.79 Y116.655 E-.05396
G1 X79.79 Y116.685 E-.01121
G1 X77.962 Y116.685 E-.69483
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I1.216 J-.041 P1  F30000
G1 X77.936 Y115.945 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3439
G1 X79.05 Y115.945 E.03693
G1 X79.05 Y115.429 E.01709
G1 X74.189 Y110.569 E.22801
G1 X78.347 Y110.569 E.13792
G1 X72.972 Y115.945 E.25218
G1 X71.889 Y115.945 E.03592
G1 X70.95 Y115.006 E.04403
G1 X70.95 Y113.378 E.05401
G1 X71.04 Y110.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3439
G1 X78.9 Y110.136 E.29465
; WIPE_START
G1 F24000
G1 X76.9 Y110.136 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-1.206 J.166 P1  F30000
G1 X79.398 Y128.298 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3439
G1 X70.602 Y128.298 E.29177
G1 X70.602 Y121.707 E.21863
G1 X79.398 Y121.707 E.29177
G1 X79.398 Y128.238 E.21664
G1 X79.79 Y128.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3439
G1 X70.21 Y128.69 E.29437
G1 X70.21 Y121.427 E.22319
G1 X70.21 Y121.345 E.00252
G1 F3000
G1 X70.21 Y121.315 E.00091
G1 X79.79 Y121.315 E.29437
G1 X79.79 Y121.345 E.00091
G1 F3439
G1 X79.79 Y121.427 E.00252
G1 X79.79 Y128.63 E.22134
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y128.643 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I1.19 J-.256 P1  F30000
G1 X76.371 Y122.055 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3439
G1 X78 Y122.055 E.05401
G1 X79.05 Y123.105 E.04926
G1 X79.05 Y125.219 E.0701
G1 X76.837 Y127.431 E.10378
G1 X75.699 Y127.431 E.03776
G1 X70.95 Y122.682 E.22277
G1 X70.95 Y125.642 E.09818
G1 X74.537 Y122.055 E.16825
G1 X72.909 Y122.055 E.05401
G1 X71.04 Y127.864 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502912
G1 F3439
G1 X78.9 Y127.864 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X76.9 Y127.864 E-.76
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
G3 Z15.6 I.074 J1.215 P1  F30000
G1 X180.602 Y121.521 Z15.6
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3427
G1 X189.398 Y121.521 E.29177
G1 X189.398 Y128.098 E.21816
G1 X180.602 Y128.098 E.29177
G1 X180.602 Y121.581 E.21617
G1 X180.21 Y121.274 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3427
G1 X180.21 Y121.192 E.00252
G1 F3000
G1 X180.21 Y121.129 E.00193
G1 X189.79 Y121.129 E.29437
G1 X189.79 Y121.192 E.00193
G1 F3427
G1 X189.79 Y121.274 E.00252
G1 X189.79 Y128.49 E.22173
G1 X180.21 Y128.49 E.29437
G1 X180.21 Y121.334 E.21988
M204 S10000
; WIPE_START
G1 F24000
G1 X180.21 Y121.192 E-.05396
G1 X180.21 Y121.129 E-.02386
G1 X182.005 Y121.129 E-.68218
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-.461 J1.126 P1  F30000
G1 X183.815 Y121.87 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3427
G1 X182.186 Y121.87 E.05401
G1 X180.95 Y123.105 E.05798
G1 X180.95 Y125.219 E.0701
G1 X182.963 Y127.231 E.0944
G1 X184.501 Y127.231 E.05103
G1 X189.05 Y122.682 E.21339
G1 X189.05 Y125.642 E.09818
G1 X185.277 Y121.87 E.17697
G1 X186.906 Y121.87 E.05401
G1 X181.04 Y127.664 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F3427
G1 X188.9 Y127.664 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y127.664 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I1.06 J-.597 P1  F30000
G1 X180.602 Y116.479 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3427
G1 X180.602 Y109.902 E.21816
G1 X189.398 Y109.902 E.29177
G1 X189.398 Y116.479 E.21816
G1 X180.662 Y116.479 E.28978
G1 X180.21 Y116.726 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3427
G1 X180.21 Y109.51 E.22173
G1 X189.79 Y109.51 E.29437
G1 X189.79 Y116.726 E.22173
G1 X189.79 Y116.808 E.00252
G1 F3000
G1 X189.79 Y116.871 E.00193
G1 X180.21 Y116.871 E.29437
G1 X180.21 Y116.808 E.00193
G1 F3427
G1 X180.21 Y116.786 E.00068
M204 S10000
; WIPE_START
G1 F24000
G1 X180.21 Y114.786 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-.764 J.947 P1  F30000
G1 X181.878 Y116.13 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3427
G1 X180.95 Y116.13 E.03076
G1 X180.95 Y115.429 E.02325
G1 X185.611 Y110.769 E.21863
G1 X181.853 Y110.769 E.12466
G1 X187.214 Y116.13 E.25151
G1 X187.925 Y116.13 E.02359
G1 X189.05 Y115.006 E.05274
G1 X189.05 Y113.378 E.05401
G1 X181.04 Y110.336 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3427
G1 X188.9 Y110.336 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y110.336 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-.069 J-1.215 P1  F30000
G1 X79.398 Y116.479 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3427
G1 X70.602 Y116.479 E.29177
M73 P89 R4
G1 X70.602 Y109.902 E.21816
G1 X79.398 Y109.902 E.29177
G1 X79.398 Y116.419 E.21617
G1 X79.79 Y116.726 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3427
G1 X79.79 Y116.808 E.00252
G1 F3000
G1 X79.79 Y116.871 E.00193
G1 X70.21 Y116.871 E.29437
G1 X70.21 Y116.808 E.00193
G1 F3427
G1 X70.21 Y116.726 E.00252
G1 X70.21 Y109.51 E.22173
G1 X79.79 Y109.51 E.29437
G1 X79.79 Y116.666 E.21988
M204 S10000
; WIPE_START
G1 F24000
G1 X79.79 Y116.808 E-.05396
G1 X79.79 Y116.871 E-.02386
G1 X77.995 Y116.871 E-.68218
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I1.199 J.207 P1  F30000
G1 X78.122 Y116.13 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3427
G1 X79.05 Y116.13 E.03076
G1 X79.05 Y115.429 E.02325
G1 X74.389 Y110.769 E.21863
G1 X78.147 Y110.769 E.12466
G1 X72.786 Y116.13 E.25151
G1 X72.075 Y116.13 E.02359
G1 X70.95 Y115.006 E.05274
G1 X70.95 Y113.378 E.05401
G1 X71.04 Y110.336 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F3427
G1 X78.9 Y110.336 E.29465
; WIPE_START
G1 F24000
G1 X76.9 Y110.336 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-1.205 J.169 P1  F30000
G1 X79.398 Y128.098 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3427
G1 X70.602 Y128.098 E.29177
G1 X70.602 Y121.521 E.21816
G1 X79.398 Y121.521 E.29177
G1 X79.398 Y128.038 E.21617
G1 X79.79 Y128.49 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3427
G1 X70.21 Y128.49 E.29437
G1 X70.21 Y121.274 E.22173
G1 X70.21 Y121.192 E.00252
G1 F3000
G1 X70.21 Y121.129 E.00193
G1 X79.79 Y121.129 E.29437
G1 X79.79 Y121.192 E.00193
G1 F3427
G1 X79.79 Y121.274 E.00252
G1 X79.79 Y128.43 E.21988
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y128.443 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I1.182 J-.289 P1  F30000
G1 X76.185 Y121.87 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3427
G1 X77.814 Y121.87 E.05401
G1 X79.05 Y123.105 E.05798
G1 X79.05 Y125.219 E.0701
G1 X77.037 Y127.231 E.0944
G1 X75.499 Y127.231 E.05103
G1 X70.95 Y122.682 E.21339
G1 X70.95 Y125.642 E.09818
G1 X74.723 Y121.87 E.17697
G1 X73.094 Y121.87 E.05401
G1 X71.04 Y127.664 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F3427
G1 X78.9 Y127.664 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X76.9 Y127.664 E-.76
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
G3 Z15.8 I.075 J1.215 P1  F30000
G1 X180.602 Y121.291 Z15.8
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4036
G1 X189.398 Y121.291 E.29177
G1 X189.398 Y127.898 E.21916
G1 X180.602 Y127.898 E.29177
G1 X180.602 Y121.351 E.21717
G1 X180.21 Y121.088 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4036
G1 X180.21 Y120.924 E.00504
M106 S255
G1 F1800
G1 X180.21 Y120.899 E.00078
G1 X189.79 Y120.899 E.29437
G1 X189.79 Y120.924 E.00078
M106 S252.45
G1 F4036
G1 X189.79 Y121.088 E.00504
G1 X189.79 Y128.29 E.22129
G1 X180.21 Y128.29 E.29437
G1 X180.21 Y121.148 E.21945
M204 S10000
; WIPE_START
G1 F24000
G1 X180.21 Y120.924 E-.08512
G1 X180.21 Y120.899 E-.00962
G1 X181.961 Y120.899 E-.66526
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-.821 J-.899 P1  F30000
G1 X181.048 Y121.733 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519004
G1 F4036
G1 X188.892 Y121.733 E.30433
G1 X187.21 Y122.174 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4036
G1 X185.582 Y122.174 E.05401
G1 X189.05 Y125.642 E.16268
G1 X189.05 Y122.682 E.09818
G1 X184.701 Y127.031 E.20401
G1 X182.763 Y127.031 E.0643
G1 X180.95 Y125.219 E.08502
G1 X180.95 Y123.105 E.0701
G1 X181.882 Y122.174 E.04369
G1 X183.51 Y122.174 E.05401
G1 X181.04 Y127.464 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F4036
G1 X188.9 Y127.464 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y127.464 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I1.05 J-.615 P1  F30000
G1 X180.602 Y116.709 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4036
G1 X180.602 Y110.102 E.21916
G1 X189.398 Y110.102 E.29177
G1 X189.398 Y116.709 E.21916
G1 X180.662 Y116.709 E.28978
G1 X180.21 Y116.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4036
G1 X180.21 Y109.71 E.22129
G1 X189.79 Y109.71 E.29437
G1 X189.79 Y116.912 E.22129
G1 X189.79 Y117.076 E.00504
M106 S255
G1 F1800
G1 X189.79 Y117.101 E.00078
G1 X180.21 Y117.101 E.29437
G1 X180.21 Y117.076 E.00078
M106 S252.45
G1 F4036
G1 X180.21 Y116.972 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X180.21 Y114.972 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-1.022 J.661 P1  F30000
G1 X181.048 Y116.267 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.518998
G1 F4036
G1 X188.893 Y116.268 E.30434
G1 X189.05 Y113.378 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4036
G1 X189.05 Y115.006 E.05401
G1 X188.23 Y115.826 E.03847
G1 X186.91 Y115.826 E.04378
G1 X182.053 Y110.969 E.22785
G1 X185.411 Y110.969 E.11139
G1 X180.95 Y115.429 E.20924
G1 X180.95 Y115.826 E.01315
G1 X182.182 Y115.826 E.04087
G1 X181.04 Y110.536 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4036
G1 X188.9 Y110.536 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y110.536 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-.07 J-1.215 P1  F30000
G1 X79.398 Y116.709 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4036
G1 X70.602 Y116.709 E.29177
G1 X70.602 Y110.102 E.21916
G1 X79.398 Y110.102 E.29177
G1 X79.398 Y116.649 E.21717
G1 X79.79 Y116.912 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4036
G1 X79.79 Y117.076 E.00504
M106 S255
G1 F1800
G1 X79.79 Y117.101 E.00078
G1 X70.21 Y117.101 E.29437
G1 X70.21 Y117.076 E.00078
M106 S252.45
G1 F4036
G1 X70.21 Y116.912 E.00504
G1 X70.21 Y109.71 E.22129
G1 X79.79 Y109.71 E.29437
G1 X79.79 Y116.852 E.21945
M204 S10000
; WIPE_START
G1 F24000
G1 X79.79 Y117.076 E-.08512
G1 X79.79 Y117.101 E-.00962
G1 X78.039 Y117.101 E-.66526
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I1.199 J-.208 P1  F30000
G1 X77.818 Y115.826 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4036
G1 X79.05 Y115.826 E.04085
G1 X79.05 Y115.429 E.01316
G1 X74.589 Y110.969 E.20924
G1 X77.947 Y110.969 E.11139
G1 X73.09 Y115.826 E.22784
G1 X71.77 Y115.826 E.0438
G1 X70.95 Y115.006 E.03846
G1 X70.95 Y113.378 E.05401
G1 X71.04 Y110.536 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4036
G1 X78.9 Y110.536 E.29465
G1 X71.048 Y116.267 F30000
; LINE_WIDTH: 0.518998
G1 F4036
G1 X78.893 Y116.268 E.30434
; WIPE_START
G1 F24000
G1 X76.893 Y116.268 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-1.19 J.256 P1  F30000
G1 X79.398 Y127.898 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4036
G1 X70.602 Y127.898 E.29177
G1 X70.602 Y121.291 E.21916
G1 X79.398 Y121.291 E.29177
G1 X79.398 Y127.838 E.21717
G1 X79.79 Y128.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4036
G1 X70.21 Y128.29 E.29437
G1 X70.21 Y121.088 E.22129
G1 X70.21 Y120.924 E.00504
M106 S255
G1 F1800
G1 X70.21 Y120.899 E.00078
G1 X79.79 Y120.899 E.29437
G1 X79.79 Y120.924 E.00078
M106 S252.45
G1 F4036
G1 X79.79 Y121.088 E.00504
G1 X79.79 Y128.23 E.21945
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y128.243 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I1.198 J.214 P1  F30000
G1 X78.952 Y121.733 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.519004
G1 F4036
G1 X71.108 Y121.733 E.30433
G1 X72.79 Y122.174 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4036
G1 X74.418 Y122.174 E.05401
G1 X70.95 Y125.642 E.16268
G1 X70.95 Y122.682 E.09818
G1 X75.299 Y127.031 E.20401
G1 X77.237 Y127.031 E.0643
G1 X79.05 Y125.219 E.08502
G1 X79.05 Y123.105 E.0701
G1 X78.118 Y122.174 E.04369
G1 X76.49 Y122.174 E.05401
G1 X71.04 Y127.464 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F4036
G1 X78.9 Y127.464 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X76.9 Y127.464 E-.76
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
G3 Z16 I.076 J1.215 P1  F30000
G1 X180.602 Y120.997 Z16
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7353
G1 X189.398 Y120.997 E.29177
G1 X189.398 Y127.698 E.22229
G1 X180.602 Y127.698 E.29177
G1 X180.602 Y121.057 E.2203
G1 X180.21 Y120.858 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7353
G1 X180.21 Y120.776 E.00252
G1 F3000
G1 X180.21 Y120.612 E.00504
M106 S255
G1 F600
G1 X189.79 Y120.612 E.29437
M106 S252.45
G1 F3000
G1 X189.79 Y120.776 E.00504
G1 F7353
G1 X189.79 Y120.858 E.00252
G1 X189.79 Y128.09 E.22222
G1 X180.21 Y128.09 E.29437
G1 X180.21 Y120.918 E.22038
M204 S10000
; WIPE_START
G1 F24000
G1 X180.21 Y120.776 E-.05396
G1 X180.21 Y120.612 E-.06232
G1 X181.904 Y120.612 E-.64372
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-.9 J-.819 P1  F30000
G1 X181.102 Y121.493 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.627364
G1 F7353
G1 X188.842 Y121.493 E.36863
G1 X187.024 Y121.988 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7353
G1 X185.396 Y121.988 E.05401
G1 X189.05 Y125.642 E.1714
G1 X189.05 Y122.682 E.09818
G1 X184.901 Y126.831 E.19463
G1 X182.563 Y126.831 E.07757
G1 X180.95 Y125.219 E.07564
G1 X180.95 Y123.105 E.0701
G1 X182.067 Y121.988 E.05241
G1 X183.696 Y121.988 E.05401
G1 X181.04 Y127.264 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F7353
G1 X188.9 Y127.264 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y127.264 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I1.037 J-.637 P1  F30000
G1 X180.602 Y117.003 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7353
G1 X180.602 Y110.302 E.22229
G1 X189.398 Y110.302 E.29177
G1 X189.398 Y117.003 E.22229
G1 X180.662 Y117.003 E.28978
G1 X180.21 Y117.142 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7353
G1 X180.21 Y109.91 E.22222
G1 X189.79 Y109.91 E.29437
G1 X189.79 Y117.142 E.22222
G1 X189.79 Y117.224 E.00252
G1 F3000
G1 X189.79 Y117.388 E.00504
M106 S255
G1 F600
G1 X180.21 Y117.388 E.29437
M106 S252.45
G1 F3000
G1 X180.21 Y117.224 E.00504
G1 F7353
G1 X180.21 Y117.202 E.00068
M204 S10000
; WIPE_START
G1 F24000
G1 X180.21 Y115.202 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-1.006 J.684 P1  F30000
G1 X181.098 Y116.507 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.627364
G1 F7353
G1 X188.838 Y116.507 E.36863
G1 X189.05 Y113.378 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7353
G1 X189.05 Y115.006 E.05401
G1 X188.044 Y116.012 E.04717
G1 X187.095 Y116.012 E.03148
G1 X182.253 Y111.169 E.22717
G1 X185.211 Y111.169 E.09812
G1 X180.95 Y115.429 E.19986
G1 X180.95 Y116.012 E.01931
G1 X181.997 Y116.012 E.0347
G1 X181.04 Y110.736 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F7353
G1 X188.9 Y110.736 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y110.736 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-.071 J-1.215 P1  F30000
G1 X79.398 Y117.003 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7353
G1 X70.602 Y117.003 E.29177
G1 X70.602 Y110.302 E.22229
G1 X79.398 Y110.302 E.29177
G1 X79.398 Y116.943 E.2203
G1 X79.79 Y117.142 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7353
G1 X79.79 Y117.224 E.00252
G1 F3000
G1 X79.79 Y117.388 E.00504
M106 S255
G1 F600
G1 X70.21 Y117.388 E.29437
M106 S252.45
G1 F3000
G1 X70.21 Y117.224 E.00504
G1 F7353
G1 X70.21 Y117.142 E.00252
G1 X70.21 Y109.91 E.22222
G1 X79.79 Y109.91 E.29437
G1 X79.79 Y117.082 E.22038
M204 S10000
; WIPE_START
G1 F24000
G1 X79.79 Y117.224 E-.05396
G1 X79.79 Y117.388 E-.06232
G1 X78.096 Y117.388 E-.64372
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I1.214 J-.082 P1  F30000
G1 X78.003 Y116.012 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7353
G1 X79.05 Y116.012 E.0347
G1 X79.05 Y115.429 E.01931
G1 X74.789 Y111.169 E.19986
G1 X77.747 Y111.169 E.09812
G1 X72.905 Y116.012 E.22717
G1 X71.956 Y116.012 E.03147
G1 X70.95 Y115.006 E.04717
G1 X70.95 Y113.378 E.05401
G1 X71.04 Y110.736 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F7353
G1 X78.9 Y110.736 E.29465
G1 X71.098 Y116.507 F30000
; LINE_WIDTH: 0.627364
G1 F7353
G1 X78.838 Y116.507 E.36863
; WIPE_START
G1 F24000
G1 X76.838 Y116.507 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-1.186 J.271 P1  F30000
G1 X79.398 Y127.698 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7353
G1 X70.602 Y127.698 E.29177
G1 X70.602 Y120.997 E.22229
G1 X79.398 Y120.997 E.29177
G1 X79.398 Y127.638 E.2203
G1 X79.79 Y128.09 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7353
G1 X70.21 Y128.09 E.29437
G1 X70.21 Y120.858 E.22222
G1 X70.21 Y120.776 E.00252
G1 F3000
G1 X70.21 Y120.612 E.00504
M106 S255
G1 F600
G1 X79.79 Y120.612 E.29437
M106 S252.45
G1 F3000
G1 X79.79 Y120.776 E.00504
G1 F7353
G1 X79.79 Y120.858 E.00252
G1 X79.79 Y128.03 E.22038
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y128.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I1.182 J-.29 P1  F30000
G1 X76.304 Y121.988 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7353
G1 X77.933 Y121.988 E.05401
G1 X79.05 Y123.105 E.0524
G1 X79.05 Y125.219 E.0701
G1 X77.437 Y126.831 E.07564
G1 X75.099 Y126.831 E.07756
G1 X70.95 Y122.682 E.19463
G1 X70.95 Y125.642 E.09818
G1 X74.604 Y121.988 E.1714
G1 X72.976 Y121.988 E.05401
G1 X71.102 Y121.493 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.627364
G1 F7353
G1 X78.842 Y121.493 E.36863
G1 X71.04 Y127.264 F30000
; LINE_WIDTH: 0.50291
G1 F7353
G1 X78.9 Y127.264 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X76.9 Y127.264 E-.76
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
G3 Z16.2 I-.003 J1.217 P1  F30000
G1 X180.602 Y127.498 Z16.2
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4039
G1 X180.602 Y120.58 E.22947
G1 X189.398 Y120.58 E.29177
G1 X189.398 Y127.498 E.22947
G1 X180.662 Y127.498 E.28978
G1 X180.21 Y127.89 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4039
G1 X180.21 Y120.195 E.23645
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X189.79 Y120.195 E.31779
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4039
M73 P90 R4
G1 X189.79 Y120.564 E.01134
G1 X189.79 Y127.89 E.22511
G1 X180.27 Y127.89 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.254 Y125.89 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I-1.012 J.676 P1  F30000
G1 X181.04 Y127.064 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4039
G1 X188.9 Y127.064 E.29465
G1 X188.41 Y126.631 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4039
G1 X189.05 Y126.631 E.02121
G1 X189.05 Y125.642 E.0328
G1 X185.166 Y121.758 E.1822
G1 X182.298 Y121.758 E.09514
G1 X180.95 Y123.105 E.06321
G1 X180.95 Y125.219 E.0701
G1 X182.363 Y126.631 E.06625
G1 X185.101 Y126.631 E.09083
G1 X189.05 Y122.682 E.18524
G1 X189.05 Y121.758 E.03065
G1 X188.345 Y121.758 E.02336
G1 X181.004 Y121.362 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.428193
G1 F4039
G1 X189.002 Y121.362 E.25108
G1 X189.002 Y120.977 E.0121
G1 X181 Y120.977 E.25121
G1 X181.004 Y121.302 E.01021
; WIPE_START
G1 F24000
G1 X181 Y120.977 E-.12361
G1 X182.675 Y120.977 E-.63639
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I1.051 J-.613 P1  F30000
G1 X180.602 Y117.42 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4039
G1 X180.602 Y110.502 E.22947
G1 X189.398 Y110.502 E.29177
G1 X189.398 Y117.42 E.22947
G1 X180.662 Y117.42 E.28978
G1 X180.21 Y117.436 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4039
G1 X180.21 Y110.11 E.22511
G1 X189.79 Y110.11 E.29437
G1 X189.79 Y117.805 E.23645
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X180.21 Y117.805 E.31779
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4039
G1 X180.21 Y117.496 E.00949
M204 S10000
G1 X180.998 Y117.023 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.428194
G1 F4039
G1 X189 Y117.023 E.25121
G1 X188.996 Y116.638 E.0121
G1 X180.998 Y116.638 E.25108
G1 X180.998 Y116.963 E.01021
G1 X181.766 Y116.242 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4039
G1 X180.95 Y116.242 E.02706
G1 X180.95 Y115.429 E.02695
G1 X185.011 Y111.369 E.19048
G1 X182.453 Y111.369 E.08485
G1 X187.326 Y116.242 E.22859
G1 X187.814 Y116.242 E.0162
G1 X189.05 Y115.006 E.05797
G1 X189.05 Y113.378 E.05401
G1 X181.04 Y110.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4039
G1 X188.9 Y110.936 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y110.936 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I.005 J-1.217 P1  F30000
G1 X79.398 Y110.502 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4039
G1 X79.398 Y117.42 E.22947
G1 X70.602 Y117.42 E.29177
G1 X70.602 Y110.502 E.22947
G1 X79.338 Y110.502 E.28978
G1 X79.79 Y110.11 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4039
G1 X79.79 Y117.805 E.23645
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X70.21 Y117.805 E.31779
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4039
G1 X70.21 Y117.436 E.01134
G1 X70.21 Y110.11 E.22511
G1 X79.73 Y110.11 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X79.746 Y112.11 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I-1.143 J-.418 P1  F30000
G1 X78.234 Y116.242 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4039
G1 X79.05 Y116.242 E.02706
G1 X79.05 Y115.429 E.02695
G1 X74.989 Y111.369 E.19048
G1 X77.547 Y111.369 E.08485
G1 X72.674 Y116.242 E.22859
G1 X72.186 Y116.242 E.0162
G1 X70.95 Y115.006 E.05797
G1 X70.95 Y113.378 E.05401
G1 X71.04 Y110.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4039
G1 X78.9 Y110.936 E.29465
G1 X79 Y117.023 F30000
; LINE_WIDTH: 0.428194
G1 F4039
G1 X78.996 Y116.638 E.0121
G1 X70.998 Y116.638 E.25108
G1 X70.998 Y117.023 E.0121
G1 X78.94 Y117.023 E.24932
; WIPE_START
G1 F24000
G1 X76.94 Y117.023 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I-1.185 J.278 P1  F30000
G1 X79.398 Y127.498 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4039
G1 X70.602 Y127.498 E.29177
G1 X70.602 Y120.58 E.22947
G1 X79.398 Y120.58 E.29177
G1 X79.398 Y127.438 E.22748
G1 X79.79 Y127.89 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4039
G1 X70.21 Y127.89 E.29437
G1 X70.21 Y120.195 E.23645
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X79.79 Y120.195 E.31779
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4039
G1 X79.79 Y120.564 E.01134
G1 X79.79 Y127.83 E.22327
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y127.843 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I1.196 J.224 P1  F30000
G1 X79.002 Y121.362 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.428193
G1 F4039
G1 X79.002 Y120.977 E.0121
G1 X71 Y120.977 E.25121
G1 X71.004 Y121.362 E.0121
G1 X78.942 Y121.362 E.2492
G1 X71.655 Y121.758 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4039
G1 X70.95 Y121.758 E.02336
G1 X70.95 Y122.682 E.03065
G1 X74.899 Y126.631 E.18524
G1 X77.637 Y126.631 E.09083
G1 X79.05 Y125.219 E.06625
G1 X79.05 Y123.105 E.0701
G1 X77.702 Y121.758 E.06321
G1 X74.834 Y121.758 E.09514
G1 X70.95 Y125.642 E.1822
G1 X70.95 Y126.631 E.03281
G1 X71.59 Y126.631 E.02121
G1 X71.04 Y127.064 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4039
G1 X78.9 Y127.064 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X76.9 Y127.064 E-.76
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
G3 Z16.4 I-.003 J1.217 P1  F30000
G1 X180.602 Y127.298 Z16.4
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5693
G1 X180.602 Y119.778 E.24944
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X180.602 Y118.222 E.05164
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5693
G1 X180.602 Y110.702 E.24944
G1 X189.398 Y110.702 E.29177
G1 X189.398 Y118.222 E.24944
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X189.398 Y119.778 E.05164
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5693
G1 X189.398 Y120.161 E.01269
G1 X189.398 Y127.298 E.23675
G1 X180.662 Y127.298 E.28978
G1 X180.21 Y127.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5693
G1 X180.21 Y119.778 E.2431
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X180.21 Y118.222 E.05164
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5693
G1 X180.21 Y110.31 E.2431
G1 X189.79 Y110.31 E.29437
G1 X189.79 Y118.222 E.2431
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X189.79 Y119.778 E.05164
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5693
G1 X189.79 Y120.147 E.01134
G1 X189.79 Y127.69 E.23176
G1 X180.27 Y127.69 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.255 Y125.69 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I-1.012 J.676 P1  F30000
G1 X181.04 Y126.864 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502898
G1 F5693
G1 X188.9 Y126.864 E.29464
G1 X186.929 Y126.431 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5693
G1 X185.301 Y126.431 E.05401
G1 X189.05 Y122.682 E.17586
G1 X189.05 Y125.642 E.09818
G1 X184.55 Y121.142 E.2111
G1 X182.914 Y121.142 E.05426
G1 X180.95 Y123.105 E.09211
G1 X180.95 Y125.219 E.0701
G1 X182.163 Y126.431 E.05687
G1 X183.791 Y126.431 E.05401
; WIPE_START
G1 F24000
G1 X182.163 Y126.431 E-.61876
G1 X181.9 Y126.168 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I1.21 J-.128 P1  F30000
G1 X180.94 Y117.08 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.429575
M106 S255
G1 F3000
G1 X180.94 Y120.75 E.11561
G1 X181.327 Y120.75 E.01218
G1 X181.327 Y117.25 E.11027
G1 X181.713 Y117.25 E.01218
G1 X181.713 Y120.75 E.11027
G1 X182.1 Y120.75 E.01218
G1 X182.1 Y117.25 E.11027
G1 X182.487 Y117.25 E.01218
G1 X182.487 Y120.75 E.11027
G1 X182.873 Y120.75 E.01218
G1 X182.873 Y117.25 E.11027
G1 X183.26 Y117.25 E.01218
G1 X183.26 Y120.75 E.11027
G1 X183.647 Y120.75 E.01218
G1 X183.647 Y117.25 E.11027
G1 X184.033 Y117.25 E.01218
G1 X184.033 Y120.75 E.11027
G1 X184.42 Y120.75 E.01218
G1 X184.42 Y117.25 E.11027
G1 X184.807 Y117.25 E.01218
G1 X184.807 Y120.75 E.11027
G1 X185.193 Y120.75 E.01218
G1 X185.193 Y117.25 E.11027
G1 X185.58 Y117.25 E.01218
G1 X185.58 Y120.75 E.11027
G1 X185.967 Y120.75 E.01218
G1 X185.967 Y117.25 E.11027
G1 X186.353 Y117.25 E.01218
G1 X186.353 Y120.75 E.11027
G1 X186.74 Y120.75 E.01218
G1 X186.74 Y117.25 E.11027
G1 X187.127 Y117.25 E.01218
G1 X187.127 Y120.75 E.11027
G1 X187.513 Y120.75 E.01218
G1 X187.513 Y117.25 E.11027
G1 X187.9 Y117.25 E.01218
G1 X187.9 Y120.75 E.11027
G1 X188.287 Y120.75 E.01218
G1 X188.287 Y117.25 E.11027
G1 X188.673 Y117.25 E.01218
G1 X188.673 Y120.75 E.11027
G1 X189.06 Y120.75 E.01218
G1 X189.06 Y117.08 E.11561
M106 S252.45
G1 X189.05 Y113.378 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5693
G1 X189.05 Y115.006 E.05401
G1 X187.198 Y116.858 E.08688
G1 X187.942 Y116.858 E.02468
M73 P90 R3
G1 X182.653 Y111.569 E.24812
G1 X184.811 Y111.569 E.07158
G1 X180.95 Y115.429 E.1811
G1 X180.95 Y116.858 E.04739
G1 X181.15 Y116.858 E.00663
G1 X181.04 Y111.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502898
G1 F5693
G1 X188.9 Y111.136 E.29464
; WIPE_START
G1 F24000
G1 X186.9 Y111.136 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I-.181 J-1.203 P1  F30000
G1 X79.398 Y127.298 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5693
G1 X70.602 Y127.298 E.29177
G1 X70.602 Y119.778 E.24944
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X70.602 Y118.222 E.05164
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5693
G1 X70.602 Y110.702 E.24944
G1 X79.398 Y110.702 E.29177
G1 X79.398 Y118.222 E.24944
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X79.398 Y119.778 E.05164
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5693
G1 X79.398 Y120.161 E.01269
G1 X79.398 Y127.238 E.23476
G1 X79.79 Y127.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5693
G1 X70.21 Y127.69 E.29437
G1 X70.21 Y119.778 E.2431
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X70.21 Y118.222 E.05164
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5693
G1 X70.21 Y110.31 E.2431
G1 X79.79 Y110.31 E.29437
G1 X79.79 Y118.222 E.2431
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X79.79 Y119.778 E.05164
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5693
G1 X79.79 Y120.147 E.01134
G1 X79.79 Y127.63 E.22992
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y127.643 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I.74 J-.966 P1  F30000
G1 X76.209 Y126.431 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5693
G1 X77.837 Y126.431 E.05401
G1 X79.05 Y125.219 E.05687
G1 X79.05 Y123.105 E.0701
G1 X77.086 Y121.142 E.09211
G1 X75.45 Y121.142 E.05426
G1 X70.95 Y125.642 E.2111
G1 X70.95 Y122.682 E.09818
G1 X74.699 Y126.431 E.17586
G1 X73.071 Y126.431 E.05401
G1 X71.04 Y126.864 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502898
G1 F5693
G1 X78.9 Y126.864 E.29464
; WIPE_START
G1 F24000
G1 X76.9 Y126.864 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I1.039 J-.633 P1  F30000
G1 X70.94 Y117.08 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.429575
M106 S255
G1 F3000
G1 X70.94 Y120.75 E.11561
G1 X71.327 Y120.75 E.01218
G1 X71.327 Y117.25 E.11027
G1 X71.713 Y117.25 E.01218
G1 X71.713 Y120.75 E.11027
G1 X72.1 Y120.75 E.01218
G1 X72.1 Y117.25 E.11027
G1 X72.487 Y117.25 E.01218
G1 X72.487 Y120.75 E.11027
G1 X72.873 Y120.75 E.01218
G1 X72.873 Y117.25 E.11027
G1 X73.26 Y117.25 E.01218
G1 X73.26 Y120.75 E.11027
G1 X73.647 Y120.75 E.01218
G1 X73.647 Y117.25 E.11027
G1 X74.033 Y117.25 E.01218
G1 X74.033 Y120.75 E.11027
G1 X74.42 Y120.75 E.01218
G1 X74.42 Y117.25 E.11027
G1 X74.807 Y117.25 E.01218
G1 X74.807 Y120.75 E.11027
G1 X75.193 Y120.75 E.01218
G1 X75.193 Y117.25 E.11027
G1 X75.58 Y117.25 E.01218
G1 X75.58 Y120.75 E.11027
G1 X75.967 Y120.75 E.01218
G1 X75.967 Y117.25 E.11027
G1 X76.353 Y117.25 E.01218
G1 X76.353 Y120.75 E.11027
G1 X76.74 Y120.75 E.01218
G1 X76.74 Y117.25 E.11027
G1 X77.127 Y117.25 E.01218
G1 X77.127 Y120.75 E.11027
G1 X77.513 Y120.75 E.01218
G1 X77.513 Y117.25 E.11027
G1 X77.9 Y117.25 E.01218
G1 X77.9 Y120.75 E.11027
G1 X78.287 Y120.75 E.01218
G1 X78.287 Y117.25 E.11027
G1 X78.673 Y117.25 E.01218
G1 X78.673 Y120.75 E.11027
G1 X79.06 Y120.75 E.01218
G1 X79.06 Y117.08 E.11561
M106 S252.45
G1 X78.85 Y116.858 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5693
G1 X79.05 Y116.858 E.00662
G1 X79.05 Y115.429 E.04739
G1 X75.189 Y111.569 E.1811
G1 X77.347 Y111.569 E.07158
G1 X72.058 Y116.858 E.24812
G1 X72.802 Y116.858 E.02468
G1 X70.95 Y115.006 E.08688
G1 X70.95 Y113.378 E.05401
G1 X71.04 Y111.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502898
G1 F5693
G1 X78.9 Y111.136 E.29464
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X76.9 Y111.136 E-.76
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
G3 Z16.6 I-.185 J1.203 P1  F30000
G1 X180.602 Y127.098 Z16.6
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4527
G1 X180.602 Y110.902 E.53725
G1 X189.398 Y110.902 E.29177
G1 X189.398 Y127.098 E.53725
G1 X180.662 Y127.098 E.28978
G1 X180.21 Y127.49 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4527
G1 X180.21 Y110.51 E.52175
G1 X189.79 Y110.51 E.29437
G1 X189.79 Y127.49 E.52175
G1 X180.27 Y127.49 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.263 Y125.49 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I-1.015 J.671 P1  F30000
G1 X181.04 Y126.664 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502912
G1 F4527
G1 X188.9 Y126.664 E.29465
G1 X187.129 Y126.231 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4527
G1 X185.501 Y126.231 E.05401
G1 X189.05 Y122.682 E.16648
G1 X189.05 Y125.642 E.09818
G1 X185.064 Y121.657 E.18696
G1 X182.399 Y121.657 E.08841
G1 X180.95 Y123.105 E.06797
G1 X180.95 Y125.219 E.0701
G1 X181.963 Y126.231 E.04749
G1 X183.591 Y126.231 E.05401
G1 X183.259 Y119 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42417
G1 F4527
G1 X186.681 Y119 E.10633
G1 X182.88 Y119.379 F30000
; LINE_WIDTH: 0.419999
G1 F4527
G1 X187.12 Y119.379 E.13031
G1 X187.12 Y118.621 E.0233
G1 X182.88 Y118.621 E.13031
G1 X182.88 Y119.319 E.02146
G1 X182.502 Y119.756 F30000
G1 F4527
G1 X187.498 Y119.756 E.15348
G1 X187.498 Y118.244 E.04647
G1 X182.502 Y118.244 E.15348
G1 X182.502 Y119.696 E.04463
G1 X182.125 Y120.133 F30000
G1 F4527
G1 X187.875 Y120.133 E.17666
G1 X187.875 Y117.867 E.06965
G1 X182.125 Y117.867 E.17666
G1 X182.125 Y120.073 E.0678
G1 X181.748 Y120.51 F30000
G1 F4527
G1 X188.252 Y120.51 E.19983
G1 X188.252 Y117.49 E.09282
G1 X181.748 Y117.49 E.19983
G1 X181.748 Y120.45 E.09098
G1 X181.371 Y120.887 F30000
G1 F4527
G1 X188.629 Y120.887 E.223
G1 X188.629 Y117.113 E.11599
G1 X181.371 Y117.113 E.223
G1 X181.371 Y120.827 E.11415
G1 X180.994 Y121.265 F30000
G1 F4527
G1 X189.006 Y121.265 E.24618
G1 X189.006 Y116.735 E.13917
G1 X180.994 Y116.735 E.24618
G1 X180.994 Y121.205 E.13732
G1 X181.665 Y116.343 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4527
G1 X180.95 Y116.343 E.0237
G1 X180.95 Y115.429 E.03031
G1 X184.611 Y111.769 E.17172
G1 X182.853 Y111.769 E.05831
G1 X187.427 Y116.343 E.21459
G1 X187.712 Y116.343 E.00947
G1 X189.05 Y115.006 E.06273
G1 X189.05 Y113.378 E.05401
G1 X181.04 Y111.336 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F4527
G1 X188.9 Y111.336 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y111.336 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I-.177 J-1.204 P1  F30000
G1 X79.398 Y127.098 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4527
G1 X70.602 Y127.098 E.29177
G1 X70.602 Y110.902 E.53725
G1 X79.398 Y110.902 E.29177
G1 X79.398 Y127.038 E.53526
G1 X79.79 Y127.49 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4527
G1 X70.21 Y127.49 E.29437
G1 X70.21 Y110.51 E.52175
G1 X79.79 Y110.51 E.29437
G1 X79.79 Y127.43 E.5199
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y127.443 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I.803 J-.915 P1  F30000
G1 X76.409 Y126.231 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4527
G1 X78.037 Y126.231 E.05401
G1 X79.05 Y125.219 E.04749
G1 X79.05 Y123.105 E.0701
G1 X77.601 Y121.657 E.06797
G1 X74.936 Y121.657 E.08841
G1 X70.95 Y125.642 E.18696
G1 X70.95 Y122.682 E.09818
M73 P91 R3
G1 X74.499 Y126.231 E.16648
G1 X72.871 Y126.231 E.05401
G1 X71.04 Y126.664 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502912
G1 F4527
G1 X78.9 Y126.664 E.29465
G1 X73.259 Y119 F30000
; LINE_WIDTH: 0.42417
G1 F4527
G1 X76.681 Y119 E.10633
G1 X77.12 Y119.379 F30000
; LINE_WIDTH: 0.419999
G1 F4527
G1 X77.12 Y118.621 E.0233
G1 X72.88 Y118.621 E.13031
G1 X72.88 Y119.379 E.0233
G1 X77.06 Y119.379 E.12847
G1 X77.498 Y119.756 F30000
G1 F4527
G1 X77.498 Y118.244 E.04647
G1 X72.502 Y118.244 E.15348
G1 X72.502 Y119.756 E.04647
G1 X77.438 Y119.756 E.15164
G1 X77.875 Y120.133 F30000
G1 F4527
G1 X77.875 Y117.867 E.06965
G1 X72.125 Y117.867 E.17666
G1 X72.125 Y120.133 E.06965
G1 X77.815 Y120.133 E.17481
G1 X78.252 Y120.51 F30000
G1 F4527
G1 X78.252 Y117.49 E.09282
G1 X71.748 Y117.49 E.19983
G1 X71.748 Y120.51 E.09282
G1 X78.192 Y120.51 E.19799
G1 X78.629 Y120.887 F30000
G1 F4527
G1 X78.629 Y117.113 E.11599
G1 X71.371 Y117.113 E.223
G1 X71.371 Y120.887 E.11599
G1 X78.569 Y120.887 E.22116
G1 X79.006 Y121.265 F30000
G1 F4527
G1 X79.006 Y116.735 E.13917
G1 X70.994 Y116.735 E.24618
G1 X70.994 Y121.265 E.13917
G1 X78.946 Y121.265 E.24433
G1 X78.335 Y116.343 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4527
G1 X79.05 Y116.343 E.0237
G1 X79.05 Y115.429 E.03032
G1 X75.389 Y111.769 E.17171
G1 X77.147 Y111.769 E.05831
G1 X72.573 Y116.343 E.21459
G1 X72.288 Y116.343 E.00947
G1 X70.95 Y115.006 E.06273
G1 X70.95 Y113.378 E.05401
G1 X71.04 Y111.336 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F4527
G1 X78.9 Y111.336 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X76.9 Y111.336 E-.76
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
G3 Z16.8 I-.181 J1.203 P1  F30000
G1 X180.602 Y126.898 Z16.8
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4478
G1 X180.602 Y111.102 E.52398
G1 X189.398 Y111.102 E.29177
G1 X189.398 Y126.898 E.52398
G1 X180.662 Y126.898 E.28978
G1 X180.21 Y127.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4478
G1 X180.21 Y110.71 E.50946
G1 X189.79 Y110.71 E.29437
G1 X189.79 Y127.29 E.50946
G1 X180.27 Y127.29 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.263 Y125.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I-1.015 J.671 P1  F30000
G1 X181.04 Y126.464 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4478
G1 X188.9 Y126.464 E.29465
G1 X187.329 Y126.031 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4478
G1 X185.701 Y126.031 E.05401
G1 X189.05 Y122.682 E.1571
G1 X189.05 Y125.642 E.09818
G1 X185.064 Y121.657 E.18696
G1 X182.399 Y121.657 E.08841
G1 X180.95 Y123.105 E.06797
G1 X180.95 Y125.219 E.0701
G1 X181.763 Y126.031 E.03811
G1 X183.391 Y126.031 E.05401
G1 X183.259 Y119 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42417
G1 F4478
G1 X186.681 Y119 E.10633
G1 X182.88 Y119.379 F30000
; LINE_WIDTH: 0.419999
G1 F4478
G1 X187.12 Y119.379 E.13031
G1 X187.12 Y118.621 E.0233
G1 X182.88 Y118.621 E.13031
G1 X182.88 Y119.319 E.02146
G1 X182.502 Y119.756 F30000
G1 F4478
G1 X187.498 Y119.756 E.15348
G1 X187.498 Y118.244 E.04647
G1 X182.502 Y118.244 E.15348
G1 X182.502 Y119.696 E.04463
G1 X182.125 Y120.133 F30000
G1 F4478
G1 X187.875 Y120.133 E.17666
G1 X187.875 Y117.867 E.06965
G1 X182.125 Y117.867 E.17666
G1 X182.125 Y120.073 E.0678
G1 X181.748 Y120.51 F30000
G1 F4478
G1 X188.252 Y120.51 E.19983
G1 X188.252 Y117.49 E.09282
G1 X181.748 Y117.49 E.19983
G1 X181.748 Y120.45 E.09098
G1 X181.371 Y120.887 F30000
G1 F4478
G1 X188.629 Y120.887 E.223
G1 X188.629 Y117.113 E.11599
G1 X181.371 Y117.113 E.223
G1 X181.371 Y120.827 E.11415
G1 X180.994 Y121.265 F30000
G1 F4478
G1 X189.006 Y121.265 E.24618
G1 X189.006 Y116.735 E.13917
G1 X180.994 Y116.735 E.24618
G1 X180.994 Y121.205 E.13732
G1 X181.665 Y116.343 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4478
G1 X180.95 Y116.343 E.0237
G1 X180.95 Y115.429 E.03031
G1 X184.411 Y111.969 E.16233
G1 X183.053 Y111.969 E.04504
G1 X187.427 Y116.343 E.2052
G1 X187.712 Y116.343 E.00947
G1 X189.05 Y115.006 E.06273
G1 X189.05 Y113.378 E.05401
G1 X181.04 Y111.536 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4478
G1 X188.9 Y111.536 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y111.536 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I-.172 J-1.205 P1  F30000
G1 X79.398 Y126.898 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4478
G1 X70.602 Y126.898 E.29177
G1 X70.602 Y111.102 E.52398
G1 X79.398 Y111.102 E.29177
G1 X79.398 Y126.838 E.52199
G1 X79.79 Y127.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4478
G1 X70.21 Y127.29 E.29437
G1 X70.21 Y110.71 E.50946
G1 X79.79 Y110.71 E.29437
G1 X79.79 Y127.23 E.50761
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y127.243 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I.871 J-.849 P1  F30000
G1 X76.609 Y126.031 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4478
G1 X78.237 Y126.031 E.05401
G1 X79.05 Y125.219 E.03811
G1 X79.05 Y123.105 E.0701
G1 X77.601 Y121.657 E.06797
G1 X74.936 Y121.657 E.08841
G1 X70.95 Y125.642 E.18696
G1 X70.95 Y122.682 E.09818
G1 X74.299 Y126.031 E.1571
G1 X75.927 Y126.031 E.05401
G1 X71.04 Y126.464 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4478
G1 X78.9 Y126.464 E.29465
G1 X73.259 Y119 F30000
; LINE_WIDTH: 0.42417
G1 F4478
G1 X76.681 Y119 E.10633
G1 X77.12 Y119.379 F30000
; LINE_WIDTH: 0.419999
G1 F4478
G1 X77.12 Y118.621 E.0233
G1 X72.88 Y118.621 E.13031
G1 X72.88 Y119.379 E.0233
G1 X77.06 Y119.379 E.12847
G1 X77.498 Y119.756 F30000
G1 F4478
G1 X77.498 Y118.244 E.04647
G1 X72.502 Y118.244 E.15348
G1 X72.502 Y119.756 E.04647
G1 X77.438 Y119.756 E.15164
G1 X77.875 Y120.133 F30000
G1 F4478
G1 X77.875 Y117.867 E.06965
G1 X72.125 Y117.867 E.17666
G1 X72.125 Y120.133 E.06965
G1 X77.815 Y120.133 E.17481
G1 X78.252 Y120.51 F30000
G1 F4478
G1 X78.252 Y117.49 E.09282
G1 X71.748 Y117.49 E.19983
G1 X71.748 Y120.51 E.09282
G1 X78.192 Y120.51 E.19799
G1 X78.629 Y120.887 F30000
G1 F4478
G1 X78.629 Y117.113 E.11599
G1 X71.371 Y117.113 E.223
G1 X71.371 Y120.887 E.11599
G1 X78.569 Y120.887 E.22116
G1 X79.006 Y121.265 F30000
G1 F4478
G1 X79.006 Y116.735 E.13917
G1 X70.994 Y116.735 E.24618
G1 X70.994 Y121.265 E.13917
G1 X78.946 Y121.265 E.24433
G1 X78.335 Y116.343 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4478
G1 X79.05 Y116.343 E.0237
G1 X79.05 Y115.429 E.03032
G1 X75.589 Y111.969 E.16233
G1 X76.947 Y111.969 E.04504
G1 X72.573 Y116.343 E.2052
G1 X72.288 Y116.343 E.00947
G1 X70.95 Y115.006 E.06273
G1 X70.95 Y113.378 E.05401
G1 X71.04 Y111.536 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F4478
G1 X78.9 Y111.536 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X76.9 Y111.536 E-.76
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
G3 Z17 I-.176 J1.204 P1  F30000
G1 X180.602 Y126.698 Z17
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2848
G1 X180.602 Y111.302 E.51071
G1 X189.398 Y111.302 E.29177
G1 X189.398 Y126.698 E.51071
G1 X180.662 Y126.698 E.28978
G1 X180.21 Y127.09 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2848
G1 X180.21 Y110.91 E.49717
G1 X189.79 Y110.91 E.29437
G1 X189.79 Y127.09 E.49717
G1 X180.27 Y127.09 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.263 Y125.09 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I-1.015 J.672 P1  F30000
G1 X181.04 Y126.264 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2848
G1 X188.9 Y126.264 E.29465
G1 X187.529 Y125.831 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2848
G1 X185.901 Y125.831 E.05401
G1 X189.05 Y122.682 E.14771
G1 X189.05 Y125.642 E.09818
G1 X180.95 Y117.543 E.37996
G1 X180.95 Y115.429 E.0701
G1 X184.211 Y112.169 E.15295
G1 X183.253 Y112.169 E.03177
G1 X189.05 Y117.966 E.27194
G1 X189.05 Y115.006 E.09818
G1 X180.95 Y123.105 E.37996
G1 X180.95 Y125.219 E.0701
G1 X181.563 Y125.831 E.02872
G1 X183.191 Y125.831 E.05401
G1 X181.04 Y111.736 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2848
G1 X188.9 Y111.736 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y111.736 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I-.168 J-1.205 P1  F30000
G1 X79.398 Y126.698 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2848
G1 X70.602 Y126.698 E.29177
G1 X70.602 Y111.302 E.51071
G1 X79.398 Y111.302 E.29177
G1 X79.398 Y126.638 E.50872
G1 X79.79 Y127.09 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2848
G1 X70.21 Y127.09 E.29437
G1 X70.21 Y110.91 E.49717
G1 X79.79 Y110.91 E.29437
G1 X79.79 Y127.03 E.49532
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y127.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I.946 J-.766 P1  F30000
G1 X76.809 Y125.831 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2848
G1 X78.437 Y125.831 E.05401
G1 X79.05 Y125.219 E.02872
G1 X79.05 Y123.105 E.0701
G1 X70.95 Y115.006 E.37996
G1 X70.95 Y117.966 E.09818
G1 X76.747 Y112.169 E.27194
G1 X75.789 Y112.169 E.03177
G1 X79.05 Y115.429 E.15295
G1 X79.05 Y117.543 E.0701
G1 X70.95 Y125.642 E.37996
G1 X70.95 Y122.682 E.09818
G1 X74.099 Y125.831 E.14771
G1 X75.727 Y125.831 E.05401
G1 X71.04 Y126.264 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2848
G1 X78.9 Y126.264 E.29465
G1 X71.04 Y111.736 F30000
G1 F2848
G1 X78.9 Y111.736 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X76.9 Y111.736 E-.76
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
G3 Z17.2 I-.172 J1.205 P1  F30000
G1 X180.602 Y126.498 Z17.2
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2798
G1 X180.602 Y111.502 E.49744
G1 X189.398 Y111.502 E.29177
G1 X189.398 Y126.498 E.49744
G1 X180.662 Y126.498 E.28978
G1 X180.21 Y126.89 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2798
G1 X180.21 Y111.11 E.48488
G1 X189.79 Y111.11 E.29437
G1 X189.79 Y126.89 E.48488
G1 X180.27 Y126.89 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.262 Y124.89 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I-1.015 J.672 P1  F30000
G1 X181.04 Y126.064 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2798
G1 X188.9 Y126.064 E.29465
G1 X189.05 Y121.054 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2798
G1 X189.05 Y122.682 E.05401
G1 X186.101 Y125.631 E.13833
G1 X189.039 Y125.631 E.09745
G1 X180.95 Y117.543 E.37944
G1 X180.95 Y115.429 E.0701
G1 X184.011 Y112.369 E.14357
G1 X183.453 Y112.369 E.01851
G1 X189.05 Y117.966 E.26256
G1 X189.05 Y115.006 E.09818
G1 X180.95 Y123.105 E.37996
G1 X180.95 Y125.219 E.0701
G1 X181.363 Y125.631 E.01934
G1 X182.991 Y125.631 E.05401
G1 X181.04 Y111.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2798
G1 X188.9 Y111.936 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y111.936 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I-.163 J-1.206 P1  F30000
G1 X79.398 Y126.498 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2798
G1 X70.602 Y126.498 E.29177
G1 X70.602 Y111.502 E.49744
G1 X79.398 Y111.502 E.29177
G1 X79.398 Y126.438 E.49545
G1 X79.79 Y126.89 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2798
G1 X70.21 Y126.89 E.29437
G1 X70.21 Y111.11 E.48488
G1 X79.79 Y111.11 E.29437
G1 X79.79 Y126.83 E.48303
M204 S10000
; WIPE_START
M73 P92 R3
G1 F24000
G1 X77.79 Y126.843 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I1.023 J-.659 P1  F30000
G1 X77.009 Y125.631 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2798
G1 X78.637 Y125.631 E.05401
G1 X79.05 Y125.219 E.01934
G1 X79.05 Y123.105 E.0701
G1 X70.95 Y115.006 E.37996
G1 X70.95 Y117.966 E.09818
G1 X76.547 Y112.369 E.26256
G1 X75.989 Y112.369 E.01851
G1 X79.05 Y115.429 E.14357
G1 X79.05 Y117.543 E.0701
G1 X70.961 Y125.631 E.37944
G1 X73.899 Y125.631 E.09745
G1 X70.95 Y122.682 E.13833
G1 X70.95 Y121.054 E.05401
G1 X71.04 Y126.064 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2798
G1 X78.9 Y126.064 E.29465
G1 X71.04 Y111.936 F30000
G1 F2798
G1 X78.9 Y111.936 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 17.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X76.9 Y111.936 E-.76
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
G3 Z17.4 I-.167 J1.205 P1  F30000
G1 X180.602 Y126.298 Z17.4
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2734
G1 X180.602 Y111.702 E.48417
G1 X189.398 Y111.702 E.29177
G1 X189.398 Y126.298 E.48417
G1 X180.662 Y126.298 E.28978
G1 X180.21 Y126.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2734
G1 X180.21 Y111.31 E.47258
G1 X189.79 Y111.31 E.29437
G1 X189.79 Y126.69 E.47258
G1 X180.27 Y126.69 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.262 Y124.69 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I-1.015 J.672 P1  F30000
G1 X181.04 Y125.864 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2734
G1 X188.9 Y125.864 E.29465
G1 X189.05 Y121.054 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2734
G1 X189.05 Y122.682 E.05401
G1 X186.301 Y125.431 E.12895
G1 X188.839 Y125.431 E.08418
G1 X180.95 Y117.543 E.37005
G1 X180.95 Y115.429 E.0701
G1 X183.811 Y112.569 E.13419
G1 X183.653 Y112.569 E.00524
G1 X189.05 Y117.966 E.25318
G1 X189.05 Y115.006 E.09818
G1 X180.95 Y123.105 E.37996
G1 X180.95 Y125.219 E.0701
G1 X181.163 Y125.431 E.00996
G1 X182.791 Y125.431 E.05401
G1 X181.04 Y112.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2734
G1 X188.9 Y112.136 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y112.136 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I-.159 J-1.207 P1  F30000
G1 X79.398 Y126.298 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2734
G1 X70.602 Y126.298 E.29177
G1 X70.602 Y111.702 E.48417
G1 X79.398 Y111.702 E.29177
G1 X79.398 Y126.238 E.48218
G1 X79.79 Y126.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2734
G1 X70.21 Y126.69 E.29437
G1 X70.21 Y111.31 E.47258
G1 X79.79 Y111.31 E.29437
G1 X79.79 Y126.63 E.47074
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y126.643 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I1.097 J-.526 P1  F30000
G1 X77.209 Y125.431 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2734
G1 X78.837 Y125.431 E.05401
G1 X79.05 Y125.219 E.00996
G1 X79.05 Y123.105 E.0701
G1 X70.95 Y115.006 E.37996
G1 X70.95 Y117.966 E.09818
G1 X76.347 Y112.569 E.25318
G1 X76.189 Y112.569 E.00524
G1 X79.05 Y115.429 E.13418
G1 X79.05 Y117.543 E.0701
G1 X71.161 Y125.431 E.37005
G1 X73.699 Y125.431 E.08418
G1 X70.95 Y122.682 E.12895
G1 X70.95 Y121.054 E.05401
G1 X71.04 Y125.864 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2734
G1 X78.9 Y125.864 E.29465
G1 X71.04 Y112.136 F30000
G1 F2734
G1 X78.9 Y112.136 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 17.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X76.9 Y112.136 E-.76
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
G3 Z17.6 I-.162 J1.206 P1  F30000
G1 X180.602 Y126.098 Z17.6
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2642
G1 X180.602 Y111.902 E.4709
G1 X189.398 Y111.902 E.29177
G1 X189.398 Y126.098 E.4709
G1 X180.662 Y126.098 E.28978
G1 X180.21 Y126.49 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2642
G1 X180.21 Y111.51 E.46029
G1 X189.79 Y111.51 E.29437
G1 X189.79 Y126.49 E.46029
G1 X180.27 Y126.49 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.262 Y124.49 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I-1.015 J.672 P1  F30000
G1 X181.04 Y125.664 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2642
G1 X188.9 Y125.664 E.29465
G1 X189.05 Y121.054 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2642
G1 X189.05 Y122.682 E.05401
G1 X186.501 Y125.231 E.11957
G1 X188.639 Y125.231 E.07091
G1 X180.95 Y117.543 E.36067
G1 X180.95 Y115.429 E.0701
G1 X183.611 Y112.769 E.1248
G1 X183.853 Y112.769 E.00803
G1 X189.05 Y117.966 E.24379
G1 X189.05 Y115.006 E.09818
G1 X180.95 Y123.105 E.37996
G1 X180.95 Y124.734 E.05401
G1 X188.96 Y112.336 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2642
G1 X181.1 Y112.336 E.29465
; WIPE_START
G1 F24000
G1 X183.1 Y112.336 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I-.16 J-1.206 P1  F30000
G1 X79.398 Y126.098 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2642
G1 X70.602 Y126.098 E.29177
G1 X70.602 Y111.902 E.4709
G1 X79.398 Y111.902 E.29177
G1 X79.398 Y126.038 E.46891
G1 X79.79 Y126.49 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2642
G1 X70.21 Y126.49 E.29437
G1 X70.21 Y111.51 E.46029
G1 X79.79 Y111.51 E.29437
G1 X79.79 Y126.43 E.45845
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y126.443 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I.98 J.722 P1  F30000
G1 X79.05 Y124.734 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2642
G1 X79.05 Y123.105 E.05401
G1 X70.95 Y115.006 E.37996
G1 X70.95 Y117.966 E.09818
G1 X76.147 Y112.769 E.24379
G1 X76.389 Y112.769 E.00803
G1 X79.05 Y115.429 E.1248
G1 X79.05 Y117.543 E.0701
G1 X71.361 Y125.231 E.36067
G1 X73.499 Y125.231 E.07091
G1 X70.95 Y122.682 E.11957
G1 X70.95 Y121.054 E.05401
G1 X71.04 Y125.664 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2642
G1 X78.9 Y125.664 E.29465
G1 X71.04 Y112.336 F30000
G1 F2642
G1 X78.9 Y112.336 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 17.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X76.9 Y112.336 E-.76
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
G3 Z17.8 I-.158 J1.207 P1  F30000
G1 X180.602 Y125.898 Z17.8
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2598
G1 X180.602 Y112.102 E.45763
G1 X189.398 Y112.102 E.29177
G1 X189.398 Y125.898 E.45763
G1 X180.662 Y125.898 E.28978
G1 X180.21 Y126.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2598
G1 X180.21 Y111.71 E.448
G1 X189.79 Y111.71 E.29437
G1 X189.79 Y126.29 E.448
G1 X180.27 Y126.29 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.262 Y124.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I-1.015 J.672 P1  F30000
G1 X181.04 Y125.464 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2598
G1 X188.9 Y125.464 E.29465
M73 P92 R2
G1 X189.05 Y121.054 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2598
G1 X189.05 Y122.682 E.05401
G1 X186.701 Y125.031 E.11018
G1 X188.439 Y125.031 E.05764
G1 X180.95 Y117.543 E.35129
G1 X180.95 Y115.429 E.0701
G1 X183.411 Y112.969 E.11542
G1 X184.053 Y112.969 E.0213
G1 X189.05 Y117.966 E.23441
G1 X189.05 Y115.006 E.09818
G1 X180.95 Y123.105 E.37996
G1 X180.95 Y124.734 E.05401
G1 X181.04 Y112.536 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2598
G1 X188.9 Y112.536 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y112.536 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I-.15 J-1.208 P1  F30000
G1 X79.398 Y125.898 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2598
G1 X70.602 Y125.898 E.29177
G1 X70.602 Y112.102 E.45763
G1 X79.398 Y112.102 E.29177
G1 X79.398 Y125.838 E.45564
G1 X79.79 Y126.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P93 R2
G1 F2598
G1 X70.21 Y126.29 E.29437
G1 X70.21 Y111.71 E.448
G1 X79.79 Y111.71 E.29437
G1 X79.79 Y126.23 E.44616
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y126.243 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I.934 J.78 P1  F30000
G1 X79.05 Y124.734 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2598
G1 X79.05 Y123.105 E.05401
G1 X70.95 Y115.006 E.37996
G1 X70.95 Y117.966 E.09818
G1 X75.947 Y112.969 E.23441
G1 X76.589 Y112.969 E.0213
G1 X79.05 Y115.429 E.11542
G1 X79.05 Y117.543 E.0701
G1 X71.561 Y125.031 E.35129
G1 X73.299 Y125.031 E.05764
G1 X70.95 Y122.682 E.11018
G1 X70.95 Y121.054 E.05401
G1 X71.04 Y125.464 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2598
G1 X78.9 Y125.464 E.29465
G1 X71.04 Y112.536 F30000
G1 F2598
G1 X78.9 Y112.536 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 17.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X76.9 Y112.536 E-.76
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
G3 Z18 I-.153 J1.207 P1  F30000
G1 X180.602 Y125.698 Z18
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2552
G1 X180.602 Y112.302 E.44436
G1 X189.398 Y112.302 E.29177
G1 X189.398 Y125.698 E.44436
G1 X180.662 Y125.698 E.28978
G1 X180.21 Y126.09 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2552
G1 X180.21 Y111.91 E.43571
G1 X189.79 Y111.91 E.29437
G1 X189.79 Y126.09 E.43571
G1 X180.27 Y126.09 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.262 Y124.09 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I-1.014 J.672 P1  F30000
G1 X181.04 Y125.264 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2552
G1 X188.9 Y125.264 E.29465
G1 X189.05 Y121.054 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2552
G1 X189.05 Y122.682 E.05401
G1 X186.901 Y124.831 E.1008
G1 X188.239 Y124.831 E.04437
G1 X180.95 Y117.543 E.34191
G1 X180.95 Y115.429 E.0701
G1 X183.211 Y113.169 E.10604
G1 X184.253 Y113.169 E.03457
G1 X189.05 Y117.966 E.22503
G1 X189.05 Y115.006 E.09818
G1 X180.95 Y123.105 E.37996
G1 X180.95 Y124.734 E.05401
G1 X181.04 Y112.736 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2552
G1 X188.9 Y112.736 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y112.736 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I-.146 J-1.208 P1  F30000
G1 X79.398 Y125.698 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2552
G1 X70.602 Y125.698 E.29177
G1 X70.602 Y112.302 E.44436
G1 X79.398 Y112.302 E.29177
G1 X79.398 Y125.638 E.44237
G1 X79.79 Y126.09 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2552
G1 X70.21 Y126.09 E.29437
G1 X70.21 Y111.91 E.43571
G1 X79.79 Y111.91 E.29437
G1 X79.79 Y126.03 E.43387
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y126.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I.877 J.844 P1  F30000
G1 X79.05 Y124.734 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2552
G1 X79.05 Y123.105 E.05401
G1 X70.95 Y115.006 E.37996
G1 X70.95 Y117.966 E.09818
G1 X75.747 Y113.169 E.22503
G1 X76.789 Y113.169 E.03457
G1 X79.05 Y115.429 E.10604
G1 X79.05 Y117.543 E.0701
G1 X71.761 Y124.831 E.34191
G1 X73.099 Y124.831 E.04437
G1 X70.95 Y122.682 E.1008
G1 X70.95 Y121.054 E.05401
G1 X71.04 Y125.264 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2552
G1 X78.9 Y125.264 E.29465
G1 X71.04 Y112.736 F30000
G1 F2552
G1 X78.9 Y112.736 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 18
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X76.9 Y112.736 E-.76
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
G3 Z18.2 I-.149 J1.208 P1  F30000
G1 X180.602 Y125.498 Z18.2
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2505
G1 X180.602 Y112.502 E.4311
G1 X189.398 Y112.502 E.29177
G1 X189.398 Y125.498 E.4311
G1 X180.662 Y125.498 E.28978
G1 X180.21 Y125.89 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2505
G1 X180.21 Y112.11 E.42342
G1 X189.79 Y112.11 E.29437
G1 X189.79 Y125.89 E.42342
G1 X180.27 Y125.89 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.261 Y123.89 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I-1.014 J.672 P1  F30000
G1 X181.04 Y125.064 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2505
G1 X188.9 Y125.064 E.29465
G1 X189.05 Y121.054 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2505
G1 X189.05 Y122.682 E.05401
G1 X187.101 Y124.631 E.09142
G1 X188.039 Y124.631 E.0311
G1 X180.95 Y117.543 E.33252
G1 X180.95 Y115.429 E.0701
G1 X183.011 Y113.369 E.09666
G1 X184.453 Y113.369 E.04784
G1 X189.05 Y117.966 E.21565
G1 X189.05 Y115.006 E.09818
G1 X180.95 Y123.105 E.37996
G1 X180.95 Y124.631 E.0506
G1 X181.053 Y124.631 E.00341
G1 X181.04 Y112.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2505
G1 X188.9 Y112.936 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y112.936 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I-.141 J-1.209 P1  F30000
G1 X79.398 Y125.498 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2505
G1 X70.602 Y125.498 E.29177
G1 X70.602 Y112.502 E.4311
G1 X79.398 Y112.502 E.29177
G1 X79.398 Y125.438 E.42911
G1 X79.79 Y125.89 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2505
G1 X70.21 Y125.89 E.29437
G1 X70.21 Y112.11 E.42342
G1 X79.79 Y112.11 E.29437
G1 X79.79 Y125.83 E.42158
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y125.843 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I.88 J.84 P1  F30000
G1 X78.947 Y124.631 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2505
G1 X79.05 Y124.631 E.00341
G1 X79.05 Y123.105 E.0506
G1 X70.95 Y115.006 E.37996
G1 X70.95 Y117.966 E.09818
G1 X75.547 Y113.369 E.21565
G1 X76.989 Y113.369 E.04784
G1 X79.05 Y115.429 E.09666
G1 X79.05 Y117.543 E.0701
G1 X71.961 Y124.631 E.33252
G1 X72.899 Y124.631 E.03111
G1 X70.95 Y122.682 E.09142
G1 X70.95 Y121.054 E.05401
G1 X71.04 Y125.064 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2505
G1 X78.9 Y125.064 E.29465
G1 X71.04 Y112.936 F30000
G1 F2505
G1 X78.9 Y112.936 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 18.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X76.9 Y112.936 E-.76
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
G3 Z18.4 I-.144 J1.208 P1  F30000
G1 X180.602 Y125.298 Z18.4
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2459
G1 X180.602 Y112.702 E.41783
G1 X189.398 Y112.702 E.29177
G1 X189.398 Y125.298 E.41783
G1 X180.662 Y125.298 E.28978
G1 X180.21 Y125.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2459
G1 X180.21 Y112.31 E.41113
G1 X189.79 Y112.31 E.29437
G1 X189.79 Y125.69 E.41113
G1 X180.27 Y125.69 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.261 Y123.69 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I-.728 J.975 P1  F30000
G1 X181.253 Y124.431 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2459
G1 X180.95 Y124.431 E.01005
G1 X180.95 Y123.105 E.04397
G1 X189.05 Y115.006 E.37996
G1 X189.05 Y117.966 E.09818
G1 X184.653 Y113.569 E.20626
G1 X182.811 Y113.569 E.06111
G1 X180.95 Y115.429 E.08727
G1 X180.95 Y117.543 E.0701
G1 X187.839 Y124.431 E.32314
G1 X187.301 Y124.431 E.01784
G1 X189.05 Y122.682 E.08204
G1 X189.05 Y121.054 E.05401
G1 X188.96 Y124.864 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2459
G1 X181.1 Y124.864 E.29465
M73 P94 R2
G1 X181.04 Y113.136 F30000
G1 F2459
G1 X188.9 Y113.136 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y113.136 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I-.137 J-1.209 P1  F30000
G1 X79.398 Y125.298 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2459
G1 X70.602 Y125.298 E.29177
G1 X70.602 Y112.702 E.41783
G1 X79.398 Y112.702 E.29177
G1 X79.398 Y125.238 E.41584
G1 X79.79 Y125.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2459
G1 X70.21 Y125.69 E.29437
G1 X70.21 Y112.31 E.41113
G1 X79.79 Y112.31 E.29437
G1 X79.79 Y125.63 E.40929
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y125.643 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I.955 J.754 P1  F30000
G1 X78.747 Y124.431 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2459
G1 X79.05 Y124.431 E.01005
G1 X79.05 Y123.105 E.04397
G1 X70.95 Y115.006 E.37996
G1 X70.95 Y117.966 E.09818
G1 X75.347 Y113.569 E.20626
G1 X77.189 Y113.569 E.06111
G1 X79.05 Y115.429 E.08727
G1 X79.05 Y117.543 E.0701
G1 X72.161 Y124.431 E.32314
G1 X72.699 Y124.431 E.01784
G1 X70.95 Y122.682 E.08204
G1 X70.95 Y121.054 E.05401
G1 X71.04 Y124.864 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2459
G1 X78.9 Y124.864 E.29465
G1 X78.96 Y113.136 F30000
; LINE_WIDTH: 0.50291
G1 F2459
G1 X71.1 Y113.136 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 18.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X73.1 Y113.136 E-.76
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
G3 Z18.6 I-.135 J1.209 P1  F30000
G1 X180.602 Y125.098 Z18.6
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2417
G1 X180.602 Y112.902 E.40456
G1 X189.398 Y112.902 E.29177
G1 X189.398 Y125.098 E.40456
G1 X180.662 Y125.098 E.28978
G1 X180.21 Y125.49 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2417
G1 X180.21 Y112.51 E.39884
G1 X189.79 Y112.51 E.29437
G1 X189.79 Y125.49 E.39884
G1 X180.27 Y125.49 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.261 Y123.49 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.8 I-.642 J1.034 P1  F30000
G1 X181.453 Y124.231 Z18.8
G1 Z18.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2417
G1 X180.95 Y124.231 E.01668
G1 X180.95 Y123.105 E.03733
G1 X189.05 Y115.006 E.37996
G1 X189.05 Y117.966 E.09818
G1 X184.853 Y113.769 E.19688
G1 X182.611 Y113.769 E.07438
G1 X180.95 Y115.429 E.07789
G1 X180.95 Y117.543 E.0701
G1 X187.639 Y124.231 E.31376
G1 X187.501 Y124.231 E.00457
G1 X189.05 Y122.682 E.07265
G1 X189.05 Y121.054 E.05401
G1 X188.96 Y124.664 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2417
G1 X181.1 Y124.664 E.29465
G1 X181.04 Y113.336 F30000
G1 F2417
G1 X188.9 Y113.336 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y113.336 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.8 I-.132 J-1.21 P1  F30000
G1 X79.398 Y125.098 Z18.8
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2417
G1 X70.602 Y125.098 E.29177
G1 X70.602 Y112.902 E.40456
G1 X79.398 Y112.902 E.29177
G1 X79.398 Y125.038 E.40257
G1 X79.79 Y125.49 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2417
G1 X70.21 Y125.49 E.29437
G1 X70.21 Y112.51 E.39884
G1 X79.79 Y112.51 E.29437
G1 X79.79 Y125.43 E.397
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y125.443 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.8 I1.032 J.645 P1  F30000
G1 X78.547 Y124.231 Z18.8
G1 Z18.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2417
G1 X79.05 Y124.231 E.01668
G1 X79.05 Y123.105 E.03733
G1 X70.95 Y115.006 E.37996
G1 X70.95 Y117.966 E.09818
G1 X75.147 Y113.769 E.19688
G1 X77.389 Y113.769 E.07438
G1 X79.05 Y115.429 E.07789
G1 X79.05 Y117.543 E.0701
G1 X72.361 Y124.231 E.31376
G1 X72.499 Y124.231 E.00457
G1 X70.95 Y122.682 E.07266
G1 X70.95 Y121.054 E.05401
G1 X71.04 Y124.664 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2417
G1 X78.9 Y124.664 E.29465
G1 X71.04 Y113.336 F30000
G1 F2417
G1 X78.9 Y113.336 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 18.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X76.9 Y113.336 E-.76
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
G3 Z18.8 I-.135 J1.209 P1  F30000
G1 X180.602 Y124.898 Z18.8
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2377
G1 X180.602 Y113.102 E.39129
G1 X189.398 Y113.102 E.29177
G1 X189.398 Y124.898 E.39129
G1 X180.662 Y124.898 E.28978
G1 X180.21 Y125.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2377
G1 X180.21 Y112.71 E.38655
G1 X189.79 Y112.71 E.29437
G1 X189.79 Y125.29 E.38655
G1 X180.27 Y125.29 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.26 Y123.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I-1.014 J.673 P1  F30000
G1 X181.04 Y124.464 Z19
G1 Z18.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2377
G1 X188.9 Y124.464 E.29465
G1 X189.05 Y121.054 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2377
G1 X189.05 Y122.682 E.05401
G1 X187.701 Y124.031 E.06327
G1 X187.439 Y124.031 E.0087
G1 X180.95 Y117.543 E.30438
G1 X180.95 Y115.429 E.0701
G1 X182.411 Y113.969 E.06851
G1 X185.053 Y113.969 E.08764
G1 X189.05 Y117.966 E.1875
G1 X189.05 Y115.006 E.09818
G1 X180.95 Y123.105 E.37996
G1 X180.95 Y124.031 E.0307
G1 X181.653 Y124.031 E.02332
G1 X181.04 Y113.536 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2377
G1 X188.9 Y113.536 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y113.536 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I-.128 J-1.21 P1  F30000
G1 X79.398 Y124.898 Z19
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2377
G1 X70.602 Y124.898 E.29177
G1 X70.602 Y113.102 E.39129
G1 X79.398 Y113.102 E.29177
G1 X79.398 Y124.838 E.3893
G1 X79.79 Y125.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2377
G1 X70.21 Y125.29 E.29437
G1 X70.21 Y112.71 E.38655
G1 X79.79 Y112.71 E.29437
G1 X79.79 Y125.23 E.3847
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y125.243 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I1.106 J.508 P1  F30000
G1 X78.347 Y124.031 Z19
G1 Z18.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2377
G1 X79.05 Y124.031 E.02332
G1 X79.05 Y123.105 E.0307
G1 X70.95 Y115.006 E.37996
G1 X70.95 Y117.966 E.09818
G1 X74.947 Y113.969 E.1875
G1 X77.589 Y113.969 E.08764
G1 X79.05 Y115.429 E.06851
G1 X79.05 Y117.543 E.0701
G1 X72.561 Y124.031 E.30438
G1 X72.299 Y124.031 E.0087
G1 X70.95 Y122.682 E.06327
G1 X70.95 Y121.054 E.05401
G1 X71.04 Y124.464 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2377
G1 X78.9 Y124.464 E.29465
G1 X71.04 Y113.536 F30000
G1 F2377
G1 X78.9 Y113.536 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 18.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X76.9 Y113.536 E-.76
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
G3 Z19 I-.13 J1.21 P1  F30000
G1 X180.602 Y124.698 Z19
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2344
G1 X180.602 Y113.302 E.37802
G1 X189.398 Y113.302 E.29177
G1 X189.398 Y124.698 E.37802
G1 X180.662 Y124.698 E.28978
G1 X180.21 Y125.09 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2344
G1 X180.21 Y112.91 E.37426
G1 X189.79 Y112.91 E.29437
G1 X189.79 Y125.09 E.37426
G1 X180.27 Y125.09 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.26 Y123.09 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I-1.014 J.673 P1  F30000
G1 X181.04 Y124.264 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2344
M73 P95 R2
G1 X188.9 Y124.264 E.29465
G1 X189.05 Y121.054 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2344
G1 X189.05 Y122.682 E.05401
G1 X187.901 Y123.831 E.05389
G1 X187.239 Y123.831 E.02197
G1 X180.95 Y117.543 E.29499
G1 X180.95 Y115.429 E.0701
G1 X182.211 Y114.169 E.05913
G1 X185.253 Y114.169 E.10091
G1 X189.05 Y117.966 E.17812
G1 X189.05 Y115.006 E.09818
G1 X180.95 Y123.105 E.37996
G1 X180.95 Y123.831 E.02406
G1 X181.853 Y123.831 E.02995
G1 X181.04 Y113.736 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2344
G1 X188.9 Y113.736 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y113.736 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I-.123 J-1.211 P1  F30000
G1 X79.398 Y124.698 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2344
G1 X70.602 Y124.698 E.29177
G1 X70.602 Y113.302 E.37802
G1 X79.398 Y113.302 E.29177
G1 X79.398 Y124.638 E.37603
G1 X79.79 Y125.09 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2344
G1 X70.21 Y125.09 E.29437
G1 X70.21 Y112.91 E.37426
G1 X79.79 Y112.91 E.29437
G1 X79.79 Y125.03 E.37241
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y125.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I1.167 J.344 P1  F30000
G1 X78.147 Y123.831 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2344
G1 X79.05 Y123.831 E.02995
G1 X79.05 Y123.105 E.02406
G1 X70.95 Y115.006 E.37996
G1 X70.95 Y117.966 E.09818
G1 X74.747 Y114.169 E.17812
G1 X77.789 Y114.169 E.10091
G1 X79.05 Y115.429 E.05913
G1 X79.05 Y117.543 E.0701
G1 X72.761 Y123.831 E.29499
G1 X72.099 Y123.831 E.02197
G1 X70.95 Y122.682 E.05389
G1 X70.95 Y121.054 E.05401
G1 X71.04 Y124.264 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2344
G1 X78.9 Y124.264 E.29465
G1 X71.04 Y113.736 F30000
G1 F2344
G1 X78.9 Y113.736 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 19
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X76.9 Y113.736 E-.76
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
G3 Z19.2 I-.126 J1.21 P1  F30000
G1 X180.602 Y124.498 Z19.2
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2312
G1 X180.602 Y113.502 E.36475
G1 X189.398 Y113.502 E.29177
G1 X189.398 Y124.498 E.36475
G1 X180.662 Y124.498 E.28978
G1 X180.21 Y124.89 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2312
G1 X180.21 Y113.11 E.36197
G1 X189.79 Y113.11 E.29437
G1 X189.79 Y124.89 E.36197
G1 X180.27 Y124.89 E.29252
M204 S10000
; WIPE_START
G1 F24000
M73 P95 R1
G1 X180.26 Y122.89 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I-1.014 J.673 P1  F30000
G1 X181.04 Y124.064 Z19.4
G1 Z19
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2312
G1 X188.9 Y124.064 E.29465
G1 X189.05 Y121.054 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2312
G1 X189.05 Y122.682 E.05401
G1 X188.101 Y123.631 E.04451
G1 X187.039 Y123.631 E.03524
G1 X180.95 Y117.543 E.28561
G1 X180.95 Y115.429 E.0701
G1 X182.011 Y114.369 E.04974
G1 X185.453 Y114.369 E.11418
G1 X189.05 Y117.966 E.16873
G1 X189.05 Y115.006 E.09818
G1 X180.95 Y123.105 E.37996
G1 X180.95 Y123.631 E.01743
G1 X182.053 Y123.631 E.03659
G1 X181.04 Y113.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2312
G1 X188.9 Y113.936 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y113.936 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I-.119 J-1.211 P1  F30000
G1 X79.398 Y124.498 Z19.4
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2312
G1 X70.602 Y124.498 E.29177
G1 X70.602 Y113.502 E.36475
G1 X79.398 Y113.502 E.29177
G1 X79.398 Y124.438 E.36276
G1 X79.79 Y124.89 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2312
G1 X70.21 Y124.89 E.29437
G1 X70.21 Y113.11 E.36197
G1 X79.79 Y113.11 E.29437
G1 X79.79 Y124.83 E.36012
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y124.843 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I1.207 J.156 P1  F30000
G1 X77.947 Y123.631 Z19.4
G1 Z19
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2312
G1 X79.05 Y123.631 E.03659
G1 X79.05 Y123.105 E.01743
G1 X70.95 Y115.006 E.37996
G1 X70.95 Y117.966 E.09818
G1 X74.547 Y114.369 E.16873
G1 X77.989 Y114.369 E.11418
G1 X79.05 Y115.429 E.04974
G1 X79.05 Y117.543 E.0701
G1 X72.961 Y123.631 E.28561
G1 X71.899 Y123.631 E.03524
G1 X70.95 Y122.682 E.04451
G1 X70.95 Y121.054 E.05401
G1 X71.04 Y124.064 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2312
G1 X78.9 Y124.064 E.29465
G1 X71.04 Y113.936 F30000
G1 F2312
G1 X78.9 Y113.936 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 19.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X76.9 Y113.936 E-.76
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
G3 Z19.4 I-.121 J1.211 P1  F30000
G1 X180.602 Y124.298 Z19.4
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2279
G1 X180.602 Y113.702 E.35148
G1 X189.398 Y113.702 E.29177
G1 X189.398 Y124.298 E.35148
G1 X180.662 Y124.298 E.28978
G1 X180.21 Y124.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2279
G1 X180.21 Y113.31 E.34968
G1 X189.79 Y113.31 E.29437
G1 X189.79 Y124.69 E.34968
G1 X180.27 Y124.69 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.259 Y122.69 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.6 I-1.014 J.673 P1  F30000
G1 X181.04 Y123.864 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2279
G1 X188.9 Y123.864 E.29465
G1 X189.05 Y121.054 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2279
G1 X189.05 Y122.682 E.05401
G1 X188.301 Y123.431 E.03513
G1 X186.839 Y123.431 E.04851
G1 X180.95 Y117.543 E.27623
G1 X180.95 Y115.429 E.0701
G1 X181.811 Y114.569 E.04036
G1 X185.653 Y114.569 E.12745
G1 X189.05 Y117.966 E.15935
G1 X189.05 Y115.006 E.09818
G1 X180.95 Y123.105 E.37996
G1 X180.95 Y123.431 E.01079
G1 X182.253 Y123.431 E.04322
G1 X181.04 Y114.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2279
G1 X188.9 Y114.136 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y114.136 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.6 I-.115 J-1.212 P1  F30000
G1 X79.398 Y124.298 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2279
G1 X70.602 Y124.298 E.29177
G1 X70.602 Y113.702 E.35148
G1 X79.398 Y113.702 E.29177
G1 X79.398 Y124.238 E.34949
G1 X79.79 Y124.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2279
G1 X70.21 Y124.69 E.29437
G1 X70.21 Y113.31 E.34968
G1 X79.79 Y113.31 E.29437
G1 X79.79 Y124.63 E.34783
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y124.643 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.6 I1.216 J-.043 P1  F30000
G1 X77.747 Y123.431 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2279
G1 X79.05 Y123.431 E.04322
G1 X79.05 Y123.105 E.01079
G1 X70.95 Y115.006 E.37996
G1 X70.95 Y117.966 E.09818
G1 X74.347 Y114.569 E.15935
G1 X78.189 Y114.569 E.12745
G1 X79.05 Y115.429 E.04036
G1 X79.05 Y117.543 E.0701
G1 X73.161 Y123.431 E.27623
G1 X71.699 Y123.431 E.04851
G1 X70.95 Y122.682 E.03513
G1 X70.95 Y121.054 E.05401
G1 X71.04 Y123.864 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2279
G1 X78.9 Y123.864 E.29465
G1 X71.04 Y114.136 F30000
G1 F2279
G1 X78.9 Y114.136 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 19.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X76.9 Y114.136 E-.76
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
G3 Z19.6 I-.116 J1.211 P1  F30000
G1 X180.602 Y124.098 Z19.6
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2247
G1 X180.602 Y113.902 E.33821
G1 X189.398 Y113.902 E.29177
G1 X189.398 Y124.098 E.33821
G1 X180.662 Y124.098 E.28978
G1 X180.21 Y124.49 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2247
G1 X180.21 Y113.51 E.33738
G1 X189.79 Y113.51 E.29437
G1 X189.79 Y124.49 E.33738
G1 X180.27 Y124.49 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.259 Y122.49 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.8 I-1.014 J.674 P1  F30000
G1 X181.04 Y123.664 Z19.8
M73 P96 R1
G1 Z19.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2247
G1 X188.9 Y123.664 E.29465
G1 X189.05 Y121.054 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2247
G1 X189.05 Y122.682 E.05401
G1 X188.501 Y123.231 E.02574
G1 X186.639 Y123.231 E.06178
G1 X180.95 Y117.543 E.26685
G1 X180.95 Y115.429 E.0701
G1 X181.611 Y114.769 E.03098
G1 X185.853 Y114.769 E.14072
G1 X189.05 Y117.966 E.14997
G1 X189.05 Y115.006 E.09818
G1 X180.95 Y123.105 E.37996
G1 X180.95 Y123.231 E.00416
G1 X182.453 Y123.231 E.04985
G1 X181.04 Y114.336 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2247
G1 X188.9 Y114.336 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y114.336 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.8 I-.11 J-1.212 P1  F30000
G1 X79.398 Y124.098 Z19.8
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2247
G1 X70.602 Y124.098 E.29177
G1 X70.602 Y113.902 E.33821
G1 X79.398 Y113.902 E.29177
G1 X79.398 Y124.038 E.33622
G1 X79.79 Y124.49 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2247
G1 X70.21 Y124.49 E.29437
G1 X70.21 Y113.51 E.33738
G1 X79.79 Y113.51 E.29437
G1 X79.79 Y124.43 E.33554
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y124.443 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.8 I1.193 J-.24 P1  F30000
G1 X77.547 Y123.231 Z19.8
G1 Z19.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2247
G1 X79.05 Y123.231 E.04985
G1 X79.05 Y123.105 E.00416
G1 X70.95 Y115.006 E.37996
G1 X70.95 Y117.966 E.09818
G1 X74.147 Y114.769 E.14997
G1 X78.389 Y114.769 E.14072
G1 X79.05 Y115.429 E.03098
G1 X79.05 Y117.543 E.0701
G1 X73.361 Y123.231 E.26685
G1 X71.499 Y123.231 E.06178
G1 X70.95 Y122.682 E.02574
G1 X70.95 Y121.054 E.05401
G1 X71.04 Y123.664 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2247
G1 X78.9 Y123.664 E.29465
G1 X71.04 Y114.336 F30000
G1 F2247
G1 X78.9 Y114.336 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 19.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X76.9 Y114.336 E-.76
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
G3 Z19.8 I-.112 J1.212 P1  F30000
G1 X180.602 Y123.898 Z19.8
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2213
G1 X180.602 Y114.102 E.32495
G1 X189.398 Y114.102 E.29177
G1 X189.398 Y123.898 E.32495
G1 X180.662 Y123.898 E.28978
G1 X180.21 Y124.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2213
G1 X180.21 Y113.71 E.32509
G1 X189.79 Y113.71 E.29437
G1 X189.79 Y124.29 E.32509
G1 X180.27 Y124.29 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.259 Y122.29 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20 I-1.013 J.674 P1  F30000
G1 X181.04 Y123.464 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2213
G1 X188.9 Y123.464 E.29465
G1 X189.05 Y121.054 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2213
G1 X189.05 Y122.682 E.05401
G1 X188.701 Y123.031 E.01636
G1 X186.439 Y123.031 E.07505
G1 X180.95 Y117.543 E.25746
G1 X180.95 Y115.429 E.0701
G1 X181.411 Y114.969 E.0216
G1 X186.053 Y114.969 E.15399
G1 X189.05 Y117.966 E.14059
G1 X189.05 Y115.006 E.09818
G1 X181.025 Y123.031 E.37646
G1 X180.95 Y123.031 E.00247
G1 X180.95 Y121.477 E.05154
G1 X181.04 Y114.536 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2213
G1 X188.9 Y114.536 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y114.536 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20 I-.106 J-1.212 P1  F30000
G1 X79.398 Y123.898 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2213
G1 X70.602 Y123.898 E.29177
G1 X70.602 Y114.102 E.32495
G1 X79.398 Y114.102 E.29177
G1 X79.398 Y123.838 E.32296
G1 X79.79 Y124.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2213
G1 X70.21 Y124.29 E.29437
G1 X70.21 Y113.71 E.32509
G1 X79.79 Y113.71 E.29437
G1 X79.79 Y124.23 E.32325
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y124.243 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20 I1.107 J.504 P1  F30000
G1 X79.05 Y121.477 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2213
G1 X79.05 Y123.031 E.05154
G1 X78.975 Y123.031 E.00247
G1 X70.95 Y115.006 E.37646
G1 X70.95 Y117.966 E.09818
G1 X73.947 Y114.969 E.14059
G1 X78.589 Y114.969 E.15399
G1 X79.05 Y115.429 E.0216
G1 X79.05 Y117.543 E.0701
G1 X73.561 Y123.031 E.25747
G1 X71.299 Y123.031 E.07504
G1 X70.95 Y122.682 E.01636
G1 X70.95 Y121.054 E.05401
G1 X71.04 Y123.464 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2213
G1 X78.9 Y123.464 E.29465
G1 X71.04 Y114.536 F30000
G1 F2213
G1 X78.9 Y114.536 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 19.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X76.9 Y114.536 E-.76
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
G3 Z20 I-.107 J1.212 P1  F30000
G1 X180.602 Y123.698 Z20
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2454
G1 X180.602 Y114.302 E.31168
G1 X189.398 Y114.302 E.29177
G1 X189.398 Y123.698 E.31168
G1 X180.662 Y123.698 E.28978
G1 X180.21 Y124.09 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2454
G1 X180.21 Y113.91 E.3128
G1 X189.79 Y113.91 E.29437
G1 X189.79 Y124.09 E.3128
G1 X180.27 Y124.09 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.258 Y122.09 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.2 I-1.013 J.674 P1  F30000
G1 X181.04 Y123.264 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2454
G1 X188.9 Y123.264 E.29465
G1 X189.05 Y122.55 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2454
G1 X180.95 Y122.55 E.26867
G1 X180.95 Y115.45 E.2355
G1 X189.05 Y115.45 E.26867
G1 X189.05 Y122.49 E.23351
G1 X188.643 Y119.187 F30000
G1 F2454
G1 X188.643 Y117.559 E.05401
G1 X186.941 Y115.857 E.07982
G1 X188.198 Y115.857 E.04171
G1 X181.913 Y122.143 E.29485
G1 X185.55 Y122.143 E.12065
G1 X181.357 Y117.95 E.1967
G1 X181.357 Y116.321 E.05401
G1 X181.04 Y114.736 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2454
G1 X188.9 Y114.736 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y114.736 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.2 I-.101 J-1.213 P1  F30000
G1 X79.398 Y123.698 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2454
G1 X70.602 Y123.698 E.29177
G1 X70.602 Y114.302 E.31168
G1 X79.398 Y114.302 E.29177
G1 X79.398 Y123.638 E.30969
G1 X79.79 Y124.09 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2454
G1 X70.21 Y124.09 E.29437
G1 X70.21 Y113.91 E.3128
G1 X79.79 Y113.91 E.29437
G1 X79.79 Y124.03 E.31096
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y124.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.2 I.93 J.785 P1  F30000
G1 X79.05 Y122.55 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2454
G1 X70.95 Y122.55 E.26867
G1 X70.95 Y115.45 E.2355
G1 X79.05 Y115.45 E.26867
G1 X79.05 Y122.49 E.23351
G1 X78.643 Y116.321 F30000
G1 F2454
G1 X78.643 Y117.95 E.05401
G1 X74.45 Y122.143 E.1967
G1 X78.087 Y122.143 E.12065
G1 X71.802 Y115.857 E.29485
G1 X73.059 Y115.857 E.0417
G1 X71.357 Y117.559 E.07982
G1 X71.357 Y119.187 E.05401
G1 X71.04 Y123.264 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2454
G1 X78.9 Y123.264 E.29465
G1 X71.04 Y114.736 F30000
G1 F2454
G1 X78.9 Y114.736 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 20
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X76.9 Y114.736 E-.76
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
G3 Z20.2 I-.102 J1.213 P1  F30000
G1 X180.602 Y123.498 Z20.2
G1 Z20
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2427
G1 X180.602 Y114.502 E.29841
G1 X189.398 Y114.502 E.29177
G1 X189.398 Y123.498 E.29841
G1 X180.662 Y123.498 E.28978
G1 X180.21 Y123.89 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2427
G1 X180.21 Y114.11 E.30051
G1 X189.79 Y114.11 E.29437
M73 P97 R1
G1 X189.79 Y123.89 E.30051
G1 X180.27 Y123.89 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.258 Y121.89 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.4 I-1.013 J.674 P1  F30000
G1 X181.04 Y123.064 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2427
G1 X188.9 Y123.064 E.29465
G1 X189.05 Y122.55 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2427
G1 X180.95 Y122.55 E.26867
G1 X180.95 Y115.45 E.2355
G1 X189.05 Y115.45 E.26867
G1 X189.05 Y122.49 E.23351
G1 X188.643 Y119.187 F30000
G1 F2427
G1 X188.643 Y117.559 E.05401
G1 X186.941 Y115.857 E.07982
G1 X188.198 Y115.857 E.04171
G1 X181.913 Y122.143 E.29485
G1 X185.55 Y122.143 E.12065
G1 X181.357 Y117.95 E.1967
G1 X181.357 Y116.321 E.05401
G1 X181.04 Y114.936 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2427
G1 X188.9 Y114.936 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y114.936 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.4 I-.097 J-1.213 P1  F30000
G1 X79.398 Y123.498 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2427
G1 X70.602 Y123.498 E.29177
G1 X70.602 Y114.502 E.29841
G1 X79.398 Y114.502 E.29177
G1 X79.398 Y123.438 E.29642
G1 X79.79 Y123.89 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2427
G1 X70.21 Y123.89 E.29437
G1 X70.21 Y114.11 E.30051
G1 X79.79 Y114.11 E.29437
G1 X79.79 Y123.83 E.29867
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y123.843 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.4 I.872 J.849 P1  F30000
G1 X79.05 Y122.55 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2427
G1 X70.95 Y122.55 E.26867
G1 X70.95 Y115.45 E.2355
G1 X79.05 Y115.45 E.26867
G1 X79.05 Y122.49 E.23351
G1 X78.643 Y116.321 F30000
G1 F2427
G1 X78.643 Y117.95 E.05401
G1 X74.45 Y122.143 E.1967
G1 X78.087 Y122.143 E.12065
G1 X71.802 Y115.857 E.29485
G1 X73.059 Y115.857 E.0417
G1 X71.357 Y117.559 E.07982
G1 X71.357 Y119.187 E.05401
G1 X71.04 Y123.064 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2427
G1 X78.9 Y123.064 E.29465
G1 X71.04 Y114.936 F30000
G1 F2427
G1 X78.9 Y114.936 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 20.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X76.9 Y114.936 E-.76
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
G3 Z20.4 I-.098 J1.213 P1  F30000
G1 X180.602 Y123.298 Z20.4
G1 Z20.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2373
G1 X180.602 Y114.702 E.28514
G1 X189.398 Y114.702 E.29177
G1 X189.398 Y123.298 E.28514
G1 X180.662 Y123.298 E.28978
G1 X180.21 Y123.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2373
G1 X180.21 Y114.31 E.28822
G1 X189.79 Y114.31 E.29437
G1 X189.79 Y123.69 E.28822
G1 X180.27 Y123.69 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.257 Y121.69 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.6 I-1.013 J.675 P1  F30000
G1 X181.04 Y122.864 Z20.6
G1 Z20.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2373
G1 X188.9 Y122.864 E.29465
G1 X189.05 Y122.431 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2373
G1 X180.95 Y122.431 E.26867
G1 X180.95 Y115.569 E.22762
G1 X189.05 Y115.569 E.26867
G1 X189.05 Y122.371 E.22563
G1 X188.643 Y119.187 F30000
G1 F2373
G1 X188.643 Y117.559 E.05401
G1 X187.06 Y115.976 E.07425
G1 X188.08 Y115.976 E.03382
G1 X182.032 Y122.024 E.2837
G1 X185.432 Y122.024 E.11277
G1 X181.357 Y117.95 E.19112
G1 X181.357 Y116.321 E.05401
G1 X181.04 Y115.136 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2373
G1 X188.9 Y115.136 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y115.136 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.6 I-.092 J-1.213 P1  F30000
G1 X79.398 Y123.298 Z20.6
G1 Z20.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2373
G1 X70.602 Y123.298 E.29177
G1 X70.602 Y114.702 E.28514
G1 X79.398 Y114.702 E.29177
G1 X79.398 Y123.238 E.28315
G1 X79.79 Y123.69 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2373
G1 X70.21 Y123.69 E.29437
G1 X70.21 Y114.31 E.28822
G1 X79.79 Y114.31 E.29437
G1 X79.79 Y123.63 E.28638
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y123.643 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.6 I.844 J.877 P1  F30000
G1 X79.05 Y122.431 Z20.6
G1 Z20.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2373
G1 X70.95 Y122.431 E.26867
G1 X70.95 Y115.569 E.22762
G1 X79.05 Y115.569 E.26867
G1 X79.05 Y122.371 E.22563
G1 X78.643 Y116.321 F30000
G1 F2373
G1 X78.643 Y117.95 E.05401
G1 X74.568 Y122.024 E.19112
G1 X77.968 Y122.024 E.11277
G1 X71.92 Y115.976 E.2837
G1 X72.94 Y115.976 E.03382
G1 X71.357 Y117.559 E.07425
G1 X71.357 Y119.187 E.05401
G1 X71.04 Y122.864 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502908
G1 F2373
G1 X78.9 Y122.864 E.29465
G1 X71.04 Y115.136 F30000
G1 F2373
G1 X78.9 Y115.136 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 20.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X76.9 Y115.136 E-.76
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
M73 P97 R0
G3 Z20.6 I-.093 J1.213 P1  F30000
G1 X180.602 Y123.098 Z20.6
G1 Z20.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2301
G1 X180.602 Y114.902 E.27187
G1 X189.398 Y114.902 E.29177
G1 X189.398 Y123.098 E.27187
G1 X180.662 Y123.098 E.28978
G1 X180.21 Y123.49 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2301
G1 X180.21 Y114.51 E.27593
G1 X189.79 Y114.51 E.29437
G1 X189.79 Y123.49 E.27593
G1 X180.27 Y123.49 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.257 Y121.49 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.8 I-1.013 J.675 P1  F30000
G1 X181.04 Y122.664 Z20.8
G1 Z20.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2301
G1 X188.9 Y122.664 E.29465
G1 X189.05 Y122.231 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2301
G1 X180.95 Y122.231 E.26867
G1 X180.95 Y115.769 E.21435
G1 X189.05 Y115.769 E.26867
G1 X189.05 Y122.171 E.21236
G1 X188.643 Y119.187 F30000
G1 F2301
G1 X188.643 Y117.559 E.05401
G1 X187.26 Y116.176 E.06486
G1 X187.88 Y116.176 E.02056
G1 X182.232 Y121.824 E.26494
G1 X185.232 Y121.824 E.0995
G1 X181.357 Y117.95 E.18174
G1 X181.357 Y116.321 E.05401
G1 X181.04 Y115.336 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2301
G1 X188.9 Y115.336 E.29465
; WIPE_START
G1 F24000
G1 X186.9 Y115.336 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.8 I-.088 J-1.214 P1  F30000
G1 X79.398 Y123.098 Z20.8
G1 Z20.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2301
G1 X70.602 Y123.098 E.29177
G1 X70.602 Y114.902 E.27187
G1 X79.398 Y114.902 E.29177
G1 X79.398 Y123.038 E.26988
G1 X79.79 Y123.49 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2301
G1 X70.21 Y123.49 E.29437
G1 X70.21 Y114.51 E.27593
G1 X79.79 Y114.51 E.29437
G1 X79.79 Y123.43 E.27409
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y123.443 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.8 I.844 J.877 P1  F30000
G1 X79.05 Y122.231 Z20.8
G1 Z20.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2301
G1 X70.95 Y122.231 E.26867
G1 X70.95 Y115.769 E.21435
G1 X79.05 Y115.769 E.26867
G1 X79.05 Y122.171 E.21236
G1 X78.643 Y116.321 F30000
G1 F2301
G1 X78.643 Y117.95 E.05401
G1 X74.768 Y121.824 E.18174
G1 X77.768 Y121.824 E.0995
G1 X72.12 Y116.176 E.26494
G1 X72.74 Y116.176 E.02056
G1 X71.357 Y117.559 E.06486
G1 X71.357 Y119.187 E.05401
G1 X71.04 Y122.664 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50291
G1 F2301
G1 X78.9 Y122.664 E.29465
G1 X71.04 Y115.336 F30000
G1 F2301
G1 X78.9 Y115.336 E.29465
; CHANGE_LAYER
; Z_HEIGHT: 20.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X76.9 Y115.336 E-.76
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
M73 P98 R0
G3 Z20.8 I-.089 J1.214 P1  F30000
G1 X180.602 Y122.898 Z20.8
G1 Z20.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4132
G1 X180.602 Y115.102 E.2586
G1 X189.398 Y115.102 E.29177
G1 X189.398 Y122.898 E.2586
G1 X180.662 Y122.898 E.28978
G1 X180.21 Y123.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4132
G1 X180.21 Y114.71 E.26364
G1 X189.79 Y114.71 E.29437
G1 X189.79 Y123.29 E.26364
G1 X180.27 Y123.29 E.29252
M204 S10000
G1 X180.983 Y122.731 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.422578
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X180.983 Y115.472 E.4148
G1 X181.456 Y115.472 E.027
G1 X181.456 Y122.528 E.40322
G1 X181.928 Y122.528 E.027
G1 X181.928 Y115.472 E.40322
G1 X182.401 Y115.472 E.027
G1 X182.401 Y122.528 E.40322
G1 X182.873 Y122.528 E.027
G1 X182.873 Y115.472 E.40322
G1 X183.346 Y115.472 E.027
G1 X183.346 Y122.528 E.40322
G1 X183.819 Y122.528 E.027
G1 X183.819 Y115.472 E.40322
G1 X184.291 Y115.472 E.027
G1 X184.291 Y122.528 E.40322
G1 X184.764 Y122.528 E.027
G1 X184.764 Y115.472 E.40322
G1 X185.236 Y115.472 E.027
G1 X185.236 Y122.528 E.40322
G1 X185.709 Y122.528 E.027
G1 X185.709 Y115.472 E.40322
G1 X186.181 Y115.472 E.027
G1 X186.181 Y122.528 E.40322
G1 X186.654 Y122.528 E.027
G1 X186.654 Y115.472 E.40322
G1 X187.127 Y115.472 E.027
G1 X187.127 Y122.528 E.40322
G1 X187.599 Y122.528 E.027
G1 X187.599 Y115.472 E.40322
G1 X188.072 Y115.472 E.027
G1 X188.072 Y122.528 E.40322
G1 X188.544 Y122.528 E.027
G1 X188.544 Y115.472 E.40322
G1 X189.017 Y115.472 E.027
G1 X189.017 Y122.731 E.4148
M106 S252.45
; WIPE_START
G1 F24000
G1 X189.017 Y120.731 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21 I-.024 J-1.217 P1  F30000
G1 X79.398 Y122.898 Z21
G1 Z20.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4132
G1 X70.602 Y122.898 E.29177
G1 X70.602 Y115.102 E.2586
G1 X79.398 Y115.102 E.29177
G1 X79.398 Y122.838 E.25661
G1 X79.79 Y123.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4132
G1 X70.21 Y123.29 E.29437
G1 X70.21 Y114.71 E.26364
G1 X79.79 Y114.71 E.29437
G1 X79.79 Y123.23 E.2618
M204 S10000
G1 X79.017 Y122.731 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.422578
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X79.017 Y115.472 E.4148
G1 X78.544 Y115.472 E.027
G1 X78.544 Y122.528 E.40322
G1 X78.072 Y122.528 E.027
G1 X78.072 Y115.472 E.40322
G1 X77.599 Y115.472 E.027
G1 X77.599 Y122.528 E.40322
G1 X77.127 Y122.528 E.027
G1 X77.127 Y115.472 E.40322
G1 X76.654 Y115.472 E.027
G1 X76.654 Y122.528 E.40322
G1 X76.181 Y122.528 E.027
G1 X76.181 Y115.472 E.40322
G1 X75.709 Y115.472 E.027
G1 X75.709 Y122.528 E.40322
G1 X75.236 Y122.528 E.027
G1 X75.236 Y115.472 E.40322
G1 X74.764 Y115.472 E.027
G1 X74.764 Y122.528 E.40322
G1 X74.291 Y122.528 E.027
G1 X74.291 Y115.472 E.40322
G1 X73.819 Y115.472 E.027
G1 X73.819 Y122.528 E.40322
G1 X73.346 Y122.528 E.027
G1 X73.346 Y115.472 E.40322
G1 X72.873 Y115.472 E.027
G1 X72.873 Y122.528 E.40322
G1 X72.401 Y122.528 E.027
G1 X72.401 Y115.472 E.40322
G1 X71.928 Y115.472 E.027
G1 X71.928 Y122.528 E.40322
G1 X71.456 Y122.528 E.027
G1 X71.456 Y115.472 E.40322
G1 X70.983 Y115.472 E.027
G1 X70.983 Y122.731 E.4148
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 20.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X70.983 Y120.731 E-.76
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
G3 Z21 I-.022 J1.217 P1  F30000
G1 X180.602 Y122.698 Z21
G1 Z20.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3716
G1 X180.602 Y115.302 E.24533
G1 X189.398 Y115.302 E.29177
G1 X189.398 Y122.698 E.24533
G1 X180.662 Y122.698 E.28978
G1 X180.21 Y123.09 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3716
G1 X180.21 Y114.91 E.25135
G1 X189.79 Y114.91 E.29437
G1 X189.79 Y123.09 E.25135
G1 X180.27 Y123.09 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.255 Y121.09 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.2 I1.187 J.27 P1  F30000
G1 X181.535 Y115.466 Z21.2
G1 Z20.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423607
G1 F3716
G1 X180.935 Y116.066 E.02633
G1 X180.935 Y116.604 E.0167
G1 X181.904 Y115.635 E.0425
G1 X182.442 Y115.635 E.0167
G1 X180.935 Y117.142 E.06612
G1 X180.935 Y117.681 E.0167
G1 X182.981 Y115.635 E.08974
G1 X183.519 Y115.635 E.0167
G1 X180.935 Y118.219 E.11336
G1 X180.935 Y118.758 E.0167
G1 X184.058 Y115.635 E.13698
G1 X184.596 Y115.635 E.0167
G1 X180.935 Y119.296 E.16059
G1 X180.935 Y119.834 E.0167
G1 X185.134 Y115.635 E.18421
G1 X185.673 Y115.635 E.0167
G1 X180.935 Y120.373 E.20783
G1 X180.935 Y120.911 E.0167
G1 X186.211 Y115.635 E.23145
G1 X186.749 Y115.635 E.0167
G1 X180.935 Y121.449 E.25507
G1 X180.935 Y121.988 E.0167
G1 X187.288 Y115.635 E.27869
G1 X187.826 Y115.635 E.0167
G1 X181.097 Y122.365 E.29522
G1 X181.635 Y122.365 E.0167
G1 X188.365 Y115.635 E.29522
G1 X188.903 Y115.635 E.0167
G1 X182.174 Y122.365 E.29522
G1 X182.712 Y122.365 E.0167
G1 X189.065 Y116.012 E.27869
G1 X189.065 Y116.55 E.0167
G1 X183.25 Y122.365 E.25508
G1 X183.789 Y122.365 E.0167
G1 X189.065 Y117.089 E.23146
G1 X189.065 Y117.627 E.0167
G1 X184.327 Y122.365 E.20784
G1 X184.866 Y122.365 E.0167
G1 X189.065 Y118.166 E.18422
G1 X189.065 Y118.704 E.0167
G1 X185.404 Y122.365 E.1606
G1 X185.942 Y122.365 E.0167
G1 X189.065 Y119.242 E.13698
G1 X189.065 Y119.781 E.0167
G1 X186.481 Y122.365 E.11336
G1 X187.019 Y122.365 E.0167
G1 X189.065 Y120.319 E.08974
G1 X189.065 Y120.857 E.0167
G1 X187.557 Y122.365 E.06613
G1 X188.096 Y122.365 E.0167
G1 X189.065 Y121.396 E.04251
G1 X189.065 Y121.934 E.0167
G1 X188.464 Y122.534 E.02633
; WIPE_START
G1 F24000
G1 X189.065 Y121.934 E-.32257
G1 X189.065 Y121.396 E-.20458
G1 X188.631 Y121.829 E-.23285
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.2 I-.01 J-1.217 P1  F30000
G1 X79.398 Y122.698 Z21.2
G1 Z20.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3716
G1 X70.602 Y122.698 E.29177
G1 X70.602 Y115.302 E.24533
G1 X79.398 Y115.302 E.29177
G1 X79.398 Y122.638 E.24334
G1 X79.79 Y123.09 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3716
G1 X70.21 Y123.09 E.29437
G1 X70.21 Y114.91 E.25135
G1 X79.79 Y114.91 E.29437
G1 X79.79 Y123.03 E.2495
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y123.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.2 I.732 J.972 P1  F30000
G1 X78.464 Y122.534 Z21.2
G1 Z20.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423607
G1 F3716
G1 X79.065 Y121.934 E.02633
G1 X79.065 Y121.396 E.0167
G1 X78.096 Y122.365 E.04251
G1 X77.557 Y122.365 E.0167
G1 X79.065 Y120.857 E.06613
G1 X79.065 Y120.319 E.0167
G1 X77.019 Y122.365 E.08974
G1 X76.481 Y122.365 E.0167
G1 X79.065 Y119.781 E.11336
G1 X79.065 Y119.242 E.0167
G1 X75.942 Y122.365 E.13698
G1 X75.404 Y122.365 E.0167
G1 X79.065 Y118.704 E.1606
G1 X79.065 Y118.166 E.0167
G1 X74.866 Y122.365 E.18422
G1 X74.327 Y122.365 E.0167
G1 X79.065 Y117.627 E.20784
G1 X79.065 Y117.089 E.0167
G1 X73.789 Y122.365 E.23146
G1 X73.25 Y122.365 E.0167
G1 X79.065 Y116.55 E.25508
G1 X79.065 Y116.012 E.0167
G1 X72.712 Y122.365 E.27869
G1 X72.174 Y122.365 E.0167
G1 X78.903 Y115.635 E.29522
G1 X78.365 Y115.635 E.0167
G1 X71.635 Y122.365 E.29522
G1 X71.097 Y122.365 E.0167
G1 X77.826 Y115.635 E.29522
G1 X77.288 Y115.635 E.0167
G1 X70.935 Y121.988 E.27869
G1 X70.935 Y121.449 E.0167
G1 X76.749 Y115.635 E.25507
G1 X76.211 Y115.635 E.0167
G1 X70.935 Y120.911 E.23145
G1 X70.935 Y120.373 E.0167
G1 X75.673 Y115.635 E.20783
G1 X75.134 Y115.635 E.0167
G1 X70.935 Y119.834 E.18421
G1 X70.935 Y119.296 E.0167
G1 X74.596 Y115.635 E.16059
G1 X74.058 Y115.635 E.0167
G1 X70.935 Y118.758 E.13698
G1 X70.935 Y118.219 E.0167
G1 X73.519 Y115.635 E.11336
G1 X72.981 Y115.635 E.0167
G1 X70.935 Y117.681 E.08974
G1 X70.935 Y117.142 E.0167
G1 X72.442 Y115.635 E.06612
G1 X71.904 Y115.635 E.0167
G1 X70.935 Y116.604 E.0425
G1 X70.935 Y116.066 E.0167
G1 X71.535 Y115.466 E.02633
; CHANGE_LAYER
; Z_HEIGHT: 21
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X70.935 Y116.066 E-.32249
G1 X70.935 Y116.604 E-.20458
G1 X71.369 Y116.171 E-.23292
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
G3 Z21.2 I-.075 J1.215 P1  F30000
G1 X180.21 Y122.89 Z21.2
G1 Z21
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3939
G1 X180.21 Y115.11 E.23906
G1 X189.79 Y115.11 E.29437
G1 X189.79 Y122.89 E.23906
G1 X180.27 Y122.89 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X180.255 Y120.89 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.4 I.652 J1.028 P1  F30000
G1 X189.042 Y115.317 Z21.4
G1 Z21
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F3939
G1 X189.583 Y115.858 E.02348
G1 X189.583 Y116.391
G1 X188.509 Y115.317 E.04666
G1 X187.976 Y115.317
G1 X189.583 Y116.924 E.06983
G1 X189.583 Y117.458
G1 X187.442 Y115.317 E.093
G1 X186.909 Y115.317
G1 X189.583 Y117.991 E.11618
G1 X189.583 Y118.524
G1 X186.376 Y115.317 E.13935
G1 X185.843 Y115.317
G1 X189.583 Y119.057 E.16252
G1 X189.583 Y119.591
G1 X185.309 Y115.317 E.1857
G1 X184.776 Y115.317
G1 X189.583 Y120.124 E.20887
G1 X189.583 Y120.657
G1 X184.243 Y115.317 E.23204
G1 X183.709 Y115.317
G1 X189.583 Y121.191 E.25522
G1 X189.583 Y121.724
G1 X183.176 Y115.317 E.27839
G1 X182.643 Y115.317
G1 X189.583 Y122.257 E.30156
G1 X189.475 Y122.683
G1 X182.11 Y115.317 E.32005
G1 X181.576 Y115.317
G1 X188.942 Y122.683 E.32005
G1 X188.408 Y122.683
G1 X181.043 Y115.317 E.32005
G1 X180.51 Y115.317
G1 X187.875 Y122.683 E.32005
G1 X187.342 Y122.683
G1 X180.417 Y115.758 E.3009
G1 X180.417 Y116.291
G1 X186.809 Y122.683 E.27773
G1 X186.275 Y122.683
G1 X180.417 Y116.825 E.25455
G1 X180.417 Y117.358
G1 X185.742 Y122.683 E.23138
G1 X185.209 Y122.683
G1 X180.417 Y117.891 E.20821
G1 X180.417 Y118.425
G1 X184.675 Y122.683 E.18503
G1 X184.142 Y122.683
G1 X180.417 Y118.958 E.16186
G1 X180.417 Y119.491
G1 X183.609 Y122.683 E.13869
G1 X183.076 Y122.683
G1 X180.417 Y120.024 E.11551
G1 X180.417 Y120.558
G1 X182.542 Y122.683 E.09234
G1 X182.009 Y122.683
G1 X180.417 Y121.091 E.06917
G1 X180.417 Y121.624
G1 X181.476 Y122.683 E.04599
G1 X180.943 Y122.683
G1 X180.417 Y122.157 E.02282
M204 S10000
; WIPE_START
G1 F24000
G1 X180.943 Y122.683 E-.28222
G1 X181.476 Y122.683 E-.20264
G1 X180.964 Y122.171 E-.27514
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.4 I-.009 J-1.217 P1  F30000
G1 X79.79 Y122.89 Z21.4
G1 Z21
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
G1 F3939
G1 X70.21 Y122.89 E.29437
G1 X70.21 Y115.11 E.23906
G1 X79.79 Y115.11 E.29437
G1 X79.79 Y122.83 E.23721
M204 S10000
; WIPE_START
G1 F24000
G1 X77.79 Y122.843 E-.76
; WIPE_END
M73 P99 R0
G1 E-.04 F1800
G17
G3 Z21.4 I1.18 J.297 P1  F30000
G1 X79.583 Y115.711 Z21.4
G1 Z21
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F3939
G1 X79.189 Y115.317 E.01713
G1 X78.655 Y115.317
G1 X79.583 Y116.245 E.0403
G1 X79.583 Y116.778
G1 X78.122 Y115.317 E.06347
G1 X77.589 Y115.317
G1 X79.583 Y117.311 E.08665
G1 X79.583 Y117.845
G1 X77.055 Y115.317 E.10982
G1 X76.522 Y115.317
G1 X79.583 Y118.378 E.13299
G1 X79.583 Y118.911
G1 X75.989 Y115.317 E.15616
G1 X75.456 Y115.317
G1 X79.583 Y119.444 E.17934
G1 X79.583 Y119.978
G1 X74.922 Y115.317 E.20251
G1 X74.389 Y115.317
G1 X79.583 Y120.511 E.22568
G1 X79.583 Y121.044
G1 X73.856 Y115.317 E.24886
G1 X73.323 Y115.317
G1 X79.583 Y121.577 E.27203
G1 X79.583 Y122.111
G1 X72.789 Y115.317 E.2952
G1 X72.256 Y115.317
G1 X79.583 Y122.644 E.31838
G1 X79.088 Y122.683
G1 X71.723 Y115.317 E.32005
G1 X71.189 Y115.317
G1 X78.555 Y122.683 E.32005
G1 X78.021 Y122.683
G1 X70.656 Y115.317 E.32005
G1 X70.417 Y115.612
G1 X77.488 Y122.683 E.30726
G1 X76.955 Y122.683
G1 X70.417 Y116.145 E.28408
G1 X70.417 Y116.678
G1 X76.422 Y122.683 E.26091
G1 X75.888 Y122.683
G1 X70.417 Y117.212 E.23774
G1 X70.417 Y117.745
G1 X75.355 Y122.683 E.21456
G1 X74.822 Y122.683
G1 X70.417 Y118.278 E.19139
G1 X70.417 Y118.811
G1 X74.289 Y122.683 E.16822
G1 X73.755 Y122.683
G1 X70.417 Y119.345 E.14505
G1 X70.417 Y119.878
G1 X73.222 Y122.683 E.12187
G1 X72.689 Y122.683
G1 X70.417 Y120.411 E.0987
G1 X70.417 Y120.945
G1 X72.155 Y122.683 E.07553
G1 X71.622 Y122.683
G1 X70.417 Y121.478 E.05235
G1 X70.417 Y122.011
G1 X71.089 Y122.683 E.02918
M204 S10000
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X70.417 Y122.011 E-.36086
G1 X70.417 Y121.478 E-.20264
G1 X70.783 Y121.843 E-.1965
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

