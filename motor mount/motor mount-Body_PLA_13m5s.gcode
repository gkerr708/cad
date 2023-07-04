; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 7m 16s; total estimated time: 13m 5s
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
M73 P34 R8
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
G1 E-0.5 F300

G1 X70 F9000
M73 P36 R8
G1 X76 F15000
M73 P38 R8
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
M73 P38 R7
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000

M221 R; pop softend status
M73 P39 R7
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
    G29 A X107.5 Y107.5 I45 J45
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
M73 P40 R7
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
G1 X141.608 Y123.763 F30000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X141.611 Y123.774 E.00041
G3 X129.692 Y115.646 I-11.611 J4.224 E2.3177
G1 X130.308 Y115.646 E.02295
M73 P41 R7
G3 X141.386 Y123.2 I-.308 J12.352 E.52787
G1 X141.586 Y123.708 E.02031
G1 X141.184 Y123.933 F30000
; FEATURE: Outer wall
G1 F3000
G1 X141.37 Y124.493 E.02196
G3 X129.703 Y116.104 I-11.37 J3.505 E2.20985
G1 X130.297 Y116.104 E.0221
G3 X141.162 Y123.878 I-.297 J11.895 E.52835
; WIPE_START
G1 F24000
G1 X141.37 Y124.493 E-.24679
M73 P42 R7
G1 X141.532 Y125.064 E-.22545
G1 X141.664 Y125.642 E-.22548
G1 X141.693 Y125.803 E-.06228
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.436 J-1.136 P1  F30000
G1 X113.42 Y114.947 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X113.254 Y114.79 E.00851
G3 X114.702 Y110.51 I1.752 J-1.792 E.20968
M73 P43 R7
G1 X114.938 Y110.493 E.00879
G3 X113.47 Y114.979 I.068 J2.506 E.3574
G1 X113.711 Y114.593 F30000
; FEATURE: Outer wall
G1 F3000
G1 X113.433 Y114.315 E.01464
G3 X114.753 Y110.965 I1.57 J-1.316 E.1638
G1 X114.949 Y110.95 E.00731
G3 X113.76 Y114.627 I.054 J2.048 E.29156
; WIPE_START
G1 F24000
G1 X113.433 Y114.315 E-.17177
G1 X113.199 Y113.981 E-.15499
G1 X113.041 Y113.604 E-.15516
G1 X112.96 Y113.204 E-.15518
G1 X112.96 Y112.881 E-.12289
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.07 J1.215 P1  F30000
G1 X143.091 Y114.626 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X143.081 Y114.611 E.00069
G3 X144.688 Y110.511 I1.919 J-1.612 E.20024
M73 P44 R7
G1 X144.937 Y110.493 E.00931
G3 X143.251 Y114.794 I.062 J2.506 E.36775
G1 X143.133 Y114.669 E.00638
G1 X143.44 Y114.329 F30000
; FEATURE: Outer wall
G1 F3000
G1 X143.431 Y114.317 E.00057
G3 X144.745 Y110.965 I1.569 J-1.318 E.1637
G1 X144.949 Y110.95 E.00761
G3 X143.723 Y114.601 I.051 J2.049 E.29304
G1 X143.483 Y114.37 E.01239
; WIPE_START
G1 F24000
G1 X143.431 Y114.317 E-.02855
G1 X143.199 Y113.981 E-.15509
G1 X143.041 Y113.604 E-.15516
G1 X142.96 Y113.204 E-.15516
G1 X142.96 Y112.796 E-.15517
G1 X143.018 Y112.51 E-.11086
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.217 J-.017 P1  F30000
G1 X142.599 Y142.279 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X142.604 Y142.261 E.00069
G3 X144.688 Y140.511 I2.396 J.737 E.10713
G1 X144.937 Y140.493 E.00931
G3 X142.543 Y142.503 I.062 J2.506 E.46084
G1 X142.584 Y142.337 E.00639
G1 X143.048 Y142.377 F30000
; FEATURE: Outer wall
G1 F3000
G1 X143.2 Y142.02 E.01446
G3 X144.745 Y140.965 I1.8 J.979 E.07236
G1 X144.949 Y140.95 E.00761
G3 X143.03 Y142.434 I.051 J2.049 E.38289
; WIPE_START
G1 F24000
G1 X143.2 Y142.02 E-.17017
M73 P45 R7
G1 X143.429 Y141.682 E-.15515
G1 X143.722 Y141.397 E-.15517
G1 X144.065 Y141.175 E-.15516
G1 X144.369 Y141.056 E-.12436
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.014 J-1.217 P1  F30000
G1 X116.909 Y141.374 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X116.921 Y141.388 E.00069
G3 X114.688 Y140.511 I-1.921 J1.61 E.49344
G1 X114.937 Y140.493 E.00931
G3 X116.751 Y141.205 I.062 J2.506 E.07453
G1 X116.868 Y141.33 E.00639
G1 X116.682 Y141.845 F30000
; FEATURE: Outer wall
G1 F3000
G1 X116.8 Y142.02 E.00786
G3 X114.745 Y140.965 I-1.8 J.979 E.38818
G1 X114.949 Y140.95 E.00761
G3 X116.57 Y141.682 I.051 J2.049 E.06855
G1 X116.648 Y141.796 E.00511
; WIPE_START
G1 F24000
G1 X116.8 Y142.02 E-.10295
G1 X116.959 Y142.396 E-.15513
G1 X117.04 Y142.796 E-.15518
G1 X117.04 Y143.204 E-.15516
G1 X116.961 Y143.6 E-.1534
G1 X116.924 Y143.693 E-.03818
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.206 J1.199 P1  F30000
G1 X151.643 Y149.643 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X108.357 Y149.643 E1.61223
G1 X108.357 Y106.357 E1.61223
G1 X151.643 Y106.357 E1.61223
G1 X151.643 Y149.583 E1.61
G1 X152.1 Y150.1 F30000
; FEATURE: Outer wall
G1 F3000
G1 X107.9 Y150.1 E1.64628
G1 X107.9 Y105.9 E1.64628
G1 X152.1 Y105.9 E1.64628
G1 X152.1 Y150.04 E1.64405
; WIPE_START
G1 F24000
G1 X150.1 Y150.043 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.216 J.039 P1  F30000
G1 X151.46 Y107.471 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.503245
G1 F6300
G1 X150.735 Y106.746 E.03847
G1 X150.084 Y106.746 E.02442
G1 X151.254 Y107.916 E.06209
G1 X151.254 Y108.567 E.02442
G1 X149.433 Y106.746 E.09663
G1 X148.782 Y106.746 E.02442
G1 X151.254 Y109.218 E.13116
G1 X151.254 Y109.869 E.02442
G1 X148.131 Y106.746 E.16569
G1 X147.48 Y106.746 E.02442
G1 X151.254 Y110.52 E.20023
G1 X151.254 Y111.171 E.02442
G1 X146.829 Y106.746 E.23476
G1 X146.178 Y106.746 E.02442
G1 X151.254 Y111.822 E.2693
G1 X151.254 Y112.473 E.02442
G1 X145.527 Y106.746 E.30383
G1 X144.876 Y106.746 E.02442
G1 X151.254 Y113.124 E.33837
G1 X151.254 Y113.775 E.02442
G1 X144.225 Y106.746 E.3729
G1 X143.574 Y106.746 E.02442
G1 X151.254 Y114.426 E.40743
G1 X151.254 Y115.077 E.02442
G1 X142.923 Y106.746 E.44197
G1 X142.272 Y106.746 E.02442
G1 X145.724 Y110.197 E.1831
G3 X147.801 Y112.275 I-.709 J2.787 E.11568
G1 X151.254 Y115.728 E.18319
G1 X151.254 Y116.379 E.02442
G1 X147.896 Y113.021 E.17815
G3 X147.831 Y113.607 I-3.523 J-.093 E.02215
G1 X151.254 Y117.03 E.18159
G1 X151.254 Y117.681 E.02442
G1 X147.677 Y114.104 E.18975
G3 X147.455 Y114.532 I-3.267 J-1.427 E.01812
M73 P46 R7
G1 X151.254 Y118.332 E.20157
G1 X151.254 Y118.983 E.02442
G1 X147.178 Y114.907 E.21624
G3 X146.848 Y115.228 I-1.77 J-1.487 E.0173
G1 X151.254 Y119.634 E.23373
G1 X151.254 Y120.285 E.02442
M73 P46 R6
G1 X146.465 Y115.495 E.25408
G3 X146.026 Y115.708 I-1.686 J-2.924 E.0183
G1 X151.254 Y120.936 E.27735
G1 X151.254 Y121.587 E.02442
G1 X145.511 Y115.844 E.30466
G3 X144.909 Y115.892 I-.505 J-2.519 E.02273
G1 X151.46 Y122.444 E.34755
; WIPE_START
G1 F24000
G1 X150.046 Y121.029 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.046 J-.623 P1  F30000
G1 X141.415 Y106.54 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
M73 P47 R6
G1 X144.98 Y110.105 E.18913
G2 X144.399 Y110.174 I.035 J2.777 E.02202
G1 X140.97 Y106.746 E.18188
G1 X140.319 Y106.746 E.02442
G1 X143.897 Y110.323 E.18979
G2 X143.467 Y110.544 I.888 J2.26 E.01817
G1 X139.668 Y106.746 E.20151
G1 X139.017 Y106.746 E.02442
G1 X143.094 Y110.823 E.21629
G2 X142.771 Y111.151 I2.487 J2.775 E.01728
G1 X138.366 Y106.746 E.23368
G1 X137.715 Y106.746 E.02442
G1 X142.504 Y111.535 E.25406
G2 X142.294 Y111.975 I2.588 J1.508 E.01833
G1 X137.064 Y106.746 E.27743
G1 X136.413 Y106.746 E.02442
G1 X142.152 Y112.484 E.30442
G2 X142.107 Y113.091 I3.007 J.524 E.02286
G1 X135.762 Y106.746 E.33661
G1 X135.111 Y106.746 E.02442
G1 X142.239 Y113.873 E.37811
G2 X144.123 Y115.758 I2.748 J-.863 E.10395
G1 X151.254 Y122.889 E.37829
G1 X151.254 Y123.54 E.02442
G1 X134.46 Y106.746 E.89091
G1 X133.809 Y106.746 E.02442
G1 X151.254 Y124.191 E.92545
G1 X151.254 Y124.842 E.02442
G1 X133.158 Y106.746 E.95998
G1 X132.507 Y106.746 E.02442
G1 X151.254 Y125.493 E.99451
G1 X151.254 Y126.144 E.02442
G1 X131.856 Y106.746 E1.02905
G1 X131.205 Y106.746 E.02442
G1 X151.254 Y126.795 E1.06358
G1 X151.254 Y127.446 E.02442
G1 X130.554 Y106.746 E1.09812
G1 X129.903 Y106.746 E.02442
G1 X151.254 Y128.097 E1.13265
G1 X151.254 Y128.748 E.02442
G1 X129.252 Y106.746 E1.16719
G1 X128.601 Y106.746 E.02442
G1 X151.254 Y129.399 E1.20172
G1 X151.254 Y130.05 E.02442
G1 X127.95 Y106.746 E1.23625
G1 X127.299 Y106.746 E.02442
G1 X151.254 Y130.701 E1.27079
G1 X151.254 Y131.352 E.02442
G1 X126.648 Y106.746 E1.30532
G1 X125.997 Y106.746 E.02442
G1 X136.022 Y116.77 E.5318
G2 X134.793 Y116.193 I-6.228 J11.649 E.05096
G1 X125.346 Y106.746 E.50115
G1 X124.695 Y106.746 E.02442
G1 X133.781 Y115.832 E.48202
G2 X132.884 Y115.586 I-2.915 J8.866 E.03491
G1 X124.044 Y106.746 E.46896
G1 X123.393 Y106.746 E.02442
G1 X132.074 Y115.427 E.46052
G2 X131.323 Y115.327 I-1.377 J7.473 E.02843
G1 X122.742 Y106.746 E.45521
G1 X122.091 Y106.746 E.02442
G1 X130.618 Y115.273 E.45236
G2 X129.952 Y115.258 I-.483 J6.665 E.025
G1 X121.44 Y106.746 E.45157
G1 X120.789 Y106.746 E.02442
G1 X129.32 Y115.276 E.45253
G2 X128.715 Y115.323 I.167 J6.077 E.02274
G1 X120.138 Y106.746 E.45501
M73 P48 R6
G1 X119.487 Y106.746 E.02442
G1 X128.136 Y115.395 E.45883
G2 X127.58 Y115.489 I.669 J5.623 E.02118
G1 X118.836 Y106.746 E.46385
G1 X118.185 Y106.746 E.02442
G1 X127.044 Y115.604 E.46993
G2 X126.526 Y115.737 I1.075 J5.259 E.02007
G1 X117.534 Y106.746 E.47699
G1 X116.883 Y106.746 E.02442
G1 X126.028 Y115.891 E.48513
G2 X125.547 Y116.061 I1.465 J4.903 E.01914
G1 X116.232 Y106.746 E.49416
G1 X115.581 Y106.746 E.02442
G1 X125.081 Y116.246 E.50396
G2 X124.629 Y116.444 I1.763 J4.634 E.01854
G1 X114.93 Y106.746 E.51449
G1 X114.279 Y106.746 E.02442
G1 X124.189 Y116.656 E.52572
G2 X123.768 Y116.885 I2.091 J4.346 E.01801
G1 X113.628 Y106.746 E.53788
G1 X112.977 Y106.746 E.02442
G1 X123.358 Y117.126 E.55067
G2 X122.959 Y117.379 I2.329 J4.119 E.0177
G1 X117.783 Y112.202 E.2746
G2 X115.795 Y110.215 I-2.796 J.808 E.11004
G1 X112.326 Y106.746 E.18403
G1 X111.675 Y106.746 E.02442
G1 X115.036 Y110.106 E.17829
G2 X114.444 Y110.165 I-.044 J2.571 E.02237
G1 X111.024 Y106.746 E.18141
G1 X110.373 Y106.746 E.02442
G1 X113.934 Y110.307 E.1889
G2 X113.501 Y110.524 I.872 J2.274 E.01822
G1 X109.722 Y106.746 E.20046
G1 X109.071 Y106.746 E.02442
G1 X113.123 Y110.797 E.21494
M73 P49 R6
G2 X112.796 Y111.121 I1.455 J1.796 E.0173
G1 X108.746 Y107.071 E.21486
G1 X108.746 Y107.722 E.02442
G1 X112.525 Y111.501 E.20048
G2 X112.308 Y111.936 I2.647 J1.592 E.01823
G1 X108.746 Y108.373 E.18899
G1 X108.746 Y109.024 E.02442
G1 X112.159 Y112.437 E.18105
G2 X112.105 Y113.034 I3.491 J.617 E.02251
G1 X108.54 Y109.469 E.1891
; WIPE_START
G1 F24000
G1 X109.954 Y110.884 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.286 J1.183 P1  F30000
G1 X117.679 Y112.749 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X122.572 Y117.643 E.25958
G2 X122.201 Y117.923 I2.618 J3.853 E.01744
G1 X117.841 Y113.563 E.23128
G3 X117.692 Y114.064 I-3.763 J-.849 E.01964
G1 X121.841 Y118.213 E.22008
G2 X121.49 Y118.514 I2.837 J3.659 E.01732
G1 X117.475 Y114.499 E.21299
G3 X117.204 Y114.879 I-3.045 J-1.886 E.01752
G1 X121.153 Y118.827 E.20946
G2 X120.829 Y119.154 I3.115 J3.409 E.01727
G1 X116.877 Y115.203 E.20962
G3 X116.499 Y115.476 I-1.98 J-2.343 E.01751
G1 X120.515 Y119.491 E.21302
G2 X120.211 Y119.838 I3.327 J3.217 E.01731
G1 X116.066 Y115.693 E.21988
G3 X115.556 Y115.835 I-1.105 J-2.993 E.01986
G1 X119.922 Y120.201 E.23159
G2 X119.645 Y120.575 I3.609 J2.962 E.01746
G1 X114.748 Y115.677 E.2598
; WIPE_START
G1 F24000
G1 X116.162 Y117.091 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.933 J.782 P1  F30000
G1 X119.528 Y121.108 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X114.205 Y115.785 E.28236
G3 X112.217 Y113.798 I.809 J-2.796 E.11003
G1 X108.746 Y110.326 E.18417
G1 X108.746 Y110.977 E.02442
G1 X119.123 Y121.355 E.55052
G1 X118.885 Y121.768 E.01788
G1 X108.746 Y111.628 E.53788
M73 P50 R6
G1 X108.746 Y112.279 E.02442
G1 X118.659 Y122.192 E.52587
G2 X118.444 Y122.629 I4.27 J2.364 E.01826
G1 X108.746 Y112.93 E.51451
G1 X108.746 Y113.581 E.02442
G1 X118.243 Y123.079 E.50383
G1 X118.06 Y123.546 E.01884
G1 X108.746 Y114.232 E.4941
G1 X108.746 Y114.883 E.02442
G1 X117.892 Y124.03 E.4852
G2 X117.74 Y124.528 I4.924 J1.773 E.01957
G1 X108.746 Y115.534 E.47714
G1 X108.746 Y116.185 E.02442
G1 X117.605 Y125.044 E.46997
G2 X117.488 Y125.579 I5.296 J1.435 E.02053
G1 X108.746 Y116.836 E.46379
G1 X108.746 Y117.487 E.02442
G1 X117.392 Y126.134 E.45869
G1 X117.32 Y126.712 E.02187
G1 X108.746 Y118.138 E.45484
G1 X108.746 Y118.789 E.02442
G1 X117.273 Y127.317 E.45239
G2 X117.255 Y127.95 I6.336 J.499 E.02376
G1 X108.746 Y119.44 E.45142
G1 X108.746 Y120.091 E.02442
G1 X117.269 Y128.615 E.45218
G2 X117.324 Y129.32 I6.869 J-.175 E.02654
G1 X108.746 Y120.742 E.45506
G1 X108.746 Y121.393 E.02442
G1 X117.427 Y130.075 E.46055
G2 X117.589 Y130.888 I8.229 J-1.219 E.03112
G1 X108.746 Y122.044 E.46915
G1 X108.746 Y122.695 E.02442
G1 X117.827 Y131.776 E.48174
G2 X118.193 Y132.794 I10.375 J-3.161 E.04058
G1 X108.746 Y123.346 E.50117
G1 X108.746 Y123.997 E.02442
G1 X119.322 Y134.573 E.56104
; WIPE_START
G1 F24000
G1 X117.907 Y133.159 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.557 J1.082 P1  F30000
G1 X140.678 Y121.427 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X151.254 Y132.003 E.56103
G1 X151.254 Y132.654 E.02442
G1 X141.807 Y123.206 E.50117
G3 X142.173 Y124.224 I-10.009 J4.179 E.04058
G1 X151.254 Y133.305 E.48174
G1 X151.254 Y133.956 E.02442
G1 X142.411 Y125.112 E.46915
G3 X142.573 Y125.925 I-8.068 J2.032 E.03112
G1 X151.254 Y134.607 E.46055
G1 X151.254 Y135.258 E.02442
G1 X142.676 Y126.68 E.45506
G3 X142.731 Y127.385 I-49.119 J4.144 E.02654
G1 X151.254 Y135.909 E.45217
G1 X151.254 Y136.56 E.02442
G1 X142.745 Y128.05 E.45142
G3 X142.727 Y128.683 I-6.35 J.134 E.02376
G1 X151.254 Y137.211 E.45239
G1 X151.254 Y137.862 E.02442
G1 X142.68 Y129.288 E.45484
M73 P51 R6
G1 X142.608 Y129.866 E.02187
G1 X151.254 Y138.513 E.45869
G1 X151.254 Y139.164 E.02442
G1 X142.512 Y130.421 E.46379
G3 X142.395 Y130.956 I-5.414 J-.901 E.02053
G1 X151.254 Y139.815 E.46997
G1 X151.254 Y140.466 E.02442
G1 X142.26 Y131.472 E.47714
G3 X142.108 Y131.97 I-5.075 J-1.274 E.01957
G1 X151.254 Y141.117 E.4852
G1 X151.254 Y141.768 E.02442
G1 X141.94 Y132.454 E.4941
G1 X141.757 Y132.921 E.01884
G1 X151.254 Y142.419 E.50383
G1 X151.254 Y143.07 E.02442
G1 X141.556 Y133.371 E.51451
G3 X141.341 Y133.808 I-4.485 J-1.928 E.01826
G1 X151.254 Y143.721 E.52587
G1 X151.254 Y144.372 E.02442
G1 X141.115 Y134.232 E.53788
G1 X140.877 Y134.645 E.01788
G1 X151.254 Y145.023 E.55052
G1 X151.254 Y145.674 E.02442
G1 X147.783 Y142.202 E.18417
G2 X145.795 Y140.215 I-2.796 J.808 E.11004
G1 X140.621 Y135.041 E.27447
G3 X140.355 Y135.425 I-3.986 J-2.476 E.01756
G1 X145.036 Y140.106 E.24832
G2 X144.443 Y140.165 I-.043 J2.59 E.02238
G1 X140.078 Y135.799 E.23159
G1 X139.789 Y136.162 E.01738
G1 X143.934 Y140.307 E.21988
G2 X143.501 Y140.524 I.872 J2.274 E.01822
G1 X139.485 Y136.509 E.21302
G3 X139.171 Y136.846 I-3.534 J-2.976 E.01729
G1 X143.123 Y140.797 E.20962
G2 X142.796 Y141.121 I1.456 J1.796 E.0173
G1 X138.847 Y137.173 E.20946
G1 X138.51 Y137.486 E.01728
G1 X142.525 Y141.501 E.21299
G2 X142.308 Y141.936 I2.647 J1.591 E.01823
G1 X138.159 Y137.787 E.22008
G3 X137.799 Y138.077 I-3.091 J-3.468 E.01737
G1 X142.159 Y142.437 E.23128
G2 X142.105 Y143.034 I3.49 J.617 E.02251
G1 X137.28 Y138.209 E.25594
; WIPE_START
G1 F24000
G1 X138.694 Y139.624 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.4 J1.149 P1  F30000
M73 P52 R6
G1 X147.679 Y142.749 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X151.254 Y146.325 E.18969
G1 X151.254 Y146.976 E.02442
G1 X147.841 Y143.563 E.18106
G3 X147.692 Y144.064 I-3.763 J-.849 E.01964
G1 X151.254 Y147.627 E.18899
G1 X151.254 Y148.278 E.02442
G1 X147.475 Y144.499 E.20048
G3 X147.204 Y144.879 I-3.045 J-1.886 E.01752
G1 X151.254 Y148.929 E.21486
G1 X151.254 Y149.254 E.01221
G1 X150.929 Y149.254 E.01221
G1 X146.877 Y145.203 E.21494
G3 X146.499 Y145.476 I-1.98 J-2.343 E.01751
G1 X150.278 Y149.254 E.20046
G1 X149.627 Y149.254 E.02442
G1 X146.066 Y145.693 E.1889
G3 X145.556 Y145.835 I-1.119 J-3.039 E.01986
G1 X148.976 Y149.254 E.18139
G1 X148.325 Y149.254 E.02442
G1 X144.748 Y145.677 E.18976
; WIPE_START
G1 F24000
G1 X146.162 Y147.091 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.985 J.714 P1  F30000
G1 X147.88 Y149.46 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X144.205 Y145.785 E.19494
G3 X142.217 Y143.798 I.808 J-2.796 E.11003
G1 X137.041 Y138.621 E.2746
G3 X136.642 Y138.874 I-2.729 J-3.867 E.0177
G1 X147.023 Y149.254 E.55067
G1 X146.372 Y149.254 E.02442
G1 X136.232 Y139.115 E.53788
G3 X135.811 Y139.344 I-2.503 J-4.1 E.01801
G1 X145.721 Y149.254 E.52572
G1 X145.07 Y149.254 E.02442
G1 X135.371 Y139.556 E.51449
G3 X134.919 Y139.754 I-2.215 J-4.434 E.01854
G1 X144.419 Y149.254 E.50396
G1 X143.768 Y149.254 E.02442
G1 X134.453 Y139.939 E.49416
G3 X133.972 Y140.109 I-1.945 J-4.733 E.01914
G1 X143.117 Y149.254 E.48513
G1 X142.466 Y149.254 E.02442
G1 X133.474 Y140.263 E.47699
G3 X132.956 Y140.396 I-1.592 J-5.121 E.02007
G1 X141.815 Y149.254 E.46993
G1 X141.164 Y149.254 E.02442
G1 X132.42 Y140.511 E.46385
G3 X131.864 Y140.605 I-1.225 J-5.529 E.02118
G1 X140.513 Y149.254 E.45883
G1 X139.862 Y149.254 E.02442
G1 X131.285 Y140.677 E.45501
G3 X130.68 Y140.724 I-.771 J-6.032 E.02274
M73 P53 R6
G1 X139.211 Y149.254 E.45253
G1 X138.56 Y149.254 E.02442
G1 X130.048 Y140.742 E.45157
G3 X129.382 Y140.727 I-.183 J-6.679 E.025
G1 X137.909 Y149.254 E.45236
G1 X137.258 Y149.254 E.02442
G1 X128.677 Y140.673 E.45522
G3 X127.926 Y140.573 I.626 J-7.573 E.02843
G1 X136.607 Y149.254 E.46052
G1 X135.956 Y149.254 E.02442
G1 X127.116 Y140.414 E.46896
G3 X126.219 Y140.168 I2.018 J-9.112 E.03491
G1 X135.305 Y149.254 E.48202
G1 X134.654 Y149.254 E.02442
G1 X125.207 Y139.807 E.50115
G3 X123.978 Y139.229 I4.999 J-12.226 E.05096
G1 X134.003 Y149.254 E.5318
G1 X133.352 Y149.254 E.02442
G1 X108.746 Y124.648 E1.30532
G1 X108.746 Y125.299 E.02442
G1 X132.701 Y149.254 E1.27079
G1 X132.05 Y149.254 E.02442
G1 X108.746 Y125.95 E1.23625
G1 X108.746 Y126.601 E.02442
G1 X131.399 Y149.254 E1.20172
G1 X130.748 Y149.254 E.02442
G1 X108.746 Y127.252 E1.16718
G1 X108.746 Y127.903 E.02442
G1 X130.097 Y149.254 E1.13265
G1 X129.446 Y149.254 E.02442
G1 X108.746 Y128.554 E1.09812
G1 X108.746 Y129.205 E.02442
G1 X128.795 Y149.254 E1.06358
G1 X128.144 Y149.254 E.02442
G1 X108.746 Y129.856 E1.02905
G1 X108.746 Y130.507 E.02442
G1 X127.493 Y149.254 E.99451
G1 X126.842 Y149.254 E.02442
G1 X108.746 Y131.158 E.95998
G1 X108.746 Y131.809 E.02442
G1 X126.191 Y149.254 E.92544
G1 X125.54 Y149.254 E.02442
G1 X108.746 Y132.46 E.89091
G1 X108.746 Y133.111 E.02442
G1 X115.877 Y140.242 E.37829
G3 X117.761 Y142.127 I-.863 J2.748 E.10395
G1 X124.889 Y149.254 E.3781
G1 X124.238 Y149.254 E.02442
G1 X117.893 Y142.909 E.33661
G3 X117.848 Y143.516 I-3.051 J.083 E.02286
G1 X123.587 Y149.254 E.30442
G1 X122.936 Y149.254 E.02442
G1 X117.703 Y144.021 E.27762
G3 X117.496 Y144.466 I-1.833 J-.58 E.01844
G1 X122.285 Y149.254 E.25402
G1 X121.634 Y149.254 E.02442
G1 X117.227 Y144.847 E.23378
G3 X116.908 Y145.179 I-2.928 J-2.495 E.01728
G1 X120.983 Y149.254 E.21617
M73 P54 R6
G1 X120.332 Y149.254 E.02442
G1 X116.532 Y145.455 E.20156
G3 X116.102 Y145.676 I-1.584 J-2.554 E.01816
G1 X119.681 Y149.254 E.18984
G1 X119.03 Y149.254 E.02442
G1 X115.607 Y145.831 E.1816
G3 X115.02 Y145.895 I-.647 J-3.224 E.02219
G1 X118.585 Y149.46 E.18913
; WIPE_START
G1 F24000
G1 X117.17 Y148.046 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.183 J-.285 P1  F30000
M73 P54 R5
G1 X115.314 Y140.33 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X108.746 Y133.762 E.34844
G1 X108.746 Y134.413 E.02442
G1 X114.485 Y140.153 E.30447
G2 X113.975 Y140.294 I.522 J2.876 E.01987
G1 X108.746 Y135.064 E.27743
G1 X108.746 Y135.715 E.02442
G1 X113.533 Y140.503 E.25398
G2 X113.152 Y140.773 I1.158 J2.039 E.01755
G1 X108.746 Y136.366 E.23376
G1 X108.746 Y137.017 E.02442
G1 X112.823 Y141.095 E.21632
G2 X112.545 Y141.468 I2.071 J1.834 E.01747
G1 X108.746 Y137.668 E.20157
G1 X108.746 Y138.319 E.02442
G1 X112.323 Y141.896 E.18975
G2 X112.169 Y142.393 I2.407 J1.018 E.01955
G1 X108.746 Y138.97 E.18159
G1 X108.746 Y139.621 E.02442
G1 X112.318 Y143.194 E.18954
; WIPE_START
G1 F24000
M73 P55 R5
G1 X110.904 Y141.78 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.714 J-.985 P1  F30000
G1 X108.54 Y140.066 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X112.199 Y143.725 E.1941
G2 X114.276 Y145.803 I2.787 J-.709 E.11568
G1 X117.728 Y149.254 E.1831
G1 X117.077 Y149.254 E.02442
G1 X108.746 Y140.923 E.44197
G1 X108.746 Y141.574 E.02442
G1 X116.426 Y149.254 E.40743
G1 X115.775 Y149.254 E.02442
G1 X108.746 Y142.225 E.3729
G1 X108.746 Y142.876 E.02442
G1 X115.124 Y149.254 E.33836
G1 X114.473 Y149.254 E.02442
G1 X108.746 Y143.527 E.30383
G1 X108.746 Y144.178 E.02442
G1 X113.822 Y149.254 E.2693
G1 X113.171 Y149.254 E.02442
G1 X108.746 Y144.829 E.23476
G1 X108.746 Y145.48 E.02442
G1 X112.52 Y149.254 E.20023
G1 X111.869 Y149.254 E.02442
G1 X108.746 Y146.131 E.16569
G1 X108.746 Y146.782 E.02442
G1 X111.218 Y149.254 E.13116
G1 X110.567 Y149.254 E.02442
G1 X108.746 Y147.433 E.09662
G1 X108.746 Y148.084 E.02442
G1 X109.916 Y149.254 E.06209
G1 X109.265 Y149.254 E.02442
G1 X108.54 Y148.529 E.03847
M106 S237.15
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X109.265 Y149.254 E-.38969
G1 X109.916 Y149.254 E-.24738
G1 X109.687 Y149.026 E-.12293
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
G3 Z.6 I.757 J.953 P1  F30000
G1 X141.369 Y123.852 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X141.371 Y123.861 E.00032
G3 X129.698 Y115.901 I-11.371 J4.137 E2.02156
G1 X130.302 Y115.901 E.02002
G3 X141.151 Y123.3 I-.302 J12.097 E.46043
G1 X141.347 Y123.796 E.01771
G1 X141.003 Y123.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X129.708 Y116.294 I-11.003 J4.003 E1.81189
G1 X130.292 Y116.294 E.01794
G3 X140.982 Y123.939 I-.292 J11.705 E.42877
M204 S10000
; WIPE_START
G1 F24000
G1 X141.19 Y124.548 E-.24464
G1 X141.348 Y125.11 E-.22188
G1 X141.478 Y125.68 E-.22187
G1 X141.511 Y125.865 E-.0716
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.45 J-1.131 P1  F30000
G1 X113.571 Y114.738 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X113.276 Y114.447 E.01375
M73 P56 R5
G3 X114.72 Y110.765 I1.724 J-1.448 E.16018
G1 X114.944 Y110.748 E.00745
G3 X113.617 Y114.776 I.056 J2.251 E.28587
G1 X113.841 Y114.453 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X114.769 Y111.154 I1.159 J-1.454 E.13391
G1 X114.954 Y111.14 E.0057
G3 X113.889 Y114.489 I.046 J1.859 E.21748
M204 S10000
; WIPE_START
G1 F24000
G1 X113.575 Y114.196 E-.16334
G1 X113.366 Y113.89 E-.14077
G1 X113.222 Y113.548 E-.14077
G1 X113.149 Y113.187 E-.13995
G1 X113.142 Y112.907 E-.10651
G1 X113.169 Y112.728 E-.06866
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.208 J.15 P1  F30000
G1 X116.745 Y141.58 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.978 Y141.923 E.01375
G3 X114.72 Y140.765 I-1.978 J1.076 E.37983
G1 X114.944 Y140.748 E.00745
G3 X116.708 Y141.532 I.056 J2.251 E.06621
G1 X116.526 Y141.953 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.633 Y142.111 E.00586
G3 X114.769 Y141.154 I-1.633 J.888 E.29053
G1 X114.954 Y141.14 E.0057
G3 X116.425 Y141.805 I.046 J1.859 E.0513
G1 X116.492 Y141.903 E.00368
M204 S10000
; WIPE_START
G1 F24000
G1 X116.633 Y142.111 E-.09524
G1 X116.778 Y142.452 E-.14074
G1 X116.851 Y142.813 E-.13996
G1 X116.858 Y143.093 E-.10651
G1 X116.803 Y143.459 E-.14071
G1 X116.68 Y143.797 E-.13684
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.069 J1.215 P1  F30000
G1 X142.86 Y142.305 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.022 Y141.923 E.01375
G3 X144.72 Y140.765 I1.978 J1.076 E.0708
G1 X144.944 Y140.748 E.00745
G3 X142.841 Y142.361 I.056 J2.251 E.37524
G1 X143.223 Y142.452 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X144.769 Y141.154 I1.777 J.547 E.06555
G1 X144.954 Y141.14 E.0057
G3 X143.206 Y142.509 I.046 J1.859 E.28584
M204 S10000
; WIPE_START
G1 F24000
G1 X143.366 Y142.11 E-.16337
G1 X143.575 Y141.804 E-.14077
G1 X143.84 Y141.546 E-.14077
G1 X144.149 Y141.346 E-.13995
G1 X144.408 Y141.237 E-.10651
G1 X144.584 Y141.196 E-.06863
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.215 J-.06 P1  F30000
G1 X143.255 Y114.42 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.022 Y114.077 E.01375
G3 X144.72 Y110.765 I1.978 J-1.078 E.14531
G1 X144.944 Y110.748 E.00745
G3 X143.292 Y114.467 I.056 J2.251 E.30088
G1 X143.575 Y114.195 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X144.769 Y111.154 I1.425 J-1.196 E.12255
G1 X144.954 Y111.14 E.0057
G3 X143.615 Y114.241 I.046 J1.859 E.22898
M204 S10000
; WIPE_START
G1 F24000
G1 X143.366 Y113.89 E-.16337
G1 X143.222 Y113.548 E-.14077
G1 X143.149 Y113.185 E-.14077
G1 X143.149 Y112.815 E-.14077
G1 X143.222 Y112.452 E-.14077
G1 X143.257 Y112.37 E-.03355
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.186 J.273 P1  F30000
G1 X151.898 Y149.898 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.719 J.982 P1  F30000
G1 X150.971 Y149.734 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420388
G1 F15000
G1 X151.565 Y149.141 E.02581
G1 X151.565 Y148.607 E.01642
G1 X150.607 Y149.565 E.04165
G1 X150.073 Y149.565 E.01642
G1 X151.565 Y148.073 E.06487
G1 X151.565 Y147.539 E.01642
G1 X149.539 Y149.565 E.08809
G1 X149.006 Y149.565 E.01642
G1 X151.565 Y147.006 E.11132
G1 X151.565 Y146.472 E.01642
G1 X148.472 Y149.565 E.13454
G1 X147.938 Y149.565 E.01642
G1 X151.565 Y145.938 E.15776
G1 X151.565 Y145.404 E.01642
G1 X147.404 Y149.565 E.18098
G1 X146.87 Y149.565 E.01642
G1 X151.565 Y144.87 E.2042
G1 X151.565 Y144.337 E.01642
G1 X146.337 Y149.565 E.22742
G1 X145.803 Y149.565 E.01642
G1 X151.565 Y143.803 E.25064
G1 X151.565 Y143.269 E.01642
G1 X145.269 Y149.565 E.27386
G1 X144.735 Y149.565 E.01642
G1 X151.565 Y142.735 E.29708
G1 X151.565 Y142.201 E.01642
G1 X144.201 Y149.565 E.3203
G1 X143.667 Y149.565 E.01642
G1 X151.565 Y141.667 E.34353
G1 X151.565 Y141.134 E.01642
G1 X143.134 Y149.565 E.36675
G1 X142.6 Y149.565 E.01642
G1 X151.565 Y140.6 E.38997
G1 X151.565 Y140.066 E.01642
G1 X142.066 Y149.565 E.41319
G1 X141.532 Y149.565 E.01642
G1 X145.59 Y145.506 E.17653
G3 X144.987 Y145.576 I-.474 J-1.458 E.01881
G1 X140.998 Y149.565 E.1735
G1 X140.465 Y149.565 E.01642
G1 X144.502 Y145.527 E.17564
G3 X144.087 Y145.408 I.087 J-1.086 E.01336
G1 X139.931 Y149.565 E.18082
G1 X139.397 Y149.565 E.01642
G1 X143.722 Y145.24 E.18813
G1 X143.397 Y145.03 E.01188
G1 X138.863 Y149.565 E.19725
G1 X138.329 Y149.565 E.01642
G1 X143.125 Y144.768 E.20863
G3 X142.888 Y144.473 I.613 J-.736 E.01176
G1 X137.795 Y149.565 E.22151
G1 X137.262 Y149.565 E.01642
G1 X142.686 Y144.14 E.23597
G1 X142.528 Y143.764 E.01254
G1 X136.728 Y149.565 E.2523
G1 X136.194 Y149.565 E.01642
G1 X142.438 Y143.321 E.27161
G1 X142.425 Y142.8 E.01603
G1 X135.66 Y149.565 E.29427
G1 X135.126 Y149.565 E.01642
G1 X142.581 Y142.11 E.32426
G1 X142.727 Y141.762 E.01161
G1 X143.018 Y141.337 E.01585
M73 P57 R5
G1 X143.386 Y140.977 E.01585
G1 X143.81 Y140.703 E.01552
G1 X144.119 Y140.572 E.01032
G1 X151.565 Y133.126 E.32388
G1 X151.565 Y133.66 E.01642
G1 X144.795 Y140.429 E.29446
G1 X145.193 Y140.419 E.01225
G1 X145.317 Y140.441 E.00387
G1 X151.565 Y134.194 E.27176
G1 X151.565 Y134.728 E.01642
G1 X145.76 Y140.532 E.25249
G1 X146.144 Y140.683 E.01267
G1 X151.565 Y135.262 E.23582
G1 X151.565 Y135.795 E.01642
G1 X146.474 Y140.886 E.22146
G3 X146.767 Y141.127 I-.447 J.846 E.01175
G1 X151.565 Y136.329 E.20869
G1 X151.565 Y136.863 E.01642
G1 X147.026 Y141.401 E.19741
G1 X147.243 Y141.719 E.01182
G1 X151.565 Y137.397 E.188
G1 X151.565 Y137.931 E.01642
G1 X147.409 Y142.086 E.18076
G3 X147.526 Y142.503 I-.972 J.498 E.0134
G1 X151.565 Y138.465 E.17566
G1 X151.565 Y138.998 E.01642
G1 X147.575 Y142.988 E.17355
G3 X147.508 Y143.589 I-1.519 J.135 E.01872
G1 X151.734 Y139.362 E.18385
; WIPE_START
G1 F24000
G1 X150.32 Y140.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.118 J-1.211 P1  F30000
G1 X123.08 Y138.123 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X117.475 Y143.728 E.2438
G1 X117.508 Y143.639 E.00291
G1 X117.583 Y143.086 E.01714
G1 X122.645 Y138.024 E.2202
G1 X122.341 Y137.794 E.01172
G1 X117.544 Y142.591 E.20865
G1 X117.473 Y142.237 E.0111
G1 X117.441 Y142.161 E.00255
G1 X122.047 Y137.555 E.20036
G3 X121.757 Y137.311 I2.302 J-3.023 E.01166
G1 X117.282 Y141.785 E.19465
G1 X117.069 Y141.464 E.01185
G1 X121.48 Y137.054 E.19186
G3 X121.209 Y136.791 I2.493 J-2.85 E.01162
G1 X116.821 Y141.179 E.19087
G2 X116.538 Y140.928 I-.762 J.574 E.01171
G1 X120.945 Y136.521 E.19171
G3 X120.692 Y136.241 I2.683 J-2.678 E.01163
G1 X116.214 Y140.719 E.1948
G1 X115.836 Y140.562 E.01256
G1 X120.443 Y135.955 E.2004
G1 X120.206 Y135.658 E.01168
G1 X115.407 Y140.457 E.20875
G2 X114.904 Y140.427 I-.327 J1.23 E.01561
G1 X119.976 Y135.355 E.22064
G1 X119.753 Y135.044 E.01176
G1 X114.272 Y140.525 E.23842
G1 X114.176 Y140.547 E.00303
G1 X113.706 Y140.759 E.01585
G1 X113.288 Y141.06 E.01585
G1 X112.937 Y141.437 E.01585
G1 X112.669 Y141.877 E.01585
G1 X112.525 Y142.272 E.01293
G1 X108.435 Y146.362 E.17789
G1 X108.435 Y146.896 E.01642
G1 X112.417 Y142.914 E.17321
G2 X112.455 Y143.409 I1.436 J.139 E.01537
G1 X108.435 Y147.429 E.17488
G1 X108.435 Y147.963 E.01642
G1 X112.559 Y143.839 E.17939
G1 X112.718 Y144.215 E.01254
G1 X108.435 Y148.497 E.18628
G1 X108.435 Y149.031 E.01642
G1 X112.931 Y144.536 E.19554
G2 X113.179 Y144.821 I.83 J-.472 E.01172
G1 X108.435 Y149.565 E.20635
G1 X108.969 Y149.565 E.01642
G1 X113.462 Y145.072 E.19543
G1 X113.786 Y145.281 E.01188
G1 X109.503 Y149.565 E.18632
G1 X110.037 Y149.565 E.01642
G1 X114.164 Y145.438 E.17951
G2 X114.592 Y145.543 I.474 J-1.008 E.01367
G1 X110.571 Y149.565 E.17495
G1 X111.104 Y149.565 E.01642
G1 X115.096 Y145.573 E.17362
G1 X115.322 Y145.568 E.00695
G1 X115.728 Y145.475 E.01281
G1 X111.638 Y149.565 E.1779
G1 X112.172 Y149.565 E.01642
G1 X123.276 Y138.46 E.48303
G1 X123.608 Y138.663 E.01194
G1 X112.706 Y149.565 E.47422
G1 X113.24 Y149.565 E.01642
G1 X123.946 Y138.859 E.46571
G1 X124.291 Y139.047 E.0121
G1 X113.774 Y149.565 E.45752
G1 X114.307 Y149.565 E.01642
G1 X124.65 Y139.222 E.44991
G2 X125.016 Y139.39 I1.868 J-3.578 E.01238
G1 X114.841 Y149.565 E.44259
G1 X115.375 Y149.565 E.01642
G1 X125.391 Y139.548 E.4357
G2 X125.78 Y139.694 I1.649 J-3.821 E.01277
G1 X115.909 Y149.565 E.42939
G1 X116.443 Y149.565 E.01642
G1 X126.177 Y139.83 E.42343
G1 X126.585 Y139.956 E.01313
G1 X116.976 Y149.565 E.41796
G1 X117.51 Y149.565 E.01642
G1 X127.008 Y140.067 E.41316
G2 X127.442 Y140.166 I1.215 J-4.302 E.01371
G1 X118.044 Y149.565 E.40883
G1 X118.578 Y149.565 E.01642
G1 X127.889 Y140.254 E.40501
G1 X128.352 Y140.324 E.01443
G1 X119.112 Y149.565 E.40197
G1 X119.646 Y149.565 E.01642
G1 X128.833 Y140.377 E.39966
G2 X129.33 Y140.414 I.617 J-4.964 E.01534
G1 X120.179 Y149.565 E.39806
G1 X120.713 Y149.565 E.01642
G1 X129.846 Y140.432 E.39728
G2 X130.384 Y140.428 I.232 J-5.386 E.01654
G1 X121.247 Y149.565 E.39744
G1 X121.781 Y149.565 E.01642
G1 X130.946 Y140.399 E.3987
G1 X131.539 Y140.34 E.01834
G1 X122.315 Y149.565 E.40128
G1 X122.848 Y149.565 E.01642
G1 X132.168 Y140.245 E.4054
G2 X132.842 Y140.105 I-1.068 J-6.824 E.02118
G1 X123.382 Y149.565 E.4115
G1 X123.916 Y149.565 E.01642
G1 X133.573 Y139.908 E.42008
G2 X134.379 Y139.636 I-2.319 J-8.206 E.02616
G1 X124.45 Y149.565 E.4319
G1 X124.984 Y149.565 E.01642
G1 X135.305 Y139.244 E.44896
G2 X136.462 Y138.621 I-5.375 J-11.366 E.04043
G1 X125.348 Y149.734 E.48344
G1 X134.423 Y149.734 F30000
G1 F15000
G1 X151.565 Y132.593 E.74566
G1 X151.565 Y132.059 E.01642
G1 X134.059 Y149.565 E.7615
G1 X133.525 Y149.565 E.01642
G1 X151.565 Y131.525 E.78472
G1 X151.565 Y130.991 E.01642
G1 X132.991 Y149.565 E.80794
G1 X132.457 Y149.565 E.01642
G1 X151.565 Y130.457 E.83117
G1 X151.565 Y129.923 E.01642
G1 X131.923 Y149.565 E.85439
G1 X131.39 Y149.565 E.01642
G1 X151.565 Y129.39 E.87761
G1 X151.565 Y128.856 E.01642
G1 X130.856 Y149.565 E.90083
G1 X130.322 Y149.565 E.01642
G1 X151.565 Y128.322 E.92405
G1 X151.565 Y127.788 E.01642
G1 X129.788 Y149.565 E.94727
G1 X129.254 Y149.565 E.01642
G1 X151.565 Y127.254 E.97049
G1 X151.565 Y126.72 E.01642
G1 X128.72 Y149.565 E.99371
G1 X128.187 Y149.565 E.01642
G1 X151.565 Y126.187 E1.01693
G1 X151.565 Y125.653 E.01642
G1 X127.653 Y149.565 E1.04015
G1 X127.119 Y149.565 E.01642
G1 X151.565 Y125.119 E1.06338
G1 X151.565 Y124.585 E.01642
G1 X126.585 Y149.565 E1.0866
G1 X126.051 Y149.565 E.01642
G1 X151.565 Y124.051 E1.10982
G1 X151.565 Y123.518 E.01642
G1 X140.629 Y134.453 E.47568
G2 X141.246 Y133.302 I-12.478 J-7.43 E.04017
G1 X151.565 Y122.984 E.44884
G1 X151.565 Y122.45 E.01642
G1 X141.637 Y132.378 E.43186
G2 X141.91 Y131.571 I-14.79 J-5.453 E.0262
G1 X151.565 Y121.916 E.41999
G1 X151.565 Y121.382 E.01642
G1 X142.102 Y130.845 E.41161
G2 X142.24 Y130.173 I-6.664 J-1.721 E.02111
G1 X151.565 Y120.848 E.4056
G1 X151.565 Y120.315 E.01642
G1 X142.336 Y129.544 E.40146
G2 X142.395 Y128.95 I-5.918 J-.897 E.01836
G1 X151.565 Y119.781 E.39886
G1 X151.565 Y119.247 E.01642
G1 X142.426 Y128.386 E.39753
G2 X142.432 Y127.846 I-5.403 J-.328 E.01661
G1 X151.565 Y118.713 E.39728
G1 X151.565 Y118.179 E.01642
G1 X142.416 Y127.328 E.39795
G1 X142.379 Y126.831 E.01532
G1 X151.565 Y117.646 E.39957
G1 X151.565 Y117.112 E.01642
G1 X142.323 Y126.354 E.40202
G2 X142.252 Y125.891 I-4.672 J.48 E.01441
G1 X151.565 Y116.578 E.40511
G1 X151.565 Y116.044 E.01642
G1 X142.167 Y125.441 E.40877
G1 X142.068 Y125.007 E.01371
G1 X151.565 Y115.51 E.41309
M73 P58 R5
G1 X151.565 Y114.976 E.01642
G1 X141.954 Y124.587 E.41805
G2 X141.83 Y124.177 I-4.169 J1.037 E.01318
G1 X151.565 Y114.443 E.42344
G1 X151.565 Y113.909 E.01642
G1 X141.696 Y123.777 E.42928
G2 X141.547 Y123.393 I-3.929 J1.303 E.01269
G1 X151.565 Y113.375 E.43577
G1 X151.565 Y112.841 E.01642
G1 X141.39 Y123.016 E.4426
G1 X141.224 Y122.648 E.01241
G1 X151.565 Y112.307 E.44982
G1 X151.565 Y111.774 E.01642
G1 X141.045 Y122.293 E.45761
G2 X140.859 Y121.945 I-3.582 J1.684 E.01214
G1 X151.565 Y111.24 E.46568
G1 X151.565 Y110.706 E.01642
G1 X140.664 Y121.607 E.47418
G2 X140.458 Y121.279 I-3.391 J1.897 E.01192
G1 X151.565 Y110.172 E.48313
G1 X151.565 Y109.638 E.01642
G1 X147.481 Y113.722 E.17763
G1 X147.575 Y113.258 E.01457
G1 X147.575 Y113.094 E.00503
G1 X151.565 Y109.104 E.17355
G1 X151.565 Y108.571 E.01642
G1 X147.544 Y112.591 E.17488
G1 X147.473 Y112.237 E.0111
G1 X147.441 Y112.161 E.00255
G1 X151.565 Y108.037 E.1794
G1 X151.565 Y107.503 E.01642
G1 X147.282 Y111.785 E.18628
G1 X147.069 Y111.464 E.01185
G1 X151.565 Y106.969 E.19554
G1 X151.565 Y106.435 E.01642
G1 X146.821 Y111.179 E.20635
G2 X146.538 Y110.928 I-.762 J.574 E.01171
G1 X151.031 Y106.435 E.19543
G1 X150.497 Y106.435 E.01642
G1 X146.214 Y110.719 E.18632
G1 X145.836 Y110.562 E.01256
G1 X149.963 Y106.435 E.17951
G1 X149.429 Y106.435 E.01642
G1 X145.407 Y110.457 E.17495
G2 X144.904 Y110.427 I-.327 J1.23 E.01561
G1 X148.896 Y106.435 E.17362
G1 X148.362 Y106.435 E.01642
G1 X144.282 Y110.515 E.17748
G1 X143.819 Y110.697 E.01528
G1 X143.387 Y110.977 E.01585
G1 X143.018 Y111.337 E.01585
G1 X142.727 Y111.762 E.01585
G1 X142.519 Y112.278 E.01711
G1 X137.042 Y117.755 E.23824
G3 X137.355 Y117.976 I-2.055 J3.247 E.01179
G1 X142.425 Y112.906 E.22054
G1 X142.425 Y113.258 E.01082
G1 X142.456 Y113.409 E.00475
G1 X137.659 Y118.206 E.20866
G3 X137.953 Y118.445 I-2.251 J3.07 E.01168
G1 X142.559 Y113.839 E.20036
G1 X142.718 Y114.215 E.01254
G1 X138.243 Y118.689 E.19465
G1 X138.52 Y118.946 E.01162
G1 X142.931 Y114.536 E.19186
G2 X143.179 Y114.821 I.83 J-.472 E.01172
G1 X138.791 Y119.209 E.19087
G1 X139.055 Y119.479 E.01161
G1 X143.462 Y115.072 E.19171
G1 X143.786 Y115.281 E.01188
G1 X139.308 Y119.759 E.19479
G3 X139.557 Y120.045 I-2.734 J2.633 E.01164
G1 X144.164 Y115.438 E.2004
G2 X144.592 Y115.543 I.474 J-1.008 E.01367
G1 X139.794 Y120.342 E.20875
G3 X140.024 Y120.645 I-2.928 J2.458 E.01173
G1 X145.09 Y115.579 E.22038
G2 X145.735 Y115.468 I-.027 J-2.084 E.02021
G1 X140.125 Y121.078 E.24401
; WIPE_START
G1 F24000
G1 X141.54 Y119.663 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I1.096 J.528 P1  F30000
G1 X147.998 Y106.266 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X136.724 Y117.54 E.49041
G1 X136.392 Y117.337 E.01194
G1 X147.294 Y106.435 E.47422
G1 X146.76 Y106.435 E.01642
G1 X136.054 Y117.141 E.46571
G1 X135.709 Y116.953 E.0121
G1 X146.226 Y106.435 E.45752
G1 X145.693 Y106.435 E.01642
G1 X135.35 Y116.778 E.44991
G2 X134.984 Y116.61 I-1.868 J3.578 E.01238
G1 X145.159 Y106.435 E.44259
G1 X144.625 Y106.435 E.01642
G1 X134.609 Y116.452 E.4357
G2 X134.22 Y116.306 I-1.65 J3.822 E.01277
G1 X144.091 Y106.435 E.42939
G1 X143.557 Y106.435 E.01642
G1 X133.823 Y116.17 E.42343
G1 X133.415 Y116.044 E.01313
G1 X143.023 Y106.435 E.41796
G1 X142.49 Y106.435 E.01642
G1 X132.992 Y115.933 E.41316
G2 X132.557 Y115.834 I-1.215 J4.301 E.01371
G1 X141.956 Y106.435 E.40883
G1 X141.422 Y106.435 E.01642
G1 X132.111 Y115.746 E.40501
G1 X131.647 Y115.676 E.01443
G1 X140.888 Y106.435 E.40197
G1 X140.354 Y106.435 E.01642
G1 X131.167 Y115.623 E.39966
G2 X130.67 Y115.586 I-.617 J4.963 E.01534
G1 X139.821 Y106.435 E.39806
G1 X139.287 Y106.435 E.01642
G1 X130.154 Y115.568 E.39728
G2 X129.616 Y115.572 I-.232 J5.387 E.01654
G1 X138.753 Y106.435 E.39744
G1 X138.219 Y106.435 E.01642
G1 X129.054 Y115.601 E.3987
G1 X128.46 Y115.66 E.01834
G1 X137.685 Y106.435 E.40128
G1 X137.151 Y106.435 E.01642
G1 X127.832 Y115.755 E.4054
G2 X127.158 Y115.895 I1.067 J6.822 E.02118
G1 X136.618 Y106.435 E.4115
G1 X136.084 Y106.435 E.01642
G1 X126.427 Y116.092 E.42008
G2 X125.621 Y116.364 I2.319 J8.206 E.02616
G1 X135.55 Y106.435 E.4319
G1 X135.016 Y106.435 E.01642
G1 X124.695 Y116.757 E.44897
G2 X123.538 Y117.38 I5.375 J11.365 E.04043
G1 X134.482 Y106.435 E.47607
G1 X133.949 Y106.435 E.01642
G1 X108.435 Y131.949 E1.10981
G1 X108.435 Y132.482 E.01642
G1 X119.371 Y121.547 E.47568
G2 X118.754 Y122.698 I12.481 J7.432 E.04017
G1 X108.435 Y133.016 E.44885
G1 X108.435 Y133.55 E.01642
G1 X118.363 Y123.622 E.43186
G2 X118.09 Y124.429 I14.791 J5.454 E.0262
G1 X108.435 Y134.084 E.41999
G1 X108.435 Y134.618 E.01642
G1 X117.898 Y125.155 E.41161
G2 X117.76 Y125.827 I6.664 J1.721 E.02111
G1 X108.435 Y135.151 E.4056
G1 X108.435 Y135.685 E.01642
G1 X117.664 Y126.456 E.40146
G2 X117.605 Y127.05 I5.917 J.897 E.01836
G1 X108.435 Y136.219 E.39886
G1 X108.435 Y136.753 E.01642
G1 X117.574 Y127.614 E.39753
G2 X117.568 Y128.154 I5.402 J.328 E.01661
G1 X108.435 Y137.287 E.39728
G1 X108.435 Y137.821 E.01642
G1 X117.584 Y128.672 E.39795
G1 X117.621 Y129.169 E.01532
G1 X108.435 Y138.354 E.39957
G1 X108.435 Y138.888 E.01642
G1 X117.677 Y129.646 E.40202
G2 X117.748 Y130.109 I4.673 J-.48 E.01441
G1 X108.435 Y139.422 E.40511
G1 X108.435 Y139.956 E.01642
G1 X117.833 Y130.559 E.40877
G1 X117.932 Y130.993 E.01371
G1 X108.435 Y140.49 E.41309
G1 X108.435 Y141.023 E.01642
G1 X118.046 Y131.413 E.41805
G2 X118.17 Y131.823 I4.169 J-1.037 E.01318
G1 X108.435 Y141.557 E.42344
G1 X108.435 Y142.091 E.01642
G1 X118.304 Y132.222 E.42928
G2 X118.453 Y132.607 I3.93 J-1.303 E.01269
G1 X108.435 Y142.625 E.43577
G1 X108.435 Y143.159 E.01642
G1 X118.61 Y132.984 E.4426
M73 P59 R5
G1 X118.776 Y133.352 E.01241
G1 X108.435 Y143.693 E.44982
G1 X108.435 Y144.226 E.01642
G1 X118.955 Y133.706 E.45761
G2 X119.141 Y134.055 I3.582 J-1.684 E.01214
G1 X108.435 Y144.76 E.46568
G1 X108.435 Y145.294 E.01642
G1 X119.336 Y134.393 E.47418
G2 X119.542 Y134.721 I3.39 J-1.896 E.01192
G1 X108.266 Y145.998 E.49051
G1 X108.266 Y131.584 F30000
G1 F15000
G1 X133.415 Y106.435 E1.09397
G1 X132.881 Y106.435 E.01642
G1 X108.435 Y130.881 E1.06337
G1 X108.435 Y130.347 E.01642
G1 X132.347 Y106.435 E1.04015
G1 X131.813 Y106.435 E.01642
G1 X108.435 Y129.813 E1.01693
G1 X108.435 Y129.279 E.01642
G1 X131.279 Y106.435 E.99371
G1 X130.746 Y106.435 E.01642
G1 X108.435 Y128.746 E.97049
G1 X108.435 Y128.212 E.01642
G1 X130.212 Y106.435 E.94727
G1 X129.678 Y106.435 E.01642
G1 X108.435 Y127.678 E.92405
G1 X108.435 Y127.144 E.01642
G1 X129.144 Y106.435 E.90083
G1 X128.61 Y106.435 E.01642
G1 X108.435 Y126.61 E.8776
G1 X108.435 Y126.077 E.01642
G1 X128.077 Y106.435 E.85438
G1 X127.543 Y106.435 E.01642
G1 X108.435 Y125.543 E.83116
G1 X108.435 Y125.009 E.01642
G1 X127.009 Y106.435 E.80794
G1 X126.475 Y106.435 E.01642
G1 X108.435 Y124.475 E.78472
G1 X108.435 Y123.941 E.01642
G1 X125.941 Y106.435 E.7615
G1 X125.407 Y106.435 E.01642
G1 X108.435 Y123.407 E.73828
G1 X108.435 Y122.874 E.01642
G1 X115.882 Y115.427 E.32393
G1 X115.322 Y115.568 E.01777
G1 X115.205 Y115.571 E.00361
G1 X108.435 Y122.34 E.29446
G1 X108.435 Y121.806 E.01642
G1 X114.683 Y115.559 E.27175
G1 X114.24 Y115.468 E.01391
G1 X108.435 Y121.272 E.25249
G1 X108.435 Y120.738 E.01642
G1 X113.856 Y115.317 E.23581
G1 X113.526 Y115.113 E.01193
G1 X108.435 Y120.204 E.22146
G1 X108.435 Y119.671 E.01642
G1 X113.233 Y114.873 E.20869
G3 X112.974 Y114.599 I.549 J-.779 E.01169
G1 X108.435 Y119.137 E.19741
G1 X108.435 Y118.603 E.01642
G1 X112.757 Y114.281 E.188
G1 X112.591 Y113.914 E.01241
G1 X108.435 Y118.069 E.18076
G1 X108.435 Y117.535 E.01642
G1 X112.473 Y113.497 E.17565
G3 X112.42 Y113.017 I1.347 J-.393 E.01495
G1 X108.435 Y117.002 E.17334
G1 X108.435 Y116.468 E.01642
G1 X112.748 Y112.155 E.18759
; WIPE_START
G1 F24000
G1 X111.334 Y113.569 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.146 J1.208 P1  F30000
G1 X117.049 Y114.26 Z.8
G1 Z.4
G1 E.8 F1800
G1 F15000
G1 X124.874 Y106.435 E.34039
G1 X124.34 Y106.435 E.01642
G1 X117.574 Y113.201 E.29432
G1 X117.562 Y112.679 E.01608
G1 X123.806 Y106.435 E.27159
G1 X123.272 Y106.435 E.01642
G1 X117.472 Y112.235 E.2523
G1 X117.314 Y111.86 E.01253
G1 X122.738 Y106.435 E.23597
G1 X122.205 Y106.435 E.01642
G1 X117.112 Y111.527 E.2215
G2 X116.875 Y111.231 I-.851 J.44 E.01176
G1 X121.671 Y106.435 E.20863
G1 X121.137 Y106.435 E.01642
G1 X116.602 Y110.97 E.19724
G1 X116.278 Y110.76 E.01188
G1 X120.603 Y106.435 E.18813
G1 X120.069 Y106.435 E.01642
G1 X115.913 Y110.592 E.18081
G2 X115.498 Y110.473 I-.502 J.967 E.01336
G1 X119.535 Y106.435 E.17564
G1 X119.002 Y106.435 E.01642
G1 X115.013 Y110.424 E.1735
G2 X114.409 Y110.494 I-.129 J1.528 E.01881
G1 X118.468 Y106.435 E.17654
G1 X117.934 Y106.435 E.01642
G1 X108.435 Y115.934 E.41319
G1 X108.435 Y115.4 E.01642
G1 X117.4 Y106.435 E.38996
G1 X116.866 Y106.435 E.01642
G1 X108.435 Y114.866 E.36674
G1 X108.435 Y114.332 E.01642
G1 X116.332 Y106.435 E.34352
G1 X115.799 Y106.435 E.01642
G1 X108.435 Y113.799 E.3203
G1 X108.435 Y113.265 E.01642
G1 X115.265 Y106.435 E.29708
G1 X114.731 Y106.435 E.01642
G1 X108.435 Y112.731 E.27386
G1 X108.435 Y112.197 E.01642
G1 X114.197 Y106.435 E.25064
G1 X113.663 Y106.435 E.01642
G1 X108.435 Y111.663 E.22742
G1 X108.435 Y111.13 E.01642
G1 X113.13 Y106.435 E.2042
G1 X112.596 Y106.435 E.01642
G1 X108.435 Y110.596 E.18098
G1 X108.435 Y110.062 E.01642
G1 X112.062 Y106.435 E.15775
G1 X111.528 Y106.435 E.01642
G1 X108.435 Y109.528 E.13453
G1 X108.435 Y108.994 E.01642
G1 X110.994 Y106.435 E.11131
G1 X110.46 Y106.435 E.01642
G1 X108.435 Y108.46 E.08809
G1 X108.435 Y107.927 E.01642
G1 X109.927 Y106.435 E.06487
G1 X109.393 Y106.435 E.01642
G1 X108.435 Y107.393 E.04165
G1 X108.435 Y106.859 E.01642
G1 X109.029 Y106.266 E.02581
M106 S234.6
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.435 Y106.859 E-.31886
G1 X108.435 Y107.393 E-.20285
G1 X108.879 Y106.949 E-.23829
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
G3 Z.8 I-.562 J1.08 P1  F30000
G1 X141.369 Y123.852 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X141.371 Y123.861 E.00032
G3 X129.698 Y115.901 I-11.371 J4.137 E2.02156
G1 X130.302 Y115.901 E.02002
G3 X141.151 Y123.299 I-.302 J12.097 E.46042
G1 X141.347 Y123.796 E.01771
G1 X141.003 Y123.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X129.708 Y116.294 I-11.003 J4.003 E1.81189
G1 X130.292 Y116.294 E.01794
G3 X140.982 Y123.939 I-.292 J11.705 E.42877
M204 S10000
; WIPE_START
G1 F24000
G1 X141.19 Y124.548 E-.24464
G1 X141.348 Y125.11 E-.22189
G1 X141.478 Y125.68 E-.22186
G1 X141.511 Y125.865 E-.07161
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.45 J-1.131 P1  F30000
G1 X113.571 Y114.738 Z1
G1 Z.6
M73 P60 R5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X113.276 Y114.447 E.01375
G3 X114.72 Y110.765 I1.724 J-1.448 E.16018
G1 X114.944 Y110.748 E.00745
G3 X113.617 Y114.776 I.056 J2.251 E.28587
G1 X113.841 Y114.453 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X114.769 Y111.154 I1.159 J-1.454 E.13391
G1 X114.954 Y111.14 E.0057
G3 X113.889 Y114.489 I.046 J1.859 E.21748
M204 S10000
; WIPE_START
G1 F24000
G1 X113.575 Y114.196 E-.16333
G1 X113.366 Y113.89 E-.14076
G1 X113.222 Y113.548 E-.14078
G1 X113.149 Y113.187 E-.14005
G1 X113.142 Y112.907 E-.10645
G1 X113.169 Y112.728 E-.06862
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.207 J.153 P1  F30000
G1 X116.852 Y141.737 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X116.978 Y141.923 E.00744
G3 X114.72 Y140.765 I-1.978 J1.076 E.37983
G1 X114.944 Y140.748 E.00745
G3 X116.725 Y141.552 I.056 J2.251 E.06707
G1 X116.818 Y141.688 E.00545
G1 X116.546 Y141.969 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.713 Y142.278 E.01078
G3 X114.769 Y141.154 I-1.714 J.721 E.28483
G1 X114.954 Y141.14 E.0057
G3 X116.514 Y141.919 I.046 J1.859 E.05577
M204 S10000
; WIPE_START
G1 F24000
G1 X116.713 Y142.278 E-.15592
G1 X116.823 Y142.631 E-.14073
G1 X116.858 Y142.925 E-.11221
G1 X116.839 Y143.277 E-.1342
G1 X116.748 Y143.636 E-.14078
G1 X116.661 Y143.817 E-.07616
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.07 J1.215 P1  F30000
G1 X142.86 Y142.305 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.022 Y141.923 E.01376
G3 X144.72 Y140.765 I1.978 J1.076 E.0708
G1 X144.944 Y140.748 E.00745
G3 X142.841 Y142.361 I.056 J2.251 E.37524
G1 X143.221 Y142.456 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.223 Y142.452 E.00015
G3 X144.769 Y141.154 I1.777 J.547 E.06555
G1 X144.954 Y141.14 E.0057
G3 X143.15 Y142.815 I.046 J1.859 E.27628
G1 X143.21 Y142.515 E.00939
M204 S10000
; WIPE_START
G1 F24000
G1 X143.223 Y142.452 E-.02462
G1 X143.366 Y142.11 E-.14075
G1 X143.575 Y141.804 E-.14076
G1 X143.84 Y141.546 E-.14077
G1 X144.15 Y141.346 E-.14005
G1 X144.408 Y141.237 E-.10646
G1 X144.579 Y141.198 E-.06659
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.216 J-.058 P1  F30000
G1 X143.298 Y114.472 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.276 Y114.446 E.00112
G3 X144.721 Y110.765 I1.724 J-1.448 E.16018
G1 X144.944 Y110.748 E.00743
G3 X143.597 Y114.759 I.056 J2.251 E.28675
G1 X143.342 Y114.513 E.01176
G1 X143.576 Y114.195 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X144.769 Y111.154 I1.424 J-1.196 E.12252
G1 X144.954 Y111.14 E.00569
G3 X143.616 Y114.24 I.046 J1.859 E.22887
M204 S10000
; WIPE_START
G1 F24000
G1 X143.366 Y113.89 E-.16333
G1 X143.222 Y113.548 E-.14078
G1 X143.149 Y113.185 E-.14076
G1 X143.149 Y112.815 E-.14077
G1 X143.222 Y112.452 E-.14077
G1 X143.257 Y112.37 E-.03359
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.186 J.273 P1  F30000
G1 X151.898 Y149.898 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.259 J-1.189 P1  F30000
G1 X147.998 Y149.734 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420388
G1 F15000
G1 X136.724 Y138.46 E.49041
G1 X136.392 Y138.663 E.01194
G1 X147.294 Y149.565 E.47422
G1 X146.76 Y149.565 E.01642
G1 X136.054 Y138.859 E.46571
G1 X135.709 Y139.047 E.0121
G1 X146.226 Y149.565 E.45752
G1 X145.693 Y149.565 E.01642
G1 X135.35 Y139.222 E.44991
G3 X134.984 Y139.39 I-1.868 J-3.578 E.01238
G1 X145.159 Y149.565 E.44259
G1 X144.625 Y149.565 E.01642
G1 X134.609 Y139.548 E.4357
G3 X134.22 Y139.694 I-1.649 J-3.821 E.01277
G1 X144.091 Y149.565 E.42939
G1 X143.557 Y149.565 E.01642
G1 X133.823 Y139.83 E.42343
G1 X133.415 Y139.956 E.01313
G1 X143.023 Y149.565 E.41796
G1 X142.49 Y149.565 E.01642
G1 X132.992 Y140.067 E.41316
G3 X132.557 Y140.166 I-1.215 J-4.301 E.01371
G1 X141.956 Y149.565 E.40883
G1 X141.422 Y149.565 E.01642
G1 X132.111 Y140.254 E.40501
G1 X131.647 Y140.324 E.01443
G1 X140.888 Y149.565 E.40197
G1 X140.354 Y149.565 E.01642
G1 X131.167 Y140.377 E.39966
G3 X130.67 Y140.414 I-.617 J-4.964 E.01534
G1 X139.821 Y149.565 E.39806
G1 X139.287 Y149.565 E.01642
G1 X130.154 Y140.432 E.39728
G3 X129.616 Y140.428 I-.232 J-5.386 E.01654
G1 X138.753 Y149.565 E.39744
G1 X138.219 Y149.565 E.01642
G1 X129.054 Y140.399 E.3987
G1 X128.46 Y140.34 E.01834
G1 X137.685 Y149.565 E.40128
G1 X137.151 Y149.565 E.01642
G1 X127.832 Y140.245 E.4054
G3 X127.158 Y140.105 I1.068 J-6.825 E.02118
G1 X136.618 Y149.565 E.4115
G1 X136.084 Y149.565 E.01642
G1 X126.427 Y139.908 E.42008
G3 X125.621 Y139.636 I2.319 J-8.205 E.02616
G1 X135.55 Y149.565 E.4319
G1 X135.016 Y149.565 E.01642
G1 X124.695 Y139.243 E.44897
G3 X123.538 Y138.62 I5.374 J-11.365 E.04043
G1 X134.482 Y149.565 E.47607
G1 X133.949 Y149.565 E.01642
G1 X108.435 Y124.051 E1.10981
G1 X108.435 Y123.518 E.01642
G1 X119.371 Y134.453 E.47568
G3 X118.754 Y133.302 I12.481 J-7.432 E.04017
G1 X108.435 Y122.984 E.44885
G1 X108.435 Y122.45 E.01642
G1 X118.363 Y132.378 E.43186
G3 X118.09 Y131.571 I14.79 J-5.453 E.0262
G1 X108.435 Y121.916 E.41999
G1 X108.435 Y121.382 E.01642
G1 X117.898 Y130.845 E.41161
G3 X117.76 Y130.173 I6.664 J-1.721 E.02111
G1 X108.435 Y120.849 E.4056
G1 X108.435 Y120.315 E.01642
G1 X117.664 Y129.544 E.40146
G3 X117.605 Y128.95 I5.918 J-.897 E.01836
G1 X108.435 Y119.781 E.39886
G1 X108.435 Y119.247 E.01642
G1 X117.574 Y128.386 E.39753
G3 X117.568 Y127.846 I5.404 J-.328 E.01661
G1 X108.435 Y118.713 E.39728
G1 X108.435 Y118.179 E.01642
G1 X117.584 Y127.328 E.39795
G1 X117.621 Y126.831 E.01532
G1 X108.435 Y117.646 E.39957
G1 X108.435 Y117.112 E.01642
G1 X117.677 Y126.354 E.40202
G3 X117.748 Y125.891 I4.672 J.48 E.01441
G1 X108.435 Y116.578 E.40511
G1 X108.435 Y116.044 E.01642
G1 X117.833 Y125.441 E.40877
G1 X117.932 Y125.007 E.01371
G1 X108.435 Y115.51 E.41309
G1 X108.435 Y114.977 E.01642
G1 X118.046 Y124.587 E.41805
G3 X118.17 Y124.177 I4.169 J1.037 E.01318
G1 X108.435 Y114.443 E.42344
M73 P61 R5
G1 X108.435 Y113.909 E.01642
G1 X118.304 Y123.778 E.42928
G3 X118.453 Y123.393 I3.927 J1.302 E.01269
G1 X108.435 Y113.375 E.43577
G1 X108.435 Y112.841 E.01642
G1 X118.61 Y123.016 E.4426
G1 X118.776 Y122.648 E.01241
G1 X108.435 Y112.307 E.44982
G1 X108.435 Y111.774 E.01642
G1 X118.955 Y122.294 E.45761
G3 X119.141 Y121.945 I3.582 J1.684 E.01214
G1 X108.435 Y111.24 E.46568
G1 X108.435 Y110.706 E.01642
G1 X119.336 Y121.607 E.47418
G3 X119.542 Y121.279 I3.391 J1.897 E.01192
G1 X108.266 Y110.002 E.49051
; WIPE_START
G1 F24000
G1 X109.68 Y111.417 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.529 J1.096 P1  F30000
G1 X123.08 Y117.877 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X117.481 Y112.278 E.24355
G1 X117.573 Y112.733 E.01426
G1 X117.578 Y112.909 E.00542
G1 X122.645 Y117.976 E.22041
G1 X122.341 Y118.206 E.01172
G1 X117.543 Y113.407 E.20873
G3 X117.436 Y113.835 I-1.111 J-.049 E.01364
G1 X122.047 Y118.445 E.20055
G2 X121.757 Y118.689 I2.3 J3.021 E.01166
G1 X117.278 Y114.21 E.19484
G1 X117.075 Y114.542 E.01194
G1 X121.48 Y118.946 E.1916
G2 X121.209 Y119.209 I2.493 J2.85 E.01162
G1 X116.822 Y114.822 E.19082
G3 X116.534 Y115.068 I-.753 J-.588 E.01172
G1 X120.945 Y119.479 E.19187
G2 X120.692 Y119.759 I2.683 J2.678 E.01163
G1 X116.211 Y115.279 E.19492
G1 X115.843 Y115.445 E.01241
G1 X120.443 Y120.045 E.20011
G1 X120.206 Y120.342 E.01168
G1 X115.412 Y115.547 E.20856
G1 X115.322 Y115.568 E.00284
G1 X114.909 Y115.578 E.01271
G1 X119.976 Y120.645 E.22043
G1 X119.753 Y120.956 E.01176
G1 X114.281 Y115.484 E.23803
G1 X113.819 Y115.303 E.01525
G1 X113.387 Y115.023 E.01585
G1 X113.018 Y114.663 E.01585
G1 X112.727 Y114.238 E.01585
G1 X112.519 Y113.722 E.01711
G1 X108.435 Y109.638 E.17763
G1 X108.435 Y109.104 E.01642
G1 X112.422 Y113.091 E.17342
G3 X112.457 Y112.593 I1.417 J-.15 E.01545
G1 X108.435 Y108.571 E.17496
G1 X108.435 Y108.037 E.01642
G1 X112.564 Y112.165 E.17958
G3 X112.722 Y111.79 I1.008 J.204 E.01262
G1 X108.435 Y107.503 E.18647
G1 X108.435 Y106.969 E.01642
G1 X112.924 Y111.458 E.19528
G1 X113.178 Y111.178 E.01163
G1 X108.435 Y106.435 E.2063
G1 X108.969 Y106.435 E.01642
G1 X113.466 Y110.932 E.1956
G3 X113.789 Y110.721 I.682 J.695 E.01195
G1 X109.503 Y106.435 E.18645
G1 X110.037 Y106.435 E.01642
G1 X114.157 Y110.556 E.17923
G1 X114.588 Y110.453 E.01363
G1 X110.571 Y106.435 E.17476
G1 X111.104 Y106.435 E.01642
G1 X115.091 Y110.422 E.17342
G1 X115.193 Y110.419 E.00315
G1 X115.719 Y110.516 E.01644
G1 X111.638 Y106.435 E.17751
G1 X112.172 Y106.435 E.01642
G1 X123.276 Y117.54 E.48303
G1 X123.608 Y117.337 E.01194
G1 X112.706 Y106.435 E.47422
G1 X113.24 Y106.435 E.01642
G1 X123.946 Y117.141 E.46571
G1 X124.291 Y116.953 E.0121
G1 X113.774 Y106.435 E.45752
G1 X114.307 Y106.435 E.01642
G1 X124.65 Y116.778 E.44991
G3 X125.016 Y116.61 I1.868 J3.579 E.01238
G1 X114.841 Y106.435 E.44259
G1 X115.375 Y106.435 E.01642
G1 X125.391 Y116.452 E.4357
G3 X125.78 Y116.306 I1.649 J3.82 E.01277
G1 X115.909 Y106.435 E.42939
G1 X116.443 Y106.435 E.01642
G1 X126.177 Y116.17 E.42343
G1 X126.585 Y116.044 E.01313
G1 X116.976 Y106.435 E.41796
G1 X117.51 Y106.435 E.01642
G1 X127.008 Y115.933 E.41316
G3 X127.442 Y115.834 I1.215 J4.301 E.01371
G1 X118.044 Y106.435 E.40883
G1 X118.578 Y106.435 E.01642
G1 X127.889 Y115.746 E.40501
G1 X128.352 Y115.676 E.01443
G1 X119.112 Y106.435 E.40197
G1 X119.646 Y106.435 E.01642
G1 X128.833 Y115.623 E.39966
G3 X129.33 Y115.586 I.617 J4.963 E.01534
G1 X120.179 Y106.435 E.39806
G1 X120.713 Y106.435 E.01642
G1 X129.846 Y115.568 E.39728
G3 X130.384 Y115.572 I.232 J5.386 E.01654
G1 X121.247 Y106.435 E.39744
G1 X121.781 Y106.435 E.01642
G1 X130.946 Y115.601 E.3987
G1 X131.539 Y115.66 E.01834
G1 X122.315 Y106.435 E.40128
G1 X122.848 Y106.435 E.01642
G1 X132.168 Y115.755 E.4054
G3 X132.842 Y115.895 I-1.067 J6.823 E.02118
G1 X123.382 Y106.435 E.4115
G1 X123.916 Y106.435 E.01642
G1 X133.573 Y116.092 E.42008
G3 X134.379 Y116.364 I-2.319 J8.206 E.02616
G1 X124.45 Y106.435 E.4319
G1 X124.984 Y106.435 E.01642
G1 X135.305 Y116.756 E.44896
G3 X136.462 Y117.379 I-5.375 J11.366 E.04043
G1 X125.518 Y106.435 E.47606
G1 X126.051 Y106.435 E.01642
G1 X151.565 Y131.949 E1.10982
G1 X151.565 Y131.415 E.01642
G1 X126.585 Y106.435 E1.0866
G1 X127.119 Y106.435 E.01642
G1 X151.565 Y130.881 E1.06338
G1 X151.565 Y130.347 E.01642
G1 X127.653 Y106.435 E1.04015
G1 X128.187 Y106.435 E.01642
G1 X151.565 Y129.813 E1.01693
G1 X151.565 Y129.28 E.01642
G1 X128.72 Y106.435 E.99371
G1 X129.254 Y106.435 E.01642
G1 X151.565 Y128.746 E.97049
G1 X151.565 Y128.212 E.01642
G1 X129.788 Y106.435 E.94727
G1 X130.322 Y106.435 E.01642
G1 X151.565 Y127.678 E.92405
G1 X151.565 Y127.144 E.01642
G1 X130.856 Y106.435 E.90083
G1 X131.39 Y106.435 E.01642
G1 X151.565 Y126.61 E.87761
G1 X151.565 Y126.077 E.01642
G1 X131.923 Y106.435 E.85439
G1 X132.457 Y106.435 E.01642
G1 X151.565 Y125.543 E.83117
G1 X151.565 Y125.009 E.01642
G1 X132.991 Y106.435 E.80794
G1 X133.525 Y106.435 E.01642
G1 X151.565 Y124.475 E.78472
G1 X151.565 Y123.941 E.01642
G1 X134.059 Y106.435 E.7615
G1 X134.593 Y106.435 E.01642
G1 X151.734 Y123.577 E.74566
G1 X151.734 Y132.652 F30000
G1 F15000
G1 X140.629 Y121.547 E.48306
G3 X141.246 Y122.698 I-12.476 J7.429 E.04017
M73 P61 R4
G1 X151.565 Y133.016 E.44884
G1 X151.565 Y133.55 E.01642
G1 X141.637 Y123.622 E.43186
G3 X141.91 Y124.429 I-14.79 J5.453 E.0262
G1 X151.565 Y134.084 E.41999
G1 X151.565 Y134.618 E.01642
G1 X142.102 Y125.155 E.41161
G3 X142.24 Y125.827 I-6.664 J1.721 E.02111
G1 X151.565 Y135.152 E.4056
G1 X151.565 Y135.685 E.01642
G1 X142.336 Y126.456 E.40146
G3 X142.395 Y127.05 I-5.919 J.897 E.01836
G1 X151.565 Y136.219 E.39886
G1 X151.565 Y136.753 E.01642
G1 X142.426 Y127.614 E.39753
G3 X142.432 Y128.154 I-5.404 J.328 E.01661
G1 X151.565 Y137.287 E.39728
G1 X151.565 Y137.821 E.01642
G1 X142.416 Y128.672 E.39795
G1 X142.379 Y129.169 E.01532
M73 P62 R4
G1 X151.565 Y138.354 E.39957
G1 X151.565 Y138.888 E.01642
G1 X142.323 Y129.646 E.40202
G3 X142.252 Y130.109 I-4.672 J-.48 E.01441
G1 X151.565 Y139.422 E.40511
G1 X151.565 Y139.956 E.01642
G1 X142.167 Y130.559 E.40877
G1 X142.068 Y130.993 E.01371
G1 X151.565 Y140.49 E.41309
G1 X151.565 Y141.024 E.01642
G1 X141.954 Y131.413 E.41805
G3 X141.83 Y131.823 I-4.169 J-1.037 E.01318
G1 X151.565 Y141.557 E.42344
G1 X151.565 Y142.091 E.01642
G1 X141.696 Y132.223 E.42928
G3 X141.547 Y132.607 I-3.928 J-1.303 E.01269
G1 X151.565 Y142.625 E.43577
G1 X151.565 Y143.159 E.01642
G1 X141.39 Y132.984 E.4426
G1 X141.224 Y133.352 E.01241
G1 X151.565 Y143.693 E.44982
G1 X151.565 Y144.226 E.01642
G1 X141.045 Y133.707 E.45761
G3 X140.859 Y134.055 I-3.582 J-1.685 E.01214
G1 X151.565 Y144.76 E.46568
G1 X151.565 Y145.294 E.01642
G1 X140.664 Y134.393 E.47418
G3 X140.458 Y134.721 I-3.39 J-1.897 E.01192
G1 X151.565 Y145.828 E.48313
G1 X151.565 Y146.362 E.01642
G1 X147.481 Y142.278 E.17763
G1 X147.575 Y142.742 E.01457
G1 X147.575 Y142.906 E.00503
G1 X151.565 Y146.896 E.17355
G1 X151.565 Y147.429 E.01642
G1 X147.544 Y143.409 E.17488
G1 X147.473 Y143.763 E.0111
G1 X147.441 Y143.839 E.00255
G1 X151.565 Y147.963 E.1794
G1 X151.565 Y148.497 E.01642
G1 X147.282 Y144.215 E.18628
G1 X147.069 Y144.536 E.01185
G1 X151.565 Y149.031 E.19554
G1 X151.565 Y149.565 E.01642
G1 X146.821 Y144.821 E.20635
G3 X146.538 Y145.072 I-.764 J-.576 E.01171
G1 X151.031 Y149.565 E.19543
G1 X150.497 Y149.565 E.01642
G1 X146.214 Y145.282 E.18631
G1 X145.843 Y145.444 E.01246
G1 X149.963 Y149.565 E.17923
G1 X149.429 Y149.565 E.01642
G1 X145.412 Y145.547 E.17476
G1 X145.322 Y145.568 E.00284
G1 X144.909 Y145.578 E.01271
G1 X148.896 Y149.565 E.17342
G1 X148.362 Y149.565 E.01642
G1 X144.281 Y145.484 E.17751
G1 X143.819 Y145.303 E.01525
G1 X143.387 Y145.023 E.01585
G1 X143.018 Y144.663 E.01585
G1 X142.727 Y144.238 E.01585
G1 X142.519 Y143.722 E.01711
G1 X137.042 Y138.245 E.23824
G2 X137.355 Y138.024 I-2.054 J-3.247 E.01179
G1 X142.425 Y143.094 E.22054
G1 X142.425 Y142.742 E.01082
G1 X142.456 Y142.591 E.00475
G1 X137.659 Y137.794 E.20866
G2 X137.953 Y137.555 I-2.251 J-3.07 E.01168
G1 X142.559 Y142.161 E.20036
G1 X142.718 Y141.785 E.01254
G1 X138.243 Y137.311 E.19465
G1 X138.52 Y137.054 E.01162
G1 X142.931 Y141.464 E.19186
G3 X143.179 Y141.179 I.83 J.472 E.01172
G1 X138.791 Y136.791 E.19087
G1 X139.055 Y136.521 E.01161
G1 X143.462 Y140.928 E.19171
G1 X143.786 Y140.718 E.01187
G1 X139.308 Y136.241 E.19479
G2 X139.557 Y135.955 I-2.734 J-2.632 E.01164
G1 X144.157 Y140.556 E.20012
G1 X144.588 Y140.453 E.01363
G1 X139.794 Y135.658 E.20856
G2 X140.024 Y135.355 I-2.927 J-2.457 E.01173
G1 X145.091 Y140.422 E.22043
G1 X145.193 Y140.419 E.00315
G1 X145.719 Y140.516 E.01644
G1 X140.125 Y134.922 E.24332
G1 X133.584 Y149.734 F30000
G1 F15000
G1 X108.435 Y124.585 E1.09397
G1 X108.435 Y125.119 E.01642
G1 X132.881 Y149.565 E1.06337
G1 X132.347 Y149.565 E.01642
G1 X108.435 Y125.653 E1.04015
G1 X108.435 Y126.187 E.01642
G1 X131.813 Y149.565 E1.01693
G1 X131.279 Y149.565 E.01642
G1 X108.435 Y126.721 E.99371
G1 X108.435 Y127.254 E.01642
G1 X130.746 Y149.565 E.97049
G1 X130.212 Y149.565 E.01642
G1 X108.435 Y127.788 E.94727
G1 X108.435 Y128.322 E.01642
G1 X129.678 Y149.565 E.92405
G1 X129.144 Y149.565 E.01642
G1 X108.435 Y128.856 E.90083
G1 X108.435 Y129.39 E.01642
G1 X128.61 Y149.565 E.8776
G1 X128.077 Y149.565 E.01642
G1 X108.435 Y129.923 E.85438
G1 X108.435 Y130.457 E.01642
G1 X127.543 Y149.565 E.83116
G1 X127.009 Y149.565 E.01642
G1 X108.435 Y130.991 E.80794
G1 X108.435 Y131.525 E.01642
G1 X126.475 Y149.565 E.78472
G1 X125.941 Y149.565 E.01642
G1 X108.435 Y132.059 E.7615
G1 X108.435 Y132.593 E.01642
G1 X125.407 Y149.565 E.73828
G1 X124.874 Y149.565 E.01642
G1 X117.419 Y142.11 E.32426
G1 X117.473 Y142.237 E.00423
G1 X117.575 Y142.8 E.01759
G1 X124.34 Y149.565 E.29427
G1 X123.806 Y149.565 E.01642
G1 X117.556 Y143.315 E.27185
G3 X117.465 Y143.757 I-1.139 J-.006 E.01398
G1 X123.272 Y149.565 E.25263
G1 X122.738 Y149.565 E.01642
G1 X117.318 Y144.145 E.23577
G1 X117.116 Y144.476 E.01194
G1 X122.204 Y149.565 E.22136
G1 X121.671 Y149.565 E.01642
G1 X116.873 Y144.767 E.2087
G3 X116.596 Y145.024 I-.774 J-.557 E.0117
G1 X121.137 Y149.565 E.19752
G1 X120.603 Y149.565 E.01642
G1 X116.284 Y145.246 E.18788
G1 X115.916 Y145.412 E.01241
G1 X120.069 Y149.565 E.18066
G1 X119.535 Y149.565 E.01642
G1 X115.498 Y145.527 E.17562
G3 X115.012 Y145.575 I-.362 J-1.178 E.01512
G1 X119.002 Y149.565 E.17353
G1 X118.468 Y149.565 E.01642
G1 X114.155 Y145.252 E.18758
; WIPE_START
G1 F24000
G1 X115.57 Y146.667 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I1.208 J.146 P1  F30000
G1 X116.259 Y140.95 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X108.435 Y133.126 E.34031
G1 X108.435 Y133.66 E.01642
G1 X115.195 Y140.42 E.29404
G1 X114.674 Y140.433 E.01601
G1 X108.435 Y134.194 E.2714
M73 P63 R4
G1 X108.435 Y134.728 E.01642
G1 X114.24 Y140.532 E.25249
G1 X113.862 Y140.689 E.01257
G1 X108.435 Y135.262 E.23607
G1 X108.435 Y135.796 E.01642
G1 X113.527 Y140.887 E.2215
G2 X113.229 Y141.123 I.433 J.856 E.01177
G1 X108.435 Y136.329 E.20852
G1 X108.435 Y136.863 E.01642
G1 X112.972 Y141.4 E.19735
G1 X112.762 Y141.724 E.01187
G1 X108.435 Y137.397 E.18822
G1 X108.435 Y137.931 E.01642
G1 X112.592 Y142.087 E.18081
G2 X112.471 Y142.501 I.962 J.505 E.01333
G1 X108.435 Y138.465 E.17556
G1 X108.435 Y138.998 E.01642
G1 X112.419 Y142.982 E.1733
G2 X112.492 Y143.589 I1.768 J.096 E.01889
G1 X108.435 Y139.532 E.17646
G1 X108.435 Y140.066 E.01642
G1 X117.934 Y149.565 E.41318
G1 X117.4 Y149.565 E.01642
G1 X108.435 Y140.6 E.38996
G1 X108.435 Y141.134 E.01642
G1 X116.866 Y149.565 E.36674
G1 X116.332 Y149.565 E.01642
G1 X108.435 Y141.668 E.34352
G1 X108.435 Y142.201 E.01642
G1 X115.799 Y149.565 E.3203
G1 X115.265 Y149.565 E.01642
G1 X108.435 Y142.735 E.29708
G1 X108.435 Y143.269 E.01642
G1 X114.731 Y149.565 E.27386
G1 X114.197 Y149.565 E.01642
G1 X108.435 Y143.803 E.25064
G1 X108.435 Y144.337 E.01642
G1 X113.663 Y149.565 E.22742
G1 X113.13 Y149.565 E.01642
G1 X108.435 Y144.87 E.2042
G1 X108.435 Y145.404 E.01642
G1 X112.596 Y149.565 E.18098
G1 X112.062 Y149.565 E.01642
G1 X108.435 Y145.938 E.15775
G1 X108.435 Y146.472 E.01642
G1 X111.528 Y149.565 E.13453
G1 X110.994 Y149.565 E.01642
G1 X108.435 Y147.006 E.11131
G1 X108.435 Y147.54 E.01642
G1 X110.46 Y149.565 E.08809
G1 X109.927 Y149.565 E.01642
G1 X108.435 Y148.073 E.06487
G1 X108.435 Y148.607 E.01642
G1 X109.393 Y149.565 E.04165
G1 X108.859 Y149.565 E.01642
G1 X108.266 Y148.971 E.02581
; WIPE_START
G1 F24000
G1 X108.859 Y149.565 E-.31886
G1 X109.393 Y149.565 E-.20285
G1 X108.949 Y149.121 E-.23829
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.971 J.734 P1  F30000
G1 X141.362 Y106.266 Z1
G1 Z.6
G1 E.8 F1800
G1 F15000
G1 X145.585 Y110.489 E.1837
G1 X145.193 Y110.419 E.01224
G1 X144.988 Y110.425 E.00633
G1 X140.998 Y106.435 E.17353
G1 X140.465 Y106.435 E.01642
G1 X144.499 Y110.47 E.17549
G2 X144.087 Y110.592 I.143 J1.236 E.01327
G1 X139.931 Y106.435 E.18081
G1 X139.397 Y106.435 E.01642
G1 X143.722 Y110.76 E.18813
G1 X143.397 Y110.97 E.01188
G1 X138.863 Y106.435 E.19725
G1 X138.329 Y106.435 E.01642
G1 X143.125 Y111.232 E.20863
G2 X142.888 Y111.527 I.613 J.736 E.01176
G1 X137.795 Y106.435 E.22151
G1 X137.262 Y106.435 E.01642
G1 X142.686 Y111.86 E.23597
G1 X142.528 Y112.236 E.01254
G1 X136.728 Y106.435 E.2523
G1 X136.194 Y106.435 E.01642
G1 X142.438 Y112.679 E.27161
G1 X142.425 Y113.2 E.01603
G1 X135.66 Y106.435 E.29427
G1 X135.126 Y106.435 E.01642
G1 X142.581 Y113.89 E.32426
G1 X142.727 Y114.238 E.01161
G1 X143.018 Y114.663 E.01585
G1 X143.387 Y115.023 E.01585
G1 X143.819 Y115.303 E.01585
G1 X144.106 Y115.415 E.00948
G1 X151.565 Y122.874 E.32443
G1 X151.565 Y122.34 E.01642
G1 X144.805 Y115.58 E.29404
G1 X145.324 Y115.566 E.01598
G1 X151.565 Y121.806 E.27145
G1 X151.565 Y121.272 E.01642
G1 X145.76 Y115.468 E.25249
G1 X146.144 Y115.317 E.01267
G1 X151.565 Y120.738 E.23582
G1 X151.565 Y120.205 E.01642
G1 X146.474 Y115.114 E.22146
G2 X146.767 Y114.873 I-.447 J-.846 E.01175
G1 X151.565 Y119.671 E.20869
G1 X151.565 Y119.137 E.01642
G1 X147.026 Y114.599 E.19741
G1 X147.243 Y114.281 E.01182
G1 X151.565 Y118.603 E.188
G1 X151.565 Y118.069 E.01642
G1 X147.409 Y113.914 E.18076
G2 X147.526 Y113.497 I-.972 J-.498 E.0134
G1 X151.565 Y117.535 E.17566
G1 X151.565 Y117.002 E.01642
G1 X147.575 Y113.012 E.17355
G2 X147.508 Y112.411 I-1.519 J-.135 E.01872
G1 X151.565 Y116.468 E.17647
G1 X151.565 Y115.934 E.01642
G1 X142.066 Y106.435 E.41319
G1 X142.6 Y106.435 E.01642
G1 X151.565 Y115.4 E.38997
G1 X151.565 Y114.866 E.01642
G1 X143.134 Y106.435 E.36675
G1 X143.667 Y106.435 E.01642
G1 X151.565 Y114.333 E.34353
G1 X151.565 Y113.799 E.01642
G1 X144.201 Y106.435 E.3203
G1 X144.735 Y106.435 E.01642
G1 X151.565 Y113.265 E.29708
G1 X151.565 Y112.731 E.01642
G1 X145.269 Y106.435 E.27386
G1 X145.803 Y106.435 E.01642
G1 X151.565 Y112.197 E.25064
G1 X151.565 Y111.663 E.01642
G1 X146.337 Y106.435 E.22742
G1 X146.87 Y106.435 E.01642
G1 X151.565 Y111.13 E.2042
G1 X151.565 Y110.596 E.01642
G1 X147.404 Y106.435 E.18098
G1 X147.938 Y106.435 E.01642
G1 X151.565 Y110.062 E.15776
G1 X151.565 Y109.528 E.01642
G1 X148.472 Y106.435 E.13454
G1 X149.006 Y106.435 E.01642
G1 X151.565 Y108.994 E.11132
G1 X151.565 Y108.461 E.01642
G1 X149.539 Y106.435 E.08809
G1 X150.073 Y106.435 E.01642
G1 X151.565 Y107.927 E.06487
G1 X151.565 Y107.393 E.01642
G1 X150.607 Y106.435 E.04165
G1 X151.141 Y106.435 E.01642
G1 X151.734 Y107.029 E.02581
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X151.141 Y106.435 E-.3189
G1 X150.607 Y106.435 E-.20285
G1 X151.05 Y106.879 E-.23825
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
G3 Z1 I-1.057 J-.603 P1  F30000
G1 X141.369 Y123.852 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10080
G1 X141.371 Y123.861 E.00032
G3 X129.698 Y115.901 I-11.371 J4.137 E2.02156
G1 X130.302 Y115.901 E.02002
G3 X141.151 Y123.299 I-.302 J12.097 E.46042
G1 X141.347 Y123.796 E.01771
G1 X141.003 Y123.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10080
G3 X129.708 Y116.294 I-11.003 J4.003 E1.81189
G1 X130.292 Y116.294 E.01794
G3 X140.982 Y123.939 I-.292 J11.705 E.42877
M204 S10000
; WIPE_START
G1 F24000
G1 X141.19 Y124.548 E-.24465
G1 X141.348 Y125.11 E-.22188
G1 X141.478 Y125.68 E-.22186
G1 X141.511 Y125.865 E-.07161
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.45 J-1.131 P1  F30000
G1 X113.624 Y114.78 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10080
G1 X113.597 Y114.759 E.00112
G3 X114.72 Y110.765 I1.403 J-1.761 E.17507
G1 X114.944 Y110.748 E.00745
G3 X113.973 Y115.002 I.056 J2.251 E.27184
G1 X113.674 Y114.812 E.01176
G1 X113.841 Y114.453 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10080
G3 X114.769 Y111.154 I1.159 J-1.454 E.13391
G1 X114.954 Y111.14 E.0057
G3 X113.889 Y114.489 I.046 J1.859 E.21748
M204 S10000
; WIPE_START
G1 F24000
G1 X113.575 Y114.196 E-.16334
G1 X113.366 Y113.89 E-.14077
G1 X113.222 Y113.548 E-.14077
G1 X113.149 Y113.187 E-.14015
G1 X113.142 Y112.907 E-.1064
G1 X113.169 Y112.728 E-.06858
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.207 J.158 P1  F30000
G1 X116.992 Y141.954 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10080
G1 X117.152 Y142.336 E.01375
G3 X114.72 Y140.765 I-2.152 J.662 E.36493
G1 X114.944 Y140.748 E.00745
G3 X116.965 Y141.9 I.056 J2.251 E.08111
G1 X116.558 Y141.999 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10080
G1 X116.633 Y142.111 E.00415
G3 X114.769 Y141.154 I-1.633 J.888 E.29053
G1 X114.954 Y141.14 E.0057
G3 X116.425 Y141.805 I.046 J1.859 E.0513
G1 X116.524 Y141.949 E.00539
M204 S10000
; WIPE_START
G1 F24000
G1 X116.633 Y142.111 E-.07407
G1 X116.778 Y142.452 E-.14074
G1 X116.851 Y142.813 E-.14016
G1 X116.858 Y143.093 E-.1064
M73 P64 R4
G1 X116.803 Y143.459 E-.14063
G1 X116.676 Y143.807 E-.14078
G1 X116.652 Y143.846 E-.01723
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.071 J1.215 P1  F30000
G1 X142.86 Y142.305 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10080
G1 X143.022 Y141.923 E.01376
G3 X144.72 Y140.765 I1.978 J1.076 E.0708
G1 X144.944 Y140.748 E.00745
G3 X142.841 Y142.361 I.056 J2.251 E.37524
G1 X143.22 Y142.464 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10080
G1 X143.223 Y142.452 E.00037
G3 X144.769 Y141.154 I1.777 J.547 E.06555
G1 X144.954 Y141.14 E.0057
G3 X143.15 Y142.815 I.046 J1.859 E.27628
G1 X143.208 Y142.522 E.00916
M204 S10000
; WIPE_START
G1 F24000
G1 X143.223 Y142.452 E-.02738
G1 X143.366 Y142.11 E-.14074
G1 X143.575 Y141.804 E-.14077
G1 X143.838 Y141.547 E-.13977
G1 X144.07 Y141.389 E-.10664
G1 X144.408 Y141.237 E-.14077
G1 X144.572 Y141.199 E-.06393
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.216 J-.058 P1  F30000
G1 X143.298 Y114.472 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10080
G1 X143.275 Y114.447 E.00112
G3 X144.721 Y110.765 I1.725 J-1.448 E.16022
G1 X144.944 Y110.748 E.00742
G3 X143.596 Y114.76 I.057 J2.251 E.28688
G1 X143.342 Y114.513 E.01176
G1 X143.576 Y114.195 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10080
G3 X144.769 Y111.154 I1.425 J-1.196 E.12255
G1 X144.954 Y111.14 E.00569
G3 X143.615 Y114.241 I.047 J1.859 E.22899
M204 S10000
; WIPE_START
G1 F24000
G1 X143.366 Y113.89 E-.16337
G1 X143.222 Y113.548 E-.14076
G1 X143.149 Y113.185 E-.14077
G1 X143.149 Y112.815 E-.14077
G1 X143.222 Y112.452 E-.14077
G1 X143.257 Y112.37 E-.03355
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.186 J.273 P1  F30000
G1 X151.898 Y149.898 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10080
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10080
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.071 J-.578 P1  F30000
G1 X149.921 Y149.55 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10080
G1 X151.55 Y149.55 E.05401
G1 X146.831 Y144.831 E.22134
G3 X143.554 Y145.149 I-1.826 J-1.774 E.11876
G1 X139.154 Y149.55 E.20642
G1 X136.198 Y149.55 E.09807
G1 X126.635 Y139.987 E.4486
G3 X125.917 Y139.759 I6.966 J-23.219 E.02501
G1 X116.126 Y149.55 E.45928
G1 X113.17 Y149.55 E.09807
G1 X108.45 Y144.83 E.2214
G1 X108.45 Y141.874 E.09807
G1 X118.241 Y132.083 E.45931
G3 X118.018 Y131.37 I7.028 J-2.591 E.02478
G1 X108.45 Y121.802 E.44885
G1 X108.45 Y118.846 E.09807
G1 X112.851 Y114.445 E.20644
G3 X113.167 Y111.167 I2.096 J-1.452 E.11876
G1 X108.45 Y106.45 E.22129
G1 X110.079 Y106.45 E.05401
G1 X108.45 Y131.107 F30000
G1 F10080
G1 X108.45 Y129.478 E.05401
G1 X128.522 Y149.55 E.94159
G1 X131.478 Y149.55 E.09807
G1 X151.55 Y129.478 E.94159
G1 X151.55 Y126.522 E.09807
G1 X131.478 Y106.45 E.94159
G1 X128.522 Y106.45 E.09807
G1 X108.45 Y126.522 E.94159
G1 X108.45 Y124.893 E.05401
G1 X120.124 Y120.421 F30000
G1 F10080
G3 X121.198 Y119.198 I10.442 J8.089 E.05401
G1 X116.833 Y114.833 E.20479
G2 X116.446 Y110.851 I-1.912 J-1.824 E.15055
G1 X120.846 Y106.45 E.20642
G1 X123.802 Y106.45 E.09807
G1 X133.365 Y116.013 E.4486
G3 X134.083 Y116.241 I-6.967 J23.224 E.02501
G1 X143.874 Y106.45 E.45928
G1 X146.83 Y106.45 E.09807
G1 X151.55 Y111.17 E.2214
G1 X151.55 Y114.126 E.09807
G1 X141.759 Y123.917 E.45931
G3 X141.982 Y124.63 I-7.029 J2.591 E.02478
G1 X151.55 Y134.198 E.44885
G1 X151.55 Y137.154 E.09807
G1 X147.149 Y141.555 E.20644
G2 X143.168 Y141.168 I-2.146 J1.409 E.15209
G1 X138.802 Y136.802 E.20484
G2 X139.876 Y135.579 I-9.369 J-9.312 E.05401
; WIPE_START
G1 F24000
G1 X138.802 Y136.802 E-.61829
G1 X139.066 Y137.066 E-.14171
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.216 J.059 P1  F30000
G1 X139.876 Y120.421 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F10080
G2 X138.802 Y119.198 I-10.443 J8.09 E.05401
G1 X143.169 Y114.831 E.20485
G2 X147.157 Y114.453 I1.839 J-1.825 E.15192
G1 X151.55 Y118.846 E.20607
G1 X151.55 Y121.802 E.09807
G1 X141.982 Y131.37 E.44885
G3 X141.759 Y132.083 I-7.253 J-1.879 E.02478
G1 X151.55 Y141.874 E.45931
G1 X151.55 Y144.83 E.09807
G1 X146.83 Y149.55 E.2214
G1 X143.874 Y149.55 E.09807
G1 X134.083 Y139.759 E.45928
G3 X133.365 Y139.987 I-7.684 J-22.991 E.02501
G1 X123.802 Y149.55 E.4486
G1 X120.846 Y149.55 E.09807
G1 X116.446 Y145.15 E.20639
G3 X113.169 Y144.831 I-1.451 J-2.093 E.11878
G1 X108.45 Y149.55 E.22134
G1 X110.079 Y149.55 E.05401
; WIPE_START
G1 F24000
G1 X108.45 Y149.55 E-.61876
G1 X108.713 Y149.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.011 J.677 P1  F30000
G1 X114.705 Y140.333 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499014
G1 F10080
G1 X114.869 Y140.33 E.00608
G1 X120.124 Y135.579 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10080
G2 X121.198 Y136.802 I10.443 J-8.09 E.05401
G1 X116.831 Y141.169 E.20485
G2 X115.416 Y140.443 I-1.657 J1.492 E.05395
M73 P65 R4
G1 X115.41 Y140.189 E.00844
G1 X115.097 Y139.892 E.0143
G1 X114.263 Y139.913 E.02768
G1 X114.278 Y140.508 E.01976
G2 X112.849 Y141.553 I.759 J2.537 E.05986
G1 X108.45 Y137.154 E.20635
G1 X108.45 Y134.198 E.09807
G1 X118.018 Y124.63 E.44885
G3 X118.241 Y123.917 I7.251 J1.878 E.02478
G1 X108.45 Y114.126 E.45931
G1 X108.45 Y111.17 E.09807
G1 X113.17 Y106.45 E.2214
G1 X116.126 Y106.45 E.09807
G1 X125.917 Y116.241 E.45928
G3 X126.635 Y116.013 I7.685 J22.994 E.02501
G1 X136.198 Y106.45 E.4486
G1 X139.154 Y106.45 E.09807
G1 X143.554 Y110.851 E.20642
G3 X146.831 Y111.169 I1.451 J2.091 E.11877
G1 X151.55 Y106.45 E.22134
G1 X149.921 Y106.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X151.55 Y106.45 E-.61876
G1 X151.287 Y106.713 E-.14124
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
G3 Z1.2 I-1.053 J-.61 P1  F30000
G1 X141.369 Y123.852 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F10019
G1 X141.371 Y123.861 E.00032
G3 X129.698 Y115.901 I-11.371 J4.137 E2.02156
G1 X130.302 Y115.901 E.02002
G3 X141.151 Y123.299 I-.302 J12.097 E.46042
G1 X141.347 Y123.796 E.01771
G1 X141.003 Y123.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10019
G3 X129.708 Y116.294 I-11.003 J4.003 E1.81189
G1 X130.292 Y116.294 E.01794
G3 X140.982 Y123.939 I-.292 J11.705 E.42877
M204 S10000
; WIPE_START
G1 F24000
G1 X141.19 Y124.548 E-.24464
G1 X141.348 Y125.11 E-.22189
G1 X141.478 Y125.68 E-.22186
G1 X141.511 Y125.865 E-.07161
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.45 J-1.131 P1  F30000
G1 X113.624 Y114.78 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10019
G1 X113.597 Y114.759 E.00112
G3 X114.72 Y110.765 I1.403 J-1.761 E.17507
G1 X114.944 Y110.748 E.00745
G3 X113.973 Y115.002 I.056 J2.251 E.27184
G1 X113.674 Y114.812 E.01176
G1 X113.841 Y114.453 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10019
G3 X114.769 Y111.154 I1.159 J-1.454 E.13391
G1 X114.954 Y111.14 E.0057
G3 X113.889 Y114.489 I.046 J1.859 E.21748
M204 S10000
; WIPE_START
G1 F24000
G1 X113.575 Y114.196 E-.16333
G1 X113.366 Y113.89 E-.14076
G1 X113.222 Y113.548 E-.14078
G1 X113.149 Y113.185 E-.14077
G1 X113.149 Y112.816 E-.14023
G1 X113.164 Y112.728 E-.03413
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.207 J.158 P1  F30000
G1 X116.992 Y141.954 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10019
G1 X117.152 Y142.336 E.01376
G3 X114.72 Y140.765 I-2.152 J.662 E.36493
G1 X114.944 Y140.748 E.00745
G3 X116.965 Y141.9 I.056 J2.251 E.08111
G1 X116.567 Y142.012 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10019
G1 X116.633 Y142.111 E.00365
G3 X114.769 Y141.154 I-1.633 J.888 E.29053
G1 X114.954 Y141.14 E.0057
G3 X116.425 Y141.805 I.046 J1.859 E.0513
G1 X116.533 Y141.963 E.00589
M204 S10000
; WIPE_START
G1 F24000
G1 X116.633 Y142.111 E-.06793
G1 X116.778 Y142.452 E-.14075
G1 X116.851 Y142.815 E-.14077
G1 X116.851 Y143.185 E-.14077
G1 X116.778 Y143.547 E-.14023
G1 X116.676 Y143.808 E-.10636
G1 X116.644 Y143.86 E-.02319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.069 J1.215 P1  F30000
G1 X142.841 Y142.369 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10019
G1 X142.848 Y142.336 E.00112
G3 X144.72 Y140.765 I2.152 J.662 E.0857
G1 X144.944 Y140.748 E.00745
G3 X142.76 Y142.776 I.056 J2.251 E.3612
G1 X142.829 Y142.428 E.01177
G1 X143.218 Y142.471 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10019
G1 X143.223 Y142.452 E.00061
G3 X144.769 Y141.154 I1.777 J.547 E.06555
G1 X144.954 Y141.14 E.0057
G3 X143.15 Y142.815 I.046 J1.859 E.27628
G1 X143.207 Y142.53 E.00893
M204 S10000
; WIPE_START
G1 F24000
G1 X143.223 Y142.452 E-.0303
G1 X143.366 Y142.11 E-.14073
G1 X143.575 Y141.804 E-.14077
G1 X143.84 Y141.546 E-.14077
G1 X144.15 Y141.345 E-.14024
G1 X144.408 Y141.236 E-.10636
G1 X144.564 Y141.201 E-.06083
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.216 J-.058 P1  F30000
G1 X143.298 Y114.472 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10019
G1 X143.276 Y114.446 E.00112
G3 X144.721 Y110.765 I1.724 J-1.448 E.16019
G1 X144.944 Y110.748 E.00741
G3 X143.597 Y114.759 I.057 J2.251 E.28677
G1 X143.342 Y114.513 E.01176
G1 X143.577 Y114.194 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10019
G3 X144.769 Y111.154 I1.424 J-1.196 E.12252
G1 X144.954 Y111.14 E.00568
G3 X143.616 Y114.24 I.047 J1.859 E.22888
M204 S10000
; WIPE_START
G1 F24000
G1 X143.366 Y113.89 E-.16333
G1 X143.222 Y113.548 E-.14078
G1 X143.149 Y113.185 E-.14077
G1 X143.149 Y112.815 E-.14077
G1 X143.222 Y112.452 E-.14077
G1 X143.257 Y112.37 E-.03359
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.186 J.273 P1  F30000
G1 X151.898 Y149.898 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10019
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10019
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.071 J-.578 P1  F30000
G1 X149.921 Y149.55 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10019
G1 X151.55 Y149.55 E.05401
G1 X146.831 Y144.831 E.22134
G3 X143.554 Y145.149 I-1.826 J-1.774 E.11876
G1 X139.154 Y149.55 E.20642
G1 X136.198 Y149.55 E.09807
G1 X126.635 Y139.987 E.4486
G3 X125.917 Y139.759 I6.966 J-23.219 E.02501
G1 X116.126 Y149.55 E.45928
G1 X113.17 Y149.55 E.09807
G1 X108.45 Y144.83 E.2214
G1 X108.45 Y141.874 E.09807
G1 X118.241 Y132.083 E.45931
G3 X118.018 Y131.37 I7.028 J-2.591 E.02478
G1 X108.45 Y121.802 E.44885
G1 X108.45 Y118.846 E.09807
G1 X112.851 Y114.445 E.20644
G3 X113.167 Y111.167 I2.278 J-1.434 E.11754
G1 X108.45 Y106.45 E.22129
G1 X110.079 Y106.45 E.05401
G1 X149.921 Y106.45 F30000
G1 F10019
G1 X151.55 Y106.45 E.05401
G1 X146.831 Y111.169 E.22134
G2 X143.554 Y110.851 I-1.826 J1.774 E.11877
G1 X139.154 Y106.45 E.20642
G1 X136.198 Y106.45 E.09807
G1 X126.635 Y116.013 E.4486
G2 X125.917 Y116.241 I6.966 J23.221 E.02501
G1 X116.126 Y106.45 E.45928
G1 X113.17 Y106.45 E.09807
G1 X108.45 Y111.17 E.2214
G1 X108.45 Y114.126 E.09807
G1 X118.241 Y123.917 E.45931
G2 X118.018 Y124.63 I7.028 J2.591 E.02478
G1 X108.45 Y134.198 E.44885
G1 X108.45 Y137.154 E.09807
G1 X112.849 Y141.553 E.20635
G3 X116.831 Y141.169 I2.146 J1.414 E.15209
G1 X121.198 Y136.802 E.20485
G3 X120.124 Y135.579 I9.369 J-9.312 E.05401
G1 X108.45 Y131.107 F30000
M73 P66 R4
G1 F10019
G1 X108.45 Y129.478 E.05401
G1 X128.522 Y149.55 E.94159
G1 X131.478 Y149.55 E.09807
G1 X151.55 Y129.478 E.94159
G1 X151.55 Y126.522 E.09807
G1 X131.478 Y106.45 E.94159
G1 X128.522 Y106.45 E.09807
G1 X108.45 Y126.522 E.94159
G1 X108.45 Y124.893 E.05401
G1 X120.124 Y120.421 F30000
G1 F10019
G3 X121.198 Y119.198 I12.544 J9.935 E.054
G1 X116.835 Y114.835 E.2047
G2 X116.446 Y110.851 I-1.807 J-1.835 E.15211
G1 X120.846 Y106.45 E.20642
G1 X123.802 Y106.45 E.09807
G1 X133.365 Y116.013 E.4486
G3 X134.083 Y116.241 I-6.964 J23.212 E.02501
G1 X143.874 Y106.45 E.45928
G1 X146.83 Y106.45 E.09807
G1 X151.55 Y111.17 E.2214
G1 X151.55 Y114.126 E.09807
G1 X141.759 Y123.917 E.45931
G3 X141.982 Y124.63 I-7.029 J2.591 E.02478
G1 X151.55 Y134.198 E.44885
G1 X151.55 Y137.154 E.09807
G1 X147.149 Y141.555 E.20644
G2 X143.169 Y141.169 I-2.146 J1.409 E.15209
G1 X138.802 Y136.802 E.20485
G2 X139.876 Y135.579 I-9.369 J-9.312 E.05401
; WIPE_START
G1 F24000
G1 X138.802 Y136.802 E-.61829
G1 X139.066 Y137.066 E-.14171
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.216 J.059 P1  F30000
G1 X139.876 Y120.421 Z1.4
G1 Z1
G1 E.8 F1800
G1 F10019
G2 X138.802 Y119.198 I-10.443 J8.09 E.05401
G1 X143.169 Y114.831 E.20485
G2 X147.149 Y114.445 I1.824 J-1.908 E.15053
G1 X151.55 Y118.846 E.20644
G1 X151.55 Y121.802 E.09807
G1 X141.982 Y131.37 E.44885
G3 X141.759 Y132.083 I-7.252 J-1.879 E.02478
G1 X151.55 Y141.874 E.45931
G1 X151.55 Y144.83 E.09807
G1 X146.83 Y149.55 E.2214
G1 X143.874 Y149.55 E.09807
G1 X134.083 Y139.759 E.45928
G3 X133.365 Y139.987 I-7.684 J-22.991 E.02501
G1 X123.802 Y149.55 E.4486
G1 X120.846 Y149.55 E.09807
G1 X116.446 Y145.15 E.20639
G3 X113.169 Y144.831 I-1.451 J-2.093 E.11878
G1 X108.45 Y149.55 E.22134
G1 X110.079 Y149.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.45 Y149.55 E-.61876
G1 X108.713 Y149.287 E-.14124
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
G3 Z1.4 I.748 J.96 P1  F30000
G1 X141.369 Y123.852 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F10231
G1 X141.371 Y123.861 E.00032
G3 X129.698 Y115.901 I-11.371 J4.137 E2.02156
G1 X130.302 Y115.901 E.02002
G3 X141.151 Y123.299 I-.302 J12.097 E.46042
G1 X141.347 Y123.796 E.01771
G1 X141.003 Y123.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10231
G3 X129.708 Y116.294 I-11.003 J4.003 E1.81189
G1 X130.292 Y116.294 E.01794
G3 X140.982 Y123.939 I-.292 J11.705 E.42877
M204 S10000
; WIPE_START
G1 F24000
G1 X141.19 Y124.548 E-.24464
G1 X141.348 Y125.11 E-.22188
G1 X141.478 Y125.68 E-.22187
G1 X141.511 Y125.865 E-.0716
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.45 J-1.131 P1  F30000
G1 X113.624 Y114.78 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10231
G1 X113.597 Y114.759 E.00111
G3 X114.72 Y110.765 I1.403 J-1.761 E.17507
G1 X114.944 Y110.748 E.00745
G3 X113.973 Y115.002 I.056 J2.251 E.27184
G1 X113.674 Y114.812 E.01176
G1 X113.841 Y114.453 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10231
G3 X114.769 Y111.154 I1.159 J-1.454 E.13391
G1 X114.954 Y111.14 E.0057
G3 X113.889 Y114.489 I.046 J1.859 E.21748
M204 S10000
; WIPE_START
G1 F24000
G1 X113.575 Y114.196 E-.16334
G1 X113.366 Y113.89 E-.14077
G1 X113.222 Y113.548 E-.14078
G1 X113.149 Y113.186 E-.1403
G1 X113.142 Y112.907 E-.10633
G1 X113.169 Y112.728 E-.06849
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.07 J1.215 P1  F30000
G1 X143.298 Y114.472 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10231
G1 X143.276 Y114.447 E.00111
G3 X144.72 Y110.765 I1.724 J-1.448 E.16018
G1 X144.944 Y110.748 E.00745
G3 X143.597 Y114.759 I.056 J2.251 E.28673
G1 X143.342 Y114.513 E.01176
G1 X143.576 Y114.195 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10231
G3 X144.769 Y111.154 I1.424 J-1.196 E.12252
G1 X144.954 Y111.14 E.0057
G3 X143.616 Y114.24 I.046 J1.859 E.22887
M204 S10000
; WIPE_START
G1 F24000
G1 X143.366 Y113.89 E-.16334
G1 X143.222 Y113.548 E-.14076
G1 X143.149 Y113.186 E-.14031
G1 X143.142 Y112.907 E-.10634
G1 X143.197 Y112.541 E-.14055
G1 X143.259 Y112.371 E-.06871
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.217 J-.017 P1  F30000
G1 X142.828 Y142.412 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10231
G1 X142.971 Y142.023 E.01376
G3 X144.72 Y140.765 I2.029 J.976 E.07452
G1 X144.944 Y140.748 E.00745
G3 X142.811 Y142.47 I.056 J2.251 E.37151
M73 P67 R4
G1 X143.217 Y142.488 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10231
G1 X143.324 Y142.193 E.00965
G3 X144.769 Y141.154 I1.675 J.806 E.057
G1 X144.954 Y141.14 E.0057
G3 X143.197 Y142.545 I.046 J1.859 E.28471
M204 S10000
; WIPE_START
G1 F24000
G1 X143.324 Y142.193 E-.14215
G1 X143.517 Y141.877 E-.14074
G1 X143.769 Y141.605 E-.14077
G1 X144.07 Y141.389 E-.14076
G1 X144.408 Y141.237 E-.14077
G1 X144.548 Y141.205 E-.0548
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.03 J-1.217 P1  F30000
G1 X116.959 Y141.895 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10231
G1 X116.978 Y141.923 E.00112
G3 X114.72 Y140.765 I-1.978 J1.076 E.37983
G1 X114.944 Y140.748 E.00745
G3 X116.725 Y141.552 I.056 J2.251 E.06707
G1 X116.926 Y141.845 E.01177
G1 X116.576 Y142.026 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10231
G1 X116.633 Y142.111 E.00313
G3 X114.769 Y141.154 I-1.633 J.888 E.29053
G1 X114.954 Y141.14 E.0057
G3 X116.425 Y141.805 I.046 J1.859 E.0513
G1 X116.542 Y141.977 E.0064
M204 S10000
; WIPE_START
G1 F24000
G1 X116.633 Y142.111 E-.06153
G1 X116.778 Y142.452 E-.14074
G1 X116.851 Y142.814 E-.14032
G1 X116.858 Y143.093 E-.10633
G1 X116.803 Y143.459 E-.14054
G1 X116.676 Y143.807 E-.14078
G1 X116.635 Y143.874 E-.02976
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.205 J1.2 P1  F30000
G1 X151.898 Y149.898 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10231
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10231
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.071 J-.578 P1  F30000
G1 X149.921 Y149.55 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10231
G1 X151.55 Y149.55 E.05401
G1 X146.833 Y144.833 E.22129
G2 X147.149 Y141.555 I-1.963 J-1.844 E.11754
G1 X151.55 Y137.154 E.20644
G1 X151.55 Y134.198 E.09807
G1 X141.982 Y124.63 E.44885
G2 X141.759 Y123.917 I-7.253 J1.879 E.02478
G1 X151.55 Y114.126 E.45931
G1 X151.55 Y111.17 E.09807
G1 X146.83 Y106.45 E.2214
G1 X143.874 Y106.45 E.09807
G1 X134.083 Y116.241 E.45928
G2 X133.365 Y116.013 I-7.683 J22.986 E.02501
G1 X123.802 Y106.45 E.4486
G1 X120.846 Y106.45 E.09807
G1 X116.446 Y110.851 E.20642
G3 X116.833 Y114.833 I-1.525 J2.158 E.15054
G1 X121.198 Y119.198 E.20479
G2 X120.124 Y120.421 I9.369 J9.312 E.05401
G1 X108.45 Y124.893 F30000
G1 F10231
G1 X108.45 Y126.522 E.05401
G1 X128.522 Y106.45 E.94159
G1 X131.478 Y106.45 E.09807
G1 X151.55 Y126.522 E.94159
G1 X151.55 Y129.478 E.09807
G1 X131.478 Y149.55 E.94159
G1 X128.522 Y149.55 E.09807
G1 X108.45 Y129.478 E.94159
G1 X108.45 Y131.107 E.05401
G1 X120.124 Y135.579 F30000
G1 F10231
G2 X121.198 Y136.802 I10.442 J-8.089 E.05401
G1 X116.831 Y141.169 E.20485
G2 X112.849 Y141.553 I-1.836 J1.799 E.15209
G1 X108.45 Y137.154 E.20635
G1 X108.45 Y134.198 E.09807
G1 X118.018 Y124.63 E.44885
G3 X118.241 Y123.917 I7.252 J1.879 E.02478
G1 X108.45 Y114.126 E.45931
G1 X108.45 Y111.17 E.09807
G1 X113.17 Y106.45 E.2214
G1 X116.126 Y106.45 E.09807
G1 X125.917 Y116.241 E.45928
G3 X126.635 Y116.013 I7.685 J22.994 E.02501
G1 X136.198 Y106.45 E.4486
G1 X139.154 Y106.45 E.09807
G1 X143.554 Y110.85 E.20639
G3 X146.831 Y111.169 I1.451 J2.093 E.11878
G1 X151.55 Y106.45 E.22134
G1 X149.921 Y106.45 E.05401
; WIPE_START
G1 F24000
G1 X151.55 Y106.45 E-.61876
G1 X151.287 Y106.713 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.935 J-.779 P1  F30000
G1 X139.876 Y120.421 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F10231
G2 X138.802 Y119.198 I-10.443 J8.09 E.05401
G1 X143.169 Y114.831 E.20485
G2 X147.151 Y114.447 I1.836 J-1.799 E.15209
G1 X151.55 Y118.846 E.20635
G1 X151.55 Y121.802 E.09807
G1 X141.982 Y131.37 E.44885
G3 X141.759 Y132.083 I-7.253 J-1.879 E.02478
G1 X151.55 Y141.874 E.45931
G1 X151.55 Y144.83 E.09807
G1 X146.83 Y149.55 E.2214
G1 X143.874 Y149.55 E.09807
G1 X134.083 Y139.759 E.45928
G3 X133.365 Y139.987 I-7.684 J-22.991 E.02501
G1 X123.802 Y149.55 E.4486
G1 X120.846 Y149.55 E.09807
G1 X116.446 Y145.15 E.20639
G3 X113.169 Y144.831 I-1.451 J-2.093 E.11878
G1 X108.45 Y149.55 E.22134
G1 X110.079 Y149.55 E.05401
; WIPE_START
G1 F24000
G1 X108.45 Y149.55 E-.61876
G1 X108.713 Y149.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.826 J.894 P1  F30000
G1 X117.181 Y141.457 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.502342
G1 F10231
G1 X117.283 Y141.604 E.00668
; WIPE_START
G1 F24000
G1 X117.181 Y141.457 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.305 J1.178 P1  F30000
G1 X139.876 Y135.579 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10231
G3 X138.802 Y136.802 I-10.443 J-8.09 E.05401
G1 X143.167 Y141.167 E.20479
G2 X143.554 Y145.149 I1.912 J1.824 E.15054
G1 X139.154 Y149.55 E.20642
G1 X136.198 Y149.55 E.09807
G1 X126.635 Y139.987 E.4486
G3 X125.917 Y139.759 I6.966 J-23.219 E.02501
G1 X116.126 Y149.55 E.45928
G1 X113.17 Y149.55 E.09807
G1 X108.45 Y144.83 E.2214
G1 X108.45 Y141.874 E.09807
G1 X118.241 Y132.083 E.45931
G3 X118.018 Y131.37 I7.029 J-2.591 E.02478
G1 X108.45 Y121.802 E.44885
M73 P68 R4
G1 X108.45 Y118.846 E.09807
G1 X112.851 Y114.445 E.20644
G3 X113.167 Y111.167 I2.28 J-1.434 E.11754
G1 X108.45 Y106.45 E.22129
G1 X110.079 Y106.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.45 Y106.45 E-.61876
G1 X108.713 Y106.713 E-.14124
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
G3 Z1.6 I-.566 J1.078 P1  F30000
G1 X141.369 Y123.852 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F10140
G1 X141.371 Y123.861 E.00032
G3 X129.698 Y115.901 I-11.371 J4.137 E2.02156
G1 X130.302 Y115.901 E.02002
G3 X141.151 Y123.299 I-.302 J12.097 E.46042
G1 X141.347 Y123.796 E.01771
G1 X141.003 Y123.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10140
G3 X129.708 Y116.294 I-11.003 J4.003 E1.81189
G1 X130.292 Y116.294 E.01794
G3 X140.982 Y123.939 I-.292 J11.705 E.42877
M204 S10000
; WIPE_START
G1 F24000
G1 X141.19 Y124.548 E-.24464
G1 X141.348 Y125.11 E-.22189
G1 X141.478 Y125.68 E-.22186
G1 X141.511 Y125.865 E-.07161
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.45 J-1.131 P1  F30000
G1 X113.624 Y114.78 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10140
G1 X113.597 Y114.759 E.00111
G3 X114.72 Y110.765 I1.403 J-1.761 E.17507
G1 X114.944 Y110.748 E.00745
G3 X113.973 Y115.002 I.056 J2.251 E.27184
G1 X113.674 Y114.812 E.01177
G1 X113.841 Y114.453 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10140
G3 X114.769 Y111.154 I1.159 J-1.454 E.13391
G1 X114.954 Y111.14 E.0057
G3 X113.889 Y114.489 I.046 J1.859 E.21748
M204 S10000
; WIPE_START
G1 F24000
G1 X113.575 Y114.196 E-.16333
G1 X113.366 Y113.89 E-.14077
G1 X113.222 Y113.548 E-.14078
G1 X113.149 Y113.186 E-.14037
G1 X113.142 Y112.907 E-.10632
G1 X113.169 Y112.728 E-.06843
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.07 J1.215 P1  F30000
G1 X143.298 Y114.472 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10140
G1 X143.276 Y114.447 E.00111
G3 X144.72 Y110.765 I1.724 J-1.448 E.16018
G1 X144.944 Y110.748 E.00745
G3 X143.597 Y114.759 I.056 J2.251 E.28673
G1 X143.342 Y114.513 E.01177
G1 X143.576 Y114.195 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10140
G3 X144.769 Y111.154 I1.424 J-1.196 E.12252
G1 X144.954 Y111.14 E.0057
G3 X143.616 Y114.24 I.046 J1.859 E.22887
M204 S10000
; WIPE_START
G1 F24000
G1 X143.366 Y113.89 E-.16334
G1 X143.222 Y113.548 E-.14077
G1 X143.149 Y113.186 E-.14037
G1 X143.142 Y112.907 E-.10632
G1 X143.197 Y112.541 E-.14049
G1 X143.259 Y112.371 E-.0687
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.217 J-.017 P1  F30000
G1 X142.828 Y142.412 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10140
G1 X142.971 Y142.023 E.01376
G3 X144.72 Y140.765 I2.029 J.976 E.07452
G1 X144.944 Y140.748 E.00745
G3 X142.811 Y142.47 I.056 J2.251 E.37151
G1 X143.214 Y142.495 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10140
G1 X143.324 Y142.193 E.00989
G3 X144.769 Y141.154 I1.675 J.806 E.057
G1 X144.954 Y141.14 E.0057
G3 X143.195 Y142.552 I.046 J1.859 E.28447
M204 S10000
; WIPE_START
G1 F24000
G1 X143.324 Y142.193 E-.14509
G1 X143.517 Y141.877 E-.14074
G1 X143.769 Y141.605 E-.14077
G1 X144.07 Y141.389 E-.14077
G1 X144.408 Y141.237 E-.14077
G1 X144.541 Y141.206 E-.05186
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.033 J-1.217 P1  F30000
G1 X116.992 Y141.954 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10140
G1 X117.152 Y142.336 E.01376
G3 X114.72 Y140.765 I-2.152 J.662 E.36493
G1 X114.944 Y140.748 E.00745
G3 X116.965 Y141.9 I.056 J2.251 E.0811
G1 X116.586 Y142.04 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10140
G1 X116.633 Y142.111 E.0026
G3 X114.769 Y141.154 I-1.633 J.888 E.29053
G1 X114.954 Y141.14 E.0057
G3 X116.425 Y141.805 I.046 J1.859 E.0513
G1 X116.552 Y141.991 E.00694
M204 S10000
; WIPE_START
G1 F24000
G1 X116.633 Y142.111 E-.05495
G1 X116.778 Y142.452 E-.14074
G1 X116.851 Y142.814 E-.14038
G1 X116.858 Y143.093 E-.10632
G1 X116.803 Y143.459 E-.14049
G1 X116.676 Y143.807 E-.14078
G1 X116.626 Y143.889 E-.03634
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.204 J1.2 P1  F30000
G1 X151.898 Y149.898 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10140
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10140
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.071 J-.578 P1  F30000
G1 X149.921 Y149.55 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10140
G1 X151.55 Y149.55 E.05401
G1 X146.833 Y144.833 E.22129
G2 X147.149 Y141.555 I-1.963 J-1.844 E.11754
G1 X151.55 Y137.154 E.20644
G1 X151.55 Y134.198 E.09807
G1 X141.982 Y124.63 E.44885
G2 X141.759 Y123.917 I-7.253 J1.879 E.02478
G1 X151.55 Y114.126 E.45931
G1 X151.55 Y111.17 E.09807
G1 X146.83 Y106.45 E.2214
G1 X143.874 Y106.45 E.09807
G1 X134.083 Y116.241 E.45928
G2 X133.365 Y116.013 I-7.683 J22.986 E.02501
G1 X123.802 Y106.45 E.4486
G1 X120.846 Y106.45 E.09807
G1 X116.446 Y110.851 E.20642
G3 X116.833 Y114.833 I-1.526 J2.158 E.15054
G1 X121.202 Y119.202 E.20499
G2 X120.124 Y120.421 I10.325 J10.223 E.054
G1 X108.45 Y124.893 F30000
G1 F10140
G1 X108.45 Y126.522 E.05401
G1 X128.522 Y106.45 E.94159
G1 X131.478 Y106.45 E.09807
G1 X151.55 Y126.522 E.94159
G1 X151.55 Y129.478 E.09807
G1 X131.478 Y149.55 E.94159
G1 X128.522 Y149.55 E.09807
G1 X108.45 Y129.478 E.94159
G1 X108.45 Y131.107 E.05401
G1 X120.124 Y135.579 F30000
G1 F10140
G2 X121.198 Y136.802 I10.443 J-8.09 E.05401
G1 X116.831 Y141.169 E.20485
G2 X112.849 Y141.553 I-1.836 J1.799 E.15209
G1 X108.45 Y137.154 E.20635
G1 X108.45 Y134.198 E.09807
G1 X118.018 Y124.63 E.44885
G3 X118.241 Y123.917 I7.251 J1.878 E.02478
G1 X108.45 Y114.126 E.45931
G1 X108.45 Y111.17 E.09807
G1 X113.17 Y106.45 E.2214
G1 X116.126 Y106.45 E.09807
M73 P69 R4
G1 X125.917 Y116.241 E.45928
G3 X126.635 Y116.013 I7.685 J22.994 E.02501
G1 X136.198 Y106.45 E.4486
G1 X139.154 Y106.45 E.09807
G1 X143.554 Y110.85 E.20639
G2 X143.169 Y114.831 I1.525 J2.157 E.15052
G1 X138.802 Y119.198 E.20485
G3 X139.876 Y120.421 I-9.369 J9.312 E.05401
; WIPE_START
G1 F24000
G1 X138.802 Y119.198 E-.61829
G1 X139.066 Y118.934 E-.14171
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.03 J.649 P1  F30000
G1 X144.47 Y110.359 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.538184
G1 F10140
G1 X144.709 Y110.337 E.00972
G1 X149.921 Y106.45 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10140
G1 X151.55 Y106.45 E.05401
G1 X146.831 Y111.169 E.22134
G3 X147.151 Y114.447 I-1.963 J1.846 E.11756
G1 X151.55 Y118.846 E.20635
G1 X151.55 Y121.802 E.09807
G1 X141.982 Y131.37 E.44885
G3 X141.759 Y132.083 I-7.253 J-1.879 E.02478
G1 X151.55 Y141.874 E.45931
G1 X151.55 Y144.83 E.09807
G1 X146.83 Y149.55 E.2214
G1 X143.874 Y149.55 E.09807
G1 X134.083 Y139.759 E.45928
G3 X133.365 Y139.987 I-7.684 J-22.991 E.02501
G1 X123.802 Y149.55 E.4486
G1 X120.846 Y149.55 E.09807
G1 X116.446 Y145.15 E.20639
G3 X113.169 Y144.831 I-1.451 J-2.093 E.11878
G1 X108.45 Y149.55 E.22134
G1 X110.079 Y149.55 E.05401
; WIPE_START
G1 F24000
G1 X108.45 Y149.55 E-.61876
G1 X108.713 Y149.287 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.49 J1.114 P1  F30000
G1 X139.876 Y135.579 Z1.8
G1 Z1.4
G1 E.8 F1800
G1 F10140
G3 X138.802 Y136.802 I-10.443 J-8.09 E.05401
G1 X143.167 Y141.167 E.20479
G2 X143.554 Y145.149 I1.913 J1.824 E.15054
G1 X139.154 Y149.55 E.20642
G1 X136.198 Y149.55 E.09807
G1 X126.635 Y139.987 E.4486
G3 X125.917 Y139.759 I6.966 J-23.219 E.02501
G1 X116.126 Y149.55 E.45928
G1 X113.17 Y149.55 E.09807
G1 X108.45 Y144.83 E.2214
G1 X108.45 Y141.874 E.09807
G1 X118.241 Y132.083 E.45931
G3 X118.018 Y131.37 I7.029 J-2.591 E.02478
G1 X108.45 Y121.802 E.44885
G1 X108.45 Y118.846 E.09807
G1 X112.851 Y114.445 E.20644
G3 X113.167 Y111.167 I2.279 J-1.434 E.11754
G1 X108.45 Y106.45 E.22129
G1 X110.079 Y106.45 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.45 Y106.45 E-.61876
G1 X108.713 Y106.713 E-.14124
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
G3 Z1.8 I-.566 J1.078 P1  F30000
G1 X141.369 Y123.852 Z1.8
G1 Z1.6
M73 P69 R3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F10159
G1 X141.372 Y123.861 E.00031
G3 X129.698 Y115.901 I-11.372 J4.138 E2.0218
G1 X130.302 Y115.901 E.02002
G3 X141.152 Y123.299 I-.302 J12.098 E.46043
G1 X141.347 Y123.796 E.01771
G1 X141.004 Y123.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10159
G3 X129.708 Y116.294 I-11.004 J4.005 E1.81216
G1 X130.292 Y116.294 E.01794
G3 X140.983 Y123.939 I-.292 J11.706 E.42878
M204 S10000
; WIPE_START
G1 F24000
G1 X141.19 Y124.548 E-.24465
G1 X141.348 Y125.11 E-.22189
G1 X141.478 Y125.68 E-.22186
G1 X141.511 Y125.865 E-.0716
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.45 J-1.131 P1  F30000
G1 X113.571 Y114.738 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10159
G1 X113.276 Y114.447 E.01376
G3 X114.72 Y110.765 I1.724 J-1.448 E.16018
G1 X114.944 Y110.748 E.00745
G3 X113.618 Y114.776 I.056 J2.251 E.28586
G1 X113.841 Y114.453 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10159
G3 X114.769 Y111.154 I1.159 J-1.454 E.13391
G1 X114.954 Y111.14 E.0057
G3 X113.889 Y114.489 I.046 J1.859 E.21748
M204 S10000
; WIPE_START
G1 F24000
G1 X113.575 Y114.196 E-.16334
G1 X113.366 Y113.89 E-.14076
G1 X113.222 Y113.548 E-.14078
G1 X113.149 Y113.185 E-.14077
G1 X113.149 Y112.817 E-.13977
G1 X113.165 Y112.728 E-.03459
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.207 J.157 P1  F30000
G1 X116.96 Y141.895 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10159
G1 X116.978 Y141.923 E.00111
G3 X114.72 Y140.765 I-1.978 J1.076 E.37983
G1 X114.944 Y140.748 E.00745
G3 X116.725 Y141.552 I.056 J2.251 E.06707
G1 X116.926 Y141.845 E.01177
G1 X116.596 Y142.055 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10159
G1 X116.633 Y142.111 E.00206
G3 X114.769 Y141.154 I-1.633 J.888 E.29053
G1 X114.954 Y141.14 E.0057
G3 X116.425 Y141.805 I.046 J1.859 E.0513
G1 X116.562 Y142.005 E.00748
M204 S10000
; WIPE_START
G1 F24000
G1 X116.633 Y142.111 E-.04827
G1 X116.778 Y142.452 E-.14075
G1 X116.851 Y142.814 E-.14044
G1 X116.858 Y143.094 E-.10631
G1 X116.803 Y143.459 E-.14043
G1 X116.676 Y143.807 E-.14077
G1 X116.617 Y143.904 E-.04303
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.074 J1.215 P1  F30000
G1 X142.86 Y142.305 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10159
G1 X143.022 Y141.923 E.01376
G3 X144.72 Y140.765 I1.978 J1.076 E.0708
G1 X144.944 Y140.748 E.00745
G3 X142.841 Y142.361 I.056 J2.251 E.37523
G1 X143.214 Y142.495 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10159
G1 X143.223 Y142.452 E.00136
G3 X144.769 Y141.154 I1.777 J.547 E.06555
G1 X144.954 Y141.14 E.0057
G3 X143.15 Y142.815 I.046 J1.859 E.27628
G1 X143.202 Y142.554 E.00817
M204 S10000
; WIPE_START
G1 F24000
G1 X143.223 Y142.452 E-.03966
G1 X143.366 Y142.11 E-.14074
G1 X143.575 Y141.804 E-.14076
G1 X143.84 Y141.546 E-.14078
G1 X144.072 Y141.388 E-.10664
G1 X144.408 Y141.237 E-.13977
G1 X144.54 Y141.206 E-.05165
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.216 J-.058 P1  F30000
G1 X143.255 Y114.42 Z2
M73 P70 R3
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10159
G1 X143.024 Y114.076 E.01375
G3 X144.722 Y110.764 I1.977 J-1.077 E.14531
G1 X144.944 Y110.748 E.00737
G3 X143.294 Y114.466 I.057 J2.251 E.30081
G1 X143.577 Y114.194 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10159
G3 X144.77 Y111.154 I1.424 J-1.196 E.12252
G1 X144.954 Y111.14 E.00567
G3 X143.616 Y114.24 I.047 J1.859 E.22889
M204 S10000
; WIPE_START
G1 F24000
G1 X143.366 Y113.89 E-.16332
G1 X143.222 Y113.548 E-.14077
G1 X143.149 Y113.185 E-.14077
G1 X143.149 Y112.815 E-.14077
G1 X143.222 Y112.452 E-.14077
G1 X143.257 Y112.37 E-.0336
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.186 J.273 P1  F30000
G1 X151.898 Y149.898 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10159
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10159
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.071 J-.578 P1  F30000
G1 X149.921 Y149.55 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10159
G1 X151.55 Y149.55 E.05401
G1 X146.831 Y144.831 E.22134
G3 X143.554 Y145.149 I-1.826 J-1.774 E.11876
G1 X139.154 Y149.55 E.20642
G1 X136.198 Y149.55 E.09807
G1 X126.635 Y139.987 E.4486
G3 X125.917 Y139.759 I6.966 J-23.219 E.02501
G1 X116.126 Y149.55 E.45928
G1 X113.17 Y149.55 E.09807
G1 X108.45 Y144.83 E.2214
G1 X108.45 Y141.874 E.09807
G1 X118.241 Y132.083 E.45931
G3 X118.018 Y131.37 I7.028 J-2.591 E.02478
G1 X108.45 Y121.802 E.44885
G1 X108.45 Y118.846 E.09807
G1 X112.851 Y114.445 E.20644
G3 X113.167 Y111.167 I2.277 J-1.434 E.11755
G1 X108.45 Y106.45 E.22129
G1 X110.079 Y106.45 E.05401
; WIPE_START
G1 F24000
G1 X108.45 Y106.45 E-.61876
G1 X108.713 Y106.713 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.827 J.893 P1  F30000
G1 X139.876 Y135.579 Z2
G1 Z1.6
G1 E.8 F1800
G1 F10159
G3 X138.802 Y136.802 I-10.443 J-8.09 E.05401
G1 X143.169 Y141.169 E.20485
G3 X147.149 Y141.555 I1.835 J1.795 E.15209
G1 X151.55 Y137.154 E.20644
G1 X151.55 Y134.198 E.09807
G1 X141.982 Y124.63 E.44885
G2 X141.759 Y123.917 I-7.253 J1.879 E.02478
G1 X151.55 Y114.126 E.45931
G1 X151.55 Y111.17 E.09807
G1 X146.83 Y106.45 E.2214
G1 X143.874 Y106.45 E.09807
G1 X134.083 Y116.241 E.45928
G2 X133.365 Y116.013 I-7.683 J22.986 E.02501
G1 X123.802 Y106.45 E.4486
G1 X120.846 Y106.45 E.09807
G1 X116.446 Y110.851 E.20642
G3 X116.833 Y114.833 I-1.526 J2.158 E.15054
G1 X121.198 Y119.198 E.20479
G2 X120.124 Y120.421 I9.369 J9.312 E.05401
G1 X108.45 Y124.893 F30000
G1 F10159
G1 X108.45 Y126.522 E.05401
G1 X128.522 Y106.45 E.94159
G1 X131.478 Y106.45 E.09807
G1 X151.55 Y126.522 E.94159
G1 X151.55 Y129.478 E.09807
G1 X131.478 Y149.55 E.94159
G1 X128.522 Y149.55 E.09807
G1 X108.45 Y129.478 E.94159
G1 X108.45 Y131.107 E.05401
G1 X120.124 Y135.579 F30000
G1 F10159
G2 X121.198 Y136.802 I10.443 J-8.09 E.05401
G1 X116.831 Y141.169 E.20485
G3 X116.446 Y145.15 I-1.911 J1.825 E.15053
G1 X120.846 Y149.55 E.20639
G1 X123.802 Y149.55 E.09807
G1 X133.365 Y139.987 E.4486
G2 X134.083 Y139.759 I-6.966 J-23.219 E.02501
G1 X143.874 Y149.55 E.45928
G1 X146.83 Y149.55 E.09807
G1 X151.55 Y144.83 E.2214
G1 X151.55 Y141.874 E.09807
G1 X141.759 Y132.083 E.45931
G2 X141.982 Y131.37 I-7.029 J-2.591 E.02478
G1 X151.55 Y121.802 E.44885
G1 X151.55 Y118.846 E.09807
G1 X147.149 Y114.445 E.20644
G3 X143.169 Y114.831 I-2.157 J-1.523 E.15052
G1 X138.802 Y119.198 E.20485
G3 X139.876 Y120.421 I-9.369 J9.312 E.05401
; WIPE_START
G1 F24000
G1 X138.802 Y119.198 E-.61829
G1 X139.066 Y118.934 E-.14171
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.918 J.799 P1  F30000
G1 X149.921 Y106.45 Z2
G1 Z1.6
G1 E.8 F1800
G1 F10159
G1 X151.55 Y106.45 E.05401
G1 X146.831 Y111.169 E.22134
G2 X143.554 Y110.851 I-1.826 J1.774 E.11876
G1 X139.154 Y106.45 E.20642
G1 X136.198 Y106.45 E.09807
G1 X126.635 Y116.013 E.4486
G2 X125.917 Y116.241 I6.966 J23.221 E.02501
G1 X116.126 Y106.45 E.45928
G1 X113.17 Y106.45 E.09807
G1 X108.45 Y111.17 E.2214
G1 X108.45 Y114.126 E.09807
G1 X118.241 Y123.917 E.45931
G2 X118.018 Y124.63 I7.028 J2.591 E.02478
G1 X108.45 Y134.198 E.44885
G1 X108.45 Y137.154 E.09807
G1 X112.849 Y141.553 E.20635
G2 X113.169 Y144.831 I2.102 J1.45 E.11876
G1 X108.45 Y149.55 E.22134
G1 X110.079 Y149.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.45 Y149.55 E-.61876
G1 X108.713 Y149.287 E-.14124
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
G3 Z2 I.748 J.96 P1  F30000
G1 X141.369 Y123.852 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F13250
G1 X141.371 Y123.861 E.00032
G3 X129.698 Y115.901 I-11.371 J4.137 E2.02156
G1 X130.302 Y115.901 E.02002
M73 P71 R3
G3 X141.151 Y123.299 I-.302 J12.097 E.46042
G1 X141.347 Y123.796 E.01771
G1 X141.003 Y123.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X129.708 Y116.294 I-11.003 J4.003 E1.81189
G1 X130.292 Y116.294 E.01794
G3 X140.982 Y123.939 I-.292 J11.705 E.42877
M204 S10000
; WIPE_START
G1 F24000
G1 X141.19 Y124.548 E-.24464
G1 X141.348 Y125.11 E-.22189
G1 X141.478 Y125.68 E-.22186
G1 X141.511 Y125.865 E-.07161
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.45 J-1.131 P1  F30000
G1 X113.571 Y114.738 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13250
G1 X113.277 Y114.446 E.01376
G3 X114.723 Y110.764 I1.725 J-1.447 E.1602
G1 X114.944 Y110.748 E.00735
G3 X113.618 Y114.775 I.058 J2.251 E.28593
G1 X113.842 Y114.453 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X114.77 Y111.154 I1.159 J-1.454 E.13391
G1 X114.954 Y111.14 E.00567
G3 X113.889 Y114.489 I.047 J1.859 E.2175
M204 S10000
; WIPE_START
G1 F24000
G1 X113.575 Y114.196 E-.16333
G1 X113.366 Y113.89 E-.14076
G1 X113.222 Y113.548 E-.14078
G1 X113.149 Y113.185 E-.14077
G1 X113.149 Y112.815 E-.14077
G1 X113.167 Y112.728 E-.03359
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.07 J1.215 P1  F30000
G1 X143.298 Y114.472 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13250
G1 X143.276 Y114.447 E.00111
G3 X144.72 Y110.765 I1.724 J-1.448 E.16018
G1 X144.944 Y110.748 E.00745
G3 X143.597 Y114.759 I.056 J2.251 E.28673
G1 X143.341 Y114.513 E.01177
G1 X143.576 Y114.195 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X144.769 Y111.154 I1.424 J-1.196 E.12252
G1 X144.954 Y111.14 E.0057
G3 X143.616 Y114.24 I.046 J1.859 E.22887
M204 S10000
; WIPE_START
G1 F24000
G1 X143.366 Y113.89 E-.16334
G1 X143.222 Y113.548 E-.14077
G1 X143.149 Y113.185 E-.14077
G1 X143.149 Y112.815 E-.14077
G1 X143.222 Y112.452 E-.14077
G1 X143.257 Y112.37 E-.03358
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.217 J-.016 P1  F30000
G1 X142.86 Y142.305 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13250
G1 X143.022 Y141.923 E.01376
G3 X144.72 Y140.765 I1.978 J1.076 E.0708
G1 X144.944 Y140.748 E.00745
G3 X142.84 Y142.361 I.056 J2.251 E.37523
G1 X143.212 Y142.503 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.223 Y142.452 E.00162
G3 X144.769 Y141.154 I1.777 J.547 E.06555
G1 X144.954 Y141.14 E.0057
G3 X143.15 Y142.815 I.046 J1.859 E.27628
G1 X143.2 Y142.562 E.00791
M204 S10000
; WIPE_START
G1 F24000
G1 X143.223 Y142.452 E-.04284
G1 X143.366 Y142.11 E-.14074
G1 X143.575 Y141.804 E-.14077
G1 X143.84 Y141.546 E-.14049
G1 X144.071 Y141.388 E-.10632
G1 X144.408 Y141.237 E-.14038
G1 X144.532 Y141.208 E-.04846
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.023 J-1.217 P1  F30000
G1 X116.852 Y141.737 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13250
G1 X116.978 Y141.923 E.00744
G3 X114.72 Y140.765 I-1.978 J1.076 E.37983
G1 X114.944 Y140.748 E.00745
G3 X116.725 Y141.552 I.056 J2.251 E.06707
G1 X116.818 Y141.688 E.00545
G1 X116.595 Y142.059 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.713 Y142.278 E.00763
G3 X114.769 Y141.154 I-1.714 J.721 E.28483
G1 X114.954 Y141.14 E.0057
G3 X116.537 Y141.952 I.046 J1.859 E.057
G1 X116.566 Y142.007 E.00191
M204 S10000
; WIPE_START
G1 F24000
G1 X116.713 Y142.278 E-.11714
G1 X116.823 Y142.631 E-.14073
G1 X116.86 Y143 E-.14078
G1 X116.823 Y143.369 E-.14078
G1 X116.714 Y143.723 E-.14076
G1 X116.614 Y143.907 E-.07981
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.204 J1.2 P1  F30000
G1 X151.898 Y149.898 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13250
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.58 J1.07 P1  F30000
G1 X151.55 Y149.55 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F13250
G1 X108.45 Y149.55 E1.42968
G1 X108.45 Y106.45 E1.42968
G1 X151.55 Y106.45 E1.42968
G1 X151.55 Y149.49 E1.42769
G1 X149.514 Y149.143 F30000
G1 F13250
G1 X151.143 Y149.143 E.05401
G1 X147.121 Y145.121 E.18868
G3 X143.26 Y145.444 I-2.118 J-2.077 E.14004
G1 X139.561 Y149.143 E.17351
G1 X135.791 Y149.143 E.12508
G1 X127.195 Y140.547 E.40325
G3 X125.599 Y140.077 I2.735 J-12.234 E.05523
G1 X116.533 Y149.143 E.42529
G1 X112.763 Y149.143 E.12508
G1 X108.857 Y145.237 E.18321
G1 X108.857 Y141.467 E.12508
G1 X117.92 Y132.404 E.42515
G3 X117.457 Y130.809 I13.934 J-4.912 E.05514
G1 X108.857 Y122.209 E.40341
G1 X108.857 Y118.439 E.12508
G1 X112.558 Y114.738 E.1736
G3 X112.65 Y111.126 I2.408 J-1.746 E.12882
G3 X112.879 Y110.879 I1.943 J1.573 E.01118
G1 X108.857 Y106.857 E.18868
G1 X110.486 Y106.857 E.05401
G1 X115.157 Y110.405 F30000
G1 F13250
G2 X115.705 Y110.494 I-.14 J2.59 E.52223
G1 X115.217 Y110.408 E.01643
; WIPE_START
G1 F24000
G1 X115.705 Y110.494 E-.18826
G1 X116.187 Y110.684 E-.19697
G1 X116.623 Y110.965 E-.19695
G1 X116.958 Y111.292 E-.17781
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.037 J-.637 P1  F30000
G1 X108.857 Y124.486 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F13250
G1 X108.857 Y126.115 E.05401
G1 X128.115 Y106.857 E.9034
G1 X131.885 Y106.857 E.12508
G1 X151.143 Y126.115 E.9034
G1 X151.143 Y129.885 E.12508
G1 X131.885 Y149.143 E.9034
G1 X128.115 Y149.143 E.12508
G1 X108.857 Y129.885 E.9034
G1 X108.857 Y131.514 E.05401
; WIPE_START
G1 F24000
G1 X108.857 Y129.885 E-.61876
G1 X109.12 Y130.148 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
M73 P72 R3
G3 Z2.2 I-.337 J1.169 P1  F30000
G1 X144.736 Y140.416 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F13250
G3 X147.5 Y142.296 I.257 J2.594 E.12037
G1 X147.585 Y142.719 E.0143
G3 X144.676 Y140.417 I-2.584 J.278 E.40474
G1 X137.869 Y138.165 F30000
G1 F13250
G2 X139.09 Y137.09 I-16.303 J-19.749 E.05398
G1 X142.879 Y140.879 E.17778
G3 X147.442 Y141.262 I2.123 J2.085 E.1733
G1 X151.143 Y137.561 E.1736
G1 X151.143 Y133.791 E.12508
G1 X142.543 Y125.191 E.40341
G2 X142.08 Y123.596 I-28.379 J7.379 E.05512
G1 X151.143 Y114.533 E.42515
G1 X151.143 Y110.763 E.12508
G1 X147.237 Y106.857 E.18321
G1 X143.467 Y106.857 E.12508
G1 X134.401 Y115.923 E.42529
G2 X132.805 Y115.453 I-8.299 J25.245 E.05519
G1 X124.209 Y106.857 E.40325
G1 X120.439 Y106.857 E.12508
G1 X116.74 Y110.556 E.17351
G3 X117.35 Y114.874 I-1.76 J2.45 E.16166
G3 X117.121 Y115.121 I-1.943 J-1.573 E.01118
G1 X120.91 Y118.91 E.17778
G3 X122.131 Y117.835 I17.533 J18.684 E.05398
G1 X129.69 Y115.553 F30000
G1 F13250
G2 X128.639 Y115.627 I.216 J10.56 E.03494
G1 X128.639 Y115.627 E0
G2 X129.75 Y115.553 I1.382 J12.369 E2.55718
G1 X137.869 Y117.835 F30000
G1 F13250
G3 X139.09 Y118.91 I-16.306 J19.752 E.05398
G1 X142.881 Y115.119 E.17784
G2 X147.447 Y114.743 I2.124 J-2.121 E.17291
G1 X151.143 Y118.439 E.17337
G1 X151.143 Y122.209 E.12508
G1 X142.543 Y130.809 E.40341
G3 X142.08 Y132.404 I-28.381 J-7.379 E.05512
G1 X151.143 Y141.467 E.42515
G1 X151.143 Y145.237 E.12508
G1 X147.237 Y149.143 E.18321
G1 X143.467 Y149.143 E.12508
G1 X134.401 Y140.077 E.42529
G3 X132.805 Y140.547 I-4.395 J-11.983 E.05522
G1 X124.209 Y149.143 E.40325
G1 X120.439 Y149.143 E.12508
G1 X116.74 Y145.444 E.17351
G3 X116.437 Y145.639 I-1.715 J-2.323 E.01196
G3 X112.881 Y145.119 I-1.425 J-2.679 E.12761
G1 X108.857 Y149.143 E.18874
G1 X110.486 Y149.143 E.05401
; WIPE_START
G1 F24000
G1 X108.857 Y149.143 E-.61876
G1 X109.12 Y148.88 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.992 J.706 P1  F30000
G1 X115.151 Y140.406 Z2.2
G1 Z1.8
G1 E.8 F1800
G1 F13250
G1 X115.151 Y140.406 E0
G2 X115.071 Y145.589 I-.15 J2.59 E.27768
G1 X115.071 Y145.589 E0
G2 X115.211 Y140.407 I-.062 J-2.594 E.26166
G1 X122.131 Y138.165 F30000
G1 F13250
G3 X120.91 Y137.09 I16.308 J-19.754 E.05398
G1 X117.119 Y140.881 E.17784
G2 X114.207 Y140.107 I-2.125 J2.131 E.1047
G1 X114.207 Y140.107 E0
G2 X112.553 Y141.257 I.684 J2.748 E.0683
G1 X108.857 Y137.561 E.17337
G1 X108.857 Y133.791 E.12508
G1 X117.457 Y125.191 E.40341
G3 X117.92 Y123.596 I28.384 J7.38 E.05512
G1 X108.857 Y114.533 E.42515
G1 X108.857 Y110.763 E.12508
G1 X112.763 Y106.857 E.18321
G1 X116.533 Y106.857 E.12508
G1 X125.599 Y115.923 E.42529
G3 X127.195 Y115.453 I8.301 J25.249 E.05519
G1 X135.791 Y106.857 E.40325
G1 X139.561 Y106.857 E.12508
G1 X143.26 Y110.556 E.17351
G3 X143.562 Y110.361 I1.722 J2.333 E.01194
G3 X147.119 Y110.881 I1.42 J2.711 E.12746
G1 X151.143 Y106.857 E.18874
G1 X149.514 Y106.857 E.05401
G1 X144.736 Y110.416 F30000
G1 F13250
G1 X145.195 Y110.404 E.0152
G3 X144.638 Y110.426 I-.178 J2.589 E.52249
G1 X144.676 Y110.417 E.00129
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X144.638 Y110.426 E-.01482
G1 X144.168 Y110.534 E-.18326
G1 X143.699 Y110.746 E-.19582
G1 X143.278 Y111.048 E-.19697
G1 X142.975 Y111.375 E-.16914
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
G3 Z2.2 I-1.207 J-.155 P1  F30000
G1 X141.369 Y123.852 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F13078
G1 X141.371 Y123.861 E.00031
G3 X129.698 Y115.901 I-11.371 J4.137 E2.02156
G1 X130.302 Y115.901 E.02002
G3 X141.151 Y123.299 I-.302 J12.097 E.46042
G1 X141.347 Y123.796 E.01771
G1 X141.003 Y123.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X129.708 Y116.294 I-11.003 J4.003 E1.81189
G1 X130.292 Y116.294 E.01794
G3 X140.982 Y123.939 I-.292 J11.705 E.42877
M204 S10000
; WIPE_START
G1 F24000
G1 X141.19 Y124.548 E-.24464
G1 X141.348 Y125.11 E-.22189
G1 X141.478 Y125.68 E-.22186
G1 X141.511 Y125.865 E-.07161
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.45 J-1.131 P1  F30000
G1 X113.624 Y114.78 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13078
G1 X113.597 Y114.759 E.00111
G3 X114.72 Y110.765 I1.403 J-1.761 E.17507
G1 X114.944 Y110.748 E.00745
G3 X113.973 Y115.002 I.056 J2.251 E.27184
G1 X113.674 Y114.812 E.01177
G1 X113.841 Y114.453 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X114.769 Y111.154 I1.159 J-1.454 E.13391
G1 X114.954 Y111.14 E.0057
G3 X113.889 Y114.489 I.046 J1.859 E.21748
M204 S10000
; WIPE_START
G1 F24000
G1 X113.575 Y114.196 E-.16333
G1 X113.366 Y113.89 E-.14077
G1 X113.222 Y113.548 E-.14078
G1 X113.149 Y113.186 E-.14054
G1 X113.142 Y112.906 E-.10634
G1 X113.169 Y112.728 E-.06825
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.207 J.157 P1  F30000
G1 X116.969 Y141.928 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13078
G1 X117.075 Y142.125 E.00744
G3 X114.72 Y140.765 I-2.075 J.873 E.37238
G1 X114.944 Y140.748 E.00745
G3 X116.861 Y141.731 I.056 J2.251 E.07452
G1 X116.94 Y141.875 E.00545
G1 X116.616 Y142.084 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.633 Y142.111 E.00099
G3 X114.769 Y141.154 I-1.633 J.888 E.29053
G1 X114.954 Y141.14 E.0057
G3 X116.425 Y141.805 I.046 J1.859 E.0513
G1 X116.582 Y142.034 E.00855
M204 S10000
; WIPE_START
G1 F24000
G1 X116.633 Y142.111 E-.03501
G1 X116.778 Y142.452 E-.14075
G1 X116.851 Y142.814 E-.14055
G1 X116.858 Y143.094 E-.10633
G1 X116.803 Y143.459 E-.1403
G1 X116.676 Y143.807 E-.14077
G1 X116.599 Y143.934 E-.05628
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.07 J1.215 P1  F30000
G1 X142.828 Y142.413 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13078
M73 P73 R3
G1 X142.971 Y142.023 E.01377
G3 X144.72 Y140.765 I2.029 J.976 E.07452
G1 X144.944 Y140.748 E.00745
G3 X142.811 Y142.47 I.056 J2.251 E.3715
G1 X143.206 Y142.518 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.324 Y142.193 E.01062
G3 X144.769 Y141.154 I1.675 J.806 E.057
G1 X144.954 Y141.14 E.0057
G3 X143.19 Y142.575 I.046 J1.859 E.28375
M204 S10000
; WIPE_START
G1 F24000
G1 X143.324 Y142.193 E-.154
G1 X143.517 Y141.877 E-.14074
G1 X143.769 Y141.605 E-.14077
G1 X144.07 Y141.389 E-.14077
G1 X144.408 Y141.237 E-.14077
G1 X144.518 Y141.211 E-.04295
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.216 J-.057 P1  F30000
G1 X143.255 Y114.42 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13078
G1 X143.023 Y114.076 E.01376
G3 X144.72 Y110.765 I1.977 J-1.078 E.14528
G1 X144.944 Y110.748 E.00745
G3 X143.293 Y114.467 I.056 J2.251 E.30074
G1 X143.576 Y114.195 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X144.769 Y111.154 I1.424 J-1.196 E.12252
G1 X144.954 Y111.14 E.0057
G3 X143.616 Y114.24 I.046 J1.859 E.22887
M204 S10000
; WIPE_START
G1 F24000
G1 X143.366 Y113.89 E-.16334
G1 X143.222 Y113.548 E-.14076
G1 X143.149 Y113.186 E-.14055
G1 X143.142 Y112.906 E-.10634
G1 X143.197 Y112.541 E-.1403
G1 X143.259 Y112.371 E-.06871
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.186 J.273 P1  F30000
G1 X151.898 Y149.898 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13078
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.58 J1.07 P1  F30000
G1 X151.55 Y149.55 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F13078
G1 X108.45 Y149.55 E1.42968
G1 X108.45 Y106.45 E1.42968
G1 X151.55 Y106.45 E1.42968
G1 X151.55 Y149.49 E1.42769
G1 X149.514 Y149.143 F30000
G1 F13078
G1 X151.143 Y149.143 E.05401
G1 X147.121 Y145.121 E.18868
G2 X147.442 Y141.262 I-2.112 J-2.119 E.13971
G1 X151.143 Y137.561 E.1736
G1 X151.143 Y133.791 E.12508
G1 X142.543 Y125.191 E.40341
G2 X142.08 Y123.596 I-28.384 J7.38 E.05512
G1 X151.143 Y114.533 E.42515
G1 X151.143 Y110.763 E.12508
G1 X147.237 Y106.857 E.18321
G1 X143.467 Y106.857 E.12508
G1 X134.401 Y115.923 E.42529
G2 X132.805 Y115.453 I-8.299 J25.245 E.05519
G1 X124.209 Y106.857 E.40325
G1 X120.439 Y106.857 E.12508
G1 X116.74 Y110.556 E.17351
G2 X112.879 Y110.879 I-1.744 J2.39 E.14011
G1 X108.857 Y106.857 E.18868
G1 X110.486 Y106.857 E.05401
G1 X114.676 Y110.417 F30000
G1 F13078
G2 X115.014 Y115.59 I.331 J2.576 E.25988
G1 X115.014 Y115.59 E0
G2 X115.691 Y115.499 I.112 J-1.72 E.02281
G1 X115.691 Y115.499 E0
G2 X114.736 Y110.416 I-.686 J-2.502 E.25632
; WIPE_START
G1 F24000
G1 X115.194 Y110.404 E-.17416
G1 X115.705 Y110.494 E-.19697
G1 X116.187 Y110.684 E-.19695
G1 X116.612 Y110.958 E-.19192
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.056 J-.605 P1  F30000
G1 X108.857 Y124.486 Z2.4
G1 Z2
G1 E.8 F1800
G1 F13078
G1 X108.857 Y126.115 E.05401
G1 X128.115 Y106.857 E.9034
G1 X131.885 Y106.857 E.12508
G1 X151.143 Y126.115 E.9034
G1 X151.143 Y129.885 E.12508
G1 X131.885 Y149.143 E.9034
G1 X128.115 Y149.143 E.12508
G1 X108.857 Y129.885 E.9034
G1 X108.857 Y131.514 E.05401
; WIPE_START
G1 F24000
G1 X108.857 Y129.885 E-.61876
G1 X109.12 Y130.148 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.337 J1.169 P1  F30000
G1 X144.736 Y140.416 Z2.4
G1 Z2
G1 E.8 F1800
G1 F13078
G1 X145.195 Y140.404 E.0152
G3 X144.676 Y140.417 I-.195 J2.594 E.52496
G1 X137.869 Y138.165 F30000
G1 F13078
G2 X139.09 Y137.09 I-16.303 J-19.748 E.05398
G1 X142.879 Y140.879 E.17778
G1 X142.828 Y140.935 E.0025
G2 X143.26 Y145.444 I2.161 J2.068 E.17047
G1 X139.561 Y149.143 E.17351
G1 X135.791 Y149.143 E.12508
G1 X127.195 Y140.547 E.40325
G3 X125.599 Y140.077 I2.735 J-12.234 E.05523
G1 X116.533 Y149.143 E.42529
G1 X112.763 Y149.143 E.12508
G1 X108.857 Y145.237 E.18321
G1 X108.857 Y141.467 E.12508
G1 X117.92 Y132.404 E.42515
G3 X117.457 Y130.809 I12.929 J-4.621 E.05514
G1 X108.857 Y122.209 E.40341
G1 X108.857 Y118.439 E.12508
G1 X112.558 Y114.738 E.1736
G2 X115.024 Y115.997 I2.375 J-1.607 E.09587
G1 X115.024 Y115.997 E0
G2 X117.121 Y115.121 I-.02 J-2.993 E.07731
G1 X120.91 Y118.91 E.17778
G3 X122.131 Y117.835 I9.156 J9.169 E.054
G1 X129.69 Y115.553 F30000
G1 F13078
G2 X122.052 Y118.421 I.404 J12.679 E.27554
G1 X122.052 Y118.421 E0
G2 X142.388 Y126.755 I7.951 J9.578 E1.7011
G1 X142.388 Y126.755 E0
G2 X129.75 Y115.553 I-12.395 J1.254 E.61557
G1 X137.869 Y117.835 F30000
G1 F13078
G3 X139.09 Y118.91 I-16.306 J19.752 E.05398
G1 X142.881 Y115.119 E.17784
G1 X142.955 Y115.192 E.00344
G2 X147.447 Y114.743 I2.05 J-2.185 E.1696
G1 X151.143 Y118.439 E.17337
G1 X151.143 Y122.209 E.12508
G1 X142.543 Y130.809 E.40341
G3 X142.08 Y132.404 I-28.384 J-7.38 E.05512
G1 X151.143 Y141.467 E.42515
G1 X151.143 Y145.237 E.12508
G1 X147.237 Y149.143 E.18321
G1 X143.467 Y149.143 E.12508
G1 X134.401 Y140.077 E.42529
G3 X132.805 Y140.547 I-4.395 J-11.983 E.05522
G1 X124.209 Y149.143 E.40325
G1 X120.439 Y149.143 E.12508
G1 X116.738 Y145.442 E.17361
G3 X112.881 Y145.119 I-1.738 J-2.44 E.1396
G1 X108.857 Y149.143 E.18874
G1 X110.486 Y149.143 E.05401
; WIPE_START
G1 F24000
G1 X108.857 Y149.143 E-.61876
M73 P74 R3
G1 X109.12 Y148.88 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.017 J.668 P1  F30000
G1 X114.676 Y140.417 Z2.4
G1 Z2
G1 E.8 F1800
G1 F13078
G2 X115.195 Y140.404 I.323 J2.576 E.52388
G1 X114.736 Y140.416 E.0152
G1 X122.131 Y138.165 F30000
G1 F13078
G3 X120.91 Y137.09 I16.312 J-19.758 E.05398
G1 X117.119 Y140.881 E.17784
G1 X117.058 Y140.82 E.00286
G2 X112.553 Y141.257 I-2.061 J2.193 E.1699
G1 X108.857 Y137.561 E.17337
G1 X108.857 Y133.791 E.12508
G1 X117.457 Y125.191 E.40341
G3 X117.92 Y123.596 I28.386 J7.381 E.05512
G1 X108.857 Y114.533 E.42515
G1 X108.857 Y110.763 E.12508
G1 X112.763 Y106.857 E.18321
G1 X116.533 Y106.857 E.12508
G1 X125.599 Y115.923 E.42529
G3 X127.195 Y115.453 I8.301 J25.249 E.05519
G1 X135.791 Y106.857 E.40325
G1 X139.561 Y106.857 E.12508
G1 X143.262 Y110.558 E.17361
G3 X147.119 Y110.881 I1.741 J2.401 E.13988
G1 X151.143 Y106.857 E.18874
G1 X149.514 Y106.857 E.05401
G1 X144.736 Y110.416 F30000
G1 F13078
G1 X145.194 Y110.404 E.0152
G3 X144.676 Y110.417 I-.195 J2.589 E.52392
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X144.171 Y110.533 E-.19696
G1 X143.699 Y110.746 E-.19696
G1 X143.278 Y111.048 E-.19697
G1 X142.975 Y111.375 E-.16911
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
G3 Z2.4 I-1.207 J-.155 P1  F30000
G1 X141.369 Y123.852 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F12969
G1 X141.371 Y123.861 E.00031
G3 X129.698 Y115.901 I-11.371 J4.137 E2.02156
G1 X130.302 Y115.901 E.02002
G3 X141.151 Y123.299 I-.302 J12.097 E.46042
G1 X141.347 Y123.796 E.01771
G1 X141.004 Y123.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X141.189 Y124.549 E.01794
G3 X129.708 Y116.294 I-11.189 J3.449 E1.79395
G1 X130.292 Y116.294 E.01794
G3 X140.983 Y123.94 I-.292 J11.705 E.42881
M204 S10000
; WIPE_START
G1 F24000
G1 X141.189 Y124.549 E-.24417
G1 X141.348 Y125.11 E-.22188
G1 X141.478 Y125.68 E-.22186
G1 X141.511 Y125.867 E-.07209
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.45 J-1.131 P1  F30000
G1 X113.624 Y114.779 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12969
G1 X113.597 Y114.759 E.00111
G3 X114.72 Y110.765 I1.403 J-1.761 E.17507
G1 X114.944 Y110.748 E.00745
G3 X113.973 Y115.002 I.056 J2.251 E.27184
G1 X113.674 Y114.812 E.01177
G1 X113.841 Y114.453 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X114.769 Y111.154 I1.159 J-1.454 E.13391
G1 X114.954 Y111.14 E.0057
G3 X113.889 Y114.489 I.046 J1.859 E.21748
M204 S10000
; WIPE_START
G1 F24000
G1 X113.575 Y114.196 E-.16334
G1 X113.366 Y113.89 E-.14076
G1 X113.222 Y113.548 E-.14078
G1 X113.149 Y113.186 E-.14059
G1 X113.142 Y112.906 E-.10636
G1 X113.169 Y112.728 E-.06817
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.207 J.158 P1  F30000
G1 X116.991 Y141.953 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12969
G1 X117.152 Y142.336 E.01377
G3 X114.72 Y140.765 I-2.152 J.662 E.36493
G1 X114.944 Y140.748 E.00745
G3 X116.965 Y141.9 I.056 J2.251 E.08109
G1 X116.625 Y142.098 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.633 Y142.111 E.00047
G3 X114.769 Y141.154 I-1.633 J.888 E.29053
G1 X114.954 Y141.14 E.0057
G3 X116.425 Y141.805 I.046 J1.859 E.0513
G1 X116.591 Y142.048 E.00907
M204 S10000
; WIPE_START
G1 F24000
G1 X116.633 Y142.111 E-.02862
G1 X116.778 Y142.452 E-.14073
G1 X116.851 Y142.814 E-.1406
G1 X116.858 Y143.094 E-.10636
G1 X116.803 Y143.459 E-.14023
G1 X116.676 Y143.807 E-.14077
G1 X116.59 Y143.948 E-.06268
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.071 J1.215 P1  F30000
G1 X142.828 Y142.413 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12969
G1 X142.971 Y142.023 E.01377
G3 X144.72 Y140.765 I2.029 J.976 E.07452
G1 X144.944 Y140.748 E.00745
G3 X142.811 Y142.47 I.056 J2.251 E.3715
G1 X143.203 Y142.525 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.324 Y142.193 E.01085
G3 X144.769 Y141.154 I1.675 J.806 E.057
G1 X144.954 Y141.14 E.0057
G3 X143.188 Y142.583 I.046 J1.859 E.28351
M204 S10000
; WIPE_START
G1 F24000
G1 X143.324 Y142.193 E-.15686
G1 X143.517 Y141.877 E-.14074
G1 X143.769 Y141.605 E-.14077
G1 X144.07 Y141.389 E-.14077
G1 X144.408 Y141.237 E-.14077
G1 X144.51 Y141.213 E-.04009
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.216 J-.057 P1  F30000
G1 X143.255 Y114.42 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12969
G1 X143.023 Y114.076 E.01376
G3 X144.72 Y110.765 I1.977 J-1.078 E.14529
G1 X144.944 Y110.748 E.00745
G3 X143.293 Y114.467 I.056 J2.251 E.30074
G1 X143.576 Y114.195 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X144.769 Y111.154 I1.424 J-1.196 E.12252
G1 X144.954 Y111.14 E.0057
G3 X143.616 Y114.24 I.046 J1.859 E.22887
M204 S10000
; WIPE_START
G1 F24000
G1 X143.366 Y113.89 E-.16333
G1 X143.222 Y113.548 E-.14077
G1 X143.149 Y113.186 E-.1406
G1 X143.142 Y112.906 E-.10636
G1 X143.197 Y112.541 E-.14023
G1 X143.259 Y112.371 E-.06872
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.186 J.273 P1  F30000
G1 X151.898 Y149.898 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F12969
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.58 J1.07 P1  F30000
G1 X151.55 Y149.55 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12969
G1 X108.45 Y149.55 E1.42968
G1 X108.45 Y106.45 E1.42968
G1 X151.55 Y106.45 E1.42968
G1 X151.55 Y149.49 E1.42769
G1 X149.514 Y149.143 F30000
G1 F12969
G1 X151.143 Y149.143 E.05401
G1 X147.121 Y145.121 E.18868
G2 X147.442 Y141.262 I-2.079 J-2.116 E.13995
G1 X151.143 Y137.561 E.1736
G1 X151.143 Y133.791 E.12508
G1 X142.543 Y125.191 E.40341
G2 X142.08 Y123.596 I-28.38 J7.379 E.05512
G1 X151.143 Y114.533 E.42515
G1 X151.143 Y110.763 E.12508
G1 X147.237 Y106.857 E.18321
G1 X143.467 Y106.857 E.12508
G1 X134.401 Y115.923 E.42529
G2 X132.805 Y115.453 I-8.299 J25.245 E.05519
G1 X124.209 Y106.857 E.40325
G1 X120.439 Y106.857 E.12508
G1 X116.74 Y110.556 E.17351
G1 X116.617 Y110.476 E.00487
G2 X112.879 Y110.879 I-1.618 J2.53 E.13474
G1 X108.857 Y106.857 E.18868
G1 X110.486 Y106.857 E.05401
G1 X114.792 Y110.414 F30000
G1 F12969
G2 X114.589 Y110.437 I-.045 J.514 E.00682
G1 X114.589 Y110.437 E0
G2 X115.066 Y115.589 I.413 J2.56 E.25856
G1 X115.066 Y115.589 E0
G2 X114.852 Y110.413 I-.066 J-2.59 E.2727
G1 X122.131 Y117.835 F30000
G1 F12969
G2 X120.91 Y118.91 I8.141 J10.477 E.054
G1 X117.121 Y115.121 E.17778
G3 X112.558 Y114.738 I-2.121 J-2.1 E.17311
M73 P75 R3
G1 X108.857 Y118.439 E.1736
G1 X108.857 Y122.209 E.12508
G1 X117.457 Y130.809 E.40341
G2 X117.92 Y132.404 I13.534 J-3.066 E.05514
G1 X108.857 Y141.467 E.42515
G1 X108.857 Y145.237 E.12508
G1 X112.763 Y149.143 E.18321
G1 X116.533 Y149.143 E.12508
G1 X125.599 Y140.077 E.42529
G2 X127.195 Y140.547 I4.331 J-11.764 E.05523
G1 X135.791 Y149.143 E.40325
G1 X139.561 Y149.143 E.12508
G1 X143.26 Y145.444 E.17351
G3 X142.809 Y140.955 I1.728 J-2.441 E.16957
G1 X142.879 Y140.879 E.00341
G1 X139.09 Y137.09 E.17778
G3 X137.869 Y138.165 I-17.524 J-18.674 E.05398
G1 X144.676 Y140.417 F30000
G1 F12969
G2 X144.171 Y145.457 I.335 J2.579 E.23148
G1 X144.171 Y145.457 E0
G2 X144.736 Y140.416 I.834 J-2.459 E.30764
; WIPE_START
G1 F24000
G1 X145.195 Y140.404 E-.17417
G1 X145.705 Y140.494 E-.19697
G1 X146.187 Y140.684 E-.19695
G1 X146.612 Y140.958 E-.19191
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.138 J-1.209 P1  F30000
G1 X122.131 Y138.165 Z2.6
G1 Z2.2
G1 E.8 F1800
G1 F12969
G3 X120.91 Y137.09 I16.309 J-19.755 E.05398
G1 X117.119 Y140.881 E.17784
G1 X117.001 Y140.765 E.00551
G2 X115.403 Y140.028 I-1.853 J1.916 E.05948
G1 X115.403 Y140.028 E0
G2 X112.553 Y141.257 I-.412 J2.964 E.10823
G1 X108.857 Y137.561 E.17337
G1 X108.857 Y133.791 E.12508
G1 X117.457 Y125.191 E.40341
G3 X117.92 Y123.596 I28.386 J7.381 E.05512
G1 X108.857 Y114.533 E.42515
G1 X108.857 Y110.763 E.12508
G1 X112.763 Y106.857 E.18321
G1 X116.533 Y106.857 E.12508
G1 X125.599 Y115.923 E.42529
G3 X127.195 Y115.453 I8.301 J25.249 E.05519
G1 X135.791 Y106.857 E.40325
G1 X139.561 Y106.857 E.12508
G1 X143.262 Y110.558 E.17361
G3 X147.119 Y110.881 I1.732 J2.515 E.13907
G1 X151.143 Y106.857 E.18874
G1 X149.514 Y106.857 E.05401
G1 X144.736 Y110.416 F30000
G1 F12969
G3 X145.062 Y115.589 I.265 J2.58 E.2771
G1 X145.062 Y115.589 E0
G3 X144.676 Y110.417 I-.061 J-2.596 E.26177
G1 X137.869 Y117.835 F30000
G1 F12969
G3 X139.09 Y118.91 I-16.305 J19.751 E.05398
G1 X142.881 Y115.119 E.17784
G1 X143.074 Y115.308 E.00898
G2 X147.447 Y114.743 I1.923 J-2.323 E.16403
G1 X151.143 Y118.439 E.17337
G1 X151.143 Y122.209 E.12508
G1 X142.543 Y130.809 E.40341
G3 X142.08 Y132.404 I-28.383 J-7.38 E.05512
G1 X151.143 Y141.467 E.42515
G1 X151.143 Y145.237 E.12508
G1 X147.237 Y149.143 E.18321
G1 X143.467 Y149.143 E.12508
G1 X134.401 Y140.077 E.42529
G3 X132.805 Y140.547 I-4.395 J-11.983 E.05522
G1 X124.209 Y149.143 E.40325
G1 X120.439 Y149.143 E.12508
G1 X116.738 Y145.442 E.17361
G3 X115.745 Y145.904 I-1.755 J-2.472 E.03652
G1 X115.745 Y145.904 E0
G3 X112.881 Y145.119 I-.743 J-2.909 E.10306
G1 X108.857 Y149.143 E.18874
G1 X110.486 Y149.143 E.05401
G1 X117.379 Y143.783 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
G1 F12969
G1 X117.315 Y143.82 E.00204
G1 X117.363 Y143.848 E.00155
; WIPE_START
G1 F24000
G1 X117.315 Y143.82 E-.32874
G1 X117.379 Y143.783 E-.43126
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.014 J-.673 P1  F30000
G1 X115.139 Y140.406 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F12969
G3 X117.497 Y142.28 I-.142 J2.599 E.10657
G1 X117.497 Y142.28 E0
G3 X117.593 Y142.916 I-1.94 J.619 E.0214
G1 X117.751 Y142.944 E.00533
G1 X117.569 Y144.11 E.03915
G1 X117.364 Y144.078 E.0069
G3 X114.718 Y145.58 I-2.378 J-1.108 E.10765
G1 X114.718 Y145.58 E0
G3 X115.079 Y140.407 I.282 J-2.579 E.26366
G1 X108.857 Y131.514 F30000
G1 F12969
G1 X108.857 Y129.885 E.05401
G1 X128.115 Y149.143 E.9034
G1 X131.885 Y149.143 E.12508
G1 X151.143 Y129.885 E.9034
G1 X151.143 Y126.115 E.12508
G1 X131.885 Y106.857 E.9034
G1 X128.115 Y106.857 E.12508
G1 X108.857 Y126.115 E.9034
G1 X108.857 Y124.486 E.05401
G1 X129.69 Y115.553 F30000
G1 F12969
G2 X128.639 Y115.627 I.216 J10.56 E.03494
G1 X128.639 Y115.627 E0
G2 X129.75 Y115.553 I1.382 J12.37 E2.55738
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X130.93 Y115.584 E-.44886
G1 X131.743 Y115.686 E-.31114
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
G3 Z2.6 I-.787 J.928 P1  F30000
G1 X141.369 Y123.852 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F13055
G1 X141.371 Y123.861 E.00031
G3 X129.698 Y115.901 I-11.371 J4.137 E2.02156
G1 X130.302 Y115.901 E.02002
G3 X141.151 Y123.299 I-.302 J12.097 E.46042
G1 X141.347 Y123.796 E.01771
G1 X141.004 Y123.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X141.189 Y124.549 E.01793
G3 X129.708 Y116.294 I-11.189 J3.449 E1.79395
G1 X130.292 Y116.294 E.01794
G3 X140.983 Y123.94 I-.292 J11.705 E.42881
M204 S10000
; WIPE_START
G1 F24000
G1 X141.189 Y124.549 E-.24417
G1 X141.348 Y125.11 E-.22188
G1 X141.478 Y125.68 E-.22186
G1 X141.511 Y125.867 E-.07209
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.45 J-1.131 P1  F30000
G1 X113.571 Y114.738 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13055
G1 X113.276 Y114.447 E.01377
G3 X114.72 Y110.765 I1.724 J-1.448 E.16018
G1 X114.944 Y110.748 E.00745
G3 X113.618 Y114.776 I.056 J2.251 E.28585
G1 X113.841 Y114.455 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.841 Y114.453 E.00006
G3 X114.769 Y111.154 I1.159 J-1.454 E.13391
G1 X114.954 Y111.14 E.0057
G3 X114.152 Y114.653 I.046 J1.859 E.20793
G1 X113.891 Y114.487 E.00952
M204 S10000
; WIPE_START
G1 F24000
G1 X113.841 Y114.453 E-.02293
G1 X113.575 Y114.196 E-.14069
G1 X113.366 Y113.89 E-.14077
G1 X113.222 Y113.548 E-.14077
M73 P76 R3
G1 X113.149 Y113.185 E-.14077
G1 X113.149 Y112.815 E-.14077
G1 X113.166 Y112.729 E-.0333
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.206 J.161 P1  F30000
G1 X117.086 Y142.157 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13055
G1 X117.207 Y142.554 E.01376
G3 X114.72 Y140.765 I-2.207 J.445 E.35748
G1 X114.944 Y140.748 E.00745
G3 X117.065 Y142.101 I.056 J2.251 E.08855
G1 X116.633 Y142.128 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.713 Y142.278 E.00524
G3 X114.769 Y141.154 I-1.714 J.721 E.28483
G1 X114.954 Y141.14 E.0057
G3 X116.537 Y141.952 I.046 J1.859 E.057
G1 X116.604 Y142.075 E.0043
M204 S10000
; WIPE_START
G1 F24000
G1 X116.713 Y142.278 E-.08759
G1 X116.823 Y142.631 E-.14073
G1 X116.86 Y143 E-.14078
G1 X116.823 Y143.369 E-.14077
G1 X116.747 Y143.639 E-.10664
G1 X116.587 Y143.97 E-.13977
G1 X116.581 Y143.978 E-.00372
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.072 J1.215 P1  F30000
G1 X142.828 Y142.413 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13055
G1 X142.971 Y142.023 E.01377
G3 X144.72 Y140.765 I2.029 J.976 E.07452
G1 X144.944 Y140.748 E.00745
G3 X142.811 Y142.47 I.056 J2.251 E.3715
G1 X143.201 Y142.532 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.324 Y142.193 E.01108
G3 X144.769 Y141.154 I1.675 J.806 E.057
G1 X144.954 Y141.14 E.0057
G3 X143.186 Y142.59 I.046 J1.859 E.28329
M204 S10000
; WIPE_START
G1 F24000
G1 X143.324 Y142.193 E-.1596
G1 X143.517 Y141.877 E-.14074
G1 X143.769 Y141.605 E-.14077
G1 X144.07 Y141.389 E-.14077
G1 X144.408 Y141.237 E-.14078
G1 X144.503 Y141.215 E-.03734
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.216 J-.057 P1  F30000
G1 X143.255 Y114.42 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13055
G1 X143.023 Y114.076 E.01377
G3 X144.72 Y110.765 I1.977 J-1.078 E.14528
G1 X144.944 Y110.748 E.00745
G3 X143.293 Y114.467 I.056 J2.251 E.30074
G1 X143.575 Y114.195 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.368 Y113.889 E.01136
G3 X144.769 Y111.154 I1.632 J-.89 E.11113
G1 X144.954 Y111.14 E.0057
G3 X143.614 Y114.238 I.046 J1.859 E.22892
M204 S10000
; WIPE_START
G1 F24000
G1 X143.368 Y113.889 E-.16257
G1 X143.222 Y113.548 E-.1407
G1 X143.149 Y113.186 E-.14064
G1 X143.142 Y112.906 E-.1064
G1 X143.197 Y112.541 E-.14015
G1 X143.26 Y112.369 E-.06954
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.186 J.273 P1  F30000
G1 X151.898 Y149.898 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F13055
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.58 J1.07 P1  F30000
G1 X151.55 Y149.55 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F13055
G1 X108.45 Y149.55 E1.42968
G1 X108.45 Y106.45 E1.42968
G1 X151.55 Y106.45 E1.42968
G1 X151.55 Y149.49 E1.42769
G1 X149.514 Y149.143 F30000
G1 F13055
G1 X151.143 Y149.143 E.05401
G1 X147.121 Y145.121 E.18868
G2 X147.933 Y143.652 I-2.24 J-2.197 E.05634
G1 X147.933 Y143.652 E0
G2 X147.562 Y141.437 I-3.223 J-.599 E.07604
G1 X147.442 Y141.262 E.00705
G1 X151.143 Y137.561 E.1736
G1 X151.143 Y133.791 E.12508
G1 X142.543 Y125.191 E.40341
G2 X142.08 Y123.596 I-28.379 J7.379 E.05512
G1 X151.143 Y114.533 E.42515
G1 X151.143 Y110.763 E.12508
G1 X147.237 Y106.857 E.18321
G1 X143.467 Y106.857 E.12508
G1 X134.401 Y115.923 E.42529
G2 X132.805 Y115.453 I-8.299 J25.245 E.05519
G1 X124.209 Y106.857 E.40325
G1 X120.439 Y106.857 E.12508
G1 X116.74 Y110.556 E.17351
G3 X117.121 Y115.121 I-1.772 J2.446 E.17246
G1 X120.91 Y118.91 E.17778
G3 X122.131 Y117.835 I17.532 J18.682 E.05398
G1 X129.69 Y115.553 F30000
G1 F13055
G2 X130.31 Y115.553 I.311 J12.439 E2.57282
G1 X129.75 Y115.553 E.0186
G1 X137.869 Y117.835 F30000
G1 F13055
G3 X139.09 Y118.91 I-16.306 J19.752 E.05398
G1 X142.881 Y115.119 E.17784
G1 X143.075 Y115.309 E.00901
G2 X147.447 Y114.743 I1.927 J-2.288 E.16442
G1 X151.143 Y118.439 E.17337
G1 X151.143 Y122.209 E.12508
G1 X142.543 Y130.809 E.40341
G3 X142.08 Y132.404 I-28.383 J-7.38 E.05512
G1 X151.143 Y141.467 E.42515
G1 X151.143 Y145.237 E.12508
G1 X147.237 Y149.143 E.18321
G1 X143.467 Y149.143 E.12508
G1 X134.401 Y140.077 E.42529
G3 X132.805 Y140.547 I-4.395 J-11.984 E.05522
G1 X124.209 Y149.143 E.40325
G1 X120.439 Y149.143 E.12508
G1 X116.738 Y145.442 E.17361
G3 X112.881 Y145.119 I-1.737 J-2.459 E.13945
G1 X108.857 Y149.143 E.18874
G1 X110.486 Y149.143 E.05401
; WIPE_START
G1 F24000
G1 X108.857 Y149.143 E-.61876
G1 X109.12 Y148.88 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.999 J.695 P1  F30000
G1 X115.015 Y140.409 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F13055
G2 X114.527 Y145.546 I-.002 J2.592 E.25396
G1 X114.527 Y145.546 E0
G2 X115.075 Y140.407 I.471 J-2.548 E.28328
G1 X122.131 Y138.165 F30000
G1 F13055
G3 X120.91 Y137.09 I16.309 J-19.755 E.05398
G1 X117.119 Y140.881 E.17784
G1 X117.04 Y140.803 E.00367
G2 X115.332 Y140.015 I-2.003 J2.096 E.06354
G1 X115.332 Y140.015 E0
G2 X115.005 Y140.002 I-.197 J.802 E.01094
G1 X115.005 Y140.002 E0
G2 X112.754 Y141.014 I0 J3.008 E.08436
G1 X112.754 Y141.014 E0
G2 X112.553 Y141.257 I.5 J.619 E.01052
G1 X108.857 Y137.561 E.17337
M73 P77 R3
G1 X108.857 Y133.791 E.12508
G1 X117.457 Y125.191 E.40341
G3 X117.92 Y123.596 I28.384 J7.38 E.05512
G1 X108.857 Y114.533 E.42515
G1 X108.857 Y110.763 E.12508
G1 X112.763 Y106.857 E.18321
G1 X116.533 Y106.857 E.12508
G1 X125.599 Y115.923 E.42529
G3 X127.195 Y115.453 I8.301 J25.249 E.05519
G1 X135.791 Y106.857 E.40325
G1 X139.561 Y106.857 E.12508
G1 X143.262 Y110.558 E.17361
G3 X147.119 Y110.881 I1.738 J2.442 E.13958
G1 X151.143 Y106.857 E.18874
G1 X149.514 Y106.857 E.05401
G1 X145.227 Y110.41 F30000
G1 F13055
G1 X145.45 Y110.449 E.00749
G3 X146.399 Y110.82 I-.45 J2.551 E.03403
G1 X146.399 Y110.82 E0
G3 X145.168 Y110.405 I-1.419 J2.173 E.49739
; WIPE_START
M73 P77 R2
G1 F24000
G1 X144.676 Y110.417 E-.18684
G1 X144.171 Y110.533 E-.19696
G1 X143.699 Y110.746 E-.19696
G1 X143.316 Y111.021 E-.17924
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.216 J.059 P1  F30000
G1 X144.736 Y140.416 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F13055
G1 X145.195 Y140.404 E.0152
G3 X144.676 Y140.417 I-.195 J2.576 E.52125
G1 X137.869 Y138.165 F30000
G1 F13055
G2 X139.09 Y137.09 I-16.303 J-19.749 E.05398
G1 X142.879 Y140.879 E.17778
G2 X143.26 Y145.444 I2.105 J2.123 E.1731
G1 X139.561 Y149.143 E.17351
G1 X135.791 Y149.143 E.12508
G1 X127.195 Y140.547 E.40325
G3 X125.599 Y140.077 I2.649 J-11.944 E.05523
G1 X116.533 Y149.143 E.42529
G1 X112.763 Y149.143 E.12508
G1 X108.857 Y145.237 E.18321
G1 X108.857 Y141.467 E.12508
G1 X117.92 Y132.404 E.42515
G1 X117.863 Y132.234 E.00595
G3 X117.457 Y130.809 I12.41 J-4.305 E.04919
G1 X108.857 Y122.209 E.40341
G1 X108.857 Y118.439 E.12508
G1 X112.558 Y114.738 E.1736
G3 X112.879 Y110.879 I2.426 J-1.741 E.13976
G1 X108.857 Y106.857 E.18868
G1 X110.486 Y106.857 E.05401
G1 X114.676 Y110.417 F30000
G1 F13055
G2 X114.221 Y110.521 I1.688 J8.445 E.01548
G2 X115.065 Y115.589 I.773 J2.475 E.24653
G1 X115.065 Y115.589 E0
G2 X117.58 Y113.306 I-.048 J-2.581 E.123
G1 X117.58 Y113.306 E0
G2 X114.736 Y110.416 I-2.598 J-.287 E.15393
; WIPE_START
G1 F24000
G1 X115.195 Y110.404 E-.17416
G1 X115.705 Y110.494 E-.19696
G1 X116.187 Y110.684 E-.19697
G1 X116.612 Y110.958 E-.19191
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.056 J-.605 P1  F30000
G1 X108.857 Y124.486 Z2.8
G1 Z2.4
G1 E.8 F1800
G1 F13055
G1 X108.857 Y126.115 E.05401
G1 X128.115 Y106.857 E.9034
G1 X131.885 Y106.857 E.12508
G1 X151.143 Y126.115 E.9034
G1 X151.143 Y129.885 E.12508
G1 X131.885 Y149.143 E.9034
G1 X128.115 Y149.143 E.12508
G1 X108.857 Y129.885 E.9034
G1 X108.857 Y131.514 E.05401
M106 S155.55
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.857 Y129.885 E-.61876
G1 X109.12 Y130.148 E-.14124
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
G3 Z2.8 I.233 J1.194 P1  F30000
G1 X141.369 Y123.852 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X141.371 Y123.861 E.00031
G3 X129.698 Y115.901 I-11.371 J4.137 E2.02156
G1 X130.302 Y115.901 E.02002
G3 X141.151 Y123.299 I-.302 J12.097 E.46042
G1 X141.347 Y123.796 E.01771
G1 X141.004 Y123.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X141.003 Y123.995 E.00004
G3 X129.708 Y116.294 I-11.003 J4.003 E1.81189
G1 X130.292 Y116.294 E.01794
G3 X140.79 Y123.452 I-.292 J11.705 E.41267
G1 X140.982 Y123.939 E.01609
M204 S10000
; WIPE_START
G1 F24000
G1 X141.003 Y123.995 E-.02289
G1 X141.19 Y124.548 E-.22185
G1 X141.348 Y125.11 E-.22189
G1 X141.478 Y125.68 E-.22186
G1 X141.511 Y125.865 E-.07151
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.45 J-1.131 P1  F30000
G1 X113.623 Y114.779 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X113.597 Y114.759 E.0011
G3 X114.72 Y110.765 I1.403 J-1.761 E.17507
G1 X114.944 Y110.748 E.00745
G3 X113.973 Y115.002 I.056 J2.251 E.27184
G1 X113.674 Y114.812 E.01178
G1 X113.841 Y114.455 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.841 Y114.453 E.00006
G3 X114.769 Y111.154 I1.159 J-1.454 E.13391
G1 X114.954 Y111.14 E.0057
G3 X114.152 Y114.653 I.046 J1.859 E.20793
G1 X113.891 Y114.487 E.00951
M204 S10000
; WIPE_START
G1 F24000
G1 X113.841 Y114.453 E-.02306
G1 X113.575 Y114.196 E-.1407
G1 X113.366 Y113.89 E-.14076
G1 X113.222 Y113.548 E-.14077
G1 X113.149 Y113.185 E-.14077
G1 X113.149 Y112.815 E-.14077
G1 X113.166 Y112.729 E-.03317
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.207 J.157 P1  F30000
G1 X116.969 Y141.928 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X117.075 Y142.125 E.00744
G3 X114.72 Y140.765 I-2.075 J.873 E.37238
G1 X114.944 Y140.748 E.00745
G3 X116.861 Y141.731 I.056 J2.251 E.07452
G1 X116.94 Y141.875 E.00545
G1 X116.641 Y142.126 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.777 Y142.452 E.01084
G3 X114.769 Y141.154 I-1.777 J.547 E.27913
G1 X114.954 Y141.14 E.0057
G3 X116.612 Y142.074 I.046 J1.859 E.0614
M204 S10000
; WIPE_START
G1 F24000
G1 X116.777 Y142.452 E-.15675
G1 X116.851 Y142.815 E-.14074
G1 X116.851 Y143.185 E-.14076
G1 X116.778 Y143.548 E-.14067
G1 X116.675 Y143.809 E-.10646
G1 X116.573 Y143.976 E-.07462
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.072 J1.215 P1  F30000
G1 X142.828 Y142.413 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X142.971 Y142.023 E.01377
G3 X144.72 Y140.765 I2.029 J.976 E.07452
G1 X144.944 Y140.748 E.00745
G3 X142.811 Y142.47 I.056 J2.251 E.37149
G1 X143.198 Y142.538 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.324 Y142.193 E.01129
G3 X144.769 Y141.154 I1.675 J.806 E.057
G1 X144.954 Y141.14 E.0057
G3 X143.185 Y142.596 I.046 J1.859 E.28308
M204 S10000
; WIPE_START
G1 F24000
G1 X143.324 Y142.193 E-.16216
G1 X143.517 Y141.877 E-.14075
G1 X143.769 Y141.605 E-.14077
G1 X144.07 Y141.389 E-.14076
G1 X144.408 Y141.237 E-.14078
G1 X144.497 Y141.216 E-.03478
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I1.216 J-.054 P1  F30000
G1 X143.298 Y114.471 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.276 Y114.447 E.0011
G3 X144.72 Y110.765 I1.724 J-1.448 E.16018
G1 X144.944 Y110.748 E.00745
G3 X143.597 Y114.759 I.056 J2.251 E.28673
G1 X143.341 Y114.513 E.01178
G1 X143.576 Y114.196 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.576 Y114.195 E.00006
G3 X144.769 Y111.154 I1.424 J-1.196 E.12252
G1 X144.954 Y111.14 E.0057
G3 X143.841 Y114.453 I.046 J1.859 E.21932
G1 X143.619 Y114.238 E.00951
M204 S10000
; WIPE_START
G1 F24000
G1 X143.576 Y114.195 E-.02304
G1 X143.366 Y113.89 E-.14069
G1 X143.222 Y113.548 E-.14077
G1 X143.149 Y113.185 E-.14068
G1 X143.142 Y112.905 E-.10645
G1 X143.197 Y112.541 E-.14005
G1 X143.259 Y112.372 E-.06831
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.186 J.273 P1  F30000
G1 X151.898 Y149.898 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
M73 P78 R2
G3 Z3 I1.076 J.569 P1  F30000
G1 X151.731 Y147.506 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.401528
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X147.613 Y142.84 E.32107
G3 X147.57 Y143.473 I-1.829 J.193 E.03292
G1 X151.528 Y147.959 E.30865
G1 X151.528 Y148.641 E.03521
G1 X147.42 Y143.986 E.32032
G3 X147.196 Y144.415 I-1.172 J-.34 E.02511
G1 X151.528 Y149.324 E.33779
G1 X151.528 Y149.528 E.01055
G1 X151.107 Y149.528 E.02176
G1 X146.914 Y144.777 E.32693
G3 X146.579 Y145.081 I-.918 J-.675 E.02345
G1 X150.504 Y149.528 E.30603
G1 X149.902 Y149.528 E.03107
G1 X146.194 Y145.326 E.28914
G1 X145.836 Y145.488 E.02026
G1 X145.751 Y145.507 E.00448
G1 X149.3 Y149.528 E.27669
G1 X148.698 Y149.528 E.03107
G1 X145.237 Y145.606 E.26987
G1 X144.804 Y145.617 E.02233
G1 X144.614 Y145.584 E.00993
G1 X148.095 Y149.528 E.27142
G1 X147.493 Y149.528 E.03107
G1 X137.371 Y138.058 E.78925
G1 X137.732 Y137.785 E.02336
G1 X142.385 Y143.057 E.36279
G1 X142.38 Y142.859 E.01024
G1 X142.443 Y142.441 E.02179
G1 X138.08 Y137.497 E.34024
G2 X138.418 Y137.198 I-2.824 J-3.542 E.0233
G1 X142.606 Y141.943 E.32651
G1 X142.635 Y141.861 E.00448
G1 X142.84 Y141.526 E.02026
G1 X138.747 Y136.888 E.31912
G1 X139.064 Y136.564 E.02336
G1 X143.132 Y141.174 E.3172
G3 X143.475 Y140.88 I.898 J.701 E.02345
G1 X139.368 Y136.227 E.32017
G2 X139.664 Y135.88 I-3.336 J-3.132 E.02355
G1 X143.869 Y140.645 E.32792
G3 X144.322 Y140.476 I.645 J1.036 E.02511
G1 X139.949 Y135.521 E.34098
G1 X140.22 Y135.145 E.02389
G1 X144.85 Y140.392 E.36104
G3 X145.49 Y140.435 I.213 J1.606 E.03333
G1 X140.479 Y134.756 E.39074
G2 X140.728 Y134.356 I-3.89 J-2.692 E.02434
G1 X151.528 Y146.594 E.84212
G1 X151.528 Y145.912 E.03521
G1 X140.965 Y133.942 E.82362
G1 X141.186 Y133.51 E.02503
G1 X151.528 Y145.229 E.80637
G1 X151.528 Y144.547 E.03521
G1 X141.394 Y133.063 E.79017
G2 X141.588 Y132.601 I-4.533 J-2.177 E.02588
G1 X151.528 Y143.865 E.77502
G1 X151.528 Y143.182 E.03521
G1 X141.768 Y132.123 E.761
G2 X141.932 Y131.626 I-4.892 J-1.892 E.02699
G1 X151.528 Y142.5 E.74821
G1 X151.528 Y141.817 E.03521
G1 X142.078 Y131.109 E.73686
G2 X142.203 Y130.568 I-5.356 J-1.524 E.02864
G1 X151.528 Y141.135 E.72711
G1 X151.528 Y140.453 E.03521
G1 X142.307 Y130.004 E.71896
G2 X142.389 Y129.414 I-5.872 J-1.11 E.03075
G1 X151.528 Y139.77 E.71262
G1 X151.528 Y139.088 E.03521
G1 X142.444 Y128.794 E.70832
G2 X142.465 Y128.136 I-5.697 J-.514 E.03399
G1 X151.528 Y138.405 E.70666
G1 X151.528 Y137.723 E.03521
G1 X142.458 Y127.446 E.70718
G2 X142.403 Y126.7 I-22.295 J1.283 E.03855
G1 X151.528 Y137.041 E.7115
G1 X151.528 Y136.358 E.03521
G1 X142.288 Y125.888 E.72045
G2 X142.103 Y124.996 I-9.028 J1.407 E.04701
G1 X151.528 Y135.676 E.73486
G1 X151.528 Y134.993 E.03521
G1 X141.799 Y123.969 E.75861
G2 X141.293 Y122.714 I-12.201 J4.183 E.06982
G1 X151.528 Y134.311 E.798
G1 X151.528 Y133.629 E.03521
G1 X127.562 Y106.472 E1.86865
G1 X128.164 Y106.472 E.03107
G1 X151.528 Y132.946 E1.82169
G1 X151.528 Y132.264 E.03521
G1 X128.766 Y106.472 E1.77474
G1 X129.369 Y106.472 E.03107
G1 X151.528 Y131.582 E1.72778
G1 X151.528 Y130.899 E.03521
G1 X129.971 Y106.472 E1.68083
G1 X130.573 Y106.472 E.03107
G1 X151.528 Y130.217 E1.63387
G1 X151.528 Y129.534 E.03521
G1 X131.175 Y106.472 E1.58692
G1 X131.778 Y106.472 E.03107
G1 X151.528 Y128.852 E1.53996
G1 X151.528 Y128.17 E.03521
G1 X132.38 Y106.472 E1.49301
G1 X132.982 Y106.472 E.03107
G1 X151.528 Y127.487 E1.44606
G1 X151.528 Y126.805 E.03521
G1 X133.584 Y106.472 E1.3991
G1 X134.186 Y106.472 E.03107
G1 X151.528 Y126.122 E1.35215
G1 X151.528 Y125.44 E.03521
G1 X134.789 Y106.472 E1.30519
M73 P79 R2
G1 X135.391 Y106.472 E.03107
G1 X151.731 Y124.987 E1.27403
M106 S155.55
G1 X151.731 Y117.481 F30000
M106 S255
G1 F3000
G1 X147.612 Y112.814 E.32112
G3 X147.573 Y113.452 I-1.84 J.206 E.03313
G1 X151.528 Y117.934 E.3084
G1 X151.528 Y118.616 E.03521
G1 X147.427 Y113.968 E.31981
G3 X147.205 Y114.4 I-1.178 J-.332 E.02519
G1 X151.528 Y119.299 E.33708
G1 X151.528 Y119.981 E.03521
G1 X146.925 Y114.765 E.35892
G3 X146.593 Y115.071 I-.923 J-.668 E.02346
G1 X151.528 Y120.663 E.3848
G1 X151.528 Y121.346 E.03521
G1 X146.21 Y115.319 E.41469
G1 X145.77 Y115.503 E.0246
G1 X151.528 Y122.028 E.449
G1 X151.528 Y122.71 E.03521
G1 X145.258 Y115.606 E.48887
G1 X144.804 Y115.617 E.02345
G1 X144.641 Y115.588 E.00855
G1 X151.528 Y123.393 E.53703
G1 X151.528 Y124.075 E.03521
G1 X135.993 Y106.472 E1.21128
G1 X136.595 Y106.472 E.03107
G1 X142.384 Y113.031 E.45136
G1 X142.38 Y112.859 E.00891
G1 X142.447 Y112.42 E.02291
G1 X137.197 Y106.472 E.40928
G1 X137.8 Y106.472 E.03107
G1 X142.612 Y111.925 E.37524
G1 X142.849 Y111.511 E.0246
G1 X138.402 Y106.472 E.34677
G1 X139.004 Y106.472 E.03107
G1 X143.143 Y111.162 E.32272
G3 X143.488 Y110.871 I.893 J.708 E.02346
M73 P80 R2
G1 X139.606 Y106.472 E.30268
G1 X140.209 Y106.472 E.03107
G1 X143.885 Y110.638 E.28668
G3 X144.341 Y110.472 I.639 J1.044 E.02519
G1 X140.811 Y106.472 E.27525
G1 X141.413 Y106.472 E.03107
G1 X144.872 Y110.391 E.26968
G3 X145.517 Y110.439 I.203 J1.619 E.03359
G1 X142.015 Y106.472 E.27301
G1 X142.617 Y106.472 E.03107
G1 X151.528 Y116.569 E.69478
G1 X151.528 Y115.887 E.03521
G1 X143.22 Y106.472 E.64782
G1 X143.822 Y106.472 E.03107
G1 X151.528 Y115.204 E.60087
G1 X151.528 Y114.522 E.03521
G1 X144.424 Y106.472 E.55391
G1 X145.026 Y106.472 E.03107
G1 X151.528 Y113.839 E.50696
G1 X151.528 Y113.157 E.03521
G1 X145.628 Y106.472 E.46
G1 X146.231 Y106.472 E.03107
G1 X151.528 Y112.475 E.41305
G1 X151.528 Y111.792 E.03521
G1 X146.833 Y106.472 E.3661
G1 X147.435 Y106.472 E.03107
G1 X151.528 Y111.11 E.31914
G1 X151.528 Y110.427 E.03521
G1 X148.037 Y106.472 E.27219
G1 X148.64 Y106.472 E.03107
G1 X151.528 Y109.745 E.22523
G1 X151.528 Y109.063 E.03521
G1 X149.242 Y106.472 E.17828
G1 X149.844 Y106.472 E.03107
G1 X151.528 Y108.38 E.13132
G1 X151.528 Y107.698 E.03521
G1 X150.446 Y106.472 E.08437
G1 X151.048 Y106.472 E.03107
G1 X151.731 Y107.245 E.0532
M106 S155.55
; WIPE_START
G1 F24000
G1 X151.048 Y106.472 E-.39185
G1 X150.446 Y106.472 E-.22884
G1 X150.689 Y106.747 E-.13931
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.781 J-.933 P1  F30000
G1 X137.176 Y118.049 Z3
G1 Z2.6
M73 P81 R2
G1 E.8 F1800
M106 S255
G1 F3000
G1 X126.96 Y106.472 E.7966
G1 X126.358 Y106.472 E.03107
G1 X135.467 Y116.794 E.71027
G2 X134.485 Y116.364 I-6.297 J13.04 E.0553
G1 X125.755 Y106.472 E.68069
G1 X125.153 Y106.472 E.03107
G1 X133.623 Y116.07 E.66043
G2 X132.832 Y115.855 I-2.548 J7.826 E.04235
G1 X124.551 Y106.472 E.64565
G1 X123.949 Y106.472 E.03107
G1 X132.099 Y115.707 E.63549
G2 X131.412 Y115.611 I-1.311 J6.839 E.03583
G1 X123.347 Y106.472 E.62885
G1 X122.744 Y106.472 E.03107
G1 X130.76 Y115.554 E.62495
G2 X130.138 Y115.532 I-.535 J6.219 E.03212
G1 X122.142 Y106.472 E.62341
G1 X121.54 Y106.472 E.03107
G1 X129.542 Y115.539 E.62392
G2 X128.969 Y115.573 I.05 J5.755 E.02961
G1 X120.938 Y106.472 E.62622
G1 X120.335 Y106.472 E.03107
G1 X128.417 Y115.63 E.63014
G1 X127.886 Y115.71 E.02773
G1 X119.733 Y106.472 E.63565
G1 X119.131 Y106.472 E.03107
G1 X127.373 Y115.811 E.6426
G2 X126.875 Y115.93 I.942 J5.042 E.02639
G1 X118.529 Y106.472 E.65078
G1 X117.927 Y106.472 E.03107
G1 X126.393 Y116.065 E.66009
G2 X125.923 Y116.215 I1.274 J4.777 E.02544
G1 X117.324 Y106.472 E.67045
G1 X116.722 Y106.472 E.03107
G1 X125.467 Y116.381 E.68187
G2 X125.028 Y116.565 I1.623 J4.497 E.02461
G1 X116.12 Y106.472 E.69453
G1 X115.518 Y106.472 E.03107
G1 X124.599 Y116.762 E.70808
G2 X124.182 Y116.971 I1.887 J4.288 E.02411
G1 X114.916 Y106.472 E.72247
G1 X114.313 Y106.472 E.03107
G1 X123.775 Y117.193 E.73771
G2 X123.383 Y117.432 I2.197 J4.046 E.02367
G1 X113.711 Y106.472 E.75413
G1 X113.109 Y106.472 E.03107
G1 X123.001 Y117.681 E.77132
G2 X122.629 Y117.942 I2.426 J3.86 E.02345
G1 X112.507 Y106.472 E.78925
G1 X111.904 Y106.472 E.03107
G1 X115.386 Y110.416 E.27142
G1 X115.196 Y110.383 E.00993
G1 X114.763 Y110.394 E.02233
G1 X111.302 Y106.472 E.26987
G1 X110.7 Y106.472 E.03107
G1 X114.249 Y110.493 E.27669
G1 X114.164 Y110.512 E.00448
G1 X113.806 Y110.674 E.02027
G1 X110.098 Y106.472 E.28914
G1 X109.496 Y106.472 E.03107
G1 X113.421 Y110.919 E.30603
G2 X113.086 Y111.223 I.584 J.978 E.02345
G1 X108.893 Y106.472 E.32693
G1 X108.472 Y106.472 E.02175
G1 X108.472 Y106.676 E.01056
G1 X112.804 Y111.585 E.33778
G2 X112.578 Y112.012 I1.103 J.858 E.02501
G1 X108.472 Y107.359 E.32015
G1 X108.472 Y108.041 E.03521
G1 X112.431 Y112.528 E.30872
G1 X112.389 Y112.739 E.0111
G1 X112.389 Y113.162 E.02184
G1 X108.472 Y108.724 E.3054
G1 X108.472 Y109.406 E.03521
G1 X119.272 Y121.644 E.84212
G3 X119.521 Y121.244 I4.138 J2.29 E.02434
G1 X114.51 Y115.565 E.39074
G2 X115.15 Y115.608 I.427 J-1.562 E.03334
G1 X119.78 Y120.855 E.36104
G1 X120.051 Y120.479 E.02389
G1 X115.678 Y115.524 E.34099
G2 X116.13 Y115.355 I-.192 J-1.205 E.02511
G1 X120.336 Y120.12 E.32792
M73 P82 R2
G3 X120.632 Y119.773 I3.632 J2.784 E.02355
G1 X116.525 Y115.12 E.32017
G2 X116.868 Y114.826 I-.555 J-.995 E.02345
G1 X120.936 Y119.436 E.3172
G1 X121.253 Y119.112 E.02336
G1 X117.16 Y114.474 E.31912
G1 X117.359 Y114.148 E.01973
G1 X117.395 Y114.058 E.00499
G1 X121.582 Y118.802 E.32646
G3 X121.92 Y118.504 I3.162 J3.242 E.0233
G1 X117.552 Y113.554 E.34058
G2 X117.611 Y112.938 I-1.493 J-.454 E.03211
G1 X122.403 Y118.368 E.37357
M106 S155.55
; WIPE_START
G1 F24000
G1 X121.079 Y116.868 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.584 J-1.068 P1  F30000
G1 X108.269 Y109.859 Z3
G1 Z2.6
G1 E.8 F1800
M106 S255
G1 F3000
G1 X119.035 Y122.058 E.83941
G1 X118.814 Y122.49 E.02503
G1 X108.472 Y110.771 E.80636
G1 X108.472 Y111.453 E.03521
G1 X118.606 Y122.937 E.79016
G2 X118.412 Y123.399 I4.533 J2.177 E.02588
G1 X108.472 Y112.136 E.77502
G1 X108.472 Y112.818 E.03521
G1 X118.232 Y123.878 E.761
G2 X118.068 Y124.374 I4.893 J1.892 E.02699
G1 X108.472 Y113.5 E.74821
G1 X108.472 Y114.183 E.03521
G1 X117.922 Y124.891 E.73686
G2 X117.797 Y125.432 I5.355 J1.523 E.02864
G1 X108.472 Y114.865 E.72711
G1 X108.472 Y115.548 E.03521
G1 X117.693 Y125.996 E.71896
G2 X117.611 Y126.586 I5.872 J1.11 E.03075
G1 X108.472 Y116.23 E.71262
G1 X108.472 Y116.912 E.03521
G1 X117.556 Y127.206 E.70832
G2 X117.531 Y127.86 I6.542 J.577 E.03379
G1 X108.472 Y117.595 E.70638
G1 X108.472 Y118.277 E.03521
G1 X117.542 Y128.555 E.70718
G2 X117.597 Y129.3 I22.296 J-1.283 E.03855
G1 X108.472 Y118.959 E.7115
G1 X108.472 Y119.642 E.03521
G1 X117.712 Y130.112 E.72045
G2 X117.897 Y131.004 I9.028 J-1.407 E.04701
G1 X108.472 Y120.324 E.73487
G1 X108.472 Y121.007 E.03521
G1 X118.201 Y132.032 E.75862
G2 X118.707 Y133.286 I12.203 J-4.184 E.06982
G1 X108.472 Y121.689 E.79801
G1 X108.472 Y122.371 E.03521
G1 X132.438 Y149.528 E1.86864
G1 X133.04 Y149.528 E.03107
G1 X123.35 Y138.548 E.75551
G2 X124.533 Y139.206 I6.851 J-10.931 E.06982
G1 X133.642 Y149.528 E.71028
G1 X134.245 Y149.528 E.03107
G1 X125.514 Y139.636 E.68069
G2 X126.376 Y139.93 I3.38 J-8.489 E.04702
G1 X134.847 Y149.528 E.66043
G1 X135.449 Y149.528 E.03107
G1 X127.168 Y140.145 E.64565
G2 X127.901 Y140.293 I4.777 J-21.811 E.03855
G1 X136.051 Y149.528 E.63549
G1 X136.653 Y149.528 E.03107
G1 X128.588 Y140.389 E.62885
G2 X129.24 Y140.446 I.893 J-6.508 E.03379
G1 X137.256 Y149.528 E.62495
G1 X137.858 Y149.528 E.03107
G1 X129.862 Y140.468 E.62341
G2 X130.458 Y140.461 I.224 J-5.971 E.03075
G1 X138.46 Y149.528 E.62392
G1 X139.062 Y149.528 E.03107
G1 X131.031 Y140.427 E.62622
G2 X131.583 Y140.371 I-.293 J-5.558 E.02864
G1 X139.664 Y149.528 E.63013
M73 P83 R2
G1 X140.267 Y149.528 E.03107
G1 X132.114 Y140.29 E.63565
G2 X132.627 Y140.189 I-.756 J-5.191 E.02699
G1 X140.869 Y149.528 E.6426
G1 X141.471 Y149.528 E.03107
G1 X133.125 Y140.07 E.65078
G2 X133.607 Y139.935 I-1.114 J-4.904 E.02588
G1 X142.073 Y149.528 E.66009
G1 X142.676 Y149.528 E.03107
G1 X134.077 Y139.785 E.67045
G1 X134.533 Y139.619 E.02503
G1 X143.278 Y149.528 E.68187
G1 X143.88 Y149.528 E.03107
G1 X134.972 Y139.435 E.69453
G2 X135.401 Y139.238 I-1.758 J-4.39 E.02434
G1 X144.482 Y149.528 E.70808
G1 X145.084 Y149.528 E.03107
G1 X135.818 Y139.029 E.72247
G1 X136.225 Y138.807 E.02389
G1 X145.687 Y149.528 E.73771
G1 X146.289 Y149.528 E.03107
G1 X136.617 Y138.569 E.75413
G2 X136.999 Y138.319 I-2.311 J-3.951 E.02355
G1 X147.07 Y149.731 E.78525
M106 S155.55
G1 X132.014 Y149.731 F30000
M106 S255
G1 F3000
G1 X108.472 Y123.054 E1.83562
G1 X108.472 Y123.736 E.03521
G1 X131.233 Y149.528 E1.77473
G1 X130.631 Y149.528 E.03107
G1 X108.472 Y124.419 E1.72778
G1 X108.472 Y125.101 E.03521
G1 X130.029 Y149.528 E1.68082
G1 X129.427 Y149.528 E.03107
G1 X108.472 Y125.783 E1.63387
G1 X108.472 Y126.466 E.03521
G1 X128.825 Y149.528 E1.58691
G1 X128.222 Y149.528 E.03107
G1 X108.472 Y127.148 E1.53996
G1 X108.472 Y127.831 E.03521
G1 X127.62 Y149.528 E1.493
G1 X127.018 Y149.528 E.03107
G1 X108.472 Y128.513 E1.44605
G1 X108.472 Y129.195 E.03521
G1 X126.416 Y149.528 E1.39909
G1 X125.814 Y149.528 E.03107
G1 X108.472 Y129.878 E1.35214
G1 X108.472 Y130.56 E.03521
G1 X125.211 Y149.528 E1.30518
G1 X124.609 Y149.528 E.03107
G1 X108.472 Y131.242 E1.25823
G1 X108.472 Y131.925 E.03521
M73 P84 R2
G1 X124.007 Y149.528 E1.21127
G1 X123.405 Y149.528 E.03107
G1 X117.611 Y142.964 E.45171
G3 X117.548 Y143.574 I-1.543 J.149 E.03189
G1 X122.802 Y149.528 E.40968
G1 X122.2 Y149.528 E.03107
G1 X117.388 Y144.075 E.37522
G1 X117.151 Y144.489 E.0246
G1 X121.598 Y149.528 E.34676
G1 X120.996 Y149.528 E.03107
G1 X116.857 Y144.838 E.32272
G3 X116.512 Y145.129 I-.893 J-.708 E.02346
G1 X120.394 Y149.528 E.30268
G1 X119.791 Y149.528 E.03107
G1 X116.115 Y145.362 E.28668
G3 X115.659 Y145.528 I-.639 J-1.044 E.02519
G1 X119.189 Y149.528 E.27524
G1 X118.587 Y149.528 E.03107
G1 X115.128 Y145.609 E.26968
G3 X114.483 Y145.561 I-.203 J-1.619 E.03359
G1 X117.985 Y149.528 E.27301
G1 X117.383 Y149.528 E.03107
G1 X108.472 Y139.431 E.69477
G1 X108.472 Y138.749 E.03521
G1 X112.389 Y143.187 E.3054
G1 X112.389 Y142.739 E.02313
G1 X112.427 Y142.548 E.01002
G1 X108.472 Y138.066 E.3084
G1 X108.472 Y137.384 E.03521
G1 X112.571 Y142.029 E.31962
G3 X112.795 Y141.6 I1.335 J.425 E.02508
G1 X108.472 Y136.702 E.33707
G1 X108.472 Y136.019 E.03521
M73 P84 R1
G1 X113.075 Y141.235 E.35892
G3 X113.407 Y140.929 I.923 J.668 E.02346
G1 X108.472 Y135.337 E.3848
G1 X108.472 Y134.654 E.03521
G1 X113.79 Y140.681 E.41468
G1 X114.23 Y140.497 E.0246
M73 P85 R1
G1 X108.472 Y133.972 E.44899
G1 X108.472 Y133.29 E.03521
G1 X114.742 Y140.394 E.48887
G1 X115.196 Y140.383 E.02345
G1 X115.359 Y140.412 E.00855
G1 X108.269 Y132.378 E.55281
M106 S155.55
G1 X109.13 Y149.731 F30000
M106 S255
G1 F3000
G1 X108.472 Y148.985 E.05134
G1 X108.472 Y148.302 E.03521
G1 X109.554 Y149.528 E.08436
G1 X110.156 Y149.528 E.03107
G1 X108.472 Y147.62 E.13131
G1 X108.472 Y146.937 E.03521
G1 X110.758 Y149.528 E.17827
G1 X111.36 Y149.528 E.03107
G1 X108.472 Y146.255 E.22522
G1 X108.472 Y145.573 E.03521
G1 X111.963 Y149.528 E.27218
G1 X112.565 Y149.528 E.03107
G1 X108.472 Y144.89 E.31913
G1 X108.472 Y144.208 E.03521
G1 X113.167 Y149.528 E.36609
G1 X113.769 Y149.528 E.03107
G1 X108.472 Y143.525 E.41304
G1 X108.472 Y142.843 E.03521
G1 X114.371 Y149.528 E.46
G1 X114.974 Y149.528 E.03107
G1 X108.472 Y142.161 E.50695
G1 X108.472 Y141.478 E.03521
G1 X115.576 Y149.528 E.55391
G1 X116.178 Y149.528 E.03107
G1 X108.472 Y140.796 E.60086
G1 X108.472 Y140.114 E.03521
G1 X116.959 Y149.731 E.66175
M106 S155.55
M106 S237.15
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X115.636 Y148.231 E-.76
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
G3 Z3 I.837 J.883 P1  F30000
G1 X141.369 Y123.852 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X141.372 Y123.861 E.00031
G3 X118.822 Y123.366 I-11.371 J4.138 E1.55881
G1 X118.822 Y123.366 E0
G3 X129.698 Y115.901 I11.178 J4.631 E.46282
G3 X141.152 Y123.299 I.302 J12.097 E.48046
G1 X141.347 Y123.796 E.01771
G1 X141.004 Y123.995 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X141.189 Y124.549 E.01793
G3 X129.708 Y116.294 I-11.189 J3.449 E1.79395
G1 X130.292 Y116.294 E.01794
G3 X140.983 Y123.94 I-.292 J11.705 E.42881
M204 S10000
; WIPE_START
G1 F24000
G1 X141.189 Y124.549 E-.24416
G1 X141.348 Y125.11 E-.22187
G1 X141.478 Y125.68 E-.22186
G1 X141.511 Y125.867 E-.07211
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.45 J-1.131 P1  F30000
M73 P86 R1
G1 X113.623 Y114.779 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X113.597 Y114.759 E.0011
G3 X114.72 Y110.765 I1.403 J-1.761 E.17507
G1 X114.944 Y110.748 E.00745
G3 X113.973 Y115.002 I.056 J2.251 E.27184
G1 X113.674 Y114.812 E.01178
G1 X113.841 Y114.455 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X113.841 Y114.453 E.00007
G3 X114.769 Y111.154 I1.159 J-1.454 E.13391
G1 X114.954 Y111.14 E.0057
G3 X114.152 Y114.653 I.046 J1.859 E.20793
G1 X113.892 Y114.487 E.0095
M204 S10000
; WIPE_START
G1 F24000
G1 X113.841 Y114.453 E-.02317
G1 X113.575 Y114.196 E-.1407
G1 X113.366 Y113.89 E-.14077
G1 X113.222 Y113.548 E-.14077
G1 X113.149 Y113.185 E-.14071
G1 X113.142 Y112.905 E-.10652
G1 X113.169 Y112.73 E-.06736
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.207 J.154 P1  F30000
G1 X116.877 Y141.76 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X117.075 Y142.125 E.01377
G3 X114.72 Y140.765 I-2.075 J.873 E.37238
G1 X114.944 Y140.748 E.00745
G3 X116.846 Y141.71 I.056 J2.251 E.07364
G1 X116.634 Y142.13 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X116.713 Y142.278 E.00514
G3 X114.769 Y141.154 I-1.714 J.721 E.28483
G1 X114.954 Y141.14 E.0057
G3 X116.537 Y141.952 I.046 J1.859 E.057
G1 X116.605 Y142.078 E.00439
M204 S10000
; WIPE_START
G1 F24000
G1 X116.713 Y142.278 E-.08642
G1 X116.823 Y142.631 E-.14074
G1 X116.86 Y142.989 E-.13643
G1 X116.839 Y143.277 E-.10999
G1 X116.748 Y143.636 E-.14077
G1 X116.587 Y143.97 E-.14077
G1 X116.58 Y143.98 E-.00489
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.073 J1.215 P1  F30000
G1 X142.828 Y142.413 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X142.971 Y142.023 E.01377
G3 X144.72 Y140.765 I2.029 J.976 E.07452
G1 X144.944 Y140.748 E.00745
G3 X142.811 Y142.47 I.056 J2.251 E.37149
G1 X143.196 Y142.546 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.198 Y142.541 E.00016
G3 X144.769 Y141.154 I1.802 J.458 E.0684
G1 X144.954 Y141.14 E.0057
G3 X143.143 Y142.905 I.046 J1.859 E.2735
G1 X143.188 Y142.606 E.0093
M204 S10000
; WIPE_START
G1 F24000
G1 X143.198 Y142.541 E-.02482
G1 X143.324 Y142.193 E-.14074
G1 X143.517 Y141.877 E-.14077
G1 X143.769 Y141.605 E-.14077
G1 X144.07 Y141.389 E-.14076
G1 X144.408 Y141.237 E-.14078
G1 X144.488 Y141.218 E-.03136
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.216 J-.054 P1  F30000
G1 X143.298 Y114.471 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X143.276 Y114.447 E.0011
G3 X144.72 Y110.765 I1.724 J-1.448 E.16018
G1 X144.944 Y110.748 E.00745
G3 X143.597 Y114.759 I.056 J2.251 E.28673
G1 X143.341 Y114.513 E.01178
G1 X143.574 Y114.195 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X143.368 Y113.889 E.01134
G3 X144.769 Y111.154 I1.632 J-.89 E.11113
G1 X144.954 Y111.14 E.0057
G3 X143.614 Y114.238 I.046 J1.859 E.22893
M204 S10000
; WIPE_START
G1 F24000
G1 X143.368 Y113.889 E-.1625
G1 X143.222 Y113.548 E-.1407
G1 X143.149 Y113.185 E-.14072
G1 X143.142 Y112.905 E-.10652
G1 X143.197 Y112.541 E-.13995
G1 X143.26 Y112.369 E-.06961
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.186 J.273 P1  F30000
G1 X151.898 Y149.898 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X108.102 Y149.898 E1.45279
G1 X108.102 Y106.102 E1.45279
G1 X151.898 Y106.102 E1.45279
G1 X151.898 Y149.838 E1.4508
G1 X152.29 Y150.29 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.719 J.982 P1  F30000
G1 X150.971 Y149.734 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.420388
G1 F15000
G1 X151.565 Y149.141 E.02581
G1 X151.565 Y148.607 E.01642
G1 X150.607 Y149.565 E.04165
G1 X150.073 Y149.565 E.01642
G1 X151.565 Y148.073 E.06487
G1 X151.565 Y147.539 E.01642
G1 X149.539 Y149.565 E.08809
G1 X149.006 Y149.565 E.01642
G1 X151.565 Y147.006 E.11132
G1 X151.565 Y146.472 E.01642
G1 X148.472 Y149.565 E.13454
G1 X147.938 Y149.565 E.01642
G1 X151.565 Y145.938 E.15776
G1 X151.565 Y145.404 E.01642
G1 X147.404 Y149.565 E.18098
G1 X146.87 Y149.565 E.01642
G1 X151.565 Y144.87 E.2042
G1 X151.565 Y144.337 E.01642
G1 X146.337 Y149.565 E.22742
G1 X145.803 Y149.565 E.01642
G1 X151.565 Y143.803 E.25064
G1 X151.565 Y143.269 E.01642
G1 X145.269 Y149.565 E.27386
G1 X144.735 Y149.565 E.01642
G1 X151.565 Y142.735 E.29708
G1 X151.565 Y142.201 E.01642
G1 X144.201 Y149.565 E.3203
G1 X143.667 Y149.565 E.01642
G1 X151.565 Y141.667 E.34353
G1 X151.565 Y141.134 E.01642
G1 X143.134 Y149.565 E.36675
G1 X142.6 Y149.565 E.01642
G1 X151.565 Y140.6 E.38997
G1 X151.565 Y140.066 E.01642
G1 X142.066 Y149.565 E.41319
G1 X141.532 Y149.565 E.01642
G1 X145.59 Y145.506 E.17653
G3 X144.987 Y145.576 I-.474 J-1.458 E.01881
G1 X140.998 Y149.565 E.1735
G1 X140.465 Y149.565 E.01642
G1 X144.502 Y145.527 E.17564
G3 X144.087 Y145.408 I.087 J-1.086 E.01336
G1 X139.931 Y149.565 E.18082
G1 X139.397 Y149.565 E.01642
G1 X143.722 Y145.24 E.18813
G1 X143.397 Y145.03 E.01188
G1 X138.863 Y149.565 E.19725
G1 X138.329 Y149.565 E.01642
G1 X143.125 Y144.768 E.20863
G3 X142.888 Y144.473 I.613 J-.736 E.01176
G1 X137.795 Y149.565 E.22151
G1 X137.262 Y149.565 E.01642
G1 X142.686 Y144.14 E.23597
G1 X142.528 Y143.765 E.01253
G1 X136.728 Y149.565 E.2523
G1 X136.194 Y149.565 E.01642
G1 X142.438 Y143.321 E.27161
G1 X142.426 Y142.799 E.01606
G1 X135.66 Y149.565 E.29432
G1 X135.126 Y149.565 E.01642
G1 X142.585 Y142.106 E.32447
G1 X142.669 Y141.877 E.00748
G1 X142.937 Y141.438 E.01585
M73 P87 R1
G1 X143.288 Y141.06 E.01585
G1 X143.706 Y140.759 E.01585
G1 X144.118 Y140.573 E.01389
G1 X151.565 Y133.126 E.32394
G1 X151.565 Y133.66 E.01642
G1 X144.795 Y140.429 E.29446
G1 X145.193 Y140.419 E.01225
G1 X145.317 Y140.441 E.00387
G1 X151.565 Y134.194 E.27176
G1 X151.565 Y134.728 E.01642
G1 X145.76 Y140.532 E.25249
G1 X146.144 Y140.683 E.01267
G1 X151.565 Y135.262 E.23582
G1 X151.565 Y135.795 E.01642
G1 X146.474 Y140.886 E.22146
G3 X146.767 Y141.127 I-.447 J.846 E.01175
G1 X151.565 Y136.329 E.20869
G1 X151.565 Y136.863 E.01642
G1 X147.026 Y141.401 E.19741
G1 X147.243 Y141.719 E.01182
G1 X151.565 Y137.397 E.188
G1 X151.565 Y137.931 E.01642
G1 X147.409 Y142.086 E.18076
G3 X147.526 Y142.503 I-.972 J.499 E.0134
G1 X151.565 Y138.465 E.17566
G1 X151.565 Y138.998 E.01642
G1 X147.58 Y142.983 E.17334
G1 X147.583 Y143.14 E.00481
G1 X147.517 Y143.58 E.01371
G1 X151.734 Y139.362 E.18347
; WIPE_START
G1 F24000
G1 X150.32 Y140.777 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.118 J-1.211 P1  F30000
G1 X123.08 Y138.123 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F15000
G1 X117.475 Y143.728 E.2438
G1 X117.508 Y143.639 E.00291
G1 X117.582 Y143.087 E.01712
G1 X122.645 Y138.024 E.22023
G1 X122.341 Y137.794 E.01172
G1 X117.544 Y142.591 E.20866
G1 X117.473 Y142.237 E.0111
G1 X117.441 Y142.161 E.00255
G1 X122.047 Y137.555 E.20036
G3 X121.757 Y137.311 I2.302 J-3.023 E.01166
G1 X117.282 Y141.785 E.19465
G1 X117.069 Y141.464 E.01185
G1 X121.48 Y137.054 E.19186
G3 X121.209 Y136.791 I2.493 J-2.851 E.01162
G1 X116.821 Y141.179 E.19087
G2 X116.538 Y140.928 I-.762 J.574 E.01171
G1 X120.945 Y136.521 E.19171
G3 X120.692 Y136.241 I2.684 J-2.679 E.01163
G1 X116.214 Y140.719 E.1948
G1 X115.836 Y140.562 E.01256
G1 X120.443 Y135.955 E.2004
G1 X120.206 Y135.658 E.01168
G1 X115.407 Y140.457 E.20875
G2 X114.904 Y140.427 I-.327 J1.23 E.01561
G1 X119.976 Y135.355 E.22064
G1 X119.753 Y135.044 E.01176
G1 X114.272 Y140.525 E.23842
G1 X114.176 Y140.547 E.00303
G1 X113.706 Y140.759 E.01585
G1 X113.288 Y141.06 E.01585
G1 X112.937 Y141.438 E.01585
G1 X112.669 Y141.877 E.01585
G1 X112.525 Y142.272 E.01293
G1 X108.435 Y146.362 E.17789
G1 X108.435 Y146.896 E.01642
G1 X112.418 Y142.913 E.17324
G2 X112.456 Y143.409 I1.408 J.142 E.01538
G1 X108.435 Y147.429 E.17488
G1 X108.435 Y147.963 E.01642
G1 X112.559 Y143.839 E.17939
G1 X112.718 Y144.215 E.01253
G1 X108.435 Y148.497 E.18628
G1 X108.435 Y149.031 E.01642
G1 X112.931 Y144.536 E.19554
G2 X113.179 Y144.821 I.83 J-.472 E.01172
G1 X108.435 Y149.565 E.20635
G1 X108.969 Y149.565 E.01642
G1 X113.462 Y145.072 E.19543
G1 X113.786 Y145.281 E.01188
G1 X109.503 Y149.565 E.18632
G1 X110.037 Y149.565 E.01642
G1 X114.164 Y145.438 E.17952
G2 X114.592 Y145.543 I.474 J-1.008 E.01367
G1 X110.571 Y149.565 E.17495
G1 X111.104 Y149.565 E.01642
G1 X115.096 Y145.573 E.17362
G1 X115.322 Y145.568 E.00696
G1 X115.728 Y145.475 E.01281
G1 X111.638 Y149.565 E.1779
G1 X112.172 Y149.565 E.01642
G1 X123.276 Y138.46 E.48303
G1 X123.608 Y138.663 E.01194
G1 X112.706 Y149.565 E.47422
G1 X113.24 Y149.565 E.01642
G1 X123.946 Y138.859 E.46571
G1 X124.291 Y139.047 E.0121
G1 X113.774 Y149.565 E.45752
G1 X114.307 Y149.565 E.01642
G1 X124.65 Y139.222 E.44991
G2 X125.016 Y139.39 I1.868 J-3.578 E.01238
G1 X114.841 Y149.565 E.44259
G1 X115.375 Y149.565 E.01642
G1 X125.391 Y139.548 E.4357
G2 X125.78 Y139.694 I1.649 J-3.821 E.01277
G1 X115.909 Y149.565 E.42939
G1 X116.443 Y149.565 E.01642
G1 X126.177 Y139.83 E.42343
G1 X126.585 Y139.956 E.01313
G1 X116.976 Y149.565 E.41796
G1 X117.51 Y149.565 E.01642
G1 X127.008 Y140.067 E.41316
G2 X127.442 Y140.166 I1.215 J-4.302 E.01371
G1 X118.044 Y149.565 E.40883
G1 X118.578 Y149.565 E.01642
G1 X127.889 Y140.254 E.40501
G1 X128.352 Y140.324 E.01443
G1 X119.112 Y149.565 E.40197
G1 X119.646 Y149.565 E.01642
G1 X128.833 Y140.377 E.39966
G2 X129.33 Y140.414 I.617 J-4.964 E.01534
G1 X120.179 Y149.565 E.39806
G1 X120.713 Y149.565 E.01642
G1 X129.846 Y140.432 E.39728
G2 X130.384 Y140.428 I.232 J-5.386 E.01654
G1 X121.247 Y149.565 E.39744
G1 X121.781 Y149.565 E.01642
G1 X130.946 Y140.399 E.3987
G1 X131.539 Y140.34 E.01834
G1 X122.315 Y149.565 E.40128
G1 X122.848 Y149.565 E.01642
G1 X132.168 Y140.245 E.4054
G2 X132.842 Y140.105 I-1.068 J-6.824 E.02118
G1 X123.382 Y149.565 E.4115
G1 X123.916 Y149.565 E.01642
G1 X133.573 Y139.908 E.42008
G2 X134.379 Y139.636 I-2.319 J-8.206 E.02616
G1 X124.45 Y149.565 E.4319
G1 X124.984 Y149.565 E.01642
G1 X135.305 Y139.244 E.44896
G2 X136.462 Y138.621 I-5.375 J-11.366 E.04043
G1 X125.348 Y149.734 E.48344
G1 X134.423 Y149.734 F30000
G1 F15000
G1 X151.565 Y132.593 E.74566
G1 X151.565 Y132.059 E.01642
G1 X134.059 Y149.565 E.7615
G1 X133.525 Y149.565 E.01642
G1 X151.565 Y131.525 E.78472
G1 X151.565 Y130.991 E.01642
G1 X132.991 Y149.565 E.80794
G1 X132.457 Y149.565 E.01642
G1 X151.565 Y130.457 E.83117
G1 X151.565 Y129.923 E.01642
G1 X131.923 Y149.565 E.85439
G1 X131.39 Y149.565 E.01642
G1 X151.565 Y129.39 E.87761
G1 X151.565 Y128.856 E.01642
G1 X130.856 Y149.565 E.90083
G1 X130.322 Y149.565 E.01642
G1 X151.565 Y128.322 E.92405
G1 X151.565 Y127.788 E.01642
G1 X129.788 Y149.565 E.94727
G1 X129.254 Y149.565 E.01642
G1 X151.565 Y127.254 E.97049
G1 X151.565 Y126.72 E.01642
G1 X128.72 Y149.565 E.99371
G1 X128.187 Y149.565 E.01642
G1 X151.565 Y126.187 E1.01693
G1 X151.565 Y125.653 E.01642
G1 X127.653 Y149.565 E1.04015
G1 X127.119 Y149.565 E.01642
G1 X151.565 Y125.119 E1.06338
G1 X151.565 Y124.585 E.01642
G1 X126.585 Y149.565 E1.0866
G1 X126.051 Y149.565 E.01642
G1 X151.565 Y124.051 E1.10982
G1 X151.565 Y123.518 E.01642
G1 X140.629 Y134.453 E.47568
G2 X141.246 Y133.302 I-12.476 J-7.429 E.04017
G1 X151.565 Y122.984 E.44884
G1 X151.565 Y122.45 E.01642
G1 X141.637 Y132.378 E.43186
G2 X141.91 Y131.571 I-14.79 J-5.453 E.0262
G1 X151.565 Y121.916 E.41999
G1 X151.565 Y121.382 E.01642
G1 X142.102 Y130.845 E.41161
G2 X142.24 Y130.173 I-6.664 J-1.721 E.02111
G1 X151.565 Y120.848 E.4056
G1 X151.565 Y120.315 E.01642
G1 X142.336 Y129.544 E.40146
G2 X142.395 Y128.95 I-5.918 J-.897 E.01836
G1 X151.565 Y119.781 E.39886
G1 X151.565 Y119.247 E.01642
G1 X142.426 Y128.386 E.39753
G2 X142.432 Y127.846 I-5.403 J-.328 E.01661
G1 X151.565 Y118.713 E.39728
G1 X151.565 Y118.179 E.01642
G1 X142.416 Y127.328 E.39795
G1 X142.379 Y126.831 E.01532
G1 X151.565 Y117.646 E.39957
G1 X151.565 Y117.112 E.01642
G1 X142.323 Y126.354 E.40202
G2 X142.252 Y125.891 I-4.672 J.48 E.01441
G1 X151.565 Y116.578 E.40511
G1 X151.565 Y116.044 E.01642
G1 X142.167 Y125.441 E.40877
G1 X142.068 Y125.007 E.01371
G1 X151.565 Y115.51 E.41309
G1 X151.565 Y114.976 E.01642
G1 X141.954 Y124.587 E.41805
M73 P88 R1
G2 X141.83 Y124.177 I-4.169 J1.037 E.01318
G1 X151.565 Y114.443 E.42344
G1 X151.565 Y113.909 E.01642
G1 X141.696 Y123.777 E.42928
G2 X141.547 Y123.393 I-3.929 J1.303 E.01269
G1 X151.565 Y113.375 E.43577
G1 X151.565 Y112.841 E.01642
G1 X141.39 Y123.016 E.4426
G1 X141.224 Y122.648 E.01241
G1 X151.565 Y112.307 E.44982
G1 X151.565 Y111.774 E.01642
G1 X141.045 Y122.293 E.45761
G2 X140.859 Y121.945 I-3.582 J1.684 E.01214
G1 X151.565 Y111.24 E.46568
G1 X151.565 Y110.706 E.01642
G1 X140.664 Y121.607 E.47418
G2 X140.458 Y121.279 I-3.391 J1.897 E.01192
G1 X151.565 Y110.172 E.48313
G1 X151.565 Y109.638 E.01642
G1 X147.475 Y113.728 E.17788
G1 X147.508 Y113.639 E.00291
G1 X147.582 Y113.087 E.01712
G1 X151.565 Y109.104 E.17324
G1 X151.565 Y108.571 E.01642
G1 X147.544 Y112.591 E.17488
G1 X147.473 Y112.237 E.0111
G1 X147.441 Y112.161 E.00255
G1 X151.565 Y108.037 E.1794
G1 X151.565 Y107.503 E.01642
G1 X147.282 Y111.785 E.18628
G1 X147.069 Y111.464 E.01185
G1 X151.565 Y106.969 E.19554
G1 X151.565 Y106.435 E.01642
G1 X146.821 Y111.179 E.20635
G2 X146.538 Y110.928 I-.762 J.574 E.01171
G1 X151.031 Y106.435 E.19543
G1 X150.497 Y106.435 E.01642
G1 X146.214 Y110.719 E.18632
G1 X145.836 Y110.562 E.01256
G1 X149.963 Y106.435 E.17951
G1 X149.429 Y106.435 E.01642
G1 X145.407 Y110.457 E.17495
G2 X144.904 Y110.427 I-.327 J1.23 E.01561
G1 X148.896 Y106.435 E.17362
G1 X148.362 Y106.435 E.01642
G1 X144.272 Y110.525 E.1779
G1 X144.176 Y110.547 E.00303
G1 X143.706 Y110.759 E.01585
G1 X143.288 Y111.06 E.01585
G1 X142.937 Y111.437 E.01585
G1 X142.669 Y111.877 E.01585
G1 X142.525 Y112.272 E.01293
G1 X137.041 Y117.756 E.23855
G3 X137.355 Y117.976 I-2.305 J3.638 E.0118
G1 X142.418 Y112.913 E.22023
G2 X142.456 Y113.409 I1.408 J.142 E.01538
G1 X137.659 Y118.206 E.20866
G3 X137.953 Y118.445 I-2.251 J3.07 E.01168
G1 X142.559 Y113.839 E.20036
G1 X142.718 Y114.215 E.01253
G1 X138.243 Y118.689 E.19465
G1 X138.52 Y118.946 E.01162
G1 X142.931 Y114.536 E.19186
G2 X143.179 Y114.821 I.83 J-.472 E.01172
G1 X138.791 Y119.209 E.19087
G1 X139.055 Y119.479 E.01161
G1 X143.462 Y115.072 E.19171
G1 X143.786 Y115.281 E.01188
G1 X139.308 Y119.759 E.19479
G3 X139.557 Y120.045 I-2.733 J2.632 E.01164
G1 X144.164 Y115.438 E.2004
G2 X144.592 Y115.543 I.474 J-1.008 E.01367
G1 X139.794 Y120.342 E.20875
G3 X140.024 Y120.645 I-2.928 J2.457 E.01173
G1 X145.096 Y115.573 E.22063
G1 X145.322 Y115.568 E.00695
G1 X145.728 Y115.475 E.01281
G1 X140.125 Y121.078 E.24371
; WIPE_START
G1 F24000
G1 X141.54 Y119.663 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I1.096 J.528 P1  F30000
G1 X147.998 Y106.266 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F15000
G1 X136.724 Y117.54 E.49041
G1 X136.392 Y117.337 E.01194
G1 X147.294 Y106.435 E.47422
G1 X146.76 Y106.435 E.01642
G1 X136.054 Y117.141 E.46571
G1 X135.709 Y116.953 E.0121
G1 X146.226 Y106.435 E.45752
G1 X145.693 Y106.435 E.01642
G1 X135.35 Y116.778 E.44991
G2 X134.984 Y116.61 I-1.868 J3.578 E.01238
G1 X145.159 Y106.435 E.44259
G1 X144.625 Y106.435 E.01642
G1 X134.609 Y116.452 E.4357
G2 X134.22 Y116.306 I-1.649 J3.82 E.01277
G1 X144.091 Y106.435 E.42939
G1 X143.557 Y106.435 E.01642
G1 X133.823 Y116.17 E.42343
G1 X133.415 Y116.044 E.01313
G1 X143.023 Y106.435 E.41796
G1 X142.49 Y106.435 E.01642
G1 X132.992 Y115.933 E.41316
G2 X132.557 Y115.834 I-1.215 J4.301 E.01371
G1 X141.956 Y106.435 E.40883
G1 X141.422 Y106.435 E.01642
G1 X132.111 Y115.746 E.40501
G1 X131.647 Y115.676 E.01443
G1 X140.888 Y106.435 E.40197
G1 X140.354 Y106.435 E.01642
G1 X131.167 Y115.623 E.39966
G2 X130.67 Y115.586 I-.617 J4.963 E.01534
G1 X139.821 Y106.435 E.39806
G1 X139.287 Y106.435 E.01642
G1 X130.154 Y115.568 E.39728
G2 X129.616 Y115.572 I-.232 J5.387 E.01654
G1 X138.753 Y106.435 E.39744
G1 X138.219 Y106.435 E.01642
G1 X129.054 Y115.601 E.3987
G1 X128.46 Y115.66 E.01834
G1 X137.685 Y106.435 E.40128
G1 X137.151 Y106.435 E.01642
G1 X127.832 Y115.755 E.4054
G2 X127.158 Y115.895 I1.068 J6.824 E.02118
G1 X136.618 Y106.435 E.4115
G1 X136.084 Y106.435 E.01642
G1 X126.427 Y116.092 E.42008
G2 X125.621 Y116.364 I2.319 J8.206 E.02616
G1 X135.55 Y106.435 E.4319
G1 X135.016 Y106.435 E.01642
G1 X124.695 Y116.757 E.44897
G2 X123.538 Y117.38 I5.374 J11.365 E.04043
G1 X134.482 Y106.435 E.47607
G1 X133.949 Y106.435 E.01642
G1 X108.435 Y131.949 E1.10981
G1 X108.435 Y132.482 E.01642
G1 X119.371 Y121.547 E.47568
G2 X118.755 Y122.697 I12.173 J7.261 E.04013
G1 X108.435 Y133.016 E.44889
G1 X108.435 Y133.55 E.01642
G1 X118.363 Y123.622 E.43186
G2 X118.09 Y124.429 I14.792 J5.454 E.0262
G1 X108.435 Y134.084 E.41999
G1 X108.435 Y134.618 E.01642
G1 X117.898 Y125.155 E.41161
G2 X117.76 Y125.827 I6.664 J1.721 E.02111
G1 X108.435 Y135.151 E.4056
G1 X108.435 Y135.685 E.01642
G1 X117.664 Y126.456 E.40146
G2 X117.605 Y127.05 I5.918 J.897 E.01836
G1 X108.435 Y136.219 E.39886
G1 X108.435 Y136.753 E.01642
G1 X117.574 Y127.614 E.39753
G2 X117.568 Y128.154 I5.402 J.328 E.01661
G1 X108.435 Y137.287 E.39728
G1 X108.435 Y137.821 E.01642
G1 X117.584 Y128.672 E.39795
G1 X117.621 Y129.169 E.01532
G1 X108.435 Y138.354 E.39957
G1 X108.435 Y138.888 E.01642
G1 X117.677 Y129.646 E.40202
G2 X117.748 Y130.109 I4.673 J-.48 E.01441
G1 X108.435 Y139.422 E.40511
G1 X108.435 Y139.956 E.01642
G1 X117.833 Y130.559 E.40877
G1 X117.932 Y130.993 E.01371
G1 X108.435 Y140.49 E.41309
G1 X108.435 Y141.023 E.01642
G1 X118.046 Y131.413 E.41805
G2 X118.17 Y131.823 I4.168 J-1.037 E.01318
G1 X108.435 Y141.557 E.42344
G1 X108.435 Y142.091 E.01642
G1 X118.304 Y132.222 E.42928
G2 X118.453 Y132.607 I3.926 J-1.302 E.01269
G1 X108.435 Y142.625 E.43577
G1 X108.435 Y143.159 E.01642
G1 X118.61 Y132.984 E.4426
G1 X118.776 Y133.352 E.01241
G1 X108.435 Y143.693 E.44982
M73 P89 R1
G1 X108.435 Y144.226 E.01642
G1 X118.955 Y133.707 E.45761
G2 X119.141 Y134.055 I3.581 J-1.684 E.01214
G1 X108.435 Y144.76 E.46568
G1 X108.435 Y145.294 E.01642
G1 X119.336 Y134.393 E.47418
G2 X119.542 Y134.721 I3.39 J-1.896 E.01192
G1 X108.266 Y145.998 E.49051
G1 X108.266 Y131.584 F30000
G1 F15000
G1 X133.415 Y106.435 E1.09397
G1 X132.881 Y106.435 E.01642
G1 X108.435 Y130.881 E1.06337
G1 X108.435 Y130.347 E.01642
G1 X132.347 Y106.435 E1.04015
G1 X131.813 Y106.435 E.01642
G1 X108.435 Y129.813 E1.01693
G1 X108.435 Y129.279 E.01642
G1 X131.279 Y106.435 E.99371
G1 X130.746 Y106.435 E.01642
G1 X108.435 Y128.746 E.97049
G1 X108.435 Y128.212 E.01642
G1 X130.212 Y106.435 E.94727
G1 X129.678 Y106.435 E.01642
G1 X108.435 Y127.678 E.92405
G1 X108.435 Y127.144 E.01642
G1 X129.144 Y106.435 E.90083
G1 X128.61 Y106.435 E.01642
G1 X108.435 Y126.61 E.8776
G1 X108.435 Y126.077 E.01642
G1 X128.077 Y106.435 E.85438
G1 X127.543 Y106.435 E.01642
G1 X108.435 Y125.543 E.83116
G1 X108.435 Y125.009 E.01642
G1 X127.009 Y106.435 E.80794
G1 X126.475 Y106.435 E.01642
G1 X108.435 Y124.475 E.78472
G1 X108.435 Y123.941 E.01642
G1 X125.941 Y106.435 E.7615
G1 X125.407 Y106.435 E.01642
G1 X108.435 Y123.407 E.73828
G1 X108.435 Y122.874 E.01642
G1 X115.882 Y115.427 E.32393
G1 X115.322 Y115.568 E.01777
G1 X115.205 Y115.571 E.00361
G1 X108.435 Y122.34 E.29446
G1 X108.435 Y121.806 E.01642
G1 X114.683 Y115.559 E.27175
G1 X114.24 Y115.468 E.01391
G1 X108.435 Y121.272 E.25249
G1 X108.435 Y120.738 E.01642
G1 X113.856 Y115.317 E.23581
G1 X113.526 Y115.113 E.01193
G1 X108.435 Y120.204 E.22146
G1 X108.435 Y119.671 E.01642
G1 X113.233 Y114.873 E.20869
G3 X112.974 Y114.599 I.549 J-.779 E.01169
G1 X108.435 Y119.137 E.19741
G1 X108.435 Y118.603 E.01642
G1 X112.757 Y114.281 E.188
G1 X112.591 Y113.914 E.01241
G1 X108.435 Y118.069 E.18076
G1 X108.435 Y117.535 E.01642
G1 X112.474 Y113.497 E.17566
G3 X112.42 Y113.017 I1.319 J-.389 E.01495
G1 X108.435 Y117.002 E.17334
G1 X108.435 Y116.468 E.01642
G1 X112.748 Y112.155 E.18759
; WIPE_START
G1 F24000
G1 X111.334 Y113.569 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.146 J1.208 P1  F30000
G1 X117.049 Y114.26 Z3.2
G1 Z2.8
G1 E.8 F1800
G1 F15000
G1 X124.874 Y106.435 E.34039
G1 X124.34 Y106.435 E.01642
G1 X117.574 Y113.201 E.29431
G1 X117.562 Y112.679 E.01606
G1 X123.806 Y106.435 E.2716
G1 X123.272 Y106.435 E.01642
G1 X117.472 Y112.235 E.2523
G1 X117.314 Y111.86 E.01253
G1 X122.738 Y106.435 E.23597
G1 X122.205 Y106.435 E.01642
G1 X117.112 Y111.527 E.2215
G2 X116.875 Y111.231 I-.851 J.44 E.01176
G1 X121.671 Y106.435 E.20863
G1 X121.137 Y106.435 E.01642
G1 X116.602 Y110.97 E.19724
G1 X116.278 Y110.76 E.01188
G1 X120.603 Y106.435 E.18813
G1 X120.069 Y106.435 E.01642
G1 X115.913 Y110.592 E.18081
G2 X115.498 Y110.473 I-.502 J.967 E.01336
G1 X119.535 Y106.435 E.17564
G1 X119.002 Y106.435 E.01642
G1 X115.013 Y110.424 E.1735
G2 X114.409 Y110.494 I-.129 J1.528 E.01881
G1 X118.468 Y106.435 E.17654
G1 X117.934 Y106.435 E.01642
G1 X108.435 Y115.934 E.41319
G1 X108.435 Y115.4 E.01642
G1 X117.4 Y106.435 E.38996
G1 X116.866 Y106.435 E.01642
G1 X108.435 Y114.866 E.36674
G1 X108.435 Y114.332 E.01642
G1 X116.332 Y106.435 E.34352
G1 X115.799 Y106.435 E.01642
G1 X108.435 Y113.799 E.3203
G1 X108.435 Y113.265 E.01642
G1 X115.265 Y106.435 E.29708
G1 X114.731 Y106.435 E.01642
G1 X108.435 Y112.731 E.27386
G1 X108.435 Y112.197 E.01642
G1 X114.197 Y106.435 E.25064
G1 X113.663 Y106.435 E.01642
G1 X108.435 Y111.663 E.22742
G1 X108.435 Y111.13 E.01642
G1 X113.13 Y106.435 E.2042
G1 X112.596 Y106.435 E.01642
G1 X108.435 Y110.596 E.18098
G1 X108.435 Y110.062 E.01642
G1 X112.062 Y106.435 E.15775
G1 X111.528 Y106.435 E.01642
G1 X108.435 Y109.528 E.13453
G1 X108.435 Y108.994 E.01642
G1 X110.994 Y106.435 E.11131
G1 X110.46 Y106.435 E.01642
G1 X108.435 Y108.46 E.08809
G1 X108.435 Y107.927 E.01642
G1 X109.927 Y106.435 E.06487
G1 X109.393 Y106.435 E.01642
G1 X108.435 Y107.393 E.04165
G1 X108.435 Y106.859 E.01642
G1 X109.029 Y106.266 E.02581
M106 S221.85
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X108.435 Y106.859 E-.31886
G1 X108.435 Y107.393 E-.20285
G1 X108.879 Y106.949 E-.23829
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
G3 Z3.2 I-.57 J1.075 P1  F30000
G1 X141.004 Y123.995 Z3.2
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X141.189 Y124.549 E.01793
G3 X129.708 Y116.294 I-11.189 J3.449 E1.79395
G1 X130.292 Y116.294 E.01794
G3 X140.983 Y123.94 I-.292 J11.705 E.42881
M204 S10000
; WIPE_START
G1 F24000
G1 X141.189 Y124.549 E-.24415
G1 X141.348 Y125.11 E-.22188
G1 X141.478 Y125.68 E-.22186
G1 X141.511 Y125.867 E-.07212
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.464 J-1.125 P1  F30000
G1 X113.839 Y114.453 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X113.576 Y114.195 E.01133
G3 X114.769 Y111.154 I1.424 J-1.196 E.12252
G1 X114.954 Y111.14 E.0057
G3 X113.887 Y114.488 I.046 J1.859 E.21755
M204 S10000
; WIPE_START
G1 F24000
M73 P90 R1
G1 X113.576 Y114.195 E-.16237
G1 X113.366 Y113.89 E-.14071
G1 X113.222 Y113.548 E-.14077
G1 X113.149 Y113.185 E-.14075
G1 X113.142 Y112.905 E-.1066
G1 X113.169 Y112.726 E-.06881
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.209 J.143 P1  F30000
G1 X116.651 Y142.151 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X116.777 Y142.452 E.01001
G3 X114.769 Y141.154 I-1.777 J.547 E.27913
G1 X114.954 Y141.14 E.0057
G3 X116.626 Y142.097 I.046 J1.859 E.06223
M204 S10000
; WIPE_START
G1 F24000
G1 X116.777 Y142.452 E-.1465
G1 X116.851 Y142.815 E-.14073
G1 X116.858 Y143.095 E-.1066
G1 X116.803 Y143.459 E-.13983
G1 X116.676 Y143.807 E-.14077
G1 X116.559 Y143.999 E-.08558
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.066 J1.215 P1  F30000
G1 X143.196 Y142.552 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X143.198 Y142.541 E.00035
G3 X144.769 Y141.154 I1.802 J.458 E.0684
G1 X144.954 Y141.14 E.0057
G3 X143.143 Y142.905 I.046 J1.859 E.27351
G1 X143.187 Y142.612 E.00911
M204 S10000
; WIPE_START
G1 F24000
G1 X143.198 Y142.541 E-.02717
G1 X143.324 Y142.193 E-.14074
G1 X143.517 Y141.877 E-.14077
G1 X143.769 Y141.605 E-.14077
G1 X144.07 Y141.389 E-.14077
G1 X144.408 Y141.237 E-.14077
G1 X144.482 Y141.22 E-.02902
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.216 J-.041 P1  F30000
G1 X143.574 Y114.195 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X143.368 Y113.889 E.01134
G3 X144.769 Y111.154 I1.632 J-.89 E.11113
G1 X144.954 Y111.14 E.0057
G3 X143.614 Y114.238 I.046 J1.859 E.22893
M204 S10000
; WIPE_START
G1 F24000
G1 X143.368 Y113.889 E-.16245
G1 X143.222 Y113.548 E-.1407
G1 X143.149 Y113.185 E-.14076
G1 X143.142 Y112.905 E-.1066
G1 X143.197 Y112.541 E-.13983
G1 X143.26 Y112.369 E-.06966
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.184 J.282 P1  F30000
G1 X152.29 Y150.29 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X107.71 Y150.29 E1.36982
G1 X107.71 Y105.71 E1.36982
G1 X152.29 Y105.71 E1.36982
G1 X152.29 Y150.23 E1.36798
M204 S10000
; WIPE_START
G1 F24000
G1 X150.29 Y150.233 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.216 J.05 P1  F30000
G1 X152.083 Y106.621 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X151.379 Y105.917 E.03058
G1 X150.846 Y105.917
G1 X152.083 Y107.154 E.05376
G1 X152.083 Y107.688
G1 X150.312 Y105.917 E.07693
G1 X149.779 Y105.917
G1 X152.083 Y108.221 E.1001
G1 X152.083 Y108.754
G1 X149.246 Y105.917 E.12327
G1 X148.712 Y105.917
G1 X152.083 Y109.288 E.14645
G1 X152.083 Y109.821
G1 X148.179 Y105.917 E.16962
G1 X147.646 Y105.917
G1 X152.083 Y110.354 E.19279
G1 X152.083 Y110.887
G1 X147.113 Y105.917 E.21597
G1 X146.579 Y105.917
G1 X152.083 Y111.421 E.23914
G1 X152.083 Y111.954
G1 X146.046 Y105.917 E.26231
G1 X145.513 Y105.917
G1 X152.083 Y112.487 E.28549
G1 X152.083 Y113.02
G1 X144.98 Y105.917 E.30866
G1 X144.446 Y105.917
G1 X152.083 Y113.554 E.33183
G1 X152.083 Y114.087
G1 X143.913 Y105.917 E.35501
G1 X143.38 Y105.917
G1 X152.083 Y114.62 E.37818
G1 X152.083 Y115.153
G1 X142.847 Y105.917 E.40135
G1 X142.313 Y105.917
G1 X152.083 Y115.687 E.42453
G1 X152.083 Y116.22
G1 X141.78 Y105.917 E.4477
G1 X141.247 Y105.917
G1 X152.083 Y116.753 E.47087
G1 X152.083 Y117.287
G1 X146.824 Y112.028 E.22851
G1 X147.058 Y112.795
G1 X152.083 Y117.82 E.21834
G1 X152.083 Y118.353
G1 X147.036 Y113.306 E.21932
G1 X146.925 Y113.729
G1 X152.083 Y118.886 E.22411
G1 X152.083 Y119.42
G1 X146.749 Y114.086 E.23178
G1 X146.519 Y114.389
G1 X152.083 Y119.953 E.24177
G1 X152.083 Y120.486
G1 X146.24 Y114.644 E.25389
G1 X145.911 Y114.847
G1 X152.083 Y121.019 E.26821
G1 X152.083 Y121.553
G1 X145.522 Y114.992 E.28509
G1 X145.054 Y115.058
G1 X152.083 Y122.086 E.30541
G1 X152.083 Y122.619
G1 X144.458 Y114.995 E.33133
M204 S10000
; WIPE_START
G1 F24000
G1 X145.872 Y116.409 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.217 J.024 P1  F30000
G1 X145.976 Y111.18 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X140.713 Y105.917 E.22868
G1 X140.18 Y105.917
G1 X145.21 Y110.947 E.21855
G1 X144.689 Y110.96
G1 X139.647 Y105.917 E.21911
G1 X139.114 Y105.917
G1 X144.268 Y111.072 E.22399
G1 X143.911 Y111.248
G1 X138.58 Y105.917 E.23164
G1 X138.047 Y105.917
G1 X143.606 Y111.476 E.24156
G1 X143.35 Y111.753
G1 X137.514 Y105.917 E.25359
G1 X136.981 Y105.917
G1 X143.147 Y112.084 E.26798
G1 X143.002 Y112.472
G1 X136.447 Y105.917 E.28482
G1 X135.914 Y105.917
G1 X142.936 Y112.939 E.30512
G1 X143.011 Y113.547
G1 X135.381 Y105.917 E.33155
G1 X134.847 Y105.917
G1 X152.083 Y123.153 E.74895
G1 X152.083 Y123.686
G1 X134.314 Y105.917 E.77212
G1 X133.781 Y105.917
G1 X152.083 Y124.219 E.7953
G1 X152.083 Y124.752
G1 X133.248 Y105.917 E.81847
G1 X132.714 Y105.917
M73 P91 R1
G1 X152.083 Y125.286 E.84164
G1 X152.083 Y125.819
G1 X132.181 Y105.917 E.86482
G1 X131.648 Y105.917
G1 X152.083 Y126.352 E.88799
G1 X152.083 Y126.885
G1 X131.115 Y105.917 E.91116
G1 X130.581 Y105.917
G1 X152.083 Y127.419 E.93434
G1 X152.083 Y127.952
G1 X130.048 Y105.917 E.95751
G1 X129.515 Y105.917
G1 X152.083 Y128.485 E.98068
G1 X152.083 Y129.019
G1 X128.981 Y105.917 E1.00386
G1 X128.448 Y105.917
G1 X152.083 Y129.552 E1.02703
G1 X152.083 Y130.085
G1 X127.915 Y105.917 E1.0502
G1 X127.382 Y105.917
G1 X152.083 Y130.618 E1.07337
G1 X152.083 Y131.152
G1 X126.848 Y105.917 E1.09655
G1 X126.315 Y105.917
G1 X152.083 Y131.685 E1.11972
G1 X152.083 Y132.218
G1 X125.782 Y105.917 E1.14289
G1 X125.249 Y105.917
G1 X152.083 Y132.751 E1.16607
G1 X152.083 Y133.285
G1 X139.068 Y120.27 E.56554
M204 S10000
; WIPE_START
G1 F24000
G1 X140.482 Y121.684 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.132 J-.447 P1  F30000
G1 X140.331 Y122.067 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X152.083 Y133.818 E.51066
G1 X152.083 Y134.351
G1 X140.883 Y123.151 E.48669
G1 X141.238 Y124.039
G1 X152.083 Y134.884 E.47127
G1 X152.083 Y135.418
G1 X141.48 Y124.816 E.46072
G1 X141.655 Y125.523
G1 X152.083 Y135.951 E.45313
G1 X152.083 Y136.484
G1 X141.776 Y126.178 E.44786
G1 X141.855 Y126.79
G1 X152.083 Y137.018 E.44442
G1 X152.083 Y137.551
G1 X141.9 Y127.368 E.44249
G1 X141.915 Y127.917
G1 X152.083 Y138.084 E.44181
G1 X152.083 Y138.617
G1 X141.906 Y128.441 E.44221
G1 X141.876 Y128.944
G1 X152.083 Y139.151 E.44351
G1 X152.083 Y139.684
G1 X141.828 Y129.429 E.44562
G1 X141.763 Y129.898
G1 X152.083 Y140.217 E.44844
G1 X152.083 Y140.75
G1 X141.683 Y130.351 E.45191
G1 X141.584 Y130.786
G1 X152.083 Y141.284 E.4562
G1 X152.083 Y141.817
G1 X141.474 Y131.208 E.46101
G1 X141.352 Y131.62
G1 X152.083 Y142.35 E.46629
G1 X152.083 Y142.884
G1 X141.218 Y132.019 E.47212
G1 X141.07 Y132.404
G1 X152.083 Y143.417 E.47855
G1 X152.083 Y143.95
G1 X140.913 Y132.781 E.48536
G1 X140.748 Y133.148
G1 X152.083 Y144.483 E.49257
G1 X152.083 Y145.017
M73 P92 R1
G1 X140.568 Y133.502 E.50038
G1 X140.381 Y133.848
G1 X152.083 Y145.55 E.50851
G1 X152.083 Y146.083
G1 X140.185 Y134.186 E.51699
G1 X139.977 Y134.511
G1 X152.083 Y146.616 E.52603
G1 X152.083 Y147.15
G1 X139.763 Y134.83 E.53535
G1 X139.54 Y135.14
G1 X145.376 Y140.976 E.2536
G1 X144.812 Y140.946
G1 X139.306 Y135.439 E.23928
G1 X139.066 Y135.733
G1 X144.366 Y141.033 E.23034
G1 X143.995 Y141.195
G1 X138.816 Y136.016 E.22507
G1 X138.557 Y136.29
G1 X143.68 Y141.414 E.22265
G1 X143.415 Y141.682
G1 X138.292 Y136.559 E.22263
G1 X138.015 Y136.815
G1 X143.199 Y141.999 E.22527
G1 X143.038 Y142.371
G1 X137.732 Y137.065 E.2306
G1 X137.442 Y137.308
G1 X142.946 Y142.813 E.23921
G1 X142.976 Y143.376
G1 X137.139 Y137.538 E.25365
M204 S10000
; WIPE_START
G1 F24000
G1 X138.553 Y138.953 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.484 J1.117 P1  F30000
G1 X147.024 Y142.624 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X152.083 Y147.683 E.21982
G1 X152.083 Y148.216
G1 X147.054 Y143.187 E.21854
G1 X146.962 Y143.629
M73 P92 R0
G1 X152.083 Y148.75 E.22253
G1 X152.083 Y149.283
G1 X146.801 Y144.001 E.22952
G1 X146.585 Y144.318
G1 X152.083 Y149.816 E.23891
G1 X151.816 Y150.083
G1 X146.32 Y144.586 E.23884
G1 X146.005 Y144.805
G1 X151.283 Y150.083 E.22934
G1 X150.749 Y150.083
G1 X145.634 Y144.967 E.22231
G1 X145.188 Y145.054
G1 X150.216 Y150.083 E.2185
G1 X149.683 Y150.083
G1 X144.624 Y145.024 E.21983
M204 S10000
; WIPE_START
G1 F24000
G1 X146.038 Y146.438 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.926 J.79 P1  F30000
G1 X149.15 Y150.083 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X136.83 Y137.763 E.53535
G1 X136.513 Y137.979
G1 X148.616 Y150.083 E.52596
G1 X148.083 Y150.083
G1 X136.184 Y138.183 E.51708
G1 X135.848 Y138.381
G1 X147.55 Y150.083 E.50849
G1 X147.016 Y150.083
G1 X135.503 Y138.569 E.50032
G1 X135.146 Y138.745
G1 X146.483 Y150.083 E.49266
G1 X145.95 Y150.083
G1 X134.781 Y138.914 E.48534
G1 X134.406 Y139.072
G1 X145.417 Y150.083 E.47847
G1 X144.883 Y150.083
G1 X134.017 Y139.216 E.47219
G1 X133.619 Y139.351
G1 X144.35 Y150.083 E.46632
G1 X143.817 Y150.083
G1 X133.211 Y139.476 E.46089
G1 X132.786 Y139.585
G1 X143.284 Y150.083 E.45619
G1 X142.75 Y150.083
G1 X132.348 Y139.68 E.45204
G1 X131.897 Y139.762
G1 X142.217 Y150.083 E.44846
G1 X141.684 Y150.083
G1 X131.431 Y139.83 E.44552
G1 X130.946 Y139.879
G1 X141.15 Y150.083 E.44341
G1 X140.617 Y150.083
G1 X130.441 Y139.907 E.4422
G1 X129.915 Y139.914
G1 X140.084 Y150.083 E.44188
G1 X139.551 Y150.083
G1 X129.365 Y139.897 E.44262
G1 X128.787 Y139.852
G1 X139.017 Y150.083 E.44457
G1 X138.484 Y150.083
M73 P93 R0
G1 X128.175 Y139.773 E.44799
G1 X127.522 Y139.654
G1 X137.951 Y150.083 E.45318
G1 X137.418 Y150.083
G1 X126.819 Y139.484 E.46056
G1 X126.038 Y139.236
G1 X136.884 Y150.083 E.47132
G1 X136.351 Y150.083
G1 X125.155 Y138.887 E.48651
G1 X124.074 Y138.339
G1 X135.818 Y150.083 E.51033
G1 X135.285 Y150.083
G1 X122.258 Y137.056 E.56607
M204 S10000
; WIPE_START
G1 F24000
G1 X123.672 Y138.47 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.987 J.711 P1  F30000
G1 X137.741 Y118.943 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X124.715 Y105.917 E.56604
G1 X124.182 Y105.917
G1 X135.926 Y117.661 E.51033
G1 X134.844 Y117.113
G1 X123.649 Y105.917 E.48651
G1 X123.116 Y105.917
G1 X133.962 Y116.763 E.47132
G1 X133.181 Y116.516
G1 X122.582 Y105.917 E.46056
G1 X122.049 Y105.917
G1 X132.478 Y116.346 E.45318
G1 X131.825 Y116.227
G1 X121.516 Y105.917 E.44799
G1 X120.982 Y105.917
G1 X131.213 Y116.148 E.44457
G1 X130.635 Y116.103
G1 X120.449 Y105.917 E.44262
G1 X119.916 Y105.917
G1 X130.085 Y116.086 E.44188
G1 X129.559 Y116.093
G1 X119.383 Y105.917 E.4422
G1 X118.849 Y105.917
G1 X129.053 Y116.121 E.44341
G1 X128.569 Y116.17
G1 X118.316 Y105.917 E.44552
G1 X117.783 Y105.917
G1 X128.103 Y116.238 E.44846
G1 X127.652 Y116.32
G1 X117.25 Y105.917 E.45204
G1 X116.716 Y105.917
G1 X127.214 Y116.415 E.45619
G1 X126.789 Y116.524
G1 X116.183 Y105.917 E.46089
G1 X115.65 Y105.917
G1 X126.381 Y116.649 E.46632
G1 X125.983 Y116.784
G1 X115.116 Y105.917 E.47219
G1 X114.583 Y105.917
G1 X125.594 Y116.928 E.47847
G1 X125.219 Y117.086
G1 X114.05 Y105.917 E.48535
G1 X113.517 Y105.917
G1 X124.854 Y117.255 E.49267
G1 X124.497 Y117.431
G1 X112.983 Y105.917 E.50032
G1 X112.45 Y105.917
G1 X124.152 Y117.619 E.50849
G1 X123.816 Y117.817
G1 X111.917 Y105.917 E.51708
G1 X111.384 Y105.917
G1 X123.487 Y118.021 E.52596
G1 X123.17 Y118.237
G1 X110.85 Y105.917 E.53536
G1 X110.317 Y105.917
G1 X115.376 Y110.976 E.21982
G1 X114.812 Y110.946
G1 X109.784 Y105.917 E.2185
G1 X109.25 Y105.917
G1 X114.366 Y111.033 E.22231
G1 X113.995 Y111.195
G1 X108.717 Y105.917 E.22935
G1 X108.184 Y105.917
G1 X113.68 Y111.414 E.23884
G1 X113.415 Y111.682
G1 X107.917 Y106.184 E.2389
G1 X107.917 Y106.717
G1 X113.199 Y111.999 E.22952
G1 X113.038 Y112.371
G1 X107.917 Y107.251 E.22253
G1 X107.917 Y107.784
G1 X112.946 Y112.813 E.21854
G1 X112.976 Y113.376
G1 X107.917 Y108.317 E.21982
M204 S10000
; WIPE_START
M73 P94 R0
G1 F24000
G1 X109.332 Y109.731 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.428 J1.139 P1  F30000
G1 X117.024 Y112.624 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X122.861 Y118.462 E.25365
G1 X122.558 Y118.692
G1 X117.054 Y113.187 E.23921
G1 X116.962 Y113.629
G1 X122.268 Y118.935 E.2306
G1 X121.985 Y119.185
G1 X116.801 Y114.001 E.22527
G1 X116.585 Y114.318
G1 X121.708 Y119.441 E.22263
G1 X121.443 Y119.71
G1 X116.32 Y114.586 E.22265
G1 X116.005 Y114.805
G1 X121.184 Y119.984 E.22507
G1 X120.934 Y120.267
G1 X115.634 Y114.967 E.23034
G1 X115.188 Y115.054
G1 X120.694 Y120.561 E.23928
G1 X120.46 Y120.86
G1 X114.624 Y115.024 E.2536
M204 S10000
; WIPE_START
G1 F24000
G1 X116.038 Y116.438 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.91 J.808 P1  F30000
G1 X120.237 Y121.17 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X107.917 Y108.85 E.53535
G1 X107.917 Y109.384
G1 X120.023 Y121.489 E.52603
G1 X119.815 Y121.814
G1 X107.917 Y109.917 E.51699
G1 X107.917 Y110.45
G1 X119.619 Y122.152 E.50851
G1 X119.432 Y122.498
G1 X107.917 Y110.984 E.50038
G1 X107.917 Y111.517
G1 X119.252 Y122.852 E.49256
G1 X119.087 Y123.219
G1 X107.917 Y112.05 E.48536
G1 X107.917 Y112.583
G1 X118.93 Y123.596 E.47855
G1 X118.782 Y123.981
G1 X107.917 Y113.117 E.47212
G1 X107.917 Y113.65
G1 X118.648 Y124.38 E.46629
G1 X118.526 Y124.792
G1 X107.917 Y114.183 E.461
G1 X107.917 Y114.716
G1 X118.416 Y125.215 E.4562
G1 X118.317 Y125.649
G1 X107.917 Y115.25 E.45191
G1 X107.917 Y115.783
G1 X118.237 Y126.103 E.44844
G1 X118.172 Y126.571
G1 X107.917 Y116.316 E.44562
G1 X107.917 Y116.85
G1 X118.124 Y127.056 E.44351
G1 X118.094 Y127.559
G1 X107.917 Y117.383 E.44221
G1 X107.917 Y117.916
G1 X118.085 Y128.083 E.44181
G1 X118.1 Y128.632
G1 X107.917 Y118.449 E.44249
G1 X107.917 Y118.983
G1 X118.145 Y129.21 E.44442
G1 X118.224 Y129.822
G1 X107.917 Y119.516 E.44786
G1 X107.917 Y120.049
G1 X118.345 Y130.477 E.45314
G1 X118.52 Y131.185
G1 X107.917 Y120.582 E.46072
G1 X107.917 Y121.116
G1 X118.762 Y131.961 E.47127
G1 X119.117 Y132.849
G1 X107.917 Y121.649 E.4867
G1 X107.917 Y122.182
G1 X119.669 Y133.934 E.51066
M204 S10000
; WIPE_START
G1 F24000
G1 X118.255 Y132.52 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.935 J.779 P1  F30000
G1 X120.933 Y135.731 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X107.917 Y122.715 E.56559
G1 X107.917 Y123.249
G1 X134.751 Y150.083 E1.16606
G1 X134.218 Y150.083
G1 X107.917 Y123.782 E1.14289
G1 X107.917 Y124.315
G1 X133.685 Y150.083 E1.11971
G1 X133.151 Y150.083
G1 X107.917 Y124.849 E1.09654
G1 X107.917 Y125.382
M73 P95 R0
G1 X132.618 Y150.083 E1.07337
G1 X132.085 Y150.083
G1 X107.917 Y125.915 E1.0502
G1 X107.917 Y126.448
G1 X131.552 Y150.083 E1.02702
G1 X131.018 Y150.083
G1 X107.917 Y126.982 E1.00385
G1 X107.917 Y127.515
G1 X130.485 Y150.083 E.98068
G1 X129.952 Y150.083
G1 X107.917 Y128.048 E.9575
G1 X107.917 Y128.581
G1 X129.419 Y150.083 E.93433
G1 X128.885 Y150.083
G1 X107.917 Y129.115 E.91116
G1 X107.917 Y129.648
G1 X128.352 Y150.083 E.88798
G1 X127.819 Y150.083
G1 X107.917 Y130.181 E.86481
G1 X107.917 Y130.715
G1 X127.285 Y150.083 E.84164
G1 X126.752 Y150.083
G1 X107.917 Y131.248 E.81846
G1 X107.917 Y131.781
G1 X126.219 Y150.083 E.79529
G1 X125.686 Y150.083
G1 X107.917 Y132.314 E.77212
G1 X107.917 Y132.848
G1 X125.152 Y150.083 E.74894
G1 X124.619 Y150.083
G1 X116.989 Y142.453 E.33155
G1 X117.064 Y143.061
G1 X124.086 Y150.083 E.30512
G1 X123.553 Y150.083
G1 X116.998 Y143.528 E.28482
G1 X116.853 Y143.916
G1 X123.019 Y150.083 E.26797
G1 X122.486 Y150.083
G1 X116.65 Y144.247 E.25359
G1 X116.394 Y144.524
G1 X121.953 Y150.083 E.24155
G1 X121.42 Y150.083
G1 X116.089 Y144.752 E.23163
G1 X115.732 Y144.928
G1 X120.886 Y150.083 E.22399
G1 X120.353 Y150.083
G1 X115.311 Y145.04 E.21911
G1 X114.79 Y145.053
G1 X119.82 Y150.083 E.21855
G1 X119.286 Y150.083
G1 X114.024 Y144.82 E.2287
M204 S10000
; WIPE_START
G1 F24000
G1 X115.438 Y146.234 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.217 J.024 P1  F30000
G1 X115.542 Y141.005 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X107.917 Y133.381 E.33132
G1 X107.917 Y133.914
G1 X114.946 Y140.942 E.30541
G1 X114.478 Y141.008
G1 X107.917 Y134.447 E.28508
G1 X107.917 Y134.981
G1 X114.089 Y141.153 E.2682
G1 X113.76 Y141.356
G1 X107.917 Y135.514 E.25388
G1 X107.917 Y136.047
G1 X113.481 Y141.611 E.24176
G1 X113.251 Y141.914
G1 X107.917 Y136.581 E.23178
G1 X107.917 Y137.114
G1 X113.075 Y142.271 E.22411
G1 X112.964 Y142.694
M73 P96 R0
G1 X107.917 Y137.647 E.21932
G1 X107.917 Y138.18
G1 X112.942 Y143.205 E.21834
G1 X113.176 Y143.972
G1 X107.917 Y138.714 E.22851
G1 X107.917 Y139.247
G1 X118.753 Y150.083 E.47087
G1 X118.22 Y150.083
G1 X107.917 Y139.78 E.44769
G1 X107.917 Y140.313
G1 X117.687 Y150.083 E.42452
G1 X117.153 Y150.083
G1 X107.917 Y140.847 E.40135
G1 X107.917 Y141.38
G1 X116.62 Y150.083 E.37817
G1 X116.087 Y150.083
G1 X107.917 Y141.913 E.355
G1 X107.917 Y142.446
G1 X115.554 Y150.083 E.33183
G1 X115.02 Y150.083
G1 X107.917 Y142.98 E.30865
G1 X107.917 Y143.513
G1 X114.487 Y150.083 E.28548
G1 X113.954 Y150.083
G1 X107.917 Y144.046 E.26231
G1 X107.917 Y144.58
G1 X113.42 Y150.083 E.23913
G1 X112.887 Y150.083
G1 X107.917 Y145.113 E.21596
G1 X107.917 Y145.646
G1 X112.354 Y150.083 E.19279
G1 X111.821 Y150.083
G1 X107.917 Y146.179 E.16961
G1 X107.917 Y146.713
G1 X111.287 Y150.083 E.14644
G1 X110.754 Y150.083
G1 X107.917 Y147.246 E.12327
G1 X107.917 Y147.779
G1 X110.221 Y150.083 E.1001
G1 X109.688 Y150.083
G1 X107.917 Y148.312 E.07692
G1 X107.917 Y148.846
G1 X109.154 Y150.083 E.05375
G1 X108.621 Y150.083
G1 X107.917 Y149.379 E.03058
M204 S10000
; WIPE_START
G1 F24000
G1 X108.621 Y150.083 E-.37813
G1 X109.154 Y150.083 E-.20264
G1 X108.821 Y149.749 E-.17923
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.878 J.842 P1  F30000
G1 X143.163 Y113.941 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X143.09 Y113.832 E.00048
; LINE_WIDTH: 0.12543
G1 X143.017 Y113.723 E.00088
; LINE_WIDTH: 0.16269
G1 X142.944 Y113.614 E.00128
; WIPE_START
G1 F24000
G1 X143.017 Y113.723 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.081 J.559 P1  F30000
G1 X144.437 Y110.974 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0915411
G1 F15000
G2 X144.315 Y111.051 I.702 J1.245 E.00057
; WIPE_START
G1 F24000
G1 X144.437 Y110.974 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.457 J1.128 P1  F30000
G1 X146.886 Y111.966 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.227704
G1 F15000
G1 X146.754 Y111.807 E.00312
; LINE_WIDTH: 0.176789
G2 X146.313 Y111.343 I-4.701 J4.022 E.00698
; LINE_WIDTH: 0.173158
G1 X146.175 Y111.231 E.00189
; LINE_WIDTH: 0.200894
G1 X146.037 Y111.119 E.00229
; WIPE_START
G1 F24000
G1 X146.175 Y111.231 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.101 J.519 P1  F30000
G1 X147.115 Y113.227 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0931945
G1 F15000
G1 X147.05 Y113.054 E.00076
; WIPE_START
G1 F24000
G1 X147.115 Y113.227 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.81 J-.908 P1  F30000
G1 X144.978 Y115.134 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.102927
G1 F15000
G3 X144.805 Y115.053 I.715 J-1.741 E.00093
; WIPE_START
G1 F24000
G1 X144.978 Y115.134 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.112 J-1.212 P1  F30000
G1 X117.097 Y112.552 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.121383
G1 F15000
G2 X116.936 Y112.296 I-2.614 J1.456 E.00193
G1 X117.132 Y112.999 F30000
; LINE_WIDTH: 0.114268
G1 F15000
G3 X117.054 Y113.165 I-1.925 J-.8 E.00107
; WIPE_START
G1 F24000
G1 X117.132 Y112.999 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.768 J-.944 P1  F30000
G1 X114.553 Y115.095 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.150296
G1 F15000
G1 X114.287 Y114.939 E.0027
; WIPE_START
G1 F24000
G1 X114.553 Y115.095 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.83 J-.89 P1  F30000
G1 X113.064 Y113.704 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.108483
G1 F15000
G3 X112.903 Y113.448 I2.454 J-1.713 E.00161
; WIPE_START
G1 F24000
G1 X113.064 Y113.704 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.86 J.862 P1  F30000
G1 X115.713 Y111.061 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.144732
G1 F15000
G1 X115.447 Y110.905 E.00256
; WIPE_START
G1 F24000
M73 P97 R0
G1 X115.713 Y111.061 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.217 J-.021 P1  F30000
G1 X115.195 Y140.947 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0969876
G1 F15000
G2 X115.022 Y140.866 I-.887 J1.659 E.00084
; WIPE_START
G1 F24000
G1 X115.195 Y140.947 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.755 J-.955 P1  F30000
G1 X112.885 Y142.774 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0933115
G1 F15000
G1 X112.95 Y142.946 E.00076
; WIPE_START
G1 F24000
G1 X112.885 Y142.774 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.083 J.554 P1  F30000
G1 X113.963 Y144.88 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.228629
G1 F15000
G1 X113.825 Y144.769 E.00269
; LINE_WIDTH: 0.1802
G3 X113.378 Y144.353 I4.128 J-4.877 E.00683
; LINE_WIDTH: 0.167799
G1 X113.246 Y144.193 E.00211
; LINE_WIDTH: 0.197775
G1 X113.114 Y144.034 E.00261
; WIPE_START
G1 F24000
G1 X113.246 Y144.193 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.36 J1.162 P1  F30000
G1 X115.684 Y144.949 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0893927
G1 F15000
G3 X115.563 Y145.026 I-.823 J-1.167 E.00054
; WIPE_START
G1 F24000
G1 X115.684 Y144.949 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.073 J.574 P1  F30000
G1 X117.056 Y142.386 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.19992
G1 F15000
G1 X116.983 Y142.277 E.00168
; LINE_WIDTH: 0.16267
G1 X116.91 Y142.168 E.00128
; LINE_WIDTH: 0.12542
G1 X116.837 Y142.059 E.00088
; WIPE_START
G1 F24000
G1 X116.91 Y142.168 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.197 J1.201 P1  F30000
G1 X130.965 Y139.86 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0991297
G1 F15000
G1 X130.757 Y139.955 E.00105
G1 X129.843 Y139.986 F30000
; LINE_WIDTH: 0.103952
G1 F15000
G1 X129.628 Y139.893 E.00117
; WIPE_START
G1 F24000
G1 X129.843 Y139.986 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.134 J-1.21 P1  F30000
G1 X127.456 Y139.721 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.158892
G1 F15000
G1 X127.204 Y139.582 E.00271
; WIPE_START
G1 F24000
G1 X127.456 Y139.721 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.436 J-1.136 P1  F30000
G1 X124.012 Y138.4 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.224429
G1 F15000
G1 X123.851 Y138.273 E.00303
; LINE_WIDTH: 0.183211
G1 X123.69 Y138.147 E.00234
; LINE_WIDTH: 0.141704
G1 X123.528 Y138.019 E.00166
; LINE_WIDTH: 0.100469
G1 X123.46 Y137.963 E.00041
; WIPE_START
G1 F24000
G1 X123.528 Y138.019 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.683 J-1.007 P1  F30000
G1 X122.198 Y137.116 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.224585
G1 F15000
G1 X121.631 Y136.577 E.01158
G1 X120.873 Y135.791 E.01617
; WIPE_START
G1 F24000
G1 X121.631 Y136.577 E-.44286
G1 X122.198 Y137.116 E-.31714
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.933 J-.782 P1  F30000
G1 X120.044 Y134.547 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0881695
G1 F15000
G1 X119.919 Y134.393 E.00073
; LINE_WIDTH: 0.128386
G1 X119.793 Y134.236 E.0014
; LINE_WIDTH: 0.168114
G1 X119.7 Y134.115 E.00155
; LINE_WIDTH: 0.195845
G1 X119.608 Y133.995 E.00189
G1 X119.328 Y133.299 F30000
; LINE_WIDTH: 0.0887172
G1 F15000
G1 X119.241 Y133.18 E.00055
; LINE_WIDTH: 0.127097
G1 X119.148 Y133.045 E.00112
; LINE_WIDTH: 0.170281
G1 X119.055 Y132.911 E.0017
; WIPE_START
G1 F24000
G1 X119.148 Y133.045 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.217 J-.01 P1  F30000
G1 X119.066 Y123.267 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0948745
G1 F15000
G1 X119.006 Y123.353 E.00044
G1 X119.019 Y123.418 E.00028
; WIPE_START
G1 F24000
G1 X119.006 Y123.353 E-.29592
G1 X119.066 Y123.267 E-.46408
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.704 J.992 P1  F30000
G1 X129.243 Y116.045 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.10029
G1 F15000
G1 X129.034 Y116.14 E.00107
; WIPE_START
G1 F24000
G1 X129.243 Y116.045 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.067 J1.215 P1  F30000
G1 X130.372 Y116.107 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.102632
G1 F15000
G1 X130.156 Y116.014 E.00114
; WIPE_START
G1 F24000
G1 X130.372 Y116.107 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.155 J1.207 P1  F30000
G1 X132.796 Y116.418 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.157119
G1 F15000
G1 X132.544 Y116.279 E.00267
; WIPE_START
G1 F24000
G1 X132.796 Y116.418 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.483 J1.117 P1  F30000
G1 X136.539 Y118.037 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0883661
G1 F15000
G1 X136.471 Y117.98 E.00033
; LINE_WIDTH: 0.100673
G1 X136.31 Y117.853 E.00096
; LINE_WIDTH: 0.141919
G1 X136.148 Y117.727 E.00165
; LINE_WIDTH: 0.183165
G1 X135.987 Y117.6 E.00234
; WIPE_START
G1 F24000
G1 X136.148 Y117.727 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.779 J.935 P1  F30000
G1 X139.128 Y120.21 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.224775
G1 F15000
G1 X138.368 Y119.423 E.01621
G1 X137.801 Y118.883 E.01161
; WIPE_START
G1 F24000
G1 X138.368 Y119.423 E-.31713
G1 X139.128 Y120.21 E-.44287
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.995 J.701 P1  F30000
G1 X140.392 Y122.005 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223577
G1 F15000
G1 X140.3 Y121.885 E.00224
; LINE_WIDTH: 0.195234
G1 X140.205 Y121.762 E.00193
; LINE_WIDTH: 0.167271
G1 X140.081 Y121.608 E.00201
; LINE_WIDTH: 0.12772
G1 X139.956 Y121.453 E.00137
; WIPE_START
G1 F24000
G1 X140.081 Y121.608 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.051 J.613 P1  F30000
G1 X140.945 Y123.089 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.213466
G1 F15000
G1 X140.852 Y122.955 E.00227
; LINE_WIDTH: 0.169682
G1 X140.757 Y122.818 E.00171
; LINE_WIDTH: 0.126292
G1 X140.672 Y122.701 E.00099
; WIPE_START
G1 F24000
G1 X140.757 Y122.818 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.217 J.028 P1  F30000
G1 X140.981 Y132.582 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.111002
G1 F15000
G1 X140.994 Y132.647 E.00037
G1 X140.934 Y132.734 E.00058
; WIPE_START
G1 F24000
G1 X140.994 Y132.647 E-.46409
G1 X140.981 Y132.582 E-.29591
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.063 J.593 P1  F30000
G1 X145.713 Y141.061 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.144734
G1 F15000
G1 X145.447 Y140.905 E.00256
; WIPE_START
G1 F24000
G1 X145.713 Y141.061 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.86 J-.862 P1  F30000
G1 X143.064 Y143.704 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.108478
G1 F15000
G3 X142.903 Y143.448 I2.456 J-1.714 E.00161
; WIPE_START
G1 F24000
G1 X143.064 Y143.704 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.83 J.89 P1  F30000
G1 X144.553 Y145.095 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.147452
G1 F15000
G3 X144.291 Y144.932 I1.476 J-2.67 E.00263
; WIPE_START
G1 F24000
G1 X144.553 Y145.095 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.768 J.944 P1  F30000
G1 X147.132 Y142.999 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.114266
G1 F15000
G3 X147.054 Y143.165 I-1.93 J-.802 E.00107
G1 X147.097 Y142.552 F30000
; LINE_WIDTH: 0.121387
G1 F15000
G2 X146.936 Y142.296 I-2.617 J1.458 E.00193
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X147.097 Y142.552 E-.76
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

