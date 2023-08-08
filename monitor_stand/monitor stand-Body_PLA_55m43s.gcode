; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 49m 55s; total estimated time: 55m 43s
; total layer number: 275
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
M73 P0 R55
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
M73 P7 R51
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
M73 P8 R51
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
G1 E-0.5 F300

G1 X70 F9000
M73 P8 R50
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
M73 P9 R50
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
    G29 A X38.5009 Y103.501 I182.998 J52.9982
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
; layer num/total_layer_count: 1/275
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
G1 X42.315 Y102.335 F30000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
; LINE_WIDTH: 0.5
G1 F3000
G1 X43.296 Y101.97 E.03899
G1 X44.046 Y101.804 E.02859
G1 X45.009 Y101.729 E.03598
G1 X54.993 Y101.729 E.37187
G1 X55.769 Y101.778 E.02898
G1 X56.527 Y101.922 E.02871
G1 X57.26 Y102.159 E.0287
G1 X57.988 Y102.502 E.02997
G1 X58.722 Y102.963 E.0323
G1 X59.315 Y103.455 E.02869
G1 X59.842 Y104.018 E.02871
G1 X60.295 Y104.642 E.02871
G1 X60.665 Y105.315 E.02864
G1 X61.015 Y106.244 E.03696
G1 X61.196 Y107.046 E.03063
G1 X61.271 Y108.009 E.03596
G1 X61.271 Y131.501 E.87499
G1 X61.319 Y131.642 E.00555
G1 X61.499 Y131.729 E.00745
M73 P10 R50
G1 X198.501 Y131.729 E5.1028
G1 X198.642 Y131.681 E.00555
G1 X198.729 Y131.501 E.00745
G1 X198.729 Y108.007 E.87505
G1 X198.778 Y107.231 E.02898
G1 X198.922 Y106.473 E.02871
G1 X199.159 Y105.741 E.02867
G1 X199.548 Y104.929 E.03354
G1 X199.963 Y104.278 E.02873
G1 X200.455 Y103.685 E.02871
G1 X201.018 Y103.158 E.02871
G1 X201.642 Y102.705 E.02871
G1 X202.315 Y102.335 E.02864
G1 X203.244 Y101.985 E.03696
G1 X204.046 Y101.804 E.03063
G1 X205.009 Y101.729 E.03596
G1 X214.993 Y101.729 E.37187
G1 X215.769 Y101.778 E.02898
G1 X216.527 Y101.922 E.02871
G1 X217.259 Y102.159 E.02867
G1 X218.071 Y102.548 E.03354
G1 X218.722 Y102.963 E.02873
M73 P10 R49
G1 X219.315 Y103.455 E.02871
G1 X219.842 Y104.018 E.02871
G1 X220.295 Y104.642 E.02871
G1 X220.665 Y105.315 E.02864
G1 X221.015 Y106.244 E.03696
G1 X221.196 Y107.046 E.03063
G1 X221.271 Y108.009 E.03596
G1 X221.271 Y147.993 E1.48925
G1 X221.222 Y148.769 E.02898
G1 X221.078 Y149.527 E.02871
G1 X220.841 Y150.259 E.02867
G1 X220.452 Y151.071 E.03354
G1 X220.037 Y151.722 E.02873
G1 X219.545 Y152.315 E.02871
G1 X218.982 Y152.842 E.02871
G1 X218.358 Y153.295 E.02871
G1 X217.685 Y153.665 E.02864
G1 X216.756 Y154.015 E.03696
G1 X215.954 Y154.196 E.03063
G1 X214.991 Y154.271 E.03596
G1 X45.007 Y154.271 E6.33126
G1 X44.231 Y154.222 E.02898
G1 X43.473 Y154.078 E.02871
G1 X42.741 Y153.841 E.02867
G1 X41.929 Y153.452 E.03354
G1 X41.278 Y153.037 E.02873
G1 X40.685 Y152.545 E.02871
G1 X40.158 Y151.982 E.02871
G1 X39.705 Y151.358 E.02871
G1 X39.335 Y150.685 E.02864
G1 X38.985 Y149.756 E.03696
G1 X38.804 Y148.954 E.03063
G1 X38.729 Y147.991 E.03596
G1 X38.729 Y108.007 E1.48925
G1 X38.778 Y107.231 E.02898
G1 X38.922 Y106.473 E.02871
G1 X39.159 Y105.74 E.0287
G1 X39.502 Y105.012 E.02997
G1 X39.963 Y104.278 E.0323
G1 X40.455 Y103.685 E.02869
G1 X41.018 Y103.158 E.02871
G1 X41.642 Y102.705 E.02871
G1 X42.262 Y102.364 E.02639
G1 X42.482 Y102.766 F30000
G1 F3000
G1 X42.515 Y102.748 E.00139
G1 X43.435 Y102.407 E.03654
G1 X44.123 Y102.257 E.02622
G1 X45.032 Y102.187 E.03396
G1 X54.983 Y102.187 E.37064
G1 X55.721 Y102.234 E.02754
G1 X56.422 Y102.368 E.02658
G1 X57.1 Y102.588 E.02655
G1 X57.775 Y102.908 E.02783
G1 X58.446 Y103.329 E.0295
G1 X58.994 Y103.783 E.02651
G1 X59.494 Y104.316 E.02722
G1 X59.903 Y104.88 E.02594
G1 X60.244 Y105.498 E.02631
G1 X60.573 Y106.366 E.03457
G1 X60.74 Y107.105 E.0282
G1 X60.813 Y108.032 E.03464
G1 X60.813 Y131.489 E.87371
G1 X60.883 Y131.778 E.01103
G1 X60.985 Y131.95 E.00749
G1 X61.131 Y132.058 E.00674
G1 X61.285 Y132.134 E.00639
G1 X61.515 Y132.187 E.00878
G1 X198.489 Y132.187 E5.10179
G1 X198.661 Y132.158 E.00647
G1 X198.778 Y132.117 E.0046
G1 X198.95 Y132.015 E.00749
G1 X199.058 Y131.869 E.00674
G1 X199.134 Y131.715 E.00639
G1 X199.187 Y131.485 E.00878
G1 X199.187 Y108.017 E.8741
G1 X199.234 Y107.279 E.02754
G1 X199.368 Y106.578 E.02658
G1 X199.588 Y105.902 E.02648
G1 X199.952 Y105.144 E.03133
G1 X200.328 Y104.555 E.02601
G1 X200.783 Y104.006 E.02658
G1 X201.303 Y103.517 E.02658
G1 X201.88 Y103.097 E.02658
G1 X202.516 Y102.747 E.02704
G1 X203.366 Y102.427 E.03384
G1 X204.105 Y102.26 E.0282
G1 X205.032 Y102.187 E.03464
G1 X214.974 Y102.187 E.37032
G1 X215.704 Y102.232 E.02722
G1 X216.422 Y102.368 E.02722
G1 X217.098 Y102.588 E.02648
G1 X217.856 Y102.952 E.03133
G1 X218.458 Y103.338 E.02665
G1 X219.007 Y103.795 E.02658
G1 X219.483 Y104.303 E.02594
G1 X219.903 Y104.88 E.02658
G1 X220.253 Y105.516 E.02704
G1 X220.573 Y106.366 E.03384
G1 X220.743 Y107.124 E.02894
G1 X220.813 Y108.032 E.0339
G1 X220.813 Y147.974 E1.4877
G1 X220.768 Y148.704 E.02722
G1 X220.632 Y149.422 E.02722
G1 X220.412 Y150.098 E.02648
G1 X220.048 Y150.856 E.03133
G1 X219.672 Y151.445 E.02601
G1 X219.217 Y151.994 E.02658
G1 X218.684 Y152.494 E.02722
G1 X218.12 Y152.903 E.02594
G1 X217.502 Y153.244 E.02631
G1 X216.634 Y153.573 E.03457
G1 X215.876 Y153.743 E.02894
G1 X214.968 Y153.813 E.0339
G1 X45.026 Y153.813 E6.32971
G1 X44.296 Y153.768 E.02722
G1 X43.578 Y153.632 E.02722
G1 X42.902 Y153.412 E.02648
G1 X42.144 Y153.048 E.03133
G1 X41.542 Y152.662 E.02665
G1 X40.993 Y152.205 E.02658
G1 X40.517 Y151.697 E.02594
G1 X40.097 Y151.12 E.02658
G1 X39.747 Y150.484 E.02704
G1 X39.427 Y149.634 E.03384
G1 X39.257 Y148.876 E.02894
G1 X39.187 Y147.968 E.0339
G1 X39.187 Y108.026 E1.4877
G1 X39.232 Y107.296 E.02722
G1 X39.364 Y106.595 E.02658
G1 X39.588 Y105.9 E.02719
G1 X39.908 Y105.225 E.02783
G1 X40.329 Y104.554 E.0295
G1 X40.795 Y103.993 E.02715
G1 X41.316 Y103.506 E.02658
G1 X41.894 Y103.088 E.02658
G1 X42.43 Y102.795 E.02273
G1 X42.649 Y103.197 F30000
G1 F3000
G1 X42.715 Y103.162 E.00279
G1 X43.573 Y102.845 E.03408
G1 X44.199 Y102.709 E.02385
G1 X45.055 Y102.644 E.03197
G1 X54.964 Y102.644 E.36907
G1 X55.671 Y102.69 E.02641
G1 X56.316 Y102.814 E.02445
G1 X56.939 Y103.018 E.0244
G1 X57.562 Y103.314 E.0257
G1 X58.17 Y103.696 E.02674
G1 X58.687 Y104.123 E.02497
G1 X59.135 Y104.602 E.02443
G1 X59.521 Y105.133 E.02446
G1 X59.832 Y105.7 E.02409
G1 X60.136 Y106.508 E.03216
G1 X60.288 Y107.184 E.0258
G1 X60.356 Y108.055 E.03256
G1 X60.356 Y131.476 E.87233
G1 X60.437 Y131.876 E.01521
G1 X60.495 Y132.021 E.0058
G1 X60.586 Y132.173 E.0066
G1 X60.723 Y132.325 E.00763
G1 X60.849 Y132.419 E.00586
G1 X61.076 Y132.54 E.00956
G1 X61.407 Y132.63 E.0128
G1 X61.522 Y132.644 E.00432
G1 X198.48 Y132.644 E5.10115
G1 X198.73 Y132.609 E.00938
M73 P11 R49
G1 X198.918 Y132.552 E.00734
G1 X199.175 Y132.412 E.01089
G1 X199.325 Y132.277 E.00753
G1 X199.419 Y132.151 E.00586
G1 X199.542 Y131.92 E.00975
G1 X199.58 Y131.813 E.00422
G1 X199.644 Y131.473 E.01289
G1 X199.644 Y108.036 E.87292
G1 X199.688 Y107.346 E.02577
G1 X199.814 Y106.684 E.02508
G1 X200.017 Y106.064 E.02429
G1 X200.349 Y105.374 E.02852
G1 X200.694 Y104.832 E.02392
G1 X201.111 Y104.326 E.02446
G1 X201.589 Y103.875 E.02445
G1 X202.119 Y103.489 E.02443
G1 X202.717 Y103.16 E.02542
G1 X203.489 Y102.869 E.03075
G1 X204.164 Y102.715 E.02578
G1 X205.055 Y102.644 E.0333
G1 X214.964 Y102.644 E.36908
G1 X215.655 Y102.688 E.02578
G1 X216.299 Y102.81 E.02442
G1 X216.919 Y103.01 E.02424
G1 X217.64 Y103.357 E.0298
G1 X218.194 Y103.713 E.02455
G1 X218.698 Y104.134 E.02446
G1 X219.135 Y104.602 E.02384
G1 X219.511 Y105.119 E.02381
G1 X219.84 Y105.717 E.02542
G1 X220.131 Y106.489 E.03073
G1 X220.288 Y107.183 E.0265
G1 X220.356 Y108.055 E.03258
G1 X220.356 Y147.956 E1.48616
G1 X220.314 Y148.638 E.02546
G1 X220.19 Y149.299 E.02506
G1 X219.983 Y149.936 E.02492
G1 X219.643 Y150.64 E.02913
G1 X219.296 Y151.181 E.02394
G1 X218.889 Y151.674 E.02381
G1 X218.398 Y152.135 E.02508
G1 X217.867 Y152.521 E.02446
G1 X217.3 Y152.832 E.02409
G1 X216.492 Y153.136 E.03215
G1 X215.798 Y153.291 E.02652
G1 X214.945 Y153.356 E.03184
G1 X45.044 Y153.356 E6.32817
G1 X44.345 Y153.312 E.0261
G1 X43.701 Y153.19 E.02442
G1 X43.081 Y152.99 E.02424
G1 X42.375 Y152.651 E.02918
G1 X41.806 Y152.287 E.02517
G1 X41.302 Y151.866 E.02446
G1 X40.865 Y151.398 E.02384
G1 X40.489 Y150.881 E.02381
G1 X40.16 Y150.283 E.02542
G1 X39.864 Y149.493 E.03143
G1 X39.709 Y148.798 E.02653
G1 X39.644 Y147.945 E.03184
G1 X39.644 Y108.044 E1.48616
G1 X39.686 Y107.361 E.02548
G1 X39.81 Y106.7 E.02508
G1 X40.018 Y106.061 E.02502
G1 X40.314 Y105.438 E.02569
G1 X40.695 Y104.83 E.02672
G1 X41.122 Y104.314 E.02496
G1 X41.601 Y103.865 E.02444
G1 X42.147 Y103.471 E.02508
G1 X42.596 Y103.226 E.01907
G1 X42.814 Y103.629 F30000
G1 F3000
G1 X42.913 Y103.575 E.00419
G1 X43.711 Y103.283 E.03164
G1 X44.275 Y103.162 E.02148
G1 X45.078 Y103.101 E.02999
G1 X54.944 Y103.101 E.36751
G1 X55.621 Y103.146 E.02527
G1 X56.209 Y103.26 E.02231
G1 X56.777 Y103.447 E.02226
G1 X57.349 Y103.719 E.02359
G1 X57.894 Y104.062 E.02399
G1 X58.379 Y104.463 E.02344
G1 X58.787 Y104.9 E.02228
G1 X59.138 Y105.386 E.02232
G1 X59.419 Y105.9 E.02184
G1 X59.699 Y106.648 E.02975
G1 X59.836 Y107.262 E.0234
G1 X59.899 Y108.078 E.03051
G1 X59.899 Y131.464 E.87102
G1 X59.987 Y131.957 E.01867
G1 X60.07 Y132.187 E.0091
G1 X60.189 Y132.399 E.00904
G1 X60.379 Y132.625 E.01099
G1 X60.571 Y132.781 E.00925
G1 X60.855 Y132.94 E.01211
G1 X61.364 Y133.085 E.01969
G1 X61.529 Y133.101 E.00618
G1 X198.472 Y133.101 E5.10061
G1 X198.784 Y133.063 E.01169
G1 X199.041 Y132.992 E.00996
G1 X199.384 Y132.818 E.0143
G1 X199.624 Y132.622 E.01155
G1 X199.827 Y132.357 E.01243
G1 X199.975 Y132.066 E.01217
G1 X200.03 Y131.89 E.00684
G1 X200.101 Y131.461 E.0162
G1 X200.101 Y108.055 E.8718
G1 X200.142 Y107.412 E.024
G1 X200.261 Y106.79 E.02357
G1 X200.446 Y106.227 E.02209
G1 X200.746 Y105.604 E.02574
G1 X201.06 Y105.108 E.02185
G1 X201.44 Y104.645 E.02233
G1 X201.875 Y104.234 E.02231
G1 X202.357 Y103.88 E.02225
G1 X202.917 Y103.573 E.0238
G1 X203.613 Y103.311 E.02768
G1 X204.224 Y103.17 E.02336
G1 X205.079 Y103.101 E.03195
G1 X214.945 Y103.101 E.36749
G1 X215.606 Y103.144 E.02466
G1 X216.178 Y103.252 E.02166
G1 X216.74 Y103.433 E.02199
G1 X217.424 Y103.761 E.02825
G1 X217.93 Y104.088 E.02244
G1 X218.389 Y104.473 E.02233
G1 X218.776 Y104.887 E.02112
G1 X219.12 Y105.357 E.02166
G1 X219.427 Y105.917 E.02381
G1 X219.688 Y106.612 E.02764
G1 X219.833 Y107.242 E.02408
G1 X219.899 Y108.078 E.03124
G1 X219.899 Y147.937 E1.48461
G1 X219.86 Y148.573 E.02372
G1 X219.748 Y149.177 E.02289
G1 X219.554 Y149.773 E.02335
G1 X219.239 Y150.424 E.02691
G1 X218.931 Y150.904 E.02126
G1 X218.56 Y151.354 E.0217
G1 X218.113 Y151.776 E.02292
G1 X217.614 Y152.138 E.02295
G1 X217.1 Y152.419 E.02184
G1 X216.352 Y152.699 E.02973
G1 X215.72 Y152.839 E.0241
G1 X214.922 Y152.899 E.0298
G1 X45.063 Y152.899 E6.32662
G1 X44.394 Y152.856 E.02498
G1 X43.822 Y152.748 E.02166
G1 X43.26 Y152.567 E.02201
G1 X42.605 Y152.255 E.02702
G1 X42.07 Y151.912 E.02368
G1 X41.611 Y151.527 E.02231
G1 X41.224 Y151.113 E.02112
G1 X40.88 Y150.643 E.02166
G1 X40.573 Y150.083 E.0238
G1 X40.301 Y149.353 E.02901
G1 X40.161 Y148.72 E.02413
G1 X40.101 Y147.922 E.0298
G1 X40.101 Y108.063 E1.48463
G1 X40.14 Y107.427 E.02373
G1 X40.253 Y106.822 E.02292
G1 X40.447 Y106.222 E.02348
G1 X40.719 Y105.651 E.02355
G1 X41.062 Y105.106 E.02397
G1 X41.451 Y104.634 E.02277
G1 X41.9 Y104.214 E.02292
G1 X42.399 Y103.854 E.02291
G1 X42.762 Y103.658 E.01537
G1 X42.979 Y104.061 F30000
G1 F3000
G1 X43.111 Y103.99 E.00561
G1 X43.848 Y103.721 E.0292
G1 X44.349 Y103.615 E.01911
G1 X45.1 Y103.558 E.02804
G1 X54.925 Y103.558 E.36593
G1 X55.554 Y103.599 E.02348
G1 X56.085 Y103.702 E.02016
G1 X56.614 Y103.876 E.02075
G1 X57.135 Y104.125 E.02148
G1 X57.618 Y104.428 E.02126
G1 X58.071 Y104.803 E.02189
G1 X58.438 Y105.198 E.0201
G1 X58.755 Y105.638 E.02018
G1 X59.006 Y106.1 E.0196
G1 X59.262 Y106.788 E.02735
G1 X59.383 Y107.339 E.02101
G1 X59.442 Y108.101 E.02848
G1 X59.451 Y131.556 E.87357
G1 X59.535 Y132.027 E.01785
G1 X59.638 Y132.335 E.01208
G1 X59.786 Y132.614 E.01178
G1 X60.023 Y132.911 E.01414
G1 X60.277 Y133.131 E.0125
G1 X60.621 Y133.332 E.01487
G1 X61.229 Y133.522 E.0237
G1 X61.537 Y133.558 E.01155
G1 X198.463 Y133.558 E5.1
G1 X198.913 Y133.501 E.01687
G1 X199.258 Y133.394 E.01347
G1 X199.579 Y133.232 E.0134
G1 X199.904 Y132.982 E.01526
G1 X200.184 Y132.641 E.01643
G1 X200.378 Y132.281 E.01523
G1 X200.483 Y131.955 E.01278
G1 X200.55 Y131.547 E.0154
G1 X200.558 Y108.074 E.87427
G1 X200.595 Y107.478 E.02223
G1 X200.707 Y106.897 E.02204
G1 X200.875 Y106.39 E.01989
G1 X201.143 Y105.833 E.02301
G1 X201.426 Y105.384 E.01978
G1 X201.77 Y104.964 E.02021
G1 X202.163 Y104.591 E.02018
G1 X202.596 Y104.272 E.02005
G1 X203.118 Y103.986 E.02217
G1 X203.737 Y103.753 E.02464
G1 X204.284 Y103.625 E.02094
G1 X205.103 Y103.558 E.03059
G1 X214.926 Y103.558 E.36587
G1 X215.557 Y103.6 E.02354
G1 X216.073 Y103.699 E.01957
G1 X216.561 Y103.856 E.01911
G1 X217.207 Y104.166 E.02668
G1 X217.665 Y104.462 E.02031
G1 X218.08 Y104.811 E.02022
G1 X218.428 Y105.186 E.01905
G1 X218.728 Y105.595 E.0189
G1 X219.014 Y106.118 E.02219
G1 X219.247 Y106.735 E.02458
G1 X219.378 Y107.302 E.02165
G1 X219.442 Y108.102 E.02989
G1 X219.442 Y147.919 E1.48305
G1 X219.406 Y148.509 E.02199
G1 X219.301 Y149.073 E.02138
G1 X219.125 Y149.611 E.02108
G1 X218.835 Y150.207 E.02469
G1 X218.556 Y150.641 E.01923
G1 X218.231 Y151.034 E.01898
G1 X217.813 Y151.429 E.02141
G1 X217.362 Y151.755 E.02076
G1 X216.9 Y152.006 E.01957
G1 X216.213 Y152.262 E.02731
G1 X215.644 Y152.386 E.02169
G1 X214.9 Y152.442 E.02778
G1 X45.082 Y152.442 E6.32506
G1 X44.443 Y152.4 E.02386
G1 X43.927 Y152.301 E.01956
G1 X43.438 Y152.144 E.01916
G1 X42.835 Y151.858 E.02483
G1 X42.334 Y151.537 E.02217
G1 X41.92 Y151.189 E.02016
G1 X41.572 Y150.814 E.01905
G1 X41.272 Y150.405 E.0189
G1 X40.987 Y149.883 E.02216
G1 X40.739 Y149.214 E.02657
G1 X40.614 Y148.644 E.02174
G1 X40.558 Y147.9 E.02778
G1 X40.558 Y108.081 E1.48311
G1 X40.594 Y107.491 E.022
G1 X40.699 Y106.926 E.0214
G1 X40.877 Y106.384 E.02126
G1 X41.125 Y105.865 E.02141
G1 X41.429 Y105.382 E.02126
G1 X41.779 Y104.955 E.02058
G1 X42.184 Y104.573 E.02072
G1 X42.65 Y104.238 E.02137
G1 X42.926 Y104.089 E.01167
G1 X43.141 Y104.493 F30000
G1 F3000
G1 X43.308 Y104.404 E.00704
G1 X43.983 Y104.159 E.02676
G1 X44.424 Y104.067 E.01675
G1 X45.123 Y104.015 E.02611
G1 X54.905 Y104.015 E.36437
G1 X55.487 Y104.053 E.0217
G1 X55.962 Y104.144 E.01801
G1 X56.435 Y104.298 E.01856
G1 X56.907 Y104.522 E.01944
G1 X57.342 Y104.795 E.01913
G1 X57.763 Y105.143 E.02033
G1 X58.089 Y105.495 E.0179
G1 X58.371 Y105.889 E.01803
G1 X58.592 Y106.299 E.01735
G1 X58.825 Y106.927 E.02495
G1 X58.931 Y107.416 E.01862
G1 X58.985 Y108.124 E.02647
G1 X59.003 Y131.647 E.87613
G1 X59.083 Y132.098 E.01707
G1 X59.201 Y132.471 E.01456
G1 X59.378 Y132.82 E.01457
G1 X59.66 Y133.189 E.01727
G1 X59.971 Y133.47 E.01565
G1 X60.385 Y133.723 E.01806
G1 X60.492 Y133.771 E.00436
G1 X61.187 Y133.977 E.02701
G1 X61.544 Y134.015 E.01337
G1 X198.455 Y134.015 E5.09943
G1 X198.96 Y133.956 E.01891
G1 X199.385 Y133.834 E.01648
G1 X199.777 Y133.644 E.01621
G1 X200.172 Y133.353 E.0183
G1 X200.531 Y132.939 E.02039
G1 X200.775 Y132.506 E.01851
G1 X200.915 Y132.102 E.01593
G1 X200.999 Y131.631 E.01782
G1 X201.015 Y108.092 E.87672
G1 X201.049 Y107.544 E.02045
G1 X201.148 Y107.021 E.01983
G1 X201.303 Y106.554 E.01833
G1 X201.54 Y106.062 E.02032
G1 X201.793 Y105.659 E.01773
G1 X202.1 Y105.283 E.01809
G1 X202.45 Y104.948 E.01805
G1 X202.835 Y104.664 E.01782
G1 X203.318 Y104.399 E.02052
G1 X203.862 Y104.194 E.02162
G1 X204.366 Y104.077 E.01927
G1 X205.127 Y104.015 E.02847
G1 X214.906 Y104.015 E.36423
G1 X215.507 Y104.056 E.02241
G1 X215.951 Y104.141 E.01686
G1 X216.383 Y104.278 E.01687
G1 X216.99 Y104.57 E.0251
G1 X217.399 Y104.836 E.01815
G1 X217.77 Y105.149 E.0181
G1 X218.07 Y105.471 E.01639
G1 X218.336 Y105.834 E.01675
G1 X218.601 Y106.318 E.02056
G1 X218.805 Y106.86 E.02154
G1 X218.922 Y107.362 E.01923
G1 X218.985 Y108.126 E.02853
G1 X218.985 Y147.901 E1.48148
G1 X218.952 Y148.444 E.02026
G1 X218.859 Y148.95 E.01917
G1 X218.696 Y149.447 E.01948
G1 X218.431 Y149.99 E.02248
G1 X218.19 Y150.364 E.0166
G1 X217.903 Y150.715 E.01689
G1 X217.528 Y151.07 E.01922
G1 X217.11 Y151.372 E.01921
G1 X216.701 Y151.592 E.01731
G1 X216.074 Y151.824 E.02491
M73 P12 R49
G1 X215.568 Y151.933 E.01928
G1 X214.877 Y151.985 E.02579
G1 X45.102 Y151.985 E6.3235
G1 X44.493 Y151.944 E.02273
G1 X44.049 Y151.859 E.01684
G1 X43.615 Y151.721 E.01696
G1 X43.065 Y151.461 E.02264
M73 P12 R48
G1 X42.599 Y151.163 E.02063
G1 X42.23 Y150.851 E.018
G1 X41.93 Y150.529 E.01639
G1 X41.664 Y150.166 E.01675
G1 X41.4 Y149.683 E.0205
G1 X41.176 Y149.076 E.02411
G1 X41.067 Y148.568 E.01935
G1 X41.015 Y147.877 E.02579
G1 X41.015 Y108.099 E1.4816
G1 X41.048 Y107.556 E.02027
G1 X41.141 Y107.049 E.0192
G1 X41.306 Y106.546 E.01969
G1 X41.522 Y106.093 E.0187
G1 X41.796 Y105.657 E.01918
G1 X42.108 Y105.274 E.0184
G1 X42.483 Y104.921 E.01917
G1 X42.901 Y104.622 E.01914
G1 X43.088 Y104.522 E.00793
G1 X43.304 Y104.926 F30000
G1 F3000
G1 X43.504 Y104.82 E.00843
G1 X44.118 Y104.598 E.02434
G1 X44.497 Y104.52 E.01439
G1 X45.145 Y104.472 E.02421
G1 X54.886 Y104.472 E.36281
G1 X55.42 Y104.507 E.01995
G1 X55.839 Y104.585 E.01586
G1 X56.257 Y104.721 E.01638
G1 X56.679 Y104.92 E.01739
G1 X57.066 Y105.162 E.01698
G1 X57.454 Y105.482 E.01874
G1 X57.739 Y105.792 E.01568
G1 X57.987 Y106.139 E.01588
G1 X58.178 Y106.497 E.0151
G1 X58.387 Y107.065 E.02256
G1 X58.478 Y107.491 E.01624
G1 X58.528 Y108.147 E.02449
G1 X58.555 Y131.738 E.87867
G1 X58.65 Y132.243 E.01913
G1 X58.798 Y132.685 E.01736
G1 X59.021 Y133.105 E.01774
G1 X59.361 Y133.534 E.02037
G1 X59.742 Y133.866 E.01881
G1 X60.206 Y134.144 E.02016
G1 X60.368 Y134.211 E.0065
G1 X61.15 Y134.433 E.03029
G1 X61.551 Y134.472 E.01499
G1 X198.448 Y134.472 E5.0989
G1 X199.003 Y134.411 E.02079
G1 X199.502 Y134.275 E.01928
G1 X199.966 Y134.06 E.01906
G1 X200.433 Y133.728 E.02132
G1 X200.869 Y133.246 E.0242
G1 X201.168 Y132.74 E.02191
G1 X201.344 Y132.259 E.01905
G1 X201.447 Y131.722 E.02038
G1 X201.472 Y108.111 E.87942
G1 X201.503 Y107.61 E.0187
G1 X201.59 Y107.145 E.01761
G1 X201.732 Y106.718 E.01677
G1 X201.937 Y106.29 E.01766
G1 X202.161 Y105.933 E.0157
G1 X202.431 Y105.6 E.01597
G1 X202.739 Y105.304 E.01592
G1 X203.074 Y105.055 E.01556
G1 X203.519 Y104.812 E.01886
G1 X203.986 Y104.636 E.0186
G1 X204.446 Y104.529 E.0176
G1 X205.152 Y104.472 E.02635
G1 X214.886 Y104.472 E.36259
G1 X215.456 Y104.511 E.02128
G1 X215.83 Y104.583 E.01418
G1 X216.205 Y104.701 E.01463
G1 X216.774 Y104.974 E.02349
G1 X217.132 Y105.209 E.01596
G1 X217.46 Y105.487 E.01601
G1 X217.722 Y105.77 E.01437
G1 X217.944 Y106.073 E.014
G1 X218.188 Y106.519 E.01893
G1 X218.363 Y106.984 E.01854
G1 X218.467 Y107.424 E.01681
G1 X218.528 Y108.15 E.02715
G1 X218.528 Y147.891 E1.48022
G1 X218.498 Y148.38 E.01824
G1 X218.412 Y148.846 E.01763
G1 X218.267 Y149.283 E.01717
G1 X218.036 Y149.758 E.01966
G1 X217.815 Y150.101 E.0152
G1 X217.561 Y150.409 E.01485
G1 X217.242 Y150.711 E.01636
G1 X216.874 Y150.978 E.01696
G1 X216.503 Y151.178 E.01568
G1 X215.936 Y151.386 E.0225
G1 X215.493 Y151.481 E.01689
G1 X214.855 Y151.528 E.02382
G1 X45.122 Y151.528 E6.32193
G1 X44.543 Y151.489 E.02159
G1 X44.154 Y151.413 E.01477
G1 X43.791 Y151.297 E.01418
G1 X43.295 Y151.064 E.02042
G1 X42.864 Y150.788 E.01907
G1 X42.54 Y150.513 E.01582
G1 X42.278 Y150.23 E.01437
G1 X42.056 Y149.927 E.01399
G1 X41.814 Y149.484 E.01882
G1 X41.614 Y148.938 E.02163
G1 X41.519 Y148.493 E.01697
G1 X41.472 Y147.855 E.02382
G1 X41.472 Y108.109 E1.48041
G1 X41.502 Y107.62 E.01825
G1 X41.588 Y107.153 E.01767
G1 X41.735 Y106.709 E.01743
G1 X41.928 Y106.307 E.01659
G1 X42.173 Y105.917 E.01717
G1 X42.45 Y105.58 E.01623
G1 X42.767 Y105.281 E.01625
G1 X43.135 Y105.016 E.01688
G1 X43.251 Y104.954 E.00489
; WIPE_START
G1 F24000
G1 X43.504 Y104.82 E-.10879
G1 X44.118 Y104.598 E-.24828
G1 X44.497 Y104.52 E-.14681
G1 X45.145 Y104.472 E-.24699
G1 X45.169 Y104.472 E-.00913
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.105 J.51 P1  F30000
G1 X58.576 Y133.509 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X58.686 Y133.478 E.00426
G1 X58.773 Y133.528 E.00374
G1 X58.995 Y133.809 E.01334
G1 X59.472 Y134.232 E.02375
G1 X59.518 Y134.337 E.00426
G1 X59.468 Y134.44 E.00426
G1 X59.381 Y134.472 E.00347
G1 X58.665 Y134.472 E.02665
G1 X58.561 Y134.424 E.00426
G1 X58.528 Y134.335 E.00355
G1 X58.528 Y133.613 E.02688
G1 X58.551 Y133.564 E.00203
; WIPE_START
G1 F24000
G1 X58.686 Y133.478 E-.06084
G1 X58.773 Y133.528 E-.03819
G1 X58.995 Y133.809 E-.13608
G1 X59.472 Y134.232 E-.24233
G1 X59.518 Y134.337 E-.04347
G1 X59.468 Y134.44 E-.04347
G1 X59.381 Y134.472 E-.03544
G1 X58.959 Y134.472 E-.16017
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.001 J1.217 P1  F30000
G1 X200.469 Y134.314 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
G1 X200.521 Y134.226 E.00379
G1 X200.78 Y134.026 E.01219
G1 X201.233 Y133.519 E.02534
G1 X201.338 Y133.473 E.00426
G1 X201.441 Y133.523 E.00426
G1 X201.472 Y133.61 E.00346
G1 X201.472 Y134.335 E.027
G1 X201.424 Y134.439 E.00426
G1 X201.335 Y134.472 E.00355
G1 X200.605 Y134.472 E.0272
G1 X200.501 Y134.424 E.00426
G1 X200.486 Y134.372 E.00203
G1 X200.486 Y134.929 F30000
G1 F3000
G1 X201.792 Y134.929 E.04865
G1 X201.896 Y134.881 E.00426
G1 X201.929 Y134.792 E.00355
G1 X201.934 Y107.981 E.99861
G1 X202.029 Y107.31 E.02524
G1 X202.199 Y106.808 E.01974
G1 X202.42 Y106.389 E.01763
G1 X202.726 Y105.98 E.01902
G1 X203.186 Y105.558 E.02325
G1 X203.288 Y105.487 E.00463
G1 X203.918 Y105.154 E.02654
G1 X204.467 Y104.991 E.02135
G1 X204.9 Y104.939 E.01622
G1 X215.029 Y104.936 E.3773
G1 X215.803 Y105.059 E.02916
G1 X216.282 Y105.236 E.01903
G1 X216.711 Y105.488 E.01853
G1 X217.175 Y105.875 E.02251
G1 X217.46 Y106.205 E.01625
G1 X217.698 Y106.585 E.01671
G1 X217.9 Y107.048 E.01881
G1 X218.009 Y107.475 E.01643
G1 X218.071 Y108.051 E.02155
G1 X218.071 Y147.941 E1.48575
G1 X217.94 Y148.805 E.03254
G1 X217.764 Y149.282 E.01895
G1 X217.512 Y149.711 E.01854
G1 X217.125 Y150.175 E.02251
G1 X216.795 Y150.46 E.01625
G1 X216.415 Y150.698 E.01671
G1 X215.952 Y150.9 E.01881
G1 X215.525 Y151.009 E.01643
G1 X214.949 Y151.071 E.02155
G1 X45.059 Y151.071 E6.32775
G1 X44.195 Y150.94 E.03254
G1 X43.718 Y150.764 E.01895
G1 X43.289 Y150.512 E.01854
G1 X42.825 Y150.125 E.02251
G1 X42.54 Y149.795 E.01625
G1 X42.302 Y149.415 E.01671
G1 X42.1 Y148.952 E.01881
G1 X41.991 Y148.525 E.01643
G1 X41.929 Y147.949 E.02155
G1 X41.929 Y108.057 E1.48584
G1 X42.006 Y107.416 E.02405
G1 X42.162 Y106.895 E.02023
G1 X42.443 Y106.361 E.02249
G1 X42.756 Y105.95 E.01926
G1 X43.236 Y105.524 E.02391
G1 X43.724 Y105.234 E.02114
G1 X44.243 Y105.044 E.02057
G1 X44.898 Y104.94 E.02469
G1 X55.299 Y104.957 E.38742
G1 X55.677 Y105.024 E.01428
G1 X55.991 Y105.119 E.0122
G1 X56.627 Y105.432 E.02642
G1 X56.824 Y105.558 E.00872
G1 X57.151 Y105.841 E.01611
G1 X57.406 Y106.127 E.01426
G1 X57.617 Y106.443 E.01413
G1 X57.818 Y106.841 E.01663
G1 X57.989 Y107.378 E.02099
G1 X58.071 Y108.052 E.02528
G1 X58.071 Y134.792 E.99597
G1 X58.119 Y134.896 E.00426
G1 X58.208 Y134.929 E.00355
G1 X200.426 Y134.929 E5.29707
G1 X200.426 Y135.386 F30000
G1 F3000
G1 X202.249 Y135.386 E.06791
G1 X202.353 Y135.338 E.00426
G1 X202.386 Y135.249 E.00355
G1 X202.392 Y107.971 E1.01599
G1 X202.462 Y107.458 E.01929
G1 X202.597 Y107.031 E.01669
G1 X202.829 Y106.594 E.01844
G1 X203.094 Y106.251 E.01614
G1 X203.494 Y105.895 E.01995
G1 X204.144 Y105.551 E.02736
G1 X204.517 Y105.445 E.01445
G1 X204.892 Y105.396 E.01408
G1 X215.04 Y105.393 E.378
G1 X215.641 Y105.487 E.02266
G1 X216.048 Y105.629 E.01605
G1 X216.415 Y105.837 E.01571
G1 X216.828 Y106.172 E.01979
G1 X217.072 Y106.446 E.01367
G1 X217.279 Y106.766 E.01421
G1 X217.457 Y107.159 E.01606
G1 X217.554 Y107.518 E.01385
G1 X217.614 Y108.043 E.0197
G1 X217.614 Y147.951 E1.4864
G1 X217.513 Y148.643 E.02605
G1 X217.371 Y149.048 E.01599
G1 X217.163 Y149.415 E.01571
G1 X216.828 Y149.828 E.01979
G1 X216.554 Y150.072 E.01367
G1 X216.234 Y150.279 E.01421
G1 X215.841 Y150.457 E.01606
G1 X215.482 Y150.554 E.01385
G1 X214.957 Y150.614 E.0197
G1 X45.049 Y150.614 E6.32841
G1 X44.357 Y150.513 E.02605
G1 X43.952 Y150.371 E.01599
G1 X43.585 Y150.163 E.01571
G1 X43.172 Y149.828 E.01979
G1 X42.928 Y149.554 E.01367
G1 X42.721 Y149.234 E.01421
G1 X42.543 Y148.841 E.01606
G1 X42.446 Y148.482 E.01385
G1 X42.386 Y147.957 E.01969
G1 X42.386 Y108.049 E1.48641
G1 X42.445 Y107.544 E.01893
G1 X42.56 Y107.12 E.01638
G1 X42.853 Y106.563 E.02341
G1 X43.121 Y106.225 E.01608
G1 X43.542 Y105.863 E.02067
G1 X43.959 Y105.626 E.01789
G1 X44.402 Y105.473 E.01746
G1 X44.972 Y105.391 E.02142
G1 X55.216 Y105.407 E.38155
G1 X55.537 Y105.459 E.01212
G1 X55.869 Y105.56 E.01293
G1 X56.425 Y105.842 E.02322
G1 X56.58 Y105.944 E.00693
M73 P13 R48
G1 X56.852 Y106.187 E.01356
G1 X57.066 Y106.433 E.01216
G1 X57.237 Y106.697 E.01169
G1 X57.413 Y107.053 E.01479
G1 X57.555 Y107.521 E.01823
G1 X57.614 Y108.043 E.01958
G1 X57.614 Y135.249 E1.0133
G1 X57.662 Y135.353 E.00426
G1 X57.751 Y135.386 E.00355
G1 X200.366 Y135.386 E5.31186
G1 X200.366 Y135.843 F30000
G1 F3000
G1 X202.706 Y135.843 E.08716
G1 X202.81 Y135.795 E.00426
G1 X202.843 Y135.706 E.00355
G1 X202.849 Y107.962 E1.03336
G1 X202.915 Y107.515 E.01682
G1 X203.001 Y107.245 E.01057
G1 X203.184 Y106.882 E.01512
G1 X203.464 Y106.52 E.01706
G1 X203.794 Y106.24 E.01613
G1 X204.267 Y105.991 E.0199
G1 X204.566 Y105.9 E.01165
G1 X204.96 Y105.848 E.01479
G1 X215.051 Y105.85 E.37585
G1 X215.491 Y105.918 E.01657
G1 X215.823 Y106.027 E.01303
G1 X216.124 Y106.189 E.01273
G1 X216.486 Y106.475 E.01721
G1 X216.687 Y106.693 E.01103
G1 X216.862 Y106.954 E.01172
G1 X217.016 Y107.28 E.01341
G1 X217.1 Y107.564 E.01102
G1 X217.157 Y108.036 E.01771
G1 X217.157 Y147.961 E1.48706
G1 X217.082 Y148.491 E.01996
G1 X216.973 Y148.823 E.013
G1 X216.811 Y149.124 E.01273
G1 X216.525 Y149.486 E.01721
G1 X216.307 Y149.687 E.01103
G1 X216.046 Y149.862 E.01171
G1 X215.72 Y150.016 E.01341
G1 X215.436 Y150.1 E.01102
G1 X214.964 Y150.157 E.01771
G1 X45.039 Y150.157 E6.32907
G1 X44.509 Y150.082 E.01996
G1 X44.177 Y149.973 E.013
G1 X43.876 Y149.811 E.01273
G1 X43.514 Y149.525 E.01721
G1 X43.313 Y149.307 E.01103
G1 X43.138 Y149.046 E.01171
G1 X42.984 Y148.72 E.01341
G1 X42.9 Y148.436 E.01102
G1 X42.843 Y147.964 E.0177
G1 X42.843 Y108.041 E1.487
G1 X42.899 Y107.592 E.01686
G1 X43.003 Y107.234 E.01385
G1 X43.257 Y106.776 E.01951
G1 X43.479 Y106.509 E.01295
G1 X43.842 Y106.208 E.01754
G1 X44.185 Y106.023 E.01453
G1 X44.553 Y105.904 E.0144
G1 X45.036 Y105.843 E.01816
G1 X55.137 Y105.857 E.3762
G1 X55.417 Y105.9 E.01058
G1 X55.651 Y105.961 E.00901
G1 X56.224 Y106.253 E.02396
G1 X56.324 Y106.322 E.00451
G1 X56.548 Y106.528 E.01133
G1 X56.722 Y106.734 E.01006
G1 X56.824 Y106.892 E.00699
G1 X57.008 Y107.265 E.01551
G1 X57.1 Y107.565 E.01166
G1 X57.157 Y108.036 E.01767
G1 X57.157 Y135.706 E1.03061
G1 X57.205 Y135.81 E.00426
G1 X57.294 Y135.843 E.00355
G1 X200.306 Y135.843 E5.32665
G1 X200.306 Y136.3 F30000
G1 F3000
G1 X203.163 Y136.3 E.10642
G1 X203.267 Y136.253 E.00426
G1 X203.3 Y136.163 E.00355
G1 X203.3 Y108.032 E1.04777
G1 X203.353 Y107.644 E.01459
G1 X203.405 Y107.46 E.00712
G1 X203.598 Y107.076 E.01602
G1 X203.823 Y106.801 E.01322
G1 X204.088 Y106.59 E.01263
G1 X204.478 Y106.396 E.01622
G1 X204.691 Y106.339 E.00822
G1 X204.951 Y106.305 E.00977
G1 X214.971 Y106.3 E.37318
G1 X215.432 Y106.372 E.01738
G1 X215.615 Y106.433 E.00719
G1 X215.831 Y106.54 E.00898
G1 X216.211 Y106.84 E.01805
G1 X216.302 Y106.938 E.00496
G1 X216.488 Y107.217 E.01249
G1 X216.602 Y107.473 E.01042
G1 X216.661 Y107.69 E.0084
G1 X216.7 Y108.027 E.01264
G1 X216.7 Y147.971 E1.48773
G1 X216.628 Y148.432 E.01738
G1 X216.567 Y148.615 E.00719
G1 X216.46 Y148.831 E.00898
G1 X216.16 Y149.211 E.01805
G1 X216.062 Y149.302 E.00496
G1 X215.783 Y149.488 E.01249
G1 X215.527 Y149.602 E.01042
G1 X215.31 Y149.661 E.0084
G1 X214.973 Y149.7 E.01264
G1 X45.029 Y149.7 E6.32974
G1 X44.568 Y149.628 E.01738
G1 X44.385 Y149.567 E.00719
G1 X44.169 Y149.46 E.00898
G1 X43.789 Y149.16 E.01805
G1 X43.698 Y149.062 E.00496
G1 X43.512 Y148.783 E.01249
G1 X43.398 Y148.527 E.01042
G1 X43.339 Y148.31 E.0084
G1 X43.3 Y147.973 E.01264
G1 X43.3 Y108.032 E1.48763
G1 X43.353 Y107.644 E.01458
G1 X43.443 Y107.358 E.01116
G1 X43.6 Y107.078 E.01199
G1 X43.839 Y106.791 E.01391
G1 X44.131 Y106.562 E.01381
G1 X44.398 Y106.427 E.01117
G1 X44.692 Y106.339 E.01142
G1 X45.027 Y106.3 E.01256
G1 X55.057 Y106.307 E.37356
G1 X55.355 Y106.353 E.01123
G1 X55.54 Y106.405 E.00717
G1 X56.014 Y106.659 E.02004
G1 X56.199 Y106.823 E.0092
G1 X56.342 Y106.988 E.00812
G1 X56.41 Y107.088 E.00452
G1 X56.604 Y107.478 E.01622
G1 X56.661 Y107.69 E.00818
G1 X56.7 Y108.027 E.01264
G1 X56.7 Y136.163 E1.04795
G1 X56.747 Y136.267 E.00426
G1 X56.837 Y136.3 E.00355
G1 X200.246 Y136.3 E5.34144
G1 X200.246 Y136.757 F30000
G1 F3000
G1 X203.62 Y136.757 E.12568
G1 X203.724 Y136.71 E.00426
G1 X203.757 Y136.62 E.00355
G1 X203.757 Y108.023 E1.06514
G1 X203.806 Y107.706 E.01192
G1 X203.843 Y107.588 E.00461
G1 X204.004 Y107.285 E.01281
G1 X204.117 Y107.152 E.00649
G1 X204.294 Y106.997 E.00875
G1 X204.603 Y106.836 E.01299
G1 X204.742 Y106.794 E.0054
G1 X205.019 Y106.757 E.01044
G1 X214.981 Y106.757 E.37104
G1 X215.275 Y106.801 E.01106
G1 X215.478 Y106.869 E.00797
G1 X215.626 Y106.948 E.00626
G1 X215.924 Y107.196 E.01445
G1 X216.071 Y107.403 E.00943
G1 X216.163 Y107.6 E.0081
G1 X216.206 Y107.742 E.00551
G1 X216.243 Y108.019 E.01044
G1 X216.243 Y147.981 E1.48842
G1 X216.199 Y148.275 E.01106
G1 X216.131 Y148.478 E.00797
G1 X216.052 Y148.626 E.00626
G1 X215.804 Y148.924 E.01445
G1 X215.597 Y149.071 E.00943
G1 X215.4 Y149.163 E.0081
G1 X215.258 Y149.206 E.00551
G1 X214.981 Y149.243 E.01044
G1 X45.019 Y149.243 E6.33043
G1 X44.725 Y149.199 E.01106
G1 X44.522 Y149.131 E.00797
G1 X44.374 Y149.052 E.00626
G1 X44.076 Y148.804 E.01445
G1 X43.929 Y148.597 E.00943
G1 X43.837 Y148.4 E.00811
G1 X43.794 Y148.258 E.00551
G1 X43.757 Y147.981 E.01044
G1 X43.757 Y108.023 E1.48827
G1 X43.806 Y107.705 E.01198
G1 X43.878 Y107.497 E.00819
G1 X43.944 Y107.379 E.00504
G1 X44.196 Y107.075 E.0147
G1 X44.403 Y106.929 E.00943
G1 X44.6 Y106.837 E.00811
G1 X44.742 Y106.794 E.00551
G1 X45.019 Y106.757 E.01044
G1 X54.977 Y106.757 E.37088
G1 X55.294 Y106.806 E.01192
M73 P13 R47
G1 X55.412 Y106.843 E.00461
G1 X55.715 Y107.004 E.01281
G1 X55.848 Y107.117 E.00649
G1 X56.003 Y107.294 E.00875
G1 X56.164 Y107.603 E.01299
G1 X56.206 Y107.742 E.0054
G1 X56.243 Y108.019 E.01044
G1 X56.243 Y136.62 E1.06527
G1 X56.29 Y136.724 E.00426
G1 X56.38 Y136.757 E.00355
G1 X200.186 Y136.757 E5.35623
G1 X200.186 Y137.214 F30000
G1 F3000
G1 X204.077 Y137.214 E.14494
G1 X204.181 Y137.167 E.00426
G1 X204.214 Y137.077 E.00355
G1 X204.214 Y108.012 E1.08255
G1 X204.257 Y107.782 E.00871
G1 X204.344 Y107.591 E.00783
G1 X204.473 Y107.439 E.00743
G1 X204.586 Y107.348 E.00541
G1 X204.803 Y107.246 E.00892
G1 X205.011 Y107.214 E.00781
G1 X214.991 Y107.214 E.37175
G1 X215.118 Y107.23 E.00475
G1 X215.343 Y107.306 E.00884
G1 X215.561 Y107.473 E.01023
G1 X215.652 Y107.586 E.00541
G1 X215.754 Y107.803 E.00892
G1 X215.786 Y108.011 E.00782
G1 X215.786 Y147.991 E1.48913
G1 X215.77 Y148.118 E.00475
G1 X215.694 Y148.343 E.00884
M73 P14 R47
G1 X215.527 Y148.561 E.01023
G1 X215.414 Y148.652 E.00541
G1 X215.197 Y148.754 E.00892
G1 X214.989 Y148.786 E.00782
G1 X45.009 Y148.786 E6.33114
G1 X44.882 Y148.77 E.00475
G1 X44.657 Y148.694 E.00884
G1 X44.439 Y148.527 E.01023
G1 X44.348 Y148.414 E.00541
G1 X44.246 Y148.197 E.00892
G1 X44.214 Y147.989 E.00781
G1 X44.214 Y108.012 E1.48899
G1 X44.257 Y107.779 E.00884
G1 X44.304 Y107.66 E.00475
G1 X44.473 Y107.439 E.01037
G1 X44.586 Y107.348 E.00541
G1 X44.803 Y107.246 E.00892
G1 X45.011 Y107.214 E.00781
G1 X54.988 Y107.214 E.37161
G1 X55.218 Y107.257 E.00871
G1 X55.409 Y107.344 E.00783
G1 X55.561 Y107.473 E.00743
G1 X55.652 Y107.586 E.00541
G1 X55.754 Y107.803 E.00892
G1 X55.786 Y108.011 E.00782
G1 X55.786 Y137.077 E1.08263
G1 X55.833 Y137.181 E.00426
G1 X55.923 Y137.214 E.00355
G1 X200.126 Y137.214 E5.37102
G1 X200.126 Y137.671 F30000
G1 F3000
G1 X204.671 Y137.671 E.16931
G1 X204.671 Y108 E1.10515
G1 X204.7 Y107.889 E.00426
G1 X204.747 Y107.805 E.00361
G1 X204.884 Y107.696 E.00652
G1 X205 Y107.671 E.00442
G1 X215 Y107.671 E.37246
G1 X215.111 Y107.7 E.00426
G1 X215.195 Y107.747 E.00361
G1 X215.304 Y107.884 E.00652
G1 X215.329 Y108 E.00442
G1 X215.329 Y148 E1.48985
G1 X215.3 Y148.111 E.00426
G1 X215.253 Y148.195 E.00361
G1 X215.116 Y148.304 E.00652
G1 X215 Y148.329 E.00442
G1 X45 Y148.329 E6.33185
G1 X44.889 Y148.3 E.00426
G1 X44.805 Y148.253 E.00361
G1 X44.696 Y148.116 E.00652
G1 X44.671 Y148 E.00442
G1 X44.671 Y108 E1.48985
G1 X44.7 Y107.889 E.00426
G1 X44.747 Y107.805 E.00361
G1 X44.884 Y107.696 E.00652
G1 X45 Y107.671 E.00442
G1 X55 Y107.671 E.37246
G1 X55.111 Y107.7 E.00426
G1 X55.195 Y107.747 E.00361
G1 X55.304 Y107.884 E.00652
G1 X55.329 Y108 E.00442
G1 X55.329 Y137.671 E1.10515
G1 X200.066 Y137.671 E5.39092
; WIPE_START
G1 F24000
G1 X202.066 Y137.671 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.006 J-1.217 P1  F30000
G1 X54.143 Y138.4 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X54.143 Y138.857 E.01702
G1 X205.857 Y138.857 E5.65078
G1 X205.857 Y108.857 E1.11739
G1 X214.143 Y108.857 E.30862
G1 X214.143 Y147.143 E1.426
G1 X45.857 Y147.143 E6.26801
G1 X45.857 Y108.857 E1.426
G1 X54.143 Y108.857 E.30862
G1 X54.143 Y138.34 E1.09813
G1 X54.6 Y138.4 F30000
; FEATURE: Outer wall
G1 F3000
G1 X205.4 Y138.4 E5.61673
G1 X205.4 Y108.4 E1.11739
G1 X214.6 Y108.4 E.34267
G1 X214.6 Y147.6 E1.46005
G1 X45.4 Y147.6 E6.30206
G1 X45.4 Y108.4 E1.46005
G1 X54.6 Y108.4 E.34267
G1 X54.6 Y138.34 E1.11515
; WIPE_START
G1 F24000
G1 X56.6 Y138.341 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.224 J1.196 P1  F30000
G1 X213.034 Y109.04 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.500831
G1 F6300
G1 X213.754 Y109.76 E.038
G1 X213.754 Y110.408 E.02416
G1 X212.592 Y109.246 E.06132
G1 X211.945 Y109.246 E.02416
G1 X213.754 Y111.055 E.09549
G1 X213.754 Y111.703 E.02416
G1 X211.297 Y109.246 E.12966
G1 X210.65 Y109.246 E.02416
G1 X213.754 Y112.35 E.16383
G1 X213.754 Y112.998 E.02416
G1 X210.002 Y109.246 E.19801
G1 X209.355 Y109.246 E.02416
G1 X213.754 Y113.645 E.23218
G1 X213.754 Y114.293 E.02416
G1 X208.707 Y109.246 E.26635
G1 X208.059 Y109.246 E.02416
G1 X213.754 Y114.941 E.30053
G1 X213.754 Y115.588 E.02416
G1 X207.412 Y109.246 E.3347
G1 X206.764 Y109.246 E.02416
G1 X213.754 Y116.236 E.36887
G1 X213.754 Y116.883 E.02416
G1 X206.246 Y109.375 E.39624
G1 X206.246 Y110.022 E.02416
G1 X213.754 Y117.531 E.39624
G1 X213.754 Y118.179 E.02416
G1 X206.246 Y110.67 E.39624
G1 X206.246 Y111.317 E.02416
M73 P15 R47
G1 X213.754 Y118.826 E.39624
G1 X213.754 Y119.474 E.02416
G1 X206.246 Y111.965 E.39624
G1 X206.246 Y112.612 E.02416
G1 X213.754 Y120.121 E.39624
G1 X213.754 Y120.769 E.02416
G1 X206.246 Y113.26 E.39624
G1 X206.246 Y113.908 E.02416
G1 X213.754 Y121.416 E.39624
G1 X213.754 Y122.064 E.02416
G1 X206.246 Y114.555 E.39624
G1 X206.246 Y115.203 E.02416
G1 X213.754 Y122.712 E.39624
G1 X213.754 Y123.359 E.02416
G1 X206.246 Y115.85 E.39624
G1 X206.246 Y116.498 E.02416
G1 X213.754 Y124.007 E.39624
G1 X213.754 Y124.654 E.02416
G1 X206.246 Y117.146 E.39624
G1 X206.246 Y117.793 E.02416
G1 X213.754 Y125.302 E.39624
G1 X213.754 Y125.95 E.02416
G1 X206.246 Y118.441 E.39624
G1 X206.246 Y119.088 E.02416
G1 X213.754 Y126.597 E.39624
G1 X213.754 Y127.245 E.02416
G1 X206.246 Y119.736 E.39624
G1 X206.246 Y120.383 E.02416
G1 X213.754 Y127.892 E.39624
G1 X213.754 Y128.54 E.02416
G1 X206.246 Y121.031 E.39624
G1 X206.246 Y121.679 E.02416
G1 X213.754 Y129.187 E.39624
G1 X213.754 Y129.835 E.02416
G1 X206.246 Y122.326 E.39624
G1 X206.246 Y122.974 E.02416
G1 X213.754 Y130.483 E.39624
G1 X213.754 Y131.13 E.02416
G1 X206.246 Y123.621 E.39624
G1 X206.246 Y124.269 E.02416
G1 X213.754 Y131.778 E.39624
G1 X213.754 Y132.425 E.02416
G1 X206.246 Y124.917 E.39624
G1 X206.246 Y125.564 E.02416
G1 X213.754 Y133.073 E.39624
G1 X213.754 Y133.721 E.02416
G1 X206.246 Y126.212 E.39624
G1 X206.246 Y126.859 E.02416
G1 X213.754 Y134.368 E.39624
G1 X213.754 Y135.016 E.02416
G1 X206.246 Y127.507 E.39624
G1 X206.246 Y128.154 E.02416
G1 X213.754 Y135.663 E.39624
G1 X213.754 Y136.311 E.02416
G1 X206.246 Y128.802 E.39624
G1 X206.246 Y129.45 E.02416
G1 X213.754 Y136.958 E.39624
G1 X213.754 Y137.606 E.02416
G1 X206.246 Y130.097 E.39624
M73 P15 R46
G1 X206.246 Y130.745 E.02416
G1 X213.754 Y138.254 E.39624
G1 X213.754 Y138.901 E.02416
G1 X206.246 Y131.392 E.39624
G1 X206.246 Y132.04 E.02416
G1 X213.754 Y139.549 E.39624
G1 X213.754 Y140.196 E.02416
G1 X206.246 Y132.688 E.39624
G1 X206.246 Y133.335 E.02416
G1 X213.754 Y140.844 E.39624
G1 X213.754 Y141.492 E.02416
G1 X206.246 Y133.983 E.39624
G1 X206.246 Y134.63 E.02416
G1 X213.754 Y142.139 E.39624
G1 X213.754 Y142.787 E.02416
G1 X206.246 Y135.278 E.39624
G1 X206.246 Y135.925 E.02416
G1 X213.754 Y143.434 E.39624
G1 X213.754 Y144.082 E.02416
G1 X206.246 Y136.573 E.39624
G1 X206.246 Y137.221 E.02416
G1 X213.754 Y144.729 E.39624
G1 X213.754 Y145.377 E.02416
G1 X206.246 Y137.868 E.39624
G1 X206.246 Y138.516 E.02416
G1 X213.754 Y146.025 E.39624
G1 X213.754 Y146.672 E.02416
G1 X206.246 Y139.163 E.39624
G1 X206.246 Y139.246 E.00307
G1 X205.68 Y139.246 E.0211
G1 X213.189 Y146.754 E.39624
G1 X212.541 Y146.754 E.02416
G1 X205.033 Y139.246 E.39624
G1 X204.385 Y139.246 E.02416
G1 X211.894 Y146.754 E.39624
G1 X211.246 Y146.754 E.02416
G1 X203.737 Y139.246 E.39624
G1 X203.09 Y139.246 E.02416
G1 X210.599 Y146.754 E.39624
G1 X209.951 Y146.754 E.02416
G1 X202.442 Y139.246 E.39624
G1 X201.795 Y139.246 E.02416
G1 X209.304 Y146.754 E.39624
G1 X208.656 Y146.754 E.02416
G1 X201.147 Y139.246 E.39624
G1 X200.5 Y139.246 E.02416
G1 X208.008 Y146.754 E.39624
G1 X207.361 Y146.754 E.02416
G1 X199.852 Y139.246 E.39624
G1 X199.204 Y139.246 E.02416
G1 X206.713 Y146.754 E.39624
G1 X206.066 Y146.754 E.02416
G1 X198.557 Y139.246 E.39624
G1 X197.909 Y139.246 E.02416
G1 X205.418 Y146.754 E.39624
G1 X204.77 Y146.754 E.02416
G1 X197.262 Y139.246 E.39624
G1 X196.614 Y139.246 E.02416
G1 X204.123 Y146.754 E.39624
G1 X203.475 Y146.754 E.02416
G1 X195.966 Y139.246 E.39624
G1 X195.319 Y139.246 E.02416
G1 X202.828 Y146.754 E.39624
G1 X202.18 Y146.754 E.02416
G1 X194.671 Y139.246 E.39624
G1 X194.024 Y139.246 E.02416
G1 X201.532 Y146.754 E.39624
G1 X200.885 Y146.754 E.02416
G1 X193.376 Y139.246 E.39624
G1 X192.729 Y139.246 E.02416
G1 X200.237 Y146.754 E.39624
G1 X199.59 Y146.754 E.02416
G1 X192.081 Y139.246 E.39624
G1 X191.433 Y139.246 E.02416
G1 X198.942 Y146.754 E.39624
G1 X198.295 Y146.754 E.02416
M73 P16 R46
G1 X190.786 Y139.246 E.39624
G1 X190.138 Y139.246 E.02416
G1 X197.647 Y146.754 E.39624
G1 X196.999 Y146.754 E.02416
G1 X189.491 Y139.246 E.39624
G1 X188.843 Y139.246 E.02416
G1 X196.352 Y146.754 E.39624
G1 X195.704 Y146.754 E.02416
G1 X188.195 Y139.246 E.39624
G1 X187.548 Y139.246 E.02416
G1 X195.057 Y146.754 E.39624
G1 X194.409 Y146.754 E.02416
G1 X186.9 Y139.246 E.39624
G1 X186.253 Y139.246 E.02416
G1 X193.761 Y146.754 E.39624
G1 X193.114 Y146.754 E.02416
G1 X185.605 Y139.246 E.39624
G1 X184.957 Y139.246 E.02416
G1 X192.466 Y146.754 E.39624
G1 X191.819 Y146.754 E.02416
G1 X184.31 Y139.246 E.39624
G1 X183.662 Y139.246 E.02416
G1 X191.171 Y146.754 E.39624
G1 X190.524 Y146.754 E.02416
G1 X183.015 Y139.246 E.39624
G1 X182.367 Y139.246 E.02416
G1 X189.876 Y146.754 E.39624
G1 X189.228 Y146.754 E.02416
G1 X181.72 Y139.246 E.39624
G1 X181.072 Y139.246 E.02416
G1 X188.581 Y146.754 E.39624
G1 X187.933 Y146.754 E.02416
G1 X180.424 Y139.246 E.39624
G1 X179.777 Y139.246 E.02416
G1 X187.286 Y146.754 E.39624
G1 X186.638 Y146.754 E.02416
G1 X179.129 Y139.246 E.39624
G1 X178.482 Y139.246 E.02416
G1 X185.99 Y146.754 E.39624
G1 X185.343 Y146.754 E.02416
G1 X177.834 Y139.246 E.39624
G1 X177.186 Y139.246 E.02416
G1 X184.695 Y146.754 E.39624
G1 X184.048 Y146.754 E.02416
G1 X176.539 Y139.246 E.39624
G1 X175.891 Y139.246 E.02416
G1 X183.4 Y146.754 E.39624
G1 X182.753 Y146.754 E.02416
G1 X175.244 Y139.246 E.39624
G1 X174.596 Y139.246 E.02416
G1 X182.105 Y146.754 E.39624
G1 X181.457 Y146.754 E.02416
G1 X173.949 Y139.246 E.39624
G1 X173.301 Y139.246 E.02416
G1 X180.81 Y146.754 E.39624
G1 X180.162 Y146.754 E.02416
G1 X172.653 Y139.246 E.39624
G1 X172.006 Y139.246 E.02416
G1 X179.515 Y146.754 E.39624
G1 X178.867 Y146.754 E.02416
G1 X171.358 Y139.246 E.39624
G1 X170.711 Y139.246 E.02416
G1 X178.219 Y146.754 E.39624
G1 X177.572 Y146.754 E.02416
G1 X170.063 Y139.246 E.39624
G1 X169.415 Y139.246 E.02416
G1 X176.924 Y146.754 E.39624
G1 X176.277 Y146.754 E.02416
G1 X168.768 Y139.246 E.39624
G1 X168.12 Y139.246 E.02416
G1 X175.629 Y146.754 E.39624
G1 X174.982 Y146.754 E.02416
G1 X167.473 Y139.246 E.39624
G1 X166.825 Y139.246 E.02416
G1 X174.334 Y146.754 E.39624
G1 X173.686 Y146.754 E.02416
G1 X166.178 Y139.246 E.39624
G1 X165.53 Y139.246 E.02416
G1 X173.039 Y146.754 E.39624
G1 X172.391 Y146.754 E.02416
G1 X164.882 Y139.246 E.39624
G1 X164.235 Y139.246 E.02416
G1 X171.744 Y146.754 E.39624
G1 X171.096 Y146.754 E.02416
G1 X163.587 Y139.246 E.39624
G1 X162.94 Y139.246 E.02416
G1 X170.448 Y146.754 E.39624
G1 X169.801 Y146.754 E.02416
G1 X162.292 Y139.246 E.39624
G1 X161.644 Y139.246 E.02416
G1 X169.153 Y146.754 E.39624
G1 X168.506 Y146.754 E.02416
G1 X160.997 Y139.246 E.39624
G1 X160.349 Y139.246 E.02416
G1 X167.858 Y146.754 E.39624
G1 X167.211 Y146.754 E.02416
G1 X159.702 Y139.246 E.39624
G1 X159.054 Y139.246 E.02416
G1 X166.563 Y146.754 E.39624
G1 X165.915 Y146.754 E.02416
G1 X158.407 Y139.246 E.39624
G1 X157.759 Y139.246 E.02416
G1 X165.268 Y146.754 E.39624
G1 X164.62 Y146.754 E.02416
G1 X157.111 Y139.246 E.39624
G1 X156.464 Y139.246 E.02416
G1 X163.973 Y146.754 E.39624
G1 X163.325 Y146.754 E.02416
G1 X155.816 Y139.246 E.39624
G1 X155.169 Y139.246 E.02416
G1 X162.677 Y146.754 E.39624
G1 X162.03 Y146.754 E.02416
G1 X154.521 Y139.246 E.39624
G1 X153.873 Y139.246 E.02416
G1 X161.382 Y146.754 E.39624
G1 X160.735 Y146.754 E.02416
G1 X153.226 Y139.246 E.39624
G1 X152.578 Y139.246 E.02416
G1 X160.087 Y146.754 E.39624
G1 X159.44 Y146.754 E.02416
G1 X151.931 Y139.246 E.39624
G1 X151.283 Y139.246 E.02416
G1 X158.792 Y146.754 E.39624
G1 X158.144 Y146.754 E.02416
G1 X150.636 Y139.246 E.39624
G1 X149.988 Y139.246 E.02416
G1 X157.497 Y146.754 E.39624
G1 X156.849 Y146.754 E.02416
G1 X149.34 Y139.246 E.39624
G1 X148.693 Y139.246 E.02416
G1 X156.202 Y146.754 E.39624
G1 X155.554 Y146.754 E.02416
G1 X148.045 Y139.246 E.39624
G1 X147.398 Y139.246 E.02416
G1 X154.906 Y146.754 E.39624
G1 X154.259 Y146.754 E.02416
G1 X146.75 Y139.246 E.39624
G1 X146.102 Y139.246 E.02416
G1 X153.611 Y146.754 E.39624
G1 X152.964 Y146.754 E.02416
G1 X145.455 Y139.246 E.39624
G1 X144.807 Y139.246 E.02416
G1 X152.316 Y146.754 E.39624
G1 X151.669 Y146.754 E.02416
G1 X144.16 Y139.246 E.39624
G1 X143.512 Y139.246 E.02416
G1 X151.021 Y146.754 E.39624
G1 X150.373 Y146.754 E.02416
G1 X142.865 Y139.246 E.39624
G1 X142.217 Y139.246 E.02416
G1 X149.726 Y146.754 E.39624
G1 X149.078 Y146.754 E.02416
G1 X141.569 Y139.246 E.39624
G1 X140.922 Y139.246 E.02416
G1 X148.431 Y146.754 E.39624
G1 X147.783 Y146.754 E.02416
G1 X140.274 Y139.246 E.39624
G1 X139.627 Y139.246 E.02416
G1 X147.135 Y146.754 E.39624
G1 X146.488 Y146.754 E.02416
G1 X138.979 Y139.246 E.39624
G1 X138.331 Y139.246 E.02416
G1 X145.84 Y146.754 E.39624
G1 X145.193 Y146.754 E.02416
G1 X137.684 Y139.246 E.39624
G1 X137.036 Y139.246 E.02416
G1 X144.545 Y146.754 E.39624
G1 X143.898 Y146.754 E.02416
G1 X136.389 Y139.246 E.39624
G1 X135.741 Y139.246 E.02416
G1 X143.25 Y146.754 E.39624
G1 X142.602 Y146.754 E.02416
G1 X135.094 Y139.246 E.39624
G1 X134.446 Y139.246 E.02416
G1 X141.955 Y146.754 E.39624
G1 X141.307 Y146.754 E.02416
G1 X133.798 Y139.246 E.39624
G1 X133.151 Y139.246 E.02416
G1 X140.66 Y146.754 E.39624
G1 X140.012 Y146.754 E.02416
G1 X132.503 Y139.246 E.39624
G1 X131.856 Y139.246 E.02416
G1 X139.364 Y146.754 E.39624
G1 X138.717 Y146.754 E.02416
G1 X131.208 Y139.246 E.39624
G1 X130.56 Y139.246 E.02416
G1 X138.069 Y146.754 E.39624
G1 X137.422 Y146.754 E.02416
G1 X129.913 Y139.246 E.39624
G1 X129.265 Y139.246 E.02416
G1 X136.774 Y146.754 E.39624
G1 X136.127 Y146.754 E.02416
G1 X128.618 Y139.246 E.39624
G1 X127.97 Y139.246 E.02416
G1 X135.479 Y146.754 E.39624
G1 X134.831 Y146.754 E.02416
G1 X127.323 Y139.246 E.39624
G1 X126.675 Y139.246 E.02416
G1 X134.184 Y146.754 E.39624
G1 X133.536 Y146.754 E.02416
G1 X126.027 Y139.246 E.39624
G1 X125.38 Y139.246 E.02416
G1 X132.889 Y146.754 E.39624
G1 X132.241 Y146.754 E.02416
G1 X124.732 Y139.246 E.39624
G1 X124.085 Y139.246 E.02416
G1 X131.593 Y146.754 E.39624
G1 X130.946 Y146.754 E.02416
G1 X123.437 Y139.246 E.39624
G1 X122.789 Y139.246 E.02416
G1 X130.298 Y146.754 E.39624
G1 X129.651 Y146.754 E.02416
G1 X122.142 Y139.246 E.39624
G1 X121.494 Y139.246 E.02416
G1 X129.003 Y146.754 E.39624
G1 X128.356 Y146.754 E.02416
G1 X120.847 Y139.246 E.39624
G1 X120.199 Y139.246 E.02416
G1 X127.708 Y146.754 E.39624
G1 X127.06 Y146.754 E.02416
G1 X119.552 Y139.246 E.39624
G1 X118.904 Y139.246 E.02416
G1 X126.413 Y146.754 E.39624
G1 X125.765 Y146.754 E.02416
G1 X118.256 Y139.246 E.39624
G1 X117.609 Y139.246 E.02416
G1 X125.118 Y146.754 E.39624
G1 X124.47 Y146.754 E.02416
G1 X116.961 Y139.246 E.39624
M73 P17 R46
G1 X116.314 Y139.246 E.02416
G1 X123.822 Y146.754 E.39624
G1 X123.175 Y146.754 E.02416
G1 X115.666 Y139.246 E.39624
G1 X115.018 Y139.246 E.02416
G1 X122.527 Y146.754 E.39624
G1 X121.88 Y146.754 E.02416
G1 X114.371 Y139.246 E.39624
G1 X113.723 Y139.246 E.02416
G1 X121.232 Y146.754 E.39624
G1 X120.585 Y146.754 E.02416
G1 X113.076 Y139.246 E.39624
G1 X112.428 Y139.246 E.02416
G1 X119.937 Y146.754 E.39624
G1 X119.289 Y146.754 E.02416
G1 X111.781 Y139.246 E.39624
G1 X111.133 Y139.246 E.02416
G1 X118.642 Y146.754 E.39624
G1 X117.994 Y146.754 E.02416
G1 X110.485 Y139.246 E.39624
G1 X109.838 Y139.246 E.02416
G1 X117.347 Y146.754 E.39624
G1 X116.699 Y146.754 E.02416
G1 X109.19 Y139.246 E.39624
G1 X108.543 Y139.246 E.02416
G1 X116.051 Y146.754 E.39624
G1 X115.404 Y146.754 E.02416
G1 X107.895 Y139.246 E.39624
G1 X107.247 Y139.246 E.02416
G1 X114.756 Y146.754 E.39624
G1 X114.109 Y146.754 E.02416
G1 X106.6 Y139.246 E.39624
G1 X105.952 Y139.246 E.02416
G1 X113.461 Y146.754 E.39624
G1 X112.813 Y146.754 E.02416
G1 X105.305 Y139.246 E.39624
G1 X104.657 Y139.246 E.02416
G1 X112.166 Y146.754 E.39624
G1 X111.518 Y146.754 E.02416
G1 X104.01 Y139.246 E.39624
G1 X103.362 Y139.246 E.02416
G1 X110.871 Y146.754 E.39624
G1 X110.223 Y146.754 E.02416
G1 X102.714 Y139.246 E.39624
G1 X102.067 Y139.246 E.02416
G1 X109.576 Y146.754 E.39624
G1 X108.928 Y146.754 E.02416
G1 X101.419 Y139.246 E.39624
G1 X100.772 Y139.246 E.02416
G1 X108.28 Y146.754 E.39624
G1 X107.633 Y146.754 E.02416
G1 X100.124 Y139.246 E.39624
G1 X99.476 Y139.246 E.02416
G1 X106.985 Y146.754 E.39624
G1 X106.338 Y146.754 E.02416
G1 X98.829 Y139.246 E.39624
G1 X98.181 Y139.246 E.02416
G1 X105.69 Y146.754 E.39624
G1 X105.042 Y146.754 E.02416
G1 X97.534 Y139.246 E.39624
G1 X96.886 Y139.246 E.02416
G1 X104.395 Y146.754 E.39624
G1 X103.747 Y146.754 E.02416
G1 X96.238 Y139.246 E.39624
G1 X95.591 Y139.246 E.02416
G1 X103.1 Y146.754 E.39624
G1 X102.452 Y146.754 E.02416
G1 X94.943 Y139.246 E.39624
G1 X94.296 Y139.246 E.02416
G1 X101.805 Y146.754 E.39624
G1 X101.157 Y146.754 E.02416
G1 X93.648 Y139.246 E.39624
G1 X93.001 Y139.246 E.02416
G1 X100.509 Y146.754 E.39624
G1 X99.862 Y146.754 E.02416
G1 X92.353 Y139.246 E.39624
G1 X91.705 Y139.246 E.02416
G1 X99.214 Y146.754 E.39624
G1 X98.567 Y146.754 E.02416
G1 X91.058 Y139.246 E.39624
G1 X90.41 Y139.246 E.02416
G1 X97.919 Y146.754 E.39624
G1 X97.271 Y146.754 E.02416
G1 X89.763 Y139.246 E.39624
G1 X89.115 Y139.246 E.02416
G1 X96.624 Y146.754 E.39624
G1 X95.976 Y146.754 E.02416
G1 X88.467 Y139.246 E.39624
G1 X87.82 Y139.246 E.02416
G1 X95.329 Y146.754 E.39624
G1 X94.681 Y146.754 E.02416
G1 X87.172 Y139.246 E.39624
G1 X86.525 Y139.246 E.02416
G1 X94.034 Y146.754 E.39624
G1 X93.386 Y146.754 E.02416
G1 X85.877 Y139.246 E.39624
G1 X85.23 Y139.246 E.02416
G1 X92.738 Y146.754 E.39624
G1 X92.091 Y146.754 E.02416
G1 X84.582 Y139.246 E.39624
G1 X83.934 Y139.246 E.02416
G1 X91.443 Y146.754 E.39624
G1 X90.796 Y146.754 E.02416
G1 X83.287 Y139.246 E.39624
G1 X82.639 Y139.246 E.02416
G1 X90.148 Y146.754 E.39624
G1 X89.5 Y146.754 E.02416
G1 X81.992 Y139.246 E.39624
M73 P17 R45
G1 X81.344 Y139.246 E.02416
G1 X88.853 Y146.754 E.39624
G1 X88.205 Y146.754 E.02416
G1 X80.696 Y139.246 E.39624
G1 X80.049 Y139.246 E.02416
G1 X87.558 Y146.754 E.39624
G1 X86.91 Y146.754 E.02416
G1 X79.401 Y139.246 E.39624
G1 X78.754 Y139.246 E.02416
G1 X86.263 Y146.754 E.39624
G1 X85.615 Y146.754 E.02416
G1 X78.106 Y139.246 E.39624
G1 X77.459 Y139.246 E.02416
G1 X84.967 Y146.754 E.39624
G1 X84.32 Y146.754 E.02416
G1 X76.811 Y139.246 E.39624
G1 X76.163 Y139.246 E.02416
G1 X83.672 Y146.754 E.39624
G1 X83.025 Y146.754 E.02416
G1 X75.516 Y139.246 E.39624
G1 X74.868 Y139.246 E.02416
G1 X82.377 Y146.754 E.39624
G1 X81.729 Y146.754 E.02416
G1 X74.221 Y139.246 E.39624
G1 X73.573 Y139.246 E.02416
G1 X81.082 Y146.754 E.39624
G1 X80.434 Y146.754 E.02416
G1 X72.925 Y139.246 E.39624
G1 X72.278 Y139.246 E.02416
G1 X79.787 Y146.754 E.39624
G1 X79.139 Y146.754 E.02416
G1 X71.63 Y139.246 E.39624
G1 X70.983 Y139.246 E.02416
G1 X78.492 Y146.754 E.39624
G1 X77.844 Y146.754 E.02416
G1 X70.335 Y139.246 E.39624
G1 X69.688 Y139.246 E.02416
G1 X77.196 Y146.754 E.39624
G1 X76.549 Y146.754 E.02416
G1 X69.04 Y139.246 E.39624
G1 X68.392 Y139.246 E.02416
G1 X75.901 Y146.754 E.39624
G1 X75.254 Y146.754 E.02416
G1 X67.745 Y139.246 E.39624
G1 X67.097 Y139.246 E.02416
G1 X74.606 Y146.754 E.39624
G1 X73.958 Y146.754 E.02416
G1 X66.45 Y139.246 E.39624
G1 X65.802 Y139.246 E.02416
G1 X73.311 Y146.754 E.39624
G1 X72.663 Y146.754 E.02416
G1 X65.154 Y139.246 E.39624
G1 X64.507 Y139.246 E.02416
G1 X72.016 Y146.754 E.39624
G1 X71.368 Y146.754 E.02416
G1 X63.859 Y139.246 E.39624
G1 X63.212 Y139.246 E.02416
G1 X70.721 Y146.754 E.39624
G1 X70.073 Y146.754 E.02416
G1 X62.564 Y139.246 E.39624
G1 X61.917 Y139.246 E.02416
G1 X69.425 Y146.754 E.39624
G1 X68.778 Y146.754 E.02416
G1 X61.269 Y139.246 E.39624
G1 X60.621 Y139.246 E.02416
G1 X68.13 Y146.754 E.39624
G1 X67.483 Y146.754 E.02416
G1 X59.974 Y139.246 E.39624
G1 X59.326 Y139.246 E.02416
G1 X66.835 Y146.754 E.39624
G1 X66.187 Y146.754 E.02416
G1 X58.679 Y139.246 E.39624
G1 X58.031 Y139.246 E.02416
G1 X65.54 Y146.754 E.39624
G1 X64.892 Y146.754 E.02416
G1 X57.383 Y139.246 E.39624
G1 X56.736 Y139.246 E.02416
G1 X64.245 Y146.754 E.39624
G1 X63.597 Y146.754 E.02416
G1 X56.088 Y139.246 E.39624
G1 X55.441 Y139.246 E.02416
G1 X62.95 Y146.754 E.39624
G1 X62.302 Y146.754 E.02416
G1 X54.587 Y139.04 E.40709
; WIPE_START
G1 F24000
G1 X56.002 Y140.454 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.214 J-.081 P1  F30000
G1 X53.96 Y109.919 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X53.287 Y109.246 E.03553
G1 X52.639 Y109.246 E.02416
G1 X53.754 Y110.361 E.05885
G1 X53.754 Y111.008 E.02416
G1 X51.992 Y109.246 E.09302
G1 X51.344 Y109.246 E.02416
G1 X53.754 Y111.656 E.12719
G1 X53.754 Y112.304 E.02416
G1 X50.696 Y109.246 E.16137
G1 X50.049 Y109.246 E.02416
G1 X53.754 Y112.951 E.19554
G1 X53.754 Y113.599 E.02416
G1 X49.401 Y109.246 E.22971
G1 X48.754 Y109.246 E.02416
G1 X53.754 Y114.246 E.26389
G1 X53.754 Y114.894 E.02416
G1 X48.106 Y109.246 E.29806
G1 X47.459 Y109.246 E.02416
G1 X53.754 Y115.541 E.33223
G1 X53.754 Y116.189 E.02416
G1 X46.811 Y109.246 E.3664
G1 X46.246 Y109.246 E.0211
G1 X46.246 Y109.328 E.00307
G1 X53.754 Y116.837 E.39624
G1 X53.754 Y117.484 E.02416
G1 X46.246 Y109.975 E.39624
G1 X46.246 Y110.623 E.02416
G1 X53.754 Y118.132 E.39624
G1 X53.754 Y118.779 E.02416
M73 P18 R45
G1 X46.246 Y111.271 E.39624
G1 X46.246 Y111.918 E.02416
G1 X53.754 Y119.427 E.39624
G1 X53.754 Y120.075 E.02416
G1 X46.246 Y112.566 E.39624
G1 X46.246 Y113.213 E.02416
G1 X53.754 Y120.722 E.39624
G1 X53.754 Y121.37 E.02416
G1 X46.246 Y113.861 E.39624
G1 X46.246 Y114.508 E.02416
G1 X53.754 Y122.017 E.39624
G1 X53.754 Y122.665 E.02416
G1 X46.246 Y115.156 E.39624
G1 X46.246 Y115.804 E.02416
G1 X53.754 Y123.312 E.39624
G1 X53.754 Y123.96 E.02416
G1 X46.246 Y116.451 E.39624
G1 X46.246 Y117.099 E.02416
G1 X53.754 Y124.608 E.39624
G1 X53.754 Y125.255 E.02416
G1 X46.246 Y117.746 E.39624
G1 X46.246 Y118.394 E.02416
G1 X53.754 Y125.903 E.39624
G1 X53.754 Y126.55 E.02416
G1 X46.246 Y119.042 E.39624
G1 X46.246 Y119.689 E.02416
G1 X53.754 Y127.198 E.39624
G1 X53.754 Y127.846 E.02416
G1 X46.246 Y120.337 E.39624
G1 X46.246 Y120.984 E.02416
G1 X53.754 Y128.493 E.39624
G1 X53.754 Y129.141 E.02416
G1 X46.246 Y121.632 E.39624
G1 X46.246 Y122.279 E.02416
G1 X53.754 Y129.788 E.39624
G1 X53.754 Y130.436 E.02416
G1 X46.246 Y122.927 E.39624
G1 X46.246 Y123.575 E.02416
G1 X53.754 Y131.083 E.39624
G1 X53.754 Y131.731 E.02416
G1 X46.246 Y124.222 E.39624
G1 X46.246 Y124.87 E.02416
G1 X53.754 Y132.379 E.39624
G1 X53.754 Y133.026 E.02416
G1 X46.246 Y125.517 E.39624
G1 X46.246 Y126.165 E.02416
G1 X53.754 Y133.674 E.39624
G1 X53.754 Y134.321 E.02416
G1 X46.246 Y126.813 E.39624
G1 X46.246 Y127.46 E.02416
G1 X53.754 Y134.969 E.39624
G1 X53.754 Y135.617 E.02416
G1 X46.246 Y128.108 E.39624
G1 X46.246 Y128.755 E.02416
G1 X53.754 Y136.264 E.39624
G1 X53.754 Y136.912 E.02416
G1 X46.246 Y129.403 E.39624
G1 X46.246 Y130.05 E.02416
G1 X53.754 Y137.559 E.39624
G1 X53.754 Y138.207 E.02416
G1 X46.246 Y130.698 E.39624
G1 X46.246 Y131.346 E.02416
G1 X61.654 Y146.754 E.81312
G1 X61.007 Y146.754 E.02416
G1 X46.246 Y131.993 E.77895
G1 X46.246 Y132.641 E.02416
G1 X60.359 Y146.754 E.74477
G1 X59.712 Y146.754 E.02416
G1 X46.246 Y133.288 E.7106
G1 X46.246 Y133.936 E.02416
G1 X59.064 Y146.754 E.67643
G1 X58.416 Y146.754 E.02416
G1 X46.246 Y134.584 E.64226
G1 X46.246 Y135.231 E.02416
G1 X57.769 Y146.754 E.60808
G1 X57.121 Y146.754 E.02416
G1 X46.246 Y135.879 E.57391
G1 X46.246 Y136.526 E.02416
G1 X56.474 Y146.754 E.53974
G1 X55.826 Y146.754 E.02416
G1 X46.246 Y137.174 E.50556
G1 X46.246 Y137.821 E.02416
G1 X55.179 Y146.754 E.47139
G1 X54.531 Y146.754 E.02416
G1 X46.246 Y138.469 E.43722
G1 X46.246 Y139.117 E.02416
G1 X53.883 Y146.754 E.40304
G1 X53.236 Y146.754 E.02416
G1 X46.246 Y139.764 E.36887
G1 X46.246 Y140.412 E.02416
G1 X52.588 Y146.754 E.3347
G1 X51.941 Y146.754 E.02416
G1 X46.246 Y141.059 E.30053
G1 X46.246 Y141.707 E.02416
G1 X51.293 Y146.754 E.26635
G1 X50.645 Y146.754 E.02416
G1 X46.246 Y142.355 E.23218
G1 X46.246 Y143.002 E.02416
G1 X49.998 Y146.754 E.19801
G1 X49.35 Y146.754 E.02416
G1 X46.246 Y143.65 E.16383
G1 X46.246 Y144.297 E.02416
G1 X48.703 Y146.754 E.12966
G1 X48.055 Y146.754 E.02416
G1 X46.246 Y144.945 E.09549
G1 X46.246 Y145.592 E.02416
G1 X47.408 Y146.754 E.06132
G1 X46.76 Y146.754 E.02416
G1 X46.04 Y146.034 E.038
M106 S224.4
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X46.76 Y146.754 E-.38695
G1 X47.408 Y146.754 E-.24608
G1 X47.171 Y146.518 E-.12697
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/275
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
G3 Z.6 I.918 J.799 P1  F30000
G1 X54.398 Y138.21 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X54.398 Y138.602 E.01301
G1 X205.602 Y138.602 E5.01572
G1 X205.602 Y108.602 E.99516
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y147.398 E1.28693
G1 X45.602 Y147.398 E5.59927
G1 X45.602 Y108.602 E1.28693
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y138.15 E.98016
G1 X54.79 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X205.21 Y138.21 E4.62199
G1 X205.21 Y108.21 E.92182
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y147.79 E1.21618
G1 X45.21 Y147.79 E5.21072
G1 X45.21 Y108.21 E1.21618
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y138.15 E.91997
M204 S10000
; WIPE_START
G1 F24000
G1 X56.79 Y138.151 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.149 J-.401 P1  F30000
G1 X46.528 Y108.766 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420188
G1 F15000
G1 X45.935 Y109.359 E.02578
G1 X45.935 Y109.892 E.0164
G1 X46.892 Y108.935 E.0416
G1 X47.426 Y108.935 E.0164
G1 X45.935 Y110.426 E.0648
G1 X45.935 Y110.959 E.0164
G1 X47.959 Y108.935 E.088
G1 X48.493 Y108.935 E.0164
G1 X45.935 Y111.493 E.11119
G1 X45.935 Y112.026 E.0164
G1 X49.026 Y108.935 E.13439
G1 X49.56 Y108.935 E.0164
G1 X45.935 Y112.56 E.15758
G1 X45.935 Y113.093 E.0164
G1 X50.093 Y108.935 E.18078
G1 X50.627 Y108.935 E.0164
G1 X45.935 Y113.627 E.20398
G1 X45.935 Y114.161 E.0164
G1 X51.161 Y108.935 E.22717
G1 X51.694 Y108.935 E.0164
G1 X45.935 Y114.694 E.25037
G1 X45.935 Y115.228 E.0164
G1 X52.228 Y108.935 E.27357
G1 X52.761 Y108.935 E.0164
G1 X45.935 Y115.761 E.29676
G1 X45.935 Y116.295 E.0164
G1 X53.295 Y108.935 E.31996
G1 X53.828 Y108.935 E.0164
G1 X45.935 Y116.828 E.34316
G1 X45.935 Y117.362 E.0164
G1 X54.065 Y109.232 E.35343
G1 X54.065 Y109.766 E.0164
G1 X45.935 Y117.895 E.35343
G1 X45.935 Y118.429 E.0164
G1 X54.065 Y110.3 E.35343
G1 X54.065 Y110.833 E.0164
G1 X45.935 Y118.962 E.35343
G1 X45.935 Y119.496 E.0164
G1 X54.065 Y111.367 E.35343
G1 X54.065 Y111.9 E.0164
G1 X45.935 Y120.029 E.35343
G1 X45.935 Y120.563 E.0164
G1 X54.065 Y112.434 E.35343
G1 X54.065 Y112.967 E.0164
G1 X45.935 Y121.097 E.35343
G1 X45.935 Y121.63 E.0164
G1 X54.065 Y113.501 E.35343
G1 X54.065 Y114.034 E.0164
G1 X45.935 Y122.164 E.35343
G1 X45.935 Y122.697 E.0164
G1 X54.065 Y114.568 E.35343
G1 X54.065 Y115.101 E.0164
G1 X45.935 Y123.231 E.35343
G1 X45.935 Y123.764 E.0164
G1 X54.065 Y115.635 E.35343
G1 X54.065 Y116.168 E.0164
G1 X45.935 Y124.298 E.35343
G1 X45.935 Y124.831 E.0164
G1 X54.065 Y116.702 E.35343
G1 X54.065 Y117.236 E.0164
G1 X45.935 Y125.365 E.35343
G1 X45.935 Y125.898 E.0164
G1 X54.065 Y117.769 E.35343
G1 X54.065 Y118.303 E.0164
G1 X45.935 Y126.432 E.35343
G1 X45.935 Y126.965 E.0164
G1 X54.065 Y118.836 E.35343
G1 X54.065 Y119.37 E.0164
G1 X45.935 Y127.499 E.35343
G1 X45.935 Y128.033 E.0164
G1 X54.065 Y119.903 E.35343
G1 X54.065 Y120.437 E.0164
G1 X45.935 Y128.566 E.35343
G1 X45.935 Y129.1 E.0164
G1 X54.065 Y120.97 E.35343
G1 X54.065 Y121.504 E.0164
G1 X45.935 Y129.633 E.35343
G1 X45.935 Y130.167 E.0164
G1 X54.065 Y122.037 E.35343
G1 X54.065 Y122.571 E.0164
G1 X45.935 Y130.7 E.35343
G1 X45.935 Y131.234 E.0164
G1 X54.065 Y123.104 E.35343
G1 X54.065 Y123.638 E.0164
G1 X45.935 Y131.767 E.35343
G1 X45.935 Y132.301 E.0164
G1 X54.065 Y124.172 E.35343
G1 X54.065 Y124.705 E.0164
G1 X45.935 Y132.834 E.35343
G1 X45.935 Y133.368 E.0164
G1 X54.065 Y125.239 E.35343
G1 X54.065 Y125.772 E.0164
G1 X45.935 Y133.901 E.35343
G1 X45.935 Y134.435 E.0164
G1 X54.065 Y126.306 E.35343
G1 X54.065 Y126.839 E.0164
G1 X45.935 Y134.969 E.35343
G1 X45.935 Y135.502 E.0164
G1 X54.065 Y127.373 E.35343
G1 X54.065 Y127.906 E.0164
G1 X45.935 Y136.036 E.35343
G1 X45.935 Y136.569 E.0164
G1 X54.065 Y128.44 E.35343
G1 X54.065 Y128.973 E.0164
G1 X45.935 Y137.103 E.35343
G1 X45.935 Y137.636 E.0164
G1 X54.065 Y129.507 E.35343
G1 X54.065 Y130.04 E.0164
G1 X45.935 Y138.17 E.35343
G1 X45.935 Y138.703 E.0164
G1 X54.065 Y130.574 E.35343
G1 X54.065 Y131.107 E.0164
G1 X45.935 Y139.237 E.35343
G1 X45.935 Y139.77 E.0164
G1 X54.065 Y131.641 E.35343
G1 X54.065 Y132.175 E.0164
G1 X45.935 Y140.304 E.35343
G1 X45.935 Y140.837 E.0164
G1 X54.065 Y132.708 E.35343
G1 X54.065 Y133.242 E.0164
G1 X45.935 Y141.371 E.35343
G1 X45.935 Y141.904 E.0164
G1 X54.065 Y133.775 E.35343
G1 X54.065 Y134.309 E.0164
G1 X45.935 Y142.438 E.35343
G1 X45.935 Y142.972 E.0164
G1 X54.065 Y134.842 E.35343
G1 X54.065 Y135.376 E.0164
G1 X45.935 Y143.505 E.35343
G1 X45.935 Y144.039 E.0164
G1 X54.065 Y135.909 E.35343
G1 X54.065 Y136.443 E.0164
G1 X45.935 Y144.572 E.35343
G1 X45.935 Y145.106 E.0164
G1 X54.065 Y136.976 E.35343
G1 X54.065 Y137.51 E.0164
G1 X45.935 Y145.639 E.35343
G1 X45.935 Y146.173 E.0164
G1 X54.065 Y138.043 E.35343
G1 X54.065 Y138.577 E.0164
G1 X45.935 Y146.706 E.35343
G1 X45.935 Y147.065 E.01102
G1 X46.111 Y147.065 E.00539
G1 X54.24 Y138.935 E.35343
G1 X54.773 Y138.935 E.0164
G1 X46.644 Y147.065 E.35343
G1 X47.178 Y147.065 E.0164
G1 X55.307 Y138.935 E.35343
G1 X55.84 Y138.935 E.0164
G1 X47.711 Y147.065 E.35343
G1 X48.245 Y147.065 E.0164
G1 X56.374 Y138.935 E.35343
G1 X56.908 Y138.935 E.0164
G1 X48.778 Y147.065 E.35343
G1 X49.312 Y147.065 E.0164
G1 X57.441 Y138.935 E.35343
G1 X57.975 Y138.935 E.0164
G1 X49.845 Y147.065 E.35343
G1 X50.379 Y147.065 E.0164
G1 X58.508 Y138.935 E.35343
G1 X59.042 Y138.935 E.0164
G1 X50.912 Y147.065 E.35343
G1 X51.446 Y147.065 E.0164
G1 X59.575 Y138.935 E.35343
G1 X60.109 Y138.935 E.0164
G1 X51.979 Y147.065 E.35343
G1 X52.513 Y147.065 E.0164
G1 X60.642 Y138.935 E.35343
G1 X61.176 Y138.935 E.0164
G1 X53.047 Y147.065 E.35343
G1 X53.58 Y147.065 E.0164
G1 X61.709 Y138.935 E.35343
G1 X62.243 Y138.935 E.0164
G1 X54.114 Y147.065 E.35343
G1 X54.647 Y147.065 E.0164
G1 X62.776 Y138.935 E.35343
G1 X63.31 Y138.935 E.0164
G1 X55.181 Y147.065 E.35343
G1 X55.714 Y147.065 E.0164
G1 X63.844 Y138.935 E.35343
G1 X64.377 Y138.935 E.0164
G1 X56.248 Y147.065 E.35343
G1 X56.781 Y147.065 E.0164
G1 X64.911 Y138.935 E.35343
G1 X65.444 Y138.935 E.0164
G1 X57.315 Y147.065 E.35343
G1 X57.848 Y147.065 E.0164
G1 X65.978 Y138.935 E.35343
G1 X66.511 Y138.935 E.0164
G1 X58.382 Y147.065 E.35343
G1 X58.915 Y147.065 E.0164
G1 X67.045 Y138.935 E.35343
G1 X67.578 Y138.935 E.0164
G1 X59.449 Y147.065 E.35343
G1 X59.983 Y147.065 E.0164
G1 X68.112 Y138.935 E.35343
G1 X68.645 Y138.935 E.0164
G1 X60.516 Y147.065 E.35343
G1 X61.05 Y147.065 E.0164
G1 X69.179 Y138.935 E.35343
G1 X69.712 Y138.935 E.0164
G1 X61.583 Y147.065 E.35343
G1 X62.117 Y147.065 E.0164
G1 X70.246 Y138.935 E.35343
G1 X70.78 Y138.935 E.0164
G1 X62.65 Y147.065 E.35343
M73 P19 R45
G1 X63.184 Y147.065 E.0164
G1 X71.313 Y138.935 E.35343
G1 X71.847 Y138.935 E.0164
G1 X63.717 Y147.065 E.35343
G1 X64.251 Y147.065 E.0164
G1 X72.38 Y138.935 E.35343
G1 X72.914 Y138.935 E.0164
G1 X64.784 Y147.065 E.35343
G1 X65.318 Y147.065 E.0164
G1 X73.447 Y138.935 E.35343
G1 X73.981 Y138.935 E.0164
G1 X65.851 Y147.065 E.35343
G1 X66.385 Y147.065 E.0164
G1 X74.514 Y138.935 E.35343
G1 X75.048 Y138.935 E.0164
G1 X66.919 Y147.065 E.35343
G1 X67.452 Y147.065 E.0164
G1 X75.581 Y138.935 E.35343
G1 X76.115 Y138.935 E.0164
G1 X67.986 Y147.065 E.35343
G1 X68.519 Y147.065 E.0164
G1 X76.648 Y138.935 E.35343
G1 X77.182 Y138.935 E.0164
G1 X69.053 Y147.065 E.35343
G1 X69.586 Y147.065 E.0164
G1 X77.716 Y138.935 E.35343
G1 X78.249 Y138.935 E.0164
G1 X70.12 Y147.065 E.35343
G1 X70.653 Y147.065 E.0164
G1 X78.783 Y138.935 E.35343
G1 X79.316 Y138.935 E.0164
G1 X71.187 Y147.065 E.35343
G1 X71.72 Y147.065 E.0164
G1 X79.85 Y138.935 E.35343
G1 X80.383 Y138.935 E.0164
G1 X72.254 Y147.065 E.35343
G1 X72.787 Y147.065 E.0164
G1 X80.917 Y138.935 E.35343
G1 X81.45 Y138.935 E.0164
G1 X73.321 Y147.065 E.35343
G1 X73.855 Y147.065 E.0164
G1 X81.984 Y138.935 E.35343
G1 X82.517 Y138.935 E.0164
G1 X74.388 Y147.065 E.35343
G1 X74.922 Y147.065 E.0164
G1 X83.051 Y138.935 E.35343
G1 X83.584 Y138.935 E.0164
G1 X75.455 Y147.065 E.35343
G1 X75.989 Y147.065 E.0164
G1 X84.118 Y138.935 E.35343
G1 X84.652 Y138.935 E.0164
G1 X76.522 Y147.065 E.35343
G1 X77.056 Y147.065 E.0164
G1 X85.185 Y138.935 E.35343
G1 X85.719 Y138.935 E.0164
G1 X77.589 Y147.065 E.35343
G1 X78.123 Y147.065 E.0164
G1 X86.252 Y138.935 E.35343
G1 X86.786 Y138.935 E.0164
G1 X78.656 Y147.065 E.35343
G1 X79.19 Y147.065 E.0164
G1 X87.319 Y138.935 E.35343
G1 X87.853 Y138.935 E.0164
G1 X79.723 Y147.065 E.35343
G1 X80.257 Y147.065 E.0164
G1 X88.386 Y138.935 E.35343
G1 X88.92 Y138.935 E.0164
G1 X80.79 Y147.065 E.35343
G1 X81.324 Y147.065 E.0164
G1 X89.453 Y138.935 E.35343
G1 X89.987 Y138.935 E.0164
G1 X81.858 Y147.065 E.35343
G1 X82.391 Y147.065 E.0164
G1 X90.52 Y138.935 E.35343
G1 X91.054 Y138.935 E.0164
G1 X82.925 Y147.065 E.35343
G1 X83.458 Y147.065 E.0164
G1 X91.587 Y138.935 E.35343
G1 X92.121 Y138.935 E.0164
G1 X83.992 Y147.065 E.35343
G1 X84.525 Y147.065 E.0164
G1 X92.655 Y138.935 E.35343
G1 X93.188 Y138.935 E.0164
G1 X85.059 Y147.065 E.35343
G1 X85.592 Y147.065 E.0164
G1 X93.722 Y138.935 E.35343
G1 X94.255 Y138.935 E.0164
G1 X86.126 Y147.065 E.35343
G1 X86.659 Y147.065 E.0164
G1 X94.789 Y138.935 E.35343
G1 X95.322 Y138.935 E.0164
G1 X87.193 Y147.065 E.35343
G1 X87.726 Y147.065 E.0164
G1 X95.856 Y138.935 E.35343
G1 X96.389 Y138.935 E.0164
G1 X88.26 Y147.065 E.35343
G1 X88.794 Y147.065 E.0164
G1 X96.923 Y138.935 E.35343
G1 X97.456 Y138.935 E.0164
G1 X89.327 Y147.065 E.35343
G1 X89.861 Y147.065 E.0164
G1 X97.99 Y138.935 E.35343
G1 X98.523 Y138.935 E.0164
G1 X90.394 Y147.065 E.35343
G1 X90.928 Y147.065 E.0164
G1 X99.057 Y138.935 E.35343
G1 X99.591 Y138.935 E.0164
G1 X91.461 Y147.065 E.35343
G1 X91.995 Y147.065 E.0164
G1 X100.124 Y138.935 E.35343
G1 X100.658 Y138.935 E.0164
G1 X92.528 Y147.065 E.35343
G1 X93.062 Y147.065 E.0164
G1 X101.191 Y138.935 E.35343
G1 X101.725 Y138.935 E.0164
G1 X93.595 Y147.065 E.35343
G1 X94.129 Y147.065 E.0164
G1 X102.258 Y138.935 E.35343
G1 X102.792 Y138.935 E.0164
G1 X94.662 Y147.065 E.35343
G1 X95.196 Y147.065 E.0164
G1 X103.325 Y138.935 E.35343
G1 X103.859 Y138.935 E.0164
G1 X95.73 Y147.065 E.35343
G1 X96.263 Y147.065 E.0164
G1 X104.392 Y138.935 E.35343
G1 X104.926 Y138.935 E.0164
G1 X96.797 Y147.065 E.35343
G1 X97.33 Y147.065 E.0164
G1 X105.459 Y138.935 E.35343
G1 X105.993 Y138.935 E.0164
G1 X97.864 Y147.065 E.35343
G1 X98.397 Y147.065 E.0164
G1 X106.527 Y138.935 E.35343
G1 X107.06 Y138.935 E.0164
G1 X98.931 Y147.065 E.35343
G1 X99.464 Y147.065 E.0164
G1 X107.594 Y138.935 E.35343
G1 X108.127 Y138.935 E.0164
G1 X99.998 Y147.065 E.35343
G1 X100.531 Y147.065 E.0164
G1 X108.661 Y138.935 E.35343
G1 X109.194 Y138.935 E.0164
G1 X101.065 Y147.065 E.35343
G1 X101.598 Y147.065 E.0164
G1 X109.728 Y138.935 E.35343
G1 X110.261 Y138.935 E.0164
G1 X102.132 Y147.065 E.35343
G1 X102.666 Y147.065 E.0164
G1 X110.795 Y138.935 E.35343
G1 X111.328 Y138.935 E.0164
G1 X103.199 Y147.065 E.35343
G1 X103.733 Y147.065 E.0164
G1 X111.862 Y138.935 E.35343
G1 X112.395 Y138.935 E.0164
G1 X104.266 Y147.065 E.35343
G1 X104.8 Y147.065 E.0164
G1 X112.929 Y138.935 E.35343
G1 X113.463 Y138.935 E.0164
G1 X105.333 Y147.065 E.35343
G1 X105.867 Y147.065 E.0164
G1 X113.996 Y138.935 E.35343
G1 X114.53 Y138.935 E.0164
G1 X106.4 Y147.065 E.35343
G1 X106.934 Y147.065 E.0164
G1 X115.063 Y138.935 E.35343
G1 X115.597 Y138.935 E.0164
G1 X107.467 Y147.065 E.35343
G1 X108.001 Y147.065 E.0164
G1 X116.13 Y138.935 E.35343
G1 X116.664 Y138.935 E.0164
G1 X108.534 Y147.065 E.35343
G1 X109.068 Y147.065 E.0164
G1 X117.197 Y138.935 E.35343
G1 X117.731 Y138.935 E.0164
G1 X109.602 Y147.065 E.35343
G1 X110.135 Y147.065 E.0164
G1 X118.264 Y138.935 E.35343
G1 X118.798 Y138.935 E.0164
G1 X110.669 Y147.065 E.35343
G1 X111.202 Y147.065 E.0164
G1 X119.331 Y138.935 E.35343
G1 X119.865 Y138.935 E.0164
G1 X111.736 Y147.065 E.35343
G1 X112.269 Y147.065 E.0164
G1 X120.399 Y138.935 E.35343
G1 X120.932 Y138.935 E.0164
G1 X112.803 Y147.065 E.35343
G1 X113.336 Y147.065 E.0164
G1 X121.466 Y138.935 E.35343
G1 X121.999 Y138.935 E.0164
G1 X113.87 Y147.065 E.35343
G1 X114.403 Y147.065 E.0164
G1 X122.533 Y138.935 E.35343
G1 X123.066 Y138.935 E.0164
G1 X114.937 Y147.065 E.35343
G1 X115.47 Y147.065 E.0164
G1 X123.6 Y138.935 E.35343
G1 X124.133 Y138.935 E.0164
G1 X116.004 Y147.065 E.35343
G1 X116.538 Y147.065 E.0164
G1 X124.667 Y138.935 E.35343
G1 X125.2 Y138.935 E.0164
G1 X117.071 Y147.065 E.35343
G1 X117.605 Y147.065 E.0164
G1 X125.734 Y138.935 E.35343
G1 X126.267 Y138.935 E.0164
G1 X118.138 Y147.065 E.35343
G1 X118.672 Y147.065 E.0164
G1 X126.801 Y138.935 E.35343
G1 X127.335 Y138.935 E.0164
G1 X119.205 Y147.065 E.35343
G1 X119.739 Y147.065 E.0164
G1 X127.868 Y138.935 E.35343
G1 X128.402 Y138.935 E.0164
G1 X120.272 Y147.065 E.35343
M73 P19 R44
G1 X120.806 Y147.065 E.0164
G1 X128.935 Y138.935 E.35343
G1 X129.469 Y138.935 E.0164
G1 X121.339 Y147.065 E.35343
G1 X121.873 Y147.065 E.0164
G1 X130.002 Y138.935 E.35343
G1 X130.536 Y138.935 E.0164
G1 X122.406 Y147.065 E.35343
G1 X122.94 Y147.065 E.0164
G1 X131.069 Y138.935 E.35343
G1 X131.603 Y138.935 E.0164
G1 X123.474 Y147.065 E.35343
G1 X124.007 Y147.065 E.0164
G1 X132.136 Y138.935 E.35343
G1 X132.67 Y138.935 E.0164
G1 X124.541 Y147.065 E.35343
G1 X125.074 Y147.065 E.0164
G1 X133.203 Y138.935 E.35343
G1 X133.737 Y138.935 E.0164
G1 X125.608 Y147.065 E.35343
G1 X126.141 Y147.065 E.0164
G1 X134.271 Y138.935 E.35343
G1 X134.804 Y138.935 E.0164
G1 X126.675 Y147.065 E.35343
G1 X127.208 Y147.065 E.0164
G1 X135.338 Y138.935 E.35343
G1 X135.871 Y138.935 E.0164
G1 X127.742 Y147.065 E.35343
G1 X128.275 Y147.065 E.0164
G1 X136.405 Y138.935 E.35343
G1 X136.938 Y138.935 E.0164
G1 X128.809 Y147.065 E.35343
G1 X129.342 Y147.065 E.0164
G1 X137.472 Y138.935 E.35343
G1 X138.005 Y138.935 E.0164
G1 X129.876 Y147.065 E.35343
G1 X130.409 Y147.065 E.0164
G1 X138.539 Y138.935 E.35343
G1 X139.072 Y138.935 E.0164
G1 X130.943 Y147.065 E.35343
G1 X131.477 Y147.065 E.0164
G1 X139.606 Y138.935 E.35343
G1 X140.139 Y138.935 E.0164
G1 X132.01 Y147.065 E.35343
G1 X132.544 Y147.065 E.0164
G1 X140.673 Y138.935 E.35343
G1 X141.206 Y138.935 E.0164
G1 X133.077 Y147.065 E.35343
G1 X133.611 Y147.065 E.0164
G1 X141.74 Y138.935 E.35343
G1 X142.274 Y138.935 E.0164
G1 X134.144 Y147.065 E.35343
G1 X134.678 Y147.065 E.0164
G1 X142.807 Y138.935 E.35343
G1 X143.341 Y138.935 E.0164
G1 X135.211 Y147.065 E.35343
G1 X135.745 Y147.065 E.0164
G1 X143.874 Y138.935 E.35343
G1 X144.408 Y138.935 E.0164
G1 X136.278 Y147.065 E.35343
G1 X136.812 Y147.065 E.0164
G1 X144.941 Y138.935 E.35343
G1 X145.475 Y138.935 E.0164
G1 X137.345 Y147.065 E.35343
G1 X137.879 Y147.065 E.0164
G1 X146.008 Y138.935 E.35343
G1 X146.542 Y138.935 E.0164
G1 X138.413 Y147.065 E.35343
G1 X138.946 Y147.065 E.0164
G1 X147.075 Y138.935 E.35343
G1 X147.609 Y138.935 E.0164
G1 X139.48 Y147.065 E.35343
G1 X140.013 Y147.065 E.0164
G1 X148.142 Y138.935 E.35343
G1 X148.676 Y138.935 E.0164
G1 X140.547 Y147.065 E.35343
G1 X141.08 Y147.065 E.0164
G1 X149.21 Y138.935 E.35343
G1 X149.743 Y138.935 E.0164
G1 X141.614 Y147.065 E.35343
G1 X142.147 Y147.065 E.0164
G1 X150.277 Y138.935 E.35343
G1 X150.81 Y138.935 E.0164
G1 X142.681 Y147.065 E.35343
G1 X143.214 Y147.065 E.0164
G1 X151.344 Y138.935 E.35343
G1 X151.877 Y138.935 E.0164
G1 X143.748 Y147.065 E.35343
G1 X144.281 Y147.065 E.0164
G1 X152.411 Y138.935 E.35343
G1 X152.944 Y138.935 E.0164
G1 X144.815 Y147.065 E.35343
G1 X145.349 Y147.065 E.0164
G1 X153.478 Y138.935 E.35343
G1 X154.011 Y138.935 E.0164
G1 X145.882 Y147.065 E.35343
G1 X146.416 Y147.065 E.0164
G1 X154.545 Y138.935 E.35343
G1 X155.078 Y138.935 E.0164
G1 X146.949 Y147.065 E.35343
G1 X147.483 Y147.065 E.0164
G1 X155.612 Y138.935 E.35343
G1 X156.146 Y138.935 E.0164
G1 X148.016 Y147.065 E.35343
G1 X148.55 Y147.065 E.0164
G1 X156.679 Y138.935 E.35343
G1 X157.213 Y138.935 E.0164
G1 X149.083 Y147.065 E.35343
G1 X149.617 Y147.065 E.0164
G1 X157.746 Y138.935 E.35343
G1 X158.28 Y138.935 E.0164
G1 X150.15 Y147.065 E.35343
G1 X150.684 Y147.065 E.0164
G1 X158.813 Y138.935 E.35343
G1 X159.347 Y138.935 E.0164
G1 X151.217 Y147.065 E.35343
G1 X151.751 Y147.065 E.0164
G1 X159.88 Y138.935 E.35343
G1 X160.414 Y138.935 E.0164
G1 X152.285 Y147.065 E.35343
G1 X152.818 Y147.065 E.0164
G1 X160.947 Y138.935 E.35343
G1 X161.481 Y138.935 E.0164
G1 X153.352 Y147.065 E.35343
G1 X153.885 Y147.065 E.0164
G1 X162.014 Y138.935 E.35343
G1 X162.548 Y138.935 E.0164
G1 X154.419 Y147.065 E.35343
G1 X154.952 Y147.065 E.0164
G1 X163.082 Y138.935 E.35343
G1 X163.615 Y138.935 E.0164
G1 X155.486 Y147.065 E.35343
G1 X156.019 Y147.065 E.0164
G1 X164.149 Y138.935 E.35343
G1 X164.682 Y138.935 E.0164
G1 X156.553 Y147.065 E.35343
G1 X157.086 Y147.065 E.0164
G1 X165.216 Y138.935 E.35343
G1 X165.749 Y138.935 E.0164
G1 X157.62 Y147.065 E.35343
G1 X158.153 Y147.065 E.0164
G1 X166.283 Y138.935 E.35343
G1 X166.816 Y138.935 E.0164
G1 X158.687 Y147.065 E.35343
G1 X159.221 Y147.065 E.0164
G1 X167.35 Y138.935 E.35343
G1 X167.883 Y138.935 E.0164
G1 X159.754 Y147.065 E.35343
G1 X160.288 Y147.065 E.0164
G1 X168.417 Y138.935 E.35343
G1 X168.95 Y138.935 E.0164
G1 X160.821 Y147.065 E.35343
G1 X161.355 Y147.065 E.0164
G1 X169.484 Y138.935 E.35343
G1 X170.018 Y138.935 E.0164
G1 X161.888 Y147.065 E.35343
G1 X162.422 Y147.065 E.0164
G1 X170.551 Y138.935 E.35343
G1 X171.085 Y138.935 E.0164
G1 X162.955 Y147.065 E.35343
G1 X163.489 Y147.065 E.0164
G1 X171.618 Y138.935 E.35343
G1 X172.152 Y138.935 E.0164
G1 X164.022 Y147.065 E.35343
G1 X164.556 Y147.065 E.0164
G1 X172.685 Y138.935 E.35343
G1 X173.219 Y138.935 E.0164
G1 X165.089 Y147.065 E.35343
G1 X165.623 Y147.065 E.0164
G1 X173.752 Y138.935 E.35343
G1 X174.286 Y138.935 E.0164
G1 X166.157 Y147.065 E.35343
G1 X166.69 Y147.065 E.0164
G1 X174.819 Y138.935 E.35343
G1 X175.353 Y138.935 E.0164
G1 X167.224 Y147.065 E.35343
G1 X167.757 Y147.065 E.0164
G1 X175.886 Y138.935 E.35343
G1 X176.42 Y138.935 E.0164
G1 X168.291 Y147.065 E.35343
G1 X168.824 Y147.065 E.0164
G1 X176.954 Y138.935 E.35343
G1 X177.487 Y138.935 E.0164
G1 X169.358 Y147.065 E.35343
G1 X169.891 Y147.065 E.0164
G1 X178.021 Y138.935 E.35343
G1 X178.554 Y138.935 E.0164
G1 X170.425 Y147.065 E.35343
G1 X170.958 Y147.065 E.0164
G1 X179.088 Y138.935 E.35343
G1 X179.621 Y138.935 E.0164
G1 X171.492 Y147.065 E.35343
G1 X172.025 Y147.065 E.0164
G1 X180.155 Y138.935 E.35343
G1 X180.688 Y138.935 E.0164
G1 X172.559 Y147.065 E.35343
G1 X173.092 Y147.065 E.0164
G1 X181.222 Y138.935 E.35343
G1 X181.755 Y138.935 E.0164
G1 X173.626 Y147.065 E.35343
G1 X174.16 Y147.065 E.0164
G1 X182.289 Y138.935 E.35343
G1 X182.822 Y138.935 E.0164
G1 X174.693 Y147.065 E.35343
G1 X175.227 Y147.065 E.0164
G1 X183.356 Y138.935 E.35343
G1 X183.89 Y138.935 E.0164
G1 X175.76 Y147.065 E.35343
G1 X176.294 Y147.065 E.0164
G1 X184.423 Y138.935 E.35343
G1 X184.957 Y138.935 E.0164
G1 X176.827 Y147.065 E.35343
G1 X177.361 Y147.065 E.0164
G1 X185.49 Y138.935 E.35343
G1 X186.024 Y138.935 E.0164
G1 X177.894 Y147.065 E.35343
G1 X178.428 Y147.065 E.0164
G1 X186.557 Y138.935 E.35343
G1 X187.091 Y138.935 E.0164
G1 X178.961 Y147.065 E.35343
G1 X179.495 Y147.065 E.0164
G1 X187.624 Y138.935 E.35343
G1 X188.158 Y138.935 E.0164
G1 X180.028 Y147.065 E.35343
G1 X180.562 Y147.065 E.0164
G1 X188.691 Y138.935 E.35343
G1 X189.225 Y138.935 E.0164
G1 X181.096 Y147.065 E.35343
G1 X181.629 Y147.065 E.0164
G1 X189.758 Y138.935 E.35343
G1 X190.292 Y138.935 E.0164
G1 X182.163 Y147.065 E.35343
G1 X182.696 Y147.065 E.0164
G1 X190.825 Y138.935 E.35343
G1 X191.359 Y138.935 E.0164
G1 X183.23 Y147.065 E.35343
G1 X183.763 Y147.065 E.0164
G1 X191.893 Y138.935 E.35343
G1 X192.426 Y138.935 E.0164
G1 X184.297 Y147.065 E.35343
G1 X184.83 Y147.065 E.0164
G1 X192.96 Y138.935 E.35343
G1 X193.493 Y138.935 E.0164
G1 X185.364 Y147.065 E.35343
G1 X185.897 Y147.065 E.0164
G1 X194.027 Y138.935 E.35343
G1 X194.56 Y138.935 E.0164
G1 X186.431 Y147.065 E.35343
G1 X186.964 Y147.065 E.0164
G1 X195.094 Y138.935 E.35343
G1 X195.627 Y138.935 E.0164
G1 X187.498 Y147.065 E.35343
G1 X188.032 Y147.065 E.0164
G1 X196.161 Y138.935 E.35343
G1 X196.694 Y138.935 E.0164
G1 X188.565 Y147.065 E.35343
G1 X189.099 Y147.065 E.0164
G1 X197.228 Y138.935 E.35343
G1 X197.761 Y138.935 E.0164
G1 X189.632 Y147.065 E.35343
G1 X190.166 Y147.065 E.0164
G1 X198.295 Y138.935 E.35343
G1 X198.829 Y138.935 E.0164
G1 X190.699 Y147.065 E.35343
G1 X191.233 Y147.065 E.0164
G1 X199.362 Y138.935 E.35343
G1 X199.896 Y138.935 E.0164
G1 X191.766 Y147.065 E.35343
G1 X192.3 Y147.065 E.0164
G1 X200.429 Y138.935 E.35343
G1 X200.963 Y138.935 E.0164
G1 X192.833 Y147.065 E.35343
G1 X193.367 Y147.065 E.0164
G1 X201.496 Y138.935 E.35343
G1 X202.03 Y138.935 E.0164
G1 X193.9 Y147.065 E.35343
G1 X194.434 Y147.065 E.0164
G1 X202.563 Y138.935 E.35343
G1 X203.097 Y138.935 E.0164
G1 X194.968 Y147.065 E.35343
G1 X195.501 Y147.065 E.0164
G1 X203.63 Y138.935 E.35343
G1 X204.164 Y138.935 E.0164
G1 X196.035 Y147.065 E.35343
G1 X196.568 Y147.065 E.0164
G1 X204.697 Y138.935 E.35343
G1 X205.231 Y138.935 E.0164
G1 X196.932 Y147.234 E.36081
G1 X213.472 Y147.234 F30000
G1 F15000
G1 X214.065 Y146.641 E.02578
G1 X214.065 Y146.108 E.0164
G1 X213.108 Y147.065 E.0416
G1 X212.574 Y147.065 E.0164
G1 X214.065 Y145.574 E.0648
G1 X214.065 Y145.041 E.0164
G1 X212.041 Y147.065 E.08799
G1 X211.507 Y147.065 E.0164
G1 X214.065 Y144.507 E.11119
G1 X214.065 Y143.974 E.0164
G1 X210.974 Y147.065 E.13439
G1 X210.44 Y147.065 E.0164
G1 X214.065 Y143.44 E.15758
G1 X214.065 Y142.907 E.0164
G1 X209.907 Y147.065 E.18078
G1 X209.373 Y147.065 E.0164
G1 X214.065 Y142.373 E.20397
G1 X214.065 Y141.84 E.0164
G1 X208.84 Y147.065 E.22717
G1 X208.306 Y147.065 E.0164
G1 X214.065 Y141.306 E.25037
G1 X214.065 Y140.772 E.0164
G1 X207.772 Y147.065 E.27356
G1 X207.239 Y147.065 E.0164
G1 X214.065 Y140.239 E.29676
G1 X214.065 Y139.705 E.0164
G1 X206.705 Y147.065 E.31996
G1 X206.172 Y147.065 E.0164
G1 X214.065 Y139.172 E.34315
G1 X214.065 Y138.638 E.0164
G1 X205.638 Y147.065 E.36635
G1 X205.105 Y147.065 E.0164
G1 X214.065 Y138.105 E.38955
G1 X214.065 Y137.571 E.0164
G1 X204.571 Y147.065 E.41274
G1 X204.038 Y147.065 E.0164
G1 X214.065 Y137.038 E.43594
G1 X214.065 Y136.504 E.0164
G1 X203.504 Y147.065 E.45913
G1 X202.971 Y147.065 E.0164
G1 X214.065 Y135.971 E.48233
G1 X214.065 Y135.437 E.0164
G1 X202.437 Y147.065 E.50553
G1 X201.904 Y147.065 E.0164
G1 X214.065 Y134.904 E.52872
G1 X214.065 Y134.37 E.0164
G1 X201.37 Y147.065 E.55192
G1 X200.836 Y147.065 E.0164
G1 X214.065 Y133.836 E.57512
G1 X214.065 Y133.303 E.0164
G1 X200.303 Y147.065 E.59831
G1 X199.769 Y147.065 E.0164
G1 X214.065 Y132.769 E.62151
G1 X214.065 Y132.236 E.0164
G1 X199.236 Y147.065 E.64471
G1 X198.702 Y147.065 E.0164
G1 X214.065 Y131.702 E.6679
G1 X214.065 Y131.169 E.0164
G1 X198.169 Y147.065 E.6911
G1 X197.635 Y147.065 E.0164
G1 X214.065 Y130.635 E.71429
G1 X214.065 Y130.102 E.0164
G1 X205.935 Y138.231 E.35343
G1 X205.935 Y137.697 E.0164
G1 X214.065 Y129.568 E.35343
G1 X214.065 Y129.035 E.0164
G1 X205.935 Y137.164 E.35343
G1 X205.935 Y136.63 E.0164
G1 X214.065 Y128.501 E.35343
G1 X214.065 Y127.968 E.0164
G1 X205.935 Y136.097 E.35343
G1 X205.935 Y135.563 E.0164
G1 X214.065 Y127.434 E.35343
G1 X214.065 Y126.9 E.0164
G1 X205.935 Y135.03 E.35343
G1 X205.935 Y134.496 E.0164
G1 X214.065 Y126.367 E.35343
G1 X214.065 Y125.833 E.0164
G1 X205.935 Y133.963 E.35343
G1 X205.935 Y133.429 E.0164
G1 X214.065 Y125.3 E.35343
G1 X214.065 Y124.766 E.0164
G1 X205.935 Y132.896 E.35343
G1 X205.935 Y132.362 E.0164
G1 X214.065 Y124.233 E.35343
G1 X214.065 Y123.699 E.0164
G1 X205.935 Y131.829 E.35343
G1 X205.935 Y131.295 E.0164
G1 X214.065 Y123.166 E.35343
G1 X214.065 Y122.632 E.0164
G1 X205.935 Y130.761 E.35343
G1 X205.935 Y130.228 E.0164
G1 X214.065 Y122.099 E.35343
G1 X214.065 Y121.565 E.0164
G1 X205.935 Y129.694 E.35343
G1 X205.935 Y129.161 E.0164
G1 X214.065 Y121.032 E.35343
G1 X214.065 Y120.498 E.0164
G1 X205.935 Y128.627 E.35343
G1 X205.935 Y128.094 E.0164
G1 X214.065 Y119.964 E.35343
G1 X214.065 Y119.431 E.0164
G1 X205.935 Y127.56 E.35343
G1 X205.935 Y127.027 E.0164
G1 X214.065 Y118.897 E.35343
G1 X214.065 Y118.364 E.0164
G1 X205.935 Y126.493 E.35343
G1 X205.935 Y125.96 E.0164
G1 X214.065 Y117.83 E.35343
G1 X214.065 Y117.297 E.0164
G1 X205.935 Y125.426 E.35343
G1 X205.935 Y124.893 E.0164
G1 X214.065 Y116.763 E.35343
G1 X214.065 Y116.23 E.0164
G1 X205.935 Y124.359 E.35343
G1 X205.935 Y123.825 E.0164
G1 X214.065 Y115.696 E.35343
G1 X214.065 Y115.163 E.0164
G1 X205.935 Y123.292 E.35343
G1 X205.935 Y122.758 E.0164
G1 X214.065 Y114.629 E.35343
G1 X214.065 Y114.096 E.0164
G1 X205.935 Y122.225 E.35343
G1 X205.935 Y121.691 E.0164
G1 X214.065 Y113.562 E.35343
G1 X214.065 Y113.029 E.0164
G1 X205.935 Y121.158 E.35343
G1 X205.935 Y120.624 E.0164
G1 X214.065 Y112.495 E.35343
G1 X214.065 Y111.961 E.0164
G1 X205.935 Y120.091 E.35343
G1 X205.935 Y119.557 E.0164
G1 X214.065 Y111.428 E.35343
G1 X214.065 Y110.894 E.0164
G1 X205.935 Y119.024 E.35343
G1 X205.935 Y118.49 E.0164
G1 X214.065 Y110.361 E.35343
G1 X214.065 Y109.827 E.0164
G1 X205.935 Y117.957 E.35343
G1 X205.935 Y117.423 E.0164
G1 X214.065 Y109.294 E.35343
G1 X214.065 Y108.935 E.01102
G1 X213.89 Y108.935 E.00538
G1 X205.935 Y116.89 E.34582
G1 X205.935 Y116.356 E.0164
G1 X213.356 Y108.935 E.32262
G1 X212.822 Y108.935 E.0164
G1 X205.935 Y115.822 E.29943
G1 X205.935 Y115.289 E.0164
G1 X212.289 Y108.935 E.27623
G1 X211.755 Y108.935 E.0164
G1 X205.935 Y114.755 E.25303
G1 X205.935 Y114.222 E.0164
G1 X211.222 Y108.935 E.22984
G1 X210.688 Y108.935 E.0164
G1 X205.935 Y113.688 E.20664
G1 X205.935 Y113.155 E.0164
G1 X210.155 Y108.935 E.18345
G1 X209.621 Y108.935 E.0164
G1 X205.935 Y112.621 E.16025
G1 X205.935 Y112.088 E.0164
G1 X209.088 Y108.935 E.13705
G1 X208.554 Y108.935 E.0164
G1 X205.935 Y111.554 E.11386
G1 X205.935 Y111.021 E.0164
G1 X208.021 Y108.935 E.09066
G1 X207.487 Y108.935 E.0164
G1 X205.935 Y110.487 E.06746
G1 X205.935 Y109.954 E.0164
G1 X206.954 Y108.935 E.04427
G1 X206.42 Y108.935 E.0164
G1 X205.766 Y109.59 E.02845
M106 S221.85
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X206.42 Y108.935 E-.35164
G1 X206.954 Y108.935 E-.20274
G1 X206.571 Y109.318 E-.20562
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/275
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
G3 Z.8 I-.227 J-1.196 P1  F30000
G1 X54.398 Y138.21 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X54.398 Y138.602 E.01301
G1 X205.602 Y138.602 E5.01572
G1 X205.602 Y108.602 E.99516
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y147.398 E1.28693
G1 X45.602 Y147.398 E5.59927
G1 X45.602 Y108.602 E1.28693
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y138.15 E.98016
G1 X54.79 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X205.21 Y138.21 E4.62199
G1 X205.21 Y108.21 E.92182
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y147.79 E1.21618
G1 X45.21 Y147.79 E5.21072
G1 X45.21 Y108.21 E1.21618
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y138.15 E.91997
M204 S10000
G1 X54.599 Y138.766 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420188
G1 F15000
G1 X62.898 Y147.065 E.36081
G1 X63.432 Y147.065 E.0164
G1 X55.303 Y138.935 E.35343
G1 X55.836 Y138.935 E.0164
G1 X63.965 Y147.065 E.35343
G1 X64.499 Y147.065 E.0164
G1 X56.37 Y138.935 E.35343
G1 X56.903 Y138.935 E.0164
G1 X65.033 Y147.065 E.35343
G1 X65.566 Y147.065 E.0164
G1 X57.437 Y138.935 E.35343
G1 X57.97 Y138.935 E.0164
G1 X66.1 Y147.065 E.35343
G1 X66.633 Y147.065 E.0164
G1 X58.504 Y138.935 E.35343
G1 X59.037 Y138.935 E.0164
G1 X67.167 Y147.065 E.35343
G1 X67.7 Y147.065 E.0164
G1 X59.571 Y138.935 E.35343
G1 X60.104 Y138.935 E.0164
G1 X68.234 Y147.065 E.35343
G1 X68.767 Y147.065 E.0164
G1 X60.638 Y138.935 E.35343
G1 X61.172 Y138.935 E.0164
G1 X69.301 Y147.065 E.35343
G1 X69.834 Y147.065 E.0164
G1 X61.705 Y138.935 E.35343
G1 X62.239 Y138.935 E.0164
G1 X70.368 Y147.065 E.35343
G1 X70.901 Y147.065 E.0164
G1 X62.772 Y138.935 E.35343
G1 X63.306 Y138.935 E.0164
G1 X71.435 Y147.065 E.35343
G1 X71.969 Y147.065 E.0164
G1 X63.839 Y138.935 E.35343
G1 X64.373 Y138.935 E.0164
G1 X72.502 Y147.065 E.35343
G1 X73.036 Y147.065 E.0164
G1 X64.906 Y138.935 E.35343
G1 X65.44 Y138.935 E.0164
G1 X73.569 Y147.065 E.35343
G1 X74.103 Y147.065 E.0164
G1 X65.973 Y138.935 E.35343
G1 X66.507 Y138.935 E.0164
G1 X74.636 Y147.065 E.35343
G1 X75.17 Y147.065 E.0164
G1 X67.04 Y138.935 E.35343
M73 P20 R44
G1 X67.574 Y138.935 E.0164
G1 X75.703 Y147.065 E.35343
G1 X76.237 Y147.065 E.0164
G1 X68.108 Y138.935 E.35343
G1 X68.641 Y138.935 E.0164
G1 X76.77 Y147.065 E.35343
G1 X77.304 Y147.065 E.0164
G1 X69.175 Y138.935 E.35343
G1 X69.708 Y138.935 E.0164
G1 X77.837 Y147.065 E.35343
G1 X78.371 Y147.065 E.0164
G1 X70.242 Y138.935 E.35343
G1 X70.775 Y138.935 E.0164
G1 X78.905 Y147.065 E.35343
G1 X79.438 Y147.065 E.0164
G1 X71.309 Y138.935 E.35343
G1 X71.842 Y138.935 E.0164
G1 X79.972 Y147.065 E.35343
G1 X80.505 Y147.065 E.0164
G1 X72.376 Y138.935 E.35343
G1 X72.909 Y138.935 E.0164
G1 X81.039 Y147.065 E.35343
G1 X81.572 Y147.065 E.0164
G1 X73.443 Y138.935 E.35343
G1 X73.976 Y138.935 E.0164
G1 X82.106 Y147.065 E.35343
G1 X82.639 Y147.065 E.0164
G1 X74.51 Y138.935 E.35343
G1 X75.044 Y138.935 E.0164
G1 X83.173 Y147.065 E.35343
G1 X83.706 Y147.065 E.0164
G1 X75.577 Y138.935 E.35343
G1 X76.111 Y138.935 E.0164
G1 X84.24 Y147.065 E.35343
G1 X84.773 Y147.065 E.0164
G1 X76.644 Y138.935 E.35343
G1 X77.178 Y138.935 E.0164
G1 X85.307 Y147.065 E.35343
G1 X85.841 Y147.065 E.0164
G1 X77.711 Y138.935 E.35343
G1 X78.245 Y138.935 E.0164
G1 X86.374 Y147.065 E.35343
G1 X86.908 Y147.065 E.0164
G1 X78.778 Y138.935 E.35343
G1 X79.312 Y138.935 E.0164
G1 X87.441 Y147.065 E.35343
G1 X87.975 Y147.065 E.0164
G1 X79.845 Y138.935 E.35343
G1 X80.379 Y138.935 E.0164
G1 X88.508 Y147.065 E.35343
G1 X89.042 Y147.065 E.0164
G1 X80.912 Y138.935 E.35343
G1 X81.446 Y138.935 E.0164
G1 X89.575 Y147.065 E.35343
G1 X90.109 Y147.065 E.0164
G1 X81.979 Y138.935 E.35343
G1 X82.513 Y138.935 E.0164
G1 X90.642 Y147.065 E.35343
G1 X91.176 Y147.065 E.0164
G1 X83.047 Y138.935 E.35343
G1 X83.58 Y138.935 E.0164
G1 X91.709 Y147.065 E.35343
G1 X92.243 Y147.065 E.0164
G1 X84.114 Y138.935 E.35343
G1 X84.647 Y138.935 E.0164
G1 X92.776 Y147.065 E.35343
G1 X93.31 Y147.065 E.0164
G1 X85.181 Y138.935 E.35343
G1 X85.714 Y138.935 E.0164
G1 X93.844 Y147.065 E.35343
G1 X94.377 Y147.065 E.0164
G1 X86.248 Y138.935 E.35343
G1 X86.781 Y138.935 E.0164
G1 X94.911 Y147.065 E.35343
G1 X95.444 Y147.065 E.0164
G1 X87.315 Y138.935 E.35343
G1 X87.848 Y138.935 E.0164
G1 X95.978 Y147.065 E.35343
G1 X96.511 Y147.065 E.0164
G1 X88.382 Y138.935 E.35343
G1 X88.915 Y138.935 E.0164
G1 X97.045 Y147.065 E.35343
G1 X97.578 Y147.065 E.0164
G1 X89.449 Y138.935 E.35343
G1 X89.983 Y138.935 E.0164
G1 X98.112 Y147.065 E.35343
G1 X98.645 Y147.065 E.0164
G1 X90.516 Y138.935 E.35343
G1 X91.05 Y138.935 E.0164
G1 X99.179 Y147.065 E.35343
G1 X99.712 Y147.065 E.0164
G1 X91.583 Y138.935 E.35343
G1 X92.117 Y138.935 E.0164
G1 X100.246 Y147.065 E.35343
G1 X100.78 Y147.065 E.0164
G1 X92.65 Y138.935 E.35343
G1 X93.184 Y138.935 E.0164
G1 X101.313 Y147.065 E.35343
G1 X101.847 Y147.065 E.0164
G1 X93.717 Y138.935 E.35343
G1 X94.251 Y138.935 E.0164
G1 X102.38 Y147.065 E.35343
G1 X102.914 Y147.065 E.0164
G1 X94.784 Y138.935 E.35343
G1 X95.318 Y138.935 E.0164
G1 X103.447 Y147.065 E.35343
G1 X103.981 Y147.065 E.0164
G1 X95.851 Y138.935 E.35343
G1 X96.385 Y138.935 E.0164
G1 X104.514 Y147.065 E.35343
G1 X105.048 Y147.065 E.0164
G1 X96.919 Y138.935 E.35343
G1 X97.452 Y138.935 E.0164
G1 X105.581 Y147.065 E.35343
G1 X106.115 Y147.065 E.0164
G1 X97.986 Y138.935 E.35343
G1 X98.519 Y138.935 E.0164
G1 X106.648 Y147.065 E.35343
G1 X107.182 Y147.065 E.0164
G1 X99.053 Y138.935 E.35343
G1 X99.586 Y138.935 E.0164
G1 X107.716 Y147.065 E.35343
G1 X108.249 Y147.065 E.0164
G1 X100.12 Y138.935 E.35343
G1 X100.653 Y138.935 E.0164
G1 X108.783 Y147.065 E.35343
G1 X109.316 Y147.065 E.0164
G1 X101.187 Y138.935 E.35343
G1 X101.72 Y138.935 E.0164
G1 X109.85 Y147.065 E.35343
G1 X110.383 Y147.065 E.0164
G1 X102.254 Y138.935 E.35343
G1 X102.787 Y138.935 E.0164
G1 X110.917 Y147.065 E.35343
G1 X111.45 Y147.065 E.0164
G1 X103.321 Y138.935 E.35343
G1 X103.855 Y138.935 E.0164
G1 X111.984 Y147.065 E.35343
G1 X112.517 Y147.065 E.0164
G1 X104.388 Y138.935 E.35343
G1 X104.922 Y138.935 E.0164
G1 X113.051 Y147.065 E.35343
G1 X113.584 Y147.065 E.0164
G1 X105.455 Y138.935 E.35343
G1 X105.989 Y138.935 E.0164
G1 X114.118 Y147.065 E.35343
G1 X114.652 Y147.065 E.0164
G1 X106.522 Y138.935 E.35343
G1 X107.056 Y138.935 E.0164
G1 X115.185 Y147.065 E.35343
G1 X115.719 Y147.065 E.0164
G1 X107.589 Y138.935 E.35343
G1 X108.123 Y138.935 E.0164
G1 X116.252 Y147.065 E.35343
G1 X116.786 Y147.065 E.0164
G1 X108.656 Y138.935 E.35343
G1 X109.19 Y138.935 E.0164
G1 X117.319 Y147.065 E.35343
G1 X117.853 Y147.065 E.0164
G1 X109.723 Y138.935 E.35343
G1 X110.257 Y138.935 E.0164
G1 X118.386 Y147.065 E.35343
G1 X118.92 Y147.065 E.0164
G1 X110.791 Y138.935 E.35343
G1 X111.324 Y138.935 E.0164
G1 X119.453 Y147.065 E.35343
G1 X119.987 Y147.065 E.0164
G1 X111.858 Y138.935 E.35343
G1 X112.391 Y138.935 E.0164
G1 X120.52 Y147.065 E.35343
G1 X121.054 Y147.065 E.0164
G1 X112.925 Y138.935 E.35343
G1 X113.458 Y138.935 E.0164
G1 X121.588 Y147.065 E.35343
G1 X122.121 Y147.065 E.0164
G1 X113.992 Y138.935 E.35343
G1 X114.525 Y138.935 E.0164
G1 X122.655 Y147.065 E.35343
G1 X123.188 Y147.065 E.0164
G1 X115.059 Y138.935 E.35343
G1 X115.592 Y138.935 E.0164
G1 X123.722 Y147.065 E.35343
G1 X124.255 Y147.065 E.0164
G1 X116.126 Y138.935 E.35343
G1 X116.659 Y138.935 E.0164
G1 X124.789 Y147.065 E.35343
G1 X125.322 Y147.065 E.0164
G1 X117.193 Y138.935 E.35343
G1 X117.727 Y138.935 E.0164
G1 X125.856 Y147.065 E.35343
G1 X126.389 Y147.065 E.0164
G1 X118.26 Y138.935 E.35343
G1 X118.794 Y138.935 E.0164
G1 X126.923 Y147.065 E.35343
G1 X127.456 Y147.065 E.0164
G1 X119.327 Y138.935 E.35343
G1 X119.861 Y138.935 E.0164
G1 X127.99 Y147.065 E.35343
G1 X128.524 Y147.065 E.0164
G1 X120.394 Y138.935 E.35343
G1 X120.928 Y138.935 E.0164
G1 X129.057 Y147.065 E.35343
G1 X129.591 Y147.065 E.0164
G1 X121.461 Y138.935 E.35343
G1 X121.995 Y138.935 E.0164
G1 X130.124 Y147.065 E.35343
G1 X130.658 Y147.065 E.0164
G1 X122.528 Y138.935 E.35343
G1 X123.062 Y138.935 E.0164
G1 X131.191 Y147.065 E.35343
G1 X131.725 Y147.065 E.0164
G1 X123.595 Y138.935 E.35343
G1 X124.129 Y138.935 E.0164
G1 X132.258 Y147.065 E.35343
G1 X132.792 Y147.065 E.0164
G1 X124.662 Y138.935 E.35343
G1 X125.196 Y138.935 E.0164
G1 X133.325 Y147.065 E.35343
G1 X133.859 Y147.065 E.0164
G1 X125.73 Y138.935 E.35343
G1 X126.263 Y138.935 E.0164
G1 X134.392 Y147.065 E.35343
G1 X134.926 Y147.065 E.0164
G1 X126.797 Y138.935 E.35343
G1 X127.33 Y138.935 E.0164
G1 X135.459 Y147.065 E.35343
G1 X135.993 Y147.065 E.0164
G1 X127.864 Y138.935 E.35343
G1 X128.397 Y138.935 E.0164
G1 X136.527 Y147.065 E.35343
G1 X137.06 Y147.065 E.0164
G1 X128.931 Y138.935 E.35343
G1 X129.464 Y138.935 E.0164
G1 X137.594 Y147.065 E.35343
G1 X138.127 Y147.065 E.0164
G1 X129.998 Y138.935 E.35343
G1 X130.531 Y138.935 E.0164
G1 X138.661 Y147.065 E.35343
G1 X139.194 Y147.065 E.0164
G1 X131.065 Y138.935 E.35343
G1 X131.598 Y138.935 E.0164
G1 X139.728 Y147.065 E.35343
G1 X140.261 Y147.065 E.0164
G1 X132.132 Y138.935 E.35343
G1 X132.666 Y138.935 E.0164
G1 X140.795 Y147.065 E.35343
G1 X141.328 Y147.065 E.0164
G1 X133.199 Y138.935 E.35343
G1 X133.733 Y138.935 E.0164
G1 X141.862 Y147.065 E.35343
G1 X142.395 Y147.065 E.0164
G1 X134.266 Y138.935 E.35343
G1 X134.8 Y138.935 E.0164
G1 X142.929 Y147.065 E.35343
G1 X143.463 Y147.065 E.0164
G1 X135.333 Y138.935 E.35343
G1 X135.867 Y138.935 E.0164
G1 X143.996 Y147.065 E.35343
G1 X144.53 Y147.065 E.0164
G1 X136.4 Y138.935 E.35343
G1 X136.934 Y138.935 E.0164
G1 X145.063 Y147.065 E.35343
G1 X145.597 Y147.065 E.0164
G1 X137.467 Y138.935 E.35343
G1 X138.001 Y138.935 E.0164
G1 X146.13 Y147.065 E.35343
G1 X146.664 Y147.065 E.0164
G1 X138.534 Y138.935 E.35343
G1 X139.068 Y138.935 E.0164
G1 X147.197 Y147.065 E.35343
G1 X147.731 Y147.065 E.0164
G1 X139.602 Y138.935 E.35343
G1 X140.135 Y138.935 E.0164
G1 X148.264 Y147.065 E.35343
G1 X148.798 Y147.065 E.0164
G1 X140.669 Y138.935 E.35343
G1 X141.202 Y138.935 E.0164
G1 X149.331 Y147.065 E.35343
G1 X149.865 Y147.065 E.0164
G1 X141.736 Y138.935 E.35343
G1 X142.269 Y138.935 E.0164
G1 X150.399 Y147.065 E.35343
G1 X150.932 Y147.065 E.0164
G1 X142.803 Y138.935 E.35343
G1 X143.336 Y138.935 E.0164
G1 X151.466 Y147.065 E.35343
G1 X151.999 Y147.065 E.0164
G1 X143.87 Y138.935 E.35343
G1 X144.403 Y138.935 E.0164
G1 X152.533 Y147.065 E.35343
G1 X153.066 Y147.065 E.0164
G1 X144.937 Y138.935 E.35343
G1 X145.47 Y138.935 E.0164
G1 X153.6 Y147.065 E.35343
G1 X154.133 Y147.065 E.0164
G1 X146.004 Y138.935 E.35343
G1 X146.538 Y138.935 E.0164
G1 X154.667 Y147.065 E.35343
G1 X155.2 Y147.065 E.0164
G1 X147.071 Y138.935 E.35343
G1 X147.605 Y138.935 E.0164
G1 X155.734 Y147.065 E.35343
G1 X156.267 Y147.065 E.0164
G1 X148.138 Y138.935 E.35343
G1 X148.672 Y138.935 E.0164
G1 X156.801 Y147.065 E.35343
G1 X157.335 Y147.065 E.0164
G1 X149.205 Y138.935 E.35343
G1 X149.739 Y138.935 E.0164
G1 X157.868 Y147.065 E.35343
G1 X158.402 Y147.065 E.0164
G1 X150.272 Y138.935 E.35343
G1 X150.806 Y138.935 E.0164
G1 X158.935 Y147.065 E.35343
G1 X159.469 Y147.065 E.0164
G1 X151.339 Y138.935 E.35343
G1 X151.873 Y138.935 E.0164
G1 X160.002 Y147.065 E.35343
G1 X160.536 Y147.065 E.0164
G1 X152.406 Y138.935 E.35343
G1 X152.94 Y138.935 E.0164
G1 X161.069 Y147.065 E.35343
G1 X161.603 Y147.065 E.0164
G1 X153.474 Y138.935 E.35343
G1 X154.007 Y138.935 E.0164
G1 X162.136 Y147.065 E.35343
G1 X162.67 Y147.065 E.0164
G1 X154.541 Y138.935 E.35343
G1 X155.074 Y138.935 E.0164
G1 X163.203 Y147.065 E.35343
G1 X163.737 Y147.065 E.0164
G1 X155.608 Y138.935 E.35343
G1 X156.141 Y138.935 E.0164
G1 X164.271 Y147.065 E.35343
G1 X164.804 Y147.065 E.0164
G1 X156.675 Y138.935 E.35343
G1 X157.208 Y138.935 E.0164
G1 X165.338 Y147.065 E.35343
G1 X165.871 Y147.065 E.0164
G1 X157.742 Y138.935 E.35343
G1 X158.275 Y138.935 E.0164
G1 X166.405 Y147.065 E.35343
G1 X166.938 Y147.065 E.0164
G1 X158.809 Y138.935 E.35343
G1 X159.342 Y138.935 E.0164
G1 X167.472 Y147.065 E.35343
G1 X168.005 Y147.065 E.0164
G1 X159.876 Y138.935 E.35343
G1 X160.41 Y138.935 E.0164
G1 X168.539 Y147.065 E.35343
G1 X169.072 Y147.065 E.0164
G1 X160.943 Y138.935 E.35343
G1 X161.477 Y138.935 E.0164
G1 X169.606 Y147.065 E.35343
G1 X170.139 Y147.065 E.0164
G1 X162.01 Y138.935 E.35343
G1 X162.544 Y138.935 E.0164
G1 X170.673 Y147.065 E.35343
G1 X171.207 Y147.065 E.0164
G1 X163.077 Y138.935 E.35343
G1 X163.611 Y138.935 E.0164
G1 X171.74 Y147.065 E.35343
G1 X172.274 Y147.065 E.0164
G1 X164.144 Y138.935 E.35343
G1 X164.678 Y138.935 E.0164
G1 X172.807 Y147.065 E.35343
G1 X173.341 Y147.065 E.0164
G1 X165.211 Y138.935 E.35343
G1 X165.745 Y138.935 E.0164
G1 X173.874 Y147.065 E.35343
G1 X174.408 Y147.065 E.0164
G1 X166.278 Y138.935 E.35343
G1 X166.812 Y138.935 E.0164
G1 X174.941 Y147.065 E.35343
G1 X175.475 Y147.065 E.0164
G1 X167.345 Y138.935 E.35343
G1 X167.879 Y138.935 E.0164
G1 X176.008 Y147.065 E.35343
G1 X176.542 Y147.065 E.0164
G1 X168.413 Y138.935 E.35343
G1 X168.946 Y138.935 E.0164
G1 X177.075 Y147.065 E.35343
G1 X177.609 Y147.065 E.0164
G1 X169.48 Y138.935 E.35343
G1 X170.013 Y138.935 E.0164
G1 X178.142 Y147.065 E.35343
G1 X178.676 Y147.065 E.0164
G1 X170.547 Y138.935 E.35343
G1 X171.08 Y138.935 E.0164
G1 X179.21 Y147.065 E.35343
G1 X179.743 Y147.065 E.0164
G1 X171.614 Y138.935 E.35343
G1 X172.147 Y138.935 E.0164
G1 X180.277 Y147.065 E.35343
G1 X180.81 Y147.065 E.0164
G1 X172.681 Y138.935 E.35343
G1 X173.214 Y138.935 E.0164
G1 X181.344 Y147.065 E.35343
G1 X181.877 Y147.065 E.0164
G1 X173.748 Y138.935 E.35343
G1 X174.281 Y138.935 E.0164
G1 X182.411 Y147.065 E.35343
G1 X182.944 Y147.065 E.0164
G1 X174.815 Y138.935 E.35343
G1 X175.349 Y138.935 E.0164
G1 X183.478 Y147.065 E.35343
G1 X184.011 Y147.065 E.0164
G1 X175.882 Y138.935 E.35343
G1 X176.416 Y138.935 E.0164
G1 X184.545 Y147.065 E.35343
G1 X185.078 Y147.065 E.0164
G1 X176.949 Y138.935 E.35343
G1 X177.483 Y138.935 E.0164
G1 X185.612 Y147.065 E.35343
G1 X186.146 Y147.065 E.0164
G1 X178.016 Y138.935 E.35343
G1 X178.55 Y138.935 E.0164
G1 X186.679 Y147.065 E.35343
G1 X187.213 Y147.065 E.0164
G1 X179.083 Y138.935 E.35343
G1 X179.617 Y138.935 E.0164
G1 X187.746 Y147.065 E.35343
G1 X188.28 Y147.065 E.0164
G1 X180.15 Y138.935 E.35343
G1 X180.684 Y138.935 E.0164
G1 X188.813 Y147.065 E.35343
G1 X189.347 Y147.065 E.0164
G1 X181.217 Y138.935 E.35343
G1 X181.751 Y138.935 E.0164
G1 X189.88 Y147.065 E.35343
G1 X190.414 Y147.065 E.0164
G1 X182.285 Y138.935 E.35343
G1 X182.818 Y138.935 E.0164
G1 X190.947 Y147.065 E.35343
G1 X191.481 Y147.065 E.0164
G1 X183.352 Y138.935 E.35343
G1 X183.885 Y138.935 E.0164
G1 X192.014 Y147.065 E.35343
G1 X192.548 Y147.065 E.0164
G1 X184.419 Y138.935 E.35343
G1 X184.952 Y138.935 E.0164
G1 X193.082 Y147.065 E.35343
G1 X193.615 Y147.065 E.0164
G1 X185.486 Y138.935 E.35343
G1 X186.019 Y138.935 E.0164
G1 X194.149 Y147.065 E.35343
G1 X194.682 Y147.065 E.0164
G1 X186.553 Y138.935 E.35343
G1 X187.086 Y138.935 E.0164
G1 X195.216 Y147.065 E.35343
G1 X195.749 Y147.065 E.0164
G1 X187.62 Y138.935 E.35343
G1 X188.153 Y138.935 E.0164
G1 X196.283 Y147.065 E.35343
G1 X196.816 Y147.065 E.0164
G1 X188.687 Y138.935 E.35343
G1 X189.221 Y138.935 E.0164
G1 X197.35 Y147.065 E.35343
G1 X197.883 Y147.065 E.0164
G1 X189.754 Y138.935 E.35343
G1 X190.288 Y138.935 E.0164
G1 X198.417 Y147.065 E.35343
G1 X198.95 Y147.065 E.0164
G1 X190.821 Y138.935 E.35343
G1 X191.355 Y138.935 E.0164
G1 X199.484 Y147.065 E.35343
G1 X200.018 Y147.065 E.0164
G1 X191.888 Y138.935 E.35343
G1 X192.422 Y138.935 E.0164
G1 X200.551 Y147.065 E.35343
G1 X201.085 Y147.065 E.0164
G1 X192.955 Y138.935 E.35343
G1 X193.489 Y138.935 E.0164
G1 X201.618 Y147.065 E.35343
G1 X202.152 Y147.065 E.0164
G1 X194.022 Y138.935 E.35343
G1 X194.556 Y138.935 E.0164
G1 X202.685 Y147.065 E.35343
G1 X203.219 Y147.065 E.0164
G1 X195.089 Y138.935 E.35343
G1 X195.623 Y138.935 E.0164
G1 X203.752 Y147.065 E.35343
G1 X204.286 Y147.065 E.0164
G1 X196.157 Y138.935 E.35343
G1 X196.69 Y138.935 E.0164
G1 X204.819 Y147.065 E.35343
G1 X205.353 Y147.065 E.0164
G1 X197.224 Y138.935 E.35343
G1 X197.757 Y138.935 E.0164
G1 X205.886 Y147.065 E.35343
G1 X206.42 Y147.065 E.0164
G1 X198.291 Y138.935 E.35343
G1 X198.824 Y138.935 E.0164
G1 X206.954 Y147.065 E.35343
G1 X207.487 Y147.065 E.0164
G1 X199.358 Y138.935 E.35343
G1 X199.891 Y138.935 E.0164
G1 X208.021 Y147.065 E.35343
G1 X208.554 Y147.065 E.0164
G1 X200.425 Y138.935 E.35343
G1 X200.958 Y138.935 E.0164
G1 X209.088 Y147.065 E.35343
G1 X209.621 Y147.065 E.0164
G1 X201.492 Y138.935 E.35343
G1 X202.025 Y138.935 E.0164
G1 X210.155 Y147.065 E.35343
G1 X210.688 Y147.065 E.0164
G1 X202.559 Y138.935 E.35343
G1 X203.093 Y138.935 E.0164
G1 X211.222 Y147.065 E.35343
G1 X211.755 Y147.065 E.0164
G1 X203.626 Y138.935 E.35343
G1 X204.16 Y138.935 E.0164
G1 X212.289 Y147.065 E.35343
G1 X212.822 Y147.065 E.0164
G1 X204.693 Y138.935 E.35343
G1 X205.227 Y138.935 E.0164
G1 X213.356 Y147.065 E.35343
G1 X213.89 Y147.065 E.0164
G1 X205.76 Y138.935 E.35343
G1 X205.935 Y138.935 E.00538
G1 X205.935 Y138.577 E.01102
G1 X214.065 Y146.706 E.35343
G1 X214.065 Y146.173 E.0164
G1 X205.935 Y138.043 E.35343
G1 X205.935 Y137.51 E.0164
G1 X214.065 Y145.639 E.35343
G1 X214.065 Y145.106 E.0164
G1 X205.935 Y136.976 E.35343
G1 X205.935 Y136.443 E.0164
G1 X214.065 Y144.572 E.35343
G1 X214.065 Y144.039 E.0164
G1 X205.935 Y135.909 E.35343
G1 X205.935 Y135.376 E.0164
G1 X214.065 Y143.505 E.35343
G1 X214.065 Y142.972 E.0164
G1 X205.935 Y134.842 E.35343
G1 X205.935 Y134.309 E.0164
G1 X214.065 Y142.438 E.35343
G1 X214.065 Y141.904 E.0164
G1 X205.935 Y133.775 E.35343
G1 X205.935 Y133.242 E.0164
G1 X214.065 Y141.371 E.35343
G1 X214.065 Y140.837 E.0164
G1 X205.935 Y132.708 E.35343
G1 X205.935 Y132.175 E.0164
G1 X214.065 Y140.304 E.35343
G1 X214.065 Y139.77 E.0164
G1 X205.935 Y131.641 E.35343
G1 X205.935 Y131.107 E.0164
G1 X214.065 Y139.237 E.35343
G1 X214.065 Y138.703 E.0164
G1 X205.935 Y130.574 E.35343
G1 X205.935 Y130.04 E.0164
G1 X214.065 Y138.17 E.35343
G1 X214.065 Y137.636 E.0164
G1 X205.935 Y129.507 E.35343
G1 X205.935 Y128.973 E.0164
G1 X214.065 Y137.103 E.35343
G1 X214.065 Y136.569 E.0164
G1 X205.935 Y128.44 E.35343
G1 X205.935 Y127.906 E.0164
G1 X214.065 Y136.036 E.35343
G1 X214.065 Y135.502 E.0164
G1 X205.935 Y127.373 E.35343
G1 X205.935 Y126.839 E.0164
G1 X214.065 Y134.968 E.35343
G1 X214.065 Y134.435 E.0164
G1 X205.935 Y126.306 E.35343
G1 X205.935 Y125.772 E.0164
G1 X214.065 Y133.901 E.35343
G1 X214.065 Y133.368 E.0164
G1 X205.935 Y125.239 E.35343
G1 X205.935 Y124.705 E.0164
G1 X214.065 Y132.834 E.35343
G1 X214.065 Y132.301 E.0164
G1 X205.935 Y124.171 E.35343
G1 X205.935 Y123.638 E.0164
G1 X214.065 Y131.767 E.35343
G1 X214.065 Y131.234 E.0164
G1 X205.935 Y123.104 E.35343
G1 X205.935 Y122.571 E.0164
G1 X214.065 Y130.7 E.35343
G1 X214.065 Y130.167 E.0164
G1 X205.935 Y122.037 E.35343
G1 X205.935 Y121.504 E.0164
G1 X214.065 Y129.633 E.35343
G1 X214.065 Y129.1 E.0164
G1 X205.935 Y120.97 E.35343
G1 X205.935 Y120.437 E.0164
G1 X214.065 Y128.566 E.35343
G1 X214.065 Y128.032 E.0164
G1 X205.935 Y119.903 E.35343
G1 X205.935 Y119.37 E.0164
G1 X214.065 Y127.499 E.35343
G1 X214.065 Y126.965 E.0164
G1 X205.935 Y118.836 E.35343
G1 X205.935 Y118.303 E.0164
G1 X214.065 Y126.432 E.35343
G1 X214.065 Y125.898 E.0164
G1 X205.935 Y117.769 E.35343
G1 X205.935 Y117.235 E.0164
G1 X214.065 Y125.365 E.35343
G1 X214.065 Y124.831 E.0164
G1 X205.935 Y116.702 E.35343
G1 X205.935 Y116.168 E.0164
G1 X214.065 Y124.298 E.35343
G1 X214.065 Y123.764 E.0164
G1 X205.935 Y115.635 E.35343
G1 X205.935 Y115.101 E.0164
G1 X214.065 Y123.231 E.35343
G1 X214.065 Y122.697 E.0164
G1 X205.935 Y114.568 E.35343
G1 X205.935 Y114.034 E.0164
G1 X214.065 Y122.164 E.35343
G1 X214.065 Y121.63 E.0164
G1 X205.935 Y113.501 E.35343
G1 X205.935 Y112.967 E.0164
G1 X214.065 Y121.096 E.35343
G1 X214.065 Y120.563 E.0164
G1 X205.935 Y112.434 E.35343
G1 X205.935 Y111.9 E.0164
G1 X214.065 Y120.029 E.35343
G1 X214.065 Y119.496 E.0164
G1 X205.935 Y111.367 E.35343
G1 X205.935 Y110.833 E.0164
G1 X214.065 Y118.962 E.35343
G1 X214.065 Y118.429 E.0164
G1 X205.935 Y110.299 E.35343
G1 X205.935 Y109.766 E.0164
G1 X214.065 Y117.895 E.35343
G1 X214.065 Y117.362 E.0164
G1 X205.935 Y109.232 E.35343
G1 X205.935 Y108.935 E.00913
G1 X206.172 Y108.935 E.00727
G1 X214.065 Y116.828 E.34315
G1 X214.065 Y116.295 E.0164
G1 X206.705 Y108.935 E.31996
G1 X207.239 Y108.935 E.0164
G1 X214.065 Y115.761 E.29676
G1 X214.065 Y115.228 E.0164
G1 X207.772 Y108.935 E.27356
G1 X208.306 Y108.935 E.0164
G1 X214.065 Y114.694 E.25037
G1 X214.065 Y114.16 E.0164
G1 X208.84 Y108.935 E.22717
G1 X209.373 Y108.935 E.0164
G1 X214.065 Y113.627 E.20397
G1 X214.065 Y113.093 E.0164
G1 X209.907 Y108.935 E.18078
G1 X210.44 Y108.935 E.0164
G1 X214.065 Y112.56 E.15758
G1 X214.065 Y112.026 E.0164
G1 X210.974 Y108.935 E.13439
G1 X211.507 Y108.935 E.0164
G1 X214.065 Y111.493 E.11119
G1 X214.065 Y110.959 E.0164
G1 X212.041 Y108.935 E.08799
G1 X212.574 Y108.935 E.0164
G1 X214.065 Y110.426 E.0648
G1 X214.065 Y109.892 E.0164
G1 X213.108 Y108.935 E.0416
G1 X213.641 Y108.935 E.0164
G1 X214.234 Y109.528 E.02578
; WIPE_START
G1 F24000
G1 X213.641 Y108.935 E-.31867
G1 X213.108 Y108.935 E-.20274
G1 X213.552 Y109.379 E-.23858
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.002 J-1.217 P1  F30000
G1 X54.234 Y109.59 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X53.58 Y108.935 E.02844
G1 X53.047 Y108.935 E.0164
G1 X54.065 Y109.953 E.04426
G1 X54.065 Y110.487 E.0164
G1 X52.513 Y108.935 E.06746
G1 X51.979 Y108.935 E.0164
G1 X54.065 Y111.021 E.09066
G1 X54.065 Y111.554 E.0164
G1 X51.446 Y108.935 E.11385
G1 X50.912 Y108.935 E.0164
G1 X54.065 Y112.088 E.13705
G1 X54.065 Y112.621 E.0164
G1 X50.379 Y108.935 E.16024
G1 X49.845 Y108.935 E.0164
G1 X54.065 Y113.155 E.18344
G1 X54.065 Y113.688 E.0164
G1 X49.312 Y108.935 E.20664
G1 X48.778 Y108.935 E.0164
G1 X54.065 Y114.222 E.22983
G1 X54.065 Y114.755 E.0164
G1 X48.245 Y108.935 E.25303
G1 X47.711 Y108.935 E.0164
G1 X54.065 Y115.289 E.27623
G1 X54.065 Y115.822 E.0164
G1 X47.178 Y108.935 E.29942
G1 X46.644 Y108.935 E.0164
G1 X54.065 Y116.356 E.32262
G1 X54.065 Y116.889 E.0164
G1 X46.111 Y108.935 E.34582
G1 X45.935 Y108.935 E.00539
G1 X45.935 Y109.294 E.01102
G1 X54.065 Y117.423 E.35343
G1 X54.065 Y117.956 E.0164
G1 X45.935 Y109.827 E.35343
G1 X45.935 Y110.361 E.0164
G1 X54.065 Y118.49 E.35343
G1 X54.065 Y119.024 E.0164
G1 X45.935 Y110.894 E.35343
G1 X45.935 Y111.428 E.0164
G1 X54.065 Y119.557 E.35343
G1 X54.065 Y120.091 E.0164
G1 X45.935 Y111.961 E.35343
G1 X45.935 Y112.495 E.0164
G1 X54.065 Y120.624 E.35343
G1 X54.065 Y121.158 E.0164
G1 X45.935 Y113.028 E.35343
G1 X45.935 Y113.562 E.0164
G1 X54.065 Y121.691 E.35343
G1 X54.065 Y122.225 E.0164
G1 X45.935 Y114.095 E.35343
G1 X45.935 Y114.629 E.0164
G1 X54.065 Y122.758 E.35343
G1 X54.065 Y123.292 E.0164
G1 X45.935 Y115.163 E.35343
G1 X45.935 Y115.696 E.0164
G1 X54.065 Y123.825 E.35343
G1 X54.065 Y124.359 E.0164
G1 X45.935 Y116.23 E.35343
G1 X45.935 Y116.763 E.0164
G1 X54.065 Y124.892 E.35343
G1 X54.065 Y125.426 E.0164
G1 X45.935 Y117.297 E.35343
G1 X45.935 Y117.83 E.0164
G1 X54.065 Y125.96 E.35343
G1 X54.065 Y126.493 E.0164
G1 X45.935 Y118.364 E.35343
G1 X45.935 Y118.897 E.0164
G1 X54.065 Y127.027 E.35343
G1 X54.065 Y127.56 E.0164
G1 X45.935 Y119.431 E.35343
G1 X45.935 Y119.964 E.0164
G1 X54.065 Y128.094 E.35343
G1 X54.065 Y128.627 E.0164
G1 X45.935 Y120.498 E.35343
G1 X45.935 Y121.031 E.0164
G1 X54.065 Y129.161 E.35343
G1 X54.065 Y129.694 E.0164
G1 X45.935 Y121.565 E.35343
G1 X45.935 Y122.099 E.0164
G1 X54.065 Y130.228 E.35343
G1 X54.065 Y130.761 E.0164
G1 X45.935 Y122.632 E.35343
G1 X45.935 Y123.166 E.0164
G1 X54.065 Y131.295 E.35343
G1 X54.065 Y131.828 E.0164
G1 X45.935 Y123.699 E.35343
G1 X45.935 Y124.233 E.0164
G1 X54.065 Y132.362 E.35343
G1 X54.065 Y132.896 E.0164
G1 X45.935 Y124.766 E.35343
G1 X45.935 Y125.3 E.0164
G1 X54.065 Y133.429 E.35343
G1 X54.065 Y133.963 E.0164
G1 X45.935 Y125.833 E.35343
G1 X45.935 Y126.367 E.0164
G1 X54.065 Y134.496 E.35343
G1 X54.065 Y135.03 E.0164
G1 X45.935 Y126.9 E.35343
G1 X45.935 Y127.434 E.0164
G1 X54.065 Y135.563 E.35343
G1 X54.065 Y136.097 E.0164
G1 X45.935 Y127.967 E.35343
G1 X45.935 Y128.501 E.0164
G1 X54.065 Y136.63 E.35343
G1 X54.065 Y137.164 E.0164
G1 X45.935 Y129.035 E.35343
G1 X45.935 Y129.568 E.0164
G1 X54.065 Y137.697 E.35343
G1 X54.065 Y138.231 E.0164
G1 X45.935 Y130.102 E.35343
G1 X45.935 Y130.635 E.0164
G1 X62.365 Y147.065 E.7143
G1 X61.831 Y147.065 E.0164
G1 X45.935 Y131.169 E.6911
G1 X45.935 Y131.702 E.0164
G1 X61.298 Y147.065 E.66791
G1 X60.764 Y147.065 E.0164
G1 X45.935 Y132.236 E.64471
G1 X45.935 Y132.769 E.0164
G1 X60.231 Y147.065 E.62151
G1 X59.697 Y147.065 E.0164
G1 X45.935 Y133.303 E.59832
G1 X45.935 Y133.836 E.0164
G1 X59.164 Y147.065 E.57512
G1 X58.63 Y147.065 E.0164
G1 X45.935 Y134.37 E.55192
G1 X45.935 Y134.903 E.0164
G1 X58.097 Y147.065 E.52873
G1 X57.563 Y147.065 E.0164
G1 X45.935 Y135.437 E.50553
G1 X45.935 Y135.971 E.0164
G1 X57.029 Y147.065 E.48233
G1 X56.496 Y147.065 E.0164
G1 X45.935 Y136.504 E.45914
G1 X45.935 Y137.038 E.0164
G1 X55.962 Y147.065 E.43594
G1 X55.429 Y147.065 E.0164
G1 X45.935 Y137.571 E.41275
M73 P21 R44
G1 X45.935 Y138.105 E.0164
G1 X54.895 Y147.065 E.38955
G1 X54.362 Y147.065 E.0164
G1 X45.935 Y138.638 E.36635
G1 X45.935 Y139.172 E.0164
G1 X53.828 Y147.065 E.34316
G1 X53.295 Y147.065 E.0164
G1 X45.935 Y139.705 E.31996
G1 X45.935 Y140.239 E.0164
G1 X52.761 Y147.065 E.29676
G1 X52.228 Y147.065 E.0164
G1 X45.935 Y140.772 E.27357
G1 X45.935 Y141.306 E.0164
G1 X51.694 Y147.065 E.25037
G1 X51.161 Y147.065 E.0164
G1 X45.935 Y141.839 E.22717
G1 X45.935 Y142.373 E.0164
G1 X50.627 Y147.065 E.20398
G1 X50.093 Y147.065 E.0164
G1 X45.935 Y142.907 E.18078
G1 X45.935 Y143.44 E.0164
G1 X49.56 Y147.065 E.15759
G1 X49.026 Y147.065 E.0164
G1 X45.935 Y143.974 E.13439
G1 X45.935 Y144.507 E.0164
G1 X48.493 Y147.065 E.11119
G1 X47.959 Y147.065 E.0164
G1 X45.935 Y145.041 E.088
G1 X45.935 Y145.574 E.0164
G1 X47.426 Y147.065 E.0648
G1 X46.892 Y147.065 E.0164
G1 X45.935 Y146.108 E.0416
G1 X45.935 Y146.641 E.0164
G1 X46.528 Y147.234 E.02578
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X45.935 Y146.641 E-.31872
G1 X45.935 Y146.108 E-.20274
G1 X46.379 Y146.552 E-.23854
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/275
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
G3 Z1 I.877 J.843 P1  F30000
M73 P21 R43
G1 X54.398 Y138.21 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13988
G1 X54.398 Y138.602 E.01301
G1 X205.602 Y138.602 E5.01572
G1 X205.602 Y108.602 E.99516
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y147.398 E1.28693
G1 X45.602 Y147.398 E5.59927
G1 X45.602 Y108.602 E1.28693
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y138.15 E.98016
G1 X54.79 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X205.21 Y138.21 E4.62199
G1 X205.21 Y108.21 E.92182
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y147.79 E1.21618
G1 X45.21 Y147.79 E5.21072
G1 X45.21 Y108.21 E1.21618
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y138.15 E.91997
M204 S10000
; WIPE_START
G1 F24000
G1 X56.79 Y138.151 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.125 J1.211 P1  F30000
G1 X205.95 Y122.762 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F13988
G1 X205.95 Y121.133 E.05401
G1 X214.05 Y113.034 E.37996
G1 X214.05 Y112.262 E.02561
G1 X210.738 Y108.95 E.15536
G1 X210.457 Y108.95 E.0093
G1 X205.95 Y113.457 E.21144
G1 X205.95 Y111.839 E.05369
G1 X214.05 Y119.938 E.37996
G1 X214.05 Y120.71 E.02561
G1 X205.95 Y128.809 E.37996
G1 X205.95 Y127.191 E.05369
G1 X214.05 Y135.29 E.37996
G1 X214.05 Y136.062 E.02561
G1 X203.062 Y147.05 E.51546
G1 X202.781 Y147.05 E.00931
G1 X194.682 Y138.95 E.37996
G1 X195.809 Y138.95 E.03739
G1 X187.71 Y147.05 E.37996
G1 X187.429 Y147.05 E.00931
G1 X179.33 Y138.95 E.37996
G1 X180.457 Y138.95 E.03739
G1 X172.358 Y147.05 E.37996
G1 X172.078 Y147.05 E.00931
G1 X163.978 Y138.95 E.37996
G1 X165.105 Y138.95 E.03739
G1 X157.006 Y147.05 E.37996
G1 X156.726 Y147.05 E.00931
G1 X148.626 Y138.95 E.37996
G1 X149.754 Y138.95 E.03739
G1 X141.654 Y147.05 E.37996
G1 X141.374 Y147.05 E.00931
G1 X133.274 Y138.95 E.37996
G1 X134.402 Y138.95 E.03739
G1 X126.302 Y147.05 E.37996
G1 X126.022 Y147.05 E.00931
G1 X117.922 Y138.95 E.37996
G1 X119.05 Y138.95 E.03739
G1 X110.95 Y147.05 E.37996
G1 X110.67 Y147.05 E.00931
G1 X102.571 Y138.95 E.37996
G1 X103.698 Y138.95 E.03739
G1 X95.598 Y147.05 E.37996
G1 X95.318 Y147.05 E.0093
G1 X87.219 Y138.95 E.37996
G1 X88.346 Y138.95 E.03739
G1 X80.246 Y147.05 E.37996
G1 X79.966 Y147.05 E.0093
G1 X71.867 Y138.95 E.37996
G1 X72.994 Y138.95 E.03739
G1 X64.895 Y147.05 E.37996
G1 X64.614 Y147.05 E.0093
G1 X56.515 Y138.95 E.37996
G1 X57.642 Y138.95 E.03739
G1 X49.543 Y147.05 E.37996
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X54.05 Y134.867 E.37996
G1 X54.05 Y136.485 E.05369
G1 X45.95 Y128.386 E.37996
G1 X45.95 Y127.614 E.02561
G1 X54.05 Y119.515 E.37996
G1 X54.05 Y121.133 E.05369
G1 X45.95 Y113.034 E.37996
G1 X45.95 Y112.262 E.02561
G1 X49.262 Y108.95 E.15536
G1 X49.543 Y108.95 E.00931
G1 X54.05 Y113.457 E.21143
G1 X54.05 Y111.839 E.05369
G1 X45.95 Y119.938 E.37996
G1 X45.95 Y120.71 E.02561
G1 X54.05 Y128.809 E.37996
G1 X54.05 Y127.191 E.05369
G1 X45.95 Y135.29 E.37996
G1 X45.95 Y136.062 E.02561
G1 X56.938 Y147.05 E.51546
G1 X57.219 Y147.05 E.0093
G1 X65.318 Y138.95 E.37996
G1 X64.191 Y138.95 E.03739
G1 X72.29 Y147.05 E.37996
G1 X72.57 Y147.05 E.0093
G1 X80.67 Y138.95 E.37996
G1 X79.543 Y138.95 E.03739
G1 X87.642 Y147.05 E.37996
G1 X87.922 Y147.05 E.0093
G1 X96.022 Y138.95 E.37996
G1 X94.895 Y138.95 E.03739
G1 X102.994 Y147.05 E.37996
G1 X103.274 Y147.05 E.00931
G1 X111.374 Y138.95 E.37996
G1 X110.246 Y138.95 E.03739
G1 X118.346 Y147.05 E.37996
G1 X118.626 Y147.05 E.00931
G1 X126.726 Y138.95 E.37996
G1 X125.598 Y138.95 E.03739
G1 X133.698 Y147.05 E.37996
G1 X133.978 Y147.05 E.00931
G1 X142.078 Y138.95 E.37996
G1 X140.95 Y138.95 E.03739
G1 X149.05 Y147.05 E.37996
G1 X149.33 Y147.05 E.00931
G1 X157.429 Y138.95 E.37996
G1 X156.302 Y138.95 E.03739
G1 X164.402 Y147.05 E.37996
G1 X164.682 Y147.05 E.00931
G1 X172.781 Y138.95 E.37996
G1 X171.654 Y138.95 E.03739
G1 X179.754 Y147.05 E.37996
G1 X180.034 Y147.05 E.00931
G1 X188.133 Y138.95 E.37996
G1 X187.006 Y138.95 E.03739
G1 X195.105 Y147.05 E.37996
G1 X195.386 Y147.05 E.00931
G1 X203.485 Y138.95 E.37996
G1 X202.358 Y138.95 E.03739
G1 X210.457 Y147.05 E.37996
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X205.95 Y134.867 E.37996
G1 X205.95 Y136.485 E.05369
G1 X214.05 Y128.386 E.37996
G1 X214.05 Y127.614 E.02561
G1 X205.95 Y119.515 E.37996
G1 X205.95 Y117.886 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y119.515 E-.61876
G1 X206.213 Y119.778 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/275
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
G3 Z1.2 I-.147 J-1.208 P1  F30000
G1 X54.398 Y138.21 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F14794
G1 X54.398 Y138.602 E.01301
G1 X205.602 Y138.602 E5.01572
G1 X205.602 Y108.602 E.99516
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y147.398 E1.28693
G1 X45.602 Y147.398 E5.59927
G1 X45.602 Y108.602 E1.28693
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y138.15 E.98016
G1 X54.79 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X205.21 Y138.21 E4.62199
G1 X205.21 Y108.21 E.92182
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y147.79 E1.21618
G1 X45.21 Y147.79 E5.21072
G1 X45.21 Y108.21 E1.21618
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y138.15 E.91997
M204 S10000
; WIPE_START
G1 F24000
G1 X56.79 Y138.151 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.125 J1.211 P1  F30000
G1 X205.95 Y122.762 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14794
G1 X205.95 Y121.133 E.05401
G1 X214.05 Y113.034 E.37996
G1 X214.05 Y112.262 E.02561
G1 X210.738 Y108.95 E.15536
G1 X210.457 Y108.95 E.0093
G1 X205.95 Y113.457 E.21144
G1 X205.95 Y111.839 E.05369
G1 X214.05 Y119.938 E.37996
G1 X214.05 Y120.71 E.02561
G1 X205.95 Y128.809 E.37996
G1 X205.95 Y127.191 E.05369
G1 X214.05 Y135.29 E.37996
G1 X214.05 Y136.062 E.02561
G1 X203.062 Y147.05 E.51546
G1 X202.781 Y147.05 E.00931
G1 X194.682 Y138.95 E.37996
G1 X195.809 Y138.95 E.03739
G1 X187.71 Y147.05 E.37996
G1 X187.429 Y147.05 E.00931
G1 X179.33 Y138.95 E.37996
G1 X180.457 Y138.95 E.03739
G1 X172.358 Y147.05 E.37996
G1 X172.078 Y147.05 E.00931
G1 X163.978 Y138.95 E.37996
G1 X165.105 Y138.95 E.03739
G1 X157.006 Y147.05 E.37996
G1 X156.726 Y147.05 E.00931
G1 X148.626 Y138.95 E.37996
G1 X149.754 Y138.95 E.03739
G1 X141.654 Y147.05 E.37996
G1 X141.374 Y147.05 E.00931
G1 X133.274 Y138.95 E.37996
G1 X134.402 Y138.95 E.03739
G1 X126.302 Y147.05 E.37996
G1 X126.022 Y147.05 E.00931
G1 X117.922 Y138.95 E.37996
G1 X119.05 Y138.95 E.03739
G1 X110.95 Y147.05 E.37996
G1 X110.67 Y147.05 E.00931
G1 X102.571 Y138.95 E.37996
G1 X103.698 Y138.95 E.03739
G1 X95.598 Y147.05 E.37996
G1 X95.318 Y147.05 E.0093
G1 X87.219 Y138.95 E.37996
G1 X88.346 Y138.95 E.03739
G1 X80.246 Y147.05 E.37996
G1 X79.966 Y147.05 E.0093
G1 X71.867 Y138.95 E.37996
G1 X72.994 Y138.95 E.03739
G1 X64.895 Y147.05 E.37996
G1 X64.614 Y147.05 E.0093
G1 X56.515 Y138.95 E.37996
G1 X57.642 Y138.95 E.03739
G1 X49.543 Y147.05 E.37996
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X54.05 Y134.867 E.37996
G1 X54.05 Y136.485 E.05369
G1 X45.95 Y128.386 E.37996
G1 X45.95 Y127.614 E.02561
G1 X54.05 Y119.515 E.37996
G1 X54.05 Y121.133 E.05369
G1 X45.95 Y113.034 E.37996
G1 X45.95 Y112.262 E.02561
G1 X49.262 Y108.95 E.15536
G1 X49.543 Y108.95 E.00931
G1 X54.05 Y113.457 E.21143
G1 X54.05 Y111.839 E.05369
G1 X45.95 Y119.938 E.37996
G1 X45.95 Y120.71 E.02561
G1 X54.05 Y128.809 E.37996
G1 X54.05 Y127.191 E.05369
G1 X45.95 Y135.29 E.37996
G1 X45.95 Y136.062 E.02561
G1 X56.938 Y147.05 E.51546
G1 X57.219 Y147.05 E.0093
G1 X65.318 Y138.95 E.37996
G1 X64.191 Y138.95 E.03739
G1 X72.29 Y147.05 E.37996
G1 X72.57 Y147.05 E.0093
G1 X80.67 Y138.95 E.37996
G1 X79.543 Y138.95 E.03739
G1 X87.642 Y147.05 E.37996
G1 X87.922 Y147.05 E.0093
G1 X96.022 Y138.95 E.37996
G1 X94.895 Y138.95 E.03739
G1 X102.994 Y147.05 E.37996
G1 X103.274 Y147.05 E.00931
G1 X111.374 Y138.95 E.37996
G1 X110.246 Y138.95 E.03739
G1 X118.346 Y147.05 E.37996
G1 X118.626 Y147.05 E.00931
G1 X126.726 Y138.95 E.37996
G1 X125.598 Y138.95 E.03739
G1 X133.698 Y147.05 E.37996
G1 X133.978 Y147.05 E.00931
G1 X142.078 Y138.95 E.37996
G1 X140.95 Y138.95 E.03739
G1 X149.05 Y147.05 E.37996
G1 X149.33 Y147.05 E.00931
G1 X157.429 Y138.95 E.37996
G1 X156.302 Y138.95 E.03739
G1 X164.402 Y147.05 E.37996
G1 X164.682 Y147.05 E.00931
G1 X172.781 Y138.95 E.37996
G1 X171.654 Y138.95 E.03739
G1 X179.754 Y147.05 E.37996
G1 X180.034 Y147.05 E.00931
G1 X188.133 Y138.95 E.37996
G1 X187.006 Y138.95 E.03739
G1 X195.105 Y147.05 E.37996
G1 X195.386 Y147.05 E.00931
G1 X203.485 Y138.95 E.37996
G1 X202.358 Y138.95 E.03739
G1 X210.457 Y147.05 E.37996
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X205.95 Y134.867 E.37996
G1 X205.95 Y136.485 E.05369
G1 X214.05 Y128.386 E.37996
G1 X214.05 Y127.614 E.02561
G1 X205.95 Y119.515 E.37996
G1 X205.95 Y117.886 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y119.515 E-.61876
G1 X206.213 Y119.778 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/275
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
G3 Z1.4 I-.147 J-1.208 P1  F30000
G1 X54.398 Y138.21 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F14794
G1 X54.398 Y138.602 E.01301
G1 X205.602 Y138.602 E5.01572
G1 X205.602 Y108.602 E.99516
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y147.398 E1.28693
G1 X45.602 Y147.398 E5.59927
G1 X45.602 Y108.602 E1.28693
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y138.15 E.98016
G1 X54.79 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X205.21 Y138.21 E4.62199
G1 X205.21 Y108.21 E.92182
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y147.79 E1.21618
G1 X45.21 Y147.79 E5.21072
G1 X45.21 Y108.21 E1.21618
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y138.15 E.91997
M204 S10000
; WIPE_START
G1 F24000
G1 X56.79 Y138.151 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.125 J1.211 P1  F30000
G1 X205.95 Y122.762 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14794
G1 X205.95 Y121.133 E.05401
G1 X214.05 Y113.034 E.37996
G1 X214.05 Y112.262 E.02561
G1 X210.738 Y108.95 E.15536
G1 X210.457 Y108.95 E.0093
G1 X205.95 Y113.457 E.21144
G1 X205.95 Y111.839 E.05369
G1 X214.05 Y119.938 E.37996
G1 X214.05 Y120.71 E.02561
G1 X205.95 Y128.809 E.37996
G1 X205.95 Y127.191 E.05369
G1 X214.05 Y135.29 E.37996
G1 X214.05 Y136.062 E.02561
G1 X203.062 Y147.05 E.51546
G1 X202.781 Y147.05 E.00931
G1 X194.682 Y138.95 E.37996
G1 X195.809 Y138.95 E.03739
G1 X187.71 Y147.05 E.37996
G1 X187.429 Y147.05 E.00931
G1 X179.33 Y138.95 E.37996
G1 X180.457 Y138.95 E.03739
G1 X172.358 Y147.05 E.37996
G1 X172.078 Y147.05 E.00931
G1 X163.978 Y138.95 E.37996
G1 X165.105 Y138.95 E.03739
G1 X157.006 Y147.05 E.37996
G1 X156.726 Y147.05 E.00931
G1 X148.626 Y138.95 E.37996
G1 X149.754 Y138.95 E.03739
G1 X141.654 Y147.05 E.37996
G1 X141.374 Y147.05 E.00931
G1 X133.274 Y138.95 E.37996
G1 X134.402 Y138.95 E.03739
G1 X126.302 Y147.05 E.37996
G1 X126.022 Y147.05 E.00931
G1 X117.922 Y138.95 E.37996
G1 X119.05 Y138.95 E.03739
G1 X110.95 Y147.05 E.37996
G1 X110.67 Y147.05 E.00931
G1 X102.571 Y138.95 E.37996
G1 X103.698 Y138.95 E.03739
G1 X95.598 Y147.05 E.37996
G1 X95.318 Y147.05 E.0093
G1 X87.219 Y138.95 E.37996
G1 X88.346 Y138.95 E.03739
G1 X80.246 Y147.05 E.37996
G1 X79.966 Y147.05 E.0093
G1 X71.867 Y138.95 E.37996
G1 X72.994 Y138.95 E.03739
G1 X64.895 Y147.05 E.37996
G1 X64.614 Y147.05 E.0093
G1 X56.515 Y138.95 E.37996
G1 X57.642 Y138.95 E.03739
G1 X49.543 Y147.05 E.37996
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X54.05 Y134.867 E.37996
G1 X54.05 Y136.485 E.05369
G1 X45.95 Y128.386 E.37996
G1 X45.95 Y127.614 E.02561
G1 X54.05 Y119.515 E.37996
G1 X54.05 Y121.133 E.05369
G1 X45.95 Y113.034 E.37996
G1 X45.95 Y112.262 E.02561
G1 X49.262 Y108.95 E.15536
G1 X49.543 Y108.95 E.00931
G1 X54.05 Y113.457 E.21143
G1 X54.05 Y111.839 E.05369
G1 X45.95 Y119.938 E.37996
G1 X45.95 Y120.71 E.02561
G1 X54.05 Y128.809 E.37996
G1 X54.05 Y127.191 E.05369
G1 X45.95 Y135.29 E.37996
G1 X45.95 Y136.062 E.02561
G1 X56.938 Y147.05 E.51546
G1 X57.219 Y147.05 E.0093
G1 X65.318 Y138.95 E.37996
G1 X64.191 Y138.95 E.03739
G1 X72.29 Y147.05 E.37996
G1 X72.57 Y147.05 E.0093
G1 X80.67 Y138.95 E.37996
G1 X79.543 Y138.95 E.03739
G1 X87.642 Y147.05 E.37996
G1 X87.922 Y147.05 E.0093
G1 X96.022 Y138.95 E.37996
G1 X94.895 Y138.95 E.03739
G1 X102.994 Y147.05 E.37996
G1 X103.274 Y147.05 E.00931
G1 X111.374 Y138.95 E.37996
G1 X110.246 Y138.95 E.03739
G1 X118.346 Y147.05 E.37996
G1 X118.626 Y147.05 E.00931
G1 X126.726 Y138.95 E.37996
G1 X125.598 Y138.95 E.03739
G1 X133.698 Y147.05 E.37996
G1 X133.978 Y147.05 E.00931
G1 X142.078 Y138.95 E.37996
G1 X140.95 Y138.95 E.03739
G1 X149.05 Y147.05 E.37996
G1 X149.33 Y147.05 E.00931
G1 X157.429 Y138.95 E.37996
G1 X156.302 Y138.95 E.03739
G1 X164.402 Y147.05 E.37996
G1 X164.682 Y147.05 E.00931
G1 X172.781 Y138.95 E.37996
M73 P22 R43
G1 X171.654 Y138.95 E.03739
G1 X179.754 Y147.05 E.37996
G1 X180.034 Y147.05 E.00931
G1 X188.133 Y138.95 E.37996
G1 X187.006 Y138.95 E.03739
G1 X195.105 Y147.05 E.37996
G1 X195.386 Y147.05 E.00931
G1 X203.485 Y138.95 E.37996
G1 X202.358 Y138.95 E.03739
G1 X210.457 Y147.05 E.37996
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X205.95 Y134.867 E.37996
G1 X205.95 Y136.485 E.05369
G1 X214.05 Y128.386 E.37996
G1 X214.05 Y127.614 E.02561
G1 X205.95 Y119.515 E.37996
G1 X205.95 Y117.886 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y119.515 E-.61876
G1 X206.213 Y119.778 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/275
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
G3 Z1.6 I-.147 J-1.208 P1  F30000
G1 X54.398 Y138.21 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F14794
G1 X54.398 Y138.602 E.01301
G1 X205.602 Y138.602 E5.01572
G1 X205.602 Y108.602 E.99516
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y147.398 E1.28693
G1 X45.602 Y147.398 E5.59927
G1 X45.602 Y108.602 E1.28693
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y138.15 E.98016
G1 X54.79 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X205.21 Y138.21 E4.62199
G1 X205.21 Y108.21 E.92182
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y147.79 E1.21618
G1 X45.21 Y147.79 E5.21072
G1 X45.21 Y108.21 E1.21618
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y138.15 E.91997
M204 S10000
; WIPE_START
G1 F24000
G1 X56.79 Y138.151 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.125 J1.211 P1  F30000
G1 X205.95 Y122.762 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14794
G1 X205.95 Y121.133 E.05401
G1 X214.05 Y113.034 E.37996
G1 X214.05 Y112.262 E.02561
G1 X210.738 Y108.95 E.15536
G1 X210.457 Y108.95 E.0093
G1 X205.95 Y113.457 E.21144
G1 X205.95 Y111.839 E.05369
G1 X214.05 Y119.938 E.37996
G1 X214.05 Y120.71 E.02561
G1 X205.95 Y128.809 E.37996
G1 X205.95 Y127.191 E.05369
G1 X214.05 Y135.29 E.37996
G1 X214.05 Y136.062 E.02561
G1 X203.062 Y147.05 E.51546
G1 X202.781 Y147.05 E.00931
G1 X194.682 Y138.95 E.37996
G1 X195.809 Y138.95 E.03739
G1 X187.71 Y147.05 E.37996
G1 X187.429 Y147.05 E.00931
G1 X179.33 Y138.95 E.37996
G1 X180.457 Y138.95 E.03739
G1 X172.358 Y147.05 E.37996
G1 X172.078 Y147.05 E.00931
G1 X163.978 Y138.95 E.37996
G1 X165.105 Y138.95 E.03739
G1 X157.006 Y147.05 E.37996
G1 X156.726 Y147.05 E.00931
G1 X148.626 Y138.95 E.37996
G1 X149.754 Y138.95 E.03739
G1 X141.654 Y147.05 E.37996
G1 X141.374 Y147.05 E.00931
G1 X133.274 Y138.95 E.37996
G1 X134.402 Y138.95 E.03739
G1 X126.302 Y147.05 E.37996
G1 X126.022 Y147.05 E.00931
G1 X117.922 Y138.95 E.37996
G1 X119.05 Y138.95 E.03739
G1 X110.95 Y147.05 E.37996
G1 X110.67 Y147.05 E.00931
G1 X102.571 Y138.95 E.37996
G1 X103.698 Y138.95 E.03739
G1 X95.598 Y147.05 E.37996
G1 X95.318 Y147.05 E.0093
G1 X87.219 Y138.95 E.37996
G1 X88.346 Y138.95 E.03739
G1 X80.246 Y147.05 E.37996
G1 X79.966 Y147.05 E.0093
G1 X71.867 Y138.95 E.37996
G1 X72.994 Y138.95 E.03739
G1 X64.895 Y147.05 E.37996
G1 X64.614 Y147.05 E.0093
G1 X56.515 Y138.95 E.37996
G1 X57.642 Y138.95 E.03739
G1 X49.543 Y147.05 E.37996
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X54.05 Y134.867 E.37996
G1 X54.05 Y136.485 E.05369
G1 X45.95 Y128.386 E.37996
G1 X45.95 Y127.614 E.02561
G1 X54.05 Y119.515 E.37996
G1 X54.05 Y121.133 E.05369
G1 X45.95 Y113.034 E.37996
G1 X45.95 Y112.262 E.02561
G1 X49.262 Y108.95 E.15536
G1 X49.543 Y108.95 E.00931
G1 X54.05 Y113.457 E.21143
G1 X54.05 Y111.839 E.05369
G1 X45.95 Y119.938 E.37996
G1 X45.95 Y120.71 E.02561
G1 X54.05 Y128.809 E.37996
G1 X54.05 Y127.191 E.05369
G1 X45.95 Y135.29 E.37996
G1 X45.95 Y136.062 E.02561
G1 X56.938 Y147.05 E.51546
G1 X57.219 Y147.05 E.0093
G1 X65.318 Y138.95 E.37996
G1 X64.191 Y138.95 E.03739
G1 X72.29 Y147.05 E.37996
G1 X72.57 Y147.05 E.0093
G1 X80.67 Y138.95 E.37996
G1 X79.543 Y138.95 E.03739
G1 X87.642 Y147.05 E.37996
G1 X87.922 Y147.05 E.0093
G1 X96.022 Y138.95 E.37996
G1 X94.895 Y138.95 E.03739
G1 X102.994 Y147.05 E.37996
G1 X103.274 Y147.05 E.00931
G1 X111.374 Y138.95 E.37996
G1 X110.246 Y138.95 E.03739
G1 X118.346 Y147.05 E.37996
G1 X118.626 Y147.05 E.00931
G1 X126.726 Y138.95 E.37996
G1 X125.598 Y138.95 E.03739
G1 X133.698 Y147.05 E.37996
G1 X133.978 Y147.05 E.00931
G1 X142.078 Y138.95 E.37996
G1 X140.95 Y138.95 E.03739
G1 X149.05 Y147.05 E.37996
G1 X149.33 Y147.05 E.00931
G1 X157.429 Y138.95 E.37996
G1 X156.302 Y138.95 E.03739
G1 X164.402 Y147.05 E.37996
G1 X164.682 Y147.05 E.00931
G1 X172.781 Y138.95 E.37996
G1 X171.654 Y138.95 E.03739
G1 X179.754 Y147.05 E.37996
G1 X180.034 Y147.05 E.00931
G1 X188.133 Y138.95 E.37996
G1 X187.006 Y138.95 E.03739
G1 X195.105 Y147.05 E.37996
G1 X195.386 Y147.05 E.00931
G1 X203.485 Y138.95 E.37996
G1 X202.358 Y138.95 E.03739
G1 X210.457 Y147.05 E.37996
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X205.95 Y134.867 E.37996
G1 X205.95 Y136.485 E.05369
G1 X214.05 Y128.386 E.37996
G1 X214.05 Y127.614 E.02561
G1 X205.95 Y119.515 E.37996
G1 X205.95 Y117.886 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y119.515 E-.61876
G1 X206.213 Y119.778 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/275
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
G3 Z1.8 I-.147 J-1.208 P1  F30000
G1 X54.398 Y138.21 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F14794
G1 X54.398 Y138.602 E.01301
G1 X205.602 Y138.602 E5.01572
G1 X205.602 Y108.602 E.99516
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y147.398 E1.28693
G1 X45.602 Y147.398 E5.59927
G1 X45.602 Y108.602 E1.28693
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y138.15 E.98016
G1 X54.79 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X205.21 Y138.21 E4.62199
G1 X205.21 Y108.21 E.92182
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y147.79 E1.21618
G1 X45.21 Y147.79 E5.21072
G1 X45.21 Y108.21 E1.21618
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y138.15 E.91997
M204 S10000
; WIPE_START
G1 F24000
G1 X56.79 Y138.151 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.125 J1.211 P1  F30000
G1 X205.95 Y122.762 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14794
G1 X205.95 Y121.133 E.05401
G1 X214.05 Y113.034 E.37996
G1 X214.05 Y112.262 E.02561
G1 X210.738 Y108.95 E.15536
G1 X210.457 Y108.95 E.0093
G1 X205.95 Y113.457 E.21144
G1 X205.95 Y111.839 E.05369
G1 X214.05 Y119.938 E.37996
G1 X214.05 Y120.71 E.02561
G1 X205.95 Y128.809 E.37996
G1 X205.95 Y127.191 E.05369
G1 X214.05 Y135.29 E.37996
G1 X214.05 Y136.062 E.02561
G1 X203.062 Y147.05 E.51546
G1 X202.781 Y147.05 E.00931
G1 X194.682 Y138.95 E.37996
G1 X195.809 Y138.95 E.03739
G1 X187.71 Y147.05 E.37996
G1 X187.429 Y147.05 E.00931
G1 X179.33 Y138.95 E.37996
G1 X180.457 Y138.95 E.03739
G1 X172.358 Y147.05 E.37996
G1 X172.078 Y147.05 E.00931
G1 X163.978 Y138.95 E.37996
G1 X165.105 Y138.95 E.03739
G1 X157.006 Y147.05 E.37996
G1 X156.726 Y147.05 E.00931
G1 X148.626 Y138.95 E.37996
G1 X149.754 Y138.95 E.03739
G1 X141.654 Y147.05 E.37996
G1 X141.374 Y147.05 E.00931
G1 X133.274 Y138.95 E.37996
G1 X134.402 Y138.95 E.03739
G1 X126.302 Y147.05 E.37996
G1 X126.022 Y147.05 E.00931
G1 X117.922 Y138.95 E.37996
G1 X119.05 Y138.95 E.03739
G1 X110.95 Y147.05 E.37996
G1 X110.67 Y147.05 E.00931
G1 X102.571 Y138.95 E.37996
G1 X103.698 Y138.95 E.03739
G1 X95.598 Y147.05 E.37996
G1 X95.318 Y147.05 E.0093
G1 X87.219 Y138.95 E.37996
G1 X88.346 Y138.95 E.03739
G1 X80.246 Y147.05 E.37996
G1 X79.966 Y147.05 E.0093
G1 X71.867 Y138.95 E.37996
G1 X72.994 Y138.95 E.03739
G1 X64.895 Y147.05 E.37996
G1 X64.614 Y147.05 E.0093
G1 X56.515 Y138.95 E.37996
G1 X57.642 Y138.95 E.03739
G1 X49.543 Y147.05 E.37996
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X54.05 Y134.867 E.37996
G1 X54.05 Y136.485 E.05369
G1 X45.95 Y128.386 E.37996
G1 X45.95 Y127.614 E.02561
G1 X54.05 Y119.515 E.37996
G1 X54.05 Y121.133 E.05369
G1 X45.95 Y113.034 E.37996
G1 X45.95 Y112.262 E.02561
G1 X49.262 Y108.95 E.15536
G1 X49.543 Y108.95 E.00931
G1 X54.05 Y113.457 E.21143
G1 X54.05 Y111.839 E.05369
G1 X45.95 Y119.938 E.37996
G1 X45.95 Y120.71 E.02561
G1 X54.05 Y128.809 E.37996
G1 X54.05 Y127.191 E.05369
G1 X45.95 Y135.29 E.37996
G1 X45.95 Y136.062 E.02561
G1 X56.938 Y147.05 E.51546
G1 X57.219 Y147.05 E.0093
G1 X65.318 Y138.95 E.37996
G1 X64.191 Y138.95 E.03739
G1 X72.29 Y147.05 E.37996
G1 X72.57 Y147.05 E.0093
G1 X80.67 Y138.95 E.37996
G1 X79.543 Y138.95 E.03739
G1 X87.642 Y147.05 E.37996
G1 X87.922 Y147.05 E.0093
G1 X96.022 Y138.95 E.37996
G1 X94.895 Y138.95 E.03739
G1 X102.994 Y147.05 E.37996
G1 X103.274 Y147.05 E.00931
G1 X111.374 Y138.95 E.37996
G1 X110.246 Y138.95 E.03739
G1 X118.346 Y147.05 E.37996
G1 X118.626 Y147.05 E.00931
G1 X126.726 Y138.95 E.37996
G1 X125.598 Y138.95 E.03739
G1 X133.698 Y147.05 E.37996
G1 X133.978 Y147.05 E.00931
G1 X142.078 Y138.95 E.37996
G1 X140.95 Y138.95 E.03739
G1 X149.05 Y147.05 E.37996
G1 X149.33 Y147.05 E.00931
G1 X157.429 Y138.95 E.37996
G1 X156.302 Y138.95 E.03739
G1 X164.402 Y147.05 E.37996
G1 X164.682 Y147.05 E.00931
G1 X172.781 Y138.95 E.37996
G1 X171.654 Y138.95 E.03739
G1 X179.754 Y147.05 E.37996
G1 X180.034 Y147.05 E.00931
G1 X188.133 Y138.95 E.37996
G1 X187.006 Y138.95 E.03739
G1 X195.105 Y147.05 E.37996
G1 X195.386 Y147.05 E.00931
G1 X203.485 Y138.95 E.37996
G1 X202.358 Y138.95 E.03739
G1 X210.457 Y147.05 E.37996
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X205.95 Y134.867 E.37996
G1 X205.95 Y136.485 E.05369
G1 X214.05 Y128.386 E.37996
G1 X214.05 Y127.614 E.02561
G1 X205.95 Y119.515 E.37996
G1 X205.95 Y117.886 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y119.515 E-.61876
G1 X206.213 Y119.778 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/275
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
G3 Z2 I-.147 J-1.208 P1  F30000
G1 X54.398 Y138.21 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F14794
G1 X54.398 Y138.602 E.01301
G1 X205.602 Y138.602 E5.01572
G1 X205.602 Y108.602 E.99516
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y147.398 E1.28693
G1 X45.602 Y147.398 E5.59927
G1 X45.602 Y108.602 E1.28693
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y138.15 E.98016
G1 X54.79 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X205.21 Y138.21 E4.62199
G1 X205.21 Y108.21 E.92182
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y147.79 E1.21618
G1 X45.21 Y147.79 E5.21072
G1 X45.21 Y108.21 E1.21618
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y138.15 E.91997
M204 S10000
; WIPE_START
G1 F24000
G1 X56.79 Y138.151 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.125 J1.211 P1  F30000
G1 X205.95 Y122.762 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14794
G1 X205.95 Y121.133 E.05401
G1 X214.05 Y113.034 E.37996
G1 X214.05 Y112.262 E.02561
G1 X210.738 Y108.95 E.15536
G1 X210.457 Y108.95 E.0093
G1 X205.95 Y113.457 E.21144
G1 X205.95 Y111.839 E.05369
G1 X214.05 Y119.938 E.37996
G1 X214.05 Y120.71 E.02561
G1 X205.95 Y128.809 E.37996
G1 X205.95 Y127.191 E.05369
G1 X214.05 Y135.29 E.37996
G1 X214.05 Y136.062 E.02561
G1 X203.062 Y147.05 E.51546
G1 X202.781 Y147.05 E.00931
G1 X194.682 Y138.95 E.37996
G1 X195.809 Y138.95 E.03739
G1 X187.71 Y147.05 E.37996
G1 X187.429 Y147.05 E.00931
G1 X179.33 Y138.95 E.37996
G1 X180.457 Y138.95 E.03739
G1 X172.358 Y147.05 E.37996
G1 X172.078 Y147.05 E.00931
G1 X163.978 Y138.95 E.37996
G1 X165.105 Y138.95 E.03739
G1 X157.006 Y147.05 E.37996
G1 X156.726 Y147.05 E.00931
G1 X148.626 Y138.95 E.37996
G1 X149.754 Y138.95 E.03739
G1 X141.654 Y147.05 E.37996
G1 X141.374 Y147.05 E.00931
G1 X133.274 Y138.95 E.37996
G1 X134.402 Y138.95 E.03739
G1 X126.302 Y147.05 E.37996
G1 X126.022 Y147.05 E.00931
G1 X117.922 Y138.95 E.37996
G1 X119.05 Y138.95 E.03739
G1 X110.95 Y147.05 E.37996
G1 X110.67 Y147.05 E.00931
M73 P22 R42
G1 X102.571 Y138.95 E.37996
G1 X103.698 Y138.95 E.03739
G1 X95.598 Y147.05 E.37996
G1 X95.318 Y147.05 E.0093
G1 X87.219 Y138.95 E.37996
G1 X88.346 Y138.95 E.03739
G1 X80.246 Y147.05 E.37996
G1 X79.966 Y147.05 E.0093
G1 X71.867 Y138.95 E.37996
G1 X72.994 Y138.95 E.03739
G1 X64.895 Y147.05 E.37996
G1 X64.614 Y147.05 E.0093
G1 X56.515 Y138.95 E.37996
G1 X57.642 Y138.95 E.03739
G1 X49.543 Y147.05 E.37996
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X54.05 Y134.867 E.37996
G1 X54.05 Y136.485 E.05369
G1 X45.95 Y128.386 E.37996
G1 X45.95 Y127.614 E.02561
G1 X54.05 Y119.515 E.37996
G1 X54.05 Y121.133 E.05369
G1 X45.95 Y113.034 E.37996
G1 X45.95 Y112.262 E.02561
G1 X49.262 Y108.95 E.15536
G1 X49.543 Y108.95 E.00931
G1 X54.05 Y113.457 E.21143
G1 X54.05 Y111.839 E.05369
G1 X45.95 Y119.938 E.37996
G1 X45.95 Y120.71 E.02561
G1 X54.05 Y128.809 E.37996
G1 X54.05 Y127.191 E.05369
G1 X45.95 Y135.29 E.37996
G1 X45.95 Y136.062 E.02561
G1 X56.938 Y147.05 E.51546
G1 X57.219 Y147.05 E.0093
G1 X65.318 Y138.95 E.37996
G1 X64.191 Y138.95 E.03739
G1 X72.29 Y147.05 E.37996
G1 X72.57 Y147.05 E.0093
G1 X80.67 Y138.95 E.37996
G1 X79.543 Y138.95 E.03739
G1 X87.642 Y147.05 E.37996
G1 X87.922 Y147.05 E.0093
G1 X96.022 Y138.95 E.37996
G1 X94.895 Y138.95 E.03739
G1 X102.994 Y147.05 E.37996
G1 X103.274 Y147.05 E.00931
G1 X111.374 Y138.95 E.37996
G1 X110.246 Y138.95 E.03739
G1 X118.346 Y147.05 E.37996
G1 X118.626 Y147.05 E.00931
G1 X126.726 Y138.95 E.37996
G1 X125.598 Y138.95 E.03739
G1 X133.698 Y147.05 E.37996
G1 X133.978 Y147.05 E.00931
G1 X142.078 Y138.95 E.37996
G1 X140.95 Y138.95 E.03739
G1 X149.05 Y147.05 E.37996
G1 X149.33 Y147.05 E.00931
G1 X157.429 Y138.95 E.37996
G1 X156.302 Y138.95 E.03739
G1 X164.402 Y147.05 E.37996
G1 X164.682 Y147.05 E.00931
G1 X172.781 Y138.95 E.37996
G1 X171.654 Y138.95 E.03739
G1 X179.754 Y147.05 E.37996
G1 X180.034 Y147.05 E.00931
G1 X188.133 Y138.95 E.37996
G1 X187.006 Y138.95 E.03739
G1 X195.105 Y147.05 E.37996
G1 X195.386 Y147.05 E.00931
G1 X203.485 Y138.95 E.37996
G1 X202.358 Y138.95 E.03739
G1 X210.457 Y147.05 E.37996
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X205.95 Y134.867 E.37996
G1 X205.95 Y136.485 E.05369
G1 X214.05 Y128.386 E.37996
M73 P23 R42
G1 X214.05 Y127.614 E.02561
G1 X205.95 Y119.515 E.37996
G1 X205.95 Y117.886 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y119.515 E-.61876
G1 X206.213 Y119.778 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/275
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
G3 Z2.2 I-.147 J-1.208 P1  F30000
G1 X54.398 Y138.21 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F14794
G1 X54.398 Y138.602 E.01301
G1 X205.602 Y138.602 E5.01572
G1 X205.602 Y108.602 E.99516
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y147.398 E1.28693
G1 X45.602 Y147.398 E5.59927
G1 X45.602 Y108.602 E1.28693
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y138.15 E.98016
G1 X54.79 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X205.21 Y138.21 E4.62199
G1 X205.21 Y108.21 E.92182
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y147.79 E1.21618
G1 X45.21 Y147.79 E5.21072
G1 X45.21 Y108.21 E1.21618
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y138.15 E.91997
M204 S10000
; WIPE_START
G1 F24000
G1 X56.79 Y138.151 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.125 J1.211 P1  F30000
G1 X205.95 Y122.762 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14794
G1 X205.95 Y121.133 E.05401
G1 X214.05 Y113.034 E.37996
G1 X214.05 Y112.262 E.02561
G1 X210.738 Y108.95 E.15536
G1 X210.457 Y108.95 E.0093
G1 X205.95 Y113.457 E.21144
G1 X205.95 Y111.839 E.05369
G1 X214.05 Y119.938 E.37996
G1 X214.05 Y120.71 E.02561
G1 X205.95 Y128.809 E.37996
G1 X205.95 Y127.191 E.05369
G1 X214.05 Y135.29 E.37996
G1 X214.05 Y136.062 E.02561
G1 X203.062 Y147.05 E.51546
G1 X202.781 Y147.05 E.00931
G1 X194.682 Y138.95 E.37996
G1 X195.809 Y138.95 E.03739
G1 X187.71 Y147.05 E.37996
G1 X187.429 Y147.05 E.00931
G1 X179.33 Y138.95 E.37996
G1 X180.457 Y138.95 E.03739
G1 X172.358 Y147.05 E.37996
G1 X172.078 Y147.05 E.00931
G1 X163.978 Y138.95 E.37996
G1 X165.105 Y138.95 E.03739
G1 X157.006 Y147.05 E.37996
G1 X156.726 Y147.05 E.00931
G1 X148.626 Y138.95 E.37996
G1 X149.754 Y138.95 E.03739
G1 X141.654 Y147.05 E.37996
G1 X141.374 Y147.05 E.00931
G1 X133.274 Y138.95 E.37996
G1 X134.402 Y138.95 E.03739
G1 X126.302 Y147.05 E.37996
G1 X126.022 Y147.05 E.00931
G1 X117.922 Y138.95 E.37996
G1 X119.05 Y138.95 E.03739
G1 X110.95 Y147.05 E.37996
G1 X110.67 Y147.05 E.00931
G1 X102.571 Y138.95 E.37996
G1 X103.698 Y138.95 E.03739
G1 X95.598 Y147.05 E.37996
G1 X95.318 Y147.05 E.0093
G1 X87.219 Y138.95 E.37996
G1 X88.346 Y138.95 E.03739
G1 X80.246 Y147.05 E.37996
G1 X79.966 Y147.05 E.0093
G1 X71.867 Y138.95 E.37996
G1 X72.994 Y138.95 E.03739
G1 X64.895 Y147.05 E.37996
G1 X64.614 Y147.05 E.0093
G1 X56.515 Y138.95 E.37996
G1 X57.642 Y138.95 E.03739
G1 X49.543 Y147.05 E.37996
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X54.05 Y134.867 E.37996
G1 X54.05 Y136.485 E.05369
G1 X45.95 Y128.386 E.37996
G1 X45.95 Y127.614 E.02561
G1 X54.05 Y119.515 E.37996
G1 X54.05 Y121.133 E.05369
G1 X45.95 Y113.034 E.37996
G1 X45.95 Y112.262 E.02561
G1 X49.262 Y108.95 E.15536
G1 X49.543 Y108.95 E.00931
G1 X54.05 Y113.457 E.21143
G1 X54.05 Y111.839 E.05369
G1 X45.95 Y119.938 E.37996
G1 X45.95 Y120.71 E.02561
G1 X54.05 Y128.809 E.37996
G1 X54.05 Y127.191 E.05369
G1 X45.95 Y135.29 E.37996
G1 X45.95 Y136.062 E.02561
G1 X56.938 Y147.05 E.51546
G1 X57.219 Y147.05 E.0093
G1 X65.318 Y138.95 E.37996
G1 X64.191 Y138.95 E.03739
G1 X72.29 Y147.05 E.37996
G1 X72.57 Y147.05 E.0093
G1 X80.67 Y138.95 E.37996
G1 X79.543 Y138.95 E.03739
G1 X87.642 Y147.05 E.37996
G1 X87.922 Y147.05 E.0093
G1 X96.022 Y138.95 E.37996
G1 X94.895 Y138.95 E.03739
G1 X102.994 Y147.05 E.37996
G1 X103.274 Y147.05 E.00931
G1 X111.374 Y138.95 E.37996
G1 X110.246 Y138.95 E.03739
G1 X118.346 Y147.05 E.37996
G1 X118.626 Y147.05 E.00931
G1 X126.726 Y138.95 E.37996
G1 X125.598 Y138.95 E.03739
G1 X133.698 Y147.05 E.37996
G1 X133.978 Y147.05 E.00931
G1 X142.078 Y138.95 E.37996
G1 X140.95 Y138.95 E.03739
G1 X149.05 Y147.05 E.37996
G1 X149.33 Y147.05 E.00931
G1 X157.429 Y138.95 E.37996
G1 X156.302 Y138.95 E.03739
G1 X164.402 Y147.05 E.37996
G1 X164.682 Y147.05 E.00931
G1 X172.781 Y138.95 E.37996
G1 X171.654 Y138.95 E.03739
G1 X179.754 Y147.05 E.37996
G1 X180.034 Y147.05 E.00931
G1 X188.133 Y138.95 E.37996
G1 X187.006 Y138.95 E.03739
G1 X195.105 Y147.05 E.37996
G1 X195.386 Y147.05 E.00931
G1 X203.485 Y138.95 E.37996
G1 X202.358 Y138.95 E.03739
G1 X210.457 Y147.05 E.37996
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X205.95 Y134.867 E.37996
G1 X205.95 Y136.485 E.05369
G1 X214.05 Y128.386 E.37996
G1 X214.05 Y127.614 E.02561
G1 X205.95 Y119.515 E.37996
G1 X205.95 Y117.886 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y119.515 E-.61876
G1 X206.213 Y119.778 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/275
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
G3 Z2.4 I-.147 J-1.208 P1  F30000
G1 X54.398 Y138.21 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F14794
G1 X54.398 Y138.602 E.01301
G1 X205.602 Y138.602 E5.01572
G1 X205.602 Y108.602 E.99516
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y147.398 E1.28693
G1 X45.602 Y147.398 E5.59927
G1 X45.602 Y108.602 E1.28693
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y138.15 E.98016
G1 X54.79 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X205.21 Y138.21 E4.62199
G1 X205.21 Y108.21 E.92182
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y147.79 E1.21618
G1 X45.21 Y147.79 E5.21072
G1 X45.21 Y108.21 E1.21618
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y138.15 E.91997
M204 S10000
; WIPE_START
G1 F24000
G1 X56.79 Y138.151 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.125 J1.211 P1  F30000
G1 X205.95 Y122.762 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14794
G1 X205.95 Y121.133 E.05401
G1 X214.05 Y113.034 E.37996
G1 X214.05 Y112.262 E.02561
G1 X210.738 Y108.95 E.15536
G1 X210.457 Y108.95 E.0093
G1 X205.95 Y113.457 E.21144
G1 X205.95 Y111.839 E.05369
G1 X214.05 Y119.938 E.37996
G1 X214.05 Y120.71 E.02561
G1 X205.95 Y128.809 E.37996
G1 X205.95 Y127.191 E.05369
G1 X214.05 Y135.29 E.37996
G1 X214.05 Y136.062 E.02561
G1 X203.062 Y147.05 E.51546
G1 X202.781 Y147.05 E.00931
G1 X194.682 Y138.95 E.37996
G1 X195.809 Y138.95 E.03739
G1 X187.71 Y147.05 E.37996
G1 X187.429 Y147.05 E.00931
G1 X179.33 Y138.95 E.37996
G1 X180.457 Y138.95 E.03739
G1 X172.358 Y147.05 E.37996
G1 X172.078 Y147.05 E.00931
G1 X163.978 Y138.95 E.37996
G1 X165.105 Y138.95 E.03739
G1 X157.006 Y147.05 E.37996
G1 X156.726 Y147.05 E.00931
G1 X148.626 Y138.95 E.37996
G1 X149.754 Y138.95 E.03739
G1 X141.654 Y147.05 E.37996
G1 X141.374 Y147.05 E.00931
G1 X133.274 Y138.95 E.37996
G1 X134.402 Y138.95 E.03739
G1 X126.302 Y147.05 E.37996
G1 X126.022 Y147.05 E.00931
G1 X117.922 Y138.95 E.37996
G1 X119.05 Y138.95 E.03739
G1 X110.95 Y147.05 E.37996
G1 X110.67 Y147.05 E.00931
G1 X102.571 Y138.95 E.37996
G1 X103.698 Y138.95 E.03739
G1 X95.598 Y147.05 E.37996
G1 X95.318 Y147.05 E.0093
G1 X87.219 Y138.95 E.37996
G1 X88.346 Y138.95 E.03739
G1 X80.246 Y147.05 E.37996
G1 X79.966 Y147.05 E.0093
G1 X71.867 Y138.95 E.37996
G1 X72.994 Y138.95 E.03739
G1 X64.895 Y147.05 E.37996
G1 X64.614 Y147.05 E.0093
G1 X56.515 Y138.95 E.37996
G1 X57.642 Y138.95 E.03739
G1 X49.543 Y147.05 E.37996
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X54.05 Y134.867 E.37996
G1 X54.05 Y136.485 E.05369
G1 X45.95 Y128.386 E.37996
G1 X45.95 Y127.614 E.02561
G1 X54.05 Y119.515 E.37996
G1 X54.05 Y121.133 E.05369
G1 X45.95 Y113.034 E.37996
G1 X45.95 Y112.262 E.02561
G1 X49.262 Y108.95 E.15536
G1 X49.543 Y108.95 E.00931
G1 X54.05 Y113.457 E.21143
G1 X54.05 Y111.839 E.05369
G1 X45.95 Y119.938 E.37996
G1 X45.95 Y120.71 E.02561
G1 X54.05 Y128.809 E.37996
G1 X54.05 Y127.191 E.05369
G1 X45.95 Y135.29 E.37996
G1 X45.95 Y136.062 E.02561
G1 X56.938 Y147.05 E.51546
G1 X57.219 Y147.05 E.0093
G1 X65.318 Y138.95 E.37996
G1 X64.191 Y138.95 E.03739
G1 X72.29 Y147.05 E.37996
G1 X72.57 Y147.05 E.0093
G1 X80.67 Y138.95 E.37996
G1 X79.543 Y138.95 E.03739
G1 X87.642 Y147.05 E.37996
G1 X87.922 Y147.05 E.0093
G1 X96.022 Y138.95 E.37996
G1 X94.895 Y138.95 E.03739
G1 X102.994 Y147.05 E.37996
G1 X103.274 Y147.05 E.00931
G1 X111.374 Y138.95 E.37996
G1 X110.246 Y138.95 E.03739
G1 X118.346 Y147.05 E.37996
G1 X118.626 Y147.05 E.00931
G1 X126.726 Y138.95 E.37996
G1 X125.598 Y138.95 E.03739
G1 X133.698 Y147.05 E.37996
G1 X133.978 Y147.05 E.00931
G1 X142.078 Y138.95 E.37996
G1 X140.95 Y138.95 E.03739
G1 X149.05 Y147.05 E.37996
G1 X149.33 Y147.05 E.00931
G1 X157.429 Y138.95 E.37996
G1 X156.302 Y138.95 E.03739
G1 X164.402 Y147.05 E.37996
G1 X164.682 Y147.05 E.00931
G1 X172.781 Y138.95 E.37996
G1 X171.654 Y138.95 E.03739
G1 X179.754 Y147.05 E.37996
G1 X180.034 Y147.05 E.00931
G1 X188.133 Y138.95 E.37996
G1 X187.006 Y138.95 E.03739
G1 X195.105 Y147.05 E.37996
G1 X195.386 Y147.05 E.00931
G1 X203.485 Y138.95 E.37996
G1 X202.358 Y138.95 E.03739
G1 X210.457 Y147.05 E.37996
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X205.95 Y134.867 E.37996
G1 X205.95 Y136.485 E.05369
G1 X214.05 Y128.386 E.37996
G1 X214.05 Y127.614 E.02561
G1 X205.95 Y119.515 E.37996
G1 X205.95 Y117.886 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y119.515 E-.61876
G1 X206.213 Y119.778 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/275
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
G3 Z2.6 I-.147 J-1.208 P1  F30000
G1 X54.398 Y138.21 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F14794
G1 X54.398 Y138.602 E.01301
G1 X205.602 Y138.602 E5.01572
G1 X205.602 Y108.602 E.99516
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y147.398 E1.28693
G1 X45.602 Y147.398 E5.59927
G1 X45.602 Y108.602 E1.28693
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y138.15 E.98016
G1 X54.79 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X205.21 Y138.21 E4.62199
G1 X205.21 Y108.21 E.92182
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y147.79 E1.21618
G1 X45.21 Y147.79 E5.21072
G1 X45.21 Y108.21 E1.21618
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y138.15 E.91997
M204 S10000
; WIPE_START
G1 F24000
G1 X56.79 Y138.151 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.125 J1.211 P1  F30000
G1 X205.95 Y122.762 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14794
G1 X205.95 Y121.133 E.05401
G1 X214.05 Y113.034 E.37996
G1 X214.05 Y112.262 E.02561
G1 X210.738 Y108.95 E.15536
G1 X210.457 Y108.95 E.0093
G1 X205.95 Y113.457 E.21144
G1 X205.95 Y111.839 E.05369
G1 X214.05 Y119.938 E.37996
G1 X214.05 Y120.71 E.02561
G1 X205.95 Y128.809 E.37996
G1 X205.95 Y127.191 E.05369
G1 X214.05 Y135.29 E.37996
G1 X214.05 Y136.062 E.02561
G1 X203.062 Y147.05 E.51546
G1 X202.781 Y147.05 E.00931
G1 X194.682 Y138.95 E.37996
G1 X195.809 Y138.95 E.03739
G1 X187.71 Y147.05 E.37996
G1 X187.429 Y147.05 E.00931
G1 X179.33 Y138.95 E.37996
G1 X180.457 Y138.95 E.03739
G1 X172.358 Y147.05 E.37996
G1 X172.078 Y147.05 E.00931
G1 X163.978 Y138.95 E.37996
G1 X165.105 Y138.95 E.03739
G1 X157.006 Y147.05 E.37996
G1 X156.726 Y147.05 E.00931
G1 X148.626 Y138.95 E.37996
G1 X149.754 Y138.95 E.03739
G1 X141.654 Y147.05 E.37996
G1 X141.374 Y147.05 E.00931
G1 X133.274 Y138.95 E.37996
G1 X134.402 Y138.95 E.03739
G1 X126.302 Y147.05 E.37996
G1 X126.022 Y147.05 E.00931
G1 X117.922 Y138.95 E.37996
G1 X119.05 Y138.95 E.03739
G1 X110.95 Y147.05 E.37996
G1 X110.67 Y147.05 E.00931
G1 X102.571 Y138.95 E.37996
G1 X103.698 Y138.95 E.03739
G1 X95.598 Y147.05 E.37996
G1 X95.318 Y147.05 E.0093
G1 X87.219 Y138.95 E.37996
G1 X88.346 Y138.95 E.03739
G1 X80.246 Y147.05 E.37996
G1 X79.966 Y147.05 E.0093
G1 X71.867 Y138.95 E.37996
G1 X72.994 Y138.95 E.03739
G1 X64.895 Y147.05 E.37996
G1 X64.614 Y147.05 E.0093
G1 X56.515 Y138.95 E.37996
G1 X57.642 Y138.95 E.03739
G1 X49.543 Y147.05 E.37996
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X54.05 Y134.867 E.37996
G1 X54.05 Y136.485 E.05369
G1 X45.95 Y128.386 E.37996
G1 X45.95 Y127.614 E.02561
G1 X54.05 Y119.515 E.37996
G1 X54.05 Y121.133 E.05369
G1 X45.95 Y113.034 E.37996
G1 X45.95 Y112.262 E.02561
G1 X49.262 Y108.95 E.15536
G1 X49.543 Y108.95 E.00931
G1 X54.05 Y113.457 E.21143
G1 X54.05 Y111.839 E.05369
G1 X45.95 Y119.938 E.37996
G1 X45.95 Y120.71 E.02561
G1 X54.05 Y128.809 E.37996
G1 X54.05 Y127.191 E.05369
G1 X45.95 Y135.29 E.37996
G1 X45.95 Y136.062 E.02561
G1 X56.938 Y147.05 E.51546
G1 X57.219 Y147.05 E.0093
G1 X65.318 Y138.95 E.37996
G1 X64.191 Y138.95 E.03739
G1 X72.29 Y147.05 E.37996
G1 X72.57 Y147.05 E.0093
G1 X80.67 Y138.95 E.37996
G1 X79.543 Y138.95 E.03739
G1 X87.642 Y147.05 E.37996
G1 X87.922 Y147.05 E.0093
G1 X96.022 Y138.95 E.37996
G1 X94.895 Y138.95 E.03739
G1 X102.994 Y147.05 E.37996
G1 X103.274 Y147.05 E.00931
G1 X111.374 Y138.95 E.37996
G1 X110.246 Y138.95 E.03739
G1 X118.346 Y147.05 E.37996
G1 X118.626 Y147.05 E.00931
G1 X126.726 Y138.95 E.37996
G1 X125.598 Y138.95 E.03739
G1 X133.698 Y147.05 E.37996
G1 X133.978 Y147.05 E.00931
G1 X142.078 Y138.95 E.37996
G1 X140.95 Y138.95 E.03739
G1 X149.05 Y147.05 E.37996
G1 X149.33 Y147.05 E.00931
G1 X157.429 Y138.95 E.37996
G1 X156.302 Y138.95 E.03739
G1 X164.402 Y147.05 E.37996
G1 X164.682 Y147.05 E.00931
G1 X172.781 Y138.95 E.37996
G1 X171.654 Y138.95 E.03739
G1 X179.754 Y147.05 E.37996
G1 X180.034 Y147.05 E.00931
G1 X188.133 Y138.95 E.37996
G1 X187.006 Y138.95 E.03739
G1 X195.105 Y147.05 E.37996
G1 X195.386 Y147.05 E.00931
G1 X203.485 Y138.95 E.37996
G1 X202.358 Y138.95 E.03739
G1 X210.457 Y147.05 E.37996
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X205.95 Y134.867 E.37996
G1 X205.95 Y136.485 E.05369
G1 X214.05 Y128.386 E.37996
G1 X214.05 Y127.614 E.02561
G1 X205.95 Y119.515 E.37996
G1 X205.95 Y117.886 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y119.515 E-.61876
G1 X206.213 Y119.778 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/275
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
G3 Z2.8 I-.147 J-1.208 P1  F30000
G1 X54.398 Y138.21 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F14794
M73 P24 R42
G1 X54.398 Y138.602 E.01301
G1 X205.602 Y138.602 E5.01572
G1 X205.602 Y108.602 E.99516
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y147.398 E1.28693
G1 X45.602 Y147.398 E5.59927
G1 X45.602 Y108.602 E1.28693
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y138.15 E.98016
G1 X54.79 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X205.21 Y138.21 E4.62199
G1 X205.21 Y108.21 E.92182
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y147.79 E1.21618
G1 X45.21 Y147.79 E5.21072
G1 X45.21 Y108.21 E1.21618
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y138.15 E.91997
M204 S10000
; WIPE_START
G1 F24000
G1 X56.79 Y138.151 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.125 J1.211 P1  F30000
G1 X205.95 Y122.762 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14794
G1 X205.95 Y121.133 E.05401
G1 X214.05 Y113.034 E.37996
G1 X214.05 Y112.262 E.02561
G1 X210.738 Y108.95 E.15536
G1 X210.457 Y108.95 E.0093
G1 X205.95 Y113.457 E.21144
G1 X205.95 Y111.839 E.05369
G1 X214.05 Y119.938 E.37996
G1 X214.05 Y120.71 E.02561
G1 X205.95 Y128.809 E.37996
G1 X205.95 Y127.191 E.05369
G1 X214.05 Y135.29 E.37996
G1 X214.05 Y136.062 E.02561
G1 X203.062 Y147.05 E.51546
G1 X202.781 Y147.05 E.00931
G1 X194.682 Y138.95 E.37996
G1 X195.809 Y138.95 E.03739
G1 X187.71 Y147.05 E.37996
G1 X187.429 Y147.05 E.00931
G1 X179.33 Y138.95 E.37996
G1 X180.457 Y138.95 E.03739
G1 X172.358 Y147.05 E.37996
G1 X172.078 Y147.05 E.00931
G1 X163.978 Y138.95 E.37996
G1 X165.105 Y138.95 E.03739
G1 X157.006 Y147.05 E.37996
G1 X156.726 Y147.05 E.00931
G1 X148.626 Y138.95 E.37996
G1 X149.754 Y138.95 E.03739
G1 X141.654 Y147.05 E.37996
G1 X141.374 Y147.05 E.00931
G1 X133.274 Y138.95 E.37996
G1 X134.402 Y138.95 E.03739
G1 X126.302 Y147.05 E.37996
G1 X126.022 Y147.05 E.00931
G1 X117.922 Y138.95 E.37996
G1 X119.05 Y138.95 E.03739
G1 X110.95 Y147.05 E.37996
G1 X110.67 Y147.05 E.00931
G1 X102.571 Y138.95 E.37996
G1 X103.698 Y138.95 E.03739
G1 X95.598 Y147.05 E.37996
G1 X95.318 Y147.05 E.0093
G1 X87.219 Y138.95 E.37996
G1 X88.346 Y138.95 E.03739
G1 X80.246 Y147.05 E.37996
G1 X79.966 Y147.05 E.0093
G1 X71.867 Y138.95 E.37996
G1 X72.994 Y138.95 E.03739
G1 X64.895 Y147.05 E.37996
G1 X64.614 Y147.05 E.0093
G1 X56.515 Y138.95 E.37996
G1 X57.642 Y138.95 E.03739
G1 X49.543 Y147.05 E.37996
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X54.05 Y134.867 E.37996
G1 X54.05 Y136.485 E.05369
G1 X45.95 Y128.386 E.37996
G1 X45.95 Y127.614 E.02561
G1 X54.05 Y119.515 E.37996
G1 X54.05 Y121.133 E.05369
G1 X45.95 Y113.034 E.37996
G1 X45.95 Y112.262 E.02561
G1 X49.262 Y108.95 E.15536
G1 X49.543 Y108.95 E.00931
G1 X54.05 Y113.457 E.21143
G1 X54.05 Y111.839 E.05369
G1 X45.95 Y119.938 E.37996
G1 X45.95 Y120.71 E.02561
G1 X54.05 Y128.809 E.37996
G1 X54.05 Y127.191 E.05369
G1 X45.95 Y135.29 E.37996
G1 X45.95 Y136.062 E.02561
G1 X56.938 Y147.05 E.51546
G1 X57.219 Y147.05 E.0093
G1 X65.318 Y138.95 E.37996
G1 X64.191 Y138.95 E.03739
G1 X72.29 Y147.05 E.37996
G1 X72.57 Y147.05 E.0093
G1 X80.67 Y138.95 E.37996
G1 X79.543 Y138.95 E.03739
G1 X87.642 Y147.05 E.37996
G1 X87.922 Y147.05 E.0093
G1 X96.022 Y138.95 E.37996
G1 X94.895 Y138.95 E.03739
G1 X102.994 Y147.05 E.37996
G1 X103.274 Y147.05 E.00931
G1 X111.374 Y138.95 E.37996
G1 X110.246 Y138.95 E.03739
G1 X118.346 Y147.05 E.37996
G1 X118.626 Y147.05 E.00931
G1 X126.726 Y138.95 E.37996
G1 X125.598 Y138.95 E.03739
G1 X133.698 Y147.05 E.37996
G1 X133.978 Y147.05 E.00931
G1 X142.078 Y138.95 E.37996
G1 X140.95 Y138.95 E.03739
G1 X149.05 Y147.05 E.37996
G1 X149.33 Y147.05 E.00931
G1 X157.429 Y138.95 E.37996
G1 X156.302 Y138.95 E.03739
G1 X164.402 Y147.05 E.37996
G1 X164.682 Y147.05 E.00931
G1 X172.781 Y138.95 E.37996
G1 X171.654 Y138.95 E.03739
G1 X179.754 Y147.05 E.37996
G1 X180.034 Y147.05 E.00931
G1 X188.133 Y138.95 E.37996
G1 X187.006 Y138.95 E.03739
G1 X195.105 Y147.05 E.37996
G1 X195.386 Y147.05 E.00931
G1 X203.485 Y138.95 E.37996
G1 X202.358 Y138.95 E.03739
G1 X210.457 Y147.05 E.37996
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X205.95 Y134.867 E.37996
G1 X205.95 Y136.485 E.05369
G1 X214.05 Y128.386 E.37996
G1 X214.05 Y127.614 E.02561
G1 X205.95 Y119.515 E.37996
G1 X205.95 Y117.886 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y119.515 E-.61876
G1 X206.213 Y119.778 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/275
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
G3 Z3 I-.147 J-1.208 P1  F30000
G1 X54.398 Y138.21 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F14794
G1 X54.398 Y138.602 E.01301
G1 X205.602 Y138.602 E5.01572
G1 X205.602 Y108.602 E.99516
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y147.398 E1.28693
G1 X45.602 Y147.398 E5.59927
G1 X45.602 Y108.602 E1.28693
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y138.15 E.98016
G1 X54.79 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X205.21 Y138.21 E4.62199
G1 X205.21 Y108.21 E.92182
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y147.79 E1.21618
G1 X45.21 Y147.79 E5.21072
G1 X45.21 Y108.21 E1.21618
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y138.15 E.91997
M204 S10000
; WIPE_START
G1 F24000
G1 X56.79 Y138.151 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.125 J1.211 P1  F30000
G1 X205.95 Y122.762 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14794
G1 X205.95 Y121.133 E.05401
G1 X214.05 Y113.034 E.37996
G1 X214.05 Y112.262 E.02561
G1 X210.738 Y108.95 E.15536
G1 X210.457 Y108.95 E.0093
G1 X205.95 Y113.457 E.21144
G1 X205.95 Y111.839 E.05369
G1 X214.05 Y119.938 E.37996
G1 X214.05 Y120.71 E.02561
G1 X205.95 Y128.809 E.37996
G1 X205.95 Y127.191 E.05369
G1 X214.05 Y135.29 E.37996
G1 X214.05 Y136.062 E.02561
G1 X203.062 Y147.05 E.51546
G1 X202.781 Y147.05 E.00931
G1 X194.682 Y138.95 E.37996
G1 X195.809 Y138.95 E.03739
G1 X187.71 Y147.05 E.37996
G1 X187.429 Y147.05 E.00931
G1 X179.33 Y138.95 E.37996
G1 X180.457 Y138.95 E.03739
G1 X172.358 Y147.05 E.37996
G1 X172.078 Y147.05 E.00931
G1 X163.978 Y138.95 E.37996
G1 X165.105 Y138.95 E.03739
G1 X157.006 Y147.05 E.37996
G1 X156.726 Y147.05 E.00931
G1 X148.626 Y138.95 E.37996
G1 X149.754 Y138.95 E.03739
G1 X141.654 Y147.05 E.37996
G1 X141.374 Y147.05 E.00931
G1 X133.274 Y138.95 E.37996
G1 X134.402 Y138.95 E.03739
G1 X126.302 Y147.05 E.37996
G1 X126.022 Y147.05 E.00931
G1 X117.922 Y138.95 E.37996
G1 X119.05 Y138.95 E.03739
G1 X110.95 Y147.05 E.37996
G1 X110.67 Y147.05 E.00931
G1 X102.571 Y138.95 E.37996
G1 X103.698 Y138.95 E.03739
G1 X95.598 Y147.05 E.37996
G1 X95.318 Y147.05 E.0093
G1 X87.219 Y138.95 E.37996
G1 X88.346 Y138.95 E.03739
G1 X80.246 Y147.05 E.37996
G1 X79.966 Y147.05 E.0093
G1 X71.867 Y138.95 E.37996
G1 X72.994 Y138.95 E.03739
G1 X64.895 Y147.05 E.37996
G1 X64.614 Y147.05 E.0093
G1 X56.515 Y138.95 E.37996
G1 X57.642 Y138.95 E.03739
G1 X49.543 Y147.05 E.37996
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X54.05 Y134.867 E.37996
G1 X54.05 Y136.485 E.05369
G1 X45.95 Y128.386 E.37996
G1 X45.95 Y127.614 E.02561
G1 X54.05 Y119.515 E.37996
G1 X54.05 Y121.133 E.05369
G1 X45.95 Y113.034 E.37996
G1 X45.95 Y112.262 E.02561
G1 X49.262 Y108.95 E.15536
G1 X49.543 Y108.95 E.00931
G1 X54.05 Y113.457 E.21143
G1 X54.05 Y111.839 E.05369
G1 X45.95 Y119.938 E.37996
G1 X45.95 Y120.71 E.02561
G1 X54.05 Y128.809 E.37996
G1 X54.05 Y127.191 E.05369
G1 X45.95 Y135.29 E.37996
G1 X45.95 Y136.062 E.02561
G1 X56.938 Y147.05 E.51546
G1 X57.219 Y147.05 E.0093
G1 X65.318 Y138.95 E.37996
G1 X64.191 Y138.95 E.03739
G1 X72.29 Y147.05 E.37996
G1 X72.57 Y147.05 E.0093
G1 X80.67 Y138.95 E.37996
G1 X79.543 Y138.95 E.03739
G1 X87.642 Y147.05 E.37996
G1 X87.922 Y147.05 E.0093
G1 X96.022 Y138.95 E.37996
G1 X94.895 Y138.95 E.03739
G1 X102.994 Y147.05 E.37996
G1 X103.274 Y147.05 E.00931
G1 X111.374 Y138.95 E.37996
G1 X110.246 Y138.95 E.03739
G1 X118.346 Y147.05 E.37996
G1 X118.626 Y147.05 E.00931
G1 X126.726 Y138.95 E.37996
G1 X125.598 Y138.95 E.03739
G1 X133.698 Y147.05 E.37996
G1 X133.978 Y147.05 E.00931
G1 X142.078 Y138.95 E.37996
G1 X140.95 Y138.95 E.03739
G1 X149.05 Y147.05 E.37996
G1 X149.33 Y147.05 E.00931
G1 X157.429 Y138.95 E.37996
G1 X156.302 Y138.95 E.03739
G1 X164.402 Y147.05 E.37996
G1 X164.682 Y147.05 E.00931
G1 X172.781 Y138.95 E.37996
G1 X171.654 Y138.95 E.03739
G1 X179.754 Y147.05 E.37996
G1 X180.034 Y147.05 E.00931
G1 X188.133 Y138.95 E.37996
G1 X187.006 Y138.95 E.03739
G1 X195.105 Y147.05 E.37996
G1 X195.386 Y147.05 E.00931
G1 X203.485 Y138.95 E.37996
G1 X202.358 Y138.95 E.03739
G1 X210.457 Y147.05 E.37996
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X205.95 Y134.867 E.37996
G1 X205.95 Y136.485 E.05369
G1 X214.05 Y128.386 E.37996
G1 X214.05 Y127.614 E.02561
G1 X205.95 Y119.515 E.37996
G1 X205.95 Y117.886 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y119.515 E-.61876
G1 X206.213 Y119.778 E-.14124
; WIPE_END
M73 P24 R41
G1 E-.04 F1800
; layer num/total_layer_count: 15/275
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
G3 Z3.2 I-.147 J-1.208 P1  F30000
G1 X54.398 Y138.21 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F14794
G1 X54.398 Y138.602 E.01301
G1 X205.602 Y138.602 E5.01572
G1 X205.602 Y108.602 E.99516
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y147.398 E1.28693
G1 X45.602 Y147.398 E5.59927
G1 X45.602 Y108.602 E1.28693
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y138.15 E.98016
G1 X54.79 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X205.21 Y138.21 E4.62199
G1 X205.21 Y108.21 E.92182
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y147.79 E1.21618
G1 X45.21 Y147.79 E5.21072
G1 X45.21 Y108.21 E1.21618
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y138.15 E.91997
M204 S10000
; WIPE_START
G1 F24000
G1 X56.79 Y138.151 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.125 J1.211 P1  F30000
G1 X205.95 Y122.762 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14794
G1 X205.95 Y121.133 E.05401
G1 X214.05 Y113.034 E.37996
G1 X214.05 Y112.262 E.02561
G1 X210.738 Y108.95 E.15536
G1 X210.457 Y108.95 E.0093
G1 X205.95 Y113.457 E.21144
G1 X205.95 Y111.839 E.05369
G1 X214.05 Y119.938 E.37996
G1 X214.05 Y120.71 E.02561
G1 X205.95 Y128.809 E.37996
G1 X205.95 Y127.191 E.05369
G1 X214.05 Y135.29 E.37996
G1 X214.05 Y136.062 E.02561
G1 X203.062 Y147.05 E.51546
G1 X202.781 Y147.05 E.00931
G1 X194.682 Y138.95 E.37996
G1 X195.809 Y138.95 E.03739
G1 X187.71 Y147.05 E.37996
G1 X187.429 Y147.05 E.00931
G1 X179.33 Y138.95 E.37996
G1 X180.457 Y138.95 E.03739
G1 X172.358 Y147.05 E.37996
G1 X172.078 Y147.05 E.00931
G1 X163.978 Y138.95 E.37996
G1 X165.105 Y138.95 E.03739
G1 X157.006 Y147.05 E.37996
G1 X156.726 Y147.05 E.00931
G1 X148.626 Y138.95 E.37996
G1 X149.754 Y138.95 E.03739
G1 X141.654 Y147.05 E.37996
G1 X141.374 Y147.05 E.00931
G1 X133.274 Y138.95 E.37996
G1 X134.402 Y138.95 E.03739
G1 X126.302 Y147.05 E.37996
G1 X126.022 Y147.05 E.00931
G1 X117.922 Y138.95 E.37996
G1 X119.05 Y138.95 E.03739
G1 X110.95 Y147.05 E.37996
G1 X110.67 Y147.05 E.00931
G1 X102.571 Y138.95 E.37996
G1 X103.698 Y138.95 E.03739
G1 X95.598 Y147.05 E.37996
G1 X95.318 Y147.05 E.0093
G1 X87.219 Y138.95 E.37996
G1 X88.346 Y138.95 E.03739
G1 X80.246 Y147.05 E.37996
G1 X79.966 Y147.05 E.0093
G1 X71.867 Y138.95 E.37996
G1 X72.994 Y138.95 E.03739
G1 X64.895 Y147.05 E.37996
G1 X64.614 Y147.05 E.0093
G1 X56.515 Y138.95 E.37996
G1 X57.642 Y138.95 E.03739
G1 X49.543 Y147.05 E.37996
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X54.05 Y134.867 E.37996
G1 X54.05 Y136.485 E.05369
G1 X45.95 Y128.386 E.37996
G1 X45.95 Y127.614 E.02561
G1 X54.05 Y119.515 E.37996
G1 X54.05 Y121.133 E.05369
G1 X45.95 Y113.034 E.37996
G1 X45.95 Y112.262 E.02561
G1 X49.262 Y108.95 E.15536
G1 X49.543 Y108.95 E.00931
G1 X54.05 Y113.457 E.21143
G1 X54.05 Y111.839 E.05369
G1 X45.95 Y119.938 E.37996
G1 X45.95 Y120.71 E.02561
G1 X54.05 Y128.809 E.37996
G1 X54.05 Y127.191 E.05369
G1 X45.95 Y135.29 E.37996
G1 X45.95 Y136.062 E.02561
G1 X56.938 Y147.05 E.51546
G1 X57.219 Y147.05 E.0093
G1 X65.318 Y138.95 E.37996
G1 X64.191 Y138.95 E.03739
G1 X72.29 Y147.05 E.37996
G1 X72.57 Y147.05 E.0093
G1 X80.67 Y138.95 E.37996
G1 X79.543 Y138.95 E.03739
G1 X87.642 Y147.05 E.37996
G1 X87.922 Y147.05 E.0093
G1 X96.022 Y138.95 E.37996
G1 X94.895 Y138.95 E.03739
G1 X102.994 Y147.05 E.37996
G1 X103.274 Y147.05 E.00931
G1 X111.374 Y138.95 E.37996
G1 X110.246 Y138.95 E.03739
G1 X118.346 Y147.05 E.37996
G1 X118.626 Y147.05 E.00931
G1 X126.726 Y138.95 E.37996
G1 X125.598 Y138.95 E.03739
G1 X133.698 Y147.05 E.37996
G1 X133.978 Y147.05 E.00931
G1 X142.078 Y138.95 E.37996
G1 X140.95 Y138.95 E.03739
G1 X149.05 Y147.05 E.37996
G1 X149.33 Y147.05 E.00931
G1 X157.429 Y138.95 E.37996
G1 X156.302 Y138.95 E.03739
G1 X164.402 Y147.05 E.37996
G1 X164.682 Y147.05 E.00931
G1 X172.781 Y138.95 E.37996
G1 X171.654 Y138.95 E.03739
G1 X179.754 Y147.05 E.37996
G1 X180.034 Y147.05 E.00931
G1 X188.133 Y138.95 E.37996
G1 X187.006 Y138.95 E.03739
G1 X195.105 Y147.05 E.37996
G1 X195.386 Y147.05 E.00931
G1 X203.485 Y138.95 E.37996
G1 X202.358 Y138.95 E.03739
G1 X210.457 Y147.05 E.37996
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X205.95 Y134.867 E.37996
G1 X205.95 Y136.485 E.05369
G1 X214.05 Y128.386 E.37996
G1 X214.05 Y127.614 E.02561
G1 X205.95 Y119.515 E.37996
G1 X205.95 Y117.886 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y119.515 E-.61876
G1 X206.213 Y119.778 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/275
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
G3 Z3.4 I-.147 J-1.208 P1  F30000
G1 X54.398 Y138.21 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F14794
G1 X54.398 Y138.602 E.01301
G1 X205.602 Y138.602 E5.01572
G1 X205.602 Y108.602 E.99516
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y147.398 E1.28693
G1 X45.602 Y147.398 E5.59927
G1 X45.602 Y108.602 E1.28693
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y138.15 E.98016
G1 X54.79 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X205.21 Y138.21 E4.62199
G1 X205.21 Y108.21 E.92182
G1 X214.79 Y108.21 E.29437
M73 P25 R41
G1 X214.79 Y147.79 E1.21618
G1 X45.21 Y147.79 E5.21072
G1 X45.21 Y108.21 E1.21618
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y138.15 E.91997
M204 S10000
; WIPE_START
G1 F24000
G1 X56.79 Y138.151 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.125 J1.211 P1  F30000
G1 X205.95 Y122.762 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14794
G1 X205.95 Y121.133 E.05401
G1 X214.05 Y113.034 E.37996
G1 X214.05 Y112.262 E.02561
G1 X210.738 Y108.95 E.15536
G1 X210.457 Y108.95 E.0093
G1 X205.95 Y113.457 E.21144
G1 X205.95 Y111.839 E.05369
G1 X214.05 Y119.938 E.37996
G1 X214.05 Y120.71 E.02561
G1 X205.95 Y128.809 E.37996
G1 X205.95 Y127.191 E.05369
G1 X214.05 Y135.29 E.37996
G1 X214.05 Y136.062 E.02561
G1 X203.062 Y147.05 E.51546
G1 X202.781 Y147.05 E.00931
G1 X194.682 Y138.95 E.37996
G1 X195.809 Y138.95 E.03739
G1 X187.71 Y147.05 E.37996
G1 X187.429 Y147.05 E.00931
G1 X179.33 Y138.95 E.37996
G1 X180.457 Y138.95 E.03739
G1 X172.358 Y147.05 E.37996
G1 X172.078 Y147.05 E.00931
G1 X163.978 Y138.95 E.37996
G1 X165.105 Y138.95 E.03739
G1 X157.006 Y147.05 E.37996
G1 X156.726 Y147.05 E.00931
G1 X148.626 Y138.95 E.37996
G1 X149.754 Y138.95 E.03739
G1 X141.654 Y147.05 E.37996
G1 X141.374 Y147.05 E.00931
G1 X133.274 Y138.95 E.37996
G1 X134.402 Y138.95 E.03739
G1 X126.302 Y147.05 E.37996
G1 X126.022 Y147.05 E.00931
G1 X117.922 Y138.95 E.37996
G1 X119.05 Y138.95 E.03739
G1 X110.95 Y147.05 E.37996
G1 X110.67 Y147.05 E.00931
G1 X102.571 Y138.95 E.37996
G1 X103.698 Y138.95 E.03739
G1 X95.598 Y147.05 E.37996
G1 X95.318 Y147.05 E.0093
G1 X87.219 Y138.95 E.37996
G1 X88.346 Y138.95 E.03739
G1 X80.246 Y147.05 E.37996
G1 X79.966 Y147.05 E.0093
G1 X71.867 Y138.95 E.37996
G1 X72.994 Y138.95 E.03739
G1 X64.895 Y147.05 E.37996
G1 X64.614 Y147.05 E.0093
G1 X56.515 Y138.95 E.37996
G1 X57.642 Y138.95 E.03739
G1 X49.543 Y147.05 E.37996
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X54.05 Y134.867 E.37996
G1 X54.05 Y136.485 E.05369
G1 X45.95 Y128.386 E.37996
G1 X45.95 Y127.614 E.02561
G1 X54.05 Y119.515 E.37996
G1 X54.05 Y121.133 E.05369
G1 X45.95 Y113.034 E.37996
G1 X45.95 Y112.262 E.02561
G1 X49.262 Y108.95 E.15536
G1 X49.543 Y108.95 E.00931
G1 X54.05 Y113.457 E.21143
G1 X54.05 Y111.839 E.05369
G1 X45.95 Y119.938 E.37996
G1 X45.95 Y120.71 E.02561
G1 X54.05 Y128.809 E.37996
G1 X54.05 Y127.191 E.05369
G1 X45.95 Y135.29 E.37996
G1 X45.95 Y136.062 E.02561
G1 X56.938 Y147.05 E.51546
G1 X57.219 Y147.05 E.0093
G1 X65.318 Y138.95 E.37996
G1 X64.191 Y138.95 E.03739
G1 X72.29 Y147.05 E.37996
G1 X72.57 Y147.05 E.0093
G1 X80.67 Y138.95 E.37996
G1 X79.543 Y138.95 E.03739
G1 X87.642 Y147.05 E.37996
G1 X87.922 Y147.05 E.0093
G1 X96.022 Y138.95 E.37996
G1 X94.895 Y138.95 E.03739
G1 X102.994 Y147.05 E.37996
G1 X103.274 Y147.05 E.00931
G1 X111.374 Y138.95 E.37996
G1 X110.246 Y138.95 E.03739
G1 X118.346 Y147.05 E.37996
G1 X118.626 Y147.05 E.00931
G1 X126.726 Y138.95 E.37996
G1 X125.598 Y138.95 E.03739
G1 X133.698 Y147.05 E.37996
G1 X133.978 Y147.05 E.00931
G1 X142.078 Y138.95 E.37996
G1 X140.95 Y138.95 E.03739
G1 X149.05 Y147.05 E.37996
G1 X149.33 Y147.05 E.00931
G1 X157.429 Y138.95 E.37996
G1 X156.302 Y138.95 E.03739
G1 X164.402 Y147.05 E.37996
G1 X164.682 Y147.05 E.00931
G1 X172.781 Y138.95 E.37996
G1 X171.654 Y138.95 E.03739
G1 X179.754 Y147.05 E.37996
G1 X180.034 Y147.05 E.00931
G1 X188.133 Y138.95 E.37996
G1 X187.006 Y138.95 E.03739
G1 X195.105 Y147.05 E.37996
G1 X195.386 Y147.05 E.00931
G1 X203.485 Y138.95 E.37996
G1 X202.358 Y138.95 E.03739
G1 X210.457 Y147.05 E.37996
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X205.95 Y134.867 E.37996
G1 X205.95 Y136.485 E.05369
G1 X214.05 Y128.386 E.37996
G1 X214.05 Y127.614 E.02561
G1 X205.95 Y119.515 E.37996
G1 X205.95 Y117.886 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y119.515 E-.61876
G1 X206.213 Y119.778 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/275
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
G3 Z3.6 I-.147 J-1.208 P1  F30000
G1 X54.398 Y138.21 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F14794
G1 X54.398 Y138.602 E.01301
G1 X205.602 Y138.602 E5.01572
G1 X205.602 Y108.602 E.99516
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y147.398 E1.28693
G1 X45.602 Y147.398 E5.59927
G1 X45.602 Y108.602 E1.28693
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y138.15 E.98016
G1 X54.79 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X205.21 Y138.21 E4.62199
G1 X205.21 Y108.21 E.92182
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y147.79 E1.21618
G1 X45.21 Y147.79 E5.21072
G1 X45.21 Y108.21 E1.21618
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y138.15 E.91997
M204 S10000
; WIPE_START
G1 F24000
G1 X56.79 Y138.151 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.125 J1.211 P1  F30000
G1 X205.95 Y122.762 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14794
G1 X205.95 Y121.133 E.05401
G1 X214.05 Y113.034 E.37996
G1 X214.05 Y112.262 E.02561
G1 X210.738 Y108.95 E.15536
G1 X210.457 Y108.95 E.0093
G1 X205.95 Y113.457 E.21144
G1 X205.95 Y111.839 E.05369
G1 X214.05 Y119.938 E.37996
G1 X214.05 Y120.71 E.02561
G1 X205.95 Y128.809 E.37996
G1 X205.95 Y127.191 E.05369
G1 X214.05 Y135.29 E.37996
G1 X214.05 Y136.062 E.02561
G1 X203.062 Y147.05 E.51546
G1 X202.781 Y147.05 E.00931
G1 X194.682 Y138.95 E.37996
G1 X195.809 Y138.95 E.03739
G1 X187.71 Y147.05 E.37996
G1 X187.429 Y147.05 E.00931
G1 X179.33 Y138.95 E.37996
G1 X180.457 Y138.95 E.03739
G1 X172.358 Y147.05 E.37996
G1 X172.078 Y147.05 E.00931
G1 X163.978 Y138.95 E.37996
G1 X165.105 Y138.95 E.03739
G1 X157.006 Y147.05 E.37996
G1 X156.726 Y147.05 E.00931
G1 X148.626 Y138.95 E.37996
G1 X149.754 Y138.95 E.03739
G1 X141.654 Y147.05 E.37996
G1 X141.374 Y147.05 E.00931
G1 X133.274 Y138.95 E.37996
G1 X134.402 Y138.95 E.03739
G1 X126.302 Y147.05 E.37996
G1 X126.022 Y147.05 E.00931
G1 X117.922 Y138.95 E.37996
G1 X119.05 Y138.95 E.03739
G1 X110.95 Y147.05 E.37996
G1 X110.67 Y147.05 E.00931
G1 X102.571 Y138.95 E.37996
G1 X103.698 Y138.95 E.03739
G1 X95.598 Y147.05 E.37996
G1 X95.318 Y147.05 E.0093
G1 X87.219 Y138.95 E.37996
G1 X88.346 Y138.95 E.03739
G1 X80.246 Y147.05 E.37996
G1 X79.966 Y147.05 E.0093
G1 X71.867 Y138.95 E.37996
G1 X72.994 Y138.95 E.03739
G1 X64.895 Y147.05 E.37996
G1 X64.614 Y147.05 E.0093
G1 X56.515 Y138.95 E.37996
G1 X57.642 Y138.95 E.03739
G1 X49.543 Y147.05 E.37996
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X54.05 Y134.867 E.37996
G1 X54.05 Y136.485 E.05369
G1 X45.95 Y128.386 E.37996
G1 X45.95 Y127.614 E.02561
G1 X54.05 Y119.515 E.37996
G1 X54.05 Y121.133 E.05369
G1 X45.95 Y113.034 E.37996
G1 X45.95 Y112.262 E.02561
G1 X49.262 Y108.95 E.15536
G1 X49.543 Y108.95 E.00931
G1 X54.05 Y113.457 E.21143
G1 X54.05 Y111.839 E.05369
G1 X45.95 Y119.938 E.37996
G1 X45.95 Y120.71 E.02561
G1 X54.05 Y128.809 E.37996
G1 X54.05 Y127.191 E.05369
G1 X45.95 Y135.29 E.37996
G1 X45.95 Y136.062 E.02561
G1 X56.938 Y147.05 E.51546
G1 X57.219 Y147.05 E.0093
G1 X65.318 Y138.95 E.37996
G1 X64.191 Y138.95 E.03739
G1 X72.29 Y147.05 E.37996
G1 X72.57 Y147.05 E.0093
G1 X80.67 Y138.95 E.37996
G1 X79.543 Y138.95 E.03739
G1 X87.642 Y147.05 E.37996
G1 X87.922 Y147.05 E.0093
G1 X96.022 Y138.95 E.37996
G1 X94.895 Y138.95 E.03739
G1 X102.994 Y147.05 E.37996
G1 X103.274 Y147.05 E.00931
G1 X111.374 Y138.95 E.37996
G1 X110.246 Y138.95 E.03739
G1 X118.346 Y147.05 E.37996
G1 X118.626 Y147.05 E.00931
G1 X126.726 Y138.95 E.37996
G1 X125.598 Y138.95 E.03739
G1 X133.698 Y147.05 E.37996
G1 X133.978 Y147.05 E.00931
G1 X142.078 Y138.95 E.37996
G1 X140.95 Y138.95 E.03739
G1 X149.05 Y147.05 E.37996
G1 X149.33 Y147.05 E.00931
G1 X157.429 Y138.95 E.37996
G1 X156.302 Y138.95 E.03739
G1 X164.402 Y147.05 E.37996
G1 X164.682 Y147.05 E.00931
G1 X172.781 Y138.95 E.37996
G1 X171.654 Y138.95 E.03739
G1 X179.754 Y147.05 E.37996
G1 X180.034 Y147.05 E.00931
G1 X188.133 Y138.95 E.37996
G1 X187.006 Y138.95 E.03739
G1 X195.105 Y147.05 E.37996
G1 X195.386 Y147.05 E.00931
G1 X203.485 Y138.95 E.37996
G1 X202.358 Y138.95 E.03739
G1 X210.457 Y147.05 E.37996
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X205.95 Y134.867 E.37996
G1 X205.95 Y136.485 E.05369
G1 X214.05 Y128.386 E.37996
G1 X214.05 Y127.614 E.02561
G1 X205.95 Y119.515 E.37996
G1 X205.95 Y117.886 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y119.515 E-.61876
G1 X206.213 Y119.778 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/275
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
G3 Z3.8 I-.147 J-1.208 P1  F30000
G1 X54.398 Y138.21 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F14794
G1 X54.398 Y138.602 E.01301
G1 X205.602 Y138.602 E5.01572
G1 X205.602 Y108.602 E.99516
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y147.398 E1.28693
G1 X45.602 Y147.398 E5.59927
G1 X45.602 Y108.602 E1.28693
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y138.15 E.98016
G1 X54.79 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X205.21 Y138.21 E4.62199
G1 X205.21 Y108.21 E.92182
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y147.79 E1.21618
G1 X45.21 Y147.79 E5.21072
G1 X45.21 Y108.21 E1.21618
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y138.15 E.91997
M204 S10000
; WIPE_START
G1 F24000
G1 X56.79 Y138.151 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.125 J1.211 P1  F30000
G1 X205.95 Y122.762 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F14794
G1 X205.95 Y121.133 E.05401
G1 X214.05 Y113.034 E.37996
G1 X214.05 Y112.262 E.02561
G1 X210.738 Y108.95 E.15536
G1 X210.457 Y108.95 E.0093
G1 X205.95 Y113.457 E.21144
G1 X205.95 Y111.839 E.05369
G1 X214.05 Y119.938 E.37996
G1 X214.05 Y120.71 E.02561
G1 X205.95 Y128.809 E.37996
G1 X205.95 Y127.191 E.05369
G1 X214.05 Y135.29 E.37996
G1 X214.05 Y136.062 E.02561
G1 X203.062 Y147.05 E.51546
G1 X202.781 Y147.05 E.00931
G1 X194.682 Y138.95 E.37996
G1 X195.809 Y138.95 E.03739
G1 X187.71 Y147.05 E.37996
G1 X187.429 Y147.05 E.00931
G1 X179.33 Y138.95 E.37996
G1 X180.457 Y138.95 E.03739
G1 X172.358 Y147.05 E.37996
G1 X172.078 Y147.05 E.00931
G1 X163.978 Y138.95 E.37996
G1 X165.105 Y138.95 E.03739
G1 X157.006 Y147.05 E.37996
G1 X156.726 Y147.05 E.00931
G1 X148.626 Y138.95 E.37996
G1 X149.754 Y138.95 E.03739
G1 X141.654 Y147.05 E.37996
G1 X141.374 Y147.05 E.00931
G1 X133.274 Y138.95 E.37996
G1 X134.402 Y138.95 E.03739
G1 X126.302 Y147.05 E.37996
G1 X126.022 Y147.05 E.00931
G1 X117.922 Y138.95 E.37996
G1 X119.05 Y138.95 E.03739
G1 X110.95 Y147.05 E.37996
G1 X110.67 Y147.05 E.00931
G1 X102.571 Y138.95 E.37996
G1 X103.698 Y138.95 E.03739
G1 X95.598 Y147.05 E.37996
G1 X95.318 Y147.05 E.0093
G1 X87.219 Y138.95 E.37996
G1 X88.346 Y138.95 E.03739
G1 X80.246 Y147.05 E.37996
G1 X79.966 Y147.05 E.0093
G1 X71.867 Y138.95 E.37996
G1 X72.994 Y138.95 E.03739
G1 X64.895 Y147.05 E.37996
G1 X64.614 Y147.05 E.0093
G1 X56.515 Y138.95 E.37996
G1 X57.642 Y138.95 E.03739
G1 X49.543 Y147.05 E.37996
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X54.05 Y134.867 E.37996
G1 X54.05 Y136.485 E.05369
G1 X45.95 Y128.386 E.37996
G1 X45.95 Y127.614 E.02561
G1 X54.05 Y119.515 E.37996
G1 X54.05 Y121.133 E.05369
G1 X45.95 Y113.034 E.37996
G1 X45.95 Y112.262 E.02561
G1 X49.262 Y108.95 E.15536
G1 X49.543 Y108.95 E.00931
G1 X54.05 Y113.457 E.21143
G1 X54.05 Y111.839 E.05369
G1 X45.95 Y119.938 E.37996
G1 X45.95 Y120.71 E.02561
G1 X54.05 Y128.809 E.37996
G1 X54.05 Y127.191 E.05369
G1 X45.95 Y135.29 E.37996
G1 X45.95 Y136.062 E.02561
G1 X56.938 Y147.05 E.51546
G1 X57.219 Y147.05 E.0093
G1 X65.318 Y138.95 E.37996
G1 X64.191 Y138.95 E.03739
G1 X72.29 Y147.05 E.37996
G1 X72.57 Y147.05 E.0093
G1 X80.67 Y138.95 E.37996
G1 X79.543 Y138.95 E.03739
G1 X87.642 Y147.05 E.37996
G1 X87.922 Y147.05 E.0093
G1 X96.022 Y138.95 E.37996
G1 X94.895 Y138.95 E.03739
G1 X102.994 Y147.05 E.37996
G1 X103.274 Y147.05 E.00931
G1 X111.374 Y138.95 E.37996
G1 X110.246 Y138.95 E.03739
G1 X118.346 Y147.05 E.37996
G1 X118.626 Y147.05 E.00931
G1 X126.726 Y138.95 E.37996
G1 X125.598 Y138.95 E.03739
G1 X133.698 Y147.05 E.37996
G1 X133.978 Y147.05 E.00931
G1 X142.078 Y138.95 E.37996
G1 X140.95 Y138.95 E.03739
G1 X149.05 Y147.05 E.37996
G1 X149.33 Y147.05 E.00931
G1 X157.429 Y138.95 E.37996
G1 X156.302 Y138.95 E.03739
G1 X164.402 Y147.05 E.37996
G1 X164.682 Y147.05 E.00931
G1 X172.781 Y138.95 E.37996
G1 X171.654 Y138.95 E.03739
G1 X179.754 Y147.05 E.37996
G1 X180.034 Y147.05 E.00931
G1 X188.133 Y138.95 E.37996
G1 X187.006 Y138.95 E.03739
G1 X195.105 Y147.05 E.37996
G1 X195.386 Y147.05 E.00931
G1 X203.485 Y138.95 E.37996
G1 X202.358 Y138.95 E.03739
G1 X210.457 Y147.05 E.37996
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X205.95 Y134.867 E.37996
G1 X205.95 Y136.485 E.05369
G1 X214.05 Y128.386 E.37996
G1 X214.05 Y127.614 E.02561
G1 X205.95 Y119.515 E.37996
G1 X205.95 Y117.886 E.05401
M106 S249.9
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y119.515 E-.61876
G1 X206.213 Y119.778 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/275
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
G3 Z4 I-.147 J-1.208 P1  F30000
G1 X54.398 Y138.21 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X54.398 Y138.602 E.01301
G1 X205.602 Y138.602 E5.01572
G1 X205.602 Y108.602 E.99516
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y147.398 E1.28693
G1 X45.602 Y147.398 E5.59927
G1 X45.602 Y108.602 E1.28693
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y138.15 E.98016
G1 X54.79 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X205.21 Y138.21 E4.62199
G1 X205.21 Y108.21 E.92182
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y147.79 E1.21618
G1 X45.21 Y147.79 E5.21072
G1 X45.21 Y108.21 E1.21618
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y138.15 E.91997
M204 S10000
; WIPE_START
G1 F24000
G1 X56.79 Y138.151 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.317 J-1.175 P1  F30000
G1 X54.05 Y138.89 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X54.05 Y111.756 E.9001
M73 P26 R41
G1 X45.95 Y111.756 E.26867
G1 X45.95 Y139.138 E.90832
G1 X53.756 Y139.138 E.25892
G1 X53.756 Y147.05 E.26244
G1 X206.244 Y147.05 E5.05832
G1 X206.244 Y139.244 E.25892
G1 X214.05 Y139.244 E.25892
G1 X214.05 Y111.756 E.91184
G1 X205.95 Y111.756 E.26867
G1 X205.95 Y138.95 E.90209
G1 X54.05 Y138.95 E5.03882
G1 X54.163 Y140.801 F30000
G1 F15476.087
G1 X54.163 Y142.429 E.05401
G1 X57.235 Y139.357 E.14411
G1 X56.922 Y139.357 E.01038
G1 X64.207 Y146.643 E.34176
G1 X65.302 Y146.643 E.03631
G1 X72.587 Y139.357 E.34176
G1 X72.274 Y139.357 E.01038
G1 X79.559 Y146.643 E.34176
G1 X80.654 Y146.643 E.03631
G1 X87.939 Y139.357 E.34176
G1 X87.626 Y139.357 E.01038
G1 X94.911 Y146.643 E.34176
G1 X96.005 Y146.643 E.03631
G1 X103.291 Y139.357 E.34176
G1 X102.978 Y139.357 E.01038
G1 X110.263 Y146.643 E.34176
G1 X111.357 Y146.643 E.03631
G1 X118.643 Y139.357 E.34176
G1 X118.33 Y139.357 E.01038
G1 X125.615 Y146.643 E.34176
G1 X126.709 Y146.643 E.03631
G1 X133.995 Y139.357 E.34176
G1 X133.681 Y139.357 E.01038
G1 X140.967 Y146.643 E.34176
G1 X142.061 Y146.643 E.03631
G1 X149.346 Y139.357 E.34176
G1 X149.033 Y139.357 E.01038
G1 X156.319 Y146.643 E.34176
G1 X157.413 Y146.643 E.03631
G1 X164.698 Y139.357 E.34176
G1 X164.385 Y139.357 E.01038
G1 X171.67 Y146.643 E.34176
G1 X172.765 Y146.643 E.03631
G1 X180.05 Y139.357 E.34176
G1 X179.737 Y139.357 E.01038
G1 X187.022 Y146.643 E.34176
G1 X188.117 Y146.643 E.03631
G1 X195.402 Y139.357 E.34176
G1 X195.089 Y139.357 E.01038
G1 X202.374 Y146.643 E.34176
G1 X203.469 Y146.643 E.03631
G1 X205.837 Y144.274 E.11109
G1 X205.837 Y142.429 E.0612
G1 X202.765 Y139.357 E.14411
G1 X203.078 Y139.357 E.01038
G1 X195.793 Y146.643 E.34176
G1 X194.698 Y146.643 E.03631
G1 X187.413 Y139.357 E.34176
G1 X187.726 Y139.357 E.01038
G1 X180.441 Y146.643 E.34176
G1 X179.346 Y146.643 E.03631
G1 X172.061 Y139.357 E.34176
G1 X172.374 Y139.357 E.01038
G1 X165.089 Y146.643 E.34176
G1 X163.995 Y146.643 E.03631
G1 X156.709 Y139.357 E.34176
G1 X157.022 Y139.357 E.01038
G1 X149.737 Y146.643 E.34176
G1 X148.643 Y146.643 E.03631
G1 X141.357 Y139.357 E.34176
G1 X141.67 Y139.357 E.01038
G1 X134.385 Y146.643 E.34176
G1 X133.291 Y146.643 E.03631
G1 X126.005 Y139.357 E.34176
G1 X126.319 Y139.357 E.01038
G1 X119.033 Y146.643 E.34176
G1 X117.939 Y146.643 E.03631
G1 X110.654 Y139.357 E.34176
G1 X110.967 Y139.357 E.01038
G1 X103.681 Y146.643 E.34176
G1 X102.587 Y146.643 E.03631
G1 X95.302 Y139.357 E.34176
G1 X95.615 Y139.357 E.01038
G1 X88.33 Y146.643 E.34176
G1 X87.235 Y146.643 E.03631
G1 X79.95 Y139.357 E.34176
G1 X80.263 Y139.357 E.01038
G1 X72.978 Y146.643 E.34176
G1 X71.883 Y146.643 E.03631
G1 X64.598 Y139.357 E.34176
G1 X64.911 Y139.357 E.01038
G1 X57.626 Y146.643 E.34176
G1 X56.531 Y146.643 E.03631
G1 X54.163 Y144.274 E.11109
G1 X54.163 Y145.903 E.05401
G1 X45.95 Y145.366 F30000
G1 F15476.087
G1 X45.95 Y143.738 E.05401
G1 X49.262 Y147.05 E.15536
G1 X49.543 Y147.05 E.0093
G1 X53.349 Y143.244 E.17855
G1 X53.349 Y143.46 E.00719
G1 X49.434 Y139.545 E.18367
G1 X49.371 Y139.545 E.00207
G1 X45.95 Y142.966 E.16048
G1 X45.95 Y141.338 E.05401
G1 X46.357 Y115.069 F30000
G1 F15476.087
G1 X46.357 Y113.441 E.05401
G1 X53.643 Y120.726 E.34176
G1 X53.643 Y119.922 E.02669
G1 X46.357 Y127.207 E.34176
G1 X46.357 Y128.793 E.05261
G1 X53.643 Y136.078 E.34176
G1 X53.643 Y135.274 E.02669
G1 X50.185 Y138.731 E.16219
G1 X48.619 Y138.731 E.05194
G1 X46.357 Y136.469 E.10611
G1 X46.357 Y134.883 E.05261
G1 X53.643 Y127.598 E.34176
G1 X53.643 Y128.402 E.02669
G1 X46.357 Y121.117 E.34176
G1 X46.357 Y119.531 E.05261
G1 X53.643 Y112.246 E.34176
G1 X53.643 Y113.05 E.02669
G1 X52.755 Y112.163 E.04163
G1 X51.127 Y112.163 E.05401
G1 X53.569 Y111.349 F30000
G1 F15476.087
G1 X51.941 Y111.349 E.05401
G1 X49.543 Y108.95 E.11251
G1 X49.262 Y108.95 E.00931
G1 X46.864 Y111.349 E.11251
G1 X45.95 Y111.349 E.0303
G1 X45.95 Y110.634 E.02372
; WIPE_START
G1 F24000
G1 X45.95 Y111.349 E-.27167
G1 X46.864 Y111.349 E-.34709
G1 X47.127 Y111.086 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-.002 J1.217 P1  F30000
G1 X206.431 Y111.349 Z4.2
G1 Z3.8
G1 E.8 F1800
G1 F15476.087
G1 X208.059 Y111.349 E.05401
G1 X210.457 Y108.95 E.11251
G1 X210.738 Y108.95 E.0093
G1 X213.136 Y111.349 E.11251
G1 X214.05 Y111.349 E.0303
G1 X214.05 Y110.634 E.02372
G1 X213.293 Y112.163 F30000
G1 F15476.087
G1 X213.643 Y112.163 E.01161
G1 X213.643 Y113.441 E.0424
G1 X206.357 Y120.726 E.34176
G1 X206.357 Y119.922 E.02669
G1 X213.643 Y127.207 E.34176
G1 X213.643 Y128.793 E.05261
G1 X206.357 Y136.078 E.34176
G1 X206.357 Y135.274 E.02669
G1 X209.921 Y138.837 E.16717
G1 X211.274 Y138.837 E.0449
G1 X213.643 Y136.469 E.11109
G1 X213.643 Y134.883 E.05261
G1 X206.357 Y127.598 E.34176
G1 X206.357 Y128.402 E.02669
G1 X213.643 Y121.117 E.34176
G1 X213.643 Y119.531 E.05261
G1 X206.357 Y112.246 E.34176
G1 X206.357 Y113.05 E.02669
G1 X207.245 Y112.163 E.04163
G1 X208.873 Y112.163 E.05401
G1 X214.05 Y141.338 F30000
G1 F15476.087
G1 X214.05 Y142.966 E.05401
G1 X210.735 Y139.651 E.1555
G1 X210.46 Y139.651 E.00911
G1 X206.651 Y143.46 E.17869
G1 X206.651 Y143.244 E.00719
G1 X210.457 Y147.05 E.17855
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y145.366 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X214.05 Y143.738 E-.61876
G1 X213.787 Y144.001 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/275
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
G3 Z4.2 I.044 J-1.216 P1  F30000
G1 X54.398 Y138.21 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X54.398 Y138.602 E.01301
G1 X205.602 Y138.602 E5.01572
G1 X205.602 Y108.602 E.99516
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y147.398 E1.28693
G1 X45.602 Y147.398 E5.59927
G1 X45.602 Y108.602 E1.28693
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y138.15 E.98016
G1 X54.79 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X205.21 Y138.21 E4.62199
G1 X205.21 Y108.21 E.92182
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y147.79 E1.21618
G1 X45.21 Y147.79 E5.21072
G1 X45.21 Y108.21 E1.21618
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y138.15 E.91997
M204 S10000
; WIPE_START
G1 F24000
G1 X56.79 Y138.151 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.317 J-1.175 P1  F30000
G1 X54.05 Y138.89 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X54.05 Y111.756 E.9001
G1 X45.95 Y111.756 E.26867
G1 X45.95 Y139.138 E.90832
G1 X53.756 Y139.138 E.25892
G1 X53.756 Y147.05 E.26244
G1 X206.244 Y147.05 E5.05832
G1 X206.244 Y139.244 E.25892
G1 X214.05 Y139.244 E.25892
G1 X214.05 Y111.756 E.91184
G1 X205.95 Y111.756 E.26867
G1 X205.95 Y138.95 E.90209
G1 X54.05 Y138.95 E5.03882
G1 X54.163 Y140.801 F30000
G1 F15476.087
G1 X54.163 Y142.429 E.05401
G1 X57.235 Y139.357 E.14411
G1 X56.922 Y139.357 E.01038
G1 X64.207 Y146.643 E.34176
G1 X65.302 Y146.643 E.03631
G1 X72.587 Y139.357 E.34176
G1 X72.274 Y139.357 E.01038
G1 X79.559 Y146.643 E.34176
M73 P26 R40
G1 X80.654 Y146.643 E.03631
G1 X87.939 Y139.357 E.34176
G1 X87.626 Y139.357 E.01038
G1 X94.911 Y146.643 E.34176
G1 X96.005 Y146.643 E.03631
G1 X103.291 Y139.357 E.34176
G1 X102.978 Y139.357 E.01038
G1 X110.263 Y146.643 E.34176
G1 X111.357 Y146.643 E.03631
G1 X118.643 Y139.357 E.34176
G1 X118.33 Y139.357 E.01038
G1 X125.615 Y146.643 E.34176
G1 X126.709 Y146.643 E.03631
G1 X133.995 Y139.357 E.34176
G1 X133.681 Y139.357 E.01038
G1 X140.967 Y146.643 E.34176
G1 X142.061 Y146.643 E.03631
G1 X149.346 Y139.357 E.34176
G1 X149.033 Y139.357 E.01038
G1 X156.319 Y146.643 E.34176
G1 X157.413 Y146.643 E.03631
G1 X164.698 Y139.357 E.34176
G1 X164.385 Y139.357 E.01038
G1 X171.67 Y146.643 E.34176
G1 X172.765 Y146.643 E.03631
G1 X180.05 Y139.357 E.34176
G1 X179.737 Y139.357 E.01038
G1 X187.022 Y146.643 E.34176
G1 X188.117 Y146.643 E.03631
G1 X195.402 Y139.357 E.34176
G1 X195.089 Y139.357 E.01038
G1 X202.374 Y146.643 E.34176
G1 X203.469 Y146.643 E.03631
G1 X205.837 Y144.274 E.11109
G1 X205.837 Y142.429 E.0612
G1 X202.765 Y139.357 E.14411
G1 X203.078 Y139.357 E.01038
G1 X195.793 Y146.643 E.34176
G1 X194.698 Y146.643 E.03631
G1 X187.413 Y139.357 E.34176
G1 X187.726 Y139.357 E.01038
G1 X180.441 Y146.643 E.34176
G1 X179.346 Y146.643 E.03631
G1 X172.061 Y139.357 E.34176
G1 X172.374 Y139.357 E.01038
G1 X165.089 Y146.643 E.34176
G1 X163.995 Y146.643 E.03631
G1 X156.709 Y139.357 E.34176
G1 X157.022 Y139.357 E.01038
G1 X149.737 Y146.643 E.34176
G1 X148.643 Y146.643 E.03631
G1 X141.357 Y139.357 E.34176
G1 X141.67 Y139.357 E.01038
G1 X134.385 Y146.643 E.34176
G1 X133.291 Y146.643 E.03631
G1 X126.005 Y139.357 E.34176
G1 X126.319 Y139.357 E.01038
G1 X119.033 Y146.643 E.34176
G1 X117.939 Y146.643 E.03631
G1 X110.654 Y139.357 E.34176
G1 X110.967 Y139.357 E.01038
G1 X103.681 Y146.643 E.34176
G1 X102.587 Y146.643 E.03631
G1 X95.302 Y139.357 E.34176
G1 X95.615 Y139.357 E.01038
G1 X88.33 Y146.643 E.34176
G1 X87.235 Y146.643 E.03631
G1 X79.95 Y139.357 E.34176
G1 X80.263 Y139.357 E.01038
G1 X72.978 Y146.643 E.34176
G1 X71.883 Y146.643 E.03631
G1 X64.598 Y139.357 E.34176
G1 X64.911 Y139.357 E.01038
G1 X57.626 Y146.643 E.34176
G1 X56.531 Y146.643 E.03631
G1 X54.163 Y144.274 E.11109
G1 X54.163 Y145.903 E.05401
G1 X45.95 Y145.366 F30000
G1 F15476.087
G1 X45.95 Y143.738 E.05401
G1 X49.262 Y147.05 E.15536
G1 X49.543 Y147.05 E.0093
G1 X53.349 Y143.244 E.17855
G1 X53.349 Y143.46 E.00719
G1 X49.434 Y139.545 E.18367
G1 X49.371 Y139.545 E.00207
G1 X45.95 Y142.966 E.16048
G1 X45.95 Y141.338 E.05401
G1 X46.357 Y115.069 F30000
G1 F15476.087
G1 X46.357 Y113.441 E.05401
G1 X53.643 Y120.726 E.34176
G1 X53.643 Y119.922 E.02669
G1 X46.357 Y127.207 E.34176
G1 X46.357 Y128.793 E.05261
G1 X53.643 Y136.078 E.34176
G1 X53.643 Y135.274 E.02669
G1 X50.185 Y138.731 E.16219
G1 X48.619 Y138.731 E.05194
G1 X46.357 Y136.469 E.10611
G1 X46.357 Y134.883 E.05261
G1 X53.643 Y127.598 E.34176
G1 X53.643 Y128.402 E.02669
G1 X46.357 Y121.117 E.34176
G1 X46.357 Y119.531 E.05261
G1 X53.643 Y112.246 E.34176
G1 X53.643 Y113.05 E.02669
G1 X52.755 Y112.163 E.04163
G1 X51.127 Y112.163 E.05401
G1 X53.569 Y111.349 F30000
G1 F15476.087
G1 X51.941 Y111.349 E.05401
G1 X49.543 Y108.95 E.11251
G1 X49.262 Y108.95 E.00931
G1 X46.864 Y111.349 E.11251
G1 X45.95 Y111.349 E.0303
G1 X45.95 Y110.634 E.02372
; WIPE_START
G1 F24000
G1 X45.95 Y111.349 E-.27167
G1 X46.864 Y111.349 E-.34709
G1 X47.127 Y111.086 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-.002 J1.217 P1  F30000
G1 X206.431 Y111.349 Z4.4
G1 Z4
G1 E.8 F1800
G1 F15476.087
G1 X208.059 Y111.349 E.05401
G1 X210.457 Y108.95 E.11251
G1 X210.738 Y108.95 E.0093
G1 X213.136 Y111.349 E.11251
G1 X214.05 Y111.349 E.0303
G1 X214.05 Y110.634 E.02372
G1 X213.293 Y112.163 F30000
G1 F15476.087
G1 X213.643 Y112.163 E.01161
G1 X213.643 Y113.441 E.0424
G1 X206.357 Y120.726 E.34176
G1 X206.357 Y119.922 E.02669
G1 X213.643 Y127.207 E.34176
G1 X213.643 Y128.793 E.05261
G1 X206.357 Y136.078 E.34176
G1 X206.357 Y135.274 E.02669
G1 X209.921 Y138.837 E.16717
G1 X211.274 Y138.837 E.0449
G1 X213.643 Y136.469 E.11109
G1 X213.643 Y134.883 E.05261
G1 X206.357 Y127.598 E.34176
G1 X206.357 Y128.402 E.02669
G1 X213.643 Y121.117 E.34176
G1 X213.643 Y119.531 E.05261
G1 X206.357 Y112.246 E.34176
G1 X206.357 Y113.05 E.02669
G1 X207.245 Y112.163 E.04163
G1 X208.873 Y112.163 E.05401
G1 X214.05 Y141.338 F30000
G1 F15476.087
G1 X214.05 Y142.966 E.05401
G1 X210.735 Y139.651 E.1555
G1 X210.46 Y139.651 E.00911
G1 X206.651 Y143.46 E.17869
G1 X206.651 Y143.244 E.00719
G1 X210.457 Y147.05 E.17855
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y145.366 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X214.05 Y143.738 E-.61876
G1 X213.787 Y144.001 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/275
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
G3 Z4.4 I.044 J-1.216 P1  F30000
G1 X54.398 Y138.21 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X54.398 Y138.602 E.01301
G1 X205.602 Y138.602 E5.01572
G1 X205.602 Y108.602 E.99516
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y147.398 E1.28693
G1 X45.602 Y147.398 E5.59927
G1 X45.602 Y108.602 E1.28693
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y138.15 E.98016
G1 X54.79 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X205.21 Y138.21 E4.62199
G1 X205.21 Y108.21 E.92182
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y147.79 E1.21618
G1 X45.21 Y147.79 E5.21072
G1 X45.21 Y108.21 E1.21618
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y138.15 E.91997
M204 S10000
; WIPE_START
G1 F24000
G1 X56.79 Y138.151 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.317 J-1.175 P1  F30000
G1 X54.05 Y138.89 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X54.05 Y111.756 E.9001
G1 X45.95 Y111.756 E.26867
G1 X45.95 Y139.138 E.90832
G1 X53.756 Y139.138 E.25892
G1 X53.756 Y147.05 E.26244
G1 X206.244 Y147.05 E5.05832
G1 X206.244 Y139.244 E.25892
G1 X214.05 Y139.244 E.25892
G1 X214.05 Y111.756 E.91184
G1 X205.95 Y111.756 E.26867
G1 X205.95 Y138.95 E.90209
G1 X54.05 Y138.95 E5.03882
G1 X54.163 Y140.801 F30000
G1 F15476.087
G1 X54.163 Y142.429 E.05401
G1 X57.235 Y139.357 E.14411
G1 X56.922 Y139.357 E.01038
G1 X64.207 Y146.643 E.34176
G1 X65.302 Y146.643 E.03631
G1 X72.587 Y139.357 E.34176
G1 X72.274 Y139.357 E.01038
G1 X79.559 Y146.643 E.34176
G1 X80.654 Y146.643 E.03631
G1 X87.939 Y139.357 E.34176
G1 X87.626 Y139.357 E.01038
G1 X94.911 Y146.643 E.34176
G1 X96.005 Y146.643 E.03631
G1 X103.291 Y139.357 E.34176
G1 X102.978 Y139.357 E.01038
G1 X110.263 Y146.643 E.34176
G1 X111.357 Y146.643 E.03631
G1 X118.643 Y139.357 E.34176
G1 X118.33 Y139.357 E.01038
G1 X125.615 Y146.643 E.34176
G1 X126.709 Y146.643 E.03631
G1 X133.995 Y139.357 E.34176
G1 X133.681 Y139.357 E.01038
G1 X140.967 Y146.643 E.34176
G1 X142.061 Y146.643 E.03631
G1 X149.346 Y139.357 E.34176
G1 X149.033 Y139.357 E.01038
G1 X156.319 Y146.643 E.34176
G1 X157.413 Y146.643 E.03631
G1 X164.698 Y139.357 E.34176
G1 X164.385 Y139.357 E.01038
G1 X171.67 Y146.643 E.34176
G1 X172.765 Y146.643 E.03631
G1 X180.05 Y139.357 E.34176
G1 X179.737 Y139.357 E.01038
G1 X187.022 Y146.643 E.34176
G1 X188.117 Y146.643 E.03631
M73 P27 R40
G1 X195.402 Y139.357 E.34176
G1 X195.089 Y139.357 E.01038
G1 X202.374 Y146.643 E.34176
G1 X203.469 Y146.643 E.03631
G1 X205.837 Y144.274 E.11109
G1 X205.837 Y142.429 E.0612
G1 X202.765 Y139.357 E.14411
G1 X203.078 Y139.357 E.01038
G1 X195.793 Y146.643 E.34176
G1 X194.698 Y146.643 E.03631
G1 X187.413 Y139.357 E.34176
G1 X187.726 Y139.357 E.01038
G1 X180.441 Y146.643 E.34176
G1 X179.346 Y146.643 E.03631
G1 X172.061 Y139.357 E.34176
G1 X172.374 Y139.357 E.01038
G1 X165.089 Y146.643 E.34176
G1 X163.995 Y146.643 E.03631
G1 X156.709 Y139.357 E.34176
G1 X157.022 Y139.357 E.01038
G1 X149.737 Y146.643 E.34176
G1 X148.643 Y146.643 E.03631
G1 X141.357 Y139.357 E.34176
G1 X141.67 Y139.357 E.01038
G1 X134.385 Y146.643 E.34176
G1 X133.291 Y146.643 E.03631
G1 X126.005 Y139.357 E.34176
G1 X126.319 Y139.357 E.01038
G1 X119.033 Y146.643 E.34176
G1 X117.939 Y146.643 E.03631
G1 X110.654 Y139.357 E.34176
G1 X110.967 Y139.357 E.01038
G1 X103.681 Y146.643 E.34176
G1 X102.587 Y146.643 E.03631
G1 X95.302 Y139.357 E.34176
G1 X95.615 Y139.357 E.01038
G1 X88.33 Y146.643 E.34176
G1 X87.235 Y146.643 E.03631
G1 X79.95 Y139.357 E.34176
G1 X80.263 Y139.357 E.01038
G1 X72.978 Y146.643 E.34176
G1 X71.883 Y146.643 E.03631
G1 X64.598 Y139.357 E.34176
G1 X64.911 Y139.357 E.01038
G1 X57.626 Y146.643 E.34176
G1 X56.531 Y146.643 E.03631
G1 X54.163 Y144.274 E.11109
G1 X54.163 Y145.903 E.05401
G1 X45.95 Y145.366 F30000
G1 F15476.087
G1 X45.95 Y143.738 E.05401
G1 X49.262 Y147.05 E.15536
G1 X49.543 Y147.05 E.0093
G1 X53.349 Y143.244 E.17855
G1 X53.349 Y143.46 E.00719
G1 X49.434 Y139.545 E.18367
G1 X49.371 Y139.545 E.00207
G1 X45.95 Y142.966 E.16048
G1 X45.95 Y141.338 E.05401
G1 X46.357 Y115.069 F30000
G1 F15476.087
G1 X46.357 Y113.441 E.05401
G1 X53.643 Y120.726 E.34176
G1 X53.643 Y119.922 E.02669
G1 X46.357 Y127.207 E.34176
G1 X46.357 Y128.793 E.05261
G1 X53.643 Y136.078 E.34176
G1 X53.643 Y135.274 E.02669
G1 X50.185 Y138.731 E.16219
G1 X48.619 Y138.731 E.05194
G1 X46.357 Y136.469 E.10611
G1 X46.357 Y134.883 E.05261
G1 X53.643 Y127.598 E.34176
G1 X53.643 Y128.402 E.02669
G1 X46.357 Y121.117 E.34176
G1 X46.357 Y119.531 E.05261
G1 X53.643 Y112.246 E.34176
G1 X53.643 Y113.05 E.02669
G1 X52.755 Y112.163 E.04163
G1 X51.127 Y112.163 E.05401
G1 X53.569 Y111.349 F30000
G1 F15476.087
G1 X51.941 Y111.349 E.05401
G1 X49.543 Y108.95 E.11251
G1 X49.262 Y108.95 E.00931
G1 X46.864 Y111.349 E.11251
G1 X45.95 Y111.349 E.0303
G1 X45.95 Y110.634 E.02372
; WIPE_START
G1 F24000
G1 X45.95 Y111.349 E-.27167
G1 X46.864 Y111.349 E-.34709
G1 X47.127 Y111.086 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I-.002 J1.217 P1  F30000
G1 X206.431 Y111.349 Z4.6
G1 Z4.2
G1 E.8 F1800
G1 F15476.087
G1 X208.059 Y111.349 E.05401
G1 X210.457 Y108.95 E.11251
G1 X210.738 Y108.95 E.0093
G1 X213.136 Y111.349 E.11251
G1 X214.05 Y111.349 E.0303
G1 X214.05 Y110.634 E.02372
G1 X213.293 Y112.163 F30000
G1 F15476.087
G1 X213.643 Y112.163 E.01161
G1 X213.643 Y113.441 E.0424
G1 X206.357 Y120.726 E.34176
G1 X206.357 Y119.922 E.02669
G1 X213.643 Y127.207 E.34176
G1 X213.643 Y128.793 E.05261
G1 X206.357 Y136.078 E.34176
G1 X206.357 Y135.274 E.02669
G1 X209.921 Y138.837 E.16717
G1 X211.274 Y138.837 E.0449
G1 X213.643 Y136.469 E.11109
G1 X213.643 Y134.883 E.05261
G1 X206.357 Y127.598 E.34176
G1 X206.357 Y128.402 E.02669
G1 X213.643 Y121.117 E.34176
G1 X213.643 Y119.531 E.05261
G1 X206.357 Y112.246 E.34176
G1 X206.357 Y113.05 E.02669
G1 X207.245 Y112.163 E.04163
G1 X208.873 Y112.163 E.05401
G1 X214.05 Y141.338 F30000
G1 F15476.087
G1 X214.05 Y142.966 E.05401
G1 X210.735 Y139.651 E.1555
G1 X210.46 Y139.651 E.00911
G1 X206.651 Y143.46 E.17869
G1 X206.651 Y143.244 E.00719
G1 X210.457 Y147.05 E.17855
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y145.366 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X214.05 Y143.738 E-.61876
G1 X213.787 Y144.001 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/275
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
G3 Z4.6 I.044 J-1.216 P1  F30000
G1 X54.398 Y138.21 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X54.398 Y138.602 E.01301
G1 X205.602 Y138.602 E5.01572
G1 X205.602 Y108.602 E.99516
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y147.398 E1.28693
G1 X45.602 Y147.398 E5.59927
G1 X45.602 Y108.602 E1.28693
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y138.15 E.98016
G1 X54.79 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X205.21 Y138.21 E4.62199
G1 X205.21 Y108.21 E.92182
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y147.79 E1.21618
G1 X45.21 Y147.79 E5.21072
G1 X45.21 Y108.21 E1.21618
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y138.15 E.91997
M204 S10000
; WIPE_START
G1 F24000
G1 X56.79 Y138.151 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.317 J-1.175 P1  F30000
G1 X54.05 Y138.89 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X54.05 Y111.756 E.9001
G1 X45.95 Y111.756 E.26867
G1 X45.95 Y139.138 E.90832
G1 X53.756 Y139.138 E.25892
G1 X53.756 Y147.05 E.26244
G1 X206.244 Y147.05 E5.05832
G1 X206.244 Y139.244 E.25892
G1 X214.05 Y139.244 E.25892
G1 X214.05 Y111.756 E.91184
G1 X205.95 Y111.756 E.26867
G1 X205.95 Y138.95 E.90209
G1 X54.05 Y138.95 E5.03882
G1 X54.163 Y140.801 F30000
G1 F15476.087
G1 X54.163 Y142.429 E.05401
G1 X57.235 Y139.357 E.14411
G1 X56.922 Y139.357 E.01038
G1 X64.207 Y146.643 E.34176
G1 X65.302 Y146.643 E.03631
G1 X72.587 Y139.357 E.34176
G1 X72.274 Y139.357 E.01038
G1 X79.559 Y146.643 E.34176
G1 X80.654 Y146.643 E.03631
G1 X87.939 Y139.357 E.34176
G1 X87.626 Y139.357 E.01038
G1 X94.911 Y146.643 E.34176
G1 X96.005 Y146.643 E.03631
G1 X103.291 Y139.357 E.34176
G1 X102.978 Y139.357 E.01038
G1 X110.263 Y146.643 E.34176
G1 X111.357 Y146.643 E.03631
G1 X118.643 Y139.357 E.34176
G1 X118.33 Y139.357 E.01038
G1 X125.615 Y146.643 E.34176
G1 X126.709 Y146.643 E.03631
G1 X133.995 Y139.357 E.34176
G1 X133.681 Y139.357 E.01038
G1 X140.967 Y146.643 E.34176
G1 X142.061 Y146.643 E.03631
G1 X149.346 Y139.357 E.34176
G1 X149.033 Y139.357 E.01038
G1 X156.319 Y146.643 E.34176
G1 X157.413 Y146.643 E.03631
G1 X164.698 Y139.357 E.34176
G1 X164.385 Y139.357 E.01038
G1 X171.67 Y146.643 E.34176
G1 X172.765 Y146.643 E.03631
G1 X180.05 Y139.357 E.34176
G1 X179.737 Y139.357 E.01038
G1 X187.022 Y146.643 E.34176
G1 X188.117 Y146.643 E.03631
G1 X195.402 Y139.357 E.34176
G1 X195.089 Y139.357 E.01038
G1 X202.374 Y146.643 E.34176
G1 X203.469 Y146.643 E.03631
G1 X205.837 Y144.274 E.11109
G1 X205.837 Y142.429 E.0612
G1 X202.765 Y139.357 E.14411
G1 X203.078 Y139.357 E.01038
G1 X195.793 Y146.643 E.34176
G1 X194.698 Y146.643 E.03631
G1 X187.413 Y139.357 E.34176
G1 X187.726 Y139.357 E.01038
G1 X180.441 Y146.643 E.34176
G1 X179.346 Y146.643 E.03631
G1 X172.061 Y139.357 E.34176
G1 X172.374 Y139.357 E.01038
G1 X165.089 Y146.643 E.34176
G1 X163.995 Y146.643 E.03631
G1 X156.709 Y139.357 E.34176
G1 X157.022 Y139.357 E.01038
G1 X149.737 Y146.643 E.34176
G1 X148.643 Y146.643 E.03631
G1 X141.357 Y139.357 E.34176
G1 X141.67 Y139.357 E.01038
G1 X134.385 Y146.643 E.34176
G1 X133.291 Y146.643 E.03631
G1 X126.005 Y139.357 E.34176
G1 X126.319 Y139.357 E.01038
G1 X119.033 Y146.643 E.34176
G1 X117.939 Y146.643 E.03631
G1 X110.654 Y139.357 E.34176
G1 X110.967 Y139.357 E.01038
G1 X103.681 Y146.643 E.34176
G1 X102.587 Y146.643 E.03631
G1 X95.302 Y139.357 E.34176
G1 X95.615 Y139.357 E.01038
G1 X88.33 Y146.643 E.34176
G1 X87.235 Y146.643 E.03631
G1 X79.95 Y139.357 E.34176
G1 X80.263 Y139.357 E.01038
G1 X72.978 Y146.643 E.34176
G1 X71.883 Y146.643 E.03631
G1 X64.598 Y139.357 E.34176
G1 X64.911 Y139.357 E.01038
G1 X57.626 Y146.643 E.34176
G1 X56.531 Y146.643 E.03631
G1 X54.163 Y144.274 E.11109
G1 X54.163 Y145.903 E.05401
G1 X45.95 Y145.366 F30000
G1 F15476.087
G1 X45.95 Y143.738 E.05401
G1 X49.262 Y147.05 E.15536
G1 X49.543 Y147.05 E.0093
G1 X53.349 Y143.244 E.17855
G1 X53.349 Y143.46 E.00719
G1 X49.434 Y139.545 E.18367
G1 X49.371 Y139.545 E.00207
G1 X45.95 Y142.966 E.16048
G1 X45.95 Y141.338 E.05401
G1 X46.357 Y115.069 F30000
G1 F15476.087
G1 X46.357 Y113.441 E.05401
G1 X53.643 Y120.726 E.34176
G1 X53.643 Y119.922 E.02669
G1 X46.357 Y127.207 E.34176
G1 X46.357 Y128.793 E.05261
G1 X53.643 Y136.078 E.34176
G1 X53.643 Y135.274 E.02669
G1 X50.185 Y138.731 E.16219
G1 X48.619 Y138.731 E.05194
G1 X46.357 Y136.469 E.10611
G1 X46.357 Y134.883 E.05261
G1 X53.643 Y127.598 E.34176
G1 X53.643 Y128.402 E.02669
G1 X46.357 Y121.117 E.34176
G1 X46.357 Y119.531 E.05261
G1 X53.643 Y112.246 E.34176
G1 X53.643 Y113.05 E.02669
G1 X52.755 Y112.163 E.04163
G1 X51.127 Y112.163 E.05401
G1 X53.569 Y111.349 F30000
G1 F15476.087
G1 X51.941 Y111.349 E.05401
G1 X49.543 Y108.95 E.11251
G1 X49.262 Y108.95 E.00931
G1 X46.864 Y111.349 E.11251
G1 X45.95 Y111.349 E.0303
G1 X45.95 Y110.634 E.02372
; WIPE_START
G1 F24000
G1 X45.95 Y111.349 E-.27167
G1 X46.864 Y111.349 E-.34709
G1 X47.127 Y111.086 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I-.002 J1.217 P1  F30000
G1 X206.431 Y111.349 Z4.8
G1 Z4.4
G1 E.8 F1800
G1 F15476.087
G1 X208.059 Y111.349 E.05401
G1 X210.457 Y108.95 E.11251
G1 X210.738 Y108.95 E.0093
G1 X213.136 Y111.349 E.11251
G1 X214.05 Y111.349 E.0303
G1 X214.05 Y110.634 E.02372
G1 X213.293 Y112.163 F30000
G1 F15476.087
G1 X213.643 Y112.163 E.01161
G1 X213.643 Y113.441 E.0424
G1 X206.357 Y120.726 E.34176
G1 X206.357 Y119.922 E.02669
G1 X213.643 Y127.207 E.34176
G1 X213.643 Y128.793 E.05261
G1 X206.357 Y136.078 E.34176
G1 X206.357 Y135.274 E.02669
G1 X209.921 Y138.837 E.16717
G1 X211.274 Y138.837 E.0449
G1 X213.643 Y136.469 E.11109
G1 X213.643 Y134.883 E.05261
G1 X206.357 Y127.598 E.34176
G1 X206.357 Y128.402 E.02669
G1 X213.643 Y121.117 E.34176
G1 X213.643 Y119.531 E.05261
G1 X206.357 Y112.246 E.34176
G1 X206.357 Y113.05 E.02669
G1 X207.245 Y112.163 E.04163
G1 X208.873 Y112.163 E.05401
G1 X214.05 Y141.338 F30000
G1 F15476.087
G1 X214.05 Y142.966 E.05401
G1 X210.735 Y139.651 E.1555
G1 X210.46 Y139.651 E.00911
G1 X206.651 Y143.46 E.17869
G1 X206.651 Y143.244 E.00719
G1 X210.457 Y147.05 E.17855
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y145.366 E.05401
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X214.05 Y143.738 E-.61876
G1 X213.787 Y144.001 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/275
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
G3 Z4.8 I.044 J-1.216 P1  F30000
G1 X54.398 Y138.21 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X54.398 Y138.602 E.01301
G1 X205.602 Y138.602 E5.01572
G1 X205.602 Y108.602 E.99516
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y147.398 E1.28693
G1 X45.602 Y147.398 E5.59927
G1 X45.602 Y108.602 E1.28693
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y138.15 E.98016
G1 X54.79 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X205.21 Y138.21 E4.62199
G1 X205.21 Y108.21 E.92182
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y147.79 E1.21618
G1 X45.21 Y147.79 E5.21072
G1 X45.21 Y108.21 E1.21618
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y138.15 E.91997
M204 S10000
; WIPE_START
G1 F24000
G1 X56.79 Y138.151 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I-.139 J-1.209 P1  F30000
G1 X46.614 Y139.319 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.401086
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X45.972 Y138.87 E.04033
G1 X45.972 Y138.319 E.02835
G1 X47.111 Y139.117 E.07158
G1 X47.897 Y139.117 E.04048
G1 X45.972 Y137.768 E.121
G1 X45.972 Y137.218 E.02835
G1 X48.684 Y139.117 E.17042
G1 X49.47 Y139.117 E.04048
G1 X45.972 Y136.667 E.21984
G1 X45.972 Y136.116 E.02835
G1 X50.257 Y139.117 E.26927
G1 X51.043 Y139.117 E.04048
G1 X45.972 Y135.566 E.31869
G1 X45.972 Y135.015 E.02835
G1 X51.829 Y139.117 E.36811
G1 X52.616 Y139.117 E.04048
G1 X45.972 Y134.464 E.41754
G1 X45.972 Y133.914 E.02835
G1 X64.99 Y147.231 E1.1952
M106 S127.5
G1 X64.204 Y147.231 F30000
M106 S255
G1 F3000
G1 X53.777 Y139.93 E.65525
G1 X53.777 Y140.481 E.02835
G1 X63.128 Y147.028 E.58765
G1 X62.342 Y147.028 E.04048
G1 X53.777 Y141.031 E.53823
G1 X53.777 Y141.582 E.02835
G1 X61.555 Y147.028 E.48881
G1 X60.769 Y147.028 E.04048
G1 X53.777 Y142.133 E.43939
G1 X53.777 Y142.683 E.02835
G1 X59.983 Y147.028 E.38996
G1 X59.196 Y147.028 E.04048
G1 X53.777 Y143.234 E.34054
G1 X53.777 Y143.785 E.02835
G1 X58.41 Y147.028 E.29112
G1 X57.623 Y147.028 E.04048
G1 X53.777 Y144.335 E.24169
G1 X53.777 Y144.886 E.02835
G1 X56.837 Y147.028 E.19227
G1 X56.05 Y147.028 E.04048
G1 X53.777 Y145.437 E.14285
G1 X53.777 Y145.987 E.02835
G1 X55.264 Y147.028 E.09343
G1 X54.477 Y147.028 E.04048
G1 X53.575 Y146.396 E.05673
M106 S127.5
G1 X45.95 Y145.366 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X45.95 Y143.738 E.05401
G1 X49.262 Y147.05 E.15536
G1 X49.543 Y147.05 E.0093
G1 X53.349 Y143.244 E.17855
G1 X53.349 Y143.46 E.00719
G1 X49.434 Y139.545 E.18367
G1 X49.371 Y139.545 E.00207
G1 X45.95 Y142.966 E.16048
G1 X45.95 Y141.338 E.05401
G1 X45.95 Y110.634 F30000
G1 F15476.087
G1 X45.95 Y111.349 E.02372
G1 X46.864 Y111.349 E.0303
G1 X49.262 Y108.95 E.11251
G1 X49.543 Y108.95 E.00931
G1 X51.941 Y111.349 E.11251
G1 X53.569 Y111.349 E.05401
G1 X54.231 Y112.163 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.401086
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X53.68 Y111.777 E.03462
G1 X52.893 Y111.777 E.04048
G1 X54.028 Y112.572 E.07132
G1 X54.028 Y113.123 E.02835
G1 X52.107 Y111.777 E.12074
G1 X51.32 Y111.777 E.04048
G1 X54.028 Y113.673 E.17016
G1 X54.028 Y114.224 E.02835
G1 X50.534 Y111.777 E.21958
G1 X49.748 Y111.777 E.04048
G1 X54.028 Y114.775 E.26901
G1 X54.028 Y115.325 E.02835
G1 X48.961 Y111.777 E.31843
G1 X48.175 Y111.777 E.04048
G1 X54.028 Y115.876 E.36785
G1 X54.028 Y116.427 E.02835
G1 X47.388 Y111.777 E.41728
G1 X46.602 Y111.777 E.04048
G1 X54.028 Y116.977 E.4667
G1 X54.028 Y117.528 E.02835
G1 X45.972 Y111.887 E.50629
G1 X45.972 Y112.437 E.02835
G1 X54.028 Y118.079 E.50629
G1 X54.028 Y118.629 E.02835
G1 X45.972 Y112.988 E.50629
G1 X45.972 Y113.539 E.02835
G1 X54.028 Y119.18 E.50629
G1 X54.028 Y119.731 E.02835
G1 X45.972 Y114.089 E.50629
G1 X45.972 Y114.64 E.02835
G1 X54.028 Y120.281 E.50629
G1 X54.028 Y120.832 E.02835
G1 X45.972 Y115.191 E.50629
G1 X45.972 Y115.741 E.02835
G1 X54.028 Y121.383 E.50629
G1 X54.028 Y121.933 E.02835
G1 X45.972 Y116.292 E.50629
G1 X45.972 Y116.843 E.02835
G1 X54.028 Y122.484 E.50629
G1 X54.028 Y123.035 E.02835
G1 X45.972 Y117.394 E.50629
G1 X45.972 Y117.944 E.02835
G1 X54.028 Y123.585 E.50629
G1 X54.028 Y124.136 E.02835
G1 X45.972 Y118.495 E.50629
G1 X45.972 Y119.046 E.02835
G1 X54.028 Y124.687 E.50629
G1 X54.028 Y125.237 E.02835
G1 X45.972 Y119.596 E.50629
G1 X45.972 Y120.147 E.02835
G1 X54.028 Y125.788 E.50629
G1 X54.028 Y126.339 E.02835
G1 X45.972 Y120.698 E.50629
G1 X45.972 Y121.248 E.02835
G1 X54.028 Y126.889 E.50629
G1 X54.028 Y127.44 E.02835
G1 X45.972 Y121.799 E.50629
G1 X45.972 Y122.35 E.02835
G1 X54.028 Y127.991 E.50629
G1 X54.028 Y128.541 E.02835
G1 X45.972 Y122.9 E.50629
G1 X45.972 Y123.451 E.02835
G1 X54.028 Y129.092 E.50629
G1 X54.028 Y129.643 E.02835
G1 X45.972 Y124.002 E.50629
G1 X45.972 Y124.552 E.02835
G1 X54.028 Y130.193 E.50629
G1 X54.028 Y130.744 E.02835
G1 X45.972 Y125.103 E.50629
G1 X45.972 Y125.654 E.02835
G1 X54.028 Y131.295 E.50629
G1 X54.028 Y131.845 E.02835
G1 X45.972 Y126.204 E.50629
G1 X45.972 Y126.755 E.02835
G1 X54.028 Y132.396 E.50629
G1 X54.028 Y132.947 E.02835
G1 X45.972 Y127.306 E.50629
G1 X45.972 Y127.856 E.02835
G1 X54.028 Y133.497 E.50629
G1 X54.028 Y134.048 E.02835
M73 P28 R40
G1 X45.972 Y128.407 E.50629
G1 X45.972 Y128.958 E.02835
G1 X54.028 Y134.599 E.50629
G1 X54.028 Y135.149 E.02835
G1 X45.972 Y129.508 E.50629
G1 X45.972 Y130.059 E.02835
G1 X54.028 Y135.7 E.50629
G1 X54.028 Y136.251 E.02835
G1 X45.972 Y130.61 E.50629
G1 X45.972 Y131.16 E.02835
G1 X54.028 Y136.802 E.50629
G1 X54.028 Y137.352 E.02835
G1 X45.972 Y131.711 E.50629
G1 X45.972 Y132.262 E.02835
G1 X54.028 Y137.903 E.50629
G1 X54.028 Y138.454 E.02835
G1 X45.972 Y132.812 E.50629
G1 X45.972 Y133.363 E.02835
G1 X65.488 Y147.028 E1.22644
G1 X66.274 Y147.028 E.04048
G1 X54.768 Y138.972 E.72306
G1 X55.555 Y138.972 E.04048
G1 X67.061 Y147.028 E.72306
G1 X67.847 Y147.028 E.04048
G1 X56.341 Y138.972 E.72306
G1 X57.128 Y138.972 E.04048
G1 X68.633 Y147.028 E.72306
G1 X69.42 Y147.028 E.04048
G1 X57.914 Y138.972 E.72306
G1 X58.701 Y138.972 E.04048
G1 X70.206 Y147.028 E.72306
G1 X70.993 Y147.028 E.04048
G1 X59.487 Y138.972 E.72306
G1 X60.273 Y138.972 E.04048
G1 X71.779 Y147.028 E.72306
G1 X72.566 Y147.028 E.04048
G1 X61.06 Y138.972 E.72306
G1 X61.846 Y138.972 E.04048
G1 X73.352 Y147.028 E.72306
G1 X74.139 Y147.028 E.04048
G1 X62.633 Y138.972 E.72306
G1 X63.419 Y138.972 E.04048
G1 X74.925 Y147.028 E.72306
G1 X75.711 Y147.028 E.04048
G1 X64.206 Y138.972 E.72306
G1 X64.992 Y138.972 E.04048
G1 X76.498 Y147.028 E.72306
G1 X77.284 Y147.028 E.04048
G1 X65.779 Y138.972 E.72306
G1 X66.565 Y138.972 E.04048
G1 X78.071 Y147.028 E.72306
G1 X78.857 Y147.028 E.04048
G1 X67.351 Y138.972 E.72306
G1 X68.138 Y138.972 E.04048
G1 X79.644 Y147.028 E.72306
G1 X80.43 Y147.028 E.04048
G1 X68.924 Y138.972 E.72306
G1 X69.711 Y138.972 E.04048
G1 X81.217 Y147.028 E.72306
G1 X82.003 Y147.028 E.04048
G1 X70.497 Y138.972 E.72306
G1 X71.284 Y138.972 E.04048
G1 X82.789 Y147.028 E.72306
G1 X83.576 Y147.028 E.04048
G1 X72.07 Y138.972 E.72306
G1 X72.857 Y138.972 E.04048
G1 X84.362 Y147.028 E.72306
G1 X85.149 Y147.028 E.04048
G1 X73.643 Y138.972 E.72306
G1 X74.429 Y138.972 E.04048
G1 X85.935 Y147.028 E.72306
M73 P28 R39
G1 X86.722 Y147.028 E.04048
G1 X75.216 Y138.972 E.72306
G1 X76.002 Y138.972 E.04048
G1 X87.508 Y147.028 E.72306
G1 X88.295 Y147.028 E.04048
G1 X76.789 Y138.972 E.72306
G1 X77.575 Y138.972 E.04048
G1 X89.081 Y147.028 E.72306
G1 X89.867 Y147.028 E.04048
G1 X78.362 Y138.972 E.72306
G1 X79.148 Y138.972 E.04048
G1 X90.654 Y147.028 E.72306
G1 X91.44 Y147.028 E.04048
G1 X79.935 Y138.972 E.72306
G1 X80.721 Y138.972 E.04048
G1 X92.227 Y147.028 E.72306
G1 X93.013 Y147.028 E.04048
G1 X81.507 Y138.972 E.72306
G1 X82.294 Y138.972 E.04048
G1 X93.8 Y147.028 E.72306
G1 X94.586 Y147.028 E.04048
G1 X83.08 Y138.972 E.72306
G1 X83.867 Y138.972 E.04048
G1 X95.373 Y147.028 E.72306
G1 X96.159 Y147.028 E.04048
G1 X84.653 Y138.972 E.72306
G1 X85.44 Y138.972 E.04048
G1 X96.945 Y147.028 E.72306
G1 X97.732 Y147.028 E.04048
G1 X86.226 Y138.972 E.72306
G1 X87.013 Y138.972 E.04048
G1 X98.518 Y147.028 E.72306
G1 X99.305 Y147.028 E.04048
G1 X87.799 Y138.972 E.72306
G1 X88.585 Y138.972 E.04048
G1 X100.091 Y147.028 E.72306
G1 X100.878 Y147.028 E.04048
G1 X89.372 Y138.972 E.72306
G1 X90.158 Y138.972 E.04048
G1 X101.664 Y147.028 E.72306
G1 X102.451 Y147.028 E.04048
G1 X90.945 Y138.972 E.72306
G1 X91.731 Y138.972 E.04048
G1 X103.237 Y147.028 E.72306
G1 X104.023 Y147.028 E.04048
G1 X92.518 Y138.972 E.72306
G1 X93.304 Y138.972 E.04048
G1 X104.81 Y147.028 E.72306
G1 X105.596 Y147.028 E.04048
G1 X94.091 Y138.972 E.72306
G1 X94.877 Y138.972 E.04048
G1 X106.383 Y147.028 E.72306
G1 X107.169 Y147.028 E.04048
G1 X95.663 Y138.972 E.72306
G1 X96.45 Y138.972 E.04048
G1 X107.956 Y147.028 E.72306
G1 X108.742 Y147.028 E.04048
G1 X97.236 Y138.972 E.72306
G1 X98.023 Y138.972 E.04048
G1 X109.529 Y147.028 E.72306
G1 X110.315 Y147.028 E.04048
G1 X98.809 Y138.972 E.72306
G1 X99.596 Y138.972 E.04048
G1 X111.101 Y147.028 E.72306
G1 X111.888 Y147.028 E.04048
G1 X100.382 Y138.972 E.72306
G1 X101.169 Y138.972 E.04048
G1 X112.674 Y147.028 E.72306
G1 X113.461 Y147.028 E.04048
G1 X101.955 Y138.972 E.72306
G1 X102.741 Y138.972 E.04048
G1 X114.247 Y147.028 E.72306
G1 X115.034 Y147.028 E.04048
G1 X103.528 Y138.972 E.72306
G1 X104.314 Y138.972 E.04048
G1 X115.82 Y147.028 E.72306
G1 X116.607 Y147.028 E.04048
G1 X105.101 Y138.972 E.72306
G1 X105.887 Y138.972 E.04048
G1 X117.393 Y147.028 E.72306
G1 X118.179 Y147.028 E.04048
G1 X106.674 Y138.972 E.72306
G1 X107.46 Y138.972 E.04048
G1 X118.966 Y147.028 E.72306
G1 X119.752 Y147.028 E.04048
G1 X108.247 Y138.972 E.72306
G1 X109.033 Y138.972 E.04048
G1 X120.539 Y147.028 E.72306
G1 X121.325 Y147.028 E.04048
G1 X109.819 Y138.972 E.72306
G1 X110.606 Y138.972 E.04048
G1 X122.112 Y147.028 E.72306
G1 X122.898 Y147.028 E.04048
G1 X111.392 Y138.972 E.72306
G1 X112.179 Y138.972 E.04048
G1 X123.685 Y147.028 E.72306
G1 X124.471 Y147.028 E.04048
G1 X112.965 Y138.972 E.72306
G1 X113.752 Y138.972 E.04048
G1 X125.257 Y147.028 E.72306
G1 X126.044 Y147.028 E.04048
G1 X114.538 Y138.972 E.72306
G1 X115.325 Y138.972 E.04048
G1 X126.83 Y147.028 E.72306
G1 X127.617 Y147.028 E.04048
G1 X116.111 Y138.972 E.72306
G1 X116.897 Y138.972 E.04048
G1 X128.403 Y147.028 E.72306
G1 X129.19 Y147.028 E.04048
G1 X117.684 Y138.972 E.72306
G1 X118.47 Y138.972 E.04048
G1 X129.976 Y147.028 E.72306
G1 X130.763 Y147.028 E.04048
G1 X119.257 Y138.972 E.72306
G1 X120.043 Y138.972 E.04048
G1 X131.549 Y147.028 E.72306
G1 X132.335 Y147.028 E.04048
G1 X120.83 Y138.972 E.72306
G1 X121.616 Y138.972 E.04048
G1 X133.122 Y147.028 E.72306
G1 X133.908 Y147.028 E.04048
G1 X122.403 Y138.972 E.72306
G1 X123.189 Y138.972 E.04048
G1 X134.695 Y147.028 E.72306
G1 X135.481 Y147.028 E.04048
G1 X123.975 Y138.972 E.72306
G1 X124.762 Y138.972 E.04048
G1 X136.268 Y147.028 E.72306
G1 X137.054 Y147.028 E.04048
G1 X125.548 Y138.972 E.72306
G1 X126.335 Y138.972 E.04048
G1 X137.841 Y147.028 E.72306
G1 X138.627 Y147.028 E.04048
G1 X127.121 Y138.972 E.72306
G1 X127.908 Y138.972 E.04048
G1 X139.413 Y147.028 E.72306
G1 X140.2 Y147.028 E.04048
G1 X128.694 Y138.972 E.72306
G1 X129.481 Y138.972 E.04048
G1 X140.986 Y147.028 E.72306
G1 X141.773 Y147.028 E.04048
G1 X130.267 Y138.972 E.72306
G1 X131.053 Y138.972 E.04048
G1 X142.559 Y147.028 E.72306
G1 X143.346 Y147.028 E.04048
G1 X131.84 Y138.972 E.72306
G1 X132.626 Y138.972 E.04048
G1 X144.132 Y147.028 E.72306
G1 X144.919 Y147.028 E.04048
G1 X133.413 Y138.972 E.72306
G1 X134.199 Y138.972 E.04048
G1 X145.705 Y147.028 E.72306
G1 X146.491 Y147.028 E.04048
G1 X134.986 Y138.972 E.72306
G1 X135.772 Y138.972 E.04048
G1 X147.278 Y147.028 E.72306
G1 X148.064 Y147.028 E.04048
G1 X136.559 Y138.972 E.72306
G1 X137.345 Y138.972 E.04048
G1 X148.851 Y147.028 E.72306
G1 X149.637 Y147.028 E.04048
G1 X138.131 Y138.972 E.72306
G1 X138.918 Y138.972 E.04048
G1 X150.424 Y147.028 E.72306
G1 X151.21 Y147.028 E.04048
G1 X139.704 Y138.972 E.72306
G1 X140.491 Y138.972 E.04048
G1 X151.997 Y147.028 E.72306
G1 X152.783 Y147.028 E.04048
G1 X141.277 Y138.972 E.72306
M73 P29 R39
G1 X142.064 Y138.972 E.04048
G1 X153.569 Y147.028 E.72306
G1 X154.356 Y147.028 E.04048
G1 X142.85 Y138.972 E.72306
G1 X143.637 Y138.972 E.04048
G1 X155.142 Y147.028 E.72306
G1 X155.929 Y147.028 E.04048
G1 X144.423 Y138.972 E.72306
G1 X145.209 Y138.972 E.04048
G1 X156.715 Y147.028 E.72306
G1 X157.502 Y147.028 E.04048
G1 X145.996 Y138.972 E.72306
G1 X146.782 Y138.972 E.04048
G1 X158.288 Y147.028 E.72306
G1 X159.075 Y147.028 E.04048
G1 X147.569 Y138.972 E.72306
G1 X148.355 Y138.972 E.04048
G1 X159.861 Y147.028 E.72306
G1 X160.647 Y147.028 E.04048
G1 X149.142 Y138.972 E.72306
G1 X149.928 Y138.972 E.04048
G1 X161.434 Y147.028 E.72306
G1 X162.22 Y147.028 E.04048
G1 X150.715 Y138.972 E.72306
G1 X151.501 Y138.972 E.04048
G1 X163.007 Y147.028 E.72306
G1 X163.793 Y147.028 E.04048
G1 X152.287 Y138.972 E.72306
G1 X153.074 Y138.972 E.04048
G1 X164.58 Y147.028 E.72306
G1 X165.366 Y147.028 E.04048
G1 X153.86 Y138.972 E.72306
G1 X154.647 Y138.972 E.04048
G1 X166.153 Y147.028 E.72306
G1 X166.939 Y147.028 E.04048
G1 X155.433 Y138.972 E.72306
G1 X156.22 Y138.972 E.04048
G1 X167.725 Y147.028 E.72306
G1 X168.512 Y147.028 E.04048
G1 X157.006 Y138.972 E.72306
G1 X157.793 Y138.972 E.04048
G1 X169.298 Y147.028 E.72306
G1 X170.085 Y147.028 E.04048
G1 X158.579 Y138.972 E.72306
G1 X159.365 Y138.972 E.04048
G1 X170.871 Y147.028 E.72306
G1 X171.658 Y147.028 E.04048
G1 X160.152 Y138.972 E.72306
G1 X160.938 Y138.972 E.04048
G1 X172.444 Y147.028 E.72306
G1 X173.231 Y147.028 E.04048
G1 X161.725 Y138.972 E.72306
G1 X162.511 Y138.972 E.04048
G1 X174.017 Y147.028 E.72306
G1 X174.803 Y147.028 E.04048
G1 X163.298 Y138.972 E.72306
G1 X164.084 Y138.972 E.04048
G1 X175.59 Y147.028 E.72306
G1 X176.376 Y147.028 E.04048
G1 X164.871 Y138.972 E.72306
G1 X165.657 Y138.972 E.04048
G1 X177.163 Y147.028 E.72306
G1 X177.949 Y147.028 E.04048
G1 X166.443 Y138.972 E.72306
G1 X167.23 Y138.972 E.04048
G1 X178.736 Y147.028 E.72306
G1 X179.522 Y147.028 E.04048
G1 X168.016 Y138.972 E.72306
G1 X168.803 Y138.972 E.04048
G1 X180.309 Y147.028 E.72306
G1 X181.095 Y147.028 E.04048
G1 X169.589 Y138.972 E.72306
G1 X170.376 Y138.972 E.04048
G1 X181.881 Y147.028 E.72306
G1 X182.668 Y147.028 E.04048
G1 X171.162 Y138.972 E.72306
G1 X171.949 Y138.972 E.04048
G1 X183.454 Y147.028 E.72306
G1 X184.241 Y147.028 E.04048
G1 X172.735 Y138.972 E.72306
G1 X173.521 Y138.972 E.04048
G1 X185.027 Y147.028 E.72306
G1 X185.814 Y147.028 E.04048
G1 X174.308 Y138.972 E.72306
G1 X175.094 Y138.972 E.04048
G1 X186.6 Y147.028 E.72306
G1 X187.387 Y147.028 E.04048
G1 X175.881 Y138.972 E.72306
G1 X176.667 Y138.972 E.04048
G1 X188.173 Y147.028 E.72306
G1 X188.959 Y147.028 E.04048
G1 X177.454 Y138.972 E.72306
G1 X178.24 Y138.972 E.04048
G1 X189.746 Y147.028 E.72306
G1 X190.532 Y147.028 E.04048
G1 X179.027 Y138.972 E.72306
G1 X179.813 Y138.972 E.04048
G1 X191.319 Y147.028 E.72306
G1 X192.105 Y147.028 E.04048
G1 X180.599 Y138.972 E.72306
G1 X181.386 Y138.972 E.04048
G1 X192.892 Y147.028 E.72306
G1 X193.678 Y147.028 E.04048
G1 X182.172 Y138.972 E.72306
G1 X182.959 Y138.972 E.04048
G1 X194.465 Y147.028 E.72306
G1 X195.251 Y147.028 E.04048
G1 X183.745 Y138.972 E.72306
G1 X184.532 Y138.972 E.04048
G1 X196.037 Y147.028 E.72306
G1 X196.824 Y147.028 E.04048
G1 X185.318 Y138.972 E.72306
G1 X186.105 Y138.972 E.04048
G1 X197.61 Y147.028 E.72306
G1 X198.397 Y147.028 E.04048
G1 X186.891 Y138.972 E.72306
G1 X187.677 Y138.972 E.04048
G1 X199.183 Y147.028 E.72306
G1 X199.97 Y147.028 E.04048
G1 X188.464 Y138.972 E.72306
G1 X189.25 Y138.972 E.04048
G1 X200.756 Y147.028 E.72306
G1 X201.543 Y147.028 E.04048
G1 X190.037 Y138.972 E.72306
G1 X190.823 Y138.972 E.04048
G1 X202.329 Y147.028 E.72306
G1 X203.115 Y147.028 E.04048
G1 X191.61 Y138.972 E.72306
G1 X192.396 Y138.972 E.04048
G1 X203.902 Y147.028 E.72306
G1 X204.688 Y147.028 E.04048
G1 X193.183 Y138.972 E.72306
G1 X193.969 Y138.972 E.04048
G1 X205.475 Y147.028 E.72306
G1 X206.223 Y147.028 E.03851
G1 X206.223 Y147.001 E.00138
G1 X194.755 Y138.972 E.72065
G1 X195.542 Y138.972 E.04048
G1 X206.223 Y146.451 E.67122
G1 X206.223 Y145.9 E.02835
G1 X196.328 Y138.972 E.6218
G1 X197.115 Y138.972 E.04048
G1 X206.223 Y145.349 E.57238
G1 X206.223 Y144.799 E.02835
G1 X197.901 Y138.972 E.52295
G1 X198.688 Y138.972 E.04048
G1 X206.223 Y144.248 E.47353
G1 X206.223 Y143.697 E.02835
G1 X199.474 Y138.972 E.42411
G1 X200.261 Y138.972 E.04048
G1 X206.223 Y143.147 E.37468
G1 X206.223 Y142.596 E.02835
G1 X201.047 Y138.972 E.32526
G1 X201.833 Y138.972 E.04048
G1 X206.223 Y142.045 E.27584
G1 X206.223 Y141.495 E.02835
G1 X202.62 Y138.972 E.22642
G1 X203.406 Y138.972 E.04048
G1 X206.223 Y140.944 E.17699
G1 X206.223 Y140.393 E.02835
G1 X204.193 Y138.972 E.12757
G1 X204.979 Y138.972 E.04048
G1 X206.223 Y139.843 E.07815
G1 X206.223 Y139.292 E.02835
G1 X205.766 Y138.972 E.02872
G1 X205.972 Y138.972 E.01061
G1 X205.972 Y138.565 E.02092
G1 X206.911 Y139.223 E.05899
G1 X207.697 Y139.223 E.04048
G1 X205.972 Y138.015 E.10842
G1 X205.972 Y137.464 E.02835
G1 X208.483 Y139.223 E.15784
G1 X209.27 Y139.223 E.04048
G1 X205.972 Y136.913 E.20726
G1 X205.972 Y136.363 E.02835
G1 X210.056 Y139.223 E.25669
G1 X210.843 Y139.223 E.04048
G1 X205.972 Y135.812 E.30611
G1 X205.972 Y135.261 E.02835
G1 X211.629 Y139.223 E.35553
G1 X212.416 Y139.223 E.04048
G1 X205.972 Y134.711 E.40495
G1 X205.972 Y134.16 E.02835
G1 X213.202 Y139.223 E.45438
G1 X213.989 Y139.223 E.04048
G1 X205.972 Y133.609 E.5038
G1 X205.972 Y133.059 E.02835
G1 X214.028 Y138.7 E.50629
G1 X214.028 Y138.149 E.02835
G1 X205.972 Y132.508 E.50629
G1 X205.972 Y131.957 E.02835
G1 X214.028 Y137.599 E.50629
G1 X214.028 Y137.048 E.02835
G1 X205.972 Y131.407 E.50629
G1 X205.972 Y130.856 E.02835
G1 X214.028 Y136.497 E.50629
G1 X214.028 Y135.946 E.02835
G1 X205.972 Y130.305 E.50629
G1 X205.972 Y129.755 E.02835
G1 X214.028 Y135.396 E.50629
G1 X214.028 Y134.845 E.02835
G1 X205.972 Y129.204 E.50629
G1 X205.972 Y128.653 E.02835
G1 X214.028 Y134.294 E.50629
G1 X214.028 Y133.744 E.02835
G1 X205.972 Y128.103 E.50629
G1 X205.972 Y127.552 E.02835
G1 X214.028 Y133.193 E.50629
G1 X214.028 Y132.642 E.02835
G1 X205.972 Y127.001 E.50629
G1 X205.972 Y126.451 E.02835
G1 X214.028 Y132.092 E.50629
G1 X214.028 Y131.541 E.02835
G1 X205.972 Y125.9 E.50629
G1 X205.972 Y125.349 E.02835
G1 X214.028 Y130.99 E.50629
G1 X214.028 Y130.44 E.02835
G1 X205.972 Y124.799 E.50629
G1 X205.972 Y124.248 E.02835
G1 X214.028 Y129.889 E.50629
G1 X214.028 Y129.338 E.02835
G1 X205.972 Y123.697 E.50629
G1 X205.972 Y123.147 E.02835
G1 X214.028 Y128.788 E.50629
G1 X214.028 Y128.237 E.02835
G1 X205.972 Y122.596 E.50629
G1 X205.972 Y122.045 E.02835
G1 X214.028 Y127.686 E.50629
G1 X214.028 Y127.136 E.02835
G1 X205.972 Y121.495 E.50629
G1 X205.972 Y120.944 E.02835
G1 X214.028 Y126.585 E.50629
G1 X214.028 Y126.034 E.02835
G1 X205.972 Y120.393 E.50629
G1 X205.972 Y119.843 E.02835
G1 X214.028 Y125.484 E.50629
G1 X214.028 Y124.933 E.02835
G1 X205.972 Y119.292 E.50629
G1 X205.972 Y118.741 E.02835
G1 X214.028 Y124.382 E.50629
G1 X214.028 Y123.832 E.02835
G1 X205.972 Y118.191 E.50629
G1 X205.972 Y117.64 E.02835
G1 X214.028 Y123.281 E.50629
G1 X214.028 Y122.73 E.02835
G1 X205.972 Y117.089 E.50629
G1 X205.972 Y116.538 E.02835
G1 X214.028 Y122.18 E.50629
G1 X214.028 Y121.629 E.02835
G1 X205.972 Y115.988 E.50629
G1 X205.972 Y115.437 E.02835
G1 X214.028 Y121.078 E.50629
M73 P30 R39
G1 X214.028 Y120.528 E.02835
G1 X205.972 Y114.886 E.50629
G1 X205.972 Y114.336 E.02835
G1 X214.028 Y119.977 E.50629
G1 X214.028 Y119.426 E.02835
G1 X205.972 Y113.785 E.50629
G1 X205.972 Y113.234 E.02835
G1 X214.028 Y118.876 E.50629
M73 P30 R38
G1 X214.028 Y118.325 E.02835
G1 X205.972 Y112.684 E.50629
G1 X205.972 Y112.133 E.02835
G1 X214.028 Y117.774 E.50629
G1 X214.028 Y117.224 E.02835
G1 X206.25 Y111.777 E.48881
G1 X207.036 Y111.777 E.04048
G1 X214.028 Y116.673 E.43938
G1 X214.028 Y116.122 E.02835
G1 X207.823 Y111.777 E.38996
G1 X208.609 Y111.777 E.04048
G1 X214.028 Y115.572 E.34054
G1 X214.028 Y115.021 E.02835
G1 X209.396 Y111.777 E.29112
G1 X210.182 Y111.777 E.04048
G1 X214.028 Y114.47 E.24169
G1 X214.028 Y113.92 E.02835
G1 X210.969 Y111.777 E.19227
G1 X211.755 Y111.777 E.04048
G1 X214.028 Y113.369 E.14285
G1 X214.028 Y112.818 E.02835
G1 X212.542 Y111.777 E.09342
G1 X213.328 Y111.777 E.04048
G1 X214.231 Y112.409 E.05673
M106 S127.5
G1 X214.05 Y110.634 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F15476.087
G1 X214.05 Y111.349 E.02371
G1 X213.136 Y111.349 E.0303
G1 X210.738 Y108.95 E.11251
G1 X210.457 Y108.95 E.0093
G1 X208.059 Y111.349 E.11251
G1 X206.431 Y111.349 E.05401
G1 X214.05 Y141.338 F30000
G1 F15476.087
G1 X214.05 Y142.966 E.05401
G1 X210.735 Y139.651 E.1555
G1 X210.46 Y139.651 E.00911
G1 X206.651 Y143.46 E.17869
G1 X206.651 Y143.244 E.00719
G1 X210.457 Y147.05 E.17855
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y145.366 E.05401
M106 S224.4
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X214.05 Y143.738 E-.61876
G1 X213.787 Y144.001 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/275
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
G3 Z5 I.044 J-1.216 P1  F30000
G1 X54.398 Y138.21 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X54.398 Y138.602 E.01301
G1 X205.602 Y138.602 E5.01572
G1 X205.602 Y108.602 E.99516
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y147.398 E1.28693
G1 X45.602 Y147.398 E5.59927
G1 X45.602 Y108.602 E1.28693
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y138.15 E.98016
G1 X54.79 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X205.21 Y138.21 E4.62199
G1 X205.21 Y108.21 E.92182
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y147.79 E1.21618
G1 X45.21 Y147.79 E5.21072
G1 X45.21 Y108.21 E1.21618
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y138.15 E.91997
M204 S10000
; WIPE_START
G1 F24000
G1 X56.79 Y138.151 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I-.343 J-1.168 P1  F30000
G1 X45.95 Y141.338 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X45.95 Y142.966 E.05401
G1 X49.371 Y139.545 E.16048
G1 X49.434 Y139.545 E.00207
G1 X53.349 Y143.46 E.18367
G1 X53.349 Y143.244 E.00719
G1 X49.543 Y147.05 E.17855
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y145.366 E.05401
G1 X53.569 Y111.349 F30000
G1 F15476.087
G1 X51.941 Y111.349 E.05401
G1 X49.543 Y108.95 E.11251
G1 X49.262 Y108.95 E.00931
G1 X46.864 Y111.349 E.11251
G1 X45.95 Y111.349 E.0303
G1 X45.95 Y110.634 E.02372
G1 X45.766 Y112.401 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420046
G1 F15000
G1 X46.425 Y111.741 E.02867
G1 X46.959 Y111.741 E.01639
G1 X45.935 Y112.764 E.04448
G1 X45.935 Y113.298 E.01639
G1 X47.492 Y111.741 E.06766
G1 X48.025 Y111.741 E.01639
G1 X45.935 Y113.831 E.09084
G1 X45.935 Y114.364 E.01639
G1 X48.559 Y111.741 E.11402
G1 X49.092 Y111.741 E.01639
G1 X45.935 Y114.898 E.13719
G1 X45.935 Y115.431 E.01639
G1 X49.625 Y111.741 E.16037
G1 X50.159 Y111.741 E.01639
G1 X45.935 Y115.964 E.18355
G1 X45.935 Y116.498 E.01639
G1 X50.692 Y111.741 E.20673
G1 X51.225 Y111.741 E.01639
G1 X45.935 Y117.031 E.22991
G1 X45.935 Y117.564 E.01639
G1 X51.759 Y111.741 E.25309
G1 X52.292 Y111.741 E.01639
G1 X45.935 Y118.098 E.27627
G1 X45.935 Y118.631 E.01639
G1 X52.825 Y111.741 E.29945
G1 X53.359 Y111.741 E.01639
G1 X45.935 Y119.164 E.32263
G1 X45.935 Y119.698 E.01639
G1 X53.892 Y111.741 E.3458
G1 X54.065 Y111.741 E.0053
G1 X54.065 Y112.102 E.01109
G1 X45.935 Y120.231 E.3533
G1 X45.935 Y120.764 E.01639
G1 X54.065 Y112.635 E.3533
G1 X54.065 Y113.168 E.01639
G1 X45.935 Y121.298 E.3533
G1 X45.935 Y121.831 E.01639
G1 X54.065 Y113.702 E.3533
G1 X54.065 Y114.235 E.01639
G1 X45.935 Y122.364 E.3533
G1 X45.935 Y122.898 E.01639
G1 X54.065 Y114.768 E.3533
G1 X54.065 Y115.302 E.01639
G1 X45.935 Y123.431 E.3533
G1 X45.935 Y123.964 E.01639
G1 X54.065 Y115.835 E.3533
G1 X54.065 Y116.368 E.01639
G1 X45.935 Y124.498 E.3533
G1 X45.935 Y125.031 E.01639
G1 X54.065 Y116.902 E.3533
G1 X54.065 Y117.435 E.01639
G1 X45.935 Y125.564 E.3533
G1 X45.935 Y126.098 E.01639
G1 X54.065 Y117.968 E.3533
G1 X54.065 Y118.502 E.01639
G1 X45.935 Y126.631 E.3533
G1 X45.935 Y127.164 E.01639
G1 X54.065 Y119.035 E.3533
G1 X54.065 Y119.568 E.01639
G1 X45.935 Y127.698 E.3533
G1 X45.935 Y128.231 E.01639
G1 X54.065 Y120.102 E.3533
G1 X54.065 Y120.635 E.01639
G1 X45.935 Y128.764 E.3533
G1 X45.935 Y129.298 E.01639
G1 X54.065 Y121.168 E.3533
G1 X54.065 Y121.702 E.01639
G1 X45.935 Y129.831 E.3533
G1 X45.935 Y130.364 E.01639
G1 X54.065 Y122.235 E.3533
G1 X54.065 Y122.768 E.01639
G1 X45.935 Y130.898 E.3533
G1 X45.935 Y131.431 E.01639
G1 X54.065 Y123.302 E.3533
G1 X54.065 Y123.835 E.01639
G1 X45.935 Y131.964 E.3533
G1 X45.935 Y132.498 E.01639
G1 X54.065 Y124.368 E.3533
G1 X54.065 Y124.902 E.01639
G1 X45.935 Y133.031 E.3533
G1 X45.935 Y133.564 E.01639
G1 X54.065 Y125.435 E.3533
G1 X54.065 Y125.968 E.01639
G1 X45.935 Y134.098 E.3533
G1 X45.935 Y134.631 E.01639
G1 X54.065 Y126.502 E.3533
G1 X54.065 Y127.035 E.01639
G1 X45.935 Y135.164 E.3533
G1 X45.935 Y135.698 E.01639
G1 X54.065 Y127.568 E.3533
G1 X54.065 Y128.102 E.01639
G1 X45.935 Y136.231 E.3533
G1 X45.935 Y136.764 E.01639
G1 X54.065 Y128.635 E.3533
G1 X54.065 Y129.168 E.01639
G1 X45.935 Y137.298 E.3533
G1 X45.935 Y137.831 E.01639
G1 X54.065 Y129.702 E.3533
G1 X54.065 Y130.235 E.01639
G1 X45.935 Y138.364 E.3533
G1 X45.935 Y138.898 E.01639
G1 X54.065 Y130.768 E.3533
G1 X54.065 Y131.302 E.01639
G1 X46.213 Y139.153 E.34122
G1 X46.747 Y139.153 E.01639
G1 X54.065 Y131.835 E.31804
G1 X54.065 Y132.368 E.01639
G1 X47.28 Y139.153 E.29486
G1 X47.813 Y139.153 E.01639
G1 X54.065 Y132.902 E.27168
G1 X54.065 Y133.435 E.01639
G1 X48.347 Y139.153 E.24851
G1 X48.88 Y139.153 E.01639
G1 X54.065 Y133.968 E.22533
G1 X54.065 Y134.502 E.01639
G1 X49.413 Y139.153 E.20215
G1 X49.947 Y139.153 E.01639
G1 X54.065 Y135.035 E.17897
G1 X54.065 Y135.568 E.01639
G1 X50.48 Y139.153 E.15579
G1 X51.013 Y139.153 E.01639
G1 X54.065 Y136.102 E.13261
G1 X54.065 Y136.635 E.01639
G1 X51.547 Y139.153 E.10943
G1 X52.08 Y139.153 E.01639
G1 X54.065 Y137.168 E.08625
G1 X54.065 Y137.702 E.01639
G1 X52.613 Y139.153 E.06307
G1 X53.147 Y139.153 E.01639
G1 X54.065 Y138.235 E.0399
G1 X54.065 Y138.768 E.01639
G1 X53.68 Y139.153 E.01672
G1 X53.741 Y139.153 E.00187
G1 X53.741 Y139.626 E.01452
G1 X54.431 Y138.935 E.03
G1 X54.964 Y138.935 E.01639
G1 X53.741 Y140.159 E.05318
G1 X53.741 Y140.692 E.01639
G1 X55.498 Y138.935 E.07636
G1 X56.031 Y138.935 E.01639
G1 X53.741 Y141.226 E.09954
G1 X53.741 Y141.759 E.01639
G1 X56.564 Y138.935 E.12272
G1 X57.098 Y138.935 E.01639
G1 X53.741 Y142.292 E.1459
G1 X53.741 Y142.826 E.01639
G1 X57.631 Y138.935 E.16907
G1 X58.164 Y138.935 E.01639
G1 X53.741 Y143.359 E.19225
G1 X53.741 Y143.892 E.01639
G1 X58.698 Y138.935 E.21543
G1 X59.231 Y138.935 E.01639
G1 X53.741 Y144.426 E.23861
G1 X53.741 Y144.959 E.01639
G1 X59.764 Y138.935 E.26179
G1 X60.298 Y138.935 E.01639
G1 X53.741 Y145.492 E.28497
G1 X53.741 Y146.026 E.01639
G1 X60.831 Y138.935 E.30815
G1 X61.364 Y138.935 E.01639
G1 X53.741 Y146.559 E.33133
G1 X53.741 Y147.065 E.01554
G1 X53.768 Y147.065 E.00085
G1 X61.898 Y138.935 E.3533
G1 X62.431 Y138.935 E.01639
G1 X54.302 Y147.065 E.3533
G1 X54.835 Y147.065 E.01639
G1 X62.964 Y138.935 E.3533
G1 X63.498 Y138.935 E.01639
G1 X55.369 Y147.065 E.3533
G1 X55.902 Y147.065 E.01639
G1 X64.031 Y138.935 E.3533
G1 X64.564 Y138.935 E.01639
G1 X56.435 Y147.065 E.3533
G1 X56.969 Y147.065 E.01639
G1 X65.098 Y138.935 E.3533
G1 X65.631 Y138.935 E.01639
G1 X57.502 Y147.065 E.3533
G1 X58.035 Y147.065 E.01639
G1 X66.164 Y138.935 E.3533
G1 X66.698 Y138.935 E.01639
G1 X58.569 Y147.065 E.3533
G1 X59.102 Y147.065 E.01639
G1 X67.231 Y138.935 E.3533
G1 X67.765 Y138.935 E.01639
G1 X59.635 Y147.065 E.3533
G1 X60.169 Y147.065 E.01639
G1 X68.298 Y138.935 E.3533
G1 X68.831 Y138.935 E.01639
G1 X60.702 Y147.065 E.3533
G1 X61.235 Y147.065 E.01639
G1 X69.365 Y138.935 E.3533
G1 X69.898 Y138.935 E.01639
G1 X61.769 Y147.065 E.3533
G1 X62.302 Y147.065 E.01639
G1 X70.431 Y138.935 E.3533
G1 X70.965 Y138.935 E.01639
G1 X62.835 Y147.065 E.3533
G1 X63.369 Y147.065 E.01639
G1 X71.498 Y138.935 E.3533
G1 X72.031 Y138.935 E.01639
G1 X63.902 Y147.065 E.3533
G1 X64.435 Y147.065 E.01639
G1 X72.565 Y138.935 E.3533
G1 X73.098 Y138.935 E.01639
G1 X64.969 Y147.065 E.3533
G1 X65.502 Y147.065 E.01639
G1 X73.631 Y138.935 E.3533
G1 X74.165 Y138.935 E.01639
G1 X66.035 Y147.065 E.3533
G1 X66.569 Y147.065 E.01639
G1 X74.698 Y138.935 E.3533
G1 X75.231 Y138.935 E.01639
G1 X67.102 Y147.065 E.3533
G1 X67.635 Y147.065 E.01639
G1 X75.765 Y138.935 E.3533
G1 X76.298 Y138.935 E.01639
G1 X68.169 Y147.065 E.3533
G1 X68.702 Y147.065 E.01639
G1 X76.831 Y138.935 E.3533
G1 X77.365 Y138.935 E.01639
G1 X69.235 Y147.065 E.3533
G1 X69.769 Y147.065 E.01639
G1 X77.898 Y138.935 E.3533
G1 X78.431 Y138.935 E.01639
G1 X70.302 Y147.065 E.3533
G1 X70.835 Y147.065 E.01639
G1 X78.965 Y138.935 E.3533
G1 X79.498 Y138.935 E.01639
G1 X71.369 Y147.065 E.3533
G1 X71.902 Y147.065 E.01639
G1 X80.031 Y138.935 E.3533
G1 X80.565 Y138.935 E.01639
G1 X72.435 Y147.065 E.3533
G1 X72.969 Y147.065 E.01639
G1 X81.098 Y138.935 E.3533
G1 X81.631 Y138.935 E.01639
G1 X73.502 Y147.065 E.3533
G1 X74.035 Y147.065 E.01639
G1 X82.165 Y138.935 E.3533
G1 X82.698 Y138.935 E.01639
G1 X74.569 Y147.065 E.3533
G1 X75.102 Y147.065 E.01639
G1 X83.231 Y138.935 E.3533
G1 X83.765 Y138.935 E.01639
G1 X75.635 Y147.065 E.3533
G1 X76.169 Y147.065 E.01639
G1 X84.298 Y138.935 E.3533
G1 X84.831 Y138.935 E.01639
G1 X76.702 Y147.065 E.3533
G1 X77.235 Y147.065 E.01639
G1 X85.365 Y138.935 E.3533
G1 X85.898 Y138.935 E.01639
G1 X77.769 Y147.065 E.3533
G1 X78.302 Y147.065 E.01639
G1 X86.431 Y138.935 E.3533
G1 X86.965 Y138.935 E.01639
G1 X78.835 Y147.065 E.3533
G1 X79.369 Y147.065 E.01639
G1 X87.498 Y138.935 E.3533
G1 X88.031 Y138.935 E.01639
G1 X79.902 Y147.065 E.3533
G1 X80.435 Y147.065 E.01639
G1 X88.565 Y138.935 E.3533
G1 X89.098 Y138.935 E.01639
G1 X80.969 Y147.065 E.3533
G1 X81.502 Y147.065 E.01639
G1 X89.631 Y138.935 E.3533
G1 X90.165 Y138.935 E.01639
G1 X82.035 Y147.065 E.3533
G1 X82.569 Y147.065 E.01639
G1 X90.698 Y138.935 E.3533
G1 X91.231 Y138.935 E.01639
G1 X83.102 Y147.065 E.3533
G1 X83.635 Y147.065 E.01639
G1 X91.765 Y138.935 E.3533
G1 X92.298 Y138.935 E.01639
G1 X84.169 Y147.065 E.3533
G1 X84.702 Y147.065 E.01639
G1 X92.831 Y138.935 E.3533
G1 X93.365 Y138.935 E.01639
G1 X85.235 Y147.065 E.3533
G1 X85.769 Y147.065 E.01639
G1 X93.898 Y138.935 E.3533
G1 X94.431 Y138.935 E.01639
G1 X86.302 Y147.065 E.3533
G1 X86.835 Y147.065 E.01639
G1 X94.965 Y138.935 E.3533
G1 X95.498 Y138.935 E.01639
G1 X87.369 Y147.065 E.3533
G1 X87.902 Y147.065 E.01639
G1 X96.031 Y138.935 E.3533
G1 X96.565 Y138.935 E.01639
G1 X88.435 Y147.065 E.3533
G1 X88.969 Y147.065 E.01639
G1 X97.098 Y138.935 E.3533
G1 X97.631 Y138.935 E.01639
G1 X89.502 Y147.065 E.3533
G1 X90.035 Y147.065 E.01639
G1 X98.165 Y138.935 E.3533
G1 X98.698 Y138.935 E.01639
G1 X90.569 Y147.065 E.3533
G1 X91.102 Y147.065 E.01639
G1 X99.231 Y138.935 E.3533
G1 X99.765 Y138.935 E.01639
G1 X91.635 Y147.065 E.3533
G1 X92.169 Y147.065 E.01639
G1 X100.298 Y138.935 E.3533
G1 X100.831 Y138.935 E.01639
G1 X92.702 Y147.065 E.3533
G1 X93.235 Y147.065 E.01639
G1 X101.365 Y138.935 E.3533
G1 X101.898 Y138.935 E.01639
G1 X93.769 Y147.065 E.3533
G1 X94.302 Y147.065 E.01639
G1 X102.431 Y138.935 E.3533
G1 X102.965 Y138.935 E.01639
G1 X94.835 Y147.065 E.3533
G1 X95.369 Y147.065 E.01639
G1 X103.498 Y138.935 E.3533
G1 X104.031 Y138.935 E.01639
G1 X95.902 Y147.065 E.3533
G1 X96.435 Y147.065 E.01639
G1 X104.565 Y138.935 E.3533
G1 X105.098 Y138.935 E.01639
G1 X96.969 Y147.065 E.3533
G1 X97.502 Y147.065 E.01639
G1 X105.631 Y138.935 E.3533
G1 X106.165 Y138.935 E.01639
G1 X98.035 Y147.065 E.3533
G1 X98.569 Y147.065 E.01639
G1 X106.698 Y138.935 E.3533
G1 X107.231 Y138.935 E.01639
G1 X99.102 Y147.065 E.3533
G1 X99.635 Y147.065 E.01639
G1 X107.765 Y138.935 E.3533
G1 X108.298 Y138.935 E.01639
G1 X100.169 Y147.065 E.3533
G1 X100.702 Y147.065 E.01639
G1 X108.831 Y138.935 E.3533
G1 X109.365 Y138.935 E.01639
G1 X101.235 Y147.065 E.3533
G1 X101.769 Y147.065 E.01639
G1 X109.898 Y138.935 E.3533
G1 X110.431 Y138.935 E.01639
G1 X102.302 Y147.065 E.3533
G1 X102.835 Y147.065 E.01639
G1 X110.965 Y138.935 E.3533
G1 X111.498 Y138.935 E.01639
G1 X103.369 Y147.065 E.3533
G1 X103.902 Y147.065 E.01639
G1 X112.031 Y138.935 E.3533
G1 X112.565 Y138.935 E.01639
G1 X104.435 Y147.065 E.3533
G1 X104.969 Y147.065 E.01639
G1 X113.098 Y138.935 E.3533
G1 X113.631 Y138.935 E.01639
G1 X105.502 Y147.065 E.3533
G1 X106.035 Y147.065 E.01639
G1 X114.165 Y138.935 E.3533
G1 X114.698 Y138.935 E.01639
G1 X106.569 Y147.065 E.3533
G1 X107.102 Y147.065 E.01639
G1 X115.231 Y138.935 E.3533
G1 X115.765 Y138.935 E.01639
G1 X107.636 Y147.065 E.3533
G1 X108.169 Y147.065 E.01639
G1 X116.298 Y138.935 E.3533
G1 X116.831 Y138.935 E.01639
G1 X108.702 Y147.065 E.3533
G1 X109.236 Y147.065 E.01639
G1 X117.365 Y138.935 E.3533
G1 X117.898 Y138.935 E.01639
G1 X109.769 Y147.065 E.3533
G1 X110.302 Y147.065 E.01639
G1 X118.432 Y138.935 E.3533
G1 X118.965 Y138.935 E.01639
G1 X110.836 Y147.065 E.3533
G1 X111.369 Y147.065 E.01639
G1 X119.498 Y138.935 E.3533
G1 X120.032 Y138.935 E.01639
G1 X111.902 Y147.065 E.3533
G1 X112.436 Y147.065 E.01639
G1 X120.565 Y138.935 E.3533
G1 X121.098 Y138.935 E.01639
G1 X112.969 Y147.065 E.3533
G1 X113.502 Y147.065 E.01639
G1 X121.632 Y138.935 E.3533
G1 X122.165 Y138.935 E.01639
G1 X114.036 Y147.065 E.3533
G1 X114.569 Y147.065 E.01639
G1 X122.698 Y138.935 E.3533
G1 X123.232 Y138.935 E.01639
G1 X115.102 Y147.065 E.3533
G1 X115.636 Y147.065 E.01639
G1 X123.765 Y138.935 E.3533
G1 X124.298 Y138.935 E.01639
G1 X116.169 Y147.065 E.3533
G1 X116.702 Y147.065 E.01639
G1 X124.832 Y138.935 E.3533
G1 X125.365 Y138.935 E.01639
G1 X117.236 Y147.065 E.3533
G1 X117.769 Y147.065 E.01639
G1 X125.898 Y138.935 E.3533
G1 X126.432 Y138.935 E.01639
G1 X118.302 Y147.065 E.3533
G1 X118.836 Y147.065 E.01639
G1 X126.965 Y138.935 E.3533
G1 X127.498 Y138.935 E.01639
G1 X119.369 Y147.065 E.3533
G1 X119.902 Y147.065 E.01639
G1 X128.032 Y138.935 E.3533
G1 X128.565 Y138.935 E.01639
G1 X120.436 Y147.065 E.3533
G1 X120.969 Y147.065 E.01639
G1 X129.098 Y138.935 E.3533
G1 X129.632 Y138.935 E.01639
G1 X121.502 Y147.065 E.3533
G1 X122.036 Y147.065 E.01639
G1 X130.165 Y138.935 E.3533
G1 X130.698 Y138.935 E.01639
G1 X122.569 Y147.065 E.3533
G1 X123.102 Y147.065 E.01639
G1 X131.232 Y138.935 E.3533
G1 X131.765 Y138.935 E.01639
G1 X123.636 Y147.065 E.3533
G1 X124.169 Y147.065 E.01639
G1 X132.298 Y138.935 E.3533
G1 X132.832 Y138.935 E.01639
G1 X124.702 Y147.065 E.3533
G1 X125.236 Y147.065 E.01639
G1 X133.365 Y138.935 E.3533
G1 X133.898 Y138.935 E.01639
G1 X125.769 Y147.065 E.3533
G1 X126.302 Y147.065 E.01639
G1 X134.432 Y138.935 E.3533
G1 X134.965 Y138.935 E.01639
G1 X126.836 Y147.065 E.3533
G1 X127.369 Y147.065 E.01639
G1 X135.498 Y138.935 E.3533
G1 X136.032 Y138.935 E.01639
G1 X127.902 Y147.065 E.3533
G1 X128.436 Y147.065 E.01639
G1 X136.565 Y138.935 E.3533
G1 X137.098 Y138.935 E.01639
G1 X128.969 Y147.065 E.3533
G1 X129.502 Y147.065 E.01639
G1 X137.632 Y138.935 E.3533
G1 X138.165 Y138.935 E.01639
G1 X130.036 Y147.065 E.3533
G1 X130.569 Y147.065 E.01639
G1 X138.698 Y138.935 E.3533
G1 X139.232 Y138.935 E.01639
G1 X131.102 Y147.065 E.3533
G1 X131.636 Y147.065 E.01639
G1 X139.765 Y138.935 E.3533
G1 X140.298 Y138.935 E.01639
G1 X132.169 Y147.065 E.3533
G1 X132.702 Y147.065 E.01639
G1 X140.832 Y138.935 E.3533
G1 X141.365 Y138.935 E.01639
G1 X133.236 Y147.065 E.3533
G1 X133.769 Y147.065 E.01639
G1 X141.898 Y138.935 E.3533
G1 X142.432 Y138.935 E.01639
G1 X134.302 Y147.065 E.3533
G1 X134.836 Y147.065 E.01639
G1 X142.965 Y138.935 E.3533
G1 X143.498 Y138.935 E.01639
G1 X135.369 Y147.065 E.3533
G1 X135.902 Y147.065 E.01639
G1 X144.032 Y138.935 E.3533
G1 X144.565 Y138.935 E.01639
G1 X136.436 Y147.065 E.3533
G1 X136.969 Y147.065 E.01639
G1 X145.098 Y138.935 E.3533
G1 X145.632 Y138.935 E.01639
G1 X137.502 Y147.065 E.3533
G1 X138.036 Y147.065 E.01639
G1 X146.165 Y138.935 E.3533
G1 X146.698 Y138.935 E.01639
G1 X138.569 Y147.065 E.3533
G1 X139.102 Y147.065 E.01639
G1 X147.232 Y138.935 E.3533
G1 X147.765 Y138.935 E.01639
G1 X139.636 Y147.065 E.3533
G1 X140.169 Y147.065 E.01639
G1 X148.298 Y138.935 E.3533
G1 X148.832 Y138.935 E.01639
G1 X140.702 Y147.065 E.3533
G1 X141.236 Y147.065 E.01639
G1 X149.365 Y138.935 E.3533
G1 X149.898 Y138.935 E.01639
G1 X141.769 Y147.065 E.3533
G1 X142.302 Y147.065 E.01639
G1 X150.432 Y138.935 E.3533
G1 X150.965 Y138.935 E.01639
G1 X142.836 Y147.065 E.3533
G1 X143.369 Y147.065 E.01639
G1 X151.498 Y138.935 E.3533
G1 X152.032 Y138.935 E.01639
G1 X143.902 Y147.065 E.3533
G1 X144.436 Y147.065 E.01639
G1 X152.565 Y138.935 E.3533
G1 X153.098 Y138.935 E.01639
G1 X144.969 Y147.065 E.3533
G1 X145.502 Y147.065 E.01639
G1 X153.632 Y138.935 E.3533
G1 X154.165 Y138.935 E.01639
G1 X146.036 Y147.065 E.3533
G1 X146.569 Y147.065 E.01639
G1 X154.698 Y138.935 E.3533
G1 X155.232 Y138.935 E.01639
G1 X147.102 Y147.065 E.3533
G1 X147.636 Y147.065 E.01639
G1 X155.765 Y138.935 E.3533
G1 X156.298 Y138.935 E.01639
G1 X148.169 Y147.065 E.3533
G1 X148.702 Y147.065 E.01639
G1 X156.832 Y138.935 E.3533
G1 X157.365 Y138.935 E.01639
G1 X149.236 Y147.065 E.3533
G1 X149.769 Y147.065 E.01639
G1 X157.898 Y138.935 E.3533
G1 X158.432 Y138.935 E.01639
G1 X150.302 Y147.065 E.3533
G1 X150.836 Y147.065 E.01639
G1 X158.965 Y138.935 E.3533
G1 X159.498 Y138.935 E.01639
G1 X151.369 Y147.065 E.3533
G1 X151.902 Y147.065 E.01639
G1 X160.032 Y138.935 E.3533
G1 X160.565 Y138.935 E.01639
G1 X152.436 Y147.065 E.3533
G1 X152.969 Y147.065 E.01639
G1 X161.098 Y138.935 E.3533
G1 X161.632 Y138.935 E.01639
G1 X153.502 Y147.065 E.3533
M73 P31 R38
G1 X154.036 Y147.065 E.01639
G1 X162.165 Y138.935 E.3533
G1 X162.698 Y138.935 E.01639
G1 X154.569 Y147.065 E.3533
G1 X155.102 Y147.065 E.01639
G1 X163.232 Y138.935 E.3533
G1 X163.765 Y138.935 E.01639
G1 X155.636 Y147.065 E.3533
G1 X156.169 Y147.065 E.01639
G1 X164.298 Y138.935 E.3533
G1 X164.832 Y138.935 E.01639
G1 X156.702 Y147.065 E.3533
G1 X157.236 Y147.065 E.01639
G1 X165.365 Y138.935 E.3533
G1 X165.898 Y138.935 E.01639
G1 X157.769 Y147.065 E.3533
G1 X158.303 Y147.065 E.01639
G1 X166.432 Y138.935 E.3533
G1 X166.965 Y138.935 E.01639
G1 X158.836 Y147.065 E.3533
G1 X159.369 Y147.065 E.01639
G1 X167.498 Y138.935 E.3533
G1 X168.032 Y138.935 E.01639
G1 X159.903 Y147.065 E.3533
G1 X160.436 Y147.065 E.01639
G1 X168.565 Y138.935 E.3533
G1 X169.098 Y138.935 E.01639
G1 X160.969 Y147.065 E.3533
G1 X161.503 Y147.065 E.01639
G1 X169.632 Y138.935 E.3533
G1 X170.165 Y138.935 E.01639
G1 X162.036 Y147.065 E.3533
G1 X162.569 Y147.065 E.01639
G1 X170.699 Y138.935 E.3533
G1 X171.232 Y138.935 E.01639
G1 X163.103 Y147.065 E.3533
G1 X163.636 Y147.065 E.01639
G1 X171.765 Y138.935 E.3533
G1 X172.299 Y138.935 E.01639
G1 X164.169 Y147.065 E.3533
G1 X164.703 Y147.065 E.01639
G1 X172.832 Y138.935 E.3533
G1 X173.365 Y138.935 E.01639
G1 X165.236 Y147.065 E.3533
G1 X165.769 Y147.065 E.01639
G1 X173.899 Y138.935 E.3533
G1 X174.432 Y138.935 E.01639
G1 X166.303 Y147.065 E.3533
G1 X166.836 Y147.065 E.01639
G1 X174.965 Y138.935 E.3533
G1 X175.499 Y138.935 E.01639
G1 X167.369 Y147.065 E.3533
G1 X167.903 Y147.065 E.01639
G1 X176.032 Y138.935 E.3533
G1 X176.565 Y138.935 E.01639
G1 X168.436 Y147.065 E.3533
G1 X168.969 Y147.065 E.01639
G1 X177.099 Y138.935 E.3533
G1 X177.632 Y138.935 E.01639
G1 X169.503 Y147.065 E.3533
G1 X170.036 Y147.065 E.01639
G1 X178.165 Y138.935 E.3533
G1 X178.699 Y138.935 E.01639
G1 X170.569 Y147.065 E.3533
G1 X171.103 Y147.065 E.01639
G1 X179.232 Y138.935 E.3533
G1 X179.765 Y138.935 E.01639
G1 X171.636 Y147.065 E.3533
G1 X172.169 Y147.065 E.01639
G1 X180.299 Y138.935 E.3533
G1 X180.832 Y138.935 E.01639
G1 X172.703 Y147.065 E.3533
G1 X173.236 Y147.065 E.01639
G1 X181.365 Y138.935 E.3533
G1 X181.899 Y138.935 E.01639
G1 X173.769 Y147.065 E.3533
G1 X174.303 Y147.065 E.01639
G1 X182.432 Y138.935 E.3533
G1 X182.965 Y138.935 E.01639
G1 X174.836 Y147.065 E.3533
G1 X175.369 Y147.065 E.01639
G1 X183.499 Y138.935 E.3533
G1 X184.032 Y138.935 E.01639
G1 X175.903 Y147.065 E.3533
G1 X176.436 Y147.065 E.01639
G1 X184.565 Y138.935 E.3533
G1 X185.099 Y138.935 E.01639
G1 X176.969 Y147.065 E.3533
G1 X177.503 Y147.065 E.01639
G1 X185.632 Y138.935 E.3533
G1 X186.165 Y138.935 E.01639
G1 X178.036 Y147.065 E.3533
G1 X178.569 Y147.065 E.01639
G1 X186.699 Y138.935 E.3533
G1 X187.232 Y138.935 E.01639
G1 X179.103 Y147.065 E.3533
G1 X179.636 Y147.065 E.01639
G1 X187.765 Y138.935 E.3533
G1 X188.299 Y138.935 E.01639
G1 X180.169 Y147.065 E.3533
G1 X180.703 Y147.065 E.01639
G1 X188.832 Y138.935 E.3533
G1 X189.365 Y138.935 E.01639
G1 X181.236 Y147.065 E.3533
G1 X181.769 Y147.065 E.01639
G1 X189.899 Y138.935 E.3533
G1 X190.432 Y138.935 E.01639
G1 X182.303 Y147.065 E.3533
G1 X182.836 Y147.065 E.01639
G1 X190.965 Y138.935 E.3533
G1 X191.499 Y138.935 E.01639
G1 X183.369 Y147.065 E.3533
G1 X183.903 Y147.065 E.01639
G1 X192.032 Y138.935 E.3533
G1 X192.565 Y138.935 E.01639
G1 X184.436 Y147.065 E.3533
G1 X184.969 Y147.065 E.01639
G1 X193.099 Y138.935 E.3533
G1 X193.632 Y138.935 E.01639
G1 X185.503 Y147.065 E.3533
G1 X186.036 Y147.065 E.01639
G1 X194.165 Y138.935 E.3533
G1 X194.699 Y138.935 E.01639
G1 X186.569 Y147.065 E.3533
G1 X187.103 Y147.065 E.01639
G1 X195.232 Y138.935 E.3533
G1 X195.765 Y138.935 E.01639
G1 X187.636 Y147.065 E.3533
G1 X188.169 Y147.065 E.01639
G1 X196.299 Y138.935 E.3533
G1 X196.832 Y138.935 E.01639
G1 X188.703 Y147.065 E.3533
G1 X189.236 Y147.065 E.01639
G1 X197.365 Y138.935 E.3533
G1 X197.899 Y138.935 E.01639
G1 X189.769 Y147.065 E.3533
G1 X190.303 Y147.065 E.01639
G1 X198.432 Y138.935 E.3533
G1 X198.965 Y138.935 E.01639
G1 X190.836 Y147.065 E.3533
G1 X191.369 Y147.065 E.01639
G1 X199.499 Y138.935 E.3533
G1 X200.032 Y138.935 E.01639
G1 X191.903 Y147.065 E.3533
G1 X192.436 Y147.065 E.01639
G1 X200.565 Y138.935 E.3533
G1 X201.099 Y138.935 E.01639
G1 X192.969 Y147.065 E.3533
G1 X193.503 Y147.065 E.01639
G1 X201.632 Y138.935 E.3533
G1 X202.165 Y138.935 E.01639
G1 X194.036 Y147.065 E.3533
G1 X194.569 Y147.065 E.01639
G1 X202.699 Y138.935 E.3533
G1 X203.232 Y138.935 E.01639
G1 X195.103 Y147.065 E.3533
G1 X195.636 Y147.065 E.01639
G1 X203.765 Y138.935 E.3533
G1 X204.299 Y138.935 E.01639
G1 X196.169 Y147.065 E.3533
G1 X196.703 Y147.065 E.01639
G1 X204.832 Y138.935 E.3533
G1 X205.365 Y138.935 E.01639
G1 X197.066 Y147.234 E.36068
G1 X197.6 Y147.234 F30000
G1 F15000
G1 X214.065 Y130.769 E.71557
G1 X214.065 Y130.236 E.01639
G1 X205.935 Y138.365 E.3533
G1 X205.935 Y137.832 E.01639
G1 X214.065 Y129.703 E.3533
G1 X214.065 Y129.169 E.01639
G1 X205.935 Y137.299 E.3533
G1 X205.935 Y136.765 E.01639
G1 X214.065 Y128.636 E.3533
G1 X214.065 Y128.103 E.01639
G1 X205.935 Y136.232 E.3533
G1 X205.935 Y135.699 E.01639
G1 X214.065 Y127.569 E.3533
G1 X214.065 Y127.036 E.01639
G1 X205.935 Y135.165 E.3533
G1 X205.935 Y134.632 E.01639
G1 X214.065 Y126.503 E.3533
G1 X214.065 Y125.969 E.01639
G1 X205.935 Y134.099 E.3533
G1 X205.935 Y133.565 E.01639
G1 X214.065 Y125.436 E.3533
G1 X214.065 Y124.903 E.01639
G1 X205.935 Y133.032 E.3533
G1 X205.935 Y132.499 E.01639
G1 X214.065 Y124.369 E.3533
G1 X214.065 Y123.836 E.01639
G1 X205.935 Y131.965 E.3533
G1 X205.935 Y131.432 E.01639
G1 X214.065 Y123.303 E.3533
G1 X214.065 Y122.769 E.01639
G1 X205.935 Y130.899 E.3533
G1 X205.935 Y130.365 E.01639
G1 X214.065 Y122.236 E.3533
G1 X214.065 Y121.703 E.01639
G1 X205.935 Y129.832 E.3533
G1 X205.935 Y129.299 E.01639
G1 X214.065 Y121.169 E.3533
G1 X214.065 Y120.636 E.01639
G1 X205.935 Y128.765 E.3533
G1 X205.935 Y128.232 E.01639
G1 X214.065 Y120.103 E.3533
G1 X214.065 Y119.569 E.01639
G1 X205.935 Y127.699 E.3533
G1 X205.935 Y127.165 E.01639
G1 X214.065 Y119.036 E.3533
G1 X214.065 Y118.503 E.01639
G1 X205.935 Y126.632 E.3533
G1 X205.935 Y126.099 E.01639
G1 X214.065 Y117.969 E.3533
G1 X214.065 Y117.436 E.01639
G1 X205.935 Y125.565 E.3533
G1 X205.935 Y125.032 E.01639
G1 X214.065 Y116.903 E.3533
G1 X214.065 Y116.369 E.01639
G1 X205.935 Y124.499 E.3533
G1 X205.935 Y123.965 E.01639
G1 X214.065 Y115.836 E.3533
G1 X214.065 Y115.303 E.01639
G1 X205.935 Y123.432 E.3533
G1 X205.935 Y122.899 E.01639
G1 X214.065 Y114.769 E.3533
G1 X214.065 Y114.236 E.01639
G1 X205.935 Y122.365 E.3533
G1 X205.935 Y121.832 E.01639
G1 X214.065 Y113.703 E.3533
G1 X214.065 Y113.169 E.01639
G1 X205.935 Y121.299 E.3533
G1 X205.935 Y120.765 E.01639
G1 X214.065 Y112.636 E.3533
G1 X214.065 Y112.103 E.01639
G1 X205.935 Y120.232 E.3533
G1 X205.935 Y119.699 E.01639
G1 X213.893 Y111.741 E.34585
G1 X213.36 Y111.741 E.01639
G1 X205.935 Y119.165 E.32267
G1 X205.935 Y118.632 E.01639
G1 X212.827 Y111.741 E.29949
G1 X212.293 Y111.741 E.01639
G1 X205.935 Y118.099 E.27631
G1 X205.935 Y117.565 E.01639
G1 X211.76 Y111.741 E.25313
G1 X211.227 Y111.741 E.01639
G1 X205.935 Y117.032 E.22996
G1 X205.935 Y116.499 E.01639
G1 X210.693 Y111.741 E.20678
G1 X210.16 Y111.741 E.01639
G1 X205.935 Y115.965 E.1836
G1 X205.935 Y115.432 E.01639
G1 X209.627 Y111.741 E.16042
G1 X209.093 Y111.741 E.01639
G1 X205.935 Y114.899 E.13724
G1 X205.935 Y114.365 E.01639
G1 X208.56 Y111.741 E.11406
G1 X208.026 Y111.741 E.01639
G1 X205.935 Y113.832 E.09088
G1 X205.935 Y113.299 E.01639
G1 X207.493 Y111.741 E.0677
G1 X206.96 Y111.741 E.01639
G1 X205.935 Y112.765 E.04452
G1 X205.935 Y112.232 E.01639
G1 X206.596 Y111.571 E.02872
G1 X206.431 Y111.349 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X208.059 Y111.349 E.05401
G1 X210.457 Y108.95 E.11251
G1 X210.738 Y108.95 E.0093
G1 X213.136 Y111.349 E.11251
G1 X214.05 Y111.349 E.0303
G1 X214.05 Y110.634 E.02371
G1 X214.05 Y145.366 F30000
G1 F15476.087
G1 X214.05 Y143.738 E.05401
G1 X210.738 Y147.05 E.15536
G1 X210.457 Y147.05 E.00931
G1 X206.651 Y143.244 E.17855
G1 X206.651 Y143.46 E.00719
G1 X210.46 Y139.651 E.17869
G1 X210.735 Y139.651 E.00911
G1 X214.05 Y142.966 E.1555
G1 X214.05 Y141.338 E.05401
G1 X214.234 Y138.6 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420046
G1 F15000
G1 X213.575 Y139.259 E.02866
G1 X213.042 Y139.259 E.01639
G1 X214.065 Y138.236 E.04446
G1 X214.065 Y137.703 E.01639
G1 X212.508 Y139.259 E.06764
G1 X211.975 Y139.259 E.01639
G1 X214.065 Y137.169 E.09082
G1 X214.065 Y136.636 E.01639
G1 X211.442 Y139.259 E.114
G1 X210.908 Y139.259 E.01639
G1 X214.065 Y136.103 E.13718
G1 X214.065 Y135.569 E.01639
G1 X210.375 Y139.259 E.16036
G1 X209.842 Y139.259 E.01639
G1 X214.065 Y135.036 E.18354
G1 X214.065 Y134.503 E.01639
G1 X209.308 Y139.259 E.20672
G1 X208.775 Y139.259 E.01639
G1 X214.065 Y133.969 E.22989
G1 X214.065 Y133.436 E.01639
G1 X208.242 Y139.259 E.25307
G1 X207.708 Y139.259 E.01639
G1 X214.065 Y132.903 E.27625
G1 X214.065 Y132.369 E.01639
G1 X207.175 Y139.259 E.29943
G1 X206.642 Y139.259 E.01639
G1 X214.065 Y131.836 E.32261
G1 X214.065 Y131.303 E.01639
G1 X198.303 Y147.065 E.68501
G1 X198.836 Y147.065 E.01639
G1 X206.259 Y139.642 E.32261
G1 X206.259 Y140.175 E.01639
G1 X199.369 Y147.065 E.29943
G1 X199.903 Y147.065 E.01639
G1 X206.259 Y140.708 E.27625
G1 X206.259 Y141.242 E.01639
G1 X200.436 Y147.065 E.25307
G1 X200.969 Y147.065 E.01639
G1 X206.259 Y141.775 E.2299
G1 X206.259 Y142.308 E.01639
G1 X201.503 Y147.065 E.20672
G1 X202.036 Y147.065 E.01639
G1 X206.259 Y142.842 E.18354
G1 X206.259 Y143.375 E.01639
G1 X202.569 Y147.065 E.16036
G1 X203.103 Y147.065 E.01639
G1 X206.259 Y143.908 E.13718
G1 X206.259 Y144.442 E.01639
G1 X203.636 Y147.065 E.114
G1 X204.169 Y147.065 E.01639
G1 X206.259 Y144.975 E.09082
G1 X206.259 Y145.508 E.01639
G1 X204.703 Y147.065 E.06764
G1 X205.236 Y147.065 E.01639
G1 X206.259 Y146.042 E.04446
G1 X206.259 Y146.575 E.01639
G1 X205.6 Y147.234 E.02866
M106 S209.1
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X206.259 Y146.575 E-.35438
G1 X206.259 Y146.042 E-.20267
G1 X205.882 Y146.419 E-.20295
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/275
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
G3 Z5.2 I.256 J-1.19 P1  F30000
G1 X45.602 Y111.922 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X45.602 Y108.602 E.11013
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y111.922 E.11013
G1 X45.662 Y111.922 E.28978
; WIPE_START
G1 F24000
G1 X45.626 Y109.923 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-1.173 J.323 P1  F30000
G1 X53.635 Y138.972 Z5.4
G1 Z5
G1 E.8 F1800
G1 F15476.087
G1 X53.922 Y138.972 E.00951
G1 X53.922 Y147.398 E.27952
G1 X45.602 Y147.398 E.27599
G1 X45.602 Y138.972 E.27952
G1 X53.575 Y138.972 E.26449
; WIPE_START
G1 F24000
G1 X53.922 Y138.972 E-.13179
G1 X53.922 Y140.625 E-.62821
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.012 J1.217 P1  F30000
G1 X206.078 Y139.078 Z5.4
G1 Z5
G1 E.8 F1800
G1 F15476.087
G1 X214.398 Y139.078 E.27599
G1 X214.398 Y147.398 E.27599
G1 X206.078 Y147.398 E.27599
G1 X206.078 Y139.138 E.274
; WIPE_START
G1 F24000
G1 X208.078 Y139.123 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.212 J-.11 P1  F30000
G1 X205.602 Y111.922 Z5.4
G1 Z5
G1 E.8 F1800
G1 F15476.087
G1 X205.602 Y108.602 E.11013
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y111.922 E.11013
G1 X205.662 Y111.922 E.28978
; WIPE_START
G1 F24000
G1 X205.626 Y109.923 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.224 J-1.196 P1  F30000
G1 X54.79 Y138.21 Z5.4
G1 Z5
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X205.21 Y138.21 E4.62199
G1 X205.21 Y108.21 E.92182
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y147.79 E1.21618
G1 X45.21 Y147.79 E5.21072
G1 X45.21 Y108.21 E1.21618
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y138.15 E.91997
M204 S10000
; WIPE_START
G1 F24000
G1 X56.79 Y138.151 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.343 J-1.168 P1  F30000
G1 X45.95 Y141.338 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X45.95 Y142.966 E.05401
G1 X49.596 Y139.32 E.17104
G1 X49.208 Y139.32 E.01287
G1 X53.574 Y143.686 E.2048
G1 X53.574 Y143.018 E.02213
G1 X49.543 Y147.05 E.18912
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y145.366 E.05401
; WIPE_START
G1 F24000
G1 X45.95 Y143.738 E-.61876
G1 X46.213 Y144.001 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.185 J.277 P1  F30000
G1 X53.795 Y111.574 Z5.4
G1 Z5
G1 E.8 F1800
G1 F15476.087
G1 X52.166 Y111.574 E.05401
G1 X49.543 Y108.95 E.12308
G1 X49.262 Y108.95 E.00931
G1 X46.638 Y111.574 E.12308
G1 X45.95 Y111.574 E.02283
G1 X45.95 Y110.634 E.03119
; WIPE_START
G1 F24000
G1 X45.95 Y111.574 E-.35727
G1 X46.638 Y111.574 E-.26149
G1 X46.901 Y111.311 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.002 J1.217 P1  F30000
G1 X206.205 Y111.574 Z5.4
G1 Z5
G1 E.8 F1800
G1 F15476.087
G1 X207.834 Y111.574 E.05401
G1 X210.457 Y108.95 E.12308
G1 X210.738 Y108.95 E.0093
G1 X213.362 Y111.574 E.12308
G1 X214.05 Y111.574 E.02283
G1 X214.05 Y110.634 E.03119
G1 X214.583 Y112.595 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X214.133 Y112.145 E.01955
G1 X213.599 Y112.145
G1 X214.583 Y113.128 E.04272
G1 X214.583 Y113.661
G1 X213.066 Y112.145 E.0659
G1 X212.533 Y112.145
G1 X214.583 Y114.194 E.08907
G1 X214.583 Y114.728
G1 X212 Y112.145 E.11224
G1 X211.466 Y112.145
G1 X214.583 Y115.261 E.13542
G1 X214.583 Y115.794
G1 X210.933 Y112.145 E.15859
G1 X210.4 Y112.145
G1 X214.583 Y116.327 E.18176
G1 X214.583 Y116.861
G1 X209.867 Y112.145 E.20494
G1 X209.333 Y112.145
G1 X214.583 Y117.394 E.22811
G1 X214.583 Y117.927
G1 X208.8 Y112.145 E.25128
G1 X208.267 Y112.145
G1 X214.583 Y118.46 E.27445
G1 X214.583 Y118.994
G1 X207.733 Y112.145 E.29763
G1 X207.2 Y112.145
G1 X214.583 Y119.527 E.3208
G1 X214.583 Y120.06
G1 X206.667 Y112.145 E.34397
G1 X206.134 Y112.145
G1 X214.583 Y120.594 E.36715
G1 X214.583 Y121.127
G1 X205.6 Y112.145 E.39032
G1 X205.417 Y112.495
G1 X214.583 Y121.66 E.39827
G1 X214.583 Y122.193
G1 X205.417 Y113.028 E.39827
G1 X205.417 Y113.561
G1 X214.583 Y122.727 E.39827
G1 X214.583 Y123.26
G1 X205.417 Y114.095 E.39827
G1 X205.417 Y114.628
G1 X214.583 Y123.793 E.39827
G1 X214.583 Y124.326
G1 X205.417 Y115.161 E.39827
G1 X205.417 Y115.695
G1 X214.583 Y124.86 E.39827
G1 X214.583 Y125.393
G1 X205.417 Y116.228 E.39827
G1 X205.417 Y116.761
G1 X214.583 Y125.926 E.39827
G1 X214.583 Y126.46
G1 X205.417 Y117.294 E.39827
G1 X205.417 Y117.828
G1 X214.583 Y126.993 E.39827
G1 X214.583 Y127.526
G1 X205.417 Y118.361 E.39827
G1 X205.417 Y118.894
G1 X214.583 Y128.059 E.39827
G1 X214.583 Y128.593
G1 X205.417 Y119.427 E.39827
G1 X205.417 Y119.961
G1 X214.583 Y129.126 E.39827
G1 X214.583 Y129.659
G1 X205.417 Y120.494 E.39827
G1 X205.417 Y121.027
G1 X214.583 Y130.192 E.39827
G1 X214.583 Y130.726
G1 X205.417 Y121.56 E.39827
G1 X205.417 Y122.094
G1 X214.583 Y131.259 E.39827
G1 X214.583 Y131.792
G1 X205.417 Y122.627 E.39827
G1 X205.417 Y123.16
G1 X214.583 Y132.326 E.39827
G1 X214.583 Y132.859
G1 X205.417 Y123.694 E.39827
G1 X205.417 Y124.227
G1 X214.583 Y133.392 E.39827
G1 X214.583 Y133.925
G1 X205.417 Y124.76 E.39827
G1 X205.417 Y125.293
G1 X214.583 Y134.459 E.39827
G1 X214.583 Y134.992
G1 X205.417 Y125.827 E.39827
G1 X205.417 Y126.36
G1 X214.583 Y135.525 E.39827
G1 X214.583 Y136.058
G1 X205.417 Y126.893 E.39827
G1 X205.417 Y127.426
G1 X214.583 Y136.592 E.39827
G1 X214.583 Y137.125
G1 X205.417 Y127.96 E.39827
G1 X205.417 Y128.493
G1 X214.583 Y137.658 E.39827
G1 X214.583 Y138.191
G1 X205.417 Y129.026 E.39827
G1 X205.417 Y129.56
G1 X214.583 Y138.725 E.39827
G1 X214.18 Y138.855
G1 X205.417 Y130.093 E.38078
G1 X205.417 Y130.626
G1 X213.647 Y138.855 E.3576
G1 X213.113 Y138.855
G1 X205.417 Y131.159 E.33443
G1 X205.417 Y131.693
G1 X212.58 Y138.855 E.31126
G1 X212.047 Y138.855
G1 X205.417 Y132.226 E.28808
G1 X205.417 Y132.759
G1 X211.514 Y138.855 E.26491
G1 X210.98 Y138.855
G1 X205.417 Y133.292 E.24174
G1 X205.417 Y133.826
G1 X210.447 Y138.855 E.21856
G1 X209.914 Y138.855
G1 X205.417 Y134.359 E.19539
G1 X205.417 Y134.892
G1 X209.381 Y138.855 E.17222
G1 X208.847 Y138.855
G1 X205.417 Y135.426 E.14904
G1 X205.417 Y135.959
G1 X208.314 Y138.855 E.12587
M73 P31 R37
G1 X207.781 Y138.855
G1 X205.417 Y136.492 E.1027
G1 X205.417 Y137.025
G1 X207.247 Y138.855 E.07953
G1 X206.714 Y138.855
G1 X205.417 Y137.559 E.05635
G1 X205.417 Y138.092
G1 X206.181 Y138.855 E.03318
G1 X205.855 Y139.063
G1 X205.21 Y138.417 E.02806
G1 X204.676 Y138.417
G1 X205.855 Y139.596 E.05123
G1 X205.855 Y140.13
G1 X204.143 Y138.417 E.07441
G1 X203.61 Y138.417
G1 X205.855 Y140.663 E.09758
G1 X205.855 Y141.196
G1 X203.077 Y138.417 E.12075
G1 X202.543 Y138.417
G1 X205.855 Y141.729 E.14393
G1 X205.855 Y142.263
G1 X202.01 Y138.417 E.1671
G1 X201.477 Y138.417
G1 X205.855 Y142.796 E.19027
G1 X205.855 Y143.329
G1 X200.943 Y138.417 E.21345
G1 X200.41 Y138.417
G1 X205.855 Y143.863 E.23662
G1 X205.855 Y144.396
G1 X199.877 Y138.417 E.25979
G1 X199.344 Y138.417
G1 X205.855 Y144.929 E.28296
G1 X205.855 Y145.462
G1 X198.81 Y138.417 E.30614
G1 X198.277 Y138.417
G1 X205.855 Y145.996 E.32931
G1 X205.855 Y146.529
G1 X197.744 Y138.417 E.35248
G1 X197.211 Y138.417
G1 X205.855 Y147.062 E.37566
G1 X205.843 Y147.583
G1 X196.677 Y138.417 E.39827
G1 X196.144 Y138.417
G1 X205.309 Y147.583 E.39827
G1 X204.776 Y147.583
G1 X195.611 Y138.417 E.39827
G1 X195.078 Y138.417
G1 X204.243 Y147.583 E.39827
G1 X203.709 Y147.583
G1 X194.544 Y138.417 E.39827
G1 X194.011 Y138.417
G1 X203.176 Y147.583 E.39827
G1 X202.643 Y147.583
G1 X193.478 Y138.417 E.39827
G1 X192.944 Y138.417
G1 X202.11 Y147.583 E.39827
G1 X201.576 Y147.583
G1 X192.411 Y138.417 E.39827
G1 X191.878 Y138.417
G1 X201.043 Y147.583 E.39827
G1 X200.51 Y147.583
G1 X191.345 Y138.417 E.39827
G1 X190.811 Y138.417
G1 X199.977 Y147.583 E.39827
G1 X199.443 Y147.583
G1 X190.278 Y138.417 E.39827
G1 X189.745 Y138.417
G1 X198.91 Y147.583 E.39827
G1 X198.377 Y147.583
G1 X189.212 Y138.417 E.39827
G1 X188.678 Y138.417
G1 X197.843 Y147.583 E.39827
G1 X197.31 Y147.583
G1 X188.145 Y138.417 E.39827
G1 X187.612 Y138.417
G1 X196.777 Y147.583 E.39827
G1 X196.244 Y147.583
G1 X187.078 Y138.417 E.39827
G1 X186.545 Y138.417
G1 X195.71 Y147.583 E.39827
G1 X195.177 Y147.583
G1 X186.012 Y138.417 E.39827
G1 X185.479 Y138.417
G1 X194.644 Y147.583 E.39827
G1 X194.111 Y147.583
G1 X184.945 Y138.417 E.39827
M73 P32 R37
G1 X184.412 Y138.417
G1 X193.577 Y147.583 E.39827
G1 X193.044 Y147.583
G1 X183.879 Y138.417 E.39827
G1 X183.346 Y138.417
G1 X192.511 Y147.583 E.39827
G1 X191.978 Y147.583
G1 X182.812 Y138.417 E.39827
G1 X182.279 Y138.417
G1 X191.444 Y147.583 E.39827
G1 X190.911 Y147.583
G1 X181.746 Y138.417 E.39827
G1 X181.212 Y138.417
G1 X190.378 Y147.583 E.39827
G1 X189.844 Y147.583
G1 X180.679 Y138.417 E.39827
G1 X180.146 Y138.417
G1 X189.311 Y147.583 E.39827
G1 X188.778 Y147.583
G1 X179.613 Y138.417 E.39827
G1 X179.079 Y138.417
G1 X188.245 Y147.583 E.39827
G1 X187.711 Y147.583
G1 X178.546 Y138.417 E.39827
G1 X178.013 Y138.417
G1 X187.178 Y147.583 E.39827
G1 X186.645 Y147.583
G1 X177.48 Y138.417 E.39827
G1 X176.946 Y138.417
G1 X186.112 Y147.583 E.39827
G1 X185.578 Y147.583
G1 X176.413 Y138.417 E.39827
G1 X175.88 Y138.417
G1 X185.045 Y147.583 E.39827
G1 X184.512 Y147.583
G1 X175.347 Y138.417 E.39827
G1 X174.813 Y138.417
G1 X183.978 Y147.583 E.39827
G1 X183.445 Y147.583
G1 X174.28 Y138.417 E.39827
G1 X173.747 Y138.417
G1 X182.912 Y147.583 E.39827
G1 X182.379 Y147.583
G1 X173.213 Y138.417 E.39827
G1 X172.68 Y138.417
G1 X181.845 Y147.583 E.39827
G1 X181.312 Y147.583
G1 X172.147 Y138.417 E.39827
G1 X171.614 Y138.417
G1 X180.779 Y147.583 E.39827
G1 X180.246 Y147.583
G1 X171.08 Y138.417 E.39827
G1 X170.547 Y138.417
G1 X179.712 Y147.583 E.39827
G1 X179.179 Y147.583
G1 X170.014 Y138.417 E.39827
G1 X169.481 Y138.417
G1 X178.646 Y147.583 E.39827
G1 X178.112 Y147.583
G1 X168.947 Y138.417 E.39827
G1 X168.414 Y138.417
G1 X177.579 Y147.583 E.39827
G1 X177.046 Y147.583
G1 X167.881 Y138.417 E.39827
G1 X167.347 Y138.417
G1 X176.513 Y147.583 E.39827
G1 X175.979 Y147.583
G1 X166.814 Y138.417 E.39827
G1 X166.281 Y138.417
G1 X175.446 Y147.583 E.39827
G1 X174.913 Y147.583
G1 X165.748 Y138.417 E.39827
G1 X165.214 Y138.417
G1 X174.38 Y147.583 E.39827
G1 X173.846 Y147.583
G1 X164.681 Y138.417 E.39827
G1 X164.148 Y138.417
G1 X173.313 Y147.583 E.39827
G1 X172.78 Y147.583
G1 X163.615 Y138.417 E.39827
G1 X163.081 Y138.417
G1 X172.247 Y147.583 E.39827
G1 X171.713 Y147.583
G1 X162.548 Y138.417 E.39827
G1 X162.015 Y138.417
G1 X171.18 Y147.583 E.39827
G1 X170.647 Y147.583
G1 X161.481 Y138.417 E.39827
G1 X160.948 Y138.417
G1 X170.113 Y147.583 E.39827
G1 X169.58 Y147.583
G1 X160.415 Y138.417 E.39827
G1 X159.882 Y138.417
G1 X169.047 Y147.583 E.39827
G1 X168.514 Y147.583
G1 X159.348 Y138.417 E.39827
G1 X158.815 Y138.417
G1 X167.98 Y147.583 E.39827
G1 X167.447 Y147.583
G1 X158.282 Y138.417 E.39827
G1 X157.749 Y138.417
G1 X166.914 Y147.583 E.39827
G1 X166.381 Y147.583
G1 X157.215 Y138.417 E.39827
G1 X156.682 Y138.417
G1 X165.847 Y147.583 E.39827
G1 X165.314 Y147.583
G1 X156.149 Y138.417 E.39827
G1 X155.616 Y138.417
G1 X164.781 Y147.583 E.39827
G1 X164.247 Y147.583
G1 X155.082 Y138.417 E.39827
G1 X154.549 Y138.417
G1 X163.714 Y147.583 E.39827
G1 X163.181 Y147.583
G1 X154.016 Y138.417 E.39827
G1 X153.482 Y138.417
G1 X162.648 Y147.583 E.39827
G1 X162.114 Y147.583
G1 X152.949 Y138.417 E.39827
G1 X152.416 Y138.417
G1 X161.581 Y147.583 E.39827
G1 X161.048 Y147.583
G1 X151.883 Y138.417 E.39827
G1 X151.349 Y138.417
G1 X160.515 Y147.583 E.39827
G1 X159.981 Y147.583
G1 X150.816 Y138.417 E.39827
G1 X150.283 Y138.417
G1 X159.448 Y147.583 E.39827
G1 X158.915 Y147.583
G1 X149.75 Y138.417 E.39827
G1 X149.216 Y138.417
G1 X158.381 Y147.583 E.39827
G1 X157.848 Y147.583
G1 X148.683 Y138.417 E.39827
G1 X148.15 Y138.417
G1 X157.315 Y147.583 E.39827
G1 X156.782 Y147.583
G1 X147.616 Y138.417 E.39827
G1 X147.083 Y138.417
G1 X156.248 Y147.583 E.39827
G1 X155.715 Y147.583
G1 X146.55 Y138.417 E.39827
G1 X146.017 Y138.417
G1 X155.182 Y147.583 E.39827
G1 X154.649 Y147.583
G1 X145.483 Y138.417 E.39827
G1 X144.95 Y138.417
G1 X154.115 Y147.583 E.39827
G1 X153.582 Y147.583
G1 X144.417 Y138.417 E.39827
G1 X143.884 Y138.417
G1 X153.049 Y147.583 E.39827
G1 X152.516 Y147.583
G1 X143.35 Y138.417 E.39827
G1 X142.817 Y138.417
G1 X151.982 Y147.583 E.39827
G1 X151.449 Y147.583
G1 X142.284 Y138.417 E.39827
G1 X141.75 Y138.417
G1 X150.916 Y147.583 E.39827
G1 X150.382 Y147.583
G1 X141.217 Y138.417 E.39827
G1 X140.684 Y138.417
G1 X149.849 Y147.583 E.39827
G1 X149.316 Y147.583
G1 X140.151 Y138.417 E.39827
G1 X139.617 Y138.417
G1 X148.783 Y147.583 E.39827
G1 X148.249 Y147.583
G1 X139.084 Y138.417 E.39827
G1 X138.551 Y138.417
G1 X147.716 Y147.583 E.39827
G1 X147.183 Y147.583
G1 X138.018 Y138.417 E.39827
G1 X137.484 Y138.417
G1 X146.65 Y147.583 E.39827
G1 X146.116 Y147.583
G1 X136.951 Y138.417 E.39827
G1 X136.418 Y138.417
G1 X145.583 Y147.583 E.39827
G1 X145.05 Y147.583
G1 X135.885 Y138.417 E.39827
G1 X135.351 Y138.417
G1 X144.516 Y147.583 E.39827
G1 X143.983 Y147.583
G1 X134.818 Y138.417 E.39827
G1 X134.285 Y138.417
G1 X143.45 Y147.583 E.39827
G1 X142.917 Y147.583
G1 X133.751 Y138.417 E.39827
G1 X133.218 Y138.417
G1 X142.383 Y147.583 E.39827
G1 X141.85 Y147.583
G1 X132.685 Y138.417 E.39827
G1 X132.152 Y138.417
G1 X141.317 Y147.583 E.39827
G1 X140.784 Y147.583
G1 X131.618 Y138.417 E.39827
G1 X131.085 Y138.417
G1 X140.25 Y147.583 E.39827
G1 X139.717 Y147.583
G1 X130.552 Y138.417 E.39827
G1 X130.019 Y138.417
G1 X139.184 Y147.583 E.39827
G1 X138.65 Y147.583
G1 X129.485 Y138.417 E.39827
G1 X128.952 Y138.417
G1 X138.117 Y147.583 E.39827
G1 X137.584 Y147.583
G1 X128.419 Y138.417 E.39827
G1 X127.885 Y138.417
G1 X137.051 Y147.583 E.39827
G1 X136.517 Y147.583
G1 X127.352 Y138.417 E.39827
G1 X126.819 Y138.417
G1 X135.984 Y147.583 E.39827
G1 X135.451 Y147.583
G1 X126.286 Y138.417 E.39827
G1 X125.752 Y138.417
G1 X134.918 Y147.583 E.39827
G1 X134.384 Y147.583
G1 X125.219 Y138.417 E.39827
G1 X124.686 Y138.417
G1 X133.851 Y147.583 E.39827
G1 X133.318 Y147.583
G1 X124.153 Y138.417 E.39827
G1 X123.619 Y138.417
G1 X132.785 Y147.583 E.39827
G1 X132.251 Y147.583
G1 X123.086 Y138.417 E.39827
G1 X122.553 Y138.417
G1 X131.718 Y147.583 E.39827
G1 X131.185 Y147.583
G1 X122.02 Y138.417 E.39827
G1 X121.486 Y138.417
G1 X130.651 Y147.583 E.39827
G1 X130.118 Y147.583
G1 X120.953 Y138.417 E.39827
G1 X120.42 Y138.417
G1 X129.585 Y147.583 E.39827
G1 X129.052 Y147.583
G1 X119.886 Y138.417 E.39827
G1 X119.353 Y138.417
G1 X128.518 Y147.583 E.39827
G1 X127.985 Y147.583
G1 X118.82 Y138.417 E.39827
G1 X118.287 Y138.417
G1 X127.452 Y147.583 E.39827
G1 X126.919 Y147.583
G1 X117.753 Y138.417 E.39827
G1 X117.22 Y138.417
G1 X126.385 Y147.583 E.39827
G1 X125.852 Y147.583
G1 X116.687 Y138.417 E.39827
G1 X116.154 Y138.417
G1 X125.319 Y147.583 E.39827
G1 X124.785 Y147.583
G1 X115.62 Y138.417 E.39827
G1 X115.087 Y138.417
G1 X124.252 Y147.583 E.39827
G1 X123.719 Y147.583
G1 X114.554 Y138.417 E.39827
G1 X114.02 Y138.417
G1 X123.186 Y147.583 E.39827
G1 X122.652 Y147.583
G1 X113.487 Y138.417 E.39827
G1 X112.954 Y138.417
G1 X122.119 Y147.583 E.39827
G1 X121.586 Y147.583
G1 X112.421 Y138.417 E.39827
G1 X111.887 Y138.417
G1 X121.053 Y147.583 E.39827
G1 X120.519 Y147.583
G1 X111.354 Y138.417 E.39827
G1 X110.821 Y138.417
G1 X119.986 Y147.583 E.39827
G1 X119.453 Y147.583
G1 X110.288 Y138.417 E.39827
G1 X109.754 Y138.417
G1 X118.92 Y147.583 E.39827
G1 X118.386 Y147.583
G1 X109.221 Y138.417 E.39827
G1 X108.688 Y138.417
G1 X117.853 Y147.583 E.39827
G1 X117.32 Y147.583
G1 X108.154 Y138.417 E.39827
G1 X107.621 Y138.417
G1 X116.786 Y147.583 E.39827
G1 X116.253 Y147.583
G1 X107.088 Y138.417 E.39827
G1 X106.555 Y138.417
G1 X115.72 Y147.583 E.39827
G1 X115.187 Y147.583
G1 X106.021 Y138.417 E.39827
G1 X105.488 Y138.417
G1 X114.653 Y147.583 E.39827
G1 X114.12 Y147.583
G1 X104.955 Y138.417 E.39827
G1 X104.422 Y138.417
G1 X113.587 Y147.583 E.39827
G1 X113.054 Y147.583
G1 X103.888 Y138.417 E.39827
G1 X103.355 Y138.417
G1 X112.52 Y147.583 E.39827
G1 X111.987 Y147.583
G1 X102.822 Y138.417 E.39827
G1 X102.289 Y138.417
G1 X111.454 Y147.583 E.39827
G1 X110.92 Y147.583
G1 X101.755 Y138.417 E.39827
G1 X101.222 Y138.417
G1 X110.387 Y147.583 E.39827
G1 X109.854 Y147.583
G1 X100.689 Y138.417 E.39827
G1 X100.155 Y138.417
G1 X109.321 Y147.583 E.39827
G1 X108.787 Y147.583
G1 X99.622 Y138.417 E.39827
G1 X99.089 Y138.417
G1 X108.254 Y147.583 E.39827
G1 X107.721 Y147.583
G1 X98.556 Y138.417 E.39827
G1 X98.022 Y138.417
G1 X107.188 Y147.583 E.39827
G1 X106.654 Y147.583
G1 X97.489 Y138.417 E.39827
G1 X96.956 Y138.417
G1 X106.121 Y147.583 E.39827
G1 X105.588 Y147.583
G1 X96.423 Y138.417 E.39827
G1 X95.889 Y138.417
G1 X105.054 Y147.583 E.39827
G1 X104.521 Y147.583
G1 X95.356 Y138.417 E.39827
G1 X94.823 Y138.417
G1 X103.988 Y147.583 E.39827
G1 X103.455 Y147.583
G1 X94.289 Y138.417 E.39827
G1 X93.756 Y138.417
G1 X102.921 Y147.583 E.39827
G1 X102.388 Y147.583
G1 X93.223 Y138.417 E.39827
G1 X92.69 Y138.417
G1 X101.855 Y147.583 E.39827
G1 X101.322 Y147.583
G1 X92.156 Y138.417 E.39827
G1 X91.623 Y138.417
G1 X100.788 Y147.583 E.39827
G1 X100.255 Y147.583
G1 X91.09 Y138.417 E.39827
G1 X90.557 Y138.417
G1 X99.722 Y147.583 E.39827
G1 X99.189 Y147.583
G1 X90.023 Y138.417 E.39827
G1 X89.49 Y138.417
G1 X98.655 Y147.583 E.39827
G1 X98.122 Y147.583
G1 X88.957 Y138.417 E.39827
G1 X88.423 Y138.417
G1 X97.589 Y147.583 E.39827
G1 X97.055 Y147.583
G1 X87.89 Y138.417 E.39827
G1 X87.357 Y138.417
G1 X96.522 Y147.583 E.39827
G1 X95.989 Y147.583
G1 X86.824 Y138.417 E.39827
G1 X86.29 Y138.417
G1 X95.456 Y147.583 E.39827
G1 X94.922 Y147.583
G1 X85.757 Y138.417 E.39827
G1 X85.224 Y138.417
G1 X94.389 Y147.583 E.39827
G1 X93.856 Y147.583
G1 X84.691 Y138.417 E.39827
G1 X84.157 Y138.417
G1 X93.323 Y147.583 E.39827
G1 X92.789 Y147.583
G1 X83.624 Y138.417 E.39827
G1 X83.091 Y138.417
G1 X92.256 Y147.583 E.39827
G1 X91.723 Y147.583
G1 X82.558 Y138.417 E.39827
G1 X82.024 Y138.417
M73 P33 R37
G1 X91.189 Y147.583 E.39827
G1 X90.656 Y147.583
G1 X81.491 Y138.417 E.39827
G1 X80.958 Y138.417
G1 X90.123 Y147.583 E.39827
G1 X89.59 Y147.583
G1 X80.424 Y138.417 E.39827
G1 X79.891 Y138.417
G1 X89.056 Y147.583 E.39827
G1 X88.523 Y147.583
G1 X79.358 Y138.417 E.39827
G1 X78.825 Y138.417
G1 X87.99 Y147.583 E.39827
G1 X87.457 Y147.583
G1 X78.291 Y138.417 E.39827
G1 X77.758 Y138.417
G1 X86.923 Y147.583 E.39827
G1 X86.39 Y147.583
G1 X77.225 Y138.417 E.39827
G1 X76.692 Y138.417
G1 X85.857 Y147.583 E.39827
G1 X85.323 Y147.583
G1 X76.158 Y138.417 E.39827
G1 X75.625 Y138.417
G1 X84.79 Y147.583 E.39827
G1 X84.257 Y147.583
G1 X75.092 Y138.417 E.39827
G1 X74.558 Y138.417
G1 X83.724 Y147.583 E.39827
G1 X83.19 Y147.583
G1 X74.025 Y138.417 E.39827
G1 X73.492 Y138.417
G1 X82.657 Y147.583 E.39827
G1 X82.124 Y147.583
G1 X72.959 Y138.417 E.39827
G1 X72.425 Y138.417
G1 X81.591 Y147.583 E.39827
G1 X81.057 Y147.583
G1 X71.892 Y138.417 E.39827
G1 X71.359 Y138.417
G1 X80.524 Y147.583 E.39827
G1 X79.991 Y147.583
G1 X70.826 Y138.417 E.39827
G1 X70.292 Y138.417
G1 X79.458 Y147.583 E.39827
G1 X78.924 Y147.583
G1 X69.759 Y138.417 E.39827
G1 X69.226 Y138.417
G1 X78.391 Y147.583 E.39827
G1 X77.858 Y147.583
G1 X68.692 Y138.417 E.39827
G1 X68.159 Y138.417
G1 X77.324 Y147.583 E.39827
G1 X76.791 Y147.583
G1 X67.626 Y138.417 E.39827
G1 X67.093 Y138.417
G1 X76.258 Y147.583 E.39827
G1 X75.725 Y147.583
G1 X66.559 Y138.417 E.39827
G1 X66.026 Y138.417
G1 X75.191 Y147.583 E.39827
G1 X74.658 Y147.583
G1 X65.493 Y138.417 E.39827
G1 X64.96 Y138.417
G1 X74.125 Y147.583 E.39827
G1 X73.592 Y147.583
G1 X64.426 Y138.417 E.39827
G1 X63.893 Y138.417
G1 X73.058 Y147.583 E.39827
G1 X72.525 Y147.583
G1 X63.36 Y138.417 E.39827
G1 X62.827 Y138.417
G1 X71.992 Y147.583 E.39827
G1 X71.458 Y147.583
G1 X62.293 Y138.417 E.39827
G1 X61.76 Y138.417
G1 X70.925 Y147.583 E.39827
G1 X70.392 Y147.583
G1 X61.227 Y138.417 E.39827
G1 X60.693 Y138.417
G1 X69.859 Y147.583 E.39827
G1 X69.325 Y147.583
G1 X60.16 Y138.417 E.39827
G1 X59.627 Y138.417
G1 X68.792 Y147.583 E.39827
G1 X68.259 Y147.583
G1 X59.094 Y138.417 E.39827
G1 X58.56 Y138.417
G1 X67.726 Y147.583 E.39827
G1 X67.192 Y147.583
G1 X58.027 Y138.417 E.39827
G1 X57.494 Y138.417
G1 X66.659 Y147.583 E.39827
G1 X66.126 Y147.583
G1 X56.961 Y138.417 E.39827
G1 X56.427 Y138.417
G1 X65.592 Y147.583 E.39827
G1 X65.059 Y147.583
G1 X55.894 Y138.417 E.39827
G1 X55.361 Y138.417
G1 X64.526 Y147.583 E.39827
G1 X63.993 Y147.583
G1 X54.827 Y138.417 E.39827
M204 S10000
; WIPE_START
G1 F24000
G1 X56.242 Y139.832 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.215 J-.074 P1  F30000
G1 X54.583 Y112.576 Z5.4
G1 Z5
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X54.152 Y112.145 E.01873
G1 X53.618 Y112.145
G1 X54.583 Y113.109 E.0419
G1 X54.583 Y113.642
G1 X53.085 Y112.145 E.06507
G1 X52.552 Y112.145
G1 X54.583 Y114.175 E.08825
G1 X54.583 Y114.709
G1 X52.019 Y112.145 E.11142
G1 X51.485 Y112.145
G1 X54.583 Y115.242 E.13459
G1 X54.583 Y115.775
G1 X50.952 Y112.145 E.15777
G1 X50.419 Y112.145
G1 X54.583 Y116.308 E.18094
G1 X54.583 Y116.842
G1 X49.885 Y112.145 E.20411
G1 X49.352 Y112.145
G1 X54.583 Y117.375 E.22729
G1 X54.583 Y117.908
G1 X48.819 Y112.145 E.25046
G1 X48.286 Y112.145
G1 X54.583 Y118.442 E.27363
G1 X54.583 Y118.975
G1 X47.752 Y112.145 E.29681
G1 X47.219 Y112.145
G1 X54.583 Y119.508 E.31998
G1 X54.583 Y120.041
G1 X46.686 Y112.145 E.34315
G1 X46.153 Y112.145
G1 X54.583 Y120.575 E.36632
G1 X54.583 Y121.108
G1 X45.619 Y112.145 E.3895
G1 X45.417 Y112.476
G1 X54.583 Y121.641 E.39827
G1 X54.583 Y122.174
G1 X45.417 Y113.009 E.39827
G1 X45.417 Y113.542
G1 X54.583 Y122.708 E.39827
G1 X54.583 Y123.241
G1 X45.417 Y114.076 E.39827
G1 X45.417 Y114.609
G1 X54.583 Y123.774 E.39827
G1 X54.583 Y124.308
G1 X45.417 Y115.142 E.39827
G1 X45.417 Y115.676
G1 X54.583 Y124.841 E.39827
G1 X54.583 Y125.374
G1 X45.417 Y116.209 E.39827
G1 X45.417 Y116.742
G1 X54.583 Y125.907 E.39827
G1 X54.583 Y126.441
G1 X45.417 Y117.275 E.39827
G1 X45.417 Y117.809
G1 X54.583 Y126.974 E.39827
G1 X54.583 Y127.507
G1 X45.417 Y118.342 E.39827
G1 X45.417 Y118.875
G1 X54.583 Y128.04 E.39827
G1 X54.583 Y128.574
G1 X45.417 Y119.408 E.39827
G1 X45.417 Y119.942
G1 X54.583 Y129.107 E.39827
G1 X54.583 Y129.64
G1 X45.417 Y120.475 E.39827
G1 X45.417 Y121.008
G1 X54.583 Y130.173 E.39827
G1 X54.583 Y130.707
G1 X45.417 Y121.542 E.39827
G1 X45.417 Y122.075
G1 X54.583 Y131.24 E.39827
G1 X54.583 Y131.773
G1 X45.417 Y122.608 E.39827
G1 X45.417 Y123.141
G1 X54.583 Y132.307 E.39827
G1 X54.583 Y132.84
G1 X45.417 Y123.675 E.39827
G1 X45.417 Y124.208
G1 X54.583 Y133.373 E.39827
G1 X54.583 Y133.906
G1 X45.417 Y124.741 E.39827
G1 X45.417 Y125.274
G1 X54.583 Y134.44 E.39827
G1 X54.583 Y134.973
G1 X45.417 Y125.808 E.39827
G1 X45.417 Y126.341
G1 X54.583 Y135.506 E.39827
G1 X54.583 Y136.039
G1 X45.417 Y126.874 E.39827
G1 X45.417 Y127.408
G1 X54.583 Y136.573 E.39827
G1 X54.583 Y137.106
G1 X45.417 Y127.941 E.39827
G1 X45.417 Y128.474
G1 X54.583 Y137.639 E.39827
G1 X54.583 Y138.173
G1 X45.417 Y129.007 E.39827
G1 X45.417 Y129.541
G1 X63.459 Y147.583 E.78401
G1 X62.926 Y147.583
G1 X54.145 Y138.801 E.3816
G1 X54.145 Y139.334
G1 X62.393 Y147.583 E.35843
G1 X61.86 Y147.583
G1 X54.145 Y139.868 E.33525
G1 X54.145 Y140.401
G1 X61.326 Y147.583 E.31208
G1 X60.793 Y147.583
G1 X54.145 Y140.934 E.28891
G1 X54.145 Y141.467
G1 X60.26 Y147.583 E.26573
G1 X59.727 Y147.583
G1 X54.145 Y142.001 E.24256
G1 X54.145 Y142.534
G1 X59.193 Y147.583 E.21939
G1 X58.66 Y147.583
G1 X54.145 Y143.067 E.19621
G1 X54.145 Y143.601
G1 X58.127 Y147.583 E.17304
G1 X57.593 Y147.583
G1 X54.145 Y144.134 E.14987
G1 X54.145 Y144.667
G1 X57.06 Y147.583 E.12669
G1 X56.527 Y147.583
G1 X54.145 Y145.2 E.10352
G1 X54.145 Y145.734
G1 X55.994 Y147.583 E.08035
G1 X55.46 Y147.583
G1 X54.145 Y146.267 E.05717
G1 X54.145 Y146.8
G1 X54.927 Y147.583 E.034
M204 S10000
G1 X54.093 Y138.749 F30000
M204 S2000
G1 F12000
G1 X45.417 Y130.074 E.37699
G1 X45.417 Y130.607
G1 X53.559 Y138.749 E.35381
G1 X53.026 Y138.749
G1 X45.417 Y131.14 E.33064
G1 X45.417 Y131.674
G1 X52.493 Y138.749 E.30747
G1 X51.96 Y138.749
M73 P33 R36
G1 X45.417 Y132.207 E.28429
G1 X45.417 Y132.74
G1 X51.426 Y138.749 E.26112
G1 X50.893 Y138.749
G1 X45.417 Y133.273 E.23795
G1 X45.417 Y133.807
G1 X50.36 Y138.749 E.21477
G1 X49.827 Y138.749
G1 X45.417 Y134.34 E.1916
G1 X45.417 Y134.873
G1 X49.293 Y138.749 E.16843
G1 X48.76 Y138.749
G1 X45.417 Y135.407 E.14525
G1 X45.417 Y135.94
G1 X48.227 Y138.749 E.12208
G1 X47.694 Y138.749
G1 X45.417 Y136.473 E.09891
G1 X45.417 Y137.006
G1 X47.16 Y138.749 E.07574
G1 X46.627 Y138.749
G1 X45.417 Y137.54 E.05256
G1 X45.417 Y138.073
G1 X46.094 Y138.749 E.02939
M204 S10000
G1 X54.252 Y138.642 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.116263
G1 F15000
G1 X54.152 Y138.742 E.00085
G1 X54.141 Y138.805 E.00038
G1 X54.712 Y138.533 F30000
; LINE_WIDTH: 0.092198
G1 F15000
G1 X54.467 Y138.288 E.00139
; WIPE_START
G1 F24000
G1 X54.712 Y138.533 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I-.021 J1.217 P1  F30000
G1 X214.05 Y141.338 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X214.05 Y142.966 E.05401
G1 X210.51 Y139.426 E.16607
G1 X210.686 Y139.426 E.00583
G1 X206.426 Y143.686 E.19982
G1 X206.426 Y143.018 E.02213
G1 X210.457 Y147.05 E.18912
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y145.366 E.05401
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X214.05 Y143.738 E-.61876
G1 X213.787 Y144.001 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/275
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
G3 Z5.4 I.042 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3053
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3053
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3053
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3053
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3053
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3053
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3053
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3053
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3053
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3053
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3053
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3053
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/275
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
G3 Z5.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
M73 P34 R36
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/275
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
G3 Z5.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/275
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
G3 Z6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/275
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
G3 Z6.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
M73 P35 R36
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/275
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
G3 Z6.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/275
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
G3 Z6.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
M73 P35 R35
G1 E-.04 F1800
G17
G3 Z6.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/275
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
G3 Z6.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/275
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
G3 Z7 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
M73 P36 R35
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/275
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
G3 Z7.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/275
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
G3 Z7.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/275
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
G3 Z7.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
M73 P37 R35
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/275
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
G3 Z7.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
M73 P37 R34
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/275
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
G3 Z8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/275
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
G3 Z8.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/275
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
G3 Z8.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
M73 P38 R34
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/275
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
G3 Z8.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/275
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
G3 Z8.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/275
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
G3 Z9 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
M73 P39 R33
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/275
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
G3 Z9.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/275
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
G3 Z9.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/275
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
G3 Z9.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/275
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
G3 Z9.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
M73 P40 R33
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/275
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
G3 Z10 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/275
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
G3 Z10.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/275
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
G3 Z10.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
M73 P40 R32
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P41 R32
G3 Z10.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/275
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
G3 Z10.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/275
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
G3 Z10.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/275
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
G3 Z11 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/275
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
G3 Z11.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P42 R32
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/275
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
G3 Z11.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/275
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
G3 Z11.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
M73 P42 R31
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/275
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
G3 Z11.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
M73 P43 R31
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/275
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
G3 Z12 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/275
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
G3 Z12.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/275
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
G3 Z12.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/275
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
G3 Z12.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z12.6
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
M73 P44 R31
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/275
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
G3 Z12.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P44 R30
G3 Z13 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/275
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
G3 Z13 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/275
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
G3 Z13.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/275
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
G3 Z13.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
M73 P45 R30
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/275
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
G3 Z13.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/275
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
G3 Z13.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I.263 J1.188 P1  F30000
G1 X45.95 Y110.634 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X45.95 Y112.05 E.04697
G1 X46.163 Y112.05 E.00705
G1 X49.262 Y108.95 E.1454
G1 X49.543 Y108.95 E.00931
G1 X52.642 Y112.05 E.1454
G1 X53.839 Y112.05 E.0397
G1 X54.05 Y111.839 E.0099
G1 X54.05 Y110.21 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y111.839 E-.61876
G1 X53.839 Y112.05 E-.11336
G1 X53.765 Y112.05 E-.02788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I.772 J.941 P1  F30000
G1 X205.95 Y110.21 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y111.839 E.05401
G1 X206.161 Y112.05 E.00989
G1 X207.358 Y112.05 E.0397
G1 X210.457 Y108.95 E.1454
G1 X210.738 Y108.95 E.0093
G1 X213.837 Y112.05 E.1454
G1 X214.05 Y112.05 E.00705
G1 X214.05 Y110.634 E.04697
; WIPE_START
G1 F24000
G1 X214.05 Y112.05 E-.53803
G1 X213.837 Y112.05 E-.08073
G1 X213.574 Y111.787 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-1.167 J-.347 P1  F30000
G1 X205.602 Y138.602 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3047
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3047
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3047
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/275
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
G3 Z14 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3393
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3393
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3393
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3393
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3393
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-.337 J1.169 P1  F30000
G1 X48.198 Y111.643 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3393
G1 X46.57 Y111.643 E.05401
G1 X48.855 Y109.357 E.1072
G1 X49.95 Y109.357 E.03631
G1 X52.235 Y111.643 E.1072
G1 X53.643 Y111.643 E.0467
G1 X53.643 Y111.422 E.00732
G1 X54.05 Y111.99 F30000
G1 F3393
G1 X54.05 Y108.95 E.10082
G1 X45.95 Y108.95 E.26867
G1 X45.95 Y112.05 E.10281
G1 X54.05 Y112.05 E.26867
; WIPE_START
G1 F24000
G1 X52.05 Y112.05 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3393
M73 P46 R30
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3393
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-.601 J1.058 P1  F30000
G1 X206.357 Y111.422 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3393
G1 X206.357 Y111.643 E.00732
G1 X207.765 Y111.643 E.0467
G1 X210.05 Y109.357 E.1072
G1 X211.145 Y109.357 E.03631
G1 X213.43 Y111.643 E.1072
G1 X211.802 Y111.643 E.05401
G1 X214.05 Y111.99 F30000
G1 F3393
G1 X214.05 Y108.95 E.10082
G1 X205.95 Y108.95 E.26867
G1 X205.95 Y112.05 E.10281
G1 X214.05 Y112.05 E.26867
; WIPE_START
G1 F24000
G1 X212.05 Y112.05 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-1.183 J-.287 P1  F30000
G1 X205.602 Y138.602 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3393
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3393
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3393
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/275
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
G3 Z14.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3393
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3393
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3393
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
M73 P46 R29
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3393
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3393
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-.337 J1.169 P1  F30000
G1 X48.198 Y111.643 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3393
G1 X46.57 Y111.643 E.05401
G1 X48.855 Y109.357 E.1072
G1 X49.95 Y109.357 E.03631
G1 X52.235 Y111.643 E.1072
G1 X53.643 Y111.643 E.0467
G1 X53.643 Y111.422 E.00732
G1 X54.05 Y111.99 F30000
G1 F3393
G1 X54.05 Y108.95 E.10082
G1 X45.95 Y108.95 E.26867
G1 X45.95 Y112.05 E.10281
G1 X54.05 Y112.05 E.26867
; WIPE_START
G1 F24000
G1 X52.05 Y112.05 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3393
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3393
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-.601 J1.058 P1  F30000
G1 X206.357 Y111.422 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3393
G1 X206.357 Y111.643 E.00732
G1 X207.765 Y111.643 E.0467
G1 X210.05 Y109.357 E.1072
G1 X211.145 Y109.357 E.03631
G1 X213.43 Y111.643 E.1072
G1 X211.802 Y111.643 E.05401
G1 X214.05 Y111.99 F30000
G1 F3393
G1 X214.05 Y108.95 E.10082
G1 X205.95 Y108.95 E.26867
G1 X205.95 Y112.05 E.10281
G1 X214.05 Y112.05 E.26867
; WIPE_START
G1 F24000
G1 X212.05 Y112.05 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-1.183 J-.287 P1  F30000
G1 X205.602 Y138.602 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3393
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3393
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3393
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/275
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
G3 Z14.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3393
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3393
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3393
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3393
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3393
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-.337 J1.169 P1  F30000
G1 X48.198 Y111.643 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3393
G1 X46.57 Y111.643 E.05401
G1 X48.855 Y109.357 E.1072
G1 X49.95 Y109.357 E.03631
G1 X52.235 Y111.643 E.1072
G1 X53.643 Y111.643 E.0467
G1 X53.643 Y111.422 E.00732
G1 X54.05 Y111.99 F30000
G1 F3393
G1 X54.05 Y108.95 E.10082
G1 X45.95 Y108.95 E.26867
G1 X45.95 Y112.05 E.10281
G1 X54.05 Y112.05 E.26867
; WIPE_START
G1 F24000
G1 X52.05 Y112.05 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3393
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3393
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-.601 J1.058 P1  F30000
G1 X206.357 Y111.422 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3393
G1 X206.357 Y111.643 E.00732
G1 X207.765 Y111.643 E.0467
G1 X210.05 Y109.357 E.1072
G1 X211.145 Y109.357 E.03631
G1 X213.43 Y111.643 E.1072
G1 X211.802 Y111.643 E.05401
G1 X214.05 Y111.99 F30000
G1 F3393
G1 X214.05 Y108.95 E.10082
G1 X205.95 Y108.95 E.26867
G1 X205.95 Y112.05 E.10281
G1 X214.05 Y112.05 E.26867
; WIPE_START
G1 F24000
G1 X212.05 Y112.05 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-1.183 J-.287 P1  F30000
G1 X205.602 Y138.602 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3393
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3393
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3393
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/275
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
G3 Z14.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3393
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3393
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3393
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3393
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3393
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-.337 J1.169 P1  F30000
G1 X48.198 Y111.643 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3393
G1 X46.57 Y111.643 E.05401
G1 X48.855 Y109.357 E.1072
G1 X49.95 Y109.357 E.03631
G1 X52.235 Y111.643 E.1072
G1 X53.643 Y111.643 E.0467
G1 X53.643 Y111.422 E.00732
G1 X54.05 Y111.99 F30000
G1 F3393
G1 X54.05 Y108.95 E.10082
G1 X45.95 Y108.95 E.26867
G1 X45.95 Y112.05 E.10281
G1 X54.05 Y112.05 E.26867
; WIPE_START
G1 F24000
G1 X52.05 Y112.05 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3393
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3393
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-.601 J1.058 P1  F30000
G1 X206.357 Y111.422 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3393
G1 X206.357 Y111.643 E.00732
G1 X207.765 Y111.643 E.0467
G1 X210.05 Y109.357 E.1072
G1 X211.145 Y109.357 E.03631
G1 X213.43 Y111.643 E.1072
G1 X211.802 Y111.643 E.05401
G1 X214.05 Y111.99 F30000
G1 F3393
G1 X214.05 Y108.95 E.10082
G1 X205.95 Y108.95 E.26867
G1 X205.95 Y112.05 E.10281
G1 X214.05 Y112.05 E.26867
; WIPE_START
G1 F24000
G1 X212.05 Y112.05 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-1.183 J-.287 P1  F30000
G1 X205.602 Y138.602 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3393
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3393
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3393
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/275
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
G3 Z14.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z14.8
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4344
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4344
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
M73 P47 R29
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4344
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4344
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4344
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
G1 X45.983 Y112.231 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.422578
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X45.983 Y108.972 E.18622
G1 X46.456 Y108.972 E.027
G1 X46.456 Y112.028 E.17465
G1 X46.928 Y112.028 E.027
G1 X46.928 Y108.972 E.17465
G1 X47.401 Y108.972 E.027
G1 X47.401 Y112.028 E.17465
G1 X47.873 Y112.028 E.027
G1 X47.873 Y108.972 E.17465
G1 X48.346 Y108.972 E.027
G1 X48.346 Y112.028 E.17465
G1 X48.819 Y112.028 E.027
G1 X48.819 Y108.972 E.17465
G1 X49.291 Y108.972 E.027
G1 X49.291 Y112.028 E.17465
G1 X49.764 Y112.028 E.027
G1 X49.764 Y108.972 E.17465
G1 X50.236 Y108.972 E.027
G1 X50.236 Y112.028 E.17465
G1 X50.709 Y112.028 E.027
G1 X50.709 Y108.972 E.17465
G1 X51.181 Y108.972 E.027
G1 X51.181 Y112.028 E.17465
G1 X51.654 Y112.028 E.027
G1 X51.654 Y108.972 E.17465
G1 X52.127 Y108.972 E.027
G1 X52.127 Y112.028 E.17465
G1 X52.599 Y112.028 E.027
G1 X52.599 Y108.972 E.17465
G1 X53.072 Y108.972 E.027
G1 X53.072 Y112.028 E.17465
G1 X53.544 Y112.028 E.027
G1 X53.544 Y108.972 E.17465
G1 X54.017 Y108.972 E.027
G1 X54.017 Y112.231 E.18622
M106 S252.45
; WIPE_START
G1 F24000
G1 X54.017 Y110.231 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-.017 J1.217 P1  F30000
G1 X205.602 Y112.398 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4344
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4344
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
G1 X205.983 Y112.231 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.422578
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X205.983 Y108.972 E.18622
G1 X206.456 Y108.972 E.027
G1 X206.456 Y112.028 E.17465
G1 X206.928 Y112.028 E.027
G1 X206.928 Y108.972 E.17465
G1 X207.401 Y108.972 E.027
G1 X207.401 Y112.028 E.17465
G1 X207.873 Y112.028 E.027
G1 X207.873 Y108.972 E.17465
G1 X208.346 Y108.972 E.027
G1 X208.346 Y112.028 E.17465
G1 X208.819 Y112.028 E.027
G1 X208.819 Y108.972 E.17465
G1 X209.291 Y108.972 E.027
G1 X209.291 Y112.028 E.17465
G1 X209.764 Y112.028 E.027
G1 X209.764 Y108.972 E.17465
G1 X210.236 Y108.972 E.027
G1 X210.236 Y112.028 E.17465
G1 X210.709 Y112.028 E.027
G1 X210.709 Y108.972 E.17465
G1 X211.181 Y108.972 E.027
G1 X211.181 Y112.028 E.17465
G1 X211.654 Y112.028 E.027
G1 X211.654 Y108.972 E.17465
G1 X212.127 Y108.972 E.027
G1 X212.127 Y112.028 E.17465
G1 X212.599 Y112.028 E.027
G1 X212.599 Y108.972 E.17465
G1 X213.072 Y108.972 E.027
G1 X213.072 Y112.028 E.17465
G1 X213.544 Y112.028 E.027
G1 X213.544 Y108.972 E.17465
G1 X214.017 Y108.972 E.027
G1 X214.017 Y112.231 E.18622
M106 S252.45
; WIPE_START
G1 F24000
G1 X214.017 Y110.231 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-1.167 J-.346 P1  F30000
G1 X205.602 Y138.602 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F4344
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4344
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4344
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21143
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24445
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/275
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
G3 Z15 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z15
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4140
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4140
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4140
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I1.178 J-.306 P1  F30000
G1 X45.602 Y112.398 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4140
G1 X45.602 Y108.602 E.12592
G1 X54.398 Y108.602 E.29177
G1 X54.398 Y112.398 E.12592
G1 X45.662 Y112.398 E.28978
G1 X45.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4140
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I.155 J1.207 P1  F30000
G1 X47.5 Y110.5 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415052
G1 F4140
G1 X52.44 Y110.5 E.1498
G1 X52.875 Y110.875 F30000
; LINE_WIDTH: 0.419999
G1 F4140
G1 X52.875 Y110.125 E.02302
G1 X47.125 Y110.125 E.17666
G1 X47.125 Y110.875 E.02302
G1 X52.815 Y110.875 E.17481
G1 X53.252 Y111.252 F30000
G1 F4140
G1 X53.252 Y109.748 E.04619
G1 X46.748 Y109.748 E.19983
G1 X46.748 Y111.252 E.04619
G1 X53.192 Y111.252 E.19799
G1 X53.629 Y111.629 F30000
G1 F4140
G1 X53.629 Y109.371 E.06937
G1 X46.371 Y109.371 E.223
G1 X46.371 Y111.629 E.06937
G1 X53.569 Y111.629 E.22116
G1 X54.006 Y112.006 F30000
G1 F4140
G1 X54.006 Y108.994 E.09254
G1 X45.994 Y108.994 E.24618
G1 X45.994 Y112.006 E.09254
G1 X53.946 Y112.006 E.24433
; WIPE_START
G1 F24000
G1 X51.946 Y112.006 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-.003 J1.217 P1  F30000
G1 X205.602 Y112.398 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4140
G1 X205.602 Y108.602 E.12592
G1 X214.398 Y108.602 E.29177
G1 X214.398 Y112.398 E.12592
G1 X205.662 Y112.398 E.28978
G1 X205.21 Y112.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4140
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I.155 J1.207 P1  F30000
G1 X207.5 Y110.5 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.415052
G1 F4140
G1 X212.44 Y110.5 E.1498
G1 X207.125 Y110.875 F30000
; LINE_WIDTH: 0.419999
G1 F4140
G1 X212.875 Y110.875 E.17666
G1 X212.875 Y110.125 E.02302
G1 X207.125 Y110.125 E.17666
G1 X207.125 Y110.815 E.02118
G1 X206.748 Y111.252 F30000
G1 F4140
G1 X213.252 Y111.252 E.19983
G1 X213.252 Y109.748 E.04619
G1 X206.748 Y109.748 E.19983
G1 X206.748 Y111.192 E.04435
G1 X206.371 Y111.629 F30000
G1 F4140
G1 X213.629 Y111.629 E.223
G1 X213.629 Y109.371 E.06937
G1 X206.371 Y109.371 E.223
G1 X206.371 Y111.569 E.06752
G1 X205.994 Y112.006 F30000
G1 F4140
G1 X214.006 Y112.006 E.24618
G1 X214.006 Y108.994 E.09254
G1 X205.994 Y108.994 E.24618
G1 X205.994 Y111.946 E.0907
; WIPE_START
G1 F24000
G1 X205.994 Y109.946 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-1.217 J-.017 P1  F30000
G1 X205.602 Y138.602 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4140
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4140
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4140
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21143
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24445
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/275
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
G3 Z15.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z15.2
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
G1 F4477
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4477
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4477
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I1.173 J-.323 P1  F30000
G1 X45.21 Y112.79 Z15.4
G1 Z15
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4477
G1 X45.21 Y108.21 E.14073
G1 X54.79 Y108.21 E.29437
G1 X54.79 Y112.79 E.14073
G1 X45.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X45.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I.248 J1.191 P1  F30000
G1 X54.583 Y108.843 Z15.4
G1 Z15
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F4477
G1 X54.157 Y108.417 E.01848
G1 X53.624 Y108.417
G1 X54.583 Y109.376 E.04165
G1 X54.583 Y109.909
G1 X53.091 Y108.417 E.06483
G1 X52.558 Y108.417
G1 X54.583 Y110.442 E.088
G1 X54.583 Y110.976
G1 X52.024 Y108.417 E.11117
G1 X51.491 Y108.417
G1 X54.583 Y111.509 E.13435
G1 X54.583 Y112.042
G1 X50.958 Y108.417 E.15752
G1 X50.424 Y108.417
G1 X54.583 Y112.576 E.18069
G1 X54.056 Y112.583
G1 X49.891 Y108.417 E.181
G1 X49.358 Y108.417
G1 X53.523 Y112.583 E.181
G1 X52.99 Y112.583
G1 X48.825 Y108.417 E.181
G1 X48.291 Y108.417
G1 X52.457 Y112.583 E.181
G1 X51.923 Y112.583
G1 X47.758 Y108.417 E.181
G1 X47.225 Y108.417
G1 X51.39 Y112.583 E.181
G1 X50.857 Y112.583
G1 X46.692 Y108.417 E.181
G1 X46.158 Y108.417
G1 X50.323 Y112.583 E.181
G1 X49.79 Y112.583
G1 X45.625 Y108.417 E.181
G1 X45.417 Y108.743
G1 X49.257 Y112.583 E.16685
G1 X48.724 Y112.583
G1 X45.417 Y109.276 E.14367
G1 X45.417 Y109.81
G1 X48.19 Y112.583 E.1205
G1 X47.657 Y112.583
G1 X45.417 Y110.343 E.09733
G1 X45.417 Y110.876
G1 X47.124 Y112.583 E.07415
G1 X46.591 Y112.583
G1 X45.417 Y111.409 E.05098
G1 X45.417 Y111.943
G1 X46.057 Y112.583 E.02781
M204 S10000
; WIPE_START
G1 F24000
G1 X45.417 Y111.943 E-.34389
G1 X45.417 Y111.409 E-.20264
G1 X45.815 Y111.807 E-.21346
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-.008 J1.217 P1  F30000
G1 X205.21 Y112.79 Z15.4
G1 Z15
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
G1 F4477
G1 X205.21 Y108.21 E.14073
G1 X214.79 Y108.21 E.29437
G1 X214.79 Y112.79 E.14073
G1 X205.27 Y112.79 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X205.244 Y110.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I.246 J1.192 P1  F30000
G1 X214.583 Y108.862 Z15.4
G1 Z15
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F4477
G1 X214.138 Y108.417 E.0193
G1 X213.605 Y108.417
G1 X214.583 Y109.395 E.04248
G1 X214.583 Y109.928
G1 X213.072 Y108.417 E.06565
G1 X212.539 Y108.417
G1 X214.583 Y110.461 E.08882
G1 X214.583 Y110.995
G1 X212.005 Y108.417 E.112
G1 X211.472 Y108.417
G1 X214.583 Y111.528 E.13517
G1 X214.583 Y112.061
G1 X210.939 Y108.417 E.15834
G1 X210.405 Y108.417
G1 X214.571 Y112.583 E.181
G1 X214.037 Y112.583
G1 X209.872 Y108.417 E.181
G1 X209.339 Y108.417
G1 X213.504 Y112.583 E.181
G1 X212.971 Y112.583
G1 X208.806 Y108.417 E.181
G1 X208.272 Y108.417
G1 X212.438 Y112.583 E.181
G1 X211.904 Y112.583
G1 X207.739 Y108.417 E.181
G1 X207.206 Y108.417
G1 X211.371 Y112.583 E.181
G1 X210.838 Y112.583
G1 X206.673 Y108.417 E.181
G1 X206.139 Y108.417
G1 X210.305 Y112.583 E.181
G1 X209.771 Y112.583
G1 X205.606 Y108.417 E.181
G1 X205.417 Y108.762
G1 X209.238 Y112.583 E.16602
G1 X208.705 Y112.583
G1 X205.417 Y109.295 E.14285
G1 X205.417 Y109.829
G1 X208.171 Y112.583 E.11968
G1 X207.638 Y112.583
G1 X205.417 Y110.362 E.0965
G1 X205.417 Y110.895
G1 X207.105 Y112.583 E.07333
G1 X206.572 Y112.583
G1 X205.417 Y111.428 E.05016
G1 X205.417 Y111.962
G1 X206.038 Y112.583 E.02699
M204 S10000
; WIPE_START
G1 F24000
G1 X205.417 Y111.962 E-.33372
G1 X205.417 Y111.428 E-.20264
G1 X205.834 Y111.844 E-.22364
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-1.217 J-.011 P1  F30000
G1 X205.602 Y138.602 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4477
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4477
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F4477
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 76/275
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
G3 Z15.4 I1.209 J-.139 P1  F30000
G1 X205.602 Y138.602 Z15.4
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1688
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1688
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1688
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
M73 P47 R28
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1688
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1688
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P48 R28
G1 F1688
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 77/275
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
G3 Z15.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z15.6
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 78/275
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
G3 Z15.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z15.8
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 79/275
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
G3 Z16 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z16
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 80/275
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
G3 Z16.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z16.2
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
M73 P49 R28
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 81/275
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
G3 Z16.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z16.4
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 82/275
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
G3 Z16.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z16.6
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 83/275
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
G3 Z16.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z16.8
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
M73 P49 R27
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 84/275
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
G3 Z17 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z17
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
M73 P50 R27
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 85/275
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
G3 Z17.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z17.2
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 86/275
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
G3 Z17.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z17.4
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 87/275
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
G3 Z17.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z17.6
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 88/275
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
G3 Z17.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z17.8
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
M73 P51 R27
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 89/275
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
G3 Z18 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z18
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 90/275
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
G3 Z18.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z18.2
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
M73 P51 R26
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 91/275
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
G3 Z18.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z18.4
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 92/275
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
G3 Z18.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z18.6
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z18.8
G1 Z18.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
M73 P52 R26
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z18.8
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z18.8
G1 Z18.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 93/275
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
G3 Z18.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z18.8
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z19
G1 Z18.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z19
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z19
G1 Z18.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 94/275
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
G3 Z19 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z19
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 95/275
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
G3 Z19.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z19.2
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z19.4
G1 Z19
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z19.4
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z19.4
G1 Z19
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 96/275
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
G3 Z19.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z19.4
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
M73 P53 R26
G1 E-.04 F1800
G17
G3 Z19.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 97/275
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
G3 Z19.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z19.6
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z19.8
G1 Z19.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z19.8
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
M73 P53 R25
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z19.8
G1 Z19.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 98/275
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
G3 Z19.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z19.8
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 99/275
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
G3 Z20 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z20
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 20
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 100/275
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
G3 Z20.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z20.2
G1 Z20
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
M73 P54 R25
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 20.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 101/275
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
G3 Z20.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z20.4
G1 Z20.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z20.6
G1 Z20.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z20.6
G1 Z20.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z20.6
G1 Z20.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 20.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 102/275
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
G3 Z20.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z20.6
G1 Z20.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z20.8
G1 Z20.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z20.8
G1 Z20.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z20.8
G1 Z20.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 20.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 103/275
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
G3 Z20.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z20.8
G1 Z20.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z21
G1 Z20.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z21
G1 Z20.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z21
G1 Z20.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
M73 P55 R25
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 20.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 104/275
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
G3 Z21 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z21
G1 Z20.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z21.2
G1 Z20.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z21.2
G1 Z20.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
M73 P55 R24
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z21.2
G1 Z20.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 21
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 105/275
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
G3 Z21.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z21.2
G1 Z21
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z21.4
G1 Z21
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z21.4
G1 Z21
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z21.4
G1 Z21
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 21.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 106/275
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
G3 Z21.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z21.4
G1 Z21.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z21.6
G1 Z21.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z21.6
G1 Z21.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z21.6
G1 Z21.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 21.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 107/275
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
G3 Z21.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z21.6
G1 Z21.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z21.8
G1 Z21.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z21.8
G1 Z21.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z21.8
G1 Z21.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
M73 P56 R24
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 21.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 108/275
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
G3 Z21.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z21.8
G1 Z21.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z22
G1 Z21.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z22
G1 Z21.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z22
G1 Z21.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 21.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 109/275
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
G3 Z22 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z22
G1 Z21.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z22.2
G1 Z21.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z22.2
G1 Z21.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z22.2
G1 Z21.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 22
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 110/275
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
G3 Z22.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z22.2
G1 Z22
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z22.4
G1 Z22
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z22.4
G1 Z22
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z22.4
G1 Z22
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 22.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 111/275
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
G3 Z22.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z22.4
G1 Z22.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z22.6
G1 Z22.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z22.6
G1 Z22.2
G1 E.8 F1800
; FEATURE: Inner wall
M73 P56 R23
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z22.6
G1 Z22.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P57 R23
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 22.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 112/275
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
G3 Z22.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z22.6
G1 Z22.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z22.8
G1 Z22.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z22.8
G1 Z22.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z22.8
G1 Z22.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 22.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 113/275
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
G3 Z22.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z22.8
G1 Z22.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z23
G1 Z22.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z23
G1 Z22.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z23
G1 Z22.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 22.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 114/275
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
G3 Z23 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z23
G1 Z22.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z23.2
G1 Z22.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z23.2
G1 Z22.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z23.2
G1 Z22.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 115/275
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
G3 Z23.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z23.2
G1 Z23
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z23.4
G1 Z23
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z23.4
G1 Z23
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
M73 P58 R23
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z23.4
G1 Z23
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 116/275
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
G3 Z23.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z23.4
G1 Z23.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z23.6
G1 Z23.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z23.6
G1 Z23.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z23.6
G1 Z23.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 117/275
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
G3 Z23.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z23.6
G1 Z23.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z23.8
G1 Z23.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z23.8
G1 Z23.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z23.8
G1 Z23.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 118/275
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
G3 Z23.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z23.8
G1 Z23.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z24
G1 Z23.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24 I.043 J-1.216 P1  F30000
M73 P58 R22
G1 X54.398 Y138.496 Z24
G1 Z23.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z24
G1 Z23.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 119/275
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
G3 Z24 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z24
G1 Z23.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z24.2
G1 Z23.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z24.2
G1 Z23.8
G1 E.8 F1800
; FEATURE: Inner wall
M73 P59 R22
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z24.2
G1 Z23.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 120/275
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
G3 Z24.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z24.2
G1 Z24
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z24.4
G1 Z24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z24.4
G1 Z24
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z24.4
G1 Z24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 121/275
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
G3 Z24.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z24.4
G1 Z24.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z24.6
G1 Z24.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z24.6
G1 Z24.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z24.6
G1 Z24.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 122/275
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
G3 Z24.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z24.6
G1 Z24.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z24.8
G1 Z24.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z24.8
G1 Z24.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z24.8
G1 Z24.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 123/275
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
G3 Z24.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z24.8
G1 Z24.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z25
G1 Z24.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
M73 P60 R22
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z25
G1 Z24.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z25
G1 Z24.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 124/275
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
G3 Z25 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z25
G1 Z24.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z25.2
G1 Z24.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z25.2
G1 Z24.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z25.2
G1 Z24.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 25
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 125/275
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
G3 Z25.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z25.2
G1 Z25
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z25.4
G1 Z25
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
M73 P60 R21
G1 E-.04 F1800
G17
G3 Z25.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z25.4
G1 Z25
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z25.4
G1 Z25
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 25.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 126/275
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
G3 Z25.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z25.4
G1 Z25.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z25.6
G1 Z25.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z25.6
G1 Z25.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z25.6
G1 Z25.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 25.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 127/275
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
G3 Z25.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z25.6
G1 Z25.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z25.8
G1 Z25.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
M73 P61 R21
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z25.8
G1 Z25.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z25.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z25.8
G1 Z25.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 25.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 128/275
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
G3 Z25.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z25.8
G1 Z25.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z26
G1 Z25.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z26
G1 Z25.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z26
G1 Z25.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 25.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 129/275
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
G3 Z26 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z26
G1 Z25.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z26.2
G1 Z25.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z26.2
G1 Z25.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z26.2
G1 Z25.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 26
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 130/275
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
G3 Z26.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z26.2
G1 Z26
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z26.4
G1 Z26
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z26.4
G1 Z26
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z26.4
G1 Z26
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 26.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 131/275
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
G3 Z26.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z26.4
G1 Z26.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z26.6
G1 Z26.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P62 R21
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z26.6
G1 Z26.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z26.6
G1 Z26.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 26.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 132/275
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
G3 Z26.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z26.6
G1 Z26.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z26.8
G1 Z26.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
M73 P62 R20
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z26.8
G1 Z26.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z26.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z26.8
G1 Z26.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 26.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 133/275
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
G3 Z26.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z26.8
G1 Z26.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z27
G1 Z26.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z27
G1 Z26.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z27
G1 Z26.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 26.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 134/275
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
G3 Z27 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z27
G1 Z26.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z27.2
G1 Z26.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z27.2
G1 Z26.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z27.2
G1 Z26.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 27
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 135/275
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
G3 Z27.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z27.2
G1 Z27
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
M73 P63 R20
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z27.4
G1 Z27
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z27.4
G1 Z27
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z27.4
G1 Z27
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 27.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 136/275
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
G3 Z27.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z27.4
G1 Z27.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z27.6
G1 Z27.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z27.6
G1 Z27.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z27.6
G1 Z27.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 27.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 137/275
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
G3 Z27.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z27.6
G1 Z27.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z27.8
G1 Z27.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z27.8
G1 Z27.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z27.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z27.8
G1 Z27.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 27.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 138/275
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
G3 Z27.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z27.8
G1 Z27.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z28
G1 Z27.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z28
G1 Z27.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z28
G1 Z27.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 27.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
M73 P64 R20
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 139/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L139
M991 S0 P138 ;notify layer change
G17
G3 Z28 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z28
G1 Z27.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z28.2
G1 Z27.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
M73 P64 R19
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z28.2
G1 Z27.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z28.2
G1 Z27.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 28
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 140/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L140
M991 S0 P139 ;notify layer change
G17
G3 Z28.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z28.2
G1 Z28
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z28.4
G1 Z28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z28.4
G1 Z28
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z28.4
G1 Z28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 28.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 141/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L141
M991 S0 P140 ;notify layer change
G17
G3 Z28.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z28.4
G1 Z28.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z28.6
G1 Z28.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z28.6
G1 Z28.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z28.6
G1 Z28.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 28.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 142/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L142
M991 S0 P141 ;notify layer change
G17
G3 Z28.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z28.6
G1 Z28.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z28.8
G1 Z28.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z28.8
G1 Z28.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z28.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z28.8
G1 Z28.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
M73 P65 R19
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 28.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 143/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L143
M991 S0 P142 ;notify layer change
G17
G3 Z28.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z28.8
G1 Z28.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z29
G1 Z28.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z29
G1 Z28.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z29
G1 Z28.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 28.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 144/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L144
M991 S0 P143 ;notify layer change
G17
G3 Z29 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z29
G1 Z28.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z29.2
G1 Z28.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z29.2
G1 Z28.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z29.2
G1 Z28.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 29
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 145/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L145
M991 S0 P144 ;notify layer change
G17
G3 Z29.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z29.2
G1 Z29
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z29.4
G1 Z29
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z29.4
G1 Z29
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z29.4
G1 Z29
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 29.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 146/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L146
M991 S0 P145 ;notify layer change
G17
G3 Z29.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z29.4
G1 Z29.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z29.6
G1 Z29.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
M73 P65 R18
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z29.6
G1 Z29.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z29.6
G1 Z29.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
M73 P66 R18
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 29.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 147/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L147
M991 S0 P146 ;notify layer change
G17
G3 Z29.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z29.6
G1 Z29.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z29.8
G1 Z29.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z29.8
G1 Z29.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z29.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z29.8
G1 Z29.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 29.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 148/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L148
M991 S0 P147 ;notify layer change
G17
G3 Z29.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z29.8
G1 Z29.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z30
G1 Z29.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z30
G1 Z29.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z30
G1 Z29.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 29.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 149/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L149
M991 S0 P148 ;notify layer change
G17
G3 Z30 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z30
G1 Z29.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z30.2
G1 Z29.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z30.2
G1 Z29.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z30.2
G1 Z29.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 30
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 150/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L150
M991 S0 P149 ;notify layer change
G17
G3 Z30.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z30.2
G1 Z30
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z30.4
G1 Z30
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z30.4
G1 Z30
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P67 R18
G3 Z30.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z30.4
G1 Z30
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 30.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 151/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L151
M991 S0 P150 ;notify layer change
G17
G3 Z30.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z30.4
G1 Z30.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z30.6
G1 Z30.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z30.6
G1 Z30.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z30.6
G1 Z30.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 30.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 152/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L152
M991 S0 P151 ;notify layer change
G17
G3 Z30.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z30.6
G1 Z30.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z30.8
G1 Z30.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z30.8
G1 Z30.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z30.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z30.8
G1 Z30.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 30.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 153/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L153
M991 S0 P152 ;notify layer change
G17
G3 Z30.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z30.8
G1 Z30.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z31
G1 Z30.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
M73 P67 R17
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z31
G1 Z30.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z31
G1 Z30.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 30.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 154/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L154
M991 S0 P153 ;notify layer change
G17
G3 Z31 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z31
G1 Z30.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z31.2
G1 Z30.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z31.2
G1 Z30.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
M73 P68 R17
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z31.2
G1 Z30.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 31
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 155/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L155
M991 S0 P154 ;notify layer change
G17
G3 Z31.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z31.2
G1 Z31
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z31.4
G1 Z31
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z31.4
G1 Z31
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z31.4
G1 Z31
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 31.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 156/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L156
M991 S0 P155 ;notify layer change
G17
G3 Z31.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z31.4
G1 Z31.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z31.6
G1 Z31.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z31.6
G1 Z31.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z31.6
G1 Z31.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 31.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 157/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L157
M991 S0 P156 ;notify layer change
G17
G3 Z31.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z31.6
G1 Z31.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z31.8
G1 Z31.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z31.8
G1 Z31.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z31.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z31.8
G1 Z31.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 31.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 158/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L158
M991 S0 P157 ;notify layer change
G17
G3 Z31.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z31.8
G1 Z31.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z32
G1 Z31.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
M73 P69 R17
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z32
G1 Z31.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z32
G1 Z31.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 31.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 159/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L159
M991 S0 P158 ;notify layer change
G17
G3 Z32 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z32
G1 Z31.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z32.2
G1 Z31.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z32.2
G1 Z31.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z32.2
G1 Z31.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 32
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 160/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L160
M991 S0 P159 ;notify layer change
G17
G3 Z32.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z32.2
G1 Z32
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z32.4
G1 Z32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
M73 P69 R16
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z32.4
G1 Z32
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z32.4
G1 Z32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 32.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 161/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L161
M991 S0 P160 ;notify layer change
G17
G3 Z32.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z32.4
G1 Z32.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z32.6
G1 Z32.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z32.6
G1 Z32.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z32.6
G1 Z32.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 32.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 162/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L162
M991 S0 P161 ;notify layer change
G17
G3 Z32.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z32.6
G1 Z32.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z32.8
G1 Z32.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
M73 P70 R16
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z32.8
G1 Z32.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z32.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z32.8
G1 Z32.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 32.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 163/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L163
M991 S0 P162 ;notify layer change
G17
G3 Z32.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z32.8
G1 Z32.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z33
G1 Z32.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z33
G1 Z32.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z33
G1 Z32.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 32.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 164/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L164
M991 S0 P163 ;notify layer change
G17
G3 Z33 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z33
G1 Z32.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z33.2
G1 Z32.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z33.2
G1 Z32.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z33.2
G1 Z32.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 33
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 165/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L165
M991 S0 P164 ;notify layer change
G17
G3 Z33.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z33.2
G1 Z33
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z33.4
G1 Z33
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z33.4
G1 Z33
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z33.4
G1 Z33
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 33.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 166/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L166
M991 S0 P165 ;notify layer change
G17
G3 Z33.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z33.4
G1 Z33.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z33.6
G1 Z33.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
M73 P71 R16
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z33.6
G1 Z33.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z33.6
G1 Z33.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 33.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 167/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L167
M991 S0 P166 ;notify layer change
G17
G3 Z33.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z33.6
G1 Z33.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z33.8
G1 Z33.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
M73 P71 R15
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z33.8
G1 Z33.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z33.8
G1 Z33.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 33.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 168/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L168
M991 S0 P167 ;notify layer change
G17
G3 Z33.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z33.8
G1 Z33.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z34
G1 Z33.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z34
G1 Z33.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z34
G1 Z33.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 33.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 169/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L169
M991 S0 P168 ;notify layer change
G17
G3 Z34 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z34
G1 Z33.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z34.2
G1 Z33.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z34.2
G1 Z33.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z34.2
G1 Z33.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 34
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 170/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L170
M991 S0 P169 ;notify layer change
G17
G3 Z34.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z34.2
G1 Z34
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P72 R15
G3 Z34.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z34.4
G1 Z34
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z34.4
G1 Z34
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z34.4
G1 Z34
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 34.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 171/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L171
M991 S0 P170 ;notify layer change
G17
G3 Z34.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z34.4
G1 Z34.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z34.6
G1 Z34.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z34.6
G1 Z34.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z34.6
G1 Z34.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 34.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 172/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L172
M991 S0 P171 ;notify layer change
G17
G3 Z34.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z34.6
G1 Z34.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z34.8
G1 Z34.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z34.8
G1 Z34.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z34.8
G1 Z34.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 34.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 173/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L173
M991 S0 P172 ;notify layer change
G17
G3 Z34.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z34.8
G1 Z34.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z35
G1 Z34.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z35
G1 Z34.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z35
G1 Z34.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 34.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 174/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L174
M991 S0 P173 ;notify layer change
G17
G3 Z35 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z35
G1 Z34.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
M73 P73 R15
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z35.2
G1 Z34.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
M73 P73 R14
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z35.2
G1 Z34.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z35.2
G1 Z34.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 35
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 175/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L175
M991 S0 P174 ;notify layer change
G17
G3 Z35.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z35.2
G1 Z35
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z35.4
G1 Z35
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z35.4
G1 Z35
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z35.4
G1 Z35
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 35.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 176/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L176
M991 S0 P175 ;notify layer change
G17
G3 Z35.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z35.4
G1 Z35.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z35.6
G1 Z35.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z35.6
G1 Z35.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z35.6
G1 Z35.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 35.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 177/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L177
M991 S0 P176 ;notify layer change
G17
G3 Z35.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z35.6
G1 Z35.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z35.8
G1 Z35.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z35.8
G1 Z35.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z35.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z35.8
G1 Z35.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
M73 P74 R14
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 35.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 178/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L178
M991 S0 P177 ;notify layer change
G17
G3 Z35.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z35.8
G1 Z35.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z36
G1 Z35.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z36
G1 Z35.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z36
G1 Z35.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 35.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 179/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L179
M991 S0 P178 ;notify layer change
G17
G3 Z36 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z36
G1 Z35.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z36.2
G1 Z35.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z36.2
G1 Z35.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z36.2
G1 Z35.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 36
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 180/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L180
M991 S0 P179 ;notify layer change
G17
G3 Z36.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z36.2
G1 Z36
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z36.4
G1 Z36
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z36.4
G1 Z36
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z36.4
G1 Z36
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 36.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 181/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L181
M991 S0 P180 ;notify layer change
G17
G3 Z36.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z36.4
G1 Z36.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z36.6
G1 Z36.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
M73 P74 R13
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z36.6
G1 Z36.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z36.6
G1 Z36.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
M73 P75 R13
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 36.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 182/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L182
M991 S0 P181 ;notify layer change
G17
G3 Z36.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z36.6
G1 Z36.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z36.8
G1 Z36.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z36.8
G1 Z36.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z36.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z36.8
G1 Z36.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 36.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 183/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L183
M991 S0 P182 ;notify layer change
G17
G3 Z36.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z36.8
G1 Z36.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z37
G1 Z36.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z37
G1 Z36.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z37
G1 Z36.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 36.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 184/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L184
M991 S0 P183 ;notify layer change
G17
G3 Z37 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z37
G1 Z36.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z37.2
G1 Z36.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z37.2
G1 Z36.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z37.2
G1 Z36.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 37
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 185/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L185
M991 S0 P184 ;notify layer change
G17
G3 Z37.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z37.2
G1 Z37
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z37.4
G1 Z37
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z37.4
G1 Z37
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z37.4
G1 Z37
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
M73 P76 R13
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 37.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 186/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L186
M991 S0 P185 ;notify layer change
G17
G3 Z37.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z37.4
G1 Z37.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z37.6
G1 Z37.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z37.6
G1 Z37.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z37.6
G1 Z37.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 37.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 187/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L187
M991 S0 P186 ;notify layer change
G17
G3 Z37.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z37.6
G1 Z37.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z37.8
G1 Z37.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z37.8
G1 Z37.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z37.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z37.8
G1 Z37.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 37.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 188/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L188
M991 S0 P187 ;notify layer change
G17
G3 Z37.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z37.8
G1 Z37.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z38
G1 Z37.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
M73 P76 R12
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z38
G1 Z37.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z38
G1 Z37.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 37.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 189/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L189
M991 S0 P188 ;notify layer change
G17
G3 Z38 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z38
G1 Z37.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z38.2
G1 Z37.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z38.2
G1 Z37.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
M73 P77 R12
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z38.2
G1 Z37.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 38
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 190/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L190
M991 S0 P189 ;notify layer change
G17
G3 Z38.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z38.2
G1 Z38
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z38.4
G1 Z38
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z38.4
G1 Z38
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z38.4
G1 Z38
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 38.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 191/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L191
M991 S0 P190 ;notify layer change
G17
G3 Z38.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z38.4
G1 Z38.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z38.6
G1 Z38.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z38.6
G1 Z38.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z38.6
G1 Z38.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 38.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 192/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L192
M991 S0 P191 ;notify layer change
G17
G3 Z38.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z38.6
G1 Z38.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z38.8
G1 Z38.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z38.8
G1 Z38.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z38.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z38.8
G1 Z38.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 38.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 193/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L193
M991 S0 P192 ;notify layer change
G17
G3 Z38.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z38.8
G1 Z38.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z39 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z39
G1 Z38.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z39 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z39
G1 Z38.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
M73 P78 R12
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z39 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z39
G1 Z38.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 38.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 194/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L194
M991 S0 P193 ;notify layer change
G17
G3 Z39 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z39
G1 Z38.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z39.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z39.2
G1 Z38.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z39.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z39.2
G1 Z38.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z39.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z39.2
G1 Z38.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 39
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 195/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L195
M991 S0 P194 ;notify layer change
G17
G3 Z39.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z39.2
G1 Z39
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z39.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z39.4
G1 Z39
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
M73 P78 R11
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z39.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z39.4
G1 Z39
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z39.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z39.4
G1 Z39
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 39.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 196/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L196
M991 S0 P195 ;notify layer change
G17
G3 Z39.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z39.4
G1 Z39.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z39.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z39.6
G1 Z39.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z39.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z39.6
G1 Z39.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z39.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z39.6
G1 Z39.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 39.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 197/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L197
M991 S0 P196 ;notify layer change
G17
G3 Z39.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z39.6
G1 Z39.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z39.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z39.8
G1 Z39.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
M73 P79 R11
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z39.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z39.8
G1 Z39.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z39.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z39.8
G1 Z39.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 39.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 198/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L198
M991 S0 P197 ;notify layer change
G17
G3 Z39.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z39.8
G1 Z39.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z40 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z40
G1 Z39.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z40 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z40
G1 Z39.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z40 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z40
G1 Z39.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 39.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 199/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L199
M991 S0 P198 ;notify layer change
G17
G3 Z40 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z40
G1 Z39.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z40.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z40.2
G1 Z39.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z40.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z40.2
G1 Z39.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z40.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z40.2
G1 Z39.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 40
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 200/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L200
M991 S0 P199 ;notify layer change
G17
G3 Z40.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z40.2
G1 Z40
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z40.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z40.4
G1 Z40
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z40.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z40.4
G1 Z40
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z40.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z40.4
G1 Z40
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 40.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 201/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L201
M991 S0 P200 ;notify layer change
G17
G3 Z40.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z40.4
G1 Z40.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z40.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z40.6
G1 Z40.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
M73 P80 R11
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z40.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z40.6
G1 Z40.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z40.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z40.6
G1 Z40.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 40.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 202/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L202
M991 S0 P201 ;notify layer change
G17
G3 Z40.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z40.6
G1 Z40.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z40.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z40.8
G1 Z40.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
M73 P80 R10
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z40.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z40.8
G1 Z40.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z40.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z40.8
G1 Z40.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 40.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 203/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L203
M991 S0 P202 ;notify layer change
G17
G3 Z40.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z40.8
G1 Z40.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z41 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z41
G1 Z40.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z41 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z41
G1 Z40.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z41 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z41
G1 Z40.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 40.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 204/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L204
M991 S0 P203 ;notify layer change
G17
G3 Z41 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z41
G1 Z40.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z41.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z41.2
G1 Z40.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z41.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z41.2
G1 Z40.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z41.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z41.2
G1 Z40.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 41
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 205/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L205
M991 S0 P204 ;notify layer change
G17
G3 Z41.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z41.2
G1 Z41
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z41.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z41.4
G1 Z41
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P81 R10
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z41.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z41.4
G1 Z41
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z41.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z41.4
G1 Z41
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 41.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 206/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L206
M991 S0 P205 ;notify layer change
G17
G3 Z41.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z41.4
G1 Z41.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z41.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z41.6
G1 Z41.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z41.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z41.6
G1 Z41.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z41.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z41.6
G1 Z41.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 41.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 207/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L207
M991 S0 P206 ;notify layer change
G17
G3 Z41.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z41.6
G1 Z41.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z41.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z41.8
G1 Z41.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z41.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z41.8
G1 Z41.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z41.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z41.8
G1 Z41.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 41.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 208/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L208
M991 S0 P207 ;notify layer change
G17
G3 Z41.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z41.8
G1 Z41.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z42 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z42
G1 Z41.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z42 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z42
G1 Z41.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z42 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z42
G1 Z41.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 41.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 209/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L209
M991 S0 P208 ;notify layer change
G17
G3 Z42 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z42
G1 Z41.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
M73 P82 R10
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z42.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z42.2
G1 Z41.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
M73 P82 R9
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z42.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z42.2
G1 Z41.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z42.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z42.2
G1 Z41.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 42
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 210/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L210
M991 S0 P209 ;notify layer change
G17
G3 Z42.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z42.2
G1 Z42
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z42.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z42.4
G1 Z42
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z42.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z42.4
G1 Z42
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z42.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z42.4
G1 Z42
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 42.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 211/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L211
M991 S0 P210 ;notify layer change
G17
G3 Z42.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z42.4
G1 Z42.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z42.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z42.6
G1 Z42.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z42.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z42.6
G1 Z42.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z42.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z42.6
G1 Z42.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 42.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 212/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L212
M991 S0 P211 ;notify layer change
G17
G3 Z42.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z42.6
G1 Z42.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z42.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z42.8
G1 Z42.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z42.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z42.8
G1 Z42.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z42.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z42.8
G1 Z42.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 42.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 213/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L213
M991 S0 P212 ;notify layer change
G17
G3 Z42.8 I.042 J1.216 P1  F30000
M73 P83 R9
G1 X205.602 Y138.602 Z42.8
G1 Z42.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z43 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z43
G1 Z42.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z43 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z43
G1 Z42.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z43 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z43
G1 Z42.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 42.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 214/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L214
M991 S0 P213 ;notify layer change
G17
G3 Z43 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z43
G1 Z42.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z43.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z43.2
G1 Z42.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z43.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z43.2
G1 Z42.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z43.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z43.2
G1 Z42.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 43
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 215/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L215
M991 S0 P214 ;notify layer change
G17
G3 Z43.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z43.2
G1 Z43
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z43.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z43.4
G1 Z43
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z43.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z43.4
G1 Z43
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z43.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z43.4
G1 Z43
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 43.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 216/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L216
M991 S0 P215 ;notify layer change
G17
G3 Z43.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z43.4
G1 Z43.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z43.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z43.6
G1 Z43.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
M73 P83 R8
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z43.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z43.6
G1 Z43.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z43.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z43.6
G1 Z43.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
M73 P84 R8
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 43.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 217/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L217
M991 S0 P216 ;notify layer change
G17
G3 Z43.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z43.6
G1 Z43.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z43.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z43.8
G1 Z43.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z43.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z43.8
G1 Z43.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z43.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z43.8
G1 Z43.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 43.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 218/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L218
M991 S0 P217 ;notify layer change
G17
G3 Z43.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z43.8
G1 Z43.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z44 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z44
G1 Z43.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z44 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z44
G1 Z43.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z44 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z44
G1 Z43.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 43.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 219/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L219
M991 S0 P218 ;notify layer change
G17
G3 Z44 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z44
G1 Z43.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z44.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z44.2
G1 Z43.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z44.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z44.2
G1 Z43.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z44.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z44.2
G1 Z43.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 44
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 220/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L220
M991 S0 P219 ;notify layer change
G17
G3 Z44.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z44.2
G1 Z44
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z44.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z44.4
G1 Z44
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z44.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z44.4
G1 Z44
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z44.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z44.4
G1 Z44
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
M73 P85 R8
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 44.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 221/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L221
M991 S0 P220 ;notify layer change
G17
G3 Z44.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z44.4
G1 Z44.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z44.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z44.6
G1 Z44.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z44.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z44.6
G1 Z44.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z44.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z44.6
G1 Z44.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 44.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 222/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L222
M991 S0 P221 ;notify layer change
G17
G3 Z44.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z44.6
G1 Z44.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z44.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z44.8
G1 Z44.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z44.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z44.8
G1 Z44.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z44.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z44.8
G1 Z44.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 44.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 223/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L223
M991 S0 P222 ;notify layer change
G17
G3 Z44.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z44.8
G1 Z44.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z45 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z45
G1 Z44.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
M73 P85 R7
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z45 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z45
G1 Z44.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z45 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z45
G1 Z44.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 44.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 224/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L224
M991 S0 P223 ;notify layer change
G17
G3 Z45 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z45
G1 Z44.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z45.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z45.2
G1 Z44.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z45.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z45.2
G1 Z44.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z45.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z45.2
G1 Z44.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P86 R7
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 45
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 225/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L225
M991 S0 P224 ;notify layer change
G17
G3 Z45.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z45.2
G1 Z45
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z45.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z45.4
G1 Z45
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z45.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z45.4
G1 Z45
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z45.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z45.4
G1 Z45
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 45.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 226/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L226
M991 S0 P225 ;notify layer change
G17
G3 Z45.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z45.4
G1 Z45.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z45.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z45.6
G1 Z45.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z45.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z45.6
G1 Z45.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z45.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z45.6
G1 Z45.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 45.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 227/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L227
M991 S0 P226 ;notify layer change
G17
G3 Z45.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z45.6
G1 Z45.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z45.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z45.8
G1 Z45.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z45.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z45.8
G1 Z45.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z45.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z45.8
G1 Z45.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 45.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 228/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L228
M991 S0 P227 ;notify layer change
G17
G3 Z45.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z45.8
G1 Z45.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z46 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z46
G1 Z45.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z46 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z46
G1 Z45.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P87 R7
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z46 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z46
G1 Z45.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 45.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 229/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L229
M991 S0 P228 ;notify layer change
G17
G3 Z46 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z46
G1 Z45.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z46.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z46.2
G1 Z45.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z46.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z46.2
G1 Z45.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z46.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z46.2
G1 Z45.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 46
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 230/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L230
M991 S0 P229 ;notify layer change
G17
G3 Z46.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z46.2
G1 Z46
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z46.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z46.4
G1 Z46
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
M73 P87 R6
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z46.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z46.4
G1 Z46
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z46.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z46.4
G1 Z46
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 46.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 231/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L231
M991 S0 P230 ;notify layer change
G17
G3 Z46.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z46.4
G1 Z46.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z46.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z46.6
G1 Z46.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z46.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z46.6
G1 Z46.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z46.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z46.6
G1 Z46.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 46.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 232/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L232
M991 S0 P231 ;notify layer change
G17
G3 Z46.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z46.6
G1 Z46.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z46.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z46.8
G1 Z46.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
M73 P88 R6
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z46.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z46.8
G1 Z46.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z46.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z46.8
G1 Z46.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 46.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 233/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L233
M991 S0 P232 ;notify layer change
G17
G3 Z46.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z46.8
G1 Z46.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z47 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z47
G1 Z46.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z47 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z47
G1 Z46.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z47 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z47
G1 Z46.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 46.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 234/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L234
M991 S0 P233 ;notify layer change
G17
G3 Z47 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z47
G1 Z46.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z47.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z47.2
G1 Z46.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z47.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z47.2
G1 Z46.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z47.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z47.2
G1 Z46.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 47
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 235/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L235
M991 S0 P234 ;notify layer change
G17
G3 Z47.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z47.2
G1 Z47
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z47.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z47.4
G1 Z47
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z47.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z47.4
G1 Z47
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z47.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z47.4
G1 Z47
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 47.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 236/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L236
M991 S0 P235 ;notify layer change
G17
G3 Z47.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z47.4
G1 Z47.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z47.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z47.6
G1 Z47.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
M73 P89 R6
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z47.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z47.6
G1 Z47.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z47.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z47.6
G1 Z47.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 47.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 237/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L237
M991 S0 P236 ;notify layer change
G17
G3 Z47.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z47.6
G1 Z47.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z47.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z47.8
G1 Z47.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
M73 P89 R5
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z47.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z47.8
G1 Z47.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z47.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z47.8
G1 Z47.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 47.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 238/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L238
M991 S0 P237 ;notify layer change
G17
G3 Z47.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z47.8
G1 Z47.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z48 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z48
G1 Z47.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z48 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z48
G1 Z47.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z48 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z48
G1 Z47.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 47.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 239/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L239
M991 S0 P238 ;notify layer change
G17
G3 Z48 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z48
G1 Z47.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z48.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z48.2
G1 Z47.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z48.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z48.2
G1 Z47.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z48.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z48.2
G1 Z47.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 48
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 240/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L240
M991 S0 P239 ;notify layer change
G17
G3 Z48.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z48.2
G1 Z48
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z48.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z48.4
G1 Z48
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
M73 P90 R5
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z48.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z48.4
G1 Z48
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z48.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z48.4
G1 Z48
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 48.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 241/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L241
M991 S0 P240 ;notify layer change
G17
G3 Z48.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z48.4
G1 Z48.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z48.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z48.6
G1 Z48.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z48.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z48.6
G1 Z48.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z48.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z48.6
G1 Z48.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 48.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 242/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L242
M991 S0 P241 ;notify layer change
G17
G3 Z48.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z48.6
G1 Z48.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z48.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z48.8
G1 Z48.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z48.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z48.8
G1 Z48.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z48.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z48.8
G1 Z48.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 48.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 243/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L243
M991 S0 P242 ;notify layer change
G17
G3 Z48.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z48.8
G1 Z48.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z49 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z49
G1 Z48.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z49 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z49
G1 Z48.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z49 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z49
G1 Z48.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 48.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 244/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L244
M991 S0 P243 ;notify layer change
G17
G3 Z49 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z49
G1 Z48.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P91 R5
G3 Z49.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z49.2
G1 Z48.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
M73 P91 R4
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z49.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z49.2
G1 Z48.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z49.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z49.2
G1 Z48.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 49
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 245/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L245
M991 S0 P244 ;notify layer change
G17
G3 Z49.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z49.2
G1 Z49
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z49.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z49.4
G1 Z49
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z49.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z49.4
G1 Z49
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z49.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z49.4
G1 Z49
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 49.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 246/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L246
M991 S0 P245 ;notify layer change
G17
G3 Z49.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z49.4
G1 Z49.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z49.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z49.6
G1 Z49.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z49.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z49.6
G1 Z49.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z49.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z49.6
G1 Z49.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 49.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 247/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L247
M991 S0 P246 ;notify layer change
G17
G3 Z49.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z49.6
G1 Z49.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z49.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z49.8
G1 Z49.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z49.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z49.8
G1 Z49.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z49.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z49.8
G1 Z49.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 49.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 248/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L248
M991 S0 P247 ;notify layer change
G17
G3 Z49.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z49.8
G1 Z49.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
M73 P92 R4
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z50 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z50
G1 Z49.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z50 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z50
G1 Z49.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z50 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z50
G1 Z49.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 49.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 249/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L249
M991 S0 P248 ;notify layer change
G17
G3 Z50 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z50
G1 Z49.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z50.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z50.2
G1 Z49.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z50.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z50.2
G1 Z49.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z50.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z50.2
G1 Z49.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 50
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 250/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L250
M991 S0 P249 ;notify layer change
G17
G3 Z50.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z50.2
G1 Z50
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z50.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z50.4
G1 Z50
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z50.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z50.4
G1 Z50
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z50.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z50.4
G1 Z50
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 50.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 251/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L251
M991 S0 P250 ;notify layer change
G17
G3 Z50.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z50.4
G1 Z50.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z50.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z50.6
G1 Z50.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
M73 P92 R3
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z50.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z50.6
G1 Z50.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z50.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z50.6
G1 Z50.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
M73 P93 R3
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 50.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 252/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L252
M991 S0 P251 ;notify layer change
G17
G3 Z50.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z50.6
G1 Z50.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z50.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z50.8
G1 Z50.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z50.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z50.8
G1 Z50.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z50.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z50.8
G1 Z50.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 50.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 253/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L253
M991 S0 P252 ;notify layer change
G17
G3 Z50.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z50.8
G1 Z50.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z51 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z51
G1 Z50.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z51 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z51
G1 Z50.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z51 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z51
G1 Z50.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 50.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 254/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L254
M991 S0 P253 ;notify layer change
G17
G3 Z51 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z51
G1 Z50.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z51.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z51.2
G1 Z50.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z51.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z51.2
G1 Z50.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z51.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z51.2
G1 Z50.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 51
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 255/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L255
M991 S0 P254 ;notify layer change
G17
G3 Z51.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z51.2
G1 Z51
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z51.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z51.4
G1 Z51
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z51.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z51.4
G1 Z51
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z51.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z51.4
G1 Z51
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
M73 P94 R3
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 51.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 256/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L256
M991 S0 P255 ;notify layer change
G17
G3 Z51.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z51.4
G1 Z51.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z51.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z51.6
G1 Z51.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z51.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z51.6
G1 Z51.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z51.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z51.6
G1 Z51.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 51.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 257/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L257
M991 S0 P256 ;notify layer change
G17
G3 Z51.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z51.6
G1 Z51.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z51.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z51.8
G1 Z51.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z51.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z51.8
G1 Z51.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z51.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z51.8
G1 Z51.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 51.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 258/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L258
M991 S0 P257 ;notify layer change
G17
G3 Z51.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z51.8
G1 Z51.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z52 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z52
G1 Z51.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
M73 P94 R2
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z52 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z52
G1 Z51.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z52 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z52
G1 Z51.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 51.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 259/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L259
M991 S0 P258 ;notify layer change
G17
G3 Z52 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z52
G1 Z51.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z52.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z52.2
G1 Z51.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z52.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z52.2
G1 Z51.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z52.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z52.2
G1 Z51.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
M73 P95 R2
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 52
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 260/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L260
M991 S0 P259 ;notify layer change
G17
G3 Z52.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z52.2
G1 Z52
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z52.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z52.4
G1 Z52
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z52.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z52.4
G1 Z52
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z52.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z52.4
G1 Z52
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 52.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 261/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L261
M991 S0 P260 ;notify layer change
G17
G3 Z52.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z52.4
G1 Z52.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z52.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z52.6
G1 Z52.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z52.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z52.6
G1 Z52.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z52.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z52.6
G1 Z52.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 52.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 262/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L262
M991 S0 P261 ;notify layer change
G17
G3 Z52.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z52.6
G1 Z52.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z52.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z52.8
G1 Z52.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z52.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z52.8
G1 Z52.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z52.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z52.8
G1 Z52.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 52.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 263/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L263
M991 S0 P262 ;notify layer change
G17
G3 Z52.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z52.8
G1 Z52.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z53 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z53
G1 Z52.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z53 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z53
G1 Z52.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P96 R2
G3 Z53 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z53
G1 Z52.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 52.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 264/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L264
M991 S0 P263 ;notify layer change
G17
G3 Z53 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z53
G1 Z52.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z53.2 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z53.2
G1 Z52.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z53.2 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z53.2
G1 Z52.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z53.2 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z53.2
G1 Z52.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 53
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 265/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L265
M991 S0 P264 ;notify layer change
G17
G3 Z53.2 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z53.2
G1 Z53
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z53.4 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z53.4
G1 Z53
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
M73 P96 R1
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z53.4 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z53.4
G1 Z53
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z53.4 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z53.4
G1 Z53
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 53.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 266/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L266
M991 S0 P265 ;notify layer change
G17
G3 Z53.4 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z53.4
G1 Z53.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z53.6 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z53.6
G1 Z53.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z53.6 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z53.6
G1 Z53.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z53.6 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z53.6
G1 Z53.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 53.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 267/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L267
M991 S0 P266 ;notify layer change
G17
G3 Z53.6 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z53.6
G1 Z53.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z53.8 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z53.8
G1 Z53.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z53.8 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z53.8
G1 Z53.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
M73 P97 R1
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z53.8 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z53.8
G1 Z53.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 53.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 268/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L268
M991 S0 P267 ;notify layer change
G17
G3 Z53.8 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z53.8
G1 Z53.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z54 I-1.1 J-.521 P1  F30000
G1 X205.95 Y140.914 Z54
G1 Z53.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X205.95 Y142.543 E.05401
G1 X210.457 Y147.05 E.21144
G1 X210.738 Y147.05 E.00931
G1 X214.05 Y143.738 E.15536
G1 X214.05 Y142.966 E.02561
G1 X210.034 Y138.95 E.18838
G1 X211.161 Y138.95 E.03739
G1 X205.95 Y144.161 E.24446
G1 X205.95 Y145.79 E.05401
; WIPE_START
G1 F24000
G1 X205.95 Y144.161 E-.61876
G1 X206.213 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z54 I.043 J-1.216 P1  F30000
G1 X54.398 Y138.496 Z54
G1 Z53.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1757
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1757
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z54 I-.925 J-.791 P1  F30000
G1 X54.05 Y140.914 Z54
G1 Z53.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1757
G1 X54.05 Y142.543 E.05401
G1 X49.543 Y147.05 E.21144
G1 X49.262 Y147.05 E.0093
G1 X45.95 Y143.738 E.15536
G1 X45.95 Y142.966 E.02561
G1 X50.072 Y138.844 E.19336
G1 X48.733 Y138.844 E.04443
G1 X54.05 Y144.161 E.24943
G1 X54.05 Y145.79 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 53.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.05 Y144.161 E-.61876
G1 X53.787 Y143.898 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 269/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L269
M991 S0 P268 ;notify layer change
G17
G3 Z54 I.042 J1.216 P1  F30000
G1 X205.602 Y138.602 Z54
G1 Z53.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2239
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2239
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z54.2 I-.467 J1.124 P1  F30000
G1 X213.643 Y140.931 Z54.2
G1 Z53.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2239
G1 X213.643 Y142.559 E.05401
G1 X210.441 Y139.357 E.15019
G1 X210.754 Y139.357 E.01039
G1 X206.357 Y143.754 E.20626
G1 X206.357 Y142.95 E.02669
G1 X210.05 Y146.643 E.17324
G1 X211.145 Y146.643 E.03631
G1 X213.643 Y144.145 E.11717
G1 X213.643 Y145.773 E.05401
G1 X214.05 Y146.99 F30000
G1 F2239
G1 X214.05 Y138.95 E.26668
G1 X205.95 Y138.95 E.26867
G1 X205.95 Y147.05 E.26867
G1 X214.05 Y147.05 E.26867
; WIPE_START
G1 F24000
G1 X212.05 Y147.05 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z54.2 I.066 J-1.215 P1  F30000
G1 X54.398 Y138.496 Z54.2
G1 Z53.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2239
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2239
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z54.2 I-.119 J-1.211 P1  F30000
G1 X46.357 Y140.931 Z54.2
G1 Z53.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2239
G1 X46.357 Y142.559 E.05401
G1 X49.665 Y139.251 E.15517
G1 X49.14 Y139.251 E.01743
G1 X53.643 Y143.754 E.21124
G1 X53.643 Y142.95 E.02669
G1 X49.95 Y146.643 E.17324
G1 X48.855 Y146.643 E.03631
G1 X46.357 Y144.145 E.11717
G1 X46.357 Y145.773 E.05401
G1 X54.05 Y146.99 F30000
G1 F2239
G1 X54.05 Y138.844 E.2702
G1 X45.95 Y138.844 E.26867
G1 X45.95 Y147.05 E.27219
G1 X54.05 Y147.05 E.26867
; CHANGE_LAYER
; Z_HEIGHT: 54
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X52.05 Y147.05 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 270/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L270
M991 S0 P269 ;notify layer change
G17
G3 Z54.2 I.067 J1.215 P1  F30000
G1 X205.602 Y138.602 Z54.2
G1 Z54
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2241
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2241
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z54.4 I-.467 J1.124 P1  F30000
G1 X213.643 Y140.931 Z54.4
G1 Z54
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2241
G1 X213.643 Y142.559 E.05401
G1 X210.441 Y139.357 E.15019
G1 X210.754 Y139.357 E.01039
G1 X206.357 Y143.754 E.20626
G1 X206.357 Y142.95 E.02669
G1 X210.05 Y146.643 E.17324
G1 X211.145 Y146.643 E.03631
G1 X213.643 Y144.145 E.11717
G1 X213.643 Y145.773 E.05401
G1 X214.05 Y146.99 F30000
G1 F2241
G1 X214.05 Y138.95 E.26668
G1 X205.95 Y138.95 E.26867
G1 X205.95 Y147.05 E.26867
G1 X214.05 Y147.05 E.26867
; WIPE_START
G1 F24000
G1 X212.05 Y147.05 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z54.4 I.066 J-1.215 P1  F30000
G1 X54.398 Y138.496 Z54.4
G1 Z54
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2241
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2241
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z54.4 I-.119 J-1.211 P1  F30000
G1 X46.357 Y140.931 Z54.4
G1 Z54
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2241
G1 X46.357 Y142.559 E.05401
G1 X49.665 Y139.251 E.15517
G1 X49.14 Y139.251 E.01743
G1 X53.643 Y143.754 E.21124
G1 X53.643 Y142.95 E.02669
G1 X49.95 Y146.643 E.17324
G1 X48.855 Y146.643 E.03631
G1 X46.357 Y144.145 E.11717
G1 X46.357 Y145.773 E.05401
G1 X54.05 Y146.99 F30000
G1 F2241
G1 X54.05 Y138.844 E.2702
G1 X45.95 Y138.844 E.26867
G1 X45.95 Y147.05 E.27219
G1 X54.05 Y147.05 E.26867
; CHANGE_LAYER
; Z_HEIGHT: 54.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X52.05 Y147.05 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 271/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L271
M991 S0 P270 ;notify layer change
G17
G3 Z54.4 I.067 J1.215 P1  F30000
G1 X205.602 Y138.602 Z54.4
G1 Z54.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2241
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2241
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z54.6 I-.467 J1.124 P1  F30000
G1 X213.643 Y140.931 Z54.6
G1 Z54.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2241
G1 X213.643 Y142.559 E.05401
G1 X210.441 Y139.357 E.15019
G1 X210.754 Y139.357 E.01039
M73 P98 R1
G1 X206.357 Y143.754 E.20626
G1 X206.357 Y142.95 E.02669
G1 X210.05 Y146.643 E.17324
G1 X211.145 Y146.643 E.03631
G1 X213.643 Y144.145 E.11717
G1 X213.643 Y145.773 E.05401
G1 X214.05 Y146.99 F30000
G1 F2241
G1 X214.05 Y138.95 E.26668
G1 X205.95 Y138.95 E.26867
G1 X205.95 Y147.05 E.26867
G1 X214.05 Y147.05 E.26867
; WIPE_START
G1 F24000
G1 X212.05 Y147.05 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z54.6 I.066 J-1.215 P1  F30000
G1 X54.398 Y138.496 Z54.6
G1 Z54.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2241
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2241
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z54.6 I-.119 J-1.211 P1  F30000
G1 X46.357 Y140.931 Z54.6
G1 Z54.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2241
G1 X46.357 Y142.559 E.05401
G1 X49.665 Y139.251 E.15517
G1 X49.14 Y139.251 E.01743
G1 X53.643 Y143.754 E.21124
G1 X53.643 Y142.95 E.02669
G1 X49.95 Y146.643 E.17324
G1 X48.855 Y146.643 E.03631
G1 X46.357 Y144.145 E.11717
G1 X46.357 Y145.773 E.05401
G1 X54.05 Y146.99 F30000
G1 F2241
G1 X54.05 Y138.844 E.2702
G1 X45.95 Y138.844 E.26867
G1 X45.95 Y147.05 E.27219
G1 X54.05 Y147.05 E.26867
; CHANGE_LAYER
; Z_HEIGHT: 54.4
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X52.05 Y147.05 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 272/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L272
M991 S0 P271 ;notify layer change
G17
G3 Z54.6 I.067 J1.215 P1  F30000
G1 X205.602 Y138.602 Z54.6
G1 Z54.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2241
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2241
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z54.8 I-.467 J1.124 P1  F30000
M73 P98 R0
G1 X213.643 Y140.931 Z54.8
G1 Z54.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2241
G1 X213.643 Y142.559 E.05401
G1 X210.441 Y139.357 E.15019
G1 X210.754 Y139.357 E.01039
G1 X206.357 Y143.754 E.20626
G1 X206.357 Y142.95 E.02669
G1 X210.05 Y146.643 E.17324
G1 X211.145 Y146.643 E.03631
G1 X213.643 Y144.145 E.11717
G1 X213.643 Y145.773 E.05401
G1 X214.05 Y146.99 F30000
G1 F2241
G1 X214.05 Y138.95 E.26668
G1 X205.95 Y138.95 E.26867
G1 X205.95 Y147.05 E.26867
G1 X214.05 Y147.05 E.26867
; WIPE_START
G1 F24000
G1 X212.05 Y147.05 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z54.8 I.066 J-1.215 P1  F30000
G1 X54.398 Y138.496 Z54.8
G1 Z54.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2241
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2241
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z54.8 I-.119 J-1.211 P1  F30000
G1 X46.357 Y140.931 Z54.8
G1 Z54.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2241
G1 X46.357 Y142.559 E.05401
G1 X49.665 Y139.251 E.15517
G1 X49.14 Y139.251 E.01743
G1 X53.643 Y143.754 E.21124
G1 X53.643 Y142.95 E.02669
G1 X49.95 Y146.643 E.17324
G1 X48.855 Y146.643 E.03631
G1 X46.357 Y144.145 E.11717
G1 X46.357 Y145.773 E.05401
G1 X54.05 Y146.99 F30000
G1 F2241
G1 X54.05 Y138.844 E.2702
G1 X45.95 Y138.844 E.26867
G1 X45.95 Y147.05 E.27219
G1 X54.05 Y147.05 E.26867
; CHANGE_LAYER
; Z_HEIGHT: 54.6
; LAYER_HEIGHT: 0.199997
; WIPE_START
G1 F24000
G1 X52.05 Y147.05 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 273/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L273
M991 S0 P272 ;notify layer change
G17
G3 Z54.8 I.067 J1.215 P1  F30000
G1 X205.602 Y138.602 Z54.8
G1 Z54.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F10036
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10036
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z55 I-.125 J1.211 P1  F30000
G1 X214.231 Y138.983 Z55
G1 Z54.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.422578
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X205.972 Y138.983 E.47194
G1 X205.972 Y139.456 E.027
G1 X214.028 Y139.456 E.46037
G1 X214.028 Y139.928 E.027
G1 X205.972 Y139.928 E.46037
G1 X205.972 Y140.401 E.027
G1 X214.028 Y140.401 E.46037
G1 X214.028 Y140.873 E.027
G1 X205.972 Y140.873 E.46037
G1 X205.972 Y141.346 E.027
G1 X214.028 Y141.346 E.46037
G1 X214.028 Y141.819 E.027
G1 X205.972 Y141.819 E.46037
G1 X205.972 Y142.291 E.027
G1 X214.028 Y142.291 E.46037
G1 X214.028 Y142.764 E.027
G1 X205.972 Y142.764 E.46037
G1 X205.972 Y143.236 E.027
G1 X214.028 Y143.236 E.46037
G1 X214.028 Y143.709 E.027
G1 X205.972 Y143.709 E.46037
G1 X205.972 Y144.181 E.027
G1 X214.028 Y144.181 E.46037
G1 X214.028 Y144.654 E.027
G1 X205.972 Y144.654 E.46037
G1 X205.972 Y145.127 E.027
G1 X214.028 Y145.127 E.46037
G1 X214.028 Y145.599 E.027
G1 X205.972 Y145.599 E.46037
G1 X205.972 Y146.072 E.027
G1 X214.028 Y146.072 E.46037
G1 X214.028 Y146.544 E.027
G1 X205.972 Y146.544 E.46037
G1 X205.972 Y147.017 E.027
G1 X214.231 Y147.017 E.47194
M106 S252.45
; WIPE_START
G1 F24000
G1 X212.231 Y147.017 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z55 I.066 J-1.215 P1  F30000
G1 X54.398 Y138.496 Z55
G1 Z54.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F10036
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10036
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
G1 X54.231 Y138.867 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.403292
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X45.972 Y138.867 E.42984
G1 X45.972 Y139.321 E.02359
G1 X54.028 Y139.321 E.41931
G1 X54.028 Y139.774 E.02359
G1 X45.972 Y139.774 E.41931
G1 X45.972 Y140.227 E.02359
G1 X54.028 Y140.227 E.41931
G1 X54.028 Y140.681 E.02359
G1 X45.972 Y140.681 E.41931
G1 X45.972 Y141.134 E.02359
G1 X54.028 Y141.134 E.41931
G1 X54.028 Y141.587 E.02359
G1 X45.972 Y141.587 E.41931
G1 X45.972 Y142.04 E.02359
G1 X54.028 Y142.04 E.41931
G1 X54.028 Y142.494 E.02359
G1 X45.972 Y142.494 E.41931
G1 X45.972 Y142.947 E.02359
G1 X54.028 Y142.947 E.41931
G1 X54.028 Y143.4 E.02359
G1 X45.972 Y143.4 E.41931
G1 X45.972 Y143.854 E.02359
G1 X54.028 Y143.854 E.41931
G1 X54.028 Y144.307 E.02359
G1 X45.972 Y144.307 E.41931
G1 X45.972 Y144.76 E.02359
G1 X54.028 Y144.76 E.41931
G1 X54.028 Y145.213 E.02359
G1 X45.972 Y145.213 E.41931
G1 X45.972 Y145.667 E.02359
G1 X54.028 Y145.667 E.41931
G1 X54.028 Y146.12 E.02359
G1 X45.972 Y146.12 E.41931
G1 X45.972 Y146.573 E.02359
G1 X54.028 Y146.573 E.41931
G1 X54.028 Y147.027 E.02359
G1 X45.769 Y147.027 E.42984
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 54.8
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X47.769 Y147.027 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 274/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L274
M991 S0 P273 ;notify layer change
G17
G3 Z55 I.065 J1.215 P1  F30000
G1 X205.602 Y138.602 Z55
G1 Z54.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4448
G1 X214.398 Y138.602 E.29177
G1 X214.398 Y147.398 E.29177
G1 X205.602 Y147.398 E.29177
G1 X205.602 Y138.662 E.28978
G1 X205.21 Y138.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4448
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z55.2 I-.743 J-.964 P1  F30000
G1 X206.551 Y138.766 Z55.2
G1 Z54.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.43098
G1 F4448
G1 X205.935 Y139.381 E.02754
G1 X205.935 Y139.93 E.01735
G1 X206.93 Y138.935 E.04449
G1 X207.479 Y138.935 E.01735
G1 X205.935 Y140.479 E.06903
G1 X205.935 Y141.028 E.01735
G1 X208.028 Y138.935 E.09358
G1 X208.577 Y138.935 E.01735
G1 X205.935 Y141.577 E.11812
G1 X205.935 Y142.125 E.01735
G1 X209.125 Y138.935 E.14266
G1 X209.674 Y138.935 E.01735
G1 X205.935 Y142.674 E.1672
G1 X205.935 Y143.223 E.01735
G1 X210.223 Y138.935 E.19175
G1 X210.772 Y138.935 E.01735
G1 X205.935 Y143.772 E.21629
G1 X205.935 Y144.321 E.01735
G1 X211.321 Y138.935 E.24083
G1 X211.869 Y138.935 E.01735
G1 X205.935 Y144.869 E.26537
G1 X205.935 Y145.418 E.01735
G1 X212.418 Y138.935 E.28992
G1 X212.967 Y138.935 E.01735
G1 X205.935 Y145.967 E.31446
G1 X205.935 Y146.516 E.01735
G1 X213.516 Y138.935 E.339
G1 X214.065 Y138.935 E.01735
G1 X205.935 Y147.065 E.36354
G1 X206.484 Y147.065 E.01735
G1 X214.065 Y139.484 E.33901
G1 X214.065 Y140.033 E.01735
G1 X207.033 Y147.065 E.31446
G1 X207.582 Y147.065 E.01735
G1 X214.065 Y140.582 E.28992
G1 X214.065 Y141.13 E.01735
G1 X208.13 Y147.065 E.26538
G1 X208.679 Y147.065 E.01735
G1 X214.065 Y141.679 E.24084
G1 X214.065 Y142.228 E.01735
G1 X209.228 Y147.065 E.21629
G1 X209.777 Y147.065 E.01735
G1 X214.065 Y142.777 E.19175
G1 X214.065 Y143.326 E.01735
G1 X210.326 Y147.065 E.16721
G1 X210.874 Y147.065 E.01735
G1 X214.065 Y143.874 E.14267
G1 X214.065 Y144.423 E.01735
G1 X211.423 Y147.065 E.11812
G1 X211.972 Y147.065 E.01735
G1 X214.065 Y144.972 E.09358
G1 X214.065 Y145.521 E.01735
G1 X212.521 Y147.065 E.06904
G1 X213.07 Y147.065 E.01735
G1 X214.065 Y146.07 E.0445
G1 X214.065 Y146.618 E.01735
G1 X213.449 Y147.234 E.02754
; WIPE_START
G1 F24000
G1 X214.065 Y146.618 E-.33097
G1 X214.065 Y146.07 E-.20854
G1 X213.654 Y146.48 E-.22048
; WIPE_END
G1 E-.04 F1800
G17
G3 Z55.2 I.061 J-1.215 P1  F30000
G1 X54.398 Y138.496 Z55.2
G1 Z54.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4448
G1 X54.398 Y147.398 E.2953
G1 X45.602 Y147.398 E.29177
G1 X45.602 Y138.496 E.2953
G1 X54.338 Y138.496 E.28978
G1 X54.79 Y138.104 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4448
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X54.742 Y140.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z55.2 I.092 J-1.213 P1  F30000
G1 X45.766 Y139.424 Z55.2
G1 Z54.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421199
G1 F4448
G1 X46.361 Y138.829 E.02594
G1 X46.896 Y138.829 E.01649
G1 X45.935 Y139.789 E.04186
G1 X45.935 Y140.324 E.01649
G1 X47.431 Y138.829 E.06518
G1 X47.966 Y138.829 E.01649
G1 X45.935 Y140.859 E.0885
G1 X45.935 Y141.394 E.01649
G1 X48.501 Y138.829 E.11182
G1 X49.035 Y138.829 E.01649
G1 X45.935 Y141.929 E.13514
G1 X45.935 Y142.464 E.01649
G1 X49.57 Y138.829 E.15847
G1 X50.105 Y138.829 E.01649
G1 X45.935 Y142.999 E.18179
G1 X45.935 Y143.534 E.01649
G1 X50.64 Y138.829 E.20511
G1 X51.175 Y138.829 E.01649
G1 X45.935 Y144.069 E.22843
G1 X45.935 Y144.604 E.01649
G1 X51.71 Y138.829 E.25175
G1 X52.245 Y138.829 E.01649
G1 X45.935 Y145.139 E.27507
G1 X45.935 Y145.674 E.01649
G1 X52.78 Y138.829 E.29839
G1 X53.315 Y138.829 E.01649
G1 X45.935 Y146.209 E.32171
G1 X45.935 Y146.744 E.01649
G1 X53.85 Y138.829 E.34503
G1 X54.065 Y138.829 E.00661
G1 X54.065 Y139.15 E.00988
M73 P99 R0
G1 X46.15 Y147.065 E.34504
G1 X46.685 Y147.065 E.01649
G1 X54.065 Y139.685 E.32172
G1 X54.065 Y140.22 E.01649
G1 X47.22 Y147.065 E.2984
G1 X47.755 Y147.065 E.01649
G1 X54.065 Y140.755 E.27508
G1 X54.065 Y141.29 E.01649
G1 X48.29 Y147.065 E.25175
G1 X48.825 Y147.065 E.01649
G1 X54.065 Y141.825 E.22843
G1 X54.065 Y142.359 E.01649
G1 X49.359 Y147.065 E.20511
G1 X49.894 Y147.065 E.01649
G1 X54.065 Y142.894 E.18179
G1 X54.065 Y143.429 E.01649
G1 X50.429 Y147.065 E.15847
G1 X50.964 Y147.065 E.01649
G1 X54.065 Y143.964 E.13515
G1 X54.065 Y144.499 E.01649
G1 X51.499 Y147.065 E.11183
G1 X52.034 Y147.065 E.01649
G1 X54.065 Y145.034 E.08851
G1 X54.065 Y145.569 E.01649
G1 X52.569 Y147.065 E.06519
G1 X53.104 Y147.065 E.01649
G1 X54.065 Y146.104 E.04187
G1 X54.065 Y146.639 E.01649
G1 X53.47 Y147.234 E.02594
; CHANGE_LAYER
; Z_HEIGHT: 55
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X54.065 Y146.639 E-.31982
G1 X54.065 Y146.104 E-.20329
G1 X53.624 Y146.545 E-.23689
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 275/275
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L275
M991 S0 P274 ;notify layer change
G17
G3 Z55.2 I.067 J1.215 P1  F30000
G1 X205.21 Y138.21 Z55.2
G1 Z55
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4999
G1 X214.79 Y138.21 E.29437
G1 X214.79 Y147.79 E.29437
G1 X205.21 Y147.79 E.29437
G1 X205.21 Y138.27 E.29252
M204 S10000
; WIPE_START
G1 F24000
G1 X207.21 Y138.257 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z55.4 I-.03 J1.217 P1  F30000
G1 X213.742 Y138.417 Z55.4
G1 Z55
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F4999
G1 X214.583 Y139.258 E.03653
G1 X214.583 Y139.791
G1 X213.209 Y138.417 E.0597
G1 X212.675 Y138.417
G1 X214.583 Y140.325 E.08288
G1 X214.583 Y140.858
G1 X212.142 Y138.417 E.10605
G1 X211.609 Y138.417
G1 X214.583 Y141.391 E.12922
G1 X214.583 Y141.924
G1 X211.076 Y138.417 E.1524
G1 X210.542 Y138.417
G1 X214.583 Y142.458 E.17557
G1 X214.583 Y142.991
G1 X210.009 Y138.417 E.19874
G1 X209.476 Y138.417
G1 X214.583 Y143.524 E.22191
G1 X214.583 Y144.057
G1 X208.943 Y138.417 E.24509
G1 X208.409 Y138.417
G1 X214.583 Y144.591 E.26826
G1 X214.583 Y145.124
G1 X207.876 Y138.417 E.29143
G1 X207.343 Y138.417
G1 X214.583 Y145.657 E.31461
G1 X214.583 Y146.191
G1 X206.809 Y138.417 E.33778
G1 X206.276 Y138.417
G1 X214.583 Y146.724 E.36095
G1 X214.583 Y147.257
G1 X205.743 Y138.417 E.38413
G1 X205.417 Y138.625
G1 X214.375 Y147.583 E.38925
G1 X213.842 Y147.583
G1 X205.417 Y139.158 E.36607
G1 X205.417 Y139.692
G1 X213.308 Y147.583 E.3429
G1 X212.775 Y147.583
G1 X205.417 Y140.225 E.31973
G1 X205.417 Y140.758
G1 X212.242 Y147.583 E.29655
G1 X211.709 Y147.583
G1 X205.417 Y141.291 E.27338
G1 X205.417 Y141.825
G1 X211.175 Y147.583 E.25021
G1 X210.642 Y147.583
G1 X205.417 Y142.358 E.22703
G1 X205.417 Y142.891
G1 X210.109 Y147.583 E.20386
G1 X209.575 Y147.583
G1 X205.417 Y143.425 E.18069
G1 X205.417 Y143.958
G1 X209.042 Y147.583 E.15751
G1 X208.509 Y147.583
G1 X205.417 Y144.491 E.13434
G1 X205.417 Y145.024
G1 X207.976 Y147.583 E.11117
G1 X207.442 Y147.583
G1 X205.417 Y145.558 E.08799
G1 X205.417 Y146.091
G1 X206.909 Y147.583 E.06482
G1 X206.376 Y147.583
G1 X205.417 Y146.624 E.04165
G1 X205.417 Y147.157
G1 X205.843 Y147.583 E.01848
M204 S10000
; WIPE_START
G1 F24000
G1 X205.417 Y147.157 E-.22848
G1 X205.417 Y146.624 E-.20264
G1 X206.029 Y147.236 E-.32888
; WIPE_END
G1 E-.04 F1800
G17
G3 Z55.4 I-.052 J1.216 P1  F30000
G1 X214.5 Y147.601 Z55.4
G1 Z55
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.166797
G1 F4999
G2 X214.512 Y147.327 I-.205 J-.147 E.00293
; WIPE_START
G1 F24000
G1 X214.547 Y147.411 E-.23601
G1 X214.547 Y147.488 E-.20226
G1 X214.5 Y147.601 E-.32173
; WIPE_END
G1 E-.04 F1800
G17
G3 Z55.4 I.072 J-1.215 P1  F30000
G1 X54.79 Y138.104 Z55.4
G1 Z55
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4999
G1 X54.79 Y147.79 E.29763
G1 X45.21 Y147.79 E.29437
G1 X45.21 Y138.104 E.29763
G1 X54.73 Y138.104 E.29252
M204 S10000
G1 X54.583 Y138.706 F30000
M204 S2000
; FEATURE: Top surface
G1 F4999
G1 X54.188 Y138.311 E.01715
G1 X53.655 Y138.311
G1 X54.583 Y139.239 E.04032
G1 X54.583 Y139.772
G1 X53.121 Y138.311 E.06349
G1 X52.588 Y138.311
G1 X54.583 Y140.306 E.08667
G1 X54.583 Y140.839
G1 X52.055 Y138.311 E.10984
G1 X51.522 Y138.311
G1 X54.583 Y141.372 E.13301
G1 X54.583 Y141.905
G1 X50.988 Y138.311 E.15619
G1 X50.455 Y138.311
G1 X54.583 Y142.439 E.17936
G1 X54.583 Y142.972
G1 X49.922 Y138.311 E.20253
G1 X49.389 Y138.311
G1 X54.583 Y143.505 E.2257
G1 X54.583 Y144.039
G1 X48.855 Y138.311 E.24888
G1 X48.322 Y138.311
G1 X54.583 Y144.572 E.27205
G1 X54.583 Y145.105
G1 X47.789 Y138.311 E.29522
G1 X47.256 Y138.311
G1 X54.583 Y145.638 E.3184
G1 X54.583 Y146.172
G1 X46.722 Y138.311 E.34157
G1 X46.189 Y138.311
G1 X54.583 Y146.705 E.36474
G1 X54.583 Y147.238
G1 X45.656 Y138.311 E.38792
G1 X45.417 Y138.606
G1 X54.394 Y147.583 E.39007
G1 X53.861 Y147.583
G1 X45.417 Y139.139 E.3669
G1 X45.417 Y139.673
G1 X53.327 Y147.583 E.34372
G1 X52.794 Y147.583
G1 X45.417 Y140.206 E.32055
G1 X45.417 Y140.739
G1 X52.261 Y147.583 E.29738
G1 X51.727 Y147.583
G1 X45.417 Y141.273 E.2742
G1 X45.417 Y141.806
G1 X51.194 Y147.583 E.25103
G1 X50.661 Y147.583
G1 X45.417 Y142.339 E.22786
G1 X45.417 Y142.872
G1 X50.128 Y147.583 E.20468
G1 X49.594 Y147.583
G1 X45.417 Y143.406 E.18151
G1 X45.417 Y143.939
G1 X49.061 Y147.583 E.15834
G1 X48.528 Y147.583
G1 X45.417 Y144.472 E.13516
G1 X45.417 Y145.005
G1 X47.995 Y147.583 E.11199
G1 X47.461 Y147.583
G1 X45.417 Y145.539 E.08882
G1 X45.417 Y146.072
G1 X46.928 Y147.583 E.06564
G1 X46.395 Y147.583
G1 X45.417 Y146.605 E.04247
G1 X45.417 Y147.139
G1 X45.861 Y147.583 E.0193
M204 S10000
; WIPE_START
G1 F24000
G1 X45.417 Y147.139 E-.23865
G1 X45.417 Y146.605 E-.20264
G1 X46.01 Y147.198 E-.3187
; WIPE_END
G1 E-.04 F1800
G17
G3 Z55.4 I-.057 J1.216 P1  F30000
G1 X54.558 Y147.601 Z55.4
G1 Z55
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.130008
G1 F4999
G1 X54.558 Y147.263 E.0024
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X54.558 Y147.601 E-.76
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
G1 Z55.5 F900 ; lower z a little
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

    G1 Z155 F600
    G1 Z153

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

