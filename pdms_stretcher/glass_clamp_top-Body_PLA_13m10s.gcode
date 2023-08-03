; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 7m 21s; total estimated time: 13m 10s
; total layer number: 15
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
M73 P0 R13
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
M73 P33 R8
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

M73 P34 R8
G1 X70 F9000
M73 P35 R8
G1 X76 F15000
M73 P37 R8
G1 X65 F15000
M73 P38 R8
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
M73 P39 R8
G1 X230 Y15
G29.2 S1 ; turn on ABL
;G28 ; home again after hard wipe mouth
M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag
M622 J1

    M1002 gcode_claim_action : 1
    G29 A X100.856 Y94.5158 I45.1615 J50.702
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
M73 P39 R7
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
; layer num/total_layer_count: 1/15
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
G1 X141.083 Y97.659 F30000
G1 Z.4
M73 P40 R7
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X109.62 Y97.659 E1.17185
G1 X110.195 Y97.149 E.02861
G1 X110.533 Y96.661 E.02212
G1 X110.743 Y96.105 E.02212
G1 X110.815 Y95.516 E.02212
G1 X110.743 Y94.926 E.02212
G1 X110.533 Y94.371 E.02212
M73 P41 R7
G1 X110.195 Y93.882 E.02212
G1 X109.62 Y93.373 E.02861
G1 X141.083 Y93.373 E1.17185
G1 X140.508 Y93.882 E.02861
G1 X140.17 Y94.371 E.02212
G1 X139.96 Y94.926 E.02212
G1 X139.888 Y95.516 E.02212
G1 X139.96 Y96.105 E.02212
G1 X140.17 Y96.661 E.02212
G1 X140.508 Y97.149 E.02212
M73 P42 R7
G1 X141.038 Y97.619 E.02638
; WIPE_START
G1 F24000
G1 X139.038 Y97.621 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.266 J1.188 P1  F30000
G1 X144.097 Y96.488 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
G1 X143.851 Y96.844 E.01611
G1 X143.489 Y97.164 E.01798
G1 X143.062 Y97.389 E.01798
G1 X142.593 Y97.504 E.01798
G1 X142.11 Y97.504 E.01798
G1 X141.641 Y97.389 E.01798
G1 X141.214 Y97.164 E.01798
M73 P43 R7
G1 X140.852 Y96.844 E.01798
G1 X140.618 Y96.504 E.01538
G1 X140.578 Y96.447 E.00261
G1 X140.407 Y95.995 E.01798
G1 X140.349 Y95.516 E.01798
G1 X140.407 Y95.036 E.01798
G1 X140.578 Y94.585 E.01798
G1 X140.852 Y94.188 E.01798
G1 X141.214 Y93.867 E.01798
G1 X141.641 Y93.643 E.01798
G1 X142.11 Y93.527 E.01798
G1 X142.593 Y93.527 E.01798
G1 X143.062 Y93.643 E.01798
G1 X143.489 Y93.867 E.01798
G1 X143.851 Y94.188 E.01798
M73 P44 R7
G1 X144.125 Y94.585 E.01798
G1 X144.296 Y95.036 E.01798
G1 X144.354 Y95.516 E.01798
G1 X144.296 Y95.995 E.01798
G1 X144.129 Y96.438 E.01762
; WIPE_START
G1 F24000
G1 X143.851 Y96.844 E-.18707
G1 X143.489 Y97.164 E-.18348
G1 X143.062 Y97.389 E-.18349
G1 X142.593 Y97.504 E-.18348
G1 X142.534 Y97.504 E-.02248
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.084 J.553 P1  F30000
G1 X144.302 Y94.036 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X144.195 Y93.882 E.00698
G1 X143.62 Y93.373 E.02861
G1 X144.494 Y93.373 E.03256
G1 X144.494 Y93.976 E.02248
G1 X144.359 Y94.019 E.00528
; WIPE_START
G1 F24000
G1 X144.195 Y93.882 E-.08094
G1 X143.62 Y93.373 E-.29191
G1 X144.494 Y93.373 E-.33214
G1 X144.494 Y93.518 E-.05501
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.215 J-.067 P1  F30000
G1 X144.302 Y96.995 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X144.494 Y97.055 E.00752
G1 X144.494 Y97.659 E.02248
G1 X143.62 Y97.659 E.03256
G1 X144.195 Y97.149 E.02861
G1 X144.268 Y97.045 E.00474
; WIPE_START
G1 F24000
G1 X144.494 Y97.055 E-.08626
G1 X144.494 Y97.659 E-.22934
G1 X143.62 Y97.659 E-.33214
G1 X143.842 Y97.463 E-.11227
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.012 J-1.217 P1  F30000
G1 X107.155 Y97.112 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
G1 X106.852 Y96.844 E.01506
G1 X106.578 Y96.447 E.01798
G1 X106.407 Y95.995 E.01798
G1 X106.349 Y95.516 E.01798
G1 X106.407 Y95.036 E.01798
G1 X106.578 Y94.585 E.01798
G1 X106.852 Y94.188 E.01798
G1 X107.214 Y93.867 E.01798
G1 X107.276 Y93.835 E.00261
G1 X107.641 Y93.643 E.01538
G1 X108.11 Y93.527 E.01798
G1 X108.593 Y93.527 E.01798
G1 X109.062 Y93.643 E.01798
G1 X109.489 Y93.867 E.01798
G1 X109.851 Y94.188 E.01798
G1 X109.891 Y94.245 E.00261
G1 X110.125 Y94.585 E.01538
G1 X110.296 Y95.036 E.01798
G1 X110.354 Y95.516 E.01798
G1 X110.296 Y95.995 E.01798
G1 X110.125 Y96.447 E.01798
G1 X109.851 Y96.844 E.01798
G1 X109.489 Y97.164 E.01798
G1 X109.062 Y97.389 E.01798
G1 X108.593 Y97.504 E.01798
G1 X108.11 Y97.504 E.01798
G1 X107.641 Y97.389 E.01798
G1 X107.214 Y97.164 E.01798
G1 X107.2 Y97.152 E.00069
; WIPE_START
G1 F24000
G1 X106.852 Y96.844 E-.17642
G1 X106.578 Y96.447 E-.18348
G1 X106.407 Y95.995 E-.18349
G1 X106.349 Y95.516 E-.18349
G1 X106.359 Y95.429 E-.03313
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.216 J.037 P1  F30000
G1 X106.401 Y94.036 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X106.209 Y93.976 E.00752
G1 X106.209 Y93.373 E.02248
G1 X107.083 Y93.373 E.03256
G1 X106.508 Y93.882 E.02861
G1 X106.435 Y93.987 E.00474
; WIPE_START
G1 F24000
G1 X106.209 Y93.976 E-.08626
G1 X106.209 Y93.373 E-.22934
G1 X107.083 Y93.373 E-.33214
G1 X106.862 Y93.569 E-.11226
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.217 J.018 P1  F30000
G1 X106.92 Y97.514 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X107.083 Y97.659 E.00811
G1 X106.209 Y97.659 E.03256
G1 X106.209 Y97.055 E.02248
G1 X106.401 Y96.995 E.00752
G1 X106.508 Y97.149 E.00698
G1 X106.875 Y97.474 E.01826
; WIPE_START
G1 F24000
G1 X107.083 Y97.659 E-.10557
G1 X106.209 Y97.659 E-.33214
G1 X106.209 Y97.055 E-.22934
G1 X106.401 Y96.995 E-.07668
G1 X106.426 Y97.03 E-.01627
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.034 J1.216 P1  F30000
G1 X144.952 Y98.116 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
G1 X105.752 Y98.116 E1.46005
G1 X105.752 Y92.916 E.19368
G1 X144.952 Y92.916 E1.46005
G1 X144.952 Y98.056 E.19145
; WIPE_START
G1 F24000
G1 X142.952 Y98.059 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.849 J.872 P1  F30000
G1 X144.37 Y96.678 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.422178
G1 F3000
G1 X144.506 Y96.621 E.00456
; LINE_WIDTH: 0.402974
G1 X144.522 Y96.613 E.0005
G1 X144.546 Y96.482 E.00392
; LINE_WIDTH: 0.349311
G1 X144.57 Y96.35 E.00334
; LINE_WIDTH: 0.301126
G1 X144.594 Y96.219 E.00281
; LINE_WIDTH: 0.25294
G1 X144.618 Y96.087 E.00229
; LINE_WIDTH: 0.217074
G2 X144.637 Y95.793 I-2.404 J-.306 E.00419
; LINE_WIDTH: 0.181734
G1 X144.654 Y95.524 E.00305
; LINE_WIDTH: 0.212394
G2 X144.637 Y95.238 I-2.371 J-.008 E.00396
; LINE_WIDTH: 0.24686
G1 X144.621 Y94.969 E.00448
; LINE_WIDTH: 0.25294
G1 X144.618 Y94.944 E.00043
; LINE_WIDTH: 0.301126
G1 X144.594 Y94.813 E.00281
; LINE_WIDTH: 0.349311
G1 X144.57 Y94.681 E.00334
; LINE_WIDTH: 0.397497
G1 X144.546 Y94.55 E.00386
; LINE_WIDTH: 0.445682
G1 X144.522 Y94.418 E.00439
; LINE_WIDTH: 0.422186
G1 X144.506 Y94.411 E.00053
; LINE_WIDTH: 0.387532
G1 X144.37 Y94.354 E.00414
; LINE_WIDTH: 0.352877
G1 X144.234 Y94.297 E.00373
; WIPE_START
M73 P45 R7
G1 F24000
G1 X144.37 Y94.354 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.743 J-.964 P1  F30000
G1 X142.8 Y93.144 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.164094
G1 F3000
G3 X143.307 Y93.462 I-2.342 J4.302 E.00591
; LINE_WIDTH: 0.10292
G1 X143.44 Y93.554 E.00079
G1 X143.18 Y93.288 F30000
; LINE_WIDTH: 0.280705
G1 F3000
G1 X142.91 Y93.256 E.00528
; LINE_WIDTH: 0.211284
G2 X142.064 Y93.223 I-.685 J6.724 E.01163
; LINE_WIDTH: 0.199787
G1 X141.793 Y93.256 E.00348
; LINE_WIDTH: 0.240246
G1 X141.523 Y93.288 E.00438
G1 X141.263 Y93.554 F30000
; LINE_WIDTH: 0.138284
G1 F3000
G1 X141.396 Y93.462 E.00126
; LINE_WIDTH: 0.173648
G1 X141.529 Y93.37 E.00172
; LINE_WIDTH: 0.179575
G1 X141.903 Y93.144 E.00486
; WIPE_START
G1 F24000
G1 X141.529 Y93.37 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.537 J-1.092 P1  F30000
G1 X140.182 Y94.033 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.504334
G1 F6300
G1 X139.911 Y93.761 E.01442
G1 X139.258 Y93.761 E.02454
G1 X139.786 Y94.289 E.02807
G1 X139.606 Y94.762 E.01902
G1 X138.605 Y93.761 E.05322
G1 X137.953 Y93.761 E.02454
G1 X139.52 Y95.328 E.08331
G1 X139.497 Y95.516 E.00711
G1 X139.558 Y96.019 E.01905
G1 X137.3 Y93.761 E.12004
G1 X136.648 Y93.761 E.02454
G1 X140.035 Y97.149 E.18012
G1 X140.119 Y97.27 E.00555
G1 X139.504 Y97.27 E.02312
G1 X135.995 Y93.761 E.18658
G1 X135.343 Y93.761 E.02454
G1 X138.852 Y97.27 E.18658
G1 X138.199 Y97.27 E.02454
G1 X134.69 Y93.761 E.18658
G1 X134.038 Y93.761 E.02454
G1 X137.547 Y97.27 E.18658
G1 X136.894 Y97.27 E.02454
G1 X133.385 Y93.761 E.18658
G1 X132.733 Y93.761 E.02454
G1 X136.241 Y97.27 E.18658
G1 X135.589 Y97.27 E.02454
G1 X132.08 Y93.761 E.18658
G1 X131.428 Y93.761 E.02454
G1 X134.936 Y97.27 E.18658
G1 X134.284 Y97.27 E.02454
G1 X130.775 Y93.761 E.18658
G1 X130.122 Y93.761 E.02454
G1 X133.631 Y97.27 E.18658
G1 X132.979 Y97.27 E.02454
G1 X129.47 Y93.761 E.18658
G1 X128.817 Y93.761 E.02454
G1 X132.326 Y97.27 E.18658
G1 X131.674 Y97.27 E.02454
G1 X128.165 Y93.761 E.18658
G1 X127.512 Y93.761 E.02454
G1 X131.021 Y97.27 E.18658
G1 X130.369 Y97.27 E.02454
G1 X126.86 Y93.761 E.18658
G1 X126.207 Y93.761 E.02454
G1 X129.716 Y97.27 E.18658
G1 X129.064 Y97.27 E.02454
G1 X125.555 Y93.761 E.18658
G1 X124.902 Y93.761 E.02454
G1 X128.411 Y97.27 E.18658
G1 X127.758 Y97.27 E.02454
G1 X124.25 Y93.761 E.18658
G1 X123.597 Y93.761 E.02454
G1 X127.106 Y97.27 E.18658
G1 X126.453 Y97.27 E.02454
G1 X122.945 Y93.761 E.18658
G1 X122.292 Y93.761 E.02454
G1 X125.801 Y97.27 E.18658
G1 X125.148 Y97.27 E.02454
G1 X121.639 Y93.761 E.18658
G1 X120.987 Y93.761 E.02454
G1 X124.496 Y97.27 E.18658
G1 X123.843 Y97.27 E.02454
G1 X120.334 Y93.761 E.18658
G1 X119.682 Y93.761 E.02454
G1 X123.191 Y97.27 E.18658
G1 X122.538 Y97.27 E.02454
G1 X119.029 Y93.761 E.18658
G1 X118.377 Y93.761 E.02454
G1 X121.886 Y97.27 E.18658
G1 X121.233 Y97.27 E.02454
G1 X117.724 Y93.761 E.18658
G1 X117.072 Y93.761 E.02454
G1 X120.581 Y97.27 E.18658
G1 X119.928 Y97.27 E.02454
G1 X116.419 Y93.761 E.18658
G1 X115.767 Y93.761 E.02454
G1 X119.275 Y97.27 E.18658
G1 X118.623 Y97.27 E.02454
G1 X115.114 Y93.761 E.18658
G1 X114.462 Y93.761 E.02454
G1 X117.97 Y97.27 E.18658
M73 P46 R7
G1 X117.318 Y97.27 E.02454
G1 X113.809 Y93.761 E.18658
G1 X113.156 Y93.761 E.02454
G1 X116.665 Y97.27 E.18658
G1 X116.013 Y97.27 E.02454
G1 X112.504 Y93.761 E.18658
G1 X111.851 Y93.761 E.02454
G1 X115.36 Y97.27 E.18658
G1 X114.708 Y97.27 E.02454
G1 X111.199 Y93.761 E.18658
G1 X110.584 Y93.761 E.02312
G1 X110.668 Y93.883 E.00556
G1 X114.055 Y97.27 E.18011
G1 X113.403 Y97.27 E.02454
G1 X111.145 Y95.013 E.12004
G1 X111.206 Y95.516 E.01905
G1 X111.183 Y95.704 E.00711
G1 X112.75 Y97.27 E.0833
G1 X112.098 Y97.27 E.02454
G1 X111.097 Y96.269 E.05322
G1 X110.917 Y96.742 E.01903
G1 X111.445 Y97.27 E.02806
G1 X110.792 Y97.27 E.02454
G1 X110.521 Y96.999 E.01442
; WIPE_START
G1 F24000
G1 X110.792 Y97.27 E-.14573
G1 X111.445 Y97.27 E-.24796
G1 X110.917 Y96.742 E-.28363
G1 X110.994 Y96.539 E-.08267
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.637 J-1.037 P1  F30000
G1 X108.8 Y97.887 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.164085
G1 F3000
G2 X109.307 Y97.57 I-2.341 J-4.301 E.00591
; LINE_WIDTH: 0.10292
G1 X109.44 Y97.478 E.00079
G1 X109.18 Y97.743 F30000
; LINE_WIDTH: 0.280702
G1 F3000
G1 X108.91 Y97.776 E.00528
; LINE_WIDTH: 0.211282
G3 X108.064 Y97.809 I-.685 J-6.724 E.01163
; LINE_WIDTH: 0.199786
G1 X107.793 Y97.776 E.00348
; LINE_WIDTH: 0.240244
G1 X107.523 Y97.743 E.00438
G1 X107.263 Y97.478 F30000
; LINE_WIDTH: 0.138284
G1 F3000
G1 X107.396 Y97.57 E.00126
; LINE_WIDTH: 0.173648
G1 X107.529 Y97.662 E.00172
; LINE_WIDTH: 0.179575
G1 X107.903 Y97.887 E.00486
; WIPE_START
G1 F24000
G1 X107.529 Y97.662 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.801 J-.916 P1  F30000
G1 X106.469 Y96.735 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.387523
G1 F3000
G1 X106.333 Y96.678 E.00414
; LINE_WIDTH: 0.42218
G1 X106.197 Y96.621 E.00456
; LINE_WIDTH: 0.402974
G1 X106.181 Y96.613 E.0005
G1 X106.157 Y96.482 E.00392
; LINE_WIDTH: 0.349311
G1 X106.133 Y96.35 E.00334
; LINE_WIDTH: 0.301127
G1 X106.109 Y96.219 E.00281
; LINE_WIDTH: 0.252942
G1 X106.085 Y96.087 E.00229
; LINE_WIDTH: 0.217072
G3 X106.066 Y95.793 I2.404 J-.306 E.00419
; LINE_WIDTH: 0.18173
G1 X106.05 Y95.524 E.00305
; LINE_WIDTH: 0.212395
G3 X106.066 Y95.238 I2.371 J-.008 E.00396
; LINE_WIDTH: 0.246863
G1 X106.082 Y94.969 E.00448
; LINE_WIDTH: 0.252944
G1 X106.085 Y94.944 E.00043
; LINE_WIDTH: 0.301127
G1 X106.109 Y94.813 E.00281
; LINE_WIDTH: 0.349312
G1 X106.133 Y94.681 E.00334
; LINE_WIDTH: 0.397497
G1 X106.157 Y94.55 E.00386
; LINE_WIDTH: 0.445682
G1 X106.181 Y94.418 E.00439
; LINE_WIDTH: 0.422175
G1 X106.197 Y94.411 E.00053
; LINE_WIDTH: 0.387519
G1 X106.333 Y94.354 E.00414
; LINE_WIDTH: 0.352862
G1 X106.469 Y94.297 E.00373
; WIPE_START
G1 F24000
G1 X106.333 Y94.354 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.743 J.964 P1  F30000
G1 X107.903 Y93.144 Z.6
M73 P46 R6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.17958
G1 F3000
G1 X107.529 Y93.37 E.00486
; LINE_WIDTH: 0.173653
G1 X107.396 Y93.462 E.00172
; LINE_WIDTH: 0.138286
G1 X107.263 Y93.554 E.00126
G1 X107.523 Y93.288 F30000
; LINE_WIDTH: 0.240247
G1 F3000
G1 X107.793 Y93.256 E.00438
; LINE_WIDTH: 0.199787
G1 X108.064 Y93.223 E.00348
; LINE_WIDTH: 0.211283
G3 X108.91 Y93.256 I.162 J6.757 E.01163
; LINE_WIDTH: 0.280703
G1 X109.18 Y93.288 E.00528
G1 X109.44 Y93.554 F30000
; LINE_WIDTH: 0.10292
G1 F3000
G1 X109.307 Y93.462 E.00079
; LINE_WIDTH: 0.164089
G2 X108.8 Y93.144 I-2.848 J3.984 E.00591
; WIPE_START
M73 P47 R6
G1 F24000
G1 X109.307 Y93.462 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.164 J1.206 P1  F30000
G1 X141.903 Y97.887 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.179577
G1 F3000
G1 X141.529 Y97.662 E.00486
; LINE_WIDTH: 0.17365
G1 X141.396 Y97.57 E.00172
; LINE_WIDTH: 0.138285
G1 X141.263 Y97.478 E.00126
G1 X141.523 Y97.743 F30000
; LINE_WIDTH: 0.240244
G1 F3000
G1 X141.793 Y97.776 E.00438
; LINE_WIDTH: 0.199786
G1 X142.064 Y97.809 E.00348
; LINE_WIDTH: 0.211282
G2 X142.91 Y97.776 I.162 J-6.757 E.01163
; LINE_WIDTH: 0.280704
G1 X143.18 Y97.743 E.00528
G1 X143.44 Y97.478 F30000
; LINE_WIDTH: 0.10292
G1 F3000
G1 X143.307 Y97.57 E.00079
; LINE_WIDTH: 0.164094
G3 X142.8 Y97.887 I-2.849 J-3.985 E.00591
; WIPE_START
G1 F24000
G1 X143.307 Y97.57 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.815 J.904 P1  F30000
G1 X144.234 Y96.735 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.387521
G1 F3000
G1 X144.37 Y96.678 E.00414
; WIPE_START
G1 F24000
G1 X144.234 Y96.735 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.193 J-.238 P1  F30000
G1 X141.749 Y109.171 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X110.287 Y109.171 E1.17185
G1 X110.862 Y108.661 E.02861
G1 X111.199 Y108.173 E.02212
G1 X111.409 Y107.617 E.02212
G1 X111.481 Y107.028 E.02212
G1 X111.409 Y106.438 E.02212
G1 X111.199 Y105.883 E.02212
G1 X110.862 Y105.394 E.02212
G1 X110.287 Y104.885 E.02861
G1 X141.749 Y104.885 E1.17185
G1 X141.174 Y105.394 E.02861
G1 X140.836 Y105.883 E.02212
G1 X140.626 Y106.438 E.02212
G1 X140.554 Y107.028 E.02212
G1 X140.626 Y107.617 E.02212
G1 X140.836 Y108.173 E.02212
G1 X141.174 Y108.661 E.02212
G1 X141.704 Y109.131 E.02638
; WIPE_START
G1 F24000
G1 X139.704 Y109.134 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.266 J1.188 P1  F30000
G1 X144.763 Y108 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
G1 X144.517 Y108.356 E.01611
G1 X144.155 Y108.676 E.01798
G1 X143.728 Y108.901 E.01798
G1 X143.259 Y109.016 E.01798
G1 X142.776 Y109.016 E.01798
G1 X142.307 Y108.901 E.01798
G1 X141.88 Y108.676 E.01798
G1 X141.518 Y108.356 E.01798
G1 X141.284 Y108.016 E.01538
G1 X141.244 Y107.959 E.00261
G1 X141.073 Y107.507 E.01798
G1 X141.015 Y107.028 E.01798
G1 X141.073 Y106.549 E.01798
G1 X141.244 Y106.097 E.01798
G1 X141.518 Y105.7 E.01798
G1 X141.88 Y105.379 E.01798
G1 X142.307 Y105.155 E.01798
G1 X142.776 Y105.04 E.01798
G1 X143.259 Y105.04 E.01798
G1 X143.728 Y105.155 E.01798
G1 X144.155 Y105.379 E.01798
G1 X144.517 Y105.7 E.01798
G1 X144.791 Y106.097 E.01798
G1 X144.962 Y106.549 E.01798
G1 X145.021 Y107.028 E.01798
G1 X144.962 Y107.507 E.01798
G1 X144.795 Y107.95 E.01762
; WIPE_START
G1 F24000
G1 X144.517 Y108.356 E-.18707
G1 X144.155 Y108.676 E-.18348
G1 X143.728 Y108.901 E-.18349
G1 X143.259 Y109.016 E-.18348
G1 X143.2 Y109.016 E-.02248
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.084 J.553 P1  F30000
G1 X144.968 Y105.548 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X144.862 Y105.394 E.00698
G1 X144.287 Y104.885 E.02861
G1 X145.161 Y104.885 E.03256
G1 X145.161 Y105.488 E.02248
G1 X145.025 Y105.531 E.00528
; WIPE_START
G1 F24000
G1 X144.862 Y105.394 E-.08094
G1 X144.287 Y104.885 E-.29191
G1 X145.161 Y104.885 E-.33214
G1 X145.161 Y105.03 E-.05501
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.215 J-.067 P1  F30000
G1 X144.968 Y108.507 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X145.161 Y108.567 E.00752
G1 X145.161 Y109.171 E.02248
G1 X144.287 Y109.171 E.03256
G1 X144.862 Y108.661 E.02861
G1 X144.934 Y108.557 E.00474
; WIPE_START
G1 F24000
G1 X145.161 Y108.567 E-.08626
G1 X145.161 Y109.171 E-.22934
G1 X144.287 Y109.171 E-.33214
G1 X144.508 Y108.975 E-.11227
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.012 J-1.217 P1  F30000
G1 X107.821 Y108.624 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
G1 X107.518 Y108.356 E.01506
G1 X107.244 Y107.959 E.01798
G1 X107.073 Y107.507 E.01798
G1 X107.015 Y107.028 E.01798
G1 X107.073 Y106.549 E.01798
G1 X107.244 Y106.097 E.01798
G1 X107.518 Y105.7 E.01798
G1 X107.88 Y105.379 E.01798
G1 X107.942 Y105.347 E.00261
G1 X108.307 Y105.155 E.01538
G1 X108.776 Y105.04 E.01798
G1 X109.259 Y105.04 E.01798
G1 X109.728 Y105.155 E.01798
G1 X110.155 Y105.379 E.01798
G1 X110.517 Y105.7 E.01798
G1 X110.557 Y105.757 E.00261
G1 X110.791 Y106.097 E.01538
G1 X110.962 Y106.549 E.01798
G1 X111.021 Y107.028 E.01798
G1 X110.962 Y107.507 E.01798
G1 X110.791 Y107.959 E.01798
G1 X110.517 Y108.356 E.01798
G1 X110.155 Y108.676 E.01798
G1 X109.728 Y108.901 E.01798
G1 X109.259 Y109.016 E.01798
G1 X108.776 Y109.016 E.01798
G1 X108.307 Y108.901 E.01798
G1 X107.88 Y108.676 E.01798
G1 X107.866 Y108.664 E.00069
; WIPE_START
G1 F24000
G1 X107.518 Y108.356 E-.17642
G1 X107.244 Y107.959 E-.18348
M73 P48 R6
G1 X107.073 Y107.507 E-.18349
G1 X107.015 Y107.028 E-.18349
G1 X107.025 Y106.941 E-.03313
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.216 J.037 P1  F30000
G1 X107.067 Y105.548 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X106.875 Y105.488 E.00752
G1 X106.875 Y104.885 E.02248
G1 X107.749 Y104.885 E.03256
G1 X107.174 Y105.394 E.02861
G1 X107.101 Y105.499 E.00474
; WIPE_START
G1 F24000
G1 X106.875 Y105.488 E-.08626
G1 X106.875 Y104.885 E-.22934
G1 X107.749 Y104.885 E-.33214
G1 X107.528 Y105.081 E-.11226
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.217 J.018 P1  F30000
G1 X107.586 Y109.026 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X107.749 Y109.171 E.00811
G1 X106.875 Y109.171 E.03256
G1 X106.875 Y108.567 E.02248
G1 X107.067 Y108.507 E.00752
G1 X107.174 Y108.661 E.00698
G1 X107.541 Y108.987 E.01826
; WIPE_START
G1 F24000
G1 X107.749 Y109.171 E-.10557
G1 X106.875 Y109.171 E-.33214
G1 X106.875 Y108.567 E-.22934
G1 X107.067 Y108.507 E-.07668
G1 X107.092 Y108.542 E-.01627
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.034 J1.216 P1  F30000
G1 X145.618 Y109.628 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
G1 X106.418 Y109.628 E1.46005
G1 X106.418 Y104.428 E.19368
G1 X145.618 Y104.428 E1.46005
G1 X145.618 Y109.568 E.19145
; WIPE_START
G1 F24000
G1 X143.618 Y109.571 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.849 J.872 P1  F30000
G1 X145.036 Y108.19 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.422178
G1 F3000
G1 X145.172 Y108.133 E.00456
; LINE_WIDTH: 0.402974
G1 X145.188 Y108.125 E.0005
G1 X145.212 Y107.994 E.00392
; LINE_WIDTH: 0.349311
G1 X145.236 Y107.862 E.00334
; LINE_WIDTH: 0.301126
G1 X145.26 Y107.731 E.00281
; LINE_WIDTH: 0.25294
G1 X145.284 Y107.6 E.00229
; LINE_WIDTH: 0.217074
G2 X145.303 Y107.305 I-2.404 J-.306 E.00419
; LINE_WIDTH: 0.181734
G1 X145.32 Y107.036 E.00305
; LINE_WIDTH: 0.212394
G2 X145.303 Y106.75 I-2.371 J-.008 E.00396
; LINE_WIDTH: 0.24686
G1 X145.287 Y106.481 E.00448
; LINE_WIDTH: 0.25294
G1 X145.284 Y106.456 E.00043
; LINE_WIDTH: 0.301126
G1 X145.26 Y106.325 E.00281
; LINE_WIDTH: 0.349311
G1 X145.236 Y106.193 E.00334
; LINE_WIDTH: 0.397497
G1 X145.212 Y106.062 E.00386
; LINE_WIDTH: 0.445682
G1 X145.188 Y105.93 E.00439
; LINE_WIDTH: 0.422186
G1 X145.172 Y105.923 E.00053
; LINE_WIDTH: 0.387532
G1 X145.036 Y105.866 E.00414
; LINE_WIDTH: 0.352877
G1 X144.9 Y105.809 E.00373
; WIPE_START
G1 F24000
G1 X145.036 Y105.866 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.743 J-.964 P1  F30000
G1 X143.466 Y104.656 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.164094
G1 F3000
G3 X143.973 Y104.974 I-2.342 J4.302 E.00591
; LINE_WIDTH: 0.10292
G1 X144.106 Y105.066 E.00079
G1 X143.847 Y104.801 F30000
; LINE_WIDTH: 0.280705
G1 F3000
G1 X143.576 Y104.768 E.00528
; LINE_WIDTH: 0.211284
G2 X142.73 Y104.735 I-.685 J6.724 E.01163
; LINE_WIDTH: 0.199787
G1 X142.459 Y104.768 E.00348
; LINE_WIDTH: 0.240246
G1 X142.189 Y104.801 E.00438
G1 X141.929 Y105.066 F30000
; LINE_WIDTH: 0.138284
G1 F3000
G1 X142.062 Y104.974 E.00126
; LINE_WIDTH: 0.173648
G1 X142.195 Y104.882 E.00172
; LINE_WIDTH: 0.179575
G1 X142.569 Y104.656 E.00486
; WIPE_START
G1 F24000
G1 X142.195 Y104.882 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.537 J-1.092 P1  F30000
G1 X140.848 Y105.545 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.504334
G1 F6300
G1 X140.577 Y105.273 E.01442
G1 X139.924 Y105.273 E.02454
G1 X140.452 Y105.801 E.02807
G1 X140.273 Y106.274 E.01902
G1 X139.272 Y105.273 E.05322
G1 X138.619 Y105.273 E.02454
G1 X140.186 Y106.84 E.08331
G1 X140.163 Y107.028 E.00711
G1 X140.224 Y107.531 E.01905
G1 X137.966 Y105.273 E.12004
G1 X137.314 Y105.273 E.02454
G1 X140.701 Y108.661 E.18012
G1 X140.785 Y108.782 E.00555
G1 X140.17 Y108.782 E.02312
G1 X136.661 Y105.273 E.18658
G1 X136.009 Y105.273 E.02454
G1 X139.518 Y108.782 E.18658
G1 X138.865 Y108.782 E.02454
G1 X135.356 Y105.273 E.18658
G1 X134.704 Y105.273 E.02454
G1 X138.213 Y108.782 E.18658
G1 X137.56 Y108.782 E.02454
G1 X134.051 Y105.273 E.18658
G1 X133.399 Y105.273 E.02454
G1 X136.908 Y108.782 E.18658
G1 X136.255 Y108.782 E.02454
G1 X132.746 Y105.273 E.18658
G1 X132.094 Y105.273 E.02454
G1 X135.602 Y108.782 E.18658
G1 X134.95 Y108.782 E.02454
M73 P49 R6
G1 X131.441 Y105.273 E.18658
G1 X130.789 Y105.273 E.02454
G1 X134.297 Y108.782 E.18658
G1 X133.645 Y108.782 E.02454
G1 X130.136 Y105.273 E.18658
G1 X129.483 Y105.273 E.02454
G1 X132.992 Y108.782 E.18658
G1 X132.34 Y108.782 E.02454
G1 X128.831 Y105.273 E.18658
G1 X128.178 Y105.273 E.02454
G1 X131.687 Y108.782 E.18658
G1 X131.035 Y108.782 E.02454
G1 X127.526 Y105.273 E.18658
G1 X126.873 Y105.273 E.02454
G1 X130.382 Y108.782 E.18658
G1 X129.73 Y108.782 E.02454
G1 X126.221 Y105.273 E.18658
G1 X125.568 Y105.273 E.02454
G1 X129.077 Y108.782 E.18658
G1 X128.425 Y108.782 E.02454
G1 X124.916 Y105.273 E.18658
G1 X124.263 Y105.273 E.02454
G1 X127.772 Y108.782 E.18658
G1 X127.119 Y108.782 E.02454
G1 X123.611 Y105.273 E.18658
G1 X122.958 Y105.273 E.02454
G1 X126.467 Y108.782 E.18658
G1 X125.814 Y108.782 E.02454
G1 X122.306 Y105.273 E.18658
G1 X121.653 Y105.273 E.02454
G1 X125.162 Y108.782 E.18658
G1 X124.509 Y108.782 E.02454
G1 X121.001 Y105.273 E.18658
G1 X120.348 Y105.273 E.02454
G1 X123.857 Y108.782 E.18658
G1 X123.204 Y108.782 E.02454
G1 X119.695 Y105.273 E.18658
G1 X119.043 Y105.273 E.02454
G1 X122.552 Y108.782 E.18658
G1 X121.899 Y108.782 E.02454
G1 X118.39 Y105.273 E.18658
G1 X117.738 Y105.273 E.02454
G1 X121.247 Y108.782 E.18658
G1 X120.594 Y108.782 E.02454
G1 X117.085 Y105.273 E.18658
G1 X116.433 Y105.273 E.02454
G1 X119.942 Y108.782 E.18658
G1 X119.289 Y108.782 E.02454
G1 X115.78 Y105.273 E.18658
G1 X115.128 Y105.273 E.02454
G1 X118.636 Y108.782 E.18658
G1 X117.984 Y108.782 E.02454
G1 X114.475 Y105.273 E.18658
G1 X113.823 Y105.273 E.02454
G1 X117.331 Y108.782 E.18658
G1 X116.679 Y108.782 E.02454
G1 X113.17 Y105.273 E.18658
G1 X112.518 Y105.273 E.02454
G1 X116.026 Y108.782 E.18658
G1 X115.374 Y108.782 E.02454
G1 X111.865 Y105.273 E.18658
G1 X111.25 Y105.273 E.02312
G1 X111.334 Y105.395 E.00556
G1 X114.721 Y108.782 E.18011
G1 X114.069 Y108.782 E.02454
G1 X111.811 Y106.525 E.12004
G1 X111.872 Y107.028 E.01905
G1 X111.85 Y107.216 E.00711
G1 X113.416 Y108.782 E.0833
G1 X112.764 Y108.782 E.02454
G1 X111.763 Y107.781 E.05322
G1 X111.583 Y108.254 E.01903
G1 X112.111 Y108.782 E.02806
G1 X111.459 Y108.782 E.02454
G1 X111.187 Y108.511 E.01442
; WIPE_START
G1 F24000
G1 X111.459 Y108.782 E-.14573
G1 X112.111 Y108.782 E-.24796
G1 X111.583 Y108.254 E-.28363
G1 X111.66 Y108.051 E-.08267
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.637 J-1.037 P1  F30000
G1 X109.466 Y109.399 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.164085
G1 F3000
G2 X109.973 Y109.082 I-2.341 J-4.301 E.00591
; LINE_WIDTH: 0.10292
G1 X110.106 Y108.99 E.00079
G1 X109.847 Y109.255 F30000
; LINE_WIDTH: 0.280702
G1 F3000
G1 X109.576 Y109.288 E.00528
; LINE_WIDTH: 0.211282
G3 X108.73 Y109.321 I-.685 J-6.724 E.01163
; LINE_WIDTH: 0.199786
G1 X108.459 Y109.288 E.00348
; LINE_WIDTH: 0.240244
G1 X108.189 Y109.255 E.00438
G1 X107.929 Y108.99 F30000
; LINE_WIDTH: 0.138284
G1 F3000
G1 X108.062 Y109.082 E.00126
; LINE_WIDTH: 0.173648
G1 X108.195 Y109.174 E.00172
; LINE_WIDTH: 0.179575
G1 X108.569 Y109.399 E.00486
; WIPE_START
M73 P50 R6
G1 F24000
G1 X108.195 Y109.174 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.801 J-.916 P1  F30000
G1 X107.135 Y108.247 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.387523
G1 F3000
G1 X106.999 Y108.19 E.00414
; LINE_WIDTH: 0.42218
G1 X106.863 Y108.133 E.00456
; LINE_WIDTH: 0.402974
G1 X106.848 Y108.125 E.0005
G1 X106.823 Y107.994 E.00392
; LINE_WIDTH: 0.349311
G1 X106.799 Y107.862 E.00334
; LINE_WIDTH: 0.301127
G1 X106.775 Y107.731 E.00281
; LINE_WIDTH: 0.252942
G1 X106.751 Y107.6 E.00229
; LINE_WIDTH: 0.217072
G3 X106.732 Y107.305 I2.404 J-.306 E.00419
; LINE_WIDTH: 0.18173
G1 X106.716 Y107.036 E.00305
; LINE_WIDTH: 0.212395
G3 X106.732 Y106.75 I2.371 J-.008 E.00396
; LINE_WIDTH: 0.246863
G1 X106.748 Y106.481 E.00448
; LINE_WIDTH: 0.252944
G1 X106.751 Y106.456 E.00043
; LINE_WIDTH: 0.301127
G1 X106.775 Y106.325 E.00281
; LINE_WIDTH: 0.349312
G1 X106.799 Y106.193 E.00334
; LINE_WIDTH: 0.397497
G1 X106.823 Y106.062 E.00386
; LINE_WIDTH: 0.445682
G1 X106.848 Y105.93 E.00439
; LINE_WIDTH: 0.422175
G1 X106.863 Y105.923 E.00053
; LINE_WIDTH: 0.387519
G1 X106.999 Y105.866 E.00414
; LINE_WIDTH: 0.352862
G1 X107.135 Y105.809 E.00373
; WIPE_START
G1 F24000
G1 X106.999 Y105.866 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.743 J.964 P1  F30000
G1 X108.569 Y104.656 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.17958
G1 F3000
G1 X108.195 Y104.882 E.00486
; LINE_WIDTH: 0.173653
G1 X108.062 Y104.974 E.00172
; LINE_WIDTH: 0.138286
G1 X107.929 Y105.066 E.00126
G1 X108.189 Y104.801 F30000
; LINE_WIDTH: 0.240247
G1 F3000
G1 X108.459 Y104.768 E.00438
; LINE_WIDTH: 0.199787
G1 X108.73 Y104.735 E.00348
; LINE_WIDTH: 0.211283
G3 X109.576 Y104.768 I.162 J6.757 E.01163
; LINE_WIDTH: 0.280703
G1 X109.847 Y104.801 E.00528
G1 X110.106 Y105.066 F30000
; LINE_WIDTH: 0.10292
G1 F3000
G1 X109.973 Y104.974 E.00079
; LINE_WIDTH: 0.164089
G2 X109.466 Y104.656 I-2.848 J3.984 E.00591
; WIPE_START
G1 F24000
G1 X109.973 Y104.974 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.164 J1.206 P1  F30000
G1 X142.569 Y109.399 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.179577
G1 F3000
G1 X142.195 Y109.174 E.00486
; LINE_WIDTH: 0.17365
G1 X142.062 Y109.082 E.00172
; LINE_WIDTH: 0.138285
G1 X141.929 Y108.99 E.00126
G1 X142.189 Y109.255 F30000
; LINE_WIDTH: 0.240244
G1 F3000
G1 X142.459 Y109.288 E.00438
; LINE_WIDTH: 0.199786
G1 X142.73 Y109.321 E.00348
; LINE_WIDTH: 0.211282
G2 X143.576 Y109.288 I.162 J-6.757 E.01163
; LINE_WIDTH: 0.280704
G1 X143.847 Y109.255 E.00528
G1 X144.106 Y108.99 F30000
; LINE_WIDTH: 0.10292
G1 F3000
G1 X143.973 Y109.082 E.00079
; LINE_WIDTH: 0.164094
G3 X143.466 Y109.399 I-2.849 J-3.985 E.00591
; WIPE_START
G1 F24000
G1 X143.973 Y109.082 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.815 J.904 P1  F30000
G1 X144.9 Y108.247 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.387521
G1 F3000
G1 X145.036 Y108.19 E.00414
; WIPE_START
G1 F24000
G1 X144.9 Y108.247 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.097 J-.527 P1  F30000
G1 X136.01 Y126.764 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X105.7 Y126.765 E1.12892
G1 X105.988 Y126.526 E.01392
G1 X106.391 Y125.951 E.02615
G1 X106.636 Y125.304 E.02579
G1 X106.72 Y124.618 E.02572
G1 X106.636 Y123.933 E.02572
G1 X106.391 Y123.286 E.02579
G1 X105.988 Y122.71 E.02615
G1 X105.7 Y122.472 E.01392
G1 X106.354 Y122.475 E.02437
G1 X136.009 Y122.472 E1.10453
G1 X135.723 Y122.712 E.01391
G1 X135.322 Y123.286 E.02609
G1 X135.076 Y123.933 E.02578
G1 X134.993 Y124.618 E.02572
G1 X135.076 Y125.304 E.02571
G1 X135.322 Y125.951 E.02578
G1 X135.723 Y126.525 E.0261
G1 X135.964 Y126.726 E.01168
; WIPE_START
G1 F24000
G1 X133.964 Y126.729 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.116 J-1.211 P1  F30000
G1 X106.194 Y124.08 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
G1 X106.259 Y124.618 E.0202
G1 X106.189 Y125.193 E.02158
G1 X105.983 Y125.736 E.0216
G1 X105.649 Y126.214 E.02172
G1 X105.197 Y126.587 E.02186
G1 X104.661 Y126.812 E.02162
G3 X103.051 Y126.812 I-.806 J-4.545 E.06029
G1 X102.514 Y126.586 E.02169
G1 X102.063 Y126.202 E.02207
G1 X101.753 Y125.698 E.02204
G3 X101.617 Y124.09 I3.586 J-1.113 E.06058
G1 X101.753 Y123.539 E.02112
G1 X102.063 Y123.035 E.02204
G1 X102.514 Y122.651 E.02208
G1 X103.051 Y122.425 E.02168
G1 X103.595 Y122.354 E.02045
G3 X104.661 Y122.425 I.261 J4.152 E.0399
G1 X105.197 Y122.649 E.02163
G1 X105.649 Y123.023 E.02186
G1 X105.983 Y123.501 E.02172
G1 X106.181 Y124.022 E.02075
; WIPE_START
G1 F24000
G1 X106.259 Y124.618 E-.22865
G1 X106.189 Y125.193 E-.22015
G1 X105.983 Y125.736 E-.22042
G1 X105.846 Y125.932 E-.09078
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.066 J1.215 P1  F30000
G1 X140.091 Y124.073 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X140.086 Y124.091 E.00071
G3 X140.096 Y125.147 I-3.713 J.561 E.03947
G1 X139.96 Y125.698 E.02112
G1 X139.649 Y126.202 E.02204
M73 P51 R6
G1 X139.198 Y126.586 E.02208
G1 X138.661 Y126.811 E.02168
G3 X137.051 Y126.812 I-.805 J-4.527 E.06029
G1 X136.527 Y126.592 E.02118
G3 X136.062 Y126.214 I1.734 J-2.603 E.02233
G1 X135.729 Y125.736 E.02171
G1 X135.523 Y125.193 E.0216
G1 X135.453 Y124.618 E.02158
G1 X135.523 Y124.043 E.02158
G1 X135.729 Y123.501 E.0216
G1 X136.062 Y123.023 E.0217
G1 X136.514 Y122.646 E.02191
G1 X137.052 Y122.425 E.02167
G1 X137.595 Y122.354 E.02041
G3 X138.662 Y122.425 I.261 J4.15 E.03991
G1 X139.198 Y122.651 E.02169
G1 X139.649 Y123.035 E.02207
G1 X139.96 Y123.539 E.02204
G1 X140.077 Y124.014 E.01823
; WIPE_START
G1 F24000
G1 X140.086 Y124.091 E-.02936
G1 X140.128 Y124.618 E-.20103
G1 X140.096 Y125.147 E-.20132
G1 X139.96 Y125.698 E-.21551
G1 X139.804 Y125.95 E-.11277
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.082 J.557 P1  F30000
G1 X140.457 Y127.219 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G2 X138.339 Y127.324 I-.064 J20.174 E.07901
G3 X136.878 Y127.272 I-.448 J-7.948 E.05452
G2 X135.357 Y127.219 I-1.346 J16.678 E.05673
G1 X106.356 Y127.219 E1.08018
G2 X104.339 Y127.324 I.053 J20.389 E.07524
G3 X102.878 Y127.272 I-.448 J-7.948 E.05452
G2 X101.255 Y127.219 I-1.364 J16.99 E.0605
G2 X101.153 Y125.099 I-20.356 J-.083 E.0791
G3 X101.205 Y123.64 I6.957 J-.483 E.05447
G2 X101.255 Y122.018 I-17.655 J-1.359 E.06048
G2 X103.373 Y121.913 I.064 J-20.174 E.07901
G3 X104.834 Y121.965 I.448 J7.948 E.05452
G2 X106.356 Y122.018 I1.346 J-16.678 E.05673
G1 X135.357 Y122.018 E1.08018
G2 X137.373 Y121.913 I-.053 J-20.389 E.07524
G3 X138.339 Y121.913 I.483 J7.424 E.03599
G2 X140.457 Y122.018 I2.053 J-20.069 E.07901
G2 X140.559 Y124.138 I20.356 J.083 E.0791
G1 X140.584 Y124.618 E.01792
G3 X140.471 Y126.106 I-68.655 J-4.467 E.05559
G2 X140.456 Y127.159 I24.626 J.876 E.03922
G1 X140.23 Y126.63 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.293627
G1 F3000
G1 X139.324 Y126.898 E.01929
; LINE_WIDTH: 0.259695
G1 X139.199 Y126.928 E.00227
; LINE_WIDTH: 0.220501
G1 X139.074 Y126.958 E.00186
; LINE_WIDTH: 0.181308
G1 X138.949 Y126.988 E.00145
; LINE_WIDTH: 0.142114
G1 X138.824 Y127.018 E.00104
G1 X138.987 Y127.031 F30000
; LINE_WIDTH: 0.613461
G1 F3000
G1 X140.231 Y126.563 E.06183
G1 X139.81 Y126.993 F30000
; LINE_WIDTH: 0.510272
G1 F3000
G1 X140.036 Y126.409 E.02388
; LINE_WIDTH: 0.484173
G1 X140.262 Y125.824 E.02254
; WIPE_START
G1 F24000
G1 X140.036 Y126.409 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.214 J.092 P1  F30000
G1 X140.262 Y123.413 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.484164
G1 F3000
G1 X140.036 Y122.828 E.02254
; LINE_WIDTH: 0.510253
G1 X139.81 Y122.243 E.02388
G1 X138.986 Y122.205 F30000
; LINE_WIDTH: 0.613448
G1 F3000
G1 X140.231 Y122.674 E.06184
G1 X140.23 Y122.607 F30000
; LINE_WIDTH: 0.293749
G1 F3000
G1 X139.324 Y122.339 E.0193
; LINE_WIDTH: 0.259681
G1 X139.2 Y122.309 E.00226
; LINE_WIDTH: 0.220491
G1 X139.075 Y122.279 E.00186
; LINE_WIDTH: 0.181301
G1 X138.95 Y122.249 E.00145
; LINE_WIDTH: 0.14211
G1 X138.826 Y122.219 E.00104
; WIPE_START
G1 F24000
G1 X138.95 Y122.249 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.018 J-1.217 P1  F30000
G1 X136.886 Y122.219 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.128236
G1 F3000
G2 X136.538 Y122.362 I.048 J.613 E.00266
; WIPE_START
G1 F24000
G1 X136.704 Y122.262 E-.38607
G1 X136.886 Y122.219 E-.37393
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.37 J-1.159 P1  F30000
G1 X135.369 Y122.704 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.158791
G1 F3000
G1 X135.293 Y122.846 E.00152
; LINE_WIDTH: 0.130856
G1 X135.218 Y122.989 E.00116
G1 X135.04 Y123.513 F30000
; FEATURE: Bottom surface
; LINE_WIDTH: 0.503212
G1 F6300
G1 X134.388 Y122.861 E.03458
G1 X133.737 Y122.861 E.02441
G1 X134.701 Y123.825 E.05115
G1 X134.628 Y124.403 E.02183
G1 X133.086 Y122.861 E.08177
G1 X132.435 Y122.861 E.02441
G1 X134.658 Y125.084 E.1179
G1 X134.696 Y125.397 E.01185
G1 X134.913 Y125.969 E.02295
G1 X134.9 Y125.977 E.00057
G1 X131.784 Y122.861 E.16525
G1 X131.134 Y122.861 E.02441
G1 X134.648 Y126.376 E.18644
G1 X133.997 Y126.376 E.02442
G1 X130.483 Y122.861 E.18643
G1 X129.832 Y122.861 E.02441
G1 X133.346 Y126.376 E.18643
G1 X132.695 Y126.376 E.02442
G1 X129.181 Y122.861 E.18643
G1 X128.53 Y122.862 E.02441
G1 X132.044 Y126.376 E.18642
G1 X131.394 Y126.376 E.02442
G1 X127.879 Y122.862 E.18642
G1 X127.228 Y122.862 E.02441
G1 X130.743 Y126.376 E.18641
G1 X130.092 Y126.376 E.02442
G1 X126.577 Y122.862 E.18641
G1 X125.926 Y122.862 E.02441
G1 X129.441 Y126.376 E.18641
G1 X128.79 Y126.376 E.02442
G1 X125.276 Y122.862 E.1864
G1 X124.625 Y122.862 E.02441
G1 X128.139 Y126.376 E.1864
G1 X127.488 Y126.376 E.02442
G1 X123.974 Y122.862 E.1864
G1 X123.323 Y122.862 E.02441
G1 X126.837 Y126.376 E.18639
G1 X126.186 Y126.376 E.02442
G1 X122.672 Y122.862 E.18639
M73 P52 R6
G1 X122.021 Y122.862 E.02441
G1 X125.535 Y126.376 E.18639
G1 X124.884 Y126.376 E.02442
G1 X121.37 Y122.862 E.18638
G1 X120.719 Y122.862 E.02441
G1 X124.233 Y126.376 E.18638
G1 X123.582 Y126.376 E.02442
G1 X120.069 Y122.862 E.18638
G1 X119.418 Y122.862 E.02441
G1 X122.931 Y126.376 E.18637
G1 X122.28 Y126.376 E.02442
G1 X118.767 Y122.863 E.18637
G1 X118.116 Y122.863 E.02441
G1 X121.629 Y126.376 E.18637
G1 X120.978 Y126.376 E.02442
G1 X117.465 Y122.863 E.18636
G1 X116.814 Y122.863 E.02441
G1 X120.327 Y126.376 E.18636
G1 X119.676 Y126.376 E.02442
G1 X116.163 Y122.863 E.18635
G1 X115.512 Y122.863 E.02441
G1 X119.025 Y126.376 E.18635
G1 X118.374 Y126.376 E.02442
G1 X114.861 Y122.863 E.18635
G1 X114.211 Y122.863 E.02441
G1 X117.724 Y126.376 E.18634
G1 X117.073 Y126.376 E.02442
G1 X113.56 Y122.863 E.18634
G1 X112.909 Y122.863 E.02441
G1 X116.422 Y126.376 E.18634
G1 X115.771 Y126.376 E.02442
G1 X112.258 Y122.863 E.18633
G1 X111.607 Y122.863 E.02441
G1 X115.12 Y126.376 E.18633
G1 X114.469 Y126.376 E.02442
G1 X110.956 Y122.863 E.18633
G1 X110.305 Y122.863 E.02441
G1 X113.818 Y126.376 E.18632
G1 X113.167 Y126.376 E.02442
G1 X109.654 Y122.863 E.18632
G1 X109.003 Y122.864 E.02441
G1 X112.516 Y126.376 E.18632
G1 X111.865 Y126.376 E.02442
G1 X108.353 Y122.864 E.18631
G1 X107.702 Y122.864 E.02441
G1 X111.214 Y126.376 E.18631
G1 X110.563 Y126.376 E.02442
G1 X107.051 Y122.864 E.18631
G1 X106.945 Y122.864 E.00399
G1 X107.065 Y123.127 E.01086
G1 X106.802 Y123.266 E.01115
G1 X109.912 Y126.376 E.16496
G1 X109.261 Y126.376 E.02442
G1 X107.057 Y124.171 E.11694
G1 X107.111 Y124.618 E.01689
G1 X107.083 Y124.849 E.0087
G1 X108.61 Y126.376 E.08101
G1 X107.959 Y126.376 E.02442
G1 X107.007 Y125.423 E.05054
G1 X106.827 Y125.895 E.01893
G1 X107.514 Y126.582 E.03642
; WIPE_START
G1 F24000
G1 X106.827 Y125.895 E-.369
G1 X107.007 Y125.423 E-.19177
G1 X107.377 Y125.794 E-.19923
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.556 J-1.083 P1  F30000
G1 X106.494 Y126.247 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.10292
G1 F3000
G1 X106.419 Y126.39 E.00079
; LINE_WIDTH: 0.13101
G1 X106.343 Y126.533 E.00116
; WIPE_START
G1 F24000
G1 X106.419 Y126.39 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.44 J-1.135 P1  F30000
G1 X105.167 Y126.876 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.126117
G1 F3000
G3 X104.825 Y127.018 I-.394 J-.464 E.00255
; WIPE_START
G1 F24000
G1 X105 Y126.976 E-.36508
G1 X105.167 Y126.876 E-.39492
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.076 J-1.215 P1  F30000
G1 X102.887 Y127.018 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.10292
M73 P53 R6
G1 F3000
G1 X102.762 Y126.988 E.00063
; LINE_WIDTH: 0.14211
G1 X102.637 Y126.958 E.00104
; LINE_WIDTH: 0.1813
G1 X102.513 Y126.928 E.00145
; LINE_WIDTH: 0.221987
G1 X102.383 Y126.897 E.00195
; LINE_WIDTH: 0.274239
G1 X101.482 Y126.63 E.0177
G1 X101.481 Y126.563 F30000
; LINE_WIDTH: 0.608545
G1 F3000
G1 X102.726 Y127.031 E.06129
G1 X101.903 Y126.993 F30000
; LINE_WIDTH: 0.536341
G1 F3000
G1 X101.677 Y126.409 E.02521
; LINE_WIDTH: 0.510253
G1 X101.45 Y125.824 E.02388
; WIPE_START
G1 F24000
G1 X101.677 Y126.409 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.214 J-.092 P1  F30000
G1 X101.45 Y123.413 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.510273
G1 F3000
G1 X101.677 Y122.828 E.02388
; LINE_WIDTH: 0.53637
G1 X101.903 Y122.243 E.02521
G1 X102.726 Y122.205 F30000
; LINE_WIDTH: 0.60856
G1 F3000
G1 X101.481 Y122.674 E.0613
G1 X101.482 Y122.606 F30000
; LINE_WIDTH: 0.274102
G1 F3000
G1 X102.383 Y122.34 E.01769
; LINE_WIDTH: 0.221994
G1 X102.513 Y122.309 E.00195
; LINE_WIDTH: 0.181308
G1 X102.638 Y122.279 E.00145
; LINE_WIDTH: 0.142114
G1 X102.763 Y122.249 E.00104
; LINE_WIDTH: 0.102921
G1 X102.888 Y122.219 E.00063
; WIPE_START
G1 F24000
G1 X102.763 Y122.249 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.018 J1.217 P1  F30000
G1 X104.826 Y122.219 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.125951
G1 F3000
G3 X105.166 Y122.361 I-.053 J.604 E.00254
; WIPE_START
G1 F24000
G1 X105 Y122.26 E-.39576
G1 X104.826 Y122.219 E-.36424
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.389 J1.153 P1  F30000
G1 X106.262 Y122.704 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.136413
G1 F3000
G1 X106.374 Y122.762 E.00096
G1 X106.434 Y122.876 E.00098
; LINE_WIDTH: 0.10292
G1 X106.494 Y122.99 E.00063
; WIPE_START
G1 F24000
G1 X106.434 Y122.876 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.142 J1.209 P1  F30000
G1 X135.218 Y126.248 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.130833
G1 F3000
G1 X135.293 Y126.39 E.00116
; LINE_WIDTH: 0.158746
G1 X135.369 Y126.533 E.00152
; WIPE_START
G1 F24000
G1 X135.293 Y126.39 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.439 J1.135 P1  F30000
G1 X136.533 Y126.87 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.145653
G1 F3000
G2 X136.797 Y126.996 I.328 J-.347 E.00248
; LINE_WIDTH: 0.10292
G1 X136.888 Y127.018 E.00046
; WIPE_START
G1 F24000
G1 X136.797 Y126.996 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.196 J.223 P1  F30000
G1 X139.656 Y142.364 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X109.347 Y142.364 E1.12892
G1 X109.635 Y142.126 E.01392
G1 X110.037 Y141.551 E.02615
G1 X110.283 Y140.903 E.02579
G1 X110.366 Y140.218 E.02572
G1 X110.283 Y139.532 E.02572
G1 X110.037 Y138.885 E.02579
G1 X109.635 Y138.31 E.02615
G1 X109.347 Y138.072 E.01392
G1 X110.001 Y138.075 E.02437
G1 X139.656 Y138.072 E1.10453
G1 X139.369 Y138.311 E.01391
G1 X138.968 Y138.885 E.02609
G1 X138.723 Y139.532 E.02578
G1 X138.639 Y140.218 E.02572
G1 X138.723 Y140.903 E.02571
G1 X138.968 Y141.55 E.02578
G1 X139.369 Y142.125 E.0261
G1 X139.61 Y142.326 E.01168
; WIPE_START
G1 F24000
G1 X137.61 Y142.328 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.116 J-1.211 P1  F30000
G1 X109.84 Y139.679 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
G1 X109.906 Y140.218 E.0202
G1 X109.836 Y140.793 E.02158
G1 X109.63 Y141.335 E.0216
G1 X109.296 Y141.813 E.02172
G1 X108.843 Y142.187 E.02186
G1 X108.308 Y142.411 E.02162
G3 X106.697 Y142.411 I-.806 J-4.545 E.06029
G1 X106.161 Y142.185 E.02169
G1 X105.71 Y141.801 E.02207
G1 X105.399 Y141.297 E.02204
G3 X105.263 Y139.689 I3.586 J-1.113 E.06058
G1 X105.399 Y139.138 E.02112
G1 X105.71 Y138.635 E.02204
G1 X106.161 Y138.25 E.02208
G1 X106.698 Y138.025 E.02168
G1 X107.242 Y137.954 E.02045
G3 X108.308 Y138.024 I.261 J4.152 E.0399
G1 X108.843 Y138.249 E.02163
G1 X109.296 Y138.623 E.02186
G1 X109.63 Y139.1 E.02172
G1 X109.828 Y139.621 E.02075
; WIPE_START
G1 F24000
G1 X109.906 Y140.218 E-.22865
G1 X109.836 Y140.793 E-.22015
G1 X109.63 Y141.335 E-.22042
G1 X109.493 Y141.531 E-.09078
; WIPE_END
M73 P54 R6
G1 E-.04 F1800
G17
G3 Z.6 I.066 J1.215 P1  F30000
G1 X143.738 Y139.672 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X143.733 Y139.69 E.00071
G3 X143.742 Y140.747 I-3.713 J.561 E.03947
G1 X143.606 Y141.297 E.02112
G1 X143.296 Y141.801 E.02204
G1 X142.845 Y142.185 E.02208
G1 X142.308 Y142.411 E.02168
G3 X140.698 Y142.411 I-.805 J-4.527 E.06029
G1 X140.173 Y142.191 E.02118
G3 X139.709 Y141.813 I1.734 J-2.603 E.02233
G1 X139.375 Y141.335 E.02171
G1 X139.17 Y140.793 E.0216
G1 X139.1 Y140.218 E.02158
G1 X139.17 Y139.643 E.02158
G1 X139.375 Y139.101 E.0216
G1 X139.709 Y138.623 E.0217
G1 X140.16 Y138.246 E.02191
G1 X140.699 Y138.025 E.02167
G1 X141.242 Y137.954 E.02041
G3 X142.308 Y138.024 I.261 J4.15 E.03991
G1 X142.845 Y138.25 E.02169
G1 X143.296 Y138.635 E.02207
G1 X143.606 Y139.138 E.02204
G1 X143.724 Y139.614 E.01823
; WIPE_START
G1 F24000
G1 X143.733 Y139.69 E-.02936
G1 X143.775 Y140.218 E-.20103
G1 X143.742 Y140.747 E-.20132
G1 X143.606 Y141.297 E-.21551
G1 X143.451 Y141.55 E-.11277
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.082 J.557 P1  F30000
G1 X144.103 Y142.819 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G2 X141.986 Y142.923 I-.064 J20.174 E.07901
G3 X140.525 Y142.871 I-.448 J-7.948 E.05452
G2 X139.003 Y142.818 I-1.346 J16.678 E.05673
G1 X110.002 Y142.818 E1.08018
G2 X107.986 Y142.923 I.053 J20.389 E.07524
G3 X106.525 Y142.871 I-.448 J-7.948 E.05452
G2 X104.902 Y142.819 I-1.364 J16.99 E.0605
G2 X104.8 Y140.698 I-20.356 J-.083 E.0791
G3 X104.852 Y139.24 I6.957 J-.483 E.05447
G2 X104.902 Y137.617 I-17.655 J-1.359 E.06048
G2 X107.02 Y137.512 I.064 J-20.174 E.07901
G3 X108.481 Y137.564 I.448 J7.948 E.05452
G2 X110.002 Y137.618 I1.346 J-16.678 E.05673
G1 X139.003 Y137.618 E1.08018
G2 X141.02 Y137.512 I-.053 J-20.389 E.07524
G3 X141.986 Y137.512 I.483 J7.424 E.03599
G2 X144.103 Y137.617 I2.053 J-20.069 E.07901
G2 X144.205 Y139.737 I20.356 J.083 E.0791
G1 X144.231 Y140.218 E.01792
G3 X144.118 Y141.706 I-68.655 J-4.467 E.05559
M73 P54 R5
G2 X144.103 Y142.759 I24.626 J.876 E.03922
G1 X143.876 Y142.23 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.293627
G1 F3000
G1 X142.971 Y142.498 E.01929
; LINE_WIDTH: 0.259695
G1 X142.846 Y142.528 E.00227
; LINE_WIDTH: 0.220501
G1 X142.721 Y142.558 E.00186
; LINE_WIDTH: 0.181308
G1 X142.596 Y142.588 E.00145
; LINE_WIDTH: 0.142114
G1 X142.471 Y142.618 E.00104
G1 X142.633 Y142.631 F30000
; LINE_WIDTH: 0.613461
G1 F3000
G1 X143.878 Y142.162 E.06183
G1 X143.456 Y142.593 F30000
; LINE_WIDTH: 0.510272
G1 F3000
G1 X143.682 Y142.008 E.02388
; LINE_WIDTH: 0.484173
G1 X143.909 Y141.424 E.02254
; WIPE_START
G1 F24000
G1 X143.682 Y142.008 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.214 J.092 P1  F30000
G1 X143.909 Y139.012 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.484164
G1 F3000
G1 X143.682 Y138.427 E.02254
; LINE_WIDTH: 0.510253
G1 X143.456 Y137.843 E.02388
G1 X142.633 Y137.805 F30000
; LINE_WIDTH: 0.613448
G1 F3000
G1 X143.878 Y138.273 E.06184
G1 X143.876 Y138.206 F30000
; LINE_WIDTH: 0.293749
G1 F3000
G1 X142.971 Y137.938 E.0193
; LINE_WIDTH: 0.259681
G1 X142.846 Y137.908 E.00226
; LINE_WIDTH: 0.220491
G1 X142.722 Y137.878 E.00186
; LINE_WIDTH: 0.181301
G1 X142.597 Y137.848 E.00145
; LINE_WIDTH: 0.14211
G1 X142.472 Y137.818 E.00104
; WIPE_START
G1 F24000
G1 X142.597 Y137.848 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.018 J-1.217 P1  F30000
G1 X140.533 Y137.818 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.128236
G1 F3000
G2 X140.184 Y137.962 I.048 J.613 E.00266
; WIPE_START
G1 F24000
G1 X140.35 Y137.861 E-.38607
G1 X140.533 Y137.818 E-.37393
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.37 J-1.159 P1  F30000
G1 X139.015 Y138.303 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.158791
G1 F3000
G1 X138.94 Y138.446 E.00152
; LINE_WIDTH: 0.130856
G1 X138.865 Y138.589 E.00116
G1 X138.687 Y139.112 F30000
; FEATURE: Bottom surface
; LINE_WIDTH: 0.503212
G1 F6300
G1 X138.035 Y138.46 E.03458
G1 X137.384 Y138.46 E.02441
G1 X138.348 Y139.425 E.05115
G1 X138.274 Y140.002 E.02183
G1 X136.733 Y138.461 E.08177
G1 X136.082 Y138.461 E.02441
G1 X138.305 Y140.683 E.1179
G1 X138.343 Y140.997 E.01185
G1 X138.56 Y141.569 E.02295
G1 X138.546 Y141.576 E.00057
G1 X135.431 Y138.461 E.16525
G1 X134.78 Y138.461 E.02441
G1 X138.295 Y141.975 E.18644
G1 X137.644 Y141.975 E.02442
G1 X134.129 Y138.461 E.18643
G1 X133.478 Y138.461 E.02441
G1 X136.993 Y141.975 E.18643
G1 X136.342 Y141.975 E.02442
G1 X132.827 Y138.461 E.18643
M73 P55 R5
G1 X132.177 Y138.461 E.02441
G1 X135.691 Y141.975 E.18642
G1 X135.04 Y141.975 E.02442
G1 X131.526 Y138.461 E.18642
G1 X130.875 Y138.461 E.02441
G1 X134.389 Y141.975 E.18641
G1 X133.738 Y141.975 E.02442
G1 X130.224 Y138.461 E.18641
G1 X129.573 Y138.461 E.02441
G1 X133.087 Y141.975 E.18641
G1 X132.436 Y141.975 E.02442
G1 X128.922 Y138.461 E.1864
G1 X128.271 Y138.461 E.02441
G1 X131.785 Y141.975 E.1864
G1 X131.134 Y141.975 E.02442
G1 X127.62 Y138.461 E.1864
G1 X126.969 Y138.462 E.02441
G1 X130.483 Y141.975 E.18639
G1 X129.832 Y141.975 E.02442
G1 X126.319 Y138.462 E.18639
G1 X125.668 Y138.462 E.02441
G1 X129.182 Y141.975 E.18639
G1 X128.531 Y141.975 E.02442
G1 X125.017 Y138.462 E.18638
G1 X124.366 Y138.462 E.02441
G1 X127.88 Y141.975 E.18638
G1 X127.229 Y141.975 E.02442
G1 X123.715 Y138.462 E.18638
G1 X123.064 Y138.462 E.02441
G1 X126.578 Y141.975 E.18637
G1 X125.927 Y141.975 E.02442
G1 X122.413 Y138.462 E.18637
G1 X121.762 Y138.462 E.02441
G1 X125.276 Y141.975 E.18637
G1 X124.625 Y141.975 E.02442
G1 X121.112 Y138.462 E.18636
G1 X120.461 Y138.462 E.02441
G1 X123.974 Y141.975 E.18636
G1 X123.323 Y141.975 E.02442
G1 X119.81 Y138.462 E.18635
G1 X119.159 Y138.462 E.02441
G1 X122.672 Y141.975 E.18635
G1 X122.021 Y141.975 E.02442
G1 X118.508 Y138.462 E.18635
G1 X117.857 Y138.462 E.02441
G1 X121.37 Y141.975 E.18634
G1 X120.719 Y141.975 E.02442
G1 X117.206 Y138.463 E.18634
G1 X116.555 Y138.463 E.02441
G1 X120.068 Y141.975 E.18634
G1 X119.417 Y141.975 E.02442
G1 X115.904 Y138.463 E.18633
G1 X115.254 Y138.463 E.02441
G1 X118.766 Y141.975 E.18633
G1 X118.115 Y141.975 E.02442
G1 X114.603 Y138.463 E.18633
G1 X113.952 Y138.463 E.02441
G1 X117.464 Y141.975 E.18632
G1 X116.813 Y141.975 E.02442
G1 X113.301 Y138.463 E.18632
G1 X112.65 Y138.463 E.02441
G1 X116.162 Y141.975 E.18632
G1 X115.512 Y141.975 E.02442
G1 X111.999 Y138.463 E.18631
G1 X111.348 Y138.463 E.02441
G1 X114.861 Y141.975 E.18631
G1 X114.21 Y141.975 E.02442
G1 X110.697 Y138.463 E.18631
G1 X110.591 Y138.463 E.00399
G1 X110.712 Y138.727 E.01086
G1 X110.449 Y138.866 E.01115
G1 X113.559 Y141.975 E.16496
G1 X112.908 Y141.975 E.02442
G1 X110.703 Y139.771 E.11694
G1 X110.757 Y140.218 E.01689
G1 X110.729 Y140.448 E.0087
G1 X112.257 Y141.975 E.08101
G1 X111.606 Y141.975 E.02442
G1 X110.653 Y141.023 E.05054
G1 X110.474 Y141.494 E.01893
G1 X111.161 Y142.181 E.03642
; WIPE_START
G1 F24000
G1 X110.474 Y141.494 E-.369
G1 X110.653 Y141.023 E-.19177
G1 X111.024 Y141.393 E-.19923
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.556 J-1.083 P1  F30000
G1 X110.141 Y141.847 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.10292
G1 F3000
G1 X110.065 Y141.99 E.00079
; LINE_WIDTH: 0.13101
G1 X109.99 Y142.133 E.00116
; WIPE_START
G1 F24000
G1 X110.065 Y141.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.44 J-1.135 P1  F30000
G1 X108.813 Y142.475 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.126117
G1 F3000
G3 X108.471 Y142.618 I-.394 J-.464 E.00255
; WIPE_START
M73 P56 R5
G1 F24000
G1 X108.646 Y142.576 E-.36508
G1 X108.813 Y142.475 E-.39492
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.076 J-1.215 P1  F30000
G1 X106.533 Y142.617 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.10292
G1 F3000
G1 X106.409 Y142.588 E.00063
; LINE_WIDTH: 0.14211
G1 X106.284 Y142.558 E.00104
; LINE_WIDTH: 0.1813
G1 X106.159 Y142.528 E.00145
; LINE_WIDTH: 0.221987
G1 X106.03 Y142.496 E.00195
; LINE_WIDTH: 0.274239
G1 X105.129 Y142.23 E.0177
G1 X105.128 Y142.162 F30000
; LINE_WIDTH: 0.608545
G1 F3000
G1 X106.372 Y142.631 E.06129
G1 X105.549 Y142.593 F30000
; LINE_WIDTH: 0.536341
G1 F3000
G1 X105.323 Y142.008 E.02521
; LINE_WIDTH: 0.510253
G1 X105.097 Y141.423 E.02388
; WIPE_START
G1 F24000
G1 X105.323 Y142.008 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.214 J-.092 P1  F30000
G1 X105.097 Y139.012 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.510273
G1 F3000
G1 X105.323 Y138.427 E.02388
; LINE_WIDTH: 0.53637
G1 X105.549 Y137.843 E.02521
G1 X106.372 Y137.805 F30000
; LINE_WIDTH: 0.60856
G1 F3000
G1 X105.128 Y138.273 E.0613
G1 X105.129 Y138.206 F30000
; LINE_WIDTH: 0.274102
G1 F3000
G1 X106.03 Y137.939 E.01769
; LINE_WIDTH: 0.221994
G1 X106.16 Y137.908 E.00195
; LINE_WIDTH: 0.181308
G1 X106.285 Y137.878 E.00145
; LINE_WIDTH: 0.142114
G1 X106.41 Y137.848 E.00104
; LINE_WIDTH: 0.102921
G1 X106.535 Y137.818 E.00063
; WIPE_START
G1 F24000
G1 X106.41 Y137.848 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.018 J1.217 P1  F30000
G1 X108.473 Y137.818 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.125951
G1 F3000
G3 X108.813 Y137.96 I-.053 J.604 E.00254
; WIPE_START
G1 F24000
G1 X108.647 Y137.86 E-.39576
G1 X108.473 Y137.818 E-.36424
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.389 J1.153 P1  F30000
G1 X109.909 Y138.303 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.136413
G1 F3000
G1 X110.021 Y138.361 E.00096
G1 X110.081 Y138.475 E.00098
; LINE_WIDTH: 0.10292
G1 X110.141 Y138.589 E.00063
; WIPE_START
G1 F24000
G1 X110.081 Y138.475 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.142 J1.209 P1  F30000
G1 X138.865 Y141.847 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.130833
G1 F3000
G1 X138.94 Y141.99 E.00116
; LINE_WIDTH: 0.158746
G1 X139.015 Y142.133 E.00152
; WIPE_START
G1 F24000
G1 X138.94 Y141.99 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.439 J1.135 P1  F30000
G1 X140.18 Y142.469 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.145653
G1 F3000
G2 X140.443 Y142.596 I.328 J-.347 E.00248
; LINE_WIDTH: 0.10292
G1 X140.534 Y142.618 E.00046
M106 S244.8
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X140.443 Y142.596 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/15
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
G3 Z.6 I1.216 J.044 P1  F30000
G1 X142.056 Y97.699 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X142.03 Y97.914 E.00718
G1 X108.673 Y97.914 E1.1065
G1 X108.647 Y97.699 E.00718
G1 X109.134 Y97.579 E.01663
G1 X109.605 Y97.332 E.01765
G1 X110.003 Y96.979 E.01764
G1 X110.305 Y96.541 E.01765
G1 X110.494 Y96.044 E.01764
G1 X110.558 Y95.516 E.01765
G1 X110.494 Y94.988 E.01765
G1 X110.305 Y94.49 E.01764
G1 X110.003 Y94.053 E.01765
G1 X109.605 Y93.7 E.01765
G1 X109.134 Y93.453 E.01764
G1 X108.647 Y93.333 E.01663
G1 X108.673 Y93.118 E.00718
G1 X142.03 Y93.118 E1.1065
G1 X142.056 Y93.333 E.00718
G1 X141.569 Y93.453 E.01663
G1 X141.098 Y93.7 E.01765
G1 X140.7 Y94.053 E.01765
G1 X140.398 Y94.49 E.01764
G1 X140.209 Y94.988 E.01765
G1 X140.145 Y95.516 E.01764
G1 X140.209 Y96.044 E.01765
G1 X140.398 Y96.541 E.01765
G1 X140.7 Y96.979 E.01764
G1 X141.098 Y97.332 E.01765
G1 X141.569 Y97.579 E.01765
G1 X141.998 Y97.685 E.01464
; WIPE_START
G1 F24000
G1 X142.03 Y97.914 E-.08794
G1 X140.261 Y97.914 E-.67206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.469 J1.123 P1  F30000
G1 X143.942 Y96.378 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.708 Y96.717 E.01266
G1 X143.381 Y97.007 E.01342
G1 X142.994 Y97.21 E.01342
G1 X142.57 Y97.314 E.01342
G1 X142.133 Y97.314 E.01342
G1 X141.709 Y97.21 E.01342
G1 X141.322 Y97.007 E.01342
G1 X140.996 Y96.717 E.01342
G1 X140.748 Y96.358 E.01342
M73 P57 R5
G1 X140.593 Y95.949 E.01342
G1 X140.54 Y95.516 E.01342
G1 X140.593 Y95.082 E.01342
G1 X140.748 Y94.674 E.01342
G1 X140.996 Y94.315 E.01342
G1 X141.322 Y94.025 E.01342
G1 X141.709 Y93.822 E.01342
G1 X142.133 Y93.717 E.01342
G1 X142.57 Y93.717 E.01342
G1 X142.994 Y93.822 E.01342
G1 X143.381 Y94.025 E.01342
G1 X143.708 Y94.315 E.01342
G1 X143.759 Y94.388 E.00276
G1 X143.956 Y94.674 E.01066
G1 X144.11 Y95.082 E.01342
G1 X144.163 Y95.516 E.01342
G1 X144.11 Y95.949 E.01342
G1 X143.968 Y96.325 E.01233
M204 S10000
; WIPE_START
G1 F24000
G1 X143.708 Y96.717 E-.17902
G1 X143.381 Y97.007 E-.16595
G1 X142.994 Y97.21 E-.16595
G1 X142.57 Y97.314 E-.16595
G1 X142.351 Y97.314 E-.08312
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.807 J.911 P1  F30000
G1 X144.749 Y95.188 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X144.52 Y95.202 E.00763
G1 X144.494 Y94.988 E.00717
G1 X144.305 Y94.49 E.01765
G1 X144.003 Y94.053 E.01764
G1 X143.605 Y93.7 E.01765
G1 X143.134 Y93.453 E.01764
G1 X142.647 Y93.333 E.01663
G1 X142.673 Y93.118 E.00718
G1 X144.749 Y93.118 E.06887
G1 X144.749 Y95.128 E.06669
; WIPE_START
G1 F24000
G1 X144.52 Y95.202 E-.09162
G1 X144.494 Y94.988 E-.08209
G1 X144.305 Y94.49 E-.20213
G1 X144.003 Y94.053 E-.20213
G1 X143.645 Y93.735 E-.18202
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.177 J.311 P1  F30000
G1 X144.749 Y97.914 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15476.087
G1 X142.673 Y97.914 E.06887
G1 X142.647 Y97.699 E.00718
G1 X143.134 Y97.579 E.01663
G1 X143.605 Y97.332 E.01765
G1 X144.003 Y96.979 E.01764
G1 X144.305 Y96.541 E.01764
G1 X144.494 Y96.044 E.01765
G1 X144.52 Y95.829 E.00717
G1 X144.749 Y95.843 E.00763
G1 X144.749 Y97.854 E.06669
; WIPE_START
G1 F24000
G1 X142.75 Y97.911 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.09 J-1.214 P1  F30000
G1 X106.183 Y95.202 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15476.087
G1 X105.954 Y95.188 E.00763
G1 X105.954 Y93.118 E.06868
G1 X108.03 Y93.118 E.06887
G1 X108.056 Y93.333 E.00718
G1 X107.569 Y93.453 E.01663
G1 X107.098 Y93.7 E.01765
G1 X106.7 Y94.053 E.01764
G1 X106.398 Y94.49 E.01765
G1 X106.258 Y94.859 E.01309
G2 X106.184 Y95.142 I.658 J.323 E.00977
; WIPE_START
G1 F24000
G1 X105.954 Y95.188 E-.08926
G1 X105.954 Y93.423 E-.67074
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.14 J.427 P1  F30000
G1 X107.284 Y96.972 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.255 Y96.947 E.00117
G1 X106.996 Y96.717 E.01066
G1 X106.748 Y96.358 E.01342
G1 X106.593 Y95.949 E.01342
G1 X106.54 Y95.516 E.01342
G1 X106.593 Y95.082 E.01342
G1 X106.748 Y94.674 E.01342
G1 X106.996 Y94.315 E.01342
G1 X107.322 Y94.025 E.01342
G1 X107.709 Y93.822 E.01342
G1 X108.133 Y93.717 E.01342
G1 X108.57 Y93.717 E.01342
G1 X108.994 Y93.822 E.01342
G1 X109.381 Y94.025 E.01342
G1 X109.708 Y94.315 E.01342
G1 X109.956 Y94.674 E.01342
G1 X110.11 Y95.082 E.01342
G1 X110.163 Y95.516 E.01342
G1 X110.11 Y95.949 E.01342
G1 X109.956 Y96.358 E.01342
G1 X109.708 Y96.717 E.01342
G1 X109.381 Y97.007 E.01342
G1 X108.994 Y97.21 E.01342
G1 X108.57 Y97.314 E.01342
G1 X108.133 Y97.314 E.01342
G1 X107.709 Y97.21 E.01342
G1 X107.33 Y97.011 E.01316
M204 S10000
G1 X106.995 Y97.241 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.098 Y97.332 E.00456
G1 X107.569 Y97.579 E.01764
G1 X108.056 Y97.699 E.01663
G1 X108.03 Y97.914 E.00718
G1 X105.954 Y97.914 E.06887
G1 X105.954 Y95.843 E.06868
G1 X106.183 Y95.829 E.00763
G1 X106.209 Y96.044 E.00717
G1 X106.398 Y96.541 E.01765
G1 X106.7 Y96.979 E.01764
G1 X106.95 Y97.201 E.0111
; WIPE_START
G1 F24000
G1 X107.098 Y97.332 E-.07501
G1 X107.569 Y97.579 E-.20213
G1 X108.056 Y97.699 E-.19055
G1 X108.03 Y97.914 E-.08223
G1 X107.477 Y97.914 E-.21008
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.013 J1.217 P1  F30000
G1 X145.142 Y98.306 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X105.562 Y98.306 E1.21618
G1 X105.562 Y92.726 E.17146
G1 X145.142 Y92.726 E1.21618
G1 X145.142 Y98.246 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X143.142 Y98.249 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.652 J1.027 P1  F30000
G1 X144.546 Y97.357 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.282816
G1 F15000
G1 X143.418 Y97.71 E.02311
G1 X144.152 Y97.71 F30000
; LINE_WIDTH: 0.511104
G1 F13456.257
G1 X144.546 Y96.675 E.04224
G1 X144.946 Y95.516 F30000
; LINE_WIDTH: 0.311993
G1 F15000
G1 X144.475 Y95.516 E.01032
; LINE_WIDTH: 0.271404
G1 X144.354 Y95.409 E.00301
G1 X144.546 Y94.356 F30000
; LINE_WIDTH: 0.470055
G1 F14749.438
G1 X144.152 Y93.321 E.03854
G1 X144.546 Y93.674 F30000
; LINE_WIDTH: 0.282811
G1 F15000
G1 X143.418 Y93.321 E.02311
G1 X142.352 Y92.922 F30000
; LINE_WIDTH: 0.305086
G1 F15000
G1 X142.352 Y93.222 E.0064
; LINE_WIDTH: 0.25884
G1 X142.352 Y93.521 E.00527
G1 X141.298 Y93.342 F30000
; LINE_WIDTH: 0.108848
G1 F15000
G2 X141.144 Y93.419 I.025 J.242 E.00095
G1 X138.63 Y95.357 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X138.7 Y94.78 E.01786
G1 X138.734 Y94.641 E.00438
G1 X111.969 Y94.641 E.82241
G1 X112.073 Y95.357 E.02222
G3 X111.969 Y96.39 I-5.058 J.012 E.03198
G1 X138.734 Y96.39 E.82241
G1 X138.63 Y95.675 E.02222
G1 X138.63 Y95.417 E.00793
G1 X112.794 Y95.67 F30000
; LINE_WIDTH: 0.351909
G1 F15000
G1 X137.909 Y95.67 E.63238
G1 X137.909 Y95.361 E.00778
G1 X112.794 Y95.361 E.63238
G1 X112.794 Y95.61 E.00627
G1 X112.46 Y95.516 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X112.412 Y96.013 E.01536
G1 X138.291 Y96.013 E.79519
G1 X138.243 Y95.516 E.01536
G1 X138.291 Y95.018 E.01536
G1 X112.412 Y95.018 E.79519
G1 X112.454 Y95.456 E.01351
G1 X111.699 Y95.402 F30000
G1 F15000
G1 X111.629 Y96.207 E.02481
G1 X111.445 Y96.767 E.01813
G1 X139.258 Y96.767 E.85459
G1 X139.074 Y96.207 E.01813
G1 X139.004 Y95.629 E.01786
G1 X139.074 Y94.825 E.02481
G1 X139.258 Y94.264 E.01813
G1 X111.445 Y94.264 E.85459
G1 X111.629 Y94.825 E.01813
G1 X111.692 Y95.343 E.01602
G1 X111.325 Y95.448 F30000
G1 F15000
G1 X111.255 Y96.161 E.02203
G1 X111.016 Y96.837 E.02203
G1 X110.823 Y97.145 E.01114
G1 X139.88 Y97.145 E.89282
G1 X139.687 Y96.837 E.01114
G1 X139.481 Y96.293 E.01786
G1 X139.379 Y95.584 E.02203
G1 X139.449 Y94.871 E.02203
G1 X139.687 Y94.195 E.02203
G1 X139.88 Y93.887 E.01114
G1 X110.823 Y93.887 E.89282
G1 X111.016 Y94.195 E.01114
G1 X111.222 Y94.738 E.01786
G1 X111.316 Y95.388 E.02018
G1 X110.95 Y95.493 F30000
G1 F15000
G1 X110.88 Y96.116 E.01925
G1 X110.663 Y96.703 E.01925
G1 X110.312 Y97.222 E.01925
G1 X109.982 Y97.522 E.01369
G1 X140.721 Y97.522 E.94453
G1 X140.391 Y97.222 E.01369
G1 X140.061 Y96.744 E.01786
G1 X139.834 Y96.16 E.01925
G1 X139.753 Y95.539 E.01925
G1 X139.823 Y94.916 E.01925
G1 X140.04 Y94.328 E.01925
G1 X140.391 Y93.81 E.01925
G1 X140.721 Y93.51 E.01369
G1 X109.982 Y93.51 E.94453
G1 X110.312 Y93.81 E.01369
G1 X110.642 Y94.288 E.01786
G1 X110.869 Y94.872 E.01925
G1 X110.943 Y95.434 E.01741
G1 X109.559 Y93.419 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104411
G1 F15000
G2 X109.405 Y93.342 I-.179 J.165 E.00088
G1 X108.352 Y93.521 F30000
; LINE_WIDTH: 0.258834
G1 F15000
G1 X108.352 Y93.222 E.00527
; LINE_WIDTH: 0.305081
G1 X108.352 Y92.922 E.0064
G1 X107.285 Y93.321 F30000
; LINE_WIDTH: 0.265396
G1 F15000
G1 X106.157 Y93.674 E.02143
G1 X106.551 Y93.321 F30000
; LINE_WIDTH: 0.511107
G1 F13456.171
G1 X106.157 Y94.356 E.04224
G1 X106.157 Y96.675 F30000
; LINE_WIDTH: 0.511104
G1 F13456.249
G1 X106.551 Y97.71 E.04224
G1 X106.157 Y97.357 F30000
; LINE_WIDTH: 0.265388
G1 F15000
G1 X107.286 Y97.71 E.02143
G1 X108.352 Y98.11 F30000
; LINE_WIDTH: 0.305084
G1 F15000
G1 X108.352 Y97.81 E.0064
; LINE_WIDTH: 0.258838
G1 X108.352 Y97.51 E.00527
G1 X109.405 Y97.69 F30000
; LINE_WIDTH: 0.104411
G1 F15000
G2 X109.559 Y97.612 I-.025 J-.242 E.00088
G1 X141.144 Y97.612 F30000
; LINE_WIDTH: 0.108847
G1 F15000
G2 X141.298 Y97.69 I.179 J-.165 E.00095
G1 X142.352 Y97.51 F30000
; LINE_WIDTH: 0.258838
G1 F15000
G1 X142.352 Y97.81 E.00527
; LINE_WIDTH: 0.305084
G1 X142.352 Y98.11 E.0064
; WIPE_START
G1 F24000
G1 X142.352 Y97.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.216 J.04 P1  F30000
G1 X142.722 Y109.211 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X142.696 Y109.426 E.00718
G1 X109.339 Y109.426 E1.1065
G1 X109.313 Y109.211 E.00718
G1 X109.8 Y109.091 E.01663
G1 X110.271 Y108.844 E.01765
G1 X110.669 Y108.491 E.01764
G1 X110.971 Y108.053 E.01765
G1 X111.16 Y107.556 E.01764
G1 X111.224 Y107.028 E.01765
G1 X111.16 Y106.5 E.01765
G1 X110.971 Y106.002 E.01764
G1 X110.669 Y105.565 E.01765
G1 X110.271 Y105.212 E.01765
G1 X109.8 Y104.965 E.01764
G1 X109.313 Y104.845 E.01663
G1 X109.339 Y104.63 E.00718
G1 X142.696 Y104.63 E1.1065
G1 X142.722 Y104.845 E.00718
G1 X142.235 Y104.965 E.01663
G1 X141.764 Y105.212 E.01765
G1 X141.366 Y105.565 E.01765
G1 X141.064 Y106.002 E.01764
G1 X140.875 Y106.5 E.01765
G1 X140.811 Y107.028 E.01764
G1 X140.875 Y107.556 E.01765
G1 X141.064 Y108.053 E.01765
G1 X141.366 Y108.491 E.01764
G1 X141.764 Y108.844 E.01765
G1 X142.235 Y109.091 E.01765
G1 X142.664 Y109.197 E.01464
; WIPE_START
G1 F24000
G1 X142.696 Y109.426 E-.08794
G1 X140.927 Y109.426 E-.67206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.469 J1.123 P1  F30000
G1 X144.608 Y107.89 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.374 Y108.229 E.01266
G1 X144.047 Y108.519 E.01342
G1 X143.66 Y108.722 E.01342
G1 X143.236 Y108.826 E.01342
G1 X142.799 Y108.826 E.01342
G1 X142.375 Y108.722 E.01342
G1 X141.989 Y108.519 E.01342
G1 X141.662 Y108.229 E.01342
G1 X141.414 Y107.87 E.01342
G1 X141.259 Y107.461 E.01342
G1 X141.206 Y107.028 E.01342
G1 X141.259 Y106.594 E.01342
G1 X141.414 Y106.186 E.01342
G1 X141.662 Y105.827 E.01342
G1 X141.989 Y105.537 E.01342
G1 X142.375 Y105.334 E.01342
G1 X142.799 Y105.23 E.01342
G1 X143.236 Y105.23 E.01342
G1 X143.66 Y105.334 E.01342
G1 X144.047 Y105.537 E.01342
G1 X144.374 Y105.827 E.01342
G1 X144.425 Y105.9 E.00276
G1 X144.622 Y106.186 E.01066
G1 X144.777 Y106.594 E.01342
G1 X144.829 Y107.028 E.01342
G1 X144.777 Y107.461 E.01342
G1 X144.634 Y107.837 E.01233
M204 S10000
; WIPE_START
G1 F24000
G1 X144.374 Y108.229 E-.17902
G1 X144.047 Y108.519 E-.16595
G1 X143.66 Y108.722 E-.16595
G1 X143.236 Y108.826 E-.16595
G1 X143.017 Y108.826 E-.08312
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.807 J.911 P1  F30000
G1 X145.416 Y106.7 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.186 Y106.714 E.00763
G1 X145.16 Y106.5 E.00717
G1 X144.971 Y106.002 E.01765
G1 X144.669 Y105.565 E.01764
G1 X144.271 Y105.212 E.01765
G1 X143.8 Y104.965 E.01764
G1 X143.313 Y104.845 E.01663
G1 X143.339 Y104.63 E.00718
G1 X145.416 Y104.63 E.06887
G1 X145.416 Y106.64 E.06669
; WIPE_START
G1 F24000
G1 X145.186 Y106.714 E-.09162
G1 X145.16 Y106.5 E-.08209
G1 X144.971 Y106.002 E-.20213
G1 X144.669 Y105.565 E-.20213
G1 X144.311 Y105.247 E-.18202
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.177 J.311 P1  F30000
G1 X145.416 Y109.426 Z.8
G1 Z.4
M73 P58 R5
G1 E.8 F1800
G1 F15476.087
G1 X143.339 Y109.426 E.06887
G1 X143.313 Y109.211 E.00718
G1 X143.8 Y109.091 E.01663
G1 X144.271 Y108.844 E.01765
G1 X144.669 Y108.491 E.01764
G1 X144.971 Y108.053 E.01764
G1 X145.16 Y107.556 E.01765
G1 X145.186 Y107.341 E.00717
G1 X145.416 Y107.355 E.00763
G1 X145.416 Y109.366 E.06669
; WIPE_START
G1 F24000
G1 X143.416 Y109.424 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.09 J-1.214 P1  F30000
G1 X106.849 Y106.714 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15476.087
G1 X106.62 Y106.7 E.00763
G1 X106.62 Y104.63 E.06868
G1 X108.696 Y104.63 E.06887
G1 X108.722 Y104.845 E.00718
G1 X108.235 Y104.965 E.01663
G1 X107.764 Y105.212 E.01765
G1 X107.366 Y105.565 E.01764
G1 X107.064 Y106.002 E.01765
G1 X106.924 Y106.371 E.01309
G2 X106.85 Y106.654 I.658 J.323 E.00977
; WIPE_START
G1 F24000
G1 X106.62 Y106.7 E-.08926
G1 X106.62 Y104.935 E-.67074
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.14 J.427 P1  F30000
G1 X107.95 Y108.484 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.921 Y108.459 E.00117
G1 X107.662 Y108.229 E.01066
G1 X107.414 Y107.87 E.01342
G1 X107.259 Y107.461 E.01342
G1 X107.206 Y107.028 E.01342
G1 X107.259 Y106.594 E.01342
G1 X107.414 Y106.186 E.01342
G1 X107.662 Y105.827 E.01342
G1 X107.989 Y105.537 E.01342
G1 X108.375 Y105.334 E.01342
G1 X108.799 Y105.23 E.01342
G1 X109.236 Y105.23 E.01342
G1 X109.66 Y105.334 E.01342
G1 X110.047 Y105.537 E.01342
G1 X110.374 Y105.827 E.01342
G1 X110.622 Y106.186 E.01342
G1 X110.777 Y106.594 E.01342
G1 X110.829 Y107.028 E.01342
G1 X110.777 Y107.461 E.01342
G1 X110.622 Y107.87 E.01342
G1 X110.374 Y108.229 E.01342
G1 X110.047 Y108.519 E.01342
G1 X109.66 Y108.722 E.01342
G1 X109.236 Y108.826 E.01342
G1 X108.799 Y108.826 E.01342
G1 X108.375 Y108.722 E.01342
G1 X107.996 Y108.523 E.01316
M204 S10000
G1 X107.661 Y108.753 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.764 Y108.844 E.00456
G1 X108.235 Y109.091 E.01764
G1 X108.722 Y109.211 E.01663
G1 X108.696 Y109.426 E.00718
G1 X106.62 Y109.426 E.06887
G1 X106.62 Y107.355 E.06868
G1 X106.849 Y107.341 E.00763
G1 X106.875 Y107.556 E.00717
G1 X107.064 Y108.053 E.01765
G1 X107.366 Y108.491 E.01764
G1 X107.616 Y108.713 E.0111
; WIPE_START
G1 F24000
G1 X107.764 Y108.844 E-.07501
G1 X108.235 Y109.091 E-.20213
G1 X108.722 Y109.211 E-.19055
G1 X108.696 Y109.426 E-.08223
G1 X108.143 Y109.426 E-.21008
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.013 J1.217 P1  F30000
G1 X145.808 Y109.818 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.228 Y109.818 E1.21618
G1 X106.228 Y104.238 E.17146
G1 X145.808 Y104.238 E1.21618
G1 X145.808 Y109.758 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X143.808 Y109.761 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.652 J1.027 P1  F30000
G1 X145.212 Y108.869 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.282816
G1 F15000
G1 X144.084 Y109.222 E.02311
G1 X144.818 Y109.222 F30000
; LINE_WIDTH: 0.511104
G1 F13456.257
G1 X145.212 Y108.188 E.04224
G1 X145.612 Y107.028 F30000
; LINE_WIDTH: 0.311993
G1 F15000
G1 X145.141 Y107.028 E.01032
; LINE_WIDTH: 0.271404
G1 X145.02 Y106.921 E.00301
G1 X145.212 Y105.868 F30000
; LINE_WIDTH: 0.470055
G1 F14749.438
G1 X144.818 Y104.833 E.03854
G1 X145.212 Y105.186 F30000
; LINE_WIDTH: 0.282811
G1 F15000
G1 X144.084 Y104.833 E.02311
G1 X143.018 Y104.434 F30000
; LINE_WIDTH: 0.305086
G1 F15000
G1 X143.018 Y104.734 E.0064
; LINE_WIDTH: 0.25884
G1 X143.018 Y105.033 E.00527
G1 X141.964 Y104.854 F30000
; LINE_WIDTH: 0.108848
G1 F15000
G2 X141.81 Y104.931 I.025 J.242 E.00095
G1 X139.296 Y106.869 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X139.366 Y106.292 E.01786
G1 X139.4 Y106.153 E.00438
G1 X112.635 Y106.153 E.82241
G1 X112.739 Y106.869 E.02222
G3 X112.635 Y107.902 I-5.058 J.012 E.03198
G1 X139.4 Y107.902 E.82241
G1 X139.296 Y107.187 E.02222
G1 X139.296 Y106.929 E.00793
G1 X113.46 Y107.182 F30000
; LINE_WIDTH: 0.351909
G1 F15000
G1 X138.576 Y107.182 E.63238
G1 X138.576 Y106.873 E.00778
G1 X113.46 Y106.873 E.63238
G1 X113.46 Y107.122 E.00627
G1 X113.126 Y107.028 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X113.078 Y107.525 E.01536
G1 X138.957 Y107.525 E.79519
G1 X138.909 Y107.028 E.01536
G1 X138.957 Y106.53 E.01536
G1 X113.078 Y106.53 E.79519
G1 X113.12 Y106.968 E.01351
G1 X112.365 Y106.914 F30000
G1 F15000
G1 X112.295 Y107.719 E.02481
G1 X112.111 Y108.28 E.01813
G1 X139.924 Y108.28 E.85459
G1 X139.74 Y107.719 E.01813
G1 X139.67 Y107.141 E.01786
G1 X139.74 Y106.337 E.02481
G1 X139.924 Y105.776 E.01813
G1 X112.111 Y105.776 E.85459
G1 X112.295 Y106.337 E.01813
G1 X112.358 Y106.855 E.01602
G1 X111.991 Y106.96 F30000
G1 F15000
G1 X111.921 Y107.673 E.02203
G1 X111.682 Y108.349 E.02203
G1 X111.49 Y108.657 E.01114
G1 X140.546 Y108.657 E.89282
G1 X140.353 Y108.349 E.01114
G1 X140.147 Y107.806 E.01786
G1 X140.045 Y107.096 E.02203
G1 X140.115 Y106.383 E.02203
G1 X140.353 Y105.707 E.02203
G1 X140.546 Y105.399 E.01114
G1 X111.49 Y105.399 E.89282
G1 X111.682 Y105.707 E.01114
G1 X111.888 Y106.25 E.01786
G1 X111.982 Y106.9 E.02018
G1 X111.616 Y107.005 F30000
G1 F15000
G1 X111.546 Y107.628 E.01925
G1 X111.329 Y108.215 E.01925
G1 X110.978 Y108.734 E.01925
G1 X110.648 Y109.034 E.01369
G1 X141.387 Y109.034 E.94453
G1 X141.057 Y108.734 E.01369
G1 X140.727 Y108.256 E.01786
G1 X140.5 Y107.672 E.01925
G1 X140.419 Y107.051 E.01925
G1 X140.489 Y106.428 E.01925
G1 X140.706 Y105.84 E.01925
G1 X141.057 Y105.322 E.01925
G1 X141.387 Y105.022 E.01369
G1 X110.648 Y105.022 E.94453
G1 X110.978 Y105.322 E.01369
G1 X111.308 Y105.8 E.01786
G1 X111.535 Y106.384 E.01925
G1 X111.609 Y106.946 E.01741
G1 X110.225 Y104.931 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104411
G1 F15000
G2 X110.071 Y104.854 I-.179 J.165 E.00088
G1 X109.018 Y105.033 F30000
; LINE_WIDTH: 0.258834
G1 F15000
G1 X109.018 Y104.734 E.00527
; LINE_WIDTH: 0.305081
G1 X109.018 Y104.434 E.0064
G1 X107.952 Y104.833 F30000
; LINE_WIDTH: 0.265396
G1 F15000
G1 X106.823 Y105.187 E.02143
G1 X107.217 Y104.833 F30000
; LINE_WIDTH: 0.511107
G1 F13456.171
G1 X106.823 Y105.868 E.04224
G1 X106.823 Y108.188 F30000
; LINE_WIDTH: 0.511104
G1 F13456.249
G1 X107.217 Y109.222 E.04224
G1 X106.823 Y108.869 F30000
; LINE_WIDTH: 0.265388
G1 F15000
G1 X107.952 Y109.222 E.02143
G1 X109.018 Y109.622 F30000
; LINE_WIDTH: 0.305084
G1 F15000
G1 X109.018 Y109.322 E.0064
; LINE_WIDTH: 0.258838
G1 X109.018 Y109.022 E.00527
G1 X110.071 Y109.202 F30000
; LINE_WIDTH: 0.104411
G1 F15000
G2 X110.225 Y109.124 I-.025 J-.242 E.00088
G1 X141.81 Y109.124 F30000
; LINE_WIDTH: 0.108847
G1 F15000
G2 X141.964 Y109.202 I.179 J-.165 E.00095
G1 X143.018 Y109.022 F30000
; LINE_WIDTH: 0.258838
G1 F15000
G1 X143.018 Y109.322 E.00527
; LINE_WIDTH: 0.305084
G1 X143.018 Y109.622 E.0064
; WIPE_START
G1 F24000
G1 X143.018 Y109.322 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.089 J-.542 P1  F30000
G1 X136.503 Y122.406 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X136.376 Y122.473 E.00478
G1 X135.905 Y122.89 E.02084
G1 X135.548 Y123.407 E.02084
G1 X135.325 Y123.995 E.02084
G1 X135.25 Y124.618 E.02084
G1 X135.325 Y125.242 E.02084
G1 X135.548 Y125.83 E.02084
G1 X135.905 Y126.347 E.02084
G1 X136.285 Y126.683 E.01682
G2 X136.503 Y126.831 I.408 J-.37 E.00883
G1 X136.457 Y127.016 E.00635
G1 X105.255 Y127.016 E1.03504
G1 X105.209 Y126.831 E.00635
G1 X105.337 Y126.763 E.00478
G1 X105.807 Y126.347 E.02084
G1 X106.164 Y125.83 E.02084
G1 X106.387 Y125.242 E.02084
G1 X106.463 Y124.618 E.02084
G1 X106.387 Y123.995 E.02084
G1 X106.164 Y123.407 E.02084
G1 X105.807 Y122.89 E.02084
G1 X105.337 Y122.473 E.02084
G1 X105.209 Y122.406 E.00478
G1 X105.255 Y122.22 E.00635
G1 X136.457 Y122.22 E1.03504
G1 X136.489 Y122.348 E.00436
; WIPE_START
G1 F24000
G1 X136.376 Y122.473 E-.06419
G1 X135.905 Y122.89 E-.23878
G1 X135.548 Y123.407 E-.23877
G1 X135.345 Y123.944 E-.21825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.038 J1.216 P1  F30000
G1 X140.004 Y124.091 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X140.068 Y124.618 E.01631
G1 X140.003 Y125.148 E.01638
G1 X139.814 Y125.646 E.01638
G1 X139.512 Y126.085 E.01638
G1 X139.112 Y126.438 E.01638
G1 X138.64 Y126.686 E.01638
G1 X138.123 Y126.814 E.01638
G1 X137.59 Y126.814 E.01638
G1 X137.072 Y126.686 E.01638
G1 X136.6 Y126.438 E.01638
G1 X136.545 Y126.39 E.00226
G1 X136.201 Y126.085 E.01412
G1 X135.898 Y125.646 E.01638
G1 X135.709 Y125.148 E.01638
G1 X135.645 Y124.618 E.01638
G1 X135.709 Y124.089 E.01638
G1 X135.898 Y123.591 E.01638
G1 X136.201 Y123.152 E.01638
G1 X136.6 Y122.798 E.01638
G1 X137.072 Y122.551 E.01638
G1 X137.59 Y122.423 E.01638
G1 X138.123 Y122.423 E.01638
G1 X138.64 Y122.551 E.01638
G1 X139.112 Y122.798 E.01638
G1 X139.512 Y123.152 E.01638
G1 X139.814 Y123.591 E.01638
G1 X139.983 Y124.035 E.01461
M204 S10000
G1 X140.083 Y123.289 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.807 Y122.89 E.01608
G1 X139.337 Y122.473 E.02084
G1 X139.209 Y122.406 E.00478
G1 X139.255 Y122.22 E.00635
G1 X140.254 Y122.22 E.03314
G1 X140.254 Y123.235 E.03367
G1 X140.14 Y123.271 E.00397
; WIPE_START
G1 F24000
G1 X139.807 Y122.89 E-.19221
G1 X139.337 Y122.473 E-.23878
G1 X139.209 Y122.406 E-.0548
G1 X139.255 Y122.22 E-.07271
G1 X139.785 Y122.22 E-.2015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.213 J.097 P1  F30000
G1 X140.083 Y125.948 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15476.087
G1 X140.254 Y126.001 E.00596
G1 X140.254 Y127.016 E.03367
G1 X139.255 Y127.016 E.03314
G1 X139.209 Y126.831 E.00635
G1 X139.337 Y126.763 E.00478
G1 X139.807 Y126.347 E.02084
G1 X140.048 Y125.997 E.01409
; WIPE_START
G1 F24000
G1 X140.254 Y126.001 E-.07817
G1 X140.254 Y127.016 E-.38568
G1 X139.475 Y127.016 E-.29616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.106 J-1.212 P1  F30000
G1 X106.005 Y124.104 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.068 Y124.618 E.01593
G1 X106.003 Y125.148 E.01638
G1 X105.814 Y125.646 E.01638
G1 X105.512 Y126.085 E.01638
G1 X105.112 Y126.438 E.01638
G1 X104.64 Y126.686 E.01638
G1 X104.123 Y126.814 E.01638
G1 X103.59 Y126.814 E.01638
G1 X103.072 Y126.686 E.01638
G1 X102.6 Y126.438 E.01638
G1 X102.201 Y126.085 E.01638
G1 X101.898 Y125.646 E.01638
G1 X101.709 Y125.148 E.01638
G1 X101.7 Y125.074 E.00227
G1 X101.645 Y124.618 E.01412
G1 X101.709 Y124.089 E.01638
G1 X101.898 Y123.591 E.01638
G1 X102.201 Y123.152 E.01638
G1 X102.6 Y122.798 E.01638
G1 X103.072 Y122.551 E.01638
G1 X103.59 Y122.423 E.01638
G1 X104.123 Y122.423 E.01638
G1 X104.64 Y122.551 E.01638
G1 X105.112 Y122.798 E.01638
G1 X105.512 Y123.152 E.01638
G1 X105.814 Y123.591 E.01638
G1 X105.987 Y124.047 E.01499
M204 S10000
; WIPE_START
G1 F24000
G1 X106.068 Y124.618 E-.21937
G1 X106.003 Y125.148 E-.2026
G1 X105.814 Y125.646 E-.20259
G1 X105.612 Y125.939 E-.13544
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.914 J-.804 P1  F30000
G1 X102.503 Y122.406 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X102.376 Y122.473 E.00478
G1 X101.905 Y122.89 E.02084
G1 X101.63 Y123.289 E.01608
G1 X101.458 Y123.235 E.00596
G1 X101.458 Y122.22 E.03367
G1 X102.457 Y122.22 E.03314
G1 X102.489 Y122.348 E.00436
; WIPE_START
G1 F24000
G1 X102.376 Y122.473 E-.0642
G1 X101.905 Y122.89 E-.23878
G1 X101.63 Y123.289 E-.18419
G1 X101.458 Y123.235 E-.06829
G1 X101.458 Y122.697 E-.20454
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.18 J.298 P1  F30000
G1 X102.503 Y126.831 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15476.087
G1 X102.457 Y127.016 E.00635
G1 X101.458 Y127.016 E.03314
G1 X101.458 Y126.001 E.03367
G1 X101.63 Y125.948 E.00596
G1 X101.905 Y126.347 E.01608
G1 X102.376 Y126.763 E.02084
G1 X102.45 Y126.803 E.00279
; WIPE_START
G1 F24000
G1 X102.457 Y127.016 E-.08125
G1 X101.458 Y127.016 E-.37968
G1 X101.458 Y126.229 E-.29907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.037 J1.216 P1  F30000
G1 X140.646 Y127.408 Z.8
G1 Z.4
M73 P59 R5
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X101.066 Y127.408 E1.21618
G1 X101.066 Y121.828 E.17146
G1 X140.646 Y121.828 E1.21618
G1 X140.646 Y127.348 E.16961
M204 S10000
G1 X139.886 Y126.813 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151056
G1 F15000
G1 X140.038 Y126.415 E.00375
G1 X140.219 Y125.785 F30000
; LINE_WIDTH: 0.434489
G1 F15000
G1 X140.252 Y125.604 E.00588
; LINE_WIDTH: 0.391801
G1 X140.285 Y125.423 E.00524
; LINE_WIDTH: 0.349113
G1 X140.318 Y125.242 E.00459
; LINE_WIDTH: 0.306426
G1 X140.322 Y125.21 E.00068
; LINE_WIDTH: 0.298796
G1 X140.34 Y124.92 E.00607
; LINE_WIDTH: 0.261158
G2 X140.357 Y124.607 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X140.34 Y124.317 E.0044
; LINE_WIDTH: 0.267101
G2 X140.318 Y123.995 I-2.649 J.015 E.00589
; LINE_WIDTH: 0.306424
G1 X140.285 Y123.814 E.00395
; LINE_WIDTH: 0.349113
G1 X140.252 Y123.633 E.00459
; LINE_WIDTH: 0.391802
G1 X140.219 Y123.452 E.00524
G1 X140.038 Y122.822 F30000
; LINE_WIDTH: 0.14157
G1 F15000
G1 X139.886 Y122.424 E.00342
G1 X139.045 Y122.252 F30000
; LINE_WIDTH: 0.405156
G1 F15000
G1 X138.752 Y122.198 E.00881
; LINE_WIDTH: 0.389444
G1 X138.558 Y122.174 E.00551
; LINE_WIDTH: 0.342433
G1 X138.365 Y122.151 E.00476
; LINE_WIDTH: 0.257331
G2 X138.147 Y122.126 I-.316 J1.798 E.00384
G2 X137.541 Y122.127 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X137.348 Y122.151 E.00327
; LINE_WIDTH: 0.295421
G1 X137.154 Y122.174 E.00401
; LINE_WIDTH: 0.342433
G1 X136.96 Y122.198 E.00476
; LINE_WIDTH: 0.389444
G1 X136.667 Y122.252 E.00842
G1 X136.044 Y122.424 F30000
; LINE_WIDTH: 0.134453
G1 F15000
G1 X135.882 Y122.607 E.00182
; WIPE_START
G1 F24000
G1 X136.044 Y122.424 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.216 J-.047 P1  F30000
G1 X135.882 Y126.63 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.134453
G1 F15000
G1 X136.044 Y126.813 E.00182
G1 X136.667 Y126.985 F30000
; LINE_WIDTH: 0.389444
G1 F15000
G1 X136.96 Y127.039 E.00842
; LINE_WIDTH: 0.342433
G1 X137.154 Y127.063 E.00476
; LINE_WIDTH: 0.295422
G1 X137.348 Y127.086 E.00401
; LINE_WIDTH: 0.24841
G1 X137.541 Y127.11 E.00327
; LINE_WIDTH: 0.257331
G2 X138.147 Y127.111 I.315 J-4.984 E.01058
G2 X138.365 Y127.086 I-.098 J-1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X138.558 Y127.063 E.00476
; LINE_WIDTH: 0.389444
G1 X138.752 Y127.039 E.00551
; LINE_WIDTH: 0.405154
G1 X139.045 Y126.985 E.00881
G1 X107.636 Y126.247 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X134.901 Y126.247 E.83776
G1 X134.597 Y125.492 E.02499
G1 X134.483 Y124.687 E.02499
G1 X134.565 Y123.877 E.02499
G1 X134.838 Y123.111 E.02499
G1 X134.901 Y122.99 E.00419
G1 X106.812 Y122.99 E.8631
G1 X107.115 Y123.745 E.02499
G1 X107.229 Y124.55 E.02499
G1 X107.148 Y125.359 E.02499
G1 X106.875 Y126.126 E.02499
G1 X106.812 Y126.247 E.00419
G1 X107.576 Y126.247 E.0235
G1 X107.604 Y124.505 F30000
G1 F15000
G1 X107.522 Y125.405 E.02777
G1 X107.375 Y125.87 E.01499
G1 X134.338 Y125.87 E.82849
G1 X134.191 Y125.405 E.01499
G1 X134.109 Y124.732 E.02083
G1 X134.191 Y123.832 E.02777
G1 X134.338 Y123.367 E.01499
G1 X107.375 Y123.367 E.82849
G1 X107.522 Y123.832 E.01499
G1 X107.596 Y124.445 E.01898
G1 X107.978 Y124.777 F30000
G1 F15000
G1 X107.886 Y125.493 E.02217
G1 X133.827 Y125.493 E.7971
G1 X133.734 Y124.777 E.02217
G1 X133.734 Y124.459 E.00978
G1 X133.827 Y123.744 E.02217
G1 X107.886 Y123.744 E.7971
G1 X107.978 Y124.459 E.02217
G1 X107.978 Y124.717 E.00793
G1 X108.365 Y124.618 F30000
G1 F15000
G1 X108.317 Y125.116 E.01536
G1 X133.396 Y125.116 E.77061
G1 X133.348 Y124.618 E.01536
G1 X133.396 Y124.121 E.01536
G1 X108.317 Y124.121 E.77061
G1 X108.359 Y124.559 E.01351
G1 X133.014 Y124.464 F30000
; LINE_WIDTH: 0.351909
G1 F15000
G1 X108.698 Y124.464 E.61224
G1 X108.698 Y124.773 E.00778
G1 X133.014 Y124.773 E.61224
G1 X133.014 Y124.524 E.00627
G1 X134.857 Y124.641 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X134.939 Y123.923 E.02221
G1 X135.19 Y123.245 E.02221
G1 X135.498 Y122.79 E.01688
G1 X135.394 Y122.693 E.00435
G1 X135.398 Y122.613 E.00248
G1 X106.304 Y122.613 E.89398
G3 X106.214 Y122.79 I-.163 J.029 E.00653
G1 X106.501 Y123.205 E.01549
G1 X106.762 Y123.879 E.02221
G1 X106.855 Y124.596 E.02221
G1 X106.773 Y125.314 E.02221
G1 X106.522 Y125.992 E.02221
G1 X106.214 Y126.447 E.01688
G1 X106.309 Y126.538 E.00402
G1 X106.304 Y126.624 E.00266
G1 X135.398 Y126.624 E.89398
G3 X135.498 Y126.447 I.168 J-.022 E.00671
G1 X135.212 Y126.032 E.01549
G1 X134.95 Y125.358 E.02221
G1 X134.865 Y124.701 E.02037
G1 X105.83 Y126.63 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969211
G1 F15000
G1 X105.668 Y126.813 E.00107
G1 X105.045 Y126.985 F30000
; LINE_WIDTH: 0.405156
G1 F15000
G1 X104.752 Y127.039 E.00881
; LINE_WIDTH: 0.389444
G1 X104.558 Y127.063 E.00551
; LINE_WIDTH: 0.342433
G1 X104.365 Y127.086 E.00476
; LINE_WIDTH: 0.257331
G3 X104.147 Y127.111 I-.317 J-1.798 E.00384
G3 X103.541 Y127.11 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X103.348 Y127.086 E.00327
; LINE_WIDTH: 0.295422
G1 X103.154 Y127.063 E.00401
; LINE_WIDTH: 0.342433
G1 X102.96 Y127.039 E.00476
; LINE_WIDTH: 0.389442
G1 X102.667 Y126.985 E.00842
G1 X101.826 Y126.813 F30000
; LINE_WIDTH: 0.151054
G1 F15000
G1 X101.675 Y126.415 E.00375
G1 X101.494 Y125.785 F30000
; LINE_WIDTH: 0.391801
G1 F15000
G1 X101.46 Y125.604 E.00524
; LINE_WIDTH: 0.349115
G1 X101.427 Y125.423 E.00459
; LINE_WIDTH: 0.306428
G1 X101.394 Y125.242 E.00395
; LINE_WIDTH: 0.267103
G3 X101.373 Y124.92 I2.629 J-.336 E.00589
; LINE_WIDTH: 0.228538
G1 X101.355 Y124.63 E.0044
; LINE_WIDTH: 0.261158
G3 X101.373 Y124.317 I2.594 J-.011 E.00557
; LINE_WIDTH: 0.298796
G1 X101.39 Y124.026 E.00607
; LINE_WIDTH: 0.306426
G1 X101.394 Y123.995 E.00068
; LINE_WIDTH: 0.349113
G1 X101.427 Y123.814 E.00459
; LINE_WIDTH: 0.391801
G1 X101.46 Y123.633 E.00524
; LINE_WIDTH: 0.434489
G1 X101.494 Y123.452 E.00588
G1 X101.675 Y122.822 F30000
; LINE_WIDTH: 0.151056
G1 F15000
G1 X101.826 Y122.424 E.00375
G1 X102.667 Y122.252 F30000
; LINE_WIDTH: 0.389444
G1 F15000
G1 X102.96 Y122.198 E.00842
; LINE_WIDTH: 0.342433
G1 X103.154 Y122.174 E.00476
; LINE_WIDTH: 0.295421
G1 X103.348 Y122.151 E.00401
; LINE_WIDTH: 0.24841
G1 X103.541 Y122.127 E.00327
; LINE_WIDTH: 0.257331
G3 X104.147 Y122.126 I.315 J4.984 E.01058
G3 X104.365 Y122.151 I-.098 J1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X104.558 Y122.174 E.00476
; LINE_WIDTH: 0.389444
G1 X104.752 Y122.198 E.00551
; LINE_WIDTH: 0.405155
G1 X105.045 Y122.252 E.00881
G1 X105.668 Y122.424 F30000
; LINE_WIDTH: 0.096921
G1 F15000
G1 X105.83 Y122.607 E.00107
; WIPE_START
G1 F24000
G1 X105.668 Y122.424 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.501 J1.109 P1  F30000
G1 X140.15 Y138.006 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X140.022 Y138.073 E.00478
G1 X139.552 Y138.489 E.02084
G1 X139.195 Y139.007 E.02084
G1 X138.972 Y139.594 E.02084
G1 X138.896 Y140.218 E.02084
G1 X138.972 Y140.842 E.02084
G1 X139.195 Y141.429 E.02084
G1 X139.552 Y141.946 E.02084
G1 X139.931 Y142.282 E.01682
G2 X140.15 Y142.43 I.408 J-.37 E.00883
G1 X140.104 Y142.616 E.00635
G1 X108.901 Y142.616 E1.03504
G1 X108.856 Y142.43 E.00635
G1 X108.983 Y142.363 E.00478
G1 X109.454 Y141.946 E.02084
G1 X109.811 Y141.429 E.02084
G1 X110.033 Y140.842 E.02084
G1 X110.109 Y140.218 E.02084
G1 X110.033 Y139.594 E.02084
G1 X109.811 Y139.007 E.02084
G1 X109.454 Y138.489 E.02084
G1 X108.983 Y138.073 E.02084
G1 X108.856 Y138.006 E.00478
G1 X108.901 Y137.82 E.00635
G1 X140.104 Y137.82 E1.03504
G1 X140.135 Y137.947 E.00436
; WIPE_START
G1 F24000
G1 X140.022 Y138.073 E-.06419
G1 X139.552 Y138.489 E-.23878
G1 X139.195 Y139.007 E-.23877
G1 X138.991 Y139.544 E-.21825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.038 J1.216 P1  F30000
G1 X143.65 Y139.691 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.714 Y140.218 E.01631
G1 X143.65 Y140.747 E.01638
G1 X143.461 Y141.246 E.01638
G1 X143.158 Y141.684 E.01638
G1 X142.759 Y142.038 E.01638
G1 X142.287 Y142.286 E.01638
G1 X141.769 Y142.413 E.01638
G1 X141.236 Y142.413 E.01638
G1 X140.719 Y142.286 E.01638
G1 X140.246 Y142.038 E.01638
G1 X140.191 Y141.989 E.00226
G1 X139.847 Y141.684 E.01412
G1 X139.545 Y141.246 E.01638
G1 X139.355 Y140.747 E.01638
G1 X139.291 Y140.218 E.01638
G1 X139.355 Y139.689 E.01638
G1 X139.545 Y139.19 E.01638
G1 X139.847 Y138.751 E.01638
G1 X140.246 Y138.398 E.01638
G1 X140.719 Y138.15 E.01638
G1 X141.236 Y138.022 E.01638
G1 X141.769 Y138.022 E.01638
G1 X142.287 Y138.15 E.01638
G1 X142.759 Y138.398 E.01638
G1 X143.158 Y138.751 E.01638
G1 X143.461 Y139.19 E.01638
G1 X143.63 Y139.635 E.01461
M204 S10000
G1 X143.729 Y138.888 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.454 Y138.489 E.01608
G1 X142.983 Y138.073 E.02084
G1 X142.856 Y138.006 E.00478
G1 X142.901 Y137.82 E.00635
G1 X143.901 Y137.82 E.03314
G1 X143.901 Y138.835 E.03367
G1 X143.786 Y138.87 E.00397
; WIPE_START
G1 F24000
G1 X143.454 Y138.489 E-.19221
G1 X142.983 Y138.073 E-.23878
G1 X142.856 Y138.006 E-.0548
G1 X142.901 Y137.82 E-.07271
G1 X143.432 Y137.82 E-.2015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.213 J.097 P1  F30000
G1 X143.729 Y141.547 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15476.087
G1 X143.901 Y141.601 E.00596
G1 X143.901 Y142.616 E.03367
G1 X142.901 Y142.616 E.03314
G1 X142.856 Y142.43 E.00635
G1 X142.983 Y142.363 E.00478
G1 X143.454 Y141.946 E.02084
G1 X143.695 Y141.597 E.01409
; WIPE_START
G1 F24000
G1 X143.901 Y141.601 E-.07817
G1 X143.901 Y142.616 E-.38568
G1 X143.121 Y142.616 E-.29616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.106 J-1.212 P1  F30000
G1 X109.652 Y139.703 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X109.714 Y140.218 E.01593
G1 X109.65 Y140.747 E.01638
G1 X109.461 Y141.246 E.01638
G1 X109.158 Y141.684 E.01638
G1 X108.759 Y142.038 E.01638
G1 X108.287 Y142.286 E.01638
G1 X107.769 Y142.413 E.01638
G1 X107.236 Y142.413 E.01638
G1 X106.719 Y142.286 E.01638
G1 X106.246 Y142.038 E.01638
G1 X105.847 Y141.684 E.01638
G1 X105.545 Y141.246 E.01638
G1 X105.355 Y140.747 E.01638
G1 X105.347 Y140.674 E.00227
G1 X105.291 Y140.218 E.01412
G1 X105.355 Y139.689 E.01638
G1 X105.545 Y139.19 E.01638
G1 X105.847 Y138.751 E.01638
G1 X106.246 Y138.398 E.01638
G1 X106.719 Y138.15 E.01638
G1 X107.236 Y138.022 E.01638
G1 X107.769 Y138.022 E.01638
G1 X108.287 Y138.15 E.01638
G1 X108.759 Y138.398 E.01638
G1 X109.158 Y138.751 E.01638
G1 X109.461 Y139.19 E.01638
G1 X109.634 Y139.646 E.01499
M204 S10000
; WIPE_START
G1 F24000
G1 X109.714 Y140.218 E-.21937
G1 X109.65 Y140.747 E-.2026
G1 X109.461 Y141.246 E-.20259
G1 X109.258 Y141.539 E-.13544
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.914 J-.804 P1  F30000
G1 X106.15 Y138.006 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X106.022 Y138.073 E.00478
G1 X105.552 Y138.489 E.02084
G1 X105.276 Y138.888 E.01608
G1 X105.105 Y138.835 E.00596
G1 X105.105 Y137.82 E.03367
G1 X106.104 Y137.82 E.03314
G1 X106.135 Y137.947 E.00436
; WIPE_START
G1 F24000
G1 X106.022 Y138.073 E-.0642
G1 X105.552 Y138.489 E-.23878
G1 X105.276 Y138.888 E-.18419
G1 X105.105 Y138.835 E-.06829
G1 X105.105 Y138.297 E-.20454
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.18 J.298 P1  F30000
G1 X106.15 Y142.43 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15476.087
G1 X106.104 Y142.616 E.00635
G1 X105.105 Y142.616 E.03314
G1 X105.105 Y141.601 E.03367
G1 X105.276 Y141.547 E.00596
G1 X105.552 Y141.946 E.01608
G1 X106.022 Y142.363 E.02084
G1 X106.097 Y142.402 E.00279
; WIPE_START
G1 F24000
G1 X106.104 Y142.616 E-.08125
G1 X105.105 Y142.616 E-.37968
G1 X105.105 Y141.829 E-.29907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.037 J1.216 P1  F30000
G1 X144.293 Y143.008 Z.8
G1 Z.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X104.713 Y143.008 E1.21618
G1 X104.713 Y137.428 E.17146
G1 X144.293 Y137.428 E1.21618
G1 X144.293 Y142.948 E.16961
M204 S10000
G1 X143.533 Y142.412 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151056
G1 F15000
G1 X143.684 Y142.015 E.00375
G1 X143.865 Y141.384 F30000
; LINE_WIDTH: 0.434489
G1 F15000
G1 X143.899 Y141.203 E.00588
; LINE_WIDTH: 0.391801
G1 X143.932 Y141.022 E.00524
; LINE_WIDTH: 0.349113
G1 X143.965 Y140.841 E.00459
; LINE_WIDTH: 0.306426
G1 X143.969 Y140.81 E.00068
; LINE_WIDTH: 0.298796
G1 X143.986 Y140.519 E.00607
; LINE_WIDTH: 0.261158
G2 X144.004 Y140.207 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X143.986 Y139.916 E.0044
; LINE_WIDTH: 0.267101
G2 X143.965 Y139.595 I-2.649 J.015 E.00589
; LINE_WIDTH: 0.306424
G1 X143.932 Y139.413 E.00395
; LINE_WIDTH: 0.349113
G1 X143.899 Y139.232 E.00459
; LINE_WIDTH: 0.391802
G1 X143.865 Y139.051 E.00524
G1 X143.684 Y138.421 F30000
; LINE_WIDTH: 0.14157
G1 F15000
G1 X143.533 Y138.023 E.00342
G1 X142.692 Y137.851 F30000
; LINE_WIDTH: 0.405156
G1 F15000
G1 X142.398 Y137.797 E.00881
; LINE_WIDTH: 0.389444
G1 X142.205 Y137.774 E.00551
; LINE_WIDTH: 0.342433
G1 X142.011 Y137.75 E.00476
; LINE_WIDTH: 0.257331
G2 X141.793 Y137.725 I-.316 J1.798 E.00384
G2 X141.188 Y137.727 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X140.994 Y137.75 E.00327
; LINE_WIDTH: 0.295421
G1 X140.801 Y137.774 E.00401
; LINE_WIDTH: 0.342433
G1 X140.607 Y137.797 E.00476
; LINE_WIDTH: 0.389444
G1 X140.314 Y137.851 E.00842
G1 X139.691 Y138.023 F30000
; LINE_WIDTH: 0.134453
G1 F15000
G1 X139.529 Y138.206 E.00182
; WIPE_START
G1 F24000
G1 X139.691 Y138.023 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.216 J-.047 P1  F30000
G1 X139.529 Y142.23 Z.8
G1 Z.4
G1 E.8 F1800
; LINE_WIDTH: 0.134453
G1 F15000
G1 X139.691 Y142.412 E.00182
G1 X140.314 Y142.585 F30000
; LINE_WIDTH: 0.389444
G1 F15000
G1 X140.607 Y142.639 E.00842
; LINE_WIDTH: 0.342433
G1 X140.801 Y142.662 E.00476
; LINE_WIDTH: 0.295422
G1 X140.994 Y142.686 E.00401
; LINE_WIDTH: 0.24841
G1 X141.188 Y142.709 E.00327
; LINE_WIDTH: 0.257331
G2 X141.793 Y142.711 I.315 J-4.984 E.01058
M73 P60 R5
G2 X142.011 Y142.686 I-.098 J-1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X142.205 Y142.662 E.00476
; LINE_WIDTH: 0.389444
G1 X142.398 Y142.639 E.00551
; LINE_WIDTH: 0.405154
G1 X142.692 Y142.585 E.00881
G1 X111.283 Y141.847 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X138.547 Y141.846 E.83776
G1 X138.244 Y141.091 E.02499
G1 X138.13 Y140.286 E.02499
G1 X138.211 Y139.477 E.02499
G1 X138.484 Y138.711 E.02499
G1 X138.547 Y138.59 E.00419
G1 X110.458 Y138.59 E.8631
G1 X110.761 Y139.344 E.02499
G1 X110.876 Y140.15 E.02499
G1 X110.794 Y140.959 E.02499
G1 X110.521 Y141.725 E.02499
G1 X110.458 Y141.846 E.00419
G1 X111.223 Y141.847 E.0235
G1 X111.25 Y140.104 F30000
G1 F15000
G1 X111.168 Y141.004 E.02777
G1 X111.021 Y141.47 E.01499
G1 X137.984 Y141.47 E.82849
G1 X137.837 Y141.004 E.01499
G1 X137.755 Y140.331 E.02083
G1 X137.837 Y139.431 E.02777
G1 X137.984 Y138.966 E.01499
G1 X111.021 Y138.966 E.82849
G1 X111.168 Y139.431 E.01499
G1 X111.243 Y140.045 E.01898
G1 X111.624 Y140.377 F30000
G1 F15000
G1 X111.532 Y141.092 E.02217
G1 X137.473 Y141.092 E.7971
G1 X137.381 Y140.377 E.02217
G1 X137.381 Y140.059 E.00978
G1 X137.473 Y139.343 E.02217
G1 X111.532 Y139.343 E.7971
G1 X111.624 Y140.059 E.02217
G1 X111.624 Y140.317 E.00793
G1 X112.011 Y140.218 F30000
G1 F15000
G1 X111.963 Y140.715 E.01536
G1 X137.042 Y140.715 E.77061
G1 X136.994 Y140.218 E.01536
G1 X137.042 Y139.72 E.01536
G1 X111.963 Y139.72 E.77061
G1 X112.005 Y140.158 E.01351
G1 X136.661 Y140.063 F30000
; LINE_WIDTH: 0.351909
G1 F15000
G1 X112.345 Y140.063 E.61224
G1 X112.345 Y140.372 E.00778
G1 X136.661 Y140.372 E.61224
G1 X136.661 Y140.123 E.00627
G1 X138.504 Y140.241 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X138.586 Y139.522 E.02221
G1 X138.837 Y138.844 E.02221
G1 X139.144 Y138.389 E.01688
G1 X139.041 Y138.293 E.00435
G1 X139.044 Y138.212 E.00248
G1 X109.95 Y138.212 E.89398
G3 X109.861 Y138.389 I-.163 J.029 E.00653
G1 X110.147 Y138.804 E.01549
G1 X110.409 Y139.478 E.02221
G1 X110.501 Y140.195 E.02221
G1 X110.42 Y140.913 E.02221
G1 X110.169 Y141.591 E.02221
G1 X109.861 Y142.046 E.01688
G1 X109.955 Y142.137 E.00402
G1 X109.95 Y142.224 E.00266
G1 X139.044 Y142.224 E.89398
G3 X139.144 Y142.046 I.168 J-.022 E.00671
G1 X138.858 Y141.632 E.01549
G1 X138.597 Y140.958 E.02221
G1 X138.512 Y140.3 E.02037
G1 X109.477 Y142.23 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969211
G1 F15000
G1 X109.315 Y142.412 E.00107
G1 X108.692 Y142.585 F30000
; LINE_WIDTH: 0.405156
G1 F15000
G1 X108.398 Y142.639 E.00881
; LINE_WIDTH: 0.389444
G1 X108.205 Y142.662 E.00551
; LINE_WIDTH: 0.342433
G1 X108.011 Y142.686 E.00476
; LINE_WIDTH: 0.257331
G3 X107.793 Y142.711 I-.317 J-1.798 E.00384
G3 X107.188 Y142.709 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X106.994 Y142.686 E.00327
; LINE_WIDTH: 0.295422
G1 X106.801 Y142.662 E.00401
; LINE_WIDTH: 0.342433
G1 X106.607 Y142.639 E.00476
; LINE_WIDTH: 0.389442
G1 X106.314 Y142.585 E.00842
G1 X105.473 Y142.412 F30000
; LINE_WIDTH: 0.151054
G1 F15000
G1 X105.321 Y142.015 E.00375
G1 X105.14 Y141.384 F30000
; LINE_WIDTH: 0.391801
G1 F15000
G1 X105.107 Y141.203 E.00524
; LINE_WIDTH: 0.349115
G1 X105.074 Y141.022 E.00459
; LINE_WIDTH: 0.306428
G1 X105.041 Y140.841 E.00395
; LINE_WIDTH: 0.267103
G3 X105.019 Y140.519 I2.629 J-.336 E.00589
; LINE_WIDTH: 0.228538
G1 X105.002 Y140.229 E.0044
; LINE_WIDTH: 0.261158
G3 X105.019 Y139.916 I2.594 J-.011 E.00557
; LINE_WIDTH: 0.298796
G1 X105.037 Y139.626 E.00607
; LINE_WIDTH: 0.306426
G1 X105.041 Y139.595 E.00068
; LINE_WIDTH: 0.349113
G1 X105.074 Y139.413 E.00459
; LINE_WIDTH: 0.391801
G1 X105.107 Y139.232 E.00524
; LINE_WIDTH: 0.434489
G1 X105.14 Y139.051 E.00588
G1 X105.321 Y138.421 F30000
; LINE_WIDTH: 0.151056
G1 F15000
G1 X105.473 Y138.023 E.00375
G1 X106.314 Y137.851 F30000
; LINE_WIDTH: 0.389444
G1 F15000
G1 X106.607 Y137.797 E.00842
; LINE_WIDTH: 0.342433
G1 X106.801 Y137.774 E.00476
; LINE_WIDTH: 0.295421
G1 X106.994 Y137.75 E.00401
; LINE_WIDTH: 0.24841
G1 X107.188 Y137.727 E.00327
; LINE_WIDTH: 0.257331
G3 X107.793 Y137.725 I.315 J4.984 E.01058
G3 X108.011 Y137.75 I-.098 J1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X108.205 Y137.774 E.00476
; LINE_WIDTH: 0.389444
G1 X108.398 Y137.797 E.00551
; LINE_WIDTH: 0.405155
G1 X108.692 Y137.851 E.00881
G1 X109.315 Y138.023 F30000
; LINE_WIDTH: 0.096921
G1 F15000
G1 X109.477 Y138.206 E.00107
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.315 Y138.023 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/15
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
G3 Z.8 I.945 J.767 P1  F30000
G1 X142.056 Y97.699 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X142.03 Y97.914 E.00718
G1 X108.673 Y97.914 E1.1065
G1 X108.647 Y97.699 E.00718
G1 X109.134 Y97.579 E.01663
G1 X109.605 Y97.332 E.01764
G1 X110.003 Y96.979 E.01764
G1 X110.305 Y96.541 E.01765
G1 X110.494 Y96.044 E.01765
G1 X110.558 Y95.516 E.01765
G1 X110.494 Y94.988 E.01765
G1 X110.305 Y94.49 E.01765
G1 X110.003 Y94.053 E.01765
G1 X109.605 Y93.7 E.01764
G1 X109.134 Y93.453 E.01764
G1 X108.647 Y93.333 E.01663
G1 X108.673 Y93.118 E.00718
G1 X142.03 Y93.118 E1.1065
G1 X142.056 Y93.333 E.00718
G1 X141.569 Y93.453 E.01663
G1 X141.098 Y93.7 E.01764
G1 X140.7 Y94.053 E.01764
G1 X140.398 Y94.49 E.01764
G1 X140.209 Y94.988 E.01765
G1 X140.145 Y95.516 E.01764
G1 X140.209 Y96.044 E.01764
G1 X140.398 Y96.541 E.01765
G1 X140.7 Y96.979 E.01765
G1 X141.098 Y97.332 E.01764
G1 X141.569 Y97.579 E.01764
G1 X141.998 Y97.685 E.01464
; WIPE_START
G1 F24000
G1 X142.03 Y97.914 E-.08794
G1 X140.261 Y97.914 E-.67206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.468 J1.123 P1  F30000
G1 X143.941 Y96.379 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.88 Y96.467 E.00328
G1 X143.708 Y96.717 E.00934
G1 X143.381 Y97.007 E.01342
G1 X142.994 Y97.21 E.01342
G1 X142.57 Y97.314 E.01342
G1 X142.133 Y97.314 E.01342
G1 X141.709 Y97.21 E.01342
G1 X141.322 Y97.007 E.01342
G1 X140.996 Y96.717 E.01342
G1 X140.748 Y96.358 E.01342
G1 X140.593 Y95.949 E.01342
G1 X140.54 Y95.516 E.01342
G1 X140.593 Y95.082 E.01342
G1 X140.748 Y94.674 E.01342
G1 X140.823 Y94.565 E.00408
G1 X140.996 Y94.315 E.00934
G1 X141.322 Y94.025 E.01342
G1 X141.709 Y93.822 E.01342
G1 X142.133 Y93.717 E.01342
G1 X142.57 Y93.717 E.01342
G1 X142.994 Y93.822 E.01342
G1 X143.381 Y94.025 E.01342
G1 X143.708 Y94.315 E.01342
G1 X143.956 Y94.674 E.01342
G1 X144.11 Y95.082 E.01342
G1 X144.163 Y95.516 E.01342
G1 X144.11 Y95.949 E.01342
G1 X143.968 Y96.326 E.01237
M204 S10000
; WIPE_START
G1 F24000
G1 X143.88 Y96.467 E-.06303
G1 X143.708 Y96.717 E-.11555
G1 X143.381 Y97.007 E-.16595
G1 X142.994 Y97.21 E-.16595
G1 X142.57 Y97.314 E-.16595
G1 X142.35 Y97.314 E-.08357
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.807 J.911 P1  F30000
G1 X144.749 Y95.188 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X144.52 Y95.202 E.00763
G1 X144.494 Y94.988 E.00717
G1 X144.305 Y94.49 E.01765
G1 X144.003 Y94.053 E.01764
G1 X143.605 Y93.7 E.01765
G1 X143.134 Y93.453 E.01764
G1 X142.647 Y93.333 E.01663
G1 X142.673 Y93.118 E.00718
G1 X144.749 Y93.118 E.06887
G1 X144.749 Y95.128 E.06669
; WIPE_START
G1 F24000
G1 X144.52 Y95.202 E-.09162
G1 X144.494 Y94.988 E-.08209
G1 X144.305 Y94.49 E-.20213
G1 X144.003 Y94.053 E-.20213
G1 X143.645 Y93.735 E-.18203
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.177 J.311 P1  F30000
G1 X144.749 Y97.914 Z1
G1 Z.6
G1 E.8 F1800
G1 F15476.087
G1 X142.673 Y97.914 E.06887
G1 X142.647 Y97.699 E.00718
G1 X143.134 Y97.579 E.01663
G1 X143.605 Y97.332 E.01764
G1 X144.003 Y96.979 E.01765
G1 X144.305 Y96.541 E.01764
G1 X144.494 Y96.044 E.01765
G1 X144.52 Y95.829 E.00717
G1 X144.749 Y95.843 E.00763
G1 X144.749 Y97.854 E.06669
; WIPE_START
G1 F24000
G1 X142.75 Y97.911 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.09 J-1.214 P1  F30000
G1 X106.183 Y95.202 Z1
G1 Z.6
G1 E.8 F1800
G1 F15476.087
G1 X105.954 Y95.188 E.00763
G1 X105.954 Y93.118 E.06868
G1 X108.03 Y93.118 E.06887
G1 X108.056 Y93.333 E.00718
G1 X107.569 Y93.453 E.01663
G1 X107.098 Y93.7 E.01764
G1 X106.7 Y94.053 E.01765
G1 X106.398 Y94.49 E.01764
G1 X106.209 Y94.988 E.01765
G1 X106.19 Y95.143 E.00518
; WIPE_START
G1 F24000
G1 X105.954 Y95.188 E-.09162
G1 X105.954 Y93.429 E-.66838
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.139 J.429 P1  F30000
G1 X107.288 Y96.976 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.223 Y96.919 E.00267
G1 X106.996 Y96.717 E.00934
G1 X106.748 Y96.358 E.01342
G1 X106.593 Y95.949 E.01342
G1 X106.54 Y95.516 E.01342
G1 X106.593 Y95.082 E.01342
G1 X106.748 Y94.674 E.01342
G1 X106.996 Y94.315 E.01342
G1 X107.322 Y94.025 E.01342
G1 X107.709 Y93.822 E.01342
G1 X108.133 Y93.717 E.01342
G1 X108.57 Y93.717 E.01342
G1 X108.994 Y93.822 E.01342
G1 X109.381 Y94.025 E.01342
G1 X109.708 Y94.315 E.01342
G1 X109.956 Y94.674 E.01342
G1 X110.11 Y95.082 E.01342
G1 X110.163 Y95.516 E.01342
G1 X110.11 Y95.949 E.01342
G1 X109.956 Y96.358 E.01342
G1 X109.708 Y96.717 E.01342
G1 X109.381 Y97.007 E.01342
G1 X108.994 Y97.21 E.01342
G1 X108.57 Y97.314 E.01342
G1 X108.133 Y97.314 E.01342
G1 X107.709 Y97.21 E.01342
G1 X107.335 Y97.013 E.01298
M204 S10000
G1 X106.963 Y97.212 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.098 Y97.332 E.00598
G1 X107.569 Y97.579 E.01764
G1 X108.056 Y97.699 E.01663
G1 X108.03 Y97.914 E.00718
G1 X105.954 Y97.914 E.06887
G1 X105.954 Y95.843 E.06868
G1 X106.183 Y95.829 E.00763
G1 X106.209 Y96.044 E.00717
G1 X106.398 Y96.541 E.01765
G1 X106.7 Y96.979 E.01764
G1 X106.918 Y97.172 E.00968
; WIPE_START
G1 F24000
G1 X107.098 Y97.332 E-.0913
G1 X107.569 Y97.579 E-.20213
G1 X108.056 Y97.699 E-.19055
G1 X108.03 Y97.914 E-.08223
G1 X107.52 Y97.914 E-.1938
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.013 J1.217 P1  F30000
G1 X145.142 Y98.306 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X105.562 Y98.306 E1.21618
G1 X105.562 Y92.726 E.17146
G1 X145.142 Y92.726 E1.21618
G1 X145.142 Y98.246 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X143.142 Y98.249 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.652 J1.027 P1  F30000
G1 X144.546 Y97.357 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.282812
G1 F15000
G1 X143.418 Y97.71 E.02311
G1 X144.152 Y97.71 F30000
; LINE_WIDTH: 0.511101
G1 F13456.334
G1 X144.546 Y96.675 E.04224
G1 X144.946 Y95.516 F30000
; LINE_WIDTH: 0.311993
G1 F15000
G1 X144.475 Y95.516 E.01032
; LINE_WIDTH: 0.271404
G1 X144.354 Y95.409 E.00301
G1 X144.546 Y94.356 F30000
; LINE_WIDTH: 0.470044
G1 F14749.821
G1 X144.152 Y93.321 E.03854
G1 X144.546 Y93.674 F30000
; LINE_WIDTH: 0.282811
G1 F15000
G1 X143.418 Y93.321 E.02311
G1 X142.352 Y92.922 F30000
; LINE_WIDTH: 0.305086
G1 F15000
G1 X142.352 Y93.222 E.0064
; LINE_WIDTH: 0.25884
G1 X142.352 Y93.521 E.00527
G1 X141.298 Y93.342 F30000
; LINE_WIDTH: 0.108845
G1 F15000
G2 X141.144 Y93.419 I.025 J.242 E.00095
; WIPE_START
G1 F24000
G1 X141.232 Y93.358 E-.46675
G1 X141.298 Y93.342 E-.29325
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.188 J.263 P1  F30000
G1 X142.352 Y98.11 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.305086
G1 F15000
G1 X142.352 Y97.81 E.0064
; LINE_WIDTH: 0.25884
G1 X142.352 Y97.51 E.00527
G1 X141.298 Y97.69 F30000
; LINE_WIDTH: 0.108849
G1 F15000
G3 X141.144 Y97.612 I.025 J-.242 E.00095
G1 X139.004 Y95.629 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X139.074 Y94.825 E.02481
G1 X139.258 Y94.264 E.01813
G1 X111.445 Y94.264 E.85459
G1 X111.629 Y94.825 E.01813
G1 X111.699 Y95.402 E.01786
G1 X111.629 Y96.207 E.02481
G1 X111.445 Y96.767 E.01813
G1 X139.258 Y96.767 E.85459
G1 X139.074 Y96.207 E.01813
G1 X139.011 Y95.689 E.01602
G1 X138.63 Y95.357 F30000
G1 F15000
G1 X138.7 Y94.78 E.01786
G1 X138.734 Y94.641 E.00438
G1 X111.969 Y94.641 E.82241
G1 X112.073 Y95.357 E.02222
G3 X111.969 Y96.39 I-5.058 J.012 E.03198
G1 X138.734 Y96.39 E.82241
G1 X138.63 Y95.675 E.02222
G1 X138.63 Y95.417 E.00793
G1 X137.909 Y95.67 F30000
; LINE_WIDTH: 0.351909
G1 F15000
G1 X137.909 Y95.361 E.00778
G1 X112.794 Y95.361 E.63238
G1 X112.794 Y95.67 E.00778
G1 X137.849 Y95.67 E.63087
G1 X112.46 Y95.516 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X112.412 Y96.013 E.01536
G1 X138.291 Y96.013 E.79519
G1 X138.243 Y95.516 E.01536
G1 X138.291 Y95.018 E.01536
G1 X112.412 Y95.018 E.79519
G1 X112.454 Y95.456 E.01351
G1 X111.325 Y95.448 F30000
G1 F15000
G1 X111.255 Y96.161 E.02203
G1 X111.016 Y96.837 E.02203
G1 X110.823 Y97.145 E.01114
G1 X139.88 Y97.145 E.89282
G1 X139.687 Y96.837 E.01114
M73 P61 R5
G1 X139.481 Y96.293 E.01786
G1 X139.379 Y95.584 E.02203
G1 X139.449 Y94.871 E.02203
G1 X139.687 Y94.195 E.02203
G1 X139.88 Y93.887 E.01114
G1 X110.823 Y93.887 E.89282
G1 X111.016 Y94.195 E.01114
G1 X111.222 Y94.738 E.01786
G1 X111.316 Y95.388 E.02018
G1 X110.95 Y95.493 F30000
G1 F15000
G1 X110.88 Y96.116 E.01925
G1 X110.663 Y96.703 E.01925
G1 X110.312 Y97.222 E.01925
G1 X109.982 Y97.522 E.01369
G1 X140.721 Y97.522 E.94453
G1 X140.391 Y97.222 E.01369
G1 X140.061 Y96.744 E.01786
G1 X139.834 Y96.16 E.01925
G1 X139.753 Y95.539 E.01925
G1 X139.823 Y94.916 E.01925
G1 X140.04 Y94.328 E.01925
G1 X140.391 Y93.81 E.01925
G1 X140.721 Y93.51 E.01369
G1 X109.982 Y93.51 E.94453
G1 X110.312 Y93.81 E.01369
G1 X110.642 Y94.288 E.01786
G1 X110.869 Y94.872 E.01925
G1 X110.943 Y95.434 E.01741
G1 X109.559 Y93.419 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104413
G1 F15000
G2 X109.405 Y93.342 I-.179 J.165 E.00088
G1 X108.352 Y93.521 F30000
; LINE_WIDTH: 0.25884
G1 F15000
G1 X108.352 Y93.222 E.00527
; LINE_WIDTH: 0.305086
G1 X108.352 Y92.922 E.0064
G1 X107.285 Y93.321 F30000
; LINE_WIDTH: 0.265391
G1 F15000
G1 X106.157 Y93.674 E.02143
G1 X106.551 Y93.321 F30000
; LINE_WIDTH: 0.511106
G1 F13456.211
G1 X106.157 Y94.356 E.04224
G1 X106.157 Y96.675 F30000
; LINE_WIDTH: 0.511104
G1 F13456.249
G1 X106.551 Y97.71 E.04224
G1 X106.157 Y97.357 F30000
; LINE_WIDTH: 0.265386
G1 F15000
G1 X107.285 Y97.71 E.02143
G1 X108.352 Y98.11 F30000
; LINE_WIDTH: 0.305086
G1 F15000
G1 X108.352 Y97.81 E.0064
; LINE_WIDTH: 0.25884
G1 X108.352 Y97.51 E.00527
G1 X109.405 Y97.69 F30000
; LINE_WIDTH: 0.104411
G1 F15000
G2 X109.559 Y97.612 I-.025 J-.242 E.00088
; WIPE_START
G1 F24000
G1 X109.471 Y97.673 E-.46675
G1 X109.405 Y97.69 E-.29325
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.398 J1.15 P1  F30000
G1 X142.722 Y109.211 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X142.696 Y109.426 E.00718
G1 X109.339 Y109.426 E1.1065
G1 X109.313 Y109.211 E.00718
G1 X109.8 Y109.091 E.01663
G1 X110.271 Y108.844 E.01764
G1 X110.669 Y108.491 E.01764
G1 X110.971 Y108.053 E.01765
G1 X111.16 Y107.556 E.01765
G1 X111.224 Y107.028 E.01765
G1 X111.16 Y106.5 E.01765
G1 X110.971 Y106.002 E.01765
G1 X110.669 Y105.565 E.01765
G1 X110.271 Y105.212 E.01764
G1 X109.8 Y104.965 E.01764
G1 X109.313 Y104.845 E.01663
G1 X109.339 Y104.63 E.00718
G1 X142.696 Y104.63 E1.1065
G1 X142.722 Y104.845 E.00718
G1 X142.235 Y104.965 E.01663
G1 X141.764 Y105.212 E.01764
G1 X141.366 Y105.565 E.01764
G1 X141.064 Y106.002 E.01764
G1 X140.875 Y106.5 E.01765
G1 X140.811 Y107.028 E.01764
G1 X140.875 Y107.556 E.01764
G1 X141.064 Y108.053 E.01765
G1 X141.366 Y108.491 E.01765
G1 X141.764 Y108.844 E.01764
G1 X142.235 Y109.091 E.01764
G1 X142.664 Y109.197 E.01464
; WIPE_START
G1 F24000
G1 X142.696 Y109.426 E-.08794
G1 X140.927 Y109.426 E-.67206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.468 J1.123 P1  F30000
G1 X144.607 Y107.891 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.546 Y107.979 E.00328
G1 X144.374 Y108.229 E.00934
G1 X144.047 Y108.519 E.01342
G1 X143.66 Y108.722 E.01342
G1 X143.236 Y108.826 E.01342
G1 X142.799 Y108.826 E.01342
G1 X142.375 Y108.722 E.01342
G1 X141.989 Y108.519 E.01342
G1 X141.662 Y108.229 E.01342
G1 X141.414 Y107.87 E.01342
G1 X141.259 Y107.461 E.01342
G1 X141.206 Y107.028 E.01342
G1 X141.259 Y106.594 E.01342
G1 X141.414 Y106.186 E.01342
G1 X141.489 Y106.077 E.00408
G1 X141.662 Y105.827 E.00934
G1 X141.989 Y105.537 E.01342
G1 X142.375 Y105.334 E.01342
G1 X142.799 Y105.23 E.01342
G1 X143.236 Y105.23 E.01342
G1 X143.66 Y105.334 E.01342
G1 X144.047 Y105.537 E.01342
G1 X144.374 Y105.827 E.01342
G1 X144.622 Y106.186 E.01342
G1 X144.777 Y106.594 E.01342
G1 X144.829 Y107.028 E.01342
G1 X144.777 Y107.461 E.01342
G1 X144.634 Y107.838 E.01237
M204 S10000
; WIPE_START
G1 F24000
G1 X144.546 Y107.979 E-.06303
G1 X144.374 Y108.229 E-.11555
G1 X144.047 Y108.519 E-.16595
G1 X143.66 Y108.722 E-.16595
G1 X143.236 Y108.826 E-.16595
G1 X143.016 Y108.826 E-.08357
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.807 J.911 P1  F30000
G1 X145.416 Y106.7 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.186 Y106.714 E.00763
G1 X145.16 Y106.5 E.00717
G1 X144.971 Y106.002 E.01765
G1 X144.669 Y105.565 E.01764
G1 X144.271 Y105.212 E.01765
G1 X143.8 Y104.965 E.01764
G1 X143.313 Y104.845 E.01663
G1 X143.339 Y104.63 E.00718
G1 X145.416 Y104.63 E.06887
G1 X145.416 Y106.64 E.06669
; WIPE_START
G1 F24000
G1 X145.186 Y106.714 E-.09162
G1 X145.16 Y106.5 E-.08209
G1 X144.971 Y106.002 E-.20213
G1 X144.669 Y105.565 E-.20213
G1 X144.311 Y105.247 E-.18203
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.177 J.311 P1  F30000
G1 X145.416 Y109.426 Z1
G1 Z.6
G1 E.8 F1800
G1 F15476.087
G1 X143.339 Y109.426 E.06887
G1 X143.313 Y109.211 E.00718
G1 X143.8 Y109.091 E.01663
G1 X144.271 Y108.844 E.01764
G1 X144.669 Y108.491 E.01765
G1 X144.971 Y108.053 E.01764
G1 X145.16 Y107.556 E.01765
G1 X145.186 Y107.341 E.00717
G1 X145.416 Y107.355 E.00763
G1 X145.416 Y109.366 E.06669
; WIPE_START
G1 F24000
G1 X143.416 Y109.424 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.09 J-1.214 P1  F30000
G1 X106.849 Y106.714 Z1
G1 Z.6
G1 E.8 F1800
G1 F15476.087
G1 X106.62 Y106.7 E.00763
G1 X106.62 Y104.63 E.06868
G1 X108.696 Y104.63 E.06887
G1 X108.722 Y104.845 E.00718
G1 X108.235 Y104.965 E.01663
G1 X107.764 Y105.212 E.01764
G1 X107.366 Y105.565 E.01765
G1 X107.064 Y106.002 E.01764
G1 X106.875 Y106.5 E.01765
G1 X106.856 Y106.655 E.00518
; WIPE_START
G1 F24000
G1 X106.62 Y106.7 E-.09162
G1 X106.62 Y104.941 E-.66838
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.139 J.429 P1  F30000
G1 X107.954 Y108.488 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.889 Y108.431 E.00267
G1 X107.662 Y108.229 E.00934
G1 X107.414 Y107.87 E.01342
G1 X107.259 Y107.461 E.01342
G1 X107.206 Y107.028 E.01342
G1 X107.259 Y106.594 E.01342
G1 X107.414 Y106.186 E.01342
G1 X107.662 Y105.827 E.01342
G1 X107.989 Y105.537 E.01342
G1 X108.375 Y105.334 E.01342
G1 X108.799 Y105.23 E.01342
G1 X109.236 Y105.23 E.01342
G1 X109.66 Y105.334 E.01342
G1 X110.047 Y105.537 E.01342
G1 X110.374 Y105.827 E.01342
G1 X110.622 Y106.186 E.01342
G1 X110.777 Y106.594 E.01342
G1 X110.829 Y107.028 E.01342
G1 X110.777 Y107.461 E.01342
G1 X110.622 Y107.87 E.01342
G1 X110.374 Y108.229 E.01342
G1 X110.047 Y108.519 E.01342
G1 X109.66 Y108.722 E.01342
G1 X109.236 Y108.826 E.01342
G1 X108.799 Y108.826 E.01342
G1 X108.375 Y108.722 E.01342
G1 X108.001 Y108.525 E.01298
M204 S10000
G1 X107.629 Y108.724 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.764 Y108.844 E.00598
G1 X108.235 Y109.091 E.01764
G1 X108.722 Y109.211 E.01663
G1 X108.696 Y109.426 E.00718
G1 X106.62 Y109.426 E.06887
G1 X106.62 Y107.355 E.06868
G1 X106.849 Y107.341 E.00763
G1 X106.875 Y107.556 E.00717
G1 X107.064 Y108.053 E.01765
G1 X107.366 Y108.491 E.01764
G1 X107.584 Y108.684 E.00968
; WIPE_START
G1 F24000
G1 X107.764 Y108.844 E-.0913
G1 X108.235 Y109.091 E-.20213
G1 X108.722 Y109.211 E-.19055
G1 X108.696 Y109.426 E-.08223
G1 X108.186 Y109.426 E-.1938
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.013 J1.217 P1  F30000
G1 X145.808 Y109.818 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.228 Y109.818 E1.21618
G1 X106.228 Y104.238 E.17146
G1 X145.808 Y104.238 E1.21618
G1 X145.808 Y109.758 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X143.808 Y109.761 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.652 J1.027 P1  F30000
G1 X145.212 Y108.869 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.282812
G1 F15000
G1 X144.084 Y109.222 E.02311
G1 X144.818 Y109.222 F30000
; LINE_WIDTH: 0.511101
G1 F13456.334
G1 X145.212 Y108.188 E.04224
G1 X145.612 Y107.028 F30000
; LINE_WIDTH: 0.311993
G1 F15000
G1 X145.141 Y107.028 E.01032
; LINE_WIDTH: 0.271404
G1 X145.02 Y106.921 E.00301
G1 X145.212 Y105.868 F30000
; LINE_WIDTH: 0.470044
G1 F14749.821
G1 X144.818 Y104.833 E.03854
G1 X145.212 Y105.187 F30000
; LINE_WIDTH: 0.282811
G1 F15000
G1 X144.084 Y104.833 E.02311
G1 X143.018 Y104.434 F30000
; LINE_WIDTH: 0.305086
G1 F15000
G1 X143.018 Y104.734 E.0064
; LINE_WIDTH: 0.25884
G1 X143.018 Y105.033 E.00527
G1 X141.964 Y104.854 F30000
; LINE_WIDTH: 0.108845
G1 F15000
G2 X141.81 Y104.931 I.025 J.242 E.00095
; WIPE_START
G1 F24000
G1 X141.898 Y104.87 E-.46675
G1 X141.964 Y104.854 E-.29325
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.188 J.263 P1  F30000
G1 X143.018 Y109.622 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.305086
G1 F15000
G1 X143.018 Y109.322 E.0064
; LINE_WIDTH: 0.25884
G1 X143.018 Y109.022 E.00527
G1 X141.964 Y109.202 F30000
; LINE_WIDTH: 0.108849
G1 F15000
G3 X141.81 Y109.124 I.025 J-.242 E.00095
G1 X139.67 Y107.141 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X139.74 Y106.337 E.02481
G1 X139.924 Y105.776 E.01813
G1 X112.111 Y105.776 E.85459
G1 X112.295 Y106.337 E.01813
G1 X112.365 Y106.914 E.01786
G1 X112.295 Y107.719 E.02481
G1 X112.111 Y108.28 E.01813
G1 X139.924 Y108.28 E.85459
G1 X139.74 Y107.719 E.01813
G1 X139.678 Y107.201 E.01602
G1 X139.296 Y106.869 F30000
G1 F15000
G1 X139.366 Y106.292 E.01786
G1 X139.4 Y106.153 E.00438
G1 X112.635 Y106.153 E.82241
G1 X112.739 Y106.869 E.02222
G3 X112.635 Y107.902 I-5.058 J.012 E.03198
G1 X139.4 Y107.902 E.82241
G1 X139.296 Y107.187 E.02222
G1 X139.296 Y106.929 E.00793
G1 X138.576 Y107.182 F30000
; LINE_WIDTH: 0.351909
G1 F15000
G1 X138.576 Y106.873 E.00778
G1 X113.46 Y106.873 E.63238
G1 X113.46 Y107.182 E.00778
G1 X138.516 Y107.182 E.63087
G1 X113.126 Y107.028 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X113.078 Y107.525 E.01536
G1 X138.957 Y107.525 E.79519
G1 X138.909 Y107.028 E.01536
G1 X138.957 Y106.53 E.01536
G1 X113.078 Y106.53 E.79519
G1 X113.12 Y106.968 E.01351
G1 X111.991 Y106.96 F30000
G1 F15000
G1 X111.921 Y107.673 E.02203
G1 X111.682 Y108.349 E.02203
G1 X111.49 Y108.657 E.01114
G1 X140.546 Y108.657 E.89282
G1 X140.353 Y108.349 E.01114
G1 X140.147 Y107.806 E.01786
G1 X140.045 Y107.096 E.02203
G1 X140.115 Y106.383 E.02203
G1 X140.353 Y105.707 E.02203
G1 X140.546 Y105.399 E.01114
G1 X111.49 Y105.399 E.89282
G1 X111.682 Y105.707 E.01114
G1 X111.888 Y106.25 E.01786
G1 X111.982 Y106.9 E.02018
G1 X111.616 Y107.005 F30000
G1 F15000
G1 X111.546 Y107.628 E.01925
G1 X111.329 Y108.215 E.01925
G1 X110.978 Y108.734 E.01925
G1 X110.648 Y109.034 E.01369
G1 X141.387 Y109.034 E.94453
G1 X141.057 Y108.734 E.01369
G1 X140.727 Y108.256 E.01786
G1 X140.5 Y107.672 E.01925
G1 X140.419 Y107.051 E.01925
G1 X140.489 Y106.428 E.01925
G1 X140.706 Y105.84 E.01925
G1 X141.057 Y105.322 E.01925
G1 X141.387 Y105.022 E.01369
G1 X110.648 Y105.022 E.94453
G1 X110.978 Y105.322 E.01369
G1 X111.308 Y105.8 E.01786
G1 X111.535 Y106.384 E.01925
G1 X111.609 Y106.946 E.01741
M73 P62 R5
G1 X110.225 Y104.931 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104413
G1 F15000
G2 X110.071 Y104.854 I-.179 J.165 E.00088
G1 X109.018 Y105.033 F30000
; LINE_WIDTH: 0.25884
G1 F15000
G1 X109.018 Y104.734 E.00527
; LINE_WIDTH: 0.305086
G1 X109.018 Y104.434 E.0064
G1 X107.952 Y104.833 F30000
; LINE_WIDTH: 0.265391
G1 F15000
G1 X106.823 Y105.186 E.02143
G1 X107.217 Y104.833 F30000
; LINE_WIDTH: 0.511106
G1 F13456.211
G1 X106.823 Y105.868 E.04224
G1 X106.823 Y108.188 F30000
; LINE_WIDTH: 0.511104
G1 F13456.249
G1 X107.217 Y109.222 E.04224
G1 X106.823 Y108.869 F30000
; LINE_WIDTH: 0.265386
G1 F15000
G1 X107.952 Y109.222 E.02143
M73 P62 R4
G1 X109.018 Y109.622 F30000
; LINE_WIDTH: 0.305086
G1 F15000
G1 X109.018 Y109.322 E.0064
; LINE_WIDTH: 0.25884
G1 X109.018 Y109.022 E.00527
G1 X110.071 Y109.202 F30000
; LINE_WIDTH: 0.104411
G1 F15000
G2 X110.225 Y109.124 I-.025 J-.242 E.00088
; WIPE_START
G1 F24000
G1 X110.137 Y109.186 E-.46675
G1 X110.071 Y109.202 E-.29325
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.544 J1.089 P1  F30000
G1 X136.503 Y122.406 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X136.376 Y122.473 E.00478
G1 X135.905 Y122.89 E.02084
G1 X135.548 Y123.407 E.02084
G1 X135.325 Y123.995 E.02084
G1 X135.25 Y124.618 E.02084
G1 X135.325 Y125.242 E.02084
G1 X135.548 Y125.83 E.02084
G1 X135.905 Y126.347 E.02084
G1 X136.376 Y126.763 E.02084
G1 X136.503 Y126.831 E.00478
G1 X136.457 Y127.016 E.00635
G1 X105.255 Y127.016 E1.03504
G1 X105.209 Y126.831 E.00635
G1 X105.337 Y126.763 E.00478
G1 X105.807 Y126.347 E.02084
G1 X106.164 Y125.83 E.02084
G1 X106.387 Y125.242 E.02084
G1 X106.463 Y124.618 E.02084
G1 X106.387 Y123.995 E.02084
G1 X106.164 Y123.407 E.02084
G1 X105.807 Y122.89 E.02084
G1 X105.337 Y122.473 E.02084
G1 X105.209 Y122.406 E.00478
G1 X105.255 Y122.22 E.00635
G1 X136.457 Y122.22 E1.03504
G1 X136.489 Y122.348 E.00436
; WIPE_START
G1 F24000
G1 X136.376 Y122.473 E-.06419
G1 X135.905 Y122.89 E-.23878
G1 X135.548 Y123.407 E-.23878
G1 X135.345 Y123.944 E-.21825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.038 J1.216 P1  F30000
G1 X140.004 Y124.091 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X140.068 Y124.618 E.01632
G1 X140.003 Y125.148 E.01638
G1 X139.814 Y125.646 E.01638
G1 X139.512 Y126.085 E.01638
G1 X139.112 Y126.438 E.01638
G1 X138.64 Y126.686 E.01638
G1 X138.123 Y126.814 E.01638
G1 X137.59 Y126.814 E.01638
G1 X137.072 Y126.686 E.01638
G1 X136.6 Y126.438 E.01638
G1 X136.201 Y126.085 E.01638
G1 X135.898 Y125.646 E.01638
G1 X135.709 Y125.148 E.01638
G1 X135.645 Y124.618 E.01638
G1 X135.709 Y124.089 E.01638
G1 X135.898 Y123.591 E.01638
G1 X136.201 Y123.152 E.01638
G1 X136.6 Y122.798 E.01638
G1 X137.072 Y122.551 E.01638
G1 X137.59 Y122.423 E.01638
G1 X138.123 Y122.423 E.01638
G1 X138.64 Y122.551 E.01638
G1 X139.112 Y122.798 E.01638
G1 X139.512 Y123.152 E.01638
G1 X139.814 Y123.591 E.01638
G1 X139.983 Y124.035 E.0146
M204 S10000
G1 X140.083 Y123.289 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.807 Y122.89 E.01608
G1 X139.337 Y122.473 E.02084
G1 X139.209 Y122.406 E.00478
G1 X139.255 Y122.22 E.00635
G1 X140.254 Y122.22 E.03314
G1 X140.254 Y123.235 E.03367
G1 X140.14 Y123.271 E.00397
; WIPE_START
G1 F24000
G1 X139.807 Y122.89 E-.19221
G1 X139.337 Y122.473 E-.23878
G1 X139.209 Y122.406 E-.0548
G1 X139.255 Y122.22 E-.07271
G1 X139.785 Y122.22 E-.2015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.213 J.097 P1  F30000
G1 X140.083 Y125.948 Z1
G1 Z.6
G1 E.8 F1800
G1 F15476.087
G1 X140.254 Y126.001 E.00596
G1 X140.254 Y127.016 E.03367
G1 X139.255 Y127.016 E.03314
G1 X139.209 Y126.831 E.00635
G1 X139.337 Y126.763 E.00478
G1 X139.807 Y126.347 E.02084
G1 X140.048 Y125.997 E.01409
; WIPE_START
G1 F24000
G1 X140.254 Y126.001 E-.07817
G1 X140.254 Y127.016 E-.38568
G1 X139.475 Y127.016 E-.29616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.105 J-1.212 P1  F30000
G1 X106.005 Y124.104 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.068 Y124.618 E.01592
G1 X106.003 Y125.148 E.01638
G1 X105.814 Y125.646 E.01638
G1 X105.512 Y126.085 E.01638
G1 X105.112 Y126.438 E.01638
G1 X104.64 Y126.686 E.01638
G1 X104.123 Y126.814 E.01638
G1 X103.59 Y126.814 E.01638
G1 X103.072 Y126.686 E.01638
G1 X102.6 Y126.438 E.01638
G1 X102.201 Y126.085 E.01638
G1 X101.898 Y125.646 E.01638
G1 X101.709 Y125.148 E.01638
G1 X101.645 Y124.618 E.01638
G1 X101.709 Y124.089 E.01638
G1 X101.898 Y123.591 E.01638
G1 X102.201 Y123.152 E.01638
G1 X102.6 Y122.798 E.01638
G1 X103.072 Y122.551 E.01638
G1 X103.59 Y122.423 E.01638
G1 X104.123 Y122.423 E.01638
G1 X104.64 Y122.551 E.01638
G1 X105.112 Y122.798 E.01638
G1 X105.512 Y123.152 E.01638
G1 X105.814 Y123.591 E.01638
G1 X105.988 Y124.047 E.015
M204 S10000
; WIPE_START
G1 F24000
G1 X106.068 Y124.618 E-.2192
G1 X106.003 Y125.148 E-.20259
G1 X105.814 Y125.646 E-.20259
G1 X105.612 Y125.94 E-.13562
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.914 J-.804 P1  F30000
G1 X102.503 Y122.406 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X102.376 Y122.473 E.00478
G1 X101.905 Y122.89 E.02084
G1 X101.63 Y123.289 E.01608
G1 X101.458 Y123.235 E.00596
G1 X101.458 Y122.22 E.03367
G1 X102.457 Y122.22 E.03314
G1 X102.489 Y122.348 E.00436
; WIPE_START
G1 F24000
G1 X102.376 Y122.473 E-.06419
G1 X101.905 Y122.89 E-.23878
G1 X101.63 Y123.289 E-.18419
G1 X101.458 Y123.235 E-.06829
G1 X101.458 Y122.697 E-.20454
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.18 J.298 P1  F30000
G1 X102.503 Y126.831 Z1
G1 Z.6
G1 E.8 F1800
G1 F15476.087
G1 X102.457 Y127.016 E.00635
G1 X101.458 Y127.016 E.03314
G1 X101.458 Y126.001 E.03367
G1 X101.63 Y125.948 E.00596
G1 X101.905 Y126.347 E.01608
G1 X102.376 Y126.763 E.02084
G1 X102.45 Y126.803 E.00279
; WIPE_START
G1 F24000
G1 X102.457 Y127.016 E-.08125
G1 X101.458 Y127.016 E-.37968
G1 X101.458 Y126.229 E-.29907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.037 J1.216 P1  F30000
G1 X140.646 Y127.408 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X101.066 Y127.408 E1.21618
G1 X101.066 Y121.828 E.17146
G1 X140.646 Y121.828 E1.21618
G1 X140.646 Y127.348 E.16961
M204 S10000
G1 X139.886 Y126.813 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151056
G1 F15000
G1 X140.038 Y126.415 E.00375
G1 X140.219 Y125.785 F30000
; LINE_WIDTH: 0.434488
G1 F15000
G1 X140.252 Y125.604 E.00588
; LINE_WIDTH: 0.3918
G1 X140.285 Y125.423 E.00524
; LINE_WIDTH: 0.349112
G1 X140.318 Y125.242 E.00459
; LINE_WIDTH: 0.306424
G1 X140.322 Y125.21 E.00068
; LINE_WIDTH: 0.298796
G1 X140.34 Y124.92 E.00607
; LINE_WIDTH: 0.261158
G2 X140.357 Y124.607 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X140.34 Y124.317 E.0044
; LINE_WIDTH: 0.267101
G2 X140.318 Y123.995 I-2.649 J.015 E.00589
; LINE_WIDTH: 0.306424
G1 X140.285 Y123.814 E.00395
; LINE_WIDTH: 0.349112
G1 X140.252 Y123.633 E.00459
; LINE_WIDTH: 0.3918
G1 X140.219 Y123.452 E.00524
G1 X140.038 Y122.822 F30000
; LINE_WIDTH: 0.141571
G1 F15000
G1 X139.886 Y122.424 E.00342
G1 X139.045 Y122.252 F30000
; LINE_WIDTH: 0.405157
G1 F15000
G1 X138.752 Y122.198 E.00881
; LINE_WIDTH: 0.389446
G1 X138.558 Y122.174 E.00551
; LINE_WIDTH: 0.342434
G1 X138.365 Y122.151 E.00476
; LINE_WIDTH: 0.257331
G2 X138.147 Y122.126 I-.317 J1.798 E.00384
G2 X137.541 Y122.127 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X137.348 Y122.151 E.00327
; LINE_WIDTH: 0.295421
G1 X137.154 Y122.174 E.00401
; LINE_WIDTH: 0.342433
G1 X136.96 Y122.198 E.00476
; LINE_WIDTH: 0.389446
G1 X136.667 Y122.252 E.00842
G1 X136.044 Y122.424 F30000
; LINE_WIDTH: 0.134453
G1 F15000
G1 X135.882 Y122.607 E.00182
; WIPE_START
G1 F24000
G1 X136.044 Y122.424 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.017 J.669 P1  F30000
G1 X139.045 Y126.985 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.405156
G1 F15000
G1 X138.752 Y127.039 E.00881
; LINE_WIDTH: 0.389444
G1 X138.558 Y127.063 E.00551
; LINE_WIDTH: 0.342433
G1 X138.365 Y127.086 E.00476
; LINE_WIDTH: 0.257331
G3 X138.147 Y127.111 I-.317 J-1.798 E.00384
G3 X137.541 Y127.11 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X137.348 Y127.086 E.00327
; LINE_WIDTH: 0.295422
G1 X137.154 Y127.063 E.00401
; LINE_WIDTH: 0.342433
G1 X136.96 Y127.039 E.00476
; LINE_WIDTH: 0.389444
G1 X136.667 Y126.985 E.00842
G1 X136.044 Y126.813 F30000
; LINE_WIDTH: 0.134453
G1 F15000
G1 X135.882 Y126.63 E.00182
G1 X134.857 Y124.641 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X134.939 Y123.923 E.02221
G1 X135.19 Y123.245 E.02221
G1 X135.498 Y122.79 E.01688
G1 X135.394 Y122.693 E.00435
G1 X135.398 Y122.613 E.00248
G1 X106.304 Y122.613 E.89398
G3 X106.214 Y122.79 I-.163 J.029 E.00653
G1 X106.501 Y123.205 E.01549
G1 X106.762 Y123.879 E.02221
G1 X106.855 Y124.596 E.02221
G1 X106.773 Y125.314 E.02221
G1 X106.522 Y125.992 E.02221
G1 X106.214 Y126.447 E.01688
G1 X106.309 Y126.538 E.00402
G1 X106.304 Y126.624 E.00266
G1 X135.398 Y126.624 E.89398
G3 X135.498 Y126.447 I.168 J-.022 E.00671
G1 X135.212 Y126.032 E.01549
G1 X134.95 Y125.358 E.02221
G1 X134.865 Y124.701 E.02037
G1 X134.109 Y124.732 F30000
G1 F15000
G1 X134.191 Y123.832 E.02777
G1 X134.338 Y123.367 E.01499
G1 X107.375 Y123.367 E.82849
G1 X107.522 Y123.832 E.01499
G1 X107.604 Y124.505 E.02083
G1 X107.522 Y125.405 E.02777
G1 X107.375 Y125.87 E.01499
G1 X134.338 Y125.87 E.82849
G1 X134.191 Y125.405 E.01499
G1 X134.116 Y124.792 E.01898
G1 X108.698 Y124.464 F30000
; LINE_WIDTH: 0.351909
G1 F15000
G1 X108.698 Y124.773 E.00778
G1 X133.014 Y124.773 E.61224
G1 X133.014 Y124.464 E.00778
G1 X108.758 Y124.464 E.61073
G1 X108.365 Y124.618 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X108.317 Y125.116 E.01536
G1 X133.396 Y125.116 E.77061
G1 X133.348 Y124.618 E.01536
G1 X133.396 Y124.121 E.01536
G1 X108.317 Y124.121 E.77061
G1 X108.359 Y124.559 E.01351
G1 X107.978 Y124.777 F30000
G1 F15000
G1 X107.886 Y125.493 E.02217
G1 X133.827 Y125.493 E.7971
G1 X133.734 Y124.777 E.02217
G1 X133.734 Y124.459 E.00978
G1 X133.827 Y123.744 E.02217
G1 X107.886 Y123.744 E.7971
G1 X107.978 Y124.459 E.02217
G1 X107.978 Y124.717 E.00793
G1 X107.636 Y126.247 F30000
G1 F15000
G1 X134.901 Y126.247 E.83776
G1 X134.597 Y125.492 E.02499
G1 X134.483 Y124.687 E.02499
G1 X134.565 Y123.877 E.02499
G1 X134.838 Y123.111 E.02499
G1 X134.901 Y122.99 E.00419
G1 X106.812 Y122.99 E.8631
G1 X107.115 Y123.745 E.02499
G1 X107.229 Y124.55 E.02499
G1 X107.148 Y125.359 E.02499
G1 X106.875 Y126.126 E.02499
G1 X106.812 Y126.247 E.00419
G1 X107.576 Y126.247 E.0235
G1 X105.83 Y126.63 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969209
G1 F15000
G1 X105.668 Y126.813 E.00107
G1 X105.045 Y126.985 F30000
; LINE_WIDTH: 0.405156
G1 F15000
G1 X104.752 Y127.039 E.00881
; LINE_WIDTH: 0.389444
G1 X104.558 Y127.063 E.00551
; LINE_WIDTH: 0.342433
G1 X104.365 Y127.086 E.00476
; LINE_WIDTH: 0.257331
G3 X104.147 Y127.111 I-.317 J-1.798 E.00384
G3 X103.541 Y127.11 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X103.348 Y127.086 E.00327
; LINE_WIDTH: 0.295422
G1 X103.154 Y127.063 E.00401
; LINE_WIDTH: 0.342433
G1 X102.96 Y127.039 E.00476
; LINE_WIDTH: 0.389444
G1 X102.667 Y126.985 E.00842
G1 X101.826 Y126.813 F30000
; LINE_WIDTH: 0.151054
G1 F15000
G1 X101.675 Y126.415 E.00375
G1 X101.494 Y125.785 F30000
; LINE_WIDTH: 0.3918
G1 F15000
G1 X101.46 Y125.604 E.00524
; LINE_WIDTH: 0.349112
G1 X101.427 Y125.423 E.00459
; LINE_WIDTH: 0.306424
G1 X101.394 Y125.242 E.00395
; LINE_WIDTH: 0.267101
G3 X101.373 Y124.92 I2.628 J-.336 E.00589
; LINE_WIDTH: 0.228538
G1 X101.355 Y124.63 E.0044
; LINE_WIDTH: 0.261158
G3 X101.373 Y124.317 I2.594 J-.011 E.00557
; LINE_WIDTH: 0.298796
G1 X101.39 Y124.026 E.00607
; LINE_WIDTH: 0.306424
G1 X101.394 Y123.995 E.00068
; LINE_WIDTH: 0.349112
G1 X101.427 Y123.814 E.00459
; LINE_WIDTH: 0.3918
G1 X101.46 Y123.633 E.00524
; LINE_WIDTH: 0.434488
G1 X101.494 Y123.452 E.00588
G1 X101.675 Y122.822 F30000
; LINE_WIDTH: 0.151056
G1 F15000
G1 X101.826 Y122.424 E.00375
G1 X102.667 Y122.252 F30000
; LINE_WIDTH: 0.389444
G1 F15000
G1 X102.96 Y122.198 E.00842
; LINE_WIDTH: 0.342433
G1 X103.154 Y122.174 E.00476
; LINE_WIDTH: 0.295421
G1 X103.348 Y122.151 E.00401
; LINE_WIDTH: 0.24841
G1 X103.541 Y122.127 E.00327
; LINE_WIDTH: 0.257331
G3 X104.147 Y122.126 I.315 J4.984 E.01058
M73 P63 R4
G3 X104.365 Y122.151 I-.098 J1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X104.558 Y122.174 E.00476
; LINE_WIDTH: 0.389444
G1 X104.752 Y122.198 E.00551
; LINE_WIDTH: 0.405155
G1 X105.045 Y122.252 E.00881
G1 X105.668 Y122.424 F30000
; LINE_WIDTH: 0.0969209
G1 F15000
G1 X105.83 Y122.607 E.00107
; WIPE_START
G1 F24000
G1 X105.668 Y122.424 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.501 J1.109 P1  F30000
G1 X140.15 Y138.006 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X140.022 Y138.073 E.00478
G1 X139.552 Y138.489 E.02084
G1 X139.195 Y139.007 E.02084
G1 X138.972 Y139.594 E.02084
G1 X138.896 Y140.218 E.02084
G1 X138.972 Y140.842 E.02084
G1 X139.195 Y141.429 E.02084
G1 X139.552 Y141.946 E.02084
G1 X140.022 Y142.363 E.02084
G1 X140.15 Y142.43 E.00478
G1 X140.104 Y142.616 E.00635
G1 X108.901 Y142.616 E1.03504
G1 X108.856 Y142.43 E.00635
G1 X108.983 Y142.363 E.00478
G1 X109.454 Y141.946 E.02084
G1 X109.811 Y141.429 E.02084
G1 X110.033 Y140.842 E.02084
G1 X110.109 Y140.218 E.02084
G1 X110.033 Y139.594 E.02084
G1 X109.811 Y139.007 E.02084
G1 X109.454 Y138.489 E.02084
G1 X108.983 Y138.073 E.02084
G1 X108.856 Y138.006 E.00478
G1 X108.901 Y137.82 E.00635
G1 X140.104 Y137.82 E1.03504
G1 X140.135 Y137.947 E.00436
; WIPE_START
G1 F24000
G1 X140.022 Y138.073 E-.06419
G1 X139.552 Y138.489 E-.23878
G1 X139.195 Y139.007 E-.23878
G1 X138.991 Y139.544 E-.21825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.038 J1.216 P1  F30000
G1 X143.65 Y139.691 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.714 Y140.218 E.01632
G1 X143.65 Y140.747 E.01638
G1 X143.461 Y141.246 E.01638
G1 X143.158 Y141.684 E.01638
G1 X142.759 Y142.038 E.01638
G1 X142.287 Y142.286 E.01638
G1 X141.769 Y142.413 E.01638
G1 X141.236 Y142.413 E.01638
G1 X140.719 Y142.286 E.01638
G1 X140.246 Y142.038 E.01638
G1 X139.847 Y141.684 E.01638
G1 X139.545 Y141.246 E.01638
G1 X139.355 Y140.747 E.01638
G1 X139.291 Y140.218 E.01638
G1 X139.355 Y139.689 E.01638
G1 X139.545 Y139.19 E.01638
G1 X139.847 Y138.751 E.01638
G1 X140.246 Y138.398 E.01638
G1 X140.719 Y138.15 E.01638
G1 X141.236 Y138.022 E.01638
G1 X141.769 Y138.022 E.01638
G1 X142.287 Y138.15 E.01638
G1 X142.759 Y138.398 E.01638
G1 X143.158 Y138.751 E.01638
G1 X143.461 Y139.19 E.01638
G1 X143.629 Y139.634 E.0146
M204 S10000
G1 X143.729 Y138.888 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.454 Y138.489 E.01608
G1 X142.983 Y138.073 E.02084
G1 X142.856 Y138.006 E.00478
G1 X142.901 Y137.82 E.00635
G1 X143.901 Y137.82 E.03314
G1 X143.901 Y138.835 E.03367
G1 X143.786 Y138.87 E.00397
; WIPE_START
G1 F24000
G1 X143.454 Y138.489 E-.19221
G1 X142.983 Y138.073 E-.23878
G1 X142.856 Y138.006 E-.0548
G1 X142.901 Y137.82 E-.07271
G1 X143.432 Y137.82 E-.2015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.213 J.097 P1  F30000
G1 X143.729 Y141.547 Z1
G1 Z.6
G1 E.8 F1800
G1 F15476.087
G1 X143.901 Y141.601 E.00596
G1 X143.901 Y142.616 E.03367
G1 X142.901 Y142.616 E.03314
G1 X142.856 Y142.43 E.00635
G1 X142.983 Y142.363 E.00478
G1 X143.454 Y141.946 E.02084
G1 X143.695 Y141.597 E.01409
; WIPE_START
G1 F24000
G1 X143.901 Y141.601 E-.07817
G1 X143.901 Y142.616 E-.38568
G1 X143.121 Y142.616 E-.29616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.105 J-1.212 P1  F30000
G1 X109.652 Y139.704 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X109.714 Y140.218 E.01592
G1 X109.65 Y140.747 E.01638
G1 X109.461 Y141.246 E.01638
G1 X109.158 Y141.684 E.01638
G1 X108.759 Y142.038 E.01638
G1 X108.287 Y142.286 E.01638
G1 X107.769 Y142.413 E.01638
G1 X107.236 Y142.413 E.01638
G1 X106.719 Y142.286 E.01638
G1 X106.246 Y142.038 E.01638
G1 X105.847 Y141.684 E.01638
G1 X105.545 Y141.246 E.01638
G1 X105.355 Y140.747 E.01638
G1 X105.291 Y140.218 E.01638
G1 X105.355 Y139.689 E.01638
G1 X105.545 Y139.19 E.01638
G1 X105.847 Y138.751 E.01638
G1 X106.246 Y138.398 E.01638
G1 X106.719 Y138.15 E.01638
G1 X107.236 Y138.022 E.01638
G1 X107.769 Y138.022 E.01638
G1 X108.287 Y138.15 E.01638
G1 X108.759 Y138.398 E.01638
G1 X109.158 Y138.751 E.01638
G1 X109.461 Y139.19 E.01638
G1 X109.634 Y139.647 E.015
M204 S10000
; WIPE_START
G1 F24000
G1 X109.714 Y140.218 E-.2192
G1 X109.65 Y140.747 E-.20259
G1 X109.461 Y141.246 E-.20259
G1 X109.258 Y141.539 E-.13562
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.914 J-.804 P1  F30000
G1 X106.15 Y138.006 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X106.022 Y138.073 E.00478
G1 X105.552 Y138.489 E.02084
G1 X105.276 Y138.888 E.01608
G1 X105.105 Y138.835 E.00596
G1 X105.105 Y137.82 E.03367
G1 X106.104 Y137.82 E.03314
G1 X106.135 Y137.947 E.00436
; WIPE_START
G1 F24000
G1 X106.022 Y138.073 E-.06419
G1 X105.552 Y138.489 E-.23878
G1 X105.276 Y138.888 E-.18419
G1 X105.105 Y138.835 E-.06829
G1 X105.105 Y138.297 E-.20454
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.18 J.298 P1  F30000
G1 X106.15 Y142.43 Z1
G1 Z.6
G1 E.8 F1800
G1 F15476.087
G1 X106.104 Y142.616 E.00635
G1 X105.105 Y142.616 E.03314
G1 X105.105 Y141.601 E.03367
G1 X105.276 Y141.547 E.00596
G1 X105.552 Y141.946 E.01608
G1 X106.022 Y142.363 E.02084
G1 X106.097 Y142.402 E.00279
; WIPE_START
G1 F24000
G1 X106.104 Y142.616 E-.08125
G1 X105.105 Y142.616 E-.37968
G1 X105.105 Y141.829 E-.29907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.037 J1.216 P1  F30000
G1 X144.293 Y143.008 Z1
G1 Z.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X104.713 Y143.008 E1.21618
G1 X104.713 Y137.428 E.17146
G1 X144.293 Y137.428 E1.21618
G1 X144.293 Y142.948 E.16961
M204 S10000
G1 X143.533 Y142.412 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151056
G1 F15000
G1 X143.684 Y142.015 E.00375
G1 X143.865 Y141.384 F30000
; LINE_WIDTH: 0.434488
G1 F15000
G1 X143.899 Y141.203 E.00588
; LINE_WIDTH: 0.3918
G1 X143.932 Y141.022 E.00524
; LINE_WIDTH: 0.349112
G1 X143.965 Y140.841 E.00459
; LINE_WIDTH: 0.306424
G1 X143.969 Y140.81 E.00068
; LINE_WIDTH: 0.298796
G1 X143.986 Y140.519 E.00607
; LINE_WIDTH: 0.261158
G2 X144.004 Y140.207 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X143.986 Y139.916 E.0044
; LINE_WIDTH: 0.267101
G2 X143.965 Y139.595 I-2.649 J.015 E.00589
; LINE_WIDTH: 0.306424
G1 X143.932 Y139.413 E.00395
; LINE_WIDTH: 0.349112
G1 X143.899 Y139.232 E.00459
; LINE_WIDTH: 0.3918
G1 X143.865 Y139.051 E.00524
G1 X143.684 Y138.421 F30000
; LINE_WIDTH: 0.141571
G1 F15000
G1 X143.533 Y138.023 E.00342
G1 X142.692 Y137.851 F30000
; LINE_WIDTH: 0.405157
G1 F15000
G1 X142.398 Y137.797 E.00881
; LINE_WIDTH: 0.389446
G1 X142.205 Y137.774 E.00551
; LINE_WIDTH: 0.342434
G1 X142.011 Y137.75 E.00476
; LINE_WIDTH: 0.257331
G2 X141.793 Y137.725 I-.317 J1.798 E.00384
G2 X141.188 Y137.727 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X140.994 Y137.75 E.00327
; LINE_WIDTH: 0.295421
G1 X140.801 Y137.774 E.00401
; LINE_WIDTH: 0.342433
G1 X140.607 Y137.797 E.00476
; LINE_WIDTH: 0.389446
G1 X140.314 Y137.851 E.00842
G1 X139.691 Y138.023 F30000
; LINE_WIDTH: 0.134453
G1 F15000
G1 X139.529 Y138.206 E.00182
; WIPE_START
G1 F24000
G1 X139.691 Y138.023 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.017 J.669 P1  F30000
G1 X142.692 Y142.585 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.405156
G1 F15000
G1 X142.398 Y142.639 E.00881
; LINE_WIDTH: 0.389444
G1 X142.205 Y142.662 E.00551
; LINE_WIDTH: 0.342433
G1 X142.011 Y142.686 E.00476
; LINE_WIDTH: 0.257331
G3 X141.793 Y142.711 I-.317 J-1.798 E.00384
G3 X141.188 Y142.709 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X140.994 Y142.686 E.00327
; LINE_WIDTH: 0.295422
G1 X140.801 Y142.662 E.00401
; LINE_WIDTH: 0.342433
G1 X140.607 Y142.639 E.00476
; LINE_WIDTH: 0.389444
G1 X140.314 Y142.585 E.00842
G1 X139.691 Y142.412 F30000
; LINE_WIDTH: 0.134453
G1 F15000
G1 X139.529 Y142.23 E.00182
G1 X138.504 Y140.241 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X138.586 Y139.522 E.02221
G1 X138.837 Y138.844 E.02221
G1 X139.144 Y138.389 E.01688
G1 X139.041 Y138.293 E.00435
G1 X139.044 Y138.212 E.00248
G1 X109.95 Y138.212 E.89398
G3 X109.861 Y138.389 I-.163 J.029 E.00653
G1 X110.147 Y138.804 E.01549
G1 X110.409 Y139.478 E.02221
G1 X110.501 Y140.195 E.02221
G1 X110.42 Y140.913 E.02221
G1 X110.169 Y141.591 E.02221
G1 X109.861 Y142.046 E.01688
G1 X109.955 Y142.137 E.00402
G1 X109.95 Y142.224 E.00266
G1 X139.044 Y142.224 E.89398
G3 X139.144 Y142.046 I.168 J-.022 E.00671
G1 X138.858 Y141.632 E.01549
G1 X138.597 Y140.958 E.02221
G1 X138.512 Y140.3 E.02037
G1 X137.755 Y140.331 F30000
G1 F15000
G1 X137.837 Y139.431 E.02777
G1 X137.984 Y138.966 E.01499
G1 X111.021 Y138.966 E.82849
G1 X111.168 Y139.431 E.01499
G1 X111.25 Y140.104 E.02083
G1 X111.168 Y141.004 E.02777
G1 X111.021 Y141.47 E.01499
G1 X137.984 Y141.47 E.82849
G1 X137.837 Y141.004 E.01499
G1 X137.763 Y140.391 E.01898
G1 X112.345 Y140.063 F30000
; LINE_WIDTH: 0.351909
G1 F15000
G1 X112.345 Y140.372 E.00778
G1 X136.661 Y140.372 E.61224
G1 X136.661 Y140.063 E.00778
G1 X112.405 Y140.063 E.61073
G1 X112.011 Y140.218 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X111.963 Y140.715 E.01536
G1 X137.042 Y140.715 E.77061
G1 X136.994 Y140.218 E.01536
G1 X137.042 Y139.72 E.01536
G1 X111.963 Y139.72 E.77061
G1 X112.005 Y140.158 E.01351
G1 X111.624 Y140.377 F30000
G1 F15000
G1 X111.532 Y141.092 E.02217
G1 X137.473 Y141.092 E.7971
G1 X137.381 Y140.377 E.02217
G1 X137.381 Y140.059 E.00978
G1 X137.473 Y139.343 E.02217
G1 X111.532 Y139.343 E.7971
G1 X111.624 Y140.059 E.02217
G1 X111.624 Y140.317 E.00793
G1 X111.283 Y141.847 F30000
G1 F15000
G1 X138.547 Y141.846 E.83776
G1 X138.244 Y141.091 E.02499
G1 X138.13 Y140.286 E.02499
G1 X138.211 Y139.477 E.02499
G1 X138.484 Y138.711 E.02499
G1 X138.547 Y138.59 E.00419
G1 X110.458 Y138.59 E.8631
G1 X110.761 Y139.344 E.02499
G1 X110.876 Y140.15 E.02499
G1 X110.794 Y140.959 E.02499
G1 X110.521 Y141.725 E.02499
G1 X110.458 Y141.846 E.00419
G1 X111.223 Y141.847 E.0235
G1 X109.477 Y142.23 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969209
G1 F15000
G1 X109.315 Y142.412 E.00107
G1 X108.692 Y142.585 F30000
; LINE_WIDTH: 0.405156
G1 F15000
G1 X108.398 Y142.639 E.00881
; LINE_WIDTH: 0.389444
G1 X108.205 Y142.662 E.00551
; LINE_WIDTH: 0.342433
G1 X108.011 Y142.686 E.00476
; LINE_WIDTH: 0.257331
G3 X107.793 Y142.711 I-.317 J-1.798 E.00384
G3 X107.188 Y142.709 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X106.994 Y142.686 E.00327
; LINE_WIDTH: 0.295422
G1 X106.801 Y142.662 E.00401
; LINE_WIDTH: 0.342433
G1 X106.607 Y142.639 E.00476
; LINE_WIDTH: 0.389444
G1 X106.314 Y142.585 E.00842
G1 X105.473 Y142.412 F30000
; LINE_WIDTH: 0.151054
G1 F15000
G1 X105.321 Y142.015 E.00375
G1 X105.14 Y141.384 F30000
; LINE_WIDTH: 0.3918
G1 F15000
G1 X105.107 Y141.203 E.00524
; LINE_WIDTH: 0.349112
G1 X105.074 Y141.022 E.00459
; LINE_WIDTH: 0.306424
G1 X105.041 Y140.841 E.00395
; LINE_WIDTH: 0.267101
G3 X105.019 Y140.519 I2.628 J-.336 E.00589
; LINE_WIDTH: 0.228538
G1 X105.002 Y140.229 E.0044
; LINE_WIDTH: 0.261158
G3 X105.019 Y139.916 I2.594 J-.011 E.00557
; LINE_WIDTH: 0.298796
G1 X105.037 Y139.626 E.00607
; LINE_WIDTH: 0.306424
G1 X105.041 Y139.595 E.00068
; LINE_WIDTH: 0.349112
G1 X105.074 Y139.413 E.00459
; LINE_WIDTH: 0.3918
G1 X105.107 Y139.232 E.00524
; LINE_WIDTH: 0.434488
G1 X105.14 Y139.051 E.00588
G1 X105.321 Y138.421 F30000
; LINE_WIDTH: 0.151056
G1 F15000
G1 X105.473 Y138.023 E.00375
G1 X106.314 Y137.851 F30000
; LINE_WIDTH: 0.389444
G1 F15000
G1 X106.607 Y137.797 E.00842
; LINE_WIDTH: 0.342433
G1 X106.801 Y137.774 E.00476
; LINE_WIDTH: 0.295421
G1 X106.994 Y137.75 E.00401
; LINE_WIDTH: 0.24841
G1 X107.188 Y137.727 E.00327
; LINE_WIDTH: 0.257331
G3 X107.793 Y137.725 I.315 J4.984 E.01058
G3 X108.011 Y137.75 I-.098 J1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X108.205 Y137.774 E.00476
; LINE_WIDTH: 0.389444
G1 X108.398 Y137.797 E.00551
; LINE_WIDTH: 0.405155
G1 X108.692 Y137.851 E.00881
G1 X109.315 Y138.023 F30000
; LINE_WIDTH: 0.0969209
G1 F15000
G1 X109.477 Y138.206 E.00107
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.315 Y138.023 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/15
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
G3 Z1 I.945 J.767 P1  F30000
G1 X142.056 Y97.699 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X142.03 Y97.914 E.00718
G1 X108.673 Y97.914 E1.1065
G1 X108.647 Y97.699 E.00718
G1 X109.134 Y97.579 E.01663
G1 X109.605 Y97.332 E.01764
G1 X110.003 Y96.979 E.01765
G1 X110.305 Y96.541 E.01764
G1 X110.494 Y96.044 E.01765
G1 X110.558 Y95.516 E.01765
G1 X110.494 Y94.988 E.01764
G1 X110.305 Y94.49 E.01765
G1 X110.003 Y94.053 E.01765
G1 X109.605 Y93.7 E.01764
G1 X109.134 Y93.453 E.01764
G1 X108.647 Y93.333 E.01663
G1 X108.673 Y93.118 E.00718
G1 X142.03 Y93.118 E1.1065
G1 X142.056 Y93.333 E.00718
G1 X141.569 Y93.453 E.01663
G1 X141.098 Y93.7 E.01764
G1 X140.7 Y94.053 E.01765
G1 X140.398 Y94.49 E.01764
G1 X140.209 Y94.988 E.01765
G1 X140.145 Y95.516 E.01764
G1 X140.209 Y96.044 E.01764
G1 X140.398 Y96.541 E.01765
G1 X140.7 Y96.979 E.01764
G1 X141.098 Y97.332 E.01764
G1 X141.569 Y97.579 E.01764
G1 X141.998 Y97.685 E.01464
; WIPE_START
G1 F24000
G1 X142.03 Y97.914 E-.08794
G1 X140.261 Y97.914 E-.67206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.47 J1.123 P1  F30000
G1 X143.946 Y96.372 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.708 Y96.717 E.01288
G1 X143.381 Y97.007 E.01342
G1 X142.994 Y97.21 E.01342
G1 X142.57 Y97.314 E.01342
G1 X142.133 Y97.314 E.01342
G1 X141.709 Y97.21 E.01342
G1 X141.322 Y97.007 E.01342
G1 X140.996 Y96.717 E.01342
G1 X140.847 Y96.502 E.00803
G1 X140.748 Y96.358 E.00539
G1 X140.593 Y95.949 E.01342
G1 X140.54 Y95.516 E.01342
G1 X140.593 Y95.082 E.01342
G1 X140.748 Y94.674 E.01342
G1 X140.996 Y94.315 E.01342
G1 X141.322 Y94.025 E.01342
G1 X141.709 Y93.822 E.01342
G1 X142.133 Y93.717 E.01342
G1 X142.57 Y93.717 E.01342
G1 X142.994 Y93.822 E.01342
G1 X143.381 Y94.025 E.01342
G1 X143.708 Y94.315 E.01342
G1 X143.956 Y94.674 E.01342
G1 X144.11 Y95.082 E.01342
G1 X144.163 Y95.516 E.01342
G1 X144.11 Y95.949 E.01342
G1 X143.971 Y96.318 E.01211
M204 S10000
; WIPE_START
G1 F24000
G1 X143.708 Y96.717 E-.18169
G1 X143.381 Y97.007 E-.16595
M73 P64 R4
G1 X142.994 Y97.21 E-.16595
G1 X142.57 Y97.314 E-.16595
G1 X142.358 Y97.314 E-.08046
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.809 J.91 P1  F30000
G1 X144.749 Y95.188 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X144.52 Y95.202 E.00763
G1 X144.494 Y94.988 E.00717
G1 X144.305 Y94.49 E.01765
G1 X144.003 Y94.053 E.01764
G1 X143.605 Y93.7 E.01765
G1 X143.134 Y93.453 E.01764
G1 X142.647 Y93.333 E.01663
G1 X142.673 Y93.118 E.00718
G1 X144.749 Y93.118 E.06887
G1 X144.749 Y95.128 E.06669
; WIPE_START
G1 F24000
G1 X144.52 Y95.202 E-.09162
G1 X144.494 Y94.988 E-.08209
G1 X144.305 Y94.49 E-.20213
G1 X144.003 Y94.053 E-.20213
G1 X143.645 Y93.735 E-.18203
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.177 J.311 P1  F30000
G1 X144.749 Y97.914 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15476.087
G1 X142.673 Y97.914 E.06887
G1 X142.647 Y97.699 E.00718
G1 X143.134 Y97.579 E.01663
G1 X143.605 Y97.332 E.01764
G1 X144.003 Y96.979 E.01765
G1 X144.305 Y96.541 E.01764
G1 X144.494 Y96.044 E.01765
G1 X144.52 Y95.829 E.00717
G1 X144.749 Y95.843 E.00763
G1 X144.749 Y97.854 E.06669
; WIPE_START
G1 F24000
G1 X142.75 Y97.911 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.09 J-1.214 P1  F30000
G1 X106.183 Y95.202 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15476.087
G1 X105.954 Y95.188 E.00763
G1 X105.954 Y93.118 E.06868
G1 X108.03 Y93.118 E.06887
G1 X108.056 Y93.333 E.00718
G1 X107.569 Y93.453 E.01663
G1 X107.098 Y93.7 E.01764
G1 X106.7 Y94.053 E.01765
G1 X106.398 Y94.49 E.01764
G1 X106.288 Y94.779 E.01024
G2 X106.185 Y95.142 I.806 J.425 E.01261
; WIPE_START
G1 F24000
G1 X105.954 Y95.188 E-.08972
G1 X105.954 Y93.424 E-.67028
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.139 J.43 P1  F30000
G1 X107.298 Y96.985 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.996 Y96.717 E.01242
G1 X106.748 Y96.358 E.01342
G1 X106.593 Y95.949 E.01342
G1 X106.54 Y95.516 E.01342
G1 X106.593 Y95.082 E.01342
G1 X106.748 Y94.674 E.01342
G1 X106.996 Y94.315 E.01342
G1 X107.322 Y94.025 E.01342
G1 X107.709 Y93.822 E.01342
G1 X108.133 Y93.717 E.01342
G1 X108.57 Y93.717 E.01342
G1 X108.994 Y93.822 E.01342
G1 X109.381 Y94.025 E.01342
G1 X109.708 Y94.315 E.01342
G1 X109.956 Y94.674 E.01342
G1 X110.11 Y95.082 E.01342
G1 X110.163 Y95.516 E.01342
G1 X110.11 Y95.949 E.01342
G1 X109.956 Y96.358 E.01342
G1 X109.708 Y96.717 E.01342
G1 X109.381 Y97.007 E.01342
G1 X108.994 Y97.21 E.01342
G1 X108.57 Y97.314 E.01342
G1 X108.133 Y97.314 E.01342
G1 X107.709 Y97.21 E.01342
G1 X107.347 Y97.019 E.01258
M204 S10000
G1 X107.068 Y97.305 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.098 Y97.332 E.00133
G1 X107.569 Y97.579 E.01764
G1 X108.056 Y97.699 E.01663
G1 X108.03 Y97.914 E.00718
G1 X105.954 Y97.914 E.06887
G1 X105.954 Y95.843 E.06868
G1 X106.183 Y95.829 E.00763
G1 X106.209 Y96.044 E.00717
G1 X106.398 Y96.541 E.01764
G1 X106.7 Y96.979 E.01765
G1 X107.023 Y97.265 E.01432
; WIPE_START
G1 F24000
G1 X107.098 Y97.332 E-.03806
G1 X107.569 Y97.579 E-.20213
G1 X108.056 Y97.699 E-.19055
G1 X108.03 Y97.914 E-.08223
G1 X107.38 Y97.914 E-.24703
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.013 J1.217 P1  F30000
G1 X145.142 Y98.306 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X105.562 Y98.306 E1.21618
G1 X105.562 Y92.726 E.17146
G1 X145.142 Y92.726 E1.21618
G1 X145.142 Y98.246 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X143.142 Y98.249 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.652 J1.027 P1  F30000
G1 X144.546 Y97.357 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.282814
G1 F15000
G1 X143.418 Y97.71 E.02311
G1 X144.152 Y97.71 F30000
; LINE_WIDTH: 0.511103
G1 F13456.297
G1 X144.546 Y96.675 E.04224
G1 X144.946 Y95.516 F30000
; LINE_WIDTH: 0.311993
G1 F15000
G1 X144.475 Y95.516 E.01032
; LINE_WIDTH: 0.271404
G1 X144.354 Y95.409 E.00301
G1 X144.546 Y94.356 F30000
; LINE_WIDTH: 0.470044
G1 F14749.821
G1 X144.152 Y93.321 E.03854
G1 X144.546 Y93.674 F30000
; LINE_WIDTH: 0.282811
G1 F15000
G1 X143.418 Y93.321 E.02311
G1 X142.352 Y92.922 F30000
; LINE_WIDTH: 0.305083
G1 F15000
G1 X142.352 Y93.222 E.0064
; LINE_WIDTH: 0.258836
G1 X142.352 Y93.521 E.00527
G1 X141.298 Y93.342 F30000
; LINE_WIDTH: 0.108847
G1 F15000
G2 X141.144 Y93.419 I.025 J.242 E.00095
G1 X139.89 Y94.848 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X140.414 Y93.466 E.04901
G1 X110.289 Y93.466 E.99928
G1 X110.835 Y94.904 E.051
G3 X110.835 Y96.128 I-2.759 J.612 E.04093
G1 X110.289 Y97.565 E.051
G1 X140.414 Y97.565 E.99928
G1 X139.869 Y96.128 E.051
G3 X139.869 Y94.904 I2.483 J-.612 E.041
G1 X141.144 Y97.612 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.108845
G1 F15000
G2 X141.298 Y97.69 I.179 J-.165 E.00095
G1 X142.352 Y97.51 F30000
; LINE_WIDTH: 0.258835
G1 F15000
G1 X142.352 Y97.81 E.00527
; LINE_WIDTH: 0.305083
G1 X142.352 Y98.11 E.0064
G1 X137.433 Y97.158 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.061 Y97.158 E.05401
G1 X139.614 Y96.605 E.02595
G3 X139.614 Y94.426 I2.3 J-1.089 E.07468
G1 X139.061 Y93.873 E.02595
G1 X134.67 Y93.873 E.14565
G1 X131.385 Y97.158 E.15411
G1 X134.67 Y97.158 E.10897
G1 X131.385 Y93.873 E.15411
G1 X126.994 Y93.873 E.14565
G1 X123.709 Y97.158 E.15411
G1 X126.994 Y97.158 E.10897
G1 X123.709 Y93.873 E.15411
G1 X122.081 Y93.873 E.05401
G1 X120.946 Y97.158 F30000
G1 F15476.087
G1 X119.318 Y97.158 E.05401
G1 X116.033 Y93.873 E.15411
G1 X119.318 Y93.873 E.10897
G1 X116.033 Y97.158 E.15411
G1 X111.642 Y97.158 E.14565
G1 X111.089 Y96.605 E.02595
G2 X111.089 Y94.426 I-2.58 J-1.089 E.07423
G1 X111.642 Y93.873 E.02596
G1 X113.271 Y93.873 E.05401
G1 X109.559 Y93.419 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104412
G1 F15000
G2 X109.405 Y93.342 I-.179 J.165 E.00088
G1 X108.352 Y93.521 F30000
; LINE_WIDTH: 0.258835
G1 F15000
G1 X108.352 Y93.222 E.00527
; LINE_WIDTH: 0.305083
G1 X108.352 Y92.922 E.0064
G1 X107.286 Y93.321 F30000
; LINE_WIDTH: 0.265389
G1 F15000
G1 X106.157 Y93.674 E.02143
G1 X106.551 Y93.321 F30000
; LINE_WIDTH: 0.511104
G1 F13456.254
G1 X106.157 Y94.356 E.04224
G1 X106.157 Y96.675 F30000
; LINE_WIDTH: 0.511108
G1 F13456.134
G1 X106.551 Y97.71 E.04224
G1 X106.157 Y97.357 F30000
; LINE_WIDTH: 0.265392
G1 F15000
G1 X107.285 Y97.71 E.02143
G1 X108.352 Y98.11 F30000
; LINE_WIDTH: 0.305083
G1 F15000
G1 X108.352 Y97.81 E.0064
; LINE_WIDTH: 0.258836
G1 X108.352 Y97.51 E.00527
G1 X109.405 Y97.69 F30000
; LINE_WIDTH: 0.104413
G1 F15000
G2 X109.559 Y97.612 I-.025 J-.242 E.00088
; WIPE_START
G1 F24000
G1 X109.471 Y97.673 E-.46675
G1 X109.405 Y97.69 E-.29325
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.398 J1.15 P1  F30000
G1 X142.722 Y109.211 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X142.696 Y109.426 E.00718
G1 X109.339 Y109.426 E1.1065
G1 X109.313 Y109.211 E.00718
G1 X109.8 Y109.091 E.01663
G1 X110.271 Y108.844 E.01764
G1 X110.669 Y108.491 E.01765
G1 X110.971 Y108.053 E.01764
G1 X111.16 Y107.556 E.01765
G1 X111.224 Y107.028 E.01765
G1 X111.16 Y106.5 E.01764
G1 X110.971 Y106.002 E.01765
G1 X110.669 Y105.565 E.01765
G1 X110.271 Y105.212 E.01764
G1 X109.8 Y104.965 E.01764
G1 X109.313 Y104.845 E.01663
G1 X109.339 Y104.63 E.00718
G1 X142.696 Y104.63 E1.1065
G1 X142.722 Y104.845 E.00718
G1 X142.235 Y104.965 E.01663
G1 X141.764 Y105.212 E.01764
G1 X141.366 Y105.565 E.01765
G1 X141.064 Y106.002 E.01764
G1 X140.875 Y106.5 E.01765
G1 X140.811 Y107.028 E.01764
G1 X140.875 Y107.556 E.01764
G1 X141.064 Y108.053 E.01765
G1 X141.366 Y108.491 E.01764
G1 X141.764 Y108.844 E.01764
G1 X142.235 Y109.091 E.01764
G1 X142.664 Y109.197 E.01464
; WIPE_START
G1 F24000
G1 X142.696 Y109.426 E-.08794
G1 X140.927 Y109.426 E-.67206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.47 J1.123 P1  F30000
G1 X144.612 Y107.884 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.374 Y108.229 E.01288
G1 X144.047 Y108.519 E.01342
G1 X143.66 Y108.722 E.01342
G1 X143.236 Y108.826 E.01342
G1 X142.799 Y108.826 E.01342
G1 X142.375 Y108.722 E.01342
G1 X141.989 Y108.519 E.01342
G1 X141.662 Y108.229 E.01342
G1 X141.513 Y108.014 E.00803
G1 X141.414 Y107.87 E.00539
G1 X141.259 Y107.461 E.01342
G1 X141.206 Y107.028 E.01342
G1 X141.259 Y106.594 E.01342
G1 X141.414 Y106.186 E.01342
G1 X141.662 Y105.827 E.01342
G1 X141.989 Y105.537 E.01342
G1 X142.375 Y105.334 E.01342
G1 X142.799 Y105.23 E.01342
G1 X143.236 Y105.23 E.01342
G1 X143.66 Y105.334 E.01342
G1 X144.047 Y105.537 E.01342
G1 X144.374 Y105.827 E.01342
G1 X144.622 Y106.186 E.01342
G1 X144.777 Y106.594 E.01342
G1 X144.829 Y107.028 E.01342
G1 X144.777 Y107.461 E.01342
G1 X144.637 Y107.83 E.01211
M204 S10000
; WIPE_START
G1 F24000
G1 X144.374 Y108.229 E-.18169
G1 X144.047 Y108.519 E-.16595
G1 X143.66 Y108.722 E-.16595
G1 X143.236 Y108.826 E-.16595
G1 X143.024 Y108.826 E-.08046
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.809 J.91 P1  F30000
G1 X145.416 Y106.7 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.186 Y106.714 E.00763
G1 X145.16 Y106.5 E.00717
G1 X144.971 Y106.002 E.01765
G1 X144.669 Y105.565 E.01764
G1 X144.271 Y105.212 E.01765
G1 X143.8 Y104.965 E.01764
G1 X143.313 Y104.845 E.01663
G1 X143.339 Y104.63 E.00718
G1 X145.416 Y104.63 E.06887
G1 X145.416 Y106.64 E.06669
; WIPE_START
G1 F24000
G1 X145.186 Y106.714 E-.09162
G1 X145.16 Y106.5 E-.08209
G1 X144.971 Y106.002 E-.20213
G1 X144.669 Y105.565 E-.20213
G1 X144.311 Y105.247 E-.18203
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.177 J.311 P1  F30000
G1 X145.416 Y109.426 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15476.087
G1 X143.339 Y109.426 E.06887
G1 X143.313 Y109.211 E.00718
G1 X143.8 Y109.091 E.01663
G1 X144.271 Y108.844 E.01764
G1 X144.669 Y108.491 E.01765
G1 X144.971 Y108.053 E.01764
G1 X145.16 Y107.556 E.01765
G1 X145.186 Y107.341 E.00717
G1 X145.416 Y107.355 E.00763
G1 X145.416 Y109.366 E.06669
; WIPE_START
G1 F24000
G1 X143.416 Y109.424 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.09 J-1.214 P1  F30000
G1 X106.849 Y106.714 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15476.087
G1 X106.62 Y106.7 E.00763
G1 X106.62 Y104.63 E.06868
G1 X108.696 Y104.63 E.06887
G1 X108.722 Y104.845 E.00718
G1 X108.235 Y104.965 E.01663
G1 X107.764 Y105.212 E.01764
G1 X107.366 Y105.565 E.01765
G1 X107.064 Y106.002 E.01764
G1 X106.954 Y106.291 E.01024
G2 X106.851 Y106.654 I.806 J.425 E.01261
; WIPE_START
G1 F24000
G1 X106.62 Y106.7 E-.08972
G1 X106.62 Y104.937 E-.67028
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.139 J.43 P1  F30000
G1 X107.964 Y108.497 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.662 Y108.229 E.01242
G1 X107.414 Y107.87 E.01342
G1 X107.259 Y107.461 E.01342
G1 X107.206 Y107.028 E.01342
G1 X107.259 Y106.594 E.01342
G1 X107.414 Y106.186 E.01342
G1 X107.662 Y105.827 E.01342
G1 X107.989 Y105.537 E.01342
G1 X108.375 Y105.334 E.01342
G1 X108.799 Y105.23 E.01342
G1 X109.236 Y105.23 E.01342
G1 X109.66 Y105.334 E.01342
G1 X110.047 Y105.537 E.01342
G1 X110.374 Y105.827 E.01342
G1 X110.622 Y106.186 E.01342
G1 X110.777 Y106.594 E.01342
G1 X110.829 Y107.028 E.01342
G1 X110.777 Y107.461 E.01342
G1 X110.622 Y107.87 E.01342
G1 X110.374 Y108.229 E.01342
G1 X110.047 Y108.519 E.01342
G1 X109.66 Y108.722 E.01342
G1 X109.236 Y108.826 E.01342
G1 X108.799 Y108.826 E.01342
G1 X108.375 Y108.722 E.01342
G1 X108.013 Y108.531 E.01258
M204 S10000
G1 X107.734 Y108.817 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.764 Y108.844 E.00133
G1 X108.235 Y109.091 E.01764
G1 X108.722 Y109.211 E.01663
G1 X108.696 Y109.426 E.00718
G1 X106.62 Y109.426 E.06887
G1 X106.62 Y107.355 E.06868
G1 X106.849 Y107.341 E.00763
G1 X106.875 Y107.556 E.00717
G1 X107.064 Y108.053 E.01764
G1 X107.366 Y108.491 E.01765
G1 X107.689 Y108.777 E.01432
; WIPE_START
G1 F24000
G1 X107.764 Y108.844 E-.03806
G1 X108.235 Y109.091 E-.20213
G1 X108.722 Y109.211 E-.19055
G1 X108.696 Y109.426 E-.08223
G1 X108.046 Y109.426 E-.24703
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.013 J1.217 P1  F30000
G1 X145.808 Y109.818 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.228 Y109.818 E1.21618
G1 X106.228 Y104.238 E.17146
G1 X145.808 Y104.238 E1.21618
G1 X145.808 Y109.758 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X143.808 Y109.761 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.652 J1.027 P1  F30000
G1 X145.212 Y108.869 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.282814
G1 F15000
G1 X144.084 Y109.222 E.02311
G1 X144.818 Y109.222 F30000
; LINE_WIDTH: 0.511103
G1 F13456.297
G1 X145.212 Y108.188 E.04224
G1 X145.612 Y107.028 F30000
; LINE_WIDTH: 0.311993
G1 F15000
G1 X145.141 Y107.028 E.01032
; LINE_WIDTH: 0.271404
G1 X145.02 Y106.921 E.00301
G1 X145.212 Y105.868 F30000
; LINE_WIDTH: 0.470044
G1 F14749.821
G1 X144.818 Y104.833 E.03854
G1 X145.212 Y105.187 F30000
; LINE_WIDTH: 0.282811
G1 F15000
G1 X144.084 Y104.833 E.02311
G1 X143.018 Y104.434 F30000
; LINE_WIDTH: 0.305083
G1 F15000
M73 P65 R4
G1 X143.018 Y104.734 E.0064
; LINE_WIDTH: 0.258836
G1 X143.018 Y105.033 E.00527
G1 X141.964 Y104.854 F30000
; LINE_WIDTH: 0.108847
G1 F15000
G2 X141.81 Y104.931 I.025 J.242 E.00095
G1 X140.556 Y106.36 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X141.08 Y104.978 E.04901
G1 X110.955 Y104.978 E.99928
G1 X111.501 Y106.416 E.051
G3 X111.501 Y107.64 I-2.759 J.612 E.04093
G1 X110.955 Y109.078 E.051
G1 X141.08 Y109.078 E.99928
G1 X140.535 Y107.64 E.051
G3 X140.535 Y106.416 I2.483 J-.612 E.041
G1 X141.81 Y109.124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.108845
G1 F15000
G2 X141.964 Y109.202 I.179 J-.165 E.00095
G1 X143.018 Y109.022 F30000
; LINE_WIDTH: 0.258835
G1 F15000
G1 X143.018 Y109.322 E.00527
; LINE_WIDTH: 0.305083
G1 X143.018 Y109.622 E.0064
G1 X138.099 Y108.67 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.727 Y108.67 E.05401
G1 X140.28 Y108.117 E.02595
G3 X140.28 Y105.939 I2.3 J-1.089 E.07468
G1 X139.727 Y105.385 E.02595
G1 X135.336 Y105.385 E.14565
G1 X132.051 Y108.67 E.15411
G1 X135.336 Y108.67 E.10897
G1 X132.051 Y105.385 E.15411
G1 X127.66 Y105.385 E.14565
G1 X124.375 Y108.67 E.15411
G1 X127.66 Y108.67 E.10897
G1 X124.375 Y105.385 E.15411
G1 X122.747 Y105.385 E.05401
G1 X121.613 Y108.67 F30000
G1 F15476.087
G1 X119.984 Y108.67 E.05401
G1 X116.699 Y105.385 E.15411
G1 X119.984 Y105.385 E.10897
G1 X116.699 Y108.67 E.15411
G1 X112.308 Y108.67 E.14565
G1 X111.755 Y108.117 E.02595
G2 X111.755 Y105.939 I-2.58 J-1.089 E.07423
G1 X112.308 Y105.385 E.02596
G1 X113.937 Y105.385 E.05401
G1 X110.225 Y104.931 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104412
G1 F15000
G2 X110.071 Y104.854 I-.179 J.165 E.00088
G1 X109.018 Y105.033 F30000
; LINE_WIDTH: 0.258835
G1 F15000
G1 X109.018 Y104.734 E.00527
; LINE_WIDTH: 0.305083
G1 X109.018 Y104.434 E.0064
G1 X107.952 Y104.833 F30000
; LINE_WIDTH: 0.265389
G1 F15000
G1 X106.823 Y105.186 E.02143
G1 X107.217 Y104.833 F30000
; LINE_WIDTH: 0.511104
G1 F13456.254
G1 X106.823 Y105.868 E.04224
G1 X106.823 Y108.188 F30000
; LINE_WIDTH: 0.511108
G1 F13456.134
G1 X107.217 Y109.222 E.04224
G1 X106.823 Y108.869 F30000
; LINE_WIDTH: 0.265392
G1 F15000
G1 X107.952 Y109.222 E.02143
G1 X109.018 Y109.622 F30000
; LINE_WIDTH: 0.305083
G1 F15000
G1 X109.018 Y109.322 E.0064
; LINE_WIDTH: 0.258836
G1 X109.018 Y109.022 E.00527
G1 X110.071 Y109.202 F30000
; LINE_WIDTH: 0.104413
G1 F15000
G2 X110.225 Y109.124 I-.025 J-.242 E.00088
; WIPE_START
G1 F24000
G1 X110.137 Y109.186 E-.46675
G1 X110.071 Y109.202 E-.29325
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.544 J1.089 P1  F30000
G1 X136.503 Y122.406 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X136.376 Y122.473 E.00478
G1 X135.905 Y122.89 E.02084
G1 X135.548 Y123.407 E.02084
G1 X135.325 Y123.995 E.02084
G1 X135.25 Y124.618 E.02084
G1 X135.325 Y125.242 E.02084
G1 X135.548 Y125.83 E.02084
G1 X135.905 Y126.347 E.02084
G1 X136.376 Y126.763 E.02084
G1 X136.503 Y126.831 E.00478
G1 X136.457 Y127.016 E.00635
G1 X105.255 Y127.016 E1.03504
G1 X105.209 Y126.831 E.00635
G1 X105.337 Y126.763 E.00478
G1 X105.807 Y126.347 E.02084
G1 X106.164 Y125.83 E.02084
G1 X106.387 Y125.242 E.02084
G1 X106.463 Y124.618 E.02084
G1 X106.387 Y123.995 E.02084
G1 X106.164 Y123.407 E.02084
G1 X105.807 Y122.89 E.02084
G1 X105.337 Y122.473 E.02084
G1 X105.209 Y122.406 E.00478
G1 X105.255 Y122.22 E.00635
G1 X136.457 Y122.22 E1.03504
G1 X136.489 Y122.348 E.00436
; WIPE_START
G1 F24000
G1 X136.376 Y122.473 E-.0642
G1 X135.905 Y122.89 E-.23878
G1 X135.548 Y123.407 E-.23877
G1 X135.345 Y123.944 E-.21825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.038 J1.216 P1  F30000
G1 X140.004 Y124.091 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X140.068 Y124.618 E.01633
G1 X140.003 Y125.148 E.01638
G1 X139.814 Y125.646 E.01638
G1 X139.512 Y126.085 E.01638
G1 X139.112 Y126.438 E.01638
G1 X138.64 Y126.686 E.01638
G1 X138.123 Y126.814 E.01638
G1 X137.59 Y126.814 E.01638
G1 X137.072 Y126.686 E.01638
G1 X136.6 Y126.438 E.01638
G1 X136.201 Y126.085 E.01638
G1 X135.898 Y125.646 E.01638
G1 X135.709 Y125.148 E.01638
G1 X135.645 Y124.618 E.01638
G1 X135.709 Y124.089 E.01638
G1 X135.898 Y123.591 E.01638
G1 X136.201 Y123.152 E.01638
G1 X136.6 Y122.798 E.01638
G1 X137.072 Y122.551 E.01638
G1 X137.59 Y122.423 E.01638
G1 X138.123 Y122.423 E.01638
G1 X138.64 Y122.551 E.01638
G1 X139.112 Y122.798 E.01638
G1 X139.512 Y123.152 E.01638
G1 X139.814 Y123.591 E.01638
G1 X139.983 Y124.035 E.01459
M204 S10000
G1 X140.083 Y123.289 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.807 Y122.89 E.01608
G1 X139.337 Y122.473 E.02084
G1 X139.209 Y122.406 E.00478
G1 X139.255 Y122.22 E.00635
G1 X140.254 Y122.22 E.03314
G1 X140.254 Y123.235 E.03367
G1 X140.14 Y123.271 E.00397
; WIPE_START
G1 F24000
G1 X139.807 Y122.89 E-.19221
G1 X139.337 Y122.473 E-.23877
G1 X139.209 Y122.406 E-.0548
G1 X139.255 Y122.22 E-.07271
G1 X139.785 Y122.22 E-.2015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.213 J.097 P1  F30000
G1 X140.083 Y125.948 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15476.087
G1 X140.254 Y126.001 E.00596
G1 X140.254 Y127.016 E.03367
G1 X139.255 Y127.016 E.03314
G1 X139.209 Y126.831 E.00635
G1 X139.337 Y126.763 E.00478
G1 X139.807 Y126.347 E.02084
G1 X140.048 Y125.997 E.01409
; WIPE_START
G1 F24000
G1 X140.254 Y126.001 E-.07817
G1 X140.254 Y127.016 E-.38568
G1 X139.475 Y127.016 E-.29616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.105 J-1.212 P1  F30000
G1 X106.005 Y124.105 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.068 Y124.618 E.0159
G1 X106.003 Y125.148 E.01638
G1 X105.814 Y125.646 E.01638
G1 X105.512 Y126.085 E.01638
G1 X105.112 Y126.438 E.01638
G1 X104.64 Y126.686 E.01638
G1 X104.123 Y126.814 E.01638
G1 X103.59 Y126.814 E.01638
G1 X103.072 Y126.686 E.01638
G1 X102.6 Y126.438 E.01638
G1 X102.201 Y126.085 E.01638
G1 X101.898 Y125.646 E.01638
G1 X101.709 Y125.148 E.01638
G1 X101.645 Y124.618 E.01638
G1 X101.709 Y124.089 E.01638
G1 X101.898 Y123.591 E.01638
G1 X102.201 Y123.152 E.01638
G1 X102.6 Y122.798 E.01638
G1 X103.072 Y122.551 E.01638
G1 X103.59 Y122.423 E.01638
G1 X104.123 Y122.423 E.01638
G1 X104.64 Y122.551 E.01638
G1 X105.112 Y122.798 E.01638
G1 X105.512 Y123.152 E.01638
G1 X105.814 Y123.591 E.01638
G1 X105.988 Y124.048 E.01502
M204 S10000
; WIPE_START
G1 F24000
G1 X106.068 Y124.618 E-.21901
G1 X106.003 Y125.148 E-.20259
G1 X105.814 Y125.646 E-.2026
G1 X105.611 Y125.94 E-.1358
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.914 J-.804 P1  F30000
G1 X102.503 Y122.406 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X102.376 Y122.473 E.00478
G1 X101.905 Y122.89 E.02084
G1 X101.63 Y123.289 E.01608
G1 X101.458 Y123.235 E.00596
G1 X101.458 Y122.22 E.03367
G1 X102.457 Y122.22 E.03314
G1 X102.489 Y122.348 E.00436
; WIPE_START
G1 F24000
G1 X102.376 Y122.473 E-.0642
G1 X101.905 Y122.89 E-.23878
G1 X101.63 Y123.289 E-.18419
G1 X101.458 Y123.235 E-.06829
G1 X101.458 Y122.697 E-.20454
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.18 J.298 P1  F30000
G1 X102.503 Y126.831 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15476.087
G1 X102.457 Y127.016 E.00635
G1 X101.458 Y127.016 E.03314
G1 X101.458 Y126.001 E.03367
G1 X101.63 Y125.948 E.00596
G1 X101.905 Y126.347 E.01608
G1 X102.376 Y126.763 E.02084
G1 X102.45 Y126.803 E.00279
; WIPE_START
G1 F24000
G1 X102.457 Y127.016 E-.08125
G1 X101.458 Y127.016 E-.37968
G1 X101.458 Y126.229 E-.29907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.037 J1.216 P1  F30000
G1 X140.646 Y127.408 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X101.066 Y127.408 E1.21618
G1 X101.066 Y121.828 E.17146
G1 X140.646 Y121.828 E1.21618
G1 X140.646 Y127.348 E.16961
M204 S10000
G1 X139.886 Y126.813 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151056
G1 F15000
G1 X140.038 Y126.415 E.00375
G1 X140.219 Y125.785 F30000
; LINE_WIDTH: 0.434488
G1 F15000
G1 X140.252 Y125.604 E.00588
; LINE_WIDTH: 0.3918
G1 X140.285 Y125.423 E.00524
; LINE_WIDTH: 0.349112
G1 X140.318 Y125.242 E.00459
; LINE_WIDTH: 0.306424
G1 X140.322 Y125.21 E.00068
; LINE_WIDTH: 0.298796
G1 X140.34 Y124.92 E.00607
; LINE_WIDTH: 0.261158
G2 X140.357 Y124.607 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X140.34 Y124.317 E.0044
; LINE_WIDTH: 0.267101
G2 X140.318 Y123.995 I-2.649 J.015 E.00589
; LINE_WIDTH: 0.306424
G1 X140.285 Y123.814 E.00395
; LINE_WIDTH: 0.349113
G1 X140.252 Y123.633 E.00459
; LINE_WIDTH: 0.391802
G1 X140.219 Y123.452 E.00524
G1 X140.038 Y122.822 F30000
; LINE_WIDTH: 0.141574
G1 F15000
G1 X139.886 Y122.424 E.00342
G1 X139.045 Y122.252 F30000
; LINE_WIDTH: 0.405156
G1 F15000
G1 X138.752 Y122.198 E.00881
; LINE_WIDTH: 0.389444
G1 X138.558 Y122.174 E.00551
; LINE_WIDTH: 0.342433
G1 X138.365 Y122.151 E.00476
; LINE_WIDTH: 0.257331
G2 X138.147 Y122.126 I-.316 J1.798 E.00384
G2 X137.541 Y122.127 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X137.348 Y122.151 E.00327
; LINE_WIDTH: 0.295421
G1 X137.154 Y122.174 E.00401
; LINE_WIDTH: 0.342432
G1 X136.96 Y122.198 E.00476
; LINE_WIDTH: 0.389442
G1 X136.667 Y122.252 E.00842
G1 X136.044 Y122.424 F30000
; LINE_WIDTH: 0.134452
G1 F15000
G1 X135.882 Y122.607 E.00182
; WIPE_START
G1 F24000
G1 X136.044 Y122.424 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.216 J-.047 P1  F30000
G1 X135.882 Y126.63 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.134452
G1 F15000
G1 X136.044 Y126.813 E.00182
G1 X136.667 Y126.985 F30000
; LINE_WIDTH: 0.389442
G1 F15000
G1 X136.96 Y127.039 E.00843
; LINE_WIDTH: 0.342432
G1 X137.154 Y127.063 E.00476
; LINE_WIDTH: 0.295421
G1 X137.348 Y127.086 E.00401
; LINE_WIDTH: 0.24841
G1 X137.541 Y127.11 E.00327
; LINE_WIDTH: 0.257331
G2 X138.147 Y127.111 I.315 J-4.984 E.01058
G2 X138.365 Y127.086 I-.098 J-1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X138.558 Y127.063 E.00476
; LINE_WIDTH: 0.389444
G1 X138.752 Y127.039 E.00551
; LINE_WIDTH: 0.405156
G1 X139.045 Y126.985 E.00881
G1 X112.759 Y122.569 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.131 Y122.569 E.05401
G1 X115.23 Y126.668 E.19231
G1 X118.807 Y126.668 E.11864
G1 X122.906 Y122.569 E.19231
G1 X126.482 Y122.569 E.11864
G1 X130.582 Y126.668 E.19231
G1 X134.158 Y126.668 E.11864
G1 X135.127 Y125.7 E.04542
G3 X135.127 Y123.537 I2.288 J-1.082 E.07414
G1 X134.158 Y122.569 E.04542
G1 X130.582 Y122.569 E.11864
G1 X126.482 Y126.668 E.19231
G1 X122.906 Y126.668 E.11864
G1 X118.807 Y122.569 E.19231
G1 X115.23 Y122.569 E.11864
G1 X111.131 Y126.668 E.19231
G1 X107.554 Y126.668 E.11864
G1 X106.586 Y125.7 E.04542
G1 X106.728 Y125.326 E.01326
G2 X106.586 Y123.537 I-3.079 J-.656 E.06038
G1 X107.554 Y122.569 E.04542
G1 X109.182 Y122.569 E.05401
G1 X105.83 Y122.607 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969209
G1 F15000
G1 X105.668 Y122.424 E.00107
G1 X105.045 Y122.252 F30000
; LINE_WIDTH: 0.405156
G1 F15000
G1 X104.752 Y122.198 E.00881
; LINE_WIDTH: 0.389444
G1 X104.558 Y122.174 E.00551
; LINE_WIDTH: 0.342433
G1 X104.365 Y122.151 E.00476
; LINE_WIDTH: 0.257331
G2 X104.147 Y122.126 I-.317 J1.798 E.00384
G2 X103.541 Y122.127 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X103.348 Y122.151 E.00327
; LINE_WIDTH: 0.295421
G1 X103.154 Y122.174 E.00401
; LINE_WIDTH: 0.342432
G1 X102.96 Y122.198 E.00476
; LINE_WIDTH: 0.389442
G1 X102.667 Y122.252 E.00842
G1 X101.826 Y122.424 F30000
; LINE_WIDTH: 0.151055
G1 F15000
G1 X101.675 Y122.822 E.00375
G1 X101.494 Y123.452 F30000
; LINE_WIDTH: 0.434489
G1 F15000
G1 X101.46 Y123.633 E.00588
; LINE_WIDTH: 0.391801
G1 X101.427 Y123.814 E.00524
; LINE_WIDTH: 0.349113
G1 X101.394 Y123.995 E.00459
; LINE_WIDTH: 0.306424
G1 X101.39 Y124.026 E.00068
; LINE_WIDTH: 0.298796
G1 X101.373 Y124.317 E.00607
; LINE_WIDTH: 0.261158
G2 X101.355 Y124.63 I2.576 J.302 E.00557
; LINE_WIDTH: 0.228538
G1 X101.373 Y124.92 E.0044
; LINE_WIDTH: 0.267101
G2 X101.394 Y125.242 I2.649 J-.015 E.00589
; LINE_WIDTH: 0.306424
G1 X101.427 Y125.423 E.00395
; LINE_WIDTH: 0.349112
G1 X101.46 Y125.604 E.00459
; LINE_WIDTH: 0.3918
G1 X101.494 Y125.785 E.00524
G1 X101.675 Y126.415 F30000
; LINE_WIDTH: 0.151058
G1 F15000
G1 X101.826 Y126.813 E.00375
G1 X102.667 Y126.985 F30000
; LINE_WIDTH: 0.389442
G1 F15000
G1 X102.96 Y127.039 E.00842
; LINE_WIDTH: 0.342433
G1 X103.154 Y127.063 E.00476
; LINE_WIDTH: 0.295422
G1 X103.348 Y127.086 E.00401
; LINE_WIDTH: 0.24841
G1 X103.541 Y127.11 E.00327
; LINE_WIDTH: 0.257331
G2 X104.147 Y127.111 I.315 J-4.984 E.01058
G2 X104.365 Y127.086 I-.098 J-1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X104.558 Y127.063 E.00476
; LINE_WIDTH: 0.389444
G1 X104.752 Y127.039 E.00551
; LINE_WIDTH: 0.405156
G1 X105.045 Y126.985 E.00881
G1 X105.668 Y126.813 F30000
; LINE_WIDTH: 0.096921
G1 F15000
G1 X105.83 Y126.63 E.00107
; WIPE_START
G1 F24000
G1 X105.668 Y126.813 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.376 J1.158 P1  F30000
G1 X140.15 Y138.006 Z1.2
G1 Z.8
M73 P66 R4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X140.022 Y138.073 E.00478
G1 X139.552 Y138.489 E.02084
G1 X139.195 Y139.007 E.02084
G1 X138.972 Y139.594 E.02084
G1 X138.896 Y140.218 E.02084
G1 X138.972 Y140.842 E.02084
G1 X139.195 Y141.429 E.02084
G1 X139.552 Y141.946 E.02084
G1 X140.022 Y142.363 E.02084
G1 X140.15 Y142.43 E.00478
G1 X140.104 Y142.616 E.00635
G1 X108.901 Y142.616 E1.03504
G1 X108.856 Y142.43 E.00635
G1 X108.983 Y142.363 E.00478
G1 X109.454 Y141.946 E.02084
G1 X109.811 Y141.429 E.02084
G1 X110.033 Y140.842 E.02084
G1 X110.109 Y140.218 E.02084
G1 X110.033 Y139.594 E.02084
G1 X109.811 Y139.007 E.02084
G1 X109.454 Y138.489 E.02084
G1 X108.983 Y138.073 E.02084
G1 X108.856 Y138.006 E.00478
G1 X108.901 Y137.82 E.00635
G1 X140.104 Y137.82 E1.03504
G1 X140.135 Y137.947 E.00436
; WIPE_START
G1 F24000
G1 X140.022 Y138.073 E-.0642
G1 X139.552 Y138.489 E-.23878
G1 X139.195 Y139.007 E-.23877
G1 X138.991 Y139.544 E-.21825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.038 J1.216 P1  F30000
G1 X143.65 Y139.69 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.714 Y140.218 E.01633
G1 X143.65 Y140.747 E.01638
G1 X143.461 Y141.246 E.01638
G1 X143.158 Y141.684 E.01638
G1 X142.759 Y142.038 E.01638
G1 X142.287 Y142.286 E.01638
G1 X141.769 Y142.413 E.01638
G1 X141.236 Y142.413 E.01638
G1 X140.719 Y142.286 E.01638
G1 X140.246 Y142.038 E.01638
G1 X139.847 Y141.684 E.01638
G1 X139.545 Y141.246 E.01638
G1 X139.355 Y140.747 E.01638
G1 X139.291 Y140.218 E.01638
G1 X139.355 Y139.689 E.01638
G1 X139.545 Y139.19 E.01638
G1 X139.847 Y138.751 E.01638
G1 X140.246 Y138.398 E.01638
G1 X140.719 Y138.15 E.01638
G1 X141.236 Y138.022 E.01638
G1 X141.769 Y138.022 E.01638
G1 X142.287 Y138.15 E.01638
G1 X142.759 Y138.398 E.01638
G1 X143.158 Y138.751 E.01638
G1 X143.461 Y139.19 E.01638
G1 X143.629 Y139.634 E.01459
M204 S10000
G1 X143.729 Y138.888 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.454 Y138.489 E.01608
G1 X142.983 Y138.073 E.02084
G1 X142.856 Y138.006 E.00478
G1 X142.901 Y137.82 E.00635
G1 X143.901 Y137.82 E.03314
G1 X143.901 Y138.835 E.03367
G1 X143.786 Y138.87 E.00397
; WIPE_START
G1 F24000
G1 X143.454 Y138.489 E-.19221
G1 X142.983 Y138.073 E-.23877
G1 X142.856 Y138.006 E-.0548
G1 X142.901 Y137.82 E-.07271
G1 X143.432 Y137.82 E-.2015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.213 J.097 P1  F30000
G1 X143.729 Y141.547 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15476.087
G1 X143.901 Y141.601 E.00596
G1 X143.901 Y142.616 E.03367
G1 X142.901 Y142.616 E.03314
G1 X142.856 Y142.43 E.00635
G1 X142.983 Y142.363 E.00478
G1 X143.454 Y141.946 E.02084
G1 X143.695 Y141.597 E.01409
; WIPE_START
G1 F24000
G1 X143.901 Y141.601 E-.07817
G1 X143.901 Y142.616 E-.38568
G1 X143.121 Y142.616 E-.29616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.105 J-1.212 P1  F30000
G1 X109.652 Y139.704 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X109.714 Y140.218 E.0159
G1 X109.65 Y140.747 E.01638
G1 X109.461 Y141.246 E.01638
G1 X109.158 Y141.684 E.01638
G1 X108.759 Y142.038 E.01638
G1 X108.287 Y142.286 E.01638
G1 X107.769 Y142.413 E.01638
G1 X107.236 Y142.413 E.01638
G1 X106.719 Y142.286 E.01638
G1 X106.246 Y142.038 E.01638
G1 X105.847 Y141.684 E.01638
G1 X105.545 Y141.246 E.01638
G1 X105.355 Y140.747 E.01638
G1 X105.291 Y140.218 E.01638
G1 X105.355 Y139.689 E.01638
G1 X105.545 Y139.19 E.01638
G1 X105.847 Y138.751 E.01638
G1 X106.246 Y138.398 E.01638
G1 X106.719 Y138.15 E.01638
G1 X107.236 Y138.022 E.01638
G1 X107.769 Y138.022 E.01638
G1 X108.287 Y138.15 E.01638
G1 X108.759 Y138.398 E.01638
G1 X109.158 Y138.751 E.01638
G1 X109.461 Y139.19 E.01638
G1 X109.634 Y139.647 E.01502
M204 S10000
; WIPE_START
G1 F24000
G1 X109.714 Y140.218 E-.21901
G1 X109.65 Y140.747 E-.20259
G1 X109.461 Y141.246 E-.2026
G1 X109.258 Y141.54 E-.1358
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.914 J-.804 P1  F30000
G1 X106.15 Y138.006 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X106.022 Y138.073 E.00478
G1 X105.552 Y138.489 E.02084
G1 X105.276 Y138.888 E.01608
G1 X105.105 Y138.835 E.00596
G1 X105.105 Y137.82 E.03367
G1 X106.104 Y137.82 E.03314
G1 X106.135 Y137.947 E.00436
; WIPE_START
G1 F24000
G1 X106.022 Y138.073 E-.0642
G1 X105.552 Y138.489 E-.23878
G1 X105.276 Y138.888 E-.18419
G1 X105.105 Y138.835 E-.06829
G1 X105.105 Y138.297 E-.20454
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.18 J.298 P1  F30000
G1 X106.15 Y142.43 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15476.087
G1 X106.104 Y142.616 E.00635
G1 X105.105 Y142.616 E.03314
G1 X105.105 Y141.601 E.03367
G1 X105.276 Y141.547 E.00596
G1 X105.552 Y141.946 E.01608
G1 X106.022 Y142.363 E.02084
G1 X106.097 Y142.402 E.00279
; WIPE_START
G1 F24000
G1 X106.104 Y142.616 E-.08125
G1 X105.105 Y142.616 E-.37968
G1 X105.105 Y141.829 E-.29907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.037 J1.216 P1  F30000
G1 X144.293 Y143.008 Z1.2
G1 Z.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X104.713 Y143.008 E1.21618
G1 X104.713 Y137.428 E.17146
G1 X144.293 Y137.428 E1.21618
G1 X144.293 Y142.948 E.16961
M204 S10000
G1 X143.533 Y142.412 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151056
G1 F15000
G1 X143.684 Y142.015 E.00375
G1 X143.865 Y141.384 F30000
; LINE_WIDTH: 0.434488
G1 F15000
G1 X143.899 Y141.203 E.00588
; LINE_WIDTH: 0.3918
G1 X143.932 Y141.022 E.00524
; LINE_WIDTH: 0.349112
G1 X143.965 Y140.841 E.00459
; LINE_WIDTH: 0.306424
G1 X143.969 Y140.81 E.00068
; LINE_WIDTH: 0.298796
G1 X143.986 Y140.519 E.00607
; LINE_WIDTH: 0.261158
G2 X144.004 Y140.207 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X143.986 Y139.916 E.0044
; LINE_WIDTH: 0.267101
G2 X143.965 Y139.595 I-2.649 J.015 E.00589
; LINE_WIDTH: 0.306424
G1 X143.932 Y139.413 E.00395
; LINE_WIDTH: 0.349113
G1 X143.899 Y139.232 E.00459
; LINE_WIDTH: 0.391802
G1 X143.865 Y139.051 E.00524
G1 X143.684 Y138.421 F30000
; LINE_WIDTH: 0.141574
G1 F15000
G1 X143.533 Y138.023 E.00342
G1 X142.692 Y137.851 F30000
; LINE_WIDTH: 0.405156
G1 F15000
G1 X142.398 Y137.797 E.00881
; LINE_WIDTH: 0.389444
G1 X142.205 Y137.774 E.00551
; LINE_WIDTH: 0.342433
G1 X142.011 Y137.75 E.00476
; LINE_WIDTH: 0.257331
G2 X141.793 Y137.725 I-.316 J1.798 E.00384
G2 X141.188 Y137.727 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X140.994 Y137.75 E.00327
; LINE_WIDTH: 0.295421
G1 X140.801 Y137.774 E.00401
; LINE_WIDTH: 0.342432
G1 X140.607 Y137.797 E.00476
; LINE_WIDTH: 0.389442
G1 X140.314 Y137.851 E.00842
G1 X139.691 Y138.023 F30000
; LINE_WIDTH: 0.134452
G1 F15000
G1 X139.529 Y138.206 E.00182
; WIPE_START
G1 F24000
G1 X139.691 Y138.023 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.216 J-.047 P1  F30000
G1 X139.529 Y142.23 Z1.2
G1 Z.8
G1 E.8 F1800
; LINE_WIDTH: 0.134452
G1 F15000
G1 X139.691 Y142.412 E.00182
G1 X140.314 Y142.585 F30000
; LINE_WIDTH: 0.389442
G1 F15000
G1 X140.607 Y142.639 E.00843
; LINE_WIDTH: 0.342432
G1 X140.801 Y142.662 E.00476
; LINE_WIDTH: 0.295421
G1 X140.994 Y142.686 E.00401
; LINE_WIDTH: 0.24841
G1 X141.188 Y142.709 E.00327
; LINE_WIDTH: 0.257331
G2 X141.793 Y142.711 I.315 J-4.984 E.01058
G2 X142.011 Y142.686 I-.098 J-1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X142.205 Y142.662 E.00476
; LINE_WIDTH: 0.389444
G1 X142.398 Y142.639 E.00551
; LINE_WIDTH: 0.405156
G1 X142.692 Y142.585 E.00881
G1 X116.405 Y138.168 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X114.777 Y138.168 E.05401
G1 X118.876 Y142.267 E.19231
G1 X122.453 Y142.267 E.11864
G1 X126.552 Y138.168 E.19231
G1 X130.129 Y138.168 E.11864
G1 X134.228 Y142.267 E.19231
G1 X137.805 Y142.267 E.11864
G1 X138.773 Y141.299 E.04542
G3 X138.773 Y139.136 I2.288 J-1.082 E.07414
G1 X137.805 Y138.168 E.04542
G1 X134.228 Y138.168 E.11864
G1 X130.129 Y142.267 E.19231
G1 X126.552 Y142.267 E.11864
G1 X122.453 Y138.168 E.19231
G1 X118.876 Y138.168 E.11864
G1 X114.777 Y142.267 E.19231
G1 X111.2 Y142.267 E.11864
G1 X110.232 Y141.299 E.04542
G1 X110.374 Y140.926 E.01326
G2 X110.232 Y139.136 I-3.079 J-.656 E.06038
G1 X111.2 Y138.168 E.04542
G1 X112.829 Y138.168 E.05401
G1 X109.477 Y138.206 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969209
G1 F15000
G1 X109.315 Y138.023 E.00107
G1 X108.692 Y137.851 F30000
; LINE_WIDTH: 0.405156
G1 F15000
G1 X108.398 Y137.797 E.00881
; LINE_WIDTH: 0.389444
G1 X108.205 Y137.774 E.00551
; LINE_WIDTH: 0.342433
G1 X108.011 Y137.75 E.00476
; LINE_WIDTH: 0.257331
G2 X107.793 Y137.725 I-.317 J1.798 E.00384
G2 X107.188 Y137.727 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X106.994 Y137.75 E.00327
; LINE_WIDTH: 0.295421
G1 X106.801 Y137.774 E.00401
; LINE_WIDTH: 0.342432
G1 X106.607 Y137.797 E.00476
; LINE_WIDTH: 0.389442
G1 X106.314 Y137.851 E.00842
G1 X105.473 Y138.023 F30000
; LINE_WIDTH: 0.151055
G1 F15000
G1 X105.321 Y138.421 E.00375
G1 X105.14 Y139.051 F30000
; LINE_WIDTH: 0.434489
G1 F15000
G1 X105.107 Y139.232 E.00588
; LINE_WIDTH: 0.391801
G1 X105.074 Y139.413 E.00524
; LINE_WIDTH: 0.349113
G1 X105.041 Y139.595 E.00459
; LINE_WIDTH: 0.306424
G1 X105.037 Y139.626 E.00068
; LINE_WIDTH: 0.298796
G1 X105.019 Y139.916 E.00607
; LINE_WIDTH: 0.261158
G2 X105.002 Y140.229 I2.576 J.302 E.00557
; LINE_WIDTH: 0.228538
G1 X105.019 Y140.519 E.0044
; LINE_WIDTH: 0.267101
G2 X105.041 Y140.841 I2.649 J-.015 E.00589
; LINE_WIDTH: 0.306424
G1 X105.074 Y141.022 E.00395
; LINE_WIDTH: 0.349112
G1 X105.107 Y141.203 E.00459
; LINE_WIDTH: 0.3918
G1 X105.14 Y141.384 E.00524
G1 X105.321 Y142.015 F30000
; LINE_WIDTH: 0.151058
G1 F15000
G1 X105.473 Y142.412 E.00375
G1 X106.314 Y142.585 F30000
; LINE_WIDTH: 0.389442
G1 F15000
G1 X106.607 Y142.639 E.00842
; LINE_WIDTH: 0.342433
G1 X106.801 Y142.662 E.00476
; LINE_WIDTH: 0.295422
G1 X106.994 Y142.686 E.00401
; LINE_WIDTH: 0.24841
G1 X107.188 Y142.709 E.00327
; LINE_WIDTH: 0.257331
G2 X107.793 Y142.711 I.315 J-4.984 E.01058
G2 X108.011 Y142.686 I-.098 J-1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X108.205 Y142.662 E.00476
; LINE_WIDTH: 0.389444
G1 X108.398 Y142.639 E.00551
; LINE_WIDTH: 0.405156
G1 X108.692 Y142.585 E.00881
G1 X109.315 Y142.412 F30000
; LINE_WIDTH: 0.096921
G1 F15000
G1 X109.477 Y142.23 E.00107
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.315 Y142.412 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/15
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
G3 Z1.2 I.982 J.719 P1  F30000
G1 X142.056 Y97.699 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X142.03 Y97.914 E.00718
G1 X108.673 Y97.914 E1.1065
G1 X108.647 Y97.699 E.00718
G1 X109.134 Y97.579 E.01663
G1 X109.605 Y97.332 E.01765
G1 X110.003 Y96.979 E.01764
G1 X110.305 Y96.541 E.01765
G1 X110.494 Y96.044 E.01765
G1 X110.558 Y95.516 E.01765
G1 X110.494 Y94.988 E.01765
G1 X110.305 Y94.49 E.01765
G1 X110.003 Y94.053 E.01765
G1 X109.605 Y93.7 E.01764
G1 X109.134 Y93.453 E.01764
G1 X108.647 Y93.333 E.01663
G1 X108.673 Y93.118 E.00718
G1 X142.03 Y93.118 E1.1065
G1 X142.056 Y93.333 E.00718
G1 X141.569 Y93.453 E.01663
G1 X141.098 Y93.7 E.01764
G1 X140.7 Y94.053 E.01765
G1 X140.398 Y94.49 E.01764
G1 X140.209 Y94.988 E.01765
G1 X140.145 Y95.516 E.01765
G1 X140.209 Y96.044 E.01764
G1 X140.398 Y96.541 E.01765
G1 X140.7 Y96.979 E.01764
G1 X141.098 Y97.332 E.01765
G1 X141.569 Y97.579 E.01764
G1 X141.998 Y97.685 E.01464
; WIPE_START
G1 F24000
G1 X142.03 Y97.914 E-.08794
G1 X140.261 Y97.914 E-.67206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.47 J1.122 P1  F30000
G1 X143.948 Y96.369 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.708 Y96.717 E.013
G1 X143.381 Y97.007 E.01342
G1 X142.994 Y97.21 E.01342
G1 X142.57 Y97.314 E.01342
G1 X142.133 Y97.314 E.01342
G1 X141.709 Y97.21 E.01342
G1 X141.322 Y97.007 E.01342
G1 X140.996 Y96.717 E.01342
G1 X140.748 Y96.358 E.01342
G1 X140.593 Y95.949 E.01342
G1 X140.54 Y95.516 E.01342
G1 X140.593 Y95.082 E.01342
G1 X140.748 Y94.674 E.01342
G1 X140.996 Y94.315 E.01342
G1 X141.322 Y94.025 E.01342
G1 X141.709 Y93.822 E.01342
G1 X142.133 Y93.717 E.01342
G1 X142.57 Y93.717 E.01342
G1 X142.994 Y93.822 E.01342
G1 X143.381 Y94.025 E.01342
G1 X143.708 Y94.315 E.01342
G1 X143.956 Y94.674 E.01342
G1 X144.11 Y95.082 E.01342
G1 X144.163 Y95.516 E.01342
G1 X144.11 Y95.949 E.01342
G1 X143.972 Y96.314 E.01199
M204 S10000
; WIPE_START
G1 F24000
G1 X143.708 Y96.717 E-.18314
G1 X143.381 Y97.007 E-.16595
G1 X142.994 Y97.21 E-.16595
G1 X142.57 Y97.314 E-.16595
G1 X142.362 Y97.314 E-.079
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.809 J.909 P1  F30000
G1 X144.749 Y95.188 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X144.52 Y95.202 E.00763
G1 X144.494 Y94.988 E.00717
G1 X144.305 Y94.49 E.01765
G1 X144.003 Y94.053 E.01764
G1 X143.605 Y93.7 E.01765
G1 X143.134 Y93.453 E.01764
G1 X142.647 Y93.333 E.01663
G1 X142.673 Y93.118 E.00718
G1 X144.749 Y93.118 E.06887
G1 X144.749 Y95.128 E.06669
; WIPE_START
G1 F24000
G1 X144.52 Y95.202 E-.09162
G1 X144.494 Y94.988 E-.08209
G1 X144.305 Y94.49 E-.20213
G1 X144.003 Y94.053 E-.20213
G1 X143.645 Y93.735 E-.18203
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.177 J.311 P1  F30000
G1 X144.749 Y97.914 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15476.087
G1 X142.673 Y97.914 E.06887
G1 X142.647 Y97.699 E.00718
G1 X143.134 Y97.579 E.01663
G1 X143.605 Y97.332 E.01764
G1 X144.003 Y96.979 E.01765
G1 X144.305 Y96.541 E.01764
G1 X144.494 Y96.044 E.01765
G1 X144.52 Y95.829 E.00717
G1 X144.749 Y95.843 E.00763
G1 X144.749 Y97.854 E.06669
; WIPE_START
G1 F24000
G1 X142.75 Y97.911 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.09 J-1.214 P1  F30000
G1 X106.183 Y95.202 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15476.087
G1 X105.954 Y95.188 E.00763
G1 X105.954 Y93.118 E.06868
G1 X108.03 Y93.118 E.06887
G1 X108.056 Y93.333 E.00718
G1 X107.569 Y93.453 E.01663
G1 X107.098 Y93.7 E.01764
G1 X106.7 Y94.053 E.01765
G1 X106.398 Y94.49 E.01764
G1 X106.209 Y94.988 E.01764
G1 X106.19 Y95.143 E.00518
; WIPE_START
G1 F24000
G1 X105.954 Y95.188 E-.09162
G1 X105.954 Y93.429 E-.66838
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.138 J.432 P1  F30000
G1 X107.305 Y96.991 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.996 Y96.717 E.01269
G1 X106.748 Y96.358 E.01342
G1 X106.593 Y95.949 E.01342
G1 X106.54 Y95.516 E.01342
G1 X106.593 Y95.082 E.01342
G1 X106.748 Y94.674 E.01342
G1 X106.996 Y94.315 E.01342
G1 X107.322 Y94.025 E.01342
G1 X107.709 Y93.822 E.01342
G1 X108.133 Y93.717 E.01342
G1 X108.57 Y93.717 E.01342
G1 X108.994 Y93.822 E.01342
G1 X109.381 Y94.025 E.01342
G1 X109.708 Y94.315 E.01342
G1 X109.956 Y94.674 E.01342
G1 X110.11 Y95.082 E.01342
G1 X110.163 Y95.516 E.01342
G1 X110.11 Y95.949 E.01342
G1 X109.956 Y96.358 E.01342
G1 X109.708 Y96.717 E.01342
G1 X109.381 Y97.007 E.01342
G1 X108.994 Y97.21 E.01342
G1 X108.57 Y97.314 E.01342
G1 X108.133 Y97.314 E.01342
G1 X107.709 Y97.21 E.01342
G1 X107.355 Y97.024 E.0123
M204 S10000
G1 X107.133 Y97.35 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.569 Y97.579 E.01632
G1 X108.056 Y97.699 E.01663
G1 X108.03 Y97.914 E.00718
G1 X105.954 Y97.914 E.06887
G1 X105.954 Y95.843 E.06868
G1 X106.183 Y95.829 E.00763
G1 X106.209 Y96.044 E.00717
G1 X106.398 Y96.541 E.01765
G1 X106.7 Y96.979 E.01764
G1 X107.083 Y97.318 E.01698
; WIPE_START
G1 F24000
G1 X107.569 Y97.579 E-.20956
G1 X108.056 Y97.699 E-.19055
G1 X108.03 Y97.914 E-.08223
G1 X107.299 Y97.914 E-.27767
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.013 J1.217 P1  F30000
G1 X145.142 Y98.306 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P67 R4
G1 F12000
G1 X105.562 Y98.306 E1.21618
G1 X105.562 Y92.726 E.17146
G1 X145.142 Y92.726 E1.21618
G1 X145.142 Y98.246 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X143.142 Y98.249 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.652 J1.027 P1  F30000
G1 X144.546 Y97.357 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.282812
G1 F15000
G1 X143.418 Y97.71 E.02311
G1 X144.152 Y97.71 F30000
; LINE_WIDTH: 0.511103
G1 F13456.297
G1 X144.546 Y96.675 E.04224
G1 X144.354 Y95.623 F30000
; LINE_WIDTH: 0.271406
G1 F15000
G1 X144.475 Y95.516 E.00301
; LINE_WIDTH: 0.311995
G1 X144.946 Y95.516 E.01032
G1 X144.546 Y94.356 F30000
; LINE_WIDTH: 0.470044
G1 F14749.821
G1 X144.152 Y93.321 E.03854
G1 X144.546 Y93.674 F30000
; LINE_WIDTH: 0.282811
G1 F15000
G1 X143.418 Y93.321 E.02311
G1 X142.352 Y92.922 F30000
; LINE_WIDTH: 0.305086
G1 F15000
G1 X142.352 Y93.222 E.0064
; LINE_WIDTH: 0.25884
G1 X142.352 Y93.521 E.00527
G1 X141.298 Y93.342 F30000
; LINE_WIDTH: 0.108847
G1 F15000
G2 X141.144 Y93.419 I.025 J.242 E.00095
G1 X139.89 Y94.848 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X140.414 Y93.466 E.04901
G1 X110.289 Y93.466 E.99928
G1 X110.721 Y94.604 E.04037
G3 X110.835 Y96.128 I-2.532 J.955 E.05138
G1 X110.289 Y97.565 E.051
G1 X140.414 Y97.565 E.99928
G1 X139.869 Y96.128 E.051
G3 X139.869 Y94.904 I2.483 J-.612 E.041
G1 X141.144 Y97.612 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.108846
G1 F15000
G2 X141.298 Y97.69 I.179 J-.165 E.00095
G1 X142.352 Y97.51 F30000
; LINE_WIDTH: 0.25884
G1 F15000
G1 X142.352 Y97.81 E.00527
; LINE_WIDTH: 0.305086
G1 X142.352 Y98.11 E.0064
G1 X137.433 Y97.158 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.061 Y97.158 E.05401
G1 X139.614 Y96.605 E.02595
G3 X139.614 Y94.426 I2.3 J-1.089 E.07468
G1 X139.061 Y93.873 E.02595
G1 X134.67 Y93.873 E.14565
G1 X131.385 Y97.158 E.15411
G1 X134.67 Y97.158 E.10897
G1 X131.385 Y93.873 E.15411
G1 X126.994 Y93.873 E.14565
G1 X123.709 Y97.158 E.15411
G1 X126.994 Y97.158 E.10897
G1 X123.709 Y93.873 E.15411
G1 X122.081 Y93.873 E.05401
G1 X120.946 Y97.158 F30000
G1 F15476.087
G1 X119.318 Y97.158 E.05401
G1 X116.033 Y93.873 E.15411
G1 X119.318 Y93.873 E.10897
G1 X116.033 Y97.158 E.15411
G1 X111.642 Y97.158 E.14565
G1 X111.089 Y96.605 E.02595
G2 X111.089 Y94.426 I-2.743 J-1.089 E.07402
G1 X111.642 Y93.873 E.02596
G1 X113.271 Y93.873 E.05401
G1 X109.559 Y93.419 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104412
G1 F15000
G2 X109.405 Y93.342 I-.179 J.165 E.00088
G1 X108.352 Y93.521 F30000
; LINE_WIDTH: 0.25884
G1 F15000
G1 X108.352 Y93.222 E.00527
; LINE_WIDTH: 0.305086
G1 X108.352 Y92.922 E.0064
G1 X107.285 Y93.321 F30000
; LINE_WIDTH: 0.265391
G1 F15000
G1 X106.157 Y93.674 E.02143
G1 X106.551 Y93.321 F30000
; LINE_WIDTH: 0.511106
G1 F13456.211
G1 X106.157 Y94.356 E.04224
G1 X106.157 Y96.675 F30000
; LINE_WIDTH: 0.511106
G1 F13456.19
G1 X106.551 Y97.71 E.04224
G1 X106.157 Y97.357 F30000
; LINE_WIDTH: 0.265392
G1 F15000
G1 X107.285 Y97.71 E.02143
G1 X108.352 Y98.11 F30000
; LINE_WIDTH: 0.305086
G1 F15000
G1 X108.352 Y97.81 E.0064
; LINE_WIDTH: 0.25884
G1 X108.352 Y97.51 E.00527
G1 X109.405 Y97.69 F30000
; LINE_WIDTH: 0.104412
G1 F15000
G2 X109.559 Y97.612 I-.025 J-.242 E.00088
; WIPE_START
G1 F24000
G1 X109.471 Y97.673 E-.46675
G1 X109.405 Y97.69 E-.29325
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.398 J1.15 P1  F30000
G1 X142.722 Y109.211 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X142.696 Y109.426 E.00718
G1 X109.339 Y109.426 E1.1065
G1 X109.313 Y109.211 E.00718
G1 X109.8 Y109.091 E.01663
G1 X110.271 Y108.844 E.01765
G1 X110.669 Y108.491 E.01764
G1 X110.971 Y108.053 E.01765
G1 X111.16 Y107.556 E.01765
G1 X111.224 Y107.028 E.01765
G1 X111.16 Y106.5 E.01765
G1 X110.971 Y106.002 E.01765
G1 X110.669 Y105.565 E.01765
G1 X110.271 Y105.212 E.01764
G1 X109.8 Y104.965 E.01764
G1 X109.313 Y104.845 E.01663
G1 X109.339 Y104.63 E.00718
G1 X142.696 Y104.63 E1.1065
G1 X142.722 Y104.845 E.00718
G1 X142.235 Y104.965 E.01663
G1 X141.764 Y105.212 E.01764
G1 X141.366 Y105.565 E.01765
G1 X141.064 Y106.002 E.01764
G1 X140.875 Y106.5 E.01765
G1 X140.811 Y107.028 E.01765
G1 X140.875 Y107.556 E.01764
G1 X141.064 Y108.053 E.01765
G1 X141.366 Y108.491 E.01764
G1 X141.764 Y108.844 E.01765
G1 X142.235 Y109.091 E.01764
G1 X142.664 Y109.197 E.01464
; WIPE_START
G1 F24000
G1 X142.696 Y109.426 E-.08794
G1 X140.927 Y109.426 E-.67206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.47 J1.122 P1  F30000
G1 X144.614 Y107.881 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.374 Y108.229 E.013
G1 X144.047 Y108.519 E.01342
G1 X143.66 Y108.722 E.01342
G1 X143.236 Y108.826 E.01342
G1 X142.799 Y108.826 E.01342
G1 X142.375 Y108.722 E.01342
G1 X141.989 Y108.519 E.01342
G1 X141.662 Y108.229 E.01342
G1 X141.414 Y107.87 E.01342
G1 X141.259 Y107.461 E.01342
G1 X141.206 Y107.028 E.01342
G1 X141.259 Y106.594 E.01342
G1 X141.414 Y106.186 E.01342
G1 X141.662 Y105.827 E.01342
G1 X141.989 Y105.537 E.01342
G1 X142.375 Y105.334 E.01342
G1 X142.799 Y105.23 E.01342
G1 X143.236 Y105.23 E.01342
G1 X143.66 Y105.334 E.01342
G1 X144.047 Y105.537 E.01342
G1 X144.374 Y105.827 E.01342
G1 X144.622 Y106.186 E.01342
G1 X144.777 Y106.594 E.01342
G1 X144.829 Y107.028 E.01342
G1 X144.777 Y107.461 E.01342
G1 X144.638 Y107.826 E.01199
M204 S10000
; WIPE_START
G1 F24000
G1 X144.374 Y108.229 E-.18314
G1 X144.047 Y108.519 E-.16595
G1 X143.66 Y108.722 E-.16595
G1 X143.236 Y108.826 E-.16595
G1 X143.028 Y108.826 E-.079
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.809 J.909 P1  F30000
G1 X145.416 Y106.7 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.186 Y106.714 E.00763
G1 X145.16 Y106.5 E.00717
G1 X144.971 Y106.002 E.01765
G1 X144.669 Y105.565 E.01764
G1 X144.271 Y105.212 E.01765
G1 X143.8 Y104.965 E.01764
G1 X143.313 Y104.845 E.01663
G1 X143.339 Y104.63 E.00718
G1 X145.416 Y104.63 E.06887
G1 X145.416 Y106.64 E.06669
; WIPE_START
G1 F24000
G1 X145.186 Y106.714 E-.09162
G1 X145.16 Y106.5 E-.08209
G1 X144.971 Y106.002 E-.20213
G1 X144.669 Y105.565 E-.20213
G1 X144.311 Y105.247 E-.18203
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.177 J.311 P1  F30000
G1 X145.416 Y109.426 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15476.087
G1 X143.339 Y109.426 E.06887
G1 X143.313 Y109.211 E.00718
G1 X143.8 Y109.091 E.01663
G1 X144.271 Y108.844 E.01764
G1 X144.669 Y108.491 E.01765
G1 X144.971 Y108.053 E.01764
G1 X145.16 Y107.556 E.01765
G1 X145.186 Y107.341 E.00717
G1 X145.416 Y107.355 E.00763
G1 X145.416 Y109.366 E.06669
; WIPE_START
G1 F24000
G1 X143.416 Y109.424 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.09 J-1.214 P1  F30000
G1 X106.849 Y106.714 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15476.087
G1 X106.62 Y106.7 E.00763
G1 X106.62 Y104.63 E.06868
G1 X108.696 Y104.63 E.06887
G1 X108.722 Y104.845 E.00718
G1 X108.235 Y104.965 E.01663
G1 X107.764 Y105.212 E.01764
G1 X107.366 Y105.565 E.01765
G1 X107.064 Y106.002 E.01764
G1 X106.875 Y106.5 E.01764
G1 X106.856 Y106.655 E.00518
; WIPE_START
G1 F24000
G1 X106.62 Y106.7 E-.09162
G1 X106.62 Y104.941 E-.66838
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.138 J.432 P1  F30000
G1 X107.971 Y108.503 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.662 Y108.229 E.01269
G1 X107.414 Y107.87 E.01342
G1 X107.259 Y107.461 E.01342
G1 X107.206 Y107.028 E.01342
G1 X107.259 Y106.594 E.01342
G1 X107.414 Y106.186 E.01342
G1 X107.662 Y105.827 E.01342
G1 X107.989 Y105.537 E.01342
G1 X108.375 Y105.334 E.01342
G1 X108.799 Y105.23 E.01342
G1 X109.236 Y105.23 E.01342
G1 X109.66 Y105.334 E.01342
G1 X110.047 Y105.537 E.01342
G1 X110.374 Y105.827 E.01342
G1 X110.622 Y106.186 E.01342
G1 X110.777 Y106.594 E.01342
G1 X110.829 Y107.028 E.01342
G1 X110.777 Y107.461 E.01342
G1 X110.622 Y107.87 E.01342
G1 X110.374 Y108.229 E.01342
G1 X110.047 Y108.519 E.01342
G1 X109.66 Y108.722 E.01342
G1 X109.236 Y108.826 E.01342
G1 X108.799 Y108.826 E.01342
G1 X108.375 Y108.722 E.01342
G1 X108.021 Y108.536 E.0123
M204 S10000
G1 X107.8 Y108.862 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X108.235 Y109.091 E.01632
G1 X108.722 Y109.211 E.01663
G1 X108.696 Y109.426 E.00718
G1 X106.62 Y109.426 E.06887
G1 X106.62 Y107.355 E.06868
G1 X106.849 Y107.341 E.00763
G1 X106.875 Y107.556 E.00717
G1 X107.064 Y108.053 E.01765
G1 X107.366 Y108.491 E.01764
G1 X107.749 Y108.83 E.01698
; WIPE_START
G1 F24000
G1 X108.235 Y109.091 E-.20956
G1 X108.722 Y109.211 E-.19055
G1 X108.696 Y109.426 E-.08223
G1 X107.965 Y109.426 E-.27767
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.013 J1.217 P1  F30000
G1 X145.808 Y109.818 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.228 Y109.818 E1.21618
G1 X106.228 Y104.238 E.17146
G1 X145.808 Y104.238 E1.21618
G1 X145.808 Y109.758 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X143.808 Y109.761 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.652 J1.027 P1  F30000
G1 X145.212 Y108.869 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.282812
G1 F15000
G1 X144.084 Y109.222 E.02311
G1 X144.818 Y109.222 F30000
; LINE_WIDTH: 0.511103
G1 F13456.297
G1 X145.212 Y108.188 E.04224
G1 X145.02 Y107.135 F30000
; LINE_WIDTH: 0.271406
G1 F15000
G1 X145.141 Y107.028 E.00301
; LINE_WIDTH: 0.311995
G1 X145.612 Y107.028 E.01032
G1 X145.212 Y105.868 F30000
; LINE_WIDTH: 0.470044
G1 F14749.821
G1 X144.818 Y104.833 E.03854
G1 X145.212 Y105.187 F30000
; LINE_WIDTH: 0.282811
G1 F15000
G1 X144.084 Y104.833 E.02311
G1 X143.018 Y104.434 F30000
; LINE_WIDTH: 0.305086
G1 F15000
G1 X143.018 Y104.734 E.0064
; LINE_WIDTH: 0.25884
G1 X143.018 Y105.033 E.00527
G1 X141.964 Y104.854 F30000
; LINE_WIDTH: 0.108847
G1 F15000
G2 X141.81 Y104.931 I.025 J.242 E.00095
G1 X140.556 Y106.36 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X141.08 Y104.978 E.04901
G1 X110.955 Y104.978 E.99928
G1 X111.387 Y106.116 E.04037
G3 X111.501 Y107.64 I-2.532 J.955 E.05138
G1 X110.955 Y109.078 E.051
G1 X141.08 Y109.078 E.99928
G1 X140.535 Y107.64 E.051
G3 X140.535 Y106.416 I2.483 J-.612 E.041
G1 X141.81 Y109.124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.108846
G1 F15000
G2 X141.964 Y109.202 I.179 J-.165 E.00095
G1 X143.018 Y109.022 F30000
; LINE_WIDTH: 0.25884
G1 F15000
G1 X143.018 Y109.322 E.00527
; LINE_WIDTH: 0.305086
G1 X143.018 Y109.622 E.0064
G1 X138.099 Y108.67 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.727 Y108.67 E.05401
G1 X140.28 Y108.117 E.02595
G3 X140.28 Y105.939 I2.3 J-1.089 E.07468
G1 X139.727 Y105.385 E.02595
G1 X135.336 Y105.385 E.14565
G1 X132.051 Y108.67 E.15411
G1 X135.336 Y108.67 E.10897
G1 X132.051 Y105.385 E.15411
G1 X127.66 Y105.385 E.14565
G1 X124.375 Y108.67 E.15411
G1 X127.66 Y108.67 E.10897
G1 X124.375 Y105.385 E.15411
G1 X122.747 Y105.385 E.05401
G1 X121.613 Y108.67 F30000
G1 F15476.087
G1 X119.984 Y108.67 E.05401
G1 X116.699 Y105.385 E.15411
G1 X119.984 Y105.385 E.10897
G1 X116.699 Y108.67 E.15411
G1 X112.308 Y108.67 E.14565
G1 X111.755 Y108.117 E.02595
G2 X111.755 Y105.939 I-2.743 J-1.089 E.07402
G1 X112.308 Y105.385 E.02596
G1 X113.937 Y105.385 E.05401
G1 X110.225 Y104.931 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104412
G1 F15000
G2 X110.071 Y104.854 I-.179 J.165 E.00088
G1 X109.018 Y105.033 F30000
; LINE_WIDTH: 0.25884
G1 F15000
G1 X109.018 Y104.734 E.00527
; LINE_WIDTH: 0.305086
G1 X109.018 Y104.434 E.0064
G1 X107.952 Y104.833 F30000
; LINE_WIDTH: 0.265391
G1 F15000
G1 X106.823 Y105.186 E.02143
G1 X107.217 Y104.833 F30000
; LINE_WIDTH: 0.511106
G1 F13456.211
G1 X106.823 Y105.868 E.04224
G1 X106.823 Y108.188 F30000
; LINE_WIDTH: 0.511106
G1 F13456.19
G1 X107.217 Y109.222 E.04224
G1 X106.823 Y108.869 F30000
; LINE_WIDTH: 0.265392
M73 P68 R4
G1 F15000
G1 X107.952 Y109.222 E.02143
G1 X109.018 Y109.622 F30000
; LINE_WIDTH: 0.305086
G1 F15000
G1 X109.018 Y109.322 E.0064
; LINE_WIDTH: 0.25884
G1 X109.018 Y109.022 E.00527
G1 X110.071 Y109.202 F30000
; LINE_WIDTH: 0.104412
G1 F15000
G2 X110.225 Y109.124 I-.025 J-.242 E.00088
; WIPE_START
G1 F24000
G1 X110.137 Y109.186 E-.46675
G1 X110.071 Y109.202 E-.29325
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.544 J1.089 P1  F30000
G1 X136.503 Y122.406 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X136.376 Y122.473 E.00478
G1 X135.905 Y122.89 E.02084
G1 X135.548 Y123.407 E.02084
G1 X135.325 Y123.995 E.02084
G1 X135.25 Y124.618 E.02084
G1 X135.325 Y125.242 E.02084
G1 X135.548 Y125.83 E.02084
G1 X135.905 Y126.347 E.02084
G1 X136.376 Y126.763 E.02084
G1 X136.503 Y126.831 E.00478
G1 X136.457 Y127.016 E.00635
G1 X105.255 Y127.016 E1.03504
G1 X105.209 Y126.831 E.00635
G1 X105.337 Y126.763 E.00478
G1 X105.807 Y126.347 E.02084
G1 X106.164 Y125.83 E.02084
G1 X106.387 Y125.242 E.02084
G1 X106.463 Y124.618 E.02084
G1 X106.387 Y123.995 E.02084
G1 X106.164 Y123.407 E.02084
G1 X105.807 Y122.89 E.02084
G1 X105.337 Y122.473 E.02084
G1 X105.209 Y122.406 E.00478
G1 X105.255 Y122.22 E.00635
G1 X136.457 Y122.22 E1.03504
G1 X136.489 Y122.348 E.00436
; WIPE_START
G1 F24000
G1 X136.376 Y122.473 E-.06419
G1 X135.905 Y122.89 E-.23878
G1 X135.548 Y123.407 E-.23878
G1 X135.345 Y123.944 E-.21825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.038 J1.216 P1  F30000
G1 X140.004 Y124.091 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X140.068 Y124.618 E.01633
G1 X140.003 Y125.148 E.01638
G1 X139.814 Y125.646 E.01638
G1 X139.512 Y126.085 E.01638
G1 X139.112 Y126.438 E.01638
G1 X138.64 Y126.686 E.01638
G1 X138.123 Y126.814 E.01638
G1 X137.59 Y126.814 E.01638
G1 X137.072 Y126.686 E.01638
G1 X136.6 Y126.438 E.01638
G1 X136.201 Y126.085 E.01638
G1 X135.898 Y125.646 E.01638
G1 X135.709 Y125.148 E.01638
G1 X135.645 Y124.618 E.01638
G1 X135.709 Y124.089 E.01638
G1 X135.898 Y123.591 E.01638
G1 X136.201 Y123.152 E.01638
G1 X136.6 Y122.798 E.01638
G1 X137.072 Y122.551 E.01638
G1 X137.59 Y122.423 E.01638
G1 X138.123 Y122.423 E.01638
G1 X138.64 Y122.551 E.01638
G1 X139.112 Y122.798 E.01638
G1 X139.512 Y123.152 E.01638
G1 X139.814 Y123.591 E.01638
G1 X139.983 Y124.034 E.01459
M204 S10000
G1 X140.083 Y123.289 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.807 Y122.89 E.01608
G1 X139.337 Y122.473 E.02084
G1 X139.209 Y122.406 E.00478
G1 X139.255 Y122.22 E.00635
G1 X140.254 Y122.22 E.03314
G1 X140.254 Y123.235 E.03367
G1 X140.14 Y123.271 E.00397
; WIPE_START
G1 F24000
G1 X139.807 Y122.89 E-.19221
G1 X139.337 Y122.473 E-.23878
G1 X139.209 Y122.406 E-.0548
G1 X139.255 Y122.22 E-.07271
G1 X139.785 Y122.22 E-.2015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.213 J.097 P1  F30000
G1 X140.083 Y125.948 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15476.087
G1 X140.254 Y126.001 E.00596
G1 X140.254 Y127.016 E.03367
G1 X139.255 Y127.016 E.03314
G1 X139.209 Y126.831 E.00635
G1 X139.337 Y126.763 E.00478
G1 X139.807 Y126.347 E.02084
G1 X140.048 Y125.997 E.01409
; WIPE_START
G1 F24000
G1 X140.254 Y126.001 E-.07817
G1 X140.254 Y127.016 E-.38568
G1 X139.475 Y127.016 E-.29616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.105 J-1.212 P1  F30000
G1 X106.005 Y124.105 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.068 Y124.618 E.01589
G1 X106.003 Y125.148 E.01638
G1 X105.814 Y125.646 E.01638
G1 X105.512 Y126.085 E.01638
G1 X105.112 Y126.438 E.01638
G1 X104.64 Y126.686 E.01638
G1 X104.123 Y126.814 E.01638
G1 X103.59 Y126.814 E.01638
G1 X103.072 Y126.686 E.01638
G1 X102.6 Y126.438 E.01638
G1 X102.201 Y126.085 E.01638
G1 X101.898 Y125.646 E.01638
G1 X101.709 Y125.148 E.01638
G1 X101.645 Y124.618 E.01638
G1 X101.709 Y124.089 E.01638
G1 X101.898 Y123.591 E.01638
G1 X102.201 Y123.152 E.01638
G1 X102.6 Y122.798 E.01638
G1 X103.072 Y122.551 E.01638
G1 X103.59 Y122.423 E.01638
G1 X104.123 Y122.423 E.01638
G1 X104.64 Y122.551 E.01638
G1 X105.112 Y122.798 E.01638
G1 X105.512 Y123.152 E.01638
G1 X105.814 Y123.591 E.01638
G1 X105.988 Y124.048 E.01504
M204 S10000
; WIPE_START
G1 F24000
G1 X106.068 Y124.618 E-.21881
G1 X106.003 Y125.148 E-.2026
G1 X105.814 Y125.646 E-.20259
G1 X105.611 Y125.941 E-.136
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.914 J-.804 P1  F30000
G1 X102.503 Y122.406 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X102.376 Y122.473 E.00478
G1 X101.905 Y122.89 E.02084
G1 X101.63 Y123.289 E.01608
G1 X101.458 Y123.235 E.00596
G1 X101.458 Y122.22 E.03367
G1 X102.457 Y122.22 E.03314
G1 X102.489 Y122.348 E.00436
; WIPE_START
G1 F24000
G1 X102.376 Y122.473 E-.06419
G1 X101.905 Y122.89 E-.23878
G1 X101.63 Y123.289 E-.18419
G1 X101.458 Y123.235 E-.06829
G1 X101.458 Y122.697 E-.20454
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.18 J.298 P1  F30000
G1 X102.503 Y126.831 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15476.087
G1 X102.457 Y127.016 E.00635
G1 X101.458 Y127.016 E.03314
G1 X101.458 Y126.001 E.03367
G1 X101.63 Y125.948 E.00596
G1 X101.905 Y126.347 E.01608
G1 X102.376 Y126.763 E.02084
G1 X102.45 Y126.803 E.00279
; WIPE_START
G1 F24000
G1 X102.457 Y127.016 E-.08125
G1 X101.458 Y127.016 E-.37968
G1 X101.458 Y126.229 E-.29907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.037 J1.216 P1  F30000
G1 X140.646 Y127.408 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X101.066 Y127.408 E1.21618
G1 X101.066 Y121.828 E.17146
G1 X140.646 Y121.828 E1.21618
G1 X140.646 Y127.348 E.16961
M204 S10000
G1 X139.886 Y126.813 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151056
G1 F15000
G1 X140.038 Y126.415 E.00375
G1 X140.219 Y125.785 F30000
; LINE_WIDTH: 0.43449
G1 F15000
G1 X140.252 Y125.604 E.00588
; LINE_WIDTH: 0.391802
G1 X140.285 Y125.423 E.00524
; LINE_WIDTH: 0.349113
G1 X140.318 Y125.242 E.00459
; LINE_WIDTH: 0.306424
G1 X140.322 Y125.21 E.00068
; LINE_WIDTH: 0.298796
G1 X140.34 Y124.92 E.00607
; LINE_WIDTH: 0.261158
G2 X140.357 Y124.607 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X140.34 Y124.317 E.0044
; LINE_WIDTH: 0.267101
G2 X140.318 Y123.995 I-2.649 J.015 E.00589
; LINE_WIDTH: 0.306424
G1 X140.285 Y123.814 E.00395
; LINE_WIDTH: 0.349112
G1 X140.252 Y123.633 E.00459
; LINE_WIDTH: 0.3918
G1 X140.219 Y123.452 E.00524
G1 X140.038 Y122.822 F30000
; LINE_WIDTH: 0.141574
G1 F15000
G1 X139.886 Y122.424 E.00342
G1 X139.045 Y122.252 F30000
; LINE_WIDTH: 0.405157
G1 F15000
G1 X138.752 Y122.198 E.00881
; LINE_WIDTH: 0.389446
G1 X138.558 Y122.174 E.00551
; LINE_WIDTH: 0.342434
G1 X138.365 Y122.151 E.00476
; LINE_WIDTH: 0.257331
G2 X138.147 Y122.126 I-.317 J1.798 E.00384
G2 X137.541 Y122.127 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X137.348 Y122.151 E.00327
; LINE_WIDTH: 0.295421
G1 X137.154 Y122.174 E.00401
; LINE_WIDTH: 0.342433
G1 X136.96 Y122.198 E.00476
; LINE_WIDTH: 0.389446
G1 X136.667 Y122.252 E.00842
G1 X136.044 Y122.424 F30000
; LINE_WIDTH: 0.13445
G1 F15000
G1 X135.882 Y122.606 E.00182
; WIPE_START
G1 F24000
G1 X136.044 Y122.424 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.017 J.669 P1  F30000
G1 X139.045 Y126.985 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.405156
G1 F15000
G1 X138.752 Y127.039 E.00881
; LINE_WIDTH: 0.389444
G1 X138.558 Y127.063 E.00551
; LINE_WIDTH: 0.342433
G1 X138.365 Y127.086 E.00476
; LINE_WIDTH: 0.257331
G3 X138.147 Y127.111 I-.317 J-1.798 E.00384
G3 X137.541 Y127.11 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X137.348 Y127.086 E.00327
; LINE_WIDTH: 0.295422
G1 X137.154 Y127.063 E.00401
; LINE_WIDTH: 0.342434
G1 X136.96 Y127.039 E.00476
; LINE_WIDTH: 0.389444
G1 X136.667 Y126.985 E.00842
G1 X136.044 Y126.813 F30000
; LINE_WIDTH: 0.134453
G1 F15000
G1 X135.882 Y126.63 E.00182
G1 X132.53 Y126.668 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X134.158 Y126.668 E.05401
G1 X135.127 Y125.7 E.04542
G3 X135.127 Y123.537 I2.288 J-1.082 E.07414
G1 X134.158 Y122.569 E.04542
G1 X130.582 Y122.569 E.11864
G1 X126.482 Y126.668 E.19231
G1 X122.906 Y126.668 E.11864
G1 X118.807 Y122.569 E.19231
G1 X115.23 Y122.569 E.11864
G1 X111.131 Y126.668 E.19231
G1 X107.554 Y126.668 E.11864
G1 X106.586 Y125.7 E.04542
G2 X106.586 Y123.537 I-2.288 J-1.082 E.07414
G1 X107.554 Y122.569 E.04542
G1 X111.131 Y122.569 E.11864
G1 X115.23 Y126.668 E.19231
G1 X118.807 Y126.668 E.11864
G1 X122.906 Y122.569 E.19231
G1 X126.482 Y122.569 E.11864
G1 X130.582 Y126.668 E.19231
G1 X128.953 Y126.668 E.05401
G1 X105.83 Y126.63 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969211
G1 F15000
G1 X105.668 Y126.813 E.00107
G1 X105.045 Y126.985 F30000
; LINE_WIDTH: 0.405156
G1 F15000
G1 X104.752 Y127.039 E.00881
; LINE_WIDTH: 0.389444
G1 X104.558 Y127.063 E.00551
; LINE_WIDTH: 0.342433
G1 X104.365 Y127.086 E.00476
; LINE_WIDTH: 0.257331
G3 X104.147 Y127.111 I-.317 J-1.798 E.00384
G3 X103.541 Y127.11 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X103.348 Y127.086 E.00327
; LINE_WIDTH: 0.295422
G1 X103.154 Y127.063 E.00401
; LINE_WIDTH: 0.342433
G1 X102.96 Y127.039 E.00476
; LINE_WIDTH: 0.389444
G1 X102.667 Y126.985 E.00842
G1 X101.826 Y126.813 F30000
; LINE_WIDTH: 0.151054
G1 F15000
G1 X101.675 Y126.415 E.00375
G1 X101.494 Y125.785 F30000
; LINE_WIDTH: 0.3918
G1 F15000
G1 X101.46 Y125.604 E.00524
; LINE_WIDTH: 0.349112
G1 X101.427 Y125.423 E.00459
; LINE_WIDTH: 0.306424
G1 X101.394 Y125.242 E.00395
; LINE_WIDTH: 0.267101
G3 X101.373 Y124.92 I2.628 J-.336 E.00589
; LINE_WIDTH: 0.228538
G1 X101.355 Y124.63 E.0044
; LINE_WIDTH: 0.261158
G3 X101.373 Y124.317 I2.594 J-.011 E.00557
; LINE_WIDTH: 0.298796
G1 X101.39 Y124.026 E.00607
; LINE_WIDTH: 0.306424
G1 X101.394 Y123.995 E.00068
; LINE_WIDTH: 0.349113
G1 X101.427 Y123.814 E.00459
; LINE_WIDTH: 0.391801
G1 X101.46 Y123.633 E.00524
; LINE_WIDTH: 0.434489
G1 X101.494 Y123.452 E.00588
G1 X101.675 Y122.822 F30000
; LINE_WIDTH: 0.151056
G1 F15000
G1 X101.826 Y122.424 E.00375
G1 X102.667 Y122.252 F30000
; LINE_WIDTH: 0.389444
G1 F15000
G1 X102.96 Y122.198 E.00842
; LINE_WIDTH: 0.342433
G1 X103.154 Y122.174 E.00476
; LINE_WIDTH: 0.295421
G1 X103.348 Y122.151 E.00401
; LINE_WIDTH: 0.24841
G1 X103.541 Y122.127 E.00327
; LINE_WIDTH: 0.257331
G3 X104.147 Y122.126 I.315 J4.984 E.01058
G3 X104.365 Y122.151 I-.098 J1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X104.558 Y122.174 E.00476
; LINE_WIDTH: 0.389444
G1 X104.752 Y122.198 E.00551
; LINE_WIDTH: 0.405155
G1 X105.045 Y122.252 E.00881
G1 X105.668 Y122.424 F30000
; LINE_WIDTH: 0.0969209
G1 F15000
G1 X105.83 Y122.607 E.00107
; WIPE_START
G1 F24000
G1 X105.668 Y122.424 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.501 J1.109 P1  F30000
G1 X140.15 Y138.006 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X140.022 Y138.073 E.00478
G1 X139.552 Y138.489 E.02084
G1 X139.195 Y139.007 E.02084
G1 X138.972 Y139.594 E.02084
G1 X138.896 Y140.218 E.02084
G1 X138.972 Y140.842 E.02084
G1 X139.195 Y141.429 E.02084
G1 X139.552 Y141.946 E.02084
G1 X140.022 Y142.363 E.02084
G1 X140.15 Y142.43 E.00478
G1 X140.104 Y142.616 E.00635
G1 X108.901 Y142.616 E1.03504
G1 X108.856 Y142.43 E.00635
G1 X108.983 Y142.363 E.00478
G1 X109.454 Y141.946 E.02084
G1 X109.811 Y141.429 E.02084
G1 X110.033 Y140.842 E.02084
G1 X110.109 Y140.218 E.02084
G1 X110.033 Y139.594 E.02084
G1 X109.811 Y139.007 E.02084
G1 X109.454 Y138.489 E.02084
G1 X108.983 Y138.073 E.02084
G1 X108.856 Y138.006 E.00478
G1 X108.901 Y137.82 E.00635
G1 X140.104 Y137.82 E1.03504
G1 X140.135 Y137.947 E.00436
; WIPE_START
G1 F24000
G1 X140.022 Y138.073 E-.06419
G1 X139.552 Y138.489 E-.23878
G1 X139.195 Y139.007 E-.23878
G1 X138.991 Y139.544 E-.21825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.038 J1.216 P1  F30000
G1 X143.65 Y139.69 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.714 Y140.218 E.01633
G1 X143.65 Y140.747 E.01638
G1 X143.461 Y141.246 E.01638
G1 X143.158 Y141.684 E.01638
G1 X142.759 Y142.038 E.01638
G1 X142.287 Y142.286 E.01638
G1 X141.769 Y142.413 E.01638
G1 X141.236 Y142.413 E.01638
G1 X140.719 Y142.286 E.01638
G1 X140.246 Y142.038 E.01638
G1 X139.847 Y141.684 E.01638
G1 X139.545 Y141.246 E.01638
G1 X139.355 Y140.747 E.01638
G1 X139.291 Y140.218 E.01638
G1 X139.355 Y139.689 E.01638
G1 X139.545 Y139.19 E.01638
G1 X139.847 Y138.751 E.01638
G1 X140.246 Y138.398 E.01638
G1 X140.719 Y138.15 E.01638
G1 X141.236 Y138.022 E.01638
G1 X141.769 Y138.022 E.01638
G1 X142.287 Y138.15 E.01638
G1 X142.759 Y138.398 E.01638
G1 X143.158 Y138.751 E.01638
G1 X143.461 Y139.19 E.01638
G1 X143.629 Y139.634 E.01459
M204 S10000
G1 X143.729 Y138.888 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.454 Y138.489 E.01608
G1 X142.983 Y138.073 E.02084
G1 X142.856 Y138.006 E.00478
G1 X142.901 Y137.82 E.00635
G1 X143.901 Y137.82 E.03314
G1 X143.901 Y138.835 E.03367
G1 X143.786 Y138.87 E.00397
; WIPE_START
G1 F24000
G1 X143.454 Y138.489 E-.19221
G1 X142.983 Y138.073 E-.23878
G1 X142.856 Y138.006 E-.0548
G1 X142.901 Y137.82 E-.07271
G1 X143.432 Y137.82 E-.2015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.213 J.097 P1  F30000
G1 X143.729 Y141.547 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15476.087
G1 X143.901 Y141.601 E.00596
G1 X143.901 Y142.616 E.03367
G1 X142.901 Y142.616 E.03314
G1 X142.856 Y142.43 E.00635
G1 X142.983 Y142.363 E.00478
G1 X143.454 Y141.946 E.02084
G1 X143.695 Y141.597 E.01409
; WIPE_START
G1 F24000
G1 X143.901 Y141.601 E-.07817
G1 X143.901 Y142.616 E-.38568
G1 X143.121 Y142.616 E-.29616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.105 J-1.212 P1  F30000
G1 X109.652 Y139.705 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X109.714 Y140.218 E.01589
G1 X109.65 Y140.747 E.01638
G1 X109.461 Y141.246 E.01638
G1 X109.158 Y141.684 E.01638
G1 X108.759 Y142.038 E.01638
G1 X108.287 Y142.286 E.01638
G1 X107.769 Y142.413 E.01638
G1 X107.236 Y142.413 E.01638
G1 X106.719 Y142.286 E.01638
G1 X106.246 Y142.038 E.01638
G1 X105.847 Y141.684 E.01638
G1 X105.545 Y141.246 E.01638
G1 X105.355 Y140.747 E.01638
G1 X105.291 Y140.218 E.01638
G1 X105.355 Y139.689 E.01638
G1 X105.545 Y139.19 E.01638
G1 X105.847 Y138.751 E.01638
G1 X106.246 Y138.398 E.01638
G1 X106.719 Y138.15 E.01638
G1 X107.236 Y138.022 E.01638
G1 X107.769 Y138.022 E.01638
G1 X108.287 Y138.15 E.01638
G1 X108.759 Y138.398 E.01638
G1 X109.158 Y138.751 E.01638
G1 X109.461 Y139.19 E.01638
G1 X109.634 Y139.648 E.01504
M204 S10000
; WIPE_START
G1 F24000
G1 X109.714 Y140.218 E-.21881
G1 X109.65 Y140.747 E-.2026
G1 X109.461 Y141.246 E-.20259
G1 X109.258 Y141.54 E-.136
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.914 J-.804 P1  F30000
G1 X106.15 Y138.006 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
M73 P69 R4
G1 X106.022 Y138.073 E.00478
G1 X105.552 Y138.489 E.02084
G1 X105.276 Y138.888 E.01608
G1 X105.105 Y138.835 E.00596
G1 X105.105 Y137.82 E.03367
G1 X106.104 Y137.82 E.03314
G1 X106.135 Y137.947 E.00436
; WIPE_START
G1 F24000
G1 X106.022 Y138.073 E-.06419
G1 X105.552 Y138.489 E-.23878
G1 X105.276 Y138.888 E-.18419
G1 X105.105 Y138.835 E-.06829
G1 X105.105 Y138.297 E-.20454
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.18 J.298 P1  F30000
G1 X106.15 Y142.43 Z1.4
G1 Z1
G1 E.8 F1800
G1 F15476.087
G1 X106.104 Y142.616 E.00635
G1 X105.105 Y142.616 E.03314
G1 X105.105 Y141.601 E.03367
G1 X105.276 Y141.547 E.00596
G1 X105.552 Y141.946 E.01608
G1 X106.022 Y142.363 E.02084
G1 X106.097 Y142.402 E.00279
; WIPE_START
G1 F24000
G1 X106.104 Y142.616 E-.08125
G1 X105.105 Y142.616 E-.37968
G1 X105.105 Y141.829 E-.29907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.037 J1.216 P1  F30000
G1 X144.293 Y143.008 Z1.4
G1 Z1
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X104.713 Y143.008 E1.21618
G1 X104.713 Y137.428 E.17146
G1 X144.293 Y137.428 E1.21618
G1 X144.293 Y142.948 E.16961
M204 S10000
G1 X143.533 Y142.412 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151056
G1 F15000
G1 X143.684 Y142.015 E.00375
G1 X143.865 Y141.384 F30000
; LINE_WIDTH: 0.43449
G1 F15000
G1 X143.899 Y141.203 E.00588
; LINE_WIDTH: 0.391802
G1 X143.932 Y141.022 E.00524
; LINE_WIDTH: 0.349113
G1 X143.965 Y140.841 E.00459
; LINE_WIDTH: 0.306424
G1 X143.969 Y140.81 E.00068
; LINE_WIDTH: 0.298796
G1 X143.986 Y140.519 E.00607
; LINE_WIDTH: 0.261158
G2 X144.004 Y140.207 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X143.986 Y139.916 E.0044
; LINE_WIDTH: 0.267101
G2 X143.965 Y139.595 I-2.649 J.015 E.00589
; LINE_WIDTH: 0.306424
G1 X143.932 Y139.413 E.00395
; LINE_WIDTH: 0.349112
G1 X143.899 Y139.232 E.00459
; LINE_WIDTH: 0.3918
G1 X143.865 Y139.051 E.00524
G1 X143.684 Y138.421 F30000
; LINE_WIDTH: 0.141574
G1 F15000
G1 X143.533 Y138.023 E.00342
G1 X142.692 Y137.851 F30000
; LINE_WIDTH: 0.405157
G1 F15000
G1 X142.398 Y137.797 E.00881
; LINE_WIDTH: 0.389446
G1 X142.205 Y137.774 E.00551
; LINE_WIDTH: 0.342434
G1 X142.011 Y137.75 E.00476
; LINE_WIDTH: 0.257331
G2 X141.793 Y137.725 I-.317 J1.798 E.00384
G2 X141.188 Y137.727 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X140.994 Y137.75 E.00327
; LINE_WIDTH: 0.295421
G1 X140.801 Y137.774 E.00401
; LINE_WIDTH: 0.342433
G1 X140.607 Y137.797 E.00476
; LINE_WIDTH: 0.389446
G1 X140.314 Y137.851 E.00842
G1 X139.691 Y138.023 F30000
; LINE_WIDTH: 0.13445
G1 F15000
G1 X139.529 Y138.206 E.00182
; WIPE_START
G1 F24000
G1 X139.691 Y138.023 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.017 J.669 P1  F30000
G1 X142.692 Y142.585 Z1.4
G1 Z1
G1 E.8 F1800
; LINE_WIDTH: 0.405156
G1 F15000
G1 X142.398 Y142.639 E.00881
; LINE_WIDTH: 0.389444
G1 X142.205 Y142.662 E.00551
; LINE_WIDTH: 0.342433
G1 X142.011 Y142.686 E.00476
; LINE_WIDTH: 0.257331
G3 X141.793 Y142.711 I-.317 J-1.798 E.00384
G3 X141.188 Y142.709 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X140.994 Y142.686 E.00327
; LINE_WIDTH: 0.295422
G1 X140.801 Y142.662 E.00401
; LINE_WIDTH: 0.342434
G1 X140.607 Y142.639 E.00476
; LINE_WIDTH: 0.389444
G1 X140.314 Y142.585 E.00842
G1 X139.691 Y142.412 F30000
; LINE_WIDTH: 0.134453
G1 F15000
G1 X139.529 Y142.23 E.00182
G1 X136.177 Y142.267 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.805 Y142.267 E.05401
G1 X138.773 Y141.299 E.04542
G3 X138.773 Y139.136 I2.288 J-1.082 E.07414
G1 X137.805 Y138.168 E.04542
G1 X134.228 Y138.168 E.11864
G1 X130.129 Y142.267 E.19231
G1 X126.552 Y142.267 E.11864
G1 X122.453 Y138.168 E.19231
G1 X118.876 Y138.168 E.11864
G1 X114.777 Y142.267 E.19231
G1 X111.2 Y142.267 E.11864
G1 X110.232 Y141.299 E.04542
G2 X110.232 Y139.136 I-2.288 J-1.082 E.07414
G1 X111.2 Y138.168 E.04542
G1 X114.777 Y138.168 E.11864
G1 X118.876 Y142.267 E.19231
G1 X122.453 Y142.267 E.11864
G1 X126.552 Y138.168 E.19231
G1 X130.129 Y138.168 E.11864
G1 X134.228 Y142.267 E.19231
G1 X132.6 Y142.267 E.05401
G1 X109.477 Y142.23 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969211
G1 F15000
G1 X109.315 Y142.412 E.00107
G1 X108.692 Y142.585 F30000
; LINE_WIDTH: 0.405156
G1 F15000
G1 X108.398 Y142.639 E.00881
; LINE_WIDTH: 0.389444
G1 X108.205 Y142.662 E.00551
; LINE_WIDTH: 0.342433
G1 X108.011 Y142.686 E.00476
; LINE_WIDTH: 0.257331
G3 X107.793 Y142.711 I-.317 J-1.798 E.00384
G3 X107.188 Y142.709 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X106.994 Y142.686 E.00327
; LINE_WIDTH: 0.295422
G1 X106.801 Y142.662 E.00401
; LINE_WIDTH: 0.342433
G1 X106.607 Y142.639 E.00476
; LINE_WIDTH: 0.389444
G1 X106.314 Y142.585 E.00842
G1 X105.473 Y142.412 F30000
; LINE_WIDTH: 0.151054
G1 F15000
G1 X105.321 Y142.015 E.00375
G1 X105.14 Y141.384 F30000
; LINE_WIDTH: 0.3918
G1 F15000
G1 X105.107 Y141.203 E.00524
; LINE_WIDTH: 0.349112
G1 X105.074 Y141.022 E.00459
; LINE_WIDTH: 0.306424
G1 X105.041 Y140.841 E.00395
; LINE_WIDTH: 0.267101
G3 X105.019 Y140.519 I2.628 J-.336 E.00589
; LINE_WIDTH: 0.228538
G1 X105.002 Y140.229 E.0044
; LINE_WIDTH: 0.261158
G3 X105.019 Y139.916 I2.594 J-.011 E.00557
; LINE_WIDTH: 0.298796
G1 X105.037 Y139.626 E.00607
; LINE_WIDTH: 0.306424
G1 X105.041 Y139.595 E.00068
; LINE_WIDTH: 0.349113
G1 X105.074 Y139.413 E.00459
; LINE_WIDTH: 0.391801
G1 X105.107 Y139.232 E.00524
; LINE_WIDTH: 0.434489
G1 X105.14 Y139.051 E.00588
G1 X105.321 Y138.421 F30000
; LINE_WIDTH: 0.151056
G1 F15000
G1 X105.473 Y138.023 E.00375
G1 X106.314 Y137.851 F30000
; LINE_WIDTH: 0.389444
G1 F15000
G1 X106.607 Y137.797 E.00842
; LINE_WIDTH: 0.342433
G1 X106.801 Y137.774 E.00476
; LINE_WIDTH: 0.295421
G1 X106.994 Y137.75 E.00401
; LINE_WIDTH: 0.24841
G1 X107.188 Y137.727 E.00327
; LINE_WIDTH: 0.257331
G3 X107.793 Y137.725 I.315 J4.984 E.01058
G3 X108.011 Y137.75 I-.098 J1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X108.205 Y137.774 E.00476
; LINE_WIDTH: 0.389444
G1 X108.398 Y137.797 E.00551
; LINE_WIDTH: 0.405155
G1 X108.692 Y137.851 E.00881
G1 X109.315 Y138.023 F30000
; LINE_WIDTH: 0.0969209
G1 F15000
G1 X109.477 Y138.206 E.00107
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.315 Y138.023 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/15
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
G3 Z1.4 I.945 J.767 P1  F30000
G1 X142.056 Y97.699 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X142.03 Y97.914 E.00718
G1 X108.673 Y97.914 E1.1065
G1 X108.647 Y97.699 E.00718
G1 X109.134 Y97.579 E.01663
G1 X109.605 Y97.332 E.01764
G1 X110.003 Y96.979 E.01765
G1 X110.305 Y96.541 E.01765
G1 X110.494 Y96.044 E.01765
G1 X110.558 Y95.516 E.01765
G1 X110.494 Y94.988 E.01765
G1 X110.305 Y94.49 E.01765
G1 X110.003 Y94.053 E.01765
G1 X109.605 Y93.7 E.01764
G1 X109.134 Y93.453 E.01764
G1 X108.647 Y93.333 E.01663
G1 X108.673 Y93.118 E.00718
G1 X142.03 Y93.118 E1.1065
G1 X142.056 Y93.333 E.00718
G1 X141.569 Y93.453 E.01663
G1 X141.098 Y93.7 E.01764
G1 X140.7 Y94.053 E.01765
G1 X140.398 Y94.49 E.01764
G1 X140.209 Y94.988 E.01765
G1 X140.145 Y95.516 E.01765
G1 X140.209 Y96.044 E.01765
G1 X140.398 Y96.541 E.01765
G1 X140.7 Y96.979 E.01764
G1 X141.098 Y97.332 E.01765
G1 X141.569 Y97.579 E.01764
G1 X141.998 Y97.685 E.01464
; WIPE_START
G1 F24000
G1 X142.03 Y97.914 E-.08794
G1 X140.261 Y97.914 E-.67206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.471 J1.122 P1  F30000
G1 X143.95 Y96.366 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.708 Y96.717 E.01312
G1 X143.381 Y97.007 E.01342
G1 X142.994 Y97.21 E.01342
G1 X142.57 Y97.314 E.01342
G1 X142.133 Y97.314 E.01342
G1 X141.709 Y97.21 E.01342
G1 X141.322 Y97.007 E.01342
G1 X140.996 Y96.717 E.01342
G1 X140.748 Y96.358 E.01342
G1 X140.593 Y95.949 E.01342
G1 X140.54 Y95.516 E.01342
G1 X140.593 Y95.082 E.01342
G1 X140.748 Y94.674 E.01342
G1 X140.996 Y94.315 E.01342
G1 X141.322 Y94.025 E.01342
G1 X141.709 Y93.822 E.01342
G1 X142.133 Y93.717 E.01342
G1 X142.57 Y93.717 E.01342
G1 X142.994 Y93.822 E.01342
G1 X143.381 Y94.025 E.01342
G1 X143.708 Y94.315 E.01342
G1 X143.856 Y94.529 E.00803
G1 X143.956 Y94.674 E.00539
G1 X144.11 Y95.082 E.01342
G1 X144.163 Y95.516 E.01342
G1 X144.11 Y95.949 E.01342
G1 X143.973 Y96.311 E.01187
M204 S10000
; WIPE_START
G1 F24000
G1 X143.708 Y96.717 E-.1846
G1 X143.381 Y97.007 E-.16595
G1 X142.994 Y97.21 E-.16595
G1 X142.57 Y97.314 E-.16595
G1 X142.366 Y97.314 E-.07754
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.81 J.908 P1  F30000
G1 X144.749 Y95.188 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X144.52 Y95.202 E.00763
G1 X144.494 Y94.988 E.00717
G1 X144.305 Y94.49 E.01765
G1 X144.003 Y94.053 E.01764
G1 X143.605 Y93.7 E.01765
G1 X143.134 Y93.453 E.01764
G1 X142.647 Y93.333 E.01663
G1 X142.673 Y93.118 E.00718
G1 X144.749 Y93.118 E.06887
G1 X144.749 Y95.128 E.06669
; WIPE_START
G1 F24000
G1 X144.52 Y95.202 E-.09162
G1 X144.494 Y94.988 E-.08209
G1 X144.305 Y94.49 E-.20213
G1 X144.003 Y94.053 E-.20213
G1 X143.645 Y93.735 E-.18202
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.177 J.311 P1  F30000
G1 X144.749 Y97.914 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15476.087
G1 X142.673 Y97.914 E.06887
G1 X142.647 Y97.699 E.00718
G1 X143.134 Y97.579 E.01663
G1 X143.605 Y97.332 E.01764
G1 X144.003 Y96.979 E.01765
G1 X144.305 Y96.541 E.01764
G1 X144.494 Y96.044 E.01765
G1 X144.52 Y95.829 E.00717
G1 X144.749 Y95.843 E.00763
G1 X144.749 Y97.854 E.06669
; WIPE_START
G1 F24000
G1 X142.75 Y97.911 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.09 J-1.214 P1  F30000
G1 X106.183 Y95.202 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15476.087
G1 X105.954 Y95.188 E.00763
G1 X105.954 Y93.118 E.06868
G1 X108.03 Y93.118 E.06887
G1 X108.056 Y93.333 E.00718
G1 X107.569 Y93.453 E.01663
G1 X107.098 Y93.7 E.01764
G1 X106.7 Y94.053 E.01764
G1 X106.398 Y94.49 E.01765
G1 X106.209 Y94.988 E.01764
G1 X106.19 Y95.143 E.00518
; WIPE_START
G1 F24000
G1 X105.954 Y95.188 E-.09162
G1 X105.954 Y93.429 E-.66838
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.137 J.433 P1  F30000
G1 X107.312 Y96.997 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.996 Y96.717 E.01297
G1 X106.748 Y96.358 E.01342
G1 X106.593 Y95.949 E.01342
G1 X106.54 Y95.516 E.01342
G1 X106.593 Y95.082 E.01342
G1 X106.748 Y94.674 E.01342
G1 X106.996 Y94.315 E.01342
G1 X107.322 Y94.025 E.01342
G1 X107.709 Y93.822 E.01342
G1 X108.133 Y93.717 E.01342
G1 X108.57 Y93.717 E.01342
G1 X108.994 Y93.822 E.01342
G1 X109.381 Y94.025 E.01342
M73 P69 R3
G1 X109.708 Y94.315 E.01342
G1 X109.956 Y94.674 E.01342
G1 X110.11 Y95.082 E.01342
G1 X110.163 Y95.516 E.01342
G1 X110.11 Y95.949 E.01342
G1 X109.956 Y96.358 E.01342
G1 X109.708 Y96.717 E.01342
G1 X109.381 Y97.007 E.01342
G1 X108.994 Y97.21 E.01342
G1 X108.57 Y97.314 E.01342
G1 X108.133 Y97.314 E.01342
G1 X107.709 Y97.21 E.01342
G1 X107.363 Y97.028 E.01203
M204 S10000
G1 X107.133 Y97.35 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.569 Y97.579 E.01633
G1 X108.056 Y97.699 E.01663
G1 X108.03 Y97.914 E.00718
G1 X105.954 Y97.914 E.06887
G1 X105.954 Y95.843 E.06868
G1 X106.183 Y95.829 E.00763
G1 X106.209 Y96.044 E.00717
G1 X106.398 Y96.541 E.01765
G1 X106.7 Y96.979 E.01764
G1 X107.083 Y97.318 E.01697
; WIPE_START
G1 F24000
G1 X107.569 Y97.579 E-.20965
G1 X108.056 Y97.699 E-.19055
G1 X108.03 Y97.914 E-.08223
G1 X107.299 Y97.914 E-.27757
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.013 J1.217 P1  F30000
G1 X145.142 Y98.306 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X105.562 Y98.306 E1.21618
G1 X105.562 Y92.726 E.17146
G1 X145.142 Y92.726 E1.21618
G1 X145.142 Y98.246 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X143.142 Y98.249 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.652 J1.027 P1  F30000
G1 X144.546 Y97.357 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.28281
G1 F15000
G1 X143.418 Y97.71 E.02311
G1 X144.152 Y97.71 F30000
; LINE_WIDTH: 0.511103
G1 F13456.297
G1 X144.546 Y96.675 E.04224
G1 X144.354 Y95.623 F30000
; LINE_WIDTH: 0.271406
G1 F15000
G1 X144.475 Y95.516 E.00301
; LINE_WIDTH: 0.311995
G1 X144.946 Y95.516 E.01032
G1 X144.546 Y94.356 F30000
; LINE_WIDTH: 0.470051
G1 F14749.571
G1 X144.152 Y93.321 E.03854
G1 X144.546 Y93.674 F30000
; LINE_WIDTH: 0.282811
G1 F15000
G1 X143.418 Y93.321 E.02311
G1 X142.352 Y92.922 F30000
; LINE_WIDTH: 0.305086
G1 F15000
G1 X142.352 Y93.222 E.0064
; LINE_WIDTH: 0.25884
G1 X142.352 Y93.521 E.00527
G1 X141.298 Y93.342 F30000
; LINE_WIDTH: 0.108847
G1 F15000
G2 X141.144 Y93.419 I.025 J.242 E.00095
G1 X139.89 Y94.848 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X140.414 Y93.466 E.04901
G1 X110.289 Y93.466 E.99928
G1 X110.721 Y94.604 E.04037
G3 X110.699 Y96.485 I-2.375 J.913 E.06392
G1 X110.289 Y97.565 E.03832
G1 X140.414 Y97.565 E.99928
G1 X139.869 Y96.128 E.051
G3 X139.869 Y94.904 I2.483 J-.612 E.041
G1 X141.144 Y97.612 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.108846
G1 F15000
G2 X141.298 Y97.69 I.179 J-.165 E.00095
G1 X142.352 Y97.51 F30000
; LINE_WIDTH: 0.258838
G1 F15000
G1 X142.352 Y97.81 E.00527
; LINE_WIDTH: 0.305084
G1 X142.352 Y98.11 E.0064
G1 X137.433 Y97.158 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.061 Y97.158 E.05401
G1 X139.614 Y96.605 E.02595
G3 X139.614 Y94.426 I2.3 J-1.089 E.07468
G1 X139.061 Y93.873 E.02595
G1 X134.67 Y93.873 E.14565
G1 X131.385 Y97.158 E.15411
G1 X134.67 Y97.158 E.10897
G1 X131.385 Y93.873 E.15411
G1 X126.994 Y93.873 E.14565
G1 X123.709 Y97.158 E.15411
G1 X126.994 Y97.158 E.10897
G1 X123.709 Y93.873 E.15411
G1 X122.081 Y93.873 E.05401
G1 X120.946 Y97.158 F30000
G1 F15476.087
G1 X119.318 Y97.158 E.05401
G1 X116.033 Y93.873 E.15411
G1 X119.318 Y93.873 E.10897
G1 X116.033 Y97.158 E.15411
G1 X111.642 Y97.158 E.14565
G1 X111.089 Y96.605 E.02596
G2 X111.089 Y94.426 I-2.743 J-1.089 E.07402
G1 X111.642 Y93.873 E.02596
G1 X113.271 Y93.873 E.05401
G1 X109.559 Y93.419 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104412
G1 F15000
G2 X109.405 Y93.342 I-.179 J.165 E.00088
G1 X108.352 Y93.521 F30000
; LINE_WIDTH: 0.258838
G1 F15000
G1 X108.352 Y93.222 E.00527
; LINE_WIDTH: 0.305084
G1 X108.352 Y92.922 E.0064
G1 X107.286 Y93.321 F30000
; LINE_WIDTH: 0.265389
G1 F15000
G1 X106.157 Y93.674 E.02143
M73 P70 R3
G1 X106.551 Y93.321 F30000
; LINE_WIDTH: 0.511107
G1 F13456.171
G1 X106.157 Y94.356 E.04224
G1 X106.157 Y96.675 F30000
; LINE_WIDTH: 0.511106
G1 F13456.19
G1 X106.551 Y97.71 E.04224
G1 X106.157 Y97.357 F30000
; LINE_WIDTH: 0.265392
G1 F15000
G1 X107.285 Y97.71 E.02143
G1 X108.352 Y98.11 F30000
; LINE_WIDTH: 0.305086
G1 F15000
G1 X108.352 Y97.81 E.0064
; LINE_WIDTH: 0.25884
G1 X108.352 Y97.51 E.00527
G1 X109.405 Y97.69 F30000
; LINE_WIDTH: 0.104411
G1 F15000
G2 X109.559 Y97.612 I-.025 J-.242 E.00088
; WIPE_START
G1 F24000
G1 X109.471 Y97.673 E-.46676
G1 X109.405 Y97.69 E-.29324
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.398 J1.15 P1  F30000
G1 X142.722 Y109.211 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X142.696 Y109.426 E.00718
G1 X109.339 Y109.426 E1.1065
G1 X109.313 Y109.211 E.00718
G1 X109.8 Y109.091 E.01663
G1 X110.271 Y108.844 E.01764
G1 X110.669 Y108.491 E.01765
G1 X110.971 Y108.053 E.01765
G1 X111.16 Y107.556 E.01765
G1 X111.224 Y107.028 E.01765
G1 X111.16 Y106.5 E.01765
G1 X110.971 Y106.002 E.01765
G1 X110.669 Y105.565 E.01765
G1 X110.271 Y105.212 E.01764
G1 X109.8 Y104.965 E.01764
G1 X109.313 Y104.845 E.01663
G1 X109.339 Y104.63 E.00718
G1 X142.696 Y104.63 E1.1065
G1 X142.722 Y104.845 E.00718
G1 X142.235 Y104.965 E.01663
G1 X141.764 Y105.212 E.01764
G1 X141.366 Y105.565 E.01765
G1 X141.064 Y106.002 E.01764
G1 X140.875 Y106.5 E.01765
G1 X140.811 Y107.028 E.01765
G1 X140.875 Y107.556 E.01765
G1 X141.064 Y108.053 E.01765
G1 X141.366 Y108.491 E.01764
G1 X141.764 Y108.844 E.01765
G1 X142.235 Y109.091 E.01764
G1 X142.664 Y109.197 E.01464
; WIPE_START
G1 F24000
G1 X142.696 Y109.426 E-.08794
G1 X140.927 Y109.426 E-.67206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.471 J1.122 P1  F30000
G1 X144.616 Y107.878 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.374 Y108.229 E.01312
G1 X144.047 Y108.519 E.01342
G1 X143.66 Y108.722 E.01342
G1 X143.236 Y108.826 E.01342
G1 X142.799 Y108.826 E.01342
G1 X142.375 Y108.722 E.01342
G1 X141.989 Y108.519 E.01342
G1 X141.662 Y108.229 E.01342
G1 X141.414 Y107.87 E.01342
G1 X141.259 Y107.461 E.01342
G1 X141.206 Y107.028 E.01342
G1 X141.259 Y106.594 E.01342
G1 X141.414 Y106.186 E.01342
G1 X141.662 Y105.827 E.01342
G1 X141.989 Y105.537 E.01342
G1 X142.375 Y105.334 E.01342
G1 X142.799 Y105.23 E.01342
G1 X143.236 Y105.23 E.01342
G1 X143.66 Y105.334 E.01342
G1 X144.047 Y105.537 E.01342
G1 X144.374 Y105.827 E.01342
G1 X144.522 Y106.042 E.00803
G1 X144.622 Y106.186 E.00539
G1 X144.777 Y106.594 E.01342
G1 X144.829 Y107.028 E.01342
G1 X144.777 Y107.461 E.01342
G1 X144.64 Y107.823 E.01187
M204 S10000
; WIPE_START
G1 F24000
G1 X144.374 Y108.229 E-.1846
G1 X144.047 Y108.519 E-.16595
G1 X143.66 Y108.722 E-.16595
G1 X143.236 Y108.826 E-.16595
G1 X143.032 Y108.826 E-.07754
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.81 J.908 P1  F30000
G1 X145.416 Y106.7 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.186 Y106.714 E.00763
G1 X145.16 Y106.5 E.00717
G1 X144.971 Y106.002 E.01765
G1 X144.669 Y105.565 E.01764
G1 X144.271 Y105.212 E.01765
G1 X143.8 Y104.965 E.01764
G1 X143.313 Y104.845 E.01663
G1 X143.339 Y104.63 E.00718
G1 X145.416 Y104.63 E.06887
G1 X145.416 Y106.64 E.06669
; WIPE_START
G1 F24000
G1 X145.186 Y106.714 E-.09162
G1 X145.16 Y106.5 E-.08209
G1 X144.971 Y106.002 E-.20213
G1 X144.669 Y105.565 E-.20213
G1 X144.311 Y105.247 E-.18202
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.177 J.311 P1  F30000
G1 X145.416 Y109.426 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15476.087
G1 X143.339 Y109.426 E.06887
G1 X143.313 Y109.211 E.00718
G1 X143.8 Y109.091 E.01663
G1 X144.271 Y108.844 E.01764
G1 X144.669 Y108.491 E.01765
G1 X144.971 Y108.053 E.01764
G1 X145.16 Y107.556 E.01765
G1 X145.186 Y107.341 E.00717
G1 X145.416 Y107.355 E.00763
G1 X145.416 Y109.366 E.06669
; WIPE_START
G1 F24000
G1 X143.416 Y109.424 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.09 J-1.214 P1  F30000
G1 X106.849 Y106.714 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15476.087
G1 X106.62 Y106.7 E.00763
G1 X106.62 Y104.63 E.06868
G1 X108.696 Y104.63 E.06887
G1 X108.722 Y104.845 E.00718
G1 X108.235 Y104.965 E.01663
G1 X107.764 Y105.212 E.01764
G1 X107.366 Y105.565 E.01764
G1 X107.064 Y106.002 E.01765
G1 X106.875 Y106.5 E.01764
G1 X106.856 Y106.655 E.00518
; WIPE_START
G1 F24000
G1 X106.62 Y106.7 E-.09162
G1 X106.62 Y104.941 E-.66838
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.137 J.433 P1  F30000
G1 X107.978 Y108.509 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.662 Y108.229 E.01297
G1 X107.414 Y107.87 E.01342
G1 X107.259 Y107.461 E.01342
G1 X107.206 Y107.028 E.01342
G1 X107.259 Y106.594 E.01342
G1 X107.414 Y106.186 E.01342
G1 X107.662 Y105.827 E.01342
G1 X107.989 Y105.537 E.01342
G1 X108.375 Y105.334 E.01342
G1 X108.799 Y105.23 E.01342
G1 X109.236 Y105.23 E.01342
G1 X109.66 Y105.334 E.01342
G1 X110.047 Y105.537 E.01342
G1 X110.374 Y105.827 E.01342
G1 X110.622 Y106.186 E.01342
G1 X110.777 Y106.594 E.01342
G1 X110.829 Y107.028 E.01342
G1 X110.777 Y107.461 E.01342
G1 X110.622 Y107.87 E.01342
G1 X110.374 Y108.229 E.01342
G1 X110.047 Y108.519 E.01342
G1 X109.66 Y108.722 E.01342
G1 X109.236 Y108.826 E.01342
G1 X108.799 Y108.826 E.01342
G1 X108.375 Y108.722 E.01342
G1 X108.029 Y108.54 E.01203
M204 S10000
G1 X107.799 Y108.862 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X108.235 Y109.091 E.01633
G1 X108.722 Y109.211 E.01663
G1 X108.696 Y109.426 E.00718
G1 X106.62 Y109.426 E.06887
G1 X106.62 Y107.355 E.06868
G1 X106.849 Y107.341 E.00763
G1 X106.875 Y107.556 E.00717
G1 X107.064 Y108.053 E.01765
G1 X107.366 Y108.491 E.01764
G1 X107.749 Y108.83 E.01697
; WIPE_START
G1 F24000
G1 X108.235 Y109.091 E-.20965
G1 X108.722 Y109.211 E-.19055
G1 X108.696 Y109.426 E-.08223
G1 X107.966 Y109.426 E-.27757
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.013 J1.217 P1  F30000
G1 X145.808 Y109.818 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.228 Y109.818 E1.21618
G1 X106.228 Y104.238 E.17146
G1 X145.808 Y104.238 E1.21618
G1 X145.808 Y109.758 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X143.808 Y109.761 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.652 J1.027 P1  F30000
G1 X145.212 Y108.869 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.28281
G1 F15000
G1 X144.084 Y109.222 E.02311
G1 X144.818 Y109.222 F30000
; LINE_WIDTH: 0.511103
G1 F13456.297
G1 X145.212 Y108.188 E.04224
G1 X145.02 Y107.135 F30000
; LINE_WIDTH: 0.271406
G1 F15000
G1 X145.141 Y107.028 E.00301
; LINE_WIDTH: 0.311995
G1 X145.612 Y107.028 E.01032
G1 X145.212 Y105.868 F30000
; LINE_WIDTH: 0.470051
G1 F14749.571
G1 X144.818 Y104.833 E.03854
G1 X145.212 Y105.187 F30000
; LINE_WIDTH: 0.282811
G1 F15000
G1 X144.084 Y104.833 E.02311
G1 X143.018 Y104.434 F30000
; LINE_WIDTH: 0.305086
G1 F15000
G1 X143.018 Y104.734 E.0064
; LINE_WIDTH: 0.25884
G1 X143.018 Y105.033 E.00527
G1 X141.964 Y104.854 F30000
; LINE_WIDTH: 0.108847
G1 F15000
G2 X141.81 Y104.931 I.025 J.242 E.00095
G1 X140.556 Y106.36 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X141.08 Y104.978 E.04901
G1 X110.955 Y104.978 E.99928
G1 X111.387 Y106.116 E.04037
G3 X111.365 Y107.997 I-2.375 J.913 E.06392
G1 X110.955 Y109.078 E.03832
G1 X141.08 Y109.078 E.99928
G1 X140.535 Y107.64 E.051
G3 X140.535 Y106.416 I2.483 J-.612 E.041
G1 X141.81 Y109.124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.108846
G1 F15000
G2 X141.964 Y109.202 I.179 J-.165 E.00095
G1 X143.018 Y109.022 F30000
; LINE_WIDTH: 0.258838
G1 F15000
G1 X143.018 Y109.322 E.00527
; LINE_WIDTH: 0.305084
G1 X143.018 Y109.622 E.0064
G1 X138.099 Y108.67 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.727 Y108.67 E.05401
G1 X140.28 Y108.117 E.02595
G3 X140.28 Y105.939 I2.3 J-1.089 E.07468
G1 X139.727 Y105.385 E.02595
G1 X135.336 Y105.385 E.14565
G1 X132.051 Y108.67 E.15411
G1 X135.336 Y108.67 E.10897
G1 X132.051 Y105.385 E.15411
G1 X127.66 Y105.385 E.14565
G1 X124.375 Y108.67 E.15411
G1 X127.66 Y108.67 E.10897
G1 X124.375 Y105.385 E.15411
G1 X122.747 Y105.385 E.05401
G1 X121.613 Y108.67 F30000
G1 F15476.087
G1 X119.984 Y108.67 E.05401
G1 X116.699 Y105.385 E.15411
G1 X119.984 Y105.385 E.10897
G1 X116.699 Y108.67 E.15411
G1 X112.308 Y108.67 E.14565
G1 X111.755 Y108.117 E.02596
G2 X111.755 Y105.939 I-2.743 J-1.089 E.07402
G1 X112.308 Y105.385 E.02596
G1 X113.937 Y105.385 E.05401
G1 X110.225 Y104.931 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104412
G1 F15000
G2 X110.071 Y104.854 I-.179 J.165 E.00088
G1 X109.018 Y105.033 F30000
; LINE_WIDTH: 0.258838
G1 F15000
G1 X109.018 Y104.734 E.00527
; LINE_WIDTH: 0.305084
G1 X109.018 Y104.434 E.0064
G1 X107.952 Y104.833 F30000
; LINE_WIDTH: 0.265389
G1 F15000
G1 X106.823 Y105.186 E.02143
G1 X107.217 Y104.833 F30000
; LINE_WIDTH: 0.511107
G1 F13456.171
G1 X106.823 Y105.868 E.04224
G1 X106.823 Y108.188 F30000
; LINE_WIDTH: 0.511106
G1 F13456.19
G1 X107.217 Y109.222 E.04224
G1 X106.823 Y108.869 F30000
; LINE_WIDTH: 0.265392
G1 F15000
G1 X107.952 Y109.222 E.02143
G1 X109.018 Y109.622 F30000
; LINE_WIDTH: 0.305086
G1 F15000
G1 X109.018 Y109.322 E.0064
; LINE_WIDTH: 0.25884
G1 X109.018 Y109.022 E.00527
G1 X110.071 Y109.202 F30000
; LINE_WIDTH: 0.104411
G1 F15000
G2 X110.225 Y109.124 I-.025 J-.242 E.00088
; WIPE_START
G1 F24000
G1 X110.137 Y109.186 E-.46676
G1 X110.071 Y109.202 E-.29324
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.544 J1.089 P1  F30000
G1 X136.503 Y122.406 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X136.376 Y122.473 E.00478
G1 X135.905 Y122.89 E.02084
G1 X135.548 Y123.407 E.02084
G1 X135.325 Y123.995 E.02084
G1 X135.25 Y124.618 E.02084
G1 X135.325 Y125.242 E.02084
G1 X135.548 Y125.83 E.02084
G1 X135.905 Y126.347 E.02084
G1 X136.376 Y126.763 E.02084
G1 X136.503 Y126.831 E.00478
G1 X136.457 Y127.016 E.00635
G1 X105.255 Y127.016 E1.03504
G1 X105.209 Y126.831 E.00635
G1 X105.337 Y126.763 E.00478
G1 X105.807 Y126.347 E.02084
G1 X106.164 Y125.83 E.02084
G1 X106.387 Y125.242 E.02084
G1 X106.463 Y124.618 E.02084
G1 X106.387 Y123.995 E.02084
G1 X106.164 Y123.407 E.02084
G1 X105.807 Y122.89 E.02084
G1 X105.337 Y122.473 E.02084
G1 X105.209 Y122.406 E.00478
G1 X105.255 Y122.22 E.00635
G1 X136.457 Y122.22 E1.03504
G1 X136.489 Y122.348 E.00436
; WIPE_START
G1 F24000
G1 X136.376 Y122.473 E-.06419
G1 X135.905 Y122.89 E-.23878
G1 X135.548 Y123.407 E-.23878
G1 X135.345 Y123.944 E-.21825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.038 J1.216 P1  F30000
G1 X140.004 Y124.09 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X140.068 Y124.618 E.01634
G1 X140.003 Y125.148 E.01638
G1 X139.814 Y125.646 E.01638
G1 X139.512 Y126.085 E.01638
G1 X139.112 Y126.438 E.01638
G1 X138.64 Y126.686 E.01638
G1 X138.123 Y126.814 E.01638
G1 X137.59 Y126.814 E.01638
G1 X137.072 Y126.686 E.01638
G1 X136.6 Y126.438 E.01638
G1 X136.201 Y126.085 E.01638
G1 X135.898 Y125.646 E.01638
G1 X135.709 Y125.148 E.01638
G1 X135.645 Y124.618 E.01638
G1 X135.709 Y124.089 E.01638
G1 X135.898 Y123.591 E.01638
G1 X136.201 Y123.152 E.01638
G1 X136.6 Y122.798 E.01638
G1 X137.072 Y122.551 E.01638
G1 X137.59 Y122.423 E.01638
G1 X138.123 Y122.423 E.01638
G1 X138.64 Y122.551 E.01638
G1 X139.112 Y122.798 E.01638
G1 X139.512 Y123.152 E.01638
G1 X139.814 Y123.591 E.01638
G1 X139.983 Y124.034 E.01458
M204 S10000
G1 X140.083 Y123.289 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.807 Y122.89 E.01608
G1 X139.337 Y122.473 E.02084
G1 X139.209 Y122.406 E.00478
G1 X139.255 Y122.22 E.00635
G1 X140.254 Y122.22 E.03314
G1 X140.254 Y123.235 E.03367
G1 X140.14 Y123.271 E.00397
; WIPE_START
G1 F24000
G1 X139.807 Y122.89 E-.19221
G1 X139.337 Y122.473 E-.23878
G1 X139.209 Y122.406 E-.0548
G1 X139.255 Y122.22 E-.07271
M73 P71 R3
G1 X139.785 Y122.22 E-.2015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.213 J.097 P1  F30000
G1 X140.083 Y125.948 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15476.087
G1 X140.254 Y126.001 E.00596
G1 X140.254 Y127.016 E.03367
G1 X139.255 Y127.016 E.03314
G1 X139.209 Y126.831 E.00635
G1 X139.337 Y126.763 E.00478
G1 X139.807 Y126.347 E.02084
G1 X140.048 Y125.997 E.01409
; WIPE_START
G1 F24000
G1 X140.254 Y126.001 E-.07817
G1 X140.254 Y127.016 E-.38568
G1 X139.475 Y127.016 E-.29616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.105 J-1.212 P1  F30000
G1 X106.005 Y124.106 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.068 Y124.618 E.01587
G1 X106.003 Y125.148 E.01638
G1 X105.932 Y125.337 E.00622
G1 X105.814 Y125.646 E.01017
G1 X105.512 Y126.085 E.01638
G1 X105.112 Y126.438 E.01638
G1 X104.64 Y126.686 E.01638
G1 X104.123 Y126.814 E.01638
G1 X103.59 Y126.814 E.01638
G1 X103.072 Y126.686 E.01638
G1 X102.6 Y126.438 E.01638
G1 X102.201 Y126.085 E.01638
G1 X101.898 Y125.646 E.01638
G1 X101.709 Y125.148 E.01638
G1 X101.645 Y124.618 E.01638
G1 X101.709 Y124.089 E.01638
G1 X101.898 Y123.591 E.01638
G1 X102.201 Y123.152 E.01638
G1 X102.6 Y122.798 E.01638
G1 X103.072 Y122.551 E.01638
G1 X103.59 Y122.423 E.01638
G1 X104.123 Y122.423 E.01638
G1 X104.64 Y122.551 E.01638
G1 X105.112 Y122.798 E.01638
G1 X105.512 Y123.152 E.01638
G1 X105.814 Y123.591 E.01638
G1 X105.988 Y124.049 E.01505
M204 S10000
; WIPE_START
G1 F24000
G1 X106.068 Y124.618 E-.2186
G1 X106.003 Y125.148 E-.2026
G1 X105.932 Y125.337 E-.07687
G1 X105.814 Y125.646 E-.12573
G1 X105.611 Y125.941 E-.13621
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.914 J-.804 P1  F30000
G1 X102.503 Y122.406 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X102.376 Y122.473 E.00478
G1 X101.905 Y122.89 E.02084
G1 X101.63 Y123.289 E.01608
G1 X101.458 Y123.235 E.00596
G1 X101.458 Y122.22 E.03367
G1 X102.457 Y122.22 E.03314
G1 X102.489 Y122.348 E.00436
; WIPE_START
G1 F24000
G1 X102.376 Y122.473 E-.06419
G1 X101.905 Y122.89 E-.23878
G1 X101.63 Y123.289 E-.18419
G1 X101.458 Y123.235 E-.06829
G1 X101.458 Y122.697 E-.20454
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.18 J.298 P1  F30000
G1 X102.503 Y126.831 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15476.087
G1 X102.457 Y127.016 E.00635
G1 X101.458 Y127.016 E.03314
G1 X101.458 Y126.001 E.03367
G1 X101.63 Y125.948 E.00596
G1 X101.905 Y126.347 E.01608
G1 X102.376 Y126.763 E.02084
G1 X102.45 Y126.803 E.00279
; WIPE_START
G1 F24000
G1 X102.457 Y127.016 E-.08125
G1 X101.458 Y127.016 E-.37968
G1 X101.458 Y126.229 E-.29907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.037 J1.216 P1  F30000
G1 X140.646 Y127.408 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X101.066 Y127.408 E1.21618
G1 X101.066 Y121.828 E.17146
G1 X140.646 Y121.828 E1.21618
G1 X140.646 Y127.348 E.16961
M204 S10000
G1 X139.886 Y126.813 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151056
G1 F15000
G1 X140.038 Y126.415 E.00375
G1 X140.219 Y125.785 F30000
; LINE_WIDTH: 0.434489
G1 F15000
G1 X140.252 Y125.604 E.00588
; LINE_WIDTH: 0.391801
G1 X140.285 Y125.423 E.00524
; LINE_WIDTH: 0.349112
G1 X140.318 Y125.242 E.00459
; LINE_WIDTH: 0.306424
G1 X140.322 Y125.21 E.00068
; LINE_WIDTH: 0.298796
G1 X140.34 Y124.92 E.00607
; LINE_WIDTH: 0.261158
G2 X140.357 Y124.607 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X140.34 Y124.317 E.0044
; LINE_WIDTH: 0.267101
G2 X140.318 Y123.995 I-2.649 J.015 E.00589
; LINE_WIDTH: 0.306424
G1 X140.285 Y123.814 E.00395
; LINE_WIDTH: 0.349112
G1 X140.252 Y123.633 E.00459
; LINE_WIDTH: 0.3918
G1 X140.219 Y123.452 E.00524
G1 X140.038 Y122.822 F30000
; LINE_WIDTH: 0.141574
G1 F15000
G1 X139.886 Y122.424 E.00342
G1 X139.045 Y122.252 F30000
; LINE_WIDTH: 0.405155
G1 F15000
G1 X138.752 Y122.198 E.00881
; LINE_WIDTH: 0.389444
G1 X138.558 Y122.174 E.00551
; LINE_WIDTH: 0.342433
G1 X138.365 Y122.151 E.00476
; LINE_WIDTH: 0.257331
G2 X138.147 Y122.126 I-.316 J1.798 E.00384
G2 X137.541 Y122.127 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X137.348 Y122.151 E.00327
; LINE_WIDTH: 0.295421
G1 X137.154 Y122.174 E.00401
; LINE_WIDTH: 0.342433
G1 X136.96 Y122.198 E.00476
; LINE_WIDTH: 0.389446
G1 X136.667 Y122.252 E.00842
G1 X136.044 Y122.424 F30000
; LINE_WIDTH: 0.13445
G1 F15000
G1 X135.882 Y122.606 E.00182
; WIPE_START
G1 F24000
G1 X136.044 Y122.424 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.017 J.669 P1  F30000
G1 X139.045 Y126.985 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.405154
G1 F15000
G1 X138.752 Y127.039 E.00881
; LINE_WIDTH: 0.389442
G1 X138.558 Y127.063 E.00551
; LINE_WIDTH: 0.342432
G1 X138.365 Y127.086 E.00476
; LINE_WIDTH: 0.257331
G3 X138.147 Y127.111 I-.316 J-1.798 E.00384
G3 X137.541 Y127.11 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X137.348 Y127.086 E.00327
; LINE_WIDTH: 0.295422
G1 X137.154 Y127.063 E.00401
; LINE_WIDTH: 0.342433
G1 X136.96 Y127.039 E.00476
; LINE_WIDTH: 0.389444
G1 X136.667 Y126.985 E.00842
G1 X136.044 Y126.813 F30000
; LINE_WIDTH: 0.13445
G1 F15000
G1 X135.882 Y126.63 E.00182
G1 X132.53 Y126.668 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X134.158 Y126.668 E.05401
G1 X135.127 Y125.7 E.04542
G3 X135.127 Y123.537 I2.288 J-1.082 E.07414
G1 X134.158 Y122.569 E.04542
G1 X130.582 Y122.569 E.11864
G1 X126.482 Y126.668 E.19231
G1 X122.906 Y126.668 E.11864
G1 X118.807 Y122.569 E.19231
G1 X115.23 Y122.569 E.11864
G1 X111.131 Y126.668 E.19231
G1 X107.554 Y126.668 E.11864
G1 X106.586 Y125.7 E.04542
G2 X106.586 Y123.537 I-2.288 J-1.082 E.07414
G1 X107.554 Y122.569 E.04542
G1 X111.131 Y122.569 E.11864
G1 X115.23 Y126.668 E.19231
G1 X118.807 Y126.668 E.11864
G1 X122.906 Y122.569 E.19231
G1 X126.482 Y122.569 E.11864
G1 X130.582 Y126.668 E.19231
G1 X128.953 Y126.668 E.05401
G1 X105.83 Y126.63 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969211
G1 F15000
G1 X105.668 Y126.813 E.00107
G1 X105.045 Y126.985 F30000
; LINE_WIDTH: 0.405154
G1 F15000
G1 X104.752 Y127.039 E.00881
; LINE_WIDTH: 0.389442
G1 X104.558 Y127.063 E.00551
; LINE_WIDTH: 0.342432
G1 X104.365 Y127.086 E.00476
; LINE_WIDTH: 0.257331
G3 X104.147 Y127.111 I-.317 J-1.798 E.00384
G3 X103.541 Y127.11 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X103.348 Y127.086 E.00327
; LINE_WIDTH: 0.295422
G1 X103.154 Y127.063 E.00401
; LINE_WIDTH: 0.342433
G1 X102.96 Y127.039 E.00476
; LINE_WIDTH: 0.389442
G1 X102.667 Y126.985 E.00842
G1 X101.826 Y126.813 F30000
; LINE_WIDTH: 0.151054
G1 F15000
G1 X101.675 Y126.415 E.00375
G1 X101.494 Y125.785 F30000
; LINE_WIDTH: 0.3918
G1 F15000
G1 X101.46 Y125.604 E.00524
; LINE_WIDTH: 0.349112
G1 X101.427 Y125.423 E.00459
; LINE_WIDTH: 0.306424
G1 X101.394 Y125.242 E.00395
; LINE_WIDTH: 0.267101
G3 X101.373 Y124.92 I2.628 J-.336 E.00589
; LINE_WIDTH: 0.228538
G1 X101.355 Y124.63 E.0044
; LINE_WIDTH: 0.261158
G3 X101.373 Y124.317 I2.594 J-.011 E.00557
; LINE_WIDTH: 0.298796
G1 X101.39 Y124.026 E.00607
; LINE_WIDTH: 0.306424
G1 X101.394 Y123.995 E.00068
; LINE_WIDTH: 0.349113
G1 X101.427 Y123.814 E.00459
; LINE_WIDTH: 0.391801
G1 X101.46 Y123.633 E.00524
; LINE_WIDTH: 0.434489
G1 X101.494 Y123.452 E.00588
G1 X101.675 Y122.822 F30000
; LINE_WIDTH: 0.151056
G1 F15000
G1 X101.826 Y122.424 E.00375
G1 X102.667 Y122.252 F30000
; LINE_WIDTH: 0.389444
G1 F15000
G1 X102.96 Y122.198 E.00842
; LINE_WIDTH: 0.342433
G1 X103.154 Y122.174 E.00476
; LINE_WIDTH: 0.295421
G1 X103.348 Y122.151 E.00401
; LINE_WIDTH: 0.24841
G1 X103.541 Y122.127 E.00327
; LINE_WIDTH: 0.257331
G3 X104.147 Y122.126 I.315 J4.984 E.01058
G3 X104.365 Y122.151 I-.098 J1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X104.558 Y122.174 E.00476
; LINE_WIDTH: 0.389444
G1 X104.752 Y122.198 E.00551
; LINE_WIDTH: 0.405155
G1 X105.045 Y122.252 E.00881
G1 X105.668 Y122.424 F30000
; LINE_WIDTH: 0.0969209
G1 F15000
G1 X105.83 Y122.607 E.00107
; WIPE_START
G1 F24000
G1 X105.668 Y122.424 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.501 J1.109 P1  F30000
G1 X140.15 Y138.006 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X140.022 Y138.073 E.00478
G1 X139.552 Y138.489 E.02084
G1 X139.195 Y139.007 E.02084
G1 X138.972 Y139.594 E.02084
G1 X138.896 Y140.218 E.02084
G1 X138.972 Y140.842 E.02084
G1 X139.195 Y141.429 E.02084
G1 X139.552 Y141.946 E.02084
G1 X140.022 Y142.363 E.02084
G1 X140.15 Y142.43 E.00478
G1 X140.104 Y142.616 E.00635
G1 X108.901 Y142.616 E1.03504
G1 X108.856 Y142.43 E.00635
G1 X108.983 Y142.363 E.00478
G1 X109.454 Y141.946 E.02084
G1 X109.811 Y141.429 E.02084
G1 X110.033 Y140.842 E.02084
G1 X110.109 Y140.218 E.02084
G1 X110.033 Y139.594 E.02084
G1 X109.811 Y139.007 E.02084
G1 X109.454 Y138.489 E.02084
G1 X108.983 Y138.073 E.02084
G1 X108.856 Y138.006 E.00478
G1 X108.901 Y137.82 E.00635
G1 X140.104 Y137.82 E1.03504
G1 X140.135 Y137.947 E.00436
; WIPE_START
G1 F24000
G1 X140.022 Y138.073 E-.06419
G1 X139.552 Y138.489 E-.23878
G1 X139.195 Y139.007 E-.23878
G1 X138.991 Y139.544 E-.21825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.038 J1.216 P1  F30000
G1 X143.65 Y139.69 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.714 Y140.218 E.01634
G1 X143.65 Y140.747 E.01638
G1 X143.461 Y141.246 E.01638
G1 X143.158 Y141.684 E.01638
G1 X142.759 Y142.038 E.01638
G1 X142.287 Y142.286 E.01638
G1 X141.769 Y142.413 E.01638
G1 X141.236 Y142.413 E.01638
G1 X140.719 Y142.286 E.01638
G1 X140.246 Y142.038 E.01638
G1 X139.847 Y141.684 E.01638
G1 X139.545 Y141.246 E.01638
G1 X139.355 Y140.747 E.01638
G1 X139.291 Y140.218 E.01638
G1 X139.355 Y139.689 E.01638
G1 X139.545 Y139.19 E.01638
G1 X139.847 Y138.751 E.01638
G1 X140.246 Y138.398 E.01638
G1 X140.719 Y138.15 E.01638
G1 X141.236 Y138.022 E.01638
G1 X141.769 Y138.022 E.01638
G1 X142.287 Y138.15 E.01638
G1 X142.759 Y138.398 E.01638
G1 X143.158 Y138.751 E.01638
G1 X143.461 Y139.19 E.01638
G1 X143.629 Y139.634 E.01458
M204 S10000
G1 X143.729 Y138.888 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.454 Y138.489 E.01608
G1 X142.983 Y138.073 E.02084
G1 X142.856 Y138.006 E.00478
G1 X142.901 Y137.82 E.00635
G1 X143.901 Y137.82 E.03314
G1 X143.901 Y138.835 E.03367
G1 X143.786 Y138.87 E.00397
; WIPE_START
G1 F24000
G1 X143.454 Y138.489 E-.19221
G1 X142.983 Y138.073 E-.23878
G1 X142.856 Y138.006 E-.0548
G1 X142.901 Y137.82 E-.07271
G1 X143.432 Y137.82 E-.2015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.213 J.097 P1  F30000
G1 X143.729 Y141.547 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15476.087
G1 X143.901 Y141.601 E.00596
G1 X143.901 Y142.616 E.03367
G1 X142.901 Y142.616 E.03314
G1 X142.856 Y142.43 E.00635
G1 X142.983 Y142.363 E.00478
G1 X143.454 Y141.946 E.02084
G1 X143.695 Y141.597 E.01409
; WIPE_START
G1 F24000
G1 X143.901 Y141.601 E-.07817
G1 X143.901 Y142.616 E-.38568
G1 X143.121 Y142.616 E-.29616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.105 J-1.212 P1  F30000
G1 X109.652 Y139.705 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X109.714 Y140.218 E.01587
G1 X109.65 Y140.747 E.01638
G1 X109.578 Y140.936 E.00622
G1 X109.461 Y141.246 E.01017
G1 X109.158 Y141.684 E.01638
G1 X108.759 Y142.038 E.01638
G1 X108.287 Y142.286 E.01638
G1 X107.769 Y142.413 E.01638
G1 X107.236 Y142.413 E.01638
G1 X106.719 Y142.286 E.01638
G1 X106.246 Y142.038 E.01638
G1 X105.847 Y141.684 E.01638
G1 X105.545 Y141.246 E.01638
G1 X105.355 Y140.747 E.01638
G1 X105.291 Y140.218 E.01638
G1 X105.355 Y139.689 E.01638
G1 X105.545 Y139.19 E.01638
G1 X105.847 Y138.751 E.01638
G1 X106.246 Y138.398 E.01638
G1 X106.719 Y138.15 E.01638
G1 X107.236 Y138.022 E.01638
G1 X107.769 Y138.022 E.01638
G1 X108.287 Y138.15 E.01638
G1 X108.759 Y138.398 E.01638
G1 X109.158 Y138.751 E.01638
G1 X109.461 Y139.19 E.01638
G1 X109.635 Y139.648 E.01505
M204 S10000
; WIPE_START
G1 F24000
G1 X109.714 Y140.218 E-.2186
G1 X109.65 Y140.747 E-.2026
G1 X109.578 Y140.936 E-.07687
G1 X109.461 Y141.246 E-.12573
G1 X109.257 Y141.541 E-.13621
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.914 J-.804 P1  F30000
G1 X106.15 Y138.006 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X106.022 Y138.073 E.00478
G1 X105.552 Y138.489 E.02084
G1 X105.276 Y138.888 E.01608
G1 X105.105 Y138.835 E.00596
G1 X105.105 Y137.82 E.03367
G1 X106.104 Y137.82 E.03314
G1 X106.135 Y137.947 E.00436
; WIPE_START
G1 F24000
G1 X106.022 Y138.073 E-.06419
G1 X105.552 Y138.489 E-.23878
G1 X105.276 Y138.888 E-.18419
G1 X105.105 Y138.835 E-.06829
G1 X105.105 Y138.297 E-.20454
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.18 J.298 P1  F30000
G1 X106.15 Y142.43 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15476.087
G1 X106.104 Y142.616 E.00635
G1 X105.105 Y142.616 E.03314
G1 X105.105 Y141.601 E.03367
G1 X105.276 Y141.547 E.00596
G1 X105.552 Y141.946 E.01608
G1 X106.022 Y142.363 E.02084
G1 X106.097 Y142.402 E.00279
; WIPE_START
G1 F24000
G1 X106.104 Y142.616 E-.08125
G1 X105.105 Y142.616 E-.37968
G1 X105.105 Y141.829 E-.29907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.037 J1.216 P1  F30000
G1 X144.293 Y143.008 Z1.6
G1 Z1.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X104.713 Y143.008 E1.21618
G1 X104.713 Y137.428 E.17146
G1 X144.293 Y137.428 E1.21618
G1 X144.293 Y142.948 E.16961
M204 S10000
G1 X143.533 Y142.412 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151056
G1 F15000
G1 X143.684 Y142.015 E.00375
G1 X143.865 Y141.384 F30000
; LINE_WIDTH: 0.434489
G1 F15000
G1 X143.899 Y141.203 E.00588
; LINE_WIDTH: 0.391801
G1 X143.932 Y141.022 E.00524
; LINE_WIDTH: 0.349112
G1 X143.965 Y140.841 E.00459
; LINE_WIDTH: 0.306424
G1 X143.969 Y140.81 E.00068
; LINE_WIDTH: 0.298796
G1 X143.986 Y140.519 E.00607
; LINE_WIDTH: 0.261158
G2 X144.004 Y140.207 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X143.986 Y139.916 E.0044
; LINE_WIDTH: 0.267101
G2 X143.965 Y139.595 I-2.649 J.015 E.00589
; LINE_WIDTH: 0.306424
G1 X143.932 Y139.413 E.00395
; LINE_WIDTH: 0.349112
G1 X143.899 Y139.232 E.00459
; LINE_WIDTH: 0.3918
G1 X143.865 Y139.051 E.00524
G1 X143.684 Y138.421 F30000
; LINE_WIDTH: 0.141574
G1 F15000
G1 X143.533 Y138.023 E.00342
G1 X142.692 Y137.851 F30000
; LINE_WIDTH: 0.405155
G1 F15000
G1 X142.398 Y137.797 E.00881
; LINE_WIDTH: 0.389444
G1 X142.205 Y137.774 E.00551
; LINE_WIDTH: 0.342433
G1 X142.011 Y137.75 E.00476
; LINE_WIDTH: 0.257331
G2 X141.793 Y137.725 I-.316 J1.798 E.00384
G2 X141.188 Y137.727 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X140.994 Y137.75 E.00327
; LINE_WIDTH: 0.295421
G1 X140.801 Y137.774 E.00401
; LINE_WIDTH: 0.342433
G1 X140.607 Y137.797 E.00476
; LINE_WIDTH: 0.389446
G1 X140.314 Y137.851 E.00842
G1 X139.691 Y138.023 F30000
; LINE_WIDTH: 0.13445
G1 F15000
G1 X139.529 Y138.206 E.00182
; WIPE_START
G1 F24000
G1 X139.691 Y138.023 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.017 J.669 P1  F30000
G1 X142.692 Y142.585 Z1.6
G1 Z1.2
G1 E.8 F1800
; LINE_WIDTH: 0.405154
G1 F15000
G1 X142.398 Y142.639 E.00881
; LINE_WIDTH: 0.389442
G1 X142.205 Y142.662 E.00551
; LINE_WIDTH: 0.342432
G1 X142.011 Y142.686 E.00476
; LINE_WIDTH: 0.257331
G3 X141.793 Y142.711 I-.316 J-1.798 E.00384
G3 X141.188 Y142.709 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X140.994 Y142.686 E.00327
; LINE_WIDTH: 0.295422
G1 X140.801 Y142.662 E.00401
; LINE_WIDTH: 0.342433
G1 X140.607 Y142.639 E.00476
; LINE_WIDTH: 0.389444
G1 X140.314 Y142.585 E.00842
M73 P72 R3
G1 X139.691 Y142.412 F30000
; LINE_WIDTH: 0.13445
G1 F15000
G1 X139.529 Y142.23 E.00182
G1 X136.177 Y142.267 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.805 Y142.267 E.05401
G1 X138.773 Y141.299 E.04542
G3 X138.773 Y139.136 I2.288 J-1.082 E.07414
G1 X137.805 Y138.168 E.04542
G1 X134.228 Y138.168 E.11864
G1 X130.129 Y142.267 E.19231
G1 X126.552 Y142.267 E.11864
G1 X122.453 Y138.168 E.19231
G1 X118.876 Y138.168 E.11864
G1 X114.777 Y142.267 E.19231
G1 X111.2 Y142.267 E.11864
G1 X110.232 Y141.299 E.04542
G2 X110.232 Y139.136 I-2.288 J-1.082 E.07414
G1 X111.2 Y138.168 E.04542
G1 X114.777 Y138.168 E.11864
G1 X118.876 Y142.267 E.19231
G1 X122.453 Y142.267 E.11864
G1 X126.552 Y138.168 E.19231
G1 X130.129 Y138.168 E.11864
G1 X134.228 Y142.267 E.19231
G1 X132.6 Y142.267 E.05401
G1 X109.477 Y142.23 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969211
G1 F15000
G1 X109.315 Y142.412 E.00107
G1 X108.692 Y142.585 F30000
; LINE_WIDTH: 0.405154
G1 F15000
G1 X108.398 Y142.639 E.00881
; LINE_WIDTH: 0.389442
G1 X108.205 Y142.662 E.00551
; LINE_WIDTH: 0.342432
G1 X108.011 Y142.686 E.00476
; LINE_WIDTH: 0.257331
G3 X107.793 Y142.711 I-.317 J-1.798 E.00384
G3 X107.188 Y142.709 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X106.994 Y142.686 E.00327
; LINE_WIDTH: 0.295422
G1 X106.801 Y142.662 E.00401
; LINE_WIDTH: 0.342433
G1 X106.607 Y142.639 E.00476
; LINE_WIDTH: 0.389442
G1 X106.314 Y142.585 E.00842
G1 X105.473 Y142.412 F30000
; LINE_WIDTH: 0.151054
G1 F15000
G1 X105.321 Y142.015 E.00375
G1 X105.14 Y141.384 F30000
; LINE_WIDTH: 0.3918
G1 F15000
G1 X105.107 Y141.203 E.00524
; LINE_WIDTH: 0.349112
G1 X105.074 Y141.022 E.00459
; LINE_WIDTH: 0.306424
G1 X105.041 Y140.841 E.00395
; LINE_WIDTH: 0.267101
G3 X105.019 Y140.519 I2.628 J-.336 E.00589
; LINE_WIDTH: 0.228538
G1 X105.002 Y140.229 E.0044
; LINE_WIDTH: 0.261158
G3 X105.019 Y139.916 I2.594 J-.011 E.00557
; LINE_WIDTH: 0.298796
G1 X105.037 Y139.626 E.00607
; LINE_WIDTH: 0.306424
G1 X105.041 Y139.595 E.00068
; LINE_WIDTH: 0.349113
G1 X105.074 Y139.413 E.00459
; LINE_WIDTH: 0.391801
G1 X105.107 Y139.232 E.00524
; LINE_WIDTH: 0.434489
G1 X105.14 Y139.051 E.00588
G1 X105.321 Y138.421 F30000
; LINE_WIDTH: 0.151056
G1 F15000
G1 X105.473 Y138.023 E.00375
G1 X106.314 Y137.851 F30000
; LINE_WIDTH: 0.389444
G1 F15000
G1 X106.607 Y137.797 E.00842
; LINE_WIDTH: 0.342433
G1 X106.801 Y137.774 E.00476
; LINE_WIDTH: 0.295421
G1 X106.994 Y137.75 E.00401
; LINE_WIDTH: 0.24841
G1 X107.188 Y137.727 E.00327
; LINE_WIDTH: 0.257331
G3 X107.793 Y137.725 I.315 J4.984 E.01058
G3 X108.011 Y137.75 I-.098 J1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X108.205 Y137.774 E.00476
; LINE_WIDTH: 0.389444
G1 X108.398 Y137.797 E.00551
; LINE_WIDTH: 0.405155
G1 X108.692 Y137.851 E.00881
G1 X109.315 Y138.023 F30000
; LINE_WIDTH: 0.0969209
G1 F15000
G1 X109.477 Y138.206 E.00107
M106 S234.6
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.315 Y138.023 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/15
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
G3 Z1.6 I.945 J.767 P1  F30000
G1 X142.056 Y97.699 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X142.03 Y97.914 E.00718
G1 X108.673 Y97.914 E1.1065
G1 X108.647 Y97.699 E.00718
G1 X109.134 Y97.579 E.01663
G1 X109.605 Y97.332 E.01765
G1 X110.003 Y96.979 E.01764
G1 X110.305 Y96.541 E.01765
G1 X110.494 Y96.044 E.01765
G1 X110.558 Y95.516 E.01765
G1 X110.494 Y94.988 E.01765
G1 X110.305 Y94.49 E.01765
G1 X110.003 Y94.053 E.01765
G1 X109.605 Y93.7 E.01764
G1 X109.134 Y93.453 E.01764
G1 X108.647 Y93.333 E.01663
G1 X108.673 Y93.118 E.00718
G1 X142.03 Y93.118 E1.1065
G1 X142.056 Y93.333 E.00718
G1 X141.569 Y93.453 E.01663
G1 X141.098 Y93.7 E.01764
G1 X140.7 Y94.053 E.01765
G1 X140.398 Y94.49 E.01764
G1 X140.209 Y94.988 E.01765
G1 X140.145 Y95.516 E.01765
G1 X140.209 Y96.044 E.01765
G1 X140.398 Y96.541 E.01765
G1 X140.7 Y96.979 E.01764
G1 X141.098 Y97.332 E.01765
G1 X141.569 Y97.579 E.01764
G1 X141.998 Y97.685 E.01464
; WIPE_START
G1 F24000
G1 X142.03 Y97.914 E-.08794
G1 X140.261 Y97.914 E-.67206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.472 J1.122 P1  F30000
G1 X143.952 Y96.362 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.708 Y96.717 E.01324
G1 X143.381 Y97.007 E.01342
G1 X142.994 Y97.21 E.01342
G1 X142.57 Y97.314 E.01342
G1 X142.133 Y97.314 E.01342
G1 X141.709 Y97.21 E.01342
G1 X141.322 Y97.007 E.01342
G1 X140.996 Y96.717 E.01342
G1 X140.748 Y96.358 E.01342
G1 X140.593 Y95.949 E.01342
G1 X140.54 Y95.516 E.01342
G1 X140.593 Y95.082 E.01342
G1 X140.748 Y94.674 E.01342
G1 X140.996 Y94.315 E.01342
G1 X141.322 Y94.025 E.01342
G1 X141.709 Y93.822 E.01342
G1 X142.133 Y93.717 E.01342
G1 X142.57 Y93.717 E.01342
G1 X142.994 Y93.822 E.01342
G1 X143.381 Y94.025 E.01342
G1 X143.708 Y94.315 E.01342
G1 X143.956 Y94.674 E.01342
G1 X144.11 Y95.082 E.01342
G1 X144.163 Y95.516 E.01342
G1 X144.11 Y95.949 E.01342
G1 X143.975 Y96.307 E.01176
M204 S10000
; WIPE_START
G1 F24000
G1 X143.708 Y96.717 E-.186
G1 X143.381 Y97.007 E-.16595
G1 X142.994 Y97.21 E-.16595
G1 X142.57 Y97.314 E-.16595
G1 X142.37 Y97.314 E-.07615
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.811 J.908 P1  F30000
G1 X144.749 Y95.188 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X144.52 Y95.202 E.00763
G1 X144.494 Y94.988 E.00717
G1 X144.305 Y94.49 E.01765
G1 X144.003 Y94.053 E.01764
G1 X143.605 Y93.7 E.01765
G1 X143.134 Y93.453 E.01764
G1 X142.647 Y93.333 E.01663
G1 X142.673 Y93.118 E.00718
G1 X144.749 Y93.118 E.06887
G1 X144.749 Y95.128 E.06669
; WIPE_START
G1 F24000
G1 X144.52 Y95.202 E-.09162
G1 X144.494 Y94.988 E-.08209
G1 X144.305 Y94.49 E-.20213
G1 X144.003 Y94.053 E-.20213
G1 X143.645 Y93.735 E-.18202
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.177 J.311 P1  F30000
G1 X144.749 Y97.914 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F15476.087
G1 X142.673 Y97.914 E.06887
G1 X142.647 Y97.699 E.00718
G1 X143.134 Y97.579 E.01663
G1 X143.605 Y97.332 E.01764
G1 X144.003 Y96.979 E.01765
G1 X144.305 Y96.541 E.01764
G1 X144.494 Y96.044 E.01765
G1 X144.52 Y95.829 E.00717
G1 X144.749 Y95.843 E.00763
G1 X144.749 Y97.854 E.06669
; WIPE_START
G1 F24000
G1 X142.75 Y97.911 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.09 J-1.214 P1  F30000
G1 X106.183 Y95.202 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F15476.087
G1 X105.954 Y95.188 E.00763
G1 X105.954 Y93.118 E.06868
G1 X108.03 Y93.118 E.06887
G1 X108.056 Y93.333 E.00718
G1 X107.569 Y93.453 E.01663
G1 X107.098 Y93.7 E.01764
G1 X106.7 Y94.053 E.01765
G1 X106.398 Y94.49 E.01764
G1 X106.209 Y94.988 E.01764
G1 X106.19 Y95.143 E.00518
; WIPE_START
G1 F24000
G1 X105.954 Y95.188 E-.09162
G1 X105.954 Y93.429 E-.66838
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.137 J.434 P1  F30000
G1 X107.318 Y97.003 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.996 Y96.717 E.01323
G1 X106.748 Y96.358 E.01342
G1 X106.593 Y95.949 E.01342
G1 X106.54 Y95.516 E.01342
G1 X106.593 Y95.082 E.01342
G1 X106.748 Y94.674 E.01342
G1 X106.996 Y94.315 E.01342
G1 X107.322 Y94.025 E.01342
G1 X107.709 Y93.822 E.01342
G1 X108.133 Y93.717 E.01342
G1 X108.57 Y93.717 E.01342
G1 X108.994 Y93.822 E.01342
G1 X109.381 Y94.025 E.01342
G1 X109.708 Y94.315 E.01342
G1 X109.956 Y94.674 E.01342
G1 X110.11 Y95.082 E.01342
G1 X110.163 Y95.516 E.01342
G1 X110.11 Y95.949 E.01342
G1 X109.956 Y96.358 E.01342
G1 X109.708 Y96.717 E.01342
G1 X109.381 Y97.007 E.01342
G1 X108.994 Y97.21 E.01342
G1 X108.57 Y97.314 E.01342
G1 X108.133 Y97.314 E.01342
G1 X107.709 Y97.21 E.01342
G1 X107.37 Y97.032 E.01176
M204 S10000
G1 X107.069 Y97.306 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.098 Y97.332 E.00131
G1 X107.569 Y97.579 E.01764
G1 X108.056 Y97.699 E.01663
G1 X108.03 Y97.914 E.00718
G1 X105.954 Y97.914 E.06887
G1 X105.954 Y95.843 E.06868
G1 X106.183 Y95.829 E.00763
G1 X106.209 Y96.044 E.00717
G1 X106.398 Y96.541 E.01764
G1 X106.7 Y96.979 E.01764
G1 X107.024 Y97.266 E.01435
; WIPE_START
G1 F24000
G1 X107.098 Y97.332 E-.03777
G1 X107.569 Y97.579 E-.20213
G1 X108.056 Y97.699 E-.19055
G1 X108.03 Y97.914 E-.08223
G1 X107.379 Y97.914 E-.24733
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.013 J1.217 P1  F30000
G1 X145.142 Y98.306 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X105.562 Y98.306 E1.21618
G1 X105.562 Y92.726 E.17146
G1 X145.142 Y92.726 E1.21618
G1 X145.142 Y98.246 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X143.142 Y98.249 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.652 J1.027 P1  F30000
G1 X144.546 Y97.357 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.282812
G1 F15000
G1 X143.418 Y97.71 E.02311
G1 X144.152 Y97.71 F30000
; LINE_WIDTH: 0.511103
G1 F13456.297
G1 X144.546 Y96.675 E.04224
G1 X144.354 Y95.623 F30000
; LINE_WIDTH: 0.271406
G1 F15000
G1 X144.475 Y95.516 E.00301
; LINE_WIDTH: 0.311995
G1 X144.946 Y95.516 E.01032
G1 X144.546 Y94.356 F30000
; LINE_WIDTH: 0.470051
G1 F14749.571
G1 X144.152 Y93.321 E.03854
G1 X144.546 Y93.674 F30000
; LINE_WIDTH: 0.282811
G1 F15000
G1 X143.418 Y93.321 E.02311
G1 X142.352 Y93.222 F30000
; LINE_WIDTH: 0.25884
G1 F15000
G1 X142.352 Y93.521 E.00527
G1 X142.352 Y93.222 F30000
; LINE_WIDTH: 0.305086
G1 F15000
G1 X142.352 Y92.922 E.0064
G1 X141.298 Y93.342 F30000
; LINE_WIDTH: 0.108847
G1 F15000
G2 X141.144 Y93.419 I.025 J.242 E.00095
G1 X140.797 Y93.474 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X140.734 Y93.511 E.00204
G1 X140.782 Y93.539 E.00155
G1 X140.18 Y96.44 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.406373
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X140.022 Y97.746 E.06957
M106 S234.6
G1 X139.562 Y97.746 F30000
M106 S255
G1 F3000
G1 X140.079 Y93.488 E.22671
G1 X139.619 Y93.488 E.02429
G1 X139.127 Y97.544 E.21593
G1 X138.667 Y97.544 E.02429
G1 X139.16 Y93.488 E.21593
G1 X138.7 Y93.488 E.02429
G1 X138.207 Y97.544 E.21593
G1 X137.748 Y97.544 E.02429
G1 X138.24 Y93.488 E.21593
G1 X137.781 Y93.488 E.02429
G1 X137.288 Y97.544 E.21593
G1 X136.828 Y97.544 E.02429
G1 X137.321 Y93.488 E.21593
G1 X136.861 Y93.488 E.02429
G1 X136.369 Y97.544 E.21593
G1 X135.909 Y97.544 E.02429
G1 X136.401 Y93.488 E.21593
G1 X135.942 Y93.488 E.02429
G1 X135.449 Y97.544 E.21593
G1 X134.989 Y97.544 E.02429
G1 X135.482 Y93.488 E.21593
G1 X135.022 Y93.488 E.02429
G1 X134.53 Y97.544 E.21593
G1 X134.07 Y97.544 E.02429
G1 X134.562 Y93.488 E.21593
G1 X134.103 Y93.488 E.02429
G1 X133.61 Y97.544 E.21593
G1 X133.15 Y97.544 E.02429
G1 X133.643 Y93.488 E.21593
G1 X133.183 Y93.488 E.02429
G1 X132.691 Y97.544 E.21593
G1 X132.231 Y97.544 E.02429
G1 X132.724 Y93.488 E.21593
G1 X132.264 Y93.488 E.02429
G1 X131.771 Y97.544 E.21593
G1 X131.312 Y97.544 E.02429
G1 X131.804 Y93.488 E.21593
G1 X131.344 Y93.488 E.02429
G1 X130.852 Y97.544 E.21593
G1 X130.392 Y97.544 E.02429
G1 X130.885 Y93.488 E.21593
G1 X130.425 Y93.488 E.02429
G1 X129.932 Y97.544 E.21593
G1 X129.473 Y97.544 E.02429
G1 X129.965 Y93.488 E.21593
G1 X129.505 Y93.488 E.02429
G1 X129.013 Y97.544 E.21593
G1 X128.553 Y97.544 E.02429
G1 X129.046 Y93.488 E.21593
G1 X128.586 Y93.488 E.02429
G1 X128.094 Y97.544 E.21593
G1 X127.634 Y97.544 E.02429
G1 X128.126 Y93.488 E.21593
G1 X127.667 Y93.488 E.02429
G1 X127.174 Y97.544 E.21593
G1 X126.714 Y97.544 E.02429
G1 X127.207 Y93.488 E.21593
G1 X126.747 Y93.488 E.02429
G1 X126.255 Y97.544 E.21593
G1 X125.795 Y97.544 E.02429
G1 X126.287 Y93.488 E.21593
G1 X125.828 Y93.488 E.02429
G1 X125.335 Y97.544 E.21593
G1 X124.875 Y97.544 E.02429
G1 X125.368 Y93.488 E.21593
G1 X124.908 Y93.488 E.02429
G1 X124.416 Y97.544 E.21593
G1 X123.956 Y97.544 E.02429
G1 X124.448 Y93.488 E.21593
G1 X123.989 Y93.488 E.02429
G1 X123.496 Y97.544 E.21593
G1 X123.037 Y97.544 E.02429
G1 X123.529 Y93.488 E.21593
G1 X123.069 Y93.488 E.02429
G1 X122.577 Y97.544 E.21593
G1 X122.117 Y97.544 E.02429
G1 X122.61 Y93.488 E.21593
G1 X122.15 Y93.488 E.02429
G1 X121.657 Y97.544 E.21593
G1 X121.198 Y97.544 E.02429
G1 X121.69 Y93.488 E.21593
G1 X121.23 Y93.488 E.02429
G1 X120.738 Y97.544 E.21593
G1 X120.278 Y97.544 E.02429
G1 X120.771 Y93.488 E.21593
G1 X120.311 Y93.488 E.02429
G1 X119.818 Y97.544 E.21593
M73 P73 R3
G1 X119.359 Y97.544 E.02429
G1 X119.851 Y93.488 E.21593
G1 X119.392 Y93.488 E.02429
G1 X118.899 Y97.544 E.21593
G1 X118.439 Y97.544 E.02429
G1 X118.932 Y93.488 E.21593
G1 X118.472 Y93.488 E.02429
G1 X117.98 Y97.544 E.21593
G1 X117.52 Y97.544 E.02429
G1 X118.012 Y93.488 E.21593
G1 X117.553 Y93.488 E.02429
G1 X117.06 Y97.544 E.21593
G1 X116.6 Y97.544 E.02429
G1 X117.093 Y93.488 E.21593
G1 X116.633 Y93.488 E.02429
G1 X116.141 Y97.544 E.21593
G1 X115.681 Y97.544 E.02429
G1 X116.173 Y93.488 E.21593
G1 X115.714 Y93.488 E.02429
G1 X115.221 Y97.544 E.21593
G1 X114.761 Y97.544 E.02429
G1 X115.254 Y93.488 E.21593
G1 X114.794 Y93.488 E.02429
G1 X114.302 Y97.544 E.21593
G1 X113.842 Y97.544 E.02429
G1 X114.335 Y93.488 E.21593
G1 X113.875 Y93.488 E.02429
G1 X113.382 Y97.544 E.21593
G1 X112.923 Y97.544 E.02429
G1 X113.415 Y93.488 E.21593
G1 X112.955 Y93.488 E.02429
G1 X112.463 Y97.544 E.21593
G1 X112.003 Y97.544 E.02429
G1 X112.496 Y93.488 E.21593
G1 X112.036 Y93.488 E.02429
G1 X111.543 Y97.544 E.21593
G1 X111.084 Y97.544 E.02429
G1 X111.576 Y93.488 E.21593
G1 X111.116 Y93.488 E.02429
G1 X110.599 Y97.746 E.22671
M106 S234.6
G1 X109.946 Y97.483 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X109.882 Y97.52 E.00204
G1 X109.931 Y97.548 E.00155
G1 X109.559 Y97.612 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104412
G1 F15000
G3 X109.405 Y97.69 I-.179 J-.165 E.00088
G1 X108.352 Y97.81 F30000
; LINE_WIDTH: 0.25884
G1 F15000
G1 X108.352 Y97.51 E.00527
G1 X108.352 Y97.81 F30000
; LINE_WIDTH: 0.305086
G1 F15000
G1 X108.352 Y98.11 E.0064
G1 X107.285 Y97.71 F30000
; LINE_WIDTH: 0.265392
G1 F15000
G1 X106.157 Y97.357 E.02143
G1 X106.551 Y97.71 F30000
; LINE_WIDTH: 0.511104
G1 F13456.249
G1 X106.157 Y96.675 E.04224
G1 X106.157 Y94.356 F30000
; LINE_WIDTH: 0.511106
G1 F13456.211
G1 X106.551 Y93.321 E.04224
G1 X106.157 Y93.674 F30000
; LINE_WIDTH: 0.265391
G1 F15000
G1 X107.285 Y93.321 E.02143
G1 X108.352 Y93.222 F30000
; LINE_WIDTH: 0.305086
G1 F15000
G1 X108.352 Y92.922 E.0064
G1 X108.352 Y93.222 F30000
; LINE_WIDTH: 0.25884
G1 F15000
G1 X108.352 Y93.521 E.00527
G1 X109.405 Y93.342 F30000
; LINE_WIDTH: 0.104412
G1 F15000
G3 X109.559 Y93.419 I-.025 J.242 E.00088
G1 X109.948 Y93.479 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X109.884 Y93.516 E.00204
G1 X109.932 Y93.544 E.00155
G1 X110.681 Y93.285 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.406373
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X110.523 Y94.592 E.06956
M106 S234.6
G1 X140.797 Y97.484 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X140.734 Y97.52 E.00204
G1 X140.782 Y97.549 E.00155
G1 X141.144 Y97.612 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.108846
G1 F15000
G2 X141.298 Y97.69 I.179 J-.165 E.00095
G1 X142.352 Y97.81 F30000
; LINE_WIDTH: 0.25884
G1 F15000
G1 X142.352 Y97.51 E.00527
G1 X142.352 Y97.81 F30000
; LINE_WIDTH: 0.305086
G1 F15000
G1 X142.352 Y98.11 E.0064
; WIPE_START
G1 F24000
G1 X142.352 Y97.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.216 J.04 P1  F30000
G1 X142.722 Y109.211 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X142.696 Y109.426 E.00718
G1 X109.339 Y109.426 E1.1065
G1 X109.313 Y109.211 E.00718
G1 X109.8 Y109.091 E.01663
G1 X110.271 Y108.844 E.01765
G1 X110.669 Y108.491 E.01764
G1 X110.971 Y108.053 E.01765
G1 X111.16 Y107.556 E.01765
G1 X111.224 Y107.028 E.01765
G1 X111.16 Y106.5 E.01765
G1 X110.971 Y106.002 E.01765
G1 X110.669 Y105.565 E.01765
G1 X110.271 Y105.212 E.01764
G1 X109.8 Y104.965 E.01764
G1 X109.313 Y104.845 E.01663
G1 X109.339 Y104.63 E.00718
G1 X142.696 Y104.63 E1.1065
G1 X142.722 Y104.845 E.00718
G1 X142.235 Y104.965 E.01663
G1 X141.764 Y105.212 E.01764
G1 X141.366 Y105.565 E.01765
G1 X141.064 Y106.002 E.01764
G1 X140.875 Y106.5 E.01765
G1 X140.811 Y107.028 E.01765
G1 X140.875 Y107.556 E.01765
G1 X141.064 Y108.053 E.01765
G1 X141.366 Y108.491 E.01764
G1 X141.764 Y108.844 E.01765
G1 X142.235 Y109.091 E.01764
G1 X142.664 Y109.197 E.01464
; WIPE_START
G1 F24000
G1 X142.696 Y109.426 E-.08794
G1 X140.927 Y109.426 E-.67206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.472 J1.122 P1  F30000
G1 X144.618 Y107.875 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.374 Y108.229 E.01324
G1 X144.047 Y108.519 E.01342
G1 X143.66 Y108.722 E.01342
G1 X143.236 Y108.826 E.01342
G1 X142.799 Y108.826 E.01342
G1 X142.375 Y108.722 E.01342
G1 X141.989 Y108.519 E.01342
G1 X141.662 Y108.229 E.01342
G1 X141.414 Y107.87 E.01342
G1 X141.259 Y107.461 E.01342
G1 X141.206 Y107.028 E.01342
G1 X141.259 Y106.594 E.01342
G1 X141.414 Y106.186 E.01342
G1 X141.662 Y105.827 E.01342
G1 X141.989 Y105.537 E.01342
G1 X142.375 Y105.334 E.01342
G1 X142.799 Y105.23 E.01342
G1 X143.236 Y105.23 E.01342
G1 X143.66 Y105.334 E.01342
G1 X144.047 Y105.537 E.01342
G1 X144.374 Y105.827 E.01342
G1 X144.622 Y106.186 E.01342
G1 X144.777 Y106.594 E.01342
G1 X144.829 Y107.028 E.01342
G1 X144.777 Y107.461 E.01342
G1 X144.641 Y107.819 E.01176
M204 S10000
; WIPE_START
G1 F24000
G1 X144.374 Y108.229 E-.186
G1 X144.047 Y108.519 E-.16595
G1 X143.66 Y108.722 E-.16595
G1 X143.236 Y108.826 E-.16595
G1 X143.036 Y108.826 E-.07615
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.811 J.908 P1  F30000
G1 X145.416 Y106.7 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.186 Y106.714 E.00763
G1 X145.16 Y106.5 E.00717
G1 X144.971 Y106.002 E.01765
G1 X144.669 Y105.565 E.01764
G1 X144.271 Y105.212 E.01765
G1 X143.8 Y104.965 E.01764
G1 X143.313 Y104.845 E.01663
G1 X143.339 Y104.63 E.00718
G1 X145.416 Y104.63 E.06887
G1 X145.416 Y106.64 E.06669
; WIPE_START
G1 F24000
G1 X145.186 Y106.714 E-.09162
G1 X145.16 Y106.5 E-.08209
G1 X144.971 Y106.002 E-.20213
G1 X144.669 Y105.565 E-.20213
G1 X144.311 Y105.247 E-.18202
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.177 J.311 P1  F30000
G1 X145.416 Y109.426 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F15476.087
G1 X143.339 Y109.426 E.06887
G1 X143.313 Y109.211 E.00718
G1 X143.8 Y109.091 E.01663
G1 X144.271 Y108.844 E.01764
G1 X144.669 Y108.491 E.01765
G1 X144.971 Y108.053 E.01764
G1 X145.16 Y107.556 E.01765
G1 X145.186 Y107.341 E.00717
G1 X145.416 Y107.355 E.00763
G1 X145.416 Y109.366 E.06669
; WIPE_START
G1 F24000
G1 X143.416 Y109.424 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.09 J-1.214 P1  F30000
G1 X106.849 Y106.714 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F15476.087
G1 X106.62 Y106.7 E.00763
G1 X106.62 Y104.63 E.06868
G1 X108.696 Y104.63 E.06887
G1 X108.722 Y104.845 E.00718
G1 X108.235 Y104.965 E.01663
G1 X107.764 Y105.212 E.01764
G1 X107.366 Y105.565 E.01765
G1 X107.064 Y106.002 E.01764
G1 X106.875 Y106.5 E.01764
G1 X106.856 Y106.655 E.00518
; WIPE_START
G1 F24000
G1 X106.62 Y106.7 E-.09162
G1 X106.62 Y104.941 E-.66838
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.137 J.434 P1  F30000
G1 X107.984 Y108.515 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.662 Y108.229 E.01323
G1 X107.414 Y107.87 E.01342
G1 X107.259 Y107.461 E.01342
G1 X107.206 Y107.028 E.01342
G1 X107.259 Y106.594 E.01342
G1 X107.414 Y106.186 E.01342
G1 X107.662 Y105.827 E.01342
G1 X107.989 Y105.537 E.01342
G1 X108.375 Y105.334 E.01342
G1 X108.799 Y105.23 E.01342
G1 X109.236 Y105.23 E.01342
G1 X109.66 Y105.334 E.01342
G1 X110.047 Y105.537 E.01342
G1 X110.374 Y105.827 E.01342
G1 X110.622 Y106.186 E.01342
G1 X110.777 Y106.594 E.01342
G1 X110.829 Y107.028 E.01342
G1 X110.777 Y107.461 E.01342
G1 X110.622 Y107.87 E.01342
G1 X110.374 Y108.229 E.01342
G1 X110.047 Y108.519 E.01342
G1 X109.66 Y108.722 E.01342
G1 X109.236 Y108.826 E.01342
G1 X108.799 Y108.826 E.01342
G1 X108.375 Y108.722 E.01342
G1 X108.036 Y108.544 E.01176
M204 S10000
G1 X107.735 Y108.818 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.764 Y108.844 E.00131
G1 X108.235 Y109.091 E.01764
G1 X108.722 Y109.211 E.01663
G1 X108.696 Y109.426 E.00718
G1 X106.62 Y109.426 E.06887
G1 X106.62 Y107.355 E.06868
G1 X106.849 Y107.341 E.00763
G1 X106.875 Y107.556 E.00717
G1 X107.064 Y108.053 E.01764
G1 X107.366 Y108.491 E.01764
G1 X107.69 Y108.778 E.01435
; WIPE_START
G1 F24000
G1 X107.764 Y108.844 E-.03777
G1 X108.235 Y109.091 E-.20213
G1 X108.722 Y109.211 E-.19055
G1 X108.696 Y109.426 E-.08223
G1 X108.045 Y109.426 E-.24733
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.013 J1.217 P1  F30000
G1 X145.808 Y109.818 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.228 Y109.818 E1.21618
G1 X106.228 Y104.238 E.17146
G1 X145.808 Y104.238 E1.21618
G1 X145.808 Y109.758 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X143.808 Y109.761 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.652 J1.027 P1  F30000
G1 X145.212 Y108.869 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.282812
G1 F15000
G1 X144.084 Y109.222 E.02311
G1 X144.818 Y109.222 F30000
; LINE_WIDTH: 0.511103
G1 F13456.297
G1 X145.212 Y108.188 E.04224
G1 X145.02 Y107.135 F30000
; LINE_WIDTH: 0.271406
G1 F15000
G1 X145.141 Y107.028 E.00301
; LINE_WIDTH: 0.311995
G1 X145.612 Y107.028 E.01032
G1 X145.212 Y105.868 F30000
; LINE_WIDTH: 0.470051
G1 F14749.571
G1 X144.818 Y104.833 E.03854
G1 X145.212 Y105.187 F30000
; LINE_WIDTH: 0.282811
G1 F15000
G1 X144.084 Y104.833 E.02311
G1 X143.018 Y104.734 F30000
; LINE_WIDTH: 0.25884
G1 F15000
G1 X143.018 Y105.033 E.00527
G1 X143.018 Y104.734 F30000
; LINE_WIDTH: 0.305086
G1 F15000
G1 X143.018 Y104.434 E.0064
G1 X141.964 Y104.854 F30000
; LINE_WIDTH: 0.108847
G1 F15000
G2 X141.81 Y104.931 I.025 J.242 E.00095
G1 X141.463 Y104.986 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
M73 P74 R3
G1 X141.4 Y105.023 E.00204
G1 X141.448 Y105.051 E.00155
G1 X140.847 Y107.952 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.406373
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X140.688 Y109.259 E.06957
M106 S234.6
G1 X140.228 Y109.259 F30000
M106 S255
G1 F3000
G1 X140.745 Y105 E.22671
G1 X140.285 Y105 E.02429
G1 X139.793 Y109.056 E.21593
G1 X139.333 Y109.056 E.02429
G1 X139.826 Y105 E.21593
G1 X139.366 Y105 E.02429
G1 X138.874 Y109.056 E.21593
G1 X138.414 Y109.056 E.02429
G1 X138.906 Y105 E.21593
G1 X138.447 Y105 E.02429
G1 X137.954 Y109.056 E.21593
G1 X137.494 Y109.056 E.02429
G1 X137.987 Y105 E.21593
G1 X137.527 Y105 E.02429
G1 X137.035 Y109.056 E.21593
G1 X136.575 Y109.056 E.02429
G1 X137.067 Y105 E.21593
G1 X136.608 Y105 E.02429
G1 X136.115 Y109.056 E.21593
G1 X135.655 Y109.056 E.02429
G1 X136.148 Y105 E.21593
G1 X135.688 Y105 E.02429
G1 X135.196 Y109.056 E.21593
G1 X134.736 Y109.056 E.02429
G1 X135.229 Y105 E.21593
G1 X134.769 Y105 E.02429
G1 X134.276 Y109.056 E.21593
G1 X133.817 Y109.056 E.02429
G1 X134.309 Y105 E.21593
G1 X133.849 Y105 E.02429
G1 X133.357 Y109.056 E.21593
G1 X132.897 Y109.056 E.02429
G1 X133.39 Y105 E.21593
G1 X132.93 Y105 E.02429
G1 X132.437 Y109.056 E.21593
G1 X131.978 Y109.056 E.02429
G1 X132.47 Y105 E.21593
G1 X132.01 Y105 E.02429
G1 X131.518 Y109.056 E.21593
G1 X131.058 Y109.056 E.02429
G1 X131.551 Y105 E.21593
G1 X131.091 Y105 E.02429
G1 X130.598 Y109.056 E.21593
G1 X130.139 Y109.056 E.02429
G1 X130.631 Y105 E.21593
G1 X130.172 Y105 E.02429
G1 X129.679 Y109.056 E.21593
G1 X129.219 Y109.056 E.02429
G1 X129.712 Y105 E.21593
G1 X129.252 Y105 E.02429
G1 X128.76 Y109.056 E.21593
G1 X128.3 Y109.056 E.02429
G1 X128.792 Y105 E.21593
G1 X128.333 Y105 E.02429
G1 X127.84 Y109.056 E.21593
G1 X127.38 Y109.056 E.02429
G1 X127.873 Y105 E.21593
G1 X127.413 Y105 E.02429
G1 X126.921 Y109.056 E.21593
G1 X126.461 Y109.056 E.02429
G1 X126.953 Y105 E.21593
G1 X126.494 Y105 E.02429
G1 X126.001 Y109.056 E.21593
G1 X125.542 Y109.056 E.02429
G1 X126.034 Y105 E.21593
G1 X125.574 Y105 E.02429
G1 X125.082 Y109.056 E.21593
G1 X124.622 Y109.056 E.02429
G1 X125.115 Y105 E.21593
G1 X124.655 Y105 E.02429
G1 X124.162 Y109.056 E.21593
G1 X123.703 Y109.056 E.02429
G1 X124.195 Y105 E.21593
G1 X123.735 Y105 E.02429
G1 X123.243 Y109.056 E.21593
G1 X122.783 Y109.056 E.02429
G1 X123.276 Y105 E.21593
G1 X122.816 Y105 E.02429
G1 X122.323 Y109.056 E.21593
G1 X121.864 Y109.056 E.02429
G1 X122.356 Y105 E.21593
G1 X121.897 Y105 E.02429
G1 X121.404 Y109.056 E.21593
G1 X120.944 Y109.056 E.02429
G1 X121.437 Y105 E.21593
G1 X120.977 Y105 E.02429
G1 X120.485 Y109.056 E.21593
G1 X120.025 Y109.056 E.02429
G1 X120.517 Y105 E.21593
G1 X120.058 Y105 E.02429
G1 X119.565 Y109.056 E.21593
G1 X119.105 Y109.056 E.02429
G1 X119.598 Y105 E.21593
G1 X119.138 Y105 E.02429
G1 X118.646 Y109.056 E.21593
G1 X118.186 Y109.056 E.02429
G1 X118.678 Y105 E.21593
G1 X118.219 Y105 E.02429
G1 X117.726 Y109.056 E.21593
G1 X117.266 Y109.056 E.02429
G1 X117.759 Y105 E.21593
G1 X117.299 Y105 E.02429
G1 X116.807 Y109.056 E.21593
G1 X116.347 Y109.056 E.02429
G1 X116.84 Y105 E.21593
G1 X116.38 Y105 E.02429
G1 X115.887 Y109.056 E.21593
G1 X115.428 Y109.056 E.02429
G1 X115.92 Y105 E.21593
G1 X115.46 Y105 E.02429
G1 X114.968 Y109.056 E.21593
G1 X114.508 Y109.056 E.02429
G1 X115.001 Y105 E.21593
G1 X114.541 Y105 E.02429
G1 X114.048 Y109.056 E.21593
G1 X113.589 Y109.056 E.02429
G1 X114.081 Y105 E.21593
G1 X113.621 Y105 E.02429
G1 X113.129 Y109.056 E.21593
G1 X112.669 Y109.056 E.02429
G1 X113.162 Y105 E.21593
G1 X112.702 Y105 E.02429
G1 X112.21 Y109.056 E.21593
G1 X111.75 Y109.056 E.02429
G1 X112.242 Y105 E.21593
G1 X111.783 Y105 E.02429
G1 X111.265 Y109.259 E.22671
M106 S234.6
G1 X110.612 Y108.995 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X110.548 Y109.032 E.00204
G1 X110.597 Y109.06 E.00155
G1 X110.225 Y109.124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104412
G1 F15000
G3 X110.071 Y109.202 I-.179 J-.165 E.00088
G1 X109.018 Y109.322 F30000
; LINE_WIDTH: 0.305086
G1 F15000
G1 X109.018 Y109.622 E.0064
G1 X109.018 Y109.322 F30000
; LINE_WIDTH: 0.25884
G1 F15000
G1 X109.018 Y109.022 E.00527
G1 X107.952 Y109.222 F30000
; LINE_WIDTH: 0.265392
G1 F15000
G1 X106.823 Y108.869 E.02143
G1 X107.217 Y109.222 F30000
; LINE_WIDTH: 0.511104
G1 F13456.249
G1 X106.823 Y108.188 E.04224
G1 X106.823 Y105.868 F30000
; LINE_WIDTH: 0.511106
G1 F13456.211
G1 X107.217 Y104.833 E.04224
G1 X106.823 Y105.186 F30000
; LINE_WIDTH: 0.265391
G1 F15000
G1 X107.952 Y104.833 E.02143
G1 X109.018 Y104.734 F30000
; LINE_WIDTH: 0.25884
G1 F15000
G1 X109.018 Y105.033 E.00527
G1 X109.018 Y104.734 F30000
; LINE_WIDTH: 0.305086
G1 F15000
G1 X109.018 Y104.434 E.0064
G1 X110.071 Y104.854 F30000
; LINE_WIDTH: 0.104412
G1 F15000
G3 X110.225 Y104.931 I-.025 J.242 E.00088
G1 X110.614 Y104.991 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F15000
G1 X110.55 Y105.028 E.00204
G1 X110.599 Y105.056 E.00155
G1 X111.347 Y104.797 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.406373
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X111.189 Y106.104 E.06956
M106 S234.6
G1 X141.463 Y108.996 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X141.4 Y109.033 E.00204
G1 X141.448 Y109.061 E.00155
G1 X141.81 Y109.124 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.108846
G1 F15000
G2 X141.964 Y109.202 I.179 J-.165 E.00095
G1 X143.018 Y109.322 F30000
; LINE_WIDTH: 0.25884
G1 F15000
G1 X143.018 Y109.022 E.00527
G1 X143.018 Y109.322 F30000
; LINE_WIDTH: 0.305086
G1 F15000
G1 X143.018 Y109.622 E.0064
; WIPE_START
G1 F24000
G1 X143.018 Y109.322 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.089 J-.542 P1  F30000
G1 X136.503 Y122.406 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X136.376 Y122.473 E.00478
G1 X135.905 Y122.89 E.02084
G1 X135.548 Y123.407 E.02084
G1 X135.325 Y123.995 E.02084
G1 X135.25 Y124.618 E.02084
G1 X135.325 Y125.242 E.02084
G1 X135.548 Y125.83 E.02084
G1 X135.905 Y126.347 E.02084
G1 X136.376 Y126.763 E.02084
G1 X136.503 Y126.831 E.00478
G1 X136.457 Y127.016 E.00635
G1 X105.255 Y127.016 E1.03504
G1 X105.209 Y126.831 E.00635
G1 X105.337 Y126.763 E.00478
G1 X105.807 Y126.347 E.02084
G1 X106.164 Y125.83 E.02084
M73 P75 R3
G1 X106.387 Y125.242 E.02084
G1 X106.463 Y124.618 E.02084
G1 X106.387 Y123.995 E.02084
G1 X106.164 Y123.407 E.02084
G1 X105.807 Y122.89 E.02084
G1 X105.337 Y122.473 E.02084
G1 X105.209 Y122.406 E.00478
G1 X105.255 Y122.22 E.00635
G1 X136.457 Y122.22 E1.03504
G1 X136.489 Y122.348 E.00436
; WIPE_START
G1 F24000
G1 X136.376 Y122.473 E-.06419
G1 X135.905 Y122.89 E-.23878
G1 X135.548 Y123.407 E-.23877
G1 X135.345 Y123.944 E-.21825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.038 J1.216 P1  F30000
G1 X140.004 Y124.09 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X140.068 Y124.618 E.01635
G1 X140.003 Y125.148 E.01638
G1 X139.814 Y125.646 E.01638
G1 X139.512 Y126.085 E.01638
G1 X139.112 Y126.438 E.01638
G1 X138.64 Y126.686 E.01638
G1 X138.123 Y126.814 E.01638
G1 X137.59 Y126.814 E.01638
G1 X137.072 Y126.686 E.01638
G1 X136.6 Y126.438 E.01638
G1 X136.201 Y126.085 E.01638
G1 X135.898 Y125.646 E.01638
G1 X135.709 Y125.148 E.01638
G1 X135.645 Y124.618 E.01638
G1 X135.709 Y124.089 E.01638
G1 X135.898 Y123.591 E.01638
G1 X136.201 Y123.152 E.01638
G1 X136.6 Y122.798 E.01638
G1 X137.072 Y122.551 E.01638
G1 X137.59 Y122.423 E.01638
G1 X138.123 Y122.423 E.01638
G1 X138.64 Y122.551 E.01638
G1 X139.112 Y122.798 E.01638
G1 X139.512 Y123.152 E.01638
G1 X139.814 Y123.591 E.01638
G1 X139.983 Y124.034 E.01457
M204 S10000
G1 X140.083 Y123.289 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.807 Y122.89 E.01608
G1 X139.337 Y122.473 E.02084
G1 X139.209 Y122.406 E.00478
G1 X139.255 Y122.22 E.00635
G1 X140.254 Y122.22 E.03314
G1 X140.254 Y123.235 E.03367
G1 X140.14 Y123.271 E.00397
; WIPE_START
G1 F24000
G1 X139.807 Y122.89 E-.19221
G1 X139.337 Y122.473 E-.23878
G1 X139.209 Y122.406 E-.0548
G1 X139.255 Y122.22 E-.07271
G1 X139.785 Y122.22 E-.2015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.213 J.097 P1  F30000
G1 X140.083 Y125.948 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F15476.087
G1 X140.254 Y126.001 E.00596
G1 X140.254 Y127.016 E.03367
G1 X139.255 Y127.016 E.03314
G1 X139.209 Y126.831 E.00635
G1 X139.337 Y126.763 E.00478
G1 X139.807 Y126.347 E.02084
G1 X140.048 Y125.997 E.01409
; WIPE_START
G1 F24000
G1 X140.254 Y126.001 E-.07817
G1 X140.254 Y127.016 E-.38568
G1 X139.475 Y127.016 E-.29616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.105 J-1.212 P1  F30000
G1 X106.006 Y124.106 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.068 Y124.618 E.01585
G1 X106.003 Y125.148 E.01638
G1 X105.814 Y125.646 E.01638
G1 X105.512 Y126.085 E.01638
G1 X105.112 Y126.438 E.01638
G1 X104.64 Y126.686 E.01638
G1 X104.123 Y126.814 E.01638
G1 X103.59 Y126.814 E.01638
G1 X103.072 Y126.686 E.01638
G1 X102.6 Y126.438 E.01638
G1 X102.201 Y126.085 E.01638
G1 X101.898 Y125.646 E.01638
G1 X101.709 Y125.148 E.01638
G1 X101.645 Y124.618 E.01638
G1 X101.709 Y124.089 E.01638
G1 X101.898 Y123.591 E.01638
G1 X102.201 Y123.152 E.01638
G1 X102.6 Y122.798 E.01638
G1 X103.072 Y122.551 E.01638
G1 X103.59 Y122.423 E.01638
G1 X104.123 Y122.423 E.01638
G1 X104.64 Y122.551 E.01638
G1 X105.112 Y122.798 E.01638
G1 X105.512 Y123.152 E.01638
G1 X105.814 Y123.591 E.01638
G1 X105.988 Y124.049 E.01507
M204 S10000
; WIPE_START
G1 F24000
G1 X106.068 Y124.618 E-.21838
G1 X106.003 Y125.148 E-.20259
G1 X105.814 Y125.646 E-.2026
G1 X105.61 Y125.942 E-.13643
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.914 J-.803 P1  F30000
G1 X102.503 Y122.406 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X102.376 Y122.473 E.00478
G1 X101.905 Y122.89 E.02084
G1 X101.63 Y123.289 E.01608
G1 X101.458 Y123.235 E.00596
G1 X101.458 Y122.22 E.03367
G1 X102.457 Y122.22 E.03314
G1 X102.489 Y122.348 E.00436
; WIPE_START
G1 F24000
G1 X102.376 Y122.473 E-.0642
G1 X101.905 Y122.89 E-.23878
G1 X101.63 Y123.289 E-.18419
G1 X101.458 Y123.235 E-.06829
G1 X101.458 Y122.697 E-.20454
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.18 J.298 P1  F30000
G1 X102.503 Y126.831 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F15476.087
G1 X102.457 Y127.016 E.00635
G1 X101.458 Y127.016 E.03314
G1 X101.458 Y126.001 E.03367
G1 X101.63 Y125.948 E.00596
G1 X101.905 Y126.347 E.01608
G1 X102.376 Y126.763 E.02084
G1 X102.45 Y126.803 E.00279
; WIPE_START
G1 F24000
G1 X102.457 Y127.016 E-.08125
G1 X101.458 Y127.016 E-.37968
G1 X101.458 Y126.229 E-.29907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.037 J1.216 P1  F30000
G1 X140.646 Y127.408 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X101.066 Y127.408 E1.21618
G1 X101.066 Y121.828 E.17146
G1 X140.646 Y121.828 E1.21618
G1 X140.646 Y127.348 E.16961
M204 S10000
G1 X139.886 Y126.813 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151052
G1 F15000
G1 X140.038 Y126.415 E.00375
G1 X140.219 Y125.785 F30000
; LINE_WIDTH: 0.43449
G1 F15000
G1 X140.252 Y125.604 E.00588
; LINE_WIDTH: 0.391801
G1 X140.285 Y125.423 E.00524
; LINE_WIDTH: 0.349113
G1 X140.318 Y125.242 E.00459
; LINE_WIDTH: 0.306424
G1 X140.322 Y125.21 E.00068
; LINE_WIDTH: 0.298796
G1 X140.34 Y124.92 E.00607
; LINE_WIDTH: 0.261158
G2 X140.357 Y124.607 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X140.34 Y124.317 E.0044
; LINE_WIDTH: 0.267101
G2 X140.318 Y123.995 I-2.649 J.015 E.00589
; LINE_WIDTH: 0.306424
G1 X140.285 Y123.814 E.00395
; LINE_WIDTH: 0.349112
G1 X140.252 Y123.633 E.00459
; LINE_WIDTH: 0.3918
G1 X140.219 Y123.452 E.00524
G1 X140.038 Y122.822 F30000
; LINE_WIDTH: 0.141571
G1 F15000
G1 X139.886 Y122.424 E.00342
G1 X139.045 Y122.252 F30000
; LINE_WIDTH: 0.405157
G1 F15000
G1 X138.752 Y122.198 E.00881
; LINE_WIDTH: 0.389446
G1 X138.558 Y122.174 E.00551
; LINE_WIDTH: 0.342434
G1 X138.365 Y122.151 E.00476
; LINE_WIDTH: 0.257331
G2 X138.147 Y122.126 I-.317 J1.798 E.00384
G2 X137.541 Y122.127 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X137.348 Y122.151 E.00327
; LINE_WIDTH: 0.295421
G1 X137.154 Y122.174 E.00401
; LINE_WIDTH: 0.342433
G1 X136.96 Y122.198 E.00476
; LINE_WIDTH: 0.389444
G1 X136.667 Y122.252 E.00842
G1 X136.044 Y122.424 F30000
; LINE_WIDTH: 0.134452
G1 F15000
G1 X135.882 Y122.607 E.00182
; WIPE_START
G1 F24000
G1 X136.044 Y122.424 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.017 J.669 P1  F30000
G1 X139.045 Y126.985 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.405154
G1 F15000
G1 X138.752 Y127.039 E.00881
; LINE_WIDTH: 0.389444
G1 X138.558 Y127.063 E.00551
; LINE_WIDTH: 0.342433
G1 X138.365 Y127.086 E.00476
; LINE_WIDTH: 0.257331
G3 X138.147 Y127.111 I-.317 J-1.798 E.00384
G3 X137.541 Y127.11 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X137.348 Y127.086 E.00327
; LINE_WIDTH: 0.295422
G1 X137.154 Y127.063 E.00401
; LINE_WIDTH: 0.342434
G1 X136.96 Y127.039 E.00476
; LINE_WIDTH: 0.389444
G1 X136.667 Y126.985 E.00842
G1 X136.044 Y126.813 F30000
; LINE_WIDTH: 0.134453
G1 F15000
G1 X135.882 Y126.63 E.00182
G1 X132.53 Y126.668 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X134.158 Y126.668 E.05401
G1 X135.127 Y125.7 E.04542
G3 X135.127 Y123.537 I2.288 J-1.082 E.07414
G1 X134.158 Y122.569 E.04542
G1 X130.582 Y122.569 E.11864
G1 X126.482 Y126.668 E.19231
G1 X122.906 Y126.668 E.11864
G1 X118.807 Y122.569 E.19231
G1 X115.23 Y122.569 E.11864
G1 X111.131 Y126.668 E.19231
G1 X107.554 Y126.668 E.11864
G1 X106.586 Y125.7 E.04542
G2 X106.586 Y123.537 I-2.288 J-1.082 E.07414
G1 X107.554 Y122.569 E.04542
G1 X111.131 Y122.569 E.11864
G1 X115.23 Y126.668 E.19231
G1 X118.807 Y126.668 E.11864
G1 X122.906 Y122.569 E.19231
G1 X126.482 Y122.569 E.11864
G1 X130.582 Y126.668 E.19231
G1 X128.953 Y126.668 E.05401
G1 X105.83 Y126.63 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.096921
G1 F15000
G1 X105.668 Y126.813 E.00107
G1 X105.045 Y126.985 F30000
; LINE_WIDTH: 0.405156
G1 F15000
G1 X104.752 Y127.039 E.00881
; LINE_WIDTH: 0.389444
G1 X104.558 Y127.063 E.00551
; LINE_WIDTH: 0.342433
G1 X104.365 Y127.086 E.00476
; LINE_WIDTH: 0.257331
G3 X104.147 Y127.111 I-.317 J-1.798 E.00384
G3 X103.541 Y127.11 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X103.348 Y127.086 E.00327
; LINE_WIDTH: 0.295422
G1 X103.154 Y127.063 E.00401
; LINE_WIDTH: 0.342433
G1 X102.96 Y127.039 E.00476
; LINE_WIDTH: 0.389444
G1 X102.667 Y126.985 E.00842
G1 X101.826 Y126.813 F30000
; LINE_WIDTH: 0.151054
G1 F15000
G1 X101.675 Y126.415 E.00375
G1 X101.494 Y125.785 F30000
; LINE_WIDTH: 0.3918
G1 F15000
G1 X101.46 Y125.604 E.00524
; LINE_WIDTH: 0.349112
G1 X101.427 Y125.423 E.00459
; LINE_WIDTH: 0.306424
G1 X101.394 Y125.242 E.00395
; LINE_WIDTH: 0.267101
G3 X101.373 Y124.92 I2.628 J-.336 E.00589
; LINE_WIDTH: 0.228538
G1 X101.355 Y124.63 E.0044
; LINE_WIDTH: 0.261158
G3 X101.373 Y124.317 I2.594 J-.011 E.00557
; LINE_WIDTH: 0.298796
G1 X101.39 Y124.026 E.00607
; LINE_WIDTH: 0.306424
G1 X101.394 Y123.995 E.00068
; LINE_WIDTH: 0.349113
G1 X101.427 Y123.814 E.00459
; LINE_WIDTH: 0.391801
G1 X101.46 Y123.633 E.00524
; LINE_WIDTH: 0.434489
G1 X101.494 Y123.452 E.00588
G1 X101.675 Y122.822 F30000
; LINE_WIDTH: 0.151056
G1 F15000
G1 X101.826 Y122.424 E.00375
G1 X102.667 Y122.252 F30000
; LINE_WIDTH: 0.389444
G1 F15000
G1 X102.96 Y122.198 E.00842
; LINE_WIDTH: 0.342432
G1 X103.154 Y122.174 E.00476
; LINE_WIDTH: 0.295421
G1 X103.348 Y122.151 E.00401
; LINE_WIDTH: 0.24841
G1 X103.541 Y122.127 E.00327
; LINE_WIDTH: 0.257331
G3 X104.147 Y122.126 I.315 J4.984 E.01058
G3 X104.365 Y122.151 I-.098 J1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X104.558 Y122.174 E.00476
; LINE_WIDTH: 0.389444
G1 X104.752 Y122.198 E.00551
; LINE_WIDTH: 0.405155
G1 X105.045 Y122.252 E.00881
G1 X105.668 Y122.424 F30000
; LINE_WIDTH: 0.0969209
G1 F15000
G1 X105.83 Y122.607 E.00107
; WIPE_START
G1 F24000
G1 X105.668 Y122.424 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.501 J1.109 P1  F30000
G1 X140.15 Y138.006 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X140.022 Y138.073 E.00478
G1 X139.552 Y138.489 E.02084
G1 X139.195 Y139.007 E.02084
G1 X138.972 Y139.594 E.02084
G1 X138.896 Y140.218 E.02084
G1 X138.972 Y140.842 E.02084
G1 X139.195 Y141.429 E.02084
G1 X139.552 Y141.946 E.02084
G1 X140.022 Y142.363 E.02084
G1 X140.15 Y142.43 E.00478
G1 X140.104 Y142.616 E.00635
G1 X108.901 Y142.616 E1.03504
G1 X108.856 Y142.43 E.00635
G1 X108.983 Y142.363 E.00478
G1 X109.454 Y141.946 E.02084
G1 X109.811 Y141.429 E.02084
G1 X110.033 Y140.842 E.02084
G1 X110.109 Y140.218 E.02084
G1 X110.033 Y139.594 E.02084
G1 X109.811 Y139.007 E.02084
G1 X109.454 Y138.489 E.02084
G1 X108.983 Y138.073 E.02084
G1 X108.856 Y138.006 E.00478
G1 X108.901 Y137.82 E.00635
G1 X140.104 Y137.82 E1.03504
G1 X140.135 Y137.947 E.00436
; WIPE_START
G1 F24000
G1 X140.022 Y138.073 E-.06419
G1 X139.552 Y138.489 E-.23878
G1 X139.195 Y139.007 E-.23877
G1 X138.991 Y139.544 E-.21825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.038 J1.216 P1  F30000
G1 X143.65 Y139.69 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.714 Y140.218 E.01635
G1 X143.65 Y140.747 E.01638
G1 X143.461 Y141.246 E.01638
G1 X143.158 Y141.684 E.01638
G1 X142.759 Y142.038 E.01638
G1 X142.287 Y142.286 E.01638
G1 X141.769 Y142.413 E.01638
G1 X141.236 Y142.413 E.01638
G1 X140.719 Y142.286 E.01638
G1 X140.246 Y142.038 E.01638
G1 X139.847 Y141.684 E.01638
G1 X139.545 Y141.246 E.01638
G1 X139.355 Y140.747 E.01638
G1 X139.291 Y140.218 E.01638
G1 X139.355 Y139.689 E.01638
G1 X139.545 Y139.19 E.01638
G1 X139.847 Y138.751 E.01638
G1 X140.246 Y138.398 E.01638
G1 X140.719 Y138.15 E.01638
G1 X141.236 Y138.022 E.01638
G1 X141.769 Y138.022 E.01638
G1 X142.287 Y138.15 E.01638
G1 X142.759 Y138.398 E.01638
G1 X143.158 Y138.751 E.01638
G1 X143.461 Y139.19 E.01638
G1 X143.629 Y139.633 E.01457
M204 S10000
G1 X143.729 Y138.888 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.454 Y138.489 E.01608
G1 X142.983 Y138.073 E.02084
G1 X142.856 Y138.006 E.00478
G1 X142.901 Y137.82 E.00635
G1 X143.901 Y137.82 E.03314
G1 X143.901 Y138.835 E.03367
G1 X143.786 Y138.87 E.00397
; WIPE_START
G1 F24000
G1 X143.454 Y138.489 E-.19221
G1 X142.983 Y138.073 E-.23878
G1 X142.856 Y138.006 E-.0548
G1 X142.901 Y137.82 E-.07271
G1 X143.432 Y137.82 E-.2015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.213 J.097 P1  F30000
G1 X143.729 Y141.547 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F15476.087
G1 X143.901 Y141.601 E.00596
G1 X143.901 Y142.616 E.03367
G1 X142.901 Y142.616 E.03314
G1 X142.856 Y142.43 E.00635
G1 X142.983 Y142.363 E.00478
G1 X143.454 Y141.946 E.02084
G1 X143.695 Y141.597 E.01409
; WIPE_START
G1 F24000
G1 X143.901 Y141.601 E-.07817
G1 X143.901 Y142.616 E-.38568
G1 X143.121 Y142.616 E-.29616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.105 J-1.212 P1  F30000
G1 X109.652 Y139.706 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X109.714 Y140.218 E.01585
G1 X109.65 Y140.747 E.01638
G1 X109.461 Y141.246 E.01638
G1 X109.158 Y141.684 E.01638
G1 X108.759 Y142.038 E.01638
G1 X108.287 Y142.286 E.01638
G1 X107.769 Y142.413 E.01638
G1 X107.236 Y142.413 E.01638
G1 X106.719 Y142.286 E.01638
G1 X106.246 Y142.038 E.01638
G1 X105.847 Y141.684 E.01638
G1 X105.545 Y141.246 E.01638
G1 X105.355 Y140.747 E.01638
G1 X105.291 Y140.218 E.01638
G1 X105.355 Y139.689 E.01638
G1 X105.545 Y139.19 E.01638
G1 X105.847 Y138.751 E.01638
G1 X106.246 Y138.398 E.01638
G1 X106.719 Y138.15 E.01638
G1 X107.236 Y138.022 E.01638
G1 X107.769 Y138.022 E.01638
G1 X108.287 Y138.15 E.01638
G1 X108.759 Y138.398 E.01638
G1 X109.158 Y138.751 E.01638
G1 X109.461 Y139.19 E.01638
G1 X109.635 Y139.649 E.01507
M204 S10000
; WIPE_START
G1 F24000
G1 X109.714 Y140.218 E-.21838
G1 X109.65 Y140.747 E-.20259
G1 X109.461 Y141.246 E-.2026
G1 X109.257 Y141.541 E-.13643
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.914 J-.803 P1  F30000
G1 X106.15 Y138.006 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X106.022 Y138.073 E.00478
G1 X105.552 Y138.489 E.02084
G1 X105.276 Y138.888 E.01608
G1 X105.105 Y138.835 E.00596
G1 X105.105 Y137.82 E.03367
G1 X106.104 Y137.82 E.03314
G1 X106.135 Y137.947 E.00436
; WIPE_START
G1 F24000
G1 X106.022 Y138.073 E-.0642
G1 X105.552 Y138.489 E-.23878
G1 X105.276 Y138.888 E-.18419
G1 X105.105 Y138.835 E-.06829
G1 X105.105 Y138.297 E-.20454
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.18 J.298 P1  F30000
G1 X106.15 Y142.43 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F15476.087
G1 X106.104 Y142.616 E.00635
G1 X105.105 Y142.616 E.03314
G1 X105.105 Y141.601 E.03367
G1 X105.276 Y141.547 E.00596
G1 X105.552 Y141.946 E.01608
G1 X106.022 Y142.363 E.02084
G1 X106.097 Y142.402 E.00279
; WIPE_START
G1 F24000
G1 X106.104 Y142.616 E-.08125
G1 X105.105 Y142.616 E-.37968
G1 X105.105 Y141.829 E-.29907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.037 J1.216 P1  F30000
G1 X144.293 Y143.008 Z1.8
G1 Z1.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X104.713 Y143.008 E1.21618
G1 X104.713 Y137.428 E.17146
G1 X144.293 Y137.428 E1.21618
G1 X144.293 Y142.948 E.16961
M204 S10000
G1 X143.533 Y142.412 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151052
G1 F15000
G1 X143.684 Y142.015 E.00375
G1 X143.865 Y141.384 F30000
; LINE_WIDTH: 0.43449
G1 F15000
G1 X143.899 Y141.203 E.00588
; LINE_WIDTH: 0.391801
G1 X143.932 Y141.022 E.00524
; LINE_WIDTH: 0.349113
G1 X143.965 Y140.841 E.00459
; LINE_WIDTH: 0.306424
G1 X143.969 Y140.81 E.00068
; LINE_WIDTH: 0.298796
G1 X143.986 Y140.519 E.00607
; LINE_WIDTH: 0.261158
G2 X144.004 Y140.207 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X143.986 Y139.916 E.0044
; LINE_WIDTH: 0.267101
G2 X143.965 Y139.595 I-2.649 J.015 E.00589
; LINE_WIDTH: 0.306424
G1 X143.932 Y139.413 E.00395
; LINE_WIDTH: 0.349112
G1 X143.899 Y139.232 E.00459
; LINE_WIDTH: 0.3918
G1 X143.865 Y139.051 E.00524
M73 P76 R3
G1 X143.684 Y138.421 F30000
; LINE_WIDTH: 0.141571
G1 F15000
G1 X143.533 Y138.023 E.00342
G1 X142.692 Y137.851 F30000
; LINE_WIDTH: 0.405157
G1 F15000
G1 X142.398 Y137.797 E.00881
; LINE_WIDTH: 0.389446
G1 X142.205 Y137.774 E.00551
; LINE_WIDTH: 0.342434
G1 X142.011 Y137.75 E.00476
; LINE_WIDTH: 0.257331
G2 X141.793 Y137.725 I-.317 J1.798 E.00384
G2 X141.188 Y137.727 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X140.994 Y137.75 E.00327
; LINE_WIDTH: 0.295421
G1 X140.801 Y137.774 E.00401
; LINE_WIDTH: 0.342433
G1 X140.607 Y137.797 E.00476
; LINE_WIDTH: 0.389444
G1 X140.314 Y137.851 E.00842
G1 X139.691 Y138.023 F30000
; LINE_WIDTH: 0.134452
G1 F15000
G1 X139.529 Y138.206 E.00182
; WIPE_START
G1 F24000
G1 X139.691 Y138.023 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.017 J.669 P1  F30000
G1 X142.692 Y142.585 Z1.8
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.405154
G1 F15000
G1 X142.398 Y142.639 E.00881
; LINE_WIDTH: 0.389444
G1 X142.205 Y142.662 E.00551
; LINE_WIDTH: 0.342433
G1 X142.011 Y142.686 E.00476
; LINE_WIDTH: 0.257331
G3 X141.793 Y142.711 I-.317 J-1.798 E.00384
G3 X141.188 Y142.709 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X140.994 Y142.686 E.00327
; LINE_WIDTH: 0.295422
G1 X140.801 Y142.662 E.00401
; LINE_WIDTH: 0.342434
G1 X140.607 Y142.639 E.00476
; LINE_WIDTH: 0.389444
G1 X140.314 Y142.585 E.00842
G1 X139.691 Y142.412 F30000
; LINE_WIDTH: 0.134453
G1 F15000
G1 X139.529 Y142.23 E.00182
G1 X136.177 Y142.267 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X137.805 Y142.267 E.05401
G1 X138.773 Y141.299 E.04542
G3 X138.773 Y139.136 I2.288 J-1.082 E.07414
G1 X137.805 Y138.168 E.04542
G1 X134.228 Y138.168 E.11864
G1 X130.129 Y142.267 E.19231
G1 X126.552 Y142.267 E.11864
G1 X122.453 Y138.168 E.19231
G1 X118.876 Y138.168 E.11864
G1 X114.777 Y142.267 E.19231
G1 X111.2 Y142.267 E.11864
G1 X110.232 Y141.299 E.04542
G2 X110.232 Y139.136 I-2.288 J-1.082 E.07414
G1 X111.2 Y138.168 E.04542
G1 X114.777 Y138.168 E.11864
G1 X118.876 Y142.267 E.19231
G1 X122.453 Y142.267 E.11864
G1 X126.552 Y138.168 E.19231
G1 X130.129 Y138.168 E.11864
G1 X134.228 Y142.267 E.19231
G1 X132.6 Y142.267 E.05401
G1 X109.477 Y142.23 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.096921
G1 F15000
G1 X109.315 Y142.412 E.00107
G1 X108.692 Y142.585 F30000
; LINE_WIDTH: 0.405156
G1 F15000
G1 X108.398 Y142.639 E.00881
; LINE_WIDTH: 0.389444
G1 X108.205 Y142.662 E.00551
; LINE_WIDTH: 0.342433
G1 X108.011 Y142.686 E.00476
; LINE_WIDTH: 0.257331
G3 X107.793 Y142.711 I-.317 J-1.798 E.00384
G3 X107.188 Y142.709 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X106.994 Y142.686 E.00327
; LINE_WIDTH: 0.295422
G1 X106.801 Y142.662 E.00401
; LINE_WIDTH: 0.342433
G1 X106.607 Y142.639 E.00476
; LINE_WIDTH: 0.389444
G1 X106.314 Y142.585 E.00842
G1 X105.473 Y142.412 F30000
; LINE_WIDTH: 0.151054
G1 F15000
G1 X105.321 Y142.015 E.00375
G1 X105.14 Y141.384 F30000
; LINE_WIDTH: 0.3918
G1 F15000
G1 X105.107 Y141.203 E.00524
; LINE_WIDTH: 0.349112
G1 X105.074 Y141.022 E.00459
; LINE_WIDTH: 0.306424
G1 X105.041 Y140.841 E.00395
; LINE_WIDTH: 0.267101
G3 X105.019 Y140.519 I2.628 J-.336 E.00589
; LINE_WIDTH: 0.228538
G1 X105.002 Y140.229 E.0044
; LINE_WIDTH: 0.261158
G3 X105.019 Y139.916 I2.594 J-.011 E.00557
; LINE_WIDTH: 0.298796
G1 X105.037 Y139.626 E.00607
; LINE_WIDTH: 0.306424
G1 X105.041 Y139.595 E.00068
; LINE_WIDTH: 0.349113
G1 X105.074 Y139.413 E.00459
; LINE_WIDTH: 0.391801
G1 X105.107 Y139.232 E.00524
; LINE_WIDTH: 0.434489
G1 X105.14 Y139.051 E.00588
G1 X105.321 Y138.421 F30000
; LINE_WIDTH: 0.151056
G1 F15000
G1 X105.473 Y138.023 E.00375
G1 X106.314 Y137.851 F30000
; LINE_WIDTH: 0.389444
G1 F15000
G1 X106.607 Y137.797 E.00842
; LINE_WIDTH: 0.342432
G1 X106.801 Y137.774 E.00476
; LINE_WIDTH: 0.295421
G1 X106.994 Y137.75 E.00401
; LINE_WIDTH: 0.24841
G1 X107.188 Y137.727 E.00327
; LINE_WIDTH: 0.257331
G3 X107.793 Y137.725 I.315 J4.984 E.01058
G3 X108.011 Y137.75 I-.098 J1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X108.205 Y137.774 E.00476
; LINE_WIDTH: 0.389444
G1 X108.398 Y137.797 E.00551
; LINE_WIDTH: 0.405155
G1 X108.692 Y137.851 E.00881
G1 X109.315 Y138.023 F30000
; LINE_WIDTH: 0.0969209
G1 F15000
G1 X109.477 Y138.206 E.00107
M106 S249.9
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.315 Y138.023 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/15
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
G3 Z1.8 I.945 J.767 P1  F30000
G1 X142.056 Y97.699 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X142.03 Y97.914 E.00718
G1 X108.673 Y97.914 E1.1065
G1 X108.647 Y97.699 E.00718
G1 X109.134 Y97.579 E.01663
G1 X109.605 Y97.332 E.01764
G1 X110.003 Y96.979 E.01764
G1 X110.305 Y96.541 E.01765
G1 X110.494 Y96.044 E.01765
G1 X110.558 Y95.516 E.01765
G1 X110.494 Y94.988 E.01765
G1 X110.305 Y94.49 E.01765
G1 X110.003 Y94.053 E.01765
G1 X109.605 Y93.7 E.01764
G1 X109.134 Y93.453 E.01764
G1 X108.647 Y93.333 E.01663
G1 X108.673 Y93.118 E.00718
G1 X142.03 Y93.118 E1.1065
G1 X142.056 Y93.333 E.00718
G1 X141.569 Y93.453 E.01663
G1 X141.098 Y93.7 E.01764
G1 X140.7 Y94.053 E.01765
G1 X140.398 Y94.49 E.01764
G1 X140.209 Y94.988 E.01765
G1 X140.145 Y95.516 E.01764
G1 X140.209 Y96.044 E.01765
G1 X140.398 Y96.541 E.01765
G1 X140.7 Y96.979 E.01765
G1 X141.098 Y97.332 E.01764
G1 X141.569 Y97.579 E.01764
G1 X141.998 Y97.685 E.01464
; WIPE_START
G1 F24000
G1 X142.03 Y97.914 E-.08794
G1 X140.261 Y97.914 E-.67206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.472 J1.122 P1  F30000
G1 X143.954 Y96.36 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.708 Y96.717 E.01334
G1 X143.381 Y97.007 E.01342
G1 X142.994 Y97.21 E.01342
G1 X142.57 Y97.314 E.01342
G1 X142.133 Y97.314 E.01342
G1 X141.709 Y97.21 E.01342
G1 X141.322 Y97.007 E.01342
G1 X140.996 Y96.717 E.01342
G1 X140.945 Y96.643 E.00276
G1 X140.748 Y96.358 E.01066
G1 X140.593 Y95.949 E.01342
G1 X140.54 Y95.516 E.01342
G1 X140.593 Y95.082 E.01342
G1 X140.748 Y94.674 E.01342
G1 X140.996 Y94.315 E.01342
G1 X141.322 Y94.025 E.01342
G1 X141.709 Y93.822 E.01342
G1 X142.133 Y93.717 E.01342
G1 X142.57 Y93.717 E.01342
G1 X142.994 Y93.822 E.01342
G1 X143.381 Y94.025 E.01342
G1 X143.708 Y94.315 E.01342
G1 X143.956 Y94.674 E.01342
G1 X144.11 Y95.082 E.01342
G1 X144.163 Y95.516 E.01342
G1 X144.11 Y95.949 E.01342
G1 X143.976 Y96.304 E.01165
M204 S10000
; WIPE_START
G1 F24000
G1 X143.708 Y96.717 E-.18727
G1 X143.381 Y97.007 E-.16595
G1 X142.994 Y97.21 E-.16595
G1 X142.57 Y97.314 E-.16595
G1 X142.373 Y97.314 E-.07488
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.811 J.907 P1  F30000
G1 X144.749 Y95.188 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X144.52 Y95.202 E.00763
G1 X144.494 Y94.988 E.00717
G1 X144.305 Y94.49 E.01765
G1 X144.003 Y94.053 E.01764
G1 X143.605 Y93.7 E.01765
G1 X143.134 Y93.453 E.01765
G1 X142.647 Y93.333 E.01663
G1 X142.673 Y93.118 E.00718
G1 X144.749 Y93.118 E.06887
G1 X144.749 Y95.128 E.06669
; WIPE_START
G1 F24000
G1 X144.52 Y95.202 E-.09162
G1 X144.494 Y94.988 E-.08209
G1 X144.305 Y94.49 E-.20213
G1 X144.003 Y94.053 E-.20213
G1 X143.645 Y93.735 E-.18203
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.177 J.311 P1  F30000
G1 X144.749 Y97.914 Z2
G1 Z1.6
G1 E.8 F1800
G1 F15476.087
G1 X142.673 Y97.914 E.06887
G1 X142.647 Y97.699 E.00718
G1 X143.134 Y97.579 E.01663
G1 X143.605 Y97.332 E.01764
G1 X144.003 Y96.979 E.01765
G1 X144.305 Y96.541 E.01764
G1 X144.494 Y96.044 E.01765
G1 X144.52 Y95.829 E.00717
G1 X144.749 Y95.843 E.00763
G1 X144.749 Y97.854 E.06669
; WIPE_START
G1 F24000
G1 X142.75 Y97.911 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.09 J-1.214 P1  F30000
G1 X106.183 Y95.202 Z2
G1 Z1.6
G1 E.8 F1800
G1 F15476.087
G1 X105.954 Y95.188 E.00763
G1 X105.954 Y93.118 E.06868
G1 X108.03 Y93.118 E.06887
G1 X108.056 Y93.333 E.00718
G1 X107.569 Y93.453 E.01663
G1 X107.098 Y93.7 E.01765
G1 X106.7 Y94.053 E.01764
G1 X106.398 Y94.49 E.01765
G1 X106.209 Y94.988 E.01764
G1 X106.19 Y95.143 E.00518
; WIPE_START
G1 F24000
G1 X105.954 Y95.188 E-.09162
G1 X105.954 Y93.429 E-.66838
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.136 J.436 P1  F30000
G1 X107.327 Y97.009 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.322 Y97.007 E.00017
G1 X106.996 Y96.717 E.01342
G1 X106.748 Y96.358 E.01342
G1 X106.593 Y95.949 E.01342
G1 X106.54 Y95.516 E.01342
G1 X106.593 Y95.082 E.01342
G1 X106.748 Y94.674 E.01342
G1 X106.996 Y94.315 E.01342
G1 X107.322 Y94.025 E.01342
G1 X107.709 Y93.822 E.01342
G1 X108.133 Y93.717 E.01342
G1 X108.57 Y93.717 E.01342
G1 X108.994 Y93.822 E.01342
G1 X109.381 Y94.025 E.01342
G1 X109.708 Y94.315 E.01342
G1 X109.956 Y94.674 E.01342
G1 X110.11 Y95.082 E.01342
G1 X110.163 Y95.516 E.01342
G1 X110.11 Y95.949 E.01342
G1 X109.956 Y96.358 E.01342
G1 X109.708 Y96.717 E.01342
G1 X109.381 Y97.007 E.01342
G1 X108.994 Y97.21 E.01342
G1 X108.57 Y97.314 E.01342
G1 X108.133 Y97.314 E.01342
G1 X107.709 Y97.21 E.01342
G1 X107.381 Y97.037 E.0114
M204 S10000
G1 X107.069 Y97.306 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.098 Y97.332 E.0013
G1 X107.569 Y97.579 E.01764
G1 X108.056 Y97.699 E.01663
G1 X108.03 Y97.914 E.00718
G1 X105.954 Y97.914 E.06887
G1 X105.954 Y95.843 E.06868
G1 X106.183 Y95.829 E.00763
G1 X106.209 Y96.044 E.00717
G1 X106.398 Y96.541 E.01765
G1 X106.7 Y96.979 E.01764
G1 X107.024 Y97.266 E.01435
; WIPE_START
G1 F24000
G1 X107.098 Y97.332 E-.03769
G1 X107.569 Y97.579 E-.20213
G1 X108.056 Y97.699 E-.19055
G1 X108.03 Y97.914 E-.08223
G1 X107.379 Y97.914 E-.2474
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.013 J1.217 P1  F30000
G1 X145.142 Y98.306 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X105.562 Y98.306 E1.21618
G1 X105.562 Y92.726 E.17146
G1 X145.142 Y92.726 E1.21618
G1 X145.142 Y98.246 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X143.142 Y98.249 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.652 J1.027 P1  F30000
G1 X144.546 Y97.357 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.282812
G1 F15000
G1 X143.418 Y97.71 E.02311
G1 X144.152 Y97.71 F30000
; LINE_WIDTH: 0.511101
G1 F13456.334
G1 X144.546 Y96.675 E.04224
G1 X144.354 Y95.623 F30000
; LINE_WIDTH: 0.271406
G1 F15000
G1 X144.475 Y95.516 E.00301
; LINE_WIDTH: 0.311995
G1 X144.946 Y95.516 E.01032
G1 X144.546 Y94.356 F30000
; LINE_WIDTH: 0.470047
G1 F14749.726
G1 X144.152 Y93.321 E.03854
G1 X144.546 Y93.674 F30000
; LINE_WIDTH: 0.282814
G1 F15000
G1 X143.418 Y93.321 E.02311
G1 X142.352 Y92.922 F30000
; LINE_WIDTH: 0.305086
G1 F15000
G1 X142.352 Y93.222 E.0064
; LINE_WIDTH: 0.25884
G1 X142.352 Y93.521 E.00527
G1 X141.298 Y93.342 F30000
; LINE_WIDTH: 0.108846
G1 F15000
G2 X141.144 Y93.419 I.025 J.242 E.00095
; WIPE_START
G1 F24000
G1 X141.232 Y93.358 E-.46675
G1 X141.298 Y93.342 E-.29325
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.188 J.263 P1  F30000
G1 X142.352 Y98.11 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.305086
G1 F15000
G1 X142.352 Y97.81 E.0064
; LINE_WIDTH: 0.25884
G1 X142.352 Y97.51 E.00527
G1 X141.298 Y97.69 F30000
; LINE_WIDTH: 0.108847
G1 F15000
G3 X141.144 Y97.612 I.025 J-.242 E.00095
G1 X139.004 Y95.629 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X139.074 Y94.825 E.02481
G1 X139.258 Y94.264 E.01813
G1 X111.445 Y94.264 E.85459
G1 X111.629 Y94.825 E.01813
G1 X111.699 Y95.402 E.01786
G1 X111.629 Y96.207 E.02481
G1 X111.445 Y96.767 E.01813
G1 X139.258 Y96.767 E.85459
G1 X139.074 Y96.207 E.01813
G1 X139.011 Y95.689 E.01602
G1 X138.63 Y95.675 F30000
G1 F15000
G3 X138.734 Y94.641 I5.058 J-.012 E.03198
G1 X111.969 Y94.641 E.82241
G1 X112.073 Y95.357 E.02222
G3 X111.969 Y96.39 I-5.058 J.012 E.03198
G1 X138.734 Y96.39 E.82241
G1 X138.639 Y95.734 E.02037
G1 X112.794 Y95.361 F30000
; LINE_WIDTH: 0.351909
G1 F15000
G1 X112.794 Y95.67 E.00778
G1 X137.909 Y95.67 E.63238
G1 X137.909 Y95.361 E.00778
G1 X112.854 Y95.361 E.63087
G1 X112.46 Y95.516 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X112.412 Y96.013 E.01536
G1 X138.291 Y96.013 E.79519
G1 X138.243 Y95.516 E.01536
G1 X138.291 Y95.018 E.01536
G1 X112.412 Y95.018 E.79519
G1 X112.454 Y95.456 E.01351
G1 X111.325 Y95.448 F30000
G1 F15000
G1 X111.255 Y96.161 E.02203
G1 X111.016 Y96.837 E.02203
G1 X110.823 Y97.145 E.01114
G1 X139.88 Y97.145 E.89282
G1 X139.687 Y96.837 E.01114
G1 X139.481 Y96.293 E.01786
G1 X139.379 Y95.584 E.02203
G1 X139.449 Y94.871 E.02203
G1 X139.687 Y94.195 E.02203
G1 X139.88 Y93.887 E.01114
G1 X110.823 Y93.887 E.89282
G1 X111.016 Y94.195 E.01114
G1 X111.222 Y94.738 E.01786
G1 X111.316 Y95.388 E.02018
G1 X110.95 Y95.493 F30000
G1 F15000
G1 X110.88 Y96.116 E.01925
G1 X110.663 Y96.703 E.01925
G1 X110.312 Y97.222 E.01925
G1 X109.982 Y97.522 E.01369
G1 X140.721 Y97.522 E.94453
G1 X140.391 Y97.222 E.01369
G1 X140.061 Y96.744 E.01786
G1 X139.834 Y96.16 E.01925
G1 X139.753 Y95.539 E.01925
G1 X139.823 Y94.916 E.01925
G1 X140.04 Y94.328 E.01925
G1 X140.391 Y93.81 E.01925
G1 X140.721 Y93.51 E.01369
G1 X109.982 Y93.51 E.94453
G1 X110.312 Y93.81 E.01369
G1 X110.642 Y94.288 E.01786
G1 X110.869 Y94.872 E.01925
G1 X110.943 Y95.434 E.01741
G1 X109.559 Y93.419 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104412
M73 P77 R3
G1 F15000
G2 X109.405 Y93.342 I-.179 J.165 E.00088
G1 X108.352 Y93.521 F30000
; LINE_WIDTH: 0.258838
G1 F15000
G1 X108.352 Y93.222 E.00527
; LINE_WIDTH: 0.305084
G1 X108.352 Y92.922 E.0064
G1 X107.285 Y93.321 F30000
; LINE_WIDTH: 0.265393
G1 F15000
G1 X106.157 Y93.674 E.02143
G1 X106.551 Y93.321 F30000
; LINE_WIDTH: 0.511107
G1 F13456.171
G1 X106.157 Y94.356 E.04224
G1 X106.157 Y96.675 F30000
; LINE_WIDTH: 0.511106
G1 F13456.19
G1 X106.551 Y97.71 E.04224
G1 X106.157 Y97.357 F30000
; LINE_WIDTH: 0.265392
G1 F15000
G1 X107.285 Y97.71 E.02143
G1 X108.352 Y98.11 F30000
; LINE_WIDTH: 0.305086
G1 F15000
G1 X108.352 Y97.81 E.0064
; LINE_WIDTH: 0.25884
G1 X108.352 Y97.51 E.00527
G1 X109.405 Y97.69 F30000
; LINE_WIDTH: 0.104411
G1 F15000
G2 X109.559 Y97.612 I-.025 J-.242 E.00088
; WIPE_START
G1 F24000
G1 X109.471 Y97.673 E-.46676
G1 X109.405 Y97.69 E-.29324
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.398 J1.15 P1  F30000
G1 X142.722 Y109.211 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X142.696 Y109.426 E.00718
G1 X109.339 Y109.426 E1.1065
G1 X109.313 Y109.211 E.00718
G1 X109.8 Y109.091 E.01663
G1 X110.271 Y108.844 E.01764
G1 X110.669 Y108.491 E.01764
G1 X110.971 Y108.053 E.01765
G1 X111.16 Y107.556 E.01765
G1 X111.224 Y107.028 E.01765
G1 X111.16 Y106.5 E.01765
G1 X110.971 Y106.002 E.01765
G1 X110.669 Y105.565 E.01765
G1 X110.271 Y105.212 E.01764
G1 X109.8 Y104.965 E.01764
G1 X109.313 Y104.845 E.01663
G1 X109.339 Y104.63 E.00718
G1 X142.696 Y104.63 E1.1065
G1 X142.722 Y104.845 E.00718
G1 X142.235 Y104.965 E.01663
G1 X141.764 Y105.212 E.01764
G1 X141.366 Y105.565 E.01765
G1 X141.064 Y106.002 E.01764
G1 X140.875 Y106.5 E.01765
G1 X140.811 Y107.028 E.01764
G1 X140.875 Y107.556 E.01765
G1 X141.064 Y108.053 E.01765
G1 X141.366 Y108.491 E.01765
G1 X141.764 Y108.844 E.01764
G1 X142.235 Y109.091 E.01764
G1 X142.664 Y109.197 E.01464
; WIPE_START
G1 F24000
G1 X142.696 Y109.426 E-.08794
G1 X140.927 Y109.426 E-.67206
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.472 J1.122 P1  F30000
G1 X144.62 Y107.872 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.374 Y108.229 E.01334
G1 X144.047 Y108.519 E.01342
G1 X143.66 Y108.722 E.01342
G1 X143.236 Y108.826 E.01342
G1 X142.799 Y108.826 E.01342
G1 X142.375 Y108.722 E.01342
G1 X141.989 Y108.519 E.01342
G1 X141.662 Y108.229 E.01342
G1 X141.611 Y108.155 E.00276
G1 X141.414 Y107.87 E.01066
G1 X141.259 Y107.461 E.01342
G1 X141.206 Y107.028 E.01342
G1 X141.259 Y106.594 E.01342
G1 X141.414 Y106.186 E.01342
G1 X141.662 Y105.827 E.01342
M73 P77 R2
G1 X141.989 Y105.537 E.01342
G1 X142.375 Y105.334 E.01342
G1 X142.799 Y105.23 E.01342
G1 X143.236 Y105.23 E.01342
G1 X143.66 Y105.334 E.01342
G1 X144.047 Y105.537 E.01342
G1 X144.374 Y105.827 E.01342
G1 X144.622 Y106.186 E.01342
G1 X144.777 Y106.594 E.01342
G1 X144.829 Y107.028 E.01342
G1 X144.777 Y107.461 E.01342
G1 X144.642 Y107.816 E.01165
M204 S10000
; WIPE_START
G1 F24000
G1 X144.374 Y108.229 E-.18727
G1 X144.047 Y108.519 E-.16595
G1 X143.66 Y108.722 E-.16595
G1 X143.236 Y108.826 E-.16595
G1 X143.039 Y108.826 E-.07488
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.811 J.907 P1  F30000
G1 X145.416 Y106.7 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X145.186 Y106.714 E.00763
G1 X145.16 Y106.5 E.00717
G1 X144.971 Y106.002 E.01765
G1 X144.669 Y105.565 E.01764
G1 X144.271 Y105.212 E.01765
G1 X143.8 Y104.965 E.01765
G1 X143.313 Y104.845 E.01663
G1 X143.339 Y104.63 E.00718
G1 X145.416 Y104.63 E.06887
G1 X145.416 Y106.64 E.06669
; WIPE_START
G1 F24000
G1 X145.186 Y106.714 E-.09162
G1 X145.16 Y106.5 E-.08209
G1 X144.971 Y106.002 E-.20213
G1 X144.669 Y105.565 E-.20213
G1 X144.311 Y105.247 E-.18203
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.177 J.311 P1  F30000
G1 X145.416 Y109.426 Z2
G1 Z1.6
G1 E.8 F1800
G1 F15476.087
G1 X143.339 Y109.426 E.06887
G1 X143.313 Y109.211 E.00718
G1 X143.8 Y109.091 E.01663
G1 X144.271 Y108.844 E.01764
G1 X144.669 Y108.491 E.01765
G1 X144.971 Y108.053 E.01764
G1 X145.16 Y107.556 E.01765
G1 X145.186 Y107.341 E.00717
G1 X145.416 Y107.355 E.00763
G1 X145.416 Y109.366 E.06669
; WIPE_START
G1 F24000
G1 X143.416 Y109.424 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.09 J-1.214 P1  F30000
G1 X106.849 Y106.714 Z2
G1 Z1.6
G1 E.8 F1800
G1 F15476.087
G1 X106.62 Y106.7 E.00763
G1 X106.62 Y104.63 E.06868
G1 X108.696 Y104.63 E.06887
G1 X108.722 Y104.845 E.00718
G1 X108.235 Y104.965 E.01663
G1 X107.764 Y105.212 E.01765
G1 X107.366 Y105.565 E.01764
G1 X107.064 Y106.002 E.01765
G1 X106.875 Y106.5 E.01764
G1 X106.856 Y106.655 E.00518
; WIPE_START
G1 F24000
G1 X106.62 Y106.7 E-.09162
G1 X106.62 Y104.941 E-.66838
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.136 J.436 P1  F30000
G1 X107.993 Y108.521 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.989 Y108.519 E.00017
G1 X107.662 Y108.229 E.01342
G1 X107.414 Y107.87 E.01342
G1 X107.259 Y107.461 E.01342
G1 X107.206 Y107.028 E.01342
G1 X107.259 Y106.594 E.01342
G1 X107.414 Y106.186 E.01342
G1 X107.662 Y105.827 E.01342
G1 X107.989 Y105.537 E.01342
G1 X108.375 Y105.334 E.01342
G1 X108.799 Y105.23 E.01342
G1 X109.236 Y105.23 E.01342
G1 X109.66 Y105.334 E.01342
G1 X110.047 Y105.537 E.01342
G1 X110.374 Y105.827 E.01342
G1 X110.622 Y106.186 E.01342
G1 X110.777 Y106.594 E.01342
G1 X110.829 Y107.028 E.01342
G1 X110.777 Y107.461 E.01342
G1 X110.622 Y107.87 E.01342
G1 X110.374 Y108.229 E.01342
G1 X110.047 Y108.519 E.01342
G1 X109.66 Y108.722 E.01342
G1 X109.236 Y108.826 E.01342
G1 X108.799 Y108.826 E.01342
G1 X108.375 Y108.722 E.01342
G1 X108.047 Y108.549 E.0114
M204 S10000
G1 X107.735 Y108.818 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X107.764 Y108.844 E.0013
G1 X108.235 Y109.091 E.01764
G1 X108.722 Y109.211 E.01663
G1 X108.696 Y109.426 E.00718
G1 X106.62 Y109.426 E.06887
G1 X106.62 Y107.355 E.06868
G1 X106.849 Y107.341 E.00763
G1 X106.875 Y107.556 E.00717
G1 X107.064 Y108.053 E.01765
G1 X107.366 Y108.491 E.01764
G1 X107.69 Y108.778 E.01435
; WIPE_START
G1 F24000
G1 X107.764 Y108.844 E-.03769
G1 X108.235 Y109.091 E-.20213
G1 X108.722 Y109.211 E-.19055
G1 X108.696 Y109.426 E-.08223
G1 X108.045 Y109.426 E-.2474
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.013 J1.217 P1  F30000
G1 X145.808 Y109.818 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.228 Y109.818 E1.21618
G1 X106.228 Y104.238 E.17146
G1 X145.808 Y104.238 E1.21618
G1 X145.808 Y109.758 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X143.808 Y109.761 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.652 J1.027 P1  F30000
G1 X145.212 Y108.869 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.282812
G1 F15000
G1 X144.084 Y109.222 E.02311
G1 X144.818 Y109.222 F30000
; LINE_WIDTH: 0.511101
G1 F13456.334
G1 X145.212 Y108.188 E.04224
G1 X145.02 Y107.135 F30000
; LINE_WIDTH: 0.271406
G1 F15000
G1 X145.141 Y107.028 E.00301
; LINE_WIDTH: 0.311995
G1 X145.612 Y107.028 E.01032
G1 X145.212 Y105.868 F30000
; LINE_WIDTH: 0.470047
G1 F14749.726
G1 X144.818 Y104.833 E.03854
G1 X145.212 Y105.186 F30000
; LINE_WIDTH: 0.282814
G1 F15000
G1 X144.084 Y104.833 E.02311
G1 X143.018 Y104.434 F30000
; LINE_WIDTH: 0.305086
G1 F15000
G1 X143.018 Y104.734 E.0064
; LINE_WIDTH: 0.25884
G1 X143.018 Y105.033 E.00527
G1 X141.964 Y104.854 F30000
; LINE_WIDTH: 0.108846
G1 F15000
G2 X141.81 Y104.931 I.025 J.242 E.00095
; WIPE_START
G1 F24000
G1 X141.898 Y104.87 E-.46675
G1 X141.964 Y104.854 E-.29325
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.188 J.263 P1  F30000
G1 X143.018 Y109.622 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.305086
G1 F15000
G1 X143.018 Y109.322 E.0064
; LINE_WIDTH: 0.25884
G1 X143.018 Y109.022 E.00527
G1 X141.964 Y109.202 F30000
; LINE_WIDTH: 0.108847
G1 F15000
G3 X141.81 Y109.124 I.025 J-.242 E.00095
G1 X139.67 Y107.141 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X139.74 Y106.337 E.02481
G1 X139.924 Y105.776 E.01813
G1 X112.111 Y105.776 E.85459
G1 X112.295 Y106.337 E.01813
G1 X112.365 Y106.914 E.01786
G1 X112.295 Y107.719 E.02481
G1 X112.111 Y108.28 E.01813
G1 X139.924 Y108.28 E.85459
G1 X139.74 Y107.719 E.01813
G1 X139.678 Y107.201 E.01602
G1 X139.296 Y107.187 F30000
G1 F15000
G3 X139.4 Y106.153 I5.058 J-.012 E.03198
G1 X112.635 Y106.153 E.82241
G1 X112.739 Y106.869 E.02222
G3 X112.635 Y107.902 I-5.058 J.012 E.03198
G1 X139.4 Y107.902 E.82241
G1 X139.305 Y107.246 E.02037
G1 X113.46 Y106.873 F30000
; LINE_WIDTH: 0.351909
G1 F15000
G1 X113.46 Y107.182 E.00778
G1 X138.576 Y107.182 E.63238
G1 X138.576 Y106.873 E.00778
G1 X113.52 Y106.873 E.63087
G1 X113.126 Y107.028 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X113.078 Y107.525 E.01536
G1 X138.957 Y107.525 E.79519
G1 X138.909 Y107.028 E.01536
G1 X138.957 Y106.53 E.01536
G1 X113.078 Y106.53 E.79519
G1 X113.12 Y106.968 E.01351
G1 X111.991 Y106.96 F30000
G1 F15000
G1 X111.921 Y107.673 E.02203
G1 X111.682 Y108.349 E.02203
G1 X111.49 Y108.657 E.01114
G1 X140.546 Y108.657 E.89282
G1 X140.353 Y108.349 E.01114
G1 X140.147 Y107.806 E.01786
G1 X140.045 Y107.096 E.02203
G1 X140.115 Y106.383 E.02203
G1 X140.353 Y105.707 E.02203
G1 X140.546 Y105.399 E.01114
G1 X111.49 Y105.399 E.89282
G1 X111.682 Y105.707 E.01114
G1 X111.888 Y106.25 E.01786
G1 X111.982 Y106.9 E.02018
G1 X111.616 Y107.005 F30000
G1 F15000
G1 X111.546 Y107.628 E.01925
G1 X111.329 Y108.215 E.01925
G1 X110.978 Y108.734 E.01925
G1 X110.648 Y109.034 E.01369
G1 X141.387 Y109.034 E.94453
G1 X141.057 Y108.734 E.01369
G1 X140.727 Y108.256 E.01786
G1 X140.5 Y107.672 E.01925
G1 X140.419 Y107.051 E.01925
G1 X140.489 Y106.428 E.01925
G1 X140.706 Y105.84 E.01925
G1 X141.057 Y105.322 E.01925
G1 X141.387 Y105.022 E.01369
G1 X110.648 Y105.022 E.94453
G1 X110.978 Y105.322 E.01369
G1 X111.308 Y105.8 E.01786
G1 X111.535 Y106.384 E.01925
G1 X111.609 Y106.946 E.01741
G1 X110.225 Y104.931 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.104412
G1 F15000
G2 X110.071 Y104.854 I-.179 J.165 E.00088
G1 X109.018 Y105.033 F30000
; LINE_WIDTH: 0.258838
G1 F15000
G1 X109.018 Y104.734 E.00527
; LINE_WIDTH: 0.305084
G1 X109.018 Y104.434 E.0064
G1 X107.952 Y104.833 F30000
; LINE_WIDTH: 0.265393
G1 F15000
G1 X106.823 Y105.187 E.02143
G1 X107.217 Y104.833 F30000
; LINE_WIDTH: 0.511107
G1 F13456.171
G1 X106.823 Y105.868 E.04224
G1 X106.823 Y108.188 F30000
; LINE_WIDTH: 0.511106
G1 F13456.19
G1 X107.217 Y109.222 E.04224
G1 X106.823 Y108.869 F30000
; LINE_WIDTH: 0.265392
G1 F15000
G1 X107.952 Y109.222 E.02143
G1 X109.018 Y109.622 F30000
; LINE_WIDTH: 0.305086
G1 F15000
G1 X109.018 Y109.322 E.0064
; LINE_WIDTH: 0.25884
M73 P78 R2
G1 X109.018 Y109.022 E.00527
G1 X110.071 Y109.202 F30000
; LINE_WIDTH: 0.104411
G1 F15000
G2 X110.225 Y109.124 I-.025 J-.242 E.00088
; WIPE_START
G1 F24000
G1 X110.137 Y109.186 E-.46676
G1 X110.071 Y109.202 E-.29324
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.544 J1.089 P1  F30000
G1 X136.503 Y122.406 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X136.376 Y122.473 E.00478
G1 X135.905 Y122.89 E.02084
G1 X135.548 Y123.407 E.02084
G1 X135.325 Y123.995 E.02084
G1 X135.25 Y124.618 E.02084
G1 X135.325 Y125.242 E.02084
G1 X135.548 Y125.83 E.02084
G1 X135.905 Y126.347 E.02084
G1 X136.376 Y126.763 E.02084
G1 X136.503 Y126.831 E.00478
G1 X136.457 Y127.016 E.00635
G1 X105.255 Y127.016 E1.03504
G1 X105.209 Y126.831 E.00635
G1 X105.337 Y126.763 E.00478
G1 X105.807 Y126.347 E.02084
G1 X106.164 Y125.83 E.02084
G1 X106.387 Y125.242 E.02084
G1 X106.463 Y124.618 E.02084
G1 X106.387 Y123.995 E.02084
G1 X106.164 Y123.407 E.02084
G1 X105.807 Y122.89 E.02084
G1 X105.337 Y122.473 E.02084
G1 X105.209 Y122.406 E.00478
G1 X105.255 Y122.22 E.00635
G1 X136.457 Y122.22 E1.03504
G1 X136.489 Y122.348 E.00436
; WIPE_START
G1 F24000
G1 X136.376 Y122.473 E-.06419
G1 X135.905 Y122.89 E-.23878
G1 X135.548 Y123.407 E-.23877
G1 X135.345 Y123.944 E-.21825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.038 J1.216 P1  F30000
G1 X140.004 Y124.09 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X140.068 Y124.618 E.01636
G1 X140.003 Y125.148 E.01638
G1 X139.814 Y125.646 E.01638
G1 X139.512 Y126.085 E.01638
G1 X139.112 Y126.438 E.01638
G1 X138.64 Y126.686 E.01638
G1 X138.123 Y126.814 E.01638
G1 X137.59 Y126.814 E.01638
G1 X137.072 Y126.686 E.01638
G1 X136.6 Y126.438 E.01638
G1 X136.201 Y126.085 E.01638
G1 X135.898 Y125.646 E.01638
G1 X135.709 Y125.148 E.01638
G1 X135.645 Y124.618 E.01638
G1 X135.709 Y124.089 E.01638
G1 X135.898 Y123.591 E.01638
G1 X136.201 Y123.152 E.01638
G1 X136.6 Y122.798 E.01638
G1 X137.072 Y122.551 E.01638
G1 X137.59 Y122.423 E.01638
G1 X138.123 Y122.423 E.01638
G1 X138.64 Y122.551 E.01638
G1 X139.112 Y122.798 E.01638
G1 X139.512 Y123.152 E.01638
G1 X139.814 Y123.591 E.01638
G1 X139.982 Y124.034 E.01456
M204 S10000
G1 X140.083 Y123.289 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.807 Y122.89 E.01608
G1 X139.337 Y122.473 E.02084
G1 X139.209 Y122.406 E.00478
G1 X139.255 Y122.22 E.00635
G1 X140.254 Y122.22 E.03314
G1 X140.254 Y123.235 E.03367
G1 X140.14 Y123.271 E.00397
; WIPE_START
G1 F24000
G1 X139.807 Y122.89 E-.19221
G1 X139.337 Y122.473 E-.23878
G1 X139.209 Y122.406 E-.0548
G1 X139.255 Y122.22 E-.07271
G1 X139.785 Y122.22 E-.2015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.213 J.097 P1  F30000
G1 X140.083 Y125.948 Z2
G1 Z1.6
G1 E.8 F1800
G1 F15476.087
G1 X140.254 Y126.001 E.00596
G1 X140.254 Y127.016 E.03367
G1 X139.255 Y127.016 E.03314
G1 X139.209 Y126.831 E.00635
G1 X139.337 Y126.763 E.00478
G1 X139.807 Y126.347 E.02084
G1 X140.048 Y125.997 E.01409
; WIPE_START
G1 F24000
G1 X140.254 Y126.001 E-.07817
G1 X140.254 Y127.016 E-.38568
G1 X139.475 Y127.016 E-.29616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.105 J-1.212 P1  F30000
G1 X106.007 Y124.117 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.036 Y124.354 E.00734
G1 X106.068 Y124.618 E.00819
G1 X106.003 Y125.148 E.01638
G1 X105.814 Y125.646 E.01638
G1 X105.512 Y126.085 E.01638
G1 X105.112 Y126.438 E.01638
G1 X104.64 Y126.686 E.01638
G1 X104.123 Y126.814 E.01638
G1 X103.59 Y126.814 E.01638
G1 X103.072 Y126.686 E.01638
G1 X102.6 Y126.438 E.01638
G1 X102.201 Y126.085 E.01638
G1 X101.898 Y125.646 E.01638
G1 X101.709 Y125.148 E.01638
G1 X101.645 Y124.618 E.01638
G1 X101.709 Y124.089 E.01638
G1 X101.898 Y123.591 E.01638
G1 X102.201 Y123.152 E.01638
G1 X102.6 Y122.798 E.01638
G1 X103.072 Y122.551 E.01638
G1 X103.59 Y122.423 E.01638
G1 X104.123 Y122.423 E.01638
G1 X104.64 Y122.551 E.01638
G1 X105.112 Y122.798 E.01638
G1 X105.512 Y123.152 E.01638
G1 X105.814 Y123.591 E.01638
G1 X105.992 Y124.059 E.01539
M204 S10000
; WIPE_START
G1 F24000
G1 X106.036 Y124.354 E-.11328
G1 X106.068 Y124.618 E-.1013
G1 X106.003 Y125.148 E-.20259
G1 X105.814 Y125.646 E-.2026
G1 X105.605 Y125.95 E-.14023
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.916 J-.802 P1  F30000
G1 X102.503 Y122.406 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X102.376 Y122.473 E.00478
G1 X101.905 Y122.89 E.02084
G1 X101.63 Y123.289 E.01608
G1 X101.458 Y123.235 E.00596
G1 X101.458 Y122.22 E.03367
G1 X102.457 Y122.22 E.03314
G1 X102.489 Y122.348 E.00436
; WIPE_START
G1 F24000
G1 X102.376 Y122.473 E-.06419
G1 X101.905 Y122.89 E-.23878
G1 X101.63 Y123.289 E-.18419
G1 X101.458 Y123.235 E-.06829
G1 X101.458 Y122.697 E-.20454
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.18 J.298 P1  F30000
G1 X102.503 Y126.831 Z2
G1 Z1.6
G1 E.8 F1800
G1 F15476.087
G1 X102.457 Y127.016 E.00635
G1 X101.458 Y127.016 E.03314
G1 X101.458 Y126.001 E.03367
G1 X101.63 Y125.948 E.00596
G1 X101.905 Y126.347 E.01608
G1 X102.376 Y126.763 E.02084
G1 X102.45 Y126.803 E.00279
; WIPE_START
G1 F24000
G1 X102.457 Y127.016 E-.08125
G1 X101.458 Y127.016 E-.37968
G1 X101.458 Y126.229 E-.29907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.037 J1.216 P1  F30000
G1 X140.646 Y127.408 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X101.066 Y127.408 E1.21618
G1 X101.066 Y121.828 E.17146
G1 X140.646 Y121.828 E1.21618
G1 X140.646 Y127.348 E.16961
M204 S10000
G1 X139.886 Y126.813 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151052
G1 F15000
G1 X140.038 Y126.415 E.00375
G1 X140.219 Y125.785 F30000
; LINE_WIDTH: 0.43449
G1 F15000
G1 X140.252 Y125.604 E.00588
; LINE_WIDTH: 0.391801
G1 X140.285 Y125.423 E.00524
; LINE_WIDTH: 0.349113
G1 X140.318 Y125.242 E.00459
; LINE_WIDTH: 0.306424
G1 X140.322 Y125.21 E.00068
; LINE_WIDTH: 0.298796
G1 X140.34 Y124.92 E.00607
; LINE_WIDTH: 0.261158
G2 X140.357 Y124.607 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X140.34 Y124.317 E.0044
; LINE_WIDTH: 0.267101
G2 X140.318 Y123.995 I-2.649 J.015 E.00589
; LINE_WIDTH: 0.306424
G1 X140.285 Y123.814 E.00395
; LINE_WIDTH: 0.349112
G1 X140.252 Y123.633 E.00459
; LINE_WIDTH: 0.3918
G1 X140.219 Y123.452 E.00524
G1 X140.038 Y122.822 F30000
; LINE_WIDTH: 0.141571
G1 F15000
G1 X139.886 Y122.424 E.00342
G1 X139.045 Y122.252 F30000
; LINE_WIDTH: 0.405157
G1 F15000
G1 X138.752 Y122.198 E.00881
; LINE_WIDTH: 0.389446
G1 X138.558 Y122.174 E.00551
; LINE_WIDTH: 0.342434
G1 X138.365 Y122.151 E.00476
; LINE_WIDTH: 0.257331
G2 X138.147 Y122.126 I-.317 J1.798 E.00384
G2 X137.541 Y122.127 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X137.348 Y122.151 E.00327
; LINE_WIDTH: 0.295421
G1 X137.154 Y122.174 E.00401
; LINE_WIDTH: 0.342433
G1 X136.96 Y122.198 E.00476
; LINE_WIDTH: 0.389446
G1 X136.667 Y122.252 E.00842
G1 X136.044 Y122.424 F30000
; LINE_WIDTH: 0.134453
G1 F15000
G1 X135.882 Y122.607 E.00182
; WIPE_START
G1 F24000
G1 X136.044 Y122.424 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.216 J-.047 P1  F30000
G1 X135.882 Y126.63 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.134453
G1 F15000
G1 X136.044 Y126.813 E.00182
G1 X136.667 Y126.985 F30000
; LINE_WIDTH: 0.389444
G1 F15000
G1 X136.96 Y127.039 E.00842
; LINE_WIDTH: 0.342434
G1 X137.154 Y127.063 E.00476
; LINE_WIDTH: 0.295422
G1 X137.348 Y127.086 E.00401
; LINE_WIDTH: 0.24841
G1 X137.541 Y127.11 E.00327
; LINE_WIDTH: 0.257331
G2 X138.147 Y127.111 I.315 J-4.984 E.01058
G2 X138.365 Y127.086 I-.098 J-1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X138.558 Y127.063 E.00476
; LINE_WIDTH: 0.389444
G1 X138.752 Y127.039 E.00551
; LINE_WIDTH: 0.405154
G1 X139.045 Y126.985 E.00881
G1 X112.759 Y122.569 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X111.131 Y122.569 E.05401
G1 X115.23 Y126.668 E.19231
G1 X118.807 Y126.668 E.11864
G1 X122.906 Y122.569 E.19231
G1 X126.482 Y122.569 E.11864
G1 X130.582 Y126.668 E.19231
G1 X134.158 Y126.668 E.11864
G1 X135.127 Y125.7 E.04542
G3 X135.127 Y123.537 I2.288 J-1.082 E.07414
G1 X134.158 Y122.569 E.04542
G1 X130.582 Y122.569 E.11864
G1 X126.482 Y126.668 E.19231
G1 X122.906 Y126.668 E.11864
G1 X118.807 Y122.569 E.19231
G1 X115.23 Y122.569 E.11864
G1 X111.131 Y126.668 E.19231
G1 X107.554 Y126.668 E.11864
G1 X106.586 Y125.7 E.04542
G2 X106.586 Y123.537 I-2.288 J-1.082 E.07414
G1 X107.554 Y122.569 E.04542
G1 X109.182 Y122.569 E.05401
G1 X105.83 Y122.607 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969208
G1 F15000
G1 X105.668 Y122.424 E.00107
G1 X105.045 Y122.252 F30000
; LINE_WIDTH: 0.405155
G1 F15000
G1 X104.752 Y122.198 E.00881
; LINE_WIDTH: 0.389444
G1 X104.558 Y122.174 E.00551
; LINE_WIDTH: 0.342433
G1 X104.365 Y122.151 E.00476
; LINE_WIDTH: 0.257331
G2 X104.147 Y122.126 I-.317 J1.798 E.00384
G2 X103.541 Y122.127 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X103.348 Y122.151 E.00327
; LINE_WIDTH: 0.295421
G1 X103.154 Y122.174 E.00401
; LINE_WIDTH: 0.342433
G1 X102.96 Y122.198 E.00476
; LINE_WIDTH: 0.389444
G1 X102.667 Y122.252 E.00842
G1 X101.826 Y122.424 F30000
; LINE_WIDTH: 0.151056
G1 F15000
G1 X101.675 Y122.822 E.00375
G1 X101.494 Y123.452 F30000
; LINE_WIDTH: 0.434489
G1 F15000
G1 X101.46 Y123.633 E.00588
; LINE_WIDTH: 0.391801
G1 X101.427 Y123.814 E.00524
; LINE_WIDTH: 0.349113
G1 X101.394 Y123.995 E.00459
; LINE_WIDTH: 0.306424
G1 X101.39 Y124.026 E.00068
; LINE_WIDTH: 0.298796
G1 X101.373 Y124.317 E.00607
; LINE_WIDTH: 0.261158
G2 X101.355 Y124.63 I2.576 J.302 E.00557
; LINE_WIDTH: 0.228538
G1 X101.373 Y124.92 E.0044
; LINE_WIDTH: 0.267101
G2 X101.394 Y125.242 I2.649 J-.015 E.00589
; LINE_WIDTH: 0.306424
G1 X101.427 Y125.423 E.00395
; LINE_WIDTH: 0.349112
G1 X101.46 Y125.604 E.00459
; LINE_WIDTH: 0.3918
G1 X101.494 Y125.785 E.00524
G1 X101.675 Y126.415 F30000
; LINE_WIDTH: 0.151054
G1 F15000
G1 X101.826 Y126.813 E.00375
G1 X102.667 Y126.985 F30000
; LINE_WIDTH: 0.389444
G1 F15000
G1 X102.96 Y127.039 E.00842
; LINE_WIDTH: 0.342433
G1 X103.154 Y127.063 E.00476
; LINE_WIDTH: 0.295422
G1 X103.348 Y127.086 E.00401
; LINE_WIDTH: 0.24841
G1 X103.541 Y127.11 E.00327
; LINE_WIDTH: 0.257331
G2 X104.147 Y127.111 I.315 J-4.984 E.01058
G2 X104.365 Y127.086 I-.098 J-1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X104.558 Y127.063 E.00476
; LINE_WIDTH: 0.389444
G1 X104.752 Y127.039 E.00551
; LINE_WIDTH: 0.405156
G1 X105.045 Y126.985 E.00881
G1 X105.668 Y126.813 F30000
; LINE_WIDTH: 0.096921
G1 F15000
G1 X105.83 Y126.63 E.00107
; WIPE_START
G1 F24000
G1 X105.668 Y126.813 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.376 J1.158 P1  F30000
G1 X140.15 Y138.006 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X140.022 Y138.073 E.00478
G1 X139.552 Y138.489 E.02084
G1 X139.195 Y139.007 E.02084
G1 X138.972 Y139.594 E.02084
G1 X138.896 Y140.218 E.02084
G1 X138.972 Y140.842 E.02084
G1 X139.195 Y141.429 E.02084
G1 X139.552 Y141.946 E.02084
G1 X140.022 Y142.363 E.02084
G1 X140.15 Y142.43 E.00478
G1 X140.104 Y142.616 E.00635
G1 X108.901 Y142.616 E1.03504
G1 X108.856 Y142.43 E.00635
G1 X108.983 Y142.363 E.00478
G1 X109.454 Y141.946 E.02084
G1 X109.811 Y141.429 E.02084
G1 X110.033 Y140.842 E.02084
G1 X110.109 Y140.218 E.02084
G1 X110.033 Y139.594 E.02084
G1 X109.811 Y139.007 E.02084
G1 X109.454 Y138.489 E.02084
G1 X108.983 Y138.073 E.02084
G1 X108.856 Y138.006 E.00478
G1 X108.901 Y137.82 E.00635
G1 X140.104 Y137.82 E1.03504
G1 X140.135 Y137.947 E.00436
; WIPE_START
G1 F24000
G1 X140.022 Y138.073 E-.06419
G1 X139.552 Y138.489 E-.23878
G1 X139.195 Y139.007 E-.23877
G1 X138.991 Y139.544 E-.21825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.038 J1.216 P1  F30000
G1 X143.65 Y139.689 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.714 Y140.218 E.01636
G1 X143.65 Y140.747 E.01638
G1 X143.461 Y141.246 E.01638
G1 X143.158 Y141.684 E.01638
G1 X142.759 Y142.038 E.01638
G1 X142.287 Y142.286 E.01638
G1 X141.769 Y142.413 E.01638
G1 X141.236 Y142.413 E.01638
G1 X140.719 Y142.286 E.01638
G1 X140.246 Y142.038 E.01638
G1 X139.847 Y141.684 E.01638
G1 X139.545 Y141.246 E.01638
G1 X139.355 Y140.747 E.01638
G1 X139.291 Y140.218 E.01638
G1 X139.355 Y139.689 E.01638
G1 X139.545 Y139.19 E.01638
G1 X139.847 Y138.751 E.01638
G1 X140.246 Y138.398 E.01638
G1 X140.719 Y138.15 E.01638
G1 X141.236 Y138.022 E.01638
G1 X141.769 Y138.022 E.01638
G1 X142.287 Y138.15 E.01638
G1 X142.759 Y138.398 E.01638
G1 X143.158 Y138.751 E.01638
G1 X143.461 Y139.19 E.01638
G1 X143.629 Y139.633 E.01456
M204 S10000
G1 X143.729 Y138.888 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.454 Y138.489 E.01608
G1 X142.983 Y138.073 E.02084
G1 X142.856 Y138.006 E.00478
G1 X142.901 Y137.82 E.00635
G1 X143.901 Y137.82 E.03314
G1 X143.901 Y138.835 E.03367
G1 X143.786 Y138.87 E.00397
; WIPE_START
G1 F24000
G1 X143.454 Y138.489 E-.19221
G1 X142.983 Y138.073 E-.23878
G1 X142.856 Y138.006 E-.0548
G1 X142.901 Y137.82 E-.07271
G1 X143.432 Y137.82 E-.2015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.213 J.097 P1  F30000
G1 X143.729 Y141.547 Z2
G1 Z1.6
G1 E.8 F1800
G1 F15476.087
G1 X143.901 Y141.601 E.00596
G1 X143.901 Y142.616 E.03367
G1 X142.901 Y142.616 E.03314
G1 X142.856 Y142.43 E.00635
G1 X142.983 Y142.363 E.00478
G1 X143.454 Y141.946 E.02084
G1 X143.695 Y141.597 E.01409
; WIPE_START
G1 F24000
G1 X143.901 Y141.601 E-.07817
G1 X143.901 Y142.616 E-.38568
G1 X143.121 Y142.616 E-.29616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.105 J-1.212 P1  F30000
G1 X109.653 Y139.716 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X109.682 Y139.953 E.00734
G1 X109.714 Y140.218 E.00819
G1 X109.65 Y140.747 E.01638
G1 X109.461 Y141.246 E.01638
G1 X109.158 Y141.684 E.01638
G1 X108.759 Y142.038 E.01638
G1 X108.287 Y142.286 E.01638
G1 X107.769 Y142.413 E.01638
G1 X107.236 Y142.413 E.01638
G1 X106.719 Y142.286 E.01638
G1 X106.246 Y142.038 E.01638
G1 X105.847 Y141.684 E.01638
G1 X105.545 Y141.246 E.01638
G1 X105.355 Y140.747 E.01638
G1 X105.291 Y140.218 E.01638
G1 X105.355 Y139.689 E.01638
G1 X105.545 Y139.19 E.01638
G1 X105.847 Y138.751 E.01638
G1 X106.246 Y138.398 E.01638
G1 X106.719 Y138.15 E.01638
G1 X107.236 Y138.022 E.01638
G1 X107.769 Y138.022 E.01638
G1 X108.287 Y138.15 E.01638
G1 X108.759 Y138.398 E.01638
G1 X109.158 Y138.751 E.01638
G1 X109.461 Y139.19 E.01638
G1 X109.639 Y139.658 E.01539
M204 S10000
; WIPE_START
G1 F24000
G1 X109.682 Y139.953 E-.11328
G1 X109.714 Y140.218 E-.1013
G1 X109.65 Y140.747 E-.20259
G1 X109.461 Y141.246 E-.2026
G1 X109.251 Y141.549 E-.14023
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.916 J-.802 P1  F30000
G1 X106.15 Y138.006 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X106.022 Y138.073 E.00478
G1 X105.552 Y138.489 E.02084
G1 X105.276 Y138.888 E.01608
G1 X105.105 Y138.835 E.00596
G1 X105.105 Y137.82 E.03367
G1 X106.104 Y137.82 E.03314
G1 X106.135 Y137.947 E.00436
; WIPE_START
G1 F24000
G1 X106.022 Y138.073 E-.06419
M73 P79 R2
G1 X105.552 Y138.489 E-.23878
G1 X105.276 Y138.888 E-.18419
G1 X105.105 Y138.835 E-.06829
G1 X105.105 Y138.297 E-.20454
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.18 J.298 P1  F30000
G1 X106.15 Y142.43 Z2
G1 Z1.6
G1 E.8 F1800
G1 F15476.087
G1 X106.104 Y142.616 E.00635
G1 X105.105 Y142.616 E.03314
G1 X105.105 Y141.601 E.03367
G1 X105.276 Y141.547 E.00596
G1 X105.552 Y141.946 E.01608
G1 X106.022 Y142.363 E.02084
G1 X106.097 Y142.402 E.00279
; WIPE_START
G1 F24000
G1 X106.104 Y142.616 E-.08125
G1 X105.105 Y142.616 E-.37968
G1 X105.105 Y141.829 E-.29907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.037 J1.216 P1  F30000
G1 X144.293 Y143.008 Z2
G1 Z1.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X104.713 Y143.008 E1.21618
G1 X104.713 Y137.428 E.17146
G1 X144.293 Y137.428 E1.21618
G1 X144.293 Y142.948 E.16961
M204 S10000
G1 X143.533 Y142.412 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151052
G1 F15000
G1 X143.684 Y142.015 E.00375
G1 X143.865 Y141.384 F30000
; LINE_WIDTH: 0.43449
G1 F15000
G1 X143.899 Y141.203 E.00588
; LINE_WIDTH: 0.391801
G1 X143.932 Y141.022 E.00524
; LINE_WIDTH: 0.349113
G1 X143.965 Y140.841 E.00459
; LINE_WIDTH: 0.306424
G1 X143.969 Y140.81 E.00068
; LINE_WIDTH: 0.298796
G1 X143.986 Y140.519 E.00607
; LINE_WIDTH: 0.261158
G2 X144.004 Y140.207 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X143.986 Y139.916 E.0044
; LINE_WIDTH: 0.267101
G2 X143.965 Y139.595 I-2.649 J.015 E.00589
; LINE_WIDTH: 0.306424
G1 X143.932 Y139.413 E.00395
; LINE_WIDTH: 0.349112
G1 X143.899 Y139.232 E.00459
; LINE_WIDTH: 0.3918
G1 X143.865 Y139.051 E.00524
G1 X143.684 Y138.421 F30000
; LINE_WIDTH: 0.141571
G1 F15000
G1 X143.533 Y138.023 E.00342
G1 X142.692 Y137.851 F30000
; LINE_WIDTH: 0.405157
G1 F15000
G1 X142.398 Y137.797 E.00881
; LINE_WIDTH: 0.389446
G1 X142.205 Y137.774 E.00551
; LINE_WIDTH: 0.342434
G1 X142.011 Y137.75 E.00476
; LINE_WIDTH: 0.257331
G2 X141.793 Y137.725 I-.317 J1.798 E.00384
G2 X141.188 Y137.727 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X140.994 Y137.75 E.00327
; LINE_WIDTH: 0.295421
G1 X140.801 Y137.774 E.00401
; LINE_WIDTH: 0.342433
G1 X140.607 Y137.797 E.00476
; LINE_WIDTH: 0.389446
G1 X140.314 Y137.851 E.00842
G1 X139.691 Y138.023 F30000
; LINE_WIDTH: 0.134453
G1 F15000
G1 X139.529 Y138.206 E.00182
; WIPE_START
G1 F24000
G1 X139.691 Y138.023 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.216 J-.047 P1  F30000
G1 X139.529 Y142.23 Z2
G1 Z1.6
G1 E.8 F1800
; LINE_WIDTH: 0.134453
G1 F15000
G1 X139.691 Y142.412 E.00182
G1 X140.314 Y142.585 F30000
; LINE_WIDTH: 0.389444
G1 F15000
G1 X140.607 Y142.639 E.00842
; LINE_WIDTH: 0.342434
G1 X140.801 Y142.662 E.00476
; LINE_WIDTH: 0.295422
G1 X140.994 Y142.686 E.00401
; LINE_WIDTH: 0.24841
G1 X141.188 Y142.709 E.00327
; LINE_WIDTH: 0.257331
G2 X141.793 Y142.711 I.315 J-4.984 E.01058
G2 X142.011 Y142.686 I-.098 J-1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X142.205 Y142.662 E.00476
; LINE_WIDTH: 0.389444
G1 X142.398 Y142.639 E.00551
; LINE_WIDTH: 0.405154
G1 X142.692 Y142.585 E.00881
G1 X116.405 Y138.168 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X114.777 Y138.168 E.05401
G1 X118.876 Y142.267 E.19231
G1 X122.453 Y142.267 E.11864
G1 X126.552 Y138.168 E.19231
G1 X130.129 Y138.168 E.11864
G1 X134.228 Y142.267 E.19231
G1 X137.805 Y142.267 E.11864
G1 X138.773 Y141.299 E.04542
G3 X138.773 Y139.136 I2.288 J-1.082 E.07414
G1 X137.805 Y138.168 E.04542
G1 X134.228 Y138.168 E.11864
G1 X130.129 Y142.267 E.19231
G1 X126.552 Y142.267 E.11864
G1 X122.453 Y138.168 E.19231
G1 X118.876 Y138.168 E.11864
G1 X114.777 Y142.267 E.19231
G1 X111.2 Y142.267 E.11864
G1 X110.232 Y141.299 E.04542
G2 X110.232 Y139.136 I-2.288 J-1.082 E.07414
G1 X111.2 Y138.168 E.04542
G1 X112.829 Y138.168 E.05401
G1 X109.477 Y138.206 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969208
G1 F15000
G1 X109.315 Y138.023 E.00107
G1 X108.692 Y137.851 F30000
; LINE_WIDTH: 0.405155
G1 F15000
G1 X108.398 Y137.797 E.00881
; LINE_WIDTH: 0.389444
G1 X108.205 Y137.774 E.00551
; LINE_WIDTH: 0.342433
G1 X108.011 Y137.75 E.00476
; LINE_WIDTH: 0.257331
G2 X107.793 Y137.725 I-.317 J1.798 E.00384
G2 X107.188 Y137.727 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X106.994 Y137.75 E.00327
; LINE_WIDTH: 0.295421
G1 X106.801 Y137.774 E.00401
; LINE_WIDTH: 0.342433
G1 X106.607 Y137.797 E.00476
; LINE_WIDTH: 0.389444
G1 X106.314 Y137.851 E.00842
G1 X105.473 Y138.023 F30000
; LINE_WIDTH: 0.151056
G1 F15000
G1 X105.321 Y138.421 E.00375
G1 X105.14 Y139.051 F30000
; LINE_WIDTH: 0.434489
G1 F15000
G1 X105.107 Y139.232 E.00588
; LINE_WIDTH: 0.391801
G1 X105.074 Y139.413 E.00524
; LINE_WIDTH: 0.349113
G1 X105.041 Y139.595 E.00459
; LINE_WIDTH: 0.306424
G1 X105.037 Y139.626 E.00068
; LINE_WIDTH: 0.298796
G1 X105.019 Y139.916 E.00607
; LINE_WIDTH: 0.261158
G2 X105.002 Y140.229 I2.576 J.302 E.00557
; LINE_WIDTH: 0.228538
G1 X105.019 Y140.519 E.0044
; LINE_WIDTH: 0.267101
G2 X105.041 Y140.841 I2.649 J-.015 E.00589
; LINE_WIDTH: 0.306424
G1 X105.074 Y141.022 E.00395
; LINE_WIDTH: 0.349112
G1 X105.107 Y141.203 E.00459
; LINE_WIDTH: 0.3918
G1 X105.14 Y141.384 E.00524
G1 X105.321 Y142.015 F30000
; LINE_WIDTH: 0.151054
G1 F15000
G1 X105.473 Y142.412 E.00375
G1 X106.314 Y142.585 F30000
; LINE_WIDTH: 0.389444
G1 F15000
G1 X106.607 Y142.639 E.00842
; LINE_WIDTH: 0.342433
G1 X106.801 Y142.662 E.00476
; LINE_WIDTH: 0.295422
G1 X106.994 Y142.686 E.00401
; LINE_WIDTH: 0.24841
G1 X107.188 Y142.709 E.00327
; LINE_WIDTH: 0.257331
G2 X107.793 Y142.711 I.315 J-4.984 E.01058
G2 X108.011 Y142.686 I-.098 J-1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X108.205 Y142.662 E.00476
; LINE_WIDTH: 0.389444
G1 X108.398 Y142.639 E.00551
; LINE_WIDTH: 0.405156
G1 X108.692 Y142.585 E.00881
G1 X109.315 Y142.412 F30000
; LINE_WIDTH: 0.096921
G1 F15000
G1 X109.477 Y142.23 E.00107
M106 S242.25
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.315 Y142.412 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/15
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
G3 Z2 I.973 J.731 P1  F30000
G1 X143.958 Y96.351 Z2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.956 Y96.358 E.00021
G1 X143.708 Y96.717 E.01342
G1 X143.381 Y97.007 E.01342
G1 X142.994 Y97.21 E.01342
G1 X142.57 Y97.314 E.01342
G1 X142.133 Y97.314 E.01342
G1 X141.709 Y97.21 E.01342
G1 X141.322 Y97.007 E.01342
G1 X140.996 Y96.717 E.01342
G1 X140.748 Y96.358 E.01342
G1 X140.587 Y95.903 E.01482
G1 X140.54 Y95.516 E.01198
G1 X140.593 Y95.082 E.01342
G1 X140.748 Y94.674 E.01342
G1 X140.996 Y94.315 E.01342
G1 X141.322 Y94.025 E.01342
G1 X141.709 Y93.822 E.01342
G1 X142.133 Y93.717 E.01342
G1 X142.57 Y93.717 E.01342
G1 X142.994 Y93.822 E.01342
G1 X143.381 Y94.025 E.01342
G1 X143.708 Y94.315 E.01342
G1 X143.956 Y94.674 E.01342
G1 X144.116 Y95.129 E.01482
G1 X144.163 Y95.516 E.01198
G1 X144.11 Y95.949 E.01342
G1 X143.979 Y96.295 E.01137
M204 S10000
; WIPE_START
G1 F24000
G1 X143.956 Y96.358 E-.02534
G1 X143.708 Y96.717 E-.16595
G1 X143.381 Y97.007 E-.16595
G1 X142.994 Y97.21 E-.16595
G1 X142.57 Y97.314 E-.16595
G1 X142.383 Y97.314 E-.07086
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.01 J-1.217 P1  F30000
G1 X107.335 Y97.013 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X107.322 Y97.007 E.00044
G1 X106.996 Y96.717 E.01342
G1 X106.748 Y96.358 E.01342
G1 X106.593 Y95.949 E.01342
G1 X106.54 Y95.516 E.01342
G1 X106.593 Y95.082 E.01342
G1 X106.748 Y94.674 E.01342
G1 X106.996 Y94.315 E.01342
G1 X107.322 Y94.025 E.01342
G1 X107.709 Y93.822 E.01342
G1 X108.133 Y93.717 E.01342
G1 X108.57 Y93.717 E.01342
G1 X108.994 Y93.822 E.01342
G1 X109.381 Y94.025 E.01342
G1 X109.708 Y94.315 E.01342
G1 X109.956 Y94.674 E.01342
G1 X110.116 Y95.129 E.01482
G1 X110.163 Y95.516 E.01198
G1 X110.11 Y95.949 E.01342
G1 X109.956 Y96.358 E.01342
G1 X109.708 Y96.717 E.01342
G1 X109.381 Y97.007 E.01342
G1 X109.035 Y97.188 E.01198
G1 X108.57 Y97.314 E.01482
G1 X108.133 Y97.314 E.01342
G1 X107.709 Y97.21 E.01342
G1 X107.388 Y97.041 E.01114
M204 S10000
; WIPE_START
G1 F24000
G1 X107.322 Y97.007 E-.02824
G1 X106.996 Y96.717 E-.16595
G1 X106.748 Y96.358 E-.16595
G1 X106.593 Y95.949 E-.16595
G1 X106.54 Y95.516 E-.16595
G1 X106.562 Y95.338 E-.06795
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.093 J1.213 P1  F30000
G1 X145.142 Y98.306 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X105.562 Y98.306 E1.21618
G1 X105.562 Y92.726 E.17146
G1 X145.142 Y92.726 E1.21618
G1 X145.142 Y98.246 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X143.142 Y98.249 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.078 J.565 P1  F30000
G1 X144.291 Y96.058 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X144.934 Y96.701 E.02794
G1 X144.934 Y97.234
G1 X144.145 Y96.444 E.03431
G1 X143.929 Y96.762
G1 X144.934 Y97.767 E.04369
G1 X144.732 Y98.098
G1 X143.665 Y97.032 E.04636
G1 X143.355 Y97.254
G1 X144.199 Y98.098 E.03668
G1 X143.666 Y98.098
G1 X142.991 Y97.424 E.02931
G1 X142.694 Y97.66
G1 X143.132 Y98.098 E.01903
M204 S10000
; WIPE_START
G1 F24000
G1 X142.694 Y97.66 E-.23537
G1 X142.991 Y97.424 E-.1442
G1 X143.666 Y98.098 E-.36247
G1 X143.713 Y98.098 E-.01796
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.041 J.63 P1  F30000
G1 X144.953 Y96.047 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.115505
G1 F15000
G1 X144.419 Y95.9 E.00327
G3 X144.372 Y95.916 I-.051 J-.073 E.0003
; LINE_WIDTH: 0.129425
G1 X144.304 Y95.918 E.00048
G1 X144.475 Y95.516 F30000
; LINE_WIDTH: 0.311991
G1 F15000
G1 X144.946 Y95.516 E.01032
G1 X144.475 Y95.516 F30000
; LINE_WIDTH: 0.2714
G1 F15000
G1 X144.354 Y95.409 E.00301
; WIPE_START
G1 F24000
G1 X144.475 Y95.516 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.216 J-.051 P1  F30000
G1 X144.366 Y92.933 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.934 Y93.501 E.02468
G1 X144.934 Y94.034
G1 X143.833 Y92.933 E.04785
G1 X143.3 Y92.933
G1 X144.934 Y94.568 E.07102
G1 X144.934 Y95.101
G1 X142.767 Y92.933 E.0942
M204 S10000
G1 X143.274 Y93.734 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881691
G1 F15000
G1 X143.18 Y93.665 E.00043
; LINE_WIDTH: 0.145211
G2 X142.677 Y93.332 I-2.971 J3.939 E.00503
; WIPE_START
G1 F24000
G1 X143.18 Y93.665 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.868 J.853 P1  F30000
G1 X144.659 Y95.171 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.159477
G1 F15000
G1 X144.47 Y94.994 E.00246
; LINE_WIDTH: 0.169839
G1 X144.419 Y94.973 E.00057
; LINE_WIDTH: 0.247589
G1 X144.368 Y94.953 E.00092
G1 X144.319 Y95.137 E.00319
; WIPE_START
G1 F24000
G1 X144.368 Y94.953 E-.58932
G1 X144.419 Y94.973 E-.17068
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.699 J-.996 P1  F30000
G1 X142.352 Y93.521 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.258838
G1 F15000
G1 X142.352 Y93.222 E.00527
; LINE_WIDTH: 0.305084
G1 X142.352 Y92.922 E.0064
; WIPE_START
G1 F24000
G1 X142.352 Y93.222 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.288 J-1.182 P1  F30000
G1 X141.167 Y92.933 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X141.816 Y93.582 E.0282
G1 X141.433 Y93.733
G1 X140.633 Y92.933 E.03474
G1 X140.1 Y92.933
G1 X141.106 Y93.939 E.04372
G1 X140.827 Y94.193
G1 X139.567 Y92.933 E.05476
G1 X139.034 Y92.933
G1 X140.609 Y94.509 E.06847
G1 X140.447 Y94.88
G1 X138.5 Y92.933 E.08461
G1 X137.967 Y92.933
G1 X140.355 Y95.321 E.10376
G1 X140.375 Y95.874
G1 X137.434 Y92.933 E.12779
G1 X136.901 Y92.933
G1 X141.995 Y98.027 E.22136
G1 X141.532 Y98.098
G1 X136.367 Y92.933 E.22445
G1 X135.834 Y92.933
G1 X140.999 Y98.098 E.22445
G1 X140.466 Y98.098
G1 X135.301 Y92.933 E.22445
G1 X134.767 Y92.933
G1 X139.933 Y98.098 E.22445
G1 X139.399 Y98.098
G1 X134.234 Y92.933 E.22445
G1 X133.701 Y92.933
G1 X138.866 Y98.098 E.22445
G1 X138.333 Y98.098
G1 X133.168 Y92.933 E.22445
G1 X132.634 Y92.933
G1 X137.8 Y98.098 E.22445
G1 X137.266 Y98.098
G1 X132.101 Y92.933 E.22445
G1 X131.568 Y92.933
G1 X136.733 Y98.098 E.22445
G1 X136.2 Y98.098
G1 X131.035 Y92.933 E.22445
G1 X130.501 Y92.933
G1 X135.667 Y98.098 E.22445
G1 X135.133 Y98.098
G1 X129.968 Y92.933 E.22445
G1 X129.435 Y92.933
G1 X134.6 Y98.098 E.22445
G1 X134.067 Y98.098
G1 X128.901 Y92.933 E.22445
G1 X128.368 Y92.933
G1 X133.533 Y98.098 E.22445
G1 X133 Y98.098
G1 X127.835 Y92.933 E.22445
G1 X127.302 Y92.933
G1 X132.467 Y98.098 E.22445
G1 X131.934 Y98.098
G1 X126.768 Y92.933 E.22445
G1 X126.235 Y92.933
G1 X131.4 Y98.098 E.22445
G1 X130.867 Y98.098
G1 X125.702 Y92.933 E.22445
G1 X125.169 Y92.933
G1 X130.334 Y98.098 E.22445
G1 X129.801 Y98.098
G1 X124.635 Y92.933 E.22445
G1 X124.102 Y92.933
G1 X129.267 Y98.098 E.22445
G1 X128.734 Y98.098
G1 X123.569 Y92.933 E.22445
M73 P80 R2
G1 X123.036 Y92.933
G1 X128.201 Y98.098 E.22445
G1 X127.667 Y98.098
G1 X122.502 Y92.933 E.22445
G1 X121.969 Y92.933
G1 X127.134 Y98.098 E.22445
G1 X126.601 Y98.098
G1 X121.436 Y92.933 E.22445
G1 X120.902 Y92.933
G1 X126.068 Y98.098 E.22445
G1 X125.534 Y98.098
G1 X120.369 Y92.933 E.22445
G1 X119.836 Y92.933
G1 X125.001 Y98.098 E.22445
G1 X124.468 Y98.098
G1 X119.303 Y92.933 E.22445
G1 X118.769 Y92.933
G1 X123.935 Y98.098 E.22445
G1 X123.401 Y98.098
G1 X118.236 Y92.933 E.22445
G1 X117.703 Y92.933
G1 X122.868 Y98.098 E.22445
G1 X122.335 Y98.098
G1 X117.17 Y92.933 E.22445
G1 X116.636 Y92.933
G1 X121.801 Y98.098 E.22445
G1 X121.268 Y98.098
G1 X116.103 Y92.933 E.22445
G1 X115.57 Y92.933
G1 X120.735 Y98.098 E.22445
G1 X120.202 Y98.098
G1 X115.036 Y92.933 E.22445
G1 X114.503 Y92.933
G1 X119.668 Y98.098 E.22445
G1 X119.135 Y98.098
G1 X113.97 Y92.933 E.22445
G1 X113.437 Y92.933
G1 X118.602 Y98.098 E.22445
G1 X118.069 Y98.098
G1 X112.903 Y92.933 E.22445
G1 X112.37 Y92.933
G1 X117.535 Y98.098 E.22445
G1 X117.002 Y98.098
G1 X111.837 Y92.933 E.22445
G1 X111.304 Y92.933
G1 X116.469 Y98.098 E.22445
G1 X115.936 Y98.098
G1 X110.77 Y92.933 E.22445
G1 X110.237 Y92.933
G1 X115.402 Y98.098 E.22445
G1 X114.869 Y98.098
G1 X109.704 Y92.933 E.22445
G1 X109.17 Y92.933
G1 X114.336 Y98.098 E.22445
G1 X113.802 Y98.098
G1 X108.708 Y93.004 E.22136
M204 S10000
; WIPE_START
G1 F24000
G1 X110.123 Y94.419 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.172 J.327 P1  F30000
G1 X110.329 Y95.158 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X113.269 Y98.098 E.12778
G1 X112.736 Y98.098
G1 X110.348 Y95.711 E.10375
G1 X110.256 Y96.151
G1 X112.203 Y98.098 E.08461
G1 X111.669 Y98.098
G1 X110.094 Y96.523 E.06847
G1 X109.876 Y96.838
G1 X111.136 Y98.098 E.05476
G1 X110.603 Y98.098
G1 X109.597 Y97.092 E.04372
G1 X109.27 Y97.299
G1 X110.07 Y98.098 E.03474
G1 X109.536 Y98.098
G1 X108.882 Y97.444 E.02842
M204 S10000
; WIPE_START
G1 F24000
G1 X109.536 Y98.098 E-.35152
G1 X110.07 Y98.098 E-.20264
G1 X109.687 Y97.715 E-.20584
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.18 J.297 P1  F30000
G1 X110.382 Y94.945 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.141655
G1 F15000
G1 X110.32 Y95.167 E.00185
G1 X110.428 Y95.631 F30000
; LINE_WIDTH: 0.100244
G1 F15000
G2 X110.364 Y95.482 I-1.236 J.441 E.00076
; WIPE_START
G1 F24000
G1 X110.428 Y95.631 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.897 J-.823 P1  F30000
G1 X108.75 Y97.461 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.136563
G1 F15000
G1 X108.717 Y97.545 E.00069
G1 X108.726 Y98.117 E.00436
; WIPE_START
G1 F24000
G1 X108.717 Y97.545 E-.65567
G1 X108.75 Y97.461 E-.10433
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.053 J1.216 P1  F30000
G1 X140.321 Y96.087 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.141474
G1 F15000
G1 X140.383 Y95.865 E.00185
; WIPE_START
G1 F24000
G1 X140.321 Y96.087 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.022 J.661 P1  F30000
G1 X141.95 Y93.568 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.14251
G1 F15000
G1 X141.983 Y93.483 E.00074
G1 X141.974 Y92.914 E.00462
; WIPE_START
G1 F24000
G1 X141.983 Y93.483 E-.65461
M73 P81 R2
G1 X141.95 Y93.568 E-.10539
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.211 J.123 P1  F30000
G1 X142.352 Y97.51 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.258838
G1 F15000
G1 X142.352 Y97.81 E.00527
; LINE_WIDTH: 0.305084
G1 X142.352 Y98.11 E.0064
; WIPE_START
G1 F24000
G1 X142.352 Y97.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.011 J-1.217 P1  F30000
G1 X108.352 Y98.11 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.305086
G1 F15000
G1 X108.352 Y97.81 E.0064
; LINE_WIDTH: 0.25884
G1 X108.352 Y97.51 E.00527
; WIPE_START
G1 F24000
G1 X108.352 Y97.81 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.217 J0 P1  F30000
G1 X108.352 Y93.521 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.258838
G1 F15000
G1 X108.352 Y93.222 E.00527
; LINE_WIDTH: 0.305084
G1 X108.352 Y92.922 E.0064
G1 X108.009 Y93.371 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.571 Y92.933 E.01904
G1 X107.037 Y92.933
G1 X107.712 Y93.608 E.02931
G1 X107.348 Y93.777
G1 X106.504 Y92.933 E.03668
G1 X105.971 Y92.933
G1 X107.038 Y94 E.04636
G1 X106.774 Y94.27
G1 X105.769 Y93.265 E.04369
G1 X105.769 Y93.798
G1 X106.559 Y94.587 E.03431
G1 X106.412 Y94.974
G1 X105.769 Y94.331 E.02794
G1 X105.769 Y94.864
G1 X106.341 Y95.436 E.02485
G1 X106.402 Y96.03
G1 X105.769 Y95.398 E.02749
G1 X105.769 Y95.931
G1 X107.936 Y98.098 E.09419
G1 X107.403 Y98.098
G1 X105.769 Y96.464 E.07102
G1 X105.769 Y96.997
G1 X106.87 Y98.098 E.04784
G1 X106.337 Y98.098
G1 X105.769 Y97.531 E.02467
M204 S10000
; WIPE_START
G1 F24000
G1 X106.337 Y98.098 E-.30508
G1 X106.87 Y98.098 E-.20264
G1 X106.4 Y97.629 E-.25227
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.131 J.449 P1  F30000
G1 X108.033 Y93.517 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.132127
G1 F15000
G1 X107.846 Y93.544 E.00138
G1 X107.843 Y93.476 E.00049
; WIPE_START
G1 F24000
G1 X107.846 Y93.544 E-.19899
G1 X108.033 Y93.517 E-.56101
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.317 J-1.175 P1  F30000
G1 X105.801 Y92.914 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.145369
G1 F15000
G1 X105.801 Y93.103 E.00157
G1 X105.839 Y93.194 E.00083
; WIPE_START
G1 F24000
G1 X105.801 Y93.103 E-.26191
G1 X105.801 Y92.914 E-.49809
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.104 J.513 P1  F30000
G1 X108.026 Y97.7 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.157167
G1 F15000
G1 X107.617 Y97.435 E.00454
; LINE_WIDTH: 0.151386
G1 X107.523 Y97.366 E.00103
; LINE_WIDTH: 0.119777
G1 X107.429 Y97.297 E.00073
; WIPE_START
G1 F24000
G1 X107.523 Y97.366 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.331 J1.171 P1  F30000
G1 X144.624 Y107.863 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.622 Y107.87 E.00021
G1 X144.374 Y108.229 E.01342
G1 X144.047 Y108.519 E.01342
G1 X143.66 Y108.722 E.01342
G1 X143.236 Y108.826 E.01342
G1 X142.799 Y108.826 E.01342
G1 X142.375 Y108.722 E.01342
G1 X141.989 Y108.519 E.01342
G1 X141.662 Y108.229 E.01342
G1 X141.414 Y107.87 E.01342
G1 X141.253 Y107.415 E.01482
G1 X141.206 Y107.028 E.01198
G1 X141.259 Y106.594 E.01342
G1 X141.414 Y106.186 E.01342
G1 X141.662 Y105.827 E.01342
G1 X141.989 Y105.537 E.01342
G1 X142.375 Y105.334 E.01342
G1 X142.799 Y105.23 E.01342
G1 X143.236 Y105.23 E.01342
G1 X143.66 Y105.334 E.01342
G1 X144.047 Y105.537 E.01342
G1 X144.374 Y105.827 E.01342
G1 X144.622 Y106.186 E.01342
G1 X144.782 Y106.641 E.01482
G1 X144.829 Y107.028 E.01198
G1 X144.777 Y107.461 E.01342
G1 X144.645 Y107.807 E.01137
M204 S10000
; WIPE_START
G1 F24000
G1 X144.622 Y107.87 E-.02534
G1 X144.374 Y108.229 E-.16595
G1 X144.047 Y108.519 E-.16595
G1 X143.66 Y108.722 E-.16595
G1 X143.236 Y108.826 E-.16595
G1 X143.05 Y108.826 E-.07086
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.01 J-1.217 P1  F30000
G1 X108.001 Y108.525 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X107.989 Y108.519 E.00044
G1 X107.662 Y108.229 E.01342
G1 X107.414 Y107.87 E.01342
G1 X107.259 Y107.461 E.01342
G1 X107.206 Y107.028 E.01342
G1 X107.259 Y106.594 E.01342
G1 X107.414 Y106.186 E.01342
G1 X107.662 Y105.827 E.01342
G1 X107.989 Y105.537 E.01342
G1 X108.375 Y105.334 E.01342
G1 X108.799 Y105.23 E.01342
G1 X109.236 Y105.23 E.01342
G1 X109.66 Y105.334 E.01342
G1 X110.047 Y105.537 E.01342
G1 X110.374 Y105.827 E.01342
G1 X110.622 Y106.186 E.01342
G1 X110.782 Y106.641 E.01482
G1 X110.829 Y107.028 E.01198
G1 X110.777 Y107.461 E.01342
G1 X110.622 Y107.87 E.01342
G1 X110.374 Y108.229 E.01342
G1 X110.047 Y108.519 E.01342
G1 X109.702 Y108.7 E.01198
G1 X109.236 Y108.826 E.01482
G1 X108.799 Y108.826 E.01342
G1 X108.375 Y108.722 E.01342
G1 X108.054 Y108.553 E.01114
M204 S10000
; WIPE_START
G1 F24000
G1 X107.989 Y108.519 E-.02824
G1 X107.662 Y108.229 E-.16595
G1 X107.414 Y107.87 E-.16595
G1 X107.259 Y107.461 E-.16595
G1 X107.206 Y107.028 E-.16595
G1 X107.228 Y106.85 E-.06795
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.093 J1.213 P1  F30000
G1 X145.808 Y109.818 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X106.228 Y109.818 E1.21618
G1 X106.228 Y104.238 E.17146
G1 X145.808 Y104.238 E1.21618
G1 X145.808 Y109.758 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X143.808 Y109.761 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.078 J.565 P1  F30000
G1 X144.957 Y107.57 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X145.6 Y108.213 E.02794
G1 X145.6 Y108.746
G1 X144.811 Y107.956 E.03431
G1 X144.595 Y108.274
G1 X145.6 Y109.279 E.04369
G1 X145.398 Y109.61
G1 X144.331 Y108.544 E.04636
G1 X144.021 Y108.766
G1 X144.865 Y109.61 E.03668
G1 X144.332 Y109.61
G1 X143.657 Y108.936 E.02931
G1 X143.36 Y109.172
G1 X143.798 Y109.61 E.01903
M204 S10000
; WIPE_START
G1 F24000
G1 X143.36 Y109.172 E-.23537
G1 X143.657 Y108.936 E-.1442
G1 X144.332 Y109.61 E-.36247
G1 X144.379 Y109.61 E-.01796
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.041 J.63 P1  F30000
G1 X145.619 Y107.559 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.115505
G1 F15000
G1 X145.085 Y107.412 E.00327
G3 X145.038 Y107.428 I-.051 J-.073 E.0003
; LINE_WIDTH: 0.129425
G1 X144.97 Y107.43 E.00048
G1 X145.141 Y107.028 F30000
; LINE_WIDTH: 0.2714
G1 F15000
G1 X145.02 Y106.921 E.00301
G1 X145.141 Y107.028 F30000
; LINE_WIDTH: 0.311991
G1 F15000
G1 X145.612 Y107.028 E.01032
; WIPE_START
G1 F24000
G1 X145.141 Y107.028 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.216 J-.051 P1  F30000
G1 X145.032 Y104.445 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X145.6 Y105.013 E.02468
G1 X145.6 Y105.546
G1 X144.499 Y104.445 E.04785
G1 X143.966 Y104.445
G1 X145.6 Y106.08 E.07102
G1 X145.6 Y106.613
G1 X143.433 Y104.445 E.0942
M204 S10000
G1 X143.94 Y105.246 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881691
G1 F15000
G1 X143.846 Y105.177 E.00043
; LINE_WIDTH: 0.145211
G2 X143.343 Y104.844 I-2.971 J3.939 E.00503
; WIPE_START
G1 F24000
G1 X143.846 Y105.177 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.868 J.853 P1  F30000
G1 X145.325 Y106.683 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.159477
G1 F15000
G1 X145.137 Y106.506 E.00246
; LINE_WIDTH: 0.169839
G1 X145.085 Y106.485 E.00057
; LINE_WIDTH: 0.247589
G1 X145.034 Y106.465 E.00092
G1 X144.985 Y106.65 E.00319
; WIPE_START
G1 F24000
G1 X145.034 Y106.465 E-.58932
G1 X145.085 Y106.485 E-.17068
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.699 J-.996 P1  F30000
G1 X143.018 Y105.033 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.258838
G1 F15000
G1 X143.018 Y104.734 E.00527
; LINE_WIDTH: 0.305084
G1 X143.018 Y104.434 E.0064
; WIPE_START
G1 F24000
G1 X143.018 Y104.734 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.288 J-1.182 P1  F30000
G1 X141.833 Y104.445 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X142.482 Y105.094 E.0282
G1 X142.099 Y105.245
G1 X141.3 Y104.445 E.03474
G1 X140.766 Y104.445
G1 X141.772 Y105.451 E.04372
G1 X141.493 Y105.706
G1 X140.233 Y104.445 E.05476
G1 X139.7 Y104.445
G1 X141.275 Y106.021 E.06847
G1 X141.114 Y106.392
G1 X139.166 Y104.445 E.08461
G1 X138.633 Y104.445
G1 X141.021 Y106.833 E.10376
G1 X141.041 Y107.386
G1 X138.1 Y104.445 E.12779
G1 X137.567 Y104.445
G1 X142.661 Y109.539 E.22136
G1 X142.199 Y109.61
G1 X137.033 Y104.445 E.22445
G1 X136.5 Y104.445
G1 X141.665 Y109.61 E.22445
G1 X141.132 Y109.61
G1 X135.967 Y104.445 E.22445
G1 X135.434 Y104.445
G1 X140.599 Y109.61 E.22445
G1 X140.065 Y109.61
G1 X134.9 Y104.445 E.22445
G1 X134.367 Y104.445
G1 X139.532 Y109.61 E.22445
G1 X138.999 Y109.61
G1 X133.834 Y104.445 E.22445
G1 X133.3 Y104.445
G1 X138.466 Y109.61 E.22445
G1 X137.932 Y109.61
G1 X132.767 Y104.445 E.22445
G1 X132.234 Y104.445
G1 X137.399 Y109.61 E.22445
G1 X136.866 Y109.61
G1 X131.701 Y104.445 E.22445
G1 X131.167 Y104.445
G1 X136.333 Y109.61 E.22445
G1 X135.799 Y109.61
G1 X130.634 Y104.445 E.22445
G1 X130.101 Y104.445
G1 X135.266 Y109.61 E.22445
G1 X134.733 Y109.61
G1 X129.568 Y104.445 E.22445
G1 X129.034 Y104.445
G1 X134.2 Y109.61 E.22445
G1 X133.666 Y109.61
G1 X128.501 Y104.445 E.22445
G1 X127.968 Y104.445
G1 X133.133 Y109.61 E.22445
G1 X132.6 Y109.61
G1 X127.434 Y104.445 E.22445
G1 X126.901 Y104.445
G1 X132.066 Y109.61 E.22445
G1 X131.533 Y109.61
G1 X126.368 Y104.445 E.22445
G1 X125.835 Y104.445
G1 X131 Y109.61 E.22445
G1 X130.467 Y109.61
G1 X125.301 Y104.445 E.22445
G1 X124.768 Y104.445
G1 X129.933 Y109.61 E.22445
G1 X129.4 Y109.61
G1 X124.235 Y104.445 E.22445
G1 X123.702 Y104.445
G1 X128.867 Y109.61 E.22445
M73 P82 R2
G1 X128.334 Y109.61
G1 X123.168 Y104.445 E.22445
G1 X122.635 Y104.445
G1 X127.8 Y109.61 E.22445
G1 X127.267 Y109.61
G1 X122.102 Y104.445 E.22445
G1 X121.569 Y104.445
G1 X126.734 Y109.61 E.22445
G1 X126.2 Y109.61
G1 X121.035 Y104.445 E.22445
G1 X120.502 Y104.445
G1 X125.667 Y109.61 E.22445
G1 X125.134 Y109.61
G1 X119.969 Y104.445 E.22445
G1 X119.435 Y104.445
G1 X124.601 Y109.61 E.22445
G1 X124.067 Y109.61
G1 X118.902 Y104.445 E.22445
G1 X118.369 Y104.445
G1 X123.534 Y109.61 E.22445
G1 X123.001 Y109.61
G1 X117.836 Y104.445 E.22445
G1 X117.302 Y104.445
G1 X122.468 Y109.61 E.22445
G1 X121.934 Y109.61
G1 X116.769 Y104.445 E.22445
G1 X116.236 Y104.445
G1 X121.401 Y109.61 E.22445
G1 X120.868 Y109.61
G1 X115.703 Y104.445 E.22445
G1 X115.169 Y104.445
G1 X120.334 Y109.61 E.22445
G1 X119.801 Y109.61
G1 X114.636 Y104.445 E.22445
G1 X114.103 Y104.445
G1 X119.268 Y109.61 E.22445
G1 X118.735 Y109.61
G1 X113.569 Y104.445 E.22445
G1 X113.036 Y104.445
G1 X118.201 Y109.61 E.22445
G1 X117.668 Y109.61
G1 X112.503 Y104.445 E.22445
G1 X111.97 Y104.445
G1 X117.135 Y109.61 E.22445
G1 X116.602 Y109.61
G1 X111.436 Y104.445 E.22445
G1 X110.903 Y104.445
G1 X116.068 Y109.61 E.22445
G1 X115.535 Y109.61
G1 X110.37 Y104.445 E.22445
G1 X109.837 Y104.445
G1 X115.002 Y109.61 E.22445
G1 X114.469 Y109.61
G1 X109.375 Y104.516 E.22136
M204 S10000
; WIPE_START
G1 F24000
G1 X110.789 Y105.931 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.172 J.327 P1  F30000
G1 X110.995 Y106.67 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X113.935 Y109.61 E.12778
G1 X113.402 Y109.61
G1 X111.014 Y107.223 E.10375
G1 X110.922 Y107.663
G1 X112.869 Y109.61 E.08461
G1 X112.335 Y109.61
G1 X110.76 Y108.035 E.06847
G1 X110.542 Y108.35
G1 X111.802 Y109.61 E.05476
G1 X111.269 Y109.61
G1 X110.263 Y108.604 E.04372
G1 X109.936 Y108.811
G1 X110.736 Y109.61 E.03474
G1 X110.202 Y109.61
G1 X109.548 Y108.956 E.02842
M204 S10000
; WIPE_START
G1 F24000
G1 X110.202 Y109.61 E-.35152
G1 X110.736 Y109.61 E-.20264
G1 X110.353 Y109.227 E-.20584
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.18 J.297 P1  F30000
G1 X111.049 Y106.457 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.141655
G1 F15000
G1 X110.986 Y106.679 E.00185
G1 X111.094 Y107.143 F30000
; LINE_WIDTH: 0.100244
G1 F15000
G2 X111.03 Y106.994 I-1.236 J.441 E.00076
; WIPE_START
G1 F24000
G1 X111.094 Y107.143 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.897 J-.823 P1  F30000
G1 X109.416 Y108.973 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.136563
G1 F15000
G1 X109.383 Y109.057 E.00069
G1 X109.392 Y109.629 E.00436
; WIPE_START
G1 F24000
G1 X109.383 Y109.057 E-.65567
G1 X109.416 Y108.973 E-.10433
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.053 J1.216 P1  F30000
G1 X140.987 Y107.599 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.141474
G1 F15000
G1 X141.049 Y107.377 E.00185
; WIPE_START
G1 F24000
G1 X140.987 Y107.599 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.022 J.661 P1  F30000
G1 X142.616 Y105.081 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.14251
G1 F15000
G1 X142.649 Y104.995 E.00074
G1 X142.64 Y104.426 E.00462
; WIPE_START
G1 F24000
G1 X142.649 Y104.995 E-.65461
G1 X142.616 Y105.081 E-.10539
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.211 J.123 P1  F30000
G1 X143.018 Y109.022 Z2.2
M73 P83 R2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.258838
G1 F15000
G1 X143.018 Y109.322 E.00527
; LINE_WIDTH: 0.305084
G1 X143.018 Y109.622 E.0064
; WIPE_START
G1 F24000
G1 X143.018 Y109.322 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.011 J-1.217 P1  F30000
G1 X109.018 Y109.622 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.305086
G1 F15000
G1 X109.018 Y109.322 E.0064
; LINE_WIDTH: 0.25884
G1 X109.018 Y109.022 E.00527
; WIPE_START
G1 F24000
G1 X109.018 Y109.322 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.217 J0 P1  F30000
G1 X109.018 Y105.033 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.258838
G1 F15000
G1 X109.018 Y104.734 E.00527
; LINE_WIDTH: 0.305084
G1 X109.018 Y104.434 E.0064
G1 X108.675 Y104.883 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X108.237 Y104.445 E.01904
G1 X107.703 Y104.445
G1 X108.378 Y105.12 E.02931
G1 X108.014 Y105.289
G1 X107.17 Y104.445 E.03668
G1 X106.637 Y104.445
G1 X107.704 Y105.512 E.04636
G1 X107.44 Y105.782
G1 X106.435 Y104.777 E.04369
G1 X106.435 Y105.31
G1 X107.225 Y106.099 E.03431
G1 X107.078 Y106.486
G1 X106.435 Y105.843 E.02794
G1 X106.435 Y106.376
G1 X107.007 Y106.948 E.02485
G1 X107.068 Y107.542
G1 X106.435 Y106.91 E.02749
G1 X106.435 Y107.443
G1 X108.603 Y109.61 E.09419
G1 X108.069 Y109.61
G1 X106.435 Y107.976 E.07102
G1 X106.435 Y108.509
G1 X107.536 Y109.61 E.04784
G1 X107.003 Y109.61
G1 X106.435 Y109.043 E.02467
M204 S10000
; WIPE_START
G1 F24000
G1 X107.003 Y109.61 E-.30508
G1 X107.536 Y109.61 E-.20264
G1 X107.067 Y109.141 E-.25227
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.131 J.449 P1  F30000
G1 X108.699 Y105.029 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.132127
G1 F15000
G1 X108.512 Y105.056 E.00138
G1 X108.509 Y104.988 E.00049
; WIPE_START
G1 F24000
G1 X108.512 Y105.056 E-.19899
G1 X108.699 Y105.029 E-.56101
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.317 J-1.175 P1  F30000
G1 X106.467 Y104.426 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.145369
G1 F15000
G1 X106.467 Y104.615 E.00157
G1 X106.505 Y104.706 E.00083
; WIPE_START
G1 F24000
G1 X106.467 Y104.615 E-.26191
G1 X106.467 Y104.426 E-.49809
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.104 J.513 P1  F30000
G1 X108.692 Y109.212 Z2.2
G1 Z1.8
G1 E.8 F1800
; LINE_WIDTH: 0.157167
G1 F15000
G1 X108.283 Y108.947 E.00454
; LINE_WIDTH: 0.151386
G1 X108.189 Y108.878 E.00103
; LINE_WIDTH: 0.119777
G1 X108.095 Y108.809 E.00073
; WIPE_START
G1 F24000
G1 X108.189 Y108.878 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.525 J1.098 P1  F30000
G1 X136.503 Y122.406 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X136.376 Y122.473 E.00478
G1 X135.905 Y122.89 E.02084
G1 X135.548 Y123.407 E.02084
G1 X135.325 Y123.995 E.02084
G1 X135.25 Y124.618 E.02084
G1 X135.325 Y125.242 E.02084
G1 X135.548 Y125.83 E.02084
G1 X135.905 Y126.347 E.02084
G1 X136.376 Y126.763 E.02084
G1 X136.503 Y126.831 E.00478
G1 X136.457 Y127.016 E.00635
G1 X105.255 Y127.016 E1.03504
G1 X105.209 Y126.831 E.00635
G1 X105.337 Y126.763 E.00478
G1 X105.807 Y126.347 E.02084
G1 X106.164 Y125.83 E.02084
G1 X106.387 Y125.242 E.02084
G1 X106.463 Y124.618 E.02084
G1 X106.387 Y123.995 E.02084
G1 X106.164 Y123.407 E.02084
G1 X105.807 Y122.89 E.02084
G1 X105.337 Y122.473 E.02084
G1 X105.209 Y122.406 E.00478
G1 X105.255 Y122.22 E.00635
G1 X136.457 Y122.22 E1.03504
G1 X136.489 Y122.348 E.00436
; WIPE_START
G1 F24000
G1 X136.376 Y122.473 E-.06419
G1 X135.905 Y122.89 E-.23878
G1 X135.548 Y123.407 E-.23877
G1 X135.345 Y123.944 E-.21825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.038 J1.216 P1  F30000
G1 X140.004 Y124.09 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X140.068 Y124.618 E.01637
G1 X140.003 Y125.148 E.01638
G1 X139.814 Y125.646 E.01638
G1 X139.512 Y126.085 E.01638
G1 X139.112 Y126.438 E.01638
G1 X138.64 Y126.686 E.01638
G1 X138.123 Y126.814 E.01638
G1 X137.59 Y126.814 E.01638
G1 X137.072 Y126.686 E.01638
G1 X136.6 Y126.438 E.01638
G1 X136.201 Y126.085 E.01638
G1 X135.898 Y125.646 E.01638
G1 X135.709 Y125.148 E.01638
G1 X135.645 Y124.618 E.01638
G1 X135.709 Y124.089 E.01638
G1 X135.898 Y123.591 E.01638
G1 X136.201 Y123.152 E.01638
G1 X136.6 Y122.798 E.01638
G1 X137.072 Y122.551 E.01638
G1 X137.59 Y122.423 E.01638
G1 X138.123 Y122.423 E.01638
G1 X138.64 Y122.551 E.01638
G1 X139.112 Y122.798 E.01638
G1 X139.512 Y123.152 E.01638
G1 X139.814 Y123.591 E.01638
G1 X139.982 Y124.033 E.01455
M204 S10000
G1 X140.083 Y123.289 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.807 Y122.89 E.01608
G1 X139.337 Y122.473 E.02084
G1 X139.209 Y122.406 E.00478
G1 X139.255 Y122.22 E.00635
G1 X140.254 Y122.22 E.03314
G1 X140.254 Y123.235 E.03367
G1 X140.14 Y123.271 E.00397
; WIPE_START
G1 F24000
G1 X139.807 Y122.89 E-.19221
G1 X139.337 Y122.473 E-.23878
G1 X139.209 Y122.406 E-.0548
G1 X139.255 Y122.22 E-.07271
G1 X139.785 Y122.22 E-.2015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.213 J.097 P1  F30000
G1 X140.083 Y125.948 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F15476.087
G1 X140.254 Y126.001 E.00596
G1 X140.254 Y127.016 E.03367
G1 X139.255 Y127.016 E.03314
G1 X139.209 Y126.831 E.00635
G1 X139.337 Y126.763 E.00478
G1 X139.807 Y126.347 E.02084
G1 X140.048 Y125.997 E.01409
; WIPE_START
G1 F24000
G1 X140.254 Y126.001 E-.07817
G1 X140.254 Y127.016 E-.38568
G1 X139.475 Y127.016 E-.29616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.105 J-1.212 P1  F30000
G1 X106.006 Y124.107 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.068 Y124.618 E.01581
G1 X106.003 Y125.148 E.01638
G1 X105.814 Y125.646 E.01638
G1 X105.512 Y126.085 E.01638
G1 X105.112 Y126.438 E.01638
G1 X104.64 Y126.686 E.01638
G1 X104.123 Y126.814 E.01638
G1 X103.59 Y126.814 E.01638
G1 X103.072 Y126.686 E.01638
G1 X102.6 Y126.438 E.01638
G1 X102.201 Y126.085 E.01638
G1 X101.898 Y125.646 E.01638
G1 X101.709 Y125.148 E.01638
G1 X101.645 Y124.618 E.01638
G1 X101.709 Y124.089 E.01638
G1 X101.898 Y123.591 E.01638
G1 X102.201 Y123.152 E.01638
G1 X102.6 Y122.798 E.01638
G1 X103.072 Y122.551 E.01638
G1 X103.59 Y122.423 E.01638
G1 X104.123 Y122.423 E.01638
G1 X104.64 Y122.551 E.01638
G1 X105.112 Y122.798 E.01638
G1 X105.336 Y122.996 E.00918
G1 X105.512 Y123.152 E.0072
G1 X105.814 Y123.591 E.01638
G1 X105.989 Y124.05 E.01511
M204 S10000
; WIPE_START
G1 F24000
G1 X106.068 Y124.618 E-.21794
G1 X106.003 Y125.148 E-.20259
G1 X105.814 Y125.646 E-.2026
G1 X105.61 Y125.943 E-.13687
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.914 J-.803 P1  F30000
G1 X102.503 Y122.406 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X102.376 Y122.473 E.00478
G1 X101.905 Y122.89 E.02084
G1 X101.63 Y123.289 E.01608
G1 X101.458 Y123.235 E.00596
G1 X101.458 Y122.22 E.03367
G1 X102.457 Y122.22 E.03314
G1 X102.489 Y122.348 E.00436
; WIPE_START
G1 F24000
G1 X102.376 Y122.473 E-.06419
G1 X101.905 Y122.89 E-.23878
G1 X101.63 Y123.289 E-.18419
G1 X101.458 Y123.235 E-.06829
G1 X101.458 Y122.697 E-.20454
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.18 J.298 P1  F30000
G1 X102.503 Y126.831 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F15476.087
G1 X102.457 Y127.016 E.00635
G1 X101.458 Y127.016 E.03314
G1 X101.458 Y126.001 E.03367
G1 X101.63 Y125.948 E.00596
G1 X101.905 Y126.347 E.01608
G1 X102.376 Y126.763 E.02084
G1 X102.45 Y126.803 E.00279
; WIPE_START
G1 F24000
G1 X102.457 Y127.016 E-.08125
G1 X101.458 Y127.016 E-.37968
G1 X101.458 Y126.229 E-.29907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.037 J1.216 P1  F30000
G1 X140.646 Y127.408 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X101.066 Y127.408 E1.21618
G1 X101.066 Y121.828 E.17146
G1 X140.646 Y121.828 E1.21618
G1 X140.646 Y127.348 E.16961
M204 S10000
G1 X139.886 Y126.813 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151056
G1 F15000
G1 X140.038 Y126.415 E.00375
G1 X140.219 Y125.785 F30000
; LINE_WIDTH: 0.434489
G1 F15000
G1 X140.252 Y125.604 E.00588
; LINE_WIDTH: 0.391801
G1 X140.285 Y125.423 E.00524
; LINE_WIDTH: 0.349112
G1 X140.318 Y125.242 E.00459
; LINE_WIDTH: 0.306424
G1 X140.322 Y125.21 E.00068
; LINE_WIDTH: 0.298796
G1 X140.34 Y124.92 E.00607
; LINE_WIDTH: 0.261158
G2 X140.357 Y124.607 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X140.34 Y124.317 E.0044
; LINE_WIDTH: 0.267101
G2 X140.318 Y123.995 I-2.649 J.015 E.00589
; LINE_WIDTH: 0.306424
G1 X140.285 Y123.814 E.00395
; LINE_WIDTH: 0.349112
G1 X140.252 Y123.633 E.00459
; LINE_WIDTH: 0.3918
G1 X140.219 Y123.452 E.00524
G1 X140.038 Y122.822 F30000
; LINE_WIDTH: 0.141574
G1 F15000
G1 X139.886 Y122.424 E.00342
G1 X139.045 Y122.252 F30000
; LINE_WIDTH: 0.405155
G1 F15000
G1 X138.752 Y122.198 E.00881
; LINE_WIDTH: 0.389444
G1 X138.558 Y122.174 E.00551
; LINE_WIDTH: 0.342433
G1 X138.365 Y122.151 E.00476
; LINE_WIDTH: 0.257331
G2 X138.147 Y122.126 I-.316 J1.798 E.00384
G2 X137.541 Y122.127 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X137.348 Y122.151 E.00327
; LINE_WIDTH: 0.295421
G1 X137.154 Y122.174 E.00401
; LINE_WIDTH: 0.342433
G1 X136.96 Y122.198 E.00476
; LINE_WIDTH: 0.389446
G1 X136.667 Y122.252 E.00842
G1 X136.044 Y122.424 F30000
; LINE_WIDTH: 0.13445
G1 F15000
G1 X135.882 Y122.606 E.00182
G1 X135.34 Y122.592 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X135.449 Y122.688 E.0048
G1 X135.229 Y123.267 E.02056
G2 X135.229 Y125.97 I2.593 J1.351 E.09319
G1 X135.449 Y126.549 E.02056
G1 X135.361 Y126.668 E.0049
G1 X106.327 Y126.668 E.96312
G1 X106.358 Y126.633 E.00157
G1 X106.264 Y126.549 E.00417
G1 X106.746 Y125.173 E.04838
G2 X106.484 Y123.267 I-3.137 J-.539 E.06483
G1 X106.264 Y122.688 E.02056
G1 X106.358 Y122.604 E.00417
G1 X106.327 Y122.569 E.00157
G1 X135.331 Y122.569 E.96214
; WIPE_START
G1 F24000
G1 X133.331 Y122.569 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.744 J.963 P1  F30000
G1 X139.045 Y126.985 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.405154
G1 F15000
G1 X138.752 Y127.039 E.00881
; LINE_WIDTH: 0.389442
G1 X138.558 Y127.063 E.00551
; LINE_WIDTH: 0.342432
G1 X138.365 Y127.086 E.00476
; LINE_WIDTH: 0.257331
G3 X138.147 Y127.111 I-.316 J-1.798 E.00384
G3 X137.541 Y127.11 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X137.348 Y127.086 E.00327
; LINE_WIDTH: 0.295422
G1 X137.154 Y127.063 E.00401
; LINE_WIDTH: 0.342433
G1 X136.96 Y127.039 E.00476
; LINE_WIDTH: 0.389444
G1 X136.667 Y126.985 E.00842
G1 X136.044 Y126.813 F30000
; LINE_WIDTH: 0.134452
G1 F15000
G1 X135.882 Y126.63 E.00182
G1 X132.937 Y126.261 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X134.566 Y126.261 E.05401
G1 X134.811 Y126.016 E.01151
G3 X134.811 Y123.221 I2.792 J-1.397 E.09611
G1 X134.566 Y122.976 E.01151
G1 X130.175 Y122.976 E.14565
G1 X126.89 Y126.261 E.15411
G1 X130.175 Y126.261 E.10897
G1 X126.89 Y122.976 E.15411
G1 X122.499 Y122.976 E.14565
G1 X119.214 Y126.261 E.15411
G1 X122.499 Y126.261 E.10897
G1 X119.214 Y122.976 E.15411
G1 X117.585 Y122.976 E.05401
G1 X116.451 Y126.261 F30000
G1 F15476.087
G1 X114.823 Y126.261 E.05401
G1 X111.538 Y122.976 E.15411
G1 X114.823 Y122.976 E.10897
G1 X111.538 Y126.261 E.15411
G1 X107.147 Y126.261 E.14565
G1 X106.901 Y126.016 E.01151
G2 X106.901 Y123.221 I-3.117 J-1.397 E.0955
G1 X107.147 Y122.976 E.01151
G1 X108.775 Y122.976 E.05401
G1 X105.83 Y122.607 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969209
G1 F15000
G1 X105.668 Y122.424 E.00107
G1 X105.045 Y122.252 F30000
; LINE_WIDTH: 0.405155
G1 F15000
G1 X104.752 Y122.198 E.00881
; LINE_WIDTH: 0.389444
G1 X104.558 Y122.174 E.00551
; LINE_WIDTH: 0.342433
G1 X104.365 Y122.151 E.00476
; LINE_WIDTH: 0.257331
G2 X104.147 Y122.126 I-.317 J1.798 E.00384
G2 X103.541 Y122.127 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X103.348 Y122.151 E.00327
; LINE_WIDTH: 0.295421
G1 X103.154 Y122.174 E.00401
; LINE_WIDTH: 0.342433
G1 X102.96 Y122.198 E.00476
; LINE_WIDTH: 0.389444
G1 X102.667 Y122.252 E.00842
G1 X101.826 Y122.424 F30000
; LINE_WIDTH: 0.151056
G1 F15000
G1 X101.675 Y122.822 E.00375
G1 X101.494 Y123.452 F30000
; LINE_WIDTH: 0.434489
G1 F15000
G1 X101.46 Y123.633 E.00588
; LINE_WIDTH: 0.391801
G1 X101.427 Y123.814 E.00524
; LINE_WIDTH: 0.349113
G1 X101.394 Y123.995 E.00459
; LINE_WIDTH: 0.306424
G1 X101.39 Y124.026 E.00068
; LINE_WIDTH: 0.298796
G1 X101.373 Y124.317 E.00607
; LINE_WIDTH: 0.261158
G2 X101.355 Y124.63 I2.576 J.302 E.00557
; LINE_WIDTH: 0.228538
G1 X101.373 Y124.92 E.0044
; LINE_WIDTH: 0.267101
G2 X101.394 Y125.242 I2.649 J-.015 E.00589
; LINE_WIDTH: 0.306424
G1 X101.427 Y125.423 E.00395
; LINE_WIDTH: 0.349112
G1 X101.46 Y125.604 E.00459
; LINE_WIDTH: 0.3918
G1 X101.494 Y125.785 E.00524
G1 X101.675 Y126.415 F30000
; LINE_WIDTH: 0.151054
G1 F15000
M73 P84 R2
G1 X101.826 Y126.813 E.00375
G1 X102.667 Y126.985 F30000
; LINE_WIDTH: 0.389442
G1 F15000
G1 X102.96 Y127.039 E.00842
; LINE_WIDTH: 0.342433
G1 X103.154 Y127.063 E.00476
; LINE_WIDTH: 0.295422
G1 X103.348 Y127.086 E.00401
; LINE_WIDTH: 0.24841
G1 X103.541 Y127.11 E.00327
; LINE_WIDTH: 0.257331
G2 X104.147 Y127.111 I.315 J-4.984 E.01058
G2 X104.365 Y127.086 I-.098 J-1.823 E.00384
; LINE_WIDTH: 0.342432
G1 X104.558 Y127.063 E.00476
; LINE_WIDTH: 0.389442
G1 X104.752 Y127.039 E.00551
; LINE_WIDTH: 0.405154
G1 X105.045 Y126.985 E.00881
G1 X105.668 Y126.813 F30000
; LINE_WIDTH: 0.096921
G1 F15000
G1 X105.83 Y126.63 E.00107
; WIPE_START
G1 F24000
G1 X105.668 Y126.813 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.376 J1.158 P1  F30000
G1 X140.15 Y138.006 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X140.022 Y138.073 E.00478
G1 X139.552 Y138.489 E.02084
G1 X139.195 Y139.007 E.02084
G1 X138.972 Y139.594 E.02084
G1 X138.896 Y140.218 E.02084
G1 X138.972 Y140.842 E.02084
G1 X139.195 Y141.429 E.02084
G1 X139.552 Y141.946 E.02084
G1 X140.022 Y142.363 E.02084
G1 X140.15 Y142.43 E.00478
G1 X140.104 Y142.616 E.00635
G1 X108.901 Y142.616 E1.03504
G1 X108.856 Y142.43 E.00635
G1 X108.983 Y142.363 E.00478
G1 X109.454 Y141.946 E.02084
G1 X109.811 Y141.429 E.02084
G1 X110.033 Y140.842 E.02084
G1 X110.109 Y140.218 E.02084
G1 X110.033 Y139.594 E.02084
G1 X109.811 Y139.007 E.02084
G1 X109.454 Y138.489 E.02084
G1 X108.983 Y138.073 E.02084
G1 X108.856 Y138.006 E.00478
G1 X108.901 Y137.82 E.00635
G1 X140.104 Y137.82 E1.03504
G1 X140.135 Y137.947 E.00436
; WIPE_START
G1 F24000
G1 X140.022 Y138.073 E-.06419
G1 X139.552 Y138.489 E-.23878
G1 X139.195 Y139.007 E-.23877
G1 X138.991 Y139.544 E-.21825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.038 J1.216 P1  F30000
G1 X143.65 Y139.689 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.714 Y140.218 E.01637
G1 X143.65 Y140.747 E.01638
G1 X143.461 Y141.246 E.01638
G1 X143.158 Y141.684 E.01638
G1 X142.759 Y142.038 E.01638
G1 X142.287 Y142.286 E.01638
G1 X141.769 Y142.413 E.01638
G1 X141.236 Y142.413 E.01638
G1 X140.719 Y142.286 E.01638
G1 X140.246 Y142.038 E.01638
G1 X139.847 Y141.684 E.01638
G1 X139.545 Y141.246 E.01638
G1 X139.355 Y140.747 E.01638
G1 X139.291 Y140.218 E.01638
G1 X139.355 Y139.689 E.01638
G1 X139.545 Y139.19 E.01638
G1 X139.847 Y138.751 E.01638
G1 X140.246 Y138.398 E.01638
G1 X140.719 Y138.15 E.01638
G1 X141.236 Y138.022 E.01638
G1 X141.769 Y138.022 E.01638
G1 X142.287 Y138.15 E.01638
G1 X142.759 Y138.398 E.01638
G1 X143.158 Y138.751 E.01638
G1 X143.461 Y139.19 E.01638
G1 X143.629 Y139.633 E.01455
M204 S10000
G1 X143.729 Y138.888 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.454 Y138.489 E.01608
G1 X142.983 Y138.073 E.02084
G1 X142.856 Y138.006 E.00478
G1 X142.901 Y137.82 E.00635
G1 X143.901 Y137.82 E.03314
G1 X143.901 Y138.835 E.03367
G1 X143.786 Y138.87 E.00397
; WIPE_START
G1 F24000
G1 X143.454 Y138.489 E-.19221
G1 X142.983 Y138.073 E-.23878
G1 X142.856 Y138.006 E-.0548
G1 X142.901 Y137.82 E-.07271
G1 X143.432 Y137.82 E-.2015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.213 J.097 P1  F30000
G1 X143.729 Y141.547 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F15476.087
G1 X143.901 Y141.601 E.00596
G1 X143.901 Y142.616 E.03367
G1 X142.901 Y142.616 E.03314
G1 X142.856 Y142.43 E.00635
G1 X142.983 Y142.363 E.00478
G1 X143.454 Y141.946 E.02084
G1 X143.695 Y141.597 E.01409
; WIPE_START
G1 F24000
G1 X143.901 Y141.601 E-.07817
G1 X143.901 Y142.616 E-.38568
G1 X143.121 Y142.616 E-.29616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.105 J-1.212 P1  F30000
G1 X109.652 Y139.707 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X109.714 Y140.218 E.01581
G1 X109.65 Y140.747 E.01638
G1 X109.461 Y141.246 E.01638
G1 X109.158 Y141.684 E.01638
G1 X108.759 Y142.038 E.01638
G1 X108.287 Y142.286 E.01638
G1 X107.769 Y142.413 E.01638
G1 X107.236 Y142.413 E.01638
G1 X106.719 Y142.286 E.01638
G1 X106.246 Y142.038 E.01638
G1 X105.847 Y141.684 E.01638
G1 X105.545 Y141.246 E.01638
G1 X105.355 Y140.747 E.01638
G1 X105.291 Y140.218 E.01638
G1 X105.355 Y139.689 E.01638
G1 X105.545 Y139.19 E.01638
G1 X105.847 Y138.751 E.01638
G1 X106.246 Y138.398 E.01638
G1 X106.719 Y138.15 E.01638
G1 X107.236 Y138.022 E.01638
G1 X107.769 Y138.022 E.01638
G1 X108.287 Y138.15 E.01638
G1 X108.759 Y138.398 E.01638
G1 X108.983 Y138.596 E.00918
G1 X109.158 Y138.751 E.0072
G1 X109.461 Y139.19 E.01638
G1 X109.635 Y139.65 E.01511
M204 S10000
; WIPE_START
G1 F24000
G1 X109.714 Y140.218 E-.21794
G1 X109.65 Y140.747 E-.20259
G1 X109.461 Y141.246 E-.2026
G1 X109.256 Y141.542 E-.13687
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.914 J-.803 P1  F30000
G1 X106.15 Y138.006 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X106.022 Y138.073 E.00478
G1 X105.552 Y138.489 E.02084
G1 X105.276 Y138.888 E.01608
G1 X105.105 Y138.835 E.00596
G1 X105.105 Y137.82 E.03367
G1 X106.104 Y137.82 E.03314
G1 X106.135 Y137.947 E.00436
; WIPE_START
G1 F24000
G1 X106.022 Y138.073 E-.06419
G1 X105.552 Y138.489 E-.23878
G1 X105.276 Y138.888 E-.18419
G1 X105.105 Y138.835 E-.06829
G1 X105.105 Y138.297 E-.20454
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.18 J.298 P1  F30000
G1 X106.15 Y142.43 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F15476.087
G1 X106.104 Y142.616 E.00635
G1 X105.105 Y142.616 E.03314
G1 X105.105 Y141.601 E.03367
G1 X105.276 Y141.547 E.00596
G1 X105.552 Y141.946 E.01608
G1 X106.022 Y142.363 E.02084
G1 X106.097 Y142.402 E.00279
; WIPE_START
G1 F24000
G1 X106.104 Y142.616 E-.08125
G1 X105.105 Y142.616 E-.37968
G1 X105.105 Y141.829 E-.29907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.037 J1.216 P1  F30000
G1 X144.293 Y143.008 Z2.2
G1 Z1.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X104.713 Y143.008 E1.21618
G1 X104.713 Y137.428 E.17146
G1 X144.293 Y137.428 E1.21618
G1 X144.293 Y142.948 E.16961
M204 S10000
G1 X143.533 Y142.412 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151056
G1 F15000
G1 X143.684 Y142.015 E.00375
G1 X143.865 Y141.384 F30000
; LINE_WIDTH: 0.434489
G1 F15000
G1 X143.899 Y141.203 E.00588
; LINE_WIDTH: 0.391801
G1 X143.932 Y141.022 E.00524
; LINE_WIDTH: 0.349112
G1 X143.965 Y140.841 E.00459
; LINE_WIDTH: 0.306424
G1 X143.969 Y140.81 E.00068
; LINE_WIDTH: 0.298796
G1 X143.986 Y140.519 E.00607
; LINE_WIDTH: 0.261158
G2 X144.004 Y140.207 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X143.986 Y139.916 E.0044
; LINE_WIDTH: 0.267101
G2 X143.965 Y139.595 I-2.649 J.015 E.00589
; LINE_WIDTH: 0.306424
G1 X143.932 Y139.413 E.00395
; LINE_WIDTH: 0.349112
G1 X143.899 Y139.232 E.00459
; LINE_WIDTH: 0.3918
G1 X143.865 Y139.051 E.00524
G1 X143.684 Y138.421 F30000
; LINE_WIDTH: 0.141574
G1 F15000
G1 X143.533 Y138.023 E.00342
G1 X142.692 Y137.851 F30000
; LINE_WIDTH: 0.405155
G1 F15000
G1 X142.398 Y137.797 E.00881
; LINE_WIDTH: 0.389444
G1 X142.205 Y137.774 E.00551
; LINE_WIDTH: 0.342433
G1 X142.011 Y137.75 E.00476
; LINE_WIDTH: 0.257331
G2 X141.793 Y137.725 I-.316 J1.798 E.00384
G2 X141.188 Y137.727 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X140.994 Y137.75 E.00327
; LINE_WIDTH: 0.295421
G1 X140.801 Y137.774 E.00401
; LINE_WIDTH: 0.342433
G1 X140.607 Y137.797 E.00476
; LINE_WIDTH: 0.389446
G1 X140.314 Y137.851 E.00842
G1 X139.691 Y138.023 F30000
; LINE_WIDTH: 0.13445
G1 F15000
G1 X139.529 Y138.206 E.00182
G1 X138.987 Y138.191 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.095 Y138.287 E.0048
G1 X138.875 Y138.867 E.02056
G2 X138.875 Y141.569 I2.593 J1.351 E.09319
G1 X139.095 Y142.149 E.02056
G1 X139.007 Y142.267 E.0049
G1 X109.973 Y142.267 E.96312
G1 X110.004 Y142.232 E.00157
G1 X109.91 Y142.149 E.00417
G1 X110.393 Y140.772 E.04838
G2 X110.13 Y138.867 I-3.137 J-.539 E.06483
G1 X109.91 Y138.287 E.02056
G1 X110.004 Y138.204 E.00417
G1 X109.973 Y138.168 E.00157
G1 X138.978 Y138.168 E.96214
; WIPE_START
G1 F24000
G1 X136.978 Y138.168 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.744 J.963 P1  F30000
G1 X142.692 Y142.585 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.405154
G1 F15000
G1 X142.398 Y142.639 E.00881
; LINE_WIDTH: 0.389442
G1 X142.205 Y142.662 E.00551
; LINE_WIDTH: 0.342432
G1 X142.011 Y142.686 E.00476
; LINE_WIDTH: 0.257331
G3 X141.793 Y142.711 I-.316 J-1.798 E.00384
G3 X141.188 Y142.709 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X140.994 Y142.686 E.00327
; LINE_WIDTH: 0.295422
G1 X140.801 Y142.662 E.00401
; LINE_WIDTH: 0.342433
G1 X140.607 Y142.639 E.00476
; LINE_WIDTH: 0.389444
G1 X140.314 Y142.585 E.00842
G1 X139.691 Y142.412 F30000
; LINE_WIDTH: 0.134452
G1 F15000
G1 X139.529 Y142.23 E.00182
G1 X136.584 Y141.86 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X138.212 Y141.86 E.05401
G1 X138.457 Y141.615 E.01151
G3 X138.457 Y138.821 I2.792 J-1.397 E.09611
G1 X138.212 Y138.575 E.01151
G1 X133.821 Y138.575 E.14565
G1 X130.536 Y141.86 E.15411
G1 X133.821 Y141.86 E.10897
G1 X130.536 Y138.575 E.15411
G1 X126.145 Y138.575 E.14565
G1 X122.86 Y141.86 E.15411
G1 X126.145 Y141.86 E.10897
G1 X122.86 Y138.575 E.15411
G1 X121.232 Y138.575 E.05401
G1 X120.098 Y141.86 F30000
G1 F15476.087
G1 X118.469 Y141.86 E.05401
G1 X115.184 Y138.575 E.15411
G1 X118.469 Y138.575 E.10897
G1 X115.184 Y141.86 E.15411
G1 X110.793 Y141.86 E.14565
G1 X110.548 Y141.615 E.01151
G2 X110.548 Y138.821 I-3.117 J-1.397 E.0955
G1 X110.793 Y138.575 E.01151
G1 X112.422 Y138.575 E.05401
G1 X109.477 Y138.206 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969209
G1 F15000
G1 X109.315 Y138.023 E.00107
G1 X108.692 Y137.851 F30000
; LINE_WIDTH: 0.405155
G1 F15000
G1 X108.398 Y137.797 E.00881
; LINE_WIDTH: 0.389444
G1 X108.205 Y137.774 E.00551
; LINE_WIDTH: 0.342433
G1 X108.011 Y137.75 E.00476
; LINE_WIDTH: 0.257331
G2 X107.793 Y137.725 I-.317 J1.798 E.00384
G2 X107.188 Y137.727 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X106.994 Y137.75 E.00327
; LINE_WIDTH: 0.295421
G1 X106.801 Y137.774 E.00401
; LINE_WIDTH: 0.342433
G1 X106.607 Y137.797 E.00476
; LINE_WIDTH: 0.389444
G1 X106.314 Y137.851 E.00842
G1 X105.473 Y138.023 F30000
; LINE_WIDTH: 0.151056
G1 F15000
G1 X105.321 Y138.421 E.00375
G1 X105.14 Y139.051 F30000
; LINE_WIDTH: 0.434489
G1 F15000
G1 X105.107 Y139.232 E.00588
; LINE_WIDTH: 0.391801
G1 X105.074 Y139.413 E.00524
; LINE_WIDTH: 0.349113
G1 X105.041 Y139.595 E.00459
; LINE_WIDTH: 0.306424
G1 X105.037 Y139.626 E.00068
; LINE_WIDTH: 0.298796
G1 X105.019 Y139.916 E.00607
; LINE_WIDTH: 0.261158
G2 X105.002 Y140.229 I2.576 J.302 E.00557
; LINE_WIDTH: 0.228538
G1 X105.019 Y140.519 E.0044
; LINE_WIDTH: 0.267101
G2 X105.041 Y140.841 I2.649 J-.015 E.00589
; LINE_WIDTH: 0.306424
G1 X105.074 Y141.022 E.00395
; LINE_WIDTH: 0.349112
G1 X105.107 Y141.203 E.00459
; LINE_WIDTH: 0.3918
G1 X105.14 Y141.384 E.00524
G1 X105.321 Y142.015 F30000
; LINE_WIDTH: 0.151054
G1 F15000
G1 X105.473 Y142.412 E.00375
G1 X106.314 Y142.585 F30000
; LINE_WIDTH: 0.389442
G1 F15000
G1 X106.607 Y142.639 E.00842
; LINE_WIDTH: 0.342433
G1 X106.801 Y142.662 E.00476
; LINE_WIDTH: 0.295422
G1 X106.994 Y142.686 E.00401
; LINE_WIDTH: 0.24841
G1 X107.188 Y142.709 E.00327
; LINE_WIDTH: 0.257331
G2 X107.793 Y142.711 I.315 J-4.984 E.01058
G2 X108.011 Y142.686 I-.098 J-1.823 E.00384
; LINE_WIDTH: 0.342432
G1 X108.205 Y142.662 E.00476
; LINE_WIDTH: 0.389442
G1 X108.398 Y142.639 E.00551
; LINE_WIDTH: 0.405154
G1 X108.692 Y142.585 E.00881
G1 X109.315 Y142.412 F30000
; LINE_WIDTH: 0.096921
G1 F15000
G1 X109.477 Y142.23 E.00107
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.315 Y142.412 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/15
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
G3 Z2.2 I.721 J.98 P1  F30000
G1 X136.503 Y122.406 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6549
G1 X136.376 Y122.473 E.00478
G1 X135.905 Y122.89 E.02084
G1 X135.548 Y123.407 E.02084
G1 X135.325 Y123.995 E.02084
G1 X135.25 Y124.618 E.02084
G1 X135.325 Y125.242 E.02084
G1 X135.548 Y125.83 E.02084
G1 X135.905 Y126.347 E.02084
G1 X136.376 Y126.763 E.02084
G1 X136.503 Y126.831 E.00478
G1 X136.457 Y127.016 E.00635
G1 X105.255 Y127.016 E1.03504
G1 X105.209 Y126.831 E.00635
G1 X105.337 Y126.763 E.00478
G1 X105.807 Y126.347 E.02084
G1 X106.164 Y125.83 E.02084
G1 X106.387 Y125.242 E.02084
G1 X106.463 Y124.618 E.02084
G1 X106.387 Y123.995 E.02084
G1 X106.164 Y123.407 E.02084
G1 X105.807 Y122.89 E.02084
G1 X105.337 Y122.473 E.02084
G1 X105.209 Y122.406 E.00478
G1 X105.255 Y122.22 E.00635
G1 X136.457 Y122.22 E1.03504
G1 X136.489 Y122.348 E.00436
; WIPE_START
G1 F24000
G1 X136.376 Y122.473 E-.06419
G1 X135.905 Y122.89 E-.23878
G1 X135.548 Y123.407 E-.23877
G1 X135.345 Y123.944 E-.21825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.038 J1.216 P1  F30000
G1 X140.003 Y124.089 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6549
G1 X140.068 Y124.618 E.01638
G1 X140.003 Y125.148 E.01638
G1 X139.814 Y125.646 E.01638
G1 X139.512 Y126.085 E.01638
G1 X139.112 Y126.438 E.01638
G1 X138.64 Y126.686 E.01638
G1 X138.123 Y126.814 E.01638
G1 X137.59 Y126.814 E.01638
G1 X137.072 Y126.686 E.01638
G1 X136.6 Y126.438 E.01638
G1 X136.201 Y126.085 E.01638
G1 X135.898 Y125.646 E.01638
G1 X135.709 Y125.148 E.01638
G1 X135.645 Y124.618 E.01638
G1 X135.709 Y124.089 E.01638
G1 X135.898 Y123.591 E.01638
G1 X136.201 Y123.152 E.01638
G1 X136.6 Y122.798 E.01638
G1 X137.072 Y122.551 E.01638
G1 X137.59 Y122.423 E.01638
G1 X138.123 Y122.423 E.01638
G1 X138.64 Y122.551 E.01638
G1 X139.112 Y122.798 E.01638
G1 X139.512 Y123.152 E.01638
G1 X139.814 Y123.591 E.01638
G1 X139.982 Y124.033 E.01454
M204 S10000
G1 X140.083 Y123.289 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P84 R1
G1 F6549
G1 X139.807 Y122.89 E.01608
G1 X139.337 Y122.473 E.02084
G1 X139.209 Y122.406 E.00478
G1 X139.255 Y122.22 E.00635
G1 X140.254 Y122.22 E.03314
G1 X140.254 Y123.235 E.03367
G1 X140.14 Y123.271 E.00397
; WIPE_START
G1 F24000
G1 X139.807 Y122.89 E-.19221
G1 X139.337 Y122.473 E-.23878
G1 X139.209 Y122.406 E-.0548
G1 X139.255 Y122.22 E-.07271
G1 X139.785 Y122.22 E-.2015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.213 J.097 P1  F30000
G1 X140.083 Y125.948 Z2.4
G1 Z2
G1 E.8 F1800
G1 F6549
G1 X140.254 Y126.001 E.00596
G1 X140.254 Y127.016 E.03367
G1 X139.255 Y127.016 E.03314
G1 X139.209 Y126.831 E.00635
G1 X139.337 Y126.763 E.00478
G1 X139.807 Y126.347 E.02084
G1 X140.048 Y125.997 E.01409
; WIPE_START
G1 F24000
G1 X140.254 Y126.001 E-.07817
G1 X140.254 Y127.016 E-.38568
G1 X139.475 Y127.016 E-.29616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.105 J-1.212 P1  F30000
G1 X106.006 Y124.108 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6549
G1 X106.068 Y124.618 E.0158
G1 X106.003 Y125.148 E.01638
G1 X105.814 Y125.646 E.01638
G1 X105.512 Y126.085 E.01638
G1 X105.112 Y126.438 E.01638
M73 P85 R1
G1 X104.64 Y126.686 E.01638
G1 X104.123 Y126.814 E.01638
G1 X103.59 Y126.814 E.01638
G1 X103.072 Y126.686 E.01638
G1 X102.6 Y126.438 E.01638
G1 X102.201 Y126.085 E.01638
G1 X101.898 Y125.646 E.01638
G1 X101.709 Y125.148 E.01638
G1 X101.645 Y124.618 E.01638
G1 X101.709 Y124.089 E.01638
G1 X101.898 Y123.591 E.01638
G1 X102.201 Y123.152 E.01638
G1 X102.6 Y122.798 E.01638
G1 X103.072 Y122.551 E.01638
G1 X103.59 Y122.423 E.01638
G1 X104.123 Y122.423 E.01638
G1 X104.64 Y122.551 E.01638
G1 X105.112 Y122.798 E.01638
G1 X105.512 Y123.152 E.01638
G1 X105.814 Y123.591 E.01638
G1 X105.989 Y124.051 E.01512
M204 S10000
; WIPE_START
G1 F24000
G1 X106.068 Y124.618 E-.21773
G1 X106.003 Y125.148 E-.20259
G1 X105.814 Y125.646 E-.2026
G1 X105.609 Y125.943 E-.13708
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.914 J-.803 P1  F30000
G1 X102.503 Y122.406 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6549
G1 X102.376 Y122.473 E.00478
G1 X101.905 Y122.89 E.02084
G1 X101.63 Y123.289 E.01608
G1 X101.458 Y123.235 E.00596
G1 X101.458 Y122.22 E.03367
G1 X102.457 Y122.22 E.03314
G1 X102.489 Y122.348 E.00436
; WIPE_START
G1 F24000
G1 X102.376 Y122.473 E-.0642
G1 X101.905 Y122.89 E-.23878
G1 X101.63 Y123.289 E-.18419
G1 X101.458 Y123.235 E-.06829
G1 X101.458 Y122.697 E-.20454
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.18 J.298 P1  F30000
G1 X102.503 Y126.831 Z2.4
G1 Z2
G1 E.8 F1800
G1 F6549
G1 X102.457 Y127.016 E.00635
G1 X101.458 Y127.016 E.03314
G1 X101.458 Y126.001 E.03367
G1 X101.63 Y125.948 E.00596
G1 X101.905 Y126.347 E.01608
G1 X102.376 Y126.763 E.02084
G1 X102.45 Y126.803 E.00279
; WIPE_START
G1 F24000
G1 X102.457 Y127.016 E-.08125
G1 X101.458 Y127.016 E-.37968
G1 X101.458 Y126.229 E-.29907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.037 J1.216 P1  F30000
G1 X140.646 Y127.408 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6549
G1 X101.066 Y127.408 E1.21618
G1 X101.066 Y121.828 E.17146
G1 X140.646 Y121.828 E1.21618
G1 X140.646 Y127.348 E.16961
M204 S10000
G1 X139.886 Y126.813 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151053
G1 F6549
G1 X140.038 Y126.415 E.00375
G1 X140.219 Y125.785 F30000
; LINE_WIDTH: 0.43449
G1 F6549
G1 X140.252 Y125.604 E.00588
; LINE_WIDTH: 0.391801
G1 X140.285 Y125.423 E.00524
; LINE_WIDTH: 0.349113
G1 X140.318 Y125.242 E.00459
; LINE_WIDTH: 0.306424
G1 X140.322 Y125.21 E.00068
; LINE_WIDTH: 0.298796
G1 X140.34 Y124.92 E.00607
; LINE_WIDTH: 0.261158
G2 X140.357 Y124.607 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X140.34 Y124.317 E.0044
; LINE_WIDTH: 0.267101
G2 X140.318 Y123.995 I-2.649 J.015 E.00589
; LINE_WIDTH: 0.306424
G1 X140.285 Y123.814 E.00395
; LINE_WIDTH: 0.349112
G1 X140.252 Y123.633 E.00459
; LINE_WIDTH: 0.3918
G1 X140.219 Y123.452 E.00524
G1 X140.038 Y122.822 F30000
; LINE_WIDTH: 0.141571
G1 F6549
G1 X139.886 Y122.424 E.00342
G1 X139.045 Y122.252 F30000
; LINE_WIDTH: 0.405157
G1 F6549
G1 X138.752 Y122.198 E.00881
; LINE_WIDTH: 0.389446
G1 X138.558 Y122.174 E.00551
; LINE_WIDTH: 0.342434
G1 X138.365 Y122.151 E.00476
; LINE_WIDTH: 0.257331
G2 X138.147 Y122.126 I-.317 J1.798 E.00384
G2 X137.541 Y122.127 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X137.348 Y122.151 E.00327
; LINE_WIDTH: 0.295421
G1 X137.154 Y122.174 E.00401
; LINE_WIDTH: 0.342433
G1 X136.96 Y122.198 E.00476
; LINE_WIDTH: 0.389444
G1 X136.667 Y122.252 E.00842
G1 X136.044 Y122.424 F30000
; LINE_WIDTH: 0.134451
G1 F6549
G1 X135.882 Y122.606 E.00182
G1 X135.34 Y122.592 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6549
G1 X135.449 Y122.687 E.0048
G1 X135.229 Y123.267 E.02056
G2 X135.229 Y125.97 I2.593 J1.351 E.09319
G1 X135.449 Y126.549 E.02056
G1 X135.361 Y126.668 E.0049
G1 X106.327 Y126.668 E.96312
G1 X106.358 Y126.633 E.00157
G1 X106.264 Y126.549 E.00417
G1 X106.746 Y125.173 E.04838
G2 X106.484 Y123.267 I-3.137 J-.539 E.06483
G1 X106.264 Y122.688 E.02056
G1 X106.358 Y122.604 E.00417
G1 X106.327 Y122.569 E.00157
G1 X135.331 Y122.569 E.96214
; WIPE_START
G1 F24000
G1 X133.331 Y122.569 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.744 J.963 P1  F30000
G1 X139.045 Y126.985 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.405156
G1 F6549
G1 X138.752 Y127.039 E.00881
; LINE_WIDTH: 0.389444
G1 X138.558 Y127.063 E.00551
; LINE_WIDTH: 0.342433
G1 X138.365 Y127.086 E.00476
; LINE_WIDTH: 0.257331
G3 X138.147 Y127.111 I-.317 J-1.798 E.00384
G3 X137.541 Y127.11 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X137.348 Y127.086 E.00327
; LINE_WIDTH: 0.295422
G1 X137.154 Y127.063 E.00401
; LINE_WIDTH: 0.342434
G1 X136.96 Y127.039 E.00476
; LINE_WIDTH: 0.389444
G1 X136.667 Y126.985 E.00842
G1 X136.044 Y126.813 F30000
; LINE_WIDTH: 0.134453
G1 F6549
G1 X135.882 Y126.63 E.00182
G1 X132.937 Y126.261 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6549
G1 X134.566 Y126.261 E.05401
G1 X134.811 Y126.016 E.01151
G3 X134.811 Y123.221 I2.792 J-1.397 E.09611
G1 X134.566 Y122.976 E.01151
G1 X130.175 Y122.976 E.14565
G1 X126.89 Y126.261 E.15411
G1 X130.175 Y126.261 E.10897
G1 X126.89 Y122.976 E.15411
G1 X122.499 Y122.976 E.14565
G1 X119.214 Y126.261 E.15411
G1 X122.499 Y126.261 E.10897
G1 X119.214 Y122.976 E.15411
G1 X117.585 Y122.976 E.05401
G1 X116.451 Y126.261 F30000
G1 F6549
G1 X114.823 Y126.261 E.05401
G1 X111.538 Y122.976 E.15411
G1 X114.823 Y122.976 E.10897
G1 X111.538 Y126.261 E.15411
G1 X107.147 Y126.261 E.14565
G1 X106.901 Y126.016 E.01151
G2 X106.901 Y123.221 I-3.117 J-1.397 E.0955
G1 X107.147 Y122.976 E.01151
G1 X108.775 Y122.976 E.05401
G1 X105.83 Y122.607 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969208
G1 F6549
G1 X105.668 Y122.424 E.00107
G1 X105.045 Y122.252 F30000
; LINE_WIDTH: 0.405155
G1 F6549
G1 X104.752 Y122.198 E.00881
; LINE_WIDTH: 0.389444
G1 X104.558 Y122.174 E.00551
; LINE_WIDTH: 0.342433
G1 X104.365 Y122.151 E.00476
; LINE_WIDTH: 0.257331
G2 X104.147 Y122.126 I-.317 J1.798 E.00384
G2 X103.541 Y122.127 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X103.348 Y122.151 E.00327
; LINE_WIDTH: 0.295421
G1 X103.154 Y122.174 E.00401
; LINE_WIDTH: 0.342432
G1 X102.96 Y122.198 E.00476
; LINE_WIDTH: 0.389444
G1 X102.667 Y122.252 E.00842
G1 X101.826 Y122.424 F30000
; LINE_WIDTH: 0.151056
G1 F6549
G1 X101.675 Y122.822 E.00375
G1 X101.494 Y123.452 F30000
; LINE_WIDTH: 0.434489
G1 F6549
G1 X101.46 Y123.633 E.00588
; LINE_WIDTH: 0.391801
G1 X101.427 Y123.814 E.00524
; LINE_WIDTH: 0.349113
G1 X101.394 Y123.995 E.00459
; LINE_WIDTH: 0.306424
G1 X101.39 Y124.026 E.00068
; LINE_WIDTH: 0.298796
G1 X101.373 Y124.317 E.00607
; LINE_WIDTH: 0.261158
G2 X101.355 Y124.63 I2.576 J.302 E.00557
; LINE_WIDTH: 0.228538
G1 X101.373 Y124.92 E.0044
; LINE_WIDTH: 0.267101
G2 X101.394 Y125.242 I2.649 J-.015 E.00589
; LINE_WIDTH: 0.306424
G1 X101.427 Y125.423 E.00395
; LINE_WIDTH: 0.349112
G1 X101.46 Y125.604 E.00459
; LINE_WIDTH: 0.3918
G1 X101.494 Y125.785 E.00524
G1 X101.675 Y126.415 F30000
; LINE_WIDTH: 0.151054
G1 F6549
G1 X101.826 Y126.813 E.00375
G1 X102.667 Y126.985 F30000
; LINE_WIDTH: 0.389444
G1 F6549
G1 X102.96 Y127.039 E.00842
; LINE_WIDTH: 0.342433
G1 X103.154 Y127.063 E.00476
; LINE_WIDTH: 0.295422
G1 X103.348 Y127.086 E.00401
; LINE_WIDTH: 0.24841
G1 X103.541 Y127.11 E.00327
; LINE_WIDTH: 0.257331
G2 X104.147 Y127.111 I.315 J-4.984 E.01058
G2 X104.365 Y127.086 I-.098 J-1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X104.558 Y127.063 E.00476
; LINE_WIDTH: 0.389444
G1 X104.752 Y127.039 E.00551
; LINE_WIDTH: 0.405156
G1 X105.045 Y126.985 E.00881
G1 X105.668 Y126.813 F30000
; LINE_WIDTH: 0.096921
G1 F6549
G1 X105.83 Y126.63 E.00107
; WIPE_START
G1 F24000
G1 X105.668 Y126.813 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.376 J1.158 P1  F30000
G1 X140.15 Y138.006 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6549
G1 X140.022 Y138.073 E.00478
G1 X139.552 Y138.489 E.02084
G1 X139.195 Y139.007 E.02084
G1 X138.972 Y139.594 E.02084
G1 X138.896 Y140.218 E.02084
G1 X138.972 Y140.842 E.02084
G1 X139.195 Y141.429 E.02084
G1 X139.552 Y141.946 E.02084
G1 X140.022 Y142.363 E.02084
G1 X140.15 Y142.43 E.00478
G1 X140.104 Y142.616 E.00635
G1 X108.901 Y142.616 E1.03504
G1 X108.856 Y142.43 E.00635
G1 X108.983 Y142.363 E.00478
G1 X109.454 Y141.946 E.02084
G1 X109.811 Y141.429 E.02084
G1 X110.033 Y140.842 E.02084
G1 X110.109 Y140.218 E.02084
G1 X110.033 Y139.594 E.02084
G1 X109.811 Y139.007 E.02084
G1 X109.454 Y138.489 E.02084
G1 X108.983 Y138.073 E.02084
G1 X108.856 Y138.006 E.00478
G1 X108.901 Y137.82 E.00635
G1 X140.104 Y137.82 E1.03504
G1 X140.135 Y137.947 E.00436
; WIPE_START
G1 F24000
G1 X140.022 Y138.073 E-.06419
G1 X139.552 Y138.489 E-.23878
G1 X139.195 Y139.007 E-.23877
G1 X138.991 Y139.544 E-.21825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.038 J1.216 P1  F30000
G1 X143.65 Y139.689 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6549
G1 X143.714 Y140.218 E.01638
G1 X143.65 Y140.747 E.01638
G1 X143.461 Y141.246 E.01638
G1 X143.158 Y141.684 E.01638
G1 X142.759 Y142.038 E.01638
G1 X142.287 Y142.286 E.01638
G1 X141.769 Y142.413 E.01638
G1 X141.236 Y142.413 E.01638
G1 X140.719 Y142.286 E.01638
G1 X140.246 Y142.038 E.01638
G1 X139.847 Y141.684 E.01638
G1 X139.545 Y141.246 E.01638
G1 X139.355 Y140.747 E.01638
G1 X139.291 Y140.218 E.01638
G1 X139.355 Y139.689 E.01638
G1 X139.545 Y139.19 E.01638
G1 X139.847 Y138.751 E.01638
G1 X140.246 Y138.398 E.01638
G1 X140.719 Y138.15 E.01638
G1 X141.236 Y138.022 E.01638
G1 X141.769 Y138.022 E.01638
G1 X142.287 Y138.15 E.01638
G1 X142.759 Y138.398 E.01638
G1 X143.158 Y138.751 E.01638
G1 X143.461 Y139.19 E.01638
G1 X143.629 Y139.632 E.01454
M204 S10000
G1 X143.729 Y138.888 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6549
G1 X143.454 Y138.489 E.01608
G1 X142.983 Y138.073 E.02084
G1 X142.856 Y138.006 E.00478
G1 X142.901 Y137.82 E.00635
G1 X143.901 Y137.82 E.03314
G1 X143.901 Y138.835 E.03367
G1 X143.786 Y138.87 E.00397
; WIPE_START
G1 F24000
G1 X143.454 Y138.489 E-.19221
G1 X142.983 Y138.073 E-.23878
G1 X142.856 Y138.006 E-.0548
G1 X142.901 Y137.82 E-.07271
G1 X143.432 Y137.82 E-.2015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.213 J.097 P1  F30000
G1 X143.729 Y141.547 Z2.4
G1 Z2
G1 E.8 F1800
G1 F6549
G1 X143.901 Y141.601 E.00596
G1 X143.901 Y142.616 E.03367
G1 X142.901 Y142.616 E.03314
G1 X142.856 Y142.43 E.00635
G1 X142.983 Y142.363 E.00478
G1 X143.454 Y141.946 E.02084
G1 X143.695 Y141.597 E.01409
; WIPE_START
G1 F24000
G1 X143.901 Y141.601 E-.07817
G1 X143.901 Y142.616 E-.38568
G1 X143.121 Y142.616 E-.29616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.105 J-1.212 P1  F30000
G1 X109.652 Y139.707 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6549
G1 X109.714 Y140.218 E.0158
G1 X109.65 Y140.747 E.01638
G1 X109.461 Y141.246 E.01638
G1 X109.158 Y141.684 E.01638
G1 X108.759 Y142.038 E.01638
G1 X108.287 Y142.286 E.01638
G1 X107.769 Y142.413 E.01638
G1 X107.236 Y142.413 E.01638
G1 X106.719 Y142.286 E.01638
G1 X106.246 Y142.038 E.01638
G1 X105.847 Y141.684 E.01638
G1 X105.545 Y141.246 E.01638
G1 X105.355 Y140.747 E.01638
G1 X105.291 Y140.218 E.01638
G1 X105.355 Y139.689 E.01638
G1 X105.545 Y139.19 E.01638
G1 X105.847 Y138.751 E.01638
G1 X106.246 Y138.398 E.01638
G1 X106.719 Y138.15 E.01638
G1 X107.236 Y138.022 E.01638
G1 X107.769 Y138.022 E.01638
G1 X108.287 Y138.15 E.01638
G1 X108.759 Y138.398 E.01638
G1 X109.158 Y138.751 E.01638
G1 X109.461 Y139.19 E.01638
G1 X109.635 Y139.65 E.01512
M204 S10000
; WIPE_START
G1 F24000
G1 X109.714 Y140.218 E-.21773
G1 X109.65 Y140.747 E-.20259
G1 X109.461 Y141.246 E-.2026
G1 X109.256 Y141.542 E-.13708
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.914 J-.803 P1  F30000
G1 X106.15 Y138.006 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6549
G1 X106.022 Y138.073 E.00478
G1 X105.552 Y138.489 E.02084
G1 X105.276 Y138.888 E.01608
G1 X105.105 Y138.835 E.00596
G1 X105.105 Y137.82 E.03367
G1 X106.104 Y137.82 E.03314
G1 X106.135 Y137.947 E.00436
; WIPE_START
G1 F24000
G1 X106.022 Y138.073 E-.0642
G1 X105.552 Y138.489 E-.23878
G1 X105.276 Y138.888 E-.18419
G1 X105.105 Y138.835 E-.06829
G1 X105.105 Y138.297 E-.20454
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.18 J.298 P1  F30000
G1 X106.15 Y142.43 Z2.4
G1 Z2
G1 E.8 F1800
G1 F6549
G1 X106.104 Y142.616 E.00635
G1 X105.105 Y142.616 E.03314
G1 X105.105 Y141.601 E.03367
G1 X105.276 Y141.547 E.00596
G1 X105.552 Y141.946 E.01608
G1 X106.022 Y142.363 E.02084
G1 X106.097 Y142.402 E.00279
; WIPE_START
G1 F24000
G1 X106.104 Y142.616 E-.08125
G1 X105.105 Y142.616 E-.37968
G1 X105.105 Y141.829 E-.29907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.037 J1.216 P1  F30000
G1 X144.293 Y143.008 Z2.4
G1 Z2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6549
G1 X104.713 Y143.008 E1.21618
G1 X104.713 Y137.428 E.17146
G1 X144.293 Y137.428 E1.21618
G1 X144.293 Y142.948 E.16961
M204 S10000
G1 X143.533 Y142.412 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151053
G1 F6549
G1 X143.684 Y142.015 E.00375
G1 X143.865 Y141.384 F30000
; LINE_WIDTH: 0.43449
G1 F6549
G1 X143.899 Y141.203 E.00588
; LINE_WIDTH: 0.391801
G1 X143.932 Y141.022 E.00524
; LINE_WIDTH: 0.349113
G1 X143.965 Y140.841 E.00459
; LINE_WIDTH: 0.306424
G1 X143.969 Y140.81 E.00068
; LINE_WIDTH: 0.298796
G1 X143.986 Y140.519 E.00607
; LINE_WIDTH: 0.261158
G2 X144.004 Y140.207 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X143.986 Y139.916 E.0044
; LINE_WIDTH: 0.267101
G2 X143.965 Y139.595 I-2.649 J.015 E.00589
; LINE_WIDTH: 0.306424
G1 X143.932 Y139.413 E.00395
; LINE_WIDTH: 0.349112
G1 X143.899 Y139.232 E.00459
; LINE_WIDTH: 0.3918
G1 X143.865 Y139.051 E.00524
G1 X143.684 Y138.421 F30000
; LINE_WIDTH: 0.141571
G1 F6549
G1 X143.533 Y138.023 E.00342
G1 X142.692 Y137.851 F30000
; LINE_WIDTH: 0.405157
G1 F6549
G1 X142.398 Y137.797 E.00881
; LINE_WIDTH: 0.389446
G1 X142.205 Y137.774 E.00551
; LINE_WIDTH: 0.342434
G1 X142.011 Y137.75 E.00476
; LINE_WIDTH: 0.257331
G2 X141.793 Y137.725 I-.317 J1.798 E.00384
G2 X141.188 Y137.727 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X140.994 Y137.75 E.00327
; LINE_WIDTH: 0.295421
M73 P86 R1
G1 X140.801 Y137.774 E.00401
; LINE_WIDTH: 0.342433
G1 X140.607 Y137.797 E.00476
; LINE_WIDTH: 0.389444
G1 X140.314 Y137.851 E.00842
G1 X139.691 Y138.023 F30000
; LINE_WIDTH: 0.134451
G1 F6549
G1 X139.529 Y138.206 E.00182
G1 X138.987 Y138.191 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6549
G1 X139.095 Y138.287 E.0048
G1 X138.875 Y138.867 E.02056
G2 X138.875 Y141.569 I2.593 J1.351 E.09319
G1 X139.095 Y142.149 E.02056
G1 X139.007 Y142.267 E.0049
G1 X109.973 Y142.267 E.96312
G1 X110.004 Y142.232 E.00157
G1 X109.91 Y142.149 E.00417
G1 X110.393 Y140.772 E.04838
G2 X110.13 Y138.867 I-3.137 J-.539 E.06483
G1 X109.91 Y138.287 E.02056
G1 X110.004 Y138.204 E.00417
G1 X109.973 Y138.168 E.00157
G1 X138.978 Y138.168 E.96214
; WIPE_START
G1 F24000
G1 X136.978 Y138.168 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.744 J.963 P1  F30000
G1 X142.692 Y142.585 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.405156
G1 F6549
G1 X142.398 Y142.639 E.00881
; LINE_WIDTH: 0.389444
G1 X142.205 Y142.662 E.00551
; LINE_WIDTH: 0.342433
G1 X142.011 Y142.686 E.00476
; LINE_WIDTH: 0.257331
G3 X141.793 Y142.711 I-.317 J-1.798 E.00384
G3 X141.188 Y142.709 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X140.994 Y142.686 E.00327
; LINE_WIDTH: 0.295422
G1 X140.801 Y142.662 E.00401
; LINE_WIDTH: 0.342434
G1 X140.607 Y142.639 E.00476
; LINE_WIDTH: 0.389444
G1 X140.314 Y142.585 E.00842
G1 X139.691 Y142.412 F30000
; LINE_WIDTH: 0.134453
G1 F6549
G1 X139.529 Y142.23 E.00182
G1 X136.584 Y141.86 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6549
G1 X138.212 Y141.86 E.05401
G1 X138.457 Y141.615 E.01151
G3 X138.457 Y138.821 I2.792 J-1.397 E.09611
G1 X138.212 Y138.575 E.01151
G1 X133.821 Y138.575 E.14565
G1 X130.536 Y141.86 E.15411
G1 X133.821 Y141.86 E.10897
G1 X130.536 Y138.575 E.15411
G1 X126.145 Y138.575 E.14565
G1 X122.86 Y141.86 E.15411
G1 X126.145 Y141.86 E.10897
G1 X122.86 Y138.575 E.15411
G1 X121.232 Y138.575 E.05401
G1 X120.098 Y141.86 F30000
G1 F6549
G1 X118.469 Y141.86 E.05401
G1 X115.184 Y138.575 E.15411
G1 X118.469 Y138.575 E.10897
G1 X115.184 Y141.86 E.15411
G1 X110.793 Y141.86 E.14565
G1 X110.548 Y141.615 E.01151
G2 X110.548 Y138.821 I-3.117 J-1.397 E.0955
G1 X110.793 Y138.575 E.01151
G1 X112.422 Y138.575 E.05401
G1 X109.477 Y138.206 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969208
G1 F6549
G1 X109.315 Y138.023 E.00107
G1 X108.692 Y137.851 F30000
; LINE_WIDTH: 0.405155
G1 F6549
G1 X108.398 Y137.797 E.00881
; LINE_WIDTH: 0.389444
G1 X108.205 Y137.774 E.00551
; LINE_WIDTH: 0.342433
G1 X108.011 Y137.75 E.00476
; LINE_WIDTH: 0.257331
G2 X107.793 Y137.725 I-.317 J1.798 E.00384
G2 X107.188 Y137.727 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X106.994 Y137.75 E.00327
; LINE_WIDTH: 0.295421
G1 X106.801 Y137.774 E.00401
; LINE_WIDTH: 0.342432
G1 X106.607 Y137.797 E.00476
; LINE_WIDTH: 0.389444
G1 X106.314 Y137.851 E.00842
G1 X105.473 Y138.023 F30000
; LINE_WIDTH: 0.151056
G1 F6549
G1 X105.321 Y138.421 E.00375
G1 X105.14 Y139.051 F30000
; LINE_WIDTH: 0.434489
G1 F6549
G1 X105.107 Y139.232 E.00588
; LINE_WIDTH: 0.391801
G1 X105.074 Y139.413 E.00524
; LINE_WIDTH: 0.349113
G1 X105.041 Y139.595 E.00459
; LINE_WIDTH: 0.306424
G1 X105.037 Y139.626 E.00068
; LINE_WIDTH: 0.298796
G1 X105.019 Y139.916 E.00607
; LINE_WIDTH: 0.261158
G2 X105.002 Y140.229 I2.576 J.302 E.00557
; LINE_WIDTH: 0.228538
G1 X105.019 Y140.519 E.0044
; LINE_WIDTH: 0.267101
G2 X105.041 Y140.841 I2.649 J-.015 E.00589
; LINE_WIDTH: 0.306424
G1 X105.074 Y141.022 E.00395
; LINE_WIDTH: 0.349112
G1 X105.107 Y141.203 E.00459
; LINE_WIDTH: 0.3918
G1 X105.14 Y141.384 E.00524
G1 X105.321 Y142.015 F30000
; LINE_WIDTH: 0.151054
G1 F6549
G1 X105.473 Y142.412 E.00375
G1 X106.314 Y142.585 F30000
; LINE_WIDTH: 0.389444
G1 F6549
G1 X106.607 Y142.639 E.00842
; LINE_WIDTH: 0.342433
G1 X106.801 Y142.662 E.00476
; LINE_WIDTH: 0.295422
G1 X106.994 Y142.686 E.00401
; LINE_WIDTH: 0.24841
G1 X107.188 Y142.709 E.00327
; LINE_WIDTH: 0.257331
G2 X107.793 Y142.711 I.315 J-4.984 E.01058
G2 X108.011 Y142.686 I-.098 J-1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X108.205 Y142.662 E.00476
; LINE_WIDTH: 0.389444
G1 X108.398 Y142.639 E.00551
; LINE_WIDTH: 0.405156
G1 X108.692 Y142.585 E.00881
G1 X109.315 Y142.412 F30000
; LINE_WIDTH: 0.096921
G1 F6549
G1 X109.477 Y142.23 E.00107
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.315 Y142.412 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/15
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
G3 Z2.4 I.721 J.98 P1  F30000
G1 X136.503 Y122.406 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6549
G1 X136.376 Y122.473 E.00478
G1 X135.905 Y122.89 E.02084
G1 X135.548 Y123.407 E.02084
G1 X135.325 Y123.995 E.02084
G1 X135.25 Y124.618 E.02084
G1 X135.325 Y125.242 E.02084
G1 X135.548 Y125.83 E.02084
G1 X135.905 Y126.347 E.02084
G1 X136.376 Y126.763 E.02084
G1 X136.503 Y126.831 E.00478
G1 X136.457 Y127.016 E.00635
G1 X105.255 Y127.016 E1.03504
G1 X105.209 Y126.831 E.00635
G1 X105.337 Y126.763 E.00478
G1 X105.807 Y126.347 E.02084
G1 X106.164 Y125.83 E.02084
G1 X106.387 Y125.242 E.02084
G1 X106.463 Y124.618 E.02084
G1 X106.387 Y123.995 E.02084
G1 X106.164 Y123.407 E.02084
G1 X105.807 Y122.89 E.02084
G1 X105.337 Y122.473 E.02084
G1 X105.209 Y122.406 E.00478
G1 X105.255 Y122.22 E.00635
G1 X136.457 Y122.22 E1.03504
G1 X136.489 Y122.348 E.00436
; WIPE_START
G1 F24000
G1 X136.376 Y122.473 E-.06419
G1 X135.905 Y122.89 E-.23878
G1 X135.548 Y123.407 E-.23877
G1 X135.345 Y123.944 E-.21825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.038 J1.216 P1  F30000
G1 X140.003 Y124.089 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6549
G1 X140.068 Y124.618 E.01638
G1 X140.003 Y125.148 E.01638
G1 X139.814 Y125.646 E.01638
G1 X139.512 Y126.085 E.01638
G1 X139.112 Y126.438 E.01638
G1 X138.64 Y126.686 E.01638
G1 X138.123 Y126.814 E.01638
G1 X137.59 Y126.814 E.01638
G1 X137.072 Y126.686 E.01638
G1 X136.6 Y126.438 E.01638
G1 X136.201 Y126.085 E.01638
G1 X135.898 Y125.646 E.01638
G1 X135.709 Y125.148 E.01638
G1 X135.645 Y124.618 E.01638
G1 X135.709 Y124.089 E.01638
G1 X135.898 Y123.591 E.01638
G1 X136.201 Y123.152 E.01638
G1 X136.6 Y122.798 E.01638
G1 X137.072 Y122.551 E.01638
G1 X137.59 Y122.423 E.01638
G1 X138.123 Y122.423 E.01638
G1 X138.64 Y122.551 E.01638
G1 X139.112 Y122.798 E.01638
G1 X139.512 Y123.152 E.01638
G1 X139.814 Y123.591 E.01638
G1 X139.982 Y124.033 E.01454
M204 S10000
G1 X140.083 Y123.289 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6549
G1 X139.807 Y122.89 E.01608
G1 X139.337 Y122.473 E.02084
G1 X139.209 Y122.406 E.00478
G1 X139.255 Y122.22 E.00635
G1 X140.254 Y122.22 E.03314
G1 X140.254 Y123.235 E.03367
G1 X140.14 Y123.271 E.00397
; WIPE_START
G1 F24000
G1 X139.807 Y122.89 E-.19221
G1 X139.337 Y122.473 E-.23878
G1 X139.209 Y122.406 E-.0548
G1 X139.255 Y122.22 E-.07271
G1 X139.785 Y122.22 E-.2015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.213 J.097 P1  F30000
G1 X140.083 Y125.948 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F6549
G1 X140.254 Y126.001 E.00596
G1 X140.254 Y127.016 E.03367
G1 X139.255 Y127.016 E.03314
G1 X139.209 Y126.831 E.00635
G1 X139.337 Y126.763 E.00478
G1 X139.807 Y126.347 E.02084
G1 X140.048 Y125.997 E.01409
; WIPE_START
G1 F24000
G1 X140.254 Y126.001 E-.07817
G1 X140.254 Y127.016 E-.38568
G1 X139.475 Y127.016 E-.29616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.105 J-1.212 P1  F30000
G1 X106.006 Y124.109 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6549
G1 X106.068 Y124.618 E.01578
G1 X106.003 Y125.148 E.01638
G1 X105.814 Y125.646 E.01638
G1 X105.512 Y126.085 E.01638
G1 X105.112 Y126.438 E.01638
G1 X104.64 Y126.686 E.01638
G1 X104.123 Y126.814 E.01638
G1 X103.59 Y126.814 E.01638
G1 X103.072 Y126.686 E.01638
G1 X102.6 Y126.438 E.01638
G1 X102.201 Y126.085 E.01638
G1 X101.898 Y125.646 E.01638
G1 X101.709 Y125.148 E.01638
G1 X101.645 Y124.618 E.01638
G1 X101.709 Y124.089 E.01638
G1 X101.898 Y123.591 E.01638
G1 X102.201 Y123.152 E.01638
G1 X102.6 Y122.798 E.01638
G1 X103.072 Y122.551 E.01638
G1 X103.59 Y122.423 E.01638
G1 X104.123 Y122.423 E.01638
G1 X104.64 Y122.551 E.01638
G1 X105.112 Y122.798 E.01638
G1 X105.512 Y123.152 E.01638
G1 X105.814 Y123.591 E.01638
G1 X105.989 Y124.051 E.01514
M204 S10000
; WIPE_START
G1 F24000
G1 X106.068 Y124.618 E-.21752
G1 X106.003 Y125.148 E-.20259
G1 X105.814 Y125.646 E-.2026
G1 X105.609 Y125.943 E-.13729
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.914 J-.803 P1  F30000
G1 X102.503 Y122.406 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6549
G1 X102.376 Y122.473 E.00478
G1 X101.905 Y122.89 E.02084
G1 X101.63 Y123.289 E.01608
G1 X101.458 Y123.235 E.00596
G1 X101.458 Y122.22 E.03367
G1 X102.457 Y122.22 E.03314
G1 X102.489 Y122.348 E.00436
; WIPE_START
G1 F24000
G1 X102.376 Y122.473 E-.06419
G1 X101.905 Y122.89 E-.23878
G1 X101.63 Y123.289 E-.18419
G1 X101.458 Y123.235 E-.06829
G1 X101.458 Y122.697 E-.20454
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.18 J.298 P1  F30000
G1 X102.503 Y126.831 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F6549
G1 X102.457 Y127.016 E.00635
G1 X101.458 Y127.016 E.03314
G1 X101.458 Y126.001 E.03367
G1 X101.63 Y125.948 E.00596
G1 X101.905 Y126.347 E.01608
G1 X102.376 Y126.763 E.02084
G1 X102.45 Y126.803 E.00279
; WIPE_START
G1 F24000
G1 X102.457 Y127.016 E-.08125
G1 X101.458 Y127.016 E-.37968
G1 X101.458 Y126.229 E-.29907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.037 J1.216 P1  F30000
G1 X140.646 Y127.408 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6549
G1 X101.066 Y127.408 E1.21618
G1 X101.066 Y121.828 E.17146
G1 X140.646 Y121.828 E1.21618
G1 X140.646 Y127.348 E.16961
M204 S10000
G1 X139.886 Y126.813 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151053
G1 F6549
G1 X140.038 Y126.415 E.00375
G1 X140.219 Y125.785 F30000
; LINE_WIDTH: 0.43449
G1 F6549
G1 X140.252 Y125.604 E.00588
; LINE_WIDTH: 0.391801
G1 X140.285 Y125.423 E.00524
; LINE_WIDTH: 0.349113
G1 X140.318 Y125.242 E.00459
; LINE_WIDTH: 0.306424
G1 X140.322 Y125.21 E.00068
; LINE_WIDTH: 0.298796
G1 X140.34 Y124.92 E.00607
; LINE_WIDTH: 0.261158
G2 X140.357 Y124.607 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X140.34 Y124.317 E.0044
; LINE_WIDTH: 0.267101
G2 X140.318 Y123.995 I-2.649 J.015 E.00589
; LINE_WIDTH: 0.306424
G1 X140.285 Y123.814 E.00395
; LINE_WIDTH: 0.349112
G1 X140.252 Y123.633 E.00459
; LINE_WIDTH: 0.3918
G1 X140.219 Y123.452 E.00524
G1 X140.038 Y122.822 F30000
; LINE_WIDTH: 0.141571
G1 F6549
G1 X139.886 Y122.424 E.00342
G1 X139.045 Y122.252 F30000
; LINE_WIDTH: 0.405157
G1 F6549
G1 X138.752 Y122.198 E.00881
; LINE_WIDTH: 0.389446
G1 X138.558 Y122.174 E.00551
; LINE_WIDTH: 0.342434
G1 X138.365 Y122.151 E.00476
; LINE_WIDTH: 0.257331
G2 X138.147 Y122.126 I-.317 J1.798 E.00384
G2 X137.541 Y122.127 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X137.348 Y122.151 E.00327
; LINE_WIDTH: 0.295421
G1 X137.154 Y122.174 E.00401
; LINE_WIDTH: 0.342433
G1 X136.96 Y122.198 E.00476
; LINE_WIDTH: 0.389446
G1 X136.667 Y122.252 E.00842
G1 X136.044 Y122.424 F30000
; LINE_WIDTH: 0.134453
G1 F6549
G1 X135.882 Y122.607 E.00182
G1 X135.34 Y122.592 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6549
G1 X135.449 Y122.688 E.0048
G1 X135.229 Y123.267 E.02056
G2 X135.229 Y125.97 I2.593 J1.351 E.09319
G1 X135.449 Y126.549 E.02056
G1 X135.361 Y126.668 E.0049
G1 X106.327 Y126.668 E.96312
G1 X106.358 Y126.633 E.00157
G1 X106.264 Y126.549 E.00417
G1 X106.746 Y125.173 E.04838
G2 X106.484 Y123.267 I-3.137 J-.539 E.06483
G1 X106.264 Y122.688 E.02056
G1 X106.358 Y122.604 E.00417
G1 X106.327 Y122.569 E.00157
G1 X135.331 Y122.569 E.96214
; WIPE_START
G1 F24000
G1 X133.331 Y122.569 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P87 R1
G3 Z2.6 I-.744 J.963 P1  F30000
G1 X139.045 Y126.985 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.405156
G1 F6549
G1 X138.752 Y127.039 E.00881
; LINE_WIDTH: 0.389444
G1 X138.558 Y127.063 E.00551
; LINE_WIDTH: 0.342433
G1 X138.365 Y127.086 E.00476
; LINE_WIDTH: 0.257331
G3 X138.147 Y127.111 I-.317 J-1.798 E.00384
G3 X137.541 Y127.11 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X137.348 Y127.086 E.00327
; LINE_WIDTH: 0.295422
G1 X137.154 Y127.063 E.00401
; LINE_WIDTH: 0.342434
G1 X136.96 Y127.039 E.00476
; LINE_WIDTH: 0.389444
G1 X136.667 Y126.985 E.00842
G1 X136.044 Y126.813 F30000
; LINE_WIDTH: 0.134453
G1 F6549
G1 X135.882 Y126.63 E.00182
G1 X132.937 Y126.261 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6549
G1 X134.566 Y126.261 E.05401
G1 X134.811 Y126.016 E.01151
G3 X134.811 Y123.221 I2.792 J-1.397 E.09611
G1 X134.566 Y122.976 E.01151
G1 X130.175 Y122.976 E.14565
G1 X126.89 Y126.261 E.15411
G1 X130.175 Y126.261 E.10897
G1 X126.89 Y122.976 E.15411
G1 X122.499 Y122.976 E.14565
G1 X119.214 Y126.261 E.15411
G1 X122.499 Y126.261 E.10897
G1 X119.214 Y122.976 E.15411
G1 X117.585 Y122.976 E.05401
G1 X116.451 Y126.261 F30000
G1 F6549
G1 X114.823 Y126.261 E.05401
G1 X111.538 Y122.976 E.15411
G1 X114.823 Y122.976 E.10897
G1 X111.538 Y126.261 E.15411
G1 X107.147 Y126.261 E.14565
G1 X106.901 Y126.016 E.01151
G2 X106.901 Y123.221 I-3.117 J-1.397 E.0955
G1 X107.147 Y122.976 E.01151
G1 X108.775 Y122.976 E.05401
G1 X105.83 Y122.607 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969209
G1 F6549
G1 X105.668 Y122.424 E.00107
G1 X105.045 Y122.252 F30000
; LINE_WIDTH: 0.405155
G1 F6549
G1 X104.752 Y122.198 E.00881
; LINE_WIDTH: 0.389444
G1 X104.558 Y122.174 E.00551
; LINE_WIDTH: 0.342433
G1 X104.365 Y122.151 E.00476
; LINE_WIDTH: 0.257331
G2 X104.147 Y122.126 I-.317 J1.798 E.00384
G2 X103.541 Y122.127 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X103.348 Y122.151 E.00327
; LINE_WIDTH: 0.295421
G1 X103.154 Y122.174 E.00401
; LINE_WIDTH: 0.342433
G1 X102.96 Y122.198 E.00476
; LINE_WIDTH: 0.389444
G1 X102.667 Y122.252 E.00842
G1 X101.826 Y122.424 F30000
; LINE_WIDTH: 0.151056
G1 F6549
G1 X101.675 Y122.822 E.00375
G1 X101.494 Y123.452 F30000
; LINE_WIDTH: 0.434489
G1 F6549
G1 X101.46 Y123.633 E.00588
; LINE_WIDTH: 0.391801
G1 X101.427 Y123.814 E.00524
; LINE_WIDTH: 0.349113
G1 X101.394 Y123.995 E.00459
; LINE_WIDTH: 0.306424
G1 X101.39 Y124.026 E.00068
; LINE_WIDTH: 0.298796
G1 X101.373 Y124.317 E.00607
; LINE_WIDTH: 0.261158
G2 X101.355 Y124.63 I2.576 J.302 E.00557
; LINE_WIDTH: 0.228538
G1 X101.373 Y124.92 E.0044
; LINE_WIDTH: 0.267101
G2 X101.394 Y125.242 I2.649 J-.015 E.00589
; LINE_WIDTH: 0.306424
G1 X101.427 Y125.423 E.00395
; LINE_WIDTH: 0.349112
G1 X101.46 Y125.604 E.00459
; LINE_WIDTH: 0.3918
G1 X101.494 Y125.785 E.00524
G1 X101.675 Y126.415 F30000
; LINE_WIDTH: 0.151054
G1 F6549
G1 X101.826 Y126.813 E.00375
G1 X102.667 Y126.985 F30000
; LINE_WIDTH: 0.389444
G1 F6549
G1 X102.96 Y127.039 E.00842
; LINE_WIDTH: 0.342433
G1 X103.154 Y127.063 E.00476
; LINE_WIDTH: 0.295422
G1 X103.348 Y127.086 E.00401
; LINE_WIDTH: 0.24841
G1 X103.541 Y127.11 E.00327
; LINE_WIDTH: 0.257331
G2 X104.147 Y127.111 I.315 J-4.984 E.01058
G2 X104.365 Y127.086 I-.098 J-1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X104.558 Y127.063 E.00476
; LINE_WIDTH: 0.389444
G1 X104.752 Y127.039 E.00551
; LINE_WIDTH: 0.405156
G1 X105.045 Y126.985 E.00881
G1 X105.668 Y126.813 F30000
; LINE_WIDTH: 0.096921
G1 F6549
G1 X105.83 Y126.63 E.00107
; WIPE_START
G1 F24000
G1 X105.668 Y126.813 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.376 J1.158 P1  F30000
G1 X140.15 Y138.006 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6549
G1 X140.022 Y138.073 E.00478
G1 X139.552 Y138.489 E.02084
G1 X139.195 Y139.007 E.02084
G1 X138.972 Y139.594 E.02084
G1 X138.896 Y140.218 E.02084
G1 X138.972 Y140.842 E.02084
G1 X139.195 Y141.429 E.02084
G1 X139.552 Y141.946 E.02084
G1 X140.022 Y142.363 E.02084
G1 X140.15 Y142.43 E.00478
G1 X140.104 Y142.616 E.00635
G1 X108.901 Y142.616 E1.03504
G1 X108.856 Y142.43 E.00635
G1 X108.983 Y142.363 E.00478
G1 X109.454 Y141.946 E.02084
G1 X109.811 Y141.429 E.02084
G1 X110.033 Y140.842 E.02084
G1 X110.109 Y140.218 E.02084
G1 X110.033 Y139.594 E.02084
G1 X109.811 Y139.007 E.02084
G1 X109.454 Y138.489 E.02084
G1 X108.983 Y138.073 E.02084
G1 X108.856 Y138.006 E.00478
G1 X108.901 Y137.82 E.00635
G1 X140.104 Y137.82 E1.03504
G1 X140.135 Y137.947 E.00436
; WIPE_START
G1 F24000
G1 X140.022 Y138.073 E-.06419
G1 X139.552 Y138.489 E-.23878
G1 X139.195 Y139.007 E-.23877
G1 X138.991 Y139.544 E-.21825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.038 J1.216 P1  F30000
G1 X143.65 Y139.689 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6549
G1 X143.714 Y140.218 E.01638
G1 X143.65 Y140.747 E.01638
G1 X143.461 Y141.246 E.01638
G1 X143.158 Y141.684 E.01638
G1 X142.759 Y142.038 E.01638
G1 X142.287 Y142.286 E.01638
G1 X141.769 Y142.413 E.01638
G1 X141.236 Y142.413 E.01638
G1 X140.719 Y142.286 E.01638
G1 X140.246 Y142.038 E.01638
G1 X139.847 Y141.684 E.01638
G1 X139.545 Y141.246 E.01638
G1 X139.355 Y140.747 E.01638
G1 X139.291 Y140.218 E.01638
G1 X139.355 Y139.689 E.01638
G1 X139.545 Y139.19 E.01638
G1 X139.847 Y138.751 E.01638
G1 X140.246 Y138.398 E.01638
G1 X140.719 Y138.15 E.01638
G1 X141.236 Y138.022 E.01638
G1 X141.769 Y138.022 E.01638
G1 X142.287 Y138.15 E.01638
G1 X142.759 Y138.398 E.01638
G1 X143.158 Y138.751 E.01638
G1 X143.461 Y139.19 E.01638
G1 X143.629 Y139.632 E.01454
M204 S10000
G1 X143.729 Y138.888 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6549
G1 X143.454 Y138.489 E.01608
G1 X142.983 Y138.073 E.02084
G1 X142.856 Y138.006 E.00478
G1 X142.901 Y137.82 E.00635
G1 X143.901 Y137.82 E.03314
G1 X143.901 Y138.835 E.03367
G1 X143.786 Y138.87 E.00397
; WIPE_START
G1 F24000
G1 X143.454 Y138.489 E-.19221
G1 X142.983 Y138.073 E-.23878
G1 X142.856 Y138.006 E-.0548
G1 X142.901 Y137.82 E-.07271
G1 X143.432 Y137.82 E-.2015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.213 J.097 P1  F30000
G1 X143.729 Y141.547 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F6549
G1 X143.901 Y141.601 E.00596
G1 X143.901 Y142.616 E.03367
G1 X142.901 Y142.616 E.03314
G1 X142.856 Y142.43 E.00635
G1 X142.983 Y142.363 E.00478
G1 X143.454 Y141.946 E.02084
G1 X143.695 Y141.597 E.01409
; WIPE_START
G1 F24000
G1 X143.901 Y141.601 E-.07817
G1 X143.901 Y142.616 E-.38568
G1 X143.121 Y142.616 E-.29616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.105 J-1.212 P1  F30000
G1 X109.652 Y139.708 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6549
G1 X109.714 Y140.218 E.01578
G1 X109.65 Y140.747 E.01638
G1 X109.461 Y141.246 E.01638
G1 X109.158 Y141.684 E.01638
G1 X108.759 Y142.038 E.01638
G1 X108.287 Y142.286 E.01638
G1 X107.769 Y142.413 E.01638
G1 X107.236 Y142.413 E.01638
G1 X106.719 Y142.286 E.01638
G1 X106.246 Y142.038 E.01638
G1 X105.847 Y141.684 E.01638
G1 X105.545 Y141.246 E.01638
G1 X105.355 Y140.747 E.01638
G1 X105.291 Y140.218 E.01638
G1 X105.355 Y139.689 E.01638
G1 X105.545 Y139.19 E.01638
G1 X105.847 Y138.751 E.01638
G1 X106.246 Y138.398 E.01638
G1 X106.719 Y138.15 E.01638
G1 X107.236 Y138.022 E.01638
G1 X107.769 Y138.022 E.01638
G1 X108.287 Y138.15 E.01638
G1 X108.759 Y138.398 E.01638
G1 X109.158 Y138.751 E.01638
G1 X109.461 Y139.19 E.01638
G1 X109.636 Y139.651 E.01514
M204 S10000
; WIPE_START
G1 F24000
G1 X109.714 Y140.218 E-.21752
G1 X109.65 Y140.747 E-.20259
G1 X109.461 Y141.246 E-.2026
G1 X109.256 Y141.543 E-.13729
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.914 J-.803 P1  F30000
G1 X106.15 Y138.006 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6549
G1 X106.022 Y138.073 E.00478
G1 X105.552 Y138.489 E.02084
G1 X105.276 Y138.888 E.01608
G1 X105.105 Y138.835 E.00596
G1 X105.105 Y137.82 E.03367
G1 X106.104 Y137.82 E.03314
G1 X106.135 Y137.947 E.00436
; WIPE_START
G1 F24000
G1 X106.022 Y138.073 E-.06419
G1 X105.552 Y138.489 E-.23878
G1 X105.276 Y138.888 E-.18419
G1 X105.105 Y138.835 E-.06829
G1 X105.105 Y138.297 E-.20454
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.18 J.298 P1  F30000
G1 X106.15 Y142.43 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F6549
G1 X106.104 Y142.616 E.00635
G1 X105.105 Y142.616 E.03314
G1 X105.105 Y141.601 E.03367
G1 X105.276 Y141.547 E.00596
G1 X105.552 Y141.946 E.01608
G1 X106.022 Y142.363 E.02084
G1 X106.097 Y142.402 E.00279
; WIPE_START
G1 F24000
G1 X106.104 Y142.616 E-.08125
G1 X105.105 Y142.616 E-.37968
G1 X105.105 Y141.829 E-.29907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.037 J1.216 P1  F30000
G1 X144.293 Y143.008 Z2.6
G1 Z2.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6549
G1 X104.713 Y143.008 E1.21618
G1 X104.713 Y137.428 E.17146
G1 X144.293 Y137.428 E1.21618
G1 X144.293 Y142.948 E.16961
M204 S10000
G1 X143.533 Y142.412 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151053
G1 F6549
G1 X143.684 Y142.015 E.00375
G1 X143.865 Y141.384 F30000
; LINE_WIDTH: 0.43449
G1 F6549
G1 X143.899 Y141.203 E.00588
; LINE_WIDTH: 0.391801
G1 X143.932 Y141.022 E.00524
; LINE_WIDTH: 0.349113
G1 X143.965 Y140.841 E.00459
; LINE_WIDTH: 0.306424
G1 X143.969 Y140.81 E.00068
; LINE_WIDTH: 0.298796
G1 X143.986 Y140.519 E.00607
; LINE_WIDTH: 0.261158
G2 X144.004 Y140.207 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X143.986 Y139.916 E.0044
; LINE_WIDTH: 0.267101
G2 X143.965 Y139.595 I-2.649 J.015 E.00589
; LINE_WIDTH: 0.306424
G1 X143.932 Y139.413 E.00395
; LINE_WIDTH: 0.349112
G1 X143.899 Y139.232 E.00459
; LINE_WIDTH: 0.3918
G1 X143.865 Y139.051 E.00524
G1 X143.684 Y138.421 F30000
; LINE_WIDTH: 0.141571
G1 F6549
G1 X143.533 Y138.023 E.00342
G1 X142.692 Y137.851 F30000
; LINE_WIDTH: 0.405157
G1 F6549
G1 X142.398 Y137.797 E.00881
; LINE_WIDTH: 0.389446
G1 X142.205 Y137.774 E.00551
; LINE_WIDTH: 0.342434
G1 X142.011 Y137.75 E.00476
; LINE_WIDTH: 0.257331
G2 X141.793 Y137.725 I-.317 J1.798 E.00384
G2 X141.188 Y137.727 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X140.994 Y137.75 E.00327
; LINE_WIDTH: 0.295421
G1 X140.801 Y137.774 E.00401
; LINE_WIDTH: 0.342433
G1 X140.607 Y137.797 E.00476
; LINE_WIDTH: 0.389446
G1 X140.314 Y137.851 E.00842
G1 X139.691 Y138.023 F30000
; LINE_WIDTH: 0.134453
G1 F6549
G1 X139.529 Y138.206 E.00182
G1 X138.987 Y138.191 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6549
G1 X139.095 Y138.287 E.0048
G1 X138.875 Y138.867 E.02056
G2 X138.875 Y141.569 I2.593 J1.351 E.09319
G1 X139.095 Y142.149 E.02056
G1 X139.007 Y142.267 E.0049
G1 X109.973 Y142.267 E.96312
G1 X110.004 Y142.232 E.00157
G1 X109.91 Y142.149 E.00417
G1 X110.393 Y140.772 E.04838
G2 X110.13 Y138.867 I-3.137 J-.539 E.06483
G1 X109.91 Y138.287 E.02056
G1 X110.004 Y138.204 E.00417
G1 X109.973 Y138.168 E.00157
G1 X138.978 Y138.168 E.96214
; WIPE_START
G1 F24000
G1 X136.978 Y138.168 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.744 J.963 P1  F30000
G1 X142.692 Y142.585 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.405156
G1 F6549
G1 X142.398 Y142.639 E.00881
; LINE_WIDTH: 0.389444
G1 X142.205 Y142.662 E.00551
; LINE_WIDTH: 0.342433
G1 X142.011 Y142.686 E.00476
; LINE_WIDTH: 0.257331
G3 X141.793 Y142.711 I-.317 J-1.798 E.00384
G3 X141.188 Y142.709 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X140.994 Y142.686 E.00327
; LINE_WIDTH: 0.295422
G1 X140.801 Y142.662 E.00401
; LINE_WIDTH: 0.342434
G1 X140.607 Y142.639 E.00476
; LINE_WIDTH: 0.389444
G1 X140.314 Y142.585 E.00842
G1 X139.691 Y142.412 F30000
; LINE_WIDTH: 0.134453
G1 F6549
G1 X139.529 Y142.23 E.00182
G1 X136.584 Y141.86 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6549
G1 X138.212 Y141.86 E.05401
G1 X138.457 Y141.615 E.01151
G3 X138.457 Y138.821 I2.792 J-1.397 E.09611
G1 X138.212 Y138.575 E.01151
G1 X133.821 Y138.575 E.14565
G1 X130.536 Y141.86 E.15411
G1 X133.821 Y141.86 E.10897
G1 X130.536 Y138.575 E.15411
G1 X126.145 Y138.575 E.14565
G1 X122.86 Y141.86 E.15411
G1 X126.145 Y141.86 E.10897
G1 X122.86 Y138.575 E.15411
G1 X121.232 Y138.575 E.05401
G1 X120.098 Y141.86 F30000
G1 F6549
G1 X118.469 Y141.86 E.05401
G1 X115.184 Y138.575 E.15411
G1 X118.469 Y138.575 E.10897
G1 X115.184 Y141.86 E.15411
G1 X110.793 Y141.86 E.14565
G1 X110.548 Y141.615 E.01151
G2 X110.548 Y138.821 I-3.117 J-1.397 E.0955
G1 X110.793 Y138.575 E.01151
G1 X112.422 Y138.575 E.05401
G1 X109.477 Y138.206 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969209
G1 F6549
G1 X109.315 Y138.023 E.00107
G1 X108.692 Y137.851 F30000
; LINE_WIDTH: 0.405155
G1 F6549
G1 X108.398 Y137.797 E.00881
; LINE_WIDTH: 0.389444
G1 X108.205 Y137.774 E.00551
; LINE_WIDTH: 0.342433
G1 X108.011 Y137.75 E.00476
; LINE_WIDTH: 0.257331
G2 X107.793 Y137.725 I-.317 J1.798 E.00384
G2 X107.188 Y137.727 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X106.994 Y137.75 E.00327
; LINE_WIDTH: 0.295421
G1 X106.801 Y137.774 E.00401
; LINE_WIDTH: 0.342433
G1 X106.607 Y137.797 E.00476
; LINE_WIDTH: 0.389444
G1 X106.314 Y137.851 E.00842
G1 X105.473 Y138.023 F30000
; LINE_WIDTH: 0.151056
G1 F6549
G1 X105.321 Y138.421 E.00375
G1 X105.14 Y139.051 F30000
; LINE_WIDTH: 0.434489
G1 F6549
G1 X105.107 Y139.232 E.00588
; LINE_WIDTH: 0.391801
G1 X105.074 Y139.413 E.00524
; LINE_WIDTH: 0.349113
G1 X105.041 Y139.595 E.00459
; LINE_WIDTH: 0.306424
G1 X105.037 Y139.626 E.00068
; LINE_WIDTH: 0.298796
G1 X105.019 Y139.916 E.00607
; LINE_WIDTH: 0.261158
G2 X105.002 Y140.229 I2.576 J.302 E.00557
; LINE_WIDTH: 0.228538
G1 X105.019 Y140.519 E.0044
; LINE_WIDTH: 0.267101
G2 X105.041 Y140.841 I2.649 J-.015 E.00589
; LINE_WIDTH: 0.306424
G1 X105.074 Y141.022 E.00395
; LINE_WIDTH: 0.349112
G1 X105.107 Y141.203 E.00459
; LINE_WIDTH: 0.3918
G1 X105.14 Y141.384 E.00524
G1 X105.321 Y142.015 F30000
; LINE_WIDTH: 0.151054
G1 F6549
G1 X105.473 Y142.412 E.00375
G1 X106.314 Y142.585 F30000
; LINE_WIDTH: 0.389444
G1 F6549
G1 X106.607 Y142.639 E.00842
; LINE_WIDTH: 0.342433
M73 P88 R1
G1 X106.801 Y142.662 E.00476
; LINE_WIDTH: 0.295422
G1 X106.994 Y142.686 E.00401
; LINE_WIDTH: 0.24841
G1 X107.188 Y142.709 E.00327
; LINE_WIDTH: 0.257331
G2 X107.793 Y142.711 I.315 J-4.984 E.01058
G2 X108.011 Y142.686 I-.098 J-1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X108.205 Y142.662 E.00476
; LINE_WIDTH: 0.389444
G1 X108.398 Y142.639 E.00551
; LINE_WIDTH: 0.405156
G1 X108.692 Y142.585 E.00881
G1 X109.315 Y142.412 F30000
; LINE_WIDTH: 0.096921
G1 F6549
G1 X109.477 Y142.23 E.00107
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.315 Y142.412 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/15
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
G3 Z2.6 I.721 J.98 P1  F30000
G1 X136.503 Y122.406 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6549
G1 X136.376 Y122.473 E.00478
G1 X135.905 Y122.89 E.02084
G1 X135.548 Y123.407 E.02084
G1 X135.325 Y123.995 E.02084
G1 X135.25 Y124.618 E.02084
G1 X135.325 Y125.242 E.02084
G1 X135.548 Y125.83 E.02084
G1 X135.905 Y126.347 E.02084
G1 X136.376 Y126.763 E.02084
G1 X136.503 Y126.831 E.00478
G1 X136.457 Y127.016 E.00635
G1 X105.255 Y127.016 E1.03504
G1 X105.209 Y126.831 E.00635
G1 X105.337 Y126.763 E.00478
G1 X105.807 Y126.347 E.02084
G1 X106.164 Y125.83 E.02084
G1 X106.387 Y125.242 E.02084
G1 X106.463 Y124.618 E.02084
G1 X106.387 Y123.995 E.02084
G1 X106.164 Y123.407 E.02084
G1 X105.807 Y122.89 E.02084
G1 X105.337 Y122.473 E.02084
G1 X105.209 Y122.406 E.00478
G1 X105.255 Y122.22 E.00635
G1 X136.457 Y122.22 E1.03504
G1 X136.489 Y122.348 E.00436
; WIPE_START
G1 F24000
G1 X136.376 Y122.473 E-.06419
G1 X135.905 Y122.89 E-.23878
G1 X135.548 Y123.407 E-.23877
G1 X135.345 Y123.944 E-.21825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.038 J1.216 P1  F30000
G1 X140.003 Y124.088 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6549
G1 X140.003 Y124.089 E.00003
G1 X140.068 Y124.618 E.01638
G1 X140.003 Y125.148 E.01638
G1 X139.814 Y125.646 E.01638
G1 X139.512 Y126.085 E.01638
G1 X139.112 Y126.438 E.01638
G1 X138.64 Y126.686 E.01638
G1 X138.123 Y126.814 E.01638
G1 X137.59 Y126.814 E.01638
G1 X137.072 Y126.686 E.01638
G1 X136.6 Y126.438 E.01638
G1 X136.201 Y126.085 E.01638
G1 X135.898 Y125.646 E.01638
G1 X135.709 Y125.148 E.01638
G1 X135.645 Y124.618 E.01638
G1 X135.709 Y124.089 E.01638
G1 X135.898 Y123.591 E.01638
G1 X136.201 Y123.152 E.01638
G1 X136.6 Y122.798 E.01638
G1 X137.072 Y122.551 E.01638
G1 X137.59 Y122.423 E.01638
G1 X138.123 Y122.423 E.01638
G1 X138.64 Y122.551 E.01638
G1 X139.112 Y122.798 E.01638
G1 X139.512 Y123.152 E.01638
G1 X139.814 Y123.591 E.01638
G1 X139.982 Y124.032 E.01451
M204 S10000
G1 X140.083 Y123.289 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6549
G1 X139.807 Y122.89 E.01608
G1 X139.337 Y122.473 E.02084
G1 X139.209 Y122.406 E.00478
G1 X139.255 Y122.22 E.00635
G1 X140.254 Y122.22 E.03314
G1 X140.254 Y123.235 E.03367
G1 X140.14 Y123.271 E.00397
; WIPE_START
G1 F24000
G1 X139.807 Y122.89 E-.19221
G1 X139.337 Y122.473 E-.23878
G1 X139.209 Y122.406 E-.0548
G1 X139.255 Y122.22 E-.07271
G1 X139.785 Y122.22 E-.2015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.213 J.097 P1  F30000
G1 X140.083 Y125.948 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F6549
G1 X140.254 Y126.001 E.00596
G1 X140.254 Y127.016 E.03367
G1 X139.255 Y127.016 E.03314
G1 X139.209 Y126.831 E.00635
G1 X139.337 Y126.763 E.00478
G1 X139.807 Y126.347 E.02084
G1 X140.048 Y125.997 E.01409
; WIPE_START
G1 F24000
G1 X140.254 Y126.001 E-.07817
G1 X140.254 Y127.016 E-.38568
G1 X139.475 Y127.016 E-.29616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.105 J-1.212 P1  F30000
G1 X106.006 Y124.109 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6549
G1 X106.068 Y124.618 E.01576
G1 X106.003 Y125.148 E.01638
G1 X105.814 Y125.646 E.01638
G1 X105.512 Y126.085 E.01638
G1 X105.112 Y126.438 E.01638
G1 X104.64 Y126.686 E.01638
G1 X104.123 Y126.814 E.01638
G1 X103.59 Y126.814 E.01638
G1 X103.072 Y126.686 E.01638
G1 X102.6 Y126.438 E.01638
G1 X102.201 Y126.085 E.01638
G1 X101.898 Y125.646 E.01638
G1 X101.709 Y125.148 E.01638
G1 X101.645 Y124.618 E.01638
G1 X101.709 Y124.089 E.01638
G1 X101.898 Y123.591 E.01638
G1 X102.201 Y123.152 E.01638
G1 X102.6 Y122.798 E.01638
G1 X103.072 Y122.551 E.01638
G1 X103.59 Y122.423 E.01638
G1 X104.123 Y122.423 E.01638
G1 X104.64 Y122.551 E.01638
G1 X105.112 Y122.798 E.01638
G1 X105.512 Y123.152 E.01638
G1 X105.814 Y123.591 E.01638
G1 X105.989 Y124.052 E.01516
M204 S10000
; WIPE_START
G1 F24000
G1 X106.068 Y124.618 E-.21732
G1 X106.003 Y125.148 E-.20259
G1 X105.814 Y125.646 E-.2026
G1 X105.609 Y125.944 E-.13749
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.915 J-.803 P1  F30000
G1 X102.503 Y122.406 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6549
G1 X102.376 Y122.473 E.00478
G1 X101.905 Y122.89 E.02084
G1 X101.63 Y123.289 E.01608
G1 X101.458 Y123.235 E.00596
G1 X101.458 Y122.22 E.03367
G1 X102.457 Y122.22 E.03314
G1 X102.489 Y122.348 E.00436
; WIPE_START
G1 F24000
G1 X102.376 Y122.473 E-.06419
G1 X101.905 Y122.89 E-.23878
G1 X101.63 Y123.289 E-.18419
G1 X101.458 Y123.235 E-.06829
G1 X101.458 Y122.697 E-.20454
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.18 J.298 P1  F30000
G1 X102.503 Y126.831 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F6549
G1 X102.457 Y127.016 E.00635
G1 X101.458 Y127.016 E.03314
G1 X101.458 Y126.001 E.03367
G1 X101.63 Y125.948 E.00596
G1 X101.905 Y126.347 E.01608
G1 X102.376 Y126.763 E.02084
G1 X102.45 Y126.803 E.00279
; WIPE_START
G1 F24000
G1 X102.457 Y127.016 E-.08125
G1 X101.458 Y127.016 E-.37968
G1 X101.458 Y126.229 E-.29907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.037 J1.216 P1  F30000
G1 X140.646 Y127.408 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6549
G1 X101.066 Y127.408 E1.21618
G1 X101.066 Y121.828 E.17146
G1 X140.646 Y121.828 E1.21618
G1 X140.646 Y127.348 E.16961
M204 S10000
G1 X139.886 Y126.813 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151053
G1 F6549
G1 X140.038 Y126.415 E.00375
G1 X140.219 Y125.785 F30000
; LINE_WIDTH: 0.434489
G1 F6549
G1 X140.252 Y125.604 E.00588
; LINE_WIDTH: 0.391801
G1 X140.285 Y125.423 E.00524
; LINE_WIDTH: 0.349113
G1 X140.318 Y125.242 E.00459
; LINE_WIDTH: 0.306424
G1 X140.322 Y125.21 E.00068
; LINE_WIDTH: 0.298796
G1 X140.34 Y124.92 E.00607
; LINE_WIDTH: 0.261158
G2 X140.357 Y124.607 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X140.34 Y124.317 E.0044
; LINE_WIDTH: 0.267101
G2 X140.318 Y123.995 I-2.649 J.015 E.00589
; LINE_WIDTH: 0.306424
G1 X140.285 Y123.814 E.00395
; LINE_WIDTH: 0.349112
G1 X140.252 Y123.633 E.00459
; LINE_WIDTH: 0.3918
G1 X140.219 Y123.452 E.00524
G1 X140.038 Y122.822 F30000
; LINE_WIDTH: 0.141574
G1 F6549
G1 X139.886 Y122.424 E.00342
G1 X139.045 Y122.252 F30000
; LINE_WIDTH: 0.405155
G1 F6549
G1 X138.752 Y122.198 E.00881
; LINE_WIDTH: 0.389444
G1 X138.558 Y122.174 E.00551
; LINE_WIDTH: 0.342433
G1 X138.365 Y122.151 E.00476
; LINE_WIDTH: 0.257331
G2 X138.147 Y122.126 I-.316 J1.798 E.00384
G2 X137.541 Y122.127 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X137.348 Y122.151 E.00327
; LINE_WIDTH: 0.295421
G1 X137.154 Y122.174 E.00401
; LINE_WIDTH: 0.342433
G1 X136.96 Y122.198 E.00476
; LINE_WIDTH: 0.389446
G1 X136.667 Y122.252 E.00842
G1 X136.044 Y122.424 F30000
; LINE_WIDTH: 0.13445
G1 F6549
G1 X135.882 Y122.606 E.00182
G1 X135.34 Y122.592 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6549
G1 X135.449 Y122.688 E.0048
G1 X135.229 Y123.267 E.02056
G2 X135.229 Y125.97 I2.593 J1.351 E.09319
G1 X135.449 Y126.549 E.02056
G1 X135.361 Y126.668 E.0049
G1 X106.327 Y126.668 E.96312
G1 X106.358 Y126.633 E.00157
G1 X106.264 Y126.549 E.00417
G1 X106.746 Y125.173 E.04838
G2 X106.484 Y123.267 I-3.137 J-.539 E.06483
G1 X106.264 Y122.688 E.02056
G1 X106.358 Y122.604 E.00417
G1 X106.327 Y122.569 E.00157
G1 X135.331 Y122.569 E.96214
; WIPE_START
G1 F24000
G1 X133.331 Y122.569 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.744 J.963 P1  F30000
G1 X139.045 Y126.985 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.405156
G1 F6549
G1 X138.752 Y127.039 E.00881
; LINE_WIDTH: 0.389444
G1 X138.558 Y127.063 E.00551
; LINE_WIDTH: 0.342433
G1 X138.365 Y127.086 E.00476
; LINE_WIDTH: 0.257331
G3 X138.147 Y127.111 I-.317 J-1.798 E.00384
G3 X137.541 Y127.11 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X137.348 Y127.086 E.00327
; LINE_WIDTH: 0.295422
G1 X137.154 Y127.063 E.00401
; LINE_WIDTH: 0.342434
G1 X136.96 Y127.039 E.00476
; LINE_WIDTH: 0.389444
G1 X136.667 Y126.985 E.00842
G1 X136.044 Y126.813 F30000
; LINE_WIDTH: 0.134453
G1 F6549
G1 X135.882 Y126.63 E.00182
G1 X132.937 Y126.261 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6549
G1 X134.566 Y126.261 E.05401
G1 X134.811 Y126.016 E.01151
G3 X134.811 Y123.221 I2.792 J-1.397 E.09611
G1 X134.566 Y122.976 E.01151
G1 X130.175 Y122.976 E.14565
G1 X126.89 Y126.261 E.15411
G1 X130.175 Y126.261 E.10897
G1 X126.89 Y122.976 E.15411
G1 X122.499 Y122.976 E.14565
G1 X119.214 Y126.261 E.15411
G1 X122.499 Y126.261 E.10897
G1 X119.214 Y122.976 E.15411
G1 X117.585 Y122.976 E.05401
G1 X116.451 Y126.261 F30000
G1 F6549
G1 X114.823 Y126.261 E.05401
G1 X111.538 Y122.976 E.15411
G1 X114.823 Y122.976 E.10897
G1 X111.538 Y126.261 E.15411
G1 X107.147 Y126.261 E.14565
G1 X106.901 Y126.016 E.01151
G2 X106.901 Y123.221 I-3.117 J-1.397 E.0955
G1 X107.147 Y122.976 E.01151
G1 X108.775 Y122.976 E.05401
G1 X105.83 Y122.607 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969209
G1 F6549
G1 X105.668 Y122.424 E.00107
G1 X105.045 Y122.252 F30000
; LINE_WIDTH: 0.405155
G1 F6549
G1 X104.752 Y122.198 E.00881
; LINE_WIDTH: 0.389444
G1 X104.558 Y122.174 E.00551
; LINE_WIDTH: 0.342433
G1 X104.365 Y122.151 E.00476
; LINE_WIDTH: 0.257331
G2 X104.147 Y122.126 I-.317 J1.798 E.00384
G2 X103.541 Y122.127 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X103.348 Y122.151 E.00327
; LINE_WIDTH: 0.295421
G1 X103.154 Y122.174 E.00401
; LINE_WIDTH: 0.342433
G1 X102.96 Y122.198 E.00476
; LINE_WIDTH: 0.389444
G1 X102.667 Y122.252 E.00842
G1 X101.826 Y122.424 F30000
; LINE_WIDTH: 0.151056
G1 F6549
G1 X101.675 Y122.822 E.00375
G1 X101.494 Y123.452 F30000
; LINE_WIDTH: 0.434489
G1 F6549
G1 X101.46 Y123.633 E.00588
; LINE_WIDTH: 0.391801
G1 X101.427 Y123.814 E.00524
; LINE_WIDTH: 0.349113
G1 X101.394 Y123.995 E.00459
; LINE_WIDTH: 0.306424
G1 X101.39 Y124.026 E.00068
; LINE_WIDTH: 0.298796
G1 X101.373 Y124.317 E.00607
; LINE_WIDTH: 0.261158
G2 X101.355 Y124.63 I2.576 J.302 E.00557
; LINE_WIDTH: 0.228538
G1 X101.373 Y124.92 E.0044
; LINE_WIDTH: 0.267101
G2 X101.394 Y125.242 I2.649 J-.015 E.00589
; LINE_WIDTH: 0.306424
G1 X101.427 Y125.423 E.00395
; LINE_WIDTH: 0.349112
G1 X101.46 Y125.604 E.00459
; LINE_WIDTH: 0.3918
G1 X101.494 Y125.785 E.00524
G1 X101.675 Y126.415 F30000
; LINE_WIDTH: 0.151054
G1 F6549
G1 X101.826 Y126.813 E.00375
G1 X102.667 Y126.985 F30000
; LINE_WIDTH: 0.389442
G1 F6549
G1 X102.96 Y127.039 E.00842
; LINE_WIDTH: 0.342433
G1 X103.154 Y127.063 E.00476
; LINE_WIDTH: 0.295422
G1 X103.348 Y127.086 E.00401
; LINE_WIDTH: 0.24841
G1 X103.541 Y127.11 E.00327
; LINE_WIDTH: 0.257331
G2 X104.147 Y127.111 I.315 J-4.984 E.01058
G2 X104.365 Y127.086 I-.098 J-1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X104.558 Y127.063 E.00476
; LINE_WIDTH: 0.389444
G1 X104.752 Y127.039 E.00551
; LINE_WIDTH: 0.405156
G1 X105.045 Y126.985 E.00881
G1 X105.668 Y126.813 F30000
; LINE_WIDTH: 0.096921
G1 F6549
G1 X105.83 Y126.63 E.00107
; WIPE_START
G1 F24000
G1 X105.668 Y126.813 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.376 J1.158 P1  F30000
G1 X140.15 Y138.006 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6549
G1 X140.022 Y138.073 E.00478
G1 X139.552 Y138.489 E.02084
G1 X139.195 Y139.007 E.02084
G1 X138.972 Y139.594 E.02084
G1 X138.896 Y140.218 E.02084
G1 X138.972 Y140.842 E.02084
G1 X139.195 Y141.429 E.02084
G1 X139.552 Y141.946 E.02084
G1 X140.022 Y142.363 E.02084
G1 X140.15 Y142.43 E.00478
G1 X140.104 Y142.616 E.00635
G1 X108.901 Y142.616 E1.03504
G1 X108.856 Y142.43 E.00635
G1 X108.983 Y142.363 E.00478
G1 X109.454 Y141.946 E.02084
G1 X109.811 Y141.429 E.02084
G1 X110.033 Y140.842 E.02084
G1 X110.109 Y140.218 E.02084
G1 X110.033 Y139.594 E.02084
G1 X109.811 Y139.007 E.02084
G1 X109.454 Y138.489 E.02084
G1 X108.983 Y138.073 E.02084
G1 X108.856 Y138.006 E.00478
G1 X108.901 Y137.82 E.00635
G1 X140.104 Y137.82 E1.03504
G1 X140.135 Y137.947 E.00436
; WIPE_START
G1 F24000
G1 X140.022 Y138.073 E-.06419
G1 X139.552 Y138.489 E-.23878
G1 X139.195 Y139.007 E-.23877
G1 X138.991 Y139.544 E-.21825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.038 J1.216 P1  F30000
G1 X143.65 Y139.688 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6549
G1 X143.65 Y139.689 E.00003
G1 X143.714 Y140.218 E.01638
G1 X143.65 Y140.747 E.01638
G1 X143.461 Y141.246 E.01638
G1 X143.158 Y141.684 E.01638
G1 X142.759 Y142.038 E.01638
G1 X142.287 Y142.286 E.01638
G1 X141.769 Y142.413 E.01638
G1 X141.236 Y142.413 E.01638
G1 X140.719 Y142.286 E.01638
G1 X140.246 Y142.038 E.01638
G1 X139.847 Y141.684 E.01638
G1 X139.545 Y141.246 E.01638
G1 X139.355 Y140.747 E.01638
G1 X139.291 Y140.218 E.01638
G1 X139.355 Y139.689 E.01638
G1 X139.545 Y139.19 E.01638
G1 X139.847 Y138.751 E.01638
G1 X140.246 Y138.398 E.01638
G1 X140.719 Y138.15 E.01638
G1 X141.236 Y138.022 E.01638
G1 X141.769 Y138.022 E.01638
G1 X142.287 Y138.15 E.01638
G1 X142.759 Y138.398 E.01638
G1 X143.158 Y138.751 E.01638
G1 X143.461 Y139.19 E.01638
G1 X143.628 Y139.631 E.01451
M204 S10000
M73 P89 R1
G1 X143.729 Y138.888 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6549
G1 X143.454 Y138.489 E.01608
G1 X142.983 Y138.073 E.02084
G1 X142.856 Y138.006 E.00478
G1 X142.901 Y137.82 E.00635
G1 X143.901 Y137.82 E.03314
G1 X143.901 Y138.835 E.03367
G1 X143.786 Y138.87 E.00397
; WIPE_START
G1 F24000
G1 X143.454 Y138.489 E-.19221
G1 X142.983 Y138.073 E-.23878
G1 X142.856 Y138.006 E-.0548
G1 X142.901 Y137.82 E-.07271
G1 X143.432 Y137.82 E-.2015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.213 J.097 P1  F30000
G1 X143.729 Y141.547 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F6549
G1 X143.901 Y141.601 E.00596
G1 X143.901 Y142.616 E.03367
G1 X142.901 Y142.616 E.03314
G1 X142.856 Y142.43 E.00635
G1 X142.983 Y142.363 E.00478
G1 X143.454 Y141.946 E.02084
G1 X143.695 Y141.597 E.01409
; WIPE_START
G1 F24000
G1 X143.901 Y141.601 E-.07817
G1 X143.901 Y142.616 E-.38568
G1 X143.121 Y142.616 E-.29616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.105 J-1.212 P1  F30000
G1 X109.652 Y139.709 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6549
G1 X109.714 Y140.218 E.01576
G1 X109.65 Y140.747 E.01638
G1 X109.461 Y141.246 E.01638
G1 X109.158 Y141.684 E.01638
G1 X108.759 Y142.038 E.01638
G1 X108.287 Y142.286 E.01638
G1 X107.769 Y142.413 E.01638
G1 X107.236 Y142.413 E.01638
G1 X106.719 Y142.286 E.01638
G1 X106.246 Y142.038 E.01638
G1 X105.847 Y141.684 E.01638
G1 X105.545 Y141.246 E.01638
G1 X105.355 Y140.747 E.01638
G1 X105.291 Y140.218 E.01638
G1 X105.355 Y139.689 E.01638
G1 X105.545 Y139.19 E.01638
G1 X105.847 Y138.751 E.01638
G1 X106.246 Y138.398 E.01638
G1 X106.719 Y138.15 E.01638
G1 X107.236 Y138.022 E.01638
G1 X107.769 Y138.022 E.01638
G1 X108.287 Y138.15 E.01638
G1 X108.759 Y138.398 E.01638
G1 X109.158 Y138.751 E.01638
G1 X109.461 Y139.19 E.01638
G1 X109.636 Y139.651 E.01516
M204 S10000
; WIPE_START
G1 F24000
G1 X109.714 Y140.218 E-.21732
G1 X109.65 Y140.747 E-.20259
G1 X109.461 Y141.246 E-.2026
G1 X109.255 Y141.543 E-.13749
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.915 J-.803 P1  F30000
G1 X106.15 Y138.006 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6549
G1 X106.022 Y138.073 E.00478
G1 X105.552 Y138.489 E.02084
G1 X105.276 Y138.888 E.01608
G1 X105.105 Y138.835 E.00596
G1 X105.105 Y137.82 E.03367
G1 X106.104 Y137.82 E.03314
G1 X106.135 Y137.947 E.00436
; WIPE_START
G1 F24000
G1 X106.022 Y138.073 E-.06419
G1 X105.552 Y138.489 E-.23878
G1 X105.276 Y138.888 E-.18419
G1 X105.105 Y138.835 E-.06829
G1 X105.105 Y138.297 E-.20454
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.18 J.298 P1  F30000
G1 X106.15 Y142.43 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F6549
G1 X106.104 Y142.616 E.00635
G1 X105.105 Y142.616 E.03314
G1 X105.105 Y141.601 E.03367
G1 X105.276 Y141.547 E.00596
G1 X105.552 Y141.946 E.01608
G1 X106.022 Y142.363 E.02084
G1 X106.097 Y142.402 E.00279
; WIPE_START
G1 F24000
G1 X106.104 Y142.616 E-.08125
G1 X105.105 Y142.616 E-.37968
G1 X105.105 Y141.829 E-.29907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.037 J1.216 P1  F30000
G1 X144.293 Y143.008 Z2.8
G1 Z2.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6549
G1 X104.713 Y143.008 E1.21618
G1 X104.713 Y137.428 E.17146
G1 X144.293 Y137.428 E1.21618
G1 X144.293 Y142.948 E.16961
M204 S10000
G1 X143.533 Y142.412 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151053
G1 F6549
G1 X143.684 Y142.015 E.00375
G1 X143.865 Y141.384 F30000
; LINE_WIDTH: 0.434489
G1 F6549
G1 X143.899 Y141.203 E.00588
; LINE_WIDTH: 0.391801
G1 X143.932 Y141.022 E.00524
; LINE_WIDTH: 0.349113
G1 X143.965 Y140.841 E.00459
; LINE_WIDTH: 0.306424
G1 X143.969 Y140.81 E.00068
; LINE_WIDTH: 0.298796
G1 X143.986 Y140.519 E.00607
; LINE_WIDTH: 0.261158
G2 X144.004 Y140.207 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X143.986 Y139.916 E.0044
; LINE_WIDTH: 0.267101
G2 X143.965 Y139.595 I-2.649 J.015 E.00589
; LINE_WIDTH: 0.306424
G1 X143.932 Y139.413 E.00395
; LINE_WIDTH: 0.349112
G1 X143.899 Y139.232 E.00459
; LINE_WIDTH: 0.3918
G1 X143.865 Y139.051 E.00524
G1 X143.684 Y138.421 F30000
; LINE_WIDTH: 0.141574
G1 F6549
G1 X143.533 Y138.023 E.00342
G1 X142.692 Y137.851 F30000
; LINE_WIDTH: 0.405155
G1 F6549
G1 X142.398 Y137.797 E.00881
; LINE_WIDTH: 0.389444
G1 X142.205 Y137.774 E.00551
; LINE_WIDTH: 0.342433
G1 X142.011 Y137.75 E.00476
; LINE_WIDTH: 0.257331
G2 X141.793 Y137.725 I-.316 J1.798 E.00384
G2 X141.188 Y137.727 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X140.994 Y137.75 E.00327
; LINE_WIDTH: 0.295421
G1 X140.801 Y137.774 E.00401
; LINE_WIDTH: 0.342433
G1 X140.607 Y137.797 E.00476
; LINE_WIDTH: 0.389446
G1 X140.314 Y137.851 E.00842
G1 X139.691 Y138.023 F30000
; LINE_WIDTH: 0.13445
G1 F6549
G1 X139.529 Y138.206 E.00182
G1 X138.987 Y138.191 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6549
G1 X139.095 Y138.287 E.0048
G1 X138.875 Y138.867 E.02056
G2 X138.875 Y141.569 I2.593 J1.351 E.09319
G1 X139.095 Y142.149 E.02056
G1 X139.007 Y142.267 E.0049
G1 X109.973 Y142.267 E.96312
G1 X110.004 Y142.232 E.00157
G1 X109.91 Y142.149 E.00417
G1 X110.393 Y140.772 E.04838
G2 X110.13 Y138.867 I-3.137 J-.539 E.06483
G1 X109.91 Y138.287 E.02056
G1 X110.004 Y138.204 E.00417
G1 X109.973 Y138.168 E.00157
G1 X138.978 Y138.168 E.96214
; WIPE_START
G1 F24000
G1 X136.978 Y138.168 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.744 J.963 P1  F30000
G1 X142.692 Y142.585 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.405156
G1 F6549
G1 X142.398 Y142.639 E.00881
; LINE_WIDTH: 0.389444
G1 X142.205 Y142.662 E.00551
; LINE_WIDTH: 0.342433
G1 X142.011 Y142.686 E.00476
; LINE_WIDTH: 0.257331
G3 X141.793 Y142.711 I-.317 J-1.798 E.00384
G3 X141.188 Y142.709 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X140.994 Y142.686 E.00327
; LINE_WIDTH: 0.295422
G1 X140.801 Y142.662 E.00401
; LINE_WIDTH: 0.342434
G1 X140.607 Y142.639 E.00476
; LINE_WIDTH: 0.389444
G1 X140.314 Y142.585 E.00842
G1 X139.691 Y142.412 F30000
; LINE_WIDTH: 0.134453
G1 F6549
G1 X139.529 Y142.23 E.00182
G1 X136.584 Y141.86 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6549
G1 X138.212 Y141.86 E.05401
G1 X138.457 Y141.615 E.01151
G3 X138.457 Y138.821 I2.792 J-1.397 E.09611
G1 X138.212 Y138.575 E.01151
G1 X133.821 Y138.575 E.14565
G1 X130.536 Y141.86 E.15411
G1 X133.821 Y141.86 E.10897
G1 X130.536 Y138.575 E.15411
G1 X126.145 Y138.575 E.14565
G1 X122.86 Y141.86 E.15411
G1 X126.145 Y141.86 E.10897
G1 X122.86 Y138.575 E.15411
G1 X121.232 Y138.575 E.05401
G1 X120.098 Y141.86 F30000
G1 F6549
G1 X118.469 Y141.86 E.05401
G1 X115.184 Y138.575 E.15411
G1 X118.469 Y138.575 E.10897
G1 X115.184 Y141.86 E.15411
G1 X110.793 Y141.86 E.14565
G1 X110.548 Y141.615 E.01151
G2 X110.548 Y138.821 I-3.117 J-1.397 E.0955
G1 X110.793 Y138.575 E.01151
G1 X112.422 Y138.575 E.05401
G1 X109.477 Y138.206 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969209
G1 F6549
G1 X109.315 Y138.023 E.00107
G1 X108.692 Y137.851 F30000
; LINE_WIDTH: 0.405155
G1 F6549
G1 X108.398 Y137.797 E.00881
; LINE_WIDTH: 0.389444
G1 X108.205 Y137.774 E.00551
; LINE_WIDTH: 0.342433
G1 X108.011 Y137.75 E.00476
; LINE_WIDTH: 0.257331
G2 X107.793 Y137.725 I-.317 J1.798 E.00384
G2 X107.188 Y137.727 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X106.994 Y137.75 E.00327
; LINE_WIDTH: 0.295421
G1 X106.801 Y137.774 E.00401
; LINE_WIDTH: 0.342433
G1 X106.607 Y137.797 E.00476
; LINE_WIDTH: 0.389444
G1 X106.314 Y137.851 E.00842
G1 X105.473 Y138.023 F30000
; LINE_WIDTH: 0.151056
G1 F6549
G1 X105.321 Y138.421 E.00375
G1 X105.14 Y139.051 F30000
; LINE_WIDTH: 0.434489
G1 F6549
G1 X105.107 Y139.232 E.00588
; LINE_WIDTH: 0.391801
G1 X105.074 Y139.413 E.00524
; LINE_WIDTH: 0.349113
G1 X105.041 Y139.595 E.00459
; LINE_WIDTH: 0.306424
G1 X105.037 Y139.626 E.00068
; LINE_WIDTH: 0.298796
G1 X105.019 Y139.916 E.00607
; LINE_WIDTH: 0.261158
G2 X105.002 Y140.229 I2.576 J.302 E.00557
; LINE_WIDTH: 0.228538
G1 X105.019 Y140.519 E.0044
; LINE_WIDTH: 0.267101
G2 X105.041 Y140.841 I2.649 J-.015 E.00589
; LINE_WIDTH: 0.306424
G1 X105.074 Y141.022 E.00395
; LINE_WIDTH: 0.349112
G1 X105.107 Y141.203 E.00459
; LINE_WIDTH: 0.3918
G1 X105.14 Y141.384 E.00524
G1 X105.321 Y142.015 F30000
; LINE_WIDTH: 0.151054
G1 F6549
G1 X105.473 Y142.412 E.00375
G1 X106.314 Y142.585 F30000
; LINE_WIDTH: 0.389442
G1 F6549
G1 X106.607 Y142.639 E.00842
; LINE_WIDTH: 0.342433
G1 X106.801 Y142.662 E.00476
; LINE_WIDTH: 0.295422
G1 X106.994 Y142.686 E.00401
; LINE_WIDTH: 0.24841
G1 X107.188 Y142.709 E.00327
; LINE_WIDTH: 0.257331
G2 X107.793 Y142.711 I.315 J-4.984 E.01058
G2 X108.011 Y142.686 I-.098 J-1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X108.205 Y142.662 E.00476
; LINE_WIDTH: 0.389444
G1 X108.398 Y142.639 E.00551
; LINE_WIDTH: 0.405156
G1 X108.692 Y142.585 E.00881
G1 X109.315 Y142.412 F30000
; LINE_WIDTH: 0.096921
G1 F6549
G1 X109.477 Y142.23 E.00107
M106 S242.25
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.315 Y142.412 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/15
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
G3 Z2.8 I.721 J.98 P1  F30000
G1 X136.503 Y122.406 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X136.376 Y122.473 E.00478
G1 X135.905 Y122.89 E.02084
G1 X135.548 Y123.407 E.02084
G1 X135.325 Y123.995 E.02084
G1 X135.25 Y124.618 E.02084
G1 X135.325 Y125.242 E.02084
G1 X135.548 Y125.83 E.02084
G1 X135.905 Y126.347 E.02084
G1 X136.376 Y126.763 E.02084
G1 X136.503 Y126.831 E.00478
G1 X136.457 Y127.016 E.00635
G1 X105.255 Y127.016 E1.03504
G1 X105.209 Y126.831 E.00635
G1 X105.337 Y126.763 E.00478
G1 X105.807 Y126.347 E.02084
G1 X106.164 Y125.83 E.02084
G1 X106.387 Y125.242 E.02084
G1 X106.463 Y124.618 E.02084
G1 X106.387 Y123.995 E.02084
G1 X106.164 Y123.407 E.02084
G1 X105.807 Y122.89 E.02084
G1 X105.337 Y122.473 E.02084
G1 X105.209 Y122.406 E.00478
G1 X105.255 Y122.22 E.00635
G1 X136.457 Y122.22 E1.03504
G1 X136.489 Y122.348 E.00436
; WIPE_START
G1 F24000
G1 X136.376 Y122.473 E-.06419
G1 X135.905 Y122.89 E-.23878
G1 X135.548 Y123.407 E-.23877
G1 X135.345 Y123.944 E-.21825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.037 J1.216 P1  F30000
G1 X140.003 Y124.088 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X140.003 Y124.089 E.00005
G1 X140.068 Y124.618 E.01638
G1 X140.003 Y125.148 E.01638
G1 X139.814 Y125.646 E.01638
G1 X139.512 Y126.085 E.01638
G1 X139.112 Y126.438 E.01638
G1 X138.64 Y126.686 E.01638
G1 X138.123 Y126.814 E.01638
G1 X137.59 Y126.814 E.01638
G1 X137.072 Y126.686 E.01638
G1 X136.6 Y126.438 E.01638
G1 X136.201 Y126.085 E.01638
G1 X135.898 Y125.646 E.01638
G1 X135.709 Y125.148 E.01638
G1 X135.645 Y124.618 E.01638
G1 X135.709 Y124.089 E.01638
G1 X135.898 Y123.591 E.01638
G1 X136.201 Y123.152 E.01638
G1 X136.6 Y122.798 E.01638
G1 X137.072 Y122.551 E.01638
G1 X137.59 Y122.423 E.01638
G1 X138.123 Y122.423 E.01638
G1 X138.64 Y122.551 E.01638
G1 X139.112 Y122.798 E.01638
G1 X139.512 Y123.152 E.01638
G1 X139.814 Y123.591 E.01638
G1 X139.982 Y124.031 E.01449
M204 S10000
G1 X140.083 Y123.289 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.807 Y122.89 E.01608
G1 X139.337 Y122.473 E.02084
G1 X139.209 Y122.406 E.00478
G1 X139.255 Y122.22 E.00635
G1 X140.254 Y122.22 E.03314
G1 X140.254 Y123.235 E.03367
G1 X140.14 Y123.271 E.00397
; WIPE_START
G1 F24000
G1 X139.807 Y122.89 E-.19221
G1 X139.337 Y122.473 E-.23878
G1 X139.209 Y122.406 E-.0548
G1 X139.255 Y122.22 E-.07271
G1 X139.785 Y122.22 E-.2015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.213 J.097 P1  F30000
G1 X140.083 Y125.948 Z3
G1 Z2.6
G1 E.8 F1800
G1 F15476.087
G1 X140.254 Y126.001 E.00596
G1 X140.254 Y127.016 E.03367
G1 X139.255 Y127.016 E.03314
G1 X139.209 Y126.831 E.00635
G1 X139.337 Y126.763 E.00478
G1 X139.807 Y126.347 E.02084
G1 X140.048 Y125.997 E.01409
; WIPE_START
G1 F24000
G1 X140.254 Y126.001 E-.07817
G1 X140.254 Y127.016 E-.38568
G1 X139.475 Y127.016 E-.29616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.105 J-1.212 P1  F30000
G1 X106.006 Y124.11 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.068 Y124.618 E.01575
G1 X106.003 Y125.148 E.01638
G1 X105.814 Y125.646 E.01638
G1 X105.512 Y126.085 E.01638
G1 X105.112 Y126.438 E.01638
G1 X104.64 Y126.686 E.01638
G1 X104.123 Y126.814 E.01638
G1 X103.59 Y126.814 E.01638
G1 X103.072 Y126.686 E.01638
G1 X102.6 Y126.438 E.01638
G1 X102.201 Y126.085 E.01638
G1 X101.898 Y125.646 E.01638
G1 X101.709 Y125.148 E.01638
G1 X101.645 Y124.618 E.01638
G1 X101.709 Y124.089 E.01638
G1 X101.898 Y123.591 E.01638
G1 X102.201 Y123.152 E.01638
G1 X102.6 Y122.798 E.01638
G1 X103.072 Y122.551 E.01638
G1 X103.59 Y122.423 E.01638
G1 X104.123 Y122.423 E.01638
G1 X104.64 Y122.551 E.01638
G1 X105.112 Y122.798 E.01638
G1 X105.512 Y123.152 E.01638
G1 X105.814 Y123.591 E.01638
G1 X105.99 Y124.052 E.01517
M204 S10000
; WIPE_START
G1 F24000
G1 X106.068 Y124.618 E-.21713
G1 X106.003 Y125.148 E-.20259
G1 X105.814 Y125.646 E-.2026
G1 X105.609 Y125.944 E-.13768
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.915 J-.803 P1  F30000
G1 X102.503 Y122.406 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X102.376 Y122.473 E.00478
G1 X101.905 Y122.89 E.02084
G1 X101.63 Y123.289 E.01608
G1 X101.458 Y123.235 E.00596
G1 X101.458 Y122.22 E.03367
G1 X102.457 Y122.22 E.03314
G1 X102.489 Y122.348 E.00436
; WIPE_START
G1 F24000
G1 X102.376 Y122.473 E-.06419
G1 X101.905 Y122.89 E-.23878
G1 X101.63 Y123.289 E-.18419
G1 X101.458 Y123.235 E-.06829
G1 X101.458 Y122.697 E-.20454
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.18 J.298 P1  F30000
G1 X102.503 Y126.831 Z3
G1 Z2.6
G1 E.8 F1800
G1 F15476.087
G1 X102.457 Y127.016 E.00635
G1 X101.458 Y127.016 E.03314
G1 X101.458 Y126.001 E.03367
G1 X101.63 Y125.948 E.00596
G1 X101.905 Y126.347 E.01608
G1 X102.376 Y126.763 E.02084
G1 X102.45 Y126.803 E.00279
; WIPE_START
G1 F24000
G1 X102.457 Y127.016 E-.08125
G1 X101.458 Y127.016 E-.37968
G1 X101.458 Y126.229 E-.29907
; WIPE_END
G1 E-.04 F1800
G17
M73 P90 R1
G3 Z3 I-.037 J1.216 P1  F30000
G1 X140.646 Y127.408 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X101.066 Y127.408 E1.21618
G1 X101.066 Y121.828 E.17146
G1 X140.646 Y121.828 E1.21618
G1 X140.646 Y127.348 E.16961
M204 S10000
G1 X139.886 Y126.813 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151056
G1 F15000
G1 X140.038 Y126.415 E.00375
G1 X140.219 Y125.785 F30000
; LINE_WIDTH: 0.43449
G1 F15000
G1 X140.252 Y125.604 E.00588
; LINE_WIDTH: 0.391802
G1 X140.285 Y125.423 E.00524
; LINE_WIDTH: 0.349113
G1 X140.318 Y125.242 E.00459
; LINE_WIDTH: 0.306424
G1 X140.322 Y125.21 E.00068
; LINE_WIDTH: 0.298796
G1 X140.34 Y124.92 E.00607
; LINE_WIDTH: 0.261158
G2 X140.357 Y124.607 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X140.34 Y124.317 E.0044
; LINE_WIDTH: 0.267101
G2 X140.318 Y123.995 I-2.649 J.015 E.00589
; LINE_WIDTH: 0.306424
G1 X140.285 Y123.814 E.00395
; LINE_WIDTH: 0.349112
G1 X140.252 Y123.633 E.00459
; LINE_WIDTH: 0.3918
G1 X140.219 Y123.452 E.00524
G1 X140.038 Y122.822 F30000
; LINE_WIDTH: 0.141571
G1 F15000
G1 X139.886 Y122.424 E.00342
G1 X139.045 Y122.252 F30000
; LINE_WIDTH: 0.405157
G1 F15000
G1 X138.752 Y122.198 E.00881
; LINE_WIDTH: 0.389446
G1 X138.558 Y122.174 E.00551
; LINE_WIDTH: 0.342434
G1 X138.365 Y122.151 E.00476
; LINE_WIDTH: 0.257331
G2 X138.147 Y122.126 I-.317 J1.798 E.00384
G2 X137.541 Y122.127 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X137.348 Y122.151 E.00327
; LINE_WIDTH: 0.295421
G1 X137.154 Y122.174 E.00401
; LINE_WIDTH: 0.342433
G1 X136.96 Y122.198 E.00476
; LINE_WIDTH: 0.389446
G1 X136.667 Y122.252 E.00842
G1 X136.044 Y122.424 F30000
; LINE_WIDTH: 0.134453
G1 F15000
G1 X135.882 Y122.607 E.00182
; WIPE_START
G1 F24000
G1 X136.044 Y122.424 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.017 J.669 P1  F30000
G1 X139.045 Y126.985 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.405156
G1 F15000
G1 X138.752 Y127.039 E.00881
; LINE_WIDTH: 0.389444
G1 X138.558 Y127.063 E.00551
; LINE_WIDTH: 0.342433
G1 X138.365 Y127.086 E.00476
; LINE_WIDTH: 0.257331
G3 X138.147 Y127.111 I-.317 J-1.798 E.00384
G3 X137.541 Y127.11 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X137.348 Y127.086 E.00327
; LINE_WIDTH: 0.295422
G1 X137.154 Y127.063 E.00401
; LINE_WIDTH: 0.342434
G1 X136.96 Y127.039 E.00476
; LINE_WIDTH: 0.389444
G1 X136.667 Y126.985 E.00842
G1 X136.044 Y126.813 F30000
; LINE_WIDTH: 0.134453
G1 F15000
G1 X135.882 Y126.63 E.00182
G1 X135.062 Y126.849 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40121
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X135.062 Y122.59 E.21938
G1 X134.611 Y122.59 E.02324
G1 X134.611 Y126.647 E.20895
G1 X134.16 Y126.647 E.02324
G1 X134.16 Y122.59 E.20895
G1 X133.709 Y122.59 E.02324
G1 X133.709 Y126.647 E.20895
G1 X133.257 Y126.647 E.02324
G1 X133.257 Y122.59 E.20895
G1 X132.806 Y122.59 E.02324
G1 X132.806 Y126.647 E.20895
G1 X132.355 Y126.647 E.02324
G1 X132.355 Y122.59 E.20895
G1 X131.904 Y122.59 E.02324
G1 X131.904 Y126.647 E.20895
G1 X131.453 Y126.647 E.02324
G1 X131.453 Y122.59 E.20895
G1 X131.001 Y122.59 E.02324
G1 X131.001 Y126.647 E.20895
G1 X130.55 Y126.647 E.02324
G1 X130.55 Y122.59 E.20895
G1 X130.099 Y122.59 E.02324
G1 X130.099 Y126.647 E.20895
G1 X129.648 Y126.647 E.02324
G1 X129.648 Y122.59 E.20895
G1 X129.197 Y122.59 E.02324
G1 X129.197 Y126.647 E.20895
G1 X128.745 Y126.647 E.02324
G1 X128.745 Y122.59 E.20895
G1 X128.294 Y122.59 E.02324
G1 X128.294 Y126.647 E.20895
G1 X127.843 Y126.647 E.02324
G1 X127.843 Y122.59 E.20895
G1 X127.392 Y122.59 E.02324
G1 X127.392 Y126.647 E.20895
G1 X126.941 Y126.647 E.02324
G1 X126.941 Y122.59 E.20895
G1 X126.489 Y122.59 E.02324
G1 X126.489 Y126.647 E.20895
G1 X126.038 Y126.647 E.02324
G1 X126.038 Y122.59 E.20895
G1 X125.587 Y122.59 E.02324
G1 X125.587 Y126.647 E.20895
G1 X125.136 Y126.647 E.02324
G1 X125.136 Y122.59 E.20895
G1 X124.684 Y122.59 E.02324
G1 X124.684 Y126.647 E.20895
G1 X124.233 Y126.647 E.02324
G1 X124.233 Y122.59 E.20895
G1 X123.782 Y122.59 E.02324
G1 X123.782 Y126.647 E.20895
G1 X123.331 Y126.647 E.02324
G1 X123.331 Y122.59 E.20895
G1 X122.88 Y122.59 E.02324
G1 X122.88 Y126.647 E.20895
G1 X122.428 Y126.647 E.02324
G1 X122.428 Y122.59 E.20895
G1 X121.977 Y122.59 E.02324
G1 X121.977 Y126.647 E.20895
G1 X121.526 Y126.647 E.02324
G1 X121.526 Y122.59 E.20895
G1 X121.075 Y122.59 E.02324
G1 X121.075 Y126.647 E.20895
G1 X120.624 Y126.647 E.02324
G1 X120.624 Y122.59 E.20895
G1 X120.172 Y122.59 E.02324
G1 X120.172 Y126.647 E.20895
G1 X119.721 Y126.647 E.02324
G1 X119.721 Y122.59 E.20895
G1 X119.27 Y122.59 E.02324
G1 X119.27 Y126.647 E.20895
G1 X118.819 Y126.647 E.02324
G1 X118.819 Y122.59 E.20895
G1 X118.368 Y122.59 E.02324
G1 X118.368 Y126.647 E.20895
G1 X117.916 Y126.647 E.02324
G1 X117.916 Y122.59 E.20895
G1 X117.465 Y122.59 E.02324
G1 X117.465 Y126.647 E.20895
G1 X117.014 Y126.647 E.02324
G1 X117.014 Y122.59 E.20895
G1 X116.563 Y122.59 E.02324
G1 X116.563 Y126.647 E.20895
G1 X116.111 Y126.647 E.02324
G1 X116.111 Y122.59 E.20895
G1 X115.66 Y122.59 E.02324
G1 X115.66 Y126.647 E.20895
G1 X115.209 Y126.647 E.02324
G1 X115.209 Y122.59 E.20895
G1 X114.758 Y122.59 E.02324
G1 X114.758 Y126.647 E.20895
G1 X114.307 Y126.647 E.02324
G1 X114.307 Y122.59 E.20895
G1 X113.855 Y122.59 E.02324
G1 X113.855 Y126.647 E.20895
G1 X113.404 Y126.647 E.02324
G1 X113.404 Y122.59 E.20895
G1 X112.953 Y122.59 E.02324
G1 X112.953 Y126.647 E.20895
G1 X112.502 Y126.647 E.02324
G1 X112.502 Y122.59 E.20895
G1 X112.051 Y122.59 E.02324
G1 X112.051 Y126.647 E.20895
G1 X111.599 Y126.647 E.02324
G1 X111.599 Y122.59 E.20895
G1 X111.148 Y122.59 E.02324
G1 X111.148 Y126.647 E.20895
G1 X110.697 Y126.647 E.02324
G1 X110.697 Y122.59 E.20895
G1 X110.246 Y122.59 E.02324
G1 X110.246 Y126.647 E.20895
G1 X109.795 Y126.647 E.02324
G1 X109.795 Y122.59 E.20895
G1 X109.343 Y122.59 E.02324
G1 X109.343 Y126.647 E.20895
G1 X108.892 Y126.647 E.02324
G1 X108.892 Y122.59 E.20895
G1 X108.441 Y122.59 E.02324
G1 X108.441 Y126.647 E.20895
G1 X107.99 Y126.647 E.02324
G1 X107.99 Y122.59 E.20895
G1 X107.538 Y122.59 E.02324
G1 X107.538 Y126.647 E.20895
G1 X107.087 Y126.647 E.02324
G1 X107.087 Y122.59 E.20895
G1 X106.636 Y122.59 E.02324
G1 X106.636 Y126.849 E.21938
M106 S242.25
G1 X105.83 Y126.63 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969196
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X105.668 Y126.813 E.00107
G1 X105.045 Y126.985 F30000
; LINE_WIDTH: 0.405156
G1 F15000
G1 X104.752 Y127.039 E.00881
; LINE_WIDTH: 0.389444
G1 X104.558 Y127.063 E.00551
; LINE_WIDTH: 0.342433
G1 X104.365 Y127.086 E.00476
; LINE_WIDTH: 0.257331
G3 X104.147 Y127.111 I-.317 J-1.798 E.00384
G3 X103.541 Y127.11 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X103.348 Y127.086 E.00327
; LINE_WIDTH: 0.295422
G1 X103.154 Y127.063 E.00401
; LINE_WIDTH: 0.342433
G1 X102.96 Y127.039 E.00476
; LINE_WIDTH: 0.389444
G1 X102.667 Y126.985 E.00842
G1 X101.826 Y126.813 F30000
; LINE_WIDTH: 0.151054
G1 F15000
G1 X101.675 Y126.415 E.00375
G1 X101.494 Y125.785 F30000
; LINE_WIDTH: 0.3918
G1 F15000
G1 X101.46 Y125.604 E.00524
; LINE_WIDTH: 0.349112
G1 X101.427 Y125.423 E.00459
; LINE_WIDTH: 0.306424
G1 X101.394 Y125.242 E.00395
; LINE_WIDTH: 0.267101
G3 X101.373 Y124.92 I2.628 J-.336 E.00589
; LINE_WIDTH: 0.228538
G1 X101.355 Y124.63 E.0044
; LINE_WIDTH: 0.261158
G3 X101.373 Y124.317 I2.594 J-.011 E.00557
; LINE_WIDTH: 0.298796
G1 X101.39 Y124.026 E.00607
; LINE_WIDTH: 0.306424
G1 X101.394 Y123.995 E.00068
; LINE_WIDTH: 0.349113
G1 X101.427 Y123.814 E.00459
; LINE_WIDTH: 0.391801
G1 X101.46 Y123.633 E.00524
; LINE_WIDTH: 0.434489
G1 X101.494 Y123.452 E.00588
G1 X101.675 Y122.822 F30000
; LINE_WIDTH: 0.151056
G1 F15000
G1 X101.826 Y122.424 E.00375
G1 X102.667 Y122.252 F30000
; LINE_WIDTH: 0.389444
G1 F15000
G1 X102.96 Y122.198 E.00842
; LINE_WIDTH: 0.342433
G1 X103.154 Y122.174 E.00476
; LINE_WIDTH: 0.295421
G1 X103.348 Y122.151 E.00401
; LINE_WIDTH: 0.24841
G1 X103.541 Y122.127 E.00327
; LINE_WIDTH: 0.257331
G3 X104.147 Y122.126 I.315 J4.984 E.01058
G3 X104.365 Y122.151 I-.098 J1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X104.558 Y122.174 E.00476
; LINE_WIDTH: 0.389444
G1 X104.752 Y122.198 E.00551
; LINE_WIDTH: 0.405155
G1 X105.045 Y122.252 E.00881
G1 X105.668 Y122.424 F30000
; LINE_WIDTH: 0.0969208
G1 F15000
M73 P91 R1
G1 X105.83 Y122.607 E.00107
; WIPE_START
G1 F24000
G1 X105.668 Y122.424 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.501 J1.109 P1  F30000
G1 X140.15 Y138.006 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X140.022 Y138.073 E.00478
G1 X139.552 Y138.489 E.02084
G1 X139.195 Y139.007 E.02084
G1 X138.972 Y139.594 E.02084
G1 X138.896 Y140.218 E.02084
G1 X138.972 Y140.842 E.02084
G1 X139.195 Y141.429 E.02084
G1 X139.552 Y141.946 E.02084
G1 X140.022 Y142.363 E.02084
G1 X140.15 Y142.43 E.00478
G1 X140.104 Y142.616 E.00635
G1 X108.901 Y142.616 E1.03504
G1 X108.856 Y142.43 E.00635
G1 X108.983 Y142.363 E.00478
G1 X109.454 Y141.946 E.02084
G1 X109.811 Y141.429 E.02084
G1 X110.033 Y140.842 E.02084
G1 X110.109 Y140.218 E.02084
G1 X110.033 Y139.594 E.02084
G1 X109.811 Y139.007 E.02084
G1 X109.454 Y138.489 E.02084
G1 X108.983 Y138.073 E.02084
G1 X108.856 Y138.006 E.00478
G1 X108.901 Y137.82 E.00635
G1 X140.104 Y137.82 E1.03504
G1 X140.135 Y137.947 E.00436
; WIPE_START
G1 F24000
G1 X140.022 Y138.073 E-.06419
G1 X139.552 Y138.489 E-.23878
G1 X139.195 Y139.007 E-.23877
G1 X138.991 Y139.544 E-.21825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.037 J1.216 P1  F30000
G1 X143.649 Y139.687 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.65 Y139.689 E.00005
G1 X143.714 Y140.218 E.01638
G1 X143.65 Y140.747 E.01638
G1 X143.461 Y141.246 E.01638
G1 X143.158 Y141.684 E.01638
G1 X142.759 Y142.038 E.01638
G1 X142.287 Y142.286 E.01638
G1 X141.769 Y142.413 E.01638
G1 X141.236 Y142.413 E.01638
G1 X140.719 Y142.286 E.01638
G1 X140.246 Y142.038 E.01638
G1 X139.847 Y141.684 E.01638
G1 X139.545 Y141.246 E.01638
G1 X139.355 Y140.747 E.01638
G1 X139.291 Y140.218 E.01638
G1 X139.355 Y139.689 E.01638
G1 X139.545 Y139.19 E.01638
G1 X139.847 Y138.751 E.01638
G1 X140.246 Y138.398 E.01638
G1 X140.719 Y138.15 E.01638
G1 X141.236 Y138.022 E.01638
G1 X141.769 Y138.022 E.01638
G1 X142.287 Y138.15 E.01638
G1 X142.759 Y138.398 E.01638
G1 X143.158 Y138.751 E.01638
G1 X143.461 Y139.19 E.01638
G1 X143.628 Y139.631 E.01449
M204 S10000
G1 X143.729 Y138.888 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.454 Y138.489 E.01608
G1 X142.983 Y138.073 E.02084
G1 X142.856 Y138.006 E.00478
G1 X142.901 Y137.82 E.00635
G1 X143.901 Y137.82 E.03314
G1 X143.901 Y138.835 E.03367
G1 X143.786 Y138.87 E.00397
; WIPE_START
G1 F24000
G1 X143.454 Y138.489 E-.19221
G1 X142.983 Y138.073 E-.23878
G1 X142.856 Y138.006 E-.0548
G1 X142.901 Y137.82 E-.07271
G1 X143.432 Y137.82 E-.2015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.213 J.097 P1  F30000
G1 X143.729 Y141.547 Z3
G1 Z2.6
G1 E.8 F1800
G1 F15476.087
G1 X143.901 Y141.601 E.00596
G1 X143.901 Y142.616 E.03367
G1 X142.901 Y142.616 E.03314
G1 X142.856 Y142.43 E.00635
G1 X142.983 Y142.363 E.00478
G1 X143.454 Y141.946 E.02084
G1 X143.695 Y141.597 E.01409
; WIPE_START
G1 F24000
G1 X143.901 Y141.601 E-.07817
G1 X143.901 Y142.616 E-.38568
G1 X143.121 Y142.616 E-.29616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.105 J-1.212 P1  F30000
G1 X109.652 Y139.709 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X109.714 Y140.218 E.01575
G1 X109.65 Y140.747 E.01638
G1 X109.461 Y141.246 E.01638
G1 X109.158 Y141.684 E.01638
G1 X108.759 Y142.038 E.01638
G1 X108.287 Y142.286 E.01638
G1 X107.769 Y142.413 E.01638
G1 X107.236 Y142.413 E.01638
G1 X106.719 Y142.286 E.01638
G1 X106.246 Y142.038 E.01638
G1 X105.847 Y141.684 E.01638
G1 X105.545 Y141.246 E.01638
G1 X105.355 Y140.747 E.01638
G1 X105.291 Y140.218 E.01638
G1 X105.355 Y139.689 E.01638
G1 X105.545 Y139.19 E.01638
G1 X105.847 Y138.751 E.01638
G1 X106.246 Y138.398 E.01638
G1 X106.719 Y138.15 E.01638
G1 X107.236 Y138.022 E.01638
G1 X107.769 Y138.022 E.01638
G1 X108.287 Y138.15 E.01638
G1 X108.759 Y138.398 E.01638
G1 X109.158 Y138.751 E.01638
G1 X109.461 Y139.19 E.01638
G1 X109.636 Y139.652 E.01517
M204 S10000
; WIPE_START
G1 F24000
G1 X109.714 Y140.218 E-.21713
G1 X109.65 Y140.747 E-.20259
G1 X109.461 Y141.246 E-.2026
G1 X109.255 Y141.544 E-.13768
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.915 J-.803 P1  F30000
G1 X106.15 Y138.006 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X106.022 Y138.073 E.00478
G1 X105.552 Y138.489 E.02084
G1 X105.276 Y138.888 E.01608
G1 X105.105 Y138.835 E.00596
G1 X105.105 Y137.82 E.03367
G1 X106.104 Y137.82 E.03314
G1 X106.135 Y137.947 E.00436
; WIPE_START
G1 F24000
G1 X106.022 Y138.073 E-.06419
G1 X105.552 Y138.489 E-.23878
G1 X105.276 Y138.888 E-.18419
G1 X105.105 Y138.835 E-.06829
G1 X105.105 Y138.297 E-.20454
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.18 J.298 P1  F30000
G1 X106.15 Y142.43 Z3
G1 Z2.6
G1 E.8 F1800
G1 F15476.087
G1 X106.104 Y142.616 E.00635
G1 X105.105 Y142.616 E.03314
G1 X105.105 Y141.601 E.03367
G1 X105.276 Y141.547 E.00596
G1 X105.552 Y141.946 E.01608
G1 X106.022 Y142.363 E.02084
G1 X106.097 Y142.402 E.00279
; WIPE_START
G1 F24000
G1 X106.104 Y142.616 E-.08125
G1 X105.105 Y142.616 E-.37968
G1 X105.105 Y141.829 E-.29907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.037 J1.216 P1  F30000
G1 X144.293 Y143.008 Z3
G1 Z2.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X104.713 Y143.008 E1.21618
G1 X104.713 Y137.428 E.17146
G1 X144.293 Y137.428 E1.21618
G1 X144.293 Y142.948 E.16961
M204 S10000
G1 X143.533 Y142.412 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151056
G1 F15000
G1 X143.684 Y142.015 E.00375
G1 X143.865 Y141.384 F30000
; LINE_WIDTH: 0.43449
G1 F15000
G1 X143.899 Y141.203 E.00588
; LINE_WIDTH: 0.391802
G1 X143.932 Y141.022 E.00524
; LINE_WIDTH: 0.349113
G1 X143.965 Y140.841 E.00459
; LINE_WIDTH: 0.306424
G1 X143.969 Y140.81 E.00068
; LINE_WIDTH: 0.298796
G1 X143.986 Y140.519 E.00607
; LINE_WIDTH: 0.261158
G2 X144.004 Y140.207 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X143.986 Y139.916 E.0044
; LINE_WIDTH: 0.267101
G2 X143.965 Y139.595 I-2.649 J.015 E.00589
; LINE_WIDTH: 0.306424
G1 X143.932 Y139.413 E.00395
; LINE_WIDTH: 0.349112
G1 X143.899 Y139.232 E.00459
; LINE_WIDTH: 0.3918
G1 X143.865 Y139.051 E.00524
G1 X143.684 Y138.421 F30000
; LINE_WIDTH: 0.141571
G1 F15000
G1 X143.533 Y138.023 E.00342
G1 X142.692 Y137.851 F30000
; LINE_WIDTH: 0.405157
G1 F15000
G1 X142.398 Y137.797 E.00881
; LINE_WIDTH: 0.389446
G1 X142.205 Y137.774 E.00551
; LINE_WIDTH: 0.342434
G1 X142.011 Y137.75 E.00476
; LINE_WIDTH: 0.257331
G2 X141.793 Y137.725 I-.317 J1.798 E.00384
G2 X141.188 Y137.727 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X140.994 Y137.75 E.00327
; LINE_WIDTH: 0.295421
G1 X140.801 Y137.774 E.00401
; LINE_WIDTH: 0.342433
G1 X140.607 Y137.797 E.00476
; LINE_WIDTH: 0.389446
G1 X140.314 Y137.851 E.00842
G1 X139.691 Y138.023 F30000
; LINE_WIDTH: 0.134453
G1 F15000
G1 X139.529 Y138.206 E.00182
; WIPE_START
G1 F24000
G1 X139.691 Y138.023 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.017 J.669 P1  F30000
G1 X142.692 Y142.585 Z3
G1 Z2.6
G1 E.8 F1800
; LINE_WIDTH: 0.405156
G1 F15000
G1 X142.398 Y142.639 E.00881
; LINE_WIDTH: 0.389444
G1 X142.205 Y142.662 E.00551
; LINE_WIDTH: 0.342433
G1 X142.011 Y142.686 E.00476
; LINE_WIDTH: 0.257331
G3 X141.793 Y142.711 I-.317 J-1.798 E.00384
G3 X141.188 Y142.709 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X140.994 Y142.686 E.00327
; LINE_WIDTH: 0.295422
G1 X140.801 Y142.662 E.00401
; LINE_WIDTH: 0.342434
G1 X140.607 Y142.639 E.00476
; LINE_WIDTH: 0.389444
G1 X140.314 Y142.585 E.00842
G1 X139.691 Y142.412 F30000
; LINE_WIDTH: 0.134453
G1 F15000
G1 X139.529 Y142.23 E.00182
G1 X138.709 Y142.449 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.40121
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X138.709 Y138.19 E.21938
G1 X138.258 Y138.19 E.02324
G1 X138.258 Y142.246 E.20895
G1 X137.806 Y142.246 E.02324
G1 X137.806 Y138.19 E.20895
G1 X137.355 Y138.19 E.02324
G1 X137.355 Y142.246 E.20895
G1 X136.904 Y142.246 E.02324
G1 X136.904 Y138.19 E.20895
G1 X136.453 Y138.19 E.02324
G1 X136.453 Y142.246 E.20895
G1 X136.002 Y142.246 E.02324
G1 X136.002 Y138.19 E.20895
G1 X135.55 Y138.19 E.02324
G1 X135.55 Y142.246 E.20895
G1 X135.099 Y142.246 E.02324
G1 X135.099 Y138.19 E.20895
G1 X134.648 Y138.19 E.02324
G1 X134.648 Y142.246 E.20895
G1 X134.197 Y142.246 E.02324
G1 X134.197 Y138.19 E.20895
G1 X133.746 Y138.19 E.02324
G1 X133.746 Y142.246 E.20895
G1 X133.294 Y142.246 E.02324
G1 X133.294 Y138.19 E.20895
G1 X132.843 Y138.19 E.02324
G1 X132.843 Y142.246 E.20895
G1 X132.392 Y142.246 E.02324
G1 X132.392 Y138.19 E.20895
G1 X131.941 Y138.19 E.02324
G1 X131.941 Y142.246 E.20895
G1 X131.489 Y142.246 E.02324
G1 X131.489 Y138.19 E.20895
G1 X131.038 Y138.19 E.02324
G1 X131.038 Y142.246 E.20895
G1 X130.587 Y142.246 E.02324
G1 X130.587 Y138.19 E.20895
G1 X130.136 Y138.19 E.02324
G1 X130.136 Y142.246 E.20895
G1 X129.685 Y142.246 E.02324
G1 X129.685 Y138.19 E.20895
G1 X129.233 Y138.19 E.02324
G1 X129.233 Y142.246 E.20895
G1 X128.782 Y142.246 E.02324
G1 X128.782 Y138.19 E.20895
G1 X128.331 Y138.19 E.02324
G1 X128.331 Y142.246 E.20895
G1 X127.88 Y142.246 E.02324
G1 X127.88 Y138.19 E.20895
G1 X127.429 Y138.19 E.02324
G1 X127.429 Y142.246 E.20895
G1 X126.977 Y142.246 E.02324
G1 X126.977 Y138.19 E.20895
G1 X126.526 Y138.19 E.02324
G1 X126.526 Y142.246 E.20895
G1 X126.075 Y142.246 E.02324
G1 X126.075 Y138.19 E.20895
G1 X125.624 Y138.19 E.02324
G1 X125.624 Y142.246 E.20895
G1 X125.173 Y142.246 E.02324
G1 X125.173 Y138.19 E.20895
G1 X124.721 Y138.19 E.02324
G1 X124.721 Y142.246 E.20895
G1 X124.27 Y142.246 E.02324
G1 X124.27 Y138.19 E.20895
G1 X123.819 Y138.19 E.02324
G1 X123.819 Y142.246 E.20895
G1 X123.368 Y142.246 E.02324
G1 X123.368 Y138.19 E.20895
G1 X122.916 Y138.19 E.02324
G1 X122.916 Y142.246 E.20895
G1 X122.465 Y142.246 E.02324
G1 X122.465 Y138.19 E.20895
G1 X122.014 Y138.19 E.02324
G1 X122.014 Y142.246 E.20895
G1 X121.563 Y142.246 E.02324
G1 X121.563 Y138.19 E.20895
G1 X121.112 Y138.19 E.02324
G1 X121.112 Y142.246 E.20895
G1 X120.66 Y142.246 E.02324
G1 X120.66 Y138.19 E.20895
G1 X120.209 Y138.19 E.02324
G1 X120.209 Y142.246 E.20895
G1 X119.758 Y142.246 E.02324
G1 X119.758 Y138.19 E.20895
G1 X119.307 Y138.19 E.02324
G1 X119.307 Y142.246 E.20895
G1 X118.856 Y142.246 E.02324
G1 X118.856 Y138.19 E.20895
G1 X118.404 Y138.19 E.02324
G1 X118.404 Y142.246 E.20895
G1 X117.953 Y142.246 E.02324
G1 X117.953 Y138.19 E.20895
G1 X117.502 Y138.19 E.02324
G1 X117.502 Y142.246 E.20895
G1 X117.051 Y142.246 E.02324
G1 X117.051 Y138.19 E.20895
G1 X116.6 Y138.19 E.02324
G1 X116.6 Y142.246 E.20895
G1 X116.148 Y142.246 E.02324
G1 X116.148 Y138.19 E.20895
G1 X115.697 Y138.19 E.02324
G1 X115.697 Y142.246 E.20895
G1 X115.246 Y142.246 E.02324
G1 X115.246 Y138.19 E.20895
G1 X114.795 Y138.19 E.02324
G1 X114.795 Y142.246 E.20895
G1 X114.344 Y142.246 E.02324
G1 X114.344 Y138.19 E.20895
G1 X113.892 Y138.19 E.02324
G1 X113.892 Y142.246 E.20895
G1 X113.441 Y142.246 E.02324
G1 X113.441 Y138.19 E.20895
G1 X112.99 Y138.19 E.02324
G1 X112.99 Y142.246 E.20895
G1 X112.539 Y142.246 E.02324
G1 X112.539 Y138.19 E.20895
M73 P92 R1
G1 X112.087 Y138.19 E.02324
G1 X112.087 Y142.246 E.20895
G1 X111.636 Y142.246 E.02324
G1 X111.636 Y138.19 E.20895
G1 X111.185 Y138.19 E.02324
G1 X111.185 Y142.246 E.20895
G1 X110.734 Y142.246 E.02324
G1 X110.734 Y138.19 E.20895
G1 X110.283 Y138.19 E.02324
G1 X110.283 Y142.449 E.21938
M106 S242.25
G1 X109.477 Y142.23 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969196
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X109.315 Y142.412 E.00107
G1 X108.692 Y142.585 F30000
; LINE_WIDTH: 0.405156
G1 F15000
G1 X108.398 Y142.639 E.00881
; LINE_WIDTH: 0.389444
G1 X108.205 Y142.662 E.00551
; LINE_WIDTH: 0.342433
G1 X108.011 Y142.686 E.00476
; LINE_WIDTH: 0.257331
G3 X107.793 Y142.711 I-.317 J-1.798 E.00384
G3 X107.188 Y142.709 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X106.994 Y142.686 E.00327
; LINE_WIDTH: 0.295422
G1 X106.801 Y142.662 E.00401
; LINE_WIDTH: 0.342433
G1 X106.607 Y142.639 E.00476
; LINE_WIDTH: 0.389444
G1 X106.314 Y142.585 E.00842
G1 X105.473 Y142.412 F30000
; LINE_WIDTH: 0.151054
G1 F15000
G1 X105.321 Y142.015 E.00375
G1 X105.14 Y141.384 F30000
; LINE_WIDTH: 0.3918
G1 F15000
G1 X105.107 Y141.203 E.00524
; LINE_WIDTH: 0.349112
G1 X105.074 Y141.022 E.00459
; LINE_WIDTH: 0.306424
G1 X105.041 Y140.841 E.00395
; LINE_WIDTH: 0.267101
G3 X105.019 Y140.519 I2.628 J-.336 E.00589
; LINE_WIDTH: 0.228538
G1 X105.002 Y140.229 E.0044
; LINE_WIDTH: 0.261158
G3 X105.019 Y139.916 I2.594 J-.011 E.00557
; LINE_WIDTH: 0.298796
G1 X105.037 Y139.626 E.00607
; LINE_WIDTH: 0.306424
G1 X105.041 Y139.595 E.00068
; LINE_WIDTH: 0.349113
G1 X105.074 Y139.413 E.00459
; LINE_WIDTH: 0.391801
G1 X105.107 Y139.232 E.00524
; LINE_WIDTH: 0.434489
G1 X105.14 Y139.051 E.00588
G1 X105.321 Y138.421 F30000
; LINE_WIDTH: 0.151056
G1 F15000
G1 X105.473 Y138.023 E.00375
G1 X106.314 Y137.851 F30000
; LINE_WIDTH: 0.389444
G1 F15000
G1 X106.607 Y137.797 E.00842
; LINE_WIDTH: 0.342433
G1 X106.801 Y137.774 E.00476
; LINE_WIDTH: 0.295421
G1 X106.994 Y137.75 E.00401
; LINE_WIDTH: 0.24841
G1 X107.188 Y137.727 E.00327
; LINE_WIDTH: 0.257331
G3 X107.793 Y137.725 I.315 J4.984 E.01058
G3 X108.011 Y137.75 I-.098 J1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X108.205 Y137.774 E.00476
; LINE_WIDTH: 0.389444
G1 X108.398 Y137.797 E.00551
; LINE_WIDTH: 0.405155
G1 X108.692 Y137.851 E.00881
G1 X109.315 Y138.023 F30000
; LINE_WIDTH: 0.0969208
G1 F15000
G1 X109.477 Y138.206 E.00107
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.315 Y138.023 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/15
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
G3 Z3 I.606 J1.055 P1  F30000
G1 X136.503 Y122.406 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10902
G1 X136.376 Y122.473 E.00478
G1 X135.905 Y122.89 E.02084
G1 X135.548 Y123.407 E.02084
G1 X135.325 Y123.995 E.02084
G1 X135.25 Y124.618 E.02084
G1 X135.325 Y125.242 E.02084
G1 X135.548 Y125.83 E.02084
G1 X135.905 Y126.347 E.02084
G1 X136.376 Y126.763 E.02084
G1 X136.503 Y126.831 E.00478
G1 X136.457 Y127.016 E.00635
G1 X105.255 Y127.016 E1.03504
G1 X105.209 Y126.831 E.00635
G1 X105.337 Y126.763 E.00478
G1 X105.807 Y126.347 E.02084
G1 X106.164 Y125.83 E.02084
G1 X106.387 Y125.242 E.02084
G1 X106.463 Y124.618 E.02084
G1 X106.387 Y123.995 E.02084
G1 X106.164 Y123.407 E.02084
G1 X105.807 Y122.89 E.02084
G1 X105.337 Y122.473 E.02084
G1 X105.209 Y122.406 E.00478
G1 X105.255 Y122.22 E.00635
G1 X136.457 Y122.22 E1.03504
G1 X136.489 Y122.348 E.00436
; WIPE_START
G1 F24000
G1 X136.376 Y122.473 E-.06419
G1 X135.905 Y122.89 E-.23878
G1 X135.548 Y123.407 E-.23878
G1 X135.345 Y123.944 E-.21825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.037 J1.216 P1  F30000
G1 X140.003 Y124.087 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10902
G1 X140.003 Y124.089 E.00007
G1 X140.012 Y124.162 E.00227
G1 X140.068 Y124.618 E.01412
G1 X140.003 Y125.148 E.01638
G1 X139.814 Y125.646 E.01638
G1 X139.512 Y126.085 E.01638
G1 X139.112 Y126.438 E.01638
G1 X138.64 Y126.686 E.01638
G1 X138.123 Y126.814 E.01638
G1 X137.59 Y126.814 E.01638
G1 X137.072 Y126.686 E.01638
G1 X136.6 Y126.438 E.01638
G1 X136.201 Y126.085 E.01638
G1 X135.898 Y125.646 E.01638
G1 X135.709 Y125.148 E.01638
G1 X135.645 Y124.618 E.01638
G1 X135.709 Y124.089 E.01638
G1 X135.872 Y123.66 E.01412
G1 X135.898 Y123.591 E.00227
G1 X136.201 Y123.152 E.01638
G1 X136.6 Y122.798 E.01638
G1 X137.072 Y122.551 E.01638
G1 X137.59 Y122.423 E.01638
G1 X138.123 Y122.423 E.01638
G1 X138.64 Y122.551 E.01638
G1 X139.112 Y122.798 E.01638
G1 X139.512 Y123.152 E.01638
M73 P92 R0
G1 X139.814 Y123.591 E.01638
G1 X139.981 Y124.031 E.01447
M204 S10000
G1 X140.083 Y123.289 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10902
G1 X139.807 Y122.89 E.01608
G1 X139.337 Y122.473 E.02084
G1 X139.209 Y122.406 E.00478
G1 X139.255 Y122.22 E.00635
G1 X140.254 Y122.22 E.03314
G1 X140.254 Y123.235 E.03367
G1 X140.14 Y123.271 E.00397
; WIPE_START
G1 F24000
G1 X139.807 Y122.89 E-.19221
G1 X139.337 Y122.473 E-.23878
G1 X139.209 Y122.406 E-.0548
G1 X139.255 Y122.22 E-.07271
G1 X139.785 Y122.22 E-.2015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.213 J.097 P1  F30000
G1 X140.083 Y125.948 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F10902
G1 X140.254 Y126.001 E.00596
G1 X140.254 Y127.016 E.03367
G1 X139.255 Y127.016 E.03314
G1 X139.209 Y126.831 E.00635
G1 X139.337 Y126.763 E.00478
G1 X139.807 Y126.347 E.02084
G1 X140.048 Y125.997 E.01409
; WIPE_START
G1 F24000
G1 X140.254 Y126.001 E-.07817
G1 X140.254 Y127.016 E-.38568
G1 X139.475 Y127.016 E-.29616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.105 J-1.212 P1  F30000
G1 X106.006 Y124.11 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10902
G1 X106.068 Y124.618 E.01573
G1 X106.003 Y125.148 E.01638
G1 X105.814 Y125.646 E.01638
G1 X105.512 Y126.085 E.01638
G1 X105.112 Y126.438 E.01638
G1 X104.64 Y126.686 E.01638
G1 X104.123 Y126.814 E.01638
G1 X103.59 Y126.814 E.01638
G1 X103.072 Y126.686 E.01638
G1 X102.6 Y126.438 E.01638
G1 X102.201 Y126.085 E.01638
G1 X101.898 Y125.646 E.01638
G1 X101.709 Y125.148 E.01638
G1 X101.645 Y124.618 E.01638
G1 X101.709 Y124.089 E.01638
G1 X101.898 Y123.591 E.01638
G1 X102.201 Y123.152 E.01638
G1 X102.6 Y122.798 E.01638
G1 X103.072 Y122.551 E.01638
G1 X103.59 Y122.423 E.01638
G1 X104.123 Y122.423 E.01638
G1 X104.64 Y122.551 E.01638
G1 X105.112 Y122.798 E.01638
G1 X105.512 Y123.152 E.01638
G1 X105.814 Y123.591 E.01638
G1 X105.99 Y124.053 E.01519
M204 S10000
; WIPE_START
G1 F24000
G1 X106.068 Y124.618 E-.21695
G1 X106.003 Y125.148 E-.20259
G1 X105.814 Y125.646 E-.2026
G1 X105.608 Y125.945 E-.13786
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.915 J-.803 P1  F30000
G1 X102.503 Y122.406 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10902
G1 X102.376 Y122.473 E.00478
G1 X101.905 Y122.89 E.02084
G1 X101.63 Y123.289 E.01608
G1 X101.458 Y123.235 E.00596
G1 X101.458 Y122.22 E.03367
G1 X102.457 Y122.22 E.03314
G1 X102.489 Y122.348 E.00436
; WIPE_START
G1 F24000
G1 X102.376 Y122.473 E-.0642
G1 X101.905 Y122.89 E-.23878
G1 X101.63 Y123.289 E-.18419
G1 X101.458 Y123.235 E-.06829
G1 X101.458 Y122.697 E-.20454
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.18 J.298 P1  F30000
G1 X102.503 Y126.831 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F10902
G1 X102.457 Y127.016 E.00635
G1 X101.458 Y127.016 E.03314
G1 X101.458 Y126.001 E.03367
G1 X101.63 Y125.948 E.00596
G1 X101.905 Y126.347 E.01608
G1 X102.376 Y126.763 E.02084
G1 X102.45 Y126.803 E.00279
; WIPE_START
G1 F24000
G1 X102.457 Y127.016 E-.08125
G1 X101.458 Y127.016 E-.37968
G1 X101.458 Y126.229 E-.29907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.037 J1.216 P1  F30000
G1 X140.646 Y127.408 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10902
G1 X101.066 Y127.408 E1.21618
G1 X101.066 Y121.828 E.17146
G1 X140.646 Y121.828 E1.21618
G1 X140.646 Y127.348 E.16961
M204 S10000
G1 X139.886 Y126.813 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151053
G1 F10902
G1 X140.038 Y126.415 E.00375
G1 X140.219 Y125.785 F30000
; LINE_WIDTH: 0.434489
G1 F10902
G1 X140.252 Y125.604 E.00588
; LINE_WIDTH: 0.391801
G1 X140.285 Y125.423 E.00524
; LINE_WIDTH: 0.349113
G1 X140.318 Y125.242 E.00459
; LINE_WIDTH: 0.306424
G1 X140.322 Y125.21 E.00068
; LINE_WIDTH: 0.298796
G1 X140.34 Y124.92 E.00607
; LINE_WIDTH: 0.261158
G2 X140.357 Y124.607 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X140.34 Y124.317 E.0044
; LINE_WIDTH: 0.267103
G2 X140.318 Y123.995 I-2.651 J.015 E.00589
; LINE_WIDTH: 0.306428
G1 X140.285 Y123.814 E.00395
; LINE_WIDTH: 0.349116
G1 X140.252 Y123.633 E.00459
; LINE_WIDTH: 0.391803
G1 X140.219 Y123.452 E.00524
G1 X140.038 Y122.822 F30000
; LINE_WIDTH: 0.141567
G1 F10902
G1 X139.886 Y122.424 E.00342
G1 X139.045 Y122.252 F30000
; LINE_WIDTH: 0.405157
G1 F10902
G1 X138.752 Y122.198 E.00881
; LINE_WIDTH: 0.389444
G1 X138.558 Y122.174 E.00551
; LINE_WIDTH: 0.342433
G1 X138.365 Y122.151 E.00476
; LINE_WIDTH: 0.257331
G2 X138.147 Y122.126 I-.317 J1.798 E.00384
G2 X137.541 Y122.127 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X137.348 Y122.151 E.00327
; LINE_WIDTH: 0.295421
G1 X137.154 Y122.174 E.00401
; LINE_WIDTH: 0.342433
G1 X136.96 Y122.198 E.00476
; LINE_WIDTH: 0.389444
G1 X136.667 Y122.252 E.00842
G1 X136.044 Y122.424 F30000
; LINE_WIDTH: 0.134452
G1 F10902
G1 X135.882 Y122.606 E.00182
; WIPE_START
G1 F24000
G1 X136.044 Y122.424 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.216 J-.047 P1  F30000
G1 X135.882 Y126.63 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.134453
G1 F10902
G1 X136.044 Y126.813 E.00182
G1 X136.667 Y126.985 F30000
; LINE_WIDTH: 0.389444
G1 F10902
G1 X136.96 Y127.039 E.00842
; LINE_WIDTH: 0.342434
G1 X137.154 Y127.063 E.00476
; LINE_WIDTH: 0.295422
G1 X137.348 Y127.086 E.00401
; LINE_WIDTH: 0.24841
G1 X137.541 Y127.11 E.00327
; LINE_WIDTH: 0.257331
G2 X138.147 Y127.111 I.315 J-4.984 E.01058
G2 X138.365 Y127.086 I-.098 J-1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X138.558 Y127.063 E.00476
; LINE_WIDTH: 0.389444
G1 X138.752 Y127.039 E.00551
; LINE_WIDTH: 0.405154
G1 X139.045 Y126.985 E.00881
G1 X108.365 Y124.618 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F10902
G1 X108.317 Y125.116 E.01536
G1 X133.396 Y125.116 E.77061
G1 X133.348 Y124.618 E.01536
G1 X133.396 Y124.121 E.01536
G1 X108.317 Y124.121 E.77061
G1 X108.359 Y124.559 E.01351
G1 X133.014 Y124.773 F30000
; LINE_WIDTH: 0.351909
G1 F10902
G1 X133.014 Y124.464 E.00778
G1 X108.698 Y124.464 E.61224
G1 X108.698 Y124.773 E.00778
G1 X132.954 Y124.773 E.61073
G1 X133.734 Y124.777 F30000
; LINE_WIDTH: 0.419999
G1 F10902
G1 X133.734 Y124.459 E.00978
G1 X133.827 Y123.744 E.02217
G1 X107.886 Y123.744 E.7971
G1 X107.978 Y124.459 E.02217
G1 X107.978 Y124.777 E.00978
G1 X107.886 Y125.493 E.02217
G1 X133.827 Y125.493 E.7971
G1 X133.742 Y124.837 E.02032
G1 X134.109 Y124.732 F30000
G1 F10902
G1 X134.191 Y123.832 E.02777
G1 X134.338 Y123.367 E.01499
G1 X107.375 Y123.367 E.82849
G1 X107.522 Y123.832 E.01499
G1 X107.604 Y124.505 E.02083
G1 X107.522 Y125.405 E.02777
G1 X107.375 Y125.87 E.01499
G1 X134.338 Y125.87 E.82849
G1 X134.191 Y125.405 E.01499
G1 X134.116 Y124.792 E.01898
G1 X134.857 Y124.641 F30000
G1 F10902
G1 X134.939 Y123.923 E.02221
G1 X135.19 Y123.245 E.02221
G1 X135.498 Y122.79 E.01688
G1 X135.394 Y122.693 E.00435
G1 X135.398 Y122.613 E.00248
G1 X106.304 Y122.613 E.89398
G3 X106.214 Y122.79 I-.163 J.029 E.00653
G1 X106.501 Y123.205 E.01549
G1 X106.762 Y123.879 E.02221
G1 X106.855 Y124.596 E.02221
G1 X106.773 Y125.314 E.02221
G1 X106.522 Y125.992 E.02221
G1 X106.214 Y126.447 E.01688
G1 X106.309 Y126.538 E.00402
G1 X106.304 Y126.624 E.00266
G1 X135.398 Y126.624 E.89398
G3 X135.498 Y126.447 I.168 J-.022 E.00671
G1 X135.212 Y126.032 E.01549
G1 X134.95 Y125.358 E.02221
G1 X134.865 Y124.701 E.02037
G1 X134.076 Y122.99 F30000
M73 P93 R0
G1 F10902
G1 X106.812 Y122.99 E.83776
G1 X107.115 Y123.745 E.025
G1 X107.229 Y124.55 E.02499
G1 X107.148 Y125.359 E.02499
G1 X106.875 Y126.126 E.02499
G1 X106.812 Y126.247 E.00419
G1 X134.901 Y126.247 E.8631
G1 X134.597 Y125.492 E.02499
G1 X134.483 Y124.687 E.02499
G1 X134.565 Y123.877 E.02499
G1 X134.838 Y123.111 E.02499
G1 X134.901 Y122.99 E.00419
G1 X134.136 Y122.99 E.0235
G1 X105.83 Y122.607 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969208
G1 F10902
G1 X105.668 Y122.424 E.00107
G1 X105.045 Y122.252 F30000
; LINE_WIDTH: 0.405155
G1 F10902
G1 X104.752 Y122.198 E.00881
; LINE_WIDTH: 0.389444
G1 X104.558 Y122.174 E.00551
; LINE_WIDTH: 0.342433
G1 X104.365 Y122.151 E.00476
; LINE_WIDTH: 0.257331
G2 X104.147 Y122.126 I-.317 J1.798 E.00384
G2 X103.541 Y122.127 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X103.348 Y122.151 E.00327
; LINE_WIDTH: 0.295421
G1 X103.154 Y122.174 E.00401
; LINE_WIDTH: 0.342433
G1 X102.96 Y122.198 E.00476
; LINE_WIDTH: 0.389444
G1 X102.667 Y122.252 E.00842
G1 X101.826 Y122.424 F30000
; LINE_WIDTH: 0.151056
G1 F10902
G1 X101.675 Y122.822 E.00375
G1 X101.494 Y123.452 F30000
; LINE_WIDTH: 0.434489
G1 F10902
G1 X101.46 Y123.633 E.00588
; LINE_WIDTH: 0.391801
G1 X101.427 Y123.814 E.00524
; LINE_WIDTH: 0.349112
G1 X101.394 Y123.995 E.00459
; LINE_WIDTH: 0.306424
G1 X101.39 Y124.026 E.00068
; LINE_WIDTH: 0.298796
G1 X101.373 Y124.317 E.00607
; LINE_WIDTH: 0.261158
G2 X101.355 Y124.63 I2.576 J.302 E.00557
; LINE_WIDTH: 0.228538
G1 X101.373 Y124.92 E.0044
; LINE_WIDTH: 0.267101
G2 X101.394 Y125.242 I2.649 J-.015 E.00589
; LINE_WIDTH: 0.306424
G1 X101.427 Y125.423 E.00395
; LINE_WIDTH: 0.349112
G1 X101.46 Y125.604 E.00459
; LINE_WIDTH: 0.3918
G1 X101.494 Y125.785 E.00524
G1 X101.675 Y126.415 F30000
; LINE_WIDTH: 0.151054
G1 F10902
G1 X101.826 Y126.813 E.00375
G1 X102.667 Y126.985 F30000
; LINE_WIDTH: 0.389444
G1 F10902
G1 X102.96 Y127.039 E.00842
; LINE_WIDTH: 0.342433
G1 X103.154 Y127.063 E.00476
; LINE_WIDTH: 0.295422
G1 X103.348 Y127.086 E.00401
; LINE_WIDTH: 0.24841
G1 X103.541 Y127.11 E.00327
; LINE_WIDTH: 0.257331
G2 X104.147 Y127.111 I.315 J-4.984 E.01058
G2 X104.365 Y127.086 I-.098 J-1.823 E.00384
; LINE_WIDTH: 0.342432
G1 X104.558 Y127.063 E.00476
; LINE_WIDTH: 0.389442
G1 X104.752 Y127.039 E.00551
; LINE_WIDTH: 0.405154
G1 X105.045 Y126.985 E.00881
G1 X105.668 Y126.813 F30000
; LINE_WIDTH: 0.096921
G1 F10902
G1 X105.83 Y126.63 E.00107
; WIPE_START
G1 F24000
G1 X105.668 Y126.813 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.376 J1.158 P1  F30000
G1 X140.15 Y138.006 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10902
G1 X140.022 Y138.073 E.00478
G1 X139.552 Y138.489 E.02084
G1 X139.195 Y139.007 E.02084
G1 X138.972 Y139.594 E.02084
G1 X138.896 Y140.218 E.02084
G1 X138.972 Y140.842 E.02084
G1 X139.195 Y141.429 E.02084
G1 X139.552 Y141.946 E.02084
G1 X140.022 Y142.363 E.02084
G1 X140.15 Y142.43 E.00478
G1 X140.104 Y142.616 E.00635
G1 X108.901 Y142.616 E1.03504
G1 X108.856 Y142.43 E.00635
G1 X108.983 Y142.363 E.00478
G1 X109.454 Y141.946 E.02084
G1 X109.811 Y141.429 E.02084
G1 X110.033 Y140.842 E.02084
G1 X110.109 Y140.218 E.02084
G1 X110.033 Y139.594 E.02084
G1 X109.811 Y139.007 E.02084
G1 X109.454 Y138.489 E.02084
G1 X108.983 Y138.073 E.02084
G1 X108.856 Y138.006 E.00478
G1 X108.901 Y137.82 E.00635
G1 X140.104 Y137.82 E1.03504
G1 X140.135 Y137.947 E.00436
; WIPE_START
G1 F24000
G1 X140.022 Y138.073 E-.06419
G1 X139.552 Y138.489 E-.23878
G1 X139.195 Y139.007 E-.23878
G1 X138.991 Y139.544 E-.21825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.037 J1.216 P1  F30000
G1 X143.649 Y139.686 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10902
G1 X143.65 Y139.689 E.00007
G1 X143.659 Y139.762 E.00227
G1 X143.714 Y140.218 E.01412
G1 X143.65 Y140.747 E.01638
G1 X143.461 Y141.246 E.01638
G1 X143.158 Y141.684 E.01638
G1 X142.759 Y142.038 E.01638
G1 X142.287 Y142.286 E.01638
G1 X141.769 Y142.413 E.01638
G1 X141.236 Y142.413 E.01638
G1 X140.719 Y142.286 E.01638
G1 X140.246 Y142.038 E.01638
G1 X139.847 Y141.684 E.01638
G1 X139.545 Y141.246 E.01638
G1 X139.355 Y140.747 E.01638
G1 X139.291 Y140.218 E.01638
G1 X139.355 Y139.689 E.01638
G1 X139.518 Y139.259 E.01412
G1 X139.545 Y139.19 E.00227
G1 X139.847 Y138.751 E.01638
G1 X140.246 Y138.398 E.01638
G1 X140.719 Y138.15 E.01638
G1 X141.236 Y138.022 E.01638
G1 X141.769 Y138.022 E.01638
G1 X142.287 Y138.15 E.01638
G1 X142.759 Y138.398 E.01638
G1 X143.158 Y138.751 E.01638
G1 X143.461 Y139.19 E.01638
G1 X143.628 Y139.63 E.01447
M204 S10000
G1 X143.729 Y138.888 F30000
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10902
G1 X143.454 Y138.489 E.01608
G1 X142.983 Y138.073 E.02084
G1 X142.856 Y138.006 E.00478
G1 X142.901 Y137.82 E.00635
G1 X143.901 Y137.82 E.03314
G1 X143.901 Y138.835 E.03367
G1 X143.786 Y138.87 E.00397
; WIPE_START
G1 F24000
G1 X143.454 Y138.489 E-.19221
G1 X142.983 Y138.073 E-.23878
G1 X142.856 Y138.006 E-.0548
G1 X142.901 Y137.82 E-.07271
G1 X143.432 Y137.82 E-.2015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.213 J.097 P1  F30000
G1 X143.729 Y141.547 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F10902
G1 X143.901 Y141.601 E.00596
G1 X143.901 Y142.616 E.03367
G1 X142.901 Y142.616 E.03314
G1 X142.856 Y142.43 E.00635
G1 X142.983 Y142.363 E.00478
G1 X143.454 Y141.946 E.02084
G1 X143.695 Y141.597 E.01409
; WIPE_START
G1 F24000
G1 X143.901 Y141.601 E-.07817
G1 X143.901 Y142.616 E-.38568
G1 X143.121 Y142.616 E-.29616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.105 J-1.212 P1  F30000
G1 X109.653 Y139.71 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10902
G1 X109.714 Y140.218 E.01573
G1 X109.65 Y140.747 E.01638
G1 X109.461 Y141.246 E.01638
G1 X109.158 Y141.684 E.01638
G1 X108.759 Y142.038 E.01638
G1 X108.287 Y142.286 E.01638
G1 X107.769 Y142.413 E.01638
G1 X107.236 Y142.413 E.01638
G1 X106.719 Y142.286 E.01638
G1 X106.246 Y142.038 E.01638
G1 X105.847 Y141.684 E.01638
G1 X105.545 Y141.246 E.01638
G1 X105.355 Y140.747 E.01638
G1 X105.291 Y140.218 E.01638
G1 X105.355 Y139.689 E.01638
G1 X105.545 Y139.19 E.01638
G1 X105.847 Y138.751 E.01638
G1 X106.246 Y138.398 E.01638
G1 X106.718 Y138.15 E.01638
G1 X107.236 Y138.022 E.01638
G1 X107.769 Y138.022 E.01638
G1 X108.287 Y138.15 E.01638
G1 X108.759 Y138.398 E.01638
G1 X109.158 Y138.751 E.01638
G1 X109.461 Y139.19 E.01638
G1 X109.636 Y139.652 E.01519
M204 S10000
; WIPE_START
G1 F24000
G1 X109.714 Y140.218 E-.21695
G1 X109.65 Y140.747 E-.20259
G1 X109.461 Y141.246 E-.2026
G1 X109.255 Y141.544 E-.13786
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.915 J-.803 P1  F30000
G1 X106.15 Y138.006 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10902
G1 X106.022 Y138.073 E.00478
G1 X105.552 Y138.489 E.02084
G1 X105.276 Y138.888 E.01608
G1 X105.105 Y138.835 E.00596
G1 X105.105 Y137.82 E.03367
G1 X106.104 Y137.82 E.03314
G1 X106.135 Y137.947 E.00436
; WIPE_START
G1 F24000
G1 X106.022 Y138.073 E-.0642
G1 X105.552 Y138.489 E-.23878
G1 X105.276 Y138.888 E-.18419
G1 X105.105 Y138.835 E-.06829
G1 X105.105 Y138.297 E-.20454
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.18 J.298 P1  F30000
G1 X106.15 Y142.43 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F10902
G1 X106.104 Y142.616 E.00635
G1 X105.105 Y142.616 E.03314
G1 X105.105 Y141.601 E.03367
G1 X105.276 Y141.547 E.00596
G1 X105.552 Y141.946 E.01608
G1 X106.022 Y142.363 E.02084
G1 X106.097 Y142.402 E.00279
; WIPE_START
G1 F24000
G1 X106.104 Y142.616 E-.08125
G1 X105.105 Y142.616 E-.37968
G1 X105.105 Y141.829 E-.29907
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.037 J1.216 P1  F30000
G1 X144.293 Y143.008 Z3.2
G1 Z2.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10902
G1 X104.713 Y143.008 E1.21618
G1 X104.713 Y137.428 E.17146
G1 X144.293 Y137.428 E1.21618
G1 X144.293 Y142.948 E.16961
M204 S10000
G1 X143.533 Y142.412 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.151053
G1 F10902
G1 X143.684 Y142.015 E.00375
G1 X143.865 Y141.384 F30000
; LINE_WIDTH: 0.434489
G1 F10902
G1 X143.899 Y141.203 E.00588
; LINE_WIDTH: 0.391801
G1 X143.932 Y141.022 E.00524
; LINE_WIDTH: 0.349113
G1 X143.965 Y140.841 E.00459
; LINE_WIDTH: 0.306424
G1 X143.969 Y140.81 E.00068
; LINE_WIDTH: 0.298796
G1 X143.986 Y140.519 E.00607
; LINE_WIDTH: 0.261158
G2 X144.004 Y140.207 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X143.986 Y139.916 E.0044
; LINE_WIDTH: 0.267103
G2 X143.965 Y139.595 I-2.651 J.015 E.00589
; LINE_WIDTH: 0.306428
G1 X143.932 Y139.413 E.00395
; LINE_WIDTH: 0.349116
G1 X143.899 Y139.232 E.00459
; LINE_WIDTH: 0.391803
G1 X143.865 Y139.051 E.00524
G1 X143.684 Y138.421 F30000
; LINE_WIDTH: 0.141567
G1 F10902
G1 X143.533 Y138.023 E.00342
G1 X142.692 Y137.851 F30000
; LINE_WIDTH: 0.405157
G1 F10902
G1 X142.398 Y137.797 E.00881
; LINE_WIDTH: 0.389444
G1 X142.205 Y137.774 E.00551
; LINE_WIDTH: 0.342433
G1 X142.011 Y137.75 E.00476
; LINE_WIDTH: 0.257331
G2 X141.793 Y137.725 I-.317 J1.798 E.00384
G2 X141.188 Y137.727 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X140.994 Y137.75 E.00327
; LINE_WIDTH: 0.295421
G1 X140.801 Y137.774 E.00401
; LINE_WIDTH: 0.342433
G1 X140.607 Y137.797 E.00476
; LINE_WIDTH: 0.389444
G1 X140.314 Y137.851 E.00842
G1 X139.691 Y138.023 F30000
; LINE_WIDTH: 0.134452
G1 F10902
G1 X139.529 Y138.206 E.00182
; WIPE_START
G1 F24000
G1 X139.691 Y138.023 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.216 J-.047 P1  F30000
G1 X139.529 Y142.23 Z3.2
G1 Z2.8
G1 E.8 F1800
; LINE_WIDTH: 0.134453
G1 F10902
G1 X139.691 Y142.412 E.00182
G1 X140.314 Y142.585 F30000
; LINE_WIDTH: 0.389444
G1 F10902
G1 X140.607 Y142.639 E.00842
; LINE_WIDTH: 0.342434
G1 X140.801 Y142.662 E.00476
; LINE_WIDTH: 0.295422
G1 X140.994 Y142.686 E.00401
; LINE_WIDTH: 0.24841
G1 X141.188 Y142.709 E.00327
; LINE_WIDTH: 0.257331
G2 X141.793 Y142.711 I.315 J-4.984 E.01058
G2 X142.011 Y142.686 I-.098 J-1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X142.205 Y142.662 E.00476
; LINE_WIDTH: 0.389444
G1 X142.398 Y142.639 E.00551
; LINE_WIDTH: 0.405154
G1 X142.692 Y142.585 E.00881
G1 X112.011 Y140.218 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F10902
G1 X111.963 Y140.715 E.01536
G1 X137.042 Y140.715 E.77061
G1 X136.994 Y140.218 E.01536
G1 X137.042 Y139.72 E.01536
G1 X111.963 Y139.72 E.77061
G1 X112.005 Y140.158 E.01351
G1 X136.661 Y140.372 F30000
; LINE_WIDTH: 0.351909
G1 F10902
G1 X136.661 Y140.063 E.00778
G1 X112.345 Y140.063 E.61224
G1 X112.345 Y140.372 E.00778
G1 X136.601 Y140.372 E.61073
G1 X137.381 Y140.377 F30000
; LINE_WIDTH: 0.419999
G1 F10902
G1 X137.381 Y140.059 E.00978
G1 X137.473 Y139.343 E.02217
G1 X111.532 Y139.343 E.7971
G1 X111.624 Y140.059 E.02217
G1 X111.624 Y140.377 E.00978
G1 X111.532 Y141.092 E.02217
G1 X137.473 Y141.092 E.7971
G1 X137.389 Y140.436 E.02032
G1 X137.755 Y140.331 F30000
G1 F10902
G1 X137.837 Y139.431 E.02777
G1 X137.984 Y138.966 E.01499
G1 X111.021 Y138.966 E.82849
G1 X111.168 Y139.431 E.01499
G1 X111.25 Y140.104 E.02083
G1 X111.168 Y141.004 E.02777
G1 X111.021 Y141.47 E.01499
G1 X137.984 Y141.47 E.82849
G1 X137.837 Y141.004 E.01499
G1 X137.763 Y140.391 E.01898
G1 X138.504 Y140.241 F30000
G1 F10902
G1 X138.586 Y139.522 E.02221
G1 X138.837 Y138.844 E.02221
G1 X139.144 Y138.389 E.01688
G1 X139.041 Y138.293 E.00435
G1 X139.044 Y138.212 E.00248
G1 X109.95 Y138.212 E.89398
G3 X109.861 Y138.389 I-.163 J.029 E.00653
G1 X110.147 Y138.804 E.01549
G1 X110.409 Y139.478 E.02221
G1 X110.501 Y140.195 E.02221
G1 X110.42 Y140.913 E.02221
G1 X110.169 Y141.591 E.02221
G1 X109.861 Y142.046 E.01688
G1 X109.955 Y142.137 E.00402
G1 X109.95 Y142.224 E.00266
G1 X139.044 Y142.224 E.89398
G3 X139.144 Y142.046 I.168 J-.022 E.00671
G1 X138.858 Y141.632 E.01549
G1 X138.597 Y140.958 E.02221
G1 X138.512 Y140.3 E.02037
G1 X137.723 Y138.589 F30000
G1 F10902
G1 X110.458 Y138.59 E.83776
G1 X110.761 Y139.344 E.025
G1 X110.876 Y140.15 E.02499
G1 X110.794 Y140.959 E.02499
G1 X110.521 Y141.725 E.02499
G1 X110.458 Y141.846 E.00419
G1 X138.547 Y141.846 E.8631
G1 X138.244 Y141.091 E.02499
G1 X138.13 Y140.286 E.02499
G1 X138.211 Y139.477 E.02499
G1 X138.484 Y138.711 E.02499
M73 P94 R0
G1 X138.547 Y138.59 E.00419
G1 X137.783 Y138.589 E.0235
G1 X109.477 Y138.206 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969208
G1 F10902
G1 X109.315 Y138.023 E.00107
G1 X108.692 Y137.851 F30000
; LINE_WIDTH: 0.405155
G1 F10902
G1 X108.398 Y137.797 E.00881
; LINE_WIDTH: 0.389444
G1 X108.205 Y137.774 E.00551
; LINE_WIDTH: 0.342433
G1 X108.011 Y137.75 E.00476
; LINE_WIDTH: 0.257331
G2 X107.793 Y137.725 I-.317 J1.798 E.00384
G2 X107.188 Y137.727 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X106.994 Y137.75 E.00327
; LINE_WIDTH: 0.295421
G1 X106.801 Y137.774 E.00401
; LINE_WIDTH: 0.342433
G1 X106.607 Y137.797 E.00476
; LINE_WIDTH: 0.389444
G1 X106.314 Y137.851 E.00842
G1 X105.473 Y138.023 F30000
; LINE_WIDTH: 0.151056
G1 F10902
G1 X105.321 Y138.421 E.00375
G1 X105.14 Y139.051 F30000
; LINE_WIDTH: 0.434489
G1 F10902
G1 X105.107 Y139.232 E.00588
; LINE_WIDTH: 0.391801
G1 X105.074 Y139.413 E.00524
; LINE_WIDTH: 0.349112
G1 X105.041 Y139.595 E.00459
; LINE_WIDTH: 0.306424
G1 X105.037 Y139.626 E.00068
; LINE_WIDTH: 0.298796
G1 X105.019 Y139.916 E.00607
; LINE_WIDTH: 0.261158
G2 X105.002 Y140.229 I2.576 J.302 E.00557
; LINE_WIDTH: 0.228538
G1 X105.019 Y140.519 E.0044
; LINE_WIDTH: 0.267101
G2 X105.041 Y140.841 I2.649 J-.015 E.00589
; LINE_WIDTH: 0.306424
G1 X105.074 Y141.022 E.00395
; LINE_WIDTH: 0.349112
G1 X105.107 Y141.203 E.00459
; LINE_WIDTH: 0.3918
G1 X105.14 Y141.384 E.00524
G1 X105.321 Y142.015 F30000
; LINE_WIDTH: 0.151054
G1 F10902
G1 X105.473 Y142.412 E.00375
G1 X106.314 Y142.585 F30000
; LINE_WIDTH: 0.389444
G1 F10902
G1 X106.607 Y142.639 E.00842
; LINE_WIDTH: 0.342433
G1 X106.801 Y142.662 E.00476
; LINE_WIDTH: 0.295422
G1 X106.994 Y142.686 E.00401
; LINE_WIDTH: 0.24841
G1 X107.188 Y142.709 E.00327
; LINE_WIDTH: 0.257331
G2 X107.793 Y142.711 I.315 J-4.984 E.01058
G2 X108.011 Y142.686 I-.098 J-1.823 E.00384
; LINE_WIDTH: 0.342432
G1 X108.205 Y142.662 E.00476
; LINE_WIDTH: 0.389442
G1 X108.398 Y142.639 E.00551
; LINE_WIDTH: 0.405154
G1 X108.692 Y142.585 E.00881
G1 X109.315 Y142.412 F30000
; LINE_WIDTH: 0.096921
G1 F10902
G1 X109.477 Y142.23 E.00107
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.315 Y142.412 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/15
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
G3 Z3.2 I.624 J1.045 P1  F30000
G1 X140.002 Y124.086 Z3.2
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X140.003 Y124.089 E.00009
G1 X140.068 Y124.618 E.01638
G1 X140.003 Y125.148 E.01638
G1 X139.814 Y125.646 E.01638
G1 X139.512 Y126.085 E.01638
G1 X139.112 Y126.438 E.01638
G1 X138.64 Y126.686 E.01638
G1 X138.123 Y126.814 E.01638
G1 X137.59 Y126.814 E.01638
G1 X137.072 Y126.686 E.01638
G1 X136.6 Y126.438 E.01638
G1 X136.201 Y126.085 E.01638
G1 X135.898 Y125.646 E.01638
G1 X135.709 Y125.148 E.01638
G1 X135.645 Y124.618 E.01638
G1 X135.709 Y124.089 E.01638
G1 X135.898 Y123.591 E.01638
G1 X136.201 Y123.152 E.01638
G1 X136.6 Y122.798 E.01638
G1 X137.072 Y122.551 E.01638
G1 X137.59 Y122.423 E.01638
G1 X138.123 Y122.423 E.01638
G1 X138.64 Y122.551 E.01638
G1 X139.112 Y122.798 E.01638
G1 X139.512 Y123.152 E.01638
G1 X139.814 Y123.591 E.01638
G1 X139.981 Y124.03 E.01445
M204 S10000
; WIPE_START
G1 F24000
G1 X140.003 Y124.089 E-.02391
G1 X140.068 Y124.618 E-.20259
G1 X140.003 Y125.148 E-.20259
G1 X139.814 Y125.646 E-.2026
G1 X139.623 Y125.924 E-.12831
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.066 J-1.215 P1  F30000
G1 X106.006 Y124.111 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X106.068 Y124.618 E.01572
G1 X106.003 Y125.148 E.01638
G1 X105.829 Y125.607 E.0151
G1 X105.512 Y126.085 E.01762
G1 X105.076 Y126.458 E.01762
G1 X104.64 Y126.686 E.0151
G1 X104.123 Y126.814 E.01638
G1 X103.59 Y126.814 E.01638
G1 X103.072 Y126.686 E.01638
G1 X102.6 Y126.438 E.01638
G1 X102.201 Y126.085 E.01638
G1 X101.898 Y125.646 E.01638
G1 X101.709 Y125.148 E.01638
G1 X101.645 Y124.618 E.01638
G1 X101.709 Y124.089 E.01638
G1 X101.898 Y123.591 E.01638
G1 X102.201 Y123.152 E.01638
G1 X102.6 Y122.798 E.01638
G1 X103.072 Y122.551 E.01638
G1 X103.59 Y122.423 E.01638
G1 X104.123 Y122.423 E.01638
G1 X104.64 Y122.551 E.01638
G1 X105.112 Y122.798 E.01638
G1 X105.48 Y123.124 E.0151
G1 X105.814 Y123.591 E.01762
G1 X105.99 Y124.053 E.0152
M204 S10000
; WIPE_START
G1 F24000
G1 X106.068 Y124.618 E-.2168
G1 X106.003 Y125.148 E-.20259
G1 X105.829 Y125.607 E-.1868
G1 X105.605 Y125.944 E-.15381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.051 J1.216 P1  F30000
G1 X140.646 Y127.408 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X101.066 Y127.408 E1.21618
G1 X101.066 Y121.828 E.17146
G1 X140.646 Y121.828 E1.21618
G1 X140.646 Y127.348 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X138.646 Y127.351 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.908 J.81 P1  F30000
G1 X139.719 Y126.15 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X140.439 Y126.87 E.03129
G1 X140.237 Y127.201
G1 X139.451 Y126.415 E.03414
G1 X139.204 Y126.702
G1 X139.703 Y127.201 E.0217
M204 S10000
; WIPE_START
G1 F24000
G1 X139.204 Y126.702 E-.26839
G1 X139.451 Y126.415 E-.14367
G1 X140.099 Y127.063 E-.34794
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.113 J.491 P1  F30000
G1 X140.458 Y126.249 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.15832
G1 F15000
G1 X139.886 Y125.972 E.00597
; LINE_WIDTH: 0.154229
G1 X139.86 Y125.985 E.00027
; LINE_WIDTH: 0.105015
G2 X139.79 Y126.049 I.036 J.108 E.00049
G1 X140.219 Y125.785 F30000
; LINE_WIDTH: 0.43449
G1 F15000
G1 X140.252 Y125.604 E.00588
; LINE_WIDTH: 0.391802
G1 X140.285 Y125.423 E.00524
; LINE_WIDTH: 0.349113
G1 X140.318 Y125.242 E.00459
; LINE_WIDTH: 0.306424
G1 X140.322 Y125.21 E.00068
; LINE_WIDTH: 0.298796
G1 X140.34 Y124.92 E.00607
; LINE_WIDTH: 0.261158
G2 X140.357 Y124.607 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X140.34 Y124.317 E.0044
; LINE_WIDTH: 0.267101
G2 X140.318 Y123.995 I-2.649 J.015 E.00589
; LINE_WIDTH: 0.306424
G1 X140.285 Y123.814 E.00395
; LINE_WIDTH: 0.349112
G1 X140.252 Y123.633 E.00459
; LINE_WIDTH: 0.3918
G1 X140.219 Y123.452 E.00524
; WIPE_START
G1 F24000
G1 X140.252 Y123.633 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.184 J-.282 P1  F30000
G1 X139.871 Y122.036 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X140.439 Y122.604 E.02468
G1 X140.439 Y123.137
G1 X139.338 Y122.036 E.04785
M204 S10000
; WIPE_START
G1 F24000
G1 X140.439 Y123.137 E-.59174
G1 X140.439 Y122.694 E-.16826
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.027 J-.652 P1  F30000
G1 X140.061 Y123.289 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.349142
G1 F15000
G2 X139.749 Y122.918 I-3.228 J2.397 E.0121
G1 X139.208 Y122.409 E.01855
G1 X139.045 Y122.252 F30000
; LINE_WIDTH: 0.405157
G1 F15000
G1 X138.752 Y122.198 E.00881
; LINE_WIDTH: 0.389446
G1 X138.558 Y122.174 E.00551
; LINE_WIDTH: 0.342434
G1 X138.365 Y122.151 E.00476
; LINE_WIDTH: 0.257331
G2 X138.147 Y122.126 I-.317 J1.798 E.00384
G2 X137.541 Y122.127 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X137.348 Y122.151 E.00327
; LINE_WIDTH: 0.295421
G1 X137.154 Y122.174 E.00401
; LINE_WIDTH: 0.342432
G1 X136.96 Y122.198 E.00476
; LINE_WIDTH: 0.389444
G1 X136.667 Y122.252 E.00843
; WIPE_START
G1 F24000
G1 X136.96 Y122.198 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.144 J-1.208 P1  F30000
G1 X135.605 Y122.036 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X136.33 Y122.761 E.0315
G1 X136.047 Y123.011
G1 X135.072 Y122.036 E.04238
G1 X134.538 Y122.036
G1 X135.829 Y123.326 E.05607
G1 X135.644 Y123.675
G1 X134.005 Y122.036 E.07123
G1 X133.472 Y122.036
G1 X135.503 Y124.067 E.08826
G1 X135.445 Y124.542
G1 X132.938 Y122.036 E.10892
G1 X132.405 Y122.036
G1 X135.498 Y125.128 E.13438
G1 X136.011 Y126.175
G1 X131.872 Y122.036 E.17985
G1 X131.339 Y122.036
G1 X136.43 Y127.127 E.22125
G1 X135.971 Y127.201
G1 X130.805 Y122.036 E.22445
G1 X130.272 Y122.036
G1 X135.437 Y127.201 E.22445
G1 X134.904 Y127.201
G1 X129.739 Y122.036 E.22445
G1 X129.206 Y122.036
G1 X134.371 Y127.201 E.22445
G1 X133.837 Y127.201
G1 X128.672 Y122.036 E.22445
G1 X128.139 Y122.036
G1 X133.304 Y127.201 E.22445
G1 X132.771 Y127.201
G1 X127.606 Y122.036 E.22445
G1 X127.072 Y122.036
G1 X132.238 Y127.201 E.22445
G1 X131.704 Y127.201
G1 X126.539 Y122.036 E.22445
G1 X126.006 Y122.036
G1 X131.171 Y127.201 E.22445
G1 X130.638 Y127.201
G1 X125.473 Y122.036 E.22445
G1 X124.939 Y122.036
G1 X130.105 Y127.201 E.22445
G1 X129.571 Y127.201
G1 X124.406 Y122.036 E.22445
G1 X123.873 Y122.036
G1 X129.038 Y127.201 E.22445
G1 X128.505 Y127.201
G1 X123.34 Y122.036 E.22445
G1 X122.806 Y122.036
G1 X127.972 Y127.201 E.22445
G1 X127.438 Y127.201
G1 X122.273 Y122.036 E.22445
G1 X121.74 Y122.036
G1 X126.905 Y127.201 E.22445
G1 X126.372 Y127.201
G1 X121.206 Y122.036 E.22445
G1 X120.673 Y122.036
G1 X125.838 Y127.201 E.22445
G1 X125.305 Y127.201
G1 X120.14 Y122.036 E.22445
G1 X119.607 Y122.036
G1 X124.772 Y127.201 E.22445
G1 X124.239 Y127.201
G1 X119.073 Y122.036 E.22445
G1 X118.54 Y122.036
G1 X123.705 Y127.201 E.22445
G1 X123.172 Y127.201
G1 X118.007 Y122.036 E.22445
G1 X117.474 Y122.036
G1 X122.639 Y127.201 E.22445
G1 X122.106 Y127.201
G1 X116.94 Y122.036 E.22445
G1 X116.407 Y122.036
G1 X121.572 Y127.201 E.22445
G1 X121.039 Y127.201
G1 X115.874 Y122.036 E.22445
G1 X115.341 Y122.036
G1 X120.506 Y127.201 E.22445
G1 X119.972 Y127.201
G1 X114.807 Y122.036 E.22445
G1 X114.274 Y122.036
G1 X119.439 Y127.201 E.22445
G1 X118.906 Y127.201
G1 X113.741 Y122.036 E.22445
G1 X113.207 Y122.036
G1 X118.373 Y127.201 E.22445
G1 X117.839 Y127.201
G1 X112.674 Y122.036 E.22445
G1 X112.141 Y122.036
G1 X117.306 Y127.201 E.22445
G1 X116.773 Y127.201
G1 X111.608 Y122.036 E.22445
G1 X111.074 Y122.036
G1 X116.24 Y127.201 E.22445
G1 X115.706 Y127.201
G1 X110.541 Y122.036 E.22445
M73 P95 R0
G1 X110.008 Y122.036
G1 X115.173 Y127.201 E.22445
G1 X114.64 Y127.201
G1 X109.475 Y122.036 E.22445
G1 X108.941 Y122.036
G1 X114.106 Y127.201 E.22445
G1 X113.573 Y127.201
G1 X108.408 Y122.036 E.22445
G1 X107.875 Y122.036
G1 X113.04 Y127.201 E.22445
G1 X112.507 Y127.201
G1 X107.341 Y122.036 E.22445
G1 X106.808 Y122.036
G1 X111.973 Y127.201 E.22445
G1 X111.44 Y127.201
G1 X106.275 Y122.036 E.22445
G1 X105.742 Y122.036
G1 X110.907 Y127.201 E.22445
G1 X110.374 Y127.201
G1 X105.282 Y122.11 E.22124
G1 X105.665 Y123.025
G1 X109.84 Y127.201 E.18146
G1 X109.307 Y127.201
G1 X106.215 Y124.109 E.13438
G1 X106.267 Y124.695
G1 X108.774 Y127.201 E.10892
G1 X108.241 Y127.201
G1 X106.21 Y125.17 E.08825
G1 X106.068 Y125.562
G1 X107.707 Y127.201 E.07123
G1 X107.174 Y127.201
G1 X105.879 Y125.906 E.05626
G1 X105.666 Y126.226
G1 X106.641 Y127.201 E.04237
G1 X106.107 Y127.201
G1 X105.378 Y126.472 E.03169
M204 S10000
; WIPE_START
G1 F24000
G1 X106.107 Y127.201 E-.39185
G1 X106.641 Y127.201 E-.20264
G1 X106.333 Y126.893 E-.1655
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.011 J1.217 P1  F30000
G1 X136.541 Y126.629 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.197148
G1 F15000
G1 X136.479 Y126.654 E.00084
; LINE_WIDTH: 0.270742
G1 X136.414 Y126.68 E.00131
G1 X135.946 Y126.24 E.01193
; WIPE_START
G1 F24000
G1 X136.414 Y126.68 E-.68454
G1 X136.479 Y126.654 E-.07546
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.111 J-1.212 P1  F30000
G1 X106.268 Y123.895 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.135062
G1 F15000
G1 X106.206 Y124.117 E.00173
; WIPE_START
G1 F24000
G1 X106.268 Y123.895 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.028 J1.217 P1  F30000
G1 X135.446 Y124.563 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.103926
G1 F15000
G2 X135.371 Y124.735 I1.353 J.691 E.00094
; WIPE_START
G1 F24000
G1 X135.446 Y124.563 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.087 J.548 P1  F30000
G1 X136.667 Y126.985 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.389444
G1 F15000
G1 X136.96 Y127.039 E.00842
; LINE_WIDTH: 0.342433
G1 X137.154 Y127.063 E.00476
; LINE_WIDTH: 0.295422
G1 X137.348 Y127.086 E.00401
; LINE_WIDTH: 0.24841
G1 X137.541 Y127.11 E.00327
; LINE_WIDTH: 0.257331
G2 X138.147 Y127.111 I.315 J-4.984 E.01058
G2 X138.365 Y127.086 I-.098 J-1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X138.558 Y127.063 E.00476
; LINE_WIDTH: 0.389444
G1 X138.752 Y127.039 E.00551
; LINE_WIDTH: 0.405156
G1 X139.045 Y126.985 E.00881
; WIPE_START
G1 F24000
G1 X138.752 Y127.039 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.002 J-1.217 P1  F30000
G1 X105.045 Y126.985 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.405154
G1 F15000
G1 X104.752 Y127.039 E.00881
; LINE_WIDTH: 0.389444
G1 X104.558 Y127.063 E.00551
; LINE_WIDTH: 0.342433
G1 X104.365 Y127.086 E.00476
; LINE_WIDTH: 0.257331
G3 X104.147 Y127.111 I-.317 J-1.798 E.00384
G3 X103.541 Y127.11 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X103.348 Y127.086 E.00327
; LINE_WIDTH: 0.295422
G1 X103.154 Y127.063 E.00401
; LINE_WIDTH: 0.342433
G1 X102.96 Y127.039 E.00476
; LINE_WIDTH: 0.389444
G1 X102.667 Y126.985 E.00842
; WIPE_START
G1 F24000
G1 X102.96 Y127.039 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.592 J-1.063 P1  F30000
G1 X101.274 Y126.1 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.375 Y127.201 E.04784
G1 X101.841 Y127.201
G1 X101.274 Y126.633 E.02467
M204 S10000
; WIPE_START
G1 F24000
G1 X101.841 Y127.201 E-.30508
G1 X102.375 Y127.201 E-.20264
G1 X101.905 Y126.732 E-.25227
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.194 J1.201 P1  F30000
G1 X102.504 Y126.828 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.35235
G1 F15000
G3 X101.939 Y126.293 I4.13 J-4.93 E.01963
G1 X101.651 Y125.948 E.01134
G1 X101.494 Y125.785 F30000
; LINE_WIDTH: 0.3918
G1 F15000
G1 X101.46 Y125.604 E.00524
; LINE_WIDTH: 0.349112
G1 X101.427 Y125.423 E.00459
; LINE_WIDTH: 0.306424
G1 X101.394 Y125.242 E.00395
; LINE_WIDTH: 0.267101
G3 X101.373 Y124.92 I2.628 J-.336 E.00589
; LINE_WIDTH: 0.228538
G1 X101.355 Y124.63 E.0044
; LINE_WIDTH: 0.261158
G3 X101.373 Y124.317 I2.594 J-.011 E.00557
; LINE_WIDTH: 0.298796
G1 X101.39 Y124.026 E.00607
; LINE_WIDTH: 0.306424
G1 X101.394 Y123.995 E.00068
; LINE_WIDTH: 0.349113
G1 X101.427 Y123.814 E.00459
; LINE_WIDTH: 0.391801
G1 X101.46 Y123.633 E.00524
; LINE_WIDTH: 0.434489
G1 X101.494 Y123.452 E.00588
; WIPE_START
G1 F24000
G1 X101.46 Y123.633 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.151 J.395 P1  F30000
G1 X102.009 Y122.036 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X102.508 Y122.535 E.02171
G1 X102.261 Y122.821
G1 X101.475 Y122.036 E.03414
G1 X101.274 Y122.367
G1 X101.994 Y123.087 E.03129
M204 S10000
G1 X101.922 Y123.188 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881698
G1 F15000
G1 X101.879 Y123.239 E.00025
; LINE_WIDTH: 0.0961953
G1 X101.853 Y123.252 E.00013
; LINE_WIDTH: 0.152833
G1 X101.826 Y123.265 E.00026
G1 X101.255 Y122.988 E.00569
; WIPE_START
G1 F24000
G1 X101.826 Y123.265 E-.72659
G1 X101.853 Y123.252 E-.03341
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.944 J.768 P1  F30000
G1 X102.667 Y122.252 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.389446
G1 F15000
G1 X102.96 Y122.198 E.00842
; LINE_WIDTH: 0.342433
G1 X103.154 Y122.174 E.00476
; LINE_WIDTH: 0.295421
G1 X103.348 Y122.151 E.00401
; LINE_WIDTH: 0.24841
G1 X103.541 Y122.127 E.00327
; LINE_WIDTH: 0.257331
G3 X104.147 Y122.126 I.315 J4.984 E.01058
G3 X104.365 Y122.151 I-.098 J1.823 E.00384
; LINE_WIDTH: 0.342432
G1 X104.558 Y122.174 E.00476
; LINE_WIDTH: 0.389442
G1 X104.752 Y122.198 E.00551
; LINE_WIDTH: 0.405153
G1 X105.045 Y122.252 E.00881
; WIPE_START
G1 F24000
G1 X104.752 Y122.198 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.499 J1.11 P1  F30000
G1 X143.649 Y139.686 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.65 Y139.689 E.00009
G1 X143.714 Y140.218 E.01638
G1 X143.65 Y140.747 E.01638
G1 X143.461 Y141.246 E.01638
G1 X143.158 Y141.684 E.01638
G1 X142.759 Y142.038 E.01638
G1 X142.287 Y142.286 E.01638
G1 X141.769 Y142.413 E.01638
G1 X141.236 Y142.413 E.01638
G1 X140.719 Y142.286 E.01638
G1 X140.246 Y142.038 E.01638
G1 X139.847 Y141.684 E.01638
G1 X139.545 Y141.246 E.01638
G1 X139.355 Y140.747 E.01638
G1 X139.291 Y140.218 E.01638
G1 X139.355 Y139.689 E.01638
G1 X139.545 Y139.19 E.01638
G1 X139.847 Y138.751 E.01638
G1 X140.246 Y138.398 E.01638
G1 X140.719 Y138.15 E.01638
G1 X141.236 Y138.022 E.01638
G1 X141.769 Y138.022 E.01638
G1 X142.287 Y138.15 E.01638
G1 X142.759 Y138.398 E.01638
G1 X143.158 Y138.751 E.01638
G1 X143.461 Y139.19 E.01638
M73 P96 R0
G1 X143.628 Y139.63 E.01445
M204 S10000
; WIPE_START
G1 F24000
G1 X143.65 Y139.689 E-.02391
G1 X143.714 Y140.218 E-.20259
G1 X143.65 Y140.747 E-.20259
G1 X143.461 Y141.246 E-.2026
G1 X143.269 Y141.523 E-.12831
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.066 J-1.215 P1  F30000
G1 X109.653 Y139.71 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X109.714 Y140.218 E.01572
G1 X109.65 Y140.747 E.01638
G1 X109.476 Y141.207 E.0151
G1 X109.158 Y141.684 E.01762
G1 X108.722 Y142.057 E.01762
G1 X108.287 Y142.286 E.0151
G1 X107.769 Y142.413 E.01638
G1 X107.236 Y142.413 E.01638
G1 X106.719 Y142.286 E.01638
G1 X106.246 Y142.038 E.01638
G1 X105.847 Y141.684 E.01638
G1 X105.545 Y141.246 E.01638
G1 X105.355 Y140.747 E.01638
G1 X105.291 Y140.218 E.01638
G1 X105.355 Y139.689 E.01638
G1 X105.545 Y139.19 E.01638
G1 X105.847 Y138.751 E.01638
G1 X106.246 Y138.398 E.01638
G1 X106.719 Y138.15 E.01638
G1 X107.236 Y138.022 E.01638
G1 X107.769 Y138.022 E.01638
G1 X108.287 Y138.15 E.01638
G1 X108.759 Y138.398 E.01638
G1 X109.127 Y138.724 E.0151
G1 X109.461 Y139.19 E.01762
G1 X109.636 Y139.653 E.0152
M204 S10000
; WIPE_START
G1 F24000
G1 X109.714 Y140.218 E-.2168
G1 X109.65 Y140.747 E-.20259
G1 X109.476 Y141.207 E-.1868
G1 X109.252 Y141.544 E-.15381
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.051 J1.216 P1  F30000
G1 X144.293 Y143.008 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X104.713 Y143.008 E1.21618
G1 X104.713 Y137.428 E.17146
G1 X144.293 Y137.428 E1.21618
G1 X144.293 Y142.948 E.16961
M204 S10000
; WIPE_START
G1 F24000
G1 X142.293 Y142.951 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.908 J.81 P1  F30000
G1 X143.365 Y141.749 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X144.085 Y142.469 E.03129
G1 X143.883 Y142.8
G1 X143.098 Y142.015 E.03414
G1 X142.851 Y142.301
G1 X143.35 Y142.8 E.0217
M204 S10000
; WIPE_START
G1 F24000
G1 X142.851 Y142.301 E-.26839
G1 X143.098 Y142.015 E-.14367
G1 X143.745 Y142.662 E-.34794
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.113 J.491 P1  F30000
G1 X144.104 Y141.848 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.15832
G1 F15000
G1 X143.533 Y141.572 E.00597
; LINE_WIDTH: 0.154229
G1 X143.506 Y141.584 E.00027
; LINE_WIDTH: 0.105015
G2 X143.437 Y141.648 I.036 J.108 E.00049
G1 X143.865 Y141.384 F30000
; LINE_WIDTH: 0.43449
G1 F15000
G1 X143.899 Y141.203 E.00588
; LINE_WIDTH: 0.391802
G1 X143.932 Y141.022 E.00524
; LINE_WIDTH: 0.349113
G1 X143.965 Y140.841 E.00459
; LINE_WIDTH: 0.306424
G1 X143.969 Y140.81 E.00068
; LINE_WIDTH: 0.298796
G1 X143.986 Y140.519 E.00607
; LINE_WIDTH: 0.261158
G2 X144.004 Y140.207 I-2.576 J-.302 E.00557
; LINE_WIDTH: 0.228538
G1 X143.986 Y139.916 E.0044
; LINE_WIDTH: 0.267101
G2 X143.965 Y139.595 I-2.649 J.015 E.00589
; LINE_WIDTH: 0.306424
G1 X143.932 Y139.413 E.00395
; LINE_WIDTH: 0.349112
G1 X143.899 Y139.232 E.00459
; LINE_WIDTH: 0.3918
G1 X143.865 Y139.051 E.00524
; WIPE_START
G1 F24000
G1 X143.899 Y139.232 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.184 J-.282 P1  F30000
G1 X143.517 Y137.635 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X144.085 Y138.203 E.02468
G1 X144.085 Y138.736
G1 X142.984 Y137.635 E.04785
M204 S10000
; WIPE_START
G1 F24000
G1 X144.085 Y138.736 E-.59174
G1 X144.085 Y138.294 E-.16826
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.027 J-.652 P1  F30000
G1 X143.708 Y138.888 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.349142
G1 F15000
G2 X143.396 Y138.517 I-3.228 J2.397 E.0121
G1 X142.855 Y138.008 E.01855
G1 X142.692 Y137.851 F30000
; LINE_WIDTH: 0.405157
G1 F15000
G1 X142.398 Y137.797 E.00881
; LINE_WIDTH: 0.389446
G1 X142.205 Y137.774 E.00551
; LINE_WIDTH: 0.342434
G1 X142.011 Y137.75 E.00476
; LINE_WIDTH: 0.257331
G2 X141.793 Y137.725 I-.317 J1.798 E.00384
G2 X141.188 Y137.727 I-.29 J4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X140.994 Y137.75 E.00327
; LINE_WIDTH: 0.295421
G1 X140.801 Y137.774 E.00401
; LINE_WIDTH: 0.342432
G1 X140.607 Y137.797 E.00476
; LINE_WIDTH: 0.389444
G1 X140.314 Y137.851 E.00843
; WIPE_START
G1 F24000
G1 X140.607 Y137.797 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.144 J-1.208 P1  F30000
G1 X139.251 Y137.635 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X139.976 Y138.36 E.0315
G1 X139.693 Y138.611
G1 X138.718 Y137.635 E.04238
G1 X138.185 Y137.635
G1 X139.475 Y138.926 E.05607
G1 X139.291 Y139.274
G1 X137.652 Y137.635 E.07123
G1 X137.118 Y137.635
G1 X139.149 Y139.666 E.08826
G1 X139.092 Y140.142
G1 X136.585 Y137.635 E.10892
G1 X136.052 Y137.635
G1 X139.144 Y140.728 E.13438
G1 X139.657 Y141.774
G1 X135.518 Y137.635 E.17985
G1 X134.985 Y137.635
G1 X140.077 Y142.727 E.22125
G1 X139.617 Y142.8
G1 X134.452 Y137.635 E.22445
G1 X133.919 Y137.635
G1 X139.084 Y142.8 E.22445
G1 X138.551 Y142.8
G1 X133.385 Y137.635 E.22445
G1 X132.852 Y137.635
G1 X138.017 Y142.8 E.22445
G1 X137.484 Y142.8
G1 X132.319 Y137.635 E.22445
G1 X131.786 Y137.635
G1 X136.951 Y142.8 E.22445
G1 X136.417 Y142.8
G1 X131.252 Y137.635 E.22445
G1 X130.719 Y137.635
G1 X135.884 Y142.8 E.22445
G1 X135.351 Y142.8
G1 X130.186 Y137.635 E.22445
G1 X129.652 Y137.635
G1 X134.818 Y142.8 E.22445
G1 X134.284 Y142.8
G1 X129.119 Y137.635 E.22445
G1 X128.586 Y137.635
G1 X133.751 Y142.8 E.22445
G1 X133.218 Y142.8
G1 X128.053 Y137.635 E.22445
G1 X127.519 Y137.635
G1 X132.685 Y142.8 E.22445
G1 X132.151 Y142.8
G1 X126.986 Y137.635 E.22445
G1 X126.453 Y137.635
G1 X131.618 Y142.8 E.22445
G1 X131.085 Y142.8
G1 X125.92 Y137.635 E.22445
G1 X125.386 Y137.635
G1 X130.552 Y142.8 E.22445
G1 X130.018 Y142.8
G1 X124.853 Y137.635 E.22445
G1 X124.32 Y137.635
G1 X129.485 Y142.8 E.22445
G1 X128.952 Y142.8
G1 X123.786 Y137.635 E.22445
G1 X123.253 Y137.635
G1 X128.418 Y142.8 E.22445
G1 X127.885 Y142.8
G1 X122.72 Y137.635 E.22445
G1 X122.187 Y137.635
G1 X127.352 Y142.8 E.22445
G1 X126.819 Y142.8
G1 X121.653 Y137.635 E.22445
G1 X121.12 Y137.635
G1 X126.285 Y142.8 E.22445
G1 X125.752 Y142.8
G1 X120.587 Y137.635 E.22445
G1 X120.054 Y137.635
G1 X125.219 Y142.8 E.22445
G1 X124.686 Y142.8
G1 X119.52 Y137.635 E.22445
G1 X118.987 Y137.635
G1 X124.152 Y142.8 E.22445
G1 X123.619 Y142.8
G1 X118.454 Y137.635 E.22445
G1 X117.921 Y137.635
G1 X123.086 Y142.8 E.22445
G1 X122.552 Y142.8
G1 X117.387 Y137.635 E.22445
G1 X116.854 Y137.635
G1 X122.019 Y142.8 E.22445
G1 X121.486 Y142.8
G1 X116.321 Y137.635 E.22445
G1 X115.787 Y137.635
G1 X120.953 Y142.8 E.22445
G1 X120.419 Y142.8
G1 X115.254 Y137.635 E.22445
G1 X114.721 Y137.635
G1 X119.886 Y142.8 E.22445
G1 X119.353 Y142.8
G1 X114.188 Y137.635 E.22445
G1 X113.654 Y137.635
G1 X118.82 Y142.8 E.22445
G1 X118.286 Y142.8
G1 X113.121 Y137.635 E.22445
G1 X112.588 Y137.635
G1 X117.753 Y142.8 E.22445
G1 X117.22 Y142.8
G1 X112.055 Y137.635 E.22445
G1 X111.521 Y137.635
G1 X116.686 Y142.8 E.22445
G1 X116.153 Y142.8
G1 X110.988 Y137.635 E.22445
G1 X110.455 Y137.635
G1 X115.62 Y142.8 E.22445
G1 X115.087 Y142.8
G1 X109.921 Y137.635 E.22445
G1 X109.388 Y137.635
G1 X114.553 Y142.8 E.22445
G1 X114.02 Y142.8
G1 X108.929 Y137.709 E.22124
G1 X109.311 Y138.625
G1 X113.487 Y142.8 E.18146
G1 X112.954 Y142.8
G1 X109.861 Y139.708 E.13438
G1 X109.914 Y140.294
G1 X112.42 Y142.8 E.10892
M73 P97 R0
G1 X111.887 Y142.8
G1 X109.856 Y140.77 E.08825
G1 X109.715 Y141.161
G1 X111.354 Y142.8 E.07123
G1 X110.821 Y142.8
G1 X109.526 Y141.506 E.05626
G1 X109.312 Y141.825
G1 X110.287 Y142.8 E.04237
G1 X109.754 Y142.8
G1 X109.025 Y142.071 E.03169
M204 S10000
; WIPE_START
G1 F24000
G1 X109.754 Y142.8 E-.39185
G1 X110.287 Y142.8 E-.20264
G1 X109.979 Y142.492 E-.1655
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.011 J1.217 P1  F30000
G1 X140.187 Y142.228 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.197148
G1 F15000
G1 X140.126 Y142.253 E.00084
; LINE_WIDTH: 0.270742
G1 X140.06 Y142.28 E.00131
G1 X139.592 Y141.839 E.01193
; WIPE_START
G1 F24000
G1 X140.06 Y142.28 E-.68454
G1 X140.126 Y142.253 E-.07546
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.111 J-1.212 P1  F30000
G1 X109.914 Y139.494 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.135062
G1 F15000
G1 X109.853 Y139.717 E.00173
; WIPE_START
G1 F24000
G1 X109.914 Y139.494 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.028 J1.217 P1  F30000
G1 X139.093 Y140.162 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.103926
G1 F15000
G2 X139.018 Y140.335 I1.353 J.691 E.00094
; WIPE_START
G1 F24000
G1 X139.093 Y140.162 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.087 J.548 P1  F30000
G1 X140.314 Y142.585 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.389444
G1 F15000
G1 X140.607 Y142.639 E.00842
; LINE_WIDTH: 0.342433
G1 X140.801 Y142.662 E.00476
; LINE_WIDTH: 0.295422
G1 X140.994 Y142.686 E.00401
; LINE_WIDTH: 0.24841
G1 X141.188 Y142.709 E.00327
; LINE_WIDTH: 0.257331
G2 X141.793 Y142.711 I.315 J-4.984 E.01058
G2 X142.011 Y142.686 I-.098 J-1.823 E.00384
; LINE_WIDTH: 0.342433
G1 X142.205 Y142.662 E.00476
; LINE_WIDTH: 0.389444
G1 X142.398 Y142.639 E.00551
; LINE_WIDTH: 0.405156
G1 X142.692 Y142.585 E.00881
; WIPE_START
G1 F24000
G1 X142.398 Y142.639 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.002 J-1.217 P1  F30000
G1 X108.692 Y142.585 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.405154
G1 F15000
G1 X108.398 Y142.639 E.00881
; LINE_WIDTH: 0.389444
G1 X108.205 Y142.662 E.00551
; LINE_WIDTH: 0.342433
G1 X108.011 Y142.686 E.00476
; LINE_WIDTH: 0.257331
G3 X107.793 Y142.711 I-.317 J-1.798 E.00384
G3 X107.188 Y142.709 I-.29 J-4.986 E.01058
; LINE_WIDTH: 0.24841
G1 X106.994 Y142.686 E.00327
; LINE_WIDTH: 0.295422
G1 X106.801 Y142.662 E.00401
; LINE_WIDTH: 0.342433
G1 X106.607 Y142.639 E.00476
; LINE_WIDTH: 0.389444
G1 X106.314 Y142.585 E.00842
; WIPE_START
G1 F24000
G1 X106.607 Y142.639 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.592 J-1.063 P1  F30000
G1 X104.92 Y141.699 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.021 Y142.8 E.04784
G1 X105.488 Y142.8
G1 X104.92 Y142.233 E.02467
M204 S10000
; WIPE_START
G1 F24000
G1 X105.488 Y142.8 E-.30508
G1 X106.021 Y142.8 E-.20264
G1 X105.552 Y142.331 E-.25227
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.194 J1.201 P1  F30000
G1 X106.151 Y142.428 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.35235
G1 F15000
G3 X105.586 Y141.893 I4.13 J-4.93 E.01963
G1 X105.298 Y141.547 E.01134
G1 X105.14 Y141.384 F30000
; LINE_WIDTH: 0.3918
G1 F15000
G1 X105.107 Y141.203 E.00524
; LINE_WIDTH: 0.349112
G1 X105.074 Y141.022 E.00459
; LINE_WIDTH: 0.306424
G1 X105.041 Y140.841 E.00395
; LINE_WIDTH: 0.267101
G3 X105.019 Y140.519 I2.628 J-.336 E.00589
; LINE_WIDTH: 0.228538
G1 X105.002 Y140.229 E.0044
; LINE_WIDTH: 0.261158
G3 X105.019 Y139.916 I2.594 J-.011 E.00557
; LINE_WIDTH: 0.298796
G1 X105.037 Y139.626 E.00607
; LINE_WIDTH: 0.306424
G1 X105.041 Y139.595 E.00068
; LINE_WIDTH: 0.349113
G1 X105.074 Y139.413 E.00459
; LINE_WIDTH: 0.391801
G1 X105.107 Y139.232 E.00524
; LINE_WIDTH: 0.434489
G1 X105.14 Y139.051 E.00588
; WIPE_START
G1 F24000
G1 X105.107 Y139.232 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.151 J.395 P1  F30000
G1 X105.655 Y137.635 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X106.155 Y138.135 E.02171
G1 X105.908 Y138.421
G1 X105.122 Y137.635 E.03414
G1 X104.92 Y137.967
G1 X105.64 Y138.687 E.03129
M204 S10000
G1 X105.568 Y138.787 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881698
G1 F15000
G1 X105.526 Y138.839 E.00025
; LINE_WIDTH: 0.0961953
G1 X105.499 Y138.851 E.00013
; LINE_WIDTH: 0.152833
G1 X105.473 Y138.864 E.00026
G1 X104.901 Y138.587 E.00569
; WIPE_START
G1 F24000
G1 X105.473 Y138.864 E-.72659
G1 X105.499 Y138.851 E-.03341
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.944 J.768 P1  F30000
G1 X106.314 Y137.851 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.389446
G1 F15000
G1 X106.607 Y137.797 E.00842
; LINE_WIDTH: 0.342433
G1 X106.801 Y137.774 E.00476
; LINE_WIDTH: 0.295421
G1 X106.994 Y137.75 E.00401
; LINE_WIDTH: 0.24841
G1 X107.188 Y137.727 E.00327
; LINE_WIDTH: 0.257331
G3 X107.793 Y137.725 I.315 J4.984 E.01058
G3 X108.011 Y137.75 I-.098 J1.823 E.00384
; LINE_WIDTH: 0.342432
G1 X108.205 Y137.774 E.00476
; LINE_WIDTH: 0.389442
G1 X108.398 Y137.797 E.00551
; LINE_WIDTH: 0.405153
G1 X108.692 Y137.851 E.00881
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X108.398 Y137.797 E-.76
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
G1 Z3.5 F900 ; lower z a little
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

    G1 Z103 F600
    G1 Z101

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

