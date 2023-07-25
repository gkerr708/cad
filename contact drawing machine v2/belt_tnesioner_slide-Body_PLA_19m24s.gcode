; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 13m 35s; total estimated time: 19m 24s
; total layer number: 103
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
M73 P0 R19
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
M73 P22 R15
G1 Y245
G1 Y265 F3000
M620 M
M620 S0A   ; switch material if AMS exist
    M109 S220
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T0
M73 P22 R14
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
M73 P23 R14
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
G1 E-0.5 F300

G1 X70 F9000
M73 P24 R14
G1 X76 F15000
M73 P25 R14
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
M73 P26 R14
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
    G29 A X125.995 Y120.5 I8 J19
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
M73 P27 R14
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
; layer num/total_layer_count: 1/103
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
G1 X128.901 Y125.376 F30000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F2253
G1 X128.983 Y125.332 E.00345
G1 X129.651 Y125.168 E.02562
G1 X130.338 Y125.168 E.02562
G1 X130.4 Y125.183 E.00236
G1 X131.006 Y125.332 E.02326
G1 X131.615 Y125.652 E.02562
G1 X132.13 Y126.108 E.02562
G1 X132.521 Y126.674 E.02562
M73 P28 R13
G1 X132.765 Y127.317 E.02562
G1 X132.772 Y127.38 E.00236
G1 X132.847 Y128 E.02326
G1 X132.765 Y128.683 E.02562
G1 X132.521 Y129.326 E.02562
G1 X132.13 Y129.892 E.02562
G1 X131.615 Y130.348 E.02562
G1 X131.559 Y130.377 E.00236
G1 X131.006 Y130.668 E.02326
G1 X130.338 Y130.832 E.02562
G1 X129.651 Y130.832 E.02562
G1 X128.983 Y130.668 E.02562
G1 X128.374 Y130.348 E.02562
G1 X127.859 Y129.892 E.02562
G1 X127.468 Y129.326 E.02562
G1 X127.446 Y129.267 E.00236
M73 P29 R13
G1 X127.224 Y128.683 E.02326
G1 X127.142 Y128 E.02562
G1 X127.224 Y127.317 E.02562
G1 X127.468 Y126.674 E.02562
G1 X127.859 Y126.108 E.02562
G1 X128.374 Y125.652 E.02562
G1 X128.685 Y125.489 E.01308
G1 X128.848 Y125.403 E.00685
G1 X128.472 Y125.084 F30000
; FEATURE: Inner wall
G1 F2253
G1 X128.112 Y125.273 E.01515
G1 X127.514 Y125.803 E.02975
G1 X127.044 Y126.484 E.03083
G1 X126.852 Y126.424 E.00752
G1 X126.852 Y119.357 E.26321
G1 X133.137 Y119.357 E.23412
G1 X133.137 Y126.424 E.26321
G1 X132.945 Y126.484 E.00752
G1 X132.475 Y125.803 E.03083
G1 X131.877 Y125.273 E.02975
G1 X131.169 Y124.902 E.02975
G1 X130.394 Y124.711 E.02975
G1 X129.595 Y124.711 E.02975
G1 X128.82 Y124.902 E.02975
G1 X128.526 Y125.056 E.01237
; WIPE_START
G1 F24000
G1 X128.112 Y125.273 E-.17737
G1 X127.514 Y125.803 E-.30353
G1 X127.097 Y126.407 E-.2791
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.217 J-.021 P1  F30000
G1 X127.044 Y129.516 Z.6
G1 Z.2
G1 E.8 F1800
G1 F2253
G1 X127.514 Y130.197 E.03083
G1 X128.112 Y130.727 E.02975
G1 X128.82 Y131.098 E.02975
G1 X129.595 Y131.289 E.02975
G1 X130.394 Y131.289 E.02975
G1 X131.169 Y131.098 E.02975
G1 X131.877 Y130.727 E.02975
G1 X132.475 Y130.197 E.02975
G1 X132.945 Y129.516 E.03083
G1 X133.137 Y129.576 E.00752
G1 X133.137 Y136.643 E.26321
G1 X126.852 Y136.643 E.23412
G1 X126.852 Y129.576 E.26321
G1 X126.987 Y129.534 E.00528
; WIPE_START
G1 F24000
G1 X127.514 Y130.197 E-.32203
G1 X128.112 Y130.727 E-.30353
G1 X128.426 Y130.891 E-.13443
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.2 J-.203 P1  F30000
G1 X126.395 Y118.9 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F2253
G1 X133.595 Y118.9 E.26817
G1 X133.595 Y137.1 E.67788
G1 X126.395 Y137.1 E.26817
G1 X126.395 Y118.96 E.67565
; WIPE_START
G1 F24000
G1 X128.394 Y118.943 E-.76
; WIPE_END
M73 P30 R13
G1 E-.04 F1800
G17
G3 Z.6 I-.39 J1.153 P1  F30000
G1 X132.955 Y120.485 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.509806
G1 F2253
G1 X132.216 Y119.746 E.03977
G1 X131.555 Y119.746 E.02512
G1 X132.749 Y120.939 E.06423
G1 X132.749 Y121.6 E.02512
G1 X130.895 Y119.746 E.09975
G1 X130.235 Y119.746 E.02512
G1 X132.749 Y122.26 E.13528
G1 X132.749 Y122.92 E.02512
G1 X129.574 Y119.746 E.1708
G1 X128.914 Y119.746 E.02512
G1 X132.749 Y123.58 E.20633
G1 X132.749 Y124.241 E.02512
G1 X128.254 Y119.746 E.24185
G1 X127.594 Y119.746 E.02512
G1 X132.749 Y124.901 E.27738
G1 X132.749 Y125.333 E.01645
G1 X132.64 Y125.43 E.00555
G1 X132.448 Y125.26 E.00976
G1 X127.24 Y120.052 E.28019
G1 X127.24 Y120.713 E.02512
G1 X130.983 Y124.456 E.20141
G1 X130.441 Y124.322 E.02125
G1 X130.189 Y124.322 E.00957
G1 X127.24 Y121.373 E.15869
G1 X127.24 Y122.033 E.02512
G1 X129.533 Y124.326 E.12336
G1 X129.003 Y124.457 E.02076
G1 X127.24 Y122.693 E.09486
G1 X127.24 Y123.354 E.02512
G1 X128.511 Y124.625 E.0684
G1 X128.078 Y124.852 E.01861
G1 X127.24 Y124.014 E.0451
G1 X127.24 Y124.674 E.02512
G1 X127.838 Y125.272 E.03216
G1 X127.197 Y125.814 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.110307
G1 F2253
G2 X127.101 Y125.962 I.117 J.18 E.001
G1 X126.912 Y126.682 F30000
; LINE_WIDTH: 0.531915
G1 F2253
G1 X126.865 Y126.938 E.01035
; LINE_WIDTH: 0.482713
G1 X126.818 Y127.193 E.0093
; LINE_WIDTH: 0.433509
G1 X126.813 Y127.239 E.00149
; LINE_WIDTH: 0.422202
G1 X126.79 Y127.611 E.01151
; LINE_WIDTH: 0.37339
G2 X126.768 Y128.017 I3.349 J.389 E.01097
; LINE_WIDTH: 0.33228
G1 X126.79 Y128.389 E.00878
; LINE_WIDTH: 0.37724
G1 X126.813 Y128.761 E.01014
; LINE_WIDTH: 0.422202
G1 X126.818 Y128.807 E.00144
; LINE_WIDTH: 0.433509
G1 X126.865 Y129.062 E.00826
; LINE_WIDTH: 0.482713
G1 X126.912 Y129.318 E.0093
G1 X127.101 Y130.038 F30000
; LINE_WIDTH: 0.110309
G1 F2253
G2 X127.197 Y130.186 I.212 J-.032 E.001
; WIPE_START
G1 F24000
G1 X127.12 Y130.1 E-.48723
G1 X127.101 Y130.038 E-.27277
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.165 J1.206 P1  F30000
G1 X132.151 Y130.728 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.509807
G1 F2253
G1 X132.749 Y131.326 E.03217
G1 X132.749 Y131.986 E.02512
G1 X131.911 Y131.148 E.0451
G1 X131.478 Y131.375 E.01861
G1 X132.749 Y132.646 E.0684
G1 X132.749 Y133.307 E.02512
G1 X130.986 Y131.543 E.09487
G1 X130.456 Y131.674 E.02076
G1 X132.749 Y133.967 E.12337
G1 X132.749 Y134.627 E.02512
G1 X129.799 Y131.678 E.1587
G1 X129.548 Y131.678 E.00957
G1 X129.005 Y131.544 E.02126
G1 X132.749 Y135.288 E.20142
G1 X132.749 Y135.948 E.02512
G1 X127.54 Y130.739 E.28025
G1 X127.349 Y130.57 E.0097
G1 X127.24 Y130.667 E.00555
G1 X127.24 Y131.099 E.01645
G1 X132.395 Y136.254 E.27737
G1 X131.735 Y136.254 E.02512
G1 X127.24 Y131.759 E.24185
G1 X127.24 Y132.42 E.02512
G1 X131.075 Y136.254 E.20632
G1 X130.414 Y136.254 E.02512
G1 X127.24 Y133.08 E.1708
G1 X127.24 Y133.74 E.02512
G1 X129.754 Y136.254 E.13527
G1 X129.094 Y136.254 E.02512
G1 X127.24 Y134.401 E.09974
G1 X127.24 Y135.061 E.02512
G1 X128.434 Y136.254 E.06422
G1 X127.773 Y136.254 E.02512
G1 X127.034 Y135.515 E.03976
; WIPE_START
G1 F24000
G1 X127.773 Y136.254 E-.39712
G1 X128.434 Y136.254 E-.25091
G1 X128.225 Y136.046 E-.11198
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.96 J.748 P1  F30000
G1 X132.792 Y130.186 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.116114
G1 F2253
G2 X132.888 Y130.038 I-.117 J-.18 E.00108
G1 X133.077 Y129.318 F30000
; LINE_WIDTH: 0.531916
G1 F2253
G1 X133.124 Y129.062 E.01035
; LINE_WIDTH: 0.482712
G1 X133.171 Y128.807 E.0093
; LINE_WIDTH: 0.433506
G1 X133.176 Y128.761 E.00149
; LINE_WIDTH: 0.4222
G1 X133.199 Y128.389 E.01151
; LINE_WIDTH: 0.373389
G2 X133.221 Y127.983 I-3.349 J-.389 E.01097
; LINE_WIDTH: 0.33228
G1 X133.199 Y127.611 E.00878
; LINE_WIDTH: 0.377244
G1 X133.176 Y127.239 E.01014
; LINE_WIDTH: 0.422208
G1 X133.171 Y127.193 E.00144
; LINE_WIDTH: 0.433517
G1 X133.124 Y126.938 E.00826
; LINE_WIDTH: 0.482716
G1 X133.077 Y126.682 E.0093
G1 X132.888 Y125.962 F30000
; LINE_WIDTH: 0.116115
G1 F2253
G2 X132.792 Y125.814 I-.212 J.032 E.00108
M106 S252.45
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.869 Y125.9 E-.48723
G1 X132.888 Y125.962 E-.27277
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/103
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
G3 Z.6 I.251 J-1.191 P1  F30000
G1 X128.95 Y125.133 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2686
G1 X129.626 Y124.966 E.02311
G1 X130.363 Y124.966 E.02444
G1 X131.078 Y125.142 E.02444
G1 X131.731 Y125.485 E.02444
G1 X132.282 Y125.973 E.02444
G1 X132.701 Y126.58 E.02444
G1 X132.962 Y127.269 E.02444
G1 X133.051 Y128 E.02444
G1 X132.962 Y128.731 E.02444
G1 X132.701 Y129.42 E.02444
G1 X132.282 Y130.027 E.02444
G1 X131.731 Y130.515 E.02444
G1 X131.078 Y130.858 E.02444
M73 P31 R13
G1 X130.363 Y131.034 E.02444
G1 X129.626 Y131.034 E.02444
G1 X128.911 Y130.858 E.02444
G1 X128.258 Y130.515 E.02444
G1 X127.707 Y130.027 E.02444
G1 X127.288 Y129.42 E.02444
G1 X127.027 Y128.731 E.02444
G1 X126.938 Y128 E.02444
G1 X127.027 Y127.269 E.02444
G1 X127.288 Y126.58 E.02444
G1 X127.707 Y125.973 E.02444
G1 X128.258 Y125.485 E.02444
G1 X128.893 Y125.151 E.02379
G1 X129.002 Y125.537 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2686
G1 X129.051 Y125.511 E.00171
G1 X129.674 Y125.358 E.01972
G1 X130.315 Y125.358 E.01972
G1 X130.938 Y125.511 E.01972
G1 X131.506 Y125.81 E.01972
G1 X131.987 Y126.235 E.01972
G1 X132.351 Y126.763 E.01972
G1 X132.579 Y127.363 E.01972
G1 X132.656 Y128 E.01972
G1 X132.579 Y128.637 E.01972
G1 X132.351 Y129.237 E.01972
G1 X131.987 Y129.765 E.01972
G1 X131.506 Y130.19 E.01972
G1 X130.938 Y130.489 E.01972
G1 X130.315 Y130.642 E.01972
G1 X129.674 Y130.642 E.01972
G1 X129.051 Y130.489 E.01972
G1 X128.483 Y130.19 E.01972
G1 X128.002 Y129.765 E.01972
G1 X127.638 Y129.237 E.01972
G1 X127.41 Y128.637 E.01972
G1 X127.333 Y128 E.01972
G1 X127.41 Y127.363 E.01972
G1 X127.638 Y126.763 E.01972
G1 X128.002 Y126.235 E.01972
G1 X128.483 Y125.81 E.01972
G1 X128.948 Y125.565 E.01616
M204 S10000
; WIPE_START
G1 F24000
G1 X129.051 Y125.511 E-.04391
G1 X129.674 Y125.358 E-.24382
G1 X130.315 Y125.358 E-.24382
G1 X130.899 Y125.502 E-.22845
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.01 J-.679 P1  F30000
G1 X126.597 Y119.102 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2686
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y136.898 E.59032
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y119.162 E.58833
G1 X126.205 Y118.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2686
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y137.29 E.57091
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y118.77 E.56907
M204 S10000
; WIPE_START
G1 F24000
G1 X128.204 Y118.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.202 J-.19 P1  F30000
G1 X127.029 Y126.194 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.392831
G1 F2686
G2 X126.959 Y126.428 I1.929 J.708 E.00697
; LINE_WIDTH: 0.359648
G1 X126.936 Y126.552 E.00325
; LINE_WIDTH: 0.31586
G1 X126.913 Y126.676 E.0028
; LINE_WIDTH: 0.272072
G1 X126.89 Y126.8 E.00235
; LINE_WIDTH: 0.228284
G1 X126.868 Y126.924 E.0019
; LINE_WIDTH: 0.184496
G1 X126.845 Y127.048 E.00145
; LINE_WIDTH: 0.140708
G1 X126.822 Y127.172 E.001
G1 X126.822 Y128.828 F30000
; LINE_WIDTH: 0.140708
G1 F2686
G1 X126.845 Y128.952 E.001
; LINE_WIDTH: 0.184497
G1 X126.868 Y129.076 E.00145
; LINE_WIDTH: 0.228285
G1 X126.89 Y129.2 E.0019
; LINE_WIDTH: 0.272074
G1 X126.913 Y129.324 E.00235
; LINE_WIDTH: 0.315862
G1 X126.936 Y129.448 E.0028
; LINE_WIDTH: 0.35965
G1 X126.959 Y129.572 E.00325
; LINE_WIDTH: 0.392831
G2 X127.029 Y129.806 I1.998 J-.473 E.00697
; WIPE_START
G1 F24000
G1 X126.959 Y129.572 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.118 J1.211 P1  F30000
G1 X132.687 Y130.131 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2686
G1 X132.561 Y130.304 E.00656
G1 X131.972 Y130.825 E.02416
G1 X131.239 Y131.217 E.02555
G1 X130.433 Y131.421 E.02555
G1 X129.601 Y131.426 E.02555
G1 X128.793 Y131.233 E.02555
G1 X128.054 Y130.851 E.02555
G1 X127.428 Y130.304 E.02555
G1 X127.302 Y130.131 E.00656
G1 X126.989 Y130.229 E.0101
G1 X126.989 Y136.506 E.19287
G1 X133 Y136.506 E.18472
G1 X133 Y130.229 E.19287
G1 X132.744 Y130.149 E.00825
G1 X132.623 Y130.752 F30000
G1 F2686
G1 X132.222 Y131.108 E.01646
G1 X131.414 Y131.55 E.02832
G1 X130.523 Y131.787 E.02832
G1 X129.601 Y131.803 E.02832
G1 X128.703 Y131.599 E.02832
G1 X127.879 Y131.185 E.02832
G1 X127.366 Y130.752 E.02062
G1 X127.366 Y136.129 E.1652
G1 X132.623 Y136.129 E.16155
G1 X132.623 Y130.812 E.16336
G1 X132.246 Y131.539 F30000
G1 F2686
G1 X131.589 Y131.884 E.0228
G1 X130.613 Y132.153 E.0311
G1 X129.601 Y132.18 E.0311
G1 X128.612 Y131.965 E.0311
G1 X127.743 Y131.539 E.02974
G1 X127.743 Y135.752 E.12943
G1 X132.246 Y135.752 E.13838
G1 X132.246 Y131.599 E.12759
G1 X131.869 Y132.163 F30000
G1 F2686
G1 X131.467 Y132.331 E.01339
G1 X130.703 Y132.519 E.02416
G1 X130.388 Y132.558 E.00978
G1 X129.601 Y132.558 E.02416
G1 X129.286 Y132.519 E.00978
G1 X128.522 Y132.331 E.02416
G1 X128.12 Y132.163 E.01339
G1 X128.12 Y135.375 E.09868
G1 X131.869 Y135.375 E.1152
G1 X131.869 Y132.223 E.09683
G1 X131.492 Y132.713 F30000
G1 F2686
G1 X130.794 Y132.885 E.0221
G1 X130.388 Y132.935 E.01257
G1 X129.601 Y132.935 E.02416
G1 X129.195 Y132.885 E.01257
G1 X128.497 Y132.713 E.0221
G1 X128.497 Y134.998 E.07019
G1 X131.492 Y134.998 E.09203
G1 X131.492 Y132.773 E.06835
G1 X131.115 Y133.194 F30000
G1 F2686
G1 X130.443 Y133.311 E.02096
G1 X129.601 Y133.312 E.02585
G1 X128.874 Y133.194 E.02264
G1 X128.874 Y134.62 E.04382
G1 X131.115 Y134.62 E.06886
G1 X131.115 Y133.254 E.04197
G1 X130.693 Y133.7 F30000
; LINE_WIDTH: 0.509061
G1 F2686
G1 X130.388 Y133.733 E.01168
G1 X129.601 Y133.733 E.02987
G1 X129.296 Y133.7 E.01168
G1 X129.296 Y134.199 E.01894
G2 X130.693 Y134.199 I.699 J-692.323 E.05308
G1 X130.693 Y133.76 E.01666
G1 X132.96 Y129.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392831
G1 F2686
G2 X133.031 Y129.572 I-1.928 J-.708 E.00697
; LINE_WIDTH: 0.359649
G1 X133.053 Y129.448 E.00325
; LINE_WIDTH: 0.315861
G1 X133.076 Y129.324 E.0028
; LINE_WIDTH: 0.272073
G1 X133.099 Y129.2 E.00235
; LINE_WIDTH: 0.228285
G1 X133.121 Y129.076 E.0019
; LINE_WIDTH: 0.184497
G1 X133.144 Y128.952 E.00145
; LINE_WIDTH: 0.140708
G1 X133.167 Y128.828 E.001
G1 X133.167 Y127.172 F30000
; LINE_WIDTH: 0.0969201
G1 F2686
G1 X133.144 Y127.048 E.00055
; LINE_WIDTH: 0.140708
G1 X133.121 Y126.924 E.001
; LINE_WIDTH: 0.184497
G1 X133.099 Y126.8 E.00145
; LINE_WIDTH: 0.228285
G1 X133.076 Y126.676 E.0019
; LINE_WIDTH: 0.272074
G1 X133.053 Y126.552 E.00235
; LINE_WIDTH: 0.315862
G1 X133.031 Y126.428 E.0028
; LINE_WIDTH: 0.375889
G2 X132.96 Y126.194 I-1.998 J.473 E.00664
G1 X132.687 Y125.869 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2686
G1 X133 Y125.771 E.0101
G1 X133 Y119.494 E.19287
G1 X126.989 Y119.494 E.18472
G1 X126.989 Y125.771 E.19287
G1 X127.302 Y125.869 E.0101
G1 X127.428 Y125.696 E.00656
G1 X128.017 Y125.175 E.02416
G1 X128.75 Y124.783 E.02555
G1 X129.556 Y124.579 E.02555
G1 X130.388 Y124.574 E.02555
G1 X131.196 Y124.767 E.02555
G1 X131.935 Y125.149 E.02555
G1 X132.561 Y125.696 E.02555
G1 X132.651 Y125.82 E.00472
G1 X132.623 Y125.248 F30000
G1 F2686
G1 X132.623 Y119.871 E.1652
G1 X127.366 Y119.871 E.16155
G1 X127.366 Y125.248 E.1652
G1 X127.767 Y124.892 E.01646
G1 X128.575 Y124.45 E.02832
G1 X129.466 Y124.213 E.02832
G1 X130.388 Y124.197 E.02832
G1 X131.286 Y124.401 E.02832
G1 X132.11 Y124.815 E.02832
G1 X132.577 Y125.209 E.01878
G1 X132.246 Y124.461 F30000
G1 F2686
G1 X132.246 Y120.248 E.12943
G1 X127.743 Y120.248 E.13838
G1 X127.743 Y124.461 E.12943
G1 X128.4 Y124.116 E.0228
G1 X129.376 Y123.847 E.0311
G1 X130.388 Y123.82 E.0311
G1 X131.377 Y124.035 E.0311
G1 X132.192 Y124.434 E.0279
G1 X131.869 Y123.837 F30000
G1 F2686
G1 X131.869 Y120.625 E.09868
G1 X128.12 Y120.625 E.1152
G1 X128.12 Y123.837 E.09868
G1 X128.522 Y123.669 E.01339
G1 X129.286 Y123.481 E.02416
G1 X129.601 Y123.442 E.00978
G1 X130.388 Y123.442 E.02416
G1 X130.703 Y123.481 E.00978
G1 X131.467 Y123.669 E.02416
G1 X131.814 Y123.814 E.01155
G1 X131.492 Y123.287 F30000
G1 F2686
G1 X131.492 Y121.002 E.07019
G1 X128.497 Y121.002 E.09203
G1 X128.497 Y123.287 E.07019
G1 X129.195 Y123.115 E.0221
G1 X129.601 Y123.065 E.01257
G1 X130.388 Y123.065 E.02416
G1 X130.794 Y123.115 E.01257
G1 X131.434 Y123.272 E.02026
G1 X131.115 Y122.806 F30000
G1 F2686
G1 X131.115 Y121.38 E.04382
G1 X128.874 Y121.38 E.06886
G1 X128.874 Y122.806 E.04382
G1 X129.546 Y122.689 E.02096
G1 X130.388 Y122.688 E.02585
G1 X131.056 Y122.796 E.02079
G1 X130.693 Y122.3 F30000
; LINE_WIDTH: 0.509069
G1 F2686
G1 X130.693 Y121.801 E.01894
G2 X129.296 Y121.801 I-.699 J692.321 E.05308
G1 X129.296 Y122.3 E.01894
G1 X129.601 Y122.267 E.01168
G1 X130.388 Y122.267 E.02987
G1 X130.634 Y122.293 E.0094
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X130.388 Y122.267 E-.09401
G1 X129.601 Y122.267 E-.29878
G1 X129.296 Y122.3 E-.11681
G1 X129.296 Y121.801 E-.18944
G1 X129.456 Y121.801 E-.06096
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/103
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
G3 Z.8 I-1.203 J-.183 P1  F30000
G1 X128.95 Y125.133 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2687
G1 X129.626 Y124.966 E.02311
G1 X130.363 Y124.966 E.02444
G1 X131.078 Y125.142 E.02444
G1 X131.731 Y125.485 E.02444
G1 X132.282 Y125.973 E.02444
G1 X132.701 Y126.58 E.02444
G1 X132.962 Y127.269 E.02444
G1 X133.051 Y128 E.02444
G1 X132.962 Y128.731 E.02444
G1 X132.701 Y129.42 E.02444
G1 X132.282 Y130.027 E.02444
G1 X131.731 Y130.515 E.02444
G1 X131.078 Y130.858 E.02444
G1 X130.363 Y131.034 E.02444
G1 X129.626 Y131.034 E.02444
G1 X128.911 Y130.858 E.02444
G1 X128.258 Y130.515 E.02444
G1 X127.707 Y130.027 E.02444
G1 X127.288 Y129.42 E.02444
G1 X127.027 Y128.731 E.02444
G1 X126.938 Y128 E.02444
G1 X127.027 Y127.269 E.02444
G1 X127.288 Y126.58 E.02444
G1 X127.707 Y125.973 E.02444
G1 X128.258 Y125.485 E.02444
G1 X128.893 Y125.151 E.02378
G1 X129.005 Y125.535 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2687
G1 X129.051 Y125.511 E.00159
G1 X129.674 Y125.358 E.01972
G1 X130.315 Y125.358 E.01972
G1 X130.938 Y125.511 E.01972
G1 X131.506 Y125.81 E.01972
G1 X131.987 Y126.235 E.01972
G1 X132.351 Y126.763 E.01972
G1 X132.579 Y127.363 E.01972
G1 X132.656 Y128 E.01972
G1 X132.579 Y128.637 E.01972
G1 X132.351 Y129.237 E.01972
G1 X131.987 Y129.765 E.01972
G1 X131.506 Y130.19 E.01972
G1 X130.938 Y130.489 E.01972
G1 X130.315 Y130.642 E.01972
G1 X129.674 Y130.642 E.01972
G1 X129.051 Y130.489 E.01972
G1 X128.483 Y130.19 E.01972
G1 X128.002 Y129.765 E.01972
G1 X127.638 Y129.237 E.01972
G1 X127.41 Y128.637 E.01972
G1 X127.333 Y128 E.01972
G1 X127.41 Y127.363 E.01972
G1 X127.638 Y126.763 E.01972
G1 X128.002 Y126.235 E.01972
G1 X128.483 Y125.81 E.01972
G1 X128.952 Y125.563 E.01628
M204 S10000
; WIPE_START
G1 F24000
G1 X129.051 Y125.511 E-.04246
G1 X129.674 Y125.358 E-.24382
G1 X130.315 Y125.358 E-.24382
G1 X130.903 Y125.503 E-.2299
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.01 J-.679 P1  F30000
G1 X126.597 Y119.102 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2687
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y136.898 E.59032
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y119.162 E.58833
G1 X126.205 Y118.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2687
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y137.29 E.57091
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y118.77 E.56907
M204 S10000
; WIPE_START
G1 F24000
G1 X128.204 Y118.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.202 J-.19 P1  F30000
G1 X127.029 Y126.194 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.392831
G1 F2687
G2 X126.959 Y126.428 I1.929 J.708 E.00697
; LINE_WIDTH: 0.359651
G1 X126.936 Y126.552 E.00325
; LINE_WIDTH: 0.315862
G1 X126.913 Y126.676 E.0028
; LINE_WIDTH: 0.272074
G1 X126.89 Y126.8 E.00235
; LINE_WIDTH: 0.228286
G1 X126.868 Y126.924 E.0019
; LINE_WIDTH: 0.184497
G1 X126.845 Y127.048 E.00145
; LINE_WIDTH: 0.140709
G1 X126.822 Y127.172 E.001
G1 X126.822 Y128.828 F30000
; LINE_WIDTH: 0.140708
G1 F2687
G1 X126.845 Y128.952 E.001
; LINE_WIDTH: 0.184496
G1 X126.868 Y129.076 E.00145
; LINE_WIDTH: 0.228284
G1 X126.89 Y129.2 E.0019
; LINE_WIDTH: 0.272072
G1 X126.913 Y129.324 E.00235
; LINE_WIDTH: 0.31586
G1 X126.936 Y129.448 E.0028
; LINE_WIDTH: 0.359648
G1 X126.959 Y129.572 E.00325
; LINE_WIDTH: 0.392831
G2 X127.029 Y129.806 I2 J-.474 E.00697
; WIPE_START
G1 F24000
G1 X126.959 Y129.572 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.118 J1.211 P1  F30000
G1 X132.687 Y130.131 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2687
G1 X132.561 Y130.304 E.00656
G1 X131.972 Y130.825 E.02416
G1 X131.239 Y131.217 E.02555
G1 X130.433 Y131.421 E.02555
G1 X129.601 Y131.426 E.02555
G1 X128.793 Y131.233 E.02555
G1 X128.054 Y130.851 E.02555
G1 X127.428 Y130.304 E.02555
G1 X127.302 Y130.131 E.00656
G1 X126.989 Y130.229 E.0101
G1 X126.989 Y136.506 E.19287
M73 P32 R13
G1 X133 Y136.506 E.18472
G1 X133 Y130.229 E.19287
G1 X132.744 Y130.149 E.00825
G1 X132.623 Y130.752 F30000
G1 F2687
G1 X132.222 Y131.108 E.01646
G1 X131.414 Y131.55 E.02832
G1 X130.523 Y131.787 E.02832
G1 X129.601 Y131.803 E.02832
G1 X128.703 Y131.599 E.02832
G1 X127.879 Y131.185 E.02832
G1 X127.366 Y130.752 E.02062
G1 X127.366 Y136.129 E.1652
G1 X132.623 Y136.129 E.16155
G1 X132.623 Y130.812 E.16336
G1 X132.246 Y131.539 F30000
G1 F2687
G1 X131.589 Y131.884 E.0228
G1 X130.613 Y132.153 E.0311
G1 X129.601 Y132.18 E.0311
G1 X128.612 Y131.965 E.0311
G1 X127.743 Y131.539 E.02974
G1 X127.743 Y135.752 E.12943
G1 X132.246 Y135.752 E.13838
G1 X132.246 Y131.599 E.12759
G1 X131.869 Y132.163 F30000
G1 F2687
G1 X131.467 Y132.331 E.01339
G1 X130.704 Y132.519 E.02416
G1 X130.388 Y132.558 E.00978
G1 X129.601 Y132.558 E.02416
G1 X129.286 Y132.519 E.00978
G1 X128.522 Y132.331 E.02416
G1 X128.12 Y132.163 E.01339
G1 X128.12 Y135.375 E.09868
G1 X131.869 Y135.375 E.1152
G1 X131.869 Y132.223 E.09683
G1 X131.492 Y132.713 F30000
G1 F2687
G1 X130.794 Y132.885 E.0221
G1 X130.388 Y132.935 E.01257
G1 X129.601 Y132.935 E.02416
G1 X129.195 Y132.885 E.01257
G1 X128.497 Y132.713 E.0221
G1 X128.497 Y134.998 E.07019
G1 X131.492 Y134.998 E.09203
G1 X131.492 Y132.773 E.06835
G1 X131.115 Y133.194 F30000
G1 F2687
G1 X130.443 Y133.311 E.02096
G1 X129.601 Y133.312 E.02585
G1 X128.874 Y133.194 E.02264
G1 X128.874 Y134.62 E.04382
G1 X131.115 Y134.62 E.06886
G1 X131.115 Y133.254 E.04197
G1 X130.693 Y133.7 F30000
; LINE_WIDTH: 0.509061
G1 F2687
G1 X130.388 Y133.733 E.01168
G1 X129.601 Y133.733 E.02987
G1 X129.296 Y133.7 E.01168
G1 X129.296 Y134.199 E.01894
G2 X130.693 Y134.199 I.699 J-692.321 E.05308
G1 X130.693 Y133.76 E.01666
G1 X132.96 Y129.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392831
G1 F2687
G2 X133.031 Y129.572 I-1.928 J-.708 E.00697
; LINE_WIDTH: 0.359649
G1 X133.053 Y129.448 E.00325
; LINE_WIDTH: 0.315861
G1 X133.076 Y129.324 E.0028
; LINE_WIDTH: 0.272073
G1 X133.099 Y129.2 E.00235
; LINE_WIDTH: 0.228285
G1 X133.121 Y129.076 E.0019
; LINE_WIDTH: 0.184497
G1 X133.144 Y128.952 E.00145
; LINE_WIDTH: 0.140708
G1 X133.167 Y128.828 E.001
G1 X133.167 Y127.172 F30000
; LINE_WIDTH: 0.0969201
G1 F2687
G1 X133.144 Y127.048 E.00055
; LINE_WIDTH: 0.140708
G1 X133.121 Y126.924 E.001
; LINE_WIDTH: 0.184497
G1 X133.099 Y126.8 E.00145
; LINE_WIDTH: 0.228285
G1 X133.076 Y126.676 E.0019
; LINE_WIDTH: 0.272074
G1 X133.053 Y126.552 E.00235
; LINE_WIDTH: 0.315862
G1 X133.031 Y126.428 E.0028
; LINE_WIDTH: 0.375889
G2 X132.96 Y126.194 I-1.998 J.473 E.00664
G1 X132.687 Y125.869 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F2687
G1 X133 Y125.771 E.0101
G1 X133 Y119.494 E.19287
G1 X126.989 Y119.494 E.18472
G1 X126.989 Y125.771 E.19287
G1 X127.302 Y125.869 E.0101
G1 X127.428 Y125.696 E.00656
G1 X128.017 Y125.175 E.02416
G1 X128.75 Y124.783 E.02555
G1 X129.556 Y124.579 E.02555
G1 X130.388 Y124.574 E.02555
G1 X131.196 Y124.767 E.02555
G1 X131.935 Y125.149 E.02555
G1 X132.561 Y125.696 E.02555
G1 X132.651 Y125.82 E.00472
G1 X132.623 Y125.248 F30000
G1 F2687
G1 X132.623 Y119.871 E.1652
G1 X127.366 Y119.871 E.16155
G1 X127.366 Y125.248 E.1652
G1 X127.767 Y124.892 E.01646
G1 X128.575 Y124.45 E.02832
G1 X129.466 Y124.213 E.02832
G1 X130.388 Y124.197 E.02832
G1 X131.286 Y124.401 E.02832
G1 X132.11 Y124.815 E.02832
G1 X132.577 Y125.209 E.01878
G1 X132.246 Y124.461 F30000
G1 F2687
G1 X132.246 Y120.248 E.12943
G1 X127.743 Y120.248 E.13838
G1 X127.743 Y124.461 E.12943
G1 X128.4 Y124.116 E.0228
G1 X129.376 Y123.847 E.0311
G1 X130.388 Y123.82 E.0311
G1 X131.377 Y124.035 E.0311
G1 X132.192 Y124.434 E.0279
G1 X131.869 Y123.837 F30000
G1 F2687
G1 X131.869 Y120.625 E.09868
G1 X128.12 Y120.625 E.1152
G1 X128.12 Y123.837 E.09868
G1 X128.522 Y123.669 E.01339
G1 X129.286 Y123.481 E.02416
G1 X129.601 Y123.442 E.00978
G1 X130.388 Y123.442 E.02416
G1 X130.704 Y123.481 E.00978
G1 X131.467 Y123.669 E.02416
G1 X131.814 Y123.814 E.01155
G1 X131.492 Y123.287 F30000
G1 F2687
G1 X131.492 Y121.002 E.07019
G1 X128.497 Y121.002 E.09203
G1 X128.497 Y123.287 E.07019
G1 X129.195 Y123.115 E.0221
G1 X129.601 Y123.065 E.01257
G1 X130.388 Y123.065 E.02416
G1 X130.794 Y123.115 E.01257
G1 X131.434 Y123.272 E.02026
G1 X131.115 Y122.806 F30000
G1 F2687
G1 X131.115 Y121.38 E.04382
G1 X128.874 Y121.38 E.06886
G1 X128.874 Y122.806 E.04382
G1 X129.546 Y122.689 E.02096
G1 X130.388 Y122.688 E.02585
G1 X131.056 Y122.796 E.02079
G1 X130.693 Y122.3 F30000
; LINE_WIDTH: 0.509069
G1 F2687
G1 X130.693 Y121.801 E.01894
G2 X129.296 Y121.801 I-.699 J692.321 E.05308
G1 X129.296 Y122.3 E.01894
G1 X129.601 Y122.267 E.01168
G1 X130.388 Y122.267 E.02987
G1 X130.634 Y122.293 E.0094
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X130.388 Y122.267 E-.09401
G1 X129.601 Y122.267 E-.29878
G1 X129.296 Y122.3 E-.11681
G1 X129.296 Y121.801 E-.18944
G1 X129.456 Y121.801 E-.06096
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/103
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
G3 Z1 I-1.203 J-.183 P1  F30000
G1 X128.95 Y125.133 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1433
G1 X129.626 Y124.966 E.02311
G1 X130.363 Y124.966 E.02444
G1 X131.078 Y125.142 E.02444
G1 X131.731 Y125.485 E.02444
G1 X132.282 Y125.973 E.02444
G1 X132.701 Y126.58 E.02444
G1 X132.962 Y127.269 E.02444
G1 X133.051 Y128 E.02444
G1 X132.962 Y128.731 E.02444
G1 X132.701 Y129.42 E.02444
G1 X132.282 Y130.027 E.02444
G1 X131.731 Y130.515 E.02444
G1 X131.078 Y130.858 E.02444
G1 X130.363 Y131.034 E.02444
G1 X129.626 Y131.034 E.02444
G1 X128.911 Y130.858 E.02444
G1 X128.258 Y130.515 E.02444
G1 X127.707 Y130.027 E.02444
G1 X127.288 Y129.42 E.02444
G1 X127.027 Y128.731 E.02444
G1 X126.938 Y128 E.02444
G1 X127.027 Y127.269 E.02444
G1 X127.288 Y126.58 E.02444
G1 X127.707 Y125.973 E.02444
G1 X128.258 Y125.485 E.02444
G1 X128.893 Y125.151 E.02378
G1 X129.009 Y125.534 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1433
G1 X129.051 Y125.511 E.00146
G1 X129.674 Y125.358 E.01972
G1 X130.315 Y125.358 E.01972
G1 X130.938 Y125.511 E.01972
G1 X131.506 Y125.81 E.01972
G1 X131.987 Y126.235 E.01972
G1 X132.351 Y126.763 E.01972
G1 X132.579 Y127.363 E.01972
G1 X132.656 Y128 E.01972
G1 X132.579 Y128.637 E.01972
G1 X132.351 Y129.237 E.01972
G1 X131.987 Y129.765 E.01972
G1 X131.506 Y130.19 E.01972
G1 X130.938 Y130.489 E.01972
G1 X130.315 Y130.642 E.01972
G1 X129.674 Y130.642 E.01972
G1 X129.051 Y130.489 E.01972
G1 X128.483 Y130.19 E.01972
G1 X128.002 Y129.765 E.01972
G1 X127.638 Y129.237 E.01972
G1 X127.41 Y128.637 E.01972
G1 X127.333 Y128 E.01972
G1 X127.41 Y127.363 E.01972
G1 X127.638 Y126.763 E.01972
G1 X128.002 Y126.235 E.01972
G1 X128.483 Y125.81 E.01972
G1 X128.955 Y125.561 E.01641
M204 S10000
; WIPE_START
G1 F24000
G1 X129.051 Y125.511 E-.04091
G1 X129.674 Y125.358 E-.24382
G1 X130.315 Y125.358 E-.24382
G1 X130.907 Y125.504 E-.23145
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.009 J-.68 P1  F30000
G1 X126.597 Y119.102 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1433
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y136.898 E.59032
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y119.162 E.58833
G1 X126.205 Y118.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1433
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y137.29 E.57091
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y118.77 E.56907
M204 S10000
; WIPE_START
G1 F24000
G1 X128.204 Y118.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.207 J.155 P1  F30000
G1 X128.976 Y124.767 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1433
G2 X127.601 Y125.601 I1.156 J3.456 E.05378
G1 X126.945 Y124.945 E.03079
G1 X126.945 Y123.379 E.05194
G1 X130.874 Y119.45 E.18431
G1 X129.126 Y119.45 E.05796
G1 X133.044 Y123.368 E.1838
G1 X133.044 Y124.956 E.05266
G1 X132.394 Y125.606 E.03052
G2 X131.203 Y124.814 I-2.203 J2.019 E.04791
G1 X131.021 Y124.769 E.00623
G1 X132.96 Y126.194 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.375889
G1 F1433
G3 X133.031 Y126.428 I-1.927 J.707 E.00664
; LINE_WIDTH: 0.315862
G1 X133.053 Y126.552 E.0028
; LINE_WIDTH: 0.272074
G1 X133.076 Y126.676 E.00235
; LINE_WIDTH: 0.228285
G1 X133.099 Y126.8 E.0019
; LINE_WIDTH: 0.184497
G1 X133.121 Y126.924 E.00145
; LINE_WIDTH: 0.140708
G1 X133.144 Y127.048 E.001
; LINE_WIDTH: 0.0969201
G1 X133.167 Y127.172 E.00055
G1 X133.167 Y128.828 F30000
; LINE_WIDTH: 0.140708
G1 F1433
G1 X133.144 Y128.952 E.001
; LINE_WIDTH: 0.184497
G1 X133.121 Y129.076 E.00145
; LINE_WIDTH: 0.228285
G1 X133.099 Y129.2 E.0019
; LINE_WIDTH: 0.272073
G1 X133.076 Y129.324 E.00235
; LINE_WIDTH: 0.315861
G1 X133.053 Y129.448 E.0028
; LINE_WIDTH: 0.359649
G1 X133.031 Y129.572 E.00325
; LINE_WIDTH: 0.392831
G3 X132.96 Y129.806 I-1.998 J-.474 E.00697
G1 X131.021 Y131.231 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1433
G2 X132.394 Y130.394 I-1.177 J-3.474 E.05378
G1 X133.044 Y131.044 E.03052
G1 X133.044 Y132.632 E.05266
G1 X129.126 Y136.55 E.1838
G1 X130.874 Y136.55 E.05796
G1 X126.945 Y132.621 E.18431
G1 X126.945 Y131.055 E.05194
G1 X127.601 Y130.399 E.03079
G2 X128.786 Y131.186 I2.189 J-2.01 E.04765
G1 X128.976 Y131.233 E.00648
G1 X127.029 Y129.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392831
M73 P33 R13
G1 F1433
M73 P33 R12
G3 X126.959 Y129.572 I1.928 J-.708 E.00697
; LINE_WIDTH: 0.359648
G1 X126.936 Y129.448 E.00325
; LINE_WIDTH: 0.31586
G1 X126.913 Y129.324 E.0028
; LINE_WIDTH: 0.272072
G1 X126.89 Y129.2 E.00235
; LINE_WIDTH: 0.228284
G1 X126.868 Y129.076 E.0019
; LINE_WIDTH: 0.184496
G1 X126.845 Y128.952 E.00145
; LINE_WIDTH: 0.140708
G1 X126.822 Y128.828 E.001
G1 X126.822 Y127.172 F30000
; LINE_WIDTH: 0.140709
G1 F1433
G1 X126.845 Y127.048 E.001
; LINE_WIDTH: 0.184497
G1 X126.868 Y126.924 E.00145
; LINE_WIDTH: 0.228286
G1 X126.89 Y126.8 E.0019
; LINE_WIDTH: 0.272074
G1 X126.913 Y126.676 E.00235
; LINE_WIDTH: 0.315862
G1 X126.936 Y126.552 E.0028
; LINE_WIDTH: 0.359651
G1 X126.959 Y126.428 E.00325
; LINE_WIDTH: 0.392831
G3 X127.029 Y126.194 I1.999 J.474 E.00697
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.959 Y126.428 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/103
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
G3 Z1.2 I.664 J1.02 P1  F30000
G1 X128.95 Y125.133 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1432
G1 X129.626 Y124.966 E.02311
G1 X130.363 Y124.966 E.02444
G1 X131.078 Y125.142 E.02444
G1 X131.731 Y125.485 E.02444
G1 X132.282 Y125.973 E.02444
G1 X132.701 Y126.58 E.02444
G1 X132.962 Y127.269 E.02444
G1 X133.051 Y128 E.02444
G1 X132.962 Y128.731 E.02444
G1 X132.701 Y129.42 E.02444
G1 X132.282 Y130.027 E.02444
G1 X131.731 Y130.515 E.02444
G1 X131.078 Y130.858 E.02444
G1 X130.363 Y131.034 E.02444
G1 X129.626 Y131.034 E.02444
G1 X128.911 Y130.858 E.02444
G1 X128.258 Y130.515 E.02444
G1 X127.707 Y130.027 E.02444
G1 X127.288 Y129.42 E.02444
G1 X127.027 Y128.731 E.02444
G1 X126.938 Y128 E.02444
G1 X127.027 Y127.269 E.02444
G1 X127.288 Y126.58 E.02444
G1 X127.707 Y125.973 E.02444
G1 X128.258 Y125.485 E.02444
G1 X128.893 Y125.151 E.02378
G1 X129.012 Y125.532 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1432
G1 X129.051 Y125.511 E.00133
G1 X129.674 Y125.358 E.01972
G1 X130.315 Y125.358 E.01972
G1 X130.938 Y125.511 E.01972
G1 X131.506 Y125.81 E.01972
G1 X131.987 Y126.235 E.01972
G1 X132.351 Y126.763 E.01972
G1 X132.579 Y127.363 E.01972
G1 X132.656 Y128 E.01972
G1 X132.579 Y128.637 E.01972
G1 X132.351 Y129.237 E.01972
G1 X131.987 Y129.765 E.01972
G1 X131.506 Y130.19 E.01972
G1 X130.938 Y130.489 E.01972
G1 X130.315 Y130.642 E.01972
G1 X129.674 Y130.642 E.01972
G1 X129.051 Y130.489 E.01972
G1 X128.483 Y130.19 E.01972
G1 X128.002 Y129.765 E.01972
G1 X127.638 Y129.237 E.01972
G1 X127.41 Y128.637 E.01972
G1 X127.391 Y128.48 E.00487
G1 X127.333 Y128 E.01485
G1 X127.41 Y127.363 E.01972
G1 X127.638 Y126.763 E.01972
G1 X128.002 Y126.235 E.01972
G1 X128.483 Y125.81 E.01972
G1 X128.959 Y125.559 E.01654
M204 S10000
; WIPE_START
G1 F24000
G1 X129.051 Y125.511 E-.03927
G1 X129.674 Y125.358 E-.24382
G1 X130.315 Y125.358 E-.24382
G1 X130.911 Y125.505 E-.2331
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.009 J-.68 P1  F30000
G1 X126.597 Y119.102 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1432
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y136.898 E.59032
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y119.162 E.58833
G1 X126.205 Y118.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1432
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y137.29 E.57091
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y118.77 E.56907
M204 S10000
; WIPE_START
G1 F24000
G1 X128.204 Y118.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.207 J.155 P1  F30000
G1 X128.976 Y124.767 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1432
G2 X127.601 Y125.601 I1.156 J3.456 E.05378
G1 X126.945 Y124.945 E.03079
G1 X126.945 Y123.379 E.05194
G1 X130.874 Y119.45 E.18431
G1 X129.126 Y119.45 E.05796
G1 X133.044 Y123.368 E.1838
G1 X133.044 Y124.956 E.05266
G1 X132.394 Y125.606 E.03052
G2 X131.203 Y124.814 I-2.203 J2.019 E.04791
G1 X131.021 Y124.769 E.00623
G1 X132.96 Y126.194 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.375889
G1 F1432
G3 X133.031 Y126.428 I-1.928 J.707 E.00664
; LINE_WIDTH: 0.315862
G1 X133.053 Y126.552 E.0028
; LINE_WIDTH: 0.272074
G1 X133.076 Y126.676 E.00235
; LINE_WIDTH: 0.228285
G1 X133.099 Y126.8 E.0019
; LINE_WIDTH: 0.184497
G1 X133.121 Y126.924 E.00145
; LINE_WIDTH: 0.140708
G1 X133.144 Y127.048 E.001
; LINE_WIDTH: 0.0969201
G1 X133.167 Y127.172 E.00055
G1 X133.167 Y128.828 F30000
; LINE_WIDTH: 0.140708
G1 F1432
G1 X133.144 Y128.952 E.001
; LINE_WIDTH: 0.184497
G1 X133.121 Y129.076 E.00145
; LINE_WIDTH: 0.228285
G1 X133.099 Y129.2 E.0019
; LINE_WIDTH: 0.272073
G1 X133.076 Y129.324 E.00235
; LINE_WIDTH: 0.315861
G1 X133.053 Y129.448 E.0028
; LINE_WIDTH: 0.359649
G1 X133.031 Y129.572 E.00325
; LINE_WIDTH: 0.392831
G3 X132.96 Y129.806 I-1.998 J-.474 E.00697
G1 X131.021 Y131.231 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1432
G2 X132.394 Y130.394 I-1.177 J-3.474 E.05378
G1 X133.044 Y131.044 E.03052
G1 X133.044 Y132.632 E.05266
G1 X129.126 Y136.55 E.1838
G1 X130.874 Y136.55 E.05796
G1 X126.945 Y132.621 E.18431
G1 X126.945 Y131.055 E.05194
G1 X127.601 Y130.399 E.03079
G2 X128.786 Y131.186 I2.189 J-2.01 E.04765
G1 X128.976 Y131.233 E.00648
G1 X127.029 Y129.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392831
G1 F1432
G3 X126.959 Y129.572 I1.928 J-.708 E.00697
; LINE_WIDTH: 0.359648
G1 X126.936 Y129.448 E.00325
; LINE_WIDTH: 0.31586
G1 X126.913 Y129.324 E.0028
; LINE_WIDTH: 0.272072
G1 X126.89 Y129.2 E.00235
; LINE_WIDTH: 0.228284
G1 X126.868 Y129.076 E.0019
; LINE_WIDTH: 0.184496
G1 X126.845 Y128.952 E.00145
; LINE_WIDTH: 0.140708
G1 X126.822 Y128.828 E.001
G1 X126.822 Y127.172 F30000
; LINE_WIDTH: 0.140709
G1 F1432
G1 X126.845 Y127.048 E.001
; LINE_WIDTH: 0.184497
G1 X126.868 Y126.924 E.00145
; LINE_WIDTH: 0.228286
G1 X126.89 Y126.8 E.0019
; LINE_WIDTH: 0.272074
G1 X126.913 Y126.676 E.00235
; LINE_WIDTH: 0.315862
G1 X126.936 Y126.552 E.0028
; LINE_WIDTH: 0.359651
G1 X126.959 Y126.428 E.00325
; LINE_WIDTH: 0.392831
G3 X127.029 Y126.194 I1.999 J.474 E.00697
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
M73 P34 R12
G1 X126.959 Y126.428 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/103
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
G3 Z1.4 I.671 J1.015 P1  F30000
G1 X128.875 Y125.161 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1432
G1 X128.911 Y125.142 E.00133
G1 X129.626 Y124.966 E.02444
G1 X130.363 Y124.966 E.02444
G1 X131.078 Y125.142 E.02444
G1 X131.731 Y125.485 E.02444
G1 X132.282 Y125.973 E.02444
G1 X132.701 Y126.58 E.02444
G1 X132.962 Y127.269 E.02444
G1 X133.051 Y128 E.02444
G1 X132.962 Y128.731 E.02444
G1 X132.701 Y129.42 E.02444
G1 X132.282 Y130.027 E.02444
G1 X131.731 Y130.515 E.02444
G1 X131.078 Y130.858 E.02444
G1 X130.363 Y131.034 E.02444
G1 X129.626 Y131.034 E.02444
G1 X128.911 Y130.858 E.02444
G1 X128.258 Y130.515 E.02444
G1 X127.707 Y130.027 E.02444
G1 X127.288 Y129.42 E.02444
G1 X127.027 Y128.731 E.02444
G1 X126.938 Y128 E.02444
G1 X127.027 Y127.269 E.02444
G1 X127.288 Y126.58 E.02444
G1 X127.707 Y125.973 E.02444
G1 X128.258 Y125.485 E.02444
G1 X128.822 Y125.189 E.02113
G1 X129.016 Y125.529 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1432
G1 X129.051 Y125.511 E.00119
G1 X129.674 Y125.358 E.01972
G1 X130.315 Y125.358 E.01972
G1 X130.938 Y125.511 E.01972
G1 X131.506 Y125.81 E.01972
G1 X131.987 Y126.235 E.01972
G1 X132.351 Y126.763 E.01972
G1 X132.579 Y127.363 E.01972
G1 X132.656 Y128 E.01972
G1 X132.579 Y128.637 E.01972
G1 X132.351 Y129.237 E.01972
G1 X131.987 Y129.765 E.01972
G1 X131.506 Y130.19 E.01972
G1 X130.938 Y130.489 E.01972
G1 X130.315 Y130.642 E.01972
G1 X129.674 Y130.642 E.01972
G1 X129.051 Y130.489 E.01972
G1 X128.483 Y130.19 E.01972
G1 X128.002 Y129.765 E.01972
G1 X127.638 Y129.237 E.01972
G1 X127.41 Y128.637 E.01972
G1 X127.333 Y128 E.01972
G1 X127.41 Y127.363 E.01972
G1 X127.638 Y126.763 E.01972
G1 X128.002 Y126.235 E.01972
G1 X128.483 Y125.81 E.01972
G1 X128.963 Y125.557 E.01668
M204 S10000
; WIPE_START
G1 F24000
G1 X129.051 Y125.511 E-.03754
G1 X129.674 Y125.358 E-.24382
G1 X130.315 Y125.358 E-.24382
G1 X130.915 Y125.506 E-.23482
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.009 J-.68 P1  F30000
G1 X126.597 Y119.102 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1432
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y136.898 E.59032
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y119.162 E.58833
G1 X126.205 Y118.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1432
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y137.29 E.57091
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y118.77 E.56907
M204 S10000
; WIPE_START
G1 F24000
G1 X128.204 Y118.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.207 J.155 P1  F30000
G1 X128.976 Y124.767 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1432
G2 X127.601 Y125.601 I1.156 J3.456 E.05378
G1 X126.945 Y124.945 E.03079
G1 X126.945 Y123.379 E.05194
G1 X130.874 Y119.45 E.18431
G1 X129.126 Y119.45 E.05796
G1 X133.044 Y123.368 E.1838
G1 X133.044 Y124.956 E.05266
G1 X132.394 Y125.606 E.03052
G2 X131.203 Y124.814 I-2.203 J2.019 E.04791
G1 X131.021 Y124.769 E.00623
G1 X132.96 Y126.194 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.375889
G1 F1432
G3 X133.031 Y126.428 I-1.928 J.707 E.00664
; LINE_WIDTH: 0.315862
G1 X133.053 Y126.552 E.0028
; LINE_WIDTH: 0.272074
G1 X133.076 Y126.676 E.00235
; LINE_WIDTH: 0.228285
G1 X133.099 Y126.8 E.0019
; LINE_WIDTH: 0.184497
G1 X133.121 Y126.924 E.00145
; LINE_WIDTH: 0.140708
G1 X133.144 Y127.048 E.001
; LINE_WIDTH: 0.0969201
G1 X133.167 Y127.172 E.00055
G1 X133.167 Y128.828 F30000
; LINE_WIDTH: 0.140708
G1 F1432
G1 X133.144 Y128.952 E.001
; LINE_WIDTH: 0.184497
G1 X133.121 Y129.076 E.00145
; LINE_WIDTH: 0.228285
G1 X133.099 Y129.2 E.0019
; LINE_WIDTH: 0.272073
G1 X133.076 Y129.324 E.00235
; LINE_WIDTH: 0.315861
G1 X133.053 Y129.448 E.0028
; LINE_WIDTH: 0.359649
G1 X133.031 Y129.572 E.00325
; LINE_WIDTH: 0.392831
G3 X132.96 Y129.806 I-1.998 J-.474 E.00697
G1 X131.021 Y131.231 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1432
G2 X132.394 Y130.394 I-1.177 J-3.474 E.05378
G1 X133.044 Y131.044 E.03052
G1 X133.044 Y132.632 E.05266
G1 X129.126 Y136.55 E.1838
G1 X130.874 Y136.55 E.05796
G1 X126.945 Y132.621 E.18431
G1 X126.945 Y131.055 E.05194
G1 X127.601 Y130.399 E.03079
G2 X128.786 Y131.186 I2.189 J-2.01 E.04765
G1 X128.976 Y131.233 E.00648
G1 X127.029 Y129.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392831
G1 F1432
G3 X126.959 Y129.572 I1.929 J-.708 E.00697
; LINE_WIDTH: 0.359646
G1 X126.935 Y129.442 E.00341
; LINE_WIDTH: 0.311956
G1 X126.911 Y129.312 E.0029
; LINE_WIDTH: 0.264266
G1 X126.889 Y129.191 E.00221
; LINE_WIDTH: 0.22243
G1 X126.867 Y129.07 E.0018
; LINE_WIDTH: 0.180593
G1 X126.844 Y128.949 E.00138
; LINE_WIDTH: 0.138757
G1 X126.822 Y128.828 E.00096
G1 X126.822 Y127.172 F30000
; LINE_WIDTH: 0.140709
G1 F1432
G1 X126.845 Y127.048 E.001
; LINE_WIDTH: 0.184497
G1 X126.868 Y126.924 E.00145
; LINE_WIDTH: 0.228286
G1 X126.89 Y126.8 E.0019
; LINE_WIDTH: 0.272074
G1 X126.913 Y126.676 E.00235
; LINE_WIDTH: 0.315862
G1 X126.936 Y126.552 E.0028
; LINE_WIDTH: 0.359651
G1 X126.959 Y126.428 E.00325
; LINE_WIDTH: 0.392831
G3 X127.029 Y126.194 I1.999 J.474 E.00697
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.959 Y126.428 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/103
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
G3 Z1.6 I.664 J1.02 P1  F30000
G1 X128.949 Y125.133 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1432
G1 X129.626 Y124.966 E.02312
G1 X130.363 Y124.966 E.02444
G1 X131.078 Y125.142 E.02444
G1 X131.731 Y125.485 E.02444
G1 X132.282 Y125.973 E.02444
G1 X132.701 Y126.58 E.02444
G1 X132.962 Y127.269 E.02444
G1 X133.051 Y128 E.02444
G1 X132.962 Y128.731 E.02444
G1 X132.701 Y129.42 E.02444
G1 X132.282 Y130.027 E.02444
G1 X131.731 Y130.515 E.02444
G1 X131.078 Y130.858 E.02444
G1 X130.363 Y131.034 E.02444
G1 X129.626 Y131.034 E.02444
G1 X128.911 Y130.858 E.02444
G1 X128.258 Y130.515 E.02444
G1 X127.707 Y130.027 E.02444
G1 X127.288 Y129.42 E.02444
G1 X127.027 Y128.731 E.02444
G1 X126.938 Y128 E.02444
G1 X127.027 Y127.269 E.02444
G1 X127.288 Y126.58 E.02444
G1 X127.707 Y125.973 E.02444
G1 X128.258 Y125.485 E.02444
G1 X128.893 Y125.151 E.02378
G1 X129.021 Y125.527 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1432
G1 X129.051 Y125.511 E.00105
G1 X129.674 Y125.358 E.01972
G1 X130.315 Y125.358 E.01972
G1 X130.938 Y125.511 E.01972
G1 X131.506 Y125.81 E.01972
G1 X131.987 Y126.235 E.01972
G1 X132.351 Y126.763 E.01972
G1 X132.579 Y127.363 E.01972
G1 X132.656 Y128 E.01972
G1 X132.579 Y128.637 E.01972
G1 X132.351 Y129.237 E.01972
G1 X131.987 Y129.765 E.01972
G1 X131.506 Y130.19 E.01972
G1 X130.938 Y130.489 E.01972
G1 X130.315 Y130.642 E.01972
G1 X129.674 Y130.642 E.01972
G1 X129.051 Y130.489 E.01972
G1 X128.483 Y130.19 E.01972
G1 X128.002 Y129.765 E.01972
G1 X127.638 Y129.237 E.01972
G1 X127.41 Y128.637 E.01972
G1 X127.333 Y128 E.01972
G1 X127.41 Y127.363 E.01972
G1 X127.638 Y126.763 E.01972
G1 X128.002 Y126.235 E.01972
G1 X128.483 Y125.81 E.01972
G1 X128.967 Y125.555 E.01682
M204 S10000
; WIPE_START
G1 F24000
G1 X129.051 Y125.511 E-.03576
G1 X129.674 Y125.358 E-.24382
G1 X130.315 Y125.358 E-.24382
G1 X130.92 Y125.507 E-.2366
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.009 J-.681 P1  F30000
G1 X126.597 Y119.102 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1432
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y136.898 E.59032
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y119.162 E.58833
G1 X126.205 Y118.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1432
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y137.29 E.57091
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y118.77 E.56907
M204 S10000
; WIPE_START
G1 F24000
G1 X128.204 Y118.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.207 J.155 P1  F30000
G1 X128.976 Y124.767 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1432
G2 X127.601 Y125.601 I1.156 J3.456 E.05378
G1 X126.945 Y124.945 E.03079
G1 X126.945 Y123.379 E.05194
G1 X130.874 Y119.45 E.18431
G1 X129.126 Y119.45 E.05796
G1 X133.044 Y123.368 E.1838
G1 X133.044 Y124.956 E.05266
G1 X132.394 Y125.606 E.03052
G2 X131.203 Y124.814 I-2.203 J2.019 E.04791
G1 X131.021 Y124.769 E.00623
G1 X132.96 Y126.194 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.375889
G1 F1432
G3 X133.031 Y126.428 I-1.928 J.707 E.00664
; LINE_WIDTH: 0.315862
G1 X133.053 Y126.552 E.0028
; LINE_WIDTH: 0.272074
G1 X133.076 Y126.676 E.00235
; LINE_WIDTH: 0.228285
G1 X133.099 Y126.8 E.0019
; LINE_WIDTH: 0.184497
G1 X133.121 Y126.924 E.00145
; LINE_WIDTH: 0.140708
G1 X133.144 Y127.048 E.001
; LINE_WIDTH: 0.0969201
G1 X133.167 Y127.172 E.00055
G1 X133.167 Y128.828 F30000
; LINE_WIDTH: 0.140708
G1 F1432
G1 X133.144 Y128.952 E.001
; LINE_WIDTH: 0.184497
G1 X133.121 Y129.076 E.00145
; LINE_WIDTH: 0.228285
G1 X133.099 Y129.2 E.0019
; LINE_WIDTH: 0.272073
G1 X133.076 Y129.324 E.00235
; LINE_WIDTH: 0.315861
G1 X133.053 Y129.448 E.0028
; LINE_WIDTH: 0.359649
G1 X133.031 Y129.572 E.00325
; LINE_WIDTH: 0.392831
G3 X132.96 Y129.806 I-1.998 J-.474 E.00697
G1 X131.021 Y131.231 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1432
G2 X132.394 Y130.394 I-1.177 J-3.474 E.05378
M73 P35 R12
G1 X133.044 Y131.044 E.03052
G1 X133.044 Y132.632 E.05266
G1 X129.126 Y136.55 E.1838
G1 X130.874 Y136.55 E.05796
G1 X126.945 Y132.621 E.18431
G1 X126.945 Y131.055 E.05194
G1 X127.601 Y130.399 E.03079
G2 X128.786 Y131.186 I2.189 J-2.01 E.04765
G1 X128.976 Y131.233 E.00648
G1 X127.029 Y129.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392831
G1 F1432
G3 X126.959 Y129.572 I1.928 J-.708 E.00697
; LINE_WIDTH: 0.359648
G1 X126.936 Y129.448 E.00325
; LINE_WIDTH: 0.31586
G1 X126.913 Y129.324 E.0028
; LINE_WIDTH: 0.272072
G1 X126.89 Y129.2 E.00235
; LINE_WIDTH: 0.228284
G1 X126.868 Y129.076 E.0019
; LINE_WIDTH: 0.184496
G1 X126.845 Y128.952 E.00145
; LINE_WIDTH: 0.140708
G1 X126.822 Y128.828 E.001
G1 X126.822 Y127.172 F30000
; LINE_WIDTH: 0.140709
G1 F1432
G1 X126.845 Y127.048 E.001
; LINE_WIDTH: 0.184497
G1 X126.868 Y126.924 E.00145
; LINE_WIDTH: 0.228286
G1 X126.89 Y126.8 E.0019
; LINE_WIDTH: 0.272074
G1 X126.913 Y126.676 E.00235
; LINE_WIDTH: 0.315862
G1 X126.936 Y126.552 E.0028
; LINE_WIDTH: 0.359651
G1 X126.959 Y126.428 E.00325
; LINE_WIDTH: 0.392831
G3 X127.029 Y126.194 I1.999 J.474 E.00697
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.959 Y126.428 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/103
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
G3 Z1.8 I.671 J1.015 P1  F30000
G1 X128.875 Y125.161 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1432
G1 X128.911 Y125.142 E.00132
G1 X129.626 Y124.966 E.02444
G1 X130.363 Y124.966 E.02444
G1 X131.078 Y125.142 E.02444
G1 X131.731 Y125.485 E.02444
G1 X132.282 Y125.973 E.02444
G1 X132.701 Y126.58 E.02444
G1 X132.962 Y127.269 E.02444
G1 X133.051 Y128 E.02444
G1 X132.962 Y128.731 E.02444
G1 X132.701 Y129.42 E.02444
G1 X132.282 Y130.027 E.02444
G1 X131.731 Y130.515 E.02444
G1 X131.078 Y130.858 E.02444
G1 X130.363 Y131.034 E.02444
G1 X129.626 Y131.034 E.02444
G1 X128.911 Y130.858 E.02444
G1 X128.258 Y130.515 E.02444
G1 X127.707 Y130.027 E.02444
G1 X127.288 Y129.42 E.02444
G1 X127.027 Y128.731 E.02444
G1 X126.938 Y128 E.02444
G1 X127.027 Y127.269 E.02444
G1 X127.288 Y126.58 E.02444
G1 X127.707 Y125.973 E.02444
G1 X128.258 Y125.485 E.02444
G1 X128.822 Y125.189 E.02113
G1 X129.025 Y125.525 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1432
G1 X129.051 Y125.511 E.0009
G1 X129.674 Y125.358 E.01972
G1 X130.315 Y125.358 E.01972
G1 X130.938 Y125.511 E.01972
G1 X131.506 Y125.81 E.01972
G1 X131.987 Y126.235 E.01972
G1 X132.351 Y126.763 E.01972
G1 X132.579 Y127.363 E.01972
G1 X132.656 Y128 E.01972
G1 X132.579 Y128.637 E.01972
G1 X132.351 Y129.237 E.01972
G1 X131.987 Y129.765 E.01972
G1 X131.506 Y130.19 E.01972
G1 X130.938 Y130.489 E.01972
G1 X130.315 Y130.642 E.01972
G1 X129.674 Y130.642 E.01972
G1 X129.051 Y130.489 E.01972
G1 X128.483 Y130.19 E.01972
G1 X128.002 Y129.765 E.01972
G1 X127.638 Y129.237 E.01972
G1 X127.41 Y128.637 E.01972
G1 X127.333 Y128 E.01972
G1 X127.41 Y127.363 E.01972
G1 X127.638 Y126.763 E.01972
G1 X128.002 Y126.235 E.01972
G1 X128.483 Y125.81 E.01972
G1 X128.972 Y125.553 E.01697
M204 S10000
; WIPE_START
G1 F24000
G1 X129.051 Y125.511 E-.03393
G1 X129.674 Y125.358 E-.24382
G1 X130.315 Y125.358 E-.24382
G1 X130.925 Y125.508 E-.23843
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.008 J-.681 P1  F30000
G1 X126.597 Y119.102 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1432
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y136.898 E.59032
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y119.162 E.58833
G1 X126.205 Y118.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1432
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y137.29 E.57091
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y118.77 E.56907
M204 S10000
; WIPE_START
G1 F24000
G1 X128.204 Y118.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.207 J.155 P1  F30000
G1 X128.976 Y124.767 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1432
G2 X127.601 Y125.601 I1.156 J3.456 E.05378
G1 X126.945 Y124.945 E.03079
G1 X126.945 Y123.379 E.05194
G1 X130.874 Y119.45 E.18431
G1 X129.126 Y119.45 E.05796
G1 X133.044 Y123.368 E.1838
G1 X133.044 Y124.956 E.05266
G1 X132.394 Y125.606 E.03052
G2 X131.203 Y124.814 I-2.203 J2.019 E.04791
G1 X131.021 Y124.769 E.00623
G1 X132.96 Y126.194 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.375889
G1 F1432
G3 X133.031 Y126.428 I-1.928 J.707 E.00664
; LINE_WIDTH: 0.315862
G1 X133.053 Y126.552 E.0028
; LINE_WIDTH: 0.272074
G1 X133.076 Y126.676 E.00235
; LINE_WIDTH: 0.228285
G1 X133.099 Y126.8 E.0019
; LINE_WIDTH: 0.184497
G1 X133.121 Y126.924 E.00145
; LINE_WIDTH: 0.140708
G1 X133.144 Y127.048 E.001
; LINE_WIDTH: 0.0969201
G1 X133.167 Y127.172 E.00055
G1 X133.167 Y128.828 F30000
; LINE_WIDTH: 0.140708
G1 F1432
G1 X133.144 Y128.952 E.001
; LINE_WIDTH: 0.184497
G1 X133.121 Y129.076 E.00145
; LINE_WIDTH: 0.228285
G1 X133.099 Y129.2 E.0019
; LINE_WIDTH: 0.272073
G1 X133.076 Y129.324 E.00235
; LINE_WIDTH: 0.315861
G1 X133.053 Y129.448 E.0028
; LINE_WIDTH: 0.359649
G1 X133.031 Y129.572 E.00325
; LINE_WIDTH: 0.392831
G3 X132.96 Y129.806 I-1.998 J-.474 E.00697
G1 X131.021 Y131.231 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1432
G2 X132.394 Y130.394 I-1.177 J-3.474 E.05378
G1 X133.044 Y131.044 E.03052
G1 X133.044 Y132.632 E.05266
G1 X129.126 Y136.55 E.1838
G1 X130.874 Y136.55 E.05796
G1 X126.945 Y132.621 E.18431
G1 X126.945 Y131.055 E.05194
G1 X127.601 Y130.399 E.03079
G2 X128.786 Y131.186 I2.189 J-2.01 E.04765
G1 X128.976 Y131.233 E.00648
G1 X127.029 Y129.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392831
G1 F1432
M73 P36 R12
G3 X126.959 Y129.572 I1.929 J-.708 E.00697
; LINE_WIDTH: 0.359646
G1 X126.936 Y129.448 E.00325
; LINE_WIDTH: 0.315859
G1 X126.913 Y129.324 E.0028
; LINE_WIDTH: 0.272071
G1 X126.89 Y129.2 E.00235
; LINE_WIDTH: 0.228283
G1 X126.868 Y129.076 E.0019
; LINE_WIDTH: 0.184495
G1 X126.845 Y128.952 E.00145
; LINE_WIDTH: 0.140708
G1 X126.822 Y128.828 E.001
G1 X126.822 Y127.172 F30000
; LINE_WIDTH: 0.140709
G1 F1432
G1 X126.845 Y127.048 E.001
; LINE_WIDTH: 0.184497
G1 X126.868 Y126.924 E.00145
; LINE_WIDTH: 0.228286
G1 X126.89 Y126.8 E.0019
; LINE_WIDTH: 0.272074
G1 X126.913 Y126.676 E.00235
; LINE_WIDTH: 0.315862
G1 X126.936 Y126.552 E.0028
; LINE_WIDTH: 0.359651
G1 X126.959 Y126.428 E.00325
; LINE_WIDTH: 0.392831
G3 X127.029 Y126.194 I1.999 J.474 E.00697
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.959 Y126.428 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/103
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
G3 Z2 I.664 J1.02 P1  F30000
G1 X128.949 Y125.133 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1432
G1 X129.626 Y124.966 E.02312
G1 X130.363 Y124.966 E.02444
G1 X131.078 Y125.142 E.02444
G1 X131.731 Y125.485 E.02444
G1 X132.282 Y125.973 E.02444
G1 X132.701 Y126.58 E.02444
G1 X132.962 Y127.269 E.02444
G1 X133.051 Y128 E.02444
G1 X132.962 Y128.731 E.02444
G1 X132.701 Y129.42 E.02444
G1 X132.282 Y130.027 E.02444
G1 X131.731 Y130.515 E.02444
G1 X131.078 Y130.858 E.02444
G1 X130.363 Y131.034 E.02444
G1 X129.626 Y131.034 E.02444
G1 X128.911 Y130.858 E.02444
G1 X128.258 Y130.515 E.02444
G1 X127.707 Y130.027 E.02444
G1 X127.288 Y129.42 E.02444
G1 X127.027 Y128.731 E.02444
G1 X126.938 Y128 E.02444
G1 X127.027 Y127.269 E.02444
G1 X127.288 Y126.58 E.02444
G1 X127.707 Y125.973 E.02444
G1 X128.258 Y125.485 E.02444
G1 X128.893 Y125.152 E.02377
G1 X129.029 Y125.523 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1432
G1 X129.051 Y125.511 E.00075
G1 X129.674 Y125.358 E.01972
G1 X130.315 Y125.358 E.01972
G1 X130.938 Y125.511 E.01972
G1 X131.506 Y125.81 E.01972
G1 X131.987 Y126.235 E.01972
G1 X132.351 Y126.763 E.01972
G1 X132.579 Y127.363 E.01972
G1 X132.656 Y128 E.01972
G1 X132.579 Y128.637 E.01972
G1 X132.351 Y129.237 E.01972
G1 X131.987 Y129.765 E.01972
G1 X131.506 Y130.19 E.01972
G1 X130.938 Y130.489 E.01972
G1 X130.315 Y130.642 E.01972
G1 X129.674 Y130.642 E.01972
G1 X129.051 Y130.489 E.01972
G1 X128.483 Y130.19 E.01972
G1 X128.002 Y129.765 E.01972
G1 X127.638 Y129.237 E.01972
G1 X127.41 Y128.637 E.01972
G1 X127.333 Y128 E.01972
G1 X127.41 Y127.363 E.01972
G1 X127.638 Y126.763 E.01972
G1 X128.002 Y126.235 E.01972
G1 X128.483 Y125.81 E.01972
G1 X128.976 Y125.551 E.01712
M204 S10000
; WIPE_START
G1 F24000
G1 X129.051 Y125.511 E-.03206
G1 X129.674 Y125.358 E-.24382
G1 X130.315 Y125.358 E-.24382
G1 X130.929 Y125.509 E-.2403
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.008 J-.682 P1  F30000
G1 X126.597 Y119.102 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1432
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y136.898 E.59032
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y119.162 E.58833
G1 X126.205 Y118.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1432
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y137.29 E.57091
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y118.77 E.56907
M204 S10000
; WIPE_START
G1 F24000
G1 X128.204 Y118.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.207 J.155 P1  F30000
G1 X128.976 Y124.767 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1432
G2 X127.601 Y125.601 I1.156 J3.456 E.05378
G1 X126.945 Y124.945 E.03079
G1 X126.945 Y123.379 E.05194
G1 X130.874 Y119.45 E.18431
G1 X129.126 Y119.45 E.05796
G1 X133.044 Y123.368 E.1838
G1 X133.044 Y124.956 E.05266
G1 X132.394 Y125.606 E.03052
G2 X131.203 Y124.814 I-2.203 J2.019 E.04791
G1 X131.021 Y124.769 E.00623
G1 X132.96 Y126.194 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.375889
G1 F1432
G3 X133.031 Y126.428 I-1.928 J.707 E.00664
; LINE_WIDTH: 0.315862
G1 X133.053 Y126.552 E.0028
; LINE_WIDTH: 0.272074
G1 X133.076 Y126.676 E.00235
; LINE_WIDTH: 0.228285
G1 X133.099 Y126.8 E.0019
; LINE_WIDTH: 0.184497
G1 X133.121 Y126.924 E.00145
; LINE_WIDTH: 0.140708
G1 X133.144 Y127.048 E.001
; LINE_WIDTH: 0.0969201
G1 X133.167 Y127.172 E.00055
G1 X133.167 Y128.828 F30000
; LINE_WIDTH: 0.140708
G1 F1432
G1 X133.144 Y128.952 E.001
; LINE_WIDTH: 0.184497
G1 X133.121 Y129.076 E.00145
; LINE_WIDTH: 0.228285
G1 X133.099 Y129.2 E.0019
; LINE_WIDTH: 0.272073
G1 X133.076 Y129.324 E.00235
; LINE_WIDTH: 0.315861
G1 X133.053 Y129.448 E.0028
; LINE_WIDTH: 0.359649
G1 X133.031 Y129.572 E.00325
; LINE_WIDTH: 0.392831
G3 X132.96 Y129.806 I-1.998 J-.474 E.00697
G1 X131.021 Y131.231 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1432
G2 X132.394 Y130.394 I-1.177 J-3.474 E.05378
G1 X133.044 Y131.044 E.03052
G1 X133.044 Y132.632 E.05266
G1 X129.126 Y136.55 E.1838
G1 X130.874 Y136.55 E.05796
G1 X126.945 Y132.621 E.18431
G1 X126.945 Y131.055 E.05194
G1 X127.601 Y130.399 E.03079
G2 X128.786 Y131.186 I2.189 J-2.01 E.04765
G1 X128.976 Y131.233 E.00648
G1 X127.029 Y129.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392831
G1 F1432
G3 X126.959 Y129.572 I1.929 J-.708 E.00697
; LINE_WIDTH: 0.359646
G1 X126.936 Y129.448 E.00325
; LINE_WIDTH: 0.315859
G1 X126.913 Y129.324 E.0028
; LINE_WIDTH: 0.272071
G1 X126.89 Y129.2 E.00235
; LINE_WIDTH: 0.228283
G1 X126.868 Y129.076 E.0019
; LINE_WIDTH: 0.184495
G1 X126.845 Y128.952 E.00145
; LINE_WIDTH: 0.140708
G1 X126.822 Y128.828 E.001
G1 X126.822 Y127.172 F30000
; LINE_WIDTH: 0.140709
G1 F1432
G1 X126.845 Y127.048 E.001
; LINE_WIDTH: 0.184497
G1 X126.868 Y126.924 E.00145
; LINE_WIDTH: 0.228286
G1 X126.89 Y126.8 E.0019
; LINE_WIDTH: 0.272074
G1 X126.913 Y126.676 E.00235
; LINE_WIDTH: 0.315862
G1 X126.936 Y126.552 E.0028
; LINE_WIDTH: 0.359651
G1 X126.959 Y126.428 E.00325
; LINE_WIDTH: 0.392831
G3 X127.029 Y126.194 I1.999 J.474 E.00697
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.959 Y126.428 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/103
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
G3 Z2.2 I.664 J1.02 P1  F30000
G1 X128.949 Y125.133 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1432
G1 X129.626 Y124.966 E.02312
G1 X130.363 Y124.966 E.02444
G1 X131.078 Y125.142 E.02444
G1 X131.731 Y125.485 E.02444
G1 X132.282 Y125.973 E.02444
G1 X132.701 Y126.58 E.02444
G1 X132.962 Y127.269 E.02444
G1 X133.051 Y128 E.02444
G1 X132.962 Y128.731 E.02444
G1 X132.701 Y129.42 E.02444
G1 X132.282 Y130.027 E.02444
G1 X131.731 Y130.515 E.02444
G1 X131.078 Y130.858 E.02444
G1 X130.363 Y131.034 E.02444
G1 X129.626 Y131.034 E.02444
G1 X128.911 Y130.858 E.02444
G1 X128.258 Y130.515 E.02444
G1 X127.707 Y130.027 E.02444
G1 X127.288 Y129.42 E.02444
G1 X127.027 Y128.731 E.02444
G1 X126.938 Y128 E.02444
G1 X127.027 Y127.269 E.02444
M73 P37 R12
G1 X127.288 Y126.58 E.02444
G1 X127.707 Y125.973 E.02444
G1 X128.258 Y125.485 E.02444
G1 X128.893 Y125.152 E.02377
G1 X129.034 Y125.52 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1432
G1 X129.051 Y125.511 E.0006
G1 X129.674 Y125.358 E.01972
G1 X130.315 Y125.358 E.01972
G1 X130.938 Y125.511 E.01972
G1 X131.506 Y125.81 E.01972
G1 X131.987 Y126.235 E.01972
G1 X132.351 Y126.763 E.01972
G1 X132.579 Y127.363 E.01972
G1 X132.656 Y128 E.01972
G1 X132.579 Y128.637 E.01972
G1 X132.351 Y129.237 E.01972
G1 X131.987 Y129.765 E.01972
G1 X131.506 Y130.19 E.01972
G1 X130.938 Y130.489 E.01972
G1 X130.315 Y130.642 E.01972
G1 X129.674 Y130.642 E.01972
G1 X129.051 Y130.489 E.01972
G1 X128.483 Y130.19 E.01972
G1 X128.002 Y129.765 E.01972
G1 X127.638 Y129.237 E.01972
G1 X127.41 Y128.637 E.01972
G1 X127.333 Y128 E.01972
G1 X127.41 Y127.363 E.01972
G1 X127.638 Y126.763 E.01972
G1 X128.002 Y126.235 E.01972
G1 X128.483 Y125.81 E.01972
G1 X128.98 Y125.548 E.01728
M204 S10000
; WIPE_START
G1 F24000
G1 X129.051 Y125.511 E-.03017
G1 X129.674 Y125.358 E-.24382
G1 X130.315 Y125.358 E-.24382
G1 X130.934 Y125.51 E-.24219
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.008 J-.682 P1  F30000
G1 X126.597 Y119.102 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1432
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y136.898 E.59032
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y119.162 E.58833
G1 X126.205 Y118.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1432
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y137.29 E.57091
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y118.77 E.56907
M204 S10000
; WIPE_START
G1 F24000
G1 X128.204 Y118.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.207 J.155 P1  F30000
G1 X128.976 Y124.767 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1432
G2 X127.601 Y125.601 I1.156 J3.456 E.05378
G1 X126.945 Y124.945 E.03079
G1 X126.945 Y123.379 E.05194
G1 X130.874 Y119.45 E.18431
G1 X129.126 Y119.45 E.05796
G1 X133.044 Y123.368 E.1838
G1 X133.044 Y124.956 E.05266
G1 X132.394 Y125.606 E.03052
G2 X131.203 Y124.814 I-2.203 J2.019 E.04791
G1 X131.021 Y124.769 E.00623
G1 X132.96 Y126.194 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.375889
G1 F1432
G3 X133.031 Y126.428 I-1.928 J.707 E.00664
; LINE_WIDTH: 0.315862
G1 X133.053 Y126.552 E.0028
; LINE_WIDTH: 0.272074
G1 X133.076 Y126.676 E.00235
; LINE_WIDTH: 0.228285
G1 X133.099 Y126.8 E.0019
; LINE_WIDTH: 0.184497
G1 X133.121 Y126.924 E.00145
; LINE_WIDTH: 0.140708
G1 X133.144 Y127.048 E.001
; LINE_WIDTH: 0.0969201
G1 X133.167 Y127.172 E.00055
G1 X133.167 Y128.828 F30000
; LINE_WIDTH: 0.140708
G1 F1432
G1 X133.144 Y128.952 E.001
; LINE_WIDTH: 0.184497
G1 X133.121 Y129.076 E.00145
; LINE_WIDTH: 0.228285
G1 X133.099 Y129.2 E.0019
; LINE_WIDTH: 0.272073
G1 X133.076 Y129.324 E.00235
; LINE_WIDTH: 0.315861
G1 X133.053 Y129.448 E.0028
; LINE_WIDTH: 0.359649
G1 X133.031 Y129.572 E.00325
; LINE_WIDTH: 0.392831
G3 X132.96 Y129.806 I-1.998 J-.474 E.00697
G1 X131.021 Y131.231 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1432
G2 X132.394 Y130.394 I-1.177 J-3.474 E.05378
G1 X133.044 Y131.044 E.03052
G1 X133.044 Y132.632 E.05266
G1 X129.126 Y136.55 E.1838
G1 X130.874 Y136.55 E.05796
G1 X126.945 Y132.621 E.18431
G1 X126.945 Y131.055 E.05194
G1 X127.601 Y130.399 E.03079
G2 X128.786 Y131.186 I2.189 J-2.01 E.04765
G1 X128.976 Y131.233 E.00648
G1 X127.029 Y129.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392831
G1 F1432
G3 X126.959 Y129.572 I1.929 J-.708 E.00697
; LINE_WIDTH: 0.35965
G1 X126.936 Y129.448 E.00325
; LINE_WIDTH: 0.315862
G1 X126.913 Y129.324 E.0028
; LINE_WIDTH: 0.272074
G1 X126.89 Y129.2 E.00235
; LINE_WIDTH: 0.228285
G1 X126.868 Y129.076 E.0019
; LINE_WIDTH: 0.184497
G1 X126.845 Y128.952 E.00145
; LINE_WIDTH: 0.140709
G1 X126.822 Y128.828 E.001
G1 X126.822 Y127.172 F30000
; LINE_WIDTH: 0.140709
G1 F1432
G1 X126.845 Y127.048 E.001
; LINE_WIDTH: 0.184497
G1 X126.868 Y126.924 E.00145
; LINE_WIDTH: 0.228286
G1 X126.89 Y126.8 E.0019
; LINE_WIDTH: 0.272074
G1 X126.913 Y126.676 E.00235
; LINE_WIDTH: 0.315862
G1 X126.936 Y126.552 E.0028
; LINE_WIDTH: 0.359651
G1 X126.959 Y126.428 E.00325
; LINE_WIDTH: 0.392831
G3 X127.029 Y126.194 I1.999 J.474 E.00697
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.959 Y126.428 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/103
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
G3 Z2.4 I.664 J1.02 P1  F30000
G1 X128.949 Y125.133 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1432
G1 X129.626 Y124.966 E.02313
G1 X130.363 Y124.966 E.02444
G1 X131.078 Y125.142 E.02444
G1 X131.731 Y125.485 E.02444
G1 X132.282 Y125.973 E.02444
G1 X132.701 Y126.58 E.02444
G1 X132.962 Y127.269 E.02444
G1 X133.051 Y128 E.02444
G1 X132.962 Y128.731 E.02444
G1 X132.701 Y129.42 E.02444
G1 X132.282 Y130.027 E.02444
G1 X131.731 Y130.515 E.02444
G1 X131.078 Y130.858 E.02444
G1 X130.363 Y131.034 E.02444
G1 X129.626 Y131.034 E.02444
G1 X128.911 Y130.858 E.02444
G1 X128.258 Y130.515 E.02444
G1 X127.707 Y130.027 E.02444
G1 X127.288 Y129.42 E.02444
G1 X127.027 Y128.731 E.02444
G1 X126.938 Y128 E.02444
G1 X127.027 Y127.269 E.02444
G1 X127.288 Y126.58 E.02444
G1 X127.707 Y125.973 E.02444
G1 X128.258 Y125.485 E.02444
G1 X128.893 Y125.152 E.02377
G1 X129.038 Y125.518 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1432
G1 X129.051 Y125.511 E.00044
G1 X129.674 Y125.358 E.01972
G1 X130.315 Y125.358 E.01972
G1 X130.938 Y125.511 E.01972
G1 X131.506 Y125.81 E.01972
G1 X131.987 Y126.235 E.01972
G1 X132.351 Y126.763 E.01972
G1 X132.579 Y127.363 E.01972
G1 X132.656 Y128 E.01972
G1 X132.579 Y128.637 E.01972
G1 X132.351 Y129.237 E.01972
G1 X131.987 Y129.765 E.01972
G1 X131.506 Y130.19 E.01972
G1 X130.938 Y130.489 E.01972
G1 X130.315 Y130.642 E.01972
G1 X129.674 Y130.642 E.01972
G1 X129.051 Y130.489 E.01972
G1 X128.483 Y130.19 E.01972
G1 X128.002 Y129.765 E.01972
G1 X127.638 Y129.237 E.01972
G1 X127.41 Y128.637 E.01972
G1 X127.333 Y128 E.01972
G1 X127.41 Y127.363 E.01972
G1 X127.638 Y126.763 E.01972
G1 X128.002 Y126.235 E.01972
G1 X128.483 Y125.81 E.01972
G1 X128.985 Y125.546 E.01743
M204 S10000
; WIPE_START
G1 F24000
G1 X129.051 Y125.511 E-.02827
G1 X129.674 Y125.358 E-.24382
G1 X130.315 Y125.358 E-.24382
G1 X130.938 Y125.511 E-.24382
G1 X130.939 Y125.512 E-.00027
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.008 J-.683 P1  F30000
G1 X126.597 Y119.102 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1432
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y136.898 E.59032
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y119.162 E.58833
G1 X126.205 Y118.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1432
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y137.29 E.57091
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y118.77 E.56907
M204 S10000
; WIPE_START
G1 F24000
G1 X128.204 Y118.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.207 J.155 P1  F30000
G1 X128.976 Y124.767 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1432
G2 X127.601 Y125.601 I1.156 J3.456 E.05378
G1 X126.945 Y124.945 E.03079
G1 X126.945 Y123.379 E.05194
G1 X130.874 Y119.45 E.18431
G1 X129.126 Y119.45 E.05796
G1 X133.044 Y123.368 E.1838
G1 X133.044 Y124.956 E.05266
G1 X132.394 Y125.606 E.03052
G2 X131.203 Y124.814 I-2.203 J2.019 E.04791
G1 X131.021 Y124.769 E.00623
G1 X132.96 Y126.194 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.375889
G1 F1432
G3 X133.031 Y126.428 I-1.928 J.707 E.00664
; LINE_WIDTH: 0.315862
G1 X133.053 Y126.552 E.0028
; LINE_WIDTH: 0.272074
G1 X133.076 Y126.676 E.00235
; LINE_WIDTH: 0.228285
G1 X133.099 Y126.8 E.0019
; LINE_WIDTH: 0.184497
G1 X133.121 Y126.924 E.00145
; LINE_WIDTH: 0.140708
G1 X133.144 Y127.048 E.001
; LINE_WIDTH: 0.0969201
G1 X133.167 Y127.172 E.00055
G1 X133.167 Y128.828 F30000
; LINE_WIDTH: 0.140708
G1 F1432
G1 X133.144 Y128.952 E.001
; LINE_WIDTH: 0.184497
G1 X133.121 Y129.076 E.00145
; LINE_WIDTH: 0.228285
G1 X133.099 Y129.2 E.0019
; LINE_WIDTH: 0.272073
G1 X133.076 Y129.324 E.00235
; LINE_WIDTH: 0.315861
G1 X133.053 Y129.448 E.0028
; LINE_WIDTH: 0.359649
G1 X133.031 Y129.572 E.00325
; LINE_WIDTH: 0.392831
G3 X132.96 Y129.806 I-1.998 J-.474 E.00697
G1 X131.021 Y131.231 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1432
G2 X132.394 Y130.394 I-1.177 J-3.474 E.05378
G1 X133.044 Y131.044 E.03052
G1 X133.044 Y132.632 E.05266
G1 X129.126 Y136.55 E.1838
G1 X130.874 Y136.55 E.05796
G1 X126.945 Y132.621 E.18431
M73 P38 R12
G1 X126.945 Y131.055 E.05194
G1 X127.601 Y130.399 E.03079
G2 X128.786 Y131.186 I2.189 J-2.01 E.04765
G1 X128.976 Y131.233 E.00648
G1 X127.029 Y129.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392831
G1 F1432
G3 X126.959 Y129.572 I1.929 J-.708 E.00697
; LINE_WIDTH: 0.359646
M73 P38 R11
G1 X126.934 Y129.436 E.00357
; LINE_WIDTH: 0.309813
G1 X126.909 Y129.3 E.00301
; LINE_WIDTH: 0.25998
G1 X126.884 Y129.164 E.00244
; LINE_WIDTH: 0.210148
G1 X126.863 Y129.052 E.00155
; LINE_WIDTH: 0.172406
G1 X126.843 Y128.94 E.0012
; LINE_WIDTH: 0.134663
G1 X126.822 Y128.828 E.00085
G1 X126.822 Y127.172 F30000
; LINE_WIDTH: 0.140709
G1 F1432
G1 X126.845 Y127.048 E.001
; LINE_WIDTH: 0.184497
G1 X126.868 Y126.924 E.00145
; LINE_WIDTH: 0.228286
G1 X126.89 Y126.8 E.0019
; LINE_WIDTH: 0.272074
G1 X126.913 Y126.676 E.00235
; LINE_WIDTH: 0.315862
G1 X126.936 Y126.552 E.0028
; LINE_WIDTH: 0.359651
G1 X126.959 Y126.428 E.00325
; LINE_WIDTH: 0.392831
G3 X127.029 Y126.194 I1.999 J.474 E.00697
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.959 Y126.428 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/103
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
G3 Z2.6 I.664 J1.02 P1  F30000
G1 X128.949 Y125.133 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1432
G1 X129.626 Y124.966 E.02313
G1 X130.363 Y124.966 E.02444
G1 X131.078 Y125.142 E.02444
G1 X131.731 Y125.485 E.02444
G1 X132.282 Y125.973 E.02444
G1 X132.701 Y126.58 E.02444
G1 X132.962 Y127.269 E.02444
G1 X133.051 Y128 E.02444
G1 X132.962 Y128.731 E.02444
G1 X132.701 Y129.42 E.02444
G1 X132.282 Y130.027 E.02444
G1 X131.731 Y130.515 E.02444
G1 X131.078 Y130.858 E.02444
G1 X130.363 Y131.034 E.02444
G1 X129.626 Y131.034 E.02444
G1 X128.911 Y130.858 E.02444
G1 X128.258 Y130.515 E.02444
G1 X127.707 Y130.027 E.02444
G1 X127.288 Y129.42 E.02444
G1 X127.027 Y128.731 E.02444
G1 X126.938 Y128 E.02444
G1 X127.027 Y127.269 E.02444
G1 X127.288 Y126.58 E.02444
G1 X127.707 Y125.973 E.02444
G1 X128.258 Y125.485 E.02444
G1 X128.893 Y125.152 E.02377
G1 X129.042 Y125.516 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1432
G1 X129.051 Y125.511 E.00029
G1 X129.674 Y125.358 E.01972
G1 X130.315 Y125.358 E.01972
G1 X130.938 Y125.511 E.01972
G1 X131.506 Y125.81 E.01972
G1 X131.987 Y126.235 E.01972
G1 X132.351 Y126.763 E.01972
G1 X132.579 Y127.363 E.01972
G1 X132.656 Y128 E.01972
G1 X132.579 Y128.637 E.01972
G1 X132.351 Y129.237 E.01972
G1 X131.987 Y129.765 E.01972
G1 X131.506 Y130.19 E.01972
G1 X130.938 Y130.489 E.01972
G1 X130.315 Y130.642 E.01972
G1 X129.674 Y130.642 E.01972
G1 X129.051 Y130.489 E.01972
G1 X128.483 Y130.19 E.01972
G1 X128.002 Y129.765 E.01972
G1 X127.638 Y129.237 E.01972
G1 X127.41 Y128.637 E.01972
G1 X127.333 Y128 E.01972
G1 X127.41 Y127.363 E.01972
G1 X127.638 Y126.763 E.01972
G1 X128.002 Y126.235 E.01972
G1 X128.483 Y125.81 E.01972
G1 X128.989 Y125.544 E.01758
M204 S10000
; WIPE_START
G1 F24000
G1 X129.051 Y125.511 E-.02638
G1 X129.674 Y125.358 E-.24382
G1 X130.315 Y125.358 E-.24382
G1 X130.938 Y125.511 E-.24382
G1 X130.943 Y125.514 E-.00216
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.007 J-.683 P1  F30000
G1 X126.597 Y119.102 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1432
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y136.898 E.59032
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y119.162 E.58833
G1 X126.205 Y118.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1432
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y137.29 E.57091
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y118.77 E.56907
M204 S10000
; WIPE_START
G1 F24000
G1 X128.204 Y118.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.207 J.155 P1  F30000
G1 X128.976 Y124.767 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1432
G2 X127.601 Y125.601 I1.156 J3.456 E.05378
G1 X126.945 Y124.945 E.03079
G1 X126.945 Y123.379 E.05194
G1 X130.874 Y119.45 E.18431
G1 X129.126 Y119.45 E.05796
G1 X133.044 Y123.368 E.1838
G1 X133.044 Y124.956 E.05266
G1 X132.394 Y125.606 E.03052
G2 X131.203 Y124.814 I-2.203 J2.019 E.04791
G1 X131.021 Y124.769 E.00623
G1 X132.96 Y126.194 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.375889
G1 F1432
G3 X133.031 Y126.428 I-1.928 J.707 E.00664
; LINE_WIDTH: 0.315862
G1 X133.053 Y126.552 E.0028
; LINE_WIDTH: 0.272074
G1 X133.076 Y126.676 E.00235
; LINE_WIDTH: 0.228285
G1 X133.099 Y126.8 E.0019
; LINE_WIDTH: 0.184497
G1 X133.121 Y126.924 E.00145
; LINE_WIDTH: 0.140708
G1 X133.144 Y127.048 E.001
; LINE_WIDTH: 0.0969201
G1 X133.167 Y127.172 E.00055
G1 X133.167 Y128.828 F30000
; LINE_WIDTH: 0.140708
G1 F1432
G1 X133.144 Y128.952 E.001
; LINE_WIDTH: 0.184497
G1 X133.121 Y129.076 E.00145
; LINE_WIDTH: 0.228285
G1 X133.099 Y129.2 E.0019
; LINE_WIDTH: 0.272073
G1 X133.076 Y129.324 E.00235
; LINE_WIDTH: 0.315861
G1 X133.053 Y129.448 E.0028
; LINE_WIDTH: 0.359649
G1 X133.031 Y129.572 E.00325
; LINE_WIDTH: 0.392831
G3 X132.96 Y129.806 I-1.998 J-.474 E.00697
G1 X131.021 Y131.231 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1432
G2 X132.394 Y130.394 I-1.177 J-3.474 E.05378
G1 X133.044 Y131.044 E.03052
G1 X133.044 Y132.632 E.05266
G1 X129.126 Y136.55 E.1838
G1 X130.874 Y136.55 E.05796
G1 X126.945 Y132.621 E.18431
G1 X126.945 Y131.055 E.05194
G1 X127.601 Y130.399 E.03079
G2 X128.786 Y131.186 I2.189 J-2.01 E.04765
G1 X128.976 Y131.233 E.00648
G1 X127.029 Y129.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392831
G1 F1432
G3 X126.959 Y129.572 I1.929 J-.708 E.00697
; LINE_WIDTH: 0.359646
G1 X126.936 Y129.448 E.00325
; LINE_WIDTH: 0.315859
M73 P39 R11
G1 X126.913 Y129.324 E.0028
; LINE_WIDTH: 0.272071
G1 X126.89 Y129.2 E.00235
; LINE_WIDTH: 0.228283
G1 X126.868 Y129.076 E.0019
; LINE_WIDTH: 0.184495
G1 X126.845 Y128.952 E.00145
; LINE_WIDTH: 0.140708
G1 X126.822 Y128.828 E.001
G1 X126.822 Y127.172 F30000
; LINE_WIDTH: 0.140709
G1 F1432
G1 X126.845 Y127.048 E.001
; LINE_WIDTH: 0.184497
G1 X126.868 Y126.924 E.00145
; LINE_WIDTH: 0.228286
G1 X126.89 Y126.8 E.0019
; LINE_WIDTH: 0.272074
G1 X126.913 Y126.676 E.00235
; LINE_WIDTH: 0.315862
G1 X126.936 Y126.552 E.0028
; LINE_WIDTH: 0.359651
G1 X126.959 Y126.428 E.00325
; LINE_WIDTH: 0.392831
G3 X127.029 Y126.194 I1.999 J.474 E.00697
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.959 Y126.428 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/103
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
G3 Z2.8 I.671 J1.015 P1  F30000
G1 X128.876 Y125.161 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1432
G1 X128.911 Y125.142 E.00131
G1 X129.626 Y124.966 E.02444
G1 X130.363 Y124.966 E.02444
G1 X131.078 Y125.142 E.02444
G1 X131.731 Y125.485 E.02444
G1 X132.282 Y125.973 E.02444
G1 X132.701 Y126.58 E.02444
G1 X132.962 Y127.269 E.02444
G1 X133.051 Y128 E.02444
G1 X132.962 Y128.731 E.02444
G1 X132.701 Y129.42 E.02444
G1 X132.282 Y130.027 E.02444
G1 X131.731 Y130.515 E.02444
G1 X131.078 Y130.858 E.02444
G1 X130.363 Y131.034 E.02444
G1 X129.626 Y131.034 E.02444
G1 X128.911 Y130.858 E.02444
G1 X128.258 Y130.515 E.02444
G1 X127.707 Y130.027 E.02444
G1 X127.288 Y129.42 E.02444
G1 X127.027 Y128.731 E.02444
G1 X126.938 Y128 E.02444
G1 X127.027 Y127.269 E.02444
G1 X127.288 Y126.58 E.02444
G1 X127.707 Y125.973 E.02444
G1 X128.258 Y125.485 E.02444
G1 X128.823 Y125.188 E.02114
G1 X129.047 Y125.514 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1432
G1 X129.051 Y125.511 E.00014
G1 X129.674 Y125.358 E.01972
G1 X130.315 Y125.358 E.01972
G1 X130.938 Y125.511 E.01972
G1 X131.506 Y125.81 E.01972
G1 X131.987 Y126.235 E.01972
G1 X132.351 Y126.763 E.01972
G1 X132.579 Y127.363 E.01972
G1 X132.656 Y128 E.01972
G1 X132.579 Y128.637 E.01972
G1 X132.351 Y129.237 E.01972
G1 X131.987 Y129.765 E.01972
G1 X131.506 Y130.19 E.01972
G1 X130.938 Y130.489 E.01972
G1 X130.315 Y130.642 E.01972
G1 X129.674 Y130.642 E.01972
G1 X129.051 Y130.489 E.01972
G1 X128.483 Y130.19 E.01972
G1 X128.002 Y129.765 E.01972
G1 X127.638 Y129.237 E.01972
G1 X127.41 Y128.637 E.01972
G1 X127.333 Y128 E.01972
G1 X127.41 Y127.363 E.01972
G1 X127.638 Y126.763 E.01972
G1 X128.002 Y126.235 E.01972
G1 X128.483 Y125.81 E.01972
G1 X128.994 Y125.541 E.01773
M204 S10000
; WIPE_START
G1 F24000
G1 X129.051 Y125.511 E-.02451
G1 X129.674 Y125.358 E-.24382
G1 X130.315 Y125.358 E-.24382
G1 X130.938 Y125.511 E-.24382
G1 X130.948 Y125.516 E-.00403
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.007 J-.683 P1  F30000
G1 X126.597 Y119.102 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1432
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y136.898 E.59032
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y119.162 E.58833
G1 X126.205 Y118.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1432
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y137.29 E.57091
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y118.77 E.56907
M204 S10000
; WIPE_START
G1 F24000
G1 X128.204 Y118.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.207 J.155 P1  F30000
G1 X128.976 Y124.767 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1432
G2 X127.601 Y125.601 I1.156 J3.456 E.05378
G1 X126.945 Y124.945 E.03079
G1 X126.945 Y123.379 E.05194
G1 X130.874 Y119.45 E.18431
G1 X129.126 Y119.45 E.05796
G1 X133.044 Y123.368 E.1838
G1 X133.044 Y124.956 E.05266
G1 X132.394 Y125.606 E.03052
G2 X131.203 Y124.814 I-2.203 J2.019 E.04791
G1 X131.021 Y124.769 E.00623
G1 X132.96 Y126.194 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.375889
G1 F1432
G3 X133.031 Y126.428 I-1.928 J.707 E.00664
; LINE_WIDTH: 0.315862
G1 X133.053 Y126.552 E.0028
; LINE_WIDTH: 0.272074
G1 X133.076 Y126.676 E.00235
; LINE_WIDTH: 0.228285
G1 X133.099 Y126.8 E.0019
; LINE_WIDTH: 0.184497
G1 X133.121 Y126.924 E.00145
; LINE_WIDTH: 0.140708
G1 X133.144 Y127.048 E.001
; LINE_WIDTH: 0.0969201
G1 X133.167 Y127.172 E.00055
G1 X133.167 Y128.828 F30000
; LINE_WIDTH: 0.140708
G1 F1432
G1 X133.144 Y128.952 E.001
; LINE_WIDTH: 0.184497
G1 X133.121 Y129.076 E.00145
; LINE_WIDTH: 0.228285
G1 X133.099 Y129.2 E.0019
; LINE_WIDTH: 0.272073
G1 X133.076 Y129.324 E.00235
; LINE_WIDTH: 0.315861
G1 X133.053 Y129.448 E.0028
; LINE_WIDTH: 0.359649
G1 X133.031 Y129.572 E.00325
; LINE_WIDTH: 0.392831
G3 X132.96 Y129.806 I-1.998 J-.474 E.00697
G1 X131.021 Y131.231 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1432
G2 X132.394 Y130.394 I-1.177 J-3.474 E.05378
G1 X133.044 Y131.044 E.03052
G1 X133.044 Y132.632 E.05266
G1 X129.126 Y136.55 E.1838
G1 X130.874 Y136.55 E.05796
G1 X126.945 Y132.621 E.18431
G1 X126.945 Y131.055 E.05194
G1 X127.601 Y130.399 E.03079
G2 X128.786 Y131.186 I2.189 J-2.01 E.04765
G1 X128.976 Y131.233 E.00648
G1 X127.029 Y129.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392831
G1 F1432
G3 X126.959 Y129.572 I1.928 J-.708 E.00697
; LINE_WIDTH: 0.359648
G1 X126.936 Y129.448 E.00325
; LINE_WIDTH: 0.31586
G1 X126.913 Y129.324 E.0028
; LINE_WIDTH: 0.272072
G1 X126.89 Y129.2 E.00235
; LINE_WIDTH: 0.228284
G1 X126.868 Y129.076 E.0019
; LINE_WIDTH: 0.184496
G1 X126.845 Y128.952 E.00145
; LINE_WIDTH: 0.140708
G1 X126.822 Y128.828 E.001
G1 X126.822 Y127.172 F30000
; LINE_WIDTH: 0.140709
G1 F1432
G1 X126.845 Y127.048 E.001
; LINE_WIDTH: 0.184497
G1 X126.868 Y126.924 E.00145
; LINE_WIDTH: 0.228286
G1 X126.89 Y126.8 E.0019
; LINE_WIDTH: 0.272074
G1 X126.913 Y126.676 E.00235
; LINE_WIDTH: 0.315862
G1 X126.936 Y126.552 E.0028
; LINE_WIDTH: 0.359651
G1 X126.959 Y126.428 E.00325
; LINE_WIDTH: 0.392831
G3 X127.029 Y126.194 I1.999 J.474 E.00697
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.959 Y126.428 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/103
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
G3 Z3 I.664 J1.02 P1  F30000
G1 X128.949 Y125.133 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1733
G1 X129.626 Y124.966 E.02313
G1 X130.363 Y124.966 E.02444
G1 X131.078 Y125.142 E.02444
G1 X131.731 Y125.485 E.02444
G1 X132.282 Y125.973 E.02444
G1 X132.701 Y126.58 E.02444
G1 X132.962 Y127.269 E.02444
G1 X133.051 Y128 E.02444
G1 X132.962 Y128.731 E.02444
G1 X132.701 Y129.42 E.02444
G1 X132.282 Y130.027 E.02444
G1 X131.731 Y130.515 E.02444
G1 X131.078 Y130.858 E.02444
G1 X130.363 Y131.034 E.02444
G1 X129.626 Y131.034 E.02444
G1 X128.911 Y130.858 E.02444
G1 X128.258 Y130.515 E.02444
G1 X127.707 Y130.027 E.02444
G1 X127.288 Y129.42 E.02444
G1 X127.027 Y128.731 E.02444
G1 X126.938 Y128 E.02444
G1 X127.027 Y127.269 E.02444
G1 X127.288 Y126.58 E.02444
G1 X127.707 Y125.973 E.02444
G1 X128.258 Y125.485 E.02444
G1 X128.893 Y125.152 E.02376
G1 X129.051 Y125.511 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1733
G1 X129.674 Y125.358 E.01972
G1 X130.315 Y125.358 E.01972
G1 X130.938 Y125.511 E.01972
G1 X131.506 Y125.81 E.01972
G1 X131.987 Y126.235 E.01972
G1 X132.351 Y126.763 E.01972
G1 X132.579 Y127.363 E.01972
G1 X132.656 Y128 E.01972
G1 X132.579 Y128.637 E.01972
G1 X132.351 Y129.237 E.01972
G1 X131.987 Y129.765 E.01972
G1 X131.506 Y130.19 E.01972
G1 X130.938 Y130.489 E.01972
G1 X130.315 Y130.642 E.01972
G1 X129.674 Y130.642 E.01972
G1 X129.051 Y130.489 E.01972
G1 X128.483 Y130.19 E.01972
G1 X128.002 Y129.765 E.01972
G1 X127.638 Y129.237 E.01972
G1 X127.41 Y128.637 E.01972
G1 X127.333 Y128 E.01972
G1 X127.41 Y127.363 E.01972
G1 X127.638 Y126.763 E.01972
G1 X128.002 Y126.235 E.01972
G1 X128.483 Y125.81 E.01972
G1 X128.998 Y125.539 E.01787
M204 S10000
; WIPE_START
G1 F24000
G1 X129.674 Y125.358 E-.26601
G1 X130.315 Y125.358 E-.24382
G1 X130.938 Y125.511 E-.24382
G1 X130.953 Y125.519 E-.00635
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.007 J-.684 P1  F30000
G1 X126.597 Y119.102 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1733
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y136.898 E.59032
M73 P40 R11
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y119.162 E.58833
G1 X126.205 Y118.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1733
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y137.29 E.57091
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y118.77 E.56907
M204 S10000
; WIPE_START
G1 F24000
G1 X128.204 Y118.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.122 J-.472 P1  F30000
G1 X126.945 Y121.751 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1733
G1 X126.945 Y121.909 E.00524
G1 X128.415 Y121.909 E.04878
G1 X130.874 Y119.45 E.11533
G1 X129.126 Y119.45 E.05796
G1 X131.585 Y121.909 E.11533
G1 X133.044 Y121.909 E.04842
G1 X133.044 Y121.74 E.0056
G1 X133.167 Y127.172 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969201
G1 F1733
G1 X133.144 Y127.048 E.00055
; LINE_WIDTH: 0.140708
G1 X133.121 Y126.924 E.001
; LINE_WIDTH: 0.184497
G1 X133.099 Y126.8 E.00145
; LINE_WIDTH: 0.228285
G1 X133.076 Y126.676 E.0019
; LINE_WIDTH: 0.272074
G1 X133.053 Y126.552 E.00235
; LINE_WIDTH: 0.315862
G1 X133.031 Y126.428 E.0028
; LINE_WIDTH: 0.375889
G2 X132.96 Y126.194 I-1.998 J.473 E.00664
G1 X133.044 Y125.781 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1733
G1 X131.203 Y124.814 E.06898
G2 X128.786 Y124.814 I-1.208 J3.615 E.08157
G1 X126.945 Y125.781 E.06898
G1 X126.945 Y122.316 E.11493
G1 X133.044 Y122.316 E.20233
G1 X133.044 Y125.721 E.11294
G1 X132.637 Y124.589 F30000
G1 F1733
G1 X132.637 Y122.961 E.05401
G1 X132.399 Y122.723 E.01118
G1 X127.601 Y122.723 E.15915
G1 X127.352 Y122.972 E.01169
G1 X127.352 Y124.6 E.05401
G1 X127.029 Y126.194 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392831
G1 F1733
G2 X126.959 Y126.428 I1.929 J.708 E.00697
; LINE_WIDTH: 0.359651
G1 X126.936 Y126.552 E.00325
; LINE_WIDTH: 0.315862
G1 X126.913 Y126.676 E.0028
; LINE_WIDTH: 0.272074
G1 X126.89 Y126.8 E.00235
; LINE_WIDTH: 0.228286
G1 X126.868 Y126.924 E.0019
; LINE_WIDTH: 0.184497
G1 X126.845 Y127.048 E.00145
; LINE_WIDTH: 0.140709
G1 X126.822 Y127.172 E.001
G1 X126.822 Y128.828 F30000
; LINE_WIDTH: 0.140708
G1 F1733
G1 X126.845 Y128.952 E.001
; LINE_WIDTH: 0.184495
G1 X126.868 Y129.076 E.00145
; LINE_WIDTH: 0.228283
G1 X126.89 Y129.2 E.0019
; LINE_WIDTH: 0.272071
G1 X126.913 Y129.324 E.00235
; LINE_WIDTH: 0.315859
G1 X126.936 Y129.448 E.0028
; LINE_WIDTH: 0.359646
G1 X126.959 Y129.572 E.00325
; LINE_WIDTH: 0.392831
G2 X127.029 Y129.806 I1.999 J-.474 E.00697
G1 X127.352 Y131.4 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1733
G1 X127.352 Y133.028 E.05401
G1 X127.721 Y133.397 E.01732
G1 X132.279 Y133.397 E.15119
G1 X132.637 Y133.039 E.01681
G1 X132.637 Y131.411 E.05401
G1 X132.96 Y129.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392831
G1 F1733
G2 X133.031 Y129.572 I-1.928 J-.708 E.00697
; LINE_WIDTH: 0.359649
G1 X133.053 Y129.448 E.00325
; LINE_WIDTH: 0.315861
G1 X133.076 Y129.324 E.0028
; LINE_WIDTH: 0.272073
G1 X133.099 Y129.2 E.00235
; LINE_WIDTH: 0.228285
G1 X133.121 Y129.076 E.0019
; LINE_WIDTH: 0.184497
G1 X133.144 Y128.952 E.00145
; LINE_WIDTH: 0.140708
G1 X133.167 Y128.828 E.001
G1 X133.044 Y133.744 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1733
G1 X133.044 Y130.219 E.11692
G1 X131.908 Y130.816 E.04256
G3 X128.081 Y130.816 I-1.914 J-2.975 E.13415
G1 X126.945 Y130.219 E.04256
G1 X126.945 Y133.804 E.11891
G1 X133.044 Y133.804 E.20233
G1 X133.044 Y134.26 F30000
G1 F1733
G1 X133.044 Y134.211 E.00162
G1 X131.465 Y134.211 E.0524
G1 X129.126 Y136.55 E.1097
G1 X130.874 Y136.55 E.05796
G1 X128.535 Y134.211 E.1097
G1 X126.945 Y134.249 E.05277
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.535 Y134.211 E-.60455
G1 X128.825 Y134.501 E-.15545
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/103
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
G3 Z3.2 I1.217 J.007 P1  F30000
G1 X128.876 Y125.16 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1737
G1 X128.911 Y125.142 E.00131
G1 X129.626 Y124.966 E.02444
G1 X130.363 Y124.966 E.02444
G1 X131.078 Y125.142 E.02444
G1 X131.731 Y125.485 E.02444
G1 X132.282 Y125.973 E.02444
G1 X132.701 Y126.58 E.02444
G1 X132.962 Y127.269 E.02444
G1 X133.051 Y128 E.02444
G1 X132.962 Y128.731 E.02444
G1 X132.701 Y129.42 E.02444
G1 X132.282 Y130.027 E.02444
G1 X131.731 Y130.515 E.02444
G1 X131.078 Y130.858 E.02444
G1 X130.363 Y131.034 E.02444
G1 X129.626 Y131.034 E.02444
G1 X128.911 Y130.858 E.02444
G1 X128.258 Y130.515 E.02444
G1 X127.707 Y130.027 E.02444
G1 X127.288 Y129.42 E.02444
G1 X127.027 Y128.731 E.02444
G1 X126.938 Y128 E.02444
G1 X127.027 Y127.269 E.02444
G1 X127.288 Y126.58 E.02444
G1 X127.707 Y125.973 E.02444
G1 X128.258 Y125.485 E.02444
G1 X128.823 Y125.188 E.02114
G1 X129.056 Y125.51 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1737
G1 X129.674 Y125.358 E.01954
G1 X130.315 Y125.358 E.01972
G1 X130.938 Y125.511 E.01972
G1 X131.506 Y125.81 E.01972
G1 X131.987 Y126.235 E.01972
G1 X132.351 Y126.763 E.01972
G1 X132.579 Y127.363 E.01972
G1 X132.656 Y128 E.01972
G1 X132.579 Y128.637 E.01972
G1 X132.351 Y129.237 E.01972
G1 X131.987 Y129.765 E.01972
G1 X131.506 Y130.19 E.01972
G1 X130.938 Y130.489 E.01972
G1 X130.315 Y130.642 E.01972
G1 X129.674 Y130.642 E.01972
G1 X129.051 Y130.489 E.01972
G1 X128.483 Y130.19 E.01972
G1 X128.002 Y129.765 E.01972
G1 X127.638 Y129.237 E.01972
G1 X127.41 Y128.637 E.01972
G1 X127.333 Y128 E.01972
G1 X127.41 Y127.363 E.01972
G1 X127.638 Y126.763 E.01972
G1 X128.002 Y126.235 E.01972
G1 X128.483 Y125.81 E.01972
G1 X129.003 Y125.537 E.01804
M204 S10000
; WIPE_START
G1 F24000
G1 X129.674 Y125.358 E-.26394
G1 X130.315 Y125.358 E-.24382
G1 X130.938 Y125.511 E-.24382
G1 X130.958 Y125.522 E-.00842
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.007 J-.684 P1  F30000
G1 X126.597 Y119.102 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1737
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y136.898 E.59032
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y119.162 E.58833
G1 X126.205 Y118.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1737
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y137.29 E.57091
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y118.77 E.56907
M204 S10000
; WIPE_START
G1 F24000
G1 X128.204 Y118.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.122 J-.472 P1  F30000
G1 X126.945 Y121.751 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1737
G1 X126.945 Y121.909 E.00524
G1 X128.415 Y121.909 E.04878
G1 X130.874 Y119.45 E.11533
G1 X129.126 Y119.45 E.05796
G1 X131.585 Y121.909 E.11533
G1 X133.044 Y121.909 E.04842
G1 X133.044 Y121.74 E.0056
G1 X133.167 Y127.172 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969201
G1 F1737
G1 X133.144 Y127.048 E.00055
; LINE_WIDTH: 0.140708
G1 X133.121 Y126.924 E.001
; LINE_WIDTH: 0.184497
G1 X133.099 Y126.8 E.00145
; LINE_WIDTH: 0.228285
G1 X133.076 Y126.676 E.0019
; LINE_WIDTH: 0.272074
G1 X133.053 Y126.552 E.00235
; LINE_WIDTH: 0.315862
G1 X133.031 Y126.428 E.0028
; LINE_WIDTH: 0.375889
G2 X132.96 Y126.194 I-1.998 J.473 E.00664
G1 X133.044 Y125.781 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1737
G1 X131.203 Y124.814 E.06898
G2 X128.786 Y124.814 I-1.208 J3.615 E.08157
G1 X126.945 Y125.781 E.06898
G1 X126.945 Y122.316 E.11493
G1 X133.044 Y122.316 E.20233
G1 X133.044 Y125.721 E.11294
G1 X132.637 Y124.589 F30000
G1 F1737
G1 X132.637 Y122.961 E.05401
G1 X132.399 Y122.723 E.01118
G1 X127.601 Y122.723 E.15915
G1 X127.352 Y122.972 E.01169
G1 X127.352 Y124.6 E.05401
G1 X127.029 Y126.194 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392831
G1 F1737
G2 X126.959 Y126.428 I1.929 J.708 E.00697
; LINE_WIDTH: 0.359651
G1 X126.936 Y126.552 E.00325
; LINE_WIDTH: 0.315862
G1 X126.913 Y126.676 E.0028
; LINE_WIDTH: 0.272074
G1 X126.89 Y126.8 E.00235
; LINE_WIDTH: 0.228286
G1 X126.868 Y126.924 E.0019
; LINE_WIDTH: 0.184497
G1 X126.845 Y127.048 E.00145
; LINE_WIDTH: 0.140709
G1 X126.822 Y127.172 E.001
G1 X126.822 Y128.828 F30000
; LINE_WIDTH: 0.140709
M73 P41 R11
G1 F1737
G1 X126.845 Y128.952 E.001
; LINE_WIDTH: 0.184497
G1 X126.868 Y129.076 E.00145
; LINE_WIDTH: 0.228285
G1 X126.89 Y129.2 E.0019
; LINE_WIDTH: 0.272074
G1 X126.913 Y129.324 E.00235
; LINE_WIDTH: 0.315862
G1 X126.936 Y129.448 E.0028
; LINE_WIDTH: 0.35965
G1 X126.959 Y129.572 E.00325
; LINE_WIDTH: 0.392831
G2 X127.029 Y129.806 I1.999 J-.474 E.00697
G1 X127.352 Y131.4 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1737
G1 X127.352 Y133.028 E.05401
G1 X127.721 Y133.397 E.01732
G1 X132.279 Y133.397 E.15119
G1 X132.637 Y133.039 E.01681
G1 X132.637 Y131.411 E.05401
G1 X132.96 Y129.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392831
G1 F1737
G2 X133.031 Y129.572 I-1.928 J-.708 E.00697
; LINE_WIDTH: 0.359649
G1 X133.053 Y129.448 E.00325
; LINE_WIDTH: 0.315861
G1 X133.076 Y129.324 E.0028
; LINE_WIDTH: 0.272073
G1 X133.099 Y129.2 E.00235
; LINE_WIDTH: 0.228285
G1 X133.121 Y129.076 E.0019
; LINE_WIDTH: 0.184497
G1 X133.144 Y128.952 E.00145
; LINE_WIDTH: 0.140708
G1 X133.167 Y128.828 E.001
G1 X133.044 Y133.744 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1737
G1 X133.044 Y130.219 E.11692
G1 X131.908 Y130.816 E.04256
G3 X128.081 Y130.816 I-1.914 J-2.975 E.13415
G1 X126.945 Y130.219 E.04256
G1 X126.945 Y133.804 E.11891
G1 X133.044 Y133.804 E.20233
G1 X133.044 Y134.26 F30000
G1 F1737
G1 X133.044 Y134.211 E.00162
G1 X131.465 Y134.211 E.0524
G1 X129.126 Y136.55 E.1097
G1 X130.874 Y136.55 E.05796
G1 X128.535 Y134.211 E.1097
G1 X126.945 Y134.249 E.05277
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.535 Y134.211 E-.60455
G1 X128.825 Y134.501 E-.15545
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/103
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
G3 Z3.4 I1.217 J.016 P1  F30000
G1 X128.949 Y125.133 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1737
G1 X129.626 Y124.966 E.02313
G1 X130.363 Y124.966 E.02444
G1 X131.078 Y125.142 E.02444
G1 X131.731 Y125.485 E.02444
G1 X132.282 Y125.973 E.02444
G1 X132.701 Y126.58 E.02444
G1 X132.962 Y127.269 E.02444
G1 X133.051 Y128 E.02444
G1 X132.962 Y128.731 E.02444
G1 X132.701 Y129.42 E.02444
G1 X132.282 Y130.027 E.02444
G1 X131.731 Y130.515 E.02444
G1 X131.078 Y130.858 E.02444
G1 X130.363 Y131.034 E.02444
G1 X129.626 Y131.034 E.02444
G1 X128.911 Y130.858 E.02444
G1 X128.258 Y130.515 E.02444
G1 X127.707 Y130.027 E.02444
G1 X127.288 Y129.42 E.02444
G1 X127.027 Y128.731 E.02444
G1 X126.938 Y128 E.02444
G1 X127.027 Y127.269 E.02444
G1 X127.288 Y126.58 E.02444
G1 X127.707 Y125.973 E.02444
G1 X128.258 Y125.485 E.02444
G1 X128.892 Y125.152 E.02376
G1 X129.061 Y125.509 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1737
G1 X129.674 Y125.358 E.01939
G1 X130.315 Y125.358 E.01972
G1 X130.938 Y125.511 E.01972
G1 X131.506 Y125.81 E.01972
G1 X131.987 Y126.235 E.01972
G1 X132.351 Y126.763 E.01972
G1 X132.579 Y127.363 E.01972
G1 X132.656 Y128 E.01972
G1 X132.579 Y128.637 E.01972
G1 X132.351 Y129.237 E.01972
G1 X131.987 Y129.765 E.01972
G1 X131.506 Y130.19 E.01972
G1 X130.938 Y130.489 E.01972
G1 X130.315 Y130.642 E.01972
G1 X129.674 Y130.642 E.01972
G1 X129.051 Y130.489 E.01972
G1 X128.483 Y130.19 E.01972
G1 X128.002 Y129.765 E.01972
G1 X127.638 Y129.237 E.01972
G1 X127.41 Y128.637 E.01972
G1 X127.333 Y128 E.01972
G1 X127.41 Y127.363 E.01972
G1 X127.638 Y126.763 E.01972
G1 X128.002 Y126.235 E.01972
G1 X128.483 Y125.81 E.01972
G1 X129.007 Y125.534 E.0182
M204 S10000
; WIPE_START
G1 F24000
G1 X129.674 Y125.358 E-.26207
G1 X130.315 Y125.358 E-.24382
G1 X130.938 Y125.511 E-.24382
G1 X130.962 Y125.524 E-.0103
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I1.006 J-.684 P1  F30000
G1 X126.597 Y119.102 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1737
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y136.898 E.59032
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y119.162 E.58833
G1 X126.205 Y118.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1737
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y137.29 E.57091
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y118.77 E.56907
M204 S10000
; WIPE_START
G1 F24000
G1 X128.204 Y118.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I-1.122 J-.472 P1  F30000
G1 X126.945 Y121.751 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1737
G1 X126.945 Y121.909 E.00524
G1 X128.415 Y121.909 E.04878
G1 X130.874 Y119.45 E.11533
G1 X129.126 Y119.45 E.05796
G1 X131.585 Y121.909 E.11533
G1 X133.044 Y121.909 E.04842
G1 X133.044 Y121.74 E.0056
G1 X133.167 Y127.172 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969201
G1 F1737
G1 X133.144 Y127.048 E.00055
; LINE_WIDTH: 0.140708
G1 X133.121 Y126.924 E.001
; LINE_WIDTH: 0.184497
G1 X133.099 Y126.8 E.00145
; LINE_WIDTH: 0.228285
G1 X133.076 Y126.676 E.0019
; LINE_WIDTH: 0.272074
G1 X133.053 Y126.552 E.00235
; LINE_WIDTH: 0.315862
G1 X133.031 Y126.428 E.0028
; LINE_WIDTH: 0.375889
G2 X132.96 Y126.194 I-1.998 J.473 E.00664
G1 X133.044 Y125.781 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1737
G1 X131.861 Y125.159 E.04434
G2 X128.786 Y124.814 I-1.888 J2.946 E.1063
G1 X126.945 Y125.781 E.06898
G1 X126.945 Y122.316 E.11493
G1 X133.044 Y122.316 E.20233
G1 X133.044 Y125.721 E.11294
G1 X132.637 Y124.589 F30000
G1 F1737
G1 X132.637 Y122.961 E.05401
G1 X132.399 Y122.723 E.01118
G1 X127.601 Y122.723 E.15915
G1 X127.352 Y122.972 E.01169
G1 X127.352 Y124.6 E.05401
G1 X127.029 Y126.194 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392831
G1 F1737
G2 X126.959 Y126.428 I1.929 J.708 E.00697
; LINE_WIDTH: 0.359651
G1 X126.936 Y126.552 E.00325
; LINE_WIDTH: 0.315862
G1 X126.913 Y126.676 E.0028
; LINE_WIDTH: 0.272074
G1 X126.89 Y126.8 E.00235
; LINE_WIDTH: 0.228286
G1 X126.868 Y126.924 E.0019
; LINE_WIDTH: 0.184497
G1 X126.845 Y127.048 E.00145
; LINE_WIDTH: 0.140709
G1 X126.822 Y127.172 E.001
G1 X126.822 Y128.828 F30000
; LINE_WIDTH: 0.140708
G1 F1737
G1 X126.845 Y128.952 E.001
; LINE_WIDTH: 0.184497
G1 X126.868 Y129.076 E.00145
; LINE_WIDTH: 0.228285
G1 X126.89 Y129.2 E.0019
; LINE_WIDTH: 0.272074
G1 X126.913 Y129.324 E.00235
; LINE_WIDTH: 0.315862
G1 X126.936 Y129.448 E.0028
; LINE_WIDTH: 0.35965
G1 X126.959 Y129.572 E.00325
; LINE_WIDTH: 0.392831
G2 X127.029 Y129.806 I1.999 J-.474 E.00697
G1 X127.352 Y131.4 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1737
G1 X127.352 Y133.028 E.05401
G1 X127.721 Y133.397 E.01732
G1 X132.279 Y133.397 E.15119
G1 X132.637 Y133.039 E.01681
G1 X132.637 Y131.411 E.05401
G1 X132.96 Y129.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392831
G1 F1737
G2 X133.031 Y129.572 I-1.928 J-.708 E.00697
; LINE_WIDTH: 0.359649
G1 X133.053 Y129.448 E.00325
; LINE_WIDTH: 0.315861
G1 X133.076 Y129.324 E.0028
; LINE_WIDTH: 0.272073
G1 X133.099 Y129.2 E.00235
; LINE_WIDTH: 0.228285
G1 X133.121 Y129.076 E.0019
; LINE_WIDTH: 0.184497
G1 X133.144 Y128.952 E.00145
; LINE_WIDTH: 0.140708
G1 X133.167 Y128.828 E.001
G1 X133.044 Y133.744 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1737
G1 X133.044 Y130.219 E.11692
G1 X131.908 Y130.816 E.04256
G3 X128.081 Y130.816 I-1.914 J-2.975 E.13415
G1 X126.945 Y130.219 E.04256
G1 X126.945 Y133.804 E.11891
G1 X133.044 Y133.804 E.20233
G1 X133.044 Y134.26 F30000
G1 F1737
G1 X133.044 Y134.211 E.00162
M73 P42 R11
G1 X131.465 Y134.211 E.0524
G1 X129.126 Y136.55 E.1097
G1 X130.874 Y136.55 E.05796
G1 X128.535 Y134.211 E.1097
G1 X126.945 Y134.249 E.05277
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.535 Y134.211 E-.60455
G1 X128.825 Y134.501 E-.15545
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/103
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
G3 Z3.6 I1.217 J.007 P1  F30000
G1 X128.876 Y125.16 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1737
G1 X128.911 Y125.142 E.00131
G1 X129.626 Y124.966 E.02444
G1 X130.363 Y124.966 E.02444
G1 X131.078 Y125.142 E.02444
G1 X131.731 Y125.485 E.02444
G1 X132.282 Y125.973 E.02444
G1 X132.701 Y126.58 E.02444
G1 X132.962 Y127.269 E.02444
G1 X133.051 Y128 E.02444
G1 X132.962 Y128.731 E.02444
G1 X132.701 Y129.42 E.02444
G1 X132.282 Y130.027 E.02444
G1 X131.731 Y130.515 E.02444
G1 X131.078 Y130.858 E.02444
G1 X130.363 Y131.034 E.02444
G1 X129.626 Y131.034 E.02444
G1 X128.911 Y130.858 E.02444
G1 X128.258 Y130.515 E.02444
G1 X127.707 Y130.027 E.02444
G1 X127.288 Y129.42 E.02444
G1 X127.027 Y128.731 E.02444
G1 X126.938 Y128 E.02444
G1 X127.027 Y127.269 E.02444
G1 X127.288 Y126.58 E.02444
G1 X127.707 Y125.973 E.02444
G1 X128.258 Y125.485 E.02444
G1 X128.823 Y125.188 E.02115
G1 X129.066 Y125.508 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1737
G1 X129.674 Y125.358 E.01924
G1 X130.315 Y125.358 E.01972
G1 X130.938 Y125.511 E.01972
G1 X131.506 Y125.81 E.01972
G1 X131.987 Y126.235 E.01972
G1 X132.351 Y126.763 E.01972
G1 X132.579 Y127.363 E.01972
G1 X132.656 Y128 E.01972
G1 X132.579 Y128.637 E.01972
G1 X132.351 Y129.237 E.01972
G1 X131.987 Y129.765 E.01972
G1 X131.506 Y130.19 E.01972
G1 X130.938 Y130.489 E.01972
G1 X130.315 Y130.642 E.01972
G1 X129.674 Y130.642 E.01972
G1 X129.051 Y130.489 E.01972
G1 X128.483 Y130.19 E.01972
G1 X128.002 Y129.765 E.01972
G1 X127.638 Y129.237 E.01972
G1 X127.41 Y128.637 E.01972
G1 X127.333 Y128 E.01972
G1 X127.41 Y127.363 E.01972
G1 X127.638 Y126.763 E.01972
G1 X128.002 Y126.235 E.01972
G1 X128.483 Y125.81 E.01972
G1 X129.011 Y125.532 E.01835
M204 S10000
; WIPE_START
G1 F24000
G1 X129.674 Y125.358 E-.26028
G1 X130.315 Y125.358 E-.24382
G1 X130.938 Y125.511 E-.24382
G1 X130.966 Y125.526 E-.01209
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I1.006 J-.684 P1  F30000
G1 X126.597 Y119.102 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1737
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y136.898 E.59032
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y119.162 E.58833
G1 X126.205 Y118.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1737
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y137.29 E.57091
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y118.77 E.56907
M204 S10000
; WIPE_START
G1 F24000
G1 X128.204 Y118.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I-1.122 J-.472 P1  F30000
G1 X126.945 Y121.751 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1737
G1 X126.945 Y121.909 E.00524
G1 X128.415 Y121.909 E.04878
G1 X130.874 Y119.45 E.11533
G1 X129.126 Y119.45 E.05796
G1 X131.585 Y121.909 E.11533
G1 X133.044 Y121.909 E.04842
G1 X133.044 Y121.74 E.0056
G1 X133.167 Y127.172 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.0969201
G1 F1737
G1 X133.144 Y127.048 E.00055
; LINE_WIDTH: 0.140708
G1 X133.121 Y126.924 E.001
; LINE_WIDTH: 0.184497
G1 X133.099 Y126.8 E.00145
; LINE_WIDTH: 0.228285
G1 X133.076 Y126.676 E.0019
; LINE_WIDTH: 0.272074
G1 X133.053 Y126.552 E.00235
; LINE_WIDTH: 0.315862
G1 X133.031 Y126.428 E.0028
; LINE_WIDTH: 0.375889
G2 X132.96 Y126.194 I-1.998 J.473 E.00664
G1 X133.044 Y125.781 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1737
G1 X131.203 Y124.814 E.06898
G2 X128.786 Y124.814 I-1.208 J3.615 E.08157
G1 X126.945 Y125.781 E.06898
G1 X126.945 Y122.316 E.11493
G1 X133.044 Y122.316 E.20233
G1 X133.044 Y125.721 E.11294
G1 X132.637 Y124.589 F30000
G1 F1737
G1 X132.637 Y122.961 E.05401
G1 X132.399 Y122.723 E.01118
G1 X127.601 Y122.723 E.15915
G1 X127.352 Y122.972 E.01169
G1 X127.352 Y124.6 E.05401
G1 X127.029 Y126.194 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392831
G1 F1737
G2 X126.959 Y126.428 I1.929 J.708 E.00697
; LINE_WIDTH: 0.359651
G1 X126.936 Y126.552 E.00325
; LINE_WIDTH: 0.315862
G1 X126.913 Y126.676 E.0028
; LINE_WIDTH: 0.272074
G1 X126.89 Y126.8 E.00235
; LINE_WIDTH: 0.228286
G1 X126.868 Y126.924 E.0019
; LINE_WIDTH: 0.184497
G1 X126.845 Y127.048 E.00145
; LINE_WIDTH: 0.140709
G1 X126.822 Y127.172 E.001
G1 X126.822 Y128.828 F30000
; LINE_WIDTH: 0.140708
G1 F1737
G1 X126.845 Y128.952 E.001
; LINE_WIDTH: 0.184497
G1 X126.868 Y129.076 E.00145
; LINE_WIDTH: 0.228285
G1 X126.89 Y129.2 E.0019
; LINE_WIDTH: 0.272074
G1 X126.913 Y129.324 E.00235
; LINE_WIDTH: 0.315862
G1 X126.936 Y129.448 E.0028
; LINE_WIDTH: 0.35965
G1 X126.959 Y129.572 E.00325
; LINE_WIDTH: 0.392831
G2 X127.029 Y129.806 I1.999 J-.474 E.00697
G1 X127.352 Y131.4 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1737
G1 X127.352 Y133.028 E.05401
G1 X127.721 Y133.397 E.01732
G1 X132.279 Y133.397 E.15119
G1 X132.637 Y133.039 E.01681
G1 X132.637 Y131.411 E.05401
G1 X132.96 Y129.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392831
G1 F1737
G2 X133.031 Y129.572 I-1.928 J-.708 E.00697
; LINE_WIDTH: 0.359649
G1 X133.053 Y129.448 E.00325
; LINE_WIDTH: 0.315861
G1 X133.076 Y129.324 E.0028
; LINE_WIDTH: 0.272073
G1 X133.099 Y129.2 E.00235
; LINE_WIDTH: 0.228285
G1 X133.121 Y129.076 E.0019
; LINE_WIDTH: 0.184497
G1 X133.144 Y128.952 E.00145
; LINE_WIDTH: 0.140708
G1 X133.167 Y128.828 E.001
G1 X133.044 Y133.744 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1737
G1 X133.044 Y130.219 E.11692
G1 X131.908 Y130.816 E.04256
G3 X128.081 Y130.816 I-1.914 J-2.798 E.13491
G1 X126.945 Y130.219 E.04256
G1 X126.945 Y133.804 E.11891
G1 X133.044 Y133.804 E.20233
G1 X133.044 Y134.26 F30000
G1 F1737
G1 X133.044 Y134.211 E.00162
G1 X131.465 Y134.211 E.0524
G1 X129.126 Y136.55 E.1097
G1 X130.874 Y136.55 E.05796
G1 X128.535 Y134.211 E.1097
G1 X126.945 Y134.249 E.05277
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X128.535 Y134.211 E-.60455
G1 X128.825 Y134.501 E-.15545
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/103
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
G3 Z3.8 I1.217 J.007 P1  F30000
G1 X128.876 Y125.16 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1665
G1 X128.911 Y125.142 E.00131
G1 X129.626 Y124.966 E.02444
G1 X130.363 Y124.966 E.02444
G1 X131.078 Y125.142 E.02444
G1 X131.731 Y125.485 E.02444
G1 X132.282 Y125.973 E.02444
G1 X132.701 Y126.58 E.02444
G1 X132.962 Y127.269 E.02444
G1 X133.051 Y128 E.02444
G1 X132.962 Y128.731 E.02444
G1 X132.701 Y129.42 E.02444
G1 X132.282 Y130.027 E.02444
G1 X131.731 Y130.515 E.02444
G1 X131.078 Y130.858 E.02444
G1 X130.363 Y131.034 E.02444
G1 X129.626 Y131.034 E.02444
G1 X128.911 Y130.858 E.02444
G1 X128.258 Y130.515 E.02444
G1 X127.707 Y130.027 E.02444
G1 X127.288 Y129.42 E.02444
G1 X127.027 Y128.731 E.02444
G1 X126.938 Y128 E.02444
G1 X127.027 Y127.269 E.02444
G1 X127.288 Y126.58 E.02444
G1 X127.707 Y125.973 E.02444
G1 X128.258 Y125.485 E.02444
G1 X128.823 Y125.188 E.02115
G1 X129.07 Y125.507 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1665
G1 X129.674 Y125.358 E.0191
G1 X130.315 Y125.358 E.01972
G1 X130.938 Y125.511 E.01972
G1 X131.506 Y125.81 E.01972
G1 X131.987 Y126.235 E.01972
G1 X132.351 Y126.763 E.01972
G1 X132.579 Y127.363 E.01972
G1 X132.656 Y128 E.01972
G1 X132.579 Y128.637 E.01972
G1 X132.351 Y129.237 E.01972
G1 X131.987 Y129.765 E.01972
G1 X131.506 Y130.19 E.01972
G1 X130.938 Y130.489 E.01972
G1 X130.315 Y130.642 E.01972
G1 X129.674 Y130.642 E.01972
G1 X129.051 Y130.489 E.01972
G1 X128.483 Y130.19 E.01972
G1 X128.002 Y129.765 E.01972
G1 X127.638 Y129.237 E.01972
G1 X127.41 Y128.637 E.01972
G1 X127.333 Y128 E.01972
G1 X127.41 Y127.363 E.01972
G1 X127.638 Y126.763 E.01972
G1 X128.002 Y126.235 E.01972
G1 X128.483 Y125.81 E.01972
G1 X129.015 Y125.53 E.01849
M204 S10000
; WIPE_START
G1 F24000
G1 X129.674 Y125.358 E-.25859
G1 X130.315 Y125.358 E-.24382
G1 X130.938 Y125.511 E-.24382
G1 X130.97 Y125.528 E-.01377
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I1.006 J-.685 P1  F30000
G1 X126.597 Y119.102 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1665
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y136.898 E.59032
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y119.162 E.58833
G1 X126.205 Y118.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1665
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y137.29 E.57091
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y118.77 E.56907
M204 S10000
; WIPE_START
G1 F24000
G1 X128.204 Y118.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I-1.122 J-.472 P1  F30000
G1 X126.945 Y121.751 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1665
G1 X126.945 Y121.909 E.00524
M73 P43 R11
G1 X128.415 Y121.909 E.04878
G1 X130.874 Y119.45 E.11533
G1 X129.126 Y119.45 E.05796
G1 X131.585 Y121.909 E.11533
G1 X133.044 Y121.909 E.04842
G1 X133.044 Y121.74 E.0056
G1 X133.225 Y122.356 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.437737
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X126.966 Y122.356 E.38377
G1 X126.966 Y122.844 E.02991
G1 X133.023 Y122.844 E.37136
G1 X133.023 Y123.332 E.02991
G1 X126.966 Y123.332 E.37136
G1 X126.966 Y123.819 E.02991
G1 X133.023 Y123.819 E.37136
G1 X133.023 Y124.307 E.02991
G1 X126.966 Y124.307 E.37136
G1 X126.966 Y124.795 E.02991
G1 X133.023 Y124.795 E.37136
G1 X133.023 Y125.283 E.02991
G1 X131.706 Y125.283 E.08075
M106 S252.45
G1 X132.681 Y125.91 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F1665
G1 X132.617 Y125.947 E.00204
G1 X132.666 Y125.975 E.00155
G1 X132.96 Y126.194 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.375889
G1 F1665
G3 X133.031 Y126.428 I-1.928 J.707 E.00664
; LINE_WIDTH: 0.315862
G1 X133.053 Y126.552 E.0028
; LINE_WIDTH: 0.272074
G1 X133.076 Y126.676 E.00235
; LINE_WIDTH: 0.228285
G1 X133.099 Y126.8 E.0019
; LINE_WIDTH: 0.184497
G1 X133.121 Y126.924 E.00145
; LINE_WIDTH: 0.140708
G1 X133.144 Y127.048 E.001
; LINE_WIDTH: 0.0969201
G1 X133.167 Y127.172 E.00055
G1 X133.167 Y128.828 F30000
; LINE_WIDTH: 0.140708
G1 F1665
G1 X133.144 Y128.952 E.001
; LINE_WIDTH: 0.184497
G1 X133.121 Y129.076 E.00145
; LINE_WIDTH: 0.228285
G1 X133.099 Y129.2 E.0019
; LINE_WIDTH: 0.272073
G1 X133.076 Y129.324 E.00235
; LINE_WIDTH: 0.315861
G1 X133.053 Y129.448 E.0028
; LINE_WIDTH: 0.359649
G1 X133.031 Y129.572 E.00325
; LINE_WIDTH: 0.392831
G3 X132.96 Y129.806 I-1.998 J-.474 E.00697
M73 P43 R10
G1 X132.672 Y130.017 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F1665
G1 X132.608 Y130.054 E.00204
G1 X132.657 Y130.082 E.00155
G1 X133.225 Y130.74 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.452737
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X131.663 Y130.74 E.10249
M106 S252.45
G1 X128.326 Y130.74 F30000
M106 S255
G1 F3000
G1 X126.966 Y130.74 E.0892
G1 X126.966 Y131.243 E.03297
G1 X133.023 Y131.243 E.39724
G1 X133.023 Y131.746 E.03297
G1 X126.966 Y131.746 E.39724
G1 X126.966 Y132.248 E.03297
G1 X133.023 Y132.248 E.39724
G1 X133.023 Y132.751 E.03297
G1 X126.966 Y132.751 E.39724
G1 X126.966 Y133.254 E.03297
G1 X133.023 Y133.254 E.39724
G1 X133.023 Y133.756 E.03297
G1 X126.764 Y133.756 E.41053
M106 S252.45
G1 X126.945 Y134.249 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1665
G1 X128.535 Y134.211 E.05277
G1 X130.874 Y136.55 E.1097
G1 X129.126 Y136.55 E.05796
G1 X131.465 Y134.211 E.1097
G1 X133.044 Y134.211 E.0524
G1 X133.044 Y134.26 E.00162
G1 X127.351 Y130.017 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F1665
G1 X127.287 Y130.053 E.00204
G1 X127.335 Y130.081 E.00155
G1 X127.029 Y129.806 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.392831
G1 F1665
G3 X126.959 Y129.572 I1.929 J-.708 E.00697
; LINE_WIDTH: 0.35965
G1 X126.936 Y129.448 E.00325
; LINE_WIDTH: 0.315862
G1 X126.913 Y129.324 E.0028
; LINE_WIDTH: 0.272074
G1 X126.89 Y129.2 E.00235
; LINE_WIDTH: 0.228285
G1 X126.868 Y129.076 E.0019
; LINE_WIDTH: 0.184497
G1 X126.845 Y128.952 E.00145
; LINE_WIDTH: 0.140709
G1 X126.822 Y128.828 E.001
G1 X126.822 Y127.172 F30000
; LINE_WIDTH: 0.140709
G1 F1665
G1 X126.845 Y127.048 E.001
; LINE_WIDTH: 0.184497
G1 X126.868 Y126.924 E.00145
; LINE_WIDTH: 0.228286
G1 X126.89 Y126.8 E.0019
; LINE_WIDTH: 0.272074
G1 X126.913 Y126.676 E.00235
; LINE_WIDTH: 0.315862
G1 X126.936 Y126.552 E.0028
; LINE_WIDTH: 0.359651
G1 X126.959 Y126.428 E.00325
; LINE_WIDTH: 0.392831
G3 X127.029 Y126.194 I1.999 J.474 E.00697
G1 X127.359 Y125.909 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F1665
G1 X127.296 Y125.946 E.00204
G1 X127.344 Y125.974 E.00155
G1 X126.764 Y125.283 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.437737
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X128.283 Y125.283 E.09317
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.764 Y125.283 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/103
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
G3 Z4 I.083 J1.214 P1  F30000
G1 X128.949 Y125.133 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2176
G1 X129.626 Y124.966 E.02314
G1 X130.363 Y124.966 E.02444
G1 X131.078 Y125.142 E.02444
G1 X131.731 Y125.485 E.02444
G1 X132.282 Y125.973 E.02444
G1 X132.701 Y126.58 E.02444
G1 X132.962 Y127.269 E.02444
G1 X133.051 Y128 E.02444
G1 X132.962 Y128.731 E.02444
G1 X132.701 Y129.42 E.02444
G1 X132.282 Y130.027 E.02444
G1 X131.731 Y130.515 E.02444
G1 X131.078 Y130.858 E.02444
G1 X130.363 Y131.034 E.02444
G1 X129.626 Y131.034 E.02444
G1 X128.911 Y130.858 E.02444
G1 X128.258 Y130.515 E.02444
G1 X127.707 Y130.027 E.02444
G1 X127.288 Y129.42 E.02444
G1 X127.027 Y128.731 E.02444
G1 X126.938 Y128 E.02444
G1 X127.027 Y127.269 E.02444
G1 X127.288 Y126.58 E.02444
G1 X127.707 Y125.973 E.02444
G1 X128.258 Y125.485 E.02444
G1 X128.807 Y125.197 E.02055
G1 X128.892 Y125.152 E.00321
G1 X129.074 Y125.506 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2176
G1 X129.674 Y125.358 E.01897
G1 X130.315 Y125.358 E.01972
G1 X130.938 Y125.511 E.01972
G1 X131.506 Y125.81 E.01972
G1 X131.987 Y126.235 E.01972
G1 X132.351 Y126.763 E.01972
G1 X132.579 Y127.363 E.01972
G1 X132.656 Y128 E.01972
G1 X132.579 Y128.637 E.01972
G1 X132.351 Y129.237 E.01972
G1 X131.987 Y129.765 E.01972
G1 X131.506 Y130.19 E.01972
G1 X130.938 Y130.489 E.01972
G1 X130.315 Y130.642 E.01972
G1 X129.674 Y130.642 E.01972
G1 X129.051 Y130.489 E.01972
G1 X128.483 Y130.19 E.01972
G1 X128.002 Y129.765 E.01972
G1 X127.638 Y129.237 E.01972
G1 X127.41 Y128.637 E.01972
G1 X127.333 Y128 E.01972
G1 X127.41 Y127.363 E.01972
G1 X127.638 Y126.763 E.01972
G1 X128.002 Y126.235 E.01972
G1 X128.483 Y125.81 E.01972
G1 X129.019 Y125.528 E.01862
M204 S10000
; WIPE_START
G1 F24000
G1 X129.674 Y125.358 E-.25701
G1 X130.315 Y125.358 E-.24382
G1 X130.938 Y125.511 E-.24382
G1 X130.974 Y125.53 E-.01535
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I1.006 J-.685 P1  F30000
G1 X126.597 Y119.102 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2176
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y136.898 E.59032
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y119.162 E.58833
G1 X126.205 Y118.71 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2176
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y137.29 E.57091
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y118.77 E.56907
M204 S10000
; WIPE_START
G1 F24000
G1 X128.204 Y118.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I-1.122 J-.472 P1  F30000
G1 X126.945 Y121.751 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2176
G1 X126.945 Y121.909 E.00524
G1 X128.415 Y121.909 E.04878
G1 X130.874 Y119.45 E.11533
G1 X129.126 Y119.45 E.05796
G1 X131.585 Y121.909 E.11533
G1 X133.044 Y121.909 E.04842
G1 X133.044 Y121.74 E.0056
G1 X132.96 Y126.194 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.375885
G1 F2176
G3 X133.031 Y126.428 I-1.929 J.708 E.00664
; LINE_WIDTH: 0.31586
G1 X133.053 Y126.552 E.0028
; LINE_WIDTH: 0.272072
G1 X133.076 Y126.676 E.00235
; LINE_WIDTH: 0.228284
G1 X133.099 Y126.8 E.0019
; LINE_WIDTH: 0.184496
G1 X133.121 Y126.924 E.00145
; LINE_WIDTH: 0.140708
G1 X133.144 Y127.048 E.001
; LINE_WIDTH: 0.0969201
G1 X133.167 Y127.172 E.00055
G1 X133.167 Y128.828 F30000
; LINE_WIDTH: 0.140708
G1 F2176
G1 X133.144 Y128.952 E.001
; LINE_WIDTH: 0.184497
G1 X133.121 Y129.076 E.00145
; LINE_WIDTH: 0.228285
G1 X133.099 Y129.2 E.0019
; LINE_WIDTH: 0.272073
G1 X133.076 Y129.324 E.00235
; LINE_WIDTH: 0.315861
G1 X133.053 Y129.448 E.0028
; LINE_WIDTH: 0.359649
G1 X133.031 Y129.572 E.00325
; LINE_WIDTH: 0.392831
G3 X132.96 Y129.806 I-1.998 J-.474 E.00697
G1 X133.044 Y134.26 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2176
G1 X133.044 Y134.211 E.00162
G1 X131.465 Y134.211 E.0524
G1 X129.126 Y136.55 E.1097
G1 X130.874 Y136.55 E.05796
G1 X128.535 Y134.211 E.1097
G1 X126.945 Y134.249 E.05277
G1 X128.128 Y132.176 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.435449
G1 F2176
G1 X128.128 Y132.68 E.01613
G1 X128.412 Y132.661 E.00912
; LINE_WIDTH: 0.474417
G1 X128.696 Y132.641 E.01002
; LINE_WIDTH: 0.513384
G1 X128.981 Y132.622 E.01093
; LINE_WIDTH: 0.552351
G1 X129.265 Y132.602 E.01183
; LINE_WIDTH: 0.591318
G1 X129.079 Y132.536 E.00883
; LINE_WIDTH: 0.552351
G1 X128.893 Y132.47 E.0082
; LINE_WIDTH: 0.513384
G1 X128.706 Y132.404 E.00757
; LINE_WIDTH: 0.449134
G3 X128.183 Y132.199 I1.714 J-5.135 E.01862
M73 P44 R10
G1 X129.265 Y132.602 F30000
; LINE_WIDTH: 0.58564
G1 F2176
G1 X130.569 Y132.615 E.05766
G1 X131.861 Y132.176 F30000
; LINE_WIDTH: 0.435449
G1 F2176
G1 X131.469 Y132.339 E.01359
G1 X131.218 Y132.418 E.0084
; LINE_WIDTH: 0.469937
G1 X130.968 Y132.497 E.00914
; LINE_WIDTH: 0.504425
G1 X130.718 Y132.577 E.00988
; LINE_WIDTH: 0.538912
G1 X130.629 Y132.612 E.00387
; LINE_WIDTH: 0.571468
G1 X130.923 Y132.635 E.01269
; LINE_WIDTH: 0.526129
G1 X131.216 Y132.658 E.0116
; LINE_WIDTH: 0.447707
G2 X131.861 Y132.68 I.469 J-4.168 E.02131
G1 X131.861 Y132.236 E.01465
G1 X132.246 Y131.539 F30000
; LINE_WIDTH: 0.419999
G1 F2176
G1 X131.589 Y131.884 E.0228
G1 X130.613 Y132.153 E.0311
G1 X129.601 Y132.18 E.0311
G1 X128.612 Y131.965 E.0311
G1 X127.743 Y131.539 E.02974
G1 X127.743 Y133.065 E.04688
G1 X132.246 Y133.065 E.13838
G1 X132.246 Y131.599 E.04503
G1 X132.623 Y130.752 F30000
; LINE_WIDTH: 0.419999
G1 F2176
G1 X132.222 Y131.108 E.01646
G1 X131.414 Y131.55 E.02832
G1 X130.523 Y131.787 E.02832
G1 X129.601 Y131.803 E.02832
G1 X128.703 Y131.599 E.02832
G1 X127.879 Y131.185 E.02832
G1 X127.366 Y130.752 E.02062
G1 X127.366 Y133.442 E.08265
G1 X132.623 Y133.442 E.16155
G1 X132.623 Y130.812 E.08081
G1 X132.687 Y130.131 F30000
; LINE_WIDTH: 0.419999
G1 F2176
G1 X132.561 Y130.304 E.00656
G1 X131.972 Y130.825 E.02416
G1 X131.239 Y131.217 E.02555
G1 X130.433 Y131.421 E.02555
G1 X129.601 Y131.426 E.02555
G1 X128.793 Y131.233 E.02555
G1 X128.054 Y130.851 E.02555
G1 X127.428 Y130.304 E.02555
G1 X127.302 Y130.131 E.00656
G1 X126.989 Y130.229 E.0101
G1 X126.989 Y133.819 E.11031
G1 X133 Y133.819 E.18472
G1 X133 Y130.229 E.11031
G1 X132.744 Y130.149 E.00825
; WIPE_START
G1 F24000
G1 X133 Y130.229 E-.10208
G1 X133 Y131.96 E-.65792
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.413 J-1.145 P1  F30000
G1 X127.029 Y129.806 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.392831
G1 F2176
G3 X126.959 Y129.572 I1.929 J-.708 E.00697
; LINE_WIDTH: 0.359646
G1 X126.936 Y129.448 E.00325
; LINE_WIDTH: 0.315859
G1 X126.913 Y129.324 E.0028
; LINE_WIDTH: 0.272071
G1 X126.89 Y129.2 E.00235
; LINE_WIDTH: 0.228283
G1 X126.868 Y129.076 E.0019
; LINE_WIDTH: 0.184495
G1 X126.845 Y128.952 E.00145
; LINE_WIDTH: 0.140708
G1 X126.822 Y128.828 E.001
G1 X126.822 Y127.172 F30000
; LINE_WIDTH: 0.140709
G1 F2176
G1 X126.845 Y127.048 E.001
; LINE_WIDTH: 0.184497
G1 X126.868 Y126.924 E.00145
; LINE_WIDTH: 0.228286
G1 X126.89 Y126.8 E.0019
; LINE_WIDTH: 0.272074
G1 X126.913 Y126.676 E.00235
; LINE_WIDTH: 0.315862
G1 X126.936 Y126.552 E.0028
; LINE_WIDTH: 0.359651
G1 X126.959 Y126.428 E.00325
; LINE_WIDTH: 0.392831
G3 X127.029 Y126.194 I2 J.474 E.00697
G1 X128.103 Y123.864 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.386605
G1 F2176
G1 X128.526 Y123.685 E.01286
G1 X129.284 Y123.473 E.02203
; LINE_WIDTH: 0.449187
G1 X129.371 Y123.447 E.00301
G1 X128.493 Y123.415 E.02907
; LINE_WIDTH: 0.386605
G1 X128.103 Y123.415 E.01093
G1 X128.103 Y123.804 E.0109
G1 X129.371 Y123.447 F30000
; LINE_WIDTH: 0.446442
G1 F2176
G1 X130.388 Y123.437 E.03344
G1 X130.65 Y123.453 E.00863
G1 X131.886 Y123.864 F30000
; LINE_WIDTH: 0.386605
G1 F2176
G1 X131.886 Y123.415 E.01258
G1 X131.298 Y123.436 E.01648
; LINE_WIDTH: 0.451812
G1 X130.709 Y123.457 E.01961
G1 X131.463 Y123.685 E.02623
; LINE_WIDTH: 0.386605
G1 X131.831 Y123.841 E.01118
G1 X132.246 Y124.461 F30000
; LINE_WIDTH: 0.419999
G1 F2176
G1 X132.246 Y123.055 E.04319
G1 X127.743 Y123.055 E.13838
G1 X127.743 Y124.461 E.04319
G1 X128.4 Y124.116 E.0228
G1 X129.376 Y123.847 E.0311
G1 X130.388 Y123.82 E.0311
G1 X131.377 Y124.035 E.0311
G1 X132.192 Y124.434 E.0279
G1 X132.623 Y125.248 F30000
; LINE_WIDTH: 0.419999
G1 F2176
G1 X132.623 Y122.678 E.07896
G1 X127.366 Y122.678 E.16155
G1 X127.366 Y125.248 E.07896
G1 X127.767 Y124.892 E.01646
G1 X128.575 Y124.45 E.02832
G1 X129.466 Y124.213 E.02832
G1 X130.388 Y124.197 E.02832
G1 X131.286 Y124.401 E.02832
G1 X132.11 Y124.815 E.02832
G1 X132.577 Y125.209 E.01878
G1 X132.687 Y125.869 F30000
; LINE_WIDTH: 0.419999
G1 F2176
G1 X133 Y125.771 E.0101
G1 X133 Y122.301 E.10663
G1 X126.989 Y122.301 E.18472
G1 X126.989 Y125.771 E.10663
G1 X127.302 Y125.869 E.0101
G1 X127.428 Y125.696 E.00656
G1 X128.017 Y125.175 E.02416
G1 X128.75 Y124.783 E.02555
G1 X129.556 Y124.579 E.02555
G1 X130.388 Y124.574 E.02555
G1 X131.196 Y124.767 E.02555
G1 X131.935 Y125.149 E.02555
G1 X132.561 Y125.696 E.02555
G1 X132.651 Y125.82 E.00472
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X132.561 Y125.696 E-.05834
G1 X131.935 Y125.149 E-.31593
G1 X131.196 Y124.767 E-.31593
G1 X131.018 Y124.725 E-.06979
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/103
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
G3 Z4.2 I-.454 J-1.129 P1  F30000
G1 X129.078 Y125.505 Z4.2
G1 Z4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2578
G1 X129.674 Y125.358 E.01885
G1 X130.315 Y125.358 E.01972
G1 X130.938 Y125.511 E.01972
G1 X131.506 Y125.81 E.01972
G1 X131.987 Y126.235 E.01972
G1 X132.351 Y126.763 E.01972
G1 X132.579 Y127.363 E.01972
G1 X132.656 Y128 E.01972
G1 X132.579 Y128.637 E.01972
G1 X132.351 Y129.237 E.01972
G1 X131.987 Y129.765 E.01972
G1 X131.506 Y130.19 E.01972
G1 X130.974 Y130.47 E.01848
G1 X130.315 Y130.642 E.02092
G1 X129.674 Y130.642 E.01972
G1 X129.051 Y130.489 E.01972
G1 X128.483 Y130.19 E.01972
G1 X128.002 Y129.765 E.01972
G1 X127.638 Y129.237 E.01972
G1 X127.41 Y128.637 E.01972
G1 X127.333 Y128 E.01972
G1 X127.41 Y127.363 E.01972
G1 X127.638 Y126.763 E.01972
G1 X128.002 Y126.235 E.01972
G1 X128.483 Y125.81 E.01972
G1 X129.023 Y125.526 E.01874
M204 S10000
; WIPE_START
G1 F24000
G1 X129.674 Y125.358 E-.25557
G1 X130.315 Y125.358 E-.24382
G1 X130.938 Y125.511 E-.24382
G1 X130.977 Y125.532 E-.01679
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.006 J-.685 P1  F30000
G1 X126.597 Y119.102 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2578
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.482 E.11213
G1 X126.597 Y122.482 E.22543
G1 X126.597 Y119.162 E.11013
; WIPE_START
G1 F24000
G1 X128.597 Y119.144 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.206 J-.166 P1  F30000
G1 X126.597 Y133.638 Z4.4
G1 Z4
G1 E.8 F1800
G1 F2578
G1 X133.392 Y133.638 E.22543
G1 X133.392 Y136.898 E.10814
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.698 E.10615
; WIPE_START
G1 F24000
G1 X128.597 Y133.68 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.202 J-.192 P1  F30000
G1 X126.205 Y118.71 Z4.4
G1 Z4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2578
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y137.29 E.57091
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y118.77 E.56907
M204 S10000
; WIPE_START
G1 F24000
G1 X128.204 Y118.754 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.122 J-.472 P1  F30000
G1 X126.945 Y121.751 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2578
G1 X126.945 Y122.134 E.01271
G1 X128.19 Y122.134 E.04131
G1 X130.874 Y119.45 E.12589
G1 X129.126 Y119.45 E.05796
G1 X131.81 Y122.134 E.12589
G1 X133.044 Y122.134 E.04094
G1 X133.044 Y121.74 E.01307
; WIPE_START
G1 F24000
G1 X133.044 Y122.134 E-.14974
G1 X131.81 Y122.134 E-.46902
G1 X131.547 Y121.871 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.196 J.224 P1  F30000
G1 X133.577 Y132.688 Z4.4
G1 Z4
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2578
G1 X132.85 Y133.415 E.03159
G1 X132.317 Y133.415
G1 X133.577 Y132.155 E.05476
G1 X133.577 Y131.622
G1 X131.784 Y133.415 E.07793
G1 X131.25 Y133.415
G1 X133.577 Y131.089 E.10111
G1 X133.577 Y130.555
G1 X130.717 Y133.415 E.12428
G1 X130.184 Y133.415
G1 X133.577 Y130.022 E.14745
G1 X133.577 Y129.489
G1 X129.651 Y133.415 E.17063
G1 X129.117 Y133.415
G1 X133.577 Y128.956 E.1938
G1 X133.577 Y128.422
G1 X132.248 Y129.751 E.05775
G1 X132.782 Y128.684
G1 X133.577 Y127.889 E.03456
G1 X133.577 Y127.356
G1 X132.856 Y128.077 E.03135
G1 X132.815 Y127.585
G1 X133.577 Y126.823 E.03314
G1 X133.577 Y126.289
G1 X132.719 Y127.148 E.0373
G1 X132.572 Y126.761
G1 X133.577 Y125.756 E.04367
G1 X133.577 Y125.223
G1 X132.372 Y126.428 E.05237
G1 X132.154 Y126.112
G1 X133.577 Y124.689 E.06184
G1 X133.577 Y124.156
G1 X131.875 Y125.859 E.07398
G1 X131.584 Y125.616
G1 X133.577 Y123.623 E.08661
G1 X133.577 Y123.09
G1 X131.234 Y125.433 E.10181
G1 X130.856 Y125.278
G1 X133.429 Y122.705 E.11181
G1 X132.896 Y122.705
G1 X130.428 Y125.172 E.10722
G1 X129.916 Y125.15
G1 X132.362 Y122.705 E.10628
G1 X131.829 Y122.705
G1 X129.296 Y125.237 E.11006
G1 X128.354 Y125.647
G1 X131.296 Y122.705 E.12785
M204 S10000
; WIPE_START
G1 F24000
G1 X129.882 Y124.119 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.165 J.35 P1  F30000
G1 X131.73 Y130.269 Z4.4
G1 Z4
G1 E.8 F1800
M204 S2000
G1 F2578
G1 X128.584 Y133.415 E.13672
G1 X128.051 Y133.415
G1 X130.707 Y130.759 E.11542
G1 X130.083 Y130.85
G1 X127.518 Y133.415 E.1115
G1 X126.984 Y133.415
G1 X129.57 Y130.83 E.11234
G1 X129.142 Y130.725
G1 X126.451 Y133.415 E.11693
G1 X126.412 Y132.921
G1 X128.762 Y130.571 E.10212
G1 X128.412 Y130.388
G1 X126.412 Y132.388 E.08692
G1 X126.412 Y131.855
G1 X128.12 Y130.146 E.07423
G1 X127.839 Y129.894
G1 X126.412 Y131.321 E.06203
G1 X126.412 Y130.788
G1 X127.622 Y129.578 E.05257
G1 X127.42 Y129.247
G1 X126.412 Y130.255 E.0438
G1 X126.412 Y129.722
G1 X127.273 Y128.86 E.03743
G1 X127.176 Y128.425
G1 X126.412 Y129.188 E.03319
G1 X126.412 Y128.655
G1 X127.132 Y127.935 E.03129
G1 X127.206 Y127.328
G1 X126.412 Y128.122 E.03449
G1 X126.412 Y127.588
G1 X127.717 Y126.284 E.05671
M204 S10000
; WIPE_START
G1 F24000
G1 X126.412 Y127.588 E-.7013
G1 X126.412 Y127.743 E-.0587
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I1.217 J0 P1  F30000
G1 X126.412 Y127.055 Z4.4
G1 Z4
G1 E.8 F1800
M204 S2000
G1 F2578
G1 X130.763 Y122.705 E.18905
G1 X130.229 Y122.705
G1 X126.412 Y126.522 E.16588
G1 X126.412 Y125.989
M73 P45 R10
G1 X129.696 Y122.705 E.14271
G1 X129.163 Y122.705
G1 X126.412 Y125.455 E.11954
G1 X126.412 Y124.922
G1 X128.629 Y122.705 E.09636
G1 X128.096 Y122.705
G1 X126.412 Y124.389 E.07319
G1 X126.412 Y123.856
G1 X127.563 Y122.705 E.05002
G1 X127.03 Y122.705
G1 X126.412 Y123.322 E.02684
M204 S10000
; WIPE_START
G1 F24000
G1 X127.03 Y122.705 E-.33196
G1 X127.563 Y122.705 E-.20264
G1 X127.143 Y123.124 E-.2254
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.103 J.515 P1  F30000
G1 X128.294 Y125.587 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.235544
G1 F2578
G2 X127.791 Y126.061 I3.665 J4.383 E.01086
G1 X127.656 Y126.223 E.0033
; WIPE_START
G1 F24000
G1 X127.791 Y126.061 E-.1773
G1 X128.294 Y125.587 E-.5827
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.174 J.322 P1  F30000
G1 X129.753 Y130.914 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.108098
G1 F2578
G3 X129.597 Y130.835 I.562 J-1.296 E.00093
; WIPE_START
G1 F24000
G1 X129.753 Y130.914 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.482 J1.118 P1  F30000
G1 X132.309 Y129.812 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.22061
G1 F2578
G3 X131.79 Y130.329 I-2.477 J-1.963 E.01063
; WIPE_START
G1 F24000
G1 X132.187 Y129.956 E-.56429
G1 X132.309 Y129.812 E-.19571
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I-1.201 J.199 P1  F30000
G1 X133.044 Y134.26 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2578
G1 X133.044 Y133.986 E.00909
G1 X131.69 Y133.986 E.04492
G1 X129.126 Y136.55 E.12026
G1 X130.874 Y136.55 E.05796
G1 X128.31 Y133.986 E.12026
G1 X126.945 Y133.986 E.04529
G1 X126.945 Y134.249 E.00873
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y133.986 E-.09998
G1 X128.31 Y133.986 E-.51879
G1 X128.573 Y134.249 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/103
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
G3 Z4.4 I.268 J1.187 P1  F30000
G1 X133.392 Y133.162 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/103
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
G3 Z4.6 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
M73 P46 R10
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/103
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
G3 Z4.8 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/103
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
G3 Z5 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
M73 P47 R10
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/103
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
G3 Z5.2 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/103
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
G3 Z5.4 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P48 R10
G3 Z5.6 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/103
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
G3 Z5.6 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z5.6
M73 P48 R9
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
M73 P49 R9
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/103
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
G3 Z5.8 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/103
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
G3 Z6 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
M73 P50 R9
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/103
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
G3 Z6.2 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/103
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
G3 Z6.4 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
M73 P51 R9
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/103
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
G3 Z6.6 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
M73 P52 R9
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/103
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
G3 Z6.8 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/103
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
G3 Z7 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P53 R9
G3 Z7.2 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/103
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
G3 Z7.2 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
M73 P53 R8
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/103
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
G3 Z7.4 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
M73 P54 R8
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/103
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
G3 Z7.6 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/103
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
G3 Z7.8 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
M73 P55 R8
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/103
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
G3 Z8 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
M73 P56 R8
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/103
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
G3 Z8.2 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/103
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
G3 Z8.4 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
M73 P57 R8
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/103
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
G3 Z8.6 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/103
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
G3 Z8.8 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I.712 J-.987 P1  F30000
M73 P58 R8
G1 X133.044 Y134.26 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/103
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
G3 Z9 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
M73 P58 R7
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
M73 P59 R7
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/103
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
G3 Z9.2 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/103
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
G3 Z9.4 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
M73 P60 R7
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/103
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
G3 Z9.6 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/103
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
G3 Z9.8 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
M73 P61 R7
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/103
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
G3 Z10 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
M73 P62 R7
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/103
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
G3 Z10.2 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/103
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
G3 Z10.4 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I.948 J.763 P1  F30000
M73 P63 R7
G1 X133.044 Y121.74 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/103
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
G3 Z10.6 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/103
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
G3 Z10.8 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
M73 P63 R6
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
M73 P64 R6
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/103
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
G3 Z11 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/103
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
G3 Z11.2 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
M73 P65 R6
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/103
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
G3 Z11.4 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
M73 P66 R6
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/103
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
G3 Z11.6 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/103
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
G3 Z11.8 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I.712 J-.987 P1  F30000
G1 X133.044 Y134.26 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y133.51 E.02487
G1 X132.166 Y133.51 E.02914
G1 X129.126 Y136.55 E.14258
G1 X130.874 Y136.55 E.05796
G1 X127.834 Y133.51 E.14258
G1 X126.945 Y133.51 E.02951
G1 X126.945 Y134.249 E.02451
; WIPE_START
G1 F24000
M73 P67 R6
G1 X126.945 Y133.51 E-.28074
G1 X127.834 Y133.51 E-.33802
G1 X128.097 Y133.773 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I1.093 J.535 P1  F30000
G1 X133.392 Y122.958 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I.948 J.763 P1  F30000
G1 X133.044 Y121.74 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.044 Y122.61 E.02885
G1 X132.286 Y122.61 E.02516
G1 X129.126 Y119.45 E.14821
G1 X130.874 Y119.45 E.05796
G1 X127.714 Y122.61 E.14821
G1 X126.945 Y122.61 E.02553
G1 X126.945 Y121.751 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.945 Y122.61 E-.32634
G1 X127.714 Y122.61 E-.29242
G1 X127.977 Y122.347 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/103
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
G3 Z12 I-1.088 J.545 P1  F30000
G1 X133.392 Y133.162 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I.112 J-1.212 P1  F30000
G1 X132.637 Y134.667 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X132.637 Y133.917 E.02487
G1 X131.759 Y133.917 E.02914
G1 X129.533 Y136.143 E.10439
G1 X130.467 Y136.143 E.03096
G1 X128.241 Y133.917 E.10439
G1 X127.352 Y133.917 E.02951
G1 X127.352 Y134.656 E.02451
G1 X133.044 Y136.49 F30000
G1 F1200
G1 X133.044 Y133.51 E.09883
G1 X126.945 Y133.51 E.20233
G1 X126.945 Y136.55 E.10082
G1 X133.044 Y136.55 E.20233
; WIPE_START
G1 F24000
G1 X131.044 Y136.55 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I1.199 J.207 P1  F30000
G1 X133.392 Y122.958 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I.589 J1.065 P1  F30000
G1 X133.044 Y122.61 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.945 Y122.61 E.20233
G1 X126.945 Y119.45 E.1048
G1 X133.044 Y119.45 E.20233
G1 X133.044 Y122.55 E.10281
G1 X132.637 Y121.333 F30000
G1 F1200
G1 X132.637 Y122.203 E.02885
G1 X131.879 Y122.203 E.02516
G1 X129.533 Y119.857 E.11002
G1 X130.467 Y119.857 E.03096
G1 X128.121 Y122.203 E.11002
G1 X127.352 Y122.203 E.02553
G1 X127.352 Y121.344 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.352 Y122.203 E-.32634
G1 X128.121 Y122.203 E-.29242
G1 X128.384 Y121.94 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/103
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
G3 Z12.2 I-1.111 J.496 P1  F30000
G1 X133.392 Y133.162 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
M73 P68 R6
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I.112 J-1.212 P1  F30000
G1 X132.637 Y134.667 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X132.637 Y133.917 E.02487
G1 X131.759 Y133.917 E.02914
G1 X129.533 Y136.143 E.10439
G1 X130.467 Y136.143 E.03096
G1 X128.241 Y133.917 E.10439
G1 X127.352 Y133.917 E.02951
G1 X127.352 Y134.656 E.02451
G1 X133.044 Y136.49 F30000
G1 F1200
G1 X133.044 Y133.51 E.09883
G1 X126.945 Y133.51 E.20233
G1 X126.945 Y136.55 E.10082
G1 X133.044 Y136.55 E.20233
; WIPE_START
G1 F24000
G1 X131.044 Y136.55 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I1.199 J.207 P1  F30000
G1 X133.392 Y122.958 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I.589 J1.065 P1  F30000
G1 X133.044 Y122.61 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.945 Y122.61 E.20233
G1 X126.945 Y119.45 E.1048
G1 X133.044 Y119.45 E.20233
G1 X133.044 Y122.55 E.10281
G1 X132.637 Y121.333 F30000
G1 F1200
G1 X132.637 Y122.203 E.02885
G1 X131.879 Y122.203 E.02516
G1 X129.533 Y119.857 E.11002
G1 X130.467 Y119.857 E.03096
G1 X128.121 Y122.203 E.11002
G1 X127.352 Y122.203 E.02553
G1 X127.352 Y121.344 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.352 Y122.203 E-.32634
G1 X128.121 Y122.203 E-.29242
G1 X128.384 Y121.94 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/103
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
G3 Z12.4 I-1.111 J.496 P1  F30000
G1 X133.392 Y133.162 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I.112 J-1.212 P1  F30000
G1 X132.637 Y134.667 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X132.637 Y133.917 E.02487
G1 X131.759 Y133.917 E.02914
G1 X129.533 Y136.143 E.10439
G1 X130.467 Y136.143 E.03096
G1 X128.241 Y133.917 E.10439
G1 X127.352 Y133.917 E.02951
G1 X127.352 Y134.656 E.02451
M73 P69 R6
G1 X133.044 Y136.49 F30000
G1 F1200
G1 X133.044 Y133.51 E.09883
G1 X126.945 Y133.51 E.20233
G1 X126.945 Y136.55 E.10082
G1 X133.044 Y136.55 E.20233
; WIPE_START
G1 F24000
G1 X131.044 Y136.55 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I1.199 J.207 P1  F30000
G1 X133.392 Y122.958 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
M73 P69 R5
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I.589 J1.065 P1  F30000
G1 X133.044 Y122.61 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.945 Y122.61 E.20233
G1 X126.945 Y119.45 E.1048
G1 X133.044 Y119.45 E.20233
G1 X133.044 Y122.55 E.10281
G1 X132.637 Y121.333 F30000
G1 F1200
G1 X132.637 Y122.203 E.02885
G1 X131.879 Y122.203 E.02516
G1 X129.533 Y119.857 E.11002
G1 X130.467 Y119.857 E.03096
G1 X128.121 Y122.203 E.11002
G1 X127.352 Y122.203 E.02553
G1 X127.352 Y121.344 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.352 Y122.203 E-.32634
G1 X128.121 Y122.203 E-.29242
G1 X128.384 Y121.94 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/103
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
G3 Z12.6 I-1.111 J.496 P1  F30000
G1 X133.392 Y133.162 Z12.6
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I.112 J-1.212 P1  F30000
G1 X132.637 Y134.667 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X132.637 Y133.917 E.02487
G1 X131.759 Y133.917 E.02914
G1 X129.533 Y136.143 E.10439
G1 X130.467 Y136.143 E.03096
G1 X128.241 Y133.917 E.10439
G1 X127.352 Y133.917 E.02951
G1 X127.352 Y134.656 E.02451
G1 X133.044 Y136.49 F30000
G1 F1200
G1 X133.044 Y133.51 E.09883
G1 X126.945 Y133.51 E.20233
G1 X126.945 Y136.55 E.10082
G1 X133.044 Y136.55 E.20233
; WIPE_START
G1 F24000
G1 X131.044 Y136.55 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I1.199 J.207 P1  F30000
G1 X133.392 Y122.958 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.785 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I.589 J1.065 P1  F30000
G1 X133.044 Y122.61 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.945 Y122.61 E.20233
G1 X126.945 Y119.45 E.1048
G1 X133.044 Y119.45 E.20233
M73 P70 R5
G1 X133.044 Y122.55 E.10281
G1 X132.637 Y121.333 F30000
G1 F1200
G1 X132.637 Y122.203 E.02885
G1 X131.879 Y122.203 E.02516
G1 X129.533 Y119.857 E.11002
G1 X130.467 Y119.857 E.03096
G1 X128.121 Y122.203 E.11002
G1 X127.352 Y122.203 E.02553
G1 X127.352 Y121.344 E.02849
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.352 Y122.203 E-.32634
G1 X128.121 Y122.203 E-.29242
G1 X128.384 Y121.94 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/103
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
G3 Z12.8 I-1.111 J.496 P1  F30000
G1 X133.392 Y133.162 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F1200
G1 X133.392 Y136.898 E.12392
G1 X126.597 Y136.898 E.22543
G1 X126.597 Y133.162 E.12392
G1 X133.332 Y133.162 E.22344
G1 X133.785 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.785 Y137.29 E.13889
G1 X126.205 Y137.29 E.23291
G1 X126.205 Y132.77 E.13889
G1 X133.725 Y132.77 E.23107
M204 S10000
; WIPE_START
G1 F24000
G1 X133.751 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I-1.139 J-.428 P1  F30000
G1 X133.015 Y136.731 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.414743
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X133.015 Y133.532 E.17608
G1 X132.551 Y133.532 E.02558
G1 X132.551 Y136.528 E.16493
G1 X132.086 Y136.528 E.02558
G1 X132.086 Y133.532 E.16493
G1 X131.621 Y133.532 E.02558
G1 X131.621 Y136.528 E.16493
G1 X131.156 Y136.528 E.02558
G1 X131.156 Y133.532 E.16493
G1 X130.692 Y133.532 E.02558
G1 X130.692 Y136.528 E.16493
G1 X130.227 Y136.528 E.02558
G1 X130.227 Y133.532 E.16493
G1 X129.762 Y133.532 E.02558
G1 X129.762 Y136.528 E.16493
G1 X129.297 Y136.528 E.02558
G1 X129.297 Y133.532 E.16493
G1 X128.833 Y133.532 E.02558
G1 X128.833 Y136.528 E.16493
G1 X128.368 Y136.528 E.02558
G1 X128.368 Y133.532 E.16493
G1 X127.903 Y133.532 E.02558
G1 X127.903 Y136.528 E.16493
G1 X127.438 Y136.528 E.02558
G1 X127.438 Y133.532 E.16493
G1 X126.974 Y133.532 E.02558
G1 X126.974 Y136.731 E.17608
; WIPE_START
G1 F24000
G1 X126.974 Y134.731 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I1.068 J.583 P1  F30000
G1 X133.392 Y122.958 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X126.597 Y122.958 E.22543
G1 X126.597 Y119.102 E.12791
G1 X133.392 Y119.102 E.22543
G1 X133.392 Y122.898 E.12592
G1 X133.785 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.205 Y123.35 E.23291
G1 X126.205 Y118.71 E.14257
G1 X133.785 Y118.71 E.23291
G1 X133.785 Y123.29 E.14073
M204 S10000
G1 X133.015 Y122.791 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.414743
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X133.015 Y119.472 E.18269
G1 X132.551 Y119.472 E.02558
G1 X132.551 Y122.588 E.17154
G1 X132.086 Y122.588 E.02558
G1 X132.086 Y119.472 E.17154
G1 X131.621 Y119.472 E.02558
G1 X131.621 Y122.588 E.17154
G1 X131.156 Y122.588 E.02558
G1 X131.156 Y119.472 E.17154
G1 X130.692 Y119.472 E.02558
G1 X130.692 Y122.588 E.17154
G1 X130.227 Y122.588 E.02558
G1 X130.227 Y119.472 E.17154
G1 X129.762 Y119.472 E.02558
G1 X129.762 Y122.588 E.17154
G1 X129.297 Y122.588 E.02558
G1 X129.297 Y119.472 E.17154
G1 X128.833 Y119.472 E.02558
G1 X128.833 Y122.588 E.17154
G1 X128.368 Y122.588 E.02558
G1 X128.368 Y119.472 E.17154
G1 X127.903 Y119.472 E.02558
G1 X127.903 Y122.588 E.17154
G1 X127.438 Y122.588 E.02558
G1 X127.438 Y119.472 E.17154
G1 X126.974 Y119.472 E.02558
G1 X126.974 Y122.791 E.18269
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.974 Y120.791 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/103
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
G3 Z13 I-1.078 J.565 P1  F30000
G1 X133.452 Y133.162 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1648
G1 X133.452 Y136.898 E.12392
G1 X126.539 Y136.898 E.22932
G1 X126.539 Y133.162 E.12392
G1 X133.392 Y133.162 E.22733
G1 X133.826 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X133.844 Y132.77 E.00057
G1 X133.844 Y137.29 E.13889
M73 P71 R5
G1 X133.826 Y137.29 E.00057
G1 X126.164 Y137.29 E.23543
G1 X126.147 Y137.29 E.00052
G1 X126.147 Y132.77 E.13889
G1 X126.164 Y132.77 E.00052
G1 X133.766 Y132.77 E.23359
M204 S10000
; WIPE_START
G1 F24000
G1 X133.844 Y132.77 E-.02981
G1 X133.844 Y134.692 E-.73019
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I-.076 J-1.215 P1  F30000
G1 X128.407 Y135.03 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.35505
G1 F1648
G1 X131.524 Y135.03 E.07929
G1 X131.929 Y134.685 F30000
; LINE_WIDTH: 0.419999
G1 F1648
G1 X128.062 Y134.685 E.11881
G1 X128.062 Y135.375 E.02118
G1 X131.929 Y135.375 E.11881
G1 X131.929 Y134.745 E.01933
G1 X132.306 Y134.308 F30000
G1 F1648
G1 X127.685 Y134.308 E.14198
G1 X127.685 Y135.752 E.04435
G1 X132.306 Y135.752 E.14198
G1 X132.306 Y134.368 E.04251
G1 X132.683 Y133.931 F30000
G1 F1648
G1 X127.308 Y133.931 E.16516
G1 X127.308 Y136.129 E.06752
G1 X132.683 Y136.129 E.16516
G1 X132.683 Y133.991 E.06568
G1 X133.06 Y133.554 F30000
G1 F1648
G1 X126.931 Y133.554 E.18833
G1 X126.931 Y136.506 E.0907
G1 X133.06 Y136.506 E.18833
G1 X133.06 Y133.614 E.08885
; WIPE_START
G1 F24000
G1 X133.06 Y135.614 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I1.126 J-.461 P1  F30000
G1 X127.885 Y122.958 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1648
G1 X126.539 Y122.958 E.04465
G1 X126.539 Y119.102 E.12791
G1 X133.452 Y119.102 E.22932
G1 X133.452 Y122.958 E.12791
G1 X127.945 Y122.958 E.18269
G1 X127.885 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1648
G1 X126.164 Y123.35 E.05288
G1 X126.147 Y123.35 E.00052
G1 X126.147 Y118.71 E.14257
G1 X126.164 Y118.71 E.00052
G1 X133.826 Y118.71 E.23543
G1 X133.844 Y118.71 E.00057
G1 X133.844 Y123.35 E.14257
G1 X133.826 Y123.35 E.00057
G1 X127.945 Y123.35 E.1807
M204 S10000
; WIPE_START
G1 F24000
G1 X126.164 Y123.35 E-.67681
G1 X126.147 Y123.35 E-.00644
G1 X126.147 Y123.148 E-.07675
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I.821 J.899 P1  F30000
G1 X128.467 Y121.03 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.475052
G1 F1648
G1 X131.464 Y121.03 E.10555
G1 X131.929 Y121.435 F30000
; LINE_WIDTH: 0.419999
G1 F1648
G1 X131.929 Y120.625 E.02486
G1 X128.062 Y120.625 E.11881
G1 X128.062 Y121.435 E.02486
G1 X131.869 Y121.435 E.11697
G1 X132.306 Y121.812 F30000
G1 F1648
G1 X132.306 Y120.248 E.04804
G1 X127.685 Y120.248 E.14198
G1 X127.685 Y121.812 E.04804
G1 X132.246 Y121.812 E.14014
G1 X132.683 Y122.189 F30000
G1 F1648
G1 X132.683 Y119.871 E.07121
G1 X127.308 Y119.871 E.16516
G1 X127.308 Y122.189 E.07121
G1 X132.623 Y122.189 E.16331
G1 X133.06 Y122.566 F30000
G1 F1648
G1 X133.06 Y119.494 E.09438
G1 X126.931 Y119.494 E.18833
G1 X126.931 Y122.566 E.09438
G1 X133 Y122.566 E.18649
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X131 Y122.566 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/103
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
G3 Z13.2 I-1.177 J-.308 P1  F30000
G1 X128.226 Y133.162 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1969
G1 X128.226 Y136.898 E.12392
G1 X126.423 Y136.898 E.05982
G1 X126.423 Y133.162 E.12392
G1 X128.166 Y133.162 E.05783
; WIPE_START
G1 F24000
G1 X128.198 Y135.162 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I.425 J1.141 P1  F30000
G1 X133.571 Y133.162 Z13.4
G1 Z13
G1 E.8 F1800
G1 F1969
G1 X133.571 Y136.898 E.12392
G1 X131.75 Y136.898 E.06039
G1 X131.75 Y133.162 E.12392
G1 X133.511 Y133.162 E.0584
G1 X133.885 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1969
G1 X133.963 Y132.77 E.00239
G1 X133.963 Y137.29 E.13889
G1 X133.885 Y137.29 E.00239
G1 X126.106 Y137.29 E.23904
G1 X126.031 Y137.29 E.0023
G1 X126.031 Y132.77 E.13889
G1 X126.106 Y132.77 E.0023
G1 X133.825 Y132.77 E.2372
M204 S10000
; WIPE_START
G1 F24000
G1 X133.963 Y132.77 E-.05239
G1 X133.963 Y134.632 E-.70761
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I.999 J-.695 P1  F30000
G1 X133.348 Y133.748 Z13.4
G1 Z13
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F1969
G1 X132.985 Y133.384 E.0158
G1 X132.451 Y133.384
G1 X133.348 Y134.281 E.03898
G1 X133.348 Y134.815
G1 X131.973 Y133.439 E.05978
G1 X131.973 Y133.972
G1 X133.348 Y135.348 E.05978
G1 X133.348 Y135.881
G1 X131.973 Y134.506 E.05978
G1 X131.973 Y135.039
G1 X133.348 Y136.414 E.05978
G1 X133.076 Y136.676
G1 X131.973 Y135.572 E.04795
G1 X131.973 Y136.105
G1 X132.543 Y136.676 E.02477
M204 S10000
G1 X130.978 Y132.977 F30000
M204 S2000
G1 F1969
G1 X131.528 Y133.528 E.02391
G1 X131.528 Y134.061
M73 P72 R5
G1 X130.445 Y132.977 E.04708
G1 X129.911 Y132.977
G1 X131.528 Y134.594 E.07025
G1 X131.528 Y135.127
G1 X129.378 Y132.977 E.09343
G1 X128.845 Y132.977
G1 X131.528 Y135.661 E.1166
G1 X131.528 Y136.194
G1 X128.448 Y133.114 E.13382
G1 X128.448 Y133.648
G1 X131.528 Y136.727 E.13382
G1 X131.35 Y137.083
G1 X128.448 Y134.181 E.12609
G1 X128.448 Y134.714
G1 X130.817 Y137.083 E.10292
G1 X130.284 Y137.083
G1 X128.448 Y135.248 E.07974
G1 X128.448 Y135.781
G1 X129.75 Y137.083 E.05657
G1 X129.217 Y137.083
G1 X128.448 Y136.314 E.0334
M204 S10000
G1 X128.004 Y133.736 F30000
M204 S2000
G1 F1969
G1 X127.652 Y133.384 E.01528
G1 X127.119 Y133.384
G1 X128.004 Y134.269 E.03846
G1 X128.004 Y134.803
G1 X126.645 Y133.444 E.05904
G1 X126.645 Y133.977
G1 X128.004 Y135.336 E.05904
G1 X128.004 Y135.869
G1 X126.645 Y134.511 E.05904
G1 X126.645 Y135.044
G1 X128.004 Y136.403 E.05904
G1 X127.743 Y136.676
G1 X126.645 Y135.577 E.04773
G1 X126.645 Y136.111
G1 X127.21 Y136.676 E.02455
M204 S10000
; WIPE_START
G1 F24000
G1 X126.645 Y136.111 E-.30364
G1 X126.645 Y135.577 E-.20264
G1 X127.117 Y136.049 E-.25372
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I1.213 J.103 P1  F30000
G1 X128.226 Y122.958 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1969
G1 X126.423 Y122.958 E.05982
G1 X126.423 Y119.102 E.12791
G1 X128.226 Y119.102 E.05982
G1 X128.226 Y122.898 E.12592
; WIPE_START
G1 F24000
G1 X126.423 Y122.958 E-.68565
G1 X126.423 Y122.762 E-.07435
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-.033 J1.217 P1  F30000
G1 X133.571 Y122.958 Z13.4
G1 Z13
G1 E.8 F1800
G1 F1969
G1 X131.75 Y122.958 E.06039
G1 X131.75 Y119.102 E.12791
G1 X133.571 Y119.102 E.06039
G1 X133.571 Y122.898 E.12592
G1 X133.885 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1969
G1 X126.106 Y123.35 E.23904
G1 X126.031 Y123.35 E.0023
G1 X126.031 Y118.71 E.14257
G1 X126.106 Y118.71 E.0023
G1 X133.885 Y118.71 E.23904
G1 X133.963 Y118.71 E.00239
G1 X133.963 Y123.35 E.14257
G1 X133.945 Y123.35 E.00055
M204 S10000
; WIPE_START
G1 F24000
G1 X131.945 Y123.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I1.191 J.25 P1  F30000
G1 X132.79 Y119.324 Z13.4
G1 Z13
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F1969
G1 X133.348 Y119.883 E.02428
G1 X133.348 Y120.416
G1 X132.256 Y119.324 E.04745
G1 X131.973 Y119.574
G1 X133.348 Y120.95 E.05978
G1 X133.348 Y121.483
G1 X131.973 Y120.107 E.05978
G1 X131.973 Y120.641
G1 X133.348 Y122.016 E.05978
G1 X133.348 Y122.549
G1 X131.973 Y121.174 E.05978
G1 X131.973 Y121.707
G1 X133.001 Y122.736 E.04469
G1 X132.468 Y122.736
G1 X131.973 Y122.24 E.02152
M204 S10000
G1 X133.367 Y122.712 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.12679
G1 F1969
G1 X133.024 Y122.712 E.00234
G1 X130.783 Y118.917 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1969
G1 X131.528 Y119.663 E.03238
G1 X131.528 Y120.196
G1 X130.25 Y118.917 E.05555
G1 X129.716 Y118.917
G1 X131.528 Y120.729 E.07873
G1 X131.528 Y121.262
G1 X129.183 Y118.917 E.1019
G1 X128.65 Y118.917
G1 X131.528 Y121.796 E.12507
G1 X131.528 Y122.329
G1 X128.448 Y119.249 E.13382
G1 X128.448 Y119.783
G1 X131.528 Y122.862 E.13382
G1 X131.275 Y123.143
G1 X128.448 Y120.316 E.12283
G1 X128.448 Y120.849
G1 X130.742 Y123.143 E.09966
G1 X130.209 Y123.143
G1 X128.448 Y121.382 E.07649
G1 X128.448 Y121.916
G1 X129.675 Y123.143 E.05331
G1 X129.142 Y123.143
G1 X128.448 Y122.449 E.03014
M204 S10000
G1 X128.48 Y118.899 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.144585
G1 F1969
G1 X128.48 Y119.087 E.00156
G1 X128.519 Y119.179 E.00083
G1 X127.457 Y119.324 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F1969
G1 X128.004 Y119.871 E.02376
G1 X128.004 Y120.404
G1 X126.924 Y119.324 E.04693
G1 X126.645 Y119.579
G1 X128.004 Y120.938 E.05904
G1 X128.004 Y121.471
G1 X126.645 Y120.112 E.05904
G1 X126.645 Y120.646
G1 X128.004 Y122.004 E.05904
G1 X128.004 Y122.538
G1 X126.645 Y121.179 E.05904
G1 X126.645 Y121.712
G1 X127.668 Y122.736 E.04447
G1 X127.135 Y122.736
G1 X126.645 Y122.245 E.02129
M204 S10000
G1 X128.023 Y122.705 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.1408
G1 F1969
G3 X127.739 Y122.665 I-.093 J-.363 E.00235
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X127.836 Y122.705 E-.27355
G1 X128.023 Y122.705 E-.48645
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/103
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
G3 Z13.4 I-.054 J1.216 P1  F30000
G1 X133.69 Y122.958 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1480
G1 X131.275 Y122.958 E.08011
G1 X131.275 Y119.102 E.12791
G1 X133.69 Y119.102 E.08011
G1 X133.69 Y122.898 E.12592
G1 X134.004 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1480
G1 X130.883 Y123.35 E.09591
G1 X130.883 Y118.71 E.14257
G1 X134.004 Y118.71 E.09591
G1 X134.082 Y118.71 E.00239
G1 X134.082 Y123.35 E.14257
G1 X134.064 Y123.35 E.00055
M204 S10000
; WIPE_START
G1 F24000
G1 X132.064 Y123.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I1.177 J.308 P1  F30000
G1 X132.482 Y121.75 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.542496
G1 F1480
G1 X132.482 Y120.37 E.05621
G1 X132.044 Y122.189 F30000
; LINE_WIDTH: 0.419999
G1 F1480
G1 X132.92 Y122.189 E.02694
G1 X132.92 Y119.871 E.07121
G1 X132.044 Y119.871 E.02694
G1 X132.044 Y122.129 E.06937
G1 X131.667 Y122.566 F30000
G1 F1480
G1 X133.298 Y122.566 E.05011
G1 X133.298 Y119.494 E.09438
G1 X131.667 Y119.494 E.05011
G1 X131.667 Y122.506 E.09254
; WIPE_START
G1 F24000
G1 X131.667 Y120.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-.776 J-.938 P1  F30000
G1 X128.702 Y122.958 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1480
G1 X126.307 Y122.958 E.07944
G1 X126.307 Y119.102 E.12791
G1 X128.702 Y119.102 E.07944
G1 X128.702 Y122.898 E.12592
G1 X129.094 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1480
G1 X125.99 Y123.35 E.09538
G1 X125.915 Y123.35 E.0023
G1 X125.915 Y118.71 E.14257
G1 X125.99 Y118.71 E.0023
G1 X129.094 Y118.71 E.09538
G1 X129.094 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X127.094 Y123.329 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I1.177 J.308 P1  F30000
G1 X127.504 Y121.76 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522476
G1 F1480
G1 X127.504 Y120.36 E.05474
G1 X127.933 Y122.189 F30000
; LINE_WIDTH: 0.419999
G1 F1480
G1 X127.933 Y119.871 E.07121
G1 X127.076 Y119.871 E.02632
G1 X127.076 Y122.189 E.07121
G1 X127.873 Y122.189 E.02448
G1 X128.31 Y122.566 F30000
G1 F1480
G1 X128.31 Y119.494 E.09438
G1 X126.699 Y119.494 E.0495
G1 X126.699 Y122.566 E.09438
G1 X128.25 Y122.566 E.04765
; WIPE_START
G1 F24000
G1 X126.699 Y122.566 E-.5893
G1 X126.699 Y122.117 E-.1707
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-1.197 J.217 P1  F30000
G1 X128.702 Y133.162 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1480
G1 X128.702 Y136.898 E.12392
G1 X126.307 Y136.898 E.07944
G1 X126.307 Y133.162 E.12392
G1 X128.642 Y133.162 E.07745
G1 X129.094 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1480
M73 P73 R5
G1 X129.094 Y137.29 E.13889
G1 X125.99 Y137.29 E.09538
G1 X125.915 Y137.29 E.0023
G1 X125.915 Y132.77 E.13889
G1 X125.99 Y132.77 E.0023
G1 X129.034 Y132.77 E.09354
M204 S10000
; WIPE_START
G1 F24000
G1 X129.06 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-.625 J-1.044 P1  F30000
G1 X127.504 Y135.7 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522476
G1 F1480
G1 X127.504 Y134.42 E.05005
G1 X127.933 Y133.931 F30000
; LINE_WIDTH: 0.419999
G1 F1480
G1 X127.076 Y133.931 E.02632
G1 X127.076 Y136.129 E.06752
G1 X127.933 Y136.129 E.02632
G1 X127.933 Y133.991 E.06568
G1 X128.31 Y133.554 F30000
G1 F1480
G1 X126.699 Y133.554 E.0495
G1 X126.699 Y136.506 E.0907
G1 X128.31 Y136.506 E.0495
G1 X128.31 Y133.614 E.08885
; WIPE_START
G1 F24000
G1 X128.31 Y135.614 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I.776 J.938 P1  F30000
G1 X131.275 Y133.162 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1480
G1 X133.69 Y133.162 E.08011
G1 X133.69 Y136.898 E.12392
G1 X131.275 Y136.898 E.08011
G1 X131.275 Y133.222 E.12193
G1 X130.883 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1480
G1 X134.004 Y132.77 E.09591
G1 X134.082 Y132.77 E.00239
G1 X134.082 Y137.29 E.13889
G1 X134.004 Y137.29 E.00239
G1 X130.883 Y137.29 E.09591
G1 X130.883 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X132.882 Y132.792 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-1.206 J-.166 P1  F30000
G1 X132.482 Y135.69 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.542496
G1 F1480
G1 X132.482 Y134.43 E.05133
G1 X132.044 Y133.931 F30000
; LINE_WIDTH: 0.419999
G1 F1480
G1 X132.044 Y136.129 E.06752
G1 X132.92 Y136.129 E.02694
G1 X132.92 Y133.931 E.06752
G1 X132.104 Y133.931 E.02509
G1 X131.667 Y133.554 F30000
G1 F1480
G1 X131.667 Y136.506 E.0907
G1 X133.298 Y136.506 E.05011
G1 X133.298 Y133.554 E.0907
G1 X131.727 Y133.554 E.04827
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.298 Y133.554 E-.59691
G1 X133.298 Y133.983 E-.16309
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/103
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
G3 Z13.6 I1.216 J.056 P1  F30000
G1 X133.808 Y122.958 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1330
G1 X131.792 Y122.958 E.06688
G1 X131.792 Y119.102 E.12791
G1 X133.808 Y119.102 E.06688
G1 X133.808 Y122.898 E.12592
G1 X134.123 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1330
G1 X131.4 Y123.35 E.08365
G1 X131.4 Y118.71 E.14257
G1 X134.123 Y118.71 E.08365
G1 X134.201 Y118.71 E.00239
G1 X134.201 Y123.35 E.14257
G1 X134.183 Y123.35 E.00055
M204 S10000
; WIPE_START
G1 F24000
G1 X132.183 Y123.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I1.217 J.003 P1  F30000
G1 X132.184 Y122.566 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1330
G1 X133.416 Y122.566 E.03785
G1 X133.416 Y119.494 E.09438
G1 X132.184 Y119.494 E.03785
G1 X132.184 Y122.506 E.09254
G1 X132.587 Y122.164 F30000
; LINE_WIDTH: 0.47036
G1 F1330
G1 X133.014 Y122.164 E.01489
G1 X133.014 Y119.896 E.07897
G1 X132.587 Y119.896 E.01489
G1 X132.587 Y122.104 E.07688
; WIPE_START
G1 F24000
G1 X132.587 Y120.104 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-.663 J-1.021 P1  F30000
G1 X128.189 Y122.958 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1330
G1 X126.191 Y122.958 E.06629
G1 X126.191 Y119.102 E.12791
G1 X128.189 Y119.102 E.06629
G1 X128.189 Y122.898 E.12592
G1 X128.581 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1330
G1 X125.874 Y123.35 E.0832
G1 X125.799 Y123.35 E.0023
G1 X125.799 Y118.71 E.14257
G1 X125.874 Y118.71 E.0023
G1 X128.581 Y118.71 E.0832
G1 X128.581 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X126.582 Y123.334 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I.65 J1.029 P1  F30000
G1 X127.797 Y122.566 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1330
G1 X127.797 Y119.494 E.09438
G1 X126.583 Y119.494 E.03731
G1 X126.583 Y122.566 E.09438
G1 X127.737 Y122.566 E.03546
G1 X127.399 Y122.168 F30000
; LINE_WIDTH: 0.461449
G1 F1330
G1 X127.399 Y119.892 E.07763
G1 X126.981 Y119.892 E.01427
G1 X126.981 Y122.168 E.07763
G1 X127.339 Y122.168 E.01223
; WIPE_START
G1 F24000
G1 X126.981 Y122.168 E-.13624
G1 X126.981 Y120.527 E-.62376
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-1.211 J.116 P1  F30000
G1 X128.189 Y133.162 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1330
G1 X128.189 Y136.898 E.12392
G1 X126.191 Y136.898 E.06629
G1 X126.191 Y133.162 E.12392
G1 X128.129 Y133.162 E.0643
G1 X128.581 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1330
G1 X128.581 Y137.29 E.13889
G1 X125.874 Y137.29 E.0832
G1 X125.799 Y137.29 E.0023
G1 X125.799 Y132.77 E.13889
G1 X125.874 Y132.77 E.0023
G1 X128.521 Y132.77 E.08135
M204 S10000
; WIPE_START
G1 F24000
G1 X128.548 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I1.035 J-.639 P1  F30000
G1 X127.797 Y133.554 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1330
G1 X126.583 Y133.554 E.03731
G1 X126.583 Y136.506 E.0907
G1 X127.797 Y136.506 E.03731
G1 X127.797 Y133.614 E.08885
G1 X127.399 Y133.952 F30000
; LINE_WIDTH: 0.461449
G1 F1330
G1 X126.981 Y133.952 E.01427
G1 X126.981 Y136.108 E.07353
G1 X127.399 Y136.108 E.01427
G1 X127.399 Y134.012 E.07149
; WIPE_START
G1 F24000
G1 X127.399 Y136.012 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I.662 J1.021 P1  F30000
G1 X131.792 Y133.162 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1330
G1 X133.808 Y133.162 E.06688
G1 X133.808 Y136.898 E.12392
G1 X131.792 Y136.898 E.06688
G1 X131.792 Y133.222 E.12193
G1 X131.4 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1330
G1 X134.123 Y132.77 E.08365
G1 X134.201 Y132.77 E.00239
G1 X134.201 Y137.29 E.13889
G1 X134.123 Y137.29 E.00239
G1 X131.4 Y137.29 E.08365
G1 X131.4 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X133.4 Y132.786 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P74 R5
G3 Z13.8 I-.65 J-1.029 P1  F30000
G1 X132.184 Y133.554 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1330
G1 X132.184 Y136.506 E.0907
G1 X133.416 Y136.506 E.03785
G1 X133.416 Y133.554 E.0907
G1 X132.244 Y133.554 E.03601
G1 X132.587 Y133.956 F30000
; LINE_WIDTH: 0.47036
G1 F1330
G1 X132.587 Y136.104 E.07479
G1 X133.014 Y136.104 E.01489
G1 X133.014 Y133.956 E.07479
G1 X132.647 Y133.956 E.0128
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X133.014 Y133.956 E-.13963
G1 X133.014 Y135.589 E-.62037
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/103
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
G3 Z13.8 I1.214 J.088 P1  F30000
G1 X133.927 Y122.958 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1294
G1 X132.111 Y122.958 E.06026
G1 X132.111 Y119.102 E.12791
G1 X133.927 Y119.102 E.06026
G1 X133.927 Y122.898 E.12592
G1 X134.242 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1294
G1 X131.719 Y123.35 E.07752
G1 X131.719 Y118.71 E.14257
G1 X134.242 Y118.71 E.07752
G1 X134.319 Y118.71 E.00239
G1 X134.319 Y123.35 E.14257
G1 X134.302 Y123.35 E.00055
M204 S10000
; WIPE_START
G1 F24000
G1 X132.302 Y123.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I1.179 J.302 P1  F30000
G1 X132.503 Y122.566 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1294
G1 X133.535 Y122.566 E.03173
G1 X133.535 Y119.494 E.09438
G1 X132.503 Y119.494 E.03173
G1 X132.503 Y122.506 E.09254
G1 X132.855 Y122.213 F30000
; LINE_WIDTH: 0.370646
M73 P74 R4
G1 F1294
G1 X133.183 Y122.213 E.00875
G1 X133.183 Y119.847 E.06321
G1 X132.855 Y119.847 E.00875
G1 X132.855 Y122.153 E.06161
; WIPE_START
G1 F24000
G1 X132.855 Y120.153 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-.599 J-1.059 P1  F30000
G1 X127.894 Y122.958 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1294
G1 X126.075 Y122.958 E.06032
G1 X126.075 Y119.102 E.12791
G1 X127.894 Y119.102 E.06032
G1 X127.894 Y122.898 E.12592
G1 X128.286 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1294
G1 X125.758 Y123.35 E.07767
G1 X125.683 Y123.35 E.0023
G1 X125.683 Y118.71 E.14257
G1 X125.758 Y118.71 E.0023
G1 X128.286 Y118.71 E.07767
G1 X128.286 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X126.286 Y123.337 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I.652 J1.027 P1  F30000
G1 X127.502 Y122.566 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1294
G1 X127.502 Y119.494 E.09438
G1 X126.467 Y119.494 E.03178
G1 X126.467 Y122.566 E.09438
G1 X127.442 Y122.566 E.02994
G1 X127.149 Y122.213 F30000
; LINE_WIDTH: 0.371574
G1 F1294
G1 X127.149 Y119.847 E.06336
G1 X126.82 Y119.847 E.0088
G1 X126.82 Y122.213 E.06336
G1 X127.089 Y122.213 E.00719
; WIPE_START
G1 F24000
G1 X126.82 Y122.213 E-.10209
G1 X126.82 Y120.482 E-.65791
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-1.213 J.103 P1  F30000
G1 X127.894 Y133.162 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1294
G1 X127.894 Y136.898 E.12392
G1 X126.075 Y136.898 E.06032
G1 X126.075 Y133.162 E.12392
G1 X127.834 Y133.162 E.05833
G1 X128.286 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1294
G1 X128.286 Y137.29 E.13889
G1 X125.758 Y137.29 E.07767
G1 X125.683 Y137.29 E.0023
G1 X125.683 Y132.77 E.13889
G1 X125.758 Y132.77 E.0023
G1 X128.226 Y132.77 E.07583
M204 S10000
; WIPE_START
G1 F24000
G1 X128.252 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I1.035 J-.639 P1  F30000
G1 X127.502 Y133.554 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1294
G1 X126.467 Y133.554 E.03178
G1 X126.467 Y136.506 E.0907
G1 X127.502 Y136.506 E.03178
G1 X127.502 Y133.614 E.08885
G1 X127.149 Y133.907 F30000
; LINE_WIDTH: 0.371574
G1 F1294
G1 X126.82 Y133.907 E.0088
G1 X126.82 Y136.153 E.06015
G1 X127.149 Y136.153 E.0088
G1 X127.149 Y133.967 E.05854
; WIPE_START
G1 F24000
G1 X127.149 Y135.967 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I.599 J1.059 P1  F30000
G1 X132.111 Y133.162 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1294
G1 X133.927 Y133.162 E.06026
G1 X133.927 Y136.898 E.12392
G1 X132.111 Y136.898 E.06026
G1 X132.111 Y133.222 E.12193
G1 X131.719 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1294
G1 X134.242 Y132.77 E.07752
G1 X134.319 Y132.77 E.00239
G1 X134.319 Y137.29 E.13889
G1 X134.242 Y137.29 E.00239
G1 X131.719 Y137.29 E.07752
G1 X131.719 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X133.718 Y132.782 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-.652 J-1.027 P1  F30000
G1 X132.503 Y133.554 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1294
G1 X132.503 Y136.506 E.0907
G1 X133.535 Y136.506 E.03173
G1 X133.535 Y133.554 E.0907
G1 X132.563 Y133.554 E.02988
G1 X132.855 Y133.907 F30000
; LINE_WIDTH: 0.370646
G1 F1294
G1 X132.855 Y136.153 E.06
G1 X133.183 Y136.153 E.00875
G1 X133.183 Y133.907 E.06
G1 X132.915 Y133.907 E.00715
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.183 Y133.907 E-.10174
G1 X133.183 Y135.639 E-.65826
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/103
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
G3 Z14 I1.214 J.078 P1  F30000
G1 X133.999 Y122.958 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X132.35 Y122.958 E.0547
G1 X132.35 Y119.102 E.12791
G1 X133.999 Y119.102 E.0547
G1 X133.999 Y122.898 E.12592
G1 X134.36 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X131.958 Y123.35 E.07381
G1 X131.958 Y118.71 E.14257
G1 X134.36 Y118.71 E.07381
G1 X134.391 Y118.71 E.00095
G1 X134.391 Y123.321 E.14168
M204 S10000
; WIPE_START
G1 F24000
G1 X132.392 Y123.345 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I1.11 J.5 P1  F30000
G1 X132.743 Y122.566 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
M73 P75 R4
G1 F1200
G1 X133.607 Y122.566 E.02657
G1 X133.607 Y119.494 E.09438
G1 X132.743 Y119.494 E.02657
G1 X132.743 Y122.506 E.09254
G1 X133.175 Y122.133 F30000
; LINE_WIDTH: 0.530538
G1 F1200
G1 X133.175 Y119.987 E.08531
; WIPE_START
G1 F24000
G1 X133.175 Y121.987 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-.21 J-1.199 P1  F30000
G1 X127.621 Y122.958 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.981 Y122.958 E.05437
G1 X125.981 Y119.102 E.12791
G1 X127.621 Y119.102 E.05437
G1 X127.621 Y122.898 E.12592
G1 X128.013 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.642 Y123.35 E.07285
G1 X125.589 Y123.35 E.00162
G1 X125.589 Y118.71 E.14257
G1 X125.642 Y118.71 E.00162
G1 X128.013 Y118.71 E.07285
G1 X128.013 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X126.013 Y123.341 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I.654 J1.026 P1  F30000
G1 X127.229 Y122.566 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X127.229 Y119.494 E.09438
G1 X126.374 Y119.494 E.02627
G1 X126.374 Y122.566 E.09438
G1 X127.169 Y122.566 E.02443
G1 X126.801 Y122.138 F30000
; LINE_WIDTH: 0.52083
G1 F1200
G1 X126.801 Y119.982 E.08399
; WIPE_START
G1 F24000
G1 X126.801 Y121.982 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-1.214 J.089 P1  F30000
G1 X127.621 Y133.162 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X127.621 Y136.898 E.12392
G1 X125.981 Y136.898 E.05437
G1 X125.981 Y133.162 E.12392
G1 X127.561 Y133.162 E.05238
G1 X128.013 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X128.013 Y137.29 E.13889
G1 X125.642 Y137.29 E.07285
G1 X125.589 Y137.29 E.00162
G1 X125.589 Y132.77 E.13889
G1 X125.642 Y132.77 E.00162
G1 X127.953 Y132.77 E.071
M204 S10000
; WIPE_START
G1 F24000
G1 X127.979 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I1.035 J-.639 P1  F30000
G1 X127.229 Y133.554 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X126.374 Y133.554 E.02627
G1 X126.374 Y136.506 E.0907
G1 X127.229 Y136.506 E.02627
G1 X127.229 Y133.614 E.08885
G1 X126.801 Y136.078 F30000
; LINE_WIDTH: 0.52083
G1 F1200
G1 X126.801 Y134.042 E.07932
; WIPE_START
G1 F24000
G1 X126.801 Y136.042 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I.561 J1.08 P1  F30000
G1 X132.35 Y133.162 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.999 Y133.162 E.0547
G1 X133.999 Y136.898 E.12392
G1 X132.35 Y136.898 E.0547
G1 X132.35 Y133.222 E.12193
G1 X131.958 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X134.36 Y132.77 E.07381
G1 X134.391 Y132.77 E.00095
G1 X134.391 Y137.29 E.13889
G1 X134.36 Y137.29 E.00095
G1 X131.958 Y137.29 E.07381
G1 X131.958 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X133.958 Y132.78 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-.654 J-1.026 P1  F30000
G1 X132.743 Y133.554 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X132.743 Y136.506 E.0907
G1 X133.607 Y136.506 E.02657
G1 X133.607 Y133.554 E.0907
G1 X132.803 Y133.554 E.02473
G1 X133.175 Y136.073 F30000
; LINE_WIDTH: 0.530536
G1 F1200
G1 X133.175 Y134.047 E.08054
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.175 Y136.047 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/103
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
G3 Z14.2 I1.216 J-.058 P1  F30000
G1 X132.55 Y122.958 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X132.55 Y119.102 E.12791
G1 X134.066 Y119.102 E.05027
G1 X134.066 Y122.958 E.12791
G1 X132.61 Y122.958 E.04828
G1 X132.158 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X132.158 Y118.71 E.14257
G1 X134.432 Y118.71 E.06987
G1 X134.458 Y118.71 E.00079
G1 X134.458 Y123.35 E.14257
G1 X134.432 Y123.35 E.00079
G1 X132.218 Y123.35 E.06803
M204 S10000
; WIPE_START
G1 F24000
G1 X132.192 Y121.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-1.036 J.639 P1  F30000
G1 X132.943 Y122.566 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X133.674 Y122.566 E.02247
G1 X133.674 Y119.494 E.09438
G1 X132.943 Y119.494 E.02247
G1 X132.943 Y122.506 E.09254
G1 X133.308 Y122.2 F30000
; LINE_WIDTH: 0.397204
G1 F1200
G1 X133.308 Y119.92 E.06583
; WIPE_START
G1 F24000
G1 X133.308 Y121.92 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-.212 J-1.198 P1  F30000
G1 X127.451 Y122.958 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.922 Y122.958 E.05072
G1 X125.922 Y119.102 E.12791
G1 X127.451 Y119.102 E.05072
G1 X127.451 Y122.898 E.12592
G1 X127.843 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.548 Y123.35 E.07052
G1 X125.53 Y123.35 E.00057
G1 X125.53 Y118.71 E.14257
G1 X125.548 Y118.71 E.00057
G1 X127.843 Y118.71 E.07052
G1 X127.843 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X125.844 Y123.342 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I.655 J1.026 P1  F30000
G1 X127.059 Y122.566 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X127.059 Y119.494 E.09438
G1 X126.314 Y119.494 E.02289
G1 X126.314 Y122.566 E.09438
G1 X126.999 Y122.566 E.02105
G1 X126.687 Y122.193 F30000
; LINE_WIDTH: 0.410826
G1 F1200
G1 X126.687 Y119.927 E.06795
; WIPE_START
G1 F24000
G1 X126.687 Y121.927 E-.76
; WIPE_END
M73 P76 R4
G1 E-.04 F1800
G17
G3 Z14.4 I-1.214 J.083 P1  F30000
G1 X127.451 Y133.162 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X127.451 Y136.898 E.12392
G1 X125.922 Y136.898 E.05072
G1 X125.922 Y133.162 E.12392
G1 X127.391 Y133.162 E.04873
G1 X127.843 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X127.843 Y137.29 E.13889
G1 X125.548 Y137.29 E.07052
G1 X125.53 Y137.29 E.00057
G1 X125.53 Y132.77 E.13889
G1 X125.548 Y132.77 E.00057
G1 X127.783 Y132.77 E.06867
M204 S10000
; WIPE_START
G1 F24000
G1 X127.81 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I1.035 J-.639 P1  F30000
G1 X127.059 Y133.554 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X126.314 Y133.554 E.02289
G1 X126.314 Y136.506 E.0907
G1 X127.059 Y136.506 E.02289
G1 X127.059 Y133.614 E.08885
G1 X126.687 Y136.133 F30000
; LINE_WIDTH: 0.410826
G1 F1200
G1 X126.687 Y133.987 E.06436
; WIPE_START
G1 F24000
G1 X126.687 Y135.987 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I.528 J1.096 P1  F30000
G1 X132.55 Y133.162 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.066 Y133.162 E.05027
G1 X134.066 Y136.898 E.12392
G1 X132.55 Y136.898 E.05027
G1 X132.55 Y133.222 E.12193
G1 X132.158 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X134.432 Y132.77 E.06987
G1 X134.458 Y132.77 E.00079
G1 X134.458 Y137.29 E.13889
G1 X134.432 Y137.29 E.00079
G1 X132.158 Y137.29 E.06987
G1 X132.158 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X134.158 Y132.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-.656 J-1.025 P1  F30000
G1 X132.943 Y133.554 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X132.943 Y136.506 E.0907
G1 X133.674 Y136.506 E.02247
G1 X133.674 Y133.554 E.0907
G1 X133.003 Y133.554 E.02063
G1 X133.308 Y136.14 F30000
; LINE_WIDTH: 0.397204
G1 F1200
G1 X133.308 Y133.98 E.06237
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.308 Y135.98 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/103
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
G3 Z14.4 I1.216 J-.056 P1  F30000
G1 X132.705 Y122.958 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X132.705 Y119.102 E.12791
G1 X134.133 Y119.102 E.04734
G1 X134.133 Y122.958 E.12791
G1 X132.765 Y122.958 E.04535
G1 X132.313 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X132.313 Y118.71 E.14257
G1 X134.499 Y118.71 E.06716
G1 X134.525 Y118.71 E.00079
G1 X134.525 Y123.35 E.14257
G1 X134.499 Y123.35 E.00079
G1 X132.373 Y123.35 E.06532
M204 S10000
; WIPE_START
G1 F24000
G1 X132.348 Y121.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-.992 J.705 P1  F30000
G1 X133.164 Y122.499 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.552973
G1 F1200
G1 X133.674 Y122.499 E.0212
G1 X133.674 Y119.561 E.12214
G1 X133.164 Y119.561 E.0212
G1 X133.164 Y122.439 E.11965
; WIPE_START
G1 F24000
G1 X133.164 Y120.439 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-.479 J-1.119 P1  F30000
G1 X127.282 Y122.958 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.863 Y122.958 E.04708
G1 X125.863 Y119.102 E.12791
G1 X127.282 Y119.102 E.04708
G1 X127.282 Y122.898 E.12592
G1 X127.674 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.489 Y123.35 E.06714
G1 X125.471 Y123.35 E.00057
G1 X125.471 Y118.71 E.14257
G1 X125.489 Y118.71 E.00057
G1 X127.674 Y118.71 E.06714
G1 X127.674 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X125.675 Y123.345 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I.72 J.981 P1  F30000
G1 X126.825 Y122.501 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54895
G1 F1200
G1 X126.825 Y119.559 E.12134
G1 X126.319 Y119.559 E.02087
G1 X126.319 Y122.501 E.12134
G1 X126.765 Y122.501 E.01839
; WIPE_START
G1 F24000
G1 X126.319 Y122.501 E-.16949
G1 X126.319 Y120.947 E-.59051
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-1.213 J.096 P1  F30000
G1 X127.282 Y133.162 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X127.282 Y136.898 E.12392
G1 X125.863 Y136.898 E.04708
G1 X125.863 Y133.162 E.12392
G1 X127.222 Y133.162 E.04509
G1 X127.674 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X127.674 Y137.29 E.13889
G1 X125.489 Y137.29 E.06714
G1 X125.471 Y137.29 E.00057
G1 X125.471 Y132.77 E.13889
G1 X125.489 Y132.77 E.00057
G1 X127.614 Y132.77 E.06529
M204 S10000
; WIPE_START
G1 F24000
G1 X127.64 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I.993 J-.703 P1  F30000
G1 X126.825 Y133.619 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.54895
G1 F1200
G1 X126.319 Y133.619 E.02087
G1 X126.319 Y136.441 E.1164
G1 X126.825 Y136.441 E.02087
G1 X126.825 Y133.679 E.11392
; WIPE_START
G1 F24000
G1 X126.825 Y135.679 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I.479 J1.119 P1  F30000
G1 X132.705 Y133.162 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.133 Y133.162 E.04734
G1 X134.133 Y136.898 E.12392
G1 X132.705 Y136.898 E.04734
G1 X132.705 Y133.222 E.12193
G1 X132.313 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X134.499 Y132.77 E.06716
G1 X134.525 Y132.77 E.00079
G1 X134.525 Y137.29 E.13889
G1 X134.499 Y137.29 E.00079
G1 X132.313 Y137.29 E.06716
G1 X132.313 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X134.313 Y132.775 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-.721 J-.98 P1  F30000
G1 X133.164 Y133.621 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.552973
G1 F1200
G1 X133.164 Y136.439 E.11715
G1 X133.674 Y136.439 E.0212
M73 P77 R4
G1 X133.674 Y133.621 E.11715
G1 X133.224 Y133.621 E.01871
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.674 Y133.621 E-.17102
G1 X133.674 Y135.171 E-.58898
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/103
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
G3 Z14.6 I1.214 J-.084 P1  F30000
G1 X132.831 Y122.958 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X132.831 Y119.102 E.12791
G1 X134.199 Y119.102 E.04539
G1 X134.199 Y122.958 E.12791
G1 X132.891 Y122.958 E.04339
G1 X132.439 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X132.439 Y118.71 E.14257
G1 X134.566 Y118.71 E.06535
G1 X134.591 Y118.71 E.00079
G1 X134.591 Y123.35 E.14257
G1 X134.566 Y123.35 E.00079
G1 X132.499 Y123.35 E.0635
M204 S10000
; WIPE_START
G1 F24000
G1 X132.473 Y121.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-1.002 J.69 P1  F30000
G1 X133.275 Y122.514 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.523472
G1 F1200
G1 X133.755 Y122.514 E.01882
G1 X133.755 Y119.546 E.11623
G1 X133.275 Y119.546 E.01882
G1 X133.275 Y122.454 E.11388
; WIPE_START
G1 F24000
G1 X133.275 Y120.454 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-.461 J-1.126 P1  F30000
G1 X127.156 Y122.958 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.803 Y122.958 E.04488
G1 X125.803 Y119.102 E.12791
G1 X127.156 Y119.102 E.04488
G1 X127.156 Y122.898 E.12592
G1 X127.548 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.43 Y123.35 E.0651
G1 X125.411 Y123.35 E.00057
G1 X125.411 Y118.71 E.14257
G1 X125.43 Y118.71 E.00057
G1 X127.548 Y118.71 E.0651
G1 X127.548 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X125.549 Y123.347 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I.705 J.992 P1  F30000
G1 X126.716 Y122.518 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515804
G1 F1200
G1 X126.716 Y119.542 E.11467
G1 X126.243 Y119.542 E.01822
G1 X126.243 Y122.518 E.11467
G1 X126.656 Y122.518 E.01591
; WIPE_START
G1 F24000
G1 X126.243 Y122.518 E-.1569
G1 X126.243 Y120.931 E-.6031
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-1.214 J.091 P1  F30000
G1 X127.156 Y133.162 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X127.156 Y136.898 E.12392
G1 X125.803 Y136.898 E.04488
G1 X125.803 Y133.162 E.12392
G1 X127.096 Y133.162 E.04289
G1 X127.548 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X127.548 Y137.29 E.13889
G1 X125.43 Y137.29 E.0651
G1 X125.411 Y137.29 E.00057
G1 X125.411 Y132.77 E.13889
G1 X125.43 Y132.77 E.00057
G1 X127.488 Y132.77 E.06326
M204 S10000
; WIPE_START
G1 F24000
G1 X127.515 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I1.005 J-.687 P1  F30000
G1 X126.716 Y133.602 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.515804
G1 F1200
G1 X126.243 Y133.602 E.01822
G1 X126.243 Y136.458 E.11005
G1 X126.716 Y136.458 E.01822
G1 X126.716 Y133.662 E.10774
; WIPE_START
G1 F24000
G1 X126.716 Y135.662 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I.461 J1.126 P1  F30000
G1 X132.831 Y133.162 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.199 Y133.162 E.04539
G1 X134.199 Y136.898 E.12392
G1 X132.831 Y136.898 E.04539
G1 X132.831 Y133.222 E.12193
G1 X132.439 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X134.566 Y132.77 E.06535
G1 X134.591 Y132.77 E.00079
G1 X134.591 Y137.29 E.13889
G1 X134.566 Y137.29 E.00079
G1 X132.439 Y137.29 E.06535
G1 X132.439 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X134.438 Y132.774 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-.708 J-.99 P1  F30000
G1 X133.275 Y133.606 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.523472
G1 F1200
G1 X133.275 Y136.454 E.11153
G1 X133.755 Y136.454 E.01882
G1 X133.755 Y133.606 E.11153
G1 X133.335 Y133.606 E.01647
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X133.755 Y133.606 E-.15981
G1 X133.755 Y135.185 E-.60019
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/103
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
G3 Z14.8 I1.214 J-.08 P1  F30000
G1 X132.949 Y122.958 Z14.8
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X132.949 Y119.102 E.12791
G1 X134.266 Y119.102 E.04369
G1 X134.266 Y122.958 E.12791
G1 X133.009 Y122.958 E.0417
G1 X132.557 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X132.557 Y118.71 E.14257
G1 X134.632 Y118.71 E.06377
G1 X134.658 Y118.71 E.00079
G1 X134.658 Y123.35 E.14257
G1 X134.632 Y123.35 E.00079
G1 X132.617 Y123.35 E.06193
M204 S10000
; WIPE_START
G1 F24000
G1 X132.591 Y121.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-1.011 J.678 P1  F30000
G1 X133.38 Y122.527 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.497883
G1 F1200
G1 X133.835 Y122.527 E.01687
G1 X133.835 Y119.533 E.11099
G1 X133.38 Y119.533 E.01687
G1 X133.38 Y122.467 E.10877
; WIPE_START
G1 F24000
G1 X133.38 Y120.467 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-.446 J-1.132 P1  F30000
G1 X127.058 Y122.958 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.744 Y122.958 E.0436
G1 X125.744 Y119.102 E.12791
G1 X127.058 Y119.102 E.0436
G1 X127.058 Y122.898 E.12592
G1 X127.45 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.37 Y123.35 E.06392
G1 X125.352 Y123.35 E.00057
G1 X125.352 Y118.71 E.14257
G1 X125.37 Y118.71 E.00057
G1 X127.45 Y118.71 E.06392
G1 X127.45 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X125.451 Y123.348 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I.696 J.998 P1  F30000
G1 X126.628 Y122.528 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.496611
G1 F1200
G1 X126.628 Y119.532 E.11073
M73 P78 R4
G1 X126.174 Y119.532 E.01677
G1 X126.174 Y122.528 E.11073
G1 X126.568 Y122.528 E.01455
; WIPE_START
G1 F24000
G1 X126.174 Y122.528 E-.1496
G1 X126.174 Y120.921 E-.6104
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-1.214 J.088 P1  F30000
G1 X127.058 Y133.162 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X127.058 Y136.898 E.12392
G1 X125.744 Y136.898 E.0436
G1 X125.744 Y133.162 E.12392
G1 X126.998 Y133.162 E.04161
G1 X127.45 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X127.45 Y137.29 E.13889
G1 X125.37 Y137.29 E.06392
G1 X125.352 Y137.29 E.00057
G1 X125.352 Y132.77 E.13889
G1 X125.37 Y132.77 E.00057
G1 X127.39 Y132.77 E.06208
M204 S10000
; WIPE_START
G1 F24000
G1 X127.417 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I1.011 J-.677 P1  F30000
G1 X126.628 Y133.592 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.496611
G1 F1200
G1 X126.174 Y133.592 E.01677
G1 X126.174 Y136.468 E.10629
G1 X126.628 Y136.468 E.01677
G1 X126.628 Y133.652 E.10407
; WIPE_START
G1 F24000
G1 X126.628 Y135.652 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I.446 J1.132 P1  F30000
G1 X132.949 Y133.162 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.266 Y133.162 E.04369
G1 X134.266 Y136.898 E.12392
G1 X132.949 Y136.898 E.04369
G1 X132.949 Y133.222 E.12193
G1 X132.557 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X134.632 Y132.77 E.06377
G1 X134.658 Y132.77 E.00079
G1 X134.658 Y137.29 E.13889
G1 X134.632 Y137.29 E.00079
G1 X132.557 Y137.29 E.06377
G1 X132.557 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X134.556 Y132.772 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-.697 J-.998 P1  F30000
G1 X133.38 Y133.593 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.497883
G1 F1200
G1 X133.38 Y136.467 E.10654
G1 X133.835 Y136.467 E.01687
G1 X133.835 Y133.593 E.10654
G1 X133.44 Y133.593 E.01464
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.835 Y133.593 E-.15009
G1 X133.835 Y135.198 E-.60991
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/103
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
G3 Z15 I1.214 J-.081 P1  F30000
G1 X133.019 Y122.958 Z15
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.019 Y119.102 E.12791
G1 X134.296 Y119.102 E.04235
G1 X134.296 Y122.958 E.12791
G1 X133.079 Y122.958 E.04036
G1 X132.627 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X132.627 Y118.71 E.14257
G1 X134.688 Y118.71 E.06332
G1 X134.688 Y123.35 E.14257
G1 X132.687 Y123.35 E.06148
M204 S10000
; WIPE_START
G1 F24000
G1 X132.661 Y121.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-1.017 J.668 P1  F30000
G1 X133.44 Y122.537 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477686
G1 F1200
G1 X133.875 Y122.537 E.0154
G1 X133.875 Y119.523 E.10678
G1 X133.44 Y119.523 E.0154
G1 X133.44 Y122.477 E.10465
; WIPE_START
G1 F24000
G1 X133.44 Y120.477 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-.435 J-1.136 P1  F30000
G1 X126.961 Y122.958 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.685 Y122.958 E.04233
G1 X125.685 Y119.102 E.12791
G1 X126.961 Y119.102 E.04233
G1 X126.961 Y122.898 E.12592
G1 X127.353 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.311 Y123.35 E.06274
G1 X125.292 Y123.35 E.00057
G1 X125.292 Y118.71 E.14257
G1 X125.311 Y118.71 E.00057
G1 X127.353 Y118.71 E.06274
G1 X127.353 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X125.354 Y123.349 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I.687 J1.004 P1  F30000
G1 X126.54 Y122.537 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477418
G1 F1200
G1 X126.54 Y119.523 E.10672
G1 X126.105 Y119.523 E.01538
G1 X126.105 Y122.537 E.10672
G1 X126.48 Y122.537 E.01326
; WIPE_START
G1 F24000
G1 X126.105 Y122.537 E-.14231
G1 X126.105 Y120.912 E-.61769
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-1.214 J.085 P1  F30000
G1 X126.961 Y133.162 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.961 Y136.898 E.12392
G1 X125.685 Y136.898 E.04233
G1 X125.685 Y133.162 E.12392
G1 X126.901 Y133.162 E.04034
G1 X127.353 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X127.353 Y137.29 E.13889
G1 X125.311 Y137.29 E.06274
G1 X125.292 Y137.29 E.00057
G1 X125.292 Y132.77 E.13889
G1 X125.311 Y132.77 E.00057
G1 X127.293 Y132.77 E.0609
M204 S10000
; WIPE_START
G1 F24000
G1 X127.319 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I1.017 J-.668 P1  F30000
G1 X126.54 Y133.583 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477418
G1 F1200
G1 X126.105 Y133.583 E.01538
G1 X126.105 Y136.477 E.10247
G1 X126.54 Y136.477 E.01538
G1 X126.54 Y133.643 E.10035
; WIPE_START
G1 F24000
G1 X126.54 Y135.643 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I.435 J1.137 P1  F30000
G1 X133.019 Y133.162 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.296 Y133.162 E.04235
G1 X134.296 Y136.898 E.12392
G1 X133.019 Y136.898 E.04235
G1 X133.019 Y133.222 E.12193
G1 X132.627 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X134.688 Y132.77 E.06332
G1 X134.688 Y137.29 E.13889
G1 X132.627 Y137.29 E.06332
G1 X132.627 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X134.626 Y132.772 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-.687 J-1.005 P1  F30000
G1 X133.44 Y133.583 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.477687
G1 F1200
G1 X133.44 Y136.477 E.10253
M73 P79 R4
G1 X133.875 Y136.477 E.0154
G1 X133.875 Y133.583 E.10253
G1 X133.5 Y133.583 E.01328
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.875 Y133.583 E-.14241
G1 X133.875 Y135.208 E-.61759
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/103
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
G3 Z15.2 I1.214 J-.078 P1  F30000
G1 X133.089 Y122.958 Z15.2
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.089 Y119.102 E.12791
G1 X134.317 Y119.102 E.04074
G1 X134.317 Y122.958 E.12791
G1 X133.149 Y122.958 E.03875
G1 X132.697 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X132.697 Y118.71 E.14257
G1 X134.709 Y118.71 E.06183
G1 X134.709 Y123.35 E.14257
G1 X132.757 Y123.35 E.05999
M204 S10000
; WIPE_START
G1 F24000
G1 X132.731 Y121.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-1.025 J.656 P1  F30000
G1 X133.498 Y122.549 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.453461
G1 F1200
G1 X133.908 Y122.549 E.01373
G1 X133.908 Y119.511 E.10164
G1 X133.498 Y119.511 E.01373
G1 X133.498 Y122.489 E.09963
; WIPE_START
G1 F24000
G1 X133.498 Y120.489 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-.427 J-1.14 P1  F30000
G1 X126.903 Y122.958 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.661 Y122.958 E.04119
G1 X125.661 Y119.102 E.12791
G1 X126.903 Y119.102 E.04119
G1 X126.903 Y122.898 E.12592
G1 X127.295 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.269 Y123.35 E.06225
G1 X125.269 Y118.71 E.14257
G1 X127.295 Y118.71 E.06225
G1 X127.295 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X125.296 Y123.349 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I.679 J1.01 P1  F30000
G1 X126.491 Y122.546 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.460277
G1 F1200
G1 X126.491 Y119.514 E.1031
G1 X126.074 Y119.514 E.01419
G1 X126.074 Y122.546 E.1031
G1 X126.431 Y122.546 E.01215
; WIPE_START
G1 F24000
G1 X126.074 Y122.546 E-.1358
G1 X126.074 Y120.903 E-.6242
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-1.214 J.082 P1  F30000
G1 X126.903 Y133.162 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.903 Y136.898 E.12392
M73 P79 R3
G1 X125.661 Y136.898 E.04119
G1 X125.661 Y133.162 E.12392
G1 X126.843 Y133.162 E.0392
G1 X127.295 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X127.295 Y137.29 E.13889
G1 X125.269 Y137.29 E.06225
G1 X125.269 Y132.77 E.13889
G1 X127.235 Y132.77 E.06041
M204 S10000
; WIPE_START
G1 F24000
G1 X127.262 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I1.023 J-.659 P1  F30000
G1 X126.491 Y133.574 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.460278
G1 F1200
G1 X126.074 Y133.574 E.01419
G1 X126.074 Y136.486 E.09902
G1 X126.491 Y136.486 E.01419
G1 X126.491 Y133.634 E.09697
; WIPE_START
G1 F24000
G1 X126.491 Y135.634 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I.427 J1.14 P1  F30000
G1 X133.089 Y133.162 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.317 Y133.162 E.04074
G1 X134.317 Y136.898 E.12392
G1 X133.089 Y136.898 E.04074
G1 X133.089 Y133.222 E.12193
G1 X132.697 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X134.709 Y132.77 E.06183
G1 X134.709 Y137.29 E.13889
G1 X132.697 Y137.29 E.06183
G1 X132.697 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X134.696 Y132.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-.676 J-1.012 P1  F30000
G1 X133.498 Y133.571 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.453461
G1 F1200
G1 X133.498 Y136.489 E.09763
G1 X133.908 Y136.489 E.01373
G1 X133.908 Y133.571 E.09763
G1 X133.558 Y133.571 E.01173
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.908 Y133.571 E-.13321
G1 X133.908 Y135.22 E-.62679
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 76/103
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
G3 Z15.4 I1.215 J-.076 P1  F30000
G1 X133.14 Y122.958 Z15.4
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.14 Y119.102 E.12791
G1 X134.339 Y119.102 E.03975
G1 X134.339 Y122.958 E.12791
G1 X133.2 Y122.958 E.03776
G1 X132.748 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X132.748 Y118.71 E.14257
G1 X134.731 Y118.71 E.06092
G1 X134.731 Y123.35 E.14257
G1 X132.808 Y123.35 E.05907
M204 S10000
; WIPE_START
G1 F24000
G1 X132.782 Y121.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-1.03 J.648 P1  F30000
G1 X133.542 Y122.557 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.438554
G1 F1200
G1 X133.937 Y122.557 E.01275
G1 X133.937 Y119.503 E.09843
G1 X133.542 Y119.503 E.01275
G1 X133.542 Y122.497 E.0965
; WIPE_START
G1 F24000
G1 X133.542 Y120.497 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-.421 J-1.142 P1  F30000
G1 X126.861 Y122.958 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.651 Y122.958 E.04015
G1 X125.651 Y119.102 E.12791
G1 X126.861 Y119.102 E.04015
G1 X126.861 Y122.898 E.12592
G1 X127.253 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.259 Y123.35 E.06128
G1 X125.259 Y118.71 E.14257
G1 X127.253 Y118.71 E.06128
G1 X127.253 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X125.259 Y123.35 E-.75823
G1 X125.259 Y123.345 E-.00177
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I.671 J1.015 P1  F30000
G1 X126.457 Y122.554 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.444522
G1 F1200
G1 X126.457 Y119.506 E.09972
G1 X126.055 Y119.506 E.01314
G1 X126.055 Y122.554 E.09972
G1 X126.397 Y122.554 E.01118
; WIPE_START
M73 P80 R3
G1 F24000
G1 X126.055 Y122.554 E-.12981
G1 X126.055 Y120.895 E-.63019
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-1.214 J.08 P1  F30000
G1 X126.861 Y133.162 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.861 Y136.898 E.12392
G1 X125.651 Y136.898 E.04015
G1 X125.651 Y133.162 E.12392
G1 X126.801 Y133.162 E.03816
G1 X127.253 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X127.253 Y137.29 E.13889
G1 X125.259 Y137.29 E.06128
G1 X125.259 Y132.77 E.13889
G1 X127.193 Y132.77 E.05944
M204 S10000
; WIPE_START
G1 F24000
G1 X127.22 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I1.028 J-.652 P1  F30000
G1 X126.457 Y133.566 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.444522
G1 F1200
G1 X126.055 Y133.566 E.01314
G1 X126.055 Y136.494 E.09579
G1 X126.457 Y136.494 E.01314
G1 X126.457 Y133.626 E.09383
; WIPE_START
G1 F24000
G1 X126.457 Y135.626 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I.421 J1.142 P1  F30000
G1 X133.14 Y133.162 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.339 Y133.162 E.03975
G1 X134.339 Y136.898 E.12392
G1 X133.14 Y136.898 E.03975
G1 X133.14 Y133.222 E.12193
G1 X132.748 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X134.731 Y132.77 E.06092
G1 X134.731 Y137.29 E.13889
G1 X132.748 Y137.29 E.06092
G1 X132.748 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X134.731 Y132.77 E-.7537
G1 X134.731 Y132.787 E-.0063
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-.666 J-1.019 P1  F30000
G1 X133.542 Y133.563 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.438554
G1 F1200
G1 X133.542 Y136.497 E.09456
G1 X133.937 Y136.497 E.01275
G1 X133.937 Y133.563 E.09456
G1 X133.602 Y133.563 E.01082
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.937 Y133.563 E-.12754
G1 X133.937 Y135.228 E-.63246
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 77/103
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
G3 Z15.6 I1.215 J-.077 P1  F30000
G1 X133.163 Y122.958 Z15.6
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.163 Y119.102 E.12791
G1 X134.36 Y119.102 E.03972
G1 X134.36 Y122.958 E.12791
G1 X133.223 Y122.958 E.03773
G1 X132.771 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X132.771 Y118.71 E.14257
G1 X134.752 Y118.71 E.06089
G1 X134.752 Y123.35 E.14257
G1 X132.831 Y123.35 E.05904
M204 S10000
; WIPE_START
G1 F24000
G1 X132.805 Y121.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-1.03 J.648 P1  F30000
G1 X133.564 Y122.557 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.438054
G1 F1200
G1 X133.959 Y122.557 E.01272
G1 X133.959 Y119.503 E.09832
G1 X133.564 Y119.503 E.01272
G1 X133.564 Y122.497 E.09639
; WIPE_START
G1 F24000
G1 X133.564 Y120.497 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-.417 J-1.143 P1  F30000
G1 X126.819 Y122.958 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.64 Y122.958 E.0391
G1 X125.64 Y119.102 E.12791
G1 X126.819 Y119.102 E.0391
G1 X126.819 Y122.898 E.12592
G1 X127.211 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.248 Y123.35 E.06032
G1 X125.248 Y118.71 E.14257
G1 X127.211 Y118.71 E.06032
G1 X127.211 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X125.248 Y123.35 E-.74626
G1 X125.248 Y123.314 E-.01374
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I.656 J1.025 P1  F30000
G1 X126.423 Y122.561 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.428767
G1 F1200
G1 X126.423 Y119.499 E.0963
G1 X126.037 Y119.499 E.01213
G1 X126.037 Y122.561 E.0963
G1 X126.363 Y122.561 E.01025
; WIPE_START
G1 F24000
G1 X126.037 Y122.561 E-.12382
G1 X126.037 Y120.887 E-.63618
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-1.215 J.077 P1  F30000
G1 X126.819 Y133.162 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.819 Y136.898 E.12392
G1 X125.64 Y136.898 E.0391
G1 X125.64 Y133.162 E.12392
G1 X126.759 Y133.162 E.03711
G1 X127.211 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X127.211 Y137.29 E.13889
G1 X125.248 Y137.29 E.06032
G1 X125.248 Y132.77 E.13889
G1 X127.151 Y132.77 E.05847
M204 S10000
; WIPE_START
G1 F24000
G1 X127.178 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I1.033 J-.644 P1  F30000
G1 X126.423 Y133.559 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.428767
G1 F1200
G1 X126.037 Y133.559 E.01213
G1 X126.037 Y136.501 E.09253
G1 X126.423 Y136.501 E.01213
G1 X126.423 Y133.619 E.09064
; WIPE_START
G1 F24000
G1 X126.423 Y135.619 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I.417 J1.143 P1  F30000
G1 X133.163 Y133.162 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.36 Y133.162 E.03972
G1 X134.36 Y136.898 E.12392
G1 X133.163 Y136.898 E.03972
G1 X133.163 Y133.222 E.12193
G1 X132.771 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X134.752 Y132.77 E.06089
G1 X134.752 Y137.29 E.13889
G1 X132.771 Y137.29 E.06089
G1 X132.771 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X134.752 Y132.77 E-.75332
G1 X134.752 Y132.788 E-.00668
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-.665 J-1.019 P1  F30000
G1 X133.564 Y133.563 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.438053
G1 F1200
G1 X133.564 Y136.497 E.09446
G1 X133.959 Y136.497 E.01272
G1 X133.959 Y133.563 E.09446
G1 X133.624 Y133.563 E.01079
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
M73 P81 R3
G1 F24000
G1 X133.959 Y133.563 E-.12735
G1 X133.959 Y135.228 E-.63265
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 78/103
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
G3 Z15.8 I1.215 J-.077 P1  F30000
G1 X133.185 Y122.958 Z15.8
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.185 Y119.102 E.12791
G1 X134.382 Y119.102 E.03968
G1 X134.382 Y122.958 E.12791
G1 X133.245 Y122.958 E.03769
G1 X132.793 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X132.793 Y118.71 E.14257
G1 X134.774 Y118.71 E.06086
G1 X134.774 Y123.35 E.14257
G1 X132.853 Y123.35 E.05901
M204 S10000
; WIPE_START
G1 F24000
G1 X132.827 Y121.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-1.03 J.648 P1  F30000
G1 X133.586 Y122.557 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.437552
G1 F1200
G1 X133.981 Y122.557 E.01269
G1 X133.981 Y119.503 E.09821
G1 X133.586 Y119.503 E.01269
G1 X133.586 Y122.497 E.09628
; WIPE_START
G1 F24000
G1 X133.586 Y120.497 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-.415 J-1.144 P1  F30000
G1 X126.806 Y122.958 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.63 Y122.958 E.03901
G1 X125.63 Y119.102 E.12791
G1 X126.806 Y119.102 E.03901
G1 X126.806 Y122.898 E.12592
G1 X127.198 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.238 Y123.35 E.06023
G1 X125.238 Y118.71 E.14257
G1 X127.198 Y118.71 E.06023
G1 X127.198 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X125.238 Y123.35 E-.74523
G1 X125.238 Y123.311 E-.01477
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I.655 J1.026 P1  F30000
G1 X126.41 Y122.562 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42741
G1 F1200
G1 X126.41 Y119.498 E.09601
G1 X126.026 Y119.498 E.01205
G1 X126.026 Y122.562 E.09601
G1 X126.35 Y122.562 E.01017
; WIPE_START
G1 F24000
G1 X126.026 Y122.562 E-.12331
G1 X126.026 Y120.887 E-.63669
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-1.215 J.077 P1  F30000
G1 X126.806 Y133.162 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.806 Y136.898 E.12392
G1 X125.63 Y136.898 E.03901
G1 X125.63 Y133.162 E.12392
G1 X126.746 Y133.162 E.03702
G1 X127.198 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X127.198 Y137.29 E.13889
G1 X125.238 Y137.29 E.06023
G1 X125.238 Y132.77 E.13889
G1 X127.138 Y132.77 E.05839
M204 S10000
; WIPE_START
G1 F24000
G1 X127.165 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I1.033 J-.643 P1  F30000
G1 X126.41 Y133.558 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42741
G1 F1200
G1 X126.026 Y133.558 E.01205
G1 X126.026 Y136.502 E.09225
G1 X126.41 Y136.502 E.01205
G1 X126.41 Y133.618 E.09037
; WIPE_START
G1 F24000
G1 X126.41 Y135.618 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I.415 J1.144 P1  F30000
G1 X133.185 Y133.162 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.382 Y133.162 E.03968
G1 X134.382 Y136.898 E.12392
G1 X133.185 Y136.898 E.03968
G1 X133.185 Y133.222 E.12193
G1 X132.793 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X134.774 Y132.77 E.06086
G1 X134.774 Y137.29 E.13889
G1 X132.793 Y137.29 E.06086
G1 X132.793 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X134.774 Y132.77 E-.75294
G1 X134.774 Y132.789 E-.00706
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-.665 J-1.019 P1  F30000
G1 X133.586 Y133.563 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.437553
G1 F1200
G1 X133.586 Y136.497 E.09435
G1 X133.981 Y136.497 E.01269
G1 X133.981 Y133.563 E.09435
G1 X133.646 Y133.563 E.01076
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X133.981 Y133.563 E-.12716
G1 X133.981 Y135.228 E-.63284
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 79/103
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
G3 Z16 I1.051 J-.614 P1  F30000
G1 X126.814 Y122.958 Z16
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.62 Y122.958 E.03963
G1 X125.62 Y119.102 E.12791
G1 X126.814 Y119.102 E.03963
G1 X126.814 Y122.898 E.12592
G1 X127.206 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.228 Y123.35 E.06081
G1 X125.228 Y118.71 E.14257
G1 X127.206 Y118.71 E.06081
G1 X127.206 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X125.228 Y123.35 E-.75233
G1 X125.228 Y123.33 E-.00767
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I.664 J1.02 P1  F30000
G1 X126.414 Y122.557 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.436759
G1 F1200
G1 X126.414 Y119.503 E.09804
G1 X126.02 Y119.503 E.01264
G1 X126.02 Y122.557 E.09804
G1 X126.354 Y122.557 E.01071
; WIPE_START
G1 F24000
G1 X126.02 Y122.557 E-.12686
G1 X126.02 Y120.891 E-.63314
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-.337 J1.169 P1  F30000
G1 X133.184 Y122.958 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.184 Y119.102 E.12791
G1 X134.381 Y119.102 E.03969
G1 X134.381 Y122.958 E.12791
G1 X133.244 Y122.958 E.0377
G1 X132.792 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X132.792 Y118.71 E.14257
G1 X134.773 Y118.71 E.06086
G1 X134.773 Y123.35 E.14257
G1 X132.852 Y123.35 E.05901
M204 S10000
; WIPE_START
G1 F24000
G1 X132.826 Y121.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-1.03 J.648 P1  F30000
G1 X133.585 Y122.557 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.437592
G1 F1200
G1 X133.98 Y122.557 E.01269
G1 X133.98 Y119.503 E.09822
G1 X133.585 Y119.503 E.01269
G1 X133.585 Y122.497 E.09629
; WIPE_START
M73 P82 R3
G1 F24000
G1 X133.585 Y120.497 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-1.216 J-.039 P1  F30000
G1 X133.184 Y133.162 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.381 Y133.162 E.03969
G1 X134.381 Y136.898 E.12392
G1 X133.184 Y136.898 E.03969
G1 X133.184 Y133.222 E.12193
G1 X132.792 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X134.773 Y132.77 E.06086
G1 X134.773 Y137.29 E.13889
G1 X132.792 Y137.29 E.06086
G1 X132.792 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X134.773 Y132.77 E-.75297
G1 X134.773 Y132.789 E-.00703
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-.665 J-1.019 P1  F30000
G1 X133.585 Y133.563 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.437592
G1 F1200
G1 X133.585 Y136.497 E.09436
G1 X133.98 Y136.497 E.01269
G1 X133.98 Y133.563 E.09436
G1 X133.645 Y133.563 E.01076
; WIPE_START
G1 F24000
G1 X133.98 Y133.563 E-.12718
G1 X133.98 Y135.228 E-.63282
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I.337 J-1.169 P1  F30000
G1 X126.814 Y133.162 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.814 Y136.898 E.12392
G1 X125.62 Y136.898 E.03963
G1 X125.62 Y133.162 E.12392
G1 X126.754 Y133.162 E.03764
G1 X127.206 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X127.206 Y137.29 E.13889
G1 X125.228 Y137.29 E.06081
G1 X125.228 Y132.77 E.13889
G1 X127.146 Y132.77 E.05896
M204 S10000
; WIPE_START
G1 F24000
G1 X127.173 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I1.03 J-.648 P1  F30000
G1 X126.414 Y133.563 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.436759
G1 F1200
G1 X126.02 Y133.563 E.01264
G1 X126.02 Y136.497 E.09419
G1 X126.414 Y136.497 E.01264
G1 X126.414 Y133.623 E.09226
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.414 Y135.623 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 80/103
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
G3 Z16.2 I1.216 J.039 P1  F30000
G1 X126.823 Y122.958 Z16.2
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.609 Y122.958 E.04025
G1 X125.609 Y119.102 E.12791
G1 X126.823 Y119.102 E.04025
G1 X126.823 Y122.898 E.12592
G1 X127.215 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.217 Y123.35 E.06138
G1 X125.217 Y118.71 E.14257
G1 X127.215 Y118.71 E.06138
G1 X127.215 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X125.217 Y123.35 E-.75943
G1 X125.217 Y123.349 E-.00057
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I.672 J1.014 P1  F30000
G1 X126.417 Y122.553 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.446107
G1 F1200
G1 X126.417 Y119.507 E.10006
G1 X126.014 Y119.507 E.01325
G1 X126.014 Y122.553 E.10006
G1 X126.357 Y122.553 E.01128
; WIPE_START
G1 F24000
G1 X126.014 Y122.553 E-.13041
G1 X126.014 Y120.896 E-.62959
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I-.337 J1.169 P1  F30000
G1 X133.159 Y122.958 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.159 Y119.102 E.12791
G1 X134.357 Y119.102 E.03973
G1 X134.357 Y122.958 E.12791
G1 X133.219 Y122.958 E.03774
G1 X132.767 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X132.767 Y118.71 E.14257
G1 X134.749 Y118.71 E.06089
G1 X134.749 Y123.35 E.14257
G1 X132.827 Y123.35 E.05905
M204 S10000
; WIPE_START
G1 F24000
G1 X132.801 Y121.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I-1.03 J.648 P1  F30000
G1 X133.56 Y122.557 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.438174
G1 F1200
G1 X133.956 Y122.557 E.01273
G1 X133.956 Y119.503 E.09835
G1 X133.56 Y119.503 E.01273
G1 X133.56 Y122.497 E.09642
; WIPE_START
G1 F24000
G1 X133.56 Y120.497 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I-1.216 J-.039 P1  F30000
G1 X133.159 Y133.162 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.357 Y133.162 E.03973
G1 X134.357 Y136.898 E.12392
G1 X133.159 Y136.898 E.03973
G1 X133.159 Y133.222 E.12193
G1 X132.767 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X134.749 Y132.77 E.06089
G1 X134.749 Y137.29 E.13889
G1 X132.767 Y137.29 E.06089
G1 X132.767 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X134.749 Y132.77 E-.75341
G1 X134.749 Y132.787 E-.00659
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I-.665 J-1.019 P1  F30000
G1 X133.56 Y133.563 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.438173
G1 F1200
G1 X133.56 Y136.497 E.09448
G1 X133.956 Y136.497 E.01273
G1 X133.956 Y133.563 E.09448
G1 X133.62 Y133.563 E.0108
; WIPE_START
G1 F24000
G1 X133.956 Y133.563 E-.1274
G1 X133.956 Y135.228 E-.6326
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I.339 J-1.169 P1  F30000
G1 X126.823 Y133.162 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.823 Y136.898 E.12392
G1 X125.609 Y136.898 E.04025
G1 X125.609 Y133.162 E.12392
G1 X126.763 Y133.162 E.03826
G1 X127.215 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X127.215 Y137.29 E.13889
G1 X125.217 Y137.29 E.06138
G1 X125.217 Y132.77 E.13889
G1 X127.155 Y132.77 E.05954
M204 S10000
; WIPE_START
G1 F24000
G1 X127.181 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I1.027 J-.652 P1  F30000
G1 X126.417 Y133.567 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.446108
G1 F1200
G1 X126.014 Y133.567 E.01325
G1 X126.014 Y136.493 E.09612
G1 X126.417 Y136.493 E.01325
G1 X126.417 Y133.627 E.09415
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
M73 P83 R3
G1 F24000
G1 X126.417 Y135.627 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 81/103
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
G3 Z16.4 I1.216 J.041 P1  F30000
G1 X126.849 Y122.958 Z16.4
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.639 Y122.958 E.04015
G1 X125.639 Y119.102 E.12791
G1 X126.849 Y119.102 E.04015
G1 X126.849 Y122.898 E.12592
G1 X127.241 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.247 Y123.35 E.06128
G1 X125.247 Y118.71 E.14257
G1 X127.241 Y118.71 E.06128
G1 X127.241 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X125.247 Y123.35 E-.75821
G1 X125.247 Y123.345 E-.00179
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I.671 J1.015 P1  F30000
G1 X126.445 Y122.554 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.444492
G1 F1200
G1 X126.445 Y119.506 E.09971
G1 X126.043 Y119.506 E.01314
G1 X126.043 Y122.554 E.09971
G1 X126.385 Y122.554 E.01118
; WIPE_START
G1 F24000
G1 X126.043 Y122.554 E-.1298
G1 X126.043 Y120.895 E-.6302
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I-.34 J1.169 P1  F30000
G1 X133.134 Y122.958 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.134 Y119.102 E.12791
G1 X134.333 Y119.102 E.03976
G1 X134.333 Y122.958 E.12791
G1 X133.194 Y122.958 E.03777
G1 X132.742 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X132.742 Y118.71 E.14257
G1 X134.725 Y118.71 E.06093
G1 X134.725 Y123.35 E.14257
G1 X132.802 Y123.35 E.05909
M204 S10000
; WIPE_START
G1 F24000
G1 X132.776 Y121.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I-1.03 J.648 P1  F30000
G1 X133.536 Y122.556 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.438755
G1 F1200
G1 X133.932 Y122.556 E.01277
G1 X133.932 Y119.504 E.09847
G1 X133.536 Y119.504 E.01277
G1 X133.536 Y122.496 E.09654
; WIPE_START
G1 F24000
G1 X133.536 Y120.496 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I-1.216 J-.039 P1  F30000
G1 X133.134 Y133.162 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.333 Y133.162 E.03976
G1 X134.333 Y136.898 E.12392
G1 X133.134 Y136.898 E.03976
G1 X133.134 Y133.222 E.12193
G1 X132.742 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X134.725 Y132.77 E.06093
G1 X134.725 Y137.29 E.13889
G1 X132.742 Y137.29 E.06093
G1 X132.742 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X134.725 Y132.77 E-.75385
G1 X134.725 Y132.786 E-.00615
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I-.666 J-1.019 P1  F30000
G1 X133.536 Y133.564 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.438755
G1 F1200
G1 X133.536 Y136.496 E.0946
G1 X133.932 Y136.496 E.01277
G1 X133.932 Y133.564 E.0946
G1 X133.596 Y133.564 E.01083
; WIPE_START
G1 F24000
G1 X133.932 Y133.564 E-.12762
G1 X133.932 Y135.228 E-.63238
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I.341 J-1.168 P1  F30000
G1 X126.849 Y133.162 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.849 Y136.898 E.12392
G1 X125.639 Y136.898 E.04015
G1 X125.639 Y133.162 E.12392
G1 X126.789 Y133.162 E.03816
G1 X127.241 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X127.241 Y137.29 E.13889
G1 X125.247 Y137.29 E.06128
G1 X125.247 Y132.77 E.13889
G1 X127.181 Y132.77 E.05944
M204 S10000
; WIPE_START
G1 F24000
G1 X127.208 Y134.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I1.028 J-.652 P1  F30000
G1 X126.445 Y133.566 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.444492
G1 F1200
G1 X126.043 Y133.566 E.01314
G1 X126.043 Y136.494 E.09579
G1 X126.445 Y136.494 E.01314
G1 X126.445 Y133.626 E.09382
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X126.445 Y135.626 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 82/103
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
G3 Z16.6 I1.216 J.045 P1  F30000
G1 X126.909 Y122.958 Z16.6
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.676 Y122.958 E.04088
G1 X125.676 Y119.102 E.12791
G1 X126.909 Y119.102 E.04088
G1 X126.909 Y122.898 E.12592
G1 X127.282 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.284 Y123.35 E.06139
G1 X125.284 Y118.71 E.14257
G1 X127.282 Y118.71 E.06139
G1 X127.301 Y118.71 E.00057
G1 X127.301 Y123.309 E.1413
M204 S10000
; WIPE_START
G1 F24000
G1 X125.301 Y123.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I.677 J1.011 P1  F30000
G1 X126.499 Y122.548 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.455602
G1 F1200
G1 X126.499 Y119.512 E.1021
G1 X126.086 Y119.512 E.01388
G1 X126.086 Y122.548 E.1021
G1 X126.439 Y122.548 E.01186
; WIPE_START
G1 F24000
G1 X126.086 Y122.548 E-.13402
G1 X126.086 Y120.901 E-.62598
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I-.343 J1.168 P1  F30000
G1 X133.093 Y122.958 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.093 Y119.102 E.12791
G1 X134.309 Y119.102 E.04035
G1 X134.309 Y122.958 E.12791
G1 X133.153 Y122.958 E.03836
G1 X132.701 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X132.701 Y118.71 E.14257
G1 X134.701 Y118.71 E.06146
G1 X134.701 Y123.35 E.14257
G1 X132.761 Y123.35 E.05962
M204 S10000
; WIPE_START
G1 F24000
G1 X132.735 Y121.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I-1.027 J.653 P1  F30000
G1 X133.499 Y122.552 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.447533
G1 F1200
G1 X133.903 Y122.552 E.01334
G1 X133.903 Y119.508 E.10037
G1 X133.499 Y119.508 E.01334
G1 X133.499 Y122.492 E.09839
; WIPE_START
M73 P84 R3
G1 F24000
G1 X133.499 Y120.492 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I-1.216 J-.039 P1  F30000
G1 X133.093 Y133.162 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.309 Y133.162 E.04035
G1 X134.309 Y136.898 E.12392
G1 X133.093 Y136.898 E.04035
G1 X133.093 Y133.222 E.12193
G1 X132.701 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X134.701 Y132.77 E.06146
G1 X134.701 Y137.29 E.13889
G1 X132.701 Y137.29 E.06146
G1 X132.701 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X134.7 Y132.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I-.673 J-1.014 P1  F30000
G1 X133.499 Y133.568 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.447533
G1 F1200
G1 X133.499 Y136.492 E.09641
G1 X133.903 Y136.492 E.01334
G1 X133.903 Y133.568 E.09641
G1 X133.559 Y133.568 E.01136
; WIPE_START
G1 F24000
G1 X133.903 Y133.568 E-.13095
G1 X133.903 Y135.223 E-.62905
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I.344 J-1.167 P1  F30000
G1 X126.909 Y133.162 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.909 Y136.898 E.12392
G1 X125.676 Y136.898 E.04088
G1 X125.676 Y133.162 E.12392
G1 X126.849 Y133.162 E.03889
G1 X127.282 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X127.301 Y132.77 E.00057
G1 X127.301 Y137.29 E.13889
G1 X127.282 Y137.29 E.00057
G1 X125.284 Y137.29 E.06139
G1 X125.284 Y132.77 E.13889
G1 X127.222 Y132.77 E.05955
M204 S10000
; WIPE_START
G1 F24000
G1 X127.301 Y132.77 E-.02985
G1 X127.301 Y134.691 E-.73015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I.989 J-.709 P1  F30000
G1 X126.499 Y133.572 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.455602
G1 F1200
G1 X126.086 Y133.572 E.01388
G1 X126.086 Y136.488 E.09806
G1 X126.499 Y136.488 E.01388
G1 X126.499 Y133.632 E.09605
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X126.499 Y135.632 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 83/103
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
G3 Z16.8 I1.216 J.045 P1  F30000
G1 X126.968 Y122.958 Z16.8
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.714 Y122.958 E.04162
G1 X125.714 Y119.102 E.12791
G1 X126.968 Y119.102 E.04162
G1 X126.968 Y122.898 E.12592
G1 X127.342 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.322 Y123.35 E.06208
G1 X125.322 Y118.71 E.14257
G1 X127.342 Y118.71 E.06208
G1 X127.361 Y118.71 E.00057
G1 X127.361 Y123.309 E.1413
M204 S10000
; WIPE_START
G1 F24000
G1 X125.361 Y123.349 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I.682 J1.008 P1  F30000
G1 X126.553 Y122.542 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.466712
G1 F1200
G1 X126.553 Y119.518 E.10446
G1 X126.129 Y119.518 E.01464
G1 X126.129 Y122.542 E.10446
G1 X126.493 Y122.542 E.01256
; WIPE_START
G1 F24000
G1 X126.129 Y122.542 E-.13824
G1 X126.129 Y120.906 E-.62176
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I-.348 J1.166 P1  F30000
G1 X133.015 Y122.958 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.015 Y119.102 E.12791
G1 X134.285 Y119.102 E.04215
G1 X134.285 Y122.958 E.12791
G1 X133.075 Y122.958 E.04016
M73 P84 R2
G1 X132.623 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X132.623 Y118.71 E.14257
G1 X132.66 Y118.71 E.00114
G1 X134.678 Y118.71 E.062
G1 X134.678 Y123.35 E.14257
G1 X132.683 Y123.35 E.06129
M204 S10000
; WIPE_START
G1 F24000
G1 X132.657 Y121.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I-1.018 J.666 P1  F30000
G1 X133.434 Y122.539 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.47467
G1 F1200
G1 X133.866 Y122.539 E.01519
G1 X133.866 Y119.521 E.10615
G1 X133.434 Y119.521 E.01519
G1 X133.434 Y122.479 E.10403
; WIPE_START
G1 F24000
G1 X133.434 Y120.479 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I-1.216 J-.04 P1  F30000
G1 X133.015 Y133.162 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.285 Y133.162 E.04215
G1 X134.285 Y136.898 E.12392
G1 X133.015 Y136.898 E.04215
G1 X133.015 Y133.222 E.12193
G1 X132.66 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X134.678 Y132.77 E.062
G1 X134.678 Y137.29 E.13889
G1 X132.66 Y137.29 E.062
G1 X132.623 Y137.29 E.00114
G1 X132.623 Y132.793 E.13818
M204 S10000
; WIPE_START
G1 F24000
G1 X134.623 Y132.771 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I-.686 J-1.005 P1  F30000
G1 X133.434 Y133.581 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.47467
G1 F1200
G1 X133.434 Y136.479 E.10192
G1 X133.866 Y136.479 E.01519
G1 X133.866 Y133.581 E.10192
G1 X133.494 Y133.581 E.01308
; WIPE_START
G1 F24000
G1 X133.866 Y133.581 E-.14126
G1 X133.866 Y135.21 E-.61874
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I.346 J-1.167 P1  F30000
G1 X126.968 Y133.162 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.968 Y136.898 E.12392
G1 X125.714 Y136.898 E.04162
G1 X125.714 Y133.162 E.12392
G1 X126.908 Y133.162 E.03963
G1 X127.342 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X127.361 Y132.77 E.00057
G1 X127.361 Y137.29 E.13889
G1 X127.342 Y137.29 E.00057
G1 X125.322 Y137.29 E.06208
G1 X125.322 Y132.77 E.13889
G1 X127.282 Y132.77 E.06023
M204 S10000
; WIPE_START
G1 F24000
G1 X127.361 Y132.77 E-.02985
G1 X127.361 Y134.691 E-.73015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I.985 J-.714 P1  F30000
G1 X126.553 Y133.578 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.466712
G1 F1200
G1 X126.129 Y133.578 E.01464
M73 P85 R2
G1 X126.129 Y136.482 E.10032
G1 X126.553 Y136.482 E.01464
G1 X126.553 Y133.638 E.09825
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X126.553 Y135.638 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 84/103
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
G3 Z17 I1.216 J.047 P1  F30000
G1 X127.045 Y122.958 Z17
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.751 Y122.958 E.04291
G1 X125.751 Y119.102 E.12791
G1 X127.045 Y119.102 E.04291
G1 X127.045 Y122.898 E.12592
G1 X127.402 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.359 Y123.35 E.06276
G1 X125.359 Y118.71 E.14257
G1 X127.402 Y118.71 E.06276
G1 X127.437 Y118.71 E.00108
G1 X127.437 Y123.325 E.14181
M204 S10000
; WIPE_START
G1 F24000
G1 X125.437 Y123.349 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I.691 J1.002 P1  F30000
G1 X126.619 Y122.533 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.486111
G1 F1200
G1 X126.619 Y119.527 E.10854
G1 X126.176 Y119.527 E.01601
G1 X126.176 Y122.533 E.10854
G1 X126.559 Y122.533 E.01384
; WIPE_START
G1 F24000
G1 X126.176 Y122.533 E-.14561
G1 X126.176 Y120.916 E-.61439
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I-.352 J1.165 P1  F30000
G1 X132.937 Y122.958 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X132.937 Y119.102 E.12791
G1 X134.262 Y119.102 E.04395
G1 X134.262 Y122.958 E.12791
G1 X132.997 Y122.958 E.04196
G1 X132.545 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X132.545 Y118.71 E.14257
G1 X132.582 Y118.71 E.00114
G1 X134.654 Y118.71 E.06367
G1 X134.654 Y123.35 E.14257
G1 X132.605 Y123.35 E.06296
M204 S10000
; WIPE_START
G1 F24000
G1 X132.579 Y121.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I-1.009 J.68 P1  F30000
G1 X133.37 Y122.525 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.501805
G1 F1200
G1 X133.829 Y122.525 E.01716
G1 X133.829 Y119.535 E.1118
G1 X133.37 Y119.535 E.01716
G1 X133.37 Y122.465 E.10956
; WIPE_START
G1 F24000
G1 X133.37 Y120.465 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I-1.216 J-.041 P1  F30000
G1 X132.937 Y133.162 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.262 Y133.162 E.04395
G1 X134.262 Y136.898 E.12392
G1 X132.937 Y136.898 E.04395
G1 X132.937 Y133.222 E.12193
G1 X132.582 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X134.654 Y132.77 E.06367
G1 X134.654 Y137.29 E.13889
G1 X132.582 Y137.29 E.06367
G1 X132.545 Y137.29 E.00114
G1 X132.545 Y132.793 E.13818
M204 S10000
; WIPE_START
G1 F24000
G1 X134.545 Y132.771 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I-.699 J-.996 P1  F30000
G1 X133.37 Y133.595 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.501805
G1 F1200
G1 X133.37 Y136.465 E.10731
G1 X133.829 Y136.465 E.01716
G1 X133.829 Y133.595 E.10731
G1 X133.43 Y133.595 E.01492
; WIPE_START
G1 F24000
G1 X133.829 Y133.595 E-.15158
G1 X133.829 Y135.196 E-.60842
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I.35 J-1.166 P1  F30000
G1 X127.045 Y133.162 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X127.045 Y136.898 E.12392
G1 X125.751 Y136.898 E.04291
G1 X125.751 Y133.162 E.12392
G1 X126.985 Y133.162 E.04092
G1 X127.402 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X127.437 Y132.77 E.00108
G1 X127.437 Y137.29 E.13889
G1 X127.402 Y137.29 E.00108
G1 X125.359 Y137.29 E.06276
G1 X125.359 Y132.77 E.13889
G1 X127.342 Y132.77 E.06092
M204 S10000
; WIPE_START
G1 F24000
G1 X127.437 Y132.77 E-.03614
G1 X127.437 Y134.675 E-.72386
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I.973 J-.731 P1  F30000
G1 X126.619 Y133.587 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.486111
G1 F1200
G1 X126.176 Y133.587 E.01601
G1 X126.176 Y136.473 E.10421
G1 X126.619 Y136.473 E.01601
G1 X126.619 Y133.647 E.10204
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X126.619 Y135.647 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 85/103
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
G3 Z17.2 I1.216 J.052 P1  F30000
G1 X127.164 Y122.958 Z17.2
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.788 Y122.958 E.04562
G1 X125.788 Y119.102 E.12791
G1 X127.164 Y119.102 E.04562
G1 X127.164 Y122.898 E.12592
G1 X127.478 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.396 Y123.35 E.06395
G1 X125.396 Y118.71 E.14257
G1 X127.478 Y118.71 E.06395
G1 X127.556 Y118.71 E.0024
G1 X127.556 Y123.35 E.14257
G1 X127.538 Y123.35 E.00056
M204 S10000
; WIPE_START
G1 F24000
G1 X125.538 Y123.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I.704 J.992 P1  F30000
G1 X126.718 Y122.512 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.527037
G1 F1200
G1 X126.718 Y119.548 E.11695
G1 X126.234 Y119.548 E.0191
G1 X126.234 Y122.512 E.11695
G1 X126.658 Y122.512 E.01673
; WIPE_START
G1 F24000
G1 X126.234 Y122.512 E-.16116
G1 X126.234 Y120.936 E-.59884
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I-.356 J1.164 P1  F30000
G1 X132.839 Y122.958 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X132.839 Y119.102 E.12791
G1 X134.206 Y119.102 E.04535
G1 X134.206 Y122.958 E.12791
G1 X132.899 Y122.958 E.04336
G1 X132.447 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X132.447 Y118.71 E.14257
G1 X132.504 Y118.71 E.00176
G1 X134.598 Y118.71 E.06434
G1 X134.598 Y123.35 E.14257
G1 X132.507 Y123.35 E.06426
M204 S10000
; WIPE_START
G1 F24000
G1 X132.481 Y121.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I-1.002 J.69 P1  F30000
G1 X133.282 Y122.514 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522937
G1 F1200
G1 X133.762 Y122.514 E.01878
G1 X133.762 Y119.546 E.11612
M73 P86 R2
G1 X133.282 Y119.546 E.01878
G1 X133.282 Y122.454 E.11378
; WIPE_START
G1 F24000
G1 X133.282 Y120.454 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I-1.216 J-.042 P1  F30000
G1 X132.839 Y133.162 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.206 Y133.162 E.04535
G1 X134.206 Y136.898 E.12392
G1 X132.839 Y136.898 E.04535
G1 X132.839 Y133.222 E.12193
G1 X132.504 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X134.598 Y132.77 E.06434
G1 X134.598 Y137.29 E.13889
G1 X132.504 Y137.29 E.06434
G1 X132.447 Y137.29 E.00176
G1 X132.447 Y132.773 E.1388
M204 S10000
; WIPE_START
G1 F24000
G1 X134.447 Y132.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I-.709 J-.989 P1  F30000
G1 X133.282 Y133.606 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522937
G1 F1200
G1 X133.282 Y136.454 E.11143
G1 X133.762 Y136.454 E.01878
G1 X133.762 Y133.606 E.11143
G1 X133.342 Y133.606 E.01643
; WIPE_START
G1 F24000
G1 X133.762 Y133.606 E-.15961
G1 X133.762 Y135.186 E-.60039
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I.357 J-1.163 P1  F30000
G1 X127.164 Y133.162 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X127.164 Y136.898 E.12392
G1 X125.788 Y136.898 E.04562
G1 X125.788 Y133.162 E.12392
G1 X127.104 Y133.162 E.04363
G1 X127.478 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X127.556 Y132.77 E.0024
G1 X127.556 Y137.29 E.13889
G1 X127.478 Y137.29 E.0024
G1 X125.396 Y137.29 E.06395
G1 X125.396 Y132.77 E.13889
G1 X127.418 Y132.77 E.06211
M204 S10000
; WIPE_START
G1 F24000
G1 X127.556 Y132.77 E-.05251
G1 X127.556 Y134.632 E-.70749
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I.942 J-.77 P1  F30000
G1 X126.718 Y133.608 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.527036
G1 F1200
G1 X126.234 Y133.608 E.0191
G1 X126.234 Y136.452 E.11222
G1 X126.718 Y136.452 E.0191
G1 X126.718 Y133.668 E.10985
; CHANGE_LAYER
; Z_HEIGHT: 17.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X126.718 Y135.668 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 86/103
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
G3 Z17.4 I1.216 J.054 P1  F30000
G1 X127.283 Y122.958 Z17.4
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.828 Y122.958 E.04826
G1 X125.828 Y119.102 E.12791
G1 X127.283 Y119.102 E.04826
G1 X127.283 Y122.898 E.12592
G1 X127.597 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.436 Y123.35 E.06639
G1 X125.436 Y118.71 E.14257
G1 X127.597 Y118.71 E.06639
G1 X127.675 Y118.71 E.0024
G1 X127.675 Y123.35 E.14257
G1 X127.657 Y123.35 E.00056
M204 S10000
; WIPE_START
G1 F24000
G1 X125.657 Y123.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I.723 J.979 P1  F30000
G1 X126.817 Y122.492 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.566766
G1 F1200
G1 X126.817 Y119.568 E.12486
G1 X126.294 Y119.568 E.02236
G1 X126.294 Y122.492 E.12486
G1 X126.757 Y122.492 E.0198
; WIPE_START
G1 F24000
G1 X126.294 Y122.492 E-.17626
G1 X126.294 Y120.956 E-.58374
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I-.363 J1.162 P1  F30000
G1 X132.696 Y122.958 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X132.696 Y119.102 E.12791
G1 X134.132 Y119.102 E.04763
G1 X134.132 Y122.958 E.12791
G1 X132.756 Y122.958 E.04564
G1 X132.304 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X132.304 Y118.71 E.14257
G1 X132.324 Y118.71 E.00061
G1 X132.406 Y118.71 E.00252
G1 X134.524 Y118.71 E.06509
G1 X134.524 Y123.35 E.14257
G1 X132.406 Y123.35 E.06509
G1 X132.364 Y123.35 E.00128
M204 S10000
; WIPE_START
G1 F24000
G1 X132.338 Y121.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I-.991 J.707 P1  F30000
G1 X133.157 Y122.497 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.557282
G1 F1200
G1 X133.671 Y122.497 E.02156
G1 X133.671 Y119.563 E.12299
G1 X133.157 Y119.563 E.02156
G1 X133.157 Y122.437 E.12048
; WIPE_START
G1 F24000
G1 X133.157 Y120.437 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I-1.216 J-.044 P1  F30000
G1 X132.696 Y133.162 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.132 Y133.162 E.04763
G1 X134.132 Y136.898 E.12392
G1 X132.696 Y136.898 E.04763
G1 X132.696 Y133.222 E.12193
G1 X132.406 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X134.524 Y132.77 E.06509
G1 X134.524 Y137.29 E.13889
G1 X132.406 Y137.29 E.06509
G1 X132.324 Y137.29 E.00252
G1 X132.304 Y137.29 E.00061
G1 X132.304 Y132.77 E.13889
G1 X132.324 Y132.77 E.00061
G1 X132.346 Y132.77 E.00068
M204 S10000
; WIPE_START
G1 F24000
G1 X134.346 Y132.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I-.709 J-.989 P1  F30000
G1 X133.157 Y133.623 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.557282
G1 F1200
G1 X133.157 Y136.437 E.11796
G1 X133.671 Y136.437 E.02156
G1 X133.671 Y133.623 E.11796
G1 X133.217 Y133.623 E.01904
; WIPE_START
G1 F24000
G1 X133.671 Y133.623 E-.17266
G1 X133.671 Y135.168 E-.58734
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I.365 J-1.161 P1  F30000
G1 X127.283 Y133.162 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X127.283 Y136.898 E.12392
G1 X125.828 Y136.898 E.04826
G1 X125.828 Y133.162 E.12392
G1 X127.223 Y133.162 E.04627
G1 X127.597 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X127.675 Y132.77 E.0024
G1 X127.675 Y137.29 E.13889
G1 X127.597 Y137.29 E.0024
G1 X125.436 Y137.29 E.06639
G1 X125.436 Y132.77 E.13889
G1 X127.537 Y132.77 E.06455
M204 S10000
; WIPE_START
G1 F24000
G1 X127.675 Y132.77 E-.05251
G1 X127.675 Y134.632 E-.70749
; WIPE_END
M73 P87 R2
G1 E-.04 F1800
G17
G3 Z17.6 I.925 J-.79 P1  F30000
G1 X126.817 Y133.628 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.566766
G1 F1200
G1 X126.294 Y133.628 E.02236
G1 X126.294 Y136.432 E.11973
G1 X126.817 Y136.432 E.02236
G1 X126.817 Y133.688 E.11717
; CHANGE_LAYER
; Z_HEIGHT: 17.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X126.817 Y135.688 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 87/103
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
G3 Z17.6 I1.215 J.06 P1  F30000
G1 X127.444 Y122.958 Z17.6
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X125.918 Y122.958 E.05062
G1 X125.918 Y119.102 E.12791
G1 X127.444 Y119.102 E.05062
G1 X127.444 Y122.898 E.12592
G1 X127.716 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.526 Y123.35 E.0673
G1 X125.526 Y118.71 E.14257
G1 X127.716 Y118.71 E.0673
G1 X127.798 Y118.71 E.00252
G1 X127.836 Y118.71 E.00116
G1 X127.836 Y123.35 E.14257
G1 X127.798 Y123.35 E.00116
G1 X127.776 Y123.35 E.00068
M204 S10000
; WIPE_START
G1 F24000
G1 X125.776 Y123.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I.637 J1.037 P1  F30000
G1 X127.052 Y122.566 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X127.052 Y119.494 E.09438
G1 X126.31 Y119.494 E.0228
G1 X126.31 Y122.566 E.09438
G1 X126.992 Y122.566 E.02095
G1 X126.681 Y122.195 F30000
; LINE_WIDTH: 0.407704
G1 F1200
G1 X126.681 Y119.925 E.06747
; WIPE_START
G1 F24000
G1 X126.681 Y121.925 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I-.211 J1.199 P1  F30000
G1 X132.553 Y122.958 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X132.553 Y119.102 E.12791
G1 X134.057 Y119.102 E.04991
G1 X134.057 Y122.958 E.12791
G1 X132.613 Y122.958 E.04792
G1 X132.263 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X132.181 Y123.35 E.00252
G1 X132.161 Y123.35 E.00061
G1 X132.161 Y118.71 E.14257
G1 X132.181 Y118.71 E.00061
G1 X132.263 Y118.71 E.00252
G1 X134.45 Y118.71 E.0672
G1 X134.45 Y123.35 E.14257
G1 X132.323 Y123.35 E.06535
M204 S10000
; WIPE_START
G1 F24000
G1 X132.181 Y123.35 E-.05396
G1 X132.161 Y123.35 E-.00752
G1 X132.161 Y121.512 E-.69852
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I-.976 J.726 P1  F30000
G1 X132.945 Y122.566 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X133.665 Y122.566 E.02213
G1 X133.665 Y119.494 E.09438
G1 X132.945 Y119.494 E.02213
G1 X132.945 Y122.506 E.09254
G1 X133.305 Y122.206 F30000
; LINE_WIDTH: 0.386176
G1 F1200
G1 X133.305 Y119.914 E.06409
; WIPE_START
G1 F24000
G1 X133.305 Y121.914 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I-1.214 J-.081 P1  F30000
G1 X132.553 Y133.162 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X134.057 Y133.162 E.04991
G1 X134.057 Y136.898 E.12392
G1 X132.553 Y136.898 E.04991
G1 X132.553 Y133.222 E.12193
G1 X132.263 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X134.45 Y132.77 E.0672
G1 X134.45 Y137.29 E.13889
G1 X132.263 Y137.29 E.0672
G1 X132.181 Y137.29 E.00252
G1 X132.161 Y137.29 E.00061
G1 X132.161 Y132.77 E.13889
G1 X132.181 Y132.77 E.00061
G1 X132.203 Y132.77 E.00068
M204 S10000
; WIPE_START
G1 F24000
G1 X134.203 Y132.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I-.644 J-1.033 P1  F30000
G1 X132.945 Y133.554 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X132.945 Y136.506 E.0907
G1 X133.665 Y136.506 E.02213
G1 X133.665 Y133.554 E.0907
G1 X133.005 Y133.554 E.02029
G1 X133.305 Y136.146 F30000
; LINE_WIDTH: 0.386176
G1 F1200
G1 X133.305 Y133.974 E.06073
; WIPE_START
G1 F24000
G1 X133.305 Y135.974 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I.526 J-1.097 P1  F30000
G1 X127.444 Y133.162 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X127.444 Y136.898 E.12392
G1 X125.918 Y136.898 E.05062
G1 X125.918 Y133.162 E.12392
G1 X127.384 Y133.162 E.04863
G1 X127.716 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X127.798 Y132.77 E.00252
G1 X127.836 Y132.77 E.00116
G1 X127.836 Y137.29 E.13889
G1 X127.798 Y137.29 E.00116
G1 X127.716 Y137.29 E.00252
G1 X125.526 Y137.29 E.0673
G1 X125.526 Y132.77 E.13889
G1 X127.656 Y132.77 E.06546
M204 S10000
G1 X127.052 Y133.554 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X126.31 Y133.554 E.0228
G1 X126.31 Y136.506 E.0907
G1 X127.052 Y136.506 E.0228
G1 X127.052 Y133.614 E.08885
G1 X126.681 Y133.925 F30000
; LINE_WIDTH: 0.407704
G1 F1200
G1 X126.681 Y136.075 E.0639
; CHANGE_LAYER
; Z_HEIGHT: 17.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X126.681 Y134.075 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 88/103
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
G3 Z17.8 I1.212 J.105 P1  F30000
G1 X127.644 Y122.958 Z17.8
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.007 Y122.958 E.05428
G1 X126.007 Y119.102 E.12791
G1 X127.644 Y119.102 E.05428
G1 X127.644 Y122.898 E.12592
G1 X127.877 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.615 Y123.35 E.06949
G1 X125.615 Y118.71 E.14257
G1 X127.877 Y118.71 E.06949
G1 X127.959 Y118.71 E.00252
G1 X128.036 Y118.71 E.00237
G1 X128.036 Y123.35 E.14257
G1 X127.959 Y123.35 E.00237
G1 X127.937 Y123.35 E.00068
M204 S10000
; WIPE_START
G1 F24000
G1 X125.937 Y123.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I.623 J1.045 P1  F30000
G1 X127.252 Y122.566 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X127.252 Y119.494 E.09438
G1 X126.399 Y119.494 E.02619
G1 X126.399 Y122.566 E.09438
G1 X127.192 Y122.566 E.02435
G1 X126.825 Y122.14 F30000
; LINE_WIDTH: 0.518136
G1 F1200
G1 X126.825 Y119.98 E.08362
; WIPE_START
G1 F24000
G1 X126.825 Y121.98 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I-.212 J1.198 P1  F30000
G1 X132.345 Y122.958 Z18
G1 Z17.6
M73 P88 R2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X132.345 Y119.102 E.12791
G1 X133.983 Y119.102 E.05434
G1 X133.983 Y122.958 E.12791
G1 X132.405 Y122.958 E.05235
G1 X132.12 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X131.956 Y123.35 E.00504
G1 F1800
G1 X131.956 Y118.71 E.14257
G1 F1200
G1 X132.12 Y118.71 E.00504
G1 X134.375 Y118.71 E.06931
G1 X134.375 Y123.35 E.14257
G1 X132.18 Y123.35 E.06746
M204 S10000
G1 X132.737 Y122.566 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X133.591 Y122.566 E.02624
G1 X133.591 Y119.494 E.09438
G1 X132.737 Y119.494 E.02624
G1 X132.737 Y122.506 E.09254
G1 X133.164 Y122.139 F30000
; LINE_WIDTH: 0.51977
G1 F1200
G1 X133.164 Y119.981 E.08384
; WIPE_START
G1 F24000
G1 X133.164 Y121.981 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I-1.214 J-.089 P1  F30000
G1 X132.345 Y133.162 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.983 Y133.162 E.05434
G1 X133.983 Y136.898 E.12392
G1 X132.345 Y136.898 E.05434
G1 X132.345 Y133.222 E.12193
G1 X132.12 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X134.375 Y132.77 E.06931
G1 X134.375 Y137.29 E.13889
G1 X132.12 Y137.29 E.06931
G1 X131.956 Y137.29 E.00504
G1 F1800
G1 X131.956 Y132.77 E.13889
G1 F1200
G1 X132.06 Y132.77 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X134.06 Y132.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I-.621 J-1.047 P1  F30000
G1 X132.737 Y133.554 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X132.737 Y136.506 E.0907
G1 X133.591 Y136.506 E.02624
G1 X133.591 Y133.554 E.0907
G1 X132.797 Y133.554 E.0244
G1 X133.164 Y136.079 F30000
; LINE_WIDTH: 0.51977
G1 F1200
G1 X133.164 Y134.041 E.07918
; WIPE_START
G1 F24000
G1 X133.164 Y136.041 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I.563 J-1.079 P1  F30000
G1 X127.644 Y133.162 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X127.644 Y136.898 E.12392
G1 X126.007 Y136.898 E.05428
G1 X126.007 Y133.162 E.12392
G1 X127.584 Y133.162 E.05229
G1 X127.877 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X127.959 Y132.77 E.00252
G1 X128.036 Y132.77 E.00237
G1 X128.036 Y137.29 E.13889
G1 X127.959 Y137.29 E.00237
G1 X127.877 Y137.29 E.00252
G1 X125.615 Y137.29 E.06949
G1 X125.615 Y132.77 E.13889
G1 X127.817 Y132.77 E.06765
M204 S10000
G1 X127.252 Y133.554 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X126.399 Y133.554 E.02619
G1 X126.399 Y136.506 E.0907
G1 X127.252 Y136.506 E.02619
G1 X127.252 Y133.614 E.08885
G1 X126.825 Y136.08 F30000
; LINE_WIDTH: 0.518136
G1 F1200
G1 X126.825 Y134.04 E.07897
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 17.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X126.825 Y136.04 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 89/103
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
G3 Z18 I1.213 J.097 P1  F30000
G1 X127.876 Y122.958 Z18
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1211
G1 X126.097 Y122.958 E.05903
G1 X126.097 Y119.102 E.12791
G1 X127.876 Y119.102 E.05903
G1 X127.876 Y122.898 E.12592
G1 X128.077 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1211
G1 X125.705 Y123.35 E.07289
G1 X125.705 Y118.71 E.14257
G1 X128.077 Y118.71 E.07289
G1 X128.241 Y118.71 E.00504
M106 S255
G1 F1800
G1 X128.269 Y118.71 E.00085
G1 X128.269 Y123.35 E.14257
G1 X128.241 Y123.35 E.00085
M106 S252.45
G1 F1211
G1 X128.137 Y123.35 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X126.137 Y123.35 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I.612 J1.052 P1  F30000
G1 X127.484 Y122.566 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1211
G1 X127.484 Y119.494 E.09438
G1 X126.489 Y119.494 E.03059
G1 X126.489 Y122.566 E.09438
G1 X127.424 Y122.566 E.02874
G1 X127.141 Y122.223 F30000
; LINE_WIDTH: 0.352101
G1 F1211
G1 X127.141 Y119.837 E.0601
G1 X126.832 Y119.837 E.00779
G1 X126.832 Y122.223 E.0601
G1 X127.081 Y122.223 E.00628
; WIPE_START
G1 F24000
G1 X126.832 Y122.223 E-.09469
G1 X126.832 Y120.472 E-.66531
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I-.519 J1.101 P1  F30000
G1 X132.109 Y122.958 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1211
G1 X132.109 Y119.102 E.12791
G1 X133.909 Y119.102 E.05971
G1 X133.909 Y122.958 E.12791
G1 X132.169 Y122.958 E.05772
G1 X131.912 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1211
G1 X131.748 Y123.35 E.00504
M106 S255
G1 F1800
G1 X131.717 Y123.35 E.00096
G1 X131.717 Y118.71 E.14257
G1 X131.748 Y118.71 E.00096
M106 S252.45
G1 F1211
G1 X131.912 Y118.71 E.00504
G1 X134.301 Y118.71 E.07341
G1 X134.301 Y123.35 E.14257
G1 X131.972 Y123.35 E.07157
M204 S10000
G1 X132.501 Y122.566 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1211
G1 X133.517 Y122.566 E.03122
G1 X133.517 Y119.494 E.09438
G1 X132.501 Y119.494 E.03122
G1 X132.501 Y122.506 E.09254
G1 X132.849 Y122.218 F30000
; LINE_WIDTH: 0.362362
G1 F1211
G1 X133.169 Y122.218 E.00832
G1 X133.169 Y119.842 E.06183
G1 X132.849 Y119.842 E.00832
G1 X132.849 Y122.158 E.06026
; WIPE_START
G1 F24000
G1 X132.849 Y120.158 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I-1.215 J-.069 P1  F30000
G1 X132.109 Y133.162 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1211
G1 X133.909 Y133.162 E.05971
G1 X133.909 Y136.898 E.12392
G1 X132.109 Y136.898 E.05971
G1 X132.109 Y133.222 E.12193
G1 X131.912 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1211
G1 X134.301 Y132.77 E.07341
G1 X134.301 Y137.29 E.13889
G1 X131.912 Y137.29 E.07341
G1 X131.748 Y137.29 E.00504
M106 S255
G1 F1800
G1 X131.717 Y137.29 E.00096
G1 X131.717 Y132.77 E.13889
G1 X131.748 Y132.77 E.00096
M106 S252.45
G1 F1211
G1 X131.852 Y132.77 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X133.852 Y132.77 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P89 R2
G3 Z18.2 I-.611 J-1.053 P1  F30000
G1 X132.501 Y133.554 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1211
G1 X132.501 Y136.506 E.0907
G1 X133.517 Y136.506 E.03122
G1 X133.517 Y133.554 E.0907
G1 X132.561 Y133.554 E.02937
G1 X132.849 Y133.902 F30000
; LINE_WIDTH: 0.362362
G1 F1211
G1 X132.849 Y136.158 E.0587
G1 X133.169 Y136.158 E.00832
G1 X133.169 Y133.902 E.0587
G1 X132.909 Y133.902 E.00675
; WIPE_START
G1 F24000
G1 X133.169 Y133.902 E-.09859
G1 X133.169 Y135.643 E-.66141
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.2 I.517 J-1.102 P1  F30000
G1 X127.876 Y133.162 Z18.2
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1211
G1 X127.876 Y136.898 E.12392
G1 X126.097 Y136.898 E.05903
G1 X126.097 Y133.162 E.12392
G1 X127.816 Y133.162 E.05704
G1 X128.077 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1211
G1 X128.241 Y132.77 E.00504
M106 S255
G1 F1800
G1 X128.269 Y132.77 E.00085
G1 X128.269 Y137.29 E.13889
G1 X128.241 Y137.29 E.00085
M106 S252.45
G1 F1211
G1 X128.077 Y137.29 E.00504
G1 X125.705 Y137.29 E.07289
G1 X125.705 Y132.77 E.13889
G1 X128.017 Y132.77 E.07104
M204 S10000
G1 X127.484 Y133.554 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1211
G1 X126.489 Y133.554 E.03059
G1 X126.489 Y136.506 E.0907
G1 X127.484 Y136.506 E.03059
G1 X127.484 Y133.614 E.08885
G1 X127.141 Y133.897 F30000
; LINE_WIDTH: 0.352101
G1 F1211
G1 X126.832 Y133.897 E.00779
G1 X126.832 Y136.163 E.05708
G1 X127.141 Y136.163 E.00779
G1 X127.141 Y133.957 E.05556
; CHANGE_LAYER
; Z_HEIGHT: 18
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.141 Y135.957 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 90/103
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
G3 Z18.2 I1.213 J.1 P1  F30000
G1 X128.212 Y122.958 Z18.2
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1517
G1 X126.186 Y122.958 E.0672
G1 X126.186 Y119.102 E.12791
G1 X128.212 Y119.102 E.0672
G1 X128.212 Y122.898 E.12592
G1 X128.31 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1517
G1 X125.794 Y123.35 E.07728
G1 X125.794 Y118.71 E.14257
G1 X128.31 Y118.71 E.07728
G1 X128.392 Y118.71 E.00252
G1 X128.556 Y118.71 E.00504
M106 S255
G1 F600
G1 X128.604 Y118.71 E.00149
G1 X128.604 Y123.35 E.14257
G1 X128.556 Y123.35 E.00149
M106 S252.45
G1 F1517
G1 X128.392 Y123.35 E.00504
G1 X128.37 Y123.35 E.00068
M204 S10000
G1 X127.82 Y122.566 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1517
G1 X127.82 Y119.494 E.09438
G1 X126.578 Y119.494 E.03815
G1 X126.578 Y122.566 E.09438
G1 X127.76 Y122.566 E.0363
G1 X127.415 Y122.161 F30000
; LINE_WIDTH: 0.475139
G1 F1517
G1 X127.415 Y119.899 E.07968
G1 X126.983 Y119.899 E.01522
G1 X126.983 Y122.161 E.07968
G1 X127.355 Y122.161 E.01311
; WIPE_START
G1 F24000
G1 X126.983 Y122.161 E-.14144
G1 X126.983 Y120.533 E-.61856
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I-.55 J1.085 P1  F30000
G1 X131.766 Y122.958 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1517
G1 X131.766 Y119.102 E.12791
G1 X133.829 Y119.102 E.06841
G1 X133.829 Y122.958 E.12791
G1 X131.826 Y122.958 E.06642
G1 X131.676 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1517
G1 X131.594 Y123.35 E.00252
G1 X131.43 Y123.35 E.00504
M106 S255
G1 F600
G1 X131.374 Y123.35 E.00172
G1 X131.374 Y118.71 E.14257
G1 X131.43 Y118.71 E.00172
M106 S252.45
G1 F1517
G1 X131.594 Y118.71 E.00504
G1 X131.676 Y118.71 E.00252
G1 X134.221 Y118.71 E.07819
G1 X134.221 Y123.35 E.14257
G1 X131.736 Y123.35 E.07635
M204 S10000
G1 X132.158 Y122.566 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1517
G1 X133.437 Y122.566 E.03927
G1 X133.437 Y119.494 E.09438
G1 X132.158 Y119.494 E.03927
G1 X132.158 Y122.506 E.09254
G1 X132.572 Y122.152 F30000
; LINE_WIDTH: 0.493472
G1 F1517
G1 X133.023 Y122.152 E.01654
G1 X133.023 Y119.908 E.08239
G1 X132.572 Y119.908 E.01654
G1 X132.572 Y122.092 E.08019
; WIPE_START
G1 F24000
G1 X132.572 Y120.092 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I-1.215 J-.075 P1  F30000
G1 X131.766 Y133.162 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1517
G1 X133.829 Y133.162 E.06841
G1 X133.829 Y136.898 E.12392
G1 X131.766 Y136.898 E.06841
G1 X131.766 Y133.222 E.12193
G1 X131.594 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1517
G1 X131.676 Y132.77 E.00252
G1 X134.221 Y132.77 E.07819
G1 X134.221 Y137.29 E.13889
G1 X131.676 Y137.29 E.07819
G1 X131.594 Y137.29 E.00252
G1 X131.43 Y137.29 E.00504
M106 S255
G1 F600
G1 X131.374 Y137.29 E.00172
G1 X131.374 Y132.77 E.13889
G1 X131.43 Y132.77 E.00172
M106 S252.45
M73 P89 R1
G1 F1517
G1 X131.534 Y132.77 E.0032
M204 S10000
; WIPE_START
G1 F24000
G1 X131.676 Y132.77 E-.05396
G1 X133.534 Y132.77 E-.70604
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I-.603 J-1.057 P1  F30000
G1 X132.158 Y133.554 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1517
G1 X132.158 Y136.506 E.0907
G1 X133.437 Y136.506 E.03927
G1 X133.437 Y133.554 E.0907
G1 X132.218 Y133.554 E.03743
G1 X132.572 Y133.968 F30000
; LINE_WIDTH: 0.493472
G1 F1517
G1 X132.572 Y136.092 E.07798
G1 X133.023 Y136.092 E.01654
G1 X133.023 Y133.968 E.07798
G1 X132.632 Y133.968 E.01434
; WIPE_START
G1 F24000
G1 X133.023 Y133.968 E-.14841
G1 X133.023 Y135.577 E-.61159
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.4 I.546 J-1.088 P1  F30000
G1 X128.212 Y133.162 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1517
G1 X128.212 Y136.898 E.12392
G1 X126.186 Y136.898 E.0672
G1 X126.186 Y133.162 E.12392
G1 X128.152 Y133.162 E.06521
G1 X128.31 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1517
G1 X128.392 Y132.77 E.00252
G1 X128.556 Y132.77 E.00504
M106 S255
G1 F600
G1 X128.604 Y132.77 E.00149
G1 X128.604 Y137.29 E.13889
G1 X128.556 Y137.29 E.00149
M106 S252.45
G1 F1517
G1 X128.392 Y137.29 E.00504
G1 X128.31 Y137.29 E.00252
G1 X125.794 Y137.29 E.07728
G1 X125.794 Y132.77 E.13889
G1 X128.25 Y132.77 E.07544
M204 S10000
G1 X127.82 Y133.554 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1517
G1 X126.578 Y133.554 E.03815
M73 P90 R1
G1 X126.578 Y136.506 E.0907
G1 X127.82 Y136.506 E.03815
G1 X127.82 Y133.614 E.08885
G1 X127.415 Y133.959 F30000
; LINE_WIDTH: 0.475139
G1 F1517
G1 X126.983 Y133.959 E.01522
G1 X126.983 Y136.101 E.07546
G1 X127.415 Y136.101 E.01522
G1 X127.415 Y134.019 E.07334
; CHANGE_LAYER
; Z_HEIGHT: 18.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.415 Y136.019 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 91/103
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
G3 Z18.4 I1.217 J.025 P1  F30000
G1 X127.684 Y122.958 Z18.4
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1419
G1 X126.276 Y122.958 E.0467
G1 X126.276 Y119.102 E.12791
G1 X128.632 Y119.102 E.07814
G1 X128.717 Y119.102 E.00282
G1 X128.748 Y119.102 E.00103
G1 X128.748 Y122.958 E.12791
G1 X128.717 Y122.958 E.00103
G1 X128.632 Y122.958 E.00282
G1 X127.744 Y122.958 E.02945
G1 X127.684 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1419
G1 X125.884 Y123.35 E.0553
G1 X125.884 Y118.71 E.14257
G1 X129.014 Y118.71 E.09618
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X129.14 Y118.71 E.00417
G1 X129.14 Y123.35 E.15392
G1 X129.014 Y123.35 E.00417
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1419
G1 X128.645 Y123.35 E.01134
G1 X127.744 Y123.35 E.0277
M204 S10000
; WIPE_START
G1 F24000
G1 X125.884 Y123.35 E-.70674
G1 X125.884 Y123.21 E-.05326
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I.821 J.898 P1  F30000
G1 X127.512 Y121.722 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.599264
G1 F1419
G1 X127.512 Y120.398 E.06003
G1 X127.979 Y122.189 F30000
; LINE_WIDTH: 0.419999
G1 F1419
G1 X127.979 Y119.871 E.07121
G1 X127.045 Y119.871 E.02868
G1 X127.045 Y122.189 E.07121
G1 X127.919 Y122.189 E.02684
G1 X128.356 Y122.566 F30000
G1 F1419
G1 X128.356 Y119.494 E.09438
G1 X126.668 Y119.494 E.05185
G1 X126.668 Y122.566 E.09438
G1 X128.296 Y122.566 E.05001
; WIPE_START
G1 F24000
G1 X126.668 Y122.566 E-.61848
G1 X126.668 Y122.193 E-.14152
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I-.132 J1.21 P1  F30000
G1 X133.694 Y122.958 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1419
G1 X131.347 Y122.958 E.07787
G1 X131.262 Y122.958 E.00282
G1 X131.246 Y122.958 E.00053
G1 X131.246 Y119.102 E.12791
G1 X131.262 Y119.102 E.00053
G1 X131.347 Y119.102 E.00282
G1 X133.694 Y119.102 E.07787
G1 X133.694 Y122.898 E.12592
G1 X134.086 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1419
G1 X130.964 Y123.35 E.09594
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X130.854 Y123.35 E.00366
G1 X130.854 Y118.71 E.15392
G1 X130.964 Y118.71 E.00366
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1419
G1 X131.333 Y118.71 E.01134
G1 X134.086 Y118.71 E.0846
G1 X134.086 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X132.087 Y123.328 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I1.183 J.284 P1  F30000
G1 X132.47 Y121.734 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.575986
G1 F1419
G1 X132.47 Y120.386 E.05853
G1 X132.015 Y122.189 F30000
; LINE_WIDTH: 0.419999
G1 F1419
G1 X132.925 Y122.189 E.02797
G1 X132.925 Y119.871 E.07121
G1 X132.015 Y119.871 E.02797
G1 X132.015 Y122.129 E.06937
G1 X131.638 Y122.566 F30000
G1 F1419
G1 X133.302 Y122.566 E.05114
G1 X133.302 Y119.494 E.09438
G1 X131.638 Y119.494 E.05114
G1 X131.638 Y122.506 E.09254
; WIPE_START
G1 F24000
G1 X131.638 Y120.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I-1.214 J.081 P1  F30000
G1 X132.486 Y133.162 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1419
G1 X133.694 Y133.162 E.04009
G1 X133.694 Y136.898 E.12392
G1 X131.347 Y136.898 E.07787
G1 X131.262 Y136.898 E.00282
G1 X131.246 Y136.898 E.00053
G1 X131.246 Y133.162 E.12392
G1 X131.262 Y133.162 E.00053
G1 X131.347 Y133.162 E.00282
G1 X132.426 Y133.162 E.03579
G1 X132.486 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1419
G1 X134.086 Y132.77 E.04919
G1 X134.086 Y137.29 E.13889
G1 X130.964 Y137.29 E.09594
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X130.854 Y137.29 E.00366
G1 X130.854 Y132.77 E.14994
G1 X130.964 Y132.77 E.00366
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1419
G1 X131.333 Y132.77 E.01134
G1 X132.426 Y132.77 E.03357
M204 S10000
; WIPE_START
G1 F24000
G1 X134.086 Y132.77 E-.63109
G1 X134.086 Y133.109 E-.12891
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I-1.03 J-.649 P1  F30000
G1 X132.47 Y135.674 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.575984
G1 F1419
G1 X132.47 Y134.446 E.05331
G1 X132.015 Y133.931 F30000
; LINE_WIDTH: 0.419999
G1 F1419
G1 X132.015 Y136.129 E.06752
G1 X132.925 Y136.129 E.02797
G1 X132.925 Y133.931 E.06752
G1 X132.075 Y133.931 E.02612
G1 X131.638 Y133.554 F30000
G1 F1419
G1 X131.638 Y136.506 E.0907
G1 X133.302 Y136.506 E.05114
G1 X133.302 Y133.554 E.0907
G1 X131.698 Y133.554 E.0493
; WIPE_START
G1 F24000
G1 X133.302 Y133.554 E-.60963
G1 X133.302 Y133.95 E-.15037
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I.136 J-1.209 P1  F30000
G1 X126.276 Y133.162 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1419
G1 X128.632 Y133.162 E.07814
G1 X128.717 Y133.162 E.00282
G1 X128.748 Y133.162 E.00103
G1 X128.748 Y136.898 E.12392
G1 X128.717 Y136.898 E.00103
G1 X128.632 Y136.898 E.00282
G1 X126.276 Y136.898 E.07814
G1 X126.276 Y133.222 E.12193
G1 X125.884 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1419
G1 X129.014 Y132.77 E.09618
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X129.14 Y132.77 E.00417
G1 X129.14 Y137.29 E.14994
G1 X129.014 Y137.29 E.00417
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1419
G1 X128.645 Y137.29 E.01134
G1 X125.884 Y137.29 E.08485
G1 X125.884 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X127.884 Y132.792 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.6 I-1.207 J-.156 P1  F30000
G1 X127.512 Y135.662 Z18.6
G1 Z18.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.599264
G1 F1419
G1 X127.512 Y134.458 E.05459
G1 X127.979 Y133.931 F30000
; LINE_WIDTH: 0.419999
G1 F1419
G1 X127.045 Y133.931 E.02868
G1 X127.045 Y136.129 E.06752
G1 X127.979 Y136.129 E.02868
G1 X127.979 Y133.991 E.06568
G1 X128.356 Y133.554 F30000
G1 F1419
G1 X126.668 Y133.554 E.05185
G1 X126.668 Y136.506 E.0907
G1 X128.356 Y136.506 E.05185
G1 X128.356 Y133.614 E.08885
; CHANGE_LAYER
; Z_HEIGHT: 18.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X128.356 Y135.614 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 92/103
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
G3 Z18.6 I.953 J-.757 P1  F30000
G1 X126.408 Y133.162 Z18.6
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1348
G1 X129.55 Y133.162 E.10421
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X130.444 Y133.162 E.02966
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F1348
G1 X133.56 Y133.162 E.10337
G1 X133.56 Y136.898 E.12392
G1 X130.444 Y136.898 E.10337
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X129.55 Y136.898 E.02966
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F1348
G1 X129.167 Y136.898 E.01269
G1 X126.408 Y136.898 E.09152
G1 X126.408 Y133.222 E.12193
G1 X126.016 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1348
G1 X129.55 Y132.77 E.10857
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X130.444 Y132.77 E.02966
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1348
G1 X133.952 Y132.77 E.1078
G1 X133.952 Y137.29 E.13889
G1 X130.444 Y137.29 E.1078
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X129.55 Y137.29 E.02966
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1348
G1 X129.181 Y137.29 E.01134
G1 X126.016 Y137.29 E.09723
G1 X126.016 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X128.016 Y132.796 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.8 I-1.182 J.289 P1  F30000
M73 P91 R1
G1 X128.201 Y133.554 Z18.8
G1 Z18.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1348
G1 X126.8 Y133.554 E.04304
G1 X126.8 Y136.506 E.0907
G1 X128.201 Y136.506 E.04304
G1 X128.201 Y133.614 E.08885
G1 X127.757 Y133.999 F30000
; LINE_WIDTH: 0.554759
G1 F1348
G1 X127.245 Y133.999 E.02135
G1 X127.245 Y136.061 E.08603
G1 X127.757 Y136.061 E.02135
G1 X127.757 Y134.059 E.08353
G1 X128.409 Y136.562 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.425856
M106 S255
G1 F3000
G1 X131.415 Y136.562 E.09382
G1 X131.415 Y136.179 E.01195
G1 X128.578 Y136.179 E.08853
G1 X128.578 Y135.796 E.01195
G1 X131.415 Y135.796 E.08853
G1 X131.415 Y135.413 E.01195
G1 X128.578 Y135.413 E.08853
G1 X128.578 Y135.03 E.01195
G1 X131.415 Y135.03 E.08853
G1 X131.415 Y134.647 E.01195
G1 X128.578 Y134.647 E.08853
G1 X128.578 Y134.264 E.01195
G1 X131.415 Y134.264 E.08853
G1 X131.415 Y133.881 E.01195
G1 X128.578 Y133.881 E.08853
G1 X128.578 Y133.498 E.01195
G1 X131.585 Y133.498 E.09382
M106 S252.45
G1 X131.792 Y133.554 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1348
G1 X131.792 Y136.506 E.0907
G1 X133.168 Y136.506 E.04227
G1 X133.168 Y133.554 E.0907
G1 X131.852 Y133.554 E.04042
G1 X132.231 Y133.992 F30000
; LINE_WIDTH: 0.54218
G1 F1348
G1 X132.231 Y136.068 E.08443
G1 X132.73 Y136.068 E.02031
G1 X132.73 Y133.992 E.08443
G1 X132.291 Y133.992 E.01787
; WIPE_START
G1 F24000
G1 X132.73 Y133.992 E-.16692
G1 X132.73 Y135.553 E-.59308
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18.8 I1.129 J-.453 P1  F30000
G1 X127.678 Y122.958 Z18.8
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1348
G1 X126.408 Y122.958 E.0421
G1 X126.408 Y119.102 E.12791
G1 X129.55 Y119.102 E.10421
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X130.444 Y119.102 E.02966
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F1348
G1 X133.56 Y119.102 E.10337
G1 X133.56 Y122.958 E.12791
G1 X130.444 Y122.958 E.10337
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X129.55 Y122.958 E.02966
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F1348
G1 X129.167 Y122.958 E.01269
G1 X127.738 Y122.958 E.04742
G1 X127.678 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1348
G1 X126.016 Y123.35 E.05105
G1 X126.016 Y118.71 E.14257
G1 X129.55 Y118.71 E.10857
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X130.444 Y118.71 E.02966
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1348
G1 X133.952 Y118.71 E.1078
G1 X133.952 Y123.35 E.14257
G1 X130.444 Y123.35 E.1078
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X129.55 Y123.35 E.02966
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1348
G1 X129.181 Y123.35 E.01134
G1 X127.738 Y123.35 E.04434
M204 S10000
G1 X128.201 Y122.566 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1348
G1 X128.201 Y119.494 E.09438
G1 X126.8 Y119.494 E.04304
G1 X126.8 Y122.566 E.09438
G1 X128.141 Y122.566 E.0412
G1 X127.757 Y122.121 F30000
; LINE_WIDTH: 0.554759
G1 F1348
G1 X127.757 Y119.939 E.09104
G1 X127.245 Y119.939 E.02135
G1 X127.245 Y122.121 E.09104
G1 X127.697 Y122.121 E.01885
G1 X128.409 Y122.615 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.439189
M106 S255
G1 F3000
G1 X131.415 Y122.615 E.09709
G1 X131.415 Y122.219 E.0128
G1 X128.578 Y122.219 E.09161
G1 X128.578 Y121.822 E.0128
G1 X131.415 Y121.822 E.09161
G1 X131.415 Y121.426 E.0128
G1 X128.578 Y121.426 E.09161
G1 X128.578 Y121.03 E.0128
G1 X131.415 Y121.03 E.09161
G1 X131.415 Y120.634 E.0128
G1 X128.578 Y120.634 E.09161
G1 X128.578 Y120.237 E.0128
G1 X131.415 Y120.237 E.09161
G1 X131.415 Y119.841 E.0128
G1 X128.578 Y119.841 E.09161
G1 X128.578 Y119.445 E.0128
G1 X131.585 Y119.445 E.09709
M106 S252.45
G1 X131.792 Y122.566 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1348
G1 X133.168 Y122.566 E.04227
G1 X133.168 Y119.494 E.09438
G1 X131.792 Y119.494 E.04227
G1 X131.792 Y122.506 E.09254
G1 X132.231 Y122.128 F30000
; LINE_WIDTH: 0.54218
G1 F1348
G1 X132.73 Y122.128 E.02031
G1 X132.73 Y119.932 E.08931
G1 X132.231 Y119.932 E.02031
G1 X132.231 Y122.068 E.08687
; CHANGE_LAYER
; Z_HEIGHT: 18.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.231 Y120.068 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 93/103
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
G3 Z18.8 I-1.117 J-.483 P1  F30000
G1 X126.563 Y133.162 Z18.8
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1321
G1 X133.426 Y133.162 E.22765
G1 X133.426 Y136.898 E.12392
G1 X126.563 Y136.898 E.22765
G1 X126.563 Y133.222 E.12193
G1 X126.171 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1321
G1 X133.818 Y132.77 E.23497
G1 X133.818 Y137.29 E.13889
G1 X126.171 Y137.29 E.23497
G1 X126.171 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X128.171 Y132.814 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I-1.035 J.64 P1  F30000
G1 X129.539 Y135.03 Z19
G1 Z18.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.355052
G1 F1321
G1 X130.394 Y135.03 E.02174
G1 X130.799 Y134.685 F30000
; LINE_WIDTH: 0.419999
G1 F1321
G1 X129.195 Y134.685 E.04928
G1 X129.195 Y135.375 E.02118
G1 X130.799 Y135.375 E.04928
G1 X130.799 Y134.745 E.01933
G1 X131.176 Y134.308 F30000
G1 F1321
G1 X128.818 Y134.308 E.07246
G1 X128.818 Y135.752 E.04435
G1 X131.176 Y135.752 E.07246
G1 X131.176 Y134.368 E.04251
G1 X131.553 Y133.931 F30000
G1 F1321
G1 X128.441 Y133.931 E.09563
G1 X128.441 Y136.129 E.06752
G1 X131.553 Y136.129 E.09563
G1 X131.553 Y133.991 E.06568
G1 X131.93 Y133.554 F30000
G1 F1321
G1 X128.064 Y133.554 E.1188
G1 X128.064 Y136.506 E.0907
G1 X131.93 Y136.506 E.1188
G1 X131.93 Y133.614 E.08885
; WIPE_START
G1 F24000
G1 X131.93 Y135.614 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I1.153 J-.388 P1  F30000
G1 X127.672 Y122.958 Z19
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1321
G1 X126.563 Y122.958 E.03679
G1 X126.563 Y119.102 E.12791
G1 X133.426 Y119.102 E.22765
G1 X133.426 Y122.958 E.12791
G1 X127.732 Y122.958 E.18887
G1 X127.672 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1321
G1 X126.171 Y123.35 E.04613
G1 X126.171 Y118.71 E.14257
G1 X133.818 Y118.71 E.23497
G1 X133.818 Y123.35 E.14257
M73 P92 R1
G1 X127.732 Y123.35 E.187
M204 S10000
; WIPE_START
G1 F24000
G1 X126.171 Y123.35 E-.59327
G1 X126.171 Y122.911 E-.16673
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19 I.585 J1.067 P1  F30000
G1 X129.599 Y121.03 Z19
G1 Z18.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.475052
G1 F1321
G1 X130.334 Y121.03 E.02587
G1 X130.799 Y121.435 F30000
; LINE_WIDTH: 0.419999
G1 F1321
G1 X130.799 Y120.625 E.02486
G1 X129.195 Y120.625 E.04928
G1 X129.195 Y121.435 E.02486
G1 X130.739 Y121.435 E.04744
G1 X131.176 Y121.812 F30000
G1 F1321
G1 X131.176 Y120.248 E.04804
G1 X128.818 Y120.248 E.07246
G1 X128.818 Y121.812 E.04804
G1 X131.116 Y121.812 E.07061
G1 X131.553 Y122.189 F30000
G1 F1321
G1 X131.553 Y119.871 E.07121
G1 X128.441 Y119.871 E.09563
G1 X128.441 Y122.189 E.07121
G1 X131.493 Y122.189 E.09379
G1 X131.93 Y122.566 F30000
G1 F1321
G1 X131.93 Y119.494 E.09438
G1 X128.064 Y119.494 E.1188
G1 X128.064 Y122.566 E.09438
G1 X131.87 Y122.566 E.11696
; CHANGE_LAYER
; Z_HEIGHT: 18.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.87 Y122.566 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 94/103
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
G3 Z19 I-1.166 J-.347 P1  F30000
G1 X126.717 Y133.162 Z19
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1301
G1 X133.291 Y133.162 E.21807
G1 X133.291 Y136.898 E.12392
G1 X126.717 Y136.898 E.21807
G1 X126.717 Y133.222 E.12193
G1 X126.325 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1301
G1 X133.683 Y132.77 E.2261
G1 X133.683 Y137.29 E.13889
G1 X126.325 Y137.29 E.2261
G1 X126.325 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X128.325 Y132.814 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I-1.067 J.585 P1  F30000
G1 X129.539 Y135.03 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.355052
G1 F1301
G1 X130.394 Y135.03 E.02174
G1 X130.799 Y134.685 F30000
; LINE_WIDTH: 0.419999
G1 F1301
G1 X129.195 Y134.685 E.04928
G1 X129.195 Y135.375 E.02118
G1 X130.799 Y135.375 E.04928
G1 X130.799 Y134.745 E.01933
G1 X131.176 Y134.308 F30000
G1 F1301
G1 X128.818 Y134.308 E.07246
G1 X128.818 Y135.752 E.04435
G1 X131.176 Y135.752 E.07246
G1 X131.176 Y134.368 E.04251
G1 X131.553 Y133.931 F30000
G1 F1301
G1 X128.441 Y133.931 E.09563
G1 X128.441 Y136.129 E.06752
G1 X131.553 Y136.129 E.09563
G1 X131.553 Y133.991 E.06568
G1 X131.93 Y133.554 F30000
G1 F1301
G1 X128.064 Y133.554 E.1188
G1 X128.064 Y136.506 E.0907
G1 X131.93 Y136.506 E.1188
G1 X131.93 Y133.614 E.08885
; WIPE_START
G1 F24000
G1 X131.93 Y135.614 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I1.21 J.13 P1  F30000
G1 X133.291 Y122.958 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1301
G1 X126.717 Y122.958 E.21807
G1 X126.717 Y119.102 E.12791
G1 X133.291 Y119.102 E.21807
G1 X133.291 Y122.898 E.12592
G1 X133.683 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1301
G1 X126.325 Y123.35 E.2261
G1 X126.325 Y118.71 E.14257
G1 X133.683 Y118.71 E.2261
G1 X133.683 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.684 Y123.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.2 I.898 J-.822 P1  F30000
G1 X129.599 Y121.03 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.475052
G1 F1301
G1 X130.334 Y121.03 E.02587
G1 X130.799 Y121.435 F30000
; LINE_WIDTH: 0.419999
G1 F1301
G1 X130.799 Y120.625 E.02486
G1 X129.195 Y120.625 E.04928
G1 X129.195 Y121.435 E.02486
G1 X130.739 Y121.435 E.04744
G1 X131.176 Y121.812 F30000
G1 F1301
G1 X131.176 Y120.248 E.04804
G1 X128.818 Y120.248 E.07246
G1 X128.818 Y121.812 E.04804
G1 X131.116 Y121.812 E.07061
G1 X131.553 Y122.189 F30000
G1 F1301
G1 X131.553 Y119.871 E.07121
G1 X128.441 Y119.871 E.09563
G1 X128.441 Y122.189 E.07121
G1 X131.493 Y122.189 E.09379
G1 X131.93 Y122.566 F30000
G1 F1301
G1 X131.93 Y119.494 E.09438
G1 X128.064 Y119.494 E.1188
G1 X128.064 Y122.566 E.09438
G1 X131.87 Y122.566 E.11696
M106 S255
; CHANGE_LAYER
; Z_HEIGHT: 19
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.87 Y122.566 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 95/103
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
G3 Z19.2 I-1.171 J-.331 P1  F30000
G1 X126.872 Y133.162 Z19.2
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X133.14 Y133.162 E.20791
G1 X133.14 Y136.898 E.12392
G1 X126.872 Y136.898 E.20791
G1 X126.872 Y133.222 E.12193
G1 X126.48 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P93 R1
G1 F1200
G1 X133.532 Y132.77 E.21668
G1 X133.532 Y137.29 E.13889
G1 X126.48 Y137.29 E.21668
G1 X126.48 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X128.48 Y132.813 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I-.757 J.953 P1  F30000
G1 X129.87 Y133.917 Z19.4
G1 Z19
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X128.622 Y133.917 E.0414
G1 X128.622 Y134.298 E.01261
G1 X130.467 Y136.143 E.08655
G1 X129.533 Y136.143 E.03096
G1 X131.392 Y134.284 E.08721
G1 X131.392 Y135.912 E.05401
G1 X131.799 Y136.49 F30000
G1 F1200
G1 X131.799 Y133.51 E.09883
G1 X128.215 Y133.51 E.11891
G1 X128.215 Y136.55 E.10082
G1 X131.799 Y136.55 E.11891
G1 X132.688 Y136.443 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.53852
G1 F1200
G1 X132.688 Y133.677 E.11167
G1 X127.307 Y136.459 F30000
; LINE_WIDTH: 0.505552
G1 F1200
G1 X127.307 Y133.661 E.10549
; WIPE_START
G1 F24000
G1 X127.307 Y135.661 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I1.106 J.508 P1  F30000
G1 X133.14 Y122.958 Z19.4
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X126.872 Y122.958 E.20791
G1 X126.872 Y119.102 E.12791
G1 X133.14 Y119.102 E.20791
G1 X133.14 Y122.898 E.12592
G1 X133.532 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.48 Y123.35 E.21668
G1 X126.48 Y118.71 E.14257
G1 X133.532 Y118.71 E.21668
G1 X133.532 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.532 Y123.307 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.4 I1.136 J.436 P1  F30000
G1 X131.799 Y122.61 Z19.4
G1 Z19
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X128.215 Y122.61 E.11891
G1 X128.215 Y119.45 E.1048
G1 X131.799 Y119.45 E.11891
G1 X131.799 Y122.55 E.10281
G1 X130.25 Y122.203 F30000
G1 F1200
G1 X131.392 Y122.203 E.03788
G1 X131.392 Y121.716 E.01613
G1 X129.533 Y119.857 E.08721
G1 X130.467 Y119.857 E.03096
G1 X128.622 Y121.702 E.08655
G1 X128.622 Y120.074 E.05401
G1 X127.307 Y122.519 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.505554
G1 F1200
G1 X127.307 Y119.601 E.11001
G1 X132.688 Y119.557 F30000
; LINE_WIDTH: 0.538518
G1 F1200
G1 X132.688 Y122.443 E.11652
; CHANGE_LAYER
; Z_HEIGHT: 19.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X132.688 Y120.443 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 96/103
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
G3 Z19.4 I-1.112 J-.495 P1  F30000
G1 X127.026 Y133.162 Z19.4
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X132.922 Y133.162 E.19556
G1 X132.922 Y136.898 E.12392
G1 X127.026 Y136.898 E.19556
G1 X127.026 Y133.222 E.12193
G1 X126.634 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.314 Y132.77 E.20525
G1 X133.314 Y137.29 E.13889
G1 X126.634 Y137.29 E.20525
G1 X126.634 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X128.634 Y132.812 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.6 I-.811 J.907 P1  F30000
G1 X129.87 Y133.917 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X128.622 Y133.917 E.0414
G1 X128.622 Y134.298 E.01261
G1 X130.467 Y136.143 E.08655
G1 X129.533 Y136.143 E.03096
G1 X131.392 Y134.284 E.08721
G1 X131.392 Y135.912 E.05401
G1 X131.799 Y136.49 F30000
G1 F1200
G1 X131.799 Y133.51 E.09883
G1 X128.215 Y133.51 E.11891
G1 X128.215 Y136.55 E.10082
G1 X131.799 Y136.55 E.11891
G1 X132.47 Y136.443 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.538518
G1 F1200
G1 X132.47 Y133.677 E.11167
G1 X127.508 Y136.412 F30000
; LINE_WIDTH: 0.60014
G1 F1200
G1 X127.508 Y133.704 E.12294
; WIPE_START
G1 F24000
G1 X127.508 Y135.704 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.6 I1.12 J.476 P1  F30000
G1 X132.922 Y122.958 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X127.026 Y122.958 E.19556
G1 X127.026 Y119.102 E.12791
G1 X132.922 Y119.102 E.19556
G1 X132.922 Y122.898 E.12592
G1 X133.314 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P94 R1
G1 F1200
G1 X126.634 Y123.35 E.20525
G1 X126.634 Y118.71 E.14257
G1 X133.314 Y118.71 E.20525
G1 X133.314 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.314 Y123.308 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.6 I.695 J.999 P1  F30000
G1 X132.47 Y122.503 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.538518
G1 F1200
G1 X132.47 Y119.617 E.11652
G1 X131.799 Y122.55 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X131.799 Y119.45 E.10281
G1 X128.215 Y119.45 E.11891
G1 X128.215 Y122.61 E.1048
G1 X131.799 Y122.61 E.11891
G1 X130.25 Y122.203 F30000
G1 F1200
G1 X131.392 Y122.203 E.03788
G1 X131.392 Y121.716 E.01613
G1 X129.533 Y119.857 E.08721
G1 X130.467 Y119.857 E.03096
G1 X128.622 Y121.702 E.08655
G1 X128.622 Y120.074 E.05401
G1 X127.508 Y122.472 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.60014
G1 F1200
G1 X127.508 Y119.644 E.12839
; CHANGE_LAYER
; Z_HEIGHT: 19.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X127.508 Y121.644 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 97/103
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
G3 Z19.6 I-1.217 J-.025 P1  F30000
G1 X127.274 Y133.162 Z19.6
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X132.704 Y133.162 E.18011
G1 X132.704 Y136.898 E.12392
G1 X127.274 Y136.898 E.18011
G1 X127.274 Y133.222 E.12193
G1 X126.882 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X133.096 Y132.77 E.19093
G1 X133.096 Y137.29 E.13889
G1 X126.882 Y137.29 E.19093
G1 X126.882 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X128.882 Y132.811 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.8 I-.908 J.81 P1  F30000
G1 X129.87 Y133.917 Z19.8
G1 Z19.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X128.647 Y133.917 E.04057
G1 X128.647 Y134.323 E.01344
G1 X130.467 Y136.143 E.08538
G1 X129.533 Y136.143 E.03096
G1 X131.353 Y134.323 E.08536
G1 X131.353 Y135.951 E.05401
G1 X131.76 Y136.49 F30000
G1 F1200
G1 X131.76 Y133.51 E.09883
G1 X128.24 Y133.51 E.11678
G1 X128.24 Y136.55 E.10082
G1 X131.76 Y136.55 E.11678
G1 X132.232 Y136.426 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.579662
G1 F1200
G1 X132.232 Y133.698 E.11932
G1 X127.757 Y136.411 F30000
; LINE_WIDTH: 0.601006
G1 F1200
G1 X127.757 Y133.705 E.12309
; WIPE_START
G1 F24000
G1 X127.757 Y135.705 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.8 I1.135 J.44 P1  F30000
G1 X132.704 Y122.958 Z19.8
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X127.274 Y122.958 E.18011
G1 X127.274 Y119.102 E.12791
G1 X132.704 Y119.102 E.18011
G1 X132.704 Y122.898 E.12592
G1 X133.096 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.882 Y123.35 E.19093
G1 X126.882 Y118.71 E.14257
G1 X133.096 Y118.71 E.19093
G1 X133.096 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X131.096 Y123.309 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z19.8 I.714 J.985 P1  F30000
G1 X132.232 Y122.486 Z19.8
G1 Z19.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.57966
G1 F1200
G1 X132.232 Y119.638 E.12457
G1 X131.76 Y122.61 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X128.24 Y122.61 E.11678
G1 X128.24 Y119.45 E.1048
G1 X131.76 Y119.45 E.11678
G1 X131.76 Y122.55 E.10281
M73 P94 R0
G1 X130.25 Y122.203 F30000
G1 F1200
G1 X131.353 Y122.203 E.03658
G1 X131.353 Y121.677 E.01743
G1 X129.533 Y119.857 E.08536
G1 X130.467 Y119.857 E.03096
G1 X128.647 Y121.677 E.08538
G1 X128.647 Y120.049 E.05401
G1 X127.757 Y119.585 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.601006
G1 F1200
G1 X127.757 Y122.411 E.12855
; CHANGE_LAYER
; Z_HEIGHT: 19.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X127.757 Y120.411 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 98/103
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
G3 Z19.8 I-1.217 J-.022 P1  F30000
G1 X127.523 Y133.162 Z19.8
M73 P95 R0
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X132.486 Y133.162 E.16462
G1 X132.486 Y136.898 E.12392
G1 X127.523 Y136.898 E.16462
G1 X127.523 Y133.222 E.12193
G1 X127.131 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X132.878 Y132.77 E.17658
G1 X132.878 Y137.29 E.13889
G1 X127.131 Y137.29 E.17658
G1 X127.131 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X129.131 Y132.809 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20 I-.77 J-.943 P1  F30000
G1 X128.24 Y133.537 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.384954
G1 F1200
G1 X127.898 Y133.537 E.00953
G1 X127.898 Y136.521 E.08319
G1 X128.24 Y136.517 E.00953
G1 X128.24 Y133.597 E.08141
G1 X129.87 Y133.917 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X129.022 Y133.917 E.02813
G1 X129.022 Y134.698 E.02588
G1 X130.467 Y136.143 E.06778
G1 X129.533 Y136.143 E.03096
G1 X130.992 Y134.684 E.06844
G1 X130.992 Y136.143 E.04839
G1 X130.823 Y136.143 E.00562
G1 X131.399 Y136.49 F30000
G1 F1200
G1 X131.399 Y133.51 E.09883
G1 X128.615 Y133.51 E.09238
G1 X128.615 Y136.55 E.10082
G1 X131.399 Y136.55 E.09238
G1 X131.773 Y133.542 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.382753
G1 F1200
G1 X131.773 Y136.524 E.0826
G1 X132.113 Y136.524 E.00941
G1 X132.113 Y133.538 E.08271
G1 X131.833 Y133.541 E.00775
; WIPE_START
G1 F24000
G1 X132.113 Y133.538 E-.10635
G1 X132.113 Y135.258 E-.65365
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20 I1.216 J.037 P1  F30000
G1 X132.486 Y122.958 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X127.523 Y122.958 E.16462
G1 X127.523 Y119.102 E.12791
G1 X132.486 Y119.102 E.16462
G1 X132.486 Y122.898 E.12592
G1 X132.878 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X127.131 Y123.35 E.17658
G1 X127.131 Y118.71 E.14257
G1 X132.878 Y118.71 E.17658
G1 X132.878 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X130.878 Y123.311 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20 I.767 J.945 P1  F30000
G1 X131.773 Y122.584 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.382753
G1 F1200
G1 X132.113 Y122.584 E.00941
G1 X132.113 Y119.478 E.08604
G1 X131.773 Y119.481 E.00941
G1 X131.773 Y122.524 E.08427
G1 X131.399 Y122.55 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F1200
G1 X131.399 Y119.45 E.10281
G1 X128.615 Y119.45 E.09238
G1 X128.615 Y122.61 E.1048
G1 X131.399 Y122.61 E.09238
G1 X130.25 Y122.203 F30000
G1 F1200
G1 X130.992 Y122.203 E.02462
G1 X130.992 Y121.316 E.0294
G1 X129.533 Y119.857 E.06844
G1 X130.467 Y119.857 E.03096
G1 X129.022 Y121.302 E.06778
G1 X129.022 Y122.203 E.02986
G1 X129.75 Y122.203 E.02415
G1 X128.24 Y122.577 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.384954
G1 F1200
G1 X128.24 Y119.477 E.08642
G1 X127.898 Y119.477 E.00953
G1 X127.898 Y122.581 E.08653
G1 X128.18 Y122.578 E.00786
; CHANGE_LAYER
; Z_HEIGHT: 19.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X127.898 Y122.581 E-.10718
G1 X127.898 Y120.863 E-.65282
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 99/103
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
G3 Z20 I-1.217 J-.012 P1  F30000
G1 X127.773 Y133.162 Z20
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X132.237 Y133.162 E.14809
G1 X132.237 Y136.898 E.12392
G1 X127.773 Y136.898 E.14809
G1 X127.773 Y133.222 E.12193
G1 X127.38 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X132.629 Y132.77 E.16128
G1 X132.629 Y137.29 E.13889
G1 X127.38 Y137.29 E.16128
G1 X127.38 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X129.38 Y132.807 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.2 I-1.17 J-.334 P1  F30000
G1 X128.261 Y136.731 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.448983
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X128.261 Y133.532 E.20635
G1 X128.76 Y133.532 E.03219
G1 X128.76 Y136.528 E.19329
G1 X129.258 Y136.528 E.03219
G1 X129.258 Y133.532 E.19329
G1 X129.757 Y133.532 E.03219
G1 X129.757 Y136.528 E.19329
G1 X130.256 Y136.528 E.03219
G1 X130.256 Y133.532 E.19329
G1 X130.755 Y133.532 E.03219
G1 X130.755 Y136.528 E.19329
G1 X131.254 Y136.528 E.03219
G1 X131.254 Y133.532 E.19329
G1 X131.753 Y133.532 E.03219
M73 P96 R0
G1 X131.753 Y136.731 E.20635
; WIPE_START
G1 F24000
G1 X131.753 Y134.731 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.2 I1.216 J.05 P1  F30000
G1 X132.237 Y122.958 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1200
G1 X127.773 Y122.958 E.14809
G1 X127.773 Y119.102 E.12791
G1 X132.237 Y119.102 E.14809
G1 X132.237 Y122.898 E.12592
G1 X132.629 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X127.38 Y123.35 E.16128
G1 X127.38 Y118.71 E.14257
G1 X132.629 Y118.71 E.16128
G1 X132.629 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X130.629 Y123.313 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.2 I.513 J1.104 P1  F30000
G1 X131.753 Y122.791 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.448983
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X131.753 Y119.472 E.21409
G1 X131.254 Y119.472 E.03219
G1 X131.254 Y122.588 E.20103
G1 X130.755 Y122.588 E.03219
G1 X130.755 Y119.472 E.20103
G1 X130.256 Y119.472 E.03219
G1 X130.256 Y122.588 E.20103
G1 X129.757 Y122.588 E.03219
G1 X129.757 Y119.472 E.20103
G1 X129.258 Y119.472 E.03219
G1 X129.258 Y122.588 E.20103
G1 X128.76 Y122.588 E.03219
G1 X128.76 Y119.472 E.20103
G1 X128.261 Y119.472 E.03219
G1 X128.261 Y122.791 E.21409
; CHANGE_LAYER
; Z_HEIGHT: 20
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.261 Y120.791 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 100/103
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
G3 Z20.2 I-1.217 J-.018 P1  F30000
G1 X128.074 Y133.162 Z20.2
G1 Z20
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X131.876 Y133.162 E.12614
G1 X131.876 Y136.898 E.12392
G1 X128.074 Y136.898 E.12614
G1 X128.074 Y133.222 E.12193
G1 X127.682 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X132.268 Y132.77 E.14094
G1 X132.268 Y137.29 E.13889
G1 X127.682 Y137.29 E.14094
G1 X127.682 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X129.681 Y132.804 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.4 I-1.146 J.409 P1  F30000
G1 X130.353 Y134.685 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.597 Y134.685 E.02323
G1 X129.597 Y135.375 E.02118
G1 X130.353 Y135.375 E.02323
G1 X130.353 Y134.745 E.01933
G1 X130.73 Y134.308 F30000
G1 F1200
G1 X129.22 Y134.308 E.0464
G1 X129.22 Y135.752 E.04435
G1 X130.73 Y135.752 E.0464
G1 X130.73 Y134.368 E.04251
G1 X131.107 Y133.931 F30000
G1 F1200
G1 X128.843 Y133.931 E.06958
G1 X128.843 Y136.129 E.06752
G1 X131.107 Y136.129 E.06958
G1 X131.107 Y133.991 E.06568
G1 X131.484 Y133.554 F30000
G1 F1200
G1 X128.466 Y133.554 E.09275
G1 X128.466 Y136.506 E.0907
G1 X131.484 Y136.506 E.09275
G1 X131.484 Y133.614 E.08885
; WIPE_START
G1 F24000
G1 X131.484 Y135.614 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.4 I1.216 J.038 P1  F30000
G1 X131.876 Y122.958 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X128.074 Y122.958 E.12614
G1 X128.074 Y119.102 E.12791
G1 X131.876 Y119.102 E.12614
G1 X131.876 Y122.898 E.12592
G1 X132.268 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X127.682 Y123.35 E.14094
G1 X127.682 Y118.71 E.14257
G1 X132.268 Y118.71 E.14094
G1 X132.268 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X130.269 Y123.316 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.4 I1.216 J.055 P1  F30000
G1 X130.353 Y121.435 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F1200
G1 X130.353 Y120.625 E.02486
G1 X129.597 Y120.625 E.02323
G1 X129.597 Y121.435 E.02486
G1 X130.293 Y121.435 E.02139
G1 X130.73 Y121.812 F30000
G1 F1200
G1 X130.73 Y120.248 E.04804
G1 X129.22 Y120.248 E.0464
G1 X129.22 Y121.812 E.04804
G1 X130.67 Y121.812 E.04456
G1 X131.107 Y122.189 F30000
G1 F1200
G1 X131.107 Y119.871 E.07121
G1 X128.843 Y119.871 E.06958
G1 X128.843 Y122.189 E.07121
G1 X131.047 Y122.189 E.06773
G1 X131.484 Y122.566 F30000
G1 F1200
G1 X131.484 Y119.494 E.09438
G1 X128.466 Y119.494 E.09275
G1 X128.466 Y122.566 E.09438
G1 X131.424 Y122.566 E.09091
; CHANGE_LAYER
; Z_HEIGHT: 20.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.424 Y122.566 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 101/103
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
G3 Z20.4 I-1.212 J-.106 P1  F30000
G1 X128.498 Y133.162 Z20.4
G1 Z20.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X131.516 Y133.162 E.10008
G1 X131.516 Y136.898 E.12392
G1 X128.498 Y136.898 E.10008
G1 X128.498 Y133.222 E.12193
G1 X128.106 Y132.77 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X131.908 Y132.77 E.1168
G1 X131.908 Y137.29 E.13889
G1 X128.106 Y137.29 E.1168
G1 X128.106 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X130.106 Y132.798 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P97 R0
G3 Z20.6 I-1.216 J-.047 P1  F30000
G1 X130.007 Y135.389 Z20.6
G1 Z20.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.390464
G1 F1200
G1 X130.007 Y134.731 E.01866
G1 X129.645 Y134.308 F30000
; LINE_WIDTH: 0.419999
G1 F1200
G1 X129.645 Y135.752 E.04435
G1 X130.369 Y135.752 E.02227
G1 X130.369 Y134.308 E.04435
G1 X129.705 Y134.308 E.02042
G1 X129.268 Y133.931 F30000
G1 F1200
G1 X129.268 Y136.129 E.06752
G1 X130.746 Y136.129 E.04544
G1 X130.746 Y133.931 E.06752
G1 X129.328 Y133.931 E.0436
G1 X128.891 Y133.554 F30000
G1 F1200
G1 X128.891 Y136.506 E.0907
G1 X131.123 Y136.506 E.06861
G1 X131.123 Y133.554 E.0907
G1 X128.951 Y133.554 E.06677
; WIPE_START
G1 F24000
G1 X130.951 Y133.554 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.6 I1.215 J.065 P1  F30000
G1 X131.516 Y122.958 Z20.6
G1 Z20.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X128.498 Y122.958 E.10008
G1 X128.498 Y119.102 E.12791
G1 X131.516 Y119.102 E.10008
G1 X131.516 Y122.898 E.12592
G1 X131.908 Y123.35 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X128.106 Y123.35 E.1168
G1 X128.106 Y118.71 E.14257
G1 X131.908 Y118.71 E.1168
G1 X131.908 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X129.908 Y123.322 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.6 I1.215 J.064 P1  F30000
G1 X130.007 Y121.449 Z20.6
G1 Z20.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.390466
G1 F1200
G1 X130.007 Y120.671 E.02205
G1 X129.645 Y121.812 F30000
; LINE_WIDTH: 0.419999
G1 F1200
G1 X130.369 Y121.812 E.02227
G1 X130.369 Y120.248 E.04804
G1 X129.645 Y120.248 E.02227
G1 X129.645 Y121.752 E.04619
G1 X129.268 Y122.189 F30000
G1 F1200
G1 X130.746 Y122.189 E.04544
G1 X130.746 Y119.871 E.07121
G1 X129.268 Y119.871 E.04544
G1 X129.268 Y122.129 E.06937
G1 X128.891 Y122.566 F30000
G1 F1200
G1 X131.123 Y122.566 E.06861
G1 X131.123 Y119.494 E.09438
G1 X128.891 Y119.494 E.06861
G1 X128.891 Y122.506 E.09254
; CHANGE_LAYER
; Z_HEIGHT: 20.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X128.891 Y120.506 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 102/103
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
G3 Z20.6 I-1.216 J-.036 P1  F30000
G1 X128.531 Y132.77 Z20.6
G1 Z20.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X131.417 Y132.77 E.08868
G1 X131.417 Y137.29 E.13889
G1 X128.531 Y137.29 E.08868
G1 X128.531 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X130.531 Y132.788 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.8 I-1.215 J.071 P1  F30000
G1 X130.783 Y137.083 Z20.8
G1 Z20.4
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F1200
G1 X131.21 Y136.656 E.01855
G1 X131.21 Y136.123
G1 X130.25 Y137.083 E.04172
G1 X129.716 Y137.083
G1 X131.21 Y135.589 E.06489
G1 X131.21 Y135.056
G1 X129.183 Y137.083 E.08807
G1 X128.739 Y136.994
G1 X131.21 Y134.523 E.10738
G1 X131.21 Y133.989
G1 X128.739 Y136.461 E.10738
G1 X128.739 Y135.927
G1 X131.21 Y133.456 E.10738
G1 X131.155 Y132.977
G1 X128.739 Y135.394 E.10501
G1 X128.739 Y134.861
G1 X130.622 Y132.977 E.08184
G1 X130.089 Y132.977
G1 X128.739 Y134.327 E.05867
G1 X128.739 Y133.794
G1 X129.555 Y132.977 E.03549
M204 S10000
; WIPE_START
G1 F24000
G1 X128.739 Y133.794 E-.43893
G1 X128.739 Y134.327 E-.20264
G1 X128.959 Y134.107 E-.11842
; WIPE_END
G1 E-.04 F1800
G17
G3 Z20.8 I1.186 J.271 P1  F30000
G1 X131.417 Y123.35 Z20.8
G1 Z20.4
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
G1 F1200
G1 X128.531 Y123.35 E.08868
G1 X128.531 Y118.71 E.14257
G1 X131.417 Y118.71 E.08868
G1 X131.417 Y123.29 E.14073
M204 S10000
G1 X131.21 Y122.791 F30000
M204 S2000
; FEATURE: Top surface
G1 F1200
G1 X130.858 Y123.143 E.01529
G1 X130.325 Y123.143
G1 X131.21 Y122.257 E.03846
G1 X131.21 Y121.724
G1 X129.791 Y123.143 E.06164
G1 X129.258 Y123.143
G1 X131.21 Y121.191 E.08481
G1 X131.21 Y120.658
G1 X128.739 Y123.129 E.10738
G1 X128.739 Y122.595
G1 X131.21 Y120.124 E.10738
G1 X131.21 Y119.591
G1 X128.739 Y122.062 E.10738
G1 X128.739 Y121.529
G1 X131.21 Y119.058 E.10738
G1 X130.817 Y118.917
G1 X128.739 Y120.996 E.09031
G1 X128.739 Y120.462
G1 X130.284 Y118.917 E.06714
G1 X129.75 Y118.917
G1 X128.739 Y119.929 E.04397
G1 X128.739 Y119.396
G1 X129.217 Y118.917 E.02079
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 20.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.739 Y119.396 E-.25714
G1 X128.739 Y119.929 E-.20264
G1 X129.297 Y119.37 E-.30022
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 103/103
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
G3 Z20.8 I-1.217 J.008 P1  F30000
G1 X129.382 Y132.77 Z20.8
G1 Z20.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
G1 F1200
G1 X130.693 Y132.77 E.04029
G1 X130.693 Y137.29 E.13889
G1 X129.382 Y137.29 E.04029
G1 X129.382 Y132.83 E.13704
M204 S10000
; WIPE_START
G1 F24000
G1 X130.693 Y132.77 E-.49876
G1 X130.693 Y133.457 E-.26124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21 I-.506 J-1.107 P1  F30000
G1 X130.486 Y133.552 Z21
G1 Z20.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F1200
G1 X129.911 Y132.977 E.02498
M73 P98 R0
G1 X129.59 Y133.189
G1 X130.486 Y134.085 E.03895
G1 X130.486 Y134.619
G1 X129.59 Y133.722 E.03895
G1 X129.59 Y134.256
G1 X130.486 Y135.152 E.03895
G1 X130.486 Y135.685
G1 X129.59 Y134.789 E.03895
G1 X129.59 Y135.322
G1 X130.486 Y136.219 E.03895
G1 X130.486 Y136.752
G1 X129.59 Y135.855 E.03895
G1 X129.59 Y136.389
G1 X130.284 Y137.083 E.03015
M204 S10000
G1 X130.453 Y137.101 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.146042
G1 F1200
G1 X130.453 Y136.913 E.00159
G1 X130.416 Y136.822 E.00083
; WIPE_START
G1 F24000
G1 X130.453 Y136.913 E-.26017
G1 X130.453 Y137.101 E-.49983
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21 I1.217 J.021 P1  F30000
G1 X130.693 Y123.35 Z21
G1 Z20.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.382 Y123.35 E.04029
G1 X129.382 Y118.71 E.14257
G1 X130.693 Y118.71 E.04029
G1 X130.693 Y123.29 E.14073
M204 S10000
; WIPE_START
G1 F24000
G1 X129.382 Y123.35 E-.49876
G1 X129.382 Y122.663 E-.26124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z21 I1.212 J.108 P1  F30000
G1 X129.716 Y118.917 Z21
G1 Z20.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F1200
G1 X130.486 Y119.687 E.03345
G1 X130.486 Y120.22
G1 X129.59 Y119.324 E.03895
G1 X129.59 Y119.857
G1 X130.486 Y120.754 E.03895
G1 X130.486 Y121.287
G1 X129.59 Y120.391 E.03895
G1 X129.59 Y120.924
G1 X130.486 Y121.82 E.03895
G1 X130.486 Y122.354
G1 X129.59 Y121.457 E.03895
G1 X129.59 Y121.99
G1 X130.486 Y122.887 E.03895
G1 X130.209 Y123.143
G1 X129.59 Y122.524 E.02689
M204 S10000
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X130.209 Y123.143 E-.3326
G1 X130.486 Y122.887 E-.14341
G1 X129.958 Y122.358 E-.284
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
G1 Z21.1 F900 ; lower z a little
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

    G1 Z120.6 F600
    G1 Z118.6

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

