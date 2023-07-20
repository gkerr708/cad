; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 20m 30s; total estimated time: 26m 19s
; total layer number: 138
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
M73 P0 R26
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
M73 P16 R21
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

M73 P17 R21
G1 X70 F9000
M73 P18 R21
G1 X76 F15000
G1 X65 F15000
M73 P19 R21
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
    G29 A X116.329 Y120.329 I27.3416 J19.3416
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
; layer num/total_layer_count: 1/138
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
G1 X117.926 Y119.797 F30000
G1 Z.4
M73 P20 R21
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
G1 F3000
G1 X118.419 Y119.386 E.0239
G1 X118.964 Y119.053 E.0238
M73 P20 R20
G1 X119.75 Y118.742 E.03148
G1 X120.43 Y118.596 E.02589
G1 X121.008 Y118.558 E.02157
G1 X138.992 Y118.558 E.66984
G1 X139.64 Y118.606 E.02422
G1 X140.263 Y118.746 E.02377
G1 X141.106 Y119.103 E.03411
G1 X141.724 Y119.5 E.02737
G1 X142.203 Y119.926 E.02386
G1 X142.614 Y120.419 E.0239
G1 X142.947 Y120.964 E.0238
G1 X143.258 Y121.75 E.03148
G1 X143.404 Y122.43 E.02589
G1 X143.442 Y123.008 E.02157
G1 X143.442 Y132.992 E.37187
M73 P21 R20
G1 X143.394 Y133.64 E.02422
G1 X143.254 Y134.261 E.02373
G1 X142.851 Y135.189 E.03766
G1 X142.501 Y135.724 E.02381
G1 X142.074 Y136.203 E.0239
G1 X141.581 Y136.614 E.0239
G1 X141.036 Y136.947 E.0238
G1 X140.25 Y137.258 E.03148
G1 X139.57 Y137.404 E.02589
G1 X138.992 Y137.442 E.02157
G1 X121.008 Y137.442 E.66984
G1 X120.36 Y137.394 E.02422
G1 X119.737 Y137.254 E.02377
G1 X118.894 Y136.897 E.03411
G1 X118.276 Y136.5 E.02737
G1 X117.797 Y136.074 E.02386
G1 X117.386 Y135.581 E.0239
G1 X117.053 Y135.036 E.0238
G1 X116.742 Y134.25 E.03148
G1 X116.596 Y133.57 E.02589
G1 X116.558 Y132.992 E.02157
G1 X116.558 Y128.508 E.16701
G1 X116.592 Y128.013 E.01849
G1 X116.558 Y127.492 E.01944
G1 X116.558 Y123.008 E.16701
G1 X116.606 Y122.36 E.02422
G1 X116.746 Y121.737 E.02377
G1 X117.103 Y120.894 E.03411
G1 X117.5 Y120.276 E.02737
G1 X117.886 Y119.842 E.02163
G1 X118.228 Y120.148 F30000
M73 P22 R20
G1 F3000
G1 X118.253 Y120.12 E.00139
G1 X118.678 Y119.765 E.02062
G1 X119.18 Y119.459 E.02189
G1 X119.873 Y119.185 E.02775
G1 X120.483 Y119.052 E.02329
G1 X121.018 Y119.015 E.01996
G1 X138.98 Y119.015 E.669
G1 X139.582 Y119.061 E.02251
G1 X140.133 Y119.188 E.02106
G1 X140.881 Y119.505 E.03025
G1 X141.455 Y119.873 E.02541
G1 X141.88 Y120.253 E.02123
G1 X142.235 Y120.678 E.02062
G1 X142.53 Y121.159 E.02102
G1 X142.815 Y121.873 E.02862
G1 X142.951 Y122.503 E.02403
G1 X142.985 Y123.027 E.01956
G1 X142.985 Y132.97 E.37032
G1 X142.942 Y133.562 E.02214
G1 X142.812 Y134.131 E.02171
G1 X142.441 Y134.981 E.03455
G1 X142.13 Y135.453 E.02105
G1 X141.762 Y135.866 E.02062
G1 X141.322 Y136.235 E.02138
G1 X140.82 Y136.541 E.02189
G1 X140.127 Y136.815 E.02775
G1 X139.517 Y136.948 E.02329
G1 X138.982 Y136.985 E.01996
G1 X121.02 Y136.985 E.669
G1 X120.438 Y136.942 E.02176
G1 X119.89 Y136.82 E.0209
G1 X119.119 Y136.495 E.03116
G1 X118.545 Y136.127 E.02541
G1 X118.12 Y135.747 E.02123
G1 X117.765 Y135.322 E.02062
G1 X117.459 Y134.82 E.02189
G1 X117.185 Y134.127 E.02775
G1 X117.052 Y133.517 E.02329
G1 X117.015 Y132.982 E.01996
G1 X117.015 Y128.529 E.16585
G1 X117.048 Y127.975 E.02069
G1 X117.015 Y127.473 E.01873
G1 X117.015 Y123.02 E.16584
G1 X117.058 Y122.438 E.02176
G1 X117.18 Y121.89 E.0209
G1 X117.505 Y121.119 E.03116
G1 X117.873 Y120.545 E.02541
G1 X118.188 Y120.192 E.0176
G1 X118.528 Y120.497 F30000
G1 F3000
G1 X118.564 Y120.457 E.00202
G1 X118.937 Y120.144 E.0181
G1 X119.395 Y119.866 E.01998
G1 X119.996 Y119.628 E.02407
G1 X120.538 Y119.508 E.0207
G1 X121.039 Y119.472 E.01868
G1 X138.957 Y119.472 E.66739
G1 X139.503 Y119.514 E.0204
G1 X140.003 Y119.629 E.01911
G1 X140.656 Y119.906 E.02643
G1 X141.186 Y120.245 E.02343
G1 X141.557 Y120.579 E.01858
G1 X141.868 Y120.954 E.01814
G1 X142.114 Y121.354 E.01752
G1 X142.372 Y121.996 E.02574
G1 X142.498 Y122.577 E.02214
G1 X142.528 Y123.047 E.01754
G1 X142.528 Y132.948 E.36878
G1 X142.489 Y133.484 E.02003
G1 X142.371 Y133.999 E.01967
G1 X142.031 Y134.771 E.03144
G1 X141.772 Y135.165 E.01756
G1 X141.449 Y135.53 E.01814
G1 X141.063 Y135.856 E.01883
G1 X140.605 Y136.134 E.01996
G1 X140.004 Y136.372 E.02407
G1 X139.462 Y136.492 E.0207
G1 X138.961 Y136.528 E.01868
G1 X121.042 Y136.528 E.66742
G1 X120.515 Y136.489 E.01971
G1 X120.041 Y136.385 E.01805
G1 X119.343 Y136.094 E.02818
G1 X118.814 Y135.755 E.02341
G1 X118.457 Y135.436 E.01784
G1 X118.144 Y135.063 E.0181
G1 X117.866 Y134.605 E.01998
G1 X117.628 Y134.004 E.02407
G1 X117.508 Y133.462 E.0207
G1 X117.473 Y132.971 E.01833
G1 X117.472 Y128.547 E.16478
G1 X117.504 Y128.01 E.02004
G1 X117.472 Y127.453 E.02075
G1 X117.473 Y123.032 E.16467
G1 X117.511 Y122.515 E.01933
G1 X117.615 Y122.041 E.01805
G1 X117.906 Y121.343 E.02818
G1 X118.245 Y120.814 E.02341
G1 X118.488 Y120.542 E.01359
G1 X118.829 Y120.848 F30000
G1 F3000
G1 X118.891 Y120.779 E.00346
G1 X119.196 Y120.523 E.01483
G1 X119.61 Y120.272 E.01805
G1 X120.12 Y120.07 E.02043
G1 X120.594 Y119.964 E.01811
G1 X121.06 Y119.929 E.01737
G1 X138.934 Y119.929 E.66577
G1 X139.424 Y119.966 E.01827
G1 X139.872 Y120.07 E.01716
G1 X140.432 Y120.307 E.02263
G1 X140.917 Y120.617 E.02143
G1 X141.233 Y120.904 E.0159
G1 X141.489 Y121.213 E.01495
G1 X141.698 Y121.551 E.0148
G1 X141.929 Y122.119 E.02285
G1 X142.044 Y122.65 E.02024
G1 X142.071 Y123.066 E.01551
G1 X142.071 Y132.926 E.36726
G1 X142.036 Y133.406 E.01791
G1 X141.93 Y133.867 E.01761
G1 X141.622 Y134.562 E.02833
G1 X141.402 Y134.894 E.01485
G1 X141.136 Y135.195 E.01495
G1 X140.803 Y135.477 E.01623
G1 X140.39 Y135.728 E.01801
G1 X139.88 Y135.93 E.02043
G1 X139.406 Y136.036 E.01811
G1 X138.94 Y136.071 E.01737
G1 X121.064 Y136.071 E.66582
G1 X120.591 Y136.036 E.01768
G1 X120.192 Y135.95 E.0152
G1 X119.567 Y135.692 E.02517
G1 X119.083 Y135.382 E.0214
G1 X118.779 Y135.109 E.01521
G1 X118.523 Y134.804 E.01483
G1 X118.272 Y134.39 E.01805
G1 X118.07 Y133.88 E.02043
G1 X117.963 Y133.405 E.01812
G1 X117.93 Y132.959 E.01666
G1 X117.929 Y128.564 E.1637
G1 X117.959 Y127.976 E.02193
G1 X117.929 Y127.437 E.02013
G1 X117.93 Y123.044 E.1636
G1 X117.964 Y122.591 E.01694
G1 X118.05 Y122.192 E.01521
G1 X118.308 Y121.567 E.02517
G1 X118.618 Y121.083 E.0214
G1 X118.789 Y120.893 E.00952
G1 X119.128 Y121.201 F30000
G1 F3000
G1 X119.216 Y121.103 E.00492
G1 X119.472 Y120.891 E.01237
G1 X119.825 Y120.679 E.01533
G1 X120.245 Y120.512 E.01684
G1 X120.652 Y120.419 E.01554
G1 X121.081 Y120.386 E.01605
G1 X138.912 Y120.386 E.66413
G1 X139.344 Y120.418 E.01613
G1 X139.741 Y120.511 E.0152
G1 X140.228 Y120.719 E.01971
G1 X140.647 Y120.989 E.01856
G1 X140.908 Y121.228 E.01319
G1 X141.111 Y121.473 E.01184
G1 X141.283 Y121.749 E.0121
G1 X141.486 Y122.244 E.01994
G1 X141.591 Y122.724 E.01831
G1 X141.614 Y123.085 E.01347
G1 X141.614 Y132.905 E.36575
G1 X141.584 Y133.327 E.01576
G1 X141.489 Y133.733 E.01554
G1 X141.213 Y134.351 E.02521
G1 X141.032 Y134.622 E.01215
G1 X140.821 Y134.86 E.01184
G1 X140.526 Y135.111 E.01443
G1 X140.175 Y135.321 E.01524
G1 X139.755 Y135.488 E.01684
G1 X139.348 Y135.581 E.01554
G1 X138.919 Y135.614 E.01605
G1 X121.086 Y135.614 E.66421
G1 X120.665 Y135.583 E.0157
G1 X120.34 Y135.515 E.01238
G1 X119.79 Y135.29 E.02213
G1 X119.352 Y135.01 E.01935
G1 X119.103 Y134.784 E.01255
G1 X118.891 Y134.528 E.01237
G1 X118.679 Y134.175 E.01533
G1 X118.512 Y133.755 E.01684
G1 X118.419 Y133.347 E.01556
G1 X118.387 Y132.947 E.01495
G1 X118.386 Y128.579 E.16268
G1 X118.416 Y128.007 E.02136
G1 X118.386 Y127.42 E.02189
G1 X118.388 Y123.056 E.16254
G1 X118.416 Y122.666 E.01458
G1 X118.485 Y122.34 E.01239
G1 X118.71 Y121.79 E.02213
G1 X118.99 Y121.352 E.01935
G1 X119.087 Y121.245 E.00539
G1 X119.447 Y121.56 F30000
G1 F3000
G1 X119.566 Y121.424 E.00674
G1 X119.934 Y121.15 E.0171
G1 X120.277 Y120.986 E.01414
G1 X120.649 Y120.884 E.01438
G1 X121.035 Y120.843 E.01444
G1 X138.957 Y120.843 E.66755
G1 X139.532 Y120.931 E.02165
G1 X139.658 Y120.969 E.00489
G1 X140.045 Y121.141 E.01577
G1 X140.157 Y121.209 E.00488
G1 X140.555 Y121.537 E.01924
G1 X140.728 Y121.741 E.00995
G1 X140.869 Y121.962 E.00975
G1 X140.981 Y122.193 E.00956
G1 X141.071 Y122.445 E.00996
G1 X141.157 Y123.039 E.02237
G1 X141.157 Y132.957 E.36943
G1 X141.069 Y133.532 E.02165
G1 X141.031 Y133.658 E.00489
G1 X140.859 Y134.045 E.01577
G1 X140.791 Y134.157 E.00488
G1 X140.463 Y134.555 E.01924
G1 X140.259 Y134.728 E.00995
G1 X140.038 Y134.869 E.00975
G1 X139.807 Y134.981 E.00956
G1 X139.555 Y135.071 E.00996
G1 X138.961 Y135.157 E.02237
G1 X121.043 Y135.157 E.6674
G1 X120.468 Y135.069 E.02165
G1 X120.342 Y135.031 E.00489
G1 X119.955 Y134.859 E.01577
G1 X119.843 Y134.791 E.00488
G1 X119.444 Y134.462 E.01928
G1 X119.17 Y134.106 E.01672
G1 X119.018 Y133.806 E.01252
G1 X118.929 Y133.553 E.01002
G1 X118.855 Y133.125 E.01617
G1 X118.843 Y128.545 E.1706
G1 X118.919 Y128 E.02049
G1 X118.843 Y127.463 E.02019
G1 X118.849 Y122.962 E.16764
G1 X118.92 Y122.501 E.0174
G1 X119.05 Y122.125 E.01481
G1 X119.255 Y121.779 E.01495
G1 X119.407 Y121.605 E.00862
G1 X119.754 Y121.893 F30000
G1 F3000
G1 X119.839 Y121.791 E.00495
G1 X120.131 Y121.562 E.01381
G1 X120.398 Y121.427 E.01117
G1 X120.692 Y121.339 E.01142
G1 X121.027 Y121.3 E.01257
G1 X138.968 Y121.3 E.66821
G1 X139.464 Y121.383 E.01875
G1 X139.867 Y121.562 E.01642
G1 X140.204 Y121.829 E.01602
G1 X140.345 Y121.991 E.00799
G1 X140.455 Y122.154 E.00732
G1 X140.574 Y122.399 E.01015
G1 X140.641 Y122.6 E.00786
G1 X140.7 Y123.029 E.01614
G1 X140.7 Y132.968 E.37019
G1 X140.617 Y133.464 E.01875
G1 X140.438 Y133.867 E.01642
G1 X140.171 Y134.204 E.01602
G1 X140.009 Y134.345 E.00799
G1 X139.846 Y134.455 E.00732
G1 X139.601 Y134.574 E.01015
G1 X139.4 Y134.641 E.00786
G1 X138.971 Y134.7 E.01614
G1 X121.032 Y134.7 E.66816
G1 X120.536 Y134.617 E.01875
G1 X120.133 Y134.438 E.01642
G1 X119.796 Y134.171 E.01602
G1 X119.655 Y134.009 E.00799
G1 X119.545 Y133.846 E.00732
G1 X119.426 Y133.601 E.01015
G1 X119.359 Y133.399 E.0079
G1 X119.305 Y133.047 E.01328
G1 X119.3 Y128.534 E.16809
G1 X119.385 Y128.022 E.01932
G1 X119.3 Y127.473 E.02071
G1 X119.3 Y123.032 E.16539
G1 X119.353 Y122.644 E.01458
G1 X119.443 Y122.358 E.01116
G1 X119.6 Y122.078 E.01199
G1 X119.716 Y121.939 E.00672
G1 X120.067 Y122.231 F30000
G1 F3000
G1 X120.196 Y122.075 E.00752
G1 X120.403 Y121.929 E.00943
G1 X120.6 Y121.837 E.00811
G1 X120.742 Y121.794 E.00551
G1 X121.019 Y121.757 E.01044
G1 X138.977 Y121.757 E.66885
G1 X139.289 Y121.805 E.01174
G1 X139.588 Y121.924 E.01202
G1 X139.851 Y122.12 E.0122
G1 X140.006 Y122.298 E.00878
G1 X140.069 Y122.399 E.00445
G1 X140.163 Y122.6 E.00826
G1 X140.206 Y122.742 E.00551
G1 X140.243 Y123.019 E.01044
G1 X140.243 Y132.977 E.37088
G1 X140.195 Y133.289 E.01174
G1 X140.076 Y133.588 E.01202
G1 X139.88 Y133.851 E.0122
G1 X139.702 Y134.006 E.00878
G1 X139.601 Y134.069 E.00445
G1 X139.4 Y134.163 E.00826
G1 X139.258 Y134.206 E.00551
G1 X138.981 Y134.243 E.01044
G1 X121.023 Y134.243 E.66885
G1 X120.711 Y134.195 E.01174
G1 X120.412 Y134.076 E.01202
G1 X120.149 Y133.88 E.0122
G1 X119.994 Y133.702 E.00878
G1 X119.931 Y133.601 E.00445
G1 X119.837 Y133.4 E.00826
G1 X119.794 Y133.258 E.00551
G1 X119.757 Y132.981 E.01044
G1 X119.757 Y128.523 E.16603
G1 X119.805 Y128.21 E.01179
G1 X119.863 Y128.045 E.0065
G1 X119.863 Y127.955 E.00336
G1 X119.793 Y127.755 E.0079
G1 X119.757 Y127.481 E.0103
G1 X119.757 Y123.023 E.16603
G1 X119.806 Y122.705 E.01198
G1 X119.878 Y122.497 E.00819
G1 X119.944 Y122.379 E.00504
G1 X120.029 Y122.277 E.00494
G1 X120.388 Y122.55 F30000
G1 F3000
G1 X120.473 Y122.439 E.00519
G1 X120.586 Y122.348 E.00541
G1 X120.803 Y122.246 E.00892
G1 X121.011 Y122.214 E.00781
G1 X138.988 Y122.214 E.66958
G1 X139.218 Y122.257 E.00871
G1 X139.409 Y122.344 E.00783
G1 X139.561 Y122.473 E.00743
G1 X139.652 Y122.586 E.00541
G1 X139.754 Y122.803 E.00892
G1 X139.786 Y123.011 E.00782
G1 X139.786 Y132.988 E.37161
G1 X139.743 Y133.218 E.00872
G1 X139.656 Y133.409 E.00783
G1 X139.527 Y133.561 E.00743
G1 X139.414 Y133.652 E.00541
G1 X139.197 Y133.754 E.00892
G1 X138.989 Y133.786 E.00782
G1 X121.012 Y133.786 E.66958
G1 X120.782 Y133.743 E.00872
G1 X120.591 Y133.656 E.00783
G1 X120.439 Y133.527 E.00743
G1 X120.348 Y133.414 E.00541
G1 X120.246 Y133.197 E.00892
G1 X120.214 Y132.989 E.00781
G1 X120.214 Y128.512 E.16675
G1 X120.256 Y128.284 E.00866
G1 X120.365 Y128.06 E.00928
G1 X120.365 Y127.94 E.00446
G1 X120.246 Y127.696 E.0101
G1 X120.214 Y127.489 E.00778
G1 X120.214 Y123.012 E.16675
G1 X120.257 Y122.779 E.00884
G1 X120.304 Y122.66 E.00475
G1 X120.352 Y122.598 E.00294
G1 X120.742 Y122.813 F30000
G1 F3000
G1 X120.747 Y122.805 E.00037
G1 X120.884 Y122.696 E.00652
G1 X121 Y122.671 E.00442
G1 X139 Y122.671 E.67043
G1 X139.111 Y122.7 E.00426
G1 X139.195 Y122.747 E.00361
G1 X139.304 Y122.884 E.00652
G1 X139.329 Y123 E.00442
G1 X139.329 Y133 E.37246
G1 X139.3 Y133.111 E.00426
G1 X139.253 Y133.195 E.00361
G1 X139.116 Y133.304 E.00652
G1 X139 Y133.329 E.00442
G1 X121 Y133.329 E.67043
G1 X120.889 Y133.3 E.00426
G1 X120.805 Y133.253 E.00361
G1 X120.696 Y133.116 E.00652
G1 X120.671 Y133 E.00442
G1 X120.671 Y128.5 E.16761
G1 X120.7 Y128.389 E.00426
G1 X120.747 Y128.305 E.00361
G1 X120.884 Y128.196 E.00652
G1 X120.937 Y128.18 E.00206
G1 X123 Y128.171 E.07685
G1 X123.111 Y128.2 E.00426
G1 X123.195 Y128.247 E.00361
G1 X123.304 Y128.384 E.00652
M73 P23 R20
G1 X123.329 Y128.5 E.00442
G1 X123.329 Y130.671 E.08088
G1 X135.671 Y130.671 E.45973
G1 X135.671 Y125.329 E.199
G1 X123.329 Y125.329 E.45973
G1 X123.329 Y127.5 E.08088
G1 X123.3 Y127.611 E.00426
G1 X123.253 Y127.695 E.00361
G1 X123.116 Y127.804 E.00652
G1 X123 Y127.829 E.00442
G1 X121 Y127.829 E.07449
G1 X120.889 Y127.8 E.00426
G1 X120.805 Y127.753 E.00361
G1 X120.696 Y127.616 E.00652
G1 X120.671 Y127.5 E.00442
G1 X120.671 Y123 E.16761
G1 X120.7 Y122.889 E.00426
G1 X120.713 Y122.866 E.001
; WIPE_START
G1 F24000
G1 X120.747 Y122.805 E-.0266
G1 X120.884 Y122.696 E-.06647
G1 X121 Y122.671 E-.04514
G1 X122.636 Y122.671 E-.62179
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.137 J.433 P1  F30000
G1 X123.833 Y125.819 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X123.923 Y125.786 E.00355
G1 X135.077 Y125.786 E.41546
G1 X135.181 Y125.833 E.00426
G1 X135.214 Y125.923 E.00355
G1 X135.214 Y130.077 E.15474
G1 X135.167 Y130.181 E.00426
G1 X135.077 Y130.214 E.00355
G1 X123.923 Y130.214 E.41546
G1 X123.819 Y130.167 E.00426
G1 X123.786 Y130.077 E.00355
G1 X123.786 Y128.511 E.05835
G1 X123.754 Y128.304 E.00778
G1 X123.635 Y128.06 E.0101
G1 X123.635 Y127.94 E.00446
G1 X123.744 Y127.716 E.00928
G1 X123.786 Y127.488 E.00866
G1 X123.786 Y125.923 E.05828
G1 X123.808 Y125.873 E.00203
G1 X124.29 Y126.276 F30000
G1 F3000
G1 X124.38 Y126.243 E.00355
G1 X134.62 Y126.243 E.38141
G1 X134.724 Y126.29 E.00426
G1 X134.757 Y126.38 E.00355
G1 X134.757 Y129.62 E.12069
G1 X134.71 Y129.724 E.00426
G1 X134.62 Y129.757 E.00355
G1 X124.38 Y129.757 E.38141
G1 X124.276 Y129.71 E.00426
G1 X124.243 Y129.62 E.00355
G1 X124.243 Y128.519 E.041
G1 X124.207 Y128.245 E.0103
G1 X124.137 Y128.045 E.0079
G1 X124.137 Y127.955 E.00336
G1 X124.195 Y127.79 E.0065
G1 X124.243 Y127.477 E.01179
G1 X124.243 Y126.38 E.04087
G1 X124.265 Y126.33 E.00203
G1 X124.747 Y126.733 F30000
G1 F3000
G1 X124.837 Y126.7 E.00355
G1 X134.163 Y126.7 E.34737
G1 X134.267 Y126.747 E.00426
G1 X134.3 Y126.837 E.00355
G1 X134.3 Y129.163 E.08664
G1 X134.253 Y129.267 E.00426
G1 X134.163 Y129.3 E.00355
G1 X124.837 Y129.3 E.34737
G1 X124.733 Y129.253 E.00426
G1 X124.7 Y129.164 E.00352
G1 X124.695 Y128.452 E.02653
G1 X124.615 Y127.978 E.01791
G1 X124.7 Y127.466 E.01932
G1 X124.7 Y126.837 E.02343
G1 X124.722 Y126.787 E.00203
G1 X125.208 Y127.187 F30000
G1 F3000
G1 X125.294 Y127.157 E.00341
G1 X133.706 Y127.157 E.31332
G1 X133.81 Y127.205 E.00426
G1 X133.843 Y127.294 E.00355
G1 X133.843 Y128.706 E.05259
G1 X133.795 Y128.81 E.00426
G1 X133.706 Y128.843 E.00355
G1 X125.291 Y128.843 E.31343
G1 X125.187 Y128.795 E.00426
G1 X125.154 Y128.71 E.00342
G1 X125.144 Y128.367 E.01278
G1 X125.082 Y127.955 E.01553
G1 X125.149 Y127.549 E.0153
G1 X125.157 Y127.29 E.00967
G1 X125.181 Y127.241 E.00203
G1 X125.647 Y127.634 F30000
G1 F3000
G1 X125.718 Y127.614 E.00276
G1 X133.249 Y127.614 E.28049
G1 X133.353 Y127.662 E.00426
G1 X133.386 Y127.751 E.00355
G1 X133.386 Y128.249 E.01854
G1 X133.338 Y128.353 E.00426
G1 X133.249 Y128.386 E.00355
G1 X125.727 Y128.386 E.28016
G1 X125.623 Y128.338 E.00426
G1 X125.592 Y128.269 E.00283
G1 X125.548 Y127.979 E.01091
G1 X125.583 Y127.729 E.00943
G1 X125.613 Y127.684 E.00203
; WIPE_START
G1 F24000
G1 X125.718 Y127.614 E-.04785
G1 X127.592 Y127.614 E-.71215
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.654 J-1.026 P1  F30000
G1 X122.143 Y124.143 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X122.143 Y126.643 E.09312
G1 X121.857 Y126.643 E.01065
G1 X121.857 Y123.857 E.10376
G1 X138.143 Y123.857 E.60659
G1 X138.143 Y132.143 E.30862
G1 X121.857 Y132.143 E.60659
G1 X121.857 Y129.357 E.10376
G1 X122.143 Y129.357 E.01065
G1 X122.143 Y131.857 E.09312
G1 X136.857 Y131.857 E.54805
G1 X136.857 Y124.143 E.28732
G1 X122.203 Y124.143 E.54581
G1 X122.6 Y124.6 F30000
; FEATURE: Outer wall
G1 F3000
G1 X122.6 Y127.1 E.09312
G1 X121.4 Y127.1 E.0447
G1 X121.4 Y123.4 E.13781
G1 X138.6 Y123.4 E.64063
G1 X138.6 Y132.6 E.34267
G1 X121.4 Y132.6 E.64063
G1 X121.4 Y128.9 E.13781
G1 X122.6 Y128.9 E.0447
G1 X122.6 Y131.4 E.09312
G1 X136.4 Y131.4 E.514
G1 X136.4 Y124.6 E.25327
G1 X122.66 Y124.6 E.51176
; WIPE_START
G1 F24000
G1 X122.612 Y126.599 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.207 J1.199 P1  F30000
G1 X137.04 Y124.105 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.528746
G1 F6300
G1 X137.754 Y124.819 E.04
G1 X137.754 Y125.506 E.0272
G1 X137.246 Y124.997 E.02849
G1 X137.246 Y125.684 E.0272
G1 X137.754 Y126.193 E.02849
G1 X137.754 Y126.88 E.0272
G1 X137.246 Y126.372 E.02849
G1 X137.246 Y127.059 E.0272
G1 X137.754 Y127.567 E.02849
G1 X137.754 Y128.254 E.0272
G1 X137.246 Y127.746 E.02849
G1 X137.246 Y128.433 E.0272
G1 X137.754 Y128.942 E.02849
G1 X137.754 Y129.629 E.0272
G1 X137.246 Y129.12 E.02849
G1 X137.246 Y129.807 E.0272
G1 X137.754 Y130.316 E.02849
G1 X137.754 Y131.003 E.0272
G1 X137.246 Y130.494 E.02849
G1 X137.246 Y131.181 E.0272
G1 X137.96 Y131.895 E.04
M106 S252.45
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X137.246 Y131.181 E-.38398
G1 X137.246 Y130.494 E-.26108
G1 X137.459 Y130.708 E-.11494
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/138
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
G3 Z.6 I.47 J-1.122 P1  F30000
G1 X122.398 Y124.398 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1970
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1970
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1970
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z.8
G1 Z.4
M73 P24 R20
G1 E.8 F1800
G1 F1970
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1970
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
M73 P24 R19
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1970
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1970
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1970
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/138
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
G3 Z.8 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z1
G1 Z.6
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/138
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
G3 Z1 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
M73 P25 R19
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/138
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
G3 Z1.2 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z1.4
G1 Z1
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
M73 P26 R19
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/138
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
G3 Z1.4 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2010
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X123.406 Y123.602 E.05985
G1 X123.406 Y124.398 E.0264
G1 X122.458 Y124.398 E.03146
; WIPE_START
G1 F24000
G1 X122.41 Y126.397 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.676 J1.012 P1  F30000
G1 X126.594 Y123.602 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F2010
G1 X138.398 Y123.602 E.39157
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X126.594 Y124.398 E.332
G1 X126.594 Y123.662 E.02441
; WIPE_START
G1 F24000
G1 X128.594 Y123.652 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.234 J-1.194 P1  F30000
G1 X122.79 Y124.79 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2010
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
G1 X123.203 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F2010
G1 X122.194 Y124 E.03195
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F2010
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2010
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F2010
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F2010
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F2010
G1 X126.797 Y124 E.31706
G1 X125.685 Y124.583 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2010
G1 X126.371 Y123.896 E.02982
G1 X126.317 Y123.417
G1 X125.152 Y124.583 E.05063
G1 X124.618 Y124.583
G1 X125.784 Y123.417 E.05063
G1 X125.25 Y123.417
G1 X124.085 Y124.583 E.05063
G1 X123.629 Y124.506
G1 X124.717 Y123.417 E.04729
G1 X124.184 Y123.417
G1 X123.629 Y123.972 E.02412
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.184 Y123.417 E-.29826
G1 X124.717 Y123.417 E-.20264
G1 X124.235 Y123.9 E-.2591
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/138
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
G3 Z1.6 I-1.208 J-.147 P1  F30000
G1 X123.199 Y132.398 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2024
G1 X121.602 Y132.398 E.05298
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X123.199 Y131.602 E.02658
G1 X123.199 Y132.338 E.02441
; WIPE_START
G1 F24000
G1 X121.602 Y132.398 E-.60735
G1 X121.602 Y131.996 E-.15265
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.032 J1.217 P1  F30000
G1 X136.602 Y131.602 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F2024
G1 X136.602 Y124.398 E.23898
G1 X126.118 Y124.398 E.34778
G1 X126.118 Y123.602 E.0264
G1 X138.398 Y123.602 E.40735
G1 X138.398 Y132.398 E.29177
G1 X126.801 Y132.398 E.3847
G1 X126.801 Y131.602 E.0264
G1 X136.542 Y131.602 E.32314
G1 X136.21 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2024
G1 X136.21 Y124.79 E.19727
G1 X125.726 Y124.79 E.32215
G1 X125.726 Y123.21 E.04855
G1 X138.79 Y123.21 E.40142
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.15 Y131.21 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X136.169 Y129.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.186 J.271 P1  F30000
G1 X136.806 Y132 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F2024
G1 X127.004 Y132 E.3105
G1 X126.578 Y131.778 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2024
G1 X126.218 Y131.417 E.01565
G1 X125.685 Y131.417
G1 X126.578 Y132.311 E.03882
G1 X126.317 Y132.583
G1 X125.152 Y131.417 E.05063
G1 X124.618 Y131.417
G1 X125.784 Y132.583 E.05063
G1 X125.25 Y132.583
G1 X124.085 Y131.417 E.05063
G1 X123.552 Y131.417
G1 X124.717 Y132.583 E.05063
G1 X124.184 Y132.583
G1 X123.422 Y131.82 E.03312
M204 S10000
G1 X122.996 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F2024
G1 X122.194 Y132 E.02539
G1 X122.114 Y131.983 E.0026
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00298
G1 X122 Y131.806 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.047 J.62 P1  F30000
G1 X126.321 Y124 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F2024
G1 X136.806 Y124 E.33213
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2024
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
M73 P27 R19
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F2024
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F2024
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
; WIPE_START
G1 F24000
G1 X137.378 Y125.017 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.05 J-1.216 P1  F30000
G1 X122.398 Y124.398 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2024
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X123.882 Y123.602 E.07563
G1 X123.882 Y124.398 E.0264
G1 X122.458 Y124.398 E.04724
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2024
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X124.274 Y123.21 E.09415
G1 X124.274 Y124.79 E.04855
G1 X122.85 Y124.79 E.04376
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F2024
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
G1 X122.194 Y124 F30000
G1 F2024
G1 X123.679 Y124 E.04702
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/138
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
G3 Z1.8 I-.568 J1.076 P1  F30000
G1 X136.602 Y131.602 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1905
G1 X136.602 Y124.398 E.23898
G1 X126.5 Y124.398 E.33511
G1 X126.5 Y123.602 E.0264
G1 X138.398 Y123.602 E.39468
G1 X138.398 Y132.398 E.29177
G1 X126.325 Y132.398 E.40048
G1 X126.325 Y131.602 E.0264
G1 X136.542 Y131.602 E.33892
G1 X136.21 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1905
G1 X136.21 Y124.79 E.19727
G1 X126.108 Y124.79 E.31041
G1 X126.108 Y123.21 E.04855
G1 X138.79 Y123.21 E.38969
G1 X138.79 Y132.79 E.29437
G1 X125.933 Y132.79 E.39506
G1 X125.933 Y131.21 E.04855
G1 X136.15 Y131.21 E.31394
M204 S10000
; WIPE_START
G1 F24000
G1 X136.169 Y129.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.186 J.271 P1  F30000
G1 X136.806 Y132 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1905
G1 X126.529 Y132 E.32557
; WIPE_START
G1 F24000
G1 X128.529 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.186 J-.271 P1  F30000
G1 X126.703 Y124 Z2
G1 Z1.6
G1 E.8 F1800
G1 F1905
G1 X136.806 Y124 E.32003
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1905
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1905
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1905
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
; WIPE_START
G1 F24000
G1 X137.378 Y125.017 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.465 J-1.125 P1  F30000
G1 X122.398 Y131.21 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1905
G1 X122.398 Y131.602 E.01301
G1 X123.675 Y131.602 E.04236
G1 X123.675 Y132.398 E.0264
G1 X121.602 Y132.398 E.06876
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.15 E.06793
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1905
G1 X124.067 Y131.21 E.03924
G1 X124.067 Y132.79 E.04855
G1 X121.21 Y132.79 E.08779
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X124.067 Y131.21 E-.4858
G1 X124.067 Y131.932 E-.2742
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.074 J-1.215 P1  F30000
G1 X122 Y131.806 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F1905
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X123.471 Y132 E.04046
G1 X122 Y131.806 F30000
G1 F1905
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1905
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X123.5 Y123.602 E.06296
G1 X123.5 Y124.398 E.0264
G1 X122.458 Y124.398 E.03457
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1905
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.892 Y123.21 E.08242
G1 X123.892 Y124.79 E.04855
G1 X122.85 Y124.79 E.03203
M204 S10000
G1 X123.297 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1905
G1 X122.194 Y124 E.03492
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/138
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
G3 Z2 I-.52 J1.1 P1  F30000
G1 X136.602 Y131.602 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1847
G1 X136.602 Y124.398 E.23898
G1 X126.728 Y124.398 E.32756
G1 X126.728 Y123.602 E.0264
G1 X138.398 Y123.602 E.38713
G1 X138.398 Y132.398 E.29177
G1 X126.595 Y132.398 E.39153
G1 X126.595 Y131.602 E.0264
G1 X136.542 Y131.602 E.32997
G1 X136.21 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1847
G1 X136.21 Y124.79 E.19727
G1 X126.335 Y124.79 E.30342
G1 X126.335 Y123.21 E.04855
G1 X138.79 Y123.21 E.38269
G1 X138.79 Y132.79 E.29437
G1 X126.203 Y132.79 E.38677
G1 X126.203 Y131.21 E.04855
G1 X136.15 Y131.21 E.30565
M204 S10000
; WIPE_START
G1 F24000
G1 X136.169 Y129.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.186 J.271 P1  F30000
G1 X136.806 Y132 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1847
G1 X126.798 Y132 E.31702
; WIPE_START
G1 F24000
G1 X128.798 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.185 J-.277 P1  F30000
G1 X126.931 Y124 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F1847
G1 X136.806 Y124 E.31282
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
M73 P27 R18
G1 F1847
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1847
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1847
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
M73 P28 R18
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
; WIPE_START
G1 F24000
G1 X137.378 Y125.017 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.465 J-1.125 P1  F30000
G1 X122.398 Y131.21 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1847
G1 X122.398 Y131.602 E.01301
G1 X123.405 Y131.602 E.03341
G1 X123.405 Y132.398 E.0264
G1 X121.602 Y132.398 E.05981
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.15 E.06793
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1847
G1 X123.797 Y131.21 E.03095
G1 X123.797 Y132.79 E.04855
G1 X121.21 Y132.79 E.0795
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
G1 X123.202 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1847
G1 X122.194 Y132 E.03191
G1 X122.114 Y131.983 E.0026
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00298
G1 X122 Y131.806 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1847
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X123.272 Y123.602 E.05541
G1 X123.272 Y124.398 E.0264
G1 X122.458 Y124.398 E.02702
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1847
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.665 Y123.21 E.07542
G1 X123.665 Y124.79 E.04855
G1 X122.85 Y124.79 E.02503
M204 S10000
G1 X123.069 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1847
G1 X122.194 Y124 E.0277
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/138
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
G3 Z2.2 I-.52 J1.1 P1  F30000
G1 X136.602 Y131.602 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1820
G1 X136.602 Y124.398 E.23898
G1 X126.894 Y124.398 E.32204
G1 X126.894 Y123.602 E.0264
G1 X138.398 Y123.602 E.38162
G1 X138.398 Y132.398 E.29177
G1 X126.772 Y132.398 E.38565
G1 X126.772 Y131.602 E.0264
G1 X136.542 Y131.602 E.32409
G1 X136.21 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1820
G1 X136.21 Y124.79 E.19727
G1 X126.502 Y124.79 E.29831
G1 X126.502 Y123.21 E.04855
G1 X138.79 Y123.21 E.37759
G1 X138.79 Y132.79 E.29437
G1 X126.38 Y132.79 E.38132
G1 X126.38 Y131.21 E.04855
G1 X136.15 Y131.21 E.3002
M204 S10000
; WIPE_START
G1 F24000
G1 X136.169 Y129.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.186 J.271 P1  F30000
G1 X136.806 Y132 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1820
G1 X126.976 Y132 E.31141
; WIPE_START
G1 F24000
G1 X128.976 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.185 J-.278 P1  F30000
G1 X127.097 Y124 Z2.4
G1 Z2
G1 E.8 F1800
G1 F1820
G1 X136.806 Y124 E.30755
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1820
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1820
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1820
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
; WIPE_START
G1 F24000
G1 X137.378 Y125.017 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.465 J-1.125 P1  F30000
G1 X122.398 Y131.21 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1820
G1 X122.398 Y131.602 E.01301
G1 X123.228 Y131.602 E.02753
G1 X123.228 Y132.398 E.0264
G1 X121.602 Y132.398 E.05393
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.15 E.06793
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1820
G1 X123.62 Y131.21 E.0255
G1 X123.62 Y132.79 E.04855
G1 X121.21 Y132.79 E.07405
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
G1 X123.024 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1820
G1 X122.194 Y132 E.02629
G1 X122.114 Y131.983 E.0026
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00298
G1 X122 Y131.806 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1820
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X123.106 Y123.602 E.0499
G1 X123.106 Y124.398 E.0264
G1 X122.458 Y124.398 E.02151
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1820
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.498 Y123.21 E.07032
G1 X123.498 Y124.79 E.04855
G1 X122.85 Y124.79 E.01992
M204 S10000
G1 X122.903 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1820
G1 X122.194 Y124 E.02244
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/138
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
G3 Z2.4 I-.52 J1.1 P1  F30000
G1 X136.602 Y131.602 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1803
G1 X136.602 Y124.398 E.23898
G1 X126.999 Y124.398 E.31856
G1 X126.999 Y123.602 E.0264
G1 X138.398 Y123.602 E.37813
G1 X138.398 Y132.398 E.29177
G1 X126.887 Y132.398 E.38185
G1 X126.887 Y131.602 E.0264
G1 X136.542 Y131.602 E.32029
G1 X136.21 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1803
G1 X136.21 Y124.79 E.19727
G1 X126.607 Y124.79 E.29509
G1 X126.607 Y123.21 E.04855
G1 X138.79 Y123.21 E.37436
G1 X138.79 Y132.79 E.29437
G1 X126.494 Y132.79 E.37781
G1 X126.494 Y131.21 E.04855
G1 X136.15 Y131.21 E.29669
M204 S10000
; WIPE_START
G1 F24000
G1 X136.169 Y129.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.186 J.271 P1  F30000
G1 X136.806 Y132 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1803
G1 X127.09 Y132 E.30778
; WIPE_START
G1 F24000
G1 X129.09 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.184 J-.28 P1  F30000
G1 X127.202 Y124 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F1803
G1 X136.806 Y124 E.30423
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1803
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1803
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
M73 P29 R18
G1 F1803
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
; WIPE_START
G1 F24000
G1 X137.378 Y125.017 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.465 J-1.125 P1  F30000
G1 X122.398 Y131.21 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1803
G1 X122.398 Y131.602 E.01301
G1 X123.113 Y131.602 E.02373
G1 X123.113 Y132.398 E.0264
G1 X121.602 Y132.398 E.05013
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.15 E.06793
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1803
G1 X123.506 Y131.21 E.02199
G1 X123.506 Y132.79 E.04855
G1 X121.21 Y132.79 E.07053
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
G1 X122.91 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1803
G1 X122.194 Y132 E.02267
G1 X122.114 Y131.983 E.0026
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00298
G1 X122 Y131.806 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1803
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X123.001 Y123.602 E.04642
G1 X123.001 Y124.398 E.0264
G1 X122.458 Y124.398 E.01803
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1803
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.393 Y123.21 E.06709
G1 X123.393 Y124.79 E.04855
G1 X122.85 Y124.79 E.0167
M204 S10000
G1 X122.798 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1803
G1 X122.194 Y124 E.01912
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/138
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
G3 Z2.6 I-.52 J1.1 P1  F30000
G1 X136.602 Y131.602 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1790
G1 X136.602 Y124.398 E.23898
G1 X127.076 Y124.398 E.316
G1 X127.076 Y123.602 E.0264
G1 X138.398 Y123.602 E.37557
G1 X138.398 Y132.398 E.29177
G1 X126.974 Y132.398 E.37896
G1 X126.974 Y131.602 E.0264
G1 X136.542 Y131.602 E.3174
G1 X136.21 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1790
G1 X136.21 Y124.79 E.19727
G1 X126.684 Y124.79 E.29271
G1 X126.684 Y123.21 E.04855
G1 X138.79 Y123.21 E.37199
G1 X138.79 Y132.79 E.29437
G1 X126.582 Y132.79 E.37513
G1 X126.582 Y131.21 E.04855
G1 X136.15 Y131.21 E.29401
M204 S10000
; WIPE_START
G1 F24000
G1 X136.169 Y129.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.186 J.271 P1  F30000
G1 X136.806 Y132 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1790
G1 X127.177 Y132 E.30502
; WIPE_START
G1 F24000
G1 X129.177 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.184 J-.281 P1  F30000
G1 X127.279 Y124 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F1790
G1 X136.806 Y124 E.30178
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1790
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1790
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1790
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
; WIPE_START
G1 F24000
G1 X137.378 Y125.017 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.465 J-1.125 P1  F30000
G1 X122.398 Y131.21 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1790
G1 X122.398 Y131.602 E.01301
G1 X123.026 Y131.602 E.02085
G1 X123.026 Y132.398 E.0264
G1 X121.602 Y132.398 E.04725
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.15 E.06793
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1790
G1 X123.418 Y131.21 E.01931
G1 X123.418 Y132.79 E.04855
G1 X121.21 Y132.79 E.06786
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
G1 X122.823 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1790
G1 X122.194 Y132 E.01991
G1 X122.114 Y131.983 E.0026
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00298
G1 X122 Y131.806 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1790
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X122.924 Y123.602 E.04385
G1 X122.924 Y124.398 E.0264
G1 X122.458 Y124.398 E.01546
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1790
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.316 Y123.21 E.06472
G1 X123.316 Y124.79 E.04855
G1 X122.85 Y124.79 E.01432
M204 S10000
G1 X122.721 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1790
G1 X122.194 Y124 E.01667
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/138
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
G3 Z2.8 I-.52 J1.1 P1  F30000
G1 X136.602 Y131.602 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1782
G1 X136.602 Y124.398 E.23898
G1 X127.125 Y124.398 E.31437
G1 X127.125 Y123.602 E.0264
G1 X138.398 Y123.602 E.37394
G1 X138.398 Y132.398 E.29177
G1 X127.023 Y132.398 E.37733
M73 P30 R18
G1 X127.023 Y131.602 E.0264
G1 X136.542 Y131.602 E.31577
G1 X136.21 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1782
G1 X136.21 Y124.79 E.19727
G1 X126.733 Y124.79 E.2912
G1 X126.733 Y123.21 E.04855
G1 X138.79 Y123.21 E.37047
G1 X138.79 Y132.79 E.29437
G1 X126.631 Y132.79 E.37362
G1 X126.631 Y131.21 E.04855
G1 X136.15 Y131.21 E.2925
M204 S10000
; WIPE_START
G1 F24000
G1 X136.169 Y129.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.186 J.271 P1  F30000
G1 X136.806 Y132 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1782
G1 X127.227 Y132 E.30346
; WIPE_START
G1 F24000
G1 X129.227 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.184 J-.281 P1  F30000
G1 X127.329 Y124 Z3
G1 Z2.6
G1 E.8 F1800
G1 F1782
G1 X136.806 Y124 E.30022
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1782
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1782
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1782
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
; WIPE_START
G1 F24000
G1 X137.378 Y125.017 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.465 J-1.125 P1  F30000
G1 X122.398 Y131.21 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1782
G1 X122.398 Y131.602 E.01301
G1 X122.977 Y131.602 E.01921
G1 X122.977 Y132.398 E.0264
G1 X121.602 Y132.398 E.04561
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.15 E.06793
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1782
G1 X123.369 Y131.21 E.01779
G1 X123.369 Y132.79 E.04855
G1 X121.21 Y132.79 E.06634
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
G1 X122.773 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1782
G1 X122.194 Y132 E.01835
G1 X122.114 Y131.983 E.0026
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00298
G1 X122 Y131.806 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1782
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X122.875 Y123.602 E.04222
G1 X122.875 Y124.398 E.0264
G1 X122.458 Y124.398 E.01383
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1782
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.267 Y123.21 E.0632
G1 X123.267 Y124.79 E.04855
G1 X122.85 Y124.79 E.01281
M204 S10000
G1 X122.671 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1782
G1 X122.194 Y124 E.01511
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/138
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
G3 Z3 I-.52 J1.1 P1  F30000
G1 X136.602 Y131.602 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1779
G1 X136.602 Y124.398 E.23898
G1 X127.141 Y124.398 E.31385
G1 X127.141 Y123.602 E.0264
G1 X138.398 Y123.602 E.37342
G1 X138.398 Y132.398 E.29177
G1 X127.042 Y132.398 E.37671
G1 X127.042 Y131.602 E.0264
G1 X136.542 Y131.602 E.31515
G1 X136.21 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1779
G1 X136.21 Y124.79 E.19727
G1 X126.749 Y124.79 E.29072
G1 X126.749 Y123.21 E.04855
G1 X138.79 Y123.21 E.37
G1 X138.79 Y132.79 E.29437
G1 X126.649 Y132.79 E.37305
G1 X126.649 Y131.21 E.04855
G1 X136.15 Y131.21 E.29193
M204 S10000
; WIPE_START
G1 F24000
G1 X136.169 Y129.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.186 J.271 P1  F30000
G1 X136.806 Y132 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1779
G1 X127.245 Y132 E.30287
; WIPE_START
G1 F24000
G1 X129.245 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.184 J-.281 P1  F30000
G1 X127.344 Y124 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F1779
G1 X136.806 Y124 E.29973
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1779
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1779
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1779
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
; WIPE_START
G1 F24000
G1 X137.378 Y125.017 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.465 J-1.125 P1  F30000
G1 X122.398 Y131.21 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1779
G1 X122.398 Y131.602 E.01301
G1 X122.958 Y131.602 E.0186
G1 X122.958 Y132.398 E.0264
G1 X121.602 Y132.398 E.04499
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.15 E.06793
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1779
G1 X123.351 Y131.21 E.01722
M73 P31 R18
G1 X123.351 Y132.79 E.04855
G1 X121.21 Y132.79 E.06577
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
G1 X122.755 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1779
G1 X122.194 Y132 E.01776
G1 X122.114 Y131.983 E.0026
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00298
G1 X122 Y131.806 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1779
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X122.859 Y123.602 E.0417
G1 X122.859 Y124.398 E.0264
G1 X122.458 Y124.398 E.01331
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1779
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.251 Y123.21 E.06272
G1 X123.251 Y124.79 E.04855
G1 X122.85 Y124.79 E.01233
M204 S10000
G1 X122.656 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1779
G1 X122.194 Y124 E.01461
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/138
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
G3 Z3.2 I-.52 J1.1 P1  F30000
G1 X136.602 Y131.602 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1779
G1 X136.602 Y124.398 E.23898
G1 X127.141 Y124.398 E.31385
G1 X127.141 Y123.602 E.0264
G1 X138.398 Y123.602 E.37342
G1 X138.398 Y132.398 E.29177
G1 X127.042 Y132.398 E.37671
G1 X127.042 Y131.602 E.0264
G1 X136.542 Y131.602 E.31515
G1 X136.21 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1779
G1 X136.21 Y124.79 E.19727
G1 X126.749 Y124.79 E.29072
G1 X126.749 Y123.21 E.04855
G1 X138.79 Y123.21 E.37
G1 X138.79 Y132.79 E.29437
G1 X126.649 Y132.79 E.37305
G1 X126.649 Y131.21 E.04855
G1 X136.15 Y131.21 E.29193
M204 S10000
; WIPE_START
G1 F24000
G1 X136.169 Y129.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.186 J.271 P1  F30000
G1 X136.806 Y132 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1779
G1 X127.245 Y132 E.30287
; WIPE_START
G1 F24000
G1 X129.245 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.184 J-.281 P1  F30000
G1 X127.344 Y124 Z3.4
G1 Z3
G1 E.8 F1800
G1 F1779
G1 X136.806 Y124 E.29973
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1779
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1779
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1779
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
; WIPE_START
G1 F24000
G1 X137.378 Y125.017 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.465 J-1.125 P1  F30000
G1 X122.398 Y131.21 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1779
G1 X122.398 Y131.602 E.01301
G1 X122.958 Y131.602 E.0186
G1 X122.958 Y132.398 E.0264
G1 X121.602 Y132.398 E.04499
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.15 E.06793
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1779
G1 X123.351 Y131.21 E.01722
G1 X123.351 Y132.79 E.04855
G1 X121.21 Y132.79 E.06577
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
G1 X122.755 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1779
G1 X122.194 Y132 E.01776
G1 X122.114 Y131.983 E.0026
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00298
G1 X122 Y131.806 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1779
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X122.859 Y123.602 E.0417
G1 X122.859 Y124.398 E.0264
G1 X122.458 Y124.398 E.01331
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1779
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.251 Y123.21 E.06272
G1 X123.251 Y124.79 E.04855
G1 X122.85 Y124.79 E.01233
M204 S10000
G1 X122.656 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1779
G1 X122.194 Y124 E.01461
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/138
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
G3 Z3.4 I-.52 J1.1 P1  F30000
G1 X136.602 Y131.602 Z3.4
G1 Z3.2
M73 P31 R17
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1790
G1 X136.602 Y124.398 E.23898
G1 X127.101 Y124.398 E.31518
G1 X127.101 Y123.602 E.0264
G1 X138.398 Y123.602 E.37475
G1 X138.398 Y132.398 E.29177
G1 X126.998 Y132.398 E.37815
G1 X126.998 Y131.602 E.0264
G1 X136.542 Y131.602 E.31658
G1 X136.21 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1790
G1 X136.21 Y124.79 E.19727
G1 X126.708 Y124.79 E.29196
G1 X126.708 Y123.21 E.04855
G1 X138.79 Y123.21 E.37123
G1 X138.79 Y132.79 E.29437
G1 X126.608 Y132.79 E.37431
G1 X126.608 Y131.21 E.04855
G1 X136.15 Y131.21 E.29319
M204 S10000
; WIPE_START
G1 F24000
G1 X136.169 Y129.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.186 J.271 P1  F30000
G1 X136.806 Y132 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1790
G1 X127.202 Y132 E.30424
; WIPE_START
G1 F24000
G1 X129.202 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.184 J-.281 P1  F30000
G1 X127.304 Y124 Z3.6
G1 Z3.2
G1 E.8 F1800
G1 F1790
G1 X136.806 Y124 E.301
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1790
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1790
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1790
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
M73 P32 R17
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
; WIPE_START
G1 F24000
G1 X137.378 Y125.017 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-.49 J-1.114 P1  F30000
G1 X122.398 Y131.602 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1790
G1 X123.002 Y131.602 E.02003
G1 X123.002 Y132.398 E.0264
G1 X121.602 Y132.398 E.04643
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.542 E.08094
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1790
G1 X123.392 Y131.21 E.01848
G1 X123.392 Y132.79 E.04855
G1 X121.21 Y132.79 E.06703
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
G1 X122.798 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1790
G1 X122.194 Y132 E.01913
G1 X122.114 Y131.983 E.0026
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00298
G1 X122 Y131.806 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1790
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X122.899 Y123.602 E.04304
G1 X122.899 Y124.398 E.0264
G1 X122.458 Y124.398 E.01465
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1790
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.292 Y123.21 E.06396
G1 X123.292 Y124.79 E.04855
G1 X122.85 Y124.79 E.01357
M204 S10000
G1 X122.696 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1790
G1 X122.194 Y124 E.01589
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/138
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
G3 Z3.6 I-.52 J1.1 P1  F30000
G1 X136.602 Y131.602 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1801
G1 X136.602 Y124.398 E.23898
G1 X127.051 Y124.398 E.31682
G1 X127.051 Y123.602 E.0264
G1 X138.398 Y123.602 E.37639
G1 X138.398 Y132.398 E.29177
G1 X126.939 Y132.398 E.38011
G1 X126.939 Y131.602 E.0264
G1 X136.542 Y131.602 E.31855
G1 X136.21 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1801
G1 X136.21 Y124.79 E.19727
G1 X126.667 Y124.79 E.29321
G1 X126.667 Y123.21 E.04855
G1 X138.79 Y123.21 E.37249
G1 X138.79 Y132.79 E.29437
G1 X126.565 Y132.79 E.37563
G1 X126.547 Y132.79 E.00056
G1 X126.547 Y131.21 E.04855
G1 X126.565 Y131.21 E.00056
G1 X136.15 Y131.21 E.29451
M204 S10000
; WIPE_START
G1 F24000
G1 X136.169 Y129.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.186 J.271 P1  F30000
G1 X136.806 Y132 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1801
G1 X127.143 Y132 E.30612
; WIPE_START
G1 F24000
G1 X129.143 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.184 J-.28 P1  F30000
G1 X127.255 Y124 Z3.8
G1 Z3.4
G1 E.8 F1800
G1 F1801
G1 X136.806 Y124 E.30257
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1801
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1801
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1801
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
; WIPE_START
G1 F24000
G1 X137.378 Y125.017 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-.49 J-1.114 P1  F30000
G1 X122.398 Y131.602 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1801
G1 X123.061 Y131.602 E.02199
G1 X123.061 Y132.398 E.0264
G1 X121.602 Y132.398 E.04839
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.542 E.08094
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1801
G1 X123.435 Y131.21 E.01981
G1 X123.453 Y131.21 E.00056
G1 X123.453 Y132.79 E.04855
G1 X123.435 Y132.79 E.00056
G1 X121.21 Y132.79 E.06836
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
G1 X122.857 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1801
G1 X122.194 Y132 E.021
G1 X122.114 Y131.983 E.0026
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00298
G1 X122 Y131.806 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1801
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X122.949 Y123.602 E.04467
G1 X122.949 Y124.398 E.0264
G1 X122.458 Y124.398 E.01628
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1801
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.333 Y123.21 E.06522
G1 X123.333 Y124.79 E.04855
G1 X122.85 Y124.79 E.01483
M204 S10000
G1 X122.745 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1801
G1 X122.194 Y124 E.01745
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/138
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
G3 Z3.8 I-.52 J1.1 P1  F30000
G1 X136.602 Y131.602 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1817
G1 X136.602 Y124.398 E.23898
G1 X126.946 Y124.398 E.3203
G1 X126.946 Y123.602 E.0264
G1 X138.398 Y123.602 E.37987
G1 X138.398 Y132.398 E.29177
G1 X126.834 Y132.398 E.38359
G1 X126.834 Y131.602 E.0264
G1 X136.542 Y131.602 E.32203
G1 X136.21 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1817
G1 X136.21 Y124.79 E.19727
G1 X126.618 Y124.79 E.29473
G1 X126.554 Y124.79 E.00197
G1 X126.554 Y123.21 E.04855
G1 X126.618 Y123.21 E.00197
G1 X138.79 Y123.21 E.37401
G1 X138.79 Y132.79 E.29437
G1 X126.506 Y132.79 E.37745
G1 X126.442 Y132.79 E.00197
G1 X126.442 Y131.21 E.04855
G1 X126.506 Y131.21 E.00197
G1 X136.15 Y131.21 E.29633
M204 S10000
; WIPE_START
G1 F24000
G1 X136.169 Y129.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.186 J.271 P1  F30000
G1 X136.806 Y132 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1817
G1 X127.038 Y132 E.30944
; WIPE_START
G1 F24000
G1 X129.038 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.184 J-.28 P1  F30000
G1 X127.15 Y124 Z4
G1 Z3.6
G1 E.8 F1800
G1 F1817
G1 X136.806 Y124 E.30589
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1817
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1817
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1817
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
M73 P33 R17
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
; WIPE_START
G1 F24000
G1 X137.378 Y125.017 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-.49 J-1.114 P1  F30000
G1 X122.398 Y131.602 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1817
G1 X123.166 Y131.602 E.02548
G1 X123.166 Y132.398 E.0264
G1 X121.602 Y132.398 E.05188
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.542 E.08094
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1817
G1 X123.494 Y131.21 E.02163
G1 X123.558 Y131.21 E.00197
G1 X123.558 Y132.79 E.04855
G1 X123.494 Y132.79 E.00197
G1 X121.21 Y132.79 E.07018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
G1 X122.962 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1817
G1 X122.194 Y132 E.02433
G1 X122.114 Y131.983 E.0026
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00298
G1 X122 Y131.806 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1817
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X123.054 Y123.602 E.04816
G1 X123.054 Y124.398 E.0264
G1 X122.458 Y124.398 E.01977
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1817
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.382 Y123.21 E.06674
G1 X123.446 Y123.21 E.00197
G1 X123.446 Y124.79 E.04855
G1 X123.382 Y124.79 E.00197
G1 X122.85 Y124.79 E.01634
M204 S10000
G1 X122.85 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1817
G1 X122.194 Y124 E.02078
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/138
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
G3 Z4 I-.52 J1.1 P1  F30000
G1 X136.602 Y131.602 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1840
G1 X136.602 Y124.398 E.23898
G1 X126.816 Y124.398 E.32462
G1 X126.816 Y123.602 E.0264
G1 X138.398 Y123.602 E.38419
G1 X138.398 Y132.398 E.29177
G1 X126.684 Y132.398 E.38859
G1 X126.684 Y131.602 E.0264
G1 X136.542 Y131.602 E.32703
G1 X136.21 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1840
G1 X136.21 Y124.79 E.19727
G1 X126.431 Y124.79 E.30048
G1 X126.431 Y123.21 E.04855
G1 X126.513 Y123.21 E.00252
G1 X138.79 Y123.21 E.37723
G1 X138.79 Y132.79 E.29437
G1 X126.319 Y132.79 E.3832
G1 X126.291 Y132.79 E.00085
G1 X126.291 Y131.21 E.04855
G1 X126.319 Y131.21 E.00085
G1 X136.15 Y131.21 E.30208
M204 S10000
; WIPE_START
G1 F24000
G1 X136.169 Y129.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.186 J.271 P1  F30000
G1 X136.806 Y132 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1840
G1 X126.887 Y132 E.31421
; WIPE_START
G1 F24000
G1 X128.887 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.185 J-.277 P1  F30000
G1 X127.02 Y124 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F1840
G1 X136.806 Y124 E.31001
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1840
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1840
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1840
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
; WIPE_START
G1 F24000
G1 X137.378 Y125.017 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.49 J-1.114 P1  F30000
G1 X122.398 Y131.602 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1840
G1 X123.316 Y131.602 E.03047
G1 X123.316 Y132.398 E.0264
G1 X121.602 Y132.398 E.05687
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.542 E.08094
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1840
G1 X123.681 Y131.21 E.02738
G1 X123.709 Y131.21 E.00085
G1 X123.709 Y132.79 E.04855
G1 X123.681 Y132.79 E.00085
G1 X123.599 Y132.79 E.00252
G1 X121.21 Y132.79 E.07341
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
G1 X123.113 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1840
G1 X122.194 Y132 E.0291
G1 X122.114 Y131.983 E.0026
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00298
G1 X122 Y131.806 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1840
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X123.184 Y123.602 E.05247
G1 X123.184 Y124.398 E.0264
G1 X122.458 Y124.398 E.02408
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1840
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.569 Y123.21 E.07248
G1 X123.569 Y124.79 E.04855
G1 X123.487 Y124.79 E.00252
G1 X122.85 Y124.79 E.01957
M204 S10000
G1 X122.98 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1840
G1 X122.194 Y124 E.0249
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/138
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
G3 Z4.2 I-.52 J1.1 P1  F30000
G1 X136.602 Y131.602 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1890
G1 X136.602 Y124.398 E.23898
G1 X126.639 Y124.398 E.3305
G1 X126.639 Y123.602 E.0264
G1 X138.398 Y123.602 E.39007
G1 X138.398 Y132.398 E.29177
G1 X126.47 Y132.398 E.39567
G1 X126.47 Y131.602 E.0264
G1 X136.542 Y131.602 E.33411
G1 X136.21 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1890
G1 X136.21 Y124.79 E.19727
G1 X126.301 Y124.79 E.30447
G1 X126.247 Y124.79 E.00166
G1 X126.247 Y123.21 E.04855
G1 X126.301 Y123.21 E.00166
G1 X126.383 Y123.21 E.00252
G1 X138.79 Y123.21 E.38123
G1 X138.79 Y132.79 E.29437
G1 X126.086 Y132.79 E.39035
M106 S255
G1 F1800
G1 X126.086 Y131.21 E.04855
M106 S252.45
G1 F1890
G1 X136.15 Y131.21 E.30923
M204 S10000
; WIPE_START
G1 F24000
G1 X136.169 Y129.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.186 J.271 P1  F30000
G1 X136.806 Y132 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1890
G1 X126.673 Y132 E.32098
; WIPE_START
G1 F24000
G1 X128.673 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.186 J-.272 P1  F30000
G1 X126.842 Y124 Z4.4
G1 Z4
G1 E.8 F1800
G1 F1890
G1 X136.806 Y124 E.31563
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1890
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
M73 P34 R17
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1890
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1890
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
; WIPE_START
G1 F24000
G1 X137.378 Y125.017 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.49 J-1.114 P1  F30000
G1 X122.398 Y131.602 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1890
G1 X123.53 Y131.602 E.03756
G1 X123.53 Y132.398 E.0264
G1 X121.602 Y132.398 E.06395
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.542 E.08094
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1890
G1 X123.914 Y131.21 E.03452
M106 S255
G1 F1800
G1 X123.914 Y132.79 E.04855
M106 S252.45
G1 F1890
G1 X123.75 Y132.79 E.00504
G1 X121.21 Y132.79 E.07803
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X123.914 Y131.21 E-.42756
G1 X123.914 Y132.085 E-.33244
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.174 J-1.204 P1  F30000
G1 X123.327 Y132 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1890
G1 X122.194 Y132 E.03587
G1 X122.114 Y131.983 E.0026
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00298
G1 X122 Y131.806 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1890
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X123.361 Y123.602 E.05835
G1 X123.361 Y124.398 E.0264
G1 X122.458 Y124.398 E.02996
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1890
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.699 Y123.21 E.07648
G1 X123.753 Y123.21 E.00166
G1 X123.753 Y124.79 E.04855
G1 X123.699 Y124.79 E.00166
G1 X123.617 Y124.79 E.00252
G1 X122.85 Y124.79 E.02357
M204 S10000
G1 X123.158 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1890
G1 X122.194 Y124 E.03051
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/138
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
G3 Z4.4 I-.52 J1.1 P1  F30000
G1 X136.602 Y131.602 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2011
G1 X136.602 Y124.398 E.23898
G1 X126.355 Y124.398 E.33992
G1 X126.355 Y123.602 E.0264
G1 X138.398 Y123.602 E.39949
G1 X138.398 Y132.398 E.29177
G1 X126.102 Y132.398 E.40789
G1 X126.102 Y131.602 E.0264
G1 X136.542 Y131.602 E.34633
G1 X136.21 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2011
G1 X136.21 Y124.79 E.19727
G1 X126.042 Y124.79 E.31244
M106 S255
G1 F1800
G1 X125.963 Y124.79 E.00243
G1 X125.963 Y123.21 E.04855
G1 X126.042 Y123.21 E.00243
M106 S252.45
G1 F2011
G1 X126.206 Y123.21 E.00504
G1 X138.79 Y123.21 E.38668
G1 X138.79 Y132.79 E.29437
G1 X126.037 Y132.79 E.39187
G1 X125.791 Y132.79 E.00756
M106 S255
G1 F600
G1 X125.71 Y132.79 E.0025
G1 X125.71 Y131.21 E.04855
G1 X125.791 Y131.21 E.0025
M106 S252.45
G1 F2011
G1 X126.037 Y131.21 E.00756
G1 X136.15 Y131.21 E.31075
M204 S10000
; WIPE_START
G1 F24000
G1 X136.169 Y129.21 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-1.186 J.271 P1  F30000
G1 X136.806 Y132 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F2011
G1 X126.305 Y132 E.33265
; WIPE_START
G1 F24000
G1 X128.305 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.189 J-.26 P1  F30000
G1 X126.558 Y124 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F2011
G1 X136.806 Y124 E.32462
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2011
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F2011
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F2011
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
; WIPE_START
G1 F24000
G1 X137.378 Y125.017 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.49 J-1.114 P1  F30000
G1 X122.398 Y131.602 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2011
G1 X123.898 Y131.602 E.04977
G1 X123.898 Y132.398 E.0264
G1 X121.602 Y132.398 E.07617
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.542 E.08094
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2011
G1 X123.963 Y131.21 E.03605
G1 X124.209 Y131.21 E.00756
M106 S255
G1 F600
G1 X124.29 Y131.21 E.0025
G1 X124.29 Y132.79 E.04855
G1 X124.209 Y132.79 E.0025
M106 S252.45
G1 F2011
G1 X123.963 Y132.79 E.00756
G1 X121.21 Y132.79 E.0846
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X123.963 Y131.21 E-.44638
G1 X124.209 Y131.21 E-.09348
G1 X124.29 Y131.21 E-.03088
G1 X124.29 Y131.708 E-.18926
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.052 J-1.216 P1  F30000
G1 X122 Y131.806 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F2011
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X123.695 Y132 E.04753
G1 X122 Y131.806 F30000
G1 F2011
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2011
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X123.645 Y123.602 E.06777
G1 X123.645 Y124.398 E.0264
G1 X122.458 Y124.398 E.03938
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2011
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.958 Y123.21 E.08444
M106 S255
G1 F1800
G1 X124.037 Y123.21 E.00243
G1 X124.037 Y124.79 E.04855
G1 X123.958 Y124.79 E.00243
M106 S252.45
G1 F2011
G1 X123.794 Y124.79 E.00504
G1 X122.85 Y124.79 E.02901
M204 S10000
M73 P35 R17
G1 X123.442 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F2011
G1 X122.194 Y124 E.03951
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/138
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
G3 Z4.6 I.727 J.976 P1  F30000
G1 X122.398 Y124.398 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1952
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X124.447 Y123.602 E.09438
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X125.553 Y123.602 E.03668
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F1952
G1 X138.398 Y123.602 E.42609
G1 X138.398 Y132.398 E.29177
G1 X125.3 Y132.398 E.4345
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X124.7 Y132.398 E.01988
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F1952
G1 X124.318 Y132.398 E.01269
G1 X121.602 Y132.398 E.09009
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X124.7 Y131.602 E.07638
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X125.3 Y131.602 E.01988
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F1952
G1 X136.602 Y131.602 E.37492
G1 X136.602 Y124.398 E.23898
G1 X125.553 Y124.398 E.36652
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X124.447 Y124.398 E.03668
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F1952
G1 X122.458 Y124.398 E.06599
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1952
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X124.447 Y123.21 E.09947
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X125.553 Y123.21 E.03668
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1952
G1 X138.79 Y123.21 E.40674
G1 X138.79 Y132.79 E.29437
G1 X125.3 Y132.79 E.41452
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X124.7 Y132.79 E.01988
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1952
G1 X124.331 Y132.79 E.01134
G1 X121.21 Y132.79 E.09591
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X124.7 Y131.21 E.0587
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X125.3 Y131.21 E.01988
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1952
G1 X136.21 Y131.21 E.33525
G1 X136.21 Y124.79 E.19727
G1 X125.553 Y124.79 E.32746
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X124.447 Y124.79 E.03668
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1952
G1 X122.85 Y124.79 E.04908
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1952
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F1952
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1952
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1952
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1952
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
M73 P35 R16
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1952
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/138
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
G3 Z4.8 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z5
G1 Z4.6
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
M73 P36 R16
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/138
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
G3 Z5 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z5.2
G1 Z4.8
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/138
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
G3 Z5.2 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z5.4
G1 Z5
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
M73 P37 R16
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/138
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
G3 Z5.4 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z5.6
G1 Z5.2
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/138
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
G3 Z5.6 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z5.8
G1 Z5.4
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
M73 P38 R16
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/138
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
G3 Z5.8 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z6
G1 Z5.6
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/138
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
G3 Z6 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z6.2
G1 Z5.8
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
M73 P39 R16
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
M73 P39 R15
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/138
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
G3 Z6.2 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z6.4
G1 Z6
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X137.602 Y124.398 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.473994
G1 F1963
G1 X137.587 Y124.484 E.00305
; LINE_WIDTH: 0.5091
G1 X137.573 Y124.57 E.0033
; LINE_WIDTH: 0.544205
G1 X137.559 Y124.655 E.00355
G1 X136.994 Y124.623 F30000
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/138
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
G3 Z6.4 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z6.6
G1 Z6.2
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
M73 P40 R15
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/138
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
G3 Z6.6 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z6.8
G1 Z6.4
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/138
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
G3 Z6.8 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z7
M73 P41 R15
G1 Z6.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z7
G1 Z6.6
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/138
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
G3 Z7 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z7.2
G1 Z6.8
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/138
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
G3 Z7.2 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
M73 P42 R15
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z7.4
G1 Z7
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/138
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
G3 Z7.4 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z7.6
G1 Z7.2
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
M73 P43 R15
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
M73 P43 R14
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/138
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
G3 Z7.6 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z7.8
G1 Z7.4
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/138
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
G3 Z7.8 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z8
G1 Z7.6
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
M73 P44 R14
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/138
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
G3 Z8 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z8.2
G1 Z7.8
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/138
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
G3 Z8.2 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z8.4
G1 Z8
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
M73 P45 R14
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/138
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
G3 Z8.4 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z8.6
G1 Z8.2
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/138
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
G3 Z8.6 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z8.8
G1 Z8.4
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
M73 P46 R14
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/138
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
G3 Z8.8 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z9
G1 Z8.6
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/138
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
G3 Z9 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
M73 P46 R13
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z9.2
G1 Z8.8
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
M73 P47 R13
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/138
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
G3 Z9.2 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z9.4
G1 Z9
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/138
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
G3 Z9.4 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z9.6
M73 P48 R13
G1 Z9.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z9.6
G1 Z9.2
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/138
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
G3 Z9.6 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z9.8
G1 Z9.4
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/138
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
G3 Z9.8 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
M73 P49 R13
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z10
G1 Z9.6
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/138
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
G3 Z10 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z10.2
G1 Z9.8
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
M73 P50 R13
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/138
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
G3 Z10.2 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z10.4
G1 Z10
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/138
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
G3 Z10.4 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
M73 P50 R12
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z10.6
G1 Z10.2
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
M73 P51 R12
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/138
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
G3 Z10.6 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z10.8
G1 Z10.4
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/138
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
G3 Z10.8 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z11
G1 Z10.6
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
M73 P52 R12
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/138
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
G3 Z11 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z11.2
G1 Z10.8
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/138
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
G3 Z11.2 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z11.4
G1 Z11
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
M73 P53 R12
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/138
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
G3 Z11.4 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z11.6
G1 Z11.2
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/138
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
G3 Z11.6 I-1.085 J-.551 P1  F30000
G1 X121.602 Y129.102 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2068
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y130.004 E.05302
G1 X138.398 Y130.004 E.05957
G1 X138.398 Y132.398 E.07942
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.162 E.10734
; WIPE_START
G1 F24000
G1 X122.398 Y129.102 E-.30328
G1 X122.398 Y130.304 E-.45672
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I1.217 J0 P1  F30000
G1 X122.398 Y124.398 Z11.8
G1 Z11.4
G1 E.8 F1800
G1 F2068
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y125.996 E.07942
G1 X136.602 Y125.996 E.05957
G1 X136.602 Y124.398 E.05302
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2068
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F2068
G1 X136.806 Y124 E.46287
G1 X137.143 Y123.94 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F2068
G1 X138 Y123.94 E.02374
G1 X137.558 Y124.093 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2068
G1 X138.176 Y124.71 E.02683
G1 X138.176 Y125.244
M73 P54 R12
G1 X137.028 Y124.096 E.04987
G1 X136.837 Y124.438
G1 X138.173 Y125.774 E.05804
G1 X137.639 Y125.774
G1 X136.824 Y124.959 E.03541
M204 S10000
G1 X138.583 Y126.717 F30000
M204 S2000
G1 F2068
G1 X138.084 Y126.219 E.02166
G1 X137.551 Y126.219
G1 X138.583 Y127.25 E.04484
G1 X138.583 Y127.784
G1 X137.018 Y126.219 E.06801
G1 X136.484 Y126.219
G1 X138.583 Y128.317 E.09118
G1 X138.583 Y128.85
G1 X136.417 Y126.685 E.09409
G1 X136.417 Y127.218
G1 X138.583 Y129.384 E.09409
G1 X138.447 Y129.781
G1 X136.417 Y127.752 E.0882
G1 X136.417 Y128.285
G1 X137.914 Y129.781 E.06503
G1 X137.381 Y129.781
G1 X136.417 Y128.818 E.04186
G1 X136.417 Y129.351
G1 X136.847 Y129.781 E.01868
M204 S10000
G1 X138.176 Y130.576 F30000
M204 S2000
G1 F2068
G1 X137.825 Y130.226 E.01521
G1 X137.292 Y130.226
G1 X138.176 Y131.11 E.03839
G1 X138.176 Y131.643
G1 X136.824 Y130.292 E.05871
G1 X136.824 Y130.825
G1 X137.907 Y131.907 E.04702
G1 X137.373 Y131.907
G1 X137.028 Y131.562 E.015
M204 S10000
G1 X136.806 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F2068
G1 X122.194 Y132 E.46287
G1 X122.114 Y131.983 E.0026
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00298
G1 X122 Y131.806 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I1.217 J0 P1  F30000
G1 X122 Y126.694 Z11.8
G1 Z11.4
G1 E.8 F1800
G1 F2068
G1 X122 Y124.194 E.0792
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00595
G1 X122.114 Y124.017 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y124 E.0026
; WIPE_START
G1 F24000
G1 X122.114 Y124.017 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I-.574 J1.073 P1  F30000
G1 X137.143 Y132.06 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F2068
G1 X138 Y132.06 E.02374
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X137.143 Y132.06 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/138
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
G3 Z11.8 I.07 J-1.215 P1  F30000
G1 X122.398 Y131.21 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1915
G1 X122.398 Y131.602 E.01301
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y129.528 E.0688
G1 X138.398 Y129.528 E.05957
M73 P54 R11
G1 X138.398 Y132.398 E.0952
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.15 E.06793
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1915
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y129.136 E.06373
G1 X138.79 Y129.136 E.07928
G1 X138.79 Y132.79 E.11228
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X124.79 Y131.159 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I-.275 J-1.186 P1  F30000
G1 X122 Y131.806 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F1915
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y129.92 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1915
G1 X136.994 Y131.392 E.04523
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y129.92 E.06409
G1 X137.054 Y129.92 E.02924
G1 X137.341 Y130.267 F30000
; LINE_WIDTH: 0.360223
G1 F1915
G1 X137.341 Y131.182 E.02366
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.365247
G1 X137.659 Y131.089 E.00433
G1 X137.659 Y130.267 E.02159
G1 X137.401 Y130.267 E.00676
; WIPE_START
G1 F24000
G1 X137.659 Y130.267 E-.15716
G1 X137.659 Y131.089 E-.50217
G1 X137.64 Y131.253 E-.10067
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I.15 J-1.208 P1  F30000
G1 X122 Y129.306 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1915
G1 X122 Y131.806 E.0792
; WIPE_START
G1 F24000
G1 X122 Y129.806 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I1.214 J.089 P1  F30000
G1 X122.398 Y124.398 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1915
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y126.472 E.0952
G1 X136.602 Y126.472 E.05957
G1 X136.602 Y124.398 E.0688
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1915
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y126.864 E.11228
G1 X136.21 Y126.864 E.07928
G1 X136.21 Y124.79 E.06373
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1915
G1 X136.806 Y124 E.46287
G1 X137.549 Y124.715 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.57931
G1 F1915
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.733 F30000
; LINE_WIDTH: 0.360223
G1 F1915
G1 X137.659 Y125.733 E.0082
G1 X137.659 Y125.109 E.01614
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.4 Y124.96 E.00206
; LINE_WIDTH: 0.478066
G1 X137.381 Y125.01 E.00189
; LINE_WIDTH: 0.438785
G1 X137.361 Y125.059 E.00172
; LINE_WIDTH: 0.363613
G1 X137.341 Y125.109 E.00139
G1 X137.341 Y125.673 E.01474
G1 X136.994 Y126.08 F30000
; LINE_WIDTH: 0.419999
G1 F1915
G1 X138.006 Y126.08 E.03109
G1 X138.006 Y123.994 E.06409
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G1 X137.142 Y124.553 E.00349
G1 X136.994 Y124.623 E.00504
G1 X136.994 Y126.02 E.04292
; WIPE_START
G1 F24000
G1 X136.994 Y124.623 E-.53085
G1 X137.142 Y124.553 E-.06233
G1 X137.195 Y124.452 E-.04317
G1 X137.197 Y124.127 E-.12365
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I.01 J-1.217 P1  F30000
G1 X122.194 Y124 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1915
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
M73 P55 R11
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/138
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
G3 Z12 I-1.209 J.138 P1  F30000
G1 X122.79 Y131.602 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1863
G1 X136.602 Y131.602 E.45817
G1 X136.602 Y129.914 E.05601
G1 X138.398 Y129.914 E.05957
G1 X138.398 Y132.398 E.08241
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X122.73 Y131.602 E.01102
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1863
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y129.522 E.05188
G1 X138.79 Y129.522 E.07928
G1 X138.79 Y132.79 E.10043
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X124.79 Y131.159 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I-.275 J-1.186 P1  F30000
G1 X122 Y131.806 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F1863
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y130.306 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1863
G1 X136.994 Y131.392 E.03338
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y130.306 E.05224
G1 X137.054 Y130.306 E.02924
G1 X137.341 Y130.653 F30000
; LINE_WIDTH: 0.360223
G1 F1863
G1 X137.341 Y131.182 E.01369
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.324 E.00903
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.068 E.00824
; LINE_WIDTH: 0.374709
G2 X137.659 Y130.653 I-2.796 J-.336 E.01124
G1 X137.401 Y130.653 E.00696
; WIPE_START
G1 F24000
G1 X137.659 Y130.653 E-.29067
G1 X137.64 Y131.068 E-.46933
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I-.057 J-1.216 P1  F30000
G1 X122 Y131.806 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1863
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1863
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y126.086 E.08241
G1 X136.602 Y126.086 E.05957
G1 X136.602 Y124.398 E.05601
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1863
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y126.478 E.10043
G1 X136.21 Y126.478 E.07928
G1 X136.21 Y124.79 E.05188
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1863
G1 X136.806 Y124 E.46287
G1 X137.549 Y124.715 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.57931
G1 F1863
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544206
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.509101
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.347 F30000
; LINE_WIDTH: 0.360223
G1 F1863
G1 X137.659 Y125.347 E.0082
G1 X137.659 Y125.109 E.00617
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.4 Y124.98 E.00279
; LINE_WIDTH: 0.478066
G1 X137.381 Y125.05 E.00256
; LINE_WIDTH: 0.438785
G1 X137.361 Y125.119 E.00233
; LINE_WIDTH: 0.376824
G2 X137.341 Y125.287 I.288 J.119 E.00466
G1 X136.994 Y125.694 F30000
; LINE_WIDTH: 0.419999
G1 F1863
G1 X138.006 Y125.694 E.03109
G1 X138.006 Y123.994 E.05224
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G1 X137.142 Y124.553 E.00349
G1 X136.994 Y124.623 E.00504
G1 X136.994 Y125.634 E.03108
; WIPE_START
G1 F24000
G1 X136.994 Y124.623 E-.38434
G1 X137.142 Y124.553 E-.06233
G1 X137.195 Y124.452 E-.04317
G1 X137.198 Y123.994 E-.17397
G1 X137.451 Y123.994 E-.09619
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I0 J-1.217 P1  F30000
G1 X122.194 Y124 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1863
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/138
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
G3 Z12.2 I-1.209 J.138 P1  F30000
G1 X122.79 Y131.602 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1785
G1 X136.602 Y131.602 E.45817
G1 X136.602 Y130.203 E.0464
G1 X138.398 Y130.203 E.05957
G1 X138.398 Y132.398 E.0728
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X122.73 Y131.602 E.01102
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1785
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y129.811 E.04298
G1 X138.79 Y129.811 E.07928
G1 X138.79 Y132.79 E.09153
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X124.79 Y131.159 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I-.275 J-1.186 P1  F30000
G1 X122 Y131.806 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F1785
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y130.595 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1785
G1 X136.994 Y131.392 E.02448
G1 X137.144 Y131.449 E.00492
G1 X137.198 Y131.602 E.00498
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y130.595 E.04334
G1 X137.054 Y130.595 E.02924
G1 X137.34 Y130.941 F30000
; LINE_WIDTH: 0.356787
G1 F1785
G1 X137.34 Y131.182 E.00618
G1 X137.391 Y131.207 E.00147
G1 X137.461 Y131.332 E.00365
; LINE_WIDTH: 0.395856
G1 X137.532 Y131.456 E.00411
; LINE_WIDTH: 0.434925
G1 X137.602 Y131.581 E.00456
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.42 E.00569
; LINE_WIDTH: 0.434925
G1 X137.641 Y131.259 E.00518
; LINE_WIDTH: 0.367711
G2 X137.66 Y130.941 I-1.3 J-.239 E.00845
G1 X137.4 Y130.941 E.0069
G1 X122 Y131.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1785
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1785
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y125.797 E.0728
G1 X136.602 Y125.797 E.05957
G1 X136.602 Y124.398 E.0464
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1785
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y126.189 E.09153
G1 X136.21 Y126.189 E.07928
G1 X136.21 Y124.79 E.04298
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1785
G1 X136.806 Y124 E.46287
G1 X136.994 Y125.405 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1785
G1 X138.006 Y125.405 E.03109
G1 X138.006 Y123.994 E.04334
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G1 X137.142 Y124.553 E.00352
G1 X136.994 Y124.623 E.00501
G1 X136.994 Y125.345 E.02217
G1 X137.503 Y124.902 F30000
; LINE_WIDTH: 0.670654
G1 F1785
G1 X137.525 Y124.791 E.0058
; LINE_WIDTH: 0.621489
G1 X137.547 Y124.68 E.00534
; LINE_WIDTH: 0.572324
G1 X137.569 Y124.568 E.00489
; LINE_WIDTH: 0.523159
G1 X137.59 Y124.457 E.00444
G1 X122.194 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1785
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/138
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
G3 Z12.4 I-1.209 J.138 P1  F30000
G1 X122.79 Y131.602 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1756
M73 P56 R11
G1 X136.602 Y131.602 E.45817
G1 X136.602 Y130.39 E.04022
G1 X138.398 Y130.39 E.05957
G1 X138.398 Y132.398 E.06662
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X122.73 Y131.602 E.01102
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1756
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y129.998 E.03726
G1 X138.79 Y129.998 E.07928
G1 X138.79 Y132.79 E.0858
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X124.79 Y131.159 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I-.275 J-1.186 P1  F30000
G1 X122 Y131.806 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F1756
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y130.782 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1756
G1 X136.994 Y131.392 E.01876
G1 X137.129 Y131.435 E.00434
G1 X137.198 Y131.602 E.00555
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y130.782 E.03761
G1 X137.054 Y130.782 E.02924
G1 X137.602 Y131.602 F30000
; LINE_WIDTH: 0.473994
G1 F1756
G1 X137.588 Y131.5 E.00362
; LINE_WIDTH: 0.507414
G1 X137.574 Y131.397 E.0039
; LINE_WIDTH: 0.540834
G1 X137.56 Y131.295 E.00418
G1 X122 Y131.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1756
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1756
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y125.61 E.06662
G1 X136.602 Y125.61 E.05957
G1 X136.602 Y124.398 E.04022
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1756
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y126.002 E.0858
G1 X136.21 Y126.002 E.07928
G1 X136.21 Y124.79 E.03726
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1756
G1 X136.806 Y124 E.46287
G1 X136.994 Y125.218 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1756
G1 X138.006 Y125.218 E.03109
G1 X138.006 Y123.994 E.03761
G1 X137.198 Y123.994 E.02483
G1 X137.168 Y124.521 E.0162
G1 X137.009 Y124.608 E.00558
G1 X136.996 Y125.158 E.01692
G1 X137.552 Y124.764 F30000
; LINE_WIDTH: 0.574254
G1 F1756
G1 X137.566 Y124.662 E.00446
; LINE_WIDTH: 0.540834
G1 X137.58 Y124.56 E.00418
; LINE_WIDTH: 0.507414
G1 X137.594 Y124.458 E.0039
G1 X122.194 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1756
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/138
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
G3 Z12.6 I-1.209 J.138 P1  F30000
G1 X122.79 Y131.602 Z12.6
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1736
G1 X136.602 Y131.602 E.45817
G1 X136.602 Y130.567 E.03434
G1 X138.398 Y130.567 E.05957
G1 X138.398 Y132.398 E.06074
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X122.73 Y131.602 E.01102
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1736
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y130.175 E.03181
G1 X138.79 Y130.175 E.07928
G1 X138.79 Y132.79 E.08036
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X124.79 Y131.159 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I-.275 J-1.186 P1  F30000
G1 X122 Y131.806 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F1736
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y130.959 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1736
G1 X137.009 Y131.392 E.01332
G1 X137.11 Y131.422 E.00324
G1 X137.198 Y131.581 E.00558
G1 X137.198 Y132.006 E.01307
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y130.959 E.03217
G1 X137.054 Y130.959 E.02924
G1 X137.602 Y131.602 F30000
; LINE_WIDTH: 0.473994
G1 F1736
G1 X137.589 Y131.44 E.00571
G1 X122 Y131.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1736
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1736
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y125.433 E.06074
G1 X136.602 Y125.433 E.05957
G1 X136.602 Y124.398 E.03434
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1736
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y125.825 E.08036
G1 X136.21 Y125.825 E.07928
G1 X136.21 Y124.79 E.03181
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1736
G1 X136.806 Y124 E.46287
G1 X136.994 Y125.041 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1736
M73 P57 R11
G1 X138.006 Y125.041 E.03109
G1 X138.006 Y123.994 E.03217
G1 X137.198 Y123.994 E.02483
G1 X137.187 Y124.481 E.01498
G3 X136.994 Y124.623 I-.216 J-.092 E.00772
G1 X136.994 Y124.981 E.01101
G1 X137.585 Y124.62 F30000
; LINE_WIDTH: 0.507972
G1 F1736
G1 X137.597 Y124.458 E.00616
G1 X122.194 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1736
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/138
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
G3 Z12.8 I-1.209 J.138 P1  F30000
G1 X122.79 Y131.602 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1723
G1 X136.602 Y131.602 E.45817
G1 X136.602 Y130.693 E.03016
G1 X138.398 Y130.693 E.05957
G1 X138.398 Y132.398 E.05656
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X122.73 Y131.602 E.01102
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1723
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y130.301 E.02794
G1 X138.79 Y130.301 E.07928
G1 X138.79 Y132.79 E.07649
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X124.79 Y131.159 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I-.275 J-1.186 P1  F30000
G1 X122 Y131.806 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F1723
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y131.085 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1723
G1 X137.009 Y131.392 E.00945
G1 X137.091 Y131.411 E.00258
G1 X137.198 Y131.602 E.00672
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y131.085 E.0283
G1 X137.054 Y131.085 E.02924
G1 X137.602 Y131.602 F30000
; LINE_WIDTH: 0.473996
G1 F1723
G1 X137.6 Y131.552 E.00174
G1 X122 Y131.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1723
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1723
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y125.307 E.05656
G1 X136.602 Y125.307 E.05957
G1 X136.602 Y124.398 E.03016
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1723
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y125.699 E.07649
G1 X136.21 Y125.699 E.07928
G1 X136.21 Y124.79 E.02794
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1723
G1 X136.806 Y124 E.46287
G1 X136.994 Y124.915 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1723
G1 X138.006 Y124.915 E.03109
G1 X138.006 Y123.994 E.0283
G1 X137.198 Y123.994 E.02483
G1 X137.196 Y124.447 E.01393
G1 X137.091 Y124.589 E.00541
G1 X136.994 Y124.623 E.00315
G1 X136.994 Y124.855 E.00714
G1 X137.598 Y124.508 F30000
; LINE_WIDTH: 0.480584
G1 F1723
G1 X137.6 Y124.458 E.00177
G1 X122.194 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1723
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/138
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
G3 Z13 I-1.209 J.138 P1  F30000
G1 X122.79 Y131.602 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1711
G1 X136.602 Y131.602 E.45817
G1 X136.602 Y130.798 E.02668
G1 X138.398 Y130.798 E.05957
G1 X138.398 Y132.398 E.05308
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X122.73 Y131.602 E.01102
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1711
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y130.406 E.02471
G1 X138.79 Y130.406 E.07928
G1 X138.79 Y132.79 E.07326
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X124.79 Y131.159 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-.275 J-1.186 P1  F30000
G1 X122 Y131.806 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F1711
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y131.19 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1711
G1 X137.009 Y131.392 E.00623
G1 X137.069 Y131.402 E.00185
G1 X137.198 Y131.602 E.00732
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y131.19 E.02507
G1 X137.054 Y131.19 E.02924
G1 X122 Y131.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1711
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1711
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y125.202 E.05308
G1 X136.602 Y125.202 E.05957
G1 X136.602 Y124.398 E.02668
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1711
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
M73 P58 R11
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y125.594 E.07326
G1 X136.21 Y125.594 E.07928
G1 X136.21 Y124.79 E.02471
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1711
G1 X136.806 Y124 E.46287
G1 X136.994 Y124.81 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1711
G1 X138.006 Y124.81 E.03109
G1 X138.006 Y123.994 E.02507
G1 X137.198 Y123.994 E.02483
G1 X137.198 Y124.419 E.01307
G1 X137.069 Y124.598 E.00678
G1 X136.994 Y124.623 E.00241
G1 X136.994 Y124.75 E.00391
G1 X122.194 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1711
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/138
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
G3 Z13.2 I-1.209 J.138 P1  F30000
G1 X122.79 Y131.602 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1702
G1 X136.602 Y131.602 E.45817
G1 X136.602 Y130.897 E.02337
G1 X138.398 Y130.897 E.05957
G1 X138.398 Y132.398 E.04977
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X122.73 Y131.602 E.01102
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P58 R10
G1 F1702
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y130.505 E.02165
G1 X138.79 Y130.505 E.07928
G1 X138.79 Y132.79 E.0702
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X124.79 Y131.159 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-.275 J-1.186 P1  F30000
G1 X122 Y131.806 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F1702
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y131.29 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1702
G1 X137.009 Y131.392 E.00318
G1 X137.198 Y131.581 E.00819
G1 X137.198 Y132.006 E.01307
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y131.29 E.02201
G1 X137.054 Y131.29 E.02924
G1 X137.556 Y131.648 F30000
; LINE_WIDTH: 0.382106
G1 F1702
G1 X137.588 Y131.648 E.00088
G1 X122 Y131.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1702
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1702
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y125.103 E.04977
G1 X136.602 Y125.103 E.05957
G1 X136.602 Y124.398 E.02337
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1702
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y125.495 E.0702
G1 X136.21 Y125.495 E.07928
G1 X136.21 Y124.79 E.02165
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1702
G1 X136.806 Y124 E.46287
G1 X137.051 Y124.657 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.526126
G1 F1702
G1 X137.219 Y124.675 E.00666
; LINE_WIDTH: 0.490751
G1 X137.388 Y124.693 E.00618
; LINE_WIDTH: 0.42233
G2 X138.006 Y124.71 I.393 J-2.933 E.01916
G1 X138.006 Y123.994 E.02214
G1 X137.198 Y123.994 E.02499
G1 X137.198 Y124.419 E.01315
; LINE_WIDTH: 0.419999
G1 X137.159 Y124.482 E.00225
; LINE_WIDTH: 0.455375
G1 X137.121 Y124.544 E.00246
; LINE_WIDTH: 0.490751
G1 X137.082 Y124.606 E.00267
G1 X137.556 Y124.352 F30000
; LINE_WIDTH: 0.382106
G1 F1702
G1 X137.588 Y124.352 E.00088
G1 X122.194 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1702
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/138
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
G3 Z13.4 I-1.209 J.138 P1  F30000
G1 X122.79 Y131.602 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1688
G1 X136.602 Y131.602 E.45817
G1 X136.602 Y130.947 E.02174
G1 X138.398 Y130.947 E.05957
G1 X138.398 Y132.398 E.04814
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X122.73 Y131.602 E.01102
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1688
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y130.555 E.02014
G1 X138.79 Y130.555 E.07928
G1 X138.79 Y132.79 E.06868
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X124.79 Y131.159 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-.275 J-1.186 P1  F30000
G1 X122 Y131.806 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F1688
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X137.11 Y131.411 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.564944
G1 F1688
G1 X137.27 Y131.581 E.00992
G1 X137.27 Y131.933 E.01501
G1 X137.933 Y131.933 E.02821
G1 X137.933 Y131.411 E.02221
G1 X137.17 Y131.411 E.03248
G1 X122 Y131.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1688
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1688
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
M73 P59 R10
G1 X138.398 Y125.053 E.04814
G1 X136.602 Y125.053 E.05957
G1 X136.602 Y124.398 E.02174
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1688
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y125.445 E.06868
G1 X136.21 Y125.445 E.07928
G1 X136.21 Y124.79 E.02014
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1688
G1 X136.806 Y124 E.46287
G1 X137.047 Y124.633 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.476456
G1 F1688
G1 X137.359 Y124.611 E.01108
; LINE_WIDTH: 0.558376
G3 X137.933 Y124.589 I.443 J4.047 E.02414
G1 X137.933 Y124.067 E.02193
G1 X137.27 Y124.067 E.02786
G1 X137.27 Y124.419 E.01482
; LINE_WIDTH: 0.564944
G1 X137.18 Y124.505 E.0053
; LINE_WIDTH: 0.5207
G1 X137.09 Y124.591 E.00485
G1 X122.194 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1688
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/138
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
G3 Z13.6 I-1.209 J.138 P1  F30000
G1 X122.79 Y131.602 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1686
G1 X136.602 Y131.602 E.45817
G1 X136.602 Y130.996 E.0201
G1 X138.398 Y130.996 E.05957
G1 X138.398 Y132.398 E.0465
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X122.73 Y131.602 E.01102
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1686
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y130.604 E.01862
G1 X138.79 Y130.604 E.07928
G1 X138.79 Y132.79 E.06717
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X124.79 Y131.159 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-.275 J-1.186 P1  F30000
G1 X122 Y131.806 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F1686
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X137.009 Y131.39 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.4239
G1 F1686
G1 X137.092 Y131.454 E.00324
; LINE_WIDTH: 0.462699
G1 X137.175 Y131.517 E.00357
; LINE_WIDTH: 0.538464
G1 X137.258 Y131.581 E.00422
G1 X137.258 Y131.946 E.01474
G1 X137.946 Y131.946 E.02778
G1 X137.946 Y131.448 E.02008
G1 X137.39 Y131.448 E.02243
; LINE_WIDTH: 0.540297
G1 X137.283 Y131.432 E.0044
; LINE_WIDTH: 0.501498
G1 X137.176 Y131.416 E.00405
; LINE_WIDTH: 0.462699
G1 X137.068 Y131.399 E.00371
G1 X122 Y131.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1686
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1686
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y125.004 E.0465
G1 X136.602 Y125.004 E.05957
G1 X136.602 Y124.398 E.0201
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1686
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y125.396 E.06717
G1 X136.21 Y125.396 E.07928
G1 X136.21 Y124.79 E.01862
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1686
G1 X136.806 Y124 E.46287
G1 X137.042 Y124.608 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.426788
G1 F1686
G1 X137.197 Y124.59 E.00488
; LINE_WIDTH: 0.464625
G1 X137.352 Y124.571 E.00536
; LINE_WIDTH: 0.537548
G3 X137.946 Y124.552 I.374 J2.419 E.02401
G1 X137.946 Y124.054 E.02005
G1 X137.258 Y124.054 E.02772
G1 X137.257 Y124.419 E.01472
; LINE_WIDTH: 0.539126
G1 X137.201 Y124.469 E.00305
; LINE_WIDTH: 0.50168
G1 X137.144 Y124.519 E.00282
; LINE_WIDTH: 0.464234
G1 X137.087 Y124.569 E.00259
G1 X122.194 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1686
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/138
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
G3 Z13.8 I-1.209 J.138 P1  F30000
G1 X122.79 Y131.602 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1684
G1 X136.602 Y131.602 E.45817
G1 X136.602 Y131.034 E.01884
G1 X138.398 Y131.034 E.05957
G1 X138.398 Y132.398 E.04524
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X122.73 Y131.602 E.01102
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1684
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y130.642 E.01745
G1 X138.79 Y130.642 E.07928
G1 X138.79 Y132.79 E.066
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
M73 P60 R10
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X124.79 Y131.159 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-.275 J-1.186 P1  F30000
G1 X122 Y131.806 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F1684
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X137.009 Y131.409 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.385774
G1 F1684
G1 X137.088 Y131.466 E.00272
; LINE_WIDTH: 0.429045
G1 X137.167 Y131.523 E.00306
; LINE_WIDTH: 0.518192
G1 X137.245 Y131.581 E.00377
G1 X137.248 Y131.955 E.01451
G1 X137.955 Y131.955 E.02738
G1 X137.955 Y131.477 E.01852
G1 X137.352 Y131.474 E.02336
; LINE_WIDTH: 0.515585
G1 X137.257 Y131.456 E.00371
; LINE_WIDTH: 0.472315
G1 X137.163 Y131.438 E.00337
; LINE_WIDTH: 0.429045
G1 X137.068 Y131.42 E.00303
G1 X122 Y131.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1684
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y124.966 E.04524
G1 X136.602 Y124.966 E.05957
G1 X136.602 Y124.398 E.01884
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1684
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y125.358 E.066
G1 X136.21 Y125.358 E.07928
G1 X136.21 Y124.79 E.01745
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1684
G1 X136.806 Y124 E.46287
G1 X137.039 Y124.59 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.388372
G1 F1684
G1 X137.188 Y124.567 E.00425
; LINE_WIDTH: 0.432659
G1 X137.338 Y124.545 E.0048
; LINE_WIDTH: 0.518162
G1 X137.487 Y124.523 E.00585
G1 X137.955 Y124.523 E.01811
G1 X137.955 Y124.045 E.01852
G1 X137.248 Y124.045 E.02738
G1 X137.241 Y124.419 E.01451
; LINE_WIDTH: 0.506703
G1 X137.189 Y124.463 E.00257
; LINE_WIDTH: 0.46726
G1 X137.137 Y124.507 E.00235
; LINE_WIDTH: 0.427816
G1 X137.085 Y124.551 E.00213
G1 X122.194 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1684
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/138
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
G3 Z14 I-1.209 J.138 P1  F30000
G1 X122.79 Y131.602 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1684
G1 X136.602 Y131.602 E.45817
G1 X136.602 Y131.034 E.01884
G1 X138.398 Y131.034 E.05957
G1 X138.398 Y132.398 E.04524
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X122.73 Y131.602 E.01102
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1684
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y130.642 E.01745
G1 X138.79 Y130.642 E.07928
G1 X138.79 Y132.79 E.066
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X124.79 Y131.159 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-.275 J-1.186 P1  F30000
G1 X122 Y131.806 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F1684
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X137.009 Y131.409 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.385774
G1 F1684
G1 X137.088 Y131.466 E.00272
; LINE_WIDTH: 0.429045
G1 X137.167 Y131.523 E.00306
; LINE_WIDTH: 0.518192
G1 X137.245 Y131.581 E.00377
G1 X137.248 Y131.955 E.01451
G1 X137.955 Y131.955 E.02738
G1 X137.955 Y131.477 E.01852
G1 X137.352 Y131.474 E.02336
; LINE_WIDTH: 0.515585
G1 X137.257 Y131.456 E.00371
; LINE_WIDTH: 0.472315
G1 X137.163 Y131.438 E.00337
; LINE_WIDTH: 0.429045
G1 X137.068 Y131.42 E.00303
G1 X122 Y131.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1684
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y124.966 E.04524
G1 X136.602 Y124.966 E.05957
G1 X136.602 Y124.398 E.01884
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1684
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y125.358 E.066
G1 X136.21 Y125.358 E.07928
G1 X136.21 Y124.79 E.01745
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1684
G1 X136.806 Y124 E.46287
G1 X137.039 Y124.59 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.388372
G1 F1684
G1 X137.188 Y124.567 E.00425
; LINE_WIDTH: 0.432659
G1 X137.338 Y124.545 E.0048
; LINE_WIDTH: 0.518162
G1 X137.487 Y124.523 E.00585
G1 X137.955 Y124.523 E.01811
G1 X137.955 Y124.045 E.01852
G1 X137.248 Y124.045 E.02738
G1 X137.241 Y124.419 E.01451
; LINE_WIDTH: 0.506703
G1 X137.189 Y124.463 E.00257
; LINE_WIDTH: 0.46726
G1 X137.137 Y124.507 E.00235
; LINE_WIDTH: 0.427816
G1 X137.085 Y124.551 E.00213
G1 X122.194 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1684
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/138
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
G3 Z14.2 I-1.209 J.138 P1  F30000
G1 X122.79 Y131.602 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1684
G1 X136.602 Y131.602 E.45817
G1 X136.602 Y131.034 E.01884
G1 X138.398 Y131.034 E.05957
G1 X138.398 Y132.398 E.04524
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X122.73 Y131.602 E.01102
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P61 R10
G1 F1684
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y130.642 E.01745
G1 X138.79 Y130.642 E.07928
G1 X138.79 Y132.79 E.066
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X124.79 Y131.159 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-.275 J-1.186 P1  F30000
G1 X122 Y131.806 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F1684
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X137.009 Y131.409 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.385774
G1 F1684
G1 X137.088 Y131.466 E.00272
; LINE_WIDTH: 0.429045
G1 X137.167 Y131.523 E.00306
; LINE_WIDTH: 0.518192
G1 X137.245 Y131.581 E.00377
G1 X137.248 Y131.955 E.01451
G1 X137.955 Y131.955 E.02738
G1 X137.955 Y131.477 E.01852
G1 X137.352 Y131.474 E.02336
; LINE_WIDTH: 0.515585
G1 X137.257 Y131.456 E.00371
; LINE_WIDTH: 0.472315
G1 X137.163 Y131.438 E.00337
; LINE_WIDTH: 0.429045
G1 X137.068 Y131.42 E.00303
G1 X122 Y131.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1684
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y124.966 E.04524
G1 X136.602 Y124.966 E.05957
G1 X136.602 Y124.398 E.01884
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1684
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y125.358 E.066
G1 X136.21 Y125.358 E.07928
G1 X136.21 Y124.79 E.01745
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1684
G1 X136.806 Y124 E.46287
G1 X137.039 Y124.59 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.388372
G1 F1684
G1 X137.188 Y124.567 E.00425
; LINE_WIDTH: 0.432659
G1 X137.338 Y124.545 E.0048
; LINE_WIDTH: 0.518162
G1 X137.487 Y124.523 E.00585
G1 X137.955 Y124.523 E.01811
G1 X137.955 Y124.045 E.01852
G1 X137.248 Y124.045 E.02738
G1 X137.241 Y124.419 E.01451
; LINE_WIDTH: 0.506703
G1 X137.189 Y124.463 E.00257
; LINE_WIDTH: 0.46726
G1 X137.137 Y124.507 E.00235
; LINE_WIDTH: 0.427816
G1 X137.085 Y124.551 E.00213
G1 X122.194 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1684
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/138
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
G3 Z14.4 I-1.209 J.138 P1  F30000
G1 X122.79 Y131.602 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1685
G1 X136.602 Y131.602 E.45817
G1 X136.602 Y131.021 E.01928
G1 X138.398 Y131.021 E.05957
G1 X138.398 Y132.398 E.04568
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X122.73 Y131.602 E.01102
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1685
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y130.629 E.01786
G1 X138.79 Y130.629 E.07928
G1 X138.79 Y132.79 E.06641
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X124.79 Y131.159 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-.275 J-1.186 P1  F30000
G1 X122 Y131.806 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F1685
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X137.009 Y131.402 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.399252
G1 F1685
G1 X137.09 Y131.462 E.00291
; LINE_WIDTH: 0.441987
G1 X137.171 Y131.521 E.00326
; LINE_WIDTH: 0.525955
G1 X137.251 Y131.581 E.00395
G1 X137.252 Y131.952 E.01461
G1 X137.952 Y131.952 E.02756
G1 X137.952 Y131.467 E.01909
G1 X137.365 Y131.467 E.02308
; LINE_WIDTH: 0.527455
G1 X137.266 Y131.449 E.00398
; LINE_WIDTH: 0.484721
G1 X137.167 Y131.431 E.00362
; LINE_WIDTH: 0.441987
G1 X137.068 Y131.413 E.00327
G1 X122 Y131.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1685
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1685
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y124.979 E.04568
G1 X136.602 Y124.979 E.05957
G1 X136.602 Y124.398 E.01928
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1685
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y125.371 E.06641
G1 X136.21 Y125.371 E.07928
G1 X136.21 Y124.79 E.01786
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1685
G1 X136.806 Y124 E.46287
G1 X137.04 Y124.596 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.401954
G1 F1685
G1 X137.192 Y124.575 E.00447
; LINE_WIDTH: 0.443961
G1 X137.343 Y124.554 E.00499
; LINE_WIDTH: 0.525011
G3 X137.952 Y124.533 I.38 J2.184 E.02401
G1 X137.952 Y124.048 E.01906
G1 X137.252 Y124.048 E.02751
G1 X137.247 Y124.419 E.01459
; LINE_WIDTH: 0.518604
G1 X137.193 Y124.465 E.00274
; LINE_WIDTH: 0.479721
G1 X137.14 Y124.511 E.00252
; LINE_WIDTH: 0.440838
G1 X137.086 Y124.557 E.00229
G1 X122.194 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1685
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/138
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
G3 Z14.6 I-1.215 J.07 P1  F30000
G1 X122.398 Y131.602 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1690
G1 X136.602 Y131.602 E.47118
M73 P62 R10
G1 X136.602 Y130.971 E.02092
G1 X138.398 Y130.971 E.05957
G1 X138.398 Y132.398 E.04732
M73 P62 R9
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.542 E.08094
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1690
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y130.588 E.01912
G1 X138.79 Y130.588 E.07928
G1 X138.79 Y132.79 E.06767
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X124.79 Y131.159 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-.275 J-1.186 P1  F30000
G1 X122 Y131.806 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F1690
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X137.009 Y131.378 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.448548
G1 F1690
G1 X137.094 Y131.445 E.00359
; LINE_WIDTH: 0.483239
G1 X137.179 Y131.513 E.0039
; LINE_WIDTH: 0.550647
G1 X137.264 Y131.581 E.00449
G1 X137.264 Y131.94 E.01485
G1 X137.94 Y131.94 E.02795
G1 X137.94 Y131.43 E.02109
G1 X137.685 Y131.43 E.01054
; LINE_WIDTH: 0.552621
G1 X137.479 Y131.414 E.00855
; LINE_WIDTH: 0.51793
G1 X137.274 Y131.398 E.00797
; LINE_WIDTH: 0.483239
G1 X137.069 Y131.382 E.00739
G1 X122 Y131.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1690
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1690
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y125.029 E.04732
G1 X136.602 Y125.029 E.05957
G1 X136.602 Y124.398 E.02092
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1690
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y125.412 E.06767
G1 X136.21 Y125.412 E.07928
G1 X136.21 Y124.79 E.01912
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1690
G1 X136.806 Y124 E.46287
G1 X137.044 Y124.621 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.451624
G1 F1690
G1 X137.258 Y124.604 E.00713
; LINE_WIDTH: 0.48529
G1 X137.471 Y124.587 E.00772
; LINE_WIDTH: 0.549041
G3 X137.94 Y124.57 I.341 J2.96 E.01934
G1 X137.94 Y124.06 E.02102
G1 X137.264 Y124.06 E.02786
G1 X137.264 Y124.419 E.0148
; LINE_WIDTH: 0.552621
G1 X137.206 Y124.473 E.00329
; LINE_WIDTH: 0.518956
G1 X137.147 Y124.527 E.00308
; LINE_WIDTH: 0.48529
G1 X137.089 Y124.58 E.00286
G1 X122.194 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1690
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/138
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
G3 Z14.8 I-1.215 J.07 P1  F30000
G1 X122.398 Y131.602 Z14.8
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1702
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y130.922 E.02255
G1 X138.398 Y130.922 E.05957
G1 X138.398 Y132.398 E.04895
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.542 E.08094
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1702
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y130.538 E.02064
G1 X138.79 Y130.538 E.07928
G1 X138.79 Y132.79 E.06919
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X124.79 Y131.159 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-.275 J-1.186 P1  F30000
G1 X122 Y131.806 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F1702
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y131.314 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1702
G1 X137.009 Y131.392 E.00244
G1 X137.198 Y131.581 E.00819
G1 X137.198 Y132.006 E.01307
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y131.314 E.02125
G1 X137.054 Y131.314 E.02924
G1 X137.544 Y131.66 F30000
; LINE_WIDTH: 0.357458
G1 F1702
G1 X137.6 Y131.66 E.00145
G1 X122 Y131.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1702
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1702
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y125.078 E.04895
G1 X136.602 Y125.078 E.05957
G1 X136.602 Y124.398 E.02255
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1702
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y125.462 E.06919
G1 X136.21 Y125.462 E.07928
M73 P63 R9
G1 X136.21 Y124.79 E.02064
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1702
G1 X136.806 Y124 E.46287
G1 X137.049 Y124.645 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.50129
G1 F1702
G1 X137.354 Y124.665 E.01144
; LINE_WIDTH: 0.42483
G2 X138.006 Y124.686 I.479 J-4.889 E.0203
G1 X138.006 Y123.994 E.02152
G1 X137.198 Y123.994 E.02515
G1 X137.198 Y124.419 E.01323
; LINE_WIDTH: 0.419999
G1 X137.14 Y124.507 E.00323
; LINE_WIDTH: 0.460645
G1 X137.082 Y124.595 E.00358
G1 X137.544 Y124.34 F30000
; LINE_WIDTH: 0.357458
G1 F1702
G1 X137.6 Y124.34 E.00145
G1 X122.194 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1702
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/138
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
G3 Z15 I-1.215 J.07 P1  F30000
G1 X122.398 Y131.602 Z15
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1707
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y130.85 E.02494
G1 X138.398 Y130.85 E.05957
G1 X138.398 Y132.398 E.05134
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.542 E.08094
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1707
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y130.489 E.02215
G1 X136.21 Y130.458 E.00095
G1 X138.79 Y130.458 E.07928
G1 X138.79 Y130.489 E.00095
G1 X138.79 Y132.79 E.0707
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X124.79 Y131.159 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-.275 J-1.186 P1  F30000
G1 X122 Y131.806 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F1707
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y131.242 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1707
G1 X136.994 Y131.392 E.0046
G1 X137.054 Y131.398 E.00185
G1 X137.198 Y131.624 E.00824
G1 X137.198 Y132.006 E.01173
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y131.242 E.02346
G1 X137.054 Y131.242 E.02924
G1 X122 Y131.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1707
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1707
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y125.15 E.05134
G1 X136.602 Y125.15 E.05957
G1 X136.602 Y124.398 E.02494
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1707
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y125.511 E.0707
G1 X138.79 Y125.542 E.00095
G1 X136.21 Y125.542 E.07928
G1 X136.21 Y125.511 E.00095
G1 X136.21 Y124.79 E.02215
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1707
G1 X136.806 Y124 E.46287
G1 X136.994 Y124.758 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1707
G1 X138.006 Y124.758 E.03109
G1 X138.006 Y123.994 E.02346
G1 X137.198 Y123.994 E.02483
G1 X137.198 Y124.419 E.01307
G1 X137.054 Y124.602 E.00715
G1 X136.994 Y124.623 E.00195
G1 X136.994 Y124.698 E.0023
G1 X122.194 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1707
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/138
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
G3 Z15.2 I-1.215 J.07 P1  F30000
G1 X122.398 Y131.602 Z15.2
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1717
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y130.745 E.02842
G1 X138.398 Y130.745 E.05957
G1 X138.398 Y132.398 E.05482
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.542 E.08094
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1717
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y130.417 E.02436
G1 X136.21 Y130.353 E.00197
G1 X138.79 Y130.353 E.07928
G1 X138.79 Y130.417 E.00197
G1 X138.79 Y132.79 E.07291
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X124.79 Y131.159 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-.275 J-1.186 P1  F30000
G1 X122 Y131.806 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F1717
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y131.137 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1717
G1 X137.009 Y131.392 E.00784
G1 X137.081 Y131.406 E.00224
G1 X137.198 Y131.602 E.007
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y131.137 E.02669
G1 X137.054 Y131.137 E.02924
G1 X122 Y131.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1717
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1717
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y125.255 E.05482
G1 X136.602 Y125.255 E.05957
M73 P64 R9
G1 X136.602 Y124.398 E.02842
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1717
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y125.583 E.07291
G1 X138.79 Y125.647 E.00197
G1 X136.21 Y125.647 E.07928
G1 X136.21 Y125.583 E.00197
G1 X136.21 Y124.79 E.02436
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1717
G1 X136.806 Y124 E.46287
G1 X136.994 Y124.863 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1717
G1 X138.006 Y124.863 E.03109
G1 X138.006 Y123.994 E.02669
G1 X137.198 Y123.994 E.02483
G1 X137.197 Y124.432 E.01344
G1 X137.081 Y124.594 E.00614
G1 X136.994 Y124.623 E.00281
G1 X136.994 Y124.803 E.00552
G1 X122.194 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1717
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 76/138
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
G3 Z15.4 I-1.215 J.07 P1  F30000
G1 X122.398 Y131.602 Z15.4
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1730
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y130.64 E.0319
G1 X138.398 Y130.64 E.05957
G1 X138.398 Y132.398 E.0583
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.542 E.08094
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1730
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y130.312 E.02759
G1 X136.21 Y130.248 E.00197
G1 X138.79 Y130.248 E.07928
G1 X138.79 Y130.312 E.00197
G1 X138.79 Y132.79 E.07614
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X124.79 Y131.159 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-.275 J-1.186 P1  F30000
G1 X122 Y131.806 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F1730
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y131.032 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1730
G1 X137.009 Y131.392 E.01106
G1 X137.1 Y131.415 E.00288
G1 X137.198 Y131.581 E.0059
G1 X137.198 Y132.006 E.01307
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y131.032 E.02991
G1 X137.054 Y131.032 E.02924
G1 X137.602 Y131.602 F30000
; LINE_WIDTH: 0.473994
G1 F1730
G1 X137.597 Y131.504 E.00343
G1 X122 Y131.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1730
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1730
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y125.36 E.0583
G1 X136.602 Y125.36 E.05957
G1 X136.602 Y124.398 E.0319
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1730
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y125.688 E.07614
G1 X138.79 Y125.752 E.00197
G1 X136.21 Y125.752 E.07928
G1 X136.21 Y125.688 E.00197
G1 X136.21 Y124.79 E.02759
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1730
G1 X136.806 Y124 E.46287
G1 X136.994 Y124.968 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1730
G1 X138.006 Y124.968 E.03109
G1 X138.006 Y123.994 E.02991
G1 X137.198 Y123.994 E.02483
G1 X137.193 Y124.462 E.01438
G1 X137.1 Y124.585 E.00472
G1 X136.994 Y124.623 E.00346
G1 X136.994 Y124.908 E.00875
G1 X137.594 Y124.556 F30000
; LINE_WIDTH: 0.489672
G1 F1730
G1 X137.599 Y124.458 E.00356
G1 X122.194 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1730
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 77/138
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
G3 Z15.6 I-1.215 J.07 P1  F30000
G1 X122.398 Y131.602 Z15.6
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1748
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y130.478 E.03728
G1 X138.398 Y130.478 E.05957
G1 X138.398 Y132.398 E.06368
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.542 E.08094
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1748
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y130.125 E.03333
G1 X136.21 Y130.086 E.0012
G1 X138.79 Y130.086 E.07928
G1 X138.79 Y130.125 E.0012
G1 X138.79 Y130.207 E.00252
G1 X138.79 Y132.79 E.07936
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X124.79 Y131.159 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-.275 J-1.186 P1  F30000
G1 X122 Y131.806 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F1748
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y130.87 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1748
G1 X136.994 Y131.392 E.01603
G1 X137.121 Y131.429 E.00404
G1 X137.198 Y131.581 E.00524
G1 X137.198 Y132.006 E.01307
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y130.87 E.03489
G1 X137.054 Y130.87 E.02924
G1 X137.602 Y131.602 F30000
; LINE_WIDTH: 0.473994
G1 F1748
M73 P65 R9
G1 X137.589 Y131.484 E.00417
; LINE_WIDTH: 0.505775
G1 X137.576 Y131.366 E.00448
G1 X122 Y131.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1748
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1748
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y125.522 E.06368
G1 X136.602 Y125.522 E.05957
G1 X136.602 Y124.398 E.03728
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1748
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y125.875 E.08188
G1 X138.79 Y125.914 E.0012
G1 X136.21 Y125.914 E.07928
G1 X136.21 Y125.875 E.0012
G1 X136.21 Y125.793 E.00252
G1 X136.21 Y124.79 E.03081
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1748
G1 X136.806 Y124 E.46287
G1 X136.994 Y125.13 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1748
G1 X138.006 Y125.13 E.03109
G1 X138.006 Y123.994 E.03489
G1 X137.198 Y123.994 E.02483
G1 X137.178 Y124.502 E.01562
G3 X136.994 Y124.623 I-.206 J-.114 E.00705
G1 X136.994 Y125.07 E.01373
G1 X137.57 Y124.694 F30000
; LINE_WIDTH: 0.537556
G1 F1748
G1 X137.583 Y124.576 E.00478
; LINE_WIDTH: 0.505775
G1 X137.595 Y124.458 E.00448
G1 X122.194 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1748
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 78/138
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
G3 Z15.8 I-1.215 J.07 P1  F30000
G1 X122.398 Y131.602 Z15.8
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1767
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y130.301 E.04316
G1 X138.398 Y130.301 E.05957
G1 X138.398 Y132.398 E.06956
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.542 E.08094
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1767
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y129.963 E.03831
G1 X136.21 Y129.909 E.00166
G1 X138.79 Y129.909 E.07928
G1 X138.79 Y129.963 E.00166
G1 X138.79 Y130.045 E.00252
G1 X138.79 Y132.79 E.08434
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X124.79 Y131.159 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-.275 J-1.186 P1  F30000
G1 X122 Y131.806 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F1767
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y130.693 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1767
G1 X136.994 Y131.392 E.02148
G1 X137.157 Y131.464 E.00547
G1 X137.198 Y131.602 E.00442
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y130.693 E.04034
G1 X137.054 Y130.693 E.02924
G1 X137.602 Y131.602 F30000
; LINE_WIDTH: 0.473994
G1 F1767
G1 X137.581 Y131.477 E.00444
; LINE_WIDTH: 0.521704
G1 X137.561 Y131.353 E.00493
; LINE_WIDTH: 0.569414
G1 X137.54 Y131.228 E.00542
G1 X122 Y131.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1767
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1767
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y125.699 E.06956
G1 X136.602 Y125.699 E.05957
G1 X136.602 Y124.398 E.04316
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1767
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y126.037 E.08686
G1 X138.79 Y126.091 E.00166
G1 X136.21 Y126.091 E.07928
G1 X136.21 Y126.037 E.00166
G1 X136.21 Y125.955 E.00252
G1 X136.21 Y124.79 E.03579
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1767
G1 X136.806 Y124 E.46287
G1 X136.994 Y125.307 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1767
G1 X138.006 Y125.307 E.03109
G1 X138.006 Y123.994 E.04034
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G1 X137.157 Y124.536 E.00284
G1 X136.994 Y124.623 E.00567
G1 X136.994 Y125.247 E.01917
G1 X137.602 Y124.398 F30000
; LINE_WIDTH: 0.473994
G1 F1767
G1 X137.581 Y124.523 E.00444
; LINE_WIDTH: 0.521704
G1 X137.561 Y124.647 E.00493
; LINE_WIDTH: 0.569414
G1 X137.54 Y124.772 E.00542
G1 X122.194 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1767
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
M73 P65 R8
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 79/138
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
G3 Z16 I-1.215 J.07 P1  F30000
G1 X122.398 Y131.602 Z16
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1821
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y130.058 E.0512
G1 X138.398 Y130.058 E.05957
G1 X138.398 Y132.398 E.0776
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.542 E.08094
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1821
G1 X136.21 Y131.21 E.41236
M73 P66 R8
G1 X136.21 Y129.868 E.04124
G1 X136.21 Y129.704 E.00504
M106 S255
G1 F1800
G1 X136.21 Y129.666 E.00115
G1 X138.79 Y129.666 E.07928
G1 X138.79 Y129.704 E.00115
M106 S252.45
G1 F1821
G1 X138.79 Y129.868 E.00504
G1 X138.79 Y132.79 E.08979
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X124.79 Y131.159 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-.275 J-1.186 P1  F30000
G1 X122 Y131.806 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F1821
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y130.451 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1821
G1 X136.994 Y131.392 E.02893
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y130.451 E.04779
G1 X137.054 Y130.451 E.02924
G1 X137.341 Y130.798 F30000
; LINE_WIDTH: 0.360223
G1 F1821
G1 X137.341 Y131.182 E.00995
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.373 E.00734
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.164 E.00669
; LINE_WIDTH: 0.372903
G2 X137.659 Y130.798 I-2.003 J-.287 E.00989
G1 X137.401 Y130.798 E.00692
; WIPE_START
G1 F24000
G1 X137.659 Y130.798 E-.31312
G1 X137.64 Y131.164 E-.44688
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-.05 J-1.216 P1  F30000
G1 X122 Y131.806 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1821
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1821
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y125.942 E.0776
G1 X136.602 Y125.942 E.05957
G1 X136.602 Y124.398 E.0512
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1821
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y126.132 E.08979
G1 X138.79 Y126.296 E.00504
M106 S255
G1 F1800
G1 X138.79 Y126.334 E.00115
G1 X136.21 Y126.334 E.07928
G1 X136.21 Y126.296 E.00115
M106 S252.45
G1 F1821
G1 X136.21 Y126.132 E.00504
G1 X136.21 Y124.79 E.04124
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1821
G1 X136.806 Y124 E.46287
G1 X136.994 Y125.549 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1821
G1 X138.006 Y125.549 E.03109
G1 X138.006 Y123.994 E.04779
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G1 X137.142 Y124.553 E.00349
G1 X136.994 Y124.623 E.00504
G1 X136.994 Y125.489 E.02663
G1 X137.5 Y125.044 F30000
; LINE_WIDTH: 0.677526
G1 F1821
G1 X137.524 Y124.913 E.00685
; LINE_WIDTH: 0.628888
G1 X137.549 Y124.783 E.00633
; LINE_WIDTH: 0.58025
G1 X137.573 Y124.653 E.0058
; LINE_WIDTH: 0.531612
G1 X137.597 Y124.523 E.00528
; LINE_WIDTH: 0.482974
G1 X137.6 Y124.458 E.00231
G1 X122.194 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1821
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 80/138
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
G3 Z16.2 I-1.215 J.07 P1  F30000
G1 X122.398 Y131.602 Z16.2
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1978
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y129.769 E.06082
G1 X138.398 Y129.769 E.05957
G1 X138.398 Y132.398 E.08722
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.542 E.08094
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1978
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y129.625 E.04869
G1 X136.21 Y129.379 E.00756
M106 S255
G1 F600
G1 X138.79 Y129.379 E.07928
M106 S252.45
G1 F1978
G1 X138.79 Y129.625 E.00756
G1 X138.79 Y132.79 E.09724
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X124.79 Y131.159 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I-.275 J-1.186 P1  F30000
G1 X122 Y131.806 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F1978
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y130.161 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1978
G1 X136.994 Y131.392 E.03783
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y130.161 E.05669
G1 X137.054 Y130.161 E.02924
G1 X137.341 Y130.508 F30000
; LINE_WIDTH: 0.360223
G1 F1978
G1 X137.341 Y131.182 E.01744
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.366451
G2 X137.659 Y130.508 I-7.362 J-.56 E.01966
G1 X137.401 Y130.508 E.00678
; WIPE_START
G1 F24000
G1 X137.659 Y130.508 E-.19485
G1 X137.659 Y131.089 E-.44034
G1 X137.64 Y131.253 E-.12481
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I.15 J-1.208 P1  F30000
G1 X122 Y129.306 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1978
G1 X122 Y131.806 E.0792
; WIPE_START
G1 F24000
G1 X122 Y129.806 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I1.214 J.089 P1  F30000
G1 X122.398 Y124.398 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1978
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y126.231 E.08722
G1 X136.602 Y126.231 E.05957
G1 X136.602 Y124.398 E.06082
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1978
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y126.375 E.09724
G1 X138.79 Y126.621 E.00756
M106 S255
G1 F600
G1 X136.21 Y126.621 E.07928
M106 S252.45
G1 F1978
G1 X136.21 Y126.375 E.00756
G1 X136.21 Y124.79 E.04869
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1978
G1 X136.806 Y124 E.46287
G1 X137.549 Y124.715 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.57931
G1 F1978
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544206
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.509101
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.492 F30000
; LINE_WIDTH: 0.360223
G1 F1978
G1 X137.659 Y125.492 E.0082
G1 X137.659 Y125.109 E.00991
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.4 Y124.96 E.00206
; LINE_WIDTH: 0.478066
G1 X137.381 Y125.01 E.00189
; LINE_WIDTH: 0.438785
G1 X137.361 Y125.059 E.00172
; LINE_WIDTH: 0.365779
G1 X137.341 Y125.109 E.0014
G1 X137.341 Y125.432 E.00851
G1 X136.994 Y125.839 F30000
; LINE_WIDTH: 0.419999
G1 F1978
G1 X138.006 Y125.839 E.03109
G1 X138.006 Y123.994 E.05669
G1 X137.198 Y123.994 E.02483
M73 P67 R8
G1 X137.195 Y124.452 E.01407
G1 X137.142 Y124.553 E.00349
G1 X136.994 Y124.623 E.00504
G1 X136.994 Y125.779 E.03553
; WIPE_START
G1 F24000
G1 X136.994 Y124.623 E-.43939
G1 X137.142 Y124.553 E-.06233
G1 X137.195 Y124.452 E-.04317
G1 X137.198 Y123.994 E-.17397
G1 X137.306 Y123.994 E-.04113
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I0 J-1.217 P1  F30000
G1 X122.194 Y124 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1978
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 81/138
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
G3 Z16.4 I-1.215 J.07 P1  F30000
G1 X122.398 Y131.602 Z16.4
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1933
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y129.349 E.07473
G1 X136.602 Y129.264 E.00281
G1 X138.398 Y129.264 E.05957
G1 X138.398 Y129.349 E.00281
G1 X138.398 Y132.398 E.10113
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.542 E.08094
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1933
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y128.967 E.06893
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X136.21 Y128.872 E.00313
G1 X138.79 Y128.872 E.08558
G1 X138.79 Y128.967 E.00313
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1933
G1 X138.79 Y129.336 E.01134
G1 X138.79 Y132.79 E.10614
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X124.79 Y131.159 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I-.275 J-1.186 P1  F30000
G1 X122 Y131.806 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F1933
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y129.656 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1933
G1 X136.994 Y131.392 E.05333
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y129.656 E.07219
G1 X137.054 Y129.656 E.02924
G1 X137.341 Y130.004 F30000
; LINE_WIDTH: 0.360223
G1 F1933
G1 X137.341 Y131.182 E.03048
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.364368
G1 X137.659 Y131.089 E.00432
G1 X137.659 Y130.004 E.02844
G1 X137.401 Y130.004 E.00674
; WIPE_START
G1 F24000
G1 X137.659 Y130.004 E-.12968
G1 X137.659 Y131.089 E-.54725
G1 X137.64 Y131.253 E-.08306
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I.15 J-1.208 P1  F30000
G1 X122 Y129.306 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1933
G1 X122 Y131.806 E.0792
; WIPE_START
G1 F24000
G1 X122 Y129.806 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I1.214 J.089 P1  F30000
G1 X122.398 Y124.398 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1933
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y126.651 E.10113
G1 X138.398 Y126.736 E.00281
G1 X136.602 Y126.736 E.05957
G1 X136.602 Y126.651 E.00281
G1 X136.602 Y124.398 E.07473
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1933
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y127.033 E.11748
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X138.79 Y127.128 E.00313
G1 X136.21 Y127.128 E.08558
G1 X136.21 Y127.033 E.00313
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1933
G1 X136.21 Y126.664 E.01134
G1 X136.21 Y124.79 E.05759
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1933
G1 X136.806 Y124 E.46287
G1 X137.549 Y124.715 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.57931
G1 F1933
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.996 F30000
; LINE_WIDTH: 0.360223
G1 F1933
G1 X137.659 Y125.996 E.0082
G1 X137.659 Y125.109 E.02295
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.4 Y124.96 E.00206
; LINE_WIDTH: 0.478066
G1 X137.381 Y125.01 E.00189
; LINE_WIDTH: 0.438785
G1 X137.361 Y125.059 E.00172
; LINE_WIDTH: 0.362598
G1 X137.341 Y125.109 E.00139
G1 X137.341 Y125.936 E.02156
G1 X136.994 Y126.344 F30000
; LINE_WIDTH: 0.419999
G1 F1933
G1 X138.006 Y126.344 E.03109
G1 X138.006 Y123.994 E.07219
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G1 X137.142 Y124.553 E.00349
G1 X136.994 Y124.623 E.00504
G1 X136.994 Y126.284 E.05103
; WIPE_START
G1 F24000
G1 X136.994 Y124.623 E-.63104
G1 X137.142 Y124.553 E-.06233
G1 X137.195 Y124.452 E-.04317
G1 X137.195 Y124.39 E-.02345
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I.032 J-1.217 P1  F30000
G1 X122.194 Y124 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1933
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 82/138
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
G3 Z16.6 I.727 J.976 P1  F30000
G1 X122.398 Y124.398 Z16.6
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1903
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y127.538 E.13055
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X138.398 Y128.462 E.03067
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F1903
G1 X138.398 Y128.845 E.01269
G1 X138.398 Y132.398 E.11786
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y128.462 E.10415
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X136.602 Y127.538 E.03067
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F1903
G1 X136.602 Y124.398 E.10415
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1903
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y127.538 E.13298
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X138.79 Y128.462 E.03067
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1903
G1 X138.79 Y128.831 E.01134
G1 X138.79 Y132.79 E.12164
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y128.462 E.08443
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X136.21 Y127.538 E.03067
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1903
G1 X136.21 Y124.79 E.08443
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1903
G1 X136.806 Y124 E.46287
G1 X137.549 Y124.715 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.57931
G1 F1903
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544206
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.509101
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.842 F30000
; LINE_WIDTH: 0.360223
G1 F1903
G1 X137.659 Y125.842 E.0082
G1 X137.659 Y125.109 E.01896
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.4 Y124.96 E.00206
; LINE_WIDTH: 0.478066
G1 X137.381 Y125.01 E.00189
; LINE_WIDTH: 0.438785
G1 X137.361 Y125.059 E.00172
; LINE_WIDTH: 0.363103
G1 X137.341 Y125.109 E.00139
G1 X137.341 Y125.782 E.01757
G1 X136.994 Y126.189 F30000
; LINE_WIDTH: 0.419999
G1 F1903
G1 X138.006 Y126.189 E.03109
G1 X138.006 Y123.994 E.06745
M73 P68 R8
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G1 X137.142 Y124.553 E.00349
G1 X136.994 Y124.623 E.00504
G1 X136.994 Y126.129 E.04628
G1 X136.973 Y126.397 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.495415
M106 S255
G1 F3000
G1 X136.973 Y129.434 E.11199
G1 X137.426 Y129.434 E.01668
G1 X137.426 Y126.566 E.10573
G1 X137.878 Y126.566 E.01668
G1 X137.878 Y129.603 E.11199
M106 S252.45
G1 X136.994 Y129.811 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1903
G1 X136.994 Y131.392 E.04859
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y129.811 E.06745
G1 X137.054 Y129.811 E.02924
G1 X137.341 Y130.158 F30000
; LINE_WIDTH: 0.360223
G1 F1903
G1 X137.341 Y131.182 E.02649
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.364841
G1 X137.659 Y131.089 E.00432
G1 X137.659 Y130.158 E.02443
G1 X137.401 Y130.158 E.00675
G1 X136.806 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1903
G1 X122.194 Y132 E.46287
G1 X122.114 Y131.983 E.0026
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00298
G1 X122 Y131.806 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I1.217 J0 P1  F30000
G1 X122 Y126.694 Z16.8
G1 Z16.4
G1 E.8 F1800
G1 F1903
G1 X122 Y124.194 E.0792
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00595
G1 X122.114 Y124.017 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y124 E.0026
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X122.114 Y124.017 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 83/138
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
G3 Z16.8 I-.976 J.727 P1  F30000
G1 X122.398 Y124.398 Z16.8
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1961
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1961
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1961
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z17
G1 Z16.6
G1 E.8 F1800
G1 F1961
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1961
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1961
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1961
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1961
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 84/138
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
G3 Z17 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z17
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z17.2
G1 Z16.8
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
M73 P69 R8
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 85/138
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
G3 Z17.2 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z17.2
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z17.4
G1 Z17
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
M73 P69 R7
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 17.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 86/138
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
G3 Z17.4 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z17.4
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z17.6
G1 Z17.2
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
M73 P70 R7
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 17.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 87/138
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
G3 Z17.6 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z17.6
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z17.8
G1 Z17.4
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 17.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 88/138
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
G3 Z17.8 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z17.8
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P71 R7
G3 Z18 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z18
G1 Z17.6
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 17.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 89/138
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
G3 Z18 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z18
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z18.2
G1 Z17.8
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 18
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 90/138
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
G3 Z18.2 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z18.2
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
M73 P72 R7
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z18.4
G1 Z18
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 18.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 91/138
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
G3 Z18.4 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z18.4
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z18.6
G1 Z18.2
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
M73 P73 R7
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 18.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 92/138
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
G3 Z18.6 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z18.6
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.8 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z18.8
G1 Z18.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.8 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z18.8
G1 Z18.4
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
M73 P73 R6
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 18.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 93/138
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
G3 Z18.8 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z18.8
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z19
G1 Z18.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z19
G1 Z18.6
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
M73 P74 R6
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 18.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 94/138
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
G3 Z19 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z19
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z19.2
G1 Z18.8
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 19
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 95/138
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
G3 Z19.2 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z19.2
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z19.4
G1 Z19
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z19.4
G1 Z19
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
M73 P75 R6
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 19.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 96/138
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
G3 Z19.4 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z19.4
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.6 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.6 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z19.6
G1 Z19.2
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 19.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 97/138
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
G3 Z19.6 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z19.6
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.8 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z19.8
G1 Z19.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.8 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z19.8
G1 Z19.4
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
M73 P76 R6
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 19.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 98/138
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
G3 Z19.8 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z19.8
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z20
G1 Z19.6
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 19.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 99/138
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
G3 Z20 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z20
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.2 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.2 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z20.2
G1 Z19.8
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
M73 P77 R6
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
M73 P77 R5
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 20
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 100/138
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
G3 Z20.2 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z20.2
G1 Z20
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.4 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.4 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z20.4
G1 Z20
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 20.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 101/138
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
G3 Z20.4 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z20.4
G1 Z20.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.6 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z20.6
G1 Z20.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.6 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z20.6
G1 Z20.2
M73 P78 R5
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X137.602 Y124.398 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.473994
G1 F1963
G1 X137.587 Y124.484 E.00305
; LINE_WIDTH: 0.5091
G1 X137.573 Y124.57 E.0033
; LINE_WIDTH: 0.544205
G1 X137.559 Y124.655 E.00355
G1 X136.994 Y124.623 F30000
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 20.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 102/138
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
G3 Z20.6 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z20.6
G1 Z20.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.8 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z20.8
G1 Z20.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.8 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z20.8
G1 Z20.4
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 20.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 103/138
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
G3 Z20.8 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z20.8
G1 Z20.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
M73 P79 R5
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z21
G1 Z20.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z21
G1 Z20.6
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 20.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 104/138
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
G3 Z21 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z21
G1 Z20.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1965
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1965
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.2 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z21.2
G1 Z20.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1965
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.2 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z21.2
G1 Z20.8
G1 E.8 F1800
G1 F1965
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X137.597 Y124.523 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.482974
G1 F1965
G1 X137.602 Y124.398 E.00446
; LINE_WIDTH: 0.473994
G1 X137.584 Y124.504 E.00376
; LINE_WIDTH: 0.5091
G1 X137.567 Y124.609 E.00406
; LINE_WIDTH: 0.544205
G1 X137.549 Y124.715 E.00437
; LINE_WIDTH: 0.57931
G1 X137.566 Y124.648 E.00302
; LINE_WIDTH: 0.531142
G1 X137.583 Y124.581 E.00275
G1 X136.994 Y124.623 F30000
; LINE_WIDTH: 0.419999
G1 F1965
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1965
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
M73 P80 R5
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1965
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 21
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 105/138
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
G3 Z21.2 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z21.2
G1 Z21
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.4 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z21.4
G1 Z21
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.4 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z21.4
G1 Z21
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 21.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 106/138
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
G3 Z21.4 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z21.4
G1 Z21.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.6 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z21.6
G1 Z21.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.6 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z21.6
G1 Z21.2
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
M73 P81 R5
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
M73 P81 R4
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 21.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 107/138
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
G3 Z21.6 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z21.6
G1 Z21.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.8 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z21.8
G1 Z21.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.8 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z21.8
G1 Z21.4
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 21.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 108/138
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
G3 Z21.8 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z21.8
G1 Z21.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z22
G1 Z21.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z22
G1 Z21.6
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
M73 P82 R4
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 21.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 109/138
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
G3 Z22 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z22
G1 Z21.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.2 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z22.2
G1 Z21.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.2 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z22.2
G1 Z21.8
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 22
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 110/138
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
G3 Z22.2 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z22.2
G1 Z22
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.4 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z22.4
G1 Z22
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.4 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z22.4
G1 Z22
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
M73 P83 R4
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 22.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 111/138
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
G3 Z22.4 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z22.4
G1 Z22.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.6 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z22.6
G1 Z22.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.6 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z22.6
G1 Z22.2
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X137.602 Y124.398 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.473994
G1 F1963
G1 X137.587 Y124.484 E.00305
; LINE_WIDTH: 0.5091
G1 X137.573 Y124.57 E.0033
; LINE_WIDTH: 0.544205
G1 X137.559 Y124.655 E.00355
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.994 Y124.911 F30000
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.19916
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G1 X137.142 Y124.553 E.00349
G1 X136.994 Y124.623 E.00504
G1 X136.994 Y124.851 E.00699
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 22.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 112/138
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
G3 Z22.6 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z22.6
G1 Z22.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.8 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z22.8
G1 Z22.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.8 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z22.8
G1 Z22.4
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
M73 P84 R4
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 22.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 113/138
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
G3 Z22.8 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z22.8
G1 Z22.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z23
G1 Z22.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z23
G1 Z22.6
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
M73 P84 R3
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 22.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 114/138
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
G3 Z23 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z23
G1 Z22.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.2 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z23.2
G1 Z22.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.2 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z23.2
G1 Z22.8
M73 P85 R3
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 23
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 115/138
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
G3 Z23.2 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z23.2
G1 Z23
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.4 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z23.4
G1 Z23
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.4 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z23.4
G1 Z23
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 23.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 116/138
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
G3 Z23.4 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z23.4
G1 Z23.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2010
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X123.406 Y123.602 E.05985
M73 P86 R3
G1 X123.406 Y124.398 E.0264
G1 X122.458 Y124.398 E.03146
; WIPE_START
G1 F24000
G1 X122.41 Y126.397 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.6 I.676 J1.012 P1  F30000
G1 X126.594 Y123.602 Z23.6
G1 Z23.2
G1 E.8 F1800
G1 F2010
G1 X138.398 Y123.602 E.39157
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X126.594 Y124.398 E.332
G1 X126.594 Y123.662 E.02441
; WIPE_START
G1 F24000
G1 X128.594 Y123.652 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.6 I-.234 J-1.194 P1  F30000
G1 X122.79 Y124.79 Z23.6
G1 Z23.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2010
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
G1 X123.203 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F2010
G1 X122.194 Y124 E.03195
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.6 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z23.6
G1 Z23.2
G1 E.8 F1800
G1 F2010
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2010
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F2010
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F2010
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F2010
G1 X126.797 Y124 E.31706
G1 X125.685 Y124.583 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2010
G1 X126.371 Y123.896 E.02982
G1 X126.317 Y123.417
G1 X125.152 Y124.583 E.05063
G1 X124.618 Y124.583
G1 X125.784 Y123.417 E.05063
G1 X125.25 Y123.417
G1 X124.085 Y124.583 E.05063
G1 X123.629 Y124.506
G1 X124.717 Y123.417 E.04729
G1 X124.184 Y123.417
G1 X123.629 Y123.972 E.02412
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 23.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X124.184 Y123.417 E-.29826
G1 X124.717 Y123.417 E-.20264
G1 X124.235 Y123.9 E-.2591
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 117/138
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
G3 Z23.6 I-1.148 J-.405 P1  F30000
G1 X122.398 Y129.102 Z23.6
G1 Z23.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2041
G1 X122.398 Y131.602 E.08293
G1 X123.199 Y131.602 E.02658
G1 X123.199 Y132.398 E.0264
G1 X121.602 Y132.398 E.05298
G1 X121.602 Y129.102 E.10933
G1 X122.338 Y129.102 E.02441
; WIPE_START
G1 F24000
G1 X122.386 Y131.102 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.8 I.519 J1.101 P1  F30000
G1 X136.602 Y124.398 Z23.8
G1 Z23.4
G1 E.8 F1800
G1 F2041
G1 X126.118 Y124.398 E.34778
G1 X126.118 Y123.602 E.0264
G1 X138.398 Y123.602 E.40735
G1 X138.398 Y132.398 E.29177
G1 X126.801 Y132.398 E.3847
G1 X126.801 Y131.602 E.0264
G1 X136.602 Y131.602 E.32513
G1 X136.602 Y124.458 E.23698
G1 X136.21 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2041
G1 X125.726 Y124.79 E.32215
G1 X125.726 Y123.21 E.04855
G1 X138.79 Y123.21 E.40142
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.85 E.19543
M204 S10000
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2041
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F2041
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F2041
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F2041
G1 X126.321 Y124 E.33213
; WIPE_START
G1 F24000
G1 X128.321 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.8 I-.782 J-.932 P1  F30000
G1 X122 Y129.306 Z23.8
G1 Z23.4
G1 E.8 F1800
G1 F2041
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X122.996 Y132 E.02539
; WIPE_START
G1 F24000
G1 X122.194 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.8 I.062 J1.215 P1  F30000
G1 X126.578 Y131.778 Z23.8
G1 Z23.4
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
M73 P87 R3
G1 F2041
G1 X126.218 Y131.417 E.01565
G1 X125.685 Y131.417
G1 X126.578 Y132.311 E.03882
G1 X126.317 Y132.583
G1 X125.152 Y131.417 E.05063
G1 X124.618 Y131.417
G1 X125.784 Y132.583 E.05063
G1 X125.25 Y132.583
G1 X124.085 Y131.417 E.05063
G1 X123.552 Y131.417
G1 X124.717 Y132.583 E.05063
G1 X124.184 Y132.583
G1 X123.422 Y131.82 E.03312
M204 S10000
; WIPE_START
G1 F24000
G1 X124.184 Y132.583 E-.40957
G1 X124.717 Y132.583 E-.20264
G1 X124.442 Y132.308 E-.14779
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.8 I.145 J1.208 P1  F30000
G1 X127.004 Y132 Z23.8
G1 Z23.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F2041
G1 X136.806 Y132 E.3105
; WIPE_START
G1 F24000
G1 X134.806 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.8 I.636 J-1.038 P1  F30000
G1 X122.398 Y124.398 Z23.8
G1 Z23.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2041
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X123.882 Y123.602 E.07563
G1 X123.882 Y124.398 E.0264
G1 X122.458 Y124.398 E.04724
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2041
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X124.274 Y123.21 E.09415
G1 X124.274 Y124.79 E.04855
G1 X122.85 Y124.79 E.04376
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.8 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z23.8
G1 Z23.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F2041
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
G1 X122.194 Y124 F30000
G1 F2041
G1 X123.679 Y124 E.04702
; CHANGE_LAYER
; Z_HEIGHT: 23.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X122.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 118/138
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
G3 Z23.8 I-.034 J1.217 P1  F30000
G1 X136.602 Y124.398 Z23.8
G1 Z23.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1883
G1 X126.5 Y124.398 E.33511
G1 X126.5 Y123.602 E.0264
G1 X138.398 Y123.602 E.39468
G1 X138.398 Y132.398 E.29177
G1 X126.325 Y132.398 E.40048
G1 X126.325 Y131.602 E.0264
G1 X136.602 Y131.602 E.34091
G1 X136.602 Y124.458 E.23698
G1 X136.21 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1883
G1 X126.108 Y124.79 E.31041
G1 X126.108 Y123.21 E.04855
G1 X138.79 Y123.21 E.38969
G1 X138.79 Y132.79 E.29437
G1 X125.933 Y132.79 E.39506
G1 X125.933 Y131.21 E.04855
G1 X136.21 Y131.21 E.31578
G1 X136.21 Y124.85 E.19543
M204 S10000
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1883
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1883
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1883
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1883
G1 X126.703 Y124 E.32003
; WIPE_START
G1 F24000
G1 X128.703 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24 I-1.174 J-.319 P1  F30000
G1 X126.529 Y132 Z24
G1 Z23.6
G1 E.8 F1800
G1 F1883
G1 X136.806 Y132 E.32557
; WIPE_START
G1 F24000
G1 X134.806 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24 I.077 J-1.215 P1  F30000
G1 X122.398 Y131.21 Z24
G1 Z23.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1883
G1 X122.398 Y131.602 E.01301
G1 X123.675 Y131.602 E.04236
G1 X123.675 Y132.398 E.0264
G1 X121.602 Y132.398 E.06876
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.15 E.06793
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1883
G1 X124.067 Y131.21 E.03924
G1 X124.067 Y132.79 E.04855
G1 X121.21 Y132.79 E.08779
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X124.067 Y131.21 E-.4858
G1 X124.067 Y131.932 E-.2742
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24 I.074 J-1.215 P1  F30000
G1 X122 Y131.806 Z24
G1 Z23.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F1883
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X123.471 Y132 E.04046
G1 X122 Y131.806 F30000
G1 F1883
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z24
G1 Z23.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1883
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X123.5 Y123.602 E.06296
G1 X123.5 Y124.398 E.0264
G1 X122.458 Y124.398 E.03457
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1883
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.892 Y123.21 E.08242
G1 X123.892 Y124.79 E.04855
G1 X122.85 Y124.79 E.03203
M204 S10000
G1 X123.297 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1883
G1 X122.194 Y124 E.03492
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 23.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 119/138
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
G3 Z24 I.025 J1.217 P1  F30000
G1 X136.602 Y124.398 Z24
G1 Z23.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1825
G1 X126.728 Y124.398 E.32756
G1 X126.728 Y123.602 E.0264
G1 X138.398 Y123.602 E.38713
G1 X138.398 Y132.398 E.29177
G1 X126.595 Y132.398 E.39153
G1 X126.595 Y131.602 E.0264
G1 X136.602 Y131.602 E.33196
G1 X136.602 Y124.458 E.23698
G1 X136.21 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1825
G1 X126.335 Y124.79 E.30342
G1 X126.335 Y123.21 E.04855
G1 X138.79 Y123.21 E.38269
G1 X138.79 Y132.79 E.29437
G1 X126.203 Y132.79 E.38677
G1 X126.203 Y131.21 E.04855
G1 X136.21 Y131.21 E.30749
G1 X136.21 Y124.85 E.19543
M204 S10000
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1825
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1825
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1825
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1825
G1 X126.931 Y124 E.31282
; WIPE_START
G1 F24000
G1 X128.931 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.2 I-1.176 J-.313 P1  F30000
G1 X126.798 Y132 Z24.2
G1 Z23.8
G1 E.8 F1800
G1 F1825
M73 P88 R3
G1 X136.806 Y132 E.31702
; WIPE_START
G1 F24000
G1 X134.806 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.2 I.077 J-1.215 P1  F30000
G1 X122.398 Y131.21 Z24.2
G1 Z23.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1825
G1 X122.398 Y131.602 E.01301
G1 X123.405 Y131.602 E.03341
G1 X123.405 Y132.398 E.0264
G1 X121.602 Y132.398 E.05981
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.15 E.06793
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1825
G1 X123.797 Y131.21 E.03095
G1 X123.797 Y132.79 E.04855
G1 X121.21 Y132.79 E.0795
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
G1 X123.202 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1825
G1 X122.194 Y132 E.03191
G1 X122.114 Y131.983 E.0026
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00298
G1 X122 Y131.806 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.2 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z24.2
G1 Z23.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1825
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X123.272 Y123.602 E.05541
G1 X123.272 Y124.398 E.0264
G1 X122.458 Y124.398 E.02702
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1825
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.665 Y123.21 E.07542
G1 X123.665 Y124.79 E.04855
G1 X122.85 Y124.79 E.02503
M204 S10000
G1 X123.069 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1825
G1 X122.194 Y124 E.0277
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 24
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 120/138
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
G3 Z24.2 I.025 J1.217 P1  F30000
G1 X136.602 Y124.398 Z24.2
G1 Z24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1798
G1 X126.894 Y124.398 E.32204
G1 X126.894 Y123.602 E.0264
G1 X138.398 Y123.602 E.38162
G1 X138.398 Y132.398 E.29177
G1 X126.772 Y132.398 E.38565
G1 X126.772 Y131.602 E.0264
G1 X136.602 Y131.602 E.32608
G1 X136.602 Y124.458 E.23698
G1 X136.21 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1798
G1 X126.502 Y124.79 E.29831
G1 X126.502 Y123.21 E.04855
G1 X138.79 Y123.21 E.37759
G1 X138.79 Y132.79 E.29437
G1 X126.38 Y132.79 E.38132
G1 X126.38 Y131.21 E.04855
G1 X136.21 Y131.21 E.30205
G1 X136.21 Y124.85 E.19543
M204 S10000
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1798
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1798
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1798
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1798
G1 X127.097 Y124 E.30755
; WIPE_START
G1 F24000
G1 X129.097 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.4 I-1.176 J-.312 P1  F30000
G1 X126.976 Y132 Z24.4
G1 Z24
G1 E.8 F1800
G1 F1798
G1 X136.806 Y132 E.31141
; WIPE_START
G1 F24000
G1 X134.806 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P88 R2
G3 Z24.4 I.077 J-1.215 P1  F30000
G1 X122.398 Y131.21 Z24.4
G1 Z24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1798
G1 X122.398 Y131.602 E.01301
G1 X123.228 Y131.602 E.02753
G1 X123.228 Y132.398 E.0264
G1 X121.602 Y132.398 E.05393
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.15 E.06793
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1798
G1 X123.62 Y131.21 E.0255
G1 X123.62 Y132.79 E.04855
G1 X121.21 Y132.79 E.07405
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
G1 X123.024 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1798
G1 X122.194 Y132 E.02629
G1 X122.114 Y131.983 E.0026
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00298
G1 X122 Y131.806 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.4 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z24.4
G1 Z24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1798
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X123.106 Y123.602 E.0499
G1 X123.106 Y124.398 E.0264
G1 X122.458 Y124.398 E.02151
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1798
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.498 Y123.21 E.07032
G1 X123.498 Y124.79 E.04855
G1 X122.85 Y124.79 E.01992
M204 S10000
G1 X122.903 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1798
G1 X122.194 Y124 E.02244
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 24.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 121/138
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
G3 Z24.4 I.025 J1.217 P1  F30000
G1 X136.602 Y124.398 Z24.4
G1 Z24.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1781
G1 X126.999 Y124.398 E.31856
G1 X126.999 Y123.602 E.0264
G1 X138.398 Y123.602 E.37813
G1 X138.398 Y132.398 E.29177
G1 X126.887 Y132.398 E.38185
G1 X126.887 Y131.602 E.0264
G1 X136.602 Y131.602 E.32228
G1 X136.602 Y124.458 E.23698
G1 X136.21 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1781
G1 X126.607 Y124.79 E.29509
G1 X126.607 Y123.21 E.04855
G1 X138.79 Y123.21 E.37436
G1 X138.79 Y132.79 E.29437
G1 X126.494 Y132.79 E.37781
G1 X126.494 Y131.21 E.04855
G1 X136.21 Y131.21 E.29853
G1 X136.21 Y124.85 E.19543
M204 S10000
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1781
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1781
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1781
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1781
M73 P89 R2
G1 X127.202 Y124 E.30423
; WIPE_START
G1 F24000
G1 X129.202 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.6 I-1.177 J-.311 P1  F30000
G1 X127.09 Y132 Z24.6
G1 Z24.2
G1 E.8 F1800
G1 F1781
G1 X136.806 Y132 E.30778
; WIPE_START
G1 F24000
G1 X134.806 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.6 I.077 J-1.215 P1  F30000
G1 X122.398 Y131.21 Z24.6
G1 Z24.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1781
G1 X122.398 Y131.602 E.01301
G1 X123.113 Y131.602 E.02373
G1 X123.113 Y132.398 E.0264
G1 X121.602 Y132.398 E.05013
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.15 E.06793
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1781
G1 X123.506 Y131.21 E.02199
G1 X123.506 Y132.79 E.04855
G1 X121.21 Y132.79 E.07053
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
G1 X122.91 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1781
G1 X122.194 Y132 E.02267
G1 X122.114 Y131.983 E.0026
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00298
G1 X122 Y131.806 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.6 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z24.6
G1 Z24.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1781
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X123.001 Y123.602 E.04642
G1 X123.001 Y124.398 E.0264
G1 X122.458 Y124.398 E.01803
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1781
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.393 Y123.21 E.06709
G1 X123.393 Y124.79 E.04855
G1 X122.85 Y124.79 E.0167
M204 S10000
G1 X122.798 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1781
G1 X122.194 Y124 E.01912
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 24.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 122/138
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
G3 Z24.6 I.025 J1.217 P1  F30000
G1 X136.602 Y124.398 Z24.6
G1 Z24.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1768
G1 X127.076 Y124.398 E.316
G1 X127.076 Y123.602 E.0264
G1 X138.398 Y123.602 E.37557
G1 X138.398 Y132.398 E.29177
G1 X126.974 Y132.398 E.37896
G1 X126.974 Y131.602 E.0264
G1 X136.602 Y131.602 E.31939
G1 X136.602 Y124.458 E.23698
G1 X136.21 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1768
G1 X126.684 Y124.79 E.29271
G1 X126.684 Y123.21 E.04855
G1 X138.79 Y123.21 E.37199
G1 X138.79 Y132.79 E.29437
G1 X126.582 Y132.79 E.37513
G1 X126.582 Y131.21 E.04855
G1 X136.21 Y131.21 E.29585
G1 X136.21 Y124.85 E.19543
M204 S10000
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1768
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1768
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1768
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1768
G1 X127.279 Y124 E.30178
; WIPE_START
G1 F24000
G1 X129.279 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.8 I-1.177 J-.309 P1  F30000
G1 X127.177 Y132 Z24.8
G1 Z24.4
G1 E.8 F1800
G1 F1768
G1 X136.806 Y132 E.30502
; WIPE_START
G1 F24000
G1 X134.806 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.8 I.077 J-1.215 P1  F30000
G1 X122.398 Y131.21 Z24.8
G1 Z24.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1768
G1 X122.398 Y131.602 E.01301
G1 X123.026 Y131.602 E.02085
G1 X123.026 Y132.398 E.0264
G1 X121.602 Y132.398 E.04725
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.15 E.06793
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1768
G1 X123.418 Y131.21 E.01931
G1 X123.418 Y132.79 E.04855
G1 X121.21 Y132.79 E.06786
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
G1 X122.823 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1768
G1 X122.194 Y132 E.01991
G1 X122.114 Y131.983 E.0026
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00298
G1 X122 Y131.806 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.8 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z24.8
G1 Z24.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1768
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X122.924 Y123.602 E.04385
G1 X122.924 Y124.398 E.0264
G1 X122.458 Y124.398 E.01546
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1768
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.316 Y123.21 E.06472
G1 X123.316 Y124.79 E.04855
G1 X122.85 Y124.79 E.01432
M204 S10000
G1 X122.721 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1768
G1 X122.194 Y124 E.01667
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 24.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 123/138
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
G3 Z24.8 I.025 J1.217 P1  F30000
G1 X136.602 Y124.398 Z24.8
G1 Z24.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1761
G1 X127.125 Y124.398 E.31437
G1 X127.125 Y123.602 E.0264
G1 X138.398 Y123.602 E.37394
G1 X138.398 Y132.398 E.29177
G1 X127.023 Y132.398 E.37733
G1 X127.023 Y131.602 E.0264
G1 X136.602 Y131.602 E.31776
G1 X136.602 Y124.458 E.23698
G1 X136.21 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1761
G1 X126.733 Y124.79 E.2912
G1 X126.733 Y123.21 E.04855
G1 X138.79 Y123.21 E.37047
G1 X138.79 Y132.79 E.29437
G1 X126.631 Y132.79 E.37362
G1 X126.631 Y131.21 E.04855
G1 X136.21 Y131.21 E.29434
G1 X136.21 Y124.85 E.19543
M204 S10000
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1761
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1761
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
M73 P90 R2
G1 F1761
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1761
G1 X127.329 Y124 E.30022
; WIPE_START
G1 F24000
G1 X129.329 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25 I-1.177 J-.309 P1  F30000
G1 X127.227 Y132 Z25
G1 Z24.6
G1 E.8 F1800
G1 F1761
G1 X136.806 Y132 E.30346
; WIPE_START
G1 F24000
G1 X134.806 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25 I.077 J-1.215 P1  F30000
G1 X122.398 Y131.21 Z25
G1 Z24.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1761
G1 X122.398 Y131.602 E.01301
G1 X122.977 Y131.602 E.01921
G1 X122.977 Y132.398 E.0264
G1 X121.602 Y132.398 E.04561
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.15 E.06793
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1761
G1 X123.369 Y131.21 E.01779
G1 X123.369 Y132.79 E.04855
G1 X121.21 Y132.79 E.06634
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
G1 X122.773 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1761
G1 X122.194 Y132 E.01835
G1 X122.114 Y131.983 E.0026
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00298
G1 X122 Y131.806 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z25
G1 Z24.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1761
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X122.875 Y123.602 E.04222
G1 X122.875 Y124.398 E.0264
G1 X122.458 Y124.398 E.01383
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1761
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.267 Y123.21 E.0632
G1 X123.267 Y124.79 E.04855
G1 X122.85 Y124.79 E.01281
M204 S10000
G1 X122.671 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1761
G1 X122.194 Y124 E.01511
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 24.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 124/138
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
G3 Z25 I.025 J1.217 P1  F30000
G1 X136.602 Y124.398 Z25
G1 Z24.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1758
G1 X127.141 Y124.398 E.31385
G1 X127.141 Y123.602 E.0264
G1 X138.398 Y123.602 E.37342
G1 X138.398 Y132.398 E.29177
G1 X127.042 Y132.398 E.37671
G1 X127.042 Y131.602 E.0264
G1 X136.602 Y131.602 E.31714
G1 X136.602 Y124.458 E.23698
G1 X136.21 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1758
G1 X126.749 Y124.79 E.29072
G1 X126.749 Y123.21 E.04855
G1 X138.79 Y123.21 E.37
G1 X138.79 Y132.79 E.29437
G1 X126.649 Y132.79 E.37305
G1 X126.649 Y131.21 E.04855
G1 X136.21 Y131.21 E.29377
G1 X136.21 Y124.85 E.19543
M204 S10000
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1758
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1758
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1758
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1758
G1 X127.344 Y124 E.29973
; WIPE_START
G1 F24000
G1 X129.344 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.2 I-1.177 J-.309 P1  F30000
G1 X127.245 Y132 Z25.2
G1 Z24.8
G1 E.8 F1800
G1 F1758
G1 X136.806 Y132 E.30287
; WIPE_START
G1 F24000
G1 X134.806 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.2 I.077 J-1.215 P1  F30000
G1 X122.398 Y131.21 Z25.2
G1 Z24.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1758
G1 X122.398 Y131.602 E.01301
G1 X122.958 Y131.602 E.0186
G1 X122.958 Y132.398 E.0264
G1 X121.602 Y132.398 E.04499
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.15 E.06793
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1758
G1 X123.351 Y131.21 E.01722
G1 X123.351 Y132.79 E.04855
G1 X121.21 Y132.79 E.06577
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
G1 X122.755 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1758
G1 X122.194 Y132 E.01776
G1 X122.114 Y131.983 E.0026
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00298
G1 X122 Y131.806 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.2 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z25.2
G1 Z24.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1758
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X122.859 Y123.602 E.0417
G1 X122.859 Y124.398 E.0264
G1 X122.458 Y124.398 E.01331
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1758
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.251 Y123.21 E.06272
G1 X123.251 Y124.79 E.04855
G1 X122.85 Y124.79 E.01233
M204 S10000
G1 X122.656 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1758
G1 X122.194 Y124 E.01461
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 25
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 125/138
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
G3 Z25.2 I.025 J1.217 P1  F30000
G1 X136.602 Y124.398 Z25.2
M73 P91 R2
G1 Z25
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1758
G1 X127.141 Y124.398 E.31385
G1 X127.141 Y123.602 E.0264
G1 X138.398 Y123.602 E.37342
G1 X138.398 Y132.398 E.29177
G1 X127.042 Y132.398 E.37671
G1 X127.042 Y131.602 E.0264
G1 X136.602 Y131.602 E.31714
G1 X136.602 Y124.458 E.23698
G1 X136.21 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1758
G1 X126.749 Y124.79 E.29072
G1 X126.749 Y123.21 E.04855
G1 X138.79 Y123.21 E.37
G1 X138.79 Y132.79 E.29437
G1 X126.649 Y132.79 E.37305
G1 X126.649 Y131.21 E.04855
G1 X136.21 Y131.21 E.29377
G1 X136.21 Y124.85 E.19543
M204 S10000
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1758
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1758
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1758
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1758
G1 X127.344 Y124 E.29973
; WIPE_START
G1 F24000
G1 X129.344 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.4 I-1.177 J-.309 P1  F30000
G1 X127.245 Y132 Z25.4
G1 Z25
G1 E.8 F1800
G1 F1758
G1 X136.806 Y132 E.30287
; WIPE_START
G1 F24000
G1 X134.806 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.4 I.077 J-1.215 P1  F30000
G1 X122.398 Y131.21 Z25.4
G1 Z25
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1758
G1 X122.398 Y131.602 E.01301
G1 X122.958 Y131.602 E.0186
G1 X122.958 Y132.398 E.0264
G1 X121.602 Y132.398 E.04499
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.15 E.06793
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1758
G1 X123.351 Y131.21 E.01722
G1 X123.351 Y132.79 E.04855
G1 X121.21 Y132.79 E.06577
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
G1 X122.755 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1758
G1 X122.194 Y132 E.01776
G1 X122.114 Y131.983 E.0026
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00298
G1 X122 Y131.806 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.4 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z25.4
G1 Z25
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1758
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X122.859 Y123.602 E.0417
G1 X122.859 Y124.398 E.0264
G1 X122.458 Y124.398 E.01331
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1758
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.251 Y123.21 E.06272
G1 X123.251 Y124.79 E.04855
G1 X122.85 Y124.79 E.01233
M204 S10000
G1 X122.656 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1758
G1 X122.194 Y124 E.01461
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 25.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 126/138
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L126
M991 S0 P125 ;notify layer change
G17
G3 Z25.4 I.025 J1.217 P1  F30000
G1 X136.602 Y124.398 Z25.4
G1 Z25.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1769
G1 X127.101 Y124.398 E.31518
G1 X127.101 Y123.602 E.0264
G1 X138.398 Y123.602 E.37475
G1 X138.398 Y132.398 E.29177
G1 X126.998 Y132.398 E.37815
G1 X126.998 Y131.602 E.0264
G1 X136.602 Y131.602 E.31857
G1 X136.602 Y124.458 E.23698
G1 X136.21 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1769
G1 X126.708 Y124.79 E.29196
G1 X126.708 Y123.21 E.04855
G1 X138.79 Y123.21 E.37123
G1 X138.79 Y132.79 E.29437
G1 X126.608 Y132.79 E.37431
G1 X126.608 Y131.21 E.04855
G1 X136.21 Y131.21 E.29503
G1 X136.21 Y124.85 E.19543
M204 S10000
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1769
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1769
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1769
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1769
G1 X127.304 Y124 E.301
; WIPE_START
G1 F24000
G1 X129.304 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.6 I-1.177 J-.309 P1  F30000
G1 X127.202 Y132 Z25.6
G1 Z25.2
G1 E.8 F1800
G1 F1769
G1 X136.806 Y132 E.30424
; WIPE_START
G1 F24000
G1 X134.806 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.6 I.039 J-1.216 P1  F30000
G1 X122.398 Y131.602 Z25.6
G1 Z25.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1769
G1 X123.002 Y131.602 E.02003
G1 X123.002 Y132.398 E.0264
G1 X121.602 Y132.398 E.04643
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.542 E.08094
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1769
G1 X123.392 Y131.21 E.01848
G1 X123.392 Y132.79 E.04855
G1 X121.21 Y132.79 E.06703
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
M73 P92 R2
G1 X122.798 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1769
G1 X122.194 Y132 E.01913
G1 X122.114 Y131.983 E.0026
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00298
G1 X122 Y131.806 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.6 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z25.6
G1 Z25.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1769
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X122.899 Y123.602 E.04304
G1 X122.899 Y124.398 E.0264
G1 X122.458 Y124.398 E.01465
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1769
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.292 Y123.21 E.06396
G1 X123.292 Y124.79 E.04855
G1 X122.85 Y124.79 E.01357
M204 S10000
G1 X122.696 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1769
G1 X122.194 Y124 E.01589
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 25.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 127/138
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L127
M991 S0 P126 ;notify layer change
G17
G3 Z25.6 I.025 J1.217 P1  F30000
G1 X136.602 Y124.398 Z25.6
G1 Z25.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1780
G1 X127.051 Y124.398 E.31682
G1 X127.051 Y123.602 E.0264
G1 X138.398 Y123.602 E.37639
G1 X138.398 Y132.398 E.29177
G1 X126.939 Y132.398 E.38011
G1 X126.939 Y131.602 E.0264
G1 X136.602 Y131.602 E.32054
G1 X136.602 Y124.458 E.23698
G1 X136.21 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1780
G1 X126.667 Y124.79 E.29321
G1 X126.667 Y123.21 E.04855
G1 X138.79 Y123.21 E.37249
G1 X138.79 Y132.79 E.29437
G1 X126.565 Y132.79 E.37563
G1 X126.547 Y132.79 E.00056
G1 X126.547 Y131.21 E.04855
G1 X126.565 Y131.21 E.00056
G1 X136.21 Y131.21 E.29636
G1 X136.21 Y124.85 E.19543
M204 S10000
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1780
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1780
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1780
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1780
G1 X127.255 Y124 E.30257
; WIPE_START
G1 F24000
G1 X129.255 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.8 I-1.177 J-.311 P1  F30000
G1 X127.143 Y132 Z25.8
G1 Z25.4
M73 P92 R1
G1 E.8 F1800
G1 F1780
G1 X136.806 Y132 E.30612
; WIPE_START
G1 F24000
G1 X134.806 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.8 I.039 J-1.216 P1  F30000
G1 X122.398 Y131.602 Z25.8
G1 Z25.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1780
G1 X123.061 Y131.602 E.02199
G1 X123.061 Y132.398 E.0264
G1 X121.602 Y132.398 E.04839
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.542 E.08094
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1780
G1 X123.435 Y131.21 E.01981
G1 X123.453 Y131.21 E.00056
G1 X123.453 Y132.79 E.04855
G1 X123.435 Y132.79 E.00056
G1 X121.21 Y132.79 E.06836
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
G1 X122.857 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1780
G1 X122.194 Y132 E.021
G1 X122.114 Y131.983 E.0026
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00298
G1 X122 Y131.806 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.8 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z25.8
G1 Z25.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1780
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X122.949 Y123.602 E.04467
G1 X122.949 Y124.398 E.0264
G1 X122.458 Y124.398 E.01628
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1780
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.333 Y123.21 E.06522
G1 X123.333 Y124.79 E.04855
G1 X122.85 Y124.79 E.01483
M204 S10000
G1 X122.745 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1780
G1 X122.194 Y124 E.01745
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 25.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 128/138
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L128
M991 S0 P127 ;notify layer change
G17
G3 Z25.8 I.025 J1.217 P1  F30000
G1 X136.602 Y124.398 Z25.8
G1 Z25.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1796
G1 X126.946 Y124.398 E.3203
G1 X126.946 Y123.602 E.0264
G1 X138.398 Y123.602 E.37987
G1 X138.398 Y132.398 E.29177
G1 X126.834 Y132.398 E.38359
G1 X126.834 Y131.602 E.0264
G1 X136.602 Y131.602 E.32402
G1 X136.602 Y124.458 E.23698
G1 X136.21 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1796
G1 X126.618 Y124.79 E.29473
G1 X126.554 Y124.79 E.00197
G1 X126.554 Y123.21 E.04855
G1 X126.618 Y123.21 E.00197
G1 X138.79 Y123.21 E.37401
G1 X138.79 Y132.79 E.29437
G1 X126.506 Y132.79 E.37745
G1 X126.442 Y132.79 E.00197
G1 X126.442 Y131.21 E.04855
G1 X126.506 Y131.21 E.00197
G1 X136.21 Y131.21 E.29818
G1 X136.21 Y124.85 E.19543
M204 S10000
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1796
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1796
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1796
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1796
G1 X127.15 Y124 E.30589
; WIPE_START
G1 F24000
G1 X129.15 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26 I-1.177 J-.311 P1  F30000
G1 X127.038 Y132 Z26
G1 Z25.6
G1 E.8 F1800
M73 P93 R1
G1 F1796
G1 X136.806 Y132 E.30944
; WIPE_START
G1 F24000
G1 X134.806 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26 I.039 J-1.216 P1  F30000
G1 X122.398 Y131.602 Z26
G1 Z25.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1796
G1 X123.166 Y131.602 E.02548
G1 X123.166 Y132.398 E.0264
G1 X121.602 Y132.398 E.05188
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.542 E.08094
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1796
G1 X123.494 Y131.21 E.02163
G1 X123.558 Y131.21 E.00197
G1 X123.558 Y132.79 E.04855
G1 X123.494 Y132.79 E.00197
G1 X121.21 Y132.79 E.07018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
G1 X122.962 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1796
G1 X122.194 Y132 E.02433
G1 X122.114 Y131.983 E.0026
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00298
G1 X122 Y131.806 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z26
G1 Z25.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1796
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X123.054 Y123.602 E.04816
G1 X123.054 Y124.398 E.0264
G1 X122.458 Y124.398 E.01977
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1796
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.382 Y123.21 E.06674
G1 X123.446 Y123.21 E.00197
G1 X123.446 Y124.79 E.04855
G1 X123.382 Y124.79 E.00197
G1 X122.85 Y124.79 E.01634
M204 S10000
G1 X122.85 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1796
G1 X122.194 Y124 E.02078
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 25.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 129/138
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L129
M991 S0 P128 ;notify layer change
G17
G3 Z26 I.025 J1.217 P1  F30000
G1 X136.602 Y124.398 Z26
G1 Z25.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1818
G1 X126.816 Y124.398 E.32462
G1 X126.816 Y123.602 E.0264
G1 X138.398 Y123.602 E.38419
G1 X138.398 Y132.398 E.29177
G1 X126.684 Y132.398 E.38859
G1 X126.684 Y131.602 E.0264
G1 X136.602 Y131.602 E.32902
G1 X136.602 Y124.458 E.23698
G1 X136.21 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1818
G1 X126.431 Y124.79 E.30048
G1 X126.431 Y123.21 E.04855
G1 X126.513 Y123.21 E.00252
G1 X138.79 Y123.21 E.37723
G1 X138.79 Y132.79 E.29437
G1 X126.319 Y132.79 E.3832
G1 X126.291 Y132.79 E.00085
G1 X126.291 Y131.21 E.04855
G1 X126.319 Y131.21 E.00085
G1 X136.21 Y131.21 E.30392
G1 X136.21 Y124.85 E.19543
M204 S10000
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1818
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1818
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1818
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1818
G1 X127.02 Y124 E.31001
; WIPE_START
G1 F24000
G1 X129.02 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.2 I-1.176 J-.313 P1  F30000
G1 X126.887 Y132 Z26.2
G1 Z25.8
G1 E.8 F1800
G1 F1818
G1 X136.806 Y132 E.31421
; WIPE_START
G1 F24000
G1 X134.806 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.2 I.039 J-1.216 P1  F30000
G1 X122.398 Y131.602 Z26.2
G1 Z25.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1818
G1 X123.316 Y131.602 E.03047
G1 X123.316 Y132.398 E.0264
G1 X121.602 Y132.398 E.05687
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.542 E.08094
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1818
G1 X123.681 Y131.21 E.02738
G1 X123.709 Y131.21 E.00085
G1 X123.709 Y132.79 E.04855
G1 X123.681 Y132.79 E.00085
G1 X123.599 Y132.79 E.00252
G1 X121.21 Y132.79 E.07341
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
G1 X123.113 Y132 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1818
G1 X122.194 Y132 E.0291
G1 X122.114 Y131.983 E.0026
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00298
G1 X122 Y131.806 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.2 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z26.2
G1 Z25.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1818
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X123.184 Y123.602 E.05247
G1 X123.184 Y124.398 E.0264
G1 X122.458 Y124.398 E.02408
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1818
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.569 Y123.21 E.07248
G1 X123.569 Y124.79 E.04855
G1 X123.487 Y124.79 E.00252
G1 X122.85 Y124.79 E.01957
M204 S10000
G1 X122.98 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1818
G1 X122.194 Y124 E.0249
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 26
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 130/138
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L130
M991 S0 P129 ;notify layer change
G17
G3 Z26.2 I.025 J1.217 P1  F30000
G1 X136.602 Y124.398 Z26.2
G1 Z26
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1868
G1 X126.639 Y124.398 E.3305
G1 X126.639 Y123.602 E.0264
G1 X138.398 Y123.602 E.39007
G1 X138.398 Y132.398 E.29177
G1 X126.47 Y132.398 E.39567
G1 X126.47 Y131.602 E.0264
G1 X136.602 Y131.602 E.3361
G1 X136.602 Y124.458 E.23698
G1 X136.21 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1868
G1 X126.301 Y124.79 E.30447
G1 X126.247 Y124.79 E.00166
G1 X126.247 Y123.21 E.04855
G1 X126.301 Y123.21 E.00166
G1 X126.383 Y123.21 E.00252
G1 X138.79 Y123.21 E.38123
G1 X138.79 Y132.79 E.29437
G1 X126.086 Y132.79 E.39035
M106 S255
G1 F1800
G1 X126.086 Y131.21 E.04855
M106 S252.45
G1 F1868
G1 X136.21 Y131.21 E.31107
G1 X136.21 Y124.85 E.19543
M204 S10000
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1868
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1868
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1868
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
M73 P94 R1
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1868
G1 X126.842 Y124 E.31563
; WIPE_START
G1 F24000
G1 X128.842 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.4 I-1.175 J-.318 P1  F30000
G1 X126.673 Y132 Z26.4
G1 Z26
G1 E.8 F1800
G1 F1868
G1 X136.806 Y132 E.32098
; WIPE_START
G1 F24000
G1 X134.806 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.4 I.039 J-1.216 P1  F30000
G1 X122.398 Y131.602 Z26.4
G1 Z26
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1868
G1 X123.53 Y131.602 E.03756
G1 X123.53 Y132.398 E.0264
G1 X121.602 Y132.398 E.06395
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.542 E.08094
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1868
G1 X123.914 Y131.21 E.03452
M106 S255
G1 F1800
G1 X123.914 Y132.79 E.04855
M106 S252.45
G1 F1868
G1 X123.75 Y132.79 E.00504
G1 X121.21 Y132.79 E.07803
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X123.914 Y131.21 E-.42757
G1 X123.914 Y132.085 E-.33243
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.4 I.174 J-1.204 P1  F30000
G1 X123.327 Y132 Z26.4
G1 Z26
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1868
G1 X122.194 Y132 E.03587
G1 X122.114 Y131.983 E.0026
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00298
G1 X122 Y131.806 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.4 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z26.4
G1 Z26
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1868
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X123.361 Y123.602 E.05835
G1 X123.361 Y124.398 E.0264
G1 X122.458 Y124.398 E.02996
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1868
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.699 Y123.21 E.07648
G1 X123.753 Y123.21 E.00166
G1 X123.753 Y124.79 E.04855
G1 X123.699 Y124.79 E.00166
G1 X123.617 Y124.79 E.00252
G1 X122.85 Y124.79 E.02357
M204 S10000
G1 X123.158 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1868
G1 X122.194 Y124 E.03051
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 26.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 131/138
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L131
M991 S0 P130 ;notify layer change
G17
G3 Z26.4 I.025 J1.217 P1  F30000
G1 X136.602 Y124.398 Z26.4
G1 Z26.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1986
G1 X126.355 Y124.398 E.33992
G1 X126.355 Y123.602 E.0264
G1 X138.398 Y123.602 E.39949
G1 X138.398 Y132.398 E.29177
G1 X126.102 Y132.398 E.40789
G1 X126.102 Y131.602 E.0264
G1 X136.602 Y131.602 E.34832
G1 X136.602 Y124.458 E.23698
G1 X136.21 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1986
G1 X126.042 Y124.79 E.31244
M106 S255
G1 F1800
G1 X125.963 Y124.79 E.00243
G1 X125.963 Y123.21 E.04855
G1 X126.042 Y123.21 E.00243
M106 S252.45
G1 F1986
G1 X126.206 Y123.21 E.00504
G1 X138.79 Y123.21 E.38668
G1 X138.79 Y132.79 E.29437
G1 X126.037 Y132.79 E.39187
G1 X125.791 Y132.79 E.00756
M106 S255
G1 F600
G1 X125.71 Y132.79 E.0025
G1 X125.71 Y131.21 E.04855
G1 X125.791 Y131.21 E.0025
M106 S252.45
G1 F1986
G1 X126.037 Y131.21 E.00756
G1 X136.21 Y131.21 E.31259
G1 X136.21 Y124.85 E.19543
M204 S10000
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1986
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1986
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1986
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1986
G1 X126.558 Y124 E.32462
; WIPE_START
G1 F24000
G1 X128.558 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.6 I-1.171 J-.33 P1  F30000
G1 X126.305 Y132 Z26.6
G1 Z26.2
G1 E.8 F1800
G1 F1986
G1 X136.806 Y132 E.33265
; WIPE_START
G1 F24000
G1 X134.806 Y132 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.6 I.039 J-1.216 P1  F30000
G1 X122.398 Y131.602 Z26.6
G1 Z26.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1986
G1 X123.898 Y131.602 E.04977
G1 X123.898 Y132.398 E.0264
G1 X121.602 Y132.398 E.07617
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.542 E.08094
G1 X122.79 Y131.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1986
G1 X123.963 Y131.21 E.03605
G1 X124.209 Y131.21 E.00756
M106 S255
G1 F600
G1 X124.29 Y131.21 E.0025
G1 X124.29 Y132.79 E.04855
G1 X124.209 Y132.79 E.0025
M106 S252.45
G1 F1986
G1 X123.963 Y132.79 E.00756
G1 X121.21 Y132.79 E.0846
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.15 E.07497
M204 S10000
; WIPE_START
G1 F24000
G1 X123.963 Y131.21 E-.44638
G1 X124.209 Y131.21 E-.09348
G1 X124.29 Y131.21 E-.03088
G1 X124.29 Y131.708 E-.18926
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.6 I-.052 J-1.216 P1  F30000
G1 X122 Y131.806 Z26.6
G1 Z26.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.487269
G1 F1986
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X123.695 Y132 E.04753
G1 X122 Y131.806 F30000
G1 F1986
G1 X122 Y129.306 E.0792
; WIPE_START
G1 F24000
G1 X122 Y131.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.6 I1.215 J.07 P1  F30000
G1 X122.398 Y124.398 Z26.6
G1 Z26.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1986
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X123.645 Y123.602 E.06777
G1 X123.645 Y124.398 E.0264
G1 X122.458 Y124.398 E.03938
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1986
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X123.958 Y123.21 E.08444
M106 S255
G1 F1800
G1 X124.037 Y123.21 E.00243
G1 X124.037 Y124.79 E.04855
G1 X123.958 Y124.79 E.00243
M106 S252.45
G1 F1986
G1 X123.794 Y124.79 E.00504
G1 X122.85 Y124.79 E.02901
M204 S10000
G1 X123.442 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1986
G1 X122.194 Y124 E.03951
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; CHANGE_LAYER
; Z_HEIGHT: 26.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 132/138
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L132
M991 S0 P131 ;notify layer change
G17
G3 Z26.6 I.727 J.976 P1  F30000
G1 X122.398 Y124.398 Z26.6
G1 Z26.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1952
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X124.447 Y123.602 E.09438
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X125.553 Y123.602 E.03668
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F1952
G1 X138.398 Y123.602 E.42609
G1 X138.398 Y132.398 E.29177
G1 X125.3 Y132.398 E.4345
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X124.7 Y132.398 E.01988
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F1952
G1 X124.318 Y132.398 E.01269
G1 X121.602 Y132.398 E.09009
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X124.7 Y131.602 E.07638
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X125.3 Y131.602 E.01988
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F1952
G1 X136.602 Y131.602 E.37492
G1 X136.602 Y124.398 E.23898
G1 X125.553 Y124.398 E.36652
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X124.447 Y124.398 E.03668
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F1952
G1 X122.458 Y124.398 E.06599
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1952
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X124.447 Y123.21 E.09947
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X125.553 Y123.21 E.03668
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1952
G1 X138.79 Y123.21 E.40674
G1 X138.79 Y132.79 E.29437
G1 X125.3 Y132.79 E.41452
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X124.7 Y132.79 E.01988
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1952
G1 X124.331 Y132.79 E.01134
G1 X121.21 Y132.79 E.09591
M73 P95 R1
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X124.7 Y131.21 E.0587
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X125.3 Y131.21 E.01988
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1952
G1 X136.21 Y131.21 E.33525
G1 X136.21 Y124.79 E.19727
G1 X125.553 Y124.79 E.32746
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X124.447 Y124.79 E.03668
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1952
G1 X122.85 Y124.79 E.04908
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.8 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z26.8
G1 Z26.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1952
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.8 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z26.8
G1 Z26.4
G1 E.8 F1800
G1 F1952
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1952
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1952
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1952
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1952
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 26.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 133/138
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L133
M991 S0 P132 ;notify layer change
G17
G3 Z26.8 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z26.8
G1 Z26.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z27
G1 Z26.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z27
G1 Z26.6
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 26.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 134/138
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L134
M991 S0 P133 ;notify layer change
G17
G3 Z27 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z27
G1 Z26.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
M73 P96 R1
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.2 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z27.2
G1 Z26.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.2 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z27.2
G1 Z26.8
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
M73 P96 R0
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 27
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 135/138
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L135
M991 S0 P134 ;notify layer change
G17
G3 Z27.2 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z27.2
G1 Z27
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.4 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z27.4
G1 Z27
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.4 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z27.4
G1 Z27
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
M73 P97 R0
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 27.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 136/138
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L136
M991 S0 P135 ;notify layer change
G17
G3 Z27.4 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z27.4
G1 Z27.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.6 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z27.6
G1 Z27.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.6 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z27.6
G1 Z27.2
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 27.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 137/138
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L137
M991 S0 P136 ;notify layer change
G17
G3 Z27.6 I-.263 J-1.188 P1  F30000
G1 X122.398 Y124.398 Z27.6
G1 Z27.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1963
G1 X122.398 Y126.898 E.08293
G1 X121.602 Y126.898 E.0264
G1 X121.602 Y123.602 E.10933
G1 X138.398 Y123.602 E.55715
G1 X138.398 Y132.398 E.29177
G1 X121.602 Y132.398 E.55715
G1 X121.602 Y129.102 E.10933
G1 X122.398 Y129.102 E.0264
G1 X122.398 Y131.602 E.08293
G1 X136.602 Y131.602 E.47118
G1 X136.602 Y124.398 E.23898
G1 X122.458 Y124.398 E.46919
G1 X122.79 Y124.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1963
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.8 I1.189 J-.259 P1  F30000
G1 X122.194 Y124 Z27.8
G1 Z27.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.114 Y124.017 E.0026
; LINE_WIDTH: 0.487268
G1 X122.033 Y124.033 E.00298
G1 X122 Y124.194 E.00595
; LINE_WIDTH: 0.431684
G1 X122 Y126.694 E.0792
; WIPE_START
G1 F24000
G1 X122 Y124.694 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.8 I-1.217 J0 P1  F30000
G1 X122 Y129.306 Z27.8
G1 Z27.4
G1 E.8 F1800
G1 F1963
G1 X122 Y131.806 E.0792
; LINE_WIDTH: 0.487269
G1 X122.033 Y131.967 E.00595
G1 X122.114 Y131.983 E.00298
; LINE_WIDTH: 0.431684
G1 X122.194 Y132 E.0026
G1 X136.806 Y132 E.46287
G1 X136.994 Y124.623 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1963
G1 X136.994 Y131.392 E.208
G1 X137.142 Y131.447 E.00486
G1 X137.198 Y131.602 E.00504
G1 X137.198 Y132.006 E.01242
G1 X138.006 Y132.006 E.02483
G1 X138.006 Y123.994 E.24618
G1 X137.198 Y123.994 E.02483
G1 X137.195 Y124.452 E.01407
G3 X137.048 Y124.597 I-.169 J-.024 E.00681
G1 X137.549 Y124.715 F30000
; LINE_WIDTH: 0.57931
G1 F1963
G1 X137.563 Y124.629 E.0038
; LINE_WIDTH: 0.544205
G1 X137.578 Y124.543 E.00355
; LINE_WIDTH: 0.5091
G1 X137.592 Y124.457 E.0033
G1 X137.341 Y125.109 F30000
; LINE_WIDTH: 0.360223
G1 F1963
G1 X137.341 Y131.182 E.15705
G1 X137.388 Y131.202 E.0013
G1 X137.459 Y131.328 E.00375
; LINE_WIDTH: 0.398147
G1 X137.53 Y131.454 E.0042
; LINE_WIDTH: 0.436071
G1 X137.602 Y131.581 E.00465
; LINE_WIDTH: 0.473994
G1 X137.621 Y131.417 E.00579
; LINE_WIDTH: 0.436071
G1 X137.64 Y131.253 E.00528
; LINE_WIDTH: 0.36124
M73 P98 R0
G1 X137.659 Y131.089 E.00428
G1 X137.659 Y125.109 E.15514
; LINE_WIDTH: 0.360223
G1 X137.637 Y125.03 E.00211
; LINE_WIDTH: 0.404041
G1 X137.615 Y124.951 E.00241
; LINE_WIDTH: 0.447858
G1 X137.593 Y124.872 E.0027
; LINE_WIDTH: 0.491676
G1 X137.571 Y124.793 E.00299
; LINE_WIDTH: 0.567986
G1 X137.549 Y124.715 E.0035
G1 X137.42 Y124.911 E.01004
; LINE_WIDTH: 0.517346
G1 X137.406 Y124.946 E.00148
; LINE_WIDTH: 0.478066
G1 X137.392 Y124.982 E.00136
; LINE_WIDTH: 0.438785
G1 X137.378 Y125.017 E.00123
; LINE_WIDTH: 0.399504
G1 X137.363 Y125.053 E.00111
G1 X136.806 Y124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431684
G1 F1963
G1 X122.194 Y124 E.46287
; CHANGE_LAYER
; Z_HEIGHT: 27.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X124.194 Y124 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 138/138
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L138
M991 S0 P137 ;notify layer change
G17
G3 Z27.8 I-.597 J-1.061 P1  F30000
G1 X122.79 Y124.79 Z27.8
G1 Z27.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2479
G1 X122.79 Y127.29 E.07682
G1 X121.21 Y127.29 E.04855
G1 X121.21 Y123.21 E.12537
G1 X138.79 Y123.21 E.54018
G1 X138.79 Y132.79 E.29437
G1 X121.21 Y132.79 E.54018
G1 X121.21 Y128.71 E.12537
G1 X122.79 Y128.71 E.04855
G1 X122.79 Y131.21 E.07682
G1 X136.21 Y131.21 E.41236
G1 X136.21 Y124.79 E.19727
G1 X122.85 Y124.79 E.41052
M204 S10000
; WIPE_START
G1 F24000
G1 X122.802 Y126.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28 I-.435 J1.137 P1  F30000
G1 X137.949 Y132.583 Z28
G1 Z27.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F2479
G1 X138.583 Y131.949 E.02753
G1 X138.583 Y131.416
G1 X137.416 Y132.583 E.0507
G1 X136.883 Y132.583
G1 X138.583 Y130.883 E.07387
G1 X138.583 Y130.349
G1 X136.349 Y132.583 E.09705
G1 X135.816 Y132.583
G1 X138.583 Y129.816 E.12022
G1 X138.583 Y129.283
G1 X135.283 Y132.583 E.14339
G1 X134.75 Y132.583
G1 X135.915 Y131.417 E.05063
G1 X135.381 Y131.417
G1 X134.216 Y132.583 E.05063
G1 X133.683 Y132.583
G1 X134.848 Y131.417 E.05063
G1 X134.315 Y131.417
G1 X133.15 Y132.583 E.05063
G1 X132.616 Y132.583
G1 X133.782 Y131.417 E.05063
G1 X133.248 Y131.417
G1 X132.083 Y132.583 E.05063
G1 X131.55 Y132.583
G1 X132.715 Y131.417 E.05063
G1 X132.182 Y131.417
G1 X131.017 Y132.583 E.05063
G1 X130.483 Y132.583
G1 X131.649 Y131.417 E.05063
G1 X131.115 Y131.417
G1 X129.95 Y132.583 E.05063
G1 X129.417 Y132.583
G1 X130.582 Y131.417 E.05063
G1 X130.049 Y131.417
G1 X128.884 Y132.583 E.05063
G1 X128.35 Y132.583
G1 X129.516 Y131.417 E.05063
G1 X128.982 Y131.417
G1 X127.817 Y132.583 E.05063
G1 X127.284 Y132.583
G1 X128.449 Y131.417 E.05063
G1 X127.916 Y131.417
G1 X126.75 Y132.583 E.05063
G1 X126.217 Y132.583
G1 X127.382 Y131.417 E.05063
G1 X126.849 Y131.417
G1 X125.684 Y132.583 E.05063
G1 X125.151 Y132.583
G1 X126.316 Y131.417 E.05063
G1 X125.783 Y131.417
G1 X124.617 Y132.583 E.05063
G1 X124.084 Y132.583
G1 X125.249 Y131.417 E.05063
G1 X124.716 Y131.417
G1 X123.551 Y132.583 E.05063
G1 X123.018 Y132.583
G1 X124.183 Y131.417 E.05063
G1 X123.65 Y131.417
G1 X122.484 Y132.583 E.05063
G1 X121.951 Y132.583
G1 X123.116 Y131.417 E.05063
G1 X122.583 Y131.417
G1 X121.418 Y132.583 E.05063
G1 X121.417 Y132.05
G1 X122.583 Y130.885 E.05063
G1 X122.583 Y130.351
G1 X121.417 Y131.516 E.05063
G1 X121.417 Y130.983
G1 X122.583 Y129.818 E.05063
G1 X122.583 Y129.285
G1 X121.417 Y130.45 E.05063
G1 X121.417 Y129.917
G1 X122.417 Y128.917 E.04342
G1 X121.883 Y128.917
G1 X121.417 Y129.383 E.02025
M204 S10000
; WIPE_START
G1 F24000
G1 X121.883 Y128.917 E-.25043
G1 X122.417 Y128.917 E-.20264
G1 X121.846 Y129.489 E-.30693
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28 I1.209 J.137 P1  F30000
G1 X122.118 Y127.083 Z28
G1 Z27.6
G1 E.8 F1800
M204 S2000
G1 F2479
G1 X122.583 Y126.618 E.02017
G1 X122.583 Y126.085
G1 X121.585 Y127.083 E.04335
G1 X121.417 Y126.717
G1 X122.583 Y125.552 E.05063
G1 X122.583 Y125.019
G1 X121.417 Y126.184 E.05063
M204 S10000
; WIPE_START
G1 F24000
G1 X122.583 Y125.019 E-.62619
G1 X122.583 Y125.371 E-.13381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28 I-.453 J1.13 P1  F30000
G1 X136.417 Y130.915 Z28
G1 Z27.6
G1 E.8 F1800
M204 S2000
G1 F2479
G1 X138.583 Y128.75 E.09409
G1 X138.583 Y128.216
G1 X136.417 Y130.381 E.09409
G1 X136.417 Y129.848
G1 X138.583 Y127.683 E.09409
G1 X138.583 Y127.15
G1 X136.417 Y129.315 E.09409
G1 X136.417 Y128.782
G1 X138.583 Y126.616 E.09409
G1 X138.583 Y126.083
G1 X136.417 Y128.248 E.09409
G1 X136.417 Y127.715
G1 X138.583 Y125.55 E.09409
G1 X138.583 Y125.017
G1 X136.417 Y127.182 E.09409
G1 X136.417 Y126.649
G1 X138.583 Y124.483 E.09409
G1 X138.583 Y123.95
G1 X136.417 Y126.115 E.09409
G1 X136.417 Y125.582
G1 X138.582 Y123.417 E.09407
G1 X138.049 Y123.417
G1 X136.417 Y125.049 E.07089
G1 X136.35 Y124.583
G1 X137.516 Y123.417 E.05063
G1 X136.982 Y123.417
G1 X135.817 Y124.583 E.05063
G1 X135.284 Y124.583
G1 X136.449 Y123.417 E.05063
G1 X135.916 Y123.417
G1 X134.751 Y124.583 E.05063
G1 X134.217 Y124.583
G1 X135.382 Y123.417 E.05063
G1 X134.849 Y123.417
G1 X133.684 Y124.583 E.05063
G1 X133.151 Y124.583
G1 X134.316 Y123.417 E.05063
G1 X133.783 Y123.417
G1 X132.617 Y124.583 E.05063
G1 X132.084 Y124.583
G1 X133.249 Y123.417 E.05063
G1 X132.716 Y123.417
G1 X131.551 Y124.583 E.05063
G1 X131.018 Y124.583
G1 X132.183 Y123.417 E.05063
G1 X131.65 Y123.417
G1 X130.484 Y124.583 E.05063
G1 X129.951 Y124.583
G1 X131.116 Y123.417 E.05063
G1 X130.583 Y123.417
G1 X129.418 Y124.583 E.05063
G1 X128.885 Y124.583
G1 X130.05 Y123.417 E.05063
G1 X129.516 Y123.417
G1 X128.351 Y124.583 E.05063
G1 X127.818 Y124.583
G1 X128.983 Y123.417 E.05063
G1 X128.45 Y123.417
G1 X127.285 Y124.583 E.05063
G1 X126.751 Y124.583
G1 X127.917 Y123.417 E.05063
G1 X127.383 Y123.417
G1 X126.218 Y124.583 E.05063
G1 X125.685 Y124.583
G1 X126.85 Y123.417 E.05063
G1 X126.317 Y123.417
G1 X125.152 Y124.583 E.05063
G1 X124.618 Y124.583
G1 X125.784 Y123.417 E.05063
G1 X125.25 Y123.417
G1 X124.085 Y124.583 E.05063
G1 X123.552 Y124.583
G1 X124.717 Y123.417 E.05063
G1 X124.184 Y123.417
G1 X123.019 Y124.583 E.05063
M204 S10000
; WIPE_START
G1 F24000
G1 X124.184 Y123.417 E-.62619
G1 X124.536 Y123.417 E-.13381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28 I0 J-1.217 P1  F30000
G1 X123.65 Y123.417 Z28
G1 Z27.6
G1 E.8 F1800
M204 S2000
G1 F2479
G1 X121.417 Y125.65 E.09704
G1 X121.417 Y125.117
G1 X123.117 Y123.417 E.07387
G1 X122.584 Y123.417
G1 X121.417 Y124.584 E.05069
G1 X121.417 Y124.051
G1 X122.051 Y123.417 E.02752
M204 S10000
; WIPE_START
G1 F24000
G1 X121.417 Y124.051 E-.34033
G1 X121.417 Y124.584 E-.20264
G1 X121.821 Y124.18 E-.21702
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28 I-1.21 J.134 P1  F30000
G1 X122.601 Y131.225 Z28
G1 Z27.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0963737
G1 F2479
G1 X122.573 Y131.202 E.00016
G1 X122.48 Y131.315 E.00063
; WIPE_START
G1 F24000
G1 X122.573 Y131.202 E-.60554
G1 X122.601 Y131.225 E-.15446
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28 I1.217 J-.019 P1  F30000
G1 X122.571 Y129.273 Z28
G1 Z27.6
G1 E.8 F1800
; LINE_WIDTH: 0.103228
G1 F2479
G1 X122.571 Y128.899 E.00184
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X122.571 Y129.273 E-.76
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
G1 Z28.1 F900 ; lower z a little
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

    G1 Z127.6 F600
    G1 Z125.6

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

