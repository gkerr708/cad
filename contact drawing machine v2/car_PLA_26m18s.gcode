; HEADER_BLOCK_START
; BambuStudio 01.06.02.04
; model printing time: 20m 29s; total estimated time: 26m 18s
; total layer number: 88
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
    G29 A X90 Y95 I80 J70
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
; layer num/total_layer_count: 1/88
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
G1 X164.89 Y98.092 F30000
G1 Z.4
M73 P20 R21
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X164.818 Y98.369 E.01068
G3 X161.926 Y94.551 I-2.818 J-.87 E.48209
M73 P20 R20
G1 X162.074 Y94.551 E.00548
G3 X164.901 Y98.033 I-.074 J2.949 E.1898
; WIPE_START
G1 F24000
G1 X164.818 Y98.369 E-.13175
G1 X164.718 Y98.646 E-.11175
G1 X164.591 Y98.911 E-.11176
G1 X164.438 Y99.162 E-.11176
G1 X164.159 Y99.51 E-.16927
G1 X163.952 Y99.712 E-.11003
G1 X163.924 Y99.734 E-.01367
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.095 J-1.213 P1  F30000
G1 X98.806 Y94.662 Z.6
G1 Z.2
G1 E.8 F1800
M73 P21 R20
G1 F3000
G1 X99.078 Y94.754 E.01068
G3 X97.926 Y94.551 I-1.078 J2.746 E.64646
G1 X98.074 Y94.551 E.00548
G3 X98.748 Y94.646 I-.074 J2.949 E.02544
; WIPE_START
G1 F24000
G1 X99.078 Y94.754 E-.1317
G1 X99.346 Y94.875 E-.11177
G1 X99.601 Y95.022 E-.11175
G1 X99.839 Y95.193 E-.11176
G1 X100.06 Y95.388 E-.11176
G1 X100.26 Y95.604 E-.11176
G1 X100.37 Y95.749 E-.0695
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.995 J.701 P1  F30000
G1 X127.892 Y134.824 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X128.152 Y134.639 E.01188
G3 X129.915 Y134.094 I1.851 J2.864 E.0696
G3 X133.407 Y137.489 I.075 J3.416 E.20195
G1 X133.407 Y150.511 E.48499
G3 X126.593 Y150.511 I-3.407 J-.011 E.39782
G1 X126.593 Y137.489 E.48499
G3 X127.846 Y134.862 I3.41 J.013 E.11203
G1 X128.108 Y135.24 F30000
; FEATURE: Outer wall
G1 F3000
G1 X128.161 Y135.194 E.00263
M73 P22 R20
G3 X129.926 Y134.551 I1.841 J2.308 E.07122
G3 X132.95 Y137.495 I.065 J2.958 E.17501
G1 X132.95 Y150.505 E.48457
G3 X127.05 Y150.505 I-2.95 J-.006 E.34476
G1 X127.05 Y137.495 E.48457
G3 X127.941 Y135.389 I2.952 J.007 E.08747
G1 X128.063 Y135.28 E.00609
; WIPE_START
G1 F24000
G1 X128.161 Y135.194 E-.04961
G1 X128.399 Y135.022 E-.11174
G1 X128.787 Y134.811 E-.16755
G1 X129.06 Y134.704 E-.11176
G1 X129.344 Y134.624 E-.11177
G1 X129.633 Y134.573 E-.11176
G1 X129.885 Y134.554 E-.09581
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.965 J-.741 P1  F30000
G1 X98.89 Y94.214 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3000
G1 X98.369 Y94.111 E.0198
G1 X98.388 Y93.857 E.00948
G1 X161.612 Y93.857 E2.35487
G1 X161.631 Y94.111 E.00948
G2 X162.369 Y94.111 I.369 J3.388 E.76997
G1 X162.388 Y93.857 E.00948
G1 X168.523 Y93.857 E.22852
G1 X130 Y161.273 E2.89201
G1 X91.477 Y93.857 E2.89201
G1 X97.612 Y93.857 E.22852
G1 X97.631 Y94.111 E.00948
G2 X98.949 Y94.226 I.369 J3.388 E.74791
; WIPE_START
G1 F24000
G1 X98.369 Y94.111 E-.22477
G1 X98.388 Y93.857 E-.0967
G1 X99.542 Y93.857 E-.43853
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.112 J.495 P1  F30000
G1 X130 Y162.194 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
G1 X90.689 Y93.4 E2.95114
G1 X169.311 Y93.4 E2.92835
G1 X169.208 Y93.579 E.00769
G1 X130.03 Y162.142 E2.94121
; WIPE_START
G1 F24000
G1 X129.036 Y160.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.05 J.616 P1  F30000
G1 X163.962 Y100.893 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.295559
G1 F3000
G2 X164.409 Y100.37 I-20.513 J-17.97 E.01415
; LINE_WIDTH: 0.235122
G1 X164.468 Y100.3 E.00144
; LINE_WIDTH: 0.207199
G1 X164.528 Y100.224 E.00129
; LINE_WIDTH: 0.178077
G1 X164.585 Y100.152 E.00101
; LINE_WIDTH: 0.133021
G1 X164.694 Y100.008 E.00133
; LINE_WIDTH: 0.103281
G1 X164.794 Y99.868 E.00085
G1 X164.748 Y100.002 F30000
; LINE_WIDTH: 0.376503
G1 F3000
G1 X163.954 Y100.884 E.03226
; WIPE_START
G1 F24000
G1 X164.748 Y100.002 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.068 J.584 P1  F30000
G1 X165.458 Y98.706 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.123015
G1 F3000
G1 X165.512 Y98.584 E.00087
; LINE_WIDTH: 0.167598
G1 X165.584 Y98.414 E.00188
; LINE_WIDTH: 0.194945
G1 X165.618 Y98.326 E.00117
; LINE_WIDTH: 0.222744
G1 X165.652 Y98.24 E.00134
; LINE_WIDTH: 0.254269
G1 X165.684 Y98.15 E.00166
; LINE_WIDTH: 0.287326
G1 X165.716 Y98.063 E.00183
; LINE_WIDTH: 0.28961
G1 X165.923 Y97.467 E.01268
G1 X165.91 Y97.465 F30000
; LINE_WIDTH: 0.365451
G1 F3000
G1 X165.543 Y98.612 E.03166
G1 X165.589 Y98.531 F30000
; LINE_WIDTH: 0.454521
G1 F3000
G2 X165.899 Y97.462 I-43.116 J-13.063 E.03732
; WIPE_START
G1 F24000
G1 X165.589 Y98.531 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.05 J.614 P1  F30000
G1 X167.875 Y94.623 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.504361
G1 F6300
G1 X167.497 Y94.246 E.02008
G1 X166.844 Y94.246 E.02454
G1 X167.487 Y94.888 E.03415
M73 P23 R20
G1 X167.249 Y95.303 E.01798
G1 X166.192 Y94.246 E.05623
G1 X165.539 Y94.246 E.02454
G1 X167.012 Y95.718 E.07832
G1 X166.775 Y96.134 E.01798
G1 X164.887 Y94.246 E.1004
G1 X164.361 Y94.246 E.01979
G1 X164.309 Y94.321 E.00342
G1 X166.537 Y96.549 E.11849
G1 X166.3 Y96.964 E.01798
G1 X165.183 Y95.847 E.05941
; WIPE_START
G1 F24000
G1 X166.3 Y96.964 E-.60041
G1 X166.509 Y96.6 E-.15959
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.788 J-.928 P1  F30000
G1 X163.834 Y94.329 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.103297
G1 F3000
G1 X163.679 Y94.223 E.00092
; LINE_WIDTH: 0.145267
G2 X163.377 Y94.108 I-.33 J.412 E.00274
; WIPE_START
G1 F24000
G1 X163.563 Y94.148 E-.44041
G1 X163.679 Y94.223 E-.31959
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.177 J-1.204 P1  F30000
G1 X162 Y93.977 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.339232
G1 F3000
G1 X162 Y94.324 E.0084
G1 X162 Y93.977 F30000
; LINE_WIDTH: 0.369094
G1 F3000
G1 X162 Y93.629 E.00925
; WIPE_START
G1 F24000
G1 X162 Y93.977 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.116 J-1.211 P1  F30000
G1 X160.623 Y94.108 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.156223
G1 F3000
G1 X160.482 Y94.138 E.00133
G2 X160.319 Y94.225 I.227 J.622 E.0017
; LINE_WIDTH: 0.133852
G1 X160.166 Y94.329 E.00137
G1 X159.663 Y94.777 F30000
; FEATURE: Bottom surface
; LINE_WIDTH: 0.502353
G1 F6300
G1 X159.132 Y94.246 E.02814
G1 X158.482 Y94.246 E.02432
G1 X159.188 Y94.952 E.03741
G2 X158.903 Y95.316 I1.311 J1.321 E.01737
G1 X157.832 Y94.246 E.0567
G1 X157.182 Y94.246 E.02432
G1 X158.651 Y95.715 E.07778
G2 X158.451 Y96.164 I2.147 J1.225 E.01845
G1 X156.533 Y94.246 E.10158
G1 X155.883 Y94.246 E.02432
G1 X158.3 Y96.663 E.128
G2 X158.219 Y97.232 I3.729 J.823 E.02152
G1 X155.233 Y94.246 E.1581
G1 X154.583 Y94.246 E.02432
G1 X158.469 Y98.131 E.20573
; WIPE_START
G1 F24000
G1 X157.055 Y96.717 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.685 J1.006 P1  F30000
G1 X163.172 Y100.885 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X163.737 Y101.45 E.02988
G1 X163.501 Y101.863 E.01783
G1 X162.839 Y101.202 E.03501
G3 X162.27 Y101.282 I-.684 J-2.807 E.02158
G1 X163.264 Y102.277 E.05267
G1 X163.028 Y102.69 E.01783
G1 X161.373 Y101.035 E.08763
; WIPE_START
G1 F24000
G1 X162.787 Y102.449 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-1.195 J.231 P1  F30000
G1 X162.943 Y103.255 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X160.784 Y101.096 E.11429
G3 X158.409 Y98.721 I1.209 J-3.584 E.13032
G1 X153.934 Y94.246 E.23693
G1 X153.284 Y94.246 E.02432
G1 X162.556 Y103.517 E.49089
G1 X162.319 Y103.931 E.01783
G1 X152.634 Y94.246 E.51278
G1 X151.984 Y94.246 E.02432
G1 X162.083 Y104.344 E.53467
G1 X161.847 Y104.758 E.01783
G1 X151.335 Y94.246 E.55656
G1 X150.685 Y94.246 E.02432
G1 X161.61 Y105.171 E.57846
G1 X161.374 Y105.585 E.01783
G1 X150.035 Y94.246 E.60035
G1 X149.385 Y94.246 E.02432
G1 X161.138 Y105.998 E.62224
G1 X160.902 Y106.412 E.01783
G1 X148.736 Y94.246 E.64413
G1 X148.086 Y94.246 E.02432
G1 X160.665 Y106.825 E.66602
G1 X160.429 Y107.238 E.01783
G1 X147.436 Y94.246 E.68791
G1 X146.787 Y94.246 E.02432
G1 X160.193 Y107.652 E.7098
G1 X159.957 Y108.065 E.01783
G1 X146.137 Y94.246 E.73169
G1 X145.487 Y94.246 E.02432
G1 X159.72 Y108.479 E.75358
G1 X159.484 Y108.892 E.01783
G1 X144.837 Y94.246 E.77548
G1 X144.188 Y94.246 E.02432
G1 X159.248 Y109.306 E.79737
G1 X159.012 Y109.719 E.01783
G1 X143.538 Y94.246 E.81926
G1 X142.888 Y94.246 E.02432
G1 X158.775 Y110.133 E.84115
G1 X158.539 Y110.546 E.01783
G1 X142.238 Y94.246 E.86304
G1 X141.589 Y94.246 E.02432
G1 X158.303 Y110.96 E.88493
G1 X158.066 Y111.373 E.01783
G1 X140.939 Y94.246 E.90682
G1 X140.289 Y94.246 E.02432
G1 X157.83 Y111.787 E.92871
G1 X157.594 Y112.2 E.01783
G1 X139.639 Y94.246 E.95061
G1 X138.99 Y94.246 E.02432
G1 X157.358 Y112.614 E.9725
G1 X157.121 Y113.027 E.01783
G1 X138.34 Y94.246 E.99439
G1 X137.69 Y94.246 E.02432
G1 X156.885 Y113.44 E1.01628
G1 X156.649 Y113.854 E.01783
G1 X137.04 Y94.246 E1.03817
G1 X136.391 Y94.246 E.02432
G1 X156.413 Y114.267 E1.06006
G1 X156.176 Y114.681 E.01783
G1 X135.741 Y94.246 E1.08195
G1 X135.091 Y94.246 E.02432
G1 X155.94 Y115.094 E1.10384
G1 X155.704 Y115.508 E.01783
G1 X134.442 Y94.246 E1.12574
G1 X133.792 Y94.246 E.02432
G1 X155.468 Y115.921 E1.14763
G1 X155.231 Y116.335 E.01783
G1 X133.142 Y94.246 E1.16952
G1 X132.492 Y94.246 E.02432
G1 X154.995 Y116.748 E1.19141
G1 X154.759 Y117.162 E.01783
G1 X131.843 Y94.246 E1.2133
G1 X131.193 Y94.246 E.02432
G1 X154.522 Y117.575 E1.23519
M73 P24 R19
G1 X154.286 Y117.989 E.01783
G1 X130.543 Y94.246 E1.25708
G1 X129.893 Y94.246 E.02432
G1 X154.05 Y118.402 E1.27897
G1 X153.814 Y118.816 E.01783
G1 X129.244 Y94.246 E1.30087
G1 X128.594 Y94.246 E.02432
G1 X153.577 Y119.229 E1.32276
G1 X153.341 Y119.643 E.01783
G1 X127.944 Y94.246 E1.34465
G1 X127.294 Y94.246 E.02432
G1 X153.105 Y120.056 E1.36654
G1 X152.869 Y120.469 E.01783
G1 X126.645 Y94.246 E1.38843
G1 X125.995 Y94.246 E.02432
G1 X152.632 Y120.883 E1.41032
G1 X152.396 Y121.296 E.01783
G1 X125.345 Y94.246 E1.43221
G1 X124.696 Y94.246 E.02432
G1 X152.16 Y121.71 E1.4541
G1 X151.924 Y122.123 E.01783
G1 X124.046 Y94.246 E1.47599
G1 X123.396 Y94.246 E.02432
G1 X151.687 Y122.537 E1.49789
G1 X151.451 Y122.95 E.01783
G1 X122.746 Y94.246 E1.51978
G1 X122.097 Y94.246 E.02432
G1 X151.215 Y123.364 E1.54167
G1 X150.978 Y123.777 E.01783
G1 X121.447 Y94.246 E1.56356
G1 X120.797 Y94.246 E.02432
G1 X150.742 Y124.191 E1.58545
G1 X150.506 Y124.604 E.01783
G1 X120.147 Y94.246 E1.60734
G1 X119.498 Y94.246 E.02432
G1 X150.27 Y125.018 E1.62923
G1 X150.033 Y125.431 E.01783
G1 X118.848 Y94.246 E1.65112
G1 X118.198 Y94.246 E.02432
G1 X149.797 Y125.845 E1.67302
G1 X149.561 Y126.258 E.01783
G1 X117.548 Y94.246 E1.69491
G1 X116.899 Y94.246 E.02432
G1 X149.325 Y126.671 E1.7168
G1 X149.088 Y127.085 E.01783
G1 X116.249 Y94.246 E1.73869
G1 X115.599 Y94.246 E.02432
G1 X148.852 Y127.498 E1.76058
G1 X148.616 Y127.912 E.01783
G1 X114.949 Y94.246 E1.78247
G1 X114.3 Y94.246 E.02432
G1 X148.379 Y128.325 E1.80436
G1 X148.143 Y128.739 E.01783
G1 X113.65 Y94.246 E1.82625
G1 X113 Y94.246 E.02432
G1 X147.907 Y129.152 E1.84815
G1 X147.671 Y129.566 E.01783
G1 X112.351 Y94.246 E1.87004
G1 X111.701 Y94.246 E.02432
G1 X147.434 Y129.979 E1.89193
G1 X147.198 Y130.393 E.01783
G1 X111.051 Y94.246 E1.91382
G1 X110.401 Y94.246 E.02432
G1 X146.962 Y130.806 E1.93571
G1 X146.726 Y131.22 E.01783
G1 X109.752 Y94.246 E1.9576
M73 P25 R19
G1 X109.102 Y94.246 E.02432
G1 X146.489 Y131.633 E1.97949
G1 X146.253 Y132.047 E.01783
G1 X108.452 Y94.246 E2.00138
G1 X107.802 Y94.246 E.02432
G1 X146.017 Y132.46 E2.02327
G1 X145.781 Y132.874 E.01783
G1 X107.153 Y94.246 E2.04517
G1 X106.503 Y94.246 E.02432
G1 X145.544 Y133.287 E2.06706
G1 X145.308 Y133.7 E.01783
G1 X105.853 Y94.246 E2.08895
G1 X105.203 Y94.246 E.02432
G1 X145.072 Y134.114 E2.11084
G1 X144.835 Y134.527 E.01783
G1 X104.554 Y94.246 E2.13273
G1 X103.904 Y94.246 E.02432
G1 X144.599 Y134.941 E2.15462
G1 X144.363 Y135.354 E.01783
G1 X103.254 Y94.246 E2.17651
G1 X102.604 Y94.246 E.02432
G1 X144.127 Y135.768 E2.1984
G1 X143.89 Y136.181 E.01783
G1 X101.955 Y94.246 E2.2203
G1 X101.305 Y94.246 E.02432
G1 X143.654 Y136.595 E2.24219
G1 X143.418 Y137.008 E.01783
G1 X100.655 Y94.246 E2.26408
G1 X100.361 Y94.246 E.01103
G1 X100.234 Y94.432 E.00843
G3 X101.151 Y95.391 I-2.126 J2.952 E.04999
G1 X143.182 Y137.422 E2.2253
G1 X142.945 Y137.835 E.01783
G1 X101.674 Y96.564 E2.18511
G3 X101.783 Y97.323 I-3.304 J.861 E.02875
G1 X142.709 Y138.249 E2.16684
G1 X142.473 Y138.662 E.01783
G1 X101.765 Y97.954 E2.15528
G3 X101.66 Y98.499 I-4.401 J-.569 E.02077
G1 X142.237 Y139.076 E2.14835
G1 X142 Y139.489 E.01783
G1 X101.491 Y98.98 E2.14478
G3 X101.275 Y99.414 I-2.276 J-.861 E.01817
G1 X141.764 Y139.902 E2.14369
G1 X141.528 Y140.316 E.01783
G1 X101.016 Y99.804 E2.14489
G1 X100.712 Y100.15 E.01723
G1 X141.291 Y140.729 E2.14851
G1 X141.055 Y141.143 E.01783
G1 X100.374 Y100.462 E2.15387
M73 P26 R19
G3 X99.991 Y100.729 I-4.092 J-5.466 E.01748
G1 X140.819 Y141.556 E2.16164
G1 X140.583 Y141.97 E.01783
G1 X99.566 Y100.953 E2.17164
G3 X99.089 Y101.126 I-.929 J-1.814 E.01903
G1 X140.346 Y142.383 E2.18436
G1 X140.11 Y142.797 E.01783
G1 X133.589 Y136.276 E.34524
G2 X131.225 Y133.912 I-3.559 J1.195 E.12974
G1 X98.564 Y101.251 E1.72925
G3 X97.955 Y101.292 I-.576 J-4.016 E.02286
G1 X130.391 Y133.728 E1.71734
G2 X129.735 Y133.721 I-.363 J3.48 E.02461
G1 X97.223 Y101.209 E1.72135
G3 X96.511 Y100.989 I.524 J-2.954 E.028
G1 X96.428 Y101.063 E.00418
G1 X129.166 Y133.801 E1.73332
G2 X128.664 Y133.949 I.487 J2.582 E.01962
G1 X96.395 Y101.68 E1.70848
G1 X97.261 Y103.196 E.06537
G1 X128.22 Y134.155 E1.63912
G2 X127.819 Y134.404 I.628 J1.458 E.01773
G1 X98.127 Y104.712 E1.57204
G1 X98.994 Y106.229 E.06537
G1 X127.455 Y134.689 E1.50687
G2 X127.132 Y135.017 I1.473 J1.775 E.01723
G1 X99.86 Y107.745 E1.44392
G1 X100.726 Y109.261 E.06537
G1 X126.855 Y135.389 E1.38336
G2 X126.616 Y135.8 I1.246 J.995 E.01787
G1 X101.593 Y110.777 E1.32489
G1 X102.459 Y112.293 E.06537
G1 X126.419 Y136.253 E1.26857
G2 X126.277 Y136.76 I5.212 J1.731 E.01975
G1 X103.325 Y113.809 E1.21518
G1 X104.192 Y115.325 E.06537
G1 X126.211 Y137.344 E1.16583
G2 X126.204 Y137.987 I6.381 J.389 E.02408
G1 X105.058 Y116.841 E1.11961
G1 X105.924 Y118.357 E.06537
G1 X126.204 Y138.637 E1.07374
G1 X126.204 Y139.287 E.02432
G1 X106.791 Y119.873 E1.02787
G1 X107.657 Y121.389 E.06537
M73 P27 R19
G1 X126.204 Y139.937 E.982
G1 X126.204 Y140.586 E.02432
G1 X108.523 Y122.905 E.93614
G1 X109.39 Y124.421 E.06537
G1 X126.204 Y141.236 E.89027
G1 X126.204 Y141.886 E.02432
G1 X110.256 Y125.937 E.8444
G1 X111.122 Y127.453 E.06537
G1 X126.204 Y142.536 E.79853
G1 X126.204 Y143.185 E.02432
G1 X111.988 Y128.969 E.75267
G1 X112.855 Y130.485 E.06537
G1 X126.204 Y143.835 E.7068
G1 X126.204 Y144.485 E.02432
G1 X113.721 Y132.001 E.66093
G1 X114.587 Y133.517 E.06537
G1 X126.204 Y145.134 E.61506
G1 X126.204 Y145.784 E.02432
G1 X115.454 Y135.034 E.5692
G1 X116.32 Y136.55 E.06537
G1 X126.204 Y146.434 E.52333
G1 X126.204 Y147.084 E.02432
G1 X117.186 Y138.066 E.47746
G1 X118.053 Y139.582 E.06537
G1 X126.204 Y147.733 E.4316
G1 X126.204 Y148.383 E.02432
G1 X118.919 Y141.098 E.38573
G1 X119.785 Y142.614 E.06537
G1 X126.204 Y149.033 E.33986
G1 X126.204 Y149.683 E.02432
G1 X120.652 Y144.13 E.29399
G1 X121.518 Y145.646 E.06537
G1 X126.204 Y150.332 E.24813
G2 X126.244 Y151.022 I4.916 J.062 E.02588
G1 X121.832 Y146.609 E.23363
; WIPE_START
G1 F24000
G1 X123.246 Y148.023 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.326 J1.173 P1  F30000
M73 P27 R18
G1 X140.025 Y143.361 Z.6
G1 Z.2
G1 E.8 F1800
G1 F6300
G1 X133.776 Y137.112 E.33083
G3 X133.796 Y137.782 I-9.068 J.6 E.02507
G1 X139.638 Y143.624 E.30931
G1 X139.401 Y144.037 E.01783
G1 X133.796 Y138.431 E.2968
G1 X133.796 Y139.081 E.02432
G1 X139.165 Y144.451 E.28429
G1 X138.929 Y144.864 E.01783
G1 X133.796 Y139.731 E.27178
M73 P28 R18
G1 X133.796 Y140.381 E.02432
G1 X138.693 Y145.278 E.25927
G1 X138.456 Y145.691 E.01783
G1 X133.796 Y141.03 E.24676
G1 X133.796 Y141.68 E.02432
G1 X138.22 Y146.104 E.23425
G1 X137.984 Y146.518 E.01783
G1 X133.796 Y142.33 E.22174
G1 X133.796 Y142.98 E.02432
G1 X137.747 Y146.931 E.20923
G1 X137.511 Y147.345 E.01783
G1 X133.796 Y143.629 E.19672
G1 X133.796 Y144.279 E.02432
G1 X137.275 Y147.758 E.18421
G1 X137.039 Y148.172 E.01783
G1 X133.796 Y144.929 E.1717
G1 X133.796 Y145.579 E.02432
G1 X136.802 Y148.585 E.1592
G1 X136.566 Y148.999 E.01783
G1 X133.796 Y146.228 E.14669
G1 X133.796 Y146.878 E.02432
G1 X136.33 Y149.412 E.13418
G1 X136.094 Y149.826 E.01783
G1 X133.796 Y147.528 E.12167
G1 X133.796 Y148.177 E.02432
G1 X135.857 Y150.239 E.10916
G1 X135.621 Y150.653 E.01783
G1 X133.796 Y148.827 E.09665
G1 X133.796 Y149.477 E.02432
G1 X135.385 Y151.066 E.08414
G1 X135.148 Y151.48 E.01783
G1 X133.796 Y150.127 E.07163
G3 X133.783 Y150.764 I-6.289 J.197 E.02388
G1 X134.912 Y151.893 E.05978
G1 X134.676 Y152.307 E.01783
G1 X133.7 Y151.33 E.05169
G1 X133.553 Y151.833 E.0196
G1 X134.44 Y152.72 E.04697
G1 X134.203 Y153.133 E.01783
G1 X133.351 Y152.281 E.04516
G1 X133.099 Y152.679 E.01764
G1 X133.967 Y153.547 E.04594
G1 X133.731 Y153.96 E.01783
G1 X132.815 Y153.044 E.04851
G3 X132.487 Y153.366 I-4.765 J-4.521 E.0172
G1 X133.495 Y154.374 E.05335
G1 X133.258 Y154.787 E.01783
G1 X132.117 Y153.646 E.06042
G3 X131.703 Y153.882 I-1.148 J-1.533 E.01788
G1 X133.022 Y155.201 E.06982
G1 X132.786 Y155.614 E.01783
G1 X131.249 Y154.077 E.08138
G3 X130.741 Y154.219 I-.821 J-1.954 E.01978
G1 X132.55 Y156.028 E.09574
G1 X132.313 Y156.441 E.01783
G1 X130.162 Y154.29 E.11389
G3 X129.478 Y154.256 I-.133 J-4.188 E.02567
G1 X132.077 Y156.855 E.13759
G1 X131.841 Y157.268 E.01783
G1 X128.601 Y154.029 E.17152
G3 X126.476 Y151.903 I1.425 J-3.551 E.11564
G1 X123.251 Y148.678 E.17076
G1 X124.117 Y150.194 E.06537
G1 X131.604 Y157.682 E.39643
G1 X131.368 Y158.095 E.01783
G1 X124.983 Y151.71 E.33806
G1 X125.85 Y153.226 E.06537
G1 X131.132 Y158.509 E.27968
G1 X130.896 Y158.922 E.01783
G1 X126.716 Y154.742 E.2213
G1 X127.582 Y156.258 E.06537
G1 X130.659 Y159.335 E.16293
G1 X130.423 Y159.749 E.01783
G1 X128.448 Y157.774 E.10455
G1 X129.315 Y159.29 E.06537
G1 X130.338 Y160.313 E.05415
; WIPE_START
G1 F24000
G1 X129.315 Y159.29 E-.54967
G1 X129.04 Y158.81 E-.21033
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.057 J-.603 P1  F30000
G1 X96.038 Y100.893 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.302348
G1 F3000
G1 X95.65 Y100.441 E.01258
; LINE_WIDTH: 0.299883
G1 X95.591 Y100.37 E.00193
; LINE_WIDTH: 0.265893
G1 X95.529 Y100.296 E.00176
; LINE_WIDTH: 0.233552
G1 X95.472 Y100.224 E.00142
; LINE_WIDTH: 0.204822
G1 X95.413 Y100.15 E.00125
; LINE_WIDTH: 0.176578
G1 X95.302 Y100.002 E.00201
; LINE_WIDTH: 0.130376
G1 X95.206 Y99.868 E.00117
G1 X95.252 Y100.002 F30000
; LINE_WIDTH: 0.380142
G1 F3000
G1 X96.046 Y100.884 E.03262
; WIPE_START
G1 F24000
G1 X95.252 Y100.002 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.068 J-.584 P1  F30000
G1 X94.542 Y98.706 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.10322
G1 F3000
G1 X94.487 Y98.583 E.00066
; LINE_WIDTH: 0.124222
G1 X94.415 Y98.411 E.00123
; LINE_WIDTH: 0.168932
G1 X94.382 Y98.326 E.00094
; LINE_WIDTH: 0.197116
G1 X94.347 Y98.236 E.00121
; LINE_WIDTH: 0.2242
G1 X94.316 Y98.15 E.00136
; LINE_WIDTH: 0.283289
G3 X94.077 Y97.467 I27.032 J-9.82 E.01415
G1 X94.09 Y97.465 F30000
; LINE_WIDTH: 0.362064
G1 F3000
G1 X94.457 Y98.612 E.03133
G1 X94.411 Y98.531 F30000
; LINE_WIDTH: 0.448374
G1 F3000
G3 X94.101 Y97.462 I42.846 J-12.986 E.03677
; WIPE_START
G1 F24000
G1 X94.411 Y98.531 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I1.211 J.12 P1  F30000
G1 X94.854 Y94.04 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.536072
G1 F6300
G1 X95.481 Y94.666 E.0356
G2 X95.133 Y95.016 I1.572 J1.913 E.01985
G1 X94.363 Y94.246 E.04377
G1 X93.665 Y94.246 E.02803
G1 X94.832 Y95.413 E.06632
G2 X94.582 Y95.859 I2.108 J1.475 E.02062
G1 X92.968 Y94.246 E.09172
G1 X92.27 Y94.246 E.02803
G1 X94.381 Y96.357 E.11997
G1 X94.248 Y96.921 E.02331
G1 X92.358 Y95.031 E.10742
; WIPE_START
M73 P29 R18
G1 F24000
G1 X93.772 Y96.445 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.806 J.912 P1  F30000
G1 X96.166 Y94.329 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.133859
G1 F3000
G1 X96.319 Y94.225 E.00137
; LINE_WIDTH: 0.156223
G3 X96.482 Y94.138 I.389 J.536 E.0017
G1 X96.623 Y94.108 E.00133
; WIPE_START
G1 F24000
G1 X96.482 Y94.138 E-.33453
G1 X96.319 Y94.225 E-.42547
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I.178 J1.204 P1  F30000
G1 X98 Y93.977 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.369096
G1 F3000
G1 X98 Y93.629 E.00925
G1 X98 Y93.977 F30000
; LINE_WIDTH: 0.339233
G1 F3000
G1 X98 Y94.324 E.0084
; WIPE_START
G1 F24000
G1 X98 Y93.977 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.6 I-.116 J1.211 P1  F30000
G1 X99.377 Y94.108 Z.6
G1 Z.2
G1 E.8 F1800
; LINE_WIDTH: 0.145288
G1 F3000
G3 X99.679 Y94.223 I-.029 J.527 E.00274
; LINE_WIDTH: 0.103298
G1 X99.834 Y94.329 E.00092
M106 S216.75
M106 P2 S178
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X99.679 Y94.223 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/88
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
G3 Z.6 I-1 J.694 P1  F30000
G1 X128.021 Y135.048 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.035 Y135.036 E.00061
G3 X129.921 Y134.349 I1.967 J2.466 E.06777
G3 X133.152 Y137.493 I.07 J3.16 E.16647
G1 X133.152 Y150.509 E.43178
G3 X126.848 Y150.507 I-3.152 J-.01 E.32789
G1 X126.848 Y137.493 E.43173
G3 X127.8 Y135.244 I3.154 J.01 E.08316
G1 X127.976 Y135.087 E.00782
G1 X128.255 Y135.364 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.28 Y135.343 E.001
G3 X129.931 Y134.741 I1.722 J2.159 E.05497
G3 X132.76 Y137.497 I.061 J2.767 E.13514
G1 X132.76 Y150.503 E.39963
G3 X127.24 Y150.503 I-2.76 J-.004 E.26621
G1 X127.24 Y137.497 E.39961
G3 X128.073 Y135.525 I2.762 J.005 E.06757
G1 X128.21 Y135.404 E.0056
M204 S10000
; WIPE_START
G1 F24000
G1 X128.28 Y135.343 E-.03522
G1 X128.503 Y135.181 E-.10455
G1 X128.74 Y135.044 E-.10438
G1 X128.992 Y134.931 E-.10473
G1 X129.252 Y134.843 E-.10457
G1 X129.521 Y134.782 E-.10455
G1 X129.931 Y134.741 E-.15676
G1 X130.05 Y134.744 E-.04524
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I.962 J-.745 P1  F30000
G1 X98.836 Y94.461 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X98.854 Y94.466 E.00061
G3 X97.921 Y94.349 I-.854 J3.034 E.62562
G1 X98.079 Y94.349 E.00521
G3 X98.547 Y94.396 I-.079 J3.151 E.01564
G1 X98.777 Y94.448 E.00783
G1 X98.737 Y94.841 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.748 Y94.843 E.00034
G3 X97.931 Y94.741 I-.748 J2.656 E.50741
G1 X98.069 Y94.741 E.00423
G3 X98.479 Y94.782 I-.069 J2.759 E.01269
G1 X98.678 Y94.827 E.00627
M204 S10000
; WIPE_START
G1 F24000
G1 X98.748 Y94.843 E-.02705
G1 X99.008 Y94.931 E-.10456
G1 X99.259 Y95.044 E-.10456
G1 X99.497 Y95.181 E-.10456
G1 X99.721 Y95.342 E-.10455
G1 X99.927 Y95.524 E-.10456
G1 X100.114 Y95.726 E-.10456
G1 X100.28 Y95.945 E-.10455
G1 X100.282 Y95.948 E-.00103
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.041 J1.216 P1  F30000
G1 X165.082 Y98.151 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X164.962 Y98.578 E.01472
G3 X161.921 Y94.349 I-2.962 J-1.078 E.45356
G1 X162.079 Y94.349 E.00521
G3 X165.095 Y98.092 I-.079 J3.151 E.18141
G1 X164.705 Y98.047 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X161.931 Y94.741 I-2.705 J-.547 E.38055
G1 X162.069 Y94.741 E.00423
G3 X164.716 Y97.988 I-.069 J2.759 E.14617
M204 S10000
; WIPE_START
G1 F24000
G1 X164.594 Y98.444 E-.17947
G1 X164.487 Y98.698 E-.10455
G1 X164.355 Y98.939 E-.10456
G1 X164.2 Y99.167 E-.10456
G1 X164.023 Y99.377 E-.10456
G1 X163.826 Y99.569 E-.10456
G1 X163.708 Y99.664 E-.05774
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-1.07 J-.58 P1  F30000
G1 X130 Y161.786 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X91.037 Y93.602 E2.60503
G1 X168.963 Y93.602 E2.58492
G1 X130.03 Y161.734 E2.60304
G1 X130 Y162.577 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X90.362 Y93.21 E2.4549
G1 X169.638 Y93.21 E2.43594
G1 X130.03 Y162.525 E2.45305
M204 S10000
; WIPE_START
G1 F24000
G1 X129.036 Y160.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z.8 I-.28 J1.184 P1  F30000
G1 X129.709 Y160.948 Z.8
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421112
G1 F15000
G1 X130.61 Y160.047 E.03926
G1 X131.323 Y158.799 E.0443
G1 X129.639 Y160.483 E.0734
G1 X129.445 Y160.143 E.01208
G1 X132.036 Y157.551 E.11296
G1 X132.749 Y156.303 E.0443
G1 X129.25 Y159.803 E.15251
G1 X129.056 Y159.462 E.01208
G1 X133.463 Y155.055 E.19207
G1 X134.176 Y153.807 E.0443
G1 X128.861 Y159.122 E.23162
G1 X128.667 Y158.781 E.01208
G1 X134.889 Y152.559 E.27118
G1 X135.602 Y151.311 E.0443
G1 X128.472 Y158.441 E.31074
G1 X128.278 Y158.101 E.01208
G1 X136.315 Y150.063 E.35029
G1 X137.028 Y148.815 E.0443
G1 X128.083 Y157.76 E.38985
G1 X127.889 Y157.42 E.01208
G1 X137.741 Y147.567 E.42941
G1 X138.454 Y146.319 E.0443
G1 X133.352 Y151.422 E.22236
G2 X133.473 Y150.766 I-3.12 J-.912 E.02056
G1 X139.168 Y145.071 E.2482
G1 X139.881 Y143.823 E.0443
G1 X133.485 Y150.219 E.27873
G1 X133.485 Y149.684 E.01648
G1 X140.594 Y142.576 E.30981
G1 X141.307 Y141.328 E.0443
G1 X133.485 Y149.149 E.34089
G1 X133.485 Y148.614 E.01648
G1 X142.02 Y140.08 E.37197
G1 X142.733 Y138.832 E.0443
G1 X133.485 Y148.08 E.40305
G1 X133.485 Y147.545 E.01648
G1 X143.446 Y137.584 E.43413
G1 X144.159 Y136.336 E.0443
G1 X133.485 Y147.01 E.46521
G1 X133.485 Y146.475 E.01648
G1 X144.873 Y135.088 E.49629
G1 X145.586 Y133.84 E.0443
G1 X133.485 Y145.94 E.52737
G1 X133.485 Y145.405 E.01648
G1 X146.299 Y132.592 E.55845
G1 X147.012 Y131.344 E.0443
G1 X133.485 Y144.87 E.58953
G1 X133.485 Y144.336 E.01648
G1 X147.725 Y130.096 E.62061
G1 X148.438 Y128.848 E.0443
G1 X133.485 Y143.801 E.65169
G1 X133.485 Y143.266 E.01648
G1 X149.151 Y127.6 E.68277
G1 X149.864 Y126.352 E.0443
G1 X133.485 Y142.731 E.71385
G1 X133.485 Y142.196 E.01648
G1 X150.578 Y125.104 E.74493
G1 X151.291 Y123.856 E.0443
G1 X133.485 Y141.661 E.77601
G1 X133.485 Y141.127 E.01648
G1 X152.004 Y122.608 E.80709
G1 X152.717 Y121.36 E.0443
G1 X133.485 Y140.592 E.83817
G1 X133.485 Y140.057 E.01648
G1 X153.43 Y120.112 E.86925
G1 X154.143 Y118.864 E.0443
G1 X133.485 Y139.522 E.90033
G1 X133.485 Y138.987 E.01648
G1 X154.856 Y117.616 E.93141
G1 X155.569 Y116.368 E.0443
G1 X133.485 Y138.452 E.96249
G1 X133.485 Y137.917 E.01648
G1 X156.283 Y115.12 E.99357
G1 X156.996 Y113.872 E.0443
G1 X133.48 Y137.388 E1.02487
G2 X133.431 Y136.902 I-2.464 J.007 E.01506
G1 X157.709 Y112.624 E1.05811
G1 X158.422 Y111.376 E.0443
G1 X133.33 Y136.469 E1.0936
G2 X133.181 Y136.082 I-2.006 J.547 E.01278
G1 X159.135 Y110.128 E1.13114
G1 X159.848 Y108.88 E.0443
G1 X132.999 Y135.73 E1.17019
G2 X132.784 Y135.41 I-1.708 J.911 E.0119
G1 X160.561 Y107.632 E1.21061
G1 X161.274 Y106.384 E.0443
G1 X132.54 Y135.119 E1.25233
G2 X132.267 Y134.857 I-1.444 J1.234 E.01168
G1 X161.988 Y105.136 E1.29532
G1 X162.701 Y103.888 E.0443
G1 X131.965 Y134.625 E1.33957
G2 X131.632 Y134.422 I-1.177 J1.56 E.01201
G1 X163.414 Y102.641 E1.38514
G1 X164.127 Y101.393 E.0443
G1 X131.267 Y134.253 E1.43215
G2 X130.86 Y134.125 I-.842 J1.971 E.01317
G1 X164.852 Y100.124 E1.48168
G1 X164.525 Y99.925 E.0118
G1 X130.408 Y134.042 E1.48693
G2 X129.899 Y134.016 I-.504 J4.842 E.0157
G1 X163.11 Y100.804 E1.44746
G3 X162.42 Y100.96 I-1.4 J-4.604 E.02182
G1 X129.289 Y134.091 E1.44396
G2 X128.463 Y134.382 I.646 J3.15 E.02707
G1 X161.866 Y100.979 E1.45579
G3 X161.381 Y100.93 I.256 J-4.912 E.01504
G1 X119.526 Y142.785 E1.82417
G1 X119.72 Y143.125 E.01208
G1 X126.88 Y135.966 E.31203
G2 X126.587 Y136.793 I2.989 J1.521 E.02711
G1 X119.915 Y143.465 E.29082
G1 X120.109 Y143.806 E.01208
G1 X126.519 Y137.396 E.27937
G2 X126.515 Y137.935 I5.336 J.314 E.01663
G1 X120.304 Y144.146 E.27069
G1 X120.498 Y144.487 E.01208
G1 X126.515 Y138.47 E.26222
G1 X126.515 Y139.005 E.01648
G1 X120.693 Y144.827 E.25374
G1 X120.887 Y145.167 E.01208
G1 X126.515 Y139.54 E.24527
G1 X126.515 Y140.075 E.01648
G1 X121.082 Y145.508 E.23679
G1 X121.276 Y145.848 E.01208
G1 X126.515 Y140.609 E.22831
G1 X126.515 Y141.144 E.01648
G1 X121.471 Y146.188 E.21984
G1 X121.665 Y146.529 E.01208
G1 X126.515 Y141.679 E.21136
G1 X126.515 Y142.214 E.01648
G1 X121.86 Y146.869 E.20288
G1 X122.054 Y147.209 E.01208
G1 X126.515 Y142.749 E.19441
G1 X126.515 Y143.284 E.01648
G1 X122.249 Y147.55 E.18593
G1 X122.443 Y147.89 E.01208
G1 X126.515 Y143.818 E.17745
G1 X126.515 Y144.353 E.01648
G1 X122.638 Y148.23 E.16898
G1 X122.832 Y148.571 E.01208
G1 X126.515 Y144.888 E.1605
G1 X126.515 Y145.423 E.01648
G1 X123.027 Y148.911 E.15202
G1 X123.221 Y149.252 E.01208
G1 X126.515 Y145.958 E.14355
G1 X126.515 Y146.493 E.01648
G1 X123.415 Y149.592 E.13507
G1 X123.61 Y149.932 E.01208
G1 X126.515 Y147.028 E.1266
G1 X126.515 Y147.562 E.01648
G1 X123.804 Y150.273 E.11812
G1 X123.999 Y150.613 E.01208
G1 X126.515 Y148.097 E.10964
M73 P30 R18
G1 X126.515 Y148.632 E.01648
G1 X124.193 Y150.953 E.10117
G1 X124.388 Y151.294 E.01208
G1 X126.515 Y149.167 E.09269
G1 X126.515 Y149.702 E.01648
G1 X124.582 Y151.634 E.08421
G1 X124.777 Y151.974 E.01208
G1 X126.515 Y150.237 E.07574
G2 X126.527 Y150.759 I5.179 J.14 E.01612
G1 X124.971 Y152.315 E.0678
G1 X125.166 Y152.655 E.01208
G1 X126.593 Y151.228 E.06219
G2 X126.711 Y151.644 I2.139 J-.385 E.01336
G1 X125.36 Y152.995 E.05888
G1 X125.555 Y153.336 E.01208
G1 X126.869 Y152.022 E.05726
G2 X127.06 Y152.366 I1.813 J-.784 E.01214
G1 X125.749 Y153.676 E.05712
G1 X125.944 Y154.016 E.01208
G1 X127.282 Y152.678 E.05833
G2 X127.534 Y152.961 I1.54 J-1.117 E.01169
G1 X126.138 Y154.357 E.06083
G1 X126.333 Y154.697 E.01208
G1 X127.815 Y153.215 E.06459
G2 X128.126 Y153.438 I6.142 J-8.238 E.01181
G1 X126.527 Y155.038 E.06969
G1 X126.722 Y155.378 E.01208
G1 X128.47 Y153.629 E.07621
G2 X128.849 Y153.786 I.972 J-1.811 E.01264
G1 X126.916 Y155.718 E.08421
G1 X127.111 Y156.059 E.01208
G1 X129.266 Y153.904 E.09392
G2 X129.729 Y153.975 I.588 J-2.28 E.01448
G1 X127.305 Y156.399 E.10565
G1 X127.5 Y156.739 E.01208
G1 X130.268 Y153.971 E.12064
G2 X130.919 Y153.855 I-.228 J-3.155 E.02043
G1 X127.57 Y157.204 E.14597
G1 X119.207 Y142.569 F30000
G1 F15000
G1 X160.954 Y100.821 E1.81947
G3 X160.568 Y100.673 I.547 J-2.006 E.01278
G1 X119.137 Y142.104 E1.80568
G1 X118.942 Y141.764 E.01208
G1 X160.216 Y100.49 E1.79883
G3 X159.896 Y100.275 I.914 J-1.706 E.0119
G1 X118.748 Y141.423 E1.79336
G1 X118.553 Y141.083 E.01208
G1 X159.606 Y100.031 E1.78919
G3 X159.345 Y99.757 I1.237 J-1.442 E.01168
G1 X118.359 Y140.743 E1.78629
G1 X118.164 Y140.402 E.01208
G1 X159.113 Y99.453 E1.78468
G3 X158.915 Y99.117 I1.58 J-1.162 E.01205
G1 X117.97 Y140.062 E1.78449
G1 X117.775 Y139.722 E.01208
G1 X158.749 Y98.748 E1.78576
G3 X158.621 Y98.341 I1.97 J-.842 E.01317
G1 X117.581 Y139.381 E1.78867
G1 X117.386 Y139.041 E.01208
G1 X158.538 Y97.889 E1.7935
G3 X158.52 Y97.372 I4.156 J-.398 E.01597
G1 X117.192 Y138.7 E1.80123
G1 X116.997 Y138.36 E.01208
G1 X158.596 Y96.761 E1.813
G3 X158.888 Y95.934 I3.692 J.839 E.02709
G1 X116.803 Y138.02 E1.8342
G1 X116.608 Y137.679 E.01208
G1 X160.352 Y93.935 E1.9065
G1 X159.818 Y93.935 E.01648
G1 X116.414 Y137.339 E1.89167
G1 X116.219 Y136.999 E.01208
G1 X159.283 Y93.935 E1.87683
G1 X158.748 Y93.935 E.01648
G1 X116.025 Y136.658 E1.862
G1 X115.83 Y136.318 E.01208
G1 X158.213 Y93.935 E1.84717
G1 X157.678 Y93.935 E.01648
G1 X115.636 Y135.978 E1.83233
G1 X115.441 Y135.637 E.01208
G1 X157.143 Y93.935 E1.8175
G1 X156.609 Y93.935 E.01648
G1 X115.247 Y135.297 E1.80266
G1 X115.052 Y134.957 E.01208
G1 X156.074 Y93.935 E1.78783
G1 X155.539 Y93.935 E.01648
G1 X114.858 Y134.616 E1.773
G1 X114.663 Y134.276 E.01208
G1 X155.004 Y93.935 E1.75816
G1 X154.469 Y93.935 E.01648
G1 X114.469 Y133.936 E1.74333
G1 X114.275 Y133.595 E.01208
G1 X153.934 Y93.935 E1.7285
G1 X153.399 Y93.935 E.01648
G1 X114.08 Y133.255 E1.71366
G1 X113.886 Y132.914 E.01208
G1 X152.865 Y93.935 E1.69883
G1 X152.33 Y93.935 E.01648
G1 X113.691 Y132.574 E1.68399
G1 X113.497 Y132.234 E.01208
G1 X151.795 Y93.935 E1.66916
G1 X151.26 Y93.935 E.01648
G1 X113.302 Y131.893 E1.65433
G1 X113.108 Y131.553 E.01208
G1 X150.725 Y93.935 E1.63949
G1 X150.19 Y93.935 E.01648
G1 X112.913 Y131.213 E1.62466
G1 X112.719 Y130.872 E.01208
G1 X149.656 Y93.935 E1.60983
G1 X149.121 Y93.935 E.01648
G1 X112.524 Y130.532 E1.59499
G1 X112.33 Y130.192 E.01208
G1 X148.586 Y93.935 E1.58016
G1 X148.051 Y93.935 E.01648
G1 X112.135 Y129.851 E1.56532
G1 X111.941 Y129.511 E.01208
G1 X147.516 Y93.935 E1.55049
G1 X146.981 Y93.935 E.01648
G1 X111.746 Y129.171 E1.53566
G1 X111.552 Y128.83 E.01208
G1 X146.447 Y93.935 E1.52082
G1 X145.912 Y93.935 E.01648
G1 X111.357 Y128.49 E1.50599
G1 X111.163 Y128.149 E.01208
G1 X145.377 Y93.935 E1.49116
G1 X144.842 Y93.935 E.01648
G1 X110.968 Y127.809 E1.47632
G1 X110.774 Y127.469 E.01208
G1 X144.307 Y93.935 E1.46149
G1 X143.772 Y93.935 E.01648
G1 X110.579 Y127.128 E1.44665
G1 X110.385 Y126.788 E.01208
G1 X143.237 Y93.935 E1.43182
G1 X142.703 Y93.935 E.01648
G1 X110.19 Y126.448 E1.41699
G1 X109.996 Y126.107 E.01208
G1 X142.168 Y93.935 E1.40215
G1 X141.633 Y93.935 E.01648
G1 X109.801 Y125.767 E1.38732
G1 X109.607 Y125.427 E.01208
G1 X141.098 Y93.935 E1.37249
G1 X140.563 Y93.935 E.01648
G1 X109.412 Y125.086 E1.35765
G1 X109.218 Y124.746 E.01208
G1 X140.028 Y93.935 E1.34282
G1 X139.494 Y93.935 E.01648
G1 X109.023 Y124.406 E1.32799
G1 X108.829 Y124.065 E.01208
G1 X138.959 Y93.935 E1.31315
G1 X138.424 Y93.935 E.01648
G1 X108.634 Y123.725 E1.29832
G1 X108.44 Y123.384 E.01208
G1 X137.889 Y93.935 E1.28348
G1 X137.354 Y93.935 E.01648
G1 X108.245 Y123.044 E1.26865
G1 X108.051 Y122.704 E.01208
G1 X136.819 Y93.935 E1.25382
G1 X136.284 Y93.935 E.01648
G1 X107.856 Y122.363 E1.23898
G1 X107.662 Y122.023 E.01208
G1 X135.75 Y93.935 E1.22415
G1 X135.215 Y93.935 E.01648
G1 X107.467 Y121.683 E1.20932
G1 X107.273 Y121.342 E.01208
G1 X134.68 Y93.935 E1.19448
G1 X134.145 Y93.935 E.01648
G1 X107.078 Y121.002 E1.17965
G1 X106.884 Y120.662 E.01208
G1 X133.61 Y93.935 E1.16481
G1 X133.075 Y93.935 E.01648
G1 X106.689 Y120.321 E1.14998
G1 X106.495 Y119.981 E.01208
G1 X132.541 Y93.935 E1.13515
G1 X132.006 Y93.935 E.01648
G1 X106.3 Y119.641 E1.12031
G1 X106.106 Y119.3 E.01208
G1 X131.471 Y93.935 E1.10548
G1 X130.936 Y93.935 E.01648
G1 X105.911 Y118.96 E1.09065
G1 X105.717 Y118.62 E.01208
G1 X130.401 Y93.935 E1.07581
G1 X129.866 Y93.935 E.01648
G1 X105.523 Y118.279 E1.06098
G1 X105.328 Y117.939 E.01208
G1 X129.331 Y93.935 E1.04614
G1 X128.797 Y93.935 E.01648
G1 X105.134 Y117.598 E1.03131
G1 X104.939 Y117.258 E.01208
G1 X128.262 Y93.935 E1.01648
G1 X127.727 Y93.935 E.01648
G1 X104.745 Y116.918 E1.00164
G1 X104.55 Y116.577 E.01208
G1 X127.192 Y93.935 E.98681
M73 P31 R18
G1 X126.657 Y93.935 E.01648
G1 X104.356 Y116.237 E.97198
G1 X104.161 Y115.897 E.01208
G1 X126.122 Y93.935 E.95714
G1 X125.588 Y93.935 E.01648
G1 X103.967 Y115.556 E.94231
G1 X103.772 Y115.216 E.01208
G1 X125.053 Y93.935 E.92747
G1 X124.518 Y93.935 E.01648
G1 X103.578 Y114.876 E.91264
G1 X103.383 Y114.535 E.01208
G1 X123.983 Y93.935 E.89781
G1 X123.448 Y93.935 E.01648
G1 X103.189 Y114.195 E.88297
G1 X102.994 Y113.855 E.01208
G1 X122.913 Y93.935 E.86814
G1 X122.379 Y93.935 E.01648
G1 X102.8 Y113.514 E.85331
G1 X102.605 Y113.174 E.01208
G1 X121.844 Y93.935 E.83847
G1 X121.309 Y93.935 E.01648
G1 X102.411 Y112.833 E.82364
G1 X102.216 Y112.493 E.01208
G1 X120.774 Y93.935 E.8088
G1 X120.239 Y93.935 E.01648
G1 X102.022 Y112.153 E.79397
G1 X101.827 Y111.812 E.01208
G1 X119.704 Y93.935 E.77914
G1 X119.169 Y93.935 E.01648
G1 X101.633 Y111.472 E.7643
G1 X101.438 Y111.132 E.01208
G1 X118.635 Y93.935 E.74947
G1 X118.1 Y93.935 E.01648
G1 X101.244 Y110.791 E.73464
G1 X101.049 Y110.451 E.01208
G1 X117.565 Y93.935 E.7198
G1 X117.03 Y93.935 E.01648
G1 X100.855 Y110.111 E.70497
G1 X100.66 Y109.77 E.01208
G1 X116.495 Y93.935 E.69013
G1 X115.96 Y93.935 E.01648
G1 X100.466 Y109.43 E.6753
G1 X100.271 Y109.09 E.01208
G1 X115.426 Y93.935 E.66047
G1 X114.891 Y93.935 E.01648
G1 X100.077 Y108.749 E.64563
G1 X99.882 Y108.409 E.01208
G1 X114.356 Y93.935 E.6308
G1 X113.821 Y93.935 E.01648
G1 X99.688 Y108.068 E.61597
G1 X99.493 Y107.728 E.01208
G1 X113.286 Y93.935 E.60113
G1 X112.751 Y93.935 E.01648
G1 X99.299 Y107.388 E.5863
G1 X99.104 Y107.047 E.01208
G1 X112.216 Y93.935 E.57147
G1 X111.682 Y93.935 E.01648
G1 X98.91 Y106.707 E.55663
G1 X98.715 Y106.367 E.01208
G1 X111.147 Y93.935 E.5418
G1 X110.612 Y93.935 E.01648
G1 X98.521 Y106.026 E.52696
G1 X98.326 Y105.686 E.01208
G1 X110.077 Y93.935 E.51213
G1 X109.542 Y93.935 E.01648
G1 X98.132 Y105.346 E.4973
G1 X97.937 Y105.005 E.01208
G1 X109.007 Y93.935 E.48246
G1 X108.473 Y93.935 E.01648
G1 X97.743 Y104.665 E.46763
G1 X97.548 Y104.325 E.01208
G1 X107.938 Y93.935 E.4528
G1 X107.403 Y93.935 E.01648
G1 X97.354 Y103.984 E.43796
G1 X97.159 Y103.644 E.01208
G1 X106.868 Y93.935 E.42313
G1 X106.333 Y93.935 E.01648
G1 X96.965 Y103.304 E.40829
G1 X96.771 Y102.963 E.01208
G1 X98.858 Y100.875 E.091
G3 X98.222 Y100.977 I-.971 J-4.025 E.0199
G1 X96.576 Y102.623 E.07172
G1 X96.382 Y102.282 E.01208
G1 X97.7 Y100.964 E.05746
G3 X97.236 Y100.893 I.003 J-1.575 E.01452
G1 X96.187 Y101.942 E.04572
G1 X95.993 Y101.602 E.01208
G1 X96.819 Y100.775 E.03602
G1 X96.443 Y100.617 E.01258
G1 X95.798 Y101.261 E.0281
G1 X95.604 Y100.921 E.01208
G1 X96.107 Y100.418 E.02194
G3 X95.795 Y100.195 I.733 J-1.356 E.01185
G1 X95.409 Y100.581 E.01682
G1 X95.215 Y100.24 E.01208
G1 X95.635 Y99.82 E.01833
G1 X95.118 Y99.752 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.596597
G1 F11378.492
G1 X94.73 Y99.09 E.03464
G1 X94.867 Y98.729 E.01741
G1 X94.537 Y98.182 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X94.472 Y97.836 E.01082
G3 X94.618 Y96.44 I3.759 J-.311 E.0434
G1 X94.88 Y95.819 E.02069
G3 X96.305 Y94.413 I2.962 J1.575 E.06247
G1 X96.231 Y94.282 E.00462
G3 X96.364 Y93.994 I.608 J.108 E.00986
G1 X91.713 Y93.994 E.14292
G1 X94.244 Y98.423 E.15675
G1 X94.378 Y98.196 E.00811
G1 X94.477 Y98.187 E.00307
G1 X94.083 Y97.382 F30000
G1 F15000
G3 X94.533 Y95.673 I4.351 J.231 E.05467
G3 X95.642 Y94.371 I3.778 J2.096 E.0529
G1 X92.363 Y94.371 E.10075
G1 X94.053 Y97.33 E.1047
G1 X93.883 Y96.272 F30000
G1 F15000
G1 X94.185 Y95.527 E.02471
G1 X94.533 Y94.962 E.02037
G1 X94.707 Y94.748 E.00848
G1 X93.013 Y94.748 E.05207
M73 P31 R17
G1 X93.853 Y96.22 E.05208
G1 X93.852 Y95.155 F30000
; LINE_WIDTH: 0.599868
G1 F11311.649
G2 X93.857 Y95.267 I-.031 J.058 E.01245
G1 X96.888 Y94.328 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.443467
G1 F15000
G1 X97.042 Y94.075 E.00964
; LINE_WIDTH: 0.480656
G1 F14392.253
G1 X97.066 Y94.037 E.00162
G1 X97.2 Y94.02 E.00484
; LINE_WIDTH: 0.43833
G1 F15000
G1 X97.378 Y94.002 E.00576
; LINE_WIDTH: 0.410916
G1 X97.555 Y93.989 E.00533
; LINE_WIDTH: 0.387196
G1 X98.259 Y93.98 E.01975
; LINE_WIDTH: 0.420461
G1 X98.612 Y94.001 E.01087
; LINE_WIDTH: 0.467961
G1 F14822.126
G1 X98.789 Y94.019 E.00616
; LINE_WIDTH: 0.499591
G1 F13795.497
G1 X98.934 Y94.037 E.00544
G1 X98.946 Y94.056 E.00084
; LINE_WIDTH: 0.443461
G1 F15000
G1 X98.958 Y94.075 E.00074
; LINE_WIDTH: 0.421771
G1 X99.112 Y94.328 E.00911
G1 X99.364 Y94.486 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421112
G1 F15000
G1 X99.915 Y93.935 E.02402
G1 X100.45 Y93.935 E.01648
G1 X99.839 Y94.546 E.02662
G1 X100.157 Y94.763 E.01186
G1 X100.985 Y93.935 E.03607
G1 X101.52 Y93.935 E.01648
G1 X100.442 Y95.013 E.04697
G3 X100.696 Y95.294 I-.994 J1.154 E.0117
G1 X102.054 Y93.935 E.05921
G1 X102.589 Y93.935 E.01648
G1 X100.92 Y95.605 E.07277
G3 X101.111 Y95.948 I-1.042 J.808 E.01216
G1 X103.124 Y93.935 E.08772
G1 X103.659 Y93.935 E.01648
G1 X101.275 Y96.319 E.10389
G3 X101.397 Y96.732 I-2.003 J.816 E.01329
G1 X104.194 Y93.935 E.12189
G1 X104.729 Y93.935 E.01648
G1 X101.466 Y97.198 E.14219
G3 X101.472 Y97.727 I-1.751 J.285 E.01636
G1 X105.264 Y93.935 E.16524
G1 X105.798 Y93.935 E.01648
G1 X101.122 Y98.612 E.20381
G1 X160.888 Y94.328 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.443467
G1 F15000
G1 X161.042 Y94.075 E.00964
; LINE_WIDTH: 0.480656
G1 F14392.253
G1 X161.066 Y94.037 E.00162
G1 X161.2 Y94.02 E.00484
; LINE_WIDTH: 0.43833
G1 F15000
G1 X161.378 Y94.002 E.00576
; LINE_WIDTH: 0.410918
G1 X161.555 Y93.989 E.00533
; LINE_WIDTH: 0.387196
G1 X162.259 Y93.98 E.01975
; LINE_WIDTH: 0.420464
G1 X162.612 Y94.001 E.01086
; LINE_WIDTH: 0.467957
G1 F14822.265
G1 X162.789 Y94.019 E.00616
; LINE_WIDTH: 0.499598
G1 F13795.3
G1 X162.934 Y94.037 E.00544
G1 X162.946 Y94.056 E.00084
; LINE_WIDTH: 0.443499
G1 F15000
G1 X162.958 Y94.075 E.00074
; LINE_WIDTH: 0.421804
G1 X163.112 Y94.328 E.00912
G1 X165.458 Y98.185 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X165.619 Y98.198 E.00495
G1 X165.752 Y98.43 E.00821
G1 X168.287 Y93.994 E.15697
G2 X163.629 Y93.996 I-2.216 J293.184 E.14314
G1 X163.76 Y94.284 E.00974
G1 X163.698 Y94.397 E.00395
G1 X164.195 Y94.718 E.01818
G1 X164.703 Y95.208 E.02168
G1 X165.103 Y95.789 E.02168
G1 X165.381 Y96.438 E.02168
G1 X165.524 Y97.128 E.02168
G1 X165.528 Y97.834 E.02168
G1 X165.47 Y98.126 E.00914
G1 X165.905 Y97.402 F30000
G1 F15000
G1 X167.637 Y94.371 E.10727
G1 X164.353 Y94.371 E.1009
G1 X164.966 Y94.938 E.02564
G1 X165.415 Y95.576 E.02398
G1 X165.728 Y96.291 E.02398
G1 X165.894 Y97.054 E.02398
G1 X165.903 Y97.342 E.00888
G1 X166.116 Y96.274 F30000
G1 F15000
G1 X166.987 Y94.748 E.05399
G1 X165.297 Y94.748 E.05195
G1 X165.726 Y95.364 E.02307
G1 X166.098 Y96.217 E.02858
G1 X166.217 Y95.155 F30000
; LINE_WIDTH: 0.59996
G1 F11309.781
G2 X166.222 Y95.267 I-.031 J.058 E.01246
G1 X165.133 Y98.729 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.585724
G1 F11606.412
G1 X165.27 Y99.09 E.01707
G1 X164.882 Y99.752 E.03396
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X165.27 Y99.09 E-.50576
G1 X165.133 Y98.729 E-.25424
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/88
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
G3 Z.8 I-.851 J-.87 P1  F30000
G1 X128.021 Y135.048 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.035 Y135.036 E.00061
G3 X129.921 Y134.349 I1.967 J2.466 E.06778
G3 X133.152 Y137.493 I.07 J3.16 E.16647
G1 X133.152 Y150.51 E.4318
G3 X126.848 Y150.507 I-3.152 J-.01 E.32787
G1 X126.848 Y137.493 E.43173
G3 X127.8 Y135.244 I3.154 J.01 E.08316
G1 X127.976 Y135.087 E.00783
G1 X128.279 Y135.343 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.28 Y135.343 E.00003
G3 X129.931 Y134.741 I1.722 J2.159 E.05497
G3 X132.76 Y137.497 I.061 J2.767 E.13514
G1 X132.76 Y150.503 E.39964
G3 X127.24 Y150.503 I-2.76 J-.004 E.2662
G1 X127.24 Y137.497 E.39961
G3 X128.073 Y135.525 I2.762 J.005 E.06757
G1 X128.234 Y135.382 E.00659
M204 S10000
; WIPE_START
G1 F24000
G1 X128.28 Y135.343 E-.02304
G1 X128.503 Y135.181 E-.10455
G1 X128.865 Y134.984 E-.15676
G1 X129.121 Y134.884 E-.10456
G1 X129.386 Y134.809 E-.10457
G1 X129.657 Y134.761 E-.10456
G1 X129.931 Y134.741 E-.10456
G1 X130.082 Y134.745 E-.05741
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.962 J-.745 P1  F30000
G1 X98.871 Y94.471 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.152 Y94.566 E.00982
G3 X97.921 Y94.349 I-1.152 J2.934 E.6152
G1 X98.079 Y94.349 E.00521
G3 X98.814 Y94.455 I-.079 J3.151 E.02469
G1 X98.722 Y94.837 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.748 Y94.843 E.00081
G3 X97.931 Y94.741 I-.748 J2.656 E.50741
G1 X98.069 Y94.741 E.00423
G3 X98.479 Y94.782 I-.069 J2.759 E.01269
G1 X98.663 Y94.824 E.0058
M204 S10000
; WIPE_START
G1 F24000
G1 X98.748 Y94.843 E-.03278
G1 X99.008 Y94.931 E-.10455
G1 X99.259 Y95.044 E-.10456
G1 X99.497 Y95.181 E-.10457
G1 X99.721 Y95.342 E-.10456
G1 X99.927 Y95.524 E-.10456
G1 X100.114 Y95.726 E-.10456
G1 X100.273 Y95.935 E-.09987
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.041 J1.216 P1  F30000
G1 X165.092 Y98.107 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X165.089 Y98.124 E.00061
G3 X161.921 Y94.349 I-3.089 J-.625 E.4692
G1 X162.079 Y94.349 E.00521
G3 X165.136 Y97.814 I-.079 J3.151 E.17206
G1 X165.101 Y98.047 E.00783
G1 X164.705 Y98.047 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X161.931 Y94.741 I-2.705 J-.547 E.38055
G1 X162.069 Y94.741 E.00423
G3 X164.716 Y97.988 I-.069 J2.759 E.14617
M204 S10000
; WIPE_START
G1 F24000
G1 X164.637 Y98.314 E-.1273
G1 X164.543 Y98.572 E-.10456
G1 X164.424 Y98.82 E-.10456
G1 X164.28 Y99.055 E-.10456
G1 X164.008 Y99.393 E-.16506
G1 X163.826 Y99.569 E-.09622
G1 X163.708 Y99.664 E-.05773
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-1.07 J-.58 P1  F30000
G1 X130 Y161.786 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X91.037 Y93.602 E2.60503
G1 X168.963 Y93.602 E2.58492
G1 X162.811 Y104.368 E.41132
G1 X130.03 Y161.734 E2.19172
G1 X130 Y162.577 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X90.362 Y93.21 E2.4549
G1 X169.638 Y93.21 E2.43594
G1 X163.151 Y104.562 E.40177
G1 X130.03 Y162.525 E2.05129
M204 S10000
; WIPE_START
G1 F24000
G1 X129.036 Y160.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I-.153 J1.207 P1  F30000
G1 X130.291 Y160.948 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42107
G1 F15000
G1 X129.39 Y160.047 E.03925
G1 X128.677 Y158.8 E.04429
G1 X130.361 Y160.483 E.07337
G1 X130.555 Y160.143 E.01208
G1 X127.964 Y157.552 E.11292
G1 X127.251 Y156.304 E.04429
G1 X130.75 Y159.803 E.15247
G1 X130.944 Y159.462 E.01208
G1 X126.538 Y155.056 E.19202
G1 X125.825 Y153.808 E.04429
G1 X131.139 Y159.122 E.23157
G1 X131.333 Y158.782 E.01208
G1 X125.112 Y152.56 E.27111
G1 X124.399 Y151.313 E.04429
G1 X131.528 Y158.441 E.31066
G1 X131.722 Y158.101 E.01208
G1 X123.686 Y150.065 E.35021
G1 X122.973 Y148.817 E.04429
G1 X132.041 Y157.885 E.39518
G1 X140.403 Y143.252 F30000
G1 F15000
G1 X133.133 Y135.982 E.31681
G3 X133.414 Y136.797 I-3.335 J1.604 E.02663
G1 X140.084 Y143.467 E.29069
G1 X139.89 Y143.808 E.01208
G1 X133.481 Y137.399 E.27928
G3 X133.485 Y137.938 I-5.333 J.312 E.01662
G1 X139.695 Y144.148 E.27062
G1 X139.501 Y144.488 E.01208
G1 X133.485 Y138.473 E.26214
G1 X133.485 Y139.008 E.01648
G1 X139.306 Y144.829 E.25367
G1 X139.112 Y145.169 E.01208
G1 X133.485 Y139.543 E.24519
G1 X133.485 Y140.077 E.01648
G1 X138.917 Y145.509 E.23672
G1 X138.723 Y145.85 E.01208
G1 X133.485 Y140.612 E.22824
G1 X133.485 Y141.147 E.01648
G1 X138.528 Y146.19 E.21977
G1 X138.334 Y146.53 E.01208
M73 P32 R17
G1 X133.485 Y141.682 E.21129
G1 X133.485 Y142.217 E.01648
G1 X138.139 Y146.871 E.20282
G1 X137.945 Y147.211 E.01208
G1 X133.485 Y142.751 E.19435
G1 X133.485 Y143.286 E.01648
G1 X137.751 Y147.551 E.18587
G1 X137.556 Y147.892 E.01208
G1 X133.485 Y143.821 E.1774
G1 X133.485 Y144.356 E.01648
G1 X137.362 Y148.232 E.16892
G1 X137.167 Y148.572 E.01208
G1 X133.485 Y144.89 E.16045
G1 X133.485 Y145.425 E.01648
G1 X136.973 Y148.913 E.15197
G1 X136.778 Y149.253 E.01208
G1 X133.485 Y145.96 E.1435
G1 X133.485 Y146.495 E.01648
G1 X136.584 Y149.593 E.13502
G1 X136.389 Y149.934 E.01208
G1 X133.485 Y147.03 E.12655
G1 X133.485 Y147.564 E.01648
G1 X136.195 Y150.274 E.11807
G1 X136 Y150.614 E.01208
G1 X133.485 Y148.099 E.1096
G1 X133.485 Y148.634 E.01648
G1 X135.806 Y150.954 E.10113
G1 X135.611 Y151.295 E.01208
G1 X133.485 Y149.169 E.09265
G1 X133.485 Y149.703 E.01648
G1 X135.417 Y151.635 E.08418
G1 X135.222 Y151.975 E.01208
G1 X133.485 Y150.238 E.0757
G3 X133.473 Y150.761 I-5.141 J.14 E.01611
G1 X135.028 Y152.316 E.06777
G1 X134.834 Y152.656 E.01208
G1 X133.407 Y151.229 E.06217
G3 X133.288 Y151.645 I-2.138 J-.386 E.01335
G1 X134.639 Y152.996 E.05887
G1 X134.445 Y153.337 E.01208
G1 X133.128 Y152.02 E.05738
G3 X132.94 Y152.367 I-1.245 J-.45 E.0122
G1 X134.25 Y153.677 E.0571
G1 X134.056 Y154.017 E.01208
G1 X132.716 Y152.678 E.05837
G3 X132.465 Y152.962 I-1.258 J-.859 E.0117
G1 X133.861 Y154.358 E.06083
G1 X133.667 Y154.698 E.01208
G1 X132.184 Y153.216 E.06459
G3 X131.868 Y153.434 I-1.03 J-1.153 E.01188
G1 X133.472 Y155.038 E.0699
G1 X133.278 Y155.379 E.01208
G1 X131.524 Y153.625 E.07642
G3 X131.151 Y153.786 I-.831 J-1.409 E.01257
G1 X133.083 Y155.719 E.08422
G1 X132.889 Y156.059 E.01208
G1 X130.733 Y153.904 E.09393
G3 X130.263 Y153.968 I-.491 J-1.846 E.01468
G1 X132.694 Y156.4 E.10597
G1 X132.5 Y156.74 E.01208
G1 X129.736 Y153.976 E.12046
G3 X129.088 Y153.863 I.239 J-3.291 E.02028
G1 X132.305 Y157.08 E.1402
G1 X132.111 Y157.421 E.01208
G1 X122.26 Y147.569 E.42931
G1 X121.547 Y146.321 E.04429
G1 X126.64 Y151.415 E.22197
G3 X126.527 Y150.767 I3.606 J-.962 E.02029
G1 X120.834 Y145.073 E.24813
G1 X120.12 Y143.826 E.04429
G1 X126.515 Y150.22 E.27865
G1 X126.515 Y149.685 E.01648
G1 X119.407 Y142.578 E.30972
G1 X118.694 Y141.33 E.04429
G1 X126.515 Y149.15 E.34079
G1 X126.515 Y148.615 E.01648
G1 X117.981 Y140.082 E.37187
G1 X117.268 Y138.834 E.04429
G1 X126.515 Y148.081 E.40294
G1 X126.515 Y147.546 E.01648
G1 X116.555 Y137.586 E.43401
G1 X115.842 Y136.339 E.04429
G1 X126.515 Y147.011 E.46509
G1 X126.515 Y146.476 E.01648
G1 X115.129 Y135.091 E.49616
G1 X114.416 Y133.843 E.04429
G1 X126.515 Y145.942 E.52723
G1 X126.515 Y145.407 E.01648
G1 X113.703 Y132.595 E.55831
G1 X112.99 Y131.347 E.04429
G1 X126.515 Y144.872 E.58938
G1 X126.515 Y144.337 E.01648
G1 X112.277 Y130.099 E.62045
G1 X111.564 Y128.852 E.04429
G1 X126.515 Y143.802 E.65153
G1 X126.515 Y143.268 E.01648
G1 X110.851 Y127.604 E.6826
G1 X110.138 Y126.356 E.04429
G1 X126.515 Y142.733 E.71367
G1 X126.515 Y142.198 E.01648
G1 X109.425 Y125.108 E.74475
G1 X108.712 Y123.86 E.04429
G1 X126.515 Y141.663 E.77582
G1 X126.515 Y141.128 E.01648
G1 X107.999 Y122.613 E.80689
G1 X107.286 Y121.365 E.04429
G1 X126.515 Y140.594 E.83797
G1 X126.515 Y140.059 E.01648
G1 X106.573 Y120.117 E.86904
G1 X105.86 Y118.869 E.04429
G1 X126.515 Y139.524 E.90011
G1 X126.515 Y138.989 E.01648
G1 X105.147 Y117.621 E.93119
G1 X104.433 Y116.373 E.04429
G1 X126.515 Y138.455 E.96226
G1 X126.515 Y137.92 E.01648
G1 X103.72 Y115.126 E.99333
G1 X103.007 Y113.878 E.04429
G1 X126.519 Y137.39 E1.02461
G3 X126.569 Y136.904 I2.465 J.006 E.01506
G1 X102.294 Y112.63 E1.05784
G1 X101.581 Y111.382 E.04429
G1 X126.67 Y136.47 E1.09331
G3 X126.819 Y136.085 I1.61 J.4 E.01278
G1 X100.868 Y110.134 E1.13088
G1 X100.155 Y108.886 E.04429
G1 X127 Y135.731 E1.16984
G3 X127.218 Y135.414 I1.159 J.563 E.0119
G1 X99.442 Y107.639 E1.21041
G1 X98.729 Y106.391 E.04429
G1 X127.459 Y135.12 E1.25198
G3 X127.732 Y134.858 I1.445 J1.233 E.01167
G1 X98.016 Y105.143 E1.29495
G1 X97.303 Y103.895 E.04429
G1 X128.034 Y134.626 E1.33919
G3 X128.366 Y134.423 I1.183 J1.567 E.01201
G1 X96.59 Y102.647 E1.38474
G1 X95.877 Y101.399 E.04429
G1 X128.737 Y134.259 E1.43198
G3 X129.143 Y134.131 I.63 J1.28 E.01317
G1 X95.148 Y100.124 E1.48169
G1 X95.473 Y99.926 E.01173
G1 X129.594 Y134.047 E1.48691
G3 X130.102 Y134.02 I.361 J2.014 E.01572
G1 X96.886 Y100.803 E1.4475
G2 X97.577 Y100.96 I1.453 J-4.808 E.02184
G1 X130.707 Y134.09 E1.44376
G3 X131.516 Y134.364 I-.747 J3.534 E.02638
G1 X98.132 Y100.981 E1.45479
G1 X98.617 Y100.93 E.01501
G1 X140.473 Y142.787 E1.82403
G1 X140.668 Y142.447 E.01208
G1 X99.043 Y100.822 E1.81391
G2 X99.427 Y100.671 I-.41 J-1.608 E.01274
G1 X140.862 Y142.106 E1.80565
G1 X141.057 Y141.766 E.01208
G1 X99.783 Y100.493 E1.79861
G2 X100.102 Y100.277 I-.92 J-1.701 E.01188
G1 X141.251 Y141.426 E1.79319
G1 X141.445 Y141.085 E.01208
G1 X100.39 Y100.029 E1.78914
G1 X100.654 Y99.759 E.01165
G1 X141.64 Y140.745 E1.7861
G1 X141.834 Y140.405 E.01208
G1 X100.885 Y99.455 E1.78449
G2 X101.084 Y99.119 I-1.243 J-.96 E.01206
G1 X142.029 Y140.064 E1.78432
G1 X142.223 Y139.724 E.01208
G1 X101.25 Y98.751 E1.78554
G2 X101.381 Y98.347 I-5.31 J-1.947 E.01308
G1 X142.418 Y139.384 E1.78831
G1 X142.612 Y139.043 E.01208
G1 X101.461 Y97.892 E1.79329
G2 X101.48 Y97.376 I-3.949 J-.401 E.01593
G1 X142.807 Y138.703 E1.80095
G1 X143.001 Y138.363 E.01208
G1 X101.4 Y96.762 E1.8129
G1 X101.379 Y96.64 E.00382
G1 X101.213 Y96.146 E.01606
G1 X101.101 Y95.928 E.00755
G1 X143.196 Y138.022 E1.83441
G1 X143.39 Y137.682 E.01208
G1 X99.643 Y93.935 E1.9064
G1 X100.178 Y93.935 E.01648
G1 X143.585 Y137.342 E1.89157
G1 X143.779 Y137.001 E.01208
G1 X100.713 Y93.935 E1.87674
G1 X101.248 Y93.935 E.01648
G1 X143.974 Y136.661 E1.86191
G1 X144.168 Y136.321 E.01208
G1 X101.782 Y93.935 E1.84708
G1 X102.317 Y93.935 E.01648
G1 X144.362 Y135.98 E1.83225
G1 X144.557 Y135.64 E.01208
G1 X102.852 Y93.935 E1.81742
G1 X103.387 Y93.935 E.01648
G1 X144.751 Y135.3 E1.80259
G1 X144.946 Y134.96 E.01208
G1 X103.922 Y93.935 E1.78776
G1 X104.456 Y93.935 E.01648
G1 X145.14 Y134.619 E1.77293
G1 X145.335 Y134.279 E.01208
G1 X104.991 Y93.935 E1.7581
G1 X105.526 Y93.935 E.01648
G1 X145.529 Y133.939 E1.74327
G1 X145.724 Y133.598 E.01208
G1 X106.061 Y93.935 E1.72844
G1 X106.596 Y93.935 E.01648
G1 X145.918 Y133.258 E1.71361
G1 X146.113 Y132.918 E.01208
G1 X107.13 Y93.935 E1.69878
G1 X107.665 Y93.935 E.01648
G1 X146.307 Y132.577 E1.68395
G1 X146.502 Y132.237 E.01208
G1 X108.2 Y93.935 E1.66912
G1 X108.735 Y93.935 E.01648
G1 X146.696 Y131.897 E1.65429
G1 X146.891 Y131.556 E.01208
G1 X109.269 Y93.935 E1.63946
G1 X109.804 Y93.935 E.01648
G1 X147.085 Y131.216 E1.62463
G1 X147.279 Y130.876 E.01208
G1 X110.339 Y93.935 E1.6098
G1 X110.874 Y93.935 E.01648
G1 X147.474 Y130.535 E1.59497
G1 X147.668 Y130.195 E.01208
G1 X111.409 Y93.935 E1.58013
G1 X111.943 Y93.935 E.01648
G1 X147.863 Y129.855 E1.5653
G1 X148.057 Y129.514 E.01208
G1 X112.478 Y93.935 E1.55047
G1 X113.013 Y93.935 E.01648
G1 X148.252 Y129.174 E1.53564
G1 X148.446 Y128.834 E.01208
G1 X113.548 Y93.935 E1.52081
G1 X114.083 Y93.935 E.01648
G1 X148.641 Y128.494 E1.50598
G1 X148.835 Y128.153 E.01208
G1 X114.617 Y93.935 E1.49115
G1 X115.152 Y93.935 E.01648
G1 X149.03 Y127.813 E1.47632
G1 X149.224 Y127.473 E.01208
G1 X115.687 Y93.935 E1.46149
M73 P33 R17
G1 X116.222 Y93.935 E.01648
G1 X149.419 Y127.132 E1.44666
G1 X149.613 Y126.792 E.01208
G1 X116.756 Y93.935 E1.43183
G1 X117.291 Y93.935 E.01648
G1 X149.808 Y126.452 E1.417
G1 X150.002 Y126.111 E.01208
G1 X117.826 Y93.935 E1.40217
G1 X118.361 Y93.935 E.01648
G1 X150.196 Y125.771 E1.38734
G1 X150.391 Y125.431 E.01208
G1 X118.896 Y93.935 E1.37251
G1 X119.43 Y93.935 E.01648
G1 X150.585 Y125.09 E1.35768
G1 X150.78 Y124.75 E.01208
G1 X119.965 Y93.935 E1.34285
G1 X120.5 Y93.935 E.01648
G1 X150.974 Y124.41 E1.32802
G1 X151.169 Y124.069 E.01208
G1 X121.035 Y93.935 E1.31319
G1 X121.57 Y93.935 E.01648
G1 X151.363 Y123.729 E1.29836
G1 X151.558 Y123.389 E.01208
G1 X122.104 Y93.935 E1.28353
G1 X122.639 Y93.935 E.01648
G1 X151.752 Y123.048 E1.2687
G1 X151.947 Y122.708 E.01208
G1 X123.174 Y93.935 E1.25387
G1 X123.709 Y93.935 E.01648
G1 X152.141 Y122.368 E1.23904
G1 X152.336 Y122.027 E.01208
G1 X124.243 Y93.935 E1.2242
G1 X124.778 Y93.935 E.01648
G1 X152.53 Y121.687 E1.20937
G1 X152.725 Y121.347 E.01208
G1 X125.313 Y93.935 E1.19454
G1 X125.848 Y93.935 E.01648
G1 X152.919 Y121.007 E1.17971
G1 X153.113 Y120.666 E.01208
G1 X126.383 Y93.935 E1.16488
G1 X126.917 Y93.935 E.01648
G1 X153.308 Y120.326 E1.15005
G1 X153.502 Y119.986 E.01208
G1 X127.452 Y93.935 E1.13522
G1 X127.987 Y93.935 E.01648
G1 X153.697 Y119.645 E1.12039
G1 X153.891 Y119.305 E.01208
G1 X128.522 Y93.935 E1.10556
G1 X129.057 Y93.935 E.01648
G1 X154.086 Y118.965 E1.09073
G1 X154.28 Y118.624 E.01208
G1 X129.591 Y93.935 E1.0759
G1 X130.126 Y93.935 E.01648
G1 X154.475 Y118.284 E1.06107
G1 X154.669 Y117.944 E.01208
G1 X130.661 Y93.935 E1.04624
G1 X131.196 Y93.935 E.01648
G1 X154.864 Y117.603 E1.03141
G1 X155.058 Y117.263 E.01208
G1 X131.73 Y93.935 E1.01658
G1 X132.265 Y93.935 E.01648
G1 X155.253 Y116.923 E1.00175
G1 X155.447 Y116.582 E.01208
G1 X132.8 Y93.935 E.98692
G1 X133.335 Y93.935 E.01648
G1 X155.642 Y116.242 E.97209
G1 X155.836 Y115.902 E.01208
G1 X133.87 Y93.935 E.95726
G1 X134.404 Y93.935 E.01648
G1 X156.03 Y115.561 E.94243
G1 X156.225 Y115.221 E.01208
G1 X134.939 Y93.935 E.9276
G1 X135.474 Y93.935 E.01648
G1 X156.419 Y114.881 E.91277
G1 X156.614 Y114.54 E.01208
G1 X136.009 Y93.935 E.89794
G1 X136.544 Y93.935 E.01648
G1 X156.808 Y114.2 E.8831
G1 X157.003 Y113.86 E.01208
G1 X137.078 Y93.935 E.86827
G1 X137.613 Y93.935 E.01648
G1 X157.197 Y113.52 E.85344
G1 X157.392 Y113.179 E.01208
G1 X138.148 Y93.935 E.83861
G1 X138.683 Y93.935 E.01648
G1 X157.586 Y112.839 E.82378
G1 X157.781 Y112.499 E.01208
G1 X139.217 Y93.935 E.80895
G1 X139.752 Y93.935 E.01648
G1 X157.975 Y112.158 E.79412
G1 X158.17 Y111.818 E.01208
G1 X140.287 Y93.935 E.77929
G1 X140.822 Y93.935 E.01648
G1 X158.364 Y111.478 E.76446
G1 X158.559 Y111.137 E.01208
G1 X141.357 Y93.935 E.74963
G1 X141.891 Y93.935 E.01648
G1 X158.753 Y110.797 E.7348
G1 X158.947 Y110.457 E.01208
G1 X142.426 Y93.935 E.71997
G1 X142.961 Y93.935 E.01648
G1 X159.142 Y110.116 E.70514
G1 X159.336 Y109.776 E.01208
G1 X143.496 Y93.935 E.69031
G1 X144.031 Y93.935 E.01648
G1 X159.531 Y109.436 E.67548
G1 X159.725 Y109.095 E.01208
G1 X144.565 Y93.935 E.66065
G1 X145.1 Y93.935 E.01648
G1 X159.92 Y108.755 E.64582
G1 X160.114 Y108.415 E.01208
G1 X145.635 Y93.935 E.63099
G1 X146.17 Y93.935 E.01648
G1 X160.309 Y108.074 E.61616
G1 X160.503 Y107.734 E.01208
G1 X146.704 Y93.935 E.60133
G1 X147.239 Y93.935 E.01648
G1 X160.698 Y107.394 E.5865
G1 X160.892 Y107.053 E.01208
G1 X147.774 Y93.935 E.57167
G1 X148.309 Y93.935 E.01648
G1 X161.087 Y106.713 E.55684
G1 X161.281 Y106.373 E.01208
G1 X148.844 Y93.935 E.542
G1 X149.378 Y93.935 E.01648
G1 X161.476 Y106.033 E.52717
G1 X161.67 Y105.692 E.01208
G1 X149.913 Y93.935 E.51234
G1 X150.448 Y93.935 E.01648
G1 X161.864 Y105.352 E.49751
G1 X162.059 Y105.012 E.01208
G1 X150.983 Y93.935 E.48268
G1 X151.517 Y93.935 E.01648
G1 X162.253 Y104.671 E.46785
G1 X162.448 Y104.331 E.01208
G1 X152.052 Y93.935 E.45302
G1 X152.587 Y93.935 E.01648
G1 X162.642 Y103.991 E.43819
G1 X162.837 Y103.65 E.01208
G1 X153.122 Y93.935 E.42336
G1 X153.657 Y93.935 E.01648
G1 X163.156 Y103.434 E.41395
G1 X164.906 Y100.372 F30000
G1 F15000
G1 X164.48 Y99.945 E.01857
G3 X164.199 Y100.199 I-1.436 J-1.305 E.01169
G1 X164.587 Y100.587 E.01691
G1 X164.393 Y100.928 E.01208
G1 X163.889 Y100.424 E.02193
G3 X163.549 Y100.619 I-1.14 J-1.605 E.0121
G1 X164.198 Y101.268 E.02831
G1 X164.004 Y101.608 E.01208
G1 X163.174 Y100.779 E.03613
G3 X162.761 Y100.901 I-1.899 J-5.676 E.01327
G1 X163.809 Y101.949 E.04566
G1 X163.615 Y102.289 E.01208
G1 X162.295 Y100.969 E.05751
G3 X161.768 Y100.977 I-.302 J-2.63 E.01627
M73 P34 R17
G1 X163.42 Y102.629 E.07201
G1 X163.226 Y102.97 E.01208
G1 X160.87 Y100.614 E.10264
G1 X158.887 Y98.631 F30000
G1 F15000
G1 X154.191 Y93.935 E.20464
G1 X154.726 Y93.935 E.01648
G1 X158.526 Y97.735 E.16558
G3 X158.529 Y97.203 I2.658 J-.25 E.01641
G1 X155.261 Y93.935 E.14241
G1 X155.796 Y93.935 E.01648
G1 X158.601 Y96.74 E.12224
G3 X158.722 Y96.327 I2.127 J.399 E.0133
G1 X156.331 Y93.935 E.10421
G1 X156.865 Y93.935 E.01648
G1 X158.881 Y95.951 E.08786
G3 X159.075 Y95.61 I1.803 J.795 E.01211
G1 X157.4 Y93.935 E.07298
G1 X157.935 Y93.935 E.01648
G1 X159.305 Y95.305 E.0597
G3 X159.555 Y95.021 I1.286 J.878 E.01171
G1 X158.47 Y93.935 E.0473
G1 X159.004 Y93.935 E.01648
G1 X159.839 Y94.77 E.03638
G3 X160.153 Y94.549 I1.263 J1.455 E.01184
G1 X159.539 Y93.935 E.02672
G1 X160.074 Y93.935 E.01648
G1 X160.623 Y94.484 E.02392
G1 X160.888 Y94.328 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.443453
G1 F15000
G1 X161.042 Y94.075 E.00963
; LINE_WIDTH: 0.480661
G1 F14392.089
G1 X161.066 Y94.037 E.00162
G1 X161.2 Y94.02 E.00483
; LINE_WIDTH: 0.438325
G1 F15000
G1 X161.378 Y94.002 E.00577
; LINE_WIDTH: 0.410918
G1 X161.555 Y93.989 E.00533
; LINE_WIDTH: 0.387196
G1 X162.259 Y93.98 E.01975
; LINE_WIDTH: 0.420463
G1 X162.612 Y94.001 E.01086
; LINE_WIDTH: 0.467961
G1 F14822.12
G1 X162.789 Y94.019 E.00616
; LINE_WIDTH: 0.499588
G1 F13795.585
G1 X162.934 Y94.037 E.00544
G1 X162.946 Y94.056 E.00084
; LINE_WIDTH: 0.443424
G1 F15000
G1 X162.958 Y94.076 E.00074
; LINE_WIDTH: 0.421738
G1 X163.112 Y94.328 E.00911
G1 X165.461 Y98.186 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X165.619 Y98.198 E.00488
G1 X165.752 Y98.43 E.0082
G1 X168.287 Y93.994 E.15697
G2 X163.629 Y93.996 I-2.216 J282.866 E.14314
G1 X163.76 Y94.284 E.00973
G1 X163.698 Y94.397 E.00395
G1 X164.195 Y94.718 E.01818
G1 X164.703 Y95.208 E.02168
G1 X165.103 Y95.789 E.02168
G1 X165.381 Y96.438 E.02168
G1 X165.524 Y97.128 E.02168
G1 X165.528 Y97.834 E.02168
G1 X165.472 Y98.127 E.00916
G1 X165.905 Y97.402 F30000
G1 F15000
G1 X167.637 Y94.371 E.10727
G1 X164.353 Y94.371 E.1009
G1 X164.966 Y94.938 E.02564
G1 X165.415 Y95.576 E.02398
G1 X165.728 Y96.291 E.02398
G1 X165.894 Y97.054 E.02398
G1 X165.903 Y97.342 E.00888
G1 X166.116 Y96.274 F30000
G1 F15000
G1 X166.987 Y94.748 E.05399
G1 X165.297 Y94.748 E.05195
G1 X165.726 Y95.364 E.02307
G1 X166.098 Y96.217 E.02858
G1 X166.217 Y95.155 F30000
; LINE_WIDTH: 0.59996
G1 F11309.781
G2 X166.222 Y95.267 I-.031 J.058 E.01246
G1 X165.133 Y98.729 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.5857
G1 F11606.912
G1 X165.27 Y99.09 E.01707
G1 X164.883 Y99.75 E.03386
; WIPE_START
G1 F24000
G1 X165.27 Y99.09 E-.50528
G1 X165.133 Y98.729 E-.25472
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1 I.081 J-1.214 P1  F30000
G1 X99.112 Y94.328 Z1
G1 Z.6
G1 E.8 F1800
; LINE_WIDTH: 0.421747
G1 F15000
G1 X98.958 Y94.075 E.00911
; LINE_WIDTH: 0.443436
G1 X98.946 Y94.056 E.00074
; LINE_WIDTH: 0.499589
G1 F13795.558
G1 X98.934 Y94.037 E.00084
G1 X98.789 Y94.019 E.00544
; LINE_WIDTH: 0.467963
G1 F14822.06
G1 X98.612 Y94.001 E.00617
; LINE_WIDTH: 0.420463
G1 F15000
G1 X98.259 Y93.98 E.01086
; LINE_WIDTH: 0.387196
G1 X97.555 Y93.989 E.01975
; LINE_WIDTH: 0.410918
G1 X97.378 Y94.002 E.00533
; LINE_WIDTH: 0.438326
G1 X97.2 Y94.02 E.00577
; LINE_WIDTH: 0.480661
G1 F14392.089
G1 X97.066 Y94.037 E.00483
G1 X97.042 Y94.075 E.00162
; LINE_WIDTH: 0.443453
G1 F15000
G1 X96.888 Y94.328 E.00963
G1 X94.537 Y98.182 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X94.472 Y97.836 E.01082
G3 X94.618 Y96.44 I3.759 J-.311 E.0434
G1 X94.88 Y95.819 E.02069
G3 X96.305 Y94.413 I2.962 J1.575 E.06247
G1 X96.231 Y94.282 E.00462
G3 X96.364 Y93.994 I.609 J.108 E.00986
G1 X91.713 Y93.994 E.14292
G1 X94.244 Y98.423 E.15675
G1 X94.378 Y98.196 E.00811
G1 X94.477 Y98.187 E.00307
G1 X94.083 Y97.382 F30000
G1 F15000
G3 X94.533 Y95.673 I4.351 J.231 E.05467
G3 X95.642 Y94.371 I3.778 J2.096 E.0529
G1 X92.363 Y94.371 E.10075
G1 X94.053 Y97.33 E.1047
G1 X93.883 Y96.272 F30000
G1 F15000
G1 X94.185 Y95.526 E.02471
G1 X94.533 Y94.962 E.02037
G1 X94.707 Y94.748 E.00848
G1 X93.013 Y94.748 E.05207
G1 X93.853 Y96.22 E.05208
G1 X93.852 Y95.155 F30000
; LINE_WIDTH: 0.59987
G1 F11311.608
G2 X93.857 Y95.267 I-.031 J.058 E.01245
G1 X94.867 Y98.729 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.596574
G1 F11378.959
G1 X94.73 Y99.09 E.01741
G1 X95.118 Y99.752 E.03464
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X94.73 Y99.09 E-.50576
G1 X94.867 Y98.729 E-.25424
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/88
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
G3 Z1 I-.899 J.82 P1  F30000
G1 X128.021 Y135.048 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15418
G1 X128.035 Y135.036 E.00061
G3 X129.921 Y134.349 I1.967 J2.466 E.06777
G3 X133.152 Y137.493 I.07 J3.16 E.16647
G1 X133.152 Y150.51 E.43182
G3 X126.848 Y150.507 I-3.152 J-.011 E.32784
G1 X126.848 Y137.493 E.43173
G3 X127.8 Y135.244 I3.154 J.01 E.08316
G1 X127.976 Y135.087 E.00783
G1 X128.304 Y135.324 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.503 Y135.182 E.00751
G3 X129.931 Y134.741 I1.499 J2.32 E.04651
G3 X132.76 Y137.497 I.061 J2.767 E.13514
G1 X132.76 Y150.504 E.39964
G3 X127.24 Y150.503 I-2.76 J-.004 E.26619
G1 X127.24 Y137.497 E.39961
G3 X128.257 Y135.361 I2.762 J.005 E.07513
M204 S10000
; WIPE_START
G1 F24000
G1 X128.503 Y135.182 E-.11559
G1 X128.865 Y134.984 E-.15674
G1 X129.121 Y134.884 E-.10455
G1 X129.386 Y134.809 E-.10456
G1 X129.657 Y134.761 E-.10456
G1 X129.931 Y134.741 E-.10456
G1 X130.114 Y134.745 E-.06944
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.961 J-.746 P1  F30000
G1 X98.836 Y94.461 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15418
G1 X98.854 Y94.466 E.00061
G3 X97.921 Y94.349 I-.854 J3.034 E.62562
G1 X98.079 Y94.349 E.00521
G3 X98.547 Y94.396 I-.079 J3.151 E.01564
G1 X98.777 Y94.448 E.00783
G1 X98.706 Y94.834 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.748 Y94.843 E.00131
G3 X97.931 Y94.741 I-.748 J2.656 E.50741
G1 X98.069 Y94.741 E.00423
G3 X98.479 Y94.782 I-.069 J2.759 E.01269
G1 X98.648 Y94.82 E.0053
M204 S10000
; WIPE_START
G1 F24000
G1 X98.748 Y94.843 E-.03899
G1 X99.008 Y94.931 E-.10456
G1 X99.259 Y95.044 E-.10455
G1 X99.497 Y95.181 E-.10456
G1 X99.721 Y95.342 E-.10456
G1 X99.927 Y95.524 E-.10456
G1 X100.114 Y95.726 E-.10456
G1 X100.263 Y95.922 E-.09366
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-.042 J1.216 P1  F30000
G1 X165.082 Y98.151 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15418
G1 X164.962 Y98.578 E.01472
G3 X161.921 Y94.349 I-2.962 J-1.078 E.45356
G1 X162.079 Y94.349 E.00521
G3 X165.095 Y98.092 I-.079 J3.151 E.18141
G1 X164.705 Y98.047 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X161.931 Y94.741 I-2.705 J-.547 E.38055
G1 X162.069 Y94.741 E.00423
G3 X164.716 Y97.988 I-.069 J2.759 E.14617
M204 S10000
; WIPE_START
G1 F24000
G1 X164.637 Y98.314 E-.12731
G1 X164.543 Y98.572 E-.10456
G1 X164.424 Y98.82 E-.10456
G1 X164.28 Y99.055 E-.10456
G1 X164.114 Y99.274 E-.10456
G1 X163.927 Y99.476 E-.10456
G1 X163.721 Y99.658 E-.10456
G1 X163.709 Y99.666 E-.00534
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.07 J-.58 P1  F30000
G1 X130 Y161.786 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15418
G1 X91.037 Y93.602 E2.60503
G1 X168.963 Y93.602 E2.58492
G1 X130.03 Y161.734 E2.60304
G1 X130 Y162.577 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X90.362 Y93.21 E2.4549
G1 X169.638 Y93.21 E2.43594
G1 X160.484 Y109.229 E.56692
G1 X130.03 Y162.525 E1.88613
M204 S10000
; WIPE_START
G1 F24000
G1 X129.036 Y160.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I1.102 J.517 P1  F30000
G1 X133.182 Y151.947 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15418
G3 X132.194 Y153.222 I-4.775 J-2.678 E.05369
G1 X133.657 Y154.685 E.06861
G1 X133.174 Y155.53 E.03228
G1 X129.134 Y159.57 E.18952
G1 X130 Y161.085 E.05788
G1 X130.866 Y159.57 E.05788
G1 X126.826 Y155.53 E.18952
G1 X126.343 Y154.685 E.03228
G1 X127.803 Y153.225 E.0685
G3 X126.816 Y151.948 I2.263 J-2.769 E.05398
G1 X118.777 Y141.445 F30000
G1 F15418
G1 X117.969 Y140.031 E.05401
G1 X158.893 Y99.107 E1.91981
G3 X159.041 Y95.633 I3.121 J-1.607 E.12067
G1 X157.358 Y93.95 E.07894
G1 X156.374 Y93.95 E.03265
G1 X115.178 Y135.146 E1.93257
G1 X116.591 Y137.619 E.09448
G1 X126.5 Y147.528 E.46483
G1 X126.5 Y146.852 E.0224
G1 X123.552 Y149.8 E.13829
G1 X120.761 Y144.915 E.18662
G1 X126.5 Y139.176 E.26923
G1 X126.5 Y139.852 E.0224
G1 X106.357 Y119.708 E.94495
G1 X104.013 Y115.607 E.15669
G1 X125.67 Y93.95 E1.01597
G1 X126.654 Y93.95 E.03265
G1 X153.196 Y120.492 E1.24512
G1 X163.019 Y101.38 F30000
G1 F15418
G1 X163.736 Y101.179 E.0247
G1 X163.609 Y100.604 E.01951
G2 X163.865 Y100.458 I-.605 J-1.353 E.00981
G1 X164.361 Y100.953 E.02324
G1 X163.878 Y101.798 E.03228
G1 X131.386 Y134.29 E1.52425
G2 X128.616 Y134.292 I-1.383 J3.199 E.09452
G1 X96.122 Y101.798 E1.52435
G1 X95.639 Y100.953 E.03228
G1 X96.138 Y100.454 E.0234
G2 X97.661 Y100.979 I1.84 J-2.866 E.05396
G1 X95.118 Y99.752 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.596572
G1 F11378.99
G1 X94.73 Y99.09 E.03464
G1 X94.867 Y98.729 E.01741
G1 X94.537 Y98.182 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X94.472 Y97.836 E.01082
G3 X94.618 Y96.44 I3.759 J-.311 E.0434
G1 X94.88 Y95.819 E.02069
G3 X96.305 Y94.413 I2.962 J1.575 E.06247
G1 X96.231 Y94.282 E.00462
G3 X96.364 Y93.994 I.609 J.108 E.00986
G1 X91.713 Y93.994 E.14292
G1 X94.244 Y98.424 E.15675
G1 X94.378 Y98.196 E.00811
G1 X94.477 Y98.187 E.00307
G1 X94.083 Y97.382 F30000
G1 F15000
G3 X94.533 Y95.673 I4.352 J.231 E.05467
G3 X95.642 Y94.371 I3.778 J2.096 E.0529
G1 X92.363 Y94.371 E.10075
G1 X94.053 Y97.33 E.1047
G1 X93.883 Y96.272 F30000
G1 F15000
G1 X94.185 Y95.526 E.02471
G1 X94.533 Y94.962 E.02037
G1 X94.707 Y94.748 E.00848
G1 X93.013 Y94.748 E.05207
G1 X93.853 Y96.22 E.05208
G1 X93.852 Y95.155 F30000
; LINE_WIDTH: 0.599868
G1 F11311.649
G2 X93.857 Y95.267 I-.031 J.058 E.01245
G1 X96.888 Y94.328 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.443465
G1 F15000
G1 X97.042 Y94.075 E.00964
; LINE_WIDTH: 0.480656
G1 F14392.243
G1 X97.066 Y94.037 E.00162
G1 X97.2 Y94.02 E.00484
; LINE_WIDTH: 0.438329
G1 F15000
G1 X97.378 Y94.002 E.00576
; LINE_WIDTH: 0.410916
G1 X97.555 Y93.989 E.00533
; LINE_WIDTH: 0.387197
G1 X98.259 Y93.98 E.01975
; LINE_WIDTH: 0.420464
G1 X98.612 Y94.001 E.01086
; LINE_WIDTH: 0.467959
G1 F14822.195
G1 X98.789 Y94.019 E.00616
; LINE_WIDTH: 0.499595
G1 F13795.389
G1 X98.934 Y94.037 E.00544
G1 X98.946 Y94.056 E.00084
; LINE_WIDTH: 0.443467
G1 F15000
G1 X98.958 Y94.075 E.00074
; LINE_WIDTH: 0.421781
G1 X99.112 Y94.328 E.00911
; WIPE_START
G1 F24000
G1 X98.958 Y94.075 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I-1.217 J.026 P1  F30000
G1 X99.238 Y107.252 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15418
G1 X98.43 Y105.838 E.05401
G1 X110.318 Y93.95 E.55766
G1 X111.302 Y93.95 E.03265
G1 X147.613 Y130.261 E1.70342
G1 X150.405 Y125.377 E.18662
G1 X118.978 Y93.95 E1.47427
G1 X117.994 Y93.95 E.03265
G1 X101.222 Y110.722 E.78682
G1 X102.03 Y112.136 E.05401
G1 X106.804 Y120.492 F30000
G1 F15418
G1 X133.346 Y93.95 E1.24512
G1 X134.33 Y93.95 E.03265
G1 X155.987 Y115.607 E1.01597
G1 X153.643 Y119.709 E.15669
G1 X133.5 Y139.852 E.94495
G1 X133.5 Y139.176 E.0224
G1 X139.239 Y144.915 E.26923
G1 X136.448 Y149.8 E.18662
G1 X133.5 Y146.852 E.13829
G1 X133.5 Y147.528 E.0224
G1 X143.409 Y137.619 E.46483
G1 X144.822 Y135.146 E.09448
G1 X103.626 Y93.95 E1.93257
G1 X102.642 Y93.95 E.03265
G1 X100.959 Y95.634 E.07897
G3 X101.106 Y99.106 I-3.003 J1.867 E.12052
G1 X142.031 Y140.031 E1.91986
G1 X141.223 Y141.445 E.05401
; WIPE_START
G1 F24000
G1 X142.031 Y140.031 E-.61876
G1 X141.768 Y139.768 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.2 I.414 J-1.144 P1  F30000
G1 X111.579 Y128.848 Z1.2
G1 Z.8
G1 E.8 F1800
G1 F15418
G1 X112.387 Y130.261 E.05401
G1 X148.698 Y93.95 E1.70342
G1 X149.682 Y93.95 E.03265
G1 X161.57 Y105.838 E.55766
G1 X158.778 Y110.722 E.18662
G1 X142.006 Y93.95 E.78682
G1 X141.022 Y93.95 E.03265
G1 X109.595 Y125.377 E1.47427
G1 X108.788 Y123.963 E.05401
G1 X163.053 Y100.916 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.51097
G1 F13460.101
G1 X163.157 Y100.884 E.00415
G1 X164.882 Y99.752 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.585716
G1 F11606.583
G1 X165.27 Y99.09 E.03396
G1 X165.133 Y98.729 E.01707
G1 X165.458 Y98.185 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X165.619 Y98.198 E.00495
G1 X165.752 Y98.43 E.00821
G1 X168.287 Y93.994 E.15697
G2 X163.629 Y93.996 I-2.216 J289.559 E.14314
G1 X163.76 Y94.284 E.00973
G1 X163.698 Y94.397 E.00395
G1 X164.195 Y94.718 E.01818
G1 X164.703 Y95.208 E.02168
G1 X165.103 Y95.789 E.02168
G1 X165.381 Y96.438 E.02168
G1 X165.524 Y97.129 E.02168
G1 X165.528 Y97.834 E.02168
G1 X165.47 Y98.126 E.00914
G1 X165.905 Y97.402 F30000
G1 F15000
G1 X167.637 Y94.371 E.10727
G1 X164.353 Y94.371 E.1009
G1 X164.966 Y94.938 E.02564
G1 X165.415 Y95.576 E.02398
G1 X165.728 Y96.291 E.02398
G1 X165.894 Y97.054 E.02398
G1 X165.903 Y97.342 E.00887
G1 X166.116 Y96.274 F30000
G1 F15000
G1 X166.987 Y94.748 E.05399
G1 X165.297 Y94.748 E.05195
G1 X165.726 Y95.364 E.02307
G1 X166.098 Y96.217 E.02858
G1 X166.217 Y95.155 F30000
; LINE_WIDTH: 0.59996
G1 F11309.781
G2 X166.222 Y95.267 I-.031 J.058 E.01246
G1 X163.112 Y94.328 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.421764
G1 F15000
G1 X162.958 Y94.075 E.00911
; LINE_WIDTH: 0.443458
G1 X162.946 Y94.056 E.00074
; LINE_WIDTH: 0.499591
G1 F13795.494
G1 X162.934 Y94.037 E.00084
G1 X162.789 Y94.019 E.00544
; LINE_WIDTH: 0.467963
G1 F14822.051
G1 X162.612 Y94.001 E.00617
; LINE_WIDTH: 0.420461
G1 F15000
G1 X162.259 Y93.98 E.01087
; LINE_WIDTH: 0.387196
G1 X161.555 Y93.989 E.01975
; LINE_WIDTH: 0.41092
G1 X161.378 Y94.002 E.00533
; LINE_WIDTH: 0.438331
M73 P35 R17
G1 X161.2 Y94.02 E.00576
; LINE_WIDTH: 0.480656
G1 F14392.236
G1 X161.066 Y94.037 E.00484
G1 X161.042 Y94.075 E.00162
; LINE_WIDTH: 0.443465
G1 F15000
G1 X160.888 Y94.328 E.00964
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X161.042 Y94.075 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/88
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
G3 Z1.2 I-.948 J-.764 P1  F30000
G1 X128.049 Y135.025 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15151
G1 X128.29 Y134.853 E.00982
G3 X129.921 Y134.349 I1.712 J2.649 E.05735
G3 X133.152 Y137.493 I.07 J3.16 E.16647
G1 X133.152 Y150.511 E.43184
G3 X126.848 Y150.507 I-3.152 J-.012 E.32782
G1 X126.848 Y137.493 E.43173
G3 X128.003 Y135.062 I3.154 J.009 E.09221
G1 X128.335 Y135.302 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.503 Y135.182 E.00635
G3 X129.931 Y134.741 I1.499 J2.32 E.04651
G3 X132.76 Y137.497 I.061 J2.767 E.13514
G1 X132.76 Y150.504 E.39965
G3 X127.24 Y150.503 I-2.76 J-.005 E.26618
G1 X127.24 Y137.497 E.39961
G3 X128.28 Y135.343 I2.762 J.004 E.07603
G1 X128.286 Y135.338 E.00026
M204 S10000
; WIPE_START
G1 F24000
G1 X128.503 Y135.182 E-.10134
G1 X128.865 Y134.984 E-.15674
G1 X129.121 Y134.884 E-.10456
G1 X129.386 Y134.809 E-.10456
G1 X129.657 Y134.761 E-.10456
G1 X129.931 Y134.741 E-.10456
G1 X130.151 Y134.746 E-.08368
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I.961 J-.747 P1  F30000
G1 X98.836 Y94.461 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15151
G1 X98.854 Y94.466 E.00061
G3 X97.921 Y94.349 I-.854 J3.034 E.62562
G1 X98.079 Y94.349 E.00521
G3 X98.547 Y94.396 I-.079 J3.151 E.01564
G1 X98.777 Y94.448 E.00783
G1 X98.689 Y94.83 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.748 Y94.843 E.00184
G3 X97.931 Y94.741 I-.748 J2.656 E.50741
G1 X98.069 Y94.741 E.00423
G3 X98.479 Y94.782 I-.069 J2.759 E.01269
G1 X98.631 Y94.816 E.00477
M204 S10000
; WIPE_START
G1 F24000
G1 X98.748 Y94.843 E-.04559
G1 X99.008 Y94.931 E-.10456
G1 X99.259 Y95.044 E-.10456
G1 X99.497 Y95.181 E-.10456
G1 X99.721 Y95.342 E-.10456
G1 X99.927 Y95.524 E-.10456
G1 X100.114 Y95.726 E-.10456
G1 X100.253 Y95.908 E-.08705
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-.041 J1.216 P1  F30000
G1 X165.092 Y98.107 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15151
G1 X165.089 Y98.124 E.00061
G3 X161.921 Y94.349 I-3.089 J-.625 E.4692
G1 X162.079 Y94.349 E.00521
G3 X165.136 Y97.814 I-.079 J3.151 E.17206
G1 X165.101 Y98.047 E.00783
G1 X164.705 Y98.047 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X161.931 Y94.741 I-2.705 J-.547 E.38055
G1 X162.069 Y94.741 E.00423
G3 X164.716 Y97.988 I-.069 J2.759 E.14617
M204 S10000
; WIPE_START
G1 F24000
G1 X164.637 Y98.314 E-.1273
G1 X164.543 Y98.572 E-.10457
G1 X164.424 Y98.82 E-.10455
G1 X164.28 Y99.055 E-.10456
G1 X164.114 Y99.274 E-.10456
G1 X163.927 Y99.476 E-.10456
G1 X163.721 Y99.658 E-.10456
G1 X163.709 Y99.666 E-.00534
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.07 J-.58 P1  F30000
G1 X130 Y161.786 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15151
G1 X91.037 Y93.602 E2.60503
G1 X168.963 Y93.602 E2.58492
G1 X157.477 Y113.701 E.7679
G1 X130.03 Y161.734 E1.83514
G1 X130 Y162.577 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X90.362 Y93.21 E2.4549
G1 X169.638 Y93.21 E2.43594
G1 X157.818 Y113.896 E.73207
G1 X130.03 Y162.525 E1.72098
M204 S10000
; WIPE_START
G1 F24000
G1 X129.036 Y160.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I1.195 J-.232 P1  F30000
G1 X127.546 Y153.103 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.508778
G1 F13523.434
G1 X127.755 Y153.29 E.01063
G1 X127.066 Y152.405 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15151
G2 X127.298 Y152.724 I1.71 J-.999 E.01311
G1 X126.93 Y153.141 E.01844
G1 X127.438 Y153.589 E.02248
G1 X126.343 Y154.685 E.05139
G1 X126.826 Y155.53 E.03228
G1 X130.866 Y159.57 E.18952
G1 X130 Y161.085 E.05788
G1 X129.134 Y159.57 E.05788
G1 X133.174 Y155.53 E.18952
G1 X133.657 Y154.685 E.03228
G1 X132.197 Y153.225 E.0685
G2 X133.182 Y151.947 I-3.144 J-3.443 E.05379
G1 X141.223 Y141.445 F30000
G1 F15151
G1 X142.031 Y140.031 E.05401
G1 X101.107 Y99.107 E1.91981
G2 X100.959 Y95.633 I-3.121 J-1.607 E.12067
G1 X102.642 Y93.95 E.07894
G1 X103.626 Y93.95 E.03265
G1 X144.822 Y135.146 E1.93257
G1 X143.409 Y137.619 E.09448
G1 X133.5 Y147.528 E.46483
G1 X133.5 Y146.852 E.0224
G1 X136.448 Y149.8 E.13829
G1 X139.239 Y144.915 E.18662
G1 X133.5 Y139.176 E.26923
G1 X133.5 Y139.852 E.0224
G1 X153.643 Y119.709 E.94495
G1 X155.987 Y115.607 E.15669
G1 X134.33 Y93.95 E1.01597
G1 X133.346 Y93.95 E.03265
G1 X106.804 Y120.492 E1.24512
G1 X108.788 Y123.963 F30000
G1 F15151
G1 X109.595 Y125.377 E.05401
G1 X141.022 Y93.95 E1.47427
G1 X142.006 Y93.95 E.03265
G1 X158.778 Y110.722 E.78682
G1 X161.57 Y105.838 E.18662
G1 X149.682 Y93.95 E.55766
G1 X148.698 Y93.95 E.03265
G1 X112.387 Y130.261 E1.70342
G1 X111.579 Y128.848 E.05401
G1 X118.777 Y141.445 F30000
G1 F15151
G1 X117.969 Y140.031 E.05401
G1 X158.893 Y99.107 E1.91981
G3 X159.042 Y95.634 I3.114 J-1.606 E.12064
G1 X157.358 Y93.95 E.07901
G1 X156.374 Y93.95 E.03265
G1 X115.178 Y135.146 E1.93257
G1 X116.591 Y137.619 E.09448
G1 X126.5 Y147.528 E.46483
G1 X126.5 Y146.852 E.0224
G1 X123.552 Y149.8 E.13829
G1 X120.761 Y144.915 E.18662
G1 X126.5 Y139.176 E.26923
G1 X126.5 Y139.852 E.0224
G1 X106.357 Y119.708 E.94495
G1 X104.013 Y115.607 E.15669
G1 X125.67 Y93.95 E1.01597
G1 X126.654 Y93.95 E.03265
G1 X153.196 Y120.492 E1.24512
G1 X162.34 Y100.981 F30000
G1 F15151
G2 X163.865 Y100.458 I-.533 J-4.038 E.05385
G1 X164.361 Y100.953 E.02324
G1 X163.878 Y101.798 E.03228
M73 P35 R16
G1 X131.386 Y134.29 E1.52425
G2 X128.615 Y134.291 I-1.383 J3.203 E.09453
G1 X96.122 Y101.798 E1.52433
G1 X95.639 Y100.953 E.03228
G1 X96.133 Y100.459 E.02316
G2 X97.66 Y100.979 I1.866 J-2.979 E.05398
G1 X95.118 Y99.752 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.596581
G1 F11378.81
G1 X94.73 Y99.09 E.03464
G1 X94.867 Y98.729 E.01741
G1 X94.537 Y98.182 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X94.472 Y97.836 E.01082
G3 X94.618 Y96.44 I3.759 J-.311 E.0434
G1 X94.88 Y95.819 E.02069
G3 X96.305 Y94.413 I2.962 J1.575 E.06248
G1 X96.231 Y94.282 E.00462
G3 X96.364 Y93.994 I.608 J.108 E.00986
G1 X91.713 Y93.994 E.14292
G1 X94.244 Y98.423 E.15675
G1 X94.378 Y98.196 E.00811
G1 X94.477 Y98.187 E.00307
G1 X94.083 Y97.382 F30000
G1 F15000
G3 X94.533 Y95.673 I4.351 J.231 E.05467
G3 X95.642 Y94.371 I3.778 J2.096 E.0529
G1 X92.363 Y94.371 E.10075
G1 X94.053 Y97.33 E.1047
G1 X93.883 Y96.272 F30000
G1 F15000
G1 X94.185 Y95.527 E.02471
G1 X94.533 Y94.962 E.02037
G1 X94.707 Y94.748 E.00848
G1 X93.013 Y94.748 E.05207
G1 X93.853 Y96.22 E.05208
G1 X93.852 Y95.155 F30000
; LINE_WIDTH: 0.59987
G1 F11311.608
G2 X93.857 Y95.267 I-.031 J.058 E.01245
G1 X96.888 Y94.328 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.443434
G1 F15000
G1 X97.042 Y94.075 E.00963
; LINE_WIDTH: 0.480662
G1 F14392.065
G1 X97.066 Y94.037 E.00162
G1 X97.2 Y94.02 E.00484
; LINE_WIDTH: 0.438327
G1 F15000
G1 X97.378 Y94.002 E.00576
; LINE_WIDTH: 0.410916
G1 X97.555 Y93.989 E.00533
; LINE_WIDTH: 0.387196
G1 X98.259 Y93.98 E.01975
; LINE_WIDTH: 0.420463
G1 X98.612 Y94.001 E.01086
; LINE_WIDTH: 0.467963
G1 F14822.06
G1 X98.789 Y94.019 E.00617
; LINE_WIDTH: 0.499594
G1 F13795.42
G1 X98.934 Y94.037 E.00544
G1 X98.946 Y94.056 E.00084
; LINE_WIDTH: 0.443469
G1 F15000
G1 X98.958 Y94.075 E.00074
; LINE_WIDTH: 0.421773
G1 X99.112 Y94.328 E.00911
; WIPE_START
G1 F24000
G1 X98.958 Y94.075 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.4 I-1.217 J.026 P1  F30000
G1 X99.238 Y107.252 Z1.4
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15151
G1 X98.43 Y105.838 E.05401
G1 X110.318 Y93.95 E.55766
G1 X111.302 Y93.95 E.03265
G1 X147.613 Y130.261 E1.70342
G1 X150.405 Y125.377 E.18662
G1 X118.978 Y93.95 E1.47427
G1 X117.994 Y93.95 E.03265
G1 X101.222 Y110.722 E.78682
G1 X102.03 Y112.136 E.05401
G1 X160.888 Y94.328 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.443434
G1 F15000
G1 X161.042 Y94.075 E.00963
; LINE_WIDTH: 0.480662
G1 F14392.065
G1 X161.066 Y94.037 E.00162
G1 X161.2 Y94.02 E.00484
; LINE_WIDTH: 0.438327
G1 F15000
G1 X161.378 Y94.002 E.00576
; LINE_WIDTH: 0.410914
G1 X161.555 Y93.989 E.00533
; LINE_WIDTH: 0.387197
G1 X162.259 Y93.98 E.01975
; LINE_WIDTH: 0.420465
G1 X162.612 Y94.001 E.01086
; LINE_WIDTH: 0.467959
G1 F14822.188
G1 X162.789 Y94.019 E.00616
; LINE_WIDTH: 0.499592
G1 F13795.476
G1 X162.934 Y94.037 E.00544
G1 X162.946 Y94.056 E.00084
; LINE_WIDTH: 0.443452
G1 F15000
G1 X162.958 Y94.075 E.00074
; LINE_WIDTH: 0.421764
G1 X163.112 Y94.328 E.00911
G1 X165.458 Y98.185 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X165.619 Y98.198 E.00495
G1 X165.752 Y98.43 E.0082
G1 X168.287 Y93.994 E.15697
G2 X163.629 Y93.996 I-2.216 J287.362 E.14314
G1 X163.76 Y94.284 E.00973
G1 X163.698 Y94.397 E.00395
G1 X164.195 Y94.718 E.01818
G1 X164.703 Y95.208 E.02168
G1 X165.103 Y95.789 E.02168
G1 X165.381 Y96.438 E.02168
G1 X165.524 Y97.128 E.02168
G1 X165.528 Y97.834 E.02168
G1 X165.47 Y98.126 E.00914
G1 X165.905 Y97.402 F30000
G1 F15000
G1 X167.637 Y94.371 E.10727
G1 X164.353 Y94.371 E.1009
G1 X164.966 Y94.938 E.02564
G1 X165.415 Y95.576 E.02398
G1 X165.728 Y96.291 E.02398
G1 X165.894 Y97.054 E.02398
G1 X165.903 Y97.342 E.00888
G1 X166.116 Y96.274 F30000
G1 F15000
G1 X166.987 Y94.748 E.05399
G1 X165.297 Y94.748 E.05195
G1 X165.726 Y95.364 E.02307
G1 X166.098 Y96.217 E.02858
G1 X166.217 Y95.155 F30000
; LINE_WIDTH: 0.59996
G1 F11309.781
G2 X166.222 Y95.267 I-.031 J.058 E.01246
G1 X165.133 Y98.729 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.58571
G1 F11606.698
G1 X165.27 Y99.09 E.01707
G1 X164.882 Y99.752 E.03396
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X165.27 Y99.09 E-.50576
G1 X165.133 Y98.729 E-.25424
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/88
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
G3 Z1.4 I-.851 J-.87 P1  F30000
G1 X128.055 Y135.022 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15434
G1 X128.374 Y134.803 E.01283
G3 X129.921 Y134.349 I1.636 J2.706 E.05409
G3 X133.152 Y137.493 I.07 J3.16 E.16647
G1 X133.152 Y150.507 E.43173
G3 X126.848 Y150.507 I-3.152 J-.008 E.32794
G1 X126.848 Y137.487 E.43192
G3 X128.009 Y135.061 I3.162 J.023 E.09215
G1 X128.367 Y135.281 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.577 Y135.138 E.00782
G3 X129.931 Y134.741 I1.431 J2.37 E.04384
G3 X132.76 Y137.497 I.061 J2.767 E.13514
G1 X132.76 Y150.503 E.39961
G3 X127.24 Y150.503 I-2.76 J-.003 E.26622
G1 X127.24 Y137.495 E.39968
G3 X128.281 Y135.345 I2.769 J.013 E.07591
G1 X128.319 Y135.317 E.00143
M204 S10000
; WIPE_START
G1 F24000
G1 X128.577 Y135.138 E-.1195
G1 X128.992 Y134.931 E-.17607
G1 X129.252 Y134.843 E-.10456
G1 X129.521 Y134.782 E-.10456
G1 X129.931 Y134.741 E-.15676
G1 X130.19 Y134.747 E-.09856
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.961 J-.747 P1  F30000
G1 X98.871 Y94.471 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15434
G1 X99.152 Y94.566 E.00982
G3 X97.921 Y94.349 I-1.152 J2.934 E.61519
G1 X98.079 Y94.349 E.00521
G3 X98.814 Y94.455 I-.079 J3.151 E.02469
G1 X98.671 Y94.826 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.748 Y94.843 E.0024
G3 X97.931 Y94.741 I-.748 J2.656 E.50741
G1 X98.069 Y94.741 E.00423
G3 X98.479 Y94.782 I-.069 J2.759 E.01269
G1 X98.613 Y94.812 E.00421
M204 S10000
; WIPE_START
G1 F24000
G1 X98.748 Y94.843 E-.05249
G1 X99.008 Y94.931 E-.10456
G1 X99.259 Y95.044 E-.10456
G1 X99.497 Y95.181 E-.10456
G1 X99.721 Y95.342 E-.10456
G1 X99.927 Y95.524 E-.10456
G1 X100.114 Y95.726 E-.10456
G1 X100.242 Y95.894 E-.08015
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-.041 J1.216 P1  F30000
G1 X165.092 Y98.107 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15434
G1 X165.087 Y98.124 E.00061
G3 X161.921 Y94.349 I-3.087 J-.626 E.46894
G1 X162.079 Y94.349 E.00521
G3 X165.134 Y97.814 I-.079 J3.149 E.17203
G1 X165.101 Y98.047 E.00783
G1 X164.703 Y98.046 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X161.931 Y94.741 I-2.703 J-.548 E.38033
G1 X162.069 Y94.741 E.00423
G3 X164.715 Y97.988 I-.069 J2.757 E.14613
M204 S10000
; WIPE_START
G1 F24000
G1 X164.637 Y98.314 E-.1273
G1 X164.543 Y98.572 E-.10456
G1 X164.424 Y98.82 E-.10456
G1 X164.28 Y99.055 E-.10456
G1 X164.114 Y99.274 E-.10456
G1 X163.927 Y99.476 E-.10456
G1 X163.721 Y99.658 E-.10456
G1 X163.709 Y99.666 E-.00535
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.07 J-.58 P1  F30000
G1 X130 Y161.786 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15434
G1 X91.037 Y93.602 E2.60503
G1 X168.963 Y93.602 E2.58492
G1 X154.811 Y118.368 E.9462
G1 X130.03 Y161.734 E1.65684
G1 X130 Y162.577 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X90.362 Y93.21 E2.4549
G1 X169.638 Y93.21 E2.43594
G1 X155.151 Y118.562 E.89723
G1 X130.03 Y162.525 E1.55583
M204 S10000
; WIPE_START
G1 F24000
G1 X129.036 Y160.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I1.102 J.517 P1  F30000
G1 X133.184 Y151.948 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15434
G3 X132.197 Y153.225 I-3.42 J-1.625 E.05394
G1 X133.657 Y154.685 E.0685
G1 X133.174 Y155.53 E.03228
G1 X129.134 Y159.57 E.18952
G1 X130 Y161.085 E.05788
G1 X130.866 Y159.57 E.05788
G1 X126.826 Y155.53 E.18952
G1 X126.343 Y154.685 E.03228
G1 X127.803 Y153.225 E.0685
G3 X126.816 Y151.948 I2.263 J-2.769 E.05398
G1 X118.777 Y141.445 F30000
G1 F15434
G1 X117.969 Y140.031 E.05401
G1 X158.893 Y99.107 E1.91981
G3 X159.042 Y95.634 I3.114 J-1.606 E.12064
G1 X157.358 Y93.95 E.07901
G1 X156.374 Y93.95 E.03265
G1 X115.178 Y135.146 E1.93257
G1 X116.591 Y137.619 E.09448
G1 X126.5 Y147.528 E.46483
G1 X126.5 Y146.852 E.0224
G1 X123.552 Y149.8 E.13829
G1 X120.761 Y144.915 E.18662
G1 X126.5 Y139.176 E.26923
G1 X126.5 Y139.852 E.0224
G1 X106.357 Y119.708 E.94495
G1 X104.013 Y115.607 E.15669
G1 X125.67 Y93.95 E1.01597
G1 X126.654 Y93.95 E.03265
G1 X153.196 Y120.492 E1.24512
G1 X162.34 Y100.981 F30000
G1 F15434
G2 X163.865 Y100.458 I-.533 J-4.038 E.05385
G1 X164.361 Y100.953 E.02324
G1 X163.878 Y101.798 E.03228
G1 X131.386 Y134.29 E1.52425
M73 P36 R16
G2 X128.616 Y134.292 I-1.382 J3.197 E.09451
G1 X96.122 Y101.798 E1.52437
G1 X95.639 Y100.953 E.03228
G1 X96.138 Y100.454 E.0234
G2 X97.661 Y100.979 I1.84 J-2.866 E.05396
G1 X95.118 Y99.752 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.596589
G1 F11378.651
G1 X94.73 Y99.09 E.03464
G1 X94.867 Y98.729 E.01741
G1 X94.537 Y98.182 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X94.472 Y97.836 E.01082
G3 X94.618 Y96.44 I3.759 J-.311 E.0434
G1 X94.88 Y95.819 E.02069
G3 X96.305 Y94.413 I2.962 J1.575 E.06247
G1 X96.231 Y94.282 E.00462
G3 X96.364 Y93.994 I.609 J.108 E.00986
G1 X91.713 Y93.994 E.14292
G1 X94.244 Y98.423 E.15675
G1 X94.378 Y98.196 E.00811
G1 X94.477 Y98.187 E.00307
G1 X94.083 Y97.382 F30000
G1 F15000
G3 X94.533 Y95.673 I4.351 J.231 E.05467
G3 X95.642 Y94.371 I3.778 J2.096 E.0529
G1 X92.363 Y94.371 E.10075
G1 X94.053 Y97.33 E.1047
G1 X93.883 Y96.272 F30000
G1 F15000
G1 X94.185 Y95.526 E.02471
G1 X94.533 Y94.962 E.02037
G1 X94.707 Y94.748 E.00848
G1 X93.013 Y94.748 E.05207
G1 X93.853 Y96.22 E.05208
G1 X93.852 Y95.155 F30000
; LINE_WIDTH: 0.599868
G1 F11311.649
G2 X93.857 Y95.267 I-.031 J.058 E.01245
G1 X96.888 Y94.328 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.443444
G1 F15000
G1 X97.042 Y94.075 E.00963
; LINE_WIDTH: 0.480657
G1 F14392.212
G1 X97.066 Y94.037 E.00162
G1 X97.2 Y94.02 E.00484
; LINE_WIDTH: 0.438331
G1 F15000
G1 X97.378 Y94.002 E.00576
; LINE_WIDTH: 0.410916
G1 X97.555 Y93.989 E.00533
; LINE_WIDTH: 0.387197
G1 X98.259 Y93.98 E.01975
; LINE_WIDTH: 0.420465
G1 X98.612 Y94.001 E.01086
; LINE_WIDTH: 0.467958
G1 F14822.201
G1 X98.789 Y94.019 E.00616
; LINE_WIDTH: 0.499592
G1 F13795.476
G1 X98.934 Y94.037 E.00544
G1 X98.946 Y94.056 E.00084
; LINE_WIDTH: 0.443462
G1 F15000
G1 X98.958 Y94.075 E.00074
; LINE_WIDTH: 0.421771
G1 X99.112 Y94.328 E.00911
; WIPE_START
G1 F24000
G1 X98.958 Y94.075 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I-1.217 J.026 P1  F30000
G1 X99.238 Y107.252 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15434
G1 X98.43 Y105.838 E.05401
G1 X110.318 Y93.95 E.55766
G1 X111.302 Y93.95 E.03265
G1 X147.613 Y130.261 E1.70342
G1 X150.405 Y125.377 E.18662
G1 X118.978 Y93.95 E1.47427
G1 X117.994 Y93.95 E.03265
G1 X101.222 Y110.722 E.78682
G1 X102.03 Y112.136 E.05401
G1 X106.804 Y120.492 F30000
G1 F15434
G1 X133.346 Y93.95 E1.24512
G1 X134.33 Y93.95 E.03265
G1 X155.987 Y115.607 E1.01597
G1 X153.643 Y119.708 E.15669
G1 X133.5 Y139.852 E.94495
G1 X133.5 Y139.176 E.0224
G1 X139.239 Y144.915 E.26923
G1 X136.448 Y149.8 E.18662
G1 X133.5 Y146.852 E.13829
G1 X133.5 Y147.528 E.0224
G1 X143.409 Y137.619 E.46483
G1 X144.822 Y135.146 E.09448
G1 X103.626 Y93.95 E1.93257
G1 X102.642 Y93.95 E.03265
G1 X100.959 Y95.633 E.07894
G3 X101.106 Y99.106 I-2.968 J1.865 E.12065
G1 X142.031 Y140.031 E1.91986
G1 X141.223 Y141.445 E.05401
; WIPE_START
G1 F24000
G1 X142.031 Y140.031 E-.61876
G1 X141.768 Y139.768 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.6 I.414 J-1.144 P1  F30000
G1 X111.579 Y128.848 Z1.6
G1 Z1.2
G1 E.8 F1800
G1 F15434
G1 X112.387 Y130.261 E.05401
G1 X148.698 Y93.95 E1.70342
G1 X149.682 Y93.95 E.03265
G1 X161.57 Y105.838 E.55766
G1 X158.778 Y110.722 E.18662
G1 X142.006 Y93.95 E.78682
G1 X141.022 Y93.95 E.03265
G1 X109.595 Y125.377 E1.47427
G1 X108.788 Y123.963 E.05401
G1 X160.888 Y94.328 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.443444
G1 F15000
G1 X161.042 Y94.075 E.00963
; LINE_WIDTH: 0.480658
G1 F14392.199
G1 X161.066 Y94.037 E.00162
G1 X161.2 Y94.02 E.00484
; LINE_WIDTH: 0.438329
G1 F15000
G1 X161.378 Y94.002 E.00576
; LINE_WIDTH: 0.410916
G1 X161.555 Y93.989 E.00533
; LINE_WIDTH: 0.387197
G1 X162.259 Y93.98 E.01975
; LINE_WIDTH: 0.420465
G1 X162.612 Y94.001 E.01086
; LINE_WIDTH: 0.467958
G1 F14822.201
G1 X162.789 Y94.019 E.00616
; LINE_WIDTH: 0.499593
G1 F13795.444
G1 X162.934 Y94.037 E.00544
G1 X162.946 Y94.056 E.00084
; LINE_WIDTH: 0.443457
G1 F15000
G1 X162.958 Y94.075 E.00074
; LINE_WIDTH: 0.421767
G1 X163.112 Y94.328 E.00911
G1 X165.458 Y98.185 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X165.619 Y98.198 E.00495
G1 X165.752 Y98.43 E.00821
G1 X168.287 Y93.994 E.15697
G2 X163.629 Y93.996 I-2.216 J285.825 E.14314
G1 X163.76 Y94.284 E.00973
G1 X163.698 Y94.397 E.00395
G1 X164.195 Y94.718 E.01818
G1 X164.703 Y95.208 E.02168
G1 X165.103 Y95.789 E.02168
G1 X165.381 Y96.438 E.02168
G1 X165.524 Y97.128 E.02168
G1 X165.528 Y97.834 E.02168
G1 X165.47 Y98.126 E.00914
G1 X165.905 Y97.402 F30000
G1 F15000
G1 X167.637 Y94.371 E.10727
G1 X164.353 Y94.371 E.1009
G1 X164.966 Y94.938 E.02564
G1 X165.415 Y95.576 E.02398
G1 X165.728 Y96.291 E.02398
G1 X165.894 Y97.054 E.02398
G1 X165.903 Y97.342 E.00888
G1 X166.116 Y96.274 F30000
G1 F15000
G1 X166.987 Y94.748 E.05399
G1 X165.297 Y94.748 E.05195
G1 X165.726 Y95.364 E.02307
G1 X166.098 Y96.217 E.02858
G1 X166.217 Y95.155 F30000
; LINE_WIDTH: 0.59996
G1 F11309.781
G2 X166.222 Y95.267 I-.031 J.058 E.01246
G1 X165.133 Y98.729 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.585722
G1 F11606.454
G1 X165.27 Y99.09 E.01707
G1 X164.882 Y99.752 E.03396
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X165.27 Y99.09 E-.50576
G1 X165.133 Y98.729 E-.25424
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/88
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
G3 Z1.6 I-.851 J-.869 P1  F30000
G1 X128.145 Y134.952 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15013
G1 X128.164 Y134.947 E.00066
G3 X129.921 Y134.349 I1.857 J2.573 E.06248
G3 X133.152 Y137.493 I.07 J3.16 E.16647
G1 X133.152 Y150.512 E.43188
G3 X126.848 Y150.507 I-3.152 J-.013 E.32779
G1 X126.848 Y137.493 E.43173
G3 X127.916 Y135.146 I3.173 J.028 E.08805
G1 X128.1 Y134.991 E.00799
G1 X128.399 Y135.253 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.623 Y135.115 E.00809
G3 X129.931 Y134.741 I1.396 J2.403 E.04223
G3 X132.76 Y137.497 I.061 J2.767 E.13514
G1 X132.76 Y150.504 E.39966
G3 X127.24 Y150.503 I-2.76 J-.005 E.26617
G1 X127.24 Y137.497 E.39961
G3 X128.355 Y135.292 I2.779 J.021 E.07868
M204 S10000
; WIPE_START
G1 F24000
G1 X128.623 Y135.115 E-.122
G1 X128.865 Y134.984 E-.10446
G1 X129.121 Y134.884 E-.10455
G1 X129.386 Y134.809 E-.10456
G1 X129.657 Y134.761 E-.10456
G1 X129.931 Y134.741 E-.10456
G1 X130.206 Y134.748 E-.10456
G1 X130.234 Y134.751 E-.01074
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I.959 J-.749 P1  F30000
G1 X98.719 Y94.432 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15013
G1 X99.004 Y94.512 E.00982
G3 X97.921 Y94.349 I-1.004 J2.988 E.62041
G1 X98.079 Y94.349 E.00521
G3 X98.661 Y94.418 I-.079 J3.151 E.01947
G1 X98.651 Y94.82 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.879 Y94.884 E.00728
G3 X97.931 Y94.741 I-.879 J2.616 E.50318
G1 X98.069 Y94.741 E.00423
G3 X98.593 Y94.804 I-.069 J2.759 E.01625
M204 S10000
; WIPE_START
G1 F24000
G1 X98.879 Y94.884 E-.11276
G1 X99.135 Y94.984 E-.10456
G1 X99.38 Y95.11 E-.10455
G1 X99.611 Y95.259 E-.10456
G1 X99.826 Y95.431 E-.10456
G1 X100.023 Y95.623 E-.10456
G1 X100.2 Y95.833 E-.10456
G1 X100.23 Y95.877 E-.01988
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-.042 J1.216 P1  F30000
G1 X165.092 Y98.107 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15013
G1 X165.089 Y98.124 E.0006
G3 X161.921 Y94.349 I-3.089 J-.625 E.4692
G1 X162.079 Y94.349 E.00521
G3 X165.136 Y97.814 I-.079 J3.151 E.17206
G1 X165.101 Y98.047 E.00783
G1 X164.705 Y98.047 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X161.931 Y94.741 I-2.705 J-.547 E.38055
G1 X162.069 Y94.741 E.00423
G3 X164.716 Y97.988 I-.069 J2.759 E.14617
M204 S10000
; WIPE_START
G1 F24000
G1 X164.637 Y98.314 E-.12731
G1 X164.543 Y98.572 E-.10456
G1 X164.424 Y98.82 E-.10455
G1 X164.28 Y99.055 E-.10456
G1 X164.114 Y99.274 E-.10456
G1 X163.927 Y99.476 E-.10456
G1 X163.721 Y99.658 E-.10456
G1 X163.709 Y99.666 E-.00534
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I-1.07 J-.58 P1  F30000
G1 X130 Y161.786 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15013
G1 X91.037 Y93.602 E2.60503
G1 X168.963 Y93.602 E2.58492
G1 X152.144 Y123.035 E1.12449
G1 X130.03 Y161.734 E1.47855
G1 X130 Y162.577 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X90.362 Y93.21 E2.4549
G1 X169.638 Y93.21 E2.43594
G1 X152.484 Y123.229 E1.06238
G1 X130.03 Y162.525 E1.39067
M204 S10000
; WIPE_START
G1 F24000
G1 X129.036 Y160.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.8 I1.102 J.517 P1  F30000
G1 X133.182 Y151.947 Z1.8
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15013
G3 X132.197 Y153.225 I-3.871 J-1.965 E.05384
G1 X133.657 Y154.685 E.06849
G1 X133.174 Y155.53 E.03228
G1 X129.134 Y159.57 E.18952
G1 X130 Y161.085 E.05788
G1 X130.866 Y159.57 E.05788
G1 X126.826 Y155.53 E.18952
G1 X126.343 Y154.685 E.03228
G1 X127.803 Y153.225 E.0685
G3 X126.816 Y151.948 I2.263 J-2.769 E.05398
G1 X118.777 Y141.445 F30000
G1 F15013
G1 X117.969 Y140.031 E.05401
G1 X158.893 Y99.107 E1.91981
G3 X159.041 Y95.633 I3.121 J-1.607 E.12067
G1 X157.358 Y93.95 E.07894
G1 X156.374 Y93.95 E.03265
G1 X115.178 Y135.146 E1.93257
G1 X116.591 Y137.619 E.09448
G1 X126.5 Y147.528 E.46483
G1 X126.5 Y146.852 E.0224
G1 X123.552 Y149.8 E.13829
G1 X120.761 Y144.915 E.18662
G1 X126.5 Y139.176 E.26923
G1 X126.5 Y139.852 E.0224
G1 X106.357 Y119.708 E.94495
G1 X104.013 Y115.607 E.15669
G1 X125.67 Y93.95 E1.01597
G1 X126.654 Y93.95 E.03265
G1 X153.196 Y120.492 E1.24512
G1 X149.597 Y126.79 F30000
G1 F15013
G1 X150.405 Y125.377 E.05401
G1 X118.978 Y93.95 E1.47427
G1 X117.994 Y93.95 E.03265
G1 X101.222 Y110.722 E.78682
G1 X98.43 Y105.838 E.18662
G1 X110.318 Y93.95 E.55766
G1 X111.302 Y93.95 E.03265
G1 X147.613 Y130.261 E1.70342
G1 X146.805 Y131.675 E.05401
G1 X141.223 Y141.445 F30000
G1 F15013
G1 X142.031 Y140.031 E.05401
G1 X101.106 Y99.106 E1.91986
G2 X100.959 Y95.633 I-3.133 J-1.607 E.12059
G1 X102.642 Y93.95 E.07894
G1 X103.626 Y93.95 E.03265
G1 X144.822 Y135.146 E1.93257
G1 X143.409 Y137.619 E.09448
G1 X133.5 Y147.528 E.46483
G1 X133.5 Y146.852 E.0224
G1 X136.448 Y149.8 E.13829
G1 X139.239 Y144.915 E.18662
G1 X133.5 Y139.176 E.26923
G1 X133.5 Y139.852 E.0224
G1 X153.643 Y119.709 E.94495
G1 X155.987 Y115.607 E.15669
G1 X134.33 Y93.95 E1.01597
G1 X133.346 Y93.95 E.03265
G1 X106.804 Y120.492 E1.24512
G1 X108.788 Y123.963 F30000
G1 F15013
G1 X109.595 Y125.377 E.05401
G1 X141.022 Y93.95 E1.47427
G1 X142.006 Y93.95 E.03265
G1 X158.778 Y110.722 E.78682
G1 X161.57 Y105.838 E.18662
G1 X149.682 Y93.95 E.55766
G1 X148.698 Y93.95 E.03265
G1 X112.387 Y130.261 E1.70342
G1 X111.579 Y128.848 E.05401
G1 X97.661 Y100.979 F30000
G1 F15013
G3 X96.138 Y100.454 I.316 J-3.391 E.05396
G1 X95.639 Y100.953 E.0234
G1 X96.122 Y101.798 E.03228
G1 X128.615 Y134.291 E1.52433
M73 P37 R16
G3 X131.386 Y134.29 I1.388 J3.201 E.09453
G1 X163.878 Y101.798 E1.52425
G1 X164.361 Y100.953 E.03228
G1 X163.865 Y100.458 E.02324
G3 X162.34 Y100.981 I-2.058 J-3.515 E.05385
G1 X164.882 Y99.752 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.585703
G1 F11606.866
G1 X165.27 Y99.09 E.03396
G1 X165.133 Y98.729 E.01707
G1 X165.458 Y98.185 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X165.619 Y98.198 E.00495
G1 X165.752 Y98.43 E.00821
G1 X168.287 Y93.994 E.15697
G2 X163.629 Y93.996 I-2.216 J287.218 E.14314
G1 X163.76 Y94.284 E.00973
G1 X163.698 Y94.397 E.00395
G1 X164.195 Y94.718 E.01818
G1 X164.703 Y95.208 E.02168
G1 X165.103 Y95.789 E.02168
G1 X165.381 Y96.438 E.02169
G1 X165.524 Y97.128 E.02168
G1 X165.528 Y97.834 E.02168
G1 X165.47 Y98.126 E.00914
G1 X165.905 Y97.402 F30000
G1 F15000
G1 X167.637 Y94.371 E.10727
G1 X164.353 Y94.371 E.1009
G1 X164.966 Y94.938 E.02564
G1 X165.415 Y95.576 E.02398
G1 X165.728 Y96.291 E.02398
G1 X165.894 Y97.054 E.02398
G1 X165.903 Y97.342 E.00888
G1 X166.116 Y96.274 F30000
G1 F15000
G1 X166.987 Y94.748 E.05399
G1 X165.297 Y94.748 E.05195
G1 X165.726 Y95.364 E.02307
G1 X166.098 Y96.217 E.02858
G1 X166.217 Y95.155 F30000
; LINE_WIDTH: 0.599958
G1 F11309.821
G2 X166.222 Y95.267 I-.031 J.058 E.01246
G1 X163.112 Y94.328 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.421758
G1 F15000
G1 X162.958 Y94.075 E.00911
; LINE_WIDTH: 0.443457
G1 X162.946 Y94.056 E.00074
; LINE_WIDTH: 0.499592
G1 F13795.47
G1 X162.934 Y94.037 E.00084
G1 X162.789 Y94.019 E.00544
; LINE_WIDTH: 0.467959
G1 F14822.188
G1 X162.612 Y94.001 E.00616
; LINE_WIDTH: 0.420466
G1 F15000
G1 X162.259 Y93.98 E.01086
; LINE_WIDTH: 0.387197
G1 X161.555 Y93.989 E.01975
; LINE_WIDTH: 0.410916
G1 X161.378 Y94.002 E.00533
; LINE_WIDTH: 0.438328
G1 X161.2 Y94.02 E.00576
; LINE_WIDTH: 0.480656
G1 F14392.242
G1 X161.066 Y94.037 E.00484
G1 X161.042 Y94.075 E.00162
; LINE_WIDTH: 0.443462
G1 F15000
G1 X160.888 Y94.328 E.00964
G1 X99.112 Y94.328 F30000
; LINE_WIDTH: 0.421777
G1 F15000
G1 X98.958 Y94.075 E.00911
; LINE_WIDTH: 0.443468
G1 X98.946 Y94.056 E.00074
; LINE_WIDTH: 0.499593
G1 F13795.431
G1 X98.934 Y94.037 E.00084
G1 X98.789 Y94.019 E.00544
; LINE_WIDTH: 0.467963
G1 F14822.043
G1 X98.612 Y94.001 E.00617
; LINE_WIDTH: 0.420463
G1 F15000
G1 X98.259 Y93.98 E.01086
; LINE_WIDTH: 0.387197
G1 X97.555 Y93.989 E.01975
; LINE_WIDTH: 0.410916
G1 X97.378 Y94.002 E.00533
; LINE_WIDTH: 0.438329
G1 X97.2 Y94.02 E.00576
; LINE_WIDTH: 0.480656
G1 F14392.242
G1 X97.066 Y94.037 E.00484
G1 X97.042 Y94.075 E.00162
; LINE_WIDTH: 0.443462
G1 F15000
G1 X96.888 Y94.328 E.00964
G1 X94.522 Y98.179 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X94.459 Y97.355 E.0254
G1 X94.562 Y96.641 E.02215
G3 X95.918 Y94.632 I3.575 J.95 E.07588
G1 X96.305 Y94.413 E.01367
G1 X96.231 Y94.282 E.00462
G3 X96.364 Y93.994 I.608 J.108 E.00986
G1 X91.713 Y93.994 E.14292
G1 X94.244 Y98.423 E.15675
G1 X94.381 Y98.194 E.0082
G1 X94.463 Y98.185 E.00254
G1 X94.084 Y97.382 F30000
G1 F15000
G1 X94.189 Y96.585 E.0247
G3 X95.642 Y94.371 I3.942 J1.003 E.08288
G1 X92.363 Y94.371 E.10075
G1 X94.054 Y97.33 E.10472
G1 X93.886 Y96.276 F30000
G1 F15000
G3 X94.618 Y94.85 I4.288 J1.299 E.04954
G1 X94.707 Y94.748 E.00415
G1 X93.013 Y94.748 E.05207
G1 X93.856 Y96.224 E.05223
G1 X93.852 Y95.155 F30000
; LINE_WIDTH: 0.59987
G1 F11311.608
G2 X93.857 Y95.267 I-.031 J.058 E.01245
G1 X94.867 Y98.729 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.596584
G1 F11378.743
G1 X94.73 Y99.09 E.01741
G1 X95.118 Y99.752 E.03464
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X94.73 Y99.09 E-.50576
G1 X94.867 Y98.729 E-.25424
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/88
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
G3 Z1.8 I-.893 J.827 P1  F30000
G1 X128.314 Y134.839 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15462
G1 X128.705 Y134.629 E.01472
G3 X129.921 Y134.349 I1.305 J2.88 E.04169
G3 X133.152 Y137.493 I.07 J3.16 E.16647
G1 X133.152 Y150.507 E.43173
G3 X126.848 Y150.507 I-3.152 J-.008 E.32794
G1 X126.848 Y137.488 E.4319
G3 X128.264 Y134.873 I3.162 J.022 E.10269
G1 X128.435 Y135.23 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.504 Y135.184 E.00256
G3 X129.931 Y134.741 I1.504 J2.324 E.04649
G3 X132.76 Y137.497 I.061 J2.767 E.13514
G1 X132.76 Y150.503 E.39961
G3 X127.24 Y150.503 I-2.76 J-.003 E.26622
G1 X127.24 Y137.496 E.39967
G3 X128.281 Y135.345 I2.769 J.013 E.07592
G1 X128.387 Y135.266 E.00405
M204 S10000
; WIPE_START
G1 F24000
G1 X128.504 Y135.184 E-.05442
G1 X128.865 Y134.984 E-.15667
G1 X129.121 Y134.884 E-.10455
G1 X129.386 Y134.809 E-.10456
G1 X129.657 Y134.761 E-.10456
G1 X129.931 Y134.741 E-.10456
G1 X130.206 Y134.748 E-.10456
G1 X130.274 Y134.756 E-.02611
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.956 J-.752 P1  F30000
G1 X98.52 Y94.393 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15462
G1 X98.547 Y94.396 E.0009
G3 X97.921 Y94.349 I-.547 J3.104 E.63605
G1 X98.079 Y94.349 E.00521
G1 X98.461 Y94.387 E.01274
G1 X98.632 Y94.817 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.748 Y94.843 E.00363
G3 X97.931 Y94.741 I-.748 J2.656 E.50741
G1 X98.069 Y94.741 E.00423
G3 X98.479 Y94.782 I-.069 J2.759 E.01269
G1 X98.574 Y94.803 E.00298
M204 S10000
; WIPE_START
G1 F24000
G1 X98.748 Y94.843 E-.06771
G1 X99.008 Y94.931 E-.10456
G1 X99.259 Y95.044 E-.10456
G1 X99.497 Y95.181 E-.10456
G1 X99.721 Y95.342 E-.10456
G1 X99.927 Y95.524 E-.10456
G1 X100.114 Y95.726 E-.10455
G1 X100.218 Y95.862 E-.06494
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-.042 J1.216 P1  F30000
G1 X165.092 Y98.107 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15462
G1 X165.089 Y98.124 E.0006
G3 X161.921 Y94.349 I-3.089 J-.625 E.4692
G1 X162.079 Y94.349 E.00521
G3 X165.136 Y97.814 I-.079 J3.151 E.17206
G1 X165.101 Y98.047 E.00783
G1 X164.705 Y98.047 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X161.931 Y94.741 I-2.705 J-.547 E.38055
G1 X162.069 Y94.741 E.00423
G3 X164.716 Y97.988 I-.069 J2.759 E.14617
M204 S10000
; WIPE_START
G1 F24000
G1 X164.637 Y98.314 E-.12731
G1 X164.543 Y98.572 E-.10456
G1 X164.424 Y98.82 E-.10456
G1 X164.28 Y99.055 E-.10456
G1 X164.114 Y99.274 E-.10456
G1 X163.927 Y99.476 E-.10456
G1 X163.721 Y99.658 E-.10456
G1 X163.709 Y99.666 E-.00533
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.07 J-.58 P1  F30000
G1 X130 Y161.786 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15462
G1 X91.037 Y93.602 E2.60503
G1 X168.963 Y93.602 E2.58492
G1 X130.03 Y161.734 E2.60304
G1 X130 Y162.577 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X90.362 Y93.21 E2.4549
G1 X169.638 Y93.21 E2.43594
G1 X130.03 Y162.525 E2.45305
M204 S10000
; WIPE_START
G1 F24000
G1 X129.036 Y160.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I1.102 J.516 P1  F30000
G1 X133.178 Y151.946 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15462
G3 X132.194 Y153.222 I-3.112 J-1.382 E.05397
G1 X133.657 Y154.685 E.06861
G1 X133.174 Y155.53 E.03228
G1 X129.134 Y159.57 E.18952
G1 X130 Y161.085 E.05788
G1 X130.866 Y159.57 E.05788
G1 X126.826 Y155.53 E.18952
G1 X126.343 Y154.685 E.03228
G1 X127.803 Y153.225 E.0685
G3 X126.816 Y151.948 I2.263 J-2.769 E.05398
G1 X118.777 Y141.445 F30000
G1 F15462
G1 X117.969 Y140.031 E.05401
G1 X158.893 Y99.107 E1.91981
G3 X159.041 Y95.633 I3.121 J-1.607 E.12067
G1 X157.358 Y93.95 E.07894
G1 X156.374 Y93.95 E.03265
G1 X115.178 Y135.146 E1.93257
G1 X116.591 Y137.619 E.09448
G1 X126.5 Y147.528 E.46483
G1 X126.5 Y146.852 E.0224
G1 X123.552 Y149.8 E.13829
G1 X120.761 Y144.915 E.18662
G1 X126.5 Y139.176 E.26923
G1 X126.5 Y139.852 E.0224
G1 X106.357 Y119.708 E.94495
G1 X104.013 Y115.607 E.15669
G1 X125.67 Y93.95 E1.01597
G1 X126.654 Y93.95 E.03265
G1 X153.196 Y120.492 E1.24512
G1 X162.34 Y100.981 F30000
G1 F15462
G2 X163.865 Y100.458 I-.533 J-4.038 E.05385
G1 X164.361 Y100.953 E.02324
G1 X163.878 Y101.798 E.03228
G1 X131.386 Y134.29 E1.52425
G2 X128.615 Y134.291 I-1.383 J3.203 E.09453
G1 X96.122 Y101.798 E1.52433
G1 X95.639 Y100.953 E.03228
G1 X96.138 Y100.454 E.0234
G2 X97.662 Y100.975 I2.375 J-4.456 E.05366
G1 X95.118 Y99.752 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.59659
G1 F11378.633
G1 X94.73 Y99.09 E.03464
G1 X94.867 Y98.729 E.01741
G1 X94.537 Y98.182 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X94.472 Y97.836 E.01082
G3 X94.618 Y96.44 I3.759 J-.311 E.0434
G1 X94.88 Y95.819 E.02069
G3 X96.305 Y94.413 I2.962 J1.575 E.06247
G1 X96.231 Y94.282 E.00462
G3 X96.364 Y93.994 I.609 J.108 E.00986
G1 X91.713 Y93.994 E.14292
G1 X94.244 Y98.423 E.15675
G1 X94.378 Y98.196 E.00811
G1 X94.477 Y98.187 E.00307
G1 X94.083 Y97.382 F30000
G1 F15000
G3 X94.533 Y95.673 I4.351 J.231 E.05467
G3 X95.642 Y94.371 I3.778 J2.096 E.0529
G1 X92.363 Y94.371 E.10075
G1 X94.053 Y97.33 E.1047
G1 X93.883 Y96.272 F30000
G1 F15000
G1 X94.185 Y95.526 E.02471
G1 X94.533 Y94.962 E.02037
G1 X94.707 Y94.748 E.00848
G1 X93.013 Y94.748 E.05207
G1 X93.853 Y96.22 E.05208
G1 X93.852 Y95.155 F30000
; LINE_WIDTH: 0.59987
G1 F11311.608
G2 X93.857 Y95.267 I-.031 J.058 E.01245
G1 X96.888 Y94.328 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.443459
G1 F15000
G1 X97.042 Y94.075 E.00964
; LINE_WIDTH: 0.480657
G1 F14392.228
G1 X97.066 Y94.037 E.00162
G1 X97.2 Y94.02 E.00484
; LINE_WIDTH: 0.438331
G1 F15000
G1 X97.378 Y94.002 E.00576
; LINE_WIDTH: 0.410914
G1 X97.555 Y93.989 E.00533
; LINE_WIDTH: 0.387197
G1 X98.259 Y93.98 E.01975
; LINE_WIDTH: 0.420465
G1 X98.612 Y94.001 E.01086
; LINE_WIDTH: 0.467959
G1 F14822.195
G1 X98.789 Y94.019 E.00616
; LINE_WIDTH: 0.499593
G1 F13795.438
G1 X98.934 Y94.037 E.00544
G1 X98.946 Y94.056 E.00084
; LINE_WIDTH: 0.443466
G1 F15000
G1 X98.958 Y94.075 E.00074
; LINE_WIDTH: 0.421774
G1 X99.112 Y94.328 E.00911
; WIPE_START
G1 F24000
G1 X98.958 Y94.075 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I-1.217 J.026 P1  F30000
G1 X99.238 Y107.252 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15462
G1 X98.43 Y105.838 E.05401
G1 X110.318 Y93.95 E.55766
G1 X111.302 Y93.95 E.03265
G1 X147.613 Y130.261 E1.70342
G1 X150.405 Y125.377 E.18662
G1 X118.978 Y93.95 E1.47427
G1 X117.994 Y93.95 E.03265
G1 X101.222 Y110.722 E.78682
G1 X100.414 Y109.309 E.05401
G1 X106.804 Y120.492 F30000
G1 F15462
G1 X133.346 Y93.95 E1.24512
G1 X134.33 Y93.95 E.03265
G1 X155.987 Y115.607 E1.01597
G1 X153.643 Y119.709 E.15669
G1 X133.5 Y139.852 E.94495
G1 X133.5 Y139.176 E.0224
G1 X139.239 Y144.915 E.26923
G1 X136.448 Y149.8 E.18662
G1 X133.5 Y146.852 E.13829
G1 X133.5 Y147.528 E.0224
G1 X143.409 Y137.619 E.46483
G1 X144.822 Y135.146 E.09448
G1 X103.626 Y93.95 E1.93257
G1 X102.642 Y93.95 E.03265
G1 X100.959 Y95.633 E.07894
G3 X101.106 Y99.106 I-3.008 J1.867 E.12053
G1 X142.031 Y140.031 E1.91986
G1 X141.223 Y141.445 E.05401
; WIPE_START
G1 F24000
G1 X142.031 Y140.031 E-.61876
G1 X141.768 Y139.768 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2 I.414 J-1.144 P1  F30000
G1 X111.579 Y128.848 Z2
G1 Z1.6
G1 E.8 F1800
G1 F15462
G1 X112.387 Y130.261 E.05401
G1 X148.698 Y93.95 E1.70342
G1 X149.682 Y93.95 E.03265
G1 X161.57 Y105.838 E.55766
G1 X158.778 Y110.722 E.18662
G1 X142.006 Y93.95 E.78682
G1 X141.022 Y93.95 E.03265
G1 X109.595 Y125.377 E1.47427
G1 X108.788 Y123.963 E.05401
G1 X160.888 Y94.328 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.443459
G1 F15000
G1 X161.042 Y94.075 E.00964
; LINE_WIDTH: 0.480657
G1 F14392.228
G1 X161.066 Y94.037 E.00162
G1 X161.2 Y94.02 E.00484
; LINE_WIDTH: 0.438331
G1 F15000
G1 X161.378 Y94.002 E.00576
; LINE_WIDTH: 0.410914
G1 X161.555 Y93.989 E.00533
; LINE_WIDTH: 0.387197
G1 X162.259 Y93.98 E.01975
; LINE_WIDTH: 0.420465
G1 X162.612 Y94.001 E.01086
; LINE_WIDTH: 0.467959
G1 F14822.188
G1 X162.789 Y94.019 E.00616
; LINE_WIDTH: 0.499594
G1 F13795.417
G1 X162.934 Y94.037 E.00544
G1 X162.946 Y94.056 E.00084
; LINE_WIDTH: 0.443459
G1 F15000
G1 X162.958 Y94.075 E.00074
; LINE_WIDTH: 0.421769
G1 X163.112 Y94.328 E.00911
G1 X165.458 Y98.185 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X165.619 Y98.198 E.00495
G1 X165.752 Y98.43 E.0082
G1 X168.287 Y93.994 E.15697
G2 X163.629 Y93.996 I-2.216 J285.984 E.14314
G1 X163.76 Y94.284 E.00973
G1 X163.698 Y94.397 E.00395
G1 X164.195 Y94.718 E.01818
G1 X164.703 Y95.208 E.02168
G1 X165.103 Y95.789 E.02168
G1 X165.381 Y96.438 E.02168
G1 X165.524 Y97.128 E.02168
G1 X165.528 Y97.834 E.02168
M73 P38 R16
G1 X165.47 Y98.126 E.00914
G1 X165.905 Y97.402 F30000
G1 F15000
G1 X167.637 Y94.371 E.10727
G1 X164.353 Y94.371 E.1009
G1 X164.966 Y94.938 E.02564
G1 X165.415 Y95.576 E.02398
G1 X165.728 Y96.291 E.02398
G1 X165.894 Y97.054 E.02398
G1 X165.903 Y97.342 E.00888
G1 X166.116 Y96.274 F30000
G1 F15000
G1 X166.987 Y94.748 E.05399
G1 X165.297 Y94.748 E.05195
G1 X165.726 Y95.364 E.02307
G1 X166.098 Y96.217 E.02858
G1 X166.217 Y95.155 F30000
; LINE_WIDTH: 0.59996
G1 F11309.781
G2 X166.222 Y95.267 I-.031 J.058 E.01246
G1 X165.133 Y98.729 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.585723
G1 F11606.425
G1 X165.27 Y99.09 E.01707
G1 X164.882 Y99.752 E.03396
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X165.27 Y99.09 E-.50577
G1 X165.133 Y98.729 E-.25423
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/88
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
G3 Z2 I-.852 J-.869 P1  F30000
G1 X128.314 Y134.839 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.705 Y134.629 E.01472
G3 X129.921 Y134.349 I1.305 J2.88 E.04169
G3 X133.152 Y137.493 I.07 J3.16 E.16647
G1 X133.152 Y150.507 E.43173
G3 X126.848 Y150.507 I-3.152 J-.011 E.32774
G1 X126.848 Y137.488 E.43188
G3 X128.264 Y134.873 I3.162 J.021 E.1027
G1 X128.468 Y135.206 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.504 Y135.184 E.00129
G3 X129.931 Y134.741 I1.504 J2.324 E.04649
G3 X132.76 Y137.497 I.061 J2.767 E.13514
G1 X132.76 Y150.503 E.39961
G3 X127.24 Y150.503 I-2.76 J-.006 E.26606
G1 X127.24 Y137.496 E.39966
G3 X128.281 Y135.345 I2.769 J.013 E.07593
G1 X128.42 Y135.242 E.00531
M204 S10000
; WIPE_START
G1 F24000
G1 X128.504 Y135.184 E-.03877
G1 X128.865 Y134.984 E-.15668
G1 X129.121 Y134.884 E-.10455
G1 X129.386 Y134.809 E-.10457
G1 X129.657 Y134.761 E-.10456
G1 X129.931 Y134.741 E-.10456
G1 X130.206 Y134.748 E-.10456
G1 X130.315 Y134.761 E-.04175
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I.956 J-.753 P1  F30000
G1 X98.52 Y94.393 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X98.547 Y94.396 E.0009
G3 X97.921 Y94.349 I-.547 J3.102 E.63574
G1 X98.079 Y94.349 E.00521
G1 X98.461 Y94.387 E.01274
G1 X98.614 Y94.813 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.748 Y94.843 E.00422
G3 X97.931 Y94.741 I-.748 J2.655 E.50717
G1 X98.069 Y94.741 E.00423
G3 X98.479 Y94.782 I-.069 J2.757 E.01269
G1 X98.555 Y94.799 E.00239
M204 S10000
; WIPE_START
G1 F24000
G1 X98.748 Y94.843 E-.07495
G1 X99.008 Y94.931 E-.10456
G1 X99.259 Y95.044 E-.10456
G1 X99.497 Y95.181 E-.10457
G1 X99.721 Y95.342 E-.10455
G1 X99.927 Y95.524 E-.10456
G1 X100.114 Y95.726 E-.10455
G1 X100.206 Y95.847 E-.0577
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-.042 J1.216 P1  F30000
G1 X165.092 Y98.107 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X165.089 Y98.124 E.0006
G3 X161.921 Y94.349 I-3.089 J-.625 E.4692
G1 X162.079 Y94.349 E.00521
G3 X165.136 Y97.814 I-.079 J3.151 E.17206
G1 X165.101 Y98.047 E.00783
G1 X164.705 Y98.047 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X161.931 Y94.741 I-2.705 J-.547 E.38055
G1 X162.069 Y94.741 E.00423
G3 X164.716 Y97.988 I-.069 J2.759 E.14617
M204 S10000
; WIPE_START
G1 F24000
G1 X164.637 Y98.314 E-.12731
G1 X164.543 Y98.572 E-.10456
G1 X164.424 Y98.82 E-.10456
G1 X164.28 Y99.055 E-.10456
G1 X164.114 Y99.274 E-.10456
G1 X163.927 Y99.476 E-.10456
G1 X163.721 Y99.658 E-.10456
G1 X163.709 Y99.666 E-.00533
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I-1.07 J-.58 P1  F30000
G1 X130 Y161.786 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X91.037 Y93.602 E2.60503
G1 X168.963 Y93.602 E2.58492
G1 X146.811 Y132.368 E1.48108
G1 X130.03 Y161.734 E1.12196
G1 X130 Y162.577 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X90.362 Y93.21 E2.4549
G1 X169.638 Y93.21 E2.43594
G1 X147.151 Y132.562 E1.39269
G1 X130.03 Y162.525 E1.06036
M204 S10000
; WIPE_START
G1 F24000
G1 X129.036 Y160.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.2 I1.163 J.359 P1  F30000
G1 X131.054 Y154.264 Z2.2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X131.059 Y154.262 E.00016
G2 X131.335 Y154.169 I-1.137 J-3.843 E.00969
G2 X132.485 Y153.513 I-1.615 J-4.161 E.04408
G1 X133.359 Y154.386 E.04098
G1 X132.08 Y156.624 E.08547
G1 X129.433 Y159.271 E.1242
G1 X130 Y160.264 E.03793
G1 X130.567 Y159.271 E.03793
G1 X127.92 Y156.624 E.1242
G1 X126.641 Y154.386 E.08547
G1 X127.515 Y153.513 E.04097
G2 X128.947 Y154.264 I2.535 J-3.095 E.054
G1 X134.227 Y153.568 F30000
G1 F15476.087
G1 X132.934 Y152.541 E.05477
G1 X132.205 Y153.218 E.033
G3 X127.563 Y153.013 I-2.206 J-2.713 E.16856
G1 X127.048 Y152.558 E.0228
G1 X125.737 Y153.625 E.05605
G1 X130 Y161.084 E.28499
G1 X134.274 Y153.605 E.28576
G1 X141.732 Y139.732 F30000
G1 F15476.087
G1 X101.409 Y99.409 E1.89167
G2 X101.511 Y95.803 I-3.449 J-1.903 E.12428
G1 X101.511 Y95.803 E0
G2 X101.252 Y95.34 I-1.977 J.803 E.01765
G1 X102.235 Y94.357 E.0461
G1 X104.033 Y94.357 E.05966
G1 X144.524 Y134.848 E1.89948
G1 X142.315 Y138.713 E.14768
G1 X133.907 Y147.12 E.39441
G1 X133.907 Y147.259 E.00461
G1 X136.15 Y149.502 E.1052
G1 X138.941 Y144.617 E.18662
G1 X133.907 Y139.583 E.23614
G1 X133.907 Y139.445 E.00461
G1 X152.549 Y120.803 E.87453
G1 X152.897 Y120.194 E.02327
G1 X138.367 Y105.663 E.68166
G1 X139.995 Y105.663 E.05401
G1 X139.349 Y101.671 F30000
G1 F15476.087
G1 X139.349 Y103.299 E.05401
G1 X138.651 Y103.997 E.03272
G1 X138.651 Y98.271 E.18992
G1 X139.349 Y98.969 E.03272
G1 X139.349 Y95.623 E.11097
G1 X138.201 Y96.771 E.05384
G2 X137.667 Y96.349 I-.777 J.434 E.02319
G1 X136.729 Y96.349 E.03112
G1 X134.33 Y93.95 E.11251
G1 X133.346 Y93.95 E.03265
G1 X130.947 Y96.349 E.11251
G1 X129.053 Y96.349 E.06286
G1 X126.654 Y93.95 E.11251
G1 X125.67 Y93.95 E.03265
G1 X123.271 Y96.349 E.11251
G1 X122.333 Y96.349 E.03112
G2 X121.799 Y96.771 I.243 J.856 E.02319
G1 X120.651 Y95.623 E.05384
G1 X120.651 Y98.969 E.11097
G1 X121.349 Y98.271 E.03272
G1 X121.349 Y103.997 E.18992
G1 X120.651 Y103.299 E.03272
G1 X120.651 Y101.671 E.05401
G1 X120.244 Y105.196 F30000
G1 F15476.087
G1 X120.244 Y93.95 E.37303
G1 X99.812 Y93.95 E.67778
G1 X100.99 Y95.678 E.06936
G3 X101.165 Y98.976 I-2.995 J1.812 E.11409
G1 X101.165 Y98.976 E0
G3 X97.569 Y100.975 I-3.165 J-1.46 E.14596
G1 X95.437 Y100.599 E.07182
G1 X125.129 Y152.561 E1.98526
G1 X126.693 Y152.018 E.0549
G3 X126.5 Y150.516 I11.315 J-2.218 E.05026
G1 X126.5 Y137.481 E.4324
G3 X133.489 Y137.252 I3.499 J.017 E.35588
G1 X133.5 Y150.516 E.44
G3 X133.433 Y151.184 I-3.391 J-.005 E.02229
G1 X133.307 Y152.018 E.02798
G1 X134.871 Y152.561 E.0549
G1 X164.563 Y100.599 E1.98526
G1 X162.584 Y100.948 E.06666
G3 X159.147 Y95.478 I-.584 J-3.448 E.27319
G1 X160.188 Y93.95 E.06132
G1 X139.756 Y93.95 E.67778
G1 X139.756 Y105.256 E.37502
G1 X138.244 Y105.256 E.05014
G1 X138.244 Y97.414 E.26012
G1 X137.627 Y96.773 E.02952
G1 X122.414 Y96.756 E.50464
G1 X121.756 Y97.414 E.03089
G1 X121.756 Y105.256 E.26012
G1 X120.244 Y105.256 E.05014
G1 X120.005 Y105.663 F30000
G1 F15476.087
G1 X121.633 Y105.663 E.05401
G1 X107.103 Y120.194 E.68166
G1 X107.451 Y120.803 E.02327
G1 X126.093 Y139.445 E.87453
G1 X126.093 Y139.583 E.00461
G1 X121.059 Y144.617 E.23614
G1 X123.85 Y149.502 E.18662
G1 X126.093 Y147.259 E.1052
G1 X126.093 Y147.12 E.00461
G1 X117.685 Y138.713 E.39441
G1 X115.476 Y134.848 E.14768
G1 X155.967 Y94.357 E1.89948
G1 X157.765 Y94.357 E.05966
G1 X158.748 Y95.34 E.0461
G2 X158.109 Y97.853 I3.234 J2.16 E.08768
G1 X158.109 Y97.853 E0
G2 X158.591 Y99.409 I4.85 J-.651 E.05428
G1 X118.268 Y139.732 E1.89167
G1 X103.503 Y113.895 F30000
G1 F15476.087
G1 X104.311 Y115.309 E.05401
G1 X119.837 Y99.783 E.72835
G1 X119.837 Y102.485 E.08964
G1 X111.709 Y94.357 E.38129
G1 X109.911 Y94.357 E.05966
G1 X98.729 Y105.539 E.52457
G1 X101.52 Y110.424 E.18662
G1 X117.587 Y94.357 E.75372
G1 X119.385 Y94.357 E.05966
G1 X119.837 Y94.809 E.0212
G1 X119.837 Y96.438 E.05401
G1 X123.927 Y97.163 F30000
G1 F15476.087
G1 X122.559 Y97.163 E.04539
G1 X122.375 Y97.347 E.00863
G1 X150.106 Y125.078 E1.30094
G1 X147.315 Y129.963 E.18662
G1 X122.163 Y104.811 E1.17993
G1 X122.163 Y105.133 E.01069
G1 X130.133 Y97.163 E.37391
G1 X129.867 Y97.163 E.00884
G1 X137.837 Y105.133 E.37391
G1 X137.837 Y104.811 E.01069
G1 X112.685 Y129.963 E1.17993
G1 X109.894 Y125.078 E.18662
G1 X137.625 Y97.347 E1.30094
G1 X137.441 Y97.163 E.00863
G1 X136.073 Y97.163 E.04539
G1 X140.163 Y96.438 F30000
G1 F15476.087
G1 X140.163 Y94.809 E.05401
G1 X140.615 Y94.357 E.0212
G1 X142.413 Y94.357 E.05966
G1 X158.48 Y110.424 E.75372
G1 X155.689 Y115.309 E.18662
G1 X140.163 Y99.783 E.72835
G1 X140.163 Y102.485 E.08964
G1 X148.291 Y94.357 E.38129
G1 X150.089 Y94.357 E.05966
G1 X161.271 Y105.539 E.52457
G1 X160.463 Y106.953 E.05401
G1 X163.592 Y101.478 F30000
G1 F15476.087
G1 X162.784 Y102.892 E.05401
G1 X131.694 Y133.982 E1.45849
G2 X128.306 Y133.982 I-1.694 J3.533 E.11623
G1 X97.216 Y102.892 E1.45849
G1 X96.408 Y101.478 E.05401
G1 X95.118 Y99.752 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.596589
G1 F11378.653
G1 X94.73 Y99.09 E.03464
G1 X94.867 Y98.729 E.01741
G1 X94.537 Y98.182 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X94.472 Y97.836 E.01082
G3 X94.618 Y96.44 I3.759 J-.311 E.0434
G1 X94.88 Y95.819 E.02069
G3 X96.305 Y94.413 I2.962 J1.575 E.06247
G1 X96.231 Y94.282 E.00462
G3 X96.364 Y93.994 I.608 J.108 E.00986
G1 X91.713 Y93.994 E.14292
G1 X94.244 Y98.423 E.15675
G1 X94.378 Y98.196 E.00811
G1 X94.477 Y98.187 E.00307
G1 X94.083 Y97.382 F30000
G1 F15000
G3 X94.533 Y95.673 I4.351 J.231 E.05467
G3 X95.642 Y94.371 I3.778 J2.096 E.0529
G1 X92.363 Y94.371 E.10075
G1 X94.053 Y97.33 E.1047
G1 X93.883 Y96.272 F30000
G1 F15000
G1 X94.185 Y95.527 E.02471
G1 X94.533 Y94.962 E.02037
G1 X94.707 Y94.748 E.00848
G1 X93.013 Y94.748 E.05207
G1 X93.853 Y96.22 E.05208
G1 X93.852 Y95.155 F30000
; LINE_WIDTH: 0.59987
G1 F11311.608
G2 X93.857 Y95.267 I-.031 J.058 E.01245
G1 X96.888 Y94.328 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.443473
G1 F15000
G1 X97.042 Y94.075 E.00964
; LINE_WIDTH: 0.480656
G1 F14392.261
G1 X97.066 Y94.037 E.00162
G1 X97.2 Y94.02 E.00484
; LINE_WIDTH: 0.438331
G1 F15000
G1 X97.378 Y94.002 E.00576
; LINE_WIDTH: 0.410914
G1 X97.555 Y93.989 E.00533
; LINE_WIDTH: 0.387197
G1 X98.259 Y93.98 E.01975
; LINE_WIDTH: 0.420463
G1 X98.612 Y94.001 E.01086
; LINE_WIDTH: 0.467963
G1 F14822.056
G1 X98.789 Y94.019 E.00617
; LINE_WIDTH: 0.499591
G1 F13795.486
G1 X98.934 Y94.037 E.00544
G1 X98.946 Y94.056 E.00084
; LINE_WIDTH: 0.443453
G1 F15000
G1 X98.958 Y94.075 E.00074
; LINE_WIDTH: 0.421768
G1 X99.112 Y94.328 E.00911
G1 X160.888 Y94.328 F30000
; LINE_WIDTH: 0.443473
G1 F15000
G1 X161.042 Y94.075 E.00964
; LINE_WIDTH: 0.480656
G1 F14392.261
G1 X161.066 Y94.037 E.00162
G1 X161.2 Y94.02 E.00484
; LINE_WIDTH: 0.43833
G1 F15000
G1 X161.378 Y94.002 E.00576
; LINE_WIDTH: 0.410916
G1 X161.555 Y93.989 E.00533
; LINE_WIDTH: 0.387197
G1 X162.259 Y93.98 E.01975
; LINE_WIDTH: 0.420463
G1 X162.612 Y94.001 E.01086
; LINE_WIDTH: 0.467962
G1 F14822.061
G1 X162.789 Y94.019 E.00617
; LINE_WIDTH: 0.499593
G1 F13795.449
G1 X162.934 Y94.037 E.00544
G1 X162.946 Y94.056 E.00084
; LINE_WIDTH: 0.443463
G1 F15000
G1 X162.958 Y94.075 E.00074
; LINE_WIDTH: 0.421772
G1 X163.112 Y94.328 E.00911
G1 X165.458 Y98.185 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X165.619 Y98.198 E.00495
G1 X165.752 Y98.43 E.00821
G1 X168.287 Y93.994 E.15697
G2 X163.629 Y93.996 I-2.216 J289.947 E.14314
G1 X163.76 Y94.284 E.00973
G1 X163.698 Y94.397 E.00395
G1 X164.195 Y94.718 E.01818
G1 X164.703 Y95.208 E.02168
G1 X165.103 Y95.789 E.02168
G1 X165.381 Y96.438 E.02168
G1 X165.524 Y97.128 E.02168
G1 X165.528 Y97.834 E.02168
G1 X165.47 Y98.126 E.00914
G1 X165.905 Y97.402 F30000
G1 F15000
G1 X167.637 Y94.371 E.10727
G1 X164.353 Y94.371 E.1009
G1 X164.966 Y94.938 E.02564
G1 X165.415 Y95.576 E.02398
G1 X165.728 Y96.291 E.02398
G1 X165.894 Y97.054 E.02398
G1 X165.903 Y97.342 E.00888
G1 X166.116 Y96.274 F30000
G1 F15000
G1 X166.987 Y94.748 E.05399
G1 X165.297 Y94.748 E.05195
G1 X165.726 Y95.364 E.02307
G1 X166.098 Y96.217 E.02858
G1 X166.217 Y95.155 F30000
; LINE_WIDTH: 0.59996
G1 F11309.781
G2 X166.222 Y95.267 I-.031 J.058 E.01246
G1 X165.133 Y98.729 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.585719
G1 F11606.507
G1 X165.27 Y99.09 E.01707
G1 X164.882 Y99.752 E.03396
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X165.27 Y99.09 E-.50576
G1 X165.133 Y98.729 E-.25424
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/88
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
G3 Z2.2 I-.852 J-.869 P1  F30000
G1 X128.314 Y134.839 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.705 Y134.629 E.01472
G3 X129.921 Y134.349 I1.305 J2.88 E.04169
G3 X133.152 Y137.493 I.07 J3.16 E.16647
G1 X133.152 Y150.513 E.43192
G3 X126.848 Y150.507 I-3.152 J-.017 E.32755
G1 X126.848 Y137.493 E.43173
G3 X128.264 Y134.873 I3.162 J.017 E.10285
G1 X128.501 Y135.182 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.504 Y135.184 E.00011
G3 X129.931 Y134.741 I1.504 J2.324 E.04649
G3 X132.76 Y137.497 I.061 J2.767 E.13514
M73 P39 R16
G1 X132.76 Y150.505 E.39968
G3 X127.24 Y150.503 I-2.76 J-.008 E.266
G1 X127.24 Y137.497 E.39961
G3 X128.281 Y135.345 I2.769 J.011 E.07598
G1 X128.453 Y135.218 E.00656
M204 S10000
; WIPE_START
G1 F24000
G1 X128.504 Y135.184 E-.02335
G1 X128.865 Y134.984 E-.15667
G1 X129.121 Y134.884 E-.10456
G1 X129.386 Y134.809 E-.10456
G1 X129.657 Y134.761 E-.10456
G1 X129.931 Y134.741 E-.10456
G1 X130.206 Y134.748 E-.10456
G1 X130.356 Y134.766 E-.05718
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I.957 J-.751 P1  F30000
G1 X98.684 Y94.424 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X98.701 Y94.427 E.0006
G3 X97.921 Y94.349 I-.701 J3.071 E.63053
G1 X98.079 Y94.349 E.00521
G3 X98.392 Y94.372 I-.079 J3.149 E.01043
G1 X98.624 Y94.413 E.00783
G1 X98.597 Y94.806 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.614 Y94.809 E.00054
G3 X97.931 Y94.741 I-.614 J2.689 E.51139
G1 X98.069 Y94.741 E.00423
G3 X98.343 Y94.761 I-.069 J2.757 E.00846
G1 X98.538 Y94.796 E.00607
M204 S10000
; WIPE_START
G1 F24000
G1 X98.614 Y94.809 E-.02945
G1 X98.879 Y94.884 E-.10456
G1 X99.135 Y94.984 E-.10456
G1 X99.38 Y95.11 E-.10456
G1 X99.611 Y95.259 E-.10456
G1 X99.826 Y95.431 E-.10456
G1 X100.023 Y95.623 E-.10456
G1 X100.198 Y95.831 E-.10319
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-.043 J1.216 P1  F30000
G1 X165.085 Y98.142 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X165.012 Y98.429 E.00982
G3 X161.921 Y94.349 I-3.012 J-.929 E.45878
G1 X162.079 Y94.349 E.00521
G3 X165.097 Y98.083 I-.079 J3.151 E.1811
G1 X164.705 Y98.047 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X161.931 Y94.741 I-2.705 J-.547 E.38055
G1 X162.069 Y94.741 E.00423
G3 X164.716 Y97.988 I-.069 J2.759 E.14617
M204 S10000
; WIPE_START
G1 F24000
G1 X164.637 Y98.314 E-.12731
G1 X164.543 Y98.572 E-.10456
G1 X164.424 Y98.82 E-.10456
G1 X164.28 Y99.055 E-.10456
G1 X164.114 Y99.274 E-.10456
G1 X163.927 Y99.476 E-.10456
G1 X163.721 Y99.658 E-.10456
G1 X163.709 Y99.666 E-.00533
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I-1.07 J-.58 P1  F30000
G1 X130 Y161.786 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X91.037 Y93.602 E2.60503
G1 X168.963 Y93.602 E2.58492
G1 X130.03 Y161.734 E2.60304
G1 X130 Y162.577 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X90.362 Y93.21 E2.4549
G1 X169.638 Y93.21 E2.43594
G1 X144.484 Y137.229 E1.55784
G1 X130.03 Y162.525 E.89521
M204 S10000
; WIPE_START
G1 F24000
G1 X129.036 Y160.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.4 I1.163 J.359 P1  F30000
G1 X131.054 Y154.264 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X131.171 Y154.225 E.00409
G2 X132.485 Y153.513 I-1.213 J-3.809 E.04987
G1 X133.359 Y154.386 E.04098
G1 X132.08 Y156.624 E.08547
G1 X129.433 Y159.271 E.1242
G1 X130 Y160.264 E.03793
G1 X130.567 Y159.271 E.03793
G1 X127.92 Y156.624 E.1242
G1 X126.641 Y154.386 E.08547
G1 X127.515 Y153.513 E.04097
G2 X128.947 Y154.264 I2.521 J-3.068 E.054
G1 X134.227 Y153.568 F30000
G1 F15476.087
G1 X132.934 Y152.541 E.05477
G1 X132.42 Y153.018 E.02325
G3 X127.563 Y153.013 I-2.426 J-2.512 E.17816
G1 X127.048 Y152.558 E.0228
G1 X125.737 Y153.625 E.05605
G1 X130 Y161.085 E.28499
G1 X134.274 Y153.605 E.28576
G1 X141.732 Y139.732 F30000
G1 F15476.087
G1 X101.409 Y99.409 E1.89167
G2 X101.891 Y97.847 I-3.458 J-1.924 E.05461
G1 X101.891 Y97.847 E0
G2 X101.252 Y95.34 I-4.081 J-.294 E.08731
G1 X102.235 Y94.357 E.0461
G1 X104.033 Y94.357 E.05966
G1 X144.524 Y134.848 E1.89948
G1 X142.315 Y138.713 E.14768
G1 X133.907 Y147.12 E.39441
G1 X133.907 Y147.259 E.00461
G1 X136.15 Y149.502 E.1052
G1 X138.941 Y144.617 E.18662
G1 X133.907 Y139.583 E.23614
G1 X133.907 Y139.445 E.00461
M73 P39 R15
G1 X152.549 Y120.802 E.87454
G1 X152.897 Y120.194 E.02327
G1 X138.367 Y105.663 E.68166
G1 X139.995 Y105.663 E.05401
G1 X139.349 Y101.671 F30000
G1 F15476.087
G1 X139.349 Y103.299 E.05401
G1 X138.651 Y103.997 E.03272
G1 X138.651 Y98.271 E.18992
G1 X139.349 Y98.969 E.03272
G1 X139.349 Y95.623 E.11097
G1 X138.201 Y96.771 E.05384
G2 X137.667 Y96.349 I-.777 J.434 E.02319
G1 X136.729 Y96.349 E.03112
G1 X134.33 Y93.95 E.11251
G1 X133.346 Y93.95 E.03265
G1 X130.947 Y96.349 E.11251
G1 X129.053 Y96.349 E.06286
G1 X126.654 Y93.95 E.11251
G1 X125.67 Y93.95 E.03265
G1 X123.271 Y96.349 E.11251
G1 X122.333 Y96.349 E.03112
G2 X121.799 Y96.771 I.243 J.856 E.02319
G1 X120.651 Y95.623 E.05384
G1 X120.651 Y98.969 E.11097
G1 X121.349 Y98.271 E.03272
G1 X121.349 Y103.997 E.18992
G1 X120.651 Y103.299 E.03272
G1 X120.651 Y101.671 E.05401
G1 X120.244 Y105.196 F30000
G1 F15476.087
G1 X120.244 Y93.95 E.37303
G1 X99.812 Y93.95 E.67778
G1 X100.99 Y95.678 E.06936
G3 X101.485 Y97.829 I-2.987 J1.82 E.07449
G1 X101.485 Y97.829 E0
G3 X97.569 Y100.975 I-3.489 J-.333 E.18574
G1 X95.437 Y100.599 E.07182
G1 X125.129 Y152.561 E1.98526
G1 X126.693 Y152.018 E.0549
G3 X126.5 Y150.516 I7.45 J-1.721 E.0503
G1 X126.5 Y137.484 E.43231
G3 X133.5 Y137.484 I3.5 J.015 E.36376
G1 X133.5 Y150.521 E.43247
G3 X133.434 Y151.175 I-3.448 J-.017 E.02185
G1 X133.307 Y152.018 E.02826
G1 X134.871 Y152.561 E.0549
G1 X164.563 Y100.599 E1.98526
G1 X162.683 Y100.93 E.06333
G3 X159.204 Y95.394 I-.681 J-3.434 E.2799
G1 X160.188 Y93.95 E.05798
G1 X139.756 Y93.95 E.67778
G1 X139.756 Y105.256 E.37502
G1 X138.244 Y105.256 E.05014
G1 X138.244 Y97.414 E.26012
G1 X137.627 Y96.773 E.02952
G1 X122.414 Y96.756 E.50464
G1 X121.756 Y97.414 E.03089
G1 X121.756 Y105.256 E.26012
G1 X120.244 Y105.256 E.05014
G1 X120.005 Y105.663 F30000
G1 F15476.087
G1 X121.633 Y105.663 E.05401
G1 X107.103 Y120.194 E.68166
G1 X107.451 Y120.803 E.02327
G1 X126.093 Y139.444 E.87453
G1 X126.093 Y139.583 E.00461
G1 X121.059 Y144.617 E.23614
G1 X123.85 Y149.502 E.18662
G1 X126.093 Y147.259 E.1052
G1 X126.093 Y147.12 E.00461
G1 X117.685 Y138.713 E.39441
G1 X115.476 Y134.848 E.14768
G1 X155.967 Y94.357 E1.89948
G1 X157.765 Y94.357 E.05966
G1 X158.748 Y95.34 E.0461
G2 X158.591 Y99.409 I3.299 J2.164 E.14191
G1 X118.268 Y139.732 E1.89167
G1 X103.503 Y113.895 F30000
G1 F15476.087
G1 X104.311 Y115.309 E.05401
G1 X119.837 Y99.783 E.72835
G1 X119.837 Y102.485 E.08964
G1 X111.709 Y94.357 E.38129
G1 X109.911 Y94.357 E.05966
G1 X98.729 Y105.539 E.52457
G1 X101.52 Y110.424 E.18662
G1 X117.587 Y94.357 E.75372
G1 X119.385 Y94.357 E.05966
G1 X119.837 Y94.809 E.0212
G1 X119.837 Y96.438 E.05401
G1 X123.927 Y97.163 F30000
G1 F15476.087
G1 X122.559 Y97.163 E.04539
G1 X122.375 Y97.347 E.00863
G1 X150.106 Y125.078 E1.30094
G1 X147.315 Y129.963 E.18662
G1 X122.163 Y104.811 E1.17993
G1 X122.163 Y105.133 E.01069
G1 X130.133 Y97.163 E.37391
G1 X129.867 Y97.163 E.00884
G1 X137.837 Y105.133 E.37391
G1 X137.837 Y104.811 E.01069
G1 X112.685 Y129.963 E1.17993
G1 X109.894 Y125.078 E.18662
G1 X137.625 Y97.347 E1.30094
G1 X137.441 Y97.163 E.00863
G1 X136.073 Y97.163 E.04539
G1 X140.163 Y96.438 F30000
G1 F15476.087
G1 X140.163 Y94.809 E.05401
G1 X140.615 Y94.357 E.0212
G1 X142.413 Y94.357 E.05966
G1 X158.48 Y110.424 E.75372
G1 X155.689 Y115.309 E.18662
G1 X140.163 Y99.783 E.72835
G1 X140.163 Y102.485 E.08964
G1 X148.291 Y94.357 E.38129
G1 X150.089 Y94.357 E.05966
G1 X161.271 Y105.539 E.52457
G1 X160.463 Y106.953 E.05401
G1 X163.592 Y101.478 F30000
G1 F15476.087
G1 X162.784 Y102.892 E.05401
G1 X131.694 Y133.982 E1.45849
G2 X128.306 Y133.982 I-1.694 J3.533 E.11623
G1 X97.216 Y102.892 E1.45849
G1 X96.408 Y101.478 E.05401
G1 X95.118 Y99.752 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.59658
G1 F11378.825
G1 X94.73 Y99.09 E.03464
G1 X94.867 Y98.729 E.01741
G1 X94.537 Y98.182 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X94.472 Y97.836 E.01082
G3 X94.618 Y96.44 I3.759 J-.311 E.0434
G1 X94.88 Y95.819 E.02069
G3 X96.305 Y94.413 I2.962 J1.575 E.06247
G1 X96.231 Y94.282 E.00462
G3 X96.364 Y93.994 I.609 J.108 E.00986
G1 X91.713 Y93.994 E.14292
G1 X94.244 Y98.423 E.15675
G1 X94.378 Y98.196 E.00811
G1 X94.477 Y98.187 E.00307
G1 X94.083 Y97.382 F30000
G1 F15000
G3 X94.533 Y95.673 I4.351 J.231 E.05467
G3 X95.642 Y94.371 I3.778 J2.096 E.0529
G1 X92.363 Y94.371 E.10075
G1 X94.053 Y97.33 E.1047
G1 X93.883 Y96.272 F30000
G1 F15000
G1 X94.185 Y95.526 E.02471
G1 X94.533 Y94.962 E.02037
G1 X94.707 Y94.748 E.00848
G1 X93.013 Y94.748 E.05207
G1 X93.853 Y96.22 E.05208
G1 X93.852 Y95.155 F30000
; LINE_WIDTH: 0.59987
G1 F11311.608
G2 X93.857 Y95.267 I-.031 J.058 E.01245
G1 X96.888 Y94.328 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.443465
G1 F15000
G1 X97.042 Y94.075 E.00964
; LINE_WIDTH: 0.480656
G1 F14392.249
G1 X97.066 Y94.037 E.00162
G1 X97.2 Y94.02 E.00484
; LINE_WIDTH: 0.438331
G1 F15000
G1 X97.378 Y94.002 E.00576
; LINE_WIDTH: 0.410914
G1 X97.555 Y93.989 E.00533
; LINE_WIDTH: 0.387197
G1 X98.259 Y93.98 E.01975
; LINE_WIDTH: 0.420464
G1 X98.612 Y94.001 E.01086
; LINE_WIDTH: 0.467959
G1 F14822.188
G1 X98.789 Y94.019 E.00616
; LINE_WIDTH: 0.499592
G1 F13795.461
G1 X98.934 Y94.037 E.00544
G1 X98.946 Y94.056 E.00084
; LINE_WIDTH: 0.443458
G1 F15000
G1 X98.958 Y94.075 E.00074
; LINE_WIDTH: 0.421764
G1 X99.112 Y94.328 E.00911
G1 X160.888 Y94.328 F30000
; LINE_WIDTH: 0.443467
G1 F15000
G1 X161.042 Y94.075 E.00964
; LINE_WIDTH: 0.48066
G1 F14392.112
G1 X161.066 Y94.037 E.00162
G1 X161.2 Y94.02 E.00483
; LINE_WIDTH: 0.438327
G1 F15000
G1 X161.378 Y94.002 E.00576
; LINE_WIDTH: 0.410914
G1 X161.555 Y93.989 E.00533
; LINE_WIDTH: 0.387197
G1 X162.259 Y93.98 E.01975
; LINE_WIDTH: 0.420463
G1 X162.612 Y94.001 E.01086
; LINE_WIDTH: 0.467963
G1 F14822.06
G1 X162.789 Y94.019 E.00617
; LINE_WIDTH: 0.499591
G1 F13795.506
G1 X162.934 Y94.037 E.00544
G1 X162.946 Y94.056 E.00084
; LINE_WIDTH: 0.443456
G1 F15000
G1 X162.958 Y94.075 E.00074
; LINE_WIDTH: 0.421769
G1 X163.112 Y94.328 E.00911
G1 X165.458 Y98.185 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X165.619 Y98.198 E.00495
G1 X165.752 Y98.43 E.00821
G1 X168.287 Y93.994 E.15697
G2 X163.629 Y93.996 I-2.216 J290.168 E.14314
G1 X163.76 Y94.284 E.00973
G1 X163.698 Y94.397 E.00395
G1 X164.195 Y94.718 E.01818
G1 X164.703 Y95.208 E.02168
G1 X165.103 Y95.789 E.02168
G1 X165.381 Y96.438 E.02168
G1 X165.524 Y97.128 E.02168
G1 X165.528 Y97.834 E.02168
G1 X165.47 Y98.126 E.00914
G1 X165.905 Y97.402 F30000
G1 F15000
G1 X167.637 Y94.371 E.10727
G1 X164.353 Y94.371 E.1009
G1 X164.966 Y94.938 E.02564
G1 X165.415 Y95.576 E.02398
G1 X165.728 Y96.291 E.02398
G1 X165.894 Y97.054 E.02398
G1 X165.903 Y97.342 E.00888
G1 X166.116 Y96.274 F30000
G1 F15000
G1 X166.987 Y94.748 E.05399
G1 X165.297 Y94.748 E.05195
G1 X165.726 Y95.364 E.02307
G1 X166.098 Y96.217 E.02858
G1 X166.217 Y95.155 F30000
; LINE_WIDTH: 0.59996
G1 F11309.781
G2 X166.222 Y95.267 I-.031 J.058 E.01246
G1 X165.133 Y98.729 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.585719
G1 F11606.505
G1 X165.27 Y99.09 E.01707
G1 X164.882 Y99.752 E.03396
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X165.27 Y99.09 E-.50576
G1 X165.133 Y98.729 E-.25424
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/88
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
G3 Z2.4 I-.852 J-.869 P1  F30000
G1 X128.314 Y134.839 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.704 Y134.627 E.01473
G3 X129.921 Y134.349 I1.299 J2.875 E.04171
G3 X133.152 Y137.493 I.07 J3.16 E.16647
G1 X133.152 Y150.507 E.43173
G3 X126.848 Y150.507 I-3.152 J-.008 E.32794
G1 X126.848 Y137.493 E.43173
G3 X128.263 Y134.871 I3.154 J.01 E.10292
G1 X128.536 Y135.163 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.865 Y134.985 E.01149
G3 X129.931 Y134.741 I1.137 J2.517 E.03383
G3 X132.76 Y137.497 I.061 J2.767 E.13514
G1 X132.76 Y150.503 E.39961
G3 X127.24 Y150.503 I-2.76 J-.003 E.26622
G1 X127.24 Y137.497 E.39961
G3 X128.485 Y135.194 I2.762 J.005 E.08382
M204 S10000
; WIPE_START
G1 F24000
G1 X128.865 Y134.985 E-.16488
G1 X129.121 Y134.884 E-.10454
G1 X129.386 Y134.809 E-.10457
G1 X129.657 Y134.761 E-.10456
G1 X129.931 Y134.741 E-.10456
G1 X130.206 Y134.748 E-.10456
G1 X130.395 Y134.771 E-.07233
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I.955 J-.754 P1  F30000
G1 X98.52 Y94.393 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X98.547 Y94.396 E.0009
G3 X97.921 Y94.349 I-.547 J3.104 E.63605
G1 X98.079 Y94.349 E.00521
G1 X98.461 Y94.387 E.01274
G1 X98.578 Y94.804 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.748 Y94.843 E.00536
G3 X97.931 Y94.741 I-.748 J2.656 E.50741
G1 X98.069 Y94.741 E.00423
G3 X98.479 Y94.782 I-.069 J2.759 E.01269
G1 X98.519 Y94.791 E.00125
M204 S10000
; WIPE_START
G1 F24000
G1 X98.748 Y94.843 E-.08904
G1 X99.008 Y94.931 E-.10456
G1 X99.259 Y95.044 E-.10456
G1 X99.497 Y95.181 E-.10456
G1 X99.721 Y95.342 E-.10456
G1 X99.927 Y95.524 E-.10456
G1 X100.114 Y95.726 E-.10456
G1 X100.184 Y95.817 E-.0436
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-.044 J1.216 P1  F30000
G1 X165.082 Y98.151 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X164.962 Y98.578 E.01472
G3 X161.921 Y94.349 I-2.962 J-1.078 E.45356
G1 X162.079 Y94.349 E.00521
G3 X165.096 Y98.092 I-.079 J3.151 E.1814
G1 X164.705 Y98.047 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X164.637 Y98.313 E.00845
G3 X161.931 Y94.741 I-2.637 J-.814 E.37209
G1 X162.069 Y94.741 E.00423
G3 X164.716 Y97.988 I-.069 J2.759 E.14618
M204 S10000
; WIPE_START
G1 F24000
G1 X164.637 Y98.313 E-.1271
G1 X164.543 Y98.572 E-.10455
G1 X164.424 Y98.82 E-.10456
G1 X164.28 Y99.055 E-.10456
G1 X164.114 Y99.274 E-.10456
G1 X163.927 Y99.476 E-.10456
G1 X163.721 Y99.658 E-.10456
G1 X163.709 Y99.666 E-.00555
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I-1.07 J-.58 P1  F30000
G1 X130 Y161.786 Z2.6
G1 Z2.2
M73 P40 R15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X91.037 Y93.602 E2.60503
G1 X168.963 Y93.602 E2.58492
G1 X141.477 Y141.701 E1.83766
G1 X130.03 Y161.734 E.76538
G1 X130 Y162.577 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X90.362 Y93.21 E2.4549
G1 X169.638 Y93.21 E2.43594
G1 X141.818 Y141.896 E1.723
G1 X130.03 Y162.525 E.73006
M204 S10000
; WIPE_START
G1 F24000
G1 X129.036 Y160.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.6 I1.163 J.359 P1  F30000
G1 X131.053 Y154.264 Z2.6
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X132.485 Y153.513 I-1.208 J-4.044 E.05396
G1 X133.359 Y154.386 E.04098
G1 X132.08 Y156.624 E.08547
G1 X129.433 Y159.271 E.1242
G1 X130 Y160.264 E.03793
G1 X130.567 Y159.271 E.03793
G1 X127.92 Y156.624 E.1242
G1 X126.641 Y154.386 E.08547
G1 X127.515 Y153.513 E.04097
G2 X128.947 Y154.264 I2.658 J-3.331 E.05395
G1 X134.227 Y153.568 F30000
G1 F15476.087
G1 X132.934 Y152.541 E.05477
G1 X132.204 Y153.218 E.03302
G3 X127.563 Y153.013 I-2.204 J-2.727 E.16843
G1 X127.048 Y152.558 E.0228
G1 X125.737 Y153.625 E.05605
G1 X130 Y161.085 E.28499
G1 X134.274 Y153.605 E.28576
G1 X141.732 Y139.732 F30000
G1 F15476.087
G1 X101.409 Y99.409 E1.89167
G2 X101.252 Y95.34 I-3.413 J-1.906 E.14205
G1 X102.235 Y94.357 E.0461
G1 X104.033 Y94.357 E.05966
G1 X144.524 Y134.848 E1.89948
G1 X142.315 Y138.713 E.14768
G1 X133.907 Y147.12 E.39441
G1 X133.907 Y147.259 E.00461
G1 X136.15 Y149.502 E.1052
G1 X138.941 Y144.617 E.18662
G1 X133.907 Y139.583 E.23614
G1 X133.907 Y139.445 E.00461
G1 X152.549 Y120.803 E.87453
G1 X152.897 Y120.194 E.02327
G1 X138.367 Y105.663 E.68166
G1 X139.995 Y105.663 E.05401
G1 X139.349 Y101.671 F30000
G1 F15476.087
G1 X139.349 Y103.299 E.05401
G1 X138.651 Y103.997 E.03272
G1 X138.651 Y98.271 E.18992
G1 X139.349 Y98.969 E.03272
G1 X139.349 Y95.623 E.11097
G1 X138.201 Y96.771 E.05384
G2 X137.667 Y96.349 I-.777 J.434 E.02319
G1 X136.729 Y96.349 E.03112
G1 X134.33 Y93.95 E.11251
G1 X133.346 Y93.95 E.03265
G1 X130.947 Y96.349 E.11251
G1 X129.053 Y96.349 E.06286
G1 X126.654 Y93.95 E.11251
G1 X125.67 Y93.95 E.03265
G1 X123.271 Y96.349 E.11251
G1 X122.333 Y96.349 E.03112
G2 X121.799 Y96.771 I.243 J.856 E.02319
G1 X120.651 Y95.623 E.05384
G1 X120.651 Y98.969 E.11097
G1 X121.349 Y98.271 E.03272
G1 X121.349 Y103.997 E.18992
G1 X120.651 Y103.299 E.03272
G1 X120.651 Y101.671 E.05401
G1 X120.244 Y105.196 F30000
G1 F15476.087
G1 X120.244 Y93.95 E.37303
G1 X99.812 Y93.95 E.67778
G1 X100.913 Y95.565 E.06483
G3 X97.479 Y100.959 I-2.914 J1.935 E.26759
G3 X95.437 Y100.599 I8.014 J-51.424 E.06879
G1 X125.129 Y152.561 E1.98526
G1 X126.693 Y152.018 E.0549
G3 X126.5 Y150.516 I7.454 J-1.721 E.0503
G1 X126.5 Y137.484 E.43231
G3 X131.049 Y134.164 I3.503 J.023 E.21703
G1 X131.049 Y134.164 E0
G3 X133.497 Y137.42 I-1.102 J3.377 E.14392
G1 X133.5 Y150.516 E.43441
G3 X133.433 Y151.184 I-3.39 J-.005 E.02229
G1 X133.307 Y152.018 E.02798
G1 X134.871 Y152.561 E.0549
G1 X164.563 Y100.599 E1.98526
G1 X162.665 Y100.933 E.06396
G3 X158.965 Y95.763 I-.664 J-3.434 E.26468
G1 X160.188 Y93.95 E.07254
G1 X139.756 Y93.95 E.67778
G1 X139.756 Y105.256 E.37502
G1 X138.244 Y105.256 E.05014
G1 X138.244 Y97.414 E.26012
G1 X137.627 Y96.773 E.02952
G1 X122.414 Y96.756 E.50464
G1 X121.756 Y97.414 E.03089
G1 X121.756 Y105.256 E.26012
G1 X120.244 Y105.256 E.05014
G1 X120.005 Y105.663 F30000
G1 F15476.087
G1 X121.633 Y105.663 E.05401
G1 X107.103 Y120.194 E.68166
G1 X107.451 Y120.803 E.02327
G1 X126.093 Y139.445 E.87453
G1 X126.093 Y139.583 E.00461
G1 X121.059 Y144.617 E.23614
G1 X123.85 Y149.502 E.18662
G1 X126.093 Y147.259 E.1052
G1 X126.093 Y147.12 E.00461
G1 X117.685 Y138.713 E.39441
G1 X115.476 Y134.848 E.14768
G1 X155.967 Y94.357 E1.89948
G1 X157.765 Y94.357 E.05966
G1 X158.748 Y95.34 E.0461
G2 X158.591 Y99.409 I3.31 J2.165 E.14187
G1 X118.268 Y139.732 E1.89167
G1 X103.503 Y113.895 F30000
G1 F15476.087
G1 X104.311 Y115.309 E.05401
G1 X119.837 Y99.783 E.72835
G1 X119.837 Y102.485 E.08964
G1 X111.709 Y94.357 E.38129
G1 X109.911 Y94.357 E.05966
G1 X98.729 Y105.539 E.52457
G1 X101.52 Y110.424 E.18662
G1 X117.587 Y94.357 E.75372
G1 X119.385 Y94.357 E.05966
G1 X119.837 Y94.809 E.0212
G1 X119.837 Y96.438 E.05401
G1 X123.927 Y97.163 F30000
G1 F15476.087
G1 X122.559 Y97.163 E.04539
G1 X122.375 Y97.347 E.00863
G1 X150.106 Y125.078 E1.30094
G1 X147.315 Y129.963 E.18662
G1 X122.163 Y104.811 E1.17993
G1 X122.163 Y105.133 E.01069
G1 X130.133 Y97.163 E.37391
G1 X129.867 Y97.163 E.00884
G1 X137.837 Y105.133 E.37391
G1 X137.837 Y104.811 E.01069
G1 X112.685 Y129.963 E1.17993
G1 X109.894 Y125.078 E.18662
G1 X137.625 Y97.347 E1.30094
G1 X137.441 Y97.163 E.00863
G1 X136.073 Y97.163 E.04539
G1 X140.163 Y96.438 F30000
G1 F15476.087
G1 X140.163 Y94.809 E.05401
G1 X140.615 Y94.357 E.0212
G1 X142.413 Y94.357 E.05966
G1 X158.48 Y110.424 E.75372
G1 X155.689 Y115.309 E.18662
G1 X140.163 Y99.783 E.72835
G1 X140.163 Y102.485 E.08964
G1 X148.291 Y94.357 E.38129
G1 X150.089 Y94.357 E.05966
G1 X161.271 Y105.539 E.52457
G1 X160.463 Y106.953 E.05401
G1 X163.592 Y101.478 F30000
G1 F15476.087
G1 X162.784 Y102.892 E.05401
G1 X131.694 Y133.982 E1.45849
G2 X128.306 Y133.982 I-1.694 J3.498 E.1163
G1 X97.216 Y102.892 E1.45849
G1 X96.408 Y101.478 E.05401
G1 X95.118 Y99.752 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.59659
G1 F11378.629
G1 X94.73 Y99.09 E.03464
G1 X94.867 Y98.729 E.01741
G1 X94.537 Y98.182 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X94.472 Y97.836 E.01082
G3 X94.618 Y96.44 I3.759 J-.311 E.0434
G1 X94.88 Y95.819 E.02069
G3 X96.305 Y94.413 I2.962 J1.575 E.06247
G1 X96.231 Y94.282 E.00462
G3 X96.364 Y93.994 I.609 J.108 E.00986
G1 X91.713 Y93.994 E.14292
G1 X94.244 Y98.423 E.15675
G1 X94.378 Y98.196 E.00811
G1 X94.477 Y98.187 E.00307
G1 X94.083 Y97.382 F30000
G1 F15000
G3 X94.533 Y95.673 I4.351 J.231 E.05467
G3 X95.642 Y94.371 I3.778 J2.096 E.0529
G1 X92.363 Y94.371 E.10075
G1 X94.053 Y97.33 E.1047
G1 X93.883 Y96.272 F30000
G1 F15000
G1 X94.185 Y95.526 E.02471
G1 X94.533 Y94.962 E.02037
G1 X94.707 Y94.748 E.00848
G1 X93.013 Y94.748 E.05207
G1 X93.853 Y96.22 E.05208
G1 X93.852 Y95.155 F30000
; LINE_WIDTH: 0.59987
G1 F11311.608
G2 X93.857 Y95.267 I-.031 J.058 E.01245
G1 X96.888 Y94.328 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.443465
G1 F15000
G1 X97.042 Y94.075 E.00964
; LINE_WIDTH: 0.480656
G1 F14392.243
G1 X97.066 Y94.037 E.00162
G1 X97.2 Y94.02 E.00484
; LINE_WIDTH: 0.438329
G1 F15000
G1 X97.378 Y94.002 E.00576
; LINE_WIDTH: 0.410916
G1 X97.555 Y93.989 E.00533
; LINE_WIDTH: 0.387197
G1 X98.259 Y93.98 E.01975
; LINE_WIDTH: 0.420464
G1 X98.612 Y94.001 E.01086
; LINE_WIDTH: 0.467961
G1 F14822.12
G1 X98.789 Y94.019 E.00616
; LINE_WIDTH: 0.499589
G1 F13795.552
G1 X98.934 Y94.037 E.00544
G1 X98.946 Y94.056 E.00084
; LINE_WIDTH: 0.443432
G1 F15000
G1 X98.958 Y94.076 E.00074
; LINE_WIDTH: 0.42175
G1 X99.112 Y94.328 E.00911
G1 X160.888 Y94.328 F30000
; LINE_WIDTH: 0.443465
G1 F15000
G1 X161.042 Y94.075 E.00964
; LINE_WIDTH: 0.480656
G1 F14392.243
G1 X161.066 Y94.037 E.00162
G1 X161.2 Y94.02 E.00484
; LINE_WIDTH: 0.438329
G1 F15000
G1 X161.378 Y94.002 E.00576
; LINE_WIDTH: 0.410916
G1 X161.555 Y93.989 E.00533
; LINE_WIDTH: 0.387197
G1 X162.259 Y93.98 E.01975
; LINE_WIDTH: 0.420464
G1 X162.612 Y94.001 E.01086
; LINE_WIDTH: 0.467963
G1 F14822.051
G1 X162.789 Y94.019 E.00617
; LINE_WIDTH: 0.49959
G1 F13795.546
G1 X162.934 Y94.037 E.00544
G1 X162.946 Y94.056 E.00084
; LINE_WIDTH: 0.443443
G1 F15000
G1 X162.958 Y94.075 E.00074
; LINE_WIDTH: 0.421756
G1 X163.112 Y94.328 E.00911
G1 X165.458 Y98.185 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X165.619 Y98.198 E.00495
G1 X165.752 Y98.43 E.00821
G1 X168.287 Y93.994 E.15697
G2 X163.629 Y93.996 I-2.216 J285.339 E.14314
G1 X163.76 Y94.284 E.00973
G1 X163.698 Y94.397 E.00395
G1 X164.195 Y94.718 E.01818
G1 X164.703 Y95.208 E.02168
G1 X165.103 Y95.789 E.02168
G1 X165.381 Y96.438 E.02168
G1 X165.524 Y97.128 E.02168
G1 X165.528 Y97.834 E.02168
G1 X165.47 Y98.126 E.00914
G1 X165.905 Y97.402 F30000
G1 F15000
G1 X167.637 Y94.371 E.10727
G1 X164.353 Y94.371 E.1009
G1 X164.966 Y94.938 E.02564
G1 X165.415 Y95.576 E.02398
G1 X165.728 Y96.291 E.02398
G1 X165.894 Y97.054 E.02398
G1 X165.903 Y97.342 E.00888
G1 X166.116 Y96.274 F30000
G1 F15000
G1 X166.987 Y94.748 E.05399
G1 X165.297 Y94.748 E.05195
G1 X165.726 Y95.364 E.02307
G1 X166.098 Y96.217 E.02858
G1 X166.217 Y95.155 F30000
; LINE_WIDTH: 0.59996
G1 F11309.781
G2 X166.222 Y95.267 I-.031 J.058 E.01246
G1 X165.133 Y98.729 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.585713
G1 F11606.648
G1 X165.27 Y99.09 E.01707
G1 X164.882 Y99.752 E.03396
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X165.27 Y99.09 E-.50576
G1 X165.133 Y98.729 E-.25424
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/88
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
G3 Z2.6 I-.853 J-.868 P1  F30000
G1 X128.44 Y134.762 Z2.6
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.704 Y134.627 E.00982
G3 X129.919 Y134.349 I1.299 J2.875 E.04162
G3 X133.152 Y137.493 I.072 J3.16 E.16657
G1 X133.152 Y150.507 E.43173
G3 X126.848 Y150.507 I-3.152 J-.008 E.32794
G1 X126.848 Y137.49 E.43182
G3 X128.388 Y134.792 I3.154 J.012 E.10775
G1 X128.57 Y135.142 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.62 Y135.11 E.00184
G3 X129.93 Y134.741 I1.382 J2.392 E.04225
G3 X132.76 Y137.497 I.062 J2.767 E.13517
G1 X132.76 Y150.503 E.39961
G3 X127.24 Y150.503 I-2.76 J-.003 E.26622
G1 X127.24 Y137.496 E.39964
G3 X128.389 Y135.26 I2.762 J.006 E.08023
G1 X128.519 Y135.175 E.00477
M204 S10000
; WIPE_START
G1 F24000
G1 X128.62 Y135.11 E-.0456
G1 X128.865 Y134.984 E-.10455
G1 X129.121 Y134.884 E-.10456
G1 X129.386 Y134.809 E-.10456
G1 X129.657 Y134.761 E-.10456
G1 X129.93 Y134.741 E-.10418
G1 X130.206 Y134.748 E-.10494
G1 X130.434 Y134.776 E-.08705
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I.955 J-.755 P1  F30000
G1 X98.52 Y94.393 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X98.547 Y94.396 E.0009
G3 X97.921 Y94.349 I-.547 J3.104 E.63605
G1 X98.079 Y94.349 E.00521
G1 X98.461 Y94.387 E.01274
G1 X98.561 Y94.8 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.748 Y94.843 E.00589
G3 X97.931 Y94.741 I-.748 J2.656 E.50741
G1 X98.069 Y94.741 E.00423
G3 X98.479 Y94.782 I-.069 J2.759 E.01269
G1 X98.502 Y94.787 E.00072
M204 S10000
; WIPE_START
G1 F24000
G1 X98.748 Y94.843 E-.09569
G1 X99.008 Y94.931 E-.10456
G1 X99.259 Y95.044 E-.10456
G1 X99.497 Y95.181 E-.10455
G1 X99.721 Y95.342 E-.10457
G1 X99.927 Y95.524 E-.10455
G1 X100.114 Y95.726 E-.10455
G1 X100.173 Y95.803 E-.03696
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-.044 J1.216 P1  F30000
G1 X165.085 Y98.142 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X165.012 Y98.429 E.00982
G3 X161.921 Y94.349 I-3.012 J-.929 E.45878
G1 X162.079 Y94.349 E.00521
G3 X165.097 Y98.084 I-.079 J3.151 E.1811
G1 X164.705 Y98.047 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X164.593 Y98.444 E.01266
G3 X161.931 Y94.741 I-2.593 J-.944 E.36786
G1 X162.069 Y94.741 E.00423
G3 X164.716 Y97.989 I-.069 J2.759 E.14619
M204 S10000
; WIPE_START
G1 F24000
G1 X164.593 Y98.444 E-.1792
G1 X164.487 Y98.698 E-.10454
G1 X164.355 Y98.939 E-.10456
G1 X164.2 Y99.167 E-.10455
G1 X164.023 Y99.377 E-.10456
G1 X163.826 Y99.569 E-.10456
G1 X163.707 Y99.665 E-.05802
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I-1.07 J-.58 P1  F30000
G1 X130 Y161.786 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X91.037 Y93.602 E2.60503
G1 X168.963 Y93.602 E2.58492
G1 X138.811 Y146.368 E2.01596
G1 X130.03 Y161.734 E.58708
G1 X130 Y162.577 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X90.362 Y93.21 E2.4549
G1 X169.638 Y93.21 E2.43594
G1 X139.151 Y146.562 E1.88815
G1 X130.03 Y162.525 E.5649
M204 S10000
; WIPE_START
G1 F24000
G1 X129.036 Y160.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z2.8 I1.163 J.359 P1  F30000
G1 X131.053 Y154.264 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G2 X132.485 Y153.513 I-1.02 J-3.686 E.05404
G1 X133.359 Y154.386 E.04097
G1 X132.08 Y156.624 E.08547
G1 X129.433 Y159.271 E.1242
G1 X130 Y160.264 E.03793
G1 X130.567 Y159.271 E.03793
G1 X127.92 Y156.624 E.1242
G1 X126.641 Y154.386 E.08547
G1 X127.515 Y153.513 E.04097
G2 X128.947 Y154.264 I2.523 J-3.072 E.054
G1 X134.227 Y153.568 F30000
G1 F15476.087
G1 X132.934 Y152.541 E.05477
G1 X132.525 Y152.921 E.0185
G3 X127.563 Y153.013 I-2.527 J-2.43 E.18289
G1 X127.048 Y152.558 E.0228
G1 X125.737 Y153.625 E.05605
G1 X130 Y161.084 E.28499
G1 X134.274 Y153.605 E.28576
G1 X141.732 Y139.732 F30000
G1 F15476.087
G1 X101.409 Y99.409 E1.89167
G2 X101.252 Y95.34 I-3.401 J-1.906 E.1421
G1 X102.235 Y94.357 E.0461
G1 X104.033 Y94.357 E.05966
G1 X144.524 Y134.848 E1.89948
G1 X142.315 Y138.713 E.14768
G1 X133.907 Y147.12 E.39441
G1 X133.907 Y147.259 E.00461
G1 X136.15 Y149.502 E.1052
G1 X138.941 Y144.617 E.18662
G1 X133.907 Y139.583 E.23614
G1 X133.907 Y139.445 E.00461
G1 X152.549 Y120.803 E.87453
G1 X152.897 Y120.194 E.02327
M73 P41 R15
G1 X138.367 Y105.663 E.68166
G1 X139.995 Y105.663 E.05401
G1 X139.349 Y101.671 F30000
G1 F15476.087
G1 X139.349 Y103.299 E.05401
G1 X138.651 Y103.997 E.03272
G1 X138.651 Y98.271 E.18992
G1 X139.349 Y98.969 E.03272
G1 X139.349 Y95.623 E.11097
G1 X138.201 Y96.771 E.05384
G2 X137.667 Y96.349 I-.777 J.434 E.02319
G1 X136.729 Y96.349 E.03112
G1 X134.33 Y93.95 E.11251
G1 X133.346 Y93.95 E.03265
G1 X130.947 Y96.349 E.11251
G1 X129.053 Y96.349 E.06286
G1 X126.654 Y93.95 E.11251
G1 X125.67 Y93.95 E.03265
G1 X123.271 Y96.349 E.11251
G1 X122.333 Y96.349 E.03112
G2 X121.799 Y96.771 I.243 J.856 E.02319
G1 X120.651 Y95.623 E.05384
G1 X120.651 Y98.969 E.11097
G1 X121.349 Y98.271 E.03272
G1 X121.349 Y103.997 E.18992
G1 X120.651 Y103.299 E.03272
G1 X120.651 Y101.671 E.05401
G1 X120.244 Y105.196 F30000
G1 F15476.087
G1 X120.244 Y93.95 E.37303
G1 X99.812 Y93.95 E.67778
G1 X100.975 Y95.657 E.0685
G3 X97.569 Y100.975 I-2.987 J1.837 E.26077
G1 X95.437 Y100.599 E.07182
G1 X125.129 Y152.561 E1.98526
G1 X126.693 Y152.018 E.0549
G3 X126.5 Y150.516 I7.453 J-1.721 E.0503
G1 X126.5 Y137.481 E.43241
G3 X133.5 Y137.484 I3.5 J.036 E.36248
G1 X133.5 Y150.516 E.43231
G3 X133.45 Y151.073 I-2.822 J.024 E.01857
G1 X133.307 Y152.018 E.0317
G1 X134.871 Y152.561 E.0549
G1 X164.563 Y100.599 E1.98526
G1 X162.769 Y100.915 E.06044
G3 X159.161 Y95.457 I-.754 J-3.423 E.27986
G1 X160.188 Y93.95 E.0605
G1 X139.756 Y93.95 E.67778
G1 X139.756 Y105.256 E.37502
G1 X138.244 Y105.256 E.05014
G1 X138.244 Y97.414 E.26012
G1 X137.627 Y96.773 E.02952
G1 X122.414 Y96.756 E.50464
G1 X121.756 Y97.414 E.03089
G1 X121.756 Y105.256 E.26012
G1 X120.244 Y105.256 E.05014
G1 X120.005 Y105.663 F30000
G1 F15476.087
G1 X121.633 Y105.663 E.05401
G1 X107.103 Y120.194 E.68166
G1 X107.451 Y120.803 E.02327
G1 X126.093 Y139.445 E.87453
G1 X126.093 Y139.583 E.00461
G1 X121.059 Y144.617 E.23614
G1 X123.85 Y149.502 E.18662
G1 X126.093 Y147.259 E.1052
G1 X126.093 Y147.12 E.00461
G1 X117.685 Y138.713 E.39441
G1 X115.476 Y134.848 E.14768
G1 X155.967 Y94.357 E1.89948
G1 X157.765 Y94.357 E.05966
G1 X158.748 Y95.34 E.0461
G2 X158.591 Y99.409 I3.299 J2.164 E.14191
G1 X118.268 Y139.732 E1.89167
G1 X103.503 Y113.895 F30000
G1 F15476.087
G1 X104.311 Y115.309 E.05401
G1 X119.837 Y99.783 E.72835
G1 X119.837 Y102.485 E.08964
G1 X111.709 Y94.357 E.38129
G1 X109.911 Y94.357 E.05966
G1 X98.729 Y105.539 E.52457
G1 X101.52 Y110.424 E.18662
G1 X117.587 Y94.357 E.75372
G1 X119.385 Y94.357 E.05966
G1 X119.837 Y94.809 E.0212
G1 X119.837 Y96.438 E.05401
G1 X123.927 Y97.163 F30000
G1 F15476.087
G1 X122.559 Y97.163 E.04539
G1 X122.375 Y97.347 E.00863
G1 X150.106 Y125.078 E1.30094
G1 X147.315 Y129.963 E.18662
G1 X122.163 Y104.811 E1.17993
G1 X122.163 Y105.133 E.01069
G1 X130.133 Y97.163 E.37391
G1 X129.867 Y97.163 E.00884
G1 X137.837 Y105.133 E.37391
G1 X137.837 Y104.811 E.01069
G1 X112.685 Y129.963 E1.17993
G1 X109.894 Y125.078 E.18662
G1 X137.625 Y97.347 E1.30094
G1 X137.441 Y97.163 E.00863
G1 X136.073 Y97.163 E.04539
G1 X140.163 Y96.438 F30000
G1 F15476.087
G1 X140.163 Y94.809 E.05401
G1 X140.615 Y94.357 E.0212
G1 X142.413 Y94.357 E.05966
G1 X158.48 Y110.424 E.75372
G1 X155.689 Y115.309 E.18662
G1 X140.163 Y99.783 E.72835
G1 X140.163 Y102.485 E.08964
G1 X148.291 Y94.357 E.38129
G1 X150.089 Y94.357 E.05966
G1 X161.271 Y105.539 E.52457
G1 X160.463 Y106.953 E.05401
G1 X163.592 Y101.478 F30000
G1 F15476.087
G1 X162.784 Y102.892 E.05401
G1 X131.694 Y133.982 E1.45849
G2 X128.306 Y133.982 I-1.694 J3.69 E.11595
G1 X97.216 Y102.892 E1.45849
G1 X96.408 Y101.478 E.05401
G1 X95.118 Y99.752 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.596591
G1 F11378.612
G1 X94.73 Y99.09 E.03464
G1 X94.867 Y98.729 E.01741
G1 X94.537 Y98.182 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X94.472 Y97.836 E.01082
G3 X94.618 Y96.44 I3.759 J-.311 E.0434
G1 X94.88 Y95.819 E.02069
G3 X96.304 Y94.412 I2.967 J1.579 E.06248
G1 X96.231 Y94.282 E.00459
G3 X96.364 Y93.994 I.61 J.108 E.00986
G1 X91.713 Y93.994 E.14292
G1 X94.244 Y98.423 E.15675
G1 X94.378 Y98.196 E.00811
G1 X94.477 Y98.187 E.00307
G1 X94.083 Y97.382 F30000
G1 F15000
G3 X94.533 Y95.673 I4.351 J.231 E.05467
G3 X95.642 Y94.371 I3.778 J2.096 E.0529
G1 X92.363 Y94.371 E.10075
G1 X94.053 Y97.33 E.1047
G1 X93.883 Y96.272 F30000
G1 F15000
G1 X94.185 Y95.526 E.02471
G1 X94.533 Y94.962 E.02037
G1 X94.707 Y94.748 E.00848
G1 X93.013 Y94.748 E.05207
G1 X93.853 Y96.22 E.05208
G1 X93.852 Y95.155 F30000
; LINE_WIDTH: 0.59987
G1 F11311.608
G2 X93.857 Y95.267 I-.031 J.058 E.01245
G1 X96.888 Y94.328 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.443469
G1 F15000
G1 X97.042 Y94.075 E.00964
; LINE_WIDTH: 0.480656
G1 F14392.259
G1 X97.066 Y94.037 E.00162
G1 X97.2 Y94.02 E.00484
; LINE_WIDTH: 0.438329
G1 F15000
G1 X97.378 Y94.002 E.00576
; LINE_WIDTH: 0.410916
G1 X97.555 Y93.989 E.00533
; LINE_WIDTH: 0.387197
G1 X98.259 Y93.98 E.01975
; LINE_WIDTH: 0.420463
G1 X98.612 Y94.001 E.01086
; LINE_WIDTH: 0.467963
G1 F14822.057
G1 X98.789 Y94.019 E.00617
; LINE_WIDTH: 0.499592
G1 F13795.456
G1 X98.934 Y94.037 E.00544
G1 X98.946 Y94.056 E.00084
; LINE_WIDTH: 0.443463
G1 F15000
G1 X98.958 Y94.075 E.00074
; LINE_WIDTH: 0.421773
G1 X99.112 Y94.328 E.00911
G1 X160.888 Y94.328 F30000
; LINE_WIDTH: 0.443457
G1 F15000
G1 X161.042 Y94.075 E.00963
; LINE_WIDTH: 0.480657
G1 F14392.216
G1 X161.066 Y94.037 E.00162
G1 X161.2 Y94.02 E.00484
; LINE_WIDTH: 0.438331
G1 F15000
G1 X161.378 Y94.002 E.00576
; LINE_WIDTH: 0.410914
G1 X161.555 Y93.989 E.00533
; LINE_WIDTH: 0.387196
G1 X162.259 Y93.98 E.01975
; LINE_WIDTH: 0.420465
G1 X162.612 Y94.001 E.01086
; LINE_WIDTH: 0.467962
G1 F14822.064
G1 X162.789 Y94.019 E.00617
; LINE_WIDTH: 0.499592
G1 F13795.474
G1 X162.934 Y94.037 E.00544
G1 X162.946 Y94.056 E.00084
; LINE_WIDTH: 0.443461
G1 F15000
G1 X162.958 Y94.075 E.00074
; LINE_WIDTH: 0.421773
G1 X163.112 Y94.328 E.00911
G1 X165.458 Y98.185 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X165.619 Y98.198 E.00495
G1 X165.752 Y98.43 E.00821
G1 X168.287 Y93.994 E.15697
G2 X163.629 Y93.996 I-2.216 J288.951 E.14314
G1 X163.76 Y94.284 E.00973
G1 X163.698 Y94.397 E.00395
G1 X164.195 Y94.718 E.01818
G1 X164.703 Y95.208 E.02168
G1 X165.103 Y95.789 E.02168
G1 X165.381 Y96.438 E.02168
G1 X165.524 Y97.128 E.02168
G1 X165.528 Y97.834 E.02168
G1 X165.47 Y98.126 E.00914
G1 X165.905 Y97.402 F30000
G1 F15000
G1 X167.637 Y94.371 E.10727
G1 X164.353 Y94.371 E.1009
G1 X164.966 Y94.938 E.02564
G1 X165.415 Y95.576 E.02398
G1 X165.728 Y96.291 E.02398
G1 X165.894 Y97.054 E.02398
G1 X165.903 Y97.342 E.00887
G1 X166.116 Y96.274 F30000
G1 F15000
G1 X166.987 Y94.748 E.05399
G1 X165.297 Y94.748 E.05195
G1 X165.726 Y95.364 E.02307
G1 X166.098 Y96.217 E.02858
G1 X166.217 Y95.155 F30000
; LINE_WIDTH: 0.59996
G1 F11309.781
G2 X166.222 Y95.267 I-.031 J.058 E.01246
G1 X165.133 Y98.729 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.585701
G1 F11606.892
G1 X165.27 Y99.09 E.01707
G1 X164.882 Y99.752 E.03396
M106 S127.5
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X165.27 Y99.09 E-.50576
G1 X165.133 Y98.729 E-.25424
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/88
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
G3 Z2.8 I-.853 J-.868 P1  F30000
G1 X128.409 Y134.78 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.424 Y134.771 E.0006
G3 X129.919 Y134.349 I1.578 J2.731 E.05206
G3 X133.152 Y137.493 I.072 J3.16 E.16655
G1 X133.152 Y150.507 E.43173
G3 X126.848 Y150.507 I-3.152 J-.008 E.32794
G1 X126.848 Y137.493 E.43173
G3 X128.16 Y134.941 I3.154 J.01 E.0988
G1 X128.358 Y134.813 E.00783
G1 X128.599 Y135.123 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.62 Y135.11 E.00075
G3 X129.93 Y134.741 I1.382 J2.392 E.04226
G3 X132.76 Y137.497 I.062 J2.767 E.13516
G1 X132.76 Y150.503 E.39961
G3 X127.24 Y150.503 I-2.76 J-.003 E.26622
G1 X127.24 Y137.497 E.39961
G3 X128.389 Y135.26 I2.762 J.005 E.08026
G1 X128.549 Y135.156 E.00586
M204 S10000
; WIPE_START
G1 F24000
G1 X128.62 Y135.11 E-.03212
G1 X128.865 Y134.984 E-.10455
G1 X129.121 Y134.884 E-.10456
G1 X129.386 Y134.809 E-.10456
G1 X129.657 Y134.761 E-.10456
G1 X129.93 Y134.741 E-.10427
G1 X130.206 Y134.748 E-.10485
G1 X130.469 Y134.781 E-.10053
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.956 J-.753 P1  F30000
G1 X98.719 Y94.432 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.004 Y94.512 E.00982
G3 X97.921 Y94.349 I-1.004 J2.988 E.62041
G1 X98.079 Y94.349 E.00521
G3 X98.661 Y94.418 I-.079 J3.151 E.01947
G1 X98.545 Y94.797 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.614 Y94.809 E.00216
G3 X97.931 Y94.741 I-.614 J2.69 E.51164
G1 X98.069 Y94.741 E.00423
G3 X98.343 Y94.761 I-.069 J2.759 E.00846
G1 X98.486 Y94.787 E.00446
M204 S10000
; WIPE_START
G1 F24000
G1 X98.614 Y94.809 E-.04946
G1 X98.879 Y94.884 E-.10456
G1 X99.135 Y94.984 E-.10456
G1 X99.38 Y95.11 E-.10456
G1 X99.611 Y95.259 E-.10456
G1 X99.826 Y95.431 E-.10456
G1 X100.023 Y95.623 E-.10456
G1 X100.164 Y95.79 E-.08318
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-.043 J1.216 P1  F30000
G1 X165.093 Y98.098 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X165.089 Y98.124 E.0009
G3 X161.921 Y94.349 I-3.089 J-.625 E.4692
G1 X162.079 Y94.349 E.00521
G3 X165.148 Y97.655 I-.079 J3.151 E.16678
G1 X165.101 Y98.038 E.01281
G1 X164.705 Y98.046 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X164.705 Y98.047 E.00003
G3 X161.931 Y94.741 I-2.705 J-.547 E.38055
G1 X162.069 Y94.741 E.00423
G3 X164.756 Y97.637 I-.069 J2.759 E.1353
G1 X164.713 Y97.987 E.01083
M204 S10000
; WIPE_START
G1 F24000
G1 X164.705 Y98.047 E-.02309
G1 X164.637 Y98.314 E-.10455
G1 X164.543 Y98.572 E-.10457
G1 X164.424 Y98.82 E-.10456
G1 X164.28 Y99.055 E-.10456
G1 X164.114 Y99.274 E-.10456
G1 X163.927 Y99.476 E-.10456
G1 X163.721 Y99.658 E-.10456
G1 X163.71 Y99.666 E-.005
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I-1.07 J-.58 P1  F30000
G1 X130 Y161.786 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X91.037 Y93.602 E2.60503
G1 X168.963 Y93.602 E2.58492
G1 X130.03 Y161.734 E2.60304
G1 X130 Y162.577 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X90.362 Y93.21 E2.4549
G1 X169.638 Y93.21 E2.43594
G1 X136.484 Y151.229 E2.0533
G1 X130.03 Y162.525 E.39975
M204 S10000
; WIPE_START
G1 F24000
G1 X129.036 Y160.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.054 J1.216 P1  F30000
G1 X130.413 Y160.727 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.406972
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X129.82 Y160.727 E.03139
G1 X129.559 Y160.27 E.0279
G1 X130.441 Y160.27 E.04671
G1 X130.702 Y159.813 E.0279
G1 X129.298 Y159.813 E.07439
G1 X129.037 Y159.356 E.0279
G1 X130.963 Y159.356 E.10207
G1 X131.224 Y158.899 E.0279
G1 X128.776 Y158.899 E.12975
G1 X128.515 Y158.442 E.0279
G1 X131.485 Y158.442 E.15743
G1 X131.746 Y157.985 E.0279
G1 X128.254 Y157.985 E.18511
G1 X127.993 Y157.528 E.0279
G1 X132.007 Y157.528 E.21279
G1 X132.269 Y157.071 E.0279
G1 X127.731 Y157.071 E.24047
G1 X127.47 Y156.614 E.0279
G1 X132.53 Y156.614 E.26815
G1 X132.791 Y156.157 E.0279
G1 X127.209 Y156.157 E.29583
G1 X126.948 Y155.7 E.0279
G1 X133.052 Y155.7 E.32351
G1 X133.313 Y155.243 E.0279
G1 X126.687 Y155.243 E.35119
G1 X126.426 Y154.786 E.0279
G1 X133.574 Y154.786 E.37887
G1 X133.835 Y154.33 E.0279
G1 X126.165 Y154.33 E.40655
G1 X125.904 Y153.873 E.0279
G1 X134.096 Y153.873 E.43422
G1 X134.246 Y153.61 E.016
G1 X134.001 Y153.416 E.01661
G1 X131.96 Y153.416 E.10815
G2 X132.515 Y152.959 I-1.238 J-2.07 E.03825
G1 X133.751 Y152.959 E.06547
M106 S127.5
G1 X133.462 Y152.474 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.397032
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X134.439 Y153.25 E.03602
G1 X134.647 Y152.886 E.0121
G1 X133.518 Y152.494 E.03449
G1 X135.324 Y152.132 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.400854
; LAYER_HEIGHT: 0.4
M106 S255
M73 P42 R15
G1 F3000
G1 X133.703 Y152.132 E.08337
G1 X133.331 Y152.003 E.02022
G1 X133.38 Y151.682 E.01673
G1 X135.348 Y151.682 E.10123
G1 X135.606 Y151.231 E.0267
G1 X133.448 Y151.231 E.11098
G2 X133.509 Y150.78 I-2.236 J-.531 E.02343
G1 X135.864 Y150.78 E.1211
G1 X136.121 Y150.329 E.0267
G1 X133.522 Y150.329 E.13366
G1 X133.522 Y149.878 E.02318
G1 X136.379 Y149.878 E.14691
G1 X136.637 Y149.427 E.0267
G1 X133.522 Y149.427 E.16016
G1 X133.522 Y148.976 E.02318
G1 X136.894 Y148.976 E.1734
G1 X137.152 Y148.526 E.0267
G1 X133.522 Y148.526 E.18665
G1 X133.522 Y148.075 E.02318
G1 X137.409 Y148.075 E.1999
G1 X137.667 Y147.624 E.0267
G1 X133.522 Y147.624 E.21315
G1 X133.522 Y147.173 E.02318
G1 X137.925 Y147.173 E.22639
G1 X138.182 Y146.722 E.0267
G1 X133.522 Y146.722 E.23964
G1 X133.522 Y146.271 E.02318
G1 X138.44 Y146.271 E.25289
G1 X138.698 Y145.82 E.0267
G1 X133.522 Y145.82 E.26613
G1 X133.522 Y145.37 E.02318
G1 X138.955 Y145.37 E.27938
G1 X139.213 Y144.919 E.0267
G1 X133.522 Y144.919 E.29263
G1 X133.522 Y144.468 E.02318
G1 X139.47 Y144.468 E.30588
G1 X139.728 Y144.017 E.0267
G1 X133.522 Y144.017 E.31912
G1 X133.522 Y143.566 E.02318
G1 X139.986 Y143.566 E.33237
G1 X140.243 Y143.115 E.0267
G1 X133.522 Y143.115 E.34562
G1 X133.522 Y142.665 E.02318
G1 X140.501 Y142.665 E.35886
G1 X140.759 Y142.214 E.0267
G1 X133.522 Y142.214 E.37211
G1 X133.522 Y141.763 E.02318
G1 X141.016 Y141.763 E.38536
G1 X141.274 Y141.312 E.0267
G1 X133.522 Y141.312 E.3986
G1 X133.522 Y140.861 E.02318
G1 X141.532 Y140.861 E.41185
G1 X141.789 Y140.41 E.0267
G1 X133.522 Y140.41 E.4251
G1 X133.522 Y139.959 E.02318
G1 X142.047 Y139.959 E.43835
G1 X142.304 Y139.509 E.0267
G1 X133.522 Y139.509 E.45159
G1 X133.522 Y139.058 E.02318
G1 X142.562 Y139.058 E.46484
G1 X142.82 Y138.607 E.0267
G1 X133.522 Y138.607 E.47809
G1 X133.522 Y138.156 E.02318
G1 X143.077 Y138.156 E.49133
G1 X143.335 Y137.705 E.0267
G1 X133.522 Y137.705 E.50458
G2 X133.51 Y137.254 I-4.468 J-.111 E.0232
G1 X143.593 Y137.254 E.51842
G1 X143.85 Y136.803 E.0267
G1 X133.453 Y136.803 E.53462
G2 X133.326 Y136.353 I-5.63 J1.338 E.02409
G1 X144.108 Y136.353 E.55438
G1 X144.365 Y135.902 E.0267
G1 X133.135 Y135.902 E.57746
G2 X132.861 Y135.451 I-3.508 J1.822 E.02714
G1 X144.623 Y135.451 E.60478
G1 X144.881 Y135 E.0267
G1 X132.48 Y135 E.63766
G2 X131.922 Y134.549 I-3.094 J3.254 E.03689
G1 X145.138 Y134.549 E.67955
G1 X145.396 Y134.098 E.0267
G1 X114.604 Y134.098 E1.58329
G1 X114.346 Y133.647 E.0267
G1 X145.654 Y133.647 E1.60978
G1 X145.911 Y133.197 E.0267
G1 X114.089 Y133.197 E1.63628
G1 X113.831 Y132.746 E.0267
G1 X146.169 Y132.746 E1.66277
G1 X146.427 Y132.295 E.0267
G1 X113.573 Y132.295 E1.68927
G1 X113.316 Y131.844 E.0267
G1 X146.684 Y131.844 E1.71576
G1 X146.942 Y131.393 E.0267
G1 X113.058 Y131.393 E1.74225
G1 X112.801 Y130.942 E.0267
G1 X147.199 Y130.942 E1.76875
G1 X147.457 Y130.491 E.0267
G1 X112.543 Y130.491 E1.79524
G1 X112.285 Y130.041 E.0267
G1 X147.715 Y130.041 E1.82174
G1 X147.972 Y129.59 E.0267
G1 X112.028 Y129.59 E1.84823
G1 X111.77 Y129.139 E.0267
G1 X148.23 Y129.139 E1.87473
G1 X148.488 Y128.688 E.0267
G1 X111.512 Y128.688 E1.90122
G1 X111.255 Y128.237 E.0267
G1 X148.745 Y128.237 E1.92771
G1 X149.003 Y127.786 E.0267
G1 X110.997 Y127.786 E1.95421
G1 X110.74 Y127.335 E.0267
G1 X149.26 Y127.335 E1.9807
G1 X149.518 Y126.885 E.0267
G1 X110.482 Y126.885 E2.0072
G1 X110.224 Y126.434 E.0267
G1 X149.776 Y126.434 E2.03369
G1 X150.033 Y125.983 E.0267
G1 X109.967 Y125.983 E2.06018
G1 X109.709 Y125.532 E.0267
G1 X150.291 Y125.532 E2.08668
G1 X150.549 Y125.081 E.0267
G1 X109.451 Y125.081 E2.11317
G1 X109.194 Y124.63 E.0267
G1 X150.806 Y124.63 E2.13967
G1 X151.064 Y124.179 E.0267
G1 X108.936 Y124.179 E2.16616
G1 X108.678 Y123.729 E.0267
G1 X151.322 Y123.729 E2.19266
G1 X151.579 Y123.278 E.0267
G1 X108.421 Y123.278 E2.21915
G1 X108.163 Y122.827 E.0267
G1 X151.837 Y122.827 E2.24564
G1 X152.094 Y122.376 E.0267
G1 X107.906 Y122.376 E2.27214
G1 X107.648 Y121.925 E.0267
G1 X152.352 Y121.925 E2.29863
G1 X152.61 Y121.474 E.0267
G1 X107.39 Y121.474 E2.32513
G1 X107.133 Y121.024 E.0267
G1 X152.867 Y121.024 E2.35162
G1 X153.125 Y120.573 E.0267
G1 X106.875 Y120.573 E2.37812
G1 X106.617 Y120.122 E.0267
G1 X153.383 Y120.122 E2.40461
G1 X153.64 Y119.671 E.0267
G1 X106.36 Y119.671 E2.4311
G1 X106.102 Y119.22 E.0267
G1 X153.898 Y119.22 E2.4576
G1 X154.155 Y118.769 E.0267
G1 X105.845 Y118.769 E2.48409
G1 X105.587 Y118.318 E.0267
G1 X154.413 Y118.318 E2.51059
G1 X154.671 Y117.868 E.0267
G1 X105.329 Y117.868 E2.53708
M73 P43 R14
G1 X105.072 Y117.417 E.0267
G1 X154.928 Y117.417 E2.56357
G1 X155.186 Y116.966 E.0267
G1 X104.814 Y116.966 E2.59007
G1 X104.556 Y116.515 E.0267
G1 X155.444 Y116.515 E2.61656
G1 X155.701 Y116.064 E.0267
G1 X104.299 Y116.064 E2.64306
G1 X104.041 Y115.613 E.0267
G1 X155.959 Y115.613 E2.66955
G1 X156.217 Y115.162 E.0267
G1 X103.784 Y115.162 E2.69605
G1 X103.526 Y114.712 E.0267
G1 X156.474 Y114.712 E2.72254
G1 X156.732 Y114.261 E.0267
G1 X103.268 Y114.261 E2.74903
G1 X103.011 Y113.81 E.0267
G1 X156.989 Y113.81 E2.77553
G1 X157.247 Y113.359 E.0267
G1 X102.753 Y113.359 E2.80202
G1 X102.495 Y112.908 E.0267
G1 X157.505 Y112.908 E2.82852
G1 X157.762 Y112.457 E.0267
G1 X102.238 Y112.457 E2.85501
G1 X101.98 Y112.006 E.0267
G1 X158.02 Y112.006 E2.8815
G1 X158.278 Y111.556 E.0267
G1 X101.722 Y111.556 E2.908
G1 X101.465 Y111.105 E.0267
G1 X158.535 Y111.105 E2.93449
G1 X158.793 Y110.654 E.0267
G1 X101.207 Y110.654 E2.96099
G1 X100.95 Y110.203 E.0267
G1 X159.05 Y110.203 E2.98748
G1 X159.308 Y109.752 E.0267
G1 X100.692 Y109.752 E3.01398
G1 X100.434 Y109.301 E.0267
G1 X159.566 Y109.301 E3.04047
M73 P44 R14
G1 X159.823 Y108.85 E.0267
G1 X100.177 Y108.85 E3.06696
G1 X99.919 Y108.4 E.0267
G1 X160.081 Y108.4 E3.09346
G1 X160.339 Y107.949 E.0267
G1 X99.661 Y107.949 E3.11995
G1 X99.404 Y107.498 E.0267
G1 X160.596 Y107.498 E3.14645
G1 X160.854 Y107.047 E.0267
G1 X99.146 Y107.047 E3.17294
G1 X98.889 Y106.596 E.0267
G1 X161.111 Y106.596 E3.19943
G1 X161.369 Y106.145 E.0267
G1 X98.631 Y106.145 E3.22593
G1 X98.373 Y105.694 E.0267
G1 X161.627 Y105.694 E3.25242
G1 X161.884 Y105.244 E.0267
G1 X98.116 Y105.244 E3.27892
G1 X97.858 Y104.793 E.0267
G1 X120.223 Y104.793 E1.14997
G1 X120.223 Y104.342 E.02318
G1 X97.6 Y104.342 E1.16322
G1 X97.343 Y103.891 E.0267
G1 X120.223 Y103.891 E1.17647
G1 X120.223 Y103.44 E.02318
G1 X97.085 Y103.44 E1.18971
G1 X96.827 Y102.989 E.0267
G1 X120.223 Y102.989 E1.20296
G1 X120.223 Y102.538 E.02318
G1 X96.57 Y102.538 E1.21621
M73 P45 R14
G1 X96.312 Y102.088 E.0267
G1 X120.223 Y102.088 E1.22945
G1 X120.223 Y101.637 E.02318
G1 X96.055 Y101.637 E1.2427
G1 X95.797 Y101.186 E.0267
G1 X120.223 Y101.186 E1.25595
G1 X120.223 Y100.735 E.02318
G1 X99.379 Y100.735 E1.07175
G2 X100.151 Y100.284 I-1.365 J-3.223 E.04609
G1 X120.223 Y100.284 E1.03206
G1 X120.223 Y99.833 E.02318
G1 X100.635 Y99.833 E1.0072
G2 X100.966 Y99.383 I-1.633 J-1.549 E.02886
G1 X120.223 Y99.383 E.99014
G1 X120.223 Y98.932 E.02318
G1 X101.208 Y98.932 E.97771
G2 X101.379 Y98.481 I-1.713 J-.907 E.02486
G1 X120.223 Y98.481 E.96892
G1 X120.223 Y98.03 E.02318
G1 X101.474 Y98.03 E.96405
G2 X101.517 Y97.579 I-1.705 J-.391 E.02335
G1 X120.223 Y97.579 E.96182
G1 X120.223 Y97.128 E.02318
G1 X101.495 Y97.128 E.96294
G2 X101.416 Y96.677 I-1.562 J.044 E.02363
G1 X120.223 Y96.677 E.96704
G1 X120.223 Y96.227 E.02318
G1 X101.28 Y96.227 E.974
M73 P46 R14
G2 X101.064 Y95.776 I-1.907 J.638 E.02578
G1 X120.223 Y95.776 E.98513
G1 X120.223 Y95.325 E.02318
G1 X100.775 Y95.325 E.99999
G1 X100.468 Y94.874 E.02806
G1 X120.223 Y94.874 E1.01579
G1 X120.223 Y94.423 E.02318
G1 X100.16 Y94.423 E1.0316
G1 X99.853 Y93.972 E.02806
G1 X120.425 Y93.972 E1.05782
M106 S127.5
G1 X121.784 Y96.896 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X121.854 Y96.827 E.00273
G1 X120.651 Y101.671 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X120.651 Y103.299 E.05401
G1 X121.349 Y103.997 E.03271
G1 X121.349 Y98.271 E.18992
G1 X120.651 Y98.969 E.03271
G1 X120.651 Y95.623 E.11097
G1 X121.621 Y96.594 E.04551
G1 X121.76 Y96.455 E.00649
G2 X122.333 Y96.349 I.157 J-.754 E.01984
G1 X123.271 Y96.349 E.03112
G1 X125.67 Y93.95 E.11251
G1 X126.654 Y93.95 E.03265
G1 X129.053 Y96.349 E.11251
G1 X130.947 Y96.349 E.06286
G1 X133.346 Y93.95 E.11251
G1 X134.33 Y93.95 E.03265
G1 X136.729 Y96.349 E.11251
G1 X137.667 Y96.349 E.03112
M73 P46 R13
G3 X137.885 Y96.455 I-.019 J.317 E.00827
G1 X138.24 Y96.455 E.01177
G1 X138.379 Y96.594 E.00649
G1 X139.349 Y95.623 E.04551
G1 X139.349 Y98.969 E.11097
G1 X138.651 Y98.271 E.03271
G1 X138.651 Y103.997 E.18992
G1 X139.349 Y103.299 E.03271
G1 X139.349 Y101.671 E.05401
G1 X139.575 Y104.793 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.400854
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X162.142 Y104.793 E1.16038
G1 X162.4 Y104.342 E.0267
G1 X139.777 Y104.342 E1.16322
G1 X139.777 Y103.891 E.02318
M73 P47 R13
G1 X162.657 Y103.891 E1.17647
G1 X162.915 Y103.44 E.0267
G1 X139.777 Y103.44 E1.18971
G1 X139.777 Y102.989 E.02318
G1 X163.173 Y102.989 E1.20296
G1 X163.43 Y102.538 E.0267
G1 X139.777 Y102.538 E1.21621
G1 X139.777 Y102.088 E.02318
G1 X163.688 Y102.088 E1.22945
G1 X163.945 Y101.637 E.0267
G1 X139.777 Y101.637 E1.2427
G1 X139.777 Y101.186 E.02318
G1 X164.203 Y101.186 E1.25595
G1 X164.461 Y100.735 E.0267
G1 X163.913 Y100.735 E.02818
G1 X162.438 Y100.995 E.077
G3 X160.616 Y100.735 I-.436 J-3.462 E.09577
G1 X139.777 Y100.735 E1.0715
G1 X139.777 Y100.284 E.02318
G1 X159.846 Y100.284 E1.03191
G3 X159.366 Y99.833 I2.505 J-3.148 E.0339
G1 X139.777 Y99.833 E1.00723
G1 X139.777 Y99.383 E.02318
G1 X159.027 Y99.383 E.98982
G3 X158.785 Y98.932 I2.132 J-1.438 E.02637
G1 X139.777 Y98.932 E.97734
G1 X139.777 Y98.481 E.02318
G1 X158.619 Y98.481 E.96884
G3 X158.522 Y98.03 I2.204 J-.712 E.02376
G1 X139.777 Y98.03 E.96384
G1 X139.777 Y97.579 E.02318
G1 X158.481 Y97.579 E.96173
G3 X158.505 Y97.128 I1.851 J-.126 E.02327
G1 X139.777 Y97.128 E.96298
G1 X139.777 Y96.677 E.02318
G1 X158.577 Y96.677 E.96667
G3 X158.719 Y96.227 I4.493 J1.166 E.02431
G1 X139.777 Y96.227 E.97396
G1 X139.777 Y95.776 E.02318
G1 X158.933 Y95.776 E.98497
G3 X159.225 Y95.325 I2.399 J1.234 E.02766
G1 X139.777 Y95.325 E.99999
G1 X139.777 Y94.874 E.02318
G1 X159.532 Y94.874 E1.01579
G1 X159.84 Y94.423 E.02806
G1 X139.777 Y94.423 E1.0316
G1 X139.777 Y93.972 E.02318
G1 X160.392 Y93.972 E1.06001
M106 S127.5
G1 X160.321 Y94.419 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X160.344 Y94.238 E.00505
G1 X160.538 Y93.925 E.0102
G1 X161.042 Y94.075 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.443444
G1 F15000
G1 X160.888 Y94.328 E.00963
G1 X161.042 Y94.075 F30000
; LINE_WIDTH: 0.480658
G1 F14392.177
G1 X161.066 Y94.037 E.00162
G1 X161.2 Y94.02 E.00484
; LINE_WIDTH: 0.43833
G1 F15000
G1 X161.378 Y94.002 E.00576
; LINE_WIDTH: 0.410916
G1 X161.555 Y93.989 E.00533
; LINE_WIDTH: 0.387197
G1 X162.259 Y93.98 E.01975
; LINE_WIDTH: 0.420465
G1 X162.612 Y94.001 E.01086
; LINE_WIDTH: 0.467956
G1 F14822.285
G1 X162.789 Y94.019 E.00616
; LINE_WIDTH: 0.499591
G1 F13795.51
G1 X162.934 Y94.037 E.00544
G1 X162.946 Y94.056 E.00084
; LINE_WIDTH: 0.44343
G1 F15000
G1 X162.958 Y94.076 E.00074
; LINE_WIDTH: 0.421748
G1 X163.112 Y94.328 E.00911
G1 X166.208 Y95.159 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.6111
G1 F11088.035
G2 X166.214 Y95.273 I-.032 J.058 E.01301
G1 X166.107 Y96.288 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X166.987 Y94.748 E.0545
G1 X165.281 Y94.748 E.05243
G1 X165.601 Y95.159 E.01599
G1 X165.92 Y95.746 E.02054
G1 X166.088 Y96.232 E.01579
G1 X165.915 Y97.386 F30000
G1 F15000
G1 X167.637 Y94.371 E.10668
G1 X164.34 Y94.371 E.10132
G1 X164.777 Y94.734 E.01745
G1 X165.206 Y95.246 E.02054
G1 X165.589 Y95.926 E.02398
G1 X165.83 Y96.668 E.02398
G1 X165.908 Y97.326 E.02035
G1 X165.468 Y98.186 F30000
G1 F15000
G1 X165.621 Y98.199 E.00469
G1 X165.752 Y98.43 E.00815
G1 X168.287 Y93.994 E.15697
G2 X163.629 Y93.996 I-2.216 J284.63 E.14314
G1 X163.76 Y94.279 E.0096
G1 X163.694 Y94.401 E.00424
G1 X163.938 Y94.533 E.00853
G1 X164.461 Y94.95 E.02054
G1 X164.917 Y95.488 E.02168
G1 X165.258 Y96.106 E.02168
G1 X165.47 Y96.779 E.02168
G1 X165.543 Y97.459 E.02101
G1 X165.509 Y97.988 E.01628
G1 X165.48 Y98.127 E.00436
G1 X165.133 Y98.729 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.58573
G1 F11606.277
G1 X165.27 Y99.09 E.01707
G1 X164.882 Y99.752 E.03396
G1 X164.559 Y100.046 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.616528
G1 F10983.111
G2 X164.565 Y100.16 I-.032 J.059 E.01329
; WIPE_START
G1 F24000
G1 X164.487 Y100.17 E-.20265
G1 X164.451 Y100.108 E-.18578
G1 X164.487 Y100.046 E-.18578
G1 X164.559 Y100.046 E-.18578
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3 I.134 J-1.21 P1  F30000
G1 X138.239 Y97.128 Z3
G1 Z2.6
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.400854
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X122.048 Y97.128 E.83251
G1 X121.791 Y97.385 E.01866
G1 X121.777 Y97.579 E.01001
G1 X138.223 Y97.579 E.84561
G1 X138.223 Y98.03 E.02318
G1 X121.777 Y98.03 E.84561
G1 X121.777 Y98.481 E.02318
G1 X138.223 Y98.481 E.84561
G1 X138.223 Y98.932 E.02318
G1 X121.777 Y98.932 E.84561
G1 X121.777 Y99.383 E.02318
G1 X138.223 Y99.383 E.84561
G1 X138.223 Y99.833 E.02318
G1 X121.777 Y99.833 E.84561
G1 X121.777 Y100.284 E.02318
G1 X138.223 Y100.284 E.84561
G1 X138.223 Y100.735 E.02318
G1 X121.777 Y100.735 E.84561
G1 X121.777 Y101.186 E.02318
G1 X138.223 Y101.186 E.84561
G1 X138.223 Y101.637 E.02318
G1 X121.777 Y101.637 E.84561
G1 X121.777 Y102.088 E.02318
G1 X138.223 Y102.088 E.84561
G1 X138.223 Y102.538 E.02318
G1 X121.777 Y102.538 E.84561
G1 X121.777 Y102.989 E.02318
G1 X138.223 Y102.989 E.84561
G1 X138.223 Y103.44 E.02318
G1 X121.777 Y103.44 E.84561
G1 X121.777 Y103.891 E.02318
G1 X138.223 Y103.891 E.84561
G1 X138.223 Y104.342 E.02318
G1 X121.777 Y104.342 E.84561
G1 X121.777 Y104.793 E.02318
G1 X138.425 Y104.793 E.85602
M106 S127.5
G1 X138.104 Y96.784 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.38292
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X138.173 Y96.854 E.00273
G1 X99.435 Y93.867 F30000
G1 F15000
G1 X99.652 Y94.242 E.01202
G1 X99.67 Y94.352 E.00308
G1 X99.112 Y94.328 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.421726
G1 F15000
G1 X98.958 Y94.076 E.00911
; LINE_WIDTH: 0.443415
G1 X98.946 Y94.056 E.00074
; LINE_WIDTH: 0.499586
G1 F13795.659
G1 X98.934 Y94.037 E.00084
G1 X98.789 Y94.019 E.00544
; LINE_WIDTH: 0.467961
G1 F14822.122
G1 X98.612 Y94.001 E.00617
; LINE_WIDTH: 0.420463
G1 F15000
M73 P48 R13
G1 X98.259 Y93.98 E.01086
; LINE_WIDTH: 0.387196
G1 X97.555 Y93.989 E.01975
; LINE_WIDTH: 0.410917
G1 X97.378 Y94.002 E.00533
; LINE_WIDTH: 0.43833
G1 X97.2 Y94.02 E.00576
; LINE_WIDTH: 0.48066
G1 F14392.118
G1 X97.066 Y94.037 E.00484
G1 X97.042 Y94.075 E.00162
; LINE_WIDTH: 0.443444
G1 F15000
G1 X96.888 Y94.328 E.00963
G1 X93.852 Y95.155 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.599748
G1 F11314.086
G2 X93.857 Y95.267 I-.031 J.058 E.01245
G1 X93.891 Y96.285 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G1 X93.988 Y95.962 E.01036
G3 X94.707 Y94.748 I4.353 J1.76 E.04352
G1 X93.013 Y94.748 E.05207
G1 X93.861 Y96.233 E.05254
G1 X94.083 Y97.38 F30000
G1 F15000
G1 X94.133 Y96.86 E.01606
G1 X94.299 Y96.21 E.02061
G3 X95.643 Y94.371 I3.653 J1.26 E.07105
G1 X92.363 Y94.371 E.1008
G2 X94.053 Y97.328 I237.551 J-133.806 E.10466
G1 X94.522 Y98.179 F30000
G1 F15000
G1 X94.46 Y97.352 E.0255
G1 X94.499 Y96.953 E.0123
G1 X94.664 Y96.303 E.02061
G3 X95.513 Y94.974 I3.695 J1.425 E.04878
G1 X96.107 Y94.512 E.02313
G1 X96.283 Y94.403 E.00636
G1 X96.231 Y94.279 E.00411
G1 X96.364 Y93.994 E.00968
G1 X91.713 Y93.994 E.14292
G1 X94.244 Y98.423 E.15675
G1 X94.381 Y98.194 E.0082
G1 X94.463 Y98.185 E.00254
G1 X94.867 Y98.729 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.596574
G1 F11378.96
G1 X94.73 Y99.09 E.01741
G1 X95.118 Y99.752 E.03464
G1 X95.513 Y100.046 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.61656
G1 F10982.498
G2 X95.519 Y100.16 I-.032 J.059 E.01329
G1 X95.306 Y100.735 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.400854
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X97.253 Y100.735 E.10013
M106 S127.5
G1 X128.48 Y134.549 F30000
M106 S255
G1 F3000
G1 X114.862 Y134.549 E.70024
G1 X115.119 Y135 E.0267
G1 X127.525 Y135 E.63787
G2 X127.141 Y135.451 I2.405 J2.433 E.03047
G1 X115.377 Y135.451 E.60491
G1 X115.635 Y135.902 E.0267
G1 X126.867 Y135.902 E.57756
G1 X126.673 Y136.353 E.02523
G1 X115.892 Y136.353 E.55435
G1 X116.15 Y136.803 E.0267
G1 X126.547 Y136.803 E.53462
G2 X126.49 Y137.254 I2.238 J.514 E.02341
G1 X116.407 Y137.254 E.51842
G1 X116.665 Y137.705 E.0267
G1 X126.478 Y137.705 E.50458
G1 X126.478 Y138.156 E.02318
G1 X116.923 Y138.156 E.49133
G1 X117.18 Y138.607 E.0267
G1 X126.478 Y138.607 E.47809
G1 X126.478 Y139.058 E.02318
G1 X117.438 Y139.058 E.46484
G1 X117.696 Y139.509 E.0267
G1 X126.478 Y139.509 E.45159
G1 X126.478 Y139.959 E.02318
G1 X117.953 Y139.959 E.43835
G1 X118.211 Y140.41 E.0267
G1 X126.478 Y140.41 E.4251
G1 X126.478 Y140.861 E.02318
G1 X118.468 Y140.861 E.41185
G1 X118.726 Y141.312 E.0267
G1 X126.478 Y141.312 E.3986
G1 X126.478 Y141.763 E.02318
G1 X118.984 Y141.763 E.38536
G1 X119.241 Y142.214 E.0267
G1 X126.478 Y142.214 E.37211
G1 X126.478 Y142.665 E.02318
G1 X119.499 Y142.665 E.35886
G1 X119.757 Y143.115 E.0267
G1 X126.478 Y143.115 E.34562
G1 X126.478 Y143.566 E.02318
G1 X120.014 Y143.566 E.33237
G1 X120.272 Y144.017 E.0267
G1 X126.478 Y144.017 E.31912
G1 X126.478 Y144.468 E.02318
G1 X120.53 Y144.468 E.30588
G1 X120.787 Y144.919 E.0267
G1 X126.478 Y144.919 E.29263
G1 X126.478 Y145.37 E.02318
G1 X121.045 Y145.37 E.27938
G1 X121.302 Y145.82 E.0267
G1 X126.478 Y145.82 E.26613
G1 X126.478 Y146.271 E.02318
G1 X121.56 Y146.271 E.25289
G1 X121.818 Y146.722 E.0267
G1 X126.478 Y146.722 E.23964
G1 X126.478 Y147.173 E.02318
G1 X122.075 Y147.173 E.22639
G1 X122.333 Y147.624 E.0267
G1 X126.478 Y147.624 E.21315
G1 X126.478 Y148.075 E.02318
G1 X122.591 Y148.075 E.1999
G1 X122.848 Y148.526 E.0267
G1 X126.478 Y148.526 E.18665
G1 X126.478 Y148.976 E.02318
G1 X123.106 Y148.976 E.1734
G1 X123.363 Y149.427 E.0267
G1 X126.478 Y149.427 E.16016
G1 X126.478 Y149.878 E.02318
G1 X123.621 Y149.878 E.14691
G1 X123.879 Y150.329 E.0267
G1 X126.478 Y150.329 E.13366
G2 X126.491 Y150.78 I4.469 J.094 E.0232
G1 X124.136 Y150.78 E.1211
G1 X124.394 Y151.231 E.0267
G1 X126.552 Y151.231 E.11098
G1 X126.62 Y151.682 E.02344
G1 X124.652 Y151.682 E.10123
G1 X124.909 Y152.132 E.0267
G1 X126.893 Y152.132 E.102
M106 S127.5
G1 X126.535 Y152.48 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.405096
; LAYER_HEIGHT: 0.2
G1 F15000
G1 X125.358 Y152.889 E.03675
G1 X125.573 Y153.263 E.01274
G1 X126.488 Y152.518 E.03484
G1 X127.775 Y152.959 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.406972
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X126.59 Y152.959 E.06282
G1 X126.029 Y153.416 E.03835
G1 X128.419 Y153.416 E.12667
M106 S127.5
M106 S216.75
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X126.419 Y153.416 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/88
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
G3 Z3 I1.21 J.131 P1  F30000
G1 X128.44 Y134.762 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.704 Y134.627 E.00982
G3 X129.92 Y134.349 I1.299 J2.875 E.04166
G3 X133.152 Y137.493 I.071 J3.16 E.16652
G1 X133.152 Y150.507 E.43173
G3 X126.848 Y150.507 I-3.152 J-.008 E.32794
G1 X126.848 Y137.491 E.43178
G3 X128.388 Y134.792 I3.154 J.011 E.10779
G1 X128.628 Y135.106 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.865 Y134.985 E.00817
G3 X129.931 Y134.741 I1.137 J2.517 E.03381
G3 X132.76 Y137.497 I.061 J2.767 E.13516
G1 X132.76 Y150.503 E.39961
G3 X127.24 Y150.503 I-2.76 J-.003 E.26622
G1 X127.24 Y137.497 E.39963
G3 X128.577 Y135.136 I2.762 J.005 E.08714
M204 S10000
; WIPE_START
G1 F24000
G1 X128.865 Y134.985 E-.12381
G1 X129.121 Y134.884 E-.10455
G1 X129.386 Y134.809 E-.10455
G1 X129.657 Y134.761 E-.10456
G1 X129.931 Y134.741 E-.10438
G1 X130.206 Y134.748 E-.10474
G1 X130.479 Y134.782 E-.10456
G1 X130.502 Y134.787 E-.00885
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I.956 J-.753 P1  F30000
G1 X98.719 Y94.432 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X99.004 Y94.512 E.00982
G3 X97.921 Y94.349 I-1.004 J2.988 E.62041
G1 X98.079 Y94.349 E.00521
G3 X98.661 Y94.418 I-.079 J3.151 E.01947
G1 X98.53 Y94.794 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X98.614 Y94.809 E.00263
G3 X97.931 Y94.741 I-.614 J2.69 E.51164
G1 X98.069 Y94.741 E.00423
G3 X98.343 Y94.761 I-.069 J2.759 E.00846
G1 X98.471 Y94.784 E.00399
M204 S10000
; WIPE_START
G1 F24000
G1 X98.614 Y94.809 E-.05527
G1 X98.879 Y94.884 E-.10456
G1 X99.135 Y94.984 E-.10456
G1 X99.38 Y95.11 E-.10456
G1 X99.611 Y95.259 E-.10456
G1 X99.826 Y95.431 E-.10456
G1 X100.023 Y95.623 E-.10456
G1 X100.154 Y95.779 E-.07737
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.044 J1.216 P1  F30000
G1 X165.092 Y98.107 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X165.089 Y98.124 E.0006
G3 X161.921 Y94.349 I-3.089 J-.625 E.4692
G1 X162.079 Y94.349 E.00521
G3 X165.136 Y97.814 I-.079 J3.151 E.17206
G1 X165.101 Y98.047 E.00783
G1 X164.705 Y98.046 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X164.705 Y98.047 E.00003
G3 X161.931 Y94.741 I-2.705 J-.547 E.38055
G1 X162.069 Y94.741 E.00423
G3 X164.746 Y97.775 I-.069 J2.759 E.13955
G1 X164.714 Y97.987 E.00659
M204 S10000
; WIPE_START
G1 F24000
G1 X164.705 Y98.047 E-.02307
G1 X164.637 Y98.314 E-.10454
G1 X164.543 Y98.572 E-.10457
G1 X164.424 Y98.82 E-.10456
G1 X164.28 Y99.055 E-.10455
G1 X164.114 Y99.274 E-.10456
G1 X163.927 Y99.476 E-.10456
G1 X163.721 Y99.658 E-.10456
G1 X163.71 Y99.666 E-.00502
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-1.07 J-.58 P1  F30000
G1 X130 Y161.786 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X91.037 Y93.602 E2.60503
G1 X168.963 Y93.602 E2.58492
G1 X133.477 Y155.701 E2.37254
G1 X130.03 Y161.734 E.2305
G1 X130 Y162.577 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X90.362 Y93.21 E2.4549
G1 X169.638 Y93.21 E2.43594
G1 X133.818 Y155.896 E2.21846
G1 X130.03 Y162.525 E.23459
M204 S10000
; WIPE_START
G1 F24000
G1 X129.036 Y160.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.2 I-.28 J1.184 P1  F30000
G1 X129.709 Y160.948 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421112
G1 F15000
G1 X130.61 Y160.047 E.03926
G1 X131.323 Y158.799 E.0443
G1 X129.639 Y160.483 E.0734
G1 X129.445 Y160.143 E.01208
G1 X132.036 Y157.551 E.11296
G1 X132.749 Y156.303 E.0443
G1 X129.25 Y159.803 E.15251
G1 X129.056 Y159.462 E.01208
G1 X133.463 Y155.055 E.19207
G1 X134.176 Y153.807 E.0443
G1 X128.861 Y159.122 E.23162
G1 X128.667 Y158.781 E.01208
G1 X134.889 Y152.559 E.27118
G1 X135.602 Y151.311 E.0443
G1 X128.472 Y158.441 E.31074
G1 X128.278 Y158.101 E.01208
G1 X136.315 Y150.063 E.35029
G1 X137.028 Y148.815 E.0443
G1 X128.083 Y157.76 E.38985
G1 X127.889 Y157.42 E.01208
G1 X137.741 Y147.567 E.42941
G1 X138.454 Y146.319 E.0443
G1 X133.36 Y151.414 E.22203
G2 X133.473 Y150.766 I-3.599 J-.96 E.02028
G1 X139.168 Y145.071 E.2482
G1 X139.881 Y143.823 E.0443
G1 X133.485 Y150.219 E.27873
G1 X133.485 Y149.684 E.01648
G1 X140.594 Y142.576 E.30981
G1 X141.307 Y141.328 E.0443
G1 X133.485 Y149.149 E.34089
M73 P49 R13
G1 X133.485 Y148.614 E.01648
G1 X142.02 Y140.08 E.37197
G1 X142.733 Y138.832 E.0443
G1 X133.485 Y148.08 E.40305
G1 X133.485 Y147.545 E.01648
G1 X143.446 Y137.584 E.43413
G1 X144.159 Y136.336 E.0443
G1 X133.485 Y147.01 E.46521
G1 X133.485 Y146.475 E.01648
G1 X144.873 Y135.088 E.49629
G1 X145.586 Y133.84 E.0443
G1 X133.485 Y145.94 E.52737
G1 X133.485 Y145.405 E.01648
G1 X146.299 Y132.592 E.55845
G1 X147.012 Y131.344 E.0443
G1 X133.485 Y144.87 E.58953
G1 X133.485 Y144.336 E.01648
G1 X147.725 Y130.096 E.62061
G1 X148.438 Y128.848 E.0443
G1 X133.485 Y143.801 E.65169
G1 X133.485 Y143.266 E.01648
G1 X149.151 Y127.6 E.68277
G1 X149.864 Y126.352 E.0443
G1 X133.485 Y142.731 E.71385
G1 X133.485 Y142.196 E.01648
G1 X150.578 Y125.104 E.74493
G1 X151.291 Y123.856 E.0443
G1 X133.485 Y141.661 E.77601
G1 X133.485 Y141.127 E.01648
G1 X152.004 Y122.608 E.80709
G1 X152.717 Y121.36 E.0443
G1 X133.485 Y140.592 E.83817
G1 X133.485 Y140.057 E.01648
G1 X153.43 Y120.112 E.86925
G1 X154.143 Y118.864 E.0443
G1 X133.485 Y139.522 E.90033
G1 X133.485 Y138.987 E.01648
G1 X154.856 Y117.616 E.93141
G1 X155.569 Y116.368 E.0443
G1 X133.485 Y138.452 E.96249
G1 X133.485 Y137.917 E.01648
G1 X156.283 Y115.12 E.99357
G1 X156.996 Y113.872 E.0443
G1 X133.48 Y137.388 E1.02487
G2 X133.431 Y136.902 I-2.464 J.007 E.01506
G1 X157.709 Y112.624 E1.05811
G1 X158.422 Y111.376 E.0443
G1 X133.33 Y136.469 E1.0936
G2 X133.181 Y136.082 I-2.006 J.547 E.01278
G1 X159.135 Y110.128 E1.13114
G1 X159.848 Y108.88 E.0443
G1 X132.999 Y135.73 E1.17019
G2 X132.784 Y135.41 I-1.708 J.911 E.0119
G1 X160.561 Y107.632 E1.21061
G1 X161.274 Y106.384 E.0443
G1 X132.54 Y135.119 E1.25233
G2 X132.267 Y134.857 I-1.444 J1.234 E.01168
G1 X161.988 Y105.136 E1.29532
G1 X162.701 Y103.888 E.0443
G1 X131.965 Y134.625 E1.33957
G2 X131.632 Y134.422 I-1.177 J1.56 E.01202
G1 X163.414 Y102.641 E1.38514
G1 X164.127 Y101.393 E.0443
G1 X131.267 Y134.253 E1.43215
G2 X130.86 Y134.125 I-.842 J1.971 E.01317
G1 X164.852 Y100.124 E1.48168
G1 X164.525 Y99.925 E.0118
G1 X130.408 Y134.042 E1.48693
G2 X129.899 Y134.016 I-.502 J4.81 E.01571
G1 X163.11 Y100.804 E1.44746
G3 X162.42 Y100.96 I-1.4 J-4.605 E.02181
G1 X129.29 Y134.09 E1.4439
G1 X129.22 Y134.102 E.00219
G2 X128.478 Y134.367 I.686 J3.092 E.02434
G1 X161.866 Y100.979 E1.45514
G3 X161.381 Y100.93 I.256 J-4.912 E.01504
G1 X119.526 Y142.785 E1.82417
G1 X119.72 Y143.125 E.01208
G1 X126.877 Y135.969 E.3119
G2 X126.587 Y136.793 I2.587 J1.371 E.02702
G1 X119.915 Y143.465 E.29081
G1 X120.109 Y143.806 E.01208
G1 X126.519 Y137.396 E.27936
G2 X126.515 Y137.935 I5.311 J.313 E.01663
G1 X120.304 Y144.146 E.27069
G1 X120.498 Y144.487 E.01208
G1 X126.515 Y138.47 E.26222
G1 X126.515 Y139.005 E.01648
G1 X120.693 Y144.827 E.25374
G1 X120.887 Y145.167 E.01208
G1 X126.515 Y139.54 E.24527
G1 X126.515 Y140.075 E.01648
G1 X121.082 Y145.508 E.23679
G1 X121.276 Y145.848 E.01208
G1 X126.515 Y140.609 E.22831
G1 X126.515 Y141.144 E.01648
G1 X121.471 Y146.188 E.21984
G1 X121.665 Y146.529 E.01208
G1 X126.515 Y141.679 E.21136
G1 X126.515 Y142.214 E.01648
G1 X121.86 Y146.869 E.20288
G1 X122.054 Y147.209 E.01208
G1 X126.515 Y142.749 E.19441
G1 X126.515 Y143.284 E.01648
G1 X122.249 Y147.55 E.18593
G1 X122.443 Y147.89 E.01208
G1 X126.515 Y143.818 E.17745
G1 X126.515 Y144.353 E.01648
G1 X122.638 Y148.23 E.16898
G1 X122.832 Y148.571 E.01208
G1 X126.515 Y144.888 E.1605
G1 X126.515 Y145.423 E.01648
G1 X123.027 Y148.911 E.15202
G1 X123.221 Y149.252 E.01208
G1 X126.515 Y145.958 E.14355
G1 X126.515 Y146.493 E.01648
G1 X123.415 Y149.592 E.13507
G1 X123.61 Y149.932 E.01208
G1 X126.515 Y147.028 E.1266
G1 X126.515 Y147.562 E.01648
G1 X123.804 Y150.273 E.11812
G1 X123.999 Y150.613 E.01208
G1 X126.515 Y148.097 E.10964
G1 X126.515 Y148.632 E.01648
G1 X124.193 Y150.953 E.10117
G1 X124.388 Y151.294 E.01208
G1 X126.515 Y149.167 E.09269
G1 X126.515 Y149.702 E.01648
G1 X124.582 Y151.634 E.08421
G1 X124.777 Y151.974 E.01208
G1 X126.515 Y150.237 E.07574
G2 X126.527 Y150.759 I5.178 J.14 E.01612
G1 X124.971 Y152.315 E.0678
G1 X125.166 Y152.655 E.01208
G1 X126.593 Y151.228 E.06219
G2 X126.711 Y151.644 I2.139 J-.385 E.01336
G1 X125.36 Y152.995 E.05888
G1 X125.555 Y153.336 E.01208
G1 X126.869 Y152.022 E.05726
G2 X127.06 Y152.366 I1.813 J-.784 E.01214
G1 X125.749 Y153.676 E.05712
G1 X125.944 Y154.016 E.01208
G1 X127.282 Y152.678 E.05833
G2 X127.534 Y152.961 I1.54 J-1.117 E.01169
G1 X126.138 Y154.357 E.06083
G1 X126.333 Y154.697 E.01208
G1 X127.815 Y153.215 E.06459
G2 X128.126 Y153.438 I6.143 J-8.238 E.01181
G1 X126.527 Y155.038 E.06969
G1 X126.722 Y155.378 E.01208
G1 X128.47 Y153.629 E.07621
G2 X128.849 Y153.786 I.972 J-1.812 E.01264
G1 X126.916 Y155.718 E.08421
G1 X127.111 Y156.059 E.01208
G1 X129.266 Y153.904 E.09392
G2 X129.729 Y153.975 I.588 J-2.281 E.01448
G1 X127.305 Y156.399 E.10565
G1 X127.5 Y156.739 E.01208
G1 X130.272 Y153.967 E.12083
G2 X130.911 Y153.863 I-.094 J-2.599 E.01998
G1 X127.57 Y157.204 E.1456
G1 X119.207 Y142.569 F30000
G1 F15000
G1 X160.954 Y100.821 E1.81947
G3 X160.568 Y100.673 I.547 J-2.006 E.01278
G1 X119.137 Y142.104 E1.80568
G1 X118.942 Y141.764 E.01208
G1 X160.216 Y100.49 E1.79883
G3 X159.896 Y100.275 I.914 J-1.706 E.0119
G1 X118.748 Y141.423 E1.79336
G1 X118.553 Y141.083 E.01208
G1 X159.606 Y100.031 E1.78919
G3 X159.345 Y99.757 I1.238 J-1.442 E.01168
G1 X118.359 Y140.743 E1.78629
G1 X118.164 Y140.402 E.01208
G1 X159.113 Y99.453 E1.78468
G3 X158.915 Y99.117 I1.579 J-1.161 E.01205
G1 X117.97 Y140.062 E1.78449
G1 X117.775 Y139.722 E.01208
G1 X158.749 Y98.748 E1.78576
G3 X158.621 Y98.341 I1.97 J-.842 E.01317
G1 X117.581 Y139.381 E1.78867
G1 X117.386 Y139.041 E.01208
G1 X158.538 Y97.889 E1.7935
G3 X158.524 Y97.368 I3.403 J-.348 E.01609
G1 X117.192 Y138.7 E1.8014
G1 X116.997 Y138.36 E.01208
G1 X158.598 Y96.76 E1.81306
G3 X158.888 Y95.934 I2.678 J.479 E.02709
G1 X116.803 Y138.02 E1.8342
G1 X116.608 Y137.679 E.01208
G1 X160.352 Y93.935 E1.9065
G1 X159.818 Y93.935 E.01648
G1 X116.414 Y137.339 E1.89167
G1 X116.219 Y136.999 E.01208
G1 X159.283 Y93.935 E1.87683
G1 X158.748 Y93.935 E.01648
G1 X116.025 Y136.658 E1.862
G1 X115.83 Y136.318 E.01208
G1 X158.213 Y93.935 E1.84717
G1 X157.678 Y93.935 E.01648
G1 X115.636 Y135.978 E1.83233
G1 X115.441 Y135.637 E.01208
G1 X157.143 Y93.935 E1.8175
G1 X156.609 Y93.935 E.01648
G1 X115.247 Y135.297 E1.80266
G1 X115.052 Y134.957 E.01208
G1 X156.074 Y93.935 E1.78783
G1 X155.539 Y93.935 E.01648
G1 X114.858 Y134.616 E1.773
G1 X114.663 Y134.276 E.01208
G1 X155.004 Y93.935 E1.75816
G1 X154.469 Y93.935 E.01648
G1 X114.469 Y133.936 E1.74333
G1 X114.275 Y133.595 E.01208
G1 X153.934 Y93.935 E1.7285
G1 X153.399 Y93.935 E.01648
G1 X114.08 Y133.255 E1.71366
G1 X113.886 Y132.914 E.01208
G1 X152.865 Y93.935 E1.69883
G1 X152.33 Y93.935 E.01648
G1 X113.691 Y132.574 E1.68399
G1 X113.497 Y132.234 E.01208
G1 X151.795 Y93.935 E1.66916
G1 X151.26 Y93.935 E.01648
G1 X113.302 Y131.893 E1.65433
G1 X113.108 Y131.553 E.01208
G1 X150.725 Y93.935 E1.63949
G1 X150.19 Y93.935 E.01648
G1 X139.741 Y104.385 E.45543
G1 X139.741 Y103.85 E.01648
G1 X149.656 Y93.935 E.43212
G1 X149.121 Y93.935 E.01648
G1 X139.741 Y103.315 E.40881
G1 X139.741 Y102.78 E.01648
G1 X148.586 Y93.935 E.3855
G1 X148.051 Y93.935 E.01648
G1 X139.741 Y102.246 E.36219
G1 X139.741 Y101.711 E.01648
G1 X147.516 Y93.935 E.33888
G1 X146.981 Y93.935 E.01648
G1 X139.741 Y101.176 E.31557
M73 P50 R13
G1 X139.741 Y100.641 E.01648
G1 X146.447 Y93.935 E.29226
G1 X145.912 Y93.935 E.01648
G1 X139.741 Y100.106 E.26895
G1 X139.741 Y99.571 E.01648
G1 X145.377 Y93.935 E.24564
G1 X144.842 Y93.935 E.01648
G1 X139.741 Y99.037 E.22233
G1 X139.741 Y98.502 E.01648
G1 X144.307 Y93.935 E.19902
G1 X143.772 Y93.935 E.01648
G1 X139.741 Y97.967 E.17571
G1 X139.741 Y97.432 E.01648
G1 X143.237 Y93.935 E.1524
G1 X142.703 Y93.935 E.01648
G1 X139.741 Y96.897 E.12909
G1 X139.741 Y96.362 E.01648
G1 X142.168 Y93.935 E.10578
G1 X141.633 Y93.935 E.01648
G1 X139.741 Y95.827 E.08247
G1 X139.741 Y95.293 E.01648
G1 X141.098 Y93.935 E.05916
G1 X140.563 Y93.935 E.01648
G1 X139.741 Y94.758 E.03585
G1 X139.741 Y94.223 E.01648
G1 X140.198 Y93.766 E.01993
G1 X139.349 Y101.671 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X139.349 Y103.299 E.05401
G1 X138.651 Y103.997 E.03271
G1 X138.651 Y98.271 E.18992
G1 X139.349 Y98.969 E.03271
G1 X139.349 Y95.623 E.11097
G1 X138.379 Y96.594 E.04551
G1 X138.24 Y96.455 E.00649
G1 X137.885 Y96.455 E.01177
G2 X137.667 Y96.349 I-.238 J.211 E.00827
G1 X136.729 Y96.349 E.03112
G1 X134.33 Y93.95 E.11251
G1 X133.346 Y93.95 E.03265
G1 X130.947 Y96.349 E.11251
G1 X129.053 Y96.349 E.06286
G1 X126.654 Y93.95 E.11251
G1 X125.67 Y93.95 E.03265
G1 X123.271 Y96.349 E.11251
G1 X122.333 Y96.349 E.03112
G3 X121.76 Y96.455 I-.417 J-.647 E.01984
G1 X121.621 Y96.594 E.00649
G1 X120.651 Y95.623 E.04551
G1 X120.651 Y98.969 E.11097
G1 X121.349 Y98.271 E.03271
G1 X121.349 Y103.997 E.18992
G1 X120.651 Y103.299 E.03271
G1 X120.651 Y101.671 E.05401
G1 X121.571 Y97.417 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421112
G1 F15000
G1 X122.141 Y96.847 E.02483
G1 X122.277 Y96.847 E.0042
G3 X122.411 Y96.741 I.196 J.109 E.00541
G1 X122.782 Y96.741 E.01143
G1 X121.741 Y97.782 E.04539
G1 X121.741 Y98.317 E.01648
G1 X123.317 Y96.741 E.0687
G1 X123.852 Y96.741 E.01648
G1 X121.741 Y98.852 E.09201
G1 X121.741 Y99.387 E.01648
G1 X124.387 Y96.741 E.11532
G1 X124.922 Y96.741 E.01648
G1 X121.741 Y99.922 E.13863
G1 X121.741 Y100.456 E.01648
G1 X125.456 Y96.741 E.16194
G1 X125.991 Y96.741 E.01648
G1 X121.741 Y100.991 E.18525
G1 X121.741 Y101.526 E.01648
G1 X126.526 Y96.741 E.20856
G1 X127.061 Y96.741 E.01648
G1 X121.741 Y102.061 E.23187
G1 X121.741 Y102.596 E.01648
G1 X127.596 Y96.741 E.25518
G1 X128.131 Y96.741 E.01648
G1 X121.741 Y103.131 E.27849
G1 X121.741 Y103.665 E.01648
G1 X128.665 Y96.741 E.3018
G1 X129.2 Y96.741 E.01648
G1 X121.741 Y104.2 E.32511
G1 X121.741 Y104.735 E.01648
G1 X129.735 Y96.741 E.34842
G1 X130.27 Y96.741 E.01648
G1 X106.689 Y120.321 E1.02771
G1 X106.884 Y120.662 E.01208
G1 X130.805 Y96.741 E1.04255
G1 X131.34 Y96.741 E.01648
G1 X107.078 Y121.002 E1.05738
G1 X107.273 Y121.342 E.01208
G1 X131.875 Y96.741 E1.07221
G1 X132.409 Y96.741 E.01648
G1 X107.467 Y121.683 E1.08705
G1 X107.662 Y122.023 E.01208
G1 X132.944 Y96.741 E1.10188
G1 X133.479 Y96.741 E.01648
G1 X107.856 Y122.363 E1.11671
G1 X108.051 Y122.704 E.01208
G1 X134.014 Y96.741 E1.13155
G1 X134.549 Y96.741 E.01648
G1 X108.245 Y123.044 E1.14638
G1 X108.44 Y123.384 E.01208
G1 X135.084 Y96.741 E1.16121
G1 X135.618 Y96.741 E.01648
G1 X108.634 Y123.725 E1.17605
G1 X108.829 Y124.065 E.01208
G1 X136.153 Y96.741 E1.19088
G1 X136.688 Y96.741 E.01648
G1 X109.023 Y124.406 E1.20572
G1 X109.218 Y124.746 E.01208
G1 X137.223 Y96.741 E1.22055
G1 X137.589 Y96.741 E.01127
G3 X137.687 Y96.812 I-.036 J.154 E.00383
G1 X109.412 Y125.086 E1.2323
G1 X109.607 Y125.427 E.01208
G1 X138.132 Y96.901 E1.24321
G1 X138.153 Y96.922 E.00091
G1 X138.153 Y97.277 E.01094
G1 X138.222 Y97.346 E.00301
G1 X109.801 Y125.767 E1.23866
G1 X109.996 Y126.107 E.01208
G1 X138.259 Y97.844 E1.23181
G1 X138.259 Y98.379 E.01648
G1 X110.19 Y126.448 E1.22333
G1 X110.385 Y126.788 E.01208
G1 X138.259 Y98.914 E1.21486
G1 X138.259 Y99.448 E.01648
G1 X110.579 Y127.128 E1.20638
G1 X110.774 Y127.469 E.01208
G1 X138.259 Y99.983 E1.1979
G1 X138.259 Y100.518 E.01648
G1 X110.968 Y127.809 E1.18943
G1 X111.163 Y128.149 E.01208
G1 X138.259 Y101.053 E1.18095
G1 X138.259 Y101.588 E.01648
G1 X111.357 Y128.49 E1.17247
G1 X111.552 Y128.83 E.01208
G1 X138.259 Y102.123 E1.164
G1 X138.259 Y102.657 E.01648
G1 X111.746 Y129.171 E1.15552
G1 X111.941 Y129.511 E.01208
G1 X138.259 Y103.192 E1.14704
G1 X138.259 Y103.727 E.01648
G1 X112.135 Y129.851 E1.13857
G1 X112.33 Y130.192 E.01208
G1 X138.259 Y104.262 E1.13009
G1 X138.259 Y104.797 E.01648
G1 X112.524 Y130.532 E1.12162
G1 X112.719 Y130.872 E.01208
G1 X138.35 Y105.241 E1.1171
G1 X138.885 Y105.241 E.01648
G1 X112.789 Y131.337 E1.13735
G1 X106.371 Y120.105 F30000
G1 F15000
G1 X121.235 Y105.241 E.64784
M73 P50 R12
G1 X120.7 Y105.241 E.01648
G1 X106.3 Y119.641 E.62759
G1 X106.106 Y119.3 E.01208
G1 X120.259 Y105.147 E.61684
G1 X120.259 Y104.612 E.01648
G1 X105.911 Y118.96 E.62532
G1 X105.717 Y118.62 E.01208
G1 X120.259 Y104.077 E.6338
G1 X120.259 Y103.542 E.01648
G1 X105.523 Y118.279 E.64227
G1 X105.328 Y117.939 E.01208
G1 X120.259 Y103.008 E.65075
G1 X120.259 Y102.473 E.01648
G1 X105.134 Y117.598 E.65922
G1 X104.939 Y117.258 E.01208
G1 X120.259 Y101.938 E.6677
G1 X120.259 Y101.403 E.01648
G1 X104.745 Y116.918 E.67618
G1 X104.55 Y116.577 E.01208
G1 X120.259 Y100.868 E.68465
G1 X120.259 Y100.333 E.01648
G1 X104.356 Y116.237 E.69313
G1 X104.161 Y115.897 E.01208
G1 X120.259 Y99.799 E.70161
G1 X120.259 Y99.264 E.01648
G1 X103.967 Y115.556 E.71008
G1 X103.772 Y115.216 E.01208
G1 X120.259 Y98.729 E.71856
G1 X120.259 Y98.194 E.01648
G1 X103.578 Y114.876 E.72704
G1 X103.383 Y114.535 E.01208
G1 X120.259 Y97.659 E.73551
G1 X120.259 Y97.124 E.01648
G1 X103.189 Y114.195 E.74399
G1 X102.994 Y113.855 E.01208
G1 X120.259 Y96.589 E.75246
G1 X120.259 Y96.055 E.01648
G1 X102.8 Y113.514 E.76094
G1 X102.605 Y113.174 E.01208
G1 X120.259 Y95.52 E.76942
G1 X120.259 Y94.985 E.01648
G1 X102.411 Y112.833 E.77789
G1 X102.216 Y112.493 E.01208
G1 X120.259 Y94.45 E.78637
G1 X120.259 Y93.935 E.01586
G1 X120.239 Y93.935 E.00062
G1 X102.022 Y112.153 E.79397
G1 X101.827 Y111.812 E.01208
G1 X119.704 Y93.935 E.77914
G1 X119.169 Y93.935 E.01648
G1 X101.633 Y111.472 E.7643
G1 X101.438 Y111.132 E.01208
G1 X118.635 Y93.935 E.74947
G1 X118.1 Y93.935 E.01648
G1 X101.244 Y110.791 E.73464
G1 X101.049 Y110.451 E.01208
G1 X117.565 Y93.935 E.7198
G1 X117.03 Y93.935 E.01648
G1 X100.855 Y110.111 E.70497
G1 X100.66 Y109.77 E.01208
G1 X116.495 Y93.935 E.69013
G1 X115.96 Y93.935 E.01648
G1 X100.466 Y109.43 E.6753
G1 X100.271 Y109.09 E.01208
G1 X115.426 Y93.935 E.66047
G1 X114.891 Y93.935 E.01648
G1 X100.077 Y108.749 E.64563
G1 X99.882 Y108.409 E.01208
G1 X114.356 Y93.935 E.6308
G1 X113.821 Y93.935 E.01648
G1 X99.688 Y108.068 E.61597
G1 X99.493 Y107.728 E.01208
G1 X113.286 Y93.935 E.60113
G1 X112.751 Y93.935 E.01648
G1 X99.299 Y107.388 E.5863
G1 X99.104 Y107.047 E.01208
G1 X112.216 Y93.935 E.57147
G1 X111.682 Y93.935 E.01648
M73 P51 R12
G1 X98.91 Y106.707 E.55663
G1 X98.715 Y106.367 E.01208
G1 X111.147 Y93.935 E.5418
G1 X110.612 Y93.935 E.01648
G1 X98.521 Y106.026 E.52696
G1 X98.326 Y105.686 E.01208
G1 X110.077 Y93.935 E.51213
G1 X109.542 Y93.935 E.01648
G1 X98.132 Y105.346 E.4973
G1 X97.937 Y105.005 E.01208
G1 X109.007 Y93.935 E.48246
G1 X108.473 Y93.935 E.01648
G1 X97.743 Y104.665 E.46763
G1 X97.548 Y104.325 E.01208
G1 X107.938 Y93.935 E.4528
G1 X107.403 Y93.935 E.01648
G1 X97.354 Y103.984 E.43796
G1 X97.159 Y103.644 E.01208
G1 X106.868 Y93.935 E.42313
G1 X106.333 Y93.935 E.01648
G1 X96.965 Y103.304 E.40829
G1 X96.771 Y102.963 E.01208
G1 X98.867 Y100.867 E.09136
G3 X98.228 Y100.971 I-.666 J-2.068 E.02003
G1 X96.576 Y102.623 E.07198
G1 X96.382 Y102.282 E.01208
G1 X97.698 Y100.966 E.05738
G3 X97.23 Y100.899 I.031 J-1.902 E.01462
G1 X96.187 Y101.942 E.04544
G1 X95.993 Y101.602 E.01208
G1 X96.819 Y100.775 E.03602
G1 X96.443 Y100.617 E.01258
G1 X95.798 Y101.261 E.0281
G1 X95.604 Y100.921 E.01208
G1 X96.107 Y100.418 E.02194
G3 X95.795 Y100.195 I.733 J-1.356 E.01185
G1 X95.409 Y100.581 E.01682
G1 X95.215 Y100.24 E.01208
G1 X95.635 Y99.82 E.01833
G1 X95.118 Y99.752 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.596573
G1 F11378.978
G1 X94.73 Y99.09 E.03464
G1 X94.867 Y98.729 E.01741
G1 X93.852 Y95.155 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.59987
G1 F11311.608
G2 X93.857 Y95.267 I-.031 J.058 E.01245
G1 X93.886 Y96.276 F30000
; LINE_WIDTH: 0.419999
G1 F15000
G3 X94.618 Y94.85 I4.288 J1.299 E.04954
G1 X94.707 Y94.748 E.00415
G1 X93.013 Y94.748 E.05207
G1 X93.856 Y96.224 E.05223
G1 X94.083 Y97.379 F30000
G1 F15000
G1 X94.189 Y96.585 E.02462
G3 X95.642 Y94.371 I3.942 J1.003 E.08288
G1 X92.363 Y94.371 E.10075
G2 X94.053 Y97.328 I219.362 J-123.43 E.10463
G1 X94.522 Y98.179 F30000
G1 F15000
G1 X94.46 Y97.351 E.02553
G1 X94.562 Y96.641 E.02203
G3 X95.918 Y94.632 I3.575 J.951 E.07588
G1 X96.305 Y94.413 E.01367
G1 X96.231 Y94.282 E.00462
G3 X96.364 Y93.994 I.608 J.108 E.00986
G1 X91.713 Y93.994 E.14292
G1 X94.244 Y98.423 E.15675
G1 X94.381 Y98.194 E.0082
G1 X94.463 Y98.185 E.00254
G1 X96.888 Y94.328 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.443473
G1 F15000
G1 X97.042 Y94.075 E.00964
; LINE_WIDTH: 0.480656
G1 F14392.242
G1 X97.066 Y94.037 E.00162
G1 X97.2 Y94.02 E.00484
; LINE_WIDTH: 0.438328
G1 F15000
G1 X97.378 Y94.002 E.00576
; LINE_WIDTH: 0.410916
G1 X97.555 Y93.989 E.00533
; LINE_WIDTH: 0.387197
G1 X98.259 Y93.98 E.01975
; LINE_WIDTH: 0.420467
G1 X98.612 Y94.001 E.01086
; LINE_WIDTH: 0.467959
G1 F14822.199
G1 X98.789 Y94.019 E.00616
; LINE_WIDTH: 0.49959
G1 F13795.539
G1 X98.934 Y94.037 E.00544
G1 X98.946 Y94.056 E.00084
; LINE_WIDTH: 0.443443
G1 F15000
G1 X98.958 Y94.075 E.00074
; LINE_WIDTH: 0.421758
G1 X99.112 Y94.328 E.00911
G1 X99.364 Y94.486 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421112
G1 F15000
G1 X99.915 Y93.935 E.02402
G1 X100.45 Y93.935 E.01648
G1 X99.839 Y94.546 E.02662
G1 X100.157 Y94.763 E.01186
G1 X100.985 Y93.935 E.03607
G1 X101.52 Y93.935 E.01648
G1 X100.442 Y95.013 E.04696
G1 X100.693 Y95.297 E.01168
G1 X102.054 Y93.935 E.05934
G1 X102.589 Y93.935 E.01648
G1 X100.921 Y95.604 E.07271
G3 X101.111 Y95.948 I-1.279 J.932 E.01216
G1 X103.124 Y93.935 E.08772
G1 X103.659 Y93.935 E.01648
G1 X101.275 Y96.319 E.10389
G3 X101.392 Y96.737 I-1.61 J.675 E.01341
G1 X104.194 Y93.935 E.12211
G1 X104.729 Y93.935 E.01648
G1 X101.464 Y97.2 E.14227
G3 X101.474 Y97.724 I-2.117 J.303 E.01621
G1 X105.264 Y93.935 E.16514
G1 X105.798 Y93.935 E.01648
G1 X101.123 Y98.61 E.20375
G1 X160.888 Y94.328 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.443473
G1 F15000
G1 X161.042 Y94.075 E.00964
; LINE_WIDTH: 0.480656
G1 F14392.242
G1 X161.066 Y94.037 E.00162
G1 X161.2 Y94.02 E.00484
; LINE_WIDTH: 0.438328
G1 F15000
G1 X161.378 Y94.002 E.00576
; LINE_WIDTH: 0.410914
G1 X161.555 Y93.989 E.00533
; LINE_WIDTH: 0.387197
G1 X162.259 Y93.98 E.01975
; LINE_WIDTH: 0.420465
G1 X162.612 Y94.001 E.01086
; LINE_WIDTH: 0.467961
G1 F14822.126
G1 X162.789 Y94.019 E.00616
; LINE_WIDTH: 0.49959
G1 F13795.525
G1 X162.934 Y94.037 E.00544
G1 X162.946 Y94.056 E.00084
; LINE_WIDTH: 0.443455
G1 F15000
G1 X162.958 Y94.075 E.00074
; LINE_WIDTH: 0.421767
G1 X163.112 Y94.328 E.00911
G1 X165.458 Y98.185 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F15000
G1 X165.619 Y98.198 E.00495
G1 X165.752 Y98.43 E.00821
G1 X168.287 Y93.994 E.15697
G2 X163.629 Y93.996 I-2.216 J288.145 E.14314
G1 X163.76 Y94.284 E.00973
G1 X163.698 Y94.397 E.00395
G1 X164.195 Y94.718 E.01818
G1 X164.703 Y95.208 E.02168
G1 X165.103 Y95.789 E.02168
G1 X165.381 Y96.438 E.02168
G1 X165.524 Y97.129 E.02168
G1 X165.528 Y97.834 E.02168
G1 X165.47 Y98.126 E.00914
G1 X165.905 Y97.402 F30000
G1 F15000
G1 X167.637 Y94.371 E.10727
G1 X164.353 Y94.371 E.1009
G1 X164.966 Y94.938 E.02564
G1 X165.415 Y95.576 E.02398
G1 X165.728 Y96.291 E.02398
G1 X165.894 Y97.054 E.02398
G1 X165.903 Y97.342 E.00887
G1 X166.116 Y96.274 F30000
G1 F15000
G1 X166.987 Y94.748 E.05399
G1 X165.297 Y94.748 E.05195
G1 X165.726 Y95.364 E.02307
G1 X166.098 Y96.217 E.02858
G1 X166.217 Y95.155 F30000
; LINE_WIDTH: 0.59996
G1 F11309.781
G2 X166.222 Y95.267 I-.031 J.058 E.01246
G1 X165.133 Y98.729 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.585714
G1 F11606.616
G1 X165.27 Y99.09 E.01707
G1 X164.882 Y99.752 E.03396
M106 S188.7
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X165.27 Y99.09 E-.50576
G1 X165.133 Y98.729 E-.25424
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/88
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
G3 Z3.2 I-.859 J-.862 P1  F30000
G1 X128.654 Y135.092 Z3.2
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X128.865 Y134.985 E.00727
G3 X129.931 Y134.741 I1.137 J2.517 E.03382
G3 X132.76 Y137.497 I.061 J2.767 E.13515
G1 X132.76 Y150.503 E.39961
G3 X127.24 Y150.503 I-2.76 J-.003 E.26622
G1 X127.24 Y137.497 E.39962
G3 X128.602 Y135.121 I2.762 J.005 E.08805
M204 S10000
; WIPE_START
G1 F24000
G1 X128.865 Y134.985 E-.11264
G1 X129.121 Y134.884 E-.10454
G1 X129.386 Y134.809 E-.10456
G1 X129.657 Y134.761 E-.10456
G1 X129.931 Y134.741 E-.10449
G1 X130.206 Y134.748 E-.10463
G1 X130.479 Y134.782 E-.10456
G1 X130.531 Y134.794 E-.02002
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.217 J-.022 P1  F30000
G1 X130 Y105.422 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X128.578 Y105.422 E.04718
G1 X128.578 Y104.078 E.04459
G1 X131.422 Y104.078 E.09434
G1 X131.422 Y105.422 E.0446
G1 X130.06 Y105.422 E.04518
; WIPE_START
G1 F24000
G1 X128.578 Y105.422 E-.56324
G1 X128.578 Y104.904 E-.19676
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.066 J1.215 P1  F30000
G1 X138.078 Y105.422 Z3.4
G1 Z3
G1 E.8 F1800
G1 F15476.087
G1 X138.078 Y96.922 E.28196
G1 X121.922 Y96.922 E.53591
G1 X121.922 Y105.422 E.28196
G1 X120.078 Y105.422 E.06118
G1 X120.078 Y93.602 E.3921
G1 X139.922 Y93.602 E.65828
G1 X139.922 Y105.422 E.3921
G1 X138.138 Y105.422 E.05919
; WIPE_START
G1 F24000
G1 X138.124 Y103.422 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.241 J1.193 P1  F30000
G1 X164.706 Y98.046 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X164.705 Y98.047 E.00004
G3 X161.931 Y94.741 I-2.705 J-.547 E.38055
G1 X162.069 Y94.741 E.00423
G3 X164.756 Y97.637 I-.069 J2.759 E.13532
G1 X164.713 Y97.986 E.01079
M204 S10000
; WIPE_START
G1 F24000
G1 X164.705 Y98.047 E-.02331
G1 X164.637 Y98.314 E-.10455
G1 X164.543 Y98.572 E-.10456
G1 X164.424 Y98.82 E-.10456
G1 X164.28 Y99.055 E-.10456
G1 X164.114 Y99.274 E-.10456
G1 X163.927 Y99.476 E-.10456
G1 X163.721 Y99.658 E-.10456
G1 X163.711 Y99.665 E-.00479
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.091 J-1.214 P1  F30000
G1 X98.517 Y94.792 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X98.614 Y94.809 E.00305
G3 X97.931 Y94.741 I-.614 J2.69 E.51164
G1 X98.069 Y94.741 E.00423
G3 X98.343 Y94.761 I-.069 J2.759 E.00846
G1 X98.457 Y94.782 E.00356
M204 S10000
; WIPE_START
G1 F24000
G1 X98.614 Y94.809 E-.06048
G1 X98.879 Y94.884 E-.10456
G1 X99.135 Y94.984 E-.10456
G1 X99.38 Y95.11 E-.10456
G1 X99.611 Y95.259 E-.10456
G1 X99.826 Y95.431 E-.10456
G1 X100.023 Y95.623 E-.10456
G1 X100.145 Y95.768 E-.07216
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.111 J.497 P1  F30000
G1 X130 Y162.577 Z3.4
G1 Z3
G1 E.8 F1800
M204 S5000
G1 F12000
G1 X90.362 Y93.21 E2.4549
G1 X169.638 Y93.21 E2.43594
G1 X130.03 Y162.525 E2.45305
M204 S10000
; WIPE_START
G1 F24000
G1 X129.036 Y160.789 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.217 J.033 P1  F30000
G1 X130.564 Y104.3 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X131.2 Y104.936 E.02762
G1 X130.93 Y105.2
G1 X130.031 Y104.3 E.03909
G1 X129.497 Y104.3
G1 X130.397 Y105.2 E.03909
G1 X129.864 Y105.2
G1 X128.964 Y104.3 E.03909
G1 X128.8 Y104.67
G1 X129.33 Y105.2 E.02304
M204 S10000
; WIPE_START
G1 F24000
G1 X128.8 Y104.67 E-.28498
G1 X128.964 Y104.3 E-.15353
G1 X129.562 Y104.899 E-.32149
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.026 J-1.217 P1  F30000
G1 X120.426 Y104.702 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X120.426 Y103.074 E.05401
G1 X121.574 Y104.222 E.05385
G1 X121.574 Y98.046 E.20486
G1 X120.426 Y99.194 E.05385
G1 X120.426 Y95.398 E.12592
G1 X121.602 Y96.574 E.05516
G1 X123.046 Y96.574 E.04791
G1 X125.67 Y93.95 E.12308
G1 X126.654 Y93.95 E.03265
G1 X129.278 Y96.574 E.12308
G1 X130.722 Y96.574 E.04791
G1 X133.346 Y93.95 E.12308
G1 X134.33 Y93.95 E.03265
G1 X136.954 Y96.574 E.12308
G1 X138.398 Y96.574 E.04791
G1 X139.574 Y95.398 E.05516
G1 X139.574 Y99.194 E.12592
G1 X138.426 Y98.046 E.05385
G1 X138.426 Y104.222 E.20486
G1 X139.574 Y103.074 E.05385
G1 X139.574 Y104.702 E.05401
; WIPE_START
G1 F24000
G1 X139.574 Y103.074 E-.61876
G1 X139.311 Y103.337 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.389 J1.153 P1  F30000
G1 X168.742 Y93.417 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F12000
G1 X169.085 Y93.76 E.0149
G1 X168.891 Y94.1
G1 X168.209 Y93.417 E.02965
G1 X167.675 Y93.417
G1 X168.697 Y94.439 E.04439
G1 X168.503 Y94.778
G1 X167.142 Y93.417 E.05914
G1 X166.609 Y93.417
G1 X168.309 Y95.118 E.07389
G1 X168.115 Y95.457
G1 X166.076 Y93.417 E.08863
G1 X165.542 Y93.417
G1 X167.921 Y95.796 E.10338
G1 X167.727 Y96.136
G1 X165.009 Y93.417 E.11812
G1 X164.476 Y93.417
G1 X167.534 Y96.475 E.13287
G1 X167.34 Y96.814
G1 X163.943 Y93.417 E.14762
G1 X163.409 Y93.417
G1 X167.146 Y97.154 E.16236
G1 X166.952 Y97.493
G1 X162.876 Y93.417 E.17711
G1 X162.343 Y93.417
G1 X166.758 Y97.832 E.19186
G1 X166.564 Y98.172
G1 X164.73 Y96.338 E.07967
G1 X164.937 Y97.078
G1 X166.37 Y98.511 E.06227
G1 X166.176 Y98.851
G1 X164.964 Y97.639 E.05267
G1 X164.903 Y98.111
G1 X165.982 Y99.19 E.04688
G1 X165.788 Y99.529
G1 X164.784 Y98.525 E.04362
G1 X164.619 Y98.894
G1 X165.594 Y99.869 E.04237
G1 X165.4 Y100.208
G1 X164.415 Y99.223 E.04281
G1 X164.176 Y99.517
G1 X165.207 Y100.547 E.04476
G1 X165.013 Y100.887
G1 X163.902 Y99.776 E.04825
G1 X163.595 Y100.002
G1 X164.819 Y101.226 E.05319
G1 X164.625 Y101.565
G1 X163.25 Y100.191 E.05974
G1 X162.864 Y100.338
G1 X164.431 Y101.905 E.06808
G1 X164.237 Y102.244
G1 X162.428 Y100.436 E.07859
G1 X161.926 Y100.467
G1 X164.043 Y102.583 E.09199
G1 X163.849 Y102.923
G1 X161.312 Y100.386 E.11023
G1 X160.377 Y99.984
G1 X163.655 Y103.262 E.14246
M204 S10000
; WIPE_START
G1 F24000
G1 X162.241 Y101.848 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.215 J-.062 P1  F30000
G1 X161.809 Y93.417 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X163.163 Y94.771 E.05881
G1 X162.422 Y94.564
G1 X161.276 Y93.417 E.04981
G1 X160.743 Y93.417
G1 X161.862 Y94.537 E.04863
G1 X161.389 Y94.597
G1 X160.21 Y93.417 E.05125
G1 X159.676 Y93.417
G1 X160.975 Y94.716 E.05643
G1 X160.607 Y94.881
G1 X159.143 Y93.417 E.06359
G1 X158.61 Y93.417
G1 X160.277 Y95.084 E.07244
G1 X159.983 Y95.324
G1 X158.077 Y93.417 E.08286
G1 X157.543 Y93.417
G1 X159.723 Y95.597 E.09472
G1 X159.498 Y95.906
G1 X157.01 Y93.417 E.10812
G1 X156.477 Y93.417
G1 X159.309 Y96.25 E.12309
G1 X159.161 Y96.635
G1 X155.943 Y93.417 E.13984
G1 X155.41 Y93.417
G1 X159.064 Y97.071 E.15877
G1 X159.034 Y97.575
G1 X154.877 Y93.417 E.18066
G1 X154.344 Y93.417
G1 X159.114 Y98.188 E.2073
G1 X159.518 Y99.125
G1 X153.81 Y93.417 E.24802
G1 X153.277 Y93.417
G1 X163.461 Y103.602 E.44255
G1 X163.267 Y103.941
G1 X152.744 Y93.417 E.4573
G1 X152.211 Y93.417
G1 X163.073 Y104.28 E.47204
G1 X162.88 Y104.62
G1 X151.677 Y93.417 E.48679
G1 X151.144 Y93.417
G1 X162.686 Y104.959 E.50154
G1 X162.492 Y105.298
G1 X150.611 Y93.417 E.51628
G1 X150.078 Y93.417
G1 X162.298 Y105.638 E.53103
G1 X162.104 Y105.977
G1 X149.544 Y93.417 E.54578
G1 X149.011 Y93.417
G1 X161.91 Y106.316 E.56052
G1 X161.716 Y106.656
G1 X148.478 Y93.417 E.57527
G1 X147.944 Y93.417
G1 X161.522 Y106.995 E.59001
G1 X161.328 Y107.334
G1 X147.411 Y93.417 E.60476
G1 X146.878 Y93.417
G1 X161.134 Y107.674 E.61951
G1 X160.94 Y108.013
G1 X146.345 Y93.417 E.63425
G1 X145.811 Y93.417
G1 X160.746 Y108.352 E.649
G1 X160.553 Y108.692
G1 X145.278 Y93.417 E.66375
G1 X144.745 Y93.417
G1 X160.359 Y109.031 E.67849
G1 X160.165 Y109.371
G1 X144.212 Y93.417 E.69324
G1 X143.678 Y93.417
M73 P52 R12
G1 X159.971 Y109.71 E.70799
G1 X159.777 Y110.049
G1 X143.145 Y93.417 E.72273
G1 X142.612 Y93.417
G1 X159.583 Y110.389 E.73748
G1 X159.389 Y110.728
G1 X142.078 Y93.417 E.75223
G1 X141.545 Y93.417
G1 X159.195 Y111.067 E.76697
G1 X159.001 Y111.407
G1 X141.012 Y93.417 E.78172
G1 X140.479 Y93.417
G1 X158.807 Y111.746 E.79647
G1 X158.613 Y112.085
G1 X140.145 Y93.617 E.80256
G1 X140.145 Y94.15
G1 X158.419 Y112.425 E.79413
G1 X158.226 Y112.764
G1 X140.145 Y94.683 E.7857
G1 X140.145 Y95.216
G1 X158.032 Y113.103 E.77728
G1 X157.838 Y113.443
G1 X140.145 Y95.75 E.76885
G1 X140.145 Y96.283
G1 X157.644 Y113.782 E.76042
G1 X157.45 Y114.121
G1 X140.145 Y96.816 E.752
G1 X140.145 Y97.35
G1 X157.256 Y114.461 E.74357
G1 X157.062 Y114.8
G1 X140.145 Y97.883 E.73514
G1 X140.145 Y98.416
G1 X156.868 Y115.14 E.72672
G1 X156.674 Y115.479
G1 X140.145 Y98.949 E.71829
G1 X140.145 Y99.483
G1 X156.48 Y115.818 E.70986
G1 X156.286 Y116.158
G1 X140.145 Y100.016 E.70144
G1 X140.145 Y100.549
G1 X156.092 Y116.497 E.69301
G1 X155.899 Y116.836
G1 X140.145 Y101.082 E.68458
G1 X140.145 Y101.616
G1 X155.705 Y117.176 E.67616
G1 X155.511 Y117.515
G1 X140.145 Y102.149 E.66773
G1 X140.145 Y102.682
G1 X155.317 Y117.854 E.6593
G1 X155.123 Y118.194
G1 X140.145 Y103.215 E.65088
G1 X140.145 Y103.749
G1 X154.929 Y118.533 E.64245
G1 X154.735 Y118.872
G1 X140.145 Y104.282 E.63402
G1 X140.145 Y104.815
G1 X154.541 Y119.212 E.6256
G1 X154.347 Y119.551
G1 X140.145 Y105.349 E.61717
G1 X139.907 Y105.645
G1 X154.153 Y119.89 E.61905
G1 X153.959 Y120.23
G1 X139.374 Y105.645 E.6338
G1 X138.841 Y105.645
G1 X153.765 Y120.569 E.64855
G1 X153.572 Y120.909
G1 X138.308 Y105.645 E.66329
M204 S10000
G1 X137.855 Y97.727 F30000
M204 S2000
G1 F12000
G1 X137.273 Y97.145 E.02529
G1 X136.74 Y97.145
G1 X137.855 Y98.26 E.04846
G1 X137.855 Y98.793
G1 X136.207 Y97.145 E.07164
G1 X135.674 Y97.145
G1 X137.855 Y99.326 E.09481
G1 X137.855 Y99.86
G1 X135.14 Y97.145 E.11798
G1 X134.607 Y97.145
G1 X137.855 Y100.393 E.14116
G1 X137.855 Y100.926
G1 X134.074 Y97.145 E.16433
G1 X133.54 Y97.145
G1 X137.855 Y101.46 E.1875
G1 X137.855 Y101.993
G1 X133.007 Y97.145 E.21068
G1 X132.474 Y97.145
G1 X137.855 Y102.526 E.23385
G1 X137.855 Y103.059
G1 X131.941 Y97.145 E.25702
G1 X131.407 Y97.145
G1 X137.855 Y103.593 E.2802
G1 X137.855 Y104.126
G1 X130.874 Y97.145 E.30337
G1 X130.341 Y97.145
G1 X137.855 Y104.659 E.32654
G1 X137.855 Y105.192
G1 X129.808 Y97.145 E.34972
G1 X129.274 Y97.145
G1 X153.378 Y121.248 E1.0474
G1 X153.184 Y121.587
G1 X128.741 Y97.145 E1.06215
G1 X128.208 Y97.145
G1 X152.99 Y121.927 E1.0769
G1 X152.796 Y122.266
G1 X127.675 Y97.145 E1.09164
G1 X127.141 Y97.145
G1 X152.602 Y122.605 E1.10639
G1 X152.408 Y122.945
G1 X126.608 Y97.145 E1.12114
G1 X126.075 Y97.145
G1 X152.214 Y123.284 E1.13588
G1 X152.02 Y123.623
G1 X125.541 Y97.145 E1.15063
G1 X125.008 Y97.145
G1 X151.826 Y123.963 E1.16538
G1 X151.632 Y124.302
G1 X131.644 Y104.314 E.86858
G1 X131.644 Y104.847
G1 X151.438 Y124.641 E.86015
G1 X151.245 Y124.981
G1 X131.644 Y105.381 E.85172
G1 X131.375 Y105.645
G1 X151.051 Y125.32 E.855
G1 X150.857 Y125.66
G1 X130.842 Y105.645 E.86974
G1 X130.309 Y105.645
G1 X150.663 Y125.999 E.88449
G1 X150.469 Y126.338
G1 X129.775 Y105.645 E.89924
G1 X129.242 Y105.645
G1 X150.275 Y126.678 E.91398
G1 X150.081 Y127.017
G1 X128.709 Y105.645 E.92873
M204 S10000
G1 X131.186 Y103.855 F30000
M204 S2000
G1 F12000
G1 X124.475 Y97.145 E.29162
G1 X123.942 Y97.145
G1 X130.652 Y103.855 E.29162
G1 X130.119 Y103.855
G1 X123.408 Y97.145 E.29162
G1 X122.875 Y97.145
G1 X129.586 Y103.855 E.29162
G1 X129.053 Y103.855
G1 X122.405 Y97.208 E.28888
G1 X122.145 Y97.481
G1 X128.519 Y103.856 E.27702
G1 X128.355 Y104.225
G1 X122.145 Y98.014 E.26989
G1 X122.145 Y98.547
G1 X128.355 Y104.758 E.26989
G1 X128.355 Y105.291
G1 X122.145 Y99.081 E.26989
G1 X122.145 Y99.614
G1 X149.887 Y127.356 E1.20555
G1 X149.693 Y127.696
G1 X122.145 Y100.147 E1.19712
G1 X122.145 Y100.68
G1 X149.499 Y128.035 E1.18869
G1 X149.305 Y128.374
G1 X122.145 Y101.214 E1.18027
G1 X122.145 Y101.747
M73 P53 R12
G1 X149.111 Y128.714 E1.17184
G1 X148.918 Y129.053
G1 X122.145 Y102.28 E1.16341
G1 X122.145 Y102.813
G1 X148.724 Y129.392 E1.15499
G1 X148.53 Y129.732
G1 X122.145 Y103.347 E1.14656
G1 X122.145 Y103.88
G1 X148.336 Y130.071 E1.13813
G1 X148.142 Y130.41
G1 X122.145 Y104.413 E1.12971
G1 X122.145 Y104.946
G1 X147.948 Y130.75 E1.12128
G1 X147.754 Y131.089
G1 X122.145 Y105.48 E1.11285
G1 X121.776 Y105.645
G1 X147.56 Y131.429 E1.12044
G1 X147.366 Y131.768
G1 X121.243 Y105.645 E1.13518
G1 X120.71 Y105.645
G1 X147.172 Y132.107 E1.14993
G1 X146.978 Y132.447
G1 X120.176 Y105.645 E1.16468
M204 S10000
G1 X119.855 Y94.125 F30000
M204 S2000
G1 F12000
G1 X119.148 Y93.417 E.03075
G1 X118.615 Y93.417
G1 X119.855 Y94.658 E.05392
G1 X119.855 Y95.191
G1 X118.081 Y93.417 E.07709
G1 X117.548 Y93.417
G1 X119.855 Y95.725 E.10027
G1 X119.855 Y96.258
G1 X117.015 Y93.417 E.12344
G1 X116.481 Y93.417
G1 X119.855 Y96.791 E.14661
G1 X119.855 Y97.325
G1 X115.948 Y93.417 E.16978
G1 X115.415 Y93.417
G1 X119.855 Y97.858 E.19296
G1 X119.855 Y98.391
G1 X114.882 Y93.417 E.21613
G1 X114.348 Y93.417
G1 X119.855 Y98.924 E.2393
G1 X119.855 Y99.458
G1 X113.815 Y93.417 E.26248
G1 X113.282 Y93.417
G1 X119.855 Y99.991 E.28565
G1 X119.855 Y100.524
G1 X112.749 Y93.417 E.30882
G1 X112.215 Y93.417
G1 X119.855 Y101.057 E.332
G1 X119.855 Y101.591
G1 X111.682 Y93.417 E.35517
G1 X111.149 Y93.417
G1 X119.855 Y102.124 E.37834
G1 X119.855 Y102.657
G1 X110.616 Y93.417 E.40152
G1 X110.082 Y93.417
G1 X119.855 Y103.191 E.42469
G1 X119.855 Y103.724
G1 X109.549 Y93.417 E.44786
G1 X109.016 Y93.417
G1 X119.855 Y104.257 E.47104
G1 X119.855 Y104.79
G1 X108.482 Y93.417 E.49421
G1 X107.949 Y93.417
G1 X119.855 Y105.324 E.51738
M204 S10000
; WIPE_START
G1 F24000
G1 X118.441 Y103.909 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.839 J-.882 P1  F30000
G1 X107.416 Y93.417 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X146.784 Y132.786 E1.71075
G1 X146.591 Y133.125
G1 X106.883 Y93.417 E1.7255
G1 X106.349 Y93.417
G1 X146.397 Y133.465 E1.74025
G1 X146.203 Y133.804
G1 X105.816 Y93.417 E1.75499
G1 X105.283 Y93.417
G1 X146.009 Y134.143 E1.76974
G1 X145.815 Y134.483
G1 X104.75 Y93.417 E1.78449
G1 X104.216 Y93.417
G1 X145.621 Y134.822 E1.79923
G1 X145.427 Y135.161
G1 X103.683 Y93.417 E1.81398
G1 X103.15 Y93.417
G1 X145.233 Y135.501 E1.82873
G1 X145.039 Y135.84
G1 X102.616 Y93.417 E1.84347
G1 X102.083 Y93.417
G1 X144.845 Y136.179 E1.85822
G1 X144.651 Y136.519
G1 X101.55 Y93.417 E1.87297
G1 X101.017 Y93.417
G1 X144.457 Y136.858 E1.88771
G1 X144.264 Y137.198
G1 X100.483 Y93.417 E1.90246
G1 X99.95 Y93.417
G1 X144.07 Y137.537 E1.91721
G1 X143.876 Y137.876
G1 X99.417 Y93.417 E1.93195
G1 X98.884 Y93.417
G1 X143.682 Y138.216 E1.9467
G1 X143.488 Y138.555
G1 X98.35 Y93.417 E1.96145
G1 X97.817 Y93.417
G1 X99.176 Y94.776 E.05905
G1 X98.431 Y94.565
G1 X97.284 Y93.417 E.04986
G1 X96.75 Y93.417
G1 X97.869 Y94.536 E.04862
G1 X97.395 Y94.596
G1 X96.217 Y93.417 E.0512
G1 X95.684 Y93.417
G1 X96.981 Y94.714 E.05635
G1 X96.611 Y94.878
G1 X95.151 Y93.417 E.06348
G1 X94.617 Y93.417
G1 X96.281 Y95.081 E.0723
G1 X95.987 Y95.321
G1 X94.084 Y93.417 E.0827
G1 X93.551 Y93.417
G1 X95.726 Y95.593 E.09454
G1 X95.501 Y95.901
G1 X93.018 Y93.417 E.10792
G1 X92.484 Y93.417
G1 X95.312 Y96.245 E.12286
G1 X95.163 Y96.629
G1 X91.951 Y93.417 E.13958
G1 X91.418 Y93.417
G1 X95.065 Y97.064 E.15848
G1 X95.034 Y97.567
G1 X90.885 Y93.417 E.18032
G1 X91.21 Y94.276
G1 X95.112 Y98.178 E.16956
G1 X95.504 Y99.103
G1 X91.921 Y95.52 E.15571
M204 S10000
; WIPE_START
M73 P54 R12
G1 F24000
G1 X93.335 Y96.935 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.1 J1.213 P1  F30000
G1 X100.724 Y96.325 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X143.294 Y138.894 E1.84986
G1 X143.1 Y139.234
G1 X100.936 Y97.069 E1.83224
G1 X100.964 Y97.631
G1 X142.906 Y139.573 E1.82258
G1 X142.712 Y139.912
G1 X100.905 Y98.105 E1.81673
G1 X100.787 Y98.52
G1 X142.518 Y140.252 E1.81344
G1 X142.324 Y140.591
G1 X100.622 Y98.889 E1.81218
G1 X100.418 Y99.218
G1 X142.13 Y140.93 E1.81259
G1 X141.937 Y141.27
G1 X100.18 Y99.513 E1.81453
G1 X99.906 Y99.773
G1 X141.743 Y141.609 E1.81799
G1 X141.549 Y141.948
G1 X99.599 Y99.999 E1.8229
G1 X99.255 Y100.188
G1 X141.355 Y142.288 E1.82943
G1 X141.161 Y142.627
G1 X98.87 Y100.336 E1.83775
G1 X98.435 Y100.435
G1 X140.967 Y142.967 E1.84822
G1 X140.773 Y143.306
G1 X97.934 Y100.467 E1.86158
G1 X97.323 Y100.389
G1 X140.579 Y143.645 E1.8797
G1 X140.385 Y143.985
G1 X132.723 Y136.323 E.33294
G1 X132.936 Y137.068
G1 X140.191 Y144.324 E.31529
G1 X139.997 Y144.663
G1 X132.967 Y137.633 E.30549
G1 X132.967 Y138.167
G1 X139.803 Y145.003 E.29706
G1 X139.61 Y145.342
G1 X132.967 Y138.7 E.28863
G1 X132.967 Y139.233
G1 X139.416 Y145.681 E.28021
G1 X139.222 Y146.021
G1 X132.967 Y139.766 E.27178
G1 X132.967 Y140.3
G1 X139.028 Y146.36 E.26335
G1 X138.834 Y146.699
G1 X132.967 Y140.833 E.25493
G1 X132.967 Y141.366
G1 X138.64 Y147.039 E.2465
G1 X138.446 Y147.378
G1 X132.967 Y141.9 E.23807
G1 X132.967 Y142.433
G1 X138.252 Y147.718 E.22965
G1 X138.058 Y148.057
G1 X132.967 Y142.966 E.22122
M73 P54 R11
G1 X132.967 Y143.499
G1 X137.864 Y148.396 E.21279
G1 X137.67 Y148.736
G1 X132.967 Y144.033 E.20437
G1 X132.967 Y144.566
G1 X137.476 Y149.075 E.19594
G1 X137.283 Y149.414
G1 X132.967 Y145.099 E.18751
G1 X132.967 Y145.632
G1 X137.089 Y149.754 E.17909
G1 X136.895 Y150.093
G1 X132.967 Y146.166 E.17066
G1 X132.967 Y146.699
G1 X136.701 Y150.432 E.16223
G1 X136.507 Y150.772
G1 X132.967 Y147.232 E.15381
G1 X132.967 Y147.765
G1 X136.313 Y151.111 E.14538
G1 X136.119 Y151.45
G1 X132.967 Y148.299 E.13695
G1 X132.967 Y148.832
G1 X135.925 Y151.79 E.12853
G1 X135.731 Y152.129
G1 X132.967 Y149.365 E.1201
G1 X132.967 Y149.899
G1 X135.537 Y152.468 E.11167
G1 X135.343 Y152.808
G1 X132.967 Y150.432 E.10325
G1 X132.936 Y150.933
G1 X135.149 Y153.147 E.09621
G1 X134.956 Y153.487
G1 X132.837 Y151.368 E.09204
G1 X132.689 Y151.753
G1 X134.762 Y153.826 E.09006
G1 X134.568 Y154.165
G1 X132.5 Y152.097 E.08986
G1 X132.275 Y152.406
G1 X134.374 Y154.505 E.09121
G1 X134.18 Y154.844
G1 X132.014 Y152.678 E.09412
G1 X131.72 Y152.918
G1 X133.986 Y155.183 E.09845
G1 X133.792 Y155.523
G1 X131.39 Y153.121 E.10437
G1 X131.021 Y153.285
G1 X133.598 Y155.862 E.11197
G1 X133.404 Y156.201
G1 X130.607 Y153.404 E.12156
G1 X130.133 Y153.464
G1 X133.21 Y156.541 E.13371
G1 X133.016 Y156.88
G1 X129.572 Y153.436 E.14968
G1 X128.829 Y153.226
G1 X132.822 Y157.219 E.17355
M204 S10000
; WIPE_START
G1 F24000
G1 X131.408 Y155.805 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.217 J-.013 P1  F30000
G1 X131.178 Y134.777 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X96.399 Y99.998 E1.51131
M204 S10000
; WIPE_START
G1 F24000
G1 X97.813 Y101.412 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.813 J-.906 P1  F30000
G1 X92.632 Y96.765 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X130.432 Y134.565 E1.64261
G1 X129.87 Y134.536
G1 X93.343 Y98.009 E1.58729
M204 S10000
; WIPE_START
G1 F24000
G1 X94.757 Y99.423 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X94.054 Y99.253 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
M73 P55 R11
G1 X129.396 Y134.595 E1.53579
G1 X128.981 Y134.714
G1 X94.765 Y100.498 E1.48686
M204 S10000
; WIPE_START
G1 F24000
G1 X96.179 Y101.912 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X95.476 Y101.742 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X128.612 Y134.878 E1.43992
G1 X128.282 Y135.081
G1 X96.187 Y102.986 E1.39467
M204 S10000
; WIPE_START
G1 F24000
G1 X97.601 Y104.4 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X96.898 Y104.23 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.988 Y135.32 E1.351
G1 X127.727 Y135.592
G1 X97.609 Y105.475 E1.30876
M204 S10000
; WIPE_START
G1 F24000
G1 X99.023 Y106.889 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X98.32 Y106.719 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.502 Y135.9 E1.26807
G1 X127.312 Y136.244
G1 X99.031 Y107.963 E1.22894
M204 S10000
; WIPE_START
G1 F24000
G1 X100.445 Y109.378 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X99.742 Y109.208 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.163 Y136.629 E1.19158
G1 X127.065 Y137.064
G1 X100.453 Y110.452 E1.1564
M204 S10000
; WIPE_START
G1 F24000
G1 X101.867 Y111.866 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X101.164 Y111.696 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.033 Y137.565 E1.1241
G1 X127.033 Y138.098
G1 X101.875 Y112.94 E1.09321
M204 S10000
; WIPE_START
G1 F24000
G1 X103.29 Y114.355 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X102.586 Y114.185 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.033 Y138.631 E1.06231
G1 X127.033 Y139.164
G1 X103.297 Y115.429 E1.03141
M204 S10000
; WIPE_START
G1 F24000
G1 X104.712 Y116.843 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X104.008 Y116.673 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.033 Y139.698 E1.00051
G1 X127.033 Y140.231
G1 X104.719 Y117.918 E.96962
M204 S10000
; WIPE_START
G1 F24000
G1 X106.134 Y119.332 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X105.43 Y119.162 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.033 Y140.764 E.93872
G1 X127.033 Y141.297
G1 X106.141 Y120.406 E.90782
M204 S10000
; WIPE_START
G1 F24000
G1 X107.556 Y121.82 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X106.852 Y121.651 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.033 Y141.831 E.87692
G1 X127.033 Y142.364
G1 X107.564 Y122.895 E.84603
M204 S10000
; WIPE_START
G1 F24000
G1 X108.978 Y124.309 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X108.275 Y124.139 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.033 Y142.897 E.81513
G1 X127.033 Y143.431
G1 X108.986 Y125.383 E.78423
M204 S10000
; WIPE_START
G1 F24000
G1 X110.4 Y126.798 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X109.697 Y126.628 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.033 Y143.964 E.75333
G1 X127.033 Y144.497
G1 X110.408 Y127.872 E.72244
M204 S10000
; WIPE_START
G1 F24000
G1 X111.822 Y129.286 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X111.119 Y129.116 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.033 Y145.03 E.69154
G1 X127.033 Y145.564
G1 X111.83 Y130.361 E.66064
M204 S10000
; WIPE_START
G1 F24000
G1 X113.244 Y131.775 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X112.541 Y131.605 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.033 Y146.097 E.62974
G1 X127.033 Y146.63
G1 X113.252 Y132.849 E.59885
M204 S10000
; WIPE_START
G1 F24000
G1 X114.666 Y134.263 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X113.963 Y134.094 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.033 Y147.163 E.56795
G1 X127.033 Y147.697
G1 X114.674 Y135.338 E.53705
M204 S10000
; WIPE_START
G1 F24000
G1 X116.088 Y136.752 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X115.385 Y136.582 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.033 Y148.23 E.50615
G1 X127.033 Y148.763
G1 X116.096 Y137.826 E.47526
M204 S10000
; WIPE_START
G1 F24000
G1 X117.51 Y139.241 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X116.807 Y139.071 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.033 Y149.296 E.44436
G1 X127.033 Y149.83
G1 X117.518 Y140.315 E.41346
M204 S10000
; WIPE_START
G1 F24000
G1 X118.932 Y141.729 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X118.229 Y141.559 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.033 Y150.363 E.38256
G1 X127.064 Y150.927
G1 X118.94 Y142.804 E.35302
M204 S10000
; WIPE_START
G1 F24000
G1 X120.354 Y144.218 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X119.651 Y144.048 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X127.274 Y151.67 E.33124
M204 S10000
; WIPE_START
G1 F24000
G1 X125.859 Y150.256 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.892 J.827 P1  F30000
G1 X132.629 Y157.559 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X120.362 Y145.292 E.53304
M204 S10000
; WIPE_START
G1 F24000
G1 X121.776 Y146.706 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X121.073 Y146.537 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X132.435 Y157.898 E.49372
G1 X132.241 Y158.237
G1 X121.784 Y147.781 E.45439
M204 S10000
; WIPE_START
G1 F24000
G1 X123.198 Y149.195 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X122.495 Y149.025 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X132.047 Y158.577 E.41507
G1 X131.853 Y158.916
G1 X123.206 Y150.269 E.37574
M204 S10000
; WIPE_START
G1 F24000
G1 X124.62 Y151.684 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X123.917 Y151.514 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X131.659 Y159.256 E.33642
G1 X131.465 Y159.595
G1 X124.628 Y152.758 E.2971
M204 S10000
; WIPE_START
G1 F24000
G1 X126.042 Y154.172 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X125.339 Y154.002 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X131.271 Y159.934 E.25777
G1 X131.077 Y160.274
G1 X126.05 Y155.247 E.21845
M204 S10000
; WIPE_START
G1 F24000
G1 X127.464 Y156.661 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X126.761 Y156.491 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
M73 P56 R11
G1 X130.883 Y160.613 E.17912
G1 X130.689 Y160.952
G1 X127.472 Y157.735 E.1398
M204 S10000
; WIPE_START
G1 F24000
G1 X128.886 Y159.149 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.286 J-1.183 P1  F30000
G1 X128.183 Y158.979 Z3.4
G1 Z3
G1 E.8 F1800
M204 S2000
G1 F12000
G1 X130.495 Y161.292 E.10047
G1 X130.302 Y161.631
G1 X128.894 Y160.224 E.06115
M204 S10000
; WIPE_START
G1 F24000
G1 X130.302 Y161.631 E-.75624
G1 X130.306 Y161.622 E-.00376
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.065 J-.589 P1  F30000
G1 X94.967 Y97.767 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.119564
G1 F15000
G1 X95.051 Y97.551 E.00145
G1 X95.056 Y97.833 F30000
; LINE_WIDTH: 0.0975702
G1 F15000
G1 X94.963 Y97.638 E.00096
; WIPE_START
G1 F24000
G1 X95.056 Y97.833 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.019 J.665 P1  F30000
G1 X97.152 Y94.618 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0961565
G1 F15000
G1 X97.018 Y94.702 E.00068
; WIPE_START
G1 F24000
G1 X97.152 Y94.618 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.204 J1.2 P1  F30000
G1 X98.063 Y94.463 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.10355
G1 F15000
G1 X97.851 Y94.554 E.00114
G1 X98.154 Y94.554 F30000
; LINE_WIDTH: 0.10665
G1 F15000
G1 X97.942 Y94.463 E.0012
; WIPE_START
G1 F24000
G1 X98.154 Y94.554 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.386 J1.154 P1  F30000
G1 X99.712 Y95.075 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0884108
G1 F15000
G1 X99.617 Y94.996 E.00046
; LINE_WIDTH: 0.107698
G1 X99.498 Y94.903 E.00079
; LINE_WIDTH: 0.14377
G1 X99.376 Y94.811 E.00125
; LINE_WIDTH: 0.186329
G1 X99.239 Y94.714 E.00197
; WIPE_START
G1 F24000
G1 X99.376 Y94.811 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.873 J.848 P1  F30000
G1 X100.786 Y96.263 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.211174
G1 F15000
G1 X100.643 Y96.062 E.00337
; LINE_WIDTH: 0.162186
G1 X100.55 Y95.941 E.00149
; LINE_WIDTH: 0.115836
G1 X100.426 Y95.789 E.00116
; WIPE_START
G1 F24000
G1 X100.55 Y95.941 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.099 J-.523 P1  F30000
G1 X98.413 Y100.435 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0994328
G1 F15000
G1 X98.249 Y100.515 E.00084
G1 X97.254 Y100.457 F30000
; LINE_WIDTH: 0.116872
G1 F15000
G1 X96.974 Y100.284 E.00198
G1 X97.258 Y100.453 F30000
; LINE_WIDTH: 0.192741
G1 F15000
G3 X96.972 Y100.287 I6.5 J-11.513 E.00404
; WIPE_START
G1 F24000
G1 X97.258 Y100.453 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.05 J.615 P1  F30000
G1 X127.567 Y152.201 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0902198
G1 F15000
G1 X127.45 Y152.057 E.00071
; LINE_WIDTH: 0.122783
G1 X127.358 Y151.937 E.00098
; LINE_WIDTH: 0.162853
G1 X127.268 Y151.814 E.0015
; LINE_WIDTH: 0.209187
G1 X127.212 Y151.732 E.00134
; WIPE_START
G1 F24000
G1 X127.268 Y151.814 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.854 J.867 P1  F30000
G1 X128.766 Y153.288 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.213069
G1 F15000
G1 X128.621 Y153.186 E.00246
; LINE_WIDTH: 0.182574
G1 X128.5 Y153.095 E.00172
; LINE_WIDTH: 0.139815
G1 X128.383 Y153.003 E.00118
; LINE_WIDTH: 0.10486
G1 X128.297 Y152.931 E.00057
; WIPE_START
G1 F24000
G1 X128.383 Y153.003 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.369 J1.16 P1  F30000
G1 X130.06 Y153.537 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.105696
G1 F15000
G1 X129.849 Y153.446 E.00118
G1 X130.151 Y153.446 F30000
; LINE_WIDTH: 0.104334
G1 F15000
G1 X129.939 Y153.537 E.00115
; WIPE_START
G1 F24000
G1 X130.151 Y153.446 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.213 J1.198 P1  F30000
G1 X130.984 Y153.298 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0943661
G1 F15000
G1 X130.851 Y153.381 E.00066
; WIPE_START
G1 F24000
G1 X130.984 Y153.298 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.21 J.128 P1  F30000
G1 X132.785 Y136.261 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.21159
G1 F15000
G1 X132.644 Y136.062 E.00336
; LINE_WIDTH: 0.162864
G1 X132.55 Y135.94 E.0015
; LINE_WIDTH: 0.116024
G1 X132.424 Y135.786 E.00119
; WIPE_START
G1 F24000
G1 X132.55 Y135.94 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.875 J-.846 P1  F30000
G1 X131.715 Y135.077 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0884148
G1 F15000
G1 X131.617 Y134.995 E.00047
; LINE_WIDTH: 0.108378
G1 X131.498 Y134.902 E.0008
; LINE_WIDTH: 0.144453
G1 X131.376 Y134.811 E.00126
; LINE_WIDTH: 0.187017
G1 X131.24 Y134.714 E.00196
G1 X130.643 Y134.509 F30000
; LINE_WIDTH: 0.143752
G1 F15000
G1 X130.418 Y134.58 E.00194
G1 X130.74 Y134.628 F30000
; LINE_WIDTH: 0.121304
G1 F15000
G1 X130.501 Y134.496 E.00175
G1 X129.578 Y134.511 F30000
; LINE_WIDTH: 0.114922
G1 F15000
G1 X129.421 Y134.593 E.00104
; WIPE_START
G1 F24000
G1 X129.578 Y134.511 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.908 J.81 P1  F30000
G1 X160.316 Y100.044 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.205436
G1 F15000
G1 X159.89 Y99.661 E.0076
G1 X159.457 Y99.186 E.00851
; WIPE_START
G1 F24000
G1 X159.89 Y99.661 E-.40157
G1 X160.316 Y100.044 E-.35843
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.046 J-.622 P1  F30000
G1 X158.967 Y97.774 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.122403
G1 F15000
G1 X159.051 Y97.559 E.0015
G1 X159.057 Y97.842 F30000
; LINE_WIDTH: 0.1017
G1 F15000
G3 X158.963 Y97.646 I8.015 J-3.949 E.00104
; WIPE_START
G1 F24000
G1 X159.057 Y97.842 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.021 J.662 P1  F30000
G1 X161.146 Y94.62 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0987655
G1 F15000
G1 X161.013 Y94.704 E.00072
; WIPE_START
G1 F24000
G1 X161.146 Y94.62 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.207 J1.199 P1  F30000
G1 X162.056 Y94.464 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.109222
G1 F15000
G1 X161.844 Y94.554 E.00124
G1 X162.146 Y94.554 F30000
; LINE_WIDTH: 0.100498
G1 F15000
G1 X161.935 Y94.464 E.00108
; WIPE_START
G1 F24000
G1 X162.146 Y94.554 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I.06 J-1.216 P1  F30000
G1 X140.408 Y93.488 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.151725
G1 F15000
G2 X140.126 Y93.448 I-.189 J.321 E.0026
; WIPE_START
G1 F24000
G1 X140.313 Y93.448 E-.49003
G1 X140.408 Y93.488 E-.26997
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.05 J-1.216 P1  F30000
G1 X91.982 Y95.459 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X91.856 Y95.295 E.00304
; LINE_WIDTH: 0.178141
G1 X91.73 Y95.13 E.00228
; LINE_WIDTH: 0.133156
G1 X91.604 Y94.965 E.00152
; WIPE_START
G1 F24000
G1 X91.73 Y95.13 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X92.693 Y96.704 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X92.567 Y96.539 E.00304
; LINE_WIDTH: 0.178141
G1 X92.441 Y96.374 E.00228
; LINE_WIDTH: 0.133156
G1 X92.316 Y96.209 E.00152
; WIPE_START
G1 F24000
G1 X92.441 Y96.374 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X93.404 Y97.948 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223126
G1 F15000
G1 X93.278 Y97.783 E.00304
; LINE_WIDTH: 0.178141
G1 X93.152 Y97.618 E.00228
; LINE_WIDTH: 0.133156
G1 X93.027 Y97.454 E.00152
; WIPE_START
G1 F24000
G1 X93.152 Y97.618 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X94.115 Y99.192 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X93.989 Y99.027 E.00304
; LINE_WIDTH: 0.178141
G1 X93.863 Y98.863 E.00228
; LINE_WIDTH: 0.133156
G1 X93.738 Y98.698 E.00152
; WIPE_START
G1 F24000
G1 X93.863 Y98.863 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.53 J1.096 P1  F30000
G1 X96.338 Y100.059 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.201474
G1 F15000
G1 X95.788 Y99.555 E.00964
G1 X95.503 Y99.237 E.00552
G1 X95.506 Y99.203 E.00044
; LINE_WIDTH: 0.185583
G1 X95.516 Y99.091 E.0013
; WIPE_START
G1 F24000
G1 X95.506 Y99.203 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.066 J-.587 P1  F30000
G1 X94.826 Y100.436 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223126
G1 F15000
G1 X94.7 Y100.272 E.00304
; LINE_WIDTH: 0.178141
G1 X94.574 Y100.107 E.00228
; LINE_WIDTH: 0.133156
G1 X94.449 Y99.942 E.00152
; WIPE_START
G1 F24000
G1 X94.574 Y100.107 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X95.537 Y101.681 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X95.411 Y101.516 E.00304
; LINE_WIDTH: 0.178141
G1 X95.285 Y101.351 E.00228
; LINE_WIDTH: 0.133156
G1 X95.16 Y101.187 E.00152
; WIPE_START
G1 F24000
G1 X95.285 Y101.351 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X96.248 Y102.925 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223126
G1 F15000
G1 X96.122 Y102.76 E.00304
; LINE_WIDTH: 0.178141
G1 X95.996 Y102.596 E.00228
; LINE_WIDTH: 0.133156
G1 X95.871 Y102.431 E.00152
; WIPE_START
G1 F24000
G1 X95.996 Y102.596 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X96.959 Y104.169 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X96.833 Y104.005 E.00304
; LINE_WIDTH: 0.178141
G1 X96.708 Y103.84 E.00228
; LINE_WIDTH: 0.133156
G1 X96.582 Y103.675 E.00152
; WIPE_START
G1 F24000
G1 X96.708 Y103.84 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X97.67 Y105.414 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X97.544 Y105.249 E.00304
; LINE_WIDTH: 0.178141
G1 X97.419 Y105.084 E.00228
; LINE_WIDTH: 0.133156
G1 X97.293 Y104.919 E.00152
; WIPE_START
G1 F24000
G1 X97.419 Y105.084 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X98.381 Y106.658 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X98.255 Y106.493 E.00304
; LINE_WIDTH: 0.178141
G1 X98.13 Y106.328 E.00228
; LINE_WIDTH: 0.133156
G1 X98.004 Y106.164 E.00152
; WIPE_START
G1 F24000
G1 X98.13 Y106.328 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X99.092 Y107.902 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X98.966 Y107.737 E.00304
; LINE_WIDTH: 0.178141
G1 X98.841 Y107.573 E.00228
; LINE_WIDTH: 0.133156
G1 X98.715 Y107.408 E.00152
; WIPE_START
G1 F24000
G1 X98.841 Y107.573 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X99.803 Y109.147 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X99.677 Y108.982 E.00304
; LINE_WIDTH: 0.178141
G1 X99.552 Y108.817 E.00228
; LINE_WIDTH: 0.133156
G1 X99.426 Y108.652 E.00152
; WIPE_START
G1 F24000
G1 X99.552 Y108.817 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X100.514 Y110.391 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X100.388 Y110.226 E.00304
; LINE_WIDTH: 0.178141
G1 X100.263 Y110.061 E.00228
; LINE_WIDTH: 0.133156
G1 X100.137 Y109.897 E.00152
; WIPE_START
G1 F24000
G1 X100.263 Y110.061 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X101.225 Y111.635 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X101.1 Y111.47 E.00304
; LINE_WIDTH: 0.178141
G1 X100.974 Y111.306 E.00228
; LINE_WIDTH: 0.133156
G1 X100.848 Y111.141 E.00152
; WIPE_START
G1 F24000
G1 X100.974 Y111.306 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X101.936 Y112.879 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X101.811 Y112.715 E.00304
; LINE_WIDTH: 0.178141
G1 X101.685 Y112.55 E.00228
; LINE_WIDTH: 0.133156
G1 X101.559 Y112.385 E.00152
; WIPE_START
G1 F24000
G1 X101.685 Y112.55 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X102.647 Y114.124 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223126
G1 F15000
G1 X102.522 Y113.959 E.00304
; LINE_WIDTH: 0.178141
G1 X102.396 Y113.794 E.00228
; LINE_WIDTH: 0.133156
G1 X102.27 Y113.629 E.00152
; WIPE_START
G1 F24000
G1 X102.396 Y113.794 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X103.358 Y115.368 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X103.233 Y115.203 E.00304
; LINE_WIDTH: 0.178141
G1 X103.107 Y115.039 E.00228
; LINE_WIDTH: 0.133156
G1 X102.981 Y114.874 E.00152
; WIPE_START
G1 F24000
G1 X103.107 Y115.039 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X104.069 Y116.612 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X103.944 Y116.448 E.00304
; LINE_WIDTH: 0.178141
G1 X103.818 Y116.283 E.00228
; LINE_WIDTH: 0.133156
G1 X103.692 Y116.118 E.00152
; WIPE_START
G1 F24000
G1 X103.818 Y116.283 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X104.78 Y117.857 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X104.655 Y117.692 E.00304
; LINE_WIDTH: 0.178141
G1 X104.529 Y117.527 E.00228
; LINE_WIDTH: 0.133156
G1 X104.403 Y117.362 E.00152
; WIPE_START
G1 F24000
G1 X104.529 Y117.527 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X105.491 Y119.101 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X105.366 Y118.936 E.00304
; LINE_WIDTH: 0.178142
G1 X105.24 Y118.771 E.00228
; LINE_WIDTH: 0.133156
G1 X105.114 Y118.607 E.00152
; WIPE_START
G1 F24000
G1 X105.24 Y118.771 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X106.203 Y120.345 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X106.077 Y120.18 E.00304
; LINE_WIDTH: 0.178142
G1 X105.951 Y120.016 E.00228
; LINE_WIDTH: 0.133156
G1 X105.825 Y119.851 E.00152
; WIPE_START
G1 F24000
G1 X105.951 Y120.016 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X106.914 Y121.59 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X106.788 Y121.425 E.00304
; LINE_WIDTH: 0.178141
G1 X106.662 Y121.26 E.00228
; LINE_WIDTH: 0.133156
G1 X106.536 Y121.095 E.00152
; WIPE_START
G1 F24000
G1 X106.662 Y121.26 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X107.625 Y122.834 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223126
G1 F15000
G1 X107.499 Y122.669 E.00304
; LINE_WIDTH: 0.178141
G1 X107.373 Y122.504 E.00228
; LINE_WIDTH: 0.133156
G1 X107.247 Y122.34 E.00152
; WIPE_START
G1 F24000
G1 X107.373 Y122.504 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X108.336 Y124.078 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X108.21 Y123.913 E.00304
; LINE_WIDTH: 0.178141
G1 X108.084 Y123.749 E.00228
; LINE_WIDTH: 0.133156
G1 X107.958 Y123.584 E.00152
; WIPE_START
G1 F24000
G1 X108.084 Y123.749 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X109.047 Y125.322 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X108.921 Y125.158 E.00304
; LINE_WIDTH: 0.178141
G1 X108.795 Y124.993 E.00228
; LINE_WIDTH: 0.133156
G1 X108.669 Y124.828 E.00152
; WIPE_START
G1 F24000
G1 X108.795 Y124.993 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X109.758 Y126.567 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X109.632 Y126.402 E.00304
; LINE_WIDTH: 0.178141
G1 X109.506 Y126.237 E.00228
; LINE_WIDTH: 0.133156
G1 X109.38 Y126.072 E.00152
; WIPE_START
G1 F24000
G1 X109.506 Y126.237 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X110.469 Y127.811 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X110.343 Y127.646 E.00304
; LINE_WIDTH: 0.178141
G1 X110.217 Y127.482 E.00228
; LINE_WIDTH: 0.133156
G1 X110.091 Y127.317 E.00152
; WIPE_START
G1 F24000
G1 X110.217 Y127.482 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X111.18 Y129.055 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X111.054 Y128.891 E.00304
; LINE_WIDTH: 0.178141
G1 X110.928 Y128.726 E.00228
; LINE_WIDTH: 0.133156
G1 X110.802 Y128.561 E.00152
; WIPE_START
G1 F24000
G1 X110.928 Y128.726 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X111.891 Y130.3 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X111.765 Y130.135 E.00304
; LINE_WIDTH: 0.178141
G1 X111.639 Y129.97 E.00228
; LINE_WIDTH: 0.133156
G1 X111.513 Y129.805 E.00152
; WIPE_START
G1 F24000
G1 X111.639 Y129.97 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X112.602 Y131.544 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X112.476 Y131.379 E.00304
; LINE_WIDTH: 0.178141
G1 X112.35 Y131.214 E.00228
; LINE_WIDTH: 0.133156
G1 X112.224 Y131.05 E.00152
; WIPE_START
G1 F24000
G1 X112.35 Y131.214 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X113.313 Y132.788 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X113.187 Y132.623 E.00304
; LINE_WIDTH: 0.178141
G1 X113.061 Y132.459 E.00228
; LINE_WIDTH: 0.133156
G1 X112.935 Y132.294 E.00152
; WIPE_START
G1 F24000
G1 X113.061 Y132.459 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X114.024 Y134.032 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X113.898 Y133.868 E.00304
; LINE_WIDTH: 0.178141
G1 X113.772 Y133.703 E.00228
; LINE_WIDTH: 0.133156
G1 X113.646 Y133.538 E.00152
; WIPE_START
G1 F24000
G1 X113.772 Y133.703 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X114.735 Y135.277 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X114.609 Y135.112 E.00304
; LINE_WIDTH: 0.178141
G1 X114.483 Y134.947 E.00228
; LINE_WIDTH: 0.133156
G1 X114.357 Y134.783 E.00152
; WIPE_START
G1 F24000
G1 X114.483 Y134.947 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X115.446 Y136.521 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X115.32 Y136.356 E.00304
; LINE_WIDTH: 0.178141
G1 X115.194 Y136.192 E.00228
; LINE_WIDTH: 0.133156
G1 X115.068 Y136.027 E.00152
; WIPE_START
G1 F24000
G1 X115.194 Y136.192 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X116.157 Y137.765 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223126
G1 F15000
G1 X116.031 Y137.601 E.00304
; LINE_WIDTH: 0.178141
G1 X115.905 Y137.436 E.00228
; LINE_WIDTH: 0.133156
G1 X115.779 Y137.271 E.00152
; WIPE_START
G1 F24000
G1 X115.905 Y137.436 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X116.868 Y139.01 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X116.742 Y138.845 E.00304
; LINE_WIDTH: 0.178141
G1 X116.616 Y138.68 E.00228
; LINE_WIDTH: 0.133156
G1 X116.49 Y138.515 E.00152
; WIPE_START
G1 F24000
G1 X116.616 Y138.68 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X117.579 Y140.254 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X117.453 Y140.089 E.00304
; LINE_WIDTH: 0.178141
G1 X117.327 Y139.924 E.00228
; LINE_WIDTH: 0.133156
G1 X117.201 Y139.76 E.00152
; WIPE_START
G1 F24000
G1 X117.327 Y139.924 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X118.29 Y141.498 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X118.164 Y141.334 E.00304
; LINE_WIDTH: 0.178141
G1 X118.038 Y141.169 E.00228
; LINE_WIDTH: 0.133156
G1 X117.912 Y141.004 E.00152
; WIPE_START
G1 F24000
G1 X118.038 Y141.169 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X119.001 Y142.743 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223126
G1 F15000
G1 X118.875 Y142.578 E.00304
; LINE_WIDTH: 0.178141
G1 X118.749 Y142.413 E.00228
; LINE_WIDTH: 0.133156
G1 X118.624 Y142.248 E.00152
; WIPE_START
G1 F24000
G1 X118.749 Y142.413 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X119.712 Y143.987 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X119.586 Y143.822 E.00304
; LINE_WIDTH: 0.178141
G1 X119.46 Y143.657 E.00228
; LINE_WIDTH: 0.133156
G1 X119.335 Y143.493 E.00152
; WIPE_START
G1 F24000
G1 X119.46 Y143.657 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X120.423 Y145.231 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X120.297 Y145.066 E.00304
; LINE_WIDTH: 0.178141
G1 X120.171 Y144.902 E.00228
; LINE_WIDTH: 0.133156
G1 X120.046 Y144.737 E.00152
; WIPE_START
G1 F24000
G1 X120.171 Y144.902 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X121.134 Y146.475 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X121.008 Y146.311 E.00304
; LINE_WIDTH: 0.178141
G1 X120.882 Y146.146 E.00228
; LINE_WIDTH: 0.133156
G1 X120.757 Y145.981 E.00152
; WIPE_START
G1 F24000
G1 X120.882 Y146.146 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X121.845 Y147.72 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X121.719 Y147.555 E.00304
; LINE_WIDTH: 0.178142
G1 X121.593 Y147.39 E.00228
; LINE_WIDTH: 0.133156
G1 X121.468 Y147.226 E.00152
; WIPE_START
G1 F24000
G1 X121.593 Y147.39 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X122.556 Y148.964 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X122.43 Y148.799 E.00304
; LINE_WIDTH: 0.178142
G1 X122.304 Y148.635 E.00228
; LINE_WIDTH: 0.133156
G1 X122.179 Y148.47 E.00152
; WIPE_START
G1 F24000
G1 X122.304 Y148.635 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X123.267 Y150.208 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X123.141 Y150.044 E.00304
; LINE_WIDTH: 0.178142
G1 X123.016 Y149.879 E.00228
; LINE_WIDTH: 0.133156
G1 X122.89 Y149.714 E.00152
; WIPE_START
G1 F24000
G1 X123.016 Y149.879 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X123.978 Y151.453 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X123.852 Y151.288 E.00304
; LINE_WIDTH: 0.178142
G1 X123.727 Y151.123 E.00228
; LINE_WIDTH: 0.133156
G1 X123.601 Y150.958 E.00152
; WIPE_START
G1 F24000
G1 X123.727 Y151.123 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X124.689 Y152.697 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X124.563 Y152.532 E.00304
; LINE_WIDTH: 0.178142
G1 X124.438 Y152.367 E.00228
; LINE_WIDTH: 0.133156
G1 X124.312 Y152.203 E.00152
; WIPE_START
G1 F24000
G1 X124.438 Y152.367 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X125.4 Y153.941 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X125.274 Y153.776 E.00304
; LINE_WIDTH: 0.178142
G1 X125.149 Y153.612 E.00228
; LINE_WIDTH: 0.133156
G1 X125.023 Y153.447 E.00152
; WIPE_START
G1 F24000
M73 P57 R11
G1 X125.149 Y153.612 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X126.111 Y155.186 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X125.985 Y155.021 E.00304
; LINE_WIDTH: 0.178141
G1 X125.86 Y154.856 E.00228
; LINE_WIDTH: 0.133156
G1 X125.734 Y154.691 E.00152
; WIPE_START
G1 F24000
G1 X125.86 Y154.856 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X126.822 Y156.43 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223126
G1 F15000
G1 X126.696 Y156.265 E.00304
; LINE_WIDTH: 0.178141
G1 X126.571 Y156.1 E.00228
; LINE_WIDTH: 0.133156
G1 X126.445 Y155.936 E.00152
; WIPE_START
G1 F24000
G1 X126.571 Y156.1 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X127.533 Y157.674 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X127.408 Y157.509 E.00304
; LINE_WIDTH: 0.178141
G1 X127.282 Y157.345 E.00228
; LINE_WIDTH: 0.133156
G1 X127.156 Y157.18 E.00152
; WIPE_START
G1 F24000
G1 X127.282 Y157.345 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X128.244 Y158.918 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X128.119 Y158.754 E.00304
; LINE_WIDTH: 0.178141
G1 X127.993 Y158.589 E.00228
; LINE_WIDTH: 0.133156
G1 X127.867 Y158.424 E.00152
; WIPE_START
G1 F24000
G1 X127.993 Y158.589 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.038 J.635 P1  F30000
G1 X128.955 Y160.163 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.223127
G1 F15000
G1 X128.83 Y159.998 E.00304
; LINE_WIDTH: 0.178141
G1 X128.704 Y159.833 E.00228
; LINE_WIDTH: 0.133156
G1 X128.578 Y159.668 E.00152
; WIPE_START
G1 F24000
G1 X128.704 Y159.833 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-1.019 J.665 P1  F30000
G1 X130.115 Y161.995 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.393152
G1 F15000
G1 X129.997 Y161.84 E.00555
; LINE_WIDTH: 0.349583
G1 X129.879 Y161.686 E.00486
; LINE_WIDTH: 0.306015
G1 X129.761 Y161.531 E.00417
; LINE_WIDTH: 0.262446
G1 X129.643 Y161.377 E.00348
; LINE_WIDTH: 0.218877
G1 X129.525 Y161.222 E.00279
; LINE_WIDTH: 0.175308
G1 X129.407 Y161.067 E.0021
; LINE_WIDTH: 0.13174
G1 X129.289 Y160.913 E.00141
; WIPE_START
G1 F24000
G1 X129.407 Y161.067 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I1.08 J.561 P1  F30000
G1 X163.688 Y95.058 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.0968774
G1 F15000
G1 X163.497 Y94.905 E.00108
; LINE_WIDTH: 0.138266
G1 X163.375 Y94.814 E.00118
; LINE_WIDTH: 0.180824
G1 X163.226 Y94.708 E.00206
; WIPE_START
G1 F24000
G1 X163.375 Y94.814 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.4 I-.874 J.847 P1  F30000
G1 X164.792 Y96.276 Z3.4
G1 Z3
G1 E.8 F1800
; LINE_WIDTH: 0.213177
G1 F15000
G1 X164.728 Y96.184 E.00156
; LINE_WIDTH: 0.203376
G1 X164.639 Y96.061 E.00198
; LINE_WIDTH: 0.156741
G1 X164.548 Y95.942 E.00139
; LINE_WIDTH: 0.118074
G1 X164.445 Y95.815 E.001
M106 S252.45
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X164.548 Y95.942 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/88
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
G3 Z3.4 I-.272 J-1.186 P1  F30000
G1 X131.102 Y103.602 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2180
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2180
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.005 J.296 E.01387
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.505 E.08557
G3 X127.988 Y103.211 I.299 J.004 E.01368
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.288 Y102.385 E.00761
G1 X129.291 Y103.21 E.02535
G1 X130.65 Y103.21 E.04177
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2180
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z3.6
G1 Z3.2
G1 E.8 F1800
; LINE_WIDTH: 0.231392
G1 F2180
G1 X129.001 Y103.406 E.01535
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423038
G1 F2180
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2180
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2180
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09252
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2180
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2180
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.6 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2180
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2180
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2180
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/88
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
G3 Z3.6 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.005 J.296 E.01388
G1 X132.29 Y106.29 E.08608
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.505 E.08557
G3 X127.988 Y103.211 I.303 J.008 E.01364
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z3.8
G1 Z3.4
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.8 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z3.8
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
M73 P58 R11
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/88
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
G3 Z3.8 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.005 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.505 E.08557
G3 X127.988 Y103.211 I.303 J.008 E.01364
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
M73 P58 R10
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z4
G1 Z3.6
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/88
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
G3 Z4 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2165
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2165
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.505 E.08557
G3 X127.989 Y103.211 I.303 J.008 E.01364
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2165
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z4.2
G1 Z3.8
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2165
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2165
G1 X130.69 Y104.75 E.0446
G1 X130.75 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2165
G1 X131.128 Y105.129 E.01164
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X130.69 Y105.129 E.05588
G1 X130.75 Y105.506 F30000
G1 F2165
G1 X131.506 Y105.506 E.02323
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X130.69 Y105.506 E.06746
; WIPE_START
G1 F24000
G1 X128.69 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.961 J-.746 P1  F30000
G1 X122.398 Y97.398 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2165
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2165
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.2 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z4.2
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2165
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2165
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2165
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
M73 P59 R10
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/88
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
G3 Z4.2 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.005 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.505 E.08557
G3 X127.989 Y103.211 I.291 J-.004 E.01378
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z4.4
G1 Z4
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.4 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/88
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
G3 Z4.4 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.505 E.08557
G3 X127.989 Y103.211 I.291 J-.004 E.01378
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z4.6
G1 Z4.2
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z4.6
M73 P60 R10
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.6 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z4.6
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/88
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
G3 Z4.6 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.005 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.505 E.08557
G3 X127.989 Y103.211 I.303 J.007 E.01364
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z4.8
G1 Z4.4
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z4.8 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/88
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
G3 Z4.8 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2165
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2165
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.005 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.505 E.08557
G3 X127.989 Y103.211 I.291 J-.004 E.01378
M73 P61 R10
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2165
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z5
G1 Z4.6
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2165
G1 X129 Y103.406 E.01531
G1 X130.75 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42322
G1 F2165
G1 X129.31 Y104.75 E.04462
G1 X129.25 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2165
G1 X131.128 Y105.129 E.05773
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X129.19 Y105.129 E.00979
G1 X129.25 Y105.506 F30000
G1 F2165
G1 X131.506 Y105.506 E.06931
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X129.19 Y105.506 E.02138
; WIPE_START
G1 F24000
G1 X128.494 Y105.506 E-.26436
G1 X128.494 Y104.202 E-.49564
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.906 J-.812 P1  F30000
G1 X122.398 Y97.398 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2165
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2165
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z5
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2165
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2165
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2165
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/88
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
G3 Z5 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.007 J.293 E.01391
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.505 E.08557
G3 X127.989 Y103.211 I.296 J.001 E.01372
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z5.2
G1 Z4.8
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.2 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/88
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
G3 Z5.2 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z5.2
G1 Z5
M73 P62 R10
G1 E.8 F1800
; FEATURE: Inner wall
M73 P62 R9
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.005 J.295 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.505 E.08557
G3 X127.989 Y103.211 I.303 J.008 E.01364
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z5.4
G1 Z5
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.4 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z5.4
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/88
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
G3 Z5.4 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.005 J.295 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.505 E.08557
G3 X127.989 Y103.211 I.291 J-.004 E.01378
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z5.6
G1 Z5.2
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
M73 P63 R9
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/88
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
G3 Z5.6 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.005 J.295 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.505 E.08557
G3 X127.989 Y103.211 I.303 J.008 E.01364
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z5.8
G1 Z5.4
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.8 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z5.8
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/88
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
G3 Z5.8 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.005 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.505 E.08557
G3 X127.988 Y103.211 I.303 J.007 E.01365
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z6
G1 Z5.6
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
M73 P64 R9
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/88
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
G3 Z6 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.007 J.293 E.01391
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.505 E.08557
G3 X127.988 Y103.211 I.291 J-.003 E.01378
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z6.2
G1 Z5.8
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.2 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/88
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
G3 Z6.2 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.505 E.08557
G3 X127.988 Y103.211 I.299 J.004 E.01369
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.289 Y102.386 E.00766
G1 X129.29 Y103.21 E.02531
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z6.4
G1 Z6
G1 E.8 F1800
; LINE_WIDTH: 0.230805
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
M73 P65 R9
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.4 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/88
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
G3 Z6.4 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.005 J.295 E.01389
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.505 E.08557
G3 X127.989 Y103.211 I.303 J.008 E.01364
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z6.6
G1 Z6.2
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.6 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z6.6
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
M73 P65 R8
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/88
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
G3 Z6.6 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
M73 P66 R8
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.005 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.505 E.08557
G3 X127.987 Y103.211 I.303 J.007 E.0136
G1 X128.71 Y103.21 E.02222
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.281 Y102.378 E.00729
G1 X129.29 Y103.21 E.02557
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z6.8
G1 Z6.4
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z6.8 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/88
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
G3 Z6.8 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.007 J.293 E.01391
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.505 E.08557
G3 X127.989 Y103.211 I.303 J.008 E.01364
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.277 Y102.373 E.0071
G1 X129.29 Y102.387 E.00059
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z7
G1 Z6.6
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z7
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/88
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
G3 Z7 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z7
M73 P67 R8
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.505 E.08557
G3 X127.989 Y103.211 I.291 J-.003 E.01377
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.272 Y102.369 E.00692
G1 X129.29 Y102.387 E.00077
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z7.2
G1 Z6.8
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.2 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/88
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
G3 Z7.2 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.005 J.295 E.01389
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.505 E.08557
G3 X127.989 Y103.211 I.292 J-.003 E.01377
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.268 Y102.365 E.00673
G1 X129.29 Y102.387 E.00096
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z7.4
G1 Z7
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.4 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z7.4
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
M73 P68 R8
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/88
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
G3 Z7.4 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.005 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.505 E.08557
G3 X127.989 Y103.211 I.303 J.008 E.01364
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.264 Y102.361 E.00655
G1 X129.29 Y102.387 E.00115
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z7.6
G1 Z7.2
G1 E.8 F1800
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.6 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/88
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
G3 Z7.6 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.005 J.295 E.01389
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.505 E.08557
G3 X127.989 Y103.211 I.303 J.008 E.01364
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.259 Y102.356 E.00636
G1 X129.29 Y102.387 E.00133
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z7.8
G1 Z7.4
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z7.8 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z7.8
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
M73 P69 R8
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/88
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
G3 Z7.8 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2165
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2165
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.304 J.003 E.01379
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2165
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z8
G1 Z7.6
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2165
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2165
G1 X130.69 Y104.75 E.0446
G1 X130.75 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2165
G1 X131.128 Y105.129 E.01164
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X130.69 Y105.129 E.05588
G1 X130.75 Y105.506 F30000
G1 F2165
G1 X131.506 Y105.506 E.02323
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X130.69 Y105.506 E.06746
; WIPE_START
G1 F24000
G1 X128.69 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I.961 J-.746 P1  F30000
G1 X122.398 Y97.398 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2165
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2165
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2165
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2165
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2165
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
M73 P69 R7
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/88
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
G3 Z8 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.005 J.295 E.01389
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.302 J.002 E.01381
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.251 Y102.348 E.00599
G1 X129.29 Y102.387 E.0017
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z8.2
G1 Z7.8
M73 P70 R7
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.2 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z8.2
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/88
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
G3 Z8.2 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.005 J.295 E.01389
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.304 J.003 E.01379
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.247 Y102.343 E.0058
G1 X129.29 Y102.387 E.00189
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z8.4
G1 Z8
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.4 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/88
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
G3 Z8.4 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
M73 P71 R7
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.005 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.291 J-.009 E.01394
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z8.6
G1 Z8.2
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.6 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z8.6
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/88
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
G3 Z8.6 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.304 J.003 E.01379
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.238 Y102.335 E.00543
G1 X129.29 Y102.387 E.00226
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z8.8
G1 Z8.4
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z8.8 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/88
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
M73 P72 R7
G3 Z8.8 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.304 J.003 E.0138
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.234 Y102.331 E.00524
G1 X129.29 Y102.387 E.00245
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z9
G1 Z8.6
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/88
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
G3 Z9 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2165
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2165
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.005 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.989 Y103.211 I.304 J.003 E.01379
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.229 Y102.326 E.00506
G1 X129.29 Y102.387 E.00263
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2165
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z9.2
G1 Z8.8
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2165
G1 X129 Y103.406 E.01531
G1 X130.75 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42322
G1 F2165
G1 X129.31 Y104.75 E.04462
G1 X129.25 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2165
G1 X131.128 Y105.129 E.05773
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X129.19 Y105.129 E.00979
G1 X129.25 Y105.506 F30000
G1 F2165
G1 X131.506 Y105.506 E.06931
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X129.19 Y105.506 E.02138
; WIPE_START
G1 F24000
G1 X128.494 Y105.506 E-.26436
G1 X128.494 Y104.202 E-.49564
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.906 J-.812 P1  F30000
G1 X122.398 Y97.398 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2165
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2165
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.2 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2165
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2165
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2165
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
M73 P73 R7
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/88
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
G3 Z9.2 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.989 Y103.211 I.304 J.003 E.01379
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.225 Y102.322 E.00487
G1 X129.29 Y102.387 E.00282
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z9.4
G1 Z9
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
M73 P73 R6
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.4 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z9.4
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/88
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
G3 Z9.4 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.007 J.293 E.01391
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.989 Y103.211 I.304 J.003 E.01379
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.221 Y102.318 E.00468
G1 X129.29 Y102.387 E.00301
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z9.6
G1 Z9.2
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P74 R6
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.6 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/88
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
G3 Z9.6 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.005 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.987 Y103.211 I.304 J.003 E.01376
G1 X128.71 Y103.21 E.02221
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.217 Y102.313 E.0045
G1 X129.29 Y102.387 E.00319
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I.538 J-1.092 P1  F30000
G1 X129.091 Y102.465 Z9.8
G1 Z9.4
G1 E.8 F1800
; LINE_WIDTH: 0.163146
G1 F2166
G1 X129.02 Y102.499 E.00077
; LINE_WIDTH: 0.230843
G1 X129 Y102.507 E.00032
; LINE_WIDTH: 0.230842
G1 X129 Y103.406 E.01376
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z9.8 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z9.8
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/88
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
G3 Z9.8 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.304 J.003 E.01379
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.212 Y102.309 E.00431
G1 X129.29 Y102.387 E.00338
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
M73 P75 R6
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z10
G1 Z9.6
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/88
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
G3 Z10 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.304 J.003 E.0138
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.208 Y102.305 E.00412
G1 X129.29 Y102.387 E.00357
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I.537 J-1.092 P1  F30000
G1 X129.094 Y102.468 Z10.2
G1 Z9.8
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y102.507 E.00156
G1 X129 Y103.406 E.01376
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.2 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z10.2
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/88
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
G3 Z10.2 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
M73 P76 R6
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.304 J.003 E.01379
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.204 Y102.301 E.00394
G1 X129.29 Y102.387 E.00375
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z10.4
G1 Z10
G1 E.8 F1800
; LINE_WIDTH: 0.23045
G1 F2166
G1 X129 Y103.406 E.01528
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.4 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/88
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
G3 Z10.4 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.007 J.293 E.01391
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.989 Y103.211 I.304 J.003 E.01379
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.199 Y102.296 E.00375
G1 X129.29 Y102.387 E.00394
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z10.6
G1 Z10.2
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.6 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z10.6
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
M73 P77 R6
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/88
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
G3 Z10.6 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2165
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2165
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.987 Y103.211 I.304 J.003 E.01376
G1 X128.71 Y103.21 E.0222
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.195 Y102.292 E.00357
G1 X129.29 Y102.387 E.00412
M73 P77 R5
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2165
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z10.8
G1 Z10.4
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2165
G1 X129 Y103.406 E.01531
G1 X130.75 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423218
G1 F2165
G1 X129.31 Y104.75 E.04462
G1 X129.25 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2165
G1 X131.128 Y105.129 E.05773
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X129.19 Y105.129 E.00979
G1 X129.25 Y105.506 F30000
G1 F2165
G1 X131.506 Y105.506 E.06931
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X129.19 Y105.506 E.02138
; WIPE_START
G1 F24000
G1 X128.494 Y105.506 E-.26436
G1 X128.494 Y104.202 E-.49564
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I.906 J-.812 P1  F30000
G1 X122.398 Y97.398 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2165
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2165
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z10.8 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2165
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2165
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2165
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/88
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
G3 Z10.8 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.006 J.294 E.0139
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.304 J.003 E.01377
G1 X128.71 Y103.21 E.0222
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.191 Y102.288 E.00338
G1 X129.29 Y102.387 E.00431
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z11
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z11
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
M73 P78 R5
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/88
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
G3 Z11 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2167
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2167
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.006 J.294 E.0139
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.291 J-.009 E.01394
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.187 Y102.283 E.00319
G1 X129.29 Y102.387 E.0045
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2167
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z11.2
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2167
G1 X129 Y103.406 E.01531
G1 X130.75 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42322
G1 F2167
G1 X129.31 Y104.75 E.04462
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2167
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2167
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2167
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2167
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.2 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2167
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2167
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2167
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/88
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
G3 Z11.2 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.304 J.003 E.0138
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.182 Y102.279 E.00301
G1 X129.29 Y102.387 E.00468
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z11.4
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I.918 J-.798 P1  F30000
M73 P79 R5
G1 X122.398 Y97.398 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.4 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z11.4
G1 Z11
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/88
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
G3 Z11.4 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.989 Y103.211 I.304 J.003 E.01379
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.178 Y102.275 E.00282
G1 X129.29 Y102.387 E.00487
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z11.6
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.6 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/88
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
G3 Z11.6 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.007 J.293 E.01391
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
M73 P80 R5
G3 X127.988 Y103.211 I.304 J.003 E.01379
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.174 Y102.271 E.00263
G1 X129.29 Y102.387 E.00506
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z11.8
G1 Z11.4
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z11.8 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/88
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
G3 Z11.8 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.989 Y103.211 I.304 J.003 E.0138
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.169 Y102.266 E.00245
G1 X129.29 Y102.387 E.00524
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z12
G1 Z11.6
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/88
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
G3 Z12 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z12
G1 Z11.8
M73 P81 R5
G1 E.8 F1800
; FEATURE: Inner wall
M73 P81 R4
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.304 J.003 E.01379
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.165 Y102.262 E.00226
G1 X129.29 Y102.387 E.00543
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z12.2
G1 Z11.8
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.2 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z12.2
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/88
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
G3 Z12.2 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.005 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.989 Y103.211 I.291 J-.009 E.01394
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.161 Y102.258 E.00208
G1 X129.29 Y102.387 E.00561
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z12.4
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.4 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
M73 P82 R4
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/88
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
G3 Z12.4 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.304 J.003 E.01379
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.157 Y102.253 E.00189
G1 X129.29 Y102.387 E.0058
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z12.6
G1 Z12.2
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.6 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z12.6
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/88
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
G3 Z12.6 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z12.6
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.989 Y103.211 I.291 J-.009 E.01394
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.152 Y102.249 E.0017
G1 X129.29 Y102.387 E.00599
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z12.8
G1 Z12.4
G1 E.8 F1800
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z12.8 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
M73 P83 R4
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/88
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
G3 Z12.8 I.289 J-1.182 P1  F30000
G1 X131.102 Y103.602 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2166
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.304 J.003 E.01379
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2166
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z13
G1 Z12.6
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2166
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2166
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2166
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2166
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.398 Y105.898 E.28196
G1 X119.602 Y105.898 E.09274
G1 X119.602 Y93.602 E.40788
G1 X140.398 Y93.602 E.68984
G1 X140.398 Y105.898 E.40788
G1 X137.602 Y105.898 E.09274
G1 X137.602 Y97.398 E.28196
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2166
G1 X122.79 Y106.29 E.26118
G1 X119.21 Y106.29 E.11
G1 X119.21 Y93.21 E.40191
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.29 E.40191
G1 X137.21 Y106.29 E.11
G1 X137.21 Y97.79 E.26118
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.836 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z13
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2166
G1 X122.05 Y97.571 E.05401
G1 X119.95 Y99.67 E.09848
G1 X119.95 Y102.598 E.09715
G1 X122.05 Y104.698 E.09848
G1 X122.05 Y105.246 E.0182
G1 X121.746 Y105.55 E.01422
G1 X120.118 Y105.55 E.05401
G1 X120.607 Y93.95 F30000
G1 F2166
G1 X119.95 Y93.95 E.02177
G1 X119.95 Y94.922 E.03225
G1 X122.078 Y97.05 E.09979
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F2166
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.254 Y105.55 E.01422
G1 X139.882 Y105.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X138.254 Y105.55 E-.61876
G1 X137.991 Y105.287 E-.14124
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/88
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
G3 Z13 I.549 J-1.086 P1  F30000
G1 X122.398 Y97.398 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3368
G1 X122.398 Y106.7 E.30857
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X122.398 Y111.486 E.15877
G3 X119.604 Y111.569 I-1.398 J.013 E.14378
G1 X119.604 Y106.7 E.16153
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F3368
G1 X119.602 Y93.602 E.43448
G1 X140.398 Y93.602 E.68983
G1 X140.398 Y106.7 E.43448
M204 S5000
; FEATURE: Overhang wall
M106 S255
G1 F3000
G1 X140.398 Y111.486 E.15877
G3 X137.602 Y111.494 I-1.398 J.01 E.14608
G1 X137.602 Y106.7 E.15901
M106 S252.45
M204 S10000
; FEATURE: Inner wall
G1 F3368
G1 X137.602 Y106.318 E.01269
G1 X137.602 Y97.398 E.29588
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3368
G1 X122.79 Y106.7 E.27378
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X122.79 Y111.496 E.15909
G3 X119.212 Y111.589 I-1.79 J.004 E.18369
G1 X119.212 Y106.7 E.16217
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3368
G1 X119.21 Y93.21 E.41451
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y106.7 E.41451
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
M106 S255
G1 F3000
G1 X140.79 Y111.496 E.15909
G3 X137.21 Y111.498 I-1.79 J-.001 E.1864
G1 X137.21 Y106.7 E.15917
M106 S252.45
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3368
G1 X137.21 Y106.331 E.01134
G1 X137.21 Y97.79 E.26244
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.837 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I.731 J-.973 P1  F30000
G1 X122.05 Y99.199 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3368
G1 X122.05 Y97.571 E.05401
G1 X119.951 Y99.669 E.09844
M73 P84 R4
G1 X119.952 Y102.6 E.09722
G1 X122.05 Y104.698 E.09842
G1 X122.05 Y105.246 E.0182
G1 X121.96 Y105.336 E.00422
G1 X120.331 Y105.336 E.05401
G1 X119.957 Y105.559 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.460383
M106 S255
G1 F3000
G1 X119.958 Y111.681 E.20828
G2 X120.376 Y112.358 I1.117 J-.222 E.02763
G1 X120.375 Y105.729 E.22552
G1 X120.792 Y105.729 E.0142
G1 X120.793 Y112.537 E.23161
G1 X120.837 Y112.549 E.00154
G2 X121.21 Y112.533 I.154 J-.762 E.01286
G1 X121.21 Y105.729 E.23148
G1 X121.627 Y105.729 E.0142
G1 X121.628 Y112.35 E.22524
G2 X122.045 Y111.672 I-.596 J-.835 E.02781
G1 X122.045 Y105.559 E.20795
M106 S252.45
G1 X120.606 Y93.95 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3368
G1 X119.95 Y93.95 E.02176
G1 X119.951 Y94.923 E.03225
G1 X122.078 Y97.05 E.09978
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F3368
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y105.246 E.0182
G1 X138.04 Y105.336 E.00422
G1 X139.669 Y105.336 E.05401
G1 X140.044 Y105.559 F30000
; FEATURE: Bridge
; LINE_WIDTH: 0.460654
M106 S255
G1 F3000
G1 X140.044 Y111.681 E.20838
G3 X139.627 Y112.353 I-.997 J-.153 E.0277
G1 X139.627 Y105.729 E.22551
G1 X139.209 Y105.729 E.01422
G1 X139.209 Y112.54 E.23188
G3 X138.792 Y112.542 I-.212 J-1.108 E.01428
G1 X138.791 Y105.729 E.23193
G1 X138.373 Y105.729 E.01422
G1 X138.373 Y112.356 E.22559
G3 X137.956 Y111.694 I.611 J-.849 E.02731
G1 X137.956 Y105.559 E.20883
M106 S252.45
; WIPE_START
G1 F24000
G1 X137.956 Y107.559 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I.608 J-1.054 P1  F30000
G1 X131.102 Y103.602 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3368
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3368
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.304 J.003 E.01379
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.144 Y102.241 E.00133
G1 X129.29 Y102.387 E.00636
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F3368
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.2 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z13.2
G1 Z12.8
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F3368
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F3368
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F3368
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F3368
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/88
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
G3 Z13.2 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3291
G1 X122.398 Y111.486 E.46734
G3 X119.604 Y111.569 I-1.398 J.012 E.14366
G1 X119.602 Y93.602 E.59601
G1 X140.398 Y93.602 E.68983
G1 X140.398 Y111.486 E.59325
G3 X137.602 Y111.494 I-1.398 J.01 E.14608
G1 X137.602 Y97.398 E.46758
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3291
G1 X122.79 Y111.496 E.42114
G3 X119.212 Y111.589 I-1.79 J.002 E.17004
G1 X119.21 Y93.21 E.56473
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y111.496 E.56187
G3 X137.21 Y111.498 I-1.79 J-.001 E.17266
G1 X137.21 Y97.79 E.42122
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.841 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I.728 J-.975 P1  F30000
G1 X122.05 Y99.199 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3291
G1 X122.05 Y97.571 E.05401
G1 X119.951 Y99.669 E.09844
G1 X119.952 Y102.6 E.09722
G1 X122.05 Y104.698 E.09842
G1 X122.05 Y103.069 E.05401
G1 X121.065 Y111.701 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.482122
G1 F3291
G2 X121.221 Y111.409 I-.184 J-.285 E.01236
G1 X121.221 Y105.999 E.1936
G1 X120.781 Y105.999 E.01573
G1 X120.782 Y111.409 E.1936
G1 X120.849 Y111.643 E.00873
G1 X121.007 Y111.685 E.00585
G1 X121.324 Y112.03 F30000
; LINE_WIDTH: 0.419999
G1 F3291
G1 X121.51 Y111.846 E.00803
G1 X121.626 Y111.479 E.01183
G1 X121.629 Y105.591 E.18093
G1 X120.373 Y105.591 E.03859
G1 X120.374 Y111.485 E.18112
G1 X120.503 Y111.871 E.0125
G2 X120.819 Y112.09 I.65 J-.602 E.0119
G1 X121.158 Y112.098 E.01041
G1 X121.268 Y112.053 E.00366
G1 X121.43 Y112.399 F30000
G1 F3291
G2 X121.829 Y112.061 I-1.157 J-1.777 E.01611
G1 X121.985 Y111.685 E.0125
G1 X122.006 Y111.409 E.00853
G1 X122.006 Y105.214 E.19035
G1 X119.996 Y105.214 E.06176
G1 X119.997 Y111.531 E.19412
G1 X120.096 Y111.932 E.01269
G1 X120.359 Y112.271 E.01317
G1 X120.708 Y112.458 E.01218
G1 X121.106 Y112.496 E.01228
G1 X121.372 Y112.416 E.00853
; WIPE_START
G1 F24000
G1 X121.106 Y112.496 E-.10552
G1 X120.708 Y112.458 E-.1519
G1 X120.359 Y112.271 E-.1506
G1 X120.096 Y111.932 E-.16292
G1 X119.997 Y111.531 E-.15699
G1 X119.997 Y111.447 E-.03208
; WIPE_END
M73 P84 R3
G1 E-.04 F1800
G17
G3 Z13.4 I-.012 J1.217 P1  F30000
G1 X138.848 Y111.629 Z13.4
G1 Z13
G1 E.8 F1800
; LINE_WIDTH: 0.483144
G1 F3291
G1 X139.012 Y111.706 E.00652
G1 X139.166 Y111.615 E.0064
G1 X139.22 Y111.363 E.00926
G1 X139.22 Y106 E.19239
G1 X138.78 Y106 E.01579
G1 X138.78 Y111.418 E.19436
G1 X138.829 Y111.572 E.00582
G1 X138.704 Y112.041 F30000
; LINE_WIDTH: 0.419999
G1 F3291
G1 X139.028 Y112.115 E.01022
G1 X139.361 Y112.005 E.01076
G1 X139.567 Y111.746 E.01016
G1 X139.629 Y111.363 E.01192
G1 X139.629 Y105.591 E.17735
G1 X138.371 Y105.591 E.03864
G1 X138.371 Y111.446 E.17992
G1 X138.452 Y111.756 E.00983
G2 X138.658 Y112.003 I.402 J-.126 E.01013
G1 X138.522 Y112.38 F30000
G1 F3291
G1 X138.909 Y112.498 E.01244
G1 X139.183 Y112.485 E.00844
G1 X139.561 Y112.33 E.01254
G2 X139.924 Y111.886 I-.906 J-1.111 E.01773
G1 X140.006 Y111.363 E.01629
G1 X140.006 Y105.214 E.18894
G1 X137.994 Y105.214 E.06181
G1 X137.994 Y111.473 E.19232
G1 X138.037 Y111.779 E.0095
G1 X138.227 Y112.135 E.0124
G1 X138.476 Y112.341 E.00992
G1 X137.95 Y103.069 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3291
G1 X137.95 Y104.698 E.05401
G1 X140.05 Y102.598 E.09848
G1 X140.05 Y99.67 E.09715
G1 X137.95 Y97.571 E.09848
G1 X137.95 Y99.199 E.05401
G1 X139.393 Y93.95 F30000
G1 F3291
G1 X140.05 Y93.95 E.02177
G1 X140.05 Y94.922 E.03225
G1 X137.922 Y97.05 E.09979
G1 X137.429 Y97.05 E.01635
G1 X134.33 Y93.95 E.14539
G1 X133.346 Y93.95 E.03265
G1 X130.246 Y97.05 E.14539
G1 X129.754 Y97.05 E.01635
G1 X126.654 Y93.95 E.14539
G1 X125.67 Y93.95 E.03265
G1 X122.571 Y97.05 E.14539
G1 X122.078 Y97.05 E.01635
G1 X119.951 Y94.923 E.09978
G1 X119.95 Y93.95 E.03225
G1 X120.606 Y93.95 E.02176
; WIPE_START
G1 F24000
G1 X119.95 Y93.95 E-.24927
G1 X119.951 Y94.923 E-.36949
G1 X120.213 Y95.186 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I-.744 J.963 P1  F30000
G1 X131.102 Y103.602 Z13.4
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3291
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3291
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.007 J.293 E.01391
G1 X132.29 Y106.29 E.08609
M73 P85 R3
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.304 J.003 E.01378
G1 X128.71 Y103.21 E.02219
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.139 Y102.236 E.00115
G1 X129.29 Y102.387 E.00655
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F3291
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.4 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z13.4
G1 Z13
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F3291
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F3291
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F3291
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F3291
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/88
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
G3 Z13.4 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z13.4
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3288
G1 X122.398 Y111.486 E.46734
G3 X119.604 Y111.569 I-1.398 J.006 E.14332
G1 X119.602 Y93.602 E.59601
G1 X140.398 Y93.602 E.68983
G1 X140.398 Y111.486 E.59325
G3 X137.602 Y111.494 I-1.398 J.01 E.14608
G1 X137.602 Y97.398 E.46758
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3288
G1 X122.79 Y111.496 E.42114
G3 X119.212 Y111.589 I-1.79 J-.005 E.16965
G1 X119.21 Y93.21 E.56473
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y111.496 E.56187
G3 X137.21 Y111.498 I-1.79 J-.001 E.17266
G1 X137.21 Y97.79 E.42122
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.841 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I.728 J-.975 P1  F30000
G1 X122.05 Y99.199 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3288
G1 X122.05 Y97.571 E.05401
G1 X119.951 Y99.669 E.09844
G1 X119.952 Y102.6 E.09722
G1 X122.05 Y104.698 E.09842
G1 X122.05 Y103.069 E.05401
G1 X120.606 Y93.95 F30000
G1 F3288
G1 X119.95 Y93.95 E.02176
G1 X119.951 Y94.923 E.03225
G1 X122.078 Y97.05 E.09978
G1 X122.571 Y97.05 E.01635
G1 X125.67 Y93.95 E.14539
G1 X126.654 Y93.95 E.03265
G1 X129.754 Y97.05 E.14539
G1 X130.246 Y97.05 E.01635
G1 X133.346 Y93.95 E.14539
G1 X134.33 Y93.95 E.03265
G1 X137.429 Y97.05 E.14539
G1 X137.922 Y97.05 E.01635
G1 X140.05 Y94.922 E.09979
G1 X140.05 Y93.95 E.03225
G1 X139.393 Y93.95 E.02177
G1 X137.95 Y99.199 F30000
G1 F3288
G1 X137.95 Y97.571 E.05401
G1 X140.05 Y99.67 E.09848
G1 X140.05 Y102.598 E.09715
G1 X137.95 Y104.698 E.09848
G1 X137.95 Y103.069 E.05401
G1 X138.856 Y111.637 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.483144
G1 F3288
G1 X138.998 Y111.701 E.00559
G1 X139.141 Y111.645 E.0055
G1 X139.22 Y111.396 E.00938
G1 X139.22 Y106 E.1936
G1 X138.78 Y106 E.01579
G1 X138.78 Y111.389 E.19335
G1 X138.839 Y111.58 E.00714
G1 X138.866 Y112.107 F30000
; LINE_WIDTH: 0.419999
G1 F3288
G1 X139.188 Y112.08 E.00995
G1 X139.453 Y111.921 E.00948
G1 X139.584 Y111.702 E.00784
G1 X139.629 Y111.368 E.01034
G1 X139.629 Y105.591 E.17752
G1 X138.371 Y105.591 E.03864
G1 X138.371 Y111.429 E.17939
G1 X138.433 Y111.745 E.00988
G1 X138.613 Y111.965 E.00876
G1 X138.813 Y112.077 E.00704
G1 X138.581 Y112.41 F30000
G1 F3288
G2 X139.145 Y112.491 I.485 J-1.375 E.01762
G1 X139.472 Y112.384 E.01058
G1 X139.74 Y112.174 E.01044
G1 X139.944 Y111.834 E.01219
G1 X140.006 Y111.368 E.01444
G1 X140.006 Y105.214 E.18911
G1 X137.994 Y105.214 E.06181
G1 X137.994 Y111.465 E.19209
G1 X138.076 Y111.886 E.01317
G1 X138.254 Y112.169 E.01027
G1 X138.533 Y112.375 E.01064
; WIPE_START
G1 F24000
G1 X138.254 Y112.169 E-.13157
G1 X138.076 Y111.886 E-.12699
G1 X137.994 Y111.465 E-.16286
G1 X137.994 Y110.574 E-.33858
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I-.128 J-1.21 P1  F30000
G1 X121.591 Y112.31 Z13.6
G1 Z13.2
G1 E.8 F1800
G1 F3288
G1 X121.832 Y112.058 E.01068
G1 X121.984 Y111.692 E.01219
G1 X122.006 Y111.408 E.00876
G1 X122.006 Y105.214 E.19032
G1 X119.996 Y105.214 E.06176
G1 X119.997 Y111.531 E.19412
G1 X120.097 Y111.935 E.01278
G2 X120.482 Y112.358 I1.244 J-.747 E.01768
G1 X120.859 Y112.491 E.01228
G1 X121.219 Y112.471 E.01108
G1 X121.536 Y112.333 E.01063
G1 X121.209 Y112.087 F30000
G1 F3288
G1 X121.435 Y111.928 E.00849
G1 X121.578 Y111.685 E.00867
G1 X121.629 Y111.408 E.00866
G1 X121.629 Y105.591 E.17874
G1 X120.373 Y105.591 E.03859
G1 X120.374 Y111.485 E.18111
G1 X120.482 Y111.837 E.01132
G1 X120.675 Y112.026 E.0083
G1 X121.004 Y112.118 E.0105
G1 X121.149 Y112.096 E.00451
G1 X121.023 Y111.71 F30000
; LINE_WIDTH: 0.482122
G1 F3288
G1 X121.163 Y111.622 E.00594
G1 X121.221 Y111.408 E.00793
G1 X121.221 Y105.999 E.19357
G1 X120.781 Y105.999 E.01573
G1 X120.782 Y111.408 E.19357
G1 X120.827 Y111.618 E.0077
G1 X120.968 Y111.685 E.00557
; WIPE_START
G1 F24000
G1 X120.827 Y111.618 E-.05917
G1 X120.782 Y111.408 E-.08179
G1 X120.782 Y109.779 E-.61904
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I.625 J1.044 P1  F30000
G1 X131.102 Y103.602 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3288
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3288
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.007 J.293 E.01391
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.304 J.003 E.01378
G1 X128.71 Y103.21 E.02219
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.135 Y102.232 E.00096
G1 X129.29 Y102.387 E.00673
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F3288
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.6 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z13.6
G1 Z13.2
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F3288
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F3288
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F3288
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F3288
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/88
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
G3 Z13.6 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.398 Y111.486 E.46734
G3 X119.604 Y111.569 I-1.398 J.012 E.14366
G1 X119.602 Y93.602 E.59601
G1 X140.398 Y93.602 E.68983
G1 X140.398 Y111.486 E.59325
G3 X137.602 Y111.494 I-1.398 J.01 E.14608
G1 X137.602 Y97.398 E.46758
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X122.79 Y111.496 E.42114
G3 X119.212 Y111.589 I-1.79 J.002 E.17004
G1 X119.21 Y93.21 E.56473
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y111.496 E.56187
G3 X137.21 Y111.498 I-1.79 J-.001 E.17266
G1 X137.21 Y97.79 E.42122
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.841 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I.728 J-.975 P1  F30000
G1 X122.05 Y99.199 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.05 Y97.571 E.05401
G1 X119.951 Y99.669 E.09844
G1 X119.952 Y102.6 E.09722
G1 X122.05 Y104.698 E.09842
G1 X122.05 Y105.246 E.0182
G1 X119.952 Y107.344 E.0984
G1 X119.953 Y110.277 E.09728
G1 X121.821 Y112.145 E.08765
G1 X121.944 Y111.954 E.00754
G2 X122.05 Y110.567 I-2.761 J-.909 E.04658
; WIPE_START
G1 F24000
G1 X122.05 Y111.47 E-.3429
G1 X121.944 Y111.954 E-.18831
G1 X121.821 Y112.145 E-.08635
G1 X121.556 Y111.88 E-.14243
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I.097 J1.213 P1  F30000
G1 X137.95 Y110.568 Z13.8
G1 Z13.4
G1 E.8 F1800
G1 F2715
G1 X137.95 Y111.476 E.03012
G2 X138.18 Y112.144 I1.47 J-.132 E.02366
G1 X140.05 Y110.274 E.08772
G1 X140.05 Y107.346 E.09715
G1 X137.95 Y105.246 E.09848
G1 X137.95 Y104.698 E.0182
G1 X140.05 Y102.598 E.09848
G1 X140.05 Y99.67 E.09715
G1 X137.95 Y97.571 E.09848
G1 X137.95 Y99.199 E.05401
G1 X139.393 Y93.95 F30000
G1 F2715
G1 X140.05 Y93.95 E.02177
G1 X140.05 Y94.922 E.03225
G1 X137.922 Y97.05 E.09979
G1 X137.429 Y97.05 E.01635
G1 X134.33 Y93.95 E.14539
G1 X133.346 Y93.95 E.03265
G1 X130.246 Y97.05 E.14539
M73 P86 R3
G1 X129.754 Y97.05 E.01635
G1 X126.654 Y93.95 E.14539
G1 X125.67 Y93.95 E.03265
G1 X122.571 Y97.05 E.14539
G1 X122.078 Y97.05 E.01635
G1 X119.951 Y94.923 E.09978
G1 X119.95 Y93.95 E.03225
G1 X120.606 Y93.95 E.02176
; WIPE_START
G1 F24000
G1 X119.95 Y93.95 E-.24927
G1 X119.951 Y94.923 E-.36949
G1 X120.213 Y95.186 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I-.744 J.963 P1  F30000
G1 X131.102 Y103.602 Z13.8
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2715
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.304 J.003 E.01378
G1 X128.71 Y103.21 E.02219
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2715
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z13.8 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z13.8
G1 Z13.4
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2715
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2715
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2715
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2715
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/88
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
G3 Z13.8 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.398 Y111.486 E.46734
G3 X119.604 Y111.569 I-1.398 J.006 E.14332
G1 X119.602 Y93.602 E.59601
G1 X140.398 Y93.602 E.68983
G1 X140.398 Y111.486 E.59325
G3 X137.602 Y111.494 I-1.398 J.01 E.14608
G1 X137.602 Y97.398 E.46758
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X122.79 Y111.496 E.42114
G3 X119.212 Y111.589 I-1.79 J-.005 E.16965
G1 X119.21 Y93.21 E.56473
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y111.496 E.56187
G3 X137.21 Y111.498 I-1.79 J-.001 E.17266
G1 X137.21 Y97.79 E.42122
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.841 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I.728 J-.975 P1  F30000
G1 X122.05 Y99.199 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.05 Y97.571 E.05401
G1 X119.951 Y99.669 E.09844
G1 X119.952 Y102.6 E.09722
G1 X122.05 Y104.698 E.09842
G1 X122.05 Y105.246 E.0182
G1 X119.952 Y107.344 E.0984
G1 X119.953 Y110.277 E.09728
G1 X121.822 Y112.146 E.08771
G1 X121.872 Y112.083 E.00267
G2 X122.05 Y110.569 I-2.535 J-1.065 E.05125
; WIPE_START
G1 F24000
G1 X122.026 Y111.708 E-.43319
G1 X121.872 Y112.083 E-.15399
G1 X121.822 Y112.146 E-.03057
G1 X121.557 Y111.882 E-.14225
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I.097 J1.213 P1  F30000
G1 X137.95 Y110.568 Z14
G1 Z13.6
G1 E.8 F1800
G1 F2715
G1 X137.95 Y111.476 E.03012
G2 X138.18 Y112.144 I1.462 J-.129 E.02367
G1 X140.05 Y110.274 E.08772
G1 X140.05 Y107.346 E.09715
G1 X137.95 Y105.246 E.09848
G1 X137.95 Y104.698 E.0182
G1 X140.05 Y102.598 E.09848
G1 X140.05 Y99.67 E.09715
G1 X137.95 Y97.571 E.09848
G1 X137.95 Y99.199 E.05401
G1 X139.393 Y93.95 F30000
G1 F2715
G1 X140.05 Y93.95 E.02177
G1 X140.05 Y94.922 E.03225
G1 X137.922 Y97.05 E.09979
G1 X137.429 Y97.05 E.01635
G1 X134.33 Y93.95 E.14539
G1 X133.346 Y93.95 E.03265
G1 X130.246 Y97.05 E.14539
G1 X129.754 Y97.05 E.01635
G1 X126.654 Y93.95 E.14539
G1 X125.67 Y93.95 E.03265
G1 X122.571 Y97.05 E.14539
G1 X122.078 Y97.05 E.01635
G1 X119.951 Y94.923 E.09978
G1 X119.95 Y93.95 E.03225
G1 X120.606 Y93.95 E.02176
; WIPE_START
G1 F24000
G1 X119.95 Y93.95 E-.24927
G1 X119.951 Y94.923 E-.36949
G1 X120.213 Y95.186 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I-.744 J.963 P1  F30000
G1 X131.102 Y103.602 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2715
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.291 J-.009 E.01392
G1 X128.71 Y103.21 E.02219
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.127 Y102.223 E.00059
G1 X129.29 Y102.387 E.0071
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2715
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z14
G1 Z13.6
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2715
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2715
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2715
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2715
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/88
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
G3 Z14 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.398 Y111.486 E.46734
G3 X119.604 Y111.569 I-1.398 J.006 E.14331
G1 X119.602 Y93.602 E.59601
G1 X140.398 Y93.602 E.68983
G1 X140.398 Y111.486 E.59325
G3 X137.602 Y111.494 I-1.398 J.01 E.14608
G1 X137.602 Y97.398 E.46758
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X122.79 Y111.496 E.42114
G3 X119.212 Y111.589 I-1.79 J-.005 E.16964
G1 X119.21 Y93.21 E.56473
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y111.496 E.56187
G3 X137.21 Y111.498 I-1.79 J-.001 E.17266
G1 X137.21 Y97.79 E.42122
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.841 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I.728 J-.975 P1  F30000
G1 X122.05 Y99.199 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.05 Y97.571 E.05401
G1 X119.951 Y99.669 E.09844
G1 X119.952 Y102.6 E.09722
G1 X122.05 Y104.698 E.09842
G1 X122.05 Y105.246 E.0182
G1 X119.952 Y107.344 E.0984
G1 X119.953 Y110.277 E.09728
G1 X121.822 Y112.146 E.08771
G1 X121.872 Y112.082 E.00269
G2 X122.05 Y110.569 I-2.54 J-1.066 E.05123
; WIPE_START
G1 F24000
G1 X122.026 Y111.708 E-.43312
G1 X121.872 Y112.082 E-.15384
G1 X121.822 Y112.146 E-.03078
G1 X121.558 Y111.882 E-.14226
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I.097 J1.213 P1  F30000
G1 X137.95 Y110.569 Z14.2
G1 Z13.8
G1 E.8 F1800
G1 F2715
G1 X137.95 Y111.477 E.03014
G2 X138.178 Y112.146 I1.595 J-.169 E.02363
G1 X140.05 Y110.274 E.08782
G1 X140.05 Y107.346 E.09715
G1 X137.95 Y105.246 E.09848
G1 X137.95 Y104.698 E.0182
G1 X140.05 Y102.598 E.09848
G1 X140.05 Y99.67 E.09715
G1 X137.95 Y97.571 E.09848
G1 X137.95 Y99.199 E.05401
M73 P87 R3
G1 X139.393 Y93.95 F30000
G1 F2715
G1 X140.05 Y93.95 E.02177
G1 X140.05 Y94.922 E.03225
G1 X137.922 Y97.05 E.09979
G1 X137.429 Y97.05 E.01635
G1 X134.33 Y93.95 E.14539
G1 X133.346 Y93.95 E.03265
G1 X130.246 Y97.05 E.14539
G1 X129.754 Y97.05 E.01635
G1 X126.654 Y93.95 E.14539
G1 X125.67 Y93.95 E.03265
G1 X122.571 Y97.05 E.14539
G1 X122.078 Y97.05 E.01635
G1 X119.951 Y94.923 E.09978
G1 X119.95 Y93.95 E.03225
G1 X120.606 Y93.95 E.02176
; WIPE_START
G1 F24000
G1 X119.95 Y93.95 E-.24927
G1 X119.951 Y94.923 E-.36949
G1 X120.213 Y95.186 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I-.744 J.963 P1  F30000
G1 X131.102 Y103.602 Z14.2
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2715
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.989 Y103.211 I.304 J.003 E.01379
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.122 Y102.219 E.00723
G1 X129.29 Y102.387 E.00729
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2715
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.2 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z14.2
G1 Z13.8
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2715
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2715
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2715
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2715
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/88
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
G3 Z14.2 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.398 Y111.486 E.46734
G3 X119.604 Y111.569 I-1.398 J.012 E.14367
G1 X119.602 Y93.602 E.59601
G1 X140.398 Y93.602 E.68983
G1 X140.398 Y111.486 E.59325
G3 X137.602 Y111.494 I-1.398 J.01 E.14608
G1 X137.602 Y97.398 E.46758
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X122.79 Y111.496 E.42114
G3 X119.212 Y111.589 I-1.79 J.002 E.17005
G1 X119.21 Y93.21 E.56473
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y111.496 E.56187
G3 X137.21 Y111.498 I-1.79 J-.001 E.17266
G1 X137.21 Y97.79 E.42122
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.841 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I.728 J-.975 P1  F30000
G1 X122.05 Y99.199 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.05 Y97.571 E.05401
G1 X119.951 Y99.669 E.09844
G1 X119.952 Y102.6 E.09722
G1 X122.05 Y104.698 E.09842
G1 X122.05 Y105.246 E.0182
G1 X119.952 Y107.344 E.0984
G1 X119.953 Y110.277 E.09728
G1 X121.82 Y112.144 E.0876
G1 X121.947 Y111.947 E.00779
G2 X122.05 Y110.567 I-2.797 J-.902 E.04632
; WIPE_START
G1 F24000
G1 X122.05 Y111.469 E-.34288
G1 X121.947 Y111.947 E-.18549
G1 X121.82 Y112.144 E-.08922
G1 X121.555 Y111.879 E-.14241
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I.097 J1.213 P1  F30000
G1 X137.95 Y110.568 Z14.4
G1 Z14
G1 E.8 F1800
G1 F2715
G1 X137.95 Y111.477 E.03015
G2 X138.18 Y112.144 I1.503 J-.144 E.02361
G1 X140.05 Y110.274 E.08772
G1 X140.05 Y107.346 E.09715
G1 X137.95 Y105.246 E.09848
G1 X137.95 Y104.698 E.0182
G1 X140.05 Y102.598 E.09848
G1 X140.05 Y99.67 E.09715
G1 X137.95 Y97.571 E.09848
G1 X137.95 Y99.199 E.05401
G1 X139.393 Y93.95 F30000
G1 F2715
G1 X140.05 Y93.95 E.02177
G1 X140.05 Y94.922 E.03225
G1 X137.922 Y97.05 E.09979
G1 X137.429 Y97.05 E.01635
G1 X134.33 Y93.95 E.14539
G1 X133.346 Y93.95 E.03265
G1 X130.246 Y97.05 E.14539
G1 X129.754 Y97.05 E.01635
G1 X126.654 Y93.95 E.14539
G1 X125.67 Y93.95 E.03265
G1 X122.571 Y97.05 E.14539
G1 X122.078 Y97.05 E.01635
G1 X119.951 Y94.923 E.09978
G1 X119.95 Y93.95 E.03225
G1 X120.606 Y93.95 E.02176
; WIPE_START
G1 F24000
G1 X119.95 Y93.95 E-.24927
G1 X119.951 Y94.923 E-.36949
G1 X120.213 Y95.186 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I-.744 J.963 P1  F30000
G1 X131.102 Y103.602 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2715
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.007 J.293 E.01391
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.989 Y103.211 I.294 J-.006 E.01391
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2715
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.4 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z14.4
G1 Z14
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2715
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2715
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2715
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2715
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/88
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
G3 Z14.4 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.398 Y111.486 E.46734
G3 X119.604 Y111.569 I-1.398 J.012 E.14366
G1 X119.602 Y93.602 E.59601
G1 X140.398 Y93.602 E.68983
G1 X140.398 Y111.486 E.59325
G3 X137.602 Y111.486 I-1.398 J.01 E.14633
G1 X137.602 Y97.398 E.46734
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X122.79 Y111.496 E.42114
G3 X119.212 Y111.589 I-1.79 J.002 E.17004
G1 X119.21 Y93.21 E.56473
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y111.496 E.56187
M73 P88 R3
G3 X137.21 Y111.496 I-1.79 J-.001 E.17274
G1 X137.21 Y97.79 E.42114
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.841 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I.728 J-.975 P1  F30000
G1 X122.05 Y99.199 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.05 Y97.571 E.05401
G1 X119.951 Y99.669 E.09844
G1 X119.952 Y102.6 E.09722
G1 X122.05 Y104.698 E.09842
G1 X122.05 Y105.246 E.0182
G1 X119.952 Y107.344 E.0984
G1 X119.953 Y110.277 E.09728
G1 X121.822 Y112.146 E.08771
G1 X121.872 Y112.082 E.00268
G2 X122.05 Y110.568 I-2.571 J-1.069 E.05122
; WIPE_START
G1 F24000
G1 X122.027 Y111.702 E-.43093
G1 X121.872 Y112.082 E-.15611
G1 X121.822 Y112.146 E-.0307
G1 X121.558 Y111.882 E-.14225
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I.097 J1.213 P1  F30000
G1 X137.95 Y110.568 Z14.6
G1 Z14.2
G1 E.8 F1800
G1 F2715
G1 X137.95 Y111.47 E.02992
G2 X138.18 Y112.144 I1.494 J-.133 E.02384
G1 X140.05 Y110.274 E.08772
G1 X140.05 Y107.346 E.09715
G1 X137.95 Y105.246 E.09848
G1 X137.95 Y104.698 E.0182
G1 X140.05 Y102.598 E.09848
G1 X140.05 Y99.67 E.09715
G1 X137.95 Y97.571 E.09848
G1 X137.95 Y99.199 E.05401
G1 X139.393 Y93.95 F30000
G1 F2715
G1 X140.05 Y93.95 E.02177
G1 X140.05 Y94.922 E.03225
G1 X137.922 Y97.05 E.09979
G1 X137.429 Y97.05 E.01635
G1 X134.33 Y93.95 E.14539
G1 X133.346 Y93.95 E.03265
G1 X130.246 Y97.05 E.14539
G1 X129.754 Y97.05 E.01635
G1 X126.654 Y93.95 E.14539
G1 X125.67 Y93.95 E.03265
G1 X122.571 Y97.05 E.14539
G1 X122.078 Y97.05 E.01635
G1 X119.951 Y94.923 E.09978
G1 X119.95 Y93.95 E.03225
G1 X120.606 Y93.95 E.02176
; WIPE_START
G1 F24000
G1 X119.95 Y93.95 E-.24927
G1 X119.951 Y94.923 E-.36949
G1 X120.213 Y95.186 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I-.744 J.963 P1  F30000
G1 X131.102 Y103.602 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2715
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.304 J.003 E.01379
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.114 Y102.211 E.00696
G1 X129.29 Y102.387 E.00766
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2715
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.6 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z14.6
G1 Z14.2
G1 E.8 F1800
G1 F2715
G1 X129 Y103.406 E.0153
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2715
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2715
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2715
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/88
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
G3 Z14.6 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.398 Y111.486 E.46734
G3 X119.604 Y111.569 I-1.398 J.01 E.14355
G1 X119.602 Y93.602 E.59601
G1 X140.398 Y93.602 E.68983
G1 X140.398 Y111.486 E.59325
G3 X137.602 Y111.494 I-1.398 J.01 E.14608
G1 X137.602 Y97.398 E.46758
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X122.79 Y111.496 E.42114
G3 X119.212 Y111.589 I-1.79 J-.001 E.16989
G1 X119.21 Y93.21 E.56473
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y111.496 E.56187
G3 X137.21 Y111.498 I-1.79 J-.001 E.17266
G1 X137.21 Y97.79 E.42122
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.841 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I.728 J-.975 P1  F30000
G1 X122.05 Y99.199 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.05 Y97.571 E.05401
G1 X119.951 Y99.669 E.09844
G1 X119.952 Y102.6 E.09722
G1 X122.05 Y104.698 E.09842
G1 X122.05 Y105.246 E.0182
G1 X119.952 Y107.344 E.0984
G1 X119.953 Y110.277 E.09728
G1 X121.818 Y112.142 E.08752
G1 X121.927 Y111.989 E.00624
G2 X122.05 Y110.568 I-2.788 J-.957 E.04779
; WIPE_START
G1 F24000
G1 X122.05 Y111.47 E-.34269
G1 X121.927 Y111.989 E-.20277
G1 X121.818 Y112.142 E-.07143
G1 X121.552 Y111.876 E-.14312
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I.097 J1.213 P1  F30000
G1 X137.95 Y110.568 Z14.8
G1 Z14.4
G1 E.8 F1800
G1 F2715
G1 X137.95 Y111.477 E.03015
M73 P88 R2
G2 X138.18 Y112.144 I1.503 J-.144 E.02361
G1 X140.05 Y110.274 E.08772
G1 X140.05 Y107.346 E.09715
G1 X137.95 Y105.246 E.09848
G1 X137.95 Y104.698 E.0182
G1 X140.05 Y102.598 E.09848
G1 X140.05 Y99.67 E.09715
G1 X137.95 Y97.571 E.09848
G1 X137.95 Y99.199 E.05401
G1 X139.393 Y93.95 F30000
G1 F2715
G1 X140.05 Y93.95 E.02177
G1 X140.05 Y94.922 E.03225
G1 X137.922 Y97.05 E.09979
G1 X137.429 Y97.05 E.01635
G1 X134.33 Y93.95 E.14539
G1 X133.346 Y93.95 E.03265
G1 X130.246 Y97.05 E.14539
G1 X129.754 Y97.05 E.01635
G1 X126.654 Y93.95 E.14539
G1 X125.67 Y93.95 E.03265
G1 X122.571 Y97.05 E.14539
G1 X122.078 Y97.05 E.01635
G1 X119.951 Y94.923 E.09978
G1 X119.95 Y93.95 E.03225
G1 X120.606 Y93.95 E.02176
; WIPE_START
G1 F24000
G1 X119.95 Y93.95 E-.24927
G1 X119.951 Y94.923 E-.36949
G1 X120.213 Y95.186 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I-.744 J.963 P1  F30000
G1 X131.102 Y103.602 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2715
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
M73 P89 R2
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.304 J.003 E.01378
G1 X128.71 Y103.21 E.02218
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2715
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z14.8 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z14.8
G1 Z14.4
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2715
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2715
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2715
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2715
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/88
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
G3 Z14.8 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z14.8
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.398 Y111.486 E.46734
G3 X119.604 Y111.569 I-1.398 J.006 E.14332
G1 X119.602 Y93.602 E.59601
G1 X140.398 Y93.602 E.68983
G1 X140.398 Y111.486 E.59325
G3 X137.602 Y111.494 I-1.398 J.01 E.14608
G1 X137.602 Y97.398 E.46758
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X122.79 Y111.496 E.42114
G3 X119.212 Y111.589 I-1.79 J-.005 E.16965
G1 X119.21 Y93.21 E.56473
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y111.496 E.56187
G3 X137.21 Y111.498 I-1.79 J-.001 E.17266
G1 X137.21 Y97.79 E.42122
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.841 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I.728 J-.975 P1  F30000
G1 X122.05 Y99.199 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.05 Y97.571 E.05401
G1 X119.951 Y99.669 E.09844
G1 X119.952 Y102.6 E.09722
G1 X122.05 Y104.698 E.09842
G1 X122.05 Y105.246 E.0182
G1 X119.952 Y107.344 E.0984
G1 X119.953 Y110.277 E.09728
G1 X121.822 Y112.146 E.08771
G1 X121.876 Y112.077 E.00291
G2 X122.05 Y110.569 I-2.549 J-1.058 E.051
; WIPE_START
G1 F24000
G1 X122.026 Y111.712 E-.43411
G1 X121.876 Y112.077 E-.15017
G1 X121.822 Y112.146 E-.03332
G1 X121.557 Y111.881 E-.1424
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I.097 J1.213 P1  F30000
G1 X137.95 Y110.568 Z15
G1 Z14.6
G1 E.8 F1800
G1 F2715
G1 X137.95 Y111.477 E.03015
G2 X138.18 Y112.144 I1.503 J-.144 E.02361
G1 X140.05 Y110.274 E.08772
G1 X140.05 Y107.346 E.09715
G1 X137.95 Y105.246 E.09848
G1 X137.95 Y104.698 E.0182
G1 X140.05 Y102.598 E.09848
G1 X140.05 Y99.67 E.09715
G1 X137.95 Y97.571 E.09848
G1 X137.95 Y99.199 E.05401
G1 X139.393 Y93.95 F30000
G1 F2715
G1 X140.05 Y93.95 E.02177
G1 X140.05 Y94.922 E.03225
G1 X137.922 Y97.05 E.09979
G1 X137.429 Y97.05 E.01635
G1 X134.33 Y93.95 E.14539
G1 X133.346 Y93.95 E.03265
G1 X130.246 Y97.05 E.14539
G1 X129.754 Y97.05 E.01635
G1 X126.654 Y93.95 E.14539
G1 X125.67 Y93.95 E.03265
G1 X122.571 Y97.05 E.14539
G1 X122.078 Y97.05 E.01635
G1 X119.951 Y94.923 E.09978
G1 X119.95 Y93.95 E.03225
G1 X120.606 Y93.95 E.02176
; WIPE_START
G1 F24000
G1 X119.95 Y93.95 E-.24927
G1 X119.951 Y94.923 E-.36949
G1 X120.213 Y95.186 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I-.744 J.963 P1  F30000
G1 X131.102 Y103.602 Z15
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2715
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.006 J.294 E.01391
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.291 J-.009 E.01394
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2715
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z15
G1 Z14.6
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2715
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2715
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2715
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2715
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/88
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
G3 Z15 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z15
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.398 Y111.486 E.46734
G3 X119.604 Y111.569 I-1.398 J.012 E.14366
G1 X119.602 Y93.602 E.59601
G1 X140.398 Y93.602 E.68983
G1 X140.398 Y111.486 E.59325
G3 X137.602 Y111.494 I-1.398 J.01 E.14608
G1 X137.602 Y97.398 E.46758
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X122.79 Y111.496 E.42114
G3 X119.212 Y111.589 I-1.79 J.002 E.17004
G1 X119.21 Y93.21 E.56473
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y111.496 E.56187
G3 X137.21 Y111.498 I-1.79 J-.001 E.17266
G1 X137.21 Y97.79 E.42122
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.841 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I.728 J-.975 P1  F30000
G1 X122.05 Y99.199 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.05 Y97.571 E.05401
G1 X119.951 Y99.669 E.09844
G1 X119.952 Y102.6 E.09722
G1 X122.05 Y104.698 E.09842
G1 X122.05 Y105.246 E.0182
G1 X119.952 Y107.344 E.0984
G1 X119.953 Y110.277 E.09728
G1 X121.818 Y112.142 E.0875
G1 X121.931 Y111.981 E.00653
G2 X122.05 Y110.568 I-2.833 J-.949 E.0475
; WIPE_START
G1 F24000
G1 X122.05 Y111.47 E-.34273
G1 X121.931 Y111.981 E-.19951
G1 X121.818 Y112.142 E-.07475
G1 X121.552 Y111.876 E-.14301
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I.097 J1.213 P1  F30000
G1 X137.95 Y110.569 Z15.2
G1 Z14.8
G1 E.8 F1800
G1 F2715
G1 X137.95 Y111.475 E.03006
G2 X138.178 Y112.146 I1.49 J-.13 E.02375
G1 X140.05 Y110.274 E.08782
G1 X140.05 Y107.346 E.09715
G1 X137.95 Y105.246 E.09848
G1 X137.95 Y104.698 E.0182
G1 X140.05 Y102.598 E.09848
G1 X140.05 Y99.67 E.09715
G1 X137.95 Y97.571 E.09848
G1 X137.95 Y99.199 E.05401
G1 X139.393 Y93.95 F30000
G1 F2715
G1 X140.05 Y93.95 E.02177
G1 X140.05 Y94.922 E.03225
G1 X137.922 Y97.05 E.09979
G1 X137.429 Y97.05 E.01635
G1 X134.33 Y93.95 E.14539
G1 X133.346 Y93.95 E.03265
G1 X130.246 Y97.05 E.14539
M73 P90 R2
G1 X129.754 Y97.05 E.01635
G1 X126.654 Y93.95 E.14539
G1 X125.67 Y93.95 E.03265
G1 X122.571 Y97.05 E.14539
G1 X122.078 Y97.05 E.01635
G1 X119.951 Y94.923 E.09978
G1 X119.95 Y93.95 E.03225
G1 X120.606 Y93.95 E.02176
; WIPE_START
G1 F24000
G1 X119.95 Y93.95 E-.24927
G1 X119.951 Y94.923 E-.36949
G1 X120.213 Y95.186 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I-.744 J.963 P1  F30000
G1 X131.102 Y103.602 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2715
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.007 J.293 E.01391
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.304 J.003 E.01378
G1 X128.71 Y103.21 E.02218
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2715
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.2 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z15.2
G1 Z14.8
G1 E.8 F1800
G1 F2715
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2715
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2715
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2715
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/88
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
G3 Z15.2 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z15.2
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.398 Y111.486 E.46734
G3 X119.604 Y111.569 I-1.398 J.012 E.14366
G1 X119.602 Y93.602 E.59601
G1 X140.398 Y93.602 E.68983
G1 X140.398 Y111.486 E.59325
G3 X137.602 Y111.494 I-1.398 J.01 E.14608
G1 X137.602 Y97.398 E.46758
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X122.79 Y111.496 E.42114
G3 X119.212 Y111.589 I-1.79 J.002 E.17004
G1 X119.21 Y93.21 E.56473
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y111.496 E.56187
G3 X137.21 Y111.498 I-1.79 J-.001 E.17266
G1 X137.21 Y97.79 E.42122
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.841 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I.728 J-.975 P1  F30000
G1 X122.05 Y99.199 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.05 Y97.571 E.05401
G1 X119.951 Y99.669 E.09844
G1 X119.952 Y102.6 E.09722
G1 X122.05 Y104.698 E.09842
G1 X122.05 Y105.246 E.0182
G1 X119.952 Y107.344 E.0984
G1 X119.953 Y110.277 E.09728
G1 X121.822 Y112.146 E.08772
G1 X121.872 Y112.082 E.00271
G2 X122.05 Y110.568 I-2.543 J-1.065 E.0512
; WIPE_START
G1 F24000
G1 X122.027 Y111.702 E-.43072
G1 X121.872 Y112.082 E-.15592
G1 X121.822 Y112.146 E-.03109
G1 X121.558 Y111.882 E-.14227
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I.097 J1.213 P1  F30000
G1 X137.95 Y110.569 Z15.4
G1 Z15
G1 E.8 F1800
G1 F2715
G1 X137.95 Y111.474 E.03005
G2 X138.178 Y112.146 I1.495 J-.131 E.02375
G1 X140.05 Y110.274 E.08782
G1 X140.05 Y107.346 E.09715
G1 X137.95 Y105.246 E.09848
G1 X137.95 Y104.698 E.0182
G1 X140.05 Y102.598 E.09848
G1 X140.05 Y99.67 E.09715
G1 X137.95 Y97.571 E.09848
G1 X137.95 Y99.199 E.05401
G1 X139.393 Y93.95 F30000
G1 F2715
G1 X140.05 Y93.95 E.02177
G1 X140.05 Y94.922 E.03225
G1 X137.922 Y97.05 E.09979
G1 X137.429 Y97.05 E.01635
G1 X134.33 Y93.95 E.14539
G1 X133.346 Y93.95 E.03265
G1 X130.246 Y97.05 E.14539
G1 X129.754 Y97.05 E.01635
G1 X126.654 Y93.95 E.14539
G1 X125.67 Y93.95 E.03265
G1 X122.571 Y97.05 E.14539
G1 X122.078 Y97.05 E.01635
G1 X119.951 Y94.923 E.09978
G1 X119.95 Y93.95 E.03225
G1 X120.606 Y93.95 E.02176
; WIPE_START
G1 F24000
G1 X119.95 Y93.95 E-.24927
G1 X119.951 Y94.923 E-.36949
G1 X120.213 Y95.186 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I-.744 J.963 P1  F30000
G1 X131.102 Y103.602 Z15.4
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2715
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.007 J.293 E.01391
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.304 J.003 E.01378
G1 X128.71 Y103.21 E.02218
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2715
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.4 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z15.4
G1 Z15
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2715
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2715
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2715
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2715
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 76/88
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
G3 Z15.4 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z15.4
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.398 Y111.486 E.46734
G3 X119.604 Y111.569 I-1.398 J.012 E.14366
G1 X119.602 Y93.602 E.59601
G1 X140.398 Y93.602 E.68983
G1 X140.398 Y111.486 E.59325
G3 X137.602 Y111.494 I-1.398 J.01 E.14608
G1 X137.602 Y97.398 E.46758
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X122.79 Y111.496 E.42114
G3 X119.212 Y111.589 I-1.79 J.002 E.17004
G1 X119.21 Y93.21 E.56473
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y111.496 E.56187
G3 X137.21 Y111.498 I-1.79 J-.001 E.17266
G1 X137.21 Y97.79 E.42122
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.841 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I.728 J-.975 P1  F30000
G1 X122.05 Y99.199 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.05 Y97.571 E.05401
G1 X119.951 Y99.669 E.09844
G1 X119.952 Y102.6 E.09722
G1 X122.05 Y104.698 E.09842
G1 X122.05 Y105.246 E.0182
G1 X119.952 Y107.344 E.0984
G1 X119.953 Y110.277 E.09728
G1 X121.822 Y112.146 E.08772
G1 X121.872 Y112.083 E.00267
G2 X122.05 Y110.568 I-2.57 J-1.07 E.05123
; WIPE_START
G1 F24000
G1 X122.027 Y111.701 E-.43045
G1 X121.872 Y112.083 E-.1567
G1 X121.822 Y112.146 E-.03059
G1 X121.558 Y111.882 E-.14226
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I.097 J1.213 P1  F30000
G1 X137.95 Y110.569 Z15.6
G1 Z15.2
G1 E.8 F1800
G1 F2715
G1 X137.95 Y111.474 E.03004
G2 X138.178 Y112.146 I1.471 J-.123 E.02377
G1 X140.05 Y110.274 E.08782
G1 X140.05 Y107.346 E.09715
G1 X137.95 Y105.246 E.09848
G1 X137.95 Y104.698 E.0182
G1 X140.05 Y102.598 E.09848
G1 X140.05 Y99.67 E.09715
G1 X137.95 Y97.571 E.09848
M73 P91 R2
G1 X137.95 Y99.199 E.05401
G1 X139.393 Y93.95 F30000
G1 F2715
G1 X140.05 Y93.95 E.02177
G1 X140.05 Y94.922 E.03225
G1 X137.922 Y97.05 E.09979
G1 X137.429 Y97.05 E.01635
G1 X134.33 Y93.95 E.14539
G1 X133.346 Y93.95 E.03265
G1 X130.246 Y97.05 E.14539
G1 X129.754 Y97.05 E.01635
G1 X126.654 Y93.95 E.14539
G1 X125.67 Y93.95 E.03265
G1 X122.571 Y97.05 E.14539
G1 X122.078 Y97.05 E.01635
G1 X119.951 Y94.923 E.09978
G1 X119.95 Y93.95 E.03225
G1 X120.606 Y93.95 E.02176
; WIPE_START
G1 F24000
G1 X119.95 Y93.95 E-.24927
G1 X119.951 Y94.923 E-.36949
G1 X120.213 Y95.186 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I-.744 J.963 P1  F30000
G1 X131.102 Y103.602 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2715
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.304 J.003 E.01379
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2715
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.6 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z15.6
G1 Z15.2
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2715
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2715
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2715
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2715
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 77/88
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
G3 Z15.6 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z15.6
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.398 Y111.486 E.46734
G3 X119.604 Y111.569 I-1.398 J.01 E.14355
G1 X119.602 Y93.602 E.59601
G1 X140.398 Y93.602 E.68983
G1 X140.398 Y111.486 E.59325
G3 X137.602 Y111.486 I-1.398 J.01 E.14633
G1 X137.602 Y97.398 E.46734
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X122.79 Y111.496 E.42114
G3 X119.212 Y111.589 I-1.79 J-.001 E.16989
G1 X119.21 Y93.21 E.56473
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y111.496 E.56187
G3 X137.21 Y111.496 I-1.79 J-.001 E.17274
G1 X137.21 Y97.79 E.42114
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.841 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I.728 J-.975 P1  F30000
G1 X122.05 Y99.199 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.05 Y97.571 E.05401
G1 X119.951 Y99.669 E.09844
G1 X119.952 Y102.6 E.09722
G1 X122.05 Y104.698 E.09842
G1 X122.05 Y105.246 E.0182
G1 X119.952 Y107.344 E.0984
G1 X119.953 Y110.277 E.09728
G1 X121.821 Y112.145 E.08764
G1 X121.945 Y111.949 E.00769
G2 X122.05 Y110.567 I-2.774 J-.904 E.04643
; WIPE_START
G1 F24000
G1 X122.05 Y111.47 E-.34294
G1 X121.945 Y111.949 E-.18657
G1 X121.821 Y112.145 E-.08808
G1 X121.556 Y111.88 E-.14241
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I.097 J1.213 P1  F30000
G1 X137.95 Y110.568 Z15.8
G1 Z15.4
G1 E.8 F1800
G1 F2715
G1 X137.95 Y111.47 E.02992
G2 X138.18 Y112.144 I1.322 J-.074 E.02391
G1 X140.05 Y110.274 E.08772
G1 X140.05 Y107.346 E.09715
G1 X137.95 Y105.246 E.09848
G1 X137.95 Y104.698 E.0182
G1 X140.05 Y102.598 E.09848
G1 X140.05 Y99.67 E.09715
G1 X137.95 Y97.571 E.09848
G1 X137.95 Y99.199 E.05401
G1 X139.393 Y93.95 F30000
G1 F2715
G1 X140.05 Y93.95 E.02177
G1 X140.05 Y94.922 E.03225
G1 X137.922 Y97.05 E.09979
G1 X137.429 Y97.05 E.01635
G1 X134.33 Y93.95 E.14539
G1 X133.346 Y93.95 E.03265
G1 X130.246 Y97.05 E.14539
G1 X129.754 Y97.05 E.01635
G1 X126.654 Y93.95 E.14539
G1 X125.67 Y93.95 E.03265
G1 X122.571 Y97.05 E.14539
G1 X122.078 Y97.05 E.01635
G1 X119.951 Y94.923 E.09978
G1 X119.95 Y93.95 E.03225
G1 X120.606 Y93.95 E.02176
; WIPE_START
G1 F24000
G1 X119.95 Y93.95 E-.24927
G1 X119.951 Y94.923 E-.36949
G1 X120.213 Y95.186 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I-.744 J.963 P1  F30000
G1 X131.102 Y103.602 Z15.8
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2715
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.304 J.003 E.01378
G1 X128.71 Y103.21 E.02218
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2715
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z15.8 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z15.8
G1 Z15.4
G1 E.8 F1800
G1 F2715
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2715
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2715
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2715
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 78/88
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
G3 Z15.8 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z15.8
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.398 Y111.486 E.46734
G3 X119.604 Y111.569 I-1.398 J.013 E.14378
G1 X119.602 Y93.602 E.59601
G1 X140.398 Y93.602 E.68983
G1 X140.398 Y111.486 E.59325
G3 X137.602 Y111.494 I-1.398 J.01 E.14608
G1 X137.602 Y97.398 E.46758
G1 X122.458 Y97.398 E.50236
M73 P92 R2
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X122.79 Y111.496 E.42114
G3 X119.212 Y111.589 I-1.79 J.004 E.17015
G1 X119.21 Y93.21 E.56473
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y111.496 E.56187
G3 X137.21 Y111.498 I-1.79 J-.001 E.17266
G1 X137.21 Y97.79 E.42122
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.841 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I.728 J-.975 P1  F30000
G1 X122.05 Y99.199 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.05 Y97.571 E.05401
G1 X119.951 Y99.669 E.09844
G1 X119.952 Y102.6 E.09722
G1 X122.05 Y104.698 E.09842
G1 X122.05 Y105.246 E.0182
G1 X119.952 Y107.344 E.0984
G1 X119.953 Y110.277 E.09728
G1 X121.818 Y112.142 E.08752
G1 X121.928 Y111.986 E.00634
G2 X122.05 Y110.568 I-2.827 J-.956 E.04767
; WIPE_START
G1 F24000
G1 X122.05 Y111.469 E-.34261
G1 X121.928 Y111.986 E-.20162
G1 X121.818 Y112.142 E-.07267
G1 X121.552 Y111.876 E-.1431
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I.097 J1.213 P1  F30000
G1 X137.95 Y110.569 Z16
G1 Z15.6
G1 E.8 F1800
G1 F2715
G1 X137.95 Y111.477 E.03014
G2 X138.178 Y112.146 I1.606 J-.172 E.02363
G1 X140.05 Y110.274 E.08782
G1 X140.05 Y107.346 E.09715
G1 X137.95 Y105.246 E.09848
G1 X137.95 Y104.698 E.0182
G1 X140.05 Y102.598 E.09848
G1 X140.05 Y99.67 E.09715
G1 X137.95 Y97.571 E.09848
G1 X137.95 Y99.199 E.05401
G1 X139.393 Y93.95 F30000
G1 F2715
G1 X140.05 Y93.95 E.02177
G1 X140.05 Y94.922 E.03225
G1 X137.922 Y97.05 E.09979
G1 X137.429 Y97.05 E.01635
G1 X134.33 Y93.95 E.14539
G1 X133.346 Y93.95 E.03265
G1 X130.246 Y97.05 E.14539
G1 X129.754 Y97.05 E.01635
G1 X126.654 Y93.95 E.14539
G1 X125.67 Y93.95 E.03265
G1 X122.571 Y97.05 E.14539
G1 X122.078 Y97.05 E.01635
G1 X119.951 Y94.923 E.09978
G1 X119.95 Y93.95 E.03225
G1 X120.606 Y93.95 E.02176
; WIPE_START
G1 F24000
G1 X119.95 Y93.95 E-.24927
G1 X119.951 Y94.923 E-.36949
G1 X120.213 Y95.186 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I-.744 J.963 P1  F30000
G1 X131.102 Y103.602 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2715
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X130.71 Y102.387 E.02529
M73 P92 R1
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.007 J.293 E.01391
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.989 Y103.211 I.291 J-.009 E.01394
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2715
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z16
G1 Z15.6
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2715
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2715
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2715
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2715
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 79/88
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
G3 Z16 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z16
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.398 Y111.486 E.46734
G3 X119.604 Y111.569 I-1.398 J.014 E.14379
G1 X119.602 Y93.602 E.59601
G1 X140.398 Y93.602 E.68983
G1 X140.398 Y111.486 E.59325
G3 X137.602 Y111.494 I-1.398 J.01 E.14608
G1 X137.602 Y97.398 E.46758
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X122.79 Y111.496 E.42114
G3 X119.212 Y111.589 I-1.79 J.004 E.17016
G1 X119.21 Y93.21 E.56473
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y111.496 E.56187
G3 X137.21 Y111.498 I-1.79 J-.001 E.17266
G1 X137.21 Y97.79 E.42122
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.841 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I.728 J-.975 P1  F30000
G1 X122.05 Y99.199 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.05 Y97.571 E.05401
G1 X119.951 Y99.669 E.09844
G1 X119.952 Y102.6 E.09722
G1 X122.05 Y104.698 E.09842
G1 X122.05 Y105.246 E.0182
G1 X119.952 Y107.344 E.0984
G1 X119.953 Y110.277 E.09728
G1 X121.821 Y112.145 E.08764
G1 X121.948 Y111.943 E.00791
G2 X122.05 Y110.567 I-2.814 J-.899 E.0462
; WIPE_START
G1 F24000
G1 X122.05 Y111.47 E-.34293
G1 X121.948 Y111.943 E-.18405
G1 X121.821 Y112.145 E-.09067
G1 X121.556 Y111.88 E-.14236
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I.097 J1.213 P1  F30000
G1 X137.95 Y110.569 Z16.2
G1 Z15.8
G1 E.8 F1800
G1 F2715
G1 X137.95 Y111.481 E.03025
G2 X138.178 Y112.146 I1.378 J-.099 E.02359
G1 X140.05 Y110.274 E.08781
G1 X140.05 Y107.346 E.09715
G1 X137.95 Y105.246 E.09848
G1 X137.95 Y104.698 E.0182
G1 X140.05 Y102.598 E.09848
G1 X140.05 Y99.67 E.09715
G1 X137.95 Y97.571 E.09848
G1 X137.95 Y99.199 E.05401
G1 X139.393 Y93.95 F30000
G1 F2715
G1 X140.05 Y93.95 E.02177
G1 X140.05 Y94.922 E.03225
G1 X137.922 Y97.05 E.09979
G1 X137.429 Y97.05 E.01635
G1 X134.33 Y93.95 E.14539
G1 X133.346 Y93.95 E.03265
G1 X130.246 Y97.05 E.14539
G1 X129.754 Y97.05 E.01635
G1 X126.654 Y93.95 E.14539
G1 X125.67 Y93.95 E.03265
G1 X122.571 Y97.05 E.14539
G1 X122.078 Y97.05 E.01635
G1 X119.951 Y94.923 E.09978
G1 X119.95 Y93.95 E.03225
G1 X120.606 Y93.95 E.02176
; WIPE_START
G1 F24000
G1 X119.95 Y93.95 E-.24927
G1 X119.951 Y94.923 E-.36949
G1 X120.213 Y95.186 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I-.744 J.963 P1  F30000
G1 X131.102 Y103.602 Z16.2
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2715
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
M73 P93 R1
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.291 J-.009 E.01393
G1 X128.71 Y103.21 E.02218
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2715
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.2 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z16.2
G1 Z15.8
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2715
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2715
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2715
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2715
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 80/88
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
G3 Z16.2 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z16.2
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.398 Y111.486 E.46734
G3 X119.604 Y111.569 I-1.398 J.006 E.14332
G1 X119.602 Y93.602 E.59601
G1 X140.398 Y93.602 E.68983
G1 X140.398 Y111.486 E.59325
G3 X137.602 Y111.488 I-1.398 J.01 E.14628
G1 X137.602 Y97.398 E.46738
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X122.79 Y111.496 E.42114
G3 X119.212 Y111.589 I-1.79 J-.005 E.16965
G1 X119.21 Y93.21 E.56473
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y111.496 E.56187
G3 X137.21 Y111.496 I-1.79 J-.001 E.17273
G1 X137.21 Y97.79 E.42116
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.841 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I.728 J-.975 P1  F30000
G1 X122.05 Y99.199 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2715
G1 X122.05 Y97.571 E.05401
G1 X119.951 Y99.669 E.09844
G1 X119.952 Y102.6 E.09722
G1 X122.05 Y104.698 E.09842
G1 X122.05 Y105.246 E.0182
G1 X119.952 Y107.344 E.0984
G1 X119.953 Y110.277 E.09728
G1 X121.822 Y112.146 E.0877
G1 X121.875 Y112.078 E.00287
G2 X122.05 Y110.569 I-2.547 J-1.059 E.05104
; WIPE_START
G1 F24000
G1 X122.026 Y111.716 E-.43582
G1 X121.875 Y112.078 E-.14895
G1 X121.822 Y112.146 E-.03285
G1 X121.557 Y111.881 E-.14237
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I.097 J1.213 P1  F30000
G1 X137.95 Y110.569 Z16.4
G1 Z16
G1 E.8 F1800
G1 F2715
G1 X137.95 Y111.472 E.02995
G2 X138.178 Y112.146 I1.597 J-.162 E.02382
G1 X140.05 Y110.274 E.08782
G1 X140.05 Y107.346 E.09715
G1 X137.95 Y105.246 E.09848
G1 X137.95 Y104.698 E.0182
G1 X140.05 Y102.598 E.09848
G1 X140.05 Y99.67 E.09715
G1 X137.95 Y97.571 E.09848
G1 X137.95 Y99.199 E.05401
G1 X139.393 Y93.95 F30000
G1 F2715
G1 X140.05 Y93.95 E.02177
G1 X140.05 Y94.922 E.03225
G1 X137.922 Y97.05 E.09979
G1 X137.429 Y97.05 E.01635
G1 X134.33 Y93.95 E.14539
G1 X133.346 Y93.95 E.03265
G1 X130.246 Y97.05 E.14539
G1 X129.754 Y97.05 E.01635
G1 X126.654 Y93.95 E.14539
G1 X125.67 Y93.95 E.03265
G1 X122.571 Y97.05 E.14539
G1 X122.078 Y97.05 E.01635
G1 X119.951 Y94.923 E.09978
G1 X119.95 Y93.95 E.03225
G1 X120.606 Y93.95 E.02176
; WIPE_START
G1 F24000
G1 X119.95 Y93.95 E-.24927
G1 X119.951 Y94.923 E-.36949
G1 X120.213 Y95.186 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I-.744 J.963 P1  F30000
G1 X131.102 Y103.602 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2715
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2715
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.291 J-.009 E.01394
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2715
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.4 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z16.4
G1 Z16
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2715
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F2715
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2715
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2715
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 81/88
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
G3 Z16.4 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z16.4
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2717
G1 X122.398 Y111.486 E.46734
G3 X119.604 Y111.569 I-1.398 J.006 E.14332
G1 X119.602 Y93.602 E.59601
G1 X140.398 Y93.602 E.68983
G1 X140.398 Y111.486 E.59325
G3 X137.602 Y111.486 I-1.398 J.01 E.14633
G1 X137.602 Y97.398 E.46734
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2717
G1 X122.79 Y111.496 E.42114
G3 X119.212 Y111.589 I-1.79 J-.005 E.16965
G1 X119.21 Y93.21 E.56473
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y111.496 E.56187
G3 X137.21 Y111.496 I-1.79 J-.001 E.17274
G1 X137.21 Y97.79 E.42114
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.841 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I.728 J-.975 P1  F30000
G1 X122.05 Y99.199 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F2717
G1 X122.05 Y97.571 E.05401
G1 X119.951 Y99.669 E.09844
G1 X119.952 Y102.6 E.09722
G1 X122.05 Y104.698 E.09842
G1 X122.05 Y105.246 E.0182
G1 X119.952 Y107.344 E.0984
G1 X119.953 Y110.277 E.09728
G1 X121.819 Y112.143 E.08754
G1 X121.93 Y111.983 E.00647
G2 X122.05 Y110.568 I-2.805 J-.949 E.04756
; WIPE_START
G1 F24000
G1 X122.05 Y111.469 E-.34257
G1 X121.93 Y111.983 E-.20025
G1 X121.819 Y112.143 E-.07415
G1 X121.553 Y111.877 E-.14303
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I.097 J1.213 P1  F30000
G1 X137.95 Y110.568 Z16.6
G1 Z16.2
G1 E.8 F1800
G1 F2717
G1 X137.95 Y111.466 E.02979
G2 X138.18 Y112.144 I1.22 J-.035 E.02409
G1 X140.05 Y110.274 E.08772
G1 X140.05 Y107.346 E.09715
G1 X137.95 Y105.246 E.09848
G1 X137.95 Y104.698 E.0182
G1 X140.05 Y102.598 E.09848
G1 X140.05 Y99.67 E.09715
G1 X137.95 Y97.571 E.09848
G1 X137.95 Y99.199 E.05401
G1 X139.393 Y93.95 F30000
G1 F2717
G1 X140.05 Y93.95 E.02177
G1 X140.05 Y94.922 E.03225
G1 X137.922 Y97.05 E.09979
G1 X137.429 Y97.05 E.01635
G1 X134.33 Y93.95 E.14539
G1 X133.346 Y93.95 E.03265
G1 X130.246 Y97.05 E.14539
M73 P94 R1
G1 X129.754 Y97.05 E.01635
G1 X126.654 Y93.95 E.14539
G1 X125.67 Y93.95 E.03265
G1 X122.571 Y97.05 E.14539
G1 X122.078 Y97.05 E.01635
G1 X119.951 Y94.923 E.09978
G1 X119.95 Y93.95 E.03225
G1 X120.606 Y93.95 E.02176
; WIPE_START
G1 F24000
G1 X119.95 Y93.95 E-.24927
G1 X119.951 Y94.923 E-.36949
G1 X120.213 Y95.186 E-.14124
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I-.744 J.963 P1  F30000
G1 X131.102 Y103.602 Z16.6
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F2717
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2717
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.007 J.293 E.01391
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.508 E.08548
G3 X127.989 Y103.211 I.291 J-.007 E.01387
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F2717
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.6 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z16.6
G1 Z16.2
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F2717
G1 X129 Y103.406 E.01531
G1 X130.75 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42322
G1 F2717
G1 X129.31 Y104.75 E.04462
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F2717
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F2717
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 82/88
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
G3 Z16.6 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z16.6
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3468
G1 X122.398 Y111.486 E.46734
G3 X119.604 Y111.569 I-1.398 J.012 E.14366
G1 X119.602 Y93.602 E.59601
G1 X140.398 Y93.602 E.68983
G1 X140.398 Y111.486 E.59325
G3 X137.602 Y111.494 I-1.398 J.01 E.14608
G1 X137.602 Y97.398 E.46758
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3468
G1 X122.79 Y111.496 E.42114
G3 X119.212 Y111.589 I-1.79 J.002 E.17004
G1 X119.21 Y93.21 E.56473
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y111.496 E.56187
G3 X137.21 Y111.498 I-1.79 J-.001 E.17266
G1 X137.21 Y97.79 E.42122
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.841 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I.185 J-1.203 P1  F30000
G1 X121.643 Y99.606 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3468
G1 X121.643 Y97.978 E.05401
G1 X120.358 Y99.262 E.06025
G1 X120.359 Y103.007 E.12422
G1 X121.643 Y104.291 E.06023
G1 X121.643 Y105.654 E.04521
G1 X120.359 Y106.937 E.0602
G1 X120.36 Y110.684 E.12429
G1 X121.526 Y111.85 E.05471
G2 X121.626 Y111.619 I-.341 J-.285 E.00848
G2 X121.643 Y110.245 I-7.052 J-.771 E.04562
G1 X121.014 Y94.357 F30000
G1 F3468
G1 X120.358 Y94.357 E.02176
G1 X120.358 Y95.33 E.03226
G1 X121.67 Y96.643 E.06158
G1 X122.978 Y96.643 E.04336
G1 X125.263 Y94.357 E.1072
G1 X127.061 Y94.357 E.05966
G1 X129.346 Y96.643 E.1072
G1 X130.654 Y96.643 E.04336
G1 X132.939 Y94.357 E.1072
G1 X134.737 Y94.357 E.05966
G1 X137.022 Y96.643 E.1072
G1 X138.33 Y96.643 E.04336
G1 X139.643 Y95.33 E.0616
G1 X139.643 Y94.357 E.03225
G1 X138.986 Y94.357 E.02177
G1 X138.357 Y99.606 F30000
G1 F3468
G1 X138.357 Y97.978 E.05401
G1 X139.643 Y99.263 E.06029
G1 X139.643 Y103.005 E.12415
G1 X138.357 Y104.291 E.06029
G1 X138.357 Y105.654 E.04521
G1 X139.643 Y106.939 E.06029
G1 X139.643 Y110.681 E.12415
G1 X138.471 Y111.853 E.05497
G3 X138.357 Y111.449 I.603 J-.387 E.01413
G1 X138.357 Y110.246 E.0399
G1 X140.05 Y111.409 F30000
G1 F3468
G1 X140.05 Y93.95 E.57915
G1 X119.95 Y93.95 E.66673
G1 X119.953 Y111.544 E.58361
G2 X122.05 Y111.469 I1.048 J-.055 E.10817
G1 X122.05 Y97.05 E.47833
G1 X137.95 Y97.05 E.52746
G1 X137.95 Y111.473 E.47845
G2 X140.05 Y111.469 I1.05 J.023 E.11104
; WIPE_START
G1 F24000
G1 X139.989 Y111.847 E-.14548
G1 X139.772 Y112.209 E-.16009
G1 X139.494 Y112.424 E-.13355
G1 X139.01 Y112.548 E-.18998
G1 X138.674 Y112.474 E-.1309
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I.926 J-.79 P1  F30000
G1 X131.102 Y103.602 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3468
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3468
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.007 J.293 E.01391
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.508 E.08548
G3 X127.989 Y103.211 I.291 J-.007 E.01387
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F3468
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z16.8 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z16.8
G1 Z16.4
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F3468
G1 X129 Y103.406 E.01531
G1 X130.75 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42322
G1 F3468
G1 X129.31 Y104.75 E.04462
G1 X129.25 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F3468
G1 X131.128 Y105.129 E.05773
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X129.19 Y105.129 E.00979
G1 X129.25 Y105.506 F30000
G1 F3468
G1 X131.506 Y105.506 E.06931
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X129.19 Y105.506 E.02138
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.494 Y105.506 E-.26436
G1 X128.494 Y104.202 E-.49564
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 83/88
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
G3 Z16.8 I.906 J-.812 P1  F30000
G1 X122.398 Y97.398 Z16.8
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3466
G1 X122.398 Y111.486 E.46734
G3 X119.604 Y111.569 I-1.398 J.013 E.14378
G1 X119.602 Y93.602 E.59601
G1 X140.398 Y93.602 E.68983
G1 X140.398 Y111.486 E.59325
G3 X137.602 Y111.494 I-1.398 J.01 E.14608
G1 X137.602 Y97.398 E.46758
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3466
G1 X122.79 Y111.496 E.42114
G3 X119.212 Y111.589 I-1.79 J.004 E.17015
G1 X119.21 Y93.21 E.56473
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y111.496 E.56187
G3 X137.21 Y111.498 I-1.79 J-.001 E.17266
G1 X137.21 Y97.79 E.42122
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.841 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I.185 J-1.203 P1  F30000
G1 X121.643 Y99.606 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3466
G1 X121.643 Y97.978 E.05401
G1 X120.358 Y99.262 E.06025
G1 X120.359 Y103.007 E.12422
G1 X121.643 Y104.291 E.06023
G1 X121.643 Y105.654 E.04521
G1 X120.359 Y106.937 E.0602
G1 X120.36 Y110.684 E.12429
G1 X121.532 Y111.856 E.055
G2 X121.627 Y111.617 I-.675 J-.405 E.00855
G2 X121.643 Y110.248 I-7.283 J-.77 E.04551
G1 X121.014 Y94.357 F30000
G1 F3466
G1 X120.358 Y94.357 E.02176
G1 X120.358 Y95.33 E.03226
G1 X121.67 Y96.643 E.06158
G1 X122.978 Y96.643 E.04336
G1 X125.263 Y94.357 E.1072
G1 X127.061 Y94.357 E.05966
G1 X129.346 Y96.643 E.1072
G1 X130.654 Y96.643 E.04336
G1 X132.939 Y94.357 E.1072
G1 X134.737 Y94.357 E.05966
G1 X137.022 Y96.643 E.1072
G1 X138.33 Y96.643 E.04336
G1 X139.643 Y95.33 E.0616
G1 X139.643 Y94.357 E.03225
G1 X138.986 Y94.357 E.02177
G1 X138.357 Y99.606 F30000
G1 F3466
G1 X138.357 Y97.978 E.05401
M73 P95 R1
G1 X139.643 Y99.263 E.06029
G1 X139.643 Y103.005 E.12415
G1 X138.357 Y104.291 E.06029
G1 X138.357 Y105.654 E.04521
G1 X139.643 Y106.939 E.06029
G1 X139.643 Y110.681 E.12415
G1 X138.469 Y111.855 E.05505
G3 X138.357 Y111.449 I.65 J-.397 E.01416
G1 X138.357 Y110.247 E.03986
G1 X140.05 Y111.41 F30000
G1 F3466
G1 X140.05 Y93.95 E.57915
G1 X119.95 Y93.95 E.66673
G1 X119.953 Y111.544 E.58361
G2 X122.043 Y111.539 I1.045 J-.078 E.10414
G1 X122.05 Y97.05 E.48065
G1 X137.95 Y97.05 E.52746
G1 X137.95 Y111.473 E.47845
G2 X140.05 Y111.47 I1.05 J.023 E.11104
; WIPE_START
G1 F24000
G1 X139.976 Y111.875 E-.15671
G1 X139.773 Y112.207 E-.14773
G1 X139.494 Y112.424 E-.13427
G1 X139.01 Y112.548 E-.18998
G1 X138.672 Y112.475 E-.13132
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I.926 J-.79 P1  F30000
G1 X131.102 Y103.602 Z17
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3466
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3466
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.004 J.296 E.01388
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.508 E.08548
G3 X127.988 Y103.211 I.291 J-.007 E.01387
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F3466
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z17
G1 Z16.6
G1 E.8 F1800
G1 F3466
G1 X129 Y103.406 E.01531
G1 X129.25 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423044
G1 F3466
G1 X130.69 Y104.75 E.0446
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F3466
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F3466
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
G1 X131.446 Y105.506 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 84/88
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
G3 Z17 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z17
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3470
G1 X122.398 Y111.486 E.46734
G3 X119.604 Y111.569 I-1.398 J.012 E.14366
G1 X119.602 Y93.602 E.59601
G1 X140.398 Y93.602 E.68983
G1 X140.398 Y111.486 E.59325
G3 X137.602 Y111.494 I-1.398 J.01 E.14608
G1 X137.602 Y97.398 E.46758
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3470
G1 X122.79 Y111.496 E.42114
G3 X119.212 Y111.589 I-1.79 J.002 E.17004
G1 X119.21 Y93.21 E.56473
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y111.496 E.56187
G3 X137.21 Y111.498 I-1.79 J-.001 E.17266
G1 X137.21 Y97.79 E.42122
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.841 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I.185 J-1.203 P1  F30000
G1 X121.643 Y99.606 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3470
G1 X121.643 Y97.978 E.05401
G1 X120.358 Y99.262 E.06025
G1 X120.359 Y103.007 E.12422
G1 X121.643 Y104.291 E.06023
G1 X121.643 Y105.654 E.04521
G1 X120.359 Y106.937 E.0602
G1 X120.36 Y110.684 E.12429
G1 X121.532 Y111.856 E.055
G2 X121.627 Y111.616 I-.552 J-.356 E.00861
G2 X121.643 Y110.248 I-7.278 J-.769 E.04547
G1 X121.014 Y94.357 F30000
G1 F3470
G1 X120.358 Y94.357 E.02176
G1 X120.358 Y95.33 E.03226
G1 X121.67 Y96.643 E.06158
G1 X122.978 Y96.643 E.04336
G1 X125.263 Y94.357 E.1072
G1 X127.061 Y94.357 E.05966
G1 X129.346 Y96.643 E.1072
G1 X130.654 Y96.643 E.04336
G1 X132.939 Y94.357 E.1072
G1 X134.737 Y94.357 E.05966
G1 X137.022 Y96.643 E.1072
G1 X138.33 Y96.643 E.04336
G1 X139.643 Y95.33 E.0616
G1 X139.643 Y94.357 E.03225
G1 X138.986 Y94.357 E.02177
G1 X138.357 Y99.606 F30000
G1 F3470
G1 X138.357 Y97.978 E.05401
G1 X139.643 Y99.263 E.06029
G1 X139.643 Y103.005 E.12415
G1 X138.357 Y104.291 E.06029
G1 X138.357 Y105.654 E.04521
G1 X139.643 Y106.939 E.06029
G1 X139.643 Y110.681 E.12415
G1 X138.469 Y111.855 E.05505
G3 X138.357 Y111.458 I.656 J-.399 E.01385
G1 X138.357 Y110.248 E.04015
G1 X140.05 Y111.409 F30000
G1 F3470
G1 X140.05 Y93.95 E.57915
G1 X119.95 Y93.95 E.66673
G1 X119.953 Y111.544 E.58361
G2 X122.043 Y111.539 I1.045 J-.053 E.1057
G1 X122.05 Y97.05 E.48065
G1 X137.95 Y97.05 E.52746
G1 X137.95 Y111.477 E.47859
G2 X140.05 Y111.469 I1.05 J.006 E.11006
; WIPE_START
G1 F24000
G1 X139.989 Y111.847 E-.14548
G1 X139.773 Y112.207 E-.15941
G1 X139.494 Y112.424 E-.13435
G1 X139.01 Y112.548 E-.18988
G1 X138.674 Y112.474 E-.13088
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I.926 J-.79 P1  F30000
G1 X131.102 Y103.602 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3470
G1 X131.897 Y103.602 E.02638
G1 X131.898 Y105.898 E.07616
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y103.603 E.07614
G1 X131.042 Y103.602 E.09753
G1 X130.71 Y103.21 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3470
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.007 J.293 E.01391
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.51 E.08541
G3 X127.988 Y103.211 I.299 J-.001 E.01384
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00769
G1 X129.113 Y102.21 E.00695
G1 X129.29 Y102.387 E.00769
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
G1 X131 Y103.406 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.230842
G1 F3470
G1 X131 Y102.406 E.01531
; WIPE_START
G1 F24000
G1 X131 Y103.406 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.2 I.544 J-1.089 P1  F30000
G1 X129 Y102.406 Z17.2
G1 Z16.8
G1 E.8 F1800
; LINE_WIDTH: 0.230842
G1 F3470
G1 X129 Y103.406 E.01531
G1 X130.75 Y104.75 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42322
G1 F3470
G1 X129.31 Y104.75 E.04462
G1 X131.128 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F3470
G1 X131.128 Y104.371 E.02327
G1 X128.871 Y104.372 E.06935
G1 X128.871 Y105.129 E.02327
G1 X131.068 Y105.129 E.06752
G1 X131.506 Y105.506 F30000
G1 F3470
G1 X131.505 Y103.994 E.04645
G1 X128.494 Y103.995 E.09253
G1 X128.494 Y105.506 E.04644
M73 P96 R1
G1 X131.446 Y105.506 E.09069
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.446 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 85/88
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
G3 Z17.2 I.918 J-.798 P1  F30000
G1 X122.398 Y97.398 Z17.2
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3480
G1 X122.398 Y111.486 E.46734
G3 X119.604 Y111.569 I-1.398 J.006 E.14332
G1 X119.602 Y93.602 E.59601
G1 X140.398 Y93.602 E.68983
G1 X140.398 Y111.486 E.59325
G3 X137.602 Y111.487 I-1.398 J.01 E.14631
G1 X137.602 Y97.398 E.46735
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3480
G1 X122.79 Y111.496 E.42114
G3 X119.212 Y111.589 I-1.79 J-.005 E.16965
G1 X119.21 Y93.21 E.56473
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y111.496 E.56187
G3 X137.21 Y111.496 I-1.79 J-.001 E.17274
G1 X137.21 Y97.79 E.42115
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.841 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I.185 J-1.203 P1  F30000
G1 X121.643 Y99.606 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F3480
G1 X121.643 Y97.978 E.05401
G1 X120.358 Y99.262 E.06025
G1 X120.359 Y103.007 E.12422
G1 X121.643 Y104.291 E.06023
G1 X121.643 Y105.654 E.04521
G1 X120.359 Y106.937 E.0602
G1 X120.36 Y110.684 E.12429
G1 X121.527 Y111.851 E.05475
G2 X121.626 Y111.619 I-.415 J-.315 E.00846
G2 X121.643 Y110.245 I-7.053 J-.771 E.04563
G1 X121.014 Y94.357 F30000
G1 F3480
G1 X120.358 Y94.357 E.02176
G1 X120.358 Y95.33 E.03226
G1 X121.67 Y96.643 E.06158
G1 X122.978 Y96.643 E.04336
G1 X125.263 Y94.357 E.1072
G1 X127.061 Y94.357 E.05966
G1 X129.346 Y96.643 E.1072
G1 X130.654 Y96.643 E.04336
G1 X132.939 Y94.357 E.1072
G1 X134.737 Y94.357 E.05966
G1 X137.022 Y96.643 E.1072
G1 X138.33 Y96.643 E.04336
G1 X139.643 Y95.33 E.0616
G1 X139.643 Y94.357 E.03225
G1 X138.986 Y94.357 E.02177
G1 X138.357 Y99.606 F30000
G1 F3480
G1 X138.357 Y97.978 E.05401
G1 X139.643 Y99.263 E.06029
G1 X139.643 Y103.005 E.12415
G1 X138.357 Y104.291 E.06029
G1 X138.357 Y105.654 E.04521
G1 X139.643 Y106.939 E.06029
G1 X139.643 Y110.681 E.12415
G1 X138.469 Y111.855 E.05505
M73 P96 R0
G3 X138.357 Y111.452 I.656 J-.399 E.01405
G1 X138.357 Y110.248 E.03996
G1 X140.05 Y111.41 F30000
G1 F3480
G1 X140.05 Y93.95 E.57915
G1 X119.95 Y93.95 E.66673
G1 X119.953 Y111.544 E.58361
G2 X122.05 Y111.469 I1.048 J-.055 E.10817
G1 X122.05 Y97.05 E.47833
G1 X137.95 Y97.05 E.52746
G1 X137.95 Y111.471 E.47837
G2 X140.05 Y111.47 I1.05 J.018 E.11065
; WIPE_START
G1 F24000
G1 X139.976 Y111.875 E-.15671
G1 X139.773 Y112.207 E-.14772
G1 X139.301 Y112.504 E-.21178
G1 X138.932 Y112.54 E-.14118
G1 X138.67 Y112.476 E-.1026
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I.93 J-.785 P1  F30000
G1 X131.578 Y104.078 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
G1 F3480
G1 X131.897 Y104.078 E.01059
G1 X131.898 Y105.898 E.06036
G1 X128.102 Y105.898 E.12591
G1 X128.102 Y104.078 E.06038
G1 X130.133 Y104.078 E.06737
G1 X131.518 Y104.078 E.04595
; WIPE_START
G1 F24000
G1 X131.897 Y104.078 E-.14412
G1 X131.898 Y105.699 E-.61588
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I1.098 J-.524 P1  F30000
G1 X130.71 Y103.21 Z17.4
G1 Z17
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3480
G1 X130.71 Y102.387 E.02529
G1 X130.887 Y102.21 E.00769
G1 X131.113 Y102.21 E.00695
G1 X131.29 Y102.387 E.00769
G1 X131.29 Y103.21 E.02529
G1 X131.99 Y103.21 E.0215
G3 X132.289 Y103.488 I.007 J.293 E.01391
G1 X132.29 Y106.29 E.08609
G1 X127.71 Y106.29 E.14073
G1 X127.71 Y103.508 E.08549
G3 X127.988 Y103.211 I.299 J.001 E.01376
G1 X128.71 Y103.21 E.02217
G1 X128.71 Y102.387 E.02528
G1 X128.887 Y102.21 E.00767
G1 X129.115 Y102.212 E.00701
G1 X129.29 Y102.387 E.00762
G1 X129.29 Y103.21 E.02529
G1 X130.65 Y103.21 E.04179
M204 S10000
; WIPE_START
G1 F24000
G1 X130.71 Y102.387 E-.31358
G1 X130.887 Y102.21 E-.09511
G1 X131.113 Y102.21 E-.08589
G1 X131.29 Y102.387 E-.09511
G1 X131.29 Y102.835 E-.17031
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.4 I-1.213 J.098 P1  F30000
G1 X131.506 Y105.506 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.419999
G1 F3480
G1 X131.505 Y104.47 E.03182
G1 X128.494 Y104.47 E.09253
G1 X128.494 Y105.506 E.03183
G1 X131.446 Y105.506 E.09069
G1 X130.988 Y105.153 F30000
; LINE_WIDTH: 0.372223
G1 F3480
G1 X131.152 Y105.153 E.00442
G1 X131.152 Y104.823 E.00883
G1 X128.847 Y104.823 E.06185
G1 X128.847 Y105.153 E.00884
G1 X130.928 Y105.153 E.05583
G1 X128.136 Y103.637 F30000
; LINE_WIDTH: 0.518088
G1 F3480
G1 X131.803 Y103.637 E.14197
; CHANGE_LAYER
; Z_HEIGHT: 17.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X129.803 Y103.637 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 86/88
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
G3 Z17.4 I.784 J-.931 P1  F30000
G1 X122.398 Y97.398 Z17.4
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F14601
G1 X122.398 Y111.486 E.46734
G3 X119.604 Y111.569 I-1.398 J.01 E.14355
G1 X119.602 Y93.602 E.59601
G1 X140.398 Y93.602 E.68983
G1 X140.398 Y111.486 E.59325
G3 X137.602 Y111.494 I-1.398 J.01 E.14608
G1 X137.602 Y97.398 E.46758
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X122.79 Y111.496 E.42114
G3 X119.212 Y111.589 I-1.79 J-.001 E.16989
G1 X119.21 Y93.21 E.56473
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y111.496 E.56187
G3 X137.21 Y111.498 I-1.79 J-.001 E.17266
G1 X137.21 Y97.79 E.42122
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.841 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I-1.179 J-.3 P1  F30000
G1 X119.798 Y111.737 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.406887
; LAYER_HEIGHT: 0.4
M106 S255
G1 F3000
G1 X120.364 Y112.302 E.04234
G2 X121.205 Y112.497 I.621 J-.77 E.04733
G1 X119.974 Y111.267 E.09218
G1 X119.974 Y110.621 E.03424
G1 X121.646 Y112.293 E.12526
G2 X121.93 Y111.93 I-.956 J-1.041 E.02449
G1 X119.974 Y109.974 E.14653
G1 X119.974 Y109.328 E.03424
G1 X122.028 Y111.382 E.15391
G1 X122.028 Y110.736 E.03423
G1 X119.974 Y108.682 E.15392
G1 X119.974 Y108.036 E.03424
G1 X122.028 Y110.09 E.15392
G1 X122.028 Y109.444 E.03423
G1 X119.974 Y107.39 E.15393
G1 X119.974 Y106.743 E.03424
G1 X122.028 Y108.798 E.15394
G1 X122.028 Y108.152 E.03423
G1 X119.974 Y106.097 E.15394
G1 X119.973 Y105.451 E.03424
G1 X122.028 Y107.506 E.15395
G1 X122.028 Y106.859 E.03423
G1 X119.973 Y104.805 E.15395
G1 X119.973 Y104.158 E.03424
G1 X122.028 Y106.213 E.15396
G1 X122.028 Y105.567 E.03423
G1 X119.973 Y103.512 E.15397
G1 X119.973 Y102.866 E.03424
G1 X122.028 Y104.921 E.15397
G1 X122.028 Y104.275 E.03423
G1 X119.973 Y102.22 E.15398
G1 X119.973 Y101.574 E.03424
G1 X122.028 Y103.629 E.15399
G1 X122.028 Y102.983 E.03423
G1 X119.973 Y100.927 E.15399
G1 X119.973 Y100.281 E.03424
G1 X122.028 Y102.337 E.154
G1 X122.028 Y101.69 E.03423
G1 X119.973 Y99.635 E.154
G1 X119.973 Y98.989 E.03424
G1 X122.028 Y101.044 E.15401
G1 X122.028 Y100.398 E.03423
G1 X119.972 Y98.342 E.15402
G1 X119.972 Y97.696 E.03424
G1 X122.028 Y99.752 E.15402
G1 X122.028 Y99.106 E.03423
G1 X119.972 Y97.05 E.15403
G1 X119.972 Y96.404 E.03424
G1 X122.028 Y98.46 E.15404
G1 X122.028 Y97.814 E.03423
G1 X119.972 Y95.758 E.15404
G1 X119.972 Y95.111 E.03424
G1 X122.028 Y97.167 E.15405
G1 X122.028 Y97.028 E.00738
G1 X122.535 Y97.028 E.02685
G1 X119.972 Y94.465 E.19203
G1 X119.972 Y93.972 E.02614
G1 X120.125 Y93.972 E.0081
G1 X123.181 Y97.028 E.22899
G1 X123.827 Y97.028 E.03423
G1 X120.771 Y93.972 E.22899
G1 X121.417 Y93.972 E.03423
G1 X124.473 Y97.028 E.22899
G1 X125.12 Y97.028 E.03423
G1 X122.063 Y93.972 E.22899
G1 X122.709 Y93.972 E.03423
G1 X125.766 Y97.028 E.22899
G1 X126.412 Y97.028 E.03423
G1 X123.355 Y93.972 E.22899
G1 X124.002 Y93.972 E.03423
G1 X127.058 Y97.028 E.22899
G1 X127.704 Y97.028 E.03423
G1 X124.648 Y93.972 E.22899
G1 X125.294 Y93.972 E.03423
G1 X128.35 Y97.028 E.22899
G1 X128.996 Y97.028 E.03423
G1 X125.94 Y93.972 E.22899
G1 X126.586 Y93.972 E.03423
G1 X129.643 Y97.028 E.22899
G1 X130.289 Y97.028 E.03423
G1 X127.232 Y93.972 E.22899
G1 X127.878 Y93.972 E.03423
G1 X130.935 Y97.028 E.22899
G1 X131.581 Y97.028 E.03423
G1 X128.525 Y93.972 E.22899
G1 X129.171 Y93.972 E.03423
G1 X132.227 Y97.028 E.22899
G1 X132.873 Y97.028 E.03423
G1 X129.817 Y93.972 E.22899
G1 X130.463 Y93.972 E.03423
G1 X133.519 Y97.028 E.22899
G1 X134.166 Y97.028 E.03423
G1 X131.109 Y93.972 E.22899
G1 X131.755 Y93.972 E.03423
G1 X134.812 Y97.028 E.22899
G1 X135.458 Y97.028 E.03423
G1 X132.401 Y93.972 E.22899
G1 X133.048 Y93.972 E.03423
G1 X136.104 Y97.028 E.22899
G1 X136.75 Y97.028 E.03423
G1 X133.694 Y93.972 E.22899
G1 X134.34 Y93.972 E.03423
G1 X137.599 Y97.231 E.24417
M106 S252.45
G1 X140.231 Y94.694 F30000
M106 S255
G1 F3000
G1 X139.509 Y93.972 E.05408
G1 X138.863 Y93.972 E.03423
G1 X140.028 Y95.137 E.08732
G1 X140.028 Y95.783 E.03423
G1 X138.217 Y93.972 E.13573
G1 X137.571 Y93.972 E.03423
G1 X140.028 Y96.429 E.18414
G1 X140.028 Y97.076 E.03423
G1 X136.924 Y93.972 E.23255
G1 X136.278 Y93.972 E.03423
G1 X140.028 Y97.722 E.28096
G1 X140.028 Y98.368 E.03423
G1 X135.632 Y93.972 E.32937
G1 X134.986 Y93.972 E.03423
G1 X140.028 Y99.014 E.37778
G1 X140.028 Y99.66 E.03423
G1 X137.972 Y97.604 E.15407
G1 X137.972 Y98.25 E.03423
G1 X140.028 Y100.306 E.15407
G1 X140.028 Y100.952 E.03423
G1 X137.972 Y98.896 E.15407
G1 X137.972 Y99.542 E.03423
G1 X140.028 Y101.599 E.15407
G1 X140.028 Y102.245 E.03423
G1 X137.972 Y100.188 E.15407
G1 X137.972 Y100.834 E.03423
G1 X140.028 Y102.891 E.15407
G1 X140.028 Y103.537 E.03423
M73 P97 R0
G1 X137.972 Y101.481 E.15407
G1 X137.972 Y102.127 E.03423
G1 X140.028 Y104.183 E.15407
G1 X140.028 Y104.829 E.03423
G1 X137.972 Y102.773 E.15407
G1 X137.972 Y103.419 E.03423
G1 X140.028 Y105.475 E.15407
G1 X140.028 Y106.121 E.03423
G1 X137.972 Y104.065 E.15407
G1 X137.972 Y104.711 E.03423
G1 X140.028 Y106.768 E.15407
G1 X140.028 Y107.414 E.03423
G1 X137.972 Y105.357 E.15407
G1 X137.972 Y106.003 E.03423
G1 X140.028 Y108.06 E.15407
G1 X140.028 Y108.706 E.03423
G1 X137.972 Y106.65 E.15407
G1 X137.972 Y107.296 E.03423
G1 X140.028 Y109.352 E.15407
G1 X140.028 Y109.998 E.03423
G1 X137.972 Y107.942 E.15407
G1 X137.972 Y108.588 E.03423
G1 X140.028 Y110.644 E.15407
G1 X140.028 Y111.291 E.03423
G1 X137.972 Y109.234 E.15407
G1 X137.972 Y109.88 E.03423
G1 X139.957 Y111.865 E.14871
G3 X139.697 Y112.251 I-1.07 J-.44 E.02483
G1 X137.972 Y110.526 E.12922
G1 X137.972 Y111.173 E.03423
G1 X139.285 Y112.486 E.09838
G3 X138.59 Y112.437 I-.276 J-1.046 E.03758
G1 X137.783 Y111.63 E.06046
M106 S252.45
; WIPE_START
G1 F24000
G1 X138.59 Y112.437 E-.43365
G1 X138.818 Y112.508 E-.09089
G1 X139.01 Y112.526 E-.07327
G1 X139.285 Y112.486 E-.10556
G1 X139.18 Y112.38 E-.05663
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I.937 J-.777 P1  F30000
G1 X131.898 Y103.603 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F14601
G1 X131.898 Y105.898 E.07614
G1 X128.102 Y105.898 E.12591
G1 X128.103 Y103.602 E.07616
G1 X131.838 Y103.603 E.12391
G1 X132.11 Y103.234 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X132.29 Y103.508 I-.116 J.272 E.01067
G1 X132.29 Y106.29 E.08549
G1 X127.71 Y106.29 E.14073
G1 X127.711 Y103.488 E.08609
G3 X128.01 Y103.21 I.299 J.021 E.01384
G1 X132.011 Y103.211 E.12293
G3 X132.053 Y103.216 I-.017 J.295 E.00129
M204 S10000
; WIPE_START
G1 F24000
G1 X132.192 Y103.284 E-.05902
G1 X132.271 Y103.4 E-.05342
G1 X132.29 Y103.508 E-.04149
G1 X132.29 Y105.103 E-.60607
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.6 I.14 J-1.209 P1  F30000
G1 X129.25 Y104.75 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423186
G1 F14601
G1 X130.69 Y104.75 E.04462
G1 X128.872 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F14601
G1 X131.129 Y105.129 E.06936
G1 X131.129 Y104.372 E.02326
G1 X128.872 Y104.371 E.06935
G1 X128.872 Y105.069 E.02143
G1 X128.494 Y105.506 F30000
G1 F14601
G1 X131.506 Y105.506 E.09253
G1 X131.506 Y103.995 E.04643
G1 X128.495 Y103.994 E.09253
G1 X128.494 Y105.446 E.0446
; CHANGE_LAYER
; Z_HEIGHT: 17.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X128.495 Y103.994 E-.55161
G1 X129.043 Y103.994 E-.20839
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 87/88
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
G3 Z17.6 I.857 J-.864 P1  F30000
G1 X122.398 Y97.398 Z17.6
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5054
G1 X122.398 Y111.486 E.46734
G3 X119.604 Y111.569 I-1.398 J.01 E.14354
G1 X119.602 Y93.602 E.59601
G1 X140.398 Y93.602 E.68983
G1 X140.398 Y111.486 E.59325
G3 X137.602 Y111.486 I-1.398 J.01 E.14633
G1 X137.602 Y97.398 E.46734
G1 X122.458 Y97.398 E.50236
G1 X122.79 Y97.79 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5054
G1 X122.79 Y111.496 E.42114
G3 X119.212 Y111.589 I-1.79 J-.001 E.16988
G1 X119.21 Y93.21 E.56473
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y111.496 E.56187
G3 X137.21 Y111.496 I-1.79 J-.001 E.17274
G1 X137.21 Y97.79 E.42114
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.841 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I1.165 J-.353 P1  F30000
G1 X121.56 Y95.559 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.5339
G1 F5054
G1 X121.771 Y95.54 E.0085
; LINE_WIDTH: 0.494284
G1 X121.983 Y95.52 E.00781
; LINE_WIDTH: 0.415584
G1 X122.194 Y95.5 E.00645
G1 X137.806 Y95.5 E.47407
; LINE_WIDTH: 0.415052
G1 X137.997 Y95.518 E.00584
; LINE_WIDTH: 0.454704
G1 X138.189 Y95.536 E.00646
; LINE_WIDTH: 0.494355
G1 X138.381 Y95.554 E.00708
; WIPE_START
G1 F24000
G1 X138.189 Y95.536 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I-.836 J-.884 P1  F30000
G1 X121.141 Y111.652 Z17.8
G1 Z17.4
G1 E.8 F1800
; LINE_WIDTH: 0.481908
G1 F5054
G1 X121.221 Y111.395 E.0096
G1 X121.22 Y97.194 E.508
; LINE_WIDTH: 0.482872
G1 X121.335 Y96.906 E.01114
; LINE_WIDTH: 0.420554
G1 X121.449 Y96.617 E.00956
G1 X121.853 Y96.316 E.0155
G1 X122.194 Y96.252 E.01068
G1 X137.806 Y96.252 E.48039
G1 X138.147 Y96.316 E.01068
G1 X138.551 Y96.617 E.0155
; LINE_WIDTH: 0.419999
G1 X138.665 Y96.906 E.00955
; LINE_WIDTH: 0.482782
G1 X138.78 Y97.194 E.01114
G1 X138.78 Y111.379 E.50844
G1 X138.833 Y111.603 E.00825
G2 X139.162 Y111.611 I.167 J-.102 E.01401
G1 X139.22 Y111.379 E.00856
G1 X139.22 Y97.194 E.50844
; LINE_WIDTH: 0.483144
G1 X139.236 Y96.786 E.01467
; LINE_WIDTH: 0.420582
G2 X139.252 Y94.748 I-52.742 J-1.427 E.0627
G1 X120.749 Y94.748 E.56943
G1 X120.749 Y96.377 E.05012
; LINE_WIDTH: 0.419999
G1 X120.765 Y96.786 E.01257
; LINE_WIDTH: 0.481949
G1 X120.78 Y97.194 E.01463
G1 X120.782 Y111.377 E.5074
G1 X120.848 Y111.652 E.01011
G1 X121.015 Y111.699 E.00619
G1 X121.085 Y111.673 E.00268
G1 X121.292 Y112.045 F30000
; LINE_WIDTH: 0.419999
G1 F5054
G1 X121.45 Y111.927 E.00604
G1 X121.582 Y111.707 E.0079
G1 X121.629 Y111.377 E.01024
G1 X121.629 Y97.194 E.4358
G1 X121.747 Y96.848 E.01126
G1 X121.99 Y96.667 E.00929
G1 X122.194 Y96.629 E.0064
G1 X137.806 Y96.629 E.47969
G1 X138.01 Y96.667 E.0064
G1 X138.253 Y96.848 E.00929
G1 X138.371 Y97.194 E.01125
G1 X138.371 Y111.44 E.43774
G1 X138.402 Y111.661 E.00684
G1 X138.53 Y111.902 E.00839
G1 X138.789 Y112.072 E.00951
G1 X139.035 Y112.123 E.00773
G1 X139.354 Y112.011 E.01038
G1 X139.525 Y111.799 E.00837
G2 X139.629 Y111.379 I-.895 J-.443 E.01338
G1 X139.629 Y94.371 E.52261
G1 X120.371 Y94.371 E.59172
G1 X120.374 Y111.484 E.52584
G1 X120.492 Y111.855 E.01195
G1 X120.678 Y112.024 E.00772
G1 X120.967 Y112.117 E.00933
G1 X121.233 Y112.058 E.00839
; WIPE_START
G1 F24000
G1 X120.967 Y112.117 E-.10373
G1 X120.678 Y112.024 E-.11543
G1 X120.492 Y111.855 E-.09552
G1 X120.374 Y111.484 E-.14784
G1 X120.374 Y110.702 E-.29747
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I-.111 J1.212 P1  F30000
G1 X138.486 Y112.36 Z17.8
G1 Z17.4
G1 E.8 F1800
G1 F5054
G1 X138.806 Y112.483 E.01053
G1 X139.246 Y112.473 E.01351
G1 X139.644 Y112.258 E.0139
G2 X139.945 Y111.831 I-1.518 J-1.389 E.01611
G1 X140.006 Y111.379 E.014
G1 X140.006 Y93.994 E.5342
G1 X119.994 Y93.994 E.6149
G1 X119.997 Y111.531 E.53886
G1 X120.099 Y111.94 E.01294
G1 X120.362 Y112.274 E.01308
G1 X120.614 Y112.425 E.00904
G1 X120.954 Y112.501 E.01068
G1 X121.338 Y112.443 E.01194
G1 X121.638 Y112.263 E.01076
G2 X121.942 Y111.84 I-1.175 J-1.165 E.01608
G1 X122.006 Y111.377 E.01435
G1 X122.006 Y97.194 E.4358
G1 X122.045 Y97.079 E.00375
G1 X122.194 Y97.006 E.0051
G1 X137.806 Y97.006 E.47969
G1 X137.955 Y97.079 E.0051
G1 X137.994 Y97.194 E.00375
G1 X137.994 Y111.466 E.43854
G1 X138.038 Y111.779 E.0097
G1 X138.231 Y112.142 E.01264
G1 X138.441 Y112.321 E.00848
G1 X138.875 Y96.462 F30000
G1 F5054
G1 X138.875 Y95.125 E.04106
G1 X121.126 Y95.125 E.54537
G1 X121.126 Y96.46 E.04102
G1 X121.151 Y96.386 E.00243
G1 X121.717 Y95.964 E.02167
G1 X122.194 Y95.875 E.01493
G1 X137.806 Y95.875 E.47969
G1 X138.283 Y95.964 E.01494
G1 X138.855 Y96.405 E.02218
; WIPE_START
G1 F24000
G1 X138.283 Y95.964 E-.27432
G1 X137.806 Y95.875 E-.18471
G1 X137.014 Y95.875 E-.30098
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I-1.015 J-.672 P1  F30000
G1 X131.898 Y103.603 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F5054
G1 X131.898 Y105.898 E.07614
G1 X128.102 Y105.898 E.12591
G1 X128.103 Y103.602 E.07616
G1 X131.838 Y103.603 E.12391
G1 X132.11 Y103.234 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5054
G3 X132.29 Y103.508 I-.116 J.272 E.01067
G1 X132.29 Y106.29 E.08549
G1 X127.71 Y106.29 E.14073
G1 X127.711 Y103.491 E.08601
G3 X128.008 Y103.21 I.298 J.018 E.01384
G1 X132.011 Y103.211 E.12302
G3 X132.053 Y103.216 I-.017 J.295 E.00128
M204 S10000
; WIPE_START
G1 F24000
G1 X132.192 Y103.284 E-.05904
G1 X132.271 Y103.4 E-.05341
G1 X132.29 Y103.508 E-.0415
G1 X132.29 Y105.103 E-.60605
; WIPE_END
G1 E-.04 F1800
G17
G3 Z17.8 I.14 J-1.209 P1  F30000
G1 X129.25 Y104.75 Z17.8
G1 Z17.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423182
G1 F5054
G1 X130.69 Y104.75 E.04462
G1 X130.75 Y105.129 F30000
; LINE_WIDTH: 0.419999
G1 F5054
G1 X131.129 Y105.129 E.01163
G1 X131.129 Y104.372 E.02326
G1 X128.872 Y104.371 E.06935
G1 X128.872 Y105.129 E.02327
G1 X130.69 Y105.129 E.05588
G1 X130.75 Y105.506 F30000
G1 F5054
G1 X131.506 Y105.506 E.02322
G1 X131.506 Y103.995 E.04643
G1 X128.495 Y103.994 E.09253
G1 X128.494 Y105.506 E.04645
G1 X130.69 Y105.506 E.06747
; CHANGE_LAYER
; Z_HEIGHT: 17.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X128.69 Y105.506 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 88/88
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
G3 Z17.8 I.967 J-.739 P1  F30000
G1 X122.79 Y97.79 Z17.8
G1 Z17.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6018
G1 X122.79 Y111.496 E.42114
G3 X119.212 Y111.589 I-1.79 J.002 E.17004
G1 X119.21 Y93.21 E.56473
G1 X140.79 Y93.21 E.66309
G1 X140.79 Y111.496 E.56187
G3 X137.21 Y111.496 I-1.79 J-.001 E.17274
G1 X137.21 Y97.79 E.42114
G1 X122.85 Y97.79 E.44124
M204 S10000
; WIPE_START
G1 F24000
G1 X122.841 Y99.79 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I-.686 J1.005 P1  F30000
G1 X140.537 Y111.864 Z18
G1 Z17.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F6018
G1 X139.371 Y113.03 E.05065
G1 X138.805 Y113.062
G1 X140.583 Y111.285 E.07724
G1 X140.583 Y110.751
G1 X138.38 Y112.954 E.09571
G1 X138.047 Y112.754
G1 X140.583 Y110.218 E.11019
G1 X140.583 Y109.685
G1 X137.777 Y112.491 E.12193
G1 X137.57 Y112.164
G1 X140.583 Y109.152 E.13091
G1 X140.583 Y108.618
G1 X137.443 Y111.758 E.13642
G1 X137.417 Y111.25
G1 X140.583 Y108.085 E.13754
G1 X140.583 Y107.552
G1 X137.417 Y110.717 E.13754
G1 X137.417 Y110.184
G1 X140.583 Y107.019 E.13754
G1 X140.583 Y106.485
G1 X137.417 Y109.651 E.13754
G1 X137.417 Y109.117
G1 X140.583 Y105.952 E.13754
G1 X140.583 Y105.419
G1 X137.417 Y108.584 E.13754
G1 X137.417 Y108.051
G1 X140.583 Y104.885 E.13754
G1 X140.583 Y104.352
G1 X137.417 Y107.517 E.13754
G1 X137.417 Y106.984
G1 X140.583 Y103.819 E.13754
G1 X140.583 Y103.286
G1 X137.417 Y106.451 E.13754
G1 X137.417 Y105.918
G1 X140.583 Y102.752 E.13754
G1 X140.583 Y102.219
G1 X137.417 Y105.384 E.13754
G1 X137.417 Y104.851
G1 X140.583 Y101.686 E.13754
G1 X140.583 Y101.153
G1 X137.417 Y104.318 E.13754
G1 X137.417 Y103.785
G1 X140.583 Y100.619 E.13754
G1 X140.583 Y100.086
G1 X137.417 Y103.251 E.13754
G1 X137.417 Y102.718
G1 X140.583 Y99.553 E.13754
G1 X140.583 Y99.02
M73 P98 R0
G1 X137.417 Y102.185 E.13754
G1 X137.417 Y101.651
G1 X140.583 Y98.486 E.13754
G1 X140.583 Y97.953
G1 X137.417 Y101.118 E.13754
G1 X137.417 Y100.585
G1 X140.583 Y97.42 E.13754
G1 X140.583 Y96.886
G1 X137.417 Y100.052 E.13754
G1 X137.417 Y99.518
G1 X140.583 Y96.353 E.13754
G1 X140.583 Y95.82
G1 X137.417 Y98.985 E.13754
G1 X137.417 Y98.452
G1 X140.583 Y95.287 E.13754
G1 X140.583 Y94.753
G1 X137.417 Y97.919 E.13754
G1 X137.22 Y97.583
G1 X140.583 Y94.22 E.14612
G1 X140.583 Y93.687
G1 X136.687 Y97.583 E.16929
G1 X136.154 Y97.583
G1 X140.319 Y93.417 E.181
G1 X139.785 Y93.417
G1 X135.62 Y97.583 E.181
G1 X135.087 Y97.583
G1 X139.252 Y93.417 E.181
G1 X138.719 Y93.417
G1 X134.554 Y97.583 E.181
G1 X134.02 Y97.583
G1 X138.186 Y93.417 E.181
G1 X137.652 Y93.417
G1 X133.487 Y97.583 E.181
G1 X132.954 Y97.583
G1 X137.119 Y93.417 E.181
G1 X136.586 Y93.417
G1 X132.421 Y97.583 E.181
G1 X131.887 Y97.583
G1 X136.053 Y93.417 E.181
G1 X135.519 Y93.417
G1 X131.354 Y97.583 E.181
G1 X130.821 Y97.583
G1 X134.986 Y93.417 E.181
G1 X134.453 Y93.417
G1 X130.288 Y97.583 E.181
G1 X129.754 Y97.583
G1 X133.92 Y93.417 E.181
G1 X133.386 Y93.417
G1 X129.221 Y97.583 E.181
G1 X128.688 Y97.583
G1 X132.853 Y93.417 E.181
G1 X132.32 Y93.417
G1 X128.154 Y97.583 E.181
G1 X127.621 Y97.583
G1 X131.786 Y93.417 E.181
G1 X131.253 Y93.417
G1 X127.088 Y97.583 E.181
G1 X126.555 Y97.583
G1 X130.72 Y93.417 E.181
G1 X130.187 Y93.417
G1 X126.021 Y97.583 E.181
G1 X125.488 Y97.583
G1 X129.653 Y93.417 E.181
G1 X129.12 Y93.417
G1 X124.955 Y97.583 E.181
G1 X124.422 Y97.583
G1 X128.587 Y93.417 E.181
G1 X128.054 Y93.417
G1 X123.888 Y97.583 E.181
G1 X123.355 Y97.583
G1 X127.52 Y93.417 E.181
G1 X126.987 Y93.417
G1 X122.822 Y97.583 E.181
M204 S10000
; WIPE_START
G1 F24000
G1 X124.236 Y96.168 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I-1.21 J-.13 P1  F30000
G1 X122.561 Y111.709 Z18
G1 Z17.6
G1 E.8 F1800
M204 S2000
G1 F6018
G1 X121.202 Y113.068 E.05906
G1 X120.689 Y113.047
G1 X122.583 Y111.154 E.08229
G1 X122.583 Y110.62
G1 X120.292 Y112.91 E.09952
G1 X119.97 Y112.7
G1 X122.583 Y110.087 E.11353
G1 X122.583 Y109.554
G1 X119.716 Y112.42 E.12456
G1 X119.532 Y112.071
G1 X122.583 Y109.02 E.13254
G1 X122.583 Y108.487
G1 X119.43 Y111.64 E.13701
G1 X119.42 Y111.117
G1 X122.583 Y107.954 E.13744
G1 X122.583 Y107.421
G1 X119.42 Y110.584 E.13745
G1 X119.42 Y110.05
G1 X122.583 Y106.887 E.13745
G1 X122.583 Y106.354
G1 X119.42 Y109.517 E.13745
G1 X119.419 Y108.984
G1 X122.583 Y105.821 E.13745
G1 X122.583 Y105.288
G1 X119.419 Y108.451 E.13746
G1 X119.419 Y107.918
G1 X122.583 Y104.754 E.13746
G1 X122.583 Y104.221
G1 X119.419 Y107.384 E.13746
G1 X119.419 Y106.851
G1 X122.583 Y103.688 E.13747
G1 X122.583 Y103.154
G1 X119.419 Y106.318 E.13747
G1 X119.419 Y105.785
G1 X122.583 Y102.621 E.13747
G1 X122.583 Y102.088
G1 X119.419 Y105.252 E.13748
G1 X119.419 Y104.718
G1 X122.583 Y101.555 E.13748
G1 X122.583 Y101.021
G1 X119.419 Y104.185 E.13748
G1 X119.419 Y103.652
G1 X122.583 Y100.488 E.13748
G1 X122.583 Y99.955
G1 X119.419 Y103.119 E.13749
G1 X119.419 Y102.586
G1 X122.583 Y99.422 E.13749
G1 X122.583 Y98.888
G1 X119.419 Y102.052 E.13749
G1 X119.418 Y101.519
G1 X122.583 Y98.355 E.1375
G1 X122.583 Y97.822
G1 X119.418 Y100.986 E.1375
G1 X119.418 Y100.453
G1 X126.454 Y93.417 E.30572
G1 X125.92 Y93.417
G1 X119.418 Y99.92 E.28255
G1 X119.418 Y99.386
G1 X125.387 Y93.417 E.25938
G1 X124.854 Y93.417
G1 X119.418 Y98.853 E.23621
G1 X119.418 Y98.32
G1 X124.321 Y93.417 E.21304
G1 X123.787 Y93.417
G1 X119.418 Y97.787 E.18987
G1 X119.418 Y97.254
G1 X123.254 Y93.417 E.1667
G1 X122.721 Y93.417
G1 X119.418 Y96.72 E.14353
G1 X119.418 Y96.187
G1 X122.188 Y93.417 E.12036
G1 X121.654 Y93.417
G1 X119.418 Y95.654 E.09719
G1 X119.418 Y95.121
G1 X121.121 Y93.417 E.07402
G1 X120.588 Y93.417
G1 X119.418 Y94.588 E.05085
G1 X119.418 Y94.054
G1 X120.054 Y93.417 E.02768
M204 S10000
; WIPE_START
G1 F24000
G1 X119.418 Y94.054 E-.3423
G1 X119.418 Y94.588 E-.20262
G1 X119.818 Y94.187 E-.21509
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I-.81 J.908 P1  F30000
G1 X140.269 Y112.428 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.101167
G1 F6018
G3 X139.919 Y112.778 I-2.044 J-1.699 E.00235
; WIPE_START
G1 F24000
G1 X140.158 Y112.557 E-.49982
G1 X140.269 Y112.428 E-.26018
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I.789 J-.926 P1  F30000
G1 X122.708 Y97.468 Z18
G1 Z17.6
G1 E.8 F1800
; LINE_WIDTH: 0.0969004
G1 F6018
G1 X122.468 Y97.708 E.00149
; WIPE_START
G1 F24000
G1 X122.708 Y97.468 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I-1.217 J-.02 P1  F30000
G1 X122.461 Y112.116 Z18
G1 Z17.6
G1 E.8 F1800
; LINE_WIDTH: 0.138534
G1 F6018
G1 X122.277 Y112.353 E.00234
; LINE_WIDTH: 0.190582
G3 X121.854 Y112.776 I-2.736 J-2.311 E.00721
; LINE_WIDTH: 0.175165
G1 X121.727 Y112.872 E.00171
; LINE_WIDTH: 0.143611
G1 X121.601 Y112.968 E.0013
; WIPE_START
G1 F24000
G1 X121.727 Y112.872 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I.828 J.892 P1  F30000
G1 X132.108 Y103.232 Z18
G1 Z17.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6018
G3 X132.29 Y103.508 I-.111 J.271 E.01078
G1 X132.29 Y106.29 E.08549
G1 X127.71 Y106.29 E.14073
G1 X127.711 Y103.491 E.08601
G3 X128.01 Y103.21 I.298 J.018 E.01392
G1 X132.009 Y103.211 E.12287
G3 X132.05 Y103.215 I-.012 J.292 E.00128
M204 S10000
; WIPE_START
G1 F24000
G1 X132.222 Y103.315 E-.07536
G1 X132.271 Y103.4 E-.03758
G1 X132.29 Y103.508 E-.04149
G1 X132.29 Y105.101 E-.60556
; WIPE_END
G1 E-.04 F1800
G17
G3 Z18 I-.984 J-.717 P1  F30000
G1 X132.081 Y105.388 Z18
G1 Z17.6
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
G1 F6018
G1 X131.386 Y106.083 E.0302
G1 X130.853 Y106.083
G1 X132.081 Y104.855 E.05335
G1 X132.08 Y104.322
G1 X130.32 Y106.083 E.07649
G1 X129.787 Y106.083
G1 X132.08 Y103.79 E.09964
G1 X131.918 Y103.418
G1 X129.253 Y106.083 E.11579
G1 X128.72 Y106.083
G1 X131.385 Y103.418 E.11579
G1 X130.852 Y103.418
G1 X128.187 Y106.083 E.1158
G1 X127.918 Y105.819
G1 X130.318 Y103.418 E.10433
G1 X129.785 Y103.418
G1 X127.918 Y105.285 E.08116
G1 X127.918 Y104.752
G1 X129.252 Y103.418 E.05798
G1 X128.719 Y103.417
G1 X127.918 Y104.218 E.03481
M204 S10000
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X128.719 Y103.417 E-.43045
G1 X129.252 Y103.418 E-.20261
G1 X129.016 Y103.654 E-.12694
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
G1 Z18.1 F900 ; lower z a little
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

    G1 Z117.6 F600
    G1 Z115.6

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

