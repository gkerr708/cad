; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 5m 37s; total estimated time: 11m 25s
; total layer number: 30
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
M73 P0 R11
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
M73 P38 R7
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
M73 P38 R6
G1 E50 F200
M400
M104 S220
G92 E0
M73 P39 R6
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
G1 E-0.5 F300

G1 X70 F9000
M73 P41 R6
G1 X76 F15000
M73 P43 R6
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
M73 P44 R6
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
    G29 A X113.75 Y106.884 I32.7021 J26.3655
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
M73 P45 R6
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
; layer num/total_layer_count: 1/30
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
G1 X114.607 Y130.107 F30000
G1 Z.4
M73 P46 R6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X120.107 Y130.107 E.20485
G1 X120.107 Y129.101 E.03747
G1 X140.229 Y130.107 E.75039
G1 X145.393 Y130.107 E.19235
M73 P47 R6
G1 X145.393 Y130.393 E.01065
G1 X114.607 Y130.393 E1.14666
G1 X114.607 Y130.167 E.00841
; WIPE_START
G1 F24000
G1 X116.607 Y130.145 E-.76
; WIPE_END
M73 P47 R5
G1 E-.04 F1800
G17
G3 Z.6 I1.114 J-.49 P1  F30000
G1 X114.85 Y126.15 Z.6
G1 Z.2
M73 P48 R5
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
G1 X114.85 Y129.65 E.13036
G1 X119.65 Y129.65 E.17878
G1 X119.65 Y128.65 E.03725
G1 X120.24 Y128.65 E.02198
G1 X140.24 Y129.65 E.74585
G1 X145.85 Y129.65 E.20895
M73 P49 R5
G1 X145.85 Y130.85 E.0447
G1 X114.15 Y130.85 E1.1807
G1 X114.15 Y125.15 E.2123
G1 X145.85 Y125.15 E1.1807
G1 X145.85 Y126.15 E.03725
G1 X114.91 Y126.15 E1.1524
G1 X114.524 Y125.873 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.286498
G1 F3000
G1 X114.5 Y125.921 E.00108
G1 X114.5 Y129.879 E.07854
; WIPE_START
G1 F24000
G1 X114.5 Y127.879 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.217 J.015 P1  F30000
G1 X114.524 Y125.873 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.38301
G1 F3000
G1 X114.549 Y125.824 E.00151
; LINE_WIDTH: 0.431594
G1 X114.573 Y125.776 E.00172
; LINE_WIDTH: 0.480178
M73 P50 R5
G1 X114.597 Y125.727 E.00194
; LINE_WIDTH: 0.528762
G1 X114.621 Y125.679 E.00215
; LINE_WIDTH: 0.557301
G1 X114.636 Y125.664 E.00085
; LINE_WIDTH: 0.58584
G1 X114.65 Y125.65 E.00089
G1 X145.621 Y125.65 E1.37021
; WIPE_START
G1 F24000
G1 X143.621 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.595 J-1.061 P1  F30000
G1 X135.627 Y130.135 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.10292
G1 F3000
G1 X134.62 Y130.11 E.00493
; LINE_WIDTH: 0.151819
G1 X133.612 Y130.085 E.00894
; LINE_WIDTH: 0.200717
G1 X132.604 Y130.06 E.01296
; LINE_WIDTH: 0.249616
G1 X131.597 Y130.034 E.01698
; LINE_WIDTH: 0.298514
M73 P51 R5
G1 X130.589 Y130.009 E.02099
; LINE_WIDTH: 0.347413
G1 X129.582 Y129.984 E.02501
; LINE_WIDTH: 0.396311
G1 X128.574 Y129.959 E.02903
; LINE_WIDTH: 0.44521
G1 X127.566 Y129.934 E.03304
; LINE_WIDTH: 0.494108
G1 X126.559 Y129.909 E.03706
; LINE_WIDTH: 0.543007
G1 X125.551 Y129.883 E.04107
; LINE_WIDTH: 0.591905
G1 X124.543 Y129.858 E.04509
; LINE_WIDTH: 0.640804
G1 X123.536 Y129.833 E.04911
; LINE_WIDTH: 0.689702
G1 X122.528 Y129.808 E.05312
; WIPE_START
G1 F24000
G1 X123.536 Y129.833 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.254 J-1.19 P1  F30000
G1 X121.231 Y129.34 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.567955
G1 F6300
G1 X121.895 Y130.004 E.04019
G1 X121.152 Y130.004 E.03177
G1 X120.449 Y129.301 E.04255
; WIPE_START
G1 F24000
G1 X121.152 Y130.004 E-.37794
G1 X121.895 Y130.004 E-.28215
G1 X121.709 Y129.819 E-.09991
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.148 J-.405 P1  F30000
G1 X114.809 Y110.242 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X120.309 Y110.242 E.20485
G1 X120.309 Y109.235 E.03747
G1 X140.431 Y110.242 E.75039
G1 X145.595 Y110.242 E.19235
G1 X145.595 Y110.527 E.01065
G1 X114.809 Y110.527 E1.14666
G1 X114.809 Y110.302 E.00841
; WIPE_START
G1 F24000
G1 X116.809 Y110.28 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.114 J-.49 P1  F30000
G1 X115.052 Y106.284 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
G1 X115.052 Y109.784 E.13036
G1 X119.852 Y109.784 E.17878
G1 X119.852 Y108.784 E.03725
G1 X120.442 Y108.784 E.02198
G1 X140.442 Y109.784 E.74585
G1 X146.052 Y109.784 E.20895
G1 X146.052 Y110.984 E.0447
G1 X114.352 Y110.984 E1.1807
G1 X114.352 Y105.284 E.2123
G1 X146.052 Y105.284 E1.1807
G1 X146.052 Y106.284 E.03725
G1 X115.112 Y106.284 E1.1524
G1 X114.726 Y106.007 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.38301
G1 F3000
G1 X114.751 Y105.959 E.00151
; LINE_WIDTH: 0.431594
G1 X114.775 Y105.91 E.00172
; LINE_WIDTH: 0.480178
G1 X114.799 Y105.862 E.00194
; LINE_WIDTH: 0.528762
G1 X114.824 Y105.813 E.00215
; LINE_WIDTH: 0.557301
G1 X114.838 Y105.799 E.00085
; LINE_WIDTH: 0.58584
G1 X114.852 Y105.784 E.00089
M73 P52 R5
G1 X145.824 Y105.784 E1.37021
; WIPE_START
G1 F24000
G1 X143.824 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.595 J-1.061 P1  F30000
G1 X135.829 Y110.27 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.10292
G1 F3000
G1 X134.822 Y110.244 E.00493
; LINE_WIDTH: 0.151819
G1 X133.814 Y110.219 E.00894
; LINE_WIDTH: 0.200717
G1 X132.807 Y110.194 E.01296
; LINE_WIDTH: 0.249616
G1 X131.799 Y110.169 E.01698
; LINE_WIDTH: 0.298514
G1 X130.791 Y110.144 E.02099
; LINE_WIDTH: 0.347413
G1 X129.784 Y110.119 E.02501
; LINE_WIDTH: 0.396311
G1 X128.776 Y110.093 E.02903
; LINE_WIDTH: 0.44521
G1 X127.768 Y110.068 E.03304
; LINE_WIDTH: 0.494108
G1 X126.761 Y110.043 E.03706
; LINE_WIDTH: 0.543007
G1 X125.753 Y110.018 E.04107
; LINE_WIDTH: 0.591905
G1 X124.745 Y109.993 E.04509
; LINE_WIDTH: 0.640804
G1 X123.738 Y109.968 E.04911
; LINE_WIDTH: 0.689702
G1 X122.73 Y109.942 E.05312
; WIPE_START
G1 F24000
G1 X123.738 Y109.968 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.254 J-1.19 P1  F30000
G1 X121.433 Y109.475 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.567955
G1 F6300
G1 X122.097 Y110.139 E.04019
G1 X121.354 Y110.139 E.03177
G1 X120.651 Y109.436 E.04255
; WIPE_START
G1 F24000
G1 X121.354 Y110.139 E-.37794
G1 X122.097 Y110.139 E-.28215
G1 X121.911 Y109.953 E-.09991
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.01 J-1.217 P1  F30000
G1 X114.702 Y110.013 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.286498
G1 F3000
G1 X114.702 Y106.056 E.07854
M73 P53 R5
G1 X114.726 Y106.007 E.00108
M106 S252.45
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X114.702 Y106.056 E-.02064
G1 X114.702 Y108.002 E-.73936
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/30
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
G3 Z.6 I-1.217 J-.004 P1  F30000
G1 X114.648 Y125.948 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5718
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
G1 X140.235 Y129.852 E.66426
G1 X145.648 Y129.852 E.17956
G1 X145.648 Y130.648 E.0264
G1 X114.352 Y130.648 E1.03814
G1 X114.352 Y125.352 E.17567
G1 X145.648 Y125.352 E1.03814
G1 X145.648 Y125.948 E.01977
G1 X114.708 Y125.948 E1.02634
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5718
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X146.04 Y129.46 E.17807
G1 X146.04 Y131.04 E.04855
G1 X113.96 Y131.04 E.98573
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5718
G1 X145.444 Y125.65 E.47513
; WIPE_START
G1 F24000
G1 X143.444 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.116 J.485 P1  F30000
G1 X145.444 Y130.25 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5718
G1 X140.22 Y130.25 E.1655
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X126.893 Y129.653 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.570723
G1 F5718
G1 X126.794 Y129.629 E.00438
; LINE_WIDTH: 0.533042
G1 X126.695 Y129.605 E.00406
; LINE_WIDTH: 0.495361
G1 X126.596 Y129.582 E.00375
; LINE_WIDTH: 0.420283
G1 X126.497 Y129.558 E.00313
G1 X120.244 Y129.245 E.19253
G1 X120.259 Y129.642 E.01222
G1 X120.354 Y129.668 E.00302
G1 X120.448 Y129.831 E.00578
G1 X120.448 Y130.256 E.01308
G1 X126.48 Y130.256 E.1855
; LINE_WIDTH: 0.419999
G1 X126.58 Y130.237 E.00313
; LINE_WIDTH: 0.45768
G1 X126.68 Y130.218 E.00344
; LINE_WIDTH: 0.495361
G1 X126.78 Y130.199 E.00375
; LINE_WIDTH: 0.533042
G1 X126.88 Y130.18 E.00406
; LINE_WIDTH: 0.570723
G1 X128.85 Y130.205 E.08476
; LINE_WIDTH: 0.521491
G1 X130.821 Y130.23 E.07685
; LINE_WIDTH: 0.472259
G1 X132.791 Y130.254 E.06894
; LINE_WIDTH: 0.410881
G2 X134.923 Y130.279 I2.051 J-85.315 E.06393
G1 X134.931 Y129.956 E.00968
G1 X134.77 Y129.948 E.00484
; LINE_WIDTH: 0.373795
G1 X132.816 Y129.875 E.05273
; LINE_WIDTH: 0.423027
G1 X130.862 Y129.802 E.06057
; LINE_WIDTH: 0.472259
G1 X128.907 Y129.729 E.06842
; LINE_WIDTH: 0.521491
G1 X126.953 Y129.655 E.07627
G1 X120.933 Y129.768 F30000
; LINE_WIDTH: 0.641546
G1 F5718
G1 X121.847 Y129.791 E.04463
; LINE_WIDTH: 0.595347
G1 X122.762 Y129.814 E.04118
; LINE_WIDTH: 0.549148
G1 X123.676 Y129.837 E.03774
; LINE_WIDTH: 0.502948
G1 X124.591 Y129.859 E.03429
; LINE_WIDTH: 0.456749
G1 X125.505 Y129.882 E.03085
; LINE_WIDTH: 0.41055
G1 X126.42 Y129.905 E.02741
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
M73 P54 R5
G1 F5718
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.214 J-.086 P1  F30000
G1 X114.85 Y106.082 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5718
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X145.85 Y109.987 E.17956
G1 X145.85 Y110.782 E.0264
G1 X114.554 Y110.782 E1.03814
G1 X114.554 Y105.487 E.17567
G1 X145.85 Y105.487 E1.03814
G1 X145.85 Y106.082 E.01977
G1 X114.91 Y106.082 E1.02634
G1 X115.242 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5718
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X146.242 Y109.594 E.17807
G1 X146.242 Y111.174 E.04855
G1 X114.162 Y111.174 E.98573
G1 X114.162 Y105.094 E.18682
G1 X146.242 Y105.094 E.98573
G1 X146.242 Y106.474 E.0424
G1 X115.302 Y106.474 E.9507
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5718
G1 X145.646 Y105.784 E.47513
; WIPE_START
G1 F24000
G1 X143.646 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.116 J.485 P1  F30000
G1 X145.646 Y110.384 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5718
G1 X140.422 Y110.384 E.1655
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X127.095 Y109.787 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.570723
G1 F5718
G1 X126.996 Y109.764 E.00438
; LINE_WIDTH: 0.533042
G1 X126.897 Y109.74 E.00406
; LINE_WIDTH: 0.495361
G1 X126.798 Y109.716 E.00375
; LINE_WIDTH: 0.420283
G1 X126.7 Y109.692 E.00313
G1 X120.446 Y109.38 E.19253
G1 X120.461 Y109.777 E.01222
G1 X120.556 Y109.802 E.00302
G1 X120.65 Y109.965 E.00578
G1 X120.65 Y110.39 E.01308
G1 X126.682 Y110.39 E.1855
; LINE_WIDTH: 0.419999
G1 X126.782 Y110.371 E.00313
; LINE_WIDTH: 0.45768
G1 X126.882 Y110.353 E.00344
; LINE_WIDTH: 0.495361
G1 X126.982 Y110.334 E.00375
; LINE_WIDTH: 0.533042
G1 X127.082 Y110.315 E.00406
; LINE_WIDTH: 0.570723
G1 X129.052 Y110.34 E.08476
; LINE_WIDTH: 0.521491
G1 X131.023 Y110.364 E.07685
; LINE_WIDTH: 0.472259
G1 X132.993 Y110.389 E.06894
; LINE_WIDTH: 0.410881
G2 X135.125 Y110.413 I2.051 J-85.315 E.06393
G1 X135.133 Y110.091 E.00968
G1 X134.972 Y110.083 E.00484
; LINE_WIDTH: 0.373795
G1 X133.018 Y110.01 E.05273
; LINE_WIDTH: 0.423027
G1 X131.064 Y109.936 E.06057
; LINE_WIDTH: 0.472259
G1 X129.109 Y109.863 E.06842
; LINE_WIDTH: 0.521491
G1 X127.155 Y109.79 E.07627
G1 X121.135 Y109.902 F30000
; LINE_WIDTH: 0.641546
G1 F5718
G1 X122.049 Y109.925 E.04463
; LINE_WIDTH: 0.595347
G1 X122.964 Y109.948 E.04118
; LINE_WIDTH: 0.549148
G1 X123.878 Y109.971 E.03774
; LINE_WIDTH: 0.502948
G1 X124.793 Y109.994 E.03429
; LINE_WIDTH: 0.456749
G1 X125.708 Y110.017 E.03085
; LINE_WIDTH: 0.41055
G1 X126.622 Y110.04 E.02741
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5718
G1 X114.758 Y110.384 E.17424
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/30
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
G1 X114.648 Y125.948 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5715
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
G1 X140.235 Y129.852 E.66426
G1 X145.648 Y129.852 E.17956
G1 X145.648 Y130.648 E.0264
G1 X114.352 Y130.648 E1.03814
G1 X114.352 Y125.352 E.17567
G1 X145.648 Y125.352 E1.03814
G1 X145.648 Y125.948 E.01977
G1 X114.708 Y125.948 E1.02634
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5715
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X146.04 Y129.46 E.17807
G1 X146.04 Y131.04 E.04855
G1 X113.96 Y131.04 E.98573
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5715
G1 X145.444 Y125.65 E.47513
; WIPE_START
G1 F24000
G1 X143.444 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.116 J.485 P1  F30000
G1 X145.444 Y130.25 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5715
G1 X140.22 Y130.25 E.1655
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X126.893 Y129.653 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.570723
G1 F5715
G1 X126.794 Y129.629 E.00438
; LINE_WIDTH: 0.533042
G1 X126.695 Y129.605 E.00406
; LINE_WIDTH: 0.495361
G1 X126.596 Y129.582 E.00375
; LINE_WIDTH: 0.420283
G1 X126.497 Y129.558 E.00313
G1 X120.244 Y129.245 E.19253
G1 X120.259 Y129.642 E.01222
G1 X120.354 Y129.668 E.00302
G1 X120.448 Y129.831 E.00578
G1 X120.448 Y130.256 E.01308
G1 X126.48 Y130.256 E.1855
; LINE_WIDTH: 0.419999
G1 X126.58 Y130.237 E.00313
; LINE_WIDTH: 0.45768
G1 X126.68 Y130.218 E.00344
; LINE_WIDTH: 0.495361
G1 X126.78 Y130.199 E.00375
; LINE_WIDTH: 0.533042
G1 X126.88 Y130.18 E.00406
; LINE_WIDTH: 0.570723
M73 P55 R5
G1 X128.85 Y130.205 E.08476
; LINE_WIDTH: 0.521491
G1 X130.821 Y130.23 E.07685
; LINE_WIDTH: 0.472259
G1 X132.791 Y130.254 E.06894
; LINE_WIDTH: 0.410881
G2 X134.923 Y130.279 I2.051 J-85.315 E.06393
G1 X134.931 Y129.956 E.00968
G1 X134.77 Y129.948 E.00484
; LINE_WIDTH: 0.373795
G1 X132.816 Y129.875 E.05273
; LINE_WIDTH: 0.423027
G1 X130.862 Y129.802 E.06057
; LINE_WIDTH: 0.472259
G1 X128.907 Y129.729 E.06842
; LINE_WIDTH: 0.521491
G1 X126.953 Y129.655 E.07627
G1 X120.933 Y129.768 F30000
; LINE_WIDTH: 0.641546
G1 F5715
G1 X121.847 Y129.791 E.04463
; LINE_WIDTH: 0.595347
G1 X122.762 Y129.814 E.04118
; LINE_WIDTH: 0.549148
G1 X123.676 Y129.837 E.03774
; LINE_WIDTH: 0.502948
G1 X124.591 Y129.859 E.03429
; LINE_WIDTH: 0.456749
G1 X125.505 Y129.882 E.03085
; LINE_WIDTH: 0.41055
G1 X126.42 Y129.905 E.02741
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5715
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.214 J-.086 P1  F30000
G1 X114.85 Y106.082 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5715
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X145.85 Y109.987 E.17956
G1 X145.85 Y110.782 E.0264
G1 X114.554 Y110.782 E1.03814
G1 X114.554 Y105.487 E.17567
G1 X145.85 Y105.487 E1.03814
G1 X145.85 Y106.082 E.01977
G1 X114.91 Y106.082 E1.02634
G1 X115.242 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5715
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X146.242 Y109.594 E.17807
G1 X146.242 Y111.174 E.04855
G1 X114.162 Y111.174 E.98573
G1 X114.162 Y105.094 E.18682
G1 X146.242 Y105.094 E.98573
G1 X146.242 Y106.474 E.0424
G1 X115.302 Y106.474 E.9507
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5715
G1 X145.646 Y105.784 E.47513
; WIPE_START
G1 F24000
G1 X143.646 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.116 J.485 P1  F30000
G1 X145.646 Y110.384 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5715
G1 X140.422 Y110.384 E.1655
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X127.095 Y109.787 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.570723
G1 F5715
G1 X126.996 Y109.764 E.00438
; LINE_WIDTH: 0.533042
G1 X126.897 Y109.74 E.00406
; LINE_WIDTH: 0.495361
G1 X126.798 Y109.716 E.00375
; LINE_WIDTH: 0.420283
G1 X126.7 Y109.692 E.00313
G1 X120.446 Y109.38 E.19253
G1 X120.461 Y109.777 E.01222
G1 X120.556 Y109.802 E.00302
G1 X120.65 Y109.965 E.00578
G1 X120.65 Y110.39 E.01308
G1 X126.682 Y110.39 E.1855
; LINE_WIDTH: 0.419999
G1 X126.782 Y110.371 E.00313
; LINE_WIDTH: 0.45768
G1 X126.882 Y110.353 E.00344
; LINE_WIDTH: 0.495361
G1 X126.982 Y110.334 E.00375
; LINE_WIDTH: 0.533042
G1 X127.082 Y110.315 E.00406
; LINE_WIDTH: 0.570723
G1 X129.052 Y110.34 E.08476
; LINE_WIDTH: 0.521491
G1 X131.023 Y110.364 E.07685
; LINE_WIDTH: 0.472259
G1 X132.993 Y110.389 E.06894
; LINE_WIDTH: 0.410881
G2 X135.125 Y110.413 I2.051 J-85.315 E.06393
G1 X135.133 Y110.091 E.00968
G1 X134.972 Y110.083 E.00484
; LINE_WIDTH: 0.373795
G1 X133.018 Y110.01 E.05273
; LINE_WIDTH: 0.423027
G1 X131.064 Y109.936 E.06057
; LINE_WIDTH: 0.472259
G1 X129.109 Y109.863 E.06842
; LINE_WIDTH: 0.521491
G1 X127.155 Y109.79 E.07627
G1 X121.135 Y109.902 F30000
; LINE_WIDTH: 0.641546
G1 F5715
G1 X122.049 Y109.925 E.04463
; LINE_WIDTH: 0.595347
G1 X122.964 Y109.948 E.04118
; LINE_WIDTH: 0.549148
G1 X123.878 Y109.971 E.03774
; LINE_WIDTH: 0.502948
G1 X124.793 Y109.994 E.03429
; LINE_WIDTH: 0.456749
G1 X125.708 Y110.017 E.03085
; LINE_WIDTH: 0.41055
M73 P56 R5
G1 X126.622 Y110.04 E.02741
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5715
G1 X114.758 Y110.384 E.17424
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/30
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
G3 Z1 I-1.206 J-.163 P1  F30000
G1 X114.648 Y125.948 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5340
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
G1 X140.235 Y129.852 E.66426
G1 X145.648 Y129.852 E.17956
G1 X145.648 Y130.648 E.0264
G1 X114.352 Y130.648 E1.03814
G1 X114.352 Y125.352 E.17567
G1 X145.648 Y125.352 E1.03814
G1 X145.648 Y125.948 E.01977
G1 X114.708 Y125.948 E1.02634
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5340
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X146.04 Y129.46 E.17807
G1 X146.04 Y131.04 E.04855
G1 X113.96 Y131.04 E.98573
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5340
G1 X145.444 Y125.65 E.47513
; WIPE_START
G1 F24000
G1 X143.444 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.116 J.485 P1  F30000
G1 X145.444 Y130.25 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5340
G1 X140.22 Y130.25 E.1655
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X133.928 Y130.3 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5340
G1 X132.3 Y130.3 E.05401
G1 X131.778 Y129.778 E.02448
G1 X128.391 Y129.609 E.11248
G1 X127.7 Y130.3 E.03242
G1 X124.624 Y130.3 E.10206
G1 X123.698 Y129.374 E.04343
G1 X121.081 Y129.243 E.08692
G1 X120.404 Y129.92 E.03176
G1 X120.404 Y130.3 E.01259
M73 P56 R4
G1 X121.653 Y130.3 E.04143
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5340
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.214 J-.086 P1  F30000
G1 X114.85 Y106.082 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5340
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X145.85 Y109.987 E.17956
G1 X145.85 Y110.782 E.0264
G1 X114.554 Y110.782 E1.03814
G1 X114.554 Y105.487 E.17567
G1 X145.85 Y105.487 E1.03814
G1 X145.85 Y106.082 E.01977
G1 X114.91 Y106.082 E1.02634
G1 X115.242 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5340
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X146.242 Y109.594 E.17807
G1 X146.242 Y111.174 E.04855
G1 X114.162 Y111.174 E.98573
G1 X114.162 Y105.094 E.18682
G1 X146.242 Y105.094 E.98573
G1 X146.242 Y106.474 E.0424
G1 X115.302 Y106.474 E.9507
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5340
G1 X145.646 Y105.784 E.47513
; WIPE_START
G1 F24000
G1 X143.646 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.116 J.485 P1  F30000
G1 X145.646 Y110.384 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5340
G1 X140.422 Y110.384 E.1655
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X134.13 Y110.434 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5340
G1 X132.502 Y110.434 E.05401
G1 X131.98 Y109.912 E.02448
G1 X128.593 Y109.743 E.11248
G1 X127.902 Y110.434 E.03242
G1 X124.826 Y110.434 E.10206
G1 X123.9 Y109.508 E.04343
G1 X121.283 Y109.378 E.08692
G1 X120.606 Y110.055 E.03176
G1 X120.606 Y110.434 E.01259
M73 P57 R4
G1 X121.855 Y110.434 E.04143
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5340
G1 X114.758 Y110.384 E.17424
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/30
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
G3 Z1.2 I-1.206 J-.163 P1  F30000
G1 X114.648 Y125.948 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5340
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
G1 X140.235 Y129.852 E.66426
G1 X145.648 Y129.852 E.17956
G1 X145.648 Y130.648 E.0264
G1 X114.352 Y130.648 E1.03814
G1 X114.352 Y125.352 E.17567
G1 X145.648 Y125.352 E1.03814
G1 X145.648 Y125.948 E.01977
G1 X114.708 Y125.948 E1.02634
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5340
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X146.04 Y129.46 E.17807
G1 X146.04 Y131.04 E.04855
G1 X113.96 Y131.04 E.98573
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5340
G1 X145.444 Y125.65 E.47513
; WIPE_START
G1 F24000
G1 X143.444 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.116 J.485 P1  F30000
G1 X145.444 Y130.25 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5340
G1 X140.22 Y130.25 E.1655
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X133.928 Y130.3 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5340
G1 X132.3 Y130.3 E.05401
G1 X131.778 Y129.778 E.02448
G1 X128.391 Y129.609 E.11248
G1 X127.7 Y130.3 E.03242
G1 X124.624 Y130.3 E.10206
G1 X123.698 Y129.374 E.04343
G1 X121.081 Y129.243 E.08692
G1 X120.404 Y129.92 E.03176
G1 X120.404 Y130.3 E.01259
G1 X121.653 Y130.3 E.04143
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5340
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.214 J-.086 P1  F30000
G1 X114.85 Y106.082 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5340
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X145.85 Y109.987 E.17956
G1 X145.85 Y110.782 E.0264
G1 X114.554 Y110.782 E1.03814
M73 P58 R4
G1 X114.554 Y105.487 E.17567
G1 X145.85 Y105.487 E1.03814
G1 X145.85 Y106.082 E.01977
G1 X114.91 Y106.082 E1.02634
G1 X115.242 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5340
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X146.242 Y109.594 E.17807
G1 X146.242 Y111.174 E.04855
G1 X114.162 Y111.174 E.98573
G1 X114.162 Y105.094 E.18682
G1 X146.242 Y105.094 E.98573
G1 X146.242 Y106.474 E.0424
G1 X115.302 Y106.474 E.9507
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5340
G1 X145.646 Y105.784 E.47513
; WIPE_START
G1 F24000
G1 X143.646 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.116 J.485 P1  F30000
G1 X145.646 Y110.384 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5340
G1 X140.422 Y110.384 E.1655
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X134.13 Y110.434 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5340
G1 X132.502 Y110.434 E.05401
G1 X131.98 Y109.912 E.02448
G1 X128.593 Y109.743 E.11248
G1 X127.902 Y110.434 E.03242
G1 X124.826 Y110.434 E.10206
G1 X123.9 Y109.508 E.04343
G1 X121.283 Y109.378 E.08692
G1 X120.606 Y110.055 E.03176
G1 X120.606 Y110.434 E.01259
G1 X121.855 Y110.434 E.04143
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5340
G1 X114.758 Y110.384 E.17424
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/30
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
G3 Z1.4 I-1.206 J-.163 P1  F30000
G1 X114.648 Y125.948 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5340
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
G1 X140.235 Y129.852 E.66426
G1 X145.648 Y129.852 E.17956
G1 X145.648 Y130.648 E.0264
G1 X114.352 Y130.648 E1.03814
G1 X114.352 Y125.352 E.17567
G1 X145.648 Y125.352 E1.03814
G1 X145.648 Y125.948 E.01977
G1 X114.708 Y125.948 E1.02634
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5340
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X146.04 Y129.46 E.17807
G1 X146.04 Y131.04 E.04855
G1 X113.96 Y131.04 E.98573
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5340
G1 X145.444 Y125.65 E.47513
; WIPE_START
G1 F24000
G1 X143.444 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.116 J.485 P1  F30000
G1 X145.444 Y130.25 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5340
G1 X140.22 Y130.25 E.1655
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X133.928 Y130.3 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5340
G1 X132.3 Y130.3 E.05401
G1 X131.778 Y129.778 E.02448
G1 X128.391 Y129.609 E.11248
G1 X127.7 Y130.3 E.03242
M73 P59 R4
G1 X124.624 Y130.3 E.10206
G1 X123.698 Y129.374 E.04343
G1 X121.081 Y129.243 E.08692
G1 X120.404 Y129.92 E.03176
G1 X120.404 Y130.3 E.01259
G1 X121.653 Y130.3 E.04143
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5340
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.214 J-.086 P1  F30000
G1 X114.85 Y106.082 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5340
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X145.85 Y109.987 E.17956
G1 X145.85 Y110.782 E.0264
G1 X114.554 Y110.782 E1.03814
G1 X114.554 Y105.487 E.17567
G1 X145.85 Y105.487 E1.03814
G1 X145.85 Y106.082 E.01977
G1 X114.91 Y106.082 E1.02634
G1 X115.242 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5340
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X146.242 Y109.594 E.17807
G1 X146.242 Y111.174 E.04855
G1 X114.162 Y111.174 E.98573
G1 X114.162 Y105.094 E.18682
G1 X146.242 Y105.094 E.98573
G1 X146.242 Y106.474 E.0424
G1 X115.302 Y106.474 E.9507
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5340
G1 X145.646 Y105.784 E.47513
; WIPE_START
G1 F24000
G1 X143.646 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.116 J.485 P1  F30000
G1 X145.646 Y110.384 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5340
G1 X140.422 Y110.384 E.1655
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X134.13 Y110.434 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5340
G1 X132.502 Y110.434 E.05401
G1 X131.98 Y109.912 E.02448
G1 X128.593 Y109.743 E.11248
G1 X127.902 Y110.434 E.03242
G1 X124.826 Y110.434 E.10206
G1 X123.9 Y109.508 E.04343
G1 X121.283 Y109.378 E.08692
G1 X120.606 Y110.055 E.03176
G1 X120.606 Y110.434 E.01259
G1 X121.855 Y110.434 E.04143
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5340
G1 X114.758 Y110.384 E.17424
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/30
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
G3 Z1.6 I-1.206 J-.163 P1  F30000
G1 X114.648 Y125.948 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5729
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
G1 X140.235 Y129.852 E.66426
G1 X141.506 Y129.852 E.04215
G1 X141.506 Y130.648 E.0264
G1 X114.352 Y130.648 E.90073
M73 P60 R4
G1 X114.352 Y125.352 E.17567
G1 X145.648 Y125.352 E1.03814
G1 X145.648 Y125.948 E.01977
G1 X114.708 Y125.948 E1.02634
; WIPE_START
G1 F24000
G1 X114.677 Y127.948 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.076 J1.215 P1  F30000
G1 X144.994 Y129.852 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F5729
G1 X145.648 Y129.852 E.02168
G1 X145.648 Y130.648 E.0264
G1 X144.994 Y130.648 E.02168
G1 X144.994 Y129.912 E.02441
; WIPE_START
G1 F24000
G1 X145.648 Y129.852 E-.24939
G1 X145.648 Y130.648 E-.30242
G1 X145.1 Y130.648 E-.20819
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.173 J-1.205 P1  F30000
G1 X115.04 Y126.34 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5729
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X146.04 Y129.46 E.17807
G1 X146.04 Y131.04 E.04855
G1 X113.96 Y131.04 E.98573
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5729
G1 X145.444 Y125.65 E.47513
; WIPE_START
G1 F24000
G1 X143.444 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.169 J.338 P1  F30000
G1 X144.772 Y130.24 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5729
G1 X144.199 Y129.667 E.02489
G1 X143.666 Y129.667
G1 X144.772 Y130.773 E.04806
G1 X144.298 Y130.833
G1 X143.133 Y129.667 E.05063
G1 X142.599 Y129.667
G1 X143.765 Y130.833 E.05063
G1 X143.231 Y130.833
G1 X142.066 Y129.667 E.05063
G1 X141.728 Y129.863
G1 X142.698 Y130.833 E.04215
G1 X142.165 Y130.833
G1 X141.728 Y130.396 E.01898
M204 S10000
G1 X141.302 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5729
G3 X140.22 Y130.25 I-.536 J-43.424 E.03428
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X133.928 Y130.3 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5729
G1 X132.3 Y130.3 E.05401
G1 X131.778 Y129.778 E.02448
G1 X128.391 Y129.609 E.11248
G1 X127.7 Y130.3 E.03242
G1 X124.624 Y130.3 E.10206
G1 X123.698 Y129.374 E.04343
G1 X121.081 Y129.243 E.08692
G1 X120.404 Y129.92 E.03176
G1 X120.404 Y130.3 E.01259
G1 X121.653 Y130.3 E.04143
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5729
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.214 J-.086 P1  F30000
G1 X114.85 Y106.082 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5729
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X141.708 Y109.987 E.04215
G1 X141.708 Y110.782 E.0264
G1 X114.554 Y110.782 E.90073
G1 X114.554 Y105.487 E.17567
G1 X145.85 Y105.487 E1.03814
G1 X145.85 Y106.082 E.01977
G1 X114.91 Y106.082 E1.02634
; WIPE_START
G1 F24000
G1 X114.879 Y108.082 E-.76
; WIPE_END
M73 P61 R4
G1 E-.04 F1800
G17
G3 Z1.8 I-.076 J1.215 P1  F30000
G1 X145.196 Y109.987 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F5729
G1 X145.85 Y109.987 E.02168
G1 X145.85 Y110.782 E.0264
G1 X145.196 Y110.782 E.02168
G1 X145.196 Y110.047 E.02441
; WIPE_START
G1 F24000
G1 X145.85 Y109.987 E-.24939
G1 X145.85 Y110.782 E-.30242
G1 X145.302 Y110.782 E-.20819
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.173 J-1.205 P1  F30000
G1 X115.242 Y106.474 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5729
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X146.242 Y109.594 E.17807
G1 X146.242 Y111.174 E.04855
G1 X114.162 Y111.174 E.98573
G1 X114.162 Y105.094 E.18682
G1 X146.242 Y105.094 E.98573
G1 X146.242 Y106.474 E.0424
G1 X115.302 Y106.474 E.9507
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5729
G1 X145.646 Y105.784 E.47513
; WIPE_START
G1 F24000
G1 X143.646 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.169 J.338 P1  F30000
G1 X144.974 Y110.375 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5729
G1 X144.401 Y109.802 E.02489
G1 X143.868 Y109.802
G1 X144.974 Y110.908 E.04806
G1 X144.5 Y110.967
G1 X143.335 Y109.802 E.05063
G1 X142.801 Y109.802
G1 X143.967 Y110.967 E.05063
G1 X143.433 Y110.967
G1 X142.268 Y109.802 E.05063
G1 X141.93 Y109.997
G1 X142.9 Y110.967 E.04215
G1 X142.367 Y110.967
G1 X141.93 Y110.53 E.01898
M204 S10000
G1 X141.504 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5729
G3 X140.422 Y110.384 I-.536 J-43.424 E.03428
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X134.13 Y110.434 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5729
G1 X132.502 Y110.434 E.05401
G1 X131.98 Y109.912 E.02448
G1 X128.593 Y109.743 E.11248
G1 X127.902 Y110.434 E.03242
G1 X124.826 Y110.434 E.10206
G1 X123.9 Y109.508 E.04343
G1 X121.283 Y109.378 E.08692
G1 X120.606 Y110.055 E.03176
G1 X120.606 Y110.434 E.01259
G1 X121.855 Y110.434 E.04143
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5729
G1 X114.758 Y110.384 E.17424
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/30
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
G3 Z1.8 I-.699 J.996 P1  F30000
G1 X144.519 Y129.852 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5997
G1 X145.648 Y129.852 E.03746
G1 X145.648 Y130.648 E.0264
G1 X144.519 Y130.648 E.03746
G1 X144.519 Y129.912 E.02441
G1 X144.127 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5997
G1 X146.04 Y129.46 E.05879
G1 X146.04 Y131.04 E.04855
G1 X144.127 Y131.04 E.05879
G1 X144.127 Y129.52 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X146.04 Y129.46 E-.72745
G1 X146.04 Y129.546 E-.03255
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.139 J-1.209 P1  F30000
G1 X114.648 Y125.948 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5997
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
G1 X140.235 Y129.852 E.66426
G1 X141.981 Y129.852 E.05793
G1 X141.981 Y130.648 E.0264
G1 X114.352 Y130.648 E.91651
G1 X114.352 Y125.352 E.17567
G1 X141.659 Y125.352 E.90581
G1 X141.659 Y125.948 E.01977
G1 X114.708 Y125.948 E.894
; WIPE_START
G1 F24000
G1 X114.677 Y127.948 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.104 J1.212 P1  F30000
G1 X144.841 Y125.352 Z2
G1 Z1.6
G1 E.8 F1800
G1 F5997
G1 X145.648 Y125.352 E.02675
G1 X145.648 Y125.948 E.01977
G1 X144.841 Y125.948 E.02675
G1 X144.841 Y125.412 E.01777
; WIPE_START
G1 F24000
G1 X145.648 Y125.352 E-.30732
G1 X145.648 Y125.948 E-.22642
G1 X145.052 Y125.948 E-.22626
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.016 J-1.217 P1  F30000
G1 X115.04 Y126.34 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5997
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X142.373 Y129.46 E.06541
G1 X142.373 Y131.04 E.04855
G1 X113.96 Y131.04 E.87306
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5997
G1 X141.455 Y125.65 E.41376
; WIPE_START
G1 F24000
G1 X139.455 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.132 J1.21 P1  F30000
G1 X143.866 Y126.133 Z2
M73 P62 R4
G1 Z1.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5997
G1 X144.619 Y125.379 E.03273
G1 X144.298 Y125.167
G1 X143.333 Y126.133 E.04194
G1 X142.799 Y126.133
G1 X143.765 Y125.167 E.04194
G1 X143.231 Y125.167
G1 X142.266 Y126.133 E.04194
G1 X141.881 Y125.984
G1 X142.698 Y125.167 E.03551
M204 S10000
; WIPE_START
G1 F24000
G1 X141.881 Y125.984 E-.43909
G1 X142.266 Y126.133 E-.1568
G1 X142.571 Y125.827 E-.16411
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.087 J1.214 P1  F30000
G1 X145.045 Y125.65 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5997
G1 X145.444 Y125.65 E.00614
; WIPE_START
G1 F24000
G1 X145.045 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.992 J-.705 P1  F30000
G1 X141.778 Y130.25 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5997
G3 X140.22 Y130.25 I-.774 J-62.517 E.04935
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X133.928 Y130.3 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5997
G1 X132.3 Y130.3 E.05401
G1 X131.778 Y129.778 E.02448
G1 X128.391 Y129.609 E.11248
G1 X127.7 Y130.3 E.03242
G1 X124.624 Y130.3 E.10206
G1 X123.698 Y129.374 E.04343
G1 X121.081 Y129.243 E.08692
G1 X120.404 Y129.92 E.03176
G1 X120.404 Y130.3 E.01259
G1 X121.653 Y130.3 E.04143
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5997
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.711 J.988 P1  F30000
G1 X144.721 Y109.987 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5997
G1 X145.85 Y109.987 E.03746
G1 X145.85 Y110.782 E.0264
G1 X144.721 Y110.782 E.03746
G1 X144.721 Y110.047 E.02441
G1 X144.329 Y109.594 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5997
G1 X146.242 Y109.594 E.05879
G1 X146.242 Y111.174 E.04855
G1 X144.329 Y111.174 E.05879
G1 X144.329 Y109.654 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X146.242 Y109.594 E-.72745
G1 X146.242 Y109.68 E-.03255
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.139 J-1.209 P1  F30000
G1 X114.85 Y106.082 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5997
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X142.183 Y109.987 E.05793
G1 X142.183 Y110.782 E.0264
G1 X114.554 Y110.782 E.91651
G1 X114.554 Y105.487 E.17567
G1 X141.861 Y105.487 E.90581
G1 X141.861 Y106.082 E.01977
G1 X114.91 Y106.082 E.894
; WIPE_START
G1 F24000
G1 X114.879 Y108.082 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.104 J1.212 P1  F30000
G1 X145.044 Y105.487 Z2
G1 Z1.6
G1 E.8 F1800
G1 F5997
G1 X145.85 Y105.487 E.02675
G1 X145.85 Y106.082 E.01977
G1 X145.044 Y106.082 E.02675
G1 X145.044 Y105.547 E.01777
; WIPE_START
G1 F24000
G1 X145.85 Y105.487 E-.30732
G1 X145.85 Y106.082 E-.22642
G1 X145.255 Y106.082 E-.22626
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.016 J-1.217 P1  F30000
G1 X115.242 Y106.474 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5997
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X142.575 Y109.594 E.06541
G1 X142.575 Y111.174 E.04855
G1 X114.162 Y111.174 E.87306
G1 X114.162 Y105.094 E.18682
G1 X146.242 Y105.094 E.98573
G1 X146.242 Y106.474 E.0424
G1 X115.302 Y106.474 E.9507
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5997
G1 X141.657 Y105.784 E.41376
; WIPE_START
G1 F24000
G1 X139.657 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.132 J1.21 P1  F30000
G1 X144.068 Y106.267 Z2
G1 Z1.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F5997
G1 X144.821 Y105.514 E.03273
G1 X144.5 Y105.302
G1 X143.535 Y106.267 E.04194
G1 X143.001 Y106.267
G1 X143.967 Y105.302 E.04194
G1 X143.433 Y105.302
G1 X142.468 Y106.267 E.04194
M73 P63 R4
G1 X142.083 Y106.119
G1 X142.9 Y105.302 E.03551
M204 S10000
; WIPE_START
G1 F24000
G1 X142.083 Y106.119 E-.43909
G1 X142.468 Y106.267 E-.1568
G1 X142.774 Y105.962 E-.16411
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.087 J1.214 P1  F30000
G1 X145.247 Y105.784 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5997
G1 X145.646 Y105.784 E.00614
; WIPE_START
G1 F24000
G1 X145.247 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.992 J-.705 P1  F30000
G1 X141.98 Y110.384 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5997
G3 X140.422 Y110.384 I-.774 J-62.517 E.04935
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X134.13 Y110.434 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5997
G1 X132.502 Y110.434 E.05401
G1 X131.98 Y109.912 E.02448
G1 X128.593 Y109.743 E.11248
G1 X127.902 Y110.434 E.03242
G1 X124.826 Y110.434 E.10206
G1 X123.9 Y109.508 E.04343
G1 X121.283 Y109.378 E.08692
G1 X120.606 Y110.055 E.03176
G1 X120.606 Y110.434 E.01259
G1 X121.855 Y110.434 E.04143
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5997
G1 X114.758 Y110.384 E.17424
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/30
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
G3 Z2 I-.693 J1 P1  F30000
G1 X144.855 Y129.852 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5374
G1 X145.648 Y129.852 E.02631
G1 X145.648 Y130.648 E.0264
G1 X144.855 Y130.648 E.02631
G1 X144.855 Y129.912 E.02441
G1 X144.463 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5374
G1 X146.04 Y129.46 E.04847
G1 X146.04 Y131.04 E.04855
G1 X144.463 Y131.04 E.04847
G1 X144.463 Y129.52 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X146.04 Y129.46 E-.59981
G1 X146.04 Y129.882 E-.16019
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.12 J-.477 P1  F30000
G1 X144.366 Y125.948 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5374
G1 X144.366 Y125.352 E.01977
G1 X145.648 Y125.352 E.04253
G1 X145.648 Y125.948 E.01977
G1 X144.426 Y125.948 E.04054
G1 X143.974 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5374
G1 X143.974 Y124.96 E.0424
G1 X146.04 Y124.96 E.06349
G1 X146.04 Y126.34 E.0424
G1 X144.034 Y126.34 E.06165
M204 S10000
G1 X144.569 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5374
G1 X145.444 Y125.65 E.01346
; WIPE_START
G1 F24000
G1 X144.569 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.012 J-1.217 P1  F30000
G1 X114.648 Y125.948 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5374
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
G1 X140.235 Y129.852 E.66426
G1 X141.645 Y129.852 E.04678
G1 X141.645 Y130.648 E.0264
G1 X114.352 Y130.648 E.90536
G1 X114.352 Y125.352 E.17567
G1 X142.134 Y125.352 E.92159
G1 X142.134 Y125.948 E.01977
G1 X114.708 Y125.948 E.90978
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5374
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X142.037 Y129.46 E.05508
G1 X142.037 Y131.04 E.04855
G1 X113.96 Y131.04 E.86274
G1 X113.96 Y124.96 E.18682
G1 X142.526 Y124.96 E.87776
G1 X142.526 Y126.34 E.0424
G1 X115.1 Y126.34 E.84274
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5374
G1 X141.931 Y125.65 E.42108
; WIPE_START
G1 F24000
G1 X139.931 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.156 J.38 P1  F30000
G1 X141.442 Y130.25 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5374
G3 X140.22 Y130.25 I-.606 J-49.028 E.0387
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X133.928 Y130.3 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5374
G1 X132.3 Y130.3 E.05401
G1 X131.778 Y129.778 E.02448
G1 X128.391 Y129.609 E.11248
G1 X127.7 Y130.3 E.03242
G1 X124.624 Y130.3 E.10206
G1 X123.698 Y129.374 E.04343
G1 X121.081 Y129.243 E.08692
G1 X120.404 Y129.92 E.03176
G1 X120.404 Y130.3 E.01259
G1 X121.653 Y130.3 E.04143
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5374
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.705 J.992 P1  F30000
G1 X145.057 Y109.987 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5374
G1 X145.85 Y109.987 E.02631
G1 X145.85 Y110.782 E.0264
G1 X145.057 Y110.782 E.02631
G1 X145.057 Y110.047 E.02441
G1 X144.665 Y109.594 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P64 R4
G1 F5374
G1 X146.242 Y109.594 E.04847
G1 X146.242 Y111.174 E.04855
G1 X144.665 Y111.174 E.04847
G1 X144.665 Y109.654 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X146.242 Y109.594 E-.59981
G1 X146.242 Y110.016 E-.16019
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.12 J-.477 P1  F30000
G1 X144.568 Y106.082 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5374
G1 X144.568 Y105.487 E.01977
G1 X145.85 Y105.487 E.04253
G1 X145.85 Y106.082 E.01977
G1 X144.628 Y106.082 E.04054
G1 X144.176 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5374
G1 X144.176 Y105.094 E.0424
G1 X146.242 Y105.094 E.06349
G1 X146.242 Y106.474 E.0424
G1 X144.236 Y106.474 E.06165
M204 S10000
G1 X144.771 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5374
G1 X145.646 Y105.784 E.01346
; WIPE_START
G1 F24000
G1 X144.771 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.012 J-1.217 P1  F30000
G1 X114.85 Y106.082 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5374
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X141.847 Y109.987 E.04678
G1 X141.847 Y110.782 E.0264
G1 X114.554 Y110.782 E.90536
G1 X114.554 Y105.487 E.17567
G1 X142.336 Y105.487 E.92159
G1 X142.336 Y106.082 E.01977
G1 X114.91 Y106.082 E.90978
G1 X115.242 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5374
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X142.239 Y109.594 E.05508
G1 X142.239 Y111.174 E.04855
G1 X114.162 Y111.174 E.86274
G1 X114.162 Y105.094 E.18682
G1 X142.728 Y105.094 E.87776
G1 X142.728 Y106.474 E.0424
G1 X115.302 Y106.474 E.84274
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5374
G1 X142.133 Y105.784 E.42108
; WIPE_START
G1 F24000
G1 X140.133 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.156 J.38 P1  F30000
G1 X141.644 Y110.384 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5374
G3 X140.422 Y110.384 I-.606 J-49.028 E.0387
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X134.13 Y110.434 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5374
G1 X132.502 Y110.434 E.05401
G1 X131.98 Y109.912 E.02448
G1 X128.593 Y109.743 E.11248
G1 X127.902 Y110.434 E.03242
G1 X124.826 Y110.434 E.10206
G1 X123.9 Y109.508 E.04343
G1 X121.283 Y109.378 E.08692
G1 X120.606 Y110.055 E.03176
G1 X120.606 Y110.434 E.01259
G1 X121.855 Y110.434 E.04143
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5374
G1 X114.758 Y110.384 E.17424
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/30
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
G3 Z2.2 I-.689 J1.003 P1  F30000
G1 X145.081 Y129.852 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5288
G1 X145.648 Y129.852 E.01882
G1 X145.648 Y130.648 E.0264
G1 X145.081 Y130.648 E.01882
G1 X145.081 Y129.912 E.02441
G1 X144.688 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5288
G1 X146.04 Y129.46 E.04153
G1 X146.04 Y131.04 E.04855
G1 X144.688 Y131.04 E.04153
G1 X144.688 Y129.52 E.04671
M204 S10000
G1 X145.364 Y130.056 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203242
G1 F5288
G1 X145.364 Y130.444 E.00508
; WIPE_START
G1 F24000
G1 X145.364 Y130.056 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.202 J-.192 P1  F30000
G1 X144.706 Y125.948 Z2.4
G1 Z2
M73 P65 R4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5288
G1 X144.706 Y125.352 E.01977
G1 X145.648 Y125.352 E.03124
G1 X145.648 Y125.948 E.01977
G1 X144.766 Y125.948 E.02925
G1 X144.314 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5288
G1 X144.314 Y124.96 E.0424
G1 X146.04 Y124.96 E.05303
G1 X146.04 Y126.34 E.0424
G1 X144.374 Y126.34 E.05119
M204 S10000
G1 X144.91 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5288
G1 X145.444 Y125.65 E.00822
; WIPE_START
G1 F24000
G1 X144.91 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.012 J-1.217 P1  F30000
G1 X114.648 Y125.948 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5288
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
M73 P65 R3
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
G1 X140.235 Y129.852 E.66426
G1 X141.419 Y129.852 E.03929
G1 X141.419 Y130.648 E.0264
G1 X114.352 Y130.648 E.89788
G1 X114.352 Y125.352 E.17567
G1 X141.794 Y125.352 E.91029
G1 X141.794 Y125.948 E.01977
G1 X114.708 Y125.948 E.89849
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5288
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X141.812 Y129.46 E.04814
G1 X141.812 Y131.04 E.04855
G1 X113.96 Y131.04 E.8558
G1 X113.96 Y124.96 E.18682
G1 X142.186 Y124.96 E.8673
G1 X142.186 Y126.34 E.0424
G1 X115.1 Y126.34 E.83227
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5288
G1 X141.59 Y125.65 E.41584
; WIPE_START
G1 F24000
G1 X139.59 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.147 J.406 P1  F30000
G1 X141.216 Y130.25 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5288
G3 X140.22 Y130.25 I-.493 J-39.967 E.03155
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X133.928 Y130.3 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5288
G1 X132.3 Y130.3 E.05401
G1 X131.778 Y129.778 E.02448
G1 X128.391 Y129.609 E.11248
G1 X127.7 Y130.3 E.03242
G1 X124.624 Y130.3 E.10206
G1 X123.698 Y129.374 E.04343
G1 X121.081 Y129.243 E.08692
G1 X120.404 Y129.92 E.03176
G1 X120.404 Y130.3 E.01259
G1 X121.653 Y130.3 E.04143
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5288
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.701 J.994 P1  F30000
G1 X145.283 Y109.987 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5288
G1 X145.85 Y109.987 E.01882
G1 X145.85 Y110.782 E.0264
G1 X145.283 Y110.782 E.01882
G1 X145.283 Y110.047 E.02441
G1 X144.891 Y109.594 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5288
G1 X146.242 Y109.594 E.04153
G1 X146.242 Y111.174 E.04855
G1 X144.891 Y111.174 E.04153
G1 X144.891 Y109.654 E.04671
M204 S10000
G1 X145.566 Y110.19 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203242
G1 F5288
G1 X145.566 Y110.579 E.00508
; WIPE_START
G1 F24000
G1 X145.566 Y110.19 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.202 J-.192 P1  F30000
G1 X144.908 Y106.082 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5288
G1 X144.908 Y105.487 E.01977
G1 X145.85 Y105.487 E.03124
G1 X145.85 Y106.082 E.01977
G1 X144.968 Y106.082 E.02925
G1 X144.516 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5288
G1 X144.516 Y105.094 E.0424
G1 X146.242 Y105.094 E.05303
G1 X146.242 Y106.474 E.0424
G1 X144.576 Y106.474 E.05119
M204 S10000
G1 X145.112 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5288
G1 X145.646 Y105.784 E.00822
; WIPE_START
G1 F24000
G1 X145.112 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.012 J-1.217 P1  F30000
G1 X114.85 Y106.082 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5288
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X141.622 Y109.987 E.03929
G1 X141.622 Y110.782 E.0264
G1 X114.554 Y110.782 E.89788
G1 X114.554 Y105.487 E.17567
G1 X141.996 Y105.487 E.91029
G1 X141.996 Y106.082 E.01977
G1 X114.91 Y106.082 E.89849
G1 X115.242 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5288
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X142.014 Y109.594 E.04814
G1 X142.014 Y111.174 E.04855
G1 X114.162 Y111.174 E.8558
G1 X114.162 Y105.094 E.18682
G1 X142.388 Y105.094 E.8673
G1 X142.388 Y106.474 E.0424
G1 X115.302 Y106.474 E.83227
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5288
G1 X141.792 Y105.784 E.41584
; WIPE_START
G1 F24000
G1 X139.792 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.147 J.406 P1  F30000
G1 X141.418 Y110.384 Z2.4
G1 Z2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5288
G3 X140.422 Y110.384 I-.493 J-39.967 E.03155
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X134.13 Y110.434 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5288
G1 X132.502 Y110.434 E.05401
G1 X131.98 Y109.912 E.02448
G1 X128.593 Y109.743 E.11248
G1 X127.902 Y110.434 E.03242
G1 X124.826 Y110.434 E.10206
M73 P66 R3
G1 X123.9 Y109.508 E.04343
G1 X121.283 Y109.378 E.08692
G1 X120.606 Y110.055 E.03176
G1 X120.606 Y110.434 E.01259
G1 X121.855 Y110.434 E.04143
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5288
G1 X114.758 Y110.384 E.17424
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/30
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
G3 Z2.4 I-.687 J1.004 P1  F30000
G1 X145.221 Y129.852 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5227
G1 X145.648 Y129.852 E.01416
G1 X145.648 Y130.648 E.0264
G1 X145.221 Y130.648 E.01416
G1 X145.221 Y129.912 E.02441
G1 X144.829 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5227
G1 X146.04 Y129.46 E.03721
G1 X146.04 Y131.04 E.04855
G1 X144.829 Y131.04 E.03721
G1 X144.829 Y129.52 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X146.04 Y129.46 E-.46072
G1 X146.04 Y130.248 E-.29928
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.178 J-.307 P1  F30000
G1 X144.92 Y125.948 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5227
G1 X144.92 Y125.352 E.01977
G1 X145.648 Y125.352 E.02416
G1 X145.648 Y125.948 E.01977
G1 X144.98 Y125.948 E.02217
G1 X144.527 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5227
G1 X144.527 Y124.96 E.0424
G1 X146.04 Y124.96 E.04647
G1 X146.04 Y126.34 E.0424
G1 X144.587 Y126.34 E.04463
M204 S10000
; WIPE_START
G1 F24000
G1 X144.527 Y124.96 E-.5249
G1 X145.146 Y124.96 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.039 J-1.216 P1  F30000
G1 X114.648 Y125.948 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5227
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
G1 X140.235 Y129.852 E.66426
G1 X141.279 Y129.852 E.03463
G1 X141.279 Y130.648 E.0264
G1 X114.352 Y130.648 E.89321
G1 X114.352 Y125.352 E.17567
G1 X141.58 Y125.352 E.90321
G1 X141.58 Y125.948 E.01977
G1 X114.708 Y125.948 E.89141
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5227
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X141.671 Y129.46 E.04382
G1 X141.671 Y131.04 E.04855
G1 X113.96 Y131.04 E.85148
G1 X113.96 Y124.96 E.18682
G1 X141.973 Y124.96 E.86075
G1 X141.973 Y126.34 E.0424
G1 X115.1 Y126.34 E.82572
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5227
G1 X141.377 Y125.65 E.41256
; WIPE_START
G1 F24000
G1 X139.377 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.142 J.422 P1  F30000
G1 X141.075 Y130.25 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5227
G3 X140.22 Y130.25 I-.423 J-34.323 E.02709
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X133.928 Y130.3 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5227
G1 X132.3 Y130.3 E.05401
G1 X131.778 Y129.778 E.02448
G1 X128.391 Y129.609 E.11248
G1 X127.7 Y130.3 E.03242
G1 X124.624 Y130.3 E.10206
G1 X123.698 Y129.374 E.04343
G1 X121.081 Y129.243 E.08692
G1 X120.404 Y129.92 E.03176
G1 X120.404 Y130.3 E.01259
G1 X121.653 Y130.3 E.04143
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5227
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.699 J.996 P1  F30000
G1 X145.423 Y109.987 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5227
G1 X145.85 Y109.987 E.01416
G1 X145.85 Y110.782 E.0264
G1 X145.423 Y110.782 E.01416
G1 X145.423 Y110.047 E.02441
G1 X145.031 Y109.594 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P67 R3
G1 F5227
G1 X146.242 Y109.594 E.03721
G1 X146.242 Y111.174 E.04855
G1 X145.031 Y111.174 E.03721
G1 X145.031 Y109.654 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X146.242 Y109.594 E-.46072
G1 X146.242 Y110.382 E-.29928
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.178 J-.307 P1  F30000
G1 X145.122 Y106.082 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5227
G1 X145.122 Y105.487 E.01977
G1 X145.85 Y105.487 E.02416
G1 X145.85 Y106.082 E.01977
G1 X145.182 Y106.082 E.02217
G1 X144.73 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5227
G1 X144.73 Y105.094 E.0424
G1 X146.242 Y105.094 E.04647
G1 X146.242 Y106.474 E.0424
G1 X144.79 Y106.474 E.04463
M204 S10000
; WIPE_START
G1 F24000
G1 X144.73 Y105.094 E-.5249
G1 X145.348 Y105.094 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.039 J-1.216 P1  F30000
G1 X114.85 Y106.082 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5227
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X141.481 Y109.987 E.03463
G1 X141.481 Y110.782 E.0264
G1 X114.554 Y110.782 E.89321
G1 X114.554 Y105.487 E.17567
G1 X141.783 Y105.487 E.90321
G1 X141.783 Y106.082 E.01977
G1 X114.91 Y106.082 E.89141
G1 X115.242 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5227
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X141.873 Y109.594 E.04382
G1 X141.873 Y111.174 E.04855
G1 X114.162 Y111.174 E.85148
G1 X114.162 Y105.094 E.18682
G1 X142.175 Y105.094 E.86075
G1 X142.175 Y106.474 E.0424
G1 X115.302 Y106.474 E.82572
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5227
G1 X141.579 Y105.784 E.41256
; WIPE_START
G1 F24000
G1 X139.579 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.142 J.422 P1  F30000
G1 X141.277 Y110.384 Z2.6
G1 Z2.2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5227
G3 X140.422 Y110.384 I-.423 J-34.323 E.02709
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X134.13 Y110.434 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5227
G1 X132.502 Y110.434 E.05401
G1 X131.98 Y109.912 E.02448
G1 X128.593 Y109.743 E.11248
G1 X127.902 Y110.434 E.03242
G1 X124.826 Y110.434 E.10206
G1 X123.9 Y109.508 E.04343
G1 X121.283 Y109.378 E.08692
G1 X120.606 Y110.055 E.03176
G1 X120.606 Y110.434 E.01259
G1 X121.855 Y110.434 E.04143
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5227
G1 X114.758 Y110.384 E.17424
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/30
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
G3 Z2.6 I-.685 J1.006 P1  F30000
G1 X145.338 Y129.852 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5189
G1 X145.648 Y129.852 E.01027
G1 X145.648 Y130.648 E.0264
G1 X145.338 Y130.648 E.01027
G1 X145.338 Y129.912 E.02441
G1 X144.946 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5189
G1 X146.04 Y129.46 E.03361
G1 X146.04 Y131.04 E.04855
G1 X144.946 Y131.04 E.03361
G1 X144.946 Y129.52 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X146.04 Y129.46 E-.41622
G1 X146.04 Y130.365 E-.34378
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.188 J-.264 P1  F30000
G1 X145.058 Y125.948 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5189
G1 X145.058 Y125.352 E.01977
M73 P68 R3
G1 X145.648 Y125.352 E.01958
G1 X145.648 Y125.948 E.01977
G1 X145.118 Y125.948 E.01759
G1 X144.666 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5189
G1 X144.666 Y124.96 E.0424
G1 X146.04 Y124.96 E.04223
G1 X146.04 Y126.34 E.0424
G1 X144.726 Y126.34 E.04039
M204 S10000
; WIPE_START
G1 F24000
G1 X144.666 Y124.96 E-.5249
G1 X145.284 Y124.96 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.039 J-1.216 P1  F30000
G1 X114.648 Y125.948 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5189
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
G1 X140.235 Y129.852 E.66426
G1 X141.162 Y129.852 E.03074
G1 X141.162 Y130.648 E.0264
G1 X114.352 Y130.648 E.88932
G1 X114.352 Y125.352 E.17567
G1 X141.442 Y125.352 E.89863
G1 X141.442 Y125.948 E.01977
G1 X114.708 Y125.948 E.88683
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5189
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X141.554 Y129.46 E.04022
G1 X141.554 Y131.04 E.04855
G1 X113.96 Y131.04 E.84788
G1 X113.96 Y124.96 E.18682
G1 X141.834 Y124.96 E.8565
G1 X141.834 Y126.34 E.0424
G1 X115.1 Y126.34 E.82148
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5189
G1 X141.239 Y125.65 E.41044
; WIPE_START
G1 F24000
G1 X139.239 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.14 J.426 P1  F30000
G1 X140.958 Y130.25 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5189
G1 X140.22 Y130.25 E.02338
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X133.928 Y130.3 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5189
G1 X132.3 Y130.3 E.05401
G1 X131.778 Y129.778 E.02448
G1 X128.391 Y129.609 E.11248
G1 X127.7 Y130.3 E.03242
G1 X124.624 Y130.3 E.10206
G1 X123.698 Y129.374 E.04343
G1 X121.081 Y129.243 E.08692
G1 X120.404 Y129.92 E.03176
G1 X120.404 Y130.3 E.01259
G1 X121.653 Y130.3 E.04143
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5189
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.697 J.997 P1  F30000
G1 X145.541 Y109.987 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5189
G1 X145.85 Y109.987 E.01027
G1 X145.85 Y110.782 E.0264
G1 X145.541 Y110.782 E.01027
G1 X145.541 Y110.047 E.02441
G1 X145.148 Y109.594 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5189
G1 X146.242 Y109.594 E.03361
G1 X146.242 Y111.174 E.04855
G1 X145.148 Y111.174 E.03361
G1 X145.148 Y109.654 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X146.242 Y109.594 E-.41622
G1 X146.242 Y110.499 E-.34378
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.188 J-.264 P1  F30000
G1 X145.26 Y106.082 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5189
G1 X145.26 Y105.487 E.01977
G1 X145.85 Y105.487 E.01958
G1 X145.85 Y106.082 E.01977
G1 X145.32 Y106.082 E.01759
G1 X144.868 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5189
G1 X144.868 Y105.094 E.0424
G1 X146.242 Y105.094 E.04223
G1 X146.242 Y106.474 E.0424
G1 X144.928 Y106.474 E.04039
M204 S10000
; WIPE_START
G1 F24000
G1 X144.868 Y105.094 E-.5249
G1 X145.486 Y105.094 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.039 J-1.216 P1  F30000
G1 X114.85 Y106.082 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5189
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X141.364 Y109.987 E.03074
G1 X141.364 Y110.782 E.0264
G1 X114.554 Y110.782 E.88932
G1 X114.554 Y105.487 E.17567
G1 X141.644 Y105.487 E.89863
G1 X141.644 Y106.082 E.01977
G1 X114.91 Y106.082 E.88683
G1 X115.242 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5189
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X141.756 Y109.594 E.04022
G1 X141.756 Y111.174 E.04855
G1 X114.162 Y111.174 E.84788
G1 X114.162 Y105.094 E.18682
G1 X142.037 Y105.094 E.8565
G1 X142.037 Y106.474 E.0424
G1 X115.302 Y106.474 E.82148
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5189
G1 X141.441 Y105.784 E.41044
; WIPE_START
G1 F24000
G1 X139.441 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.14 J.426 P1  F30000
G1 X141.16 Y110.384 Z2.8
G1 Z2.4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5189
G1 X140.422 Y110.384 E.02338
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X134.13 Y110.434 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5189
G1 X132.502 Y110.434 E.05401
G1 X131.98 Y109.912 E.02448
G1 X128.593 Y109.743 E.11248
G1 X127.902 Y110.434 E.03242
G1 X124.826 Y110.434 E.10206
G1 X123.9 Y109.508 E.04343
G1 X121.283 Y109.378 E.08692
G1 X120.606 Y110.055 E.03176
M73 P69 R3
G1 X120.606 Y110.434 E.01259
G1 X121.855 Y110.434 E.04143
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5189
G1 X114.758 Y110.384 E.17424
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/30
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
G3 Z2.8 I-.681 J1.009 P1  F30000
G1 X145.022 Y129.46 Z2.8
G1 Z2.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5129
G1 X146.04 Y129.46 E.03127
G1 X146.04 Y131.04 E.04855
G1 X145.022 Y131.04 E.03127
G1 X145.022 Y129.52 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X146.04 Y129.46 E-.38744
G1 X146.04 Y130.44 E-.37256
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.194 J-.237 P1  F30000
G1 X145.149 Y125.948 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5129
G1 X145.149 Y125.352 E.01977
G1 X145.648 Y125.352 E.01656
G1 X145.648 Y125.948 E.01977
G1 X145.209 Y125.948 E.01457
G1 X144.757 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5129
G1 X144.757 Y124.96 E.0424
G1 X146.04 Y124.96 E.03943
G1 X146.04 Y126.34 E.0424
G1 X144.817 Y126.34 E.03759
M204 S10000
G1 X145.398 Y125.744 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134926
G1 F5129
G1 X145.398 Y125.556 E.00142
; WIPE_START
G1 F24000
G1 X145.398 Y125.744 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.008 J-1.217 P1  F30000
G1 X114.648 Y125.948 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5129
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
G1 X140.235 Y129.852 E.66426
G1 X141.086 Y129.852 E.02822
G1 X141.086 Y130.648 E.0264
G1 X114.352 Y130.648 E.8868
G1 X114.352 Y125.352 E.17567
G1 X141.351 Y125.352 E.89561
G1 X141.351 Y125.948 E.01977
G1 X114.708 Y125.948 E.88381
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5129
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X141.478 Y129.46 E.03789
G1 X141.478 Y131.04 E.04855
G1 X113.96 Y131.04 E.84555
G1 X113.96 Y124.96 E.18682
G1 X141.743 Y124.96 E.8537
G1 X141.743 Y126.34 E.0424
G1 X115.1 Y126.34 E.81867
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5129
G1 X141.148 Y125.65 E.40903
; WIPE_START
G1 F24000
G1 X139.148 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.139 J.429 P1  F30000
G1 X140.882 Y130.25 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5129
G1 X140.22 Y130.25 E.02097
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X133.928 Y130.3 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5129
G1 X132.3 Y130.3 E.05401
G1 X131.778 Y129.778 E.02448
G1 X128.391 Y129.609 E.11248
G1 X127.7 Y130.3 E.03242
G1 X124.624 Y130.3 E.10206
G1 X123.698 Y129.374 E.04343
G1 X121.081 Y129.243 E.08692
G1 X120.404 Y129.92 E.03176
G1 X120.404 Y130.3 E.01259
G1 X121.653 Y130.3 E.04143
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5129
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.711 J.987 P1  F30000
G1 X145.224 Y109.594 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5129
G1 X146.242 Y109.594 E.03127
G1 X146.242 Y111.174 E.04855
G1 X145.224 Y111.174 E.03127
G1 X145.224 Y109.654 E.04671
M204 S10000
; WIPE_START
G1 F24000
M73 P70 R3
G1 X146.242 Y109.594 E-.38744
G1 X146.242 Y110.575 E-.37256
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.194 J-.237 P1  F30000
G1 X145.351 Y106.082 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5129
G1 X145.351 Y105.487 E.01977
G1 X145.85 Y105.487 E.01656
G1 X145.85 Y106.082 E.01977
G1 X145.411 Y106.082 E.01457
G1 X144.959 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5129
G1 X144.959 Y105.094 E.0424
G1 X146.242 Y105.094 E.03943
G1 X146.242 Y106.474 E.0424
G1 X145.019 Y106.474 E.03759
M204 S10000
G1 X145.6 Y105.879 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134926
G1 F5129
G1 X145.6 Y105.69 E.00142
; WIPE_START
G1 F24000
G1 X145.6 Y105.879 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.008 J-1.217 P1  F30000
G1 X114.85 Y106.082 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5129
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X141.288 Y109.987 E.02822
G1 X141.288 Y110.782 E.0264
G1 X114.554 Y110.782 E.8868
G1 X114.554 Y105.487 E.17567
G1 X141.553 Y105.487 E.89561
G1 X141.553 Y106.082 E.01977
G1 X114.91 Y106.082 E.88381
G1 X115.242 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5129
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X141.68 Y109.594 E.03789
G1 X141.68 Y111.174 E.04855
G1 X114.162 Y111.174 E.84555
G1 X114.162 Y105.094 E.18682
G1 X141.945 Y105.094 E.8537
G1 X141.945 Y106.474 E.0424
G1 X115.302 Y106.474 E.81867
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5129
G1 X141.35 Y105.784 E.40903
; WIPE_START
G1 F24000
G1 X139.35 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.139 J.429 P1  F30000
G1 X141.084 Y110.384 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5129
G1 X140.422 Y110.384 E.02097
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X134.13 Y110.434 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5129
G1 X132.502 Y110.434 E.05401
G1 X131.98 Y109.912 E.02448
G1 X128.593 Y109.743 E.11248
G1 X127.902 Y110.434 E.03242
G1 X124.826 Y110.434 E.10206
G1 X123.9 Y109.508 E.04343
G1 X121.283 Y109.378 E.08692
G1 X120.606 Y110.055 E.03176
G1 X120.606 Y110.434 E.01259
G1 X121.855 Y110.434 E.04143
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5129
G1 X114.758 Y110.384 E.17424
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/30
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
G3 Z3 I-.68 J1.009 P1  F30000
G1 X145.074 Y129.46 Z3
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5130
G1 X146.04 Y129.46 E.0297
G1 X146.04 Y131.04 E.04855
G1 X145.074 Y131.04 E.0297
G1 X145.074 Y129.52 E.04671
M204 S10000
G1 X145.557 Y129.656 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.617268
G1 F5130
G1 X145.557 Y130.844 E.0556
; WIPE_START
G1 F24000
G1 X145.557 Y129.656 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.212 J-.111 P1  F30000
G1 X145.216 Y125.948 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5130
G1 X145.216 Y125.352 E.01977
G1 X145.648 Y125.352 E.01434
G1 X145.648 Y125.948 E.01977
G1 X145.276 Y125.948 E.01235
G1 X144.824 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5130
G1 X144.824 Y124.96 E.0424
G1 X146.04 Y124.96 E.03738
G1 X146.04 Y126.34 E.0424
G1 X144.884 Y126.34 E.03553
M204 S10000
; WIPE_START
G1 F24000
G1 X144.824 Y124.96 E-.5249
G1 X145.442 Y124.96 E-.2351
; WIPE_END
M73 P71 R3
G1 E-.04 F1800
G17
G3 Z3.2 I-.039 J-1.216 P1  F30000
G1 X114.648 Y125.948 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5130
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
G1 X140.235 Y129.852 E.66426
G1 X141.034 Y129.852 E.02652
G1 X141.034 Y130.648 E.0264
G1 X114.352 Y130.648 E.8851
G1 X114.352 Y125.352 E.17567
G1 X141.284 Y125.352 E.89339
G1 X141.284 Y125.948 E.01977
G1 X114.708 Y125.948 E.88159
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5130
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X141.426 Y129.46 E.03631
G1 X141.426 Y131.04 E.04855
G1 X113.96 Y131.04 E.84397
G1 X113.96 Y124.96 E.18682
G1 X141.676 Y124.96 E.85165
G1 X141.676 Y126.34 E.0424
G1 X115.1 Y126.34 E.81662
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5130
G1 X141.081 Y125.65 E.40801
; WIPE_START
G1 F24000
G1 X139.081 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.137 J.433 P1  F30000
G1 X140.831 Y130.25 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5130
G1 X140.22 Y130.25 E.01934
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X133.928 Y130.3 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5130
G1 X132.3 Y130.3 E.05401
G1 X131.778 Y129.778 E.02448
G1 X128.391 Y129.609 E.11248
G1 X127.7 Y130.3 E.03242
G1 X124.624 Y130.3 E.10206
G1 X123.698 Y129.374 E.04343
G1 X121.081 Y129.243 E.08692
G1 X120.404 Y129.92 E.03176
G1 X120.404 Y130.3 E.01259
G1 X121.653 Y130.3 E.04143
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5130
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.711 J.988 P1  F30000
G1 X145.276 Y109.594 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5130
G1 X146.242 Y109.594 E.0297
G1 X146.242 Y111.174 E.04855
G1 X145.276 Y111.174 E.0297
G1 X145.276 Y109.654 E.04671
M204 S10000
G1 X145.759 Y109.791 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.617268
G1 F5130
G1 X145.759 Y110.978 E.0556
; WIPE_START
G1 F24000
G1 X145.759 Y109.791 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.212 J-.111 P1  F30000
G1 X145.418 Y106.082 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5130
G1 X145.418 Y105.487 E.01977
G1 X145.85 Y105.487 E.01434
G1 X145.85 Y106.082 E.01977
G1 X145.478 Y106.082 E.01235
G1 X145.026 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5130
G1 X145.026 Y105.094 E.0424
G1 X146.242 Y105.094 E.03738
G1 X146.242 Y106.474 E.0424
G1 X145.086 Y106.474 E.03553
M204 S10000
; WIPE_START
G1 F24000
G1 X145.026 Y105.094 E-.5249
G1 X145.644 Y105.094 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.039 J-1.216 P1  F30000
G1 X114.85 Y106.082 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5130
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X141.236 Y109.987 E.02652
G1 X141.236 Y110.782 E.0264
G1 X114.554 Y110.782 E.8851
G1 X114.554 Y105.487 E.17567
G1 X141.486 Y105.487 E.89339
G1 X141.486 Y106.082 E.01977
G1 X114.91 Y106.082 E.88159
G1 X115.242 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5130
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X141.629 Y109.594 E.03631
G1 X141.629 Y111.174 E.04855
G1 X114.162 Y111.174 E.84397
G1 X114.162 Y105.094 E.18682
G1 X141.879 Y105.094 E.85165
G1 X141.879 Y106.474 E.0424
G1 X115.302 Y106.474 E.81662
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5130
G1 X141.283 Y105.784 E.40801
; WIPE_START
G1 F24000
G1 X139.283 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.137 J.433 P1  F30000
G1 X141.033 Y110.384 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5130
G1 X140.422 Y110.384 E.01934
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X134.13 Y110.434 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5130
G1 X132.502 Y110.434 E.05401
G1 X131.98 Y109.912 E.02448
G1 X128.593 Y109.743 E.11248
G1 X127.902 Y110.434 E.03242
G1 X124.826 Y110.434 E.10206
G1 X123.9 Y109.508 E.04343
G1 X121.283 Y109.378 E.08692
G1 X120.606 Y110.055 E.03176
G1 X120.606 Y110.434 E.01259
G1 X121.855 Y110.434 E.04143
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5130
M73 P72 R3
G1 X114.758 Y110.384 E.17424
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/30
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
G3 Z3.2 I-.68 J1.01 P1  F30000
G1 X145.098 Y129.46 Z3.2
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5124
G1 X146.04 Y129.46 E.02895
G1 X146.04 Y131.04 E.04855
G1 X145.098 Y131.04 E.02895
G1 X145.098 Y129.52 E.04671
M204 S10000
G1 X145.569 Y129.656 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.592984
G1 F5124
G1 X145.569 Y130.844 E.05325
; WIPE_START
G1 F24000
G1 X145.569 Y129.656 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.212 J-.108 P1  F30000
G1 X145.24 Y125.948 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5124
G1 X145.24 Y125.352 E.01977
G1 X145.648 Y125.352 E.01353
G1 X145.648 Y125.948 E.01977
G1 X145.3 Y125.948 E.01154
G1 X144.848 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5124
G1 X144.848 Y124.96 E.0424
G1 X146.04 Y124.96 E.03663
G1 X146.04 Y126.34 E.0424
G1 X144.908 Y126.34 E.03479
M204 S10000
; WIPE_START
G1 F24000
G1 X144.848 Y124.96 E-.5249
G1 X145.467 Y124.96 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.039 J-1.216 P1  F30000
G1 X114.648 Y125.948 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5124
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
G1 X140.235 Y129.852 E.66426
G1 X141.01 Y129.852 E.02571
G1 X141.01 Y130.648 E.0264
G1 X114.352 Y130.648 E.88429
G1 X114.352 Y125.352 E.17567
G1 X141.26 Y125.352 E.89259
G1 X141.26 Y125.948 E.01977
G1 X114.708 Y125.948 E.88078
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5124
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X141.402 Y129.46 E.03556
G1 X141.402 Y131.04 E.04855
G1 X113.96 Y131.04 E.84322
G1 X113.96 Y124.96 E.18682
G1 X141.652 Y124.96 E.8509
G1 X141.652 Y126.34 E.0424
G1 X115.1 Y126.34 E.81587
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5124
G1 X141.057 Y125.65 E.40763
; WIPE_START
G1 F24000
G1 X139.057 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.137 J.433 P1  F30000
G1 X140.807 Y130.25 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5124
G1 X140.22 Y130.25 E.01858
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X133.928 Y130.3 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5124
G1 X132.3 Y130.3 E.05401
G1 X131.778 Y129.778 E.02448
G1 X128.391 Y129.609 E.11248
G1 X127.7 Y130.3 E.03242
G1 X124.624 Y130.3 E.10206
G1 X123.698 Y129.374 E.04343
G1 X121.081 Y129.243 E.08692
G1 X120.404 Y129.92 E.03176
G1 X120.404 Y130.3 E.01259
G1 X121.653 Y130.3 E.04143
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5124
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.71 J.988 P1  F30000
G1 X145.3 Y109.594 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5124
G1 X146.242 Y109.594 E.02895
G1 X146.242 Y111.174 E.04855
G1 X145.3 Y111.174 E.02895
G1 X145.3 Y109.654 E.04671
M204 S10000
G1 X145.771 Y109.791 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.592984
G1 F5124
G1 X145.771 Y110.978 E.05325
; WIPE_START
G1 F24000
M73 P73 R3
G1 X145.771 Y109.791 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.212 J-.108 P1  F30000
G1 X145.442 Y106.082 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5124
G1 X145.442 Y105.487 E.01977
G1 X145.85 Y105.487 E.01353
G1 X145.85 Y106.082 E.01977
G1 X145.502 Y106.082 E.01154
G1 X145.05 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5124
G1 X145.05 Y105.094 E.0424
G1 X146.242 Y105.094 E.03663
G1 X146.242 Y106.474 E.0424
G1 X145.11 Y106.474 E.03479
M204 S10000
; WIPE_START
G1 F24000
G1 X145.05 Y105.094 E-.5249
G1 X145.669 Y105.094 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.039 J-1.216 P1  F30000
G1 X114.85 Y106.082 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5124
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X141.212 Y109.987 E.02571
G1 X141.212 Y110.782 E.0264
G1 X114.554 Y110.782 E.88429
G1 X114.554 Y105.487 E.17567
G1 X141.462 Y105.487 E.89259
G1 X141.462 Y106.082 E.01977
G1 X114.91 Y106.082 E.88078
G1 X115.242 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5124
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X141.604 Y109.594 E.03556
G1 X141.604 Y111.174 E.04855
G1 X114.162 Y111.174 E.84322
G1 X114.162 Y105.094 E.18682
G1 X141.854 Y105.094 E.8509
G1 X141.854 Y106.474 E.0424
G1 X115.302 Y106.474 E.81587
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5124
G1 X141.259 Y105.784 E.40763
; WIPE_START
G1 F24000
G1 X139.259 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.137 J.433 P1  F30000
G1 X141.009 Y110.384 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5124
G1 X140.422 Y110.384 E.01858
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X134.13 Y110.434 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5124
G1 X132.502 Y110.434 E.05401
G1 X131.98 Y109.912 E.02448
G1 X128.593 Y109.743 E.11248
G1 X127.902 Y110.434 E.03242
G1 X124.826 Y110.434 E.10206
G1 X123.9 Y109.508 E.04343
G1 X121.283 Y109.378 E.08692
G1 X120.606 Y110.055 E.03176
G1 X120.606 Y110.434 E.01259
G1 X121.855 Y110.434 E.04143
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5124
G1 X114.758 Y110.384 E.17424
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/30
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
G3 Z3.4 I-.68 J1.01 P1  F30000
G1 X145.098 Y129.46 Z3.4
G1 Z3.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5124
G1 X146.04 Y129.46 E.02895
G1 X146.04 Y131.04 E.04855
G1 X145.098 Y131.04 E.02895
G1 X145.098 Y129.52 E.04671
M204 S10000
G1 X145.569 Y129.656 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.592984
G1 F5124
G1 X145.569 Y130.844 E.05325
; WIPE_START
G1 F24000
G1 X145.569 Y129.656 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P73 R2
G3 Z3.6 I1.212 J-.108 P1  F30000
G1 X145.24 Y125.948 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5124
G1 X145.24 Y125.352 E.01977
G1 X145.648 Y125.352 E.01353
G1 X145.648 Y125.948 E.01977
G1 X145.3 Y125.948 E.01154
G1 X144.848 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5124
G1 X144.848 Y124.96 E.0424
G1 X146.04 Y124.96 E.03663
G1 X146.04 Y126.34 E.0424
G1 X144.908 Y126.34 E.03479
M204 S10000
; WIPE_START
G1 F24000
G1 X144.848 Y124.96 E-.5249
G1 X145.467 Y124.96 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.039 J-1.216 P1  F30000
G1 X114.648 Y125.948 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5124
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
M73 P74 R2
G1 X140.235 Y129.852 E.66426
G1 X141.01 Y129.852 E.02571
G1 X141.01 Y130.648 E.0264
G1 X114.352 Y130.648 E.88429
G1 X114.352 Y125.352 E.17567
G1 X141.26 Y125.352 E.89259
G1 X141.26 Y125.948 E.01977
G1 X114.708 Y125.948 E.88078
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5124
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X141.402 Y129.46 E.03556
G1 X141.402 Y131.04 E.04855
G1 X113.96 Y131.04 E.84322
G1 X113.96 Y124.96 E.18682
G1 X141.652 Y124.96 E.8509
G1 X141.652 Y126.34 E.0424
G1 X115.1 Y126.34 E.81587
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5124
G1 X141.057 Y125.65 E.40763
; WIPE_START
G1 F24000
G1 X139.057 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.137 J.433 P1  F30000
G1 X140.807 Y130.25 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5124
G1 X140.22 Y130.25 E.01858
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X133.928 Y130.3 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5124
G1 X132.3 Y130.3 E.05401
G1 X131.778 Y129.778 E.02448
G1 X128.391 Y129.609 E.11248
G1 X127.7 Y130.3 E.03242
G1 X124.624 Y130.3 E.10206
G1 X123.698 Y129.374 E.04343
G1 X121.081 Y129.243 E.08692
G1 X120.404 Y129.92 E.03176
G1 X120.404 Y130.3 E.01259
G1 X121.653 Y130.3 E.04143
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5124
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.71 J.988 P1  F30000
G1 X145.3 Y109.594 Z3.6
G1 Z3.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5124
G1 X146.242 Y109.594 E.02895
G1 X146.242 Y111.174 E.04855
G1 X145.3 Y111.174 E.02895
G1 X145.3 Y109.654 E.04671
M204 S10000
G1 X145.771 Y109.791 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.592984
G1 F5124
G1 X145.771 Y110.978 E.05325
; WIPE_START
G1 F24000
G1 X145.771 Y109.791 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.212 J-.108 P1  F30000
G1 X145.442 Y106.082 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5124
G1 X145.442 Y105.487 E.01977
G1 X145.85 Y105.487 E.01353
G1 X145.85 Y106.082 E.01977
G1 X145.502 Y106.082 E.01154
G1 X145.05 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5124
G1 X145.05 Y105.094 E.0424
G1 X146.242 Y105.094 E.03663
G1 X146.242 Y106.474 E.0424
G1 X145.11 Y106.474 E.03479
M204 S10000
; WIPE_START
G1 F24000
G1 X145.05 Y105.094 E-.5249
G1 X145.669 Y105.094 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.039 J-1.216 P1  F30000
G1 X114.85 Y106.082 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5124
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X141.212 Y109.987 E.02571
G1 X141.212 Y110.782 E.0264
G1 X114.554 Y110.782 E.88429
G1 X114.554 Y105.487 E.17567
G1 X141.462 Y105.487 E.89259
G1 X141.462 Y106.082 E.01977
G1 X114.91 Y106.082 E.88078
G1 X115.242 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5124
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X141.604 Y109.594 E.03556
G1 X141.604 Y111.174 E.04855
G1 X114.162 Y111.174 E.84322
G1 X114.162 Y105.094 E.18682
G1 X141.854 Y105.094 E.8509
G1 X141.854 Y106.474 E.0424
G1 X115.302 Y106.474 E.81587
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5124
G1 X141.259 Y105.784 E.40763
; WIPE_START
G1 F24000
G1 X139.259 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.137 J.433 P1  F30000
G1 X141.009 Y110.384 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5124
G1 X140.422 Y110.384 E.01858
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X134.13 Y110.434 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5124
G1 X132.502 Y110.434 E.05401
G1 X131.98 Y109.912 E.02448
G1 X128.593 Y109.743 E.11248
G1 X127.902 Y110.434 E.03242
G1 X124.826 Y110.434 E.10206
G1 X123.9 Y109.508 E.04343
G1 X121.283 Y109.378 E.08692
G1 X120.606 Y110.055 E.03176
G1 X120.606 Y110.434 E.01259
G1 X121.855 Y110.434 E.04143
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5124
G1 X114.758 Y110.384 E.17424
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
M73 P75 R2
G1 E-.04 F1800
; layer num/total_layer_count: 17/30
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
G3 Z3.6 I-.68 J1.009 P1  F30000
G1 X145.074 Y129.46 Z3.6
G1 Z3.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5130
G1 X146.04 Y129.46 E.0297
G1 X146.04 Y131.04 E.04855
G1 X145.074 Y131.04 E.0297
G1 X145.074 Y129.52 E.04671
M204 S10000
G1 X145.557 Y129.656 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.617268
G1 F5130
G1 X145.557 Y130.844 E.0556
; WIPE_START
G1 F24000
G1 X145.557 Y129.656 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.212 J-.111 P1  F30000
G1 X145.216 Y125.948 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5130
G1 X145.216 Y125.352 E.01977
G1 X145.648 Y125.352 E.01434
G1 X145.648 Y125.948 E.01977
G1 X145.276 Y125.948 E.01235
G1 X144.824 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5130
G1 X144.824 Y124.96 E.0424
G1 X146.04 Y124.96 E.03738
G1 X146.04 Y126.34 E.0424
G1 X144.884 Y126.34 E.03553
M204 S10000
; WIPE_START
G1 F24000
G1 X144.824 Y124.96 E-.5249
G1 X145.442 Y124.96 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.039 J-1.216 P1  F30000
G1 X114.648 Y125.948 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5130
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
G1 X140.235 Y129.852 E.66426
G1 X141.034 Y129.852 E.02652
G1 X141.034 Y130.648 E.0264
G1 X114.352 Y130.648 E.8851
G1 X114.352 Y125.352 E.17567
G1 X141.284 Y125.352 E.89339
G1 X141.284 Y125.948 E.01977
G1 X114.708 Y125.948 E.88159
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5130
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X141.426 Y129.46 E.03631
G1 X141.426 Y131.04 E.04855
G1 X113.96 Y131.04 E.84397
G1 X113.96 Y124.96 E.18682
G1 X141.676 Y124.96 E.85165
G1 X141.676 Y126.34 E.0424
G1 X115.1 Y126.34 E.81662
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5130
G1 X141.081 Y125.65 E.40801
; WIPE_START
G1 F24000
G1 X139.081 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.137 J.433 P1  F30000
G1 X140.831 Y130.25 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5130
G1 X140.22 Y130.25 E.01934
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X133.928 Y130.3 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5130
G1 X132.3 Y130.3 E.05401
G1 X131.778 Y129.778 E.02448
G1 X128.391 Y129.609 E.11248
G1 X127.7 Y130.3 E.03242
G1 X124.624 Y130.3 E.10206
G1 X123.698 Y129.374 E.04343
G1 X121.081 Y129.243 E.08692
G1 X120.404 Y129.92 E.03176
G1 X120.404 Y130.3 E.01259
G1 X121.653 Y130.3 E.04143
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5130
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.711 J.988 P1  F30000
G1 X145.276 Y109.594 Z3.8
G1 Z3.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5130
G1 X146.242 Y109.594 E.0297
G1 X146.242 Y111.174 E.04855
G1 X145.276 Y111.174 E.0297
G1 X145.276 Y109.654 E.04671
M204 S10000
G1 X145.759 Y109.791 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.617268
G1 F5130
G1 X145.759 Y110.978 E.0556
; WIPE_START
G1 F24000
G1 X145.759 Y109.791 E-.76
; WIPE_END
M73 P76 R2
G1 E-.04 F1800
G17
G3 Z3.8 I1.212 J-.111 P1  F30000
G1 X145.418 Y106.082 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5130
G1 X145.418 Y105.487 E.01977
G1 X145.85 Y105.487 E.01434
G1 X145.85 Y106.082 E.01977
G1 X145.478 Y106.082 E.01235
G1 X145.026 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5130
G1 X145.026 Y105.094 E.0424
G1 X146.242 Y105.094 E.03738
G1 X146.242 Y106.474 E.0424
G1 X145.086 Y106.474 E.03553
M204 S10000
; WIPE_START
G1 F24000
G1 X145.026 Y105.094 E-.5249
G1 X145.644 Y105.094 E-.2351
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.039 J-1.216 P1  F30000
G1 X114.85 Y106.082 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5130
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X141.236 Y109.987 E.02652
G1 X141.236 Y110.782 E.0264
G1 X114.554 Y110.782 E.8851
G1 X114.554 Y105.487 E.17567
G1 X141.486 Y105.487 E.89339
G1 X141.486 Y106.082 E.01977
G1 X114.91 Y106.082 E.88159
G1 X115.242 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5130
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X141.629 Y109.594 E.03631
G1 X141.629 Y111.174 E.04855
G1 X114.162 Y111.174 E.84397
G1 X114.162 Y105.094 E.18682
G1 X141.879 Y105.094 E.85165
G1 X141.879 Y106.474 E.0424
G1 X115.302 Y106.474 E.81662
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5130
G1 X141.283 Y105.784 E.40801
; WIPE_START
G1 F24000
G1 X139.283 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.137 J.433 P1  F30000
G1 X141.033 Y110.384 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5130
G1 X140.422 Y110.384 E.01934
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X134.13 Y110.434 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5130
G1 X132.502 Y110.434 E.05401
G1 X131.98 Y109.912 E.02448
G1 X128.593 Y109.743 E.11248
G1 X127.902 Y110.434 E.03242
G1 X124.826 Y110.434 E.10206
G1 X123.9 Y109.508 E.04343
G1 X121.283 Y109.378 E.08692
G1 X120.606 Y110.055 E.03176
G1 X120.606 Y110.434 E.01259
G1 X121.855 Y110.434 E.04143
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5130
G1 X114.758 Y110.384 E.17424
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/30
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
G3 Z3.8 I-.681 J1.009 P1  F30000
G1 X145.033 Y129.46 Z3.8
G1 Z3.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5144
G1 X146.04 Y129.46 E.03096
G1 X146.04 Y131.04 E.04855
G1 X145.033 Y131.04 E.03096
G1 X145.033 Y129.52 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X146.04 Y129.46 E-.3835
G1 X146.04 Y130.451 E-.3765
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.194 J-.236 P1  F30000
G1 X145.149 Y125.948 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5144
G1 X145.149 Y125.352 E.01977
G1 X145.648 Y125.352 E.01656
G1 X145.648 Y125.948 E.01977
G1 X145.209 Y125.948 E.01457
G1 X144.783 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5144
G1 X144.757 Y126.34 E.00079
G1 X144.757 Y124.96 E.0424
G1 X144.783 Y124.96 E.00079
G1 X146.04 Y124.96 E.03864
G1 X146.04 Y126.34 E.0424
G1 X144.843 Y126.34 E.03679
M204 S10000
G1 X145.398 Y125.744 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134926
G1 F5144
G1 X145.398 Y125.556 E.00142
; WIPE_START
G1 F24000
G1 X145.398 Y125.744 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.008 J-1.217 P1  F30000
G1 X114.648 Y125.948 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5144
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
G1 X140.235 Y129.852 E.66426
G1 X141.086 Y129.852 E.02822
G1 X141.086 Y130.648 E.0264
G1 X114.352 Y130.648 E.8868
G1 X114.352 Y125.352 E.17567
G1 X141.351 Y125.352 E.89561
G1 X141.351 Y125.948 E.01977
G1 X114.708 Y125.948 E.88381
M73 P77 R2
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5144
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X141.467 Y129.46 E.03757
G1 X141.467 Y131.04 E.04855
G1 X113.96 Y131.04 E.84523
G1 X113.96 Y124.96 E.18682
G1 X141.717 Y124.96 E.85291
G1 X141.743 Y124.96 E.00079
G1 X141.743 Y126.34 E.0424
G1 X141.717 Y126.34 E.00079
G1 X115.1 Y126.34 E.81788
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5144
G1 X141.148 Y125.65 E.40903
; WIPE_START
G1 F24000
G1 X139.148 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.139 J.429 P1  F30000
G1 X140.882 Y130.25 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5144
G1 X140.22 Y130.25 E.02097
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X133.928 Y130.3 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5144
G1 X132.3 Y130.3 E.05401
G1 X131.778 Y129.778 E.02448
G1 X128.391 Y129.609 E.11248
G1 X127.7 Y130.3 E.03242
G1 X124.624 Y130.3 E.10206
G1 X123.698 Y129.374 E.04343
G1 X121.081 Y129.243 E.08692
G1 X120.404 Y129.92 E.03176
G1 X120.404 Y130.3 E.01259
G1 X121.653 Y130.3 E.04143
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5144
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.711 J.988 P1  F30000
G1 X145.235 Y109.594 Z4
G1 Z3.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5144
G1 X146.242 Y109.594 E.03096
G1 X146.242 Y111.174 E.04855
G1 X145.235 Y111.174 E.03096
G1 X145.235 Y109.654 E.04671
M204 S10000
; WIPE_START
G1 F24000
G1 X146.242 Y109.594 E-.3835
G1 X146.242 Y110.585 E-.3765
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.194 J-.236 P1  F30000
G1 X145.351 Y106.082 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5144
G1 X145.351 Y105.487 E.01977
G1 X145.85 Y105.487 E.01656
G1 X145.85 Y106.082 E.01977
G1 X145.411 Y106.082 E.01457
G1 X144.985 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5144
G1 X144.959 Y106.474 E.00079
G1 X144.959 Y105.094 E.0424
G1 X144.985 Y105.094 E.00079
G1 X146.242 Y105.094 E.03864
G1 X146.242 Y106.474 E.0424
G1 X145.045 Y106.474 E.03679
M204 S10000
G1 X145.6 Y105.879 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.134926
G1 F5144
G1 X145.6 Y105.69 E.00142
; WIPE_START
G1 F24000
G1 X145.6 Y105.879 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.008 J-1.217 P1  F30000
G1 X114.85 Y106.082 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5144
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X141.288 Y109.987 E.02822
G1 X141.288 Y110.782 E.0264
G1 X114.554 Y110.782 E.8868
G1 X114.554 Y105.487 E.17567
G1 X141.553 Y105.487 E.89561
G1 X141.553 Y106.082 E.01977
G1 X114.91 Y106.082 E.88381
G1 X115.242 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5144
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X141.67 Y109.594 E.03757
G1 X141.67 Y111.174 E.04855
G1 X114.162 Y111.174 E.84523
G1 X114.162 Y105.094 E.18682
G1 X141.92 Y105.094 E.85291
G1 X141.945 Y105.094 E.00079
G1 X141.945 Y106.474 E.0424
G1 X141.92 Y106.474 E.00079
G1 X115.302 Y106.474 E.81788
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5144
G1 X141.35 Y105.784 E.40903
; WIPE_START
G1 F24000
G1 X139.35 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.139 J.429 P1  F30000
G1 X141.084 Y110.384 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5144
G1 X140.422 Y110.384 E.02097
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X134.13 Y110.434 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5144
G1 X132.502 Y110.434 E.05401
G1 X131.98 Y109.912 E.02448
G1 X128.593 Y109.743 E.11248
G1 X127.902 Y110.434 E.03242
G1 X124.826 Y110.434 E.10206
G1 X123.9 Y109.508 E.04343
G1 X121.283 Y109.378 E.08692
G1 X120.606 Y110.055 E.03176
G1 X120.606 Y110.434 E.01259
G1 X121.855 Y110.434 E.04143
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5144
G1 X114.758 Y110.384 E.17424
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
M73 P78 R2
G1 E-.04 F1800
; layer num/total_layer_count: 19/30
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
G3 Z4 I-.685 J1.006 P1  F30000
G1 X145.338 Y129.852 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5204
G1 X145.648 Y129.852 E.01027
G1 X145.648 Y130.648 E.0264
G1 X145.338 Y130.648 E.01027
G1 X145.338 Y129.912 E.02441
G1 X144.981 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5204
G1 X146.04 Y129.46 E.03253
G1 X146.04 Y131.04 E.04855
G1 X144.981 Y131.04 E.03253
G1 X144.946 Y131.04 E.00107
G1 X144.946 Y129.485 E.04778
M204 S10000
; WIPE_START
G1 F24000
G1 X146.04 Y129.46 E-.4157
G1 X146.04 Y130.366 E-.3443
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.188 J-.264 P1  F30000
G1 X145.058 Y125.948 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5204
G1 X145.058 Y125.352 E.01977
G1 X145.648 Y125.352 E.01958
G1 X145.648 Y125.948 E.01977
G1 X145.118 Y125.948 E.01759
G1 X144.716 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5204
G1 X144.666 Y126.34 E.00154
G1 X144.666 Y124.96 E.0424
G1 X144.716 Y124.96 E.00154
G1 X146.04 Y124.96 E.04069
G1 X146.04 Y126.34 E.0424
G1 X144.776 Y126.34 E.03885
M204 S10000
; WIPE_START
G1 F24000
G1 X144.666 Y126.34 E-.04188
G1 X144.666 Y124.96 E-.5244
G1 X144.716 Y124.96 E-.01908
G1 X145.175 Y124.96 E-.17464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.039 J-1.216 P1  F30000
G1 X114.648 Y125.948 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5204
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
G1 X140.235 Y129.852 E.66426
G1 X141.162 Y129.852 E.03074
G1 X141.162 Y130.648 E.0264
G1 X114.352 Y130.648 E.88932
G1 X114.352 Y125.352 E.17567
G1 X141.442 Y125.352 E.89863
G1 X141.442 Y125.948 E.01977
G1 X114.708 Y125.948 E.88683
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5204
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X141.519 Y129.46 E.03915
G1 X141.554 Y129.46 E.00107
G1 X141.554 Y131.04 E.04855
G1 X141.519 Y131.04 E.00107
G1 X113.96 Y131.04 E.84681
G1 X113.96 Y124.96 E.18682
G1 X141.784 Y124.96 E.85496
G1 X141.834 Y124.96 E.00154
G1 X141.834 Y126.34 E.0424
G1 X141.784 Y126.34 E.00154
G1 X115.1 Y126.34 E.81993
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5204
G1 X141.239 Y125.65 E.41044
; WIPE_START
G1 F24000
G1 X139.239 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.14 J.426 P1  F30000
G1 X140.958 Y130.25 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5204
G1 X140.22 Y130.25 E.02338
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X133.928 Y130.3 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5204
G1 X132.3 Y130.3 E.05401
G1 X131.778 Y129.778 E.02448
G1 X128.391 Y129.609 E.11248
G1 X127.7 Y130.3 E.03242
G1 X124.624 Y130.3 E.10206
G1 X123.698 Y129.374 E.04343
G1 X121.081 Y129.243 E.08692
G1 X120.404 Y129.92 E.03176
G1 X120.404 Y130.3 E.01259
G1 X121.653 Y130.3 E.04143
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5204
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.697 J.997 P1  F30000
G1 X145.541 Y109.987 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5204
G1 X145.85 Y109.987 E.01027
G1 X145.85 Y110.782 E.0264
G1 X145.541 Y110.782 E.01027
G1 X145.541 Y110.047 E.02441
G1 X145.183 Y109.594 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5204
G1 X146.242 Y109.594 E.03253
G1 X146.242 Y111.174 E.04855
M73 P79 R2
G1 X145.183 Y111.174 E.03253
G1 X145.148 Y111.174 E.00107
G1 X145.148 Y109.62 E.04778
M204 S10000
; WIPE_START
G1 F24000
G1 X146.242 Y109.594 E-.4157
G1 X146.242 Y110.501 E-.3443
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.188 J-.264 P1  F30000
G1 X145.26 Y106.082 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5204
G1 X145.26 Y105.487 E.01977
G1 X145.85 Y105.487 E.01958
G1 X145.85 Y106.082 E.01977
G1 X145.32 Y106.082 E.01759
G1 X144.918 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5204
G1 X144.868 Y106.474 E.00154
G1 X144.868 Y105.094 E.0424
G1 X144.918 Y105.094 E.00154
G1 X146.242 Y105.094 E.04069
G1 X146.242 Y106.474 E.0424
G1 X144.978 Y106.474 E.03885
M204 S10000
; WIPE_START
G1 F24000
G1 X144.868 Y106.474 E-.04188
G1 X144.868 Y105.094 E-.5244
G1 X144.918 Y105.094 E-.01908
G1 X145.377 Y105.094 E-.17464
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.039 J-1.216 P1  F30000
G1 X114.85 Y106.082 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5204
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X141.364 Y109.987 E.03074
G1 X141.364 Y110.782 E.0264
G1 X114.554 Y110.782 E.88932
G1 X114.554 Y105.487 E.17567
G1 X141.644 Y105.487 E.89863
G1 X141.644 Y106.082 E.01977
G1 X114.91 Y106.082 E.88683
G1 X115.242 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5204
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X141.721 Y109.594 E.03915
G1 X141.756 Y109.594 E.00107
G1 X141.756 Y111.174 E.04855
G1 X141.721 Y111.174 E.00107
G1 X114.162 Y111.174 E.84681
G1 X114.162 Y105.094 E.18682
G1 X141.986 Y105.094 E.85496
G1 X142.037 Y105.094 E.00154
G1 X142.037 Y106.474 E.0424
G1 X141.986 Y106.474 E.00154
G1 X115.302 Y106.474 E.81993
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5204
G1 X141.441 Y105.784 E.41044
; WIPE_START
G1 F24000
G1 X139.441 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.14 J.426 P1  F30000
G1 X141.16 Y110.384 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5204
G1 X140.422 Y110.384 E.02338
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X134.13 Y110.434 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5204
G1 X132.502 Y110.434 E.05401
G1 X131.98 Y109.912 E.02448
G1 X128.593 Y109.743 E.11248
G1 X127.902 Y110.434 E.03242
G1 X124.826 Y110.434 E.10206
G1 X123.9 Y109.508 E.04343
G1 X121.283 Y109.378 E.08692
G1 X120.606 Y110.055 E.03176
G1 X120.606 Y110.434 E.01259
G1 X121.855 Y110.434 E.04143
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5204
G1 X114.758 Y110.384 E.17424
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/30
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
G3 Z4.2 I-.687 J1.004 P1  F30000
G1 X145.221 Y129.852 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5288
G1 X145.648 Y129.852 E.01416
G1 X145.648 Y130.648 E.0264
G1 X145.221 Y130.648 E.01416
G1 X145.221 Y129.912 E.02441
G1 X144.905 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5288
G1 X146.04 Y129.46 E.03487
G1 X146.04 Y131.04 E.04855
G1 X144.905 Y131.04 E.03487
G1 X144.829 Y131.04 E.00234
G1 X144.829 Y129.46 E.04855
G1 X144.845 Y129.46 E.0005
M204 S10000
; WIPE_START
G1 F24000
G1 X146.04 Y129.46 E-.45397
G1 X146.04 Y130.265 E-.30603
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.178 J-.306 P1  F30000
G1 X144.92 Y125.948 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5288
G1 X144.92 Y125.352 E.01977
G1 X145.648 Y125.352 E.02416
G1 X145.648 Y125.948 E.01977
G1 X144.98 Y125.948 E.02217
G1 X144.543 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X144.527 Y126.34 E.00046
G1 X144.527 Y124.96 E.0424
G1 X144.543 Y124.96 E.00046
G1 F5288
G1 X144.625 Y124.96 E.00252
G1 X146.04 Y124.96 E.04349
G1 X146.04 Y126.34 E.0424
G1 X144.603 Y126.34 E.04417
M204 S10000
; WIPE_START
G1 F24000
G1 X144.527 Y126.34 E-.02852
G1 X144.527 Y124.96 E-.5244
G1 X144.543 Y124.96 E-.00572
G1 X144.625 Y124.96 E-.03116
G1 X145.072 Y124.96 E-.1702
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.039 J-1.216 P1  F30000
G1 X114.648 Y125.948 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5288
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
G1 X140.235 Y129.852 E.66426
G1 X141.279 Y129.852 E.03463
G1 X141.279 Y130.648 E.0264
G1 X114.352 Y130.648 E.89321
G1 X114.352 Y125.352 E.17567
M73 P80 R2
G1 X141.58 Y125.352 E.90321
G1 X141.58 Y125.948 E.01977
G1 X114.708 Y125.948 E.89141
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5288
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X141.595 Y129.46 E.04148
G1 X141.671 Y129.46 E.00234
G1 X141.671 Y131.04 E.04855
G1 X141.595 Y131.04 E.00234
G1 X113.96 Y131.04 E.84914
G1 X113.96 Y124.96 E.18682
G1 X141.957 Y124.96 E.86028
G1 F3000
G1 X141.973 Y124.96 E.00046
G1 X141.973 Y126.34 E.0424
G1 X141.957 Y126.34 E.00046
G1 F5288
G1 X115.1 Y126.34 E.82525
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5288
G1 X141.377 Y125.65 E.41256
; WIPE_START
G1 F24000
G1 X139.377 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.142 J.422 P1  F30000
G1 X141.075 Y130.25 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5288
G3 X140.22 Y130.25 I-.423 J-34.323 E.02709
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X133.928 Y130.3 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5288
G1 X132.3 Y130.3 E.05401
G1 X131.778 Y129.778 E.02448
G1 X128.391 Y129.609 E.11248
G1 X127.7 Y130.3 E.03242
G1 X124.624 Y130.3 E.10206
G1 X123.698 Y129.374 E.04343
G1 X121.081 Y129.243 E.08692
G1 X120.404 Y129.92 E.03176
G1 X120.404 Y130.3 E.01259
G1 X121.653 Y130.3 E.04143
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5288
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.699 J.996 P1  F30000
G1 X145.423 Y109.987 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5288
G1 X145.85 Y109.987 E.01416
G1 X145.85 Y110.782 E.0264
G1 X145.423 Y110.782 E.01416
G1 X145.423 Y110.047 E.02441
G1 X145.107 Y109.594 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5288
G1 X146.242 Y109.594 E.03487
G1 X146.242 Y111.174 E.04855
G1 X145.107 Y111.174 E.03487
G1 X145.031 Y111.174 E.00234
G1 X145.031 Y109.594 E.04855
G1 X145.047 Y109.594 E.0005
M204 S10000
; WIPE_START
G1 F24000
G1 X146.242 Y109.594 E-.45397
G1 X146.242 Y110.4 E-.30603
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.178 J-.306 P1  F30000
G1 X145.122 Y106.082 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5288
G1 X145.122 Y105.487 E.01977
G1 X145.85 Y105.487 E.02416
G1 X145.85 Y106.082 E.01977
G1 X145.182 Y106.082 E.02217
G1 X144.745 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X144.73 Y106.474 E.00046
G1 X144.73 Y105.094 E.0424
G1 X144.745 Y105.094 E.00046
G1 F5288
G1 X144.827 Y105.094 E.00252
G1 X146.242 Y105.094 E.04349
G1 X146.242 Y106.474 E.0424
G1 X144.805 Y106.474 E.04417
M204 S10000
; WIPE_START
G1 F24000
G1 X144.73 Y106.474 E-.02852
G1 X144.73 Y105.094 E-.5244
G1 X144.745 Y105.094 E-.00572
G1 X144.827 Y105.094 E-.03116
G1 X145.275 Y105.094 E-.1702
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.039 J-1.216 P1  F30000
G1 X114.85 Y106.082 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5288
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X141.481 Y109.987 E.03463
G1 X141.481 Y110.782 E.0264
G1 X114.554 Y110.782 E.89321
G1 X114.554 Y105.487 E.17567
G1 X141.783 Y105.487 E.90321
G1 X141.783 Y106.082 E.01977
G1 X114.91 Y106.082 E.89141
G1 X115.242 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5288
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X141.797 Y109.594 E.04148
G1 X141.873 Y109.594 E.00234
G1 X141.873 Y111.174 E.04855
G1 X141.797 Y111.174 E.00234
G1 X114.162 Y111.174 E.84914
G1 X114.162 Y105.094 E.18682
G1 X142.16 Y105.094 E.86028
G1 F3000
G1 X142.175 Y105.094 E.00046
G1 X142.175 Y106.474 E.0424
G1 X142.16 Y106.474 E.00046
G1 F5288
G1 X115.302 Y106.474 E.82525
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5288
G1 X141.579 Y105.784 E.41256
; WIPE_START
G1 F24000
G1 X139.579 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.142 J.422 P1  F30000
G1 X141.277 Y110.384 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5288
G3 X140.422 Y110.384 I-.423 J-34.323 E.02709
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X134.13 Y110.434 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5288
G1 X132.502 Y110.434 E.05401
G1 X131.98 Y109.912 E.02448
G1 X128.593 Y109.743 E.11248
G1 X127.902 Y110.434 E.03242
G1 X124.826 Y110.434 E.10206
G1 X123.9 Y109.508 E.04343
G1 X121.283 Y109.378 E.08692
G1 X120.606 Y110.055 E.03176
G1 X120.606 Y110.434 E.01259
G1 X121.855 Y110.434 E.04143
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
M73 P81 R2
G1 F5288
G1 X114.758 Y110.384 E.17424
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/30
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
G3 Z4.4 I-.689 J1.003 P1  F30000
G1 X145.081 Y129.852 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5473
G1 X145.648 Y129.852 E.01882
G1 X145.648 Y130.648 E.0264
G1 X145.081 Y130.648 E.01882
G1 X145.081 Y129.912 E.02441
G1 X144.788 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5473
G1 X146.04 Y129.46 E.03847
G1 X146.04 Y131.04 E.04855
G1 X144.706 Y131.04 E.04099
G1 F3000
G1 X144.688 Y131.04 E.00054
G1 X144.688 Y129.46 E.04855
G1 X144.706 Y129.46 E.00054
G1 F5473
G1 X144.728 Y129.46 E.00068
M204 S10000
G1 X145.364 Y130.056 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203242
G1 F5473
G1 X145.364 Y130.444 E.00508
; WIPE_START
G1 F24000
G1 X145.364 Y130.056 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.205 J-.169 P1  F30000
G1 X144.706 Y125.352 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5473
G1 X145.648 Y125.352 E.03124
G1 X145.648 Y125.948 E.01977
G1 X144.706 Y125.948 E.03124
G1 X144.706 Y125.412 E.01777
G1 X144.486 Y124.96 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5473
G1 X146.04 Y124.96 E.04773
G1 X146.04 Y126.34 E.0424
G1 X144.322 Y126.34 E.05277
M106 S255
G1 F1800
G1 X144.322 Y124.96 E.0424
M106 S252.45
G1 F5473
G1 X144.426 Y124.96 E.0032
M204 S10000
G1 X144.91 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5473
G1 X145.444 Y125.65 E.00822
; WIPE_START
G1 F24000
G1 X144.91 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.012 J-1.217 P1  F30000
G1 X114.648 Y125.948 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5473
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
G1 X140.235 Y129.852 E.66426
G1 X141.419 Y129.852 E.03929
G1 X141.419 Y130.648 E.0264
G1 X114.352 Y130.648 E.89788
G1 X114.352 Y125.352 E.17567
G1 X141.794 Y125.352 E.91029
G1 X141.794 Y125.948 E.01977
G1 X114.708 Y125.948 E.89849
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5473
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X141.794 Y129.46 E.0476
G1 F3000
G1 X141.812 Y129.46 E.00054
G1 X141.812 Y131.04 E.04855
G1 X141.794 Y131.04 E.00054
G1 F5473
G1 X141.712 Y131.04 E.00252
G1 X113.96 Y131.04 E.85274
G1 X113.96 Y124.96 E.18682
G1 X142.178 Y124.96 E.86705
M106 S255
G1 F1800
G1 X142.178 Y126.34 E.0424
M106 S252.45
G1 F5473
G1 X115.1 Y126.34 E.83202
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5473
G1 X141.59 Y125.65 E.41584
; WIPE_START
G1 F24000
G1 X139.59 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.147 J.406 P1  F30000
G1 X141.216 Y130.25 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5473
G3 X140.22 Y130.25 I-.493 J-39.967 E.03155
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X133.928 Y130.3 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5473
G1 X132.3 Y130.3 E.05401
G1 X131.778 Y129.778 E.02448
G1 X128.391 Y129.609 E.11248
G1 X127.7 Y130.3 E.03242
G1 X124.624 Y130.3 E.10206
G1 X123.698 Y129.374 E.04343
G1 X121.081 Y129.243 E.08692
G1 X120.404 Y129.92 E.03176
G1 X120.404 Y130.3 E.01259
G1 X121.653 Y130.3 E.04143
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5473
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.701 J.994 P1  F30000
G1 X145.283 Y109.987 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5473
G1 X145.85 Y109.987 E.01882
G1 X145.85 Y110.782 E.0264
G1 X145.283 Y110.782 E.01882
G1 X145.283 Y110.047 E.02441
G1 X144.99 Y109.594 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5473
G1 X146.242 Y109.594 E.03847
G1 X146.242 Y111.174 E.04855
G1 X144.908 Y111.174 E.04099
G1 F3000
G1 X144.891 Y111.174 E.00054
G1 X144.891 Y109.594 E.04855
M73 P82 R2
G1 X144.908 Y109.594 E.00054
G1 F5473
G1 X144.93 Y109.594 E.00068
M204 S10000
G1 X145.566 Y110.19 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.203242
G1 F5473
G1 X145.566 Y110.579 E.00508
; WIPE_START
G1 F24000
G1 X145.566 Y110.19 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.205 J-.169 P1  F30000
G1 X144.908 Y105.487 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5473
G1 X145.85 Y105.487 E.03124
G1 X145.85 Y106.082 E.01977
G1 X144.908 Y106.082 E.03124
G1 X144.908 Y105.547 E.01777
G1 X144.689 Y105.094 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5473
G1 X146.242 Y105.094 E.04773
G1 X146.242 Y106.474 E.0424
G1 X144.525 Y106.474 E.05277
M106 S255
G1 F1800
G1 X144.525 Y105.094 E.0424
M106 S252.45
G1 F5473
G1 X144.629 Y105.094 E.0032
M204 S10000
G1 X145.112 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5473
G1 X145.646 Y105.784 E.00822
; WIPE_START
G1 F24000
G1 X145.112 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.012 J-1.217 P1  F30000
G1 X114.85 Y106.082 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5473
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X141.622 Y109.987 E.03929
G1 X141.622 Y110.782 E.0264
G1 X114.554 Y110.782 E.89788
G1 X114.554 Y105.487 E.17567
G1 X141.996 Y105.487 E.91029
G1 X141.996 Y106.082 E.01977
G1 X114.91 Y106.082 E.89849
G1 X115.242 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5473
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X141.996 Y109.594 E.0476
G1 F3000
G1 X142.014 Y109.594 E.00054
G1 X142.014 Y111.174 E.04855
G1 X141.996 Y111.174 E.00054
G1 F5473
G1 X141.914 Y111.174 E.00252
G1 X114.162 Y111.174 E.85274
G1 X114.162 Y105.094 E.18682
G1 X142.38 Y105.094 E.86705
M106 S255
G1 F1800
G1 X142.38 Y106.474 E.0424
M106 S252.45
G1 F5473
G1 X115.302 Y106.474 E.83202
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5473
G1 X141.792 Y105.784 E.41584
; WIPE_START
G1 F24000
G1 X139.792 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.147 J.406 P1  F30000
G1 X141.418 Y110.384 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5473
G3 X140.422 Y110.384 I-.493 J-39.967 E.03155
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X134.13 Y110.434 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5473
G1 X132.502 Y110.434 E.05401
G1 X131.98 Y109.912 E.02448
G1 X128.593 Y109.743 E.11248
G1 X127.902 Y110.434 E.03242
G1 X124.826 Y110.434 E.10206
G1 X123.9 Y109.508 E.04343
G1 X121.283 Y109.378 E.08692
G1 X120.606 Y110.055 E.03176
G1 X120.606 Y110.434 E.01259
G1 X121.855 Y110.434 E.04143
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5473
G1 X114.758 Y110.384 E.17424
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
M73 P82 R1
G1 E-.04 F1800
; layer num/total_layer_count: 22/30
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
G3 Z4.6 I-.693 J1 P1  F30000
G1 X144.855 Y129.852 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5957
G1 X145.648 Y129.852 E.02631
G1 X145.648 Y130.648 E.0264
G1 X144.855 Y130.648 E.02631
G1 X144.855 Y129.912 E.02441
G1 X144.647 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5957
G1 X146.04 Y129.46 E.04279
G1 X146.04 Y131.04 E.04855
G1 X144.483 Y131.04 E.04783
M106 S255
G1 F1800
G1 X144.463 Y131.04 E.00064
G1 X144.463 Y129.46 E.04855
G1 X144.483 Y129.46 E.00064
M106 S252.45
G1 F5957
G1 X144.587 Y129.46 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X146.04 Y129.46 E-.55197
G1 X146.04 Y130.007 E-.20803
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.145 J-.412 P1  F30000
G1 X144.366 Y125.352 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5957
G1 X145.648 Y125.352 E.04253
G1 X145.648 Y125.948 E.01977
G1 X144.366 Y125.948 E.04253
G1 X144.366 Y125.412 E.01777
G1 X144.273 Y124.96 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5957
G1 X146.04 Y124.96 E.05429
G1 X146.04 Y126.34 E.0424
G1 X144.273 Y126.34 E.05429
G1 X144.027 Y126.34 E.00756
M106 S255
G1 F600
G1 X143.974 Y126.34 E.00165
G1 X143.974 Y124.96 E.0424
G1 X144.027 Y124.96 E.00165
M106 S252.45
G1 F5957
G1 X144.213 Y124.96 E.00572
M204 S10000
G1 X144.569 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5957
G1 X145.444 Y125.65 E.01346
; WIPE_START
G1 F24000
G1 X144.569 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.012 J-1.217 P1  F30000
G1 X114.648 Y125.948 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5957
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
G1 X140.235 Y129.852 E.66426
G1 X141.645 Y129.852 E.04678
G1 X141.645 Y130.648 E.0264
G1 X114.352 Y130.648 E.90536
G1 X114.352 Y125.352 E.17567
G1 X142.134 Y125.352 E.92159
G1 X142.134 Y125.948 E.01977
G1 X114.708 Y125.948 E.90978
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P83 R1
G1 F5957
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X142.017 Y129.46 E.05444
M106 S255
G1 F1800
G1 X142.037 Y129.46 E.00064
G1 X142.037 Y131.04 E.04855
G1 X142.017 Y131.04 E.00064
M106 S252.45
G1 F5957
G1 X141.853 Y131.04 E.00504
G1 X113.96 Y131.04 E.85706
G1 X113.96 Y124.96 E.18682
G1 X142.227 Y124.96 E.86856
G1 X142.473 Y124.96 E.00756
M106 S255
G1 F600
G1 X142.526 Y124.96 E.00165
G1 X142.526 Y126.34 E.0424
G1 X142.473 Y126.34 E.00165
M106 S252.45
G1 F5957
G1 X142.227 Y126.34 E.00756
G1 X115.1 Y126.34 E.83353
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5957
G1 X141.931 Y125.65 E.42108
; WIPE_START
G1 F24000
G1 X139.931 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.156 J.38 P1  F30000
G1 X141.442 Y130.25 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5957
G3 X140.22 Y130.25 I-.606 J-49.028 E.0387
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X133.928 Y130.3 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5957
G1 X132.3 Y130.3 E.05401
G1 X131.778 Y129.778 E.02448
G1 X128.391 Y129.609 E.11248
G1 X127.7 Y130.3 E.03242
G1 X124.624 Y130.3 E.10206
G1 X123.698 Y129.374 E.04343
G1 X121.081 Y129.243 E.08692
G1 X120.404 Y129.92 E.03176
G1 X120.404 Y130.3 E.01259
G1 X121.653 Y130.3 E.04143
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5957
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.705 J.992 P1  F30000
G1 X145.057 Y109.987 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5957
G1 X145.85 Y109.987 E.02631
G1 X145.85 Y110.782 E.0264
G1 X145.057 Y110.782 E.02631
G1 X145.057 Y110.047 E.02441
G1 X144.85 Y109.594 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5957
G1 X146.242 Y109.594 E.04279
G1 X146.242 Y111.174 E.04855
G1 X144.686 Y111.174 E.04783
M106 S255
G1 F1800
G1 X144.665 Y111.174 E.00064
G1 X144.665 Y109.594 E.04855
G1 X144.686 Y109.594 E.00064
M106 S252.45
G1 F5957
G1 X144.79 Y109.594 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X146.242 Y109.594 E-.55197
G1 X146.242 Y110.142 E-.20803
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.145 J-.412 P1  F30000
G1 X144.568 Y105.487 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5957
G1 X145.85 Y105.487 E.04253
G1 X145.85 Y106.082 E.01977
G1 X144.568 Y106.082 E.04253
G1 X144.568 Y105.547 E.01777
G1 X144.475 Y105.094 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5957
G1 X146.242 Y105.094 E.05429
G1 X146.242 Y106.474 E.0424
G1 X144.475 Y106.474 E.05429
G1 X144.229 Y106.474 E.00756
M106 S255
G1 F600
G1 X144.176 Y106.474 E.00165
G1 X144.176 Y105.094 E.0424
G1 X144.229 Y105.094 E.00165
M106 S252.45
G1 F5957
G1 X144.415 Y105.094 E.00572
M204 S10000
G1 X144.771 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5957
G1 X145.646 Y105.784 E.01346
; WIPE_START
G1 F24000
G1 X144.771 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.012 J-1.217 P1  F30000
G1 X114.85 Y106.082 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5957
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X141.847 Y109.987 E.04678
G1 X141.847 Y110.782 E.0264
G1 X114.554 Y110.782 E.90536
G1 X114.554 Y105.487 E.17567
G1 X142.336 Y105.487 E.92159
G1 X142.336 Y106.082 E.01977
G1 X114.91 Y106.082 E.90978
G1 X115.242 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5957
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X142.219 Y109.594 E.05444
M106 S255
G1 F1800
G1 X142.239 Y109.594 E.00064
G1 X142.239 Y111.174 E.04855
G1 X142.219 Y111.174 E.00064
M106 S252.45
G1 F5957
G1 X142.055 Y111.174 E.00504
G1 X114.162 Y111.174 E.85706
G1 X114.162 Y105.094 E.18682
G1 X142.429 Y105.094 E.86856
G1 X142.675 Y105.094 E.00756
M106 S255
G1 F600
G1 X142.728 Y105.094 E.00165
G1 X142.728 Y106.474 E.0424
G1 X142.675 Y106.474 E.00165
M106 S252.45
G1 F5957
G1 X142.429 Y106.474 E.00756
G1 X115.302 Y106.474 E.83353
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5957
G1 X142.133 Y105.784 E.42108
; WIPE_START
G1 F24000
G1 X140.133 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.156 J.38 P1  F30000
G1 X141.644 Y110.384 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5957
G3 X140.422 Y110.384 I-.606 J-49.028 E.0387
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X134.13 Y110.434 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5957
G1 X132.502 Y110.434 E.05401
G1 X131.98 Y109.912 E.02448
G1 X128.593 Y109.743 E.11248
G1 X127.902 Y110.434 E.03242
G1 X124.826 Y110.434 E.10206
G1 X123.9 Y109.508 E.04343
M73 P84 R1
G1 X121.283 Y109.378 E.08692
G1 X120.606 Y110.055 E.03176
G1 X120.606 Y110.434 E.01259
G1 X121.855 Y110.434 E.04143
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5957
G1 X114.758 Y110.384 E.17424
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/30
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
G3 Z4.8 I-1.206 J-.163 P1  F30000
G1 X114.648 Y125.948 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5995
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
G1 X140.235 Y129.852 E.66426
G1 X141.981 Y129.852 E.05793
G1 X141.981 Y130.648 E.0264
G1 X114.352 Y130.648 E.91651
G1 X114.352 Y125.352 E.17567
G1 X142.936 Y125.352 E.94819
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X143.564 Y125.352 E.02081
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5995
G1 X145.648 Y125.352 E.06914
G1 X145.648 Y125.948 E.01977
G1 X143.564 Y125.948 E.06914
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X142.936 Y125.948 E.02081
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5995
G1 X142.554 Y125.948 E.01269
G1 X114.708 Y125.948 E.9237
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5995
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X142.078 Y129.46 E.05634
G1 X142.324 Y129.46 E.00756
M106 S255
G1 F600
G1 X142.373 Y129.46 E.00151
G1 X142.373 Y131.04 E.04855
G1 X142.324 Y131.04 E.00151
M106 S252.45
G1 F5995
G1 X142.078 Y131.04 E.00756
G1 X113.96 Y131.04 E.864
G1 X113.96 Y124.96 E.18682
G1 X142.936 Y124.96 E.89036
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X143.564 Y124.96 E.02081
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5995
G1 X146.04 Y124.96 E.07609
G1 X146.04 Y126.34 E.0424
G1 X143.564 Y126.34 E.07609
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X142.936 Y126.34 E.02081
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5995
G1 X115.1 Y126.34 E.85533
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5995
G1 X145.444 Y125.65 E.47513
; WIPE_START
G1 F24000
G1 X143.444 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.144 J-.415 P1  F30000
G1 X141.778 Y130.25 Z5
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5995
G3 X140.22 Y130.25 I-.774 J-62.517 E.04935
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X133.928 Y130.3 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5995
G1 X132.3 Y130.3 E.05401
G1 X131.778 Y129.778 E.02448
G1 X128.391 Y129.609 E.11248
G1 X127.7 Y130.3 E.03242
G1 X124.624 Y130.3 E.10206
G1 X123.698 Y129.374 E.04343
G1 X121.081 Y129.243 E.08692
G1 X120.404 Y129.92 E.03176
G1 X120.404 Y130.3 E.01259
G1 X121.653 Y130.3 E.04143
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5995
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.017 J1.217 P1  F30000
G1 X144.519 Y129.852 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5995
G1 X145.648 Y129.852 E.03746
G1 X145.648 Y130.648 E.0264
G1 X144.519 Y130.648 E.03746
G1 X144.519 Y129.912 E.02441
G1 X144.422 Y129.46 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5995
G1 X146.04 Y129.46 E.04973
G1 X146.04 Y131.04 E.04855
G1 X144.422 Y131.04 E.04973
G1 X144.176 Y131.04 E.00756
M106 S255
G1 F600
G1 X144.127 Y131.04 E.00151
G1 X144.127 Y129.46 E.04855
G1 X144.176 Y129.46 E.00151
M106 S252.45
G1 F5995
G1 X144.362 Y129.46 E.00572
M204 S10000
; WIPE_START
G1 F24000
G1 X146.04 Y129.46 E-.63776
G1 X146.04 Y129.782 E-.12224
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.736 J-.969 P1  F30000
G1 X114.85 Y106.082 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5995
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
M73 P85 R1
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X142.183 Y109.987 E.05793
G1 X142.183 Y110.782 E.0264
G1 X114.554 Y110.782 E.91651
G1 X114.554 Y105.487 E.17567
G1 X143.138 Y105.487 E.94819
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X143.766 Y105.487 E.02081
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5995
G1 X145.85 Y105.487 E.06914
G1 X145.85 Y106.082 E.01977
G1 X143.766 Y106.082 E.06914
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X143.138 Y106.082 E.02081
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5995
G1 X142.756 Y106.082 E.01269
G1 X114.91 Y106.082 E.9237
G1 X115.242 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5995
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X142.28 Y109.594 E.05634
G1 X142.526 Y109.594 E.00756
M106 S255
G1 F600
G1 X142.575 Y109.594 E.00151
G1 X142.575 Y111.174 E.04855
G1 X142.526 Y111.174 E.00151
M106 S252.45
G1 F5995
G1 X142.28 Y111.174 E.00756
G1 X114.162 Y111.174 E.864
G1 X114.162 Y105.094 E.18682
G1 X143.138 Y105.094 E.89036
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X143.766 Y105.094 E.02081
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5995
G1 X146.242 Y105.094 E.07609
G1 X146.242 Y106.474 E.0424
G1 X143.766 Y106.474 E.07609
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X143.138 Y106.474 E.02081
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5995
G1 X115.302 Y106.474 E.85533
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5995
G1 X145.646 Y105.784 E.47513
; WIPE_START
G1 F24000
G1 X143.646 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.144 J-.415 P1  F30000
G1 X141.98 Y110.384 Z5
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5995
G3 X140.422 Y110.384 I-.774 J-62.517 E.04935
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X134.13 Y110.434 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5995
G1 X132.502 Y110.434 E.05401
G1 X131.98 Y109.912 E.02448
G1 X128.593 Y109.743 E.11248
G1 X127.902 Y110.434 E.03242
G1 X124.826 Y110.434 E.10206
G1 X123.9 Y109.508 E.04343
G1 X121.283 Y109.378 E.08692
G1 X120.606 Y110.055 E.03176
G1 X120.606 Y110.434 E.01259
G1 X121.855 Y110.434 E.04143
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5995
G1 X114.758 Y110.384 E.17424
; WIPE_START
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.017 J1.217 P1  F30000
G1 X144.721 Y109.987 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5995
G1 X145.85 Y109.987 E.03746
G1 X145.85 Y110.782 E.0264
G1 X144.721 Y110.782 E.03746
G1 X144.721 Y110.047 E.02441
G1 X144.624 Y109.594 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5995
G1 X146.242 Y109.594 E.04973
G1 X146.242 Y111.174 E.04855
G1 X144.624 Y111.174 E.04973
G1 X144.378 Y111.174 E.00756
M106 S255
G1 F600
G1 X144.329 Y111.174 E.00151
G1 X144.329 Y109.594 E.04855
G1 X144.378 Y109.594 E.00151
M106 S252.45
G1 F5995
G1 X144.564 Y109.594 E.00572
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X146.242 Y109.594 E-.63776
G1 X146.242 Y109.916 E-.12224
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/30
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
G3 Z5 I-.551 J-1.085 P1  F30000
G1 X114.648 Y125.948 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5426
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
G1 X140.235 Y129.852 E.66426
G1 X142.783 Y129.852 E.08454
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X143.717 Y129.852 E.03096
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5426
G1 X145.648 Y129.852 E.06407
G1 X145.648 Y130.648 E.0264
G1 X143.717 Y130.648 E.06407
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X142.783 Y130.648 E.03096
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5426
G1 X142.401 Y130.648 E.01269
G1 X114.352 Y130.648 E.93043
G1 X114.352 Y125.352 E.17567
G1 X145.648 Y125.352 E1.03814
G1 X145.648 Y125.948 E.01977
G1 X114.708 Y125.948 E1.02634
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5426
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X142.783 Y129.46 E.07801
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X143.717 Y129.46 E.03096
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5426
G1 X146.04 Y129.46 E.07139
G1 X146.04 Y131.04 E.04855
G1 X143.717 Y131.04 E.07139
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X142.783 Y131.04 E.03096
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5426
G1 X142.414 Y131.04 E.01134
G1 X113.96 Y131.04 E.87432
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5426
G1 X145.444 Y125.65 E.47513
; WIPE_START
G1 F24000
G1 X143.444 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.116 J.485 P1  F30000
G1 X145.444 Y130.25 Z5.2
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5426
G1 X140.22 Y130.25 E.1655
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X133.928 Y130.3 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5426
G1 X132.3 Y130.3 E.05401
G1 X131.778 Y129.778 E.02448
G1 X128.391 Y129.609 E.11248
G1 X127.7 Y130.3 E.03242
G1 X124.624 Y130.3 E.10206
G1 X123.698 Y129.374 E.04343
M73 P86 R1
G1 X121.081 Y129.243 E.08692
G1 X120.404 Y129.92 E.03176
G1 X120.404 Y130.3 E.01259
G1 X121.653 Y130.3 E.04143
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5426
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.214 J-.086 P1  F30000
G1 X114.85 Y106.082 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5426
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X142.985 Y109.987 E.08454
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X143.919 Y109.987 E.03096
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5426
G1 X145.85 Y109.987 E.06407
G1 X145.85 Y110.782 E.0264
G1 X143.919 Y110.782 E.06407
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X142.985 Y110.782 E.03096
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F5426
G1 X142.603 Y110.782 E.01269
G1 X114.554 Y110.782 E.93043
G1 X114.554 Y105.487 E.17567
G1 X145.85 Y105.487 E1.03814
G1 X145.85 Y106.082 E.01977
G1 X114.91 Y106.082 E1.02634
G1 X115.242 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5426
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X142.985 Y109.594 E.07801
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X143.919 Y109.594 E.03096
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5426
G1 X146.242 Y109.594 E.07139
G1 X146.242 Y111.174 E.04855
G1 X143.919 Y111.174 E.07139
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X142.985 Y111.174 E.03096
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5426
G1 X142.616 Y111.174 E.01134
G1 X114.162 Y111.174 E.87432
G1 X114.162 Y105.094 E.18682
G1 X146.242 Y105.094 E.98573
G1 X146.242 Y106.474 E.0424
G1 X115.302 Y106.474 E.9507
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5426
G1 X145.646 Y105.784 E.47513
; WIPE_START
G1 F24000
G1 X143.646 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.116 J.485 P1  F30000
G1 X145.646 Y110.384 Z5.2
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5426
G1 X140.422 Y110.384 E.1655
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X134.13 Y110.434 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5426
G1 X132.502 Y110.434 E.05401
G1 X131.98 Y109.912 E.02448
G1 X128.593 Y109.743 E.11248
G1 X127.902 Y110.434 E.03242
G1 X124.826 Y110.434 E.10206
G1 X123.9 Y109.508 E.04343
G1 X121.283 Y109.378 E.08692
G1 X120.606 Y110.055 E.03176
G1 X120.606 Y110.434 E.01259
G1 X121.855 Y110.434 E.04143
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5426
G1 X114.758 Y110.384 E.17424
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/30
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
G3 Z5.2 I-1.206 J-.163 P1  F30000
G1 X114.648 Y125.948 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5340
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
G1 X140.235 Y129.852 E.66426
G1 X145.648 Y129.852 E.17956
G1 X145.648 Y130.648 E.0264
G1 X114.352 Y130.648 E1.03814
G1 X114.352 Y125.352 E.17567
G1 X145.648 Y125.352 E1.03814
M73 P87 R1
G1 X145.648 Y125.948 E.01977
G1 X114.708 Y125.948 E1.02634
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5340
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X146.04 Y129.46 E.17807
G1 X146.04 Y131.04 E.04855
G1 X113.96 Y131.04 E.98573
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5340
G1 X145.444 Y125.65 E.47513
; WIPE_START
G1 F24000
G1 X143.444 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.116 J.485 P1  F30000
G1 X145.444 Y130.25 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5340
G1 X140.22 Y130.25 E.1655
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X133.928 Y130.3 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5340
G1 X132.3 Y130.3 E.05401
G1 X131.778 Y129.778 E.02448
G1 X128.391 Y129.609 E.11248
G1 X127.7 Y130.3 E.03242
G1 X124.624 Y130.3 E.10206
G1 X123.698 Y129.374 E.04343
G1 X121.081 Y129.243 E.08692
G1 X120.404 Y129.92 E.03176
G1 X120.404 Y130.3 E.01259
G1 X121.653 Y130.3 E.04143
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5340
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.214 J-.086 P1  F30000
G1 X114.85 Y106.082 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5340
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X145.85 Y109.987 E.17956
G1 X145.85 Y110.782 E.0264
G1 X114.554 Y110.782 E1.03814
G1 X114.554 Y105.487 E.17567
G1 X145.85 Y105.487 E1.03814
G1 X145.85 Y106.082 E.01977
G1 X114.91 Y106.082 E1.02634
G1 X115.242 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5340
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X146.242 Y109.594 E.17807
G1 X146.242 Y111.174 E.04855
G1 X114.162 Y111.174 E.98573
G1 X114.162 Y105.094 E.18682
G1 X146.242 Y105.094 E.98573
G1 X146.242 Y106.474 E.0424
G1 X115.302 Y106.474 E.9507
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5340
G1 X145.646 Y105.784 E.47513
; WIPE_START
G1 F24000
G1 X143.646 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.116 J.485 P1  F30000
G1 X145.646 Y110.384 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5340
G1 X140.422 Y110.384 E.1655
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X134.13 Y110.434 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5340
G1 X132.502 Y110.434 E.05401
G1 X131.98 Y109.912 E.02448
G1 X128.593 Y109.743 E.11248
G1 X127.902 Y110.434 E.03242
G1 X124.826 Y110.434 E.10206
G1 X123.9 Y109.508 E.04343
G1 X121.283 Y109.378 E.08692
G1 X120.606 Y110.055 E.03176
G1 X120.606 Y110.434 E.01259
G1 X121.855 Y110.434 E.04143
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5340
G1 X114.758 Y110.384 E.17424
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P88 R1
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/30
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
G3 Z5.4 I-1.206 J-.163 P1  F30000
G1 X114.648 Y125.948 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5340
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
G1 X140.235 Y129.852 E.66426
G1 X145.648 Y129.852 E.17956
G1 X145.648 Y130.648 E.0264
G1 X114.352 Y130.648 E1.03814
G1 X114.352 Y125.352 E.17567
G1 X145.648 Y125.352 E1.03814
G1 X145.648 Y125.948 E.01977
G1 X114.708 Y125.948 E1.02634
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5340
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X146.04 Y129.46 E.17807
G1 X146.04 Y131.04 E.04855
G1 X113.96 Y131.04 E.98573
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5340
G1 X145.444 Y125.65 E.47513
; WIPE_START
G1 F24000
G1 X143.444 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.116 J.485 P1  F30000
G1 X145.444 Y130.25 Z5.6
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5340
G1 X140.22 Y130.25 E.1655
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X133.928 Y130.3 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5340
G1 X132.3 Y130.3 E.05401
G1 X131.778 Y129.778 E.02448
G1 X128.391 Y129.609 E.11248
G1 X127.7 Y130.3 E.03242
G1 X124.624 Y130.3 E.10206
G1 X123.698 Y129.374 E.04343
G1 X121.081 Y129.243 E.08692
G1 X120.404 Y129.92 E.03176
G1 X120.404 Y130.3 E.01259
G1 X121.653 Y130.3 E.04143
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5340
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.214 J-.086 P1  F30000
G1 X114.85 Y106.082 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5340
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X145.85 Y109.987 E.17956
G1 X145.85 Y110.782 E.0264
G1 X114.554 Y110.782 E1.03814
G1 X114.554 Y105.487 E.17567
G1 X145.85 Y105.487 E1.03814
M73 P89 R1
G1 X145.85 Y106.082 E.01977
G1 X114.91 Y106.082 E1.02634
G1 X115.242 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5340
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X146.242 Y109.594 E.17807
G1 X146.242 Y111.174 E.04855
G1 X114.162 Y111.174 E.98573
G1 X114.162 Y105.094 E.18682
G1 X146.242 Y105.094 E.98573
G1 X146.242 Y106.474 E.0424
G1 X115.302 Y106.474 E.9507
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5340
G1 X145.646 Y105.784 E.47513
; WIPE_START
G1 F24000
G1 X143.646 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.116 J.485 P1  F30000
G1 X145.646 Y110.384 Z5.6
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5340
G1 X140.422 Y110.384 E.1655
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X134.13 Y110.434 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5340
G1 X132.502 Y110.434 E.05401
G1 X131.98 Y109.912 E.02448
G1 X128.593 Y109.743 E.11248
G1 X127.902 Y110.434 E.03242
G1 X124.826 Y110.434 E.10206
G1 X123.9 Y109.508 E.04343
G1 X121.283 Y109.378 E.08692
G1 X120.606 Y110.055 E.03176
G1 X120.606 Y110.434 E.01259
G1 X121.855 Y110.434 E.04143
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5340
G1 X114.758 Y110.384 E.17424
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/30
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
G3 Z5.6 I-1.206 J-.163 P1  F30000
G1 X114.648 Y125.948 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5340
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
G1 X140.235 Y129.852 E.66426
G1 X145.648 Y129.852 E.17956
G1 X145.648 Y130.648 E.0264
G1 X114.352 Y130.648 E1.03814
G1 X114.352 Y125.352 E.17567
G1 X145.648 Y125.352 E1.03814
G1 X145.648 Y125.948 E.01977
G1 X114.708 Y125.948 E1.02634
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5340
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X146.04 Y129.46 E.17807
G1 X146.04 Y131.04 E.04855
G1 X113.96 Y131.04 E.98573
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5340
G1 X145.444 Y125.65 E.47513
; WIPE_START
G1 F24000
G1 X143.444 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.116 J.485 P1  F30000
G1 X145.444 Y130.25 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5340
G1 X140.22 Y130.25 E.1655
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X133.928 Y130.3 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5340
G1 X132.3 Y130.3 E.05401
G1 X131.778 Y129.778 E.02448
G1 X128.391 Y129.609 E.11248
G1 X127.7 Y130.3 E.03242
G1 X124.624 Y130.3 E.10206
G1 X123.698 Y129.374 E.04343
G1 X121.081 Y129.243 E.08692
G1 X120.404 Y129.92 E.03176
G1 X120.404 Y130.3 E.01259
G1 X121.653 Y130.3 E.04143
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5340
M73 P90 R1
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.214 J-.086 P1  F30000
G1 X114.85 Y106.082 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5340
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X145.85 Y109.987 E.17956
G1 X145.85 Y110.782 E.0264
G1 X114.554 Y110.782 E1.03814
G1 X114.554 Y105.487 E.17567
G1 X145.85 Y105.487 E1.03814
G1 X145.85 Y106.082 E.01977
G1 X114.91 Y106.082 E1.02634
G1 X115.242 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5340
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X146.242 Y109.594 E.17807
G1 X146.242 Y111.174 E.04855
G1 X114.162 Y111.174 E.98573
G1 X114.162 Y105.094 E.18682
G1 X146.242 Y105.094 E.98573
G1 X146.242 Y106.474 E.0424
G1 X115.302 Y106.474 E.9507
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5340
G1 X145.646 Y105.784 E.47513
; WIPE_START
G1 F24000
G1 X143.646 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.116 J.485 P1  F30000
G1 X145.646 Y110.384 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5340
G1 X140.422 Y110.384 E.1655
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X134.13 Y110.434 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5340
G1 X132.502 Y110.434 E.05401
G1 X131.98 Y109.912 E.02448
G1 X128.593 Y109.743 E.11248
G1 X127.902 Y110.434 E.03242
G1 X124.826 Y110.434 E.10206
G1 X123.9 Y109.508 E.04343
G1 X121.283 Y109.378 E.08692
G1 X120.606 Y110.055 E.03176
G1 X120.606 Y110.434 E.01259
G1 X121.855 Y110.434 E.04143
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5340
G1 X114.758 Y110.384 E.17424
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/30
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
G3 Z5.8 I-1.206 J-.163 P1  F30000
G1 X114.648 Y125.948 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5715
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
G1 X140.235 Y129.852 E.66426
G1 X145.648 Y129.852 E.17956
G1 X145.648 Y130.648 E.0264
G1 X114.352 Y130.648 E1.03814
G1 X114.352 Y125.352 E.17567
M73 P91 R1
G1 X145.648 Y125.352 E1.03814
G1 X145.648 Y125.948 E.01977
G1 X114.708 Y125.948 E1.02634
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5715
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X146.04 Y129.46 E.17807
G1 X146.04 Y131.04 E.04855
G1 X113.96 Y131.04 E.98573
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5715
G1 X145.444 Y125.65 E.47513
; WIPE_START
G1 F24000
G1 X143.444 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.116 J.485 P1  F30000
G1 X145.444 Y130.25 Z6
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5715
G1 X140.22 Y130.25 E.1655
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X126.893 Y129.653 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.570723
G1 F5715
G1 X126.794 Y129.629 E.00438
; LINE_WIDTH: 0.533042
G1 X126.695 Y129.605 E.00406
; LINE_WIDTH: 0.495361
G1 X126.596 Y129.582 E.00375
; LINE_WIDTH: 0.420283
G1 X126.497 Y129.558 E.00313
G1 X120.244 Y129.245 E.19253
G1 X120.259 Y129.642 E.01222
G1 X120.354 Y129.668 E.00302
G1 X120.448 Y129.831 E.00578
G1 X120.448 Y130.256 E.01308
G1 X126.48 Y130.256 E.1855
; LINE_WIDTH: 0.419999
M73 P91 R0
G1 X126.58 Y130.237 E.00313
; LINE_WIDTH: 0.45768
G1 X126.68 Y130.218 E.00344
; LINE_WIDTH: 0.495361
G1 X126.78 Y130.199 E.00375
; LINE_WIDTH: 0.533042
G1 X126.88 Y130.18 E.00406
; LINE_WIDTH: 0.570723
G1 X128.85 Y130.205 E.08476
; LINE_WIDTH: 0.521491
G1 X130.821 Y130.23 E.07685
; LINE_WIDTH: 0.472259
G1 X132.791 Y130.254 E.06894
; LINE_WIDTH: 0.410881
G2 X134.923 Y130.279 I2.051 J-85.315 E.06393
G1 X134.931 Y129.956 E.00968
G1 X134.77 Y129.948 E.00484
; LINE_WIDTH: 0.373795
G1 X132.816 Y129.875 E.05273
; LINE_WIDTH: 0.423027
G1 X130.862 Y129.802 E.06057
; LINE_WIDTH: 0.472259
G1 X128.907 Y129.729 E.06842
; LINE_WIDTH: 0.521491
G1 X126.953 Y129.655 E.07627
G1 X120.933 Y129.768 F30000
; LINE_WIDTH: 0.641546
G1 F5715
G1 X121.847 Y129.791 E.04463
; LINE_WIDTH: 0.595347
G1 X122.762 Y129.814 E.04118
; LINE_WIDTH: 0.549148
G1 X123.676 Y129.837 E.03774
; LINE_WIDTH: 0.502948
G1 X124.591 Y129.859 E.03429
; LINE_WIDTH: 0.456749
G1 X125.505 Y129.882 E.03085
; LINE_WIDTH: 0.41055
G1 X126.42 Y129.905 E.02741
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5715
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.214 J-.086 P1  F30000
G1 X114.85 Y106.082 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5715
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X145.85 Y109.987 E.17956
G1 X145.85 Y110.782 E.0264
G1 X114.554 Y110.782 E1.03814
G1 X114.554 Y105.487 E.17567
G1 X145.85 Y105.487 E1.03814
G1 X145.85 Y106.082 E.01977
G1 X114.91 Y106.082 E1.02634
G1 X115.242 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5715
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X146.242 Y109.594 E.17807
G1 X146.242 Y111.174 E.04855
G1 X114.162 Y111.174 E.98573
G1 X114.162 Y105.094 E.18682
G1 X146.242 Y105.094 E.98573
G1 X146.242 Y106.474 E.0424
G1 X115.302 Y106.474 E.9507
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5715
G1 X145.646 Y105.784 E.47513
; WIPE_START
G1 F24000
G1 X143.646 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.116 J.485 P1  F30000
G1 X145.646 Y110.384 Z6
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5715
G1 X140.422 Y110.384 E.1655
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X127.095 Y109.787 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.570723
G1 F5715
G1 X126.996 Y109.764 E.00438
; LINE_WIDTH: 0.533042
G1 X126.897 Y109.74 E.00406
; LINE_WIDTH: 0.495361
G1 X126.798 Y109.716 E.00375
; LINE_WIDTH: 0.420283
G1 X126.7 Y109.692 E.00313
G1 X120.446 Y109.38 E.19253
G1 X120.461 Y109.777 E.01222
G1 X120.556 Y109.802 E.00302
G1 X120.65 Y109.965 E.00578
M73 P92 R0
G1 X120.65 Y110.39 E.01308
G1 X126.682 Y110.39 E.1855
; LINE_WIDTH: 0.419999
G1 X126.782 Y110.371 E.00313
; LINE_WIDTH: 0.45768
G1 X126.882 Y110.353 E.00344
; LINE_WIDTH: 0.495361
G1 X126.982 Y110.334 E.00375
; LINE_WIDTH: 0.533042
G1 X127.082 Y110.315 E.00406
; LINE_WIDTH: 0.570723
G1 X129.052 Y110.34 E.08476
; LINE_WIDTH: 0.521491
G1 X131.023 Y110.364 E.07685
; LINE_WIDTH: 0.472259
G1 X132.993 Y110.389 E.06894
; LINE_WIDTH: 0.410881
G2 X135.125 Y110.413 I2.051 J-85.315 E.06393
G1 X135.133 Y110.091 E.00968
G1 X134.972 Y110.083 E.00484
; LINE_WIDTH: 0.373795
G1 X133.018 Y110.01 E.05273
; LINE_WIDTH: 0.423027
G1 X131.064 Y109.936 E.06057
; LINE_WIDTH: 0.472259
G1 X129.109 Y109.863 E.06842
; LINE_WIDTH: 0.521491
G1 X127.155 Y109.79 E.07627
G1 X121.135 Y109.902 F30000
; LINE_WIDTH: 0.641546
G1 F5715
G1 X122.049 Y109.925 E.04463
; LINE_WIDTH: 0.595347
G1 X122.964 Y109.948 E.04118
; LINE_WIDTH: 0.549148
G1 X123.878 Y109.971 E.03774
; LINE_WIDTH: 0.502948
G1 X124.793 Y109.994 E.03429
; LINE_WIDTH: 0.456749
G1 X125.708 Y110.017 E.03085
; LINE_WIDTH: 0.41055
G1 X126.622 Y110.04 E.02741
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5715
G1 X114.758 Y110.384 E.17424
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/30
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
G3 Z6 I-1.206 J-.163 P1  F30000
G1 X114.648 Y125.948 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5715
G1 X114.648 Y129.852 E.12951
G1 X119.852 Y129.852 E.17263
G1 X119.852 Y128.852 E.03317
G1 X120.235 Y128.852 E.0127
G1 X140.235 Y129.852 E.66426
G1 X145.648 Y129.852 E.17956
G1 X145.648 Y130.648 E.0264
G1 X114.352 Y130.648 E1.03814
G1 X114.352 Y125.352 E.17567
G1 X145.648 Y125.352 E1.03814
G1 X145.648 Y125.948 E.01977
G1 X114.708 Y125.948 E1.02634
G1 X115.04 Y126.34 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5715
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X146.04 Y129.46 E.17807
G1 X146.04 Y131.04 E.04855
G1 X113.96 Y131.04 E.98573
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
G1 X114.556 Y125.65 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5715
G1 X145.444 Y125.65 E.47513
; WIPE_START
G1 F24000
G1 X143.444 Y125.65 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.116 J.485 P1  F30000
G1 X145.444 Y130.25 Z6.2
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5715
G1 X140.22 Y130.25 E.1655
; LINE_WIDTH: 0.431926
G1 X139.235 Y130.225 E.03123
; LINE_WIDTH: 0.478042
G1 X138.251 Y130.201 E.03493
; LINE_WIDTH: 0.524157
G1 X137.266 Y130.176 E.03863
; LINE_WIDTH: 0.570272
G1 X136.281 Y130.151 E.04233
; LINE_WIDTH: 0.616387
G1 X135.296 Y130.127 E.04603
G1 X126.893 Y129.653 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.570723
G1 F5715
G1 X126.794 Y129.629 E.00438
; LINE_WIDTH: 0.533042
G1 X126.695 Y129.605 E.00406
; LINE_WIDTH: 0.495361
G1 X126.596 Y129.582 E.00375
; LINE_WIDTH: 0.420283
G1 X126.497 Y129.558 E.00313
G1 X120.244 Y129.245 E.19253
G1 X120.259 Y129.642 E.01222
G1 X120.354 Y129.668 E.00302
G1 X120.448 Y129.831 E.00578
G1 X120.448 Y130.256 E.01308
G1 X126.48 Y130.256 E.1855
; LINE_WIDTH: 0.419999
G1 X126.58 Y130.237 E.00313
; LINE_WIDTH: 0.45768
G1 X126.68 Y130.218 E.00344
; LINE_WIDTH: 0.495361
G1 X126.78 Y130.199 E.00375
; LINE_WIDTH: 0.533042
G1 X126.88 Y130.18 E.00406
; LINE_WIDTH: 0.570723
G1 X128.85 Y130.205 E.08476
; LINE_WIDTH: 0.521491
G1 X130.821 Y130.23 E.07685
; LINE_WIDTH: 0.472259
G1 X132.791 Y130.254 E.06894
; LINE_WIDTH: 0.410881
G2 X134.923 Y130.279 I2.051 J-85.315 E.06393
G1 X134.931 Y129.956 E.00968
G1 X134.77 Y129.948 E.00484
; LINE_WIDTH: 0.373795
G1 X132.816 Y129.875 E.05273
; LINE_WIDTH: 0.423027
G1 X130.862 Y129.802 E.06057
; LINE_WIDTH: 0.472259
G1 X128.907 Y129.729 E.06842
; LINE_WIDTH: 0.521491
G1 X126.953 Y129.655 E.07627
G1 X120.933 Y129.768 F30000
; LINE_WIDTH: 0.641546
G1 F5715
G1 X121.847 Y129.791 E.04463
; LINE_WIDTH: 0.595347
G1 X122.762 Y129.814 E.04118
; LINE_WIDTH: 0.549148
G1 X123.676 Y129.837 E.03774
; LINE_WIDTH: 0.502948
M73 P93 R0
G1 X124.591 Y129.859 E.03429
; LINE_WIDTH: 0.456749
G1 X125.505 Y129.882 E.03085
; LINE_WIDTH: 0.41055
G1 X126.42 Y129.905 E.02741
G1 X120.056 Y130.25 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5715
G1 X114.556 Y130.25 E.17424
; WIPE_START
G1 F24000
G1 X116.556 Y130.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.214 J-.086 P1  F30000
G1 X114.85 Y106.082 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5715
G1 X114.85 Y109.987 E.12951
G1 X120.054 Y109.987 E.17263
G1 X120.054 Y108.987 E.03317
G1 X120.437 Y108.987 E.0127
G1 X140.437 Y109.987 E.66426
G1 X145.85 Y109.987 E.17956
G1 X145.85 Y110.782 E.0264
G1 X114.554 Y110.782 E1.03814
G1 X114.554 Y105.487 E.17567
G1 X145.85 Y105.487 E1.03814
G1 X145.85 Y106.082 E.01977
G1 X114.91 Y106.082 E1.02634
G1 X115.242 Y106.474 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5715
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X146.242 Y109.594 E.17807
G1 X146.242 Y111.174 E.04855
G1 X114.162 Y111.174 E.98573
G1 X114.162 Y105.094 E.18682
G1 X146.242 Y105.094 E.98573
G1 X146.242 Y106.474 E.0424
G1 X115.302 Y106.474 E.9507
M204 S10000
G1 X114.758 Y105.784 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.231684
G1 F5715
G1 X145.646 Y105.784 E.47513
; WIPE_START
G1 F24000
G1 X143.646 Y105.784 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.116 J.485 P1  F30000
G1 X145.646 Y110.384 Z6.2
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.431684
G1 F5715
G1 X140.422 Y110.384 E.1655
; LINE_WIDTH: 0.431926
G1 X139.437 Y110.36 E.03123
; LINE_WIDTH: 0.478042
G1 X138.453 Y110.335 E.03493
; LINE_WIDTH: 0.524157
G1 X137.468 Y110.311 E.03863
; LINE_WIDTH: 0.570272
G1 X136.483 Y110.286 E.04233
; LINE_WIDTH: 0.616387
G1 X135.498 Y110.261 E.04603
G1 X127.095 Y109.787 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.570723
G1 F5715
G1 X126.996 Y109.764 E.00438
; LINE_WIDTH: 0.533042
G1 X126.897 Y109.74 E.00406
; LINE_WIDTH: 0.495361
G1 X126.798 Y109.716 E.00375
; LINE_WIDTH: 0.420283
G1 X126.7 Y109.692 E.00313
G1 X120.446 Y109.38 E.19253
G1 X120.461 Y109.777 E.01222
G1 X120.556 Y109.802 E.00302
G1 X120.65 Y109.965 E.00578
G1 X120.65 Y110.39 E.01308
G1 X126.682 Y110.39 E.1855
; LINE_WIDTH: 0.419999
G1 X126.782 Y110.371 E.00313
; LINE_WIDTH: 0.45768
G1 X126.882 Y110.353 E.00344
; LINE_WIDTH: 0.495361
G1 X126.982 Y110.334 E.00375
; LINE_WIDTH: 0.533042
G1 X127.082 Y110.315 E.00406
; LINE_WIDTH: 0.570723
G1 X129.052 Y110.34 E.08476
; LINE_WIDTH: 0.521491
G1 X131.023 Y110.364 E.07685
; LINE_WIDTH: 0.472259
G1 X132.993 Y110.389 E.06894
; LINE_WIDTH: 0.410881
G2 X135.125 Y110.413 I2.051 J-85.315 E.06393
G1 X135.133 Y110.091 E.00968
G1 X134.972 Y110.083 E.00484
; LINE_WIDTH: 0.373795
G1 X133.018 Y110.01 E.05273
; LINE_WIDTH: 0.423027
G1 X131.064 Y109.936 E.06057
; LINE_WIDTH: 0.472259
G1 X129.109 Y109.863 E.06842
; LINE_WIDTH: 0.521491
G1 X127.155 Y109.79 E.07627
G1 X121.135 Y109.902 F30000
; LINE_WIDTH: 0.641546
G1 F5715
G1 X122.049 Y109.925 E.04463
; LINE_WIDTH: 0.595347
G1 X122.964 Y109.948 E.04118
; LINE_WIDTH: 0.549148
G1 X123.878 Y109.971 E.03774
; LINE_WIDTH: 0.502948
G1 X124.793 Y109.994 E.03429
; LINE_WIDTH: 0.456749
G1 X125.708 Y110.017 E.03085
; LINE_WIDTH: 0.41055
G1 X126.622 Y110.04 E.02741
G1 X120.258 Y110.384 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F5715
G1 X114.758 Y110.384 E.17424
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X116.758 Y110.384 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/30
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
G3 Z6.2 I-1.21 J-.13 P1  F30000
G1 X115.04 Y126.34 Z6.2
G1 Z6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7392
G1 X115.04 Y129.46 E.09587
G1 X119.46 Y129.46 E.13581
G1 X119.46 Y128.46 E.03073
G1 X120.245 Y128.46 E.02411
G1 X140.245 Y129.46 E.61531
G1 X146.04 Y129.46 E.17807
G1 X146.04 Y131.04 E.04855
G1 X113.96 Y131.04 E.98573
G1 X113.96 Y124.96 E.18682
G1 X146.04 Y124.96 E.98573
G1 X146.04 Y126.34 E.0424
G1 X115.1 Y126.34 E.9507
M204 S10000
; WIPE_START
G1 F24000
G1 X115.062 Y128.34 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.101 J1.213 P1  F30000
G1 X145.032 Y130.833 Z6.4
G1 Z6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F7392
G1 X145.833 Y130.032 E.0348
G1 X145.664 Y129.667
G1 X144.499 Y130.833 E.05063
G1 X143.965 Y130.833
G1 X145.131 Y129.667 E.05063
G1 X144.597 Y129.667
G1 X143.432 Y130.833 E.05063
G1 X142.899 Y130.833
G1 X144.064 Y129.667 E.05063
G1 X143.531 Y129.667
G1 X142.366 Y130.833 E.05063
G1 X141.832 Y130.833
G1 X142.997 Y129.667 E.05063
G1 X142.464 Y129.667
G1 X141.299 Y130.833 E.05063
G1 X140.766 Y130.833
G1 X141.931 Y129.667 E.05063
G1 X141.398 Y129.667
G1 X140.232 Y130.833 E.05063
G1 X139.699 Y130.833
G1 X140.864 Y129.667 E.05063
M73 P94 R0
G1 X140.331 Y129.667
G1 X139.166 Y130.833 E.05063
G1 X138.633 Y130.833
G1 X139.819 Y129.646 E.05155
G1 X139.311 Y129.621
G1 X138.099 Y130.833 E.05265
G1 X137.566 Y130.833
G1 X138.803 Y129.596 E.05376
G1 X138.295 Y129.57
G1 X137.033 Y130.833 E.05486
G1 X136.5 Y130.833
G1 X137.787 Y129.545 E.05596
G1 X137.28 Y129.519
G1 X135.966 Y130.833 E.05707
G1 X135.433 Y130.833
G1 X136.772 Y129.494 E.05817
G1 X136.264 Y129.469
G1 X134.9 Y130.833 E.05927
G1 X134.366 Y130.833
G1 X135.756 Y129.443 E.06038
G1 X135.248 Y129.418
G1 X133.833 Y130.833 E.06148
G1 X133.3 Y130.833
G1 X134.74 Y129.392 E.06258
G1 X134.232 Y129.367
G1 X132.767 Y130.833 E.06369
G1 X132.233 Y130.833
G1 X133.724 Y129.342 E.06479
G1 X133.216 Y129.316
G1 X131.7 Y130.833 E.06589
G1 X131.167 Y130.833
G1 X132.709 Y129.291 E.067
G1 X132.201 Y129.265
G1 X130.634 Y130.833 E.0681
G1 X130.1 Y130.833
G1 X131.693 Y129.24 E.0692
G1 X131.185 Y129.215
G1 X129.567 Y130.833 E.07031
G1 X129.034 Y130.833
G1 X130.677 Y129.189 E.07141
G1 X130.169 Y129.164
G1 X128.5 Y130.833 E.07251
G1 X127.967 Y130.833
G1 X129.661 Y129.138 E.07362
G1 X129.153 Y129.113
G1 X127.434 Y130.833 E.07472
G1 X126.901 Y130.833
G1 X128.646 Y129.088 E.07583
G1 X128.138 Y129.062
G1 X126.367 Y130.833 E.07693
G1 X125.834 Y130.833
G1 X127.63 Y129.037 E.07803
G1 X127.122 Y129.012
G1 X125.301 Y130.833 E.07914
G1 X124.768 Y130.833
G1 X126.614 Y128.986 E.08024
G1 X126.106 Y128.961
G1 X124.234 Y130.833 E.08134
G1 X123.701 Y130.833
G1 X125.598 Y128.935 E.08245
G1 X125.09 Y128.91
G1 X123.168 Y130.833 E.08355
G1 X122.635 Y130.833
G1 X124.583 Y128.885 E.08465
G1 X124.075 Y128.859
G1 X122.101 Y130.833 E.08576
G1 X121.568 Y130.833
G1 X123.567 Y128.834 E.08686
G1 X123.059 Y128.808
G1 X121.035 Y130.833 E.08796
G1 X120.501 Y130.833
G1 X122.551 Y128.783 E.08907
G1 X122.043 Y128.758
G1 X119.968 Y130.833 E.09017
G1 X119.435 Y130.833
G1 X121.535 Y128.732 E.09127
G1 X121.027 Y128.707
G1 X118.902 Y130.833 E.09238
G1 X118.368 Y130.833
G1 X119.534 Y129.667 E.05063
G1 X119 Y129.667
G1 X117.835 Y130.833 E.05063
G1 X117.302 Y130.833
G1 X118.467 Y129.667 E.05063
G1 X117.934 Y129.667
G1 X116.769 Y130.833 E.05063
G1 X116.235 Y130.833
G1 X117.4 Y129.667 E.05063
G1 X116.867 Y129.667
G1 X115.702 Y130.833 E.05063
G1 X115.169 Y130.833
G1 X116.334 Y129.667 E.05063
G1 X115.801 Y129.667
G1 X114.635 Y130.833 E.05063
G1 X114.167 Y130.767
G1 X115.267 Y129.667 E.0478
G1 X114.833 Y129.569
G1 X114.167 Y130.234 E.02891
G1 X114.167 Y129.701
G1 X114.833 Y129.036 E.02891
G1 X114.833 Y128.502
G1 X114.167 Y129.168 E.02891
G1 X114.167 Y128.634
G1 X114.833 Y127.969 E.02891
G1 X114.833 Y127.436
G1 X114.167 Y128.101 E.02891
G1 X114.167 Y127.568
G1 X114.833 Y126.903 E.02891
G1 X114.833 Y126.369
G1 X114.167 Y127.035 E.02891
M204 S10000
; WIPE_START
G1 F24000
G1 X114.833 Y126.369 E-.35749
G1 X114.833 Y126.903 E-.20264
G1 X114.461 Y127.274 E-.19987
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.484 J1.116 P1  F30000
G1 X119.667 Y129.534 Z6.4
G1 Z6
G1 E.8 F1800
M204 S2000
G1 F7392
G1 X120.52 Y128.681 E.03703
M204 S10000
; WIPE_START
G1 F24000
G1 X119.667 Y129.534 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.173 J1.205 P1  F30000
G1 X145.833 Y125.766 Z6.4
G1 Z6
G1 E.8 F1800
M204 S2000
G1 F7392
G1 X145.466 Y126.133 E.01594
G1 X144.932 Y126.133
G1 X145.833 Y125.232 E.03912
G1 X145.364 Y125.167
G1 X144.399 Y126.133 E.04194
G1 X143.866 Y126.133
G1 X144.831 Y125.167 E.04194
G1 X144.298 Y125.167
G1 X143.333 Y126.133 E.04194
G1 X142.799 Y126.133
G1 X143.765 Y125.167 E.04194
G1 X143.231 Y125.167
G1 X142.266 Y126.133 E.04194
G1 X141.733 Y126.133
G1 X142.698 Y125.167 E.04194
G1 X142.165 Y125.167
G1 X141.2 Y126.133 E.04194
G1 X140.666 Y126.133
G1 X141.632 Y125.167 E.04194
G1 X141.098 Y125.167
G1 X140.133 Y126.133 E.04194
G1 X139.6 Y126.133
G1 X140.565 Y125.167 E.04194
G1 X140.032 Y125.167
G1 X139.066 Y126.133 E.04194
G1 X138.533 Y126.133
G1 X139.498 Y125.167 E.04194
G1 X138.965 Y125.167
G1 X138 Y126.133 E.04194
G1 X137.467 Y126.133
G1 X138.432 Y125.167 E.04194
M73 P95 R0
G1 X137.899 Y125.167
G1 X136.933 Y126.133 E.04194
G1 X136.4 Y126.133
G1 X137.365 Y125.167 E.04194
G1 X136.832 Y125.167
G1 X135.867 Y126.133 E.04194
G1 X135.334 Y126.133
G1 X136.299 Y125.167 E.04194
G1 X135.766 Y125.167
G1 X134.8 Y126.133 E.04194
G1 X134.267 Y126.133
G1 X135.232 Y125.167 E.04194
G1 X134.699 Y125.167
G1 X133.734 Y126.133 E.04194
G1 X133.2 Y126.133
G1 X134.166 Y125.167 E.04194
G1 X133.632 Y125.167
G1 X132.667 Y126.133 E.04194
G1 X132.134 Y126.133
G1 X133.099 Y125.167 E.04194
G1 X132.566 Y125.167
G1 X131.601 Y126.133 E.04194
G1 X131.067 Y126.133
G1 X132.033 Y125.167 E.04194
G1 X131.499 Y125.167
G1 X130.534 Y126.133 E.04194
G1 X130.001 Y126.133
G1 X130.966 Y125.167 E.04194
G1 X130.433 Y125.167
G1 X129.468 Y126.133 E.04194
G1 X128.934 Y126.133
G1 X129.9 Y125.167 E.04194
G1 X129.366 Y125.167
G1 X128.401 Y126.133 E.04194
G1 X127.868 Y126.133
G1 X128.833 Y125.167 E.04194
G1 X128.3 Y125.167
G1 X127.335 Y126.133 E.04194
G1 X126.801 Y126.133
G1 X127.766 Y125.167 E.04194
G1 X127.233 Y125.167
G1 X126.268 Y126.133 E.04194
G1 X125.735 Y126.133
G1 X126.7 Y125.167 E.04194
G1 X126.167 Y125.167
G1 X125.201 Y126.133 E.04194
G1 X124.668 Y126.133
G1 X125.633 Y125.167 E.04194
G1 X125.1 Y125.167
G1 X124.135 Y126.133 E.04194
G1 X123.602 Y126.133
G1 X124.567 Y125.167 E.04194
G1 X124.034 Y125.167
G1 X123.068 Y126.133 E.04194
G1 X122.535 Y126.133
G1 X123.5 Y125.167 E.04194
G1 X122.967 Y125.167
G1 X122.002 Y126.133 E.04194
G1 X121.469 Y126.133
G1 X122.434 Y125.167 E.04194
G1 X121.9 Y125.167
G1 X120.935 Y126.133 E.04194
G1 X120.402 Y126.133
G1 X121.367 Y125.167 E.04194
G1 X120.834 Y125.167
G1 X119.869 Y126.133 E.04194
G1 X119.335 Y126.133
G1 X120.301 Y125.167 E.04194
G1 X119.767 Y125.167
G1 X118.802 Y126.133 E.04194
G1 X118.269 Y126.133
G1 X119.234 Y125.167 E.04194
G1 X118.701 Y125.167
G1 X117.736 Y126.133 E.04194
G1 X117.202 Y126.133
G1 X118.168 Y125.167 E.04194
G1 X117.634 Y125.167
G1 X116.669 Y126.133 E.04194
G1 X116.136 Y126.133
G1 X117.101 Y125.167 E.04194
G1 X116.568 Y125.167
G1 X115.603 Y126.133 E.04194
G1 X115.069 Y126.133
G1 X116.035 Y125.167 E.04194
G1 X115.501 Y125.167
G1 X114.167 Y126.501 E.05796
G1 X114.167 Y125.968
G1 X114.968 Y125.167 E.03479
M204 S10000
; WIPE_START
G1 F24000
G1 X114.167 Y125.968 E-.43024
G1 X114.167 Y126.501 E-.20264
G1 X114.404 Y126.265 E-.12712
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.642 J1.034 P1  F30000
G1 X119.666 Y129.532 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.164024
G1 F7392
G1 X119.71 Y129.667 E.0014
G1 X119.667 Y129.71 E.0006
G1 X119.532 Y129.666 E.0014
; WIPE_START
G1 F24000
G1 X119.667 Y129.71 E-.31293
G1 X119.71 Y129.667 E-.13415
G1 X119.666 Y129.532 E-.31292
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.728 J-.976 P1  F30000
G1 X114.956 Y126.019 Z6.4
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.0989424
G1 F7392
G1 X114.719 Y126.256 E.00153
; WIPE_START
G1 F24000
G1 X114.956 Y126.019 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.217 J.018 P1  F30000
G1 X115.242 Y106.474 Z6.4
G1 Z6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7392
G1 X115.242 Y109.594 E.09587
G1 X119.662 Y109.594 E.13581
G1 X119.662 Y108.594 E.03073
G1 X120.447 Y108.594 E.02411
G1 X140.447 Y109.594 E.61531
G1 X146.242 Y109.594 E.17807
G1 X146.242 Y111.174 E.04855
G1 X114.162 Y111.174 E.98573
G1 X114.162 Y105.094 E.18682
G1 X146.242 Y105.094 E.98573
G1 X146.242 Y106.474 E.0424
G1 X115.302 Y106.474 E.9507
M204 S10000
; WIPE_START
G1 F24000
G1 X115.264 Y108.474 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.101 J1.213 P1  F30000
G1 X145.234 Y110.967 Z6.4
G1 Z6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F7392
G1 X146.035 Y110.166 E.0348
G1 X145.866 Y109.802
G1 X144.701 Y110.967 E.05063
G1 X144.167 Y110.967
G1 X145.333 Y109.802 E.05063
G1 X144.799 Y109.802
G1 X143.634 Y110.967 E.05063
G1 X143.101 Y110.967
G1 X144.266 Y109.802 E.05063
G1 X143.733 Y109.802
G1 X142.568 Y110.967 E.05063
G1 X142.034 Y110.967
G1 X143.2 Y109.802 E.05063
G1 X142.666 Y109.802
G1 X141.501 Y110.967 E.05063
G1 X140.968 Y110.967
G1 X142.133 Y109.802 E.05063
G1 X141.6 Y109.802
G1 X140.435 Y110.967 E.05063
G1 X139.901 Y110.967
G1 X141.066 Y109.802 E.05063
G1 X140.533 Y109.802
G1 X139.368 Y110.967 E.05063
G1 X138.835 Y110.967
G1 X140.021 Y109.781 E.05155
G1 X139.513 Y109.755
G1 X138.301 Y110.967 E.05265
G1 X137.768 Y110.967
G1 X139.005 Y109.73 E.05376
G1 X138.497 Y109.705
G1 X137.235 Y110.967 E.05486
G1 X136.702 Y110.967
G1 X137.989 Y109.679 E.05596
G1 X137.482 Y109.654
G1 X136.168 Y110.967 E.05707
G1 X135.635 Y110.967
G1 X136.974 Y109.628 E.05817
G1 X136.466 Y109.603
G1 X135.102 Y110.967 E.05927
G1 X134.569 Y110.967
G1 X135.958 Y109.578 E.06038
G1 X135.45 Y109.552
G1 X134.035 Y110.967 E.06148
G1 X133.502 Y110.967
G1 X134.942 Y109.527 E.06258
G1 X134.434 Y109.502
G1 X132.969 Y110.967 E.06369
G1 X132.435 Y110.967
G1 X133.926 Y109.476 E.06479
G1 X133.419 Y109.451
M73 P96 R0
G1 X131.902 Y110.967 E.06589
G1 X131.369 Y110.967
G1 X132.911 Y109.425 E.067
G1 X132.403 Y109.4
G1 X130.836 Y110.967 E.0681
G1 X130.302 Y110.967
G1 X131.895 Y109.375 E.0692
G1 X131.387 Y109.349
G1 X129.769 Y110.967 E.07031
G1 X129.236 Y110.967
G1 X130.879 Y109.324 E.07141
G1 X130.371 Y109.298
G1 X128.703 Y110.967 E.07251
G1 X128.169 Y110.967
G1 X129.863 Y109.273 E.07362
G1 X129.356 Y109.248
G1 X127.636 Y110.967 E.07472
G1 X127.103 Y110.967
G1 X128.848 Y109.222 E.07583
G1 X128.34 Y109.197
G1 X126.57 Y110.967 E.07693
G1 X126.036 Y110.967
G1 X127.832 Y109.171 E.07803
G1 X127.324 Y109.146
G1 X125.503 Y110.967 E.07914
G1 X124.97 Y110.967
G1 X126.816 Y109.121 E.08024
G1 X126.308 Y109.095
G1 X124.436 Y110.967 E.08134
G1 X123.903 Y110.967
G1 X125.8 Y109.07 E.08245
G1 X125.293 Y109.044
G1 X123.37 Y110.967 E.08355
G1 X122.837 Y110.967
G1 X124.785 Y109.019 E.08465
G1 X124.277 Y108.994
G1 X122.303 Y110.967 E.08576
G1 X121.77 Y110.967
G1 X123.769 Y108.968 E.08686
G1 X123.261 Y108.943
G1 X121.237 Y110.967 E.08796
G1 X120.704 Y110.967
G1 X122.753 Y108.917 E.08907
G1 X122.245 Y108.892
G1 X120.17 Y110.967 E.09017
G1 X119.637 Y110.967
G1 X121.737 Y108.867 E.09127
G1 X121.23 Y108.841
G1 X119.104 Y110.967 E.09238
G1 X118.57 Y110.967
G1 X119.736 Y109.802 E.05063
G1 X119.202 Y109.802
G1 X118.037 Y110.967 E.05063
G1 X117.504 Y110.967
G1 X118.669 Y109.802 E.05063
G1 X118.136 Y109.802
G1 X116.971 Y110.967 E.05063
G1 X116.437 Y110.967
G1 X117.603 Y109.802 E.05063
G1 X117.069 Y109.802
G1 X115.904 Y110.967 E.05063
G1 X115.371 Y110.967
G1 X116.536 Y109.802 E.05063
G1 X116.003 Y109.802
G1 X114.838 Y110.967 E.05063
G1 X114.369 Y110.902
G1 X115.47 Y109.802 E.0478
G1 X115.035 Y109.703
G1 X114.369 Y110.369 E.02891
G1 X114.369 Y109.835
G1 X115.035 Y109.17 E.02891
G1 X115.035 Y108.637
G1 X114.369 Y109.302 E.02891
G1 X114.369 Y108.769
G1 X115.035 Y108.104 E.02891
G1 X115.035 Y107.57
G1 X114.369 Y108.236 E.02891
G1 X114.369 Y107.702
G1 X115.035 Y107.037 E.02891
G1 X115.035 Y106.504
G1 X114.369 Y107.169 E.02891
M204 S10000
; WIPE_START
G1 F24000
G1 X115.035 Y106.504 E-.35749
G1 X115.035 Y107.037 E-.20264
G1 X114.663 Y107.409 E-.19987
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.484 J1.116 P1  F30000
G1 X119.869 Y109.668 Z6.4
G1 Z6
G1 E.8 F1800
M204 S2000
G1 F7392
G1 X120.722 Y108.816 E.03703
M204 S10000
; WIPE_START
G1 F24000
G1 X119.869 Y109.668 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.173 J1.205 P1  F30000
G1 X146.035 Y105.9 Z6.4
G1 Z6
G1 E.8 F1800
M204 S2000
G1 F7392
G1 X145.668 Y106.267 E.01594
G1 X145.135 Y106.267
G1 X146.035 Y105.367 E.03912
G1 X145.566 Y105.302
G1 X144.601 Y106.267 E.04194
G1 X144.068 Y106.267
G1 X145.033 Y105.302 E.04194
G1 X144.5 Y105.302
G1 X143.535 Y106.267 E.04194
G1 X143.001 Y106.267
G1 X143.967 Y105.302 E.04194
G1 X143.433 Y105.302
G1 X142.468 Y106.267 E.04194
G1 X141.935 Y106.267
G1 X142.9 Y105.302 E.04194
G1 X142.367 Y105.302
G1 X141.402 Y106.267 E.04194
G1 X140.868 Y106.267
G1 X141.834 Y105.302 E.04194
G1 X141.3 Y105.302
G1 X140.335 Y106.267 E.04194
G1 X139.802 Y106.267
G1 X140.767 Y105.302 E.04194
G1 X140.234 Y105.302
G1 X139.269 Y106.267 E.04194
G1 X138.735 Y106.267
G1 X139.701 Y105.302 E.04194
G1 X139.167 Y105.302
G1 X138.202 Y106.267 E.04194
M73 P97 R0
G1 X137.669 Y106.267
G1 X138.634 Y105.302 E.04194
G1 X138.101 Y105.302
G1 X137.135 Y106.267 E.04194
G1 X136.602 Y106.267
G1 X137.567 Y105.302 E.04194
G1 X137.034 Y105.302
G1 X136.069 Y106.267 E.04194
G1 X135.536 Y106.267
G1 X136.501 Y105.302 E.04194
G1 X135.968 Y105.302
G1 X135.002 Y106.267 E.04194
G1 X134.469 Y106.267
G1 X135.434 Y105.302 E.04194
G1 X134.901 Y105.302
G1 X133.936 Y106.267 E.04194
G1 X133.403 Y106.267
G1 X134.368 Y105.302 E.04194
G1 X133.835 Y105.302
G1 X132.869 Y106.267 E.04194
G1 X132.336 Y106.267
G1 X133.301 Y105.302 E.04194
G1 X132.768 Y105.302
G1 X131.803 Y106.267 E.04194
G1 X131.27 Y106.267
G1 X132.235 Y105.302 E.04194
G1 X131.701 Y105.302
G1 X130.736 Y106.267 E.04194
G1 X130.203 Y106.267
G1 X131.168 Y105.302 E.04194
G1 X130.635 Y105.302
G1 X129.67 Y106.267 E.04194
G1 X129.136 Y106.267
G1 X130.102 Y105.302 E.04194
G1 X129.568 Y105.302
G1 X128.603 Y106.267 E.04194
G1 X128.07 Y106.267
G1 X129.035 Y105.302 E.04194
G1 X128.502 Y105.302
G1 X127.537 Y106.267 E.04194
G1 X127.003 Y106.267
G1 X127.969 Y105.302 E.04194
G1 X127.435 Y105.302
G1 X126.47 Y106.267 E.04194
G1 X125.937 Y106.267
G1 X126.902 Y105.302 E.04194
G1 X126.369 Y105.302
G1 X125.404 Y106.267 E.04194
G1 X124.87 Y106.267
G1 X125.835 Y105.302 E.04194
G1 X125.302 Y105.302
G1 X124.337 Y106.267 E.04194
G1 X123.804 Y106.267
G1 X124.769 Y105.302 E.04194
G1 X124.236 Y105.302
G1 X123.27 Y106.267 E.04194
G1 X122.737 Y106.267
G1 X123.702 Y105.302 E.04194
G1 X123.169 Y105.302
G1 X122.204 Y106.267 E.04194
G1 X121.671 Y106.267
G1 X122.636 Y105.302 E.04194
G1 X122.103 Y105.302
G1 X121.137 Y106.267 E.04194
G1 X120.604 Y106.267
G1 X121.569 Y105.302 E.04194
G1 X121.036 Y105.302
G1 X120.071 Y106.267 E.04194
G1 X119.538 Y106.267
G1 X120.503 Y105.302 E.04194
G1 X119.97 Y105.302
G1 X119.004 Y106.267 E.04194
G1 X118.471 Y106.267
G1 X119.436 Y105.302 E.04194
G1 X118.903 Y105.302
G1 X117.938 Y106.267 E.04194
G1 X117.404 Y106.267
G1 X118.37 Y105.302 E.04194
G1 X117.836 Y105.302
G1 X116.871 Y106.267 E.04194
G1 X116.338 Y106.267
G1 X117.303 Y105.302 E.04194
G1 X116.77 Y105.302
G1 X115.805 Y106.267 E.04194
G1 X115.271 Y106.267
G1 X116.237 Y105.302 E.04194
G1 X115.703 Y105.302
G1 X114.369 Y106.636 E.05796
G1 X114.369 Y106.102
G1 X115.17 Y105.302 E.03479
M204 S10000
; WIPE_START
G1 F24000
G1 X114.369 Y106.102 E-.43024
G1 X114.369 Y106.636 E-.20264
G1 X114.606 Y106.399 E-.12712
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.642 J1.034 P1  F30000
G1 X119.868 Y109.666 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.164024
G1 F7392
G1 X119.912 Y109.801 E.0014
G1 X119.869 Y109.844 E.0006
G1 X119.734 Y109.8 E.0014
; WIPE_START
G1 F24000
G1 X119.869 Y109.844 E-.31293
G1 X119.912 Y109.801 E-.13415
G1 X119.868 Y109.666 E-.31292
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.728 J-.976 P1  F30000
G1 X115.158 Y106.154 Z6.4
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.0989424
G1 F7392
G1 X114.921 Y106.39 E.00153
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X115.158 Y106.154 E-.76
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
G1 Z6.5 F900 ; lower z a little
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

    G1 Z106 F600
    G1 Z104

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

