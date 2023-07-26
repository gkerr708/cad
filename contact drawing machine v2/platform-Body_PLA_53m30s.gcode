; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 47m 41s; total estimated time: 53m 30s
; total layer number: 125
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
M73 P0 R53
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
M73 P8 R49
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
M73 P8 R48
G1 X76 F15000
M73 P9 R48
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
    G29 A X66.9151 Y65.4151 I126.17 J129.17
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
; layer num/total_layer_count: 1/125
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
G1 X68.694 Y65.236 F30000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
G1 F3000
G1 X69.223 Y64.764 E.02642
G1 X69.811 Y64.368 E.02642
G1 X70.449 Y64.054 E.02645
M73 P10 R48
G1 X71.045 Y63.849 E.0235
G1 X71.74 Y63.699 E.02647
G1 X72.508 Y63.644 E.02869
G1 X187.492 Y63.644 E4.28272
G1 X188.208 Y63.692 E.02671
G1 X188.902 Y63.835 E.02642
G1 X189.573 Y64.07 E.02646
G1 X190.127 Y64.346 E.02306
G1 X190.725 Y64.732 E.02652
G1 X191.264 Y65.194 E.02642
G1 X191.736 Y65.723 E.02642
G1 X192.132 Y66.311 E.02642
G1 X192.446 Y66.949 E.02647
G1 X192.636 Y67.493 E.02147
M73 P10 R47
G1 X192.801 Y68.241 E.0285
G1 X192.856 Y69.008 E.02867
G1 X192.856 Y186.992 E4.39445
G1 X192.808 Y187.708 E.02671
G1 X192.665 Y188.402 E.02642
G1 X192.43 Y189.073 E.02646
G1 X192.154 Y189.627 E.02306
G1 X191.768 Y190.225 E.02652
G1 X191.306 Y190.764 E.02642
G1 X190.777 Y191.236 E.02642
G1 X190.189 Y191.632 E.02642
G1 X189.551 Y191.946 E.02645
G1 X188.955 Y192.151 E.0235
G1 X188.26 Y192.301 E.02647
G1 X187.492 Y192.356 E.02869
G1 X72.508 Y192.356 E4.28272
G1 X71.792 Y192.308 E.02671
G1 X71.098 Y192.165 E.02642
G1 X70.427 Y191.93 E.02646
G1 X69.873 Y191.654 E.02306
G1 X69.275 Y191.268 E.02652
G1 X68.736 Y190.806 E.02642
G1 X68.264 Y190.277 E.02642
G1 X67.868 Y189.689 E.02642
G1 X67.554 Y189.051 E.02645
G1 X67.349 Y188.455 E.0235
G1 X67.199 Y187.76 E.02647
G1 X67.144 Y186.992 E.02869
G1 X67.144 Y69.008 E4.39446
G1 X67.192 Y68.292 E.02671
G1 X67.335 Y67.598 E.02642
G1 X67.57 Y66.927 E.02646
G1 X67.846 Y66.373 E.02306
G1 X68.232 Y65.775 E.02652
G1 X68.655 Y65.282 E.02418
G1 X69.002 Y65.578 F30000
G1 F3000
G1 X69.015 Y65.564 E.00071
G1 X69.512 Y65.121 E.0248
G1 X70.05 Y64.76 E.02411
G1 X70.617 Y64.481 E.02354
G1 X71.176 Y64.289 E.02204
G1 X71.796 Y64.155 E.02361
G1 X72.53 Y64.101 E.02741
G1 X187.481 Y64.101 E4.28151
G1 X188.155 Y64.148 E.02515
G1 X188.789 Y64.279 E.02411
G1 X189.386 Y64.489 E.02358
G1 X189.907 Y64.748 E.02166
G1 X190.444 Y65.095 E.02381
G1 X190.95 Y65.528 E.0248
G1 X191.368 Y65.997 E.02342
G1 X191.731 Y66.534 E.02411
G1 X192.027 Y67.134 E.02493
G1 X192.197 Y67.626 E.0194
M73 P11 R47
G1 X192.345 Y68.297 E.02559
G1 X192.399 Y69.03 E.02737
G1 X192.399 Y186.972 E4.3929
G1 X192.352 Y187.655 E.02549
G1 X192.221 Y188.289 E.02411
G1 X192.011 Y188.886 E.02358
G1 X191.752 Y189.407 E.02166
G1 X191.405 Y189.944 E.02381
G1 X190.985 Y190.436 E.02411
G1 X190.488 Y190.879 E.0248
G1 X189.95 Y191.24 E.02411
G1 X189.383 Y191.519 E.02354
G1 X188.824 Y191.711 E.02204
G1 X188.204 Y191.845 E.02361
G1 X187.47 Y191.899 E.02741
G1 X72.528 Y191.899 E4.28117
G1 X71.845 Y191.852 E.02549
G1 X71.211 Y191.721 E.02411
G1 X70.614 Y191.511 E.02358
G1 X70.093 Y191.252 E.02166
G1 X69.556 Y190.905 E.02381
G1 X69.064 Y190.485 E.02411
G1 X68.621 Y189.988 E.0248
G1 X68.26 Y189.45 E.02411
G1 X67.981 Y188.883 E.02354
G1 X67.789 Y188.324 E.02204
G1 X67.655 Y187.704 E.02361
G1 X67.601 Y186.97 E.02741
G1 X67.601 Y69.028 E4.39291
G1 X67.648 Y68.345 E.02549
G1 X67.779 Y67.711 E.02411
G1 X67.989 Y67.114 E.02358
G1 X68.248 Y66.593 E.02166
G1 X68.595 Y66.056 E.02381
G1 X68.964 Y65.624 E.02117
G1 X69.312 Y65.92 F30000
G1 F3000
G1 X69.336 Y65.891 E.00139
G1 X69.8 Y65.478 E.02316
G1 X70.287 Y65.153 E.0218
G1 X70.801 Y64.901 E.02131
G1 X71.307 Y64.728 E.01992
G1 X71.852 Y64.61 E.02076
G1 X72.552 Y64.558 E.02614
G1 X187.461 Y64.558 E4.27993
G1 X188.102 Y64.604 E.02393
G1 X188.657 Y64.719 E.02114
G1 X189.2 Y64.908 E.0214
G1 X189.686 Y65.15 E.02025
G1 X190.162 Y65.457 E.02109
G1 X190.635 Y65.862 E.02318
G1 X191.011 Y66.286 E.02113
G1 X191.329 Y66.756 E.02112
G1 X191.607 Y67.318 E.02336
G1 X191.758 Y67.758 E.01733
G1 X191.89 Y68.354 E.02272
G1 X191.942 Y69.052 E.02607
G1 X191.942 Y186.952 E4.39132
G1 X191.896 Y187.602 E.02427
G1 X191.781 Y188.157 E.02113
G1 X191.592 Y188.7 E.0214
G1 X191.35 Y189.186 E.02025
G1 X191.043 Y189.663 E.02111
G1 X190.664 Y190.109 E.0218
G1 X190.2 Y190.522 E.02316
G1 X189.713 Y190.847 E.0218
G1 X189.199 Y191.099 E.02131
G1 X188.693 Y191.272 E.01992
G1 X188.148 Y191.39 E.02076
G1 X187.448 Y191.442 E.02614
G1 X72.548 Y191.442 E4.27959
G1 X71.898 Y191.396 E.02427
G1 X71.343 Y191.281 E.02113
G1 X70.8 Y191.092 E.0214
G1 X70.314 Y190.85 E.02025
G1 X69.837 Y190.543 E.02111
G1 X69.391 Y190.164 E.0218
G1 X68.978 Y189.7 E.02316
G1 X68.653 Y189.213 E.0218
G1 X68.401 Y188.699 E.02131
G1 X68.228 Y188.193 E.01992
G1 X68.11 Y187.648 E.02076
G1 X68.058 Y186.948 E.02614
G1 X68.058 Y69.048 E4.39133
G1 X68.104 Y68.398 E.02427
G1 X68.219 Y67.843 E.02113
G1 X68.408 Y67.3 E.0214
G1 X68.65 Y66.814 E.02025
G1 X68.957 Y66.337 E.02111
G1 X69.273 Y65.965 E.01818
G1 X69.622 Y66.26 F30000
G1 F3000
G1 X69.658 Y66.219 E.00204
G1 X70.089 Y65.835 E.02149
G1 X70.524 Y65.546 E.01946
G1 X70.984 Y65.321 E.01908
G1 X71.437 Y65.168 E.01782
G1 X71.908 Y65.066 E.01795
G1 X72.574 Y65.015 E.02487
G1 X187.44 Y65.015 E4.27831
G1 X188.048 Y65.059 E.0227
G1 X188.544 Y65.163 E.01887
G1 X189.014 Y65.327 E.01854
G1 X189.453 Y65.545 E.01826
G1 X189.881 Y65.819 E.01892
G1 X190.32 Y66.196 E.02155
G1 X190.655 Y66.575 E.01882
G1 X190.928 Y66.978 E.01816
G1 X191.187 Y67.503 E.02178
G1 X191.319 Y67.89 E.01524
G1 X191.434 Y68.411 E.01988
G1 X191.485 Y69.074 E.02477
G1 X191.485 Y186.931 E4.38971
G1 X191.441 Y187.548 E.02305
G1 X191.337 Y188.044 E.01886
G1 X191.173 Y188.514 E.01855
G1 X190.955 Y188.953 E.01826
G1 X190.68 Y189.382 E.01899
G1 X190.342 Y189.781 E.01947
G1 X189.911 Y190.165 E.02149
G1 X189.476 Y190.454 E.01946
G1 X189.016 Y190.679 E.01908
G1 X188.563 Y190.832 E.01782
G1 X188.092 Y190.934 E.01795
G1 X187.426 Y190.985 E.02487
G1 X72.569 Y190.985 E4.27798
G1 X71.952 Y190.941 E.02305
G1 X71.456 Y190.837 E.01886
G1 X70.986 Y190.673 E.01855
G1 X70.547 Y190.455 E.01826
G1 X70.118 Y190.18 E.01899
G1 X69.719 Y189.842 E.01947
G1 X69.335 Y189.411 E.02149
G1 X69.046 Y188.976 E.01946
G1 X68.821 Y188.516 E.01908
G1 X68.668 Y188.063 E.01782
G1 X68.566 Y187.592 E.01795
G1 X68.515 Y186.926 E.02487
G1 X68.515 Y69.069 E4.38972
G1 X68.559 Y68.452 E.02305
G1 X68.663 Y67.956 E.01886
G1 X68.827 Y67.486 E.01855
G1 X69.045 Y67.047 E.01826
G1 X69.32 Y66.618 E.01899
G1 X69.584 Y66.306 E.01519
G1 X69.934 Y66.601 F30000
G1 F3000
G1 X69.98 Y66.546 E.00267
G1 X70.377 Y66.192 E.0198
G1 X70.76 Y65.939 E.0171
G1 X71.167 Y65.742 E.01685
G1 X71.567 Y65.607 E.01573
G1 X71.965 Y65.521 E.01518
G1 X72.597 Y65.472 E.0236
G1 X187.418 Y65.472 E4.27666
G1 X187.993 Y65.515 E.02146
G1 X188.412 Y65.603 E.01596
G1 X188.828 Y65.747 E.0164
G1 X189.221 Y65.94 E.01628
G1 X189.599 Y66.182 E.01674
G1 X190.005 Y66.529 E.0199
G1 X190.287 Y66.848 E.01585
G1 X190.527 Y67.201 E.01588
G1 X190.767 Y67.687 E.02019
G1 X190.88 Y68.021 E.01313
G1 X190.979 Y68.469 E.01709
G1 X191.028 Y69.097 E.02347
G1 X191.028 Y186.909 E4.38807
G1 X190.985 Y187.493 E.02181
G1 X190.897 Y187.912 E.01594
G1 X190.753 Y188.328 E.0164
G1 X190.56 Y188.721 E.01628
G1 X190.316 Y189.102 E.01688
G1 X190.02 Y189.454 E.01712
G1 X189.623 Y189.808 E.0198
G1 X189.24 Y190.061 E.0171
G1 X188.833 Y190.258 E.01685
G1 X188.433 Y190.393 E.01573
M73 P12 R47
G1 X188.035 Y190.479 E.01518
G1 X187.403 Y190.528 E.0236
G1 X72.591 Y190.528 E4.27633
G1 X72.007 Y190.485 E.02181
G1 X71.588 Y190.397 E.01594
G1 X71.172 Y190.253 E.0164
G1 X70.779 Y190.06 E.01628
G1 X70.398 Y189.816 E.01688
G1 X70.046 Y189.52 E.01712
G1 X69.692 Y189.123 E.0198
G1 X69.439 Y188.74 E.0171
G1 X69.242 Y188.333 E.01685
G1 X69.107 Y187.933 E.01573
G1 X69.021 Y187.535 E.01518
G1 X68.972 Y186.903 E.0236
G1 X68.972 Y69.09 E4.38807
G1 X69.015 Y68.507 E.02181
G1 X69.103 Y68.088 E.01594
G1 X69.247 Y67.672 E.0164
G1 X69.44 Y67.279 E.01628
G1 X69.684 Y66.898 E.01688
G1 X69.895 Y66.647 E.01222
G1 X70.246 Y66.94 F30000
G1 F3000
G1 X70.302 Y66.873 E.00326
G1 X70.664 Y66.55 E.01807
G1 X70.994 Y66.333 E.01471
G1 X71.348 Y66.163 E.01462
G1 X71.681 Y66.051 E.01309
M73 P12 R46
G1 X72.022 Y65.976 E.01301
G1 X72.62 Y65.929 E.02233
G1 X187.396 Y65.929 E4.27499
G1 X187.938 Y65.97 E.02023
G1 X188.298 Y66.047 E.01373
G1 X188.644 Y66.166 E.01362
G1 X188.989 Y66.335 E.0143
G1 X189.318 Y66.545 E.01453
G1 X189.69 Y66.863 E.01823
G1 X189.93 Y67.136 E.01355
G1 X190.125 Y67.424 E.01295
G1 X190.346 Y67.871 E.01857
G1 X190.441 Y68.151 E.01101
G1 X190.524 Y68.527 E.01434
G1 X190.571 Y69.12 E.02217
G1 X190.571 Y186.888 E4.38639
G1 X190.53 Y187.439 E.02057
G1 X190.453 Y187.798 E.0137
G1 X190.334 Y188.144 E.01362
G1 X190.165 Y188.489 E.0143
G1 X189.952 Y188.823 E.01477
G1 X189.698 Y189.127 E.01475
G1 X189.336 Y189.45 E.01807
G1 X189.006 Y189.667 E.01471
G1 X188.652 Y189.837 E.01462
G1 X188.319 Y189.949 E.01309
G1 X187.978 Y190.024 E.01301
G1 X187.38 Y190.071 E.02233
G1 X72.612 Y190.071 E4.27466
G1 X72.061 Y190.03 E.02057
G1 X71.702 Y189.953 E.0137
G1 X71.356 Y189.834 E.01362
G1 X71.011 Y189.665 E.0143
G1 X70.677 Y189.452 E.01477
G1 X70.373 Y189.198 E.01475
G1 X70.05 Y188.836 E.01807
G1 X69.833 Y188.506 E.01471
G1 X69.663 Y188.152 E.01462
G1 X69.551 Y187.819 E.01309
G1 X69.476 Y187.478 E.01301
G1 X69.429 Y186.88 E.02233
G1 X69.429 Y69.112 E4.3864
G1 X69.47 Y68.561 E.02057
G1 X69.547 Y68.202 E.0137
G1 X69.666 Y67.856 E.01362
G1 X69.835 Y67.511 E.0143
G1 X70.048 Y67.177 E.01477
G1 X70.207 Y66.986 E.00926
G1 X70.577 Y67.293 F30000
G1 F3000
G1 X70.697 Y67.149 E.00701
G1 X71.134 Y66.801 E.02079
G1 X71.554 Y66.585 E.01758
G1 X72.006 Y66.45 E.01759
G1 X72.544 Y66.386 E.02018
G1 X187.449 Y66.386 E4.27977
G1 X188.053 Y66.466 E.0227
G1 X188.514 Y66.615 E.01805
G1 X188.945 Y66.857 E.01839
G1 X189.368 Y67.215 E.02065
G1 X189.71 Y67.653 E.0207
G1 X189.922 Y68.072 E.01749
G1 X190.054 Y68.519 E.01737
G1 X190.114 Y69.043 E.01962
G1 X190.114 Y186.96 E4.39196
G1 X190.047 Y187.495 E.0201
G1 X189.857 Y188.07 E.02255
G1 X189.576 Y188.538 E.02036
G1 X189.285 Y188.869 E.01639
G1 X188.847 Y189.211 E.02069
G1 X188.428 Y189.422 E.01748
G1 X187.981 Y189.554 E.01737
G1 X187.457 Y189.614 E.01962
G1 X72.54 Y189.614 E4.28022
G1 X72.005 Y189.547 E.0201
G1 X71.43 Y189.357 E.02255
G1 X70.962 Y189.076 E.02036
G1 X70.631 Y188.785 E.01639
G1 X70.289 Y188.347 E.02069
G1 X70.078 Y187.928 E.01749
G1 X69.946 Y187.481 E.01737
G1 X69.886 Y186.957 E.01962
G1 X69.886 Y69.05 E4.39162
G1 X69.963 Y68.456 E.02229
G1 X70.104 Y68.011 E.01739
G1 X70.347 Y67.569 E.01878
G1 X70.538 Y67.34 E.01113
G1 X70.891 Y67.62 F30000
G1 F3000
G1 X70.98 Y67.508 E.00534
G1 X71.342 Y67.208 E.01749
G1 X71.685 Y67.023 E.01453
G1 X72.053 Y66.904 E.0144
G1 X72.536 Y66.843 E.01815
G1 X187.458 Y66.843 E4.28041
G1 X188 Y66.92 E.0204
G1 X188.375 Y67.05 E.01478
G1 X188.721 Y67.255 E.01495
G1 X189.076 Y67.566 E.0176
G1 X189.35 Y67.934 E.0171
G1 X189.514 Y68.277 E.01413
G1 X189.616 Y68.649 E.01438
G1 X189.657 Y69.035 E.01444
G1 X189.657 Y186.968 E4.39257
G1 X189.613 Y187.352 E.01438
G1 X189.467 Y187.832 E.01871
G1 X189.241 Y188.227 E.01695
G1 X188.933 Y188.577 E.01733
G1 X188.566 Y188.85 E.01707
G1 X188.223 Y189.014 E.01414
G1 X187.851 Y189.116 E.01438
G1 X187.465 Y189.157 E.01444
G1 X72.532 Y189.157 E4.28083
G1 X72.148 Y189.113 E.01438
G1 X71.668 Y188.967 E.01871
G1 X71.273 Y188.741 E.01695
G1 X70.923 Y188.433 E.01733
G1 X70.65 Y188.066 E.01707
G1 X70.486 Y187.723 E.01414
G1 X70.384 Y187.351 E.01438
G1 X70.343 Y186.965 E.01444
G1 X70.343 Y69.041 E4.39224
G1 X70.399 Y68.592 E.01686
G1 X70.503 Y68.233 E.01391
G1 X70.698 Y67.862 E.01561
G1 X70.853 Y67.667 E.00927
G1 X71.202 Y67.956 F30000
G1 F3000
G1 X71.339 Y67.791 E.008
G1 X71.631 Y67.562 E.01381
G1 X71.898 Y67.427 E.01117
G1 X72.192 Y67.339 E.01142
G1 X72.527 Y67.3 E.01257
G1 X187.468 Y67.3 E4.28109
G1 X187.856 Y67.353 E.01458
M73 P13 R46
G1 X188.142 Y67.443 E.01116
G1 X188.422 Y67.6 E.01199
G1 X188.709 Y67.839 E.01391
G1 X188.938 Y68.131 E.01381
G1 X189.073 Y68.398 E.01117
G1 X189.161 Y68.692 E.01142
G1 X189.2 Y69.027 E.01257
G1 X189.2 Y186.976 E4.39313
G1 X189.159 Y187.306 E.01241
G1 X189.029 Y187.702 E.01549
G1 X188.896 Y187.927 E.00975
G1 X188.661 Y188.21 E.0137
G1 X188.369 Y188.438 E.01379
G1 X188.102 Y188.573 E.01117
G1 X187.808 Y188.661 E.01142
G1 X187.473 Y188.7 E.01257
G1 X72.524 Y188.7 E4.28139
G1 X72.194 Y188.659 E.01241
G1 X71.798 Y188.529 E.01549
G1 X71.573 Y188.396 E.00975
G1 X71.29 Y188.161 E.0137
G1 X71.062 Y187.869 E.01379
G1 X70.927 Y187.602 E.01117
G1 X70.839 Y187.308 E.01142
G1 X70.8 Y186.973 E.01257
G1 X70.8 Y69.032 E4.39283
G1 X70.853 Y68.644 E.01458
G1 X70.943 Y68.358 E.01116
G1 X71.1 Y68.078 E.01199
G1 X71.163 Y68.002 E.00367
G1 X71.515 Y68.294 F30000
G1 F3000
G1 X71.696 Y68.075 E.01057
G1 X71.903 Y67.929 E.00943
G1 X72.1 Y67.837 E.00811
G1 X72.242 Y67.794 E.00551
G1 X72.519 Y67.757 E.01044
G1 X187.477 Y67.757 E4.28173
G1 X187.795 Y67.806 E.01198
G1 X188.003 Y67.878 E.00819
G1 X188.121 Y67.944 E.00504
G1 X188.425 Y68.196 E.0147
G1 X188.571 Y68.403 E.00943
G1 X188.663 Y68.6 E.0081
G1 X188.706 Y68.742 E.00551
G1 X188.743 Y69.019 E.01044
G1 X188.743 Y186.984 E4.39374
G1 X188.724 Y187.166 E.00679
G1 X188.63 Y187.48 E.01222
G1 X188.552 Y187.626 E.00617
G1 X188.304 Y187.924 E.01445
G1 X188.097 Y188.071 E.00943
G1 X187.9 Y188.163 E.0081
G1 X187.758 Y188.206 E.00551
G1 X187.481 Y188.243 E.01044
G1 X72.516 Y188.243 E4.282
G1 X72.334 Y188.224 E.00679
G1 X72.02 Y188.13 E.01222
G1 X71.874 Y188.052 E.00617
G1 X71.576 Y187.804 E.01445
G1 X71.429 Y187.597 E.00943
G1 X71.337 Y187.4 E.00811
G1 X71.294 Y187.258 E.00551
G1 X71.257 Y186.981 E.01044
G1 X71.257 Y69.023 E4.39347
G1 X71.306 Y68.705 E.01198
G1 X71.378 Y68.497 E.00819
G1 X71.444 Y68.379 E.00504
G1 X71.477 Y68.34 E.00189
G1 X71.839 Y68.615 F30000
G1 F3000
G1 X71.973 Y68.439 E.00824
G1 X72.086 Y68.348 E.00541
G1 X72.303 Y68.246 E.00892
G1 X72.511 Y68.214 E.00781
G1 X187.488 Y68.214 E4.28246
G1 X187.721 Y68.257 E.00884
G1 X187.84 Y68.304 E.00475
G1 X188.061 Y68.473 E.01037
G1 X188.152 Y68.586 E.00541
G1 X188.254 Y68.803 E.00892
G1 X188.286 Y69.011 E.00782
G1 X188.286 Y186.991 E4.39434
G1 X188.27 Y187.118 E.00475
G1 X188.194 Y187.343 E.00884
G1 X188.027 Y187.561 E.01023
G1 X187.914 Y187.652 E.00541
G1 X187.697 Y187.754 E.00892
G1 X187.489 Y187.786 E.00782
G1 X72.509 Y187.786 E4.2826
G1 X72.382 Y187.77 E.00475
G1 X72.157 Y187.694 E.00884
G1 X71.939 Y187.527 E.01023
G1 X71.848 Y187.414 E.00541
G1 X71.746 Y187.197 E.00892
G1 X71.714 Y186.989 E.00781
G1 X71.714 Y69.012 E4.3942
G1 X71.757 Y68.779 E.00884
G1 X71.803 Y68.663 E.00464
G1 X72.203 Y68.884 F30000
G1 F3000
G1 X72.247 Y68.805 E.00339
G1 X72.384 Y68.696 E.00652
G1 X72.5 Y68.671 E.00442
G1 X187.5 Y68.671 E4.28331
G1 X187.611 Y68.7 E.00426
G1 X187.695 Y68.747 E.00361
G1 X187.804 Y68.884 E.00652
G1 X187.829 Y69 E.00442
G1 X187.829 Y187 E4.39505
G1 X187.8 Y187.111 E.00426
G1 X187.753 Y187.195 E.00361
G1 X187.616 Y187.304 E.00652
G1 X187.5 Y187.329 E.00442
G1 X72.5 Y187.329 E4.28331
G1 X72.389 Y187.3 E.00426
G1 X72.305 Y187.253 E.00361
G1 X72.196 Y187.116 E.00652
G1 X72.171 Y187 E.00442
G1 X72.171 Y69 E4.39505
G1 X72.186 Y68.942 E.00224
; WIPE_START
G1 F24000
G1 X72.247 Y68.805 E-.05695
G1 X72.384 Y68.696 E-.06647
G1 X72.5 Y68.671 E-.04514
G1 X74.056 Y68.671 E-.59145
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.068 J.584 P1  F30000
M73 P14 R46
G1 X129.357 Y169.857 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X78.643 Y169.857 E1.88891
G1 X78.643 Y88.143 E3.04354
G1 X129.357 Y88.143 E1.88891
M73 P14 R45
G1 X129.357 Y169.797 E3.04131
G1 X128.9 Y169.4 F30000
; FEATURE: Outer wall
G1 F3000
G1 X79.1 Y169.4 E1.85486
G1 X79.1 Y88.6 E3.00949
G1 X128.9 Y88.6 E1.85486
G1 X128.9 Y169.34 E3.00726
; WIPE_START
G1 F24000
G1 X126.9 Y169.342 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.072 J-.577 P1  F30000
G1 X73.357 Y69.857 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X186.643 Y69.857 E4.21947
G1 X186.643 Y186.143 E4.33121
G1 X73.357 Y186.143 E4.21947
G1 X73.357 Y69.917 E4.32897
G1 X72.9 Y69.4 F30000
; FEATURE: Outer wall
G1 F3000
G1 X187.1 Y69.4 E4.25352
G1 X187.1 Y186.6 E4.36525
G1 X72.9 Y186.6 E4.25352
G1 X72.9 Y69.46 E4.36302
; WIPE_START
G1 F24000
G1 X74.9 Y69.459 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.016 J1.217 P1  F30000
G1 X186.46 Y70.964 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.500205
G1 F6300
G1 X185.741 Y70.246 E.03788
G1 X185.095 Y70.246 E.0241
G1 X186.254 Y71.405 E.06112
G1 X186.254 Y72.052 E.0241
G1 X184.448 Y70.246 E.0952
G1 X183.801 Y70.246 E.0241
G1 X186.254 Y72.699 E.12927
G1 X186.254 Y73.345 E.0241
G1 X183.155 Y70.246 E.16335
G1 X182.508 Y70.246 E.0241
G1 X186.254 Y73.992 E.19743
G1 X186.254 Y74.639 E.0241
G1 X181.861 Y70.246 E.23151
G1 X181.214 Y70.246 E.0241
G1 X186.254 Y75.286 E.26559
G1 X186.254 Y75.932 E.0241
G1 X180.568 Y70.246 E.29967
G1 X179.921 Y70.246 E.0241
G1 X186.254 Y76.579 E.33375
G1 X186.254 Y77.226 E.0241
G1 X179.274 Y70.246 E.36783
G1 X178.628 Y70.246 E.0241
G1 X186.254 Y77.872 E.40191
G1 X186.254 Y78.519 E.0241
G1 X177.981 Y70.246 E.43599
G1 X177.334 Y70.246 E.0241
G1 X186.254 Y79.166 E.47007
G1 X186.254 Y79.812 E.0241
G1 X176.688 Y70.246 E.50415
G1 X176.041 Y70.246 E.0241
G1 X186.254 Y80.459 E.53823
G1 X186.254 Y81.106 E.0241
G1 X175.394 Y70.246 E.57231
G1 X174.747 Y70.246 E.0241
G1 X186.254 Y81.753 E.60639
M73 P15 R45
G1 X186.254 Y82.399 E.0241
G1 X174.101 Y70.246 E.64047
G1 X173.454 Y70.246 E.0241
G1 X186.254 Y83.046 E.67455
G1 X186.254 Y83.693 E.0241
G1 X172.807 Y70.246 E.70863
G1 X172.161 Y70.246 E.0241
G1 X186.254 Y84.339 E.74271
G1 X186.254 Y84.986 E.0241
G1 X171.514 Y70.246 E.77679
G1 X170.867 Y70.246 E.0241
G1 X186.254 Y85.633 E.81087
G1 X186.254 Y86.279 E.0241
G1 X170.221 Y70.246 E.84495
G1 X169.574 Y70.246 E.0241
G1 X186.254 Y86.926 E.87902
G1 X186.254 Y87.573 E.0241
G1 X168.927 Y70.246 E.9131
G1 X168.281 Y70.246 E.0241
G1 X186.254 Y88.219 E.94718
G1 X186.254 Y88.866 E.0241
G1 X167.634 Y70.246 E.98126
G1 X166.987 Y70.246 E.0241
G1 X186.254 Y89.513 E1.01534
G1 X186.254 Y90.16 E.0241
G1 X166.34 Y70.246 E1.04942
G1 X165.694 Y70.246 E.0241
G1 X186.254 Y90.806 E1.0835
G1 X186.254 Y91.453 E.0241
G1 X165.047 Y70.246 E1.11758
G1 X164.4 Y70.246 E.0241
G1 X186.254 Y92.1 E1.15166
G1 X186.254 Y92.746 E.0241
G1 X163.754 Y70.246 E1.18574
G1 X163.107 Y70.246 E.0241
G1 X186.254 Y93.393 E1.21982
G1 X186.254 Y94.04 E.0241
G1 X162.46 Y70.246 E1.2539
G1 X161.814 Y70.246 E.0241
G1 X186.254 Y94.686 E1.28798
G1 X186.254 Y95.333 E.0241
G1 X161.167 Y70.246 E1.32206
G1 X160.52 Y70.246 E.0241
G1 X186.254 Y95.98 E1.35614
G1 X186.254 Y96.627 E.0241
G1 X159.873 Y70.246 E1.39022
G1 X159.227 Y70.246 E.0241
G1 X186.254 Y97.273 E1.4243
G1 X186.254 Y97.92 E.0241
G1 X158.58 Y70.246 E1.45838
G1 X157.933 Y70.246 E.0241
G1 X186.254 Y98.567 E1.49246
G1 X186.254 Y99.213 E.0241
G1 X157.287 Y70.246 E1.52654
G1 X156.64 Y70.246 E.0241
G1 X186.254 Y99.86 E1.56062
G1 X186.254 Y100.507 E.0241
G1 X155.993 Y70.246 E1.5947
G1 X155.347 Y70.246 E.0241
G1 X186.254 Y101.153 E1.62878
G1 X186.254 Y101.8 E.0241
G1 X154.7 Y70.246 E1.66285
G1 X154.053 Y70.246 E.0241
G1 X186.254 Y102.447 E1.69693
G1 X186.254 Y103.094 E.0241
G1 X153.406 Y70.246 E1.73101
G1 X152.76 Y70.246 E.0241
G1 X186.254 Y103.74 E1.76509
G1 X186.254 Y104.387 E.0241
G1 X152.113 Y70.246 E1.79917
G1 X151.466 Y70.246 E.0241
G1 X186.254 Y105.034 E1.83325
G1 X186.254 Y105.68 E.0241
G1 X150.82 Y70.246 E1.86733
G1 X150.173 Y70.246 E.0241
G1 X186.254 Y106.327 E1.90141
M73 P15 R44
G1 X186.254 Y106.974 E.0241
G1 X149.526 Y70.246 E1.93549
G1 X148.88 Y70.246 E.0241
G1 X186.254 Y107.62 E1.96957
G1 X186.254 Y108.267 E.0241
G1 X148.233 Y70.246 E2.00365
G1 X147.586 Y70.246 E.0241
G1 X186.254 Y108.914 E2.03773
G1 X186.254 Y109.561 E.0241
G1 X146.939 Y70.246 E2.07181
G1 X146.293 Y70.246 E.0241
G1 X186.254 Y110.207 E2.10589
M73 P16 R44
G1 X186.254 Y110.854 E.0241
G1 X145.646 Y70.246 E2.13997
G1 X144.999 Y70.246 E.0241
G1 X186.254 Y111.501 E2.17405
G1 X186.254 Y112.147 E.0241
G1 X144.353 Y70.246 E2.20813
G1 X143.706 Y70.246 E.0241
G1 X186.254 Y112.794 E2.24221
G1 X186.254 Y113.441 E.0241
G1 X143.059 Y70.246 E2.27629
G1 X142.413 Y70.246 E.0241
G1 X186.254 Y114.087 E2.31037
G1 X186.254 Y114.734 E.0241
G1 X141.766 Y70.246 E2.34445
G1 X141.119 Y70.246 E.0241
G1 X186.254 Y115.381 E2.37853
G1 X186.254 Y116.028 E.0241
G1 X140.472 Y70.246 E2.41261
G1 X139.826 Y70.246 E.0241
G1 X186.254 Y116.674 E2.44668
G1 X186.254 Y117.321 E.0241
G1 X139.179 Y70.246 E2.48076
G1 X138.532 Y70.246 E.0241
G1 X186.254 Y117.968 E2.51484
G1 X186.254 Y118.614 E.0241
G1 X137.886 Y70.246 E2.54892
G1 X137.239 Y70.246 E.0241
G1 X186.254 Y119.261 E2.583
G1 X186.254 Y119.908 E.0241
G1 X136.592 Y70.246 E2.61708
G1 X135.946 Y70.246 E.0241
G1 X186.254 Y120.554 E2.65116
G1 X186.254 Y121.201 E.0241
G1 X135.299 Y70.246 E2.68524
G1 X134.652 Y70.246 E.0241
G1 X186.254 Y121.848 E2.71932
G1 X186.254 Y122.495 E.0241
G1 X134.005 Y70.246 E2.7534
G1 X133.359 Y70.246 E.0241
G1 X186.254 Y123.141 E2.78748
G1 X186.254 Y123.788 E.0241
G1 X132.712 Y70.246 E2.82156
G1 X132.065 Y70.246 E.0241
G1 X186.254 Y124.435 E2.85564
G1 X186.254 Y125.081 E.0241
G1 X131.419 Y70.246 E2.88972
G1 X130.772 Y70.246 E.0241
G1 X186.254 Y125.728 E2.9238
G1 X186.254 Y126.375 E.0241
G1 X130.125 Y70.246 E2.95788
G1 X129.479 Y70.246 E.0241
G1 X186.254 Y127.021 E2.99196
G1 X186.254 Y127.668 E.0241
G1 X128.832 Y70.246 E3.02604
G1 X128.185 Y70.246 E.0241
G1 X186.254 Y128.315 E3.06012
G1 X186.254 Y128.962 E.0241
G1 X127.538 Y70.246 E3.0942
G1 X126.892 Y70.246 E.0241
G1 X186.254 Y129.608 E3.12828
G1 X186.254 Y130.255 E.0241
G1 X126.245 Y70.246 E3.16236
G1 X125.598 Y70.246 E.0241
G1 X186.254 Y130.902 E3.19643
G1 X186.254 Y131.548 E.0241
G1 X124.952 Y70.246 E3.23051
G1 X124.305 Y70.246 E.0241
G1 X186.254 Y132.195 E3.26459
G1 X186.254 Y132.842 E.0241
G1 X123.658 Y70.246 E3.29867
G1 X123.012 Y70.246 E.0241
G1 X186.254 Y133.488 E3.33275
G1 X186.254 Y134.135 E.0241
G1 X122.365 Y70.246 E3.36683
G1 X121.718 Y70.246 E.0241
G1 X186.254 Y134.782 E3.40091
G1 X186.254 Y135.428 E.0241
G1 X121.072 Y70.246 E3.43499
G1 X120.425 Y70.246 E.0241
G1 X186.254 Y136.075 E3.46907
G1 X186.254 Y136.722 E.0241
G1 X119.778 Y70.246 E3.50315
G1 X119.131 Y70.246 E.0241
G1 X186.254 Y137.369 E3.53723
G1 X186.254 Y138.015 E.0241
G1 X118.485 Y70.246 E3.57131
G1 X117.838 Y70.246 E.0241
G1 X186.254 Y138.662 E3.60539
G1 X186.254 Y139.309 E.0241
G1 X117.191 Y70.246 E3.63947
M73 P17 R44
G1 X116.545 Y70.246 E.0241
G1 X186.254 Y139.955 E3.67355
G1 X186.254 Y140.602 E.0241
G1 X115.898 Y70.246 E3.70763
G1 X115.251 Y70.246 E.0241
G1 X186.254 Y141.249 E3.74171
G1 X186.254 Y141.895 E.0241
G1 X114.605 Y70.246 E3.77579
G1 X113.958 Y70.246 E.0241
G1 X186.254 Y142.542 E3.80987
G1 X186.254 Y143.189 E.0241
G1 X113.311 Y70.246 E3.84395
G1 X112.664 Y70.246 E.0241
G1 X186.254 Y143.836 E3.87803
G1 X186.254 Y144.482 E.0241
G1 X112.018 Y70.246 E3.91211
G1 X111.371 Y70.246 E.0241
G1 X128.88 Y87.754 E.92268
G1 X128.233 Y87.754 E.0241
G1 X110.724 Y70.246 E.92268
G1 X110.078 Y70.246 E.0241
G1 X127.586 Y87.754 E.92268
G1 X126.94 Y87.754 E.0241
G1 X109.431 Y70.246 E.92268
G1 X108.784 Y70.246 E.0241
G1 X126.293 Y87.754 E.92268
G1 X125.646 Y87.754 E.0241
G1 X108.138 Y70.246 E.92268
G1 X107.491 Y70.246 E.0241
G1 X125 Y87.754 E.92268
G1 X124.353 Y87.754 E.0241
G1 X106.844 Y70.246 E.92268
G1 X106.197 Y70.246 E.0241
G1 X123.706 Y87.754 E.92268
G1 X123.06 Y87.754 E.0241
G1 X105.551 Y70.246 E.92268
G1 X104.904 Y70.246 E.0241
G1 X122.413 Y87.754 E.92268
G1 X121.766 Y87.754 E.0241
G1 X104.257 Y70.246 E.92268
G1 X103.611 Y70.246 E.0241
G1 X121.119 Y87.754 E.92268
G1 X120.473 Y87.754 E.0241
G1 X102.964 Y70.246 E.92268
G1 X102.317 Y70.246 E.0241
G1 X119.826 Y87.754 E.92268
G1 X119.179 Y87.754 E.0241
G1 X101.671 Y70.246 E.92268
M73 P17 R43
G1 X101.024 Y70.246 E.0241
G1 X118.533 Y87.754 E.92268
G1 X117.886 Y87.754 E.0241
G1 X100.377 Y70.246 E.92268
G1 X99.73 Y70.246 E.0241
G1 X117.239 Y87.754 E.92268
G1 X116.593 Y87.754 E.0241
G1 X99.084 Y70.246 E.92268
G1 X98.437 Y70.246 E.0241
G1 X115.946 Y87.754 E.92268
G1 X115.299 Y87.754 E.0241
G1 X97.79 Y70.246 E.92268
M73 P18 R43
G1 X97.144 Y70.246 E.0241
G1 X114.652 Y87.754 E.92268
G1 X114.006 Y87.754 E.0241
G1 X96.497 Y70.246 E.92268
G1 X95.85 Y70.246 E.0241
G1 X113.359 Y87.754 E.92268
G1 X112.712 Y87.754 E.0241
G1 X95.204 Y70.246 E.92268
G1 X94.557 Y70.246 E.0241
G1 X112.066 Y87.754 E.92268
G1 X111.419 Y87.754 E.0241
G1 X93.91 Y70.246 E.92268
G1 X93.263 Y70.246 E.0241
G1 X110.772 Y87.754 E.92268
G1 X110.126 Y87.754 E.0241
G1 X92.617 Y70.246 E.92268
G1 X91.97 Y70.246 E.0241
G1 X109.479 Y87.754 E.92268
G1 X108.832 Y87.754 E.0241
G1 X91.323 Y70.246 E.92268
G1 X90.677 Y70.246 E.0241
G1 X108.186 Y87.754 E.92268
G1 X107.539 Y87.754 E.0241
G1 X90.03 Y70.246 E.92268
G1 X89.383 Y70.246 E.0241
G1 X106.892 Y87.754 E.92268
G1 X106.245 Y87.754 E.0241
G1 X88.737 Y70.246 E.92268
G1 X88.09 Y70.246 E.0241
G1 X105.599 Y87.754 E.92268
G1 X104.952 Y87.754 E.0241
G1 X87.443 Y70.246 E.92268
G1 X86.796 Y70.246 E.0241
G1 X104.305 Y87.754 E.92268
G1 X103.659 Y87.754 E.0241
G1 X86.15 Y70.246 E.92268
G1 X85.503 Y70.246 E.0241
G1 X103.012 Y87.754 E.92268
G1 X102.365 Y87.754 E.0241
G1 X84.856 Y70.246 E.92268
G1 X84.21 Y70.246 E.0241
G1 X101.719 Y87.754 E.92268
G1 X101.072 Y87.754 E.0241
G1 X83.563 Y70.246 E.92268
G1 X82.916 Y70.246 E.0241
G1 X100.425 Y87.754 E.92268
G1 X99.778 Y87.754 E.0241
G1 X82.27 Y70.246 E.92268
G1 X81.623 Y70.246 E.0241
G1 X99.132 Y87.754 E.92268
G1 X98.485 Y87.754 E.0241
G1 X80.976 Y70.246 E.92268
G1 X80.329 Y70.246 E.0241
G1 X97.838 Y87.754 E.92268
G1 X97.192 Y87.754 E.0241
G1 X79.683 Y70.246 E.92268
G1 X79.036 Y70.246 E.0241
G1 X96.545 Y87.754 E.92268
G1 X95.898 Y87.754 E.0241
G1 X78.389 Y70.246 E.92268
G1 X77.743 Y70.246 E.0241
G1 X95.252 Y87.754 E.92268
G1 X94.605 Y87.754 E.0241
G1 X77.096 Y70.246 E.92268
G1 X76.449 Y70.246 E.0241
G1 X93.958 Y87.754 E.92268
G1 X93.311 Y87.754 E.0241
G1 X75.803 Y70.246 E.92268
G1 X75.156 Y70.246 E.0241
G1 X92.665 Y87.754 E.92268
G1 X92.018 Y87.754 E.0241
G1 X74.509 Y70.246 E.92268
G1 X73.863 Y70.246 E.0241
G1 X91.371 Y87.754 E.92268
G1 X90.725 Y87.754 E.0241
G1 X73.746 Y70.775 E.89476
G1 X73.746 Y71.422 E.0241
G1 X90.078 Y87.754 E.86068
G1 X89.431 Y87.754 E.0241
G1 X73.746 Y72.069 E.8266
G1 X73.746 Y72.715 E.0241
G1 X88.785 Y87.754 E.79252
G1 X88.138 Y87.754 E.0241
G1 X73.746 Y73.362 E.75844
G1 X73.746 Y74.009 E.0241
G1 X87.491 Y87.754 E.72436
G1 X86.844 Y87.754 E.0241
G1 X73.746 Y74.656 E.69028
G1 X73.746 Y75.302 E.0241
G1 X86.198 Y87.754 E.6562
G1 X85.551 Y87.754 E.0241
G1 X73.746 Y75.949 E.62212
G1 X73.746 Y76.596 E.0241
G1 X84.904 Y87.754 E.58804
G1 X84.258 Y87.754 E.0241
G1 X73.746 Y77.242 E.55396
G1 X73.746 Y77.889 E.0241
G1 X83.611 Y87.754 E.51988
G1 X82.964 Y87.754 E.0241
G1 X73.746 Y78.536 E.4858
G1 X73.746 Y79.182 E.0241
G1 X82.318 Y87.754 E.45172
G1 X81.671 Y87.754 E.0241
G1 X73.746 Y79.829 E.41764
G1 X73.746 Y80.476 E.0241
G1 X81.024 Y87.754 E.38356
G1 X80.377 Y87.754 E.0241
G1 X73.746 Y81.123 E.34948
G1 X73.746 Y81.769 E.0241
G1 X79.731 Y87.754 E.31541
G1 X79.084 Y87.754 E.0241
G1 X73.746 Y82.416 E.28133
G1 X73.746 Y83.063 E.0241
G1 X78.437 Y87.754 E.24725
G1 X78.254 Y87.754 E.00682
G1 X78.254 Y88.218 E.01728
G1 X73.746 Y83.709 E.23761
G1 X73.746 Y84.356 E.0241
G1 X78.254 Y88.865 E.23761
G1 X78.254 Y89.512 E.0241
G1 X73.746 Y85.003 E.23761
G1 X73.746 Y85.649 E.0241
G1 X78.254 Y90.158 E.23761
G1 X78.254 Y90.805 E.0241
G1 X73.746 Y86.296 E.23761
G1 X73.746 Y86.943 E.0241
G1 X78.254 Y91.452 E.23761
G1 X78.254 Y92.098 E.0241
G1 X73.746 Y87.59 E.23761
G1 X73.746 Y88.236 E.0241
G1 X78.254 Y92.745 E.23761
G1 X78.254 Y93.392 E.0241
M73 P19 R43
G1 X73.746 Y88.883 E.23761
G1 X73.746 Y89.53 E.0241
G1 X78.254 Y94.038 E.23761
G1 X78.254 Y94.685 E.0241
G1 X73.746 Y90.176 E.23761
G1 X73.746 Y90.823 E.0241
G1 X78.254 Y95.332 E.23761
G1 X78.254 Y95.979 E.0241
G1 X73.746 Y91.47 E.23761
G1 X73.746 Y92.116 E.0241
G1 X78.254 Y96.625 E.23761
G1 X78.254 Y97.272 E.0241
G1 X73.746 Y92.763 E.23761
G1 X73.746 Y93.41 E.0241
G1 X78.254 Y97.919 E.23761
G1 X78.254 Y98.565 E.0241
G1 X73.746 Y94.057 E.23761
G1 X73.746 Y94.703 E.0241
G1 X78.254 Y99.212 E.23761
G1 X78.254 Y99.859 E.0241
G1 X73.746 Y95.35 E.23761
G1 X73.746 Y95.997 E.0241
G1 X78.254 Y100.505 E.23761
G1 X78.254 Y101.152 E.0241
G1 X73.746 Y96.643 E.23761
G1 X73.746 Y97.29 E.0241
G1 X78.254 Y101.799 E.23761
G1 X78.254 Y102.446 E.0241
G1 X73.746 Y97.937 E.23761
G1 X73.746 Y98.583 E.0241
G1 X78.254 Y103.092 E.23761
G1 X78.254 Y103.739 E.0241
G1 X73.746 Y99.23 E.23761
G1 X73.746 Y99.877 E.0241
G1 X78.254 Y104.386 E.23761
G1 X78.254 Y105.032 E.0241
G1 X73.746 Y100.523 E.23761
G1 X73.746 Y101.17 E.0241
G1 X78.254 Y105.679 E.23761
G1 X78.254 Y106.326 E.0241
G1 X73.746 Y101.817 E.23761
G1 X73.746 Y102.464 E.0241
G1 X78.254 Y106.972 E.23761
G1 X78.254 Y107.619 E.0241
G1 X73.746 Y103.11 E.23761
G1 X73.746 Y103.757 E.0241
G1 X78.254 Y108.266 E.23761
G1 X78.254 Y108.913 E.0241
G1 X73.746 Y104.404 E.23761
G1 X73.746 Y105.05 E.0241
G1 X78.254 Y109.559 E.23761
G1 X78.254 Y110.206 E.0241
G1 X73.746 Y105.697 E.23761
G1 X73.746 Y106.344 E.0241
G1 X78.254 Y110.853 E.23761
G1 X78.254 Y111.499 E.0241
G1 X73.746 Y106.99 E.23761
G1 X73.746 Y107.637 E.0241
G1 X78.254 Y112.146 E.23761
G1 X78.254 Y112.793 E.0241
G1 X73.746 Y108.284 E.23761
G1 X73.746 Y108.931 E.0241
G1 X78.254 Y113.439 E.23761
G1 X78.254 Y114.086 E.0241
G1 X73.746 Y109.577 E.23761
G1 X73.746 Y110.224 E.0241
G1 X78.254 Y114.733 E.23761
G1 X78.254 Y115.38 E.0241
G1 X73.746 Y110.871 E.23761
G1 X73.746 Y111.517 E.0241
G1 X78.254 Y116.026 E.23761
G1 X78.254 Y116.673 E.0241
G1 X73.746 Y112.164 E.23761
G1 X73.746 Y112.811 E.0241
G1 X78.254 Y117.32 E.23761
G1 X78.254 Y117.966 E.0241
G1 X73.746 Y113.457 E.23761
G1 X73.746 Y114.104 E.0241
G1 X78.254 Y118.613 E.23761
G1 X78.254 Y119.26 E.0241
G1 X73.746 Y114.751 E.23761
G1 X73.746 Y115.398 E.0241
G1 X78.254 Y119.906 E.23761
G1 X78.254 Y120.553 E.0241
G1 X73.746 Y116.044 E.23761
G1 X73.746 Y116.691 E.0241
G1 X78.254 Y121.2 E.23761
G1 X78.254 Y121.846 E.0241
G1 X73.746 Y117.338 E.23761
G1 X73.746 Y117.984 E.0241
G1 X78.254 Y122.493 E.23761
G1 X78.254 Y123.14 E.0241
G1 X73.746 Y118.631 E.23761
G1 X73.746 Y119.278 E.0241
G1 X78.254 Y123.787 E.23761
G1 X78.254 Y124.433 E.0241
G1 X73.746 Y119.924 E.23761
G1 X73.746 Y120.571 E.0241
G1 X78.254 Y125.08 E.23761
G1 X78.254 Y125.727 E.0241
G1 X73.746 Y121.218 E.23761
G1 X73.746 Y121.865 E.0241
G1 X78.254 Y126.373 E.23761
G1 X78.254 Y127.02 E.0241
G1 X73.746 Y122.511 E.23761
G1 X73.746 Y123.158 E.0241
G1 X78.254 Y127.667 E.23761
G1 X78.254 Y128.313 E.0241
G1 X73.746 Y123.805 E.23761
G1 X73.746 Y124.451 E.0241
G1 X78.254 Y128.96 E.23761
G1 X78.254 Y129.607 E.0241
G1 X73.746 Y125.098 E.23761
G1 X73.746 Y125.745 E.0241
G1 X78.254 Y130.254 E.23761
G1 X78.254 Y130.9 E.0241
G1 X73.746 Y126.391 E.23761
G1 X73.746 Y127.038 E.0241
G1 X78.254 Y131.547 E.23761
G1 X78.254 Y132.194 E.0241
G1 X73.746 Y127.685 E.23761
G1 X73.746 Y128.332 E.0241
G1 X78.254 Y132.84 E.23761
G1 X78.254 Y133.487 E.0241
G1 X73.746 Y128.978 E.2376
G1 X73.746 Y129.625 E.0241
G1 X78.254 Y134.134 E.23761
G1 X78.254 Y134.78 E.0241
G1 X73.746 Y130.272 E.23761
G1 X73.746 Y130.918 E.0241
G1 X78.254 Y135.427 E.2376
G1 X78.254 Y136.074 E.0241
G1 X73.746 Y131.565 E.23761
G1 X73.746 Y132.212 E.0241
G1 X78.254 Y136.721 E.23761
G1 X78.254 Y137.367 E.0241
G1 X73.746 Y132.858 E.2376
G1 X73.746 Y133.505 E.0241
G1 X78.254 Y138.014 E.23761
G1 X78.254 Y138.661 E.0241
G1 X73.746 Y134.152 E.23761
G1 X73.746 Y134.799 E.0241
G1 X78.254 Y139.307 E.23761
G1 X78.254 Y139.954 E.0241
G1 X73.746 Y135.445 E.23761
G1 X73.746 Y136.092 E.0241
G1 X78.254 Y140.601 E.23761
G1 X78.254 Y141.247 E.0241
G1 X73.746 Y136.739 E.23761
G1 X73.746 Y137.385 E.0241
G1 X78.254 Y141.894 E.23761
G1 X78.254 Y142.541 E.0241
G1 X73.746 Y138.032 E.23761
G1 X73.746 Y138.679 E.0241
G1 X78.254 Y143.188 E.23761
G1 X78.254 Y143.834 E.0241
G1 X73.746 Y139.325 E.23761
G1 X73.746 Y139.972 E.0241
G1 X78.254 Y144.481 E.2376
G1 X78.254 Y145.128 E.0241
G1 X73.746 Y140.619 E.23761
G1 X73.746 Y141.266 E.0241
G1 X78.254 Y145.774 E.23761
G1 X78.254 Y146.421 E.0241
G1 X73.746 Y141.912 E.2376
M73 P19 R42
G1 X73.746 Y142.559 E.0241
G1 X78.254 Y147.068 E.23761
G1 X78.254 Y147.714 E.0241
G1 X73.746 Y143.206 E.23761
G1 X73.746 Y143.852 E.0241
G1 X78.254 Y148.361 E.2376
G1 X78.254 Y149.008 E.0241
G1 X73.746 Y144.499 E.23761
G1 X73.746 Y145.146 E.0241
G1 X78.254 Y149.655 E.23761
G1 X78.254 Y150.301 E.0241
G1 X73.746 Y145.792 E.2376
G1 X73.746 Y146.439 E.0241
G1 X78.254 Y150.948 E.23761
G1 X78.254 Y151.595 E.0241
G1 X73.746 Y147.086 E.23761
G1 X73.746 Y147.732 E.0241
G1 X78.254 Y152.241 E.23761
G1 X78.254 Y152.888 E.0241
G1 X73.746 Y148.379 E.23761
G1 X73.746 Y149.026 E.0241
G1 X78.254 Y153.535 E.23761
G1 X78.254 Y154.181 E.0241
G1 X73.746 Y149.673 E.23761
G1 X73.746 Y150.319 E.0241
G1 X78.254 Y154.828 E.23761
G1 X78.254 Y155.475 E.0241
G1 X73.746 Y150.966 E.23761
G1 X73.746 Y151.613 E.0241
G1 X78.254 Y156.122 E.23761
G1 X78.254 Y156.768 E.0241
G1 X73.746 Y152.259 E.23761
G1 X73.746 Y152.906 E.0241
G1 X78.254 Y157.415 E.2376
G1 X78.254 Y158.062 E.0241
G1 X73.746 Y153.553 E.23761
G1 X73.746 Y154.199 E.0241
G1 X78.254 Y158.708 E.23761
G1 X78.254 Y159.355 E.0241
G1 X73.746 Y154.846 E.2376
G1 X73.746 Y155.493 E.0241
G1 X78.254 Y160.002 E.23761
G1 X78.254 Y160.648 E.0241
G1 X73.746 Y156.14 E.23761
G1 X73.746 Y156.786 E.0241
G1 X78.254 Y161.295 E.2376
G1 X78.254 Y161.942 E.0241
G1 X73.746 Y157.433 E.23761
G1 X73.746 Y158.08 E.0241
G1 X78.254 Y162.589 E.23761
G1 X78.254 Y163.235 E.0241
G1 X73.746 Y158.726 E.23761
G1 X73.746 Y159.373 E.0241
G1 X78.254 Y163.882 E.23761
G1 X78.254 Y164.529 E.0241
G1 X73.746 Y160.02 E.23761
G1 X73.746 Y160.666 E.0241
G1 X78.254 Y165.175 E.23761
G1 X78.254 Y165.822 E.0241
G1 X73.746 Y161.313 E.23761
G1 X73.746 Y161.96 E.0241
G1 X78.254 Y166.469 E.23761
G1 X78.254 Y167.115 E.0241
G1 X73.746 Y162.607 E.23761
G1 X73.746 Y163.253 E.0241
G1 X78.254 Y167.762 E.23761
G1 X78.254 Y168.409 E.0241
G1 X73.746 Y163.9 E.2376
G1 X73.746 Y164.547 E.0241
G1 X78.46 Y169.261 E.24844
; WIPE_START
G1 F24000
G1 X77.046 Y167.847 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.015 J.671 P1  F30000
G1 X129.54 Y88.414 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X186.254 Y145.129 E2.98873
G1 X186.254 Y145.776 E.0241
G1 X129.746 Y89.267 E2.97789
G1 X129.746 Y89.914 E.0241
G1 X186.254 Y146.422 E2.97789
G1 X186.254 Y147.069 E.0241
G1 X129.746 Y90.56 E2.97789
G1 X129.746 Y91.207 E.0241
G1 X186.254 Y147.716 E2.97789
G1 X186.254 Y148.362 E.0241
G1 X129.746 Y91.854 E2.97789
G1 X129.746 Y92.5 E.0241
G1 X186.254 Y149.009 E2.97789
G1 X186.254 Y149.656 E.0241
G1 X129.746 Y93.147 E2.97789
G1 X129.746 Y93.794 E.0241
G1 X186.254 Y150.303 E2.97789
G1 X186.254 Y150.949 E.0241
G1 X129.746 Y94.44 E2.97789
G1 X129.746 Y95.087 E.0241
G1 X186.254 Y151.596 E2.97789
G1 X186.254 Y152.243 E.0241
G1 X129.746 Y95.734 E2.97789
M73 P20 R42
G1 X129.746 Y96.381 E.0241
G1 X186.254 Y152.889 E2.97789
G1 X186.254 Y153.536 E.0241
G1 X129.746 Y97.027 E2.97789
G1 X129.746 Y97.674 E.0241
G1 X186.254 Y154.183 E2.97789
G1 X186.254 Y154.829 E.0241
G1 X129.746 Y98.321 E2.97789
G1 X129.746 Y98.967 E.0241
G1 X186.254 Y155.476 E2.97789
G1 X186.254 Y156.123 E.0241
G1 X129.746 Y99.614 E2.97789
G1 X129.746 Y100.261 E.0241
G1 X186.254 Y156.77 E2.97789
G1 X186.254 Y157.416 E.0241
G1 X129.746 Y100.907 E2.97789
G1 X129.746 Y101.554 E.0241
G1 X186.254 Y158.063 E2.97789
G1 X186.254 Y158.71 E.0241
G1 X129.746 Y102.201 E2.97789
G1 X129.746 Y102.848 E.0241
G1 X186.254 Y159.356 E2.97789
G1 X186.254 Y160.003 E.0241
G1 X129.746 Y103.494 E2.97789
G1 X129.746 Y104.141 E.0241
G1 X186.254 Y160.65 E2.97789
G1 X186.254 Y161.296 E.0241
G1 X129.746 Y104.788 E2.97789
G1 X129.746 Y105.434 E.0241
G1 X186.254 Y161.943 E2.97789
G1 X186.254 Y162.59 E.0241
G1 X129.746 Y106.081 E2.97789
G1 X129.746 Y106.728 E.0241
G1 X186.254 Y163.237 E2.97789
G1 X186.254 Y163.883 E.0241
G1 X129.746 Y107.374 E2.97789
G1 X129.746 Y108.021 E.0241
G1 X186.254 Y164.53 E2.97789
G1 X186.254 Y165.177 E.0241
G1 X129.746 Y108.668 E2.97789
G1 X129.746 Y109.314 E.0241
G1 X186.254 Y165.823 E2.97789
G1 X186.254 Y166.47 E.0241
G1 X129.746 Y109.961 E2.97789
G1 X129.746 Y110.608 E.0241
G1 X186.254 Y167.117 E2.97789
G1 X186.254 Y167.763 E.0241
G1 X129.746 Y111.255 E2.97789
G1 X129.746 Y111.901 E.0241
G1 X186.254 Y168.41 E2.97789
G1 X186.254 Y169.057 E.0241
G1 X129.746 Y112.548 E2.97789
G1 X129.746 Y113.195 E.0241
G1 X186.254 Y169.704 E2.97789
G1 X186.254 Y170.35 E.0241
G1 X129.746 Y113.841 E2.97789
G1 X129.746 Y114.488 E.0241
G1 X186.254 Y170.997 E2.97789
G1 X186.254 Y171.644 E.0241
G1 X129.746 Y115.135 E2.97789
G1 X129.746 Y115.781 E.0241
G1 X186.254 Y172.29 E2.97789
G1 X186.254 Y172.937 E.0241
G1 X129.746 Y116.428 E2.97789
G1 X129.746 Y117.075 E.0241
G1 X186.254 Y173.584 E2.97789
G1 X186.254 Y174.23 E.0241
G1 X129.746 Y117.722 E2.97789
G1 X129.746 Y118.368 E.0241
G1 X186.254 Y174.877 E2.97789
G1 X186.254 Y175.524 E.0241
G1 X129.746 Y119.015 E2.97789
G1 X129.746 Y119.662 E.0241
G1 X186.254 Y176.171 E2.97789
G1 X186.254 Y176.817 E.0241
G1 X129.746 Y120.308 E2.97789
G1 X129.746 Y120.955 E.0241
G1 X186.254 Y177.464 E2.97789
G1 X186.254 Y178.111 E.0241
G1 X129.746 Y121.602 E2.97789
G1 X129.746 Y122.248 E.0241
G1 X186.254 Y178.757 E2.97789
G1 X186.254 Y179.404 E.0241
G1 X129.746 Y122.895 E2.97789
G1 X129.746 Y123.542 E.0241
G1 X186.254 Y180.051 E2.97789
G1 X186.254 Y180.697 E.0241
G1 X129.746 Y124.189 E2.97789
M73 P21 R42
G1 X129.746 Y124.835 E.0241
G1 X186.254 Y181.344 E2.97789
G1 X186.254 Y181.991 E.0241
G1 X129.746 Y125.482 E2.97789
G1 X129.746 Y126.129 E.0241
G1 X186.254 Y182.637 E2.97789
G1 X186.254 Y183.284 E.0241
G1 X129.746 Y126.775 E2.97789
G1 X129.746 Y127.422 E.0241
G1 X186.254 Y183.931 E2.97789
G1 X186.254 Y184.578 E.0241
G1 X129.746 Y128.069 E2.97789
G1 X129.746 Y128.715 E.0241
G1 X186.254 Y185.224 E2.97789
G1 X186.254 Y185.754 E.01975
G1 X186.138 Y185.754 E.00434
G1 X129.746 Y129.362 E2.97175
G1 X129.746 Y130.009 E.0241
G1 X185.491 Y185.754 E2.93767
G1 X184.844 Y185.754 E.0241
G1 X129.746 Y130.656 E2.90359
G1 X129.746 Y131.302 E.0241
G1 X184.198 Y185.754 E2.86951
G1 X183.551 Y185.754 E.0241
G1 X129.746 Y131.949 E2.83543
G1 X129.746 Y132.596 E.0241
G1 X182.904 Y185.754 E2.80135
G1 X182.258 Y185.754 E.0241
G1 X129.746 Y133.242 E2.76727
G1 X129.746 Y133.889 E.0241
G1 X181.611 Y185.754 E2.73319
G1 X180.964 Y185.754 E.0241
G1 X129.746 Y134.536 E2.69911
G1 X129.746 Y135.182 E.0241
M73 P21 R41
G1 X180.318 Y185.754 E2.66503
G1 X179.671 Y185.754 E.0241
G1 X129.746 Y135.829 E2.63095
G1 X129.746 Y136.476 E.0241
G1 X179.024 Y185.754 E2.59687
G1 X178.377 Y185.754 E.0241
G1 X129.746 Y137.123 E2.56279
G1 X129.746 Y137.769 E.0241
G1 X177.731 Y185.754 E2.52871
G1 X177.084 Y185.754 E.0241
G1 X129.746 Y138.416 E2.49463
G1 X129.746 Y139.063 E.0241
G1 X176.437 Y185.754 E2.46055
G1 X175.791 Y185.754 E.0241
G1 X129.746 Y139.709 E2.42647
G1 X129.746 Y140.356 E.0241
G1 X175.144 Y185.754 E2.39239
G1 X174.497 Y185.754 E.0241
G1 X129.746 Y141.003 E2.35831
G1 X129.746 Y141.649 E.0241
G1 X173.851 Y185.754 E2.32423
G1 X173.204 Y185.754 E.0241
G1 X129.746 Y142.296 E2.29015
G1 X129.746 Y142.943 E.0241
G1 X172.557 Y185.754 E2.25607
G1 X171.91 Y185.754 E.0241
G1 X129.746 Y143.59 E2.22199
G1 X129.746 Y144.236 E.0241
G1 X171.264 Y185.754 E2.18792
G1 X170.617 Y185.754 E.0241
G1 X129.746 Y144.883 E2.15384
G1 X129.746 Y145.53 E.0241
M73 P22 R41
G1 X169.97 Y185.754 E2.11976
G1 X169.324 Y185.754 E.0241
G1 X129.746 Y146.176 E2.08568
G1 X129.746 Y146.823 E.0241
G1 X168.677 Y185.754 E2.0516
G1 X168.03 Y185.754 E.0241
G1 X129.746 Y147.47 E2.01752
G1 X129.746 Y148.116 E.0241
G1 X167.384 Y185.754 E1.98344
G1 X166.737 Y185.754 E.0241
G1 X129.746 Y148.763 E1.94936
G1 X129.746 Y149.41 E.0241
G1 X166.09 Y185.754 E1.91528
G1 X165.443 Y185.754 E.0241
G1 X129.746 Y150.057 E1.8812
G1 X129.746 Y150.703 E.0241
G1 X164.797 Y185.754 E1.84712
G1 X164.15 Y185.754 E.0241
G1 X129.746 Y151.35 E1.81304
G1 X129.746 Y151.997 E.0241
G1 X163.503 Y185.754 E1.77896
G1 X162.857 Y185.754 E.0241
G1 X129.746 Y152.643 E1.74488
G1 X129.746 Y153.29 E.0241
G1 X162.21 Y185.754 E1.7108
G1 X161.563 Y185.754 E.0241
G1 X129.746 Y153.937 E1.67672
G1 X129.746 Y154.583 E.0241
G1 X160.917 Y185.754 E1.64264
G1 X160.27 Y185.754 E.0241
G1 X129.746 Y155.23 E1.60856
G1 X129.746 Y155.877 E.0241
G1 X159.623 Y185.754 E1.57448
G1 X158.977 Y185.754 E.0241
G1 X129.746 Y156.523 E1.5404
G1 X129.746 Y157.17 E.0241
G1 X158.33 Y185.754 E1.50632
G1 X157.683 Y185.754 E.0241
G1 X129.746 Y157.817 E1.47224
G1 X129.746 Y158.464 E.0241
G1 X157.036 Y185.754 E1.43816
G1 X156.39 Y185.754 E.0241
G1 X129.746 Y159.11 E1.40409
G1 X129.746 Y159.757 E.0241
G1 X155.743 Y185.754 E1.37001
G1 X155.096 Y185.754 E.0241
G1 X129.746 Y160.404 E1.33593
G1 X129.746 Y161.05 E.0241
G1 X154.45 Y185.754 E1.30185
G1 X153.803 Y185.754 E.0241
G1 X129.746 Y161.697 E1.26777
G1 X129.746 Y162.344 E.0241
G1 X153.156 Y185.754 E1.23369
G1 X152.51 Y185.754 E.0241
G1 X129.746 Y162.99 E1.19961
G1 X129.746 Y163.637 E.0241
G1 X151.863 Y185.754 E1.16553
G1 X151.216 Y185.754 E.0241
G1 X129.746 Y164.284 E1.13145
G1 X129.746 Y164.931 E.0241
G1 X150.569 Y185.754 E1.09737
G1 X149.923 Y185.754 E.0241
G1 X129.746 Y165.577 E1.06329
G1 X129.746 Y166.224 E.0241
G1 X149.276 Y185.754 E1.02921
G1 X148.629 Y185.754 E.0241
G1 X129.746 Y166.871 E.99513
G1 X129.746 Y167.517 E.0241
G1 X147.983 Y185.754 E.96105
G1 X147.336 Y185.754 E.0241
G1 X129.746 Y168.164 E.92697
G1 X129.746 Y168.811 E.0241
G1 X146.689 Y185.754 E.89289
G1 X146.043 Y185.754 E.0241
G1 X129.746 Y169.457 E.85881
G1 X129.746 Y170.104 E.0241
G1 X145.396 Y185.754 E.82473
G1 X144.749 Y185.754 E.0241
G1 X129.24 Y170.246 E.81728
M73 P23 R41
G1 X128.594 Y170.246 E.0241
G1 X144.102 Y185.754 E.81728
G1 X143.456 Y185.754 E.0241
G1 X127.947 Y170.246 E.81728
G1 X127.3 Y170.246 E.0241
G1 X142.809 Y185.754 E.81728
G1 X142.162 Y185.754 E.0241
G1 X126.654 Y170.246 E.81728
G1 X126.007 Y170.246 E.0241
G1 X141.516 Y185.754 E.81728
G1 X140.869 Y185.754 E.0241
G1 X125.36 Y170.246 E.81728
G1 X124.713 Y170.246 E.0241
G1 X140.222 Y185.754 E.81728
G1 X139.576 Y185.754 E.0241
G1 X124.067 Y170.246 E.81728
G1 X123.42 Y170.246 E.0241
G1 X138.929 Y185.754 E.81728
G1 X138.282 Y185.754 E.0241
G1 X122.773 Y170.246 E.81728
G1 X122.127 Y170.246 E.0241
G1 X137.635 Y185.754 E.81728
G1 X136.989 Y185.754 E.0241
G1 X121.48 Y170.246 E.81728
G1 X120.833 Y170.246 E.0241
G1 X136.342 Y185.754 E.81728
G1 X135.695 Y185.754 E.0241
G1 X120.187 Y170.246 E.81728
G1 X119.54 Y170.246 E.0241
G1 X135.049 Y185.754 E.81728
G1 X134.402 Y185.754 E.0241
G1 X118.893 Y170.246 E.81728
G1 X118.246 Y170.246 E.0241
G1 X133.755 Y185.754 E.81728
G1 X133.109 Y185.754 E.0241
G1 X117.6 Y170.246 E.81728
G1 X116.953 Y170.246 E.0241
G1 X132.462 Y185.754 E.81728
G1 X131.815 Y185.754 E.0241
G1 X116.306 Y170.246 E.81728
G1 X115.66 Y170.246 E.0241
G1 X131.168 Y185.754 E.81728
G1 X130.522 Y185.754 E.0241
G1 X115.013 Y170.246 E.81728
G1 X114.366 Y170.246 E.0241
G1 X129.875 Y185.754 E.81728
M73 P23 R40
G1 X129.228 Y185.754 E.0241
G1 X113.72 Y170.246 E.81728
G1 X113.073 Y170.246 E.0241
G1 X128.582 Y185.754 E.81728
G1 X127.935 Y185.754 E.0241
G1 X112.426 Y170.246 E.81728
G1 X111.779 Y170.246 E.0241
G1 X127.288 Y185.754 E.81728
G1 X126.642 Y185.754 E.0241
G1 X111.133 Y170.246 E.81728
G1 X110.486 Y170.246 E.0241
G1 X125.995 Y185.754 E.81728
G1 X125.348 Y185.754 E.0241
G1 X109.839 Y170.246 E.81728
G1 X109.193 Y170.246 E.0241
G1 X124.701 Y185.754 E.81728
G1 X124.055 Y185.754 E.0241
G1 X108.546 Y170.246 E.81728
G1 X107.899 Y170.246 E.0241
G1 X123.408 Y185.754 E.81728
G1 X122.761 Y185.754 E.0241
G1 X107.253 Y170.246 E.81728
G1 X106.606 Y170.246 E.0241
G1 X122.115 Y185.754 E.81728
G1 X121.468 Y185.754 E.0241
G1 X105.959 Y170.246 E.81728
G1 X105.312 Y170.246 E.0241
G1 X120.821 Y185.754 E.81728
G1 X120.175 Y185.754 E.0241
G1 X104.666 Y170.246 E.81728
G1 X104.019 Y170.246 E.0241
G1 X119.528 Y185.754 E.81728
G1 X118.881 Y185.754 E.0241
G1 X103.372 Y170.246 E.81728
G1 X102.726 Y170.246 E.0241
G1 X118.234 Y185.754 E.81728
G1 X117.588 Y185.754 E.0241
G1 X102.079 Y170.246 E.81728
G1 X101.432 Y170.246 E.0241
G1 X116.941 Y185.754 E.81728
G1 X116.294 Y185.754 E.0241
G1 X100.786 Y170.246 E.81728
G1 X100.139 Y170.246 E.0241
G1 X115.648 Y185.754 E.81728
G1 X115.001 Y185.754 E.0241
G1 X99.492 Y170.246 E.81728
G1 X98.845 Y170.246 E.0241
G1 X114.354 Y185.754 E.81728
G1 X113.708 Y185.754 E.0241
G1 X98.199 Y170.246 E.81728
G1 X97.552 Y170.246 E.0241
G1 X113.061 Y185.754 E.81728
G1 X112.414 Y185.754 E.0241
G1 X96.905 Y170.246 E.81728
G1 X96.259 Y170.246 E.0241
G1 X111.768 Y185.754 E.81728
G1 X111.121 Y185.754 E.0241
G1 X95.612 Y170.246 E.81728
G1 X94.965 Y170.246 E.0241
G1 X110.474 Y185.754 E.81728
G1 X109.827 Y185.754 E.0241
G1 X94.319 Y170.246 E.81728
G1 X93.672 Y170.246 E.0241
G1 X109.181 Y185.754 E.81728
G1 X108.534 Y185.754 E.0241
G1 X93.025 Y170.246 E.81728
G1 X92.378 Y170.246 E.0241
G1 X107.887 Y185.754 E.81728
G1 X107.241 Y185.754 E.0241
G1 X91.732 Y170.246 E.81728
G1 X91.085 Y170.246 E.0241
G1 X106.594 Y185.754 E.81728
G1 X105.947 Y185.754 E.0241
G1 X90.438 Y170.246 E.81728
G1 X89.792 Y170.246 E.0241
G1 X105.301 Y185.754 E.81728
G1 X104.654 Y185.754 E.0241
G1 X89.145 Y170.246 E.81728
G1 X88.498 Y170.246 E.0241
G1 X104.007 Y185.754 E.81728
G1 X103.36 Y185.754 E.0241
G1 X87.852 Y170.246 E.81728
G1 X87.205 Y170.246 E.0241
G1 X102.714 Y185.754 E.81728
G1 X102.067 Y185.754 E.0241
G1 X86.558 Y170.246 E.81728
G1 X85.911 Y170.246 E.0241
G1 X101.42 Y185.754 E.81728
G1 X100.774 Y185.754 E.0241
G1 X85.265 Y170.246 E.81728
G1 X84.618 Y170.246 E.0241
G1 X100.127 Y185.754 E.81728
G1 X99.48 Y185.754 E.0241
G1 X83.971 Y170.246 E.81728
G1 X83.325 Y170.246 E.0241
G1 X98.834 Y185.754 E.81728
M73 P24 R40
G1 X98.187 Y185.754 E.0241
G1 X82.678 Y170.246 E.81728
G1 X82.031 Y170.246 E.0241
G1 X97.54 Y185.754 E.81728
G1 X96.893 Y185.754 E.0241
G1 X81.385 Y170.246 E.81728
G1 X80.738 Y170.246 E.0241
G1 X96.247 Y185.754 E.81728
G1 X95.6 Y185.754 E.0241
G1 X80.091 Y170.246 E.81728
G1 X79.445 Y170.246 E.0241
G1 X94.953 Y185.754 E.81728
G1 X94.307 Y185.754 E.0241
G1 X78.798 Y170.246 E.81728
G1 X78.254 Y170.246 E.02025
G1 X78.254 Y169.702 E.02025
G1 X73.746 Y165.193 E.23761
G1 X73.746 Y165.84 E.0241
G1 X93.66 Y185.754 E1.04944
G1 X93.013 Y185.754 E.0241
G1 X73.746 Y166.487 E1.01536
G1 X73.746 Y167.133 E.0241
G1 X92.367 Y185.754 E.98128
G1 X91.72 Y185.754 E.0241
G1 X73.746 Y167.78 E.9472
G1 X73.746 Y168.427 E.0241
G1 X91.073 Y185.754 E.91312
G1 X90.426 Y185.754 E.0241
G1 X73.746 Y169.074 E.87904
G1 X73.746 Y169.72 E.0241
G1 X89.78 Y185.754 E.84496
G1 X89.133 Y185.754 E.0241
G1 X73.746 Y170.367 E.81088
G1 X73.746 Y171.014 E.0241
G1 X88.486 Y185.754 E.77681
G1 X87.84 Y185.754 E.0241
G1 X73.746 Y171.66 E.74273
G1 X73.746 Y172.307 E.0241
G1 X87.193 Y185.754 E.70865
G1 X86.546 Y185.754 E.0241
G1 X73.746 Y172.954 E.67457
G1 X73.746 Y173.6 E.0241
G1 X85.9 Y185.754 E.64049
G1 X85.253 Y185.754 E.0241
G1 X73.746 Y174.247 E.60641
G1 X73.746 Y174.894 E.0241
G1 X84.606 Y185.754 E.57233
G1 X83.959 Y185.754 E.0241
G1 X73.746 Y175.541 E.53825
G1 X73.746 Y176.187 E.0241
G1 X83.313 Y185.754 E.50417
G1 X82.666 Y185.754 E.0241
G1 X73.746 Y176.834 E.47009
G1 X73.746 Y177.481 E.0241
G1 X82.019 Y185.754 E.43601
G1 X81.373 Y185.754 E.0241
G1 X73.746 Y178.127 E.40193
G1 X73.746 Y178.774 E.0241
G1 X80.726 Y185.754 E.36785
G1 X80.079 Y185.754 E.0241
G1 X73.746 Y179.421 E.33377
G1 X73.746 Y180.067 E.0241
G1 X79.433 Y185.754 E.29969
G1 X78.786 Y185.754 E.0241
G1 X73.746 Y180.714 E.26561
G1 X73.746 Y181.361 E.0241
G1 X78.139 Y185.754 E.23153
G1 X77.492 Y185.754 E.0241
G1 X73.746 Y182.008 E.19745
G1 X73.746 Y182.654 E.0241
G1 X76.846 Y185.754 E.16337
G1 X76.199 Y185.754 E.0241
G1 X73.746 Y183.301 E.12929
G1 X73.746 Y183.948 E.0241
G1 X75.552 Y185.754 E.09521
G1 X74.906 Y185.754 E.0241
G1 X73.746 Y184.594 E.06113
G1 X73.746 Y185.241 E.0241
G1 X74.465 Y185.96 E.03789
M106 S127.5
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X73.746 Y185.241 E-.38644
G1 X73.746 Y184.594 E-.24575
G1 X73.983 Y184.832 E-.12782
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/125
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
G3 Z.6 I.324 J1.173 P1  F30000
G1 X129.102 Y169.602 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X78.898 Y169.602 E1.66536
G1 X78.898 Y88.398 E2.69369
G1 X129.102 Y88.398 E1.66536
G1 X129.102 Y169.542 E2.6917
G1 X128.71 Y169.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.29 Y169.21 E1.51854
G1 X79.29 Y88.79 E2.47108
G1 X128.71 Y88.79 E1.51854
G1 X128.71 Y169.15 E2.46924
M204 S10000
; WIPE_START
G1 F24000
G1 X126.71 Y169.152 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.071 J-.577 P1  F30000
G1 X73.102 Y69.602 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X186.898 Y69.602 E3.77482
G1 X186.898 Y186.398 E3.87433
G1 X73.102 Y186.398 E3.77482
G1 X73.102 Y69.662 E3.87234
G1 X72.71 Y69.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X187.29 Y69.21 E3.52072
G1 X187.29 Y186.79 E3.61291
G1 X72.71 Y186.79 E3.52072
G1 X72.71 Y69.27 E3.61106
M204 S10000
; WIPE_START
G1 F24000
G1 X74.71 Y69.269 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.717 J-.983 P1  F30000
G1 X74.029 Y69.766 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420283
G1 F15000
G1 X73.435 Y70.359 E.0258
G1 X73.435 Y70.893 E.01641
G1 X74.393 Y69.935 E.04163
G1 X74.926 Y69.935 E.01641
G1 X73.435 Y71.426 E.06484
G1 X73.435 Y71.96 E.01641
G1 X75.46 Y69.935 E.08804
G1 X75.994 Y69.935 E.01641
G1 X73.435 Y72.494 E.11125
G1 X73.435 Y73.027 E.01641
G1 X76.527 Y69.935 E.13446
G1 X77.061 Y69.935 E.01641
G1 X73.435 Y73.561 E.15767
G1 X73.435 Y74.095 E.01641
G1 X77.595 Y69.935 E.18088
G1 X78.128 Y69.935 E.01641
G1 X73.435 Y74.628 E.20408
G1 X73.435 Y75.162 E.01641
G1 X78.662 Y69.935 E.22729
G1 X79.196 Y69.935 E.01641
G1 X73.435 Y75.696 E.2505
G1 X73.435 Y76.229 E.01641
G1 X79.729 Y69.935 E.27371
G1 X80.263 Y69.935 E.01641
G1 X73.435 Y76.763 E.29692
G1 X73.435 Y77.297 E.01641
G1 X80.797 Y69.935 E.32012
G1 X81.33 Y69.935 E.01641
G1 X73.435 Y77.83 E.34333
G1 X73.435 Y78.364 E.01641
G1 X81.864 Y69.935 E.36654
G1 X82.398 Y69.935 E.01641
G1 X73.435 Y78.898 E.38975
G1 X73.435 Y79.431 E.01641
G1 X82.931 Y69.935 E.41296
G1 X83.465 Y69.935 E.01641
G1 X73.435 Y79.965 E.43616
G1 X73.435 Y80.499 E.01641
G1 X83.999 Y69.935 E.45937
G1 X84.532 Y69.935 E.01641
G1 X73.435 Y81.032 E.48258
G1 X73.435 Y81.566 E.01641
G1 X85.066 Y69.935 E.50579
G1 X85.6 Y69.935 E.01641
M73 P25 R40
G1 X73.435 Y82.1 E.529
G1 X73.435 Y82.633 E.01641
G1 X86.133 Y69.935 E.55221
G1 X86.667 Y69.935 E.01641
G1 X73.435 Y83.167 E.57541
G1 X73.435 Y83.701 E.01641
G1 X87.201 Y69.935 E.59862
G1 X87.734 Y69.935 E.01641
G1 X73.435 Y84.234 E.62183
G1 X73.435 Y84.768 E.01641
G1 X88.268 Y69.935 E.64504
G1 X88.802 Y69.935 E.01641
G1 X73.435 Y85.302 E.66825
G1 X73.435 Y85.835 E.01641
G1 X89.335 Y69.935 E.69145
G1 X89.869 Y69.935 E.01641
G1 X73.435 Y86.369 E.71466
G1 X73.435 Y86.903 E.01641
G1 X90.403 Y69.935 E.73787
G1 X90.936 Y69.935 E.01641
G1 X73.435 Y87.436 E.76108
G1 X73.435 Y87.97 E.01641
G1 X91.47 Y69.935 E.78429
G1 X92.004 Y69.935 E.01641
G1 X73.435 Y88.504 E.80749
G1 X73.435 Y89.037 E.01641
G1 X92.537 Y69.935 E.8307
G1 X93.071 Y69.935 E.01641
G1 X73.435 Y89.571 E.85391
G1 X73.435 Y90.105 E.01641
G1 X93.605 Y69.935 E.87712
G1 X94.138 Y69.935 E.01641
G1 X73.435 Y90.638 E.90033
G1 X73.435 Y91.172 E.01641
G1 X94.672 Y69.935 E.92353
G1 X95.206 Y69.935 E.01641
G1 X73.435 Y91.706 E.94674
G1 X73.435 Y92.239 E.01641
G1 X95.739 Y69.935 E.96995
G1 X96.273 Y69.935 E.01641
G1 X73.435 Y92.773 E.99316
G1 X73.435 Y93.307 E.01641
G1 X96.807 Y69.935 E1.01637
G1 X97.34 Y69.935 E.01641
G1 X79.211 Y88.065 E.7884
G1 X79.745 Y88.065 E.01641
G1 X97.874 Y69.935 E.7884
G1 X98.408 Y69.935 E.01641
G1 X80.279 Y88.065 E.7884
G1 X80.812 Y88.065 E.01641
G1 X98.941 Y69.935 E.7884
G1 X99.475 Y69.935 E.01641
G1 X81.346 Y88.065 E.7884
G1 X81.88 Y88.065 E.01641
G1 X100.009 Y69.935 E.7884
G1 X100.543 Y69.935 E.01641
G1 X82.413 Y88.065 E.7884
G1 X82.947 Y88.065 E.01641
G1 X101.076 Y69.935 E.7884
G1 X101.61 Y69.935 E.01641
G1 X83.481 Y88.065 E.7884
G1 X84.014 Y88.065 E.01641
G1 X102.144 Y69.935 E.7884
G1 X102.677 Y69.935 E.01641
G1 X84.548 Y88.065 E.7884
G1 X85.082 Y88.065 E.01641
G1 X103.211 Y69.935 E.7884
G1 X103.745 Y69.935 E.01641
G1 X85.615 Y88.065 E.7884
G1 X86.149 Y88.065 E.01641
G1 X104.278 Y69.935 E.7884
G1 X104.812 Y69.935 E.01641
G1 X86.683 Y88.065 E.7884
G1 X87.216 Y88.065 E.01641
G1 X105.346 Y69.935 E.7884
G1 X105.879 Y69.935 E.01641
G1 X87.75 Y88.065 E.7884
G1 X88.284 Y88.065 E.01641
G1 X106.413 Y69.935 E.7884
G1 X106.947 Y69.935 E.01641
G1 X88.817 Y88.065 E.7884
G1 X89.351 Y88.065 E.01641
G1 X107.48 Y69.935 E.7884
G1 X108.014 Y69.935 E.01641
G1 X89.885 Y88.065 E.7884
G1 X90.418 Y88.065 E.01641
G1 X108.548 Y69.935 E.7884
G1 X109.081 Y69.935 E.01641
G1 X90.952 Y88.065 E.7884
G1 X91.486 Y88.065 E.01641
G1 X109.615 Y69.935 E.7884
G1 X110.149 Y69.935 E.01641
G1 X92.019 Y88.065 E.7884
G1 X92.553 Y88.065 E.01641
G1 X110.682 Y69.935 E.7884
G1 X111.216 Y69.935 E.01641
G1 X93.087 Y88.065 E.7884
G1 X93.62 Y88.065 E.01641
G1 X111.75 Y69.935 E.7884
G1 X112.283 Y69.935 E.01641
G1 X94.154 Y88.065 E.7884
G1 X94.688 Y88.065 E.01641
G1 X112.817 Y69.935 E.7884
G1 X113.351 Y69.935 E.01641
G1 X95.221 Y88.065 E.7884
G1 X95.755 Y88.065 E.01641
G1 X113.884 Y69.935 E.7884
G1 X114.418 Y69.935 E.01641
G1 X96.289 Y88.065 E.7884
G1 X96.822 Y88.065 E.01641
G1 X114.952 Y69.935 E.7884
G1 X115.485 Y69.935 E.01641
G1 X97.356 Y88.065 E.7884
G1 X97.89 Y88.065 E.01641
G1 X116.019 Y69.935 E.7884
G1 X116.553 Y69.935 E.01641
G1 X98.423 Y88.065 E.7884
G1 X98.957 Y88.065 E.01641
G1 X117.086 Y69.935 E.7884
G1 X117.62 Y69.935 E.01641
G1 X99.491 Y88.065 E.7884
G1 X100.024 Y88.065 E.01641
G1 X118.154 Y69.935 E.7884
G1 X118.687 Y69.935 E.01641
G1 X100.558 Y88.065 E.7884
G1 X101.092 Y88.065 E.01641
G1 X119.221 Y69.935 E.7884
G1 X119.755 Y69.935 E.01641
G1 X101.625 Y88.065 E.7884
G1 X102.159 Y88.065 E.01641
G1 X120.288 Y69.935 E.7884
G1 X120.822 Y69.935 E.01641
G1 X102.693 Y88.065 E.7884
G1 X103.226 Y88.065 E.01641
G1 X121.356 Y69.935 E.7884
G1 X121.889 Y69.935 E.01641
G1 X103.76 Y88.065 E.7884
G1 X104.294 Y88.065 E.01641
G1 X122.423 Y69.935 E.7884
G1 X122.957 Y69.935 E.01641
G1 X104.827 Y88.065 E.7884
G1 X105.361 Y88.065 E.01641
G1 X123.49 Y69.935 E.7884
M73 P25 R39
G1 X124.024 Y69.935 E.01641
G1 X105.895 Y88.065 E.7884
G1 X106.428 Y88.065 E.01641
G1 X124.558 Y69.935 E.7884
G1 X125.091 Y69.935 E.01641
G1 X106.962 Y88.065 E.7884
G1 X107.496 Y88.065 E.01641
G1 X125.625 Y69.935 E.7884
G1 X126.159 Y69.935 E.01641
G1 X108.029 Y88.065 E.7884
G1 X108.563 Y88.065 E.01641
G1 X126.692 Y69.935 E.7884
G1 X127.226 Y69.935 E.01641
G1 X109.097 Y88.065 E.7884
G1 X109.63 Y88.065 E.01641
G1 X127.76 Y69.935 E.7884
G1 X128.293 Y69.935 E.01641
G1 X110.164 Y88.065 E.7884
G1 X110.698 Y88.065 E.01641
G1 X128.827 Y69.935 E.7884
G1 X129.361 Y69.935 E.01641
G1 X111.231 Y88.065 E.7884
G1 X111.765 Y88.065 E.01641
G1 X129.894 Y69.935 E.7884
G1 X130.428 Y69.935 E.01641
G1 X112.299 Y88.065 E.7884
G1 X112.832 Y88.065 E.01641
G1 X130.962 Y69.935 E.7884
G1 X131.495 Y69.935 E.01641
G1 X113.366 Y88.065 E.7884
G1 X113.9 Y88.065 E.01641
G1 X132.029 Y69.935 E.7884
G1 X132.563 Y69.935 E.01641
G1 X114.434 Y88.065 E.7884
G1 X114.967 Y88.065 E.01641
G1 X133.096 Y69.935 E.7884
G1 X133.63 Y69.935 E.01641
G1 X115.501 Y88.065 E.7884
G1 X116.035 Y88.065 E.01641
G1 X134.164 Y69.935 E.7884
G1 X134.698 Y69.935 E.01641
G1 X116.568 Y88.065 E.7884
G1 X117.102 Y88.065 E.01641
G1 X135.231 Y69.935 E.7884
G1 X135.765 Y69.935 E.01641
G1 X117.636 Y88.065 E.7884
G1 X118.169 Y88.065 E.01641
G1 X136.299 Y69.935 E.7884
G1 X136.832 Y69.935 E.01641
G1 X118.703 Y88.065 E.7884
G1 X119.237 Y88.065 E.01641
G1 X137.366 Y69.935 E.7884
G1 X137.9 Y69.935 E.01641
G1 X119.77 Y88.065 E.7884
G1 X120.304 Y88.065 E.01641
G1 X138.433 Y69.935 E.7884
G1 X138.967 Y69.935 E.01641
G1 X120.838 Y88.065 E.7884
G1 X121.371 Y88.065 E.01641
G1 X139.501 Y69.935 E.7884
G1 X140.034 Y69.935 E.01641
G1 X121.905 Y88.065 E.7884
G1 X122.439 Y88.065 E.01641
G1 X140.568 Y69.935 E.7884
G1 X141.102 Y69.935 E.01641
G1 X122.972 Y88.065 E.7884
G1 X123.506 Y88.065 E.01641
G1 X141.635 Y69.935 E.7884
G1 X142.169 Y69.935 E.01641
G1 X124.04 Y88.065 E.7884
G1 X124.573 Y88.065 E.01641
G1 X142.703 Y69.935 E.7884
G1 X143.236 Y69.935 E.01641
G1 X125.107 Y88.065 E.7884
G1 X125.641 Y88.065 E.01641
G1 X143.77 Y69.935 E.7884
G1 X144.304 Y69.935 E.01641
G1 X126.174 Y88.065 E.7884
G1 X126.708 Y88.065 E.01641
G1 X144.837 Y69.935 E.7884
G1 X145.371 Y69.935 E.01641
G1 X127.242 Y88.065 E.7884
G1 X127.775 Y88.065 E.01641
G1 X145.905 Y69.935 E.7884
G1 X146.438 Y69.935 E.01641
G1 X128.309 Y88.065 E.7884
G1 X128.843 Y88.065 E.01641
G1 X146.972 Y69.935 E.7884
G1 X147.506 Y69.935 E.01641
G1 X129.376 Y88.065 E.7884
G1 X129.435 Y88.065 E.00181
G1 X129.435 Y88.539 E.0146
G1 X148.039 Y69.935 E.80904
G1 X148.573 Y69.935 E.01641
G1 X129.435 Y89.073 E.83225
G1 X129.435 Y89.607 E.01641
G1 X149.107 Y69.935 E.85546
G1 X149.64 Y69.935 E.01641
G1 X129.435 Y90.14 E.87866
G1 X129.435 Y90.674 E.01641
G1 X150.174 Y69.935 E.90187
G1 X150.708 Y69.935 E.01641
G1 X129.435 Y91.208 E.92508
G1 X129.435 Y91.741 E.01641
G1 X151.241 Y69.935 E.94829
G1 X151.775 Y69.935 E.01641
G1 X129.435 Y92.275 E.9715
G1 X129.435 Y92.809 E.01641
G1 X152.309 Y69.935 E.9947
G1 X152.842 Y69.935 E.01641
G1 X129.435 Y93.342 E1.01791
G1 X129.435 Y93.876 E.01641
G1 X153.376 Y69.935 E1.04112
G1 X153.91 Y69.935 E.01641
G1 X129.435 Y94.41 E1.06433
G1 X129.435 Y94.943 E.01641
G1 X154.443 Y69.935 E1.08754
G1 X154.977 Y69.935 E.01641
G1 X129.435 Y95.477 E1.11074
G1 X129.435 Y96.011 E.01641
G1 X155.511 Y69.935 E1.13395
G1 X156.044 Y69.935 E.01641
G1 X129.435 Y96.544 E1.15716
G1 X129.435 Y97.078 E.01641
G1 X156.578 Y69.935 E1.18037
G1 X157.112 Y69.935 E.01641
G1 X129.435 Y97.612 E1.20358
G1 X129.435 Y98.145 E.01641
G1 X157.645 Y69.935 E1.22678
G1 X158.179 Y69.935 E.01641
G1 X129.435 Y98.679 E1.24999
G1 X129.435 Y99.213 E.01641
G1 X158.713 Y69.935 E1.2732
G1 X159.246 Y69.935 E.01641
G1 X129.435 Y99.746 E1.29641
G1 X129.435 Y100.28 E.01641
G1 X159.78 Y69.935 E1.31962
G1 X160.314 Y69.935 E.01641
G1 X129.435 Y100.814 E1.34283
G1 X129.435 Y101.347 E.01641
G1 X160.847 Y69.935 E1.36603
G1 X161.381 Y69.935 E.01641
G1 X129.435 Y101.881 E1.38924
G1 X129.435 Y102.415 E.01641
G1 X161.915 Y69.935 E1.41245
G1 X162.448 Y69.935 E.01641
G1 X129.435 Y102.948 E1.43566
G1 X129.435 Y103.482 E.01641
G1 X162.982 Y69.935 E1.45887
G1 X163.516 Y69.935 E.01641
G1 X129.435 Y104.016 E1.48207
G1 X129.435 Y104.549 E.01641
G1 X164.049 Y69.935 E1.50528
G1 X164.583 Y69.935 E.01641
G1 X129.435 Y105.083 E1.52849
G1 X129.435 Y105.617 E.01641
G1 X165.117 Y69.935 E1.5517
G1 X165.65 Y69.935 E.01641
G1 X129.435 Y106.15 E1.57491
G1 X129.435 Y106.684 E.01641
G1 X166.184 Y69.935 E1.59811
G1 X166.718 Y69.935 E.01641
G1 X129.435 Y107.218 E1.62132
G1 X129.435 Y107.751 E.01641
G1 X167.252 Y69.935 E1.64453
G1 X167.785 Y69.935 E.01641
G1 X129.435 Y108.285 E1.66774
G1 X129.435 Y108.819 E.01641
G1 X168.319 Y69.935 E1.69095
G1 X168.853 Y69.935 E.01641
G1 X129.435 Y109.353 E1.71415
G1 X129.435 Y109.886 E.01641
G1 X169.386 Y69.935 E1.73736
G1 X169.92 Y69.935 E.01641
G1 X129.435 Y110.42 E1.76057
G1 X129.435 Y110.954 E.01641
G1 X170.454 Y69.935 E1.78378
G1 X170.987 Y69.935 E.01641
G1 X129.435 Y111.487 E1.80699
G1 X129.435 Y112.021 E.01641
G1 X171.521 Y69.935 E1.83019
G1 X172.055 Y69.935 E.01641
G1 X129.435 Y112.555 E1.8534
G1 X129.435 Y113.088 E.01641
G1 X172.588 Y69.935 E1.87661
G1 X173.122 Y69.935 E.01641
G1 X129.435 Y113.622 E1.89982
G1 X129.435 Y114.156 E.01641
G1 X173.656 Y69.935 E1.92303
G1 X174.189 Y69.935 E.01641
G1 X129.435 Y114.689 E1.94623
G1 X129.435 Y115.223 E.01641
G1 X174.723 Y69.935 E1.96944
G1 X175.257 Y69.935 E.01641
G1 X129.435 Y115.757 E1.99265
G1 X129.435 Y116.29 E.01641
G1 X175.79 Y69.935 E2.01586
G1 X176.324 Y69.935 E.01641
G1 X129.435 Y116.824 E2.03907
G1 X129.435 Y117.358 E.01641
G1 X176.858 Y69.935 E2.06227
G1 X177.391 Y69.935 E.01641
G1 X129.435 Y117.891 E2.08548
G1 X129.435 Y118.425 E.01641
G1 X177.925 Y69.935 E2.10869
G1 X178.459 Y69.935 E.01641
G1 X129.435 Y118.959 E2.1319
G1 X129.435 Y119.492 E.01641
G1 X178.992 Y69.935 E2.15511
G1 X179.526 Y69.935 E.01641
G1 X129.435 Y120.026 E2.17832
G1 X129.435 Y120.56 E.01641
G1 X180.06 Y69.935 E2.20152
G1 X180.593 Y69.935 E.01641
G1 X129.435 Y121.093 E2.22473
G1 X129.435 Y121.627 E.01641
G1 X181.127 Y69.935 E2.24794
G1 X181.661 Y69.935 E.01641
G1 X129.435 Y122.161 E2.27115
G1 X129.435 Y122.694 E.01641
G1 X182.194 Y69.935 E2.29436
G1 X182.728 Y69.935 E.01641
G1 X129.435 Y123.228 E2.31756
G1 X129.435 Y123.762 E.01641
G1 X183.262 Y69.935 E2.34077
G1 X183.795 Y69.935 E.01641
G1 X129.435 Y124.295 E2.36398
G1 X129.435 Y124.829 E.01641
G1 X184.329 Y69.935 E2.38719
G1 X184.863 Y69.935 E.01641
G1 X129.435 Y125.363 E2.4104
G1 X129.435 Y125.896 E.01641
G1 X185.396 Y69.935 E2.4336
G1 X185.93 Y69.935 E.01641
G1 X129.435 Y126.43 E2.45681
G1 X129.435 Y126.964 E.01641
G1 X186.464 Y69.935 E2.48002
G1 X186.565 Y69.935 E.0031
G1 X186.565 Y70.368 E.01331
G1 X129.435 Y127.497 E2.48441
G1 X129.435 Y128.031 E.01641
G1 X186.565 Y70.902 E2.48441
G1 X186.565 Y71.435 E.01641
G1 X129.435 Y128.565 E2.48441
G1 X129.435 Y129.098 E.01641
G1 X186.565 Y71.969 E2.48441
G1 X186.565 Y72.503 E.01641
G1 X129.435 Y129.632 E2.48441
G1 X129.435 Y130.166 E.01641
G1 X186.565 Y73.036 E2.48441
G1 X186.565 Y73.57 E.01641
G1 X129.435 Y130.699 E2.48441
G1 X129.435 Y131.233 E.01641
G1 X186.565 Y74.104 E2.48441
G1 X186.565 Y74.637 E.01641
G1 X129.435 Y131.767 E2.48441
G1 X129.435 Y132.3 E.01641
G1 X186.565 Y75.171 E2.48441
G1 X186.565 Y75.705 E.01641
G1 X129.435 Y132.834 E2.48441
G1 X129.435 Y133.368 E.01641
G1 X186.565 Y76.238 E2.48441
G1 X186.565 Y76.772 E.01641
G1 X129.435 Y133.901 E2.48441
G1 X129.435 Y134.435 E.01641
G1 X186.565 Y77.306 E2.48441
G1 X186.565 Y77.839 E.01641
M73 P26 R39
G1 X129.435 Y134.969 E2.48441
G1 X129.435 Y135.502 E.01641
G1 X186.565 Y78.373 E2.48441
G1 X186.565 Y78.907 E.01641
G1 X129.435 Y136.036 E2.48441
G1 X129.435 Y136.57 E.01641
G1 X186.565 Y79.44 E2.48441
G1 X186.565 Y79.974 E.01641
G1 X129.435 Y137.103 E2.48441
G1 X129.435 Y137.637 E.01641
G1 X186.565 Y80.508 E2.48441
G1 X186.565 Y81.041 E.01641
G1 X129.435 Y138.171 E2.48441
G1 X129.435 Y138.704 E.01641
G1 X186.565 Y81.575 E2.48441
G1 X186.565 Y82.109 E.01641
G1 X129.435 Y139.238 E2.48441
G1 X129.435 Y139.772 E.01641
G1 X186.565 Y82.643 E2.48441
G1 X186.565 Y83.176 E.01641
G1 X129.435 Y140.305 E2.48441
G1 X129.435 Y140.839 E.01641
G1 X186.565 Y83.71 E2.48441
G1 X186.565 Y84.244 E.01641
G1 X129.435 Y141.373 E2.48441
G1 X129.435 Y141.906 E.01641
G1 X186.565 Y84.777 E2.48441
G1 X186.565 Y85.311 E.01641
G1 X129.435 Y142.44 E2.48441
G1 X129.435 Y142.974 E.01641
G1 X186.565 Y85.845 E2.48441
G1 X186.565 Y86.378 E.01641
G1 X129.435 Y143.508 E2.48441
G1 X129.435 Y144.041 E.01641
G1 X186.565 Y86.912 E2.48441
G1 X186.565 Y87.446 E.01641
G1 X129.435 Y144.575 E2.48441
G1 X129.435 Y145.109 E.01641
G1 X186.565 Y87.979 E2.48441
G1 X186.565 Y88.513 E.01641
G1 X129.435 Y145.642 E2.48441
G1 X129.435 Y146.176 E.01641
G1 X186.565 Y89.047 E2.48441
G1 X186.565 Y89.58 E.01641
G1 X129.435 Y146.71 E2.48441
G1 X129.435 Y147.243 E.01641
G1 X186.565 Y90.114 E2.48441
G1 X186.565 Y90.648 E.01641
G1 X129.435 Y147.777 E2.48441
G1 X129.435 Y148.311 E.01641
G1 X186.565 Y91.181 E2.48441
G1 X186.565 Y91.715 E.01641
G1 X129.435 Y148.844 E2.48441
G1 X129.435 Y149.378 E.01641
G1 X186.565 Y92.249 E2.48441
G1 X186.565 Y92.782 E.01641
G1 X129.435 Y149.912 E2.48441
G1 X129.435 Y150.445 E.01641
G1 X186.565 Y93.316 E2.48441
G1 X186.565 Y93.85 E.01641
G1 X129.435 Y150.979 E2.48441
G1 X129.435 Y151.513 E.01641
G1 X186.565 Y94.383 E2.48441
G1 X186.565 Y94.917 E.01641
G1 X129.435 Y152.046 E2.48441
G1 X129.435 Y152.58 E.01641
G1 X186.565 Y95.451 E2.48441
G1 X186.565 Y95.984 E.01641
G1 X129.435 Y153.114 E2.48441
G1 X129.435 Y153.647 E.01641
G1 X186.565 Y96.518 E2.48441
G1 X186.565 Y97.052 E.01641
G1 X129.435 Y154.181 E2.48441
G1 X129.435 Y154.715 E.01641
G1 X186.565 Y97.585 E2.48441
G1 X186.565 Y98.119 E.01641
G1 X129.435 Y155.248 E2.48441
G1 X129.435 Y155.782 E.01641
G1 X186.565 Y98.653 E2.48441
G1 X186.565 Y99.186 E.01641
G1 X129.435 Y156.316 E2.48441
G1 X129.435 Y156.849 E.01641
G1 X186.565 Y99.72 E2.48441
G1 X186.565 Y100.254 E.01641
G1 X129.435 Y157.383 E2.48441
G1 X129.435 Y157.917 E.01641
G1 X186.565 Y100.787 E2.48441
G1 X186.565 Y101.321 E.01641
G1 X129.435 Y158.45 E2.48441
G1 X129.435 Y158.984 E.01641
G1 X186.565 Y101.855 E2.48441
G1 X186.565 Y102.388 E.01641
G1 X129.435 Y159.518 E2.48441
G1 X129.435 Y160.051 E.01641
G1 X186.565 Y102.922 E2.48441
G1 X186.565 Y103.456 E.01641
G1 X129.435 Y160.585 E2.48441
G1 X129.435 Y161.119 E.01641
G1 X186.565 Y103.989 E2.48441
G1 X186.565 Y104.523 E.01641
G1 X129.435 Y161.652 E2.48441
G1 X129.435 Y162.186 E.01641
G1 X186.565 Y105.057 E2.48441
G1 X186.565 Y105.59 E.01641
G1 X129.435 Y162.72 E2.48441
G1 X129.435 Y163.253 E.01641
G1 X186.565 Y106.124 E2.48441
G1 X186.565 Y106.658 E.01641
G1 X129.435 Y163.787 E2.48441
G1 X129.435 Y164.321 E.01641
G1 X186.565 Y107.191 E2.48441
G1 X186.565 Y107.725 E.01641
G1 X129.435 Y164.854 E2.48441
G1 X129.435 Y165.388 E.01641
G1 X186.565 Y108.259 E2.48441
G1 X186.565 Y108.792 E.01641
G1 X129.435 Y165.922 E2.48441
G1 X129.435 Y166.455 E.01641
G1 X186.565 Y109.326 E2.48441
G1 X186.565 Y109.86 E.01641
G1 X129.435 Y166.989 E2.48441
G1 X129.435 Y167.523 E.01641
G1 X186.565 Y110.393 E2.48441
G1 X186.565 Y110.927 E.01641
G1 X129.435 Y168.056 E2.48441
G1 X129.435 Y168.59 E.01641
G1 X186.565 Y111.461 E2.48441
G1 X186.565 Y111.994 E.01641
G1 X129.266 Y169.293 E2.49179
G1 X185.971 Y186.234 F30000
G1 F15000
G1 X186.565 Y185.641 E.0258
G1 X186.565 Y185.107 E.01641
G1 X185.607 Y186.065 E.04163
G1 X185.074 Y186.065 E.01641
G1 X186.565 Y184.574 E.06483
G1 X186.565 Y184.04 E.01641
G1 X184.54 Y186.065 E.08804
G1 X184.006 Y186.065 E.01641
G1 X186.565 Y183.506 E.11125
G1 X186.565 Y182.973 E.01641
G1 X183.473 Y186.065 E.13446
G1 X182.939 Y186.065 E.01641
G1 X186.565 Y182.439 E.15767
G1 X186.565 Y181.905 E.01641
G1 X182.405 Y186.065 E.18087
G1 X181.872 Y186.065 E.01641
G1 X186.565 Y181.372 E.20408
G1 X186.565 Y180.838 E.01641
G1 X181.338 Y186.065 E.22729
G1 X180.804 Y186.065 E.01641
G1 X186.565 Y180.304 E.2505
G1 X186.565 Y179.771 E.01641
G1 X180.271 Y186.065 E.27371
G1 X179.737 Y186.065 E.01641
G1 X186.565 Y179.237 E.29691
G1 X186.565 Y178.703 E.01641
G1 X179.203 Y186.065 E.32012
G1 X178.67 Y186.065 E.01641
G1 X186.565 Y178.17 E.34333
G1 X186.565 Y177.636 E.01641
G1 X178.136 Y186.065 E.36654
G1 X177.602 Y186.065 E.01641
G1 X186.565 Y177.102 E.38975
G1 X186.565 Y176.569 E.01641
G1 X177.069 Y186.065 E.41295
G1 X176.535 Y186.065 E.01641
G1 X186.565 Y176.035 E.43616
G1 X186.565 Y175.501 E.01641
G1 X176.001 Y186.065 E.45937
G1 X175.468 Y186.065 E.01641
G1 X186.565 Y174.968 E.48258
G1 X186.565 Y174.434 E.01641
G1 X174.934 Y186.065 E.50579
G1 X174.4 Y186.065 E.01641
G1 X186.565 Y173.9 E.52899
G1 X186.565 Y173.367 E.01641
G1 X173.867 Y186.065 E.5522
G1 X173.333 Y186.065 E.01641
G1 X186.565 Y172.833 E.57541
G1 X186.565 Y172.299 E.01641
M73 P27 R39
G1 X172.799 Y186.065 E.59862
G1 X172.266 Y186.065 E.01641
G1 X186.565 Y171.766 E.62183
G1 X186.565 Y171.232 E.01641
G1 X171.732 Y186.065 E.64503
G1 X171.198 Y186.065 E.01641
G1 X186.565 Y170.698 E.66824
G1 X186.565 Y170.165 E.01641
G1 X170.665 Y186.065 E.69145
G1 X170.131 Y186.065 E.01641
G1 X186.565 Y169.631 E.71466
G1 X186.565 Y169.097 E.01641
G1 X169.597 Y186.065 E.73787
G1 X169.064 Y186.065 E.01641
G1 X186.565 Y168.564 E.76107
G1 X186.565 Y168.03 E.01641
G1 X168.53 Y186.065 E.78428
G1 X167.996 Y186.065 E.01641
G1 X186.565 Y167.496 E.80749
G1 X186.565 Y166.963 E.01641
G1 X167.463 Y186.065 E.8307
G1 X166.929 Y186.065 E.01641
G1 X186.565 Y166.429 E.85391
G1 X186.565 Y165.895 E.01641
G1 X166.395 Y186.065 E.87711
G1 X165.862 Y186.065 E.01641
G1 X186.565 Y165.362 E.90032
G1 X186.565 Y164.828 E.01641
G1 X165.328 Y186.065 E.92353
G1 X164.794 Y186.065 E.01641
G1 X186.565 Y164.294 E.94674
G1 X186.565 Y163.761 E.01641
G1 X164.261 Y186.065 E.96995
G1 X163.727 Y186.065 E.01641
G1 X186.565 Y163.227 E.99316
G1 X186.565 Y162.693 E.01641
G1 X163.193 Y186.065 E1.01636
G1 X162.66 Y186.065 E.01641
G1 X186.565 Y162.16 E1.03957
G1 X186.565 Y161.626 E.01641
G1 X162.126 Y186.065 E1.06278
G1 X161.592 Y186.065 E.01641
G1 X186.565 Y161.092 E1.08599
G1 X186.565 Y160.559 E.01641
G1 X161.059 Y186.065 E1.1092
G1 X160.525 Y186.065 E.01641
G1 X186.565 Y160.025 E1.1324
G1 X186.565 Y159.491 E.01641
G1 X159.991 Y186.065 E1.15561
G1 X159.458 Y186.065 E.01641
G1 X186.565 Y158.958 E1.17882
G1 X186.565 Y158.424 E.01641
G1 X158.924 Y186.065 E1.20203
G1 X158.39 Y186.065 E.01641
G1 X186.565 Y157.89 E1.22524
G1 X186.565 Y157.357 E.01641
G1 X157.857 Y186.065 E1.24844
G1 X157.323 Y186.065 E.01641
G1 X186.565 Y156.823 E1.27165
G1 X186.565 Y156.289 E.01641
G1 X156.789 Y186.065 E1.29486
G1 X156.256 Y186.065 E.01641
G1 X186.565 Y155.756 E1.31807
G1 X186.565 Y155.222 E.01641
G1 X155.722 Y186.065 E1.34128
G1 X155.188 Y186.065 E.01641
G1 X186.565 Y154.688 E1.36448
G1 X186.565 Y154.155 E.01641
G1 X154.655 Y186.065 E1.38769
G1 X154.121 Y186.065 E.01641
G1 X186.565 Y153.621 E1.4109
G1 X186.565 Y153.087 E.01641
G1 X153.587 Y186.065 E1.43411
G1 X153.053 Y186.065 E.01641
G1 X186.565 Y152.554 E1.45732
G1 X186.565 Y152.02 E.01641
G1 X152.52 Y186.065 E1.48052
M73 P27 R38
G1 X151.986 Y186.065 E.01641
G1 X186.565 Y151.486 E1.50373
G1 X186.565 Y150.952 E.01641
G1 X151.452 Y186.065 E1.52694
G1 X150.919 Y186.065 E.01641
G1 X186.565 Y150.419 E1.55015
G1 X186.565 Y149.885 E.01641
G1 X150.385 Y186.065 E1.57336
G1 X149.851 Y186.065 E.01641
G1 X186.565 Y149.351 E1.59656
G1 X186.565 Y148.818 E.01641
G1 X149.318 Y186.065 E1.61977
G1 X148.784 Y186.065 E.01641
G1 X186.565 Y148.284 E1.64298
G1 X186.565 Y147.75 E.01641
G1 X148.25 Y186.065 E1.66619
G1 X147.717 Y186.065 E.01641
G1 X186.565 Y147.217 E1.6894
G1 X186.565 Y146.683 E.01641
G1 X147.183 Y186.065 E1.7126
G1 X146.649 Y186.065 E.01641
G1 X186.565 Y146.149 E1.73581
G1 X186.565 Y145.616 E.01641
G1 X146.116 Y186.065 E1.75902
G1 X145.582 Y186.065 E.01641
G1 X186.565 Y145.082 E1.78223
G1 X186.565 Y144.548 E.01641
G1 X145.048 Y186.065 E1.80544
G1 X144.515 Y186.065 E.01641
G1 X186.565 Y144.015 E1.82865
G1 X186.565 Y143.481 E.01641
G1 X143.981 Y186.065 E1.85185
G1 X143.447 Y186.065 E.01641
G1 X186.565 Y142.947 E1.87506
G1 X186.565 Y142.414 E.01641
G1 X142.914 Y186.065 E1.89827
G1 X142.38 Y186.065 E.01641
G1 X186.565 Y141.88 E1.92148
G1 X186.565 Y141.346 E.01641
G1 X141.846 Y186.065 E1.94469
G1 X141.313 Y186.065 E.01641
G1 X186.565 Y140.813 E1.96789
G1 X186.565 Y140.279 E.01641
G1 X140.779 Y186.065 E1.9911
G1 X140.245 Y186.065 E.01641
G1 X186.565 Y139.745 E2.01431
G1 X186.565 Y139.212 E.01641
G1 X139.712 Y186.065 E2.03752
G1 X139.178 Y186.065 E.01641
G1 X186.565 Y138.678 E2.06073
G1 X186.565 Y138.144 E.01641
G1 X138.644 Y186.065 E2.08393
G1 X138.111 Y186.065 E.01641
G1 X186.565 Y137.611 E2.10714
G1 X186.565 Y137.077 E.01641
G1 X137.577 Y186.065 E2.13035
G1 X137.043 Y186.065 E.01641
G1 X186.565 Y136.543 E2.15356
G1 X186.565 Y136.01 E.01641
G1 X136.51 Y186.065 E2.17677
G1 X135.976 Y186.065 E.01641
G1 X186.565 Y135.476 E2.19997
G1 X186.565 Y134.942 E.01641
G1 X135.442 Y186.065 E2.22318
G1 X134.909 Y186.065 E.01641
G1 X186.565 Y134.409 E2.24639
G1 X186.565 Y133.875 E.01641
G1 X134.375 Y186.065 E2.2696
G1 X133.841 Y186.065 E.01641
G1 X186.565 Y133.341 E2.29281
G1 X186.565 Y132.808 E.01641
G1 X133.308 Y186.065 E2.31601
G1 X132.774 Y186.065 E.01641
G1 X186.565 Y132.274 E2.33922
G1 X186.565 Y131.74 E.01641
G1 X132.24 Y186.065 E2.36243
G1 X131.707 Y186.065 E.01641
G1 X186.565 Y131.207 E2.38564
G1 X186.565 Y130.673 E.01641
G1 X131.173 Y186.065 E2.40885
G1 X130.639 Y186.065 E.01641
G1 X186.565 Y130.139 E2.43205
G1 X186.565 Y129.606 E.01641
G1 X130.106 Y186.065 E2.45526
G1 X129.572 Y186.065 E.01641
G1 X186.565 Y129.072 E2.47847
G1 X186.565 Y128.538 E.01641
G1 X129.038 Y186.065 E2.50168
G1 X128.505 Y186.065 E.01641
G1 X186.565 Y128.005 E2.52489
G1 X186.565 Y127.471 E.01641
G1 X127.971 Y186.065 E2.54809
G1 X127.437 Y186.065 E.01641
G1 X186.565 Y126.937 E2.5713
G1 X186.565 Y126.404 E.01641
G1 X126.904 Y186.065 E2.59451
G1 X126.37 Y186.065 E.01641
G1 X186.565 Y125.87 E2.61772
G1 X186.565 Y125.336 E.01641
G1 X125.836 Y186.065 E2.64093
G1 X125.303 Y186.065 E.01641
G1 X186.565 Y124.803 E2.66414
G1 X186.565 Y124.269 E.01641
G1 X124.769 Y186.065 E2.68734
G1 X124.235 Y186.065 E.01641
G1 X186.565 Y123.735 E2.71055
G1 X186.565 Y123.202 E.01641
G1 X123.702 Y186.065 E2.73376
G1 X123.168 Y186.065 E.01641
G1 X186.565 Y122.668 E2.75697
G1 X186.565 Y122.134 E.01641
G1 X122.634 Y186.065 E2.78018
G1 X122.101 Y186.065 E.01641
G1 X186.565 Y121.601 E2.80338
G1 X186.565 Y121.067 E.01641
G1 X121.567 Y186.065 E2.82659
G1 X121.033 Y186.065 E.01641
G1 X186.565 Y120.533 E2.8498
G1 X186.565 Y120 E.01641
G1 X120.5 Y186.065 E2.87301
G1 X119.966 Y186.065 E.01641
G1 X186.565 Y119.466 E2.89622
G1 X186.565 Y118.932 E.01641
G1 X119.432 Y186.065 E2.91942
G1 X118.898 Y186.065 E.01641
G1 X186.565 Y118.399 E2.94263
G1 X186.565 Y117.865 E.01641
G1 X118.365 Y186.065 E2.96584
G1 X117.831 Y186.065 E.01641
G1 X186.565 Y117.331 E2.98905
G1 X186.565 Y116.797 E.01641
G1 X117.297 Y186.065 E3.01226
G1 X116.764 Y186.065 E.01641
G1 X186.565 Y116.264 E3.03546
G1 X186.565 Y115.73 E.01641
G1 X116.23 Y186.065 E3.05867
G1 X115.696 Y186.065 E.01641
G1 X186.565 Y115.196 E3.08188
G1 X186.565 Y114.663 E.01641
G1 X115.163 Y186.065 E3.10509
G1 X114.629 Y186.065 E.01641
G1 X186.565 Y114.129 E3.1283
G1 X186.565 Y113.595 E.01641
G1 X114.095 Y186.065 E3.1515
G1 X113.562 Y186.065 E.01641
G1 X186.565 Y113.062 E3.17471
G1 X186.565 Y112.528 E.01641
G1 X113.028 Y186.065 E3.19792
G1 X112.494 Y186.065 E.01641
G1 X128.624 Y169.935 E.70142
G1 X128.09 Y169.935 E.01641
G1 X111.961 Y186.065 E.70142
G1 X111.427 Y186.065 E.01641
G1 X127.556 Y169.935 E.70142
G1 X127.023 Y169.935 E.01641
G1 X110.893 Y186.065 E.70142
G1 X110.36 Y186.065 E.01641
G1 X126.489 Y169.935 E.70142
G1 X125.955 Y169.935 E.01641
G1 X109.826 Y186.065 E.70142
G1 X109.292 Y186.065 E.01641
G1 X125.422 Y169.935 E.70142
G1 X124.888 Y169.935 E.01641
G1 X108.759 Y186.065 E.70142
G1 X108.225 Y186.065 E.01641
G1 X124.354 Y169.935 E.70142
G1 X123.821 Y169.935 E.01641
G1 X107.691 Y186.065 E.70142
G1 X107.158 Y186.065 E.01641
G1 X123.287 Y169.935 E.70142
G1 X122.753 Y169.935 E.01641
G1 X106.624 Y186.065 E.70142
G1 X106.09 Y186.065 E.01641
G1 X122.22 Y169.935 E.70142
G1 X121.686 Y169.935 E.01641
G1 X105.557 Y186.065 E.70142
G1 X105.023 Y186.065 E.01641
G1 X121.152 Y169.935 E.70142
G1 X120.619 Y169.935 E.01641
G1 X104.489 Y186.065 E.70142
G1 X103.956 Y186.065 E.01641
G1 X120.085 Y169.935 E.70142
G1 X119.551 Y169.935 E.01641
G1 X103.422 Y186.065 E.70142
G1 X102.888 Y186.065 E.01641
G1 X119.018 Y169.935 E.70142
G1 X118.484 Y169.935 E.01641
G1 X102.355 Y186.065 E.70142
G1 X101.821 Y186.065 E.01641
G1 X117.95 Y169.935 E.70142
G1 X117.417 Y169.935 E.01641
G1 X101.287 Y186.065 E.70142
M73 P28 R38
G1 X100.754 Y186.065 E.01641
G1 X116.883 Y169.935 E.70142
G1 X116.349 Y169.935 E.01641
G1 X100.22 Y186.065 E.70142
G1 X99.686 Y186.065 E.01641
G1 X115.816 Y169.935 E.70142
G1 X115.282 Y169.935 E.01641
G1 X99.153 Y186.065 E.70142
G1 X98.619 Y186.065 E.01641
G1 X114.748 Y169.935 E.70142
G1 X114.215 Y169.935 E.01641
G1 X98.085 Y186.065 E.70142
G1 X97.552 Y186.065 E.01641
G1 X113.681 Y169.935 E.70142
G1 X113.147 Y169.935 E.01641
G1 X97.018 Y186.065 E.70142
G1 X96.484 Y186.065 E.01641
G1 X112.614 Y169.935 E.70142
G1 X112.08 Y169.935 E.01641
G1 X95.951 Y186.065 E.70142
G1 X95.417 Y186.065 E.01641
G1 X111.546 Y169.935 E.70142
G1 X111.013 Y169.935 E.01641
G1 X94.883 Y186.065 E.70142
G1 X94.35 Y186.065 E.01641
G1 X110.479 Y169.935 E.70142
G1 X109.945 Y169.935 E.01641
G1 X93.816 Y186.065 E.70142
G1 X93.282 Y186.065 E.01641
G1 X109.412 Y169.935 E.70142
G1 X108.878 Y169.935 E.01641
G1 X92.749 Y186.065 E.70142
G1 X92.215 Y186.065 E.01641
G1 X108.344 Y169.935 E.70142
G1 X107.811 Y169.935 E.01641
G1 X91.681 Y186.065 E.70142
G1 X91.148 Y186.065 E.01641
G1 X107.277 Y169.935 E.70142
G1 X106.743 Y169.935 E.01641
G1 X90.614 Y186.065 E.70142
G1 X90.08 Y186.065 E.01641
G1 X106.21 Y169.935 E.70142
G1 X105.676 Y169.935 E.01641
G1 X89.547 Y186.065 E.70142
G1 X89.013 Y186.065 E.01641
G1 X105.142 Y169.935 E.70142
G1 X104.609 Y169.935 E.01641
G1 X88.479 Y186.065 E.70142
G1 X87.946 Y186.065 E.01641
G1 X104.075 Y169.935 E.70142
G1 X103.541 Y169.935 E.01641
G1 X87.412 Y186.065 E.70142
G1 X86.878 Y186.065 E.01641
G1 X103.007 Y169.935 E.70142
G1 X102.474 Y169.935 E.01641
G1 X86.345 Y186.065 E.70142
G1 X85.811 Y186.065 E.01641
G1 X101.94 Y169.935 E.70142
G1 X101.406 Y169.935 E.01641
G1 X85.277 Y186.065 E.70142
G1 X84.743 Y186.065 E.01641
G1 X100.873 Y169.935 E.70142
G1 X100.339 Y169.935 E.01641
G1 X84.21 Y186.065 E.70142
G1 X83.676 Y186.065 E.01641
G1 X99.805 Y169.935 E.70142
G1 X99.272 Y169.935 E.01641
G1 X83.142 Y186.065 E.70142
G1 X82.609 Y186.065 E.01641
G1 X98.738 Y169.935 E.70142
G1 X98.204 Y169.935 E.01641
G1 X82.075 Y186.065 E.70142
G1 X81.541 Y186.065 E.01641
G1 X97.671 Y169.935 E.70142
G1 X97.137 Y169.935 E.01641
G1 X81.008 Y186.065 E.70142
G1 X80.474 Y186.065 E.01641
G1 X96.603 Y169.935 E.70142
G1 X96.07 Y169.935 E.01641
G1 X79.94 Y186.065 E.70142
G1 X79.407 Y186.065 E.01641
G1 X95.536 Y169.935 E.70142
G1 X95.002 Y169.935 E.01641
G1 X78.873 Y186.065 E.70142
G1 X78.339 Y186.065 E.01641
G1 X94.469 Y169.935 E.70142
G1 X93.935 Y169.935 E.01641
G1 X77.806 Y186.065 E.70142
G1 X77.272 Y186.065 E.01641
G1 X93.401 Y169.935 E.70142
G1 X92.868 Y169.935 E.01641
G1 X76.738 Y186.065 E.70142
G1 X76.205 Y186.065 E.01641
G1 X92.334 Y169.935 E.70142
G1 X91.8 Y169.935 E.01641
G1 X75.671 Y186.065 E.70142
G1 X75.137 Y186.065 E.01641
G1 X91.267 Y169.935 E.70142
G1 X90.733 Y169.935 E.01641
G1 X74.604 Y186.065 E.70142
G1 X74.07 Y186.065 E.01641
G1 X90.199 Y169.935 E.70142
G1 X89.666 Y169.935 E.01641
G1 X73.536 Y186.065 E.70142
G1 X73.435 Y186.065 E.00311
G1 X73.435 Y185.632 E.0133
G1 X89.132 Y169.935 E.68261
G1 X88.598 Y169.935 E.01641
G1 X73.435 Y185.098 E.6594
G1 X73.435 Y184.565 E.01641
G1 X88.065 Y169.935 E.63619
G1 X87.531 Y169.935 E.01641
G1 X73.435 Y184.031 E.61298
G1 X73.435 Y183.497 E.01641
G1 X86.997 Y169.935 E.58978
G1 X86.464 Y169.935 E.01641
G1 X73.435 Y182.964 E.56657
G1 X73.435 Y182.43 E.01641
G1 X85.93 Y169.935 E.54336
G1 X85.396 Y169.935 E.01641
G1 X73.435 Y181.896 E.52015
G1 X73.435 Y181.363 E.01641
G1 X84.863 Y169.935 E.49694
G1 X84.329 Y169.935 E.01641
G1 X73.435 Y180.829 E.47374
G1 X73.435 Y180.295 E.01641
G1 X83.795 Y169.935 E.45053
G1 X83.262 Y169.935 E.01641
G1 X73.435 Y179.762 E.42732
G1 X73.435 Y179.228 E.01641
G1 X82.728 Y169.935 E.40411
G1 X82.194 Y169.935 E.01641
G1 X73.435 Y178.694 E.3809
G1 X73.435 Y178.161 E.01641
G1 X81.661 Y169.935 E.3577
G1 X81.127 Y169.935 E.01641
G1 X73.435 Y177.627 E.33449
G1 X73.435 Y177.093 E.01641
G1 X80.593 Y169.935 E.31128
G1 X80.06 Y169.935 E.01641
G1 X73.435 Y176.56 E.28807
G1 X73.435 Y176.026 E.01641
G1 X79.526 Y169.935 E.26486
G1 X78.992 Y169.935 E.01641
G1 X73.435 Y175.492 E.24166
G1 X73.435 Y174.959 E.01641
G1 X78.565 Y169.829 E.22306
G1 X78.565 Y169.296 E.01641
G1 X73.435 Y174.425 E.22306
G1 X73.435 Y173.891 E.01641
G1 X78.565 Y168.762 E.22306
G1 X78.565 Y168.228 E.01641
G1 X73.435 Y173.358 E.22306
G1 X73.435 Y172.824 E.01641
G1 X78.565 Y167.695 E.22306
G1 X78.565 Y167.161 E.01641
G1 X73.435 Y172.29 E.22306
G1 X73.435 Y171.757 E.01641
G1 X78.565 Y166.627 E.22306
G1 X78.565 Y166.094 E.01641
G1 X73.435 Y171.223 E.22306
G1 X73.435 Y170.689 E.01641
G1 X78.565 Y165.56 E.22306
G1 X78.565 Y165.026 E.01641
G1 X73.435 Y170.156 E.22306
G1 X73.435 Y169.622 E.01641
G1 X78.565 Y164.493 E.22306
G1 X78.565 Y163.959 E.01641
G1 X73.435 Y169.088 E.22306
G1 X73.435 Y168.555 E.01641
G1 X78.565 Y163.425 E.22306
G1 X78.565 Y162.892 E.01641
G1 X73.435 Y168.021 E.22306
G1 X73.435 Y167.487 E.01641
G1 X78.565 Y162.358 E.22306
G1 X78.565 Y161.824 E.01641
G1 X73.435 Y166.954 E.22306
G1 X73.435 Y166.42 E.01641
G1 X78.565 Y161.291 E.22306
G1 X78.565 Y160.757 E.01641
G1 X73.435 Y165.886 E.22306
G1 X73.435 Y165.352 E.01641
G1 X78.565 Y160.223 E.22306
G1 X78.565 Y159.69 E.01641
G1 X73.435 Y164.819 E.22306
G1 X73.435 Y164.285 E.01641
G1 X78.565 Y159.156 E.22306
G1 X78.565 Y158.622 E.01641
G1 X73.435 Y163.751 E.22306
G1 X73.435 Y163.218 E.01641
G1 X78.565 Y158.088 E.22306
G1 X78.565 Y157.555 E.01641
G1 X73.435 Y162.684 E.22306
G1 X73.435 Y162.15 E.01641
G1 X78.565 Y157.021 E.22306
G1 X78.565 Y156.487 E.01641
G1 X73.435 Y161.617 E.22306
G1 X73.435 Y161.083 E.01641
G1 X78.565 Y155.954 E.22306
G1 X78.565 Y155.42 E.01641
G1 X73.435 Y160.549 E.22306
G1 X73.435 Y160.016 E.01641
G1 X78.565 Y154.886 E.22306
G1 X78.565 Y154.353 E.01641
G1 X73.435 Y159.482 E.22306
G1 X73.435 Y158.948 E.01641
G1 X78.565 Y153.819 E.22306
G1 X78.565 Y153.285 E.01641
G1 X73.435 Y158.415 E.22306
G1 X73.435 Y157.881 E.01641
G1 X78.565 Y152.752 E.22306
G1 X78.565 Y152.218 E.01641
G1 X73.435 Y157.347 E.22306
G1 X73.435 Y156.814 E.01641
G1 X78.565 Y151.684 E.22306
G1 X78.565 Y151.151 E.01641
G1 X73.435 Y156.28 E.22306
G1 X73.435 Y155.746 E.01641
G1 X78.565 Y150.617 E.22306
G1 X78.565 Y150.083 E.01641
G1 X73.435 Y155.213 E.22306
G1 X73.435 Y154.679 E.01641
G1 X78.565 Y149.55 E.22306
G1 X78.565 Y149.016 E.01641
G1 X73.435 Y154.145 E.22306
G1 X73.435 Y153.612 E.01641
G1 X78.565 Y148.482 E.22306
G1 X78.565 Y147.949 E.01641
G1 X73.435 Y153.078 E.22306
G1 X73.435 Y152.544 E.01641
G1 X78.565 Y147.415 E.22306
G1 X78.565 Y146.881 E.01641
G1 X73.435 Y152.011 E.22306
G1 X73.435 Y151.477 E.01641
G1 X78.565 Y146.348 E.22306
G1 X78.565 Y145.814 E.01641
G1 X73.435 Y150.943 E.22306
G1 X73.435 Y150.41 E.01641
G1 X78.565 Y145.28 E.22306
G1 X78.565 Y144.747 E.01641
G1 X73.435 Y149.876 E.22306
G1 X73.435 Y149.342 E.01641
G1 X78.565 Y144.213 E.22306
G1 X78.565 Y143.679 E.01641
G1 X73.435 Y148.809 E.22306
G1 X73.435 Y148.275 E.01641
G1 X78.565 Y143.146 E.22306
G1 X78.565 Y142.612 E.01641
G1 X73.435 Y147.741 E.22306
G1 X73.435 Y147.208 E.01641
G1 X78.565 Y142.078 E.22306
G1 X78.565 Y141.545 E.01641
G1 X73.435 Y146.674 E.22306
G1 X73.435 Y146.14 E.01641
G1 X78.565 Y141.011 E.22306
G1 X78.565 Y140.477 E.01641
G1 X73.435 Y145.607 E.22306
G1 X73.435 Y145.073 E.01641
G1 X78.565 Y139.944 E.22306
G1 X78.565 Y139.41 E.01641
G1 X73.435 Y144.539 E.22306
G1 X73.435 Y144.006 E.01641
G1 X78.565 Y138.876 E.22306
G1 X78.565 Y138.343 E.01641
G1 X73.435 Y143.472 E.22306
G1 X73.435 Y142.938 E.01641
G1 X78.565 Y137.809 E.22306
G1 X78.565 Y137.275 E.01641
G1 X73.435 Y142.405 E.22306
G1 X73.435 Y141.871 E.01641
G1 X78.565 Y136.742 E.22306
G1 X78.565 Y136.208 E.01641
G1 X73.435 Y141.337 E.22306
G1 X73.435 Y140.804 E.01641
G1 X78.565 Y135.674 E.22306
G1 X78.565 Y135.141 E.01641
G1 X73.435 Y140.27 E.22306
G1 X73.435 Y139.736 E.01641
G1 X78.565 Y134.607 E.22306
G1 X78.565 Y134.073 E.01641
G1 X73.435 Y139.203 E.22306
G1 X73.435 Y138.669 E.01641
G1 X78.565 Y133.54 E.22306
G1 X78.565 Y133.006 E.01641
G1 X73.435 Y138.135 E.22306
G1 X73.435 Y137.602 E.01641
G1 X78.565 Y132.472 E.22306
G1 X78.565 Y131.939 E.01641
G1 X73.435 Y137.068 E.22306
G1 X73.435 Y136.534 E.01641
G1 X78.565 Y131.405 E.22306
G1 X78.565 Y130.871 E.01641
G1 X73.435 Y136.001 E.22306
G1 X73.435 Y135.467 E.01641
G1 X78.565 Y130.338 E.22306
G1 X78.565 Y129.804 E.01641
G1 X73.435 Y134.933 E.22306
G1 X73.435 Y134.4 E.01641
G1 X78.565 Y129.27 E.22306
G1 X78.565 Y128.737 E.01641
G1 X73.435 Y133.866 E.22306
G1 X73.435 Y133.332 E.01641
G1 X78.565 Y128.203 E.22306
G1 X78.565 Y127.669 E.01641
G1 X73.435 Y132.799 E.22306
G1 X73.435 Y132.265 E.01641
G1 X78.565 Y127.136 E.22306
G1 X78.565 Y126.602 E.01641
G1 X73.435 Y131.731 E.22306
G1 X73.435 Y131.197 E.01641
G1 X78.565 Y126.068 E.22306
G1 X78.565 Y125.535 E.01641
G1 X73.435 Y130.664 E.22306
G1 X73.435 Y130.13 E.01641
G1 X78.565 Y125.001 E.22306
G1 X78.565 Y124.467 E.01641
G1 X73.435 Y129.596 E.22306
G1 X73.435 Y129.063 E.01641
G1 X78.565 Y123.933 E.22306
G1 X78.565 Y123.4 E.01641
G1 X73.435 Y128.529 E.22306
G1 X73.435 Y127.995 E.01641
G1 X78.565 Y122.866 E.22306
G1 X78.565 Y122.332 E.01641
G1 X73.435 Y127.462 E.22306
G1 X73.435 Y126.928 E.01641
G1 X78.565 Y121.799 E.22306
G1 X78.565 Y121.265 E.01641
G1 X73.435 Y126.394 E.22306
G1 X73.435 Y125.861 E.01641
G1 X78.565 Y120.731 E.22306
G1 X78.565 Y120.198 E.01641
G1 X73.435 Y125.327 E.22306
G1 X73.435 Y124.793 E.01641
G1 X78.565 Y119.664 E.22306
G1 X78.565 Y119.13 E.01641
G1 X73.435 Y124.26 E.22306
G1 X73.435 Y123.726 E.01641
G1 X78.565 Y118.597 E.22306
G1 X78.565 Y118.063 E.01641
G1 X73.435 Y123.192 E.22306
G1 X73.435 Y122.659 E.01641
G1 X78.565 Y117.529 E.22306
G1 X78.565 Y116.996 E.01641
G1 X73.435 Y122.125 E.22306
G1 X73.435 Y121.591 E.01641
G1 X78.565 Y116.462 E.22306
G1 X78.565 Y115.928 E.01641
G1 X73.435 Y121.058 E.22306
G1 X73.435 Y120.524 E.01641
G1 X78.565 Y115.395 E.22306
G1 X78.565 Y114.861 E.01641
G1 X73.435 Y119.99 E.22306
G1 X73.435 Y119.457 E.01641
G1 X78.565 Y114.327 E.22306
G1 X78.565 Y113.794 E.01641
G1 X73.435 Y118.923 E.22306
G1 X73.435 Y118.389 E.01641
G1 X78.565 Y113.26 E.22306
G1 X78.565 Y112.726 E.01641
G1 X73.435 Y117.856 E.22306
G1 X73.435 Y117.322 E.01641
G1 X78.565 Y112.193 E.22306
G1 X78.565 Y111.659 E.01641
G1 X73.435 Y116.788 E.22306
G1 X73.435 Y116.255 E.01641
G1 X78.565 Y111.125 E.22306
G1 X78.565 Y110.592 E.01641
G1 X73.435 Y115.721 E.22306
G1 X73.435 Y115.187 E.01641
G1 X78.565 Y110.058 E.22306
G1 X78.565 Y109.524 E.01641
G1 X73.435 Y114.654 E.22306
G1 X73.435 Y114.12 E.01641
G1 X78.565 Y108.991 E.22306
G1 X78.565 Y108.457 E.01641
G1 X73.435 Y113.586 E.22306
G1 X73.435 Y113.053 E.01641
G1 X78.565 Y107.923 E.22306
G1 X78.565 Y107.39 E.01641
G1 X73.435 Y112.519 E.22306
G1 X73.435 Y111.985 E.01641
G1 X78.565 Y106.856 E.22306
G1 X78.565 Y106.322 E.01641
G1 X73.435 Y111.452 E.22306
G1 X73.435 Y110.918 E.01641
G1 X78.565 Y105.789 E.22306
G1 X78.565 Y105.255 E.01641
G1 X73.435 Y110.384 E.22306
G1 X73.435 Y109.851 E.01641
G1 X78.565 Y104.721 E.22306
G1 X78.565 Y104.188 E.01641
G1 X73.435 Y109.317 E.22306
G1 X73.435 Y108.783 E.01641
G1 X78.565 Y103.654 E.22306
G1 X78.565 Y103.12 E.01641
G1 X73.435 Y108.25 E.22306
G1 X73.435 Y107.716 E.01641
G1 X78.565 Y102.587 E.22306
G1 X78.565 Y102.053 E.01641
G1 X73.435 Y107.182 E.22306
G1 X73.435 Y106.649 E.01641
G1 X78.565 Y101.519 E.22306
G1 X78.565 Y100.986 E.01641
G1 X73.435 Y106.115 E.22306
G1 X73.435 Y105.581 E.01641
G1 X78.565 Y100.452 E.22306
G1 X78.565 Y99.918 E.01641
G1 X73.435 Y105.048 E.22306
G1 X73.435 Y104.514 E.01641
G1 X78.565 Y99.385 E.22306
G1 X78.565 Y98.851 E.01641
G1 X73.435 Y103.98 E.22306
G1 X73.435 Y103.447 E.01641
G1 X78.565 Y98.317 E.22306
G1 X78.565 Y97.784 E.01641
G1 X73.435 Y102.913 E.22306
G1 X73.435 Y102.379 E.01641
G1 X78.565 Y97.25 E.22306
G1 X78.565 Y96.716 E.01641
G1 X73.435 Y101.846 E.22306
G1 X73.435 Y101.312 E.01641
G1 X78.565 Y96.183 E.22306
G1 X78.565 Y95.649 E.01641
G1 X73.435 Y100.778 E.22306
G1 X73.435 Y100.245 E.01641
G1 X78.565 Y95.115 E.22306
G1 X78.565 Y94.582 E.01641
G1 X73.435 Y99.711 E.22306
G1 X73.435 Y99.177 E.01641
G1 X78.565 Y94.048 E.22306
G1 X78.565 Y93.514 E.01641
G1 X73.435 Y98.644 E.22306
G1 X73.435 Y98.11 E.01641
G1 X78.565 Y92.981 E.22306
G1 X78.565 Y92.447 E.01641
G1 X73.435 Y97.576 E.22306
G1 X73.435 Y97.043 E.01641
G1 X78.565 Y91.913 E.22306
G1 X78.565 Y91.38 E.01641
G1 X73.435 Y96.509 E.22306
G1 X73.435 Y95.975 E.01641
G1 X78.565 Y90.846 E.22306
G1 X78.565 Y90.312 E.01641
G1 X73.435 Y95.441 E.22306
G1 X73.435 Y94.908 E.01641
G1 X78.565 Y89.779 E.22306
G1 X78.565 Y89.245 E.01641
G1 X73.435 Y94.374 E.22306
G1 X73.435 Y93.84 E.01641
G1 X78.734 Y88.541 E.23044
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X77.32 Y89.956 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/125
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
G3 Z.8 I-1.02 J.663 P1  F30000
G1 X129.102 Y169.602 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X78.898 Y169.602 E1.66536
G1 X78.898 Y88.398 E2.69369
G1 X129.102 Y88.398 E1.66536
G1 X129.102 Y169.542 E2.6917
G1 X128.71 Y169.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.29 Y169.21 E1.51854
G1 X79.29 Y88.79 E2.47108
G1 X128.71 Y88.79 E1.51854
G1 X128.71 Y169.15 E2.46924
M204 S10000
; WIPE_START
G1 F24000
G1 X126.71 Y169.152 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.071 J-.577 P1  F30000
G1 X73.102 Y69.602 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X186.898 Y69.602 E3.77482
G1 X186.898 Y186.398 E3.87433
G1 X73.102 Y186.398 E3.77482
G1 X73.102 Y69.662 E3.87234
G1 X72.71 Y69.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X187.29 Y69.21 E3.52072
G1 X187.29 Y186.79 E3.61291
G1 X72.71 Y186.79 E3.52072
G1 X72.71 Y69.27 E3.61106
M204 S10000
; WIPE_START
G1 F24000
G1 X74.71 Y69.269 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.014 J1.217 P1  F30000
G1 X186.734 Y70.529 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420283
G1 F15000
G1 X186.141 Y69.935 E.0258
G1 X185.607 Y69.935 E.01641
G1 X186.565 Y70.893 E.04163
G1 X186.565 Y71.426 E.01641
G1 X185.074 Y69.935 E.06483
G1 X184.54 Y69.935 E.01641
G1 X186.565 Y71.96 E.08804
G1 X186.565 Y72.494 E.01641
G1 X184.006 Y69.935 E.11125
G1 X183.473 Y69.935 E.01641
G1 X186.565 Y73.027 E.13446
G1 X186.565 Y73.561 E.01641
G1 X182.939 Y69.935 E.15767
G1 X182.405 Y69.935 E.01641
G1 X186.565 Y74.095 E.18087
G1 X186.565 Y74.628 E.01641
G1 X181.872 Y69.935 E.20408
G1 X181.338 Y69.935 E.01641
G1 X186.565 Y75.162 E.22729
G1 X186.565 Y75.696 E.01641
G1 X180.804 Y69.935 E.2505
G1 X180.271 Y69.935 E.01641
G1 X186.565 Y76.229 E.27371
G1 X186.565 Y76.763 E.01641
G1 X179.737 Y69.935 E.29691
G1 X179.203 Y69.935 E.01641
G1 X186.565 Y77.297 E.32012
G1 X186.565 Y77.83 E.01641
G1 X178.67 Y69.935 E.34333
G1 X178.136 Y69.935 E.01641
G1 X186.565 Y78.364 E.36654
G1 X186.565 Y78.898 E.01641
G1 X177.602 Y69.935 E.38975
G1 X177.069 Y69.935 E.01641
G1 X186.565 Y79.431 E.41295
G1 X186.565 Y79.965 E.01641
G1 X176.535 Y69.935 E.43616
G1 X176.001 Y69.935 E.01641
G1 X186.565 Y80.499 E.45937
G1 X186.565 Y81.032 E.01641
G1 X175.468 Y69.935 E.48258
G1 X174.934 Y69.935 E.01641
G1 X186.565 Y81.566 E.50579
G1 X186.565 Y82.1 E.01641
G1 X174.4 Y69.935 E.52899
G1 X173.867 Y69.935 E.01641
G1 X186.565 Y82.633 E.5522
G1 X186.565 Y83.167 E.01641
G1 X173.333 Y69.935 E.57541
G1 X172.799 Y69.935 E.01641
G1 X186.565 Y83.701 E.59862
G1 X186.565 Y84.234 E.01641
G1 X172.266 Y69.935 E.62183
G1 X171.732 Y69.935 E.01641
G1 X186.565 Y84.768 E.64503
G1 X186.565 Y85.302 E.01641
G1 X171.198 Y69.935 E.66824
G1 X170.665 Y69.935 E.01641
G1 X186.565 Y85.835 E.69145
G1 X186.565 Y86.369 E.01641
G1 X170.131 Y69.935 E.71466
G1 X169.597 Y69.935 E.01641
G1 X186.565 Y86.903 E.73787
G1 X186.565 Y87.436 E.01641
G1 X169.064 Y69.935 E.76107
G1 X168.53 Y69.935 E.01641
G1 X186.565 Y87.97 E.78428
G1 X186.565 Y88.504 E.01641
G1 X167.996 Y69.935 E.80749
M73 P28 R37
G1 X167.463 Y69.935 E.01641
G1 X186.565 Y89.037 E.8307
G1 X186.565 Y89.571 E.01641
G1 X166.929 Y69.935 E.85391
G1 X166.395 Y69.935 E.01641
G1 X186.565 Y90.105 E.87711
G1 X186.565 Y90.638 E.01641
G1 X165.862 Y69.935 E.90032
G1 X165.328 Y69.935 E.01641
G1 X186.565 Y91.172 E.92353
M73 P29 R37
G1 X186.565 Y91.706 E.01641
G1 X164.794 Y69.935 E.94674
G1 X164.261 Y69.935 E.01641
G1 X186.565 Y92.239 E.96995
G1 X186.565 Y92.773 E.01641
G1 X163.727 Y69.935 E.99316
G1 X163.193 Y69.935 E.01641
G1 X186.565 Y93.307 E1.01636
G1 X186.565 Y93.84 E.01641
G1 X162.66 Y69.935 E1.03957
G1 X162.126 Y69.935 E.01641
G1 X186.565 Y94.374 E1.06278
G1 X186.565 Y94.908 E.01641
G1 X161.592 Y69.935 E1.08599
G1 X161.059 Y69.935 E.01641
G1 X186.565 Y95.441 E1.1092
G1 X186.565 Y95.975 E.01641
G1 X160.525 Y69.935 E1.1324
G1 X159.991 Y69.935 E.01641
G1 X186.565 Y96.509 E1.15561
G1 X186.565 Y97.042 E.01641
G1 X159.458 Y69.935 E1.17882
G1 X158.924 Y69.935 E.01641
G1 X186.565 Y97.576 E1.20203
G1 X186.565 Y98.11 E.01641
G1 X158.39 Y69.935 E1.22524
G1 X157.857 Y69.935 E.01641
G1 X186.565 Y98.643 E1.24844
G1 X186.565 Y99.177 E.01641
G1 X157.323 Y69.935 E1.27165
G1 X156.789 Y69.935 E.01641
G1 X186.565 Y99.711 E1.29486
G1 X186.565 Y100.244 E.01641
G1 X156.256 Y69.935 E1.31807
G1 X155.722 Y69.935 E.01641
G1 X186.565 Y100.778 E1.34128
G1 X186.565 Y101.312 E.01641
G1 X155.188 Y69.935 E1.36448
G1 X154.655 Y69.935 E.01641
G1 X186.565 Y101.845 E1.38769
G1 X186.565 Y102.379 E.01641
G1 X154.121 Y69.935 E1.4109
G1 X153.587 Y69.935 E.01641
G1 X186.565 Y102.913 E1.43411
G1 X186.565 Y103.446 E.01641
G1 X153.054 Y69.935 E1.45732
G1 X152.52 Y69.935 E.01641
G1 X186.565 Y103.98 E1.48052
G1 X186.565 Y104.514 E.01641
G1 X151.986 Y69.935 E1.50373
G1 X151.452 Y69.935 E.01641
G1 X186.565 Y105.048 E1.52694
G1 X186.565 Y105.581 E.01641
G1 X150.919 Y69.935 E1.55015
G1 X150.385 Y69.935 E.01641
G1 X186.565 Y106.115 E1.57336
G1 X186.565 Y106.649 E.01641
G1 X149.851 Y69.935 E1.59656
G1 X149.318 Y69.935 E.01641
G1 X186.565 Y107.182 E1.61977
G1 X186.565 Y107.716 E.01641
G1 X148.784 Y69.935 E1.64298
G1 X148.25 Y69.935 E.01641
G1 X186.565 Y108.25 E1.66619
G1 X186.565 Y108.783 E.01641
G1 X147.717 Y69.935 E1.6894
G1 X147.183 Y69.935 E.01641
G1 X186.565 Y109.317 E1.7126
G1 X186.565 Y109.851 E.01641
G1 X146.649 Y69.935 E1.73581
G1 X146.116 Y69.935 E.01641
G1 X186.565 Y110.384 E1.75902
G1 X186.565 Y110.918 E.01641
G1 X145.582 Y69.935 E1.78223
G1 X145.048 Y69.935 E.01641
G1 X186.565 Y111.452 E1.80544
G1 X186.565 Y111.985 E.01641
G1 X144.515 Y69.935 E1.82865
G1 X143.981 Y69.935 E.01641
G1 X186.565 Y112.519 E1.85185
G1 X186.565 Y113.053 E.01641
G1 X143.447 Y69.935 E1.87506
G1 X142.914 Y69.935 E.01641
G1 X186.565 Y113.586 E1.89827
G1 X186.565 Y114.12 E.01641
G1 X142.38 Y69.935 E1.92148
G1 X141.846 Y69.935 E.01641
G1 X186.565 Y114.654 E1.94469
G1 X186.565 Y115.187 E.01641
G1 X141.313 Y69.935 E1.96789
G1 X140.779 Y69.935 E.01641
G1 X186.565 Y115.721 E1.9911
G1 X186.565 Y116.255 E.01641
G1 X140.245 Y69.935 E2.01431
G1 X139.712 Y69.935 E.01641
G1 X186.565 Y116.788 E2.03752
G1 X186.565 Y117.322 E.01641
G1 X139.178 Y69.935 E2.06073
G1 X138.644 Y69.935 E.01641
G1 X186.565 Y117.856 E2.08393
G1 X186.565 Y118.389 E.01641
G1 X138.111 Y69.935 E2.10714
G1 X137.577 Y69.935 E.01641
G1 X186.565 Y118.923 E2.13035
G1 X186.565 Y119.457 E.01641
G1 X137.043 Y69.935 E2.15356
G1 X136.51 Y69.935 E.01641
G1 X186.565 Y119.99 E2.17677
G1 X186.565 Y120.524 E.01641
G1 X135.976 Y69.935 E2.19997
G1 X135.442 Y69.935 E.01641
G1 X186.565 Y121.058 E2.22318
G1 X186.565 Y121.591 E.01641
G1 X134.909 Y69.935 E2.24639
G1 X134.375 Y69.935 E.01641
G1 X186.565 Y122.125 E2.2696
G1 X186.565 Y122.659 E.01641
G1 X133.841 Y69.935 E2.29281
G1 X133.308 Y69.935 E.01641
G1 X186.565 Y123.192 E2.31601
G1 X186.565 Y123.726 E.01641
G1 X132.774 Y69.935 E2.33922
G1 X132.24 Y69.935 E.01641
G1 X186.565 Y124.26 E2.36243
G1 X186.565 Y124.793 E.01641
G1 X131.707 Y69.935 E2.38564
G1 X131.173 Y69.935 E.01641
G1 X186.565 Y125.327 E2.40885
G1 X186.565 Y125.861 E.01641
G1 X130.639 Y69.935 E2.43205
G1 X130.106 Y69.935 E.01641
G1 X186.565 Y126.394 E2.45526
G1 X186.565 Y126.928 E.01641
G1 X129.572 Y69.935 E2.47847
G1 X129.038 Y69.935 E.01641
G1 X186.565 Y127.462 E2.50168
G1 X186.565 Y127.995 E.01641
G1 X128.505 Y69.935 E2.52489
G1 X127.971 Y69.935 E.01641
G1 X186.565 Y128.529 E2.54809
G1 X186.565 Y129.063 E.01641
G1 X127.437 Y69.935 E2.5713
G1 X126.904 Y69.935 E.01641
G1 X186.565 Y129.596 E2.59451
G1 X186.565 Y130.13 E.01641
G1 X126.37 Y69.935 E2.61772
G1 X125.836 Y69.935 E.01641
G1 X186.565 Y130.664 E2.64093
G1 X186.565 Y131.197 E.01641
G1 X125.303 Y69.935 E2.66414
G1 X124.769 Y69.935 E.01641
G1 X186.565 Y131.731 E2.68734
G1 X186.565 Y132.265 E.01641
G1 X124.235 Y69.935 E2.71055
G1 X123.702 Y69.935 E.01641
G1 X186.565 Y132.798 E2.73376
G1 X186.565 Y133.332 E.01641
G1 X123.168 Y69.935 E2.75697
G1 X122.634 Y69.935 E.01641
G1 X186.565 Y133.866 E2.78018
G1 X186.565 Y134.399 E.01641
G1 X122.101 Y69.935 E2.80338
G1 X121.567 Y69.935 E.01641
G1 X186.565 Y134.933 E2.82659
G1 X186.565 Y135.467 E.01641
G1 X121.033 Y69.935 E2.8498
G1 X120.5 Y69.935 E.01641
G1 X186.565 Y136 E2.87301
G1 X186.565 Y136.534 E.01641
G1 X119.966 Y69.935 E2.89622
G1 X119.432 Y69.935 E.01641
G1 X186.565 Y137.068 E2.91942
G1 X186.565 Y137.601 E.01641
G1 X118.899 Y69.935 E2.94263
G1 X118.365 Y69.935 E.01641
G1 X186.565 Y138.135 E2.96584
G1 X186.565 Y138.669 E.01641
G1 X117.831 Y69.935 E2.98905
G1 X117.297 Y69.935 E.01641
G1 X186.565 Y139.203 E3.01226
G1 X186.565 Y139.736 E.01641
G1 X116.764 Y69.935 E3.03546
G1 X116.23 Y69.935 E.01641
G1 X186.565 Y140.27 E3.05867
G1 X186.565 Y140.804 E.01641
G1 X115.696 Y69.935 E3.08188
G1 X115.163 Y69.935 E.01641
G1 X186.565 Y141.337 E3.10509
G1 X186.565 Y141.871 E.01641
G1 X114.629 Y69.935 E3.1283
G1 X114.095 Y69.935 E.01641
G1 X186.565 Y142.405 E3.1515
G1 X186.565 Y142.938 E.01641
G1 X113.562 Y69.935 E3.17471
G1 X113.028 Y69.935 E.01641
G1 X186.565 Y143.472 E3.19792
G1 X186.565 Y144.006 E.01641
G1 X112.494 Y69.935 E3.22113
G1 X111.961 Y69.935 E.01641
G1 X186.565 Y144.539 E3.24434
G1 X186.565 Y145.073 E.01641
G1 X111.427 Y69.935 E3.26754
G1 X110.893 Y69.935 E.01641
G1 X129.023 Y88.065 E.7884
G1 X128.489 Y88.065 E.01641
G1 X110.36 Y69.935 E.7884
G1 X109.826 Y69.935 E.01641
G1 X127.955 Y88.065 E.7884
G1 X127.422 Y88.065 E.01641
G1 X109.292 Y69.935 E.7884
G1 X108.759 Y69.935 E.01641
G1 X126.888 Y88.065 E.7884
G1 X126.354 Y88.065 E.01641
G1 X108.225 Y69.935 E.7884
G1 X107.691 Y69.935 E.01641
G1 X125.821 Y88.065 E.7884
G1 X125.287 Y88.065 E.01641
G1 X107.158 Y69.935 E.7884
G1 X106.624 Y69.935 E.01641
G1 X124.753 Y88.065 E.7884
G1 X124.22 Y88.065 E.01641
G1 X106.09 Y69.935 E.7884
G1 X105.557 Y69.935 E.01641
G1 X123.686 Y88.065 E.7884
G1 X123.152 Y88.065 E.01641
G1 X105.023 Y69.935 E.7884
G1 X104.489 Y69.935 E.01641
G1 X122.619 Y88.065 E.7884
G1 X122.085 Y88.065 E.01641
G1 X103.956 Y69.935 E.7884
G1 X103.422 Y69.935 E.01641
G1 X121.551 Y88.065 E.7884
G1 X121.018 Y88.065 E.01641
G1 X102.888 Y69.935 E.7884
G1 X102.355 Y69.935 E.01641
G1 X120.484 Y88.065 E.7884
G1 X119.95 Y88.065 E.01641
G1 X101.821 Y69.935 E.7884
G1 X101.287 Y69.935 E.01641
G1 X119.417 Y88.065 E.7884
G1 X118.883 Y88.065 E.01641
G1 X100.754 Y69.935 E.7884
G1 X100.22 Y69.935 E.01641
G1 X118.349 Y88.065 E.7884
M73 P30 R37
G1 X117.816 Y88.065 E.01641
G1 X99.686 Y69.935 E.7884
G1 X99.153 Y69.935 E.01641
G1 X117.282 Y88.065 E.7884
G1 X116.748 Y88.065 E.01641
G1 X98.619 Y69.935 E.7884
G1 X98.085 Y69.935 E.01641
G1 X116.215 Y88.065 E.7884
G1 X115.681 Y88.065 E.01641
G1 X97.552 Y69.935 E.7884
G1 X97.018 Y69.935 E.01641
G1 X115.147 Y88.065 E.7884
G1 X114.614 Y88.065 E.01641
G1 X96.484 Y69.935 E.7884
G1 X95.951 Y69.935 E.01641
G1 X114.08 Y88.065 E.7884
G1 X113.546 Y88.065 E.01641
G1 X95.417 Y69.935 E.7884
G1 X94.883 Y69.935 E.01641
G1 X113.013 Y88.065 E.7884
G1 X112.479 Y88.065 E.01641
G1 X94.35 Y69.935 E.7884
G1 X93.816 Y69.935 E.01641
G1 X111.945 Y88.065 E.7884
G1 X111.412 Y88.065 E.01641
G1 X93.282 Y69.935 E.7884
G1 X92.749 Y69.935 E.01641
G1 X110.878 Y88.065 E.7884
G1 X110.344 Y88.065 E.01641
G1 X92.215 Y69.935 E.7884
G1 X91.681 Y69.935 E.01641
G1 X109.811 Y88.065 E.7884
G1 X109.277 Y88.065 E.01641
G1 X91.148 Y69.935 E.7884
G1 X90.614 Y69.935 E.01641
G1 X108.743 Y88.065 E.7884
G1 X108.21 Y88.065 E.01641
G1 X90.08 Y69.935 E.7884
G1 X89.547 Y69.935 E.01641
G1 X107.676 Y88.065 E.7884
G1 X107.142 Y88.065 E.01641
G1 X89.013 Y69.935 E.7884
G1 X88.479 Y69.935 E.01641
G1 X106.609 Y88.065 E.7884
G1 X106.075 Y88.065 E.01641
G1 X87.946 Y69.935 E.7884
G1 X87.412 Y69.935 E.01641
G1 X105.541 Y88.065 E.7884
G1 X105.007 Y88.065 E.01641
G1 X86.878 Y69.935 E.7884
G1 X86.345 Y69.935 E.01641
G1 X104.474 Y88.065 E.7884
G1 X103.94 Y88.065 E.01641
G1 X85.811 Y69.935 E.7884
G1 X85.277 Y69.935 E.01641
G1 X103.406 Y88.065 E.7884
G1 X102.873 Y88.065 E.01641
G1 X84.744 Y69.935 E.7884
G1 X84.21 Y69.935 E.01641
G1 X102.339 Y88.065 E.7884
G1 X101.805 Y88.065 E.01641
G1 X83.676 Y69.935 E.7884
G1 X83.142 Y69.935 E.01641
G1 X101.272 Y88.065 E.7884
G1 X100.738 Y88.065 E.01641
G1 X82.609 Y69.935 E.7884
G1 X82.075 Y69.935 E.01641
G1 X100.204 Y88.065 E.7884
G1 X99.671 Y88.065 E.01641
G1 X81.541 Y69.935 E.7884
G1 X81.008 Y69.935 E.01641
G1 X99.137 Y88.065 E.7884
G1 X98.603 Y88.065 E.01641
G1 X80.474 Y69.935 E.7884
G1 X79.94 Y69.935 E.01641
G1 X98.07 Y88.065 E.7884
G1 X97.536 Y88.065 E.01641
G1 X79.407 Y69.935 E.7884
G1 X78.873 Y69.935 E.01641
G1 X97.002 Y88.065 E.7884
G1 X96.469 Y88.065 E.01641
G1 X78.339 Y69.935 E.7884
G1 X77.806 Y69.935 E.01641
G1 X95.935 Y88.065 E.7884
G1 X95.401 Y88.065 E.01641
G1 X77.272 Y69.935 E.7884
G1 X76.738 Y69.935 E.01641
G1 X94.868 Y88.065 E.7884
G1 X94.334 Y88.065 E.01641
G1 X76.205 Y69.935 E.7884
G1 X75.671 Y69.935 E.01641
G1 X93.8 Y88.065 E.7884
G1 X93.267 Y88.065 E.01641
G1 X75.137 Y69.935 E.7884
G1 X74.604 Y69.935 E.01641
G1 X92.733 Y88.065 E.7884
G1 X92.199 Y88.065 E.01641
G1 X74.07 Y69.935 E.7884
G1 X73.536 Y69.935 E.01641
G1 X91.666 Y88.065 E.7884
G1 X91.132 Y88.065 E.01641
G1 X73.435 Y70.368 E.76958
G1 X73.435 Y70.902 E.01641
G1 X90.598 Y88.065 E.74638
G1 X90.065 Y88.065 E.01641
G1 X73.435 Y71.435 E.72317
G1 X73.435 Y71.969 E.01641
G1 X89.531 Y88.065 E.69996
G1 X88.997 Y88.065 E.01641
G1 X73.435 Y72.503 E.67675
G1 X73.435 Y73.036 E.01641
G1 X88.464 Y88.065 E.65354
G1 X87.93 Y88.065 E.01641
G1 X73.435 Y73.57 E.63034
G1 X73.435 Y74.104 E.01641
G1 X87.396 Y88.065 E.60713
G1 X86.863 Y88.065 E.01641
G1 X73.435 Y74.637 E.58392
G1 X73.435 Y75.171 E.01641
G1 X86.329 Y88.065 E.56071
G1 X85.795 Y88.065 E.01641
G1 X73.435 Y75.705 E.5375
G1 X73.435 Y76.238 E.01641
G1 X85.262 Y88.065 E.5143
G1 X84.728 Y88.065 E.01641
G1 X73.435 Y76.772 E.49109
G1 X73.435 Y77.306 E.01641
G1 X84.194 Y88.065 E.46788
G1 X83.661 Y88.065 E.01641
G1 X73.435 Y77.839 E.44467
G1 X73.435 Y78.373 E.01641
G1 X83.127 Y88.065 E.42146
G1 X82.593 Y88.065 E.01641
G1 X73.435 Y78.907 E.39826
G1 X73.435 Y79.44 E.01641
G1 X82.06 Y88.065 E.37505
G1 X81.526 Y88.065 E.01641
G1 X73.435 Y79.974 E.35184
G1 X73.435 Y80.508 E.01641
G1 X80.992 Y88.065 E.32863
G1 X80.459 Y88.065 E.01641
G1 X73.435 Y81.041 E.30542
G1 X73.435 Y81.575 E.01641
G1 X79.925 Y88.065 E.28222
G1 X79.391 Y88.065 E.01641
G1 X73.435 Y82.109 E.25901
G1 X73.435 Y82.642 E.01641
G1 X78.858 Y88.065 E.2358
G1 X78.565 Y88.065 E.00901
G1 X78.565 Y88.305 E.0074
G1 X73.435 Y83.176 E.22306
G1 X73.435 Y83.71 E.01641
G1 X78.565 Y88.839 E.22306
G1 X78.565 Y89.373 E.01641
G1 X73.435 Y84.243 E.22306
G1 X73.435 Y84.777 E.01641
G1 X78.565 Y89.906 E.22306
G1 X78.565 Y90.44 E.01641
G1 X73.435 Y85.311 E.22306
G1 X73.435 Y85.844 E.01641
G1 X78.565 Y90.974 E.22306
G1 X78.565 Y91.507 E.01641
G1 X73.435 Y86.378 E.22306
G1 X73.435 Y86.912 E.01641
G1 X78.565 Y92.041 E.22306
G1 X78.565 Y92.575 E.01641
G1 X73.435 Y87.445 E.22306
G1 X73.435 Y87.979 E.01641
G1 X78.565 Y93.108 E.22306
G1 X78.565 Y93.642 E.01641
G1 X73.435 Y88.513 E.22306
G1 X73.435 Y89.046 E.01641
G1 X78.565 Y94.176 E.22306
G1 X78.565 Y94.709 E.01641
G1 X73.435 Y89.58 E.22306
G1 X73.435 Y90.114 E.01641
G1 X78.565 Y95.243 E.22306
G1 X78.565 Y95.777 E.01641
G1 X73.435 Y90.647 E.22306
G1 X73.435 Y91.181 E.01641
G1 X78.565 Y96.31 E.22306
G1 X78.565 Y96.844 E.01641
G1 X73.435 Y91.715 E.22306
G1 X73.435 Y92.249 E.01641
G1 X78.565 Y97.378 E.22306
G1 X78.565 Y97.911 E.01641
G1 X73.435 Y92.782 E.22306
G1 X73.435 Y93.316 E.01641
G1 X78.565 Y98.445 E.22306
G1 X78.565 Y98.979 E.01641
G1 X73.435 Y93.85 E.22306
G1 X73.435 Y94.383 E.01641
G1 X78.565 Y99.513 E.22306
G1 X78.565 Y100.046 E.01641
G1 X73.435 Y94.917 E.22306
G1 X73.435 Y95.451 E.01641
G1 X78.565 Y100.58 E.22306
G1 X78.565 Y101.114 E.01641
G1 X73.435 Y95.984 E.22306
G1 X73.435 Y96.518 E.01641
G1 X78.565 Y101.647 E.22306
G1 X78.565 Y102.181 E.01641
G1 X73.435 Y97.052 E.22306
G1 X73.435 Y97.585 E.01641
G1 X78.565 Y102.715 E.22306
G1 X78.565 Y103.248 E.01641
G1 X73.435 Y98.119 E.22306
G1 X73.435 Y98.653 E.01641
G1 X78.565 Y103.782 E.22306
G1 X78.565 Y104.316 E.01641
G1 X73.435 Y99.186 E.22306
G1 X73.435 Y99.72 E.01641
G1 X78.565 Y104.849 E.22306
G1 X78.565 Y105.383 E.01641
G1 X73.435 Y100.254 E.22306
G1 X73.435 Y100.787 E.01641
G1 X78.565 Y105.917 E.22306
G1 X78.565 Y106.45 E.01641
G1 X73.435 Y101.321 E.22306
G1 X73.435 Y101.855 E.01641
G1 X78.565 Y106.984 E.22306
G1 X78.565 Y107.518 E.01641
G1 X73.435 Y102.388 E.22306
G1 X73.435 Y102.922 E.01641
G1 X78.565 Y108.051 E.22306
G1 X78.565 Y108.585 E.01641
G1 X73.435 Y103.456 E.22306
G1 X73.435 Y103.989 E.01641
G1 X78.565 Y109.119 E.22306
G1 X78.565 Y109.652 E.01641
G1 X73.435 Y104.523 E.22306
G1 X73.435 Y105.057 E.01641
G1 X78.565 Y110.186 E.22306
G1 X78.565 Y110.72 E.01641
G1 X73.435 Y105.59 E.22306
G1 X73.435 Y106.124 E.01641
G1 X78.565 Y111.253 E.22306
G1 X78.565 Y111.787 E.01641
G1 X73.435 Y106.658 E.22306
G1 X73.435 Y107.191 E.01641
G1 X78.565 Y112.321 E.22306
G1 X78.565 Y112.854 E.01641
G1 X73.435 Y107.725 E.22306
G1 X73.435 Y108.259 E.01641
G1 X78.565 Y113.388 E.22306
G1 X78.565 Y113.922 E.01641
G1 X73.435 Y108.792 E.22306
G1 X73.435 Y109.326 E.01641
G1 X78.565 Y114.455 E.22306
G1 X78.565 Y114.989 E.01641
G1 X73.435 Y109.86 E.22306
G1 X73.435 Y110.393 E.01641
G1 X78.565 Y115.523 E.22306
G1 X78.565 Y116.056 E.01641
G1 X73.435 Y110.927 E.22306
G1 X73.435 Y111.461 E.01641
G1 X78.565 Y116.59 E.22306
G1 X78.565 Y117.124 E.01641
G1 X73.435 Y111.994 E.22306
G1 X73.435 Y112.528 E.01641
G1 X78.565 Y117.657 E.22306
G1 X78.565 Y118.191 E.01641
G1 X73.435 Y113.062 E.22306
G1 X73.435 Y113.595 E.01641
G1 X78.565 Y118.725 E.22306
G1 X78.565 Y119.258 E.01641
G1 X73.435 Y114.129 E.22306
G1 X73.435 Y114.663 E.01641
G1 X78.565 Y119.792 E.22306
G1 X78.565 Y120.326 E.01641
G1 X73.435 Y115.196 E.22306
G1 X73.435 Y115.73 E.01641
G1 X78.565 Y120.859 E.22306
G1 X78.565 Y121.393 E.01641
G1 X73.435 Y116.264 E.22306
G1 X73.435 Y116.797 E.01641
G1 X78.565 Y121.927 E.22306
G1 X78.565 Y122.46 E.01641
G1 X73.435 Y117.331 E.22306
G1 X73.435 Y117.865 E.01641
G1 X78.565 Y122.994 E.22306
G1 X78.565 Y123.528 E.01641
G1 X73.435 Y118.398 E.22306
G1 X73.435 Y118.932 E.01641
G1 X78.565 Y124.061 E.22306
G1 X78.565 Y124.595 E.01641
G1 X73.435 Y119.466 E.22306
G1 X73.435 Y119.999 E.01641
G1 X78.565 Y125.129 E.22306
G1 X78.565 Y125.662 E.01641
G1 X73.435 Y120.533 E.22306
G1 X73.435 Y121.067 E.01641
G1 X78.565 Y126.196 E.22306
G1 X78.565 Y126.73 E.01641
G1 X73.435 Y121.6 E.22306
G1 X73.435 Y122.134 E.01641
G1 X78.565 Y127.263 E.22306
G1 X78.565 Y127.797 E.01641
G1 X73.435 Y122.668 E.22306
G1 X73.435 Y123.201 E.01641
G1 X78.565 Y128.331 E.22306
G1 X78.565 Y128.864 E.01641
G1 X73.435 Y123.735 E.22306
G1 X73.435 Y124.269 E.01641
G1 X78.565 Y129.398 E.22306
G1 X78.565 Y129.932 E.01641
G1 X73.435 Y124.802 E.22306
G1 X73.435 Y125.336 E.01641
G1 X78.565 Y130.465 E.22306
G1 X78.565 Y130.999 E.01641
G1 X73.435 Y125.87 E.22306
G1 X73.435 Y126.404 E.01641
G1 X78.565 Y131.533 E.22306
G1 X78.565 Y132.066 E.01641
G1 X73.435 Y126.937 E.22306
G1 X73.435 Y127.471 E.01641
G1 X78.565 Y132.6 E.22306
G1 X78.565 Y133.134 E.01641
G1 X73.435 Y128.005 E.22306
G1 X73.435 Y128.538 E.01641
G1 X78.565 Y133.668 E.22306
G1 X78.565 Y134.201 E.01641
G1 X73.435 Y129.072 E.22306
G1 X73.435 Y129.606 E.01641
G1 X78.565 Y134.735 E.22306
G1 X78.565 Y135.269 E.01641
G1 X73.435 Y130.139 E.22306
G1 X73.435 Y130.673 E.01641
G1 X78.565 Y135.802 E.22306
G1 X78.565 Y136.336 E.01641
G1 X73.435 Y131.207 E.22306
G1 X73.435 Y131.74 E.01641
G1 X78.565 Y136.87 E.22306
G1 X78.565 Y137.403 E.01641
G1 X73.435 Y132.274 E.22306
G1 X73.435 Y132.808 E.01641
G1 X78.565 Y137.937 E.22306
G1 X78.565 Y138.471 E.01641
G1 X73.435 Y133.341 E.22306
G1 X73.435 Y133.875 E.01641
G1 X78.565 Y139.004 E.22306
G1 X78.565 Y139.538 E.01641
G1 X73.435 Y134.409 E.22306
G1 X73.435 Y134.942 E.01641
G1 X78.565 Y140.072 E.22306
G1 X78.565 Y140.605 E.01641
G1 X73.435 Y135.476 E.22306
G1 X73.435 Y136.01 E.01641
G1 X78.565 Y141.139 E.22306
G1 X78.565 Y141.673 E.01641
G1 X73.435 Y136.543 E.22306
G1 X73.435 Y137.077 E.01641
G1 X78.565 Y142.206 E.22306
G1 X78.565 Y142.74 E.01641
G1 X73.435 Y137.611 E.22306
G1 X73.435 Y138.144 E.01641
G1 X78.565 Y143.274 E.22306
G1 X78.565 Y143.807 E.01641
G1 X73.435 Y138.678 E.22306
G1 X73.435 Y139.212 E.01641
G1 X78.565 Y144.341 E.22306
G1 X78.565 Y144.875 E.01641
G1 X73.435 Y139.745 E.22306
G1 X73.435 Y140.279 E.01641
G1 X78.565 Y145.408 E.22306
G1 X78.565 Y145.942 E.01641
G1 X73.435 Y140.813 E.22306
G1 X73.435 Y141.346 E.01641
G1 X78.565 Y146.476 E.22306
G1 X78.565 Y147.009 E.01641
G1 X73.435 Y141.88 E.22306
G1 X73.435 Y142.414 E.01641
G1 X78.565 Y147.543 E.22306
G1 X78.565 Y148.077 E.01641
G1 X73.435 Y142.947 E.22306
G1 X73.435 Y143.481 E.01641
G1 X78.565 Y148.61 E.22306
G1 X78.565 Y149.144 E.01641
G1 X73.435 Y144.015 E.22306
G1 X73.435 Y144.548 E.01641
G1 X78.565 Y149.678 E.22306
G1 X78.565 Y150.211 E.01641
G1 X73.435 Y145.082 E.22306
G1 X73.435 Y145.616 E.01641
G1 X78.565 Y150.745 E.22306
G1 X78.565 Y151.279 E.01641
G1 X73.435 Y146.149 E.22306
G1 X73.435 Y146.683 E.01641
G1 X78.565 Y151.812 E.22306
G1 X78.565 Y152.346 E.01641
G1 X73.435 Y147.217 E.22306
G1 X73.435 Y147.75 E.01641
G1 X78.565 Y152.88 E.22306
G1 X78.565 Y153.413 E.01641
G1 X73.435 Y148.284 E.22306
G1 X73.435 Y148.818 E.01641
G1 X78.565 Y153.947 E.22306
G1 X78.565 Y154.481 E.01641
G1 X73.435 Y149.351 E.22306
G1 X73.435 Y149.885 E.01641
G1 X78.565 Y155.014 E.22306
G1 X78.565 Y155.548 E.01641
G1 X73.435 Y150.419 E.22306
G1 X73.435 Y150.952 E.01641
G1 X78.565 Y156.082 E.22306
G1 X78.565 Y156.615 E.01641
G1 X73.435 Y151.486 E.22306
G1 X73.435 Y152.02 E.01641
G1 X78.565 Y157.149 E.22306
G1 X78.565 Y157.683 E.01641
G1 X73.435 Y152.553 E.22306
G1 X73.435 Y153.087 E.01641
G1 X78.565 Y158.216 E.22306
G1 X78.565 Y158.75 E.01641
G1 X73.435 Y153.621 E.22306
G1 X73.435 Y154.154 E.01641
G1 X78.565 Y159.284 E.22306
G1 X78.565 Y159.817 E.01641
G1 X73.435 Y154.688 E.22306
G1 X73.435 Y155.222 E.01641
G1 X78.565 Y160.351 E.22306
G1 X78.565 Y160.885 E.01641
G1 X73.435 Y155.755 E.22306
G1 X73.435 Y156.289 E.01641
G1 X78.565 Y161.418 E.22306
G1 X78.565 Y161.952 E.01641
G1 X73.435 Y156.823 E.22306
G1 X73.435 Y157.356 E.01641
G1 X78.565 Y162.486 E.22306
G1 X78.565 Y163.019 E.01641
G1 X73.435 Y157.89 E.22306
G1 X73.435 Y158.424 E.01641
G1 X78.565 Y163.553 E.22306
G1 X78.565 Y164.087 E.01641
G1 X73.435 Y158.957 E.22306
G1 X73.435 Y159.491 E.01641
G1 X78.565 Y164.62 E.22306
G1 X78.565 Y165.154 E.01641
G1 X73.435 Y160.025 E.22306
G1 X73.435 Y160.559 E.01641
G1 X78.565 Y165.688 E.22306
G1 X78.565 Y166.221 E.01641
G1 X73.435 Y161.092 E.22306
G1 X73.435 Y161.626 E.01641
G1 X78.565 Y166.755 E.22306
G1 X78.565 Y167.289 E.01641
G1 X73.435 Y162.16 E.22306
G1 X73.435 Y162.693 E.01641
G1 X78.565 Y167.823 E.22306
G1 X78.565 Y168.356 E.01641
G1 X73.435 Y163.227 E.22306
G1 X73.435 Y163.761 E.01641
G1 X78.565 Y168.89 E.22306
G1 X78.565 Y169.424 E.01641
G1 X73.435 Y164.294 E.22306
G1 X73.435 Y164.828 E.01641
G1 X94.672 Y186.065 E.92353
G1 X95.206 Y186.065 E.01641
G1 X79.076 Y169.935 E.70142
G1 X79.61 Y169.935 E.01641
G1 X95.739 Y186.065 E.70142
G1 X96.273 Y186.065 E.01641
G1 X80.144 Y169.935 E.70142
G1 X80.677 Y169.935 E.01641
G1 X96.807 Y186.065 E.70142
G1 X97.34 Y186.065 E.01641
G1 X81.211 Y169.935 E.70142
G1 X81.745 Y169.935 E.01641
G1 X97.874 Y186.065 E.70142
G1 X98.408 Y186.065 E.01641
G1 X82.279 Y169.935 E.70142
G1 X82.812 Y169.935 E.01641
G1 X98.941 Y186.065 E.70142
G1 X99.475 Y186.065 E.01641
G1 X83.346 Y169.935 E.70142
G1 X83.88 Y169.935 E.01641
G1 X100.009 Y186.065 E.70142
G1 X100.543 Y186.065 E.01641
G1 X84.413 Y169.935 E.70142
G1 X84.947 Y169.935 E.01641
G1 X101.076 Y186.065 E.70142
G1 X101.61 Y186.065 E.01641
G1 X85.481 Y169.935 E.70142
G1 X86.014 Y169.935 E.01641
G1 X102.144 Y186.065 E.70142
G1 X102.677 Y186.065 E.01641
G1 X86.548 Y169.935 E.70142
G1 X87.082 Y169.935 E.01641
G1 X103.211 Y186.065 E.70142
G1 X103.745 Y186.065 E.01641
G1 X87.615 Y169.935 E.70142
G1 X88.149 Y169.935 E.01641
G1 X104.278 Y186.065 E.70142
G1 X104.812 Y186.065 E.01641
G1 X88.683 Y169.935 E.70142
G1 X89.216 Y169.935 E.01641
G1 X105.346 Y186.065 E.70142
G1 X105.879 Y186.065 E.01641
G1 X89.75 Y169.935 E.70142
G1 X90.284 Y169.935 E.01641
G1 X106.413 Y186.065 E.70142
G1 X106.947 Y186.065 E.01641
G1 X90.817 Y169.935 E.70142
G1 X91.351 Y169.935 E.01641
G1 X107.48 Y186.065 E.70142
G1 X108.014 Y186.065 E.01641
G1 X91.885 Y169.935 E.70142
G1 X92.418 Y169.935 E.01641
G1 X108.548 Y186.065 E.70142
G1 X109.081 Y186.065 E.01641
G1 X92.952 Y169.935 E.70142
G1 X93.486 Y169.935 E.01641
G1 X109.615 Y186.065 E.70142
G1 X110.149 Y186.065 E.01641
G1 X94.019 Y169.935 E.70142
G1 X94.553 Y169.935 E.01641
G1 X110.682 Y186.065 E.70142
G1 X111.216 Y186.065 E.01641
G1 X95.087 Y169.935 E.70142
G1 X95.62 Y169.935 E.01641
G1 X111.75 Y186.065 E.70142
G1 X112.283 Y186.065 E.01641
G1 X96.154 Y169.935 E.70142
G1 X96.688 Y169.935 E.01641
G1 X112.817 Y186.065 E.70142
G1 X113.351 Y186.065 E.01641
G1 X97.221 Y169.935 E.70142
G1 X97.755 Y169.935 E.01641
G1 X113.884 Y186.065 E.70142
G1 X114.418 Y186.065 E.01641
G1 X98.289 Y169.935 E.70142
G1 X98.822 Y169.935 E.01641
G1 X114.952 Y186.065 E.70142
G1 X115.485 Y186.065 E.01641
G1 X99.356 Y169.935 E.70142
G1 X99.89 Y169.935 E.01641
G1 X116.019 Y186.065 E.70142
G1 X116.553 Y186.065 E.01641
G1 X100.423 Y169.935 E.70142
G1 X100.957 Y169.935 E.01641
G1 X117.086 Y186.065 E.70142
G1 X117.62 Y186.065 E.01641
G1 X101.491 Y169.935 E.70142
G1 X102.024 Y169.935 E.01641
G1 X118.154 Y186.065 E.70142
G1 X118.687 Y186.065 E.01641
G1 X102.558 Y169.935 E.70142
G1 X103.092 Y169.935 E.01641
G1 X119.221 Y186.065 E.70142
G1 X119.755 Y186.065 E.01641
G1 X103.625 Y169.935 E.70142
G1 X104.159 Y169.935 E.01641
G1 X120.288 Y186.065 E.70142
G1 X120.822 Y186.065 E.01641
G1 X104.693 Y169.935 E.70142
G1 X105.226 Y169.935 E.01641
G1 X121.356 Y186.065 E.70142
M73 P30 R36
G1 X121.889 Y186.065 E.01641
G1 X105.76 Y169.935 E.70142
G1 X106.294 Y169.935 E.01641
G1 X122.423 Y186.065 E.70142
G1 X122.957 Y186.065 E.01641
G1 X106.827 Y169.935 E.70142
G1 X107.361 Y169.935 E.01641
G1 X123.49 Y186.065 E.70142
G1 X124.024 Y186.065 E.01641
G1 X107.895 Y169.935 E.70142
G1 X108.428 Y169.935 E.01641
G1 X124.558 Y186.065 E.70142
G1 X125.091 Y186.065 E.01641
G1 X108.962 Y169.935 E.70142
G1 X109.496 Y169.935 E.01641
G1 X125.625 Y186.065 E.70142
G1 X126.159 Y186.065 E.01641
G1 X110.029 Y169.935 E.70142
G1 X110.563 Y169.935 E.01641
G1 X126.692 Y186.065 E.70142
G1 X127.226 Y186.065 E.01641
G1 X111.097 Y169.935 E.70142
G1 X111.63 Y169.935 E.01641
G1 X127.76 Y186.065 E.70142
G1 X128.293 Y186.065 E.01641
G1 X112.164 Y169.935 E.70142
G1 X112.698 Y169.935 E.01641
G1 X128.827 Y186.065 E.70142
G1 X129.361 Y186.065 E.01641
G1 X113.231 Y169.935 E.70142
G1 X113.765 Y169.935 E.01641
G1 X129.894 Y186.065 E.70142
G1 X130.428 Y186.065 E.01641
G1 X114.299 Y169.935 E.70142
G1 X114.832 Y169.935 E.01641
G1 X130.962 Y186.065 E.70142
G1 X131.495 Y186.065 E.01641
G1 X115.366 Y169.935 E.70142
G1 X115.9 Y169.935 E.01641
G1 X132.029 Y186.065 E.70142
G1 X132.563 Y186.065 E.01641
G1 X116.434 Y169.935 E.70142
G1 X116.967 Y169.935 E.01641
G1 X133.096 Y186.065 E.70142
G1 X133.63 Y186.065 E.01641
G1 X117.501 Y169.935 E.70142
G1 X118.035 Y169.935 E.01641
G1 X134.164 Y186.065 E.70142
G1 X134.698 Y186.065 E.01641
G1 X118.568 Y169.935 E.70142
G1 X119.102 Y169.935 E.01641
G1 X135.231 Y186.065 E.70142
G1 X135.765 Y186.065 E.01641
G1 X119.636 Y169.935 E.70142
G1 X120.169 Y169.935 E.01641
G1 X136.299 Y186.065 E.70142
G1 X136.832 Y186.065 E.01641
G1 X120.703 Y169.935 E.70142
G1 X121.237 Y169.935 E.01641
G1 X137.366 Y186.065 E.70142
G1 X137.9 Y186.065 E.01641
G1 X121.77 Y169.935 E.70142
G1 X122.304 Y169.935 E.01641
G1 X138.433 Y186.065 E.70142
G1 X138.967 Y186.065 E.01641
G1 X122.838 Y169.935 E.70142
G1 X123.371 Y169.935 E.01641
G1 X139.501 Y186.065 E.70142
G1 X140.034 Y186.065 E.01641
G1 X123.905 Y169.935 E.70142
G1 X124.439 Y169.935 E.01641
G1 X140.568 Y186.065 E.70142
M73 P31 R36
G1 X141.102 Y186.065 E.01641
G1 X124.972 Y169.935 E.70142
G1 X125.506 Y169.935 E.01641
G1 X141.635 Y186.065 E.70142
G1 X142.169 Y186.065 E.01641
G1 X126.04 Y169.935 E.70142
G1 X126.573 Y169.935 E.01641
G1 X142.703 Y186.065 E.70142
G1 X143.236 Y186.065 E.01641
G1 X127.107 Y169.935 E.70142
G1 X127.641 Y169.935 E.01641
G1 X143.77 Y186.065 E.70142
G1 X144.304 Y186.065 E.01641
G1 X128.174 Y169.935 E.70142
G1 X128.708 Y169.935 E.01641
G1 X144.837 Y186.065 E.70142
G1 X145.371 Y186.065 E.01641
G1 X129.242 Y169.935 E.70142
G1 X129.435 Y169.935 E.00596
G1 X129.435 Y169.595 E.01045
G1 X145.905 Y186.065 E.71621
G1 X146.438 Y186.065 E.01641
G1 X129.435 Y169.062 E.73942
G1 X129.435 Y168.528 E.01641
G1 X146.972 Y186.065 E.76262
G1 X147.506 Y186.065 E.01641
G1 X129.435 Y167.994 E.78583
G1 X129.435 Y167.461 E.01641
G1 X148.039 Y186.065 E.80904
G1 X148.573 Y186.065 E.01641
G1 X129.435 Y166.927 E.83225
G1 X129.435 Y166.393 E.01641
G1 X149.107 Y186.065 E.85546
G1 X149.64 Y186.065 E.01641
G1 X129.435 Y165.86 E.87866
G1 X129.435 Y165.326 E.01641
G1 X150.174 Y186.065 E.90187
G1 X150.708 Y186.065 E.01641
G1 X129.435 Y164.792 E.92508
G1 X129.435 Y164.259 E.01641
G1 X151.241 Y186.065 E.94829
G1 X151.775 Y186.065 E.01641
G1 X129.435 Y163.725 E.9715
G1 X129.435 Y163.191 E.01641
G1 X152.309 Y186.065 E.9947
G1 X152.842 Y186.065 E.01641
G1 X129.435 Y162.658 E1.01791
G1 X129.435 Y162.124 E.01641
G1 X153.376 Y186.065 E1.04112
G1 X153.91 Y186.065 E.01641
G1 X129.435 Y161.59 E1.06433
G1 X129.435 Y161.057 E.01641
G1 X154.443 Y186.065 E1.08754
G1 X154.977 Y186.065 E.01641
G1 X129.435 Y160.523 E1.11074
G1 X129.435 Y159.989 E.01641
G1 X155.511 Y186.065 E1.13395
G1 X156.044 Y186.065 E.01641
G1 X129.435 Y159.456 E1.15716
G1 X129.435 Y158.922 E.01641
G1 X156.578 Y186.065 E1.18037
G1 X157.112 Y186.065 E.01641
G1 X129.435 Y158.388 E1.20358
G1 X129.435 Y157.855 E.01641
G1 X157.645 Y186.065 E1.22678
G1 X158.179 Y186.065 E.01641
G1 X129.435 Y157.321 E1.24999
G1 X129.435 Y156.787 E.01641
G1 X158.713 Y186.065 E1.2732
G1 X159.246 Y186.065 E.01641
G1 X129.435 Y156.254 E1.29641
G1 X129.435 Y155.72 E.01641
G1 X159.78 Y186.065 E1.31962
G1 X160.314 Y186.065 E.01641
G1 X129.435 Y155.186 E1.34282
G1 X129.435 Y154.653 E.01641
G1 X160.847 Y186.065 E1.36603
G1 X161.381 Y186.065 E.01641
G1 X129.435 Y154.119 E1.38924
G1 X129.435 Y153.585 E.01641
G1 X161.915 Y186.065 E1.41245
G1 X162.448 Y186.065 E.01641
G1 X129.435 Y153.052 E1.43566
G1 X129.435 Y152.518 E.01641
G1 X162.982 Y186.065 E1.45887
G1 X163.516 Y186.065 E.01641
G1 X129.435 Y151.984 E1.48207
G1 X129.435 Y151.451 E.01641
G1 X164.049 Y186.065 E1.50528
G1 X164.583 Y186.065 E.01641
G1 X129.435 Y150.917 E1.52849
G1 X129.435 Y150.383 E.01641
G1 X165.117 Y186.065 E1.5517
G1 X165.65 Y186.065 E.01641
G1 X129.435 Y149.85 E1.57491
G1 X129.435 Y149.316 E.01641
G1 X166.184 Y186.065 E1.59811
G1 X166.718 Y186.065 E.01641
G1 X129.435 Y148.782 E1.62132
G1 X129.435 Y148.249 E.01641
G1 X167.251 Y186.065 E1.64453
G1 X167.785 Y186.065 E.01641
G1 X129.435 Y147.715 E1.66774
G1 X129.435 Y147.181 E.01641
G1 X168.319 Y186.065 E1.69095
G1 X168.853 Y186.065 E.01641
G1 X129.435 Y146.647 E1.71415
G1 X129.435 Y146.114 E.01641
G1 X169.386 Y186.065 E1.73736
G1 X169.92 Y186.065 E.01641
G1 X129.435 Y145.58 E1.76057
G1 X129.435 Y145.046 E.01641
G1 X170.454 Y186.065 E1.78378
G1 X170.987 Y186.065 E.01641
G1 X129.435 Y144.513 E1.80699
G1 X129.435 Y143.979 E.01641
G1 X171.521 Y186.065 E1.83019
G1 X172.055 Y186.065 E.01641
G1 X129.435 Y143.445 E1.8534
G1 X129.435 Y142.912 E.01641
G1 X172.588 Y186.065 E1.87661
G1 X173.122 Y186.065 E.01641
G1 X129.435 Y142.378 E1.89982
G1 X129.435 Y141.844 E.01641
G1 X173.656 Y186.065 E1.92303
G1 X174.189 Y186.065 E.01641
G1 X129.435 Y141.311 E1.94623
G1 X129.435 Y140.777 E.01641
G1 X174.723 Y186.065 E1.96944
G1 X175.257 Y186.065 E.01641
G1 X129.435 Y140.243 E1.99265
G1 X129.435 Y139.71 E.01641
G1 X175.79 Y186.065 E2.01586
G1 X176.324 Y186.065 E.01641
G1 X129.435 Y139.176 E2.03907
G1 X129.435 Y138.642 E.01641
G1 X176.858 Y186.065 E2.06227
G1 X177.391 Y186.065 E.01641
G1 X129.435 Y138.109 E2.08548
G1 X129.435 Y137.575 E.01641
G1 X177.925 Y186.065 E2.10869
G1 X178.459 Y186.065 E.01641
G1 X129.435 Y137.041 E2.1319
G1 X129.435 Y136.508 E.01641
G1 X178.992 Y186.065 E2.15511
G1 X179.526 Y186.065 E.01641
G1 X129.435 Y135.974 E2.17831
G1 X129.435 Y135.44 E.01641
G1 X180.06 Y186.065 E2.20152
G1 X180.593 Y186.065 E.01641
G1 X129.435 Y134.907 E2.22473
G1 X129.435 Y134.373 E.01641
G1 X181.127 Y186.065 E2.24794
G1 X181.661 Y186.065 E.01641
G1 X129.435 Y133.839 E2.27115
G1 X129.435 Y133.306 E.01641
G1 X182.194 Y186.065 E2.29436
G1 X182.728 Y186.065 E.01641
G1 X129.435 Y132.772 E2.31756
G1 X129.435 Y132.238 E.01641
G1 X183.262 Y186.065 E2.34077
G1 X183.795 Y186.065 E.01641
G1 X129.435 Y131.705 E2.36398
G1 X129.435 Y131.171 E.01641
G1 X184.329 Y186.065 E2.38719
G1 X184.863 Y186.065 E.01641
G1 X129.435 Y130.637 E2.4104
G1 X129.435 Y130.104 E.01641
G1 X185.396 Y186.065 E2.4336
G1 X185.93 Y186.065 E.01641
G1 X129.435 Y129.57 E2.45681
G1 X129.435 Y129.036 E.01641
G1 X186.464 Y186.065 E2.48002
G1 X186.565 Y186.065 E.00311
G1 X186.565 Y185.632 E.01331
G1 X129.435 Y128.503 E2.48441
G1 X129.435 Y127.969 E.01641
G1 X186.565 Y185.098 E2.48441
G1 X186.565 Y184.565 E.01641
G1 X129.435 Y127.435 E2.48441
G1 X129.435 Y126.902 E.01641
G1 X186.565 Y184.031 E2.48441
G1 X186.565 Y183.497 E.01641
G1 X129.435 Y126.368 E2.48441
G1 X129.435 Y125.834 E.01641
G1 X186.565 Y182.964 E2.48441
G1 X186.565 Y182.43 E.01641
G1 X129.435 Y125.301 E2.48441
G1 X129.435 Y124.767 E.01641
G1 X186.565 Y181.896 E2.48441
G1 X186.565 Y181.363 E.01641
G1 X129.435 Y124.233 E2.48441
G1 X129.435 Y123.7 E.01641
G1 X186.565 Y180.829 E2.48441
G1 X186.565 Y180.295 E.01641
G1 X129.435 Y123.166 E2.48441
G1 X129.435 Y122.632 E.01641
G1 X186.565 Y179.762 E2.48441
G1 X186.565 Y179.228 E.01641
G1 X129.435 Y122.099 E2.48441
G1 X129.435 Y121.565 E.01641
G1 X186.565 Y178.694 E2.48441
G1 X186.565 Y178.161 E.01641
G1 X129.435 Y121.031 E2.48441
G1 X129.435 Y120.498 E.01641
G1 X186.565 Y177.627 E2.48441
G1 X186.565 Y177.093 E.01641
G1 X129.435 Y119.964 E2.48441
G1 X129.435 Y119.43 E.01641
G1 X186.565 Y176.56 E2.48441
G1 X186.565 Y176.026 E.01641
G1 X129.435 Y118.897 E2.48441
G1 X129.435 Y118.363 E.01641
G1 X186.565 Y175.492 E2.48441
G1 X186.565 Y174.959 E.01641
G1 X129.435 Y117.829 E2.48441
G1 X129.435 Y117.296 E.01641
G1 X186.565 Y174.425 E2.48441
G1 X186.565 Y173.891 E.01641
G1 X129.435 Y116.762 E2.48441
G1 X129.435 Y116.228 E.01641
G1 X186.565 Y173.358 E2.48441
G1 X186.565 Y172.824 E.01641
G1 X129.435 Y115.695 E2.48441
G1 X129.435 Y115.161 E.01641
G1 X186.565 Y172.29 E2.48441
G1 X186.565 Y171.756 E.01641
G1 X129.435 Y114.627 E2.48441
G1 X129.435 Y114.094 E.01641
G1 X186.565 Y171.223 E2.48441
G1 X186.565 Y170.689 E.01641
G1 X129.435 Y113.56 E2.48441
G1 X129.435 Y113.026 E.01641
G1 X186.565 Y170.155 E2.48441
G1 X186.565 Y169.622 E.01641
G1 X129.435 Y112.492 E2.48441
G1 X129.435 Y111.959 E.01641
G1 X186.565 Y169.088 E2.48441
G1 X186.565 Y168.554 E.01641
G1 X129.435 Y111.425 E2.48441
G1 X129.435 Y110.891 E.01641
G1 X186.565 Y168.021 E2.48441
G1 X186.565 Y167.487 E.01641
G1 X129.435 Y110.358 E2.48441
G1 X129.435 Y109.824 E.01641
G1 X186.565 Y166.953 E2.48441
G1 X186.565 Y166.42 E.01641
G1 X129.435 Y109.29 E2.48441
G1 X129.435 Y108.757 E.01641
G1 X186.565 Y165.886 E2.48441
G1 X186.565 Y165.352 E.01641
G1 X129.435 Y108.223 E2.48441
G1 X129.435 Y107.689 E.01641
G1 X186.565 Y164.819 E2.48441
G1 X186.565 Y164.285 E.01641
G1 X129.435 Y107.156 E2.48441
G1 X129.435 Y106.622 E.01641
G1 X186.565 Y163.751 E2.48441
G1 X186.565 Y163.218 E.01641
G1 X129.435 Y106.088 E2.48441
G1 X129.435 Y105.555 E.01641
G1 X186.565 Y162.684 E2.48441
G1 X186.565 Y162.15 E.01641
G1 X129.435 Y105.021 E2.48441
G1 X129.435 Y104.487 E.01641
G1 X186.565 Y161.617 E2.48441
G1 X186.565 Y161.083 E.01641
G1 X129.435 Y103.954 E2.48441
G1 X129.435 Y103.42 E.01641
G1 X186.565 Y160.549 E2.48441
G1 X186.565 Y160.016 E.01641
G1 X129.435 Y102.886 E2.48441
G1 X129.435 Y102.353 E.01641
G1 X186.565 Y159.482 E2.48441
G1 X186.565 Y158.948 E.01641
G1 X129.435 Y101.819 E2.48441
M73 P32 R36
G1 X129.435 Y101.285 E.01641
G1 X186.565 Y158.415 E2.48441
G1 X186.565 Y157.881 E.01641
G1 X129.435 Y100.752 E2.48441
G1 X129.435 Y100.218 E.01641
G1 X186.565 Y157.347 E2.48441
G1 X186.565 Y156.814 E.01641
G1 X129.435 Y99.684 E2.48441
G1 X129.435 Y99.151 E.01641
G1 X186.565 Y156.28 E2.48441
G1 X186.565 Y155.746 E.01641
G1 X129.435 Y98.617 E2.48441
G1 X129.435 Y98.083 E.01641
G1 X186.565 Y155.213 E2.48441
G1 X186.565 Y154.679 E.01641
G1 X129.435 Y97.55 E2.48441
G1 X129.435 Y97.016 E.01641
G1 X186.565 Y154.145 E2.48441
G1 X186.565 Y153.612 E.01641
G1 X129.435 Y96.482 E2.48441
G1 X129.435 Y95.949 E.01641
G1 X186.565 Y153.078 E2.48441
G1 X186.565 Y152.544 E.01641
G1 X129.435 Y95.415 E2.48441
G1 X129.435 Y94.881 E.01641
G1 X186.565 Y152.011 E2.48441
G1 X186.565 Y151.477 E.01641
G1 X129.435 Y94.348 E2.48441
G1 X129.435 Y93.814 E.01641
G1 X186.565 Y150.943 E2.48441
G1 X186.565 Y150.41 E.01641
G1 X129.435 Y93.28 E2.48441
G1 X129.435 Y92.747 E.01641
G1 X186.565 Y149.876 E2.48441
G1 X186.565 Y149.342 E.01641
G1 X129.435 Y92.213 E2.48441
G1 X129.435 Y91.679 E.01641
G1 X186.565 Y148.809 E2.48441
G1 X186.565 Y148.275 E.01641
G1 X129.435 Y91.146 E2.48441
G1 X129.435 Y90.612 E.01641
G1 X186.565 Y147.741 E2.48441
G1 X186.565 Y147.208 E.01641
G1 X129.435 Y90.078 E2.48441
G1 X129.435 Y89.545 E.01641
G1 X186.565 Y146.674 E2.48441
G1 X186.565 Y146.14 E.01641
G1 X129.435 Y89.011 E2.48441
G1 X129.435 Y88.477 E.01641
G1 X186.734 Y145.776 E2.49179
G1 X94.308 Y186.234 F30000
G1 F15000
G1 X73.435 Y165.362 E.90771
G1 X73.435 Y165.895 E.01641
G1 X93.605 Y186.065 E.87712
G1 X93.071 Y186.065 E.01641
G1 X73.435 Y166.429 E.85391
G1 X73.435 Y166.963 E.01641
G1 X92.537 Y186.065 E.8307
G1 X92.004 Y186.065 E.01641
G1 X73.435 Y167.496 E.80749
G1 X73.435 Y168.03 E.01641
G1 X91.47 Y186.065 E.78429
G1 X90.936 Y186.065 E.01641
G1 X73.435 Y168.564 E.76108
G1 X73.435 Y169.097 E.01641
G1 X90.403 Y186.065 E.73787
G1 X89.869 Y186.065 E.01641
G1 X73.435 Y169.631 E.71466
G1 X73.435 Y170.165 E.01641
G1 X89.335 Y186.065 E.69145
G1 X88.802 Y186.065 E.01641
G1 X73.435 Y170.698 E.66825
G1 X73.435 Y171.232 E.01641
G1 X88.268 Y186.065 E.64504
G1 X87.734 Y186.065 E.01641
G1 X73.435 Y171.766 E.62183
G1 X73.435 Y172.299 E.01641
G1 X87.201 Y186.065 E.59862
G1 X86.667 Y186.065 E.01641
G1 X73.435 Y172.833 E.57541
G1 X73.435 Y173.367 E.01641
G1 X86.133 Y186.065 E.55221
G1 X85.6 Y186.065 E.01641
G1 X73.435 Y173.9 E.529
G1 X73.435 Y174.434 E.01641
G1 X85.066 Y186.065 E.50579
G1 X84.532 Y186.065 E.01641
G1 X73.435 Y174.968 E.48258
G1 X73.435 Y175.501 E.01641
G1 X83.999 Y186.065 E.45937
G1 X83.465 Y186.065 E.01641
G1 X73.435 Y176.035 E.43616
G1 X73.435 Y176.569 E.01641
G1 X82.931 Y186.065 E.41296
G1 X82.398 Y186.065 E.01641
G1 X73.435 Y177.102 E.38975
G1 X73.435 Y177.636 E.01641
G1 X81.864 Y186.065 E.36654
G1 X81.33 Y186.065 E.01641
G1 X73.435 Y178.17 E.34333
G1 X73.435 Y178.703 E.01641
G1 X80.797 Y186.065 E.32012
G1 X80.263 Y186.065 E.01641
G1 X73.435 Y179.237 E.29692
G1 X73.435 Y179.771 E.01641
G1 X79.729 Y186.065 E.27371
G1 X79.196 Y186.065 E.01641
G1 X73.435 Y180.304 E.2505
G1 X73.435 Y180.838 E.01641
G1 X78.662 Y186.065 E.22729
G1 X78.128 Y186.065 E.01641
G1 X73.435 Y181.372 E.20408
G1 X73.435 Y181.905 E.01641
G1 X77.595 Y186.065 E.18088
G1 X77.061 Y186.065 E.01641
G1 X73.435 Y182.439 E.15767
G1 X73.435 Y182.973 E.01641
G1 X76.527 Y186.065 E.13446
G1 X75.994 Y186.065 E.01641
G1 X73.435 Y183.506 E.11125
G1 X73.435 Y184.04 E.01641
G1 X75.46 Y186.065 E.08804
G1 X74.926 Y186.065 E.01641
G1 X73.435 Y184.574 E.06484
G1 X73.435 Y185.107 E.01641
G1 X74.393 Y186.065 E.04163
G1 X73.859 Y186.065 E.01641
G1 X73.266 Y185.471 E.0258
M106 S232.05
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X73.859 Y186.065 E-.31882
G1 X74.393 Y186.065 E-.2028
G1 X73.949 Y185.621 E-.23839
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/125
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
G3 Z1 I.339 J1.169 P1  F30000
G1 X129.102 Y169.602 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X78.898 Y169.602 E1.66536
G1 X78.898 Y88.398 E2.69369
G1 X129.102 Y88.398 E1.66536
G1 X129.102 Y169.542 E2.6917
G1 X128.71 Y169.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.29 Y169.21 E1.51854
G1 X79.29 Y88.79 E2.47108
G1 X128.71 Y88.79 E1.51854
G1 X128.71 Y169.15 E2.46924
M204 S10000
; WIPE_START
G1 F24000
G1 X126.71 Y169.152 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.071 J-.577 P1  F30000
G1 X73.102 Y69.602 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X186.898 Y69.602 E3.77482
G1 X186.898 Y186.398 E3.87433
G1 X73.102 Y186.398 E3.77482
G1 X73.102 Y69.662 E3.87234
G1 X72.71 Y69.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X187.29 Y69.21 E3.52072
G1 X187.29 Y186.79 E3.61291
G1 X72.71 Y186.79 E3.52072
G1 X72.71 Y69.27 E3.61106
M204 S10000
; WIPE_START
G1 F24000
G1 X74.71 Y69.269 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.628 J-1.042 P1  F30000
G1 X73.579 Y69.95 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X73.45 Y69.95 E.00426
G1 X73.45 Y71.45 E.04976
G1 X90.05 Y88.05 E.77871
G1 X93.191 Y88.05 E.10419
G1 X111.29 Y69.95 E.84908
G1 X110.33 Y69.95 E.03184
G1 X128.429 Y88.05 E.84908
G1 X123.895 Y88.05 E.15043
G1 X141.994 Y69.95 E.84908
G1 X141.034 Y69.95 E.03184
G1 X186.55 Y115.466 E2.13523
G1 X186.55 Y117.506 E.06768
G1 X118.006 Y186.05 E3.21552
G1 X118.966 Y186.05 E.03184
G1 X102.867 Y169.95 E.75525
G1 X103.402 Y169.95 E.01774
G1 X87.302 Y186.05 E.75525
G1 X88.262 Y186.05 E.03184
G1 X73.45 Y171.238 E.69485
M73 P32 R35
G1 X73.45 Y169.198 E.06768
G1 X78.55 Y164.098 E.23922
G1 X78.55 Y160.985 E.10327
G1 X73.45 Y155.886 E.23922
G1 X73.45 Y153.846 E.06768
G1 X78.55 Y148.746 E.23922
G1 X78.55 Y145.633 E.10327
G1 X73.45 Y140.534 E.23922
G1 X73.45 Y138.494 E.06768
G1 X78.55 Y133.395 E.23922
G1 X78.55 Y130.281 E.10327
G1 X73.45 Y125.182 E.23922
G1 X73.45 Y123.142 E.06768
G1 X78.55 Y118.043 E.23922
G1 X78.55 Y114.929 E.10327
G1 X73.45 Y109.83 E.23922
G1 X73.45 Y107.79 E.06768
G1 X78.55 Y102.691 E.23922
G1 X78.55 Y99.578 E.10327
G1 X73.45 Y94.478 E.23922
G1 X73.45 Y92.438 E.06768
G1 X95.938 Y69.95 E1.05494
G1 X94.978 Y69.95 E.03184
G1 X113.078 Y88.05 E.84908
G1 X116.219 Y88.05 E.10419
G1 X134.318 Y69.95 E.84908
G1 X133.358 Y69.95 E.03184
G1 X186.55 Y123.142 E2.49533
G1 X186.55 Y125.182 E.06768
G1 X125.682 Y186.05 E2.85542
G1 X126.642 Y186.05 E.03184
G1 X110.543 Y169.95 E.75525
G1 X111.078 Y169.95 E.01774
G1 X94.978 Y186.05 E.75525
G1 X95.938 Y186.05 E.03184
G1 X79.839 Y169.95 E.75525
G1 X80.374 Y169.95 E.01774
G1 X73.45 Y176.874 E.32479
G1 X73.45 Y178.914 E.06768
G1 X80.586 Y186.05 E.33475
G1 X79.626 Y186.05 E.03184
G1 X95.726 Y169.95 E.75525
G1 X95.191 Y169.95 E.01774
G1 X111.29 Y186.05 E.75525
G1 X110.33 Y186.05 E.03184
G1 X126.429 Y169.95 E.75525
G1 X125.895 Y169.95 E.01774
G1 X141.994 Y186.05 E.75525
G1 X141.034 Y186.05 E.03184
G1 X186.55 Y140.534 E2.13523
G1 X186.55 Y138.494 E.06768
G1 X118.006 Y69.95 E3.21552
G1 X118.966 Y69.95 E.03184
G1 X100.867 Y88.05 E.84908
G1 X97.726 Y88.05 E.10419
G1 X79.626 Y69.95 E.84908
G1 X80.586 Y69.95 E.03184
M73 P33 R35
G1 X73.45 Y77.086 E.33475
G1 X73.45 Y79.126 E.06768
G1 X82.374 Y88.05 E.41861
G1 X85.515 Y88.05 E.10419
G1 X103.614 Y69.95 E.84908
G1 X102.654 Y69.95 E.03184
G1 X120.754 Y88.05 E.84908
G1 X119.125 Y88.05 E.05401
; WIPE_START
G1 F24000
G1 X120.754 Y88.05 E-.61876
G1 X120.491 Y87.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.411 J1.146 P1  F30000
G1 X186.55 Y111.459 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15476.087
G1 X186.55 Y109.83 E.05401
G1 X129.45 Y166.929 E2.67865
G1 X129.45 Y165.83 E.03647
G1 X149.67 Y186.05 E.94854
G1 X148.71 Y186.05 E.03184
G1 X186.55 Y148.21 E1.77514
G1 X186.55 Y146.17 E.06768
G1 X129.45 Y89.071 E2.67865
G1 X129.45 Y90.17 E.03647
G1 X149.67 Y69.95 E.94854
G1 X148.71 Y69.95 E.03184
G1 X186.55 Y107.79 E1.77514
G1 X186.55 Y102.154 E.18695
G1 X129.45 Y159.254 E2.67865
G1 X129.45 Y158.154 E.03647
G1 X157.346 Y186.05 E1.30863
G1 X156.386 Y186.05 E.03184
G1 X186.55 Y155.886 E1.41504
G1 X186.55 Y153.846 E.06768
G1 X129.45 Y96.746 E2.67865
G1 X129.45 Y97.846 E.03647
G1 X157.346 Y69.95 E1.30863
G1 X156.386 Y69.95 E.03184
G1 X186.55 Y100.114 E1.41504
G1 X186.55 Y94.478 E.18695
G1 X129.45 Y151.578 E2.67865
G1 X129.45 Y150.478 E.03647
G1 X165.022 Y186.05 E1.66873
G1 X164.062 Y186.05 E.03184
G1 X186.55 Y163.562 E1.05494
G1 X186.55 Y161.522 E.06768
G1 X129.45 Y104.422 E2.67865
G1 X129.45 Y105.522 E.03647
G1 X165.022 Y69.95 E1.66873
G1 X164.062 Y69.95 E.03184
G1 X186.55 Y92.438 E1.05494
G1 X186.55 Y86.802 E.18695
G1 X129.45 Y143.902 E2.67865
G1 X129.45 Y142.802 E.03647
G1 X172.698 Y186.05 E2.02882
G1 X171.738 Y186.05 E.03184
G1 X186.55 Y171.238 E.69485
G1 X186.55 Y169.198 E.06768
G1 X129.45 Y112.098 E2.67865
G1 X129.45 Y113.198 E.03647
G1 X172.698 Y69.95 E2.02882
G1 X171.738 Y69.95 E.03184
G1 X186.55 Y84.762 E.69485
G1 X186.55 Y79.126 E.18695
G1 X129.45 Y136.226 E2.67865
G1 X129.45 Y135.126 E.03647
G1 X180.374 Y186.05 E2.38892
G1 X179.414 Y186.05 E.03184
G1 X186.55 Y178.914 E.33475
G1 X186.55 Y176.874 E.06768
G1 X129.45 Y119.774 E2.67865
G1 X129.45 Y120.874 E.03647
G1 X180.374 Y69.95 E2.38892
G1 X179.414 Y69.95 E.03184
G1 X186.55 Y77.086 E.33475
G1 X186.55 Y71.45 E.18695
G1 X129.45 Y128.55 E2.67865
G1 X129.45 Y127.45 E.03647
G1 X186.55 Y184.55 E2.67865
G1 X186.55 Y186.05 E.04976
G1 X186.421 Y186.05 E.00426
; WIPE_START
G1 F24000
G1 X186.55 Y186.05 E-.04876
G1 X186.55 Y184.55 E-.57
G1 X186.287 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.192 J-1.202 P1  F30000
G1 X78.55 Y167.033 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15476.087
G1 X78.55 Y168.661 E.05401
G1 X73.45 Y163.562 E.23922
G1 X73.45 Y161.522 E.06768
G1 X78.55 Y156.422 E.23922
G1 X78.55 Y153.309 E.10327
G1 X73.45 Y148.21 E.23922
G1 X73.45 Y146.17 E.06768
G1 X78.55 Y141.071 E.23922
G1 X78.55 Y137.957 E.10327
G1 X73.45 Y132.858 E.23922
G1 X73.45 Y130.818 E.06768
G1 X78.55 Y125.719 E.23922
G1 X78.55 Y122.605 E.10327
G1 X73.45 Y117.506 E.23922
G1 X73.45 Y115.466 E.06768
G1 X78.55 Y110.367 E.23922
G1 X78.55 Y107.254 E.10327
G1 X73.45 Y102.154 E.23922
G1 X73.45 Y100.114 E.06768
G1 X78.55 Y95.015 E.23922
G1 X78.55 Y91.902 E.10327
G1 X73.45 Y86.802 E.23922
G1 X73.45 Y84.762 E.06768
G1 X88.262 Y69.95 E.69485
G1 X87.302 Y69.95 E.03184
G1 X105.402 Y88.05 E.84908
G1 X108.543 Y88.05 E.10419
G1 X126.642 Y69.95 E.84908
G1 X125.682 Y69.95 E.03184
G1 X186.55 Y130.818 E2.85542
G1 X186.55 Y132.858 E.06768
G1 X133.358 Y186.05 E2.49533
G1 X134.318 Y186.05 E.03184
G1 X118.219 Y169.95 E.75525
G1 X118.754 Y169.95 E.01774
G1 X102.654 Y186.05 E.75525
G1 X103.614 Y186.05 E.03184
G1 X87.515 Y169.95 E.75525
G1 X88.05 Y169.95 E.01774
G1 X73.45 Y184.55 E.68488
G1 X73.45 Y186.05 E.04976
G1 X73.579 Y186.05 E.00426
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X73.45 Y186.05 E-.04875
G1 X73.45 Y184.55 E-.57001
G1 X73.713 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/125
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
G3 Z1.2 I.312 J1.176 P1  F30000
G1 X129.102 Y169.602 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X78.898 Y169.602 E1.66536
G1 X78.898 Y88.398 E2.69369
G1 X129.102 Y88.398 E1.66536
G1 X129.102 Y169.542 E2.6917
G1 X128.71 Y169.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.29 Y169.21 E1.51854
G1 X79.29 Y88.79 E2.47108
G1 X128.71 Y88.79 E1.51854
G1 X128.71 Y169.15 E2.46924
M204 S10000
; WIPE_START
G1 F24000
G1 X126.71 Y169.152 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.071 J-.577 P1  F30000
G1 X73.102 Y69.602 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X186.898 Y69.602 E3.77482
G1 X186.898 Y186.398 E3.87433
G1 X73.102 Y186.398 E3.77482
G1 X73.102 Y69.662 E3.87234
G1 X72.71 Y69.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X187.29 Y69.21 E3.52072
G1 X187.29 Y186.79 E3.61291
G1 X72.71 Y186.79 E3.52072
G1 X72.71 Y69.27 E3.61106
M204 S10000
; WIPE_START
G1 F24000
G1 X74.71 Y69.269 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.628 J-1.042 P1  F30000
G1 X73.579 Y69.95 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X73.45 Y69.95 E.00426
G1 X73.45 Y71.45 E.04976
G1 X90.05 Y88.05 E.77871
G1 X93.191 Y88.05 E.10419
G1 X111.29 Y69.95 E.84908
G1 X110.33 Y69.95 E.03184
G1 X128.429 Y88.05 E.84908
G1 X123.895 Y88.05 E.15043
G1 X141.994 Y69.95 E.84908
G1 X141.034 Y69.95 E.03184
G1 X186.55 Y115.466 E2.13523
G1 X186.55 Y117.506 E.06768
G1 X118.006 Y186.05 E3.21552
G1 X118.966 Y186.05 E.03184
G1 X102.867 Y169.95 E.75525
G1 X103.402 Y169.95 E.01774
G1 X87.302 Y186.05 E.75525
G1 X88.262 Y186.05 E.03184
G1 X73.45 Y171.238 E.69485
G1 X73.45 Y169.198 E.06768
G1 X78.55 Y164.098 E.23922
G1 X78.55 Y160.985 E.10327
G1 X73.45 Y155.886 E.23922
G1 X73.45 Y153.846 E.06768
G1 X78.55 Y148.746 E.23922
G1 X78.55 Y145.633 E.10327
G1 X73.45 Y140.534 E.23922
G1 X73.45 Y138.494 E.06768
G1 X78.55 Y133.395 E.23922
G1 X78.55 Y130.281 E.10327
G1 X73.45 Y125.182 E.23922
G1 X73.45 Y123.142 E.06768
G1 X78.55 Y118.043 E.23922
G1 X78.55 Y114.929 E.10327
G1 X73.45 Y109.83 E.23922
G1 X73.45 Y107.79 E.06768
G1 X78.55 Y102.691 E.23922
G1 X78.55 Y99.578 E.10327
G1 X73.45 Y94.478 E.23922
G1 X73.45 Y92.438 E.06768
G1 X95.938 Y69.95 E1.05494
G1 X94.978 Y69.95 E.03184
G1 X113.078 Y88.05 E.84908
G1 X116.219 Y88.05 E.10419
G1 X134.318 Y69.95 E.84908
G1 X133.358 Y69.95 E.03184
G1 X186.55 Y123.142 E2.49533
G1 X186.55 Y125.182 E.06768
G1 X125.682 Y186.05 E2.85542
G1 X126.642 Y186.05 E.03184
G1 X110.543 Y169.95 E.75525
G1 X111.078 Y169.95 E.01774
G1 X94.978 Y186.05 E.75525
G1 X95.938 Y186.05 E.03184
G1 X79.839 Y169.95 E.75525
G1 X80.374 Y169.95 E.01774
G1 X73.45 Y176.874 E.32479
G1 X73.45 Y178.914 E.06768
G1 X80.586 Y186.05 E.33475
G1 X79.626 Y186.05 E.03184
G1 X95.726 Y169.95 E.75525
G1 X95.191 Y169.95 E.01774
G1 X111.29 Y186.05 E.75525
G1 X110.33 Y186.05 E.03184
G1 X126.429 Y169.95 E.75525
G1 X125.895 Y169.95 E.01774
G1 X141.994 Y186.05 E.75525
G1 X141.034 Y186.05 E.03184
G1 X186.55 Y140.534 E2.13523
G1 X186.55 Y138.494 E.06768
G1 X118.006 Y69.95 E3.21552
G1 X118.966 Y69.95 E.03184
G1 X100.867 Y88.05 E.84908
G1 X97.726 Y88.05 E.10419
G1 X79.626 Y69.95 E.84908
G1 X80.586 Y69.95 E.03184
G1 X73.45 Y77.086 E.33475
G1 X73.45 Y79.126 E.06768
G1 X82.374 Y88.05 E.41861
G1 X85.515 Y88.05 E.10419
G1 X103.614 Y69.95 E.84908
G1 X102.654 Y69.95 E.03184
G1 X120.754 Y88.05 E.84908
G1 X119.125 Y88.05 E.05401
; WIPE_START
G1 F24000
G1 X120.754 Y88.05 E-.61876
G1 X120.491 Y87.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.411 J1.146 P1  F30000
G1 X186.55 Y111.459 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15476.087
G1 X186.55 Y109.83 E.05401
G1 X129.45 Y166.929 E2.67865
G1 X129.45 Y165.83 E.03647
G1 X149.67 Y186.05 E.94854
G1 X148.71 Y186.05 E.03184
G1 X186.55 Y148.21 E1.77514
G1 X186.55 Y146.17 E.06768
G1 X129.45 Y89.071 E2.67865
G1 X129.45 Y90.17 E.03647
G1 X149.67 Y69.95 E.94854
G1 X148.71 Y69.95 E.03184
G1 X186.55 Y107.79 E1.77514
G1 X186.55 Y102.154 E.18695
G1 X129.45 Y159.254 E2.67865
G1 X129.45 Y158.154 E.03647
G1 X157.346 Y186.05 E1.30863
G1 X156.386 Y186.05 E.03184
G1 X186.55 Y155.886 E1.41504
G1 X186.55 Y153.846 E.06768
G1 X129.45 Y96.746 E2.67865
G1 X129.45 Y97.846 E.03647
G1 X157.346 Y69.95 E1.30863
G1 X156.386 Y69.95 E.03184
G1 X186.55 Y100.114 E1.41504
G1 X186.55 Y94.478 E.18695
G1 X129.45 Y151.578 E2.67865
G1 X129.45 Y150.478 E.03647
G1 X165.022 Y186.05 E1.66873
G1 X164.062 Y186.05 E.03184
G1 X186.55 Y163.562 E1.05494
G1 X186.55 Y161.522 E.06768
G1 X129.45 Y104.422 E2.67865
G1 X129.45 Y105.522 E.03647
G1 X165.022 Y69.95 E1.66873
G1 X164.062 Y69.95 E.03184
G1 X186.55 Y92.438 E1.05494
G1 X186.55 Y86.802 E.18695
G1 X129.45 Y143.902 E2.67865
G1 X129.45 Y142.802 E.03647
G1 X172.698 Y186.05 E2.02882
G1 X171.738 Y186.05 E.03184
G1 X186.55 Y171.238 E.69485
G1 X186.55 Y169.198 E.06768
G1 X129.45 Y112.098 E2.67865
G1 X129.45 Y113.198 E.03647
G1 X172.698 Y69.95 E2.02882
G1 X171.738 Y69.95 E.03184
G1 X186.55 Y84.762 E.69485
G1 X186.55 Y79.126 E.18695
G1 X129.45 Y136.226 E2.67865
G1 X129.45 Y135.126 E.03647
G1 X180.374 Y186.05 E2.38892
G1 X179.414 Y186.05 E.03184
G1 X186.55 Y178.914 E.33475
G1 X186.55 Y176.874 E.06768
G1 X129.45 Y119.774 E2.67865
G1 X129.45 Y120.874 E.03647
G1 X180.374 Y69.95 E2.38892
G1 X179.414 Y69.95 E.03184
G1 X186.55 Y77.086 E.33475
G1 X186.55 Y71.45 E.18695
G1 X129.45 Y128.55 E2.67865
G1 X129.45 Y127.45 E.03647
M73 P34 R35
G1 X186.55 Y184.55 E2.67865
G1 X186.55 Y186.05 E.04976
G1 X186.421 Y186.05 E.00426
; WIPE_START
G1 F24000
G1 X186.55 Y186.05 E-.04876
G1 X186.55 Y184.55 E-.57
G1 X186.287 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.192 J-1.202 P1  F30000
G1 X78.55 Y167.033 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15476.087
G1 X78.55 Y168.661 E.05401
G1 X73.45 Y163.562 E.23922
G1 X73.45 Y161.522 E.06768
G1 X78.55 Y156.422 E.23922
G1 X78.55 Y153.309 E.10327
G1 X73.45 Y148.21 E.23922
G1 X73.45 Y146.17 E.06768
G1 X78.55 Y141.071 E.23922
G1 X78.55 Y137.957 E.10327
G1 X73.45 Y132.858 E.23922
G1 X73.45 Y130.818 E.06768
G1 X78.55 Y125.719 E.23922
G1 X78.55 Y122.605 E.10327
G1 X73.45 Y117.506 E.23922
G1 X73.45 Y115.466 E.06768
G1 X78.55 Y110.367 E.23922
G1 X78.55 Y107.254 E.10327
G1 X73.45 Y102.154 E.23922
G1 X73.45 Y100.114 E.06768
G1 X78.55 Y95.015 E.23922
G1 X78.55 Y91.902 E.10327
G1 X73.45 Y86.802 E.23922
G1 X73.45 Y84.762 E.06768
G1 X88.262 Y69.95 E.69485
G1 X87.302 Y69.95 E.03184
G1 X105.402 Y88.05 E.84908
G1 X108.543 Y88.05 E.10419
G1 X126.642 Y69.95 E.84908
G1 X125.682 Y69.95 E.03184
G1 X186.55 Y130.818 E2.85542
G1 X186.55 Y132.858 E.06768
G1 X133.358 Y186.05 E2.49533
G1 X134.318 Y186.05 E.03184
G1 X118.219 Y169.95 E.75525
G1 X118.754 Y169.95 E.01774
G1 X102.654 Y186.05 E.75525
G1 X103.614 Y186.05 E.03184
G1 X87.515 Y169.95 E.75525
G1 X88.05 Y169.95 E.01774
G1 X73.45 Y184.55 E.68488
G1 X73.45 Y186.05 E.04976
G1 X73.579 Y186.05 E.00426
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X73.45 Y186.05 E-.04875
G1 X73.45 Y184.55 E-.57001
G1 X73.713 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/125
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
G3 Z1.4 I.312 J1.176 P1  F30000
G1 X129.102 Y169.602 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X78.898 Y169.602 E1.66536
G1 X78.898 Y88.398 E2.69369
G1 X129.102 Y88.398 E1.66536
G1 X129.102 Y169.542 E2.6917
G1 X128.71 Y169.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.29 Y169.21 E1.51854
G1 X79.29 Y88.79 E2.47108
G1 X128.71 Y88.79 E1.51854
G1 X128.71 Y169.15 E2.46924
M204 S10000
; WIPE_START
G1 F24000
G1 X126.71 Y169.152 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.071 J-.577 P1  F30000
G1 X73.102 Y69.602 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X186.898 Y69.602 E3.77482
G1 X186.898 Y186.398 E3.87433
G1 X73.102 Y186.398 E3.77482
G1 X73.102 Y69.662 E3.87234
G1 X72.71 Y69.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X187.29 Y69.21 E3.52072
G1 X187.29 Y186.79 E3.61291
G1 X72.71 Y186.79 E3.52072
G1 X72.71 Y69.27 E3.61106
M204 S10000
; WIPE_START
G1 F24000
G1 X74.71 Y69.269 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.628 J-1.042 P1  F30000
G1 X73.579 Y69.95 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X73.45 Y69.95 E.00426
G1 X73.45 Y71.45 E.04976
G1 X90.05 Y88.05 E.77871
G1 X93.191 Y88.05 E.10419
G1 X111.29 Y69.95 E.84908
G1 X110.33 Y69.95 E.03184
G1 X128.429 Y88.05 E.84908
G1 X123.895 Y88.05 E.15043
G1 X141.994 Y69.95 E.84908
G1 X141.034 Y69.95 E.03184
G1 X186.55 Y115.466 E2.13523
G1 X186.55 Y117.506 E.06768
G1 X118.006 Y186.05 E3.21552
G1 X118.966 Y186.05 E.03184
G1 X102.867 Y169.95 E.75525
G1 X103.402 Y169.95 E.01774
G1 X87.302 Y186.05 E.75525
G1 X88.262 Y186.05 E.03184
G1 X73.45 Y171.238 E.69485
G1 X73.45 Y169.198 E.06768
G1 X78.55 Y164.098 E.23922
G1 X78.55 Y160.985 E.10327
G1 X73.45 Y155.886 E.23922
G1 X73.45 Y153.846 E.06768
G1 X78.55 Y148.746 E.23922
G1 X78.55 Y145.633 E.10327
G1 X73.45 Y140.534 E.23922
G1 X73.45 Y138.494 E.06768
G1 X78.55 Y133.395 E.23922
G1 X78.55 Y130.281 E.10327
G1 X73.45 Y125.182 E.23922
G1 X73.45 Y123.142 E.06768
G1 X78.55 Y118.043 E.23922
G1 X78.55 Y114.929 E.10327
G1 X73.45 Y109.83 E.23922
G1 X73.45 Y107.79 E.06768
G1 X78.55 Y102.691 E.23922
G1 X78.55 Y99.578 E.10327
G1 X73.45 Y94.478 E.23922
G1 X73.45 Y92.438 E.06768
G1 X95.938 Y69.95 E1.05494
G1 X94.978 Y69.95 E.03184
G1 X113.078 Y88.05 E.84908
G1 X116.219 Y88.05 E.10419
G1 X134.318 Y69.95 E.84908
G1 X133.358 Y69.95 E.03184
G1 X186.55 Y123.142 E2.49533
G1 X186.55 Y125.182 E.06768
G1 X125.682 Y186.05 E2.85542
G1 X126.642 Y186.05 E.03184
G1 X110.543 Y169.95 E.75525
G1 X111.078 Y169.95 E.01774
G1 X94.978 Y186.05 E.75525
G1 X95.938 Y186.05 E.03184
G1 X79.839 Y169.95 E.75525
G1 X80.374 Y169.95 E.01774
G1 X73.45 Y176.874 E.32479
G1 X73.45 Y178.914 E.06768
G1 X80.586 Y186.05 E.33475
G1 X79.626 Y186.05 E.03184
G1 X95.726 Y169.95 E.75525
G1 X95.191 Y169.95 E.01774
G1 X111.29 Y186.05 E.75525
G1 X110.33 Y186.05 E.03184
G1 X126.429 Y169.95 E.75525
M73 P34 R34
G1 X125.895 Y169.95 E.01774
G1 X141.994 Y186.05 E.75525
G1 X141.034 Y186.05 E.03184
G1 X186.55 Y140.534 E2.13523
G1 X186.55 Y138.494 E.06768
G1 X118.006 Y69.95 E3.21552
G1 X118.966 Y69.95 E.03184
G1 X100.867 Y88.05 E.84908
G1 X97.726 Y88.05 E.10419
G1 X79.626 Y69.95 E.84908
G1 X80.586 Y69.95 E.03184
G1 X73.45 Y77.086 E.33475
G1 X73.45 Y79.126 E.06768
G1 X82.374 Y88.05 E.41861
G1 X85.515 Y88.05 E.10419
G1 X103.614 Y69.95 E.84908
G1 X102.654 Y69.95 E.03184
G1 X120.754 Y88.05 E.84908
G1 X119.125 Y88.05 E.05401
; WIPE_START
G1 F24000
G1 X120.754 Y88.05 E-.61876
G1 X120.491 Y87.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.411 J1.146 P1  F30000
G1 X186.55 Y111.459 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15476.087
G1 X186.55 Y109.83 E.05401
G1 X129.45 Y166.929 E2.67865
G1 X129.45 Y165.83 E.03647
G1 X149.67 Y186.05 E.94854
G1 X148.71 Y186.05 E.03184
G1 X186.55 Y148.21 E1.77514
G1 X186.55 Y146.17 E.06768
G1 X129.45 Y89.071 E2.67865
G1 X129.45 Y90.17 E.03647
G1 X149.67 Y69.95 E.94854
G1 X148.71 Y69.95 E.03184
G1 X186.55 Y107.79 E1.77514
G1 X186.55 Y102.154 E.18695
G1 X129.45 Y159.254 E2.67865
G1 X129.45 Y158.154 E.03647
G1 X157.346 Y186.05 E1.30863
G1 X156.386 Y186.05 E.03184
G1 X186.55 Y155.886 E1.41504
G1 X186.55 Y153.846 E.06768
G1 X129.45 Y96.746 E2.67865
G1 X129.45 Y97.846 E.03647
G1 X157.346 Y69.95 E1.30863
G1 X156.386 Y69.95 E.03184
G1 X186.55 Y100.114 E1.41504
G1 X186.55 Y94.478 E.18695
G1 X129.45 Y151.578 E2.67865
G1 X129.45 Y150.478 E.03647
G1 X165.022 Y186.05 E1.66873
G1 X164.062 Y186.05 E.03184
G1 X186.55 Y163.562 E1.05494
G1 X186.55 Y161.522 E.06768
G1 X129.45 Y104.422 E2.67865
G1 X129.45 Y105.522 E.03647
G1 X165.022 Y69.95 E1.66873
G1 X164.062 Y69.95 E.03184
G1 X186.55 Y92.438 E1.05494
G1 X186.55 Y86.802 E.18695
G1 X129.45 Y143.902 E2.67865
G1 X129.45 Y142.802 E.03647
G1 X172.698 Y186.05 E2.02882
G1 X171.738 Y186.05 E.03184
G1 X186.55 Y171.238 E.69485
G1 X186.55 Y169.198 E.06768
G1 X129.45 Y112.098 E2.67865
G1 X129.45 Y113.198 E.03647
G1 X172.698 Y69.95 E2.02882
G1 X171.738 Y69.95 E.03184
G1 X186.55 Y84.762 E.69485
G1 X186.55 Y79.126 E.18695
G1 X129.45 Y136.226 E2.67865
G1 X129.45 Y135.126 E.03647
G1 X180.374 Y186.05 E2.38892
G1 X179.414 Y186.05 E.03184
G1 X186.55 Y178.914 E.33475
G1 X186.55 Y176.874 E.06768
G1 X129.45 Y119.774 E2.67865
G1 X129.45 Y120.874 E.03647
G1 X180.374 Y69.95 E2.38892
G1 X179.414 Y69.95 E.03184
G1 X186.55 Y77.086 E.33475
G1 X186.55 Y71.45 E.18695
G1 X129.45 Y128.55 E2.67865
G1 X129.45 Y127.45 E.03647
G1 X186.55 Y184.55 E2.67865
G1 X186.55 Y186.05 E.04976
G1 X186.421 Y186.05 E.00426
; WIPE_START
G1 F24000
G1 X186.55 Y186.05 E-.04876
G1 X186.55 Y184.55 E-.57
G1 X186.287 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.192 J-1.202 P1  F30000
G1 X78.55 Y167.033 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15476.087
G1 X78.55 Y168.661 E.05401
G1 X73.45 Y163.562 E.23922
G1 X73.45 Y161.522 E.06768
G1 X78.55 Y156.422 E.23922
G1 X78.55 Y153.309 E.10327
G1 X73.45 Y148.21 E.23922
G1 X73.45 Y146.17 E.06768
G1 X78.55 Y141.071 E.23922
G1 X78.55 Y137.957 E.10327
G1 X73.45 Y132.858 E.23922
G1 X73.45 Y130.818 E.06768
G1 X78.55 Y125.719 E.23922
G1 X78.55 Y122.605 E.10327
G1 X73.45 Y117.506 E.23922
G1 X73.45 Y115.466 E.06768
G1 X78.55 Y110.367 E.23922
G1 X78.55 Y107.254 E.10327
G1 X73.45 Y102.154 E.23922
G1 X73.45 Y100.114 E.06768
G1 X78.55 Y95.015 E.23922
G1 X78.55 Y91.902 E.10327
G1 X73.45 Y86.802 E.23922
G1 X73.45 Y84.762 E.06768
G1 X88.262 Y69.95 E.69485
G1 X87.302 Y69.95 E.03184
G1 X105.402 Y88.05 E.84908
G1 X108.543 Y88.05 E.10419
G1 X126.642 Y69.95 E.84908
G1 X125.682 Y69.95 E.03184
G1 X186.55 Y130.818 E2.85542
G1 X186.55 Y132.858 E.06768
G1 X133.358 Y186.05 E2.49533
G1 X134.318 Y186.05 E.03184
M73 P35 R34
G1 X118.219 Y169.95 E.75525
G1 X118.754 Y169.95 E.01774
G1 X102.654 Y186.05 E.75525
G1 X103.614 Y186.05 E.03184
G1 X87.515 Y169.95 E.75525
G1 X88.05 Y169.95 E.01774
G1 X73.45 Y184.55 E.68488
G1 X73.45 Y186.05 E.04976
G1 X73.579 Y186.05 E.00426
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X73.45 Y186.05 E-.04875
G1 X73.45 Y184.55 E-.57001
G1 X73.713 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/125
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
G3 Z1.6 I.312 J1.176 P1  F30000
G1 X129.102 Y169.602 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X78.898 Y169.602 E1.66536
G1 X78.898 Y88.398 E2.69369
G1 X129.102 Y88.398 E1.66536
G1 X129.102 Y169.542 E2.6917
G1 X128.71 Y169.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.29 Y169.21 E1.51854
G1 X79.29 Y88.79 E2.47108
G1 X128.71 Y88.79 E1.51854
G1 X128.71 Y169.15 E2.46924
M204 S10000
; WIPE_START
G1 F24000
G1 X126.71 Y169.152 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.071 J-.577 P1  F30000
G1 X73.102 Y69.602 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X186.898 Y69.602 E3.77482
G1 X186.898 Y186.398 E3.87433
G1 X73.102 Y186.398 E3.77482
G1 X73.102 Y69.662 E3.87234
G1 X72.71 Y69.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X187.29 Y69.21 E3.52072
G1 X187.29 Y186.79 E3.61291
G1 X72.71 Y186.79 E3.52072
G1 X72.71 Y69.27 E3.61106
M204 S10000
; WIPE_START
G1 F24000
G1 X74.71 Y69.269 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.628 J-1.042 P1  F30000
G1 X73.579 Y69.95 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X73.45 Y69.95 E.00426
G1 X73.45 Y71.45 E.04976
G1 X90.05 Y88.05 E.77871
G1 X93.191 Y88.05 E.10419
G1 X111.29 Y69.95 E.84908
G1 X110.33 Y69.95 E.03184
G1 X128.429 Y88.05 E.84908
G1 X123.895 Y88.05 E.15043
G1 X141.994 Y69.95 E.84908
G1 X141.034 Y69.95 E.03184
G1 X186.55 Y115.466 E2.13523
G1 X186.55 Y117.506 E.06768
G1 X118.006 Y186.05 E3.21552
G1 X118.966 Y186.05 E.03184
G1 X102.867 Y169.95 E.75525
G1 X103.402 Y169.95 E.01774
G1 X87.302 Y186.05 E.75525
G1 X88.262 Y186.05 E.03184
G1 X73.45 Y171.238 E.69485
G1 X73.45 Y169.198 E.06768
G1 X78.55 Y164.098 E.23922
G1 X78.55 Y160.985 E.10327
G1 X73.45 Y155.886 E.23922
G1 X73.45 Y153.846 E.06768
G1 X78.55 Y148.746 E.23922
G1 X78.55 Y145.633 E.10327
G1 X73.45 Y140.534 E.23922
G1 X73.45 Y138.494 E.06768
G1 X78.55 Y133.395 E.23922
G1 X78.55 Y130.281 E.10327
G1 X73.45 Y125.182 E.23922
G1 X73.45 Y123.142 E.06768
G1 X78.55 Y118.043 E.23922
G1 X78.55 Y114.929 E.10327
G1 X73.45 Y109.83 E.23922
G1 X73.45 Y107.79 E.06768
G1 X78.55 Y102.691 E.23922
G1 X78.55 Y99.578 E.10327
G1 X73.45 Y94.478 E.23922
G1 X73.45 Y92.438 E.06768
G1 X95.938 Y69.95 E1.05494
G1 X94.978 Y69.95 E.03184
G1 X113.078 Y88.05 E.84908
G1 X116.219 Y88.05 E.10419
G1 X134.318 Y69.95 E.84908
G1 X133.358 Y69.95 E.03184
G1 X186.55 Y123.142 E2.49533
G1 X186.55 Y125.182 E.06768
G1 X125.682 Y186.05 E2.85542
G1 X126.642 Y186.05 E.03184
G1 X110.543 Y169.95 E.75525
G1 X111.078 Y169.95 E.01774
G1 X94.978 Y186.05 E.75525
G1 X95.938 Y186.05 E.03184
G1 X79.839 Y169.95 E.75525
G1 X80.374 Y169.95 E.01774
G1 X73.45 Y176.874 E.32479
G1 X73.45 Y178.914 E.06768
G1 X80.586 Y186.05 E.33475
G1 X79.626 Y186.05 E.03184
G1 X95.726 Y169.95 E.75525
G1 X95.191 Y169.95 E.01774
G1 X111.29 Y186.05 E.75525
G1 X110.33 Y186.05 E.03184
G1 X126.429 Y169.95 E.75525
G1 X125.895 Y169.95 E.01774
G1 X141.994 Y186.05 E.75525
G1 X141.034 Y186.05 E.03184
G1 X186.55 Y140.534 E2.13523
G1 X186.55 Y138.494 E.06768
G1 X118.006 Y69.95 E3.21552
G1 X118.966 Y69.95 E.03184
G1 X100.867 Y88.05 E.84908
G1 X97.726 Y88.05 E.10419
G1 X79.626 Y69.95 E.84908
G1 X80.586 Y69.95 E.03184
G1 X73.45 Y77.086 E.33475
G1 X73.45 Y79.126 E.06768
G1 X82.374 Y88.05 E.41861
G1 X85.515 Y88.05 E.10419
G1 X103.614 Y69.95 E.84908
G1 X102.654 Y69.95 E.03184
G1 X120.754 Y88.05 E.84908
G1 X119.125 Y88.05 E.05401
; WIPE_START
G1 F24000
G1 X120.754 Y88.05 E-.61876
G1 X120.491 Y87.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.411 J1.146 P1  F30000
G1 X186.55 Y111.459 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F15476.087
G1 X186.55 Y109.83 E.05401
G1 X129.45 Y166.929 E2.67865
G1 X129.45 Y165.83 E.03647
G1 X149.67 Y186.05 E.94854
G1 X148.71 Y186.05 E.03184
G1 X186.55 Y148.21 E1.77514
G1 X186.55 Y146.17 E.06768
G1 X129.45 Y89.071 E2.67865
G1 X129.45 Y90.17 E.03647
G1 X149.67 Y69.95 E.94854
G1 X148.71 Y69.95 E.03184
G1 X186.55 Y107.79 E1.77514
G1 X186.55 Y102.154 E.18695
G1 X129.45 Y159.254 E2.67865
G1 X129.45 Y158.154 E.03647
G1 X157.346 Y186.05 E1.30863
G1 X156.386 Y186.05 E.03184
G1 X186.55 Y155.886 E1.41504
G1 X186.55 Y153.846 E.06768
G1 X129.45 Y96.746 E2.67865
G1 X129.45 Y97.846 E.03647
G1 X157.346 Y69.95 E1.30863
G1 X156.386 Y69.95 E.03184
G1 X186.55 Y100.114 E1.41504
G1 X186.55 Y94.478 E.18695
G1 X129.45 Y151.578 E2.67865
G1 X129.45 Y150.478 E.03647
G1 X165.022 Y186.05 E1.66873
G1 X164.062 Y186.05 E.03184
G1 X186.55 Y163.562 E1.05494
G1 X186.55 Y161.522 E.06768
G1 X129.45 Y104.422 E2.67865
G1 X129.45 Y105.522 E.03647
G1 X165.022 Y69.95 E1.66873
G1 X164.062 Y69.95 E.03184
G1 X186.55 Y92.438 E1.05494
G1 X186.55 Y86.802 E.18695
G1 X129.45 Y143.902 E2.67865
G1 X129.45 Y142.802 E.03647
G1 X172.698 Y186.05 E2.02882
G1 X171.738 Y186.05 E.03184
G1 X186.55 Y171.238 E.69485
G1 X186.55 Y169.198 E.06768
G1 X129.45 Y112.098 E2.67865
G1 X129.45 Y113.198 E.03647
G1 X172.698 Y69.95 E2.02882
G1 X171.738 Y69.95 E.03184
G1 X186.55 Y84.762 E.69485
G1 X186.55 Y79.126 E.18695
G1 X129.45 Y136.226 E2.67865
G1 X129.45 Y135.126 E.03647
G1 X180.374 Y186.05 E2.38892
G1 X179.414 Y186.05 E.03184
G1 X186.55 Y178.914 E.33475
G1 X186.55 Y176.874 E.06768
G1 X129.45 Y119.774 E2.67865
G1 X129.45 Y120.874 E.03647
G1 X180.374 Y69.95 E2.38892
G1 X179.414 Y69.95 E.03184
G1 X186.55 Y77.086 E.33475
G1 X186.55 Y71.45 E.18695
G1 X129.45 Y128.55 E2.67865
G1 X129.45 Y127.45 E.03647
G1 X186.55 Y184.55 E2.67865
G1 X186.55 Y186.05 E.04976
G1 X186.421 Y186.05 E.00426
; WIPE_START
G1 F24000
G1 X186.55 Y186.05 E-.04876
G1 X186.55 Y184.55 E-.57
G1 X186.287 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.192 J-1.202 P1  F30000
G1 X78.55 Y167.033 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F15476.087
G1 X78.55 Y168.661 E.05401
G1 X73.45 Y163.562 E.23922
G1 X73.45 Y161.522 E.06768
G1 X78.55 Y156.422 E.23922
G1 X78.55 Y153.309 E.10327
G1 X73.45 Y148.21 E.23922
G1 X73.45 Y146.17 E.06768
G1 X78.55 Y141.071 E.23922
G1 X78.55 Y137.957 E.10327
G1 X73.45 Y132.858 E.23922
G1 X73.45 Y130.818 E.06768
G1 X78.55 Y125.719 E.23922
G1 X78.55 Y122.605 E.10327
G1 X73.45 Y117.506 E.23922
G1 X73.45 Y115.466 E.06768
G1 X78.55 Y110.367 E.23922
G1 X78.55 Y107.254 E.10327
G1 X73.45 Y102.154 E.23922
G1 X73.45 Y100.114 E.06768
G1 X78.55 Y95.015 E.23922
G1 X78.55 Y91.902 E.10327
G1 X73.45 Y86.802 E.23922
G1 X73.45 Y84.762 E.06768
G1 X88.262 Y69.95 E.69485
G1 X87.302 Y69.95 E.03184
G1 X105.402 Y88.05 E.84908
G1 X108.543 Y88.05 E.10419
G1 X126.642 Y69.95 E.84908
G1 X125.682 Y69.95 E.03184
G1 X186.55 Y130.818 E2.85542
G1 X186.55 Y132.858 E.06768
G1 X133.358 Y186.05 E2.49533
G1 X134.318 Y186.05 E.03184
G1 X118.219 Y169.95 E.75525
G1 X118.754 Y169.95 E.01774
G1 X102.654 Y186.05 E.75525
G1 X103.614 Y186.05 E.03184
G1 X87.515 Y169.95 E.75525
G1 X88.05 Y169.95 E.01774
G1 X73.45 Y184.55 E.68488
G1 X73.45 Y186.05 E.04976
G1 X73.579 Y186.05 E.00426
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X73.45 Y186.05 E-.04875
G1 X73.45 Y184.55 E-.57001
G1 X73.713 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/125
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
G3 Z1.8 I.312 J1.176 P1  F30000
G1 X129.102 Y169.602 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X78.898 Y169.602 E1.66536
G1 X78.898 Y88.398 E2.69369
G1 X129.102 Y88.398 E1.66536
G1 X129.102 Y169.542 E2.6917
G1 X128.71 Y169.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.29 Y169.21 E1.51854
G1 X79.29 Y88.79 E2.47108
G1 X128.71 Y88.79 E1.51854
G1 X128.71 Y169.15 E2.46924
M204 S10000
; WIPE_START
G1 F24000
G1 X126.71 Y169.152 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.071 J-.577 P1  F30000
G1 X73.102 Y69.602 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X186.898 Y69.602 E3.77482
G1 X186.898 Y186.398 E3.87433
G1 X73.102 Y186.398 E3.77482
G1 X73.102 Y69.662 E3.87234
G1 X72.71 Y69.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X187.29 Y69.21 E3.52072
G1 X187.29 Y186.79 E3.61291
G1 X72.71 Y186.79 E3.52072
G1 X72.71 Y69.27 E3.61106
M204 S10000
; WIPE_START
G1 F24000
G1 X74.71 Y69.269 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.628 J-1.042 P1  F30000
G1 X73.579 Y69.95 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X73.45 Y69.95 E.00426
G1 X73.45 Y71.45 E.04976
G1 X90.05 Y88.05 E.77871
G1 X93.191 Y88.05 E.10419
G1 X111.29 Y69.95 E.84908
G1 X110.33 Y69.95 E.03184
G1 X128.429 Y88.05 E.84908
G1 X123.895 Y88.05 E.15043
G1 X141.994 Y69.95 E.84908
G1 X141.034 Y69.95 E.03184
G1 X186.55 Y115.466 E2.13523
G1 X186.55 Y117.506 E.06768
G1 X118.006 Y186.05 E3.21552
G1 X118.966 Y186.05 E.03184
G1 X102.867 Y169.95 E.75525
G1 X103.402 Y169.95 E.01774
G1 X87.302 Y186.05 E.75525
G1 X88.262 Y186.05 E.03184
G1 X73.45 Y171.238 E.69485
G1 X73.45 Y169.198 E.06768
G1 X78.55 Y164.098 E.23922
G1 X78.55 Y160.985 E.10327
G1 X73.45 Y155.886 E.23922
G1 X73.45 Y153.846 E.06768
M73 P36 R34
G1 X78.55 Y148.746 E.23922
G1 X78.55 Y145.633 E.10327
G1 X73.45 Y140.534 E.23922
G1 X73.45 Y138.494 E.06768
G1 X78.55 Y133.395 E.23922
G1 X78.55 Y130.281 E.10327
G1 X73.45 Y125.182 E.23922
G1 X73.45 Y123.142 E.06768
G1 X78.55 Y118.043 E.23922
G1 X78.55 Y114.929 E.10327
G1 X73.45 Y109.83 E.23922
G1 X73.45 Y107.79 E.06768
G1 X78.55 Y102.691 E.23922
G1 X78.55 Y99.578 E.10327
G1 X73.45 Y94.478 E.23922
G1 X73.45 Y92.438 E.06768
G1 X95.938 Y69.95 E1.05494
G1 X94.978 Y69.95 E.03184
G1 X113.078 Y88.05 E.84908
G1 X116.219 Y88.05 E.10419
G1 X134.318 Y69.95 E.84908
G1 X133.358 Y69.95 E.03184
G1 X186.55 Y123.142 E2.49533
G1 X186.55 Y125.182 E.06768
G1 X125.682 Y186.05 E2.85542
G1 X126.642 Y186.05 E.03184
G1 X110.543 Y169.95 E.75525
G1 X111.078 Y169.95 E.01774
G1 X94.978 Y186.05 E.75525
G1 X95.938 Y186.05 E.03184
G1 X79.839 Y169.95 E.75525
G1 X80.374 Y169.95 E.01774
G1 X73.45 Y176.874 E.32479
G1 X73.45 Y178.914 E.06768
G1 X80.586 Y186.05 E.33475
G1 X79.626 Y186.05 E.03184
G1 X95.726 Y169.95 E.75525
G1 X95.191 Y169.95 E.01774
G1 X111.29 Y186.05 E.75525
G1 X110.33 Y186.05 E.03184
G1 X126.429 Y169.95 E.75525
G1 X125.895 Y169.95 E.01774
G1 X141.994 Y186.05 E.75525
G1 X141.034 Y186.05 E.03184
G1 X186.55 Y140.534 E2.13523
G1 X186.55 Y138.494 E.06768
G1 X118.006 Y69.95 E3.21552
G1 X118.966 Y69.95 E.03184
G1 X100.867 Y88.05 E.84908
G1 X97.726 Y88.05 E.10419
G1 X79.626 Y69.95 E.84908
G1 X80.586 Y69.95 E.03184
G1 X73.45 Y77.086 E.33475
G1 X73.45 Y79.126 E.06768
G1 X82.374 Y88.05 E.41861
G1 X85.515 Y88.05 E.10419
G1 X103.614 Y69.95 E.84908
G1 X102.654 Y69.95 E.03184
G1 X120.754 Y88.05 E.84908
G1 X119.125 Y88.05 E.05401
; WIPE_START
G1 F24000
G1 X120.754 Y88.05 E-.61876
G1 X120.491 Y87.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.411 J1.146 P1  F30000
G1 X186.55 Y111.459 Z2
G1 Z1.6
G1 E.8 F1800
G1 F15476.087
G1 X186.55 Y109.83 E.05401
G1 X129.45 Y166.929 E2.67865
G1 X129.45 Y165.83 E.03647
G1 X149.67 Y186.05 E.94854
G1 X148.71 Y186.05 E.03184
G1 X186.55 Y148.21 E1.77514
G1 X186.55 Y146.17 E.06768
G1 X129.45 Y89.071 E2.67865
G1 X129.45 Y90.17 E.03647
G1 X149.67 Y69.95 E.94854
G1 X148.71 Y69.95 E.03184
G1 X186.55 Y107.79 E1.77514
G1 X186.55 Y102.154 E.18695
G1 X129.45 Y159.254 E2.67865
G1 X129.45 Y158.154 E.03647
G1 X157.346 Y186.05 E1.30863
G1 X156.386 Y186.05 E.03184
G1 X186.55 Y155.886 E1.41504
G1 X186.55 Y153.846 E.06768
G1 X129.45 Y96.746 E2.67865
G1 X129.45 Y97.846 E.03647
G1 X157.346 Y69.95 E1.30863
G1 X156.386 Y69.95 E.03184
G1 X186.55 Y100.114 E1.41504
G1 X186.55 Y94.478 E.18695
G1 X129.45 Y151.578 E2.67865
G1 X129.45 Y150.478 E.03647
G1 X165.022 Y186.05 E1.66873
G1 X164.062 Y186.05 E.03184
G1 X186.55 Y163.562 E1.05494
G1 X186.55 Y161.522 E.06768
G1 X129.45 Y104.422 E2.67865
G1 X129.45 Y105.522 E.03647
G1 X165.022 Y69.95 E1.66873
G1 X164.062 Y69.95 E.03184
G1 X186.55 Y92.438 E1.05494
G1 X186.55 Y86.802 E.18695
G1 X129.45 Y143.902 E2.67865
G1 X129.45 Y142.802 E.03647
G1 X172.698 Y186.05 E2.02882
G1 X171.738 Y186.05 E.03184
G1 X186.55 Y171.238 E.69485
G1 X186.55 Y169.198 E.06768
G1 X129.45 Y112.098 E2.67865
G1 X129.45 Y113.198 E.03647
G1 X172.698 Y69.95 E2.02882
G1 X171.738 Y69.95 E.03184
G1 X186.55 Y84.762 E.69485
G1 X186.55 Y79.126 E.18695
G1 X129.45 Y136.226 E2.67865
G1 X129.45 Y135.126 E.03647
G1 X180.374 Y186.05 E2.38892
G1 X179.414 Y186.05 E.03184
G1 X186.55 Y178.914 E.33475
G1 X186.55 Y176.874 E.06768
G1 X129.45 Y119.774 E2.67865
G1 X129.45 Y120.874 E.03647
G1 X180.374 Y69.95 E2.38892
G1 X179.414 Y69.95 E.03184
G1 X186.55 Y77.086 E.33475
G1 X186.55 Y71.45 E.18695
G1 X129.45 Y128.55 E2.67865
G1 X129.45 Y127.45 E.03647
G1 X186.55 Y184.55 E2.67865
G1 X186.55 Y186.05 E.04976
G1 X186.421 Y186.05 E.00426
; WIPE_START
G1 F24000
G1 X186.55 Y186.05 E-.04876
G1 X186.55 Y184.55 E-.57
G1 X186.287 Y184.287 E-.14124
; WIPE_END
M73 P36 R33
G1 E-.04 F1800
G17
G3 Z2 I.192 J-1.202 P1  F30000
G1 X78.55 Y167.033 Z2
G1 Z1.6
G1 E.8 F1800
G1 F15476.087
G1 X78.55 Y168.661 E.05401
G1 X73.45 Y163.562 E.23922
G1 X73.45 Y161.522 E.06768
G1 X78.55 Y156.422 E.23922
G1 X78.55 Y153.309 E.10327
G1 X73.45 Y148.21 E.23922
G1 X73.45 Y146.17 E.06768
G1 X78.55 Y141.071 E.23922
G1 X78.55 Y137.957 E.10327
G1 X73.45 Y132.858 E.23922
G1 X73.45 Y130.818 E.06768
G1 X78.55 Y125.719 E.23922
G1 X78.55 Y122.605 E.10327
G1 X73.45 Y117.506 E.23922
G1 X73.45 Y115.466 E.06768
G1 X78.55 Y110.367 E.23922
G1 X78.55 Y107.254 E.10327
G1 X73.45 Y102.154 E.23922
G1 X73.45 Y100.114 E.06768
G1 X78.55 Y95.015 E.23922
G1 X78.55 Y91.902 E.10327
G1 X73.45 Y86.802 E.23922
G1 X73.45 Y84.762 E.06768
G1 X88.262 Y69.95 E.69485
G1 X87.302 Y69.95 E.03184
G1 X105.402 Y88.05 E.84908
G1 X108.543 Y88.05 E.10419
G1 X126.642 Y69.95 E.84908
G1 X125.682 Y69.95 E.03184
G1 X186.55 Y130.818 E2.85542
G1 X186.55 Y132.858 E.06768
G1 X133.358 Y186.05 E2.49533
G1 X134.318 Y186.05 E.03184
G1 X118.219 Y169.95 E.75525
G1 X118.754 Y169.95 E.01774
G1 X102.654 Y186.05 E.75525
G1 X103.614 Y186.05 E.03184
G1 X87.515 Y169.95 E.75525
G1 X88.05 Y169.95 E.01774
G1 X73.45 Y184.55 E.68488
G1 X73.45 Y186.05 E.04976
G1 X73.579 Y186.05 E.00426
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X73.45 Y186.05 E-.04875
G1 X73.45 Y184.55 E-.57001
G1 X73.713 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/125
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
G3 Z2 I.312 J1.176 P1  F30000
G1 X129.102 Y169.602 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X78.898 Y169.602 E1.66536
G1 X78.898 Y88.398 E2.69369
G1 X129.102 Y88.398 E1.66536
G1 X129.102 Y169.542 E2.6917
G1 X128.71 Y169.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.29 Y169.21 E1.51854
G1 X79.29 Y88.79 E2.47108
G1 X128.71 Y88.79 E1.51854
G1 X128.71 Y169.15 E2.46924
M204 S10000
; WIPE_START
G1 F24000
G1 X126.71 Y169.152 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.071 J-.577 P1  F30000
G1 X73.102 Y69.602 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X186.898 Y69.602 E3.77482
G1 X186.898 Y186.398 E3.87433
G1 X73.102 Y186.398 E3.77482
G1 X73.102 Y69.662 E3.87234
G1 X72.71 Y69.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X187.29 Y69.21 E3.52072
G1 X187.29 Y186.79 E3.61291
G1 X72.71 Y186.79 E3.52072
G1 X72.71 Y69.27 E3.61106
M204 S10000
; WIPE_START
G1 F24000
G1 X74.71 Y69.269 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.628 J-1.042 P1  F30000
G1 X73.579 Y69.95 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X73.45 Y69.95 E.00426
G1 X73.45 Y71.45 E.04976
G1 X90.05 Y88.05 E.77871
G1 X93.191 Y88.05 E.10419
G1 X111.29 Y69.95 E.84908
G1 X110.33 Y69.95 E.03184
G1 X128.429 Y88.05 E.84908
G1 X123.895 Y88.05 E.15043
G1 X141.994 Y69.95 E.84908
G1 X141.034 Y69.95 E.03184
G1 X186.55 Y115.466 E2.13523
G1 X186.55 Y117.506 E.06768
G1 X118.006 Y186.05 E3.21552
G1 X118.966 Y186.05 E.03184
G1 X102.867 Y169.95 E.75525
G1 X103.402 Y169.95 E.01774
G1 X87.302 Y186.05 E.75525
G1 X88.262 Y186.05 E.03184
G1 X73.45 Y171.238 E.69485
G1 X73.45 Y169.198 E.06768
G1 X78.55 Y164.098 E.23922
G1 X78.55 Y160.985 E.10327
G1 X73.45 Y155.886 E.23922
G1 X73.45 Y153.846 E.06768
G1 X78.55 Y148.746 E.23922
G1 X78.55 Y145.633 E.10327
G1 X73.45 Y140.534 E.23922
G1 X73.45 Y138.494 E.06768
G1 X78.55 Y133.395 E.23922
G1 X78.55 Y130.281 E.10327
G1 X73.45 Y125.182 E.23922
G1 X73.45 Y123.142 E.06768
G1 X78.55 Y118.043 E.23922
G1 X78.55 Y114.929 E.10327
G1 X73.45 Y109.83 E.23922
G1 X73.45 Y107.79 E.06768
G1 X78.55 Y102.691 E.23922
G1 X78.55 Y99.578 E.10327
G1 X73.45 Y94.478 E.23922
G1 X73.45 Y92.438 E.06768
G1 X95.938 Y69.95 E1.05494
G1 X94.978 Y69.95 E.03184
G1 X113.078 Y88.05 E.84908
G1 X116.219 Y88.05 E.10419
G1 X134.318 Y69.95 E.84908
G1 X133.358 Y69.95 E.03184
G1 X186.55 Y123.142 E2.49533
G1 X186.55 Y125.182 E.06768
G1 X125.682 Y186.05 E2.85542
G1 X126.642 Y186.05 E.03184
G1 X110.543 Y169.95 E.75525
G1 X111.078 Y169.95 E.01774
G1 X94.978 Y186.05 E.75525
G1 X95.938 Y186.05 E.03184
M73 P37 R33
G1 X79.839 Y169.95 E.75525
G1 X80.374 Y169.95 E.01774
G1 X73.45 Y176.874 E.32479
G1 X73.45 Y178.914 E.06768
G1 X80.586 Y186.05 E.33475
G1 X79.626 Y186.05 E.03184
G1 X95.726 Y169.95 E.75525
G1 X95.191 Y169.95 E.01774
G1 X111.29 Y186.05 E.75525
G1 X110.33 Y186.05 E.03184
G1 X126.429 Y169.95 E.75525
G1 X125.895 Y169.95 E.01774
G1 X141.994 Y186.05 E.75525
G1 X141.034 Y186.05 E.03184
G1 X186.55 Y140.534 E2.13523
G1 X186.55 Y138.494 E.06768
G1 X118.006 Y69.95 E3.21552
G1 X118.966 Y69.95 E.03184
G1 X100.867 Y88.05 E.84908
G1 X97.726 Y88.05 E.10419
G1 X79.626 Y69.95 E.84908
G1 X80.586 Y69.95 E.03184
G1 X73.45 Y77.086 E.33475
G1 X73.45 Y79.126 E.06768
G1 X82.374 Y88.05 E.41861
G1 X85.515 Y88.05 E.10419
G1 X103.614 Y69.95 E.84908
G1 X102.654 Y69.95 E.03184
G1 X120.754 Y88.05 E.84908
G1 X119.125 Y88.05 E.05401
; WIPE_START
G1 F24000
G1 X120.754 Y88.05 E-.61876
G1 X120.491 Y87.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.411 J1.146 P1  F30000
G1 X186.55 Y111.459 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F15476.087
G1 X186.55 Y109.83 E.05401
G1 X129.45 Y166.929 E2.67865
G1 X129.45 Y165.83 E.03647
G1 X149.67 Y186.05 E.94854
G1 X148.71 Y186.05 E.03184
G1 X186.55 Y148.21 E1.77514
G1 X186.55 Y146.17 E.06768
G1 X129.45 Y89.071 E2.67865
G1 X129.45 Y90.17 E.03647
G1 X149.67 Y69.95 E.94854
G1 X148.71 Y69.95 E.03184
G1 X186.55 Y107.79 E1.77514
G1 X186.55 Y102.154 E.18695
G1 X129.45 Y159.254 E2.67865
G1 X129.45 Y158.154 E.03647
G1 X157.346 Y186.05 E1.30863
G1 X156.386 Y186.05 E.03184
G1 X186.55 Y155.886 E1.41504
G1 X186.55 Y153.846 E.06768
G1 X129.45 Y96.746 E2.67865
G1 X129.45 Y97.846 E.03647
G1 X157.346 Y69.95 E1.30863
G1 X156.386 Y69.95 E.03184
G1 X186.55 Y100.114 E1.41504
G1 X186.55 Y94.478 E.18695
G1 X129.45 Y151.578 E2.67865
G1 X129.45 Y150.478 E.03647
G1 X165.022 Y186.05 E1.66873
G1 X164.062 Y186.05 E.03184
G1 X186.55 Y163.562 E1.05494
G1 X186.55 Y161.522 E.06768
G1 X129.45 Y104.422 E2.67865
G1 X129.45 Y105.522 E.03647
G1 X165.022 Y69.95 E1.66873
G1 X164.062 Y69.95 E.03184
G1 X186.55 Y92.438 E1.05494
G1 X186.55 Y86.802 E.18695
G1 X129.45 Y143.902 E2.67865
G1 X129.45 Y142.802 E.03647
G1 X172.698 Y186.05 E2.02882
G1 X171.738 Y186.05 E.03184
G1 X186.55 Y171.238 E.69485
G1 X186.55 Y169.198 E.06768
G1 X129.45 Y112.098 E2.67865
G1 X129.45 Y113.198 E.03647
G1 X172.698 Y69.95 E2.02882
G1 X171.738 Y69.95 E.03184
G1 X186.55 Y84.762 E.69485
G1 X186.55 Y79.126 E.18695
G1 X129.45 Y136.226 E2.67865
G1 X129.45 Y135.126 E.03647
G1 X180.374 Y186.05 E2.38892
G1 X179.414 Y186.05 E.03184
G1 X186.55 Y178.914 E.33475
G1 X186.55 Y176.874 E.06768
G1 X129.45 Y119.774 E2.67865
G1 X129.45 Y120.874 E.03647
G1 X180.374 Y69.95 E2.38892
G1 X179.414 Y69.95 E.03184
G1 X186.55 Y77.086 E.33475
G1 X186.55 Y71.45 E.18695
G1 X129.45 Y128.55 E2.67865
G1 X129.45 Y127.45 E.03647
G1 X186.55 Y184.55 E2.67865
G1 X186.55 Y186.05 E.04976
G1 X186.421 Y186.05 E.00426
; WIPE_START
G1 F24000
G1 X186.55 Y186.05 E-.04876
G1 X186.55 Y184.55 E-.57
G1 X186.287 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.192 J-1.202 P1  F30000
G1 X78.55 Y167.033 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F15476.087
G1 X78.55 Y168.661 E.05401
G1 X73.45 Y163.562 E.23922
G1 X73.45 Y161.522 E.06768
G1 X78.55 Y156.422 E.23922
G1 X78.55 Y153.309 E.10327
G1 X73.45 Y148.21 E.23922
G1 X73.45 Y146.17 E.06768
G1 X78.55 Y141.071 E.23922
G1 X78.55 Y137.957 E.10327
G1 X73.45 Y132.858 E.23922
G1 X73.45 Y130.818 E.06768
G1 X78.55 Y125.719 E.23922
G1 X78.55 Y122.605 E.10327
G1 X73.45 Y117.506 E.23922
G1 X73.45 Y115.466 E.06768
G1 X78.55 Y110.367 E.23922
G1 X78.55 Y107.254 E.10327
G1 X73.45 Y102.154 E.23922
G1 X73.45 Y100.114 E.06768
G1 X78.55 Y95.015 E.23922
G1 X78.55 Y91.902 E.10327
G1 X73.45 Y86.802 E.23922
G1 X73.45 Y84.762 E.06768
G1 X88.262 Y69.95 E.69485
G1 X87.302 Y69.95 E.03184
G1 X105.402 Y88.05 E.84908
G1 X108.543 Y88.05 E.10419
G1 X126.642 Y69.95 E.84908
G1 X125.682 Y69.95 E.03184
G1 X186.55 Y130.818 E2.85542
G1 X186.55 Y132.858 E.06768
G1 X133.358 Y186.05 E2.49533
G1 X134.318 Y186.05 E.03184
G1 X118.219 Y169.95 E.75525
G1 X118.754 Y169.95 E.01774
G1 X102.654 Y186.05 E.75525
G1 X103.614 Y186.05 E.03184
G1 X87.515 Y169.95 E.75525
G1 X88.05 Y169.95 E.01774
G1 X73.45 Y184.55 E.68488
G1 X73.45 Y186.05 E.04976
G1 X73.579 Y186.05 E.00426
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X73.45 Y186.05 E-.04875
G1 X73.45 Y184.55 E-.57001
G1 X73.713 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/125
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
G3 Z2.2 I.312 J1.176 P1  F30000
G1 X129.102 Y169.602 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X78.898 Y169.602 E1.66536
G1 X78.898 Y88.398 E2.69369
G1 X129.102 Y88.398 E1.66536
G1 X129.102 Y169.542 E2.6917
G1 X128.71 Y169.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.29 Y169.21 E1.51854
G1 X79.29 Y88.79 E2.47108
G1 X128.71 Y88.79 E1.51854
G1 X128.71 Y169.15 E2.46924
M204 S10000
; WIPE_START
G1 F24000
G1 X126.71 Y169.152 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.071 J-.577 P1  F30000
G1 X73.102 Y69.602 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X186.898 Y69.602 E3.77482
G1 X186.898 Y186.398 E3.87433
G1 X73.102 Y186.398 E3.77482
G1 X73.102 Y69.662 E3.87234
G1 X72.71 Y69.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X187.29 Y69.21 E3.52072
G1 X187.29 Y186.79 E3.61291
G1 X72.71 Y186.79 E3.52072
G1 X72.71 Y69.27 E3.61106
M204 S10000
; WIPE_START
G1 F24000
G1 X74.71 Y69.269 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.628 J-1.042 P1  F30000
G1 X73.579 Y69.95 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X73.45 Y69.95 E.00426
G1 X73.45 Y71.45 E.04976
G1 X90.05 Y88.05 E.77871
G1 X93.191 Y88.05 E.10419
G1 X111.29 Y69.95 E.84908
G1 X110.33 Y69.95 E.03184
G1 X128.429 Y88.05 E.84908
G1 X123.895 Y88.05 E.15043
G1 X141.994 Y69.95 E.84908
G1 X141.034 Y69.95 E.03184
G1 X186.55 Y115.466 E2.13523
G1 X186.55 Y117.506 E.06768
G1 X118.006 Y186.05 E3.21552
G1 X118.966 Y186.05 E.03184
G1 X102.867 Y169.95 E.75525
G1 X103.402 Y169.95 E.01774
G1 X87.302 Y186.05 E.75525
G1 X88.262 Y186.05 E.03184
G1 X73.45 Y171.238 E.69485
G1 X73.45 Y169.198 E.06768
G1 X78.55 Y164.098 E.23922
G1 X78.55 Y160.985 E.10327
G1 X73.45 Y155.886 E.23922
G1 X73.45 Y153.846 E.06768
G1 X78.55 Y148.746 E.23922
G1 X78.55 Y145.633 E.10327
G1 X73.45 Y140.534 E.23922
G1 X73.45 Y138.494 E.06768
G1 X78.55 Y133.395 E.23922
G1 X78.55 Y130.281 E.10327
G1 X73.45 Y125.182 E.23922
G1 X73.45 Y123.142 E.06768
G1 X78.55 Y118.043 E.23922
G1 X78.55 Y114.929 E.10327
G1 X73.45 Y109.83 E.23922
G1 X73.45 Y107.79 E.06768
G1 X78.55 Y102.691 E.23922
G1 X78.55 Y99.578 E.10327
G1 X73.45 Y94.478 E.23922
G1 X73.45 Y92.438 E.06768
G1 X95.938 Y69.95 E1.05494
G1 X94.978 Y69.95 E.03184
G1 X113.078 Y88.05 E.84908
G1 X116.219 Y88.05 E.10419
G1 X134.318 Y69.95 E.84908
G1 X133.358 Y69.95 E.03184
G1 X186.55 Y123.142 E2.49533
G1 X186.55 Y125.182 E.06768
G1 X125.682 Y186.05 E2.85542
G1 X126.642 Y186.05 E.03184
G1 X110.543 Y169.95 E.75525
G1 X111.078 Y169.95 E.01774
G1 X94.978 Y186.05 E.75525
G1 X95.938 Y186.05 E.03184
G1 X79.839 Y169.95 E.75525
G1 X80.374 Y169.95 E.01774
G1 X73.45 Y176.874 E.32479
G1 X73.45 Y178.914 E.06768
G1 X80.586 Y186.05 E.33475
G1 X79.626 Y186.05 E.03184
G1 X95.726 Y169.95 E.75525
G1 X95.191 Y169.95 E.01774
G1 X111.29 Y186.05 E.75525
G1 X110.33 Y186.05 E.03184
G1 X126.429 Y169.95 E.75525
G1 X125.895 Y169.95 E.01774
G1 X141.994 Y186.05 E.75525
G1 X141.034 Y186.05 E.03184
G1 X186.55 Y140.534 E2.13523
G1 X186.55 Y138.494 E.06768
G1 X118.006 Y69.95 E3.21552
G1 X118.966 Y69.95 E.03184
G1 X100.867 Y88.05 E.84908
G1 X97.726 Y88.05 E.10419
G1 X79.626 Y69.95 E.84908
G1 X80.586 Y69.95 E.03184
G1 X73.45 Y77.086 E.33475
G1 X73.45 Y79.126 E.06768
G1 X82.374 Y88.05 E.41861
G1 X85.515 Y88.05 E.10419
G1 X103.614 Y69.95 E.84908
G1 X102.654 Y69.95 E.03184
G1 X120.754 Y88.05 E.84908
G1 X119.125 Y88.05 E.05401
; WIPE_START
G1 F24000
G1 X120.754 Y88.05 E-.61876
G1 X120.491 Y87.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.411 J1.146 P1  F30000
G1 X186.55 Y111.459 Z2.4
G1 Z2
G1 E.8 F1800
G1 F15476.087
G1 X186.55 Y109.83 E.05401
G1 X129.45 Y166.929 E2.67865
G1 X129.45 Y165.83 E.03647
G1 X149.67 Y186.05 E.94854
G1 X148.71 Y186.05 E.03184
G1 X186.55 Y148.21 E1.77514
G1 X186.55 Y146.17 E.06768
G1 X129.45 Y89.071 E2.67865
G1 X129.45 Y90.17 E.03647
G1 X149.67 Y69.95 E.94854
G1 X148.71 Y69.95 E.03184
G1 X186.55 Y107.79 E1.77514
G1 X186.55 Y102.154 E.18695
G1 X129.45 Y159.254 E2.67865
G1 X129.45 Y158.154 E.03647
G1 X157.346 Y186.05 E1.30863
G1 X156.386 Y186.05 E.03184
G1 X186.55 Y155.886 E1.41504
G1 X186.55 Y153.846 E.06768
G1 X129.45 Y96.746 E2.67865
G1 X129.45 Y97.846 E.03647
G1 X157.346 Y69.95 E1.30863
G1 X156.386 Y69.95 E.03184
G1 X186.55 Y100.114 E1.41504
G1 X186.55 Y94.478 E.18695
G1 X129.45 Y151.578 E2.67865
G1 X129.45 Y150.478 E.03647
G1 X165.022 Y186.05 E1.66873
G1 X164.062 Y186.05 E.03184
G1 X186.55 Y163.562 E1.05494
G1 X186.55 Y161.522 E.06768
G1 X129.45 Y104.422 E2.67865
G1 X129.45 Y105.522 E.03647
G1 X165.022 Y69.95 E1.66873
G1 X164.062 Y69.95 E.03184
G1 X186.55 Y92.438 E1.05494
G1 X186.55 Y86.802 E.18695
G1 X129.45 Y143.902 E2.67865
G1 X129.45 Y142.802 E.03647
G1 X172.698 Y186.05 E2.02882
M73 P38 R33
G1 X171.738 Y186.05 E.03184
G1 X186.55 Y171.238 E.69485
G1 X186.55 Y169.198 E.06768
G1 X129.45 Y112.098 E2.67865
G1 X129.45 Y113.198 E.03647
G1 X172.698 Y69.95 E2.02882
G1 X171.738 Y69.95 E.03184
G1 X186.55 Y84.762 E.69485
G1 X186.55 Y79.126 E.18695
G1 X129.45 Y136.226 E2.67865
G1 X129.45 Y135.126 E.03647
G1 X180.374 Y186.05 E2.38892
G1 X179.414 Y186.05 E.03184
G1 X186.55 Y178.914 E.33475
G1 X186.55 Y176.874 E.06768
G1 X129.45 Y119.774 E2.67865
G1 X129.45 Y120.874 E.03647
G1 X180.374 Y69.95 E2.38892
G1 X179.414 Y69.95 E.03184
G1 X186.55 Y77.086 E.33475
G1 X186.55 Y71.45 E.18695
G1 X129.45 Y128.55 E2.67865
G1 X129.45 Y127.45 E.03647
G1 X186.55 Y184.55 E2.67865
G1 X186.55 Y186.05 E.04976
G1 X186.421 Y186.05 E.00426
; WIPE_START
G1 F24000
G1 X186.55 Y186.05 E-.04876
G1 X186.55 Y184.55 E-.57
G1 X186.287 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.192 J-1.202 P1  F30000
G1 X78.55 Y167.033 Z2.4
G1 Z2
G1 E.8 F1800
G1 F15476.087
G1 X78.55 Y168.661 E.05401
G1 X73.45 Y163.562 E.23922
G1 X73.45 Y161.522 E.06768
G1 X78.55 Y156.422 E.23922
G1 X78.55 Y153.309 E.10327
G1 X73.45 Y148.21 E.23922
G1 X73.45 Y146.17 E.06768
G1 X78.55 Y141.071 E.23922
G1 X78.55 Y137.957 E.10327
G1 X73.45 Y132.858 E.23922
G1 X73.45 Y130.818 E.06768
G1 X78.55 Y125.719 E.23922
G1 X78.55 Y122.605 E.10327
G1 X73.45 Y117.506 E.23922
G1 X73.45 Y115.466 E.06768
G1 X78.55 Y110.367 E.23922
G1 X78.55 Y107.254 E.10327
G1 X73.45 Y102.154 E.23922
G1 X73.45 Y100.114 E.06768
G1 X78.55 Y95.015 E.23922
G1 X78.55 Y91.902 E.10327
G1 X73.45 Y86.802 E.23922
G1 X73.45 Y84.762 E.06768
G1 X88.262 Y69.95 E.69485
G1 X87.302 Y69.95 E.03184
G1 X105.402 Y88.05 E.84908
G1 X108.543 Y88.05 E.10419
G1 X126.642 Y69.95 E.84908
G1 X125.682 Y69.95 E.03184
G1 X186.55 Y130.818 E2.85542
G1 X186.55 Y132.858 E.06768
G1 X133.358 Y186.05 E2.49533
G1 X134.318 Y186.05 E.03184
G1 X118.219 Y169.95 E.75525
G1 X118.754 Y169.95 E.01774
G1 X102.654 Y186.05 E.75525
G1 X103.614 Y186.05 E.03184
G1 X87.515 Y169.95 E.75525
G1 X88.05 Y169.95 E.01774
G1 X73.45 Y184.55 E.68488
G1 X73.45 Y186.05 E.04976
G1 X73.579 Y186.05 E.00426
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X73.45 Y186.05 E-.04875
G1 X73.45 Y184.55 E-.57001
G1 X73.713 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/125
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
G3 Z2.4 I.312 J1.176 P1  F30000
G1 X129.102 Y169.602 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X78.898 Y169.602 E1.66536
G1 X78.898 Y88.398 E2.69369
G1 X129.102 Y88.398 E1.66536
G1 X129.102 Y169.542 E2.6917
G1 X128.71 Y169.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.29 Y169.21 E1.51854
G1 X79.29 Y88.79 E2.47108
G1 X128.71 Y88.79 E1.51854
G1 X128.71 Y169.15 E2.46924
M204 S10000
; WIPE_START
G1 F24000
G1 X126.71 Y169.152 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.071 J-.577 P1  F30000
G1 X73.102 Y69.602 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X186.898 Y69.602 E3.77482
G1 X186.898 Y186.398 E3.87433
G1 X73.102 Y186.398 E3.77482
G1 X73.102 Y69.662 E3.87234
G1 X72.71 Y69.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X187.29 Y69.21 E3.52072
G1 X187.29 Y186.79 E3.61291
G1 X72.71 Y186.79 E3.52072
G1 X72.71 Y69.27 E3.61106
M204 S10000
; WIPE_START
M73 P38 R32
G1 F24000
G1 X74.71 Y69.269 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.628 J-1.042 P1  F30000
G1 X73.579 Y69.95 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X73.45 Y69.95 E.00426
G1 X73.45 Y71.45 E.04976
G1 X90.05 Y88.05 E.77871
G1 X93.191 Y88.05 E.10419
G1 X111.29 Y69.95 E.84908
G1 X110.33 Y69.95 E.03184
G1 X128.429 Y88.05 E.84908
G1 X123.895 Y88.05 E.15043
G1 X141.994 Y69.95 E.84908
G1 X141.034 Y69.95 E.03184
G1 X186.55 Y115.466 E2.13523
G1 X186.55 Y117.506 E.06768
G1 X118.006 Y186.05 E3.21552
G1 X118.966 Y186.05 E.03184
G1 X102.867 Y169.95 E.75525
G1 X103.402 Y169.95 E.01774
G1 X87.302 Y186.05 E.75525
G1 X88.262 Y186.05 E.03184
G1 X73.45 Y171.238 E.69485
G1 X73.45 Y169.198 E.06768
G1 X78.55 Y164.098 E.23922
G1 X78.55 Y160.985 E.10327
G1 X73.45 Y155.886 E.23922
G1 X73.45 Y153.846 E.06768
G1 X78.55 Y148.746 E.23922
G1 X78.55 Y145.633 E.10327
G1 X73.45 Y140.534 E.23922
G1 X73.45 Y138.494 E.06768
G1 X78.55 Y133.395 E.23922
G1 X78.55 Y130.281 E.10327
G1 X73.45 Y125.182 E.23922
G1 X73.45 Y123.142 E.06768
G1 X78.55 Y118.043 E.23922
G1 X78.55 Y114.929 E.10327
G1 X73.45 Y109.83 E.23922
G1 X73.45 Y107.79 E.06768
G1 X78.55 Y102.691 E.23922
G1 X78.55 Y99.578 E.10327
G1 X73.45 Y94.478 E.23922
G1 X73.45 Y92.438 E.06768
G1 X95.938 Y69.95 E1.05494
G1 X94.978 Y69.95 E.03184
G1 X113.078 Y88.05 E.84908
G1 X116.219 Y88.05 E.10419
G1 X134.318 Y69.95 E.84908
G1 X133.358 Y69.95 E.03184
G1 X186.55 Y123.142 E2.49533
G1 X186.55 Y125.182 E.06768
G1 X125.682 Y186.05 E2.85542
G1 X126.642 Y186.05 E.03184
G1 X110.543 Y169.95 E.75525
G1 X111.078 Y169.95 E.01774
G1 X94.978 Y186.05 E.75525
G1 X95.938 Y186.05 E.03184
G1 X79.839 Y169.95 E.75525
G1 X80.374 Y169.95 E.01774
G1 X73.45 Y176.874 E.32479
G1 X73.45 Y178.914 E.06768
G1 X80.586 Y186.05 E.33475
G1 X79.626 Y186.05 E.03184
G1 X95.726 Y169.95 E.75525
G1 X95.191 Y169.95 E.01774
G1 X111.29 Y186.05 E.75525
G1 X110.33 Y186.05 E.03184
G1 X126.429 Y169.95 E.75525
G1 X125.895 Y169.95 E.01774
G1 X141.994 Y186.05 E.75525
G1 X141.034 Y186.05 E.03184
G1 X186.55 Y140.534 E2.13523
G1 X186.55 Y138.494 E.06768
G1 X118.006 Y69.95 E3.21552
G1 X118.966 Y69.95 E.03184
G1 X100.867 Y88.05 E.84908
G1 X97.726 Y88.05 E.10419
G1 X79.626 Y69.95 E.84908
G1 X80.586 Y69.95 E.03184
G1 X73.45 Y77.086 E.33475
G1 X73.45 Y79.126 E.06768
G1 X82.374 Y88.05 E.41861
G1 X85.515 Y88.05 E.10419
G1 X103.614 Y69.95 E.84908
G1 X102.654 Y69.95 E.03184
G1 X120.754 Y88.05 E.84908
G1 X119.125 Y88.05 E.05401
; WIPE_START
G1 F24000
G1 X120.754 Y88.05 E-.61876
G1 X120.491 Y87.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.411 J1.146 P1  F30000
G1 X186.55 Y111.459 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F15476.087
G1 X186.55 Y109.83 E.05401
G1 X129.45 Y166.929 E2.67865
G1 X129.45 Y165.83 E.03647
G1 X149.67 Y186.05 E.94854
G1 X148.71 Y186.05 E.03184
G1 X186.55 Y148.21 E1.77514
G1 X186.55 Y146.17 E.06768
G1 X129.45 Y89.071 E2.67865
G1 X129.45 Y90.17 E.03647
G1 X149.67 Y69.95 E.94854
G1 X148.71 Y69.95 E.03184
G1 X186.55 Y107.79 E1.77514
G1 X186.55 Y102.154 E.18695
G1 X129.45 Y159.254 E2.67865
G1 X129.45 Y158.154 E.03647
G1 X157.346 Y186.05 E1.30863
G1 X156.386 Y186.05 E.03184
G1 X186.55 Y155.886 E1.41504
G1 X186.55 Y153.846 E.06768
G1 X129.45 Y96.746 E2.67865
G1 X129.45 Y97.846 E.03647
G1 X157.346 Y69.95 E1.30863
G1 X156.386 Y69.95 E.03184
G1 X186.55 Y100.114 E1.41504
G1 X186.55 Y94.478 E.18695
G1 X129.45 Y151.578 E2.67865
G1 X129.45 Y150.478 E.03647
G1 X165.022 Y186.05 E1.66873
G1 X164.062 Y186.05 E.03184
G1 X186.55 Y163.562 E1.05494
G1 X186.55 Y161.522 E.06768
G1 X129.45 Y104.422 E2.67865
G1 X129.45 Y105.522 E.03647
G1 X165.022 Y69.95 E1.66873
G1 X164.062 Y69.95 E.03184
G1 X186.55 Y92.438 E1.05494
G1 X186.55 Y86.802 E.18695
G1 X129.45 Y143.902 E2.67865
G1 X129.45 Y142.802 E.03647
G1 X172.698 Y186.05 E2.02882
G1 X171.738 Y186.05 E.03184
G1 X186.55 Y171.238 E.69485
G1 X186.55 Y169.198 E.06768
G1 X129.45 Y112.098 E2.67865
G1 X129.45 Y113.198 E.03647
G1 X172.698 Y69.95 E2.02882
G1 X171.738 Y69.95 E.03184
G1 X186.55 Y84.762 E.69485
G1 X186.55 Y79.126 E.18695
G1 X129.45 Y136.226 E2.67865
G1 X129.45 Y135.126 E.03647
G1 X180.374 Y186.05 E2.38892
G1 X179.414 Y186.05 E.03184
G1 X186.55 Y178.914 E.33475
G1 X186.55 Y176.874 E.06768
G1 X129.45 Y119.774 E2.67865
G1 X129.45 Y120.874 E.03647
G1 X180.374 Y69.95 E2.38892
G1 X179.414 Y69.95 E.03184
G1 X186.55 Y77.086 E.33475
G1 X186.55 Y71.45 E.18695
G1 X129.45 Y128.55 E2.67865
G1 X129.45 Y127.45 E.03647
G1 X186.55 Y184.55 E2.67865
G1 X186.55 Y186.05 E.04976
G1 X186.421 Y186.05 E.00426
; WIPE_START
G1 F24000
G1 X186.55 Y186.05 E-.04876
G1 X186.55 Y184.55 E-.57
G1 X186.287 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.192 J-1.202 P1  F30000
G1 X78.55 Y167.033 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F15476.087
G1 X78.55 Y168.661 E.05401
G1 X73.45 Y163.562 E.23922
G1 X73.45 Y161.522 E.06768
G1 X78.55 Y156.422 E.23922
G1 X78.55 Y153.309 E.10327
G1 X73.45 Y148.21 E.23922
G1 X73.45 Y146.17 E.06768
G1 X78.55 Y141.071 E.23922
G1 X78.55 Y137.957 E.10327
G1 X73.45 Y132.858 E.23922
G1 X73.45 Y130.818 E.06768
G1 X78.55 Y125.719 E.23922
G1 X78.55 Y122.605 E.10327
G1 X73.45 Y117.506 E.23922
G1 X73.45 Y115.466 E.06768
G1 X78.55 Y110.367 E.23922
G1 X78.55 Y107.254 E.10327
G1 X73.45 Y102.154 E.23922
G1 X73.45 Y100.114 E.06768
G1 X78.55 Y95.015 E.23922
M73 P39 R32
G1 X78.55 Y91.902 E.10327
G1 X73.45 Y86.802 E.23922
G1 X73.45 Y84.762 E.06768
G1 X88.262 Y69.95 E.69485
G1 X87.302 Y69.95 E.03184
G1 X105.402 Y88.05 E.84908
G1 X108.543 Y88.05 E.10419
G1 X126.642 Y69.95 E.84908
G1 X125.682 Y69.95 E.03184
G1 X186.55 Y130.818 E2.85542
G1 X186.55 Y132.858 E.06768
G1 X133.358 Y186.05 E2.49533
G1 X134.318 Y186.05 E.03184
G1 X118.219 Y169.95 E.75525
G1 X118.754 Y169.95 E.01774
G1 X102.654 Y186.05 E.75525
G1 X103.614 Y186.05 E.03184
G1 X87.515 Y169.95 E.75525
G1 X88.05 Y169.95 E.01774
G1 X73.45 Y184.55 E.68488
G1 X73.45 Y186.05 E.04976
G1 X73.579 Y186.05 E.00426
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X73.45 Y186.05 E-.04875
G1 X73.45 Y184.55 E-.57001
G1 X73.713 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/125
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
G3 Z2.6 I.312 J1.176 P1  F30000
G1 X129.102 Y169.602 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X78.898 Y169.602 E1.66536
G1 X78.898 Y88.398 E2.69369
G1 X129.102 Y88.398 E1.66536
G1 X129.102 Y169.542 E2.6917
G1 X128.71 Y169.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.29 Y169.21 E1.51854
G1 X79.29 Y88.79 E2.47108
G1 X128.71 Y88.79 E1.51854
G1 X128.71 Y169.15 E2.46924
M204 S10000
; WIPE_START
G1 F24000
G1 X126.71 Y169.152 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.071 J-.577 P1  F30000
G1 X73.102 Y69.602 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X186.898 Y69.602 E3.77482
G1 X186.898 Y186.398 E3.87433
G1 X73.102 Y186.398 E3.77482
G1 X73.102 Y69.662 E3.87234
G1 X72.71 Y69.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X187.29 Y69.21 E3.52072
G1 X187.29 Y186.79 E3.61291
G1 X72.71 Y186.79 E3.52072
G1 X72.71 Y69.27 E3.61106
M204 S10000
; WIPE_START
G1 F24000
G1 X74.71 Y69.269 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.628 J-1.042 P1  F30000
G1 X73.579 Y69.95 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X73.45 Y69.95 E.00426
G1 X73.45 Y71.45 E.04976
G1 X90.05 Y88.05 E.77871
G1 X93.191 Y88.05 E.10419
G1 X111.29 Y69.95 E.84908
G1 X110.33 Y69.95 E.03184
G1 X128.429 Y88.05 E.84908
G1 X123.895 Y88.05 E.15043
G1 X141.994 Y69.95 E.84908
G1 X141.034 Y69.95 E.03184
G1 X186.55 Y115.466 E2.13523
G1 X186.55 Y117.506 E.06768
G1 X118.006 Y186.05 E3.21552
G1 X118.966 Y186.05 E.03184
G1 X102.867 Y169.95 E.75525
G1 X103.402 Y169.95 E.01774
G1 X87.302 Y186.05 E.75525
G1 X88.262 Y186.05 E.03184
G1 X73.45 Y171.238 E.69485
G1 X73.45 Y169.198 E.06768
G1 X78.55 Y164.098 E.23922
G1 X78.55 Y160.985 E.10327
G1 X73.45 Y155.886 E.23922
G1 X73.45 Y153.846 E.06768
G1 X78.55 Y148.746 E.23922
G1 X78.55 Y145.633 E.10327
G1 X73.45 Y140.534 E.23922
G1 X73.45 Y138.494 E.06768
G1 X78.55 Y133.395 E.23922
G1 X78.55 Y130.281 E.10327
G1 X73.45 Y125.182 E.23922
G1 X73.45 Y123.142 E.06768
G1 X78.55 Y118.043 E.23922
G1 X78.55 Y114.929 E.10327
G1 X73.45 Y109.83 E.23922
G1 X73.45 Y107.79 E.06768
G1 X78.55 Y102.691 E.23922
G1 X78.55 Y99.578 E.10327
G1 X73.45 Y94.478 E.23922
G1 X73.45 Y92.438 E.06768
G1 X95.938 Y69.95 E1.05494
G1 X94.978 Y69.95 E.03184
G1 X113.078 Y88.05 E.84908
G1 X116.219 Y88.05 E.10419
G1 X134.318 Y69.95 E.84908
G1 X133.358 Y69.95 E.03184
G1 X186.55 Y123.142 E2.49533
G1 X186.55 Y125.182 E.06768
G1 X125.682 Y186.05 E2.85542
G1 X126.642 Y186.05 E.03184
G1 X110.543 Y169.95 E.75525
G1 X111.078 Y169.95 E.01774
G1 X94.978 Y186.05 E.75525
G1 X95.938 Y186.05 E.03184
G1 X79.839 Y169.95 E.75525
G1 X80.374 Y169.95 E.01774
G1 X73.45 Y176.874 E.32479
G1 X73.45 Y178.914 E.06768
G1 X80.586 Y186.05 E.33475
G1 X79.626 Y186.05 E.03184
G1 X95.726 Y169.95 E.75525
G1 X95.191 Y169.95 E.01774
G1 X111.29 Y186.05 E.75525
G1 X110.33 Y186.05 E.03184
G1 X126.429 Y169.95 E.75525
G1 X125.895 Y169.95 E.01774
G1 X141.994 Y186.05 E.75525
G1 X141.034 Y186.05 E.03184
G1 X186.55 Y140.534 E2.13523
G1 X186.55 Y138.494 E.06768
G1 X118.006 Y69.95 E3.21552
G1 X118.966 Y69.95 E.03184
G1 X100.867 Y88.05 E.84908
G1 X97.726 Y88.05 E.10419
G1 X79.626 Y69.95 E.84908
G1 X80.586 Y69.95 E.03184
G1 X73.45 Y77.086 E.33475
G1 X73.45 Y79.126 E.06768
G1 X82.374 Y88.05 E.41861
G1 X85.515 Y88.05 E.10419
G1 X103.614 Y69.95 E.84908
G1 X102.654 Y69.95 E.03184
G1 X120.754 Y88.05 E.84908
G1 X119.125 Y88.05 E.05401
; WIPE_START
G1 F24000
G1 X120.754 Y88.05 E-.61876
G1 X120.491 Y87.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.411 J1.146 P1  F30000
G1 X186.55 Y111.459 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F15476.087
G1 X186.55 Y109.83 E.05401
G1 X129.45 Y166.929 E2.67865
G1 X129.45 Y165.83 E.03647
G1 X149.67 Y186.05 E.94854
G1 X148.71 Y186.05 E.03184
G1 X186.55 Y148.21 E1.77514
G1 X186.55 Y146.17 E.06768
G1 X129.45 Y89.071 E2.67865
G1 X129.45 Y90.17 E.03647
G1 X149.67 Y69.95 E.94854
G1 X148.71 Y69.95 E.03184
G1 X186.55 Y107.79 E1.77514
G1 X186.55 Y102.154 E.18695
G1 X129.45 Y159.254 E2.67865
G1 X129.45 Y158.154 E.03647
G1 X157.346 Y186.05 E1.30863
G1 X156.386 Y186.05 E.03184
G1 X186.55 Y155.886 E1.41504
G1 X186.55 Y153.846 E.06768
G1 X129.45 Y96.746 E2.67865
G1 X129.45 Y97.846 E.03647
G1 X157.346 Y69.95 E1.30863
G1 X156.386 Y69.95 E.03184
G1 X186.55 Y100.114 E1.41504
G1 X186.55 Y94.478 E.18695
G1 X129.45 Y151.578 E2.67865
G1 X129.45 Y150.478 E.03647
G1 X165.022 Y186.05 E1.66873
G1 X164.062 Y186.05 E.03184
G1 X186.55 Y163.562 E1.05494
G1 X186.55 Y161.522 E.06768
G1 X129.45 Y104.422 E2.67865
G1 X129.45 Y105.522 E.03647
G1 X165.022 Y69.95 E1.66873
G1 X164.062 Y69.95 E.03184
G1 X186.55 Y92.438 E1.05494
G1 X186.55 Y86.802 E.18695
G1 X129.45 Y143.902 E2.67865
G1 X129.45 Y142.802 E.03647
G1 X172.698 Y186.05 E2.02882
G1 X171.738 Y186.05 E.03184
G1 X186.55 Y171.238 E.69485
G1 X186.55 Y169.198 E.06768
G1 X129.45 Y112.098 E2.67865
G1 X129.45 Y113.198 E.03647
G1 X172.698 Y69.95 E2.02882
G1 X171.738 Y69.95 E.03184
G1 X186.55 Y84.762 E.69485
G1 X186.55 Y79.126 E.18695
G1 X129.45 Y136.226 E2.67865
G1 X129.45 Y135.126 E.03647
G1 X180.374 Y186.05 E2.38892
G1 X179.414 Y186.05 E.03184
G1 X186.55 Y178.914 E.33475
G1 X186.55 Y176.874 E.06768
G1 X129.45 Y119.774 E2.67865
G1 X129.45 Y120.874 E.03647
G1 X180.374 Y69.95 E2.38892
G1 X179.414 Y69.95 E.03184
G1 X186.55 Y77.086 E.33475
G1 X186.55 Y71.45 E.18695
G1 X129.45 Y128.55 E2.67865
G1 X129.45 Y127.45 E.03647
G1 X186.55 Y184.55 E2.67865
G1 X186.55 Y186.05 E.04976
G1 X186.421 Y186.05 E.00426
; WIPE_START
G1 F24000
G1 X186.55 Y186.05 E-.04876
G1 X186.55 Y184.55 E-.57
G1 X186.287 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.192 J-1.202 P1  F30000
G1 X78.55 Y167.033 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F15476.087
G1 X78.55 Y168.661 E.05401
G1 X73.45 Y163.562 E.23922
G1 X73.45 Y161.522 E.06768
G1 X78.55 Y156.422 E.23922
G1 X78.55 Y153.309 E.10327
G1 X73.45 Y148.21 E.23922
G1 X73.45 Y146.17 E.06768
G1 X78.55 Y141.071 E.23922
G1 X78.55 Y137.957 E.10327
G1 X73.45 Y132.858 E.23922
G1 X73.45 Y130.818 E.06768
G1 X78.55 Y125.719 E.23922
G1 X78.55 Y122.605 E.10327
G1 X73.45 Y117.506 E.23922
G1 X73.45 Y115.466 E.06768
G1 X78.55 Y110.367 E.23922
G1 X78.55 Y107.254 E.10327
G1 X73.45 Y102.154 E.23922
G1 X73.45 Y100.114 E.06768
G1 X78.55 Y95.015 E.23922
G1 X78.55 Y91.902 E.10327
G1 X73.45 Y86.802 E.23922
G1 X73.45 Y84.762 E.06768
G1 X88.262 Y69.95 E.69485
G1 X87.302 Y69.95 E.03184
G1 X105.402 Y88.05 E.84908
G1 X108.543 Y88.05 E.10419
G1 X126.642 Y69.95 E.84908
G1 X125.682 Y69.95 E.03184
G1 X186.55 Y130.818 E2.85542
G1 X186.55 Y132.858 E.06768
G1 X133.358 Y186.05 E2.49533
G1 X134.318 Y186.05 E.03184
G1 X118.219 Y169.95 E.75525
G1 X118.754 Y169.95 E.01774
G1 X102.654 Y186.05 E.75525
G1 X103.614 Y186.05 E.03184
G1 X87.515 Y169.95 E.75525
G1 X88.05 Y169.95 E.01774
G1 X73.45 Y184.55 E.68488
G1 X73.45 Y186.05 E.04976
G1 X73.579 Y186.05 E.00426
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X73.45 Y186.05 E-.04875
G1 X73.45 Y184.55 E-.57001
G1 X73.713 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/125
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
G3 Z2.8 I.312 J1.176 P1  F30000
G1 X129.102 Y169.602 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X78.898 Y169.602 E1.66536
G1 X78.898 Y88.398 E2.69369
G1 X129.102 Y88.398 E1.66536
G1 X129.102 Y169.542 E2.6917
G1 X128.71 Y169.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.29 Y169.21 E1.51854
G1 X79.29 Y88.79 E2.47108
G1 X128.71 Y88.79 E1.51854
G1 X128.71 Y169.15 E2.46924
M204 S10000
; WIPE_START
G1 F24000
G1 X126.71 Y169.152 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.071 J-.577 P1  F30000
G1 X73.102 Y69.602 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X186.898 Y69.602 E3.77482
G1 X186.898 Y186.398 E3.87433
G1 X73.102 Y186.398 E3.77482
G1 X73.102 Y69.662 E3.87234
G1 X72.71 Y69.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X187.29 Y69.21 E3.52072
G1 X187.29 Y186.79 E3.61291
G1 X72.71 Y186.79 E3.52072
G1 X72.71 Y69.27 E3.61106
M204 S10000
; WIPE_START
G1 F24000
G1 X74.71 Y69.269 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.628 J-1.042 P1  F30000
G1 X73.579 Y69.95 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X73.45 Y69.95 E.00426
G1 X73.45 Y71.45 E.04976
G1 X90.05 Y88.05 E.77871
G1 X93.191 Y88.05 E.10419
G1 X111.29 Y69.95 E.84908
G1 X110.33 Y69.95 E.03184
G1 X128.429 Y88.05 E.84908
G1 X123.895 Y88.05 E.15043
G1 X141.994 Y69.95 E.84908
M73 P40 R32
G1 X141.034 Y69.95 E.03184
G1 X186.55 Y115.466 E2.13523
G1 X186.55 Y117.506 E.06768
G1 X118.006 Y186.05 E3.21552
G1 X118.966 Y186.05 E.03184
G1 X102.867 Y169.95 E.75525
G1 X103.402 Y169.95 E.01774
G1 X87.302 Y186.05 E.75525
G1 X88.262 Y186.05 E.03184
G1 X73.45 Y171.238 E.69485
G1 X73.45 Y169.198 E.06768
G1 X78.55 Y164.098 E.23922
G1 X78.55 Y160.985 E.10327
G1 X73.45 Y155.886 E.23922
G1 X73.45 Y153.846 E.06768
G1 X78.55 Y148.746 E.23922
G1 X78.55 Y145.633 E.10327
G1 X73.45 Y140.534 E.23922
G1 X73.45 Y138.494 E.06768
G1 X78.55 Y133.395 E.23922
G1 X78.55 Y130.281 E.10327
G1 X73.45 Y125.182 E.23922
G1 X73.45 Y123.142 E.06768
G1 X78.55 Y118.043 E.23922
G1 X78.55 Y114.929 E.10327
G1 X73.45 Y109.83 E.23922
G1 X73.45 Y107.79 E.06768
G1 X78.55 Y102.691 E.23922
G1 X78.55 Y99.578 E.10327
G1 X73.45 Y94.478 E.23922
G1 X73.45 Y92.438 E.06768
G1 X95.938 Y69.95 E1.05494
G1 X94.978 Y69.95 E.03184
G1 X113.078 Y88.05 E.84908
M73 P40 R31
G1 X116.219 Y88.05 E.10419
G1 X134.318 Y69.95 E.84908
G1 X133.358 Y69.95 E.03184
G1 X186.55 Y123.142 E2.49533
G1 X186.55 Y125.182 E.06768
G1 X125.682 Y186.05 E2.85542
G1 X126.642 Y186.05 E.03184
G1 X110.543 Y169.95 E.75525
G1 X111.078 Y169.95 E.01774
G1 X94.978 Y186.05 E.75525
G1 X95.938 Y186.05 E.03184
G1 X79.839 Y169.95 E.75525
G1 X80.374 Y169.95 E.01774
G1 X73.45 Y176.874 E.32479
G1 X73.45 Y178.914 E.06768
G1 X80.586 Y186.05 E.33475
G1 X79.626 Y186.05 E.03184
G1 X95.726 Y169.95 E.75525
G1 X95.191 Y169.95 E.01774
G1 X111.29 Y186.05 E.75525
G1 X110.33 Y186.05 E.03184
G1 X126.429 Y169.95 E.75525
G1 X125.895 Y169.95 E.01774
G1 X141.994 Y186.05 E.75525
G1 X141.034 Y186.05 E.03184
G1 X186.55 Y140.534 E2.13523
G1 X186.55 Y138.494 E.06768
G1 X118.006 Y69.95 E3.21552
G1 X118.966 Y69.95 E.03184
G1 X100.867 Y88.05 E.84908
G1 X97.726 Y88.05 E.10419
G1 X79.626 Y69.95 E.84908
G1 X80.586 Y69.95 E.03184
G1 X73.45 Y77.086 E.33475
G1 X73.45 Y79.126 E.06768
G1 X82.374 Y88.05 E.41861
G1 X85.515 Y88.05 E.10419
G1 X103.614 Y69.95 E.84908
G1 X102.654 Y69.95 E.03184
G1 X120.754 Y88.05 E.84908
G1 X119.125 Y88.05 E.05401
; WIPE_START
G1 F24000
G1 X120.754 Y88.05 E-.61876
G1 X120.491 Y87.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.411 J1.146 P1  F30000
G1 X186.55 Y111.459 Z3
G1 Z2.6
G1 E.8 F1800
G1 F15476.087
G1 X186.55 Y109.83 E.05401
G1 X129.45 Y166.929 E2.67865
G1 X129.45 Y165.83 E.03647
G1 X149.67 Y186.05 E.94854
G1 X148.71 Y186.05 E.03184
G1 X186.55 Y148.21 E1.77514
G1 X186.55 Y146.17 E.06768
G1 X129.45 Y89.071 E2.67865
G1 X129.45 Y90.17 E.03647
G1 X149.67 Y69.95 E.94854
G1 X148.71 Y69.95 E.03184
G1 X186.55 Y107.79 E1.77514
G1 X186.55 Y102.154 E.18695
G1 X129.45 Y159.254 E2.67865
G1 X129.45 Y158.154 E.03647
G1 X157.346 Y186.05 E1.30863
G1 X156.386 Y186.05 E.03184
G1 X186.55 Y155.886 E1.41504
G1 X186.55 Y153.846 E.06768
G1 X129.45 Y96.746 E2.67865
G1 X129.45 Y97.846 E.03647
G1 X157.346 Y69.95 E1.30863
G1 X156.386 Y69.95 E.03184
G1 X186.55 Y100.114 E1.41504
G1 X186.55 Y94.478 E.18695
G1 X129.45 Y151.578 E2.67865
G1 X129.45 Y150.478 E.03647
G1 X165.022 Y186.05 E1.66873
G1 X164.062 Y186.05 E.03184
G1 X186.55 Y163.562 E1.05494
G1 X186.55 Y161.522 E.06768
G1 X129.45 Y104.422 E2.67865
G1 X129.45 Y105.522 E.03647
G1 X165.022 Y69.95 E1.66873
G1 X164.062 Y69.95 E.03184
G1 X186.55 Y92.438 E1.05494
G1 X186.55 Y86.802 E.18695
G1 X129.45 Y143.902 E2.67865
G1 X129.45 Y142.802 E.03647
G1 X172.698 Y186.05 E2.02882
G1 X171.738 Y186.05 E.03184
G1 X186.55 Y171.238 E.69485
G1 X186.55 Y169.198 E.06768
G1 X129.45 Y112.098 E2.67865
G1 X129.45 Y113.198 E.03647
G1 X172.698 Y69.95 E2.02882
G1 X171.738 Y69.95 E.03184
G1 X186.55 Y84.762 E.69485
G1 X186.55 Y79.126 E.18695
G1 X129.45 Y136.226 E2.67865
G1 X129.45 Y135.126 E.03647
G1 X180.374 Y186.05 E2.38892
G1 X179.414 Y186.05 E.03184
G1 X186.55 Y178.914 E.33475
G1 X186.55 Y176.874 E.06768
G1 X129.45 Y119.774 E2.67865
G1 X129.45 Y120.874 E.03647
G1 X180.374 Y69.95 E2.38892
G1 X179.414 Y69.95 E.03184
G1 X186.55 Y77.086 E.33475
G1 X186.55 Y71.45 E.18695
G1 X129.45 Y128.55 E2.67865
G1 X129.45 Y127.45 E.03647
G1 X186.55 Y184.55 E2.67865
G1 X186.55 Y186.05 E.04976
G1 X186.421 Y186.05 E.00426
; WIPE_START
G1 F24000
G1 X186.55 Y186.05 E-.04876
G1 X186.55 Y184.55 E-.57
G1 X186.287 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.192 J-1.202 P1  F30000
G1 X78.55 Y167.033 Z3
G1 Z2.6
G1 E.8 F1800
G1 F15476.087
G1 X78.55 Y168.661 E.05401
G1 X73.45 Y163.562 E.23922
G1 X73.45 Y161.522 E.06768
G1 X78.55 Y156.422 E.23922
G1 X78.55 Y153.309 E.10327
G1 X73.45 Y148.21 E.23922
G1 X73.45 Y146.17 E.06768
G1 X78.55 Y141.071 E.23922
G1 X78.55 Y137.957 E.10327
G1 X73.45 Y132.858 E.23922
G1 X73.45 Y130.818 E.06768
G1 X78.55 Y125.719 E.23922
G1 X78.55 Y122.605 E.10327
G1 X73.45 Y117.506 E.23922
G1 X73.45 Y115.466 E.06768
G1 X78.55 Y110.367 E.23922
G1 X78.55 Y107.254 E.10327
G1 X73.45 Y102.154 E.23922
G1 X73.45 Y100.114 E.06768
G1 X78.55 Y95.015 E.23922
G1 X78.55 Y91.902 E.10327
G1 X73.45 Y86.802 E.23922
G1 X73.45 Y84.762 E.06768
G1 X88.262 Y69.95 E.69485
G1 X87.302 Y69.95 E.03184
G1 X105.402 Y88.05 E.84908
G1 X108.543 Y88.05 E.10419
G1 X126.642 Y69.95 E.84908
G1 X125.682 Y69.95 E.03184
G1 X186.55 Y130.818 E2.85542
G1 X186.55 Y132.858 E.06768
G1 X133.358 Y186.05 E2.49533
G1 X134.318 Y186.05 E.03184
G1 X118.219 Y169.95 E.75525
G1 X118.754 Y169.95 E.01774
G1 X102.654 Y186.05 E.75525
G1 X103.614 Y186.05 E.03184
G1 X87.515 Y169.95 E.75525
G1 X88.05 Y169.95 E.01774
G1 X73.45 Y184.55 E.68488
G1 X73.45 Y186.05 E.04976
G1 X73.579 Y186.05 E.00426
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X73.45 Y186.05 E-.04875
G1 X73.45 Y184.55 E-.57001
G1 X73.713 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/125
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
G3 Z3 I.312 J1.176 P1  F30000
G1 X129.102 Y169.602 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X78.898 Y169.602 E1.66536
G1 X78.898 Y88.398 E2.69369
G1 X129.102 Y88.398 E1.66536
G1 X129.102 Y169.542 E2.6917
G1 X128.71 Y169.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.29 Y169.21 E1.51854
G1 X79.29 Y88.79 E2.47108
G1 X128.71 Y88.79 E1.51854
G1 X128.71 Y169.15 E2.46924
M204 S10000
; WIPE_START
G1 F24000
G1 X126.71 Y169.152 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.071 J-.577 P1  F30000
G1 X73.102 Y69.602 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X186.898 Y69.602 E3.77482
G1 X186.898 Y186.398 E3.87433
G1 X73.102 Y186.398 E3.77482
G1 X73.102 Y69.662 E3.87234
G1 X72.71 Y69.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X187.29 Y69.21 E3.52072
G1 X187.29 Y186.79 E3.61291
G1 X72.71 Y186.79 E3.52072
G1 X72.71 Y69.27 E3.61106
M204 S10000
; WIPE_START
G1 F24000
G1 X74.71 Y69.269 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.628 J-1.042 P1  F30000
G1 X73.579 Y69.95 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X73.45 Y69.95 E.00426
G1 X73.45 Y71.45 E.04976
G1 X90.05 Y88.05 E.77871
G1 X93.191 Y88.05 E.10419
G1 X111.29 Y69.95 E.84908
G1 X110.33 Y69.95 E.03184
G1 X128.429 Y88.05 E.84908
G1 X123.895 Y88.05 E.15043
G1 X141.994 Y69.95 E.84908
G1 X141.034 Y69.95 E.03184
G1 X186.55 Y115.466 E2.13523
G1 X186.55 Y117.506 E.06768
G1 X118.006 Y186.05 E3.21552
G1 X118.966 Y186.05 E.03184
G1 X102.867 Y169.95 E.75525
G1 X103.402 Y169.95 E.01774
G1 X87.302 Y186.05 E.75525
G1 X88.262 Y186.05 E.03184
G1 X73.45 Y171.238 E.69485
G1 X73.45 Y169.198 E.06768
G1 X78.55 Y164.098 E.23922
G1 X78.55 Y160.985 E.10327
G1 X73.45 Y155.886 E.23922
G1 X73.45 Y153.846 E.06768
G1 X78.55 Y148.746 E.23922
G1 X78.55 Y145.633 E.10327
G1 X73.45 Y140.534 E.23922
G1 X73.45 Y138.494 E.06768
G1 X78.55 Y133.395 E.23922
G1 X78.55 Y130.281 E.10327
G1 X73.45 Y125.182 E.23922
G1 X73.45 Y123.142 E.06768
G1 X78.55 Y118.043 E.23922
G1 X78.55 Y114.929 E.10327
G1 X73.45 Y109.83 E.23922
G1 X73.45 Y107.79 E.06768
G1 X78.55 Y102.691 E.23922
G1 X78.55 Y99.578 E.10327
G1 X73.45 Y94.478 E.23922
G1 X73.45 Y92.438 E.06768
G1 X95.938 Y69.95 E1.05494
G1 X94.978 Y69.95 E.03184
M73 P41 R31
G1 X113.078 Y88.05 E.84908
G1 X116.219 Y88.05 E.10419
G1 X134.318 Y69.95 E.84908
G1 X133.358 Y69.95 E.03184
G1 X186.55 Y123.142 E2.49533
G1 X186.55 Y125.182 E.06768
G1 X125.682 Y186.05 E2.85542
G1 X126.642 Y186.05 E.03184
G1 X110.543 Y169.95 E.75525
G1 X111.078 Y169.95 E.01774
G1 X94.978 Y186.05 E.75525
G1 X95.938 Y186.05 E.03184
G1 X79.839 Y169.95 E.75525
G1 X80.374 Y169.95 E.01774
G1 X73.45 Y176.874 E.32479
G1 X73.45 Y178.914 E.06768
G1 X80.586 Y186.05 E.33475
G1 X79.626 Y186.05 E.03184
G1 X95.726 Y169.95 E.75525
G1 X95.191 Y169.95 E.01774
G1 X111.29 Y186.05 E.75525
G1 X110.33 Y186.05 E.03184
G1 X126.429 Y169.95 E.75525
G1 X125.895 Y169.95 E.01774
G1 X141.994 Y186.05 E.75525
G1 X141.034 Y186.05 E.03184
G1 X186.55 Y140.534 E2.13523
G1 X186.55 Y138.494 E.06768
G1 X118.006 Y69.95 E3.21552
G1 X118.966 Y69.95 E.03184
G1 X100.867 Y88.05 E.84908
G1 X97.726 Y88.05 E.10419
G1 X79.626 Y69.95 E.84908
G1 X80.586 Y69.95 E.03184
G1 X73.45 Y77.086 E.33475
G1 X73.45 Y79.126 E.06768
G1 X82.374 Y88.05 E.41861
G1 X85.515 Y88.05 E.10419
G1 X103.614 Y69.95 E.84908
G1 X102.654 Y69.95 E.03184
G1 X120.754 Y88.05 E.84908
G1 X119.125 Y88.05 E.05401
; WIPE_START
G1 F24000
G1 X120.754 Y88.05 E-.61876
G1 X120.491 Y87.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.411 J1.146 P1  F30000
G1 X186.55 Y111.459 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F15476.087
G1 X186.55 Y109.83 E.05401
G1 X129.45 Y166.929 E2.67865
G1 X129.45 Y165.83 E.03647
G1 X149.67 Y186.05 E.94854
G1 X148.71 Y186.05 E.03184
G1 X186.55 Y148.21 E1.77514
G1 X186.55 Y146.17 E.06768
G1 X129.45 Y89.071 E2.67865
G1 X129.45 Y90.17 E.03647
G1 X149.67 Y69.95 E.94854
G1 X148.71 Y69.95 E.03184
G1 X186.55 Y107.79 E1.77514
G1 X186.55 Y102.154 E.18695
G1 X129.45 Y159.254 E2.67865
G1 X129.45 Y158.154 E.03647
G1 X157.346 Y186.05 E1.30863
G1 X156.386 Y186.05 E.03184
G1 X186.55 Y155.886 E1.41504
G1 X186.55 Y153.846 E.06768
G1 X129.45 Y96.746 E2.67865
G1 X129.45 Y97.846 E.03647
G1 X157.346 Y69.95 E1.30863
G1 X156.386 Y69.95 E.03184
G1 X186.55 Y100.114 E1.41504
G1 X186.55 Y94.478 E.18695
G1 X129.45 Y151.578 E2.67865
G1 X129.45 Y150.478 E.03647
G1 X165.022 Y186.05 E1.66873
G1 X164.062 Y186.05 E.03184
G1 X186.55 Y163.562 E1.05494
G1 X186.55 Y161.522 E.06768
G1 X129.45 Y104.422 E2.67865
G1 X129.45 Y105.522 E.03647
G1 X165.022 Y69.95 E1.66873
G1 X164.062 Y69.95 E.03184
G1 X186.55 Y92.438 E1.05494
G1 X186.55 Y86.802 E.18695
G1 X129.45 Y143.902 E2.67865
G1 X129.45 Y142.802 E.03647
G1 X172.698 Y186.05 E2.02882
G1 X171.738 Y186.05 E.03184
G1 X186.55 Y171.238 E.69485
G1 X186.55 Y169.198 E.06768
G1 X129.45 Y112.098 E2.67865
G1 X129.45 Y113.198 E.03647
G1 X172.698 Y69.95 E2.02882
G1 X171.738 Y69.95 E.03184
G1 X186.55 Y84.762 E.69485
G1 X186.55 Y79.126 E.18695
G1 X129.45 Y136.226 E2.67865
G1 X129.45 Y135.126 E.03647
G1 X180.374 Y186.05 E2.38892
G1 X179.414 Y186.05 E.03184
G1 X186.55 Y178.914 E.33475
G1 X186.55 Y176.874 E.06768
G1 X129.45 Y119.774 E2.67865
G1 X129.45 Y120.874 E.03647
G1 X180.374 Y69.95 E2.38892
G1 X179.414 Y69.95 E.03184
G1 X186.55 Y77.086 E.33475
G1 X186.55 Y71.45 E.18695
G1 X129.45 Y128.55 E2.67865
G1 X129.45 Y127.45 E.03647
G1 X186.55 Y184.55 E2.67865
G1 X186.55 Y186.05 E.04976
G1 X186.421 Y186.05 E.00426
; WIPE_START
G1 F24000
G1 X186.55 Y186.05 E-.04876
G1 X186.55 Y184.55 E-.57
G1 X186.287 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.192 J-1.202 P1  F30000
G1 X78.55 Y167.033 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F15476.087
G1 X78.55 Y168.661 E.05401
G1 X73.45 Y163.562 E.23922
G1 X73.45 Y161.522 E.06768
G1 X78.55 Y156.422 E.23922
G1 X78.55 Y153.309 E.10327
G1 X73.45 Y148.21 E.23922
G1 X73.45 Y146.17 E.06768
G1 X78.55 Y141.071 E.23922
G1 X78.55 Y137.957 E.10327
G1 X73.45 Y132.858 E.23922
G1 X73.45 Y130.818 E.06768
G1 X78.55 Y125.719 E.23922
G1 X78.55 Y122.605 E.10327
G1 X73.45 Y117.506 E.23922
G1 X73.45 Y115.466 E.06768
G1 X78.55 Y110.367 E.23922
G1 X78.55 Y107.254 E.10327
G1 X73.45 Y102.154 E.23922
G1 X73.45 Y100.114 E.06768
G1 X78.55 Y95.015 E.23922
G1 X78.55 Y91.902 E.10327
G1 X73.45 Y86.802 E.23922
G1 X73.45 Y84.762 E.06768
G1 X88.262 Y69.95 E.69485
G1 X87.302 Y69.95 E.03184
G1 X105.402 Y88.05 E.84908
G1 X108.543 Y88.05 E.10419
G1 X126.642 Y69.95 E.84908
G1 X125.682 Y69.95 E.03184
G1 X186.55 Y130.818 E2.85542
G1 X186.55 Y132.858 E.06768
G1 X133.358 Y186.05 E2.49533
G1 X134.318 Y186.05 E.03184
G1 X118.219 Y169.95 E.75525
G1 X118.754 Y169.95 E.01774
G1 X102.654 Y186.05 E.75525
G1 X103.614 Y186.05 E.03184
G1 X87.515 Y169.95 E.75525
G1 X88.05 Y169.95 E.01774
G1 X73.45 Y184.55 E.68488
G1 X73.45 Y186.05 E.04976
G1 X73.579 Y186.05 E.00426
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X73.45 Y186.05 E-.04875
G1 X73.45 Y184.55 E-.57001
G1 X73.713 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/125
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
G3 Z3.2 I.312 J1.176 P1  F30000
G1 X129.102 Y169.602 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X78.898 Y169.602 E1.66536
G1 X78.898 Y88.398 E2.69369
G1 X129.102 Y88.398 E1.66536
G1 X129.102 Y169.542 E2.6917
G1 X128.71 Y169.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.29 Y169.21 E1.51854
G1 X79.29 Y88.79 E2.47108
G1 X128.71 Y88.79 E1.51854
G1 X128.71 Y169.15 E2.46924
M204 S10000
; WIPE_START
G1 F24000
G1 X126.71 Y169.152 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.071 J-.577 P1  F30000
G1 X73.102 Y69.602 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X186.898 Y69.602 E3.77482
G1 X186.898 Y186.398 E3.87433
G1 X73.102 Y186.398 E3.77482
G1 X73.102 Y69.662 E3.87234
G1 X72.71 Y69.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X187.29 Y69.21 E3.52072
G1 X187.29 Y186.79 E3.61291
G1 X72.71 Y186.79 E3.52072
G1 X72.71 Y69.27 E3.61106
M204 S10000
; WIPE_START
G1 F24000
G1 X74.71 Y69.269 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.628 J-1.042 P1  F30000
G1 X73.579 Y69.95 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X73.45 Y69.95 E.00426
G1 X73.45 Y71.45 E.04976
G1 X90.05 Y88.05 E.77871
G1 X93.191 Y88.05 E.10419
G1 X111.29 Y69.95 E.84908
G1 X110.33 Y69.95 E.03184
G1 X128.429 Y88.05 E.84908
G1 X123.895 Y88.05 E.15043
G1 X141.994 Y69.95 E.84908
G1 X141.034 Y69.95 E.03184
G1 X186.55 Y115.466 E2.13523
G1 X186.55 Y117.506 E.06768
G1 X118.006 Y186.05 E3.21552
G1 X118.966 Y186.05 E.03184
G1 X102.867 Y169.95 E.75525
G1 X103.402 Y169.95 E.01774
G1 X87.302 Y186.05 E.75525
G1 X88.262 Y186.05 E.03184
G1 X73.45 Y171.238 E.69485
G1 X73.45 Y169.198 E.06768
G1 X78.55 Y164.098 E.23922
G1 X78.55 Y160.985 E.10327
G1 X73.45 Y155.886 E.23922
G1 X73.45 Y153.846 E.06768
G1 X78.55 Y148.746 E.23922
G1 X78.55 Y145.633 E.10327
G1 X73.45 Y140.534 E.23922
G1 X73.45 Y138.494 E.06768
G1 X78.55 Y133.395 E.23922
G1 X78.55 Y130.281 E.10327
G1 X73.45 Y125.182 E.23922
G1 X73.45 Y123.142 E.06768
G1 X78.55 Y118.043 E.23922
G1 X78.55 Y114.929 E.10327
G1 X73.45 Y109.83 E.23922
G1 X73.45 Y107.79 E.06768
G1 X78.55 Y102.691 E.23922
G1 X78.55 Y99.578 E.10327
G1 X73.45 Y94.478 E.23922
G1 X73.45 Y92.438 E.06768
G1 X95.938 Y69.95 E1.05494
G1 X94.978 Y69.95 E.03184
G1 X113.078 Y88.05 E.84908
G1 X116.219 Y88.05 E.10419
G1 X134.318 Y69.95 E.84908
G1 X133.358 Y69.95 E.03184
G1 X186.55 Y123.142 E2.49533
G1 X186.55 Y125.182 E.06768
G1 X125.682 Y186.05 E2.85542
G1 X126.642 Y186.05 E.03184
G1 X110.543 Y169.95 E.75525
G1 X111.078 Y169.95 E.01774
G1 X94.978 Y186.05 E.75525
G1 X95.938 Y186.05 E.03184
G1 X79.839 Y169.95 E.75525
G1 X80.374 Y169.95 E.01774
G1 X73.45 Y176.874 E.32479
G1 X73.45 Y178.914 E.06768
G1 X80.586 Y186.05 E.33475
G1 X79.626 Y186.05 E.03184
G1 X95.726 Y169.95 E.75525
G1 X95.191 Y169.95 E.01774
G1 X111.29 Y186.05 E.75525
G1 X110.33 Y186.05 E.03184
G1 X126.429 Y169.95 E.75525
G1 X125.895 Y169.95 E.01774
G1 X141.994 Y186.05 E.75525
G1 X141.034 Y186.05 E.03184
G1 X186.55 Y140.534 E2.13523
G1 X186.55 Y138.494 E.06768
G1 X118.006 Y69.95 E3.21552
G1 X118.966 Y69.95 E.03184
G1 X100.867 Y88.05 E.84908
G1 X97.726 Y88.05 E.10419
G1 X79.626 Y69.95 E.84908
G1 X80.586 Y69.95 E.03184
G1 X73.45 Y77.086 E.33475
G1 X73.45 Y79.126 E.06768
G1 X82.374 Y88.05 E.41861
G1 X85.515 Y88.05 E.10419
G1 X103.614 Y69.95 E.84908
G1 X102.654 Y69.95 E.03184
G1 X120.754 Y88.05 E.84908
G1 X119.125 Y88.05 E.05401
; WIPE_START
G1 F24000
G1 X120.754 Y88.05 E-.61876
G1 X120.491 Y87.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.411 J1.146 P1  F30000
G1 X186.55 Y111.459 Z3.4
G1 Z3
G1 E.8 F1800
G1 F15476.087
G1 X186.55 Y109.83 E.05401
G1 X129.45 Y166.929 E2.67865
G1 X129.45 Y165.83 E.03647
G1 X149.67 Y186.05 E.94854
G1 X148.71 Y186.05 E.03184
G1 X186.55 Y148.21 E1.77514
G1 X186.55 Y146.17 E.06768
G1 X129.45 Y89.071 E2.67865
G1 X129.45 Y90.17 E.03647
G1 X149.67 Y69.95 E.94854
G1 X148.71 Y69.95 E.03184
G1 X186.55 Y107.79 E1.77514
G1 X186.55 Y102.154 E.18695
G1 X129.45 Y159.254 E2.67865
G1 X129.45 Y158.154 E.03647
G1 X157.346 Y186.05 E1.30863
G1 X156.386 Y186.05 E.03184
G1 X186.55 Y155.886 E1.41504
M73 P42 R31
G1 X186.55 Y153.846 E.06768
G1 X129.45 Y96.746 E2.67865
G1 X129.45 Y97.846 E.03647
G1 X157.346 Y69.95 E1.30863
G1 X156.386 Y69.95 E.03184
G1 X186.55 Y100.114 E1.41504
G1 X186.55 Y94.478 E.18695
G1 X129.45 Y151.578 E2.67865
G1 X129.45 Y150.478 E.03647
G1 X165.022 Y186.05 E1.66873
G1 X164.062 Y186.05 E.03184
G1 X186.55 Y163.562 E1.05494
G1 X186.55 Y161.522 E.06768
G1 X129.45 Y104.422 E2.67865
G1 X129.45 Y105.522 E.03647
G1 X165.022 Y69.95 E1.66873
G1 X164.062 Y69.95 E.03184
G1 X186.55 Y92.438 E1.05494
G1 X186.55 Y86.802 E.18695
G1 X129.45 Y143.902 E2.67865
G1 X129.45 Y142.802 E.03647
G1 X172.698 Y186.05 E2.02882
G1 X171.738 Y186.05 E.03184
G1 X186.55 Y171.238 E.69485
G1 X186.55 Y169.198 E.06768
G1 X129.45 Y112.098 E2.67865
G1 X129.45 Y113.198 E.03647
G1 X172.698 Y69.95 E2.02882
G1 X171.738 Y69.95 E.03184
G1 X186.55 Y84.762 E.69485
G1 X186.55 Y79.126 E.18695
M73 P42 R30
G1 X129.45 Y136.226 E2.67865
G1 X129.45 Y135.126 E.03647
G1 X180.374 Y186.05 E2.38892
G1 X179.414 Y186.05 E.03184
G1 X186.55 Y178.914 E.33475
G1 X186.55 Y176.874 E.06768
G1 X129.45 Y119.774 E2.67865
G1 X129.45 Y120.874 E.03647
G1 X180.374 Y69.95 E2.38892
G1 X179.414 Y69.95 E.03184
G1 X186.55 Y77.086 E.33475
G1 X186.55 Y71.45 E.18695
G1 X129.45 Y128.55 E2.67865
G1 X129.45 Y127.45 E.03647
G1 X186.55 Y184.55 E2.67865
G1 X186.55 Y186.05 E.04976
G1 X186.421 Y186.05 E.00426
; WIPE_START
G1 F24000
G1 X186.55 Y186.05 E-.04876
G1 X186.55 Y184.55 E-.57
G1 X186.287 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.192 J-1.202 P1  F30000
G1 X78.55 Y167.033 Z3.4
G1 Z3
G1 E.8 F1800
G1 F15476.087
G1 X78.55 Y168.661 E.05401
G1 X73.45 Y163.562 E.23922
G1 X73.45 Y161.522 E.06768
G1 X78.55 Y156.422 E.23922
G1 X78.55 Y153.309 E.10327
G1 X73.45 Y148.21 E.23922
G1 X73.45 Y146.17 E.06768
G1 X78.55 Y141.071 E.23922
G1 X78.55 Y137.957 E.10327
G1 X73.45 Y132.858 E.23922
G1 X73.45 Y130.818 E.06768
G1 X78.55 Y125.719 E.23922
G1 X78.55 Y122.605 E.10327
G1 X73.45 Y117.506 E.23922
G1 X73.45 Y115.466 E.06768
G1 X78.55 Y110.367 E.23922
G1 X78.55 Y107.254 E.10327
G1 X73.45 Y102.154 E.23922
G1 X73.45 Y100.114 E.06768
G1 X78.55 Y95.015 E.23922
G1 X78.55 Y91.902 E.10327
G1 X73.45 Y86.802 E.23922
G1 X73.45 Y84.762 E.06768
G1 X88.262 Y69.95 E.69485
G1 X87.302 Y69.95 E.03184
G1 X105.402 Y88.05 E.84908
G1 X108.543 Y88.05 E.10419
G1 X126.642 Y69.95 E.84908
G1 X125.682 Y69.95 E.03184
G1 X186.55 Y130.818 E2.85542
G1 X186.55 Y132.858 E.06768
G1 X133.358 Y186.05 E2.49533
G1 X134.318 Y186.05 E.03184
G1 X118.219 Y169.95 E.75525
G1 X118.754 Y169.95 E.01774
G1 X102.654 Y186.05 E.75525
G1 X103.614 Y186.05 E.03184
G1 X87.515 Y169.95 E.75525
G1 X88.05 Y169.95 E.01774
G1 X73.45 Y184.55 E.68488
G1 X73.45 Y186.05 E.04976
G1 X73.579 Y186.05 E.00426
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X73.45 Y186.05 E-.04875
G1 X73.45 Y184.55 E-.57001
G1 X73.713 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/125
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
G3 Z3.4 I.312 J1.176 P1  F30000
G1 X129.102 Y169.602 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X78.898 Y169.602 E1.66536
G1 X78.898 Y88.398 E2.69369
G1 X129.102 Y88.398 E1.66536
G1 X129.102 Y169.542 E2.6917
G1 X128.71 Y169.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.29 Y169.21 E1.51854
G1 X79.29 Y88.79 E2.47108
G1 X128.71 Y88.79 E1.51854
G1 X128.71 Y169.15 E2.46924
M204 S10000
; WIPE_START
G1 F24000
G1 X126.71 Y169.152 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.071 J-.577 P1  F30000
G1 X73.102 Y69.602 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X186.898 Y69.602 E3.77482
G1 X186.898 Y186.398 E3.87433
G1 X73.102 Y186.398 E3.77482
G1 X73.102 Y69.662 E3.87234
G1 X72.71 Y69.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X187.29 Y69.21 E3.52072
G1 X187.29 Y186.79 E3.61291
G1 X72.71 Y186.79 E3.52072
G1 X72.71 Y69.27 E3.61106
M204 S10000
; WIPE_START
G1 F24000
G1 X74.71 Y69.269 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.628 J-1.042 P1  F30000
G1 X73.579 Y69.95 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X73.45 Y69.95 E.00426
G1 X73.45 Y71.45 E.04976
G1 X90.05 Y88.05 E.77871
G1 X93.191 Y88.05 E.10419
G1 X111.29 Y69.95 E.84908
G1 X110.33 Y69.95 E.03184
G1 X128.429 Y88.05 E.84908
G1 X123.895 Y88.05 E.15043
G1 X141.994 Y69.95 E.84908
G1 X141.034 Y69.95 E.03184
G1 X186.55 Y115.466 E2.13523
G1 X186.55 Y117.506 E.06768
G1 X118.006 Y186.05 E3.21552
G1 X118.966 Y186.05 E.03184
G1 X102.867 Y169.95 E.75525
G1 X103.402 Y169.95 E.01774
G1 X87.302 Y186.05 E.75525
G1 X88.262 Y186.05 E.03184
G1 X73.45 Y171.238 E.69485
G1 X73.45 Y169.198 E.06768
G1 X78.55 Y164.098 E.23922
G1 X78.55 Y160.985 E.10327
G1 X73.45 Y155.886 E.23922
G1 X73.45 Y153.846 E.06768
G1 X78.55 Y148.746 E.23922
G1 X78.55 Y145.633 E.10327
G1 X73.45 Y140.534 E.23922
G1 X73.45 Y138.494 E.06768
G1 X78.55 Y133.395 E.23922
G1 X78.55 Y130.281 E.10327
G1 X73.45 Y125.182 E.23922
G1 X73.45 Y123.142 E.06768
G1 X78.55 Y118.043 E.23922
G1 X78.55 Y114.929 E.10327
G1 X73.45 Y109.83 E.23922
G1 X73.45 Y107.79 E.06768
G1 X78.55 Y102.691 E.23922
G1 X78.55 Y99.578 E.10327
G1 X73.45 Y94.478 E.23922
G1 X73.45 Y92.438 E.06768
G1 X95.938 Y69.95 E1.05494
G1 X94.978 Y69.95 E.03184
G1 X113.078 Y88.05 E.84908
G1 X116.219 Y88.05 E.10419
G1 X134.318 Y69.95 E.84908
G1 X133.358 Y69.95 E.03184
G1 X186.55 Y123.142 E2.49533
G1 X186.55 Y125.182 E.06768
G1 X125.682 Y186.05 E2.85542
G1 X126.642 Y186.05 E.03184
G1 X110.543 Y169.95 E.75525
G1 X111.078 Y169.95 E.01774
G1 X94.978 Y186.05 E.75525
G1 X95.938 Y186.05 E.03184
G1 X79.839 Y169.95 E.75525
G1 X80.374 Y169.95 E.01774
G1 X73.45 Y176.874 E.32479
G1 X73.45 Y178.914 E.06768
G1 X80.586 Y186.05 E.33475
G1 X79.626 Y186.05 E.03184
G1 X95.726 Y169.95 E.75525
G1 X95.191 Y169.95 E.01774
G1 X111.29 Y186.05 E.75525
G1 X110.33 Y186.05 E.03184
G1 X126.429 Y169.95 E.75525
G1 X125.895 Y169.95 E.01774
G1 X141.994 Y186.05 E.75525
G1 X141.034 Y186.05 E.03184
G1 X186.55 Y140.534 E2.13523
G1 X186.55 Y138.494 E.06768
G1 X118.006 Y69.95 E3.21552
G1 X118.966 Y69.95 E.03184
G1 X100.867 Y88.05 E.84908
G1 X97.726 Y88.05 E.10419
G1 X79.626 Y69.95 E.84908
G1 X80.586 Y69.95 E.03184
G1 X73.45 Y77.086 E.33475
G1 X73.45 Y79.126 E.06768
G1 X82.374 Y88.05 E.41861
G1 X85.515 Y88.05 E.10419
G1 X103.614 Y69.95 E.84908
G1 X102.654 Y69.95 E.03184
G1 X120.754 Y88.05 E.84908
G1 X119.125 Y88.05 E.05401
; WIPE_START
G1 F24000
G1 X120.754 Y88.05 E-.61876
G1 X120.491 Y87.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.411 J1.146 P1  F30000
G1 X186.55 Y111.459 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F15476.087
G1 X186.55 Y109.83 E.05401
G1 X129.45 Y166.929 E2.67865
G1 X129.45 Y165.83 E.03647
G1 X149.67 Y186.05 E.94854
G1 X148.71 Y186.05 E.03184
G1 X186.55 Y148.21 E1.77514
G1 X186.55 Y146.17 E.06768
G1 X129.45 Y89.071 E2.67865
G1 X129.45 Y90.17 E.03647
G1 X149.67 Y69.95 E.94854
G1 X148.71 Y69.95 E.03184
G1 X186.55 Y107.79 E1.77514
G1 X186.55 Y102.154 E.18695
G1 X129.45 Y159.254 E2.67865
G1 X129.45 Y158.154 E.03647
G1 X157.346 Y186.05 E1.30863
G1 X156.386 Y186.05 E.03184
G1 X186.55 Y155.886 E1.41504
G1 X186.55 Y153.846 E.06768
G1 X129.45 Y96.746 E2.67865
G1 X129.45 Y97.846 E.03647
G1 X157.346 Y69.95 E1.30863
G1 X156.386 Y69.95 E.03184
G1 X186.55 Y100.114 E1.41504
G1 X186.55 Y94.478 E.18695
G1 X129.45 Y151.578 E2.67865
G1 X129.45 Y150.478 E.03647
G1 X165.022 Y186.05 E1.66873
G1 X164.062 Y186.05 E.03184
G1 X186.55 Y163.562 E1.05494
G1 X186.55 Y161.522 E.06768
G1 X129.45 Y104.422 E2.67865
G1 X129.45 Y105.522 E.03647
G1 X165.022 Y69.95 E1.66873
G1 X164.062 Y69.95 E.03184
G1 X186.55 Y92.438 E1.05494
G1 X186.55 Y86.802 E.18695
G1 X129.45 Y143.902 E2.67865
G1 X129.45 Y142.802 E.03647
G1 X172.698 Y186.05 E2.02882
G1 X171.738 Y186.05 E.03184
G1 X186.55 Y171.238 E.69485
G1 X186.55 Y169.198 E.06768
G1 X129.45 Y112.098 E2.67865
G1 X129.45 Y113.198 E.03647
G1 X172.698 Y69.95 E2.02882
G1 X171.738 Y69.95 E.03184
G1 X186.55 Y84.762 E.69485
G1 X186.55 Y79.126 E.18695
G1 X129.45 Y136.226 E2.67865
G1 X129.45 Y135.126 E.03647
G1 X180.374 Y186.05 E2.38892
G1 X179.414 Y186.05 E.03184
G1 X186.55 Y178.914 E.33475
G1 X186.55 Y176.874 E.06768
G1 X129.45 Y119.774 E2.67865
G1 X129.45 Y120.874 E.03647
G1 X180.374 Y69.95 E2.38892
G1 X179.414 Y69.95 E.03184
G1 X186.55 Y77.086 E.33475
G1 X186.55 Y71.45 E.18695
G1 X129.45 Y128.55 E2.67865
G1 X129.45 Y127.45 E.03647
G1 X186.55 Y184.55 E2.67865
G1 X186.55 Y186.05 E.04976
G1 X186.421 Y186.05 E.00426
; WIPE_START
G1 F24000
G1 X186.55 Y186.05 E-.04876
G1 X186.55 Y184.55 E-.57
G1 X186.287 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.192 J-1.202 P1  F30000
G1 X78.55 Y167.033 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F15476.087
G1 X78.55 Y168.661 E.05401
G1 X73.45 Y163.562 E.23922
G1 X73.45 Y161.522 E.06768
G1 X78.55 Y156.422 E.23922
M73 P43 R30
G1 X78.55 Y153.309 E.10327
G1 X73.45 Y148.21 E.23922
G1 X73.45 Y146.17 E.06768
G1 X78.55 Y141.071 E.23922
G1 X78.55 Y137.957 E.10327
G1 X73.45 Y132.858 E.23922
G1 X73.45 Y130.818 E.06768
G1 X78.55 Y125.719 E.23922
G1 X78.55 Y122.605 E.10327
G1 X73.45 Y117.506 E.23922
G1 X73.45 Y115.466 E.06768
G1 X78.55 Y110.367 E.23922
G1 X78.55 Y107.254 E.10327
G1 X73.45 Y102.154 E.23922
G1 X73.45 Y100.114 E.06768
G1 X78.55 Y95.015 E.23922
G1 X78.55 Y91.902 E.10327
G1 X73.45 Y86.802 E.23922
G1 X73.45 Y84.762 E.06768
G1 X88.262 Y69.95 E.69485
G1 X87.302 Y69.95 E.03184
G1 X105.402 Y88.05 E.84908
G1 X108.543 Y88.05 E.10419
G1 X126.642 Y69.95 E.84908
G1 X125.682 Y69.95 E.03184
G1 X186.55 Y130.818 E2.85542
G1 X186.55 Y132.858 E.06768
G1 X133.358 Y186.05 E2.49533
G1 X134.318 Y186.05 E.03184
G1 X118.219 Y169.95 E.75525
G1 X118.754 Y169.95 E.01774
G1 X102.654 Y186.05 E.75525
G1 X103.614 Y186.05 E.03184
G1 X87.515 Y169.95 E.75525
G1 X88.05 Y169.95 E.01774
G1 X73.45 Y184.55 E.68488
G1 X73.45 Y186.05 E.04976
G1 X73.579 Y186.05 E.00426
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X73.45 Y186.05 E-.04875
G1 X73.45 Y184.55 E-.57001
G1 X73.713 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/125
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
G3 Z3.6 I.312 J1.176 P1  F30000
G1 X129.102 Y169.602 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X78.898 Y169.602 E1.66536
G1 X78.898 Y88.398 E2.69369
G1 X129.102 Y88.398 E1.66536
G1 X129.102 Y169.542 E2.6917
G1 X128.71 Y169.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.29 Y169.21 E1.51854
G1 X79.29 Y88.79 E2.47108
G1 X128.71 Y88.79 E1.51854
G1 X128.71 Y169.15 E2.46924
M204 S10000
; WIPE_START
G1 F24000
G1 X126.71 Y169.152 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.071 J-.577 P1  F30000
G1 X73.102 Y69.602 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X186.898 Y69.602 E3.77482
G1 X186.898 Y186.398 E3.87433
G1 X73.102 Y186.398 E3.77482
G1 X73.102 Y69.662 E3.87234
G1 X72.71 Y69.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X187.29 Y69.21 E3.52072
G1 X187.29 Y186.79 E3.61291
G1 X72.71 Y186.79 E3.52072
G1 X72.71 Y69.27 E3.61106
M204 S10000
; WIPE_START
G1 F24000
G1 X74.71 Y69.269 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.628 J-1.042 P1  F30000
G1 X73.579 Y69.95 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X73.45 Y69.95 E.00426
G1 X73.45 Y71.45 E.04976
G1 X90.05 Y88.05 E.77871
G1 X93.191 Y88.05 E.10419
G1 X111.29 Y69.95 E.84908
G1 X110.33 Y69.95 E.03184
G1 X128.429 Y88.05 E.84908
G1 X123.895 Y88.05 E.15043
G1 X141.994 Y69.95 E.84908
G1 X141.034 Y69.95 E.03184
G1 X186.55 Y115.466 E2.13523
G1 X186.55 Y117.506 E.06768
G1 X118.006 Y186.05 E3.21552
G1 X118.966 Y186.05 E.03184
G1 X102.867 Y169.95 E.75525
G1 X103.402 Y169.95 E.01774
G1 X87.302 Y186.05 E.75525
G1 X88.262 Y186.05 E.03184
G1 X73.45 Y171.238 E.69485
G1 X73.45 Y169.198 E.06768
G1 X78.55 Y164.098 E.23922
G1 X78.55 Y160.985 E.10327
G1 X73.45 Y155.886 E.23922
G1 X73.45 Y153.846 E.06768
G1 X78.55 Y148.746 E.23922
G1 X78.55 Y145.633 E.10327
G1 X73.45 Y140.534 E.23922
G1 X73.45 Y138.494 E.06768
G1 X78.55 Y133.395 E.23922
G1 X78.55 Y130.281 E.10327
G1 X73.45 Y125.182 E.23922
G1 X73.45 Y123.142 E.06768
G1 X78.55 Y118.043 E.23922
G1 X78.55 Y114.929 E.10327
G1 X73.45 Y109.83 E.23922
G1 X73.45 Y107.79 E.06768
G1 X78.55 Y102.691 E.23922
G1 X78.55 Y99.578 E.10327
G1 X73.45 Y94.478 E.23922
G1 X73.45 Y92.438 E.06768
G1 X95.938 Y69.95 E1.05494
G1 X94.978 Y69.95 E.03184
G1 X113.078 Y88.05 E.84908
G1 X116.219 Y88.05 E.10419
G1 X134.318 Y69.95 E.84908
G1 X133.358 Y69.95 E.03184
G1 X186.55 Y123.142 E2.49533
G1 X186.55 Y125.182 E.06768
G1 X125.682 Y186.05 E2.85542
G1 X126.642 Y186.05 E.03184
G1 X110.543 Y169.95 E.75525
G1 X111.078 Y169.95 E.01774
G1 X94.978 Y186.05 E.75525
G1 X95.938 Y186.05 E.03184
G1 X79.839 Y169.95 E.75525
G1 X80.374 Y169.95 E.01774
G1 X73.45 Y176.874 E.32479
G1 X73.45 Y178.914 E.06768
G1 X80.586 Y186.05 E.33475
G1 X79.626 Y186.05 E.03184
G1 X95.726 Y169.95 E.75525
G1 X95.191 Y169.95 E.01774
G1 X111.29 Y186.05 E.75525
G1 X110.33 Y186.05 E.03184
G1 X126.429 Y169.95 E.75525
G1 X125.895 Y169.95 E.01774
G1 X141.994 Y186.05 E.75525
G1 X141.034 Y186.05 E.03184
G1 X186.55 Y140.534 E2.13523
G1 X186.55 Y138.494 E.06768
G1 X118.006 Y69.95 E3.21552
G1 X118.966 Y69.95 E.03184
G1 X100.867 Y88.05 E.84908
G1 X97.726 Y88.05 E.10419
G1 X79.626 Y69.95 E.84908
G1 X80.586 Y69.95 E.03184
G1 X73.45 Y77.086 E.33475
G1 X73.45 Y79.126 E.06768
G1 X82.374 Y88.05 E.41861
G1 X85.515 Y88.05 E.10419
G1 X103.614 Y69.95 E.84908
G1 X102.654 Y69.95 E.03184
G1 X120.754 Y88.05 E.84908
G1 X119.125 Y88.05 E.05401
; WIPE_START
G1 F24000
G1 X120.754 Y88.05 E-.61876
G1 X120.491 Y87.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.411 J1.146 P1  F30000
G1 X186.55 Y111.459 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F15476.087
G1 X186.55 Y109.83 E.05401
G1 X129.45 Y166.929 E2.67865
G1 X129.45 Y165.83 E.03647
G1 X149.67 Y186.05 E.94854
G1 X148.71 Y186.05 E.03184
G1 X186.55 Y148.21 E1.77514
G1 X186.55 Y146.17 E.06768
G1 X129.45 Y89.071 E2.67865
G1 X129.45 Y90.17 E.03647
G1 X149.67 Y69.95 E.94854
G1 X148.71 Y69.95 E.03184
G1 X186.55 Y107.79 E1.77514
G1 X186.55 Y102.154 E.18695
G1 X129.45 Y159.254 E2.67865
G1 X129.45 Y158.154 E.03647
G1 X157.346 Y186.05 E1.30863
G1 X156.386 Y186.05 E.03184
G1 X186.55 Y155.886 E1.41504
G1 X186.55 Y153.846 E.06768
G1 X129.45 Y96.746 E2.67865
G1 X129.45 Y97.846 E.03647
G1 X157.346 Y69.95 E1.30863
G1 X156.386 Y69.95 E.03184
G1 X186.55 Y100.114 E1.41504
G1 X186.55 Y94.478 E.18695
G1 X129.45 Y151.578 E2.67865
G1 X129.45 Y150.478 E.03647
G1 X165.022 Y186.05 E1.66873
G1 X164.062 Y186.05 E.03184
G1 X186.55 Y163.562 E1.05494
G1 X186.55 Y161.522 E.06768
G1 X129.45 Y104.422 E2.67865
G1 X129.45 Y105.522 E.03647
G1 X165.022 Y69.95 E1.66873
G1 X164.062 Y69.95 E.03184
G1 X186.55 Y92.438 E1.05494
G1 X186.55 Y86.802 E.18695
G1 X129.45 Y143.902 E2.67865
G1 X129.45 Y142.802 E.03647
G1 X172.698 Y186.05 E2.02882
G1 X171.738 Y186.05 E.03184
G1 X186.55 Y171.238 E.69485
G1 X186.55 Y169.198 E.06768
G1 X129.45 Y112.098 E2.67865
G1 X129.45 Y113.198 E.03647
G1 X172.698 Y69.95 E2.02882
G1 X171.738 Y69.95 E.03184
G1 X186.55 Y84.762 E.69485
G1 X186.55 Y79.126 E.18695
G1 X129.45 Y136.226 E2.67865
G1 X129.45 Y135.126 E.03647
G1 X180.374 Y186.05 E2.38892
G1 X179.414 Y186.05 E.03184
G1 X186.55 Y178.914 E.33475
G1 X186.55 Y176.874 E.06768
G1 X129.45 Y119.774 E2.67865
G1 X129.45 Y120.874 E.03647
G1 X180.374 Y69.95 E2.38892
G1 X179.414 Y69.95 E.03184
G1 X186.55 Y77.086 E.33475
G1 X186.55 Y71.45 E.18695
G1 X129.45 Y128.55 E2.67865
G1 X129.45 Y127.45 E.03647
G1 X186.55 Y184.55 E2.67865
G1 X186.55 Y186.05 E.04976
G1 X186.421 Y186.05 E.00426
; WIPE_START
G1 F24000
G1 X186.55 Y186.05 E-.04876
G1 X186.55 Y184.55 E-.57
G1 X186.287 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.192 J-1.202 P1  F30000
G1 X78.55 Y167.033 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F15476.087
G1 X78.55 Y168.661 E.05401
G1 X73.45 Y163.562 E.23922
G1 X73.45 Y161.522 E.06768
G1 X78.55 Y156.422 E.23922
G1 X78.55 Y153.309 E.10327
G1 X73.45 Y148.21 E.23922
G1 X73.45 Y146.17 E.06768
G1 X78.55 Y141.071 E.23922
G1 X78.55 Y137.957 E.10327
G1 X73.45 Y132.858 E.23922
G1 X73.45 Y130.818 E.06768
G1 X78.55 Y125.719 E.23922
G1 X78.55 Y122.605 E.10327
G1 X73.45 Y117.506 E.23922
G1 X73.45 Y115.466 E.06768
G1 X78.55 Y110.367 E.23922
G1 X78.55 Y107.254 E.10327
G1 X73.45 Y102.154 E.23922
G1 X73.45 Y100.114 E.06768
G1 X78.55 Y95.015 E.23922
G1 X78.55 Y91.902 E.10327
G1 X73.45 Y86.802 E.23922
G1 X73.45 Y84.762 E.06768
G1 X88.262 Y69.95 E.69485
G1 X87.302 Y69.95 E.03184
G1 X105.402 Y88.05 E.84908
G1 X108.543 Y88.05 E.10419
G1 X126.642 Y69.95 E.84908
G1 X125.682 Y69.95 E.03184
G1 X186.55 Y130.818 E2.85542
G1 X186.55 Y132.858 E.06768
G1 X133.358 Y186.05 E2.49533
G1 X134.318 Y186.05 E.03184
G1 X118.219 Y169.95 E.75525
G1 X118.754 Y169.95 E.01774
G1 X102.654 Y186.05 E.75525
G1 X103.614 Y186.05 E.03184
G1 X87.515 Y169.95 E.75525
M73 P43 R29
G1 X88.05 Y169.95 E.01774
G1 X73.45 Y184.55 E.68488
G1 X73.45 Y186.05 E.04976
G1 X73.579 Y186.05 E.00426
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X73.45 Y186.05 E-.04875
G1 X73.45 Y184.55 E-.57001
G1 X73.713 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/125
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
G3 Z3.8 I.312 J1.176 P1  F30000
G1 X129.102 Y169.602 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X78.898 Y169.602 E1.66536
G1 X78.898 Y88.398 E2.69369
G1 X129.102 Y88.398 E1.66536
G1 X129.102 Y169.542 E2.6917
G1 X128.71 Y169.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.29 Y169.21 E1.51854
G1 X79.29 Y88.79 E2.47108
G1 X128.71 Y88.79 E1.51854
G1 X128.71 Y169.15 E2.46924
M204 S10000
; WIPE_START
G1 F24000
G1 X126.71 Y169.152 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.071 J-.577 P1  F30000
G1 X73.102 Y69.602 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
M73 P44 R29
G1 X186.898 Y69.602 E3.77482
G1 X186.898 Y186.398 E3.87433
G1 X73.102 Y186.398 E3.77482
G1 X73.102 Y69.662 E3.87234
G1 X72.71 Y69.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X187.29 Y69.21 E3.52072
G1 X187.29 Y186.79 E3.61291
G1 X72.71 Y186.79 E3.52072
G1 X72.71 Y69.27 E3.61106
M204 S10000
; WIPE_START
G1 F24000
G1 X74.71 Y69.269 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.628 J-1.042 P1  F30000
G1 X73.579 Y69.95 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X73.45 Y69.95 E.00426
G1 X73.45 Y71.45 E.04976
G1 X90.05 Y88.05 E.77871
G1 X93.191 Y88.05 E.10419
G1 X111.29 Y69.95 E.84908
G1 X110.33 Y69.95 E.03184
G1 X128.429 Y88.05 E.84908
G1 X123.895 Y88.05 E.15043
G1 X141.994 Y69.95 E.84908
G1 X141.034 Y69.95 E.03184
G1 X186.55 Y115.466 E2.13523
G1 X186.55 Y117.506 E.06768
G1 X118.006 Y186.05 E3.21552
G1 X118.966 Y186.05 E.03184
G1 X102.867 Y169.95 E.75525
G1 X103.402 Y169.95 E.01774
G1 X87.302 Y186.05 E.75525
G1 X88.262 Y186.05 E.03184
G1 X73.45 Y171.238 E.69485
G1 X73.45 Y169.198 E.06768
G1 X78.55 Y164.098 E.23922
G1 X78.55 Y160.985 E.10327
G1 X73.45 Y155.886 E.23922
G1 X73.45 Y153.846 E.06768
G1 X78.55 Y148.746 E.23922
G1 X78.55 Y145.633 E.10327
G1 X73.45 Y140.534 E.23922
G1 X73.45 Y138.494 E.06768
G1 X78.55 Y133.395 E.23922
G1 X78.55 Y130.281 E.10327
G1 X73.45 Y125.182 E.23922
G1 X73.45 Y123.142 E.06768
G1 X78.55 Y118.043 E.23922
G1 X78.55 Y114.929 E.10327
G1 X73.45 Y109.83 E.23922
G1 X73.45 Y107.79 E.06768
G1 X78.55 Y102.691 E.23922
G1 X78.55 Y99.578 E.10327
G1 X73.45 Y94.478 E.23922
G1 X73.45 Y92.438 E.06768
G1 X95.938 Y69.95 E1.05494
G1 X94.978 Y69.95 E.03184
G1 X113.078 Y88.05 E.84908
G1 X116.219 Y88.05 E.10419
G1 X134.318 Y69.95 E.84908
G1 X133.358 Y69.95 E.03184
G1 X186.55 Y123.142 E2.49533
G1 X186.55 Y125.182 E.06768
G1 X125.682 Y186.05 E2.85542
G1 X126.642 Y186.05 E.03184
G1 X110.543 Y169.95 E.75525
G1 X111.078 Y169.95 E.01774
G1 X94.978 Y186.05 E.75525
G1 X95.938 Y186.05 E.03184
G1 X79.839 Y169.95 E.75525
G1 X80.374 Y169.95 E.01774
G1 X73.45 Y176.874 E.32479
G1 X73.45 Y178.914 E.06768
G1 X80.586 Y186.05 E.33475
G1 X79.626 Y186.05 E.03184
G1 X95.726 Y169.95 E.75525
G1 X95.191 Y169.95 E.01774
G1 X111.29 Y186.05 E.75525
G1 X110.33 Y186.05 E.03184
G1 X126.429 Y169.95 E.75525
G1 X125.895 Y169.95 E.01774
G1 X141.994 Y186.05 E.75525
G1 X141.034 Y186.05 E.03184
G1 X186.55 Y140.534 E2.13523
G1 X186.55 Y138.494 E.06768
G1 X118.006 Y69.95 E3.21552
G1 X118.966 Y69.95 E.03184
G1 X100.867 Y88.05 E.84908
G1 X97.726 Y88.05 E.10419
G1 X79.626 Y69.95 E.84908
G1 X80.586 Y69.95 E.03184
G1 X73.45 Y77.086 E.33475
G1 X73.45 Y79.126 E.06768
G1 X82.374 Y88.05 E.41861
G1 X85.515 Y88.05 E.10419
G1 X103.614 Y69.95 E.84908
G1 X102.654 Y69.95 E.03184
G1 X120.754 Y88.05 E.84908
G1 X119.125 Y88.05 E.05401
; WIPE_START
G1 F24000
G1 X120.754 Y88.05 E-.61876
G1 X120.491 Y87.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.411 J1.146 P1  F30000
G1 X186.55 Y111.459 Z4
G1 Z3.6
G1 E.8 F1800
G1 F15476.087
G1 X186.55 Y109.83 E.05401
G1 X129.45 Y166.929 E2.67865
G1 X129.45 Y165.83 E.03647
G1 X149.67 Y186.05 E.94854
G1 X148.71 Y186.05 E.03184
G1 X186.55 Y148.21 E1.77514
G1 X186.55 Y146.17 E.06768
G1 X129.45 Y89.071 E2.67865
G1 X129.45 Y90.17 E.03647
G1 X149.67 Y69.95 E.94854
G1 X148.71 Y69.95 E.03184
G1 X186.55 Y107.79 E1.77514
G1 X186.55 Y102.154 E.18695
G1 X129.45 Y159.254 E2.67865
G1 X129.45 Y158.154 E.03647
G1 X157.346 Y186.05 E1.30863
G1 X156.386 Y186.05 E.03184
G1 X186.55 Y155.886 E1.41504
G1 X186.55 Y153.846 E.06768
G1 X129.45 Y96.746 E2.67865
G1 X129.45 Y97.846 E.03647
G1 X157.346 Y69.95 E1.30863
G1 X156.386 Y69.95 E.03184
G1 X186.55 Y100.114 E1.41504
G1 X186.55 Y94.478 E.18695
G1 X129.45 Y151.578 E2.67865
G1 X129.45 Y150.478 E.03647
G1 X165.022 Y186.05 E1.66873
G1 X164.062 Y186.05 E.03184
G1 X186.55 Y163.562 E1.05494
G1 X186.55 Y161.522 E.06768
G1 X129.45 Y104.422 E2.67865
G1 X129.45 Y105.522 E.03647
G1 X165.022 Y69.95 E1.66873
G1 X164.062 Y69.95 E.03184
G1 X186.55 Y92.438 E1.05494
G1 X186.55 Y86.802 E.18695
G1 X129.45 Y143.902 E2.67865
G1 X129.45 Y142.802 E.03647
G1 X172.698 Y186.05 E2.02882
G1 X171.738 Y186.05 E.03184
G1 X186.55 Y171.238 E.69485
G1 X186.55 Y169.198 E.06768
G1 X129.45 Y112.098 E2.67865
G1 X129.45 Y113.198 E.03647
G1 X172.698 Y69.95 E2.02882
G1 X171.738 Y69.95 E.03184
G1 X186.55 Y84.762 E.69485
G1 X186.55 Y79.126 E.18695
G1 X129.45 Y136.226 E2.67865
G1 X129.45 Y135.126 E.03647
G1 X180.374 Y186.05 E2.38892
G1 X179.414 Y186.05 E.03184
G1 X186.55 Y178.914 E.33475
G1 X186.55 Y176.874 E.06768
G1 X129.45 Y119.774 E2.67865
G1 X129.45 Y120.874 E.03647
G1 X180.374 Y69.95 E2.38892
G1 X179.414 Y69.95 E.03184
G1 X186.55 Y77.086 E.33475
G1 X186.55 Y71.45 E.18695
G1 X129.45 Y128.55 E2.67865
G1 X129.45 Y127.45 E.03647
G1 X186.55 Y184.55 E2.67865
G1 X186.55 Y186.05 E.04976
G1 X186.421 Y186.05 E.00426
; WIPE_START
G1 F24000
G1 X186.55 Y186.05 E-.04876
G1 X186.55 Y184.55 E-.57
G1 X186.287 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.192 J-1.202 P1  F30000
G1 X78.55 Y167.033 Z4
G1 Z3.6
G1 E.8 F1800
G1 F15476.087
G1 X78.55 Y168.661 E.05401
G1 X73.45 Y163.562 E.23922
G1 X73.45 Y161.522 E.06768
G1 X78.55 Y156.422 E.23922
G1 X78.55 Y153.309 E.10327
G1 X73.45 Y148.21 E.23922
G1 X73.45 Y146.17 E.06768
G1 X78.55 Y141.071 E.23922
G1 X78.55 Y137.957 E.10327
G1 X73.45 Y132.858 E.23922
G1 X73.45 Y130.818 E.06768
G1 X78.55 Y125.719 E.23922
G1 X78.55 Y122.605 E.10327
G1 X73.45 Y117.506 E.23922
G1 X73.45 Y115.466 E.06768
G1 X78.55 Y110.367 E.23922
G1 X78.55 Y107.254 E.10327
G1 X73.45 Y102.154 E.23922
G1 X73.45 Y100.114 E.06768
G1 X78.55 Y95.015 E.23922
G1 X78.55 Y91.902 E.10327
G1 X73.45 Y86.802 E.23922
G1 X73.45 Y84.762 E.06768
G1 X88.262 Y69.95 E.69485
G1 X87.302 Y69.95 E.03184
G1 X105.402 Y88.05 E.84908
G1 X108.543 Y88.05 E.10419
G1 X126.642 Y69.95 E.84908
G1 X125.682 Y69.95 E.03184
G1 X186.55 Y130.818 E2.85542
G1 X186.55 Y132.858 E.06768
G1 X133.358 Y186.05 E2.49533
G1 X134.318 Y186.05 E.03184
G1 X118.219 Y169.95 E.75525
G1 X118.754 Y169.95 E.01774
G1 X102.654 Y186.05 E.75525
G1 X103.614 Y186.05 E.03184
G1 X87.515 Y169.95 E.75525
G1 X88.05 Y169.95 E.01774
G1 X73.45 Y184.55 E.68488
G1 X73.45 Y186.05 E.04976
G1 X73.579 Y186.05 E.00426
M106 S226.95
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X73.45 Y186.05 E-.04875
G1 X73.45 Y184.55 E-.57001
G1 X73.713 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/125
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
G3 Z4 I.312 J1.176 P1  F30000
G1 X129.102 Y169.602 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X78.898 Y169.602 E1.66536
G1 X78.898 Y88.398 E2.69369
G1 X129.102 Y88.398 E1.66536
G1 X129.102 Y169.542 E2.6917
G1 X128.71 Y169.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.29 Y169.21 E1.51854
G1 X79.29 Y88.79 E2.47108
G1 X128.71 Y88.79 E1.51854
G1 X128.71 Y169.15 E2.46924
M204 S10000
; WIPE_START
G1 F24000
G1 X126.71 Y169.152 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.071 J-.577 P1  F30000
G1 X73.102 Y69.602 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X186.898 Y69.602 E3.77482
G1 X186.898 Y186.398 E3.87433
G1 X73.102 Y186.398 E3.77482
G1 X73.102 Y69.662 E3.87234
G1 X72.71 Y69.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X187.29 Y69.21 E3.52072
G1 X187.29 Y186.79 E3.61291
G1 X72.71 Y186.79 E3.52072
G1 X72.71 Y69.27 E3.61106
M204 S10000
; WIPE_START
G1 F24000
G1 X74.71 Y69.269 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.013 J-.674 P1  F30000
G1 X73.986 Y70.357 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X73.857 Y70.357 E.00426
G1 X73.857 Y71.857 E.04976
G1 X89.643 Y87.643 E.74051
G1 X85.922 Y87.643 E.12342
G1 X103.207 Y70.357 E.81088
G1 X103.061 Y70.357 E.00483
G1 X120.346 Y87.643 E.81088
G1 X116.626 Y87.643 E.12342
G1 X133.911 Y70.357 E.81088
G1 X133.765 Y70.357 E.00483
G1 X186.143 Y122.735 E2.45713
G1 X186.143 Y125.589 E.09468
G1 X126.089 Y185.643 E2.81723
G1 X126.235 Y185.643 E.00483
G1 X110.95 Y170.357 E.71706
G1 X110.67 Y170.357 E.00926
G1 X95.385 Y185.643 E.71706
G1 X95.531 Y185.643 E.00483
G1 X80.246 Y170.357 E.71706
G1 X79.967 Y170.357 E.00926
G1 X73.857 Y176.467 E.28659
G1 X73.857 Y179.321 E.09468
G1 X80.179 Y185.643 E.29656
G1 X80.033 Y185.643 E.00483
G1 X95.319 Y170.357 E.71706
G1 X95.598 Y170.357 E.00926
G1 X110.883 Y185.643 E.71706
G1 X110.737 Y185.643 E.00483
G1 X126.022 Y170.357 E.71706
G1 X126.302 Y170.357 E.00926
G1 X141.587 Y185.643 E.71706
G1 X141.441 Y185.643 E.00483
G1 X186.143 Y140.941 E2.09704
G1 X186.143 Y138.087 E.09468
G1 X118.413 Y70.357 E3.17732
G1 X118.559 Y70.357 E.00483
M73 P45 R29
G1 X101.274 Y87.643 E.81088
G1 X104.995 Y87.643 E.12342
G1 X87.709 Y70.357 E.81088
G1 X87.855 Y70.357 E.00483
G1 X73.857 Y84.355 E.65666
G1 X73.857 Y87.209 E.09468
G1 X78.143 Y91.495 E.20103
G1 X78.143 Y93.123 E.05401
G1 X78.55 Y88.05 F30000
G1 F15476.087
G1 X78.55 Y169.95 E2.7168
G1 X129.45 Y169.95 E1.68847
G1 X129.45 Y88.05 E2.7168
G1 X78.61 Y88.05 E1.68648
G1 X83.595 Y87.643 F30000
G1 F15476.087
G1 X81.967 Y87.643 E.05401
G1 X73.857 Y79.533 E.38042
G1 X73.857 Y76.679 E.09468
G1 X80.179 Y70.357 E.29656
G1 X80.033 Y70.357 E.00483
G1 X97.319 Y87.643 E.81088
G1 X93.598 Y87.643 E.12342
G1 X110.883 Y70.357 E.81088
G1 X110.737 Y70.357 E.00483
G1 X128.022 Y87.643 E.81088
G1 X124.302 Y87.643 E.12342
G1 X141.587 Y70.357 E.81088
G1 X141.441 Y70.357 E.00483
G1 X186.143 Y115.059 E2.09704
G1 X186.143 Y117.913 E.09468
G1 X118.413 Y185.643 E3.17732
G1 X118.559 Y185.643 E.00483
G1 X103.274 Y170.357 E.71706
G1 X102.994 Y170.357 E.00926
G1 X87.709 Y185.643 E.71706
G1 X87.855 Y185.643 E.00483
G1 X73.857 Y171.645 E.65666
G1 X73.857 Y168.791 E.09468
G1 X78.143 Y164.505 E.20103
G1 X78.143 Y168.254 E.12435
G1 X73.857 Y163.969 E.20103
G1 X73.857 Y161.115 E.09468
G1 X78.143 Y156.83 E.20103
G1 X78.143 Y160.578 E.12435
G1 X73.857 Y156.293 E.20103
G1 X73.857 Y153.439 E.09468
G1 X78.143 Y149.154 E.20103
G1 X78.143 Y152.902 E.12435
G1 X73.857 Y148.617 E.20103
G1 X73.857 Y145.763 E.09468
G1 X78.143 Y141.478 E.20103
G1 X78.143 Y145.226 E.12435
G1 X73.857 Y140.941 E.20103
G1 X73.857 Y138.087 E.09468
G1 X78.143 Y133.802 E.20103
G1 X78.143 Y137.55 E.12435
G1 X73.857 Y133.265 E.20103
G1 X73.857 Y130.411 E.09468
G1 X78.143 Y126.126 E.20103
G1 X78.143 Y129.874 E.12435
G1 X73.857 Y125.589 E.20103
G1 X73.857 Y122.735 E.09468
G1 X78.143 Y118.45 E.20103
G1 X78.143 Y122.198 E.12435
G1 X73.857 Y117.913 E.20103
G1 X73.857 Y115.059 E.09468
G1 X78.143 Y110.774 E.20103
G1 X78.143 Y114.522 E.12435
G1 X73.857 Y110.237 E.20103
G1 X73.857 Y107.383 E.09468
G1 X78.143 Y103.098 E.20103
G1 X78.143 Y106.846 E.12435
G1 X73.857 Y102.561 E.20103
G1 X73.857 Y99.707 E.09468
G1 X78.143 Y95.422 E.20103
G1 X78.143 Y99.17 E.12435
G1 X73.857 Y94.885 E.20103
G1 X73.857 Y92.031 E.09468
G1 X78.143 Y87.746 E.20103
G1 X78.143 Y87.643 E.00343
G1 X78.246 Y87.643 E.00343
G1 X95.531 Y70.357 E.81088
G1 X95.385 Y70.357 E.00483
G1 X112.67 Y87.643 E.81088
G1 X108.95 Y87.643 E.12342
G1 X126.235 Y70.357 E.81088
G1 X126.089 Y70.357 E.00483
G1 X186.143 Y130.411 E2.81723
G1 X186.143 Y133.265 E.09468
G1 X133.765 Y185.643 E2.45713
G1 X133.911 Y185.643 E.00483
G1 X118.626 Y170.357 E.71706
G1 X118.346 Y170.357 E.00926
G1 X103.061 Y185.643 E.71706
G1 X103.207 Y185.643 E.00483
G1 X87.922 Y170.357 E.71706
G1 X87.643 Y170.357 E.00926
G1 X73.857 Y184.143 E.64669
G1 X73.857 Y185.643 E.04976
G1 X73.986 Y185.643 E.00426
G1 X182.441 Y184.651 F30000
G1 F15476.087
G1 X180.812 Y184.651 E.05401
G1 X179.414 Y186.05 E.0656
G1 X180.374 Y186.05 E.03184
G1 X178.975 Y184.651 E.0656
G1 X173.136 Y184.651 E.19369
G1 X171.738 Y186.05 E.0656
G1 X172.698 Y186.05 E.03184
G1 X171.299 Y184.651 E.0656
G1 X165.46 Y184.651 E.19369
G1 X164.062 Y186.05 E.0656
G1 X165.022 Y186.05 E.03184
G1 X163.623 Y184.651 E.0656
G1 X157.784 Y184.651 E.19369
G1 X156.386 Y186.05 E.0656
G1 X157.346 Y186.05 E.03184
G1 X155.947 Y184.651 E.0656
G1 X150.108 Y184.651 E.19369
G1 X149.151 Y185.608 E.0449
G1 X149.151 Y185.531 E.00256
G1 X149.67 Y186.05 E.02433
G1 X151.298 Y186.05 E.05401
G1 X147.634 Y185.643 F30000
G1 F15476.087
G1 X148.337 Y185.643 E.02331
G1 X148.337 Y184.717 E.0307
G1 X129.857 Y166.237 E.86692
G1 X129.857 Y166.522 E.00946
G1 X186.143 Y110.237 E2.64045
G1 X186.143 Y107.383 E.09468
G1 X150.923 Y72.163 E1.65225
G1 X148.337 Y72.163 E.08576
G1 X148.337 Y71.283 E.02919
G1 X129.857 Y89.763 E.86692
G1 X129.857 Y89.478 E.00946
G1 X186.143 Y145.763 E2.64045
G1 X186.143 Y148.617 E.09468
G1 X150.923 Y183.837 E1.65225
G1 X155.133 Y183.837 E.13968
G1 X129.857 Y158.561 E1.18574
G1 X129.857 Y158.846 E.00946
G1 X186.143 Y102.561 E2.64045
G1 X186.143 Y99.707 E.09468
G1 X158.598 Y72.163 E1.29215
G1 X155.133 Y72.163 E.11495
G1 X129.857 Y97.439 E1.18574
G1 X129.857 Y97.154 E.00946
G1 X186.143 Y153.439 E2.64045
G1 X186.143 Y156.293 E.09468
G1 X158.598 Y183.837 E1.29215
G1 X162.809 Y183.837 E.13968
G1 X129.857 Y150.885 E1.54584
G1 X129.857 Y151.17 E.00946
G1 X186.143 Y94.885 E2.64045
G1 X186.143 Y92.031 E.09468
G1 X166.274 Y72.163 E.93205
G1 X162.809 Y72.163 E.11495
G1 X129.857 Y105.115 E1.54584
G1 X129.857 Y104.83 E.00946
G1 X186.143 Y161.115 E2.64045
G1 X186.143 Y163.969 E.09468
G1 X166.274 Y183.837 E.93205
G1 X170.485 Y183.837 E.13968
G1 X129.857 Y143.209 E1.90593
G1 X129.857 Y143.495 E.00946
G1 X186.143 Y87.209 E2.64045
G1 X186.143 Y84.355 E.09468
G1 X173.95 Y72.163 E.57196
G1 X170.485 Y72.163 E.11495
G1 X129.857 Y112.791 E1.90593
G1 X129.857 Y112.505 E.00946
G1 X186.143 Y168.791 E2.64045
G1 X186.143 Y171.645 E.09468
G1 X173.95 Y183.837 E.57196
G1 X178.161 Y183.837 E.13968
G1 X129.857 Y135.533 E2.26603
G1 X129.857 Y135.819 E.00946
G1 X186.143 Y79.533 E2.64045
G1 X186.143 Y76.679 E.09468
G1 X181.626 Y72.163 E.21186
G1 X178.161 Y72.163 E.11495
G1 X129.857 Y120.467 E2.26603
G1 X129.857 Y120.181 E.00946
G1 X186.143 Y176.467 E2.64045
G1 X186.143 Y179.321 E.09468
G1 X181.626 Y183.837 E.21186
G1 X185.837 Y183.837 E.13968
G1 X129.857 Y127.857 E2.62612
G1 X129.857 Y128.143 E.00946
G1 X185.837 Y72.163 E2.62612
G1 X186.143 Y72.163 E.01013
G1 X186.143 Y73.486 E.04388
G1 X182.441 Y71.349 F30000
G1 F15476.087
G1 X180.812 Y71.349 E.05401
G1 X179.414 Y69.95 E.0656
G1 X180.374 Y69.95 E.03184
G1 X178.975 Y71.349 E.0656
G1 X173.136 Y71.349 E.19369
G1 X171.738 Y69.95 E.0656
G1 X172.698 Y69.95 E.03184
G1 X171.299 Y71.349 E.0656
G1 X165.46 Y71.349 E.19369
G1 X164.062 Y69.95 E.0656
G1 X165.022 Y69.95 E.03184
G1 X163.623 Y71.349 E.0656
G1 X157.784 Y71.349 E.19369
G1 X156.386 Y69.95 E.0656
G1 X157.346 Y69.95 E.03184
G1 X155.947 Y71.349 E.0656
G1 X150.108 Y71.349 E.19369
G1 X149.151 Y70.392 E.0449
G1 X149.151 Y70.469 E.00256
G1 X149.67 Y69.95 E.02433
G1 X151.298 Y69.95 E.05401
G1 X148.744 Y71.696 F30000
G1 F15476.087
G1 X148.744 Y69.95 E.0579
G1 X73.45 Y69.95 E2.49764
G1 X73.45 Y186.05 E3.85123
G1 X148.744 Y186.05 E2.49764
G1 X148.744 Y184.244 E.05989
G1 X186.55 Y184.244 E1.25408
G1 X186.55 Y71.756 E3.73145
G1 X148.744 Y71.756 E1.25408
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X150.744 Y71.756 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/125
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
G3 Z4.2 I-1.188 J-.263 P1  F30000
G1 X129.102 Y169.602 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X78.898 Y169.602 E1.66536
G1 X78.898 Y88.398 E2.69369
G1 X129.102 Y88.398 E1.66536
G1 X129.102 Y169.542 E2.6917
G1 X128.71 Y169.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.29 Y169.21 E1.51854
G1 X79.29 Y88.79 E2.47108
G1 X128.71 Y88.79 E1.51854
G1 X128.71 Y169.15 E2.46924
M204 S10000
; WIPE_START
G1 F24000
G1 X126.71 Y169.152 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.071 J-.577 P1  F30000
G1 X73.102 Y69.602 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X186.898 Y69.602 E3.77482
G1 X186.898 Y186.398 E3.87433
G1 X73.102 Y186.398 E3.77482
G1 X73.102 Y69.662 E3.87234
G1 X72.71 Y69.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X187.29 Y69.21 E3.52072
G1 X187.29 Y186.79 E3.61291
G1 X72.71 Y186.79 E3.52072
G1 X72.71 Y69.27 E3.61106
M204 S10000
; WIPE_START
G1 F24000
G1 X74.71 Y69.269 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.013 J-.674 P1  F30000
G1 X73.986 Y70.357 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X73.857 Y70.357 E.00426
G1 X73.857 Y71.857 E.04976
G1 X89.643 Y87.643 E.74051
G1 X85.922 Y87.643 E.12342
G1 X103.207 Y70.357 E.81088
G1 X103.061 Y70.357 E.00483
G1 X120.346 Y87.643 E.81088
G1 X116.626 Y87.643 E.12342
G1 X133.911 Y70.357 E.81088
G1 X133.765 Y70.357 E.00483
G1 X186.143 Y122.735 E2.45713
G1 X186.143 Y125.589 E.09468
G1 X126.089 Y185.643 E2.81723
G1 X126.235 Y185.643 E.00483
G1 X110.95 Y170.357 E.71706
G1 X110.67 Y170.357 E.00926
G1 X95.385 Y185.643 E.71706
G1 X95.531 Y185.643 E.00483
G1 X80.246 Y170.357 E.71706
M73 P45 R28
G1 X79.967 Y170.357 E.00926
G1 X73.857 Y176.467 E.28659
G1 X73.857 Y179.321 E.09468
G1 X80.179 Y185.643 E.29656
G1 X80.033 Y185.643 E.00483
G1 X95.319 Y170.357 E.71706
G1 X95.598 Y170.357 E.00926
G1 X110.883 Y185.643 E.71706
G1 X110.737 Y185.643 E.00483
G1 X126.022 Y170.357 E.71706
G1 X126.302 Y170.357 E.00926
G1 X141.587 Y185.643 E.71706
G1 X141.441 Y185.643 E.00483
G1 X186.143 Y140.941 E2.09704
G1 X186.143 Y138.087 E.09468
G1 X118.413 Y70.357 E3.17732
G1 X118.559 Y70.357 E.00483
G1 X101.274 Y87.643 E.81088
G1 X104.995 Y87.643 E.12342
G1 X87.709 Y70.357 E.81088
G1 X87.855 Y70.357 E.00483
G1 X73.857 Y84.355 E.65666
G1 X73.857 Y87.209 E.09468
G1 X78.143 Y91.495 E.20103
M73 P46 R28
G1 X78.143 Y93.123 E.05401
G1 X78.55 Y88.05 F30000
G1 F15476.087
G1 X78.55 Y169.95 E2.7168
G1 X129.45 Y169.95 E1.68847
G1 X129.45 Y88.05 E2.7168
G1 X78.61 Y88.05 E1.68648
G1 X83.595 Y87.643 F30000
G1 F15476.087
G1 X81.967 Y87.643 E.05401
G1 X73.857 Y79.533 E.38042
G1 X73.857 Y76.679 E.09468
G1 X80.179 Y70.357 E.29656
G1 X80.033 Y70.357 E.00483
G1 X97.319 Y87.643 E.81088
G1 X93.598 Y87.643 E.12342
G1 X110.883 Y70.357 E.81088
G1 X110.737 Y70.357 E.00483
G1 X128.022 Y87.643 E.81088
G1 X124.302 Y87.643 E.12342
G1 X141.587 Y70.357 E.81088
G1 X141.441 Y70.357 E.00483
G1 X186.143 Y115.059 E2.09704
G1 X186.143 Y117.913 E.09468
G1 X118.413 Y185.643 E3.17732
G1 X118.559 Y185.643 E.00483
G1 X103.274 Y170.357 E.71706
G1 X102.994 Y170.357 E.00926
G1 X87.709 Y185.643 E.71706
G1 X87.855 Y185.643 E.00483
G1 X73.857 Y171.645 E.65666
G1 X73.857 Y168.791 E.09468
G1 X78.143 Y164.505 E.20103
G1 X78.143 Y168.254 E.12435
G1 X73.857 Y163.969 E.20103
G1 X73.857 Y161.115 E.09468
G1 X78.143 Y156.83 E.20103
G1 X78.143 Y160.578 E.12435
G1 X73.857 Y156.293 E.20103
G1 X73.857 Y153.439 E.09468
G1 X78.143 Y149.154 E.20103
G1 X78.143 Y152.902 E.12435
G1 X73.857 Y148.617 E.20103
G1 X73.857 Y145.763 E.09468
G1 X78.143 Y141.478 E.20103
G1 X78.143 Y145.226 E.12435
G1 X73.857 Y140.941 E.20103
G1 X73.857 Y138.087 E.09468
G1 X78.143 Y133.802 E.20103
G1 X78.143 Y137.55 E.12435
G1 X73.857 Y133.265 E.20103
G1 X73.857 Y130.411 E.09468
G1 X78.143 Y126.126 E.20103
G1 X78.143 Y129.874 E.12435
G1 X73.857 Y125.589 E.20103
G1 X73.857 Y122.735 E.09468
G1 X78.143 Y118.45 E.20103
G1 X78.143 Y122.198 E.12435
G1 X73.857 Y117.913 E.20103
G1 X73.857 Y115.059 E.09468
G1 X78.143 Y110.774 E.20103
G1 X78.143 Y114.522 E.12435
G1 X73.857 Y110.237 E.20103
G1 X73.857 Y107.383 E.09468
G1 X78.143 Y103.098 E.20103
G1 X78.143 Y106.846 E.12435
G1 X73.857 Y102.561 E.20103
G1 X73.857 Y99.707 E.09468
G1 X78.143 Y95.422 E.20103
G1 X78.143 Y99.17 E.12435
G1 X73.857 Y94.885 E.20103
G1 X73.857 Y92.031 E.09468
G1 X78.143 Y87.746 E.20103
G1 X78.143 Y87.643 E.00343
G1 X78.246 Y87.643 E.00343
G1 X95.531 Y70.357 E.81088
G1 X95.385 Y70.357 E.00483
G1 X112.67 Y87.643 E.81088
G1 X108.95 Y87.643 E.12342
G1 X126.235 Y70.357 E.81088
G1 X126.089 Y70.357 E.00483
G1 X186.143 Y130.411 E2.81723
G1 X186.143 Y133.265 E.09468
G1 X133.765 Y185.643 E2.45713
G1 X133.911 Y185.643 E.00483
G1 X118.626 Y170.357 E.71706
G1 X118.346 Y170.357 E.00926
G1 X103.061 Y185.643 E.71706
G1 X103.207 Y185.643 E.00483
G1 X87.922 Y170.357 E.71706
G1 X87.643 Y170.357 E.00926
G1 X73.857 Y184.143 E.64669
G1 X73.857 Y185.643 E.04976
G1 X73.986 Y185.643 E.00426
G1 X182.441 Y184.651 F30000
G1 F15476.087
G1 X180.812 Y184.651 E.05401
G1 X179.414 Y186.05 E.0656
G1 X180.374 Y186.05 E.03184
G1 X178.975 Y184.651 E.0656
G1 X173.136 Y184.651 E.19369
G1 X171.738 Y186.05 E.0656
G1 X172.698 Y186.05 E.03184
G1 X171.299 Y184.651 E.0656
G1 X165.46 Y184.651 E.19369
G1 X164.062 Y186.05 E.0656
G1 X165.022 Y186.05 E.03184
G1 X163.623 Y184.651 E.0656
G1 X157.784 Y184.651 E.19369
G1 X156.386 Y186.05 E.0656
G1 X157.346 Y186.05 E.03184
G1 X155.947 Y184.651 E.0656
G1 X150.108 Y184.651 E.19369
G1 X149.151 Y185.608 E.0449
G1 X149.151 Y185.531 E.00256
G1 X149.67 Y186.05 E.02433
G1 X151.298 Y186.05 E.05401
G1 X147.634 Y185.643 F30000
G1 F15476.087
G1 X148.337 Y185.643 E.02331
G1 X148.337 Y184.717 E.0307
G1 X129.857 Y166.237 E.86692
G1 X129.857 Y166.522 E.00946
G1 X186.143 Y110.237 E2.64045
G1 X186.143 Y107.383 E.09468
G1 X150.923 Y72.163 E1.65225
G1 X148.337 Y72.163 E.08576
G1 X148.337 Y71.283 E.02919
G1 X129.857 Y89.763 E.86692
G1 X129.857 Y89.478 E.00946
G1 X186.143 Y145.763 E2.64045
G1 X186.143 Y148.617 E.09468
G1 X150.923 Y183.837 E1.65225
G1 X155.133 Y183.837 E.13968
G1 X129.857 Y158.561 E1.18574
G1 X129.857 Y158.846 E.00946
G1 X186.143 Y102.561 E2.64045
G1 X186.143 Y99.707 E.09468
G1 X158.598 Y72.163 E1.29215
G1 X155.133 Y72.163 E.11495
G1 X129.857 Y97.439 E1.18574
G1 X129.857 Y97.154 E.00946
G1 X186.143 Y153.439 E2.64045
G1 X186.143 Y156.293 E.09468
G1 X158.598 Y183.837 E1.29215
G1 X162.809 Y183.837 E.13968
G1 X129.857 Y150.885 E1.54584
G1 X129.857 Y151.17 E.00946
G1 X186.143 Y94.885 E2.64045
G1 X186.143 Y92.031 E.09468
G1 X166.274 Y72.163 E.93205
G1 X162.809 Y72.163 E.11495
G1 X129.857 Y105.115 E1.54584
G1 X129.857 Y104.83 E.00946
G1 X186.143 Y161.115 E2.64045
G1 X186.143 Y163.969 E.09468
G1 X166.274 Y183.837 E.93205
G1 X170.485 Y183.837 E.13968
G1 X129.857 Y143.209 E1.90593
G1 X129.857 Y143.495 E.00946
G1 X186.143 Y87.209 E2.64045
G1 X186.143 Y84.355 E.09468
G1 X173.95 Y72.163 E.57196
G1 X170.485 Y72.163 E.11495
G1 X129.857 Y112.791 E1.90593
G1 X129.857 Y112.505 E.00946
G1 X186.143 Y168.791 E2.64045
G1 X186.143 Y171.645 E.09468
G1 X173.95 Y183.837 E.57196
G1 X178.161 Y183.837 E.13968
G1 X129.857 Y135.533 E2.26603
G1 X129.857 Y135.819 E.00946
G1 X186.143 Y79.533 E2.64045
G1 X186.143 Y76.679 E.09468
G1 X181.626 Y72.163 E.21186
G1 X178.161 Y72.163 E.11495
G1 X129.857 Y120.467 E2.26603
G1 X129.857 Y120.181 E.00946
G1 X186.143 Y176.467 E2.64045
G1 X186.143 Y179.321 E.09468
G1 X181.626 Y183.837 E.21186
G1 X185.837 Y183.837 E.13968
G1 X129.857 Y127.857 E2.62612
G1 X129.857 Y128.143 E.00946
G1 X185.837 Y72.163 E2.62612
G1 X186.143 Y72.163 E.01013
G1 X186.143 Y73.486 E.04388
G1 X182.441 Y71.349 F30000
G1 F15476.087
G1 X180.812 Y71.349 E.05401
G1 X179.414 Y69.95 E.0656
G1 X180.374 Y69.95 E.03184
G1 X178.975 Y71.349 E.0656
G1 X173.136 Y71.349 E.19369
G1 X171.738 Y69.95 E.0656
G1 X172.698 Y69.95 E.03184
G1 X171.299 Y71.349 E.0656
G1 X165.46 Y71.349 E.19369
G1 X164.062 Y69.95 E.0656
G1 X165.022 Y69.95 E.03184
G1 X163.623 Y71.349 E.0656
G1 X157.784 Y71.349 E.19369
G1 X156.386 Y69.95 E.0656
G1 X157.346 Y69.95 E.03184
G1 X155.947 Y71.349 E.0656
G1 X150.108 Y71.349 E.19369
G1 X149.151 Y70.392 E.0449
G1 X149.151 Y70.469 E.00256
G1 X149.67 Y69.95 E.02433
G1 X151.298 Y69.95 E.05401
G1 X148.744 Y71.696 F30000
G1 F15476.087
G1 X148.744 Y69.95 E.0579
G1 X73.45 Y69.95 E2.49764
G1 X73.45 Y186.05 E3.85123
G1 X148.744 Y186.05 E2.49764
G1 X148.744 Y184.244 E.05989
G1 X186.55 Y184.244 E1.25408
G1 X186.55 Y71.756 E3.73145
G1 X148.744 Y71.756 E1.25408
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X150.744 Y71.756 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/125
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
G3 Z4.4 I-1.188 J-.263 P1  F30000
G1 X129.102 Y169.602 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X78.898 Y169.602 E1.66536
G1 X78.898 Y88.398 E2.69369
G1 X129.102 Y88.398 E1.66536
G1 X129.102 Y169.542 E2.6917
G1 X128.71 Y169.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.29 Y169.21 E1.51854
G1 X79.29 Y88.79 E2.47108
G1 X128.71 Y88.79 E1.51854
G1 X128.71 Y169.15 E2.46924
M204 S10000
; WIPE_START
G1 F24000
G1 X126.71 Y169.152 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.071 J-.577 P1  F30000
G1 X73.102 Y69.602 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X186.898 Y69.602 E3.77482
G1 X186.898 Y186.398 E3.87433
G1 X73.102 Y186.398 E3.77482
G1 X73.102 Y69.662 E3.87234
G1 X72.71 Y69.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X187.29 Y69.21 E3.52072
G1 X187.29 Y186.79 E3.61291
G1 X72.71 Y186.79 E3.52072
G1 X72.71 Y69.27 E3.61106
M204 S10000
; WIPE_START
G1 F24000
G1 X74.71 Y69.269 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.013 J-.674 P1  F30000
G1 X73.986 Y70.357 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X73.857 Y70.357 E.00426
G1 X73.857 Y71.857 E.04976
G1 X89.643 Y87.643 E.74051
G1 X85.922 Y87.643 E.12342
G1 X103.207 Y70.357 E.81088
G1 X103.061 Y70.357 E.00483
G1 X120.346 Y87.643 E.81088
G1 X116.626 Y87.643 E.12342
G1 X133.911 Y70.357 E.81088
G1 X133.765 Y70.357 E.00483
G1 X186.143 Y122.735 E2.45713
G1 X186.143 Y125.589 E.09468
G1 X126.089 Y185.643 E2.81723
G1 X126.235 Y185.643 E.00483
G1 X110.95 Y170.357 E.71706
G1 X110.67 Y170.357 E.00926
G1 X95.385 Y185.643 E.71706
G1 X95.531 Y185.643 E.00483
G1 X80.246 Y170.357 E.71706
G1 X79.967 Y170.357 E.00926
G1 X73.857 Y176.467 E.28659
G1 X73.857 Y179.321 E.09468
G1 X80.179 Y185.643 E.29656
G1 X80.033 Y185.643 E.00483
G1 X95.319 Y170.357 E.71706
G1 X95.598 Y170.357 E.00926
G1 X110.883 Y185.643 E.71706
G1 X110.737 Y185.643 E.00483
G1 X126.022 Y170.357 E.71706
G1 X126.302 Y170.357 E.00926
G1 X141.587 Y185.643 E.71706
G1 X141.441 Y185.643 E.00483
G1 X186.143 Y140.941 E2.09704
G1 X186.143 Y138.087 E.09468
G1 X118.413 Y70.357 E3.17732
G1 X118.559 Y70.357 E.00483
G1 X101.274 Y87.643 E.81088
G1 X104.995 Y87.643 E.12342
G1 X87.709 Y70.357 E.81088
G1 X87.855 Y70.357 E.00483
G1 X73.857 Y84.355 E.65666
G1 X73.857 Y87.209 E.09468
G1 X78.143 Y91.495 E.20103
G1 X78.143 Y93.123 E.05401
G1 X78.55 Y88.05 F30000
G1 F15476.087
G1 X78.55 Y169.95 E2.7168
G1 X129.45 Y169.95 E1.68847
G1 X129.45 Y88.05 E2.7168
G1 X78.61 Y88.05 E1.68648
G1 X83.595 Y87.643 F30000
G1 F15476.087
G1 X81.967 Y87.643 E.05401
G1 X73.857 Y79.533 E.38042
G1 X73.857 Y76.679 E.09468
G1 X80.179 Y70.357 E.29656
G1 X80.033 Y70.357 E.00483
G1 X97.319 Y87.643 E.81088
G1 X93.598 Y87.643 E.12342
G1 X110.883 Y70.357 E.81088
G1 X110.737 Y70.357 E.00483
G1 X128.022 Y87.643 E.81088
G1 X124.302 Y87.643 E.12342
G1 X141.587 Y70.357 E.81088
G1 X141.441 Y70.357 E.00483
G1 X186.143 Y115.059 E2.09704
G1 X186.143 Y117.913 E.09468
G1 X118.413 Y185.643 E3.17732
G1 X118.559 Y185.643 E.00483
G1 X103.274 Y170.357 E.71706
G1 X102.994 Y170.357 E.00926
G1 X87.709 Y185.643 E.71706
G1 X87.855 Y185.643 E.00483
G1 X73.857 Y171.645 E.65666
G1 X73.857 Y168.791 E.09468
G1 X78.143 Y164.505 E.20103
G1 X78.143 Y168.254 E.12435
M73 P47 R28
G1 X73.857 Y163.969 E.20103
G1 X73.857 Y161.115 E.09468
G1 X78.143 Y156.83 E.20103
G1 X78.143 Y160.578 E.12435
G1 X73.857 Y156.293 E.20103
G1 X73.857 Y153.439 E.09468
G1 X78.143 Y149.154 E.20103
G1 X78.143 Y152.902 E.12435
G1 X73.857 Y148.617 E.20103
G1 X73.857 Y145.763 E.09468
G1 X78.143 Y141.478 E.20103
G1 X78.143 Y145.226 E.12435
G1 X73.857 Y140.941 E.20103
G1 X73.857 Y138.087 E.09468
G1 X78.143 Y133.802 E.20103
G1 X78.143 Y137.55 E.12435
G1 X73.857 Y133.265 E.20103
G1 X73.857 Y130.411 E.09468
G1 X78.143 Y126.126 E.20103
G1 X78.143 Y129.874 E.12435
G1 X73.857 Y125.589 E.20103
G1 X73.857 Y122.735 E.09468
G1 X78.143 Y118.45 E.20103
G1 X78.143 Y122.198 E.12435
G1 X73.857 Y117.913 E.20103
G1 X73.857 Y115.059 E.09468
G1 X78.143 Y110.774 E.20103
G1 X78.143 Y114.522 E.12435
G1 X73.857 Y110.237 E.20103
G1 X73.857 Y107.383 E.09468
G1 X78.143 Y103.098 E.20103
G1 X78.143 Y106.846 E.12435
G1 X73.857 Y102.561 E.20103
G1 X73.857 Y99.707 E.09468
G1 X78.143 Y95.422 E.20103
G1 X78.143 Y99.17 E.12435
G1 X73.857 Y94.885 E.20103
G1 X73.857 Y92.031 E.09468
G1 X78.143 Y87.746 E.20103
G1 X78.143 Y87.643 E.00343
G1 X78.246 Y87.643 E.00343
G1 X95.531 Y70.357 E.81088
G1 X95.385 Y70.357 E.00483
G1 X112.67 Y87.643 E.81088
G1 X108.95 Y87.643 E.12342
G1 X126.235 Y70.357 E.81088
G1 X126.089 Y70.357 E.00483
G1 X186.143 Y130.411 E2.81723
G1 X186.143 Y133.265 E.09468
G1 X133.765 Y185.643 E2.45713
G1 X133.911 Y185.643 E.00483
G1 X118.626 Y170.357 E.71706
G1 X118.346 Y170.357 E.00926
G1 X103.061 Y185.643 E.71706
G1 X103.207 Y185.643 E.00483
G1 X87.922 Y170.357 E.71706
G1 X87.643 Y170.357 E.00926
G1 X73.857 Y184.143 E.64669
G1 X73.857 Y185.643 E.04976
G1 X73.986 Y185.643 E.00426
G1 X182.441 Y184.651 F30000
G1 F15476.087
G1 X180.812 Y184.651 E.05401
G1 X179.414 Y186.05 E.0656
G1 X180.374 Y186.05 E.03184
G1 X178.975 Y184.651 E.0656
G1 X173.136 Y184.651 E.19369
G1 X171.738 Y186.05 E.0656
G1 X172.698 Y186.05 E.03184
G1 X171.299 Y184.651 E.0656
G1 X165.46 Y184.651 E.19369
G1 X164.062 Y186.05 E.0656
G1 X165.022 Y186.05 E.03184
G1 X163.623 Y184.651 E.0656
G1 X157.784 Y184.651 E.19369
G1 X156.386 Y186.05 E.0656
G1 X157.346 Y186.05 E.03184
G1 X155.947 Y184.651 E.0656
G1 X150.108 Y184.651 E.19369
G1 X149.151 Y185.608 E.0449
G1 X149.151 Y185.531 E.00256
G1 X149.67 Y186.05 E.02433
G1 X151.298 Y186.05 E.05401
G1 X147.634 Y185.643 F30000
G1 F15476.087
G1 X148.337 Y185.643 E.02331
G1 X148.337 Y184.717 E.0307
G1 X129.857 Y166.237 E.86692
G1 X129.857 Y166.522 E.00946
G1 X186.143 Y110.237 E2.64045
G1 X186.143 Y107.383 E.09468
G1 X150.923 Y72.163 E1.65225
G1 X148.337 Y72.163 E.08576
G1 X148.337 Y71.283 E.02919
G1 X129.857 Y89.763 E.86692
G1 X129.857 Y89.478 E.00946
G1 X186.143 Y145.763 E2.64045
G1 X186.143 Y148.617 E.09468
G1 X150.923 Y183.837 E1.65225
G1 X155.133 Y183.837 E.13968
G1 X129.857 Y158.561 E1.18574
G1 X129.857 Y158.846 E.00946
G1 X186.143 Y102.561 E2.64045
G1 X186.143 Y99.707 E.09468
G1 X158.598 Y72.163 E1.29215
G1 X155.133 Y72.163 E.11495
G1 X129.857 Y97.439 E1.18574
G1 X129.857 Y97.154 E.00946
G1 X186.143 Y153.439 E2.64045
G1 X186.143 Y156.293 E.09468
G1 X158.598 Y183.837 E1.29215
G1 X162.809 Y183.837 E.13968
G1 X129.857 Y150.885 E1.54584
G1 X129.857 Y151.17 E.00946
G1 X186.143 Y94.885 E2.64045
G1 X186.143 Y92.031 E.09468
G1 X166.274 Y72.163 E.93205
G1 X162.809 Y72.163 E.11495
G1 X129.857 Y105.115 E1.54584
G1 X129.857 Y104.83 E.00946
G1 X186.143 Y161.115 E2.64045
G1 X186.143 Y163.969 E.09468
G1 X166.274 Y183.837 E.93205
G1 X170.485 Y183.837 E.13968
G1 X129.857 Y143.209 E1.90593
G1 X129.857 Y143.495 E.00946
G1 X186.143 Y87.209 E2.64045
G1 X186.143 Y84.355 E.09468
G1 X173.95 Y72.163 E.57196
G1 X170.485 Y72.163 E.11495
G1 X129.857 Y112.791 E1.90593
G1 X129.857 Y112.505 E.00946
G1 X186.143 Y168.791 E2.64045
G1 X186.143 Y171.645 E.09468
G1 X173.95 Y183.837 E.57196
G1 X178.161 Y183.837 E.13968
G1 X129.857 Y135.533 E2.26603
G1 X129.857 Y135.819 E.00946
G1 X186.143 Y79.533 E2.64045
G1 X186.143 Y76.679 E.09468
G1 X181.626 Y72.163 E.21186
G1 X178.161 Y72.163 E.11495
G1 X129.857 Y120.467 E2.26603
G1 X129.857 Y120.181 E.00946
G1 X186.143 Y176.467 E2.64045
G1 X186.143 Y179.321 E.09468
G1 X181.626 Y183.837 E.21186
G1 X185.837 Y183.837 E.13968
G1 X129.857 Y127.857 E2.62612
G1 X129.857 Y128.143 E.00946
G1 X185.837 Y72.163 E2.62612
G1 X186.143 Y72.163 E.01013
G1 X186.143 Y73.486 E.04388
G1 X182.441 Y71.349 F30000
G1 F15476.087
G1 X180.812 Y71.349 E.05401
G1 X179.414 Y69.95 E.0656
G1 X180.374 Y69.95 E.03184
G1 X178.975 Y71.349 E.0656
G1 X173.136 Y71.349 E.19369
G1 X171.738 Y69.95 E.0656
G1 X172.698 Y69.95 E.03184
G1 X171.299 Y71.349 E.0656
G1 X165.46 Y71.349 E.19369
G1 X164.062 Y69.95 E.0656
G1 X165.022 Y69.95 E.03184
G1 X163.623 Y71.349 E.0656
G1 X157.784 Y71.349 E.19369
G1 X156.386 Y69.95 E.0656
G1 X157.346 Y69.95 E.03184
G1 X155.947 Y71.349 E.0656
G1 X150.108 Y71.349 E.19369
G1 X149.151 Y70.392 E.0449
G1 X149.151 Y70.469 E.00256
G1 X149.67 Y69.95 E.02433
G1 X151.298 Y69.95 E.05401
G1 X148.744 Y71.696 F30000
G1 F15476.087
G1 X148.744 Y69.95 E.0579
G1 X73.45 Y69.95 E2.49764
G1 X73.45 Y186.05 E3.85123
G1 X148.744 Y186.05 E2.49764
G1 X148.744 Y184.244 E.05989
G1 X186.55 Y184.244 E1.25408
G1 X186.55 Y71.756 E3.73145
G1 X148.744 Y71.756 E1.25408
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X150.744 Y71.756 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/125
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
G3 Z4.6 I-1.188 J-.263 P1  F30000
G1 X129.102 Y169.602 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X78.898 Y169.602 E1.66536
G1 X78.898 Y88.398 E2.69369
G1 X129.102 Y88.398 E1.66536
G1 X129.102 Y169.542 E2.6917
G1 X128.71 Y169.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.29 Y169.21 E1.51854
G1 X79.29 Y88.79 E2.47108
G1 X128.71 Y88.79 E1.51854
G1 X128.71 Y169.15 E2.46924
M204 S10000
; WIPE_START
G1 F24000
G1 X126.71 Y169.152 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.071 J-.577 P1  F30000
G1 X73.102 Y69.602 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X186.898 Y69.602 E3.77482
G1 X186.898 Y186.398 E3.87433
G1 X73.102 Y186.398 E3.77482
G1 X73.102 Y69.662 E3.87234
G1 X72.71 Y69.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X187.29 Y69.21 E3.52072
G1 X187.29 Y186.79 E3.61291
G1 X72.71 Y186.79 E3.52072
G1 X72.71 Y69.27 E3.61106
M204 S10000
; WIPE_START
G1 F24000
G1 X74.71 Y69.269 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.013 J-.674 P1  F30000
G1 X73.986 Y70.357 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X73.857 Y70.357 E.00426
G1 X73.857 Y71.857 E.04976
G1 X89.643 Y87.643 E.74051
G1 X85.922 Y87.643 E.12342
G1 X103.207 Y70.357 E.81088
G1 X103.061 Y70.357 E.00483
G1 X120.346 Y87.643 E.81088
G1 X116.626 Y87.643 E.12342
G1 X133.911 Y70.357 E.81088
G1 X133.765 Y70.357 E.00483
G1 X186.143 Y122.735 E2.45713
G1 X186.143 Y125.589 E.09468
G1 X126.089 Y185.643 E2.81723
G1 X126.235 Y185.643 E.00483
G1 X110.95 Y170.357 E.71706
G1 X110.67 Y170.357 E.00926
G1 X95.385 Y185.643 E.71706
G1 X95.531 Y185.643 E.00483
G1 X80.246 Y170.357 E.71706
G1 X79.967 Y170.357 E.00926
G1 X73.857 Y176.467 E.28659
G1 X73.857 Y179.321 E.09468
G1 X80.179 Y185.643 E.29656
G1 X80.033 Y185.643 E.00483
G1 X95.319 Y170.357 E.71706
M73 P47 R27
G1 X95.598 Y170.357 E.00926
G1 X110.883 Y185.643 E.71706
G1 X110.737 Y185.643 E.00483
G1 X126.022 Y170.357 E.71706
G1 X126.302 Y170.357 E.00926
G1 X141.587 Y185.643 E.71706
G1 X141.441 Y185.643 E.00483
G1 X186.143 Y140.941 E2.09704
G1 X186.143 Y138.087 E.09468
G1 X118.413 Y70.357 E3.17732
G1 X118.559 Y70.357 E.00483
G1 X101.274 Y87.643 E.81088
G1 X104.995 Y87.643 E.12342
G1 X87.709 Y70.357 E.81088
G1 X87.855 Y70.357 E.00483
G1 X73.857 Y84.355 E.65666
G1 X73.857 Y87.209 E.09468
G1 X78.143 Y91.495 E.20103
G1 X78.143 Y93.123 E.05401
G1 X78.55 Y88.05 F30000
G1 F15476.087
G1 X78.55 Y169.95 E2.7168
G1 X129.45 Y169.95 E1.68847
G1 X129.45 Y88.05 E2.7168
G1 X78.61 Y88.05 E1.68648
G1 X83.595 Y87.643 F30000
G1 F15476.087
G1 X81.967 Y87.643 E.05401
G1 X73.857 Y79.533 E.38042
G1 X73.857 Y76.679 E.09468
G1 X80.179 Y70.357 E.29656
G1 X80.033 Y70.357 E.00483
G1 X97.319 Y87.643 E.81088
G1 X93.598 Y87.643 E.12342
G1 X110.883 Y70.357 E.81088
G1 X110.737 Y70.357 E.00483
G1 X128.022 Y87.643 E.81088
G1 X124.302 Y87.643 E.12342
G1 X141.587 Y70.357 E.81088
G1 X141.441 Y70.357 E.00483
G1 X186.143 Y115.059 E2.09704
G1 X186.143 Y117.913 E.09468
G1 X118.413 Y185.643 E3.17732
G1 X118.559 Y185.643 E.00483
G1 X103.274 Y170.357 E.71706
G1 X102.994 Y170.357 E.00926
G1 X87.709 Y185.643 E.71706
G1 X87.855 Y185.643 E.00483
G1 X73.857 Y171.645 E.65666
G1 X73.857 Y168.791 E.09468
G1 X78.143 Y164.505 E.20103
G1 X78.143 Y168.254 E.12435
G1 X73.857 Y163.969 E.20103
G1 X73.857 Y161.115 E.09468
G1 X78.143 Y156.83 E.20103
G1 X78.143 Y160.578 E.12435
G1 X73.857 Y156.293 E.20103
G1 X73.857 Y153.439 E.09468
G1 X78.143 Y149.154 E.20103
G1 X78.143 Y152.902 E.12435
G1 X73.857 Y148.617 E.20103
G1 X73.857 Y145.763 E.09468
G1 X78.143 Y141.478 E.20103
G1 X78.143 Y145.226 E.12435
G1 X73.857 Y140.941 E.20103
G1 X73.857 Y138.087 E.09468
G1 X78.143 Y133.802 E.20103
G1 X78.143 Y137.55 E.12435
G1 X73.857 Y133.265 E.20103
G1 X73.857 Y130.411 E.09468
G1 X78.143 Y126.126 E.20103
G1 X78.143 Y129.874 E.12435
G1 X73.857 Y125.589 E.20103
G1 X73.857 Y122.735 E.09468
G1 X78.143 Y118.45 E.20103
G1 X78.143 Y122.198 E.12435
G1 X73.857 Y117.913 E.20103
G1 X73.857 Y115.059 E.09468
M73 P48 R27
G1 X78.143 Y110.774 E.20103
G1 X78.143 Y114.522 E.12435
G1 X73.857 Y110.237 E.20103
G1 X73.857 Y107.383 E.09468
G1 X78.143 Y103.098 E.20103
G1 X78.143 Y106.846 E.12435
G1 X73.857 Y102.561 E.20103
G1 X73.857 Y99.707 E.09468
G1 X78.143 Y95.422 E.20103
G1 X78.143 Y99.17 E.12435
G1 X73.857 Y94.885 E.20103
G1 X73.857 Y92.031 E.09468
G1 X78.143 Y87.746 E.20103
G1 X78.143 Y87.643 E.00343
G1 X78.246 Y87.643 E.00343
G1 X95.531 Y70.357 E.81088
G1 X95.385 Y70.357 E.00483
G1 X112.67 Y87.643 E.81088
G1 X108.95 Y87.643 E.12342
G1 X126.235 Y70.357 E.81088
G1 X126.089 Y70.357 E.00483
G1 X186.143 Y130.411 E2.81723
G1 X186.143 Y133.265 E.09468
G1 X133.765 Y185.643 E2.45713
G1 X133.911 Y185.643 E.00483
G1 X118.626 Y170.357 E.71706
G1 X118.346 Y170.357 E.00926
G1 X103.061 Y185.643 E.71706
G1 X103.207 Y185.643 E.00483
G1 X87.922 Y170.357 E.71706
G1 X87.643 Y170.357 E.00926
G1 X73.857 Y184.143 E.64669
G1 X73.857 Y185.643 E.04976
G1 X73.986 Y185.643 E.00426
G1 X182.441 Y184.651 F30000
G1 F15476.087
G1 X180.812 Y184.651 E.05401
G1 X179.414 Y186.05 E.0656
G1 X180.374 Y186.05 E.03184
G1 X178.975 Y184.651 E.0656
G1 X173.136 Y184.651 E.19369
G1 X171.738 Y186.05 E.0656
G1 X172.698 Y186.05 E.03184
G1 X171.299 Y184.651 E.0656
G1 X165.46 Y184.651 E.19369
G1 X164.062 Y186.05 E.0656
G1 X165.022 Y186.05 E.03184
G1 X163.623 Y184.651 E.0656
G1 X157.784 Y184.651 E.19369
G1 X156.386 Y186.05 E.0656
G1 X157.346 Y186.05 E.03184
G1 X155.947 Y184.651 E.0656
G1 X150.108 Y184.651 E.19369
G1 X149.151 Y185.608 E.0449
G1 X149.151 Y185.531 E.00256
G1 X149.67 Y186.05 E.02433
G1 X151.298 Y186.05 E.05401
G1 X147.634 Y185.643 F30000
G1 F15476.087
G1 X148.337 Y185.643 E.02331
G1 X148.337 Y184.717 E.0307
G1 X129.857 Y166.237 E.86692
G1 X129.857 Y166.522 E.00946
G1 X186.143 Y110.237 E2.64045
G1 X186.143 Y107.383 E.09468
G1 X150.923 Y72.163 E1.65225
G1 X148.337 Y72.163 E.08576
G1 X148.337 Y71.283 E.02919
G1 X129.857 Y89.763 E.86692
G1 X129.857 Y89.478 E.00946
G1 X186.143 Y145.763 E2.64045
G1 X186.143 Y148.617 E.09468
G1 X150.923 Y183.837 E1.65225
G1 X155.133 Y183.837 E.13968
G1 X129.857 Y158.561 E1.18574
G1 X129.857 Y158.846 E.00946
G1 X186.143 Y102.561 E2.64045
G1 X186.143 Y99.707 E.09468
G1 X158.598 Y72.163 E1.29215
G1 X155.133 Y72.163 E.11495
G1 X129.857 Y97.439 E1.18574
G1 X129.857 Y97.154 E.00946
G1 X186.143 Y153.439 E2.64045
G1 X186.143 Y156.293 E.09468
G1 X158.598 Y183.837 E1.29215
G1 X162.809 Y183.837 E.13968
G1 X129.857 Y150.885 E1.54584
G1 X129.857 Y151.17 E.00946
G1 X186.143 Y94.885 E2.64045
G1 X186.143 Y92.031 E.09468
G1 X166.274 Y72.163 E.93205
G1 X162.809 Y72.163 E.11495
G1 X129.857 Y105.115 E1.54584
G1 X129.857 Y104.83 E.00946
G1 X186.143 Y161.115 E2.64045
G1 X186.143 Y163.969 E.09468
G1 X166.274 Y183.837 E.93205
G1 X170.485 Y183.837 E.13968
G1 X129.857 Y143.209 E1.90593
G1 X129.857 Y143.495 E.00946
G1 X186.143 Y87.209 E2.64045
G1 X186.143 Y84.355 E.09468
G1 X173.95 Y72.163 E.57196
G1 X170.485 Y72.163 E.11495
G1 X129.857 Y112.791 E1.90593
G1 X129.857 Y112.505 E.00946
G1 X186.143 Y168.791 E2.64045
G1 X186.143 Y171.645 E.09468
G1 X173.95 Y183.837 E.57196
G1 X178.161 Y183.837 E.13968
G1 X129.857 Y135.533 E2.26603
G1 X129.857 Y135.819 E.00946
G1 X186.143 Y79.533 E2.64045
G1 X186.143 Y76.679 E.09468
G1 X181.626 Y72.163 E.21186
G1 X178.161 Y72.163 E.11495
G1 X129.857 Y120.467 E2.26603
G1 X129.857 Y120.181 E.00946
G1 X186.143 Y176.467 E2.64045
G1 X186.143 Y179.321 E.09468
G1 X181.626 Y183.837 E.21186
G1 X185.837 Y183.837 E.13968
G1 X129.857 Y127.857 E2.62612
G1 X129.857 Y128.143 E.00946
G1 X185.837 Y72.163 E2.62612
G1 X186.143 Y72.163 E.01013
G1 X186.143 Y73.486 E.04388
G1 X182.441 Y71.349 F30000
G1 F15476.087
G1 X180.812 Y71.349 E.05401
G1 X179.414 Y69.95 E.0656
G1 X180.374 Y69.95 E.03184
G1 X178.975 Y71.349 E.0656
G1 X173.136 Y71.349 E.19369
G1 X171.738 Y69.95 E.0656
G1 X172.698 Y69.95 E.03184
G1 X171.299 Y71.349 E.0656
G1 X165.46 Y71.349 E.19369
G1 X164.062 Y69.95 E.0656
G1 X165.022 Y69.95 E.03184
G1 X163.623 Y71.349 E.0656
G1 X157.784 Y71.349 E.19369
G1 X156.386 Y69.95 E.0656
G1 X157.346 Y69.95 E.03184
G1 X155.947 Y71.349 E.0656
G1 X150.108 Y71.349 E.19369
G1 X149.151 Y70.392 E.0449
G1 X149.151 Y70.469 E.00256
G1 X149.67 Y69.95 E.02433
G1 X151.298 Y69.95 E.05401
G1 X148.744 Y71.696 F30000
G1 F15476.087
G1 X148.744 Y69.95 E.0579
G1 X73.45 Y69.95 E2.49764
G1 X73.45 Y186.05 E3.85123
G1 X148.744 Y186.05 E2.49764
G1 X148.744 Y184.244 E.05989
G1 X186.55 Y184.244 E1.25408
G1 X186.55 Y71.756 E3.73145
G1 X148.744 Y71.756 E1.25408
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X150.744 Y71.756 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/125
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
G3 Z4.8 I-1.188 J-.263 P1  F30000
G1 X129.102 Y169.602 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X78.898 Y169.602 E1.66536
G1 X78.898 Y88.398 E2.69369
G1 X129.102 Y88.398 E1.66536
G1 X129.102 Y169.542 E2.6917
G1 X128.71 Y169.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.29 Y169.21 E1.51854
G1 X79.29 Y88.79 E2.47108
G1 X128.71 Y88.79 E1.51854
G1 X128.71 Y169.15 E2.46924
M204 S10000
; WIPE_START
G1 F24000
G1 X126.71 Y169.152 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.071 J-.577 P1  F30000
G1 X73.102 Y69.602 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X186.898 Y69.602 E3.77482
G1 X186.898 Y186.398 E3.87433
G1 X73.102 Y186.398 E3.77482
G1 X73.102 Y69.662 E3.87234
G1 X72.71 Y69.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X187.29 Y69.21 E3.52072
G1 X187.29 Y186.79 E3.61291
G1 X72.71 Y186.79 E3.52072
G1 X72.71 Y69.27 E3.61106
M204 S10000
; WIPE_START
G1 F24000
G1 X74.71 Y69.269 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.012 J1.217 P1  F30000
G1 X148.925 Y69.973 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.401575
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X73.472 Y69.973 E3.8937
G1 X73.472 Y70.424 E.0233
G1 X148.723 Y70.424 E3.88325
G1 X148.723 Y70.876 E.0233
G1 X73.472 Y70.876 E3.88325
G1 X73.472 Y71.327 E.0233
G1 X148.723 Y71.327 E3.88325
G1 X148.723 Y71.777 E.02321
G1 X186.528 Y71.777 E1.95091
G1 X73.472 Y71.779 E5.83416
G1 X73.472 Y72.231 E.0233
G1 X186.528 Y72.231 E5.83416
G1 X186.528 Y72.682 E.0233
G1 X73.472 Y72.682 E5.83416
G1 X73.472 Y73.134 E.0233
G1 X186.528 Y73.134 E5.83416
G1 X186.528 Y73.585 E.0233
G1 X73.472 Y73.585 E5.83416
G1 X73.472 Y74.037 E.0233
G1 X186.528 Y74.037 E5.83416
G1 X186.528 Y74.488 E.0233
G1 X73.472 Y74.488 E5.83416
G1 X73.472 Y74.94 E.0233
G1 X186.528 Y74.94 E5.83416
G1 X186.528 Y75.392 E.0233
G1 X73.472 Y75.392 E5.83416
G1 X73.472 Y75.843 E.0233
G1 X186.528 Y75.843 E5.83416
G1 X186.528 Y76.295 E.0233
G1 X73.472 Y76.295 E5.83416
G1 X73.472 Y76.746 E.0233
G1 X186.528 Y76.746 E5.83416
G1 X186.528 Y77.198 E.0233
G1 X73.472 Y77.198 E5.83416
G1 X73.472 Y77.649 E.0233
G1 X186.528 Y77.649 E5.83416
G1 X186.528 Y78.101 E.0233
G1 X73.472 Y78.101 E5.83416
G1 X73.472 Y78.553 E.0233
G1 X186.528 Y78.553 E5.83416
G1 X186.528 Y79.004 E.0233
G1 X73.472 Y79.004 E5.83416
G1 X73.472 Y79.456 E.0233
G1 X186.528 Y79.456 E5.83416
G1 X186.528 Y79.907 E.0233
G1 X73.472 Y79.907 E5.83416
G1 X73.472 Y80.359 E.0233
G1 X186.528 Y80.359 E5.83416
G1 X186.528 Y80.81 E.0233
G1 X73.472 Y80.81 E5.83416
G1 X73.472 Y81.262 E.0233
G1 X186.528 Y81.262 E5.83416
G1 X186.528 Y81.714 E.0233
G1 X73.472 Y81.714 E5.83416
G1 X73.472 Y82.165 E.0233
G1 X186.528 Y82.165 E5.83416
G1 X186.528 Y82.617 E.0233
G1 X73.472 Y82.617 E5.83416
G1 X73.472 Y83.068 E.0233
G1 X186.528 Y83.068 E5.83416
G1 X186.528 Y83.52 E.0233
G1 X73.472 Y83.52 E5.83416
M73 P49 R27
G1 X73.472 Y83.971 E.0233
G1 X186.528 Y83.971 E5.83416
G1 X186.528 Y84.423 E.0233
G1 X73.472 Y84.423 E5.83416
G1 X73.472 Y84.875 E.0233
G1 X186.528 Y84.875 E5.83416
G1 X186.528 Y85.326 E.0233
G1 X73.472 Y85.326 E5.83416
G1 X73.472 Y85.778 E.0233
G1 X186.528 Y85.778 E5.83416
G1 X186.528 Y86.229 E.0233
G1 X73.472 Y86.229 E5.83416
G1 X73.472 Y86.681 E.0233
G1 X186.528 Y86.681 E5.83416
M73 P49 R26
G1 X186.528 Y87.132 E.0233
G1 X73.472 Y87.132 E5.83416
G1 X73.472 Y87.584 E.0233
G1 X186.528 Y87.584 E5.83416
G1 X186.528 Y88.036 E.0233
G1 X73.472 Y88.036 E5.83416
G1 X73.472 Y88.487 E.0233
G1 X78.528 Y88.487 E.26093
G1 X78.528 Y88.939 E.0233
G1 X73.472 Y88.939 E.26093
G1 X73.472 Y89.39 E.0233
G1 X78.528 Y89.39 E.26093
G1 X78.528 Y89.842 E.0233
G1 X73.472 Y89.842 E.26093
M73 P50 R26
G1 X73.472 Y90.294 E.0233
G1 X78.528 Y90.294 E.26093
G1 X78.528 Y90.745 E.0233
G1 X73.472 Y90.745 E.26093
G1 X73.472 Y91.197 E.0233
G1 X78.528 Y91.197 E.26093
G1 X78.528 Y91.648 E.0233
G1 X73.472 Y91.648 E.26093
G1 X73.472 Y92.1 E.0233
G1 X78.528 Y92.1 E.26093
G1 X78.528 Y92.551 E.0233
G1 X73.472 Y92.551 E.26093
G1 X73.472 Y93.003 E.0233
G1 X78.528 Y93.003 E.26093
G1 X78.528 Y93.455 E.0233
G1 X73.472 Y93.455 E.26093
G1 X73.472 Y93.906 E.0233
G1 X78.528 Y93.906 E.26093
G1 X78.528 Y94.358 E.0233
G1 X73.472 Y94.358 E.26093
G1 X73.472 Y94.809 E.0233
G1 X78.528 Y94.809 E.26093
G1 X78.528 Y95.261 E.0233
G1 X73.472 Y95.261 E.26093
G1 X73.472 Y95.712 E.0233
G1 X78.528 Y95.712 E.26093
G1 X78.528 Y96.164 E.0233
G1 X73.472 Y96.164 E.26093
M73 P51 R26
G1 X73.472 Y96.616 E.0233
G1 X78.528 Y96.616 E.26093
G1 X78.528 Y97.067 E.0233
G1 X73.472 Y97.067 E.26093
G1 X73.472 Y97.519 E.0233
G1 X78.528 Y97.519 E.26093
G1 X78.528 Y97.97 E.0233
G1 X73.472 Y97.97 E.26093
G1 X73.472 Y98.422 E.0233
G1 X78.528 Y98.422 E.26093
G1 X78.528 Y98.873 E.0233
G1 X73.472 Y98.873 E.26093
M73 P51 R25
G1 X73.472 Y99.325 E.0233
G1 X78.528 Y99.325 E.26093
G1 X78.528 Y99.777 E.0233
G1 X73.472 Y99.777 E.26093
G1 X73.472 Y100.228 E.0233
G1 X78.528 Y100.228 E.26093
G1 X78.528 Y100.68 E.0233
G1 X73.472 Y100.68 E.26093
G1 X73.472 Y101.131 E.0233
G1 X78.528 Y101.131 E.26093
G1 X78.528 Y101.583 E.0233
G1 X73.472 Y101.583 E.26093
G1 X73.472 Y102.034 E.0233
G1 X78.528 Y102.034 E.26093
G1 X78.528 Y102.486 E.0233
G1 X73.472 Y102.486 E.26093
G1 X73.472 Y102.938 E.0233
G1 X78.528 Y102.938 E.26093
G1 X78.528 Y103.389 E.0233
G1 X73.472 Y103.389 E.26093
G1 X73.472 Y103.841 E.0233
G1 X78.528 Y103.841 E.26093
G1 X78.528 Y104.292 E.0233
G1 X73.472 Y104.292 E.26093
G1 X73.472 Y104.744 E.0233
G1 X78.528 Y104.744 E.26093
G1 X78.528 Y105.195 E.0233
G1 X73.472 Y105.195 E.26093
G1 X73.472 Y105.647 E.0233
G1 X78.528 Y105.647 E.26093
G1 X78.528 Y106.099 E.0233
G1 X73.472 Y106.099 E.26093
G1 X73.472 Y106.55 E.0233
G1 X78.528 Y106.55 E.26093
G1 X78.528 Y107.002 E.0233
G1 X73.472 Y107.002 E.26093
G1 X73.472 Y107.453 E.0233
G1 X78.528 Y107.453 E.26093
G1 X78.528 Y107.905 E.0233
G1 X73.472 Y107.905 E.26093
G1 X73.472 Y108.357 E.0233
G1 X78.528 Y108.357 E.26093
G1 X78.528 Y108.808 E.0233
G1 X73.472 Y108.808 E.26093
G1 X73.472 Y109.26 E.0233
G1 X78.528 Y109.26 E.26093
G1 X78.528 Y109.711 E.0233
G1 X73.472 Y109.711 E.26093
G1 X73.472 Y110.163 E.0233
G1 X78.528 Y110.163 E.26093
G1 X78.528 Y110.614 E.0233
G1 X73.472 Y110.614 E.26093
G1 X73.472 Y111.066 E.0233
G1 X78.528 Y111.066 E.26093
G1 X78.528 Y111.518 E.0233
G1 X73.472 Y111.518 E.26093
G1 X73.472 Y111.969 E.0233
G1 X78.528 Y111.969 E.26093
G1 X78.528 Y112.421 E.0233
G1 X73.472 Y112.421 E.26093
G1 X73.472 Y112.872 E.0233
G1 X78.528 Y112.872 E.26093
G1 X78.528 Y113.324 E.0233
G1 X73.472 Y113.324 E.26093
G1 X73.472 Y113.775 E.0233
G1 X78.528 Y113.775 E.26093
G1 X78.528 Y114.227 E.0233
G1 X73.472 Y114.227 E.26093
G1 X73.472 Y114.679 E.0233
G1 X78.528 Y114.679 E.26093
G1 X78.528 Y115.13 E.0233
G1 X73.472 Y115.13 E.26093
G1 X73.472 Y115.582 E.0233
G1 X78.528 Y115.582 E.26093
G1 X78.528 Y116.033 E.0233
G1 X73.472 Y116.033 E.26093
G1 X73.472 Y116.485 E.0233
G1 X78.528 Y116.485 E.26093
G1 X78.528 Y116.936 E.0233
G1 X73.472 Y116.936 E.26093
G1 X73.472 Y117.388 E.0233
G1 X78.528 Y117.388 E.26093
G1 X78.528 Y117.84 E.0233
G1 X73.472 Y117.84 E.26093
G1 X73.472 Y118.291 E.0233
G1 X78.528 Y118.291 E.26093
G1 X78.528 Y118.743 E.0233
G1 X73.472 Y118.743 E.26093
G1 X73.472 Y119.194 E.0233
G1 X78.528 Y119.194 E.26093
G1 X78.528 Y119.646 E.0233
G1 X73.472 Y119.646 E.26093
G1 X73.472 Y120.097 E.0233
G1 X78.528 Y120.097 E.26093
G1 X78.528 Y120.549 E.0233
G1 X73.472 Y120.549 E.26093
G1 X73.472 Y121.001 E.0233
G1 X78.528 Y121.001 E.26093
G1 X78.528 Y121.452 E.0233
G1 X73.472 Y121.452 E.26093
G1 X73.472 Y121.904 E.0233
G1 X78.528 Y121.904 E.26093
G1 X78.528 Y122.355 E.0233
G1 X73.472 Y122.355 E.26093
G1 X73.472 Y122.807 E.0233
G1 X78.528 Y122.807 E.26093
G1 X78.528 Y123.258 E.0233
G1 X73.472 Y123.258 E.26093
G1 X73.472 Y123.71 E.0233
G1 X78.528 Y123.71 E.26093
G1 X78.528 Y124.162 E.0233
G1 X73.472 Y124.162 E.26093
G1 X73.472 Y124.613 E.0233
G1 X78.528 Y124.613 E.26093
G1 X78.528 Y125.065 E.0233
G1 X73.472 Y125.065 E.26093
G1 X73.472 Y125.516 E.0233
G1 X78.528 Y125.516 E.26093
G1 X78.528 Y125.968 E.0233
G1 X73.472 Y125.968 E.26093
G1 X73.472 Y126.42 E.0233
G1 X78.528 Y126.42 E.26093
G1 X78.528 Y126.871 E.0233
G1 X73.472 Y126.871 E.26093
G1 X73.472 Y127.323 E.0233
G1 X78.528 Y127.323 E.26093
G1 X78.528 Y127.774 E.0233
G1 X73.472 Y127.774 E.26093
G1 X73.472 Y128.226 E.0233
G1 X78.528 Y128.226 E.26093
G1 X78.528 Y128.677 E.0233
G1 X73.472 Y128.677 E.26093
G1 X73.472 Y129.129 E.0233
G1 X78.528 Y129.129 E.26093
G1 X78.528 Y129.581 E.0233
G1 X73.472 Y129.581 E.26093
G1 X73.472 Y130.032 E.0233
G1 X78.528 Y130.032 E.26093
G1 X78.528 Y130.484 E.0233
G1 X73.472 Y130.484 E.26093
G1 X73.472 Y130.935 E.0233
G1 X78.528 Y130.935 E.26093
G1 X78.528 Y131.387 E.0233
G1 X73.472 Y131.387 E.26093
G1 X73.472 Y131.838 E.0233
G1 X78.528 Y131.838 E.26093
G1 X78.528 Y132.29 E.0233
G1 X73.472 Y132.29 E.26093
G1 X73.472 Y132.742 E.0233
G1 X78.528 Y132.742 E.26093
G1 X78.528 Y133.193 E.0233
G1 X73.472 Y133.193 E.26093
G1 X73.472 Y133.645 E.0233
G1 X78.528 Y133.645 E.26093
G1 X78.528 Y134.096 E.0233
G1 X73.472 Y134.096 E.26093
G1 X73.472 Y134.548 E.0233
G1 X78.528 Y134.548 E.26093
G1 X78.528 Y134.999 E.0233
G1 X73.472 Y134.999 E.26093
G1 X73.472 Y135.451 E.0233
G1 X78.528 Y135.451 E.26093
G1 X78.528 Y135.903 E.0233
G1 X73.472 Y135.903 E.26093
G1 X73.472 Y136.354 E.0233
G1 X78.528 Y136.354 E.26093
G1 X78.528 Y136.806 E.0233
G1 X73.472 Y136.806 E.26093
G1 X73.472 Y137.257 E.0233
G1 X78.528 Y137.257 E.26093
G1 X78.528 Y137.709 E.0233
G1 X73.472 Y137.709 E.26093
G1 X73.472 Y138.16 E.0233
G1 X78.528 Y138.16 E.26093
G1 X78.528 Y138.612 E.0233
G1 X73.472 Y138.612 E.26093
G1 X73.472 Y139.064 E.0233
G1 X78.528 Y139.064 E.26093
G1 X78.528 Y139.515 E.0233
G1 X73.472 Y139.515 E.26093
G1 X73.472 Y139.967 E.0233
G1 X78.528 Y139.967 E.26093
G1 X78.528 Y140.418 E.0233
G1 X73.472 Y140.418 E.26093
G1 X73.472 Y140.87 E.0233
G1 X78.528 Y140.87 E.26093
G1 X78.528 Y141.321 E.0233
G1 X73.472 Y141.321 E.26093
G1 X73.472 Y141.773 E.0233
G1 X78.528 Y141.773 E.26093
G1 X78.528 Y142.225 E.0233
G1 X73.472 Y142.225 E.26093
G1 X73.472 Y142.676 E.0233
G1 X78.528 Y142.676 E.26093
G1 X78.528 Y143.128 E.0233
G1 X73.472 Y143.128 E.26093
G1 X73.472 Y143.579 E.0233
G1 X78.528 Y143.579 E.26093
G1 X78.528 Y144.031 E.0233
G1 X73.472 Y144.031 E.26093
G1 X73.472 Y144.483 E.0233
G1 X78.528 Y144.483 E.26093
G1 X78.528 Y144.934 E.0233
G1 X73.472 Y144.934 E.26093
G1 X73.472 Y145.386 E.0233
G1 X78.528 Y145.386 E.26093
G1 X78.528 Y145.837 E.0233
G1 X73.472 Y145.837 E.26093
G1 X73.472 Y146.289 E.0233
G1 X78.528 Y146.289 E.26093
G1 X78.528 Y146.74 E.0233
G1 X73.472 Y146.74 E.26093
G1 X73.472 Y147.192 E.0233
G1 X78.528 Y147.192 E.26093
G1 X78.528 Y147.644 E.0233
G1 X73.472 Y147.644 E.26093
G1 X73.472 Y148.095 E.0233
G1 X78.528 Y148.095 E.26093
M73 P52 R25
G1 X78.528 Y148.547 E.0233
G1 X73.472 Y148.547 E.26093
G1 X73.472 Y148.998 E.0233
G1 X78.528 Y148.998 E.26093
G1 X78.528 Y149.45 E.0233
G1 X73.472 Y149.45 E.26093
G1 X73.472 Y149.901 E.0233
G1 X78.528 Y149.901 E.26093
G1 X78.528 Y150.353 E.0233
G1 X73.472 Y150.353 E.26093
G1 X73.472 Y150.805 E.0233
G1 X78.528 Y150.805 E.26093
G1 X78.528 Y151.256 E.0233
G1 X73.472 Y151.256 E.26093
G1 X73.472 Y151.708 E.0233
G1 X78.528 Y151.708 E.26093
G1 X78.528 Y152.159 E.0233
G1 X73.472 Y152.159 E.26093
G1 X73.472 Y152.611 E.0233
G1 X78.528 Y152.611 E.26093
G1 X78.528 Y153.062 E.0233
G1 X73.472 Y153.062 E.26093
G1 X73.472 Y153.514 E.0233
G1 X78.528 Y153.514 E.26093
G1 X78.528 Y153.966 E.0233
G1 X73.472 Y153.966 E.26093
G1 X73.472 Y154.417 E.0233
G1 X78.528 Y154.417 E.26093
G1 X78.528 Y154.869 E.0233
G1 X73.472 Y154.869 E.26093
G1 X73.472 Y155.32 E.0233
G1 X78.528 Y155.32 E.26093
G1 X78.528 Y155.772 E.0233
G1 X73.472 Y155.772 E.26093
G1 X73.472 Y156.223 E.0233
G1 X78.528 Y156.223 E.26093
G1 X78.528 Y156.675 E.0233
G1 X73.472 Y156.675 E.26093
G1 X73.472 Y157.127 E.0233
G1 X78.528 Y157.127 E.26093
G1 X78.528 Y157.578 E.0233
G1 X73.472 Y157.578 E.26093
G1 X73.472 Y158.03 E.0233
G1 X78.528 Y158.03 E.26093
G1 X78.528 Y158.481 E.0233
G1 X73.472 Y158.481 E.26093
G1 X73.472 Y158.933 E.0233
G1 X78.528 Y158.933 E.26093
G1 X78.528 Y159.384 E.0233
G1 X73.472 Y159.384 E.26093
G1 X73.472 Y159.836 E.0233
G1 X78.528 Y159.836 E.26093
G1 X78.528 Y160.288 E.0233
G1 X73.472 Y160.288 E.26093
G1 X73.472 Y160.739 E.0233
G1 X78.528 Y160.739 E.26093
G1 X78.528 Y161.191 E.0233
G1 X73.472 Y161.191 E.26093
G1 X73.472 Y161.642 E.0233
G1 X78.528 Y161.642 E.26093
G1 X78.528 Y162.094 E.0233
G1 X73.472 Y162.094 E.26093
G1 X73.472 Y162.546 E.0233
G1 X78.528 Y162.546 E.26093
G1 X78.528 Y162.997 E.0233
G1 X73.472 Y162.997 E.26093
G1 X73.472 Y163.449 E.0233
G1 X78.528 Y163.449 E.26093
G1 X78.528 Y163.9 E.0233
G1 X73.472 Y163.9 E.26093
G1 X73.472 Y164.352 E.0233
G1 X78.528 Y164.352 E.26093
G1 X78.528 Y164.803 E.0233
G1 X73.472 Y164.803 E.26093
G1 X73.472 Y165.255 E.0233
G1 X78.528 Y165.255 E.26093
G1 X78.528 Y165.707 E.0233
G1 X73.472 Y165.707 E.26093
G1 X73.472 Y166.158 E.0233
G1 X78.528 Y166.158 E.26093
G1 X78.528 Y166.61 E.0233
G1 X73.472 Y166.61 E.26093
G1 X73.472 Y167.061 E.0233
G1 X78.528 Y167.061 E.26093
G1 X78.528 Y167.513 E.0233
G1 X73.472 Y167.513 E.26093
G1 X73.472 Y167.964 E.0233
G1 X78.528 Y167.964 E.26093
G1 X78.528 Y168.416 E.0233
G1 X73.472 Y168.416 E.26093
G1 X73.472 Y168.868 E.0233
G1 X78.528 Y168.868 E.26093
G1 X78.528 Y169.319 E.0233
G1 X73.472 Y169.319 E.26093
G1 X73.472 Y169.771 E.0233
G1 X186.528 Y169.771 E5.83416
G1 X186.528 Y169.319 E.0233
G1 X129.472 Y169.319 E2.94434
G1 X129.472 Y168.868 E.0233
G1 X186.528 Y168.868 E2.94434
G1 X186.528 Y168.416 E.0233
G1 X129.472 Y168.416 E2.94434
G1 X129.472 Y167.964 E.0233
G1 X186.528 Y167.964 E2.94434
G1 X186.528 Y167.513 E.0233
G1 X129.472 Y167.513 E2.94434
G1 X129.472 Y167.061 E.0233
G1 X186.528 Y167.061 E2.94434
G1 X186.528 Y166.61 E.0233
G1 X129.472 Y166.61 E2.94434
G1 X129.472 Y166.158 E.0233
G1 X186.528 Y166.158 E2.94434
G1 X186.528 Y165.707 E.0233
G1 X129.472 Y165.707 E2.94434
G1 X129.472 Y165.255 E.0233
G1 X186.528 Y165.255 E2.94434
G1 X186.528 Y164.803 E.0233
G1 X129.472 Y164.803 E2.94434
G1 X129.472 Y164.352 E.0233
G1 X186.528 Y164.352 E2.94434
G1 X186.528 Y163.9 E.0233
G1 X129.472 Y163.9 E2.94434
G1 X129.472 Y163.449 E.0233
G1 X186.528 Y163.449 E2.94434
G1 X186.528 Y162.997 E.0233
G1 X129.472 Y162.997 E2.94434
G1 X129.472 Y162.546 E.0233
G1 X186.528 Y162.546 E2.94434
G1 X186.528 Y162.094 E.0233
G1 X129.472 Y162.094 E2.94434
G1 X129.472 Y161.642 E.0233
G1 X186.528 Y161.642 E2.94434
G1 X186.528 Y161.191 E.0233
G1 X129.472 Y161.191 E2.94434
G1 X129.472 Y160.739 E.0233
G1 X186.528 Y160.739 E2.94434
G1 X186.528 Y160.288 E.0233
G1 X129.472 Y160.288 E2.94434
G1 X129.472 Y159.836 E.0233
G1 X186.528 Y159.836 E2.94434
G1 X186.528 Y159.384 E.0233
G1 X129.472 Y159.384 E2.94434
G1 X129.472 Y158.933 E.0233
G1 X186.528 Y158.933 E2.94434
G1 X186.528 Y158.481 E.0233
G1 X129.472 Y158.481 E2.94434
G1 X129.472 Y158.03 E.0233
G1 X186.528 Y158.03 E2.94434
G1 X186.528 Y157.578 E.0233
G1 X129.472 Y157.578 E2.94434
G1 X129.472 Y157.127 E.0233
G1 X186.528 Y157.127 E2.94434
G1 X186.528 Y156.675 E.0233
G1 X129.472 Y156.675 E2.94434
G1 X129.472 Y156.223 E.0233
G1 X186.528 Y156.223 E2.94434
G1 X186.528 Y155.772 E.0233
G1 X129.472 Y155.772 E2.94434
G1 X129.472 Y155.32 E.0233
G1 X186.528 Y155.32 E2.94434
G1 X186.528 Y154.869 E.0233
G1 X129.472 Y154.869 E2.94434
G1 X129.472 Y154.417 E.0233
G1 X186.528 Y154.417 E2.94434
G1 X186.528 Y153.966 E.0233
G1 X129.472 Y153.966 E2.94434
G1 X129.472 Y153.514 E.0233
G1 X186.528 Y153.514 E2.94434
G1 X186.528 Y153.062 E.0233
G1 X129.472 Y153.062 E2.94434
G1 X129.472 Y152.611 E.0233
G1 X186.528 Y152.611 E2.94434
G1 X186.528 Y152.159 E.0233
G1 X129.472 Y152.159 E2.94434
G1 X129.472 Y151.708 E.0233
G1 X186.528 Y151.708 E2.94434
G1 X186.528 Y151.256 E.0233
G1 X129.472 Y151.256 E2.94434
G1 X129.472 Y150.805 E.0233
G1 X186.528 Y150.805 E2.94434
G1 X186.528 Y150.353 E.0233
G1 X129.472 Y150.353 E2.94434
G1 X129.472 Y149.901 E.0233
G1 X186.528 Y149.901 E2.94434
G1 X186.528 Y149.45 E.0233
G1 X129.472 Y149.45 E2.94434
M73 P53 R25
G1 X129.472 Y148.998 E.0233
G1 X186.528 Y148.998 E2.94434
G1 X186.528 Y148.547 E.0233
G1 X129.472 Y148.547 E2.94434
G1 X129.472 Y148.095 E.0233
G1 X186.528 Y148.095 E2.94434
G1 X186.528 Y147.644 E.0233
G1 X129.472 Y147.644 E2.94434
G1 X129.472 Y147.192 E.0233
G1 X186.528 Y147.192 E2.94434
G1 X186.528 Y146.74 E.0233
G1 X129.472 Y146.74 E2.94434
G1 X129.472 Y146.289 E.0233
G1 X186.528 Y146.289 E2.94434
G1 X186.528 Y145.837 E.0233
G1 X129.472 Y145.837 E2.94434
M73 P53 R24
G1 X129.472 Y145.386 E.0233
G1 X186.528 Y145.386 E2.94434
G1 X186.528 Y144.934 E.0233
G1 X129.472 Y144.934 E2.94434
G1 X129.472 Y144.483 E.0233
G1 X186.528 Y144.483 E2.94434
G1 X186.528 Y144.031 E.0233
G1 X129.472 Y144.031 E2.94434
G1 X129.472 Y143.579 E.0233
G1 X186.528 Y143.579 E2.94434
G1 X186.528 Y143.128 E.0233
G1 X129.472 Y143.128 E2.94434
G1 X129.472 Y142.676 E.0233
G1 X186.528 Y142.676 E2.94434
G1 X186.528 Y142.225 E.0233
G1 X129.472 Y142.225 E2.94434
G1 X129.472 Y141.773 E.0233
G1 X186.528 Y141.773 E2.94434
G1 X186.528 Y141.321 E.0233
G1 X129.472 Y141.321 E2.94434
G1 X129.472 Y140.87 E.0233
G1 X186.528 Y140.87 E2.94434
G1 X186.528 Y140.418 E.0233
G1 X129.472 Y140.418 E2.94434
G1 X129.472 Y139.967 E.0233
G1 X186.528 Y139.967 E2.94434
G1 X186.528 Y139.515 E.0233
G1 X129.472 Y139.515 E2.94434
G1 X129.472 Y139.064 E.0233
G1 X186.528 Y139.064 E2.94434
G1 X186.528 Y138.612 E.0233
G1 X129.472 Y138.612 E2.94434
G1 X129.472 Y138.16 E.0233
G1 X186.528 Y138.16 E2.94434
G1 X186.528 Y137.709 E.0233
G1 X129.472 Y137.709 E2.94434
G1 X129.472 Y137.257 E.0233
G1 X186.528 Y137.257 E2.94434
G1 X186.528 Y136.806 E.0233
G1 X129.472 Y136.806 E2.94434
M73 P54 R24
G1 X129.472 Y136.354 E.0233
G1 X186.528 Y136.354 E2.94434
G1 X186.528 Y135.903 E.0233
G1 X129.472 Y135.903 E2.94434
G1 X129.472 Y135.451 E.0233
G1 X186.528 Y135.451 E2.94434
G1 X186.528 Y134.999 E.0233
G1 X129.472 Y134.999 E2.94434
G1 X129.472 Y134.548 E.0233
G1 X186.528 Y134.548 E2.94434
G1 X186.528 Y134.096 E.0233
G1 X129.472 Y134.096 E2.94434
G1 X129.472 Y133.645 E.0233
G1 X186.528 Y133.645 E2.94434
G1 X186.528 Y133.193 E.0233
G1 X129.472 Y133.193 E2.94434
G1 X129.472 Y132.742 E.0233
G1 X186.528 Y132.742 E2.94434
G1 X186.528 Y132.29 E.0233
G1 X129.472 Y132.29 E2.94434
G1 X129.472 Y131.838 E.0233
G1 X186.528 Y131.838 E2.94434
G1 X186.528 Y131.387 E.0233
G1 X129.472 Y131.387 E2.94434
G1 X129.472 Y130.935 E.0233
G1 X186.528 Y130.935 E2.94434
G1 X186.528 Y130.484 E.0233
G1 X129.472 Y130.484 E2.94434
G1 X129.472 Y130.032 E.0233
G1 X186.528 Y130.032 E2.94434
G1 X186.528 Y129.581 E.0233
G1 X129.472 Y129.581 E2.94434
G1 X129.472 Y129.129 E.0233
G1 X186.528 Y129.129 E2.94434
G1 X186.528 Y128.677 E.0233
G1 X129.472 Y128.677 E2.94434
G1 X129.472 Y128.226 E.0233
G1 X186.528 Y128.226 E2.94434
G1 X186.528 Y127.774 E.0233
G1 X129.472 Y127.774 E2.94434
G1 X129.472 Y127.323 E.0233
G1 X186.528 Y127.323 E2.94434
G1 X186.528 Y126.871 E.0233
G1 X129.472 Y126.871 E2.94434
G1 X129.472 Y126.42 E.0233
G1 X186.528 Y126.42 E2.94434
G1 X186.528 Y125.968 E.0233
G1 X129.472 Y125.968 E2.94434
G1 X129.472 Y125.516 E.0233
G1 X186.528 Y125.516 E2.94434
G1 X186.528 Y125.065 E.0233
G1 X129.472 Y125.065 E2.94434
G1 X129.472 Y124.613 E.0233
G1 X186.528 Y124.613 E2.94434
M73 P55 R24
G1 X186.528 Y124.162 E.0233
G1 X129.472 Y124.162 E2.94434
G1 X129.472 Y123.71 E.0233
G1 X186.528 Y123.71 E2.94434
G1 X186.528 Y123.258 E.0233
G1 X129.472 Y123.258 E2.94434
G1 X129.472 Y122.807 E.0233
G1 X186.528 Y122.807 E2.94434
G1 X186.528 Y122.355 E.0233
G1 X129.472 Y122.355 E2.94434
M73 P55 R23
G1 X129.472 Y121.904 E.0233
G1 X186.528 Y121.904 E2.94434
G1 X186.528 Y121.452 E.0233
G1 X129.472 Y121.452 E2.94434
G1 X129.472 Y121.001 E.0233
G1 X186.528 Y121.001 E2.94434
G1 X186.528 Y120.549 E.0233
G1 X129.472 Y120.549 E2.94434
G1 X129.472 Y120.097 E.0233
G1 X186.528 Y120.097 E2.94434
G1 X186.528 Y119.646 E.0233
G1 X129.472 Y119.646 E2.94434
G1 X129.472 Y119.194 E.0233
G1 X186.528 Y119.194 E2.94434
G1 X186.528 Y118.743 E.0233
G1 X129.472 Y118.743 E2.94434
G1 X129.472 Y118.291 E.0233
G1 X186.528 Y118.291 E2.94434
G1 X186.528 Y117.84 E.0233
G1 X129.472 Y117.84 E2.94434
G1 X129.472 Y117.388 E.0233
G1 X186.528 Y117.388 E2.94434
G1 X186.528 Y116.936 E.0233
G1 X129.472 Y116.936 E2.94434
G1 X129.472 Y116.485 E.0233
G1 X186.528 Y116.485 E2.94434
G1 X186.528 Y116.033 E.0233
G1 X129.472 Y116.033 E2.94434
G1 X129.472 Y115.582 E.0233
G1 X186.528 Y115.582 E2.94434
G1 X186.528 Y115.13 E.0233
G1 X129.472 Y115.13 E2.94434
G1 X129.472 Y114.679 E.0233
G1 X186.528 Y114.679 E2.94434
G1 X186.528 Y114.227 E.0233
G1 X129.472 Y114.227 E2.94434
G1 X129.472 Y113.775 E.0233
G1 X186.528 Y113.775 E2.94434
G1 X186.528 Y113.324 E.0233
G1 X129.472 Y113.324 E2.94434
G1 X129.472 Y112.872 E.0233
G1 X186.528 Y112.872 E2.94434
G1 X186.528 Y112.421 E.0233
G1 X129.472 Y112.421 E2.94434
G1 X129.472 Y111.969 E.0233
G1 X186.528 Y111.969 E2.94434
M73 P56 R23
G1 X186.528 Y111.518 E.0233
G1 X129.472 Y111.518 E2.94434
G1 X129.472 Y111.066 E.0233
G1 X186.528 Y111.066 E2.94434
G1 X186.528 Y110.614 E.0233
G1 X129.472 Y110.614 E2.94434
G1 X129.472 Y110.163 E.0233
G1 X186.528 Y110.163 E2.94434
G1 X186.528 Y109.711 E.0233
G1 X129.472 Y109.711 E2.94434
G1 X129.472 Y109.26 E.0233
G1 X186.528 Y109.26 E2.94434
G1 X186.528 Y108.808 E.0233
G1 X129.472 Y108.808 E2.94434
G1 X129.472 Y108.357 E.0233
G1 X186.528 Y108.357 E2.94434
G1 X186.528 Y107.905 E.0233
G1 X129.472 Y107.905 E2.94434
G1 X129.472 Y107.453 E.0233
G1 X186.528 Y107.453 E2.94434
G1 X186.528 Y107.002 E.0233
G1 X129.472 Y107.002 E2.94434
G1 X129.472 Y106.55 E.0233
G1 X186.528 Y106.55 E2.94434
G1 X186.528 Y106.099 E.0233
G1 X129.472 Y106.099 E2.94434
G1 X129.472 Y105.647 E.0233
G1 X186.528 Y105.647 E2.94434
G1 X186.528 Y105.195 E.0233
G1 X129.472 Y105.195 E2.94434
G1 X129.472 Y104.744 E.0233
G1 X186.528 Y104.744 E2.94434
G1 X186.528 Y104.292 E.0233
G1 X129.472 Y104.292 E2.94434
G1 X129.472 Y103.841 E.0233
G1 X186.528 Y103.841 E2.94434
G1 X186.528 Y103.389 E.0233
G1 X129.472 Y103.389 E2.94434
G1 X129.472 Y102.938 E.0233
G1 X186.528 Y102.938 E2.94434
G1 X186.528 Y102.486 E.0233
G1 X129.472 Y102.486 E2.94434
G1 X129.472 Y102.034 E.0233
G1 X186.528 Y102.034 E2.94434
G1 X186.528 Y101.583 E.0233
G1 X129.472 Y101.583 E2.94434
G1 X129.472 Y101.131 E.0233
G1 X186.528 Y101.131 E2.94434
G1 X186.528 Y100.68 E.0233
G1 X129.472 Y100.68 E2.94434
G1 X129.472 Y100.228 E.0233
G1 X186.528 Y100.228 E2.94434
G1 X186.528 Y99.777 E.0233
G1 X129.472 Y99.777 E2.94434
G1 X129.472 Y99.325 E.0233
G1 X186.528 Y99.325 E2.94434
M73 P57 R23
G1 X186.528 Y98.873 E.0233
G1 X129.472 Y98.873 E2.94434
M73 P57 R22
G1 X129.472 Y98.422 E.0233
G1 X186.528 Y98.422 E2.94434
G1 X186.528 Y97.97 E.0233
G1 X129.472 Y97.97 E2.94434
G1 X129.472 Y97.519 E.0233
G1 X186.528 Y97.519 E2.94434
G1 X186.528 Y97.067 E.0233
G1 X129.472 Y97.067 E2.94434
G1 X129.472 Y96.616 E.0233
G1 X186.528 Y96.616 E2.94434
G1 X186.528 Y96.164 E.0233
G1 X129.472 Y96.164 E2.94434
G1 X129.472 Y95.712 E.0233
G1 X186.528 Y95.712 E2.94434
G1 X186.528 Y95.261 E.0233
G1 X129.472 Y95.261 E2.94434
G1 X129.472 Y94.809 E.0233
G1 X186.528 Y94.809 E2.94434
G1 X186.528 Y94.358 E.0233
G1 X129.472 Y94.358 E2.94434
G1 X129.472 Y93.906 E.0233
G1 X186.528 Y93.906 E2.94434
G1 X186.528 Y93.455 E.0233
G1 X129.472 Y93.455 E2.94434
G1 X129.472 Y93.003 E.0233
G1 X186.528 Y93.003 E2.94434
G1 X186.528 Y92.551 E.0233
G1 X129.472 Y92.551 E2.94434
G1 X129.472 Y92.1 E.0233
G1 X186.528 Y92.1 E2.94434
G1 X186.528 Y91.648 E.0233
G1 X129.472 Y91.648 E2.94434
G1 X129.472 Y91.197 E.0233
G1 X186.528 Y91.197 E2.94434
G1 X186.528 Y90.745 E.0233
G1 X129.472 Y90.745 E2.94434
G1 X129.472 Y90.294 E.0233
G1 X186.528 Y90.294 E2.94434
G1 X186.528 Y89.842 E.0233
G1 X129.472 Y89.842 E2.94434
G1 X129.472 Y89.39 E.0233
G1 X186.528 Y89.39 E2.94434
G1 X186.528 Y88.939 E.0233
G1 X129.472 Y88.939 E2.94434
G1 X129.472 Y88.487 E.0233
G1 X186.731 Y88.487 E2.95479
M106 S127.5
G1 X182.441 Y71.349 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X180.812 Y71.349 E.05401
G1 X179.414 Y69.95 E.0656
G1 X180.374 Y69.95 E.03184
G1 X178.975 Y71.349 E.0656
G1 X173.136 Y71.349 E.19369
G1 X171.738 Y69.95 E.0656
M73 P58 R22
G1 X172.698 Y69.95 E.03184
G1 X171.299 Y71.349 E.0656
G1 X165.46 Y71.349 E.19369
G1 X164.062 Y69.95 E.0656
G1 X165.022 Y69.95 E.03184
G1 X163.623 Y71.349 E.0656
G1 X157.784 Y71.349 E.19369
G1 X156.386 Y69.95 E.0656
G1 X157.346 Y69.95 E.03184
G1 X155.947 Y71.349 E.0656
G1 X150.108 Y71.349 E.19369
G1 X149.151 Y70.392 E.0449
G1 X149.151 Y70.469 E.00256
G1 X149.67 Y69.95 E.02432
G1 X151.298 Y69.95 E.05401
G1 X186.731 Y170.222 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.401575
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X73.472 Y170.222 E5.84461
G1 X73.472 Y170.674 E.0233
G1 X186.528 Y170.674 E5.83416
G1 X186.528 Y171.125 E.0233
G1 X73.472 Y171.125 E5.83416
G1 X73.472 Y171.577 E.0233
G1 X186.528 Y171.577 E5.83416
G1 X186.528 Y172.029 E.0233
G1 X73.472 Y172.029 E5.83416
G1 X73.472 Y172.48 E.0233
G1 X186.528 Y172.48 E5.83416
G1 X186.528 Y172.932 E.0233
G1 X73.472 Y172.932 E5.83416
G1 X73.472 Y173.383 E.0233
G1 X186.528 Y173.383 E5.83416
G1 X186.528 Y173.835 E.0233
G1 X73.472 Y173.835 E5.83416
G1 X73.472 Y174.286 E.0233
G1 X186.528 Y174.286 E5.83416
G1 X186.528 Y174.738 E.0233
G1 X73.472 Y174.738 E5.83416
G1 X73.472 Y175.19 E.0233
G1 X186.528 Y175.19 E5.83416
G1 X186.528 Y175.641 E.0233
G1 X73.472 Y175.641 E5.83416
G1 X73.472 Y176.093 E.0233
G1 X186.528 Y176.093 E5.83416
G1 X186.528 Y176.544 E.0233
G1 X73.472 Y176.544 E5.83416
G1 X73.472 Y176.996 E.0233
G1 X186.528 Y176.996 E5.83416
G1 X186.528 Y177.447 E.0233
G1 X73.472 Y177.447 E5.83416
G1 X73.472 Y177.899 E.0233
G1 X186.528 Y177.899 E5.83416
G1 X186.528 Y178.351 E.0233
G1 X73.472 Y178.351 E5.83416
G1 X73.472 Y178.802 E.0233
G1 X186.528 Y178.802 E5.83416
G1 X186.528 Y179.254 E.0233
G1 X73.472 Y179.254 E5.83416
G1 X73.472 Y179.705 E.0233
G1 X186.528 Y179.705 E5.83416
G1 X186.528 Y180.157 E.0233
G1 X73.472 Y180.157 E5.83416
G1 X73.472 Y180.609 E.0233
G1 X186.528 Y180.609 E5.83416
G1 X186.528 Y181.06 E.0233
G1 X73.472 Y181.06 E5.83416
G1 X73.472 Y181.512 E.0233
G1 X186.528 Y181.512 E5.83416
G1 X186.528 Y181.963 E.0233
G1 X73.472 Y181.963 E5.83416
M73 P58 R21
G1 X73.472 Y182.415 E.0233
G1 X186.528 Y182.415 E5.83416
G1 X186.528 Y182.866 E.0233
G1 X73.472 Y182.866 E5.83416
M73 P59 R21
G1 X73.472 Y183.318 E.0233
G1 X186.528 Y183.318 E5.83416
G1 X186.528 Y183.77 E.0233
G1 X73.472 Y183.77 E5.83416
G1 X73.472 Y184.221 E.0233
G1 X186.528 Y184.221 E5.83416
G1 X148.723 Y184.223 E1.95091
G1 X148.723 Y184.673 E.02322
G1 X73.472 Y184.673 E3.88325
G1 X73.472 Y185.124 E.0233
G1 X148.723 Y185.124 E3.88325
G1 X148.723 Y185.576 E.0233
G1 X73.472 Y185.576 E3.88325
G1 X73.472 Y186.027 E.0233
G1 X148.925 Y186.027 E3.8937
M106 S127.5
G1 X151.298 Y186.05 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X149.67 Y186.05 E.05401
G1 X149.151 Y185.531 E.02432
G1 X149.151 Y185.608 E.00256
G1 X150.108 Y184.651 E.0449
G1 X155.947 Y184.651 E.19369
G1 X157.346 Y186.05 E.0656
G1 X156.386 Y186.05 E.03184
G1 X157.784 Y184.651 E.0656
G1 X163.623 Y184.651 E.19369
G1 X165.022 Y186.05 E.0656
G1 X164.062 Y186.05 E.03184
M73 P60 R21
G1 X165.46 Y184.651 E.0656
G1 X171.299 Y184.651 E.19369
G1 X172.698 Y186.05 E.0656
G1 X171.738 Y186.05 E.03184
G1 X173.136 Y184.651 E.0656
G1 X178.975 Y184.651 E.19369
G1 X180.374 Y186.05 E.0656
G1 X179.414 Y186.05 E.03184
G1 X180.812 Y184.651 E.0656
G1 X182.441 Y184.651 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X180.812 Y184.651 E-.61876
G1 X180.549 Y184.914 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/125
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
G3 Z5 I.347 J-1.166 P1  F30000
G1 X129.102 Y169.602 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X78.898 Y169.602 E1.66536
M73 P60 R20
G1 X78.898 Y88.398 E2.69369
G1 X129.102 Y88.398 E1.66536
G1 X129.102 Y169.542 E2.6917
G1 X128.71 Y169.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.29 Y169.21 E1.51854
G1 X79.29 Y88.79 E2.47108
G1 X128.71 Y88.79 E1.51854
M73 P61 R20
G1 X128.71 Y169.15 E2.46924
M204 S10000
; WIPE_START
G1 F24000
G1 X126.71 Y169.152 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.071 J-.577 P1  F30000
G1 X73.102 Y69.602 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X186.898 Y69.602 E3.77482
G1 X186.898 Y186.398 E3.87433
G1 X73.102 Y186.398 E3.77482
G1 X73.102 Y69.662 E3.87234
G1 X72.71 Y69.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X187.29 Y69.21 E3.52072
G1 X187.29 Y186.79 E3.61291
G1 X72.71 Y186.79 E3.52072
G1 X72.71 Y69.27 E3.61106
M204 S10000
; WIPE_START
G1 F24000
G1 X74.71 Y69.269 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.717 J-.983 P1  F30000
G1 X74.029 Y69.766 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420718
G1 F15000
G1 X73.435 Y70.36 E.02586
G1 X73.435 Y70.894 E.01645
G1 X74.394 Y69.935 E.04174
G1 X74.928 Y69.935 E.01645
G1 X73.435 Y71.428 E.065
G1 X73.435 Y71.963 E.01645
G1 X75.463 Y69.935 E.08826
G1 X75.997 Y69.935 E.01645
G1 X73.435 Y72.497 E.11152
G1 X73.435 Y73.031 E.01645
G1 X76.531 Y69.935 E.13478
G1 X77.065 Y69.935 E.01645
G1 X73.435 Y73.565 E.15804
G1 X73.435 Y74.1 E.01645
G1 X77.6 Y69.935 E.1813
G1 X78.134 Y69.935 E.01645
G1 X73.435 Y74.634 E.20457
G1 X73.435 Y75.168 E.01645
G1 X78.668 Y69.935 E.22783
G1 X79.203 Y69.935 E.01645
G1 X73.435 Y75.703 E.25109
G1 X73.435 Y76.237 E.01645
G1 X79.737 Y69.935 E.27435
G1 X80.271 Y69.935 E.01645
G1 X73.435 Y76.771 E.29761
G1 X73.435 Y77.305 E.01645
G1 X80.805 Y69.935 E.32087
G1 X81.34 Y69.935 E.01645
G1 X73.435 Y77.84 E.34414
G1 X73.435 Y78.374 E.01645
G1 X81.874 Y69.935 E.3674
G1 X82.408 Y69.935 E.01645
G1 X73.435 Y78.908 E.39066
G1 X73.435 Y79.443 E.01645
G1 X82.943 Y69.935 E.41392
G1 X83.477 Y69.935 E.01645
G1 X73.435 Y79.977 E.43718
G1 X73.435 Y80.511 E.01645
G1 X84.011 Y69.935 E.46044
G1 X84.545 Y69.935 E.01645
G1 X73.435 Y81.045 E.48371
G1 X73.435 Y81.58 E.01645
G1 X85.08 Y69.935 E.50697
G1 X85.614 Y69.935 E.01645
G1 X73.435 Y82.114 E.53023
G1 X73.435 Y82.648 E.01645
G1 X86.148 Y69.935 E.55349
G1 X86.683 Y69.935 E.01645
G1 X73.435 Y83.183 E.57675
G1 X73.435 Y83.717 E.01645
G1 X87.217 Y69.935 E.60001
G1 X87.751 Y69.935 E.01645
G1 X73.435 Y84.251 E.62327
G1 X73.435 Y84.785 E.01645
G1 X88.285 Y69.935 E.64654
G1 X88.82 Y69.935 E.01645
G1 X73.435 Y85.32 E.6698
G1 X73.435 Y85.854 E.01645
G1 X89.354 Y69.935 E.69306
G1 X89.888 Y69.935 E.01645
G1 X73.435 Y86.388 E.71632
G1 X73.435 Y86.923 E.01645
G1 X90.423 Y69.935 E.73958
G1 X90.957 Y69.935 E.01645
G1 X73.435 Y87.457 E.76284
G1 X73.435 Y87.991 E.01645
G1 X91.491 Y69.935 E.78611
G1 X92.025 Y69.935 E.01645
G1 X73.435 Y88.525 E.80937
G1 X73.435 Y89.06 E.01645
G1 X92.56 Y69.935 E.83263
G1 X93.094 Y69.935 E.01645
G1 X73.435 Y89.594 E.85589
G1 X73.435 Y90.128 E.01645
G1 X93.628 Y69.935 E.87915
G1 X94.163 Y69.935 E.01645
G1 X73.435 Y90.663 E.90241
G1 X73.435 Y91.197 E.01645
G1 X94.697 Y69.935 E.92568
G1 X95.231 Y69.935 E.01645
G1 X73.435 Y91.731 E.94894
G1 X73.435 Y92.265 E.01645
G1 X95.765 Y69.935 E.9722
G1 X96.3 Y69.935 E.01645
G1 X73.435 Y92.8 E.99546
G1 X73.435 Y93.334 E.01645
G1 X96.834 Y69.935 E1.01872
G1 X97.368 Y69.935 E.01645
G1 X79.239 Y88.065 E.78931
G1 X79.773 Y88.065 E.01645
G1 X97.903 Y69.935 E.78931
G1 X98.437 Y69.935 E.01645
G1 X80.308 Y88.065 E.78931
G1 X80.842 Y88.065 E.01645
G1 X98.971 Y69.935 E.78931
G1 X99.505 Y69.935 E.01645
G1 X81.376 Y88.065 E.78931
G1 X81.91 Y88.065 E.01645
G1 X100.04 Y69.935 E.78931
G1 X100.574 Y69.935 E.01645
G1 X82.445 Y88.065 E.78931
G1 X82.979 Y88.065 E.01645
G1 X101.108 Y69.935 E.78931
G1 X101.643 Y69.935 E.01645
G1 X83.513 Y88.065 E.78931
G1 X84.048 Y88.065 E.01645
G1 X102.177 Y69.935 E.78931
G1 X102.711 Y69.935 E.01645
G1 X84.582 Y88.065 E.78931
G1 X85.116 Y88.065 E.01645
G1 X103.245 Y69.935 E.78931
G1 X103.78 Y69.935 E.01645
G1 X85.65 Y88.065 E.78931
G1 X86.185 Y88.065 E.01645
G1 X104.314 Y69.935 E.78931
G1 X104.848 Y69.935 E.01645
G1 X86.719 Y88.065 E.78931
G1 X87.253 Y88.065 E.01645
G1 X105.383 Y69.935 E.78931
G1 X105.917 Y69.935 E.01645
G1 X87.788 Y88.065 E.78931
G1 X88.322 Y88.065 E.01645
G1 X106.451 Y69.935 E.78931
G1 X106.985 Y69.935 E.01645
G1 X88.856 Y88.065 E.78931
G1 X89.39 Y88.065 E.01645
G1 X107.52 Y69.935 E.78931
G1 X108.054 Y69.935 E.01645
G1 X89.925 Y88.065 E.78931
G1 X90.459 Y88.065 E.01645
G1 X108.588 Y69.935 E.78931
G1 X109.123 Y69.935 E.01645
G1 X90.993 Y88.065 E.78931
G1 X91.528 Y88.065 E.01645
G1 X109.657 Y69.935 E.78931
G1 X110.191 Y69.935 E.01645
G1 X92.062 Y88.065 E.78931
G1 X92.596 Y88.065 E.01645
G1 X110.725 Y69.935 E.78931
G1 X111.26 Y69.935 E.01645
G1 X93.13 Y88.065 E.78931
G1 X93.665 Y88.065 E.01645
G1 X111.794 Y69.935 E.78931
G1 X112.328 Y69.935 E.01645
G1 X94.199 Y88.065 E.78931
G1 X94.733 Y88.065 E.01645
G1 X112.863 Y69.935 E.78931
G1 X113.397 Y69.935 E.01645
G1 X95.268 Y88.065 E.78931
G1 X95.802 Y88.065 E.01645
G1 X113.931 Y69.935 E.78931
G1 X114.465 Y69.935 E.01645
G1 X96.336 Y88.065 E.78931
G1 X96.87 Y88.065 E.01645
G1 X115 Y69.935 E.78931
G1 X115.534 Y69.935 E.01645
G1 X97.405 Y88.065 E.78931
G1 X97.939 Y88.065 E.01645
G1 X116.068 Y69.935 E.78931
G1 X116.603 Y69.935 E.01645
G1 X98.473 Y88.065 E.78931
G1 X99.008 Y88.065 E.01645
G1 X117.137 Y69.935 E.78931
G1 X117.671 Y69.935 E.01645
G1 X99.542 Y88.065 E.78931
G1 X100.076 Y88.065 E.01645
G1 X118.205 Y69.935 E.78931
G1 X118.74 Y69.935 E.01645
G1 X100.61 Y88.065 E.78931
G1 X101.145 Y88.065 E.01645
G1 X119.274 Y69.935 E.78931
G1 X119.808 Y69.935 E.01645
G1 X101.679 Y88.065 E.78931
G1 X102.213 Y88.065 E.01645
G1 X120.343 Y69.935 E.78931
G1 X120.877 Y69.935 E.01645
G1 X102.748 Y88.065 E.78931
G1 X103.282 Y88.065 E.01645
G1 X121.411 Y69.935 E.78931
G1 X121.945 Y69.935 E.01645
G1 X103.816 Y88.065 E.78931
G1 X104.35 Y88.065 E.01645
G1 X122.48 Y69.935 E.78931
G1 X123.014 Y69.935 E.01645
G1 X104.885 Y88.065 E.78931
G1 X105.419 Y88.065 E.01645
G1 X123.548 Y69.935 E.78931
G1 X124.083 Y69.935 E.01645
G1 X105.953 Y88.065 E.78931
G1 X106.488 Y88.065 E.01645
G1 X124.617 Y69.935 E.78931
G1 X125.151 Y69.935 E.01645
G1 X107.022 Y88.065 E.78931
G1 X107.556 Y88.065 E.01645
G1 X125.686 Y69.935 E.78931
G1 X126.22 Y69.935 E.01645
G1 X108.09 Y88.065 E.78931
G1 X108.625 Y88.065 E.01645
G1 X126.754 Y69.935 E.78931
G1 X127.288 Y69.935 E.01645
G1 X109.159 Y88.065 E.78931
G1 X109.693 Y88.065 E.01645
G1 X127.823 Y69.935 E.78931
G1 X128.357 Y69.935 E.01645
G1 X110.228 Y88.065 E.78931
G1 X110.762 Y88.065 E.01645
G1 X128.891 Y69.935 E.78931
G1 X129.426 Y69.935 E.01645
G1 X111.296 Y88.065 E.78931
G1 X111.83 Y88.065 E.01645
G1 X129.96 Y69.935 E.78931
G1 X130.494 Y69.935 E.01645
G1 X112.365 Y88.065 E.78931
G1 X112.899 Y88.065 E.01645
G1 X131.028 Y69.935 E.78931
G1 X131.563 Y69.935 E.01645
G1 X113.433 Y88.065 E.78931
G1 X113.968 Y88.065 E.01645
G1 X132.097 Y69.935 E.78931
G1 X132.631 Y69.935 E.01645
G1 X114.502 Y88.065 E.78931
G1 X115.036 Y88.065 E.01645
G1 X133.166 Y69.935 E.78931
G1 X133.7 Y69.935 E.01645
G1 X115.571 Y88.065 E.78931
G1 X116.105 Y88.065 E.01645
G1 X134.234 Y69.935 E.78931
G1 X134.768 Y69.935 E.01645
G1 X116.639 Y88.065 E.78931
G1 X117.173 Y88.065 E.01645
G1 X135.303 Y69.935 E.78931
G1 X135.837 Y69.935 E.01645
G1 X117.708 Y88.065 E.78931
G1 X118.242 Y88.065 E.01645
G1 X136.371 Y69.935 E.78931
G1 X136.906 Y69.935 E.01645
G1 X118.776 Y88.065 E.78931
G1 X119.311 Y88.065 E.01645
G1 X137.44 Y69.935 E.78931
G1 X137.974 Y69.935 E.01645
G1 X119.845 Y88.065 E.78931
G1 X120.379 Y88.065 E.01645
G1 X138.508 Y69.935 E.78931
G1 X139.043 Y69.935 E.01645
G1 X120.913 Y88.065 E.78931
G1 X121.448 Y88.065 E.01645
G1 X139.577 Y69.935 E.78931
G1 X140.111 Y69.935 E.01645
G1 X121.982 Y88.065 E.78931
G1 X122.516 Y88.065 E.01645
G1 X140.646 Y69.935 E.78931
G1 X141.18 Y69.935 E.01645
G1 X123.051 Y88.065 E.78931
G1 X123.585 Y88.065 E.01645
G1 X141.714 Y69.935 E.78931
G1 X142.248 Y69.935 E.01645
G1 X124.119 Y88.065 E.78931
G1 X124.653 Y88.065 E.01645
G1 X142.783 Y69.935 E.78931
G1 X143.317 Y69.935 E.01645
G1 X125.188 Y88.065 E.78931
M73 P62 R20
G1 X125.722 Y88.065 E.01645
G1 X143.851 Y69.935 E.78931
G1 X144.386 Y69.935 E.01645
G1 X126.256 Y88.065 E.78931
G1 X126.791 Y88.065 E.01645
G1 X144.92 Y69.935 E.78931
G1 X145.454 Y69.935 E.01645
G1 X127.325 Y88.065 E.78931
G1 X127.859 Y88.065 E.01645
G1 X145.988 Y69.935 E.78931
G1 X146.523 Y69.935 E.01645
G1 X128.393 Y88.065 E.78931
G1 X128.928 Y88.065 E.01645
G1 X147.057 Y69.935 E.78931
G1 X147.591 Y69.935 E.01645
G1 X129.435 Y88.091 E.79047
G1 X129.435 Y88.626 E.01645
G1 X148.126 Y69.935 E.81373
G1 X148.66 Y69.935 E.01645
G1 X129.435 Y89.16 E.83699
G1 X129.435 Y89.694 E.01645
G1 X148.759 Y70.37 E.84132
G1 X148.759 Y70.905 E.01645
G1 X129.435 Y90.228 E.84132
G1 X129.435 Y90.763 E.01645
G1 X148.759 Y71.439 E.84132
G1 X148.759 Y71.741 E.0093
G1 X148.992 Y71.741 E.00715
G1 X129.435 Y91.297 E.85143
G1 X129.435 Y91.831 E.01645
G1 X149.526 Y71.741 E.87469
G1 X150.06 Y71.741 E.01645
G1 X129.435 Y92.366 E.89796
G1 X129.435 Y92.9 E.01645
G1 X150.594 Y71.741 E.92122
G1 X151.129 Y71.741 E.01645
G1 X129.435 Y93.434 E.94448
G1 X129.435 Y93.968 E.01645
G1 X151.663 Y71.741 E.96774
G1 X152.197 Y71.741 E.01645
G1 X129.435 Y94.503 E.991
G1 X129.435 Y95.037 E.01645
G1 X152.732 Y71.741 E1.01426
G1 X153.266 Y71.741 E.01645
G1 X129.435 Y95.571 E1.03752
G1 X129.435 Y96.106 E.01645
G1 X153.8 Y71.741 E1.06079
G1 X154.334 Y71.741 E.01645
G1 X129.435 Y96.64 E1.08405
G1 X129.435 Y97.174 E.01645
G1 X154.869 Y71.741 E1.10731
G1 X155.403 Y71.741 E.01645
G1 X129.435 Y97.708 E1.13057
G1 X129.435 Y98.243 E.01645
G1 X155.937 Y71.741 E1.15383
G1 X156.472 Y71.741 E.01645
G1 X129.435 Y98.777 E1.17709
G1 X129.435 Y99.311 E.01645
G1 X157.006 Y71.741 E1.20036
G1 X157.54 Y71.741 E.01645
G1 X129.435 Y99.846 E1.22362
G1 X129.435 Y100.38 E.01645
G1 X158.074 Y71.741 E1.24688
G1 X158.609 Y71.741 E.01645
G1 X129.435 Y100.914 E1.27014
G1 X129.435 Y101.448 E.01645
G1 X159.143 Y71.741 E1.2934
G1 X159.677 Y71.741 E.01645
G1 X129.435 Y101.983 E1.31666
G1 X129.435 Y102.517 E.01645
G1 X160.212 Y71.741 E1.33993
G1 X160.746 Y71.741 E.01645
G1 X129.435 Y103.051 E1.36319
G1 X129.435 Y103.586 E.01645
G1 X161.28 Y71.741 E1.38645
G1 X161.814 Y71.741 E.01645
G1 X129.435 Y104.12 E1.40971
G1 X129.435 Y104.654 E.01645
G1 X162.349 Y71.741 E1.43297
G1 X162.883 Y71.741 E.01645
G1 X129.435 Y105.188 E1.45623
G1 X129.435 Y105.723 E.01645
G1 X163.417 Y71.741 E1.47949
G1 X163.952 Y71.741 E.01645
G1 X129.435 Y106.257 E1.50276
G1 X129.435 Y106.791 E.01645
G1 X164.486 Y71.741 E1.52602
G1 X165.02 Y71.741 E.01645
G1 X129.435 Y107.326 E1.54928
G1 X129.435 Y107.86 E.01645
G1 X165.554 Y71.741 E1.57254
G1 X166.089 Y71.741 E.01645
G1 X129.435 Y108.394 E1.5958
G1 X129.435 Y108.928 E.01645
G1 X166.623 Y71.741 E1.61906
G1 X167.157 Y71.741 E.01645
G1 X129.435 Y109.463 E1.64233
G1 X129.435 Y109.997 E.01645
G1 X167.692 Y71.741 E1.66559
G1 X168.226 Y71.741 E.01645
G1 X129.435 Y110.531 E1.68885
G1 X129.435 Y111.066 E.01645
G1 X168.76 Y71.741 E1.71211
G1 X169.294 Y71.741 E.01645
G1 X129.435 Y111.6 E1.73537
G1 X129.435 Y112.134 E.01645
G1 X169.829 Y71.741 E1.75863
G1 X170.363 Y71.741 E.01645
G1 X129.435 Y112.668 E1.7819
G1 X129.435 Y113.203 E.01645
G1 X170.897 Y71.741 E1.80516
G1 X171.432 Y71.741 E.01645
G1 X129.435 Y113.737 E1.82842
G1 X129.435 Y114.271 E.01645
G1 X171.966 Y71.741 E1.85168
G1 X172.5 Y71.741 E.01645
G1 X129.435 Y114.806 E1.87494
G1 X129.435 Y115.34 E.01645
G1 X173.035 Y71.741 E1.8982
G1 X173.569 Y71.741 E.01645
G1 X129.435 Y115.874 E1.92147
G1 X129.435 Y116.408 E.01645
G1 X174.103 Y71.741 E1.94473
G1 X174.637 Y71.741 E.01645
G1 X129.435 Y116.943 E1.96799
G1 X129.435 Y117.477 E.01645
G1 X175.172 Y71.741 E1.99125
G1 X175.706 Y71.741 E.01645
G1 X129.435 Y118.011 E2.01451
G1 X129.435 Y118.546 E.01645
G1 X176.24 Y71.741 E2.03777
G1 X176.775 Y71.741 E.01645
G1 X129.435 Y119.08 E2.06103
G1 X129.435 Y119.614 E.01645
G1 X177.309 Y71.741 E2.0843
G1 X177.843 Y71.741 E.01645
G1 X129.435 Y120.148 E2.10756
G1 X129.435 Y120.683 E.01645
G1 X178.377 Y71.741 E2.13082
G1 X178.912 Y71.741 E.01645
G1 X129.435 Y121.217 E2.15408
G1 X129.435 Y121.751 E.01645
G1 X179.446 Y71.741 E2.17734
G1 X179.98 Y71.741 E.01645
G1 X129.435 Y122.286 E2.2006
G1 X129.435 Y122.82 E.01645
G1 X180.515 Y71.741 E2.22387
G1 X181.049 Y71.741 E.01645
G1 X129.435 Y123.354 E2.24713
G1 X129.435 Y123.889 E.01645
G1 X181.583 Y71.741 E2.27039
G1 X182.117 Y71.741 E.01645
G1 X129.435 Y124.423 E2.29365
G1 X129.435 Y124.957 E.01645
G1 X182.652 Y71.741 E2.31691
G1 X183.186 Y71.741 E.01645
G1 X129.435 Y125.491 E2.34017
G1 X129.435 Y126.026 E.01645
G1 X183.72 Y71.741 E2.36344
G1 X184.255 Y71.741 E.01645
G1 X129.435 Y126.56 E2.3867
G1 X129.435 Y127.094 E.01645
G1 X184.789 Y71.741 E2.40996
G1 X185.323 Y71.741 E.01645
G1 X129.435 Y127.629 E2.43322
G1 X129.435 Y128.163 E.01645
G1 X185.857 Y71.741 E2.45648
G1 X186.392 Y71.741 E.01645
G1 X129.435 Y128.697 E2.47974
G1 X129.435 Y129.231 E.01645
G1 X186.565 Y72.102 E2.48727
G1 X186.565 Y72.636 E.01645
G1 X129.435 Y129.766 E2.48727
G1 X129.435 Y130.3 E.01645
G1 X186.565 Y73.171 E2.48727
G1 X186.565 Y73.705 E.01645
G1 X129.435 Y130.834 E2.48727
G1 X129.435 Y131.369 E.01645
G1 X186.565 Y74.239 E2.48727
G1 X186.565 Y74.774 E.01645
G1 X129.435 Y131.903 E2.48727
G1 X129.435 Y132.437 E.01645
G1 X186.565 Y75.308 E2.48727
G1 X186.565 Y75.842 E.01645
G1 X129.435 Y132.971 E2.48727
G1 X129.435 Y133.506 E.01645
G1 X186.565 Y76.376 E2.48727
G1 X186.565 Y76.911 E.01645
G1 X129.435 Y134.04 E2.48727
G1 X129.435 Y134.574 E.01645
G1 X186.565 Y77.445 E2.48727
G1 X186.565 Y77.979 E.01645
G1 X129.435 Y135.109 E2.48727
G1 X129.435 Y135.643 E.01645
G1 X186.565 Y78.514 E2.48727
G1 X186.565 Y79.048 E.01645
G1 X129.435 Y136.177 E2.48727
G1 X129.435 Y136.711 E.01645
G1 X186.565 Y79.582 E2.48727
G1 X186.565 Y80.116 E.01645
G1 X129.435 Y137.246 E2.48727
G1 X129.435 Y137.78 E.01645
G1 X186.565 Y80.651 E2.48727
G1 X186.565 Y81.185 E.01645
G1 X129.435 Y138.314 E2.48727
M73 P62 R19
G1 X129.435 Y138.849 E.01645
G1 X186.565 Y81.719 E2.48727
G1 X186.565 Y82.254 E.01645
G1 X129.435 Y139.383 E2.48727
G1 X129.435 Y139.917 E.01645
G1 X186.565 Y82.788 E2.48727
G1 X186.565 Y83.322 E.01645
G1 X129.435 Y140.451 E2.48727
G1 X129.435 Y140.986 E.01645
G1 X186.565 Y83.856 E2.48727
G1 X186.565 Y84.391 E.01645
G1 X129.435 Y141.52 E2.48727
G1 X129.435 Y142.054 E.01645
G1 X186.565 Y84.925 E2.48727
G1 X186.565 Y85.459 E.01645
G1 X129.435 Y142.589 E2.48727
G1 X129.435 Y143.123 E.01645
G1 X186.565 Y85.994 E2.48727
G1 X186.565 Y86.528 E.01645
G1 X129.435 Y143.657 E2.48727
G1 X129.435 Y144.191 E.01645
G1 X186.565 Y87.062 E2.48727
G1 X186.565 Y87.596 E.01645
G1 X129.435 Y144.726 E2.48727
G1 X129.435 Y145.26 E.01645
G1 X186.565 Y88.131 E2.48727
G1 X186.565 Y88.665 E.01645
G1 X129.435 Y145.794 E2.48727
G1 X129.435 Y146.329 E.01645
G1 X186.565 Y89.199 E2.48727
G1 X186.565 Y89.734 E.01645
G1 X129.435 Y146.863 E2.48727
G1 X129.435 Y147.397 E.01645
G1 X186.565 Y90.268 E2.48727
G1 X186.565 Y90.802 E.01645
G1 X129.435 Y147.931 E2.48727
G1 X129.435 Y148.466 E.01645
G1 X186.565 Y91.336 E2.48727
G1 X186.565 Y91.871 E.01645
G1 X129.435 Y149 E2.48727
G1 X129.435 Y149.534 E.01645
G1 X186.565 Y92.405 E2.48727
G1 X186.565 Y92.939 E.01645
G1 X129.435 Y150.069 E2.48727
G1 X129.435 Y150.603 E.01645
G1 X186.565 Y93.474 E2.48727
G1 X186.565 Y94.008 E.01645
G1 X129.435 Y151.137 E2.48727
G1 X129.435 Y151.671 E.01645
G1 X186.565 Y94.542 E2.48727
G1 X186.565 Y95.076 E.01645
G1 X129.435 Y152.206 E2.48727
G1 X129.435 Y152.74 E.01645
G1 X186.565 Y95.611 E2.48727
G1 X186.565 Y96.145 E.01645
G1 X129.435 Y153.274 E2.48727
G1 X129.435 Y153.809 E.01645
G1 X186.565 Y96.679 E2.48727
G1 X186.565 Y97.214 E.01645
G1 X129.435 Y154.343 E2.48727
G1 X129.435 Y154.877 E.01645
G1 X186.565 Y97.748 E2.48727
G1 X186.565 Y98.282 E.01645
G1 X129.435 Y155.411 E2.48727
G1 X129.435 Y155.946 E.01645
G1 X186.565 Y98.816 E2.48727
M73 P63 R19
G1 X186.565 Y99.351 E.01645
G1 X129.435 Y156.48 E2.48727
G1 X129.435 Y157.014 E.01645
G1 X186.565 Y99.885 E2.48727
G1 X186.565 Y100.419 E.01645
G1 X129.435 Y157.549 E2.48727
G1 X129.435 Y158.083 E.01645
G1 X186.565 Y100.954 E2.48727
G1 X186.565 Y101.488 E.01645
G1 X129.435 Y158.617 E2.48727
G1 X129.435 Y159.151 E.01645
G1 X186.565 Y102.022 E2.48727
G1 X186.565 Y102.556 E.01645
G1 X129.435 Y159.686 E2.48727
G1 X129.435 Y160.22 E.01645
G1 X186.565 Y103.091 E2.48727
G1 X186.565 Y103.625 E.01645
G1 X129.435 Y160.754 E2.48727
G1 X129.435 Y161.289 E.01645
G1 X186.565 Y104.159 E2.48727
G1 X186.565 Y104.694 E.01645
G1 X129.435 Y161.823 E2.48727
G1 X129.435 Y162.357 E.01645
G1 X186.565 Y105.228 E2.48727
G1 X186.565 Y105.762 E.01645
G1 X129.435 Y162.891 E2.48727
G1 X129.435 Y163.426 E.01645
G1 X186.565 Y106.296 E2.48727
G1 X186.565 Y106.831 E.01645
G1 X129.435 Y163.96 E2.48727
G1 X129.435 Y164.494 E.01645
G1 X186.565 Y107.365 E2.48727
G1 X186.565 Y107.899 E.01645
G1 X129.435 Y165.029 E2.48727
G1 X129.435 Y165.563 E.01645
G1 X186.565 Y108.434 E2.48727
G1 X186.565 Y108.968 E.01645
G1 X129.435 Y166.097 E2.48727
G1 X129.435 Y166.631 E.01645
G1 X186.565 Y109.502 E2.48727
G1 X186.565 Y110.036 E.01645
G1 X129.435 Y167.166 E2.48727
G1 X129.435 Y167.7 E.01645
G1 X186.565 Y110.571 E2.48727
G1 X186.565 Y111.105 E.01645
G1 X129.435 Y168.234 E2.48727
G1 X129.435 Y168.769 E.01645
G1 X186.565 Y111.639 E2.48727
G1 X186.565 Y112.174 E.01645
G1 X129.266 Y169.473 E2.49466
G1 X151.298 Y186.05 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X149.67 Y186.05 E.05401
G1 X149.151 Y185.531 E.02432
G1 X149.151 Y185.608 E.00256
G1 X150.108 Y184.651 E.0449
G1 X155.947 Y184.651 E.19369
G1 X157.346 Y186.05 E.0656
G1 X156.386 Y186.05 E.03184
G1 X157.784 Y184.651 E.0656
G1 X163.623 Y184.651 E.19369
G1 X165.022 Y186.05 E.0656
G1 X164.062 Y186.05 E.03184
G1 X165.46 Y184.651 E.0656
G1 X171.299 Y184.651 E.19369
G1 X172.698 Y186.05 E.0656
G1 X171.738 Y186.05 E.03184
G1 X173.136 Y184.651 E.0656
G1 X178.975 Y184.651 E.19369
G1 X180.374 Y186.05 E.0656
G1 X179.414 Y186.05 E.03184
G1 X180.812 Y184.651 E.0656
G1 X182.441 Y184.651 E.05401
G1 X185.904 Y184.429 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420718
G1 F15000
G1 X186.565 Y183.768 E.02877
G1 X186.565 Y183.234 E.01645
G1 X185.539 Y184.259 E.04465
G1 X185.005 Y184.259 E.01645
G1 X186.565 Y182.699 E.06791
G1 X186.565 Y182.165 E.01645
G1 X184.471 Y184.259 E.09117
G1 X183.936 Y184.259 E.01645
G1 X186.565 Y181.631 E.11443
G1 X186.565 Y181.097 E.01645
G1 X183.402 Y184.259 E.13769
G1 X182.868 Y184.259 E.01645
G1 X186.565 Y180.562 E.16095
G1 X186.565 Y180.028 E.01645
G1 X182.333 Y184.259 E.18422
G1 X181.799 Y184.259 E.01645
G1 X186.565 Y179.494 E.20748
G1 X186.565 Y178.959 E.01645
G1 X181.265 Y184.259 E.23074
G1 X180.731 Y184.259 E.01645
G1 X186.565 Y178.425 E.254
G1 X186.565 Y177.891 E.01645
G1 X180.196 Y184.259 E.27726
G1 X179.662 Y184.259 E.01645
G1 X186.565 Y177.357 E.30052
G1 X186.565 Y176.822 E.01645
G1 X179.128 Y184.259 E.32379
G1 X178.593 Y184.259 E.01645
G1 X186.565 Y176.288 E.34705
G1 X186.565 Y175.754 E.01645
G1 X178.059 Y184.259 E.37031
G1 X177.525 Y184.259 E.01645
G1 X186.565 Y175.219 E.39357
G1 X186.565 Y174.685 E.01645
G1 X176.991 Y184.259 E.41683
G1 X176.456 Y184.259 E.01645
G1 X186.565 Y174.151 E.44009
G1 X186.565 Y173.617 E.01645
G1 X175.922 Y184.259 E.46335
G1 X175.388 Y184.259 E.01645
G1 X186.565 Y173.082 E.48662
G1 X186.565 Y172.548 E.01645
G1 X174.853 Y184.259 E.50988
G1 X174.319 Y184.259 E.01645
G1 X186.565 Y172.014 E.53314
G1 X186.565 Y171.479 E.01645
G1 X173.785 Y184.259 E.5564
G1 X173.251 Y184.259 E.01645
G1 X186.565 Y170.945 E.57966
G1 X186.565 Y170.411 E.01645
G1 X172.716 Y184.259 E.60292
G1 X172.182 Y184.259 E.01645
G1 X186.565 Y169.877 E.62619
G1 X186.565 Y169.342 E.01645
G1 X171.648 Y184.259 E.64945
G1 X171.113 Y184.259 E.01645
G1 X186.565 Y168.808 E.67271
G1 X186.565 Y168.274 E.01645
G1 X170.579 Y184.259 E.69597
G1 X170.045 Y184.259 E.01645
G1 X186.565 Y167.739 E.71923
G1 X186.565 Y167.205 E.01645
G1 X169.511 Y184.259 E.74249
G1 X168.976 Y184.259 E.01645
G1 X186.565 Y166.671 E.76576
G1 X186.565 Y166.137 E.01645
G1 X168.442 Y184.259 E.78902
G1 X167.908 Y184.259 E.01645
G1 X186.565 Y165.602 E.81228
G1 X186.565 Y165.068 E.01645
G1 X167.373 Y184.259 E.83554
G1 X166.839 Y184.259 E.01645
G1 X186.565 Y164.534 E.8588
G1 X186.565 Y163.999 E.01645
G1 X166.305 Y184.259 E.88206
G1 X165.771 Y184.259 E.01645
G1 X186.565 Y163.465 E.90533
G1 X186.565 Y162.931 E.01645
G1 X165.236 Y184.259 E.92859
G1 X164.702 Y184.259 E.01645
G1 X186.565 Y162.397 E.95185
G1 X186.565 Y161.862 E.01645
G1 X164.168 Y184.259 E.97511
G1 X163.633 Y184.259 E.01645
G1 X186.565 Y161.328 E.99837
G1 X186.565 Y160.794 E.01645
G1 X163.099 Y184.259 E1.02163
G1 X162.565 Y184.259 E.01645
G1 X186.565 Y160.259 E1.04489
G1 X186.565 Y159.725 E.01645
G1 X162.031 Y184.259 E1.06816
G1 X161.496 Y184.259 E.01645
G1 X186.565 Y159.191 E1.09142
G1 X186.565 Y158.657 E.01645
G1 X160.962 Y184.259 E1.11468
G1 X160.428 Y184.259 E.01645
G1 X186.565 Y158.122 E1.13794
G1 X186.565 Y157.588 E.01645
G1 X159.893 Y184.259 E1.1612
G1 X159.359 Y184.259 E.01645
G1 X186.565 Y157.054 E1.18446
G1 X186.565 Y156.519 E.01645
G1 X158.825 Y184.259 E1.20773
G1 X158.291 Y184.259 E.01645
G1 X186.565 Y155.985 E1.23099
G1 X186.565 Y155.451 E.01645
G1 X157.756 Y184.259 E1.25425
G1 X157.222 Y184.259 E.01645
G1 X186.565 Y154.917 E1.27751
G1 X186.565 Y154.382 E.01645
G1 X156.688 Y184.259 E1.30077
G1 X156.153 Y184.259 E.01645
G1 X186.565 Y153.848 E1.32403
G1 X186.565 Y153.314 E.01645
G1 X155.619 Y184.259 E1.3473
G1 X155.085 Y184.259 E.01645
G1 X186.565 Y152.779 E1.37056
G1 X186.565 Y152.245 E.01645
G1 X154.551 Y184.259 E1.39382
G1 X154.016 Y184.259 E.01645
G1 X186.565 Y151.711 E1.41708
G1 X186.565 Y151.177 E.01645
G1 X153.482 Y184.259 E1.44034
G1 X152.948 Y184.259 E.01645
G1 X186.565 Y150.642 E1.4636
G1 X186.565 Y150.108 E.01645
G1 X152.413 Y184.259 E1.48686
G1 X151.879 Y184.259 E.01645
G1 X186.565 Y149.574 E1.51013
G1 X186.565 Y149.039 E.01645
G1 X151.345 Y184.259 E1.53339
G1 X150.811 Y184.259 E.01645
G1 X186.565 Y148.505 E1.55665
G1 X186.565 Y147.971 E.01645
G1 X150.276 Y184.259 E1.57991
G1 X149.742 Y184.259 E.01645
G1 X186.565 Y147.437 E1.60317
G1 X186.565 Y146.902 E.01645
G1 X149.208 Y184.259 E1.62643
G1 X148.759 Y184.259 E.01381
G1 X148.759 Y184.708 E.01381
G1 X147.402 Y186.065 E.05908
G1 X147.937 Y186.065 E.01645
G1 X148.759 Y185.242 E.03582
G1 X148.759 Y185.776 E.01645
G1 X148.301 Y186.234 E.01994
G1 X146.698 Y186.234 F30000
G1 F15000
G1 X186.565 Y146.368 E1.73569
G1 X186.565 Y145.834 E.01645
G1 X146.334 Y186.065 E1.75156
G1 X145.799 Y186.065 E.01645
G1 X186.565 Y145.299 E1.77482
G1 X186.565 Y144.765 E.01645
G1 X145.265 Y186.065 E1.79808
G1 X144.731 Y186.065 E.01645
G1 X186.565 Y144.231 E1.82135
G1 X186.565 Y143.697 E.01645
G1 X144.197 Y186.065 E1.84461
G1 X143.662 Y186.065 E.01645
G1 X186.565 Y143.162 E1.86787
G1 X186.565 Y142.628 E.01645
G1 X143.128 Y186.065 E1.89113
G1 X142.594 Y186.065 E.01645
G1 X186.565 Y142.094 E1.91439
G1 X186.565 Y141.559 E.01645
G1 X142.059 Y186.065 E1.93765
G1 X141.525 Y186.065 E.01645
G1 X186.565 Y141.025 E1.96092
G1 X186.565 Y140.491 E.01645
G1 X140.991 Y186.065 E1.98418
G1 X140.457 Y186.065 E.01645
G1 X186.565 Y139.957 E2.00744
G1 X186.565 Y139.422 E.01645
G1 X139.922 Y186.065 E2.0307
G1 X139.388 Y186.065 E.01645
G1 X186.565 Y138.888 E2.05396
G1 X186.565 Y138.354 E.01645
G1 X138.854 Y186.065 E2.07722
G1 X138.319 Y186.065 E.01645
G1 X186.565 Y137.819 E2.10049
G1 X186.565 Y137.285 E.01645
G1 X137.785 Y186.065 E2.12375
G1 X137.251 Y186.065 E.01645
G1 X186.565 Y136.751 E2.14701
G1 X186.565 Y136.217 E.01645
G1 X136.716 Y186.065 E2.17027
G1 X136.182 Y186.065 E.01645
G1 X186.565 Y135.682 E2.19353
G1 X186.565 Y135.148 E.01645
G1 X135.648 Y186.065 E2.21679
G1 X135.114 Y186.065 E.01645
G1 X186.565 Y134.614 E2.24006
G1 X186.565 Y134.079 E.01645
G1 X134.579 Y186.065 E2.26332
G1 X134.045 Y186.065 E.01645
G1 X186.565 Y133.545 E2.28658
G1 X186.565 Y133.011 E.01645
G1 X133.511 Y186.065 E2.30984
G1 X132.976 Y186.065 E.01645
G1 X186.565 Y132.477 E2.3331
G1 X186.565 Y131.942 E.01645
G1 X132.442 Y186.065 E2.35636
G1 X131.908 Y186.065 E.01645
G1 X186.565 Y131.408 E2.37962
G1 X186.565 Y130.874 E.01645
G1 X131.374 Y186.065 E2.40289
G1 X130.839 Y186.065 E.01645
G1 X186.565 Y130.339 E2.42615
G1 X186.565 Y129.805 E.01645
G1 X130.305 Y186.065 E2.44941
G1 X129.771 Y186.065 E.01645
G1 X186.565 Y129.271 E2.47267
G1 X186.565 Y128.736 E.01645
G1 X129.236 Y186.065 E2.49593
G1 X128.702 Y186.065 E.01645
G1 X186.565 Y128.202 E2.51919
G1 X186.565 Y127.668 E.01645
G1 X128.168 Y186.065 E2.54246
G1 X127.634 Y186.065 E.01645
G1 X186.565 Y127.134 E2.56572
M73 P64 R19
G1 X186.565 Y126.599 E.01645
G1 X127.099 Y186.065 E2.58898
G1 X126.565 Y186.065 E.01645
G1 X186.565 Y126.065 E2.61224
G1 X186.565 Y125.531 E.01645
G1 X126.031 Y186.065 E2.6355
G1 X125.496 Y186.065 E.01645
G1 X186.565 Y124.996 E2.65876
G1 X186.565 Y124.462 E.01645
G1 X124.962 Y186.065 E2.68203
G1 X124.428 Y186.065 E.01645
G1 X186.565 Y123.928 E2.70529
G1 X186.565 Y123.394 E.01645
G1 X123.894 Y186.065 E2.72855
G1 X123.359 Y186.065 E.01645
G1 X186.565 Y122.859 E2.75181
G1 X186.565 Y122.325 E.01645
G1 X122.825 Y186.065 E2.77507
G1 X122.291 Y186.065 E.01645
G1 X186.565 Y121.791 E2.79833
G1 X186.565 Y121.256 E.01645
G1 X121.756 Y186.065 E2.82159
G1 X121.222 Y186.065 E.01645
G1 X186.565 Y120.722 E2.84486
G1 X186.565 Y120.188 E.01645
G1 X120.688 Y186.065 E2.86812
G1 X120.154 Y186.065 E.01645
G1 X186.565 Y119.654 E2.89138
G1 X186.565 Y119.119 E.01645
G1 X119.619 Y186.065 E2.91464
G1 X119.085 Y186.065 E.01645
G1 X186.565 Y118.585 E2.9379
G1 X186.565 Y118.051 E.01645
G1 X118.551 Y186.065 E2.96116
G1 X118.016 Y186.065 E.01645
G1 X186.565 Y117.516 E2.98443
G1 X186.565 Y116.982 E.01645
G1 X117.482 Y186.065 E3.00769
G1 X116.948 Y186.065 E.01645
G1 X186.565 Y116.448 E3.03095
G1 X186.565 Y115.914 E.01645
G1 X116.414 Y186.065 E3.05421
G1 X115.879 Y186.065 E.01645
G1 X186.565 Y115.379 E3.07747
G1 X186.565 Y114.845 E.01645
G1 X115.345 Y186.065 E3.10073
G1 X114.811 Y186.065 E.01645
G1 X186.565 Y114.311 E3.124
G1 X186.565 Y113.776 E.01645
G1 X114.276 Y186.065 E3.14726
G1 X113.742 Y186.065 E.01645
G1 X186.565 Y113.242 E3.17052
G1 X186.565 Y112.708 E.01645
G1 X113.208 Y186.065 E3.19378
G1 X112.674 Y186.065 E.01645
G1 X128.803 Y169.935 E.70223
G1 X128.269 Y169.935 E.01645
G1 X112.139 Y186.065 E.70223
G1 X111.605 Y186.065 E.01645
G1 X127.734 Y169.935 E.70223
G1 X127.2 Y169.935 E.01645
G1 X111.071 Y186.065 E.70223
G1 X110.536 Y186.065 E.01645
G1 X126.666 Y169.935 E.70223
G1 X126.131 Y169.935 E.01645
G1 X110.002 Y186.065 E.70223
G1 X109.468 Y186.065 E.01645
G1 X125.597 Y169.935 E.70223
G1 X125.063 Y169.935 E.01645
G1 X108.934 Y186.065 E.70223
G1 X108.399 Y186.065 E.01645
G1 X124.529 Y169.935 E.70223
G1 X123.994 Y169.935 E.01645
G1 X107.865 Y186.065 E.70223
G1 X107.331 Y186.065 E.01645
G1 X123.46 Y169.935 E.70223
G1 X122.926 Y169.935 E.01645
G1 X106.796 Y186.065 E.70223
G1 X106.262 Y186.065 E.01645
G1 X122.391 Y169.935 E.70223
G1 X121.857 Y169.935 E.01645
G1 X105.728 Y186.065 E.70223
G1 X105.194 Y186.065 E.01645
G1 X121.323 Y169.935 E.70223
G1 X120.789 Y169.935 E.01645
G1 X104.659 Y186.065 E.70223
G1 X104.125 Y186.065 E.01645
G1 X120.254 Y169.935 E.70223
G1 X119.72 Y169.935 E.01645
G1 X103.591 Y186.065 E.70223
M73 P64 R18
G1 X103.056 Y186.065 E.01645
G1 X119.186 Y169.935 E.70223
G1 X118.651 Y169.935 E.01645
G1 X102.522 Y186.065 E.70223
G1 X101.988 Y186.065 E.01645
G1 X118.117 Y169.935 E.70223
G1 X117.583 Y169.935 E.01645
G1 X101.454 Y186.065 E.70223
G1 X100.919 Y186.065 E.01645
G1 X117.049 Y169.935 E.70223
G1 X116.514 Y169.935 E.01645
G1 X100.385 Y186.065 E.70223
G1 X99.851 Y186.065 E.01645
G1 X115.98 Y169.935 E.70223
G1 X115.446 Y169.935 E.01645
G1 X99.316 Y186.065 E.70223
G1 X98.782 Y186.065 E.01645
G1 X114.911 Y169.935 E.70223
G1 X114.377 Y169.935 E.01645
G1 X98.248 Y186.065 E.70223
G1 X97.714 Y186.065 E.01645
G1 X113.843 Y169.935 E.70223
G1 X113.309 Y169.935 E.01645
G1 X97.179 Y186.065 E.70223
G1 X96.645 Y186.065 E.01645
G1 X112.774 Y169.935 E.70223
G1 X112.24 Y169.935 E.01645
G1 X96.111 Y186.065 E.70223
G1 X95.576 Y186.065 E.01645
G1 X111.706 Y169.935 E.70223
G1 X111.171 Y169.935 E.01645
G1 X95.042 Y186.065 E.70223
G1 X94.508 Y186.065 E.01645
G1 X110.637 Y169.935 E.70223
G1 X110.103 Y169.935 E.01645
G1 X93.974 Y186.065 E.70223
G1 X93.439 Y186.065 E.01645
G1 X109.569 Y169.935 E.70223
G1 X109.034 Y169.935 E.01645
G1 X92.905 Y186.065 E.70223
G1 X92.371 Y186.065 E.01645
G1 X108.5 Y169.935 E.70223
G1 X107.966 Y169.935 E.01645
G1 X91.836 Y186.065 E.70223
G1 X91.302 Y186.065 E.01645
G1 X107.431 Y169.935 E.70223
G1 X106.897 Y169.935 E.01645
G1 X90.768 Y186.065 E.70223
G1 X90.234 Y186.065 E.01645
G1 X106.363 Y169.935 E.70223
G1 X105.829 Y169.935 E.01645
G1 X89.699 Y186.065 E.70223
G1 X89.165 Y186.065 E.01645
G1 X105.294 Y169.935 E.70223
G1 X104.76 Y169.935 E.01645
G1 X88.631 Y186.065 E.70223
G1 X88.096 Y186.065 E.01645
G1 X104.226 Y169.935 E.70223
G1 X103.691 Y169.935 E.01645
G1 X87.562 Y186.065 E.70223
G1 X87.028 Y186.065 E.01645
G1 X103.157 Y169.935 E.70223
G1 X102.623 Y169.935 E.01645
G1 X86.494 Y186.065 E.70223
G1 X85.959 Y186.065 E.01645
G1 X102.089 Y169.935 E.70223
G1 X101.554 Y169.935 E.01645
G1 X85.425 Y186.065 E.70223
G1 X84.891 Y186.065 E.01645
G1 X101.02 Y169.935 E.70223
G1 X100.486 Y169.935 E.01645
G1 X84.356 Y186.065 E.70223
G1 X83.822 Y186.065 E.01645
G1 X99.951 Y169.935 E.70223
G1 X99.417 Y169.935 E.01645
G1 X83.288 Y186.065 E.70223
G1 X82.753 Y186.065 E.01645
G1 X98.883 Y169.935 E.70223
G1 X98.349 Y169.935 E.01645
G1 X82.219 Y186.065 E.70223
G1 X81.685 Y186.065 E.01645
G1 X97.814 Y169.935 E.70223
G1 X97.28 Y169.935 E.01645
G1 X81.151 Y186.065 E.70223
G1 X80.616 Y186.065 E.01645
G1 X96.746 Y169.935 E.70223
G1 X96.211 Y169.935 E.01645
G1 X80.082 Y186.065 E.70223
G1 X79.548 Y186.065 E.01645
G1 X95.677 Y169.935 E.70223
G1 X95.143 Y169.935 E.01645
G1 X79.013 Y186.065 E.70223
G1 X78.479 Y186.065 E.01645
G1 X94.609 Y169.935 E.70223
G1 X94.074 Y169.935 E.01645
G1 X77.945 Y186.065 E.70223
G1 X77.411 Y186.065 E.01645
G1 X93.54 Y169.935 E.70223
G1 X93.006 Y169.935 E.01645
G1 X76.876 Y186.065 E.70223
G1 X76.342 Y186.065 E.01645
G1 X92.471 Y169.935 E.70223
G1 X91.937 Y169.935 E.01645
G1 X75.808 Y186.065 E.70223
G1 X75.273 Y186.065 E.01645
G1 X91.403 Y169.935 E.70223
G1 X90.869 Y169.935 E.01645
G1 X74.739 Y186.065 E.70223
G1 X74.205 Y186.065 E.01645
G1 X90.334 Y169.935 E.70223
G1 X89.8 Y169.935 E.01645
G1 X73.671 Y186.065 E.70223
G1 X73.435 Y186.065 E.00724
G1 X73.435 Y185.766 E.00921
G1 X89.266 Y169.935 E.68921
G1 X88.731 Y169.935 E.01645
G1 X73.435 Y185.231 E.66595
G1 X73.435 Y184.697 E.01645
G1 X88.197 Y169.935 E.64269
G1 X87.663 Y169.935 E.01645
G1 X73.435 Y184.163 E.61943
G1 X73.435 Y183.628 E.01645
G1 X87.128 Y169.935 E.59617
G1 X86.594 Y169.935 E.01645
G1 X73.435 Y183.094 E.57291
G1 X73.435 Y182.56 E.01645
G1 X86.06 Y169.935 E.54964
G1 X85.526 Y169.935 E.01645
G1 X73.435 Y182.026 E.52638
G1 X73.435 Y181.491 E.01645
G1 X84.991 Y169.935 E.50312
G1 X84.457 Y169.935 E.01645
G1 X73.435 Y180.957 E.47986
G1 X73.435 Y180.423 E.01645
G1 X83.923 Y169.935 E.4566
G1 X83.388 Y169.935 E.01645
G1 X73.435 Y179.888 E.43334
G1 X73.435 Y179.354 E.01645
G1 X82.854 Y169.935 E.41007
G1 X82.32 Y169.935 E.01645
G1 X73.435 Y178.82 E.38681
G1 X73.435 Y178.286 E.01645
G1 X81.786 Y169.935 E.36355
G1 X81.251 Y169.935 E.01645
G1 X73.435 Y177.751 E.34029
G1 X73.435 Y177.217 E.01645
G1 X80.717 Y169.935 E.31703
G1 X80.183 Y169.935 E.01645
G1 X73.435 Y176.683 E.29377
G1 X73.435 Y176.148 E.01645
G1 X79.648 Y169.935 E.2705
G1 X79.114 Y169.935 E.01645
G1 X73.435 Y175.614 E.24724
G1 X73.435 Y175.08 E.01645
G1 X78.58 Y169.935 E.22398
G1 X78.565 Y169.935 E.00047
G1 X78.565 Y169.416 E.01598
G1 X73.435 Y174.546 E.22332
G1 X73.435 Y174.011 E.01645
G1 X78.565 Y168.882 E.22332
G1 X78.565 Y168.348 E.01645
G1 X73.435 Y173.477 E.22332
G1 X73.435 Y172.943 E.01645
G1 X78.565 Y167.813 E.22332
G1 X78.565 Y167.279 E.01645
G1 X73.435 Y172.408 E.22332
G1 X73.435 Y171.874 E.01645
G1 X78.565 Y166.745 E.22332
G1 X78.565 Y166.211 E.01645
G1 X73.435 Y171.34 E.22332
G1 X73.435 Y170.806 E.01645
G1 X78.565 Y165.676 E.22332
G1 X78.565 Y165.142 E.01645
G1 X73.435 Y170.271 E.22332
G1 X73.435 Y169.737 E.01645
G1 X78.565 Y164.608 E.22332
G1 X78.565 Y164.073 E.01645
G1 X73.435 Y169.203 E.22332
G1 X73.435 Y168.668 E.01645
G1 X78.565 Y163.539 E.22332
G1 X78.565 Y163.005 E.01645
G1 X73.435 Y168.134 E.22332
G1 X73.435 Y167.6 E.01645
G1 X78.565 Y162.471 E.22332
G1 X78.565 Y161.936 E.01645
G1 X73.435 Y167.066 E.22332
G1 X73.435 Y166.531 E.01645
G1 X78.565 Y161.402 E.22332
G1 X78.565 Y160.868 E.01645
G1 X73.435 Y165.997 E.22332
G1 X73.435 Y165.463 E.01645
G1 X78.565 Y160.333 E.22332
G1 X78.565 Y159.799 E.01645
G1 X73.435 Y164.928 E.22332
G1 X73.435 Y164.394 E.01645
G1 X78.565 Y159.265 E.22332
G1 X78.565 Y158.731 E.01645
G1 X73.435 Y163.86 E.22332
G1 X73.435 Y163.326 E.01645
G1 X78.565 Y158.196 E.22332
G1 X78.565 Y157.662 E.01645
G1 X73.435 Y162.791 E.22332
G1 X73.435 Y162.257 E.01645
G1 X78.565 Y157.128 E.22332
G1 X78.565 Y156.593 E.01645
G1 X73.435 Y161.723 E.22332
G1 X73.435 Y161.188 E.01645
G1 X78.565 Y156.059 E.22332
G1 X78.565 Y155.525 E.01645
G1 X73.435 Y160.654 E.22332
G1 X73.435 Y160.12 E.01645
G1 X78.565 Y154.991 E.22332
G1 X78.565 Y154.456 E.01645
G1 X73.435 Y159.586 E.22332
G1 X73.435 Y159.051 E.01645
G1 X78.565 Y153.922 E.22332
G1 X78.565 Y153.388 E.01645
G1 X73.435 Y158.517 E.22332
G1 X73.435 Y157.983 E.01645
G1 X78.565 Y152.853 E.22332
G1 X78.565 Y152.319 E.01645
G1 X73.435 Y157.448 E.22332
G1 X73.435 Y156.914 E.01645
G1 X78.565 Y151.785 E.22332
G1 X78.565 Y151.251 E.01645
G1 X73.435 Y156.38 E.22332
G1 X73.435 Y155.846 E.01645
G1 X78.565 Y150.716 E.22332
G1 X78.565 Y150.182 E.01645
G1 X73.435 Y155.311 E.22332
G1 X73.435 Y154.777 E.01645
G1 X78.565 Y149.648 E.22332
G1 X78.565 Y149.113 E.01645
M73 P65 R18
G1 X73.435 Y154.243 E.22332
G1 X73.435 Y153.708 E.01645
G1 X78.565 Y148.579 E.22332
G1 X78.565 Y148.045 E.01645
G1 X73.435 Y153.174 E.22332
G1 X73.435 Y152.64 E.01645
G1 X78.565 Y147.511 E.22332
G1 X78.565 Y146.976 E.01645
G1 X73.435 Y152.106 E.22332
G1 X73.435 Y151.571 E.01645
G1 X78.565 Y146.442 E.22332
G1 X78.565 Y145.908 E.01645
G1 X73.435 Y151.037 E.22332
G1 X73.435 Y150.503 E.01645
G1 X78.565 Y145.373 E.22332
G1 X78.565 Y144.839 E.01645
G1 X73.435 Y149.968 E.22332
G1 X73.435 Y149.434 E.01645
G1 X78.565 Y144.305 E.22332
G1 X78.565 Y143.771 E.01645
G1 X73.435 Y148.9 E.22332
G1 X73.435 Y148.366 E.01645
G1 X78.565 Y143.236 E.22332
G1 X78.565 Y142.702 E.01645
G1 X73.435 Y147.831 E.22332
G1 X73.435 Y147.297 E.01645
G1 X78.565 Y142.168 E.22332
G1 X78.565 Y141.633 E.01645
G1 X73.435 Y146.763 E.22332
G1 X73.435 Y146.228 E.01645
G1 X78.565 Y141.099 E.22332
G1 X78.565 Y140.565 E.01645
G1 X73.435 Y145.694 E.22332
G1 X73.435 Y145.16 E.01645
G1 X78.565 Y140.031 E.22332
G1 X78.565 Y139.496 E.01645
G1 X73.435 Y144.626 E.22332
G1 X73.435 Y144.091 E.01645
G1 X78.565 Y138.962 E.22332
G1 X78.565 Y138.428 E.01645
G1 X73.435 Y143.557 E.22332
G1 X73.435 Y143.023 E.01645
G1 X78.565 Y137.893 E.22332
G1 X78.565 Y137.359 E.01645
G1 X73.435 Y142.488 E.22332
G1 X73.435 Y141.954 E.01645
G1 X78.565 Y136.825 E.22332
G1 X78.565 Y136.291 E.01645
G1 X73.435 Y141.42 E.22332
G1 X73.435 Y140.886 E.01645
G1 X78.565 Y135.756 E.22332
G1 X78.565 Y135.222 E.01645
G1 X73.435 Y140.351 E.22332
G1 X73.435 Y139.817 E.01645
G1 X78.565 Y134.688 E.22332
G1 X78.565 Y134.153 E.01645
G1 X73.435 Y139.283 E.22332
G1 X73.435 Y138.748 E.01645
G1 X78.565 Y133.619 E.22332
G1 X78.565 Y133.085 E.01645
G1 X73.435 Y138.214 E.22332
G1 X73.435 Y137.68 E.01645
G1 X78.565 Y132.551 E.22332
G1 X78.565 Y132.016 E.01645
G1 X73.435 Y137.146 E.22332
G1 X73.435 Y136.611 E.01645
G1 X78.565 Y131.482 E.22332
G1 X78.565 Y130.948 E.01645
G1 X73.435 Y136.077 E.22332
G1 X73.435 Y135.543 E.01645
G1 X78.565 Y130.413 E.22332
G1 X78.565 Y129.879 E.01645
G1 X73.435 Y135.008 E.22332
G1 X73.435 Y134.474 E.01645
G1 X78.565 Y129.345 E.22332
G1 X78.565 Y128.81 E.01645
G1 X73.435 Y133.94 E.22332
G1 X73.435 Y133.406 E.01645
G1 X78.565 Y128.276 E.22332
G1 X78.565 Y127.742 E.01645
G1 X73.435 Y132.871 E.22332
G1 X73.435 Y132.337 E.01645
G1 X78.565 Y127.208 E.22332
G1 X78.565 Y126.673 E.01645
G1 X73.435 Y131.803 E.22332
G1 X73.435 Y131.268 E.01645
G1 X78.565 Y126.139 E.22332
G1 X78.565 Y125.605 E.01645
G1 X73.435 Y130.734 E.22332
G1 X73.435 Y130.2 E.01645
G1 X78.565 Y125.07 E.22332
G1 X78.565 Y124.536 E.01645
G1 X73.435 Y129.666 E.22332
G1 X73.435 Y129.131 E.01645
G1 X78.565 Y124.002 E.22332
G1 X78.565 Y123.468 E.01645
G1 X73.435 Y128.597 E.22332
G1 X73.435 Y128.063 E.01645
G1 X78.565 Y122.933 E.22332
G1 X78.565 Y122.399 E.01645
G1 X73.435 Y127.528 E.22332
G1 X73.435 Y126.994 E.01645
G1 X78.565 Y121.865 E.22332
G1 X78.565 Y121.33 E.01645
G1 X73.435 Y126.46 E.22332
G1 X73.435 Y125.926 E.01645
G1 X78.565 Y120.796 E.22332
G1 X78.565 Y120.262 E.01645
G1 X73.435 Y125.391 E.22332
G1 X73.435 Y124.857 E.01645
G1 X78.565 Y119.728 E.22332
G1 X78.565 Y119.193 E.01645
G1 X73.435 Y124.323 E.22332
G1 X73.435 Y123.788 E.01645
G1 X78.565 Y118.659 E.22332
G1 X78.565 Y118.125 E.01645
G1 X73.435 Y123.254 E.22332
G1 X73.435 Y122.72 E.01645
G1 X78.565 Y117.59 E.22332
G1 X78.565 Y117.056 E.01645
G1 X73.435 Y122.185 E.22332
G1 X73.435 Y121.651 E.01645
G1 X78.565 Y116.522 E.22332
G1 X78.565 Y115.988 E.01645
G1 X73.435 Y121.117 E.22332
G1 X73.435 Y120.583 E.01645
G1 X78.565 Y115.453 E.22332
G1 X78.565 Y114.919 E.01645
G1 X73.435 Y120.048 E.22332
G1 X73.435 Y119.514 E.01645
G1 X78.565 Y114.385 E.22332
G1 X78.565 Y113.85 E.01645
G1 X73.435 Y118.98 E.22332
G1 X73.435 Y118.445 E.01645
G1 X78.565 Y113.316 E.22332
G1 X78.565 Y112.782 E.01645
G1 X73.435 Y117.911 E.22332
G1 X73.435 Y117.377 E.01645
G1 X78.565 Y112.248 E.22332
G1 X78.565 Y111.713 E.01645
G1 X73.435 Y116.843 E.22332
G1 X73.435 Y116.308 E.01645
G1 X78.565 Y111.179 E.22332
G1 X78.565 Y110.645 E.01645
G1 X73.435 Y115.774 E.22332
G1 X73.435 Y115.24 E.01645
G1 X78.565 Y110.11 E.22332
G1 X78.565 Y109.576 E.01645
G1 X73.435 Y114.705 E.22332
G1 X73.435 Y114.171 E.01645
G1 X78.565 Y109.042 E.22332
G1 X78.565 Y108.508 E.01645
G1 X73.435 Y113.637 E.22332
G1 X73.435 Y113.103 E.01645
G1 X78.565 Y107.973 E.22332
G1 X78.565 Y107.439 E.01645
G1 X73.435 Y112.568 E.22332
G1 X73.435 Y112.034 E.01645
G1 X78.565 Y106.905 E.22332
G1 X78.565 Y106.37 E.01645
G1 X73.435 Y111.5 E.22332
G1 X73.435 Y110.965 E.01645
G1 X78.565 Y105.836 E.22332
G1 X78.565 Y105.302 E.01645
G1 X73.435 Y110.431 E.22332
G1 X73.435 Y109.897 E.01645
G1 X78.565 Y104.768 E.22332
G1 X78.565 Y104.233 E.01645
G1 X73.435 Y109.363 E.22332
G1 X73.435 Y108.828 E.01645
G1 X78.565 Y103.699 E.22332
G1 X78.565 Y103.165 E.01645
G1 X73.435 Y108.294 E.22332
G1 X73.435 Y107.76 E.01645
G1 X78.565 Y102.63 E.22332
G1 X78.565 Y102.096 E.01645
G1 X73.435 Y107.225 E.22332
G1 X73.435 Y106.691 E.01645
G1 X78.565 Y101.562 E.22332
G1 X78.565 Y101.028 E.01645
G1 X73.435 Y106.157 E.22332
G1 X73.435 Y105.623 E.01645
G1 X78.565 Y100.493 E.22332
G1 X78.565 Y99.959 E.01645
G1 X73.435 Y105.088 E.22332
G1 X73.435 Y104.554 E.01645
G1 X78.565 Y99.425 E.22332
G1 X78.565 Y98.89 E.01645
G1 X73.435 Y104.02 E.22332
G1 X73.435 Y103.485 E.01645
G1 X78.565 Y98.356 E.22332
G1 X78.565 Y97.822 E.01645
G1 X73.435 Y102.951 E.22332
G1 X73.435 Y102.417 E.01645
G1 X78.565 Y97.288 E.22332
G1 X78.565 Y96.753 E.01645
G1 X73.435 Y101.883 E.22332
G1 X73.435 Y101.348 E.01645
G1 X78.565 Y96.219 E.22332
G1 X78.565 Y95.685 E.01645
G1 X73.435 Y100.814 E.22332
G1 X73.435 Y100.28 E.01645
G1 X78.565 Y95.15 E.22332
G1 X78.565 Y94.616 E.01645
G1 X73.435 Y99.745 E.22332
G1 X73.435 Y99.211 E.01645
G1 X78.565 Y94.082 E.22332
G1 X78.565 Y93.548 E.01645
G1 X73.435 Y98.677 E.22332
G1 X73.435 Y98.143 E.01645
G1 X78.565 Y93.013 E.22332
G1 X78.565 Y92.479 E.01645
G1 X73.435 Y97.608 E.22332
G1 X73.435 Y97.074 E.01645
G1 X78.565 Y91.945 E.22332
G1 X78.565 Y91.41 E.01645
G1 X73.435 Y96.54 E.22332
G1 X73.435 Y96.005 E.01645
G1 X78.565 Y90.876 E.22332
G1 X78.565 Y90.342 E.01645
G1 X73.435 Y95.471 E.22332
G1 X73.435 Y94.937 E.01645
G1 X78.565 Y89.808 E.22332
G1 X78.565 Y89.273 E.01645
G1 X73.435 Y94.403 E.22332
G1 X73.435 Y93.868 E.01645
G1 X78.734 Y88.569 E.23071
G1 X151.298 Y69.95 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X149.67 Y69.95 E.05401
G1 X149.151 Y70.469 E.02432
G1 X149.151 Y70.392 E.00256
G1 X150.108 Y71.349 E.0449
G1 X155.947 Y71.349 E.19369
G1 X157.346 Y69.95 E.0656
G1 X156.386 Y69.95 E.03184
G1 X157.784 Y71.349 E.0656
G1 X163.623 Y71.349 E.19369
G1 X165.022 Y69.95 E.0656
G1 X164.062 Y69.95 E.03184
G1 X165.46 Y71.349 E.0656
G1 X171.299 Y71.349 E.19369
G1 X172.698 Y69.95 E.0656
G1 X171.738 Y69.95 E.03184
G1 X173.136 Y71.349 E.0656
G1 X178.975 Y71.349 E.19369
G1 X180.374 Y69.95 E.0656
G1 X179.414 Y69.95 E.03184
G1 X180.812 Y71.349 E.0656
G1 X182.441 Y71.349 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X180.812 Y71.349 E-.61876
G1 X180.549 Y71.086 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/125
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
G3 Z5.2 I-1.076 J-.568 P1  F30000
G1 X128.71 Y169.21 Z5.2
G1 Z5
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X79.29 Y169.21 E1.51854
G1 X79.29 Y88.79 E2.47108
G1 X128.71 Y88.79 E1.51854
G1 X128.71 Y169.15 E2.46924
M204 S10000
; WIPE_START
G1 F24000
G1 X126.71 Y169.152 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.189 J.261 P1  F30000
G1 X148.578 Y69.602 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X186.898 Y69.602 E1.27115
G1 X186.898 Y71.922 E.07696
G1 X148.578 Y71.922 E1.27115
G1 X148.578 Y69.662 E.07497
; WIPE_START
G1 F24000
G1 X150.578 Y69.659 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.217 J-.021 P1  F30000
G1 X148.578 Y184.078 Z5.4
G1 Z5
G1 E.8 F1800
G1 F15476.087
G1 X186.898 Y184.078 E1.27115
G1 X186.898 Y186.398 E.07696
G1 X148.578 Y186.398 E1.27115
G1 X148.578 Y184.138 E.07497
; WIPE_START
G1 F24000
G1 X150.578 Y184.135 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.007 J-.683 P1  F30000
G1 X72.71 Y69.21 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X187.29 Y69.21 E3.52072
G1 X187.29 Y186.79 E3.61291
G1 X72.71 Y186.79 E3.52072
G1 X72.71 Y69.27 E3.61106
M204 S10000
; WIPE_START
G1 F24000
G1 X74.71 Y69.269 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.011 J1.217 P1  F30000
G1 X151.298 Y69.95 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X149.67 Y69.95 E.05401
G1 X148.926 Y70.694 E.03489
G1 X148.926 Y70.166 E.01751
G1 X150.334 Y71.574 E.06603
G1 X155.722 Y71.574 E.17875
G1 X157.346 Y69.95 E.07617
G1 X156.386 Y69.95 E.03184
G1 X158.01 Y71.574 E.07617
G1 X163.398 Y71.574 E.17875
G1 X165.022 Y69.95 E.07617
G1 X164.062 Y69.95 E.03184
G1 X165.686 Y71.574 E.07617
G1 X171.074 Y71.574 E.17875
G1 X172.698 Y69.95 E.07617
G1 X171.738 Y69.95 E.03184
G1 X173.362 Y71.574 E.07617
G1 X178.75 Y71.574 E.17875
G1 X180.374 Y69.95 E.07617
G1 X179.414 Y69.95 E.03184
G1 X181.037 Y71.574 E.07617
G1 X182.666 Y71.574 E.05401
G1 X186.398 Y72.145 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X187.083 Y72.829 E.02975
G1 X187.083 Y73.363
G1 X185.865 Y72.145 E.05293
G1 X185.331 Y72.145
G1 X187.083 Y73.896 E.0761
G1 X187.083 Y74.429
G1 X184.798 Y72.145 E.09927
G1 X184.265 Y72.145
G1 X187.083 Y74.962 E.12245
G1 X187.083 Y75.496
G1 X183.732 Y72.145 E.14562
G1 X183.198 Y72.145
G1 X187.083 Y76.029 E.16879
G1 X187.083 Y76.562
G1 X182.665 Y72.145 E.19196
G1 X182.132 Y72.145
G1 X187.083 Y77.095 E.21514
G1 X187.083 Y77.629
G1 X181.599 Y72.145 E.23831
G1 X181.065 Y72.145
G1 X187.083 Y78.162 E.26148
G1 X187.083 Y78.695
G1 X180.532 Y72.145 E.28466
G1 X179.999 Y72.145
G1 X187.083 Y79.229 E.30783
G1 X187.083 Y79.762
G1 X179.465 Y72.145 E.331
G1 X178.932 Y72.145
G1 X187.083 Y80.295 E.35418
G1 X187.083 Y80.828
G1 X178.399 Y72.145 E.37735
G1 X177.866 Y72.145
G1 X187.083 Y81.362 E.40052
G1 X187.083 Y81.895
G1 X177.332 Y72.145 E.4237
G1 X176.799 Y72.145
G1 X187.083 Y82.428 E.44687
G1 X187.083 Y82.961
G1 X176.266 Y72.145 E.47004
G1 X175.733 Y72.145
G1 X187.083 Y83.495 E.49322
G1 X187.083 Y84.028
G1 X175.199 Y72.145 E.51639
G1 X174.666 Y72.145
G1 X187.083 Y84.561 E.53956
G1 X187.083 Y85.095
G1 X174.133 Y72.145 E.56274
G1 X173.599 Y72.145
G1 X187.083 Y85.628 E.58591
G1 X187.083 Y86.161
G1 X173.066 Y72.145 E.60908
G1 X172.533 Y72.145
G1 X187.083 Y86.694 E.63225
G1 X187.083 Y87.228
G1 X172 Y72.145 E.65543
G1 X171.466 Y72.145
G1 X187.083 Y87.761 E.6786
G1 X187.083 Y88.294
G1 X170.933 Y72.145 E.70177
G1 X170.4 Y72.145
G1 X187.083 Y88.827 E.72495
G1 X187.083 Y89.361
G1 X169.867 Y72.145 E.74812
G1 X169.333 Y72.145
G1 X187.083 Y89.894 E.77129
G1 X187.083 Y90.427
G1 X168.8 Y72.145 E.79447
G1 X168.267 Y72.145
G1 X187.083 Y90.96 E.81764
G1 X187.083 Y91.494
G1 X167.733 Y72.145 E.84081
G1 X167.2 Y72.145
G1 X187.083 Y92.027 E.86399
G1 X187.083 Y92.56
G1 X166.667 Y72.145 E.88716
G1 X166.134 Y72.145
G1 X187.083 Y93.094 E.91033
G1 X187.083 Y93.627
G1 X165.6 Y72.145 E.93351
G1 X165.067 Y72.145
G1 X187.083 Y94.16 E.95668
G1 X187.083 Y94.693
G1 X164.534 Y72.145 E.97985
G1 X164.001 Y72.145
G1 X187.083 Y95.227 E1.00303
G1 X187.083 Y95.76
G1 X163.467 Y72.145 E1.0262
G1 X162.934 Y72.145
G1 X187.083 Y96.293 E1.04937
G1 X187.083 Y96.826
G1 X162.401 Y72.145 E1.07255
G1 X161.868 Y72.145
G1 X187.083 Y97.36 E1.09572
G1 X187.083 Y97.893
G1 X161.334 Y72.145 E1.11889
G1 X160.801 Y72.145
G1 X187.083 Y98.426 E1.14206
G1 X187.083 Y98.96
G1 X160.268 Y72.145 E1.16524
G1 X159.734 Y72.145
G1 X187.083 Y99.493 E1.18841
G1 X187.083 Y100.026
G1 X159.201 Y72.145 E1.21158
G1 X158.668 Y72.145
G1 X187.083 Y100.559 E1.23476
G1 X187.083 Y101.093
G1 X158.135 Y72.145 E1.25793
G1 X157.601 Y72.145
G1 X187.083 Y101.626 E1.2811
G1 X187.083 Y102.159
G1 X157.068 Y72.145 E1.30428
G1 X156.535 Y72.145
G1 X187.083 Y102.692 E1.32745
G1 X187.083 Y103.226
G1 X156.002 Y72.145 E1.35062
G1 X155.468 Y72.145
G1 X187.083 Y103.759 E1.3738
G1 X187.083 Y104.292
G1 X154.935 Y72.145 E1.39697
G1 X154.402 Y72.145
G1 X187.083 Y104.826 E1.42014
G1 X187.083 Y105.359
G1 X153.868 Y72.145 E1.44332
G1 X153.335 Y72.145
G1 X187.083 Y105.892 E1.46649
G1 X187.083 Y106.425
G1 X152.802 Y72.145 E1.48966
G1 X152.269 Y72.145
G1 X187.083 Y106.959 E1.51284
G1 X187.083 Y107.492
G1 X151.735 Y72.145 E1.53601
G1 X151.202 Y72.145
G1 X187.083 Y108.025 E1.55918
G1 X187.083 Y108.558
G1 X150.669 Y72.145 E1.58236
G1 X150.136 Y72.145
G1 X187.083 Y109.092 E1.60553
G1 X187.083 Y109.625
G1 X149.602 Y72.145 E1.6287
G1 X149.069 Y72.145
G1 X187.083 Y110.158 E1.65187
G1 X187.083 Y110.691
G1 X148.536 Y72.145 E1.67505
M204 S10000
G1 X148.355 Y69.831 F30000
M204 S2000
G1 F12000
G1 X147.942 Y69.417 E.01798
G1 X147.408 Y69.417
G1 X148.355 Y70.364 E.04115
G1 X148.355 Y70.898
G1 X146.875 Y69.417 E.06433
G1 X146.342 Y69.417
G1 X148.355 Y71.431 E.0875
G1 X148.355 Y71.964
G1 X145.809 Y69.417 E.11067
G1 X145.275 Y69.417
G1 X187.083 Y111.225 E1.81673
G1 X187.083 Y111.758
G1 X144.742 Y69.417 E1.83991
G1 X144.209 Y69.417
G1 X187.083 Y112.291 E1.86308
G1 X187.083 Y112.825
G1 X143.675 Y69.417 E1.88625
G1 X143.142 Y69.417
G1 X187.083 Y113.358 E1.90942
G1 X187.083 Y113.891
G1 X142.609 Y69.417 E1.9326
G1 X142.076 Y69.417
G1 X187.083 Y114.424 E1.95577
G1 X187.083 Y114.958
G1 X141.542 Y69.417 E1.97894
G1 X141.009 Y69.417
G1 X187.083 Y115.491 E2.00212
G1 X187.083 Y116.024
G1 X140.476 Y69.417 E2.02529
G1 X139.943 Y69.417
G1 X187.083 Y116.557 E2.04846
G1 X187.083 Y117.091
G1 X139.409 Y69.417 E2.07164
G1 X138.876 Y69.417
G1 X187.083 Y117.624 E2.09481
G1 X187.083 Y118.157
M73 P66 R18
G1 X138.343 Y69.417 E2.11798
G1 X137.809 Y69.417
G1 X187.083 Y118.691 E2.14116
G1 X187.083 Y119.224
G1 X137.276 Y69.417 E2.16433
G1 X136.743 Y69.417
G1 X187.083 Y119.757 E2.1875
G1 X187.083 Y120.29
G1 X136.21 Y69.417 E2.21068
G1 X135.676 Y69.417
G1 X187.083 Y120.824 E2.23385
G1 X187.083 Y121.357
G1 X135.143 Y69.417 E2.25702
G1 X134.61 Y69.417
G1 X187.083 Y121.89 E2.2802
G1 X187.083 Y122.423
G1 X134.077 Y69.417 E2.30337
G1 X133.543 Y69.417
G1 X187.083 Y122.957 E2.32654
G1 X187.083 Y123.49
G1 X133.01 Y69.417 E2.34972
G1 X132.477 Y69.417
G1 X187.083 Y124.023 E2.37289
G1 X187.083 Y124.557
G1 X131.943 Y69.417 E2.39606
G1 X131.41 Y69.417
G1 X187.083 Y125.09 E2.41923
G1 X187.083 Y125.623
G1 X130.877 Y69.417 E2.44241
G1 X130.344 Y69.417
G1 X187.083 Y126.156 E2.46558
G1 X187.083 Y126.69
G1 X129.81 Y69.417 E2.48875
G1 X129.277 Y69.417
G1 X187.083 Y127.223 E2.51193
G1 X187.083 Y127.756
G1 X128.744 Y69.417 E2.5351
G1 X128.211 Y69.417
G1 X187.083 Y128.289 E2.55827
G1 X187.083 Y128.823
G1 X127.677 Y69.417 E2.58145
G1 X127.144 Y69.417
G1 X187.083 Y129.356 E2.60462
G1 X187.083 Y129.889
G1 X126.611 Y69.417 E2.62779
G1 X126.078 Y69.417
G1 X187.083 Y130.422 E2.65097
G1 X187.083 Y130.956
G1 X125.544 Y69.417 E2.67414
G1 X125.011 Y69.417
G1 X187.083 Y131.489 E2.69731
G1 X187.083 Y132.022
G1 X124.478 Y69.417 E2.72049
G1 X123.944 Y69.417
G1 X187.083 Y132.556 E2.74366
G1 X187.083 Y133.089
G1 X123.411 Y69.417 E2.76683
G1 X122.878 Y69.417
G1 X187.083 Y133.622 E2.79001
G1 X187.083 Y134.155
G1 X122.345 Y69.417 E2.81318
G1 X121.811 Y69.417
G1 X187.083 Y134.689 E2.83635
G1 X187.083 Y135.222
G1 X121.278 Y69.417 E2.85952
M73 P66 R17
G1 X120.745 Y69.417
G1 X187.083 Y135.755 E2.8827
G1 X187.083 Y136.288
G1 X120.212 Y69.417 E2.90587
G1 X119.678 Y69.417
G1 X187.083 Y136.822 E2.92904
G1 X187.083 Y137.355
G1 X119.145 Y69.417 E2.95222
G1 X118.612 Y69.417
G1 X187.083 Y137.888 E2.97539
G1 X187.083 Y138.422
G1 X118.078 Y69.417 E2.99856
G1 X117.545 Y69.417
G1 X187.083 Y138.955 E3.02174
G1 X187.083 Y139.488
G1 X117.012 Y69.417 E3.04491
G1 X116.479 Y69.417
G1 X187.083 Y140.021 E3.06808
G1 X187.083 Y140.555
G1 X115.945 Y69.417 E3.09126
G1 X115.412 Y69.417
G1 X187.083 Y141.088 E3.11443
G1 X187.083 Y141.621
G1 X114.879 Y69.417 E3.1376
G1 X114.346 Y69.417
G1 X187.083 Y142.154 E3.16078
G1 X187.083 Y142.688
G1 X113.812 Y69.417 E3.18395
G1 X113.279 Y69.417
G1 X187.083 Y143.221 E3.20712
G1 X187.083 Y143.754
G1 X130.468 Y87.14 E2.46017
G1 X130.36 Y87.032
G1 X112.746 Y69.417 E.76543
G1 X112.212 Y69.417
G1 X187.083 Y144.288 E3.25347
G1 X187.083 Y144.821
G1 X111.679 Y69.417 E3.27664
G1 X111.146 Y69.417
G1 X187.083 Y145.354 E3.29982
G1 X187.083 Y145.887
G1 X110.613 Y69.417 E3.32299
G1 X110.079 Y69.417
G1 X187.083 Y146.421 E3.34616
G1 X187.083 Y146.954
G1 X128.917 Y88.789 E2.52756
G1 X128.917 Y89.322
G1 X187.083 Y147.487 E2.52756
G1 X187.083 Y148.02
G1 X128.917 Y89.855 E2.52756
G1 X128.917 Y90.388
G1 X187.083 Y148.554 E2.52756
G1 X187.083 Y149.087
G1 X128.917 Y90.922 E2.52756
G1 X128.917 Y91.455
G1 X187.083 Y149.62 E2.52756
G1 X187.083 Y150.153
G1 X128.917 Y91.988 E2.52756
G1 X128.917 Y92.522
G1 X187.083 Y150.687 E2.52756
G1 X187.083 Y151.22
G1 X128.917 Y93.055 E2.52756
G1 X128.917 Y93.588
G1 X187.083 Y151.753 E2.52756
G1 X187.083 Y152.287
G1 X128.917 Y94.121 E2.52756
G1 X128.917 Y94.655
G1 X187.083 Y152.82 E2.52756
G1 X187.083 Y153.353
G1 X128.917 Y95.188 E2.52756
G1 X128.917 Y95.721
G1 X187.083 Y153.886 E2.52756
G1 X187.083 Y154.42
G1 X128.917 Y96.254 E2.52756
M73 P67 R17
G1 X128.917 Y96.788
G1 X187.083 Y154.953 E2.52756
G1 X187.083 Y155.486
G1 X128.917 Y97.321 E2.52756
G1 X128.917 Y97.854
G1 X187.083 Y156.019 E2.52756
G1 X187.083 Y156.553
G1 X128.917 Y98.388 E2.52756
G1 X128.917 Y98.921
G1 X187.083 Y157.086 E2.52756
G1 X187.083 Y157.619
G1 X128.917 Y99.454 E2.52756
G1 X128.917 Y99.987
G1 X187.083 Y158.153 E2.52756
G1 X187.083 Y158.686
G1 X128.917 Y100.521 E2.52756
G1 X128.917 Y101.054
G1 X187.083 Y159.219 E2.52756
G1 X187.083 Y159.752
G1 X128.917 Y101.587 E2.52756
G1 X128.917 Y102.12
G1 X187.083 Y160.286 E2.52756
G1 X187.083 Y160.819
G1 X128.917 Y102.654 E2.52756
G1 X128.917 Y103.187
G1 X187.083 Y161.352 E2.52756
G1 X187.083 Y161.885
G1 X128.917 Y103.72 E2.52756
G1 X128.917 Y104.253
G1 X187.083 Y162.419 E2.52756
G1 X187.083 Y162.952
G1 X128.917 Y104.787 E2.52756
G1 X128.917 Y105.32
G1 X187.083 Y163.485 E2.52756
G1 X187.083 Y164.019
G1 X128.917 Y105.853 E2.52756
G1 X128.917 Y106.387
G1 X187.083 Y164.552 E2.52756
G1 X187.083 Y165.085
G1 X128.917 Y106.92 E2.52756
G1 X128.917 Y107.453
G1 X187.083 Y165.618 E2.52756
G1 X187.083 Y166.152
G1 X128.917 Y107.986 E2.52756
G1 X128.917 Y108.52
G1 X187.083 Y166.685 E2.52756
G1 X187.083 Y167.218
G1 X128.917 Y109.053 E2.52756
G1 X128.917 Y109.586
G1 X138.359 Y119.028 E.4103
G1 X138.47 Y119.139
G1 X187.083 Y167.751 E2.11245
G1 X187.083 Y168.285
G1 X128.917 Y110.119 E2.52756
G1 X128.917 Y110.653
G1 X187.083 Y168.818 E2.52756
G1 X187.083 Y169.351
G1 X128.917 Y111.186 E2.52756
G1 X128.917 Y111.719
G1 X187.083 Y169.884 E2.52756
G1 X187.083 Y170.418
G1 X128.917 Y112.253 E2.52756
G1 X128.917 Y112.786
G1 X187.083 Y170.951 E2.52756
G1 X187.083 Y171.484
G1 X128.917 Y113.319 E2.52756
G1 X128.917 Y113.852
G1 X187.083 Y172.018 E2.52756
G1 X187.083 Y172.551
G1 X128.917 Y114.386 E2.52756
G1 X128.917 Y114.919
G1 X187.083 Y173.084 E2.52756
G1 X187.083 Y173.617
G1 X128.917 Y115.452 E2.52756
G1 X128.917 Y115.985
G1 X187.083 Y174.151 E2.52756
G1 X187.083 Y174.684
G1 X128.917 Y116.519 E2.52756
G1 X128.917 Y117.052
G1 X187.083 Y175.217 E2.52756
G1 X187.083 Y175.75
G1 X128.917 Y117.585 E2.52756
G1 X128.917 Y118.119
G1 X187.083 Y176.284 E2.52756
G1 X187.083 Y176.817
G1 X128.917 Y118.652 E2.52756
G1 X128.917 Y119.185
G1 X180.64 Y170.907 E2.24759
G1 X180.842 Y171.11
G1 X187.083 Y177.35 E.27119
G1 X187.083 Y177.884
G1 X128.917 Y119.718 E2.52756
G1 X128.917 Y120.252
G1 X187.083 Y178.417 E2.52756
G1 X187.083 Y178.95
G1 X128.917 Y120.785 E2.52756
G1 X128.917 Y121.318
G1 X187.083 Y179.483 E2.52756
G1 X187.083 Y180.017
G1 X128.917 Y121.851 E2.52756
G1 X128.917 Y122.385
G1 X187.083 Y180.55 E2.52756
G1 X187.083 Y181.083
G1 X128.917 Y122.918 E2.52756
G1 X128.917 Y123.451
G1 X187.083 Y181.616 E2.52756
G1 X187.083 Y182.15
G1 X128.917 Y123.984 E2.52756
G1 X128.917 Y124.518
G1 X187.083 Y182.683 E2.52756
G1 X187.083 Y183.216
G1 X128.917 Y125.051 E2.52756
G1 X128.917 Y125.584
G1 X187.083 Y183.75 E2.52756
G1 X186.655 Y183.855
G1 X128.917 Y126.118 E2.50899
G1 X128.917 Y126.651
G1 X186.122 Y183.855 E2.48581
G1 X185.589 Y183.855
G1 X128.917 Y127.184 E2.46264
G1 X128.917 Y127.717
M73 P68 R17
G1 X185.055 Y183.855 E2.43947
G1 X184.522 Y183.855
G1 X128.917 Y128.251 E2.4163
G1 X128.917 Y128.784
G1 X183.989 Y183.855 E2.39312
G1 X183.456 Y183.855
G1 X128.917 Y129.317 E2.36995
G1 X128.917 Y129.85
G1 X182.922 Y183.855 E2.34678
G1 X182.389 Y183.855
G1 X128.917 Y130.384 E2.3236
G1 X128.917 Y130.917
G1 X181.856 Y183.855 E2.30043
G1 X181.323 Y183.855
G1 X128.917 Y131.45 E2.27726
G1 X128.917 Y131.984
G1 X180.789 Y183.855 E2.25408
G1 X180.256 Y183.855
G1 X128.917 Y132.517 E2.23091
G1 X128.917 Y133.05
G1 X179.723 Y183.855 E2.20774
G1 X179.189 Y183.855
G1 X128.917 Y133.583 E2.18456
G1 X128.917 Y134.117
G1 X178.656 Y183.855 E2.16139
G1 X178.123 Y183.855
G1 X128.917 Y134.65 E2.13822
G1 X128.917 Y135.183
G1 X177.59 Y183.855 E2.11504
G1 X177.056 Y183.855
G1 X128.917 Y135.716 E2.09187
M73 P68 R16
G1 X128.917 Y136.25
G1 X176.523 Y183.855 E2.0687
G1 X175.99 Y183.855
G1 X128.917 Y136.783 E2.04552
G1 X128.917 Y137.316
G1 X175.457 Y183.855 E2.02235
G1 X174.923 Y183.855
G1 X128.917 Y137.85 E1.99918
G1 X128.917 Y138.383
G1 X174.39 Y183.855 E1.976
G1 X173.857 Y183.855
G1 X128.917 Y138.916 E1.95283
G1 X128.917 Y139.449
G1 X173.323 Y183.855 E1.92966
G1 X172.79 Y183.855
G1 X128.917 Y139.983 E1.90649
G1 X128.917 Y140.516
G1 X172.257 Y183.855 E1.88331
G1 X171.724 Y183.855
G1 X128.917 Y141.049 E1.86014
G1 X128.917 Y141.582
G1 X171.19 Y183.855 E1.83697
G1 X170.657 Y183.855
G1 X128.917 Y142.116 E1.81379
G1 X128.917 Y142.649
G1 X170.124 Y183.855 E1.79062
G1 X169.591 Y183.855
G1 X128.917 Y143.182 E1.76745
G1 X128.917 Y143.715
G1 X169.057 Y183.855 E1.74427
G1 X168.524 Y183.855
G1 X128.917 Y144.249 E1.7211
G1 X128.917 Y144.782
G1 X167.991 Y183.855 E1.69793
G1 X167.457 Y183.855
G1 X128.917 Y145.315 E1.67475
G1 X128.917 Y145.849
G1 X166.924 Y183.855 E1.65158
G1 X166.391 Y183.855
G1 X128.917 Y146.382 E1.62841
G1 X128.917 Y146.915
G1 X165.858 Y183.855 E1.60523
G1 X165.324 Y183.855
G1 X128.917 Y147.448 E1.58206
G1 X128.917 Y147.982
G1 X164.791 Y183.855 E1.55889
G1 X164.258 Y183.855
G1 X128.917 Y148.515 E1.53571
G1 X128.917 Y149.048
G1 X163.725 Y183.855 E1.51254
G1 X163.191 Y183.855
G1 X128.917 Y149.581 E1.48937
G1 X128.917 Y150.115
G1 X162.658 Y183.855 E1.4662
G1 X162.125 Y183.855
G1 X128.917 Y150.648 E1.44302
G1 X128.917 Y151.181
G1 X161.592 Y183.855 E1.41985
G1 X161.058 Y183.855
G1 X128.917 Y151.715 E1.39668
G1 X128.917 Y152.248
G1 X160.525 Y183.855 E1.3735
G1 X159.992 Y183.855
G1 X128.917 Y152.781 E1.35033
G1 X128.917 Y153.314
G1 X159.458 Y183.855 E1.32716
G1 X158.925 Y183.855
G1 X128.917 Y153.848 E1.30398
G1 X128.917 Y154.381
G1 X158.392 Y183.855 E1.28081
G1 X157.859 Y183.855
G1 X128.917 Y154.914 E1.25764
G1 X128.917 Y155.447
G1 X157.325 Y183.855 E1.23446
G1 X156.792 Y183.855
G1 X128.917 Y155.981 E1.21129
G1 X128.917 Y156.514
G1 X156.259 Y183.855 E1.18812
G1 X155.726 Y183.855
G1 X128.917 Y157.047 E1.16494
G1 X128.917 Y157.581
G1 X155.192 Y183.855 E1.14177
G1 X154.659 Y183.855
G1 X128.917 Y158.114 E1.1186
G1 X128.917 Y158.647
G1 X154.126 Y183.855 E1.09542
G1 X153.592 Y183.855
G1 X128.917 Y159.18 E1.07225
G1 X128.917 Y159.714
G1 X153.059 Y183.855 E1.04908
G1 X152.526 Y183.855
G1 X128.917 Y160.247 E1.0259
G1 X128.917 Y160.78
G1 X151.993 Y183.855 E1.00273
G1 X151.459 Y183.855
G1 X128.917 Y161.313 E.97956
G1 X128.917 Y161.847
G1 X150.926 Y183.855 E.95639
G1 X150.393 Y183.855
G1 X128.917 Y162.38 E.93321
G1 X128.917 Y162.913
G1 X149.86 Y183.855 E.91004
G1 X149.326 Y183.855
G1 X128.917 Y163.446 E.88687
G1 X128.917 Y163.98
G1 X148.793 Y183.855 E.86369
G1 X148.355 Y183.951
G1 X128.917 Y164.513 E.84467
G1 X128.917 Y165.046
G1 X148.355 Y184.484 E.84467
M73 P69 R16
G1 X148.355 Y185.018
G1 X128.917 Y165.58 E.84467
G1 X128.917 Y166.113
G1 X148.355 Y185.551 E.84467
G1 X148.355 Y186.084
G1 X128.917 Y166.646 E.84467
G1 X128.917 Y167.179
G1 X148.321 Y186.583 E.84316
G1 X147.787 Y186.583
G1 X128.917 Y167.713 E.81999
G1 X128.917 Y168.246
G1 X147.254 Y186.583 E.79682
G1 X146.721 Y186.583
G1 X128.917 Y168.779 E.77365
G1 X128.917 Y169.312
G1 X130.466 Y170.861 E.06728
G1 X130.639 Y171.034
G1 X146.188 Y186.583 E.67565
G1 X145.654 Y186.583
G1 X128.489 Y169.417 E.74591
G1 X127.956 Y169.417
G1 X145.121 Y186.583 E.74591
G1 X144.588 Y186.583
G1 X127.423 Y169.417 E.74591
G1 X126.889 Y169.417
G1 X144.054 Y186.583 E.74591
G1 X143.521 Y186.583
G1 X126.356 Y169.417 E.74591
G1 X125.823 Y169.417
G1 X142.988 Y186.583 E.74591
G1 X142.455 Y186.583
G1 X125.289 Y169.417 E.74591
G1 X124.756 Y169.417
G1 X141.921 Y186.583 E.74591
G1 X141.388 Y186.583
G1 X124.223 Y169.417 E.74591
G1 X123.69 Y169.417
G1 X140.855 Y186.583 E.74591
G1 X140.322 Y186.583
G1 X123.156 Y169.417 E.74591
G1 X122.623 Y169.417
G1 X139.788 Y186.583 E.74591
G1 X139.255 Y186.583
G1 X122.09 Y169.417 E.74591
G1 X121.557 Y169.417
G1 X138.722 Y186.583 E.74591
G1 X138.189 Y186.583
G1 X121.023 Y169.417 E.74591
G1 X120.49 Y169.417
G1 X137.655 Y186.583 E.74591
G1 X137.122 Y186.583
G1 X119.957 Y169.417 E.74591
G1 X119.423 Y169.417
G1 X136.589 Y186.583 E.74591
G1 X136.055 Y186.583
G1 X118.89 Y169.417 E.74591
G1 X118.357 Y169.417
G1 X135.522 Y186.583 E.74591
G1 X134.989 Y186.583
G1 X117.824 Y169.417 E.74591
G1 X117.29 Y169.417
G1 X134.456 Y186.583 E.74591
G1 X133.922 Y186.583
G1 X116.757 Y169.417 E.74591
G1 X116.224 Y169.417
G1 X133.389 Y186.583 E.74591
G1 X132.856 Y186.583
G1 X115.691 Y169.417 E.74591
G1 X115.157 Y169.417
G1 X132.323 Y186.583 E.74591
G1 X131.789 Y186.583
G1 X114.624 Y169.417 E.74591
G1 X114.091 Y169.417
G1 X131.256 Y186.583 E.74591
G1 X130.723 Y186.583
G1 X113.558 Y169.417 E.74591
G1 X113.024 Y169.417
G1 X130.189 Y186.583 E.74591
G1 X129.656 Y186.583
G1 X112.491 Y169.417 E.74591
G1 X111.958 Y169.417
G1 X129.123 Y186.583 E.74591
G1 X128.59 Y186.583
G1 X111.424 Y169.417 E.74591
G1 X110.891 Y169.417
G1 X128.056 Y186.583 E.74591
G1 X127.523 Y186.583
G1 X110.358 Y169.417 E.74591
G1 X109.825 Y169.417
G1 X126.99 Y186.583 E.74591
G1 X126.457 Y186.583
G1 X109.291 Y169.417 E.74591
G1 X108.758 Y169.417
G1 X125.923 Y186.583 E.74591
G1 X125.39 Y186.583
G1 X108.225 Y169.417 E.74591
G1 X107.692 Y169.417
G1 X124.857 Y186.583 E.74591
G1 X124.323 Y186.583
G1 X107.158 Y169.417 E.74591
G1 X106.625 Y169.417
G1 X123.79 Y186.583 E.74591
G1 X123.257 Y186.583
G1 X106.092 Y169.417 E.74591
G1 X105.558 Y169.417
G1 X122.724 Y186.583 E.74591
G1 X122.19 Y186.583
G1 X105.025 Y169.417 E.74591
G1 X104.492 Y169.417
G1 X121.657 Y186.583 E.74591
G1 X121.124 Y186.583
G1 X103.959 Y169.417 E.74591
G1 X103.425 Y169.417
G1 X120.591 Y186.583 E.74591
G1 X120.057 Y186.583
G1 X102.892 Y169.417 E.74591
G1 X102.359 Y169.417
G1 X119.524 Y186.583 E.74591
G1 X118.991 Y186.583
G1 X101.826 Y169.417 E.74591
G1 X101.292 Y169.417
G1 X118.458 Y186.583 E.74591
G1 X117.924 Y186.583
G1 X100.759 Y169.417 E.74591
G1 X100.226 Y169.417
G1 X117.391 Y186.583 E.74591
G1 X116.858 Y186.583
G1 X99.692 Y169.417 E.74591
G1 X99.159 Y169.417
G1 X116.324 Y186.583 E.74591
G1 X115.791 Y186.583
G1 X98.626 Y169.417 E.74591
G1 X98.093 Y169.417
G1 X115.258 Y186.583 E.74591
G1 X114.725 Y186.583
G1 X97.559 Y169.417 E.74591
G1 X97.026 Y169.417
G1 X114.191 Y186.583 E.74591
G1 X113.658 Y186.583
G1 X96.493 Y169.417 E.74591
G1 X95.96 Y169.417
G1 X113.125 Y186.583 E.74591
G1 X112.592 Y186.583
G1 X95.426 Y169.417 E.74591
G1 X94.893 Y169.417
G1 X112.058 Y186.583 E.74591
G1 X111.525 Y186.583
G1 X94.36 Y169.417 E.74591
G1 X93.827 Y169.417
G1 X110.992 Y186.583 E.74591
G1 X110.458 Y186.583
G1 X93.293 Y169.417 E.74591
G1 X92.76 Y169.417
G1 X109.925 Y186.583 E.74591
G1 X109.392 Y186.583
G1 X92.227 Y169.417 E.74591
G1 X91.693 Y169.417
G1 X108.859 Y186.583 E.74591
G1 X108.325 Y186.583
G1 X91.16 Y169.417 E.74591
G1 X90.627 Y169.417
G1 X107.792 Y186.583 E.74591
G1 X107.259 Y186.583
G1 X90.094 Y169.417 E.74591
G1 X89.56 Y169.417
G1 X106.726 Y186.583 E.74591
G1 X106.192 Y186.583
G1 X89.027 Y169.417 E.74591
G1 X88.494 Y169.417
G1 X105.659 Y186.583 E.74591
G1 X105.126 Y186.583
G1 X87.961 Y169.417 E.74591
G1 X87.427 Y169.417
G1 X104.592 Y186.583 E.74591
G1 X104.059 Y186.583
G1 X86.894 Y169.417 E.74591
G1 X86.361 Y169.417
G1 X103.526 Y186.583 E.74591
G1 X102.993 Y186.583
G1 X85.827 Y169.417 E.74591
G1 X85.294 Y169.417
G1 X102.459 Y186.583 E.74591
G1 X101.926 Y186.583
G1 X84.761 Y169.417 E.74591
G1 X84.228 Y169.417
G1 X101.393 Y186.583 E.74591
G1 X100.86 Y186.583
G1 X83.694 Y169.417 E.74591
G1 X83.161 Y169.417
G1 X100.326 Y186.583 E.74591
G1 X99.793 Y186.583
G1 X82.628 Y169.417 E.74591
G1 X82.095 Y169.417
G1 X99.26 Y186.583 E.74591
G1 X98.727 Y186.583
G1 X81.561 Y169.417 E.74591
G1 X81.028 Y169.417
G1 X98.193 Y186.583 E.74591
G1 X97.66 Y186.583
G1 X80.495 Y169.417 E.74591
G1 X79.961 Y169.417
G1 X97.127 Y186.583 E.74591
G1 X96.593 Y186.583
G1 X79.428 Y169.417 E.74591
M204 S10000
; WIPE_START
G1 F24000
G1 X80.842 Y170.832 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.052 J.612 P1  F30000
G1 X128.711 Y88.583 Z5.4
G1 Z5
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X109.546 Y69.417 E.83282
G1 X109.013 Y69.417
G1 X128.178 Y88.583 E.83282
G1 X127.645 Y88.583
G1 X108.48 Y69.417 E.83282
G1 X107.946 Y69.417
G1 X127.112 Y88.583 E.83282
G1 X126.578 Y88.583
G1 X107.413 Y69.417 E.83282
G1 X106.88 Y69.417
G1 X126.045 Y88.583 E.83282
G1 X125.512 Y88.583
G1 X106.347 Y69.417 E.83282
G1 X105.813 Y69.417
G1 X124.978 Y88.583 E.83282
G1 X124.445 Y88.583
G1 X105.28 Y69.417 E.83282
G1 X104.747 Y69.417
G1 X123.912 Y88.583 E.83282
G1 X123.379 Y88.583
G1 X104.213 Y69.417 E.83282
G1 X103.68 Y69.417
G1 X122.845 Y88.583 E.83282
G1 X122.312 Y88.583
G1 X103.147 Y69.417 E.83282
G1 X102.614 Y69.417
G1 X121.779 Y88.583 E.83282
G1 X121.246 Y88.583
G1 X102.08 Y69.417 E.83282
G1 X101.547 Y69.417
G1 X120.712 Y88.583 E.83282
G1 X120.179 Y88.583
G1 X101.014 Y69.417 E.83282
G1 X100.481 Y69.417
G1 X119.646 Y88.583 E.83282
G1 X119.112 Y88.583
G1 X99.947 Y69.417 E.83282
G1 X99.414 Y69.417
G1 X118.579 Y88.583 E.83282
G1 X118.046 Y88.583
G1 X98.881 Y69.417 E.83282
G1 X98.347 Y69.417
G1 X117.513 Y88.583 E.83282
G1 X116.979 Y88.583
G1 X97.814 Y69.417 E.83282
G1 X97.281 Y69.417
G1 X116.446 Y88.583 E.83282
G1 X115.913 Y88.583
G1 X96.748 Y69.417 E.83282
G1 X96.214 Y69.417
G1 X115.38 Y88.583 E.83282
G1 X114.846 Y88.583
G1 X95.681 Y69.417 E.83282
M73 P70 R16
G1 X95.148 Y69.417
G1 X114.313 Y88.583 E.83282
G1 X113.78 Y88.583
G1 X94.615 Y69.417 E.83282
G1 X94.081 Y69.417
G1 X113.247 Y88.583 E.83282
G1 X112.713 Y88.583
G1 X93.548 Y69.417 E.83282
G1 X93.015 Y69.417
G1 X112.18 Y88.583 E.83282
G1 X111.647 Y88.583
G1 X92.481 Y69.417 E.83282
G1 X91.948 Y69.417
G1 X111.113 Y88.583 E.83282
G1 X110.58 Y88.583
G1 X91.415 Y69.417 E.83282
G1 X90.882 Y69.417
G1 X110.047 Y88.583 E.83282
G1 X109.514 Y88.583
G1 X90.348 Y69.417 E.83282
G1 X89.815 Y69.417
G1 X108.98 Y88.583 E.83282
G1 X108.447 Y88.583
G1 X89.282 Y69.417 E.83282
G1 X88.749 Y69.417
G1 X107.914 Y88.583 E.83282
G1 X107.381 Y88.583
G1 X88.215 Y69.417 E.83282
M73 P70 R15
G1 X87.682 Y69.417
G1 X106.847 Y88.583 E.83282
G1 X106.314 Y88.583
G1 X87.149 Y69.417 E.83282
G1 X86.616 Y69.417
G1 X105.781 Y88.583 E.83282
G1 X105.247 Y88.583
G1 X86.082 Y69.417 E.83282
G1 X85.549 Y69.417
G1 X104.714 Y88.583 E.83282
G1 X104.181 Y88.583
G1 X85.016 Y69.417 E.83282
G1 X84.482 Y69.417
G1 X103.648 Y88.583 E.83282
G1 X103.114 Y88.583
G1 X83.949 Y69.417 E.83282
G1 X83.416 Y69.417
G1 X102.581 Y88.583 E.83282
G1 X102.048 Y88.583
G1 X82.883 Y69.417 E.83282
G1 X82.349 Y69.417
G1 X101.515 Y88.583 E.83282
G1 X100.981 Y88.583
G1 X81.816 Y69.417 E.83282
G1 X81.283 Y69.417
G1 X100.448 Y88.583 E.83282
G1 X99.915 Y88.583
G1 X80.75 Y69.417 E.83282
G1 X80.216 Y69.417
G1 X99.381 Y88.583 E.83282
G1 X98.848 Y88.583
G1 X79.683 Y69.417 E.83282
G1 X79.15 Y69.417
G1 X98.315 Y88.583 E.83282
G1 X97.782 Y88.583
G1 X78.616 Y69.417 E.83282
G1 X78.083 Y69.417
G1 X97.248 Y88.583 E.83282
G1 X96.715 Y88.583
G1 X77.55 Y69.417 E.83282
G1 X77.017 Y69.417
G1 X96.182 Y88.583 E.83282
G1 X95.649 Y88.583
G1 X76.483 Y69.417 E.83282
G1 X75.95 Y69.417
G1 X95.115 Y88.583 E.83282
G1 X94.582 Y88.583
G1 X75.417 Y69.417 E.83282
G1 X74.884 Y69.417
G1 X94.049 Y88.583 E.83282
G1 X93.516 Y88.583
G1 X74.35 Y69.417 E.83282
G1 X73.817 Y69.417
G1 X92.982 Y88.583 E.83282
G1 X92.449 Y88.583
G1 X73.284 Y69.417 E.83282
G1 X72.917 Y69.584
G1 X91.916 Y88.583 E.82557
G1 X91.382 Y88.583
G1 X72.917 Y70.118 E.8024
G1 X72.917 Y70.651
G1 X90.849 Y88.583 E.77922
G1 X90.316 Y88.583
G1 X72.917 Y71.184 E.75605
G1 X72.917 Y71.717
G1 X89.783 Y88.583 E.73288
G1 X89.249 Y88.583
G1 X72.917 Y72.251 E.7097
G1 X72.917 Y72.784
G1 X88.716 Y88.583 E.68653
G1 X88.183 Y88.583
G1 X72.917 Y73.317 E.66336
G1 X72.917 Y73.85
G1 X87.65 Y88.583 E.64018
G1 X87.116 Y88.583
G1 X72.917 Y74.384 E.61701
G1 X72.917 Y74.917
G1 X86.583 Y88.583 E.59384
G1 X86.05 Y88.583
G1 X72.917 Y75.45 E.57066
G1 X72.917 Y75.984
G1 X85.516 Y88.583 E.54749
G1 X84.983 Y88.583
G1 X72.917 Y76.517 E.52432
G1 X72.917 Y77.05
G1 X84.45 Y88.583 E.50114
G1 X83.917 Y88.583
G1 X72.917 Y77.583 E.47797
G1 X72.917 Y78.117
G1 X83.383 Y88.583 E.4548
G1 X82.85 Y88.583
G1 X72.917 Y78.65 E.43163
G1 X72.917 Y79.183
G1 X82.317 Y88.583 E.40845
G1 X81.784 Y88.583
G1 X72.917 Y79.716 E.38528
G1 X72.917 Y80.25
G1 X81.25 Y88.583 E.36211
G1 X80.717 Y88.583
G1 X72.917 Y80.783 E.33893
G1 X72.917 Y81.316
G1 X80.184 Y88.583 E.31576
G1 X79.65 Y88.583
G1 X72.917 Y81.85 E.29259
G1 X72.917 Y82.383
G1 X77.417 Y86.883 E.19554
G1 X77.617 Y87.083
G1 X79.117 Y88.583 E.06518
G1 X79.083 Y89.081
G1 X72.917 Y82.916 E.26791
G1 X72.917 Y83.449
G1 X79.083 Y89.615 E.26791
G1 X79.083 Y90.148
G1 X72.917 Y83.983 E.26791
G1 X72.917 Y84.516
G1 X79.083 Y90.681 E.26791
G1 X79.083 Y91.214
G1 X72.917 Y85.049 E.26791
G1 X72.917 Y85.582
G1 X79.083 Y91.748 E.26791
G1 X79.083 Y92.281
G1 X72.917 Y86.116 E.26791
G1 X72.917 Y86.649
G1 X79.083 Y92.814 E.26791
G1 X79.083 Y93.347
G1 X72.917 Y87.182 E.26791
G1 X72.917 Y87.715
G1 X79.083 Y93.881 E.26791
G1 X79.083 Y94.414
G1 X72.917 Y88.249 E.26791
G1 X72.917 Y88.782
G1 X79.083 Y94.947 E.26791
G1 X79.083 Y95.481
G1 X72.917 Y89.315 E.26791
G1 X72.917 Y89.849
G1 X79.083 Y96.014 E.26791
G1 X79.083 Y96.547
G1 X72.917 Y90.382 E.26791
G1 X72.917 Y90.915
G1 X79.083 Y97.08 E.26791
G1 X79.083 Y97.614
G1 X72.917 Y91.448 E.26791
G1 X72.917 Y91.982
G1 X79.083 Y98.147 E.26791
G1 X79.083 Y98.68
G1 X72.917 Y92.515 E.26791
G1 X72.917 Y93.048
G1 X79.083 Y99.213 E.26791
G1 X79.083 Y99.747
G1 X72.917 Y93.581 E.26791
G1 X72.917 Y94.115
G1 X79.083 Y100.28 E.26791
G1 X79.083 Y100.813
G1 X72.917 Y94.648 E.26791
G1 X72.917 Y95.181
G1 X79.083 Y101.346 E.26791
G1 X79.083 Y101.88
G1 X72.917 Y95.715 E.26791
G1 X72.917 Y96.248
G1 X79.083 Y102.413 E.26791
G1 X79.083 Y102.946
G1 X72.917 Y96.781 E.26791
G1 X72.917 Y97.314
G1 X79.083 Y103.48 E.26791
G1 X79.083 Y104.013
G1 X72.917 Y97.848 E.26791
G1 X72.917 Y98.381
G1 X79.083 Y104.546 E.26791
G1 X79.083 Y105.079
G1 X72.917 Y98.914 E.26791
G1 X72.917 Y99.447
G1 X79.083 Y105.613 E.26791
G1 X79.083 Y106.146
G1 X72.917 Y99.981 E.26791
G1 X72.917 Y100.514
G1 X79.083 Y106.679 E.26791
G1 X79.083 Y107.212
G1 X72.917 Y101.047 E.26791
G1 X72.917 Y101.581
G1 X79.083 Y107.746 E.26791
G1 X79.083 Y108.279
G1 X72.917 Y102.114 E.26791
G1 X72.917 Y102.647
G1 X79.083 Y108.812 E.26791
G1 X79.083 Y109.346
G1 X72.917 Y103.18 E.26791
G1 X72.917 Y103.714
G1 X79.083 Y109.879 E.26791
G1 X79.083 Y110.412
G1 X72.917 Y104.247 E.26791
G1 X72.917 Y104.78
G1 X79.083 Y110.945 E.26791
G1 X79.083 Y111.479
G1 X72.917 Y105.313 E.26791
G1 X72.917 Y105.847
G1 X79.083 Y112.012 E.26791
G1 X79.083 Y112.545
G1 X72.917 Y106.38 E.26791
G1 X72.917 Y106.913
G1 X79.083 Y113.078 E.26791
G1 X79.083 Y113.612
G1 X72.917 Y107.446 E.26791
G1 X72.917 Y107.98
G1 X79.083 Y114.145 E.26791
G1 X79.083 Y114.678
G1 X72.917 Y108.513 E.26791
G1 X72.917 Y109.046
G1 X79.083 Y115.211 E.26791
G1 X79.083 Y115.745
G1 X72.917 Y109.58 E.26791
G1 X72.917 Y110.113
G1 X79.083 Y116.278 E.26791
G1 X79.083 Y116.811
G1 X72.917 Y110.646 E.26791
G1 X72.917 Y111.179
G1 X79.083 Y117.345 E.26791
G1 X79.083 Y117.878
G1 X72.917 Y111.713 E.26791
G1 X72.917 Y112.246
G1 X79.083 Y118.411 E.26791
G1 X79.083 Y118.944
G1 X72.917 Y112.779 E.26791
G1 X72.917 Y113.312
G1 X79.083 Y119.478 E.26791
G1 X79.083 Y120.011
G1 X72.917 Y113.846 E.26791
G1 X72.917 Y114.379
G1 X79.083 Y120.544 E.26791
G1 X79.083 Y121.077
G1 X72.917 Y114.912 E.26791
G1 X72.917 Y115.446
G1 X79.083 Y121.611 E.26791
G1 X79.083 Y122.144
G1 X72.917 Y115.979 E.26791
G1 X72.917 Y116.512
G1 X79.083 Y122.677 E.26791
G1 X79.083 Y123.211
G1 X72.917 Y117.045 E.26791
G1 X72.917 Y117.579
G1 X79.083 Y123.744 E.26791
G1 X79.083 Y124.277
G1 X72.917 Y118.112 E.26791
G1 X72.917 Y118.645
G1 X79.083 Y124.81 E.26791
G1 X79.083 Y125.344
G1 X72.917 Y119.178 E.26791
G1 X72.917 Y119.712
G1 X79.083 Y125.877 E.26791
G1 X79.083 Y126.41
G1 X72.917 Y120.245 E.26791
G1 X72.917 Y120.778
G1 X79.083 Y126.943 E.26791
G1 X79.083 Y127.477
G1 X72.917 Y121.311 E.26791
G1 X72.917 Y121.845
G1 X79.083 Y128.01 E.26791
G1 X79.083 Y128.543
G1 X72.917 Y122.378 E.26791
G1 X72.917 Y122.911
G1 X79.083 Y129.077 E.26791
G1 X79.083 Y129.61
G1 X72.917 Y123.445 E.26791
G1 X72.917 Y123.978
G1 X79.083 Y130.143 E.26791
G1 X79.083 Y130.676
G1 X72.917 Y124.511 E.26791
G1 X72.917 Y125.044
G1 X79.083 Y131.21 E.26791
G1 X79.083 Y131.743
G1 X72.917 Y125.578 E.26791
G1 X72.917 Y126.111
G1 X79.083 Y132.276 E.26791
G1 X79.083 Y132.809
G1 X72.917 Y126.644 E.26791
G1 X72.917 Y127.177
G1 X79.083 Y133.343 E.26791
G1 X79.083 Y133.876
G1 X72.917 Y127.711 E.26791
G1 X72.917 Y128.244
G1 X79.083 Y134.409 E.26791
G1 X79.083 Y134.942
G1 X72.917 Y128.777 E.26791
G1 X72.917 Y129.311
G1 X79.083 Y135.476 E.26791
G1 X79.083 Y136.009
G1 X72.917 Y129.844 E.26791
G1 X72.917 Y130.377
G1 X79.083 Y136.542 E.26791
G1 X79.083 Y137.076
G1 X72.917 Y130.91 E.26791
G1 X72.917 Y131.444
G1 X79.083 Y137.609 E.26791
G1 X79.083 Y138.142
G1 X72.917 Y131.977 E.26791
G1 X72.917 Y132.51
G1 X79.083 Y138.675 E.26791
G1 X79.083 Y139.209
G1 X72.917 Y133.043 E.26791
G1 X72.917 Y133.577
G1 X79.083 Y139.742 E.26791
M73 P71 R15
G1 X79.083 Y140.275
G1 X72.917 Y134.11 E.26791
G1 X72.917 Y134.643
G1 X79.083 Y140.808 E.26791
G1 X79.083 Y141.342
G1 X72.917 Y135.177 E.26791
G1 X72.917 Y135.71
G1 X79.083 Y141.875 E.26791
G1 X79.083 Y142.408
G1 X72.917 Y136.243 E.26791
G1 X72.917 Y136.776
G1 X79.083 Y142.942 E.26791
G1 X79.083 Y143.475
G1 X72.917 Y137.31 E.26791
G1 X72.917 Y137.843
G1 X79.083 Y144.008 E.26791
G1 X79.083 Y144.541
G1 X72.917 Y138.376 E.26791
G1 X72.917 Y138.909
G1 X79.083 Y145.075 E.26791
G1 X79.083 Y145.608
G1 X72.917 Y139.443 E.26791
G1 X72.917 Y139.976
G1 X79.083 Y146.141 E.26791
G1 X79.083 Y146.674
G1 X72.917 Y140.509 E.26791
G1 X72.917 Y141.042
G1 X79.083 Y147.208 E.26791
G1 X79.083 Y147.741
G1 X72.917 Y141.576 E.26791
G1 X72.917 Y142.109
G1 X79.083 Y148.274 E.26791
G1 X79.083 Y148.808
G1 X72.917 Y142.642 E.26791
G1 X72.917 Y143.176
G1 X79.083 Y149.341 E.26791
G1 X79.083 Y149.874
G1 X72.917 Y143.709 E.26791
G1 X72.917 Y144.242
G1 X79.083 Y150.407 E.26791
G1 X79.083 Y150.941
G1 X72.917 Y144.775 E.26791
G1 X72.917 Y145.309
G1 X79.083 Y151.474 E.26791
G1 X79.083 Y152.007
G1 X72.917 Y145.842 E.26791
G1 X72.917 Y146.375
G1 X79.083 Y152.54 E.26791
G1 X79.083 Y153.074
G1 X72.917 Y146.908 E.26791
G1 X72.917 Y147.442
G1 X79.083 Y153.607 E.26791
G1 X79.083 Y154.14
G1 X72.917 Y147.975 E.26791
G1 X72.917 Y148.508
G1 X79.083 Y154.673 E.26791
G1 X79.083 Y155.207
G1 X72.917 Y149.042 E.26791
G1 X72.917 Y149.575
G1 X79.083 Y155.74 E.26791
G1 X79.083 Y156.273
G1 X72.917 Y150.108 E.26791
G1 X72.917 Y150.641
G1 X79.083 Y156.807 E.26791
G1 X79.083 Y157.34
G1 X72.917 Y151.175 E.26791
G1 X72.917 Y151.708
G1 X79.083 Y157.873 E.26791
G1 X79.083 Y158.406
G1 X72.917 Y152.241 E.26791
G1 X72.917 Y152.774
G1 X79.083 Y158.94 E.26791
G1 X79.083 Y159.473
G1 X72.917 Y153.308 E.26791
G1 X72.917 Y153.841
G1 X79.083 Y160.006 E.26791
G1 X79.083 Y160.539
G1 X72.917 Y154.374 E.26791
G1 X72.917 Y154.908
G1 X79.083 Y161.073 E.26791
G1 X79.083 Y161.606
G1 X72.917 Y155.441 E.26791
G1 X72.917 Y155.974
G1 X79.083 Y162.139 E.26791
G1 X79.083 Y162.673
G1 X72.917 Y156.507 E.26791
G1 X72.917 Y157.041
G1 X79.083 Y163.206 E.26791
G1 X79.083 Y163.739
G1 X72.917 Y157.574 E.26791
G1 X72.917 Y158.107
G1 X79.083 Y164.272 E.26791
G1 X79.083 Y164.806
G1 X72.917 Y158.64 E.26791
G1 X72.917 Y159.174
G1 X79.083 Y165.339 E.26791
G1 X79.083 Y165.872
G1 X72.917 Y159.707 E.26791
G1 X72.917 Y160.24
G1 X79.083 Y166.405 E.26791
G1 X79.083 Y166.939
G1 X72.917 Y160.773 E.26791
G1 X72.917 Y161.307
G1 X79.083 Y167.472 E.26791
G1 X79.083 Y168.005
G1 X72.917 Y161.84 E.26791
G1 X72.917 Y162.373
G1 X79.083 Y168.539 E.26791
G1 X79.083 Y169.072
G1 X72.917 Y162.907 E.26791
G1 X72.917 Y163.44
G1 X96.06 Y186.583 E1.00566
G1 X95.527 Y186.583
G1 X72.917 Y163.973 E.98249
G1 X72.917 Y164.506
G1 X94.994 Y186.583 E.95932
G1 X94.46 Y186.583
G1 X72.917 Y165.04 E.93615
G1 X72.917 Y165.573
G1 X93.927 Y186.583 E.91297
G1 X93.394 Y186.583
G1 X72.917 Y166.106 E.8898
G1 X72.917 Y166.639
G1 X92.861 Y186.583 E.86663
G1 X92.327 Y186.583
G1 X72.917 Y167.173 E.84345
G1 X72.917 Y167.706
G1 X91.794 Y186.583 E.82028
G1 X91.261 Y186.583
G1 X72.917 Y168.239 E.79711
G1 X72.917 Y168.773
G1 X90.727 Y186.583 E.77393
G1 X90.194 Y186.583
G1 X72.917 Y169.306 E.75076
G1 X72.917 Y169.839
G1 X89.661 Y186.583 E.72759
G1 X89.128 Y186.583
G1 X72.917 Y170.372 E.70441
G1 X72.917 Y170.906
G1 X88.594 Y186.583 E.68124
G1 X88.061 Y186.583
G1 X72.917 Y171.439 E.65807
G1 X72.917 Y171.972
G1 X87.528 Y186.583 E.63489
G1 X86.995 Y186.583
G1 X72.917 Y172.505 E.61172
G1 X72.917 Y173.039
G1 X86.461 Y186.583 E.58855
G1 X85.928 Y186.583
G1 X72.917 Y173.572 E.56537
G1 X72.917 Y174.105
G1 X85.395 Y186.583 E.5422
G1 X84.861 Y186.583
G1 X72.917 Y174.639 E.51903
G1 X72.917 Y175.172
G1 X84.328 Y186.583 E.49586
G1 X83.795 Y186.583
G1 X72.917 Y175.705 E.47268
G1 X72.917 Y176.238
G1 X83.262 Y186.583 E.44951
G1 X82.728 Y186.583
G1 X72.917 Y176.772 E.42634
G1 X72.917 Y177.305
G1 X82.195 Y186.583 E.40316
G1 X81.662 Y186.583
G1 X72.917 Y177.838 E.37999
G1 X72.917 Y178.371
G1 X81.129 Y186.583 E.35682
G1 X80.595 Y186.583
G1 X72.917 Y178.905 E.33364
G1 X72.917 Y179.438
G1 X80.062 Y186.583 E.31047
G1 X79.529 Y186.583
G1 X72.917 Y179.971 E.2873
G1 X72.917 Y180.504
G1 X78.996 Y186.583 E.26412
G1 X78.462 Y186.583
G1 X72.917 Y181.038 E.24095
G1 X72.917 Y181.571
G1 X77.929 Y186.583 E.21778
G1 X77.396 Y186.583
G1 X72.917 Y182.104 E.1946
G1 X72.917 Y182.638
G1 X76.862 Y186.583 E.17143
G1 X76.329 Y186.583
G1 X72.917 Y183.171 E.14826
G1 X72.917 Y183.704
G1 X75.796 Y186.583 E.12508
G1 X75.263 Y186.583
G1 X72.917 Y184.237 E.10191
G1 X72.917 Y184.771
G1 X74.729 Y186.583 E.07874
G1 X74.196 Y186.583
G1 X72.917 Y185.304 E.05556
G1 X72.917 Y185.837
G1 X73.663 Y186.583 E.03239
M204 S10000
; WIPE_START
G1 F24000
G1 X72.917 Y185.837 E-.40058
G1 X72.917 Y185.304 E-.20264
G1 X73.209 Y185.596 E-.15677
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.014 J.673 P1  F30000
G1 X148.465 Y72.215 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.154155
G1 F15000
G3 X148.285 Y72.035 I.049 J-.229 E.00245
; WIPE_START
G1 F24000
G1 X148.323 Y72.126 E-.27784
G1 X148.374 Y72.177 E-.20433
G1 X148.465 Y72.215 E-.27784
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.278 J-1.185 P1  F30000
G1 X79.205 Y88.495 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.116744
G1 F15000
G1 X79.324 Y88.569 E.00084
; LINE_WIDTH: 0.108206
G1 X79.316 Y88.585 E.0001
; LINE_WIDTH: 0.0809833
G1 X79.308 Y88.601 E.00006
; WIPE_START
G1 F24000
G1 X79.316 Y88.585 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.002 J1.217 P1  F30000
G1 X129.022 Y88.684 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.124348
G1 F15000
G1 X128.816 Y88.478 E.00193
; WIPE_START
G1 F24000
G1 X129.022 Y88.684 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.186 J.271 P1  F30000
G1 X151.298 Y186.05 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X149.67 Y186.05 E.05401
G1 X148.926 Y185.306 E.03489
G1 X148.926 Y185.834 E.01751
G1 X150.334 Y184.426 E.06603
G1 X155.722 Y184.426 E.17875
G1 X157.346 Y186.05 E.07617
G1 X156.386 Y186.05 E.03184
G1 X158.01 Y184.426 E.07617
G1 X163.398 Y184.426 E.17875
G1 X165.022 Y186.05 E.07617
G1 X164.062 Y186.05 E.03184
G1 X165.686 Y184.426 E.07617
G1 X171.074 Y184.426 E.17875
G1 X172.698 Y186.05 E.07617
G1 X171.738 Y186.05 E.03184
G1 X173.362 Y184.426 E.07617
G1 X178.75 Y184.426 E.17875
G1 X180.374 Y186.05 E.07617
G1 X179.414 Y186.05 E.03184
G1 X181.037 Y184.426 E.07617
G1 X182.666 Y184.426 E.05401
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X181.037 Y184.426 E-.61876
G1 X180.775 Y184.689 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/125
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
G3 Z5.4 I1.169 J-.34 P1  F30000
G1 X148.102 Y72.398 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4748
G1 X148.102 Y69.602 E.09274
G1 X186.898 Y69.602 E1.28693
G1 X186.898 Y72.398 E.09274
G1 X148.162 Y72.398 E1.28494
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4748
G1 X147.71 Y69.21 E.11
G1 X187.29 Y69.21 E1.21618
G1 X187.29 Y72.79 E.11
G1 X147.77 Y72.79 E1.21434
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4748
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X178.274 Y72.05 E.14719
G1 X180.374 Y69.95 E.09848
G1 X179.414 Y69.95 E.03184
G1 X181.513 Y72.05 E.09848
G1 X185.95 Y72.05 E.14719
G1 X186.55 Y71.45 E.02811
G1 X186.55 Y69.95 E.04976
G1 X186.421 Y69.95 E.00426
; WIPE_START
G1 F24000
G1 X186.55 Y69.95 E-.04875
G1 X186.55 Y71.45 E-.57001
G1 X186.287 Y71.713 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.152 J-.393 P1  F30000
G1 X148.102 Y183.602 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4748
G1 X186.898 Y183.602 E1.28693
G1 X186.898 Y186.398 E.09274
G1 X148.102 Y186.398 E1.28693
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4748
G1 X187.29 Y183.21 E1.21618
G1 X187.29 Y186.79 E.11
G1 X147.71 Y186.79 E1.21618
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.267 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.974 J-.729 P1  F30000
G1 X149.199 Y183.95 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4748
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X178.274 Y183.95 E.14719
G1 X180.374 Y186.05 E.09848
G1 X179.414 Y186.05 E.03184
G1 X181.513 Y183.95 E.09848
G1 X185.95 Y183.95 E.14719
G1 X186.55 Y184.55 E.02812
G1 X186.55 Y186.05 E.04976
G1 X186.421 Y186.05 E.00426
; WIPE_START
G1 F24000
G1 X186.55 Y186.05 E-.04876
G1 X186.55 Y184.55 E-.57
G1 X186.287 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.124 J-.467 P1  F30000
G1 X180.913 Y171.364 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4748
G3 X180.739 Y170.603 I-.159 J-.364 E.04631
G1 X180.789 Y170.604 E.00164
G3 X180.966 Y171.335 I-.034 J.396 E.03282
G1 X181.077 Y171.718 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4748
G1 X181.074 Y171.719 E.00012
G3 X180.73 Y170.211 I-.324 J-.72 E.0858
G1 X180.81 Y170.212 E.00247
G3 X181.21 Y171.641 I-.06 J.787 E.05928
G1 X181.129 Y171.688 E.00287
M204 S10000
; WIPE_START
G1 F24000
G1 X181.074 Y171.719 E-.02422
G1 X180.925 Y171.77 E-.05975
G1 X180.769 Y171.789 E-.05976
G1 X180.5 Y171.75 E-.1033
G1 X180.354 Y171.684 E-.0607
G1 X180.227 Y171.592 E-.05977
G1 X180.12 Y171.477 E-.05976
G1 X180.038 Y171.343 E-.05976
G1 X179.984 Y171.195 E-.05976
G1 X179.961 Y171.039 E-.05976
G1 X179.968 Y170.882 E-.05976
G1 X180.007 Y170.73 E-.05976
G1 X180.046 Y170.649 E-.03394
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.018 J-1.217 P1  F30000
G1 X130.664 Y171.364 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4748
G3 X130.49 Y170.603 I-.159 J-.364 E.04631
G1 X130.539 Y170.604 E.00164
G3 X130.717 Y171.335 I-.034 J.396 E.03281
G1 X130.829 Y171.718 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4748
G1 X130.825 Y171.719 E.00014
G3 X130.48 Y170.211 I-.324 J-.72 E.0858
G1 X130.561 Y170.212 E.00247
G3 X130.961 Y171.641 I-.06 J.787 E.05928
G1 X130.881 Y171.688 E.00285
M204 S10000
; WIPE_START
G1 F24000
G1 X130.825 Y171.719 E-.02448
G1 X130.676 Y171.77 E-.05975
G1 X130.52 Y171.789 E-.05976
G1 X130.251 Y171.75 E-.1033
G1 X130.105 Y171.684 E-.06071
G1 X129.977 Y171.592 E-.05976
G1 X129.87 Y171.477 E-.05977
G1 X129.788 Y171.343 E-.05976
G1 X129.735 Y171.195 E-.05976
G1 X129.711 Y171.039 E-.05977
G1 X129.719 Y170.882 E-.05976
G1 X129.758 Y170.73 E-.05976
G1 X129.796 Y170.65 E-.03368
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.199 J.207 P1  F30000
G1 X138.664 Y119.364 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4748
G3 X138.49 Y118.603 I-.159 J-.364 E.04631
G1 X138.539 Y118.604 E.00163
G3 X138.717 Y119.335 I-.034 J.396 E.03282
G1 X138.829 Y119.718 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4748
G1 X138.823 Y119.717 E.00016
G3 X138.48 Y118.211 I-.322 J-.719 E.08562
G1 X138.561 Y118.212 E.00247
G3 X138.959 Y119.639 I-.059 J.786 E.05919
G1 X138.88 Y119.687 E.00284
M204 S10000
; WIPE_START
G1 F24000
G1 X138.823 Y119.717 E-.02443
G1 X138.676 Y119.77 E-.05965
G1 X138.52 Y119.789 E-.05976
G1 X138.248 Y119.749 E-.10423
G1 X138.105 Y119.684 E-.05976
G1 X137.977 Y119.592 E-.05976
G1 X137.87 Y119.477 E-.05976
G1 X137.788 Y119.343 E-.05976
G1 X137.735 Y119.195 E-.05976
G1 X137.711 Y119.039 E-.05976
G1 X137.719 Y118.882 E-.05977
G1 X137.758 Y118.73 E-.05976
G1 X137.797 Y118.65 E-.03385
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.183 J-.286 P1  F30000
G1 X130.225 Y87.282 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4748
G3 X130.49 Y86.603 I.28 J-.282 E.03059
G1 X130.539 Y86.604 E.00163
G3 X130.271 Y87.321 I-.034 J.396 E.04854
G1 X129.953 Y87.568 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4748
G1 X129.95 Y87.564 E.00016
G3 X130.48 Y86.211 I.551 J-.565 E.0568
G1 X130.561 Y86.212 E.00247
G3 X130.072 Y87.662 I-.059 J.787 E.08829
G1 X130 Y87.605 E.00283
M204 S10000
; WIPE_START
G1 F24000
G1 X129.95 Y87.564 E-.02466
G1 X129.847 Y87.445 E-.0597
G1 X129.772 Y87.307 E-.05977
G1 X129.711 Y87.039 E-.10421
G1 X129.719 Y86.882 E-.05977
G1 X129.758 Y86.73 E-.05976
G1 X129.826 Y86.588 E-.05976
G1 X129.921 Y86.463 E-.05976
G1 X130.039 Y86.359 E-.05976
G1 X130.175 Y86.28 E-.05976
G1 X130.324 Y86.23 E-.05976
G1 X130.48 Y86.211 E-.05977
G1 X130.561 Y86.212 E-.03049
G1 X130.568 Y86.214 E-.00307
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.024 J-1.217 P1  F30000
G1 X77.794 Y87.273 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4748
G3 X77.49 Y86.603 I-.289 J-.273 E.0516
G1 X77.539 Y86.604 E.00163
G3 X77.832 Y87.226 I-.034 J.396 E.02753
G1 X78.093 Y87.516 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4748
G1 X78.079 Y87.537 E.00077
G3 X77.48 Y86.211 I-.578 J-.538 E.09548
G1 X77.561 Y86.212 E.00247
G3 X78.212 Y87.343 I-.059 J.787 E.04718
G1 X78.127 Y87.467 E.00462
M204 S10000
; WIPE_START
G1 F24000
G1 X78.079 Y87.537 E-.03232
G1 X77.961 Y87.641 E-.05976
G1 X77.825 Y87.72 E-.05976
G1 X77.676 Y87.77 E-.05976
G1 X77.52 Y87.789 E-.05976
G1 X77.363 Y87.778 E-.05976
G1 X77.211 Y87.735 E-.05976
G1 X77.072 Y87.663 E-.05976
G1 X76.949 Y87.565 E-.05978
G1 X76.788 Y87.343 E-.10421
G1 X76.735 Y87.195 E-.05976
G1 X76.711 Y87.039 E-.05976
G1 X76.715 Y86.971 E-.02585
; WIPE_END
M73 P71 R14
G1 E-.04 F1800
G17
G3 Z5.6 I-1.217 J.016 P1  F30000
G1 X77.794 Y170.727 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4748
G3 X77.49 Y170.603 I-.289 J.272 E.07154
G1 X77.539 Y170.604 E.00164
G3 X77.75 Y170.687 I-.034 J.396 E.00759
G1 X78.079 Y170.462 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4748
G3 X77.48 Y170.211 I-.578 J.537 E.1318
G1 X77.561 Y170.212 E.00247
G3 X78.037 Y170.42 I-.06 J.787 E.01627
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X78.174 Y170.588 E-.08243
G1 X78.242 Y170.73 E-.05976
G1 X78.281 Y170.882 E-.05976
G1 X78.289 Y171.039 E-.05976
G1 X78.265 Y171.195 E-.05976
G1 X78.212 Y171.343 E-.05976
G1 X78.079 Y171.537 E-.08946
G1 X77.961 Y171.641 E-.05976
G1 X77.825 Y171.72 E-.05976
G1 X77.676 Y171.77 E-.05976
G1 X77.52 Y171.789 E-.05976
G1 X77.389 Y171.77 E-.05027
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/125
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
G3 Z5.6 I.992 J.706 P1  F30000
G1 X148.102 Y72.398 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4755
G1 X148.102 Y69.602 E.09274
G1 X186.898 Y69.602 E1.28693
G1 X186.898 Y72.398 E.09274
G1 X148.162 Y72.398 E1.28494
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4755
G1 X147.71 Y69.21 E.11
G1 X187.29 Y69.21 E1.21618
G1 X187.29 Y72.79 E.11
G1 X147.77 Y72.79 E1.21434
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4755
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
M73 P72 R14
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X178.274 Y72.05 E.14719
G1 X180.374 Y69.95 E.09848
G1 X179.414 Y69.95 E.03184
G1 X181.513 Y72.05 E.09848
G1 X185.95 Y72.05 E.14719
G1 X186.55 Y71.45 E.02811
G1 X186.55 Y69.95 E.04976
G1 X186.421 Y69.95 E.00426
; WIPE_START
G1 F24000
G1 X186.55 Y69.95 E-.04875
G1 X186.55 Y71.45 E-.57001
G1 X186.287 Y71.713 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.152 J-.393 P1  F30000
G1 X148.102 Y183.602 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4755
G1 X186.898 Y183.602 E1.28693
G1 X186.898 Y186.398 E.09274
G1 X148.102 Y186.398 E1.28693
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4755
G1 X187.29 Y183.21 E1.21618
G1 X187.29 Y186.79 E.11
G1 X147.71 Y186.79 E1.21618
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.267 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.974 J-.729 P1  F30000
G1 X149.199 Y183.95 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4755
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X178.274 Y183.95 E.14719
G1 X180.374 Y186.05 E.09848
G1 X179.414 Y186.05 E.03184
G1 X181.513 Y183.95 E.09848
G1 X185.95 Y183.95 E.14719
G1 X186.55 Y184.55 E.02812
G1 X186.55 Y186.05 E.04976
G1 X186.421 Y186.05 E.00426
; WIPE_START
G1 F24000
G1 X186.55 Y186.05 E-.04876
G1 X186.55 Y184.55 E-.57
G1 X186.287 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.124 J-.467 P1  F30000
G1 X180.913 Y171.364 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4755
G3 X180.74 Y170.603 I-.159 J-.364 E.04631
G1 X180.788 Y170.604 E.00162
G3 X180.966 Y171.336 I-.034 J.396 E.03284
G1 X181.076 Y171.719 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4755
G1 X181.074 Y171.719 E.00007
G3 X180.73 Y170.211 I-.324 J-.72 E.08583
G1 X180.808 Y170.212 E.0024
G3 X181.21 Y171.641 I-.058 J.787 E.05931
G1 X181.128 Y171.689 E.00292
M204 S10000
; WIPE_START
G1 F24000
G1 X181.074 Y171.719 E-.02358
G1 X180.925 Y171.77 E-.05973
G1 X180.769 Y171.789 E-.05976
G1 X180.5 Y171.749 E-.10338
G1 X180.354 Y171.684 E-.06062
G1 X180.227 Y171.592 E-.05977
G1 X180.12 Y171.477 E-.05976
G1 X180.038 Y171.343 E-.05976
G1 X179.984 Y171.195 E-.05976
G1 X179.961 Y171.039 E-.05976
G1 X179.968 Y170.882 E-.05976
G1 X180.007 Y170.73 E-.05976
G1 X180.047 Y170.648 E-.0346
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.018 J-1.217 P1  F30000
G1 X130.664 Y171.364 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4755
G3 X130.49 Y170.603 I-.159 J-.364 E.04631
G1 X130.539 Y170.604 E.00162
G3 X130.717 Y171.336 I-.034 J.396 E.03284
G1 X130.828 Y171.718 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4755
G1 X130.823 Y171.717 E.00015
G3 X130.48 Y170.211 I-.323 J-.719 E.08565
G1 X130.558 Y170.212 E.0024
G3 X130.959 Y171.639 I-.058 J.786 E.05923
G1 X130.879 Y171.687 E.00287
M204 S10000
; WIPE_START
G1 F24000
G1 X130.823 Y171.717 E-.02405
G1 X130.676 Y171.77 E-.05964
G1 X130.52 Y171.789 E-.05977
G1 X130.248 Y171.749 E-.10422
G1 X130.105 Y171.684 E-.05976
G1 X129.977 Y171.592 E-.05976
G1 X129.87 Y171.477 E-.05977
G1 X129.788 Y171.343 E-.05975
G1 X129.735 Y171.195 E-.05976
G1 X129.711 Y171.039 E-.05976
G1 X129.719 Y170.882 E-.05976
G1 X129.758 Y170.73 E-.05976
G1 X129.797 Y170.649 E-.03423
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.199 J.207 P1  F30000
G1 X138.664 Y119.364 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4755
G3 X138.49 Y118.603 I-.159 J-.364 E.04631
G1 X138.539 Y118.604 E.00162
G3 X138.717 Y119.336 I-.034 J.396 E.03284
G1 X138.828 Y119.718 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4755
G1 X138.823 Y119.717 E.00014
G3 X138.48 Y118.21 I-.323 J-.719 E.08565
G1 X138.558 Y118.212 E.0024
G3 X138.959 Y119.639 I-.058 J.786 E.05923
G1 X138.879 Y119.687 E.00288
M204 S10000
; WIPE_START
G1 F24000
G1 X138.823 Y119.717 E-.02391
G1 X138.676 Y119.77 E-.05964
G1 X138.52 Y119.789 E-.05976
G1 X138.248 Y119.749 E-.10422
G1 X138.105 Y119.684 E-.05977
G1 X137.977 Y119.592 E-.05976
G1 X137.87 Y119.477 E-.05976
G1 X137.788 Y119.343 E-.05976
G1 X137.735 Y119.195 E-.05976
G1 X137.711 Y119.039 E-.05976
G1 X137.719 Y118.882 E-.05976
G1 X137.758 Y118.73 E-.05976
G1 X137.797 Y118.648 E-.03437
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.183 J-.286 P1  F30000
G1 X130.225 Y87.282 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4755
G3 X130.49 Y86.603 I.28 J-.282 E.03059
G1 X130.539 Y86.604 E.00162
G3 X130.271 Y87.321 I-.034 J.396 E.04856
G1 X129.951 Y87.568 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4755
G1 X129.949 Y87.564 E.00011
G3 X130.48 Y86.21 I.551 J-.565 E.05683
G1 X130.558 Y86.212 E.0024
G3 X130.072 Y87.662 I-.058 J.787 E.08832
G1 X129.999 Y87.605 E.00288
M204 S10000
; WIPE_START
G1 F24000
G1 X129.949 Y87.564 E-.02411
G1 X129.847 Y87.445 E-.05972
G1 X129.772 Y87.307 E-.0598
G1 X129.711 Y87.039 E-.10419
G1 X129.719 Y86.882 E-.05976
G1 X129.758 Y86.73 E-.05976
G1 X129.826 Y86.588 E-.05976
G1 X129.921 Y86.463 E-.05976
G1 X130.039 Y86.359 E-.05976
G1 X130.175 Y86.28 E-.05976
G1 X130.324 Y86.23 E-.05975
G1 X130.48 Y86.21 E-.05981
G1 X130.558 Y86.212 E-.02963
G1 X130.57 Y86.215 E-.00443
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.024 J-1.217 P1  F30000
G1 X77.794 Y87.273 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4755
G3 X77.49 Y86.603 I-.288 J-.273 E.0516
G1 X77.539 Y86.604 E.00162
G3 X77.832 Y87.226 I-.034 J.396 E.02755
G1 X78.092 Y87.519 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4755
G1 X78.077 Y87.535 E.00069
G3 X77.48 Y86.21 I-.576 J-.537 E.09529
G1 X77.558 Y86.212 E.0024
G3 X78.209 Y87.342 I-.058 J.786 E.04717
G1 X78.125 Y87.469 E.00469
M204 S10000
; WIPE_START
G1 F24000
G1 X78.077 Y87.535 E-.03121
G1 X77.961 Y87.641 E-.05967
G1 X77.825 Y87.72 E-.05976
G1 X77.676 Y87.77 E-.05976
G1 X77.52 Y87.789 E-.05976
G1 X77.248 Y87.749 E-.10423
G1 X77.105 Y87.684 E-.05976
G1 X76.977 Y87.592 E-.05976
G1 X76.87 Y87.477 E-.05977
G1 X76.788 Y87.343 E-.05977
G1 X76.735 Y87.195 E-.05976
G1 X76.711 Y87.039 E-.05976
G1 X76.715 Y86.968 E-.02705
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.217 J.016 P1  F30000
G1 X77.794 Y170.727 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4755
G3 X77.49 Y170.603 I-.289 J.273 E.07154
G1 X77.539 Y170.604 E.00162
G3 X77.75 Y170.687 I-.034 J.396 E.00761
G1 X78.079 Y170.463 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4755
G3 X77.48 Y170.211 I-.578 J.535 E.13153
G1 X77.558 Y170.212 E.0024
G3 X78.036 Y170.421 I-.058 J.786 E.01633
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X78.174 Y170.588 E-.08241
G1 X78.242 Y170.73 E-.05976
G1 X78.281 Y170.882 E-.05977
G1 X78.289 Y171.039 E-.05976
G1 X78.265 Y171.195 E-.05975
G1 X78.212 Y171.343 E-.05977
G1 X78.079 Y171.537 E-.08945
G1 X77.961 Y171.641 E-.05977
G1 X77.825 Y171.72 E-.05976
G1 X77.676 Y171.77 E-.05976
G1 X77.52 Y171.789 E-.05976
G1 X77.389 Y171.77 E-.05028
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/125
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
G3 Z5.8 I.992 J.706 P1  F30000
G1 X148.102 Y72.398 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4754
G1 X148.102 Y69.602 E.09274
G1 X186.898 Y69.602 E1.28693
G1 X186.898 Y72.398 E.09274
G1 X148.162 Y72.398 E1.28494
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4754
G1 X147.71 Y69.21 E.11
G1 X187.29 Y69.21 E1.21618
G1 X187.29 Y72.79 E.11
G1 X147.77 Y72.79 E1.21434
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4754
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X178.274 Y72.05 E.14719
G1 X180.374 Y69.95 E.09848
G1 X179.414 Y69.95 E.03184
G1 X181.513 Y72.05 E.09848
G1 X185.95 Y72.05 E.14719
G1 X186.55 Y71.45 E.02811
G1 X186.55 Y69.95 E.04976
G1 X186.421 Y69.95 E.00426
; WIPE_START
G1 F24000
G1 X186.55 Y69.95 E-.04875
G1 X186.55 Y71.45 E-.57001
G1 X186.287 Y71.713 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.152 J-.393 P1  F30000
G1 X148.102 Y183.602 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4754
G1 X186.898 Y183.602 E1.28693
G1 X186.898 Y186.398 E.09274
G1 X148.102 Y186.398 E1.28693
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4754
G1 X187.29 Y183.21 E1.21618
G1 X187.29 Y186.79 E.11
G1 X147.71 Y186.79 E1.21618
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.267 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.974 J-.729 P1  F30000
G1 X149.199 Y183.95 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4754
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X178.274 Y183.95 E.14719
G1 X180.374 Y186.05 E.09848
G1 X179.414 Y186.05 E.03184
G1 X181.513 Y183.95 E.09848
G1 X185.95 Y183.95 E.14719
G1 X186.55 Y184.55 E.02812
G1 X186.55 Y186.05 E.04976
G1 X186.421 Y186.05 E.00426
; WIPE_START
G1 F24000
G1 X186.55 Y186.05 E-.04876
G1 X186.55 Y184.55 E-.57
G1 X186.287 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.122 J-.47 P1  F30000
G1 X180.876 Y171.377 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4754
G3 X180.782 Y170.604 I-.125 J-.377 E.04667
G1 X180.793 Y170.605 E.00035
G3 X180.931 Y171.353 I-.042 J.395 E.03375
G1 X181.074 Y171.719 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4754
G3 X180.73 Y170.21 I-.324 J-.719 E.08586
G1 X180.805 Y170.212 E.00233
G3 X181.127 Y171.692 I-.056 J.787 E.06234
M204 S10000
; WIPE_START
G1 F24000
G1 X180.925 Y171.77 E-.0824
G1 X180.769 Y171.789 E-.05976
G1 X180.5 Y171.749 E-.10347
G1 X180.354 Y171.684 E-.06053
G1 X180.227 Y171.592 E-.05977
G1 X180.12 Y171.477 E-.05975
G1 X180.038 Y171.343 E-.05976
G1 X179.984 Y171.195 E-.05977
G1 X179.961 Y171.039 E-.05975
G1 X179.968 Y170.882 E-.05977
G1 X180.007 Y170.73 E-.05976
G1 X180.048 Y170.646 E-.03551
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.018 J-1.217 P1  F30000
G1 X130.628 Y171.376 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4754
G1 X130.626 Y171.374 E.00011
G3 X130.533 Y170.604 I-.124 J-.375 E.04647
G1 X130.544 Y170.605 E.00035
G3 X130.761 Y171.296 I-.042 J.393 E.03039
G1 X130.68 Y171.345 E.00316
G1 X130.826 Y171.719 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4754
G1 X130.823 Y171.716 E.00012
G3 X130.48 Y170.21 I-.323 J-.718 E.08569
G1 X130.556 Y170.212 E.00233
G3 X130.959 Y171.638 I-.056 J.786 E.05927
G1 X130.878 Y171.688 E.00292
M204 S10000
; WIPE_START
G1 F24000
G1 X130.823 Y171.716 E-.02334
G1 X130.676 Y171.77 E-.05964
G1 X130.52 Y171.789 E-.05977
G1 X130.248 Y171.749 E-.10422
G1 X130.105 Y171.684 E-.05976
G1 X129.977 Y171.592 E-.05977
G1 X129.87 Y171.477 E-.05976
G1 X129.788 Y171.343 E-.05976
G1 X129.735 Y171.195 E-.05975
G1 X129.711 Y171.039 E-.05977
G1 X129.719 Y170.882 E-.05976
G1 X129.758 Y170.73 E-.05977
G1 X129.798 Y170.647 E-.03495
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.199 J.207 P1  F30000
G1 X138.628 Y119.375 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4754
G1 X138.626 Y119.376 E.00007
G3 X138.533 Y118.604 I-.125 J-.377 E.04668
G1 X138.544 Y118.605 E.00035
G3 X138.763 Y119.298 I-.043 J.395 E.03047
G1 X138.68 Y119.346 E.00316
G1 X138.827 Y119.719 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4754
G1 X138.824 Y119.719 E.00007
G3 X138.48 Y118.21 I-.324 J-.719 E.08586
G1 X138.556 Y118.212 E.00233
G3 X138.96 Y119.64 I-.056 J.787 E.05935
G1 X138.878 Y119.688 E.00292
M204 S10000
; WIPE_START
G1 F24000
G1 X138.824 Y119.719 E-.02358
G1 X138.676 Y119.77 E-.05973
G1 X138.52 Y119.789 E-.05976
G1 X138.363 Y119.778 E-.05976
G1 X138.211 Y119.735 E-.05982
G1 X137.977 Y119.592 E-.10416
G1 X137.87 Y119.477 E-.05977
G1 X137.788 Y119.343 E-.05976
G1 X137.735 Y119.195 E-.05977
G1 X137.711 Y119.039 E-.05975
G1 X137.719 Y118.882 E-.05978
G1 X137.758 Y118.73 E-.05976
G1 X137.797 Y118.648 E-.03461
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.183 J-.286 P1  F30000
G1 X130.197 Y87.257 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4754
G1 X130.198 Y87.254 E.00009
G3 X130.533 Y86.604 I.304 J-.255 E.0309
G1 X130.544 Y86.605 E.00035
G3 X130.32 Y87.351 I-.043 J.394 E.04613
G1 X130.245 Y87.293 E.00315
G1 X129.95 Y87.567 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4754
G1 X129.951 Y87.563 E.00012
G3 X130.48 Y86.21 I.549 J-.565 E.05678
G1 X130.556 Y86.212 E.00233
G3 X130.073 Y87.66 I-.056 J.786 E.08817
G1 X129.998 Y87.603 E.00292
M204 S10000
; WIPE_START
G1 F24000
G1 X129.951 Y87.563 E-.02342
G1 X129.847 Y87.445 E-.05964
G1 X129.772 Y87.307 E-.05976
G1 X129.711 Y87.039 E-.10423
G1 X129.719 Y86.882 E-.05975
G1 X129.758 Y86.73 E-.05977
G1 X129.826 Y86.588 E-.05976
G1 X129.921 Y86.463 E-.05976
G1 X130.039 Y86.359 E-.05977
G1 X130.175 Y86.28 E-.05976
G1 X130.324 Y86.23 E-.05975
G1 X130.48 Y86.21 E-.05983
G1 X130.556 Y86.212 E-.02877
G1 X130.572 Y86.215 E-.00603
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.024 J-1.217 P1  F30000
G1 X77.788 Y87.265 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4754
G1 X77.762 Y87.297 E.00135
G3 X77.533 Y86.604 I-.261 J-.298 E.05183
G1 X77.544 Y86.605 E.00035
G3 X77.858 Y87.172 I-.043 J.394 E.02518
G1 X77.824 Y87.217 E.00187
G1 X78.104 Y87.505 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4754
G1 X78.02 Y87.59 E.00366
G3 X77.48 Y86.21 I-.52 J-.592 E.09291
G1 X77.556 Y86.212 E.00233
G3 X78.14 Y87.457 I-.056 J.786 E.05135
M204 S10000
; WIPE_START
G1 F24000
G1 X78.02 Y87.59 E-.06797
G1 X77.895 Y87.684 E-.05965
G1 X77.752 Y87.749 E-.05976
G1 X77.52 Y87.789 E-.08945
G1 X77.363 Y87.778 E-.05977
G1 X77.211 Y87.735 E-.05975
G1 X77.072 Y87.663 E-.05976
G1 X76.949 Y87.565 E-.05977
G1 X76.847 Y87.445 E-.05976
G1 X76.772 Y87.307 E-.05976
G1 X76.711 Y87.039 E-.10423
G1 X76.714 Y86.986 E-.02038
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.217 J.016 P1  F30000
G1 X77.789 Y170.732 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4754
G3 X77.49 Y170.603 I-.293 J.268 E.07159
G1 X77.522 Y170.604 E.00106
G3 X77.745 Y170.691 I-.026 J.396 E.00807
G1 X78.078 Y170.464 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4754
G3 X77.48 Y170.211 I-.579 J.536 E.13181
G1 X77.556 Y170.212 E.00234
G3 X78.036 Y170.421 I-.058 J.787 E.01637
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X78.174 Y170.588 E-.08239
G1 X78.242 Y170.73 E-.05976
G1 X78.281 Y170.882 E-.05977
G1 X78.289 Y171.039 E-.05976
G1 X78.265 Y171.195 E-.05975
G1 X78.212 Y171.343 E-.05977
G1 X78.079 Y171.537 E-.08946
G1 X77.961 Y171.641 E-.05976
G1 X77.825 Y171.72 E-.05976
G1 X77.676 Y171.77 E-.05977
G1 X77.52 Y171.789 E-.05976
G1 X77.389 Y171.77 E-.0503
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/125
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
G3 Z6 I.992 J.706 P1  F30000
G1 X148.102 Y72.398 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4755
G1 X148.102 Y69.602 E.09274
G1 X186.898 Y69.602 E1.28693
G1 X186.898 Y72.398 E.09274
G1 X148.162 Y72.398 E1.28494
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4755
G1 X147.71 Y69.21 E.11
G1 X187.29 Y69.21 E1.21618
G1 X187.29 Y72.79 E.11
G1 X147.77 Y72.79 E1.21434
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4755
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X178.274 Y72.05 E.14719
G1 X180.374 Y69.95 E.09848
G1 X179.414 Y69.95 E.03184
G1 X181.513 Y72.05 E.09848
G1 X185.95 Y72.05 E.14719
G1 X186.55 Y71.45 E.02811
G1 X186.55 Y69.95 E.04976
G1 X186.421 Y69.95 E.00426
; WIPE_START
G1 F24000
G1 X186.55 Y69.95 E-.04875
G1 X186.55 Y71.45 E-.57001
G1 X186.287 Y71.713 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.152 J-.393 P1  F30000
G1 X148.102 Y183.602 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4755
G1 X186.898 Y183.602 E1.28693
G1 X186.898 Y186.398 E.09274
G1 X148.102 Y186.398 E1.28693
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4755
G1 X187.29 Y183.21 E1.21618
G1 X187.29 Y186.79 E.11
G1 X147.71 Y186.79 E1.21618
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.267 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.974 J-.729 P1  F30000
G1 X149.199 Y183.95 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4755
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X178.274 Y183.95 E.14719
G1 X180.374 Y186.05 E.09848
G1 X179.414 Y186.05 E.03184
G1 X181.513 Y183.95 E.09848
G1 X185.95 Y183.95 E.14719
G1 X186.55 Y184.55 E.02812
G1 X186.55 Y186.05 E.04976
G1 X186.421 Y186.05 E.00426
; WIPE_START
G1 F24000
G1 X186.55 Y186.05 E-.04876
G1 X186.55 Y184.55 E-.57
G1 X186.287 Y184.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.122 J-.47 P1  F30000
G1 X180.876 Y171.377 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4755
G3 X180.781 Y170.604 I-.125 J-.377 E.04661
G1 X180.793 Y170.605 E.00042
G3 X180.931 Y171.353 I-.043 J.395 E.03373
G1 X181.072 Y171.72 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4755
G1 X180.925 Y171.769 E.00478
G3 X180.73 Y170.21 I-.176 J-.769 E.08106
G1 X180.803 Y170.212 E.00226
G3 X181.126 Y171.693 I-.054 J.787 E.06244
M204 S10000
; WIPE_START
G1 F24000
G1 X180.925 Y171.769 E-.08158
G1 X180.769 Y171.789 E-.05972
G1 X180.499 Y171.749 E-.10355
G1 X180.354 Y171.684 E-.06045
G1 X180.227 Y171.592 E-.05977
G1 X180.12 Y171.477 E-.05975
G1 X180.038 Y171.343 E-.05976
G1 X179.984 Y171.195 E-.05977
G1 X179.961 Y171.039 E-.05975
G1 X179.968 Y170.882 E-.05977
G1 X180.007 Y170.73 E-.05976
G1 X180.049 Y170.644 E-.03637
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.018 J-1.217 P1  F30000
G1 X130.626 Y171.374 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4755
G3 X130.531 Y170.604 I-.124 J-.375 E.0464
G1 X130.544 Y170.605 E.00042
G3 X130.681 Y171.35 I-.043 J.393 E.03361
G1 X130.823 Y171.716 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4755
G3 X130.481 Y170.21 I-.324 J-.718 E.08572
G1 X130.554 Y170.212 E.00226
G3 X130.877 Y171.69 I-.054 J.786 E.06228
M204 S10000
; WIPE_START
G1 F24000
G1 X130.676 Y171.77 E-.08235
G1 X130.52 Y171.789 E-.05976
G1 X130.248 Y171.749 E-.10422
G1 X130.105 Y171.684 E-.05977
G1 X129.977 Y171.592 E-.05976
G1 X129.87 Y171.477 E-.05976
G1 X129.788 Y171.343 E-.05976
G1 X129.735 Y171.195 E-.05976
G1 X129.711 Y171.039 E-.05976
G1 X129.719 Y170.882 E-.05977
G1 X129.758 Y170.73 E-.05976
G1 X129.799 Y170.646 E-.03558
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.199 J.207 P1  F30000
G1 X138.627 Y119.376 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4755
G1 X138.626 Y119.374 E.0001
G3 X138.531 Y118.604 I-.124 J-.375 E.0464
G1 X138.544 Y118.605 E.00042
G3 X138.761 Y119.296 I-.043 J.393 E.03038
G1 X138.678 Y119.346 E.00321
G1 X138.823 Y119.716 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4755
G3 X138.481 Y118.21 I-.324 J-.718 E.08572
G1 X138.554 Y118.212 E.00226
G3 X138.877 Y119.69 I-.054 J.786 E.06228
M204 S10000
; WIPE_START
G1 F24000
G1 X138.676 Y119.77 E-.08234
G1 X138.52 Y119.789 E-.05976
G1 X138.248 Y119.749 E-.10422
G1 X138.105 Y119.684 E-.05976
G1 X137.977 Y119.592 E-.05976
G1 X137.87 Y119.477 E-.05976
G1 X137.788 Y119.343 E-.05976
G1 X137.735 Y119.195 E-.05976
G1 X137.711 Y119.039 E-.05975
G1 X137.719 Y118.882 E-.05977
G1 X137.758 Y118.73 E-.05976
G1 X137.799 Y118.646 E-.03559
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.183 J-.286 P1  F30000
G1 X130.196 Y87.255 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4755
G1 X130.198 Y87.254 E.00008
G3 X130.531 Y86.604 I.304 J-.255 E.03082
G1 X130.544 Y86.605 E.00042
G3 X130.32 Y87.351 I-.043 J.394 E.04613
G1 X130.243 Y87.292 E.00321
G1 X129.951 Y87.563 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4755
G3 X130.481 Y86.21 I.549 J-.565 E.05681
G1 X130.554 Y86.212 E.00226
G3 X129.995 Y87.603 I-.054 J.786 E.09119
M204 S10000
; WIPE_START
G1 F24000
G1 X129.847 Y87.445 E-.08235
G1 X129.772 Y87.307 E-.05976
G1 X129.711 Y87.039 E-.10423
G1 X129.719 Y86.882 E-.05976
G1 X129.758 Y86.73 E-.05977
G1 X129.826 Y86.588 E-.05976
G1 X129.921 Y86.463 E-.05976
G1 X130.039 Y86.359 E-.05976
G1 X130.175 Y86.28 E-.05976
G1 X130.324 Y86.23 E-.05977
G1 X130.481 Y86.21 E-.05986
G1 X130.554 Y86.212 E-.02789
G1 X130.574 Y86.215 E-.00759
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.025 J-1.217 P1  F30000
G1 X77.773 Y87.284 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4755
G1 X77.762 Y87.297 E.00056
G3 X77.531 Y86.604 I-.261 J-.298 E.05175
G1 X77.544 Y86.605 E.00042
G3 X77.858 Y87.172 I-.043 J.394 E.02518
G1 X77.809 Y87.236 E.00267
G1 X78.088 Y87.523 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4755
G1 X78.076 Y87.535 E.00051
G3 X77.481 Y86.21 I-.577 J-.537 E.09535
G1 X77.554 Y86.212 E.00226
G3 X78.209 Y87.341 I-.054 J.786 E.04726
G1 X78.122 Y87.473 E.00486
M204 S10000
; WIPE_START
G1 F24000
G1 X78.076 Y87.535 E-.02902
G1 X77.961 Y87.641 E-.05964
G1 X77.825 Y87.72 E-.05976
G1 X77.676 Y87.77 E-.05977
G1 X77.52 Y87.789 E-.05976
G1 X77.363 Y87.778 E-.05976
G1 X77.211 Y87.735 E-.05975
G1 X77.072 Y87.663 E-.05977
G1 X76.949 Y87.565 E-.05977
G1 X76.847 Y87.445 E-.05976
G1 X76.772 Y87.307 E-.05977
G1 X76.711 Y87.039 E-.10422
G1 X76.715 Y86.962 E-.02927
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.217 J.016 P1  F30000
G1 X77.792 Y170.729 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4755
G3 X77.531 Y170.604 I-.291 J.271 E.07295
G1 X77.544 Y170.605 E.00043
G3 X77.748 Y170.688 I-.043 J.395 E.00739
G1 X78.079 Y170.463 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4755
G3 X77.481 Y170.21 I-.579 J.536 E.13182
G1 X77.554 Y170.212 E.00226
G3 X78.036 Y170.421 I-.054 J.787 E.01646
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X78.174 Y170.588 E-.08241
G1 X78.242 Y170.73 E-.05976
G1 X78.281 Y170.882 E-.05976
G1 X78.289 Y171.039 E-.05976
G1 X78.265 Y171.195 E-.05975
G1 X78.212 Y171.343 E-.05977
G1 X78.079 Y171.537 E-.08945
G1 X77.961 Y171.641 E-.05976
G1 X77.825 Y171.72 E-.05976
G1 X77.676 Y171.77 E-.05977
G1 X77.52 Y171.789 E-.05976
G1 X77.389 Y171.77 E-.05029
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/125
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
G3 Z6.2 I.992 J.706 P1  F30000
G1 X148.102 Y72.398 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4759
G1 X148.102 Y69.602 E.09274
G1 X186.898 Y69.602 E1.28693
G1 X186.898 Y72.398 E.09274
G1 X148.162 Y72.398 E1.28494
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4759
G1 X147.71 Y69.21 E.11
G1 X187.29 Y69.21 E1.21618
G1 X187.29 Y72.79 E.11
G1 X147.77 Y72.79 E1.21434
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4759
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X178.274 Y72.05 E.14719
G1 X180.374 Y69.95 E.09848
G1 X179.414 Y69.95 E.03184
G1 X181.513 Y72.05 E.09848
G1 X183.142 Y72.05 E.05401
G1 X186.222 Y72.037 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.358
G1 F4759
G1 X186.537 Y72.037 E.00809
G1 X186.537 Y69.965 E.05319
G1 X186.222 Y69.969 E.00809
G1 X186.222 Y71.977 E.05155
; WIPE_START
G1 F24000
G1 X186.222 Y69.977 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.154 J-.387 P1  F30000
G1 X148.102 Y183.602 Z6.4
M73 P73 R14
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4759
G1 X186.898 Y183.602 E1.28693
G1 X186.898 Y186.398 E.09274
G1 X148.102 Y186.398 E1.28693
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4759
G1 X187.29 Y183.21 E1.21618
G1 X187.29 Y186.79 E.11
G1 X147.71 Y186.79 E1.21618
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.267 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.975 J-.729 P1  F30000
G1 X149.199 Y183.95 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4759
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X178.274 Y183.95 E.14719
G1 X180.374 Y186.05 E.09848
G1 X179.414 Y186.05 E.03184
G1 X181.513 Y183.95 E.09848
G1 X183.142 Y183.95 E.05401
G1 X186.222 Y183.969 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.358
G1 F4759
G1 X186.222 Y186.037 E.05309
G1 X186.537 Y186.037 E.00809
G1 X186.537 Y183.965 E.05319
G1 X186.282 Y183.968 E.00655
; WIPE_START
G1 F24000
G1 X186.537 Y183.965 E-.09694
G1 X186.537 Y185.71 E-.66306
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.132 J-.447 P1  F30000
G1 X180.876 Y171.377 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4759
G3 X180.779 Y170.604 I-.125 J-.377 E.04654
G1 X180.794 Y170.605 E.0005
G3 X180.931 Y171.353 I-.043 J.395 E.03372
G1 X181.07 Y171.721 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4759
G1 X180.925 Y171.769 E.00471
G3 X180.73 Y170.21 I-.176 J-.769 E.08109
G1 X180.801 Y170.212 E.00219
G3 X181.124 Y171.694 I-.053 J.787 E.06254
M204 S10000
; WIPE_START
G1 F24000
G1 X180.925 Y171.769 E-.08084
G1 X180.769 Y171.789 E-.05971
G1 X180.499 Y171.749 E-.10362
G1 X180.354 Y171.684 E-.06038
G1 X180.227 Y171.592 E-.05977
G1 X180.12 Y171.477 E-.05975
G1 X180.038 Y171.343 E-.05976
G1 X179.984 Y171.195 E-.05977
G1 X179.961 Y171.039 E-.05975
G1 X179.968 Y170.882 E-.05977
G1 X180.007 Y170.73 E-.05976
G1 X180.05 Y170.642 E-.03712
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.018 J-1.217 P1  F30000
G1 X130.626 Y171.374 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4759
G3 X130.53 Y170.604 I-.124 J-.375 E.04633
G1 X130.545 Y170.605 E.0005
G3 X130.681 Y171.35 I-.043 J.393 E.03359
G1 X130.823 Y171.72 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4759
G1 X130.675 Y171.766 E.00477
G3 X130.481 Y170.21 I-.176 J-.768 E.08093
G1 X130.552 Y170.212 E.00218
G3 X130.873 Y171.691 I-.053 J.786 E.06245
M204 S10000
; WIPE_START
G1 F24000
G1 X130.675 Y171.766 E-.08054
G1 X130.52 Y171.789 E-.05962
G1 X130.248 Y171.749 E-.10423
G1 X130.105 Y171.684 E-.05976
G1 X129.977 Y171.592 E-.05976
G1 X129.87 Y171.477 E-.05976
G1 X129.788 Y171.343 E-.05975
G1 X129.735 Y171.195 E-.05976
G1 X129.711 Y171.039 E-.05976
G1 X129.719 Y170.882 E-.05977
G1 X129.758 Y170.73 E-.05976
G1 X129.801 Y170.641 E-.03753
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.199 J.206 P1  F30000
G1 X138.627 Y119.377 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4759
G3 X138.53 Y118.604 I-.125 J-.377 E.04655
G1 X138.545 Y118.605 E.0005
G3 X138.682 Y119.353 I-.043 J.395 E.03371
G1 X138.823 Y119.72 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4759
G1 X138.675 Y119.769 E.00478
G3 X138.481 Y118.21 I-.176 J-.769 E.08109
G1 X138.552 Y118.212 E.00219
G3 X138.876 Y119.693 I-.053 J.787 E.06248
M204 S10000
; WIPE_START
G1 F24000
G1 X138.675 Y119.769 E-.08153
G1 X138.52 Y119.789 E-.05971
G1 X138.363 Y119.778 E-.05977
G1 X138.211 Y119.735 E-.05975
G1 X137.979 Y119.593 E-.10361
G1 X137.87 Y119.477 E-.06039
G1 X137.788 Y119.343 E-.05976
G1 X137.735 Y119.195 E-.05976
G1 X137.711 Y119.039 E-.05976
G1 X137.719 Y118.882 E-.05977
G1 X137.758 Y118.73 E-.05976
G1 X137.799 Y118.644 E-.03644
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.183 J-.286 P1  F30000
G1 X130.198 Y87.254 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4759
G3 X130.53 Y86.604 I.304 J-.255 E.03076
G1 X130.545 Y86.605 E.0005
G3 X130.24 Y87.297 I-.043 J.394 E.04934
G1 X129.948 Y87.564 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4759
G1 X129.849 Y87.444 E.00478
G3 X130.481 Y86.21 I.65 J-.446 E.05201
G1 X130.552 Y86.212 E.00218
G3 X129.993 Y87.602 I-.053 J.786 E.09132
M204 S10000
; WIPE_START
G1 F24000
G1 X129.849 Y87.444 E-.0811
G1 X129.772 Y87.307 E-.05968
G1 X129.711 Y87.039 E-.10422
G1 X129.719 Y86.882 E-.05977
G1 X129.758 Y86.73 E-.05976
G1 X129.826 Y86.588 E-.05976
G1 X129.921 Y86.463 E-.05976
G1 X130.039 Y86.359 E-.05976
G1 X130.175 Y86.28 E-.05976
G1 X130.324 Y86.23 E-.05977
G1 X130.481 Y86.21 E-.05988
G1 X130.552 Y86.212 E-.02702
G1 X130.577 Y86.216 E-.00976
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.025 J-1.217 P1  F30000
G1 X77.771 Y87.287 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4759
G1 X77.762 Y87.297 E.00046
G3 X77.53 Y86.604 I-.261 J-.298 E.05169
G1 X77.545 Y86.605 E.0005
G3 X77.858 Y87.172 I-.043 J.394 E.02516
G1 X77.807 Y87.239 E.00277
G1 X78.087 Y87.526 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4759
G1 X78.076 Y87.534 E.00042
G3 X77.481 Y86.21 I-.577 J-.536 E.09537
G1 X77.552 Y86.212 E.00219
G3 X78.208 Y87.341 I-.053 J.786 E.04731
G1 X78.12 Y87.476 E.00495
M204 S10000
; WIPE_START
G1 F24000
G1 X78.076 Y87.534 E-.02783
G1 X77.961 Y87.641 E-.05963
G1 X77.825 Y87.72 E-.05977
G1 X77.676 Y87.77 E-.05976
G1 X77.52 Y87.789 E-.05976
G1 X77.363 Y87.778 E-.05976
G1 X77.173 Y87.719 E-.07561
G1 X76.977 Y87.592 E-.08846
G1 X76.87 Y87.477 E-.05976
G1 X76.788 Y87.343 E-.05976
G1 X76.735 Y87.195 E-.05977
G1 X76.711 Y87.039 E-.05976
G1 X76.715 Y86.96 E-.03037
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.217 J.016 P1  F30000
G1 X77.792 Y170.729 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4759
G3 X77.53 Y170.604 I-.29 J.27 E.07273
G1 X77.545 Y170.605 E.0005
G3 X77.748 Y170.688 I-.043 J.394 E.00737
G1 X78.078 Y170.464 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4759
G3 X77.481 Y170.21 I-.579 J.534 E.13155
G1 X77.552 Y170.212 E.00218
G3 X78.036 Y170.421 I-.053 J.786 E.01652
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X78.174 Y170.588 E-.08239
G1 X78.242 Y170.73 E-.05976
G1 X78.281 Y170.882 E-.05976
G1 X78.289 Y171.039 E-.05976
G1 X78.265 Y171.195 E-.05976
G1 X78.212 Y171.343 E-.05976
G1 X78.079 Y171.537 E-.08946
G1 X77.961 Y171.641 E-.05976
G1 X77.825 Y171.72 E-.05976
G1 X77.676 Y171.77 E-.05976
G1 X77.52 Y171.789 E-.05976
G1 X77.388 Y171.78 E-.0503
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/125
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
G3 Z6.4 I.992 J.706 P1  F30000
G1 X148.102 Y72.398 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4744
G1 X148.102 Y69.602 E.09274
G1 X186.714 Y69.602 E1.28082
G1 X186.714 Y72.398 E.09274
G1 X148.162 Y72.398 E1.27883
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4744
G1 X147.71 Y69.21 E.11
G1 X187.106 Y69.21 E1.21052
G1 X187.106 Y72.79 E.11
G1 X147.77 Y72.79 E1.20868
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4744
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X178.274 Y72.05 E.14719
G1 X180.374 Y69.95 E.09848
G1 X179.414 Y69.95 E.03184
G1 X181.513 Y72.05 E.09848
G1 X183.142 Y72.05 E.05401
G1 X185.899 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4744
G1 X186.307 Y71.991 E.01351
G1 X186.307 Y70.011 E.06568
G1 X185.899 Y70.015 E.01351
G1 X185.899 Y71.931 E.06356
; WIPE_START
G1 F24000
G1 X185.899 Y70.015 E-.72794
G1 X185.984 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.154 J-.385 P1  F30000
G1 X148.102 Y183.602 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4744
G1 X186.714 Y183.602 E1.28082
G1 X186.714 Y186.398 E.09274
G1 X148.102 Y186.398 E1.28082
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4744
G1 X187.106 Y183.21 E1.21052
G1 X187.106 Y186.79 E.11
G1 X147.71 Y186.79 E1.21052
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.267 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.975 J-.729 P1  F30000
G1 X149.199 Y183.95 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4744
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X178.274 Y183.95 E.14719
G1 X180.374 Y186.05 E.09848
G1 X179.414 Y186.05 E.03184
G1 X181.513 Y183.95 E.09848
G1 X183.142 Y183.95 E.05401
G1 X185.899 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4744
G1 X185.899 Y185.991 E.06555
G1 X186.307 Y185.991 E.01351
G1 X186.307 Y184.011 E.06568
G1 X185.959 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X186.307 Y184.011 E-.13194
G1 X186.307 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.138 J-.432 P1  F30000
G1 X180.875 Y171.374 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4744
G3 X180.777 Y170.604 I-.124 J-.375 E.04628
G1 X180.794 Y170.605 E.00057
G3 X180.93 Y171.35 I-.044 J.393 E.03357
G1 X181.068 Y171.722 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4744
G1 X180.924 Y171.766 E.00464
G3 X180.73 Y170.21 I-.176 J-.768 E.08096
G1 X180.799 Y170.212 E.00211
G3 X181.12 Y171.693 I-.051 J.786 E.06258
M204 S10000
; WIPE_START
G1 F24000
G1 X180.924 Y171.766 E-.07947
G1 X180.769 Y171.789 E-.05962
G1 X180.498 Y171.749 E-.10423
G1 X180.354 Y171.684 E-.05976
G1 X180.227 Y171.592 E-.05977
G1 X180.12 Y171.477 E-.05976
G1 X180.038 Y171.343 E-.05977
G1 X179.984 Y171.195 E-.05976
G1 X179.961 Y171.039 E-.05975
G1 X179.968 Y170.882 E-.05977
G1 X180.007 Y170.73 E-.05976
G1 X180.051 Y170.638 E-.03859
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.018 J-1.217 P1  F30000
G1 X130.626 Y171.374 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4744
G3 X130.528 Y170.604 I-.124 J-.375 E.04628
G1 X130.545 Y170.605 E.00057
G3 X130.681 Y171.35 I-.044 J.393 E.03357
G1 X130.822 Y171.721 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4744
G1 X130.675 Y171.766 E.00472
G3 X130.481 Y170.21 I-.176 J-.768 E.08096
G1 X130.549 Y170.212 E.00211
G3 X130.872 Y171.692 I-.051 J.786 E.06252
M204 S10000
; WIPE_START
G1 F24000
G1 X130.675 Y171.766 E-.08015
G1 X130.52 Y171.789 E-.05963
G1 X130.248 Y171.749 E-.10423
G1 X130.105 Y171.684 E-.05976
G1 X129.977 Y171.592 E-.05976
G1 X129.87 Y171.477 E-.05976
G1 X129.788 Y171.343 E-.05976
G1 X129.735 Y171.195 E-.05976
G1 X129.711 Y171.039 E-.05976
G1 X129.719 Y170.882 E-.05976
G1 X129.758 Y170.73 E-.05976
G1 X129.801 Y170.64 E-.03791
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.199 J.206 P1  F30000
G1 X138.626 Y119.374 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4744
G3 X138.528 Y118.604 I-.124 J-.375 E.04628
G1 X138.545 Y118.605 E.00057
G3 X138.681 Y119.35 I-.044 J.393 E.03357
G1 X138.822 Y119.721 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4744
G1 X138.675 Y119.766 E.00472
G3 X138.481 Y118.21 I-.176 J-.768 E.08096
G1 X138.549 Y118.212 E.00211
G3 X138.872 Y119.692 I-.051 J.786 E.06252
M204 S10000
; WIPE_START
G1 F24000
G1 X138.675 Y119.766 E-.08021
G1 X138.52 Y119.789 E-.05961
G1 X138.248 Y119.749 E-.10422
G1 X138.105 Y119.684 E-.05976
G1 X137.977 Y119.592 E-.05977
G1 X137.87 Y119.477 E-.05976
G1 X137.788 Y119.343 E-.05976
G1 X137.735 Y119.195 E-.05976
G1 X137.711 Y119.039 E-.05975
G1 X137.719 Y118.882 E-.05977
G1 X137.758 Y118.73 E-.05976
G1 X137.801 Y118.64 E-.03786
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.183 J-.287 P1  F30000
G1 X130.198 Y87.254 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4744
G3 X130.528 Y86.604 I.304 J-.255 E.0307
G1 X130.545 Y86.605 E.00057
G3 X130.24 Y87.297 I-.044 J.394 E.04932
G1 X129.946 Y87.563 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4744
G1 X129.849 Y87.444 E.00472
G3 X130.481 Y86.21 I.65 J-.446 E.05203
G1 X130.549 Y86.212 E.00211
G3 X129.992 Y87.601 I-.051 J.786 E.0914
M204 S10000
; WIPE_START
G1 F24000
G1 X129.849 Y87.444 E-.08074
G1 X129.772 Y87.307 E-.05969
G1 X129.711 Y87.039 E-.10422
G1 X129.719 Y86.882 E-.05977
G1 X129.758 Y86.73 E-.05976
G1 X129.826 Y86.588 E-.05976
G1 X129.921 Y86.463 E-.05976
G1 X130.039 Y86.359 E-.05976
G1 X130.175 Y86.28 E-.05976
G1 X130.324 Y86.23 E-.05976
G1 X130.481 Y86.21 E-.05992
G1 X130.549 Y86.212 E-.02613
G1 X130.578 Y86.216 E-.01097
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.024 J-1.217 P1  F30000
G1 X77.784 Y87.27 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4744
G1 X77.762 Y87.297 E.00115
G3 X77.528 Y86.604 I-.261 J-.298 E.05163
G1 X77.545 Y86.605 E.00057
G3 X77.858 Y87.172 I-.044 J.394 E.02514
G1 X77.82 Y87.222 E.00207
G1 X78.1 Y87.509 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4744
G1 X78.02 Y87.589 E.00347
G3 X77.481 Y86.21 I-.521 J-.591 E.09299
G1 X77.549 Y86.212 E.00211
G3 X78.136 Y87.461 I-.051 J.786 E.05167
M204 S10000
; WIPE_START
G1 F24000
G1 X78.02 Y87.589 E-.06561
G1 X77.825 Y87.72 E-.08923
G1 X77.676 Y87.77 E-.05976
G1 X77.52 Y87.789 E-.05976
G1 X77.363 Y87.778 E-.05976
G1 X77.211 Y87.735 E-.05976
G1 X77.072 Y87.663 E-.05976
G1 X76.949 Y87.565 E-.05976
G1 X76.847 Y87.445 E-.05976
G1 X76.772 Y87.307 E-.05977
G1 X76.711 Y87.039 E-.10422
G1 X76.714 Y86.979 E-.02286
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.217 J.016 P1  F30000
G1 X77.792 Y170.729 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4744
G3 X77.528 Y170.604 I-.29 J.269 E.07249
G1 X77.545 Y170.605 E.00058
G3 X77.747 Y170.689 I-.044 J.393 E.00736
G1 X78.078 Y170.464 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4744
G3 X77.481 Y170.21 I-.579 J.534 E.13156
G1 X77.549 Y170.212 E.00211
G3 X78.035 Y170.421 I-.051 J.786 E.01658
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X78.174 Y170.588 E-.08239
G1 X78.242 Y170.73 E-.05977
G1 X78.281 Y170.882 E-.05976
G1 X78.289 Y171.039 E-.05977
G1 X78.265 Y171.195 E-.05976
G1 X78.212 Y171.343 E-.05976
G1 X78.079 Y171.537 E-.08945
G1 X77.961 Y171.641 E-.05977
G1 X77.825 Y171.72 E-.05977
G1 X77.676 Y171.77 E-.05976
G1 X77.52 Y171.789 E-.05975
G1 X77.389 Y171.77 E-.0503
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/125
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
G3 Z6.6 I.992 J.706 P1  F30000
G1 X148.102 Y72.398 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4715
G1 X148.102 Y69.602 E.09274
G1 X186.345 Y69.602 E1.2686
G1 X186.345 Y72.398 E.09274
G1 X148.162 Y72.398 E1.26661
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4715
G1 X147.71 Y69.21 E.11
G1 X186.737 Y69.21 E1.1992
G1 X186.737 Y72.79 E.11
G1 X147.77 Y72.79 E1.19736
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4715
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X178.274 Y72.05 E.14719
G1 X180.374 Y69.95 E.09848
G1 X179.414 Y69.95 E.03184
G1 X181.513 Y72.05 E.09848
G1 X183.142 Y72.05 E.05401
G1 X185.531 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4715
G1 X185.938 Y71.991 E.01351
G1 X185.938 Y70.011 E.06568
G1 X185.531 Y70.015 E.01351
G1 X185.531 Y71.931 E.06356
; WIPE_START
G1 F24000
G1 X185.531 Y70.015 E-.72794
G1 X185.615 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.156 J-.382 P1  F30000
G1 X148.102 Y183.602 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4715
G1 X186.345 Y183.602 E1.2686
G1 X186.345 Y186.398 E.09274
G1 X148.102 Y186.398 E1.2686
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4715
G1 X186.737 Y183.21 E1.1992
G1 X186.737 Y186.79 E.11
G1 X147.71 Y186.79 E1.1992
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.267 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.975 J-.729 P1  F30000
G1 X149.199 Y183.95 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4715
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X178.274 Y183.95 E.14719
G1 X180.374 Y186.05 E.09848
G1 X179.414 Y186.05 E.03184
G1 X181.513 Y183.95 E.09848
G1 X183.142 Y183.95 E.05401
G1 X185.531 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4715
G1 X185.531 Y185.991 E.06555
G1 X185.938 Y185.991 E.01351
G1 X185.938 Y184.011 E.06568
G1 X185.591 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X185.938 Y184.011 E-.13194
G1 X185.938 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.147 J-.406 P1  F30000
G1 X180.876 Y171.377 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4715
G3 X180.775 Y170.604 I-.125 J-.377 E.04643
G1 X180.795 Y170.605 E.00065
G3 X180.931 Y171.353 I-.044 J.395 E.03368
G1 X181.066 Y171.722 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4715
G1 X180.925 Y171.769 E.00457
G3 X180.73 Y170.21 I-.177 J-.769 E.08114
G1 X180.797 Y170.212 E.00204
G3 X181.12 Y171.695 I-.049 J.788 E.06276
M204 S10000
; WIPE_START
G1 F24000
G1 X180.925 Y171.769 E-.07916
G1 X180.769 Y171.789 E-.05971
G1 X180.499 Y171.749 E-.10373
G1 X180.354 Y171.684 E-.06027
G1 X180.227 Y171.592 E-.05976
G1 X180.12 Y171.477 E-.05975
G1 X180.038 Y171.343 E-.05976
G1 X179.984 Y171.195 E-.05977
G1 X179.961 Y171.039 E-.05975
G1 X179.968 Y170.882 E-.05977
G1 X180.007 Y170.73 E-.05976
M73 P73 R13
G1 X180.051 Y170.638 E-.0388
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.018 J-1.217 P1  F30000
G1 X130.626 Y171.374 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4715
G3 X130.526 Y170.604 I-.124 J-.375 E.04622
G1 X130.546 Y170.605 E.00065
G3 X130.681 Y171.35 I-.044 J.393 E.03355
G1 X130.82 Y171.722 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4715
G1 X130.675 Y171.766 E.00465
G3 X130.481 Y170.21 I-.177 J-.768 E.08099
G1 X130.547 Y170.212 E.00204
G3 X130.871 Y171.692 I-.049 J.786 E.06261
M204 S10000
; WIPE_START
G1 F24000
G1 X130.675 Y171.766 E-.07959
G1 X130.52 Y171.789 E-.05963
G1 X130.248 Y171.749 E-.10422
G1 X130.105 Y171.684 E-.05976
G1 X129.977 Y171.592 E-.05976
G1 X129.87 Y171.477 E-.05976
G1 X129.788 Y171.343 E-.05976
G1 X129.735 Y171.195 E-.05976
G1 X129.711 Y171.039 E-.05976
G1 X129.719 Y170.882 E-.05977
G1 X129.758 Y170.73 E-.05976
G1 X129.802 Y170.639 E-.03847
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.199 J.206 P1  F30000
G1 X138.626 Y119.375 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4715
G3 X138.526 Y118.604 I-.125 J-.376 E.04633
G1 X138.546 Y118.605 E.00065
G3 X138.682 Y119.352 I-.044 J.394 E.03362
G1 X138.819 Y119.722 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4715
G1 X138.675 Y119.766 E.00464
G3 X138.481 Y118.21 I-.177 J-.768 E.08099
G1 X138.547 Y118.212 E.00204
G3 X138.87 Y119.692 I-.049 J.786 E.06263
M204 S10000
; WIPE_START
G1 F24000
G1 X138.675 Y119.766 E-.0794
G1 X138.52 Y119.789 E-.05961
G1 X138.363 Y119.778 E-.05976
G1 X138.211 Y119.735 E-.05976
G1 X137.977 Y119.592 E-.10423
G1 X137.87 Y119.477 E-.05976
G1 X137.788 Y119.343 E-.05976
G1 X137.735 Y119.195 E-.05977
G1 X137.711 Y119.039 E-.05975
G1 X137.719 Y118.882 E-.05977
G1 X137.758 Y118.73 E-.05976
G1 X137.802 Y118.638 E-.03867
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.183 J-.287 P1  F30000
G1 X130.197 Y87.255 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4715
G3 X130.526 Y86.604 I.305 J-.255 E.03069
G1 X130.546 Y86.605 E.00065
G3 X130.239 Y87.298 I-.044 J.395 E.04942
G1 X129.945 Y87.561 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4715
G1 X129.847 Y87.445 E.00467
G3 X130.481 Y86.21 I.651 J-.446 E.05211
G1 X130.547 Y86.212 E.00204
G3 X129.989 Y87.602 I-.049 J.788 E.0917
M204 S10000
; WIPE_START
G1 F24000
G1 X129.847 Y87.445 E-.08036
G1 X129.772 Y87.306 E-.05999
G1 X129.711 Y87.039 E-.10403
G1 X129.719 Y86.882 E-.05977
G1 X129.758 Y86.73 E-.05976
G1 X129.826 Y86.588 E-.05976
G1 X129.921 Y86.463 E-.05976
G1 X130.039 Y86.359 E-.05976
G1 X130.175 Y86.28 E-.05976
G1 X130.324 Y86.23 E-.05976
G1 X130.481 Y86.21 E-.05996
G1 X130.547 Y86.212 E-.02525
G1 X130.579 Y86.216 E-.0121
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.024 J-1.217 P1  F30000
G1 X77.782 Y87.273 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4715
G1 X77.761 Y87.296 E.00103
G3 X77.526 Y86.604 I-.26 J-.298 E.05144
G1 X77.546 Y86.605 E.00065
G3 X77.857 Y87.172 I-.044 J.393 E.02509
G1 X77.818 Y87.225 E.00218
G1 X78.097 Y87.511 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4715
G1 X78.02 Y87.589 E.00337
G3 X77.481 Y86.21 I-.521 J-.591 E.09302
G1 X77.547 Y86.212 E.00204
G3 X78.134 Y87.464 I-.049 J.786 E.05183
M204 S10000
; WIPE_START
G1 F24000
G1 X78.02 Y87.589 E-.06431
G1 X77.825 Y87.72 E-.08922
G1 X77.676 Y87.77 E-.05977
G1 X77.52 Y87.789 E-.05976
G1 X77.248 Y87.749 E-.10422
G1 X77.105 Y87.684 E-.05976
G1 X76.977 Y87.592 E-.05977
G1 X76.87 Y87.477 E-.05976
G1 X76.788 Y87.343 E-.05976
G1 X76.735 Y87.195 E-.05977
G1 X76.711 Y87.039 E-.05976
G1 X76.714 Y86.976 E-.02416
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.217 J.016 P1  F30000
G1 X77.792 Y170.73 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4715
G3 X77.526 Y170.604 I-.29 J.269 E.07243
G1 X77.546 Y170.605 E.00065
G3 X77.747 Y170.689 I-.044 J.393 E.00734
G1 X78.078 Y170.464 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4715
G3 X77.481 Y170.21 I-.579 J.534 E.13157
G1 X77.547 Y170.212 E.00204
G3 X78.035 Y170.422 I-.049 J.786 E.01665
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X78.174 Y170.588 E-.08238
G1 X78.242 Y170.73 E-.05976
G1 X78.281 Y170.882 E-.05976
G1 X78.289 Y171.039 E-.05977
G1 X78.265 Y171.195 E-.05975
G1 X78.212 Y171.343 E-.05976
G1 X78.079 Y171.537 E-.08945
G1 X77.961 Y171.641 E-.05977
G1 X77.825 Y171.72 E-.05975
G1 X77.676 Y171.77 E-.05977
G1 X77.52 Y171.789 E-.05975
G1 X77.389 Y171.77 E-.05032
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/125
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
G3 Z6.8 I.992 J.706 P1  F30000
G1 X148.102 Y72.398 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4686
G1 X148.102 Y69.602 E.09274
G1 X185.977 Y69.602 E1.25638
G1 X185.977 Y72.398 E.09274
G1 X148.162 Y72.398 E1.25439
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4686
G1 X147.71 Y69.21 E.11
G1 X186.369 Y69.21 E1.18788
G1 X186.369 Y72.79 E.11
G1 X147.77 Y72.79 E1.18604
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4686
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X178.274 Y72.05 E.14719
G1 X180.374 Y69.95 E.09848
G1 X179.414 Y69.95 E.03184
G1 X181.513 Y72.05 E.09848
G1 X183.142 Y72.05 E.05401
G1 X185.163 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4686
G1 X185.57 Y71.991 E.01351
G1 X185.57 Y70.011 E.06568
G1 X185.163 Y70.015 E.01351
G1 X185.163 Y71.931 E.06356
; WIPE_START
G1 F24000
G1 X185.163 Y70.015 E-.72794
G1 X185.247 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.157 J-.378 P1  F30000
G1 X148.102 Y183.602 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4686
G1 X185.977 Y183.602 E1.25638
M73 P74 R13
G1 X185.977 Y186.398 E.09274
G1 X148.102 Y186.398 E1.25638
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4686
G1 X186.369 Y183.21 E1.18788
G1 X186.369 Y186.79 E.11
G1 X147.71 Y186.79 E1.18788
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.267 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.975 J-.729 P1  F30000
G1 X149.199 Y183.95 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4686
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X178.274 Y183.95 E.14719
G1 X180.374 Y186.05 E.09848
G1 X179.414 Y186.05 E.03184
G1 X181.513 Y183.95 E.09848
G1 X183.142 Y183.95 E.05401
G1 X185.163 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4686
G1 X185.163 Y185.991 E.06555
G1 X185.57 Y185.991 E.01351
G1 X185.57 Y184.011 E.06568
G1 X185.223 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X185.57 Y184.011 E-.13194
G1 X185.57 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I1.156 J-.38 P1  F30000
G1 X180.876 Y171.376 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4686
G3 X180.774 Y170.603 I-.125 J-.377 E.04638
G1 X180.795 Y170.605 E.00072
G3 X180.931 Y171.353 I-.045 J.394 E.03365
G1 X181.064 Y171.723 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4686
G1 X180.925 Y171.768 E.0045
G3 X180.73 Y170.21 I-.178 J-.769 E.08117
G1 X180.794 Y170.212 E.00197
G3 X181.118 Y171.696 I-.047 J.788 E.06288
M204 S10000
; WIPE_START
G1 F24000
G1 X180.925 Y171.768 E-.07828
G1 X180.769 Y171.789 E-.05971
G1 X180.499 Y171.749 E-.10378
G1 X180.354 Y171.684 E-.06021
G1 X180.227 Y171.592 E-.05977
G1 X180.12 Y171.477 E-.05976
G1 X180.038 Y171.343 E-.05976
G1 X179.984 Y171.195 E-.05976
G1 X179.961 Y171.039 E-.05975
G1 X179.968 Y170.882 E-.05977
G1 X180.007 Y170.73 E-.05976
G1 X180.052 Y170.636 E-.03969
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.018 J-1.217 P1  F30000
G1 X130.626 Y171.374 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4686
G3 X130.524 Y170.603 I-.124 J-.375 E.04617
G1 X130.546 Y170.605 E.00072
G3 X130.681 Y171.35 I-.045 J.393 E.03352
G1 X130.819 Y171.722 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4686
G1 X130.675 Y171.766 E.00462
G3 X130.481 Y170.21 I-.177 J-.768 E.08101
G1 X130.545 Y170.212 E.00197
G3 X130.87 Y171.693 I-.047 J.786 E.06269
M204 S10000
; WIPE_START
G1 F24000
G1 X130.675 Y171.766 E-.07923
G1 X130.52 Y171.789 E-.05962
G1 X130.248 Y171.749 E-.10422
G1 X130.105 Y171.684 E-.05976
G1 X129.977 Y171.592 E-.05977
G1 X129.87 Y171.477 E-.05976
G1 X129.788 Y171.343 E-.05976
G1 X129.735 Y171.195 E-.05976
G1 X129.711 Y171.039 E-.05976
G1 X129.719 Y170.882 E-.05976
G1 X129.758 Y170.73 E-.05976
G1 X129.802 Y170.638 E-.03883
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I1.199 J.206 P1  F30000
G1 X138.626 Y119.376 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4686
G3 X138.524 Y118.603 I-.125 J-.377 E.04638
G1 X138.546 Y118.605 E.00072
G3 X138.682 Y119.353 I-.045 J.394 E.03365
G1 X138.817 Y119.722 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4686
G1 X138.675 Y119.768 E.00457
G3 X138.481 Y118.21 I-.178 J-.769 E.08117
G1 X138.545 Y118.212 E.00197
G3 X138.87 Y119.695 I-.047 J.788 E.06281
M204 S10000
; WIPE_START
G1 F24000
G1 X138.675 Y119.768 E-.07915
G1 X138.52 Y119.789 E-.05971
G1 X138.363 Y119.778 E-.05976
G1 X138.211 Y119.735 E-.05999
G1 X137.977 Y119.592 E-.104
G1 X137.87 Y119.477 E-.05976
G1 X137.788 Y119.343 E-.05976
G1 X137.735 Y119.195 E-.05977
G1 X137.711 Y119.039 E-.05975
G1 X137.719 Y118.882 E-.05977
G1 X137.758 Y118.73 E-.05976
G1 X137.802 Y118.638 E-.03883
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I1.183 J-.287 P1  F30000
G1 X130.198 Y87.254 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4686
G3 X130.524 Y86.603 I.304 J-.255 E.0306
G1 X130.546 Y86.605 E.00072
G3 X130.24 Y87.297 I-.045 J.394 E.04927
G1 X129.944 Y87.56 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4686
G1 X129.849 Y87.444 E.0046
G3 X130.481 Y86.21 I.649 J-.446 E.05207
G1 X130.545 Y86.212 E.00197
G3 X129.989 Y87.599 I-.047 J.786 E.09161
M204 S10000
; WIPE_START
G1 F24000
G1 X129.849 Y87.444 E-.07944
G1 X129.772 Y87.307 E-.05971
G1 X129.711 Y87.039 E-.10422
G1 X129.719 Y86.882 E-.05976
G1 X129.758 Y86.73 E-.05976
G1 X129.826 Y86.588 E-.05976
G1 X129.921 Y86.463 E-.05975
G1 X130.039 Y86.359 E-.05977
G1 X130.175 Y86.28 E-.05976
G1 X130.324 Y86.23 E-.05976
G1 X130.481 Y86.21 E-.05999
G1 X130.545 Y86.212 E-.02436
G1 X130.581 Y86.217 E-.01395
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.025 J-1.217 P1  F30000
G1 X77.765 Y87.295 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4686
G1 X77.762 Y87.297 E.00012
G3 X77.524 Y86.603 I-.261 J-.298 E.05152
G1 X77.546 Y86.605 E.00072
G3 X77.858 Y87.172 I-.045 J.394 E.0251
G1 X77.801 Y87.247 E.0031
G1 X78.081 Y87.534 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4686
G1 X78.075 Y87.534 E.00017
G3 X77.481 Y86.21 I-.578 J-.536 E.09545
G1 X77.545 Y86.212 E.00197
G3 X78.207 Y87.341 I-.047 J.786 E.04746
G1 X78.114 Y87.484 E.00526
M204 S10000
; WIPE_START
G1 F24000
G1 X78.075 Y87.534 E-.02397
G1 X77.961 Y87.641 E-.05961
G1 X77.825 Y87.72 E-.05976
G1 X77.676 Y87.77 E-.05977
G1 X77.52 Y87.789 E-.05976
G1 X77.363 Y87.778 E-.05976
G1 X77.211 Y87.735 E-.05975
G1 X77.072 Y87.663 E-.05977
G1 X76.949 Y87.565 E-.05976
G1 X76.847 Y87.445 E-.05976
G1 X76.772 Y87.307 E-.05976
G1 X76.711 Y87.039 E-.10423
G1 X76.716 Y86.949 E-.03435
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.217 J.016 P1  F30000
G1 X77.789 Y170.732 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4686
G3 X77.49 Y170.603 I-.293 J.268 E.07159
G1 X77.522 Y170.604 E.00106
G3 X77.745 Y170.691 I-.026 J.396 E.00807
G1 X78.078 Y170.464 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4686
G3 X77.48 Y170.211 I-.579 J.536 E.13181
G1 X77.556 Y170.212 E.00234
G3 X78.036 Y170.421 I-.058 J.787 E.01637
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X78.174 Y170.588 E-.0824
G1 X78.242 Y170.73 E-.05976
G1 X78.281 Y170.882 E-.05976
G1 X78.289 Y171.039 E-.05977
G1 X78.265 Y171.195 E-.05975
G1 X78.212 Y171.343 E-.05977
G1 X78.079 Y171.537 E-.08945
G1 X77.961 Y171.641 E-.05976
G1 X77.825 Y171.72 E-.05976
G1 X77.676 Y171.77 E-.05977
G1 X77.52 Y171.789 E-.05976
G1 X77.389 Y171.77 E-.0503
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/125
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
G3 Z7 I.992 J.706 P1  F30000
G1 X148.102 Y72.398 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4657
G1 X148.102 Y69.602 E.09274
G1 X185.608 Y69.602 E1.24416
G1 X185.608 Y72.398 E.09274
G1 X148.162 Y72.398 E1.24216
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4657
G1 X147.71 Y69.21 E.11
G1 X186.001 Y69.21 E1.17656
G1 X186.001 Y72.79 E.11
G1 X147.77 Y72.79 E1.17472
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4657
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X178.274 Y72.05 E.14719
G1 X180.374 Y69.95 E.09848
G1 X179.414 Y69.95 E.03184
G1 X181.513 Y72.05 E.09848
G1 X183.142 Y72.05 E.05401
G1 X184.794 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4657
G1 X185.201 Y71.991 E.01351
G1 X185.201 Y70.011 E.06568
G1 X184.794 Y70.015 E.01351
G1 X184.794 Y71.931 E.06356
; WIPE_START
G1 F24000
G1 X184.794 Y70.015 E-.72794
G1 X184.879 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-1.158 J-.375 P1  F30000
G1 X148.102 Y183.602 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4657
G1 X185.608 Y183.602 E1.24416
G1 X185.608 Y186.398 E.09274
G1 X148.102 Y186.398 E1.24416
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4657
G1 X186.001 Y183.21 E1.17656
G1 X186.001 Y186.79 E.11
G1 X147.71 Y186.79 E1.17656
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.267 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.975 J-.729 P1  F30000
G1 X149.199 Y183.95 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4657
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X178.274 Y183.95 E.14719
G1 X180.374 Y186.05 E.09848
G1 X179.414 Y186.05 E.03184
G1 X181.513 Y183.95 E.09848
G1 X183.142 Y183.95 E.05401
G1 X184.794 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4657
G1 X184.794 Y185.991 E.06555
G1 X185.201 Y185.991 E.01351
G1 X185.201 Y184.011 E.06568
G1 X184.854 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X185.201 Y184.011 E-.13194
G1 X185.201 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I1.165 J-.353 P1  F30000
G1 X180.875 Y171.375 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4657
G3 X180.772 Y170.603 I-.125 J-.376 E.04623
G1 X180.796 Y170.605 E.00079
G3 X180.931 Y171.352 I-.045 J.394 E.03356
G1 X181.059 Y171.725 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4657
G1 X180.924 Y171.766 E.00434
G3 X180.73 Y170.21 I-.177 J-.768 E.08103
G1 X180.792 Y170.212 E.0019
G3 X181.112 Y171.696 I-.045 J.786 E.063
M204 S10000
; WIPE_START
G1 F24000
G1 X180.924 Y171.766 E-.07606
G1 X180.769 Y171.789 E-.05962
G1 X180.612 Y171.778 E-.05976
G1 X180.422 Y171.719 E-.07561
G1 X180.227 Y171.592 E-.08847
G1 X180.12 Y171.477 E-.05975
G1 X180.038 Y171.343 E-.05975
G1 X179.984 Y171.195 E-.05977
G1 X179.961 Y171.039 E-.05975
G1 X179.968 Y170.882 E-.05977
G1 X180.007 Y170.73 E-.05976
G1 X180.055 Y170.631 E-.04192
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.018 J-1.217 P1  F30000
G1 X130.625 Y171.373 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4657
G3 X130.523 Y170.603 I-.124 J-.375 E.04612
G1 X130.546 Y170.605 E.00079
G3 X130.681 Y171.35 I-.045 J.393 E.0335
G1 X130.817 Y171.723 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4657
G1 X130.675 Y171.766 E.00456
G3 X130.481 Y170.21 I-.177 J-.768 E.08104
G1 X130.543 Y170.212 E.0019
G3 X130.869 Y171.693 I-.045 J.787 E.06279
M204 S10000
; WIPE_START
G1 F24000
G1 X130.675 Y171.766 E-.07863
G1 X130.52 Y171.789 E-.05962
G1 X130.248 Y171.749 E-.10422
G1 X130.105 Y171.684 E-.05977
G1 X129.977 Y171.592 E-.05976
G1 X129.87 Y171.477 E-.05976
G1 X129.788 Y171.343 E-.05976
G1 X129.735 Y171.195 E-.05976
G1 X129.711 Y171.039 E-.05976
G1 X129.719 Y170.882 E-.05976
G1 X129.758 Y170.73 E-.05976
G1 X129.803 Y170.636 E-.03944
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I1.199 J.206 P1  F30000
G1 X138.626 Y119.376 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4657
G3 X138.523 Y118.603 I-.126 J-.377 E.04633
G1 X138.546 Y118.605 E.00079
G3 X138.682 Y119.353 I-.046 J.394 E.03362
G1 X138.815 Y119.723 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4657
G1 X138.675 Y119.768 E.0045
G3 X138.481 Y118.21 I-.178 J-.769 E.08119
G1 X138.543 Y118.212 E.0019
G3 X138.868 Y119.696 I-.045 J.788 E.06293
M204 S10000
; WIPE_START
G1 F24000
G1 X138.675 Y119.768 E-.07829
G1 X138.52 Y119.789 E-.0597
G1 X138.363 Y119.778 E-.05976
G1 X138.211 Y119.735 E-.06003
G1 X137.977 Y119.592 E-.10396
G1 X137.87 Y119.477 E-.05976
G1 X137.788 Y119.343 E-.05976
G1 X137.735 Y119.195 E-.05976
G1 X137.711 Y119.039 E-.05975
G1 X137.719 Y118.882 E-.05977
G1 X137.758 Y118.73 E-.05977
G1 X137.803 Y118.636 E-.03968
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I1.183 J-.287 P1  F30000
G1 X130.197 Y87.254 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4657
G3 X130.523 Y86.603 I.303 J-.255 E.03055
G1 X130.546 Y86.605 E.00079
G3 X130.24 Y87.297 I-.045 J.394 E.04925
G1 X129.942 Y87.558 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4657
G1 X129.848 Y87.444 E.00453
G3 X130.481 Y86.21 I.649 J-.446 E.05209
G1 X130.543 Y86.212 E.0019
G3 X129.987 Y87.598 I-.045 J.787 E.09172
M204 S10000
; WIPE_START
G1 F24000
G1 X129.848 Y87.444 E-.0787
G1 X129.772 Y87.307 E-.05971
G1 X129.711 Y87.039 E-.10423
G1 X129.719 Y86.882 E-.05976
G1 X129.758 Y86.73 E-.05976
G1 X129.826 Y86.588 E-.05976
G1 X129.921 Y86.463 E-.05976
G1 X130.039 Y86.359 E-.05976
G1 X130.175 Y86.28 E-.05976
G1 X130.324 Y86.23 E-.05976
G1 X130.481 Y86.21 E-.06004
G1 X130.543 Y86.212 E-.02346
G1 X130.583 Y86.217 E-.01554
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.025 J-1.217 P1  F30000
G1 X77.763 Y87.298 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4657
G1 X77.763 Y87.298 E.00001
G3 X77.523 Y86.603 I-.262 J-.298 E.05159
G1 X77.546 Y86.605 E.00079
G3 X77.858 Y87.173 I-.046 J.394 E.0251
G1 X77.799 Y87.25 E.00323
G1 X78.077 Y87.535 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4657
G3 X77.481 Y86.21 I-.579 J-.536 E.09567
G1 X77.543 Y86.212 E.0019
G3 X78.116 Y87.49 I-.045 J.788 E.05296
M204 S10000
; WIPE_START
G1 F24000
G1 X77.961 Y87.641 E-.08232
G1 X77.825 Y87.72 E-.05976
G1 X77.676 Y87.77 E-.05976
G1 X77.52 Y87.789 E-.05976
G1 X77.249 Y87.749 E-.10383
G1 X77.105 Y87.684 E-.06017
G1 X76.977 Y87.592 E-.05975
G1 X76.87 Y87.477 E-.05977
G1 X76.788 Y87.343 E-.05976
G1 X76.735 Y87.195 E-.05976
G1 X76.711 Y87.039 E-.05976
G1 X76.716 Y86.946 E-.0356
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-1.217 J.016 P1  F30000
G1 X77.791 Y170.73 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4657
G3 X77.523 Y170.603 I-.29 J.268 E.07231
G1 X77.546 Y170.605 E.0008
G3 X77.747 Y170.689 I-.045 J.393 E.00731
G1 X78.077 Y170.464 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4657
G3 X77.481 Y170.21 I-.58 J.534 E.13158
G1 X77.543 Y170.212 E.0019
G3 X78.035 Y170.422 I-.045 J.787 E.01678
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X78.174 Y170.588 E-.08238
G1 X78.242 Y170.73 E-.05977
G1 X78.281 Y170.882 E-.05975
G1 X78.289 Y171.039 E-.05977
G1 X78.265 Y171.195 E-.05976
G1 X78.212 Y171.343 E-.05976
G1 X78.079 Y171.537 E-.08945
G1 X77.961 Y171.641 E-.05977
G1 X77.825 Y171.72 E-.05976
G1 X77.676 Y171.77 E-.05976
G1 X77.52 Y171.789 E-.05976
G1 X77.389 Y171.77 E-.05031
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/125
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
G3 Z7.2 I.992 J.706 P1  F30000
G1 X148.102 Y72.398 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4629
G1 X148.102 Y69.602 E.09274
G1 X185.24 Y69.602 E1.23193
G1 X185.24 Y72.398 E.09274
G1 X148.162 Y72.398 E1.22994
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4629
G1 X147.71 Y69.21 E.11
G1 X185.632 Y69.21 E1.16524
G1 X185.632 Y72.79 E.11
G1 X147.77 Y72.79 E1.1634
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4629
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X178.274 Y72.05 E.14719
G1 X180.374 Y69.95 E.09848
G1 X179.414 Y69.95 E.03184
G1 X181.513 Y72.05 E.09848
G1 X183.142 Y72.05 E.05401
G1 X184.426 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4629
G1 X184.833 Y71.991 E.01351
G1 X184.833 Y70.011 E.06568
G1 X184.426 Y70.015 E.01351
G1 X184.426 Y71.931 E.06356
; WIPE_START
G1 F24000
G1 X184.426 Y70.015 E-.72794
G1 X184.51 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.159 J-.371 P1  F30000
G1 X148.102 Y183.602 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4629
G1 X185.24 Y183.602 E1.23193
G1 X185.24 Y186.398 E.09274
G1 X148.102 Y186.398 E1.23193
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4629
G1 X185.632 Y183.21 E1.16524
G1 X185.632 Y186.79 E.11
G1 X147.71 Y186.79 E1.16524
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.267 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.975 J-.729 P1  F30000
G1 X149.199 Y183.95 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4629
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X178.274 Y183.95 E.14719
G1 X180.374 Y186.05 E.09848
G1 X179.414 Y186.05 E.03184
G1 X181.513 Y183.95 E.09848
G1 X183.142 Y183.95 E.05401
G1 X184.426 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4629
G1 X184.426 Y185.991 E.06555
G1 X184.833 Y185.991 E.01351
G1 X184.833 Y184.011 E.06568
G1 X184.486 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X184.833 Y184.011 E-.13194
G1 X184.833 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.174 J-.322 P1  F30000
G1 X180.912 Y171.36 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4629
G3 X180.742 Y170.603 I-.163 J-.361 E.04661
G1 X180.77 Y170.603 E.00094
G3 X180.965 Y171.331 I-.021 J.396 E.03304
G1 X181.058 Y171.725 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4629
G1 X180.924 Y171.766 E.00431
G3 X180.73 Y170.21 I-.177 J-.768 E.08105
G1 X180.79 Y170.211 E.00182
G3 X181.111 Y171.697 I-.043 J.787 E.06308
M204 S10000
; WIPE_START
G1 F24000
G1 X180.924 Y171.766 E-.07573
G1 X180.769 Y171.789 E-.05961
G1 X180.538 Y171.761 E-.08846
G1 X180.354 Y171.684 E-.07561
G1 X180.227 Y171.592 E-.05977
G1 X180.12 Y171.477 E-.05976
G1 X180.038 Y171.343 E-.05976
G1 X179.984 Y171.195 E-.05976
G1 X179.961 Y171.039 E-.05975
G1 X179.968 Y170.882 E-.05977
G1 X180.007 Y170.73 E-.05976
G1 X180.055 Y170.63 E-.04226
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.018 J-1.217 P1  F30000
G1 X130.663 Y171.36 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4629
G3 X130.492 Y170.603 I-.163 J-.361 E.04663
G1 X130.521 Y170.603 E.00094
G3 X130.715 Y171.332 I-.021 J.396 E.03304
G1 X130.815 Y171.723 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4629
G1 X130.675 Y171.766 E.00451
G3 X130.481 Y170.21 I-.177 J-.768 E.08106
G1 X130.541 Y170.211 E.00182
G3 X130.867 Y171.694 I-.043 J.787 E.0629
M204 S10000
; WIPE_START
G1 F24000
G1 X130.675 Y171.766 E-.07796
G1 X130.52 Y171.789 E-.05962
G1 X130.248 Y171.749 E-.10423
G1 X130.105 Y171.684 E-.05975
G1 X129.977 Y171.592 E-.05976
G1 X129.87 Y171.477 E-.05977
G1 X129.788 Y171.343 E-.05975
G1 X129.735 Y171.195 E-.05976
G1 X129.711 Y171.039 E-.05976
G1 X129.719 Y170.882 E-.05976
G1 X129.758 Y170.73 E-.05976
G1 X129.804 Y170.635 E-.04011
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.199 J.207 P1  F30000
G1 X138.663 Y119.36 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4629
G3 X138.492 Y118.603 I-.163 J-.361 E.04661
G1 X138.521 Y118.603 E.00094
G3 X138.715 Y119.331 I-.021 J.396 E.03304
G1 X138.813 Y119.724 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4629
G1 X138.675 Y119.766 E.00443
G3 X138.481 Y118.21 I-.177 J-.768 E.08105
G1 X138.54 Y118.211 E.00182
G3 X138.865 Y119.695 I-.043 J.787 E.06297
M204 S10000
; WIPE_START
G1 F24000
G1 X138.675 Y119.766 E-.07706
G1 X138.52 Y119.789 E-.0596
G1 X138.363 Y119.778 E-.05976
G1 X138.211 Y119.735 E-.05976
G1 X137.977 Y119.592 E-.10422
G1 X137.87 Y119.477 E-.05976
G1 X137.788 Y119.343 E-.05976
G1 X137.735 Y119.195 E-.05976
G1 X137.711 Y119.039 E-.05976
G1 X137.719 Y118.882 E-.05977
G1 X137.758 Y118.73 E-.05976
G1 X137.805 Y118.633 E-.04102
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.183 J-.286 P1  F30000
G1 X130.224 Y87.283 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4629
G3 X130.492 Y86.603 I.276 J-.284 E.03092
G1 X130.521 Y86.603 E.00094
G3 X130.27 Y87.322 I-.021 J.396 E.04873
G1 X129.941 Y87.556 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4629
G1 X129.848 Y87.444 E.00447
G3 X130.481 Y86.21 I.649 J-.446 E.05211
G1 X130.54 Y86.211 E.00182
G3 X129.985 Y87.597 I-.043 J.787 E.09185
M204 S10000
; WIPE_START
G1 F24000
G1 X129.848 Y87.444 E-.07793
G1 X129.772 Y87.307 E-.05973
G1 X129.711 Y87.039 E-.10422
G1 X129.719 Y86.882 E-.05976
G1 X129.758 Y86.73 E-.05976
G1 X129.826 Y86.588 E-.05976
G1 X129.921 Y86.463 E-.05976
G1 X130.039 Y86.359 E-.05976
G1 X130.175 Y86.28 E-.05976
G1 X130.324 Y86.23 E-.05976
G1 X130.481 Y86.21 E-.06007
G1 X130.54 Y86.211 E-.02257
G1 X130.585 Y86.218 E-.01716
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.024 J-1.217 P1  F30000
G1 X77.79 Y87.269 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4629
G3 X77.492 Y86.603 I-.29 J-.27 E.05186
G1 X77.521 Y86.603 E.00094
G3 X77.827 Y87.222 I-.021 J.396 E.02781
G1 X78.076 Y87.54 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4629
G1 X77.958 Y87.637 E.00471
G3 X77.481 Y86.21 I-.461 J-.639 E.09068
G1 X77.54 Y86.211 E.00182
G3 X78.11 Y87.493 I-.043 J.787 E.05313
M204 S10000
; WIPE_START
G1 F24000
G1 X77.958 Y87.637 E-.07975
G1 X77.825 Y87.72 E-.0596
G1 X77.676 Y87.77 E-.05977
G1 X77.52 Y87.789 E-.05975
G1 X77.248 Y87.749 E-.10422
G1 X77.105 Y87.684 E-.05976
G1 X76.977 Y87.592 E-.05976
G1 X76.87 Y87.477 E-.05976
G1 X76.788 Y87.343 E-.05977
G1 X76.735 Y87.195 E-.05976
G1 X76.711 Y87.039 E-.05976
G1 X76.716 Y86.939 E-.03834
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.217 J.016 P1  F30000
G1 X77.791 Y170.73 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4629
G3 X77.492 Y170.603 I-.291 J.269 E.07152
G1 X77.521 Y170.603 E.00094
G3 X77.747 Y170.689 I-.021 J.396 E.00816
G1 X78.077 Y170.465 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4629
G3 X77.481 Y170.21 I-.58 J.533 E.13159
G1 X77.54 Y170.211 E.00182
G3 X78.035 Y170.422 I-.043 J.787 E.01684
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X78.174 Y170.588 E-.08237
G1 X78.242 Y170.73 E-.05977
G1 X78.281 Y170.882 E-.05975
G1 X78.289 Y171.039 E-.05977
G1 X78.265 Y171.195 E-.05975
G1 X78.212 Y171.343 E-.05976
G1 X78.079 Y171.537 E-.08945
G1 X77.961 Y171.641 E-.05976
G1 X77.825 Y171.72 E-.05976
G1 X77.676 Y171.77 E-.05977
G1 X77.52 Y171.789 E-.05976
G1 X77.389 Y171.77 E-.05032
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/125
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
G3 Z7.4 I.992 J.706 P1  F30000
G1 X148.102 Y72.398 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4599
G1 X148.102 Y69.602 E.09274
G1 X184.872 Y69.602 E1.21971
G1 X184.872 Y72.398 E.09274
G1 X148.162 Y72.398 E1.21772
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4599
G1 X147.71 Y69.21 E.11
G1 X185.264 Y69.21 E1.15392
G1 X185.264 Y72.79 E.11
G1 X147.77 Y72.79 E1.15208
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4599
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X178.274 Y72.05 E.14719
G1 X180.374 Y69.95 E.09848
G1 X179.414 Y69.95 E.03184
G1 X181.513 Y72.05 E.09848
G1 X183.142 Y72.05 E.05401
G1 X184.057 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4599
G1 X184.464 Y71.991 E.01351
G1 X184.464 Y70.011 E.06568
G1 X184.057 Y70.015 E.01351
G1 X184.057 Y71.931 E.06356
; WIPE_START
G1 F24000
G1 X184.057 Y70.015 E-.72794
G1 X184.142 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-1.16 J-.368 P1  F30000
G1 X148.102 Y183.602 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4599
G1 X184.872 Y183.602 E1.21971
G1 X184.872 Y186.398 E.09274
G1 X148.102 Y186.398 E1.21971
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4599
G1 X185.264 Y183.21 E1.15392
M73 P75 R13
G1 X185.264 Y186.79 E.11
G1 X147.71 Y186.79 E1.15392
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.267 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-.975 J-.729 P1  F30000
G1 X149.199 Y183.95 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4599
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X178.274 Y183.95 E.14719
G1 X180.374 Y186.05 E.09848
G1 X179.414 Y186.05 E.03184
G1 X181.513 Y183.95 E.09848
G1 X183.142 Y183.95 E.05401
G1 X184.057 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4599
G1 X184.057 Y185.991 E.06555
G1 X184.464 Y185.991 E.01351
G1 X184.464 Y184.011 E.06568
G1 X184.117 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X184.464 Y184.011 E-.13194
G1 X184.464 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I1.18 J-.296 P1  F30000
G1 X180.875 Y171.373 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4599
G3 X180.742 Y170.603 I-.126 J-.375 E.04523
G1 X180.768 Y170.603 E.00087
G3 X180.93 Y171.349 I-.019 J.395 E.03431
G1 X181.035 Y171.733 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4599
G1 X180.999 Y171.742 E.00115
G3 X180.731 Y170.21 I-.252 J-.745 E.08333
G1 X180.787 Y170.211 E.00175
G3 X181.14 Y171.678 I-.041 J.785 E.06198
G1 X181.088 Y171.705 E.00182
M204 S10000
; WIPE_START
G1 F24000
G1 X180.999 Y171.742 E-.03672
G1 X180.85 Y171.783 E-.05856
G1 X180.727 Y171.789 E-.04683
G1 X180.574 Y171.77 E-.05876
G1 X180.424 Y171.72 E-.05976
G1 X180.288 Y171.641 E-.05976
G1 X180.17 Y171.537 E-.05977
G1 X180.075 Y171.412 E-.05975
G1 X180.007 Y171.27 E-.05977
G1 X179.968 Y171.118 E-.05976
G1 X179.961 Y170.961 E-.05977
G1 X179.984 Y170.805 E-.05975
G1 X180.038 Y170.657 E-.05977
G1 X180.067 Y170.61 E-.02128
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-.019 J-1.217 P1  F30000
G1 X130.644 Y171.368 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4599
G3 X130.493 Y170.603 I-.145 J-.369 E.04599
G1 X130.519 Y170.603 E.00087
G3 X130.698 Y171.342 I-.019 J.396 E.03373
G1 X130.801 Y171.729 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4599
G1 X130.787 Y171.731 E.00045
G3 X130.481 Y170.21 I-.29 J-.733 E.08467
G1 X130.538 Y170.211 E.00175
G3 X130.926 Y171.659 I-.041 J.787 E.06085
G1 X130.854 Y171.699 E.00254
M204 S10000
; WIPE_START
G1 F24000
G1 X130.787 Y171.731 E-.02806
G1 X130.637 Y171.778 E-.05959
G1 X130.48 Y171.789 E-.05977
G1 X130.324 Y171.77 E-.05977
G1 X130.175 Y171.72 E-.05975
G1 X130.039 Y171.641 E-.05976
G1 X129.921 Y171.537 E-.05976
G1 X129.826 Y171.412 E-.05977
G1 X129.758 Y171.27 E-.05976
G1 X129.719 Y171.118 E-.05976
G1 X129.711 Y170.961 E-.05976
G1 X129.735 Y170.805 E-.05976
G1 X129.788 Y170.657 E-.05975
G1 X129.809 Y170.624 E-.01497
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I1.199 J.207 P1  F30000
G1 X138.644 Y119.368 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4599
G3 X138.493 Y118.603 I-.145 J-.369 E.04599
G1 X138.519 Y118.603 E.00087
G3 X138.699 Y119.342 I-.019 J.396 E.03373
G1 X138.801 Y119.729 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4599
G1 X138.787 Y119.731 E.00043
G3 X138.481 Y118.21 I-.29 J-.733 E.08467
G1 X138.538 Y118.211 E.00175
G3 X138.923 Y119.66 I-.041 J.787 E.06093
G1 X138.853 Y119.7 E.00248
M204 S10000
; WIPE_START
G1 F24000
G1 X138.787 Y119.731 E-.02779
G1 X138.637 Y119.778 E-.0596
G1 X138.48 Y119.789 E-.05976
G1 X138.324 Y119.77 E-.05975
G1 X138.175 Y119.72 E-.05976
G1 X138.039 Y119.641 E-.05976
G1 X137.921 Y119.537 E-.05977
G1 X137.826 Y119.412 E-.05976
G1 X137.758 Y119.27 E-.05976
G1 X137.719 Y119.118 E-.05976
G1 X137.711 Y118.961 E-.05977
G1 X137.735 Y118.805 E-.05975
G1 X137.788 Y118.657 E-.05977
G1 X137.809 Y118.623 E-.01523
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I1.183 J-.287 P1  F30000
G1 X130.21 Y87.269 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4599
G3 X130.493 Y86.603 I.29 J-.27 E.03029
G1 X130.519 Y86.603 E.00087
G3 X130.254 Y87.31 I-.019 J.396 E.04943
G1 X129.931 Y87.546 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4599
G1 X129.922 Y87.536 E.00042
G3 X130.481 Y86.21 I.575 J-.538 E.05574
G1 X130.538 Y86.211 E.00175
G3 X130.04 Y87.64 I-.041 J.787 E.08976
G1 X129.977 Y87.585 E.00256
M204 S10000
; WIPE_START
G1 F24000
G1 X129.922 Y87.536 E-.02798
G1 X129.826 Y87.412 E-.05971
G1 X129.758 Y87.27 E-.05976
G1 X129.719 Y87.118 E-.05976
G1 X129.711 Y86.961 E-.05976
G1 X129.735 Y86.805 E-.05976
G1 X129.788 Y86.657 E-.05976
G1 X129.87 Y86.523 E-.05976
G1 X129.977 Y86.408 E-.05977
G1 X130.105 Y86.316 E-.05976
G1 X130.248 Y86.251 E-.05976
G1 X130.481 Y86.21 E-.08981
G1 X130.538 Y86.211 E-.02166
G1 X130.598 Y86.22 E-.02299
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-.024 J-1.217 P1  F30000
G1 X77.776 Y87.283 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4599
G3 X77.493 Y86.603 I-.276 J-.284 E.05122
G1 X77.519 Y86.603 E.00087
G3 X77.816 Y87.238 I-.019 J.396 E.0285
G1 X78.066 Y87.548 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4599
G1 X78.048 Y87.561 E.0007
G3 X77.481 Y86.21 I-.551 J-.563 E.09429
G1 X77.538 Y86.211 E.00175
G3 X78.148 Y87.442 I-.041 J.787 E.05124
G1 X78.103 Y87.5 E.00228
M204 S10000
; WIPE_START
G1 F24000
G1 X78.048 Y87.561 E-.03125
G1 X77.928 Y87.663 E-.05959
G1 X77.789 Y87.735 E-.05977
G1 X77.637 Y87.778 E-.05976
G1 X77.48 Y87.789 E-.05976
G1 X77.324 Y87.77 E-.05976
G1 X77.175 Y87.72 E-.05976
G1 X77.039 Y87.641 E-.05976
G1 X76.921 Y87.537 E-.05977
G1 X76.826 Y87.412 E-.05975
G1 X76.758 Y87.27 E-.05976
G1 X76.719 Y87.118 E-.05977
G1 X76.711 Y86.961 E-.05976
G1 X76.716 Y86.93 E-.01179
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-1.217 J.016 P1  F30000
G1 X77.791 Y170.73 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4599
G3 X77.493 Y170.603 I-.291 J.269 E.07151
G1 X77.519 Y170.603 E.00087
G3 X77.747 Y170.689 I-.019 J.396 E.00821
G1 X78.077 Y170.465 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4599
G3 X77.481 Y170.21 I-.58 J.533 E.13158
G1 X77.538 Y170.211 E.00175
G3 X78.035 Y170.422 I-.041 J.787 E.01691
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X78.174 Y170.588 E-.08237
G1 X78.242 Y170.73 E-.05976
G1 X78.281 Y170.882 E-.05976
G1 X78.289 Y171.039 E-.05977
G1 X78.266 Y171.192 E-.05876
G1 X78.227 Y171.309 E-.04683
G1 X78.153 Y171.445 E-.05876
G1 X78.051 Y171.565 E-.05976
G1 X77.928 Y171.663 E-.05976
G1 X77.789 Y171.735 E-.05977
G1 X77.637 Y171.778 E-.05975
G1 X77.48 Y171.789 E-.05976
G1 X77.388 Y171.778 E-.03518
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/125
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
G3 Z7.6 I.992 J.706 P1  F30000
G1 X148.102 Y72.398 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4570
G1 X148.102 Y69.602 E.09274
G1 X184.503 Y69.602 E1.20749
G1 X184.503 Y72.398 E.09274
G1 X148.162 Y72.398 E1.2055
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4570
G1 X147.71 Y69.21 E.11
G1 X184.895 Y69.21 E1.1426
G1 X184.895 Y72.79 E.11
G1 X147.77 Y72.79 E1.14076
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4570
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X178.274 Y72.05 E.14719
G1 X180.374 Y69.95 E.09848
G1 X179.414 Y69.95 E.03184
G1 X181.513 Y72.05 E.09848
G1 X183.142 Y72.05 E.05401
G1 X183.689 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4570
G1 X184.096 Y71.991 E.01351
G1 X184.096 Y70.011 E.06568
G1 X183.689 Y70.015 E.01351
G1 X183.689 Y71.931 E.06356
; WIPE_START
G1 F24000
G1 X183.689 Y70.015 E-.72794
G1 X183.773 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.161 J-.365 P1  F30000
G1 X148.102 Y183.602 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4570
G1 X184.503 Y183.602 E1.20749
G1 X184.503 Y186.398 E.09274
G1 X148.102 Y186.398 E1.20749
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4570
G1 X184.895 Y183.21 E1.1426
G1 X184.895 Y186.79 E.11
G1 X147.71 Y186.79 E1.1426
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.267 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-.975 J-.729 P1  F30000
G1 X149.199 Y183.95 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4570
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X178.274 Y183.95 E.14719
G1 X180.374 Y186.05 E.09848
G1 X179.414 Y186.05 E.03184
G1 X181.513 Y183.95 E.09848
G1 X183.142 Y183.95 E.05401
G1 X183.689 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4570
G1 X183.689 Y185.991 E.06555
G1 X184.096 Y185.991 E.01351
G1 X184.096 Y184.011 E.06568
G1 X183.749 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X184.096 Y184.011 E-.13194
G1 X184.096 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I1.187 J-.268 P1  F30000
G1 X180.876 Y171.376 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4570
G3 X180.742 Y170.603 I-.127 J-.376 E.04546
G1 X180.766 Y170.603 E.00079
G3 X180.931 Y171.352 I-.018 J.397 E.03449
G1 X181.032 Y171.735 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4570
G1 X181 Y171.747 E.00104
G3 X180.731 Y170.21 I-.254 J-.747 E.08366
G1 X180.785 Y170.211 E.00168
G3 X181.143 Y171.682 I-.039 J.788 E.06222
G1 X181.086 Y171.709 E.00193
M204 S10000
; WIPE_START
G1 F24000
G1 X181 Y171.747 E-.03568
G1 X180.73 Y171.789 E-.10411
G1 X180.574 Y171.77 E-.05976
G1 X180.424 Y171.72 E-.05976
G1 X180.288 Y171.641 E-.05976
G1 X180.17 Y171.537 E-.05976
G1 X180.075 Y171.412 E-.05975
G1 X180.007 Y171.27 E-.05976
G1 X179.968 Y171.118 E-.05977
G1 X179.961 Y170.961 E-.05977
G1 X179.984 Y170.805 E-.05975
G1 X180.038 Y170.657 E-.05977
G1 X180.069 Y170.607 E-.02261
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-.019 J-1.217 P1  F30000
G1 X130.644 Y171.368 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4570
G3 X130.493 Y170.603 I-.145 J-.369 E.04602
G1 X130.517 Y170.603 E.0008
G3 X130.698 Y171.341 I-.018 J.396 E.03378
G1 X130.799 Y171.73 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4570
G1 X130.787 Y171.731 E.00038
G3 X130.481 Y170.21 I-.29 J-.733 E.08468
G1 X130.536 Y170.211 E.00168
G3 X130.926 Y171.659 I-.039 J.787 E.06092
G1 X130.851 Y171.7 E.00261
M204 S10000
; WIPE_START
G1 F24000
G1 X130.787 Y171.731 E-.02711
G1 X130.637 Y171.778 E-.05959
G1 X130.48 Y171.789 E-.05976
G1 X130.324 Y171.77 E-.05977
G1 X130.175 Y171.72 E-.05976
G1 X130.039 Y171.641 E-.05976
G1 X129.921 Y171.537 E-.05975
G1 X129.826 Y171.412 E-.05976
G1 X129.758 Y171.27 E-.05976
G1 X129.719 Y171.118 E-.05976
G1 X129.711 Y170.961 E-.05976
G1 X129.735 Y170.805 E-.05976
G1 X129.788 Y170.657 E-.05977
G1 X129.81 Y170.622 E-.01592
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I1.199 J.207 P1  F30000
G1 X138.644 Y119.368 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4570
G3 X138.493 Y118.603 I-.145 J-.369 E.04602
G1 X138.517 Y118.603 E.00079
G3 X138.698 Y119.341 I-.018 J.396 E.03377
G1 X138.798 Y119.73 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4570
G1 X138.787 Y119.731 E.00036
G3 X138.481 Y118.21 I-.29 J-.733 E.08468
G1 X138.536 Y118.211 E.00168
G3 X138.923 Y119.66 I-.039 J.787 E.061
G1 X138.851 Y119.701 E.00256
M204 S10000
; WIPE_START
G1 F24000
G1 X138.787 Y119.731 E-.02679
G1 X138.637 Y119.778 E-.0596
G1 X138.48 Y119.789 E-.05976
G1 X138.324 Y119.77 E-.05975
G1 X138.175 Y119.72 E-.05977
G1 X138.039 Y119.641 E-.05976
G1 X137.921 Y119.537 E-.05976
G1 X137.826 Y119.412 E-.05976
G1 X137.758 Y119.27 E-.05976
G1 X137.719 Y119.118 E-.05976
G1 X137.711 Y118.961 E-.05977
G1 X137.735 Y118.805 E-.05976
G1 X137.788 Y118.657 E-.05976
G1 X137.811 Y118.621 E-.01624
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I1.183 J-.287 P1  F30000
G1 X130.21 Y87.269 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4570
G3 X130.493 Y86.603 I.29 J-.27 E.03032
G1 X130.517 Y86.603 E.0008
G3 X130.254 Y87.31 I-.018 J.396 E.04948
G1 X129.93 Y87.545 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4570
G1 X129.922 Y87.536 E.00035
G3 X130.481 Y86.21 I.575 J-.538 E.05575
G1 X130.536 Y86.211 E.00168
G3 X130.04 Y87.64 I-.039 J.787 E.08982
G1 X129.975 Y87.584 E.00264
M204 S10000
; WIPE_START
G1 F24000
G1 X129.922 Y87.536 E-.02706
G1 X129.826 Y87.412 E-.05972
G1 X129.758 Y87.27 E-.05976
G1 X129.719 Y87.118 E-.05976
G1 X129.711 Y86.961 E-.05976
G1 X129.735 Y86.805 E-.05976
G1 X129.788 Y86.657 E-.05976
G1 X129.87 Y86.523 E-.05975
G1 X129.977 Y86.408 E-.05976
G1 X130.105 Y86.316 E-.05977
G1 X130.248 Y86.251 E-.05976
G1 X130.481 Y86.21 E-.08985
G1 X130.536 Y86.211 E-.02075
G1 X130.601 Y86.22 E-.02477
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-.024 J-1.217 P1  F30000
G1 X77.776 Y87.283 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4570
G3 X77.493 Y86.603 I-.277 J-.284 E.05124
G1 X77.517 Y86.603 E.00079
G3 X77.816 Y87.238 I-.018 J.396 E.02855
G1 X78.063 Y87.551 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4570
G1 X78.048 Y87.561 E.00058
G3 X77.481 Y86.21 I-.551 J-.563 E.09429
G1 X77.536 Y86.211 E.00168
G3 X78.148 Y87.442 I-.039 J.787 E.0513
G1 X78.1 Y87.504 E.0024
M204 S10000
; WIPE_START
G1 F24000
G1 X78.048 Y87.561 E-.02971
G1 X77.928 Y87.663 E-.05958
G1 X77.789 Y87.735 E-.05976
G1 X77.637 Y87.778 E-.05977
G1 X77.48 Y87.789 E-.05975
G1 X77.324 Y87.77 E-.05976
G1 X77.175 Y87.72 E-.05976
G1 X77.039 Y87.641 E-.05976
G1 X76.921 Y87.537 E-.05976
G1 X76.826 Y87.412 E-.05976
G1 X76.758 Y87.27 E-.05976
G1 X76.719 Y87.118 E-.05976
G1 X76.711 Y86.961 E-.05976
G1 X76.716 Y86.926 E-.01334
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.217 J.016 P1  F30000
G1 X77.791 Y170.73 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4570
G3 X77.493 Y170.603 I-.291 J.269 E.07153
G1 X77.517 Y170.603 E.00079
G3 X77.747 Y170.689 I-.018 J.396 E.00827
G1 X78.077 Y170.465 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4570
G3 X77.481 Y170.21 I-.58 J.533 E.13158
G1 X77.536 Y170.211 E.00168
G3 X78.034 Y170.422 I-.039 J.787 E.01698
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X78.174 Y170.588 E-.08237
G1 X78.242 Y170.73 E-.05976
G1 X78.281 Y170.882 E-.05976
G1 X78.289 Y171.039 E-.05977
G1 X78.266 Y171.192 E-.05876
G1 X78.227 Y171.309 E-.04683
G1 X78.153 Y171.445 E-.05876
G1 X78.051 Y171.565 E-.05976
G1 X77.928 Y171.663 E-.05976
G1 X77.789 Y171.735 E-.05976
G1 X77.637 Y171.778 E-.05977
G1 X77.48 Y171.789 E-.05976
G1 X77.388 Y171.778 E-.03518
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/125
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
G3 Z7.8 I.992 J.706 P1  F30000
G1 X148.102 Y72.398 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4542
G1 X148.102 Y69.602 E.09274
G1 X184.135 Y69.602 E1.19527
G1 X184.135 Y72.398 E.09274
G1 X148.162 Y72.398 E1.19328
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4542
G1 X147.71 Y69.21 E.11
G1 X184.527 Y69.21 E1.13128
G1 X184.527 Y72.79 E.11
G1 X147.77 Y72.79 E1.12944
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4542
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X178.274 Y72.05 E.14719
G1 X180.374 Y69.95 E.09848
G1 X179.414 Y69.95 E.03184
G1 X181.513 Y72.05 E.09848
G1 X182.913 Y72.05 E.04645
G1 X182.913 Y71.821 E.00757
G1 X183.32 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4542
G1 X183.728 Y71.991 E.01351
G1 X183.728 Y70.011 E.06568
G1 X183.32 Y70.015 E.01351
G1 X183.32 Y71.931 E.06356
; WIPE_START
G1 F24000
G1 X183.32 Y70.015 E-.72794
G1 X183.405 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.162 J-.361 P1  F30000
G1 X148.102 Y183.602 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4542
G1 X184.135 Y183.602 E1.19527
G1 X184.135 Y186.398 E.09274
G1 X148.102 Y186.398 E1.19527
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4542
G1 X184.527 Y183.21 E1.13128
G1 X184.527 Y186.79 E.11
G1 X147.71 Y186.79 E1.13128
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.267 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-.975 J-.729 P1  F30000
G1 X149.199 Y183.95 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4542
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X178.274 Y183.95 E.14719
G1 X180.374 Y186.05 E.09848
G1 X179.414 Y186.05 E.03184
G1 X181.513 Y183.95 E.09848
G1 X182.913 Y183.95 E.04645
G1 X182.913 Y184.179 E.00757
G1 X183.32 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450106
G1 F4542
G1 X183.32 Y185.991 E.06555
G1 X183.728 Y185.991 E.01351
G1 X183.728 Y184.011 E.06568
G1 X183.38 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X183.728 Y184.011 E-.13194
G1 X183.728 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I1.193 J-.238 P1  F30000
G1 X180.876 Y171.376 Z8
M73 P75 R12
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4542
G3 X180.743 Y170.603 I-.127 J-.376 E.04549
G1 X180.765 Y170.603 E.00072
G3 X180.931 Y171.352 I-.016 J.397 E.03454
G1 X181.029 Y171.736 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4542
G1 X181 Y171.747 E.00094
G3 X180.731 Y170.21 I-.254 J-.747 E.08367
G1 X180.783 Y170.211 E.0016
G3 X181.143 Y171.682 I-.037 J.788 E.06228
G1 X181.083 Y171.71 E.00203
M204 S10000
; WIPE_START
G1 F24000
G1 X181 Y171.747 E-.03443
G1 X180.73 Y171.789 E-.1041
G1 X180.574 Y171.77 E-.05976
G1 X180.424 Y171.72 E-.05976
G1 X180.288 Y171.641 E-.05976
G1 X180.17 Y171.537 E-.05976
G1 X180.075 Y171.412 E-.05976
G1 X180.007 Y171.27 E-.05976
G1 X179.968 Y171.118 E-.05976
G1 X179.961 Y170.961 E-.05977
G1 X179.984 Y170.805 E-.05975
G1 X180.038 Y170.657 E-.05977
G1 X180.07 Y170.604 E-.02385
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-.019 J-1.217 P1  F30000
G1 X130.644 Y171.368 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4542
G3 X130.494 Y170.603 I-.145 J-.369 E.04605
G1 X130.515 Y170.603 E.00072
G3 X130.698 Y171.341 I-.016 J.396 E.03382
G1 X130.797 Y171.731 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4542
G1 X130.787 Y171.731 E.00031
G3 X130.482 Y170.21 I-.29 J-.732 E.08469
G1 X130.534 Y170.211 E.0016
G3 X130.926 Y171.659 I-.037 J.787 E.06098
G1 X130.849 Y171.702 E.00269
M204 S10000
; WIPE_START
G1 F24000
G1 X130.787 Y171.731 E-.02616
G1 X130.637 Y171.778 E-.05959
G1 X130.48 Y171.789 E-.05977
G1 X130.324 Y171.77 E-.05977
G1 X130.175 Y171.72 E-.05975
G1 X130.039 Y171.641 E-.05976
G1 X129.921 Y171.537 E-.05976
G1 X129.826 Y171.412 E-.05976
G1 X129.758 Y171.27 E-.05976
G1 X129.719 Y171.118 E-.05976
G1 X129.711 Y170.961 E-.05976
G1 X129.735 Y170.805 E-.05976
G1 X129.788 Y170.657 E-.05977
G1 X129.812 Y170.619 E-.01687
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I1.199 J.207 P1  F30000
G1 X138.644 Y119.368 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4542
G3 X138.494 Y118.603 I-.145 J-.369 E.04605
G1 X138.515 Y118.603 E.00072
G3 X138.698 Y119.341 I-.016 J.396 E.03382
G1 X138.796 Y119.731 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4542
G1 X138.787 Y119.731 E.00029
G3 X138.481 Y118.21 I-.29 J-.732 E.08469
G1 X138.534 Y118.211 E.0016
G3 X138.923 Y119.66 I-.037 J.787 E.06106
G1 X138.848 Y119.702 E.00264
M204 S10000
; WIPE_START
G1 F24000
G1 X138.787 Y119.731 E-.02581
G1 X138.637 Y119.778 E-.05959
G1 X138.48 Y119.789 E-.05976
G1 X138.324 Y119.77 E-.05976
G1 X138.175 Y119.72 E-.05977
G1 X138.039 Y119.641 E-.05976
G1 X137.921 Y119.537 E-.05976
G1 X137.826 Y119.412 E-.05977
G1 X137.758 Y119.27 E-.05975
G1 X137.719 Y119.118 E-.05976
G1 X137.711 Y118.961 E-.05976
G1 X137.735 Y118.805 E-.05975
G1 X137.788 Y118.657 E-.05976
G1 X137.812 Y118.619 E-.01723
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I1.183 J-.287 P1  F30000
G1 X130.209 Y87.27 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4542
G3 X130.493 Y86.603 I.29 J-.271 E.03039
G1 X130.515 Y86.603 E.00072
G3 X130.253 Y87.311 I-.016 J.397 E.04964
G1 X129.928 Y87.543 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4542
G1 X129.92 Y87.538 E.00028
G3 X130.481 Y86.21 I.577 J-.539 E.05584
G1 X130.534 Y86.211 E.0016
G3 X130.038 Y87.642 I-.037 J.788 E.09009
G1 X129.972 Y87.583 E.00272
M204 S10000
; WIPE_START
G1 F24000
G1 X129.92 Y87.538 E-.02625
G1 X129.826 Y87.412 E-.05982
G1 X129.758 Y87.27 E-.05976
G1 X129.719 Y87.118 E-.05976
G1 X129.711 Y86.961 E-.05976
G1 X129.735 Y86.805 E-.05975
G1 X129.788 Y86.657 E-.05977
G1 X129.87 Y86.523 E-.05975
G1 X129.977 Y86.408 E-.05976
G1 X130.105 Y86.316 E-.05977
G1 X130.248 Y86.251 E-.05975
G1 X130.481 Y86.21 E-.08991
G1 X130.534 Y86.211 E-.01985
G1 X130.602 Y86.22 E-.02633
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-.024 J-1.217 P1  F30000
G1 X77.777 Y87.284 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4542
G3 X77.494 Y86.603 I-.278 J-.284 E.05139
G1 X77.515 Y86.603 E.00072
G3 X77.816 Y87.238 I-.016 J.397 E.02864
G1 X78.061 Y87.554 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4542
G1 X78.049 Y87.563 E.00045
G3 X77.481 Y86.21 I-.552 J-.564 E.09452
G1 X77.534 Y86.211 E.0016
G3 X78.15 Y87.443 I-.037 J.788 E.05143
G1 X78.098 Y87.507 E.00253
M204 S10000
; WIPE_START
G1 F24000
G1 X78.049 Y87.563 E-.02828
G1 X77.928 Y87.663 E-.05966
G1 X77.789 Y87.735 E-.05976
G1 X77.637 Y87.778 E-.05976
G1 X77.48 Y87.789 E-.05976
G1 X77.324 Y87.77 E-.05976
G1 X77.175 Y87.72 E-.05976
G1 X77.039 Y87.641 E-.05976
G1 X76.921 Y87.537 E-.05977
G1 X76.826 Y87.412 E-.05975
G1 X76.758 Y87.27 E-.05977
G1 X76.719 Y87.118 E-.05976
G1 X76.711 Y86.961 E-.05976
G1 X76.717 Y86.922 E-.0147
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.217 J.016 P1  F30000
G1 X77.789 Y170.732 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4542
G3 X77.49 Y170.603 I-.293 J.268 E.07159
G1 X77.522 Y170.604 E.00106
G3 X77.745 Y170.691 I-.026 J.396 E.00807
G1 X78.078 Y170.464 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4542
G3 X77.48 Y170.211 I-.579 J.536 E.13181
G1 X77.556 Y170.212 E.00234
G3 X78.036 Y170.421 I-.058 J.787 E.01637
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X78.174 Y170.588 E-.08239
G1 X78.242 Y170.73 E-.05976
G1 X78.281 Y170.882 E-.05976
G1 X78.289 Y171.039 E-.05977
G1 X78.265 Y171.195 E-.05975
G1 X78.212 Y171.343 E-.05977
G1 X78.079 Y171.537 E-.08945
G1 X77.961 Y171.641 E-.05976
G1 X77.825 Y171.72 E-.05976
G1 X77.676 Y171.77 E-.05977
G1 X77.52 Y171.789 E-.05976
G1 X77.389 Y171.77 E-.0503
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/125
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
G3 Z8 I.992 J.706 P1  F30000
G1 X148.102 Y72.398 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4515
G1 X148.102 Y69.602 E.09274
G1 X183.766 Y69.602 E1.18305
G1 X183.766 Y72.398 E.09274
G1 X148.162 Y72.398 E1.18106
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4515
G1 X147.71 Y69.21 E.11
G1 X184.158 Y69.21 E1.11996
G1 X184.158 Y72.79 E.11
G1 X147.77 Y72.79 E1.11811
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4515
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X178.274 Y72.05 E.14719
G1 X180.374 Y69.95 E.09848
G1 X179.414 Y69.95 E.03184
G1 X181.513 Y72.05 E.09848
G1 X182.545 Y72.05 E.03422
G1 X182.545 Y71.453 E.01979
G1 X182.952 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4515
G1 X183.359 Y71.991 E.01351
G1 X183.359 Y70.011 E.06568
G1 X182.952 Y70.015 E.01351
G1 X182.952 Y71.931 E.06356
; WIPE_START
G1 F24000
G1 X182.952 Y70.015 E-.72794
G1 X183.036 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.163 J-.358 P1  F30000
G1 X148.102 Y183.602 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4515
G1 X183.766 Y183.602 E1.18305
G1 X183.766 Y186.398 E.09274
G1 X148.102 Y186.398 E1.18305
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4515
G1 X184.158 Y183.21 E1.11996
G1 X184.158 Y186.79 E.11
G1 X147.71 Y186.79 E1.11996
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.267 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-.975 J-.729 P1  F30000
G1 X149.199 Y183.95 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4515
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
M73 P76 R12
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X178.274 Y183.95 E.14719
G1 X180.374 Y186.05 E.09848
G1 X179.414 Y186.05 E.03184
G1 X181.513 Y183.95 E.09848
G1 X182.545 Y183.95 E.03422
G1 X182.545 Y184.547 E.01979
G1 X182.952 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4515
G1 X182.952 Y185.991 E.06555
G1 X183.359 Y185.991 E.01351
G1 X183.359 Y184.011 E.06568
G1 X183.012 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X183.359 Y184.011 E-.13194
G1 X183.359 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I1.199 J-.207 P1  F30000
G1 X180.894 Y171.369 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4515
G3 X180.743 Y170.603 I-.146 J-.369 E.04617
G1 X180.763 Y170.603 E.00065
G3 X180.948 Y171.343 I-.015 J.397 E.03394
G1 X181.035 Y171.736 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4515
G1 X180.886 Y171.776 E.00473
G3 X180.731 Y170.21 I-.14 J-.777 E.08005
G1 X180.781 Y170.211 E.00153
G3 X181.089 Y171.711 I-.035 J.789 E.06424
M204 S10000
; WIPE_START
G1 F24000
G1 X180.886 Y171.776 E-.08089
G1 X180.73 Y171.789 E-.05971
G1 X180.574 Y171.77 E-.05976
G1 X180.424 Y171.72 E-.05976
G1 X180.288 Y171.641 E-.05976
G1 X180.17 Y171.537 E-.05976
G1 X180.075 Y171.412 E-.05976
G1 X180.007 Y171.27 E-.05976
G1 X179.968 Y171.118 E-.05976
G1 X179.961 Y170.961 E-.05977
G1 X179.984 Y170.805 E-.05975
G1 X180.038 Y170.657 E-.05977
G1 X180.068 Y170.608 E-.0218
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-.019 J-1.217 P1  F30000
G1 X130.644 Y171.368 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4515
G3 X130.494 Y170.603 I-.145 J-.369 E.04607
G1 X130.513 Y170.603 E.00065
G3 X130.698 Y171.341 I-.015 J.396 E.03387
G1 X130.795 Y171.732 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4515
G1 X130.787 Y171.731 E.00025
G3 X130.482 Y170.21 I-.29 J-.733 E.08469
G1 X130.531 Y170.211 E.00153
G3 X130.926 Y171.659 I-.035 J.787 E.06105
G1 X130.847 Y171.703 E.00276
M204 S10000
; WIPE_START
G1 F24000
G1 X130.787 Y171.731 E-.02523
G1 X130.637 Y171.778 E-.0596
G1 X130.48 Y171.789 E-.05977
G1 X130.324 Y171.77 E-.05976
G1 X130.175 Y171.72 E-.05976
G1 X130.039 Y171.641 E-.05976
G1 X129.921 Y171.537 E-.05976
G1 X129.826 Y171.412 E-.05977
G1 X129.758 Y171.27 E-.05976
G1 X129.719 Y171.118 E-.05976
G1 X129.711 Y170.961 E-.05976
G1 X129.735 Y170.805 E-.05976
G1 X129.788 Y170.657 E-.05976
G1 X129.813 Y170.617 E-.0178
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I1.199 J.207 P1  F30000
G1 X138.645 Y119.369 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4515
G3 X138.494 Y118.603 I-.146 J-.369 E.04617
G1 X138.513 Y118.603 E.00065
G3 X138.699 Y119.343 I-.015 J.397 E.03394
G1 X138.794 Y119.732 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4515
G1 X138.788 Y119.733 E.00018
G3 X138.482 Y118.21 I-.291 J-.734 E.08488
G1 X138.531 Y118.211 E.00153
G3 X138.927 Y119.661 I-.035 J.789 E.06115
G1 X138.847 Y119.704 E.0028
M204 S10000
; WIPE_START
G1 F24000
G1 X138.788 Y119.733 E-.02493
G1 X138.637 Y119.778 E-.05969
G1 X138.48 Y119.789 E-.05976
G1 X138.324 Y119.77 E-.05976
G1 X138.175 Y119.72 E-.05977
G1 X138.039 Y119.641 E-.05976
G1 X137.921 Y119.537 E-.05977
G1 X137.826 Y119.412 E-.05975
G1 X137.758 Y119.27 E-.05976
G1 X137.719 Y119.118 E-.05976
G1 X137.711 Y118.961 E-.05977
G1 X137.735 Y118.805 E-.05975
G1 X137.788 Y118.657 E-.05976
G1 X137.813 Y118.617 E-.01801
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I1.183 J-.287 P1  F30000
G1 X130.208 Y87.27 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4515
G3 X130.494 Y86.603 I.29 J-.271 E.03041
G1 X130.513 Y86.603 E.00065
G3 X130.253 Y87.311 I-.015 J.397 E.0497
G1 X129.926 Y87.541 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4515
G1 X129.92 Y87.538 E.00021
G3 X130.482 Y86.21 I.577 J-.539 E.05584
G1 X130.531 Y86.211 E.00153
G3 X130.038 Y87.642 I-.035 J.789 E.09016
G1 X129.971 Y87.581 E.00279
M204 S10000
; WIPE_START
G1 F24000
G1 X129.92 Y87.538 E-.02535
G1 X129.826 Y87.412 E-.05982
G1 X129.758 Y87.27 E-.05976
G1 X129.719 Y87.118 E-.05976
G1 X129.711 Y86.961 E-.05977
G1 X129.735 Y86.805 E-.05976
G1 X129.788 Y86.657 E-.05976
G1 X129.87 Y86.523 E-.05977
G1 X129.977 Y86.408 E-.05976
G1 X130.105 Y86.316 E-.05976
G1 X130.248 Y86.251 E-.05976
G1 X130.482 Y86.21 E-.08996
G1 X130.531 Y86.211 E-.01894
G1 X130.605 Y86.221 E-.02808
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-.024 J-1.217 P1  F30000
G1 X77.776 Y87.283 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4515
G3 X77.494 Y86.603 I-.277 J-.284 E.05129
G1 X77.513 Y86.603 E.00065
G3 X77.815 Y87.237 I-.015 J.396 E.02865
G1 X78.058 Y87.557 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4515
G1 X78.048 Y87.561 E.00036
G3 X77.482 Y86.21 I-.551 J-.563 E.09431
G1 X77.531 Y86.211 E.00153
G3 X78.148 Y87.442 I-.035 J.787 E.05144
G1 X78.095 Y87.51 E.00265
M204 S10000
; WIPE_START
G1 F24000
G1 X78.048 Y87.561 E-.02667
G1 X77.928 Y87.663 E-.05959
G1 X77.789 Y87.735 E-.05976
G1 X77.637 Y87.778 E-.05976
G1 X77.48 Y87.789 E-.05976
G1 X77.324 Y87.77 E-.05976
G1 X77.175 Y87.72 E-.05976
G1 X77.039 Y87.641 E-.05976
G1 X76.921 Y87.537 E-.05977
G1 X76.826 Y87.412 E-.05976
G1 X76.758 Y87.27 E-.05976
G1 X76.719 Y87.118 E-.05976
G1 X76.711 Y86.961 E-.05976
G1 X76.718 Y86.918 E-.01638
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.217 J.016 P1  F30000
G1 X77.79 Y170.731 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4515
G3 X77.494 Y170.603 I-.292 J.268 E.07156
G1 X77.513 Y170.603 E.00065
G3 X77.746 Y170.69 I-.015 J.396 E.00839
G1 X78.077 Y170.465 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4515
G3 X77.482 Y170.21 I-.58 J.533 E.13159
G1 X77.531 Y170.211 E.00153
G3 X78.034 Y170.422 I-.035 J.787 E.01712
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X78.174 Y170.588 E-.08237
G1 X78.242 Y170.73 E-.05976
G1 X78.281 Y170.882 E-.05976
G1 X78.289 Y171.039 E-.05977
G1 X78.266 Y171.192 E-.05876
G1 X78.227 Y171.309 E-.04683
G1 X78.153 Y171.445 E-.05877
G1 X78.051 Y171.565 E-.05975
G1 X77.928 Y171.663 E-.05976
G1 X77.789 Y171.735 E-.05976
G1 X77.637 Y171.778 E-.05976
G1 X77.48 Y171.789 E-.05976
G1 X77.388 Y171.778 E-.03518
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/125
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
G3 Z8.2 I.992 J.706 P1  F30000
G1 X148.102 Y72.398 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4488
G1 X148.102 Y69.602 E.09274
G1 X183.398 Y69.602 E1.17083
G1 X183.398 Y72.398 E.09274
G1 X148.162 Y72.398 E1.16884
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4488
G1 X147.71 Y69.21 E.11
G1 X183.79 Y69.21 E1.10864
G1 X183.79 Y72.79 E.11
G1 X147.77 Y72.79 E1.10679
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4488
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X178.274 Y72.05 E.14719
G1 X180.374 Y69.95 E.09848
G1 X179.414 Y69.95 E.03184
G1 X181.513 Y72.05 E.09848
G1 X182.176 Y72.05 E.022
G1 X182.176 Y71.085 E.03201
G1 X182.584 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4488
G1 X182.991 Y71.991 E.01351
G1 X182.991 Y70.011 E.06568
G1 X182.584 Y70.015 E.01351
G1 X182.584 Y71.931 E.06356
; WIPE_START
G1 F24000
G1 X182.584 Y70.015 E-.72794
G1 X182.668 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.164 J-.354 P1  F30000
G1 X148.102 Y183.602 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4488
G1 X183.398 Y183.602 E1.17083
G1 X183.398 Y186.398 E.09274
G1 X148.102 Y186.398 E1.17083
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4488
G1 X183.79 Y183.21 E1.10864
G1 X183.79 Y186.79 E.11
G1 X147.71 Y186.79 E1.10864
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.267 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-.975 J-.729 P1  F30000
G1 X149.199 Y183.95 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4488
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X178.274 Y183.95 E.14719
G1 X180.374 Y186.05 E.09848
G1 X179.414 Y186.05 E.03184
G1 X181.513 Y183.95 E.09848
G1 X182.176 Y183.95 E.022
G1 X182.176 Y184.915 E.03201
G1 X182.584 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4488
G1 X182.584 Y185.991 E.06555
G1 X182.991 Y185.991 E.01351
G1 X182.991 Y184.011 E.06568
G1 X182.644 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X182.991 Y184.011 E-.13194
G1 X182.991 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I1.204 J-.178 P1  F30000
G1 X180.874 Y171.373 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4488
G3 X180.744 Y170.603 I-.126 J-.375 E.04533
G1 X180.761 Y170.603 E.00057
G3 X180.93 Y171.349 I-.013 J.395 E.03452
G1 X181.023 Y171.739 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4488
G1 X180.998 Y171.742 E.00076
G3 X180.731 Y170.21 I-.252 J-.745 E.08335
G1 X180.778 Y170.211 E.00146
G3 X181.14 Y171.678 I-.032 J.786 E.06226
G1 X181.076 Y171.711 E.00222
M204 S10000
; WIPE_START
G1 F24000
G1 X180.998 Y171.742 E-.03184
G1 X180.85 Y171.783 E-.05854
G1 X180.727 Y171.789 E-.04683
G1 X180.574 Y171.77 E-.05876
G1 X180.424 Y171.72 E-.05976
G1 X180.288 Y171.641 E-.05976
G1 X180.17 Y171.537 E-.05977
G1 X180.075 Y171.412 E-.05975
G1 X180.007 Y171.27 E-.05977
G1 X179.968 Y171.118 E-.05976
G1 X179.961 Y170.961 E-.05977
G1 X179.984 Y170.805 E-.05975
G1 X180.038 Y170.657 E-.05977
G1 X180.074 Y170.599 E-.02616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-.019 J-1.217 P1  F30000
G1 X130.644 Y171.368 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4488
G3 X130.494 Y170.603 I-.145 J-.369 E.04609
G1 X130.512 Y170.603 E.00057
G3 X130.698 Y171.341 I-.013 J.396 E.03393
G1 X130.793 Y171.733 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4488
G1 X130.787 Y171.731 E.0002
G3 X130.482 Y170.21 I-.29 J-.733 E.08469
G1 X130.529 Y170.211 E.00146
G3 X130.926 Y171.659 I-.032 J.787 E.06113
G1 X130.845 Y171.704 E.00284
M204 S10000
; WIPE_START
G1 F24000
G1 X130.787 Y171.731 E-.02434
G1 X130.637 Y171.778 E-.05958
G1 X130.48 Y171.789 E-.05977
G1 X130.324 Y171.77 E-.05976
G1 X130.175 Y171.72 E-.05976
G1 X130.039 Y171.641 E-.05976
G1 X129.921 Y171.537 E-.05976
G1 X129.826 Y171.412 E-.05976
G1 X129.758 Y171.27 E-.05976
G1 X129.719 Y171.118 E-.05976
G1 X129.711 Y170.961 E-.05976
G1 X129.735 Y170.805 E-.05976
G1 X129.788 Y170.657 E-.05977
G1 X129.814 Y170.615 E-.01869
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I1.199 J.207 P1  F30000
G1 X138.643 Y119.37 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4488
G3 X138.494 Y118.603 I-.144 J-.37 E.04613
G1 X138.512 Y118.603 E.00057
G3 X138.697 Y119.343 I-.013 J.397 E.03405
G1 X138.789 Y119.734 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4488
G1 X138.779 Y119.737 E.00033
G3 X138.482 Y118.21 I-.282 J-.737 E.08458
G1 X138.529 Y118.211 E.00146
G3 X138.894 Y119.682 I-.032 J.789 E.06243
G1 X138.843 Y119.707 E.00174
M204 S10000
; WIPE_START
G1 F24000
G1 X138.779 Y119.737 E-.02686
G1 X138.637 Y119.778 E-.05608
G1 X138.48 Y119.789 E-.05977
G1 X138.324 Y119.77 E-.05975
G1 X138.175 Y119.72 E-.05977
G1 X138.039 Y119.641 E-.05976
G1 X137.921 Y119.537 E-.05976
G1 X137.826 Y119.412 E-.05976
G1 X137.758 Y119.27 E-.05976
G1 X137.719 Y119.118 E-.05977
G1 X137.711 Y118.961 E-.05976
G1 X137.735 Y118.805 E-.05975
G1 X137.788 Y118.657 E-.05977
G1 X137.815 Y118.613 E-.01969
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I1.183 J-.287 P1  F30000
G1 X130.209 Y87.27 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4488
G3 X130.494 Y86.603 I.289 J-.271 E.03039
G1 X130.512 Y86.603 E.00057
G3 X130.254 Y87.31 I-.013 J.396 E.04964
G1 X129.924 Y87.54 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4488
G1 X129.922 Y87.536 E.00013
G3 X130.482 Y86.21 I.575 J-.538 E.05576
G1 X130.529 Y86.211 E.00146
G3 X130.04 Y87.64 I-.032 J.787 E.09003
G1 X129.97 Y87.579 E.00285
M204 S10000
; WIPE_START
G1 F24000
G1 X129.922 Y87.536 E-.02437
G1 X129.826 Y87.412 E-.05971
G1 X129.758 Y87.27 E-.05976
G1 X129.719 Y87.118 E-.05976
G1 X129.711 Y86.961 E-.05977
G1 X129.735 Y86.805 E-.05976
G1 X129.788 Y86.657 E-.05976
G1 X129.87 Y86.523 E-.05976
G1 X129.977 Y86.408 E-.05975
G1 X130.105 Y86.316 E-.05976
G1 X130.248 Y86.251 E-.05977
G1 X130.482 Y86.21 E-.09002
G1 X130.529 Y86.211 E-.01802
G1 X130.608 Y86.221 E-.03002
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-.024 J-1.217 P1  F30000
G1 X77.776 Y87.282 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4488
G3 X77.494 Y86.603 I-.277 J-.284 E.05131
G1 X77.512 Y86.603 E.00057
G3 X77.815 Y87.237 I-.013 J.396 E.02871
G1 X78.056 Y87.56 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4488
G1 X78.048 Y87.561 E.00026
G3 X77.482 Y86.21 I-.551 J-.563 E.09431
G1 X77.529 Y86.211 E.00146
G3 X78.148 Y87.442 I-.032 J.787 E.05152
G1 X78.093 Y87.513 E.00276
M204 S10000
; WIPE_START
G1 F24000
G1 X78.048 Y87.561 E-.02521
G1 X77.928 Y87.663 E-.05959
G1 X77.789 Y87.735 E-.05976
G1 X77.637 Y87.778 E-.05976
G1 X77.48 Y87.789 E-.05975
G1 X77.324 Y87.77 E-.05976
G1 X77.175 Y87.72 E-.05977
G1 X77.039 Y87.641 E-.05976
G1 X76.921 Y87.537 E-.05977
G1 X76.826 Y87.412 E-.05976
G1 X76.758 Y87.27 E-.05976
G1 X76.719 Y87.118 E-.05975
G1 X76.711 Y86.961 E-.05977
G1 X76.718 Y86.914 E-.01783
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.217 J.016 P1  F30000
G1 X77.79 Y170.731 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4488
G3 X77.494 Y170.603 I-.292 J.268 E.07158
G1 X77.512 Y170.603 E.00057
G3 X77.746 Y170.69 I-.013 J.396 E.00845
G1 X78.077 Y170.465 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4488
G3 X77.482 Y170.21 I-.58 J.533 E.1316
G1 X77.529 Y170.211 E.00146
G3 X78.035 Y170.422 I-.032 J.787 E.01719
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X78.174 Y170.588 E-.08237
G1 X78.242 Y170.73 E-.05977
G1 X78.281 Y170.882 E-.05975
G1 X78.289 Y171.039 E-.05977
G1 X78.266 Y171.192 E-.05876
G1 X78.227 Y171.309 E-.04684
G1 X78.153 Y171.445 E-.05876
G1 X78.051 Y171.565 E-.05976
G1 X77.928 Y171.663 E-.05976
G1 X77.789 Y171.735 E-.05976
G1 X77.637 Y171.778 E-.05976
G1 X77.48 Y171.789 E-.05976
G1 X77.388 Y171.778 E-.03518
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/125
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
G3 Z8.4 I.992 J.706 P1  F30000
G1 X148.102 Y72.398 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4461
G1 X148.102 Y69.602 E.09274
G1 X183.03 Y69.602 E1.15861
G1 X183.03 Y72.398 E.09274
G1 X148.162 Y72.398 E1.15662
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4461
G1 X147.71 Y69.21 E.11
G1 X183.422 Y69.21 E1.09732
G1 X183.422 Y72.79 E.11
G1 X147.77 Y72.79 E1.09547
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4461
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X178.274 Y72.05 E.14719
G1 X180.374 Y69.95 E.09848
G1 X179.414 Y69.95 E.03184
G1 X181.513 Y72.05 E.09848
G1 X181.808 Y72.05 E.00978
G1 X181.808 Y70.716 E.04423
G1 X182.215 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4461
G1 X182.622 Y71.991 E.01351
G1 X182.622 Y70.011 E.06568
G1 X182.215 Y70.015 E.01351
G1 X182.215 Y71.931 E.06356
; WIPE_START
G1 F24000
G1 X182.215 Y70.015 E-.72794
G1 X182.3 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.165 J-.351 P1  F30000
G1 X148.102 Y183.602 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4461
G1 X183.03 Y183.602 E1.15861
G1 X183.03 Y186.398 E.09274
G1 X148.102 Y186.398 E1.15861
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4461
G1 X183.422 Y183.21 E1.09732
G1 X183.422 Y186.79 E.11
G1 X147.71 Y186.79 E1.09732
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.267 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-.975 J-.729 P1  F30000
G1 X149.199 Y183.95 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4461
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X178.274 Y183.95 E.14719
G1 X180.374 Y186.05 E.09848
G1 X179.414 Y186.05 E.03184
G1 X181.513 Y183.95 E.09848
G1 X181.808 Y183.95 E.00978
G1 X181.808 Y185.284 E.04423
G1 X182.215 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450104
G1 F4461
G1 X182.215 Y185.991 E.06555
G1 X182.622 Y185.991 E.01351
G1 X182.622 Y184.011 E.06568
G1 X182.275 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X182.622 Y184.011 E-.13194
G1 X182.622 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I1.208 J-.148 P1  F30000
G1 X180.874 Y171.373 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4461
G3 X180.744 Y170.603 I-.126 J-.375 E.04535
G1 X180.759 Y170.603 E.0005
G3 X180.93 Y171.349 I-.011 J.395 E.03457
G1 X181.02 Y171.74 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4461
G1 X180.999 Y171.742 E.00067
G3 X180.731 Y170.21 I-.252 J-.745 E.08334
G1 X180.776 Y170.211 E.00138
G3 X181.14 Y171.678 I-.03 J.786 E.06234
G1 X181.074 Y171.712 E.00231
M204 S10000
; WIPE_START
G1 F24000
G1 X180.999 Y171.742 E-.03069
G1 X180.85 Y171.783 E-.05856
G1 X180.727 Y171.789 E-.04683
G1 X180.574 Y171.77 E-.05877
G1 X180.424 Y171.72 E-.05975
G1 X180.288 Y171.641 E-.05976
G1 X180.17 Y171.537 E-.05976
G1 X180.075 Y171.412 E-.05976
G1 X180.007 Y171.27 E-.05976
G1 X179.968 Y171.118 E-.05975
G1 X179.961 Y170.961 E-.05977
G1 X179.984 Y170.805 E-.05975
G1 X180.038 Y170.657 E-.05977
G1 X180.075 Y170.596 E-.0273
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-.019 J-1.217 P1  F30000
G1 X130.644 Y171.367 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4461
G3 X130.495 Y170.603 I-.145 J-.369 E.04611
G1 X130.51 Y170.603 E.0005
G3 X130.698 Y171.341 I-.011 J.396 E.03399
G1 X130.79 Y171.734 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4461
G1 X130.787 Y171.731 E.00016
G3 X130.482 Y170.21 I-.289 J-.733 E.08468
G1 X130.527 Y170.211 E.00138
G3 X130.926 Y171.659 I-.03 J.787 E.06121
G1 X130.843 Y171.705 E.00291
M204 S10000
; WIPE_START
G1 F24000
G1 X130.787 Y171.731 E-.02347
G1 X130.637 Y171.778 E-.0596
G1 X130.48 Y171.789 E-.05977
G1 X130.324 Y171.77 E-.05976
G1 X130.175 Y171.72 E-.05976
G1 X130.039 Y171.641 E-.05976
G1 X129.921 Y171.537 E-.05976
G1 X129.826 Y171.412 E-.05976
G1 X129.758 Y171.27 E-.05976
G1 X129.719 Y171.118 E-.05976
G1 X129.711 Y170.961 E-.05976
G1 X129.735 Y170.805 E-.05976
G1 X129.788 Y170.657 E-.05976
G1 X129.815 Y170.613 E-.01956
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I1.199 J.207 P1  F30000
G1 X138.644 Y119.367 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4461
G3 X138.495 Y118.603 I-.146 J-.369 E.04611
G1 X138.51 Y118.603 E.0005
G3 X138.698 Y119.341 I-.011 J.396 E.03399
G1 X138.787 Y119.731 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4461
G3 X138.482 Y118.21 I-.289 J-.733 E.08468
G1 X138.527 Y118.211 E.00138
G3 X138.842 Y119.706 I-.03 J.787 E.06418
M204 S10000
; WIPE_START
G1 F24000
G1 X138.637 Y119.778 E-.08232
G1 X138.48 Y119.789 E-.05976
G1 X138.324 Y119.77 E-.05975
G1 X138.175 Y119.72 E-.05976
G1 X138.039 Y119.641 E-.05977
G1 X137.921 Y119.537 E-.05976
G1 X137.826 Y119.412 E-.05976
G1 X137.758 Y119.27 E-.05976
G1 X137.719 Y119.118 E-.05977
G1 X137.711 Y118.961 E-.05976
G1 X137.735 Y118.805 E-.05976
G1 X137.788 Y118.657 E-.05976
G1 X137.816 Y118.612 E-.02031
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I1.183 J-.287 P1  F30000
G1 X130.209 Y87.27 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4461
G3 X130.495 Y86.603 I.289 J-.271 E.03041
G1 X130.51 Y86.603 E.0005
G3 X130.254 Y87.31 I-.011 J.396 E.04969
G1 X129.923 Y87.539 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4461
G1 X129.922 Y87.536 E.00007
G3 X130.482 Y86.21 I.575 J-.538 E.05576
G1 X130.527 Y86.211 E.00138
G3 X130.04 Y87.64 I-.03 J.787 E.09011
G1 X129.968 Y87.578 E.00292
M204 S10000
; WIPE_START
G1 F24000
G1 X129.922 Y87.536 E-.02353
G1 X129.826 Y87.412 E-.05971
G1 X129.758 Y87.27 E-.05976
G1 X129.719 Y87.118 E-.05976
G1 X129.711 Y86.961 E-.05976
G1 X129.735 Y86.805 E-.05976
G1 X129.788 Y86.657 E-.05976
G1 X129.87 Y86.523 E-.05976
G1 X129.977 Y86.408 E-.05977
G1 X130.105 Y86.316 E-.05975
G1 X130.248 Y86.251 E-.05977
G1 X130.482 Y86.21 E-.09008
G1 X130.527 Y86.211 E-.01711
G1 X130.61 Y86.222 E-.03173
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-.024 J-1.217 P1  F30000
G1 X77.776 Y87.283 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4461
G3 X77.495 Y86.603 I-.278 J-.284 E.05145
G1 X77.51 Y86.603 E.0005
G3 X77.816 Y87.238 I-.011 J.397 E.02881
G1 X78.053 Y87.563 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4461
G1 X78.05 Y87.563 E.00012
G3 X77.482 Y86.21 I-.552 J-.564 E.09452
G1 X77.527 Y86.211 E.00138
G3 X78.15 Y87.443 I-.03 J.789 E.05166
G1 X78.091 Y87.516 E.00288
M204 S10000
; WIPE_START
G1 F24000
G1 X78.05 Y87.563 E-.02389
G1 X77.928 Y87.663 E-.05967
G1 X77.789 Y87.735 E-.05976
G1 X77.637 Y87.778 E-.05976
G1 X77.48 Y87.789 E-.05976
G1 X77.324 Y87.77 E-.05976
G1 X77.175 Y87.72 E-.05977
G1 X77.039 Y87.641 E-.05975
G1 X76.921 Y87.537 E-.05977
G1 X76.826 Y87.412 E-.05976
G1 X76.758 Y87.27 E-.05977
G1 X76.719 Y87.118 E-.05976
G1 X76.711 Y86.961 E-.05977
G1 X76.719 Y86.911 E-.01906
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.217 J.016 P1  F30000
G1 X77.791 Y170.73 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4461
G3 X77.495 Y170.603 I-.292 J.269 E.07175
G1 X77.51 Y170.603 E.0005
G3 X77.747 Y170.689 I-.011 J.397 E.00851
G1 X78.077 Y170.464 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4461
G3 X77.482 Y170.21 I-.58 J.535 E.13189
G1 X77.527 Y170.211 E.00138
G3 X78.035 Y170.422 I-.03 J.789 E.01726
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X78.174 Y170.588 E-.08239
G1 X78.242 Y170.73 E-.05976
G1 X78.281 Y170.882 E-.05975
G1 X78.289 Y171.039 E-.05977
G1 X78.265 Y171.195 E-.05975
G1 X78.225 Y171.313 E-.04763
G1 X78.153 Y171.445 E-.05699
G1 X78.051 Y171.565 E-.05976
G1 X77.928 Y171.663 E-.05977
G1 X77.789 Y171.735 E-.05976
G1 X77.637 Y171.778 E-.05975
G1 X77.48 Y171.789 E-.05976
G1 X77.389 Y171.778 E-.03516
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/125
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
G3 Z8.6 I.992 J.706 P1  F30000
G1 X148.102 Y72.398 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4434
G1 X148.102 Y69.602 E.09274
G1 X182.661 Y69.602 E1.14639
G1 X182.661 Y72.398 E.09274
G1 X148.162 Y72.398 E1.1444
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4434
G1 X147.71 Y69.21 E.11
G1 X183.053 Y69.21 E1.086
G1 X183.053 Y72.79 E.11
G1 X147.77 Y72.79 E1.08415
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4434
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X178.274 Y72.05 E.14719
G1 X180.374 Y69.95 E.09848
G1 X179.414 Y69.95 E.03184
G1 X181.44 Y71.976 E.09503
G1 X181.44 Y72.05 E.00244
G1 X179.885 Y72.05 E.05157
G1 X181.847 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4434
G1 X182.254 Y71.991 E.01351
G1 X182.254 Y70.011 E.06568
G1 X181.847 Y70.015 E.01351
G1 X181.847 Y71.931 E.06356
; WIPE_START
G1 F24000
G1 X181.847 Y70.015 E-.72794
G1 X181.931 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-1.166 J-.347 P1  F30000
G1 X148.102 Y183.602 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4434
G1 X182.661 Y183.602 E1.14639
G1 X182.661 Y186.398 E.09274
G1 X148.102 Y186.398 E1.14639
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4434
G1 X183.053 Y183.21 E1.086
G1 X183.053 Y186.79 E.11
G1 X147.71 Y186.79 E1.086
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.267 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-.975 J-.729 P1  F30000
G1 X149.199 Y183.95 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4434
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X178.274 Y183.95 E.14719
G1 X180.374 Y186.05 E.09848
G1 X179.414 Y186.05 E.03184
G1 X181.44 Y184.024 E.09503
G1 X181.44 Y183.95 E.00244
G1 X179.885 Y183.95 E.05157
G1 X181.847 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4434
G1 X181.847 Y185.991 E.06555
G1 X182.254 Y185.991 E.01351
G1 X182.254 Y184.011 E.06568
G1 X181.907 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X182.254 Y184.011 E-.13194
G1 X182.254 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I1.211 J-.115 P1  F30000
G1 X180.894 Y171.369 Z8.8
M73 P77 R12
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4434
G3 X180.745 Y170.603 I-.146 J-.369 E.04623
G1 X180.757 Y170.603 E.00042
G3 X180.948 Y171.343 I-.009 J.397 E.03411
G1 X181.026 Y171.738 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4434
G1 X180.886 Y171.776 E.00445
G3 X180.731 Y170.21 I-.139 J-.777 E.08002
G1 X180.774 Y170.211 E.00131
G3 X181.081 Y171.715 I-.027 J.789 E.06476
M204 S10000
; WIPE_START
G1 F24000
G1 X180.886 Y171.776 E-.07768
G1 X180.73 Y171.789 E-.05971
G1 X180.574 Y171.77 E-.05976
G1 X180.424 Y171.72 E-.05976
G1 X180.288 Y171.641 E-.05976
G1 X180.17 Y171.537 E-.05976
G1 X180.075 Y171.412 E-.05975
G1 X180.007 Y171.27 E-.05977
G1 X179.968 Y171.118 E-.05975
G1 X179.961 Y170.961 E-.05977
G1 X179.984 Y170.805 E-.05975
G1 X180.038 Y170.657 E-.05977
G1 X180.072 Y170.601 E-.025
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-.019 J-1.217 P1  F30000
G1 X130.644 Y171.367 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4434
G3 X130.495 Y170.603 I-.145 J-.369 E.04613
G1 X130.508 Y170.603 E.00042
G3 X130.698 Y171.341 I-.009 J.396 E.03405
G1 X130.787 Y171.731 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4434
G3 X130.482 Y170.21 I-.289 J-.733 E.08467
G1 X130.525 Y170.211 E.00131
G3 X130.842 Y171.707 I-.027 J.787 E.06427
M204 S10000
; WIPE_START
G1 F24000
G1 X130.637 Y171.778 E-.08231
G1 X130.48 Y171.789 E-.05976
G1 X130.324 Y171.77 E-.05976
G1 X130.175 Y171.72 E-.05976
G1 X130.039 Y171.641 E-.05976
G1 X129.921 Y171.537 E-.05976
G1 X129.826 Y171.412 E-.05976
G1 X129.758 Y171.27 E-.05977
G1 X129.719 Y171.118 E-.05975
G1 X129.711 Y170.961 E-.05977
G1 X129.735 Y170.805 E-.05976
G1 X129.788 Y170.657 E-.05976
G1 X129.816 Y170.612 E-.02032
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I1.199 J.207 P1  F30000
G1 X138.646 Y119.368 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4434
G3 X138.495 Y118.603 I-.148 J-.369 E.04629
G1 X138.508 Y118.603 E.00043
G3 X138.7 Y119.342 I-.009 J.397 E.03405
G1 X138.786 Y119.736 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4434
G1 X138.783 Y119.735 E.00009
G3 X138.482 Y118.21 I-.286 J-.736 E.0847
G1 X138.525 Y118.211 E.00131
G3 X138.894 Y119.682 I-.027 J.789 E.0626
G1 X138.84 Y119.709 E.00185
M204 S10000
; WIPE_START
G1 F24000
G1 X138.783 Y119.735 E-.02375
G1 X138.637 Y119.778 E-.05777
G1 X138.48 Y119.789 E-.05977
G1 X138.324 Y119.77 E-.05976
G1 X138.175 Y119.72 E-.05976
G1 X138.039 Y119.641 E-.05976
G1 X137.921 Y119.537 E-.05976
G1 X137.826 Y119.412 E-.05976
G1 X137.758 Y119.27 E-.05976
G1 X137.719 Y119.118 E-.05976
G1 X137.711 Y118.961 E-.05977
G1 X137.735 Y118.805 E-.05975
G1 X137.788 Y118.657 E-.05976
G1 X137.817 Y118.61 E-.0211
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I1.183 J-.287 P1  F30000
G1 X130.209 Y87.27 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4434
G3 X130.495 Y86.603 I.289 J-.271 E.03043
G1 X130.508 Y86.603 E.00043
G3 X130.254 Y87.31 I-.009 J.396 E.04975
G1 X129.922 Y87.536 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4434
G3 X130.482 Y86.21 I.575 J-.538 E.05575
G1 X130.525 Y86.211 E.00131
G3 X129.965 Y87.578 I-.027 J.787 E.09319
M204 S10000
; WIPE_START
G1 F24000
G1 X129.826 Y87.412 E-.08237
G1 X129.758 Y87.27 E-.05977
G1 X129.719 Y87.118 E-.05976
G1 X129.711 Y86.961 E-.05976
G1 X129.735 Y86.805 E-.05976
G1 X129.788 Y86.657 E-.05976
G1 X129.87 Y86.523 E-.05975
G1 X129.977 Y86.408 E-.05977
G1 X130.105 Y86.316 E-.05976
G1 X130.248 Y86.251 E-.05977
G1 X130.482 Y86.21 E-.09015
G1 X130.525 Y86.211 E-.0162
G1 X130.612 Y86.222 E-.03343
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-.024 J-1.217 P1  F30000
G1 X77.776 Y87.283 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4434
G3 X77.495 Y86.603 I-.278 J-.284 E.05147
G1 X77.508 Y86.603 E.00042
G3 X77.816 Y87.238 I-.009 J.397 E.02887
G1 X78.05 Y87.564 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4434
G3 X77.482 Y86.21 I-.552 J-.564 E.09451
G1 X77.525 Y86.211 E.00131
G3 X78.091 Y87.52 I-.027 J.789 E.05472
M204 S10000
; WIPE_START
G1 F24000
G1 X77.928 Y87.663 E-.08236
G1 X77.789 Y87.735 E-.05977
G1 X77.637 Y87.778 E-.05975
G1 X77.48 Y87.789 E-.05976
G1 X77.324 Y87.77 E-.05976
G1 X77.175 Y87.72 E-.05976
G1 X77.039 Y87.641 E-.05976
G1 X76.921 Y87.537 E-.05976
G1 X76.826 Y87.412 E-.05976
G1 X76.758 Y87.27 E-.05976
G1 X76.719 Y87.118 E-.05976
G1 X76.711 Y86.961 E-.05977
G1 X76.719 Y86.908 E-.02026
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-1.217 J.016 P1  F30000
G1 X77.79 Y170.731 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4434
G3 X77.495 Y170.603 I-.292 J.268 E.07162
G1 X77.508 Y170.603 E.00042
G3 X77.746 Y170.69 I-.009 J.396 E.00856
G1 X78.077 Y170.464 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4434
G3 X77.482 Y170.21 I-.58 J.534 E.1316
G1 X77.525 Y170.211 E.00131
G3 X78.035 Y170.422 I-.027 J.787 E.01733
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X78.174 Y170.588 E-.08238
G1 X78.242 Y170.73 E-.05976
G1 X78.281 Y170.882 E-.05976
G1 X78.289 Y171.039 E-.05977
G1 X78.265 Y171.195 E-.05975
G1 X78.212 Y171.343 E-.05976
G1 X78.131 Y171.475 E-.05876
G1 X78.049 Y171.567 E-.04683
G1 X77.928 Y171.663 E-.05877
G1 X77.789 Y171.735 E-.05977
G1 X77.637 Y171.778 E-.05975
G1 X77.48 Y171.789 E-.05976
G1 X77.388 Y171.778 E-.03517
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/125
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
G3 Z8.8 I.992 J.706 P1  F30000
G1 X148.102 Y72.398 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4396
G1 X148.102 Y69.602 E.09274
G1 X182.293 Y69.602 E1.13416
G1 X182.293 Y72.398 E.09274
G1 X148.162 Y72.398 E1.13217
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4396
G1 X147.71 Y69.21 E.11
G1 X182.685 Y69.21 E1.07468
G1 X182.685 Y72.79 E.11
G1 X147.77 Y72.79 E1.07283
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4396
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X178.274 Y72.05 E.14719
G1 X180.374 Y69.95 E.09848
G1 X179.414 Y69.95 E.03184
G1 X181.071 Y71.608 E.07775
G1 X181.071 Y72.05 E.01466
G1 X179.885 Y72.05 E.03935
G1 X181.478 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4396
G1 X181.886 Y71.991 E.01351
G1 X181.886 Y70.011 E.06568
G1 X181.478 Y70.015 E.01351
G1 X181.478 Y71.931 E.06356
; WIPE_START
G1 F24000
G1 X181.478 Y70.015 E-.72794
G1 X181.563 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.167 J-.344 P1  F30000
G1 X148.102 Y183.602 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4396
G1 X182.293 Y183.602 E1.13416
G1 X182.293 Y186.398 E.09274
G1 X148.102 Y186.398 E1.13416
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4396
G1 X182.685 Y183.21 E1.07468
G1 X182.685 Y186.79 E.11
G1 X147.71 Y186.79 E1.07468
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.267 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-.975 J-.729 P1  F30000
G1 X149.199 Y183.95 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4396
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X178.274 Y183.95 E.14719
G1 X180.374 Y186.05 E.09848
G1 X179.414 Y186.05 E.03184
G1 X181.071 Y184.392 E.07775
G1 X181.071 Y183.95 E.01466
G1 X179.885 Y183.95 E.03935
G1 X181.478 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4396
G1 X181.478 Y185.991 E.06555
G1 X181.886 Y185.991 E.01351
G1 X181.886 Y184.011 E.06568
G1 X181.538 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X181.886 Y184.011 E-.13194
G1 X181.886 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I1.214 J-.084 P1  F30000
G1 X180.894 Y171.369 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4396
G3 X180.745 Y170.603 I-.146 J-.369 E.04623
G1 X180.756 Y170.603 E.00035
G3 X180.948 Y171.343 I-.007 J.397 E.03419
G1 X181.023 Y171.739 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4396
G1 X180.886 Y171.776 E.00437
G3 X180.732 Y170.21 I-.139 J-.777 E.08
G1 X180.772 Y170.211 E.00124
G3 X181.079 Y171.716 I-.024 J.789 E.06494
M204 S10000
; WIPE_START
G1 F24000
G1 X180.886 Y171.776 E-.07667
G1 X180.73 Y171.789 E-.05971
G1 X180.574 Y171.77 E-.05976
G1 X180.424 Y171.72 E-.05976
G1 X180.288 Y171.641 E-.05976
G1 X180.17 Y171.537 E-.05976
G1 X180.075 Y171.412 E-.05976
G1 X180.007 Y171.27 E-.05976
G1 X179.968 Y171.118 E-.05976
G1 X179.961 Y170.961 E-.05977
G1 X179.984 Y170.805 E-.05975
G1 X180.038 Y170.657 E-.05977
G1 X180.073 Y170.599 E-.026
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-.019 J-1.217 P1  F30000
G1 X130.644 Y171.368 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4396
G3 X130.496 Y170.603 I-.145 J-.369 E.04613
G1 X130.506 Y170.603 E.00035
G3 X130.698 Y171.341 I-.007 J.396 E.03413
G1 X130.787 Y171.736 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4396
G1 X130.636 Y171.774 E.00476
G3 X130.482 Y170.21 I-.138 J-.776 E.07984
G1 X130.523 Y170.211 E.00123
G3 X130.838 Y171.709 I-.024 J.787 E.06451
M204 S10000
; WIPE_START
G1 F24000
G1 X130.636 Y171.774 E-.08027
G1 X130.48 Y171.789 E-.05962
G1 X130.324 Y171.77 E-.05977
G1 X130.175 Y171.72 E-.05976
G1 X130.039 Y171.641 E-.05976
G1 X129.921 Y171.537 E-.05976
G1 X129.826 Y171.412 E-.05976
G1 X129.758 Y171.27 E-.05976
G1 X129.719 Y171.118 E-.05976
G1 X129.711 Y170.961 E-.05976
G1 X129.735 Y170.805 E-.05977
G1 X129.788 Y170.657 E-.05975
G1 X129.819 Y170.607 E-.0225
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I1.199 J.207 P1  F30000
G1 X138.645 Y119.369 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4396
G3 X138.496 Y118.603 I-.146 J-.369 E.04623
G1 X138.506 Y118.603 E.00035
G3 X138.699 Y119.343 I-.007 J.397 E.03419
G1 X138.785 Y119.736 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4396
G1 X138.637 Y119.777 E.00473
G3 X138.482 Y118.21 I-.139 J-.777 E.08
G1 X138.523 Y118.211 E.00123
G3 X138.84 Y119.711 I-.024 J.789 E.06459
M204 S10000
; WIPE_START
G1 F24000
G1 X138.637 Y119.777 E-.08096
G1 X138.48 Y119.789 E-.05971
G1 X138.324 Y119.77 E-.05976
G1 X138.175 Y119.72 E-.05976
G1 X138.039 Y119.641 E-.05976
G1 X137.921 Y119.537 E-.05977
G1 X137.826 Y119.412 E-.05976
G1 X137.758 Y119.27 E-.05976
G1 X137.719 Y119.118 E-.05975
G1 X137.711 Y118.961 E-.05978
G1 X137.735 Y118.805 E-.05975
G1 X137.788 Y118.657 E-.05977
G1 X137.818 Y118.609 E-.02172
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I1.183 J-.287 P1  F30000
G1 X130.21 Y87.269 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4396
G3 X130.496 Y86.603 I.29 J-.271 E.03043
G1 X130.506 Y86.603 E.00035
G3 X130.254 Y87.31 I-.007 J.396 E.04983
G1 X129.92 Y87.536 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4396
G1 X129.827 Y87.411 E.00477
G3 X130.482 Y86.21 I.671 J-.413 E.0509
G1 X130.523 Y86.211 E.00124
G3 X129.963 Y87.576 I-.024 J.787 E.09336
M204 S10000
; WIPE_START
G1 F24000
G1 X129.827 Y87.411 E-.08129
G1 X129.758 Y87.27 E-.0597
G1 X129.719 Y87.118 E-.05977
G1 X129.711 Y86.961 E-.05976
G1 X129.735 Y86.805 E-.05976
G1 X129.788 Y86.657 E-.05975
G1 X129.87 Y86.523 E-.05977
G1 X129.977 Y86.408 E-.05976
G1 X130.105 Y86.316 E-.05976
G1 X130.248 Y86.251 E-.05976
G1 X130.482 Y86.21 E-.09023
G1 X130.523 Y86.211 E-.01528
G1 X130.615 Y86.222 E-.03542
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-.024 J-1.217 P1  F30000
G1 X77.777 Y87.284 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4396
G3 X77.496 Y86.603 I-.278 J-.284 E.05147
G1 X77.506 Y86.603 E.00035
G3 X77.816 Y87.238 I-.007 J.397 E.02895
G1 X78.049 Y87.568 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4396
G1 X77.927 Y87.662 E.00471
G3 X77.482 Y86.21 I-.429 J-.662 E.08966
G1 X77.523 Y86.211 E.00124
G3 X78.089 Y87.523 I-.024 J.789 E.05494
M204 S10000
; WIPE_START
G1 F24000
G1 X77.927 Y87.662 E-.08072
G1 X77.789 Y87.735 E-.05969
G1 X77.637 Y87.778 E-.05975
G1 X77.48 Y87.789 E-.05976
G1 X77.324 Y87.77 E-.05976
G1 X77.175 Y87.72 E-.05977
G1 X77.039 Y87.641 E-.05976
G1 X76.921 Y87.537 E-.05977
G1 X76.826 Y87.412 E-.05976
G1 X76.758 Y87.27 E-.05976
G1 X76.719 Y87.118 E-.05976
G1 X76.711 Y86.961 E-.05976
G1 X76.72 Y86.903 E-.02198
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.217 J.016 P1  F30000
G1 X77.789 Y170.732 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4396
G3 X77.49 Y170.603 I-.293 J.268 E.07159
G1 X77.522 Y170.604 E.00106
G3 X77.745 Y170.691 I-.026 J.396 E.00807
G1 X78.078 Y170.464 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4396
G3 X77.48 Y170.211 I-.579 J.536 E.13181
G1 X77.556 Y170.212 E.00234
G3 X78.036 Y170.421 I-.058 J.787 E.01637
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X78.174 Y170.588 E-.08239
G1 X78.242 Y170.73 E-.05976
G1 X78.281 Y170.882 E-.05975
G1 X78.289 Y171.039 E-.05977
G1 X78.265 Y171.195 E-.05976
G1 X78.212 Y171.343 E-.05976
G1 X78.079 Y171.537 E-.08946
G1 X77.961 Y171.641 E-.05976
G1 X77.825 Y171.72 E-.05976
G1 X77.676 Y171.77 E-.05977
G1 X77.52 Y171.789 E-.05976
G1 X77.389 Y171.77 E-.0503
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/125
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
G3 Z9 I.992 J.706 P1  F30000
G1 X148.102 Y72.398 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4357
G1 X148.102 Y69.602 E.09274
G1 X181.924 Y69.602 E1.12194
G1 X181.924 Y72.398 E.09274
G1 X148.162 Y72.398 E1.11995
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4357
G1 X147.71 Y69.21 E.11
G1 X182.316 Y69.21 E1.06336
G1 X182.316 Y72.79 E.11
G1 X147.77 Y72.79 E1.06151
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4357
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X178.274 Y72.05 E.14719
G1 X180.374 Y69.95 E.09848
G1 X179.414 Y69.95 E.03184
G1 X180.703 Y71.239 E.06047
G1 X180.703 Y72.05 E.02688
G1 X179.885 Y72.05 E.02713
G1 X181.11 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4357
G1 X181.517 Y71.991 E.01351
G1 X181.517 Y70.011 E.06568
G1 X181.11 Y70.015 E.01351
G1 X181.11 Y71.931 E.06356
; WIPE_START
G1 F24000
G1 X181.11 Y70.015 E-.72794
G1 X181.194 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-1.168 J-.34 P1  F30000
G1 X148.102 Y183.602 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4357
G1 X181.924 Y183.602 E1.12194
G1 X181.924 Y186.398 E.09274
G1 X148.102 Y186.398 E1.12194
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4357
M73 P77 R11
G1 X182.316 Y183.21 E1.06336
G1 X182.316 Y186.79 E.11
G1 X147.71 Y186.79 E1.06336
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.267 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-.975 J-.729 P1  F30000
G1 X149.199 Y183.95 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4357
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X178.274 Y183.95 E.14719
G1 X180.374 Y186.05 E.09848
G1 X179.414 Y186.05 E.03184
G1 X180.703 Y184.761 E.06047
G1 X180.703 Y183.95 E.02688
G1 X179.885 Y183.95 E.02713
G1 X181.11 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4357
G1 X181.11 Y185.991 E.06555
G1 X181.517 Y185.991 E.01351
G1 X181.517 Y184.011 E.06568
G1 X181.17 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X181.517 Y184.011 E-.13194
G1 X181.517 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I1.216 J-.056 P1  F30000
G1 X180.856 Y171.38 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4357
G3 X180.75 Y170.602 I-.112 J-.381 E.04534
G1 X180.798 Y170.606 E.00162
G3 X180.912 Y171.359 I-.054 J.393 E.03381
G1 X181.022 Y171.74 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4357
G1 X180.886 Y171.777 E.00431
G3 X180.732 Y170.21 I-.138 J-.777 E.07997
G1 X180.77 Y170.21 E.00116
G3 X181.077 Y171.717 I-.022 J.789 E.0651
M204 S10000
; WIPE_START
G1 F24000
G1 X180.886 Y171.777 E-.07598
G1 X180.73 Y171.789 E-.05972
G1 X180.574 Y171.77 E-.05976
G1 X180.424 Y171.72 E-.05976
G1 X180.288 Y171.641 E-.05977
G1 X180.17 Y171.537 E-.05976
G1 X180.075 Y171.412 E-.05976
G1 X180.007 Y171.27 E-.05976
G1 X179.968 Y171.118 E-.05976
G1 X179.961 Y170.961 E-.05976
G1 X179.984 Y170.805 E-.05976
G1 X180.038 Y170.657 E-.05976
G1 X180.074 Y170.597 E-.0267
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-.019 J-1.217 P1  F30000
G1 X130.607 Y171.38 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4357
G3 X130.501 Y170.602 I-.112 J-.381 E.04534
G1 X130.549 Y170.606 E.00162
G3 X130.663 Y171.359 I-.054 J.393 E.03381
G1 X130.785 Y171.736 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4357
G1 X130.636 Y171.774 E.0047
G3 X130.483 Y170.21 I-.138 J-.776 E.07981
G1 X130.52 Y170.21 E.00116
G3 X130.837 Y171.709 I-.022 J.788 E.06464
M204 S10000
; WIPE_START
G1 F24000
G1 X130.636 Y171.774 E-.08001
G1 X130.48 Y171.789 E-.05962
G1 X130.324 Y171.77 E-.05977
G1 X130.175 Y171.72 E-.05975
G1 X130.039 Y171.641 E-.05977
G1 X129.921 Y171.537 E-.05976
G1 X129.826 Y171.412 E-.05976
G1 X129.758 Y171.27 E-.05976
G1 X129.719 Y171.118 E-.05976
G1 X129.711 Y170.961 E-.05976
G1 X129.735 Y170.805 E-.05976
G1 X129.788 Y170.657 E-.05976
G1 X129.82 Y170.606 E-.02277
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I1.199 J.206 P1  F30000
G1 X138.607 Y119.38 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4357
G3 X138.501 Y118.602 I-.112 J-.381 E.04534
G1 X138.549 Y118.606 E.00162
G3 X138.663 Y119.359 I-.054 J.393 E.03381
G1 X138.783 Y119.737 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4357
G1 X138.637 Y119.777 E.00466
G3 X138.483 Y118.21 I-.138 J-.777 E.07997
G1 X138.52 Y118.21 E.00116
G3 X138.838 Y119.712 I-.022 J.789 E.06476
M204 S10000
; WIPE_START
G1 F24000
G1 X138.637 Y119.777 E-.08013
G1 X138.48 Y119.789 E-.05972
G1 X138.324 Y119.77 E-.05976
G1 X138.175 Y119.72 E-.05976
G1 X138.039 Y119.641 E-.05977
G1 X137.921 Y119.537 E-.05976
G1 X137.826 Y119.412 E-.05975
G1 X137.758 Y119.27 E-.05976
G1 X137.719 Y119.118 E-.05976
G1 X137.711 Y118.961 E-.05977
G1 X137.735 Y118.805 E-.05975
G1 X137.788 Y118.657 E-.05976
G1 X137.819 Y118.607 E-.02255
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I1.182 J-.288 P1  F30000
G1 X130.181 Y87.242 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4357
G3 X130.501 Y86.602 I.314 J-.243 E.02954
G1 X130.549 Y86.606 E.00162
G3 X130.221 Y87.287 I-.054 J.393 E.04961
G1 X129.919 Y87.534 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4357
G1 X129.828 Y87.411 E.00471
G3 X130.483 Y86.21 I.671 J-.413 E.05088
G1 X130.52 Y86.21 E.00116
G3 X129.962 Y87.575 I-.022 J.788 E.09352
M204 S10000
; WIPE_START
G1 F24000
G1 X129.828 Y87.411 E-.08061
G1 X129.758 Y87.27 E-.05969
G1 X129.719 Y87.118 E-.05975
G1 X129.711 Y86.961 E-.05977
G1 X129.735 Y86.805 E-.05976
G1 X129.788 Y86.657 E-.05976
G1 X129.87 Y86.523 E-.05976
G1 X129.977 Y86.408 E-.05976
G1 X130.105 Y86.316 E-.05976
G1 X130.248 Y86.251 E-.05976
G1 X130.483 Y86.21 E-.09031
G1 X130.52 Y86.21 E-.01435
G1 X130.617 Y86.223 E-.03695
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-.025 J-1.217 P1  F30000
G1 X77.745 Y87.307 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4357
G3 X77.501 Y86.602 I-.25 J-.308 E.05056
G1 X77.549 Y86.606 E.00162
G3 X77.789 Y87.266 I-.054 J.393 E.02859
G1 X78.047 Y87.569 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4357
G1 X77.928 Y87.662 E.00465
G3 X77.483 Y86.21 I-.429 J-.663 E.08963
G1 X77.52 Y86.21 E.00116
G3 X78.088 Y87.525 I-.022 J.789 E.0551
M204 S10000
; WIPE_START
G1 F24000
G1 X77.928 Y87.662 E-.08012
G1 X77.789 Y87.735 E-.0597
G1 X77.637 Y87.778 E-.05976
G1 X77.48 Y87.789 E-.05976
G1 X77.324 Y87.77 E-.05976
G1 X77.175 Y87.72 E-.05976
G1 X77.039 Y87.641 E-.05976
G1 X76.921 Y87.537 E-.05977
G1 X76.826 Y87.412 E-.05976
G1 X76.758 Y87.27 E-.05976
G1 X76.719 Y87.118 E-.05976
G1 X76.711 Y86.961 E-.05977
G1 X76.72 Y86.902 E-.02257
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-1.217 J.016 P1  F30000
G1 X77.817 Y170.76 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4357
G1 X77.814 Y170.762 E.00012
G3 X77.501 Y170.602 I-.319 J.237 E.07068
G1 X77.549 Y170.606 E.00162
G3 X77.698 Y170.658 I-.054 J.393 E.00525
G1 X77.771 Y170.721 E.00322
G1 X78.078 Y170.464 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4357
G3 X77.483 Y170.21 I-.579 J.536 E.1319
G1 X77.52 Y170.21 E.00116
G3 X78.036 Y170.421 I-.022 J.789 E.01748
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X78.174 Y170.588 E-.0824
G1 X78.242 Y170.73 E-.05976
G1 X78.281 Y170.882 E-.05976
G1 X78.289 Y171.039 E-.05978
G1 X78.228 Y171.307 E-.10447
G1 X78.153 Y171.445 E-.05952
G1 X78.051 Y171.565 E-.05975
G1 X77.928 Y171.663 E-.05976
G1 X77.789 Y171.735 E-.05976
G1 X77.637 Y171.778 E-.05976
G1 X77.48 Y171.789 E-.05976
G1 X77.388 Y171.778 E-.03552
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/125
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
G3 Z9.2 I.992 J.706 P1  F30000
G1 X148.102 Y72.398 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4709
G1 X148.102 Y69.602 E.09274
G1 X181.556 Y69.602 E1.10972
G1 X181.556 Y72.398 E.09274
G1 X148.162 Y72.398 E1.10773
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4709
G1 X147.71 Y69.21 E.11
G1 X181.948 Y69.21 E1.05204
G1 X181.948 Y72.79 E.11
G1 X147.77 Y72.79 E1.05019
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4709
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X178.274 Y72.05 E.14719
G1 X180.334 Y69.99 E.09664
G1 X180.334 Y70.871 E.02923
G1 X179.414 Y69.95 E.04318
G1 X177.786 Y69.95 E.05401
G1 X180.742 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4709
G1 X181.149 Y71.991 E.01351
G1 X181.149 Y70.011 E.06568
G1 X180.742 Y70.015 E.01351
G1 X180.742 Y71.931 E.06356
; WIPE_START
G1 F24000
G1 X180.742 Y70.015 E-.72794
G1 X180.826 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.169 J-.337 P1  F30000
G1 X148.102 Y183.602 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4709
G1 X181.556 Y183.602 E1.10972
G1 X181.556 Y186.398 E.09274
G1 X148.102 Y186.398 E1.10972
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4709
G1 X181.948 Y183.21 E1.05204
G1 X181.948 Y186.79 E.11
G1 X147.71 Y186.79 E1.05204
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.975 J-.729 P1  F30000
G1 X149.199 Y183.95 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4709
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X178.274 Y183.95 E.14719
G1 X180.334 Y186.01 E.09664
G1 X180.334 Y185.129 E.02923
G1 X179.414 Y186.05 E.04318
G1 X177.786 Y186.05 E.05401
G1 X180.742 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F4709
G1 X180.742 Y185.991 E.06555
G1 X181.149 Y185.991 E.01351
G1 X181.149 Y184.011 E.06568
G1 X180.801 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X181.149 Y184.011 E-.13194
G1 X181.149 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.217 J-.011 P1  F30000
G1 X181.019 Y171.74 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4709
G1 X180.886 Y171.777 E.00424
G3 X180.732 Y170.21 I-.137 J-.777 E.07993
G1 X180.767 Y170.21 E.00109
G3 X181.075 Y171.718 I-.019 J.789 E.06528
M204 S10000
; WIPE_START
G1 F24000
G1 X180.886 Y171.777 E-.07514
M73 P78 R11
G1 X180.73 Y171.789 E-.05972
G1 X180.574 Y171.77 E-.05976
G1 X180.424 Y171.72 E-.05976
G1 X180.288 Y171.641 E-.05975
G1 X180.17 Y171.537 E-.05977
G1 X180.075 Y171.412 E-.05976
G1 X180.007 Y171.27 E-.05977
G1 X179.968 Y171.118 E-.05975
G1 X179.961 Y170.961 E-.05976
G1 X179.984 Y170.805 E-.05976
G1 X180.038 Y170.657 E-.05976
G1 X180.075 Y170.596 E-.02752
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.333 J1.171 P1  F30000
G1 X180.687 Y170.422 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F4709
G1 X181.327 Y171.062 E.02781
G1 X181.152 Y171.42
G1 X180.33 Y170.597 E.03575
G1 X180.168 Y170.969
G1 X180.78 Y171.581 E.02658
M204 S10000
; WIPE_START
G1 F24000
G1 X180.168 Y170.969 E-.32876
G1 X180.33 Y170.597 E-.15403
G1 X180.845 Y171.113 E-.27721
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.975 J.728 P1  F30000
G1 X181.2 Y170.638 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0891022
G1 F4709
G2 X181.109 Y170.546 I-.874 J.786 E.00049
G1 X180.662 Y170.415 F30000
; LINE_WIDTH: 0.136467
G1 F4709
G1 X180.554 Y170.485 E.00098
G1 X180.472 Y170.468 E.00064
; WIPE_START
G1 F24000
G1 X180.554 Y170.485 E-.30048
G1 X180.662 Y170.415 E-.45952
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.032 J-1.217 P1  F30000
G1 X130.783 Y171.737 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4709
G1 X130.636 Y171.774 E.00465
G3 X130.483 Y170.21 I-.137 J-.776 E.07977
G1 X130.518 Y170.21 E.00109
G3 X130.836 Y171.71 I-.019 J.788 E.06479
M204 S10000
G1 X130.96 Y171.355 F30000
M204 S2000
; FEATURE: Top surface
G1 F4709
G1 X130.145 Y170.54 E.03543
G1 X129.935 Y170.863
G1 X130.637 Y171.565 E.03051
M204 S10000
G1 X131.093 Y171.094 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.358049
G1 F4709
G2 X130.424 Y170.404 I-1.507 J.792 E.02504
; WIPE_START
G1 F24000
G1 X130.817 Y170.706 E-.3875
G1 X131.093 Y171.094 E-.3725
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.958 J-.751 P1  F30000
G1 X130.803 Y171.465 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.116005
G1 F4709
G3 X130.668 Y171.558 I-.791 J-.993 E.00098
G1 X130.34 Y171.567 F30000
; LINE_WIDTH: 0.135636
G1 F4709
G3 X129.994 Y171.244 I.657 J-1.051 E.0036
; LINE_WIDTH: 0.111223
G3 X129.939 Y171.158 I.834 J-.596 E.00057
G1 X130.343 Y171.562 F30000
; LINE_WIDTH: 0.0881702
G1 F4709
G1 X130.038 Y171.383 E.0013
; WIPE_START
G1 F24000
G1 X130.343 Y171.562 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.201 J.196 P1  F30000
G1 X138.781 Y119.737 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4709
G1 X138.637 Y119.777 E.0046
G3 X138.483 Y118.21 I-.137 J-.777 E.07993
G1 X138.518 Y118.21 E.00109
G3 X138.836 Y119.713 I-.019 J.789 E.06494
M204 S10000
G1 X139.051 Y119.186 F30000
M204 S2000
; FEATURE: Top surface
G1 F4709
G1 X138.313 Y118.449 E.03205
G1 X138.013 Y118.682
G1 X138.818 Y119.487 E.03499
M204 S10000
G1 X138.97 Y118.626 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.110651
G1 F4709
G1 X138.573 Y118.419 E.00247
G1 X139.09 Y118.922 F30000
; LINE_WIDTH: 0.156521
G1 F4709
G2 X138.919 Y118.682 I-1.648 J.993 E.00273
; LINE_WIDTH: 0.1865
G2 X138.583 Y118.405 I-1.135 J1.035 E.00512
G1 X139.036 Y119.228 F30000
; LINE_WIDTH: 0.0968568
G1 F4709
G1 X139.02 Y119.251 E.00012
G3 X138.944 Y119.347 I-.999 J-.711 E.00054
G1 X138.542 Y119.599 F30000
; LINE_WIDTH: 0.313859
G1 F4709
G3 X137.903 Y118.941 I.802 J-1.419 E.02054
; WIPE_START
G1 F24000
G1 X138.167 Y119.309 E-.37125
G1 X138.542 Y119.599 E-.38875
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.175 J-.316 P1  F30000
G1 X129.918 Y87.533 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4709
G1 X129.828 Y87.41 E.00465
G3 X130.483 Y86.21 I.671 J-.412 E.05085
G1 X130.518 Y86.21 E.00109
G3 X129.961 Y87.573 I-.019 J.788 E.09368
M204 S10000
; WIPE_START
G1 F24000
G1 X129.828 Y87.41 E-.07992
G1 X129.758 Y87.27 E-.05966
G1 X129.719 Y87.118 E-.05976
G1 X129.711 Y86.961 E-.05977
G1 X129.735 Y86.805 E-.05976
G1 X129.788 Y86.657 E-.05976
G1 X129.87 Y86.523 E-.05976
G1 X129.977 Y86.408 E-.05976
G1 X130.105 Y86.316 E-.05976
G1 X130.248 Y86.251 E-.05975
G1 X130.483 Y86.21 E-.09041
G1 X130.518 Y86.21 E-.01343
G1 X130.619 Y86.223 E-.0385
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.111 J.497 P1  F30000
G1 X131.05 Y87.189 Z9.4
G1 Z9
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F4709
G1 X130.311 Y86.45 E.03211
G1 X130.012 Y86.684
G1 X130.817 Y87.488 E.03497
M204 S10000
G1 X130.971 Y86.628 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.112816
G1 F4709
G1 X130.57 Y86.419 E.00258
G1 X131.091 Y86.926 F30000
; LINE_WIDTH: 0.158469
G1 F4709
G2 X130.919 Y86.683 I-1.665 J1.002 E.00281
; LINE_WIDTH: 0.188484
G2 X130.581 Y86.405 I-1.139 J1.038 E.00521
G1 X131.035 Y87.232 F30000
; LINE_WIDTH: 0.0953508
G1 F4709
G1 X130.966 Y87.322 E.00048
G1 X130.972 Y87.371 E.00021
G1 X130.54 Y87.599 F30000
; LINE_WIDTH: 0.311833
G1 F4709
G3 X129.903 Y86.943 I.802 J-1.417 E.02034
; WIPE_START
G1 F24000
G1 X130.166 Y87.31 E-.37126
G1 X130.54 Y87.599 E-.38874
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.001 J-1.217 P1  F30000
G1 X78.045 Y87.57 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4709
G1 X77.928 Y87.662 E.00458
G3 X77.483 Y86.21 I-.428 J-.663 E.08959
G1 X77.518 Y86.21 E.00109
G3 X78.087 Y87.527 I-.019 J.789 E.05528
M204 S10000
G1 X78.081 Y87.013 F30000
M204 S2000
; FEATURE: Top surface
G1 F4709
G1 X77.486 Y86.418 E.02587
G1 X77.106 Y86.572
G1 X77.928 Y87.393 E.0357
G1 X77.578 Y87.576
G1 X76.924 Y86.922 E.02842
M204 S10000
G1 X77.208 Y87.502 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969666
G1 F4709
G3 X76.997 Y87.291 I.746 J-.958 E.00132
G1 X76.918 Y86.895 F30000
; LINE_WIDTH: 0.132503
G1 F4709
G1 X76.989 Y86.789 E.00093
G1 X76.974 Y86.711 E.00058
; WIPE_START
G1 F24000
G1 X76.989 Y86.789 E-.29189
G1 X76.918 Y86.895 E-.46811
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.217 J.017 P1  F30000
G1 X78.079 Y170.463 Z9.4
G1 Z9
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4709
G3 X77.483 Y170.21 I-.579 J.536 E.1319
G1 X77.518 Y170.21 E.00109
G3 X78.036 Y170.421 I-.019 J.789 E.01756
M204 S10000
G1 X77.275 Y170.464 F30000
M204 S2000
; FEATURE: Top surface
G1 F4709
G1 X78.037 Y171.226 E.0331
G1 X77.785 Y171.507
G1 X76.993 Y170.715 E.0344
M204 S10000
; WIPE_START
G1 F24000
G1 X77.785 Y171.507 E-.42545
G1 X78.037 Y171.226 E-.14351
G1 X77.681 Y170.87 E-.19104
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.185 J-.277 P1  F30000
G1 X77.511 Y171.6 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.275894
G1 F4709
G3 X76.9 Y170.971 I.79 J-1.378 E.01687
G1 X77.219 Y170.491 F30000
; LINE_WIDTH: 0.0927978
G1 F4709
G2 X77.12 Y170.575 I.795 J1.04 E.00053
; WIPE_START
G1 F24000
G1 X77.219 Y170.491 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.583 J1.068 P1  F30000
G1 X78.1 Y170.972 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.211261
G1 F4709
G2 X77.546 Y170.402 I-1.318 J.728 E.01104
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X77.87 Y170.657 E-.39068
G1 X78.1 Y170.972 E-.36932
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/125
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
G3 Z9.4 I-.216 J1.198 P1  F30000
G1 X148.102 Y183.602 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3305
G1 X181.187 Y183.602 E1.0975
G1 X181.187 Y186.398 E.09274
G1 X148.102 Y186.398 E1.0975
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3305
G1 X181.579 Y183.21 E1.04071
G1 X181.579 Y186.79 E.11
G1 X147.71 Y186.79 E1.04071
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-.975 J-.729 P1  F30000
G1 X149.199 Y183.95 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3305
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X178.274 Y183.95 E.14719
G1 X179.966 Y185.642 E.07936
G1 X179.966 Y185.498 E.00479
G1 X179.414 Y186.05 E.0259
G1 X177.786 Y186.05 E.05401
G1 X180.373 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450104
G1 F3305
G1 X180.373 Y185.991 E.06555
G1 X180.78 Y185.991 E.01351
G1 X180.78 Y184.011 E.06568
G1 X180.433 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X180.78 Y184.011 E-.13194
G1 X180.78 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I1.169 J-.337 P1  F30000
G1 X148.102 Y72.398 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3305
G1 X148.102 Y69.602 E.09274
G1 X181.187 Y69.602 E1.0975
G1 X181.187 Y72.398 E.09274
G1 X148.162 Y72.398 E1.09551
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3305
G1 X147.71 Y69.21 E.11
G1 X181.579 Y69.21 E1.04071
G1 X181.579 Y72.79 E.11
G1 X147.77 Y72.79 E1.03887
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3305
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X178.274 Y72.05 E.14719
G1 X179.966 Y70.358 E.07935
G1 X179.966 Y70.502 E.00479
G1 X179.414 Y69.95 E.0259
G1 X177.786 Y69.95 E.05401
G1 X180.373 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450104
G1 F3305
G1 X180.78 Y71.991 E.01351
G1 X180.78 Y70.011 E.06568
G1 X180.373 Y70.015 E.01351
G1 X180.373 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X180.373 Y70.015 E-.72794
G1 X180.457 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/125
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
G3 Z9.6 I-1.17 J-.333 P1  F30000
G1 X148.102 Y183.602 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3314
G1 X180.819 Y183.602 E1.08528
G1 X180.819 Y186.398 E.09274
G1 X148.102 Y186.398 E1.08528
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3314
G1 X181.211 Y183.21 E1.02939
G1 X181.211 Y186.79 E.11
G1 X147.71 Y186.79 E1.02939
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I-.975 J-.729 P1  F30000
G1 X149.199 Y183.95 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3314
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X178.274 Y183.95 E.14719
G1 X179.598 Y185.274 E.06207
G1 X179.598 Y185.866 E.01965
G1 X179.414 Y186.05 E.00862
G1 X177.786 Y186.05 E.05401
G1 X180.005 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450104
G1 F3314
G1 X180.005 Y185.991 E.06555
G1 X180.412 Y185.991 E.01351
G1 X180.412 Y184.011 E.06568
G1 X180.065 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X180.412 Y184.011 E-.13194
G1 X180.412 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I1.17 J-.334 P1  F30000
G1 X148.102 Y72.398 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3314
G1 X148.102 Y69.602 E.09274
G1 X180.819 Y69.602 E1.08528
G1 X180.819 Y72.398 E.09274
G1 X148.162 Y72.398 E1.08329
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3314
G1 X147.71 Y69.21 E.11
G1 X181.211 Y69.21 E1.02939
G1 X181.211 Y72.79 E.11
G1 X147.77 Y72.79 E1.02755
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3314
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X178.274 Y72.05 E.14719
G1 X179.598 Y70.727 E.06207
G1 X179.598 Y70.134 E.01965
G1 X179.414 Y69.95 E.00862
G1 X177.786 Y69.95 E.05401
G1 X180.005 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F3314
G1 X180.412 Y71.991 E.01351
G1 X180.412 Y70.011 E.06568
G1 X180.005 Y70.015 E.01351
G1 X180.005 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X180.005 Y70.015 E-.72794
G1 X180.089 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/125
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
G3 Z9.8 I-1.171 J-.33 P1  F30000
G1 X148.102 Y183.602 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3265
G1 X180.451 Y183.602 E1.07306
G1 X180.451 Y186.398 E.09274
G1 X148.102 Y186.398 E1.07306
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3265
G1 X180.843 Y183.21 E1.01807
G1 X180.843 Y186.79 E.11
G1 X147.71 Y186.79 E1.01807
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I-.975 J-.729 P1  F30000
G1 X149.199 Y183.95 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3265
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X178.274 Y183.95 E.14719
G1 X179.229 Y184.905 E.04479
G1 X179.229 Y186.05 E.03797
G1 X178.745 Y186.05 E.01605
G1 X179.636 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450106
G1 F3265
G1 X179.636 Y185.991 E.06555
G1 X180.043 Y185.991 E.01351
G1 X180.043 Y184.011 E.06568
G1 X179.696 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X180.043 Y184.011 E-.13194
G1 X180.043 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I1.171 J-.33 P1  F30000
G1 X148.102 Y72.398 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3265
G1 X148.102 Y69.602 E.09274
G1 X180.451 Y69.602 E1.07306
G1 X180.451 Y72.398 E.09274
G1 X148.162 Y72.398 E1.07107
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3265
G1 X147.71 Y69.21 E.11
G1 X180.843 Y69.21 E1.01807
G1 X180.843 Y72.79 E.11
G1 X147.77 Y72.79 E1.01623
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3265
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X178.274 Y72.05 E.14719
G1 X179.229 Y71.095 E.04479
G1 X179.229 Y69.95 E.03797
G1 X178.745 Y69.95 E.01605
G1 X179.636 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F3265
G1 X180.043 Y71.991 E.01351
G1 X180.043 Y70.011 E.06568
G1 X179.636 Y70.015 E.01351
G1 X179.636 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X179.636 Y70.015 E-.72794
G1 X179.721 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/125
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
G3 Z10 I-1.172 J-.326 P1  F30000
G1 X148.102 Y183.602 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3232
G1 X180.082 Y183.602 E1.06084
G1 X180.082 Y186.398 E.09274
G1 X148.102 Y186.398 E1.06084
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3232
G1 X180.474 Y183.21 E1.00675
G1 X180.474 Y186.79 E.11
G1 X147.71 Y186.79 E1.00675
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-.975 J-.728 P1  F30000
G1 X149.199 Y183.95 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3232
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
M73 P79 R11
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X178.274 Y183.95 E.14719
G1 X178.861 Y184.537 E.02751
G1 X178.861 Y186.05 E.05019
G1 X178.745 Y186.05 E.00383
G1 X179.268 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F3232
G1 X179.268 Y185.991 E.06555
G1 X179.675 Y185.991 E.01351
G1 X179.675 Y184.011 E.06568
G1 X179.328 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X179.675 Y184.011 E-.13194
G1 X179.675 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I1.172 J-.327 P1  F30000
G1 X148.102 Y72.398 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3232
G1 X148.102 Y69.602 E.09274
G1 X180.082 Y69.602 E1.06084
G1 X180.082 Y72.398 E.09274
G1 X148.162 Y72.398 E1.05885
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3232
G1 X147.71 Y69.21 E.11
G1 X180.474 Y69.21 E1.00675
G1 X180.474 Y72.79 E.11
G1 X147.77 Y72.79 E1.00491
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3232
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X178.274 Y72.05 E.14719
G1 X178.861 Y71.463 E.0275
G1 X178.861 Y69.95 E.05019
G1 X178.745 Y69.95 E.00382
G1 X179.268 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F3232
G1 X179.675 Y71.991 E.01351
G1 X179.675 Y70.011 E.06568
G1 X179.268 Y70.015 E.01351
G1 X179.268 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X179.268 Y70.015 E-.72794
G1 X179.352 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/125
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
G3 Z10.2 I-1.173 J-.323 P1  F30000
G1 X148.102 Y183.602 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3199
G1 X179.714 Y183.602 E1.04862
G1 X179.714 Y186.398 E.09274
G1 X148.102 Y186.398 E1.04862
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3199
G1 X180.106 Y183.21 E.99543
G1 X180.106 Y186.79 E.11
G1 X147.71 Y186.79 E.99543
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I-.975 J-.728 P1  F30000
G1 X149.199 Y183.95 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3199
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X178.274 Y183.95 E.14719
G1 X178.492 Y184.168 E.01022
G1 X178.492 Y185.797 E.05401
G1 X178.899 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F3199
G1 X178.899 Y185.991 E.06555
G1 X179.307 Y185.991 E.01351
G1 X179.307 Y184.011 E.06568
G1 X178.959 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X179.307 Y184.011 E-.13194
G1 X179.307 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I1.173 J-.323 P1  F30000
G1 X148.102 Y72.398 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3199
G1 X148.102 Y69.602 E.09274
G1 X179.714 Y69.602 E1.04862
G1 X179.714 Y72.398 E.09274
G1 X148.162 Y72.398 E1.04663
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3199
G1 X147.71 Y69.21 E.11
G1 X180.106 Y69.21 E.99543
G1 X180.106 Y72.79 E.11
G1 X147.77 Y72.79 E.99359
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3199
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X178.274 Y72.05 E.14719
G1 X178.492 Y71.832 E.01022
G1 X178.492 Y70.203 E.05401
G1 X178.899 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F3199
G1 X179.307 Y71.991 E.01351
G1 X179.307 Y70.011 E.06568
G1 X178.899 Y70.015 E.01351
G1 X178.899 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X178.899 Y70.015 E-.72794
G1 X178.984 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/125
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
G3 Z10.4 I-1.174 J-.319 P1  F30000
G1 X148.102 Y183.602 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3099
M73 P79 R10
G1 X179.345 Y183.602 E1.03639
G1 X179.345 Y186.398 E.09274
G1 X148.102 Y186.398 E1.03639
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3099
G1 X179.737 Y183.21 E.98411
G1 X179.737 Y186.79 E.11
G1 X147.71 Y186.79 E.98411
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I-.975 J-.728 P1  F30000
G1 X149.199 Y183.95 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3099
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X175.466 Y183.95 E.05401
G1 X178.531 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450104
G1 F3099
G1 X178.531 Y185.991 E.06555
G1 X178.938 Y185.991 E.01351
G1 X178.938 Y184.011 E.06568
G1 X178.591 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X178.938 Y184.011 E-.13194
G1 X178.938 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I1.174 J-.32 P1  F30000
G1 X148.102 Y72.398 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3099
G1 X148.102 Y69.602 E.09274
G1 X179.345 Y69.602 E1.03639
G1 X179.345 Y72.398 E.09274
G1 X148.162 Y72.398 E1.0344
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3099
G1 X147.71 Y69.21 E.11
G1 X179.737 Y69.21 E.98411
G1 X179.737 Y72.79 E.11
G1 X147.77 Y72.79 E.98227
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3099
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X175.466 Y72.05 E.05401
G1 X178.531 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450104
G1 F3099
G1 X178.938 Y71.991 E.01351
G1 X178.938 Y70.011 E.06568
G1 X178.531 Y70.015 E.01351
G1 X178.531 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X178.531 Y70.015 E-.72794
G1 X178.615 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/125
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
G3 Z10.6 I-1.175 J-.316 P1  F30000
G1 X148.102 Y183.602 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3074
G1 X178.977 Y183.602 E1.02417
G1 X178.977 Y186.398 E.09274
G1 X148.102 Y186.398 E1.02417
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3074
G1 X179.369 Y183.21 E.97279
G1 X179.369 Y186.79 E.11
G1 X147.71 Y186.79 E.97279
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I-.975 J-.728 P1  F30000
G1 X149.199 Y183.95 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3074
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X175.466 Y183.95 E.05401
G1 X178.163 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F3074
G1 X178.163 Y185.991 E.06555
G1 X178.57 Y185.991 E.01351
G1 X178.57 Y184.011 E.06568
G1 X178.223 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X178.57 Y184.011 E-.13194
G1 X178.57 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I1.175 J-.316 P1  F30000
G1 X148.102 Y72.398 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3074
G1 X148.102 Y69.602 E.09274
G1 X178.977 Y69.602 E1.02417
G1 X178.977 Y72.398 E.09274
G1 X148.162 Y72.398 E1.02218
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3074
G1 X147.71 Y69.21 E.11
G1 X179.369 Y69.21 E.97279
G1 X179.369 Y72.79 E.11
G1 X147.77 Y72.79 E.97095
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3074
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X175.466 Y72.05 E.05401
G1 X178.163 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F3074
G1 X178.57 Y71.991 E.01351
G1 X178.57 Y70.011 E.06568
G1 X178.163 Y70.015 E.01351
G1 X178.163 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X178.163 Y70.015 E-.72794
G1 X178.247 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/125
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
G3 Z10.8 I-1.176 J-.312 P1  F30000
G1 X148.102 Y183.602 Z10.8
G1 Z10.6
M73 P80 R10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3049
G1 X178.608 Y183.602 E1.01195
G1 X178.608 Y186.398 E.09274
G1 X148.102 Y186.398 E1.01195
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3049
G1 X179.001 Y183.21 E.96147
G1 X179.001 Y186.79 E.11
G1 X147.71 Y186.79 E.96147
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I-.975 J-.728 P1  F30000
G1 X149.199 Y183.95 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3049
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X175.466 Y183.95 E.05401
G1 X177.794 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F3049
G1 X177.794 Y185.991 E.06555
G1 X178.201 Y185.991 E.01351
G1 X178.201 Y184.011 E.06568
G1 X177.854 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X178.201 Y184.011 E-.13194
G1 X178.201 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I1.176 J-.313 P1  F30000
G1 X148.102 Y72.398 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3049
G1 X148.102 Y69.602 E.09274
G1 X178.608 Y69.602 E1.01195
G1 X178.608 Y72.398 E.09274
G1 X148.162 Y72.398 E1.00996
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3049
G1 X147.71 Y69.21 E.11
G1 X179.001 Y69.21 E.96147
G1 X179.001 Y72.79 E.11
G1 X147.77 Y72.79 E.95963
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3049
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X175.466 Y72.05 E.05401
G1 X177.794 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F3049
G1 X178.201 Y71.991 E.01351
G1 X178.201 Y70.011 E.06568
G1 X177.794 Y70.015 E.01351
G1 X177.794 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X177.794 Y70.015 E-.72794
G1 X177.879 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/125
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
G3 Z11 I-1.177 J-.309 P1  F30000
G1 X148.102 Y183.602 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3024
G1 X178.24 Y183.602 E.99973
G1 X178.24 Y186.398 E.09274
G1 X148.102 Y186.398 E.99973
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G1 X178.632 Y183.21 E.95015
G1 X178.632 Y186.79 E.11
G1 X147.71 Y186.79 E.95015
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I-.975 J-.728 P1  F30000
G1 X149.199 Y183.95 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3024
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X175.466 Y183.95 E.05401
G1 X177.426 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F3024
G1 X177.426 Y185.991 E.06555
G1 X177.833 Y185.991 E.01351
G1 X177.833 Y184.011 E.06568
G1 X177.486 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X177.833 Y184.011 E-.13194
G1 X177.833 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I1.177 J-.309 P1  F30000
G1 X148.102 Y72.398 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3024
G1 X148.102 Y69.602 E.09274
G1 X178.24 Y69.602 E.99973
G1 X178.24 Y72.398 E.09274
G1 X148.162 Y72.398 E.99774
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3024
G1 X147.71 Y69.21 E.11
G1 X178.632 Y69.21 E.95015
G1 X178.632 Y72.79 E.11
G1 X147.77 Y72.79 E.94831
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3024
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X175.466 Y72.05 E.05401
G1 X177.426 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F3024
G1 X177.833 Y71.991 E.01351
G1 X177.833 Y70.011 E.06568
G1 X177.426 Y70.015 E.01351
G1 X177.426 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X177.426 Y70.015 E-.72794
G1 X177.51 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/125
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
G3 Z11.2 I-1.178 J-.305 P1  F30000
G1 X148.102 Y183.602 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2999
G1 X177.872 Y183.602 E.98751
G1 X177.872 Y186.398 E.09274
G1 X148.102 Y186.398 E.98751
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2999
G1 X178.264 Y183.21 E.93883
G1 X178.264 Y186.79 E.11
G1 X147.71 Y186.79 E.93883
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-.975 J-.728 P1  F30000
G1 X149.199 Y183.95 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2999
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X175.466 Y183.95 E.05401
G1 X177.057 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2999
G1 X177.057 Y185.991 E.06555
G1 X177.464 Y185.991 E.01351
G1 X177.464 Y184.011 E.06568
G1 X177.117 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X177.464 Y184.011 E-.13194
G1 X177.464 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I1.178 J-.305 P1  F30000
G1 X148.102 Y72.398 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2999
G1 X148.102 Y69.602 E.09274
G1 X177.872 Y69.602 E.98751
G1 X177.872 Y72.398 E.09274
G1 X148.162 Y72.398 E.98552
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2999
G1 X147.71 Y69.21 E.11
G1 X178.264 Y69.21 E.93883
G1 X178.264 Y72.79 E.11
G1 X147.77 Y72.79 E.93699
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2999
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X175.466 Y72.05 E.05401
G1 X177.057 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2999
G1 X177.464 Y71.991 E.01351
G1 X177.464 Y70.011 E.06568
G1 X177.057 Y70.015 E.01351
G1 X177.057 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X177.057 Y70.015 E-.72794
G1 X177.142 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/125
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
G3 Z11.4 I-1.179 J-.301 P1  F30000
G1 X148.102 Y183.602 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2974
G1 X177.503 Y183.602 E.97529
G1 X177.503 Y186.398 E.09274
G1 X148.102 Y186.398 E.97529
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2974
G1 X177.895 Y183.21 E.92751
G1 X177.895 Y186.79 E.11
G1 X147.71 Y186.79 E.92751
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I-.975 J-.728 P1  F30000
G1 X149.199 Y183.95 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2974
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X175.466 Y183.95 E.05401
G1 X176.689 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2974
G1 X176.689 Y185.991 E.06555
G1 X177.096 Y185.991 E.01351
G1 X177.096 Y184.011 E.06568
G1 X176.749 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X177.096 Y184.011 E-.13194
G1 X177.096 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I1.179 J-.302 P1  F30000
G1 X148.102 Y72.398 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2974
G1 X148.102 Y69.602 E.09274
G1 X177.503 Y69.602 E.97529
G1 X177.503 Y72.398 E.09274
G1 X148.162 Y72.398 E.9733
M73 P81 R10
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2974
G1 X147.71 Y69.21 E.11
G1 X177.895 Y69.21 E.92751
G1 X177.895 Y72.79 E.11
G1 X147.77 Y72.79 E.92567
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2974
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X175.466 Y72.05 E.05401
G1 X176.689 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450104
G1 F2974
G1 X177.096 Y71.991 E.01351
G1 X177.096 Y70.011 E.06568
G1 X176.689 Y70.015 E.01351
G1 X176.689 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X176.689 Y70.015 E-.72794
G1 X176.773 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/125
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
G3 Z11.6 I-1.18 J-.298 P1  F30000
G1 X148.102 Y183.602 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2949
G1 X177.135 Y183.602 E.96307
G1 X177.135 Y186.398 E.09274
G1 X148.102 Y186.398 E.96307
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2949
G1 X177.527 Y183.21 E.91619
G1 X177.527 Y186.79 E.11
G1 X147.71 Y186.79 E.91619
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I-.975 J-.728 P1  F30000
G1 X149.199 Y183.95 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2949
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X175.466 Y183.95 E.05401
G1 X176.32 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2949
G1 X176.32 Y185.991 E.06555
G1 X176.728 Y185.991 E.01351
G1 X176.728 Y184.011 E.06568
G1 X176.38 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X176.728 Y184.011 E-.13194
G1 X176.728 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I1.18 J-.298 P1  F30000
G1 X148.102 Y72.398 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2949
G1 X148.102 Y69.602 E.09274
G1 X177.135 Y69.602 E.96307
G1 X177.135 Y72.398 E.09274
G1 X148.162 Y72.398 E.96108
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2949
G1 X147.71 Y69.21 E.11
G1 X177.527 Y69.21 E.91619
G1 X177.527 Y72.79 E.11
G1 X147.77 Y72.79 E.91434
M204 S10000
; WIPE_START
G1 F24000
M73 P81 R9
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2949
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X175.466 Y72.05 E.05401
G1 X176.32 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450104
G1 F2949
G1 X176.728 Y71.991 E.01351
G1 X176.728 Y70.011 E.06568
G1 X176.32 Y70.015 E.01351
G1 X176.32 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X176.32 Y70.015 E-.72794
G1 X176.405 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/125
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
G3 Z11.8 I-1.181 J-.294 P1  F30000
G1 X148.102 Y183.602 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2924
G1 X176.766 Y183.602 E.95085
G1 X176.766 Y186.398 E.09274
G1 X148.102 Y186.398 E.95085
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2924
G1 X177.158 Y183.21 E.90487
G1 X177.158 Y186.79 E.11
G1 X147.71 Y186.79 E.90487
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I-.975 J-.728 P1  F30000
G1 X149.199 Y183.95 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2924
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X175.466 Y183.95 E.05401
G1 X175.952 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2924
G1 X175.952 Y185.991 E.06555
G1 X176.359 Y185.991 E.01351
G1 X176.359 Y184.011 E.06568
G1 X176.012 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X176.359 Y184.011 E-.13194
G1 X176.359 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I1.181 J-.295 P1  F30000
G1 X148.102 Y72.398 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2924
G1 X148.102 Y69.602 E.09274
G1 X176.766 Y69.602 E.95085
G1 X176.766 Y72.398 E.09274
G1 X148.162 Y72.398 E.94886
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2924
G1 X147.71 Y69.21 E.11
G1 X177.158 Y69.21 E.90487
G1 X177.158 Y72.79 E.11
G1 X147.77 Y72.79 E.90302
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2924
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X175.466 Y72.05 E.05401
G1 X175.952 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2924
G1 X176.359 Y71.991 E.01351
G1 X176.359 Y70.011 E.06568
G1 X175.952 Y70.015 E.01351
G1 X175.952 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X175.952 Y70.015 E-.72794
G1 X176.036 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/125
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
G3 Z12 I-1.182 J-.291 P1  F30000
G1 X148.102 Y183.602 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2899
G1 X176.398 Y183.602 E.93862
G1 X176.398 Y186.398 E.09274
G1 X148.102 Y186.398 E.93862
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2899
G1 X176.79 Y183.21 E.89355
G1 X176.79 Y186.79 E.11
G1 X147.71 Y186.79 E.89355
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I-.975 J-.728 P1  F30000
G1 X149.199 Y183.95 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2899
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X175.176 Y183.95 E.04443
G1 X175.176 Y184.239 E.00959
G1 X175.584 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450106
G1 F2899
G1 X175.584 Y185.991 E.06555
G1 X175.991 Y185.991 E.01351
G1 X175.991 Y184.011 E.06568
G1 X175.644 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X175.991 Y184.011 E-.13194
G1 X175.991 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I1.182 J-.291 P1  F30000
G1 X148.102 Y72.398 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2899
G1 X148.102 Y69.602 E.09274
G1 X176.398 Y69.602 E.93862
G1 X176.398 Y72.398 E.09274
G1 X148.162 Y72.398 E.93663
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2899
G1 X147.71 Y69.21 E.11
G1 X176.79 Y69.21 E.89355
G1 X176.79 Y72.79 E.11
G1 X147.77 Y72.79 E.8917
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2899
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X175.176 Y72.05 E.04443
G1 X175.176 Y71.761 E.00959
G1 X175.584 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450106
G1 F2899
G1 X175.991 Y71.991 E.01351
G1 X175.991 Y70.011 E.06568
G1 X175.584 Y70.015 E.01351
G1 X175.584 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X175.584 Y70.015 E-.72794
G1 X175.668 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/125
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
G3 Z12.2 I-1.183 J-.287 P1  F30000
G1 X148.102 Y183.602 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2875
G1 X176.03 Y183.602 E.9264
G1 X176.03 Y186.398 E.09274
G1 X148.102 Y186.398 E.9264
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2875
G1 X176.422 Y183.21 E.88223
G1 X176.422 Y186.79 E.11
G1 X147.71 Y186.79 E.88223
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
M73 P82 R9
G1 F24000
G1 X149.71 Y183.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I-.975 J-.728 P1  F30000
G1 X149.199 Y183.95 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2875
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X174.808 Y183.95 E.0322
G1 X174.808 Y184.608 E.02181
G1 X175.215 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2875
G1 X175.215 Y185.991 E.06555
G1 X175.622 Y185.991 E.01351
G1 X175.622 Y184.011 E.06568
G1 X175.275 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X175.622 Y184.011 E-.13194
G1 X175.622 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I1.183 J-.287 P1  F30000
G1 X148.102 Y72.398 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2875
G1 X148.102 Y69.602 E.09274
G1 X176.03 Y69.602 E.9264
G1 X176.03 Y72.398 E.09274
G1 X148.162 Y72.398 E.92441
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2875
G1 X147.71 Y69.21 E.11
G1 X176.422 Y69.21 E.88223
G1 X176.422 Y72.79 E.11
G1 X147.77 Y72.79 E.88038
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2875
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X174.808 Y72.05 E.0322
G1 X174.808 Y71.392 E.02181
G1 X175.215 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2875
G1 X175.622 Y71.991 E.01351
G1 X175.622 Y70.011 E.06568
G1 X175.215 Y70.015 E.01351
G1 X175.215 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X175.215 Y70.015 E-.72794
G1 X175.3 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/125
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
G3 Z12.4 I-1.184 J-.283 P1  F30000
G1 X148.102 Y183.602 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2852
G1 X175.661 Y183.602 E.91418
G1 X175.661 Y186.398 E.09274
G1 X148.102 Y186.398 E.91418
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2852
G1 X176.053 Y183.21 E.87091
G1 X176.053 Y186.79 E.11
G1 X147.71 Y186.79 E.87091
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I-.975 J-.728 P1  F30000
G1 X149.199 Y183.95 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2852
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X174.44 Y183.95 E.01998
G1 X174.44 Y184.976 E.03403
G1 X174.847 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450104
G1 F2852
G1 X174.847 Y185.991 E.06555
G1 X175.254 Y185.991 E.01351
G1 X175.254 Y184.011 E.06568
G1 X174.907 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X175.254 Y184.011 E-.13194
G1 X175.254 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I1.183 J-.284 P1  F30000
G1 X148.102 Y72.398 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2852
G1 X148.102 Y69.602 E.09274
G1 X175.661 Y69.602 E.91418
G1 X175.661 Y72.398 E.09274
G1 X148.162 Y72.398 E.91219
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2852
G1 X147.71 Y69.21 E.11
G1 X176.053 Y69.21 E.87091
G1 X176.053 Y72.79 E.11
G1 X147.77 Y72.79 E.86906
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2852
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X174.44 Y72.05 E.01998
G1 X174.44 Y71.024 E.03403
G1 X174.847 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450104
G1 F2852
G1 X175.254 Y71.991 E.01351
G1 X175.254 Y70.011 E.06568
G1 X174.847 Y70.015 E.01351
G1 X174.847 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X174.847 Y70.015 E-.72794
G1 X174.931 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/125
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
G3 Z12.6 I-1.184 J-.28 P1  F30000
G1 X148.102 Y183.602 Z12.6
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2828
G1 X175.293 Y183.602 E.90196
G1 X175.293 Y186.398 E.09274
G1 X148.102 Y186.398 E.90196
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2828
G1 X175.685 Y183.21 E.85959
G1 X175.685 Y186.79 E.11
G1 X147.71 Y186.79 E.85959
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I-.975 J-.728 P1  F30000
G1 X149.199 Y183.95 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2828
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.837 Y183.95 E.09848
G1 X174.071 Y183.95 E.00776
G1 X174.071 Y185.345 E.04625
G1 X174.478 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2828
G1 X174.478 Y185.991 E.06555
G1 X174.886 Y185.991 E.01351
G1 X174.886 Y184.011 E.06568
G1 X174.538 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X174.886 Y184.011 E-.13194
G1 X174.886 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I1.184 J-.28 P1  F30000
G1 X148.102 Y72.398 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2828
G1 X148.102 Y69.602 E.09274
G1 X175.293 Y69.602 E.90196
G1 X175.293 Y72.398 E.09274
G1 X148.162 Y72.398 E.89997
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2828
G1 X147.71 Y69.21 E.11
G1 X175.685 Y69.21 E.85959
G1 X175.685 Y72.79 E.11
G1 X147.77 Y72.79 E.85774
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2828
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.837 Y72.05 E.09848
G1 X174.071 Y72.05 E.00776
G1 X174.071 Y70.655 E.04625
G1 X174.478 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2828
G1 X174.886 Y71.991 E.01351
G1 X174.886 Y70.011 E.06568
G1 X174.478 Y70.015 E.01351
G1 X174.478 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X174.478 Y70.015 E-.72794
G1 X174.563 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/125
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
G3 Z12.8 I-1.185 J-.276 P1  F30000
G1 X148.102 Y183.602 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2801
G1 X174.924 Y183.602 E.88974
G1 X174.924 Y186.398 E.09274
G1 X148.102 Y186.398 E.88974
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2801
G1 X175.316 Y183.21 E.84827
G1 X175.316 Y186.79 E.11
G1 X147.71 Y186.79 E.84827
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I-.975 J-.728 P1  F30000
G1 X149.199 Y183.95 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2801
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.703 Y184.085 E.09218
G1 X173.703 Y183.95 E.00446
G1 X172.209 Y183.95 E.04956
G1 X174.11 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2801
G1 X174.11 Y185.991 E.06555
G1 X174.517 Y185.991 E.01351
G1 X174.517 Y184.011 E.06568
G1 X174.17 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X174.517 Y184.011 E-.13194
G1 X174.517 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I1.185 J-.276 P1  F30000
G1 X148.102 Y72.398 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2801
G1 X148.102 Y69.602 E.09274
G1 X174.924 Y69.602 E.88974
G1 X174.924 Y72.398 E.09274
G1 X148.162 Y72.398 E.88775
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2801
G1 X147.71 Y69.21 E.11
G1 X175.316 Y69.21 E.84827
G1 X175.316 Y72.79 E.11
G1 X147.77 Y72.79 E.84642
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2801
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
M73 P83 R9
G1 X171.738 Y69.95 E.03184
G1 X173.703 Y71.915 E.09218
G1 X173.703 Y72.05 E.00446
G1 X172.209 Y72.05 E.04956
G1 X174.11 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2801
G1 X174.517 Y71.991 E.01351
G1 X174.517 Y70.011 E.06568
G1 X174.11 Y70.015 E.01351
G1 X174.11 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X174.11 Y70.015 E-.72794
G1 X174.194 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/125
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
G3 Z13 I-1.186 J-.272 P1  F30000
G1 X148.102 Y183.602 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2768
G1 X174.556 Y183.602 E.87752
G1 X174.556 Y186.398 E.09274
G1 X148.102 Y186.398 E.87752
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2768
G1 X174.948 Y183.21 E.83694
G1 X174.948 Y186.79 E.11
G1 X147.71 Y186.79 E.83694
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-.975 J-.728 P1  F30000
G1 X149.199 Y183.95 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2768
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X173.334 Y184.453 E.07489
G1 X173.334 Y183.95 E.01668
G1 X172.209 Y183.95 E.03733
G1 X173.742 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2768
G1 X173.742 Y185.991 E.06555
G1 X174.149 Y185.991 E.01351
G1 X174.149 Y184.011 E.06568
G1 X173.801 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X174.149 Y184.011 E-.13194
G1 X174.149 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I1.186 J-.273 P1  F30000
G1 X148.102 Y72.398 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2768
G1 X148.102 Y69.602 E.09274
G1 X174.556 Y69.602 E.87752
G1 X174.556 Y72.398 E.09274
M73 P83 R8
G1 X148.162 Y72.398 E.87553
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2768
G1 X147.71 Y69.21 E.11
G1 X174.948 Y69.21 E.83694
G1 X174.948 Y72.79 E.11
G1 X147.77 Y72.79 E.8351
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2768
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X173.334 Y71.547 E.07489
G1 X173.334 Y72.05 E.01668
G1 X172.209 Y72.05 E.03733
G1 X173.742 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450106
G1 F2768
G1 X174.149 Y71.991 E.01351
G1 X174.149 Y70.011 E.06568
G1 X173.742 Y70.015 E.01351
G1 X173.742 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X173.742 Y70.015 E-.72794
G1 X173.826 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/125
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
G3 Z13.2 I-1.187 J-.269 P1  F30000
G1 X148.102 Y183.602 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2734
G1 X174.187 Y183.602 E.8653
G1 X174.187 Y186.398 E.09274
G1 X148.102 Y186.398 E.8653
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2734
G1 X174.579 Y183.21 E.82562
G1 X174.579 Y186.79 E.11
G1 X147.71 Y186.79 E.82562
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.266 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-.975 J-.728 P1  F30000
G1 X149.199 Y183.95 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2734
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.698 Y186.05 E.09848
G1 X171.738 Y186.05 E.03184
G1 X172.966 Y184.822 E.05761
G1 X172.966 Y183.95 E.0289
G1 X172.209 Y183.95 E.02511
G1 X173.373 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2734
G1 X173.373 Y185.991 E.06555
G1 X173.78 Y185.991 E.01351
G1 X173.78 Y184.011 E.06568
G1 X173.433 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X173.78 Y184.011 E-.13194
G1 X173.78 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I1.187 J-.269 P1  F30000
G1 X148.102 Y72.398 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2734
G1 X148.102 Y69.602 E.09274
G1 X174.187 Y69.602 E.8653
G1 X174.187 Y72.398 E.09274
G1 X148.162 Y72.398 E.86331
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2734
G1 X147.71 Y69.21 E.11
G1 X174.579 Y69.21 E.82562
G1 X174.579 Y72.79 E.11
G1 X147.77 Y72.79 E.82378
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2734
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.698 Y69.95 E.09848
G1 X171.738 Y69.95 E.03184
G1 X172.966 Y71.178 E.05761
G1 X172.966 Y72.05 E.0289
G1 X172.209 Y72.05 E.02511
G1 X173.373 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2734
G1 X173.78 Y71.991 E.01351
G1 X173.78 Y70.011 E.06568
G1 X173.373 Y70.015 E.01351
G1 X173.373 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X173.373 Y70.015 E-.72794
G1 X173.457 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/125
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
G3 Z13.4 I-1.188 J-.265 P1  F30000
G1 X148.102 Y183.602 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2700
G1 X173.819 Y183.602 E.85308
G1 X173.819 Y186.398 E.09274
G1 X148.102 Y186.398 E.85308
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2700
G1 X174.211 Y183.21 E.8143
G1 X174.211 Y186.79 E.11
G1 X147.71 Y186.79 E.8143
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.265 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-.975 J-.728 P1  F30000
G1 X149.199 Y183.95 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2700
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.598 Y185.949 E.09378
G1 X172.598 Y185.19 E.02519
G1 X171.738 Y186.05 E.04033
G1 X170.11 Y186.05 E.05401
G1 X173.005 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450104
G1 F2700
G1 X173.005 Y185.991 E.06555
G1 X173.412 Y185.991 E.01351
G1 X173.412 Y184.011 E.06568
G1 X173.065 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X173.412 Y184.011 E-.13194
G1 X173.412 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I1.188 J-.265 P1  F30000
G1 X148.102 Y72.398 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2700
G1 X148.102 Y69.602 E.09274
G1 X173.819 Y69.602 E.85308
G1 X173.819 Y72.398 E.09274
G1 X148.162 Y72.398 E.85109
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2700
G1 X147.71 Y69.21 E.11
G1 X174.211 Y69.21 E.8143
G1 X174.211 Y72.79 E.11
G1 X147.77 Y72.79 E.81246
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2700
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.598 Y70.051 E.09378
G1 X172.598 Y70.81 E.02519
G1 X171.738 Y69.95 E.04033
G1 X170.11 Y69.95 E.05401
G1 X173.005 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2700
G1 X173.412 Y71.991 E.01351
G1 X173.412 Y70.011 E.06568
G1 X173.005 Y70.015 E.01351
G1 X173.005 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X173.005 Y70.015 E-.72794
G1 X173.089 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/125
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
G3 Z13.6 I-1.189 J-.261 P1  F30000
G1 X148.102 Y183.602 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2645
G1 X173.451 Y183.602 E.84086
G1 X173.451 Y186.398 E.09274
G1 X148.102 Y186.398 E.84086
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2645
G1 X173.843 Y183.21 E.80298
G1 X173.843 Y186.79 E.11
G1 X147.71 Y186.79 E.80298
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.265 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-.975 J-.728 P1  F30000
G1 X149.199 Y183.95 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2645
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X172.229 Y185.558 E.07597
G1 X171.738 Y186.05 E.02304
G1 X170.11 Y186.05 E.05401
G1 X172.636 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2645
G1 X172.636 Y185.991 E.06555
G1 X173.043 Y185.991 E.01351
G1 X173.043 Y184.011 E.06568
G1 X172.696 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X173.043 Y184.011 E-.13194
G1 X173.043 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I1.188 J-.262 P1  F30000
G1 X148.102 Y72.398 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2645
G1 X148.102 Y69.602 E.09274
G1 X173.451 Y69.602 E.84086
G1 X173.451 Y72.398 E.09274
G1 X148.162 Y72.398 E.83887
M73 P84 R8
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2645
G1 X147.71 Y69.21 E.11
G1 X173.843 Y69.21 E.80298
G1 X173.843 Y72.79 E.11
G1 X147.77 Y72.79 E.80114
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2645
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X172.229 Y70.442 E.07597
G1 X171.738 Y69.95 E.02304
G1 X170.11 Y69.95 E.05401
G1 X172.636 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2645
G1 X173.043 Y71.991 E.01351
G1 X173.043 Y70.011 E.06568
G1 X172.636 Y70.015 E.01351
G1 X172.636 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X172.636 Y70.015 E-.72794
G1 X172.721 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/125
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
G3 Z13.8 I-1.189 J-.258 P1  F30000
G1 X148.102 Y183.602 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2615
G1 X173.082 Y183.602 E.82863
G1 X173.082 Y186.398 E.09274
G1 X148.102 Y186.398 E.82863
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2615
G1 X173.474 Y183.21 E.79166
G1 X173.474 Y186.79 E.11
G1 X147.71 Y186.79 E.79166
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.265 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-.975 J-.728 P1  F30000
G1 X149.199 Y183.95 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2615
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X171.861 Y185.213 E.05922
G1 X171.861 Y185.927 E.02369
G1 X171.738 Y186.05 E.00576
G1 X170.11 Y186.05 E.05401
G1 X172.268 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450106
G1 F2615
G1 X172.268 Y185.991 E.06555
G1 X172.675 Y185.991 E.01351
G1 X172.675 Y184.011 E.06568
G1 X172.328 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X172.675 Y184.011 E-.13194
G1 X172.675 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I1.189 J-.258 P1  F30000
G1 X148.102 Y72.398 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2615
G1 X148.102 Y69.602 E.09274
G1 X173.082 Y69.602 E.82863
G1 X173.082 Y72.398 E.09274
G1 X148.162 Y72.398 E.82664
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2615
G1 X147.71 Y69.21 E.11
G1 X173.474 Y69.21 E.79166
G1 X173.474 Y72.79 E.11
G1 X147.77 Y72.79 E.78982
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2615
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X171.861 Y70.787 E.05922
G1 X171.861 Y70.073 E.02369
G1 X171.738 Y69.95 E.00576
G1 X170.11 Y69.95 E.05401
G1 X172.268 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2615
G1 X172.675 Y71.991 E.01351
G1 X172.675 Y70.011 E.06568
G1 X172.268 Y70.015 E.01351
G1 X172.268 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X172.268 Y70.015 E-.72794
G1 X172.352 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/125
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
G3 Z14 I-1.19 J-.254 P1  F30000
G1 X148.102 Y183.602 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2566
G1 X172.714 Y183.602 E.81641
G1 X172.714 Y186.398 E.09274
G1 X148.102 Y186.398 E.81641
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2566
G1 X173.106 Y183.21 E.78034
G1 X173.106 Y186.79 E.11
G1 X147.71 Y186.79 E.78034
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.265 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-.975 J-.728 P1  F30000
G1 X149.199 Y183.95 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2566
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X171.492 Y184.844 E.04193
G1 X171.492 Y186.05 E.03999
G1 X171.069 Y186.05 E.01403
G1 X171.899 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2566
G1 X171.899 Y185.991 E.06555
G1 X172.307 Y185.991 E.01351
G1 X172.307 Y184.011 E.06568
G1 X171.959 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X172.307 Y184.011 E-.13194
G1 X172.307 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I1.19 J-.254 P1  F30000
G1 X148.102 Y72.398 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2566
G1 X148.102 Y69.602 E.09274
G1 X172.714 Y69.602 E.81641
G1 X172.714 Y72.398 E.09274
G1 X148.162 Y72.398 E.81442
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2566
G1 X147.71 Y69.21 E.11
G1 X173.106 Y69.21 E.78034
G1 X173.106 Y72.79 E.11
G1 X147.77 Y72.79 E.7785
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2566
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X171.492 Y71.156 E.04193
G1 X171.492 Y69.95 E.03999
G1 X171.069 Y69.95 E.01403
G1 X171.899 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2566
G1 X172.307 Y71.991 E.01351
G1 X172.307 Y70.011 E.06568
G1 X171.899 Y70.015 E.01351
G1 X171.899 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X171.899 Y70.015 E-.72794
G1 X171.984 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/125
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
G3 Z14.2 I-1.191 J-.25 P1  F30000
G1 X148.102 Y183.602 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2533
G1 X172.345 Y183.602 E.80419
G1 X172.345 Y186.398 E.09274
G1 X148.102 Y186.398 E.80419
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2533
G1 X172.737 Y183.21 E.76902
G1 X172.737 Y186.79 E.11
G1 X147.71 Y186.79 E.76902
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.265 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-.975 J-.728 P1  F30000
G1 X149.199 Y183.95 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2533
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X171.124 Y184.476 E.02465
G1 X171.124 Y186.05 E.05221
G1 X171.069 Y186.05 E.00181
G1 X171.531 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2533
G1 X171.531 Y185.991 E.06555
G1 X171.938 Y185.991 E.01351
G1 X171.938 Y184.011 E.06568
G1 X171.591 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X171.938 Y184.011 E-.13194
G1 X171.938 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I1.191 J-.251 P1  F30000
G1 X148.102 Y72.398 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2533
G1 X148.102 Y69.602 E.09274
G1 X172.345 Y69.602 E.80419
G1 X172.345 Y72.398 E.09274
G1 X148.162 Y72.398 E.8022
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2533
G1 X147.71 Y69.21 E.11
G1 X172.737 Y69.21 E.76902
G1 X172.737 Y72.79 E.11
G1 X147.77 Y72.79 E.76718
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2533
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X171.124 Y71.524 E.02465
G1 X171.124 Y69.95 E.05221
G1 X171.069 Y69.95 E.00181
G1 X171.531 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2533
G1 X171.938 Y71.991 E.01351
G1 X171.938 Y70.011 E.06568
G1 X171.531 Y70.015 E.01351
G1 X171.531 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X171.531 Y70.015 E-.72794
G1 X171.615 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/125
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
G3 Z14.4 I-1.192 J-.247 P1  F30000
G1 X148.102 Y183.602 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2500
G1 X171.977 Y183.602 E.79197
G1 X171.977 Y186.398 E.09274
G1 X148.102 Y186.398 E.79197
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2500
G1 X172.369 Y183.21 E.7577
G1 X172.369 Y186.79 E.11
G1 X147.71 Y186.79 E.7577
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
M73 P85 R8
G1 X149.71 Y183.265 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-.975 J-.728 P1  F30000
G1 X149.199 Y183.95 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2500
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X170.598 Y183.95 E.14719
G1 X170.755 Y184.107 E.00737
G1 X170.755 Y185.736 E.05401
G1 X171.163 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450104
G1 F2500
G1 X171.163 Y185.991 E.06555
G1 X171.57 Y185.991 E.01351
G1 X171.57 Y184.011 E.06568
G1 X171.223 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X171.57 Y184.011 E-.13194
G1 X171.57 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I1.192 J-.247 P1  F30000
G1 X148.102 Y72.398 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P85 R7
G1 F2500
G1 X148.102 Y69.602 E.09274
G1 X171.977 Y69.602 E.79197
G1 X171.977 Y72.398 E.09274
G1 X148.162 Y72.398 E.78998
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2500
G1 X147.71 Y69.21 E.11
G1 X172.369 Y69.21 E.7577
G1 X172.369 Y72.79 E.11
G1 X147.77 Y72.79 E.75586
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2500
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X170.598 Y72.05 E.14719
G1 X170.755 Y71.893 E.00737
G1 X170.755 Y70.264 E.05401
G1 X171.163 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450104
G1 F2500
G1 X171.57 Y71.991 E.01351
G1 X171.57 Y70.011 E.06568
G1 X171.163 Y70.015 E.01351
G1 X171.163 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X171.163 Y70.015 E-.72794
G1 X171.247 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/125
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
G3 Z14.6 I-1.192 J-.243 P1  F30000
G1 X148.102 Y183.602 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2401
G1 X171.608 Y183.602 E.77975
G1 X171.608 Y186.398 E.09274
G1 X148.102 Y186.398 E.77975
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2401
G1 X172.001 Y183.21 E.74638
G1 X172.001 Y186.79 E.11
G1 X147.71 Y186.79 E.74638
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.265 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-.975 J-.728 P1  F30000
G1 X149.199 Y183.95 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2401
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X167.79 Y183.95 E.05401
G1 X170.794 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450104
G1 F2401
G1 X170.794 Y185.991 E.06555
G1 X171.201 Y185.991 E.01351
G1 X171.201 Y184.011 E.06568
G1 X170.854 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X171.201 Y184.011 E-.13194
G1 X171.201 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I1.192 J-.243 P1  F30000
G1 X148.102 Y72.398 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2401
G1 X148.102 Y69.602 E.09274
G1 X171.608 Y69.602 E.77975
G1 X171.608 Y72.398 E.09274
G1 X148.162 Y72.398 E.77776
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2401
G1 X147.71 Y69.21 E.11
G1 X172.001 Y69.21 E.74638
G1 X172.001 Y72.79 E.11
G1 X147.77 Y72.79 E.74454
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2401
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X167.79 Y72.05 E.05401
G1 X170.794 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450104
G1 F2401
G1 X171.201 Y71.991 E.01351
G1 X171.201 Y70.011 E.06568
G1 X170.794 Y70.015 E.01351
G1 X170.794 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X170.794 Y70.015 E-.72794
G1 X170.879 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/125
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
G3 Z14.8 I-1.193 J-.239 P1  F30000
G1 X148.102 Y183.602 Z14.8
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2376
G1 X171.24 Y183.602 E.76753
G1 X171.24 Y186.398 E.09274
G1 X148.102 Y186.398 E.76753
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2376
G1 X171.632 Y183.21 E.73506
G1 X171.632 Y186.79 E.11
G1 X147.71 Y186.79 E.73506
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.265 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-.976 J-.728 P1  F30000
G1 X149.199 Y183.95 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2376
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X167.79 Y183.95 E.05401
G1 X170.426 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2376
G1 X170.426 Y185.991 E.06555
G1 X170.833 Y185.991 E.01351
G1 X170.833 Y184.011 E.06568
G1 X170.486 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X170.833 Y184.011 E-.13194
G1 X170.833 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I1.193 J-.239 P1  F30000
G1 X148.102 Y72.398 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2376
G1 X148.102 Y69.602 E.09274
G1 X171.24 Y69.602 E.76753
G1 X171.24 Y72.398 E.09274
G1 X148.162 Y72.398 E.76554
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2376
G1 X147.71 Y69.21 E.11
G1 X171.632 Y69.21 E.73506
G1 X171.632 Y72.79 E.11
G1 X147.77 Y72.79 E.73322
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2376
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X167.79 Y72.05 E.05401
G1 X170.426 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2376
G1 X170.833 Y71.991 E.01351
G1 X170.833 Y70.011 E.06568
G1 X170.426 Y70.015 E.01351
G1 X170.426 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X170.426 Y70.015 E-.72794
G1 X170.51 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/125
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
G3 Z15 I-1.194 J-.236 P1  F30000
G1 X148.102 Y183.602 Z15
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2352
G1 X170.872 Y183.602 E.75531
G1 X170.872 Y186.398 E.09274
G1 X148.102 Y186.398 E.75531
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2352
G1 X171.264 Y183.21 E.72374
G1 X171.264 Y186.79 E.11
G1 X147.71 Y186.79 E.72374
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.265 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-.976 J-.728 P1  F30000
G1 X149.199 Y183.95 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2352
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X167.79 Y183.95 E.05401
G1 X170.057 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2352
G1 X170.057 Y185.991 E.06555
G1 X170.464 Y185.991 E.01351
G1 X170.464 Y184.011 E.06568
G1 X170.117 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X170.464 Y184.011 E-.13194
G1 X170.464 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I1.194 J-.236 P1  F30000
G1 X148.102 Y72.398 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2352
G1 X148.102 Y69.602 E.09274
G1 X170.872 Y69.602 E.75531
G1 X170.872 Y72.398 E.09274
G1 X148.162 Y72.398 E.75332
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2352
G1 X147.71 Y69.21 E.11
G1 X171.264 Y69.21 E.72374
G1 X171.264 Y72.79 E.11
G1 X147.77 Y72.79 E.7219
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2352
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X167.79 Y72.05 E.05401
G1 X170.057 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450106
G1 F2352
M73 P86 R7
G1 X170.464 Y71.991 E.01351
G1 X170.464 Y70.011 E.06568
G1 X170.057 Y70.015 E.01351
G1 X170.057 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X170.057 Y70.015 E-.72794
G1 X170.142 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/125
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
G3 Z15.2 I-1.195 J-.232 P1  F30000
G1 X148.102 Y183.602 Z15.2
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2327
G1 X170.503 Y183.602 E.74309
G1 X170.503 Y186.398 E.09274
G1 X148.102 Y186.398 E.74309
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2327
G1 X170.895 Y183.21 E.71242
G1 X170.895 Y186.79 E.11
G1 X147.71 Y186.79 E.71242
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.265 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-.976 J-.727 P1  F30000
G1 X149.199 Y183.95 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2327
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X167.79 Y183.95 E.05401
G1 X169.689 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2327
G1 X169.689 Y185.991 E.06555
G1 X170.096 Y185.991 E.01351
G1 X170.096 Y184.011 E.06568
G1 X169.749 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X170.096 Y184.011 E-.13194
G1 X170.096 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I1.195 J-.232 P1  F30000
G1 X148.102 Y72.398 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2327
G1 X148.102 Y69.602 E.09274
G1 X170.503 Y69.602 E.74309
G1 X170.503 Y72.398 E.09274
G1 X148.162 Y72.398 E.7411
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2327
G1 X147.71 Y69.21 E.11
G1 X170.895 Y69.21 E.71242
G1 X170.895 Y72.79 E.11
G1 X147.77 Y72.79 E.71057
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2327
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X167.79 Y72.05 E.05401
G1 X169.689 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2327
G1 X170.096 Y71.991 E.01351
G1 X170.096 Y70.011 E.06568
G1 X169.689 Y70.015 E.01351
G1 X169.689 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X169.689 Y70.015 E-.72794
G1 X169.773 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 76/125
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
G3 Z15.4 I-1.195 J-.228 P1  F30000
G1 X148.102 Y183.602 Z15.4
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2302
G1 X170.135 Y183.602 E.73086
G1 X170.135 Y186.398 E.09274
G1 X148.102 Y186.398 E.73086
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2302
G1 X170.527 Y183.21 E.7011
G1 X170.527 Y186.79 E.11
G1 X147.71 Y186.79 E.7011
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.265 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-.976 J-.727 P1  F30000
G1 X149.199 Y183.95 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2302
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X167.79 Y183.95 E.05401
G1 X169.32 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450104
G1 F2302
G1 X169.32 Y185.991 E.06555
G1 X169.728 Y185.991 E.01351
G1 X169.728 Y184.011 E.06568
G1 X169.38 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X169.728 Y184.011 E-.13194
G1 X169.728 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I1.195 J-.228 P1  F30000
G1 X148.102 Y72.398 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2302
G1 X148.102 Y69.602 E.09274
G1 X170.135 Y69.602 E.73086
G1 X170.135 Y72.398 E.09274
G1 X148.162 Y72.398 E.72887
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2302
G1 X147.71 Y69.21 E.11
G1 X170.527 Y69.21 E.7011
G1 X170.527 Y72.79 E.11
G1 X147.77 Y72.79 E.69925
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2302
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X167.79 Y72.05 E.05401
G1 X169.32 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450104
G1 F2302
G1 X169.728 Y71.991 E.01351
G1 X169.728 Y70.011 E.06568
G1 X169.32 Y70.015 E.01351
G1 X169.32 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X169.32 Y70.015 E-.72794
G1 X169.405 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 77/125
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
G3 Z15.6 I-1.196 J-.224 P1  F30000
G1 X148.102 Y183.602 Z15.6
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2277
G1 X169.766 Y183.602 E.71864
G1 X169.766 Y186.398 E.09274
G1 X148.102 Y186.398 E.71864
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2277
G1 X170.158 Y183.21 E.68978
G1 X170.158 Y186.79 E.11
G1 X147.71 Y186.79 E.68978
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.265 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-.976 J-.727 P1  F30000
G1 X149.199 Y183.95 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2277
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X167.79 Y183.95 E.05401
G1 X168.952 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450104
G1 F2277
G1 X168.952 Y185.991 E.06555
G1 X169.359 Y185.991 E.01351
G1 X169.359 Y184.011 E.06568
G1 X169.012 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X169.359 Y184.011 E-.13194
G1 X169.359 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I1.196 J-.224 P1  F30000
G1 X148.102 Y72.398 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2277
G1 X148.102 Y69.602 E.09274
G1 X169.766 Y69.602 E.71864
G1 X169.766 Y72.398 E.09274
G1 X148.162 Y72.398 E.71665
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2277
G1 X147.71 Y69.21 E.11
G1 X170.158 Y69.21 E.68978
G1 X170.158 Y72.79 E.11
G1 X147.77 Y72.79 E.68793
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2277
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X167.79 Y72.05 E.05401
G1 X168.952 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2277
G1 X169.359 Y71.991 E.01351
G1 X169.359 Y70.011 E.06568
G1 X168.952 Y70.015 E.01351
G1 X168.952 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X168.952 Y70.015 E-.72794
G1 X169.036 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 78/125
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
G3 Z15.8 I-1.197 J-.221 P1  F30000
G1 X148.102 Y183.602 Z15.8
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2253
G1 X169.398 Y183.602 E.70642
G1 X169.398 Y186.398 E.09274
G1 X148.102 Y186.398 E.70642
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2253
G1 X169.79 Y183.21 E.67846
G1 X169.79 Y186.79 E.11
G1 X147.71 Y186.79 E.67846
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.265 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-.976 J-.727 P1  F30000
G1 X149.199 Y183.95 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2253
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
M73 P86 R6
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X167.79 Y183.95 E.05401
G1 X168.584 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2253
G1 X168.584 Y185.991 E.06555
G1 X168.991 Y185.991 E.01351
G1 X168.991 Y184.011 E.06568
G1 X168.644 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X168.991 Y184.011 E-.13194
G1 X168.991 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I1.197 J-.221 P1  F30000
G1 X148.102 Y72.398 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2253
G1 X148.102 Y69.602 E.09274
G1 X169.398 Y69.602 E.70642
G1 X169.398 Y72.398 E.09274
G1 X148.162 Y72.398 E.70443
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2253
G1 X147.71 Y69.21 E.11
G1 X169.79 Y69.21 E.67846
M73 P87 R6
G1 X169.79 Y72.79 E.11
G1 X147.77 Y72.79 E.67661
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2253
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X167.79 Y72.05 E.05401
G1 X168.584 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2253
G1 X168.991 Y71.991 E.01351
G1 X168.991 Y70.011 E.06568
G1 X168.584 Y70.015 E.01351
G1 X168.584 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X168.584 Y70.015 E-.72794
G1 X168.668 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 79/125
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
G3 Z16 I-1.197 J-.217 P1  F30000
G1 X148.102 Y183.602 Z16
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2228
G1 X169.03 Y183.602 E.6942
G1 X169.03 Y186.398 E.09274
G1 X148.102 Y186.398 E.6942
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2228
G1 X169.422 Y183.21 E.66714
G1 X169.422 Y186.79 E.11
G1 X147.71 Y186.79 E.66714
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.264 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-.976 J-.727 P1  F30000
G1 X149.199 Y183.95 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2228
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X167.79 Y183.95 E.05401
G1 X168.215 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450104
G1 F2228
G1 X168.215 Y185.991 E.06555
G1 X168.622 Y185.991 E.01351
G1 X168.622 Y184.011 E.06568
G1 X168.275 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X168.622 Y184.011 E-.13194
G1 X168.622 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I1.197 J-.217 P1  F30000
G1 X148.102 Y72.398 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2228
G1 X148.102 Y69.602 E.09274
G1 X169.03 Y69.602 E.6942
G1 X169.03 Y72.398 E.09274
G1 X148.162 Y72.398 E.69221
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2228
G1 X147.71 Y69.21 E.11
G1 X169.422 Y69.21 E.66714
G1 X169.422 Y72.79 E.11
G1 X147.77 Y72.79 E.66529
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2228
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X167.79 Y72.05 E.05401
G1 X168.215 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450104
G1 F2228
G1 X168.622 Y71.991 E.01351
G1 X168.622 Y70.011 E.06568
G1 X168.215 Y70.015 E.01351
G1 X168.215 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X168.215 Y70.015 E-.72794
G1 X168.3 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 80/125
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
G3 Z16.2 I-1.198 J-.213 P1  F30000
G1 X148.102 Y183.602 Z16.2
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2203
G1 X168.661 Y183.602 E.68198
G1 X168.661 Y186.398 E.09274
G1 X148.102 Y186.398 E.68198
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2203
G1 X169.053 Y183.21 E.65582
G1 X169.053 Y186.79 E.11
G1 X147.71 Y186.79 E.65582
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.264 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I-.976 J-.727 P1  F30000
G1 X149.199 Y183.95 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2203
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X167.44 Y183.95 E.04241
G1 X167.44 Y184.3 E.01161
G1 X167.847 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2203
G1 X167.847 Y185.991 E.06555
G1 X168.254 Y185.991 E.01351
G1 X168.254 Y184.011 E.06568
G1 X167.907 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X168.254 Y184.011 E-.13194
G1 X168.254 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I1.198 J-.213 P1  F30000
G1 X148.102 Y72.398 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2203
G1 X148.102 Y69.602 E.09274
G1 X168.661 Y69.602 E.68198
G1 X168.661 Y72.398 E.09274
G1 X148.162 Y72.398 E.67999
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2203
G1 X147.71 Y69.21 E.11
G1 X169.053 Y69.21 E.65582
G1 X169.053 Y72.79 E.11
G1 X147.77 Y72.79 E.65397
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2203
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X167.44 Y72.05 E.04241
G1 X167.44 Y71.7 E.01161
G1 X167.847 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2203
G1 X168.254 Y71.991 E.01351
G1 X168.254 Y70.011 E.06568
G1 X167.847 Y70.015 E.01351
G1 X167.847 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X167.847 Y70.015 E-.72794
G1 X167.931 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 81/125
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
G3 Z16.4 I-1.199 J-.209 P1  F30000
G1 X148.102 Y183.602 Z16.4
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2179
G1 X168.293 Y183.602 E.66976
G1 X168.293 Y186.398 E.09274
G1 X148.102 Y186.398 E.66976
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2179
G1 X168.685 Y183.21 E.6445
G1 X168.685 Y186.79 E.11
G1 X147.71 Y186.79 E.6445
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.264 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I-.976 J-.727 P1  F30000
G1 X149.199 Y183.95 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2179
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X167.071 Y183.95 E.03019
G1 X167.071 Y184.669 E.02383
G1 X167.478 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2179
G1 X167.478 Y185.991 E.06555
G1 X167.886 Y185.991 E.01351
G1 X167.886 Y184.011 E.06568
G1 X167.538 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X167.886 Y184.011 E-.13194
G1 X167.886 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I1.199 J-.209 P1  F30000
G1 X148.102 Y72.398 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2179
G1 X148.102 Y69.602 E.09274
G1 X168.293 Y69.602 E.66976
G1 X168.293 Y72.398 E.09274
G1 X148.162 Y72.398 E.66777
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2179
G1 X147.71 Y69.21 E.11
G1 X168.685 Y69.21 E.6445
G1 X168.685 Y72.79 E.11
G1 X147.77 Y72.79 E.64265
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2179
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X167.071 Y72.05 E.03019
G1 X167.071 Y71.331 E.02383
G1 X167.478 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2179
G1 X167.886 Y71.991 E.01351
G1 X167.886 Y70.011 E.06568
G1 X167.478 Y70.015 E.01351
G1 X167.478 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X167.478 Y70.015 E-.72794
G1 X167.563 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 82/125
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
G3 Z16.6 I-1.199 J-.206 P1  F30000
G1 X148.102 Y183.602 Z16.6
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2155
G1 X167.924 Y183.602 E.65754
G1 X167.924 Y186.398 E.09274
G1 X148.102 Y186.398 E.65754
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2155
G1 X168.316 Y183.21 E.63317
G1 X168.316 Y186.79 E.11
G1 X147.71 Y186.79 E.63317
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.264 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I-.976 J-.727 P1  F30000
M73 P88 R6
G1 X149.199 Y183.95 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2155
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X166.703 Y183.95 E.01796
G1 X166.703 Y185.037 E.03605
G1 X167.11 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450106
G1 F2155
G1 X167.11 Y185.991 E.06555
G1 X167.517 Y185.991 E.01351
G1 X167.517 Y184.011 E.06568
G1 X167.17 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X167.517 Y184.011 E-.13194
G1 X167.517 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I1.199 J-.206 P1  F30000
G1 X148.102 Y72.398 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2155
G1 X148.102 Y69.602 E.09274
G1 X167.924 Y69.602 E.65754
G1 X167.924 Y72.398 E.09274
G1 X148.162 Y72.398 E.65555
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2155
G1 X147.71 Y69.21 E.11
G1 X168.316 Y69.21 E.63317
G1 X168.316 Y72.79 E.11
G1 X147.77 Y72.79 E.63133
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2155
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X166.703 Y72.05 E.01796
G1 X166.703 Y70.963 E.03605
G1 X167.11 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2155
G1 X167.517 Y71.991 E.01351
G1 X167.517 Y70.011 E.06568
G1 X167.11 Y70.015 E.01351
G1 X167.11 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X167.11 Y70.015 E-.72794
G1 X167.194 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 83/125
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
G3 Z16.8 I-1.2 J-.202 P1  F30000
G1 X148.102 Y183.602 Z16.8
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2132
G1 X167.556 Y183.602 E.64532
G1 X167.556 Y186.398 E.09274
G1 X148.102 Y186.398 E.64532
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2132
G1 X167.948 Y183.21 E.62185
G1 X167.948 Y186.79 E.11
G1 X147.71 Y186.79 E.62185
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.264 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I-.976 J-.727 P1  F30000
G1 X149.199 Y183.95 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2132
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X166.161 Y183.95 E.09848
G1 X166.334 Y183.95 E.00574
G1 X166.334 Y185.406 E.04827
G1 X166.742 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2132
G1 X166.742 Y185.991 E.06555
G1 X167.149 Y185.991 E.01351
G1 X167.149 Y184.011 E.06568
G1 X166.801 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X167.149 Y184.011 E-.13194
G1 X167.149 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I1.2 J-.202 P1  F30000
G1 X148.102 Y72.398 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2132
G1 X148.102 Y69.602 E.09274
G1 X167.556 Y69.602 E.64532
G1 X167.556 Y72.398 E.09274
G1 X148.162 Y72.398 E.64333
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2132
G1 X147.71 Y69.21 E.11
G1 X167.948 Y69.21 E.62185
G1 X167.948 Y72.79 E.11
G1 X147.77 Y72.79 E.62001
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2132
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X166.161 Y72.05 E.09848
G1 X166.334 Y72.05 E.00574
G1 X166.334 Y70.594 E.04827
G1 X166.742 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2132
G1 X167.149 Y71.991 E.01351
G1 X167.149 Y70.011 E.06568
G1 X166.742 Y70.015 E.01351
G1 X166.742 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X166.742 Y70.015 E-.72794
G1 X166.826 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 84/125
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
G3 Z17 I-1.201 J-.198 P1  F30000
G1 X148.102 Y183.602 Z17
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2103
G1 X167.187 Y183.602 E.63309
G1 X167.187 Y186.398 E.09274
G1 X148.102 Y186.398 E.63309
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2103
G1 X167.579 Y183.21 E.61053
G1 X167.579 Y186.79 E.11
G1 X147.71 Y186.79 E.61053
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.264 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I-.976 J-.727 P1  F30000
G1 X149.199 Y183.95 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2103
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X165.966 Y184.146 E.08932
G1 X165.966 Y183.95 E.00648
G1 X164.533 Y183.95 E.04754
G1 X166.373 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450103
G1 F2103
G1 X166.373 Y185.991 E.06555
G1 X166.78 Y185.991 E.01351
G1 X166.78 Y184.011 E.06568
G1 X166.433 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X166.78 Y184.011 E-.13194
G1 X166.78 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I1.201 J-.198 P1  F30000
G1 X148.102 Y72.398 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2103
G1 X148.102 Y69.602 E.09274
G1 X167.187 Y69.602 E.63309
G1 X167.187 Y72.398 E.09274
G1 X148.162 Y72.398 E.6311
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2103
G1 X147.71 Y69.21 E.11
G1 X167.579 Y69.21 E.61053
G1 X167.579 Y72.79 E.11
G1 X147.77 Y72.79 E.60869
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2103
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X165.966 Y71.854 E.08932
G1 X165.966 Y72.05 E.00648
G1 X164.533 Y72.05 E.04754
G1 X166.373 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450103
G1 F2103
G1 X166.78 Y71.991 E.01351
G1 X166.78 Y70.011 E.06568
G1 X166.373 Y70.015 E.01351
G1 X166.373 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X166.373 Y70.015 E-.72794
G1 X166.457 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 85/125
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
G3 Z17.2 I-1.201 J-.194 P1  F30000
G1 X148.102 Y183.602 Z17.2
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2070
G1 X166.819 Y183.602 E.62087
G1 X166.819 Y186.398 E.09274
G1 X148.102 Y186.398 E.62087
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2070
G1 X167.211 Y183.21 E.59921
G1 X167.211 Y186.79 E.11
G1 X147.71 Y186.79 E.59921
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.264 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I-.976 J-.727 P1  F30000
M73 P88 R5
G1 X149.199 Y183.95 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2070
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X165.598 Y184.514 E.07204
G1 X165.598 Y183.95 E.0187
G1 X164.533 Y183.95 E.03532
G1 X166.005 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2070
G1 X166.005 Y185.991 E.06555
G1 X166.412 Y185.991 E.01351
G1 X166.412 Y184.011 E.06568
G1 X166.065 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X166.412 Y184.011 E-.13194
G1 X166.412 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I1.201 J-.194 P1  F30000
G1 X148.102 Y72.398 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2070
G1 X148.102 Y69.602 E.09274
G1 X166.819 Y69.602 E.62087
G1 X166.819 Y72.398 E.09274
G1 X148.162 Y72.398 E.61888
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2070
G1 X147.71 Y69.21 E.11
G1 X167.211 Y69.21 E.59921
G1 X167.211 Y72.79 E.11
G1 X147.77 Y72.79 E.59737
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2070
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X165.598 Y71.486 E.07204
G1 X165.598 Y72.05 E.0187
G1 X164.533 Y72.05 E.03531
G1 X166.005 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2070
G1 X166.412 Y71.991 E.01351
G1 X166.412 Y70.011 E.06568
G1 X166.005 Y70.015 E.01351
G1 X166.005 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 17.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X166.005 Y70.015 E-.72794
G1 X166.089 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 86/125
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
G3 Z17.4 I-1.202 J-.19 P1  F30000
G1 X148.102 Y183.602 Z17.4
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2037
G1 X166.451 Y183.602 E.60865
M73 P89 R5
G1 X166.451 Y186.398 E.09274
G1 X148.102 Y186.398 E.60865
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2037
G1 X166.843 Y183.21 E.58789
G1 X166.843 Y186.79 E.11
G1 X147.71 Y186.79 E.58789
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.264 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I-.976 J-.727 P1  F30000
G1 X149.199 Y183.95 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2037
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X165.022 Y186.05 E.09848
G1 X164.062 Y186.05 E.03184
G1 X165.229 Y184.882 E.05475
G1 X165.229 Y183.95 E.03092
G1 X164.533 Y183.95 E.02309
G1 X165.636 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2037
G1 X165.636 Y185.991 E.06555
G1 X166.043 Y185.991 E.01351
G1 X166.043 Y184.011 E.06568
G1 X165.696 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X166.043 Y184.011 E-.13194
G1 X166.043 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I1.202 J-.19 P1  F30000
G1 X148.102 Y72.398 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2037
G1 X148.102 Y69.602 E.09274
G1 X166.451 Y69.602 E.60865
G1 X166.451 Y72.398 E.09274
G1 X148.162 Y72.398 E.60666
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2037
G1 X147.71 Y69.21 E.11
G1 X166.843 Y69.21 E.58789
G1 X166.843 Y72.79 E.11
G1 X147.77 Y72.79 E.58605
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2037
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X165.022 Y69.95 E.09848
G1 X164.062 Y69.95 E.03184
G1 X165.229 Y71.118 E.05475
G1 X165.229 Y72.05 E.03092
G1 X164.533 Y72.05 E.02309
G1 X165.636 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F2037
G1 X166.043 Y71.991 E.01351
G1 X166.043 Y70.011 E.06568
G1 X165.636 Y70.015 E.01351
G1 X165.636 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 17.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X165.636 Y70.015 E-.72794
G1 X165.721 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 87/125
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
G3 Z17.6 I-1.203 J-.187 P1  F30000
G1 X148.102 Y183.602 Z17.6
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1998
G1 X166.082 Y183.602 E.59643
G1 X166.082 Y186.398 E.09274
G1 X148.102 Y186.398 E.59643
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1998
G1 X166.474 Y183.21 E.57657
G1 X166.474 Y186.79 E.11
G1 X147.71 Y186.79 E.57657
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.264 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I-.976 J-.727 P1  F30000
G1 X149.199 Y183.95 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1998
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X164.861 Y185.889 E.09093
G1 X164.861 Y185.251 E.02115
G1 X164.062 Y186.05 E.03747
G1 X162.434 Y186.05 E.05401
G1 X165.268 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1998
G1 X165.268 Y185.991 E.06555
G1 X165.675 Y185.991 E.01351
G1 X165.675 Y184.011 E.06568
G1 X165.328 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X165.675 Y184.011 E-.13194
G1 X165.675 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I1.203 J-.187 P1  F30000
G1 X148.102 Y72.398 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1998
G1 X148.102 Y69.602 E.09274
G1 X166.082 Y69.602 E.59643
G1 X166.082 Y72.398 E.09274
G1 X148.162 Y72.398 E.59444
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1998
G1 X147.71 Y69.21 E.11
G1 X166.474 Y69.21 E.57657
G1 X166.474 Y72.79 E.11
G1 X147.77 Y72.79 E.57473
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1998
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X164.861 Y70.111 E.09093
G1 X164.861 Y70.749 E.02115
G1 X164.062 Y69.95 E.03747
G1 X162.434 Y69.95 E.05401
G1 X165.268 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1998
G1 X165.675 Y71.991 E.01351
G1 X165.675 Y70.011 E.06568
G1 X165.268 Y70.015 E.01351
G1 X165.268 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 17.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X165.268 Y70.015 E-.72794
G1 X165.352 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 88/125
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
G3 Z17.8 I-1.203 J-.183 P1  F30000
G1 X148.102 Y183.602 Z17.8
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1947
G1 X165.714 Y183.602 E.58421
G1 X165.714 Y186.398 E.09274
G1 X148.102 Y186.398 E.58421
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1947
G1 X166.106 Y183.21 E.56525
G1 X166.106 Y186.79 E.11
G1 X147.71 Y186.79 E.56525
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.263 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I-.976 J-.727 P1  F30000
G1 X149.199 Y183.95 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1947
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X164.492 Y185.52 E.07364
G1 X164.492 Y185.619 E.00329
G1 X164.062 Y186.05 E.02019
G1 X162.434 Y186.05 E.05401
G1 X164.899 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1947
G1 X164.899 Y185.991 E.06555
G1 X165.307 Y185.991 E.01351
G1 X165.307 Y184.011 E.06568
G1 X164.959 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X165.307 Y184.011 E-.13194
G1 X165.307 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I1.203 J-.183 P1  F30000
G1 X148.102 Y72.398 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1947
G1 X148.102 Y69.602 E.09274
G1 X165.714 Y69.602 E.58421
G1 X165.714 Y72.398 E.09274
G1 X148.162 Y72.398 E.58222
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1947
G1 X147.71 Y69.21 E.11
G1 X166.106 Y69.21 E.56525
G1 X166.106 Y72.79 E.11
G1 X147.77 Y72.79 E.56341
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1947
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X164.492 Y70.48 E.07364
G1 X164.492 Y70.381 E.00329
G1 X164.062 Y69.95 E.02019
G1 X162.434 Y69.95 E.05401
G1 X164.899 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1947
G1 X165.307 Y71.991 E.01351
G1 X165.307 Y70.011 E.06568
G1 X164.899 Y70.015 E.01351
G1 X164.899 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 17.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X164.899 Y70.015 E-.72794
G1 X164.984 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 89/125
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
G3 Z18 I-1.204 J-.179 P1  F30000
G1 X148.102 Y183.602 Z18
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1902
G1 X165.345 Y183.602 E.57199
G1 X165.345 Y186.398 E.09274
G1 X148.102 Y186.398 E.57199
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1902
G1 X165.737 Y183.21 E.55393
G1 X165.737 Y186.79 E.11
G1 X147.71 Y186.79 E.55393
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.263 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I-.976 J-.726 P1  F30000
G1 X149.199 Y183.95 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1902
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X164.124 Y185.152 E.05636
G1 X164.124 Y186.05 E.02979
G1 X163.393 Y186.05 E.02423
G1 X164.531 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450103
G1 F1902
G1 X164.531 Y185.991 E.06555
G1 X164.938 Y185.991 E.01351
G1 X164.938 Y184.011 E.06568
G1 X164.591 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X164.938 Y184.011 E-.13194
G1 X164.938 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I1.204 J-.179 P1  F30000
G1 X148.102 Y72.398 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1902
G1 X148.102 Y69.602 E.09274
G1 X165.345 Y69.602 E.57199
G1 X165.345 Y72.398 E.09274
G1 X148.162 Y72.398 E.57
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1902
G1 X147.71 Y69.21 E.11
G1 X165.737 Y69.21 E.55393
G1 X165.737 Y72.79 E.11
G1 X147.77 Y72.79 E.55209
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P90 R5
G3 Z18.2 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1902
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X164.124 Y70.848 E.05636
G1 X164.124 Y69.95 E.02979
G1 X163.393 Y69.95 E.02423
G1 X164.531 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450103
G1 F1902
G1 X164.938 Y71.991 E.01351
G1 X164.938 Y70.011 E.06568
G1 X164.531 Y70.015 E.01351
G1 X164.531 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 18
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X164.531 Y70.015 E-.72794
G1 X164.615 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 90/125
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
G3 Z18.2 I-1.204 J-.175 P1  F30000
G1 X148.102 Y183.602 Z18.2
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1868
G1 X164.977 Y183.602 E.55977
G1 X164.977 Y186.398 E.09274
G1 X148.102 Y186.398 E.55977
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1868
G1 X165.369 Y183.21 E.54261
G1 X165.369 Y186.79 E.11
G1 X147.71 Y186.79 E.54261
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.263 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I-.976 J-.726 P1  F30000
G1 X149.199 Y183.95 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1868
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X163.755 Y184.783 E.03908
G1 X163.755 Y186.05 E.04201
G1 X163.393 Y186.05 E.01201
G1 X164.163 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1868
G1 X164.163 Y185.991 E.06555
G1 X164.57 Y185.991 E.01351
G1 X164.57 Y184.011 E.06568
G1 X164.223 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X164.57 Y184.011 E-.13194
G1 X164.57 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I1.204 J-.175 P1  F30000
G1 X148.102 Y72.398 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1868
G1 X148.102 Y69.602 E.09274
G1 X164.977 Y69.602 E.55977
G1 X164.977 Y72.398 E.09274
G1 X148.162 Y72.398 E.55778
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1868
G1 X147.71 Y69.21 E.11
G1 X165.369 Y69.21 E.54261
G1 X165.369 Y72.79 E.11
G1 X147.77 Y72.79 E.54077
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1868
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X163.755 Y71.217 E.03908
G1 X163.755 Y69.95 E.04201
G1 X163.393 Y69.95 E.01201
G1 X164.163 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1868
G1 X164.57 Y71.991 E.01351
G1 X164.57 Y70.011 E.06568
G1 X164.163 Y70.015 E.01351
G1 X164.163 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 18.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X164.163 Y70.015 E-.72794
G1 X164.247 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 91/125
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
G3 Z18.4 I-1.205 J-.171 P1  F30000
G1 X148.102 Y183.602 Z18.4
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1836
G1 X164.608 Y183.602 E.54755
G1 X164.608 Y186.398 E.09274
G1 X148.102 Y186.398 E.54755
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1836
G1 X165.001 Y183.21 E.53129
G1 X165.001 Y186.79 E.11
G1 X147.71 Y186.79 E.53129
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.263 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I-.977 J-.726 P1  F30000
G1 X149.199 Y183.95 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1836
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X162.922 Y183.95 E.14719
G1 X163.387 Y184.415 E.02179
G1 X163.387 Y186.043 E.05401
G1 X163.794 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1836
G1 X163.794 Y185.991 E.06555
G1 X164.201 Y185.991 E.01351
G1 X164.201 Y184.011 E.06568
G1 X163.854 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X164.201 Y184.011 E-.13194
G1 X164.201 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I1.205 J-.171 P1  F30000
G1 X148.102 Y72.398 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1836
G1 X148.102 Y69.602 E.09274
G1 X164.608 Y69.602 E.54755
G1 X164.608 Y72.398 E.09274
G1 X148.162 Y72.398 E.54556
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1836
G1 X147.71 Y69.21 E.11
G1 X165.001 Y69.21 E.53129
G1 X165.001 Y72.79 E.11
G1 X147.77 Y72.79 E.52945
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1836
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X162.922 Y72.05 E.14719
G1 X163.387 Y71.585 E.02179
G1 X163.387 Y69.957 E.05401
G1 X163.794 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450106
G1 F1836
G1 X164.201 Y71.991 E.01351
G1 X164.201 Y70.011 E.06568
G1 X163.794 Y70.015 E.01351
G1 X163.794 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 18.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X163.794 Y70.015 E-.72794
G1 X163.879 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 92/125
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
G3 Z18.6 I-1.205 J-.167 P1  F30000
G1 X148.102 Y183.602 Z18.6
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1730
G1 X164.24 Y183.602 E.53533
G1 X164.24 Y186.398 E.09274
G1 X148.102 Y186.398 E.53533
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1730
G1 X164.632 Y183.21 E.51997
G1 X164.632 Y186.79 E.11
G1 X147.71 Y186.79 E.51997
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.263 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.8 I-.977 J-.726 P1  F30000
G1 X149.199 Y183.95 Z18.8
M73 P90 R4
G1 Z18.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1730
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X160.114 Y183.95 E.05401
G1 X163.426 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1730
G1 X163.426 Y185.991 E.06555
G1 X163.833 Y185.991 E.01351
G1 X163.833 Y184.011 E.06568
G1 X163.486 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X163.833 Y184.011 E-.13194
G1 X163.833 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.8 I1.205 J-.167 P1  F30000
G1 X148.102 Y72.398 Z18.8
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1730
G1 X148.102 Y69.602 E.09274
G1 X164.24 Y69.602 E.53533
G1 X164.24 Y72.398 E.09274
G1 X148.162 Y72.398 E.53334
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1730
G1 X147.71 Y69.21 E.11
G1 X164.632 Y69.21 E.51997
G1 X164.632 Y72.79 E.11
G1 X147.77 Y72.79 E.51813
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.8 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z18.8
G1 Z18.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1730
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X160.114 Y72.05 E.05401
G1 X163.426 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1730
G1 X163.833 Y71.991 E.01351
G1 X163.833 Y70.011 E.06568
G1 X163.426 Y70.015 E.01351
G1 X163.426 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 18.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X163.426 Y70.015 E-.72794
G1 X163.51 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 93/125
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
G3 Z18.8 I-1.206 J-.164 P1  F30000
G1 X148.102 Y183.602 Z18.8
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1705
G1 X163.872 Y183.602 E.5231
G1 X163.872 Y186.398 E.09274
G1 X148.102 Y186.398 E.5231
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1705
G1 X164.264 Y183.21 E.50865
G1 X164.264 Y186.79 E.11
G1 X147.71 Y186.79 E.50865
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.263 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I-.977 J-.726 P1  F30000
G1 X149.199 Y183.95 Z19
G1 Z18.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1705
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X160.114 Y183.95 E.05401
G1 X163.057 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1705
G1 X163.057 Y185.991 E.06555
G1 X163.464 Y185.991 E.01351
G1 X163.464 Y184.011 E.06568
G1 X163.117 Y184.015 E.01152
; WIPE_START
G1 F24000
M73 P91 R4
G1 X163.464 Y184.011 E-.13194
G1 X163.464 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I1.206 J-.164 P1  F30000
G1 X148.102 Y72.398 Z19
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1705
G1 X148.102 Y69.602 E.09274
G1 X163.872 Y69.602 E.5231
G1 X163.872 Y72.398 E.09274
G1 X148.162 Y72.398 E.52111
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1705
G1 X147.71 Y69.21 E.11
G1 X164.264 Y69.21 E.50865
G1 X164.264 Y72.79 E.11
G1 X147.77 Y72.79 E.5068
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z19
G1 Z18.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1705
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X160.114 Y72.05 E.05401
G1 X163.057 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1705
G1 X163.464 Y71.991 E.01351
G1 X163.464 Y70.011 E.06568
G1 X163.057 Y70.015 E.01351
G1 X163.057 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 18.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X163.057 Y70.015 E-.72794
G1 X163.142 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 94/125
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
G3 Z19 I-1.206 J-.16 P1  F30000
G1 X148.102 Y183.602 Z19
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1681
G1 X163.503 Y183.602 E.51088
G1 X163.503 Y186.398 E.09274
G1 X148.102 Y186.398 E.51088
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1681
G1 X163.895 Y183.21 E.49733
G1 X163.895 Y186.79 E.11
G1 X147.71 Y186.79 E.49733
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.263 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I-.977 J-.726 P1  F30000
G1 X149.199 Y183.95 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1681
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X160.114 Y183.95 E.05401
G1 X162.689 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450104
G1 F1681
G1 X162.689 Y185.991 E.06555
G1 X163.096 Y185.991 E.01351
G1 X163.096 Y184.011 E.06568
G1 X162.749 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X163.096 Y184.011 E-.13194
G1 X163.096 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I1.206 J-.16 P1  F30000
G1 X148.102 Y72.398 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1681
G1 X148.102 Y69.602 E.09274
G1 X163.503 Y69.602 E.51088
G1 X163.503 Y72.398 E.09274
G1 X148.162 Y72.398 E.50889
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1681
G1 X147.71 Y69.21 E.11
G1 X163.895 Y69.21 E.49733
G1 X163.895 Y72.79 E.11
G1 X147.77 Y72.79 E.49548
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1681
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X160.114 Y72.05 E.05401
G1 X162.689 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450104
G1 F1681
G1 X163.096 Y71.991 E.01351
G1 X163.096 Y70.011 E.06568
G1 X162.689 Y70.015 E.01351
G1 X162.689 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 19
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X162.689 Y70.015 E-.72794
G1 X162.773 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 95/125
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
G3 Z19.2 I-1.207 J-.156 P1  F30000
G1 X148.102 Y183.602 Z19.2
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1656
G1 X163.135 Y183.602 E.49866
G1 X163.135 Y186.398 E.09274
G1 X148.102 Y186.398 E.49866
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1656
G1 X163.527 Y183.21 E.48601
G1 X163.527 Y186.79 E.11
G1 X147.71 Y186.79 E.48601
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.262 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I-.977 J-.726 P1  F30000
G1 X149.199 Y183.95 Z19.4
G1 Z19
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1656
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X160.114 Y183.95 E.05401
G1 X162.32 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1656
G1 X162.32 Y185.991 E.06555
G1 X162.728 Y185.991 E.01351
G1 X162.728 Y184.011 E.06568
G1 X162.38 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X162.728 Y184.011 E-.13194
G1 X162.728 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I1.207 J-.156 P1  F30000
G1 X148.102 Y72.398 Z19.4
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1656
G1 X148.102 Y69.602 E.09274
G1 X163.135 Y69.602 E.49866
G1 X163.135 Y72.398 E.09274
G1 X148.162 Y72.398 E.49667
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1656
G1 X147.71 Y69.21 E.11
G1 X163.527 Y69.21 E.48601
G1 X163.527 Y72.79 E.11
G1 X147.77 Y72.79 E.48416
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z19.4
G1 Z19
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1656
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X160.114 Y72.05 E.05401
G1 X162.32 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1656
G1 X162.728 Y71.991 E.01351
G1 X162.728 Y70.011 E.06568
G1 X162.32 Y70.015 E.01351
G1 X162.32 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 19.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X162.32 Y70.015 E-.72794
G1 X162.405 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 96/125
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
G3 Z19.4 I-1.207 J-.152 P1  F30000
G1 X148.102 Y183.602 Z19.4
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1631
G1 X162.766 Y183.602 E.48644
G1 X162.766 Y186.398 E.09274
G1 X148.102 Y186.398 E.48644
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1631
G1 X163.158 Y183.21 E.47469
G1 X163.158 Y186.79 E.11
G1 X147.71 Y186.79 E.47469
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.262 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.6 I-.977 J-.726 P1  F30000
G1 X149.199 Y183.95 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1631
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X160.114 Y183.95 E.05401
G1 X161.952 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1631
G1 X161.952 Y185.991 E.06555
G1 X162.359 Y185.991 E.01351
G1 X162.359 Y184.011 E.06568
G1 X162.012 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X162.359 Y184.011 E-.13194
G1 X162.359 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.6 I1.207 J-.152 P1  F30000
G1 X148.102 Y72.398 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1631
G1 X148.102 Y69.602 E.09274
G1 X162.766 Y69.602 E.48644
G1 X162.766 Y72.398 E.09274
G1 X148.162 Y72.398 E.48445
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1631
G1 X147.71 Y69.21 E.11
G1 X163.158 Y69.21 E.47469
G1 X163.158 Y72.79 E.11
G1 X147.77 Y72.79 E.47284
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.6 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1631
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X160.114 Y72.05 E.05401
G1 X161.952 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1631
G1 X162.359 Y71.991 E.01351
G1 X162.359 Y70.011 E.06568
G1 X161.952 Y70.015 E.01351
G1 X161.952 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 19.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X161.952 Y70.015 E-.72794
G1 X162.036 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 97/125
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
G3 Z19.6 I-1.208 J-.148 P1  F30000
G1 X148.102 Y183.602 Z19.6
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1607
G1 X162.398 Y183.602 E.47422
G1 X162.398 Y186.398 E.09274
G1 X148.102 Y186.398 E.47422
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1607
G1 X162.79 Y183.21 E.46337
G1 X162.79 Y186.79 E.11
G1 X147.71 Y186.79 E.46337
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.262 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P92 R4
G3 Z19.8 I-.977 J-.726 P1  F30000
G1 X149.199 Y183.95 Z19.8
G1 Z19.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1607
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X160.114 Y183.95 E.05401
G1 X161.584 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1607
G1 X161.584 Y185.991 E.06555
G1 X161.991 Y185.991 E.01351
G1 X161.991 Y184.011 E.06568
G1 X161.644 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X161.991 Y184.011 E-.13194
G1 X161.991 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.8 I1.208 J-.148 P1  F30000
G1 X148.102 Y72.398 Z19.8
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1607
G1 X148.102 Y69.602 E.09274
G1 X162.398 Y69.602 E.47422
G1 X162.398 Y72.398 E.09274
G1 X148.162 Y72.398 E.47223
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1607
G1 X147.71 Y69.21 E.11
G1 X162.79 Y69.21 E.46337
G1 X162.79 Y72.79 E.11
G1 X147.77 Y72.79 E.46152
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.8 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z19.8
G1 Z19.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1607
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X160.114 Y72.05 E.05401
G1 X161.584 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1607
G1 X161.991 Y71.991 E.01351
G1 X161.991 Y70.011 E.06568
G1 X161.584 Y70.015 E.01351
G1 X161.584 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 19.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X161.584 Y70.015 E-.72794
G1 X161.668 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 98/125
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
G3 Z19.8 I-1.208 J-.144 P1  F30000
G1 X148.102 Y183.602 Z19.8
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1582
G1 X162.03 Y183.602 E.462
G1 X162.03 Y186.398 E.09274
G1 X148.102 Y186.398 E.462
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1582
G1 X162.422 Y183.21 E.45205
G1 X162.422 Y186.79 E.11
G1 X147.71 Y186.79 E.45205
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.262 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20 I-.977 J-.725 P1  F30000
G1 X149.199 Y183.95 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1582
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X160.114 Y183.95 E.05401
G1 X161.215 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1582
G1 X161.215 Y185.991 E.06555
G1 X161.622 Y185.991 E.01351
G1 X161.622 Y184.011 E.06568
G1 X161.275 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X161.622 Y184.011 E-.13194
G1 X161.622 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20 I1.208 J-.144 P1  F30000
G1 X148.102 Y72.398 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1582
G1 X148.102 Y69.602 E.09274
G1 X162.03 Y69.602 E.462
G1 X162.03 Y72.398 E.09274
G1 X148.162 Y72.398 E.46001
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1582
G1 X147.71 Y69.21 E.11
G1 X162.422 Y69.21 E.45205
G1 X162.422 Y72.79 E.11
G1 X147.77 Y72.79 E.4502
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1582
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X160.114 Y72.05 E.05401
G1 X161.215 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1582
G1 X161.622 Y71.991 E.01351
G1 X161.622 Y70.011 E.06568
G1 X161.215 Y70.015 E.01351
G1 X161.215 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 19.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X161.215 Y70.015 E-.72794
G1 X161.3 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 99/125
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
G3 Z20 I-1.209 J-.14 P1  F30000
G1 X148.102 Y183.602 Z20
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1558
G1 X161.661 Y183.602 E.44978
G1 X161.661 Y186.398 E.09274
G1 X148.102 Y186.398 E.44978
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1558
G1 X162.053 Y183.21 E.44073
G1 X162.053 Y186.79 E.11
G1 X147.71 Y186.79 E.44073
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.262 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P92 R3
G3 Z20.2 I-.977 J-.725 P1  F30000
G1 X149.199 Y183.95 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1558
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X160.114 Y183.95 E.05401
G1 X160.847 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450103
G1 F1558
G1 X160.847 Y185.991 E.06555
G1 X161.254 Y185.991 E.01351
G1 X161.254 Y184.011 E.06568
G1 X160.907 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X161.254 Y184.011 E-.13194
G1 X161.254 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.2 I1.209 J-.14 P1  F30000
G1 X148.102 Y72.398 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1558
G1 X148.102 Y69.602 E.09274
G1 X161.661 Y69.602 E.44978
G1 X161.661 Y72.398 E.09274
G1 X148.162 Y72.398 E.44779
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1558
G1 X147.71 Y69.21 E.11
G1 X162.053 Y69.21 E.44073
G1 X162.053 Y72.79 E.11
G1 X147.77 Y72.79 E.43888
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.2 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1558
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X160.114 Y72.05 E.05401
G1 X160.847 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450103
G1 F1558
G1 X161.254 Y71.991 E.01351
G1 X161.254 Y70.011 E.06568
G1 X160.847 Y70.015 E.01351
G1 X160.847 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 20
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X160.847 Y70.015 E-.72794
G1 X160.931 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 100/125
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
G3 Z20.2 I-1.209 J-.137 P1  F30000
G1 X148.102 Y183.602 Z20.2
G1 Z20
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1532
G1 X161.293 Y183.602 E.43756
G1 X161.293 Y186.398 E.09274
G1 X148.102 Y186.398 E.43756
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1532
G1 X161.685 Y183.21 E.4294
G1 X161.685 Y186.79 E.11
G1 X147.71 Y186.79 E.4294
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.261 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.4 I-.977 J-.725 P1  F30000
G1 X149.199 Y183.95 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1532
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X160.071 Y183.95 E.05261
G1 X160.071 Y183.993 E.00141
G1 X160.478 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1532
G1 X160.478 Y185.991 E.06555
G1 X160.886 Y185.991 E.01351
G1 X160.886 Y184.011 E.06568
G1 X160.538 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X160.886 Y184.011 E-.13194
G1 X160.886 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.4 I1.209 J-.136 P1  F30000
G1 X148.102 Y72.398 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1532
G1 X148.102 Y69.602 E.09274
G1 X161.293 Y69.602 E.43756
G1 X161.293 Y72.398 E.09274
G1 X148.162 Y72.398 E.43557
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1532
G1 X147.71 Y69.21 E.11
G1 X161.685 Y69.21 E.4294
G1 X161.685 Y72.79 E.11
G1 X147.77 Y72.79 E.42756
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.4 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1532
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X160.071 Y72.05 E.05261
G1 X160.071 Y72.007 E.00141
G1 X160.478 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1532
G1 X160.886 Y71.991 E.01351
M73 P93 R3
G1 X160.886 Y70.011 E.06568
G1 X160.478 Y70.015 E.01351
G1 X160.478 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 20.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X160.478 Y70.015 E-.72794
G1 X160.563 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 101/125
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
G3 Z20.4 I-1.21 J-.133 P1  F30000
G1 X148.102 Y183.602 Z20.4
G1 Z20.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1508
G1 X160.924 Y183.602 E.42533
G1 X160.924 Y186.398 E.09274
G1 X148.102 Y186.398 E.42533
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1508
G1 X161.316 Y183.21 E.41808
G1 X161.316 Y186.79 E.11
G1 X147.71 Y186.79 E.41808
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.261 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.6 I-.977 J-.725 P1  F30000
G1 X149.199 Y183.95 Z20.6
G1 Z20.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1508
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X159.703 Y183.95 E.04039
G1 X159.703 Y184.361 E.01363
G1 X160.11 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1508
G1 X160.11 Y185.991 E.06555
G1 X160.517 Y185.991 E.01351
G1 X160.517 Y184.011 E.06568
G1 X160.17 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X160.517 Y184.011 E-.13194
G1 X160.517 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.6 I1.21 J-.133 P1  F30000
G1 X148.102 Y72.398 Z20.6
G1 Z20.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1508
G1 X148.102 Y69.602 E.09274
G1 X160.924 Y69.602 E.42533
G1 X160.924 Y72.398 E.09274
G1 X148.162 Y72.398 E.42334
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1508
G1 X147.71 Y69.21 E.11
G1 X161.316 Y69.21 E.41808
G1 X161.316 Y72.79 E.11
G1 X147.77 Y72.79 E.41624
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.6 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z20.6
G1 Z20.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1508
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X159.703 Y72.05 E.04039
G1 X159.703 Y71.639 E.01363
G1 X160.11 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1508
G1 X160.517 Y71.991 E.01351
G1 X160.517 Y70.011 E.06568
G1 X160.11 Y70.015 E.01351
G1 X160.11 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 20.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X160.11 Y70.015 E-.72794
G1 X160.194 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 102/125
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
G3 Z20.6 I-1.21 J-.129 P1  F30000
G1 X148.102 Y183.602 Z20.6
G1 Z20.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1485
G1 X160.556 Y183.602 E.41311
G1 X160.556 Y186.398 E.09274
G1 X148.102 Y186.398 E.41311
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1485
G1 X160.948 Y183.21 E.40676
G1 X160.948 Y186.79 E.11
G1 X147.71 Y186.79 E.40676
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.261 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.8 I-.978 J-.725 P1  F30000
G1 X149.199 Y183.95 Z20.8
G1 Z20.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1485
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X159.334 Y183.95 E.02817
G1 X159.334 Y184.73 E.02585
G1 X159.742 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1485
G1 X159.742 Y185.991 E.06555
G1 X160.149 Y185.991 E.01351
G1 X160.149 Y184.011 E.06568
G1 X159.801 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X160.149 Y184.011 E-.13194
G1 X160.149 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.8 I1.21 J-.129 P1  F30000
G1 X148.102 Y72.398 Z20.8
G1 Z20.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1485
G1 X148.102 Y69.602 E.09274
G1 X160.556 Y69.602 E.41311
G1 X160.556 Y72.398 E.09274
G1 X148.162 Y72.398 E.41112
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1485
G1 X147.71 Y69.21 E.11
G1 X160.948 Y69.21 E.40676
G1 X160.948 Y72.79 E.11
G1 X147.77 Y72.79 E.40492
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.8 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z20.8
G1 Z20.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1485
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X159.334 Y72.05 E.02817
G1 X159.334 Y71.27 E.02585
G1 X159.742 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450106
G1 F1485
G1 X160.149 Y71.991 E.01351
G1 X160.149 Y70.011 E.06568
G1 X159.742 Y70.015 E.01351
G1 X159.742 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 20.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X159.742 Y70.015 E-.72794
G1 X159.826 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 103/125
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
G3 Z20.8 I-1.211 J-.125 P1  F30000
G1 X148.102 Y183.602 Z20.8
G1 Z20.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1461
G1 X160.187 Y183.602 E.40089
G1 X160.187 Y186.398 E.09274
G1 X148.102 Y186.398 E.40089
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1461
G1 X160.579 Y183.21 E.39544
G1 X160.579 Y186.79 E.11
G1 X147.71 Y186.79 E.39544
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.261 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21 I-.978 J-.725 P1  F30000
G1 X149.199 Y183.95 Z21
G1 Z20.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1461
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X158.966 Y183.95 E.01594
G1 X158.966 Y185.098 E.03807
G1 X159.373 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1461
G1 X159.373 Y185.991 E.06555
G1 X159.78 Y185.991 E.01351
G1 X159.78 Y184.011 E.06568
G1 X159.433 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X159.78 Y184.011 E-.13194
G1 X159.78 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21 I1.211 J-.125 P1  F30000
G1 X148.102 Y72.398 Z21
G1 Z20.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1461
G1 X148.102 Y69.602 E.09274
G1 X160.187 Y69.602 E.40089
G1 X160.187 Y72.398 E.09274
G1 X148.162 Y72.398 E.3989
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1461
G1 X147.71 Y69.21 E.11
G1 X160.579 Y69.21 E.39544
G1 X160.579 Y72.79 E.11
G1 X147.77 Y72.79 E.3936
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z21
G1 Z20.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1461
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X158.966 Y72.05 E.01594
G1 X158.966 Y70.902 E.03807
G1 X159.373 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1461
G1 X159.78 Y71.991 E.01351
G1 X159.78 Y70.011 E.06568
G1 X159.373 Y70.015 E.01351
G1 X159.373 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 20.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X159.373 Y70.015 E-.72794
G1 X159.457 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 104/125
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
G3 Z21 I-1.211 J-.121 P1  F30000
G1 X148.102 Y183.602 Z21
G1 Z20.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1437
G1 X159.819 Y183.602 E.38867
G1 X159.819 Y186.398 E.09274
G1 X148.102 Y186.398 E.38867
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1437
G1 X160.211 Y183.21 E.38412
G1 X160.211 Y186.79 E.11
G1 X147.71 Y186.79 E.38412
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.26 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.2 I-.978 J-.724 P1  F30000
G1 X149.199 Y183.95 Z21.2
G1 Z20.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1437
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.485 Y183.95 E.09848
G1 X158.598 Y183.95 E.00372
G1 X158.598 Y185.466 E.05029
G1 X159.005 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450103
G1 F1437
G1 X159.005 Y185.991 E.06555
G1 X159.412 Y185.991 E.01351
G1 X159.412 Y184.011 E.06568
G1 X159.065 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X159.412 Y184.011 E-.13194
G1 X159.412 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.2 I1.211 J-.121 P1  F30000
G1 X148.102 Y72.398 Z21.2
G1 Z20.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1437
G1 X148.102 Y69.602 E.09274
G1 X159.819 Y69.602 E.38867
G1 X159.819 Y72.398 E.09274
G1 X148.162 Y72.398 E.38668
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1437
G1 X147.71 Y69.21 E.11
G1 X160.211 Y69.21 E.38412
G1 X160.211 Y72.79 E.11
G1 X147.77 Y72.79 E.38228
M204 S10000
; WIPE_START
G1 F24000
M73 P94 R3
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.2 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z21.2
G1 Z20.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1437
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.485 Y72.05 E.09848
G1 X158.598 Y72.05 E.00372
G1 X158.598 Y70.534 E.05029
G1 X159.005 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450103
G1 F1437
G1 X159.412 Y71.991 E.01351
G1 X159.412 Y70.011 E.06568
G1 X159.005 Y70.015 E.01351
G1 X159.005 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 21
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X159.005 Y70.015 E-.72794
G1 X159.089 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 105/125
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
G3 Z21.2 I-1.211 J-.117 P1  F30000
G1 X148.102 Y183.602 Z21.2
G1 Z21
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1407
G1 X159.451 Y183.602 E.37645
G1 X159.451 Y186.398 E.09274
G1 X148.102 Y186.398 E.37645
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1407
G1 X159.843 Y183.21 E.3728
G1 X159.843 Y186.79 E.11
G1 X147.71 Y186.79 E.3728
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.26 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.4 I-.978 J-.724 P1  F30000
G1 X149.199 Y183.95 Z21.4
G1 Z21
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1407
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X158.229 Y184.207 E.08647
G1 X158.229 Y183.95 E.0085
G1 X156.857 Y183.95 E.04552
G1 X158.636 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450106
G1 F1407
G1 X158.636 Y185.991 E.06555
G1 X159.043 Y185.991 E.01351
G1 X159.043 Y184.011 E.06568
G1 X158.696 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X159.043 Y184.011 E-.13194
G1 X159.043 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.4 I1.211 J-.117 P1  F30000
G1 X148.102 Y72.398 Z21.4
G1 Z21
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1407
G1 X148.102 Y69.602 E.09274
G1 X159.451 Y69.602 E.37645
G1 X159.451 Y72.398 E.09274
G1 X148.162 Y72.398 E.37446
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1407
G1 X147.71 Y69.21 E.11
G1 X159.843 Y69.21 E.3728
G1 X159.843 Y72.79 E.11
G1 X147.77 Y72.79 E.37096
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.4 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z21.4
G1 Z21
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1407
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X158.229 Y71.793 E.08647
G1 X158.229 Y72.05 E.0085
G1 X156.857 Y72.05 E.04552
G1 X158.636 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1407
G1 X159.043 Y71.991 E.01351
G1 X159.043 Y70.011 E.06568
G1 X158.636 Y70.015 E.01351
G1 X158.636 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 21.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X158.636 Y70.015 E-.72794
G1 X158.721 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 106/125
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
G3 Z21.4 I-1.212 J-.113 P1  F30000
G1 X148.102 Y183.602 Z21.4
G1 Z21.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1374
G1 X159.082 Y183.602 E.36423
G1 X159.082 Y186.398 E.09274
G1 X148.102 Y186.398 E.36423
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1374
G1 X159.474 Y183.21 E.36148
G1 X159.474 Y186.79 E.11
G1 X147.71 Y186.79 E.36148
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.26 E-.76
; WIPE_END
M73 P94 R2
G1 E-.04 F1800
G17
G3 Z21.6 I-.978 J-.724 P1  F30000
G1 X149.199 Y183.95 Z21.6
G1 Z21.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1374
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X157.861 Y184.575 E.06918
G1 X157.861 Y183.95 E.02072
G1 X156.857 Y183.95 E.0333
G1 X158.268 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1374
G1 X158.268 Y185.991 E.06555
G1 X158.675 Y185.991 E.01351
G1 X158.675 Y184.011 E.06568
G1 X158.328 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X158.675 Y184.011 E-.13194
G1 X158.675 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.6 I1.212 J-.113 P1  F30000
G1 X148.102 Y72.398 Z21.6
G1 Z21.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1374
G1 X148.102 Y69.602 E.09274
G1 X159.082 Y69.602 E.36423
G1 X159.082 Y72.398 E.09274
G1 X148.162 Y72.398 E.36224
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1374
G1 X147.71 Y69.21 E.11
G1 X159.474 Y69.21 E.36148
G1 X159.474 Y72.79 E.11
G1 X147.77 Y72.79 E.35964
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.6 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z21.6
G1 Z21.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1374
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X157.861 Y71.425 E.06918
G1 X157.861 Y72.05 E.02072
G1 X156.857 Y72.05 E.0333
G1 X158.268 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1374
G1 X158.675 Y71.991 E.01351
G1 X158.675 Y70.011 E.06568
G1 X158.268 Y70.015 E.01351
G1 X158.268 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 21.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X158.268 Y70.015 E-.72794
G1 X158.352 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 107/125
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
G3 Z21.6 I-1.212 J-.109 P1  F30000
G1 X148.102 Y183.602 Z21.6
G1 Z21.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1341
G1 X158.714 Y183.602 E.35201
G1 X158.714 Y186.398 E.09274
G1 X148.102 Y186.398 E.35201
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1341
G1 X159.106 Y183.21 E.35016
G1 X159.106 Y186.79 E.11
G1 X147.71 Y186.79 E.35016
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.259 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.8 I-.978 J-.724 P1  F30000
G1 X149.199 Y183.95 Z21.8
G1 Z21.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1341
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.346 Y186.05 E.09848
G1 X156.386 Y186.05 E.03184
G1 X157.492 Y184.943 E.0519
G1 X157.492 Y183.95 E.03294
G1 X156.857 Y183.95 E.02107
G1 X157.899 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1341
G1 X157.899 Y185.991 E.06555
G1 X158.307 Y185.991 E.01351
G1 X158.307 Y184.011 E.06568
G1 X157.959 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X158.307 Y184.011 E-.13194
G1 X158.307 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.8 I1.212 J-.109 P1  F30000
G1 X148.102 Y72.398 Z21.8
G1 Z21.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1341
G1 X148.102 Y69.602 E.09274
G1 X158.714 Y69.602 E.35201
G1 X158.714 Y72.398 E.09274
G1 X148.162 Y72.398 E.35002
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1341
G1 X147.71 Y69.21 E.11
G1 X159.106 Y69.21 E.35016
G1 X159.106 Y72.79 E.11
G1 X147.77 Y72.79 E.34832
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.8 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z21.8
G1 Z21.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1341
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.346 Y69.95 E.09848
G1 X156.386 Y69.95 E.03184
G1 X157.492 Y71.057 E.0519
G1 X157.492 Y72.05 E.03294
G1 X156.857 Y72.05 E.02107
G1 X157.899 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1341
G1 X158.307 Y71.991 E.01351
G1 X158.307 Y70.011 E.06568
G1 X157.899 Y70.015 E.01351
G1 X157.899 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 21.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X157.899 Y70.015 E-.72794
G1 X157.984 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 108/125
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
G3 Z21.8 I-1.212 J-.105 P1  F30000
G1 X148.102 Y183.602 Z21.8
G1 Z21.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1298
G1 X158.345 Y183.602 E.33979
G1 X158.345 Y186.398 E.09274
G1 X148.102 Y186.398 E.33979
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1298
G1 X158.737 Y183.21 E.33884
G1 X158.737 Y186.79 E.11
G1 X147.71 Y186.79 E.33884
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.259 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22 I-.978 J-.724 P1  F30000
G1 X149.199 Y183.95 Z22
G1 Z21.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1298
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X157.124 Y185.828 E.08807
G1 X157.124 Y185.312 E.01711
G1 X156.386 Y186.05 E.03462
G1 X154.758 Y186.05 E.05401
G1 X157.531 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1298
G1 X157.531 Y185.991 E.06555
M73 P95 R2
G1 X157.938 Y185.991 E.01351
G1 X157.938 Y184.011 E.06568
G1 X157.591 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X157.938 Y184.011 E-.13194
G1 X157.938 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22 I1.212 J-.105 P1  F30000
G1 X148.102 Y72.398 Z22
G1 Z21.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1298
G1 X148.102 Y69.602 E.09274
G1 X158.345 Y69.602 E.33979
G1 X158.345 Y72.398 E.09274
G1 X148.162 Y72.398 E.3378
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1298
G1 X147.71 Y69.21 E.11
G1 X158.737 Y69.21 E.33884
G1 X158.737 Y72.79 E.11
G1 X147.77 Y72.79 E.337
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z22
G1 Z21.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1298
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X157.124 Y70.172 E.08807
G1 X157.124 Y70.688 E.01711
G1 X156.386 Y69.95 E.03462
G1 X154.758 Y69.95 E.05401
G1 X157.531 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1298
G1 X157.938 Y71.991 E.01351
G1 X157.938 Y70.011 E.06568
G1 X157.531 Y70.015 E.01351
G1 X157.531 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 21.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X157.531 Y70.015 E-.72794
G1 X157.615 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 109/125
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
G3 Z22 I-1.213 J-.102 P1  F30000
G1 X148.102 Y183.602 Z22
G1 Z21.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1252
G1 X157.977 Y183.602 E.32756
G1 X157.977 Y186.398 E.09274
G1 X148.102 Y186.398 E.32756
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1252
G1 X158.369 Y183.21 E.32752
G1 X158.369 Y186.79 E.11
G1 X147.71 Y186.79 E.32752
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.259 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.2 I-.979 J-.723 P1  F30000
G1 X149.199 Y183.95 Z22.2
G1 Z21.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1252
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X156.755 Y185.459 E.07079
G1 X156.755 Y185.68 E.00733
G1 X156.386 Y186.05 E.01733
G1 X154.758 Y186.05 E.05401
G1 X157.163 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450103
G1 F1252
G1 X157.163 Y185.991 E.06555
G1 X157.57 Y185.991 E.01351
G1 X157.57 Y184.011 E.06568
G1 X157.223 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X157.57 Y184.011 E-.13194
G1 X157.57 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.2 I1.213 J-.101 P1  F30000
G1 X148.102 Y72.398 Z22.2
G1 Z21.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1252
G1 X148.102 Y69.602 E.09274
G1 X157.977 Y69.602 E.32756
G1 X157.977 Y72.398 E.09274
G1 X148.162 Y72.398 E.32557
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1252
G1 X147.71 Y69.21 E.11
G1 X158.369 Y69.21 E.32752
G1 X158.369 Y72.79 E.11
G1 X147.77 Y72.79 E.32568
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.2 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z22.2
G1 Z21.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1252
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X156.755 Y70.541 E.07079
G1 X156.755 Y70.32 E.00733
G1 X156.386 Y69.95 E.01733
G1 X154.758 Y69.95 E.05401
G1 X157.163 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450103
G1 F1252
G1 X157.57 Y71.991 E.01351
G1 X157.57 Y70.011 E.06568
G1 X157.163 Y70.015 E.01351
G1 X157.163 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 22
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X157.163 Y70.015 E-.72794
G1 X157.247 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 110/125
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
G3 Z22.2 I-1.213 J-.098 P1  F30000
G1 X148.102 Y183.602 Z22.2
G1 Z22
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1206
G1 X157.608 Y183.602 E.31534
G1 X157.608 Y186.398 E.09274
G1 X148.102 Y186.398 E.31534
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1206
G1 X158.001 Y183.21 E.3162
G1 X158.001 Y186.79 E.11
G1 X147.71 Y186.79 E.3162
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.258 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.4 I-.979 J-.723 P1  F30000
G1 X149.199 Y183.95 Z22.4
G1 Z22
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1206
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X156.387 Y185.091 E.0535
G1 X156.387 Y186.05 E.0318
G1 X155.717 Y186.05 E.02221
G1 X156.794 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450106
G1 F1206
G1 X156.794 Y185.991 E.06555
G1 X157.201 Y185.991 E.01351
G1 X157.201 Y184.011 E.06568
G1 X156.854 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X157.201 Y184.011 E-.13194
G1 X157.201 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.4 I1.213 J-.097 P1  F30000
G1 X148.102 Y72.398 Z22.4
G1 Z22
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1206
G1 X148.102 Y69.602 E.09274
G1 X157.608 Y69.602 E.31534
G1 X157.608 Y72.398 E.09274
G1 X148.162 Y72.398 E.31335
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1206
G1 X147.71 Y69.21 E.11
G1 X158.001 Y69.21 E.3162
G1 X158.001 Y72.79 E.11
G1 X147.77 Y72.79 E.31436
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.4 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z22.4
G1 Z22
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1206
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X156.387 Y70.909 E.0535
G1 X156.387 Y69.95 E.0318
G1 X155.717 Y69.95 E.02221
G1 X156.794 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1206
G1 X157.201 Y71.991 E.01351
G1 X157.201 Y70.011 E.06568
G1 X156.794 Y70.015 E.01351
G1 X156.794 Y71.931 E.06356
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 22.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X156.794 Y70.015 E-.72794
G1 X156.879 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 111/125
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
G3 Z22.4 I-1.213 J-.094 P1  F30000
G1 X148.102 Y183.602 Z22.4
G1 Z22.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X157.24 Y183.602 E.30312
G1 X157.24 Y186.398 E.09274
G1 X148.102 Y186.398 E.30312
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X157.632 Y183.21 E.30488
G1 X157.632 Y186.79 E.11
G1 X147.71 Y186.79 E.30488
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.258 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.6 I-.979 J-.723 P1  F30000
G1 X149.199 Y183.95 Z22.6
G1 Z22.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X156.019 Y184.722 E.03622
G1 X156.019 Y186.05 E.04403
G1 X155.717 Y186.05 E.00999
G1 X156.426 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1200
G1 X156.426 Y185.991 E.06555
G1 X156.833 Y185.991 E.01351
G1 X156.833 Y184.011 E.06568
G1 X156.486 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X156.833 Y184.011 E-.13194
G1 X156.833 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.6 I1.213 J-.094 P1  F30000
G1 X148.102 Y72.398 Z22.6
G1 Z22.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X148.102 Y69.602 E.09274
G1 X157.24 Y69.602 E.30312
G1 X157.24 Y72.398 E.09274
G1 X148.162 Y72.398 E.30113
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X147.71 Y69.21 E.11
G1 X157.632 Y69.21 E.30488
G1 X157.632 Y72.79 E.11
G1 X147.77 Y72.79 E.30304
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.6 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z22.6
G1 Z22.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X156.019 Y71.278 E.03622
G1 X156.019 Y69.95 E.04403
G1 X155.717 Y69.95 E.00999
G1 X156.426 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1200
G1 X156.833 Y71.991 E.01351
G1 X156.833 Y70.011 E.06568
G1 X156.426 Y70.015 E.01351
G1 X156.426 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 22.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X156.426 Y70.015 E-.72794
G1 X156.51 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 112/125
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
G3 Z22.6 I-1.214 J-.09 P1  F30000
G1 X148.102 Y183.602 Z22.6
G1 Z22.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X156.872 Y183.602 E.2909
G1 X156.872 Y186.398 E.09274
G1 X148.102 Y186.398 E.2909
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X157.264 Y183.21 E.29356
G1 X157.264 Y186.79 E.11
G1 X147.71 Y186.79 E.29356
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.8 I-.979 J-.722 P1  F30000
M73 P96 R2
G1 X149.199 Y183.95 Z22.8
G1 Z22.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X155.246 Y183.95 E.14719
G1 X155.65 Y184.354 E.01894
G1 X155.65 Y185.982 E.05401
G1 X156.057 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1200
G1 X156.057 Y185.991 E.06555
G1 X156.464 Y185.991 E.01351
G1 X156.464 Y184.011 E.06568
G1 X156.117 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X156.464 Y184.011 E-.13194
G1 X156.464 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.8 I1.214 J-.09 P1  F30000
G1 X148.102 Y72.398 Z22.8
G1 Z22.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X148.102 Y69.602 E.09274
G1 X156.872 Y69.602 E.2909
G1 X156.872 Y72.398 E.09274
G1 X148.162 Y72.398 E.28891
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X147.71 Y69.21 E.11
G1 X157.264 Y69.21 E.29356
G1 X157.264 Y72.79 E.11
G1 X147.77 Y72.79 E.29171
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.8 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z22.8
G1 Z22.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X155.246 Y72.05 E.14719
G1 X155.65 Y71.646 E.01894
G1 X155.65 Y70.018 E.05401
G1 X156.057 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1200
G1 X156.464 Y71.991 E.01351
G1 X156.464 Y70.011 E.06568
G1 X156.057 Y70.015 E.01351
G1 X156.057 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 22.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X156.057 Y70.015 E-.72794
G1 X156.142 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 113/125
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
G3 Z22.8 I-1.214 J-.086 P1  F30000
G1 X148.102 Y183.602 Z22.8
G1 Z22.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X156.503 Y183.602 E.27868
G1 X156.503 Y186.398 E.09274
G1 X148.102 Y186.398 E.27868
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X156.895 Y183.21 E.28224
G1 X156.895 Y186.79 E.11
G1 X147.71 Y186.79 E.28224
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23 I-.98 J-.722 P1  F30000
G1 X149.199 Y183.95 Z23
G1 Z22.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X148.45 Y183.95 E.02483
M73 P96 R1
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X152.438 Y183.95 E.05401
G1 X155.689 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1200
G1 X155.689 Y185.991 E.06555
G1 X156.096 Y185.991 E.01351
G1 X156.096 Y184.011 E.06568
G1 X155.749 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X156.096 Y184.011 E-.13194
G1 X156.096 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23 I1.214 J-.086 P1  F30000
G1 X148.102 Y72.398 Z23
G1 Z22.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X148.102 Y69.602 E.09274
G1 X156.503 Y69.602 E.27868
G1 X156.503 Y72.398 E.09274
G1 X148.162 Y72.398 E.27669
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X147.71 Y69.21 E.11
G1 X156.895 Y69.21 E.28224
G1 X156.895 Y72.79 E.11
G1 X147.77 Y72.79 E.28039
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z23
G1 Z22.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X152.438 Y72.05 E.05401
G1 X155.689 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1200
G1 X156.096 Y71.991 E.01351
G1 X156.096 Y70.011 E.06568
G1 X155.689 Y70.015 E.01351
G1 X155.689 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 22.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X155.689 Y70.015 E-.72794
G1 X155.773 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 114/125
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
G3 Z23 I-1.214 J-.082 P1  F30000
G1 X148.102 Y183.602 Z23
G1 Z22.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X156.135 Y183.602 E.26646
G1 X156.135 Y186.398 E.09274
G1 X148.102 Y186.398 E.26646
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X156.527 Y183.21 E.27092
G1 X156.527 Y186.79 E.11
G1 X147.71 Y186.79 E.27092
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.256 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.2 I-.98 J-.722 P1  F30000
G1 X149.199 Y183.95 Z23.2
G1 Z22.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X148.45 Y183.95 E.02483
G1 X148.45 Y184.83 E.02919
G1 X149.67 Y186.05 E.05721
G1 X148.71 Y186.05 E.03184
G1 X150.809 Y183.95 E.09848
G1 X152.438 Y183.95 E.05401
G1 X155.32 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450104
G1 F1200
G1 X155.32 Y185.991 E.06555
G1 X155.728 Y185.991 E.01351
G1 X155.728 Y184.011 E.06568
G1 X155.38 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X155.728 Y184.011 E-.13194
G1 X155.728 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.2 I1.214 J-.082 P1  F30000
G1 X148.102 Y72.398 Z23.2
G1 Z22.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X148.102 Y69.602 E.09274
G1 X156.135 Y69.602 E.26646
G1 X156.135 Y72.398 E.09274
G1 X148.162 Y72.398 E.26447
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X147.71 Y69.21 E.11
G1 X156.527 Y69.21 E.27092
G1 X156.527 Y72.79 E.11
G1 X147.77 Y72.79 E.26907
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.2 I-.794 J.922 P1  F30000
G1 X149.199 Y72.05 Z23.2
G1 Z22.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X148.45 Y72.05 E.02483
G1 X148.45 Y71.17 E.02919
G1 X149.67 Y69.95 E.05721
G1 X148.71 Y69.95 E.03184
G1 X150.809 Y72.05 E.09848
G1 X152.438 Y72.05 E.05401
G1 X155.32 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450104
G1 F1200
G1 X155.728 Y71.991 E.01351
G1 X155.728 Y70.011 E.06568
G1 X155.32 Y70.015 E.01351
G1 X155.32 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 23
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X155.32 Y70.015 E-.72794
G1 X155.405 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 115/125
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
G3 Z23.2 I-1.214 J-.078 P1  F30000
G1 X148.102 Y183.602 Z23.2
G1 Z23
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X155.766 Y183.602 E.25424
G1 X155.766 Y186.398 E.09274
G1 X148.102 Y186.398 E.25424
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X156.158 Y183.21 E.2596
G1 X156.158 Y186.79 E.11
G1 X147.71 Y186.79 E.2596
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.256 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.4 I-1.212 J-.114 P1  F30000
G1 X149.606 Y184.357 Z23.4
G1 Z23
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X148.857 Y184.357 E.02483
G1 X148.857 Y185.237 E.02919
G1 X149.263 Y185.643 E.01901
G1 X149.117 Y185.643 E.00483
G1 X150.402 Y184.357 E.06029
G1 X152.031 Y184.357 E.05401
G1 X153.84 Y186.05 F30000
G1 F1200
G1 X148.45 Y186.05 E.17877
G1 X148.45 Y183.95 E.06964
G1 X153.84 Y183.95 E.17877
G1 X153.84 Y185.99 E.06765
G1 X154.952 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450106
G1 F1200
G1 X154.952 Y185.991 E.06555
G1 X155.359 Y185.991 E.01351
G1 X155.359 Y184.011 E.06568
G1 X155.012 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X155.359 Y184.011 E-.13194
G1 X155.359 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.4 I1.214 J-.078 P1  F30000
G1 X148.102 Y72.398 Z23.4
G1 Z23
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X148.102 Y69.602 E.09274
G1 X155.766 Y69.602 E.25424
G1 X155.766 Y72.398 E.09274
G1 X148.162 Y72.398 E.25225
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X147.71 Y69.21 E.11
G1 X156.158 Y69.21 E.2596
G1 X156.158 Y72.79 E.11
G1 X147.77 Y72.79 E.25775
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.4 I-.505 J1.107 P1  F30000
G1 X149.606 Y71.643 Z23.4
G1 Z23
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X148.857 Y71.643 E.02483
G1 X148.857 Y70.763 E.02919
G1 X149.263 Y70.357 E.01901
G1 X149.117 Y70.357 E.00483
G1 X150.402 Y71.643 E.06029
G1 X152.031 Y71.643 E.05401
G1 X153.84 Y72.05 F30000
G1 F1200
G1 X148.45 Y72.05 E.17877
G1 X148.45 Y69.95 E.06964
G1 X153.84 Y69.95 E.17877
G1 X153.84 Y71.99 E.06765
G1 X154.952 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1200
G1 X155.359 Y71.991 E.01351
G1 X155.359 Y70.011 E.06568
G1 X154.952 Y70.015 E.01351
G1 X154.952 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 23.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X154.952 Y70.015 E-.72794
G1 X155.036 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 116/125
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
G3 Z23.4 I-1.215 J-.074 P1  F30000
G1 X148.102 Y183.602 Z23.4
G1 Z23.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X155.398 Y183.602 E.24202
G1 X155.398 Y186.398 E.09274
G1 X148.102 Y186.398 E.24202
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X155.79 Y183.21 E.24828
G1 X155.79 Y186.79 E.11
G1 X147.71 Y186.79 E.24828
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.255 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.6 I-1.212 J-.114 P1  F30000
G1 X149.606 Y184.357 Z23.6
M73 P97 R1
G1 Z23.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X148.857 Y184.357 E.02483
G1 X148.857 Y185.237 E.02919
G1 X149.263 Y185.643 E.01901
G1 X149.117 Y185.643 E.00483
G1 X150.402 Y184.357 E.06029
G1 X152.031 Y184.357 E.05401
G1 X153.84 Y186.05 F30000
G1 F1200
G1 X148.45 Y186.05 E.17877
G1 X148.45 Y183.95 E.06964
G1 X153.84 Y183.95 E.17877
G1 X153.84 Y185.99 E.06765
G1 X154.584 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450106
G1 F1200
G1 X154.584 Y185.991 E.06555
G1 X154.991 Y185.991 E.01351
G1 X154.991 Y184.011 E.06568
G1 X154.644 Y184.015 E.01152
; WIPE_START
G1 F24000
G1 X154.991 Y184.011 E-.13194
G1 X154.991 Y185.664 E-.62806
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.6 I1.215 J-.074 P1  F30000
G1 X148.102 Y72.398 Z23.6
G1 Z23.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X148.102 Y69.602 E.09274
G1 X155.398 Y69.602 E.24202
G1 X155.398 Y72.398 E.09274
G1 X148.162 Y72.398 E.24003
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X147.71 Y69.21 E.11
G1 X155.79 Y69.21 E.24828
G1 X155.79 Y72.79 E.11
G1 X147.77 Y72.79 E.24643
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.6 I-.505 J1.107 P1  F30000
G1 X149.606 Y71.643 Z23.6
G1 Z23.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X148.857 Y71.643 E.02483
G1 X148.857 Y70.763 E.02919
G1 X149.263 Y70.357 E.01901
G1 X149.117 Y70.357 E.00483
G1 X150.402 Y71.643 E.06029
G1 X152.031 Y71.643 E.05401
G1 X153.84 Y72.05 F30000
G1 F1200
G1 X148.45 Y72.05 E.17877
G1 X148.45 Y69.95 E.06964
G1 X153.84 Y69.95 E.17877
G1 X153.84 Y71.99 E.06765
G1 X154.584 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1200
G1 X154.991 Y71.991 E.01351
G1 X154.991 Y70.011 E.06568
G1 X154.584 Y70.015 E.01351
G1 X154.584 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 23.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X154.584 Y70.015 E-.72794
G1 X154.668 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 117/125
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
G3 Z23.6 I-1.215 J-.07 P1  F30000
G1 X148.102 Y183.602 Z23.6
G1 Z23.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X155.03 Y183.602 E.2298
G1 X155.03 Y186.398 E.09274
G1 X148.102 Y186.398 E.2298
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X155.422 Y183.21 E.23696
G1 X155.422 Y186.79 E.11
G1 X147.71 Y186.79 E.23696
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.254 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.8 I-1.212 J-.114 P1  F30000
G1 X149.606 Y184.357 Z23.8
G1 Z23.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X148.857 Y184.357 E.02483
G1 X148.857 Y185.237 E.02919
G1 X149.263 Y185.643 E.01901
G1 X149.117 Y185.643 E.00483
G1 X150.402 Y184.357 E.06029
G1 X152.031 Y184.357 E.05401
G1 X154.215 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1200
G1 X154.215 Y185.991 E.06555
G1 X154.622 Y185.991 E.01351
G1 X154.622 Y184.011 E.06568
G1 X154.275 Y184.015 E.01152
G1 X153.808 Y185.99 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X153.808 Y183.95 E.06765
G1 X148.45 Y183.95 E.17773
G1 X148.45 Y186.05 E.06964
G1 X153.808 Y186.05 E.17773
; WIPE_START
G1 F24000
G1 X151.808 Y186.05 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.8 I1.216 J-.04 P1  F30000
G1 X148.102 Y72.398 Z23.8
G1 Z23.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X148.102 Y69.602 E.09274
G1 X155.03 Y69.602 E.2298
G1 X155.03 Y72.398 E.09274
G1 X148.162 Y72.398 E.22781
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X147.71 Y69.21 E.11
G1 X155.422 Y69.21 E.23696
G1 X155.422 Y72.79 E.11
G1 X147.77 Y72.79 E.23511
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.8 I-.505 J1.107 P1  F30000
G1 X149.606 Y71.643 Z23.8
G1 Z23.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X148.857 Y71.643 E.02483
G1 X148.857 Y70.763 E.02919
G1 X149.263 Y70.357 E.01901
G1 X149.117 Y70.357 E.00483
G1 X150.402 Y71.643 E.06029
G1 X152.031 Y71.643 E.05401
G1 X153.808 Y72.05 F30000
G1 F1200
G1 X148.45 Y72.05 E.17773
G1 X148.45 Y69.95 E.06964
G1 X153.808 Y69.95 E.17773
G1 X153.808 Y71.99 E.06765
G1 X154.215 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1200
G1 X154.622 Y71.991 E.01351
G1 X154.622 Y70.011 E.06568
G1 X154.215 Y70.015 E.01351
G1 X154.215 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 23.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X154.215 Y70.015 E-.72794
G1 X154.3 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 118/125
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
G3 Z23.8 I-1.215 J-.066 P1  F30000
G1 X148.102 Y183.602 Z23.8
G1 Z23.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X154.661 Y183.602 E.21757
G1 X154.661 Y186.398 E.09274
G1 X148.102 Y186.398 E.21757
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X155.053 Y183.21 E.22563
G1 X155.053 Y186.79 E.11
G1 X147.71 Y186.79 E.22563
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.254 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24 I-1.212 J-.114 P1  F30000
G1 X149.606 Y184.357 Z24
G1 Z23.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X148.857 Y184.357 E.02483
G1 X148.857 Y185.237 E.02919
G1 X149.263 Y185.643 E.01901
G1 X149.117 Y185.643 E.00483
G1 X150.402 Y184.357 E.06029
G1 X152.031 Y184.357 E.05401
G1 X153.847 Y184.015 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1200
G1 X153.847 Y185.991 E.06555
G1 X154.254 Y185.991 E.01351
G1 X154.254 Y184.011 E.06568
G1 X153.907 Y184.015 E.01152
G1 X153.44 Y185.99 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X153.44 Y183.95 E.06765
G1 X148.45 Y183.95 E.1655
G1 X148.45 Y186.05 E.06964
G1 X153.44 Y186.05 E.1655
; WIPE_START
G1 F24000
G1 X151.44 Y186.05 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24 I1.216 J-.036 P1  F30000
G1 X148.102 Y72.398 Z24
G1 Z23.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X148.102 Y69.602 E.09274
G1 X154.661 Y69.602 E.21757
G1 X154.661 Y72.398 E.09274
G1 X148.162 Y72.398 E.21558
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X147.71 Y69.21 E.11
G1 X155.053 Y69.21 E.22563
G1 X155.053 Y72.79 E.11
G1 X147.77 Y72.79 E.22379
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24 I-.505 J1.107 P1  F30000
G1 X149.606 Y71.643 Z24
G1 Z23.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X148.857 Y71.643 E.02483
G1 X148.857 Y70.763 E.02919
G1 X149.263 Y70.357 E.01901
G1 X149.117 Y70.357 E.00483
G1 X150.402 Y71.643 E.06029
G1 X152.031 Y71.643 E.05401
G1 X153.44 Y72.05 F30000
G1 F1200
G1 X148.45 Y72.05 E.1655
G1 X148.45 Y69.95 E.06964
G1 X153.44 Y69.95 E.1655
G1 X153.44 Y71.99 E.06765
G1 X153.847 Y71.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.450105
G1 F1200
G1 X154.254 Y71.991 E.01351
G1 X154.254 Y70.011 E.06568
G1 X153.847 Y70.015 E.01351
G1 X153.847 Y71.931 E.06356
; CHANGE_LAYER
; Z_HEIGHT: 23.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X153.847 Y70.015 E-.72794
G1 X153.931 Y70.014 E-.03206
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 119/125
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L119
M991 S0 P118 ;notify layer change
G17
G3 Z24 I-1.215 J-.062 P1  F30000
G1 X148.102 Y183.602 Z24
G1 Z23.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X154.293 Y183.602 E.20535
G1 X154.293 Y186.398 E.09274
G1 X148.102 Y186.398 E.20535
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X154.685 Y183.21 E.21431
G1 X154.685 Y186.79 E.11
G1 X147.71 Y186.79 E.21431
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.253 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.2 I-1.126 J-.462 P1  F30000
G1 X148.488 Y186.231 Z24.2
G1 Z23.8
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.433033
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X148.488 Y183.972 E.13555
G1 X148.971 Y183.972 E.02898
G1 X148.971 Y186.028 E.1234
G1 X149.454 Y186.028 E.02898
G1 X149.454 Y183.972 E.1234
G1 X149.937 Y183.972 E.02898
G1 X149.937 Y186.028 E.1234
G1 X150.42 Y186.028 E.02898
G1 X150.42 Y183.972 E.1234
G1 X150.903 Y183.972 E.02898
G1 X150.903 Y186.028 E.1234
G1 X151.386 Y186.028 E.02898
G1 X151.386 Y183.972 E.1234
G1 X151.87 Y183.972 E.02898
G1 X151.87 Y186.028 E.1234
G1 X152.353 Y186.028 E.02898
G1 X152.353 Y183.972 E.1234
G1 X152.836 Y183.972 E.02898
G1 X152.836 Y186.028 E.1234
G1 X153.319 Y186.028 E.02898
G1 X153.319 Y183.972 E.1234
G1 X153.802 Y183.972 E.02898
G1 X153.802 Y186.231 E.13555
; WIPE_START
G1 F24000
G1 X153.802 Y184.231 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.2 I1.215 J-.062 P1  F30000
G1 X148.102 Y72.398 Z24.2
G1 Z23.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X148.102 Y69.602 E.09274
G1 X154.293 Y69.602 E.20535
G1 X154.293 Y72.398 E.09274
G1 X148.162 Y72.398 E.20336
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X147.71 Y69.21 E.11
G1 X154.685 Y69.21 E.21431
G1 X154.685 Y72.79 E.11
G1 X147.77 Y72.79 E.21247
M204 S10000
G1 X148.488 Y72.231 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.433033
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X148.488 Y69.972 E.13555
G1 X148.971 Y69.972 E.02898
G1 X148.971 Y72.028 E.1234
G1 X149.454 Y72.028 E.02898
G1 X149.454 Y69.972 E.1234
G1 X149.937 Y69.972 E.02898
G1 X149.937 Y72.028 E.1234
G1 X150.42 Y72.028 E.02898
G1 X150.42 Y69.972 E.1234
G1 X150.903 Y69.972 E.02898
G1 X150.903 Y72.028 E.1234
G1 X151.386 Y72.028 E.02898
G1 X151.386 Y69.972 E.1234
G1 X151.87 Y69.972 E.02898
G1 X151.87 Y72.028 E.1234
G1 X152.353 Y72.028 E.02898
G1 X152.353 Y69.972 E.1234
G1 X152.836 Y69.972 E.02898
G1 X152.836 Y72.028 E.1234
G1 X153.319 Y72.028 E.02898
G1 X153.319 Y69.972 E.1234
G1 X153.802 Y69.972 E.02898
G1 X153.802 Y72.231 E.13555
; CHANGE_LAYER
; Z_HEIGHT: 24
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X153.802 Y70.231 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 120/125
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L120
M991 S0 P119 ;notify layer change
G17
G3 Z24.2 I-1.215 J-.061 P1  F30000
G1 X148.102 Y183.602 Z24.2
G1 Z24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X153.924 Y183.602 E.19313
G1 X153.924 Y186.398 E.09274
G1 X148.102 Y186.398 E.19313
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X154.316 Y183.21 E.20299
G1 X154.316 Y186.79 E.11
G1 X147.71 Y186.79 E.20299
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.252 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.4 I-1.171 J-.33 P1  F30000
G1 X149.28 Y184.78 Z24.4
G1 Z24
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483144
G1 F1200
G1 X149.28 Y185.22 E.01579
M73 P98 R1
G1 X152.746 Y185.22 E.12435
G1 X152.746 Y184.78 E.01579
G1 X149.34 Y184.78 E.1222
G1 X148.871 Y184.371 F30000
; LINE_WIDTH: 0.419999
G1 F1200
G1 X148.871 Y185.629 E.03864
G1 X153.155 Y185.629 E.13163
G1 X153.155 Y184.371 E.03864
G1 X148.931 Y184.371 E.12979
G1 X148.494 Y183.994 F30000
G1 F1200
G1 X148.494 Y186.006 E.06181
G1 X153.532 Y186.006 E.1548
G1 X153.532 Y183.994 E.06181
G1 X148.554 Y183.994 E.15296
; WIPE_START
G1 F24000
G1 X150.554 Y183.994 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.4 I1.217 J-.027 P1  F30000
G1 X148.102 Y72.398 Z24.4
G1 Z24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X148.102 Y69.602 E.09274
G1 X153.924 Y69.602 E.19313
G1 X153.924 Y72.398 E.09274
G1 X148.162 Y72.398 E.19114
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X147.71 Y69.21 E.11
G1 X154.316 Y69.21 E.20299
G1 X154.316 Y72.79 E.11
G1 X147.77 Y72.79 E.20115
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.4 I-.326 J1.172 P1  F30000
G1 X149.28 Y71.22 Z24.4
G1 Z24
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483144
G1 F1200
G1 X152.746 Y71.22 E.12435
G1 X152.746 Y70.78 E.01579
G1 X149.28 Y70.78 E.12435
G1 X149.28 Y71.16 E.01364
G1 X148.871 Y71.629 F30000
; LINE_WIDTH: 0.419999
G1 F1200
G1 X153.155 Y71.629 E.13163
G1 X153.155 Y70.371 E.03864
G1 X148.871 Y70.371 E.13163
G1 X148.871 Y71.569 E.0368
G1 X148.494 Y72.006 F30000
G1 F1200
G1 X153.532 Y72.006 E.1548
G1 X153.532 Y69.994 E.06181
G1 X148.494 Y69.994 E.1548
G1 X148.494 Y71.946 E.05997
; CHANGE_LAYER
; Z_HEIGHT: 24.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X148.494 Y69.994 E-.74164
G1 X148.542 Y69.994 E-.01836
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 121/125
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L121
M991 S0 P120 ;notify layer change
G17
G3 Z24.4 I-1.217 J-.005 P1  F30000
G1 X148.102 Y183.602 Z24.4
G1 Z24.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
M73 P98 R0
G1 X153.556 Y183.602 E.18091
G1 X153.556 Y186.398 E.09274
G1 X148.102 Y186.398 E.18091
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X153.948 Y183.21 E.19167
G1 X153.948 Y186.79 E.11
G1 X147.71 Y186.79 E.19167
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.251 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.6 I-1.172 J-.329 P1  F30000
G1 X149.28 Y184.78 Z24.6
G1 Z24.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483144
G1 F1200
G1 X149.28 Y185.22 E.01579
G1 X152.378 Y185.22 E.11114
G1 X152.378 Y184.78 E.01579
G1 X149.34 Y184.78 E.10899
G1 X148.871 Y184.371 F30000
; LINE_WIDTH: 0.419999
G1 F1200
G1 X148.871 Y185.629 E.03864
G1 X152.787 Y185.629 E.12031
G1 X152.787 Y184.371 E.03864
G1 X148.931 Y184.371 E.11847
G1 X148.494 Y183.994 F30000
G1 F1200
G1 X148.494 Y186.006 E.06181
G1 X153.164 Y186.006 E.14348
G1 X153.164 Y183.994 E.06181
G1 X148.554 Y183.994 E.14164
; WIPE_START
G1 F24000
G1 X150.554 Y183.994 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.6 I1.217 J-.027 P1  F30000
G1 X148.102 Y72.398 Z24.6
G1 Z24.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X148.102 Y69.602 E.09274
G1 X153.556 Y69.602 E.18091
G1 X153.556 Y72.398 E.09274
G1 X148.162 Y72.398 E.17892
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X147.71 Y69.21 E.11
G1 X153.948 Y69.21 E.19167
G1 X153.948 Y72.79 E.11
G1 X147.77 Y72.79 E.18983
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.6 I-.326 J1.172 P1  F30000
G1 X149.28 Y71.22 Z24.6
G1 Z24.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483144
G1 F1200
G1 X152.378 Y71.22 E.11114
G1 X152.378 Y70.78 E.01579
G1 X149.28 Y70.78 E.11114
G1 X149.28 Y71.16 E.01364
G1 X148.871 Y71.629 F30000
; LINE_WIDTH: 0.419999
G1 F1200
G1 X152.787 Y71.629 E.12031
G1 X152.787 Y70.371 E.03864
G1 X148.871 Y70.371 E.12031
G1 X148.871 Y71.569 E.0368
G1 X148.494 Y72.006 F30000
G1 F1200
G1 X153.164 Y72.006 E.14348
G1 X153.164 Y69.994 E.06181
G1 X148.494 Y69.994 E.14348
G1 X148.494 Y71.946 E.05997
; CHANGE_LAYER
; Z_HEIGHT: 24.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X148.494 Y69.994 E-.74164
G1 X148.542 Y69.994 E-.01836
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 122/125
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L122
M991 S0 P121 ;notify layer change
G17
G3 Z24.6 I-1.217 J-.005 P1  F30000
G1 X148.102 Y183.602 Z24.6
G1 Z24.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X153.187 Y183.602 E.16869
G1 X153.187 Y186.398 E.09274
G1 X148.102 Y186.398 E.16869
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X153.579 Y183.21 E.18035
G1 X153.579 Y186.79 E.11
G1 X147.71 Y186.79 E.18035
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.25 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.8 I-1.172 J-.329 P1  F30000
G1 X149.28 Y184.78 Z24.8
G1 Z24.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483144
G1 F1200
G1 X149.28 Y185.22 E.01579
G1 X152.01 Y185.22 E.09792
G1 X152.01 Y184.78 E.01579
G1 X149.34 Y184.78 E.09577
G1 X148.871 Y184.371 F30000
; LINE_WIDTH: 0.419999
G1 F1200
G1 X148.871 Y185.629 E.03864
G1 X152.418 Y185.629 E.10899
G1 X152.418 Y184.371 E.03864
G1 X148.931 Y184.371 E.10715
G1 X148.494 Y183.994 F30000
G1 F1200
G1 X148.494 Y186.006 E.06181
G1 X152.795 Y186.006 E.13216
G1 X152.795 Y183.994 E.06181
G1 X148.554 Y183.994 E.13032
; WIPE_START
G1 F24000
G1 X150.554 Y183.994 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.8 I1.217 J-.027 P1  F30000
G1 X148.102 Y72.398 Z24.8
G1 Z24.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X148.102 Y69.602 E.09274
G1 X153.187 Y69.602 E.16869
G1 X153.187 Y72.398 E.09274
G1 X148.162 Y72.398 E.1667
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X147.71 Y69.21 E.11
G1 X153.579 Y69.21 E.18035
G1 X153.579 Y72.79 E.11
G1 X147.77 Y72.79 E.17851
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.8 I-.326 J1.172 P1  F30000
G1 X149.28 Y71.22 Z24.8
G1 Z24.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483144
G1 F1200
G1 X152.01 Y71.22 E.09792
G1 X152.01 Y70.78 E.01579
G1 X149.28 Y70.78 E.09792
G1 X149.28 Y71.16 E.01364
G1 X148.871 Y71.629 F30000
; LINE_WIDTH: 0.419999
G1 F1200
G1 X152.418 Y71.629 E.10899
G1 X152.418 Y70.371 E.03864
G1 X148.871 Y70.371 E.10899
G1 X148.871 Y71.569 E.0368
G1 X148.494 Y72.006 F30000
G1 F1200
G1 X152.795 Y72.006 E.13216
G1 X152.795 Y69.994 E.06181
G1 X148.494 Y69.994 E.13216
G1 X148.494 Y71.946 E.05997
; CHANGE_LAYER
; Z_HEIGHT: 24.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X148.494 Y69.994 E-.74164
G1 X148.542 Y69.994 E-.01836
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 123/125
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L123
M991 S0 P122 ;notify layer change
G17
G3 Z24.8 I-1.217 J-.005 P1  F30000
G1 X148.102 Y183.602 Z24.8
G1 Z24.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X152.819 Y183.602 E.15647
G1 X152.819 Y186.398 E.09274
G1 X148.102 Y186.398 E.15647
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X153.211 Y183.21 E.16903
G1 X153.211 Y186.79 E.11
G1 X147.71 Y186.79 E.16903
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.248 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25 I-1.172 J-.329 P1  F30000
G1 X149.28 Y184.78 Z25
G1 Z24.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483144
G1 F1200
G1 X149.28 Y185.22 E.01579
G1 X151.641 Y185.22 E.08471
G1 X151.641 Y184.78 E.01579
G1 X149.34 Y184.78 E.08255
G1 X148.871 Y184.371 F30000
; LINE_WIDTH: 0.419999
G1 F1200
G1 X148.871 Y185.629 E.03864
G1 X152.05 Y185.629 E.09767
G1 X152.05 Y184.371 E.03864
G1 X148.931 Y184.371 E.09583
G1 X148.494 Y183.994 F30000
G1 F1200
G1 X148.494 Y186.006 E.06181
G1 X152.427 Y186.006 E.12084
G1 X152.427 Y183.994 E.06181
G1 X148.554 Y183.994 E.119
; WIPE_START
G1 F24000
G1 X150.554 Y183.994 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25 I1.217 J-.027 P1  F30000
G1 X148.102 Y72.398 Z25
G1 Z24.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X148.102 Y69.602 E.09274
G1 X152.819 Y69.602 E.15647
G1 X152.819 Y72.398 E.09274
G1 X148.162 Y72.398 E.15448
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X147.71 Y69.21 E.11
G1 X153.211 Y69.21 E.16903
G1 X153.211 Y72.79 E.11
G1 X147.77 Y72.79 E.16719
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25 I-.326 J1.172 P1  F30000
G1 X149.28 Y71.22 Z25
G1 Z24.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483144
G1 F1200
G1 X151.641 Y71.22 E.08471
G1 X151.641 Y70.78 E.01579
G1 X149.28 Y70.78 E.08471
G1 X149.28 Y71.16 E.01364
G1 X148.871 Y71.629 F30000
; LINE_WIDTH: 0.419999
G1 F1200
G1 X152.05 Y71.629 E.09767
G1 X152.05 Y70.371 E.03864
G1 X148.871 Y70.371 E.09767
G1 X148.871 Y71.569 E.0368
G1 X148.494 Y72.006 F30000
G1 F1200
G1 X152.427 Y72.006 E.12084
G1 X152.427 Y69.994 E.06181
G1 X148.494 Y69.994 E.12084
G1 X148.494 Y71.946 E.05997
; CHANGE_LAYER
; Z_HEIGHT: 24.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X148.494 Y69.994 E-.74164
G1 X148.542 Y69.994 E-.01836
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 124/125
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L124
M991 S0 P123 ;notify layer change
G17
G3 Z25 I-1.217 J-.005 P1  F30000
G1 X148.102 Y183.602 Z25
G1 Z24.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X152.451 Y183.602 E.14425
G1 X152.451 Y186.398 E.09274
G1 X148.102 Y186.398 E.14425
G1 X148.102 Y183.662 E.09075
G1 X147.71 Y183.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X152.843 Y183.21 E.15771
G1 X152.843 Y186.79 E.11
G1 X147.71 Y186.79 E.15771
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.247 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.2 I-1.172 J-.329 P1  F30000
G1 X149.28 Y184.78 Z25.2
G1 Z24.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483144
M73 P99 R0
G1 F1200
G1 X149.28 Y185.22 E.01579
G1 X151.273 Y185.22 E.07149
G1 X151.273 Y184.78 E.01579
G1 X149.34 Y184.78 E.06934
G1 X148.871 Y184.371 F30000
; LINE_WIDTH: 0.419999
G1 F1200
G1 X148.871 Y185.629 E.03864
G1 X151.681 Y185.629 E.08635
G1 X151.681 Y184.371 E.03864
G1 X148.931 Y184.371 E.0845
G1 X148.494 Y183.994 F30000
G1 F1200
G1 X148.494 Y186.006 E.06181
G1 X152.058 Y186.006 E.10952
G1 X152.058 Y183.994 E.06181
G1 X148.554 Y183.994 E.10768
; WIPE_START
G1 F24000
G1 X150.554 Y183.994 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.2 I1.217 J-.027 P1  F30000
G1 X148.102 Y72.398 Z25.2
G1 Z24.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X148.102 Y69.602 E.09274
G1 X152.451 Y69.602 E.14425
G1 X152.451 Y72.398 E.09274
G1 X148.162 Y72.398 E.14226
G1 X147.71 Y72.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X147.71 Y69.21 E.11
G1 X152.843 Y69.21 E.15771
G1 X152.843 Y72.79 E.11
G1 X147.77 Y72.79 E.15587
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.2 I-.326 J1.172 P1  F30000
G1 X149.28 Y71.22 Z25.2
G1 Z24.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483144
G1 F1200
G1 X151.273 Y71.22 E.07149
G1 X151.273 Y70.78 E.01579
G1 X149.28 Y70.78 E.07149
G1 X149.28 Y71.16 E.01364
G1 X148.871 Y71.629 F30000
; LINE_WIDTH: 0.419999
G1 F1200
G1 X151.681 Y71.629 E.08635
G1 X151.681 Y70.371 E.03864
G1 X148.871 Y70.371 E.08635
G1 X148.871 Y71.569 E.0368
G1 X148.494 Y72.006 F30000
G1 F1200
G1 X152.058 Y72.006 E.10952
G1 X152.058 Y69.994 E.06181
G1 X148.494 Y69.994 E.10952
G1 X148.494 Y71.946 E.05997
; CHANGE_LAYER
; Z_HEIGHT: 25
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X148.494 Y69.994 E-.74164
G1 X148.542 Y69.994 E-.01836
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 125/125
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L125
M991 S0 P124 ;notify layer change
G17
G3 Z25.2 I-1.217 J-.009 P1  F30000
G1 X147.71 Y183.21 Z25.2
G1 Z25
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X152.474 Y183.21 E.14639
G1 X152.474 Y186.79 E.11
G1 X147.71 Y186.79 E.14639
G1 X147.71 Y183.27 E.10816
M204 S10000
; WIPE_START
G1 F24000
G1 X149.71 Y183.245 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.4 I-.113 J1.212 P1  F30000
G1 X151.555 Y183.417 Z25.4
G1 Z25
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F1200
G1 X152.267 Y184.13 E.03095
G1 X152.267 Y184.663
G1 X151.021 Y183.417 E.05412
G1 X150.488 Y183.417
G1 X152.267 Y185.196 E.07729
G1 X152.267 Y185.729
G1 X149.955 Y183.417 E.10047
G1 X149.422 Y183.417
G1 X152.267 Y186.263 E.12364
G1 X152.054 Y186.583
G1 X148.888 Y183.417 E.13754
G1 X148.355 Y183.417
G1 X151.52 Y186.583 E.13754
G1 X150.987 Y186.583
G1 X147.917 Y183.513 E.13339
G1 X147.917 Y184.046
G1 X150.454 Y186.583 E.11022
G1 X149.92 Y186.583
G1 X147.917 Y184.58 E.08704
G1 X147.917 Y185.113
G1 X149.387 Y186.583 E.06387
G1 X148.854 Y186.583
G1 X147.917 Y185.646 E.0407
G1 X147.917 Y186.179
G1 X148.321 Y186.583 E.01752
M204 S10000
; WIPE_START
G1 F24000
G1 X147.917 Y186.179 E-.2167
G1 X147.917 Y185.646 E-.20264
G1 X148.551 Y186.28 E-.34065
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.4 I1.217 J-.009 P1  F30000
G1 X147.71 Y72.79 Z25.4
G1 Z25
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
G1 F1200
G1 X147.71 Y69.21 E.11
G1 X152.474 Y69.21 E.14639
G1 X152.474 Y72.79 E.11
G1 X147.77 Y72.79 E.14455
M204 S10000
; WIPE_START
G1 F24000
G1 X147.736 Y70.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.4 I.401 J1.149 P1  F30000
G1 X151.674 Y69.417 Z25.4
G1 Z25
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F1200
G1 X152.267 Y70.01 E.02574
G1 X152.267 Y70.543
G1 X151.141 Y69.417 E.04891
G1 X150.608 Y69.417
G1 X152.267 Y71.076 E.07209
G1 X152.267 Y71.61
G1 X150.075 Y69.417 E.09526
G1 X149.541 Y69.417
G1 X152.267 Y72.143 E.11843
G1 X152.173 Y72.583
G1 X149.008 Y69.417 E.13754
G1 X148.475 Y69.417
G1 X151.64 Y72.583 E.13754
G1 X151.107 Y72.583
G1 X147.942 Y69.417 E.13754
G1 X147.917 Y69.926
G1 X150.574 Y72.583 E.11542
G1 X150.04 Y72.583
G1 X147.917 Y70.46 E.09225
G1 X147.917 Y70.993
G1 X149.507 Y72.583 E.06908
G1 X148.974 Y72.583
G1 X147.917 Y71.526 E.0459
G1 X147.917 Y72.06
G1 X148.44 Y72.583 E.02273
M204 S10000
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X147.917 Y72.06 E-.2811
G1 X147.917 Y71.526 E-.20264
G1 X148.431 Y72.04 E-.27626
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
G1 Z25.5 F900 ; lower z a little
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

    G1 Z125 F600
    G1 Z123

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

